; Soul Blazer (SNES) - Bank $11
; Disassembled from ROM
; File offset: $088000-$08ffff
; CPU address: $11:$8000-$11:$ffff
;===========================================================

.bank $11
.org $8000

$11:8000  00 20         brk #$20
$11:8002  80 3b         bra $803f
$11:8004  d6 03         dec $03,x
$11:8006  01 77         ora ($77,x)
$11:8008  84 0e         sty $0e
$11:800a  04 fc         tsb $fc
$11:800c  07 7b         ora [$7b]
$11:800e  3d 45 ec      and $ec45,x
$11:8011  2f 81 80 56   and $568081
$11:8015  28            plp
$11:8016  1e 6d 07      asl $076d,x
$11:8019  0a            asl a
$11:801a  81 c1         sta ($c1,x)
$11:801c  80 60         bra $807e
$11:801e  60            rts
$11:801f  1c 1a 07      trb $071a
$11:8022  02 80         cop #$80
$11:8024  ef 09 e4 02   sbc $02e409
$11:8028  fd 20 f3      sbc $f320,x
$11:802b  d0 38         bne $8065
$11:802d  78            sei
$11:802e  00 b9         brk #$b9
$11:8030  06 41         asl $41
$11:8032  de 10 81      dec $8110,x
$11:8035  80 bb         bra $7ff2
$11:8037  c2 1b         rep #$1b
$11:8039  0b            phd
$11:803a  83 4a         sta $4a,s
$11:803c  a6 b1         ldx $b1
$11:803e  18            clc
$11:803f  b4 28         ldy $28,x
$11:8041  5e 24 11      lsr $1124,x
$11:8044  86 43         stx $43
$11:8046  20 90 e8      jsr $e890
$11:8049  2c b2 5d      bit $5db2
$11:804c  30 8b         bmi $7fd9
$11:804e  c4 9d         cpy $9d
$11:8050  e1 10         sbc ($10,x)
$11:8052  28            plp
$11:8053  0b            phd
$11:8054  bc 36 1d      ldy $1d36,x
$11:8057  0b            phd
$11:8058  05 53         ora $53
$11:805a  59 88 b4      eor $b488,y
$11:805d  4c 09 e2      jmp $e209
$11:8060  61 19         adc ($19,x)
$11:8062  84 c2         sty $c2
$11:8064  41 70         eor ($70,x)
$11:8066  d0 4d         bne $80b5
$11:8068  2e 90 cf      rol $cf90
$11:806b  44 a1 de      mvp $de,$a1
$11:806e  90 d8         bcc $8048
$11:8070  04 2e         tsb $2e
$11:8072  17 9f         ora [$9f],y
$11:8074  ca            dex
$11:8075  7a            ply
$11:8076  ec d7 e8      cpx $e8d7
$11:8079  c3 bd         cmp $bd,s
$11:807b  21 f0         and ($f0,x)
$11:807d  18            clc
$11:807e  a4 02         ldy $02
$11:8080  df 05 fa d9   cmp $d9fa05,x
$11:8084  3e 25 31      rol $3125,x
$11:8087  77 05         adc [$05],y
$11:8089  82 40 1d      brl $9dcc
$11:808c  0c 06 03      tsb $0306
$11:808f  c1 00         cmp ($00,x)
$11:8091  a0 26 c1      ldy #$c126
$11:8094  de 2e d0      dec $d02e,x
$11:8097  e0 78 30      cpx #$3078
$11:809a  1c 08 02      trb $0208
$11:809d  60            rts
$11:809e  14 82         trb $82
$11:80a0  a6 03         ldx $03
$11:80a2  70 1b         bvs $80bf
$11:80a4  88            dey
$11:80a5  dc 25 14      jml [$1425]
$11:80a8  57 02         eor [$02],y
$11:80aa  fd a7 0b      sbc $0ba7,x
$11:80ad  94 77         sty $77,x
$11:80af  87 1a         sta [$1a]
$11:80b1  01 ee         ora ($ee,x)
$11:80b3  57 0d         eor [$0d],y
$11:80b5  b2 71         lda ($71)
$11:80b7  28            plp
$11:80b8  65 37         adc $37
$11:80ba  1b            tcs
$11:80bb  dd ee b6      cmp $b6ee,x
$11:80be  5b            tcd
$11:80bf  28            plp
$11:80c0  97 cb         sta [$cb],y
$11:80c2  65 f1         adc $f1
$11:80c4  ff 0f 06 80   sbc $80060f,x
$11:80c8  c0 5d 9f      cpy #$9f5d
$11:80cb  00 82         brk #$82
$11:80cd  40            rti
$11:80ce  21 d0         and ($d0,x)
$11:80d0  48            pha
$11:80d1  f4 32 7d      pea $7d32
$11:80d4  1c ce 67      trb $67ce
$11:80d7  2b            pld
$11:80d8  93 dd         sta ($dd,s),y
$11:80da  a7 f5         lda [$f5]
$11:80dc  e0 10 c8      cpx #$c810
$11:80df  04 6a         tsb $6a
$11:80e1  01 32         ora ($32,x)
$11:80e3  80 58         bra $813d
$11:80e5  84 c3         sty $c3
$11:80e7  c2 80         rep #$80
$11:80e9  40            rti
$11:80ea  9e d3 03      stz $03d3,x
$11:80ed  81 0e         sta ($0e,x)
$11:80ef  82 03 07      brl $87f5
$11:80f2  7a            ply
$11:80f3  b9 18 de      lda $de18,y
$11:80f6  01 60         ora ($60,x)
$11:80f8  a0 78 34      ldy #$3478
$11:80fb  1f 0b 81 4c   ora $4c810b,x
$11:80ff  3f 05 71 be   and $be7105,x
$11:8103  7f 0b 80 91   adc $91800b,x
$11:8107  0a            asl a
$11:8108  84 03         sty $03
$11:810a  10 62         bpl $816e
$11:810c  10 88         bpl $8096
$11:810e  04 40         tsb $40
$11:8110  5a            phy
$11:8111  02 d6         cop #$d6
$11:8113  78            sei
$11:8114  24 e3         bit $e3
$11:8116  fc 7a 00      jsr ($007a,x)
$11:8119  07 bc         ora [$bc]
$11:811b  26 d8         rol $d8
$11:811d  d3 07         cmp ($07,s),y
$11:811f  55 b2         eor $b2,x
$11:8121  89 fa 10      bit #$10fa
$11:8124  41 68         eor ($68,x)
$11:8126  40            rti
$11:8127  e1 f3         sbc ($f3,x)
$11:8129  09 4c 36      ora #$364c
$11:812c  a5 16         lda $16
$11:812e  b7 d8         lda [$d8],y
$11:8130  27 ef         and [$ef]
$11:8132  c0 1d 04      cpy #$041d
$11:8135  36 07         rol $07,x
$11:8137  3c 98 40      bit $4098,x
$11:813a  61 b3         adc ($b3,x)
$11:813c  28            plp
$11:813d  b5 a6         lda $a6,x
$11:813f  c1 98         cmp ($98,x)
$11:8141  80 7c         bra $81bf
$11:8143  30 02         bmi $8147
$11:8145  00 b0         brk #$b0
$11:8147  76 a3         ror $a3,x
$11:8149  1b            tcs
$11:814a  08            php
$11:814b  66 73         ror $73
$11:814d  65 4c         adc $4c
$11:814f  94 74         sty $74,x
$11:8151  a0 17 2a      ldy #$2a17
$11:8154  44 03 01      mvp $01,$03
$11:8157  60            rts
$11:8158  ce 46 24      dec $2446
$11:815b  d0 ce         bne $812b
$11:815d  03 60         ora $60,s
$11:815f  72 d0         adc ($d0)
$11:8161  0b            phd
$11:8162  75 23         adc $23,x
$11:8164  6d 01 86      adc $8601
$11:8167  41 22         eor ($22,x)
$11:8169  10 f8         bpl $8163
$11:816b  0d 72 d1      ora $d172
$11:816e  19 88 f7      ora $f788,y
$11:8171  70 96         bvs $8109
$11:8173  b9 6f 6e      lda $6e6f,y
$11:8176  61 03         adc ($03,x)
$11:8178  80 c3         bra $813d
$11:817a  e0 11 e8      cpx #$e811
$11:817d  0c 7e 11      tsb $117e
$11:8180  7e 88 de      ror $de88,x
$11:8183  e0 1d 28      cpx #$281d
$11:8186  0f 3e 11 80   ora $80113e
$11:818a  98            tya
$11:818b  48            pha
$11:818c  21 1f         and ($1f,x)
$11:818e  08            php
$11:818f  04 ea         tsb $ea
$11:8191  2d 98 84      and $8498
$11:8194  6e e4 3d      ror $3de4
$11:8197  69 a7 6e      adc #$6ea7
$11:819a  99 c0 66      sta $66c0,y
$11:819d  84 03         sty $03
$11:819f  f1 80         sbc ($80),y
$11:81a1  fc 44 3f      jsr ($3f44,x)
$11:81a4  d8            cld
$11:81a5  8e f4 03      stx $03f4
$11:81a8  97 80         sta [$80],y
$11:81aa  f9 d4 25      sbc $25d4,y
$11:81ad  73 48         adc ($48,s),y
$11:81af  bd 2a 9b      lda $9b2a,x
$11:81b2  44 84 cd      mvp $cd,$84
$11:81b5  25 93         and $93
$11:81b7  aa            tax
$11:81b8  a5 4e         lda $4e
$11:81ba  1f 1c 88 4f   ora $4f881c,x
$11:81be  e0 f0 49      cpx #$49f0
$11:81c1  0c 02 47      tsb $4702
$11:81c4  00 a1         brk #$a1
$11:81c6  c0 28 30      cpy #$3028
$11:81c9  08            php
$11:81ca  42 34         wdm #$34
$11:81cc  ea            nop
$11:81cd  92 cf         sta ($cf)
$11:81cf  45 4b         eor $4b
$11:81d1  65 a2         adc $a2
$11:81d3  c8            iny
$11:81d4  6b            rtl
$11:81d5  36 95         rol $95,x
$11:81d7  c9 57 2b      cmp #$2b57
$11:81da  e1 38         sbc ($38,x)
$11:81dc  84 7f         sty $7f
$11:81de  3c 12 0c      bit $0c12,x
$11:81e1  24 03         bit $03
$11:81e3  89 80 e1      bit #$e180
$11:81e6  60            rts
$11:81e7  30 4a         bmi $8233
$11:81e9  a3 46         lda $46,s
$11:81eb  84 7e         sty $7e
$11:81ed  03 2b         ora $2b,s
$11:81ef  99 c7 23      sta $23c7,y
$11:81f2  2b            pld
$11:81f3  30 46         bmi $823b
$11:81f5  b5 fa         lda $fa,x
$11:81f7  01 04         ora ($04,x)
$11:81f9  80 2c         bra $8227
$11:81fb  81 3f         sta ($3f,x)
$11:81fd  1a            inc a
$11:81fe  08            php
$11:81ff  05 c3         ora $c3
$11:8201  81 1c         sta ($1c,x)
$11:8203  f0 57         beq $825c
$11:8205  f8            sed
$11:8206  92 fb         sta ($fb)
$11:8208  0c fe d7      tsb $d7fe
$11:820b  1d 94 43      ora $4394,x
$11:820e  a4 df         ldy $df
$11:8210  0e 04 f2      asl $f204
$11:8213  c1 1e         cmp ($1e,x)
$11:8215  82 4e e0      brl $6266
$11:8218  31 e3         and ($e3),y
$11:821a  70 42         bvs $825e
$11:821c  c0 a1 1d      cpy #$1da1
$11:821f  40            rti
$11:8220  82 11 c3      brl $4534
$11:8223  e1 c0         sbc ($c0,x)
$11:8225  e0 7c 28      cpx #$287c
$11:8228  08            php
$11:8229  46 c0         lsr $c0
$11:822b  2e 02 81      rol $8102
$11:822e  a0 c0 7c      ldy #$7cc0
$11:8231  2a            rol a
$11:8232  08            php
$11:8233  43 88         eor $88,s
$11:8235  7b            tdc
$11:8236  a7 1e         lda [$1e]
$11:8238  ea            nop
$11:8239  25 11         and $11
$11:823b  09 11 0e      ora #$0e11
$11:823e  37 fb         and [$fb],y
$11:8240  55 ee         eor $ee,x
$11:8242  b6 5b         ldx $5b,y
$11:8244  10 85         bpl $81cb
$11:8246  01 3a         ora ($3a,x)
$11:8248  89 d8 21      bit #$21d8
$11:824b  f0 88         beq $81d5
$11:824d  5c 22 0a 80   jml $800a22
$11:8251  18            clc
$11:8252  44 21 de      mvp $de,$21
$11:8255  50 70         bvc $82c7
$11:8257  11 c3         ora ($c3),y
$11:8259  c1 02         cmp ($02,x)
$11:825b  03 0d         ora $0d,s
$11:825d  45 f7         eor $f7
$11:825f  15 7f         ora $7f,x
$11:8261  c0 5f f8      cpy #$f85f
$11:8264  77 ae         adc [$ae],y
$11:8266  dd e3 ef      cmp $efe3,x
$11:8269  70 cf         bvs $823a
$11:826b  d4 35         pei ($35)
$11:826d  f6 03         inc $03,x
$11:826f  38            sec
$11:8270  31 c3         and ($c3),y
$11:8272  01 05         ora ($05,x)
$11:8274  c3 c7         cmp $c7,s
$11:8276  b1 f3         lda ($f3),y
$11:8278  8c fc c3      sty $c3fc
$11:827b  7e 2a 0b      ror $0b2a,x
$11:827e  04 06         tsb $06
$11:8280  17 05         ora [$05],y
$11:8282  81 c5         sta ($c5,x)
$11:8284  a2 43 10      ldx #$1043
$11:8287  82 c0 a0      brl $234a
$11:828a  90 38         bcc $82c4
$11:828c  1c 06 25      trb $2506
$11:828f  11 40         ora ($40),y
$11:8291  84 32         sty $32
$11:8293  01 0d         ora ($0d,x)
$11:8295  80 47         bra $82de
$11:8297  08            php
$11:8298  86 a7         stx $a7
$11:829a  08            php
$11:829b  74 03         stz $03,x
$11:829d  b9 fc ed      lda $edfc,y
$11:82a0  7f ad 3f e9   adc $e93fad,x
$11:82a4  1f ee 3f 7f   ora $7f3fee,x
$11:82a8  bf ff f3 b5   lda $b5f3ff,x
$11:82ac  cc 9f 41      cpy $419f
$11:82af  06 90         asl $90
$11:82b1  78            sei
$11:82b2  3e 3e 3f      rol $3f3e,x
$11:82b5  1f 9f cf e7   ora $e7cf9f,x
$11:82b9  93 fb         sta ($fb,s),y
$11:82bb  c3 bc         cmp $bc,s
$11:82bd  21 03         and ($03,x)
$11:82bf  80 8b         bra $824c
$11:82c1  c3 a6         cmp $a6,s
$11:82c3  16 b8         asl $b8,x
$11:82c5  6e c6 6b      ror $6bc6
$11:82c8  5e a5 5b      lsr $5ba5,x
$11:82cb  e2 0e         sep #$0e
$11:82cd  e0 81 47      cpx #$4781
$11:82d0  62 f2 89      per $0cc5
$11:82d3  84 06         sty $06
$11:82d5  1b            tcs
$11:82d6  72 9a         adc ($9a)
$11:82d8  f2 a9         sbc ($a9)
$11:82da  5b            tcd
$11:82db  18            clc
$11:82dc  87 81         sta [$81]
$11:82de  8e 11 8a      stx $8a11
$11:82e1  07 d2         ora [$d2]
$11:82e3  61 f0         adc ($f0,x)
$11:82e5  e6 57         inc $57
$11:82e7  26 5c         rol $5c
$11:82e9  a9 47 da      lda #$da47
$11:82ec  01 56         ora ($56,x)
$11:82ee  a4 32         ldy $32
$11:82f0  07 71         ora [$71]
$11:82f2  30 86         bmi $827a
$11:82f4  73 20         adc ($20,s),y
$11:82f6  13 2e         ora ($2e,s),y
$11:82f8  64 a3         stz $a3
$11:82fa  2d 00 b7      and $b700
$11:82fd  52 36         eor ($36)
$11:82ff  50 cb         bvc $82cc
$11:8301  9d 2a e7      sta $e72a,x
$11:8304  17 92         ora [$92],y
$11:8306  43 e5         eor $e5,s
$11:8308  50 47         bvc $8351
$11:830a  d8            cld
$11:830b  37 0e         and [$0e],y
$11:830d  e6 af         inc $af
$11:830f  0c 64 93      tsb $9364
$11:8312  b5 2a         lda $2a,x
$11:8314  aa            tax
$11:8315  41 23         eor ($23,x)
$11:8317  2e e1 77      rol $77e1
$11:831a  84 02         sty $02
$11:831c  61 26         adc ($26,x)
$11:831e  e3 40         sbc $40,s
$11:8320  2d fa 2a      and $2afa
$11:8323  8c c3 01      sty $01c3
$11:8326  80 d0         bra $82f8
$11:8328  60            rts
$11:8329  28            plp
$11:832a  14 0d         trb $0d
$11:832c  06 82         asl $82
$11:832e  4d d8 80      eor $80d8
$11:8331  5e f4 51      lsr $51f4,x
$11:8334  19 87 0f      ora $0f87,y
$11:8337  01 61         ora ($61,x)
$11:8339  c0 58 1b      cpy #$1b58
$11:833c  83 40         sta $40,s
$11:833e  de c1 6e      dec $6ec1,x
$11:8341  30 0d         bmi $8350
$11:8343  6c 2e 2d      jmp ($2d2e)
$11:8346  3a            dec a
$11:8347  9a            txs
$11:8348  d4 73         pei ($73)
$11:834a  d2 af         cmp ($af)
$11:834c  dc 93 ad      jml [$ad93]
$11:834f  0a            asl a
$11:8350  e5 42         sbc $42
$11:8352  71 f0         adc ($f0),y
$11:8354  c8            iny
$11:8355  a4 3a         ldy $3a
$11:8357  0b            phd
$11:8358  2c 97 4c      bit $4c97
$11:835b  2a            rol a
$11:835c  f1 2a         sbc ($2a),y
$11:835e  3c 12 c3      bit $c312,x
$11:8361  00 fe         brk #$fe
$11:8363  d8            cld
$11:8364  31 d0         and ($d0),y
$11:8366  0d af 42      ora $42af
$11:8369  d1 5c         cmp ($5c),y
$11:836b  d6 62         dec $62,x
$11:836d  af 33 4a fc   lda $fc4a33
$11:8371  92 d7         sta ($d7)
$11:8373  50 e9         bvc $835e
$11:8375  f4 3e 33      pea $333e
$11:8378  09 45 c3      ora #$c345
$11:837b  41 34         eor ($34,x)
$11:837d  ba            tsx
$11:837e  43 3d         eor $3d,s
$11:8380  52 8f         eor ($8f)
$11:8382  14 83         trb $83
$11:8384  0d 00 94      ora $9400
$11:8387  4a            lsr a
$11:8388  e0 0c a3      cpx #$a30c
$11:838b  1a            inc a
$11:838c  b1 f8         lda ($f8),y
$11:838e  26 10         rol $10
$11:8390  09 00 d6      ora #$d600
$11:8393  20 15 4e      jsr $4e15
$11:8396  a7 01         lda [$01]
$11:8398  40            rti
$11:8399  1c 0b 07      trb $070b
$11:839c  82 61 70      brl $f400
$11:839f  86 47         stx $47
$11:83a1  06 a5         asl $a5
$11:83a3  08            php
$11:83a4  80 43         bra $83e9
$11:83a6  20 0b 85      jsr $850b
$11:83a9  22 49 0c 0b   jsl $0b0c49
$11:83ad  e3 08         sbc $08,s
$11:83af  81 40         sta ($40,x)
$11:83b1  20 cb 85      jsr $85cb
$11:83b4  b8            clv
$11:83b5  40            rti
$11:83b6  0b            phd
$11:83b7  41 06         eor ($06,x)
$11:83b9  44 0c 0e      mvp $0e,$0c
$11:83bc  01 17         ora ($17,x)
$11:83be  88            dey
$11:83bf  c0 e3 30      cpy #$30e3
$11:83c2  68            pla
$11:83c3  64 0a         stz $0a
$11:83c5  08            php
$11:83c6  ca            dex
$11:83c7  04 68         tsb $68
$11:83c9  0d 0a 1c      ora $1c0a
$11:83cc  8a            txa
$11:83cd  35 1b         and $1b,x
$11:83cf  32 83         and ($83)
$11:83d1  e1 10         sbc ($10,x)
$11:83d3  bc 48 37      ldy $3748,x
$11:83d6  18            clc
$11:83d7  8b            phb
$11:83d8  66 82         ror $82
$11:83da  f1 a8         sbc ($a8),y
$11:83dc  bf 6a 26 d8   lda $d8266a,x
$11:83e0  8a            txa
$11:83e1  1d 13 c1      ora $c113,x
$11:83e4  00 fc         brk #$fc
$11:83e6  08            php
$11:83e7  c2 01         rep #$01
$11:83e9  7c 92 5d      jmp ($5d92,x)
$11:83ec  24 17         bit $17
$11:83ee  69 15 da      adc #$da15
$11:83f1  01 3b         ora ($3b,x)
$11:83f3  1a            inc a
$11:83f4  4b            phk
$11:83f5  63 c6         adc $c6,s
$11:83f7  a7 0a         lda [$0a]
$11:83f9  85 41         sta $41
$11:83fb  a1 d0         lda ($d0,x)
$11:83fd  38            sec
$11:83fe  3a            dec a
$11:83ff  30 46         bmi $8447
$11:8401  ab            plb
$11:8402  05 19         ora $19
$11:8404  d0 d4         bne $83da
$11:8406  71 f4         adc ($f4),y
$11:8408  08            php
$11:8409  ad 82 43      lda $4382
$11:840c  60            rts
$11:840d  d0 78         bne $8487
$11:840f  29 1a 88      and #$881a
$11:8412  d4 ea         pei ($ea)
$11:8414  0f 1f 80 43   ora $43801f
$11:8418  f7 f6         sbc [$f6],y
$11:841a  0c f8 80      tsb $80f8
$11:841d  28            plp
$11:841e  01 c0         ora ($c0,x)
$11:8420  8b            phb
$11:8421  bf 85 ca 51   lda $51ca85,x
$11:8425  28            plp
$11:8426  8c 26 31      sty $3126
$11:8429  04 86         tsb $86
$11:842b  3c e1 3e      bit $3ee1,x
$11:842e  0f 49 72 8c   ora $8c7249
$11:8432  9f e1 0f f0   sta $f00fe1,x
$11:8436  04 43         tsb $43
$11:8438  43 e0         eor $e0,s
$11:843a  90 78         bcc $84b4
$11:843c  2a            rol a
$11:843d  13 08         ora ($08,s),y
$11:843f  54 68 36      mvn $36,$68
$11:8442  10 fb         bpl $843f
$11:8444  84 7e         sty $7e
$11:8446  41 9f         eor ($9f,x)
$11:8448  90 07         bcc $8451
$11:844a  00 38         brk #$38
$11:844c  22 83 86 5c   jsl $5c8683
$11:8450  e2 92         sep #$92
$11:8452  5a            phy
$11:8453  dd a2 0f      cmp $0fa2,x
$11:8456  20 a7 4a      jsr $4aa7
$11:8459  2c 9f ae      bit $ae9f
$11:845c  d7 d6         cmp [$d6],y
$11:845e  9f 40 b9 c3   sta $c3b940,x
$11:8462  24 b5         bit $b5
$11:8464  ab            plb
$11:8465  46 5a         lsr $5a
$11:8467  41 dc         eor ($dc,x)
$11:8469  94 64         sty $64,x
$11:846b  7f 50 3f bc   adc $bc3f50,x
$11:846f  0e 81 b0      asl $b081
$11:8472  94 49         sty $49,x
$11:8474  b5 70         lda $70,x
$11:8476  6b            rtl
$11:8477  ce 12 bd      dec $bd12
$11:847a  20 d2 67      jsr $67d2
$11:847d  e9 15 d2      sbc #$d215
$11:8480  d8            cld
$11:8481  73 2a         adc ($2a,s),y
$11:8483  92 6e         sta ($6e)
$11:8485  c2 48         rep #$48
$11:8487  60            rts
$11:8488  72 0e         adc ($0e)
$11:848a  08            php
$11:848b  84 2b         sty $2b
$11:848d  ba            tsx
$11:848e  28            plp
$11:848f  d7 96         cmp [$96],y
$11:8491  a9 23 9f      lda #$9f23
$11:8494  d0 2f         bne $84c5
$11:8496  f8            sed
$11:8497  05 8a         ora $8a
$11:8499  59 37 75      eor $7537,y
$11:849c  af ac bf 41   lda $41bfac
$11:84a0  40            rti
$11:84a1  80 60         bra $8503
$11:84a3  18            clc
$11:84a4  0b            phd
$11:84a5  bb            tyx
$11:84a6  45 0e         eor $0e
$11:84a8  82 a1 fc      brl $814c
$11:84ab  81 7f         sta ($7f,x)
$11:84ad  a0 2d         ldy #$2d
$11:84af  12 fc         ora ($fc)
$11:84b1  41 fc         eor ($fc,x)
$11:84b3  91 df         sta ($df),y
$11:84b5  54 7b d1      mvn $d1,$7b
$11:84b8  10 81         bpl $843b
$11:84ba  00 05         brk #$05
$11:84bc  c2 44         rep #$44
$11:84be  10 8e         bpl $844e
$11:84c0  c0 a3         cpy #$a3
$11:84c2  d0 18         bne $84dc
$11:84c4  84 1f         sty $1f
$11:84c6  7b            tdc
$11:84c7  04 ac         tsb $ac
$11:84c9  41 a1         eor ($a1,x)
$11:84cb  10 78         bpl $8545
$11:84cd  74 0e         stz $0e,x
$11:84cf  0c 40 12      tsb $1240
$11:84d2  09 50 c6      ora #$c650
$11:84d5  e1 02         sbc ($02,x)
$11:84d7  81 c0         sta ($c0,x)
$11:84d9  e0 20         cpx #$20
$11:84db  50 22         bvc $84ff
$11:84dd  2e f7 41      rol $41f7
$11:84e0  1a            inc a
$11:84e1  b0 44         bcs $8527
$11:84e3  3c 17 0e      bit $0e17,x
$11:84e6  05 82         ora $82
$11:84e8  01 e0         ora ($e0,x)
$11:84ea  0c 0f 02      tsb $020f
$11:84ed  01 c2         ora ($c2,x)
$11:84ef  c0 70         cpy #$70
$11:84f1  28            plp
$11:84f2  1c 0e 06      trb $060e
$11:84f5  00 4a         brk #$4a
$11:84f7  04 45         tsb $45
$11:84f9  8d 45 a4      sta $a445
$11:84fc  11 28         ora ($28),y
$11:84fe  0c 12 07      tsb $0712
$11:8501  08            php
$11:8502  87 c3         sta [$c3]
$11:8504  4d 61 05      eor $0561
$11:8507  80 c3         bra $84cc
$11:8509  60            rts
$11:850a  90 98         bcc $84a4
$11:850c  e4 86         cpx $86
$11:850e  60            rts
$11:850f  fd 07 38      sbc $3807,x
$11:8512  41 a0         eor ($a0,x)
$11:8514  a6 90         ldx $90
$11:8516  87 40         sta [$40]
$11:8518  61 70         adc ($70,x)
$11:851a  0a            asl a
$11:851b  c5 a3         cmp $a3
$11:851d  09 48 c0      ora #$c048
$11:8520  68            pla
$11:8521  38            sec
$11:8522  11 0f         ora ($0f),y
$11:8524  84 c3         sty $c3
$11:8526  41 00         eor ($00,x)
$11:8528  2c 86 c2      bit $c286
$11:852b  41 90         eor ($90,x)
$11:852d  9c 61 21      stz $2161
$11:8530  82 40 0c      brl $9173
$11:8533  8e 83 e1      stx $e183
$11:8536  00 f8         brk #$f8
$11:8538  60            rts
$11:8539  3a            dec a
$11:853a  00 85         brk #$85
$11:853c  04 24         tsb $24
$11:853e  36 01         rol $01,x
$11:8540  0b            phd
$11:8541  26 81         rol $81
$11:8543  ba            tsx
$11:8544  61 f0         adc ($f0,x)
$11:8546  18            clc
$11:8547  a1 b9         lda ($b9,x)
$11:8549  e4 10         cpx $10
$11:854b  0b            phd
$11:854c  04 80         tsb $80
$11:854e  42 02         wdm #$02
$11:8550  67 4b         adc [$4b]
$11:8552  02 68         cop #$68
$11:8554  3c 18 00      bit $0018,x
$11:8557  e8            inx
$11:8558  60            rts
$11:8559  22 71 28 4c   jsl $4c2871
$11:855d  4a            lsr a
$11:855e  19 02 86      ora $8602,y
$11:8561  c0 e3         cpy #$e3
$11:8563  10 08         bpl $856d
$11:8565  82 e0 4f      brl $d548
$11:8568  24 bf         bit $bf
$11:856a  28            plp
$11:856b  e3 10         sbc $10,s
$11:856d  56 e4         lsr $e4,x
$11:856f  08            php
$11:8570  24 f0         bit $f0
$11:8572  27 82         and [$82]
$11:8574  80 5a         bra $85d0
$11:8576  0c 02 e4      tsb $e402
$11:8579  22 d1 28 2c   jsl $2c28d1
$11:857d  11 9e         ora ($9e),y
$11:857f  41 d0         eor ($d0,x)
$11:8581  f0 40         beq $85c3
$11:8583  2e 10 09      rol $0910
$11:8586  c4 02         cpy $02
$11:8588  18            clc
$11:8589  00 00         brk #$00
$11:858b  40            rti
$11:858c  81 c0         sta ($c0,x)
$11:858e  0a            asl a
$11:858f  10 38         bpl $85c9
$11:8591  0c 16 0b      tsb $0b16
$11:8594  03 7a         ora $7a,s
$11:8596  83 e8         sta $e8,s
$11:8598  5d e5 02      eor $02e5,x
$11:859b  01 1b         ora ($1b,x)
$11:859d  78            sei
$11:859e  01 24         ora ($24,x)
$11:85a0  e1 15         sbc ($15,x)
$11:85a2  58            cli
$11:85a3  70 3c         bvs $85e1
$11:85a5  1e 0f 87      asl $870f,x
$11:85a8  c3 f0         cmp $f0,s
$11:85aa  19 1f e7      ora $e71f,y
$11:85ad  f1 a6         sbc ($a6),y
$11:85af  49 70 6c      eor #$6c70
$11:85b2  84 20         sty $20
$11:85b4  10 60         bpl $8616
$11:85b6  30 44         bmi $85fc
$11:85b8  84 16         sty $16
$11:85ba  03 06         ora $06,s
$11:85bc  83 41         sta $41,s
$11:85be  e0 f0         cpx #$f0
$11:85c0  f1 ba         sbc ($ba),y
$11:85c2  a2 42         ldx #$42
$11:85c4  0d 00 84      ora $8400
$11:85c7  89 85 72      bit #$7285
$11:85ca  4b            phk
$11:85cb  94 66         sty $66,x
$11:85cd  98            tya
$11:85ce  49 43 a0      eor #$a043
$11:85d1  cd 41 0b      cmp $0b41
$11:85d4  22 42 7f 05   jsl $057f42
$11:85d8  f4 4c ba      pea $ba4c
$11:85db  57 ad         eor [$ad],y
$11:85dd  ec 83 bb      cpx $bb83
$11:85e0  2e bb 40      rol $40bb
$11:85e3  67 d0         adc [$d0]
$11:85e5  21 f0         and ($f0,x)
$11:85e7  41 78         eor ($78,x)
$11:85e9  13 28         ora ($28,s),y
$11:85eb  2d ea 0b      and $0bea
$11:85ee  20 a1 4b      jsr $4ba1
$11:85f1  9e 01 08      stz $0801,x
$11:85f4  81 3c         sta ($3c,x)
$11:85f6  42 01         wdm #$01
$11:85f8  de 98 db      dec $db98,x
$11:85fb  37 75         and [$75],y
$11:85fd  6c 96 83      jmp ($8396)
$11:8600  89 7a b2      bit #$b27a
$11:8603  6f 21 1f 87   adc $871f21
$11:8607  20 cc 60      jsr $60cc
$11:860a  1b            tcs
$11:860b  b8            clv
$11:860c  06 4a         asl $4a
$11:860e  51 c4         eor ($c4),y
$11:8610  8d 59 30      sta $3059
$11:8613  10 86         bpl $859b
$11:8615  a8            tay
$11:8616  13 86         ora ($86,s),y
$11:8618  3f 85 b0 6d   and $6db085,x
$11:861c  36 b2         rol $b2,x
$11:861e  4c dc 03      jmp $03dc
$11:8621  b7 2e         lda [$2e],y
$11:8623  bd 42 67      lda $6742,x
$11:8626  b0 31         bcs $8659
$11:8628  f0 2c         beq $8656
$11:862a  06 17         asl $17
$11:862c  24 a5         bit $a5
$11:862e  40            rti
$11:862f  2c 88 70      bit $7088
$11:8632  84 c1         sty $c1
$11:8634  1d a5 de      ora $dea5,x
$11:8637  9d 5a 37      sta $375a,x
$11:863a  74 3c         stz $3c,x
$11:863c  5e cb a1      lsr $a1cb,x
$11:863f  ba            tsx
$11:8640  92 57         sta ($57)
$11:8642  31 17         and ($17),y
$11:8644  84 e0         sty $e0
$11:8646  ce a0 3b      dec $3ba0
$11:8649  b8            clv
$11:864a  26 2e         rol $2e
$11:864c  69 d0 86      adc #$86d0
$11:864f  c9 28 18      cmp #$1828
$11:8652  81 18         sta ($18,x)
$11:8654  03 c0         ora $c0,s
$11:8656  9c 28 c0      stz $c028
$11:8659  81 c1         sta ($c1,x)
$11:865b  85 a1         sta $a1
$11:865d  0f 85 8c 42   ora $428c85
$11:8661  19 0a 85      ora $850a,y
$11:8664  41 9e         eor ($9e,x)
$11:8666  22 f0 18 39   jsl $3918f0
$11:866a  00 20         brk #$20
$11:866c  50 e1         bvc $864f
$11:866e  80 41         bra $86b1
$11:8670  21 26         and ($26,x)
$11:8672  b1 2a         lda ($2a),y
$11:8674  8d 80 ca      sta $ca80
$11:8677  1f 0d 86 83   ora $83860d,x
$11:867b  01 30         ora ($30,x)
$11:867d  a8            tay
$11:867e  74 2c         stz $2c,x
$11:8680  06 30         asl $30
$11:8682  e0 15         cpx #$15
$11:8684  41 38         eor ($38,x)
$11:8686  36 09         rol $09,x
$11:8688  05 c2         ora $c2
$11:868a  01 a0         ora ($a0,x)
$11:868c  90 64         bcc $86f2
$11:868e  22 11 18 ac   jsl $ac1811
$11:8692  1e 09 23      asl $2309,x
$11:8695  94 d4         sty $d4,x
$11:8697  eb            xba
$11:8698  10 78         bpl $8712
$11:869a  6c ae 51      jmp ($51ae)
$11:869d  57 aa         eor [$aa],y
$11:869f  c7 e2         cmp [$e2]
$11:86a1  10 a8         bpl $864b
$11:86a3  0c 6e 01      tsb $016e
$11:86a6  16 80         asl $80,x
$11:86a8  c9 e0 16      cmp #$16e0
$11:86ab  28            plp
$11:86ac  0d 1e 01      ora $011e
$11:86af  0e 82 af      asl $af82
$11:86b2  43 11         eor $11,s
$11:86b4  28            plp
$11:86b5  f0 48         beq $86ff
$11:86b7  38            sec
$11:86b8  91 4e         sta ($4e),y
$11:86ba  54 6b c1      mvn $c1,$6b
$11:86bd  30 ea         bmi $86a9
$11:86bf  45 3d         eor $3d
$11:86c1  52 af         eor ($af)
$11:86c3  c4 23         cpy $23
$11:86c5  a1 80         lda ($80,x)
$11:86c7  ec 40 3d      cpx $3d40
$11:86ca  18            clc
$11:86cb  0f 24 03 8d   ora $8d0324
$11:86cf  80 f1         bra $86c2
$11:86d1  05 83         ora $83
$11:86d3  41 f0         eor ($f0,x)
$11:86d5  80 67         bra $873e
$11:86d7  f2 9e         sbc ($9e)
$11:86d9  bb            tyx
$11:86da  35 fa         and $fa,x
$11:86dc  31 1f         and ($1f),y
$11:86de  80 c0         bra $86a0
$11:86e0  e1 60         sbc ($60,x)
$11:86e2  c0 81         cpy #$81
$11:86e4  44 e2 f0      mvp $f0,$e2
$11:86e7  0b            phd
$11:86e8  7c 17 eb      jmp ($eb17,x)
$11:86eb  64 f8         stz $f8
$11:86ed  c4 2f         cpy $2f
$11:86ef  d0 08         bne $86f9
$11:86f1  64 22         stz $22
$11:86f3  1d 08 8e      ora $8e08,x
$11:86f6  44 23 0d      mvp $0d,$23
$11:86f9  c1 a0         cmp ($a0,x)
$11:86fb  24 42         bit $42
$11:86fd  01 a3         ora ($a3,x)
$11:86ff  81 de         sta ($de,x)
$11:8701  b8            clv
$11:8702  11 ef         ora ($ef),y
$11:8704  06 af         asl $af
$11:8706  03 dd         ora $dd,s
$11:8708  a4 78         ldy $78
$11:870a  3c 01 20      bit $2001,x
$11:870d  e0 40         cpx #$40
$11:870f  3f 9c 09 fd   and $fd099c,x
$11:8713  a2 3f         ldx #$3f
$11:8715  02 bf         cop #$bf
$11:8717  c0 67         cpy #$67
$11:8719  e0 e1         cpx #$e1
$11:871b  77 84         adc [$84],y
$11:871d  66 33         ror $33
$11:871f  8e c0 4b      stx $4bc0
$11:8722  a0 9f         ldy #$9f
$11:8724  fa            plx
$11:8725  c7 df         cmp [$df]
$11:8727  85 e7         sta $e7
$11:8729  7a            ply
$11:872a  83 b8         sta $b8,s
$11:872c  60            rts
$11:872d  d0 0b         bne $873a
$11:872f  fc 03 f7      jsr ($f703,x)
$11:8732  2a            rol a
$11:8733  df e6 3f fc   cmp $fc3fe6,x
$11:8737  2f fc 09 86   and $8609fc
$11:873b  10 68         bpl $87a5
$11:873d  26 3b         rol $3b
$11:873f  11 f4         ora ($f4),y
$11:8741  f8            sed
$11:8742  63 20         adc $20,s
$11:8744  1b            tcs
$11:8745  88            dey
$11:8746  47 e2         eor [$e2]
$11:8748  c1 2c         cmp ($2c,x)
$11:874a  84 0c         sty $0c
$11:874c  40            rti
$11:874d  02 03         cop #$03
$11:874f  10 04         bpl $8755
$11:8751  87 fb         sta [$fb]
$11:8753  11 fc         ora ($fc),y
$11:8755  94 7f         sty $7f,x
$11:8757  2c 06 d0      bit $d006
$11:875a  81 c0         sta ($c0,x)
$11:875c  e0 f0         cpx #$f0
$11:875e  79 04 06      adc $0604,y
$11:8761  a3 11         lda $11,s
$11:8763  a9 44 a9      lda #$a944
$11:8766  31 99         and ($99),y
$11:8768  3c 7a 27      bit $277a,x
$11:876b  0f 82 2c 06   ora $062c82
$11:876f  44 46 08      mvp $08,$46
$11:8772  05 84         ora $84
$11:8774  4c 00 81      jmp $8100
$11:8777  14 87         trb $87
$11:8779  73 f9         adc ($f9,s),y
$11:877b  d6 ff         dec $ff,x
$11:877d  72 7f         adc ($7f)
$11:877f  d6 3f         dec $3f,x
$11:8781  dc 7f ff      jml [$ff7f]
$11:8784  bc fe 66      ldy $66fe,x
$11:8787  6b            rtl
$11:8788  5b            tcd
$11:8789  bb            tyx
$11:878a  c2 f8         rep #$f8
$11:878c  dc 41 07      jml [$0741]
$11:878f  87 c7         sta [$c7]
$11:8791  e3 f3         sbc $f3,s
$11:8793  f9 e4 fa      sbc $fae4,y
$11:8796  79 7c 13      adc $137c,y
$11:8799  04 5e         tsb $5e
$11:879b  2e f0 08      rol $08f0
$11:879e  44 2f 4b      mvp $4b,$2f
$11:87a1  a5 d8         lda $d8
$11:87a3  dc f1 17      jml [$17f1]
$11:87a6  9e 35 fe      stz $fe35,x
$11:87a9  21 00         and ($00,x)
$11:87ab  57 02         eor [$02],y
$11:87ad  b8            clv
$11:87ae  1f e1 42 80   ora $8042e1,x
$11:87b2  60            rts
$11:87b3  09 05 01      ora #$0105
$11:87b6  bc 7e 35      ldy $357e,x
$11:87b9  df ec 8f fb   cmp $fb8fec,x
$11:87bd  87 fb         sta [$fb]
$11:87bf  8e 7f 66      stx $667f
$11:87c2  77 48         adc [$48],y
$11:87c4  ff 63 6f 78   sbc $786f63,x
$11:87c8  7f 90 8c a1   adc $a18c90,x
$11:87cc  d1 fc         cmp ($fc),y
$11:87ce  c4 f2         cpy $f2
$11:87d0  61 38         adc ($38,x)
$11:87d2  98            tya
$11:87d3  5e 16 01      lsr $0116,x
$11:87d6  38            sec
$11:87d7  80 55         bra $882e
$11:87d9  22 11 f8 04   jsl $04f811
$11:87dd  9a            txs
$11:87de  0c 47 07      tsb $0747
$11:87e1  f8            sed
$11:87e2  2b            pld
$11:87e3  8a            txa
$11:87e4  71 38         adc ($38),y
$11:87e6  b6 5f         ldx $5f,y
$11:87e8  2b            pld
$11:87e9  f5 f9         sbc $f9,x
$11:87eb  cc fe cf      cpy $cffe
$11:87ee  67 83         adc [$83]
$11:87f0  41 a3         eor ($a3,x)
$11:87f2  91 c5         sta ($c5),y
$11:87f4  80 28         bra $881e
$11:87f6  c2 61         rep #$61
$11:87f8  00 d4         brk #$d4
$11:87fa  68            pla
$11:87fb  22 91 09 5c   jsl $5c0991
$11:87ff  a2 04 be      ldx #$be04
$11:8802  3e 07 03      rol $0307,x
$11:8805  e1 f0         sbc ($f0,x)
$11:8807  8c 6e 23      sty $236e
$11:880a  92 c9         sta ($c9)
$11:880c  3d 7e 03      and $037e,x
$11:880f  73 05         adc ($05,s),y
$11:8811  08            php
$11:8812  88            dey
$11:8813  64 12         stz $12
$11:8815  08            php
$11:8816  9c 42 1b      stz $1b42
$11:8819  01 8a         ora ($8a,x)
$11:881b  41 24         eor ($24,x)
$11:881d  09 01 11      ora #$1101
$11:8820  0d c2 41      ora $41c2
$11:8823  d8            cld
$11:8824  89 da e1      bit #$e1da
$11:8827  d0 f8         bne $8821
$11:8829  c4 72         cpy $72
$11:882b  61 30         adc ($30,x)
$11:882d  f0 78         beq $88a7
$11:882f  04 07         tsb $07
$11:8831  00 e4         brk #$e4
$11:8833  42 37         wdm #$37
$11:8835  18            clc
$11:8836  89 44 81      bit #$8144
$11:8839  fe 10 b3      inc $b310,x
$11:883c  e9 08 82      sbc #$8208
$11:883f  31 c8         and ($c8),y
$11:8841  ea            nop
$11:8842  5e 3e 91      lsr $913e,x
$11:8845  89 c4 32      bit #$32c4
$11:8848  19 0f 9b      ora $9b0f,y
$11:884b  c6 a2         dec $a2
$11:884d  d2 08         cmp ($08)
$11:884f  94 06         sty $06,x
$11:8851  09 03 84      ora #$8403
$11:8854  43 e1         eor $e1,s
$11:8856  b4 58         ldy $58,x
$11:8858  04 3e         tsb $3e
$11:885a  4b            phk
$11:885b  53 b2         eor ($b2,s),y
$11:885d  42 63         wdm #$63
$11:885f  92 19         sta ($19)
$11:8861  84 0c         sty $0c
$11:8863  48            pha
$11:8864  10 0a         bpl $8870
$11:8866  34 16         bit $16,x
$11:8868  df 00 ad 40   cmp $40ad00,x
$11:886c  63 70         adc $70,s
$11:886e  0e c5 a3      asl $a3c5
$11:8871  09 48 c0      ora #$c048
$11:8874  68            pla
$11:8875  38            sec
$11:8876  11 0f         ora ($0f),y
$11:8878  84 c3         sty $c3
$11:887a  45 00         eor $00
$11:887c  f9 49 39      sbc $3949,y
$11:887f  52 6c         eor ($6c)
$11:8881  84 e3         sty $e3
$11:8883  09 0c e0      ora #$e00c
$11:8886  60            rts
$11:8887  19 c1 e2      ora $e2c1,y
$11:888a  d0 7d         bne $8909
$11:888c  a0 1d ac      ldy #$ac1d
$11:888f  07 62         ora [$62]
$11:8891  00 b7         brk #$b7
$11:8893  08            php
$11:8894  8c 0a 35      sty $350a
$11:8897  0e 81 43      asl $4381
$11:889a  a2 51 68      ldx #$6851
$11:889d  94 49         sty $49,x
$11:889f  36 10         rol $10,x
$11:88a1  a8            tay
$11:88a2  54 7a 03      mvn $03,$7a
$11:88a5  1d 80 44      ora $4480,x
$11:88a8  48            pha
$11:88a9  43 09         eor $09,s
$11:88ab  23 0c         and $0c,s
$11:88ad  66 01         ror $01
$11:88af  31 80         and ($80),y
$11:88b1  6c 20 18      jmp ($1820)
$11:88b4  8a            txa
$11:88b5  07 62         ora [$62]
$11:88b7  e1 40         sbc ($40,x)
$11:88b9  b8            clv
$11:88ba  72 2d         adc ($2d)
$11:88bc  14 8a         trb $8a
$11:88be  47 02         eor [$02]
$11:88c0  81 10         sta ($10,x)
$11:88c2  88            dey
$11:88c3  7e 30 1b      ror $1b30,x
$11:88c6  82 80 60      brl $e949
$11:88c9  31 10         and ($10),y
$11:88cb  0c 86 03      tsb $0386
$11:88ce  21 00         and ($00,x)
$11:88d0  cc 40 39      cpy $3940
$11:88d3  90 09         bcc $88de
$11:88d5  f9 b8 63      sbc $63b8,y
$11:88d8  f0 08         beq $88e2
$11:88da  0b            phd
$11:88db  3d 0f 7e      and $7e0f,x
$11:88de  c0 0d fd      cpy #$fd0d
$11:88e1  bb            tyx
$11:88e2  bd 31 ff      lda $ff31,x
$11:88e5  c3 3f         cmp $3f,s
$11:88e7  70 1b         bvs $8904
$11:88e9  78            sei
$11:88ea  c8            iny
$11:88eb  1b            tcs
$11:88ec  e7 1d         sbc [$1d]
$11:88ee  86 43         stx $43
$11:88f0  a0 00 30      ldy #$3000
$11:88f3  83 40         sta $40,s
$11:88f5  23 8a         and $8a,s
$11:88f7  61 5f         adc ($5f,x)
$11:88f9  16 7e         asl $7e,x
$11:88fb  2d 2e 9a      and $9a2e
$11:88fe  7f 62 3f b8   adc $b83f62,x
$11:8902  46 3e         lsr $3e
$11:8904  05 0b         ora $0b
$11:8906  52 0a         eor ($0a)
$11:8908  74 3d         stz $3d,x
$11:890a  f0 6e         beq $897a
$11:890c  7c 11 42      jmp ($4211,x)
$11:890f  00 50         brk #$50
$11:8911  3a            dec a
$11:8912  80 14         bra $8928
$11:8914  00 a0         brk #$a0
$11:8916  9d 0f e7      sta $e70f,x
$11:8919  c3 31         cmp $31,s
$11:891b  e0 bc 60      cpx #$60bc
$11:891e  3e 10 0b      rol $0b10,x
$11:8921  04 00         tsb $00
$11:8923  46 18         lsr $18
$11:8925  03 f3         ora $f3,s
$11:8927  b6 c1         ldx $c1,y
$11:8929  b6 d5         ldx $d5,y
$11:892b  0a            asl a
$11:892c  7d 22 8f      adc $8f22,x
$11:892f  24 90         bit $90
$11:8931  c6 27         dec $27
$11:8933  10 f8         bpl $892d
$11:8935  fc 0e 1e      jsr ($1e0e,x)
$11:8938  9b            txy
$11:8939  29 84 02      and #$0284
$11:893c  71 00         adc ($00),y
$11:893e  8f 32 8c fc   sta $fc8c32
$11:8942  99 be c4      sta $c4be,y
$11:8945  bf c1 1d f0   lda $f01dc1,x
$11:8949  69 7c 1a      adc #$1a7c
$11:894c  1f 05 a3 51   ora $51a305,x
$11:8950  1a            inc a
$11:8951  9d 43 a3      sta $a343,x
$11:8954  d3 fb         cmp ($fb,s),y
$11:8956  c4 7e         cpy $7e
$11:8958  61 1f         adc ($1f,x)
$11:895a  90 1c         bcc $8978
$11:895c  c0 e6 11      cpy #$11e6
$11:895f  78            sei
$11:8960  04 14         tsb $14
$11:8962  e8            inx
$11:8963  36 19         rol $19,x
$11:8965  fe c3 3f      inc $3fc3,x
$11:8968  5c e3 cc 2e   jml $2ecce3
$11:896c  10 c9         bpl $8937
$11:896e  e4 0c         cpx $0c
$11:8970  e6 0c         inc $0c
$11:8972  b1 e0         lda ($e0),y
$11:8974  35 86         and $86,x
$11:8976  71 00         adc ($00),y
$11:8978  7d 02 8c      adc $8c02,x
$11:897b  0f c9 9f ec   ora $ec9fc9
$11:897f  4f ff 90 7f   eor $7f90ff
$11:8983  04 7e         tsb $7e
$11:8985  81 a5         sta ($a5,x)
$11:8987  e0 58 74      cpx #$7458
$11:898a  01 92         ora ($92,x)
$11:898c  98            tya
$11:898d  5e 23 13      lsr $1323,x
$11:8990  c1 08         cmp ($08,x)
$11:8992  6f e0 13 f1   adc $f113e0
$11:8996  32 c1         and ($c1)
$11:8998  20 10 c8      jsr $c810
$11:899b  44 08 54      mvp $54,$08
$11:899e  10 48         bpl $89e8
$11:89a0  44 22 23      mvp $23,$22
$11:89a3  11 4d         ora ($4d),y
$11:89a5  94 32         sty $32,x
$11:89a7  19 04 86      ora $8604,y
$11:89aa  41 a0         eor ($a0,x)
$11:89ac  d0 78         bne $8a26
$11:89ae  dc 26 6b      jml [$6b26]
$11:89b1  10 96         bpl $8949
$11:89b3  80 04         bra $89b9
$11:89b5  0c bc 06      tsb $06bc
$11:89b8  c8            iny
$11:89b9  39 86 80      and $8086,y
$11:89bc  d8            cld
$11:89bd  14 82         trb $82
$11:89bf  c8            iny
$11:89c0  30 1e         bmi $89e0
$11:89c2  06 d0         asl $d0
$11:89c4  25 42         and $42
$11:89c6  80 ac         bra $8974
$11:89c8  04 d8         tsb $d8
$11:89ca  2c 6d 54      bit $546d
$11:89cd  0b            phd
$11:89ce  1c 89 44      trb $4489
$11:89d1  a4 12         ldy $12
$11:89d3  05 8d         ora $8d
$11:89d5  44 6d 72      mvp $72,$6d
$11:89d8  0a            asl a
$11:89d9  c4 02         cpy $02
$11:89db  e0 b1 8b      cpx #$8bb1
$11:89de  8c 26 33      sty $3326
$11:89e1  0c 8e c6      tsb $c68e
$11:89e4  61 f0         adc ($f0,x)
$11:89e6  4c 7c 07      jmp $077c
$11:89e9  ab            plb
$11:89ea  30 aa         bmi $8996
$11:89ec  47 bf         eor [$bf]
$11:89ee  55 68         eor $68,x
$11:89f0  34 04         bit $04,x
$11:89f2  8e 10 e8      stx $e810
$11:89f5  4e 7e 09      lsr $097e
$11:89f8  de 80 f3      dec $f380,x
$11:89fb  e0 1e 18      cpx #$181e
$11:89fe  04 86         tsb $86
$11:8a00  01 8e         ora ($8e,x)
$11:8a02  88            dey
$11:8a03  66 26         ror $26
$11:8a05  1b            tcs
$11:8a06  88            dey
$11:8a07  c7 c2         cmp [$c2]
$11:8a09  41 f1         eor ($f1,x)
$11:8a0b  80 6a         bra $8a77
$11:8a0d  e1 9a         sbc ($9a,x)
$11:8a0f  ab            plb
$11:8a10  c7 5e         cmp [$5e]
$11:8a12  c4 a8         cpy $a8
$11:8a14  0e 04 03      asl $0304
$11:8a17  e1 90         sbc ($90,x)
$11:8a19  fc c8 3f      jsr ($3fc8,x)
$11:8a1c  78            sei
$11:8a1d  0f 9c 03 0f   ora $0f039c
$11:8a21  80 c6         bra $89e9
$11:8a23  1e c6 21      asl $21c6,x
$11:8a26  10 80         bpl $89a8
$11:8a28  8c cd 6c      sty $6ccd
$11:8a2b  93 10         sta ($10,s),y
$11:8a2d  60            rts
$11:8a2e  c8            iny
$11:8a2f  16 95         asl $95,x
$11:8a31  00 c4         brk #$c4
$11:8a33  42 12         wdm #$12
$11:8a35  e5 60         sbc $60
$11:8a37  90 27         bcc $8a60
$11:8a39  40            rti
$11:8a3a  86 11         stx $11
$11:8a3c  08            php
$11:8a3d  07 32         ora [$32]
$11:8a3f  01 c4         ora ($c4,x)
$11:8a41  30 0f         bmi $8a52
$11:8a43  00 c8         brk #$c8
$11:8a45  36 03         rol $03,x
$11:8a47  40            rti
$11:8a48  cc 09 a0      cpy $a009
$11:8a4b  6e 18 cc      ror $cc18
$11:8a4e  67 9d         adc [$9d]
$11:8a50  c0 97 41      cpy #$4197
$11:8a53  3f f5 8f bf   and $bf8ff5,x
$11:8a57  0b            phd
$11:8a58  ef 02 37 14   sbc $143702
$11:8a5c  1a            inc a
$11:8a5d  01 3f         ora ($3f,x)
$11:8a5f  80 7e         bra $8adf
$11:8a61  e5 5b         sbc $5b
$11:8a63  fc c7 ff      jsr ($ffc7,x)
$11:8a66  85 ff         sta $ff
$11:8a68  81 1f         sta ($1f,x)
$11:8a6a  80 70         bra $8adc
$11:8a6c  18            clc
$11:8a6d  3c 17 07      bit $0717,x
$11:8a70  81 9b         sta ($9b,x)
$11:8a72  8c 6f a0      sty $a06f
$11:8a75  1f db 0c 8e   ora $8e0cdb,x
$11:8a79  04 01         tsb $01
$11:8a7b  00 08         brk #$08
$11:8a7d  0e 00 02      asl $0200
$11:8a80  1e 7c 17      asl $177c,x
$11:8a83  fe 51 fe      inc $fe51,x
$11:8a86  b0 7f         bcs $8b07
$11:8a88  0d db f6      ora $f6db
$11:8a8b  3f 79 b8 c9   and $c9b879,x
$11:8a8f  c0 d5 08      cpy #$08d5
$11:8a92  07 82         ora [$82]
$11:8a94  41 f0         eor ($f0,x)
$11:8a96  88            dey
$11:8a97  1a            inc a
$11:8a98  41 bc         eor ($bc,x)
$11:8a9a  c6 51         dec $51
$11:8a9c  c0 78 28      cpy #$2878
$11:8a9f  1f 04 80 40   ora $408004,x
$11:8aa3  e0 90 ca      cpx #$ca90
$11:8aa6  54 e6 4d      mvn $4d,$e6
$11:8aa9  30 8b         bmi $8a36
$11:8aab  56 67         lsr $67,x
$11:8aad  f3 19         sbc ($19,s),y
$11:8aaf  44 62 49      mvp $49,$62
$11:8ab2  56 4f         lsr $4f,x
$11:8ab4  84 32         sty $32
$11:8ab6  87 39         sta [$39]
$11:8ab8  a3 4c         lda $4c,s
$11:8aba  29 f5 99      and #$99f5
$11:8abd  00 fc         brk #$fc
$11:8abf  23 10         and $10,s
$11:8ac1  7a            ply
$11:8ac2  b4 27         ldy $27,x
$11:8ac4  81 e0         sta ($e0,x)
$11:8ac6  c8            iny
$11:8ac7  46 35         lsr $35
$11:8ac9  34 e9         bit $e9,x
$11:8acb  96 1b         stx $1b,y
$11:8acd  69 cd ff      adc #$ffcd
$11:8ad0  51 b1         eor ($b1),y
$11:8ad2  50 cc         bvc $8aa0
$11:8ad4  94 d3         sty $d3,x
$11:8ad6  c0 0a 0f      cpy #$0f0a
$11:8ad9  0d 3a 63      ora $633a
$11:8adc  86 bc         stx $bc
$11:8ade  f3 60         sbc ($60,s),y
$11:8ae0  54 60 00      mvn $00,$60
$11:8ae3  5c 26 9c 93   jml $939c26
$11:8ae7  71 42         adc ($42),y
$11:8ae9  21 06         and ($06,x)
$11:8aeb  e2 91         sep #$91
$11:8aed  58            cli
$11:8aee  db            stp
$11:8aef  cd 08 1e      cmp $1e08
$11:8af2  98            tya
$11:8af3  e9 27 93      sbc #$9327
$11:8af6  ca            dex
$11:8af7  15 0b         ora $0b,x
$11:8af9  19 80 c0      ora $c080,y
$11:8afc  e0 70         cpx #$70
$11:8afe  b8            clv
$11:8aff  5d 46 22      eor $2246,x
$11:8b02  81 40         sta ($40,x)
$11:8b04  8c 46 27      sty $2746
$11:8b07  90 0a         bcc $8b13
$11:8b09  14 f3         trb $f3
$11:8b0b  01 7e         ora ($7e,x)
$11:8b0d  c0 df         cpy #$df
$11:8b0f  b0 b7         bcs $8ac8
$11:8b11  2c 45 c2      bit $c245
$11:8b14  81 38         sta ($38,x)
$11:8b16  8c 0f 4e      sty $4e0f
$11:8b19  02 a3         cop #$a3
$11:8b1b  04 80         tsb $80
$11:8b1d  af 82 19 08   lda $081982
$11:8b21  82 0f 50      brl $db33
$11:8b24  e6 0e         inc $0e
$11:8b26  f0 81         beq $8aa9
$11:8b28  c1 a0         cmp ($a0,x)
$11:8b2a  cf 10 46 03   cmp $034610
$11:8b2e  a4 28         ldy $28
$11:8b30  0d 40 49      ora $4940
$11:8b33  09 6c 24      ora #$246c
$11:8b36  12 01         ora ($01)
$11:8b38  e9 50 38      sbc #$3850
$11:8b3b  0a            asl a
$11:8b3c  00 6b         brk #$6b
$11:8b3e  03 a8         ora $a8,s
$11:8b40  66 12         ror $12
$11:8b42  0a            asl a
$11:8b43  84 02         sty $02
$11:8b45  e1 00         sbc ($00,x)
$11:8b47  4c 8d 82      jmp $828d
$11:8b4a  81 10         sta ($10,x)
$11:8b4c  80 4a         bra $8b98
$11:8b4e  24 11         bit $11
$11:8b50  48            pha
$11:8b51  84 b2         sty $b2
$11:8b53  50 ce         bvc $8b23
$11:8b55  08            php
$11:8b56  54 22 c1      mvn $c1,$22
$11:8b59  60            rts
$11:8b5a  90 58         bcc $8bb4
$11:8b5c  26 13         rol $13
$11:8b5e  08            php
$11:8b5f  c4 e2         cpy $e2
$11:8b61  39 6c 92      and $926c,y
$11:8b64  77 20         adc [$20],y
$11:8b66  de 68 34      dec $3468,x
$11:8b69  38            sec
$11:8b6a  86 13         stx $13
$11:8b6c  88            dey
$11:8b6d  85 72         sta $72
$11:8b6f  21 8a         and ($8a,x)
$11:8b71  80 43         bra $8bb6
$11:8b73  a0 91         ldy #$91
$11:8b75  28            plp
$11:8b76  04 90         tsb $90
$11:8b78  7a            ply
$11:8b79  33 89         and ($89,s),y
$11:8b7b  c5 a2         cmp $a2
$11:8b7d  f1 ec         sbc ($ec),y
$11:8b7f  fe 67 b3      inc $b367,x
$11:8b82  d9 ac f4      cmp $f4ac,y
$11:8b85  da            phx
$11:8b86  6d 2c 96      adc $962c
$11:8b89  0d c2 df      ora $dfc2
$11:8b8c  21 9f         and ($9f,x)
$11:8b8e  c0 60         cpy #$60
$11:8b90  e7 31         sbc [$31]
$11:8b92  3a            dec a
$11:8b93  08            php
$11:8b94  f4 d6 60      pea $60d6
$11:8b97  00 cd         brk #$cd
$11:8b99  b4 13         ldy $13,x
$11:8b9b  79 00 e0      adc $e000,y
$11:8b9e  25 82         and $82
$11:8ba0  01 c4         ora ($c4,x)
$11:8ba2  c0 6e         cpy #$6e
$11:8ba4  02 42         cop #$42
$11:8ba6  ac 0e 46      ldy $460e
$11:8ba9  00 26         brk #$26
$11:8bab  1c 04 f8      trb $f804
$11:8bae  40            rti
$11:8baf  2c 90 0b      bit $0b90
$11:8bb2  e3 40         sbc $40,s
$11:8bb4  00 13         brk #$13
$11:8bb6  03 3c         ora $3c,s
$11:8bb8  04 0a         tsb $0a
$11:8bba  4f 25 9d 46   eor $469d25
$11:8bbe  45 f1         eor $f1
$11:8bc0  05 80         ora $80
$11:8bc2  46 e0         lsr $e0
$11:8bc4  33 d1         and ($d1,s),y
$11:8bc6  f1 b3         sbc ($b3),y
$11:8bc8  c2 31         rep #$31
$11:8bca  08            php
$11:8bcb  b8            clv
$11:8bcc  44 3c 1e      mvp $1e,$3c
$11:8bcf  0f c4 03 a1   ora $a103c4
$11:8bd3  90 27         bcc $8bfc
$11:8bd5  9c 22 61      stz $6122
$11:8bd8  38            sec
$11:8bd9  f0 2b         beq $8c06
$11:8bdb  07 f1         ora [$f1]
$11:8bdd  78            sei
$11:8bde  61 07         adc ($07,x)
$11:8be0  7e 2d 2e      ror $2e2d,x
$11:8be3  da            phx
$11:8be4  7f 62 3f b8   adc $b83f62,x
$11:8be8  46 3e         lsr $3e
$11:8bea  05 0b         ora $0b
$11:8bec  80 41         bra $8c2f
$11:8bee  93 83         sta ($83,s),y
$11:8bf0  ef 83 53 e0   sbc $e05383
$11:8bf4  90 e8         bcc $8bde
$11:8bf6  04 1d         tsb $1d
$11:8bf8  ec 28 50      cpx $5028
$11:8bfb  42 83         wdm #$83
$11:8bfd  f4 3f 7f      pea $7f3f
$11:8c00  8c f7 82      sty $82f7
$11:8c03  f9 80 f8      sbc $f880,y
$11:8c06  2c 00 24      bit $2400
$11:8c09  18            clc
$11:8c0a  0c 00 01      tsb $0100
$11:8c0d  d3 60         cmp ($60,s),y
$11:8c0f  9b            txy
$11:8c10  6e f1 c3      ror $c3f1
$11:8c13  d0 39         bne $8c4e
$11:8c15  30 c0         bmi $8bd7
$11:8c17  5c 78 15 9c   jml $9c1578
$11:8c1b  07 ba         ora [$ba]
$11:8c1d  41 71         eor ($71,x)
$11:8c1f  88            dey
$11:8c20  7f f0 18 e7   adc $e718f0,x
$11:8c24  e0 dc 64      cpx #$64dc
$11:8c27  13 98         ora ($98,s),y
$11:8c29  04 fe         tsb $fe
$11:8c2b  01 9f         ora ($9f,x)
$11:8c2d  80 36         bra $8c65
$11:8c2f  c8            iny
$11:8c30  80 5a         bra $8c8c
$11:8c32  aa            tax
$11:8c33  f6 b6         inc $b6,x
$11:8c35  a5 bf         lda $bf
$11:8c37  a0 65 ed      ldy #$ed65
$11:8c3a  1b            tcs
$11:8c3b  77 b0         adc [$b0],y
$11:8c3d  eb            xba
$11:8c3e  ee 19 fa      inc $fa19
$11:8c41  85 7a         sta $7a
$11:8c43  03 52         ora $52,s
$11:8c45  0a            asl a
$11:8c46  0d a0 08      ora $08a0
$11:8c49  66 80         ror $80
$11:8c4b  a8            tay
$11:8c4c  48            pha
$11:8c4d  35 73         and $73,x
$11:8c4f  ce d4 93      dec $93d4
$11:8c52  ff 00 fa 42   sbc $42fa00,x
$11:8c56  be f0 af      ldx $aff0,y
$11:8c59  ac 23 f3      ldy $f323
$11:8c5c  04 fe         tsb $fe
$11:8c5e  41 27         eor ($27,x)
$11:8c60  9c 19 23      stz $2319
$11:8c63  1c 20 30      trb $3020
$11:8c66  a1 20         lda ($20,x)
$11:8c68  c2 20         rep #$20
$11:8c6a  70 41         bvs $8cad
$11:8c6c  50 98         bvc $8c06
$11:8c6e  42 39         wdm #$39
$11:8c70  1c 95 48      trb $4895
$11:8c73  a1 14         lda ($14,x)
$11:8c75  9a            txs
$11:8c76  ad 06 6d      lda $6d06
$11:8c79  77 80         adc [$80],y
$11:8c7b  48            pha
$11:8c7c  93 a5         sta ($a5,s),y
$11:8c7e  1c 80 4a      trb $4a80
$11:8c81  a2 95 d9      ldx #$d995
$11:8c84  55 76         eor $76,x
$11:8c86  45 77         eor $77
$11:8c88  84 0f         sty $0f
$11:8c8a  0c 26 17      tsb $1726
$11:8c8d  f2 00         sbc ($00)
$11:8c8f  95 7c         sta $7c,x
$11:8c91  bc d0 68      ldy $68d0,x
$11:8c94  34 2e         bit $2e,x
$11:8c96  11 17         ora ($17),y
$11:8c98  88            dey
$11:8c99  32 42         and ($42)
$11:8c9b  47 20         eor [$20]
$11:8c9d  93 c8         sta ($c8,s),y
$11:8c9f  26 f3         rol $f3
$11:8ca1  09 6c 86      ora #$866c
$11:8ca4  03 07         ora $07,s
$11:8ca6  83 c3         sta $c3,s
$11:8ca8  e1 f1         sbc ($f1,x)
$11:8caa  f4 20 cf      pea $cf20
$11:8cad  d0 e1         bne $8c90
$11:8caf  0f 9f c7 a7   ora $a7c79f
$11:8cb3  fc 0e 06      jsr ($060e,x)
$11:8cb6  82 41 d0      brl $5cfa
$11:8cb9  88            dey
$11:8cba  70 20         bvs $8cdc
$11:8cbc  18            clc
$11:8cbd  88            dey
$11:8cbe  47 22         eor [$22]
$11:8cc0  11 d8         ora ($d8),y
$11:8cc2  8c 5a 21      sty $215a
$11:8cc5  10 04         bpl $8ccb
$11:8cc7  78            sei
$11:8cc8  78            sei
$11:8cc9  3c 1f 05      bit $051f,x
$11:8ccc  20 fe 14      jsr $14fe
$11:8ccf  e1 e0         sbc ($e0,x)
$11:8cd1  54 0b 70      mvn $70,$0b
$11:8cd4  20 70 38      jsr $3870
$11:8cd7  2c 10 e2      bit $e210
$11:8cda  02 e0         cop #$e0
$11:8cdc  88            dey
$11:8cdd  c4 22         cpy $22
$11:8cdf  71 08         adc ($08),y
$11:8ce1  dc 61 b8      jml [$b861]
$11:8ce4  2b            pld
$11:8ce5  10 40         bpl $8d27
$11:8ce7  12 08         ora ($08)
$11:8ce9  50 61         bvc $8d4c
$11:8ceb  07 8f         ora [$8f]
$11:8ced  8f 82 c1 60   sta $60c182
$11:8cf1  49 87 a2      eor #$a287
$11:8cf4  11 e0         ora ($e0),y
$11:8cf6  80 71         bra $8d69
$11:8cf8  20 8d 90      jsr $908d
$11:8cfb  f7 43         sbc [$43],y
$11:8cfd  87 c1         sta [$c1]
$11:8cff  80 51         bra $8d52
$11:8d01  17 e1         ora [$e1],y
$11:8d03  cc 3f c7      cpy $c73f
$11:8d06  48            pha
$11:8d07  7c 3f c3      jmp ($c33f,x)
$11:8d0a  d2 77         cmp ($77)
$11:8d0c  c4 11         cpy $11
$11:8d0e  df 86 e0 77   cmp $77e086,x
$11:8d12  dc 32 01      jml [$0132]
$11:8d15  32 77         and ($77)
$11:8d17  dc f2 01      jml [$01f2]
$11:8d1a  7e 80 47      ror $4780,x
$11:8d1d  e0 c7 50      cpx #$50c7
$11:8d20  85 43         sta $43
$11:8d22  20 e0 d3      jsr $d3e0
$11:8d25  80 c0         bra $8ce7
$11:8d27  0e a1 3c      asl $3ca1
$11:8d2a  82 33 80      brl $0d60
$11:8d2d  76 0e         ror $0e,x
$11:8d2f  f8            sed
$11:8d30  c0 40 3c      cpy #$3c40
$11:8d33  14 0e         trb $0e
$11:8d35  f7 5a         sbc [$5a],y
$11:8d37  03 41         ora $41,s
$11:8d39  87 f9         sta [$f9]
$11:8d3b  21 d6         and ($d6,x)
$11:8d3d  8e fc d3      stx $d3fc
$11:8d40  bd 36 b0      lda $b036,x
$11:8d43  40            rti
$11:8d44  36 13         rol $13,x
$11:8d46  09 44 63      ora #$6344
$11:8d49  7d 00 8d      adc $8d00,x
$11:8d4c  c1 a2         cmp ($a2,x)
$11:8d4e  f0 08         beq $8d58
$11:8d50  7c 12 1e      jmp ($1e12,x)
$11:8d53  36 38         rol $38,x
$11:8d55  cc 67 9b      cpy $9b67
$11:8d58  c1 97         cmp ($97,x)
$11:8d5a  c1 3f         cmp ($3f,x)
$11:8d5c  f5 8f         sbc $8f,x
$11:8d5e  bf 0b ef 02   lda $02ef0b,x
$11:8d62  04 a4         tsb $a4
$11:8d64  fa            plx
$11:8d65  01 fb         ora ($fb,x)
$11:8d67  95 6f         sta $6f,x
$11:8d69  f3 1f         sbc ($1f,s),y
$11:8d6b  fe 17 fc      inc $fc17,x
$11:8d6e  fc 72 c9      jsr ($c972,x)
$11:8d71  06 fb         asl $fb
$11:8d73  01 f3         ora ($f3,x)
$11:8d75  80 76         bra $8ded
$11:8d77  e3 5a         sbc $5a,s
$11:8d79  f9 05 60      sbc $6005,y
$11:8d7c  be 01 81      ldx $8101,y
$11:8d7f  8f 42 2f f2   sta $f22f42
$11:8d83  0f fe 03 c3   ora $c303fe
$11:8d87  00 e0         brk #$e0
$11:8d89  c0 30 2e      cpy #$2e30
$11:8d8c  f3 89         sbc ($89,s),y
$11:8d8e  c4 f9         cpy $f9
$11:8d90  dc 03 bd      jml [$bd03]
$11:8d93  06 c2         asl $c2
$11:8d95  7f 02 fd ca   adc $cafd02,x
$11:8d99  11 28         ora ($28),y
$11:8d9b  5f 06 79 74   eor $747906,x
$11:8d9f  20 1f 09      jsr $091f
$11:8da2  06 42         asl $42
$11:8da4  41 70         eor ($70,x)
$11:8da6  a0 68 38      ldy #$3868
$11:8da9  0d b0 f0      ora $f0b0
$11:8dac  14 07         trb $07
$11:8dae  c1 80         cmp ($80,x)
$11:8db0  e0 40 1c      cpx #$1c40
$11:8db3  e0 4f 00      cpx #$004f
$11:8db6  c0 70 e9      cpy #$e970
$11:8db9  9f 0a 3e fe   sta $fe3e0a,x
$11:8dbd  ff df 90 67   sbc $6790df,x
$11:8dc1  68            pla
$11:8dc2  5b            tcd
$11:8dc3  0b            phd
$11:8dc4  7f 3e 75 8f   adc $8f753e,x
$11:8dc8  a8            tay
$11:8dc9  d3 26         cmp ($26,s),y
$11:8dcb  14 79         trb $79
$11:8dcd  c5 fe         cmp $fe
$11:8dcf  01 20         ora ($20,x)
$11:8dd1  80 50         bra $8e23
$11:8dd3  a4 16         ldy $16
$11:8dd5  f8            sed
$11:8dd6  04 ea         tsb $ea
$11:8dd8  01 51         ora ($51,x)
$11:8dda  90 78         bcc $8e54
$11:8ddc  63 10         adc $10,s
$11:8dde  7f 87 f8 26   adc $26f887,x
$11:8de2  10 1b         bpl $8dff
$11:8de4  66 4a         ror $4a
$11:8de6  0b            phd
$11:8de7  fb            xce
$11:8de8  fb            xce
$11:8de9  52 7f         eor ($7f)
$11:8deb  96 20         stx $20,y
$11:8ded  80 c3         bra $8db2
$11:8def  c2 a0         rep #$a0
$11:8df1  3b            tsc
$11:8df2  0c 94 07      tsb $0794
$11:8df5  f7 00         sbc [$00],y
$11:8df7  a4 c0         ldy $c0
$11:8df9  2c 44 33      bit $3344
$11:8dfc  9b            txy
$11:8dfd  55 69         eor $69,x
$11:8dff  34 99         bit $99,x
$11:8e01  55 8c         eor $8c,x
$11:8e03  06 00         asl $00
$11:8e05  30 1e         bmi $8e25
$11:8e07  25 56         and $56
$11:8e09  11 49         ora ($49),y
$11:8e0b  9b            txy
$11:8e0c  58            cli
$11:8e0d  e3 83         sbc $83,s
$11:8e0f  c4 84         cpy $84
$11:8e11  13 80         ora ($80,s),y
$11:8e13  a2 31 c2      ldx #$c231
$11:8e16  a8            tay
$11:8e17  cf a6 d3 68   cmp $68d3a6
$11:8e1b  a1 44         lda ($44,x)
$11:8e1d  4a            lsr a
$11:8e1e  03 1c         ora $1c,s
$11:8e20  2a            rol a
$11:8e21  0c f8 b0      tsb $b0f8
$11:8e24  33 e8         and ($e8,s),y
$11:8e26  a1 70         lda ($70,x)
$11:8e28  2f 57 5d 16   and $165d57
$11:8e2c  ba            tsx
$11:8e2d  ab            plb
$11:8e2e  24 cc         bit $cc
$11:8e30  ce aa 77      dec $77aa
$11:8e33  4c bf e2      jmp $e2bf
$11:8e36  7f 70 ca d7   adc $d7ca70,x
$11:8e3a  20 97 5a      jsr $5a97
$11:8e3d  8f ff b7 ff   sta $ffb7ff
$11:8e41  e2 7f         sep #$7f
$11:8e43  b1 1f         lda ($1f),y
$11:8e45  c8            iny
$11:8e46  07 e2         ora [$e2]
$11:8e48  01 70         ora ($70,x)
$11:8e4a  91 df         sta ($df),y
$11:8e4c  f7 95         sbc [$95],y
$11:8e4e  cc 57 aa      cpy $aa57
$11:8e51  a9 48         lda #$48
$11:8e53  99 6e 32      sta $326e,y
$11:8e56  95 ce         sta $ce,x
$11:8e58  94 fb         sty $fb,x
$11:8e5a  f1 1c         sbc ($1c),y
$11:8e5c  a9 5d         lda #$5d
$11:8e5e  28            plp
$11:8e5f  15 c8         ora $c8,x
$11:8e61  a7 fb         lda [$fb]
$11:8e63  6d fe a3      adc $a3fe
$11:8e66  7f a4 57 e8   adc $e857a4,x
$11:8e6a  04 fa         tsb $fa
$11:8e6c  01 1c         ora ($1c,x)
$11:8e6e  43 84         eor $84,s
$11:8e70  5a            phy
$11:8e71  21 3d         and ($3d,x)
$11:8e73  9d 5c 6e      sta $6e5c,x
$11:8e76  f4 aa 94      pea $94aa
$11:8e79  d2 3b         cmp ($3b)
$11:8e7b  63 8c         adc $8c,s
$11:8e7d  52 eb         eor ($eb)
$11:8e7f  96 7f         stx $7f,y
$11:8e81  c4 3e         cpy $3e
$11:8e83  3f 02 9d 42   and $429d02,x
$11:8e87  2f f2 db fd   and $fddbf2
$11:8e8b  8a            txa
$11:8e8c  ff 64 be 48   sbc $48be64,x
$11:8e90  2f 88 90 e2   and $e29088
$11:8e94  fd 6b da      sbc $da6b,x
$11:8e97  ca            dex
$11:8e98  25 d3         and $d3
$11:8e9a  55 26         eor $26,x
$11:8e9c  cc d7 ff      cpy $ffd7
$11:8e9f  13 8e         ora ($8e,s),y
$11:8ea1  44 b3 e5      mvp $e5,$b3
$11:8ea4  14 85         trb $85
$11:8ea6  7f e4 7a fc   adc $fc7ae4,x
$11:8eaa  5f ff b3 ff   eor $ffb3ff,x
$11:8eae  90 0e         bcc $8ebe
$11:8eb0  42 71         wdm #$71
$11:8eb2  10 9e         bpl $8e52
$11:8eb4  15 00         ora $00,x
$11:8eb6  7e 12 48      ror $4812,x
$11:8eb9  05 6a         ora $6a
$11:8ebb  31 3c         and ($3c),y
$11:8ebd  7a            ply
$11:8ebe  8b            phb
$11:8ebf  cc 1e 20      cpy $201e
$11:8ec2  3f 17 a8 50   and $50a817,x
$11:8ec6  af d9 9b f6   lda $f69bd9
$11:8eca  f4 0a 39      pea $390a
$11:8ecd  90 08         bcc $8ed7
$11:8ecf  3f c0 7e 31   and $317ec0,x
$11:8ed3  87 a0         sta [$a0]
$11:8ed5  49 2c         eor #$2c
$11:8ed7  c1 50         cmp ($50,x)
$11:8ed9  7a            ply
$11:8eda  00 44         brk #$44
$11:8edc  07 e4         ora [$e4]
$11:8ede  1c 00 70      trb $7000
$11:8ee1  06 00         asl $00
$11:8ee3  30 d0         bmi $8eb5
$11:8ee5  f1 70         sbc ($70),y
$11:8ee7  c1 e0         cmp ($e0,x)
$11:8ee9  10 12         bpl $8efd
$11:8eeb  4a            lsr a
$11:8eec  0e fd f8      asl $f8fd
$11:8eef  1d f9 8f      ora $8ff9,x
$11:8ef2  be 33 ff      ldx $ff33,y
$11:8ef5  86 7e         stx $7e
$11:8ef7  e0 36         cpx #$36
$11:8ef9  f8            sed
$11:8efa  14 68         trb $68
$11:8efc  7c 70 e8      jmp ($e870,x)
$11:8eff  04 1a         tsb $1a
$11:8f01  01 03         ora ($03,x)
$11:8f03  30 0b         bmi $8f10
$11:8f05  b8            clv
$11:8f06  1d c2 4c      ora $4cc2,x
$11:8f09  28            plp
$11:8f0a  b4 bb         ldy $bb,x
$11:8f0c  69 fd         adc #$fd
$11:8f0e  88            dey
$11:8f0f  fe e1 18      inc $18e1,x
$11:8f12  f8            sed
$11:8f13  14 2c         trb $2c
$11:8f15  c0 2f         cpy #$2f
$11:8f17  c0 f7         cpy #$f7
$11:8f19  c1 a9         cmp ($a9,x)
$11:8f1b  f0 42         beq $8f5f
$11:8f1d  f8            sed
$11:8f1e  0c c8 66      tsb $66c8
$11:8f21  03 30         ora $30,s
$11:8f23  7e 06 c3      ror $c306,x
$11:8f26  81 e0         sta ($e0,x)
$11:8f28  c0 58         cpy #$58
$11:8f2a  30 1e         bmi $8f4a
$11:8f2c  08            php
$11:8f2d  05 82         ora $82
$11:8f2f  01 c0         ora ($c0,x)
$11:8f31  c0 60         cpy #$60
$11:8f33  07 ce         ora [$ce]
$11:8f35  9b            txy
$11:8f36  04 db         tsb $db
$11:8f38  1b            tcs
$11:8f39  fd 01 b6      sbc $b601,x
$11:8f3c  04 90         tsb $90
$11:8f3e  b3 c1         lda ($c1,s),y
$11:8f40  2b            pld
$11:8f41  ea            nop
$11:8f42  67 f7         adc [$f7]
$11:8f44  c7 f1         cmp [$f1]
$11:8f46  f5 2d         sbc $2d,x
$11:8f48  7d d3 40      adc $40d3,x
$11:8f4b  cf 08 07 a2   cmp $a20708
$11:8f4f  01 af         ora ($af,x)
$11:8f51  bf e9 ef f1   lda $f1efe9,x
$11:8f55  f8            sed
$11:8f56  05 4a         ora $4a
$11:8f58  41 74         eor ($74,x)
$11:8f5a  6b            rtl
$11:8f5b  03 fc         ora $fc,s
$11:8f5d  2f e0 70 04   and $0470e0
$11:8f61  0c 03 ed      tsb $ed03
$11:8f64  f9 fa 6a      sbc $6afa,y
$11:8f67  bf b9 38 6c   lda $6c38b9,x
$11:8f6b  3c c6 1b      bit $1bc6,x
$11:8f6e  f8            sed
$11:8f6f  07 df         ora [$df]
$11:8f71  ff d6 ff fe   sbc $feffd6,x
$11:8f75  60            rts
$11:8f76  1a            inc a
$11:8f77  a8            tay
$11:8f78  0e 4e 01      asl $014e
$11:8f7b  0f f8 40 3f   ora $3f40f8
$11:8f7f  e2 70         sep #$70
$11:8f81  14 08         trb $08
$11:8f83  fd 24 92      sbc $9224,x
$11:8f86  c9 24         cmp #$24
$11:8f88  62 78 dc      per $6c03
$11:8f8b  78            sei
$11:8f8c  04 60         tsb $60
$11:8f8e  84 2d         sty $2d
$11:8f90  c7 88         cmp [$88]
$11:8f92  13 f2         ora ($f2,s),y
$11:8f94  11 18         ora ($18),y
$11:8f96  2f e5 bf 9f   and $9fbfe5
$11:8f9a  d5 e0         cmp $e0,x
$11:8f9c  ee e7 16      inc $16e7
$11:8f9f  b8            clv
$11:8fa0  7e 4f 39      ror $394f,x
$11:8fa3  6f f8 4f d9   adc $d94ff8
$11:8fa7  43 30         eor $30,s
$11:8fa9  ff cf bf fc   sbc $fcbfcf,x
$11:8fad  7f ff c3 ff   adc $ffc3ff,x
$11:8fb1  60            rts
$11:8fb2  fe 40 04      inc $0440,x
$11:8fb5  c0 4a         cpy #$4a
$11:8fb7  1f 67 9a ad   ora $ad9a67,x
$11:8fbb  06 dd         asl $dd
$11:8fbd  4e 35 9e      lsr $9e35
$11:8fc0  0c 95 cb      tsb $cb95
$11:8fc3  d9 1c fc      cmp $fc1c,y
$11:8fc6  36 00         rol $00,x
$11:8fc8  84 1f         sty $1f
$11:8fca  ef c7 fb 8d   sbc $8dfbc7
$11:8fce  fe 8f 7f      inc $7f8f,x
$11:8fd1  a1 97         lda ($97,x)
$11:8fd3  e8            inx
$11:8fd4  04 70         tsb $70
$11:8fd6  94 50         sty $50,x
$11:8fd8  4f e5 5f ef   eor $ef5fe5
$11:8fdc  dc cc 6d      jml [$6dcc]
$11:8fdf  70 97         bvs $8f78
$11:8fe1  3f fe 3a e2   and $e23afe,x
$11:8fe5  08            php
$11:8fe6  00 b8         brk #$b8
$11:8fe8  40            rti
$11:8fe9  ff f0 8f fd   sbc $fd8ff0,x
$11:8fed  9f ff 7b 15   sta $157bff,x
$11:8ff1  95 c4         sta $c4,x
$11:8ff3  94 55         sty $55,x
$11:8ff5  6b            rtl
$11:8ff6  a7 b7         lda [$b7]
$11:8ff8  cd 37 83      cmp $8337
$11:8ffb  1c c3 bb      trb $bbc3
$11:8ffe  c0 b1         cpy #$b1
$11:9000  78            sei
$11:9001  bb            tyx
$11:9002  93 e4         sta ($e4,s),y
$11:9004  d8            cld
$11:9005  62 3f 89      per $1947
$11:9008  f4 9f 7f      pea $7f9f
$11:900b  a3 9f         lda $9f,s
$11:900d  e8            inx
$11:900e  04 f8         tsb $f8
$11:9010  94 13         sty $13,x
$11:9012  c9 e5         cmp #$e5
$11:9014  8a            txa
$11:9015  d5 4d         cmp $4d,x
$11:9017  e0 dc         cpx #$dc
$11:9019  fe 74 1f      inc $1f74,x
$11:901c  fc 2b c7      jsr ($c72b,x)
$11:901f  c1 a4         cmp ($a4,x)
$11:9021  d2 78         cmp ($78)
$11:9023  2e e0 8e      rol $8ee0
$11:9026  5f 90 21 32   eor $322190,x
$11:902a  e6 df         inc $df
$11:902c  f0 1d         beq $904b
$11:902e  d9 f4 fa      cmp $faf4,y
$11:9031  fe 81 07      inc $0781,x
$11:9034  7d 7a 6c      adc $6c7a,x
$11:9037  35 be         and $be,x
$11:9039  1b            tcs
$11:903a  fe a3 d7      inc $d7a3,x
$11:903d  f9 e7 fe      sbc $fee7,y
$11:9040  07 0c         ora [$0c]
$11:9042  83 c4         sta $c4,s
$11:9044  21 f0         and ($f0,x)
$11:9046  1a            inc a
$11:9047  e5 a6         sbc $a6
$11:9049  37 13         and [$13],y
$11:904b  ee 61 6d      inc $6d61
$11:904e  32 1e         and ($1e)
$11:9050  a4 cd         ldy $cd
$11:9052  16 10         asl $10,x
$11:9054  c8            iny
$11:9055  04 7a         tsb $7a
$11:9057  03 1e         ora $1e,s
$11:9059  84 df         sty $df
$11:905b  22 37 a8 4f   jsl $4fa837
$11:905f  7a            ply
$11:9060  1b            tcs
$11:9061  cc 87 70      cpy $7087
$11:9064  26 1e         rol $1e
$11:9066  08            php
$11:9067  42 28         wdm #$28
$11:9069  27 59         and [$59]
$11:906b  6a            ror a
$11:906c  c5 22         cmp $22
$11:906e  77 a1         adc [$a1],y
$11:9070  8b            phb
$11:9071  41 25         eor ($25,x)
$11:9073  7c c4 58      jmp ($58c4,x)
$11:9076  4c 20 1f      jmp $1f20
$11:9079  8c 05 e3      sty $e305
$11:907c  21 be         and ($be,x)
$11:907e  c4 57         cpy $57
$11:9080  b2 1f         lda ($1f)
$11:9082  bd 84 ce      lda $ce84,x
$11:9085  e0 8b         cpx #$8b
$11:9087  24 58         bit $58
$11:9089  40            rti
$11:908a  57 81         eor [$81],y
$11:908c  06 81         asl $81
$11:908e  40            rti
$11:908f  21 f0         and ($f0,x)
$11:9091  b8            clv
$11:9092  29 d4         and #$d4
$11:9094  0e 48 74      asl $7448
$11:9097  18            clc
$11:9098  3c 00 f0      bit $f000,x
$11:909b  10 e3         bpl $9080
$11:909d  7a            ply
$11:909e  40            rti
$11:909f  30 18         bmi $90b9
$11:90a1  0e 05 82      asl $8205
$11:90a4  81 00         sta ($00,x)
$11:90a6  f8            sed
$11:90a7  6c 34 18      jmp ($1834)
$11:90aa  04 89         tsb $89
$11:90ac  c0 38         cpy #$38
$11:90ae  09 50         ora #$50
$11:90b0  80 78         bra $912a
$11:90b2  20 16 09      jsr $0916
$11:90b5  01 b8         ora ($b8,x)
$11:90b7  27 90         and [$90]
$11:90b9  0b            phd
$11:90ba  0a            asl a
$11:90bb  a8            tay
$11:90bc  7c 0b 41      jmp ($410b,x)
$11:90bf  4c 85 c2      jmp $c285
$11:90c2  21 38         and ($38,x)
$11:90c4  84 3b         sty $3b
$11:90c6  02 e6         cop #$e6
$11:90c8  a4 06         ldy $06
$11:90ca  11 60         ora ($60),y
$11:90cc  15 23         ora $23,x
$11:90ce  40            rti
$11:90cf  56 82         lsr $82,x
$11:90d1  64 38         stz $38
$11:90d3  14 06         trb $06
$11:90d5  88            dey
$11:90d6  27 83         and [$83]
$11:90d8  9d 00 ff      sta $ff00,x
$11:90db  e0 24         cpx #$24
$11:90dd  72 c8         adc ($c8)
$11:90df  24 49         bit $49
$11:90e1  32 09         and ($09)
$11:90e3  e0 6a         cpx #$6a
$11:90e5  9c 22 ff      stz $ff22
$11:90e8  02 89         cop #$89
$11:90ea  c0 61         cpy #$61
$11:90ec  a8            tay
$11:90ed  e5 49         sbc $49
$11:90ef  9b            txy
$11:90f0  e4 2e         cpx $2e
$11:90f2  12 08         ora ($08)
$11:90f4  43 b9         eor $b9,s
$11:90f6  d4 06         pei ($06)
$11:90f8  53 05         eor ($05,s),y
$11:90fa  78            sei
$11:90fb  61 91         adc ($91,x)
$11:90fd  41 04         eor ($04,x)
$11:90ff  83 85         sta $85,s
$11:9101  05 0a         ora $0a
$11:9103  10 e8         bpl $90ed
$11:9105  44 52 21      mvp $21,$52
$11:9108  7c 6b 0a      jmp ($0a6b,x)
$11:910b  14 04         trb $04
$11:910d  63 01         adc $01,s
$11:910f  44 84 1d      mvp $1d,$84
$11:9112  18            clc
$11:9113  92 48         sta ($48)
$11:9115  c5 2a         cmp $2a
$11:9117  11 42         ora ($42),y
$11:9119  92 59         sta ($59)
$11:911b  81 c2         sta ($c2,x)
$11:911d  6f 38 c0 38   adc $38c038
$11:9121  21 00         and ($00,x)
$11:9123  f0 20         beq $9145
$11:9125  82 39 62      brl $f361
$11:9128  04 f4         tsb $f4
$11:912a  84 46         sty $46
$11:912c  0a            asl a
$11:912d  c0 71         cpy #$71
$11:912f  22 b8 17 d0   jsl $d017b8
$11:9133  80 25         bra $915a
$11:9135  a3 83         lda $83,s
$11:9137  41 a1         eor ($a1,x)
$11:9139  70 88         bvs $90c3
$11:913b  bc 41 12      ldy $1241,x
$11:913e  12 79         ora ($79)
$11:9140  01 dc         ora ($dc,x)
$11:9142  24 72         bit $72
$11:9144  0b            phd
$11:9145  4d 80 50      eor $5080
$11:9148  10 78         bpl $91c2
$11:914a  7c 3e 3e      jmp ($3e3e,x)
$11:914d  84 19         sty $19
$11:914f  fa            plx
$11:9150  1c ef ef      trb $efef
$11:9153  90 d0         bcc $9125
$11:9155  48            pha
$11:9156  3a            dec a
$11:9157  11 0e         ora ($0e),y
$11:9159  04 03         tsb $03
$11:915b  91 08         sta ($08),y
$11:915d  4b            phk
$11:915e  86 22         stx $22
$11:9160  11 2c         ora ($2c),y
$11:9162  86 34         stx $34
$11:9164  03 81         ora $81,s
$11:9166  e0 f0         cpx #$f0
$11:9168  7c 14 83      jmp ($8314,x)
$11:916b  f8            sed
$11:916c  53 9f         eor ($9f,s),y
$11:916e  f0 0c         beq $917c
$11:9170  10 38         bpl $91aa
$11:9172  1c 16 08      trb $0816
$11:9175  71 00         adc ($00),y
$11:9177  c8            iny
$11:9178  44 e2 0b      mvp $0b,$e2
$11:917b  90 98         bcc $9115
$11:917d  cc 00 c2      cpy $c200
$11:9180  b1 04         lda ($04),y
$11:9182  01 20         ora ($20,x)
$11:9184  85 92         sta $92
$11:9186  33 f0         and ($f0,s),y
$11:9188  30 58         bmi $91e2
$11:918a  2c 09 30      bit $3009
$11:918d  f4 42 3c      pea $3c42
$11:9190  10 0f         bpl $91a1
$11:9192  24 11         bit $11
$11:9194  b2 1c         lda ($1c)
$11:9196  48            pha
$11:9197  20 24 54      jsr $5424
$11:919a  45 f8         eor $f8
$11:919c  73 0f         adc ($0f,s),y
$11:919e  f1 d2         sbc ($d2),y
$11:91a0  54 5e 0d      mvn $0d,$5e
$11:91a3  5f a7 75 e8   eor $e875a7,x
$11:91a7  d2 38         cmp ($38)
$11:91a9  b0 ee         bcs $9199
$11:91ab  1c 8f d7      trb $d78f
$11:91ae  63 f5         adc $f5,s
$11:91b0  ca            dex
$11:91b1  7c 33 ef      jmp ($ef33,x)
$11:91b4  fc b3 ff      jsr ($ffb3,x)
$11:91b7  2e ff bf      rol $bfff
$11:91ba  c2 79         rep #$79
$11:91bc  ff 8e 02 06   sbc $06028e,x
$11:91c0  3d ff a9      and $a9ff,x
$11:91c3  f2 e9         sbc ($e9)
$11:91c5  7c 39 2f      jmp ($2f39,x)
$11:91c8  a6 cb         ldx $cb
$11:91ca  e9 b4 78      sbc #$78b4
$11:91cd  69 1c 1b      adc #$1b1c
$11:91d0  af 96 ab c5   lda $c5ab96
$11:91d4  03 80         ora $80,s
$11:91d6  1c 01 a0      trb $a001
$11:91d9  23 27         and $27,s
$11:91db  f8            sed
$11:91dc  46 bf         lsr $bf
$11:91de  f3 af         sbc ($af,s),y
$11:91e0  fe fe 17      inc $17fe,x
$11:91e3  75 84         adc $84,x
$11:91e5  e5 a6         sbc $a6
$11:91e7  53 b8         eor ($b8,s),y
$11:91e9  65 7e         adc $7e
$11:91eb  65 d5         adc $d5
$11:91ed  a6 76         ldx $76
$11:91ef  60            rts
$11:91f0  9d c8 17      sta $17c8,x
$11:91f3  12 19         ora ($19)
$11:91f5  86 84         stx $84
$11:91f7  43 e6         eor $e6,s
$11:91f9  53 79         eor ($79,s),y
$11:91fb  a4 06         ldy $06
$11:91fd  01 23         ora ($23,x)
$11:91ff  80 58         bra $9259
$11:9201  e0 16 18      cpx #$1816
$11:9204  07 f7         ora [$f7]
$11:9206  a1 ae         lda ($ae,x)
$11:9208  c8            iny
$11:9209  5a            phy
$11:920a  65 95         adc $95
$11:920c  c9 87 ea      cmp #$ea87
$11:920f  99 ab d9      sta $d9ab,y
$11:9212  66 f4         ror $f4
$11:9214  1b            tcs
$11:9215  ba            tsx
$11:9216  04 8e         tsb $8e
$11:9218  61 61         adc ($61,x)
$11:921a  88            dey
$11:921b  7c 25 9e      jmp ($9e25,x)
$11:921e  c9 66 02      cmp #$0266
$11:9221  01 c4         ora ($c4,x)
$11:9223  c0 71 b0      cpy #$b071
$11:9226  18            clc
$11:9227  68            pla
$11:9228  04 32         tsb $32
$11:922a  15 17         ora $17,x
$11:922c  89 ca 62      bit #$62ca
$11:922f  f0 d8         beq $9209
$11:9231  2c 2e 13      bit $132e
$11:9234  47 82         eor [$82]
$11:9236  43 64         eor $64,s
$11:9238  b5 3b         lda $3b,x
$11:923a  22 cc 21 91   jsl $9121cc
$11:923e  c9 44 f2      cmp #$f244
$11:9241  15 08         ora $08,x
$11:9243  a3 40         lda $40,s
$11:9245  6d f0 4a      adc $4af0
$11:9248  d4 06         pei ($06)
$11:924a  37 00         and [$00],y
$11:924c  98            tya
$11:924d  54 2d 14      mvn $14,$2d
$11:9250  8c a7 a3      sty $a3a7
$11:9253  61 a0         adc ($a0,x)
$11:9255  69 87 8a      adc #$8a87
$11:9258  41 b2         eor ($b2,x)
$11:925a  92 72         sta ($72)
$11:925c  a4 da         ldy $da
$11:925e  09 06 c2      ora #$c206
$11:9261  71 14         adc ($14),y
$11:9263  9e 54 13      stz $1354,x
$11:9266  01 80         ora ($80,x)
$11:9268  fb            xce
$11:9269  48            pha
$11:926a  3b            tsc
$11:926b  58            cli
$11:926c  0e c2 38      asl $38c2
$11:926f  30 d8         bmi $9249
$11:9271  48            pha
$11:9272  0f fa 41 87   ora $8741fa
$11:9276  99 5a ed      sta $ed5a,y
$11:9279  38            sec
$11:927a  7d a4 8a      adc $8aa4,x
$11:927d  41 85         eor ($85,x)
$11:927f  bc de 24      ldy $24de,x
$11:9282  1f e8 07 7e   ora $7e07e8,x
$11:9286  61 cf         adc ($cf,x)
$11:9288  99 65 e6      sta $e665,y
$11:928b  34 b9         bit $b9,x
$11:928d  97 7f         sta [$7f],y
$11:928f  6d 86 e7      adc $e786
$11:9292  40            rti
$11:9293  19 eb 01      ora $01eb,y
$11:9296  80 c0         bra $9258
$11:9298  a0 50 78      ldy #$7850
$11:929b  64 12         stz $12
$11:929d  20 cf 66      jsr $66cf
$11:92a0  a8            tay
$11:92a1  c0 20 70      cpy #$7020
$11:92a4  08            php
$11:92a5  7c 02 04      jmp ($0402,x)
$11:92a8  ea            nop
$11:92a9  08            php
$11:92aa  13 c4         ora ($c4,s),y
$11:92ac  08            php
$11:92ad  e1 73         sbc ($73,x)
$11:92af  80 7f         bra $9330
$11:92b1  e0 38 29      cpx #$2938
$11:92b4  94 82         sty $82,x
$11:92b6  90 ef         bcc $92a7
$11:92b8  02 38         cop #$38
$11:92ba  3d 4e 21      and $214e,x
$11:92bd  fe a0 73      inc $73a0,x
$11:92c0  30 1b         bmi $92dd
$11:92c2  03 70         ora $70,s
$11:92c4  58            cli
$11:92c5  65 38         adc $38
$11:92c7  0b            phd
$11:92c8  fc 23 c3      jsr ($c323,x)
$11:92cb  4c ed 66      jmp $66ed
$11:92ce  bc 32 da      ldy $da32,x
$11:92d1  44 23 43      mvp $43,$23
$11:92d4  9e 8f 41      stz $418f,x
$11:92d7  2f f0 0f bc   and $bc0ff0
$11:92db  33 e7         and ($e7,s),y
$11:92dd  4c f2 e3      jmp $e3f2
$11:92e0  3a            dec a
$11:92e1  54 cf bd      mvn $bd,$cf
$11:92e4  b6 c3         ldx $c3,y
$11:92e6  73 8c         adc ($8c,s),y
$11:92e8  4f 23 94 a8   eor $a89423
$11:92ec  e6 76         inc $76
$11:92ee  39 89 a1      and $a189,y
$11:92f1  70 e7         bvs $92da
$11:92f3  97 e8         sta [$e8],y
$11:92f5  04 f1         tsb $f1
$11:92f7  9e 53 c8      stz $c853,x
$11:92fa  45 fa         eor $fa
$11:92fc  39 7e 84      and $847e,y
$11:92ff  0f 0d be f0   ora $f0be0d
$11:9303  38            sec
$11:9304  1c 22 19      trb $1922
$11:9307  00 84         brk #$84
$11:9309  44 0b 62      mvp $62,$0b
$11:930c  48            pha
$11:930d  b6 78         ldx $78,y
$11:930f  ec d4 21      cpx $21d4
$11:9312  38            sec
$11:9313  b6 5b         ldx $5b,y
$11:9315  3a            dec a
$11:9316  1f 08 9f c2   ora $c29f08,x
$11:931a  79 7c 97      adc $977c,y
$11:931d  db            stp
$11:931e  fe 17 0a      inc $0a17,x
$11:9321  7f ff 8f ff   adc $ff8fff,x
$11:9325  c9 ff e1      cmp #$e1ff
$11:9328  e8            inx
$11:9329  41 81         eor ($81,x)
$11:932b  df e2 17 f8   cmp $f817e2,x
$11:932f  7d ff 35      adc $35ff,x
$11:9332  1a            inc a
$11:9333  38            sec
$11:9334  94 5a         sty $5a,x
$11:9336  3d 90 8f      and $8f90,x
$11:9339  5e 2f 9e      lsr $9e2f,x
$11:933c  8f 64 7a 39   sta $397a64
$11:9340  e4 ff         cpx $ff
$11:9342  71 bf         adc ($bf),y
$11:9344  d9 2f f7      cmp $f72f,y
$11:9347  81 48         sta ($48,x)
$11:9349  38            sec
$11:934a  0f e4 43 f9   ora $f943e4
$11:934e  e0 fe 45      cpx #$45fe
$11:9351  22 11 98 c5   jsl $c59811
$11:9355  f2 f9         sbc ($f9)
$11:9357  36 bb         rol $bb,x
$11:9359  42 27         wdm #$27
$11:935b  11 b9         ora ($b9),y
$11:935d  c4 52         cpy $52
$11:935f  69 37 bb      adc #$bb37
$11:9362  db            stp
$11:9363  ef f6 7b fa   sbc $fa7bf6
$11:9367  24 21         bit $21
$11:9369  37 f8         and [$f8],y
$11:936b  3c fd 8e      bit $8efd,x
$11:936e  10 b9         bpl $9329
$11:9370  fc 22 ff      jsr ($ff22,x)
$11:9373  94 82         sty $82,x
$11:9375  73 a1         adc ($a1,s),y
$11:9377  d1 d8         cmp ($d8),y
$11:9379  ec c2 69      cpx $69c2
$11:937c  0a            asl a
$11:937d  87 64         sta [$64]
$11:937f  63 f3         adc $f3,s
$11:9381  09 ef ab      ora #$abef
$11:9384  d9 f8 fe      cmp $fef8,y
$11:9387  7c 3f de      jmp ($de3f,x)
$11:938a  2f ff 2f ff   and $ff2fff
$11:938e  f1 ff         sbc ($ff),y
$11:9390  f8            sed
$11:9391  3f fc 0f ea   and $ea0ffc,x
$11:9395  ac 25 be      ldy $be25
$11:9398  19 9f ce      ora $ce9f,y
$11:939b  83 ff         sta $ff,s
$11:939d  8a            txa
$11:939e  7d fc 76      adc $76fc,x
$11:93a1  3a            dec a
$11:93a2  0f 76 09 a2   ora $a20976
$11:93a6  81 77         sta ($77,x)
$11:93a8  63 df         adc $df,s
$11:93aa  f9 97 36      sbc $3697,y
$11:93ad  ff 80 e4 cf   sbc $cfe480,x
$11:93b1  a3 97         lda $97,s
$11:93b3  f9 f7 fe      sbc $fef7,y
$11:93b6  fe 0a 18      inc $180a,x
$11:93b9  5f 0d e2 51   eor $51e20d,x
$11:93bd  8f 9b dd a7   sta $a7dd9b
$11:93c1  80 03         bra $93c6
$11:93c3  e6 81         inc $81
$11:93c5  9f 79 03 af   sta $af0379,x
$11:93c9  c0 21 f0      cpy #$f021
$11:93cc  08            php
$11:93cd  38            sec
$11:93ce  d0 60         bne $9430
$11:93d0  64 c3         stz $c3
$11:93d2  a0 17 f6      ldy #$f617
$11:93d5  7b            tdc
$11:93d6  c0 fd 40      cpy #$40fd
$11:93d9  3e 10 0f      rol $0f10,x
$11:93dc  01 50         ora ($50,x)
$11:93de  78            sei
$11:93df  03 a3         ora $a3,s
$11:93e1  81 10         sta ($10,x)
$11:93e3  36 e3         rol $e3,x
$11:93e5  09 8c c3      ora #$c38c
$11:93e8  23 b1         and $b1,s
$11:93ea  98            tya
$11:93eb  7c 13 1f      jmp ($1f13,x)
$11:93ee  01 ea         ora ($ea,x)
$11:93f0  cc 2a 91      cpy $912a
$11:93f3  ef d5 5a 0d   sbc $0d5ad5
$11:93f7  01 1c         ora ($1c,x)
$11:93f9  84 3a         sty $3a
$11:93fb  13 9f         ora ($9f,s),y
$11:93fd  82 77 a0      brl $3477
$11:9400  3c f8 07      bit $07f8,x
$11:9403  86 01         stx $01
$11:9405  21 80         and ($80,x)
$11:9407  63 a2         adc $a2,s
$11:9409  19 89 86      ora $8689,y
$11:940c  e2 31         sep #$31
$11:940e  f0 90         beq $93a0
$11:9410  7c 60 1a      jmp ($1a60,x)
$11:9413  b8            clv
$11:9414  66 aa         ror $aa
$11:9416  f1 d7         sbc ($d7),y
$11:9418  b1 78         lda ($78),y
$11:941a  30 05         bmi $9421
$11:941c  90 f8         bcc $9416
$11:941e  64 3f         stz $3f
$11:9420  32 0f         and ($0f)
$11:9422  de 03 e7      dec $e703,x
$11:9425  00 c3         brk #$c3
$11:9427  e0 31         cpx #$31
$11:9429  90 0b         bcc $9436
$11:942b  7c 8a 7a      jmp ($7a8a,x)
$11:942e  34 12         bit $12,x
$11:9430  f8            sed
$11:9431  0d 48 be      ora $be48
$11:9434  10 18         bpl $944e
$11:9436  04 45         tsb $45
$11:9438  00 30         brk #$30
$11:943a  38            sec
$11:943b  10 d4         bpl $9411
$11:943d  20 cc 61      jsr $61cc
$11:9440  1b            tcs
$11:9441  97 da         sta [$da],y
$11:9443  89 fc         bit #$fc
$11:9445  a0 0f         ldy #$0f
$11:9447  c3 00         cmp $00,s
$11:9449  3a            dec a
$11:944a  38            sec
$11:944b  41 50         eor ($50,x)
$11:944d  71 0d         adc ($0d),y
$11:944f  41 6a         eor ($6a,x)
$11:9451  a0 e8         ldy #$e8
$11:9453  23 05         and $05,s
$11:9455  21 a1         and ($a1,x)
$11:9457  c7 b3         cmp [$b3]
$11:9459  37 cb         and [$cb],y
$11:945b  fd 02 9d      sbc $9d02,x
$11:945e  00 d8         brk #$d8
$11:9460  cc 3f f4      cpy $f43f
$11:9463  02 c8         cop #$c8
$11:9465  0f c3 c2 80   ora $80c2c3
$11:9469  19 fc 2b      ora $2bfc,y
$11:946c  ff 00 e7 38   sbc $38e700,x
$11:9470  0e 81 00      asl $0081
$11:9473  4d 95 d9      eor $d995
$11:9476  a0 04         ldy #$04
$11:9478  07 c3         ora [$c3]
$11:947a  c0 15         cpy #$15
$11:947c  a0 df         ldy #$df
$11:947e  02 06         cop #$06
$11:9480  2f 45 b4 24   and $24b445
$11:9484  a2 98         ldx #$98
$11:9486  0b            phd
$11:9487  bc 70 6c      ldy $6c70,x
$11:948a  d0 6d         bne $94f9
$11:948c  84 40         sty $40
$11:948e  70 32         bvs $94c2
$11:9490  02 d8         cop #$d8
$11:9492  89 36         bit #$36
$11:9494  b3 d8         lda ($d8,s),y
$11:9496  97 e3         sta [$e3],y
$11:9498  fb            xce
$11:9499  75 fd         adc $fd,x
$11:949b  85 fe         sta $fe
$11:949d  8f 38 9f ad   sta $ad9f38
$11:94a1  84 70         sty $70
$11:94a3  12 7f         ora ($7f)
$11:94a5  fd c3 ff      sbc $ffc3,x
$11:94a8  20 bf c0      jsr $c0bf
$11:94ab  10 81         bpl $942e
$11:94ad  38            sec
$11:94ae  12 24         ora ($24)
$11:94b0  d2 6d         cmp ($6d)
$11:94b2  e8            inx
$11:94b3  f1 6d         sbc ($6d),y
$11:94b5  be 91 af      ldx $af91,y
$11:94b8  e7 12         sbc [$12]
$11:94ba  71 f8         adc ($f8),y
$11:94bc  80 3e         bra $94fc
$11:94be  c0 70         cpy #$70
$11:94c0  1c 8f f4      trb $f48f
$11:94c3  73 fd         adc ($fd,s),y
$11:94c5  08            php
$11:94c6  0a            asl a
$11:94c7  80 54         bra $951d
$11:94c9  11 0b         ora ($0b),y
$11:94cb  d8            cld
$11:94cc  ac 52 79      ldy $7952
$11:94cf  13 7c         ora ($7c,s),y
$11:94d1  3f 2e 9e 75   and $759e2e,x
$11:94d5  43 e8         eor $e8,s
$11:94d7  df e6 ff fb   cmp $fbffe6,x
$11:94db  c7 fe         cmp [$fe]
$11:94dd  60            rts
$11:94de  84 7a         sty $7a
$11:94e0  a4 5b         ldy $5b
$11:94e2  49 26         eor #$26
$11:94e4  fd 7f 38      sbc $387f,x
$11:94e7  5f c9 f7 01   eor $01f7c9,x
$11:94eb  4c 09 90      jmp $9009
$11:94ee  1c 07 a3      trb $a307
$11:94f1  fd d8 ff      sbc $ffd8,x
$11:94f4  29 45         and #$45
$11:94f6  4c 09 b2      jmp $b209
$11:94f9  12 2c         ora ($2c)
$11:94fb  10 58         bpl $9555
$11:94fd  f0 47         beq $9546
$11:94ff  99 bc c8      sta $c8bc,y
$11:9502  66 0f         ror $0f
$11:9504  94 19         sty $19,x
$11:9506  84 0e         sty $0e
$11:9508  0b            phd
$11:9509  03 81         ora $81,s
$11:950b  c5 e2         cmp $e2
$11:950d  79 7c 5e      adc $5e7c,y
$11:9510  1e 0b 67      asl $670b,x
$11:9513  88            dey
$11:9514  c0 f0         cpy #$f0
$11:9516  65 40         adc $40
$11:9518  a1 c0         lda ($c0,x)
$11:951a  64 f0         stz $f0
$11:951c  39 bc 4e      and $4ebc,y
$11:951f  2f 03 e7 c1   and $c1e703
$11:9523  6d f0 1b      adc $1bf0
$11:9526  f9 50 09      sbc $0950,y
$11:9529  04 58         tsb $58
$11:952b  09 41         ora #$41
$11:952d  5c e0 4f 27   jml $274fe0
$11:9531  75 43         adc $43,x
$11:9533  cc 70 30      cpy $3070
$11:9536  11 e0         ora ($e0),y
$11:9538  42 a0         wdm #$a0
$11:953a  15 fe         ora $fe,x
$11:953c  17 af         ora [$af],y
$11:953e  15 cf         ora $cf,x
$11:9540  81 93         sta ($93,x)
$11:9542  d2 2d         cmp ($2d)
$11:9544  00 87         brk #$87
$11:9546  b1 c2         lda ($c2),y
$11:9548  85 7f         sta $7f
$11:954a  85 7f         sta $7f
$11:954c  c5 c5         cmp $c5
$11:954e  30 80         bmi $94d0
$11:9550  52 60         eor ($60)
$11:9552  14 c3         trb $c3
$11:9554  88            dey
$11:9555  8f 00 16 12   sta $121600
$11:9559  61 fe         adc ($fe,x)
$11:955b  01 ca         ora ($ca,x)
$11:955d  01 60         ora ($60,x)
$11:955f  17 84         ora [$84],y
$11:9561  32 3f         and ($3f)
$11:9563  16 f8         asl $f8,x
$11:9565  5a            phy
$11:9566  7c 36 b8      jmp ($b836,x)
$11:9569  5e 3c ce      lsr $ce3c,x
$11:956c  03 f5         ora $f5,s
$11:956e  33 84         and ($84,s),y
$11:9570  7a            ply
$11:9571  01 f4         ora ($f4,x)
$11:9573  80 7c         bra $95f1
$11:9575  20 16 f9      jsr $f916
$11:9578  14 fe         trb $fe
$11:957a  04 7a         tsb $7a
$11:957c  21 79         and ($79,x)
$11:957e  44 60 10      mvp $10,$60
$11:9581  75 d0         adc $d0,x
$11:9583  82 c1 6a      brl $0047
$11:9586  82 f0 8c      brl $2279
$11:9589  19 87 ed      ora $ed87,y
$11:958c  44 de 40      mvp $40,$de
$11:958f  3c 10 0a      bit $0a10,x
$11:9592  03 48         ora $48,s
$11:9594  5a            phy
$11:9595  65 80         adc $80
$11:9597  80 62         bra $95fb
$11:9599  30 1c         bmi $95b7
$11:959b  08            php
$11:959c  07 02         ora [$02]
$11:959e  80 d3         bra $9573
$11:95a0  04 90         tsb $90
$11:95a2  24 81         bit $81
$11:95a4  a6 0e         ldx $0e
$11:95a6  10 aa         bpl $9552
$11:95a8  47 bf         eor [$bf]
$11:95aa  55 6b         eor $6b,x
$11:95ac  7c 86 7e      jmp ($7e86,x)
$11:95af  c2 7f         rep #$7f
$11:95b1  0c 02 42      tsb $4202
$11:95b4  37 31         and [$31],y
$11:95b6  fb            xce
$11:95b7  66 af         ror $af
$11:95b9  1e 19 f7      asl $f719,x
$11:95bc  fa            plx
$11:95bd  05 72         ora $72
$11:95bf  80 63         bra $9624
$11:95c1  61 97         adc ($97,x)
$11:95c3  f8            sed
$11:95c4  13 04         ora ($04,s),y
$11:95c6  07 81         ora [$81]
$11:95c8  87 70         sta [$70]
$11:95ca  0f f2 a1 ff   ora $ffa1f2
$11:95ce  80 5c         bra $962c
$11:95d0  d8            cld
$11:95d1  06 7a         asl $7a
$11:95d3  02 f8         cop #$f8
$11:95d5  45 e2         eor $e2
$11:95d7  06 70         asl $70
$11:95d9  97 c8         sta [$c8],y
$11:95db  23 f0         and $f0,s
$11:95dd  08            php
$11:95de  cc 02 29      cpy $2902
$11:95e1  04 a5         tsb $a5
$11:95e3  d8            cld
$11:95e4  e0 70 78      cpx #$7870
$11:95e7  7c 7c 84      jmp ($847c,x)
$11:95ea  33 f2         and ($f2,s),y
$11:95ec  31 4e         and ($4e),y
$11:95ee  e7 f1         sbc [$f1]
$11:95f0  cb            wai
$11:95f1  ff 03 81 20   sbc $208103,x
$11:95f5  90 64         bcc $965b
$11:95f7  22 1d 08 87   jsl $87081d
$11:95fb  22 11 88 84   jsl $848811
$11:95ff  16 83         asl $83,x
$11:9601  31 98         and ($98),y
$11:9603  71 07         adc ($07),y
$11:9605  03 c1         ora $c1,s
$11:9607  e0 f8 18      cpx #$18f8
$11:960a  c3 e1         cmp $e1,s
$11:960c  f8            sed
$11:960d  33 95         and ($95,s),y
$11:960f  83 f0         sta $f0,s
$11:9611  a2 01 7e      ldx #$7e01
$11:9614  28            plp
$11:9615  80 7f         bra $9696
$11:9617  8a            txa
$11:9618  20 27 e3      jsr $e327
$11:961b  14 4c         trb $4c
$11:961d  16 6f         asl $6f,x
$11:961f  f4 07 a4      pea $a407
$11:9622  7f 80 a3 b8   adc $b8a380,x
$11:9626  0c 06 04      tsb $0406
$11:9629  51 08         eor ($08),y
$11:962b  43 c4         eor $c4,s
$11:962d  1b            tcs
$11:962e  c1 17         cmp ($17,x)
$11:9630  87 c5         sta [$c5]
$11:9632  60            rts
$11:9633  91 46         sta ($46),y
$11:9635  f8            sed
$11:9636  0a            asl a
$11:9637  c1 e6         cmp ($e6,x)
$11:9639  22 c1 6f 84   jsl $846fc1
$11:963d  2d e0 10      and $10e0
$11:9640  0b            phd
$11:9641  5d aa bf      eor $bfaa,x
$11:9644  0a            asl a
$11:9645  ef c3 3f 78   sbc $783fc3
$11:9649  9f ff 56 73   sta $7356ff,x
$11:964d  11 ef         ora ($ef),y
$11:964f  c5 2e         cmp $2e
$11:9651  f0 6a         beq $96bd
$11:9653  fd 2a ff      sbc $ff2a,x
$11:9656  0a            asl a
$11:9657  ff c3 2f f0   sbc $f02fc3,x
$11:965b  9b            txy
$11:965c  fd 57 ff      sbc $ff57,x
$11:965f  11 fd         ora ($fd),y
$11:9661  c4 3f         cpy $3f
$11:9663  70 28         bvs $968d
$11:9665  2b            pld
$11:9666  c4 22         cpy $22
$11:9668  54 18 84      mvn $84,$18
$11:966b  06 49         asl $49
$11:966d  07 93         ora [$93]
$11:966f  41 24         eor ($24,x)
$11:9671  92 c9         sta ($c9)
$11:9673  75 42         adc $42,x
$11:9675  e6 be         inc $be
$11:9677  00 08         brk #$08
$11:9679  50 d8         bvc $9653
$11:967b  00 00         brk #$00
$11:967d  10 08         bpl $9687
$11:967f  42 5b         wdm #$5b
$11:9681  c3 97         cmp $97,s
$11:9683  83 f1         sta $f1,s
$11:9685  e8            inx
$11:9686  b8            clv
$11:9687  f8            sed
$11:9688  4c ee 43      jmp $43ee
$11:968b  d3 a9         cmp ($a9,s),y
$11:968d  73 21         adc ($21,s),y
$11:968f  97 38         sta [$38],y
$11:9691  9c ea 01      stz $01ea
$11:9694  ff 83 ef e0   sbc $e0ef83,x
$11:9698  bf f8 4f 7e   lda $7e4ff8,x
$11:969c  03 ef         ora $ef,s
$11:969e  a1 7c         lda ($7c,x)
$11:96a0  e0 1f c8      cpx #$c81f
$11:96a3  87 fd         sta [$fd]
$11:96a5  80 10         bra $96b7
$11:96a7  38            sec
$11:96a8  14 3a         trb $3a
$11:96aa  0d 4c 83      ora $834c
$11:96ad  52 20         eor ($20)
$11:96af  30 88         bmi $9639
$11:96b1  1c fe 07      trb $07fe
$11:96b4  47 81         eor [$81]
$11:96b6  51 9f         eor ($9f),y
$11:96b8  e4 45         cpx $45
$11:96ba  08            php
$11:96bb  3a            dec a
$11:96bc  10 51         bpl $970f
$11:96be  04 01         tsb $01
$11:96c0  0b            phd
$11:96c1  c5 ff         cmp $ff
$11:96c3  41 ff         eor ($ff,x)
$11:96c5  e0 7d 28      cpx #$287d
$11:96c8  16 84         asl $84,x
$11:96ca  a8            tay
$11:96cb  58            cli
$11:96cc  2d 90 09      and $0990
$11:96cf  bf 42 31 80   lda $803142,x
$11:96d3  44 1a 7c      mvp $7c,$1a
$11:96d6  14 a5         trb $a5
$11:96d8  c0 80 78      cpy #$7880
$11:96db  1d e1 13      ora $13e1,x
$11:96de  91 59         sta ($59),y
$11:96e0  a8            tay
$11:96e1  b6 ca         ldx $ca,y
$11:96e3  3d 72 ad      and $ad72,x
$11:96e6  74 91         stz $91,x
$11:96e8  c8            iny
$11:96e9  21 74         and ($74,x)
$11:96eb  18            clc
$11:96ec  1d 0a 27      ora $270a,x
$11:96ef  00 b3         brk #$b3
$11:96f1  40            rti
$11:96f2  6d b0 2a      adc $2ab0
$11:96f5  fc 02 ed      jsr ($ed02,x)
$11:96f8  09 91 c7      ora #$c791
$11:96fb  29 f3 1a      and #$1af3
$11:96fe  39 74 23      and $2374,y
$11:9701  91 09         sta ($09),y
$11:9703  dc de ff      jml [$ffde]
$11:9706  52 ed         eor ($ed)
$11:9708  54 3a 14      mvn $14,$3a
$11:970b  de 45 07      dec $0745,x
$11:970e  83 3f         sta $3f,s
$11:9710  b1 c7         lda ($c7),y
$11:9712  20 13 b8      jsr $b813
$11:9715  05 fe         ora $fe
$11:9717  01 da         ora ($da,x)
$11:9719  92 f4         sta ($f4)
$11:971b  25 fc         and $fc
$11:971d  f9 87 1e      sbc $1e87,y
$11:9720  73 7f         adc ($7f,s),y
$11:9722  22 84 60 dc   jsl $dc6084
$11:9726  32 f8         and ($f8)
$11:9728  25 72         and $72
$11:972a  2d 74 a0      and $a074
$11:972d  78            sei
$11:972e  35 7a         and $7a,x
$11:9730  1c de 4d      trb $4dde
$11:9733  e0 30 09      cpx #$0930
$11:9736  7c 02 b9      jmp ($b902,x)
$11:9739  03 63         ora $63,s
$11:973b  87 8e         sta [$8e]
$11:973d  39 af a8      and $a8af,y
$11:9740  e7 ec         sbc [$ec]
$11:9742  66 f0         ror $f0
$11:9744  82 41 e0      brl $7788
$11:9747  d0 e8         bne $9731
$11:9749  4c 66 25      jmp $2566
$11:974c  30 92         bmi $96e0
$11:974e  c8            iny
$11:974f  25 3e         and $3e
$11:9751  09 df c9      ora #$c9df
$11:9754  06 50         asl $50
$11:9756  e8            inx
$11:9757  0c 66 0d      tsb $0d66
$11:975a  32 86         and ($86)
$11:975c  c9 e3 1e      cmp #$1ee3
$11:975f  f3 60         sbc ($60,s),y
$11:9761  40            rti
$11:9762  a4 f1         ldy $f1
$11:9764  fa            plx
$11:9765  dd 0e 41      cmp $410e,x
$11:9768  32 90         and ($90)
$11:976a  43 a7         eor $a7,s
$11:976c  35 c9         and $c9,x
$11:976e  85 62         sta $62
$11:9770  ab            plb
$11:9771  7d fc 5f      adc $5ffc,x
$11:9774  ea            nop
$11:9775  15 f9         ora $f9,x
$11:9777  25 9e         and $9e
$11:9779  1b            tcs
$11:977a  3f 88 c7 e0   and $e0c788,x
$11:977e  75 f8         adc $f8,x
$11:9780  3d 7e 04      and $047e,x
$11:9783  e3 0b         sbc $0b,s
$11:9785  ff c3 e1 30   sbc $30e1c3,x
$11:9789  98            tya
$11:978a  79 24 98      adc $9824,y
$11:978d  88            dey
$11:978e  44 e2 71      mvp $71,$e2
$11:9791  b4 f8         ldy $f8,x
$11:9793  5c 3e 1d 6e   jml $6e1d3e
$11:9797  24 23         bit $23
$11:9799  f1 c8         sbc ($c8),y
$11:979b  fc 76 3f      jsr ($3f76,x)
$11:979e  9f 4f e7 13   sta $13e74f,x
$11:97a2  f9 0c 34      sbc $340c,y
$11:97a5  0c e3 f9      tsb $f9e3
$11:97a8  43 b9         eor $b9,s
$11:97aa  8b            phb
$11:97ab  ca            dex
$11:97ac  45 32         eor $32
$11:97ae  91 42         sta ($42),y
$11:97b0  e7 d5         sbc [$d5]
$11:97b2  f9 ed 7f      sbc $7fed,y
$11:97b5  b1 7e         lda ($7e),y
$11:97b7  86 0f         stx $0f
$11:97b9  96 29         stx $29,y
$11:97bb  1f 80 31 42   ora $423180,x
$11:97bf  bf 01 bf e6   lda $e6bf01,x
$11:97c3  33 04         and ($04,s),y
$11:97c5  f2 e4         sbc ($e4)
$11:97c7  42 2b         wdm #$2b
$11:97c9  91 cc         sta ($cc),y
$11:97cb  46 62         lsr $62
$11:97cd  49 30 80      eor #$8030
$11:97d0  48            pha
$11:97d1  2c 1f 82      bit $821f
$11:97d4  f9 7c 3f      sbc $3f7c,y
$11:97d7  1e 0f e5      asl $e50f,x
$11:97da  93 f9         sta ($f9,s),y
$11:97dc  cc fe 77      cpy $77fe
$11:97df  3f 94 bb 18   and $18bb94,x
$11:97e3  bc 2b 54      ldy $542b,x
$11:97e6  29 1c d2      and #$d21c
$11:97e9  45 0c         eor $0c
$11:97eb  92 d7         sta ($d7)
$11:97ed  66 35         ror $35
$11:97ef  1e 1d 8a      asl $8a1d,x
$11:97f2  38            sec
$11:97f3  3e 19 2d      rol $2d19,x
$11:97f6  9e 17 3f      stz $3f17,x
$11:97f9  89 c7 e0      bit #$e0c7
$11:97fc  55 f8         eor $f8,x
$11:97fe  75 7e         adc $7e,x
$11:9800  39 7e 47      and $477e,y
$11:9803  94 a2         sty $a2,x
$11:9805  41 74         eor ($74,x)
$11:9807  a2 62 39      ldx #$3962
$11:980a  13 0f         ora ($0f,s),y
$11:980c  86 f2         stx $f2
$11:980e  f1 58         sbc ($58),y
$11:9810  fc 27 cb      jsr ($cb27,x)
$11:9813  b1 f8         lda ($f8),y
$11:9815  dc 7f 26      jml [$267f]
$11:9818  86 81         stx $81
$11:981a  82 5f 20      brl $b87c
$11:981d  8e a0 8b      stx $8ba0
$11:9820  c0 9e 01      cpy #$019e
$11:9823  0b            phd
$11:9824  90 c8         bcc $97ee
$11:9826  e0 30 08      cpx #$0830
$11:9829  04 0a         tsb $0a
$11:982b  01 01         ora ($01,x)
$11:982d  82 41 1f      brl $b771
$11:9830  02 fa         cop #$fa
$11:9832  04 e8         tsb $e8
$11:9834  48            pha
$11:9835  1e e2 08      asl $08e2,x
$11:9838  17 e8         ora [$e8],y
$11:983a  44 e0 56      mvp $56,$e0
$11:983d  2e 07 53      rol $5307
$11:9840  21 0c         and ($0c,x)
$11:9842  fc 78 fc      jsr ($fc78,x)
$11:9845  53 99         eor ($99,s),y
$11:9847  94 0f         sty $0f,x
$11:9849  0f 01 b0 5f   ora $5fb001
$11:984d  e0 53 f8      cpx #$f853
$11:9850  05 be         ora $be
$11:9852  01 07         ora ($07,x)
$11:9854  80 4b         bra $98a1
$11:9856  64 10         stz $10
$11:9858  90 40         bcc $989a
$11:985a  c4 60         cpy $60
$11:985c  12 39         ora ($39)
$11:985e  90 b0         bcc $9810
$11:9860  5e e0 fe      lsr $fee0,x
$11:9863  09 14 02      ora #$0214
$11:9866  a0 9d 07      ldy #$079d
$11:9869  c0 01 d2      cpy #$d201
$11:986c  20 08 30      jsr $3008
$11:986f  41 63         eor ($63,x)
$11:9871  f0 d2         beq $9845
$11:9873  ab            plb
$11:9874  44 3f 7f      mvp $7f,$3f
$11:9877  53 ae         eor ($ae,s),y
$11:9879  ca            dex
$11:987a  e5 f1         sbc $f1
$11:987c  0c 84 02      tsb $0284
$11:987f  33 40         and ($40,s),y
$11:9881  80 5f         bra $98e2
$11:9883  e0 d1 70      cpx #$70d1
$11:9886  40            rti
$11:9887  be 80 8a      ldx $8a80,y
$11:988a  85 d0         sta $d0
$11:988c  80 51         bra $98df
$11:988e  e0 13 b8      cpx #$b813
$11:9891  0c 0c 58      tsb $580c
$11:9894  10 8b         bpl $9821
$11:9896  c4 13         cpy $13
$11:9898  39 02 cb      and $cb02,y
$11:989b  40            rti
$11:989c  2c 24 67      bit $6724
$11:989f  23 29         and $29,s
$11:98a1  48            pha
$11:98a2  3a            dec a
$11:98a3  fd 3d 5f      sbc $5f3d,x
$11:98a6  a2 39 bc      ldx #$bc39
$11:98a9  89 df e0      bit #$e0df
$11:98ac  f4 f8 04      pea $04f8
$11:98af  df 01 c0 f8   cmp $f8c001,x
$11:98b3  40            rti
$11:98b4  25 90         and $90
$11:98b6  03 08         ora $08,s
$11:98b8  1d 00 8c      ora $8c00,x
$11:98bb  d2 fb         cmp ($fb)
$11:98bd  1c a6 c3      trb $c3a6
$11:98c0  25 90         and $90
$11:98c2  44 2e 12      mvp $12,$2e
$11:98c5  3b            tsc
$11:98c6  d4 32         pei ($32)
$11:98c8  79 03 87      adc $8703,y
$11:98cb  be 02 df      ldx $df02,y
$11:98ce  13 b7         ora ($b7,s),y
$11:98d0  c4 64         cpy $64
$11:98d2  f1 8b         sbc ($8b),y
$11:98d4  84 3e         sty $3e
$11:98d6  f7 04         sbc [$04],y
$11:98d8  5d 19 38      eor $3819,x
$11:98db  38            sec
$11:98dc  3a            dec a
$11:98dd  1f 0d 9a c1   ora $c19a0d,x
$11:98e1  11 98         ora ($98),y
$11:98e3  43 23         eor $23,s
$11:98e5  90 68         bcc $994f
$11:98e7  72 90         adc ($90)
$11:98e9  b9 f3 1f      lda $1ff3,y
$11:98ec  3c 66 cf      bit $cf66,x
$11:98ef  18            clc
$11:98f0  98            tya
$11:98f1  c3 a3         cmp $a3,s
$11:98f3  90 38         bcc $992d
$11:98f5  71 cc         adc ($cc),y
$11:98f7  47 a1         eor [$a1]
$11:98f9  b7 c1         lda [$c1],y
$11:98fb  57 f8         eor [$f8],y
$11:98fd  33 8b         and ($8b,s),y
$11:98ff  c4 0a         cpy $0a
$11:9901  61 08         adc ($08,x)
$11:9903  cc 51 2d      cpy $2d51
$11:9906  93 8b         sta ($8b,s),y
$11:9908  db            stp
$11:9909  b4 69         ldy $69,x
$11:990b  5d f9 0d      eor $0df9,x
$11:990e  ee 09 32      inc $3209
$11:9911  86 e6         stx $e6
$11:9913  20 f6 c8      jsr $c8f6
$11:9916  1b            tcs
$11:9917  f0 60         beq $9979
$11:9919  12 7b         ora ($7b)
$11:991b  1c c6 e3      trb $e3c6
$11:991e  25 d0         and $d0
$11:9920  41 7e         eor ($7e,x)
$11:9922  97 9f         sta [$9f],y
$11:9924  c4 86         cpy $86
$11:9926  c3 1e         cmp $1e,s
$11:9928  9f c0 23 d6   sta $d623c0,x
$11:992c  78            sei
$11:992d  dd de 13      cmp $13de,x
$11:9930  a7 8c         lda [$8c]
$11:9932  7d 61 5f      adc $5f61,x
$11:9935  98            tya
$11:9936  30 68         bmi $99a0
$11:9938  dd c1 37      cmp $37c1,x
$11:993b  ea            nop
$11:993c  51 37         eor ($37),y
$11:993e  d7 ee         cmp [$ee],y
$11:9940  1c ef d1      trb $d1ef
$11:9943  10 bb         bpl $9900
$11:9945  44 25 f1      mvp $f1,$25
$11:9948  f8            sed
$11:9949  fc 02 91      jsr ($9102,x)
$11:994c  7f 9d df e0   adc $e0df9d,x
$11:9950  37 f8         and [$f8],y
$11:9952  24 fe         bit $fe
$11:9954  1f 1f 23 84   ora $84231f,x
$11:9958  00 7a         brk #$7a
$11:995a  10 0d         bpl $9969
$11:995c  56 b2         lsr $b2,x
$11:995e  6d 38 a7      adc $a738
$11:9961  5c 35 db 0d   jml $0ddb35
$11:9965  74 c3         stz $c3,x
$11:9967  b9 e0 9c      lda $9ce0,y
$11:996a  70 38         bvs $99a4
$11:996c  10 0a         bpl $9978
$11:996e  87 f3         sta [$f3]
$11:9970  81 f8         sta ($f8,x)
$11:9972  c0 7c 28      cpy #$287c
$11:9975  1f 04 f0 f8   ora $f8f004,x
$11:9979  20 05 d0      jsr $d005
$11:997c  80 7d         bra $99fb
$11:997e  6e fa c8      ror $c8fa
$11:9981  7f 62 b1 8f   adc $8fb162,x
$11:9985  b7 e8         lda [$e8],y
$11:9987  a8            tay
$11:9988  1d 9a 0c      ora $0c9a,x
$11:998b  f2 fe         sbc ($fe)
$11:998d  1c 08 45      trb $4508
$11:9990  fe e1 7f      inc $7fe1,x
$11:9993  93 df         sta ($df,s),y
$11:9995  e2 07         sep #$07
$11:9997  c0 bf cf      cpy #$cfbf
$11:999a  af f0 04 50   lda $5004f0
$11:999e  40            rti
$11:999f  29 d6 48      and #$48d6
$11:99a2  57 33         eor [$33],y
$11:99a4  ed f8 8f      sbc $8ff8
$11:99a7  78            sei
$11:99a8  37 dc         and [$dc],y
$11:99aa  0b            phd
$11:99ab  e1 8c         sbc ($8c,x)
$11:99ad  20 18 08      jsr $0818
$11:99b0  06 63         asl $63
$11:99b2  f9 30 fe      sbc $fe30,y
$11:99b5  40            rti
$11:99b6  3f 06 93 4e   and $4e9306,x
$11:99ba  80 30         bra $99ec
$11:99bc  7a            ply
$11:99bd  d7 5e         cmp [$5e],y
$11:99bf  1d 7f 5d      ora $5d7f,x
$11:99c2  6e 1a 85      ror $851a
$11:99c5  da            phx
$11:99c6  19 3a 83      ora $833a,y
$11:99c9  43 60         eor $60,s
$11:99cb  70 73         bvs $9a40
$11:99cd  f0 5f         beq $9a2e
$11:99cf  64 17         stz $17
$11:99d1  f8            sed
$11:99d2  89 10 60      bit #$6010
$11:99d5  70 f8         bvs $99cf
$11:99d7  0a            asl a
$11:99d8  f4 1d 63      pea $631d
$11:99db  36 fa         rol $fa,x
$11:99dd  7e bf 93      ror $93bf,x
$11:99e0  29 e7 ab      and #$abe7
$11:99e3  f9 2a 86      sbc $862a,y
$11:99e6  75 a3         adc $a3,x
$11:99e8  1e cf 81      asl $81cf,x
$11:99eb  a0 21 0a      ldy #$0a21
$11:99ee  20 30 03      jsr $0330
$11:99f1  80 7e         bra $9a71
$11:99f3  1f cf 02 90   ora $9002cf,x
$11:99f7  0d 01 00      ora $0001
$11:99fa  00 20         brk #$20
$11:99fc  83 c1         sta $c1,s
$11:99fe  e1 70         sbc ($70,x)
$11:9a00  88            dey
$11:9a01  fc 62 2f      jsr ($2f62,x)
$11:9a04  10 7a         bpl $9a80
$11:9a06  95 8e         sta $8e,x
$11:9a08  e1 8b         sbc ($8b,x)
$11:9a0a  cc 40 1d      cpy $1d40
$11:9a0d  e1 0f         sbc ($0f,x)
$11:9a0f  83 c7         sta $c7,s
$11:9a11  e1 e0         sbc ($e0,x)
$11:9a13  44 bf d9      mvp $d9,$bf
$11:9a16  ff fe 0f 07   sbc $070ffe,x
$11:9a1a  42 21         wdm #$21
$11:9a1c  e8            inx
$11:9a1d  84 76         sty $76
$11:9a1f  21 1b         and ($1b,x)
$11:9a21  6c 37 37      jmp ($3737)
$11:9a24  3b            tsc
$11:9a25  42 d2         wdm #$d2
$11:9a27  76 e8         ror $e8,x
$11:9a29  90 00         bcc $9a2b
$11:9a2b  78            sei
$11:9a2c  7c 3e 1f      jmp ($1f3e,x)
$11:9a2f  81 18         sta ($18,x)
$11:9a31  5e 3f d6      lsr $d63f,x
$11:9a34  2b            pld
$11:9a35  7c ee 5f      jmp ($5fee,x)
$11:9a38  bb            tyx
$11:9a39  87 c0         sta [$c0]
$11:9a3b  20 10 38      jsr $3810
$11:9a3e  1c 16 08      trb $0816
$11:9a41  f1 08         sbc ($08),y
$11:9a43  6c 22 6d      jmp ($6d22)
$11:9a46  30 ac         bmi $99f4
$11:9a48  d7 24         cmp [$24],y
$11:9a4a  31 21         and ($21),y
$11:9a4c  78            sei
$11:9a4d  0c 04 00      tsb $0004
$11:9a50  50 f8         bvc $9a4a
$11:9a52  7c fe 47      jmp ($47fe,x)
$11:9a55  7b            tdc
$11:9a56  b7 5e         lda [$5e],y
$11:9a58  85 e0         sta $e0
$11:9a5a  0f 4e f4 3b   ora $3bf44e
$11:9a5e  6b            rtl
$11:9a5f  85 e7         sta $e7
$11:9a61  67 28         adc [$28]
$11:9a63  7a            ply
$11:9a64  41 f8         eor ($f8,x)
$11:9a66  88            dey
$11:9a67  13 fd         ora ($fd,s),y
$11:9a69  7a            ply
$11:9a6a  ff d8 c5 42   sbc $42c5d8,x
$11:9a6e  31 4a         and ($4a),y
$11:9a70  6c 63 cd      jmp ($cd63)
$11:9a73  10 d4         bpl $9a49
$11:9a75  d7 28         cmp [$28],y
$11:9a77  33 2a         and ($2a,s),y
$11:9a79  ec 84 82      cpx $8284
$11:9a7c  56 78         lsr $78,x
$11:9a7e  7f 9e 3f ef   adc $ef3f9e,x
$11:9a82  8f e8 e3 7c   sta $7ce3e8
$11:9a86  e9 d4 3b      sbc #$3bd4
$11:9a89  d0 0f         bne $9a9a
$11:9a8b  f1 06         sbc ($06),y
$11:9a8d  c3 a1         cmp $a1,s
$11:9a8f  11 97         ora ($97),y
$11:9a91  b0 45         bcs $9ad8
$11:9a93  23 b1         and $b1,s
$11:9a95  08            php
$11:9a96  34 42         bit $42,x
$11:9a98  4d 0a 9a      eor $9a0a
$11:9a9b  c4 6a         cpy $6a
$11:9a9d  55 82         eor $82,x
$11:9a9f  38            sec
$11:9aa0  c7 e1         cmp [$e1]
$11:9aa2  60            rts
$11:9aa3  41 97         eor ($97,x)
$11:9aa5  c3 ef         cmp $ef,s
$11:9aa7  30 bb         bmi $9a64
$11:9aa9  74 0e         stz $0e,x
$11:9aab  4d 03 e0      eor $e003
$11:9aae  70 32         bvs $9ae2
$11:9ab0  13 0e         ora ($0e,s),y
$11:9ab2  44 63 e1      mvp $e1,$63
$11:9ab5  18            clc
$11:9ab6  f2 41         sbc ($41)
$11:9ab8  3f 50 2b 35   and $352b50,x
$11:9abc  0b            phd
$11:9abd  9b            txy
$11:9abe  1d 80 33      ora $3380,x
$11:9ac1  c3 e1         cmp $e1,s
$11:9ac3  e0 fc 38      cpx #$38fc
$11:9ac6  c3 f1         cmp $f1,s
$11:9ac8  8c fe 63      sty $63fe
$11:9acb  a7 98         lda [$98]
$11:9acd  e8            inx
$11:9ace  17 fc         ora [$fc],y
$11:9ad0  5e 30 08      lsr $0830,x
$11:9ad3  3c 02 19      bit $1902,x
$11:9ad6  00 8b         brk #$8b
$11:9ad8  41 b2         eor ($b2,x)
$11:9ada  19 0a 05      ora $050a,y
$11:9add  00 7e         brk #$7e
$11:9adf  4f 21 17 04   eor $041721
$11:9ae3  7e 0d 38      ror $380d,x
$11:9ae6  c8            iny
$11:9ae7  58            cli
$11:9ae8  28            plp
$11:9ae9  18            clc
$11:9aea  01 f8         ora ($f8,x)
$11:9aec  83 4e         sta $4e,s
$11:9aee  03 01         ora $01,s
$11:9af0  06 b0         asl $b0
$11:9af2  48            pha
$11:9af3  82 98 0d      brl $a88e
$11:9af6  48            pha
$11:9af7  14 02         trb $02
$11:9af9  2f 10 a3 50   and $50a310
$11:9afd  21 30         and ($30,x)
$11:9aff  90 bb         bcc $9abc
$11:9b01  c1 e2         cmp ($e2,x)
$11:9b03  10 fa         bpl $9aff
$11:9b05  04 fe         tsb $fe
$11:9b07  13 76         ora ($76,s),y
$11:9b09  85 42         sta $42
$11:9b0b  a3 b1         lda $b1,s
$11:9b0d  18            clc
$11:9b0e  7c 04 a6      jmp ($a604,x)
$11:9b11  0f 50 8d 40   ora $408d50
$11:9b15  a3 10         lda $10,s
$11:9b17  09 c4 82      ora #$82c4
$11:9b1a  15 04         ora $04,x
$11:9b1c  88            dey
$11:9b1d  c3 a0         cmp $a0,s
$11:9b1f  31 e3         and ($e3),y
$11:9b21  18            clc
$11:9b22  40            rti
$11:9b23  23 d0         and $d0,s
$11:9b25  28            plp
$11:9b26  e4 02         cpx $02
$11:9b28  39 20 2d      and $2d20,y
$11:9b2b  80 35         bra $9b62
$11:9b2d  60            rts
$11:9b2e  70 18         bvs $9b48
$11:9b30  3c 0c f2      bit $f20c,x
$11:9b33  21 65         and ($65,x)
$11:9b35  81 9e         sta ($9e,x)
$11:9b37  81 0e         sta ($0e,x)
$11:9b39  2c 00 60      bit $6000
$11:9b3c  00 35         brk #$35
$11:9b3e  1e a1 1e      asl $1ea1,x
$11:9b41  86 47         stx $47
$11:9b43  a1 d0         lda ($d0,x)
$11:9b45  e7 f0         sbc [$f0]
$11:9b47  44 12 26      mvp $26,$12
$11:9b4a  98            tya
$11:9b4b  05 2a         ora $2a
$11:9b4d  c3 8c         cmp $8c,s
$11:9b4f  c0 0d 39      cpy #$390d
$11:9b52  c4 c2         cpy $c2
$11:9b54  f1 70         sbc ($70),y
$11:9b56  b9 48 20      lda $2048,y
$11:9b59  10 88         bpl $9ae3
$11:9b5b  25 c0         and $c0
$11:9b5d  1a            inc a
$11:9b5e  53 05         eor ($05,s),y
$11:9b60  b0 31         bcs $9b93
$11:9b62  46 f5         lsr $f5
$11:9b64  7a            ply
$11:9b65  b8            clv
$11:9b66  5e 20 d7      lsr $d720,x
$11:9b69  60            rts
$11:9b6a  69 42 20      adc #$2042
$11:9b6d  16 28         asl $28,x
$11:9b6f  05 01         ora $01
$11:9b71  e8            inx
$11:9b72  16 05         asl $05,x
$11:9b74  e0 70 38      cpx #$3870
$11:9b77  0c f3 84      tsb $84f3
$11:9b7a  58            cli
$11:9b7b  ac 56 0b      ldy $0b56
$11:9b7e  04 32         tsb $32
$11:9b80  d9 08 86      cmp $8608,y
$11:9b83  78            sei
$11:9b84  3c 17 18      bit $1817,x
$11:9b87  c7 42         cmp [$42]
$11:9b89  31 16         and ($16),y
$11:9b8b  8a            txa
$11:9b8c  76 7e         ror $7e,x
$11:9b8e  94 a9         sty $a9,x
$11:9b90  56 57         lsr $57,x
$11:9b92  3f 33 99 cf   and $cf9933,x
$11:9b96  62 9e 7f      per $1b37
$11:9b99  fb            xce
$11:9b9a  fc 3d 7e      jsr ($7e3d,x)
$11:9b9d  78            sei
$11:9b9e  5f 1f 8b 03   eor $038b1f,x
$11:9ba2  a8            tay
$11:9ba3  40            rti
$11:9ba4  e2 72         sep #$72
$11:9ba6  c9 a4         cmp #$a4
$11:9ba8  af d3 34 eb   lda $eb34d3
$11:9bac  41 2c         eor ($2c,x)
$11:9bae  55 ee         eor $ee,x
$11:9bb0  8c ee d7      sty $d7ee
$11:9bb3  fa            plx
$11:9bb4  80 fb         bra $9bb1
$11:9bb6  39 bc 0d      and $0dbc,y
$11:9bb9  6c 93 97      jmp ($9793)
$11:9bbc  0f f5 c2 70   ora $70c2f5
$11:9bc0  2e 30 2c      rol $2c30
$11:9bc3  04 07         tsb $07
$11:9bc5  d1 17         cmp ($17),y
$11:9bc7  e3 cc         sbc $cc,s
$11:9bc9  e5 7d         sbc $7d
$11:9bcb  3b            tsc
$11:9bcc  6c 46 97      jmp ($9746)
$11:9bcf  16 9a         asl $9a,x
$11:9bd1  c4 24         cpy $24
$11:9bd3  71 da         adc ($da),y
$11:9bd5  2c 3a 97      bit $973a
$11:9bd8  7f b2 4f ec   adc $ec4fb2,x
$11:9bdc  71 bb         adc ($bb),y
$11:9bde  75 e2         adc $e2,x
$11:9be0  d3 78         cmp ($78,s),y
$11:9be2  b5 d2         lda $d2,x
$11:9be4  1b            tcs
$11:9be5  41 68         eor ($68,x)
$11:9be7  4a            lsr a
$11:9be8  04 42         tsb $42
$11:9bea  5e 09 0b      lsr $0b09,x
$11:9bed  27 62         and [$62]
$11:9bef  89 eb         bit #$eb
$11:9bf1  9b            txy
$11:9bf2  f4 60 e1      pea $e160
$11:9bf5  30 e9         bmi $9be0
$11:9bf7  ce ad 3f      dec $3fad
$11:9bfa  88            dey
$11:9bfb  0f 93 1b 91   ora $911b93
$11:9bff  dd c3 f9      cmp $f9c3,x
$11:9c02  10 9f         bpl $9ba3
$11:9c04  44 23 05      mvp $05,$23
$11:9c07  09 85         ora #$85
$11:9c09  40            rti
$11:9c0a  63 f0         adc $f0,s
$11:9c0c  3f 5c 4f 05   and $054f5c,x
$11:9c10  73 f5         adc ($f5,s),y
$11:9c12  cd b0 bb      cmp $bbb0
$11:9c15  0f 1f b6 0b   ora $0bb61f
$11:9c19  0e 81 c3      asl $c381
$11:9c1c  e1 13         sbc ($13,x)
$11:9c1e  f9 24 be      sbc $be24,y
$11:9c21  37 33         and [$33],y
$11:9c23  84 f2         sty $f2
$11:9c25  31 74         and ($74),y
$11:9c27  86 90         stx $90
$11:9c29  b4 86         ldy $86,x
$11:9c2b  19 30 8f      ora $8f30,y
$11:9c2e  cc 20 73      cpy $7320
$11:9c31  40            rti
$11:9c32  79 d7 3b      adc $3bd7,y
$11:9c35  b3 0b         lda ($0b,s),y
$11:9c37  2f ee 1f fa   and $fa1fee
$11:9c3b  87 f8         sta [$f8]
$11:9c3d  31 b9         and ($b9),y
$11:9c3f  00 f9         brk #$f9
$11:9c41  60            rts
$11:9c42  e1 10         sbc ($10,x)
$11:9c44  36 90         rol $90,x
$11:9c46  89 c3         bit #$c3
$11:9c48  c1 13         cmp ($13,x)
$11:9c4a  c0 5c         cpy #$5c
$11:9c4c  e4 72         cpx $72
$11:9c4e  c9 0c         cmp #$0c
$11:9c50  76 bf         ror $bf,x
$11:9c52  23 41         and $41,s
$11:9c54  04 42         tsb $42
$11:9c56  01 01         ora ($01,x)
$11:9c58  80 c0         bra $9c1a
$11:9c5a  a0 50         ldy #$50
$11:9c5c  38            sec
$11:9c5d  1c 4a 06      trb $064a
$11:9c60  bb            tyx
$11:9c61  0a            asl a
$11:9c62  04 0a         tsb $0a
$11:9c64  99 00 8c      sta $8c00,y
$11:9c67  38            sec
$11:9c68  41 72         eor ($72,x)
$11:9c6a  0a            asl a
$11:9c6b  50 81         bvc $9bee
$11:9c6d  ee a6 79      inc $79a6
$11:9c70  e9 1e         sbc #$1e
$11:9c72  6b            rtl
$11:9c73  07 64         ora [$64]
$11:9c75  f3 70         sbc ($70,s),y
$11:9c77  27 d9         and [$d9]
$11:9c79  eb            xba
$11:9c7a  16 83         asl $83,x
$11:9c7c  79 12 cc      adc $cc12,y
$11:9c7f  4b            phk
$11:9c80  3b            tsc
$11:9c81  f1 cf         sbc ($cf),y
$11:9c83  fd f2 7f      sbc $7ff2,x
$11:9c86  18            clc
$11:9c87  9f 40 a7 90   sta $90a740,x
$11:9c8b  28            plp
$11:9c8c  04 83         tsb $83
$11:9c8e  85 18         sta $18
$11:9c90  f3 48         sbc ($48,s),y
$11:9c92  20 17 07      jsr $0717
$11:9c95  80 ce         bra $9c65
$11:9c97  11 01         ora ($01),y
$11:9c99  00 85         brk #$85
$11:9c9b  42 20         wdm #$20
$11:9c9d  2b            pld
$11:9c9e  81 78         sta ($78,x)
$11:9ca0  0f e0 02 37   ora $3702e0
$11:9ca4  c8            iny
$11:9ca5  04 fa         tsb $fa
$11:9ca7  11 07         ora ($07),y
$11:9ca9  66 83         ror $83
$11:9cab  ec 01 d9      cpx $d901
$11:9cae  c0 a0         cpy #$a0
$11:9cb0  03 af         ora $af,s
$11:9cb2  01 40         ora ($40,x)
$11:9cb4  c0 21         cpy #$21
$11:9cb6  42 08         wdm #$08
$11:9cb8  a6 11         ldx $11
$11:9cba  99 43 10      sta $1043,y
$11:9cbd  83 07         sta $07,s
$11:9cbf  05 00         ora $00
$11:9cc1  bd 87 20      lda $2087,x
$11:9cc4  31 08         and ($08),y
$11:9cc6  32 14         and ($14)
$11:9cc8  16 e1         asl $e1,x
$11:9cca  18            clc
$11:9ccb  42 0d         wdm #$0d
$11:9ccd  82 81 70      brl $0d51
$11:9cd0  a8            tay
$11:9cd1  3b            tsc
$11:9cd2  c0 1c         cpy #$1c
$11:9cd4  73 88         adc ($88,s),y
$11:9cd6  44 c2 01      mvp $01,$c2
$11:9cd9  30 a0         bmi $9c7b
$11:9cdb  4c 0b 03      jmp $030b
$11:9cde  60            rts
$11:9cdf  34 8b         bit $8b,x
$11:9ce1  34 21         bit $21,x
$11:9ce3  11 88         ora ($88),y
$11:9ce5  24 72         bit $72
$11:9ce7  17 0d         ora [$0d],y
$11:9ce9  91 40         sta ($40),y
$11:9ceb  e2 af         sep #$af
$11:9ced  80 5c         bra $9d4b
$11:9cef  00 ec         brk #$ec
$11:9cf1  61 f1         adc ($f1,x)
$11:9cf3  b8            clv
$11:9cf4  fc f2 7f      jsr ($7ff2,x)
$11:9cf7  1d 9f c2      ora $c29f,x
$11:9cfa  e3 f0         sbc $f0,s
$11:9cfc  18            clc
$11:9cfd  59 ec a4      eor $a4ec,y
$11:9d00  10 eb         bpl $9ced
$11:9d02  a4 82         ldy $82
$11:9d04  62 cd 0a      per $a7d4
$11:9d07  0c 02 64      tsb $6402
$11:9d0a  fa            plx
$11:9d0b  07 48         ora [$48]
$11:9d0d  0e c2 c1      asl $c1c2
$11:9d10  6e ba 5d      ror $5dba
$11:9d13  2e 37 19      rol $1937
$11:9d16  9d ce 03      sta $03ce,x
$11:9d19  33 84         and ($84,s),y
$11:9d1b  42 58         wdm #$58
$11:9d1d  20 3b 08      jsr $083b
$11:9d20  82 6c 7c      brl $198f
$11:9d23  14 0f         trb $0f
$11:9d25  4f 02 07 21   eor $210702
$11:9d29  80 70         bra $9d9b
$11:9d2b  a2 10         ldx #$10
$11:9d2d  1a            inc a
$11:9d2e  24 02         bit $02
$11:9d30  29 16         and #$16
$11:9d32  1d 87 93      ora $9387,x
$11:9d35  c9 e9         cmp #$e9
$11:9d37  f4 f0 fc      pea $fcf0
$11:9d3a  70 1e         bvs $9d5a
$11:9d3c  1c 42 23      trb $2342
$11:9d3f  44 a2 71      mvp $71,$a2
$11:9d42  1d e1 c0      ora $c0e1,x
$11:9d45  27 85         and [$85]
$11:9d47  08            php
$11:9d48  52 3d         eor ($3d)
$11:9d4a  4a            lsr a
$11:9d4b  05 18         ora $18
$11:9d4d  5c 10 6e 27   jml $276e10
$11:9d51  92 05         sta ($05)
$11:9d53  c2 8c         rep #$8c
$11:9d55  46 28         lsr $28
$11:9d57  54 28 44      mvn $44,$28
$11:9d5a  23 ad         and $ad,s
$11:9d5c  d6 a3         dec $a3,x
$11:9d5e  71 89         adc ($89),y
$11:9d60  61 07         adc ($07,x)
$11:9d62  89 da         bit #$da
$11:9d64  e0 1c         cpx #$1c
$11:9d66  78            sei
$11:9d67  47 ce         eor [$ce]
$11:9d69  69 77         adc #$77
$11:9d6b  8a            txa
$11:9d6c  4f e0 10 f1   eor $f110e0
$11:9d70  48            pha
$11:9d71  c8            iny
$11:9d72  e7 91         sbc [$91]
$11:9d74  08            php
$11:9d75  bc c0 a2      ldy $a2c0,x
$11:9d78  11 c1         ora ($c1),y
$11:9d7a  d0 82         bne $9cfe
$11:9d7c  0f fb c1 ff   ora $ffc1fb
$11:9d80  44 39 d2      mvp $d2,$39
$11:9d83  8e 1c 83      stx $831c
$11:9d86  e7 10         sbc [$10]
$11:9d88  ff 40 3f 90   sbc $903f40,x
$11:9d8c  0f 82 e4 24   ora $24e482
$11:9d90  70 7e         bvs $9e10
$11:9d92  84 42         sty $42
$11:9d94  71 1c         adc ($1c),y
$11:9d96  23 81         and $81,s
$11:9d98  69 20         adc #$20
$11:9d9a  15 58         ora $58,x
$11:9d9c  44 be 4b      mvp $4b,$be
$11:9d9f  6f a5 5b e4   adc $e45ba5
$11:9da3  11 f8         ora ($f8),y
$11:9da5  00 dc         brk #$dc
$11:9da7  20 e5 a2      jsr $a2e5
$11:9daa  b3 c7         lda ($c7,s),y
$11:9dac  6e 53 6b      ror $6b53
$11:9daf  8c 42 61      sty $6142
$11:9db2  38            sec
$11:9db3  14 2d         trb $2d
$11:9db5  66 83         ror $83
$11:9db7  e4 cc         cpx $cc
$11:9db9  70 26         bvs $9de1
$11:9dbb  81 30         sta ($30,x)
$11:9dbd  ff ca 3b 72   sbc $723bca,x
$11:9dc1  00 88         brk #$88
$11:9dc3  06 c2         asl $c2
$11:9dc5  8d a0 c0      sta $c0a0
$11:9dc8  52 21         eor ($21)
$11:9dca  19 c1 18      ora $18c1,y
$11:9dcd  08            php
$11:9dce  da            phx
$11:9dcf  2b            pld
$11:9dd0  08            php
$11:9dd1  93 c3         sta ($c3,s),y
$11:9dd3  6d 70 eb      adc $eb70
$11:9dd6  fc 01 f2      jsr ($f201,x)
$11:9dd9  03 95         ora $95,s
$11:9ddb  87 c5         sta [$c5]
$11:9ddd  60            rts
$11:9dde  51 28         eor ($28),y
$11:9de0  08            php
$11:9de1  21 41         and ($41,x)
$11:9de3  03 5a         ora $5a,s
$11:9de5  a1 7e         lda ($7e,x)
$11:9de7  b1 1d         lda ($1d),y
$11:9de9  a9 17         lda #$17
$11:9deb  32 61         and ($61)
$11:9ded  c7 9c         cmp [$9c]
$11:9def  71 e4         adc ($e4),y
$11:9df1  85 b2         sta $b2
$11:9df3  a6 69         ldx $69
$11:9df5  f2 d4         sbc ($d4)
$11:9df7  68            pla
$11:9df8  26 1a         rol $1a
$11:9dfa  1d 30 80      ora $8030,x
$11:9dfd  4e 23 02      lsr $0223
$11:9e00  63 83         adc $83,s
$11:9e02  40            rti
$11:9e03  61 30         adc ($30,x)
$11:9e05  11 28         ora ($28),y
$11:9e07  0d c9 f6      ora $f6c9
$11:9e0a  03 b0         ora $b0,s
$11:9e0c  42 0c         wdm #$0c
$11:9e0e  06 0d         asl $0d
$11:9e10  00 81         brk #$81
$11:9e12  a1 62         lda ($62,x)
$11:9e14  01 a4         ora ($a4,x)
$11:9e16  9e 54 b7      stz $b754,x
$11:9e19  da            phx
$11:9e1a  bf 77 c6 25   lda $25c677,x
$11:9e1e  f5 9a         sbc $9a,x
$11:9e20  70 a0         bvs $9dc2
$11:9e22  5e c8 40      lsr $40c8,x
$11:9e25  74 26         stz $26,x
$11:9e27  94 a8         sty $a8,x
$11:9e29  36 e2         rol $e2,x
$11:9e2b  25 3c         and $3c
$11:9e2d  86 47         stx $47
$11:9e2f  a1 50         lda ($50,x)
$11:9e31  c9 e4         cmp #$e4
$11:9e33  02 20         cop #$20
$11:9e35  08            php
$11:9e36  1b            tcs
$11:9e37  85 c3         sta $c3
$11:9e39  69 84         adc #$84
$11:9e3b  bc 40 0e      ldy $0e40,x
$11:9e3e  a0 bb         ldy #$bb
$11:9e40  14 21         trb $21
$11:9e42  dc 20 0f      jml [$0f20]
$11:9e45  21 0c         and ($0c,x)
$11:9e47  87 fd         sta [$fd]
$11:9e49  e8            inx
$11:9e4a  08            php
$11:9e4b  49 80         eor #$80
$11:9e4d  50 28         bvc $9e77
$11:9e4f  1c 88 42      trb $4288
$11:9e52  cc 23 0a      cpy $0a23
$11:9e55  90 07         bcc $9e5e
$11:9e57  36 01         rol $01,x
$11:9e59  b8            clv
$11:9e5a  3f e8 c3 04   and $04c3e8,x
$11:9e5e  20 11 d8      jsr $d811
$11:9e61  e4 ae         cpx $ae
$11:9e63  51 6c         eor ($6c),y
$11:9e65  a0 55         ldy #$55
$11:9e67  62 77 59      per $f7e1
$11:9e6a  e4 2e         cpx $2e
$11:9e6c  71 29         adc ($29),y
$11:9e6e  8e 44 26      stx $2644
$11:9e71  cc 30 8b      cpy $8b30
$11:9e74  d0 2e         bne $9ea4
$11:9e76  70 c9         bvs $9e41
$11:9e78  04 31         tsb $31
$11:9e7a  86 07         stx $07
$11:9e7c  b0 61         bcs $9edf
$11:9e7e  84 f6         sty $f6
$11:9e80  09 19         ora #$19
$11:9e82  8c 45 62      sty $6245
$11:9e85  13 19         ora ($19,s),y
$11:9e87  c4 1e         cpy $1e
$11:9e89  39 1f 86      and $861f,y
$11:9e8c  44 e2 13      mvp $13,$e2
$11:9e8f  98            tya
$11:9e90  84 aa         sty $aa
$11:9e92  44 7b 05      mvp $05,$7b
$11:9e95  c8            iny
$11:9e96  49 e0         eor #$e0
$11:9e98  11 39         ora ($39),y
$11:9e9a  03 0c         ora $0c,s
$11:9e9c  17 20         ora [$20],y
$11:9e9e  b9 08 ea      lda $ea08,y
$11:9ea1  f0 60         beq $9f03
$11:9ea3  50 28         bvc $9ecd
$11:9ea5  2c 1d 56      bit $561d
$11:9ea8  10 38         bpl $9ee2
$11:9eaa  14 3e         trb $3e
$11:9eac  19 04 86      ora $8604,y
$11:9eaf  40            rti
$11:9eb0  a1 cb         lda ($cb,x)
$11:9eb2  e1 66         sbc ($66,x)
$11:9eb4  0c 0e 19      tsb $190e
$11:9eb7  05 84         ora $84
$11:9eb9  30 c1         bmi $9e7c
$11:9ebb  86 00         stx $00
$11:9ebd  94 81         sty $81,x
$11:9ebf  c0 e0         cpy #$e0
$11:9ec1  f0 48         beq $9f0b
$11:9ec3  84 62         sty $62
$11:9ec5  f3 0f         sbc ($0f,s),y
$11:9ec7  a1 d0         lda ($d0,x)
$11:9ec9  e6 53         inc $53
$11:9ecb  00 5a         brk #$5a
$11:9ecd  11 ca         ora ($ca),y
$11:9ecf  69 04         adc #$04
$11:9ed1  ae 48 26      ldx $2648
$11:9ed4  f0 86         beq $9e5c
$11:9ed6  60            rts
$11:9ed7  70 19         bvs $9ef2
$11:9ed9  83 60         sta $60,s
$11:9edb  b0 77         bcs $9f54
$11:9edd  e3 f7         sbc $f7,s
$11:9edf  68            pla
$11:9ee0  34 fe         bit $fe,x
$11:9ee2  01 47         ora ($47,x)
$11:9ee4  a0 3f         ldy #$3f
$11:9ee6  07 81         ora [$81]
$11:9ee8  80 12         bra $9efc
$11:9eea  84 02         sty $02
$11:9eec  41 c0         eor ($c0,x)
$11:9eee  9c f0 00      stz $00f0
$11:9ef1  c1 bf         cmp ($bf,x)
$11:9ef3  7e 0b 39      ror $390b,x
$11:9ef6  38            sec
$11:9ef7  1c 09 04      trb $0409
$11:9efa  81 de         sta ($de,x)
$11:9efc  1b            tcs
$11:9efd  16 73         asl $73,x
$11:9eff  ab            plb
$11:9f00  cb            wai
$11:9f01  20 b0 09      jsr $09b0
$11:9f04  ca            dex
$11:9f05  c8            iny
$11:9f06  20 f0 78      jsr $78f0
$11:9f09  5c 22 3f 18   jml $183f22
$11:9f0d  8b            phb
$11:9f0e  c4 1e         cpy $1e
$11:9f10  e5 63         sbc $63
$11:9f12  b8            clv
$11:9f13  2c 85 e2      bit $e285
$11:9f16  10 f8         bpl $9f10
$11:9f18  3c 7e 1e      bit $1e7e,x
$11:9f1b  06 4b         asl $4b
$11:9f1d  fb            xce
$11:9f1e  54 b4 12      mvn $12,$b4
$11:9f21  0f 84 c3 a1   ora $a1c384
$11:9f25  10 ea         bpl $9f11
$11:9f27  44 39 91      mvp $91,$39
$11:9f2a  cc 14 49      cpy $4914
$11:9f2d  a8            tay
$11:9f2e  7e 0e 07      ror $070e,x
$11:9f31  c3 c1         cmp $c1,s
$11:9f33  f0 f6         beq $9f2b
$11:9f35  7c 3c 5f      jmp ($5f3c,x)
$11:9f38  cf 67 f9 e2   cmp $e2f967
$11:9f3c  d5 78         cmp $78,x
$11:9f3e  85 9e         sta $9e
$11:9f40  e1 83         sbc ($83,x)
$11:9f42  c8            iny
$11:9f43  7a            ply
$11:9f44  f3 00         sbc ($00,s),y
$11:9f46  16 b7         asl $b7,x
$11:9f48  c7 f1         cmp [$f1]
$11:9f4a  f7 fb         sbc [$fb],y
$11:9f4c  7f fe cf ff   adc $ffcffe,x
$11:9f50  08            php
$11:9f51  86 9a         stx $9a
$11:9f53  41 f7         eor ($f7,x)
$11:9f55  98            tya
$11:9f56  76 62         ror $62,x
$11:9f58  dd 18 81      cmp $8118,x
$11:9f5b  5c 31 d1 ed   jml $edd131
$11:9f5f  1c cc 20      trb $20cc
$11:9f62  1c 7f 07      trb $077f
$11:9f65  3f e1 e9 f8   and $f8e9e1,x
$11:9f69  79 be 3e      adc $3ebe,y
$11:9f6c  0f 9f 8b fb   ora $fb8b9f
$11:9f70  cc ff 43      cpy $43ff
$11:9f73  a1 11         lda ($11,x)
$11:9f75  97 c0         sta [$c0],y
$11:9f77  45 23         eor $23
$11:9f79  b1 08         lda ($08),y
$11:9f7b  34 42         bit $42,x
$11:9f7d  4d 0a 9a      eor $9a0a
$11:9f80  c4 6a         cpy $6a
$11:9f82  75 90         adc $90,x
$11:9f84  18            clc
$11:9f85  01 c2         ora ($c2,x)
$11:9f87  16 06         asl $06,x
$11:9f89  19 7c 3e      ora $3e7c,y
$11:9f8c  f3 0b         sbc ($0b,s),y
$11:9f8e  b7 40         lda [$40],y
$11:9f90  e4 d0         cpx $d0
$11:9f92  30 88         bmi $9f1c
$11:9f94  66 27         ror $27
$11:9f96  1c c8 a7      trb $a7c8
$11:9f99  d2 39         cmp ($39)
$11:9f9b  e0 82         cpx #$82
$11:9f9d  7e a0 56      ror $56a0,x
$11:9fa0  68            pla
$11:9fa1  14 f7         trb $f7
$11:9fa3  73 00         adc ($00,s),y
$11:9fa5  08            php
$11:9fa6  87 e3         sta [$e3]
$11:9fa8  d1 fc         cmp ($fc),y
$11:9faa  f0 7f         beq $a02b
$11:9fac  3f 1f cf e7   and $e7cf1f,x
$11:9fb0  f9 52 14      sbc $1452,y
$11:9fb3  66 58         ror $58
$11:9fb5  40            rti
$11:9fb6  0d f8 00      ora $00f8
$11:9fb9  14 05         trb $05
$11:9fbb  88            dey
$11:9fbc  0b            phd
$11:9fbd  39 3c e3      and $e33c,y
$11:9fc0  44 be 51      mvp $51,$be
$11:9fc3  af 14 1b f1   lda $f11b14
$11:9fc7  02 b7         cop #$b7
$11:9fc9  40            rti
$11:9fca  9f e2 d1 01   sta $01d1e2,x
$11:9fce  60            rts
$11:9fcf  f9 3f df      sbc $df3f,y
$11:9fd2  85 50         sta $50
$11:9fd4  aa            tax
$11:9fd5  41 5f         eor ($5f,x)
$11:9fd7  ec 0f 68      cpx $680f
$11:9fda  86 42         stx $42
$11:9fdc  61 c8         adc ($c8,x)
$11:9fde  8c 7c 23      sty $237c
$11:9fe1  1e 44 c1      asl $c144,x
$11:9fe4  b7 cf         lda [$cf],y
$11:9fe6  e1 e0         sbc ($e0,x)
$11:9fe8  fc 09 41      jsr ($4109,x)
$11:9feb  4e 93 f9      lsr $f993
$11:9fee  54 66 01      mvn $01,$66
$11:9ff1  39 82 4f      and $4f82,y
$11:9ff4  a0 70         ldy #$70
$11:9ff6  f8            sed
$11:9ff7  00 dc         brk #$dc
$11:9ff9  20 f0 06      jsr $06f0
$11:9ffc  70 49         bvs $a047
$11:9ffe  47 81         eor [$81]
$11:a000  04 82         tsb $82
$11:a002  40            rti
$11:a003  99 c2 46      sta $46c2,y
$11:a006  59 3c 9e      eor $9e3c,y
$11:a009  15 2e         ora $2e,x
$11:a00b  82 d6 ab      brl $4be4
$11:a00e  f4 08 9c      pea $9c08
$11:a011  80 8c         bra $9f9f
$11:a013  91 88         sta ($88),y
$11:a015  04 ca         tsb $ca
$11:a017  03 52         ora $52,s
$11:a019  90 d0         bcc $9feb
$11:a01b  24 32         bit $32
$11:a01d  0a            asl a
$11:a01e  0c 02 02      tsb $0202
$11:a021  46 2e         lsr $2e
$11:a023  47 23         eor [$23]
$11:a025  41 e8         eor ($e8,x)
$11:a027  a0 6d         ldy #$6d
$11:a029  3e 90 48      rol $4890,x
$11:a02c  84 23         sty $23
$11:a02e  01 00         ora ($00,x)
$11:a030  3c 85 02      bit $0285,x
$11:a033  01 30         ora ($30,x)
$11:a035  2f 0c 52 11   and $11520c
$11:a039  04 84         tsb $84
$11:a03b  42 30         wdm #$30
$11:a03d  87 a1         sta [$a1]
$11:a03f  e0 1f         cpx #$1f
$11:a041  00 6c         brk #$6c
$11:a043  0c e0 9f      tsb $9fe0
$11:a046  c0 2f         cpy #$2f
$11:a048  e9 41         sbc #$41
$11:a04a  49 81         eor #$81
$11:a04c  14 a1         trb $a1
$11:a04e  84 67         sty $67
$11:a050  23 24         and $24,s
$11:a052  c7 e1         cmp [$e1]
$11:a054  cf af 6c af   cmp $af6caf
$11:a058  d8            cld
$11:a059  9a            txs
$11:a05a  3e 72 47      rol $4772,x
$11:a05d  ff 80 2e 41   sbc $412e80,x
$11:a061  9c 03 70      stz $7003
$11:a064  90 c0         bcc $a026
$11:a066  1f c1 40 98   ora $9840c1,x
$11:a06a  48            pha
$11:a06b  0f a0 46 3b   ora $3b46a0
$11:a06f  75 83         adc $83,x
$11:a071  61 28         adc ($28,x)
$11:a073  ee 44 29      inc $2944
$11:a076  96 08         stx $08,y
$11:a078  a7 c3         lda [$c3]
$11:a07a  c9 10         cmp #$10
$11:a07c  fc 05 82      jsr ($8205,x)
$11:a07f  01 a0         ora ($a0,x)
$11:a081  8f 72 20 1e   sta $1e2072
$11:a085  04 48         tsb $48
$11:a087  44 26 10      mvp $10,$26
$11:a08a  83 b8         sta $b8,s
$11:a08c  17 c0         ora [$c0],y
$11:a08e  3e 18 bc      rol $bc18,x
$11:a091  c7 a7         cmp [$a7]
$11:a093  31 50         and ($50),y
$11:a095  8c 65 a2      sty $a265
$11:a098  95 9b         sta $9b,x
$11:a09a  a6 2a         ldx $2a
$11:a09c  55 f5         eor $f5,x
$11:a09e  af ee e3 76   lda $76e3ee
$11:a0a2  7f fb fc 3c   adc $3cfcfb,x
$11:a0a6  ff ff 5f 9f   sbc $9f5fff,x
$11:a0aa  17 c7         ora [$c7],y
$11:a0ac  e2 c0         sep #$c0
$11:a0ae  f2 10         sbc ($10)
$11:a0b0  38            sec
$11:a0b1  df 13 5d 32   cmp $325d13,x
$11:a0b5  82 48 26      brl $c700
$11:a0b8  53 2e         eor ($2e,s),y
$11:a0ba  85 7a         sta $7a
$11:a0bc  61 50         adc ($50,x)
$11:a0be  d0 68         bne $a128
$11:a0c0  28            plp
$11:a0c1  1e 0c 86      asl $860c,x
$11:a0c4  43 99         eor $99,s
$11:a0c6  fe ef 7f      inc $7fef,x
$11:a0c9  83 e1         sta $e1,s
$11:a0cb  a0 e3         ldy #$e3
$11:a0cd  68            pla
$11:a0ce  38            sec
$11:a0cf  14 03         trb $03
$11:a0d1  c8            iny
$11:a0d2  e4 2c         cpx $2c
$11:a0d4  14 18         trb $18
$11:a0d6  46 63         lsr $63
$11:a0d8  31 16         and ($16),y
$11:a0da  fa            plx
$11:a0db  46 62         lsr $62
$11:a0dd  90 a8         bcc $a087
$11:a0df  54 86 17      mvn $17,$86
$11:a0e2  34 8e         bit $8e,x
$11:a0e4  46 e3         lsr $e3
$11:a0e6  7f 70 00 c2   adc $c20070,x
$11:a0ea  f8            sed
$11:a0eb  f0 b8         beq $a0a5
$11:a0ed  3c 16 07      bit $0716,x
$11:a0f0  34 99         bit $99,x
$11:a0f2  cc e4 13      cpy $13e4
$11:a0f5  b9 24 b2      lda $b224,y
$11:a0f8  61 14         adc ($14,x)
$11:a0fa  98            tya
$11:a0fb  74 aa         stz $aa,x
$11:a0fd  53 4a         eor ($4a,s),y
$11:a0ff  e6 c3         inc $c3
$11:a101  40            rti
$11:a102  de 0a 05      dec $050a,x
$11:a105  80 3a         bra $a141
$11:a107  1c ff f7      trb $f7ff
$11:a10a  3b            tsc
$11:a10b  fd ac e7      sbc $e7ac,x
$11:a10e  68            pla
$11:a10f  38            sec
$11:a110  82 90 14      brl $b5a3
$11:a113  80 a8         bra $a0bd
$11:a115  05 a1         ora $a1
$11:a117  23 96         and $96,s
$11:a119  c0 63         cpy #$63
$11:a11b  b0 24         bcs $a141
$11:a11d  d9 40 20      cmp $2040,y
$11:a120  d0 08         bne $a12a
$11:a122  0c 02 33      tsb $3302
$11:a125  08            php
$11:a126  89 40         bit #$40
$11:a128  ce 63 02      dec $0263
$11:a12b  3a            dec a
$11:a12c  a2 f4         ldx #$f4
$11:a12e  22 70 38 bf   jsl $bf3870
$11:a132  16 fa         asl $fa,x
$11:a134  90 1a         bcc $a150
$11:a136  a7 1b         lda [$1b]
$11:a138  d1 ae         cmp ($ae),y
$11:a13a  b4 41         ldy $41,x
$11:a13c  2c d0 cc      bit $ccd0
$11:a13f  94 62         sty $62,x
$11:a141  75 ff         adc $ff,x
$11:a143  4f 8d fe 71   eor $71fe8d
$11:a147  7e 88 4e      ror $4e88,x
$11:a14a  a6 10         ldx $10
$11:a14c  29 e7         and #$e7
$11:a14e  0a            asl a
$11:a14f  31 e6         and ($e6),y
$11:a151  a9 d6         lda #$d6
$11:a153  4d e1 00      eor $00e1
$11:a156  39 1b ac      and $ac1b,y
$11:a159  20 90 0b      jsr $0b90
$11:a15c  2c 82 4d      bit $4d82
$11:a15f  03 3f         ora $3f,s
$11:a161  b3 ac         lda ($ac,s),y
$11:a163  21 90         and ($90,x)
$11:a165  0a            asl a
$11:a166  64 3e         stz $3e
$11:a168  eb            xba
$11:a169  f1 96         sbc ($96),y
$11:a16b  e2 7f         sep #$7f
$11:a16d  ad 21 d5      lda $d521
$11:a170  62 aa 9d      per $3f1d
$11:a173  ea            nop
$11:a174  44 53 2d      mvp $2d,$53
$11:a177  2c 87 7f      bit $7f87
$11:a17a  ee ce 03      inc $03ce
$11:a17d  ba            tsx
$11:a17e  7f a4 1f 6b   adc $6b1fa4,x
$11:a182  04 0b         tsb $0b
$11:a184  99 02 57      sta $5702,y
$11:a187  94 86         sty $86,x
$11:a189  3b            tsc
$11:a18a  5e 91 d2      lsr $d291,x
$11:a18d  20 11 04      jsr $0411
$11:a190  30 9e         bmi $a130
$11:a192  c1 7e         cmp ($7e,x)
$11:a194  94 08         sty $08,x
$11:a196  15 31         ora $31,x
$11:a198  70 28         bvs $a1c2
$11:a19a  52 8e         eor ($8e)
$11:a19c  e7 61         sbc [$61]
$11:a19e  5e 39 f0      lsr $f039,x
$11:a1a1  48            pha
$11:a1a2  65 56         adc $56
$11:a1a4  2a            rol a
$11:a1a5  a5 da         lda $da
$11:a1a7  91 24         sta ($24),y
$11:a1a9  fd 44 2c      sbc $2c44,x
$11:a1ac  5f f8 e0 80   eor $80e0f8,x
$11:a1b0  a7 f9         lda [$f9]
$11:a1b2  c9 f6         cmp #$f6
$11:a1b4  22 3d 18 81   jsl $81183d
$11:a1b8  43 20         eor $20,s
$11:a1ba  51 f8         eor ($f8),y
$11:a1bc  04 6e         tsb $6e
$11:a1be  41 07         eor ($07,x)
$11:a1c0  92 47         sta ($47)
$11:a1c2  6a            ror a
$11:a1c3  12 69         ora ($69)
$11:a1c5  94 96         sty $96,x
$11:a1c7  39 7b 84      and $847b,y
$11:a1ca  5e 61 82      lsr $8261,x
$11:a1cd  f0 17         beq $a1e6
$11:a1cf  8c 02 87      sty $8702
$11:a1d2  2c 90 d3      bit $d390
$11:a1d5  10 41         bpl $a218
$11:a1d7  07 45         ora [$45]
$11:a1d9  0c ea 25      tsb $25ea
$11:a1dc  00 8e         brk #$8e
$11:a1de  45 62         eor $62
$11:a1e0  90 99         bcc $a17b
$11:a1e2  04 12         tsb $12
$11:a1e4  49 17         eor #$17
$11:a1e6  9b            txy
$11:a1e7  d2 ef         cmp ($ef)
$11:a1e9  f3 99         sbc ($99,s),y
$11:a1eb  3c 75 14      bit $1475,x
$11:a1ee  30 b2         bmi $a1a2
$11:a1f0  01 c2         ora ($c2,x)
$11:a1f2  20 16 08      jsr $0816
$11:a1f5  04 8e         tsb $8e
$11:a1f7  80 fb         bra $a1f4
$11:a1f9  28            plp
$11:a1fa  14 0a         trb $0a
$11:a1fc  0b            phd
$11:a1fd  07 65         ora [$65]
$11:a1ff  83 08         sta $08,s
$11:a201  20 91 c9      jsr $c991
$11:a204  1c 9c 14      trb $149c
$11:a207  4f d0 7d 84   eor $847dd0
$11:a20b  0e 19 05      asl $0519
$11:a20e  84 44         sty $44
$11:a210  e4 12         cpx $12
$11:a212  87 c9         sta [$c9]
$11:a214  3e 8e 0d      rol $0d8e,x
$11:a217  06 87         asl $87
$11:a219  42 24         wdm #$24
$11:a21b  33 0f         and ($0f,s),y
$11:a21d  94 79         sty $79,x
$11:a21f  1e 8f c0      asl $c08f,x
$11:a222  7e 81 2c      ror $2c81,x
$11:a225  21 d0         and ($d0,x)
$11:a227  1b            tcs
$11:a228  44 24 14      mvp $14,$24
$11:a22b  50 38         bvc $a265
$11:a22d  1e 1e 09      asl $091e,x
$11:a230  18            clc
$11:a231  8c 79 fc      sty $fc79
$11:a234  1a            inc a
$11:a235  f8            sed
$11:a236  06 e1         asl $e1
$11:a238  3e b0 3c      rol $3cb0,x
$11:a23b  04 1f         tsb $1f
$11:a23d  00 2f         brk #$2f
$11:a23f  0b            phd
$11:a240  fe 01 96      inc $9601,x
$11:a243  00 a2         brk #$a2
$11:a245  c0 60         cpy #$60
$11:a247  28            plp
$11:a248  14 0b         trb $0b
$11:a24a  e5 02         sbc $02
$11:a24c  b5 18         lda $18,x
$11:a24e  d0 c8         bne $a218
$11:a250  34 1a         bit $1a,x
$11:a252  04 7a         tsb $7a
$11:a254  33 83         and ($83,s),y
$11:a256  01 3c         ora ($3c,x)
$11:a258  cc 59 f4      cpy $f459
$11:a25b  14 13         trb $13
$11:a25d  70 5a         bvs $a2b9
$11:a25f  a9 13         lda #$13
$11:a261  7a            ply
$11:a262  bf 6e 21 7f   lda $7f216e,x
$11:a266  80 4f         bra $a2b7
$11:a268  e0 10         cpx #$10
$11:a26a  f4 11 d2      pea $d211
$11:a26d  32 f9         and ($f9)
$11:a26f  78            sei
$11:a270  40            rti
$11:a271  c8            iny
$11:a272  13 ea         ora ($ea,s),y
$11:a274  92 1b         sta ($1b)
$11:a276  c4 e3         cpy $e3
$11:a278  51 00         eor ($00),y
$11:a27a  be 4c 3b      ldx $3b4c,y
$11:a27d  d2 0e         cmp ($0e)
$11:a27f  34 03         bit $03,x
$11:a281  79 58 ec      adc $ec58,y
$11:a284  54 12 61      mvn $61,$12
$11:a287  30 e4         bmi $a26d
$11:a289  46 3b         lsr $3b
$11:a28b  10 8d         bpl $a21a
$11:a28d  c4 42         cpy $42
$11:a28f  61 38         adc ($38,x)
$11:a291  98            tya
$11:a292  48            pha
$11:a293  2e 12 04      rol $0412
$11:a296  90 da         bcc $a272
$11:a298  a5 1f         lda $1f
$11:a29a  78            sei
$11:a29b  bb            tyx
$11:a29c  ce a1 13      dec $13a1
$11:a29f  78            sei
$11:a2a0  b8            clv
$11:a2a1  0b            phd
$11:a2a2  c2 7e         rep #$7e
$11:a2a4  24 98         bit $98
$11:a2a6  72 94         adc ($94)
$11:a2a8  59 20 73      eor $7320,y
$11:a2ab  27 c8         and [$c8]
$11:a2ad  2a            rol a
$11:a2ae  41 4e         eor ($4e,x)
$11:a2b0  11 f8         ora ($f8),y
$11:a2b2  3c 38 89      bit $8938,x
$11:a2b5  2e 20 b6      rol $b620
$11:a2b8  5d 33 d6      eor $d633,x
$11:a2bb  28            plp
$11:a2bc  3d 63 8f      and $8f63,x
$11:a2bf  08            php
$11:a2c0  cb            wai
$11:a2c1  e4 23         cpx $23
$11:a2c3  d1 8d         cmp ($8d),y
$11:a2c5  e4 83         cpx $83
$11:a2c7  e1 00         sbc ($00,x)
$11:a2c9  b2 64         lda ($64)
$11:a2cb  a0 56 0d      ldy #$0d56
$11:a2ce  05 c0         ora $c0
$11:a2d0  4c 16 89      jmp $8916
$11:a2d3  87 82         sta [$82]
$11:a2d5  00 ed         brk #$ed
$11:a2d7  07 10         ora [$10]
$11:a2d9  4e a0 10      lsr $10a0
$11:a2dc  58            cli
$11:a2dd  2c 70 e9      bit $e970
$11:a2e0  37 c8         and [$c8],y
$11:a2e2  fc e6 3d      jsr ($3de6,x)
$11:a2e5  03 41         ora $41,s
$11:a2e7  cd d2 99      cmp $99d2
$11:a2ea  d2 df         cmp ($df)
$11:a2ec  6a            ror a
$11:a2ed  fd df 18      sbc $18df,x
$11:a2f0  97 d6         sta [$d6],y
$11:a2f2  69 c2 81      adc #$81c2
$11:a2f5  7b            tdc
$11:a2f6  21 09         and ($09,x)
$11:a2f8  d0 a6         bne $a2a0
$11:a2fa  60            rts
$11:a2fb  b0 d3         bcs $a2d0
$11:a2fd  88            dey
$11:a2fe  94 f2         sty $f2,x
$11:a300  19 1e 85      ora $851e,y
$11:a303  43 27         eor $27,s
$11:a305  90 08         bcc $a30f
$11:a307  81 30         sta ($30,x)
$11:a309  4f 60 6f 08   eor $086f60
$11:a30d  f4 02 3a      pea $3a02
$11:a310  f2 08         sbc ($08)
$11:a312  24 3a         bit $3a
$11:a314  03 06         ora $06,s
$11:a316  1d 1b 0c      ora $0c1b,x
$11:a319  0e 21 07      asl $0721
$11:a31c  80 c0         bra $a2de
$11:a31e  c7 62         cmp [$62]
$11:a320  3b            tsc
$11:a321  2a            rol a
$11:a322  95 03         sta $03,x
$11:a324  4d 80 ce      eor $ce80
$11:a327  c5 37         cmp $37
$11:a329  f0 0c         beq $a337
$11:a32b  ff 02 fd e0   sbc $e0fd02,x
$11:a32f  fe 60 13      inc $1360,x
$11:a332  a1 8c         lda ($8c,x)
$11:a334  f9 40 2f      sbc $2f40,y
$11:a337  5d 4f 17      eor $174f,x
$11:a33a  03 81         ora $81,s
$11:a33c  20 c0 12      jsr $12c0
$11:a33f  16 2d         asl $2d,x
$11:a341  0f 8d 48 61   ora $61488d
$11:a345  13 d9         ora ($d9,s),y
$11:a347  84 3a         sty $3a
$11:a349  27 0f         and [$0f]
$11:a34b  90 1e         bcc $a36b
$11:a34d  c1 86         cmp ($86,x)
$11:a34f  10 d8         bpl $a329
$11:a351  24 56         bit $56
$11:a353  01 0b         ora ($0b,x)
$11:a355  8a            txa
$11:a356  4c 20 51      jmp $5120
$11:a359  39 01 ac      and $ac01,y
$11:a35c  99 81 18      sta $1881,y
$11:a35f  8a            txa
$11:a360  df 60 13 73   cmp $731360,x
$11:a364  d0 c0         bne $a326
$11:a366  85 2b         sta $2b
$11:a368  15 91         ora $91,x
$11:a36a  40            rti
$11:a36b  1f 61 04 31   ora $310461,x
$11:a36f  89 5d 66      bit #$665d
$11:a372  1d 0f e4      ora $e40f,x
$11:a375  03 b1         ora $b1,s
$11:a377  00 14         brk #$14
$11:a379  33 30         and ($30,s),y
$11:a37b  22 10 83 b3   jsl $b38310
$11:a37f  8a            txa
$11:a380  8f 0d 86 b2   sta $b2860d
$11:a384  d8            cld
$11:a385  6c 91 ff      jmp ($ff91)
$11:a388  fc 03 ff      jsr ($ff03,x)
$11:a38b  01 be         ora ($be,x)
$11:a38d  2e 85 98      rol $9885
$11:a390  1b            tcs
$11:a391  9a            txs
$11:a392  05 ba         ora $ba
$11:a394  21 18         and ($18,x)
$11:a396  66 0b         ror $0b
$11:a398  f4 58 67      pea $6758
$11:a39b  8d c6 4e      sta $4ec6
$11:a39e  f3 19         sbc ($19,s),y
$11:a3a0  4c e5 af      jmp $afe5
$11:a3a3  ef 3f a0 25   sbc $25a03f
$11:a3a7  c1 2a         cmp ($2a,x)
$11:a3a9  09 b0 b9      ora #$b9b0
$11:a3ac  c0 2c f0      cpy #$f02c
$11:a3af  0b            phd
$11:a3b0  19 d0 68      ora $68d0,y
$11:a3b3  18            clc
$11:a3b4  07 e9         ora [$e9]
$11:a3b6  03 02         ora $02,s
$11:a3b8  81 60         sta ($60,x)
$11:a3ba  80 48         bra $a404
$11:a3bc  2a            rol a
$11:a3bd  16 0f         asl $0f,x
$11:a3bf  87 82         sta [$82]
$11:a3c1  21 a0         and ($a0,x)
$11:a3c3  98            tya
$11:a3c4  50 3c         bvc $a402
$11:a3c6  10 0e         bpl $a3d6
$11:a3c8  01 d0         ora ($d0,x)
$11:a3ca  5b            tcd
$11:a3cb  a4 d0         ldy $d0
$11:a3cd  0d 05 01      ora $0105
$11:a3d0  8e 02 a3      stx $a302
$11:a3d3  2b            pld
$11:a3d4  84 06         sty $06
$11:a3d6  11 02         ora ($02),y
$11:a3d8  86 41         stx $41
$11:a3da  ee 52 49      inc $4952
$11:a3dd  34 0e         bit $0e,x
$11:a3df  27 48         and [$48]
$11:a3e1  98            tya
$11:a3e2  52 60         eor ($60)
$11:a3e4  50 16         bvc $a3fc
$11:a3e6  48            pha
$11:a3e7  40            rti
$11:a3e8  a1 30         lda ($30,x)
$11:a3ea  78            sei
$11:a3eb  44 92 93      mvp $93,$92
$11:a3ee  03 ac         ora $ac,s
$11:a3f0  52 26         eor ($26)
$11:a3f2  34 99         bit $99,x
$11:a3f4  90 b0         bcc $a3a6
$11:a3f6  84 e1         sty $e1
$11:a3f8  60            rts
$11:a3f9  e0 67 29      cpx #$2967
$11:a3fc  1c 8c 04      trb $048c
$11:a3ff  43 49         eor $49,s
$11:a401  18            clc
$11:a402  92 16         sta ($16)
$11:a404  cb            wai
$11:a405  01 20         ora ($20,x)
$11:a407  e0 48 29      cpx #$2948
$11:a40a  12 4c         ora ($4c)
$11:a40c  04 d0         tsb $d0
$11:a40e  38            sec
$11:a40f  39 82 d9      and $d982,y
$11:a412  40            rti
$11:a413  55 41         eor $41,x
$11:a415  01 85         ora ($85,x)
$11:a417  c4 6e         cpy $6e
$11:a419  91 39         sta ($39),y
$11:a41b  34 82         bit $82,x
$11:a41d  43 4b         eor $4b,s
$11:a41f  2d 90 d0      and $d090
$11:a422  60            rts
$11:a423  11 18         ora ($18),y
$11:a425  43 ec         eor $ec,s
$11:a427  24 15         bit $15
$11:a429  9a            txs
$11:a42a  5c c0 ec da   jml $daecc0
$11:a42e  08            php
$11:a42f  85 73         sta $73
$11:a431  21 c8         and ($c8,x)
$11:a433  84 42         sty $42
$11:a435  34 87         bit $87,x
$11:a437  77 90         adc [$90],y
$11:a439  64 24         stz $24
$11:a43b  90 81         bcc $a3be
$11:a43d  50 98         bvc $a3d7
$11:a43f  ce 01 28      dec $2801
$11:a442  84 48         sty $48
$11:a444  20 12 e8      jsr $e812
$11:a447  45 aa         eor $aa
$11:a449  05 54         ora $54
$11:a44b  8a            txa
$11:a44c  0f ca 31 18   ora $1831ca
$11:a450  98            tya
$11:a451  4e 26 13      lsr $1326
$11:a454  0b            phd
$11:a455  bd fe f9      lda $f9fe,x
$11:a458  7e b4 5f      ror $5fb4,x
$11:a45b  0b            phd
$11:a45c  ec 96 f4      cpx $f496
$11:a45f  f2 d0         sbc ($d0)
$11:a461  20 1c ca      jsr $ca1c
$11:a464  27 42         and [$42]
$11:a466  81 a0         sta ($a0,x)
$11:a468  94 74         sty $74,x
$11:a46a  23 14         and $14,s
$11:a46c  88            dey
$11:a46d  45 92         eor $92
$11:a46f  09 75 a2      ora #$a275
$11:a472  f0 38         beq $a4ac
$11:a474  18            clc
$11:a475  8e 66 63      stx $6366
$11:a478  b1 d0         lda ($d0),y
$11:a47a  fc 78 3f      jsr ($3f78,x)
$11:a47d  1f 0f c5 e6   ora $e6c50f,x
$11:a481  fb            xce
$11:a482  3a            dec a
$11:a483  bf a7 ab 01   lda $01aba7,x
$11:a487  80 4f         bra $a4d8
$11:a489  6b            rtl
$11:a48a  70 40         bvs $a4cc
$11:a48c  01 0e         ora ($0e,x)
$11:a48e  87 4c         sta [$4c]
$11:a490  66 16         ror $16
$11:a492  3b            tsc
$11:a493  1d 5e 85      ora $855e,x
$11:a496  8f c0 73 b9   sta $b973c0
$11:a49a  19 f6 e0      ora $e0f6,y
$11:a49d  3b            tsc
$11:a49e  c2 1f         rep #$1f
$11:a4a0  0f 9f c7 ef   ora $efc79f
$11:a4a4  f3 fb         sbc ($fb,s),y
$11:a4a6  fd ff ff      sbc $ffff,x
$11:a4a9  3f ff 82 43   and $4382ff,x
$11:a4ad  e1 f0         sbc ($f0,x)
$11:a4af  8c 47 3d      sty $3d47
$11:a4b2  9c ef 77      stz $77ef
$11:a4b5  3f ad 87 fd   and $fd87ad,x
$11:a4b9  40            rti
$11:a4ba  fe 50 3f      inc $3f50,x
$11:a4bd  e7 a6         sbc [$a6]
$11:a4bf  01 f0         ora ($f0,x)
$11:a4c1  f0 7f         beq $a542
$11:a4c3  3e 1f ef      rol $ef1f,x
$11:a4c6  87 ff         sta [$ff]
$11:a4c8  f1 ff         sbc ($ff),y
$11:a4ca  fe 0a 07      inc $070a,x
$11:a4cd  fd ff 8e      sbc $8eff,x
$11:a4d0  c7 22         cmp [$22]
$11:a4d2  71 09         adc ($09),y
$11:a4d4  5c 82 75 20   jml $207582
$11:a4d8  96 c8         stx $c8,y
$11:a4da  22 d3 28 2c   jsl $2c28d3
$11:a4de  72 77         adc ($77)
$11:a4e0  68            pla
$11:a4e1  81 c0         sta ($c0,x)
$11:a4e3  21 f0         and ($f0,x)
$11:a4e5  08            php
$11:a4e6  f9 08 62      sbc $6208,y
$11:a4e9  70 c8         bvs $a4b3
$11:a4eb  0c 32 07      tsb $0732
$11:a4ee  20 b3 c0      jsr $c0b3
$11:a4f1  20 d0 e8      jsr $e8d0
$11:a4f4  21 20         and ($20,x)
$11:a4f6  23 95         and $95,s
$11:a4f8  7a            ply
$11:a4f9  a4 ae         ldy $ae
$11:a4fb  01 49         ora ($49,x)
$11:a4fd  b0 41         bcs $a540
$11:a4ff  2c 95 f9      bit $f995
$11:a502  fc 06 00      jsr ($0006,x)
$11:a505  3f 01 f8 52   and $52f801,x
$11:a509  c8            iny
$11:a50a  41 40         eor ($40,x)
$11:a50c  af c0 2b 70   lda $702bc0
$11:a510  09 03 a4      ora #$a403
$11:a513  5d a3 00      eor $00a3,x
$11:a516  81 40         sta ($40,x)
$11:a518  a0 b0 78      ldy #$78b0
$11:a51b  61 80         adc ($80,x)
$11:a51d  20 50 c3      jsr $c350
$11:a520  c8            iny
$11:a521  1b            tcs
$11:a522  95 d4         sta $d4,x
$11:a524  10 38         bpl $a55e
$11:a526  64 16         stz $16
$11:a528  10 3f         bpl $a569
$11:a52a  04 73         tsb $73
$11:a52c  17 c2         ora [$c2],y
$11:a52e  0c 4f 08      tsb $084f
$11:a531  44 86 60      mvp $60,$86
$11:a534  8e 82 f8      stx $f882
$11:a537  41 e0         eor ($e0,x)
$11:a539  10 e4         bpl $a51f
$11:a53b  29 3a 44      and #$443a
$11:a53e  04 19         tsb $19
$11:a540  68            pla
$11:a541  85 a2         sta $a2
$11:a543  d1 bf         cmp ($bf),y
$11:a545  c0 7c 51      cpy #$517c
$11:a548  cf 0f c0 45   cmp $45c00f
$11:a54c  f0 17         beq $a565
$11:a54e  f8            sed
$11:a54f  05 fd         ora $fd
$11:a551  d8            cld
$11:a552  26 e2         rol $e2
$11:a554  3c 86 4b      bit $4b86,x
$11:a557  01 42         ora ($42,x)
$11:a559  a0 59 2c      ldy #$2c59
$11:a55c  1b            tcs
$11:a55d  86 28         stx $28
$11:a55f  37 90         and [$90],y
$11:a561  f2 11         sbc ($11)
$11:a563  2c 04 0b      bit $0b04
$11:a566  41 06         eor ($06,x)
$11:a568  e0 4f 2f      cpx #$2f4f
$11:a56b  f5 0c         sbc $0c,x
$11:a56d  96 ae         stx $ae,y
$11:a56f  0f a0 bf 54   ora $54bfa0
$11:a573  f4 f1 0e      pea $0ef1
$11:a576  54 9e f7      mvn $f7,$9e
$11:a579  a0 fa 64      ldy #$64fa
$11:a57c  aa            tax
$11:a57d  10 1d         bpl $a59c
$11:a57f  5d 13 41      eor $4113,x
$11:a582  49 a9 e1      eor #$e1a9
$11:a585  22 1c 99 3c   jsl $3c991c
$11:a589  43 41         eor $41,s
$11:a58b  0d c9 43      ora $43c9
$11:a58e  6f 99 4a 94   adc $944a99
$11:a592  aa            tax
$11:a593  c1 8a         cmp ($8a,x)
$11:a595  b6 41         ldx $41,y
$11:a597  2d 59 09      and $0959
$11:a59a  35 23         and $23,x
$11:a59c  79 0a af      adc $af0a,y
$11:a59f  64 f2         stz $f2
$11:a5a1  90 09         bcc $a5ac
$11:a5a3  57 13         eor [$13],y
$11:a5a5  15 24         ora $24,x
$11:a5a7  82 74 83      brl $291e
$11:a5aa  03 90         ora $90,s
$11:a5ac  85 58         sta $58
$11:a5ae  32 76         and ($76)
$11:a5b0  0b            phd
$11:a5b1  e5 5a         sbc $5a
$11:a5b3  3d 20 8a      and $8a20,x
$11:a5b6  c8            iny
$11:a5b7  a0 b3 0b      ldy #$0bb3
$11:a5ba  c5 5b         cmp $5b
$11:a5bc  59 00 af      eor $af00,y
$11:a5bf  4a            lsr a
$11:a5c0  3b            tsc
$11:a5c1  f8            sed
$11:a5c2  0a            asl a
$11:a5c3  b4 06         ldy $06,x
$11:a5c5  41 4d         eor ($4d,x)
$11:a5c7  91 53         sta ($53),y
$11:a5c9  66 14         ror $14
$11:a5cb  ea            nop
$11:a5cc  b6 26         ldx $26,y
$11:a5ce  01 d8         ora ($d8,x)
$11:a5d0  94 64         sty $64,x
$11:a5d2  30 16         bmi $a5ea
$11:a5d4  0b            phd
$11:a5d5  e7 53         sbc [$53]
$11:a5d7  e1 08         sbc ($08,x)
$11:a5d9  a8            tay
$11:a5da  62 28 11      per $b705
$11:a5dd  89 e7 52      bit #$52e7
$11:a5e0  d5 00         cmp $00,x
$11:a5e2  fa            plx
$11:a5e3  4a            lsr a
$11:a5e4  3e d0 2e      rol $2ed0,x
$11:a5e7  a4 02         ldy $02
$11:a5e9  11 64         ora ($64),y
$11:a5eb  c4 59         cpy $59
$11:a5ed  23 1e         and $1e,s
$11:a5ef  4e a4 8a      lsr $8aa4
$11:a5f2  01 36         ora ($36,x)
$11:a5f4  94 44         sty $44,x
$11:a5f6  a0 50 cb      ldy #$cb50
$11:a5f9  04 22         tsb $22
$11:a5fb  d1 08         cmp ($08),y
$11:a5fd  12 05         ora ($05)
$11:a5ff  8a            txa
$11:a600  8d 11 20      sta $2011
$11:a603  04 8a         tsb $8a
$11:a605  33 11         and ($11,s),y
$11:a607  8a            txa
$11:a608  45 2e         eor $2e
$11:a60a  17 83         ora [$83],y
$11:a60c  f8            sed
$11:a60d  5e 2f 93      lsr $932f,x
$11:a610  9b            txy
$11:a611  fc fa 7f      jsr ($7ffa,x)
$11:a614  1c 9f 43      trb $439f
$11:a617  a3 f0         lda $f0,s
$11:a619  b8            clv
$11:a61a  fb            xce
$11:a61b  79 30 0c      adc $0c30,y
$11:a61e  e5 4b         sbc $4b
$11:a620  ba            tsx
$11:a621  59 e6 12      eor $12e6,y
$11:a624  18            clc
$11:a625  c4 42         cpy $42
$11:a627  15 08         ora $08,x
$11:a629  83 41         sta $41,s
$11:a62b  e0 30 17      cpx #$1730
$11:a62e  20 2e 02      jsr $022e
$11:a631  05 00         ora $00
$11:a633  8f 4f e1 f1   sta $f1e14f
$11:a637  f8            sed
$11:a638  3c 3e 01      bit $013e,x
$11:a63b  07 5d         ora [$5d]
$11:a63d  0a            asl a
$11:a63e  e8            inx
$11:a63f  20 30 38      jsr $3830
$11:a642  1b            tcs
$11:a643  90 30         bcc $a675
$11:a645  78            sei
$11:a646  08            php
$11:a647  ac 4e b5      ldy $b54e
$11:a64a  42 e3         wdm #$e3
$11:a64c  dd 3a f4      cmp $f43a,x
$11:a64f  08            php
$11:a650  ed 02 27      sbc $2702
$11:a653  88            dey
$11:a654  49 17 8f      eor #$8f17
$11:a657  e1 be         sbc ($be,x)
$11:a659  fe e2 3f      inc $3fe2,x
$11:a65c  f8            sed
$11:a65d  0e 5e 03      asl $035e
$11:a660  9f 08 c7 c2   sta $c2c708,x
$11:a664  f0 14         beq $a67a
$11:a666  3e 04 b6      rol $b604,x
$11:a669  d1 13         cmp ($13),y
$11:a66b  98            tya
$11:a66c  46 67         lsr $67
$11:a66e  10 c8         bpl $a638
$11:a670  e4 1a         cpx $1a
$11:a672  3d 01 87      and $8701,x
$11:a675  df ff f3 ff   cmp $fff3ff,x
$11:a679  fc 5e ff      jsr ($ff5e,x)
$11:a67c  0f 9f c1 e7   ora $e7c19f
$11:a680  f0 38         beq $a6ba
$11:a682  fc 05 1c      jsr ($1c05,x)
$11:a685  10 ff         bpl $a686
$11:a687  ed e7 ff      sbc $ffe7
$11:a68a  f5 fe         sbc $fe,x
$11:a68c  dc 7f 54      jml [$547f]
$11:a68f  2b            pld
$11:a690  24 1a         bit $1a
$11:a692  11 0c         ora ($0c),y
$11:a694  a8            tay
$11:a695  56 38         lsr $38,x
$11:a697  1f 0f f7 fc   ora $fcf70f,x
$11:a69b  3e 5f cf      rol $cf5f,x
$11:a69e  f7 e3         sbc [$e3],y
$11:a6a0  fd f0 fe      sbc $fef0,x
$11:a6a3  68            pla
$11:a6a4  3f 10 0f 84   and $840f10,x
$11:a6a8  66 59         ror $59
$11:a6aa  70 83         bvs $a62f
$11:a6ac  47 e1         eor [$e1]
$11:a6ae  50 d8         bvc $a688
$11:a6b0  24 34         bit $34
$11:a6b2  1a            inc a
$11:a6b3  10 26         bpl $a6db
$11:a6b5  30 33         bmi $a6ea
$11:a6b7  82 47 40      brl $e701
$11:a6ba  1a            inc a
$11:a6bb  84 15         sty $15
$11:a6bd  8a            txa
$11:a6be  50 25         bvc $a6e5
$11:a6c0  e8            inx
$11:a6c1  25 ca         and $ca
$11:a6c3  55 1e         eor $1e,x
$11:a6c5  8c 8c 81      sty $818c
$11:a6c8  8a            txa
$11:a6c9  6b            rtl
$11:a6ca  d0 5e         bne $a72a
$11:a6cc  84 11         sty $11
$11:a6ce  78            sei
$11:a6cf  04 70         tsb $70
$11:a6d1  5c 01 88 99   jml $998801
$11:a6d5  c0 ce 02      cpy #$02ce
$11:a6d8  d8            cld
$11:a6d9  ea            nop
$11:a6da  3e 13 00      rol $0013,x
$11:a6dd  e8            inx
$11:a6de  40            rti
$11:a6df  38            sec
$11:a6e0  0a            asl a
$11:a6e1  58            cli
$11:a6e2  4b            phk
$11:a6e3  ef ca 3d 86   sbc $863dca
$11:a6e7  c3 59         cmp $59,s
$11:a6e9  2c 1e 68      bit $681e
$11:a6ec  ff fe 01 7f   sbc $7f01fe,x
$11:a6f0  1e 0b 24      asl $240b,x
$11:a6f3  2d 10 9d      and $9d10
$11:a6f6  cd 02 df      cmp $df02
$11:a6f9  10 8c         bpl $a687
$11:a6fb  20 9f 71      jsr $719f
$11:a6fe  38            sec
$11:a6ff  ab            plb
$11:a700  d4 34         pei ($34)
$11:a702  9f 0b 46 63   sta $63460b,x
$11:a706  ef 1f f4 c6   sbc $c6f41f
$11:a70a  bd 72 cb      lda $cb72,x
$11:a70d  f4 02 8f      pea $8f02
$11:a710  80 d7         bra $a6e9
$11:a712  8e 02 01      stx $0102
$11:a715  17 80         ora [$80],y
$11:a717  44 20 11      mvp $11,$20
$11:a71a  a8            tay
$11:a71b  24 b1         bit $b1
$11:a71d  8e 10 0d      stx $0d10
$11:a720  06 82         asl $82
$11:a722  a1 60         lda ($60,x)
$11:a724  68            pla
$11:a725  86 c3         stx $c3
$11:a727  81 70         sta ($70,x)
$11:a729  c0 78 0e      cpy #$0e78
$11:a72c  c7 60         cmp [$60]
$11:a72e  88            dey
$11:a72f  1d c0 ef      ora $efc0,x
$11:a732  5c 7d 87 f2   jml $f2877d
$11:a736  4d cd 90      eor $90cd
$11:a739  7f 25 53 f8   adc $f85325,x
$11:a73d  05 7d         ora $7d
$11:a73f  44 10 4d      mvp $4d,$10
$11:a742  e5 c3         sbc $c3
$11:a744  61 0d         adc ($0d,x)
$11:a746  93 42         sta ($42,s),y
$11:a748  64 11         stz $11
$11:a74a  a9 55 46      lda #$4655
$11:a74d  01 50         ora ($50,x)
$11:a74f  a0 48 20      ldy #$2048
$11:a752  93 0b         sta ($0b,s),y
$11:a754  84 0f         sty $0f
$11:a756  8d 1a bf      sta $bf1a
$11:a759  f2 2c         sbc ($2c)
$11:a75b  f0 8b         beq $a6e8
$11:a75d  f6 a0         inc $a0,x
$11:a75f  58            cli
$11:a760  1f 48 27 b2   ora $b22748,x
$11:a764  81 7a         sta ($7a,x)
$11:a766  8e 46 ac      stx $ac46
$11:a769  3c 89 04      bit $0489,x
$11:a76c  23 61         and $61,s
$11:a76e  a8            tay
$11:a76f  8a            txa
$11:a770  40            rti
$11:a771  22 90 48 45   jsl $454890
$11:a775  02 31         cop #$31
$11:a777  1c c0 5b      trb $5bc0
$11:a77a  f8            sed
$11:a77b  97 cd         sta [$cd],y
$11:a77d  86 aa         stx $aa
$11:a77f  b9 ec aa      lda $aaec,y
$11:a782  40            rti
$11:a783  e5 b0         sbc $b0
$11:a785  09 1c 02      ora #$021c
$11:a788  41 a0         eor ($a0,x)
$11:a78a  f0 71         beq $a7fd
$11:a78c  26 1b         rol $1b
$11:a78e  08            php
$11:a78f  1d 72 02      ora $0272,x
$11:a792  36 1a         rol $1a,x
$11:a794  04 8c         tsb $8c
$11:a796  12 14         ora ($14)
$11:a798  06 c8         asl $c8
$11:a79a  7b            tdc
$11:a79b  28            plp
$11:a79c  d7 c8         cmp [$c8],y
$11:a79e  d6 ae         dec $ae,x
$11:a7a0  eb            xba
$11:a7a1  6e aa 60      ror $60aa
$11:a7a4  2d 10 0c      and $0c10
$11:a7a7  44 02 11      mvp $11,$02
$11:a7aa  0a            asl a
$11:a7ab  87 51         sta [$51]
$11:a7ad  a3 11         lda $11,s
$11:a7af  ac 05 d6      ldy $d605
$11:a7b2  01 54         ora ($54,x)
$11:a7b4  c0 da 20      cpy #$20da
$11:a7b7  98            tya
$11:a7b8  81 48         sta ($48,x)
$11:a7ba  41 21         eor ($21,x)
$11:a7bc  d0 08         bne $a7c6
$11:a7be  0c 22 35      tsb $3522
$11:a7c1  12 ba         ora ($ba)
$11:a7c3  41 63         eor ($63,x)
$11:a7c5  31 88         and ($88),y
$11:a7c7  14 06         trb $06
$11:a7c9  09 01 83      ora #$8301
$11:a7cc  c0 a0 90      cpy #$90a0
$11:a7cf  28            plp
$11:a7d0  3c 3e 1b      bit $1b3e,x
$11:a7d3  1f bc 5f 64   ora $645fbc,x
$11:a7d7  13 88         ora ($88,s),y
$11:a7d9  0a            asl a
$11:a7da  1c 20 50      trb $5020
$11:a7dd  28            plp
$11:a7de  01 dc         ora ($dc,x)
$11:a7e0  37 98         and [$98],y
$11:a7e2  0e 95 f3      asl $f395
$11:a7e5  5b            tcd
$11:a7e6  ae da d1      ldx $d1da
$11:a7e9  b7 30         lda [$30],y
$11:a7eb  5b            tcd
$11:a7ec  94 0b         sty $0b,x
$11:a7ee  b3 06         lda ($06,s),y
$11:a7f0  fb            xce
$11:a7f1  ca            dex
$11:a7f2  5c 41 bc e0   jml $e0bc41
$11:a7f6  5b            tcd
$11:a7f7  ba            tsx
$11:a7f8  14 6d         trb $6d
$11:a7fa  c4 1b         cpy $1b
$11:a7fc  f7 01         sbc [$01],y
$11:a7fe  ff c1 7f 72   sbc $727fc1,x
$11:a802  8e 4b 92      stx $924b
$11:a805  31 18         and ($18),y
$11:a807  8b            phb
$11:a808  05 a3         ora $a3
$11:a80a  27 13         and [$13]
$11:a80c  72 34         adc ($34)
$11:a80e  20 d6 18      jsr $18d6
$11:a811  cc 27 b3      cpy $b327
$11:a814  d9 ff 72      cmp $72ff,y
$11:a817  24 82         bit $82
$11:a819  01 63         ora ($63,x)
$11:a81b  a1 59         lda ($59,x)
$11:a81d  78            sei
$11:a81e  94 ae         sty $ae,x
$11:a820  c4 39         cpy $39
$11:a822  16 0a         asl $0a,x
$11:a824  f1 a0         sbc ($a0),y
$11:a826  50 2c         bvc $a854
$11:a828  16 09         asl $09,x
$11:a82a  0d 8e 47      ora $478e
$11:a82d  e7 93         sbc [$93]
$11:a82f  ff ff 9f e8   sbc $e89fff,x
$11:a833  1c 0e 0b      trb $0b0e
$11:a836  04 8f         tsb $8f
$11:a838  c6 e7         dec $e7
$11:a83a  f3 6b         sbc ($6b,s),y
$11:a83c  bd 82 93      lda $9382,x
$11:a83f  c0 f1 70      cpy #$70f1
$11:a842  29 3c 18      and #$183c
$11:a845  03 bc         ora $bc,s
$11:a847  20 f0 78      jsr $78f0
$11:a84a  fc 3e 7f      jsr ($7f3e,x)
$11:a84d  1f bf cf ff   ora $ffcfbf,x
$11:a851  e0 90 9f      cpx #$9f90
$11:a854  7f fe 1f 0f   adc $0f1ffe,x
$11:a858  64 33         stz $33
$11:a85a  f5 f2         sbc $f2,x
$11:a85c  fd 6c ae      sbc $ae6c,x
$11:a85f  b2 1d         lda ($1d)
$11:a861  6c b7 fd      jmp ($fdb7)
$11:a864  ff 0d 84 00   sbc $00840d,x
$11:a868  1e 1f c7      asl $c71f,x
$11:a86b  68            pla
$11:a86c  3b            tsc
$11:a86d  40            rti
$11:a86e  36 1d         rol $1d,x
$11:a870  26 70         rol $70
$11:a872  0a            asl a
$11:a873  86 3f         stx $3f
$11:a875  20 9f d0      jsr $d09f
$11:a878  2f f8 01 99   and $9901f8
$11:a87c  0c 40 5e      tsb $5e40
$11:a87f  10 78         bpl $a8f9
$11:a881  43 50         eor $50,s
$11:a883  68            pla
$11:a884  09 f0 21      ora #$21f0
$11:a887  99 08 1a      sta $1a08,y
$11:a88a  a0 3e 05      ldy #$053e
$11:a88d  78            sei
$11:a88e  bb            tyx
$11:a88f  ca            dex
$11:a890  1f 0c 85 c6   ora $c6850c,x
$11:a894  60            rts
$11:a895  71 22         adc ($22),y
$11:a897  c8            iny
$11:a898  2b            pld
$11:a899  cc 00 30      cpy $3000
$11:a89c  38            sec
$11:a89d  78            sei
$11:a89e  0c 63 e0      tsb $e063
$11:a8a1  30 57         bmi $a8fa
$11:a8a3  97 03         sta [$03],y
$11:a8a5  81 20         sta ($20,x)
$11:a8a7  90 74         bcc $a91d
$11:a8a9  32 1e         and ($1e)
$11:a8ab  8e 47 a2      stx $a247
$11:a8ae  d1 e0         cmp ($e0),y
$11:a8b0  a4 2b         ldy $2b
$11:a8b2  cc e6 1e      cpy $1ee6
$11:a8b5  0f 00 3c 3f   ora $3f3c00
$11:a8b9  08            php
$11:a8ba  92 86         sta ($86)
$11:a8bc  40            rti
$11:a8bd  22 50 08 0a   jsl $0a0850
$11:a8c1  48            pha
$11:a8c2  60            rts
$11:a8c3  50 27         bvc $a8ec
$11:a8c5  78            sei
$11:a8c6  43 61         eor $61,s
$11:a8c8  91 b8         sta ($b8),y
$11:a8ca  84 02         sty $02
$11:a8cc  1d 00 5f      ora $5f00,x
$11:a8cf  02 4c         cop #$4c
$11:a8d1  60            rts
$11:a8d2  49 30 7f      eor #$7f30
$11:a8d5  84 02         sty $02
$11:a8d7  1e 7f 35      asl $357f,x
$11:a8da  72 60         adc ($60)
$11:a8dc  30 0e         bmi $a8ec
$11:a8de  50 d8         bvc $a8b8
$11:a8e0  27 81         and [$81]
$11:a8e2  5d 50 0f      eor $0f50,x
$11:a8e5  01 24         ora ($24,x)
$11:a8e7  c8            iny
$11:a8e8  00 9e         brk #$9e
$11:a8ea  04 f0         tsb $f0
$11:a8ec  1d 42 21      ora $2142,x
$11:a8ef  38            sec
$11:a8f0  e3 71         sbc $71,s
$11:a8f2  89 27 30      bit #$3027
$11:a8f5  71 8c         adc ($8c),y
$11:a8f7  41 b4         eor ($b4,x)
$11:a8f9  07 f0         ora [$f0]
$11:a8fb  9c 40 3e      stz $3e40
$11:a8fe  d4 cc         pei ($cc)
$11:a900  dc 9f 3f      jml [$3f9f]
$11:a903  20 df f8      jsr $f8df
$11:a906  1e 60 37      asl $3760,x
$11:a909  18            clc
$11:a90a  06 ff         asl $ff
$11:a90c  81 4c         sta ($4c,x)
$11:a90e  80 c9         bra $a8d9
$11:a910  e8            inx
$11:a911  12 0a         ora ($0a)
$11:a913  03 34         ora $34,s
$11:a915  24 1c         bit $1c
$11:a917  06 58         asl $58
$11:a919  1c 86 01      trb $0186
$11:a91c  de b2 6c      dec $6cb2,x
$11:a91f  b9 1f 38      lda $381f,y
$11:a922  47 ee         eor [$ee]
$11:a924  1c 13 0f      trb $0f13
$11:a927  ec 0b f3      cpx $f30b
$11:a92a  00 fd         brk #$fd
$11:a92c  c1 ac         cmp ($ac,x)
$11:a92e  90 0e         bcc $a93e
$11:a930  44 12 11      mvp $11,$12
$11:a933  04 50         tsb $50
$11:a935  04 22         tsb $22
$11:a937  0d 02 3f      ora $3f02
$11:a93a  84 1a         sty $1a
$11:a93c  0c 43 09      tsb $0943
$11:a93f  05 80         ora $80
$11:a941  5e 12 0c      lsr $0c12,x
$11:a944  00 34         brk #$34
$11:a946  1c 00 38      trb $3800
$11:a949  1c 00 bc      trb $bc00
$11:a94c  01 02         ora ($02,x)
$11:a94e  07 01         ora [$01]
$11:a950  b0 e0         bcs $a932
$11:a952  08            php
$11:a953  e4 cb         cpx $cb
$11:a955  08            php
$11:a956  14 22         trb $22
$11:a958  18            clc
$11:a959  4f 08 44 08   eor $084408
$11:a95d  5a            phy
$11:a95e  10 48         bpl $a9a8
$11:a960  0c 14 ae      tsb $ae14
$11:a963  09 70 13      ora #$1370
$11:a966  90 9c         bcc $a904
$11:a968  0a            asl a
$11:a969  c3 02         cmp $02,s
$11:a96b  82 c0 a0      brl $4a2e
$11:a96e  90 35         bcc $a9a5
$11:a970  38            sec
$11:a971  41 e0         eor ($e0,x)
$11:a973  50 91         bvc $a906
$11:a975  20 41 61      jsr $6141
$11:a978  b0 78         bcs $a9f2
$11:a97a  5c 1e 0e c6   jml $c60e1e
$11:a97e  35 38         and $38,x
$11:a980  19 c6 00      ora $00c6,y
$11:a983  79 03 ca      adc $ca03,y
$11:a986  31 83         and ($83),y
$11:a988  11 25         ora ($25),y
$11:a98a  96 4e         stx $4e,y
$11:a98c  2b            pld
$11:a98d  16 1f         asl $1f,x
$11:a98f  0e 07 03      asl $0307
$11:a992  01 44         ora ($44,x)
$11:a994  24 93         bit $93
$11:a996  a3 38         lda $38,s
$11:a998  e0 58 30      cpx #$3058
$11:a99b  38            sec
$11:a99c  04 c0         tsb $c0
$11:a99e  26 14         rol $14
$11:a9a0  7a            ply
$11:a9a1  12 8d         ora ($8d)
$11:a9a3  05 4e         ora $4e
$11:a9a5  61 c7         adc ($c7,x)
$11:a9a7  a3 82         lda $82,s
$11:a9a9  45 34         eor $34
$11:a9ab  77 ff         adc [$ff],y
$11:a9ad  fd 7f ff      sbc $ff7f,x
$11:a9b0  cf ff e0 38   cmp $38e0ff
$11:a9b4  e3 d0         sbc $d0,s
$11:a9b6  26 0a         rol $0a
$11:a9b8  68            pla
$11:a9b9  67 90         adc [$90]
$11:a9bb  4f c4 23 61   eor $6123c4
$11:a9bf  30 64         bmi $aa25
$11:a9c1  a2 68 bf      ldx #$bf68
$11:a9c4  1f cf 87 e3   ora $e387cf,x
$11:a9c8  81 f0         sta ($f0,x)
$11:a9ca  17 03         ora [$03],y
$11:a9cc  5d ac 7e      eor $7eac,x
$11:a9cf  39 7f be      and $be7f,y
$11:a9d2  2f 57 8f cf   and $cf8f57
$11:a9d6  e0 f1 f8      cpx #$f8f1
$11:a9d9  0c 3d 08      tsb $083d
$11:a9dc  30 18         bmi $a9f6
$11:a9de  e7 fe         sbc [$fe]
$11:a9e0  21 ff         and ($ff,x)
$11:a9e2  94 5f         sty $5f,x
$11:a9e4  e0 13 f8      cpx #$f813
$11:a9e7  04 7e         tsb $7e
$11:a9e9  00 fa         brk #$fa
$11:a9eb  3d d6 ee      and $eed6,x
$11:a9ee  9d cf d2      sta $d2cf,x
$11:a9f1  79 b3 9f      adc $9fb3,y
$11:a9f4  ee 07 f2      inc $f207
$11:a9f7  81 f8         sta ($f8,x)
$11:a9f9  80 39         bra $aa34
$11:a9fb  03 c1         ora $c1,s
$11:a9fd  44 ff cc      mvp $cc,$ff
$11:aa00  3f f1 8f f4   and $f48ff1,x
$11:aa04  00 48         brk #$48
$11:aa06  1f c6 f0 06   ora $06f0c6,x
$11:aa0a  ca            dex
$11:aa0b  06 6b         asl $6b
$11:aa0d  02 c0         cop #$c0
$11:aa0f  1b            tcs
$11:aa10  40            rti
$11:aa11  c2 09         rep #$09
$11:aa13  85 33         sta $33
$11:aa15  00 fc         brk #$fc
$11:aa17  4c 20 36      jmp $3620
$11:aa1a  78            sei
$11:aa1b  6c 62 29      jmp ($2962)
$11:aa1e  0c 8d c1      tsb $c18d
$11:aa21  e1 91         sbc ($91,x)
$11:aa23  38            sec
$11:aa24  3c 20 6a      bit $6a20,x
$11:aa27  29 a1 7b      and #$7ba1
$11:aa2a  84 0d         sty $0d
$11:aa2c  f4 51 38      pea $3851
$11:aa2f  04 20         tsb $20
$11:aa31  86 29         stx $29
$11:aa33  a1 e8         lda ($e8,x)
$11:aa35  66 2d         ror $2d
$11:aa37  13 0a         ora ($0a,s),y
$11:aa39  c5 82         cmp $82
$11:aa3b  61 c8         adc ($c8,x)
$11:aa3d  f0 44         beq $aa83
$11:aa3f  30 14         bmi $aa55
$11:aa41  04 d1         tsb $d1
$11:aa43  78            sei
$11:aa44  1c 43 80      trb $8043
$11:aa47  f0 40         beq $aa89
$11:aa49  39 10 08      and $0810,y
$11:aa4c  84 00         sty $00
$11:aa4e  f4 64 a0      pea $a064
$11:aa51  80 c0         bra $aa13
$11:aa53  60            rts
$11:aa54  d0 68         bne $aabe
$11:aa56  4c 22 0f      jmp $0f22
$11:aa59  12 8b         ora ($8b)
$11:aa5b  cc 61 72      cpy $7261
$11:aa5e  19 7d 8d      ora $8d7d,y
$11:aa61  1c 70 78      trb $7870
$11:aa64  3c 3e 1f      bit $1f3e,x
$11:aa67  1f 87 cf de   ora $decf87,x
$11:aa6b  a1 1f         lda ($1f,x)
$11:aa6d  bf dc af d8   lda $d8afdc,x
$11:aa71  1c 0f 36      trb $360f
$11:aa74  01 ef         ora ($ef,x)
$11:aa76  81 ff         sta ($ff,x)
$11:aa78  e8            inx
$11:aa79  ff ff 7f ff   sbc $ff7fff,x
$11:aa7d  95 ff         sta $ff,x
$11:aa7f  e7 c0         sbc [$c0]
$11:aa81  2f d7 ef fb   and $fbefd7
$11:aa85  0a            asl a
$11:aa86  89 41 80      bit #$8041
$11:aa89  c0 58 2c      cpy #$2c58
$11:aa8c  19 08 87      ora $8708,y
$11:aa8f  23 11         and $11,s
$11:aa91  f4 e2 7d      pea $7de2
$11:aa94  30 9e         bmi $aa34
$11:aa96  ae 11 28      ldx $2811
$11:aa99  70 08         bvs $aaa3
$11:aa9b  30 f0         bmi $aa8d
$11:aa9d  7c 3e 1f      jmp ($1f3e,x)
$11:aaa0  8f c7 f1 d2   sta $d2f1c7
$11:aaa4  1f cf f4 fe   ora $fef4cf,x
$11:aaa8  80 ef         bra $aa99
$11:aaaa  2b            pld
$11:aaab  fc 01 9c      jsr ($9c01,x)
$11:aaae  11 f8         ora ($f8),y
$11:aab0  01 88         ora ($88,x)
$11:aab2  20 68 90      jsr $9068
$11:aab5  3c 80 00      bit $0080,x
$11:aab8  5c 20 39 51   jml $513920
$11:aabc  48            pha
$11:aabd  41 3f         eor ($3f,x)
$11:aabf  30 50         bmi $ab11
$11:aac1  78            sei
$11:aac2  0a            asl a
$11:aac3  03 fc         ora $fc,s
$11:aac5  2b            pld
$11:aac6  20 28 c1      jsr $c128
$11:aac9  20 50 58      jsr $5850
$11:aacc  14 11         trb $11
$11:aace  fa            plx
$11:aacf  0f d0 1c ac   ora $ac1cd0
$11:aad3  19 18 a9      ora $a918,y
$11:aad6  10 50         bpl $ab28
$11:aad8  81 68         sta ($68,x)
$11:aada  94 81         sty $81,x
$11:aadc  04 82         tsb $82
$11:aade  27 c8         and [$c8]
$11:aae0  8a            txa
$11:aae1  50 31         bvc $ab14
$11:aae3  30 8b         bmi $aa70
$11:aae5  c2 19         rep #$19
$11:aae7  00 e0         brk #$e0
$11:aae9  03 82         ora $82,s
$11:aaeb  01 28         ora ($28,x)
$11:aaed  80 4b         bra $ab3a
$11:aaef  25 82         and $82
$11:aaf1  b3 83         lda ($83,s),y
$11:aaf3  43 a1         eor $a1,s
$11:aaf5  ce 40 74      dec $7440
$11:aaf8  05 f2         ora $f2
$11:aafa  f9 10 9e      sbc $9e10,y
$11:aafd  0a            asl a
$11:aafe  52 fd         eor ($fd)
$11:ab00  00 a1         brk #$a1
$11:ab02  1c 94 e2      trb $e294
$11:ab05  07 cf         ora [$cf]
$11:ab07  37 7a         and [$7a],y
$11:ab09  7b            tdc
$11:ab0a  e0 15 ea      cpx #$ea15
$11:ab0d  47 fb         eor [$fb]
$11:ab0f  78            sei
$11:ab10  b3 0d         lda ($0d,s),y
$11:ab12  ee 66 31      inc $3166
$11:ab15  c1 80         cmp ($80,x)
$11:ab17  58            cli
$11:ab18  a0 13 c8      ldy #$c813
$11:ab1b  f4 7a 7f      pea $7f7a
$11:ab1e  7f bf ff d8   adc $d8ffbf,x
$11:ab22  61 7e         adc ($7e,x)
$11:ab24  ff cf bf f1   sbc $f1bfcf,x
$11:ab28  c4 88         cpy $88
$11:ab2a  4f 26 13 0b   eor $0b1326
$11:ab2e  a5 12         lda $12
$11:ab30  75 02         adc $02,x
$11:ab32  ff 6c ff 18   sbc $18ff6c,x
$11:ab36  3a            dec a
$11:ab37  87 1e         sta [$1e]
$11:ab39  41 6e         eor ($6e,x)
$11:ab3b  5e 84 02      lsr $0284,x
$11:ab3e  61 38         adc ($38,x)
$11:ab40  33 85         and ($85,s),y
$11:ab42  fa            plx
$11:ab43  f9 ff 72      sbc $72ff,y
$11:ab46  84 e3         sty $e3
$11:ab48  ff 10 66 08   sbc $086610,x
$11:ab4c  c5 20         cmp $20
$11:ab4e  70 28         bvs $ab78
$11:ab50  7c 3a 6f      jmp ($6f3a,x)
$11:ab53  31 a7         and ($a7),y
$11:ab55  d1 f7         cmp ($f7),y
$11:ab57  f8            sed
$11:ab58  b1 82         lda ($82),y
$11:ab5a  92 c2         sta ($c2)
$11:ab5c  1f 0f 9f b0   ora $b09f0f,x
$11:ab60  48            pha
$11:ab61  ce 19 4c      dec $4c19
$11:ab64  25 e9         and $e9
$11:ab66  a8            tay
$11:ab67  1a            inc a
$11:ab68  af 8f 07 c7   lda $c7078f
$11:ab6c  c3 f3         cmp $f3,s
$11:ab6e  e1 f5         sbc ($f5,x)
$11:ab70  d0 f8         bne $ab6a
$11:ab72  05 f2         ora $f2
$11:ab74  f1 fc         sbc ($fc),y
$11:ab76  fe 7f 84      inc $847f,x
$11:ab79  61 fe         adc ($fe,x)
$11:ab7b  ff ff 3f ff   sbc $ff3fff,x
$11:ab7f  8f ff c3 ff   sta $ffc3ff
$11:ab83  ff 80 0b da   sbc $da0b80,x
$11:ab87  7f c0 83 ce   adc $ce83c0,x
$11:ab8b  20 10 75      jsr $7510
$11:ab8e  04 f0         tsb $f0
$11:ab90  20 03 c1      jsr $c103
$11:ab93  03 04         ora $04,s
$11:ab95  36 19         rol $19,x
$11:ab97  13 88         ora ($88,s),y
$11:ab99  ca            dex
$11:ab9a  e4 35         cpx $35
$11:ab9c  fa            plx
$11:ab9d  24 7e         bit $7e
$11:ab9f  9f 7f e6 d7   sta $d7e67f,x
$11:aba3  f9 b0 00      sbc $00b0,y
$11:aba6  31 47         and ($47),y
$11:aba8  e3 e0         sbc $e0,s
$11:abaa  a1 33         lda ($33,x)
$11:abac  8f fc d6 1c   sta $1cd6fc
$11:abb0  0e 06 c2      asl $c206
$11:abb3  61 e8         adc ($e8,x)
$11:abb5  84 7d         sty $7d
$11:abb7  38            sec
$11:abb8  9f af 97 fb   sta $fb97af,x
$11:abbc  f5 fd         sbc $fd,x
$11:abbe  f0 ff         beq $abbf
$11:abc0  7b            tdc
$11:abc1  24 90         bit $90
$11:abc3  e0 7c 3e      cpx #$3e7c
$11:abc6  1f 8f c0 89   ora $89c08f,x
$11:abca  44 e1 07      mvp $07,$e1
$11:abcd  a1 d1         lda ($d1,x)
$11:abcf  78            sei
$11:abd0  11 3e         ora ($3e),y
$11:abd2  05 0f         ora $0f
$11:abd4  83 57         sta $57,s
$11:abd6  4b            phk
$11:abd7  07 42         ora [$42]
$11:abd9  e7 f0         sbc [$f0]
$11:abdb  8a            txa
$11:abdc  d4 27         pei ($27)
$11:abde  e6 a3         inc $a3
$11:abe0  35 94         and $94,x
$11:abe2  bf ff 0f 54   lda $540fff,x
$11:abe6  00 34         brk #$34
$11:abe8  15 61         ora $61,x
$11:abea  1b            tcs
$11:abeb  17 07         ora [$07],y
$11:abed  ff 7c 2e 0f   sbc $0f2e7c,x
$11:abf1  fe ff fe      inc $feff,x
$11:abf4  0d 0a c2      ora $c20a
$11:abf7  dc 57 f7      jml [$f757]
$11:abfa  f2 f1         sbc ($f1)
$11:abfc  7e b2 7f      ror $7fb2,x
$11:abff  ae 9f ef      ldx $ef9f
$11:ac02  87 f2         sta [$f2]
$11:ac04  d1 fe         cmp ($fe),y
$11:ac06  a0 7b a8      ldy #$a87b
$11:ac09  1e 52 0c      asl $0c52,x
$11:ac0c  23 11         and $11,s
$11:ac0e  40            rti
$11:ac0f  b8            clv
$11:ac10  5b            tcd
$11:ac11  f1 fe         sbc ($fe),y
$11:ac13  21 a9         and ($a9,x)
$11:ac15  0d 20 50      ora $5020
$11:ac18  08            php
$11:ac19  0b            phd
$11:ac1a  c2 e0         rep #$e0
$11:ac1c  2f e0 8f c1   and $c18fe0
$11:ac20  22 b0 08 6c   jsl $6c08b0
$11:ac24  12 05         ora ($05)
$11:ac26  06 83         asl $83
$11:ac28  c0 82 e1      cpy #$e182
$11:ac2b  01 30         ora ($30,x)
$11:ac2d  04 02         tsb $02
$11:ac2f  08            php
$11:ac30  1d 08 58      ora $5808,x
$11:ac33  7c 20 d0      jmp ($d020,x)
$11:ac36  17 e0         ora [$e0],y
$11:ac38  3f 00 3a 0f   and $0f3a00,x
$11:ac3c  28            plp
$11:ac3d  0d 83 f4      ora $f483
$11:ac40  21 71         and ($71,x)
$11:ac42  1b            tcs
$11:ac43  a4 4d         ldy $4d
$11:ac45  e4 c3         cpx $c3
$11:ac47  81 80         sta ($80,x)
$11:ac49  44 61 11      mvp $11,$61
$11:ac4c  3a            dec a
$11:ac4d  43 be         eor $be,s
$11:ac4f  b4 11         ldy $11,x
$11:ac51  0a            asl a
$11:ac52  e6 41         inc $41
$11:ac54  df 51 09 06   cmp $060951,x
$11:ac58  42 48         wdm #$48
$11:ac5a  f2 0b         sbc ($0b)
$11:ac5c  f4 02 84      pea $8402
$11:ac5f  72 53         adc ($53)
$11:ac61  88            dey
$11:ac62  1f 3d e4 27   ora $27e43d,x
$11:ac66  1f 50 6c e2   ora $e26c50,x
$11:ac6a  01 7c         ora ($7c,x)
$11:ac6c  59 1a c4      eor $c41a,y
$11:ac6f  15 5e         ora $5e,x
$11:ac71  f2 38         sbc ($38)
$11:ac73  44 e2 09      mvp $09,$e2
$11:ac76  74 84         stz $84,x
$11:ac78  78            sei
$11:ac79  23 9c         and $9c,s
$11:ac7b  08            php
$11:ac7c  c7 02         cmp [$02]
$11:ac7e  29 74 5e      and #$5e74
$11:ac81  a4 22         ldy $22
$11:ac83  f9 1c fe      sbc $fe1c,y
$11:ac86  4f 1c c2 e3   eor $e3c21c
$11:ac8a  01 68         ora ($68,x)
$11:ac8c  6f f0 15 4e   adc $4e15f0
$11:ac90  05 cb         ora $cb
$11:ac92  e5 3d         sbc $3d
$11:ac94  be c5 e7      ldx $e7c5,y
$11:ac97  f0 58         beq $acf1
$11:ac99  fc 02 0e      jsr ($0e02,x)
$11:ac9c  2d 0b ff      and $ff0b
$11:ac9f  fe 7f ff      inc $ff7f,x
$11:aca2  86 ff         stx $ff
$11:aca4  e0 57 f8      cpx #$f857
$11:aca7  04 fe         tsb $fe
$11:aca9  00 fa         brk #$fa
$11:acab  3c 54 2e      bit $2e54,x
$11:acae  a9 16 ce      lda #$ce16
$11:acb1  61 ba         adc ($ba,x)
$11:acb3  1c 4c 46      trb $464c
$11:acb6  33 c1         and ($c1,s),y
$11:acb8  e8            inx
$11:acb9  b8            clv
$11:acba  7e 20 1f      ror $1f20,x
$11:acbd  0f a7 ff d1   ora $d1ffa7
$11:acc1  fe bc 7f      inc $7fbc,x
$11:acc4  a7 1f         lda [$1f]
$11:acc6  cb            wai
$11:acc7  87 f2         sta [$f2]
$11:acc9  20 1c 00      jsr $001c
$11:accc  e0 c3 e2      cpx #$e2c3
$11:accf  11 f9         ora ($f9),y
$11:acd1  00 c4         brk #$c4
$11:acd3  27 f4         and [$f4]
$11:acd5  01 aa         ora ($aa,x)
$11:acd7  0c 40 d4      tsb $d440
$11:acda  10 01         bpl $acdd
$11:acdc  f0 0f         beq $aced
$11:acde  82 80 45      brl $f261
$11:ace1  59 05 77      eor $7705,y
$11:ace4  80 4f         bra $ad35
$11:ace6  09 45 82      ora #$8245
$11:ace9  69 70 8c      adc #$8c70
$11:acec  ce 61 d1      dec $d161
$11:acef  e8            inx
$11:acf0  1c 3e 01      trb $013e
$11:acf3  03 00         ora $00,s
$11:acf5  80 04         bra $acfb
$11:acf7  23 f7         and $f7,s
$11:acf9  f8            sed
$11:acfa  7d fe 0d      adc $0dfe,x
$11:acfd  3f 80 be 80   and $80be80,x
$11:ad01  b8            clv
$11:ad02  3f e9 1f ea   and $ea1fe9,x
$11:ad06  07 c4         ora [$c4]
$11:ad08  83 43         sta $43,s
$11:ad0a  21 d7         and ($d7,x)
$11:ad0c  8b            phb
$11:ad0d  e7 c3         sbc [$c3]
$11:ad0f  f1 40         sbc ($40),y
$11:ad11  f8            sed
$11:ad12  40            rti
$11:ad13  38            sec
$11:ad14  1f cf f9 fc   ora $fcf9cf,x
$11:ad18  3f 1f ef 87   and $87ef1f,x
$11:ad1c  fb            xce
$11:ad1d  01 fc         ora ($fc,x)
$11:ad1f  15 91         ora $91,x
$11:ad21  f4 27 37      pea $3727
$11:ad24  88            dey
$11:ad25  c4 e2         cpy $e2
$11:ad27  3f 3f 85 16   and $16853f,x
$11:ad2b  89 f8 10      bit #$10f8
$11:ad2e  17 e8         ora [$e8],y
$11:ad30  41 ef         eor ($ef,x)
$11:ad32  f0 70         beq $ada4
$11:ad34  40            rti
$11:ad35  1a            inc a
$11:ad36  11 34         ora ($34),y
$11:ad38  73 b8         adc ($b8,s),y
$11:ad3a  06 71         asl $71
$11:ad3c  96 38         stx $38,y
$11:ad3e  ac 17 8b      ldy $8b17
$11:ad41  c5 f7         cmp $f7
$11:ad43  fb            xce
$11:ad44  d7 bf         cmp [$bf],y
$11:ad46  f0 0b         beq $ad53
$11:ad48  f7 fd         sbc [$fd],y
$11:ad4a  7e 77 df      ror $df77,x
$11:ad4d  fc 77 ff      jsr ($ff77,x)
$11:ad50  08            php
$11:ad51  5e 02 f0      lsr $f002,x
$11:ad54  65 90         adc $90
$11:ad56  e8            inx
$11:ad57  44 32 31      mvp $31,$32
$11:ad5a  1c b0 5e      trb $5eb0
$11:ad5d  38            sec
$11:ad5e  1f 0c 07 82   ora $82070c,x
$11:ad62  01 80         ora ($80,x)
$11:ad64  7e 82 14      ror $1482,x
$11:ad67  3e 1f cf      rol $cf1f,x
$11:ad6a  07 f3         ora [$f3]
$11:ad6c  00 8a         brk #$8a
$11:ad6e  26 d1         rol $d1
$11:ad70  c2 20         rep #$20
$11:ad72  50 c8         bvc $ad3c
$11:ad74  3d ca 49      and $49ca,x
$11:ad77  26 81         rol $81
$11:ad79  c4 e9         cpy $e9
$11:ad7b  13 0a         ora ($0a,s),y
$11:ad7d  4d fe a1      eor $a1fe
$11:ad80  92 d5         sta ($d5)
$11:ad82  c0 a1 30      cpy #$30a1
$11:ad85  78            sei
$11:ad86  44 92 93      mvp $93,$92
$11:ad89  03 ac         ora $ac,s
$11:ad8b  52 26         eor ($26)
$11:ad8d  34 99         bit $99,x
$11:ad8f  95 42         sta $42,x
$11:ad91  03 ab         ora $ab,s
$11:ad93  a2 48 30      ldx #$3048
$11:ad96  16 0e         asl $0e,x
$11:ad98  06 72         asl $72
$11:ad9a  91 c8         sta ($c8),y
$11:ad9c  c0 44 34      cpy #$3444
$11:ad9f  91 89         sta ($89),y
$11:ada1  25 f3         and $f3
$11:ada3  29 52 95      and #$9552
$11:ada6  60            rts
$11:ada7  24 1c         bit $1c
$11:ada9  09 05 22      ora #$2205
$11:adac  49 80 9a      eor #$9a80
$11:adaf  06 07         asl $07
$11:adb1  31 94         and ($94),y
$11:adb3  80 4a         bra $adff
$11:adb5  b8            clv
$11:adb6  92 69         sta ($69)
$11:adb8  04 8a         tsb $8a
$11:adba  97 7e         sta [$7e],y
$11:adbc  a8            tay
$11:adbd  47 e4         eor [$e4]
$11:adbf  f0 b9         beq $ad7a
$11:adc1  64 af         stz $af
$11:adc3  37 73         and [$73],y
$11:adc5  ae 67 e4      ldx $e467
$11:adc8  32 0a         and ($0a)
$11:adca  cd 2e 60      cmp $602e
$11:adcd  0b            phd
$11:adce  09 3d 02      ora #$023d
$11:add1  59 41 cd      eor $cd41,y
$11:add4  d1 2b         cmp ($2b),y
$11:add6  98            tya
$11:add7  19 0f 33      ora $330f,y
$11:adda  91 08         sta ($08),y
$11:addc  c4 69         cpy $69
$11:adde  03 61         ora $61,s
$11:ade0  30 84         bmi $ad66
$11:ade2  68            pla
$11:ade3  2d 17 89      and $8917
$11:ade6  16 72         asl $72,x
$11:ade8  e9 f2 84      sbc #$84f2
$11:adeb  42 04         wdm #$04
$11:aded  c2 2b         rep #$2b
$11:adef  08            php
$11:adf0  47 12         eor [$12]
$11:adf2  d1 04         cmp ($04),y
$11:adf4  91 71         sta ($71),y
$11:adf6  2e 90 28      rol $2890
$11:adf9  45 99         eor $99
$11:adfb  5a            phy
$11:adfc  11 08         ora ($08),y
$11:adfe  05 c1         ora $c1
$11:ae00  1a            inc a
$11:ae01  10 09         bpl $ae0c
$11:ae03  01 dc         ora ($dc,x)
$11:ae05  16 42         asl $42,x
$11:ae07  71 05         adc ($05),y
$11:ae09  68            pla
$11:ae0a  5c 2e 1f 04   jml $041f2e
$11:ae0e  18            clc
$11:ae0f  f0 3c         beq $ae4d
$11:ae11  07 82         ora [$82]
$11:ae13  98            tya
$11:ae14  4c 16 42      jmp $4216
$11:ae17  8f 78 64 02   sta $026478
$11:ae1b  c5 02         cmp $02
$11:ae1d  47 c4         eor [$c4]
$11:ae1f  12 09         ora ($09)
$11:ae21  0e 87 7d      asl $7d87
$11:ae24  3e d0 f8      rol $f8d0,x
$11:ae27  7d 82 01      adc $0182,x
$11:ae2a  36 32         rol $32,x
$11:ae2c  02 89         cop #$89
$11:ae2e  4d e5 ff      eor $ffe5
$11:ae31  80 5f         bra $ae92
$11:ae33  e0 11 85      cpx #$8511
$11:ae36  b3 c0         lda ($c0,s),y
$11:ae38  28            plp
$11:ae39  0e b2 63      asl $63b2
$11:ae3c  43 4a         eor $4a,s
$11:ae3e  d4 4b         pei ($4b)
$11:ae40  07 83         ora [$83]
$11:ae42  c3 61         cmp $61,s
$11:ae44  b1 18         lda ($18),y
$11:ae46  c4 ce         cpy $ce
$11:ae48  61 19         adc ($19,x)
$11:ae4a  9c 54 8e      stz $8e54
$11:ae4d  60            rts
$11:ae4e  ef 38 14 3e   sbc $3e1438
$11:ae52  0f 1f 87 cf   ora $cf871f
$11:ae56  e0 f3 f8      cpx #$f8f3
$11:ae59  7b            tdc
$11:ae5a  0c 0f c3      tsb $c30f
$11:ae5d  c0 e0 48      cpy #$48e0
$11:ae60  24 0d         bit $0d
$11:ae62  20 f4 15      jsr $15f4
$11:ae65  82 01 d4      brl $8269
$11:ae68  82 28 8c      brl $3a93
$11:ae6b  26 1e         rol $1e
$11:ae6d  04 18         tsb $18
$11:ae6f  fe 05 43      inc $4305,x
$11:ae72  fc 8f c8      jsr ($c88f,x)
$11:ae75  21 f1         and ($f1,x)
$11:ae77  08            php
$11:ae78  3c 22 06      bit $0622,x
$11:ae7b  1e 08 1a      asl $1a08,x
$11:ae7e  89 64 07      bit #$0764
$11:ae81  01 5a         ora ($5a,x)
$11:ae83  80 d9         bra $ae5e
$11:ae85  d8            cld
$11:ae86  20 4f 68      jsr $684f
$11:ae89  ff 80 b0 0e   sbc $0eb080,x
$11:ae8d  2b            pld
$11:ae8e  2d 4c 06      and $064c
$11:ae91  03 02         ora $02,s
$11:ae93  81 2a         sta ($2a,x)
$11:ae95  42 09         wdm #$09
$11:ae97  0c 85 46      tsb $4685
$11:ae9a  0d cf 03      ora $03cf
$11:ae9d  81 c1         sta ($c1,x)
$11:ae9f  e0 60 61      cpx #$6160
$11:aea2  79 84 e6      adc $e684,y
$11:aea5  71 cb         adc ($cb),y
$11:aea7  e0 4f e0      cpx #$e04f
$11:aeaa  51 f8         eor ($f8),y
$11:aeac  5d fc 1a      eor $1afc,x
$11:aeaf  13 ff         ora ($ff,s),y
$11:aeb1  fc 3d e4      jsr ($e43d,x)
$11:aeb4  33 f4         and ($f4,s),y
$11:aeb6  e0 29 23      cpx #$2329
$11:aeb9  c1 e0         cmp ($e0,x)
$11:aebb  ae 47 3e      ldx $3e47
$11:aebe  70 3f         bvs $aeff
$11:aec0  e6 03         inc $03
$11:aec2  ff d4 ff 78   sbc $78ffd4,x
$11:aec6  3f 5f 0f ff   and $ff0f5f,x
$11:aeca  a0 d2 1e      ldy #$1ed2
$11:aecd  0f e7 f1 49   ora $49f1e7
$11:aed1  30 06         bmi $aed9
$11:aed3  79 e0 30      adc $30e0,y
$11:aed6  14 0a         trb $0a
$11:aed8  05 82         ora $82
$11:aeda  c1 90         cmp ($90,x)
$11:aedc  88            dey
$11:aedd  06 41         asl $41
$11:aedf  9e 8d 41      stz $418d,x
$11:aee2  e0 60 15      cpx #$1560
$11:aee5  e0 28 18      cpx #$1828
$11:aee8  be 82 fd      ldx $fd82,y
$11:aeeb  53 d3         eor ($d3,s),y
$11:aeed  c4 29         cpy $29
$11:aeef  5a            phy
$11:aef0  7a            ply
$11:aef1  fd 83 e9      sbc $e983,x
$11:aef4  12 e3         ora ($e3)
$11:aef6  cc 3f 92      cpy $923f
$11:aef9  6d 05 26      adc $2605
$11:aefc  a7 84         lda [$84]
$11:aefe  88            dey
$11:aeff  72 5e         adc ($5e)
$11:af01  61 60         adc ($60,x)
$11:af03  c6 c4         dec $c4
$11:af05  a1 b3         lda ($b3,x)
$11:af07  08            php
$11:af08  6c 9a 13      jmp ($139a)
$11:af0b  70 c5         bvs $aed2
$11:af0d  5b            tcd
$11:af0e  20 96 ac      jsr $ac96
$11:af11  84 92         sty $92
$11:af13  95 f4         sta $f4,x
$11:af15  86 57         stx $57
$11:af17  b2 1c         lda ($1c)
$11:af19  68            pla
$11:af1a  c5 fb         cmp $fb
$11:af1c  91 8a         sta ($8a),y
$11:af1e  92 41         sta ($41)
$11:af20  3a            dec a
$11:af21  59 09 35      eor $3509,y
$11:af24  2b            pld
$11:af25  21 0c         and ($0c,x)
$11:af27  b1 64         lda ($64),y
$11:af29  2c 11 8b      bit $8b11
$11:af2c  07 22         ora [$22]
$11:af2e  41 f5         eor ($f5,x)
$11:af30  89 51 b6      bit #$b651
$11:af33  1d 9d a7      ora $a79d,x
$11:af36  33 45         and ($45,s),y
$11:af38  7f c4 67 e0   adc $e067c4,x
$11:af3c  1e f8 24      asl $24f8,x
$11:af3f  f2 e0         sbc ($e0)
$11:af41  09 0d 84      ora #$840d
$11:af44  37 69         and [$69],y
$11:af46  0a            asl a
$11:af47  d1 46         cmp ($46),y
$11:af49  71 15         adc ($15),y
$11:af4b  08            php
$11:af4c  05 82         ora $82
$11:af4e  09 30 b8      ora #$b830
$11:af51  40            rti
$11:af52  c3 21         cmp $21,s
$11:af54  c4 8d         cpy $8d
$11:af56  4d ab 56      eor $56ab
$11:af59  7c 5f f2      jmp ($f25f,x)
$11:af5c  45 f3         eor $f3
$11:af5e  80 7b         bra $afdb
$11:af60  a8            tay
$11:af61  17 88         ora [$88],y
$11:af63  e0 a4 23      cpx #$23a4
$11:af66  56 0a         lsr $0a,x
$11:af68  d6 83         dec $83,x
$11:af6a  17 30         ora [$30],y
$11:af6c  91 45         sta ($45),y
$11:af6e  60            rts
$11:af6f  10 ca         bpl $af3b
$11:af71  04 62         tsb $62
$11:af73  39 80 b0      and $b080,y
$11:af76  40            rti
$11:af77  1d 00 d3      ora $d300,x
$11:af7a  28            plp
$11:af7b  01 dc         ora ($dc,x)
$11:af7d  da            phx
$11:af7e  e1 71         sbc ($71,x)
$11:af80  b8            clv
$11:af81  d8            cld
$11:af82  7c 3c 0e      jmp ($0e3c,x)
$11:af85  05 03         ora $03
$11:af87  80 77         bra $b000
$11:af89  43 e0         eor $e0,s
$11:af8b  7c 20 1f      jmp ($1f20,x)
$11:af8e  a8            tay
$11:af8f  15 fe         ora $fe,x
$11:af91  07 19         ora [$19]
$11:af93  80 c7         bra $af5c
$11:af95  e0 70 d8      cpx #$d870
$11:af98  0d 6e 07      ora $076e
$11:af9b  3a            dec a
$11:af9c  81 7e         sta ($7e,x)
$11:af9e  3f 1f cf f3   and $f3cf1f,x
$11:afa2  0c 2f d7      tsb $d72f
$11:afa5  f9 e4 fe      sbc $fee4,y
$11:afa8  7d 3f 61      adc $613f,x
$11:afab  85 f2         sta $f2
$11:afad  fd 0f 85      sbc $850f,x
$11:afb0  c7 62         cmp [$62]
$11:afb2  93 b9         sta ($b9,s),y
$11:afb4  44 74 30      mvp $30,$74
$11:afb7  14 a9         trb $a9
$11:afb9  bc a6 b5      ldy $b5a6,x
$11:afbc  0d 99 42      ora $4299
$11:afbf  8e e1 03      stx $03e1
$11:afc2  80 41         bra $b005
$11:afc4  e0 12 38      cpx #$3812
$11:afc7  04 96         tsb $96
$11:afc9  01 46         ora ($46,x)
$11:afcb  80 58         bra $b025
$11:afcd  60            rts
$11:afce  36 53         rol $53,x
$11:afd0  b8            clv
$11:afd1  e0 1a 03      cpx #$031a
$11:afd4  40            rti
$11:afd5  80 48         bra $b01f
$11:afd7  20 11 06      jsr $0611
$11:afda  c0 c2 1a      cpy #$1ac2
$11:afdd  03 c0         ora $c0,s
$11:afdf  80 78         bra $b059
$11:afe1  20 08 f0      jsr $f008
$11:afe4  b8            clv
$11:afe5  40            rti
$11:afe6  27 10         and [$10]
$11:afe8  08            php
$11:afe9  c4 02         cpy $02
$11:afeb  39 00 b8      and $b800,y
$11:afee  dc 2a 97      jml [$972a]
$11:aff1  09 44 a2      ora #$a244
$11:aff4  21 10         and ($10,x)
$11:aff6  86 c3         stx $c3
$11:aff8  60            rts
$11:aff9  50 23         bvc $b01e
$11:affb  98            tya
$11:affc  1c c2 1f      trb $1fc2
$11:afff  7f 7f 84 5e   adc $5e847f,x
$11:b003  7f 0f 8f c0   adc $c08f0f,x
$11:b007  a1 f0         lda ($f0,x)
$11:b009  16 08         asl $08,x
$11:b00b  3e c6 11      rol $11c6,x
$11:b00e  08            php
$11:b00f  92 41         sta ($41)
$11:b011  31 10         and ($10),y
$11:b013  89 04 82      bit #$8204
$11:b016  c1 60         cmp ($60,x)
$11:b018  3a            dec a
$11:b019  a7 d3         lda [$d3]
$11:b01b  f8            sed
$11:b01c  a0 0f 87      ldy #$870f
$11:b01f  e3 a1         sbc $a1,s
$11:b021  f0 c0         beq $afe3
$11:b023  38            sec
$11:b024  c0 34 70      cpy #$7034
$11:b027  78            sei
$11:b028  3c 2a 1d      bit $1d2a,x
$11:b02b  0d 86 46      ora $4686
$11:b02e  23 10         and $10,s
$11:b030  e8            inx
$11:b031  64 66         stz $66
$11:b033  31 0c         and ($0c),y
$11:b035  86 40         stx $40
$11:b037  d8            cld
$11:b038  23 01         and $01,s
$11:b03a  87 c0         sta [$c0]
$11:b03c  e1 f0         sbc ($f0,x)
$11:b03e  78            sei
$11:b03f  fc 4e 3e      jsr ($3e4e,x)
$11:b042  45 02         eor $02
$11:b044  18            clc
$11:b045  30 01         bmi $b048
$11:b047  06 01         asl $01
$11:b049  50 68         bvc $b0b3
$11:b04b  87 41         sta [$41]
$11:b04d  b2 10         lda ($10)
$11:b04f  0a            asl a
$11:b050  84 40         sty $40
$11:b052  a2 2d f1      ldx #$f12d
$11:b055  e0 78 0c      cpx #$0c78
$11:b058  43 f0         eor $f0,s
$11:b05a  33 01         and ($01,s),y
$11:b05c  94 0c         sty $0c,x
$11:b05e  20 d0 08      jsr $08d0
$11:b061  ec e2 21      cpx $21e2
$11:b064  30 99         bmi $afff
$11:b066  dc 27 77      jml [$7727]
$11:b069  19 1d 8a      ora $8a1d,y
$11:b06c  af d1 b1 f8   lda $f8b1d1
$11:b070  2f 7f 88 38   and $38887f
$11:b074  10 00         bpl $b076
$11:b076  80 00         bra $b078
$11:b078  18            clc
$11:b079  fd fe 5f      sbc $5ffe,x
$11:b07c  ff 8f ff e0   sbc $e0ff8f,x
$11:b080  ff fb fc df   sbc $dffcfb,x
$11:b084  ff 3f ff ef   sbc $efff3f,x
$11:b088  d1 c1         cmp ($c1),y
$11:b08a  ff f6 ff ff   sbc $fffff6,x
$11:b08e  bf fb cf fe   lda $fecffb,x
$11:b092  67 ff         adc [$ff]
$11:b094  4f f7 ed 3e   eor $3eedf7
$11:b098  e9 a0 d6      sbc #$d6a0
$11:b09b  ff f2 e9 fe   sbc $fee9f2,x
$11:b09f  fa            plx
$11:b0a0  69 3e 9c      adc #$9c3e
$11:b0a3  4f d7 0b f5   eor $f50bd7
$11:b0a7  d2 ff         cmp ($ff)
$11:b0a9  78            sei
$11:b0aa  bf 3e 1f 8d   lda $8d1f3e,x
$11:b0ae  07 53         ora [$53]
$11:b0b0  01 10         ora ($10,x)
$11:b0b2  80 84         bra $b038
$11:b0b4  3f 9f e7 19   and $19e79f,x
$11:b0b8  7f bf ee 92   adc $92eebf,x
$11:b0bc  e2 c8         sep #$c8
$11:b0be  3b            tsc
$11:b0bf  92 af         sta ($af)
$11:b0c1  fc 83 3f      jsr ($3f83,x)
$11:b0c4  00 f7         brk #$f7
$11:b0c6  d1 37         cmp ($37),y
$11:b0c8  9f 0b b5 33   sta $33b50b,x
$11:b0cc  77 c7         adc [$c7],y
$11:b0ce  90 46         bcc $b116
$11:b0d0  a5 51         lda $51
$11:b0d2  19 05 42      ora $4205,y
$11:b0d5  01 60         ora ($60,x)
$11:b0d7  a2 4c 3e      ldx #$3e4c
$11:b0da  10 3a         bpl $b116
$11:b0dc  66 07         ror $07
$11:b0de  8f 00 a3 42   sta $42a300
$11:b0e2  2c fa 8f      bit $8ffa
$11:b0e5  fc 23 e6      jsr ($e623,x)
$11:b0e8  f6 1b         inc $1b,x
$11:b0ea  dc 7b bb      jml [$bb7b]
$11:b0ed  64 df         stz $df
$11:b0ef  f0 a1         beq $b092
$11:b0f1  1b            tcs
$11:b0f2  0d 44 42      ora $4244
$11:b0f5  11 14         ora ($14),y
$11:b0f7  80 43         bra $b13c
$11:b0f9  28            plp
$11:b0fa  91 88         sta ($88),y
$11:b0fc  f6 02         inc $02,x
$11:b0fe  c9 02 e1      cmp #$e102
$11:b101  40            rti
$11:b102  3c 95 ed      bit $ed95,x
$11:b105  94 3b         sty $3b,x
$11:b107  b1 67         lda ($67),y
$11:b109  cf e8 23 f2   cmp $f223e8
$11:b10d  0b            phd
$11:b10e  fe 03 7f      inc $7f03,x
$11:b111  00 ff         brk #$ff
$11:b113  f0 2b         beq $b140
$11:b115  d0 18         bne $b12f
$11:b117  75 06         adc $06,x
$11:b119  cf 00 d0 50   cmp $50d000
$11:b11d  24 1c         bit $1c
$11:b11f  02 f0         cop #$f0
$11:b121  40            rti
$11:b122  38            sec
$11:b123  1c 08 07      trb $0708
$11:b126  3a            dec a
$11:b127  e9 9a f0      sbc #$f09a
$11:b12a  4d b9 9f      eor $9fb9
$11:b12d  38            sec
$11:b12e  57 c6         eor [$c6],y
$11:b130  11 fd         ora ($fd),y
$11:b132  81 7e         sta ($7e,x)
$11:b134  e0 1f b8      cpx #$b81f
$11:b137  35 d2         and $d2,x
$11:b139  01 e0         ora ($e0,x)
$11:b13b  82 73 20      brl $d1b1
$11:b13e  10 a8         bpl $b0e8
$11:b140  24 22         bit $22
$11:b142  0d 02 80      ora $8002
$11:b145  40            rti
$11:b146  20 d0 63      jsr $63d0
$11:b149  50 50         bvc $b19b
$11:b14b  0d 41 1c      ora $1c41
$11:b14e  35 84         and $84,x
$11:b150  02 07         cop #$07
$11:b152  00 c7         brk #$c7
$11:b154  40            rti
$11:b155  22 d0 69 04   jsl $0469d0
$11:b159  83 01         sta $01,s
$11:b15b  c0 bc 5e      cpy #$5ebc
$11:b15e  27 d3         and [$d3]
$11:b160  e8            inx
$11:b161  7c 3e 0f      jmp ($0f3e,x)
$11:b164  07 8f         ora [$8f]
$11:b166  c7 e7         cmp [$e7]
$11:b168  13 e8         ora ($e8,s),y
$11:b16a  04 82         tsb $82
$11:b16c  3b            tsc
$11:b16d  01 82         ora ($82,x)
$11:b16f  c0 52 45      cpy #$4552
$11:b172  02 83         cop #$83
$11:b174  e0 20 47      cpx #$4720
$11:b177  00 98         brk #$98
$11:b179  40            rti
$11:b17a  27 d3         and [$d3]
$11:b17c  f8            sed
$11:b17d  f4 7e 0d      pea $0d7e
$11:b180  07 51         ora [$51]
$11:b182  84 01         sty $01
$11:b184  30 18         bmi $b19e
$11:b186  22 60 4c 26   jsl $264c60
$11:b18a  13 88         ora ($88,s),y
$11:b18c  24 7a         bit $7a
$11:b18e  05 0c         ora $0c
$11:b190  86 41         stx $41
$11:b192  20 86 a0      jsr $a086
$11:b195  5b            tcd
$11:b196  a5 ce         lda $ce
$11:b198  01 31         ora ($31,x)
$11:b19a  5b            tcd
$11:b19b  8c 22 00      sty $0022
$11:b19e  b6 63         ldx $63,y
$11:b1a0  48            pha
$11:b1a1  2d 81 68      and $6881
$11:b1a4  07 30         ora [$30]
$11:b1a6  9e 41 27      stz $2741,x
$11:b1a9  90 ca         bcc $b175
$11:b1ab  44 20 e0      mvp $e0,$20
$11:b1ae  0c f2 62      tsb $62f2
$11:b1b1  84 61         sty $61
$11:b1b3  38            sec
$11:b1b4  32 00         and ($00)
$11:b1b6  28            plp
$11:b1b7  1b            tcs
$11:b1b8  c9 4e 10      cmp #$104e
$11:b1bb  78            sei
$11:b1bc  d4 7a         pei ($7a)
$11:b1be  4b            phk
$11:b1bf  3c 94 ce      bit $ce94,x
$11:b1c2  2e 77 0a      rol $0a77
$11:b1c5  c5 e3         cmp $e3
$11:b1c7  fb            xce
$11:b1c8  f8            sed
$11:b1c9  77 14         adc [$14],y
$11:b1cb  06 3f         asl $3f
$11:b1cd  03 9f         ora $9f,s
$11:b1cf  c1 e7         cmp ($e7,x)
$11:b1d1  f0 fb         beq $b1ce
$11:b1d3  fc 1c 14      jsr ($141c,x)
$11:b1d6  1f f3 50 2a   ora $2a50f3,x
$11:b1da  cb            wai
$11:b1db  51 08         eor ($08),y
$11:b1dd  e0 40 2d      cpx #$2d40
$11:b1e0  06 00         asl $00
$11:b1e2  80 55         bra $b239
$11:b1e4  16 c4         asl $c4,x
$11:b1e6  4c 0f 87      jmp $870f
$11:b1e9  c3 f0         cmp $f0,s
$11:b1eb  26 0f         rol $0f
$11:b1ed  e0 a4 7f      cpx #$7fa4
$11:b1f0  5f e5 ba 21   eor $21bae5,x
$11:b1f4  c2 13         rep #$13
$11:b1f6  0d 8a c7      ora $c78a
$11:b1f9  21 71         and ($71,x)
$11:b1fb  89 02 74      bit #$7402
$11:b1fe  05 eb         ora $eb
$11:b200  02 87         cop #$87
$11:b202  c0 e3 e8      cpy #$e8e3
$11:b205  80 87         bra $b18e
$11:b207  cf d6 e9 40   cmp $40e9d6
$11:b20b  a0 48 0f      ldy #$0f48
$11:b20e  c1 00         cmp ($00,x)
$11:b210  d0 40         bne $b252
$11:b212  39 0e 30      and $300e,y
$11:b215  5b            tcd
$11:b216  9e 00 44      stz $4400,x
$11:b219  1e 01 20      asl $2001,x
$11:b21c  1a            inc a
$11:b21d  47 f1         eor [$f1]
$11:b21f  79 fc 57      adc $57fc,y
$11:b222  3f 90 ef f4   and $f4ef90,x
$11:b226  36 f9         rol $f9,x
$11:b228  08            php
$11:b229  bc 49 af      ldy $af49,x
$11:b22c  d0 b9         bne $b1e7
$11:b22e  fc 5c 0c      jsr ($0c5c,x)
$11:b231  1f f8 1f fe   ora $fe1ff8,x
$11:b235  02 80         cop #$80
$11:b237  00 50         brk #$50
$11:b239  c0 6f f0      cpy #$f06f
$11:b23c  02 70         cop #$70
$11:b23e  4f d1 01 3b   eor $3b01d1
$11:b242  80 63         bra $b2a7
$11:b244  e0 15 f8      cpx #$f815
$11:b247  06 fe         asl $fe
$11:b249  1c 0a 09      trb $090a
$11:b24c  79 2c 20      adc $202c,y
$11:b24f  1f f4 ff 53   ora $53fff4,x
$11:b253  ff e0 b0 86   sbc $86b0e0,x
$11:b257  77 e0         adc [$e0],y
$11:b259  5a            phy
$11:b25a  f8            sed
$11:b25b  07 6a         ora [$6a]
$11:b25d  01 c4         ora ($c4,x)
$11:b25f  c0 06 c1      cpy #$c106
$11:b262  3f dc 28 1f   and $1f28dc,x
$11:b266  2b            pld
$11:b267  17 ee         ora [$ee],y
$11:b269  87 f5         sta [$f5]
$11:b26b  22 da c9 74   jsl $74c9da
$11:b26f  72 3d         adc ($3d)
$11:b271  28            plp
$11:b272  96 76         stx $76,y
$11:b274  3b            tsc
$11:b275  9f cf ff d3   sta $d3ffcf,x
$11:b279  ff f0 ff fa   sbc $fafff0,x
$11:b27d  3f dd 0f f7   and $f70fdd,x
$11:b281  81 cc         sta ($cc,x)
$11:b283  1f c9 07 f3   ora $f307c9,x
$11:b287  7e 8d 0a      ror $0a8d,x
$11:b28a  06 ff         asl $ff
$11:b28c  80 8a         bra $b218
$11:b28e  00 70         brk #$70
$11:b290  27 42         and [$42]
$11:b292  1f 00 81 83   ora $838100,x
$11:b296  c6 80         dec $80
$11:b298  65 03         adc $03
$11:b29a  18            clc
$11:b29b  98            tya
$11:b29c  84 0e         sty $0e
$11:b29e  7f b8 07 e2   adc $e207b8,x
$11:b2a2  0b            phd
$11:b2a3  fe 81 7f      inc $7f81,x
$11:b2a6  20 02 e0      jsr $e002
$11:b2a9  f8            sed
$11:b2aa  40            rti
$11:b2ab  17 a0         ora [$a0],y
$11:b2ad  06 18         asl $18
$11:b2af  34 16         bit $16,x
$11:b2b1  05 02         ora $02
$11:b2b3  80 bf         bra $b274
$11:b2b5  08            php
$11:b2b6  0e 8f 10      asl $108f
$11:b2b9  17 93         ora [$93],y
$11:b2bb  d6 00         dec $00,x
$11:b2bd  20 3f 20      jsr $203f
$11:b2c0  2c 7e 60      bit $607e
$11:b2c3  9f 98 2f e2   sta $e22f98,x
$11:b2c7  08            php
$11:b2c8  15 88         ora $88,x
$11:b2ca  24 08         bit $08
$11:b2cc  42 10         wdm #$10
$11:b2ce  47 e8         eor [$e8]
$11:b2d0  09 9e 08      ora #$089e
$11:b2d3  67 61         adc [$61]
$11:b2d5  60            rts
$11:b2d6  40            rti
$11:b2d7  4f 40 79 03   eor $037940
$11:b2db  84 1f         sty $1f
$11:b2dd  44 f8 23      mvp $23,$f8
$11:b2e0  90 83         bcc $b265
$11:b2e2  c0 20 b0      cpy #$b020
$11:b2e5  57 f0         eor [$f0],y
$11:b2e7  e0 2e 11      cpx #$112e
$11:b2ea  0e 84 43      asl $4384
$11:b2ed  41 a0         eor ($a0,x)
$11:b2ef  9f cf e1 f0   sta $f0e1cf,x
$11:b2f3  f8            sed
$11:b2f4  12 44         ora ($44)
$11:b2f6  20 16 0f      jsr $0f16
$11:b2f9  07 83         ora [$83]
$11:b2fb  e0 a9 0a      cpx #$0aa9
$11:b2fe  01 6c         ora ($6c,x)
$11:b300  27 13         and [$13]
$11:b302  8b            phb
$11:b303  e5 f3         sbc $f3
$11:b305  fc b3 25      jsr ($25b3,x)
$11:b308  88            dey
$11:b309  2b            pld
$11:b30a  c0 58 0b      cpy #$0b58
$11:b30d  03 61         ora $61,s
$11:b30f  9a            txs
$11:b310  c8            iny
$11:b311  16 00         asl $00,x
$11:b313  04 93         tsb $93
$11:b315  3a            dec a
$11:b316  f0 19         beq $b331
$11:b318  db            stp
$11:b319  90 f8         bcc $b313
$11:b31b  74 be         stz $be,x
$11:b31d  17 9b         ora [$9b],y
$11:b31f  cd d2 e9      cmp $e9d2
$11:b322  39 9c a8      and $a89c,y
$11:b325  42 06         wdm #$06
$11:b327  26 18         rol $18
$11:b329  7f fd fe 10   adc $10fefd,x
$11:b32d  6b            rtl
$11:b32e  fc 2e ff      jsr ($ff2e,x)
$11:b331  06 9f         asl $9f
$11:b333  8e 8d 4c      stx $4c8d
$11:b336  12 0c         ora ($0c)
$11:b338  54 2a 51      mvn $51,$2a
$11:b33b  00 c2         brk #$c2
$11:b33d  41 25         eor ($25,x)
$11:b33f  12 89         ora ($89)
$11:b341  04 83         tsb $83
$11:b343  00 46         brk #$46
$11:b345  1e f7 fb      asl $fbf7,x
$11:b348  e9 fe fe      sbc #$fefe
$11:b34b  7f 3f 1f ce   adc $ce1f3f,x
$11:b34f  87 e3         sta [$e3]
$11:b351  80 5b         bra $b3ae
$11:b353  28            plp
$11:b354  04 e6         tsb $e6
$11:b356  71 22         adc ($22),y
$11:b358  98            tya
$11:b359  46 23         lsr $23
$11:b35b  10 d8         bpl $b335
$11:b35d  6c 0a 04      jmp ($040a)
$11:b360  67 48         adc [$48]
$11:b362  3a            dec a
$11:b363  80 27         bra $b38c
$11:b365  f0 78         beq $b3df
$11:b367  fc 0a 1f      jsr ($1f0a,x)
$11:b36a  01 33         ora ($33,x)
$11:b36c  2c 82 00      bit $0082
$11:b36f  17 0c         ora [$0c],y
$11:b371  84 40         sty $40
$11:b373  32 87         and ($87)
$11:b375  22 fc 7e 04   jsl $047efc
$11:b379  e0 ab 01      cpx #$01ab
$11:b37c  4a            lsr a
$11:b37d  20 8a 17      jsr $178a
$11:b380  1f 80 a8 84   ora $84a880,x
$11:b384  8e 28 c0      stx $c028
$11:b387  68            pla
$11:b388  24 7c         bit $7c
$11:b38a  12 2a         ora ($2a)
$11:b38c  40            rti
$11:b38d  3b            tsc
$11:b38e  3f 08 52 1e   and $1e5208,x
$11:b392  02 f8         cop #$f8
$11:b394  7d fe ff      adc $fffe,x
$11:b397  ff fc bb ff   sbc $ffbbfc,x
$11:b39b  05 04         ora $04
$11:b39d  00 fc         brk #$fc
$11:b39f  3f f1 ff fc   and $fcfff1,x
$11:b3a3  1f ff 08 ff   ora $ff08ff,x
$11:b3a7  c0 14 c4      cpy #$c414
$11:b3aa  9c 1e 2c      stz $2c1e
$11:b3ad  16 15         asl $15,x
$11:b3af  0a            asl a
$11:b3b0  1a            inc a
$11:b3b1  84 1e         sty $1e
$11:b3b3  0e 95 0f      asl $0f95
$11:b3b6  67 fe         adc [$fe]
$11:b3b8  c1 fc         cmp ($fc,x)
$11:b3ba  80 78         bra $b434
$11:b3bc  3f 5f ff af   and $afff5f,x
$11:b3c0  ff e5 ff fc   sbc $fcffe5,x
$11:b3c4  29 11 78      and #$7811
$11:b3c7  3f 0f c6 83   and $83c60f,x
$11:b3cb  60            rts
$11:b3cc  29 0c 07      and #$070c
$11:b3cf  00 ce         brk #$ce
$11:b3d1  c5 e0         cmp $e0
$11:b3d3  a0 7c 17      ldy #$177c
$11:b3d6  a1 00         lda ($00,x)
$11:b3d8  6b            rtl
$11:b3d9  38            sec
$11:b3da  00 20         brk #$20
$11:b3dc  80 3b         bra $b419
$11:b3de  fd fd 91      sbc $91fd,x
$11:b3e1  ff 04 cf 99   sbc $99cf04,x
$11:b3e5  4f d8 6c a9   eor $a96cd8
$11:b3e9  bc b9 bc      ldy $bcb9,x
$11:b3ec  bf bf b7 bf   lda $bfb7bf,x
$11:b3f0  f3 ff         sbc ($ff,s),y
$11:b3f2  f0 08         beq $b3fc
$11:b3f4  7c 02 7f      jmp ($7f02,x)
$11:b3f7  00 bf         brk #$bf
$11:b3f9  c0 03 c1      cpy #$c103
$11:b3fc  ff 80 ff a0   sbc $a0ff80,x
$11:b400  5f d1 58 61   eor $6158d1,x
$11:b404  21 5a         and ($5a,x)
$11:b406  18            clc
$11:b407  06 7a         asl $7a
$11:b409  03 b4         ora $b4,s
$11:b40b  85 e6         sta $e6
$11:b40d  20 e3 54      jsr $54e3
$11:b410  b8            clv
$11:b411  db            stp
$11:b412  ef f7 3b f9   sbc $f93bf7
$11:b416  0e 67 fc      asl $fc67
$11:b419  ff c4 5f d1   sbc $d15fc4,x
$11:b41d  27 e4         and [$e4]
$11:b41f  45 f8         eor $f8
$11:b421  55 1f         eor $1f,x
$11:b423  15 46         ora $46,x
$11:b425  c1 5f         cmp ($5f,x)
$11:b427  c8            iny
$11:b428  71 ff         adc ($ff),y
$11:b42a  e5 f0         sbc $f0
$11:b42c  fc 18 47      jsr ($4718,x)
$11:b42f  d1 ff         cmp ($ff),y
$11:b431  f7 97         sbc [$97],y
$11:b433  c7 c3         cmp [$c3]
$11:b435  ff dc ff b8   sbc $b8ffdc,x
$11:b439  33 af         and ($af,s),y
$11:b43b  0c 7f b1      tsb $b17f
$11:b43e  06 fe         asl $fe
$11:b440  51 f7         eor ($f7),y
$11:b442  87 70         sta [$70]
$11:b444  c7 dd         cmp [$dd]
$11:b446  a0 31 72      ldy #$7231
$11:b449  f8            sed
$11:b44a  df ff f3 ff   cmp $fff3ff,x
$11:b44e  fc 3f fe      jsr ($fe3f,x)
$11:b451  5e 02 f0      lsr $f002,x
$11:b454  63 ff         adc $ff,s
$11:b456  ff 99 ff 33   sbc $33ff99,x
$11:b45a  ef 1a f7 c8   sbc $c8f71a
$11:b45e  7a            ply
$11:b45f  75 cd         adc $cd,x
$11:b461  ae ab cb      ldx $cbab
$11:b464  ea            nop
$11:b465  e5 f1         sbc $f1
$11:b467  78            sei
$11:b468  d4 22         pei ($22)
$11:b46a  f8            sed
$11:b46b  fd ff ff      sbc $ffff,x
$11:b46e  34 68         bit $68,x
$11:b470  18            clc
$11:b471  4c be 3f      jmp $3fbe
$11:b474  e9 cf 3e      sbc #$3ecf
$11:b477  a9 a7 cd      lda #$cda7
$11:b47a  6d f1 5d      adc $5df1
$11:b47d  fa            plx
$11:b47e  26 ef         rol $ef
$11:b480  f1 d7         sbc ($d7),y
$11:b482  92 62         sta ($62)
$11:b484  ee 05 f1      inc $f105
$11:b487  34 02         bit $02,x
$11:b489  88            dey
$11:b48a  3f 65 f1 df   and $dff165,x
$11:b48e  b2 47         lda ($47)
$11:b490  be 25 21      ldx $2125,y
$11:b493  28            plp
$11:b494  51 31         eor ($31),y
$11:b496  11 1e         ora ($1e),y
$11:b498  64 03         stz $03
$11:b49a  99 80 8f      sta $8f80,y
$11:b49d  d0 2b         bne $b4ca
$11:b49f  ea            nop
$11:b4a0  b2 ff         lda ($ff)
$11:b4a2  e6 5c         inc $5c
$11:b4a4  62 25 08      per $bccc
$11:b4a7  ca            dex
$11:b4a8  0c 37 e2      tsb $e237
$11:b4ab  20 e7 bb      jsr $bbe7
$11:b4ae  c1 b6         cmp ($b6,x)
$11:b4b0  4e f6 41      lsr $41f6
$11:b4b3  88            dey
$11:b4b4  00 5d         brk #$5d
$11:b4b6  a0 ff 66      ldy #$66ff
$11:b4b9  7a            ply
$11:b4ba  48            pha
$11:b4bb  a2 38 89      ldx #$8938
$11:b4be  9c 02 67      stz $6702
$11:b4c1  01 fc         ora ($fc,x)
$11:b4c3  40            rti
$11:b4c4  bf 4d f9 cc   lda $ccf94d,x
$11:b4c8  7f ff 9f df   adc $df9fff,x
$11:b4cc  e3 48         sbc $48,s
$11:b4ce  3e ec f3      rol $f3ec,x
$11:b4d1  df c0 3f 6c   cmp $6c3fc0,x
$11:b4d5  f4 1f ed      pea $ed1f
$11:b4d8  ff 01 e4 80   sbc $80e401,x
$11:b4dc  74 60         stz $60,x
$11:b4de  39 2b 6b      and $6b2b,y
$11:b4e1  48            pha
$11:b4e2  2d b9 2a      and $2ab9
$11:b4e5  4e 4b 6d      lsr $6d4b
$11:b4e8  92 80         sta ($80)
$11:b4ea  33 c7         and ($c7,s),y
$11:b4ec  fc 5f 02      jsr ($025f,x)
$11:b4ef  c0 19 97      cpy #$9719
$11:b4f2  fb            xce
$11:b4f3  03 a7         ora $a7,s
$11:b4f5  d3 23         cmp ($23,s),y
$11:b4f7  f1 ca         sbc ($ca),y
$11:b4f9  4e d9 a4      lsr $a4d9
$11:b4fc  1b            tcs
$11:b4fd  6a            ror a
$11:b4fe  4c 92 93      jmp $9392
$11:b501  db            stp
$11:b502  a4 97         ldy $97
$11:b504  c3 67         cmp $67,s
$11:b506  00 f1         brk #$f1
$11:b508  99 07 6c      sta $6c07,y
$11:b50b  86 5c         stx $5c
$11:b50d  84 3f         sty $3f
$11:b50f  3f 00 48 8a   and $8a4800,x
$11:b513  41 7b         eor ($7b,x)
$11:b515  f4 0b 04      pea $040b
$11:b518  01 3e         ora ($3e,x)
$11:b51a  16 f5         asl $f5,x
$11:b51c  00 a8         brk #$a8
$11:b51e  52 41         eor ($41)
$11:b520  00 84         brk #$84
$11:b522  fc 3f 30      jsr ($303f,x)
$11:b525  0e cc 43      asl $43cc
$11:b528  92 b0         sta ($b0)
$11:b52a  5f dc 0a 0d   eor $0d0adc,x
$11:b52e  00 5f         brk #$5f
$11:b530  87 99         sta [$99]
$11:b532  80 2c         bra $b560
$11:b534  14 82         trb $82
$11:b536  40            rti
$11:b537  20 bf 88      jsr $88bf
$11:b53a  8d 8a 87      sta $878a
$11:b53d  44 b3 5a      mvp $5a,$b3
$11:b540  64 9b         stz $9b
$11:b542  b8            clv
$11:b543  47 5c         eor [$5c]
$11:b545  78            sei
$11:b546  66 e0         ror $e0
$11:b548  80 6e         bra $b5b8
$11:b54a  60            rts
$11:b54b  19 18 07      ora $0718,y
$11:b54e  0e 01 e7      asl $e701
$11:b551  80 7b         bra $b5ce
$11:b553  c1 e2         cmp ($e2,x)
$11:b555  13 08         ora ($08,s),y
$11:b557  40            rti
$11:b558  c4 e8         cpy $e8
$11:b55a  1b            tcs
$11:b55b  f8            sed
$11:b55c  13 84         ora ($84,s),y
$11:b55e  07 be         ora [$be]
$11:b560  21 08         and ($08,x)
$11:b562  ff ff 7f 7f   sbc $7f7fff,x
$11:b566  bf 92 cc 26   lda $26cc92,x
$11:b56a  33 fc         and ($fc,s),y
$11:b56c  fc ba 0b      jsr ($0bba,x)
$11:b56f  fa            plx
$11:b570  0f 84 af a9   ora $a9af84
$11:b574  0b            phd
$11:b575  fa            plx
$11:b576  55 b5         eor $b5,x
$11:b578  31 6f         and ($6f),y
$11:b57a  4c b2 a7      jmp $a7b2
$11:b57d  4c 99 e6      jmp $e699
$11:b580  20 fb 48      jsr $48fb
$11:b583  58            cli
$11:b584  bd 26 90      lda $9026,x
$11:b587  ba            tsx
$11:b588  c6 1e         dec $1e
$11:b58a  5b            tcd
$11:b58b  c2 0c         rep #$0c
$11:b58d  00 fd         brk #$fd
$11:b58f  83 60         sta $60,s
$11:b591  4a            lsr a
$11:b592  08            php
$11:b593  fc 7f 2b      jsr ($2b7f,x)
$11:b596  c2 e0         rep #$e0
$11:b598  6f f0 1b fe   adc $fe1bf0
$11:b59c  4e 0b 8b      lsr $8b0b
$11:b59f  42 fe         wdm #$fe
$11:b5a1  4e ef b0      lsr $b0ef
$11:b5a4  b9 ff 1c      lda $1cff,y
$11:b5a7  20 1f fe      jsr $fe1f
$11:b5aa  0f ff 80 14   ora $1480ff
$11:b5ae  2f c1 a4 42   and $42a4c1
$11:b5b2  a1 21         lda ($21,x)
$11:b5b4  8b            phb
$11:b5b5  c4 60         cpy $60
$11:b5b7  30 1f         bmi $b5d8
$11:b5b9  cc ce 05      cpy $05ce
$11:b5bc  37 82         and [$82],y
$11:b5be  5f 6f 17 fb   eor $fb176f,x
$11:b5c2  07 d8         ora [$d8]
$11:b5c4  c4 1f         cpy $1f
$11:b5c6  90 a8         bcc $b570
$11:b5c8  c3 c2         cmp $c2,s
$11:b5ca  85 bf         sta $bf
$11:b5cc  9f a2 40 2a   sta $2a40a2,x
$11:b5d0  1f 59 a7 e6   ora $e6a759,x
$11:b5d4  11 b9         ora ($b9),y
$11:b5d6  84 7f         sty $7f
$11:b5d8  20 9f f8      jsr $f89f
$11:b5db  1f 7e 05 76   ora $76057e,x
$11:b5df  81 c7         sta ($c7,x)
$11:b5e1  cc 86 9f      cpy $9f86
$11:b5e4  4f f2 a4 f1   eor $f1a4f2
$11:b5e8  f7 2d         sbc [$2d],y
$11:b5ea  3d 6b 47      and $476b,x
$11:b5ed  5e eb cb      lsr $cbeb,x
$11:b5f0  3e ff 0b      rol $0bff,x
$11:b5f3  e9 90 38      sbc #$3890
$11:b5f6  1e e8 0f      asl $0fe8,x
$11:b5f9  fc bc 1c      jsr ($1cbc,x)
$11:b5fc  36 08         rol $08,x
$11:b5fe  f9 c2 c4      sbc $c4c2,y
$11:b601  3f 28 07 7e   and $7e0728,x
$11:b605  01 cf         ora ($cf,x)
$11:b607  c0 5b e8      cpy #$e85b
$11:b60a  90 88         bcc $b594
$11:b60c  8f 33 01 cc   sta $cc0133
$11:b610  7d 9a 30      adc $309a,x
$11:b613  11 81         ora ($81),y
$11:b615  19 71 8c      ora $8c71,y
$11:b618  02 fe         cop #$fe
$11:b61a  e4 06         cpx $06
$11:b61c  38            sec
$11:b61d  37 05         and [$05],y
$11:b61f  b6 52         ldx $52,y
$11:b621  28            plp
$11:b622  8e 22 67      stx $6722
$11:b625  00 7c         brk #$7c
$11:b627  03 70         ora $70,s
$11:b629  9f c5 99 01   sta $0199c5,x
$11:b62d  8b            phb
$11:b62e  6c 00 80      jmp ($8000)
$11:b631  0b            phd
$11:b632  18            clc
$11:b633  07 ee         ora [$ee]
$11:b635  01 f3         ora ($f3,x)
$11:b637  80 fd         bra $b636
$11:b639  a4 51         ldy $51
$11:b63b  07 b8         ora [$b8]
$11:b63d  40            rti
$11:b63e  5f 49 fc 0f   eor $0ffc49,x
$11:b642  8e 60 46      stx $4660
$11:b645  30 0f         bmi $b656
$11:b647  f0 98         beq $b5e1
$11:b649  01 67         ora ($67,x)
$11:b64b  f7 6d         sbc [$6d],y
$11:b64d  8c ff 01      sty $01ff
$11:b650  7f c0 4e f8   adc $f84ec0,x
$11:b654  10 ff         bpl $b655
$11:b656  84 0c         sty $0c
$11:b658  40            rti
$11:b659  03 fd         ora $fd,s
$11:b65b  a4 e4         ldy $e4
$11:b65d  8a            txa
$11:b65e  01 6d         ora ($6d,x)
$11:b660  63 85         adc $85,s
$11:b662  b4 a4         ldy $a4,x
$11:b664  1e 58 0f      asl $0f58,x
$11:b667  41 d0         eor ($d0,x)
$11:b669  18            clc
$11:b66a  0b            phd
$11:b66b  6c 00 be      jmp ($be00)
$11:b66e  06 24         asl $24
$11:b670  ff 36 c4 c4   sbc $c4c436,x
$11:b674  12 4a         ora ($4a)
$11:b676  49 c0 36      eor #$36c0
$11:b679  cc 70 db      cpy $db70
$11:b67c  1c 82 3f      trb $3f82
$11:b67f  1c a7 d3      trb $d3a7
$11:b682  3f b0 3d b4   and $b43db0,x
$11:b686  00 fe         brk #$fe
$11:b688  06 24         asl $24
$11:b68a  f1 c0         sbc ($c0),y
$11:b68c  36 66         rol $66,x
$11:b68e  21 cf         and ($cf,x)
$11:b690  c0 37 f2      cpy #$f237
$11:b693  fe fd 03      inc $03fd,x
$11:b696  7f 20 ff db   adc $dbff20,x
$11:b69a  f7 f6         sbc [$f6],y
$11:b69c  07 90         ora [$90]
$11:b69e  c3 ed         cmp $ed,s
$11:b6a0  f0 0a         beq $b6ac
$11:b6a2  04 02         tsb $02
$11:b6a4  41 00         eor ($00,x)
$11:b6a6  a7 98         lda [$98]
$11:b6a8  8e df 00      stx $00df
$11:b6ab  b0 40         bcs $b6ed
$11:b6ad  3b            tsc
$11:b6ae  31 0e         and ($0e),y
$11:b6b0  6f d3 f7 02   adc $02f7d3
$11:b6b4  ee c5 39      inc $39c5
$11:b6b7  ff 6f ec 1b   sbc $1bec6f,x
$11:b6bb  bf 10 e7 fc   lda $fce710,x
$11:b6bf  3c d0 08      bit $08d0,x
$11:b6c2  14 02         trb $02
$11:b6c4  09 00 f1      ora #$f100
$11:b6c7  18            clc
$11:b6c8  8d 7e 10      sta $107e
$11:b6cb  68            pla
$11:b6cc  05 43         ora $43
$11:b6ce  1f 11 93 4d   ora $4d9311,x
$11:b6d2  28            plp
$11:b6d3  96 6c         stx $6c,y
$11:b6d5  b5 0b         lda $0b,x
$11:b6d7  77 80         adc [$80],y
$11:b6d9  be be ce      ldx $cebe,y
$11:b6dc  01 df         ora ($df,x)
$11:b6de  80 66         bra $b746
$11:b6e0  e0 11 98      cpx #$9811
$11:b6e3  04 f2         tsb $f2
$11:b6e5  01 7e         ora ($7e,x)
$11:b6e7  34 1c         bit $1c,x
$11:b6e9  13 05         ora ($05,s),y
$11:b6eb  a6 ac         ldx $ac
$11:b6ed  ca            dex
$11:b6ee  e2 f1         sep #$f1
$11:b6f0  f9 dd ef      sbc $efdd,y
$11:b6f3  7b            tdc
$11:b6f4  37 bc         and [$bc],y
$11:b6f6  db            stp
$11:b6f7  eb            xba
$11:b6f8  d5 eb         cmp $eb,x
$11:b6fa  fd e4 c4      sbc $c4e4,x
$11:b6fd  3c 00 10      bit $1000,x
$11:b700  98            tya
$11:b701  83 00         sta $00,s
$11:b703  08            php
$11:b704  36 e8         rol $e8,x
$11:b706  42 06         wdm #$06
$11:b708  25 ff         and $ff
$11:b70a  4a            lsr a
$11:b70b  04 0b         tsb $0b
$11:b70d  fa            plx
$11:b70e  54 00 e7      mvn $e7,$00
$11:b711  a6 c4         ldx $c4
$11:b713  22 cd d0 f1   jsl $f1d0cd
$11:b717  7f 7f 81 ef   adc $ef817f,x
$11:b71b  fc fd ff      jsr ($fffd,x)
$11:b71e  d8            cld
$11:b71f  1d 5d ff      ora $ff5d,x
$11:b722  ff 7f fe 5f   sbc $5ffe7f,x
$11:b726  ff 57 d2 c8   sbc $c8d257,x
$11:b72a  7d 6f 70      adc $706f,x
$11:b72d  08            php
$11:b72e  3c 02 7f      bit $7f02,x
$11:b731  00 bf         brk #$bf
$11:b733  cb            wai
$11:b734  aa            tax
$11:b735  37 88         and [$88],y
$11:b737  3d c2 1f      and $1fc2,x
$11:b73a  71 87         adc ($87),y
$11:b73c  d8            cld
$11:b73d  e3 f9         sbc $f9,s
$11:b73f  ff 7d ff 03   sbc $03ff7d,x
$11:b743  d5 ff         cmp $ff,x
$11:b745  7f ce 87 3f   adc $3f87ce,x
$11:b749  ff 67 dd 61   sbc $61dd67,x
$11:b74d  e0 80         cpx #$80
$11:b74f  7f 1d 41 54   adc $54411d,x
$11:b753  d5 4f         cmp $4f,x
$11:b755  b8            clv
$11:b756  11 ef         ora ($ef),y
$11:b758  06 7b         asl $7b
$11:b75a  c1 ce         cmp ($ce,x)
$11:b75c  f8            sed
$11:b75d  65 61         adc $61
$11:b75f  58            cli
$11:b760  49 dc         eor #$dc
$11:b762  d3 97         cmp ($97,s),y
$11:b764  74 c5         stz $c5,x
$11:b766  a4 c2         ldy $c2
$11:b768  c9 9b         cmp #$9b
$11:b76a  89 f8         bit #$f8
$11:b76c  b0 d0         bcs $b73e
$11:b76e  22 70 27 e4   jsl $e42770
$11:b772  7c 3e 4c      jmp ($4c3e,x)
$11:b775  c5 92         cmp $92
$11:b777  37 6b         and [$6b],y
$11:b779  8a            txa
$11:b77a  59 a3 2b      eor $2ba3,y
$11:b77d  30 ab         bmi $b72a
$11:b77f  4a            lsr a
$11:b780  6f 73 48 ec   adc $ec4873
$11:b784  73 ff         adc ($ff,s),y
$11:b786  cf ff f0 ff   cmp $fff0ff
$11:b78a  fc 0f ff      jsr ($ff0f,x)
$11:b78d  05 86         ora $86
$11:b78f  3e 1f f8      rol $f81f,x
$11:b792  f4 70 58      pea $5870
$11:b795  6a            ror a
$11:b796  cf fe 29 3c   cmp $3c29fe
$11:b79a  90 49         bcc $b7e5
$11:b79c  30 9c         bmi $b73a
$11:b79e  6a            ror a
$11:b79f  45 3a         eor $3a
$11:b7a1  21 31         and ($31,x)
$11:b7a3  90 c8         bcc $b76d
$11:b7a5  5f e5 c3 80   eor $80c3e5,x
$11:b7a9  76 e0         ror $e0,x
$11:b7ab  13 98         ora ($98,s),y
$11:b7ad  06 c6         asl $c6
$11:b7af  01 ce         ora ($ce,x)
$11:b7b1  80 77         bra $b82a
$11:b7b3  a0 14         ldy #$14
$11:b7b5  1b            tcs
$11:b7b6  0e 6b ff      asl $ff6b
$11:b7b9  28            plp
$11:b7ba  9e 41 24      stz $2441,x
$11:b7bd  92 1b         sta ($1b)
$11:b7bf  1c 4a e5      trb $e54a
$11:b7c2  08            php
$11:b7c3  c6 61         dec $61
$11:b7c5  30 99         bmi $b760
$11:b7c7  e7 02         sbc [$02]
$11:b7c9  e7 20         sbc [$20]
$11:b7cb  18            clc
$11:b7cc  d8            cld
$11:b7cd  05 ce         ora $ce
$11:b7cf  00 5e         brk #$5e
$11:b7d1  0c c7 fe      tsb $fec7
$11:b7d4  7d e3 b1      adc $b1e3,x
$11:b7d7  f7 6b         sbc [$6b],y
$11:b7d9  7a            ply
$11:b7da  4a            lsr a
$11:b7db  ee ba 9f      inc $9fba
$11:b7de  bc bb 72      ldy $72bb,x
$11:b7e1  76 63         ror $63,x
$11:b7e3  40            rti
$11:b7e4  70 84         bvs $b76a
$11:b7e6  72 01         adc ($01)
$11:b7e8  3e 31 84      rol $8431,x
$11:b7eb  10 bc         bpl $b7a9
$11:b7ed  17 f1         ora [$f1],y
$11:b7ef  18            clc
$11:b7f0  c0 27         cpy #$27
$11:b7f2  7c 3f 54      jmp ($543f,x)
$11:b7f5  23 51         and $51,s
$11:b7f7  21 ab         and ($ab,x)
$11:b7f9  54 7e 9e      mvn $9e,$7e
$11:b7fc  3d 5e 97      and $975e,x
$11:b7ff  b7 c5         lda [$c5],y
$11:b801  d4 69         pei ($69)
$11:b803  d9 61 f8      cmp $f861,y
$11:b806  fb            xce
$11:b807  f8            sed
$11:b808  3b            tsc
$11:b809  fd 0d 7f      sbc $7f0d,x
$11:b80c  82 3f a0      brl $584e
$11:b80f  af f0 27 e4   lda $e427f0
$11:b813  90 e9         bcc $b7fe
$11:b815  73 72         adc ($72,s),y
$11:b817  91 39         sta ($39),y
$11:b819  b7 17         lda [$17],y
$11:b81b  97 f2         sta [$f2],y
$11:b81d  fa            plx
$11:b81e  fe 6f 7f      inc $7f6f,x
$11:b821  db            stp
$11:b822  6f ff 6a ab   adc $ab6aff
$11:b826  09 fc         ora #$fc
$11:b828  7f df 07 fd   adc $fd07df,x
$11:b82c  c0 ff         cpy #$ff
$11:b82e  b0 1f         bcs $b84f
$11:b830  f1 9d         sbc ($9d),y
$11:b832  15 61         ora $61,x
$11:b834  f5 38         sbc $38,x
$11:b836  8f c3 ef 07   sta $07efc3
$11:b83a  85 df         sta $df
$11:b83c  ee 97 fb      inc $fb97
$11:b83f  cd b6 f6      cmp $f6b6
$11:b842  1e 0f ac      asl $ac0f,x
$11:b845  29 02         and #$02
$11:b847  1f 08 7c 0f   ora $0f7c08,x
$11:b84b  f9 64 cd      sbc $cd64,y
$11:b84e  da            phx
$11:b84f  72 c8         adc ($c8)
$11:b851  b0 55         bcs $b8a8
$11:b853  85 99         sta $99
$11:b855  22 3c 2f 17   jsl $172f3c
$11:b859  93 a9         sta ($a9,s),y
$11:b85b  f2 95         sbc ($95)
$11:b85d  74 3f         stz $3f,x
$11:b85f  09 c0         ora #$c0
$11:b861  0f 05 9b 32   ora $329b05
$11:b865  a1 08         lda ($08,x)
$11:b867  17 f7         ora [$f7],y
$11:b869  89 3b         bit #$3b
$11:b86b  91 77         sta ($77),y
$11:b86d  72 16         adc ($16)
$11:b86f  f5 58         sbc $58,x
$11:b871  45 fd         eor $fd
$11:b873  3f 78 ca c4   and $c4ca78,x
$11:b877  2e f5 9f      rol $9ff5
$11:b87a  bd 67 eb      lda $eb67,x
$11:b87d  59 eb ae      eor $aeeb,y
$11:b880  07 f9         ora [$f9]
$11:b882  ff e0 7e f0   sbc $f07ee0,x
$11:b886  1b            tcs
$11:b887  be 06 ee      ldx $ee06,y
$11:b88a  81 3b         sta ($3b,x)
$11:b88c  63 a4         adc $a4,s
$11:b88e  43 df         eor $df,s
$11:b890  42 de         wdm #$de
$11:b892  db            stp
$11:b893  7f 56 ef db   adc $dbef56,x
$11:b897  55 af         eor $af,x
$11:b899  ff f6 f8 53   sbc $53f8f6,x
$11:b89d  f6 f4         inc $f4,x
$11:b89f  87 23         sta [$23]
$11:b8a1  df 7f 7a 6a   cmp $6a7a7f,x
$11:b8a5  cd ae af      cmp $afae
$11:b8a8  5f bd de f7   eor $f7debd,x
$11:b8ac  b1 7a         lda ($7a),y
$11:b8ae  cc be 3d      cpy $3dbe
$11:b8b1  06 93         asl $93
$11:b8b3  c0 1f         cpy #$1f
$11:b8b5  e3 80         sbc $80,s
$11:b8b7  01 0b         ora ($0b,x)
$11:b8b9  fc 34 10      jsr ($1034,x)
$11:b8bc  0e 04 03      asl $0304
$11:b8bf  b1 00         lda ($00),y
$11:b8c1  8f 7f fd de   sta $defd7f
$11:b8c5  fc 76 3c      jsr ($3c76,x)
$11:b8c8  de 1c 3f      dec $3f1c,x
$11:b8cb  ff 77 fb d1   sbc $d1fb77,x
$11:b8cf  f8            sed
$11:b8d0  9b            txy
$11:b8d1  c1 fe         cmp ($fe,x)
$11:b8d3  11 08         ora ($08),y
$11:b8d5  05 c1         ora $c1
$11:b8d7  fe 50 08      inc $0850,x
$11:b8da  14 02         trb $02
$11:b8dc  1c ff 13      trb $13ff
$11:b8df  78            sei
$11:b8e0  1b            tcs
$11:b8e1  c3 3f         cmp $3f,s
$11:b8e3  9f 37 87 8c   sta $8c8737,x
$11:b8e7  5e 3f 9f      lsr $9f3f,x
$11:b8ea  c8            iny
$11:b8eb  74 9f         stz $9f,x
$11:b8ed  e1 60         sbc ($60,x)
$11:b8ef  12 1b         ora ($1b)
$11:b8f1  fc 20 cf      jsr ($cf20,x)
$11:b8f4  f1 fb         sbc ($fb),y
$11:b8f6  de 89 e1      dec $e189,x
$11:b8f9  f6 3f         inc $3f,x
$11:b8fb  04 0a         tsb $0a
$11:b8fd  bf bf af ec   lda $ecafbf,x
$11:b901  ea            nop
$11:b902  fb            xce
$11:b903  bb            tyx
$11:b904  fe 02 c5      inc $c502,x
$11:b907  1f 2f 84 8a   ora $8a842f,x
$11:b90b  bf 07 bf cf   lda $cfbf07,x
$11:b90f  ef f3 33 40   sbc $4033f3
$11:b913  99 c3 bf      sta $bfc3,y
$11:b916  7e 37 85      ror $8537,x
$11:b919  7f fd ff a0   adc $a0fffd,x
$11:b91d  7e ff bf      ror $bfff,x
$11:b920  bc 6e 6f      ldy $6f6e,x
$11:b923  db            stp
$11:b924  9f b0 d3 be   sta $bed3b0,x
$11:b928  07 f0         ora [$f0]
$11:b92a  a6 7c         ldx $7c
$11:b92c  bc 1f ef      ldy $ef1f,x
$11:b92f  e7 fb         sbc [$fb]
$11:b931  18            clc
$11:b932  88            dey
$11:b933  3b            tsc
$11:b934  a4 03         ldy $03
$11:b936  fd 00 c0      sbc $c000,x
$11:b939  ff ba 9a af   sbc $af9aba,x
$11:b93d  fe 03 57      inc $5703,x
$11:b940  d4 80         pei ($80)
$11:b942  df b0 37 e1   cmp $e137b0,x
$11:b946  78            sei
$11:b947  e0 54         cpx #$54
$11:b949  2b            pld
$11:b94a  d5 17         cmp $17,x
$11:b94c  96 02         stx $02,y
$11:b94e  ff 55 95 7f   sbc $7f9555,x
$11:b952  70 49         bvs $b99d
$11:b954  90 ea         bcc $b940
$11:b956  ea            nop
$11:b957  92 61         sta ($61)
$11:b959  7e 80 6f      ror $6f80,x
$11:b95c  b0 02         bcs $b960
$11:b95e  f2 17         sbc ($17)
$11:b960  8a            txa
$11:b961  a8            tay
$11:b962  14 49         trb $49
$11:b964  ff 77 97 af   sbc $af9777,x
$11:b968  af df fd bd   lda $bdfddf
$11:b96c  c3 6f         cmp $6f,s
$11:b96e  f9 f7 f7      sbc $f7f7,y
$11:b971  bb            tyx
$11:b972  c3 e3         cmp $e3,s
$11:b974  6f d6 fb bf   adc $bffbd6
$11:b978  65 cd         adc $cd
$11:b97a  75 fd         adc $fd,x
$11:b97c  7f be ff 7b   adc $7bffbe,x
$11:b980  7a            ply
$11:b981  7c 0f bd      jmp ($bd0f,x)
$11:b984  ec a8 03      cpx $03a8
$11:b987  f2 7f         sbc ($7f)
$11:b989  d5 43         cmp $43,x
$11:b98b  1f 11 93 4d   ora $4d9311,x
$11:b98f  28            plp
$11:b990  96 6c         stx $6c,y
$11:b992  b5 0b         lda $0b,x
$11:b994  77 80         adc [$80],y
$11:b996  be 8b 84      ldx $848b,y
$11:b999  36 10         rol $10,x
$11:b99b  0e fc 03      asl $03fc
$11:b99e  37 00         and [$00],y
$11:b9a0  8c c0 27      sty $27c0
$11:b9a3  90 05         bcc $b9aa
$11:b9a5  d8            cld
$11:b9a6  24 40         bit $40
$11:b9a8  7c 14 7a      jmp ($7a14,x)
$11:b9ab  57 de         eor [$de],y
$11:b9ad  d5 d9         cmp $d9,x
$11:b9af  b9 52 af      lda $af52,y
$11:b9b2  54 bb ff      mvn $ff,$bb
$11:b9b5  36 fb         rol $fb,x
$11:b9b7  cd 8c ce      cmp $ce8c
$11:b9ba  f9 7c 0d      sbc $0d7c,y
$11:b9bd  ff 83 3f d0   sbc $d03f83,x
$11:b9c1  c7 f2         cmp [$f2]
$11:b9c3  b0 bc         bcs $b981
$11:b9c5  8c 27 2f      sty $2f27
$11:b9c8  09 eb         ora #$eb
$11:b9ca  f2 7e         sbc ($7e)
$11:b9cc  7e 9b af      ror $af9b,x
$11:b9cf  b7 df         lda [$df],y
$11:b9d1  7d ee de      adc $deee,x
$11:b9d4  ee 37 7f      inc $7f37
$11:b9d7  2f 0e 83 63   and $63830e
$11:b9db  b4 d1         ldy $d1,x
$11:b9dd  fa            plx
$11:b9de  3c f0 3f      bit $3ff0,x
$11:b9e1  ec 1f f3      cpx $f31f
$11:b9e4  09 f9         ora #$f9
$11:b9e6  ed 68 72      sbc $7268
$11:b9e9  d8            cld
$11:b9ea  9f b6 27 ef   sta $ef27b6,x
$11:b9ee  8b            phb
$11:b9ef  eb            xba
$11:b9f0  e3 f1         sbc $f1,s
$11:b9f2  de dc 3b      dec $3bdc,x
$11:b9f5  ab            plb
$11:b9f6  a7 f5         lda [$f5]
$11:b9f8  cc 7c f9      cpy $f97c
$11:b9fb  8e 86 33      stx $3386
$11:b9fe  d1 80         cmp ($80),y
$11:ba00  fc 60 ff      jsr ($ff60,x)
$11:ba03  f0 8f         beq $b994
$11:ba05  bc 13 f7      ldy $f713,x
$11:ba08  23 ee         and $ee,s
$11:ba0a  48            pha
$11:ba0b  3b            tsc
$11:ba0c  f1 0f         sbc ($0f),y
$11:ba0e  79 fc 20      adc $20fc,y
$11:ba11  01 d1         ora ($d1,x)
$11:ba13  fc fe ff      jsr ($fffe,x)
$11:ba16  2f 40 e9 fc   and $fce940
$11:ba1a  fd 7c d8      sbc $d87c,x
$11:ba1d  ff be 5f 1a   sbc $1a5fbe,x
$11:ba21  9f ce bf e8   sta $e8bfce,x
$11:ba25  70 42         bvs $ba69
$11:ba27  87 02         sta [$02]
$11:ba29  7e 8b 03      ror $038b,x
$11:ba2c  f8            sed
$11:ba2d  21 41         and ($41,x)
$11:ba2f  16 5d         asl $5d,x
$11:ba31  5a            phy
$11:ba32  ca            dex
$11:ba33  bc 3a f5      ldy $f53a,x
$11:ba36  8f ed 0f bf   sta $bf0fed
$11:ba3a  73 ff         adc ($ff,s),y
$11:ba3c  cc 37 76      cpy $7637
$11:ba3f  6f 75 de 81   adc $81de75
$11:ba43  3b            tsc
$11:ba44  5f 95 06 75   eor $750695,x
$11:ba48  50 95         bvc $b9df
$11:ba4a  c0 2f         cpy #$2f
$11:ba4c  f2 2a         sbc ($2a)
$11:ba4e  ac 02 ef      ldy $ef02
$11:ba51  6a            ror a
$11:ba52  fd db bf      sbc $bfdb,x
$11:ba55  7e ab db      ror $dbab,x
$11:ba58  4c 2f 58      jmp $582f
$11:ba5b  bd fd a3      lda $a3fd,x
$11:ba5e  d7 7e         cmp [$7e],y
$11:ba60  ff 41 e9 1b   sbc $1be941,x
$11:ba64  76 fa         ror $fa,x
$11:ba66  1f c2 51 57   ora $5751c2,x
$11:ba6a  85 5d         sta $5d
$11:ba6c  60            rts
$11:ba6d  10 7d         bpl $baec
$11:ba6f  bf fe a7 df   lda $dfa7fe,x
$11:ba73  f2 df         sbc ($df)
$11:ba75  79 d3 7d      adc $7dd3,y
$11:ba78  e7 ce         sbc [$ce]
$11:ba7a  af df f3 df   lda $dff3df
$11:ba7e  f9 f3 f9      sbc $f9f3,y
$11:ba81  84 02         sty $02
$11:ba83  a7 20         lda [$20]
$11:ba85  b2 c0         lda ($c0)
$11:ba87  a0 d0         ldy #$d0
$11:ba89  07 f8         ora [$f8]
$11:ba8b  54 24 16      mvn $16,$24
$11:ba8e  08            php
$11:ba8f  00 30         brk #$30
$11:ba91  20 7f cf      jsr $cf7f
$11:ba94  ec 03 eb      cpx $eb03
$11:ba97  00 ca         brk #$ca
$11:ba99  c0 19         cpy #$19
$11:ba9b  80 17         bra $bab4
$11:ba9d  4f f7 ff f1   eor $f1fff7
$11:baa1  ff f0 7f f0   sbc $f07ff0,x
$11:baa5  08            php
$11:baa6  c1 13         cmp ($13,x)
$11:baa8  a7 03         lda [$03]
$11:baaa  7f f0 d7 ef   adc $efd7f0,x
$11:baae  3d 78 5f      and $5f78,x
$11:bab1  d7 4b         cmp [$4b],y
$11:bab3  5f c3 df 6e   eor $6edfc3,x
$11:bab7  ff db 3f 35   sbc $353fdb,x
$11:babb  ff ff 1f ff   sbc $ff1fff,x
$11:babf  c1 ff         cmp ($ff,x)
$11:bac1  f3 9e         sbc ($9e,s),y
$11:bac3  3c a3 8f      bit $8fa3,x
$11:bac6  38            sec
$11:bac7  e3 c0         sbc $c0,s
$11:bac9  38            sec
$11:baca  f1 8f         sbc ($8f),y
$11:bacc  3c 13 d7      bit $d713,x
$11:bacf  d1 87         cmp ($87),y
$11:bad1  79 21 65      adc $6521,y
$11:bad4  10 f4         bpl $baca
$11:bad6  42 3b         wdm #$3b
$11:bad8  11 7e         ora ($7e),y
$11:bada  b4 67         ldy $67,x
$11:badc  2d 39 11      and $1139
$11:badf  87 00         sta [$00]
$11:bae1  48            pha
$11:bae2  57 f8         eor [$f8],y
$11:bae4  3d c2 1f      and $1fc2,x
$11:bae7  60            rts
$11:bae8  9c d4 2f      stz $2fd4
$11:baeb  31 0d         and ($0d),y
$11:baed  e5 6e         sbc $6e
$11:baef  fd 9d df      sbc $df9d,x
$11:baf2  d7 af         cmp [$af],y
$11:baf4  f9 e8 fc      sbc $fce8,y
$11:baf7  7a            ply
$11:baf8  3f ee b5 e6   and $e6b5ee,x
$11:bafc  ad 39 c2      lda $c239
$11:baff  18            clc
$11:bb00  40            rti
$11:bb01  ff f0 15 60   sbc $6015f0,x
$11:bb05  7f bc 10 ef   adc $ef10bc,x
$11:bb09  84 1b         sty $1b
$11:bb0b  39 0a cf      and $cf0a,y
$11:bb0e  42 03         wdm #$03
$11:bb10  c0 1e         cpy #$1e
$11:bb12  08            php
$11:bb13  17 f1         ora [$f1],y
$11:bb15  26 3f         rol $3f
$11:bb17  84 b8         sty $b8
$11:bb19  42 be         wdm #$be
$11:bb1b  09 b0         ora #$b0
$11:bb1d  0f 80 7c 3f   ora $3f7c80
$11:bb21  8a            txa
$11:bb22  21 10         and ($10,x)
$11:bb24  80 84         bra $baaa
$11:bb26  3e 0a a1      rol $a10a,x
$11:bb29  15 96         ora $96,x
$11:bb2b  03 01         ora $01,s
$11:bb2d  c0 59         cpy #$59
$11:bb2f  8f ab 3f c5   sta $c53fab
$11:bb33  d7 e7         cmp [$e7],y
$11:bb35  7d e3 f0      adc $f0e3,x
$11:bb38  1f 80 9d 98   ora $989d80,x
$11:bb3c  6e d3 3d      ror $3dd3
$11:bb3f  57 ee         eor [$ee],y
$11:bb41  a7 f7         lda [$f7]
$11:bb43  a1 fb         lda ($fb,x)
$11:bb45  ff ed f1 61   sbc $61f1ed,x
$11:bb49  fb            xce
$11:bb4a  4c 23 d0      jmp $d023
$11:bb4d  c8            iny
$11:bb4e  96 83         stx $83,y
$11:bb50  ff 40 f0 f3   sbc $f3f040,x
$11:bb54  1b            tcs
$11:bb55  e4 2c         cpx $2c
$11:bb57  18            clc
$11:bb58  f7 86         sbc [$86],y
$11:bb5a  25 e1         and $e1
$11:bb5c  02 80         cop #$80
$11:bb5e  14 20         trb $20
$11:bb60  1e 18 3f      asl $3f18,x
$11:bb63  e3 f9         sbc $f9,s
$11:bb65  03 f9         ora $f9,s
$11:bb67  43 ed         eor $ed,s
$11:bb69  31 70         and ($70),y
$11:bb6b  98            tya
$11:bb6c  7b            tdc
$11:bb6d  e3 f7         sbc $f7,s
$11:bb6f  f8            sed
$11:bb70  ad d2 16      lda $16d2
$11:bb73  df 05 38 17   cmp $173805,x
$11:bb77  d0 c6         bne $bb3f
$11:bb79  10 af         bpl $bb2a
$11:bb7b  ac ff 81      ldy $81ff
$11:bb7e  e0 8f         cpx #$8f
$11:bb80  cc 39 fe      cpy $fe39
$11:bb83  cf 9f eb fa   cmp $faeb9f
$11:bb87  a2 0f         ldx #$0f
$11:bb89  ea            nop
$11:bb8a  7c 2a d5      jmp ($d52a,x)
$11:bb8d  ed 1b 7c      sbc $7c1b
$11:bb90  23 ff         and $ff,s
$11:bb92  f8            sed
$11:bb93  3a            dec a
$11:bb94  00 d0         brk #$d0
$11:bb96  61 a8         adc ($a8,x)
$11:bb98  ab            plb
$11:bb99  84 41         sty $41
$11:bb9b  fc 6b 01      jsr ($016b,x)
$11:bb9e  58            cli
$11:bb9f  0c 02 78      tsb $7802
$11:bba2  b0 1a         bcs $bbbe
$11:bba4  ac 00 be      ldy $be00
$11:bba7  46 00         lsr $00
$11:bba9  e1 ff         sbc ($ff,x)
$11:bbab  cc e0 df      cpy $dfe0
$11:bbae  2d 5f ff      and $ff5f
$11:bbb1  17 ff         ora [$ff],y
$11:bbb3  1f 06 ab ff   ora $ffab06,x
$11:bbb7  d6 ff         dec $ff,x
$11:bbb9  e7 bf         sbc [$bf]
$11:bbbb  f9 77 07      sbc $0777,y
$11:bbbe  95 42         sta $42,x
$11:bbc0  71 ff         adc ($ff),y
$11:bbc2  dd 7f ef      cmp $ef7f,x
$11:bbc5  a4 21         ldy $21
$11:bbc7  82 9d 07      brl $c367
$11:bbca  f4 7c f2      pea $f27c
$11:bbcd  a9 66         lda #$66
$11:bbcf  6c df f5      jmp ($f5df)
$11:bbd2  90 1f         bcc $bbf3
$11:bbd4  cf ba ab 3c   cmp $3cabba
$11:bbd8  ca            dex
$11:bbd9  fc 58 20      jsr ($2058,x)
$11:bbdc  c1 1f         cmp ($1f,x)
$11:bbde  fe ef 76      inc $76ef,x
$11:bbe1  9d 15 87      sta $8715,x
$11:bbe4  b0 73         bcs $bc59
$11:bbe6  0f cf 90 6b   ora $6b90cf
$11:bbea  30 51         bmi $bc3d
$11:bbec  ae 44 c7      ldx $c744
$11:bbef  19 c3 93      ora $93c3,y
$11:bbf2  eb            xba
$11:bbf3  f0 f1         beq $bbe6
$11:bbf5  fe 7c fe      inc $fe7c,x
$11:bbf8  01 30         ora ($30,x)
$11:bbfa  80 5c         bra $bc58
$11:bbfc  e0 16         cpx #$16
$11:bbfe  78            sei
$11:bbff  04 19         tsb $19
$11:bc01  fe 37 08      inc $0837,x
$11:bc04  05 80         ora $80
$11:bc06  c8            iny
$11:bc07  30 1a         bmi $bc23
$11:bc09  ac 12 39      ldy $3912
$11:bc0c  0b            phd
$11:bc0d  e4 df         cpx $df
$11:bc0f  ff b3 fe 5c   sbc $5cfeb3,x
$11:bc13  f3 93         sbc ($93,s),y
$11:bc15  3e ef d2      rol $d2ef,x
$11:bc18  20 1f e8      jsr $e81f
$11:bc1b  1f e3 2f e0   ora $e02fe3,x
$11:bc1f  be 52 ef      ldx $ef52,y
$11:bc22  93 fb         sta ($fb,s),y
$11:bc24  f4 20 52      pea $5220
$11:bc27  1b            tcs
$11:bc28  ec 47 bf      cpx $bf47
$11:bc2b  75 be         adc $be,x
$11:bc2d  95 ce         sta $ce,x
$11:bc2f  3a            dec a
$11:bc30  d9 3f f6      cmp $f63f,y
$11:bc33  ff f9 d3 9e   sbc $9ed3f9,x
$11:bc37  64 ef         stz $ef
$11:bc39  9f b8 94 02   sta $0294b8,x
$11:bc3d  ff c0 8f fa   sbc $fa8fc0,x
$11:bc41  60            rts
$11:bc42  f3 ee         sbc ($ee,s),y
$11:bc44  94 fb         sty $fb,x
$11:bc46  f9 7e 88      sbc $887e,y
$11:bc49  12 42         ora ($42)
$11:bc4b  fb            xce
$11:bc4c  11 cb         ora ($cb),y
$11:bc4e  5e 49 e1      lsr $e149,x
$11:bc51  ff bf f7 67   sbc $67f7bf,x
$11:bc55  d9 cb fe      cmp $fecb,y
$11:bc58  32 83         and ($83)
$11:bc5a  9c b9 ff      stz $ffb9
$11:bc5d  ee 77 98      inc $9877
$11:bc60  85 fc         sta $fc
$11:bc62  c0 17         cpy #$17
$11:bc64  fa            plx
$11:bc65  0c f8 ca      tsb $caf8
$11:bc68  00 20         brk #$20
$11:bc6a  b1 b3         lda ($b3),y
$11:bc6c  c2 01         rep #$01
$11:bc6e  69 cf         adc #$cf
$11:bc70  1b            tcs
$11:bc71  c3 ff         cmp $ff,s
$11:bc73  fe ff d1      inc $d1ff,x
$11:bc76  29 bf         and #$bf
$11:bc78  aa            tax
$11:bc79  cf da e3 ee   cmp $eee3da
$11:bc7d  39 86 7a      and $7a86,y
$11:bc80  11 fe         ora ($fe),y
$11:bc82  40            rti
$11:bc83  02 0c         cop #$0c
$11:bc85  28            plp
$11:bc86  9f ea 47 fa   sta $fa47ea,x
$11:bc8a  a1 fe         lda ($fe,x)
$11:bc8c  b0 50         bcs $bcde
$11:bc8e  28            plp
$11:bc8f  10 af         bpl $bc40
$11:bc91  07 aa         ora [$aa]
$11:bc93  00 91         brk #$91
$11:bc95  2d 52 58      and $5852
$11:bc98  75 70         adc $70,x
$11:bc9a  1d 54 07      ora $0754,x
$11:bc9d  c1 ff         cmp ($ff,x)
$11:bc9f  4f 87 01 44   eor $440187
$11:bca3  38            sec
$11:bca4  06 b9         asl $b9
$11:bca6  7f a0 3f ec   adc $ec3fa0,x
$11:bcaa  3f df 15 e0   and $e015df,x
$11:bcae  c0 fb         cpy #$fb
$11:bcb0  96 61         stx $61,y
$11:bcb2  85 f7         sta $f7
$11:bcb4  62 fd d0      per $8db4
$11:bcb7  f5 d0         sbc $d0,x
$11:bcb9  b5 8d         lda $8d,x
$11:bcbb  80 d7         bra $bc94
$11:bcbd  fc 05 ff      jsr ($ff05,x)
$11:bcc0  c7 fd         cmp [$fd]
$11:bcc2  f2 fe         sbc ($fe)
$11:bcc4  bd 1f 7f      lda $7f1f,x
$11:bcc7  3f ab 4f fa   and $fa4fab,x
$11:bccb  83 fe         sta $fe,s
$11:bccd  9d a0 a8      sta $a8a0,x
$11:bcd0  08            php
$11:bcd1  17 f6         ora [$f6],y
$11:bcd3  0f f8 87 fc   ora $fc87f8
$11:bcd7  21 5f         and ($5f,x)
$11:bcd9  27 29         and [$29]
$11:bcdb  2f cb c1 e1   and $e1c1cb
$11:bcdf  f0 ff         beq $bce0
$11:bce1  fc 37 f9      jsr ($f937,x)
$11:bce4  fe fe 54      inc $54fe,x
$11:bce7  a8            tay
$11:bce8  16 d9         asl $d9,x
$11:bcea  47 bc         eor [$bc]
$11:bcec  2a            rol a
$11:bced  90 66         bcc $bd55
$11:bcef  80 0d         bra $bcfe
$11:bcf1  17 e4         ora [$e4],y
$11:bcf3  65 0e         adc $0e
$11:bcf5  0e f8 7e      asl $7ef8
$11:bcf8  1b            tcs
$11:bcf9  de f6 ff      dec $fff6,x
$11:bcfc  81 9f         sta ($9f,x)
$11:bcfe  f0 06         beq $bd06
$11:bd00  43 01         eor $01,s
$11:bd02  e3 9f         sbc $9f,s
$11:bd04  70 3f         bvs $bd45
$11:bd06  cc b1 f1      cpy $f1b1
$11:bd09  c7 3c         cmp [$3c]
$11:bd0b  70 01         bvs $bd0e
$11:bd0d  39 67 20      and $2067,y
$11:bd10  18            clc
$11:bd11  7b            tdc
$11:bd12  d6 0a         dec $0a,x
$11:bd14  f9 f1 bf      sbc $bff1,y
$11:bd17  62 15 81      per $3e2f
$11:bd1a  8e a8 c1      stx $c1a8
$11:bd1d  87 21         sta [$21]
$11:bd1f  01 83         ora ($83,x)
$11:bd21  5f 20 77 e1   eor $e17720,x
$11:bd25  b8            clv
$11:bd26  5c 20 df 9b   jml $9bdf20
$11:bd2a  b6 23         ldx $23,y
$11:bd2c  5d 00 24      eor $2400,x
$11:bd2f  87 e2         sta [$e2]
$11:bd31  01 55         ora ($55,x)
$11:bd33  ea            nop
$11:bd34  93 d2         sta ($d2,s),y
$11:bd36  ff ff de d0   sbc $d0deff,x
$11:bd3a  b8            clv
$11:bd3b  73 c0         adc ($c0,s),y
$11:bd3d  58            cli
$11:bd3e  55 75         eor $75,x
$11:bd40  45 f4         eor $f4
$11:bd42  95 75         sta $75,x
$11:bd44  70 3f         bvs $bd85
$11:bd46  fe 1b 6c      inc $6c1b,x
$11:bd49  75 45         adc $45,x
$11:bd4b  e0 aa         cpx #$aa
$11:bd4d  cf e7 b7 e9   cmp $e9b7e7
$11:bd51  e1 d4         sbc ($d4,x)
$11:bd53  27 f7         and [$f7]
$11:bd55  d3 b0         cmp ($b0,s),y
$11:bd57  37 05         and [$05],y
$11:bd59  2c 22 10      bit $1022
$11:bd5c  54 1c c3      mvn $c3,$1c
$11:bd5f  ff 38 36 a2   sbc $a23638,x
$11:bd63  04 3d         tsb $3d
$11:bd65  d4 4d         pei ($4d)
$11:bd67  d4 43         pei ($43)
$11:bd69  5d 04 82      eor $8204,x
$11:bd6c  6b            rtl
$11:bd6d  8f a8 c8 0d   sta $0dc8a8
$11:bd71  dc 03 df      jml [$df03]
$11:bd74  00 fd         brk #$fd
$11:bd76  aa            tax
$11:bd77  04 da         tsb $da
$11:bd79  9f ea a2 cc   sta $cca2ea,x
$11:bd7d  10 21         bpl $bda0
$11:bd7f  be 8a 26      ldx $268a,y
$11:bd82  d1 06         cmp ($06),y
$11:bd84  5a            phy
$11:bd85  b0 58         bcs $bddf
$11:bd87  fa            plx
$11:bd88  d5 4b         cmp $4b,x
$11:bd8a  5d ae ee      eor $eeae,x
$11:bd8d  e3 25         sbc $25,s
$11:bd8f  e0 6a         cpx #$6a
$11:bd91  93 58         sta ($58,s),y
$11:bd93  0f a5 ba 41   ora $41baa5
$11:bd97  0a            asl a
$11:bd98  04 1c         tsb $1c
$11:bd9a  a8            tay
$11:bd9b  bd 0a f4      lda $f40a,x
$11:bd9e  03 eb         ora $eb,s
$11:bda0  01 e0         ora ($e0,x)
$11:bda2  c0 69         cpy #$69
$11:bda4  d0 dc         bne $bd82
$11:bda6  fc 7e ef      jsr ($ef7e,x)
$11:bda9  4f fb 73 cd   eor $cd73fb
$11:bdad  82 fd 3f      brl $fdad
$11:bdb0  e7 f1         sbc [$f1]
$11:bdb2  7a            ply
$11:bdb3  1c 00 48      trb $4800
$11:bdb6  af 43 fd fe   lda $fefd43
$11:bdba  db            stp
$11:bdbb  de ff 37      dec $37ff,x
$11:bdbe  7e cf bb      ror $bbcf,x
$11:bdc1  ff f7 2b 87   sbc $872bf7,x
$11:bdc5  70 0a         bvs $bdd1
$11:bdc7  00 61         brk #$61
$11:bdc9  81 c0         sta ($c0,x)
$11:bdcb  ee 37 18      inc $1837
$11:bdce  44 23 ef      mvp $ef,$23
$11:bdd1  f7 a6         sbc [$a6],y
$11:bdd3  53 39         eor ($39,s),y
$11:bdd5  7c 8f df      jmp ($df8f,x)
$11:bdd8  e2 7d         sep #$7d
$11:bdda  3e 5e 86      rol $865e,x
$11:bddd  5c 1c 1f ff   jml $ff1f1c
$11:bde1  a7 ff         lda [$ff]
$11:bde3  8e 6c 19      stx $196c
$11:bde6  0c 85 fa      tsb $fa85
$11:bde9  51 78         eor ($78),y
$11:bdeb  b8            clv
$11:bdec  14 38         trb $38
$11:bdee  9c 4e 3f      stz $3f4e
$11:bdf1  1e 7f 3f      asl $3f7f,x
$11:bdf4  ef 40 09 61   sbc $610940
$11:bdf8  cd 1a 0f      cmp $0f1a
$11:bdfb  64 d8         stz $d8
$11:bdfd  33 cf         and ($cf,s),y
$11:bdff  ff 9f cf 05   sbc $05cf9f,x
$11:be03  c3 2f         cmp $2f,s
$11:be05  43 99         eor $99,s
$11:be07  cc 07 87      cpy $8707
$11:be0a  07 82         ora [$82]
$11:be0c  57 19         eor [$19],y
$11:be0e  e7 6f         sbc [$6f]
$11:be10  87 78         sta [$78]
$11:be12  42 0a         wdm #$0a
$11:be14  10 8a         bpl $bda0
$11:be16  c2 70         rep #$70
$11:be18  63 f6         adc $f6,s
$11:be1a  ea            nop
$11:be1b  20 3a 88      jsr $883a
$11:be1e  1e a6 05      asl $05a6,x
$11:be21  ab            plb
$11:be22  83 e8         sta $e8,s
$11:be24  e0 9a 38      cpx #$389a
$11:be27  72 64         adc ($64)
$11:be29  63 d0         adc $d0,s
$11:be2b  3f e2 7c 20   and $207ce2,x
$11:be2f  ff 88 27 ee   sbc $ee2788,x
$11:be33  19 f0 87      ora $87f0,y
$11:be36  7c a3 de      jmp ($dea3,x)
$11:be39  25 58         and $58
$11:be3b  43 f7         eor $f7,s
$11:be3d  f0 0f         beq $be4e
$11:be3f  8e 5e b2      stx $b25e
$11:be42  0c 0e 6c      tsb $6c0e
$11:be45  af 81 7f e3   lda $e37f81
$11:be49  dd 78 57      cmp $5778,x
$11:be4c  fe 04 87      inc $8704,x
$11:be4f  9d 31 f3      sta $f331,x
$11:be52  44 64 dd      mvp $dd,$64
$11:be55  99 b4 26      sta $26b4,y
$11:be58  e5 4d         sbc $4d
$11:be5a  bd 51 6f      lda $6f51,x
$11:be5d  14 7c         trb $7c
$11:be5f  94 03         sty $03,x
$11:be61  25 ff         and $ff
$11:be63  c9 5b 66      cmp #$665b
$11:be66  1c f9 87      trb $87f9
$11:be69  fd ae 14      sbc $14ae,x
$11:be6c  05 80         ora $80
$11:be6e  7f ed b0 06   adc $06b0ed,x
$11:be72  f8            sed
$11:be73  1c 83 9e      trb $9e83
$11:be76  71 06         adc ($06),y
$11:be78  b9 35 c2      lda $c235,y
$11:be7b  01 49         ora ($49,x)
$11:be7d  77 07         adc [$07],y
$11:be7f  fa            plx
$11:be80  97 b5         sta [$b5],y
$11:be82  bd f3 5e      lda $5ef3,x
$11:be85  a4 f3         ldy $f3
$11:be87  08            php
$11:be88  1f f7 6d 00   ora $006df7,x
$11:be8c  7f 87 f2 01   adc $01f287,x
$11:be90  cc a4 01      cpy $01a4
$11:be93  4b            phk
$11:be94  f9 30 01      sbc $0130,y
$11:be97  81 9c         sta ($9c,x)
$11:be99  2f ff f9 ff   and $fff9ff
$11:be9d  fe 3f ff      inc $ff3f,x
$11:bea0  87 fd         sta [$fd]
$11:bea2  e3 fe         sbc $fe,s
$11:bea4  39 ff 06      and $06ff,y
$11:bea7  ff 80 80 ff   sbc $ff8080,x
$11:beab  94 25         sty $25,x
$11:bead  0f f8 28 c1   ora $c128f8
$11:beb1  3e 01 f0      rol $f001,x
$11:beb4  39 8c 06      and $068c,y
$11:beb7  ff 03 9f c1   sbc $c19f03,x
$11:bebb  e3 f0         sbc $f0,s
$11:bebd  f1 b0         sbc ($b0),y
$11:bebf  47 e3         eor [$e3]
$11:bec1  e4 f0         cpx $f0
$11:bec3  bf df c3 fd   lda $fdc3df,x
$11:bec7  54 aa 93      mvn $93,$aa
$11:beca  d3 fd         cmp ($fd,s),y
$11:becc  ff de d0 8b   sbc $8bd0de,x
$11:bed0  20 4d 1d      jsr $1d4d
$11:bed3  59 7d 35      eor $357d,y
$11:bed6  55 5c         eor $5c,x
$11:bed8  0f fc d2 56   ora $56d2fc
$11:bedc  67 18         adc [$18]
$11:bede  7f e1 c7 21   adc $21c7e1,x
$11:bee2  52 84         eor ($84)
$11:bee4  3b            tsc
$11:bee5  e2 79         sep #$79
$11:bee7  2c cb 88      bit $88cb
$11:beea  4f 47 0a f8   eor $f80a47
$11:beee  ac 41 14      ldy $1441
$11:bef1  2e 30 b3      rol $b330
$11:bef4  c0 bf         cpy #$bf
$11:bef6  d9 af ee      cmp $eeaf,y
$11:bef9  67 f7         adc [$f7]
$11:befb  9b            txy
$11:befc  db            stp
$11:befd  e5 f9         sbc $f9
$11:beff  fc a7 18      jsr ($18a7,x)
$11:bf02  27 83         and [$83]
$11:bf04  31 00         and ($00),y
$11:bf06  80 c0         bra $bec8
$11:bf08  20 50 08      jsr $0850
$11:bf0b  24 02         bit $02
$11:bf0d  91 00         sta ($00),y
$11:bf0f  98            tya
$11:bf10  27 85         and [$85]
$11:bf12  c6 13         dec $13
$11:bf14  19 0f c7      ora $c70f,y
$11:bf17  c3 ff         cmp $ff,s
$11:bf19  f7 7f         sbc [$7f],y
$11:bf1b  f5 fb         sbc $fb,x
$11:bf1d  fd 37 fd      sbc $fd37,x
$11:bf20  74 09         stz $09,x
$11:bf22  e1 e7         sbc ($e7,x)
$11:bf24  40            rti
$11:bf25  21 c9         and ($c9,x)
$11:bf27  e1 4f         sbc ($4f,x)
$11:bf29  05 01         ora $01
$11:bf2b  88            dey
$11:bf2c  6e 30 f1      ror $f130
$11:bf2f  e8            inx
$11:bf30  7e 79 1f      ror $1f79,x
$11:bf33  fe 37 bf      inc $bf37,x
$11:bf36  8d ff eb      sta $ebff
$11:bf39  5b            tcd
$11:bf3a  22 9e 18 e4   jsl $e4189e
$11:bf3e  02 18         cop #$18
$11:bf40  9e 19 03      stz $0319,x
$11:bf43  10 d3         bpl $bf18
$11:bf45  c1 cf         cmp ($cf,x)
$11:bf47  de ff f3      dec $f3ff,x
$11:bf4a  bf ff bf fe   lda $febfff,x
$11:bf4e  ec f5 0d      cpx $0df5
$11:bf51  7f 77 7f dd   adc $dd7f77,x
$11:bf55  78            sei
$11:bf56  86 05         stx $05
$11:bf58  fe 3f 7f      inc $7f3f,x
$11:bf5b  bd d8 0a      lda $0ad8,x
$11:bf5e  38            sec
$11:bf5f  50 49         bvc $bfaa
$11:bf61  e9 2b         sbc #$2b
$11:bf63  9d 49 60      sta $6049,x
$11:bf66  b8            clv
$11:bf67  3e 13 8f      rol $8f13,x
$11:bf6a  07 e3         ora [$e3]
$11:bf6c  cf df f7 ff   cmp $fff7df
$11:bf70  ef fe 08 1c   sbc $1c08fe
$11:bf74  00 3e         brk #$3e
$11:bf76  01 30         ora ($30,x)
$11:bf78  9b            txy
$11:bf79  cc 24 ee      cpy $ee24
$11:bf7c  71 90         adc ($90),y
$11:bf7e  0a            asl a
$11:bf7f  c7 1f         cmp [$1f]
$11:bf81  8e b7 ff      stx $ffb7
$11:bf84  34 ff         bit $ff,x
$11:bf86  ed df 7f      sbc $7fdf
$11:bf89  53 f8         eor ($f8,s),y
$11:bf8b  fc e4 3f      jsr ($3fe4,x)
$11:bf8e  9f 4c c6 52   sta $52c64c,x
$11:bf92  ed 06 82      sbc $8206
$11:bf95  41 34         eor ($34,x)
$11:bf97  da            phx
$11:bf98  6c ce 67      jmp ($67ce)
$11:bf9b  5d a8 cb      eor $cba8,x
$11:bf9e  64 3e         stz $3e
$11:bfa0  7f 0f 9e 42   adc $429e0f,x
$11:bfa4  e7 f1         sbc [$f1]
$11:bfa6  bf ff 6d 7e   lda $7e6dff,x
$11:bfaa  df 7c a6 5f   cmp $5fa67c,x
$11:bfae  05 93         ora $93
$11:bfb0  c3 76         cmp $76,s
$11:bfb2  fc bb de      jsr ($debb,x)
$11:bfb5  9e fb 71      stz $71fb,x
$11:bfb8  30 05         bmi $bfbf
$11:bfba  66 93         ror $93
$11:bfbc  39 94 f5      and $f594,y
$11:bfbf  60            rts
$11:bfc0  a6 70         ldx $70
$11:bfc2  81 c0         sta ($c0,x)
$11:bfc4  e4 72         cpx $72
$11:bfc6  3c cd dc      bit $dccd,x
$11:bfc9  df 8b 51 40   cmp $40518b,x
$11:bfcd  5c 02 3b 80   jml $803b02
$11:bfd1  9f f0 67 de   sta $de67f0,x
$11:bfd5  68            pla
$11:bfd6  cf 9e 31 e5   cmp $e5319e
$11:bfda  8d a5 c3      sta $c3a5
$11:bfdd  8b            phb
$11:bfde  03 49         ora $49,s
$11:bfe0  05 fe         ora $fe
$11:bfe2  00 a1         brk #$a1
$11:bfe4  09 cc         ora #$cc
$11:bfe6  1a            inc a
$11:bfe7  71 07         adc ($07),y
$11:bfe9  53 a4         eor ($a4,s),y
$11:bfeb  03 77         ora $77,s
$11:bfed  01 fe         ora ($fe,x)
$11:bfef  60            rts
$11:bff0  ef 96 7c c2   sbc $c27c96
$11:bff4  5c 34 fd 84   jml $84fd34
$11:bff8  b8            clv
$11:bff9  68            pla
$11:bffa  f8            sed
$11:bffb  0b            phd
$11:bffc  20 ff 40      jsr $40ff
$11:bfff  18            clc
$11:c000  21 9c         and ($9c,x)
$11:c002  b0 47         bcs $c04b
$11:c004  3c 0c 74      bit $740c,x
$11:c007  50 84         bvc $bf8d
$11:c009  2b            pld
$11:c00a  eb            xba
$11:c00b  d1 ef         cmp ($ef),y
$11:c00d  5a            phy
$11:c00e  3f f8 a5 08   and $08a5f8,x
$11:c012  08            php
$11:c013  87 fe         sta [$fe]
$11:c015  22 01 48 40   jsl $404801
$11:c019  28            plp
$11:c01a  12 08         ora ($08)
$11:c01c  43 80         eor $80,s
$11:c01e  5b            tcd
$11:c01f  64 22         stz $22
$11:c021  18            clc
$11:c022  0e de 4f      asl $4fde
$11:c025  47 8b         eor [$8b]
$11:c027  d1 f6         cmp ($f6),y
$11:c029  fb            xce
$11:c02a  7f 3c 3e 1f   adc $1f3e3c,x
$11:c02e  ff f9 ff e1   sbc $e1fff9,x
$11:c032  ff c8 04 32   sbc $3204c8,x
$11:c036  91 0c         sta ($0c),y
$11:c038  d4 43         pei ($43)
$11:c03a  21 00         and ($00,x)
$11:c03c  50 fe         bvc $c03c
$11:c03e  7c 3e 10      jmp ($103e,x)
$11:c041  c8            iny
$11:c042  07 c3         ora [$c3]
$11:c044  01 80         ora ($80,x)
$11:c046  e0 f0         cpx #$f0
$11:c048  7c 7e 3f      jmp ($3f7e,x)
$11:c04b  bf df df ff   lda $ffdfdf,x
$11:c04f  e3 ff         sbc $ff,s
$11:c051  f0 6e         beq $c0c1
$11:c053  f0 ff         beq $c054
$11:c055  e0 2f         cpx #$2f
$11:c057  fc 09 ff      jsr ($ff09,x)
$11:c05a  82 3f f0      brl $b09c
$11:c05d  87 88         sta [$88]
$11:c05f  c0 42         cpy #$42
$11:c061  01 f0         ora ($f0,x)
$11:c063  76 86         ror $86,x
$11:c065  03 ff         ora $ff,s
$11:c067  c1 ff         cmp ($ff,x)
$11:c069  78            sei
$11:c06a  ff 9f 7f c7   sbc $c77f9f,x
$11:c06e  bf c1 c7 e0   lda $e0c7c1,x
$11:c072  60            rts
$11:c073  f0 10         beq $c085
$11:c075  18            clc
$11:c076  00 7f         brk #$7f
$11:c078  a8            tay
$11:c079  5b            tcd
$11:c07a  d7 68         cmp [$68],y
$11:c07c  4f 38 73 ce   eor $ce7338
$11:c080  dc 91 ba      jml [$ba91]
$11:c083  31 8f         and ($8f),y
$11:c085  39 4c 37      and $374c,y
$11:c088  b4 26         ldy $26,x
$11:c08a  e8            inx
$11:c08b  70 cc         bvs $c059
$11:c08d  41 18         eor ($18,x)
$11:c08f  2a            rol a
$11:c090  01 9c         ora ($9c,x)
$11:c092  64 86         stz $86
$11:c094  30 cb         bmi $c061
$11:c096  c2 31         rep #$31
$11:c098  d3 09         cmp ($09,s),y
$11:c09a  e7 02         sbc [$02]
$11:c09c  fd 80 39      sbc $3980,x
$11:c09f  85 bb         sta $bb
$11:c0a1  21 12         and ($12,x)
$11:c0a3  f1 61         sbc ($61),y
$11:c0a5  a0 5f ff      ldy #$ff5f
$11:c0a8  db            stp
$11:c0a9  6c 50 32      jmp ($3250)
$11:c0ac  e6 2b         inc $2b
$11:c0ae  32 48         and ($48)
$11:c0b0  b3 29         lda ($29,s),y
$11:c0b2  71 ff         adc ($ff),y
$11:c0b4  c8            iny
$11:c0b5  b3 28         lda ($28,s),y
$11:c0b7  12 4f         ora ($4f)
$11:c0b9  0e 65 3c      asl $3c65
$11:c0bc  09 e3 ff      ora #$ffe3
$11:c0bf  ea            nop
$11:c0c0  aa            tax
$11:c0c1  aa            tax
$11:c0c2  f4 43 ba      pea $ba43
$11:c0c5  f9 d6 08      sbc $08d6,y
$11:c0c8  ce 66 38      dec $3866
$11:c0cb  b6 0d         ldx $0d,y
$11:c0cd  5e cb f6      lsr $f6cb,x
$11:c0d0  ff f7 fd f9   sbc $f9fdf7,x
$11:c0d4  fd fd 7b      sbc $7bfd,x
$11:c0d7  7f 5f ff fb   adc $fbff5f,x
$11:c0db  a7 f2         lda [$f2]
$11:c0dd  f9 fc 8a      sbc $8afc,y
$11:c0e0  fd 65 e1      sbc $e165,x
$11:c0e3  f0 f0         beq $c0d5
$11:c0e5  78            sei
$11:c0e6  38            sec
$11:c0e7  f4 7a 3f      pea $3f7a
$11:c0ea  1f f1 78 bc   ora $bc78f1,x
$11:c0ee  7e 30 38      ror $3830,x
$11:c0f1  79 3c 9f      adc $9f3c,y
$11:c0f4  cd e5 f3      cmp $f3e5
$11:c0f7  f9 ff fc      sbc $fcff,y
$11:c0fa  ff 3e 9f 8f   sbc $8f9f3e,x
$11:c0fe  c5 e3         cmp $e3
$11:c100  71 7c         adc ($7c),y
$11:c102  da            phx
$11:c103  7f e6 7b bd   adc $bd7be6,x
$11:c107  c4 6e         cpy $6e
$11:c109  30 22         bmi $c12d
$11:c10b  09 9c c2      ora #$c29c
$11:c10e  6e 26 11      ror $1126
$11:c111  28            plp
$11:c112  0b            phd
$11:c113  03 1f         ora $1f,s
$11:c115  0b            phd
$11:c116  c7 e2         cmp [$e2]
$11:c118  cf e1 8c f9   cmp $f98ce1
$11:c11c  ff 3a 1f cf   sbc $cf1f3a,x
$11:c120  c7 13         cmp [$13]
$11:c122  f1 80         sbc ($80),y
$11:c124  a3 5c         lda $5c,s
$11:c126  20 1f 0c      jsr $0c1f
$11:c129  01 08         ora ($08,x)
$11:c12b  ba            tsx
$11:c12c  7d 0f df      adc $df0f,x
$11:c12f  e3 87         sbc $87,s
$11:c131  c0 9c c0      cpy #$c09c
$11:c134  2b            pld
$11:c135  fd 92 78      sbc $7892,x
$11:c138  f6 bf         inc $bf,x
$11:c13a  f7 cb         sbc [$cb],y
$11:c13c  5c 6a b7 6a   jml $6ab76a
$11:c140  bd c2 ae      lda $aec2,x
$11:c143  75 2b         adc $2b,x
$11:c145  4d 24 be      eor $be24
$11:c148  16 ba         asl $ba,x
$11:c14a  5d de ef      eor $efde,x
$11:c14d  87 81         sta [$81]
$11:c14f  f1 e8         sbc ($e8),y
$11:c151  66 70         ror $70
$11:c153  ef d4 f3 f9   sbc $f9f3d4
$11:c157  f8            sed
$11:c158  86 40         stx $40
$11:c15a  e2 16         sep #$16
$11:c15c  ff fd e3 ff   sbc $ffe3fd,x
$11:c160  7f 51 07 df   adc $df0751,x
$11:c164  33 77         and ($77,s),y
$11:c166  ff e7 ed f0   sbc $f0ede7,x
$11:c16a  04 08         tsb $08
$11:c16c  21 00         and ($00,x)
$11:c16e  44 11 98      mvp $98,$11
$11:c171  c9 bc 17      cmp #$17bc
$11:c174  66 84         ror $84
$11:c176  15 e8         ora $e8,x
$11:c178  46 17         lsr $17
$11:c17a  82 7d 03      brl $c4fa
$11:c17d  e8            inx
$11:c17e  af 4d 0a 59   lda $590a4d
$11:c182  9c ca 34      stz $34ca
$11:c185  bf 3f 98 44   lda $44983f,x
$11:c189  25 62         and $62
$11:c18b  1f 6f fc 7b   ora $7bfc6f,x
$11:c18f  ff fe 4d 27   sbc $274dfe,x
$11:c193  e7 ed         sbc [$ed]
$11:c195  00 60         brk #$60
$11:c197  82 14 b3      brl $74ae
$11:c19a  19 85 78      ora $7885,y
$11:c19d  23 87         and $87,s
$11:c19f  f1 a8         sbc ($a8),y
$11:c1a1  ef e2 31 ed   sbc $ed31e2
$11:c1a5  41 c4         eor ($c4,x)
$11:c1a7  34 c1         bit $c1,x
$11:c1a9  a6 6d         ldx $6d
$11:c1ab  41 ff         eor ($ff,x)
$11:c1ad  b8            clv
$11:c1ae  a4 0a         ldy $0a
$11:c1b0  1f 58 df c6   ora $c6df58,x
$11:c1b4  23 f1         and $f1,s
$11:c1b6  79 83 d0      adc $d083,y
$11:c1b9  1f 04 fd 3f   ora $3ffd04,x
$11:c1bd  f8            sed
$11:c1be  0a            asl a
$11:c1bf  5a            phy
$11:c1c0  ee d8 57      inc $57d8
$11:c1c3  1d 38 c9      ora $c938,x
$11:c1c6  ee cf 76      inc $76cf
$11:c1c9  01 d0         ora ($d0,x)
$11:c1cb  0c 94 42      tsb $4294
$11:c1ce  a1 19         lda ($19,x)
$11:c1d0  e7 ff         sbc [$ff]
$11:c1d2  86 54         stx $54
$11:c1d4  1b            tcs
$11:c1d5  f1 68         sbc ($68),y
$11:c1d7  4a            lsr a
$11:c1d8  07 00         ora [$00]
$11:c1da  e1 cf         sbc ($cf,x)
$11:c1dc  12 81         ora ($81)
$11:c1de  24 50         bit $50
$11:c1e0  89 a4 ac      bit #$aca4
$11:c1e3  c7 02         cmp [$02]
$11:c1e5  cc 9d 47      cpy $479d
$11:c1e8  ff 22 cc a5   sbc $a5cc22,x
$11:c1ec  05 34         ora $34
$11:c1ee  09 91 55      ora #$5591
$11:c1f1  02 a8         cop #$a8
$11:c1f3  d3 e3         cmp ($e3,s),y
$11:c1f5  aa            tax
$11:c1f6  aa            tax
$11:c1f7  a3 d1         lda $d1,s
$11:c1f9  10 9e         bpl $c199
$11:c1fb  f2 fa         sbc ($fa)
$11:c1fd  14 0d         trb $0d
$11:c1ff  20 54 9d      jsr $9d54
$11:c202  b2 21         lda ($21)
$11:c204  12 c4         ora ($c4)
$11:c206  96 05         stx $05,y
$11:c208  a9 a3 d9      lda #$d9a3
$11:c20b  1e eb 92      asl $92eb,x
$11:c20e  bf f5 5a 64   lda $645af5,x
$11:c212  d5 24         cmp $24,x
$11:c214  fc 13 d2      jsr ($d213,x)
$11:c217  7f 3c 9f ca   adc $ca9f3c,x
$11:c21b  af f5 f6 a0   lda $a0f6f5
$11:c21f  7f 37 9f 9d   adc $9d9f37,x
$11:c223  f7 6f         sbc [$6f],y
$11:c225  5b            tcd
$11:c226  ff e4 ff 3f   sbc $3fffe4,x
$11:c22a  9e af 57      stz $57af,x
$11:c22d  63 b1         adc $b1,s
$11:c22f  78            sei
$11:c230  bc 62 f1      ldy $f162,x
$11:c233  00 80         brk #$80
$11:c235  c4 e2         cpy $e2
$11:c237  79 3c 9f      adc $9f3c,y
$11:c23a  fd 43 ff      sbc $ff43,x
$11:c23d  dc f9 f4      jml [$f4f9]
$11:c240  fe 3e 1f      inc $1f3e,x
$11:c243  ff c2 7f 30   sbc $307fc2,x
$11:c247  ff c6 3c f8   sbc $f83cc6,x
$11:c24b  7a            ply
$11:c24c  05 03         ora $03
$11:c24e  81 c0         sta ($c0,x)
$11:c250  86 40         stx $40
$11:c252  25 d2         and $d2
$11:c254  09 84 c3      ora #$c384
$11:c257  e1 30         sbc ($30,x)
$11:c259  80 40         bra $c29b
$11:c25b  33 18         and ($18,s),y
$11:c25d  0c 1c 07      tsb $071c
$11:c260  05 83         ora $83
$11:c262  e3 e1         sbc $e1,s
$11:c264  f5 d5         sbc $d5,x
$11:c266  de b6 f7      dec $f7b6,x
$11:c269  d1 dc         cmp ($dc),y
$11:c26b  fb            xce
$11:c26c  fa            plx
$11:c26d  f0 98         beq $c207
$11:c26f  7b            tdc
$11:c270  e4 03         cpx $03
$11:c272  fd 82 dd      sbc $dd82,x
$11:c275  60            rts
$11:c276  85 61         sta $61
$11:c278  80 c0         bra $c23a
$11:c27a  70 f8         bvs $c274
$11:c27c  1a            inc a
$11:c27d  0d 07 f3      ora $f307
$11:c280  09 b3 e1      ora #$e1b3
$11:c283  64 ef         stz $ef
$11:c285  d7 3f         cmp [$3f],y
$11:c287  f7 ae         sbc [$ae],y
$11:c289  ad ff da      lda $daff
$11:c28c  71 69         adc ($69),y
$11:c28e  98            tya
$11:c28f  fc 26 36      jsr ($3626,x)
$11:c292  11 8f         ora ($8f),y
$11:c294  c1 c4         cmp ($c4,x)
$11:c296  e2 77         sep #$77
$11:c298  3b            tsc
$11:c299  9d 0e 87      sta $870e,x
$11:c29c  87 c3         sta [$c3]
$11:c29e  cd e0 ff      cmp $ffe0
$11:c2a1  7c 3d ee      jmp ($ee3d,x)
$11:c2a4  17 99         ora [$99],y
$11:c2a6  bb            tyx
$11:c2a7  fe 6e f9      inc $f96e,x
$11:c2aa  fc fc 43      jsr ($43fc,x)
$11:c2ad  20 75 0b      jsr $0b75
$11:c2b0  7f fe f0 f5   adc $f5f0fe,x
$11:c2b4  04 ba         tsb $ba
$11:c2b6  67 ed         adc [$ed]
$11:c2b8  f0 04         beq $c2be
$11:c2ba  28            plp
$11:c2bb  0a            asl a
$11:c2bc  c2 31         rep #$31
$11:c2be  18            clc
$11:c2bf  8c c6 4d      sty $4dc6
$11:c2c2  e0 6f 03      cpx #$036f
$11:c2c5  f0 22         beq $c2e9
$11:c2c7  05 da         ora $da
$11:c2c9  1f f8 c1 f9   ora $f9c1f8,x
$11:c2cd  0f c4 e9 14   ora $14e9c4
$11:c2d1  49 66 55      eor #$5566
$11:c2d4  a0 72 0b      ldy #$0b72
$11:c2d7  ff e7 f3 08   sbc $08f3e7,x
$11:c2db  84 ad         sty $ad
$11:c2dd  43 ed         eor $ed,s
$11:c2df  ff 8f 7f ff   sbc $ff7f8f,x
$11:c2e3  c7 e4         cmp [$e4]
$11:c2e5  fc fd a0      jsr ($a0fd,x)
$11:c2e8  0c 50 44      tsb $4450
$11:c2eb  96 63         stx $63,y
$11:c2ed  31 8f         and ($8f),y
$11:c2ef  04 03         tsb $03
$11:c2f1  3c 31 fa      bit $fa31,x
$11:c2f4  fe fe 3f      inc $3ffe,x
$11:c2f7  f1 d8         sbc ($d8),y
$11:c2f9  ff fe 0f c5   sbc $c50ffe,x
$11:c2fd  8f 6f 93 92   sta $92936f
$11:c301  22 31 1f 8b   jsl $8b1f31
$11:c305  c0 7e bf      cpy #$bf7e
$11:c308  b8            clv
$11:c309  8c 7f f7      sty $f77f
$11:c30c  1f ff be 81   ora $81beff,x
$11:c310  fa            plx
$11:c311  1f 17 f9 01   ora $01f917,x
$11:c315  23 ff         and $ff,s
$11:c317  33 ff         and ($ff,s),y
$11:c319  f3 01         sbc ($01,s),y
$11:c31b  f5 33         sbc $33,x
$11:c31d  e6 07         inc $07
$11:c31f  80 3f         bra $c360
$11:c321  7e ee 66      ror $66ee,x
$11:c324  ec 5f 4a      cpx $4a5f
$11:c327  61 20         adc ($20,x)
$11:c329  5f fe 65 fc   eor $fc65fe,x
$11:c32d  e5 f8         sbc $f8
$11:c32f  65 ff         adc $ff
$11:c331  1e 7f c2      asl $c27f,x
$11:c334  5f f0 e7 fc   eor $fce7f0,x
$11:c338  65 fe         adc $fe
$11:c33a  fe 20 7c      inc $7c20,x
$11:c33d  39 f3 09      and $09f3,y
$11:c340  ff 03 bf 20   sbc $20bf03,x
$11:c344  9f f0 4c a3   sta $a34cf0,x
$11:c348  c0 ee 48      cpy #$48ee
$11:c34b  df a2 fd 1a   cmp $1afda2,x
$11:c34f  af ff cf ff   lda $ffcfff
$11:c353  ac ff f3      ldy $f3ff
$11:c356  ab            plb
$11:c357  a1 aa         lda ($aa,x)
$11:c359  ea            nop
$11:c35a  8f e9 45 dd   sta $dd45e9
$11:c35e  52 76         eor ($76)
$11:c360  d0 8f         bne $c2f1
$11:c362  bc 33 e7      ldy $e733,x
$11:c365  ef ff f3 d2   sbc $d2f3ff
$11:c369  02 e0         cop #$e0
$11:c36b  0c 3f 9e      tsb $9e3f
$11:c36e  07 db         ora [$db]
$11:c370  8c ef 63      sty $63ef
$11:c373  17 e4         ora [$e4],y
$11:c375  48            pha
$11:c376  53 76         eor ($76,s),y
$11:c378  4a            lsr a
$11:c379  10 87         bpl $c302
$11:c37b  7c 63 df      jmp ($df63,x)
$11:c37e  99 ff f2      sta $f2ff,y
$11:c381  ce bd 0f      dec $0fbd
$11:c384  38            sec
$11:c385  fc 22 7e      jsr ($7e22,x)
$11:c388  c8            iny
$11:c389  77 c2         adc [$c2],y
$11:c38b  1f f0 83 fc   ora $fc83f0,x
$11:c38f  29 fb 08      and #$08fb
$11:c392  6a            ror a
$11:c393  d0 4d         bne $c3e2
$11:c395  e8            inx
$11:c396  bf 83 a8 57   lda $57a883,x
$11:c39a  7c f7 de      jmp ($def7,x)
$11:c39d  dd fb 7b      cmp $7bfb,x
$11:c3a0  bd bf 7f      lda $7fbf,x
$11:c3a3  ec d7 ee      cpx $eed7
$11:c3a6  1f ff 02 3f   ora $3f02ff,x
$11:c3aa  a8            tay
$11:c3ab  c7 9e         cmp [$9e]
$11:c3ad  48            pha
$11:c3ae  dc 0a 5f      jml [$5f0a]
$11:c3b1  fe db ff      inc $ffdb,x
$11:c3b4  bd ff eb      lda $ebff,x
$11:c3b7  df 7a af ee   cmp $eeaf7a,x
$11:c3bb  6d 7f 85      adc $857f
$11:c3be  f7 e1         sbc [$e1],y
$11:c3c0  7c be 5f      jmp ($5fbe,x)
$11:c3c3  b7 db         lda [$db],y
$11:c3c5  fb            xce
$11:c3c6  fd f4 ba      sbc $baf4,x
$11:c3c9  5d 9e 8f      eor $8f9e,x
$11:c3cc  cb            wai
$11:c3cd  e5 eb         sbc $eb
$11:c3cf  f5 80         sbc $80,x
$11:c3d1  c3 c6         cmp $c6,s
$11:c3d3  dc 0e a4      jml [$a40e]
$11:c3d6  fe 55 3f      inc $3f55,x
$11:c3d9  9f 63 f1 9f   sta $9ff163,x
$11:c3dd  fe 3f f7      inc $f73f,x
$11:c3e0  89 7b a0      bit #$a07b
$11:c3e3  47 20         eor [$20]
$11:c3e5  11 48         ora ($48),y
$11:c3e7  a7 2a         lda [$2a]
$11:c3e9  15 c6         ora $c6,x
$11:c3eb  83 7d         sta $7d,s
$11:c3ed  30 9c         bmi $c38b
$11:c3ef  71 4a         adc ($4a),y
$11:c3f1  73 35         adc ($35,s),y
$11:c3f3  fd bc bf      sbc $bfbc,x
$11:c3f6  fb            xce
$11:c3f7  41 51         eor ($51,x)
$11:c3f9  d0 f0         bne $c3eb
$11:c3fb  34 57         bit $57,x
$11:c3fd  3d 54 fe      and $fe54,x
$11:c400  b3 8c         lda ($8c,s),y
$11:c402  da            phx
$11:c403  61 30         adc ($30,x)
$11:c405  78            sei
$11:c406  3c 06 02      bit $0206,x
$11:c409  1d 00 cf      ora $cf00,x
$11:c40c  60            rts
$11:c40d  25 92         and $92
$11:c40f  0f 07 83 c7   ora $c78307
$11:c413  e3 e3         sbc $e3,s
$11:c415  73 75         adc ($75,s),y
$11:c417  dd dc b7      cmp $b7dc,x
$11:c41a  f7 55         sbc [$55],y
$11:c41c  59 df f4      eor $f4df,y
$11:c41f  3e b2 2d      rol $2db2,x
$11:c422  7c 43 f5      jmp ($f543,x)
$11:c425  01 db         ora ($db,x)
$11:c427  e1 cc         sbc ($cc,x)
$11:c429  05 0f         ora $0f
$11:c42b  87 e7         sta [$e7]
$11:c42d  f3 f3         sbc ($f3,s),y
$11:c42f  f9 fb 20      sbc $20fb,y
$11:c432  a0 0a f0      ldy #$f00a
$11:c435  ff df 8e 63   sbc $638edf,x
$11:c439  7f bf ff fc   adc $fcffbf,x
$11:c43d  ff fe dd 9f   sbc $9fddfe,x
$11:c441  cc 6e 18      cpy $186e
$11:c444  06 66         asl $66
$11:c446  31 bd         and ($bd),y
$11:c448  9e 6f 27      stz $276f,x
$11:c44b  92 49         sta ($49)
$11:c44d  24 62         bit $62
$11:c44f  00 8a         brk #$8a
$11:c451  18            clc
$11:c452  07 0e         ora [$0e]
$11:c454  07 f7         ora [$f7]
$11:c456  83 ed         sta $ed,s
$11:c458  e8            inx
$11:c459  fd 79 3a      sbc $3a79,x
$11:c45c  54 32 f6      mvn $f6,$32
$11:c45f  74 d8         stz $d8,x
$11:c461  38            sec
$11:c462  02 79         cop #$79
$11:c464  00 45         brk #$45
$11:c466  82 8e 39      brl $fdf7
$11:c469  73 0d         adc ($0d,s),y
$11:c46b  45 1f         eor $1f
$11:c46d  9f 1f 9f ed   sta $ed9f1f,x
$11:c471  e7 f7         sbc [$f7]
$11:c473  79 fd e2      adc $e2fd,y
$11:c476  7d 7f fc      adc $fc7f,x
$11:c479  c1 e0         cmp ($e0,x)
$11:c47b  ff f8 ff fc   sbc $fcfff8,x
$11:c47f  d4 17         pei ($17)
$11:c481  83 68         sta $68,s
$11:c483  7e 19 05      ror $0519,x
$11:c486  78            sei
$11:c487  fc 75 e1      jsr ($e175,x)
$11:c48a  f1 3f         sbc ($3f),y
$11:c48c  3f c7 f5 fd   and $fdf5c7,x
$11:c490  f6 7f         inc $7f,x
$11:c492  9a            txs
$11:c493  c1 1c         cmp ($1c,x)
$11:c495  6c 86 f7      jmp ($f786)
$11:c498  81 e2         sta ($e2,x)
$11:c49a  fe fe 3f      inc $3ffe,x
$11:c49d  ff cf fc 78   sbc $78fccf,x
$11:c4a1  da            phx
$11:c4a2  11 f7         ora ($f7),y
$11:c4a4  41 47         eor ($47,x)
$11:c4a6  a3 f0         lda $f0,s
$11:c4a8  88            dey
$11:c4a9  c5 3b         cmp $3b
$11:c4ab  7b            tdc
$11:c4ac  af bf 4b ff   lda $ff4bbf
$11:c4b0  f8            sed
$11:c4b1  7f 3e 4f b7   adc $b74f3e,x
$11:c4b5  1d ce c7      ora $c7ce,x
$11:c4b8  23 de         and $de,s
$11:c4ba  ff bf 3f e7   sbc $e73fbf,x
$11:c4be  8f f8 c3 fe   sta $fec3f8
$11:c4c2  11 ff         ora ($ff),y
$11:c4c4  c4 ff         cpy $ff
$11:c4c6  f9 67 ff      sbc $ff67,y
$11:c4c9  7f fc f5 5f   adc $5ff5fc,x
$11:c4cd  f5 5f         sbc $5f,x
$11:c4cf  f9 57 fd      sbc $fd57,y
$11:c4d2  d7 ff         cmp [$ff],y
$11:c4d4  95 ff         sta $ff,x
$11:c4d6  1d ff 99      ora $99ff,x
$11:c4d9  7f d9 ff f9   adc $f9ffd9,x
$11:c4dd  87 00         sta [$00]
$11:c4df  38            sec
$11:c4e0  04 0f         tsb $0f
$11:c4e2  f9 0c f9      sbc $f90c,y
$11:c4e5  88            dey
$11:c4e6  ca            dex
$11:c4e7  67 cc         adc [$cc]
$11:c4e9  e6 4c         inc $4c
$11:c4eb  fa            plx
$11:c4ec  b7 fe         lda [$fe],y
$11:c4ee  ae fe 6b      ldx $6bfe
$11:c4f1  df ea eb e7   cmp $e7ebea,x
$11:c4f5  be 7e 6e      ldx $6e7e,y
$11:c4f8  ee 67 ed      inc $ed67
$11:c4fb  e6 ee         inc $ee
$11:c4fd  83 e4         sta $e4,s
$11:c4ff  3f ad 9d ba   and $ba9dad,x
$11:c503  59 db c5      eor $c5db,y
$11:c506  fd b2 9e      sbc $9eb2,x
$11:c509  39 1f 1a      and $1a1f,y
$11:c50c  89 83 81      bit #$8183
$11:c50f  e1 b8         sbc ($b8,x)
$11:c511  9a            txs
$11:c512  3c 05 ff      bit $ff05,x
$11:c515  c0 07 08      cpy #$0807
$11:c518  39 8c 70      and $708c,y
$11:c51b  e6 30         inc $30
$11:c51d  bc 61 e3      ldy $e361,x
$11:c520  1e 78 fd      asl $fd78,x
$11:c523  fa            plx
$11:c524  3b            tsc
$11:c525  7e 80 cf      ror $cf80,x
$11:c528  a7 30         lda [$30]
$11:c52a  69 e9 d8      adc #$d8e9
$11:c52d  63 b1         adc $b1,s
$11:c52f  e3 b8         sbc $b8,s
$11:c531  63 6e         adc $6e,s
$11:c533  67 f0         adc [$f0]
$11:c535  e1 df         sbc ($df,x)
$11:c537  fc e8 43      jsr ($43e8,x)
$11:c53a  ff a2 84 da   sbc $da84a2,x
$11:c53e  08            php
$11:c53f  f5 ff         sbc $ff,x
$11:c541  c2 3c         rep #$3c
$11:c543  e1 f2         sbc ($f2,x)
$11:c545  f3 a7         sbc ($a7,s),y
$11:c547  95 4d         sta $4d,x
$11:c549  30 0b         bmi $c556
$11:c54b  37 fe         and [$fe],y
$11:c54d  cd 99 5a      cmp $5a99
$11:c550  91 34         sta ($34),y
$11:c552  24 42         bit $42
$11:c554  00 0f         brk #$0f
$11:c556  8a            txa
$11:c557  e0 98 a4      cpx #$a498
$11:c55a  b4 2a         ldy $2a,x
$11:c55c  d6 95         dec $95,x
$11:c55e  6c 05 f0      jmp ($f005)
$11:c561  c4 5f         cpy $5f
$11:c563  f3 17         sbc ($17,s),y
$11:c565  f2 f8         sbc ($f8)
$11:c567  36 4a         rol $4a,x
$11:c569  cd 81 4d      cmp $4d81
$11:c56c  0a            asl a
$11:c56d  3c 87 eb      bit $eb87,x
$11:c570  0c fd cd      tsb $cdfd
$11:c573  3d f7 1e      and $1ef7,x
$11:c576  fd 4b fd      sbc $fd4b,x
$11:c579  55 fe         eor $fe,x
$11:c57b  56 bf         lsr $bf,x
$11:c57d  17 1e         ora [$1e],y
$11:c57f  85 cb         sta $cb
$11:c581  a1 ff         lda ($ff,x)
$11:c583  f8            sed
$11:c584  7e 38 1e      ror $1e38,x
$11:c587  0c 07 87      tsb $8707
$11:c58a  01 e3         ora ($e3,x)
$11:c58c  c0 79 f0      cpy #$f079
$11:c58f  1e f0 50      asl $50f0,x
$11:c592  cc 3b fa      cpy $fa3b
$11:c595  cd bd 5b      cmp $5bbd
$11:c598  37 aa         and [$aa],y
$11:c59a  a7 e4         lda [$e4]
$11:c59c  ac fc a9      ldy $a9fc
$11:c59f  ff 1a 67 ee   sbc $ee671a,x
$11:c5a3  85 ff         sta $ff
$11:c5a5  e1 f5         sbc ($f5,x)
$11:c5a7  f8            sed
$11:c5a8  1f 9e 03 f7   ora $f7039e,x
$11:c5ac  80 ff         bra $c5ad
$11:c5ae  c4 8b         cpy $8b
$11:c5b0  f8            sed
$11:c5b1  fb            xce
$11:c5b2  fb            xce
$11:c5b3  fb            xce
$11:c5b4  fd 7d fe      sbc $fe7d,x
$11:c5b7  2e f9 df      rol $dff9
$11:c5ba  93 ef         sta ($ef,s),y
$11:c5bc  eb            xba
$11:c5bd  fc f9 fe      jsr ($fef9,x)
$11:c5c0  6e f9 00      ror $00f9
$11:c5c3  87 c0         sta [$c0]
$11:c5c5  a7 b0         lda [$b0]
$11:c5c7  0b            phd
$11:c5c8  fb            xce
$11:c5c9  28            plp
$11:c5ca  19 41 02      ora $0241,y
$11:c5cd  fe 91 4a      inc $4a91,x
$11:c5d0  3f ef f3 fe   and $fef3ef,x
$11:c5d4  ff ff da fe   sbc $fedaff,x
$11:c5d8  f8            sed
$11:c5d9  60            rts
$11:c5da  05 21         ora $21
$11:c5dc  ff 15 42 01   sbc $014215,x
$11:c5e0  f0 e0         beq $c5c2
$11:c5e2  4f 27 1c 68   eor $681c27
$11:c5e6  f7 84         sbc [$84],y
$11:c5e8  92 1c         sta ($1c)
$11:c5ea  09 fc e3      ora #$e3fc
$11:c5ed  8e 65 01      stx $0165
$11:c5f0  bb            tyx
$11:c5f1  0d dc 90      ora $90dc
$11:c5f4  a4 76         ldy $76
$11:c5f6  2b            pld
$11:c5f7  b1 5d         lda ($5d),y
$11:c5f9  8c ec 67      sty $67ec
$11:c5fc  6c 8d 85      jmp ($858d)
$11:c5ff  5f 91 e8 02   eor $02e891,x
$11:c603  ff 32 f6 76   sbc $76f632,x
$11:c607  7e 46 20      ror $2046,x
$11:c60a  0d fc c1      ora $c1fc
$11:c60d  e1 eb         sbc ($eb,x)
$11:c60f  3f f8 bc fe   and $febcf8,x
$11:c613  57 2f         eor [$2f],y
$11:c615  c6 f3         dec $f3
$11:c617  e8            inx
$11:c618  34 f8         bit $f8,x
$11:c61a  f4 fe 5f      pea $5ffe
$11:c61d  2f bc 40 00   and $0040bc
$11:c621  01 c0         ora ($c0,x)
$11:c623  80 74         bra $c699
$11:c625  20 13 08      jsr $0813
$11:c628  06 c0         asl $c0
$11:c62a  04 7b         tsb $7b
$11:c62c  fd 9e bf      sbc $bf9e,x
$11:c62f  59 ab d5      eor $d5ab,y
$11:c632  ea            nop
$11:c633  b5 44         lda $44,x
$11:c635  d0 aa         bne $c5e1
$11:c637  86 0f         stx $0f
$11:c639  67 4c         adc [$4c]
$11:c63b  d6 54         dec $54,x
$11:c63d  f5 75         sbc $75,x
$11:c63f  4d 55 55      eor $5555
$11:c642  06 84         asl $84
$11:c644  d0 99         bne $c5df
$11:c646  7b            tdc
$11:c647  b9 5b a9      lda $a95b,y
$11:c64a  57 a8         eor [$a8],y
$11:c64c  2b            pld
$11:c64d  08            php
$11:c64e  10 85         bpl $c5d5
$11:c650  7d 65 5d      adc $5d65,x
$11:c653  51 2c         eor ($2c),y
$11:c655  00 03         brk #$03
$11:c657  07 41         ora [$41]
$11:c659  cd d8 73      cmp $73d8
$11:c65c  2b            pld
$11:c65d  07 42         ora [$42]
$11:c65f  04 f9         tsb $f9
$11:c661  81 73         sta ($73,x)
$11:c663  d8            cld
$11:c664  31 bc         and ($bc),y
$11:c666  a3 51         lda $51,s
$11:c668  d9 e4 06      cmp $06e4,y
$11:c66b  01 03         ora ($03,x)
$11:c66d  80 61         bra $c6d0
$11:c66f  c9 a1 e7      cmp #$e7a1
$11:c672  bf 9f cb fe   lda $fecb9f,x
$11:c676  84 0d         sty $0d
$11:c678  ff ff 87 ff   sbc $ff87ff,x
$11:c67c  45 89         eor $89
$11:c67e  25 27         and $27
$11:c680  9c 3a 16      stz $163a
$11:c683  f4 9a 12      pea $129a
$11:c686  4e d9 34      lsr $34d9
$11:c689  13 c8         ora ($c8,s),y
$11:c68b  8a            txa
$11:c68c  0c 0a 99      tsb $990a
$11:c68f  6c c4 a1      jmp ($a1c4)
$11:c692  b3 66         lda ($66,s),y
$11:c694  56 65         lsr $65,x
$11:c696  22 25 1e 64   jsl $641e25
$11:c69a  9a            txs
$11:c69b  2b            pld
$11:c69c  f0 61         beq $c6ff
$11:c69e  9a            txs
$11:c69f  bc 15 e3      ldy $e315,x
$11:c6a2  98            tya
$11:c6a3  b3 b3         lda ($b3,s),y
$11:c6a5  cb            wai
$11:c6a6  01 7f         ora ($7f,x)
$11:c6a8  c4 5f         cpy $5f
$11:c6aa  f3 17         sbc ($17,s),y
$11:c6ac  f6 a8         inc $a8,x
$11:c6ae  35 43         and $43,x
$11:c6b0  cf 00 6f 97   cmp $976f00
$11:c6b4  fe 31 e7      inc $e731,x
$11:c6b7  73 01         adc ($01,s),y
$11:c6b9  2c fe be      bit $befe
$11:c6bc  cf 67 ef d9   cmp $d9ef67
$11:c6c0  fc f5 7e      jsr ($7ef5,x)
$11:c6c3  bd 9d cd      lda $cd9d,x
$11:c6c6  b7 bb         lda [$bb],y
$11:c6c8  bf bf bf f0   lda $f0bfbf,x
$11:c6cc  33 74         and ($74,s),y
$11:c6ce  0c 3d 03      tsb $033d
$11:c6d1  07 40         ora [$40]
$11:c6d3  c2 80         rep #$80
$11:c6d5  87 03         sta [$03]
$11:c6d7  60            rts
$11:c6d8  6a            ror a
$11:c6d9  87 03         sta [$03]
$11:c6db  7f ab 9b ca   adc $ca9bab,x
$11:c6df  f9 f4 b9      sbc $b9f4,y
$11:c6e2  78            sei
$11:c6e3  4c 2d f0      jmp $f02d
$11:c6e6  bd ee df      lda $dfee,x
$11:c6e9  f7 fd         sbc [$fd],y
$11:c6eb  ff 40 fb 30   sbc $30fb40,x
$11:c6ef  2f 88 81 68   and $688188
$11:c6f3  30 68         bmi $c75d
$11:c6f5  08            php
$11:c6f6  74 3f         stz $3f,x
$11:c6f8  b5 0c         lda $0c,x
$11:c6fa  7c 46 4d      jmp ($4d46,x)
$11:c6fd  14 b2         trb $b2
$11:c6ff  65 ac         adc $ac
$11:c701  d9 2b 18      cmp $182b,y
$11:c704  dc 32 05      jml [$0532]
$11:c707  c3 ef         cmp $ef,s
$11:c709  c0 33 70      cpy #$7033
$11:c70c  08            php
$11:c70d  cc 02 38      cpy $3802
$11:c710  46 13         lsr $13
$11:c712  19 0f 43      ora $430f,y
$11:c715  a3 21         lda $21,s
$11:c717  f9 c0 ef      sbc $efc0,y
$11:c71a  94 c8         sty $c8,x
$11:c71c  04 02         tsb $02
$11:c71e  09 08 83      ora #$8308
$11:c721  42 60         wdm #$60
$11:c723  50 12         bvc $c737
$11:c725  59 11 c3      eor $c311,y
$11:c728  26 91         rol $91
$11:c72a  1e 19 5c      asl $5c19,x
$11:c72d  20 13 c8      jsr $c813
$11:c730  07 6f         ora [$6f]
$11:c732  cf a5 37 86   cmp $8637a5
$11:c736  66 79         ror $79
$11:c738  81 5f         sta ($5f,x)
$11:c73a  86 96         stx $96
$11:c73c  85 db         sta $db
$11:c73e  92 5f         sta ($5f)
$11:c740  b0 26         bcs $c768
$11:c742  b1 40         lda ($40),y
$11:c744  84 d2         sty $d2
$11:c746  fd 7e 4f      sbc $4f7e,x
$11:c749  05 6a         ora $6a
$11:c74b  b5 24         lda $24,x
$11:c74d  92 15         sta ($15)
$11:c74f  c1 60         cmp ($60,x)
$11:c751  11 0f         ora ($0f),y
$11:c753  7d fb cf      adc $cffb,x
$11:c756  f3 f5         sbc ($f5,s),y
$11:c758  f0 cd         beq $c727
$11:c75a  21 ff         and ($ff,x)
$11:c75c  aa            tax
$11:c75d  ea            nop
$11:c75e  96 00         stx $00,y
$11:c760  57 08         eor [$08],y
$11:c762  c4 42         cpy $42
$11:c764  31 18         and ($18),y
$11:c766  82 1b 05      brl $cc84
$11:c769  50 99         bvc $c704
$11:c76b  bb            tyx
$11:c76c  e7 56         sbc [$56]
$11:c76e  6d bd bf      adc $bfbd
$11:c771  77 67         adc [$67],y
$11:c773  db            stp
$11:c774  5b            tcd
$11:c775  b7 36         lda [$36],y
$11:c777  7d a5 af      adc $afa5,x
$11:c77a  74 e5         stz $e5,x
$11:c77c  85 70         sta $70
$11:c77e  84 2a         sty $2a
$11:c780  0d 82 8a      ora $8a82
$11:c783  d2 5a         cmp ($5a)
$11:c785  97 66         sta [$66],y
$11:c787  7d b9 5a      adc $5ab9,x
$11:c78a  1b            tcs
$11:c78b  54 18 74      mvn $74,$18
$11:c78e  c1 2f         cmp ($2f,x)
$11:c790  3f 6f b7 bd   and $bdb76f,x
$11:c794  5b            tcd
$11:c795  83 64         sta $64,s
$11:c797  1a            inc a
$11:c798  ec 97 0c      cpx $0c97
$11:c79b  0e 05 c7      asl $c705
$11:c79e  50 2f         bvc $c7cf
$11:c7a0  e7 f2         sbc [$f2]
$11:c7a2  01 e8         ora ($e8,x)
$11:c7a4  80 6c         bra $c812
$11:c7a6  02 43         cop #$43
$11:c7a8  f0 80         beq $c72a
$11:c7aa  f2 24         sbc ($24)
$11:c7ac  5f 1a 27 fb   eor $fb271a,x
$11:c7b0  ff fc ff fe   sbc $fefffc,x
$11:c7b4  3f ff 0f ff   and $ff0fff,x
$11:c7b8  83 ff         sta $ff,s
$11:c7ba  c0 ff e0      cpy #$e0ff
$11:c7bd  3f f8 1f f5   and $f51ff8,x
$11:c7c1  03 7f         ora $7f,s
$11:c7c3  a0 ef f4      ldy #$f4ef
$11:c7c6  3d fe 8f      and $8ffe,x
$11:c7c9  bf d3 f7 7a   lda $7af7d3,x
$11:c7cd  fe cf 6f      inc $6fcf,x
$11:c7d0  d9 f9 f5      cmp $f5f9,y
$11:c7d3  ff ff 3f ff   sbc $ff3fff,x
$11:c7d7  c7 ff         cmp [$ff]
$11:c7d9  f0 ff         beq $c7da
$11:c7db  fc 1f ff      jsr ($ff1f,x)
$11:c7de  03 ff         ora $ff,s
$11:c7e0  c0 45 81      cpy #$8145
$11:c7e3  7f e8 cb bf   adc $bfcbe8,x
$11:c7e7  e7 d0         sbc [$d0]
$11:c7e9  80 fe         bra $c7e9
$11:c7eb  e7 3c         sbc [$3c]
$11:c7ed  ba            tsx
$11:c7ee  09 5d 15      ora #$155d
$11:c7f1  05 7e         ora $7e
$11:c7f3  80 41         bra $c836
$11:c7f5  a0 0d e0      ldy #$e00d
$11:c7f8  33 a2         and ($a2,s),y
$11:c7fa  64 21         stz $21
$11:c7fc  1f 72 58 12   ora $125872,x
$11:c800  c2 87         rep #$87
$11:c802  bf 83 7e c9   lda $c97e83,x
$11:c806  61 02         adc ($02,x)
$11:c808  ff 9f ba f1   sbc $f1ba9f,x
$11:c80c  ff f3 7f fb   sbc $fb7ff3,x
$11:c810  7f bd 67 83   adc $8367bd,x
$11:c814  61 ef         adc ($ef,x)
$11:c816  a3 77         lda $77,s
$11:c818  e9 5d 9a      sbc #$9a5d
$11:c81b  a7 4f         lda [$4f]
$11:c81d  f1 f8         sbc ($f8),y
$11:c81f  f0 78         beq $c899
$11:c821  38            sec
$11:c822  9c 0c fe      stz $fe0c
$11:c825  03 33         ora $33,s
$11:c827  80 98         bra $c7c1
$11:c829  40            rti
$11:c82a  24 f0         bit $f0
$11:c82c  09 7c 02      ora #$027c
$11:c82f  19 ff c9      ora $c9ff,y
$11:c832  fc ed 16      jsr ($16ed,x)
$11:c835  7d 3c fe      adc $fe3c,x
$11:c838  91 98         sta ($98),y
$11:c83a  9b            txy
$11:c83b  fc 21 1e      jsr ($1e21,x)
$11:c83e  7b            tdc
$11:c83f  07 fc         ora [$fc]
$11:c841  1a            inc a
$11:c842  10 c8         bpl $c80c
$11:c844  06 62         asl $62
$11:c846  01 c0         ora ($c0,x)
$11:c848  77 04         adc [$04],y
$11:c84a  02 9f         cop #$9f
$11:c84c  00 cf         brk #$cf
$11:c84e  82 86 31      brl $f9d7
$11:c851  ff f0 ff a3   sbc $a3fff0,x
$11:c855  51 d9         eor ($d9),y
$11:c857  4f 3b 2b e6   eor $e62b3b
$11:c85b  a9 58 f1      lda #$f158
$11:c85e  53 3a         eor ($3a,s),y
$11:c860  56 4e         lsr $4e,x
$11:c862  3f 1f 83 c1   and $c1831f,x
$11:c866  fc 70 3b      jsr ($3b70,x)
$11:c869  8c 06 73      sty $7306
$11:c86c  01 ce         ora ($ce,x)
$11:c86e  40            rti
$11:c86f  3b            tsc
$11:c870  90 00         bcc $c872
$11:c872  88            dey
$11:c873  78            sei
$11:c874  2b            pld
$11:c875  f7 ce         sbc [$ce],y
$11:c877  67 ba         adc [$ba]
$11:c879  ad d7 bd      lda $bdd7
$11:c87c  f2 fd         sbc ($fd)
$11:c87e  ba            tsx
$11:c87f  5e 37 7c      lsr $7c37,x
$11:c882  42 1c         wdm #$1c
$11:c884  2e 06 ff      rol $ff06
$11:c887  8f bb e1 ef   sta $efe1bb
$11:c88b  7a            ply
$11:c88c  3a            dec a
$11:c88d  ec c5 df      cpx $dfc5
$11:c890  39 7b c0      and $c07b,y
$11:c893  5f c1 61 50   eor $5061c1,x
$11:c897  c7 c4         cmp [$c4]
$11:c899  24 f1         bit $f1
$11:c89b  4b            phk
$11:c89c  3e 5a cf      rol $cf5a,x
$11:c89f  97 0b         sta [$0b],y
$11:c8a1  2f fe 01 df   and $df01fe
$11:c8a5  80 66         bra $c90d
$11:c8a7  e0 11 96      cpx #$9611
$11:c8aa  70 09         bvs $c8b5
$11:c8ac  97 0b         sta [$0b],y
$11:c8ae  c4 c1         cpy $c1
$11:c8b0  40            rti
$11:c8b1  63 10         adc $10,s
$11:c8b3  99 c4 86      sta $86c4,y
$11:c8b6  61 31         adc ($31,x)
$11:c8b8  81 60         sta ($60,x)
$11:c8ba  60            rts
$11:c8bb  18            clc
$11:c8bc  69 26 63      adc #$6326
$11:c8bf  f7 f8         sbc [$f8],y
$11:c8c1  e3 ff         sbc $ff,s
$11:c8c3  30 7f         bmi $c944
$11:c8c5  ed 1f 7b      sbc $7b1f
$11:c8c8  67 ce         adc [$ce]
$11:c8ca  a3 df         lda $df,s
$11:c8cc  2f f3 9b f4   and $f49bf3
$11:c8d0  0f 47 21 a0   ora $a02147
$11:c8d4  e0 21 98      cpx #$9821
$11:c8d7  4c e4 43      jmp $43e4
$11:c8da  31 18         and ($18),y
$11:c8dc  a0 50 60      ldy #$6050
$11:c8df  10 1b         bpl $c8fc
$11:c8e1  14 97         trb $97
$11:c8e3  bf 1f f1 cf   lda $cff11f,x
$11:c8e7  f8            sed
$11:c8e8  37 fe         and [$fe],y
$11:c8ea  8d bf b3      sta $b3bf
$11:c8ed  67 d1         adc [$d1]
$11:c8ef  4f a3 df c8   eor $c8dfa3
$11:c8f3  77 e3         adc [$e3],y
$11:c8f5  ff ff ff 7f   sbc $7fffff,x
$11:c8f9  bf 1f bf 5f   lda $5fbf1f,x
$11:c8fd  8f a7 cd e6   sta $e6cda7
$11:c901  f7 37         sbc [$37],y
$11:c903  b9 bc 9e      lda $9ebc,y
$11:c906  ec de 3f      cpx $3fde
$11:c909  df cf db c1   cmp $c1dbcf,x
$11:c90d  de e0 7f      dec $7fe0,x
$11:c910  df e1 80 ff   cmp $ff80e1,x
$11:c914  82 c0 de      brl $a7d7
$11:c917  17 fb         ora [$fb],y
$11:c919  fc 7f bf      jsr ($bf7f,x)
$11:c91c  57 a3         eor [$a3],y
$11:c91e  f2 f6         sbc ($f6)
$11:c920  7b            tdc
$11:c921  79 de e7      adc $e7de,y
$11:c924  bb            tyx
$11:c925  cf ee a3 c7   cmp $c7a3ee
$11:c929  7f 9f b7 e1   adc $e1b79f,x
$11:c92d  ef 70 3f fc   sbc $fc3f70
$11:c931  0f fb 01 ff   ora $ff01fb
$11:c935  c0 7f db      cpy #$db7f
$11:c938  2f 77 df 5f   and $5fdf77
$11:c93c  f3 c7         sbc ($c7,s),y
$11:c93e  ed 7d bf      sbc $bf7d
$11:c941  6d 7f d3      adc $d37f
$11:c944  19 f6 d7      ora $d7f6,y
$11:c947  2e 43 43      rol $4343
$11:c94a  00 5f         brk #$5f
$11:c94c  80 e8         bra $c936
$11:c94e  34 6c         bit $6c,x
$11:c950  01 c1         ora ($c1,x)
$11:c952  b1 8f         lda ($8f),y
$11:c954  37 63         and [$63],y
$11:c956  e9 e8 fb      sbc #$fbe8
$11:c959  7a            ply
$11:c95a  36 88         rol $88,x
$11:c95c  5e f0 75      lsr $75f0,x
$11:c95f  39 1d 6e      and $6e1d,y
$11:c962  47 f3         eor [$f3]
$11:c964  81 ff         sta ($ff,x)
$11:c966  60            rts
$11:c967  0d fc 77      ora $77fc
$11:c96a  05 03         ora $03
$11:c96c  01 60         ora ($60,x)
$11:c96e  c8            iny
$11:c96f  48            pha
$11:c970  22 0e e0 82   jsl $82e00e
$11:c974  42 20         wdm #$20
$11:c976  d0 98         bne $c910
$11:c978  14 04         trb $04
$11:c97a  3e 13 c7      rol $c713,x
$11:c97d  70 f0         bvs $c96f
$11:c97f  e0 01 f0      cpx #$f001
$11:c982  02 83         cop #$83
$11:c984  b8            clv
$11:c985  00 21         brk #$21
$11:c987  a6 a4         ldx $a4
$11:c989  f9 6a 55      sbc $556a,y
$11:c98c  9b            txy
$11:c98d  36 c3         rol $c3,x
$11:c98f  9f 64 8c 61   sta $618c64,x
$11:c993  77 5c         adc [$5c],y
$11:c995  5d c7 07      eor $07c7,x
$11:c998  89 83 fe      bit #$fe83
$11:c99b  61 bf         adc ($bf,x)
$11:c99d  10 ef         bpl $c98e
$11:c99f  86 7e         stx $7e
$11:c9a1  c1 3f         cmp ($3f,x)
$11:c9a3  e0 6f 28      cpx #$286f
$11:c9a6  1f e8 06 ea   ora $ea06e8,x
$11:c9aa  01 6f         ora ($6f,x)
$11:c9ac  cf 69 e9 d9   cmp $d9e969
$11:c9b0  ab            plb
$11:c9b1  34 37         bit $37,x
$11:c9b3  e7 06         sbc [$06]
$11:c9b5  9c 60 6f      stz $6f60
$11:c9b8  b8            clv
$11:c9b9  39 e6 8e      and $8ee6,y
$11:c9bc  45 c1         eor $c1
$11:c9be  9f d8 63 f7   sta $f763d8,x
$11:c9c2  08            php
$11:c9c3  7f e6 0d fc   adc $fc0de6,x
$11:c9c7  81 cf         sta ($cf,x)
$11:c9c9  60            rts
$11:c9ca  57 e8         eor [$e8],y
$11:c9cc  05 72         ora $72
$11:c9ce  01 cb         ora ($cb,x)
$11:c9d0  a0 93 d3      ldy #$d393
$11:c9d3  93 43         sta ($43,s),y
$11:c9d5  d9 c2 70      cmp $70c2,y
$11:c9d8  30 3f         bmi $ca19
$11:c9da  ce 1e 7d      dec $7d1e
$11:c9dd  00 2f         brk #$2f
$11:c9df  b1 2c         lda ($2c),y
$11:c9e1  0d 25 c0      ora $c025
$11:c9e4  9f e2 26 e6   sta $e626e2,x
$11:c9e8  f0 a0         beq $c98a
$11:c9ea  09 c2 7f      ora #$7fc2
$11:c9ed  84 9d         sty $9d
$11:c9ef  f0 0e         beq $c9ff
$11:c9f1  82 9f 03      brl $cd93
$11:c9f4  fe 55 3a      inc $3a55,x
$11:c9f7  74 9e         stz $9e,x
$11:c9f9  dd 17 9f      cmp $9f17,x
$11:c9fc  32 f7         and ($f7)
$11:c9fe  cd 3d b4      cmp $b43d
$11:ca01  4e 6d 2b      lsr $2b6d
$11:ca04  b0 8f         bcs $c995
$11:ca06  09 74 02      ora #$0274
$11:ca09  49 00 98      eor #$9800
$11:ca0c  40            rti
$11:ca0d  23 10         and $10,s
$11:ca0f  08            php
$11:ca10  94 02         sty $02,x
$11:ca12  65 00         adc $00
$11:ca14  93 c0         sta ($c0,s),y
$11:ca16  13 e1         ora ($e1,s),y
$11:ca18  96 cf         stx $cf,y
$11:ca1a  cc 60 34      cpy $3460
$11:ca1d  d9 8f 37      cmp $378f,y
$11:ca20  63 5a         adc $5a,s
$11:ca22  ed ad c3      sbc $c3ad
$11:ca25  33 86         and ($86,s),y
$11:ca27  e4 f1         cpx $f1
$11:ca29  ac 10 01      ldy $0110
$11:ca2c  58            cli
$11:ca2d  0a            asl a
$11:ca2e  c0 da 0a      cpy #$0ada
$11:ca31  10 50         bpl $ca83
$11:ca33  85 fe         sta $fe
$11:ca35  01 3f         ora ($3f,x)
$11:ca37  80 4a         bra $ca83
$11:ca39  b9 73 2e      lda $2e73,y
$11:ca3c  dc 8b f7      jml [$f78b]
$11:ca3f  52 cd         eor ($cd)
$11:ca41  b5 41         lda $41,x
$11:ca43  9e 18 af      stz $af18,x
$11:ca46  5d 2a f7      eor $f72a,x
$11:ca49  74 80         stz $80,x
$11:ca4b  59 20 14      eor $1420,y
$11:ca4e  47 00         eor [$00]
$11:ca50  f9 20 0d      sbc $0d20,y
$11:ca53  f0 9a         beq $c9ef
$11:ca55  40            rti
$11:ca56  32 90         and ($90)
$11:ca58  0f bf 23 dd   ora $dd23bf
$11:ca5c  cd ee fe      cmp $feee
$11:ca5f  f3 5f         sbc ($5f,s),y
$11:ca61  6e bf b3      ror $b3bf
$11:ca64  59 db dc      eor $dcdb,y
$11:ca67  75 e2         adc $e2,x
$11:ca69  10 fc         bpl $ca67
$11:ca6b  05 ff         ora $ff
$11:ca6d  31 77         and ($77),y
$11:ca6f  c8            iny
$11:ca70  db            stp
$11:ca71  b0 77         bcs $caea
$11:ca73  dc 3d ef      jml [$ef3d]
$11:ca76  1f 77 cf db   ora $dbcf77,x
$11:ca7a  ff ff fc bd   sbc $bdfcff,x
$11:ca7e  9f af 27 fa   sta $fa27af,x
$11:ca82  41 e7         eor ($e7,x)
$11:ca84  70 f0         bvs $ca76
$11:ca86  b0 41         bcs $cac9
$11:ca88  e1 70         sbc ($70,x)
$11:ca8a  68            pla
$11:ca8b  4c 0a 02      jmp $020a
$11:ca8e  a5 00         lda $00
$11:ca90  f9 74 20      sbc $2074,y
$11:ca93  1f 03 70 40   ora $407003,x
$11:ca97  05 41         ora $41
$11:ca99  3c 80 57      bit $5780,x
$11:ca9c  38            sec
$11:ca9d  96 4f         stx $4f,y
$11:ca9f  24 ab         bit $ab
$11:caa1  d5 35         cmp $35,x
$11:caa3  fa            plx
$11:caa4  c2 bf         rep #$bf
$11:caa6  ee e0 c3      inc $c3e0
$11:caa9  7d 7c 1f      adc $1f7c,x
$11:caac  89 d4 0e      bit #$0ed4
$11:caaf  35 03         and $03,x
$11:cab1  8a            txa
$11:cab2  c0 71 58      cpy #$5871
$11:cab5  0e 07 03      asl $0307
$11:cab8  f1 f8         sbc ($f8),y
$11:caba  ff fe c1 a1   sbc $a1c1fe,x
$11:cabe  e2 c2         sep #$c2
$11:cac0  f1 38         sbc ($38),y
$11:cac2  30 a8         bmi $ca6c
$11:cac4  1c 16 0f      trb $0f16
$11:cac7  b1 ff         lda ($ff),y
$11:cac9  c0 fd fa      cpy #$fafd
$11:cacc  7e 7c 3e      ror $3e7c,x
$11:cacf  3f 8e bc 73   and $73bc8e,x
$11:cad3  a7 11         lda [$11]
$11:cad5  cf 87 e7 c3   cmp $c3e787
$11:cad9  03 81         ora $81,s
$11:cadb  c7 e3         cmp [$e3]
$11:cadd  e0 d0 06      cpx #$06d0
$11:cae0  87 af         sta [$af]
$11:cae2  af 9f db fb   lda $fbdb9f
$11:cae6  7a            ply
$11:cae7  ff 2e 3f 37   sbc $373f2e,x
$11:caeb  35 fa         and $fa,x
$11:caed  d6 ef         dec $ef,x
$11:caef  7d 9f ad      adc $ad9f,x
$11:caf2  37 02         and [$02],y
$11:caf4  7e ff 03      ror $03ff,x
$11:caf7  f8            sed
$11:caf8  1f c3 11 37   ora $3711c3,x
$11:cafc  d4 45         pei ($45)
$11:cafe  f5 90         sbc $90,x
$11:cb00  3d 0c 03      and $030c,x
$11:cb03  bb            tyx
$11:cb04  ed f9 fb      sbc $fbf9
$11:cb07  6f 3e dd 1f   adc $1fdd3e
$11:cb0b  be e3 bb      ldx $bbe3,y
$11:cb0e  ce dd 76      dec $76dd
$11:cb11  b3 dc         lda ($dc,s),y
$11:cb13  dd ae 03      cmp $03ae,x
$11:cb16  fe 4f 94      inc $944f,x
$11:cb19  0f f9 11 f6   ora $f611f9
$11:cb1d  45 fd         eor $fd
$11:cb1f  13 3e         ora ($3e,s),y
$11:cb21  07 d6         ora [$d6]
$11:cb23  01 e6         ora ($e6,x)
$11:cb25  cf 75 b5 da   cmp $dab575
$11:cb29  4e ff 03      lsr $03ff
$11:cb2c  7f e3 ce f1   adc $f1cee3,x
$11:cb30  ff fe 7e ff   sbc $ff7efe,x
$11:cb34  9f ff 81 80   sta $8081ff,x
$11:cb38  2f c3 01 01   and $0101c3
$11:cb3c  c0 40 f0      cpy #$f040
$11:cb3f  30 2e         bmi $cb6f
$11:cb41  1e 01 92      asl $9201,x
$11:cb44  1e 3e 05      asl $053e,x
$11:cb47  6e 47 f3      ror $f347
$11:cb4a  81 fe         sta ($fe,x)
$11:cb4c  f0 7b         beq $cbc9
$11:cb4e  3e 1b 4c      rol $4c1b,x
$11:cb51  3e 6d 60      rol $606d,x
$11:cb54  e1 fd         sbc ($fd,x)
$11:cb56  f9 ff d8      sbc $d8ff,y
$11:cb59  03 7c         ora $7c,s
$11:cb5b  2f b8 09 ef   and $ef09b8
$11:cb5f  03 7b         ora $7b,s
$11:cb61  40            rti
$11:cb62  ff c0 5d 21   sbc $215dc0,x
$11:cb66  f7 81         sbc [$81],y
$11:cb68  ff ff df ff   sbc $ffdfff,x
$11:cb6c  e7 fc         sbc [$fc]
$11:cb6e  94 1f         sty $1f,x
$11:cb70  0f bf e3 c7   ora $c7e3bf
$11:cb74  fc e0 ff      jsr ($ffe0,x)
$11:cb77  b0 0e         bcs $cb87
$11:cb79  f0 80         beq $cafb
$11:cb7b  df 30 73 8e   cmp $8e7330,x
$11:cb7f  3c 43 df      bit $df43,x
$11:cb82  00 1c         brk #$1c
$11:cb84  00 20         brk #$20
$11:cb86  ef f7 f9 f4   sbc $f4f9f7
$11:cb8a  fe 39 1f      inc $1f39,x
$11:cb8d  84 43         sty $43
$11:cb8f  e2 11         sep #$11
$11:cb91  f9 c4 fe      sbc $fec4,y
$11:cb94  f9 7f 78      sbc $787f,y
$11:cb97  00 1d         brk #$1d
$11:cb99  80 a0         bra $cb3b
$11:cb9b  03 00         ora $00,s
$11:cb9d  08            php
$11:cb9e  28            plp
$11:cb9f  00 d6         brk #$d6
$11:cba1  37 ff         and [$ff],y
$11:cba3  fc ff ff      jsr ($ffff,x)
$11:cba6  1f fb c1 fc   ora $fcc1fb,x
$11:cbaa  70 3e         bvs $cbea
$11:cbac  0c 07 01      tsb $0107
$11:cbaf  00 7f         brk #$7f
$11:cbb1  fe 02 7d      inc $7d02,x
$11:cbb4  c0 8e         cpy #$8e
$11:cbb6  78            sei
$11:cbb7  21 1f         and ($1f,x)
$11:cbb9  08            php
$11:cbba  87 c2         sta [$c2]
$11:cbbc  71 f8         adc ($f8),y
$11:cbbe  be 7f 3f      ldx $3f7f,y
$11:cbc1  df e0 ff 40   cmp $40ffe0,x
$11:cbc5  bf b0 9f b1   lda $b19fb0,x
$11:cbc9  bc 20 7f      ldy $7f20,x
$11:cbcc  ca            dex
$11:cbcd  0e fa 0b      asl $0bfa
$11:cbd0  fa            plx
$11:cbd1  03 91         ora $91,s
$11:cbd3  fb            xce
$11:cbd4  aa            tax
$11:cbd5  9d 3a 5f      sta $5f3a,x
$11:cbd8  62 89 dc      per $a864
$11:cbdb  d1 db         cmp ($db),y
$11:cbdd  f4 16 7e      pea $7e16
$11:cbe0  c4 e3         cpy $e3
$11:cbe2  cf 1f bc 61   cmp $61bc1f
$11:cbe6  e5 f0         sbc $f0
$11:cbe8  09 3c 02      ora #$023c
$11:cbeb  47 00         eor [$00]
$11:cbed  c8            iny
$11:cbee  60            rts
$11:cbef  33 18         and ($18,s),y
$11:cbf1  0e 3f 03      asl $033f
$11:cbf4  c1 e0         cmp ($e0,x)
$11:cbf6  fc 7e 24      jsr ($247e,x)
$11:cbf9  de 08 cf      dec $cf08,x
$11:cbfc  e7 0d         sbc [$0d]
$11:cbfe  bf d0 67 ea   lda $ea67d0,x
$11:cc02  dc 68 00      jml [$0068]
$11:cc05  34 01         bit $01,x
$11:cc07  03 1f         ora $1f,s
$11:cc09  80 2e         bra $cc39
$11:cc0b  02 c1         cop #$c1
$11:cc0d  00 bc         brk #$bc
$11:cc0f  c0 27         cpy #$27
$11:cc11  20 71 65      jsr $6571
$11:cc14  15 2a         ora $2a,x
$11:cc16  f7 9a         sbc [$9a],y
$11:cc18  f5 ca         sbc $ca,x
$11:cc1a  b9 75 4c      lda $4c75,y
$11:cc1d  b7 92         lda [$92],y
$11:cc1f  cd 18 29      cmp $2918
$11:cc22  87 e2         sta [$e2]
$11:cc24  01 e1         ora ($e1,x)
$11:cc26  ca            dex
$11:cc27  40            rti
$11:cc28  26 90         rol $90
$11:cc2a  0b            phd
$11:cc2b  a4 03         ldy $03
$11:cc2d  d3 01         cmp ($01,s),y
$11:cc2f  cc c0 47      cpy $47c0
$11:cc32  21 07         and ($07,x)
$11:cc34  83 c7         sta $c7,s
$11:cc36  e3 e5         sbc $e5,s
$11:cc38  10 87         bpl $cbc1
$11:cc3a  fc 00 e5      jsr ($e500,x)
$11:cc3d  40            rti
$11:cc3e  df c1 3f 67   cmp $673fc1,x
$11:cc42  bf 17 8f ba   lda $ba8f17,x
$11:cc46  01 bb         ora ($bb,x)
$11:cc48  5c 8b d7 c3   jml $c3d78b
$11:cc4c  ef 80 81 c2   sbc $c28180
$11:cc50  22 e1 3f 12   jsl $123fe1
$11:cc54  54 fe 91      mvn $91,$fe
$11:cc57  37 80         and [$80],y
$11:cc59  4f e0 17 f2   eor $f217e0
$11:cc5d  a8            tay
$11:cc5e  41 2f         eor ($2f,x)
$11:cc60  72 0e         adc ($0e)
$11:cc62  f8            sed
$11:cc63  f7 c7         sbc [$c7],y
$11:cc65  83 08         sta $08,s
$11:cc67  fb            xce
$11:cc68  e0 2f         cpx #$2f
$11:cc6a  e7 33         sbc [$33]
$11:cc6c  9f f1 27 7c   sta $7c27f1,x
$11:cc70  09 f8 ff      ora #$fff8
$11:cc73  9c 60 dc      stz $dc60
$11:cc76  0c 07 fb      tsb $fb07
$11:cc79  a9 aa ff      lda #$ffaa
$11:cc7c  60            rts
$11:cc7d  35 dd         and $dd,x
$11:cc7f  08            php
$11:cc80  35 e3         and $e3,x
$11:cc82  0d 78 36      ora $3678
$11:cc85  0e 1d 42      asl $421d
$11:cc88  bd 71 f9      lda $f971,x
$11:cc8b  61 ef         adc ($ef,x)
$11:cc8d  15 29         ora $29,x
$11:cc8f  47 e1         eor [$e1]
$11:cc91  30 29         bmi $ccbc
$11:cc93  50 c0         bvc $cc55
$11:cc95  7f af d0 0d   adc $0dd0af,x
$11:cc99  c6 00         dec $00
$11:cc9b  7e aa a0      ror $a0aa,x
$11:cc9e  51 21         eor ($21),y
$11:cca0  b4 4f         ldy $4f,x
$11:cca2  a1 b7         lda ($b7,x)
$11:cca4  bb            tyx
$11:cca5  f0 6f         beq $cd16
$11:cca7  f9 e9 f3      sbc $f3e9,y
$11:ccaa  5c 30 13 e6   jml $e61330
$11:ccae  a8            tay
$11:ccaf  1b            tcs
$11:ccb0  03 81         ora $81,s
$11:ccb2  ff c4 7f f7   sbc $f77fc4,x
$11:ccb6  c3 f5         cmp $f5,s
$11:ccb8  72 87         adc ($87)
$11:ccba  02 ff         cop #$ff
$11:ccbc  e5 b2         sbc $b2
$11:ccbe  ff 20 5b 99   sbc $995b20,x
$11:ccc2  df 0a fe ef   cmp $effe0a,x
$11:ccc6  0c 95 fc      tsb $fc95
$11:ccc9  e8            inx
$11:ccca  0b            phd
$11:cccb  e0 cd         cpx #$cd
$11:cccd  7f ff bf fe   adc $febfff,x
$11:ccd1  27 ff         and [$ff]
$11:ccd3  79 ff df      adc $dfff,y
$11:ccd6  8b            phb
$11:ccd7  83 fe         sta $fe,s
$11:ccd9  de 14 90      dec $9014,x
$11:ccdc  5f fb b7 fc   eor $fcb7fb,x
$11:cce0  0c 07 79      tsb $7907
$11:cce3  42 eb         wdm #$eb
$11:cce5  ca            dex
$11:cce6  37 e3         and [$e3],y
$11:cce8  70 a0         bvs $cc8a
$11:ccea  3a            dec a
$11:cceb  c9 ca 1f      cmp #$1fca
$11:ccee  ef fe f5 52   sbc $52f5fe
$11:ccf2  20 90 04      jsr $0490
$11:ccf5  87 ee         sta [$ee]
$11:ccf7  89 f4 a5      bit #$a5f4
$11:ccfa  f8            sed
$11:ccfb  2b            pld
$11:ccfc  fa            plx
$11:ccfd  99 5f 2a      sta $2a5f,y
$11:cd00  fc f9 41      jsr ($41f9,x)
$11:cd03  59 02 43      eor $4302,y
$11:cd06  a8            tay
$11:cd07  26 10         rol $10
$11:cd09  4a            lsr a
$11:cd0a  5f b0 3c 1b   eor $1b3cb0,x
$11:cd0e  f6 4a         inc $4a,x
$11:cd10  e7 a1         sbc [$a1]
$11:cd12  bf e3 6a 78   lda $786ae3,x
$11:cd16  ca            dex
$11:cd17  91 54         sta ($54),y
$11:cd19  2b            pld
$11:cd1a  5b            tcd
$11:cd1b  ab            plb
$11:cd1c  f7 ff         sbc [$ff],y
$11:cd1e  03 ff         ora $ff,s
$11:cd20  c6 02         dec $02
$11:cd22  87 59         sta [$59]
$11:cd24  ff d6 82 86   sbc $8682d6,x
$11:cd28  8b            phb
$11:cd29  ff b7 ec 36   sbc $36ecb7,x
$11:cd2d  74 ee         stz $ee,x
$11:cd2f  66 f6         ror $f6
$11:cd31  a7 b2         lda [$b2]
$11:cd33  d4 db         pei ($db)
$11:cd35  f4 d6 ee      pea $eed6
$11:cd38  ad 73 b7      lda $b773
$11:cd3b  28            plp
$11:cd3c  a7 ff         lda [$ff]
$11:cd3e  f6 3f         inc $3f,x
$11:cd40  fa            plx
$11:cd41  17 fe         ora [$fe],y
$11:cd43  9b            txy
$11:cd44  ff c8 ff b2   sbc $b2ffc8,x
$11:cd48  df 9d 27 ef   cmp $ef279d,x
$11:cd4c  b1 f7         lda ($f7),y
$11:cd4e  5f aa 3d e0   eor $e03daa,x
$11:cd52  09 ed ff      ora #$ffed
$11:cd55  df 7a d8 ac   cmp $acd87a,x
$11:cd59  ee d3 f5      inc $f5d3
$11:cd5c  a1 da         lda ($da,x)
$11:cd5e  f0 fd         beq $cd5d
$11:cd60  7a            ply
$11:cd61  6e b5 33      ror $33b5
$11:cd64  5b            tcd
$11:cd65  99 be c0      sta $c0be,y
$11:cd68  30 57         bmi $cdc1
$11:cd6a  dc 25 ef      jml [$ef25]
$11:cd6d  01 77         ora ($77,x)
$11:cd6f  c0 5b         cpy #$5b
$11:cd71  f4 15 fa      pea $fa15
$11:cd74  04 ff         tsb $ff
$11:cd76  01 7f         ora ($7f,x)
$11:cd78  d6 f4         dec $f4,x
$11:cd7a  ea            nop
$11:cd7b  be cd 55      ldx $55cd,y
$11:cd7e  66 ab         ror $ab
$11:cd80  ac d4 dd      ldy $ddd4
$11:cd83  fa            plx
$11:cd84  d5 99         cmp $99,x
$11:cd86  36 27         rol $27,x
$11:cd88  b3 ae         lda ($ae,s),y
$11:cd8a  94 7e         sty $7e,x
$11:cd8c  20 7e 0c      jsr $0c7e
$11:cd8f  3f 02 07 80   and $800702,x
$11:cd93  73 04         adc ($04,s),y
$11:cd95  82 01 71      brl $3e99
$11:cd98  80 5c         bra $cdf6
$11:cd9a  e0 00         cpx #$00
$11:cd9c  00 20         brk #$20
$11:cd9e  80 3b         bra $cddb
$11:cda0  fd fd 9e      sbc $9efd,x
$11:cda3  cd 4c 1f      cmp $1f4c
$11:cda6  7b            tdc
$11:cda7  d8            cld
$11:cda8  a9 c3 a7      lda #$a7c3
$11:cdab  7f 2d 0e 53   adc $530e2d,x
$11:cdaf  e3 eb         sbc $eb,s
$11:cdb1  e4 55         cpx $55
$11:cdb3  e9 1d f8      sbc #$f81d
$11:cdb6  47 6e         eor [$6e]
$11:cdb8  51 bf         eor ($bf),y
$11:cdba  88            dey
$11:cdbb  7d e2 17      adc $17e2,x
$11:cdbe  f9 05 be      sbc $be05,y
$11:cdc1  41 77         eor ($77,x)
$11:cdc3  80 6f         bra $ce34
$11:cdc5  e0 10         cpx #$10
$11:cdc7  1f fd e2 fd   ora $fde2fd,x
$11:cdcb  83 83         sta $83,s
$11:cdcd  55 30         eor $30,x
$11:cdcf  19 df 77      ora $77df,y
$11:cdd2  8f 9b b6 ea   sta $eab69b
$11:cdd6  70 b3         bvs $cd8b
$11:cdd8  cf e0 c0 c0   cmp $c0c0e0
$11:cddc  3f 30 0f dc   and $dc0f30,x
$11:cde0  17 e7         ora [$e7],y
$11:cde2  00 fb         brk #$fb
$11:cde4  42 bd         wdm #$bd
$11:cde6  f8            sed
$11:cde7  4f 6c 52 81   eor $81526c
$11:cdeb  7f e7 5f e2   adc $e25fe7,x
$11:cdef  b7 5d         lda [$5d],y
$11:cdf1  37 83         and [$83],y
$11:cdf3  97 c4         sta [$c4],y
$11:cdf5  c8            iny
$11:cdf6  e3 a8         sbc $a8,s
$11:cdf8  93 ed         sta ($ed,s),y
$11:cdfa  6d fb 01      adc $01fb
$11:cdfd  00 2f         brk #$2f
$11:cdff  86 2a         stx $2a
$11:ce01  01 1f         ora ($1f,x)
$11:ce03  80 4f         bra $ce54
$11:ce05  e0 17         cpx #$17
$11:ce07  f8            sed
$11:ce08  07 fc         ora [$fc]
$11:ce0a  d4 33         pei ($33)
$11:ce0c  cc 1f 67      cpy $671f
$11:ce0f  8d 50 a7      sta $a750
$11:ce12  fa            plx
$11:ce13  6c d3 4d      jmp ($4dd3)
$11:ce16  9f 46 25 0b   sta $0b2546,x
$11:ce1a  a4 6b         ldy $6b
$11:ce1c  69 97 ff      adc #$ff97
$11:ce1f  fc fe ff      jsr ($fffe,x)
$11:ce22  bf 9f e7 e7   lda $e7e79f,x
$11:ce26  fc f8 ff      jsr ($fff8,x)
$11:ce29  be 1f f7      ldx $f71f,y
$11:ce2c  83 fc         sta $fc,s
$11:ce2e  e0 ff         cpx #$ff
$11:ce30  08            php
$11:ce31  06 7e         asl $7e
$11:ce33  21 39         and ($39,x)
$11:ce35  e0 f1         cpx #$f1
$11:ce37  ff 1e 1f f7   sbc $f71f1e,x
$11:ce3b  e3 ff         sbc $ff,s
$11:ce3d  fc ff 9a      jsr ($9aff,x)
$11:ce40  c1 fc         cmp ($fc,x)
$11:ce42  1e 08 07      asl $0708,x
$11:ce45  f8            sed
$11:ce46  d4 18         pei ($18)
$11:ce48  05 28         ora $28
$11:ce4a  f0 15         beq $ce61
$11:ce4c  21 00         and ($00,x)
$11:ce4e  99 bf 89      sta $89bf,y
$11:ce51  42 13         wdm #$13
$11:ce53  c9 07 9e      cmp #$9e07
$11:ce56  09 78 c0      ora #$c078
$11:ce59  4f 38 1f c7   eor $c71f38
$11:ce5d  f2 ab         sbc ($ab)
$11:ce5f  03 f0         ora $f0,s
$11:ce61  6a            ror a
$11:ce62  33 40         and ($40,s),y
$11:ce64  bf 94 be 1e   lda $1ebe94,x
$11:ce68  0c 04 e2      tsb $e204
$11:ce6b  41 4e         eor ($4e,x)
$11:ce6d  7f 5a b0 18   adc $18b05a,x
$11:ce71  c3 dd         cmp $dd,s
$11:ce73  91 62         sta ($62),y
$11:ce75  22 3a a9 9e   jsl $9ea93a
$11:ce79  aa            tax
$11:ce7a  03 ae         ora $ae,s
$11:ce7c  88            dey
$11:ce7d  7a            ply
$11:ce7e  a0 3a         ldy #$3a
$11:ce80  a9 17 33      lda #$3317
$11:ce83  bb            tyx
$11:ce84  ff c4 00 0f   sbc $0f00c4,x
$11:ce88  19 ff e4      ora $e4ff,y
$11:ce8b  00 07         brk #$07
$11:ce8d  98            tya
$11:ce8e  6b            rtl
$11:ce8f  0e fc 83      asl $83fc
$11:ce92  1f 00 d6 84   ora $84d600,x
$11:ce96  c7 7a         cmp [$7a]
$11:ce98  11 09         ora ($09),y
$11:ce9a  06 74         asl $74
$11:ce9c  1e 1d ff      asl $ff1d,x
$11:ce9f  fe 3f ff      inc $ff3f,x
$11:cea2  8d 11 0e      sta $0e11
$11:cea5  74 40         stz $40,x
$11:cea7  22 70 0f 87   jsl $870f70
$11:ceab  5a            phy
$11:ceac  f5 32         sbc $32,x
$11:ceae  6f 07 76 a9   adc $a97607
$11:ceb2  ef ad 40 54   sbc $5440ad
$11:ceb6  81 22         sta ($22,x)
$11:ceb8  c0 a9         cpy #$a9
$11:ceba  00 7a         brk #$7a
$11:cebc  4f f0 80 91   eor $9180f0
$11:cec0  05 38         ora $38
$11:cec2  18            clc
$11:cec3  12 40         ora ($40)
$11:cec5  d2 b9         cmp ($b9)
$11:cec7  1a            inc a
$11:cec8  bb            tyx
$11:cec9  17 46         ora [$46],y
$11:cecb  63 ea         adc $ea,s
$11:cecd  ad 7d 6d      lda $6d7d
$11:ced0  bd a9 b5      lda $b5a9,x
$11:ced3  f7 17         sbc [$17],y
$11:ced5  1e f0 cd      asl $cdf0,x
$11:ced8  e0 11         cpx #$11
$11:ceda  d8            cld
$11:cedb  04 3a         tsb $3a
$11:cedd  01 45         ora ($45,x)
$11:cedf  a0 58         ldy #$58
$11:cee1  ac 11 1c      ldy $1c11
$11:cee4  84 23         sty $23
$11:cee6  90 c6         bcc $ceae
$11:cee8  0c 94 16      tsb $1694
$11:ceeb  91 31         sta ($31),y
$11:ceed  d5 cc         cmp $cc,x
$11:ceef  2a            rol a
$11:cef0  76 8d         ror $8d,x
$11:cef2  35 c6         and $c6,x
$11:cef4  d3 72         cmp ($72,s),y
$11:cef6  c4 cc         cpy $cc
$11:cef8  ba            tsx
$11:cef9  96 28         stx $28,y
$11:cefb  2d f4 8a      and $8af4
$11:cefe  14 0b         trb $0b
$11:cf00  f2 88         sbc ($88)
$11:cf02  08            php
$11:cf03  a0 a2         ldy #$a2
$11:cf05  04 18         tsb $18
$11:cf07  df e1 90 c0   cmp $c090e1,x
$11:cf0b  a0 32         ldy #$32
$11:cf0d  42 39         wdm #$39
$11:cf0f  e3 89         sbc $89,s
$11:cf11  c4 a2         cpy $a2
$11:cf13  10 0d         bpl $cf22
$11:cf15  e6 f2         inc $f2
$11:cf17  25 ff         and $ff
$11:cf19  f9 b2 0d      sbc $0db2,y
$11:cf1c  92 1e         sta ($1e)
$11:cf1e  d6 40         dec $40,x
$11:cf20  d0 db         bne $cefd
$11:cf22  c3 af         cmp $af,s
$11:cf24  d7 fd         cmp [$fd],y
$11:cf26  f0 0c         beq $cf34
$11:cf28  e0 94         cpx #$94
$11:cf2a  45 fa         eor $fa
$11:cf2c  19 08 86      ora $8608,y
$11:cf2f  02 75         cop #$75
$11:cf31  ba            tsx
$11:cf32  d0 5f         bne $cf93
$11:cf34  ea            nop
$11:cf35  08            php
$11:cf36  d0 50         bne $cf88
$11:cf38  1d bd 80      ora $80bd,x
$11:cf3b  34 56         bit $56,x
$11:cf3d  f0 eb         beq $cf2a
$11:cf3f  35 ff         and $ff,x
$11:cf41  48            pha
$11:cf42  2f 32 53 9c   and $9c5332
$11:cf46  a8            tay
$11:cf47  d6 28         dec $28,x
$11:cf49  be ce 0e      ldx $0ece,y
$11:cf4c  eb            xba
$11:cf4d  0f 3c c0 af   ora $afc03c
$11:cf51  c3 f5         cmp $f5,s
$11:cf53  00 fb         brk #$fb
$11:cf55  40            rti
$11:cf56  3d d0 0d      and $0dd0,x
$11:cf59  f4 02 7d      pea $7d02
$11:cf5c  00 be         brk #$be
$11:cf5e  40            rti
$11:cf5f  10 81         bpl $cee2
$11:cf61  52 92         eor ($92)
$11:cf63  f9 f2 f6      sbc $f6f2,y
$11:cf66  ee fc de      inc $defc
$11:cf69  75 6d         adc $6d,x
$11:cf6b  9a            txs
$11:cf6c  f3 ed         sbc ($ed,s),y
$11:cf6e  35 6b         and $6b,x
$11:cf70  ff d4 6e 1f   sbc $1f6ed4,x
$11:cf74  fe 7e cf      inc $cf7e,x
$11:cf77  ff 08 be 68   sbc $68be08,x
$11:cf7b  2f d8 0b be   and $be0bd8
$11:cf7f  02 c7         cop #$c7
$11:cf81  c0 bf         cpy #$bf
$11:cf83  d0 60         bne $cfe5
$11:cf85  03 80         ora $80,s
$11:cf87  83 c0         sta $c0,s
$11:cf89  e3 f0         sbc $f0,s
$11:cf8b  c9 e4 46      cmp #$46e4
$11:cf8e  e1 16         sbc ($16,x)
$11:cf90  b8            clv
$11:cf91  cb            wai
$11:cf92  3c 72 9f      bit $9f72,x
$11:cf95  3a            dec a
$11:cf96  b0 55         bcs $cfed
$11:cf98  83 03         sta $03,s
$11:cf9a  80 43         bra $cfdf
$11:cf9c  c4 c3         cpy $c3
$11:cf9e  1f 15 0b 10   ora $100b15,x
$11:cfa2  2f f7 fc 24   and $24fcf7
$11:cfa6  02 bf         cop #$bf
$11:cfa8  80 c2         bra $cf6c
$11:cfaa  7e f8 df      ror $dff8,x
$11:cfad  fe f9 34      inc $34f9,x
$11:cfb0  14 21         trb $21
$11:cfb2  00 c0         brk #$c0
$11:cfb4  28            plp
$11:cfb5  15 42         ora $42,x
$11:cfb7  38            sec
$11:cfb8  01 f0         ora ($f0,x)
$11:cfba  ff f7 db f8   sbc $f8dbf7,x
$11:cfbe  ac 56 ed      ldy $ed56
$11:cfc1  00 89         brk #$89
$11:cfc3  fb            xce
$11:cfc4  2b            pld
$11:cfc5  3f ef e7 fa   and $fae7ef,x
$11:cfc9  fb            xce
$11:cfca  fe 56 05      inc $0556,x
$11:cfcd  02 01         cop #$01
$11:cfcf  ea            nop
$11:cfd0  21 44         and ($44,x)
$11:cfd2  03 19         ora $19,s
$11:cfd4  ed e4 fb      sbc $fbe4
$11:cfd7  3d 3c ce      and $ce3c,x
$11:cfda  77 bc         adc [$bc],y
$11:cfdc  e6 1c         inc $1c
$11:cfde  ad 79 cc      lda $cc79
$11:cfe1  39 7e ef      and $ef7e,y
$11:cfe4  9c 0f e7      stz $e70f
$11:cfe7  83 40         sta $40,s
$11:cfe9  87 c5         sta [$c5]
$11:cfeb  04 48         tsb $48
$11:cfed  01 42         ora ($42,x)
$11:cfef  87 3e         sta [$3e]
$11:cff1  7f b9 bc fc   adc $fcbcb9,x
$11:cff5  2e 1a 49      rol $491a
$11:cff8  06 ba         asl $ba
$11:cffa  41 ff         eor ($ff,x)
$11:cffc  90 67         bcc $d065
$11:cffe  e0 09         cpx #$09
$11:d000  b0 62         bcs $d064
$11:d002  04 1b         tsb $1b
$11:d004  ff 0f ff d7   sbc $d7ff0f,x
$11:d008  d4 87         pei ($87)
$11:d00a  7f 55 0d 9f   adc $9f0d55,x
$11:d00e  31 b0         and ($b0),y
$11:d010  ef f7 2d f7   sbc $f72df7
$11:d014  49 7c 3e      eor #$3e7c
$11:d017  2f 3b 8b c1   and $c18b3b
$11:d01b  61 39         adc ($39,x)
$11:d01d  c8            iny
$11:d01e  51 28         eor ($28),y
$11:d020  09 45 c0      ora #$c045
$11:d023  ff f8 18 c3   sbc $c318f8,x
$11:d027  f2 ff         sbc ($ff)
$11:d029  fc 7f fe      jsr ($fe7f,x)
$11:d02c  d8            cld
$11:d02d  05 6f         ora $6f
$11:d02f  01 2f         ora ($2f,x)
$11:d031  e0 44         cpx #$44
$11:d033  fc 98 9f      jsr ($9f98,x)
$11:d036  94 13         sty $13,x
$11:d038  f3 e2         sbc ($e2,s),y
$11:d03a  fe 5e 2f      inc $2f5e,x
$11:d03d  d0 0d         bne $d04c
$11:d03f  b4 03         ldy $03,x
$11:d041  fb            xce
$11:d042  00 2f         brk #$2f
$11:d044  01 95         ora ($95,x)
$11:d046  49 80 41      eor #$4180
$11:d049  0b            phd
$11:d04a  04 03         tsb $03
$11:d04c  b1 00         lda ($00),y
$11:d04e  2a            rol a
$11:d04f  83 3c         sta $3c,s
$11:d051  2d d8 09      and $09d8
$11:d054  af 03 3c f1   lda $f13c03
$11:d058  02 70         cop #$70
$11:d05a  10 43         bpl $d09f
$11:d05c  c1 00         cmp ($00,x)
$11:d05e  dc 40 3b      jml [$3b40]
$11:d061  d0 0f         bne $d072
$11:d063  bc 03 f6      ldy $f603,x
$11:d066  e1 10         sbc ($10,x)
$11:d068  7a            ply
$11:d069  90 40         bcc $d0ab
$11:d06b  c2 1b         rep #$1b
$11:d06d  08            php
$11:d06e  07 20         ora [$20]
$11:d070  1e c1 34      asl $34c1,x
$11:d073  e0 40 3e      cpx #$3e40
$11:d076  1d 0b 1c      ora $1c0b,x
$11:d079  82 1f 00      brl $d09b
$11:d07c  ef d0 39 f4   sbc $f439d0
$11:d080  08            php
$11:d081  fa            plx
$11:d082  fc 77 ec      jsr ($ec77,x)
$11:d085  10 81         bpl $d008
$11:d087  a8            tay
$11:d088  87 be         sta [$be]
$11:d08a  a2 18 ff      ldx #$ff18
$11:d08d  fc 90 1b      jsr ($1b90,x)
$11:d090  f2 40         sbc ($40)
$11:d092  ee e8 92      inc $92e8
$11:d095  df b7 ae 99   cmp $99aeb7,x
$11:d099  97 ac         sta [$ac],y
$11:d09b  7a            ply
$11:d09c  e6 15         inc $15
$11:d09e  3f 06 de 81   and $81de06,x
$11:d0a2  f7 90         sbc [$90],y
$11:d0a4  03 ca         ora $ca,s
$11:d0a6  21 01         and ($01,x)
$11:d0a8  90 40         bcc $d0ea
$11:d0aa  e0 10 78      cpx #$7810
$11:d0ad  00 c8         brk #$c8
$11:d0af  06 41         asl $41
$11:d0b1  2f ff 70 37   and $3770ff
$11:d0b5  3a            dec a
$11:d0b6  2c 7e 02      bit $027e
$11:d0b9  4d a1 e5      eor $e5a1
$11:d0bc  52 3d         eor ($3d)
$11:d0be  72 2f         adc ($2f)
$11:d0c0  8c 47 b5      sty $b547
$11:d0c3  2a            rol a
$11:d0c4  9f c0 2b f0   sta $f02bc0,x
$11:d0c8  0b            phd
$11:d0c9  fa            plx
$11:d0ca  00 66         brk #$66
$11:d0cc  f0 08         beq $d0d6
$11:d0ce  ec 02 1d      cpx $1d02
$11:d0d1  00 82         brk #$82
$11:d0d3  c0 22 56      cpy #$5622
$11:d0d6  5d 4d cb      eor $cb4d,x
$11:d0d9  85 71         sta $71
$11:d0db  ab            plb
$11:d0dc  58            cli
$11:d0dd  65 b3         adc $b3
$11:d0df  2e 45 ce      rol $ce45
$11:d0e2  2b            pld
$11:d0e3  72 f5         adc ($f5)
$11:d0e5  5b            tcd
$11:d0e6  e0 3f f8      cpx #$f83f
$11:d0e9  05 fa         ora $fa
$11:d0eb  03 7f         ora $7f,s
$11:d0ed  4f 85 03 ec   eor $ec0385
$11:d0f1  9f 1f f4 46   sta $46f41f,x
$11:d0f5  ff fb 86 75   sbc $7586fb,x
$11:d0f9  66 da         ror $da
$11:d0fb  9b            txy
$11:d0fc  16 36         asl $36,x
$11:d0fe  8c b3 0c      sty $0cb3
$11:d101  0d 09 66      ora $6609
$11:d104  18            clc
$11:d105  fb            xce
$11:d106  20 54 21      jsr $2154
$11:d109  10 08         bpl $d113
$11:d10b  e4 02         cpx $02
$11:d10d  70 c2         bvs $d0d1
$11:d10f  1b            tcs
$11:d110  e5 01         sbc $01
$11:d112  86 11         stx $11
$11:d114  88            dey
$11:d115  04 7b         tsb $7b
$11:d117  07 78         ora [$78]
$11:d119  e2 cf         sep #$cf
$11:d11b  70 37         bvs $d154
$11:d11d  ae 3c b3      ldx $b33c
$11:d120  03 1a         ora $1a,s
$11:d122  c3 da         cmp $da,s
$11:d124  ba            tsx
$11:d125  f6 8f         inc $8f,x
$11:d127  4d f2 01      eor $01f2
$11:d12a  3e 50 84      rol $8450,x
$11:d12d  02 78         cop #$78
$11:d12f  e2 16         sep #$16
$11:d131  f8            sed
$11:d132  39 42 2d      and $2d42,y
$11:d135  00 e5         brk #$e5
$11:d137  5d 65 76      eor $7665,x
$11:d13a  ed 4c ca      sbc $ca4c
$11:d13d  37 4d         and [$4d],y
$11:d13f  c3 d6         cmp $d6,s
$11:d141  ef 51 2e c4   sbc $c42e51
$11:d145  8b            phb
$11:d146  dd 55 b1      cmp $b155,x
$11:d149  40            rti
$11:d14a  6e b8 06      ror $06b8
$11:d14d  f8            sed
$11:d14e  e0 2c         cpx #$2c
$11:d150  f8            sed
$11:d151  18            clc
$11:d152  0f 32 29 4f   ora $4f2932
$11:d156  98            tya
$11:d157  43 eb         eor $eb,s
$11:d159  7c 7a 9f      jmp ($9f7a,x)
$11:d15c  3c 22 15      bit $1522,x
$11:d15f  7e 7d 7f      ror $7f7d,x
$11:d162  8e 15 0a      stx $0a15
$11:d165  97 3e         sta [$3e],y
$11:d167  a9 cf 3f      lda #$3fcf
$11:d16a  80 7f         bra $d1eb
$11:d16c  09 01 fb      ora #$fb01
$11:d16f  ff fa bf fe   sbc $febffa,x
$11:d173  0f ff 0b ff   ora $ff0bff
$11:d177  c0 ff         cpy #$ff
$11:d179  f0 7f         beq $d1fa
$11:d17b  d8            cld
$11:d17c  7f c7 ff 00   adc $00ffc7,x
$11:d180  3f cf e7 fb   and $fbe7cf,x
$11:d184  fe 50 1d      inc $1d50,x
$11:d187  e7 fa         sbc [$fa]
$11:d189  59 fe 82      eor $82fe,y
$11:d18c  ff a0 9f ea   sbc $ea9fa0,x
$11:d190  86 fb         stx $fb
$11:d192  fe 2e 03      inc $032e,x
$11:d195  05 fa         ora $fa
$11:d197  39 dc 9f      and $9fdc,y
$11:d19a  71 bc         adc ($bc),y
$11:d19c  39 07 25      and $2507,y
$11:d19f  a4 6b         ldy $6b
$11:d1a1  be 38 33      ldx $3338,y
$11:d1a4  fd c0 ff      sbc $ffc0,x
$11:d1a7  f2 0d         sbc ($0d)
$11:d1a9  7c 83 3f      jmp ($3f83,x)
$11:d1ac  00 e7         brk #$e7
$11:d1ae  c0 3d         cpy #$3d
$11:d1b0  f2 0c         sbc ($0c)
$11:d1b2  bd c3 51      lda $51c3,x
$11:d1b5  78            sei
$11:d1b6  ea            nop
$11:d1b7  47 eb         eor [$eb]
$11:d1b9  ff f4 f8 5f   sbc $5ff8f4,x
$11:d1bd  d4 42         pei ($42)
$11:d1bf  9f 0a 7f fe   sta $fe7f0a,x
$11:d1c3  8f ff b0 7f   sta $7fb0ff
$11:d1c7  e0 50         cpx #$50
$11:d1c9  4c 74 17      jmp $1774
$11:d1cc  83 02         sta $02,s
$11:d1ce  c3 c0         cmp $c0,s
$11:d1d0  b8            clv
$11:d1d1  10 18         bpl $d1eb
$11:d1d3  5c 26 bb 5d   jml $5dbb26
$11:d1d7  ed 7f ff      sbc $ff7f
$11:d1da  3f f1 f0 7f   and $7ff0f1,x
$11:d1de  18            clc
$11:d1df  42 50         wdm #$50
$11:d1e1  0f b7 ff 44   ora $44ffb7
$11:d1e5  5f 1a 85 7e   eor $7e851a,x
$11:d1e9  79 3f c7      adc $c73f,y
$11:d1ec  63 e3         adc $e3,s
$11:d1ee  99 fe 3d      sta $3dfe,y
$11:d1f1  1f 2b 75 a5   ora $a5752b,x
$11:d1f5  6f fb 7a 4d   adc $4d7afb
$11:d1f9  07 fc         ora [$fc]
$11:d1fb  72 17         adc ($17)
$11:d1fd  05 60         ora $60
$11:d1ff  ce 3f f0      dec $f03f
$11:d202  a2 f9         ldx #$f9
$11:d204  d3 a6         cmp ($a6,s),y
$11:d206  12 6c         ora ($6c)
$11:d208  cf 4f 19 69   cmp $69194f
$11:d20c  e3 46         sbc $46,s
$11:d20e  3c f9 4f      bit $4ff9,x
$11:d211  9c 27 e1      stz $e127
$11:d214  d4 94         pei ($94)
$11:d216  18            clc
$11:d217  37 ff         and [$ff],y
$11:d219  e6 80         inc $80
$11:d21b  5d 60 13      eor $1360,x
$11:d21e  9c 07 72      stz $7207
$11:d221  01 ce         ora ($ce,x)
$11:d223  90 59         bcc $d27e
$11:d225  f2 1e         sbc ($1e)
$11:d227  38            sec
$11:d228  04 0e         tsb $0e
$11:d22a  01 00         ora ($00,x)
$11:d22c  bc 40 37      ldy $3740,x
$11:d22f  d0 0e         bne $d23f
$11:d231  fa            plx
$11:d232  58            cli
$11:d233  20 1f 78      jsr $781f
$11:d236  07 ee         ora [$ee]
$11:d238  01 fd         ora ($fd,x)
$11:d23a  80 7f         bra $d2bb
$11:d23c  03 c0         ora $c0,s
$11:d23e  1e 0c 04      asl $040c,x
$11:d241  02 81         cop #$81
$11:d243  00 b0         brk #$b0
$11:d245  40            rti
$11:d246  26 10         rol $10
$11:d248  0c 44 02      tsb $0244
$11:d24b  e8            inx
$11:d24c  2f 21 7a 70   and $707a21
$11:d250  20 1e 08      jsr $081e
$11:d253  07 c0         ora [$c0]
$11:d255  74 13         stz $13,x
$11:d257  ce df 2e      dec $2edf
$11:d25a  cd 00 d2      cmp $d200
$11:d25d  d4 be         pei ($be)
$11:d25f  e4 f0         cpx $f0
$11:d261  d6 d6         dec $d6,x
$11:d263  ac d1 8d      ldy $8dd1
$11:d266  ac 20 3c      ldy $3c20
$11:d269  11 88         ora ($88),y
$11:d26b  05 6a         ora $6a
$11:d26d  00 5e         brk #$5e
$11:d26f  11 79         ora ($79),y
$11:d271  60            rts
$11:d272  60            rts
$11:d273  1c 3c 6d      trb $6d3c
$11:d276  d7 6d         cmp [$6d],y
$11:d278  7a            ply
$11:d279  c5 db         cmp $db
$11:d27b  74 f6         stz $f6,x
$11:d27d  4c 7d 13      jmp $137d
$11:d280  7b            tdc
$11:d281  76 d5         ror $d5,x
$11:d283  d8            cld
$11:d284  39 b2 68      and $68b2,y
$11:d287  14 02         trb $02
$11:d289  03 00         ora $00,s
$11:d28b  88            dey
$11:d28c  18            clc
$11:d28d  06 70         asl $70
$11:d28f  64 18         stz $18
$11:d291  e1 80         sbc ($80,x)
$11:d293  72 50         adc ($50)
$11:d295  0a            asl a
$11:d296  44 db 47      mvp $47,$db
$11:d299  3e a5 dd      rol $dda5,x
$11:d29c  b4 97         ldy $97,x
$11:d29e  cb            wai
$11:d29f  0d f3 17      ora $17f3
$11:d2a2  3c ea 5b      bit $5bea,x
$11:d2a5  60            rts
$11:d2a6  17 f0         ora [$f0],y
$11:d2a8  08            php
$11:d2a9  50 14         bvc $d2bf
$11:d2ab  03 02         ora $02,s
$11:d2ad  53 0d         eor ($0d,s),y
$11:d2af  0a            asl a
$11:d2b0  ff 02 bf a3   sbc $a3bf02,x
$11:d2b4  d2 ad         cmp ($ad)
$11:d2b6  7e 94 cc      ror $cc94,x
$11:d2b9  39 57 48      and $4857,y
$11:d2bc  ad f3 d4      lda $d4f3
$11:d2bf  37 05         and [$05],y
$11:d2c1  02 d1         cop #$d1
$11:d2c3  94 c7         sty $c7,x
$11:d2c5  1e bf c7      asl $c7bf,x
$11:d2c8  b0 77         bcs $d341
$11:d2ca  8e 2c f7      stx $f72c
$11:d2cd  03 7a         ora $7a,s
$11:d2cf  e3 cb         sbc $cb,s
$11:d2d1  30 31         bmi $d304
$11:d2d3  ac 3b 54      ldy $543b
$11:d2d6  2b            pld
$11:d2d7  1c 5b e4      trb $e45b
$11:d2da  02 7d         cop #$7d
$11:d2dc  00 bf         brk #$bf
$11:d2de  40            rti
$11:d2df  27 8e         and [$8e]
$11:d2e1  21 6f         and ($6f,x)
$11:d2e3  83 94         sta $94,s
$11:d2e5  1c 21 e9      trb $e921
$11:d2e8  af df 2a 1f   lda $1f2adf
$11:d2ec  fa            plx
$11:d2ed  fd 06 fd      sbc $fd06,x
$11:d2f0  f2 b0         sbc ($b0)
$11:d2f2  4f 67 fb f8   eor $f8fb67
$11:d2f6  06 d6         asl $d6
$11:d2f8  ff 30 87 cc   sbc $cc8730,x
$11:d2fc  31 f3         and ($f3),y
$11:d2fe  f8            sed
$11:d2ff  84 ff         sty $ff
$11:d301  00 05         brk #$05
$11:d303  0b            phd
$11:d304  fe 81 40      inc $4081,x
$11:d307  03 50         ora $50,s
$11:d309  aa            tax
$11:d30a  73 eb         adc ($eb,s),y
$11:d30c  1c 7a af      trb $af7a
$11:d30f  3a            dec a
$11:d310  a3 ce         lda $ce,s
$11:d312  a9 f3 2b      lda #$2bf3
$11:d315  7c 48 5f      jmp ($5f48,x)
$11:d318  12 9f         ora ($9f)
$11:d31a  c0 9f         cpy #$9f
$11:d31c  c0 03         cpy #$03
$11:d31e  f9 9d f1      sbc $f19d,y
$11:d321  67 fc         adc [$fc]
$11:d323  1a            inc a
$11:d324  fe 86 ff      inc $ff86,x
$11:d327  81 7d         sta ($7d,x)
$11:d329  c0 5d         cpy #$5d
$11:d32b  30 16         bmi $d343
$11:d32d  0c 05 23      tsb $2305
$11:d330  01 ff         ora ($ff,x)
$11:d332  62 80 f8      per $cbb5
$11:d335  07 c4         ora [$c4]
$11:d337  46 5e         lsr $5e
$11:d339  1c f3 45      trb $45f3
$11:d33c  5c f1 47 3e   jml $3e47f1
$11:d340  d0 82         bne $d2c4
$11:d342  a8            tay
$11:d343  7f a0 1b e4   adc $e41ba0,x
$11:d347  50 91         bvc $d2da
$11:d349  60            rts
$11:d34a  8a            txa
$11:d34b  9f 8e ff 23   sta $23ff8e,x
$11:d34f  ff f0 ef 74   sbc $74eff0,x
$11:d353  3f df 8e f7   and $f78edf,x
$11:d357  60            rts
$11:d358  ec 7e 0c      cpx $0c7e
$11:d35b  19 fc 3c      ora $3cfc,y
$11:d35e  28            plp
$11:d35f  29 f9 43      and #$43f9
$11:d362  72 f5         adc ($f5)
$11:d364  0e 7c 03      asl $037c
$11:d367  b7 04         lda [$04],y
$11:d369  eb            xba
$11:d36a  c2 3f         rep #$3f
$11:d36c  30 6f         bmi $d3dd
$11:d36e  dc 13 ab      jml [$ab13]
$11:d371  0a            asl a
$11:d372  bf ff ed ff   lda $ffedff,x
$11:d376  f4 f8 28      pea $28f8
$11:d379  e3 bd         sbc $bd,s
$11:d37b  20 f9 c0      jsr $c0f9
$11:d37e  38            sec
$11:d37f  10 0f         bpl $d390
$11:d381  02 c8         cop #$c8
$11:d383  fe 0b 41      inc $410b,x
$11:d386  ff af f6 51   sbc $51f6af,x
$11:d38a  58            cli
$11:d38b  d0 c4         bne $d351
$11:d38d  7b            tdc
$11:d38e  12 8a         ora ($8a)
$11:d390  e4 32         cpx $32
$11:d392  e1 08         sbc ($08,x)
$11:d394  86 4d         stx $4d
$11:d396  2d d0 69      and $69d0
$11:d399  c4 13         cpy $13
$11:d39b  0f ff e7 7f   ora $7fe7ff
$11:d39f  f8            sed
$11:d3a0  ff ff 1f ff   sbc $ff1fff,x
$11:d3a4  ce e4 1f      dec $1fe4
$11:d3a7  8f ff e7 ff   sta $ffe7ff
$11:d3ab  a6 d3         ldx $d3
$11:d3ad  fc 9f ef      jsr ($ef9f,x)
$11:d3b0  97 ff         sta [$ff],y
$11:d3b2  fb            xce
$11:d3b3  ff bc 5f ef   sbc $ef5fbc,x
$11:d3b7  97 f9         sta [$f9],y
$11:d3b9  f4 fe fd      pea $fdfe
$11:d3bc  7f d8 17 d4   adc $d417d8,x
$11:d3c0  88            dey
$11:d3c1  04 40         tsb $40
$11:d3c3  e0 10 c7      cpx #$c710
$11:d3c6  a5 fc         lda $fc
$11:d3c8  c3 5e         cmp $5e,s
$11:d3ca  68            pla
$11:d3cb  73 cf         adc ($cf,s),y
$11:d3cd  1c 73 45      trb $4573
$11:d3d0  9d a8 f3      sta $f3a8,x
$11:d3d3  a6 1c         ldx $1c
$11:d3d5  f9 47 9c      sbc $9c47,y
$11:d3d8  bd dc 68      lda $68dc,x
$11:d3db  05 ce         ora $ce
$11:d3dd  01 39         ora ($39,x)
$11:d3df  c0 77 20      cpy #$2077
$11:d3e2  1c e9 07      trb $07e9
$11:d3e5  8e 21 35      stx $3521
$11:d3e8  e4 5e         cpx $5e
$11:d3ea  b0 90         bcs $d37c
$11:d3ec  0b            phd
$11:d3ed  e1 68         sbc ($68,x)
$11:d3ef  7b            tdc
$11:d3f0  f0 0f         beq $d401
$11:d3f2  7c 03 ee      jmp ($ee03,x)
$11:d3f5  5e 1f dc      lsr $dc1f,x
$11:d3f8  03 fb         ora $fb,s
$11:d3fa  00 27         brk #$27
$11:d3fc  8e 02 01      stx $0102
$11:d3ff  40            rti
$11:d400  80 58         bra $d45a
$11:d402  20 13 08      jsr $0813
$11:d405  06 62         asl $62
$11:d407  01 cc         ora ($cc,x)
$11:d409  27 91         and [$91]
$11:d40b  3d 16 e9      and $e916,x
$11:d40e  f8            sed
$11:d40f  93 f9         sta ($f9,s),y
$11:d411  a1 b6         lda ($b6,x)
$11:d413  5c b4 d2 37   jml $37d2b4
$11:d417  99 ff 70      sta $70ff,y
$11:d41a  36 5a         rol $5a,x
$11:d41c  4c 7e 02      jmp $027e
$11:d41f  49 a2 8c      eor #$8ca2
$11:d422  40            rti
$11:d423  33 50         and ($50,s),y
$11:d425  0e 5c 02      asl $025c
$11:d428  cd 00 9f      cmp $9f00
$11:d42b  c0 2b f0      cpy #$f02b
$11:d42e  0b            phd
$11:d42f  fa            plx
$11:d430  20 62 56      jsr $5662
$11:d433  ad 4d f3      lda $f34d
$11:d436  81 7c         sta ($7c,x)
$11:d438  ab            plb
$11:d439  5f a5 33 0e   eor $0e33a5,x
$11:d43d  55 d2         eor $d2,x
$11:d43f  2b            pld
$11:d440  7c f5 58      jmp ($58f5,x)
$11:d443  20 9f f8      jsr $f89f
$11:d446  15 fd         ora $fd,x
$11:d448  42 00         wdm #$00
$11:d44a  30 a3         bmi $d3ef
$11:d44c  28            plp
$11:d44d  01 50         ora ($50,x)
$11:d44f  31 eb         and ($eb),y
$11:d451  fe 2e 87      inc $872e,x
$11:d454  25 f2         and $f2
$11:d456  44 f6 15      mvp $15,$f6
$11:d459  48            pha
$11:d45a  5f b7 91 b5   eor $b591b7,x
$11:d45e  ba            tsx
$11:d45f  fe e3 79      inc $79e3,x
$11:d462  6b            rtl
$11:d463  b4 f2         ldy $f2,x
$11:d465  01 1b         ora ($1b,x)
$11:d467  80 53         bra $d4bc
$11:d469  c0 63 37      cpy #$3763
$11:d46c  80 42         bra $d4b0
$11:d46e  a0 12 48      ldy #$4812
$11:d471  04 26         tsb $26
$11:d473  01 aa         ora ($aa,x)
$11:d475  d1 fd         cmp ($fd),y
$11:d477  b0 77         bcs $d4f0
$11:d479  88            dey
$11:d47a  2c a2 2b      bit $2ba2
$11:d47d  d2 c9         cmp ($c9)
$11:d47f  c4 b0         cpy $b0
$11:d481  73 ad         adc ($ad,s),y
$11:d483  de 82 ff      dec $ff82,x
$11:d486  5c 1f 8f f9   jml $f98f1f
$11:d48a  c4 36         cpy $36
$11:d48c  c1 f8         cmp ($f8,x)
$11:d48e  d1 09         cmp ($09),y
$11:d490  e3 35         sbc $35,s
$11:d492  c1 f3         cmp ($f3,x)
$11:d494  60            rts
$11:d495  91 4e         sta ($4e),y
$11:d497  8d 47 03      sta $0347
$11:d49a  97 9c         sta [$9c],y
$11:d49c  52 b9         eor ($b9)
$11:d49e  5d 5a ac      eor $ac5a,x
$11:d4a1  ab            plb
$11:d4a2  fe 8b 0b      inc $0b8b,x
$11:d4a5  dc 02 dd      jml [$dd02]
$11:d4a8  00 bf         brk #$bf
$11:d4aa  22 86 6b 00   jsl $006b86
$11:d4ae  95 13         sta $13,x
$11:d4b0  c6 5d         dec $5d
$11:d4b2  e0 93 78      cpx #$7893
$11:d4b5  22 97 08 85   jsl $850897
$11:d4b9  c2 1b         rep #$1b
$11:d4bb  3d 81 c7      and $c781,x
$11:d4be  e0 10 78      cpx #$7810
$11:d4c1  04 04         tsb $04
$11:d4c3  34 01         bit $01,x
$11:d4c5  a0 87 88      ldy #$8887
$11:d4c8  86 04         stx $04
$11:d4ca  5e 53 40      lsr $4053,x
$11:d4cd  61 60         adc ($60,x)
$11:d4cf  b9 d8 ee      lda $eed8,y
$11:d4d2  7e 3f 3f      ror $3f3f,x
$11:d4d5  1b            tcs
$11:d4d6  8d fe ff      sta $fffe
$11:d4d9  80 ff         bra $d4da
$11:d4db  ff e0 1f a8   sbc $a81fe0,x
$11:d4df  07 88         ora [$88]
$11:d4e1  d2 26         cmp ($26)
$11:d4e3  80 34         bra $d519
$11:d4e5  01 98         ora ($98,x)
$11:d4e7  05 81         ora $81
$11:d4e9  09 80 93      ora #$9380
$11:d4ec  c3 03         cmp $03,s
$11:d4ee  81 f1         sta ($f1,x)
$11:d4f0  f8            sed
$11:d4f1  fe df 72      inc $72df,x
$11:d4f4  b8            clv
$11:d4f5  7f 07 e1 ff   adc $ffe107,x
$11:d4f9  71 90         adc ($90),y
$11:d4fb  14 23         trb $23
$11:d4fd  90 08         bcc $d507
$11:d4ff  41 98         eor ($98,x)
$11:d501  4d 45 fa      eor $fa45
$11:d504  ee 76 7f      inc $7f76
$11:d507  ff 8e f7 6f   sbc $6ff78e,x
$11:d50b  fb            xce
$11:d50c  fb            xce
$11:d50d  ee 9d 43      inc $439d
$11:d510  f3 dd         sbc ($dd,s),y
$11:d512  ec ff 3c      cpx $3cff
$11:d515  38            sec
$11:d516  3f 06 0c fe   and $fe0c06,x
$11:d51a  48            pha
$11:d51b  56 f5         lsr $f5,x
$11:d51d  c1 3f         cmp ($3f,x)
$11:d51f  30 6e         bmi $d58f
$11:d521  a4 2f         ldy $2f
$11:d523  b3 06         lda ($06,s),y
$11:d525  f7 40         sbc [$40],y
$11:d527  4b            phk
$11:d528  81 f3         sta ($f3,x)
$11:d52a  86 79         stx $79
$11:d52c  a0 37 f7      ldy #$f737
$11:d52f  f0 28         beq $d559
$11:d531  2f e1 00 fc   and $fc00e1
$11:d535  40            rti
$11:d536  3e 30 1f      rol $1f30,x
$11:d539  e2 c0         sep #$c0
$11:d53b  7e 8b 01      ror $018b,x
$11:d53e  58            cli
$11:d53f  80 f8         bra $d539
$11:d541  07 c1         ora [$c1]
$11:d543  fe 5f 93      inc $935f,x
$11:d546  11 62         ora ($62),y
$11:d548  d0 a8         bne $d4f2
$11:d54a  3c 4f 39      bit $394f,x
$11:d54d  82 a1 d3      brl $a8f1
$11:d550  61 70         adc ($70,x)
$11:d552  1a            inc a
$11:d553  7d 06 51      adc $5106,x
$11:d556  27 82         and [$82]
$11:d558  ac 80 e4      ldy $e480
$11:d55b  1f fb cf ff   ora $ffcffb,x
$11:d55f  71 ff         adc ($ff),y
$11:d561  2d 86 f3      and $f386
$11:d564  ff dc 61 0c   sbc $0c61dc,x
$11:d568  7e 3f 3e      ror $3e3f,x
$11:d56b  9f c3 e1 ee   sta $eee1c3,x
$11:d56f  f0 c7         beq $d538
$11:d571  e3 e0         sbc $e0,s
$11:d573  f0 77         beq $d5ec
$11:d575  b8            clv
$11:d576  71 f8         adc ($f8),y
$11:d578  fe 0f ff      inc $ff0f,x
$11:d57b  01 5c         ora ($5c,x)
$11:d57d  1f f7 f8 5c   ora $5cf8f7,x
$11:d581  1c 02 07      trb $0702
$11:d584  09 c7 fe      ora #$fec7
$11:d587  39 e3 8b      and $8be3,y
$11:d58a  7c 71 df      jmp ($df71,x)
$11:d58d  18            clc
$11:d58e  57 e7         eor [$e7],y
$11:d590  0f f8 e2 ff   ora $ffe2f8
$11:d594  3c 7f ce      bit $ce7f,x
$11:d597  11 7c         ora ($7c),y
$11:d599  0b            phd
$11:d59a  82 1f a8      brl $7dbc
$11:d59d  f7 82         sbc [$82],y
$11:d59f  5b            tcd
$11:d5a0  d2 87         cmp ($87)
$11:d5a2  7c 63 fe      jmp ($fe63,x)
$11:d5a5  08            php
$11:d5a6  3f e2 07 fc   and $fc07e2,x
$11:d5aa  1b            tcs
$11:d5ab  86 04         stx $04
$11:d5ad  c6 05         dec $05
$11:d5af  c0 0f 5d      cpy #$5d0f
$11:d5b2  b2 01         lda ($01)
$11:d5b4  66 80         ror $80
$11:d5b6  4c e0 1b      jmp $1be0
$11:d5b9  b8            clv
$11:d5ba  04 67         tsb $67
$11:d5bc  01 dc         ora ($dc,x)
$11:d5be  80 6b         bra $d62b
$11:d5c0  28            plp
$11:d5c1  1c e8 04      trb $04e8
$11:d5c4  01 62         ora ($62,x)
$11:d5c6  0b            phd
$11:d5c7  50 21         bvc $d5ea
$11:d5c9  00 f8         brk #$f8
$11:d5cb  b7 f0         lda [$f0],y
$11:d5cd  0e f8 fc      asl $fcf8
$11:d5d0  4d eb 80      eor $80eb
$11:d5d3  80 70         bra $d645
$11:d5d5  0f 03 60 37   ora $376003
$11:d5d9  b1 cd         lda ($cd),y
$11:d5db  0e e3 12      asl $12e3
$11:d5de  c0 42 2e      cpy #$2e42
$11:d5e1  d8            cld
$11:d5e2  39 f7 2e      and $2ef7,y
$11:d5e5  2d e4 86      and $86e4
$11:d5e8  54 70 9f      mvn $9f,$70
$11:d5eb  98            tya
$11:d5ec  17 63         ora [$63],y
$11:d5ee  4b            phk
$11:d5ef  00 bf         brk #$bf
$11:d5f1  e0 27 fc      cpx #$fc27
$11:d5f4  01 a8         ora ($a8,x)
$11:d5f6  43 fe         eor $fe,s
$11:d5f8  50 7f         bvc $d679
$11:d5fa  d0 e4         bne $d5e0
$11:d5fc  20 23 e0      jsr $e023
$11:d5ff  89 5a f5      bit #$f55a
$11:d602  17 ee         ora [$ee],y
$11:d604  0d f2 a7      ora $a7f2
$11:d607  78            sei
$11:d608  93 cc         sta ($cc,s),y
$11:d60a  39 56 18      and $1856,y
$11:d60d  fd 02 37      sbc $3702,x
$11:d610  a5 82         lda $82
$11:d612  7f a0 37 c8   adc $c837a0,x
$11:d616  1d e2 0f      ora $0fe2,x
$11:d619  f0 a7         beq $d5c2
$11:d61b  f8            sed
$11:d61c  23 fc         and $fc,s
$11:d61e  09 fe 00      ora #$00fe
$11:d621  7c 18 9a      jmp ($9a18,x)
$11:d624  0c 9e cb      tsb $cb9e
$11:d627  95 99         sta $99,x
$11:d629  ec a9 96      cpx $96a9
$11:d62c  d8            cld
$11:d62d  1e 4b 23      asl $234b,x
$11:d630  29 96 77      and #$7796
$11:d633  7b            tdc
$11:d634  93 e8         sta ($e8,s),y
$11:d636  06 6a         asl $6a
$11:d638  00 5d         brk #$5d
$11:d63a  02 01         cop #$01
$11:d63c  5b            tcd
$11:d63d  a0 1d 68      ldy #$681d
$11:d640  04 88         tsb $88
$11:d642  c2 33         rep #$33
$11:d644  ce 05 e3      dec $e305
$11:d647  01 e7         ora ($e7,x)
$11:d649  82 4f a4      brl $7a9b
$11:d64c  5f 18 87 ab   eor $ab8718,x
$11:d650  c3 bc         cmp $bc,s
$11:d652  d1 c0         cmp ($c0),y
$11:d654  2f e2 02 30   and $3002e2
$11:d658  07 06         ora [$06]
$11:d65a  01 0f         ora ($0f,x)
$11:d65c  80 47         bra $d6a5
$11:d65e  e0 15 f8      cpx #$f815
$11:d661  05 39         ora $39
$11:d663  e0 12 4f      cpx #$4f12
$11:d666  b6 43         ldx $43,y
$11:d668  ab            plb
$11:d669  4a            lsr a
$11:d66a  b2 47         lda ($47)
$11:d66c  eb            xba
$11:d66d  5b            tcd
$11:d66e  fb            xce
$11:d66f  77 ff         adc [$ff],y
$11:d671  da            phx
$11:d672  c0 0f c7      cpy #$c70f
$11:d675  0c 10 33      tsb $3310
$11:d678  f8            sed
$11:d679  01 11         ora ($11,x)
$11:d67b  b3 9f         lda ($9f,s),y
$11:d67d  08            php
$11:d67e  87 d2         sta [$d2]
$11:d680  11 fc         ora ($fc),y
$11:d682  b2 7f         lda ($7f)
$11:d684  26 93         rol $93
$11:d686  ce a4 72      dec $72a4
$11:d689  31 9c         and ($9c),y
$11:d68b  e4 43         cpx $43
$11:d68d  21 10         and ($10,x)
$11:d68f  01 f8         ora ($f8,x)
$11:d691  10 88         bpl $d61b
$11:d693  f2 1e         sbc ($1e)
$11:d695  02 40         cop #$40
$11:d697  fc 0f 81      jsr ($810f,x)
$11:d69a  80 84         bra $d620
$11:d69c  d2 72         cmp ($72)
$11:d69e  f3 7e         sbc ($7e,s),y
$11:d6a0  44 5f cd      mvp $cd,$5f
$11:d6a3  09 a8 61      ora #$61a8
$11:d6a6  3f 09 c1 bf   and $bfc109,x
$11:d6aa  df f6 d3 fe   cmp $fed3f6,x
$11:d6ae  44 7f df      mvp $df,$7f
$11:d6b1  0f fb c1 ff   ora $ffc1fb
$11:d6b5  70 3f         bvs $d6f6
$11:d6b7  ea            nop
$11:d6b8  b0 60         bcs $d71a
$11:d6ba  3f fa 97 43   and $4397fa,x
$11:d6be  6b            rtl
$11:d6bf  8b            phb
$11:d6c0  81 68         sta ($68,x)
$11:d6c2  34 98         bit $98,x
$11:d6c4  ef 6f 3f 4d   sbc $4d3f6f
$11:d6c8  9c a0 81      stz $81a0
$11:d6cb  c2 01         rep #$01
$11:d6cd  2f 80 33 42   and $423380
$11:d6d1  ff 00 b9 c0   sbc $c0b900,x
$11:d6d5  26 48         rol $48
$11:d6d7  41 6f         eor ($6f,x)
$11:d6d9  87 76         sta [$76]
$11:d6db  01 db         ora ($db,x)
$11:d6dd  82 7c 61      brl $385c
$11:d6e0  dd 88 3f      cmp $3f88,x
$11:d6e3  66 0d         ror $0d
$11:d6e5  d0 87         bne $d66e
$11:d6e7  a5 c3         lda $c3
$11:d6e9  f9 03 00      sbc $0003,y
$11:d6ec  02 7f         cop #$7f
$11:d6ee  1d e0 05      ora $05e0,x
$11:d6f1  07 78         ora [$78]
$11:d6f3  39 c1 de      and $dec1,y
$11:d6f6  0a            asl a
$11:d6f7  f4 ff af      pea $afff
$11:d6fa  f6 0f         inc $0f,x
$11:d6fc  00 90         brk #$90
$11:d6fe  c8            iny
$11:d6ff  a6 f3         ldx $f3
$11:d701  08            php
$11:d702  84 4e         sty $4e
$11:d704  05 00         ora $00
$11:d706  b0 d8         bcs $d6e0
$11:d708  22 51 18 1a   jsl $1a1851
$11:d70c  d0 3f         bne $d74d
$11:d70e  fd ef ff      sbc $ffef,x
$11:d711  3b            tsc
$11:d712  ff ee 5f 8e   sbc $8e5fee,x
$11:d716  7f ff ef 5f   adc $5fefff,x
$11:d71a  8c 0f 07      sty $070f
$11:d71d  c7 e3         cmp [$e3]
$11:d71f  d0 f8         bne $d719
$11:d721  7c 1a 0f      jmp ($0f1a,x)
$11:d724  8e c7 c0      stx $c0c7
$11:d727  a0 68 6c      ldy #$6c68
$11:d72a  32 0f         and ($0f)
$11:d72c  05 f3         ora $f3
$11:d72e  ff 38 ff cf   sbc $cfff38,x
$11:d732  3f f3 ef fc   and $fceff3,x
$11:d736  73 ff         adc ($ff,s),y
$11:d738  3f ff c7 bf   and $bfc7ff,x
$11:d73c  f1 ff         sbc ($ff),y
$11:d73e  ff c7 fd f1   sbc $f1fdc7,x
$11:d742  ff fe 7f ff   sbc $ff7ffe,x
$11:d746  0f ff e3 ff   ora $ffe3ff
$11:d74a  fc 0b 1a      jsr ($1a0b,x)
$11:d74d  f8            sed
$11:d74e  03 f9         ora $f9,s
$11:d750  81 bf         sta ($bf,x)
$11:d752  50 e7         bvc $d73b
$11:d754  94 09         sty $09,x
$11:d756  ff 02 7f a0   sbc $a07f02,x
$11:d75a  cf 8d c2 c1   cmp $c1c28d
$11:d75e  9f a8 73 c3   sta $c373a8,x
$11:d762  fd d6 90      sbc $90d6,x
$11:d765  7c e0 1e      jmp ($1ee0,x)
$11:d768  b8            clv
$11:d769  85 e7         sta $e7
$11:d76b  01 f5         ora ($f5,x)
$11:d76d  84 4f         sty $4f
$11:d76f  38            sec
$11:d770  13 ae         ora ($ae,s),y
$11:d772  24 7b         bit $7b
$11:d774  c1 00         cmp ($00,x)
$11:d776  f7 87         sbc [$87],y
$11:d778  c7 ef         cmp [$ef]
$11:d77a  00 0f         brk #$0f
$11:d77c  07 ec         ora [$ec]
$11:d77e  ca            dex
$11:d77f  3f d3 28 4c   and $4c28d3,x
$11:d783  20 06 f0      jsr $f006
$11:d786  8c 40 31      sty $3140
$11:d789  87 41         sta [$41]
$11:d78b  e3 40         sbc $40,s
$11:d78d  3c 70 0b      bit $0b70,x
$11:d790  1c 02 00      trb $0002
$11:d793  5e 02 f0      lsr $f002,x
$11:d796  7c 20 0b      jmp ($0b20,x)
$11:d799  b0 58         bcs $d7f3
$11:d79b  a3 7c         lda $7c,s
$11:d79d  20 01 e0      jsr $e001
$11:d7a0  e9 4f fa      sbc #$fa4f
$11:d7a3  52 dd         eor ($dd)
$11:d7a5  4d a7 ef      eor $efa7
$11:d7a8  08            php
$11:d7a9  d6 a4         dec $a4,x
$11:d7ab  05 3c         ora $3c
$11:d7ad  33 f8         and ($f8,s),y
$11:d7af  05 fd         ora $fd
$11:d7b1  46 11         lsr $11
$11:d7b3  65 20         adc $20
$11:d7b5  a8            tay
$11:d7b6  c5 06         cmp $06
$11:d7b8  39 7b 47      and $477b,y
$11:d7bb  0a            asl a
$11:d7bc  7b            tdc
$11:d7bd  e0 8f 8d      cpx #$8d8f
$11:d7c0  43 01         eor $01,s
$11:d7c2  7f 5a 92 40   adc $40925a,x
$11:d7c6  43 d9         eor $d9,s
$11:d7c8  00 d0         brk #$d0
$11:d7ca  21 46         and ($46,x)
$11:d7cc  bb            tyx
$11:d7cd  a0 83 fe      ldy #$fe83
$11:d7d0  21 ff         and ($ff,x)
$11:d7d2  06 b9         asl $b9
$11:d7d4  2f fa 25 8f   and $8f25fa
$11:d7d8  99 e3 e2      sta $e2e3,y
$11:d7db  b4 f8         ldy $f8,x
$11:d7dd  bd 3e 07      lda $073e,x
$11:d7e0  2f 85 c9 e0   and $e0c985
$11:d7e4  b1 37         lda ($37),y
$11:d7e6  d8            cld
$11:d7e7  2a            rol a
$11:d7e8  09 44 0a      ora #$0a44
$11:d7eb  20 8f 81      jsr $818f
$11:d7ee  86 1e         stx $1e
$11:d7f0  0a            asl a
$11:d7f1  14 e8         trb $e8
$11:d7f3  0f 82 6f c0   ora $c06f82
$11:d7f7  a8            tay
$11:d7f8  e8            inx
$11:d7f9  35 bb         and $bb,x
$11:d7fb  0e bc 83      asl $83bc
$11:d7fe  5e 9c 44      lsr $449c,x
$11:d801  21 7f         and ($7f,x)
$11:d803  a8            tay
$11:d804  08            php
$11:d805  c0 44 02      cpy #$0244
$11:d808  10 20         bpl $d82a
$11:d80a  15 8c         ora $8c,x
$11:d80c  e4 03         cpx $03
$11:d80e  99 68 d6      sta $d668,y
$11:d811  46 3b         lsr $3b
$11:d813  94 0c         sty $0c,x
$11:d815  64 23         stz $23
$11:d817  99 48 1c      sta $1c48,y
$11:d81a  0a            asl a
$11:d81b  08            php
$11:d81c  ba            tsx
$11:d81d  10 04         bpl $d823
$11:d81f  11 11         ora ($11),y
$11:d821  d2 07         cmp ($07)
$11:d823  84 83         sty $83
$11:d825  8d c2 47      sta $47c2
$11:d828  cf 88 78 e1   cmp $e17888
$11:d82c  95 1c         sta $1c,x
$11:d82e  37 e2         and [$e2],y
$11:d830  07 d8         ora [$d8]
$11:d832  d2 df         cmp ($df)
$11:d834  af fb e9 ff   lda $ffe9fb
$11:d838  7a            ply
$11:d839  3f ee 87 fd   and $fd87ee,x
$11:d83d  a0 ff a8      ldy #$a8ff
$11:d840  1f f2 03 7e   ora $7e03f2,x
$11:d844  67 86         adc [$86]
$11:d846  02 ad         cop #$ad
$11:d848  b6 95         ldx $95,y
$11:d84a  47 65         eor [$65]
$11:d84c  59 79 ae      eor $ae79,y
$11:d84f  2a            rol a
$11:d850  01 c0         ora ($c0,x)
$11:d852  5f 96 03 ff   eor $ff0396,x
$11:d856  89 3e 19      bit #$193e
$11:d859  fc 38 1f      jsr ($1f38,x)
$11:d85c  f4 51 77      pea $7751
$11:d85f  0b            phd
$11:d860  81 07         sta ($07,x)
$11:d862  ec c1 bf      cpx $bfc1
$11:d865  90 34         bcc $d89b
$11:d867  98            tya
$11:d868  7b            tdc
$11:d869  e4 1d         cpx $1d
$11:d86b  39 87 76      and $7687,y
$11:d86e  3f 7f ff a7   and $a7ff7f,x
$11:d872  da            phx
$11:d873  bf ff a7 ff   lda $ffa7ff,x
$11:d877  ec 1f fb      cpx $fb1f
$11:d87a  f6 03         inc $03,x
$11:d87c  f9 00 57      sbc $5700,y
$11:d87f  80 a0         bra $d821
$11:d881  37 b4         and [$b4],y
$11:d883  01 50         ora ($50,x)
$11:d885  1e 83 71      asl $7183,x
$11:d888  f8            sed
$11:d889  45 1a         eor $1a
$11:d88b  fd e0 ff      sbc $ffe0,x
$11:d88e  f8            sed
$11:d88f  09 b8 20      ora #$20b8
$11:d892  30 28         bmi $d8bc
$11:d894  0c a6 51      tsb $51a6
$11:d897  5f ae 4e 67   eor $674eae,x
$11:d89b  1f ef f4 b6   ora $b6f4ef,x
$11:d89f  7e bf 4e      ror $4ebf,x
$11:d8a2  bf ff 47 ff   lda $ff47ff,x
$11:d8a6  e3 b3         sbc $b3,s
$11:d8a8  81 10         sta ($10,x)
$11:d8aa  37 19         and [$19],y
$11:d8ac  8f 02 41 f0   sta $f04102
$11:d8b0  98            tya
$11:d8b1  3c 42 21      bit $2142,x
$11:d8b4  70 96         bvs $d84c
$11:d8b6  d7 74         cmp [$74],y
$11:d8b8  7d f8 47      adc $47f8,x
$11:d8bb  5f 1d ff cf   eor $cfff1d,x
$11:d8bf  ff f1 e0 03   sbc $03e0f1,x
$11:d8c3  c1 1f         cmp ($1f,x)
$11:d8c5  06 41         asl $41
$11:d8c7  ff ff 7f ff   sbc $ff7fff,x
$11:d8cb  a0 e1 bf      ldy #$bfe1
$11:d8ce  df c1 e1 3f   cmp $3fe1c1,x
$11:d8d2  9f fa 3f fd   sta $fd3ffa,x
$11:d8d6  89 39 ec      bit #$ec39
$11:d8d9  8f a4 7b 04   sta $047ba4
$11:d8dd  48            pha
$11:d8de  1e ca b1      asl $b1ca,x
$11:d8e1  c7 98         cmp [$98]
$11:d8e3  73 e5         adc ($e5,s),y
$11:d8e5  1e 79 67      asl $6779,x
$11:d8e8  8e 31 e7      stx $e731
$11:d8eb  8a            txa
$11:d8ec  7c e0 df      jmp ($dfe0,x)
$11:d8ef  1e 7c c0      asl $c07c,x
$11:d8f2  3e 83 f7      rol $f783,x
$11:d8f5  fd df 70      sbc $70df,x
$11:d8f8  51 ff         eor ($ff),y
$11:d8fa  04 3b         tsb $3b
$11:d8fc  e2 6a         sep #$6a
$11:d8fe  08            php
$11:d8ff  3f e0 ae 05   and $05aee0,x
$11:d903  50 9e         bvc $d8a3
$11:d905  b4 01         ldy $01,x
$11:d907  6a            ror a
$11:d908  04 0b         tsb $0b
$11:d90a  b8            clv
$11:d90b  c0 26 30      cpy #$3026
$11:d90e  0d c4 03      ora $03c4
$11:d911  31 00         and ($00),y
$11:d913  ae 60 39      ldx $3960
$11:d916  90 09         bcc $d921
$11:d918  05 02         ora $02
$11:d91a  5e d0 03      lsr $03d0,x
$11:d91d  60            rts
$11:d91e  c0 2f e2      cpy #$e22f
$11:d921  b1 df         lda ($df),y
$11:d923  8a            txa
$11:d924  c7 bf         cmp [$bf]
$11:d926  00 f8         brk #$f8
$11:d928  60            rts
$11:d929  20 08 f0      jsr $f008
$11:d92c  5d 82 ec      eor $ec82,x
$11:d92f  2c 09 61      bit $6109
$11:d932  1f 05 c1 a0   ora $a0c105,x
$11:d936  09 e2         ora #$e2
$11:d938  47 b7         eor [$b7]
$11:d93a  81 4a         sta ($4a,x)
$11:d93c  1e 78 06      asl $0678,x
$11:d93f  c2 81         rep #$81
$11:d941  f2 a0         sbc ($a0)
$11:d943  65 ec         adc $ec
$11:d945  13 2f         ora ($2f,s),y
$11:d947  06 ce         asl $ce
$11:d949  c1 f7         cmp ($f7,x)
$11:d94b  b0 6d         bcs $d9ba
$11:d94d  d2 e1         cmp ($e1)
$11:d94f  f8            sed
$11:d950  80 7b         bra $d9cd
$11:d952  d8            cld
$11:d953  35 fd         and $fd,x
$11:d955  80 77         bra $d9ce
$11:d957  60            rts
$11:d958  15 58         ora $58,x
$11:d95a  04 0e         tsb $0e
$11:d95c  01 87         ora ($87,x)
$11:d95e  80 70         bra $d9d0
$11:d960  60            rts
$11:d961  58            cli
$11:d962  58            cli
$11:d963  14 06         trb $06
$11:d965  05 00         ora $00
$11:d967  6f 04 8a 01   adc $018a04
$11:d96b  aa            tax
$11:d96c  2f 8b 99 60   and $60998b
$11:d970  50 97         bvc $d909
$11:d972  78            sei
$11:d973  40            rti
$11:d974  60            rts
$11:d975  8f 30 6f 8b   sta $8b6f30
$11:d979  78            sei
$11:d97a  20 2f b0      jsr $b02f
$11:d97d  83 c0         sta $c0,s
$11:d97f  1f e0 d5 06   ora $06d5e0,x
$11:d983  a8            tay
$11:d984  3f 05 44 00   and $004405,x
$11:d988  a1 dc         lda ($dc,x)
$11:d98a  ff be bf eb   sbc $ebbfbe,x
$11:d98e  e7 fe         sbc [$fe]
$11:d990  b3 fe         lda ($fe,s),y
$11:d992  9f ff 37 d7   sta $d737ff,x
$11:d996  d8            cld
$11:d997  dd f2 b7      cmp $b7f2,x
$11:d99a  3c 41 00      bit $0041,x
$11:d99d  7f 35 1c ca   adc $ca1c35,x
$11:d9a1  86 12         stx $12
$11:d9a3  51 28         eor ($28),y
$11:d9a5  e8            inx
$11:d9a6  76 26         ror $26,x
$11:d9a8  17 8b         ora [$8b],y
$11:d9aa  05 a2         ora $a2
$11:d9ac  a1 58         lda ($58,x)
$11:d9ae  98            tya
$11:d9af  4e 3e 0b      lsr $0b3e
$11:d9b2  f1 e8         sbc ($e8),y
$11:d9b4  1e 81 4a      asl $4a81,x
$11:d9b7  39 08 06      and $0608,y
$11:d9ba  81 28         sta ($28,x)
$11:d9bc  34 0e         bit $0e,x
$11:d9be  04 86         tsb $86
$11:d9c0  c3 80         cmp $80,s
$11:d9c2  90 70         bcc $da34
$11:d9c4  22 1e 18 48   jsl $48181e
$11:d9c8  c4 3f         cpy $3f
$11:d9ca  10 2e         bpl $d9fa
$11:d9cc  c6 96         dec $96
$11:d9ce  7f 7f cf 4f   adc $4fcf7f,x
$11:d9d2  fb            xce
$11:d9d3  f1 ff         sbc ($ff),y
$11:d9d5  7c 3f ed      jmp ($ed3f,x)
$11:d9d8  07 fd         ora [$fd]
$11:d9da  c0 ff b0      cpy #$b0ff
$11:d9dd  1b            tcs
$11:d9de  f2 0c         sbc ($0c)
$11:d9e0  3f e5 f0 cf   and $cff0e5,x
$11:d9e4  cf f9 f1 ff   cmp $fff1f9
$11:d9e8  3c 3f a7      bit $a73f,x
$11:d9eb  07 cc         ora [$cc]
$11:d9ed  d8            cld
$11:d9ee  ed 16 93      sbc $9316
$11:d9f1  70 60         bvs $da53
$11:d9f3  27 fc         and [$fc]
$11:d9f5  08            php
$11:d9f6  ff 82 1f f0   sbc $f01f82,x
$11:d9fa  83 fe         sta $fe,s
$11:d9fc  20 7f c8      jsr $c87f
$11:d9ff  0e 5a 01      asl $015a
$11:da02  77 c0         adc [$c0],y
$11:da04  20 02 c7      jsr $c702
$11:da07  80 87         bra $d990
$11:da09  f0 39         beq $da44
$11:da0b  98            tya
$11:da0c  3e ce 1b      rol $1bce,x
$11:da0f  b1 83         lda ($83),y
$11:da11  e4 61         cpx $61
$11:da13  cd e0 9f      cmp $9fe0
$11:da16  c4 40         cpy $40
$11:da18  07 c2         ora [$c2]
$11:da1a  fe 20 14      inc $1420,x
$11:da1d  00 07         brk #$07
$11:da1f  c1 d8         cmp ($d8,x)
$11:da21  17 b5         ora [$b5],y
$11:da23  c0 2f f6      cpy #$f62f
$11:da26  7b            tdc
$11:da27  c2 f9         rep #$f9
$11:da29  93 07         sta ($07,s),y
$11:da2b  0d 06 80      ora $8006
$11:da2e  82 47 01      brl $db78
$11:da31  00 e1         brk #$e1
$11:da33  40            rti
$11:da34  97 e9         sta [$e9],y
$11:da36  f9 ff ff      sbc $ffff,y
$11:da39  97 e7         sta [$e7],y
$11:da3b  fd ff d9      sbc $d9ff,x
$11:da3e  e4 1a         cpx $1a
$11:da40  89 c7 b2      bit #$b2c7
$11:da43  79 58 84      adc $8458,y
$11:da46  54 21 1f      mvn $1f,$21
$11:da49  48            pha
$11:da4a  67 12         adc [$12]
$11:da4c  79 16 b7      adc $b716,y
$11:da4f  77 ff         adc [$ff],y
$11:da51  fc 7f ff      jsr ($ff7f,x)
$11:da54  0f ff e7 02   ora $02e7ff
$11:da58  0f 8c 10 3e   ora $3e108c
$11:da5c  1f fc 4a 05   ora $054afc,x
$11:da60  3f 2f 85 fc   and $fc852f,x
$11:da64  22 11 f8 f8   jsl $f8f811
$11:da68  54 a1 f0      mvn $f0,$a1
$11:da6b  f7 68         sbc [$68],y
$11:da6d  70 3f         bvs $daae
$11:da6f  eb            xba
$11:da70  80 10         bra $da82
$11:da72  87 80         sta [$80]
$11:da74  48            pha
$11:da75  7f 0f fc 4e   adc $4efc0f,x
$11:da79  3f e3 fa 63   and $63fae3,x
$11:da7d  bf 3c 1f e6   lda $e61f3c,x
$11:da81  17 f9         ora [$f9],y
$11:da83  c1 fc         cmp ($fc,x)
$11:da85  69 ff 9c      adc #$9cff
$11:da88  0f f0 9c 21   ora $219cf0
$11:da8c  0b            phd
$11:da8d  90 21         bcc $dab0
$11:da8f  1c 10 84      trb $8410
$11:da92  7e d1 10      ror $10d1,x
$11:da95  5f e0 2b b0   eor $b02be0,x
$11:da99  28            plp
$11:da9a  0e 22 ef      asl $ef22
$11:da9d  43 de         eor $de,s
$11:da9f  24 00         bit $00
$11:daa1  86 85         stx $85
$11:daa3  f8            sed
$11:daa4  99 f3 3a      sta $3af3,y
$11:daa7  72 0f         adc ($0f)
$11:daa9  5c 43 d3 10   jml $10d343
$11:daad  ba            tsx
$11:daae  e2 3e         sep #$3e
$11:dab0  90 89         bcc $da3b
$11:dab2  d7 12         cmp [$12],y
$11:dab4  f5 84         sbc $84,x
$11:dab6  21 9f         and ($9f,x)
$11:dab8  dd 68 3f      cmp $3f68,x
$11:dabb  b5 a0         lda $a0,x
$11:dabd  ff 56 81 e8   sbc $e88156,x
$11:dac1  80 46         bra $db09
$11:dac3  20 10 c8      jsr $c810
$11:dac6  06 31         asl $31
$11:dac8  a8            tay
$11:dac9  10 0e         bpl $dad9
$11:dacb  34 03         bit $03,x
$11:dacd  87 00         sta [$00]
$11:dacf  b1 b6         lda ($b6),y
$11:dad1  43 e0         eor $e0,s
$11:dad3  9f 1f c2 8c   sta $8cc21f,x
$11:dad7  7f 8a 71 2a   adc $2a718a,x
$11:dadb  03 9c         ora $9c,s
$11:dadd  20 12 b8      jsr $b812
$11:dae0  86 46         stx $46
$11:dae2  01 56         ora ($56,x)
$11:dae4  9c 37 c3      stz $c337
$11:dae7  97 34         sta [$34],y
$11:dae9  bb            tyx
$11:daea  eb            xba
$11:daeb  2a            rol a
$11:daec  7a            ply
$11:daed  c6 c8         dec $c8
$11:daef  10 91         bpl $da82
$11:daf1  8c c8 a0      sty $a0c8
$11:daf4  d9 cf 29      cmp $29cf,y
$11:daf7  38            sec
$11:daf8  ea            nop
$11:daf9  84 8f         sty $8f
$11:dafb  d5 ff         cmp $ff,x
$11:dafd  ef c8 37 76   sbc $7637c8
$11:db01  4c dd 91      jmp $91dd
$11:db04  3c 1c 04      bit $041c,x
$11:db07  f8            sed
$11:db08  aa            tax
$11:db09  01 8c         ora ($8c,x)
$11:db0b  d1 2b         cmp ($2b),y
$11:db0d  2e a2 e5      rol $e5a2
$11:db10  c1 ba         cmp ($ba,x)
$11:db12  54 ed 12      mvn $12,$ed
$11:db15  79 87 2a      adc $2a87,y
$11:db18  c3 1f         cmp $1f,s
$11:db1a  a0 46         ldy #$46
$11:db1c  f4 aa b0      pea $b0aa
$11:db1f  80 df         bra $db00
$11:db21  20 77 88      jsr $8877
$11:db24  3f c2 9f e0   and $e09fc2,x
$11:db28  8f f0 27 f8   sta $f827f0
$11:db2c  0b            phd
$11:db2d  f4 03 9b      pea $9b03
$11:db30  be 96 e7      ldx $e796,y
$11:db33  ac b5 e8      ldy $e8b5
$11:db36  9d 32 6d      sta $6d32,x
$11:db39  29 84         and #$84
$11:db3b  c9 a3         cmp #$a3
$11:db3d  51 48         eor ($48),y
$11:db3f  24 4a         bit $4a
$11:db41  ff 00 0f 84   sbc $840f00,x
$11:db45  fc 44 31      jsr ($3144,x)
$11:db48  f1 30         sbc ($30),y
$11:db4a  c3 c5         cmp $c5,s
$11:db4c  43 f0         eor $f0,s
$11:db4e  b8            clv
$11:db4f  50 2a         bvc $db7b
$11:db51  12 09         ora ($09)
$11:db53  87 80         sta [$80]
$11:db55  60            rts
$11:db56  96 0a         stx $0a,y
$11:db58  05 83         ora $83
$11:db5a  01 00         ora ($00,x)
$11:db5c  d0 38         bne $db96
$11:db5e  04 7e         tsb $7e
$11:db60  c3 f0         cmp $f0,s
$11:db62  80 50         bra $dbb4
$11:db64  30 0e         bmi $db74
$11:db66  10 28         bpl $db90
$11:db68  01 2c         ora ($2c,x)
$11:db6a  d8            cld
$11:db6b  c4 58         cpy $58
$11:db6d  22 c2 b1 8f   jsl $8fb1c2
$11:db71  9d 02 ce      sta $ce02,x
$11:db74  41 27         eor ($27,x)
$11:db76  10 89         bpl $db01
$11:db78  94 02         sty $02,x
$11:db7a  d5 00         cmp $00,x
$11:db7c  eb            xba
$11:db7d  c2 32         rep #$32
$11:db7f  70 cb         bvs $db4c
$11:db81  1c 72 03      trb $0372
$11:db84  f8            sed
$11:db85  81 fc         sta ($fc,x)
$11:db87  20 fe 08      jsr $08fe
$11:db8a  78            sei
$11:db8b  20 c3 e0      jsr $e0c3
$11:db8e  af 0d 0d 72   lda $720d0d
$11:db92  09 a3 e0      ora #$e0a3
$11:db95  63 d2         adc $d2,s
$11:db97  61 fa         adc ($fa,x)
$11:db99  fe c1 a0      inc $a0c1,x
$11:db9c  38            sec
$11:db9d  49 9d 33      eor #$339d
$11:dba0  07 03         ora [$03]
$11:dba2  ff d7 ff f7   sbc $f7ffd7,x
$11:dba6  f5 10         sbc $10,x
$11:dba8  7c ff fd      jmp ($fdff,x)
$11:dbab  1f fc 0e 9e   ora $9e0efc,x
$11:dbaf  a2 16 28      ldx #$2816
$11:dbb2  5f f0 13 fe   eor $fe13f0,x
$11:dbb6  02 c4         cop #$c4
$11:dbb8  19 e0 b3      ora $b3e0,y
$11:dbbb  25 98         and $98
$11:dbbd  2b            pld
$11:dbbe  81 7f         sta ($7f,x)
$11:dbc0  98            tya
$11:dbc1  64 c8         stz $c8
$11:dbc3  40            rti
$11:dbc4  47 e0         eor [$e0]
$11:dbc6  43 0c         eor $0c,s
$11:dbc8  0c 07 8d      tsb $8d07
$11:dbcb  06 2c         asl $2c
$11:dbcd  17 e7         ora [$e7],y
$11:dbcf  ff fe 5f 9b   sbc $9b5ffe,x
$11:dbd3  84 1b         sty $1b
$11:dbd5  e0 bf 2e      cpx #$2ebf
$11:dbd8  2c f6 a9      bit $a9f6
$11:dbdb  3c 93 43      bit $4393,x
$11:dbde  a3 72         lda $72,s
$11:dbe0  7b            tdc
$11:dbe1  54 5a 31      mvn $31,$5a
$11:dbe4  26 ad         rol $ad
$11:dbe6  c9 e4 f1      cmp #$f1e4
$11:dbe9  bf 17 ff c7   lda $c7ff17,x
$11:dbed  ff f8 ff fe   sbc $fefff8,x
$11:dbf1  00 21         brk #$21
$11:dbf3  01 90         ora ($90,x)
$11:dbf5  14 20         trb $20
$11:dbf7  f0 78         beq $dc71
$11:dbf9  fc 7e 1f      jsr ($1f7e,x)
$11:dbfc  0f 81 c0 e1   ora $e1c081
$11:dc00  30 90         bmi $db92
$11:dc02  7a            ply
$11:dc03  7e 3f fe      ror $fe3f,x
$11:dc06  00 20         brk #$20
$11:dc08  ff 3f ff 6f   sbc $6fff3f,x
$11:dc0c  f8            sed
$11:dc0d  7d 3c 5f      adc $5f3c,x
$11:dc10  ee 07 f3      inc $f307
$11:dc13  c7 fe         cmp [$fe]
$11:dc15  e9 7f fc      sbc #$fc7f
$11:dc18  22 00 ff 7c   jsl $7cff00
$11:dc1c  3f c0 30 46   and $4630c0,x
$11:dc20  04 08         tsb $08
$11:dc22  7c 24 32      jmp ($3224,x)
$11:dc25  80 92         bra $dbb9
$11:dc27  05 18         ora $18
$11:dc29  08            php
$11:dc2a  a0 44 06      ldy #$0644
$11:dc2d  42 df         wdm #$df
$11:dc2f  4c 99 d8      jmp $d899
$11:dc32  23 f4         and $f4,s
$11:dc34  09 f9 5c      ora #$5cf9
$11:dc37  3a            dec a
$11:dc38  12 f4         ora ($f4)
$11:dc3a  60            rts
$11:dc3b  98            tya
$11:dc3c  2e 7b c2      rol $c27b
$11:dc3f  ae e8 a7      ldx $a7e8
$11:dc42  dc 1b e6      jml [$e61b]
$11:dc45  0e 3d e1      asl $e13d
$11:dc48  5e 81 dc      lsr $dc81,x
$11:dc4b  21 ff         and ($ff,x)
$11:dc4d  08            php
$11:dc4e  07 f8         ora [$f8]
$11:dc50  bf 96 18 04   lda $041896,x
$11:dc54  c6 01         dec $01
$11:dc56  b0 80         bcs $dbd8
$11:dc58  6e 20 19      ror $1920
$11:dc5b  88            dey
$11:dc5c  05 73         ora $73
$11:dc5e  00 99         brk #$99
$11:dc60  0a            asl a
$11:dc61  63 6c         adc $6c,s
$11:dc63  08            php
$11:dc64  45 7f         eor $7f
$11:dc66  51 89         eor ($89),y
$11:dc68  30 37         bmi $dca1
$11:dc6a  ea            nop
$11:dc6b  91 27         sta ($27),y
$11:dc6d  04 01         tsb $01
$11:dc6f  a6 4d         ldx $4d
$11:dc71  50 b0         bvc $dc23
$11:dc73  2d 86 60      and $6086
$11:dc76  ba            tsx
$11:dc77  15 f1         ora $f1,x
$11:dc79  ab            plb
$11:dc7a  db            stp
$11:dc7b  c0 cb 0c      cpy #$0ccb
$11:dc7e  5d 0e 4f      eor $4f0e,x
$11:dc81  e5 ca         sbc $ca
$11:dc83  ec ea 52      cpx $52ea
$11:dc86  cd ae 0f      cmp $0fae
$11:dc89  65 71         adc $71
$11:dc8b  d4 5c         pei ($5c)
$11:dc8d  7a            ply
$11:dc8e  b3 69         lda ($69,s),y
$11:dc90  e4 02         cpx $02
$11:dc92  35 00         and $00,x
$11:dc94  a7 17         lda [$17]
$11:dc96  c6 fd         dec $fd
$11:dc98  00 87         brk #$87
$11:dc9a  3a            dec a
$11:dc9b  06 11         asl $11
$11:dc9d  00 81         brk #$81
$11:dc9f  c0 3c 70      cpy #$703c
$11:dca2  0b            phd
$11:dca3  3e 43 9d      rol $9d43,x
$11:dca6  20 ee 40      jsr $40ee
$11:dca9  27 38         and [$38]
$11:dcab  0b            phd
$11:dcac  ac 03 cc      ldy $cc03
$11:dcaf  c2 0f         rep #$0f
$11:dcb1  e4 03         cpx $03
$11:dcb3  fb            xce
$11:dcb4  00 fd         brk #$fd
$11:dcb6  c0 3e f0      cpy #$f03e
$11:dcb9  0f 7c 03 bf   ora $bf037c
$11:dcbd  00 df         brk #$df
$11:dcbf  40            rti
$11:dcc0  6f 10 f8 44   adc $44f810
$11:dcc4  0a            asl a
$11:dcc5  11 06         ora ($06),y
$11:dcc7  82 40 20      brl $fd0a
$11:dcca  90 28         bcc $dcf4
$11:dccc  14 02         trb $02
$11:dcce  05 01         ora $01
$11:dcd0  80 c0         bra $dc92
$11:dcd2  20 30 78      jsr $7830
$11:dcd5  00 7c         brk #$7c
$11:dcd7  1d e0 ef      ora $efe0,x
$11:dcda  00 e0         brk #$e0
$11:dcdc  af 92 41 c0   lda $c04192
$11:dce0  b0 50         bcs $dd32
$11:dce2  06 43         asl $43
$11:dce4  c0 66 05      cpy #$0566
$11:dce7  00 72         brk #$72
$11:dce9  18            clc
$11:dcea  0e 02 d4      asl $d402
$11:dced  13 c0         ora ($c0,s),y
$11:dcef  41 26         eor ($26,x)
$11:dcf1  12 30         ora ($30)
$11:dcf3  81 00         sta ($00,x)
$11:dcf5  18            clc
$11:dcf6  d7 00         cmp [$00],y
$11:dcf8  40            rti
$11:dcf9  66 90         ror $90
$11:dcfb  3b            tsc
$11:dcfc  2c 2f 97      bit $972f
$11:dcff  1f c5 cf e5   ora $e5cfc5,x
$11:dd03  ff f0 e0 40   sbc $40e0f0,x
$11:dd07  ff 10 7f 84   sbc $847f10,x
$11:dd0b  3f c1 1f e0   and $e01fc1,x
$11:dd0f  4f d4 a7 b1   eor $b1a7d4
$11:dd13  af 65 6f d1   lda $d16f65
$11:dd17  df f5 77 fd   cmp $fd77f5,x
$11:dd1b  7a            ply
$11:dd1c  ff df bf ff   sbc $ffbfdf,x
$11:dd20  ef ff f3 fe   sbc $fef3ff
$11:dd24  a0 23 fd      ldy #$fd23
$11:dd27  72 30         adc ($30)
$11:dd29  fd 8c 3e      sbc $3e8c,x
$11:dd2c  43 9f         eor $9f,s
$11:dd2e  fa            plx
$11:dd2f  fe c1 a0      inc $a0c1,x
$11:dd32  39 49 9d      and $9d49,y
$11:dd35  a3 4f         lda $4f,s
$11:dd37  8e e0 df      stx $dfe0
$11:dd3a  ff e9 f1 f9   sbc $f9f1e9,x
$11:dd3e  ff fa 3f f8   sbc $f83ffa,x
$11:dd42  1d 3f ff      ora $ff3f,x
$11:dd45  5f 50 0c 3f   eor $3f0c50,x
$11:dd49  e1 5f         sbc ($5f,x)
$11:dd4b  d0 23         bne $dd70
$11:dd4d  42 7f         wdm #$7f
$11:dd4f  c0 bf e0      cpy #$e0bf
$11:dd52  16 a0         asl $a0,x
$11:dd54  b5 23         lda $23,x
$11:dd56  f0 2f         beq $dd87
$11:dd58  f0 92         beq $dcec
$11:dd5a  03 f2         ora $f2,s
$11:dd5c  c1 c0         cmp ($c0,x)
$11:dd5e  c7 e0         cmp [$e0]
$11:dd60  1b            tcs
$11:dd61  01 f9         ora ($f9,x)
$11:dd63  2f d0 fa 27   and $27fad0
$11:dd67  a1 5f         lda ($5f,x)
$11:dd69  95 aa         sta $aa,x
$11:dd6b  2d 43 9f      and $9f43
$11:dd6e  ca            dex
$11:dd6f  a3 db         lda $db,s
$11:dd71  6c 17 37      jmp ($3717)
$11:dd74  a7 15         lda [$15]
$11:dd76  85 c9         sta $c9
$11:dd78  63 70         adc $70,s
$11:dd7a  98            tya
$11:dd7b  bf c7 ff f0   lda $f0ffc7,x
$11:dd7f  ff bf c2 f3   sbc $f3c2bf,x
$11:dd83  ff 9c 7f ff   sbc $ff7f9c,x
$11:dd87  00 83         brk #$83
$11:dd89  81 c0         sta ($c0,x)
$11:dd8b  e1 f0         sbc ($f0,x)
$11:dd8d  fc 3e 1c      jsr ($1c3e,x)
$11:dd90  22 10 70 b8   jsl $b87010
$11:dd94  e3 f1         sbc $f1,s
$11:dd96  e0 f0 3e      cpx #$3ef0
$11:dd99  80 04         bra $dd9f
$11:dd9b  2f 00 01 04   and $040100
$11:dd9f  95 c0         sta $c0,x
$11:dda1  f8            sed
$11:dda2  3e 10 00      rol $0010,x
$11:dda5  8b            phb
$11:dda6  c8            iny
$11:dda7  12 47         ora ($47)
$11:dda9  d0 04         bne $ddaf
$11:ddab  82 03 7f      brl $5cb1
$11:ddae  f2 0c         sbc ($0c)
$11:ddb0  fe 83 3f      inc $3f83,x
$11:ddb3  38            sec
$11:ddb4  83 c9         sta $c9,s
$11:ddb6  23 7f         and $7f,s
$11:ddb8  1c 74 43      trb $4374
$11:ddbb  9f d8 e3 c6   sta $c6e3d8,x
$11:ddbf  30 e8         bmi $dda9
$11:ddc1  02 5f         cop #$5f
$11:ddc3  02 f8         cop #$f8
$11:ddc5  10 09         bpl $ddd0
$11:ddc7  40            rti
$11:ddc8  ff c7 fc 10   sbc $10fcc7,x
$11:ddcc  7f c2 bc 0e   adc $0ebcc2,x
$11:ddd0  20 1e 03      jsr $031e
$11:ddd3  aa            tax
$11:ddd4  0f fb 4d 40   ora $404dfb
$11:ddd8  97 70         sta [$70],y
$11:ddda  34 f4         bit $f4,x
$11:dddc  0e 9c 83      asl $839c
$11:dddf  2f 60 4a 85   and $854a60
$11:dde3  a6 21         ldx $21
$11:dde5  eb            xba
$11:dde6  88            dey
$11:dde7  40            rti
$11:dde8  3b            tsc
$11:dde9  e9 f1 ff      sbc #$fff1
$11:ddec  c0 3d ea      cpy #$ea3d
$11:ddef  51 52         eor ($52),y
$11:ddf1  07 dd         ora [$dd]
$11:ddf3  56 11         lsr $11,x
$11:ddf5  88            dey
$11:ddf6  02 bc         cop #$bc
$11:ddf8  21 8b         and ($8b,x)
$11:ddfa  21 c3         and ($c3,x)
$11:ddfc  40            rti
$11:ddfd  38            sec
$11:ddfe  cd 40 80      cmp $8040
$11:de01  70 e0         bvs $dde3
$11:de03  10 0f         bpl $de14
$11:de05  82 fc 4f      brl $2e04
$11:de08  c0 7e 0f      cpy #$0f7e
$11:de0b  e3 1c         sbc $1c,s
$11:de0d  7f cc b0 cd   adc $cdb0cc,x
$11:de11  41 6a         eor ($6a,x)
$11:de13  12 1d         ora ($1d)
$11:de15  5c c2 97 70   jml $7097c2
$11:de19  d2 5e         cmp ($5e)
$11:de1b  6c f7 8c      jmp ($8cf7)
$11:de1e  4c f3 ad      jmp $adf3
$11:de21  6c 82 dd      jmp ($dd82)
$11:de24  60            rts
$11:de25  26 c0         rol $c0
$11:de27  bf 32 c1 c2   lda $c2c132,x
$11:de2b  0c b0 71      tsb $71b0
$11:de2e  8d ff 91      sta $91ff
$11:de31  00 d9         brk #$d9
$11:de33  41 2a         eor ($2a,x)
$11:de35  10 ec         bpl $de23
$11:de37  4c fa 13      jmp $13fa
$11:de3a  fe ae 7f      inc $7fae,x
$11:de3d  ef bf ee c7   sbc $c7eebf
$11:de41  fe 0f f0      inc $f00f,x
$11:de44  87 f0         sta [$f0]
$11:de46  27 f8         and [$f8]
$11:de48  0b            phd
$11:de49  f8            sed
$11:de4a  fe 3f ff      inc $ff3f,x
$11:de4d  70 80         bvs $ddcf
$11:de4f  fe c1 e0      inc $e0c1,x
$11:de52  16 1f         asl $1f,x
$11:de54  f7 ff         sbc [$ff],y
$11:de56  dc 0f 03      jml [$030f]
$11:de59  19 1b 41      ora $411b,y
$11:de5c  1a            inc a
$11:de5d  06 32         asl $32
$11:de5f  31 8d         and ($8d),y
$11:de61  67 c3         adc [$c3]
$11:de63  d3 f4         cmp ($f4,s),y
$11:de65  f9 bf 1e      sbc $1ebf,y
$11:de68  af e7 f7 fd   lda $fdf7e7
$11:de6c  bf fe 7e ff   lda $ff7efe,x
$11:de70  9f 9f f3 30   sta $30f39f,x
$11:de74  4f f7 80 c0   eor $c080f7
$11:de78  50 20         bvc $de9a
$11:de7a  1e 0a 04      asl $040a,x
$11:de7d  c3 41         cmp $41,s
$11:de7f  58            cli
$11:de80  c8            iny
$11:de81  5b            tcd
$11:de82  31 1a         and ($1a),y
$11:de84  6e 26 af      ror $af26
$11:de87  84 be         sty $be
$11:de89  0c 01 80      tsb $8001
$11:de8c  78            sei
$11:de8d  05 20         ora $20
$11:de8f  60            rts
$11:de90  9b            txy
$11:de91  28            plp
$11:de92  3f 3d ee df   and $dfee3d,x
$11:de96  fb            xce
$11:de97  73 dc         adc ($dc,s),y
$11:de99  cc f7 25      cpy $25f7
$11:de9c  1a            inc a
$11:de9d  c9 2d 87      cmp #$872d
$11:dea0  5f e0 8e 7c   eor $7c8ee0,x
$11:dea4  7c 18 1f      jmp ($1f18,x)
$11:dea7  0e 03 c6      asl $c603
$11:deaa  82 08 07      brl $e5b5
$11:dead  4e 01 9a      lsr $9a01
$11:deb0  58            cli
$11:deb1  0c 22 01      tsb $0122
$11:deb4  98            tya
$11:deb5  e3 f5         sbc $f5,s
$11:deb7  31 7f         and ($7f),y
$11:deb9  6f cc 22 07   adc $0722cc
$11:debd  37 d8         and [$d8],y
$11:debf  79 b4 38      adc $38b4,y
$11:dec2  ce 1e 4b      dec $4b1e
$11:dec5  9b            txy
$11:dec6  7f ff df fc   adc $fcdfff,x
$11:deca  ff fd 1f fe   sbc $fe1ffd,x
$11:dece  0f 4f ff d7   ora $d7ff4f
$11:ded2  d4 00         pei ($00)
$11:ded4  a0 1d fd      ldy #$fd1d
$11:ded7  02 3f         cop #$3f
$11:ded9  e0 9f f0      cpx #$f09f
$11:dedc  2b            pld
$11:dedd  fa            plx
$11:dede  05 98         ora $98
$11:dee0  43 fe         eor $fe,s
$11:dee2  0b            phd
$11:dee3  12 ff         ora ($ff)
$11:dee5  af f4 ce 1c   lda $1ccef4
$11:dee9  03 11         ora $11,s
$11:deeb  e0 60 26      cpx #$2660
$11:deee  70 35         bvs $df25
$11:def0  87 88         sta [$88]
$11:def2  1c 2b f4      trb $f42b
$11:def5  ff 2f d6 69   sbc $69d62f,x
$11:def9  0b            phd
$11:defa  b9 c3 61      lda $61c3,y
$11:defd  31 79         and ($79),y
$11:deff  a4 3f         ldy $3f
$11:df01  23 8b         and $8b,s
$11:df03  e6 f0         inc $f0
$11:df05  e5 52         sbc $52
$11:df07  58            cli
$11:df08  d4 17         pei ($17)
$11:df0a  f1 ff         sbc ($ff),y
$11:df0c  7f a5 f3 ff   adc $fff3a5,x
$11:df10  3c ff f7      bit $f7ff,x
$11:df13  3f ff c5 28   and $28c5ff,x
$11:df17  41 f0         eor ($f0,x)
$11:df19  78            sei
$11:df1a  3e 0f 06      rol $060f,x
$11:df1d  07 03         ora [$03]
$11:df1f  c3 e1         cmp $e1,s
$11:df21  c2 a1         rep #$a1
$11:df23  01 80         ora ($80,x)
$11:df25  e0 70 20      cpx #$2070
$11:df28  52 9f         eor ($9f)
$11:df2a  03 06         ora $06,s
$11:df2c  f0 0c         beq $df3a
$11:df2e  17 38         ora [$38],y
$11:df30  5f bf ff 00   eor $00ffbf,x
$11:df34  00 83         brk #$83
$11:df36  43 f4         eor $f4,s
$11:df38  0c 1f 33      tsb $331f
$11:df3b  98            tya
$11:df3c  41 a0         eor ($a0,x)
$11:df3e  de 01 fe      dec $fe01,x
$11:df41  55 39         eor $39,x
$11:df43  73 8e         adc ($8e,s),y
$11:df45  3d 33 c7      and $c733,x
$11:df48  2e f0 c2      rol $c2f0
$11:df4b  78            sei
$11:df4c  d6 cf         dec $cf,x
$11:df4e  1c eb cb      trb $cbeb
$11:df51  04 f9         tsb $f9
$11:df53  8f da 40 3e   sta $3e40da
$11:df57  58            cli
$11:df58  9f b2 03 fe   sta $fe03b2,x
$11:df5c  81 ff         sta ($ff,x)
$11:df5e  09 a0 71      ora #$71a0
$11:df61  02 68         cop #$68
$11:df63  58            cli
$11:df64  33 e3         and ($e3,s),y
$11:df66  fe 26 84      inc $8426,x
$11:df69  a6 21         ldx $21
$11:df6b  b4 84         ldy $84,x
$11:df6d  79 63 1d      adc $1d63,y
$11:df70  48            pha
$11:df71  47 ca         eor [$ca]
$11:df73  19 7a c2      ora $c27a,y
$11:df76  7a            ply
$11:df77  a0 9e d8      ldy #$d89e
$11:df7a  10 fc         bpl $df78
$11:df7c  7f 6a 11 3f   adc $3f116a,x
$11:df80  07 f5         ora [$f5]
$11:df82  4e 27 e0      lsr $e027
$11:df85  ff 37 43 83   sbc $834337,x
$11:df89  00 f0         brk #$f0
$11:df8b  c0 3e 30      cpy #$303e
$11:df8e  0b            phd
$11:df8f  04 03         tsb $03
$11:df91  e1 00         sbc ($00,x)
$11:df93  bc 40 26      ldy $2640,x
$11:df96  10 03         bpl $df9b
$11:df98  ef c0 30 0d   sbc $0d30c0
$11:df9c  01 67         ora ($67,x)
$11:df9e  87 01         sta [$01]
$11:dfa0  ac 2d 10      ldy $102d
$11:dfa3  5b            tcd
$11:dfa4  83 48         sta $48,s
$11:dfa6  da            phx
$11:dfa7  a4 d1         ldy $d1
$11:dfa9  2f 03 58 3f   and $3f5803
$11:dfad  3f ef af f8   and $f8afef,x
$11:dfb1  4a            lsr a
$11:dfb2  0e f0 06      asl $06f0
$11:dfb5  05 fb         ora $fb
$11:dfb7  fb            xce
$11:dfb8  7b            tdc
$11:dfb9  fe 7e c7      inc $c77e,x
$11:dfbc  bf ef ff 83   lda $83ffef,x
$11:dfc0  c0 76 01      cpy #$0176
$11:dfc3  42 07         wdm #$07
$11:dfc5  97 dc         sta [$dc],y
$11:dfc7  28            plp
$11:dfc8  18            clc
$11:dfc9  0f fd 00 3e   ora $3e00fd
$11:dfcd  22 00 61 80   jsl $806100
$11:dfd1  90 9d         bcc $df70
$11:dfd3  de 7e ee      dec $ee7e,x
$11:dfd6  cf 87 95 f0   cmp $f09587
$11:dfda  e3 7e         sbc $7e,s
$11:dfdc  3a            dec a
$11:dfdd  7f ce 8f fb   adc $fb8fce,x
$11:dfe1  e8            inx
$11:dfe2  37 0f         and [$0f],y
$11:dfe4  ff f4 24 02   sbc $0224f4,x
$11:dfe8  84 12         sty $12
$11:dfea  3b            tsc
$11:dfeb  44 38 18      mvp $18,$38
$11:dfee  0b            phd
$11:dfef  05 02         ora $02
$11:dff1  61 20         adc ($20,x)
$11:dff3  ac 44 39      ldy $3944
$11:dff6  90 8c         bcc $df84
$11:dff8  b5 12         lda $12,x
$11:dffa  77 c2         adc [$c2],y
$11:dffc  70 91         bvs $df8f
$11:dffe  bc 5d 62      ldy $625d,x
$11:e001  b9 0f c4      lda $c40f,y
$11:e004  03 f9         ora $f9,s
$11:e006  00 fa         brk #$fa
$11:e008  7e e1 90      ror $90e1,x
$11:e00b  39 be c3      and $c3be,y
$11:e00e  5d e1 ee      eor $eee1,x
$11:e011  60            rts
$11:e012  f1 dc         sbc ($dc),y
$11:e014  1f 47 ce 1f   ora $1fce47,x
$11:e018  08            php
$11:e019  ff e8 ff f0   sbc $f0ffe8,x
$11:e01d  7a            ply
$11:e01e  7f fe bf ff   adc $ffbffe,x
$11:e022  bf a9 80 3a   lda $3a80a9,x
$11:e026  1c 7f bc      trb $bc7f
$11:e029  3e 3f e0      rol $e03f,x
$11:e02c  9f f0 15 e1   sta $e115f0,x
$11:e030  07 fc         ora [$fc]
$11:e032  43 fe         eor $fe,s
$11:e034  0b            phd
$11:e035  12 5b         ora ($5b)
$11:e037  80 50         bra $e089
$11:e039  d7 f3         cmp [$f3],y
$11:e03b  47 cc         eor [$cc]
$11:e03d  cc b3 36      cpy $36b3
$11:e040  2c cc df      bit $dfcc
$11:e043  11 21         ora ($21),y
$11:e045  cc c4 9a      cpy $9ac4
$11:e048  03 41         ora $41,s
$11:e04a  dd 62 3f      cmp $3f62,x
$11:e04d  ed fc 92      sbc $92fc
$11:e050  c2 a1         rep #$a1
$11:e052  50 5e         bvc $e0b2
$11:e054  c7 1e         cmp [$1e]
$11:e056  35 05         and $05,x
$11:e058  b3 5a         lda ($5a,s),y
$11:e05a  7b            tdc
$11:e05b  bc 2a 55      ldy $552a,x
$11:e05e  16 45         asl $45,x
$11:e060  27 1f         and [$1f]
$11:e062  00 f8         brk #$f8
$11:e064  27 85         and [$85]
$11:e066  a1 ce         lda ($ce,x)
$11:e068  00 87         brk #$87
$11:e06a  79 ff ee      adc $eeff,y
$11:e06d  7f f0 78 3e   adc $3e78f0,x
$11:e071  07 03         ora [$03]
$11:e073  83 c1         sta $c1,s
$11:e075  81 84         sta ($84,x)
$11:e077  07 01         ora [$01]
$11:e079  80 c0         bra $e03b
$11:e07b  e0 42 21      cpx #$2142
$11:e07e  7c ff cf      jmp ($cfff,x)
$11:e081  ff f3 ef f8   sbc $f8eff3,x
$11:e085  7c 94 e1      jmp ($e194,x)
$11:e088  7e 10 0f      ror $0f10,x
$11:e08b  f8            sed
$11:e08c  b4 25         ldy $25,x
$11:e08e  b0 17         bcs $e0a7
$11:e090  86 7f         stx $7f
$11:e092  3f 7e 53 80   and $80537e,x
$11:e096  b8            clv
$11:e097  4c 00 3f      jmp $3f00
$11:e09a  4b            phk
$11:e09b  01 9c         ora ($9c,x)
$11:e09d  cc 01 16      cpy $1601
$11:e0a0  f8            sed
$11:e0a1  c9 fc 10      cmp #$10fc
$11:e0a4  4f 1c fb e3   eor $e3fb1c
$11:e0a8  12 fc         ora ($fc)
$11:e0aa  c2 ff         rep #$ff
$11:e0ac  10 2f         bpl $e0dd
$11:e0ae  8c 6d 16      sty $166d
$11:e0b1  1f f8 81 80   ora $8081f8,x
$11:e0b5  48            pha
$11:e0b6  a0 65 24      ldy #$2465
$11:e0b9  f0 11         beq $e0cc
$11:e0bb  42 03         wdm #$03
$11:e0bd  fe 21 84      inc $8421,x
$11:e0c0  1b            tcs
$11:e0c1  f2 43         sbc ($43)
$11:e0c3  0a            asl a
$11:e0c4  06 fc         asl $fc
$11:e0c6  86 46         stx $46
$11:e0c8  f2 3f         sbc ($3f)
$11:e0ca  e5 e7         sbc $e7
$11:e0cc  0d f5 81      ora $81f5
$11:e0cf  5d b0 33      eor $33b0,x
$11:e0d2  8e 1f fa      stx $fa1f
$11:e0d5  03 36         ora $36,s
$11:e0d7  e0 de f0      cpx #$f0de
$11:e0da  13 ee         ora ($ee,s),y
$11:e0dc  0c 00 fd      tsb $fd00
$11:e0df  b7 88         lda [$88],y
$11:e0e1  04 e2         tsb $e2
$11:e0e3  01 9c         ora ($9c,x)
$11:e0e5  80 66         bra $e14d
$11:e0e7  20 13 c5      jsr $c513
$11:e0ea  90 d3         bcc $e0bf
$11:e0ec  b0 15         bcs $e103
$11:e0ee  cc 01 94      cpy $9401
$11:e0f1  ef ec 31 32   sbc $3231ec
$11:e0f5  11 e0         ora ($e0),y
$11:e0f7  37 f6         and [$f6],y
$11:e0f9  08            php
$11:e0fa  05 02         ora $02
$11:e0fc  01 30         ora ($30,x)
$11:e0fe  69 0c 82      adc #$820c
$11:e101  01 18         ora ($18,x)
$11:e103  58            cli
$11:e104  0b            phd
$11:e105  64 20         stz $20
$11:e107  1c 08 07      trb $0708
$11:e10a  c2 01         rep #$01
$11:e10c  e0 71 89      cpx #$8971
$11:e10f  78            sei
$11:e110  1c 40 ea      trb $ea40
$11:e113  1f 4f f8 66   ora $66f84f,x
$11:e117  1f df f7 67   ora $67f7df,x
$11:e11b  fd 89 ff      sbc $ff89,x
$11:e11e  70 a7         bvs $e0c7
$11:e120  9a            txs
$11:e121  c2 18         rep #$18
$11:e123  0e c0 ff      asl $ffc0
$11:e126  6d e0 fb      adc $fbe0
$11:e129  bf 47 bf ff   lda $ffbf47,x
$11:e12d  c5 ff         cmp $ff
$11:e12f  f0 5f         beq $e190
$11:e131  f9 47 5e      sbc $5e47,y
$11:e134  d3 80         cmp ($80,s),y
$11:e136  bf 8e 83 00   lda $00838e,x
$11:e13a  48            pha
$11:e13b  31 11         and ($11),y
$11:e13d  10 c7         bpl $e106
$11:e13f  01 00         ora ($00,x)
$11:e141  77 f8         adc [$f8],y
$11:e143  03 7d         ora $7d,s
$11:e145  9f f1 88 0c   sta $0c88f1,x
$11:e149  43 fc         eor $fc,s
$11:e14b  54 32 89      mvn $89,$32
$11:e14e  20 36 01      jsr $0136
$11:e151  c5 fc         cmp $fc
$11:e153  f4 ff bf      pea $bfff
$11:e156  af e6 e0 60   lda $60e0e6
$11:e15a  1f eb e7 fb   ora $fbe7eb,x
$11:e15e  fb            xce
$11:e15f  7f df 1e 41   adc $411edf,x
$11:e163  3f 10 8f f4   and $f48f10,x
$11:e167  33 ff         and ($ff,s),y
$11:e169  04 98         tsb $98
$11:e16b  6d f9 18      adc $18f9
$11:e16e  3e ce 1b      rol $1bce,x
$11:e171  b9 83 f5      lda $f583,y
$11:e174  fc 20 f0      jsr ($f020,x)
$11:e177  0e 7d 82      asl $827d
$11:e17a  2f 80 a7 ff   and $ffa780
$11:e17e  c3 c0         cmp $c0,s
$11:e180  a1 1f         lda ($1f,x)
$11:e182  7f fe 8f ff   adc $ff8ffe,x
$11:e186  87 c7         sta [$c7]
$11:e188  d4 03         pei ($03)
$11:e18a  3d c1 d0      and $d0c1,x
$11:e18d  f8            sed
$11:e18e  35 3e         and $3e,x
$11:e190  8a            txa
$11:e191  cc 29 3c      cpy $3c29
$11:e194  9f 5d a7 87   sta $87a75d,x
$11:e198  41 e0         eor ($e0,x)
$11:e19a  50 6f         bvc $e20b
$11:e19c  d0 09         bne $e1a7
$11:e19e  f4 02 5c      pea $5c02
$11:e1a1  c2 19         rep #$19
$11:e1a3  b4 02         ldy $02,x
$11:e1a5  2c c0 16      bit $16c0
$11:e1a8  08            php
$11:e1a9  38            sec
$11:e1aa  01 c8         ora ($c8,x)
$11:e1ac  4c f0 67      jmp $67f0
$11:e1af  90 b4         bcc $e165
$11:e1b1  19 e0 3d      ora $3de0,y
$11:e1b4  16 fd         asl $fd,x
$11:e1b6  c2 20         rep #$20
$11:e1b8  b2 79         lda ($79)
$11:e1ba  04 16         tsb $16
$11:e1bc  05 6a         ora $6a
$11:e1be  b2 cb         lda ($cb)
$11:e1c0  64 57         stz $57
$11:e1c2  5b            tcd
$11:e1c3  96 0b         stx $0b,y
$11:e1c5  0b            phd
$11:e1c6  0d 81 15      ora $1581
$11:e1c9  43 bc         eor $bc,s
$11:e1cb  54 1c f0      mvn $f0,$1c
$11:e1ce  00 71         brk #$71
$11:e1d0  df fb f1 50   cmp $50f1fb,x
$11:e1d4  70 38         bvs $e20e
$11:e1d6  1a            inc a
$11:e1d7  1f 0e 81 c0   ora $c0810e,x
$11:e1db  98            tya
$11:e1dc  fc 7c 16      jsr ($167c,x)
$11:e1df  0a            asl a
$11:e1e0  0f 04 26 16   ora $162604
$11:e1e4  0f 00 2c 27   ora $272c00
$11:e1e8  9f f9 ff fe   sta $fefff9,x
$11:e1ec  1d ff 55      ora $55ff,x
$11:e1ef  84 f8         sty $f8
$11:e1f1  44 2a b0      mvp $b0,$2a
$11:e1f4  75 81         adc $81,x
$11:e1f6  6c 3e 0e      jmp ($0e3e)
$11:e1f9  b1 2a         lda ($2a),y
$11:e1fb  80 d4         bra $e1d1
$11:e1fd  af b7 f3 06   lda $06f3b7
$11:e201  60            rts
$11:e202  3f f1 2f 8c   and $8c2ff1,x
$11:e206  1f e1 09 fe   ora $fe09e1,x
$11:e20a  41 7f         eor ($7f,x)
$11:e20c  98            tya
$11:e20d  9f c4 07 f1   sta $f107c4,x
$11:e211  09 fc 43      ora #$43fc
$11:e214  7f 90 84 48   adc $488490,x
$11:e218  10 0e         bpl $e228
$11:e21a  08            php
$11:e21b  66 32         ror $32
$11:e21d  3a            dec a
$11:e21e  8f 87 81 3f   sta $3f8187
$11:e222  c8            iny
$11:e223  5b            tcd
$11:e224  e1 9f         sbc ($9f,x)
$11:e226  33 99         and ($99,s),y
$11:e228  1f f2 3f e0   ora $e03ff2,x
$11:e22c  9d 70 63      sta $6370,x
$11:e22f  9e 19 ff      stz $ff19,x
$11:e232  02 3d         cop #$3d
$11:e234  e0 9e f0      cpx #$f09e
$11:e237  2f d8 04 c8   and $c804d8
$11:e23b  1f fa 9d 80   ora $809dfa,x
$11:e23f  8f 60 29 b8   sta $b82960
$11:e243  09 77 03      ora #$0377
$11:e246  4f 40 93 f0   eor $f09340
$11:e24a  16 a5         asl $a5,x
$11:e24c  00 df         brk #$df
$11:e24e  90 cf         bcc $e21f
$11:e250  be c5 68      ldx $68c5,y
$11:e253  84 02         sty $02
$11:e255  18            clc
$11:e256  d0 18         bne $e270
$11:e258  e4 02         cpx $02
$11:e25a  11 00         ora ($00),y
$11:e25c  83 40         sta $40,s
$11:e25e  30 d0         bmi $e230
$11:e260  08            php
$11:e261  74 02         stz $02,x
$11:e263  01 fc         ora ($fc,x)
$11:e265  80 7e         bra $e2e5
$11:e267  1c 27 fe      trb $fe27
$11:e26a  6f 8b a8 73   adc $73a88b
$11:e26e  56 49         lsr $49,x
$11:e270  af 02 dd 80   lda $80dd02
$11:e274  f6 c0         inc $c0,x
$11:e276  2e d0 0e      rol $0ed0
$11:e279  d4 06         pei ($06)
$11:e27b  d1 07         cmp ($07),y
$11:e27d  d1 47         cmp ($47),y
$11:e27f  e0 1f d8      cpx #$d81f
$11:e282  07 ee         ora [$ee]
$11:e284  01 f7         ora ($f7,x)
$11:e286  80 77         bra $e2ff
$11:e288  a0 3b 88      ldy #$883b
$11:e28b  3f 82 3e 73   and $733e82,x
$11:e28f  1f 77 ff de   ora $deff77,x
$11:e293  3b            tsc
$11:e294  0f f0 dc 7f   ora $7fdcf0
$11:e298  c1 10         cmp ($10,x)
$11:e29a  08            php
$11:e29b  87 d8         sta [$d8]
$11:e29d  70 04         bvs $e2a3
$11:e29f  d0 a0         bne $e241
$11:e2a1  07 c4         ora [$c4]
$11:e2a3  9a            txs
$11:e2a4  07 11         ora [$11]
$11:e2a6  0f 8f 03 69   ora $69038f
$11:e2aa  81 f0         sta ($f0,x)
$11:e2ac  e5 7b         sbc $7b
$11:e2ae  fb            xce
$11:e2af  5f de ff bf   eor $bfffde,x
$11:e2b3  bf ff ef f6   lda $f6efff,x
$11:e2b7  ff ff de dc   sbc $dcdeff,x
$11:e2bb  e8            inx
$11:e2bc  03 f1         ora $f1,s
$11:e2be  80 8f         bra $e24f
$11:e2c0  ce 08 3f      dec $3f08
$11:e2c3  2d 64 03      and $0364
$11:e2c6  11 ae         ora ($ae),y
$11:e2c8  fe 6b bb      inc $bb6b,x
$11:e2cb  5f ef e1 58   eor $58e1ef,x
$11:e2cf  7d 9f ee      adc $ee9f,x
$11:e2d2  f7 bd         sbc [$bd],y
$11:e2d4  40            rti
$11:e2d5  70 85         bvs $e25c
$11:e2d7  01 c8         ora ($c8,x)
$11:e2d9  14 05         trb $05
$11:e2db  3e be 7f      rol $7fbe,x
$11:e2de  37 d9         and [$d9],y
$11:e2e0  cd f6 7b      cmp $7bf6
$11:e2e3  7d dc df      adc $dfdc,x
$11:e2e6  1c 43 3d      trb $3d43
$11:e2e9  bc 3d 87      ldy $873d,x
$11:e2ec  fc 94 44      jsr ($4494,x)
$11:e2ef  a0 40 34      ldy #$3440
$11:e2f2  13 bb         ora ($bb,s),y
$11:e2f4  1f e9 c8 3d   ora $3dc8e9,x
$11:e2f8  ff 08 6c 2b   sbc $2b6c08,x
$11:e2fc  a9 73 c4      lda #$c473
$11:e2ff  c1 bb         cmp ($bb,x)
$11:e301  10 7e         bpl $e381
$11:e303  e4 0e         cpx $0e
$11:e305  c1 ff         cmp ($ff,x)
$11:e307  af 97 83 0f   lda $0f8397
$11:e30b  f7 87         sbc [$87],y
$11:e30d  c3 ff         cmp $ff,s
$11:e30f  f7 f5         sbc [$f5],y
$11:e311  41 f4         eor ($f4,x)
$11:e313  aa            tax
$11:e314  3d 6a ae      and $ae6a,x
$11:e317  1a            inc a
$11:e318  8b            phb
$11:e319  a8            tay
$11:e31a  b4 eb         ldy $eb,x
$11:e31c  2d bb eb      and $ebbb
$11:e31f  ee 52 fb      inc $fb52
$11:e322  b4 be         ldy $be,x
$11:e324  cb            wai
$11:e325  a0 12 a8      ldy #$a812
$11:e328  04 ea         tsb $ea
$11:e32a  01 16         ora ($16,x)
$11:e32c  80 44         bra $e372
$11:e32e  a0 10 26      ldy #$2610
$11:e331  41 f8         eor ($f8,x)
$11:e333  20 1c 98      jsr $981c
$11:e336  4d de ef      eor $efde
$11:e339  08            php
$11:e33a  fb            xce
$11:e33b  df b0 3e c8   cmp $c83eb0,x
$11:e33f  07 c1         ora [$c1]
$11:e341  9c 21 60      stz $6021
$11:e344  0e 86 20      asl $2086
$11:e347  2c 0e 47      bit $470e
$11:e34a  92 48         sta ($48)
$11:e34c  fe 3f 3d      inc $3d3f,x
$11:e34f  e6 ea         inc $ea
$11:e351  85 bd         sta $bd
$11:e353  fc c1 a9      jsr ($a9c1,x)
$11:e356  90 28         bcc $e380
$11:e358  3c 06 19      bit $1906,x
$11:e35b  03 ef         ora $ef,s
$11:e35d  7f e1 df fa   adc $fadfe1,x
$11:e361  3b            tsc
$11:e362  91 7f         sta ($7f),y
$11:e364  c0 a1 91      cpy #$91a1
$11:e367  f8            sed
$11:e368  eb            xba
$11:e369  fb            xce
$11:e36a  fc 10 28      jsr ($2810,x)
$11:e36d  20 01 60      jsr $6001
$11:e370  c0 60 28      cpy #$2860
$11:e373  3c 10 d8      bit $d810,x
$11:e376  47 0c         eor [$0c]
$11:e378  e2 de         sep #$de
$11:e37a  17 20         ora [$20],y
$11:e37c  aa            tax
$11:e37d  42 7c         wdm #$7c
$11:e37f  2a            rol a
$11:e380  10 68         bpl $e3ea
$11:e382  5c 0c e3 d9   jml $d9e30c
$11:e386  80 40         bra $e3c8
$11:e388  60            rts
$11:e389  3d fe fb      and $fbfe,x
$11:e38c  90 8c         bcc $e31a
$11:e38e  c4 23         cpy $23
$11:e390  20 68 1a      jsr $1a68
$11:e393  8f ff 03 fc   sta $fc03ff
$11:e397  43 3e         eor $3e,s
$11:e399  db            stp
$11:e39a  2e 7c 0e      rol $0e7c
$11:e39d  07 79         ora [$79]
$11:e39f  bc e3 7f      ldy $7fe3,x
$11:e3a2  9c 4f e4      stz $e44f
$11:e3a5  10 b8         bpl $e35f
$11:e3a7  02 03         cop #$03
$11:e3a9  fe 7f f0      inc $f07f,x
$11:e3ac  df f8 11 a0   cmp $a011f8,x
$11:e3b0  f0 17         beq $e3c9
$11:e3b2  fe 9c b0      inc $b09c,x
$11:e3b5  44 50 8f      mvp $8f,$50
$11:e3b8  fd 42 5f      sbc $5f42,x
$11:e3bb  c0 9f         cpy #$9f
$11:e3bd  9b            txy
$11:e3be  c0 7e         cpy #$7e
$11:e3c0  87 f8         sta [$f8]
$11:e3c2  ba            tsx
$11:e3c3  60            rts
$11:e3c4  3f 10 0f 0c   and $0c0f10,x
$11:e3c8  02 d3         cop #$d3
$11:e3ca  ff c8 7f e1   sbc $e17fc8,x
$11:e3ce  ff 08 ff 81   sbc $81ff08,x
$11:e3d2  32 07         and ($07)
$11:e3d4  fe a7 e0      inc $e0a7,x
$11:e3d7  32 d4         and ($d4)
$11:e3d9  0d 05 02      ora $0205
$11:e3dc  43 fe         eor $fe,s
$11:e3de  af f8 25 fe   lda $fe25f8
$11:e3e2  0f bd 82 6e   ora $6e82bd
$11:e3e6  dd 18 07      cmp $0718,x
$11:e3e9  bc fe ec      ldy $ecfe,x
$11:e3ec  20 f7 c1      jsr $c1f7
$11:e3ef  60            rts
$11:e3f0  10 78         bpl $e46a
$11:e3f2  04 16         tsb $16
$11:e3f4  05 bb         ora $bb
$11:e3f6  a2 61         ldx #$61
$11:e3f8  60            rts
$11:e3f9  50 38         bvc $e433
$11:e3fb  04 36         tsb $36
$11:e3fd  05 c7         ora $c7
$11:e3ff  0b            phd
$11:e400  00 54         brk #$54
$11:e402  1c 17 4b      trb $4b17
$11:e405  ff fb c1 42   sbc $42c1fb,x
$11:e409  06 27         asl $27
$11:e40b  88            dey
$11:e40c  3c 43 ee      bit $ee43,x
$11:e40f  27 02         and [$02]
$11:e411  68            pla
$11:e412  50 0d         bvc $e421
$11:e414  c0 03         cpy #$03
$11:e416  12 68         ora ($68)
$11:e418  01 80         ora ($80,x)
$11:e41a  0c 1c 0f      tsb $0f1c
$11:e41d  7f f8 1e 04   adc $041ef8,x
$11:e421  60            rts
$11:e422  79 8f fb      adc $fb8f,y
$11:e425  dc f0 0f      jml [$0ff0]
$11:e428  f7 dc         sbc [$dc],y
$11:e42a  8e 00 60      stx $6000
$11:e42d  01 5e         ora ($5e,x)
$11:e42f  ff ff bd ff   sbc $ffbdff,x
$11:e433  ed 12 c3      sbc $c312
$11:e436  d0 df         bne $e417
$11:e438  8b            phb
$11:e439  83 83         sta $83,s
$11:e43b  be e2 ee      ldx $eee2,y
$11:e43e  8f c0 3f ca   sta $ca3fc0
$11:e442  3e 66 65      rol $6566,x
$11:e445  99 b1 66      sta $66b1,y
$11:e448  66 f8         ror $f8
$11:e44a  89 0e 66      bit #$660e
$11:e44d  25 99         and $99
$11:e44f  99 e2 20      sta $20e2,y
$11:e452  1e ec 47      asl $47ec,x
$11:e455  fc bf 41      jsr ($41bf,x)
$11:e458  90 ee         bcc $e448
$11:e45a  6f bf db ec   adc $ecdbbf
$11:e45e  f6 fb         inc $fb,x
$11:e460  79 be ef      adc $efbe,y
$11:e463  6f 32 9b ce   adc $ce9b32
$11:e467  b6 f3         ldx $f3,y
$11:e469  09 be bf      ora #$bfbe
$11:e46c  c1 07         cmp ($07,x)
$11:e46e  e2 80         sep #$80
$11:e470  04 02         tsb $02
$11:e472  10 06         bpl $e47a
$11:e474  81 bf         sta ($bf,x)
$11:e476  a4 ed         ldy $ed
$11:e478  a4 fb         ldy $fb
$11:e47a  08            php
$11:e47b  06 fe         asl $fe
$11:e47d  81 b5         sta ($b5,x)
$11:e47f  b4 6d         ldy $6d,x
$11:e481  64 5b         stz $5b
$11:e483  54 b8 67      mvn $67,$b8
$11:e486  c6 82         dec $82
$11:e488  35 04         and $04,x
$11:e48a  f8            sed
$11:e48b  65 54         adc $54
$11:e48d  cb            wai
$11:e48e  00 fd         brk #$fd
$11:e490  c5 3d         cmp $3d
$11:e492  7e 68 5c      ror $5c68,x
$11:e495  0b            phd
$11:e496  f7 02         sbc [$02],y
$11:e498  ad e1 2b      lda $2be1
$11:e49b  72 6a         adc ($6a)
$11:e49d  dc 02 b7      jml [$b702]
$11:e4a0  f9 ff c2      sbc $c2ff,y
$11:e4a3  58            cli
$11:e4a4  02 bf         cop #$bf
$11:e4a6  0a            asl a
$11:e4a7  cb            wai
$11:e4a8  19 70 10      ora $1070,y
$11:e4ab  0e 04 03      asl $0304
$11:e4ae  e1 00         sbc ($00,x)
$11:e4b0  f0 34         beq $e4e6
$11:e4b2  05 aa         ora $aa
$11:e4b4  0d 32 7f      ora $7f32
$11:e4b7  03 7f         ora $7f,s
$11:e4b9  20 70 48      jsr $4870
$11:e4bc  3c 02 19      bit $1902,x
$11:e4bf  03 87         ora $87,s
$11:e4c1  c0 1d         cpy #$1d
$11:e4c3  e1 0d         sbc ($0d,x)
$11:e4c5  81 41         sta ($41,x)
$11:e4c7  20 70 b8      jsr $b870
$11:e4ca  20 48 40      jsr $4048
$11:e4cd  17 40         ora [$40],y
$11:e4cf  e0 58         cpx #$58
$11:e4d1  7c 20 f0      jmp ($f020,x)
$11:e4d4  07 95         ora [$95]
$11:e4d6  83 c0         sta $c0,s
$11:e4d8  0f 0a 0f 06   ora $060f0a
$11:e4dc  7f ff 8f 7f   adc $7f8fff,x
$11:e4e0  c3 e0         cmp $e0,s
$11:e4e2  1f 28 f8 88   ora $88f828,x
$11:e4e6  67 cd         adc [$cd]
$11:e4e8  f3 bf         sbc ($bf,s),y
$11:e4ea  df c5 f0 de   cmp $def0c5,x
$11:e4ee  06 f0         asl $f0
$11:e4f0  60            rts
$11:e4f1  07 d3         ora [$d3]
$11:e4f3  cc fe 60      cpy $60fe
$11:e4f6  3f 18 4f e4   and $e44f18,x
$11:e4fa  33 f9         and ($f9,s),y
$11:e4fc  8c fe 40      sty $40fe
$11:e4ff  3f 1c 4f e1   and $e14f1c,x
$11:e503  4c 20 5f      jmp $5f20
$11:e506  f8            sed
$11:e507  37 fc         and [$fc],y
$11:e509  be 06 32      ldx $3206,y
$11:e50c  30 a7         bmi $e4b5
$11:e50e  82 3f 80      brl $6550
$11:e511  bf f0 27 e6   lda $e627f0,x
$11:e515  f0 39         beq $e550
$11:e517  81 c4         sta ($c4,x)
$11:e519  0e a4 3f      asl $3fa4
$11:e51c  23 fd         and $fd,s
$11:e51e  41 ff         eor ($ff,x)
$11:e520  11 ff         ora ($ff),y
$11:e522  04 3f         tsb $3f
$11:e524  e0 91         cpx #$91
$11:e526  04 78         tsb $78
$11:e528  24 c1         bit $c1
$11:e52a  2e 47 fe      rol $fe47
$11:e52d  d9 d8 36      cmp $36d8,y
$11:e530  f6 0f         inc $0f,x
$11:e532  9a            txs
$11:e533  c0 66         cpy #$66
$11:e535  7e 05 78      ror $7805,x
$11:e538  7d d6 03      adc $03d6,x
$11:e53b  00 f7         brk #$f7
$11:e53d  af f3 0b 02   lda $020bf3
$11:e541  80 c0         bra $e503
$11:e543  b0 30         bcs $e575
$11:e545  27 88         and [$88]
$11:e547  33 c3         and ($c3,s),y
$11:e549  83 02         sta $02,s
$11:e54b  67 94         adc [$94]
$11:e54d  03 fc         ora $fc,s
$11:e54f  df cd 1d 12   cmp $121dcd,x
$11:e553  91 d8         sta ($d8),y
$11:e555  86 7b         stx $7b
$11:e557  2a            rol a
$11:e558  79 7b 67      adc $677b,y
$11:e55b  92 75         sta ($75)
$11:e55d  b8            clv
$11:e55e  94 e1         sty $e1,x
$11:e560  b5 76         lda $76,x
$11:e562  98            tya
$11:e563  c4 00         cpy $00
$11:e565  fc 13 f8      jsr ($f813,x)
$11:e568  44 b2 01      mvp $01,$b2
$11:e56b  1b            tcs
$11:e56c  80 51         bra $e5bf
$11:e56e  e0 17         cpx #$17
$11:e570  f8            sed
$11:e571  04 5a         tsb $5a
$11:e573  01 f7         ora ($f7,x)
$11:e575  ff 7f bf fd   sbc $fdbf7f,x
$11:e579  ff f6 2f fd   sbc $fd2ff6,x
$11:e57d  81 ff         sta ($ff,x)
$11:e57f  4a            lsr a
$11:e580  3a            dec a
$11:e581  d6 8c         dec $8c,x
$11:e583  00 cc         brk #$cc
$11:e585  70 01         bvs $e588
$11:e587  f1 46         sbc ($46),y
$11:e589  80 88         bra $e513
$11:e58b  87 e3         sta [$e3]
$11:e58d  80 80         bra $e50f
$11:e58f  75 f5         adc $f5,x
$11:e591  19 fd 06      ora $06fd,y
$11:e594  ff 00 33 0d   sbc $0d3300,x
$11:e598  ee 03 21      inc $2103
$11:e59b  80 e0         bra $e57d
$11:e59d  70 03         bvs $e5a2
$11:e59f  c0 0b         cpy #$0b
$11:e5a1  01 fc         ora ($fc,x)
$11:e5a3  1f 80 98 1e   ora $1e9880,x
$11:e5a7  38            sec
$11:e5a8  e7 8a         sbc [$8a]
$11:e5aa  39 f2 86      and $86f2,y
$11:e5ad  7d a1 0e      adc $0ea1,x
$11:e5b0  00 dd         brk #$dd
$11:e5b2  13 07         ora ($07,s),y
$11:e5b4  fe 5d 04      inc $045d,x
$11:e5b7  59 18 1c      eor $1c18,y
$11:e5ba  98            tya
$11:e5bb  18            clc
$11:e5bc  7d ef 2f      adc $2fef,x
$11:e5bf  7b            tdc
$11:e5c0  89 de f5      bit #$f5de
$11:e5c3  77 3c         adc [$3c],y
$11:e5c5  ad 9e 93      lda $939e
$11:e5c8  0d d0 ee      ora $eed0
$11:e5cb  50 3e         bvc $e60b
$11:e5cd  17 e8         ora [$e8],y
$11:e5cf  01 fd         ora ($fd,x)
$11:e5d1  2f 90 0b c4   and $c40b90
$11:e5d5  02 40         cop #$40
$11:e5d7  4c 1e 3c      jmp $3c1e
$11:e5da  02 e7         cop #$e7
$11:e5dc  00 9c         brk #$9c
$11:e5de  e0 3b         cpx #$3b
$11:e5e0  90 0e         bcc $e5f0
$11:e5e2  74 83         stz $83,x
$11:e5e4  c7 10         cmp [$10]
$11:e5e6  9a            txs
$11:e5e7  f2 2f         sbc ($2f)
$11:e5e9  58            cli
$11:e5ea  44 30 ef      mvp $ef,$30
$11:e5ed  a0 1d         ldy #$1d
$11:e5ef  f5 f8         sbc $f8,x
$11:e5f1  fd cd 43      sbc $43cd,x
$11:e5f4  fb            xce
$11:e5f5  80 7f         bra $e676
$11:e5f7  70 37         bvs $e630
$11:e5f9  ea            nop
$11:e5fa  97 4e         sta [$4e],y
$11:e5fc  2b            pld
$11:e5fd  81 fd         sta ($fd,x)
$11:e5ff  f1 65         sbc ($65),y
$11:e601  78            sei
$11:e602  5c ce 16 47   jml $4716ce
$11:e606  9d b5 7a      sta $7ab5,x
$11:e609  c9 80 05      cmp #$0580
$11:e60c  03 f8         ora $f8,s
$11:e60e  4f 90 0b 14   eor $140b90
$11:e612  80 5f         bra $e673
$11:e614  c7 41         cmp [$41]
$11:e616  3f db dd f8   and $f8dddb,x
$11:e61a  37 fc         and [$fc],y
$11:e61c  f4 f9 ae      pea $aef9
$11:e61f  18            clc
$11:e620  09 f3 54      ora #$54f3
$11:e623  03 c1         ora $c1,s
$11:e625  c0 ff         cpy #$ff
$11:e627  e2 3f         sep #$3f
$11:e629  fb            xce
$11:e62a  e2 e8         sep #$e8
$11:e62c  b9 89 ca      lda $ca89,y
$11:e62f  03 c0         ora $c0,s
$11:e631  f2 d9         sbc ($d9)
$11:e633  7f 90 2d cc   adc $cc2d90,x
$11:e637  ef 85 7f 1e   sbc $1e7f85
$11:e63b  06 48         asl $48
$11:e63d  3a            dec a
$11:e63e  18            clc
$11:e63f  01 00         ora ($00,x)
$11:e641  66 bf         ror $bf
$11:e643  ff df ff 13   sbc $13ffdf,x
$11:e647  ff bc ff ef   sbc $efffbc,x
$11:e64b  c4 a2         cpy $a2
$11:e64d  3d 17 f0      and $f017,x
$11:e650  5f fb b7 fc   eor $fcb7fb,x
$11:e654  0c 07 79      tsb $7907
$11:e657  42 eb         wdm #$eb
$11:e659  ca            dex
$11:e65a  37 f4         and [$f4],y
$11:e65c  00 d8         brk #$d8
$11:e65e  03 41         ora $41,s
$11:e660  ca            dex
$11:e661  0e 50 ff      asl $ff50
$11:e664  7f f7 bf fe   adc $febff7,x
$11:e668  b8            clv
$11:e669  20 45 61      jsr $6145
$11:e66c  fb            xce
$11:e66d  a2 7d         ldx #$7d
$11:e66f  29 7e         and #$7e
$11:e671  0a            asl a
$11:e672  fe a6 57      inc $57a6,x
$11:e675  ca            dex
$11:e676  bf 70 1f 46   lda $461f70,x
$11:e67a  2b            pld
$11:e67b  21 58         and ($58,x)
$11:e67d  75 04         adc $04,x
$11:e67f  c2 2b         rep #$2b
$11:e681  0c 00 38      tsb $3800
$11:e684  3f f7 ec 0f   and $0fecf7,x
$11:e688  06 fd         asl $fd
$11:e68a  92 b9         sta ($b9)
$11:e68c  e8            inx
$11:e68d  6f f8 da 9e   adc $9edaf8
$11:e691  32 a4         and ($a4)
$11:e693  55 0a         eor $0a,x
$11:e695  d6 ea         dec $ea,x
$11:e697  fd ff c0      sbc $c0ff,x
$11:e69a  ff f1 80 a1   sbc $a180f1,x
$11:e69e  d6 7f         dec $7f,x
$11:e6a0  f5 a0         sbc $a0,x
$11:e6a2  a1 a2         lda ($a2,x)
$11:e6a4  ff ed fb 0d   sbc $0dfbed,x
$11:e6a8  9d 3b 99      sta $993b,x
$11:e6ab  bd a9 ec      lda $eca9,x
$11:e6ae  b5 36         lda $36,x
$11:e6b0  fd 35 bb      sbc $bb35,x
$11:e6b3  ab            plb
$11:e6b4  5c ed ca 29   jml $29caed
$11:e6b8  ff fd 8f fe   sbc $fe8ffd,x
$11:e6bc  85 ff         sta $ff
$11:e6be  a6 ff         ldx $ff
$11:e6c0  f2 3f         sbc ($3f)
$11:e6c2  ec b7 e7      cpx $e7b7
$11:e6c5  49 fb ec      eor #$ecfb
$11:e6c8  7d f0 37      adc $37f0,x
$11:e6cb  ea            nop
$11:e6cc  9f ce 39 e2   sta $e239ce,x
$11:e6d0  b7 77         lda [$77],y
$11:e6d2  e7 19         sbc [$19]
$11:e6d4  89 96 5a      bit #$5a96
$11:e6d7  ab            plb
$11:e6d8  f5 e1         sbc $e1,x
$11:e6da  54 f8 66      mvn $66,$f8
$11:e6dd  21 9f         and ($9f,x)
$11:e6df  ff e4 1f fb   sbc $fb1fe4,x
$11:e6e3  3f fe d3 ff   and $ffd3fe,x
$11:e6e7  d5 19         cmp $19,x
$11:e6e9  86 01         stx $01
$11:e6eb  ff 9a ed eb   sbc $ebed9a,x
$11:e6ef  5d eb af      eor $afeb,x
$11:e6f2  76 57         ror $57,x
$11:e6f4  ba            tsx
$11:e6f5  ab            plb
$11:e6f6  7d 25 be      adc $be25,x
$11:e6f9  9a            txs
$11:e6fa  df 4e 07 ff   cmp $ff074e,x
$11:e6fe  a4 7f         ldy $7f
$11:e700  e6 3f         inc $3f
$11:e702  f9 1f fe      sbc $fe1f,y
$11:e705  8f ff 87 ff   sta $ff87ff
$11:e709  f3 c2         sbc ($c2,s),y
$11:e70b  61 d6         adc ($d6,x)
$11:e70d  f4 ea be      pea $beea
$11:e710  cd 55 66      cmp $6655
$11:e713  ab            plb
$11:e714  ac d4 dd      ldy $ddd4
$11:e717  fa            plx
$11:e718  d5 99         cmp $99,x
$11:e71a  36 27         rol $27,x
$11:e71c  b3 ae         lda ($ae,s),y
$11:e71e  94 7e         sty $7e,x
$11:e720  20 7e 0c      jsr $0c7e
$11:e723  3f 02 07 80   and $800702,x
$11:e727  73 04         adc ($04,s),y
$11:e729  82 01 71      brl $582d
$11:e72c  80 5c         bra $e78a
$11:e72e  e0 00         cpx #$00
$11:e730  00 20         brk #$20
$11:e732  80 3b         bra $e76f
$11:e734  c2 03         rep #$03
$11:e736  01 83         ora ($83,x)
$11:e738  43 22         eor $22,s
$11:e73a  31 19         and ($19),y
$11:e73c  dc ba 3d      jml [$3dba]
$11:e73f  28            plp
$11:e740  a4 4a         ldy $4a
$11:e742  2b            pld
$11:e743  0e f2 80      asl $80f2
$11:e746  41 a0         eor ($a0,x)
$11:e748  51 28         eor ($28),y
$11:e74a  24 90         bit $90
$11:e74c  04 11         tsb $11
$11:e74e  7a            ply
$11:e74f  84 1e         sty $1e
$11:e751  80 ef         bra $e742
$11:e753  17 78         ora [$78],y
$11:e755  70 2c         bvs $e783
$11:e757  11 08         ora ($08),y
$11:e759  86 e3         stx $e3
$11:e75b  d1 f0         cmp ($f0),y
$11:e75d  94 49         sty $49,x
$11:e75f  24 13         bit $13
$11:e761  40            rti
$11:e762  7a            ply
$11:e763  60            rts
$11:e764  32 14         and ($14)
$11:e766  0a            asl a
$11:e767  43 bc         eor $bc,s
$11:e769  3a            dec a
$11:e76a  11 4e         ora ($4e),y
$11:e76c  44 31 de      mvp $de,$31
$11:e76f  70 37         bvs $e7a8
$11:e771  90 42         bcc $e7b5
$11:e773  21 f2         and ($f2,x)
$11:e775  a9 b4 ae      lda #$aeb4
$11:e778  b1 04         lda ($04),y
$11:e77a  82 3c 82      brl $69b9
$11:e77d  05 03         ora $03
$11:e77f  82 41 c8      brl $afc3
$11:e782  21 00         and ($00,x)
$11:e784  87 c0         sta [$c0]
$11:e786  67 f0         adc [$f0]
$11:e788  7b            tdc
$11:e789  fc 6e 3f      jsr ($3f6e,x)
$11:e78c  3d de 6f      and $6fde,x
$11:e78f  b1 d3         lda ($d3),y
$11:e791  f8            sed
$11:e792  6c 77 9d      jmp ($9d77)
$11:e795  a6 c3         ldx $c3
$11:e797  f5 a2         sbc $a2,x
$11:e799  f2 f9         sbc ($f9)
$11:e79b  17 6f         ora [$6f],y
$11:e79d  87 4e         sta [$4e]
$11:e79f  e1 58         sbc ($58,x)
$11:e7a1  fc 3f 1f      jsr ($1f3f,x)
$11:e7a4  84 db         sty $db
$11:e7a6  e1 7b         sbc ($7b,x)
$11:e7a8  fc 7a ff      jsr ($ff7a,x)
$11:e7ab  1d cf e4      ora $e4cf,x
$11:e7ae  f7 f9         sbc [$f9],y
$11:e7b0  7f cf ff 8d   adc $8dffcf,x
$11:e7b4  81 25         sta ($25,x)
$11:e7b6  fa            plx
$11:e7b7  73 39         adc ($39,s),y
$11:e7b9  d3 ad         cmp ($ad,s),y
$11:e7bb  6d 66 55      adc $5566
$11:e7be  f0 f3         beq $e7b3
$11:e7c0  55 b8         eor $b8,x
$11:e7c2  71 08         adc ($08),y
$11:e7c4  8f 87 d5 c3   sta $c3d587
$11:e7c8  ef c0 e7 b2   sbc $b2e7c0
$11:e7cc  7f f5 1f bf   adc $bf1ff5,x
$11:e7d0  4f 9c c3 dd   eor $ddc39c
$11:e7d4  e1 80         sbc ($80,x)
$11:e7d6  48            pha
$11:e7d7  87 03         sta [$03]
$11:e7d9  81 e0         sta ($e0,x)
$11:e7db  c0 4c         cpy #$4c
$11:e7dd  28            plp
$11:e7de  1c 0d 87      trb $870d
$11:e7e1  43 51         eor $51,s
$11:e7e3  30 77         bmi $e85c
$11:e7e5  8e 00 26      stx $2600
$11:e7e8  10 0f         bpl $e7f9
$11:e7ea  07 03         ora [$03]
$11:e7ec  e1 20         sbc ($20,x)
$11:e7ee  f0 40         beq $e830
$11:e7f0  3e 1c 0f      rol $0f1c,x
$11:e7f3  c0 3c         cpy #$3c
$11:e7f5  dd e7 02      cmp $02e7,x
$11:e7f8  81 41         sta ($41,x)
$11:e7fa  60            rts
$11:e7fb  90 25         bcc $e822
$11:e7fd  83 8c         sta $8c,s
$11:e7ff  4a            lsr a
$11:e800  07 07         ora [$07]
$11:e802  65 05         adc $05
$11:e804  ea            nop
$11:e805  f3 fd         sbc ($fd,s),y
$11:e807  8e ef a3      stx $a3ef
$11:e80a  57 b8         eor [$b8],y
$11:e80c  ed 76 1d      sbc $1d76
$11:e80f  9d 87 5b      sta $5b87,x
$11:e812  a8            tay
$11:e813  ba            tsx
$11:e814  fc 34 76      jsr ($7634,x)
$11:e817  09 c6 e1      ora #$e1c6
$11:e81a  f8            sed
$11:e81b  fc 3e df      jsr ($df3e,x)
$11:e81e  07 db         ora [$db]
$11:e820  e1 f7         sbc ($f7,x)
$11:e822  f8            sed
$11:e823  6e 7f 17      ror $177f
$11:e826  af c7 fe 7f   lda $7ffec7
$11:e82a  fe fd df      inc $dffd,x
$11:e82d  69 3e ac      adc #$ac3e
$11:e830  de 56 eb      dec $eb56,x
$11:e833  5a            phy
$11:e834  df 56 fd bc   cmp $bcfd56,x
$11:e838  c6 e8         dec $e8
$11:e83a  48            pha
$11:e83b  64 1c         stz $1c
$11:e83d  3e b6 1f      rol $1fb6,x
$11:e840  79 07 bd      adc $bd07,y
$11:e843  53 fe         eor ($fe,s),y
$11:e845  38            sec
$11:e846  fd 86 7e      sbc $7e86,x
$11:e849  e1 1f         sbc ($1f,x)
$11:e84b  50 15         bvc $e862
$11:e84d  03 01         ora $01,s
$11:e84f  a0 e0         ldy #$e0
$11:e851  58            cli
$11:e852  34 09         bit $09,x
$11:e854  b0 a8         bcs $e7fe
$11:e856  58            cli
$11:e857  25 17         and $17
$11:e859  04 fb         tsb $fb
$11:e85b  09 47 e1      ora #$e147
$11:e85e  80 15         bra $e875
$11:e860  02 b8         cop #$b8
$11:e862  d7 20         cmp [$20],y
$11:e864  cd 01 a0      cmp $a001
$11:e867  41 60         eor ($60,x)
$11:e869  c3 92         cmp $92,s
$11:e86b  57 9a         eor [$9a],y
$11:e86d  f4 20 70      pea $7020
$11:e870  48            pha
$11:e871  3c 00 90      bit $9000,x
$11:e874  84 f9         sty $f9
$11:e876  da            phx
$11:e877  ef 6f 3f f2   sbc $f23f6f
$11:e87b  7c 49 64      jmp ($6449,x)
$11:e87e  b1 8d         lda ($8d),y
$11:e880  2d 0b 4a      and $4a0b
$11:e883  b3 2a         lda ($2a,s),y
$11:e885  00 4c         brk #$4c
$11:e887  38            sec
$11:e888  09 30 f0      ora #$f030
$11:e88b  68            pla
$11:e88c  28            plp
$11:e88d  07 a1         ora [$a1]
$11:e88f  57 9d         eor [$9d],y
$11:e891  01 46         ora ($46,x)
$11:e893  22 44 55 04   jsl $045544
$11:e897  f2 01         sbc ($01)
$11:e899  7e 9e 70      ror $709e,x
$11:e89c  e4 89         cpx $89
$11:e89e  41 49         eor ($49,x)
$11:e8a0  82 44 11      brl $f9e7
$11:e8a3  e2 b4         sep #$b4
$11:e8a5  04 80         tsb $80
$11:e8a7  a8            tay
$11:e8a8  d5 3c         cmp $3c,x
$11:e8aa  46 07         lsr $07
$11:e8ac  42 09         wdm #$09
$11:e8ae  d0 55         bne $e905
$11:e8b0  f3 40         sbc ($40,s),y
$11:e8b2  e0 1d         cpx #$1d
$11:e8b4  80 44         bra $e8fa
$11:e8b6  07 f3         ora [$f3]
$11:e8b8  cb            wai
$11:e8b9  55 27         eor $27,x
$11:e8bb  5f ca 24 42   eor $4224ca,x
$11:e8bf  21 28         and ($28,x)
$11:e8c1  30 26         bmi $e8e9
$11:e8c3  0b            phd
$11:e8c4  04 1f         tsb $1f
$11:e8c6  29 43         and #$43
$11:e8c8  70 1b         bvs $e8e5
$11:e8ca  83 50         sta $50,s
$11:e8cc  d8            cld
$11:e8cd  42 2b         wdm #$2b
$11:e8cf  12 8a         ora ($8a)
$11:e8d1  44 ba 3d      mvp $3d,$ba
$11:e8d4  11 9d         ora ($9d),y
$11:e8d6  c3 22         cmp $22,s
$11:e8d8  30 11         bmi $e8eb
$11:e8da  f0 40         beq $e91c
$11:e8dc  61 f8         adc ($f8,x)
$11:e8de  09 3d         ora #$3d
$11:e8e0  82 2f 50      brl $3912
$11:e8e3  80 c0         bra $e8a5
$11:e8e5  20 92 48      jsr $4892
$11:e8e8  14 4a         trb $4a
$11:e8ea  00 fc         brk #$fc
$11:e8ec  18            clc
$11:e8ed  a4 6a         ldy $6a
$11:e8ef  41 34         eor ($34,x)
$11:e8f1  94 49         sty $49,x
$11:e8f3  3d 1f 08      and $081f,x
$11:e8f6  86 e2         stx $e2
$11:e8f8  c1 10         cmp ($10,x)
$11:e8fa  42 8a         wdm #$8a
$11:e8fc  34 20         bit $20,x
$11:e8fe  5c 88 67 42   jml $426788
$11:e902  28            plp
$11:e903  71 1a         adc ($1a),y
$11:e905  46 03         lsr $03
$11:e907  20 1b 28      jsr $281b
$11:e90a  54 6e 2b      mvn $2b,$6e
$11:e90d  37 95         and [$95],y
$11:e90f  59 a6 ba      eor $baa6,y
$11:e912  c9 bc         cmp #$bc
$11:e914  de 1d 0c      dec $0c1d,x
$11:e917  80 c0         bra $e8d9
$11:e919  60            rts
$11:e91a  90 79         bcc $e995
$11:e91c  24 fe         bit $fe
$11:e91e  91 7f         sta ($7f),y
$11:e920  c8            iny
$11:e921  ff e8 7f f8   sbc $f87fe8,x
$11:e925  c4 22         cpy $22
$11:e927  0f 03 83 41   ora $418303
$11:e92b  e1 10         sbc ($10,x)
$11:e92d  fd be 0a      sbc $0abe,x
$11:e930  f7 03         sbc [$03],y
$11:e932  e1 c0         sbc ($c0,x)
$11:e934  fc 3c 1f      jsr ($1f3c,x)
$11:e937  0f 86 e3 61   ora $61e386
$11:e93b  a8            tay
$11:e93c  f0 61         beq $e99f
$11:e93e  1e 8b e7      asl $e78b,x
$11:e941  f3 f3         sbc ($f3,s),y
$11:e943  f8            sed
$11:e944  e0 f0         cpx #$f0
$11:e946  00 a0         brk #$a0
$11:e948  86 0c         stx $0c
$11:e94a  86 42         stx $42
$11:e94c  61 f0         adc ($f0,x)
$11:e94e  8c 7e 2f      sty $2f7e
$11:e951  7b            tdc
$11:e952  ce ed fa      dec $faed
$11:e955  2d f7 c4      and $c4f7
$11:e958  f8            sed
$11:e959  70 de         bvs $e939
$11:e95b  0d 1f 83      ora $831f
$11:e95e  cf e3 e3 f1   cmp $f1e3e3
$11:e962  fa            plx
$11:e963  10 f9         bpl $e95e
$11:e965  84 3f         sty $3f
$11:e967  f1 0f         sbc ($0f),y
$11:e969  f7 43         sbc [$43],y
$11:e96b  fc f0 7f      jsr ($7ff0,x)
$11:e96e  0c 07 c1      tsb $c107
$11:e971  00 a1         brk #$a1
$11:e973  c0 28         cpy #$28
$11:e975  94 8d         sty $8d,x
$11:e977  04 c3         tsb $c3
$11:e979  91 14         sta ($14),y
$11:e97b  b2 62         lda ($62)
$11:e97d  b7 5c         lda [$5c],y
$11:e97f  da            phx
$11:e980  ad bb 55      lda $55bb
$11:e983  b3 b2         lda ($b2,s),y
$11:e985  7a            ply
$11:e986  36 1f         rol $1f,x
$11:e988  ca            dex
$11:e989  47 e2         eor [$e2]
$11:e98b  41 fc         eor ($fc,x)
$11:e98d  88            dey
$11:e98e  7f a0 1f fc   adc $fc1fa0,x
$11:e992  07 fe         ora [$fe]
$11:e994  89 7f         bit #$7f
$11:e996  e8            inx
$11:e997  47 07         eor [$07]
$11:e999  61 01         adc ($01,x)
$11:e99b  81 c0         sta ($c0,x)
$11:e99d  20 50 28      jsr $2850
$11:e9a0  34 06         bit $06,x
$11:e9a2  0b            phd
$11:e9a3  04 86         tsb $86
$11:e9a5  c0 a1         cpy #$a1
$11:e9a7  6b            rtl
$11:e9a8  10 81         bpl $e92b
$11:e9aa  2c 82 07      bit $0782
$11:e9ad  05 83         ora $83
$11:e9af  c0 60         cpy #$60
$11:e9b1  f0 a8         beq $e95b
$11:e9b3  7c 0a 1f      jmp ($1f0a,x)
$11:e9b6  04 65         tsb $65
$11:e9b8  04 1e         tsb $1e
$11:e9ba  bd 15 a3      lda $a315,x
$11:e9bd  c5 b5         cmp $b5
$11:e9bf  db            stp
$11:e9c0  f8            sed
$11:e9c1  be ae 37      ldx $37ae,y
$11:e9c4  ab            plb
$11:e9c5  f5 f6         sbc $f6,x
$11:e9c7  e6 75         inc $75
$11:e9c9  ba            tsx
$11:e9ca  4c d7 d3      jmp $d3d7
$11:e9cd  f8            sed
$11:e9ce  f5 7e         sbc $7e,x
$11:e9d0  28            plp
$11:e9d1  7f 8a 3f f2   adc $f23f8a,x
$11:e9d5  83 f8         sta $f8,s
$11:e9d7  84 fc         sty $fc
$11:e9d9  31 3f         and ($3f),y
$11:e9db  0c e7 83      tsb $83e7
$11:e9de  cb            wai
$11:e9df  66 d9         ror $d9
$11:e9e1  78            sei
$11:e9e2  e5 be         sbc $be
$11:e9e4  18            clc
$11:e9e5  f7 22         sbc [$22],y
$11:e9e7  3f dc bc f2   and $f2bcdc,x
$11:e9eb  3d 3c fe      and $fe3c,x
$11:e9ee  6f 5b 71 1f   adc $1f715b
$11:e9f2  be 47 d0      ldx $d047,y
$11:e9f5  a1 c7         lda ($c7,x)
$11:e9f7  83 f3         sta $f3,s
$11:e9f9  e0 7e         cpx #$7e
$11:e9fb  79 3f c2      adc $c23f,y
$11:e9fe  7f e0 56 07   adc $0756e0,x
$11:ea02  e3 29         sbc $29,s
$11:ea04  20 f4 5d      jsr $5df4
$11:ea07  2b            pld
$11:ea08  19 0d 27      ora $270d,y
$11:ea0b  22 99 68 80   jsl $806899
$11:ea0f  41 28         eor ($28,x)
$11:ea11  06 70         asl $70
$11:ea13  fc 52 3f      jsr ($3f52,x)
$11:ea16  90 0f         bcc $ea27
$11:ea18  e4 83         cpx $83
$11:ea1a  f1 30         sbc ($30),y
$11:ea1c  fe 64 3f      inc $3f64,x
$11:ea1f  98            tya
$11:ea20  8c 61 98      sty $9861
$11:ea23  17 c0         ora [$c0],y
$11:ea25  bf 09 ac c6   lda $c6ac09,x
$11:ea29  2f 1d 84 43   and $43841d
$11:ea2d  a1 b0         lda ($b0,x)
$11:ea2f  e8            inx
$11:ea30  74 1e         stz $1e,x
$11:ea32  0b            phd
$11:ea33  01 66         ora ($66,x)
$11:ea35  83 34         sta $34,s
$11:ea37  20 d3 79      jsr $79d3
$11:ea3a  14 fe         trb $fe
$11:ea3c  23 1f         and $1f,s
$11:ea3e  80 43         bra $ea83
$11:ea40  e1 10         sbc ($10,x)
$11:ea42  f8            sed
$11:ea43  b4 5e         ldy $5e,x
$11:ea45  37 b7         and [$b7],y
$11:ea47  8c ed e9      sty $e9ed
$11:ea4a  9f aa 27 ef   sta $ef27aa,x
$11:ea4e  49 db         eor #$db
$11:ea50  97 f4         sta [$f4],y
$11:ea52  7d 70 0b      adc $0b70,x
$11:ea55  4e 02 81      lsr $8102
$11:ea58  f7 2f         sbc [$2f],y
$11:ea5a  84 07         sty $07
$11:ea5c  fe a7 03      inc $03a7,x
$11:ea5f  2b            pld
$11:ea60  68            pla
$11:ea61  2c 1b 0b      bit $0b1b
$11:ea64  85 13         sta $13
$11:ea66  91 b0         sta ($b0),y
$11:ea68  d4 6a         pei ($6a)
$11:ea6a  3b            tsc
$11:ea6b  1d 09 81      ora $8109,x
$11:ea6e  bc 29 1c      ldy $1c29,x
$11:ea71  88            dey
$11:ea72  07 82         ora [$82]
$11:ea74  21 e0         and ($e0,x)
$11:ea76  90 7b         bcc $eaf3
$11:ea78  28            plp
$11:ea79  82 20 fc      brl $e69c
$11:ea7c  40            rti
$11:ea7d  3e 11 0f      rol $0f11,x
$11:ea80  80 48         bra $eaca
$11:ea82  20 70 18      jsr $1870
$11:ea85  32 d4         and ($d4)
$11:ea87  30 5a         bmi $eae3
$11:ea89  cf 7f 4a bb   cmp $bb4a7f
$11:ea8d  6f 94 4d a2   adc $a24d94
$11:ea91  f3 e9         sbc ($e9,s),y
$11:ea93  2c 0e 07      bit $070e
$11:ea96  07 50         ora [$50]
$11:ea98  8e bf 61      stx $61bf
$11:ea9b  ff f8 df ef   sbc $efdff8,x
$11:ea9f  13 fb         ora ($fb,s),y
$11:eaa1  e4 ff         cpx $ff
$11:eaa3  b3 00         lda ($00,s),y
$11:eaa5  80 60         bra $eb07
$11:eaa7  16 23         asl $23,x
$11:eaa9  60            rts
$11:eaaa  f0 6a         beq $eb16
$11:eaac  2f 15 4d 64   and $644d15
$11:eab0  ab            plb
$11:eab1  ad 5e d1      lda $d15e
$11:eab4  2c 49 62      bit $6249
$11:eab7  1e 04 38      asl $3804,x
$11:eaba  89 03         bit #$03
$11:eabc  fd 10 ff      sbc $ff10,x
$11:eabf  60            rts
$11:eac0  20 13 c8      jsr $c813
$11:eac3  05 fa         ora $fa
$11:eac5  79 c3 92      adc $92c3,y
$11:eac8  35 05         and $05,x
$11:eaca  a6 0d         ldx $0d
$11:eacc  10 67         bpl $eb35
$11:eace  8a            txa
$11:eacf  bc 1a 02      ldy $021a,x
$11:ead2  e3 56         sbc $56,s
$11:ead4  f1 40         sbc ($40),y
$11:ead6  20 2e f1      jsr $f12e
$11:ead9  80 c1         bra $ea9c
$11:eadb  e1 90         sbc ($90,x)
$11:eadd  08            php
$11:eade  d4 3a         pei ($3a)
$11:eae0  21 28         and ($28,x)
$11:eae2  84 4a         sty $4a
$11:eae4  1d a4 df      ora $dfa4,x
$11:eae7  18            clc
$11:eae8  34 0e         bit $0e,x
$11:eaea  15 01         ora $01,x
$11:eaec  88            dey
$11:eaed  41 e4         eor ($e4,x)
$11:eaef  11 79         ora ($79),y
$11:eaf1  83 fd         sta $fd,s
$11:eaf3  78            sei
$11:eaf4  16 08         asl $08,x
$11:eaf6  06 c1         asl $c1
$11:eaf8  00 12         brk #$12
$11:eafa  89 03         bit #$03
$11:eafc  f9 b8 18      sbc $18b8,y
$11:eaff  0d 04 02      ora $0204
$11:eb02  21 c0         and ($c0,x)
$11:eb04  84 74         sty $74
$11:eb06  23 10         and $10,s
$11:eb08  28            plp
$11:eb09  2c 36 17      bit $1736
$11:eb0c  14 85         trb $85
$11:eb0e  46 a0         lsr $a0
$11:eb10  d0 98         bne $eaaa
$11:eb12  2c 1a 1d      bit $1d1a
$11:eb15  08            php
$11:eb16  84 2b         sty $2b
$11:eb18  c2 11         rep #$11
$11:eb1a  0f 80 43 e2   ora $e24380
$11:eb1e  31 f2         and ($f2),y
$11:eb20  18            clc
$11:eb21  44 e3 f1      mvp $f1,$e3
$11:eb24  28            plp
$11:eb25  f4 52 39      pea $3952
$11:eb28  18            clc
$11:eb29  8c 57 ef      sty $ef57
$11:eb2c  fd fb 7f      sbc $7ffb,x
$11:eb2f  bf fe 54 09   lda $0954fe,x
$11:eb33  fc fe 3f      jsr ($3ffe,x)
$11:eb36  1f 87 c3 d3   ora $d3c387,x
$11:eb3a  e1 8f         sbc ($8f,x)
$11:eb3c  ff f3 cc 02   sbc $02ccf3,x
$11:eb40  53 02         eor ($02,s),y
$11:eb42  bb            tyx
$11:eb43  43 a0         eor $a0,s
$11:eb45  fc fe 7f      jsr ($7ffe,x)
$11:eb48  ef f9 f5 fc   sbc $fcf5f9
$11:eb4c  7e bc 7e      ror $7ebc,x
$11:eb4f  bf 67 d3 cf   lda $cfd367,x
$11:eb53  f2 f9         sbc ($f9)
$11:eb55  41 e0         eor ($e0,x)
$11:eb57  1c 1e 07      trb $071e
$11:eb5a  bf c1 ff f3   lda $f3ffc1,x
$11:eb5e  ff 3f ff 0f   sbc $0fff3f,x
$11:eb62  ff e3 ff fd   sbc $fdffe3,x
$11:eb66  ff e8 2a 14   sbc $142ae8,x
$11:eb6a  01 40         ora ($40,x)
$11:eb6c  09 81         ora #$81
$11:eb6e  60            rts
$11:eb6f  34 0e         bit $0e,x
$11:eb71  07 42         ora [$42]
$11:eb73  61 b0         adc ($b0,x)
$11:eb75  e4 7c         cpx $7c
$11:eb77  28            plp
$11:eb78  0c 50 13      tsb $1350
$11:eb7b  03 38         ora $38,s
$11:eb7d  13 21         ora ($21,s),y
$11:eb7f  20 f0 42      jsr $42f0
$11:eb82  18            clc
$11:eb83  e1 f8         sbc ($f8,x)
$11:eb85  83 41         sta $41,s
$11:eb87  20 f0 38      jsr $38f0
$11:eb8a  04 11         tsb $11
$11:eb8c  c0 0b 56      cpy #$560b
$11:eb8f  7a            ply
$11:eb90  80 14         bra $eba6
$11:eb92  20 4a f0      jsr $f04a
$11:eb95  5a            phy
$11:eb96  3f d7 53 4d   and $4d53d7,x
$11:eb9a  f9 95 42      sbc $4295,y
$11:eb9d  af 69 bc d1   lda $d1bc69
$11:eba1  66 d1         ror $d1
$11:eba3  ea            nop
$11:eba4  d4 7a         pei ($7a)
$11:eba6  d9 72 9e      cmp $9e72,y
$11:eba9  f2 67         sbc ($67)
$11:ebab  f8            sed
$11:ebac  1a            inc a
$11:ebad  7c 06 7f      jmp ($7f06,x)
$11:ebb0  09 af         ora #$af
$11:ebb2  c6 e4         dec $e4
$11:ebb4  33 fb         and ($fb,s),y
$11:ebb6  0d ff 03      ora $03ff
$11:ebb9  ff fd 7a fd   sbc $fd7afd,x
$11:ebbd  df bf ef f7   cmp $f7efbf,x
$11:ebc1  db            stp
$11:ebc2  ed ef 77      sbc $77ef
$11:ebc5  8a            txa
$11:ebc6  a1 f3         lda ($f3,x)
$11:ebc8  f9 f0 38      sbc $38f0,y
$11:ebcb  1c 4f ff      trb $ff4f
$11:ebce  33 ff         and ($ff,s),y
$11:ebd0  ce ff be      dec $beff
$11:ebd3  04 a8         tsb $a8
$11:ebd5  2f b2 4c 0a   and $0a4cb2
$11:ebd9  98            tya
$11:ebda  13 01         ora ($01,s),y
$11:ebdc  80 51         bra $ec2f
$11:ebde  80 38         bra $ec18
$11:ebe0  42 60         wdm #$60
$11:ebe2  95 00         sta $00,x
$11:ebe4  88            dey
$11:ebe5  08            php
$11:ebe6  1c 2c 00      trb $002c
$11:ebe9  d0 81         bne $eb6c
$11:ebeb  40            rti
$11:ebec  20 b0 48      jsr $48b0
$11:ebef  14 0a         trb $0a
$11:ebf1  02 35         cop #$35
$11:ebf3  38            sec
$11:ebf4  1c 08 76      trb $7608
$11:ebf7  06 90         asl $90
$11:ebf9  85 c3         sta $c3
$11:ebfb  e0 b0 71      cpx #$71b0
$11:ebfe  e0 91 c4      cpx #$c491
$11:ec01  74 03         stz $03,x
$11:ec03  a0 c9 7e      ldy #$7ec9
$11:ec06  6d 97 3e      adc $3e97
$11:ec09  d5 93         cmp $93,x
$11:ec0b  37 65         and [$65],y
$11:ec0d  e9 da         sbc #$da
$11:ec0f  3a            dec a
$11:ec10  d2 9f         cmp ($9f)
$11:ec12  2f 6f c7 ff   and $ffc76f
$11:ec16  8c 79 f7      sty $f779
$11:ec19  9c 3f fe      stz $fe3f
$11:ec1c  17 fd         ora [$fd],y
$11:ec1e  85 bf         sta $bf
$11:ec20  c2 27         rep #$27
$11:ec22  b0 8a         bcs $ebae
$11:ec24  1c 02 7d      trb $7d02
$11:ec27  00 d8         brk #$d8
$11:ec29  64 2c         stz $2c
$11:ec2b  12 00         ora ($00)
$11:ec2d  d9 0b 04      cmp $040b,y
$11:ec30  58            cli
$11:ec31  21 60         and ($60,x)
$11:ec33  b4 7e         ldy $7e,x
$11:ec35  3a            dec a
$11:ec36  1f 0d 07 80   ora $80070d,x
$11:ec3a  20 48 73      jsr $7348
$11:ec3d  e0 56 ed      cpx #$ed56
$11:ec40  94 fb         sty $fb,x
$11:ec42  c5 c6         cmp $c6
$11:ec44  ed 14 8b      sbc $8b14
$11:ec47  c2 a1         rep #$a1
$11:ec49  70 32         bvs $ec7d
$11:ec4b  60            rts
$11:ec4c  40            rti
$11:ec4d  57 a1         eor [$a1],y
$11:ec4f  7f c0 27 c2   adc $c227c0,x
$11:ec53  ef 88 8b da   sbc $da8b88
$11:ec57  21 71         and ($71,x)
$11:ec59  48            pha
$11:ec5a  1c 32 03      trb $0332
$11:ec5d  06 5f         asl $5f
$11:ec5f  04 73         tsb $73
$11:ec61  45 8a         eor $8a
$11:ec63  ab            plb
$11:ec64  72 26         adc ($26)
$11:ec66  9f 48 65 a3   sta $a36548,x
$11:ec6a  31 10         and ($10),y
$11:ec6c  f8            sed
$11:ec6d  78            sei
$11:ec6e  3c 02 c0      bit $c002,x
$11:ec71  ff 68 3f d5   sbc $d53f68,x
$11:ec75  0f e4 c3 f9   ora $f9c3e4
$11:ec79  00 fc         brk #$fc
$11:ec7b  40            rti
$11:ec7c  3e 10 8f      rol $8f10,x
$11:ec7f  04 43         tsb $43
$11:ec81  81 20         sta ($20,x)
$11:ec83  80 4f         bra $ecd4
$11:ec85  20 17 e9      jsr $e917
$11:ec88  e7 0e         sbc [$0e]
$11:ec8a  48            pha
$11:ec8b  d4 16         pei ($16)
$11:ec8d  98            tya
$11:ec8e  34 41         bit $41,x
$11:ec90  9e 29 d0      stz $d029,x
$11:ec93  68            pla
$11:ec94  0b            phd
$11:ec95  8d 5b c3      sta $c35b
$11:ec98  a0 b0 42      ldy #$42b0
$11:ec9b  25 11         and $11
$11:ec9d  09 44 6a      ora #$6a44
$11:eca0  1d 0c 56      ora $560c,x
$11:eca3  84 1d         sty $1d
$11:eca5  5a            phy
$11:eca6  09 c0 8f      ora #$8fc0
$11:eca9  c0 22 f3      cpy #$f322
$11:ecac  08            php
$11:ecad  3c 82 03      bit $0382,x
$11:ecb0  10 81         bpl $ec33
$11:ecb2  c2 a0         rep #$a0
$11:ecb4  0a            asl a
$11:ecb5  c0 6f 8c      cpy #$8c6f
$11:ecb8  2a            rol a
$11:ecb9  19 20 79      ora $7920,y
$11:ecbc  0e c3 c1      asl $c1c3
$11:ecbf  60            rts
$11:ecc0  4e 82 18      lsr $1882
$11:ecc3  1b            tcs
$11:ecc4  e3 f0         sbc $f0,s
$11:ecc6  80 74         bra $ed3c
$11:ecc8  23 1c         and $1c,s
$11:ecca  08            php
$11:eccb  44 02 21      mvp $21,$02
$11:ecce  80 d0         bra $eca0
$11:ecd0  06 52         asl $52
$11:ecd2  20 0b 21      jsr $210b
$11:ecd5  84 c4         sty $c4
$11:ecd7  05 fa         ora $fa
$11:ecd9  9b            txy
$11:ecda  22 1f 8c 27   jsl $278c1f
$11:ecde  f7 fa         sbc [$fa],y
$11:ece0  fd 7e e3      sbc $e37e,x
$11:ece3  91 d8         sta ($d8),y
$11:ece5  3c 1e 05      bit $051e,x
$11:ece8  02 27         cop #$27
$11:ecea  a7 f7         lda [$f7]
$11:ecec  ff fc ff c7   sbc $c7fffc,x
$11:ecf0  a3 f0         lda $f0,s
$11:ecf2  68            pla
$11:ecf3  3a            dec a
$11:ecf4  65 1c         adc $1c
$11:ecf6  01 58         ora ($58,x)
$11:ecf8  b0 6b         bcs $ed65
$11:ecfa  26 9e         rol $9e
$11:ecfc  89 a5 53      bit #$53a5
$11:ecff  b1 68         lda ($68),y
$11:ed01  f6 66         inc $66,x
$11:ed03  33 90         and ($90,s),y
$11:ed05  c7 b8         cmp [$b8]
$11:ed07  40            rti
$11:ed08  30 9f         bmi $eca9
$11:ed0a  ce 02 80      dec $8002
$11:ed0d  6c 1f cb      jmp ($cb1f)
$11:ed10  87 f2         sta [$f2]
$11:ed12  21 9c         and ($9c,x)
$11:ed14  84 27         sty $27
$11:ed16  04 ba         tsb $ba
$11:ed18  6b            rtl
$11:ed19  21 81         and ($81,x)
$11:ed1b  c0 96 e4      cpy #$e496
$11:ed1e  b2 15         lda ($15)
$11:ed20  90 ae         bcc $ecd0
$11:ed22  0a            asl a
$11:ed23  00 c6         brk #$c6
$11:ed25  35 c0         and $c0,x
$11:ed27  67 fc         adc [$fc]
$11:ed29  77 5c         adc [$5c],y
$11:ed2b  4f 6a 7d ba   eor $ba7d6a
$11:ed2f  b7 75         lda [$75],y
$11:ed31  ab            plb
$11:ed32  d7 4e         cmp [$4e],y
$11:ed34  e7 63         sbc [$63]
$11:ed36  31 80         and ($80),y
$11:ed38  7c 07 fe      jmp ($fe07,x)
$11:ed3b  07 ff         ora [$ff]
$11:ed3d  81 7f         sta ($7f,x)
$11:ed3f  a2 5f e9      ldx #$e95f
$11:ed42  97 fa         sta [$fa],y
$11:ed44  69 fc a8      adc #$a8fc
$11:ed47  76 30         ror $30,x
$11:ed49  0e d1 18      asl $18d1
$11:ed4c  63 bf         adc $bf,s
$11:ed4e  a8            tay
$11:ed4f  14 00         trb $00
$11:ed51  0f 98 6c ee   ora $ee6c98
$11:ed55  10 48         bpl $ed9f
$11:ed57  21 86         and ($86,x)
$11:ed59  a0 a7 60      ldy #$60a7
$11:ed5c  83 0c         sta $0c,s
$11:ed5e  6b            rtl
$11:ed5f  79 3c 88      adc $883c,y
$11:ed62  4f 2f 54 29   eor $29542f
$11:ed66  b4 2a         ldy $2a,x
$11:ed68  29 18 8a      and #$8a18
$11:ed6b  47 15         eor [$15]
$11:ed6d  a5 db         lda $db
$11:ed6f  e1 df         sbc ($df,x)
$11:ed71  a8            tay
$11:ed72  d2 4a         cmp ($4a)
$11:ed74  15 62         ora $62,x
$11:ed76  95 20         sta $20,x
$11:ed78  9e 19 c2      stz $c219,x
$11:ed7b  31 18         and ($18),y
$11:ed7d  57 86         eor [$86],y
$11:ed7f  83 c1         sta $c1,s
$11:ed81  40            rti
$11:ed82  b0 48         bcs $edcc
$11:ed84  24 0f         bit $0f
$11:ed86  19 f0 40      ora $40f0,y
$11:ed89  2c 10 03      bit $0310
$11:ed8c  a4 af         ldy $af
$11:ed8e  d1 76         cmp ($76),y
$11:ed90  30 28         bmi $edba
$11:ed92  2c 19 32      bit $3219
$11:ed95  48            pha
$11:ed96  e0 4f 8b      cpx #$8b4f
$11:ed99  19 20 ea      ora $ea20,y
$11:ed9c  93 57         sta ($57,s),y
$11:ed9e  be 07 02      ldx $0207,y
$11:eda1  b8            clv
$11:eda2  09 26 95      ora #$9526
$11:eda5  5f 0b 80 64   eor $64800b,x
$11:eda9  8e 95 de      stx $de95
$11:edac  38            sec
$11:edad  0a            asl a
$11:edae  07 03         ora [$03]
$11:edb0  81 40         sta ($40,x)
$11:edb2  69 06 82      adc #$8206
$11:edb5  c0 d9 27      cpy #$27d9
$11:edb8  f0 37         beq $edf1
$11:edba  c7 80         cmp [$80]
$11:edbc  e3 34         sbc $34,s
$11:edbe  00 3a         brk #$3a
$11:edc0  89 16 64      bit #$6416
$11:edc3  10 81         bpl $ed46
$11:edc5  0f 86 09 0c   ora $0c0986
$11:edc9  89 4c 05      bit #$054c
$11:edcc  67 03         adc [$03]
$11:edce  80 c1         bra $ed91
$11:edd0  c0 c1 08      cpy #$08c1
$11:edd3  87 c4         sta [$c4]
$11:edd5  e3 f0         sbc $f0,s
$11:edd7  f9 fd ea      sbc $eafd,y
$11:edda  f3 7d         sbc ($7d,s),y
$11:eddc  8e ef b3      stx $b3ef
$11:eddf  5f b8 ef 77   eor $77efb8,x
$11:ede3  9d 2d 87      sta $872d,x
$11:ede6  67 a2         adc [$a2]
$11:ede8  bd 7f b4      lda $b47f,x
$11:edeb  76 09         ror $09,x
$11:eded  c6 e1         dec $e1
$11:edef  d8            cld
$11:edf0  fc 3e df      jsr ($df3e,x)
$11:edf3  04 db         tsb $db
$11:edf5  e1 f7         sbc ($f7,x)
$11:edf7  f8            sed
$11:edf8  7a            ply
$11:edf9  7f 10 af c7   adc $c7af10,x
$11:edfd  fa            plx
$11:edfe  7d fc fc      adc $fcfc,x
$11:ee01  df a9 5e dc   cmp $dc5ea9,x
$11:ee05  f6 6a         inc $6a,x
$11:ee07  e7 55         sbc [$55]
$11:ee09  d8            cld
$11:ee0a  d6 7d         dec $7d,x
$11:ee0c  1c ad 76      trb $76ad
$11:ee0f  1a            inc a
$11:ee10  41 22         eor ($22,x)
$11:ee12  e1 f5         sbc ($f5,x)
$11:ee14  70 fb         bvs $ee11
$11:ee16  88            dey
$11:ee17  3d f2 9f      and $9ff2,x
$11:ee1a  fe c7 ed      inc $edc7,x
$11:ee1d  f3 f7         sbc ($f7,s),y
$11:ee1f  18            clc
$11:ee20  fa            plx
$11:ee21  fc b0 0d      jsr ($0db0,x)
$11:ee24  50 b0         bvc $edd6
$11:ee26  35 83         and $83,x
$11:ee28  61 c0         adc ($c0,x)
$11:ee2a  94 4c         sty $4c,x
$11:ee2c  2d 94 85      and $8594
$11:ee2f  f9 f0 30      sbc $30f0,y
$11:ee32  1e 09 02      asl $0209,x
$11:ee35  00 3e         brk #$3e
$11:ee37  1c 0f c6      trb $c60f
$11:ee3a  c3 f8         cmp $f8,s
$11:ee3c  bf 95 f8 c0   lda $c0f895,x
$11:ee40  54 c0 6f      mvn $6f,$c0
$11:ee43  c8            iny
$11:ee44  1a            inc a
$11:ee45  38            sec
$11:ee46  5f 01 0c 89   eor $890c01,x
$11:ee4a  cc 29 dc      cpy $dc29
$11:ee4d  29 5c 62      and #$625c
$11:ee50  9b            txy
$11:ee51  c4 ad         cpy $ad
$11:ee53  46 17         lsr $17
$11:ee55  e1 06         sbc ($06,x)
$11:ee57  83 40         sta $40,s
$11:ee59  e1 e0         sbc ($e0,x)
$11:ee5b  d0 9e         bne $edfb
$11:ee5d  ff ec f7 f9   sbc $f9f7ec,x
$11:ee61  df ff cf ff   cmp $ffcfff,x
$11:ee65  eb            xba
$11:ee66  f2 7d         sbc ($7d)
$11:ee68  fe ff 9f      inc $9fff,x
$11:ee6b  4b            phk
$11:ee6c  bf ec f6 5c   lda $5cf6ec,x
$11:ee70  fd 57 5b      sbc $5b57,x
$11:ee73  94 bf         sty $bf,x
$11:ee75  7d b5 f6      adc $f6b5,x
$11:ee78  48            pha
$11:ee79  66 31         ror $31
$11:ee7b  e8            inx
$11:ee7c  f4 32 db      pea $db32
$11:ee7f  00 d9         brk #$d9
$11:ee81  e0 b7 f8      cpx #$f8b7
$11:ee84  4e 6f 12      lsr $126f
$11:ee87  a6 6b         ldx $6b
$11:ee89  0f c7 ab 9b   ora $9babc7
$11:ee8d  f2 a1         sbc ($a1)
$11:ee8f  dd 78 df      cmp $df78,x
$11:ee92  5d 8e eb      eor $eb8e,x
$11:ee95  51 96         eor ($96),y
$11:ee97  8d 7a 61      sta $617a
$11:ee9a  d3 08         cmp ($08,s),y
$11:ee9c  44 42 3f      mvp $3f,$42
$11:ee9f  9c 8f fe      stz $fe8f
$11:eea2  27 fc         and [$fc]
$11:eea4  eb            xba
$11:eea5  ff 1e ff e1   sbc $e1ff1e,x
$11:eea9  ff fc 3f f0   sbc $f03ffc,x
$11:eead  07 78         ora [$78]
$11:eeaf  e0 28 1c      cpx #$1c28
$11:eeb2  0e 05 03      asl $0305
$11:eeb5  41 50         eor ($50,x)
$11:eeb7  b0 64         bcs $ef1d
$11:eeb9  23 1a         and $1a,s
$11:eebb  8d a3 bc      sta $bca3
$11:eebe  a0 1c 00      ldy #$001c
$11:eec1  18            clc
$11:eec2  f8            sed
$11:eec3  30 1f         bmi $eee4
$11:eec5  0f 07 e2 80   ora $80e207
$11:eec9  6e 98 14      ror $1498
$11:eecc  0e 03 01      asl $0103
$11:eecf  07 c3         ora [$c3]
$11:eed1  bc 20 90      ldy $9020,x
$11:eed4  70 cb         bvs $eea1
$11:eed6  48            pha
$11:eed7  a4 52         ldy $52
$11:eed9  09 94 d2      ora #$d294
$11:eedc  7d 95 cb      adc $cb95,x
$11:eedf  d2 f4         cmp ($f4)
$11:eee1  bb            tyx
$11:eee2  ae ab fc      ldx $fcab
$11:eee5  e4 50         cpx $50
$11:eee7  09 95 02      ora #$0295
$11:eeea  fd 68 ff      sbc $ff68,x
$11:eeed  c6 3f         dec $3f
$11:eeef  f0 87         beq $ee78
$11:eef1  71 d1         adc ($d1),y
$11:eef3  28            plp
$11:eef4  10 4a         bpl $ef40
$11:eef6  45 e2         eor $e2
$11:eef8  69 e5 de      adc #$dee5
$11:eefb  d4 f6         pei ($f6)
$11:eefd  9e e9 4b      stz $4be9,x
$11:ef00  fc e8 90      jsr ($90e8,x)
$11:ef03  0a            asl a
$11:ef04  64 0a         stz $0a
$11:ef06  fd 02 26      sbc $2602,x
$11:ef09  0c 41 dc      tsb $dc41
$11:ef0c  60            rts
$11:ef0d  f4 d0 58      pea $58d0
$11:ef10  1e 80 1d      asl $1d80,x
$11:ef13  a0 38 00      ldy #$0038
$11:ef16  c3 01         cmp $01,s
$11:ef18  80 82         bra $ee9c
$11:ef1a  c1 a0         cmp ($a0,x)
$11:ef1c  21 90         and ($90,x)
$11:ef1e  81 44         sta ($44,x)
$11:ef20  a2 71 28      ldx #$2871
$11:ef23  dc 2a 1f      jml [$1f2a]
$11:ef26  18            clc
$11:ef27  87 c0         sta [$c0]
$11:ef29  a0 b0 08      ldy #$08b0
$11:ef2c  38            sec
$11:ef2d  a4 22         ldy $22
$11:ef2f  91 78         sta ($78),y
$11:ef31  22 90 23 ee   jsl $ee2390
$11:ef35  10 70         bpl $efa7
$11:ef37  84 22         sty $22
$11:ef39  1f 62 d2 c0   ora $c0d262,x
$11:ef3d  34 b0         bit $b0,x
$11:ef3f  2d 3f 67      and $673f
$11:ef42  ef 93 fa ea   sbc $eafa93
$11:ef46  fb            xce
$11:ef47  ba            tsx
$11:ef48  fe cc f2      inc $f2cc,x
$11:ef4b  95 42         sta $42,x
$11:ef4d  f3 af         sbc ($af,s),y
$11:ef4f  c2 81         rep #$81
$11:ef51  e7 26         sbc [$26]
$11:ef53  81 34         sta ($34,x)
$11:ef55  59 03 81      eor $8103,y
$11:ef58  ff 9e 40 f2   sbc $f2409e,x
$11:ef5c  1e 8b 45      asl $458b,x
$11:ef5f  03 91         ora $91,s
$11:ef61  58            cli
$11:ef62  ec 58 3e      cpx $3e58
$11:ef65  15 0f         ora $0f,x
$11:ef67  83 dc         sta $dc,s
$11:ef69  11 22         ora ($22),y
$11:ef6b  8a            txa
$11:ef6c  0f 44 81 c8   ora $c88144
$11:ef70  1f 88 43 a0   ora $a04388,x
$11:ef74  62 1f 08      per $f796
$11:ef77  2c 16 15      bit $1516
$11:ef7a  1b            tcs
$11:ef7b  8b            phb
$11:ef7c  4d 65 96      eor $9665
$11:ef7f  ab            plb
$11:ef80  4f 52 37 29   eor $293752
$11:ef84  87 c0         sta [$c0]
$11:ef86  e0 f0 78      cpx #$78f0
$11:ef89  d4 7e         pei ($7e)
$11:ef8b  49 3f a4      eor #$a43f
$11:ef8e  5f f2 3f f9   eor $f93ff2,x
$11:ef92  1f fe 0d 3e   ora $3e0dfe,x
$11:ef96  0e 04 0a      asl $0a04
$11:ef99  01 ae         ora ($ae,x)
$11:ef9b  f2 d7         sbc ($d7)
$11:ef9d  f8            sed
$11:ef9e  db            stp
$11:ef9f  ec 3d 8e      cpx $8e3d
$11:efa2  07 c3         ora [$c3]
$11:efa4  a1 f0         lda ($f0,x)
$11:efa6  f0 74         beq $f01c
$11:efa8  3d 1f 07      and $071f,x
$11:efab  c3 19         cmp $19,s
$11:efad  fc 4e bf      jsr ($bf4e,x)
$11:efb0  17 bf         ora [$bf],y
$11:efb2  c7 8f         cmp [$8f]
$11:efb4  c1 c1         cmp ($c1,x)
$11:efb6  c0 70 60      cpy #$6070
$11:efb9  1e 1c 05      asl $051c,x
$11:efbc  82 01 e5      brl $d4c0
$11:efbf  b3 ec         lda ($ec,s),y
$11:efc1  bc 73 9f      ldy $9f73,x
$11:efc4  0c 13 81      tsb $8113
$11:efc7  03 e0         ora $e0,s
$11:efc9  50 f8         bvc $efc3
$11:efcb  3c 7e 1e      bit $1e7e,x
$11:efce  1f 07 b8 8f   ora $8fb807,x
$11:efd2  df 23 ff e8   cmp $e8ff23,x
$11:efd6  ff 1e 0f c1   sbc $c10f1e,x
$11:efda  80 f0         bra $efcc
$11:efdc  20 02 90      jsr $9002
$11:efdf  c0 40 24      cpy #$2440
$11:efe2  13 0e         ora ($0e,s),y
$11:efe4  85 62         sta $62
$11:efe6  95 ac         sta $ac,x
$11:efe8  d2 f5         cmp ($f5)
$11:efea  aa            tax
$11:efeb  f6 be         inc $be,x
$11:efed  e6 42         inc $42
$11:efef  a1 a0         lda ($a0,x)
$11:eff1  e0 78 39      cpx #$3978
$11:eff4  1f 89 27 f2   ora $f22789,x
$11:eff8  21 fe         and ($fe,x)
$11:effa  63 86         adc $86,s
$11:effc  13 ff         ora ($ff,s),y
$11:effe  60            rts
$11:efff  be 7c 24      ldx $247c,y
$11:f002  02 d0         cop #$d0
$11:f004  43 84         eor $84,s
$11:f006  05 22         ora $22
$11:f008  30 67         bmi $f071
$11:f00a  78            sei
$11:f00b  24 c2         bit $c2
$11:f00d  04 91         tsb $91
$11:f00f  03 88         ora $88,s
$11:f011  1c 49 42      trb $4249
$11:f014  09 f0 4f      ora #$4ff0
$11:f017  84 06         sty $06
$11:f019  07 00         ora [$00]
$11:f01b  45 04         eor $04
$11:f01d  03 a5         ora $a5,s
$11:f01f  f3 96         sbc ($96,s),y
$11:f021  fb            xce
$11:f022  fa            plx
$11:f023  55 ed         eor $ed,x
$11:f025  26 f2         rol $f2
$11:f027  57 58         eor [$58],y
$11:f029  d6 59         dec $59,x
$11:f02b  2a            rol a
$11:f02c  1d cd c7      ora $c7cd,x
$11:f02f  12 19         ora ($19)
$11:f031  ff 88 7f e4   sbc $e47f88,x
$11:f035  3f fa 1f ff   and $ff1ffa,x
$11:f039  0f ff 8c 7e   ora $7e8cff
$11:f03d  25 9e         and $9e
$11:f03f  0f e4 03 6f   ora $6f03e4
$11:f043  ab            plb
$11:f044  be cd ee      ldx $eecd,y
$11:f047  33 fc         and ($fc,s),y
$11:f049  c4 7a         cpy $7a
$11:f04b  31 1e         and ($1e),y
$11:f04d  8d 47 97      sta $9747
$11:f050  41 0c         eor ($0c,x)
$11:f052  86 53         stx $53
$11:f054  78            sei
$11:f055  1d 3e 07      ora $073e,x
$11:f058  7f 81 9e c0   adc $c09e81,x
$11:f05c  43 a0         eor $a0,s
$11:f05e  0c 72 82      tsb $8272
$11:f061  40            rti
$11:f062  3a            dec a
$11:f063  d0 78         bne $f0dd
$11:f065  ac 06 0f      ldy $0f06
$11:f068  06 7e         asl $7e
$11:f06a  84 0d         sty $0d
$11:f06c  ae 20 d0      ldx $d020
$11:f06f  9e 4f 7f      stz $7f4f,x
$11:f072  1f f8 f4 7c   ora $7cf4f8,x
$11:f076  e2 06         sep #$06
$11:f078  f1 37         sbc ($37),y
$11:f07a  0b            phd
$11:f07b  5c 27 d3 fe   jml $fed327
$11:f07f  94 73         sty $73,x
$11:f081  6b            rtl
$11:f082  c6 a4         dec $a4
$11:f084  5c 3a 19 8e   jml $8e193a
$11:f088  87 83         sta [$83]
$11:f08a  21 80         and ($80,x)
$11:f08c  d8            cld
$11:f08d  74 3a         stz $3a,x
$11:f08f  96 c9         stx $c9,y
$11:f091  01 90         ora ($90,x)
$11:f093  70 1f         bvs $f0b4
$11:f095  8b            phb
$11:f096  05 e2         ora $e2
$11:f098  e1 00         sbc ($00,x)
$11:f09a  f8            sed
$11:f09b  5c 21 1f 88   jml $881f21
$11:f09f  07 f1         ora [$f1]
$11:f0a1  ce 51 43      dec $4351
$11:f0a4  a8            tay
$11:f0a5  22 44 30 8e   jsl $8e3044
$11:f0a9  32 8c         and ($8c)
$11:f0ab  c7 da         cmp [$da]
$11:f0ad  80 d7         bra $f086
$11:f0af  00 c2         brk #$c2
$11:f0b1  55 6d         eor $6d,x
$11:f0b3  1b            tcs
$11:f0b4  a9 af 7a      lda #$7aaf
$11:f0b7  3f 4d c7 5a   and $5ac74d,x
$11:f0bb  e8            inx
$11:f0bc  9e e8 4d      stz $4de8,x
$11:f0bf  f2 1f         sbc ($1f)
$11:f0c1  5e 83 e0      lsr $e083,x
$11:f0c4  3f fc 0f ff   and $ff0ffc,x
$11:f0c8  8f f9 77 fc   sta $fc77f9
$11:f0cc  6f ff 1f 8f   adc $8f1fff
$11:f0d0  85 fe         sta $fe
$11:f0d2  e1 7f         sbc ($7f,x)
$11:f0d4  bc 5b 66      ldy $665b,x
$11:f0d7  73 a8         adc ($a8,s),y
$11:f0d9  37 56         and [$56],y
$11:f0db  59 ab ac      eor $acab,y
$11:f0de  cb            wai
$11:f0df  b1 77         lda ($77),y
$11:f0e1  dc 3e a2      jml [$a23e]
$11:f0e4  b1 c4         lda ($c4),y
$11:f0e6  94 40         sty $40,x
$11:f0e8  3f f0 1f ff   and $ff1ff0,x
$11:f0ec  0e 7f e6      asl $e67f
$11:f0ef  af fd 33 f1   lda $f133fd
$11:f0f3  88            dey
$11:f0f4  7f da 9d f2   adc $f29dda,x
$11:f0f8  8f 06 0a b1   sta $b10a06
$11:f0fc  68            pla
$11:f0fd  a0 68 20      ldy #$2068
$11:f100  18            clc
$11:f101  00 c2         brk #$c2
$11:f103  60            rts
$11:f104  0f 02 03 08   ora $080302
$11:f108  07 80         ora [$80]
$11:f10a  ee d0 d8      inc $d8d0
$11:f10d  33 a8         and ($a8,s),y
$11:f10f  22 d1 38 6c   jsl $6c38d1
$11:f113  26 07         rol $07
$11:f115  05 86         ora $86
$11:f117  41 a0         eor ($a0,x)
$11:f119  50 30         bvc $f14b
$11:f11b  f8            sed
$11:f11c  42 21         wdm #$21
$11:f11e  f0 48         beq $f168
$11:f120  3c 12 2f      bit $2f12,x
$11:f123  16 8f         asl $8f,x
$11:f125  c2 a1         rep #$a1
$11:f127  f0 95         beq $f0be
$11:f129  00 a6         brk #$a6
$11:f12b  c2 69         rep #$69
$11:f12d  cb            wai
$11:f12e  d6 d0         dec $d0,x
$11:f130  ad 38 09      lda $0938
$11:f133  d7 07         cmp [$07],y
$11:f135  29 fb f6      and #$f6fb
$11:f138  fc ed d7      jsr ($d7ed,x)
$11:f13b  2e d7 94      rol $94d7
$11:f13e  be 0b f4      ldx $f40b,y
$11:f141  8c 79 e7      sty $e779
$11:f144  9c 3d ef      stz $ef3d
$11:f147  0e fd 85      asl $85fd
$11:f14a  d0 58         bne $f1a4
$11:f14c  30 14         bmi $f162
$11:f14e  0a            asl a
$11:f14f  47 23         eor [$23]
$11:f151  60            rts
$11:f152  f9 0d 04      sbc $040d,y
$11:f155  82 c1 40      brl $3219
$11:f158  e0 1f c2      cpx #$c21f
$11:f15b  21 f0         and ($f0,x)
$11:f15d  90 78         bcc $f1d7
$11:f15f  24 1e         bit $1e
$11:f161  8b            phb
$11:f162  47 e2         eor [$e2]
$11:f164  a1 f0         lda ($f0,x)
$11:f166  c8            iny
$11:f167  38            sec
$11:f168  05 b6         ora $b6
$11:f16a  02 60         cop #$60
$11:f16c  48            pha
$11:f16d  04 2d         tsb $2d
$11:f16f  e0 10 78      cpx #$7810
$11:f172  ac 5a 37      ldy $375a
$11:f175  1d 96 4a      ora $4a96,x
$11:f178  a6 73         ldx $73
$11:f17a  f1 00         sbc ($00),y
$11:f17c  41 e0         eor ($e0,x)
$11:f17e  f0 c8         beq $f148
$11:f180  7a            ply
$11:f181  7c 23 11      jmp ($1123,x)
$11:f184  f8            sed
$11:f185  84 7e         sty $7e
$11:f187  63 3f         adc $3f,s
$11:f189  90 cf         bcc $f15a
$11:f18b  f4 1e 03      pea $031e
$11:f18e  f8            sed
$11:f18f  59 fc fb      eor $fbfc,y
$11:f192  fb            xce
$11:f193  ff 7e 7f 3f   sbc $3f7f7e,x
$11:f197  af f7 ef f3   lda $f3eff7
$11:f19b  0b            phd
$11:f19c  87 82         sta [$82]
$11:f19e  01 60         ora ($60,x)
$11:f1a0  f0 41         beq $f1e3
$11:f1a2  fc f1 ff      jsr ($fff1,x)
$11:f1a5  f8            sed
$11:f1a6  94 33         sty $33,x
$11:f1a8  e2 81         sep #$81
$11:f1aa  d8            cld
$11:f1ab  7c 00 20      jmp ($2000,x)
$11:f1ae  90 0f         bcc $f1bf
$11:f1b0  d7 ef         cmp [$ef],y
$11:f1b2  f3 fa         sbc ($fa,s),y
$11:f1b4  ff 7f 7f ff   sbc $ff7f7f,x
$11:f1b8  d1 a8         cmp ($a8),y
$11:f1ba  47 e3         eor [$e3]
$11:f1bc  f0 30         beq $f1ee
$11:f1be  00 ff         brk #$ff
$11:f1c0  3f e4 30 fc   and $fc30e4,x
$11:f1c4  11 84         ora ($84),y
$11:f1c6  70 11         bvs $f1d9
$11:f1c8  d8            cld
$11:f1c9  f9 d4 24      sbc $24d4,y
$11:f1cc  10 06         bpl $f1d4
$11:f1ce  78            sei
$11:f1cf  70 24         bvs $f1f5
$11:f1d1  1a            inc a
$11:f1d2  0e 81 cc      asl $cc81
$11:f1d5  2a            rol a
$11:f1d6  16 8d         asl $8d,x
$11:f1d8  46 c1         lsr $c1
$11:f1da  c4 1e         cpy $1e
$11:f1dc  0f 03 7c 1b   ora $1b7c03
$11:f1e0  e1 08         sbc ($08,x)
$11:f1e2  fc 20 c3      jsr ($c320,x)
$11:f1e5  09 fc e2      ora #$e2fc
$11:f1e8  7f 1f e0 89   adc $89e01f,x
$11:f1ec  44 59 27      mvp $27,$59
$11:f1ef  41 42         eor ($42,x)
$11:f1f1  07 18         ora [$18]
$11:f1f3  3c 83 d4      bit $d483,x
$11:f1f6  13 e1         ora ($e1,s),y
$11:f1f8  d4 f4         pei ($f4)
$11:f1fa  79 2f 9d      adc $9d2f,y
$11:f1fd  7f 5f df 17   adc $17df5f,x
$11:f201  7b            tdc
$11:f202  8d eb e7      sta $e7eb
$11:f205  fe bf dc      inc $dcbf,x
$11:f208  1f ef 7c 84   ora $847cef,x
$11:f20c  46 20         lsr $20
$11:f20e  17 f8         ora [$f8],y
$11:f210  5c fe 67 67   jml $6767fe
$11:f214  bf f0 ff f0   lda $f0fff0,x
$11:f218  7f fc 3d 58   adc $583dfc,x
$11:f21c  0a            asl a
$11:f21d  d0 58         bne $f277
$11:f21f  bf c3 e0 dd   lda $dde0c3,x
$11:f223  05 7f         ora $7f
$11:f225  7f ff df e1   adc $e1dfff,x
$11:f229  c8            iny
$11:f22a  7f 5a 03 ff   adc $ff035a,x
$11:f22e  3a            dec a
$11:f22f  a1 0c         lda ($0c,x)
$11:f231  9a            txs
$11:f232  c2 b1         rep #$b1
$11:f234  13 aa         ora ($aa,s),y
$11:f236  6a            ror a
$11:f237  36 97         rol $97,x
$11:f239  49 d7 5b      eor #$5bd7
$11:f23c  b1 ea         lda ($ea),y
$11:f23e  f6 4d         inc $4d,x
$11:f240  a6 91         ldx $91
$11:f242  e8            inx
$11:f243  e4 2a         cpx $2a
$11:f245  15 04         ora $04,x
$11:f247  82 50 3f      brl $319a
$11:f24a  9c 0f f5      stz $f50f
$11:f24d  83 fd         sta $fd,s
$11:f24f  70 ff         bvs $f250
$11:f251  7e 3f d1      ror $d13f,x
$11:f254  88            dey
$11:f255  f4 32 1d      pea $1d32
$11:f258  06 18         asl $18
$11:f25a  84 f2         sty $f2
$11:f25c  01 7e         ora ($7e,x)
$11:f25e  9e 70 e4      stz $e470,x
$11:f261  81 41         sta ($41,x)
$11:f263  09 80 44      ora #$4480
$11:f266  01 e2         ora ($e2,x)
$11:f268  79 00 80      adc $8000,y
$11:f26b  88            dey
$11:f26c  d4 3c         pei ($3c)
$11:f26e  32 79         and ($79)
$11:f270  97 1e         sta [$1e],y
$11:f272  c1 02         cmp ($02,x)
$11:f274  a0 60 f0      ldy #$f060
$11:f277  67 b0         adc [$b0]
$11:f279  3d 81 dc      and $dc81,x
$11:f27c  a9 57 8c      lda #$8c57
$11:f27f  37 93         and [$93],y
$11:f281  0f c4 82 61   ora $6182c4
$11:f285  e0 50 33      cpx #$3350
$11:f288  d0 1d         bne $f2a7
$11:f28a  cb            wai
$11:f28b  75 1c         adc $1c,x
$11:f28d  d2 41         cmp ($41)
$11:f28f  e4 5a         cpx $5a
$11:f291  3a            dec a
$11:f292  0e 86 81      asl $8186
$11:f295  80 80         bra $f217
$11:f297  16 00         asl $00,x
$11:f299  ee 34 08      inc $0834
$11:f29c  f5 82         sbc $82,x
$11:f29e  4f c0 d1 c0   eor $c0d1c0
$11:f2a2  3c 30 0e      bit $0e30,x
$11:f2a5  01 65         ora ($65,x)
$11:f2a7  01 fe         ora ($fe,x)
$11:f2a9  20 d1 b9      jsr $b9d1
$11:f2ac  12 82         ora ($82)
$11:f2ae  07 02         ora [$02]
$11:f2b0  4b            phk
$11:f2b1  03 f4         ora $f4,s
$11:f2b3  1b            tcs
$11:f2b4  28            plp
$11:f2b5  3c 08 1c      bit $1c08,x
$11:f2b8  0e 03 03      asl $0303
$11:f2bb  82 c1 e0      brl $d37f
$11:f2be  50 64         bvc $f324
$11:f2c0  c9 76 fc      cmp #$fc76
$11:f2c3  bd 2f 4f      lda $4f2f,x
$11:f2c6  bf 63 e7 ed   lda $ede763,x
$11:f2ca  ff 8e 41 3c   sbc $3c418e,x
$11:f2ce  8c 4f 2f      sty $2f4f
$11:f2d1  54 2b f6      mvn $f6,$2b
$11:f2d4  16 ff         asl $ff,x
$11:f2d6  08            php
$11:f2d7  9e c0 28      stz $28c0,x
$11:f2da  50 0d         bvc $f2e9
$11:f2dc  ee 06 84      inc $8406
$11:f2df  be 0a 34      ldx $340a,y
$11:f2e2  92 85         sta ($85)
$11:f2e4  80 67         bra $f34d
$11:f2e6  8f 03 80 d2   sta $d28003
$11:f2ea  0d 07 82      ora $8207
$11:f2ed  81 60         sta ($60,x)
$11:f2ef  90 48         bcc $f339
$11:f2f1  13 6b         ora ($6b,s),y
$11:f2f3  40            rti
$11:f2f4  33 8f         and ($8f,s),y
$11:f2f6  82 01 60      brl $52fa
$11:f2f9  80 37         bra $f332
$11:f2fb  06 7d         asl $7d
$11:f2fd  14 86         trb $86
$11:f2ff  46 23         lsr $23
$11:f301  10 08         bpl $f30b
$11:f303  82 6d a0      brl $9373
$11:f306  12 29         ora ($29)
$11:f308  f4 92 79      pea $7992
$11:f30b  28            plp
$11:f30c  9c 4c 26      stz $264c
$11:f30f  09 b6 69      ora #$69b6
$11:f312  03 d9         ora $d9,s
$11:f314  c1 5e         cmp ($5e,x)
$11:f316  4b            phk
$11:f317  24 c8         bit $c8
$11:f319  40            rti
$11:f31a  82 37 06      brl $f954
$11:f31d  83 25         sta $25,s
$11:f31f  c0 23 5c      cpy #$5c23
$11:f322  ce a4 d1      dec $d1a4
$11:f325  74 11         stz $11,x
$11:f327  88            dey
$11:f328  44 21 36      mvp $36,$21
$11:f32b  de 0f e4      dec $e40f,x
$11:f32e  82 79 14      brl $07aa
$11:f331  8e 43 21      stx $2143
$11:f334  89 b6 8d      bit #$8db6
$11:f337  c3 26         cmp $26,s
$11:f339  b1 b8         lda ($b8),y
$11:f33b  dc 5a ad      jml [$ad5a]
$11:f33e  0f 96 c7 f8   ora $f8c796
$11:f342  0e a0 70      asl $70a0
$11:f345  8c 42 3f      sty $3f42
$11:f348  20 9f c8      jsr $c89f
$11:f34b  67 f6         adc [$f6]
$11:f34d  2b            pld
$11:f34e  fd 12 ff      sbc $ff12,x
$11:f351  80 74         bra $f3c7
$11:f353  03 84         ora $84,s
$11:f355  7f d1 ea c4   adc $c4ead1,x
$11:f359  63 41         adc $41,s
$11:f35b  60            rts
$11:f35c  69 8e 00      adc #$008e
$11:f35f  2c 90 ef      bit $ef90
$11:f362  f6 e3         inc $e3,x
$11:f364  f1 20         sbc ($20),y
$11:f366  6c 02 59      jmp ($5902)
$11:f369  dc 20 f0      jml [$f020]
$11:f36c  03 28         ora $28,s
$11:f36e  42 0a         wdm #$0a
$11:f370  82 f0 08      brl $fc63
$11:f373  5c 1e 09 01   jml $01091e
$11:f377  2a            rol a
$11:f378  94 4a         sty $4a,x
$11:f37a  21 07         and ($07,x)
$11:f37c  80 45         bra $f3c3
$11:f37e  e2 10         sep #$10
$11:f380  37 08         and [$08],y
$11:f382  90 4a         bcc $f3ce
$11:f384  11 10         ora ($10),y
$11:f386  69 0c 61      adc #$610c
$11:f389  a4 12         ldy $12
$11:f38b  89 87 43      bit #$4387
$11:f38e  c1 20         cmp ($20,x)
$11:f390  4c 1e a2      jmp $a21e
$11:f393  10 8a         bpl $f31f
$11:f395  0f 44 20 20   ora $202044
$11:f399  54 0a 04      mvn $04,$0a
$11:f39c  02 79         cop #$79
$11:f39e  00 bf         brk #$bf
$11:f3a0  4f 38 72 47   eor $477238
$11:f3a4  a0 bc         ldy #$bc
$11:f3a6  c1 e2         cmp ($e2,x)
$11:f3a8  0e f1 36      asl $36f1
$11:f3ab  03 c0         ora $c0,s
$11:f3ad  40            rti
$11:f3ae  6a            ror a
$11:f3af  fe 19 44      inc $4419,x
$11:f3b2  81 a6         sta ($a6,x)
$11:f3b4  dc 06 e0      jml [$e006]
$11:f3b7  bb            tyx
$11:f3b8  81 ae         sta ($ae,x)
$11:f3ba  30 8d         bmi $f349
$11:f3bc  03 98         ora $98,s
$11:f3be  da            phx
$11:f3bf  40            rti
$11:f3c0  ed 05 3c      sbc $3c05
$11:f3c3  0d bc 7c      ora $7cbc
$11:f3c6  b3 f8         lda ($f8,s),y
$11:f3c8  74 e6         stz $e6,x
$11:f3ca  3d 1a 8e      and $8e1a,x
$11:f3cd  4c a7 93      jmp $93a7
$11:f3d0  69 d5 56      adc #$56d5
$11:f3d3  fd 7b be      sbc $be7b,x
$11:f3d6  4d af 33      eor $33af
$11:f3d9  f9 84 be      sbc $be84,y
$11:f3dc  61 2e         adc ($2e,x)
$11:f3de  98            tya
$11:f3df  57 ac         eor [$ac],y
$11:f3e1  06 50         asl $50
$11:f3e3  8f d8 36 fc   sta $fc36d8
$11:f3e7  0d 7b a4      ora $a47b
$11:f3ea  a1 10         lda ($10,x)
$11:f3ec  48            pha
$11:f3ed  24 02         bit $02
$11:f3ef  09 09 80      ora #$8009
$11:f3f2  af 41 92 4a   lda $4a9241
$11:f3f6  d2 5b         cmp ($5b)
$11:f3f8  82 dc 0e      brl $02d7
$11:f3fb  60            rts
$11:f3fc  cd 21 f1      cmp $f121
$11:f3ff  c4 24         cpy $24
$11:f401  12 08         ora ($08)
$11:f403  04 83         tsb $83
$11:f405  21 80         and ($80,x)
$11:f407  90 60         bcc $f469
$11:f409  1d 24 8e      ora $8e24,x
$11:f40c  36 90         rol $90,x
$11:f40e  a4 c0         ldy $c0
$11:f410  56 08         lsr $08,x
$11:f412  e2 9b         sep #$9b
$11:f414  42 a3         wdm #$a3
$11:f416  91 c1         sta ($c1),y
$11:f418  f5 56         sbc $56,x
$11:f41a  29 52 09      and #$0952
$11:f41d  e4 62         cpx $62
$11:f41f  30 3e         bmi $f45f
$11:f421  f6 af         inc $af,x
$11:f423  9f 5a 29 04   sta $04295a,x
$11:f427  41 8c         eor ($8c,x)
$11:f429  61 da         adc ($da,x)
$11:f42b  30 c8         bmi $f3f5
$11:f42d  1c 1c f2      trb $f21c
$11:f430  08            php
$11:f431  a0 76         ldy #$76
$11:f433  8c 42 0b      sty $0b42
$11:f436  00 8b         brk #$8b
$11:f438  c4 0f         cpy $0f
$11:f43a  60            rts
$11:f43b  83 04         sta $04,s
$11:f43d  48            pha
$11:f43e  40            rti
$11:f43f  60            rts
$11:f440  28            plp
$11:f441  e2 06         sep #$06
$11:f443  84 0a         sty $0a
$11:f445  06 15         asl $15
$11:f447  08            php
$11:f448  2c 1c 32      bit $321c
$11:f44b  10 e8         bpl $f435
$11:f44d  53 70         eor ($70,s),y
$11:f44f  c1 c0         cmp ($c0,x)
$11:f451  7b            tdc
$11:f452  03 d8         ora $d8,s
$11:f454  41 c5         eor ($c5,x)
$11:f456  21 01         and ($01,x)
$11:f458  87 aa         sta [$aa]
$11:f45a  43 80         eor $80,s
$11:f45c  6e 0c 00      ror $000c
$11:f45f  d0 1b         bne $f47c
$11:f461  87 20         sta [$20]
$11:f463  d0 78         bne $f4dd
$11:f465  20 0a a0      jsr $a00a
$11:f468  e0 0c         cpx #$0c
$11:f46a  00 60         brk #$60
$11:f46c  03 41         ora $41,s
$11:f46e  1a            inc a
$11:f46f  06 82         asl $82
$11:f471  00 3e         brk #$3e
$11:f473  06 e4         asl $e4
$11:f475  40            rti
$11:f476  a0 90         ldy #$90
$11:f478  68            pla
$11:f479  54 38 9f      mvn $9f,$38
$11:f47c  50 08         bvc $f486
$11:f47e  34 00         bit $00,x
$11:f480  bc a0 90      ldy $90a0,x
$11:f483  a4 43         ldy $43
$11:f485  25 94         and $94
$11:f487  4a            lsr a
$11:f488  25 a2         and $a2
$11:f48a  73 22         adc ($22,s),y
$11:f48c  73 34         adc ($34,s),y
$11:f48e  02 99         cop #$99
$11:f490  08            php
$11:f491  b6 40         ldx $40,y
$11:f493  2d 90 c9      and $c990
$11:f496  fb            xce
$11:f497  73 d3         adc ($d3,s),y
$11:f499  fe b0 f6      inc $f6b0,x
$11:f49c  0f 94 9c 30   ora $309c94
$11:f4a0  06 c0         asl $c0
$11:f4a2  65 48         adc $48
$11:f4a4  a0 a0         ldy #$a0
$11:f4a6  70 30         bvs $f4d8
$11:f4a8  70 06         bvs $f4b0
$11:f4aa  82 1d 0f      brl $03ca
$11:f4ad  88            dey
$11:f4ae  c6 a4         dec $a4
$11:f4b0  73 4f         adc ($4f,s),y
$11:f4b2  0c be 0b      tsb $0bbe
$11:f4b5  fb            xce
$11:f4b6  78            sei
$11:f4b7  8c 1e 17      sty $171e
$11:f4ba  0e 89 c7      asl $c789
$11:f4bd  24 f3         bit $f3
$11:f4bf  ca            dex
$11:f4c0  7d e3 bd      adc $bde3,x
$11:f4c3  30 ff         bmi $f4c4
$11:f4c5  fe 09 43      inc $4309,x
$11:f4c8  e0 a8         cpx #$a8
$11:f4ca  6c 38 12      jmp ($1238)
$11:f4cd  0c 01 00      tsb $0001
$11:f4d0  06 86         asl $86
$11:f4d2  36 01         rol $01,x
$11:f4d4  f0 7c         beq $f552
$11:f4d6  09 a3 c0      ora #$c0a3
$11:f4d9  0f 08 70 60   ora $607008
$11:f4dd  10 18         bpl $f4f7
$11:f4df  0b            phd
$11:f4e0  6c 1b 60      jmp ($601b)
$11:f4e3  ef 00 08 41   sbc $410800
$11:f4e7  60            rts
$11:f4e8  ef 50 01 83   sbc $830150
$11:f4ec  fc 1d 60      jsr ($601d,x)
$11:f4ef  eb            xba
$11:f4f0  01 f9         ora ($f9,x)
$11:f4f2  1a            inc a
$11:f4f3  81 da         sta ($da,x)
$11:f4f5  10 d8         bpl $f4cf
$11:f4f7  04 eb         tsb $eb
$11:f4f9  89 70 c7      bit #$c770
$11:f4fc  51 37         eor ($37),y
$11:f4fe  14 8d         trb $8d
$11:f500  a6 c3         ldx $c3
$11:f502  91 40         sta ($40),y
$11:f504  f8            sed
$11:f505  05 4b         ora $4b
$11:f507  fd 04 ff      sbc $ff04,x
$11:f50a  43 3f         eor $3f,s
$11:f50c  93 8f         sta ($8f,s),y
$11:f50e  e4 c3         cpx $c3
$11:f510  f0 22         beq $f534
$11:f512  58            cli
$11:f513  04 f2         tsb $f2
$11:f515  01 7e         ora ($7e,x)
$11:f517  9e 70 e4      stz $e470,x
$11:f51a  87 41         sta [$41]
$11:f51c  39 81 c4      and $c481,y
$11:f51f  0d e2 6e      ora $6ee2
$11:f522  34 1a         bit $1a,x
$11:f524  9f 89 c1 50   sta $50c189,x
$11:f528  38            sec
$11:f529  7c 3d 95      jmp ($953d,x)
$11:f52c  4f f0 82 32   eor $3282f0
$11:f530  b3 81         lda ($81,s),y
$11:f532  d0 11         bne $f545
$11:f534  82 c6 a0      brl $95fd
$11:f537  12 03         ora ($03)
$11:f539  77 9f         adc [$9f],y
$11:f53b  fd df e9      sbc $e9df,x
$11:f53e  fb            xce
$11:f53f  80 c2         bra $f503
$11:f541  65 b1         adc $b1
$11:f543  c9 6c 26      cmp #$266c
$11:f546  55 42         eor $42,x
$11:f548  b2 d4         lda ($d4)
$11:f54a  ac b2 5a      ldy $5ab2
$11:f54d  5e db b7      lsr $b7db,x
$11:f550  a9 eb 40      lda #$40eb
$11:f553  a5 f1         lda $f1
$11:f555  29 fd 52      and #$52fd
$11:f558  ff 18 bf e6   sbc $e6bf18,x
$11:f55c  3f f9 0f fc   and $fc0ff9,x
$11:f560  00 54         brk #$54
$11:f562  5c 1a 0f 0e   jml $0e0f1a
$11:f566  15 8e         ora $8e,x
$11:f568  b2 cf         lda ($cf)
$11:f56a  3a            dec a
$11:f56b  f6 d9         inc $d9,x
$11:f56d  77 6f         adc [$6f],y
$11:f56f  bd 37 e6      lda $e637,x
$11:f572  4b            phk
$11:f573  e4 1e         cpx $1e
$11:f575  18            clc
$11:f576  07 0e         ora [$0e]
$11:f578  83 cf         sta $cf,s
$11:f57a  e1 ff         sbc ($ff,x)
$11:f57c  f0 5f         beq $f5dd
$11:f57e  f8            sed
$11:f57f  27 fe         and [$fe]
$11:f581  11 ff         ora ($ff),y
$11:f583  88            dey
$11:f584  13 02         ora ($02,s),y
$11:f586  39 2c 9a      and $9a2c,y
$11:f589  56 2d         lsr $2d,x
$11:f58b  1a            inc a
$11:f58c  8e c5 43      stx $43c5
$11:f58f  61 a0         adc ($a0,x)
$11:f591  b0 70         bcs $f603
$11:f593  38            sec
$11:f594  15 8d         ora $8d,x
$11:f596  c4 0a         cpy $0a
$11:f598  3c cf 08      bit $08cf,x
$11:f59b  25 f2         and $f2
$11:f59d  01 f8         ora ($f8,x)
$11:f59f  84 7e         sty $7e
$11:f5a1  22 1f 09 07   jsl $07091f
$11:f5a5  82 09 fc      brl $f1b1
$11:f5a8  86 c4         stx $c4
$11:f5aa  62 91 88      per $7e3e
$11:f5ad  5c 3a 05 03   jml $03053a
$11:f5b1  06 82         asl $82
$11:f5b3  b9 25 d3      lda $d325,y
$11:f5b6  f8            sed
$11:f5b7  3c 7e 23      bit $237e,x
$11:f5ba  1f 86 43 ce   ora $ce4386,x
$11:f5be  a0 ae         ldy #$ae
$11:f5c0  4a            lsr a
$11:f5c1  06 03         asl $03
$11:f5c3  40            rti
$11:f5c4  bc 0b 06      ldy $060b,x
$11:f5c7  a2 61         ldx #$61
$11:f5c9  5b            tcd
$11:f5ca  cc 5b ec      cpy $ec5b
$11:f5cd  11 f8         ora ($f8),y
$11:f5cf  e2 0c         sep #$0c
$11:f5d1  19 43 e0      ora $e043,y
$11:f5d4  c0 7c         cpy #$7c
$11:f5d6  28            plp
$11:f5d7  1f 89 3f ff   ora $ff3f89,x
$11:f5db  3f fe 93 ce   and $ce93fe,x
$11:f5df  13 c0         ora ($c0,s),y
$11:f5e1  09 48 5c      ora #$5c48
$11:f5e4  33 3b         and ($3b,s),y
$11:f5e6  6b            rtl
$11:f5e7  b6 67         ldx $67,y
$11:f5e9  f3 97         sbc ($97,s),y
$11:f5eb  cc 06 00      cpy $0006
$11:f5ee  12 70         ora ($70)
$11:f5f0  08            php
$11:f5f1  78            sei
$11:f5f2  ac 2c 1f      ldy $1f2c
$11:f5f5  7c 07 e2      jmp ($e207,x)
$11:f5f8  00 be         brk #$be
$11:f5fa  08            php
$11:f5fb  94 76         sty $76,x
$11:f5fd  bb            tyx
$11:f5fe  66 bb         ror $bb
$11:f600  63 f6         adc $f6,s
$11:f602  37 fc         and [$fc],y
$11:f604  77 fb         adc [$fb],y
$11:f606  c1 e0         cmp ($e0,x)
$11:f608  45 94         eor $94
$11:f60a  7e 03 7f      ror $7f03,x
$11:f60d  15 9f         ora $9f,x
$11:f60f  f1 3e         sbc ($3e),y
$11:f611  28            plp
$11:f612  b2 9c         lda ($9c)
$11:f614  71 be         adc ($be),y
$11:f616  10 ce         bpl $f5e6
$11:f618  44 e1 b2      mvp $b2,$e1
$11:f61b  88            dey
$11:f61c  b2 ff         lda ($ff)
$11:f61e  70 1c         bvs $f63c
$11:f620  e0 cb         cpx #$cb
$11:f622  20 37 ac      jsr $ac37
$11:f625  0d 0e c1      ora $c10e
$11:f628  55 80         eor $80,x
$11:f62a  22 02 3b 1e   jsl $1e3b02
$11:f62e  8b            phb
$11:f62f  c7 25         cmp [$25]
$11:f631  d3 9a         cmp ($9a,s),y
$11:f633  e5 ea         sbc $ea
$11:f635  f1 74         sbc ($74),y
$11:f637  c8            iny
$11:f638  7e 26 1c      ror $1c26,x
$11:f63b  0b            phd
$11:f63c  06 01         asl $01
$11:f63e  8a            txa
$11:f63f  11 b8         ora ($b8),y
$11:f641  04 fe         tsb $fe
$11:f643  01 76         ora ($76,x)
$11:f645  80 4b         bra $f692
$11:f647  00 43         brk #$43
$11:f649  f0 50         beq $f69b
$11:f64b  82 2c 17      brl $0d7a
$11:f64e  c0 05         cpy #$05
$11:f650  b2 86         lda ($86)
$11:f652  ab            plb
$11:f653  96 0f         stx $0f,y
$11:f655  07 8f         ora [$8f]
$11:f657  c7 e7         cmp [$e7]
$11:f659  f3 fb         sbc ($fb,s),y
$11:f65b  fd ff fe      sbc $feff,x
$11:f65e  e3 03         sbc $03,s
$11:f660  14 cf         trb $cf
$11:f662  20 17 e2      jsr $e217
$11:f665  10 4e         bpl $f6b5
$11:f667  3f ff 04 88   and $8804ff,x
$11:f66b  d8            cld
$11:f66c  3f fa 0f ff   and $ff0ffa,x
$11:f670  01 32         ora ($32,x)
$11:f672  50 88         bvc $f5fc
$11:f674  04 5e         tsb $5e
$11:f676  0f 30 80 48   ora $488030
$11:f67a  1d 63 08      ora $0863,x
$11:f67d  54 8c 52      mvn $52,$8c
$11:f680  29 fc 8e      and #$8efc
$11:f683  7d e1 ff      adc $ffe1,x
$11:f686  38            sec
$11:f687  7f ee 0d ff   adc $ff0dee,x
$11:f68b  82 ff e0      brl $d78d
$11:f68e  6b            rtl
$11:f68f  92 88         sta ($88)
$11:f691  40            rti
$11:f692  3d 9e 01      and $019e,x
$11:f695  f8            sed
$11:f696  41 a0         eor ($a0,x)
$11:f698  10 58         bpl $f6f2
$11:f69a  04 4e         tsb $4e
$11:f69c  21 23         and ($23,x)
$11:f69e  90 5a         bcc $f6fa
$11:f6a0  ed 05 b3      sbc $b305
$11:f6a3  c0 3d         cpy #$3d
$11:f6a5  43 f1         eor $f1,s
$11:f6a7  f8            sed
$11:f6a8  fe 7f 30      inc $307f,x
$11:f6ab  df e5 d0 1b   cmp $1bd0e5,x
$11:f6af  53 80         eor ($80,s),y
$11:f6b1  4a            lsr a
$11:f6b2  12 48         ora ($48)
$11:f6b4  00 43         brk #$43
$11:f6b6  fc 6f 08      jsr ($086f,x)
$11:f6b9  23 c0         and $c0,s
$11:f6bb  20 10 28      jsr $2810
$11:f6be  34 08         bit $08,x
$11:f6c0  56 21         lsr $21,x
$11:f6c2  c1 0e         cmp ($0e,x)
$11:f6c4  84 06         sty $06
$11:f6c6  0a            asl a
$11:f6c7  ff 08 2c 1c   sbc $1c2c08,x
$11:f6cb  06 10         asl $10
$11:f6cd  30 38         bmi $f707
$11:f6cf  07 44         ora [$44]
$11:f6d1  5a            phy
$11:f6d2  12 2e         ora ($2e)
$11:f6d4  a5 b7         lda $b7
$11:f6d6  01 4b         ora ($4b,x)
$11:f6d8  da            phx
$11:f6d9  77 7c         adc [$7c],y
$11:f6db  5b            tcd
$11:f6dc  4e 5d 37      lsr $375d
$11:f6df  67 8d         adc [$8d]
$11:f6e1  a9 46 74      lda #$7446
$11:f6e4  f0 03         beq $f6e9
$11:f6e6  f0 7f         beq $f767
$11:f6e8  e3 9e         sbc $9e,s
$11:f6ea  3b            tsc
$11:f6eb  f6 07         inc $07,x
$11:f6ed  fd 09 ff      sbc $ff09,x
$11:f6f0  4c 7f d5      jmp $d57f
$11:f6f3  1f f6 87 c3   ora $c387f6,x
$11:f6f7  7e 9e f0      ror $f09e,x
$11:f6fa  fc d1 e8      jsr ($e8d1,x)
$11:f6fd  df e3 9d c0   cmp $c09de3,x
$11:f701  86 44         stx $44
$11:f703  c6 61         dec $61
$11:f705  34 73         bit $73,x
$11:f707  80 80         bra $f689
$11:f709  60            rts
$11:f70a  3f f8 3f fe   and $fe3ff8,x
$11:f70e  7d fe f0      adc $f0fe,x
$11:f711  10 86         bpl $f699
$11:f713  19 fc d4      ora $d4fc,y
$11:f716  58            cli
$11:f717  34 18         bit $18,x
$11:f719  0c 01 b8      tsb $b801
$11:f71c  ca            dex
$11:f71d  49 18 fc      eor #$fc18
$11:f720  58            cli
$11:f721  3c 05 24      bit $2405,x
$11:f724  a0 39         ldy #$39
$11:f726  40            rti
$11:f727  a8            tay
$11:f728  31 88         and ($88),y
$11:f72a  fd 3e e1      sbc $e13e,x
$11:f72d  40            rti
$11:f72e  bf df a0 33   lda $33a0df,x
$11:f732  82 a1 95      brl $8cd6
$11:f735  02 3f         cop #$3f
$11:f737  00 bf         brk #$bf
$11:f739  a0 0a         ldy #$0a
$11:f73b  fd 3f 9f      sbc $9f3f,x
$11:f73e  9e 13 a1      stz $a113,x
$11:f741  e8            inx
$11:f742  95 7d         sta $7d,x
$11:f744  3c 93 b9      bit $b993,x
$11:f747  b7 e6         lda [$e6],y
$11:f749  e7 3c         sbc [$3c]
$11:f74b  ad d7 23      lda $23d7
$11:f74e  91 f8         sta ($f8),y
$11:f750  74 3f         stz $3f,x
$11:f752  71 08         adc ($08),y
$11:f754  ff 41 17 21   sbc $211741,x
$11:f758  df 80 f7 f8   cmp $f8f780,x
$11:f75c  1a            inc a
$11:f75d  f6 10         inc $10,x
$11:f75f  c1 ca         cmp ($ca,x)
$11:f761  88            dey
$11:f762  68            pla
$11:f763  0c 05 03      tsb $0305
$11:f766  41 e0         eor ($e0,x)
$11:f768  98            tya
$11:f769  64 2d         stz $2d
$11:f76b  17 0f         ora [$0f],y
$11:f76d  62 bd 38      per $302d
$11:f770  18            clc
$11:f771  03 10         ora $10,s
$11:f773  39 c6 11      and $11c6,y
$11:f776  bc 86 2c      ldy $2c86,x
$11:f779  85 9e         sta $9e
$11:f77b  46 80         lsr $80
$11:f77d  2a            rol a
$11:f77e  0c 41 de      tsb $de41
$11:f781  0f 70 2c 1d   ora $1d2c70
$11:f785  01 ae         ora ($ae,x)
$11:f787  32 09         and ($09)
$11:f789  04 22         tsb $22
$11:f78b  11 02         ora ($02),y
$11:f78d  81 15         sta ($15,x)
$11:f78f  0c a8 30      tsb $30a8
$11:f792  18            clc
$11:f793  08            php
$11:f794  28            plp
$11:f795  20 d0 47      jsr $47d0
$11:f798  7b            tdc
$11:f799  3d 0a 01      and $010a,x
$11:f79c  03 80         ora $80,s
$11:f79e  41 8a         eor ($8a,x)
$11:f7a0  81 04         sta ($04,x)
$11:f7a2  83 c0         sta $c0,s
$11:f7a4  e0 52         cpx #$52
$11:f7a6  39 c5 56      and $56c5,y
$11:f7a9  c1 7a         cmp ($7a,x)
$11:f7ab  c1 e5         cmp ($e5,x)
$11:f7ad  20 d2 88      jsr $88d2
$11:f7b0  63 a8         adc $a8,s
$11:f7b2  01 41         ora ($41,x)
$11:f7b4  1d 8e 51      ora $518e,x
$11:f7b7  ef d8 ff f4   sbc $f4ffd8
$11:f7bb  77 fd         adc [$fd],y
$11:f7bd  18            clc
$11:f7be  cf 4c 27 97   cmp $97274c
$11:f7c2  0b            phd
$11:f7c3  c1 a8         cmp ($a8,x)
$11:f7c5  30 0d         bmi $f7d4
$11:f7c7  70 69         bvs $f832
$11:f7c9  93 bd         sta ($bd,s),y
$11:f7cb  4d 41 c0      eor $c041
$11:f7ce  a0 18         ldy #$18
$11:f7d0  d0 8b         bne $f75d
$11:f7d2  11 48         ora ($48),y
$11:f7d4  24 a2         bit $a2
$11:f7d6  11 18         ora ($18),y
$11:f7d8  8c 44 26      sty $2644
$11:f7db  05 a0         ora $a0
$11:f7dd  2c 81 e8      bit $e881
$11:f7e0  1d 60 eb      ora $eb60,x
$11:f7e3  08            php
$11:f7e4  a4 41         ldy $41
$11:f7e6  d2 04         cmp ($04)
$11:f7e8  54 e3 ff      mvn $ff,$e3
$11:f7eb  f0 7f         beq $f86c
$11:f7ed  fe 0d ff      inc $ff0d,x
$11:f7f0  e1 1f         sbc ($1f,x)
$11:f7f2  fd c1 2f      sbc $2fc1,x
$11:f7f5  b0 29         bcs $f820
$11:f7f7  f4 06 23      pea $2306
$11:f7fa  00 bf         brk #$bf
$11:f7fc  c0 3f         cpy #$3f
$11:f7fe  e7 e1         sbc [$e1]
$11:f800  53 87         eor ($87,s),y
$11:f802  df e1 7b bc   cmp $bc7be1,x
$11:f806  4f 67 91 e8   eor $e89167
$11:f80a  f7 ff         sbc [$ff],y
$11:f80c  80 8f         bra $f79d
$11:f80e  4b            phk
$11:f80f  f7 83         sbc [$83],y
$11:f811  7f 60 ef cc   adc $ccef60,x
$11:f815  2b            pld
$11:f816  db            stp
$11:f817  08            php
$11:f818  bc 5f 17      ldy $175f,x
$11:f81b  0b            phd
$11:f81c  ca            dex
$11:f81d  45 3a         eor $3a
$11:f81f  f1 7e         sbc ($7e),y
$11:f821  5c 2f 99 0c   jml $0c992f
$11:f825  f3 c1         sbc ($c1,s),y
$11:f827  d5 61         cmp $61,x
$11:f829  ee 81 df      inc $df81
$11:f82c  a0 7d         ldy #$7d
$11:f82e  48            pha
$11:f82f  1e d6 05      asl $05d6,x
$11:f832  7c 8b f7      jmp ($f78b,x)
$11:f835  20 fb b9      jsr $b9fb
$11:f838  64 ea         stz $ea
$11:f83a  1b            tcs
$11:f83b  d3 e8         cmp ($e8,s),y
$11:f83d  6a            ror a
$11:f83e  f5 16         sbc $16,x
$11:f840  bb            tyx
$11:f841  47 6f         eor [$6f]
$11:f843  b1 a3         lda ($a3),y
$11:f845  d8            cld
$11:f846  dc ee 3c      jml [$3cee]
$11:f849  7f 07 9f c1   adc $c19f07,x
$11:f84d  01 40         ora ($40,x)
$11:f84f  87 ff         sta [$ff]
$11:f851  fb            xce
$11:f852  02 8b         cop #$8b
$11:f854  fa            plx
$11:f855  2b            pld
$11:f856  fa            plx
$11:f857  0d f5 02      ora $02f5
$11:f85a  f9 80 c4      sbc $c480,y
$11:f85d  20 05 02      jsr $0205
$11:f860  1f e8 07 ef   ora $ef07e8,x
$11:f864  c7 ef         cmp [$ef]
$11:f866  12 84         ora ($84)
$11:f868  fb            xce
$11:f869  f9 7c fc      sbc $fc7c,y
$11:f86c  7e 20 50      ror $5020,x
$11:f86f  30 88         bmi $f7f9
$11:f871  3c 00 10      bit $1000,x
$11:f874  04 56         tsb $56
$11:f876  7a            ply
$11:f877  9b            txy
$11:f878  bc 48 ad      ldy $ad48,x
$11:f87b  90 b6         bcc $f833
$11:f87d  f5 b5         sbc $b5,x
$11:f87f  79 bb 4f      adc $4fbb,y
$11:f882  d7 e1         cmp [$e1],y
$11:f884  7f 91 48 e9   adc $e94891,x
$11:f888  d1 69         cmp ($69),y
$11:f88a  64 21         stz $21
$11:f88c  c4 16         cpy $16
$11:f88e  3f e4 9e 1d   and $1d9ee4,x
$11:f892  07 9d         ora [$9d]
$11:f894  c2 ee         rep #$ee
$11:f896  30 3a         bmi $f8d2
$11:f898  cc 3e e5      cpy $e53e
$11:f89b  4e 9c 4e      lsr $4e9c
$11:f89e  32 10         and ($10)
$11:f8a0  0e 04 02      asl $0204
$11:f8a3  81 80         sta ($80,x)
$11:f8a5  d0 70         bne $f917
$11:f8a7  30 06         bmi $f8af
$11:f8a9  85 b8         sta $b8
$11:f8ab  7c 06 02      jmp ($0206,x)
$11:f8ae  31 0f         and ($0f),y
$11:f8b0  07 03         ora [$03]
$11:f8b2  c0 f6         cpy #$f6
$11:f8b4  77 f0         adc [$f0],y
$11:f8b6  3d 44 0a      and $0a44,x
$11:f8b9  2f 50 29 91   and $912950
$11:f8bd  39 a0 2e      and $2ea0,y
$11:f8c0  f0 34         beq $f8f6
$11:f8c2  96 a3         stx $a3,y
$11:f8c4  b1 c8         lda ($c8),y
$11:f8c6  98            tya
$11:f8c7  5c 29 1c 0e   jml $0e1c29
$11:f8cb  c4 a3         cpy $a3
$11:f8cd  61 b8         adc ($b8,x)
$11:f8cf  d8            cld
$11:f8d0  54 23 14      mvn $14,$23
$11:f8d3  08            php
$11:f8d4  c7 e2         cmp [$e2]
$11:f8d6  21 f8         and ($f8,x)
$11:f8d8  e8            inx
$11:f8d9  6e 3d 13      ror $133d
$11:f8dc  8f 45 63 c1   sta $c16345
$11:f8e0  48            pha
$11:f8e1  b8            clv
$11:f8e2  5a            phy
$11:f8e3  11 42         ora ($42),y
$11:f8e5  f3 17         sbc ($17,s),y
$11:f8e7  ac 3f 19      ldy $193f
$11:f8ea  27 3f         and [$3f]
$11:f8ec  8f b6 33 f7   sta $f733b6
$11:f8f0  66 be         ror $be
$11:f8f2  c6 e3         dec $e3
$11:f8f4  d0 58         bne $f94e
$11:f8f6  3b            tsc
$11:f8f7  bc 0a 65      ldy $650a,x
$11:f8fa  5e 83 7d      lsr $7d83,x
$11:f8fd  e0 73         cpx #$73
$11:f8ff  f8            sed
$11:f900  0c 3e 01      tsb $013e
$11:f903  07 2b         ora [$2b]
$11:f905  02 7a         cop #$7a
$11:f907  30 18         bmi $f921
$11:f909  0a            asl a
$11:f90a  01 20         ora ($20,x)
$11:f90c  3c 1f 0d      bit $0d1f,x
$11:f90f  07 73         ora [$73]
$11:f911  31 e7         and ($e7),y
$11:f913  68            pla
$11:f914  27 01         and [$01]
$11:f916  ac 3b 08      ldy $083b
$11:f919  05 f2         ora $f2
$11:f91b  39 ff 83      and $83ff,y
$11:f91e  a4 82         ldy $82
$11:f920  29 04 49      and #$4904
$11:f923  04 16         tsb $16
$11:f925  03 05         ora $05,s
$11:f927  83 13         sta $13,s
$11:f929  5a            phy
$11:f92a  37 1f         and [$1f],y
$11:f92c  29 84 1a      and #$1a84
$11:f92f  0f 08 62 82   ora $826208
$11:f933  68            pla
$11:f934  fb            xce
$11:f935  11 0d         ora ($0d),y
$11:f937  84 82         sty $82
$11:f939  c1 40         cmp ($40,x)
$11:f93b  19 83 31      ora $3183,y
$11:f93e  bc 1f 8e      ldy $8e1f,x
$11:f941  07 c3         ora [$c3]
$11:f943  00 48         brk #$48
$11:f945  02 10         cop #$10
$11:f947  33 17         and ($17,s),y
$11:f949  41 60         eor ($60,x)
$11:f94b  f0 48         beq $f995
$11:f94d  3a            dec a
$11:f94e  07 20         ora [$20]
$11:f950  88            dey
$11:f951  5b            tcd
$11:f952  23 93         and $93,s
$11:f954  b8            clv
$11:f955  3c 7a 02      bit $027a,x
$11:f958  c7 08         cmp [$08]
$11:f95a  f8            sed
$11:f95b  f8            sed
$11:f95c  30 10         bmi $f96e
$11:f95e  f2 10         sbc ($10)
$11:f960  50 20         bvc $f982
$11:f962  74 08         stz $08,x
$11:f964  04 82         tsb $82
$11:f966  01 18         ora ($18,x)
$11:f968  80 41         bra $f9ab
$11:f96a  a1 11         lda ($11,x)
$11:f96c  88            dey
$11:f96d  44 22 09      mvp $09,$22
$11:f970  0c 49 c4      tsb $c449
$11:f973  82 41 10      brl $09b7
$11:f976  88            dey
$11:f977  24 e9         bit $e9
$11:f979  f0 10         beq $f98b
$11:f97b  26 50         rol $50
$11:f97d  9c c4 ee      stz $eec4
$11:f980  2c a2 83      bit $83a2
$11:f983  c1 e0         cmp ($e0,x)
$11:f985  6c 90 4e      jmp ($4e90)
$11:f988  19 e8 e0      ora $e0e8,y
$11:f98b  19 df f7      ora $f7df,y
$11:f98e  9e ff db      stz $dbff,x
$11:f991  b3 f4         lda ($f4,s),y
$11:f993  7d fd 9f      adc $9ffd,x
$11:f996  37 bb         and [$bb],y
$11:f998  e3 f5         sbc $f5,s
$11:f99a  fd df ff      sbc $ffdf,x
$11:f99d  ff 78 04 ee   sbc $ee0478,x
$11:f9a1  01 3d         ora ($3d,x)
$11:f9a3  80 5f         bra $fa04
$11:f9a5  a1 97         lda ($97,x)
$11:f9a7  f8            sed
$11:f9a8  34 fe         bit $fe,x
$11:f9aa  01 9f         ora ($9f,x)
$11:f9ac  80 71         bra $fa1f
$11:f9ae  20 15 1d      jsr $1d15
$11:f9b1  fe ee cd      inc $cdee,x
$11:f9b4  75 e5         adc $e5,x
$11:f9b6  78            sei
$11:f9b7  b2 b6         lda ($b6)
$11:f9b9  7c c4 7b      jmp ($7bc4,x)
$11:f9bc  c3 ed         cmp $ed,s
$11:f9be  f9 ff ff      sbc $ffff,y
$11:f9c1  fe fc 07      inc $07fc,x
$11:f9c4  f6 03         inc $03,x
$11:f9c6  ff 84 ff e2   sbc $e2ff84,x
$11:f9ca  9f f8 c7 fe   sta $fec7f8,x
$11:f9ce  00 a9         brk #$a9
$11:f9d0  09 7c 02      ora #$027c
$11:f9d3  c1 00         cmp ($00,x)
$11:f9d5  a0 40         ldy #$40
$11:f9d7  02 c0         cop #$c0
$11:f9d9  d3 16         cmp ($16,s),y
$11:f9db  b9 87 47      lda $4787,y
$11:f9de  c1 c0         cmp ($c0,x)
$11:f9e0  e0 36         cpx #$36
$11:f9e2  51 d1         eor ($d1),y
$11:f9e4  e7 61         sbc [$61]
$11:f9e6  81 20         sta ($20,x)
$11:f9e8  8d ea d0      sta $d0ea
$11:f9eb  a8            tay
$11:f9ec  5c 22 16 f7   jml $f71622
$11:f9f0  48            pha
$11:f9f1  24 1e         bit $1e
$11:f9f3  8b            phb
$11:f9f4  6b            rtl
$11:f9f5  c5 75         cmp $75
$11:f9f7  aa            tax
$11:f9f8  be db 6e      ldx $6edb,y
$11:f9fb  79 ec 92      adc $92ec,y
$11:f9fe  09 3e 43      ora #$433e
$11:fa01  ff 21 ff c0   sbc $c0ff21,x
$11:fa05  99 20 c9      sta $c920,y
$11:fa08  02 c8         cop #$c8
$11:fa0a  d0 1c         bne $fa28
$11:fa0c  43 4c         eor $4c,s
$11:fa0e  85 f4         sta $f4
$11:fa10  ad d6 ac      lda $acd6
$11:fa13  c6 d2         dec $d2
$11:fa15  e0 5b         cpx #$5b
$11:fa17  3f 00 cc 38   and $38cc00,x
$11:fa1b  1c fc 0f      trb $0ffc
$11:fa1e  fe 0d fe      inc $fe0d,x
$11:fa21  87 8b         sta [$8b]
$11:fa23  8c d2 4e      sty $4ed2
$11:fa26  54 70 80      mvn $80,$70
$11:fa29  05 86         ora $86
$11:fa2b  60            rts
$11:fa2c  03 32         ora $32,s
$11:fa2e  f3 c1         sbc ($c1,s),y
$11:fa30  a0 f0         ldy #$f0
$11:fa32  c8            iny
$11:fa33  7c 3a 1e      jmp ($1e3a,x)
$11:fa36  fd 87 f0      sbc $f087,x
$11:fa39  41 d0         eor ($d0,x)
$11:fa3b  c3 05         cmp $05,s
$11:fa3d  82 3a 9d      brl $977a
$11:fa40  ae 03 30      ldx $3003
$11:fa43  90 58         bcc $fa9d
$11:fa45  1c ce dc      trb $dcce
$11:fa48  02 f0         cop #$f0
$11:fa4a  78            sei
$11:fa4b  15 42         ora $42,x
$11:fa4d  33 0a         and ($0a,s),y
$11:fa4f  05 01         ora $01
$11:fa51  32 12         and ($12)
$11:fa53  09 05 42      ora #$4205
$11:fa56  61 08         adc ($08,x)
$11:fa58  8c 44 e0      sty $e044
$11:fa5b  f0 41         beq $fa9e
$11:fa5d  20 40 34      jsr $3440
$11:fa60  18            clc
$11:fa61  09 84 02      ora #$0284
$11:fa64  a1 40         lda ($40,x)
$11:fa66  86 40         stx $40
$11:fa68  24 f2         bit $f2
$11:fa6a  08            php
$11:fa6b  44 22 05      mvp $05,$22
$11:fa6e  02 af         cop #$af
$11:fa70  d8            cld
$11:fa71  21 30         and ($30,x)
$11:fa73  88            dey
$11:fa74  74 32         stz $32,x
$11:fa76  0b            phd
$11:fa77  06 7e         asl $7e
$11:fa79  83 ec         sta $ec,s
$11:fa7b  00 65         brk #$65
$11:fa7d  7f 8e 45 e3   adc $e3458e,x
$11:fa81  f1 18         sbc ($18),y
$11:fa83  fc 26 1e      jsr ($1e26,x)
$11:fa86  15 06         ora $06,x
$11:fa88  ba            tsx
$11:fa89  26 43         rol $43
$11:fa8b  01 e0         ora ($e0,x)
$11:fa8d  f3 7e         sbc ($7e,s),y
$11:fa8f  39 d0 f8      and $f8d0,y
$11:fa92  2c 06 05      bit $0506
$11:fa95  80 a1         bra $fa38
$11:fa97  60            rts
$11:fa98  22 12 02 f0   jsl $f00212
$11:fa9c  aa            tax
$11:fa9d  c3 fd         cmp $fd,s
$11:fa9f  f0 ff         beq $faa0
$11:faa1  9e c2 07      stz $07c2,x
$11:faa4  83 81         sta $81,s
$11:faa6  f0 e8         beq $fa90
$11:faa8  37 15         and [$15],y
$11:faaa  02 16         cop #$16
$11:faac  07 01         ora [$01]
$11:faae  c0 4c         cpy #$4c
$11:fab0  82 81 42      brl $3d34
$11:fab3  46 a7         lsr $a7
$11:fab5  20 da b6      jsr $b6da
$11:fab8  42 05         wdm #$05
$11:faba  03 73         ora $73,s
$11:fabc  83 94         sta $94,s
$11:fabe  22 91 ac 56   jsl $56ac91
$11:fac2  58            cli
$11:fac3  5c 88 62 c0   jml $c06288
$11:fac7  63 f0         adc $f0,s
$11:fac9  39 f9 0e      and $0ef9,y
$11:facc  fe 03 03      inc $0303,x
$11:facf  c1 61         cmp ($61,x)
$11:fad1  a2 99         ldx #$99
$11:fad3  cd 56 e2      cmp $e256
$11:fad6  ab            plb
$11:fad7  72 d9         adc ($d9)
$11:fad9  5f 79 bf 2d   eor $2dbf79,x
$11:fadd  b7 31         lda [$31],y
$11:fadf  0c 10 1c      tsb $1c10
$11:fae2  3c 0b 3d      bit $3d0b,x
$11:fae5  06 df         asl $df
$11:fae7  63 3f         adc $3f,s
$11:fae9  f8            sed
$11:faea  0f fc 07 ff   ora $ff07fc
$11:faee  03 ff         ora $ff,s
$11:faf0  8c 0e 07      sty $070e
$11:faf3  0a            asl a
$11:faf4  87 14         sta [$14]
$11:faf6  c2 51         rep #$51
$11:faf8  38            sec
$11:faf9  aa            tax
$11:fafa  5c 3d 1e 04   jml $041e3d
$11:fafe  c0 10 ce      cpy #$ce10
$11:fb01  1c 63 0a      trb $0a63
$11:fb04  25 f3         and $f3
$11:fb06  19 fc 8c      ora $8cfc,y
$11:fb09  7e 23 d7      ror $d723,x
$11:fb0c  f9 f4 fe      sbc $fef4,y
$11:fb0f  3f 0b 8d c3   and $c38d0b,x
$11:fb13  61 f0         adc ($f0,x)
$11:fb15  c8            iny
$11:fb16  6c 3a 0d      jmp ($0d3a)
$11:fb19  05 83         ora $83
$11:fb1b  c1 af         cmp ($af,x)
$11:fb1d  64 70         stz $70
$11:fb1f  22 8c 36 01   jsl $01368c
$11:fb23  06 50         asl $50
$11:fb25  0b            phd
$11:fb26  68            pla
$11:fb27  20 50 0d      jsr $0d50
$11:fb2a  75 fa         adc $fa,x
$11:fb2c  f9 b8 bc      sbc $bcb8,y
$11:fb2f  72 3d         adc ($3d)
$11:fb31  19 8c 85      ora $858c,y
$11:fb34  c2 a1         rep #$a1
$11:fb36  b0 a0         bcs $fad8
$11:fb38  78            sei
$11:fb39  38            sec
$11:fb3a  1a            inc a
$11:fb3b  0e c0 04      asl $04c0
$11:fb3e  30 1d         bmi $fb5d
$11:fb40  08            php
$11:fb41  06 e2         asl $e2
$11:fb43  01 70         ora ($70,x)
$11:fb45  a0 7c 30      ldy #$307c
$11:fb48  1a            inc a
$11:fb49  0c 05 80      tsb $8005
$11:fb4c  3e 72 89      rol $8972,x
$11:fb4f  04 52         tsb $52
$11:fb51  21 08         and ($08,x)
$11:fb53  84 40         sty $40
$11:fb55  20 8d a0      jsr $a08d
$11:fb58  6c 80 7c      jmp ($7c80)
$11:fb5b  22 0e 11 6b   jsl $6b110e
$11:fb5f  83 6c         sta $6c,s
$11:fb61  43 e7         eor $e7,s
$11:fb63  08            php
$11:fb64  85 c2         sta $c2
$11:fb66  a1 b0         lda ($b0,x)
$11:fb68  b8            clv
$11:fb69  24 5a         bit $5a
$11:fb6b  12 3b         ora ($3b)
$11:fb6d  08            php
$11:fb6e  e4 4a         cpx $4a
$11:fb70  69 3b 9d      adc #$9d3b
$11:fb73  c7 22         cmp [$22]
$11:fb75  91 f8         sta ($f8),y
$11:fb77  84 7e         sty $7e
$11:fb79  3f 18 8f c4   and $c48f18,x
$11:fb7d  61 f0         adc ($f0,x)
$11:fb7f  29 bc 8a      and #$8abc
$11:fb82  31 20         and ($20),y
$11:fb84  b7 d8         lda [$d8],y
$11:fb86  35 d1         and $d1,x
$11:fb88  1b            tcs
$11:fb89  ac 0f 9f      ldy $9f0f
$11:fb8c  20 ba 62      jsr $62ba
$11:fb8f  e7 14         sbc [$14]
$11:fb91  4e f4 8f      lsr $8ff4
$11:fb94  d3 0f         cmp ($0f,s),y
$11:fb96  e9 37 00      sbc #$0037
$11:fb99  dc 1f ff      jml [$ff1f]
$11:fb9c  04 7f         tsb $7f
$11:fb9e  f1 87         sbc ($87),y
$11:fba0  ff d0 ff 12   sbc $12ffd0,x
$11:fba4  fb            xce
$11:fba5  84 7f         sty $7f
$11:fba7  f3 3f         sbc ($3f,s),y
$11:fba9  a4 f0         ldy $f0
$11:fbab  73 ff         adc ($ff,s),y
$11:fbad  8f 3c 7f b9   sta $b97f3c
$11:fbb1  e3 ef         sbc $ef,s
$11:fbb3  47 e3         eor [$e3]
$11:fbb5  38            sec
$11:fbb6  1a            inc a
$11:fbb7  8e c3 a9      stx $a9c3
$11:fbba  ec 9f 7f      cpx $7f9f
$11:fbbd  e0 e2 01      cpx #$01e2
$11:fbc0  10 8f         bpl $fb51
$11:fbc2  fe fc 6c      inc $6cfc,x
$11:fbc5  0f 9c 03 f9   ora $f9039c
$11:fbc9  90 f8         bcc $fbc3
$11:fbcb  49 27 9c      eor #$9c27
$11:fbce  28            plp
$11:fbcf  1f 01 7a 16   ora $167a01,x
$11:fbd3  02 78         cop #$78
$11:fbd5  1e 42 51      asl $5142,x
$11:fbd8  0c 80 7c      tsb $7c80
$11:fbdb  38            sec
$11:fbdc  1f cf e0 80   ora $80e0cf,x
$11:fbe0  38            sec
$11:fbe1  0c 00 2f      tsb $2f00
$11:fbe4  8f e2 61 3c   sta $3c61e2
$11:fbe8  81 c0         sta ($c0,x)
$11:fbea  50 40         bvc $fc2c
$11:fbec  ab            plb
$11:fbed  03 a4         ora $a4,s
$11:fbef  27 42         and [$42]
$11:fbf1  06 81         asl $81
$11:fbf3  13 80         ora ($80,s),y
$11:fbf5  1c 05 d2      trb $d205
$11:fbf8  65 80         adc $80
$11:fbfa  d8            cld
$11:fbfb  2f 47 b1 f0   and $f0b147
$11:fbff  fc 5d 2c      jsr ($2c5d,x)
$11:fc02  97 8f         sta [$8f],y
$11:fc04  87 bb         sta [$bb]
$11:fc06  a5 ec         lda $ec
$11:fc08  f8            sed
$11:fc09  17 c2         ora [$c2],y
$11:fc0b  01 f8         ora ($f8,x)
$11:fc0d  80 5e         bra $fc6d
$11:fc0f  20 1e cc      jsr $cc1e
$11:fc12  06 73         asl $73
$11:fc14  11 3e         ora ($3e),y
$11:fc16  86 5f         stx $5f
$11:fc18  a1 91         lda ($91,x)
$11:fc1a  78            sei
$11:fc1b  c4 66         cpy $66
$11:fc1d  3d 06 39      and $3906,x
$11:fc20  cc 7e 01      cpy $017e
$11:fc23  0f 60 04 3a   ora $3a0460
$11:fc27  0f 07 43 b1   ora $b14307
$11:fc2b  94 38         sty $38,x
$11:fc2d  13 1b         ora ($1b,s),y
$11:fc2f  8e 23 7b      stx $7b23
$11:fc32  44 8b cb      mvp $cb,$8b
$11:fc35  a5 f3         lda $f3
$11:fc37  e8            inx
$11:fc38  ec 7a 09      cpx $097a
$11:fc3b  07 33         ora [$33]
$11:fc3d  07 c6         ora [$c6]
$11:fc3f  01 f9         ora ($f9,x)
$11:fc41  80 7f         bra $fcc2
$11:fc43  70 1f         bvs $fc64
$11:fc45  de 05 6e      dec $6e05,x
$11:fc48  c1 2b         cmp ($2b,x)
$11:fc4a  98            tya
$11:fc4b  00 c0         brk #$c0
$11:fc4d  f2 78         sbc ($78)
$11:fc4f  0c 05 02      tsb $0205
$11:fc52  81 80         sta ($80,x)
$11:fc54  33 86         and ($86,s),y
$11:fc56  81 ee         sta ($ee,x)
$11:fc58  17 07         ora [$07],y
$11:fc5a  81 99         sta ($99,x)
$11:fc5c  47 81         eor [$81]
$11:fc5e  80 f0         bra $fc50
$11:fc60  70 3c         bvs $fc9e
$11:fc62  14 0f         trb $0f
$11:fc64  85 80         sta $80
$11:fc66  e2 d0         sep #$d0
$11:fc68  20 b0 21      jsr $21b0
$11:fc6b  40            rti
$11:fc6c  32 01         and ($01)
$11:fc6e  91 0f         sta ($0f),y
$11:fc70  a2 04         ldx #$04
$11:fc72  60            rts
$11:fc73  50 38         bvc $fcad
$11:fc75  00 ac         brk #$ac
$11:fc77  3d 5b 7c      and $7c5b,x
$11:fc7a  d6 9e         dec $9e,x
$11:fc7c  35 a4         and $a4,x
$11:fc7e  94 f0         sty $f0,x
$11:fc80  33 be         and ($be,s),y
$11:fc82  2f 14 77 19   and $197714
$11:fc86  53 8c         eor ($8c,s),y
$11:fc88  69 a8 1f      adc #$1fa8
$11:fc8b  f1 f9         sbc ($f9),y
$11:fc8d  40            rti
$11:fc8e  3f f7 ec 0f   and $0fecf7,x
$11:fc92  fe 39 ff      inc $ff39,x
$11:fc95  a8            tay
$11:fc96  7f f4 36 dc   adc $dc36f4,x
$11:fc9a  cf 6a 67 a3   cmp $a3676a
$11:fc9e  b2 67         lda ($67)
$11:fca0  2c 77 3c      bit $3c77
$11:fca3  7e 3a fd      ror $fd3a,x
$11:fca6  30 e4         bmi $fc8c
$11:fca8  5d af 30      eor $30af,x
$11:fcab  6f fc 33 ff   adc $ff33fc
$11:fcaf  18            clc
$11:fcb0  22 09 14 20   jsl $201409
$11:fcb4  3f f8 3f ff   and $ff3ff8,x
$11:fcb8  01 ff         ora ($ff,x)
$11:fcba  c9 eb f9      cmp #$f9eb
$11:fcbd  93 c9         sta ($c9,s),y
$11:fcbf  87 c3         sta [$c3]
$11:fcc1  a1 c0         lda ($c0,x)
$11:fcc3  90 40         bcc $fd05
$11:fcc5  28            plp
$11:fcc6  00 22         brk #$22
$11:fcc8  e0 0f         cpx #$0f
$11:fcca  c2 05         rep #$05
$11:fccc  fe 84 7e      inc $7e84,x
$11:fccf  0e 61 e0      asl $e061
$11:fcd2  04 80         tsb $80
$11:fcd4  1c 00 63      trb $6300
$11:fcd7  06 82         asl $82
$11:fcd9  c1 e0         cmp ($e0,x)
$11:fcdb  d0 64         bne $fd41
$11:fcdd  88            dey
$11:fcde  41 c5         eor ($c5,x)
$11:fce0  40            rti
$11:fce1  98            tya
$11:fce2  20 f8 85      jsr $85f8
$11:fce5  84 56         sty $56
$11:fce7  40            rti
$11:fce8  f2 08         sbc ($08)
$11:fcea  97 82         sta [$82],y
$11:fcec  c0 fa         cpy #$fa
$11:fcee  0d 05 81      ora $8105
$11:fcf1  66 0f         ror $0f
$11:fcf3  51 68         eor ($68),y
$11:fcf5  02 28         cop #$28
$11:fcf7  74 10         stz $10,x
$11:fcf9  0b            phd
$11:fcfa  03 e4         ora $e4,s
$11:fcfc  00 84         brk #$84
$11:fcfe  04 17         tsb $17
$11:fd00  c0 05         cpy #$05
$11:fd02  06 11         asl $11
$11:fd04  10 8c         bpl $fc92
$11:fd06  48            pha
$11:fd07  26 18         rol $18
$11:fd09  06 28         asl $28
$11:fd0b  35 ee         and $ee,x
$11:fd0d  40            rti
$11:fd0e  77 06         adc [$06],y
$11:fd10  ba            tsx
$11:fd11  d3 21         cmp ($21,s),y
$11:fd13  f0 f4         beq $fd09
$11:fd15  a0 42         ldy #$42
$11:fd17  61 d0         adc ($d0,x)
$11:fd19  88            dey
$11:fd1a  2c 0a 0f      bit $0f0a
$11:fd1d  07 08         ora [$08]
$11:fd1f  95 1e         sta $1e,x
$11:fd21  81 0b         sta ($0b,x)
$11:fd23  80 42         bra $fd67
$11:fd25  60            rts
$11:fd26  30 98         bmi $fcc0
$11:fd28  04 3e         tsb $3e
$11:fd2a  15 08         ora $08,x
$11:fd2c  78            sei
$11:fd2d  84 1d         sty $1d
$11:fd2f  d8            cld
$11:fd30  1f df 35 ae   ora $ae35df,x
$11:fd34  45 e4         eor $e4
$11:fd36  90 e8         bcc $fd20
$11:fd38  ec 2b 90      cpx $902b
$11:fd3b  d0 32         bne $fd6f
$11:fd3d  cf b3 3f ce   cmp $ce3fb3
$11:fd41  6f e0 d2 78   adc $78d2e0
$11:fd45  15 8e         ora $8e,x
$11:fd47  40            rti
$11:fd48  af 17 59 66   lda $665917
$11:fd4c  e3 b2         sbc $b2,s
$11:fd4e  58            cli
$11:fd4f  33 5e         and ($5e,s),y
$11:fd51  bc 1f f9      ldy $f91f,x
$11:fd54  c4 fd         cpy $fd
$11:fd56  af 8b 90 6b   lda $6b908b
$11:fd5a  e3 20         sbc $20,s
$11:fd5c  5a            phy
$11:fd5d  f2 b5         sbc ($b5)
$11:fd5f  19 07 42      ora $4207,y
$11:fd62  61 50         adc ($50,x)
$11:fd64  88            dey
$11:fd65  5b            tcd
$11:fd66  23 93         and $93,s
$11:fd68  18            clc
$11:fd69  3c 72 02      bit $0272,x
$11:fd6c  0c 08 fc      tsb $fc08
$11:fd6f  02 bf         cop #$bf
$11:fd71  c0 87         cpy #$87
$11:fd73  e0 25         cpx #$25
$11:fd75  f6 08         inc $08,x
$11:fd77  1d 02 11      ora $1102,x
$11:fd7a  28            plp
$11:fd7b  81 46         sta ($46,x)
$11:fd7d  a0 10         ldy #$10
$11:fd7f  6d 97 33      adc $3397
$11:fd82  75 c4         adc $c4,x
$11:fd84  ed 79 3b      sbc $3b79
$11:fd87  1e 6b 75      asl $756b,x
$11:fd8a  ca            dex
$11:fd8b  f5 7c         sbc $7c,x
$11:fd8d  ba            tsx
$11:fd8e  5e ab 17      lsr $17ab,x
$11:fd91  4f f4 33 fd   eor $fd33f4
$11:fd95  04 bf         tsb $bf
$11:fd97  28            plp
$11:fd98  86 7d         stx $7d
$11:fd9a  00 87         brk #$87
$11:fd9c  40            rti
$11:fd9d  25 d0         and $d0
$11:fd9f  29 64 10      and #$1064
$11:fda2  a7 ab         lda [$ab]
$11:fda4  df 83 3c 81   cmp $813c83,x
$11:fda8  f2 0d         sbc ($0d)
$11:fdaa  21 81         and ($81,x)
$11:fdac  40            rti
$11:fdad  da            phx
$11:fdae  e0 da         cpx #$da
$11:fdb0  08            php
$11:fdb1  0c 06 1f      tsb $1f06
$11:fdb4  08            php
$11:fdb5  81 c0         sta ($c0,x)
$11:fdb7  1f 61 02 80   ora $800261,x
$11:fdbb  38            sec
$11:fdbc  49 d2 5d      eor #$5dd2
$11:fdbf  09 05 c0      ora #$c005
$11:fdc2  e2 3d         sep #$3d
$11:fdc4  0f 06 83 a1   ora $a18306
$11:fdc8  c0 d8         cpy #$d8
$11:fdca  3e 40 e4      rol $e440,x
$11:fdcd  1f 09 07 c2   ora $c20709,x
$11:fdd1  00 01         brk #$01
$11:fdd3  2b            pld
$11:fdd4  84 43         sty $43
$11:fdd6  e1 30         sbc ($30,x)
$11:fdd8  04 8c         tsb $8c
$11:fdda  41 b2         eor ($b2,x)
$11:fddc  2e 60 81      rol $8160
$11:fddf  41 dc         eor ($dc,x)
$11:fde1  60            rts
$11:fde2  c1 57         cmp ($57,x)
$11:fde4  08            php
$11:fde5  13 82         ora ($82,s),y
$11:fde7  09 04         ora #$04
$11:fde9  87 2a         sta [$2a]
$11:fdeb  41 82         eor ($82,x)
$11:fded  bb            tyx
$11:fdee  1a            inc a
$11:fdef  6d d3 1b      adc $1bd3
$11:fdf2  2a            rol a
$11:fdf3  ed e5 fe      sbc $fee5
$11:fdf6  3f 9f 27 c6   and $c6279f,x
$11:fdfa  89 44         bit #$44
$11:fdfc  9e 56 23      stz $2356,x
$11:fdff  1f ea 1f fa   ora $fa1fea,x
$11:fe03  07 1c         ora [$1c]
$11:fe05  83 fe         sta $fe,s
$11:fe07  a1 77         lda ($77,x)
$11:fe09  78            sei
$11:fe0a  3f 2f 0f f2   and $f20f2f,x
$11:fe0e  cf 59 2f 90   cmp $902f59
$11:fe12  f8            sed
$11:fe13  7f 82 01 7c   adc $7c0182,x
$11:fe17  c0 50         cpy #$50
$11:fe19  30 18         bmi $fe33
$11:fe1b  0e 05 82      asl $8205
$11:fe1e  81 20         sta ($20,x)
$11:fe20  90 33         bcc $fe55
$11:fe22  03 e1         ora $e1,s
$11:fe24  ff bf ff ef   sbc $efffbf,x
$11:fe28  9f c8 07 00   sta $0007c8,x
$11:fe2c  ca            dex
$11:fe2d  18            clc
$11:fe2e  0f 05 02 c1   ora $c10205
$11:fe32  00 80         brk #$80
$11:fe34  54 36 1c      mvn $1c,$36
$11:fe37  43 20         eor $20,s
$11:fe39  1c e8 02      trb $02e8
$11:fe3c  07 2c         ora [$2c]
$11:fe3e  9e 40 2f      stz $2f40,x
$11:fe41  d3 ce         cmp ($ce,s),y
$11:fe43  1c 91 28      trb $2891
$11:fe46  29 30         and #$30
$11:fe48  48            pha
$11:fe49  82 3c 51      brl $4f88
$11:fe4c  c6 a3         dec $a3
$11:fe4e  54 f0 ba      mvn $ba,$f0
$11:fe51  49 c4         eor #$c4
$11:fe53  0e 91 80      asl $8091
$11:fe56  c0 a0         cpy #$a0
$11:fe58  4d d0 58      eor $58d0
$11:fe5b  93 a0         sta ($a0,s),y
$11:fe5d  96 e3         stx $e3,y
$11:fe5f  03 82         ora $82,s
$11:fe61  41 9d         eor ($9d,x)
$11:fe63  05 60         ora $60
$11:fe65  98            tya
$11:fe66  4c 24 05      jmp $0524
$11:fe69  81 36         sta ($36,x)
$11:fe6b  05 00         ora $00
$11:fe6d  d0 18         bne $fe87
$11:fe6f  03 98         ora $98,s
$11:fe71  f0 3e         beq $feb1
$11:fe73  0d f0 34      ora $34f0
$11:fe76  83 8c         sta $8c,s
$11:fe78  4c c3 00      jmp $00c3
$11:fe7b  6d 8c 52      adc $528c
$11:fe7e  19 14 82      ora $8214,y
$11:fe81  46 e0         lsr $e0
$11:fe83  f0 c8         beq $fe4d
$11:fe85  0c 1c e6      tsb $e61c
$11:fe88  a1 10         lda ($10,x)
$11:fe8a  85 c6         sta $c6
$11:fe8c  20 11 08      jsr $0811
$11:fe8f  14 2a         trb $2a
$11:fe91  00 ca         brk #$ca
$11:fe93  03 9d         ora $9d,s
$11:fe95  b3 02         lda ($02,s),y
$11:fe97  06 b4         asl $b4
$11:fe99  20 74 31      jsr $3174
$11:fe9c  85 76         sta $76
$11:fe9e  30 1e         bmi $febe
$11:fea0  c6 43         dec $43
$11:fea2  91 90         sta ($90),y
$11:fea4  b8            clv
$11:fea5  48            pha
$11:fea6  3a            dec a
$11:fea7  16 0e         asl $0e,x
$11:fea9  06 80         asl $80
$11:feab  b0 0e         bcs $febb
$11:fead  71 c0         adc ($c0),y
$11:feaf  58            cli
$11:feb0  3f 03 f0 70   and $70f003,x
$11:feb4  8f c2 80 e4   sta $e480c2
$11:feb8  17 4a         ora [$4a],y
$11:feba  04 58         tsb $58
$11:febc  3b            tsc
$11:febd  02 34         cop #$34
$11:febf  33 a4         and ($a4,s),y
$11:fec1  82 79 68      brl $673d
$11:fec4  8a            txa
$11:fec5  66 20         ror $20
$11:fec7  97 0b         sta [$0b],y
$11:fec9  67 b3         adc [$b3]
$11:fecb  91 ec         sta ($ec),y
$11:fecd  c0 68         cpy #$68
$11:fecf  31 9a         and ($9a),y
$11:fed1  4c 64 72      jmp $7264
$11:fed4  19 7c b2      ora $b27c,y
$11:fed7  7f 3e 99 cf   adc $cf993e,x
$11:fedb  a4 f3         ldy $f3
$11:fedd  e1 7c         sbc ($7c,x)
$11:fedf  fc 4d 37      jsr ($374d,x)
$11:fee2  08            php
$11:fee3  b0 ac         bcs $fe91
$11:fee5  5d 23 13      eor $1323,x
$11:fee8  44 88 4f      mvp $4f,$88
$11:feeb  26 13         rol $13
$11:feed  49 c4         eor #$c4
$11:feef  32 79         and ($79)
$11:fef1  18            clc
$11:fef2  92 45         sta ($45)
$11:fef4  25 13         and $13
$11:fef6  c8            iny
$11:fef7  22 7c 25 8a   jsl $8a257c
$11:fefb  20 80 43      jsr $4380
$11:fefe  20 13 88      jsr $8813
$11:ff01  04 f1         tsb $f1
$11:ff03  54 10 8d      mvn $8d,$10
$11:ff06  47 63         eor [$63]
$11:ff08  91 30         sta ($30),y
$11:ff0a  b8            clv
$11:ff0b  52 38         eor ($38)
$11:ff0d  1d 89 46      ora $4689,x
$11:ff10  c2 71         rep #$71
$11:ff12  30 a8         bmi $febc
$11:ff14  46 28         lsr $28
$11:ff16  11 8f         ora ($8f),y
$11:ff18  c4 43         cpy $43
$11:ff1a  f1 d0         sbc ($d0),y
$11:ff1c  dc 7a 27      jml [$277a]
$11:ff1f  1e 8a c7      asl $c78a,x
$11:ff22  82 91 70      brl $6fb6
$11:ff25  b4 32         ldy $32,x
$11:ff27  84 56         sty $56
$11:ff29  40            rti
$11:ff2a  9c 04 e5      stz $e504
$11:ff2d  80 6a         bra $ff99
$11:ff2f  0f 01 e8 78   ora $78e801
$11:ff33  3c 1f 0e      bit $0e1f,x
$11:ff36  87 c3         sta [$c3]
$11:ff38  60            rts
$11:ff39  37 07         and [$07],y
$11:ff3b  c8            iny
$11:ff3c  44 1f e5      mvp $e5,$1f
$11:ff3f  b0 80         bcs $fec1
$11:ff41  4c 20 04      jmp $0420
$11:ff44  a0 f8 02      ldy #$02f8
$11:ff47  82 20 5a      brl $596a
$11:ff4a  41 48         eor ($48,x)
$11:ff4c  41 60         eor ($60,x)
$11:ff4e  d0 68         bne $ffb8
$11:ff50  3c 1e 01      bit $011e,x
$11:ff53  04 2d         tsb $2d
$11:ff55  2c 0e 00      bit $000e
$11:ff58  1b            tcs
$11:ff59  01 38         ora ($38,x)
$11:ff5b  8a            txa
$11:ff5c  c6 03         dec $03
$11:ff5e  02 82         cop #$82
$11:ff60  42 e2         wdm #$e2
$11:ff62  72 ce         adc ($ce)
$11:ff64  ec fb dd      cpx $ddfb
$11:ff67  1f 9f ff ee   ora $eeff9f,x
$11:ff6b  f7 31         sbc [$31],y
$11:ff6d  19 43 e0      ora $e043,y
$11:ff70  73 f8         adc ($f8,s),y
$11:ff72  67 de         adc [$de]
$11:ff74  01 fb         ora ($fb,x)
$11:ff76  80 7e         bra $fff6
$11:ff78  60            rts
$11:ff79  18            clc
$11:ff7a  cf e7 03 81   cmp $8103e7
$11:ff7e  ec 8d c4      cpx $c48d
$11:ff81  fd 90 4f      sbc $4f90,x
$11:ff84  ff de 1e 37   sbc $371ede,x
$11:ff88  0d ff ff      ora $ffff
$11:ff8b  e0 0b 08      cpx #$080b
$11:ff8e  07 fe         ora [$fe]
$11:ff90  07 ff         ora [$ff]
$11:ff92  f0 16         beq $ffaa
$11:ff94  83 f0         sta $f0,s
$11:ff96  46 1f         lsr $1f
$11:ff98  b3 85         lda ($85,s),y
$11:ff9a  61 bf         adc ($bf,x)
$11:ff9c  6f 34 77 f7   adc $f77734
$11:ffa0  fc bf ff      jsr ($ffbf,x)
$11:ffa3  dc 2d fb      jml [$fb2d]
$11:ffa6  f8            sed
$11:ffa7  7f e0 3e 78   adc $783ee0,x
$11:ffab  07 cd         ora [$cd]
$11:ffad  c2 f0         rep #$f0
$11:ffaf  5f dd af 37   eor $37afdd,x
$11:ffb3  31 e0         and ($e0),y
$11:ffb5  f5 f3         sbc $f3,x
$11:ffb7  15 28         ora $28,x
$11:ffb9  e4 30         cpx $30
$11:ffbb  82 02 50      brl $4fc0
$11:ffbe  2f 07 e3 f9   and $f9e307
$11:ffc2  87 ff         sta [$ff]
$11:ffc4  4f ec 77 fb   eor $fb77ec
$11:ffc8  05 fa         ora $fa
$11:ffca  21 1f         and ($1f,x)
$11:ffcc  4d 83 84      eor $8483
$11:ffcf  a8            tay
$11:ffd0  18            clc
$11:ffd1  0c 87 82      tsb $8287
$11:ffd4  e9 38 8d      sbc #$8d38
$11:ffd7  41 29         eor ($29,x)
$11:ffd9  3a            dec a
$11:ffda  2c 26 01      bit $0126
$11:ffdd  c2 7c         rep #$7c
$11:ffdf  00 50         brk #$50
$11:ffe1  70 3f         bvs $0022
$11:ffe3  97 8b         sta [$8b],y
$11:ffe5  f4 63 f7      pea $f763
$11:ffe8  0c c6 38      tsb $38c6
$11:ffeb  35 bb         and $bb,x
$11:ffed  e0 4f 2a      cpx #$2a4f
$11:fff0  f9 9b ce      sbc $ce9b,y
$11:fff3  fe 88 f4      inc $f488,x
$11:fff6  cf aa bd 76   cmp $76bdaa
$11:fffa  40            rti
$11:fffb  00 e0         brk #$e0
$11:fffd  78            sei
$11:fffe  1c 00 00      trb $0000
