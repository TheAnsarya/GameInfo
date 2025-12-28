; Soul Blazer (SNES) - Bank $1f
; Disassembled from ROM
; File offset: $0f8000-$0fffff
; CPU address: $1f:$8000-$1f:$ffff
;===========================================================

.bank $1f
.org $8000

$1f:8000  02 3b         cop #$3b
$1f:8002  7c 00 16      jmp ($1600,x)
$1f:8005  80 02         bra $8009
$1f:8007  17 5a         ora [$5a],y
$1f:8009  a9 e2         lda #$e2
$1f:800b  20 a9 00      jsr $00a9
$1f:800e  48            pha
$1f:800f  c2 20         rep #$20
$1f:8011  a9 5e b0      lda #$b05e
$1f:8014  48            pha
$1f:8015  6b            rtl
$1f:8016  02 85         cop #$85
$1f:8018  9d a9 00      sta $00a9,x
$1f:801b  02 15         cop #$15
$1f:801d  02 17         cop #$17
$1f:801f  29 80 02      and #$0280
$1f:8022  80 11         bra $8035
$1f:8024  02 82         cop #$82
$1f:8026  82 f8 ff      brl $8021
$1f:8029  02 07         cop #$07
$1f:802b  04 87         tsb $87
$1f:802d  4a            lsr a
$1f:802e  80 02         bra $8032
$1f:8030  19 1c 45      ora $451c,y
$1f:8033  80 02         bra $8037
$1f:8035  01 59         ora ($59,x)
$1f:8037  80 02         bra $803b
$1f:8039  3c 04 02      bit $0204,x
$1f:803c  10 09         bpl $8047
$1f:803e  02 01         cop #$01
$1f:8040  78            sei
$1f:8041  00 10         brk #$10
$1f:8043  04 6b         tsb $6b
$1f:8045  02 01         cop #$01
$1f:8047  4f 80 6b 02   eor $026b80
$1f:804b  01 80         ora ($80,x)
$1f:804d  80 6b         bra $80ba
$1f:804f  10 5a         bpl $80ab
$1f:8051  7a            ply
$1f:8052  7a            ply
$1f:8053  7a            ply
$1f:8054  7a            ply
$1f:8055  20 13 44      jsr $4413
$1f:8058  aa            tax
$1f:8059  10 02         bpl $805d
$1f:805b  02 20         cop #$20
$1f:805d  70 6c         bvs $80cb
$1f:805f  61 63         adc ($63,x)
$1f:8061  65 64         adc $64
$1f:8063  20 0d e1      jsr $e10d
$1f:8066  85 52         sta $52
$1f:8068  6f 64 20 cd   adc $cd2064
$1f:806c  0d e1 64      ora $64e1
$1f:806f  6f 6c 70 68   adc $68706c
$1f:8073  69 6e 60      adc #$606e
$1f:8076  d7 6e         cmp [$6e],y
$1f:8078  6f 73 65 2e   adc $2e6573
$1f:807c  20 13 44      jsr $4413
$1f:807f  aa            tax
$1f:8080  10 88         bpl $800a
$1f:8082  9f b5 e1 73   sta $73e1b5,x
$1f:8086  61 6d         adc ($6d,x)
$1f:8088  65 0d         adc $0d
$1f:808a  64 72         stz $72
$1f:808c  65 61         adc $61
$1f:808e  6d 2e 20      adc $202e
$1f:8091  49 73 6e      eor #$6e73
$1f:8094  60            rts
$1f:8095  e5 e3         sbc $e3
$1f:8097  0d 73 74      ora $7473
$1f:809a  72 61         adc ($61)
$1f:809c  6e 67 65      ror $6567
$1f:809f  21 20         and ($20,x)
$1f:80a1  13 44         ora ($44,s),y
$1f:80a3  aa            tax
$1f:80a4  02 14         cop #$14
$1f:80a6  b1 00         lda ($00),y
$1f:80a8  ab            plb
$1f:80a9  80 6b         bra $8116
$1f:80ab  02 30         cop #$30
$1f:80ad  b1 00         lda ($00),y
$1f:80af  08            php
$1f:80b0  81 1f         sta ($1f,x)
$1f:80b2  02 07         cop #$07
$1f:80b4  01 87         ora ($87,x)
$1f:80b6  d4 80         pei ($80)
$1f:80b8  02 85         cop #$85
$1f:80ba  9d a9 00      sta $00a9,x
$1f:80bd  02 17         cop #$17
$1f:80bf  dc 80 02      jml [$0280]
$1f:80c2  81 14         sta ($14,x)
$1f:80c4  02 02         cop #$02
$1f:80c6  83 02         sta $02,s
$1f:80c8  87 02         sta [$02]
$1f:80ca  81 13         sta ($13,x)
$1f:80cc  02 02         cop #$02
$1f:80ce  83 02         sta $02,s
$1f:80d0  87 82         sta [$82]
$1f:80d2  ed ff 02      sbc $02ff
$1f:80d5  85 9d         sta $9d
$1f:80d7  a9 00 02      lda #$0200
$1f:80da  86 6b         stx $6b
$1f:80dc  bd 16 00      lda $0016,x
$1f:80df  29 ef ff      and #$ffef
$1f:80e2  9d 16 00      sta $0016,x
$1f:80e5  02 01         cop #$01
$1f:80e7  4a            lsr a
$1f:80e8  81 bd         sta ($bd,x)
$1f:80ea  16 00         asl $00,x
$1f:80ec  09 10 00      ora #$0010
$1f:80ef  9d 16 00      sta $0016,x
$1f:80f2  e2 20         sep #$20
$1f:80f4  ad 82 1b      lda $1b82
$1f:80f7  09 04         ora #$04
$1f:80f9  8d 82 1b      sta $1b82
$1f:80fc  c2 20         rep #$20
$1f:80fe  02 09         cop #$09
$1f:8100  01 87         ora ($87,x)
$1f:8102  00 4e         brk #$4e
$1f:8104  02 27         cop #$27
$1f:8106  d4 80         pei ($80)
$1f:8108  02 01         cop #$01
$1f:810a  0f 81 02 86   ora $860281
$1f:810e  6b            rtl
$1f:810f  10 0e         bpl $811f
$1f:8111  3c 88 b5      bit $b588,x
$1f:8114  e1 70         sbc ($70,x)
$1f:8116  6f 77 65 72   adc $726577
$1f:811a  20 e2 0d      jsr $0de2
$1f:811d  73 74         adc ($74,s),y
$1f:811f  6f 70 20 e1   adc $e12070
$1f:8123  4d 61 67      eor $6761
$1f:8126  6d 61 20      adc $2061
$1f:8129  52 61         eor ($61)
$1f:812b  69 6e 2e      adc #$2e6e
$1f:812e  20 0d 88      jsr $880d
$1f:8131  f1 b7         sbc ($b7),y
$1f:8133  fe 69 66      inc $6669,x
$1f:8136  20 79 6f      jsr $6f79
$1f:8139  75 0d         adc $0d,x
$1f:813b  72 65         adc ($65)
$1f:813d  74 75         stz $75,x
$1f:813f  72 6e         adc ($6e)
$1f:8141  20 e2 6d      jsr $6de2
$1f:8144  65 2e         adc $2e
$1f:8146  20 13 44      jsr $4413
$1f:8149  aa            tax
$1f:814a  10 45         bpl $8191
$1f:814c  76 65         ror $65,x
$1f:814e  6e 20 eb      ror $eb20
$1f:8151  88            dey
$1f:8152  64 6f         stz $6f
$1f:8154  6e 60 e5      ror $e560
$1f:8157  0d 6c 6f      ora $6f6c
$1f:815a  6f 6b 20 be   adc $be206b
$1f:815e  69 74 2c      adc #$2c74
$1f:8161  20 88 9d      jsr $9d88
$1f:8164  0d ad e1      ora $e1ad
$1f:8167  73 6b         adc ($6b,s),y
$1f:8169  79 20 bc      adc $bc20,y
$1f:816c  6c 69 6b      jmp ($6b69)
$1f:816f  65 0d         adc $0d
$1f:8171  79 6f 75      adc $756f,y
$1f:8174  2e 20 11      rol $1120
$1f:8177  88            dey
$1f:8178  f1 70         sbc ($70),y
$1f:817a  72 6f         adc ($6f)
$1f:817c  74 65         stz $65,x
$1f:817e  63 74         adc $74,s
$1f:8180  20 fe 0d      jsr $0dfe
$1f:8183  ad e1 4d      lda $4de1
$1f:8186  61 67         adc ($67,x)
$1f:8188  6d 61 2e      adc $2e61
$1f:818b  20 11 8f      jsr $8f11
$1f:818e  74 72         stz $72,x
$1f:8190  79 20 96      adc $9620,y
$1f:8193  70 72         bvs $8207
$1f:8195  6f 74 65 63   adc $636574
$1f:8199  74 0d         stz $0d,x
$1f:819b  9a            txs
$1f:819c  63 72         adc $72,s
$1f:819e  65 61         adc $61
$1f:81a0  74 75         stz $75,x
$1f:81a2  72 65         adc ($65)
$1f:81a4  73 2e         adc ($2e,s),y
$1f:81a6  20 11 4c      jsr $4c11
$1f:81a9  65 74         adc $74
$1f:81ab  60            rts
$1f:81ac  d7 77         cmp [$77],y
$1f:81ae  6f 72 6b 20   adc $206b72
$1f:81b2  74 6f         stz $6f,x
$1f:81b4  67 65         adc [$65]
$1f:81b6  74 68         stz $68,x
$1f:81b8  65 72         adc $72
$1f:81ba  20 73 6f      jsr $6f73
$1f:81bd  0d 77 65      ora $6577
$1f:81c0  20 6d 61      jsr $616d
$1f:81c3  79 20 72      adc $7220,y
$1f:81c6  65 76         adc $76
$1f:81c8  69 76 65      adc #$6576
$1f:81cb  20 e1 0d      jsr $0de1
$1f:81ce  77 6f         adc [$6f],y
$1f:81d0  72 6c         adc ($6c)
$1f:81d2  64 21         stz $21
$1f:81d4  20 11 91      jsr $9111
$1f:81d7  63 72         adc $72,s
$1f:81d9  65 61         adc $61
$1f:81db  74 75         stz $75,x
$1f:81dd  72 65         adc ($65)
$1f:81df  20 e3 0d      jsr $0de3
$1f:81e2  65 6e         adc $6e
$1f:81e4  61 62         adc ($62,x)
$1f:81e6  6c 65 73      jmp ($7365)
$1f:81e9  20 fe e2      jsr $e2fe
$1f:81ec  61 76         adc ($76,x)
$1f:81ee  6f 69 64 20   adc $206469
$1f:81f2  0d 4d 61      ora $614d
$1f:81f5  67 6d         adc [$6d]
$1f:81f7  61 20         adc ($20,x)
$1f:81f9  b6 6a         ldx $6a,y
$1f:81fb  6f 69 6e 65   adc $656e69
$1f:81ff  64 20         stz $20
$1f:8201  79 6f 75      adc $756f,y
$1f:8204  2e 20 13      rol $1320
$1f:8207  44 aa 02      mvp $02,$aa
$1f:820a  3b            tsc
$1f:820b  83 00         sta $00,s
$1f:820d  1f 82 02 17   ora $170282,x
$1f:8211  5a            phy
$1f:8212  a9 e2 20      lda #$20e2
$1f:8215  a9 00 48      lda #$4800
$1f:8218  c2 20         rep #$20
$1f:821a  a9 5e b0      lda #$b05e
$1f:821d  48            pha
$1f:821e  6b            rtl
$1f:821f  02 85         cop #$85
$1f:8221  9d a9 00      sta $00a9,x
$1f:8224  02 17         cop #$17
$1f:8226  6b            rtl
$1f:8227  82 02 80      brl $022c
$1f:822a  12 02         ora ($02)
$1f:822c  82 02 a3      brl $2531
$1f:822f  02 84         cop #$84
$1f:8231  4f 82 1f 02   eor $021f82
$1f:8235  80 1f         bra $8256
$1f:8237  02 82         cop #$82
$1f:8239  02 84         cop #$84
$1f:823b  4f 82 1f 02   eor $021f82
$1f:823f  a6 02         ldx $02
$1f:8241  17 66         ora [$66],y
$1f:8243  82 02 81      brl $0348
$1f:8246  12 02         ora ($02)
$1f:8248  02 83         cop #$83
$1f:824a  02 87         cop #$87
$1f:824c  82 de ff      brl $822d
$1f:824f  a9 10 03      lda #$0310
$1f:8252  9d 16 00      sta $0016,x
$1f:8255  a9 2a 00      lda #$002a
$1f:8258  9d 1e 00      sta $001e,x
$1f:825b  9e 20 00      stz $0020,x
$1f:825e  02 80         cop #$80
$1f:8260  2a            rol a
$1f:8261  02 82         cop #$82
$1f:8263  02 86         cop #$86
$1f:8265  6b            rtl
$1f:8266  02 01         cop #$01
$1f:8268  70 82         bvs $81ec
$1f:826a  6b            rtl
$1f:826b  02 01         cop #$01
$1f:826d  a8            tay
$1f:826e  82 6b 10      brl $92dc
$1f:8271  88            dey
$1f:8272  64 69         stz $69
$1f:8274  64 6e         stz $6e
$1f:8276  60            rts
$1f:8277  e5 bd         sbc $bd
$1f:8279  e1 0d         sbc ($0d,x)
$1f:827b  f6 75         inc $75,x
$1f:827d  6e 64 65      ror $6564
$1f:8280  72 20         adc ($20)
$1f:8282  77 61         adc [$61],y
$1f:8284  74 65         stz $65,x
$1f:8286  72 20         adc ($20)
$1f:8288  0d 6c 6f      ora $6f6c
$1f:828b  6f 6b 65 64   adc $64656b
$1f:828f  20 64 69      jsr $6964
$1f:8292  66 66         ror $66
$1f:8294  65 72         adc $72
$1f:8296  65 6e         adc $6e
$1f:8298  74 20         stz $20,x
$1f:829a  ad 0d e1      lda $e10d
$1f:829d  f6 61         inc $61,x
$1f:829f  62 6f 76      per $f911
$1f:82a2  65 2e         adc $2e
$1f:82a4  20 13 44      jsr $4413
$1f:82a7  aa            tax
$1f:82a8  10 8f         bpl $8239
$1f:82aa  64 6f         stz $6f
$1f:82ac  6e 60 e5      ror $e560
$1f:82af  ea            nop
$1f:82b0  e2 0d         sep #$0d
$1f:82b2  c3 77         cmp $77,s
$1f:82b4  68            pla
$1f:82b5  69 6c 65      adc #$656c
$1f:82b8  20 49 60      jsr $6049
$1f:82bb  c6 6a         dec $6a
$1f:82bd  75 6d         adc $6d,x
$1f:82bf  70 69         bvs $832a
$1f:82c1  6e 67 2c      ror $2c67
$1f:82c4  20 0d 88      jsr $880d
$1f:82c7  f1 ca         sbc ($ca),y
$1f:82c9  a1 61         lda ($61,x)
$1f:82cb  62 6c 65      per $e83a
$1f:82ce  20 e2 0d      jsr $0de2
$1f:82d1  62 72 65      per $e846
$1f:82d4  61 74         adc ($74,x)
$1f:82d6  68            pla
$1f:82d7  65 2e         adc $2e
$1f:82d9  20 13 44      jsr $4413
$1f:82dc  aa            tax
$1f:82dd  02 14         cop #$14
$1f:82df  84 00         sty $00
$1f:82e1  e4 82         cpx $82
$1f:82e3  6b            rtl
$1f:82e4  02 17         cop #$17
$1f:82e6  f2 82         sbc ($82)
$1f:82e8  02 15         cop #$15
$1f:82ea  02 91         cop #$91
$1f:82ec  02 80         cop #$80
$1f:82ee  06 02         asl $02
$1f:82f0  82 6b 02      brl $855e
$1f:82f3  01 1c         ora ($1c,x)
$1f:82f5  83 02         sta $02,s
$1f:82f7  1a            inc a
$1f:82f8  02 cf         cop #$cf
$1f:82fa  02 17         cop #$17
$1f:82fc  83 af         sta $af,s
$1f:82fe  d0 03         bne $8303
$1f:8300  00 d0         brk #$d0
$1f:8302  14 02         trb $02
$1f:8304  18            clc
$1f:8305  38            sec
$1f:8306  0d 83 02      ora $0283
$1f:8309  01 6c         ora ($6c,x)
$1f:830b  83 6b         sta $6b,s
$1f:830d  02 01         cop #$01
$1f:830f  55 83         eor $83,x
$1f:8311  00 5e         brk #$5e
$1f:8313  02 0a         cop #$0a
$1f:8315  38            sec
$1f:8316  6b            rtl
$1f:8317  02 01         cop #$01
$1f:8319  95 83         sta $83,x
$1f:831b  6b            rtl
$1f:831c  10 48         bpl $8366
$1f:831e  65 6c         adc $6c
$1f:8320  6c 6f 2c      jmp ($2c6f)
$1f:8323  20 88 b5      jsr $b588
$1f:8326  73 6f         adc ($6f,s),y
$1f:8328  6d 65 20      adc $2065
$1f:832b  0d 4d 65      ora $654d
$1f:832e  64 69         stz $69
$1f:8330  63 61         adc $61,s
$1f:8332  6c 20 48      jmp ($4820)
$1f:8335  65 72         adc $72
$1f:8337  62 73 20      per $a3ad
$1f:833a  c8            iny
$1f:833b  0d ad 73      ora $73ad
$1f:833e  65 61         adc $61
$1f:8340  77 65         adc [$65],y
$1f:8342  65 64         adc $64
$1f:8344  2e 20 0d      rol $0d20
$1f:8347  57 6f         eor [$6f],y
$1f:8349  75 6c         adc $6c,x
$1f:834b  64 20         stz $20
$1f:834d  fe be 6f      inc $6fbe,x
$1f:8350  6e 65 3f      ror $3f65
$1f:8353  20 0c 10      jsr $100c
$1f:8356  84 a0         sty $a0
$1f:8358  e2 c3         sep #$c3
$1f:835a  0d f4 fe      ora $fef4
$1f:835d  64 6f         stz $6f
$1f:835f  6e 60 e5      ror $e560
$1f:8362  b5 0d         lda $0d,x
$1f:8364  6f 6e 65 2e   adc $2e656e
$1f:8368  20 13 44      jsr $4413
$1f:836b  aa            tax
$1f:836c  10 4d         bpl $83bb
$1f:836e  65 64         adc $64
$1f:8370  69 63 61      adc #$6163
$1f:8373  6c 20 68      jmp ($6820)
$1f:8376  65 72         adc $72
$1f:8378  62 73 20      per $a3ee
$1f:837b  98            tya
$1f:837c  0d d5 72      ora $72d5
$1f:837f  61 72         adc ($72,x)
$1f:8381  65 2e         adc $2e
$1f:8383  20 0d 88      jsr $880d
$1f:8386  63 61         adc $61,s
$1f:8388  6e 60 e5      ror $e560
$1f:838b  b0 fe         bcs $838b
$1f:838d  6d 61 6e      adc $6e61
$1f:8390  79 2e 13      adc $132e,y
$1f:8393  44 aa 10      mvp $10,$aa
$1f:8396  84 db         sty $db
$1f:8398  c3 f4         cmp $f4,s
$1f:839a  fe 0d 6e      inc $6e0d,x
$1f:839d  65 65         adc $65
$1f:839f  64 20         stz $20
$1f:83a1  61 6e         adc ($6e,x)
$1f:83a3  6f 74 68 65   adc $656874
$1f:83a7  72 2e         adc ($2e)
$1f:83a9  20 13 44      jsr $4413
$1f:83ac  aa            tax
$1f:83ad  02 14         cop #$14
$1f:83af  86 00         stx $00
$1f:83b1  b4 83         ldy $83,x
$1f:83b3  6b            rtl
$1f:83b4  02 85         cop #$85
$1f:83b6  9d a9 00      sta $00a9,x
$1f:83b9  02 17         cop #$17
$1f:83bb  1b            tcs
$1f:83bc  84 02         sty $02
$1f:83be  81 13         sta ($13,x)
$1f:83c0  04 02         tsb $02
$1f:83c2  83 02         sta $02,s
$1f:83c4  07 07         ora [$07]
$1f:83c6  80 d6         bra $839e
$1f:83c8  83 02         sta $02,s
$1f:83ca  87 02         sta [$02]
$1f:83cc  81 14         sta ($14,x)
$1f:83ce  04 02         tsb $02
$1f:83d0  83 02         sta $02,s
$1f:83d2  87 82         sta [$82]
$1f:83d4  e7 ff         sbc [$ff]
$1f:83d6  02 17         cop #$17
$1f:83d8  00 00         brk #$00
$1f:83da  02 03         cop #$03
$1f:83dc  3d 02 04      and $0402,x
$1f:83df  00 56         brk #$56
$1f:83e1  02 a2         cop #$a2
$1f:83e3  30 02         bmi $83e7
$1f:83e5  a3 02         lda $02,s
$1f:83e7  84 04         sty $04
$1f:83e9  84 1f         sty $1f
$1f:83eb  02 80         cop #$80
$1f:83ed  15 02         ora $02,x
$1f:83ef  82 02 84      brl $07f4
$1f:83f2  04 84         tsb $84
$1f:83f4  1f 02 a6 02   ora $02a602,x
$1f:83f8  a2 20         ldx #$20
$1f:83fa  02 09         cop #$09
$1f:83fc  07 00         ora [$00]
$1f:83fe  02 17         cop #$17
$1f:8400  1b            tcs
$1f:8401  84 80         sty $80
$1f:8403  c5 a9         cmp $a9
$1f:8405  10 03         bpl $840a
$1f:8407  9d 16 00      sta $0016,x
$1f:840a  a9 2a 00      lda #$002a
$1f:840d  9d 1e 00      sta $001e,x
$1f:8410  9e 20 00      stz $0020,x
$1f:8413  02 80         cop #$80
$1f:8415  2a            rol a
$1f:8416  02 82         cop #$82
$1f:8418  02 86         cop #$86
$1f:841a  6b            rtl
$1f:841b  02 01         cop #$01
$1f:841d  24 84         bit $84
$1f:841f  02 09         cop #$09
$1f:8421  07 80         ora [$80]
$1f:8423  6b            rtl
$1f:8424  10 88         bpl $83ae
$1f:8426  9d e1 62      sta $62e1,x
$1f:8429  65 73         adc $73
$1f:842b  74 20         stz $20,x
$1f:842d  6a            ror a
$1f:842e  75 6d         adc $6d,x
$1f:8430  70 65         bvs $8497
$1f:8432  72 21         adc ($21)
$1f:8434  20 0d 49      jsr $490d
$1f:8437  60            rts
$1f:8438  bf 73 68 6f   lda $6f6873,x
$1f:843c  77 20         adc [$20],y
$1f:843e  79 6f 75      adc $756f,y
$1f:8441  2e 20 13      rol $1320
$1f:8444  44 aa 02      mvp $02,$aa
$1f:8447  14 99         trb $99
$1f:8449  00 4d         brk #$4d
$1f:844b  84 6b         sty $6b
$1f:844d  02 85         cop #$85
$1f:844f  9d a9 00      sta $00a9,x
$1f:8452  02 14         cop #$14
$1f:8454  c2 00         rep #$00
$1f:8456  5b            tcd
$1f:8457  84 82         sty $82
$1f:8459  19 00 02      ora $0200,y
$1f:845c  14 a5         trb $a5
$1f:845e  00 64         brk #$64
$1f:8460  84 82         sty $82
$1f:8462  10 00         bpl $8464
$1f:8464  02 14         cop #$14
$1f:8466  8b            phb
$1f:8467  00 6d         brk #$6d
$1f:8469  84 82         sty $82
$1f:846b  07 00         ora [$00]
$1f:846d  02 17         cop #$17
$1f:846f  93 84         sta ($84,s),y
$1f:8471  82 04 00      brl $8478
$1f:8474  02 17         cop #$17
$1f:8476  8e 84 02      stx $0284
$1f:8479  15 02         ora $02,x
$1f:847b  91 02         sta ($02),y
$1f:847d  80 06         bra $8485
$1f:847f  02 82         cop #$82
$1f:8481  6b            rtl
$1f:8482  02 09         cop #$09
$1f:8484  03 80         ora $80,s
$1f:8486  02 91         cop #$91
$1f:8488  02 80         cop #$80
$1f:848a  06 02         asl $02
$1f:848c  82 6b 02      brl $86fa
$1f:848f  01 9b         ora ($9b,x)
$1f:8491  84 6b         sty $6b
$1f:8493  02 01         cop #$01
$1f:8495  f1 84         sbc ($84),y
$1f:8497  02 27         cop #$27
$1f:8499  82 84 10      brl $9520
$1f:849c  4d 65 72      eor $7265
$1f:849f  6d 61 69      adc $6961
$1f:84a2  64 73         stz $73
$1f:84a4  20 b5 e2      jsr $e2b5
$1f:84a7  a1 0d         lda ($0d,x)
$1f:84a9  ee b2 61      inc $61b2
$1f:84ac  74 20         stz $20,x
$1f:84ae  64 61         stz $61
$1f:84b0  6e 63 69      ror $6963
$1f:84b3  6e 67 2e      ror $2e67
$1f:84b6  20 11 89      jsr $8911
$1f:84b9  74 68         stz $68,x
$1f:84bb  72 65         adc ($65)
$1f:84bd  65 20         adc $20
$1f:84bf  cb            wai
$1f:84c0  c2 0d         rep #$0d
$1f:84c2  73 74         adc ($74,s),y
$1f:84c4  75 64         adc $64,x
$1f:84c6  65 6e         adc $6e
$1f:84c8  74 73         stz $73,x
$1f:84ca  20 72 65      jsr $6572
$1f:84cd  74 75         stz $75,x
$1f:84cf  72 6e         adc ($6e)
$1f:84d1  2c 20 88      bit $8820
$1f:84d4  0d f1 73      ora $73f1
$1f:84d7  68            pla
$1f:84d8  6f 77 20 fe   adc $fe2077
$1f:84dc  6f 75 72 20   adc $207275
$1f:84e0  0d 67 72      ora $7267
$1f:84e3  65 61         adc $61
$1f:84e5  74 20         stz $20,x
$1f:84e7  64 61         stz $61
$1f:84e9  6e 63 65      ror $6563
$1f:84ec  2e 20 13      rol $1320
$1f:84ef  44 aa 10      mvp $10,$aa
$1f:84f2  94 fe         sty $fe,x
$1f:84f4  ee 6d 75      inc $756d
$1f:84f7  63 68         adc $68,s
$1f:84f9  2e 20 0d      rol $0d20
$1f:84fc  54 68 72      mvn $72,$68
$1f:84ff  65 65         adc $65
$1f:8501  20 cb c2      jsr $c2cb
$1f:8504  73 74         adc ($74,s),y
$1f:8506  75 64         adc $64,x
$1f:8508  65 6e         adc $6e
$1f:850a  74 73         stz $73,x
$1f:850c  20 0d a9      jsr $a90d
$1f:850f  62 61 63      per $e873
$1f:8512  6b            rtl
$1f:8513  2e 20 11      rol $1120
$1f:8516  88            dey
$1f:8517  f3 b1         sbc ($b1,s),y
$1f:8519  e2 73         sep #$73
$1f:851b  68            pla
$1f:851c  6f 77 20 0d   adc $0d2077
$1f:8520  fe 6f 75      inc $756f,x
$1f:8523  72 20         adc ($20)
$1f:8525  64 61         stz $61
$1f:8527  6e 63 65      ror $6563
$1f:852a  2e 88 e8      rol $e888
$1f:852d  0d 69 74      ora $7469
$1f:8530  20 f1 a1      jsr $a1f1
$1f:8533  6d 6f 72      adc $726f
$1f:8536  65 20         adc $20
$1f:8538  66 75         ror $75
$1f:853a  6e 20 69      ror $6920
$1f:853d  66 0d         ror $0d
$1f:853f  fe 6a 6f      inc $6f6a,x
$1f:8542  69 6e         adc #$6e
$1f:8544  20 75 73      jsr $7375
$1f:8547  2e 20 11      rol $1120
$1f:854a  88            dey
$1f:854b  f1 73         sbc ($73),y
$1f:854d  68            pla
$1f:854e  6f 77 20 fe   adc $fe2077
$1f:8552  e1 0d         sbc ($0d,x)
$1f:8554  65 61         adc $61
$1f:8556  73 69         adc ($69,s),y
$1f:8558  65 73         adc $73
$1f:855a  74 20         stz $20,x
$1f:855c  64 61         stz $61
$1f:855e  6e 63 65      ror $6563
$1f:8561  2c 20 bc      bit $bc20
$1f:8564  0d 6d 6f      ora $6f6d
$1f:8567  76 65         ror $65,x
$1f:8569  20 be 74      jsr $74be
$1f:856c  68            pla
$1f:856d  65 79         adc $79
$1f:856f  20 64 6f      jsr $6f64
$1f:8572  2e 20 13      rol $1320
$1f:8575  44 aa 02      mvp $02,$aa
$1f:8578  3b            tsc
$1f:8579  c2 00         rep #$00
$1f:857b  8d 85 02      sta $0285
$1f:857e  17 5a         ora [$5a],y
$1f:8580  a9 e2         lda #$e2
$1f:8582  20 a9 00      jsr $00a9
$1f:8585  48            pha
$1f:8586  c2 20         rep #$20
$1f:8588  a9 5e b0      lda #$b05e
$1f:858b  48            pha
$1f:858c  6b            rtl
$1f:858d  02 85         cop #$85
$1f:858f  9d a9 00      sta $00a9,x
$1f:8592  02 17         cop #$17
$1f:8594  b2 85         lda ($85)
$1f:8596  02 15         cop #$15
$1f:8598  02 80         cop #$80
$1f:859a  01 02         ora ($02,x)
$1f:859c  82 02 07      brl $8ca1
$1f:859f  03 00         ora $00,s
$1f:85a1  98            tya
$1f:85a2  85 02         sta $02
$1f:85a4  16 02         asl $02,x
$1f:85a6  80 03         bra $85ab
$1f:85a8  02 82         cop #$82
$1f:85aa  02 80         cop #$80
$1f:85ac  04 02         tsb $02
$1f:85ae  82 82 f3      brl $7933
$1f:85b1  ff 02 01 b7   sbc $b70102,x
$1f:85b5  85 6b         sta $6b
$1f:85b7  10 4d         bpl $8606
$1f:85b9  79 20 6e      adc $6e20,y
$1f:85bc  61 6d         adc ($6d,x)
$1f:85be  65 20         adc $20
$1f:85c0  ba            tsx
$1f:85c1  41 6e         eor ($6e,x)
$1f:85c3  6e 61 2e      ror $2e61
$1f:85c6  20 0d 88      jsr $880d
$1f:85c9  9d cc cb      sta $cbcc,x
$1f:85cc  e1 0d         sbc ($0d,x)
$1f:85ce  51 75         eor ($75),y
$1f:85d0  65 65         adc $65
$1f:85d2  6e 60 d7      ror $d760
$1f:85d5  64 61         stz $61
$1f:85d7  6e 63 65      ror $6563
$1f:85da  72 73         adc ($73)
$1f:85dc  2e 20 13      rol $1320
$1f:85df  44 aa 02      mvp $02,$aa
$1f:85e2  3b            tsc
$1f:85e3  a5 00         lda $00
$1f:85e5  f7 85         sbc [$85],y
$1f:85e7  02 17         cop #$17
$1f:85e9  5a            phy
$1f:85ea  a9 e2 20      lda #$20e2
$1f:85ed  a9 00 48      lda #$4800
$1f:85f0  c2 20         rep #$20
$1f:85f2  a9 5e b0      lda #$b05e
$1f:85f5  48            pha
$1f:85f6  6b            rtl
$1f:85f7  02 85         cop #$85
$1f:85f9  9d a9 00      sta $00a9,x
$1f:85fc  02 17         cop #$17
$1f:85fe  1c 86 02      trb $0286
$1f:8601  15 02         ora $02,x
$1f:8603  80 01         bra $8606
$1f:8605  02 82         cop #$82
$1f:8607  02 07         cop #$07
$1f:8609  03 00         ora $00,s
$1f:860b  02 86         cop #$86
$1f:860d  02 16         cop #$16
$1f:860f  02 80         cop #$80
$1f:8611  03 02         ora $02,s
$1f:8613  82 02 80      brl $0618
$1f:8616  04 02         tsb $02
$1f:8618  82 82 f3      brl $799d
$1f:861b  ff 02 07 03   sbc $030702,x
$1f:861f  85 27         sta $27
$1f:8621  86 02         stx $02
$1f:8623  01 2c         ora ($2c,x)
$1f:8625  86 6b         stx $6b
$1f:8627  02 01         cop #$01
$1f:8629  e3 86         sbc $86,s
$1f:862b  6b            rtl
$1f:862c  10 4d         bpl $867b
$1f:862e  79 20 6e      adc $6e20,y
$1f:8631  61 6d         adc ($6d,x)
$1f:8633  65 20         adc $20
$1f:8635  ba            tsx
$1f:8636  4b            phk
$1f:8637  61 6e         adc ($6e,x)
$1f:8639  6e 61 2e      ror $2e61
$1f:863c  20 0d 88      jsr $880d
$1f:863f  9d cc cb      sta $cbcc,x
$1f:8642  e1 0d         sbc ($0d,x)
$1f:8644  51 75         eor ($75),y
$1f:8646  65 65         adc $65
$1f:8648  6e 60 d7      ror $d760
$1f:864b  64 61         stz $61
$1f:864d  6e 63 65      ror $6563
$1f:8650  72 73         adc ($73)
$1f:8652  2e 20 11      rol $1120
$1f:8655  41 73         eor ($73,x)
$1f:8657  20 97 72      jsr $7297
$1f:865a  65 77         adc $77
$1f:865c  61 72         adc ($72,x)
$1f:865e  64 20         stz $20
$1f:8660  ae 73 61      ldx $6173
$1f:8663  76 69         ror $69,x
$1f:8665  6e 67 0d      ror $0d67
$1f:8668  75 73         adc $73,x
$1f:866a  20 88 f1      jsr $f188
$1f:866d  e7 fe         sbc [$fe]
$1f:866f  97 0d         sta [$0d],y
$1f:8671  73 65         adc ($65,s),y
$1f:8673  63 72         adc $72,s
$1f:8675  65 74         adc $74
$1f:8677  2e 20 11      rol $1120
$1f:867a  4e 6f 20      lsr $206f
$1f:867d  61 72         adc ($72,x)
$1f:867f  6d 6f 72      adc $726f
$1f:8682  20 f1 70      jsr $70f1
$1f:8685  72 6f         adc ($6f)
$1f:8687  74 65         stz $65,x
$1f:8689  63 74         adc $74,s
$1f:868b  20 0d fe      jsr $fe0d
$1f:868e  61 67         adc ($67,x)
$1f:8690  61 69         adc ($69,x)
$1f:8692  6e 73 74      ror $7473
$1f:8695  20 e1 4d      jsr $4de1
$1f:8698  61 67         adc ($67,x)
$1f:869a  6d 61 20      adc $2061
$1f:869d  0d 6f 66      ora $666f
$1f:86a0  66 20         ror $20
$1f:86a2  e1 76         sbc ($76,x)
$1f:86a4  6f 6c 63 61   adc $61636c
$1f:86a8  6e 69 63      ror $6369
$1f:86ab  20 0d 69      jsr $690d
$1f:86ae  73 6c         adc ($6c,s),y
$1f:86b0  61 6e         adc ($6e,x)
$1f:86b2  64 2c         stz $2c
$1f:86b4  20 44 75      jsr $7544
$1f:86b7  72 65         adc ($65)
$1f:86b9  61 6e         adc ($6e,x)
$1f:86bb  2e 20 11      rol $1120
$1f:86be  95 6d         sta $6d,x
$1f:86c0  75 73         adc $73,x
$1f:86c2  74 20         stz $20,x
$1f:86c4  66 69         ror $69
$1f:86c6  6e 64 20      ror $2064
$1f:86c9  97 77         sta [$77],y
$1f:86cb  61 79         adc ($79,x)
$1f:86cd  20 74 6f      jsr $6f74
$1f:86d0  0d 73 74      ora $7473
$1f:86d3  6f 70 20 e1   adc $e12070
$1f:86d7  76 6f         ror $6f,x
$1f:86d9  6c 63 61      jmp ($6163)
$1f:86dc  6e 6f 2e      ror $2e6f
$1f:86df  20 13 44      jsr $4413
$1f:86e2  aa            tax
$1f:86e3  10 4d         bpl $8732
$1f:86e5  79 20 6e      adc $6e20,y
$1f:86e8  61 6d         adc ($6d,x)
$1f:86ea  65 20         adc $20
$1f:86ec  ba            tsx
$1f:86ed  4b            phk
$1f:86ee  61 6e         adc ($6e,x)
$1f:86f0  6e 61 2e      ror $2e61
$1f:86f3  20 0d 88      jsr $880d
$1f:86f6  9d cc cb      sta $cbcc,x
$1f:86f9  e1 0d         sbc ($0d,x)
$1f:86fb  51 75         eor ($75),y
$1f:86fd  65 65         adc $65
$1f:86ff  6e 60 d7      ror $d760
$1f:8702  64 61         stz $61
$1f:8704  6e 63 65      ror $6563
$1f:8707  72 73         adc ($73)
$1f:8709  2e 20 11      rol $1120
$1f:870c  95 b5         sta $b5,x
$1f:870e  73 65         adc ($65,s),y
$1f:8710  69 7a 65      adc #$657a
$1f:8713  64 20         stz $20
$1f:8715  e1 0d         sbc ($0d,x)
$1f:8717  76 6f         ror $6f,x
$1f:8719  6c 63 61      jmp ($6163)
$1f:871c  6e 6f 2c      ror $2c6f
$1f:871f  20 72 69      jsr $6972
$1f:8722  67 68         adc [$68]
$1f:8724  74 3f         stz $3f,x
$1f:8726  20 0d 95      jsr $950d
$1f:8729  98            tya
$1f:872a  97 ee         sta [$ee],y
$1f:872c  62 72 61      per $e8a1
$1f:872f  76 65         ror $65,x
$1f:8731  20 0d 70      jsr $700d
$1f:8734  65 72         adc $72
$1f:8736  73 6f         adc ($6f,s),y
$1f:8738  6e 2e 20      ror $202e
$1f:873b  13 44         ora ($44,s),y
$1f:873d  aa            tax
$1f:873e  02 3b         cop #$3b
$1f:8740  8b            phb
$1f:8741  00 54         brk #$54
$1f:8743  87 02         sta [$02]
$1f:8745  17 5a         ora [$5a],y
$1f:8747  a9 e2 20      lda #$20e2
$1f:874a  a9 00 48      lda #$4800
$1f:874d  c2 20         rep #$20
$1f:874f  a9 5e b0      lda #$b05e
$1f:8752  48            pha
$1f:8753  6b            rtl
$1f:8754  02 85         cop #$85
$1f:8756  9d a9 00      sta $00a9,x
$1f:8759  02 17         cop #$17
$1f:875b  79 87 02      adc $0287,y
$1f:875e  15 02         ora $02,x
$1f:8760  80 01         bra $8763
$1f:8762  02 82         cop #$82
$1f:8764  02 07         cop #$07
$1f:8766  03 00         ora $00,s
$1f:8768  5f 87 02 16   eor $160287,x
$1f:876c  02 80         cop #$80
$1f:876e  03 02         ora $02,s
$1f:8770  82 02 80      brl $0775
$1f:8773  04 02         tsb $02
$1f:8775  82 82 f3      brl $7afa
$1f:8778  ff 02 01 7e   sbc $7e0102,x
$1f:877c  87 6b         sta [$6b]
$1f:877e  10 4d         bpl $87cd
$1f:8780  79 20 6e      adc $6e20,y
$1f:8783  61 6d         adc ($6d,x)
$1f:8785  65 20         adc $20
$1f:8787  ba            tsx
$1f:8788  4e 61 6e      lsr $6e61
$1f:878b  6e 61 2e      ror $2e61
$1f:878e  20 0d 88      jsr $880d
$1f:8791  9d cc cb      sta $cbcc,x
$1f:8794  e1 0d         sbc ($0d,x)
$1f:8796  51 75         eor ($75),y
$1f:8798  65 65         adc $65
$1f:879a  6e 60 d7      ror $d760
$1f:879d  64 61         stz $61
$1f:879f  6e 63 65      ror $6563
$1f:87a2  72 73         adc ($73)
$1f:87a4  2e 20 13      rol $1320
$1f:87a7  44 aa 02      mvp $02,$aa
$1f:87aa  14 8d         trb $8d
$1f:87ac  00 b0         brk #$b0
$1f:87ae  87 6b         sta [$6b]
$1f:87b0  02 30         cop #$30
$1f:87b2  8d 00 f9      sta $f900
$1f:87b5  87 1f         sta [$1f]
$1f:87b7  02 17         cop #$17
$1f:87b9  d5 87         cmp $87,x
$1f:87bb  02 91         cop #$91
$1f:87bd  02 0d         cop #$0d
$1f:87bf  00 22         brk #$22
$1f:87c1  1c c5 87      trb $87c5
$1f:87c4  6b            rtl
$1f:87c5  02 11         cop #$11
$1f:87c7  00 23         brk #$23
$1f:87c9  1e 02 33      asl $3302,x
$1f:87cc  a9 80 ef      lda #$ef80
$1f:87cf  1c 26 03      trb $0326
$1f:87d2  02 91         cop #$91
$1f:87d4  6b            rtl
$1f:87d5  02 01         cop #$01
$1f:87d7  00 88         brk #$88
$1f:87d9  02 07         cop #$07
$1f:87db  07 84         ora [$84]
$1f:87dd  f8            sed
$1f:87de  87 a9         sta [$a9]
$1f:87e0  80 ef         bra $87d1
$1f:87e2  0c 26 03      tsb $0326
$1f:87e5  a9 20 00      lda #$0020
$1f:87e8  8d b4 03      sta $03b4
$1f:87eb  02 09         cop #$09
$1f:87ed  03 89         ora $89,s
$1f:87ef  02 10         cop #$10
$1f:87f1  07 01         ora [$01]
$1f:87f3  02 a0         cop #$a0
$1f:87f5  06 40         asl $40
$1f:87f7  00 6b         brk #$6b
$1f:87f9  02 01         cop #$01
$1f:87fb  27 8b         and [$8b]
$1f:87fd  02 86         cop #$86
$1f:87ff  6b            rtl
$1f:8800  10 88         bpl $878a
$1f:8802  f1 6f         sbc ($6f),y
$1f:8804  70 65         bvs $886b
$1f:8806  6e 20 97      ror $9720
$1f:8809  70 61         bvs $886c
$1f:880b  73 73         adc ($73,s),y
$1f:880d  61 67         adc ($67,x)
$1f:880f  65 20         adc $20
$1f:8811  0d ae 79      ora $79ae
$1f:8814  6f 75 2e 20   adc $202e75
$1f:8818  11 54         ora ($54),y
$1f:881a  72 61         adc ($61)
$1f:881c  76 65         ror $65,x
$1f:881e  6c 20 75      jmp ($7520)
$1f:8821  70 20         bvs $8843
$1f:8823  e1 73         sbc ($73,x)
$1f:8825  65 61         adc $61
$1f:8827  62 65 64      per $ec8f
$1f:882a  20 0d e2      jsr $e20d
$1f:882d  72 65         adc ($65)
$1f:882f  61 63         adc ($63,x)
$1f:8831  68            pla
$1f:8832  20 e1 69      jsr $69e1
$1f:8835  73 6c         adc ($6c,s),y
$1f:8837  61 6e         adc ($6e,x)
$1f:8839  64 20         stz $20
$1f:883b  6f 66 0d 72   adc $720d66
$1f:883f  61 69         adc ($69,x)
$1f:8841  6e 2c 20      ror $202c
$1f:8844  42 6c         wdm #$6c
$1f:8846  65 73         adc $73
$1f:8848  74 65         stz $65,x
$1f:884a  72 2e         adc ($2e)
$1f:884c  20 13 44      jsr $4413
$1f:884f  aa            tax
$1f:8850  02 14         cop #$14
$1f:8852  ad 00 57      lda $5700
$1f:8855  88            dey
$1f:8856  6b            rtl
$1f:8857  02 85         cop #$85
$1f:8859  9d a9 00      sta $00a9,x
$1f:885c  02 17         cop #$17
$1f:885e  6a            ror a
$1f:885f  88            dey
$1f:8860  02 81         cop #$81
$1f:8862  12 04         ora ($04)
$1f:8864  02 83         cop #$83
$1f:8866  02 87         cop #$87
$1f:8868  80 f6         bra $8860
$1f:886a  bd 16 00      lda $0016,x
$1f:886d  29 ef ff      and #$ffef
$1f:8870  9d 16 00      sta $0016,x
$1f:8873  02 01         cop #$01
$1f:8875  81 88         sta ($88,x)
$1f:8877  bd 16 00      lda $0016,x
$1f:887a  09 10 00      ora #$0010
$1f:887d  9d 16 00      sta $0016,x
$1f:8880  6b            rtl
$1f:8881  10 0a         bpl $888d
$1f:8883  49 66 40      eor #$4066
$1f:8886  79 6f 75      adc $756f,y
$1f:8889  40            rti
$1f:888a  74 72         stz $72,x
$1f:888c  61 76         adc ($76,x)
$1f:888e  65 6c         adc $6c
$1f:8890  0d 74 68      ora $6874
$1f:8893  65 40         adc $40
$1f:8895  63 6f         adc $6f,s
$1f:8897  72 61         adc ($61)
$1f:8899  6c 40 72      jmp ($7240)
$1f:889c  65 65         adc $65
$1f:889e  66 40         ror $40
$1f:88a0  79 6f 75      adc $756f,y
$1f:88a3  0d 77 69      ora $6977
$1f:88a6  6c 6c 40      jmp ($406c)
$1f:88a9  66 69         ror $69
$1f:88ab  6e 64 40      ror $4064
$1f:88ae  61 40         adc ($40,x)
$1f:88b0  70 61         bvs $8913
$1f:88b2  73 73         adc ($73,s),y
$1f:88b4  61 67         adc ($67,x)
$1f:88b6  65 40         adc $40
$1f:88b8  74 6f         stz $6f,x
$1f:88ba  0d 61 40      ora $4061
$1f:88bd  73 6d         adc ($6d,s),y
$1f:88bf  61 6c         adc ($6c,x)
$1f:88c1  6c 40 63      jmp ($6340)
$1f:88c4  72 65         adc ($65)
$1f:88c6  65 6b         adc $6b
$1f:88c8  2e 13 44      rol $4413
$1f:88cb  aa            tax
$1f:88cc  02 3b         cop #$3b
$1f:88ce  be 00 e2      ldx $e200,y
$1f:88d1  88            dey
$1f:88d2  02 17         cop #$17
$1f:88d4  5a            phy
$1f:88d5  a9 e2 20      lda #$20e2
$1f:88d8  a9 00 48      lda #$4800
$1f:88db  c2 20         rep #$20
$1f:88dd  a9 5e b0      lda #$b05e
$1f:88e0  48            pha
$1f:88e1  6b            rtl
$1f:88e2  02 85         cop #$85
$1f:88e4  9d a9 00      sta $00a9,x
$1f:88e7  02 17         cop #$17
$1f:88e9  f5 88         sbc $88,x
$1f:88eb  02 81         cop #$81
$1f:88ed  12 04         ora ($04)
$1f:88ef  02 83         cop #$83
$1f:88f1  02 87         cop #$87
$1f:88f3  80 f6         bra $88eb
$1f:88f5  02 01         cop #$01
$1f:88f7  fa            plx
$1f:88f8  88            dey
$1f:88f9  6b            rtl
$1f:88fa  10 91         bpl $888d
$1f:88fc  63 6f         adc $6f,s
$1f:88fe  72 61         adc ($61)
$1f:8900  6c 20 72      jmp ($7220)
$1f:8903  65 65         adc $65
$1f:8905  66 20         ror $20
$1f:8907  0d 68 69      ora $6968
$1f:890a  64 65         stz $65
$1f:890c  73 20         adc ($20,s),y
$1f:890e  c7 64         cmp [$64]
$1f:8910  61 6e         adc ($6e,x)
$1f:8912  67 65         adc [$65]
$1f:8914  72 6f         adc ($6f)
$1f:8916  75 73         adc $73,x
$1f:8918  20 0d 6d      jsr $6d0d
$1f:891b  6f 6e 73 74   adc $74736e
$1f:891f  65 72         adc $72
$1f:8921  73 2e         adc ($2e,s),y
$1f:8923  20 4d 61      jsr $614d
$1f:8926  6b            rtl
$1f:8927  65 20         adc $20
$1f:8929  73 75         adc ($75,s),y
$1f:892b  72 65         adc ($65)
$1f:892d  20 0d e2      jsr $e20d
$1f:8930  ed 6d 61      sbc $616d
$1f:8933  67 69         adc [$69]
$1f:8935  63 20         adc $20,s
$1f:8937  74 68         stz $68,x
$1f:8939  65 72         adc $72
$1f:893b  65 2e         adc $2e
$1f:893d  20 13 44      jsr $4413
$1f:8940  aa            tax
$1f:8941  02 14         cop #$14
$1f:8943  92 00         sta ($00)
$1f:8945  48            pha
$1f:8946  89 6b 02      bit #$026b
$1f:8949  07 02         ora [$02]
$1f:894b  9f 84 89 02   sta $028984,x
$1f:894f  85 9d         sta $9d
$1f:8951  a9 00 02      lda #$0200
$1f:8954  17 87         ora [$87],y
$1f:8956  89 02 15      bit #$1502
$1f:8959  02 14         cop #$14
$1f:895b  b6 00         ldx $00,y
$1f:895d  67 89         adc [$89]
$1f:895f  02 80         cop #$80
$1f:8961  08            php
$1f:8962  02 82         cop #$82
$1f:8964  82 f2 ff      brl $8959
$1f:8967  02 16         cop #$16
$1f:8969  02 81         cop #$81
$1f:896b  0a            asl a
$1f:896c  03 02         ora $02,s
$1f:896e  83 02         sta $02,s
$1f:8970  96 02         stx $02,y
$1f:8972  80 08         bra $897c
$1f:8974  02 82         cop #$82
$1f:8976  02 15         cop #$15
$1f:8978  02 17         cop #$17
$1f:897a  8c 89 02      sty $0289
$1f:897d  91 02         sta ($02),y
$1f:897f  80 08         bra $8989
$1f:8981  02 82         cop #$82
$1f:8983  6b            rtl
$1f:8984  02 86         cop #$86
$1f:8986  6b            rtl
$1f:8987  02 01         cop #$01
$1f:8989  91 89         sta ($89),y
$1f:898b  6b            rtl
$1f:898c  02 01         cop #$01
$1f:898e  bb            tyx
$1f:898f  89 6b 10      bit #$106b
$1f:8992  92 ec         sta ($ec)
$1f:8994  e2 a1         sep #$a1
$1f:8996  e1 0d         sbc ($0d,x)
$1f:8998  51 75         eor ($75),y
$1f:899a  65 65         adc $65
$1f:899c  6e 60 d7      ror $d760
$1f:899f  70 61         bvs $8a02
$1f:89a1  6c 61 63      jmp ($6361)
$1f:89a4  65 2e         adc $2e
$1f:89a6  20 88 9d      jsr $9d88
$1f:89a9  0d e1 51      ora $51e1
$1f:89ac  75 65         adc $65,x
$1f:89ae  65 6e         adc $6e
$1f:89b0  60            rts
$1f:89b1  d7 6d         cmp [$6d],y
$1f:89b3  61 69         adc ($69,x)
$1f:89b5  64 2e         stz $2e
$1f:89b7  20 13 44      jsr $4413
$1f:89ba  aa            tax
$1f:89bb  10 88         bpl $8945
$1f:89bd  9d 67 6c      sta $6c67,x
$1f:89c0  61 64         adc ($64,x)
$1f:89c2  20 fe a9      jsr $a9fe
$1f:89c5  0d 62 61      ora $6162
$1f:89c8  63 6b         adc $6b,s
$1f:89ca  2e 20 13      rol $1320
$1f:89cd  44 aa 02      mvp $02,$aa
$1f:89d0  14 95         trb $95
$1f:89d2  00 d6         brk #$d6
$1f:89d4  89 6b         bit #$6b
$1f:89d6  02 17         cop #$17
$1f:89d8  e4 89         cpx $89
$1f:89da  02 15         cop #$15
$1f:89dc  02 80         cop #$80
$1f:89de  06 02         asl $02
$1f:89e0  82 82 f8      brl $8265
$1f:89e3  ff 02 01 e9   sbc $e90102,x
$1f:89e7  89 6b         bit #$6b
$1f:89e9  10 53         bpl $8a3e
$1f:89eb  65 72         adc $72
$1f:89ed  76 61         ror $61,x
$1f:89ef  73 20         adc ($20,s),y
$1f:89f1  ba            tsx
$1f:89f2  e1 6e         sbc ($6e,x)
$1f:89f4  61 6d         adc ($6d,x)
$1f:89f6  65 20         adc $20
$1f:89f8  cb            wai
$1f:89f9  0d c2 66      ora $66c2
$1f:89fc  72 69         adc ($69)
$1f:89fe  65 6e         adc $6e
$1f:8a00  64 20         stz $20
$1f:8a02  e1 64         sbc ($64,x)
$1f:8a04  6f 6c 70 68   adc $68706c
$1f:8a08  69 6e         adc #$6e
$1f:8a0a  2e 13 44      rol $4413
$1f:8a0d  aa            tax
$1f:8a0e  02 14         cop #$14
$1f:8a10  9b            txy
$1f:8a11  00 15         brk #$15
$1f:8a13  8a            txa
$1f:8a14  6b            rtl
$1f:8a15  02 85         cop #$85
$1f:8a17  9d a9 00      sta $00a9,x
$1f:8a1a  02 15         cop #$15
$1f:8a1c  02 17         cop #$17
$1f:8a1e  28            plp
$1f:8a1f  8a            txa
$1f:8a20  02 91         cop #$91
$1f:8a22  02 80         cop #$80
$1f:8a24  11 02         ora ($02),y
$1f:8a26  82 6b 02      brl $8c94
$1f:8a29  01 2d         ora ($2d,x)
$1f:8a2b  8a            txa
$1f:8a2c  6b            rtl
$1f:8a2d  10 93         bpl $89c2
$1f:8a2f  ec e2 a1      cpx $a1e2
$1f:8a32  0d 34 20      ora $2034
$1f:8a35  6d 65 72      adc $7265
$1f:8a38  6d 61 69      adc $6961
$1f:8a3b  64 20         stz $20
$1f:8a3d  73 74         adc ($74,s),y
$1f:8a3f  61 74         adc ($74,x)
$1f:8a41  75 65         adc $65,x
$1f:8a43  73 20         adc ($20,s),y
$1f:8a45  bb            tyx
$1f:8a46  0d e4 70      ora $70e4
$1f:8a49  6c 61 63      jmp ($6361)
$1f:8a4c  65 2e         adc $2e
$1f:8a4e  20 11 54      jsr $5411
$1f:8a51  68            pla
$1f:8a52  6f 73 65 20   adc $206573
$1f:8a56  73 74         adc ($74,s),y
$1f:8a58  61 74         adc ($74,x)
$1f:8a5a  75 65         adc $65,x
$1f:8a5c  73 20         adc ($20,s),y
$1f:8a5e  0d 70 72      ora $7270
$1f:8a61  65 76         adc $76
$1f:8a63  65 6e         adc $6e
$1f:8a65  74 65         stz $65,x
$1f:8a67  64 20         stz $20
$1f:8a69  9a            txs
$1f:8a6a  0d aa ad      ora $adaa
$1f:8a6d  67 65         adc [$65]
$1f:8a6f  74 74         stz $74,x
$1f:8a71  69 6e         adc #$6e
$1f:8a73  67 0d         adc [$0d]
$1f:8a75  6c 6f 73      jmp ($736f)
$1f:8a78  74 2e         stz $2e,x
$1f:8a7a  20 13 44      jsr $4413
$1f:8a7d  aa            tax
$1f:8a7e  02 14         cop #$14
$1f:8a80  9d 00 85      sta $8500,x
$1f:8a83  8a            txa
$1f:8a84  6b            rtl
$1f:8a85  02 30         cop #$30
$1f:8a87  9d 00 ce      sta $ce00,x
$1f:8a8a  8a            txa
$1f:8a8b  1f 02 17 aa   ora $aa1702,x
$1f:8a8f  8a            txa
$1f:8a90  02 91         cop #$91
$1f:8a92  02 0d         cop #$0d
$1f:8a94  00 22         brk #$22
$1f:8a96  22 9a 8a 6b   jsl $6b8a9a
$1f:8a9a  02 11         cop #$11
$1f:8a9c  00 23         brk #$23
$1f:8a9e  24 02         bit $02
$1f:8aa0  33 a9         and ($a9,s),y
$1f:8aa2  c0 af         cpy #$af
$1f:8aa4  1c 26 03      trb $0326
$1f:8aa7  02 91         cop #$91
$1f:8aa9  6b            rtl
$1f:8aaa  02 01         cop #$01
$1f:8aac  d5 8a         cmp $8a,x
$1f:8aae  02 07         cop #$07
$1f:8ab0  06 84         asl $84
$1f:8ab2  cd 8a a9      cmp $a98a
$1f:8ab5  80 ef         bra $8aa6
$1f:8ab7  0c 26 03      tsb $0326
$1f:8aba  a9 20         lda #$20
$1f:8abc  00 8d         brk #$8d
$1f:8abe  b4 03         ldy $03,x
$1f:8ac0  02 09         cop #$09
$1f:8ac2  03 89         ora $89,s
$1f:8ac4  02 10         cop #$10
$1f:8ac6  07 01         ora [$01]
$1f:8ac8  02 b0         cop #$b0
$1f:8aca  05 40         ora $40
$1f:8acc  02 6b         cop #$6b
$1f:8ace  02 01         cop #$01
$1f:8ad0  27 8b         and [$8b]
$1f:8ad2  02 86         cop #$86
$1f:8ad4  6b            rtl
$1f:8ad5  10 88         bpl $8a5f
$1f:8ad7  f1 6f         sbc ($6f),y
$1f:8ad9  70 65         bvs $8b40
$1f:8adb  6e 20 97      ror $9720
$1f:8ade  70 61         bvs $8b41
$1f:8ae0  73 73         adc ($73,s),y
$1f:8ae2  61 67         adc ($67,x)
$1f:8ae4  65 20         adc $20
$1f:8ae6  0d ae 79      ora $79ae
$1f:8ae9  6f 75 2e 20   adc $202e75
$1f:8aed  11 50         ora ($50),y
$1f:8aef  72 6f         adc ($6f)
$1f:8af1  63 65         adc $65,s
$1f:8af3  65 64         adc $64
$1f:8af5  20 72 69      jsr $6972
$1f:8af8  67 68         adc [$68]
$1f:8afa  74 20         stz $20,x
$1f:8afc  61 6c         adc ($6c,x)
$1f:8afe  6f 6e 67 20   adc $20676e
$1f:8b02  0d e1 73      ora $73e1
$1f:8b05  65 61         adc $61
$1f:8b07  62 65 64      per $ef6f
$1f:8b0a  20 e2 e1      jsr $e1e2
$1f:8b0d  0d 73 68      ora $6873
$1f:8b10  6f 72 65 20   adc $206572
$1f:8b14  72 65         adc ($65)
$1f:8b16  65 66         adc $66
$1f:8b18  2c 20 52      bit $5220
$1f:8b1b  6f 63 6b 62   adc $626b63
$1f:8b1f  69 72         adc #$72
$1f:8b21  64 2e         stz $2e
$1f:8b23  20 13 44      jsr $4413
$1f:8b26  aa            tax
$1f:8b27  10 0e         bpl $8b37
$1f:8b29  3c 02 02      bit $0202,x
$1f:8b2c  20 68 65      jsr $6568
$1f:8b2f  61 72         adc ($72,x)
$1f:8b31  73 20         adc ($20,s),y
$1f:8b33  0d 97 73      ora $7397
$1f:8b36  6d 61 6c      adc $6c61
$1f:8b39  6c 20 76      jmp ($7620)
$1f:8b3c  6f 69 63 65   adc $656369
$1f:8b40  2e 20 11      rol $1120
$1f:8b43  88            dey
$1f:8b44  f1 6f         sbc ($6f),y
$1f:8b46  70 65         bvs $8bad
$1f:8b48  6e 20 e1      ror $e120
$1f:8b4b  0d 70 61      ora $6170
$1f:8b4e  73 73         adc ($73,s),y
$1f:8b50  61 67         adc ($67,x)
$1f:8b52  65 20         adc $20
$1f:8b54  ae 79 6f      ldx $6f79
$1f:8b57  75 2c         adc $2c,x
$1f:8b59  20 0d 72      jsr $720d
$1f:8b5c  65 74         adc $74
$1f:8b5e  75 72         adc $72,x
$1f:8b60  6e 20 e2      ror $e220
$1f:8b63  6d 65 2e      adc $2e65
$1f:8b66  20 13 44      jsr $4413
$1f:8b69  aa            tax
$1f:8b6a  02 14         cop #$14
$1f:8b6c  a1 00         lda ($00,x)
$1f:8b6e  71 8b         adc ($8b),y
$1f:8b70  6b            rtl
$1f:8b71  02 30         cop #$30
$1f:8b73  a1 00         lda ($00,x)
$1f:8b75  b5 8b         lda $8b,x
$1f:8b77  1f 02 b0 9a   ora $9ab002,x
$1f:8b7b  8c 1f 00      sty $001f
$1f:8b7e  20 02 17      jsr $1702
$1f:8b81  8d 8b 02      sta $028b
$1f:8b84  15 02         ora $02,x
$1f:8b86  91 02         sta ($02),y
$1f:8b88  80 08         bra $8b92
$1f:8b8a  02 82         cop #$82
$1f:8b8c  6b            rtl
$1f:8b8d  02 07         cop #$07
$1f:8b8f  05 84         ora $84
$1f:8b91  a1 8b         lda ($8b,x)
$1f:8b93  02 09         cop #$09
$1f:8b95  05 84         ora $84
$1f:8b97  02 01         cop #$01
$1f:8b99  f7 8b         sbc [$8b],y
$1f:8b9b  00 5e         brk #$5e
$1f:8b9d  02 0a         cop #$0a
$1f:8b9f  0b            phd
$1f:8ba0  6b            rtl
$1f:8ba1  ad 88 1b      lda $1b88
$1f:8ba4  cd 8a 1b      cmp $1b8a
$1f:8ba7  f0 07         beq $8bb0
$1f:8ba9  02 01         cop #$01
$1f:8bab  60            rts
$1f:8bac  8c 02 37      sty $3702
$1f:8baf  6b            rtl
$1f:8bb0  02 01         cop #$01
$1f:8bb2  75 8c         adc $8c,x
$1f:8bb4  6b            rtl
$1f:8bb5  02 01         cop #$01
$1f:8bb7  bc 8b 02      ldy $028b,x
$1f:8bba  86 6b         stx $6b
$1f:8bbc  10 0e         bpl $8bcc
$1f:8bbe  3c 95 68      bit $6895,x
$1f:8bc1  65 61         adc $61
$1f:8bc3  72 20         adc ($20)
$1f:8bc5  97 6d         sta [$6d],y
$1f:8bc7  65 72         adc $72
$1f:8bc9  6d 61 69      adc $6961
$1f:8bcc  64 2e         stz $2e
$1f:8bce  11 49         ora ($49),y
$1f:8bd0  73 20         adc ($20,s),y
$1f:8bd2  e9 61         sbc #$61
$1f:8bd4  6e 79 6f      ror $6f79
$1f:8bd7  6e 65 20      ror $2065
$1f:8bda  fb            xce
$1f:8bdb  0d 6e 65      ora $656e
$1f:8bde  65 64         adc $64
$1f:8be0  73 20         adc ($20,s),y
$1f:8be2  e2 ed         sep #$ed
$1f:8be4  e1 0d         sbc ($0d,x)
$1f:8be6  42 75         wdm #$75
$1f:8be8  62 62 6c      per $f84d
$1f:8beb  65 20         adc $20
$1f:8bed  41 72         eor ($72,x)
$1f:8bef  6d 6f 72      adc $726f
$1f:8bf2  3f 20 13 44   and $441320,x
$1f:8bf6  aa            tax
$1f:8bf7  10 4f         bpl $8c48
$1f:8bf9  68            pla
$1f:8bfa  21 20         and ($20,x)
$1f:8bfc  88            dey
$1f:8bfd  b5 ca         lda $ca,x
$1f:8bff  68            pla
$1f:8c00  61 64         adc ($64,x)
$1f:8c02  20 97 0d      jsr $0d97
$1f:8c05  b8            clv
$1f:8c06  67 75         adc [$75]
$1f:8c08  65 73         adc $73
$1f:8c0a  74 20         stz $20,x
$1f:8c0c  bb            tyx
$1f:8c0d  97 6c         sta [$6c],y
$1f:8c0f  6f 6e 67 20   adc $20676e
$1f:8c13  0d 74 69      ora $6974
$1f:8c16  6d 65 2e      adc $2e65
$1f:8c19  20 11 88      jsr $8811
$1f:8c1c  bd fe 63      lda $63fe,x
$1f:8c1f  61 6e         adc ($6e,x)
$1f:8c21  60            rts
$1f:8c22  e5 0d         sbc $0d
$1f:8c24  62 72 65      per $f199
$1f:8c27  61 74         adc ($74,x)
$1f:8c29  68            pla
$1f:8c2a  65 20         adc $20
$1f:8c2c  75 6e         adc $6e,x
$1f:8c2e  64 65         stz $65
$1f:8c30  72 20         adc ($20)
$1f:8c32  77 61         adc [$61],y
$1f:8c34  74 65         stz $65,x
$1f:8c36  72 2c         adc ($2c)
$1f:8c38  20 0d 73      jsr $730d
$1f:8c3b  6f 20 d2 e6   adc $e6d220
$1f:8c3f  74 68         stz $68,x
$1f:8c41  69 73         adc #$73
$1f:8c43  2e 20 11      rol $1120
$1f:8c46  02 02         cop #$02
$1f:8c48  20 d4 0d      jsr $0dd4
$1f:8c4b  03 24         ora $24,s
$1f:8c4d  42 75         wdm #$75
$1f:8c4f  62 62 6c      per $f8b4
$1f:8c52  65 20         adc $20
$1f:8c54  41 72         eor ($72,x)
$1f:8c56  6d 6f 72      adc $726f
$1f:8c59  2e 20 03      rol $0320
$1f:8c5c  20 13 44      jsr $4413
$1f:8c5f  aa            tax
$1f:8c60  10 48         bpl $8caa
$1f:8c62  61 76         adc ($76,x)
$1f:8c64  65 20         adc $20
$1f:8c66  fe 62 65      inc $6562,x
$1f:8c69  65 6e         adc $6e
$1f:8c6b  20 68 75      jsr $7568
$1f:8c6e  72 74         adc ($74)
$1f:8c70  3f 20 13 44   and $441320,x
$1f:8c74  aa            tax
$1f:8c75  10 89         bpl $8c00
$1f:8c77  fe b4 68      inc $68b4,x
$1f:8c7a  75 72         adc $72,x
$1f:8c7c  74 2c         stz $2c,x
$1f:8c7e  20 0d 72      jsr $720d
$1f:8c81  65 74         adc $74
$1f:8c83  75 72         adc $72,x
$1f:8c85  6e 20 e2      ror $e220
$1f:8c88  c3 96         cmp $96,s
$1f:8c8a  88            dey
$1f:8c8b  0d f1 68      ora $68f1
$1f:8c8e  65 61         adc $61
$1f:8c90  6c 20 79      jmp ($7920)
$1f:8c93  6f 75 2e 20   adc $202e75
$1f:8c97  13 44         ora ($44,s),y
$1f:8c99  aa            tax
$1f:8c9a  02 07         cop #$07
$1f:8c9c  02 8a         cop #$8a
$1f:8c9e  c8            iny
$1f:8c9f  8c 02 91      sty $9102
$1f:8ca2  02 18         cop #$18
$1f:8ca4  21 a9         and ($a9,x)
$1f:8ca6  8c 80 01      sty $0180
$1f:8ca9  6b            rtl
$1f:8caa  a9 a0         lda #$a0
$1f:8cac  02 85         cop #$85
$1f:8cae  16 a9         asl $a9,x
$1f:8cb0  80 0b         bra $8cbd
$1f:8cb2  85 18         sta $18
$1f:8cb4  da            phx
$1f:8cb5  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$1f:8cb9  e2 20         sep #$20
$1f:8cbb  a9 fc         lda #$fc
$1f:8cbd  9f 00 80 7e   sta $7e8000,x
$1f:8cc1  c2 20         rep #$20
$1f:8cc3  fa            plx
$1f:8cc4  02 09         cop #$09
$1f:8cc6  02 8a         cop #$8a
$1f:8cc8  02 86         cop #$86
$1f:8cca  6b            rtl
$1f:8ccb  02 14         cop #$14
$1f:8ccd  a4 00         ldy $00
$1f:8ccf  d2 8c         cmp ($8c)
$1f:8cd1  6b            rtl
$1f:8cd2  02 17         cop #$17
$1f:8cd4  02 8d         cop #$8d
$1f:8cd6  02 11         cop #$11
$1f:8cd8  13 35         ora ($35,s),y
$1f:8cda  26 02         rol $02
$1f:8cdc  85 9d         sta $9d
$1f:8cde  a9 00 02      lda #$0200
$1f:8ce1  15 02         ora $02,x
$1f:8ce3  91 02         sta ($02),y
$1f:8ce5  0c 00 02      tsb $0200
$1f:8ce8  f1 8c         sbc ($8c),y
$1f:8cea  02 80         cop #$80
$1f:8cec  01 02         ora ($02,x)
$1f:8cee  82 80 f3      brl $8071
$1f:8cf1  02 9b         cop #$9b
$1f:8cf3  00 00         brk #$00
$1f:8cf5  ea            nop
$1f:8cf6  8c ea 8c      sty $8cea
$1f:8cf9  fb            xce
$1f:8cfa  8c 02 80      sty $8002
$1f:8cfd  00 02         brk #$02
$1f:8cff  82 80 e2      brl $6f82
$1f:8d02  02 0d         cop #$0d
$1f:8d04  00 35         brk #$35
$1f:8d06  26 0e         rol $0e
$1f:8d08  8d 02 01      sta $0102
$1f:8d0b  13 8d         ora ($8d,s),y
$1f:8d0d  6b            rtl
$1f:8d0e  02 01         cop #$01
$1f:8d10  44 8d 6b      mvp $6b,$8d
$1f:8d13  10 53         bpl $8d68
$1f:8d15  6f 72 72 79   adc $797272
$1f:8d19  2c 20 88      bit $8820
$1f:8d1c  b5 6f         lda $6f,x
$1f:8d1e  72 64         adc ($64)
$1f:8d20  65 72         adc $72
$1f:8d22  73 20         adc ($20,s),y
$1f:8d24  0d ad e1      ora $e1ad
$1f:8d27  51 75         eor ($75),y
$1f:8d29  65 65         adc $65
$1f:8d2b  6e 20 ca      ror $ca20
$1f:8d2e  e2 0d         sep #$0d
$1f:8d30  6c 65 74      jmp ($7465)
$1f:8d33  20 61 6e      jsr $6e61
$1f:8d36  79 6f 6e      adc $6e6f,y
$1f:8d39  65 20         adc $20
$1f:8d3b  70 61         bvs $8d9e
$1f:8d3d  73 73         adc ($73,s),y
$1f:8d3f  2e 20 13      rol $1320
$1f:8d42  44 aa 10      mvp $10,$aa
$1f:8d45  48            pha
$1f:8d46  6f 77 20 64   adc $642077
$1f:8d4a  69 64 20      adc #$2064
$1f:8d4d  fe b4 68      inc $68b4,x
$1f:8d50  65 72         adc $72
$1f:8d52  65 3f         adc $3f
$1f:8d54  20 13 44      jsr $4413
$1f:8d57  aa            tax
$1f:8d58  02 3b         cop #$3b
$1f:8d5a  a7 00         lda [$00]
$1f:8d5c  6e 8d 02      ror $028d
$1f:8d5f  17 5a         ora [$5a],y
$1f:8d61  a9 e2 20      lda #$20e2
$1f:8d64  a9 00 48      lda #$4800
$1f:8d67  c2 20         rep #$20
$1f:8d69  a9 5e b0      lda #$b05e
$1f:8d6c  48            pha
$1f:8d6d  6b            rtl
$1f:8d6e  02 85         cop #$85
$1f:8d70  9d a9 00      sta $00a9,x
$1f:8d73  02 17         cop #$17
$1f:8d75  81 8d         sta ($8d,x)
$1f:8d77  02 15         cop #$15
$1f:8d79  02 91         cop #$91
$1f:8d7b  02 80         cop #$80
$1f:8d7d  06 02         asl $02
$1f:8d7f  82 6b 02      brl $8fed
$1f:8d82  07 03         ora [$03]
$1f:8d84  85 96         sta $96
$1f:8d86  8d 02 18      sta $1802
$1f:8d89  21 91         and ($91,x)
$1f:8d8b  8d 02 01      sta $0102
$1f:8d8e  9b            txy
$1f:8d8f  8d 6b 02      sta $026b
$1f:8d92  01 f9         ora ($f9,x)
$1f:8d94  8d 6b 02      sta $026b
$1f:8d97  01 14         ora ($14,x)
$1f:8d99  8e 6b 10      stx $106b
$1f:8d9c  91 74         sta ($74),y
$1f:8d9e  65 61         adc $61
$1f:8da0  72 64         adc ($64)
$1f:8da2  72 6f         adc ($6f)
$1f:8da4  70 73         bvs $8e19
$1f:8da6  20 ad 97      jsr $97ad
$1f:8da9  0d 6d 65      ora $656d
$1f:8dac  72 6d         adc ($6d)
$1f:8dae  61 69         adc ($69,x)
$1f:8db0  64 20         stz $20
$1f:8db2  b5 e1         lda $e1,x
$1f:8db4  70 6f         bvs $8e25
$1f:8db6  77 65         adc [$65],y
$1f:8db8  72 0d         adc ($0d)
$1f:8dba  e2 74         sep #$74
$1f:8dbc  75 72         adc $72,x
$1f:8dbe  6e 20 4d      ror $4d20
$1f:8dc1  61 67         adc ($67,x)
$1f:8dc3  6d 61 20      adc $2061
$1f:8dc6  e2 0d         sep #$0d
$1f:8dc8  73 74         adc ($74,s),y
$1f:8dca  6f 6e 65 2e   adc $2e656e
$1f:8dce  20 11 55      jsr $5511
$1f:8dd1  73 65         adc ($65,s),y
$1f:8dd3  20 74 68      jsr $6874
$1f:8dd6  65 6d         adc $6d
$1f:8dd8  20 61 74      jsr $7461
$1f:8ddb  20 e1 74      jsr $74e1
$1f:8dde  6f 70 20 6f   adc $6f2070
$1f:8de2  66 0d         ror $0d
$1f:8de4  e1 76         sbc ($76,x)
$1f:8de6  6f 6c 63 61   adc $61636c
$1f:8dea  6e 69 63      ror $6369
$1f:8ded  20 69 73      jsr $7369
$1f:8df0  6c 61 6e      jmp ($6e61)
$1f:8df3  64 2e         stz $2e
$1f:8df5  20 13 44      jsr $4413
$1f:8df8  aa            tax
$1f:8df9  10 4f         bpl $8e4a
$1f:8dfb  70 65         bvs $8e62
$1f:8dfd  6e 20 e1      ror $e120
$1f:8e00  74 72         stz $72,x
$1f:8e02  65 61         adc $61
$1f:8e04  73 75         adc ($75,s),y
$1f:8e06  72 65         adc ($65)
$1f:8e08  20 0d 63      jsr $630d
$1f:8e0b  68            pla
$1f:8e0c  65 73         adc $73
$1f:8e0e  74 2e         stz $2e,x
$1f:8e10  20 13 44      jsr $4413
$1f:8e13  aa            tax
$1f:8e14  10 54         bpl $8e6a
$1f:8e16  68            pla
$1f:8e17  65 73         adc $73
$1f:8e19  65 20         adc $20
$1f:8e1b  74 65         stz $65,x
$1f:8e1d  61 72         adc ($72,x)
$1f:8e1f  64 72         stz $72
$1f:8e21  6f 70 73 20   adc $207370
$1f:8e25  fd 0d 6c      sbc $6c0d,x
$1f:8e28  65 66         adc $66
$1f:8e2a  74 20         stz $20,x
$1f:8e2c  62 79 20      per $aea8
$1f:8e2f  97 6d         sta [$6d],y
$1f:8e31  65 72         adc $72
$1f:8e33  6d 61 69      adc $6961
$1f:8e36  64 20         stz $20
$1f:8e38  77 68         adc [$68],y
$1f:8e3a  65 6e         adc $6e
$1f:8e3c  0d 65 76      ora $7665
$1f:8e3f  69 6c         adc #$6c
$1f:8e41  20 69 6e      jsr $6e69
$1f:8e44  76 61         ror $61,x
$1f:8e46  64 65         stz $65
$1f:8e48  64 20         stz $20
$1f:8e4a  e4 0d         cpx $0d
$1f:8e4c  70 6c         bvs $8eba
$1f:8e4e  61 63         adc ($63,x)
$1f:8e50  65 2e         adc $2e
$1f:8e52  20 11 49      jsr $4911
$1f:8e55  63 79         adc $79,s
$1f:8e57  20 74 65      jsr $6574
$1f:8e5a  61 72         adc ($72,x)
$1f:8e5c  64 72         stz $72
$1f:8e5e  6f 70 73 2c   adc $2c7370
$1f:8e62  20 66 69      jsr $6966
$1f:8e65  6c 6c 65      jmp ($656c)
$1f:8e68  64 20         stz $20
$1f:8e6a  0d f2 73      ora $73f2
$1f:8e6d  6f 72 72 6f   adc $6f7272
$1f:8e71  77 2c         adc [$2c],y
$1f:8e73  20 f1 74      jsr $74f1
$1f:8e76  75 72         adc $72,x
$1f:8e78  6e 0d 65      ror $650d
$1f:8e7b  76 65         ror $65,x
$1f:8e7d  6e 20 e1      ror $e120
$1f:8e80  68            pla
$1f:8e81  6f 74 74 65   adc $657474
$1f:8e85  73 74         adc ($74,s),y
$1f:8e87  20 4d 61      jsr $614d
$1f:8e8a  67 6d         adc [$6d]
$1f:8e8c  61 0d         adc ($0d,x)
$1f:8e8e  e2 73         sep #$73
$1f:8e90  74 6f         stz $6f,x
$1f:8e92  6e 65 2e      ror $2e65
$1f:8e95  20 13 44      jsr $4413
$1f:8e98  aa            tax
$1f:8e99  02 14         cop #$14
$1f:8e9b  ab            plb
$1f:8e9c  00 a0         brk #$a0
$1f:8e9e  8e 6b 02      stx $026b
$1f:8ea1  30 ab         bmi $8e4e
$1f:8ea3  00 e9         brk #$e9
$1f:8ea5  8e 1f 02      stx $021f
$1f:8ea8  17 c5         ora [$c5],y
$1f:8eaa  8e 02 91      stx $9102
$1f:8ead  02 0d         cop #$0d
$1f:8eaf  00 1c         brk #$1c
$1f:8eb1  22 b5 8e 6b   jsl $6b8eb5
$1f:8eb5  02 11         cop #$11
$1f:8eb7  00 1c         brk #$1c
$1f:8eb9  24 02         bit $02
$1f:8ebb  33 a9         and ($a9,s),y
$1f:8ebd  c0 af         cpy #$af
$1f:8ebf  1c 26 03      trb $0326
$1f:8ec2  02 91         cop #$91
$1f:8ec4  6b            rtl
$1f:8ec5  02 01         cop #$01
$1f:8ec7  f0 8e         beq $8e57
$1f:8ec9  02 07         cop #$07
$1f:8ecb  00 85         brk #$85
$1f:8ecd  e8            inx
$1f:8ece  8e a9 80      stx $80a9
$1f:8ed1  ef 0c 26 03   sbc $03260c
$1f:8ed5  a9 20         lda #$20
$1f:8ed7  00 8d         brk #$8d
$1f:8ed9  b4 03         ldy $03,x
$1f:8edb  02 09         cop #$09
$1f:8edd  03 89         ora $89,s
$1f:8edf  02 10         cop #$10
$1f:8ee1  07 01         ora [$01]
$1f:8ee3  02 40         cop #$40
$1f:8ee5  02 b0         cop #$b0
$1f:8ee7  02 6b         cop #$6b
$1f:8ee9  02 01         cop #$01
$1f:8eeb  27 8b         and [$8b]
$1f:8eed  02 86         cop #$86
$1f:8eef  6b            rtl
$1f:8ef0  10 88         bpl $8e7a
$1f:8ef2  f1 6f         sbc ($6f),y
$1f:8ef4  70 65         bvs $8f5b
$1f:8ef6  6e 20 e1      ror $e120
$1f:8ef9  0d 70 61      ora $6170
$1f:8efc  73 73         adc ($73,s),y
$1f:8efe  61 67         adc ($67,x)
$1f:8f00  65 20         adc $20
$1f:8f02  ae 79 6f      ldx $6f79
$1f:8f05  75 2e         adc $2e,x
$1f:8f07  20 11 57      jsr $5711
$1f:8f0a  61 6c         adc ($6c,x)
$1f:8f0c  6b            rtl
$1f:8f0d  20 64 6f      jsr $6f64
$1f:8f10  77 6e         adc [$6e],y
$1f:8f12  77 61         adc [$61],y
$1f:8f14  72 64         adc ($64)
$1f:8f16  20 75 6e      jsr $6e75
$1f:8f19  64 65         stz $65
$1f:8f1b  72 20         adc ($20)
$1f:8f1d  0d e1 73      ora $73e1
$1f:8f20  65 61         adc $61
$1f:8f22  20 96 b3      jsr $b396
$1f:8f25  e2 e1         sep #$e1
$1f:8f27  0d 76 6f      ora $6f76
$1f:8f2a  6c 63 61      jmp ($6163)
$1f:8f2d  6e 69 63      ror $6369
$1f:8f30  20 69 73      jsr $7369
$1f:8f33  6c 61 6e      jmp ($6e61)
$1f:8f36  64 2c         stz $2c
$1f:8f38  20 0d 44      jsr $440d
$1f:8f3b  75 72         adc $72,x
$1f:8f3d  65 61         adc $61
$1f:8f3f  6e 2e 20      ror $202e
$1f:8f42  13 44         ora ($44,s),y
$1f:8f44  aa            tax
$1f:8f45  02 14         cop #$14
$1f:8f47  c1 00         cmp ($00,x)
$1f:8f49  4c 8f 6b      jmp $6b8f
$1f:8f4c  02 85         cop #$85
$1f:8f4e  9d a9 00      sta $00a9,x
$1f:8f51  02 17         cop #$17
$1f:8f53  41 90         eor ($90,x)
$1f:8f55  02 15         cop #$15
$1f:8f57  02 80         cop #$80
$1f:8f59  10 02         bpl $8f5d
$1f:8f5b  82 02 07      brl $9660
$1f:8f5e  00 00         brk #$00
$1f:8f60  57 8f         eor [$8f],y
$1f:8f62  02 0d         cop #$0d
$1f:8f64  00 03         brk #$03
$1f:8f66  31 71         and ($71),y
$1f:8f68  8f 02 80 10   sta $108002
$1f:8f6c  02 82         cop #$82
$1f:8f6e  82 f1 ff      brl $8f62
$1f:8f71  02 16         cop #$16
$1f:8f73  02 17         cop #$17
$1f:8f75  00 00         brk #$00
$1f:8f77  02 85         cop #$85
$1f:8f79  ab            plb
$1f:8f7a  8f 1f 02 81   sta $81021f
$1f:8f7e  0d 1b 02      ora $021b
$1f:8f81  83 02         sta $02,s
$1f:8f83  17 41         ora [$41],y
$1f:8f85  90 02         bcc $8f89
$1f:8f87  15 02         ora $02,x
$1f:8f89  0d 00 03      ora $0300
$1f:8f8c  19 97 8f      ora $8f97,y
$1f:8f8f  02 80         cop #$80
$1f:8f91  0f 02 82 82   ora $828202
$1f:8f95  f1 ff         sbc ($ff),y
$1f:8f97  02 16         cop #$16
$1f:8f99  02 17         cop #$17
$1f:8f9b  00 00         brk #$00
$1f:8f9d  02 85         cop #$85
$1f:8f9f  f6 8f         inc $8f,x
$1f:8fa1  1f 02 81 0c   ora $0c8102,x
$1f:8fa5  1b            tcs
$1f:8fa6  02 83         cop #$83
$1f:8fa8  82 a6 ff      brl $8f51
$1f:8fab  a9 80         lda #$80
$1f:8fad  2f 0c 26 03   and $03260c
$1f:8fb1  a9 b0         lda #$b0
$1f:8fb3  01 9d         ora ($9d,x)
$1f:8fb5  25 00         and $00
$1f:8fb7  ac 9c 03      ldy $039c
$1f:8fba  b9 16 00      lda $0016,y
$1f:8fbd  29 ff         and #$ff
$1f:8fbf  ef 99 16 00   sbc $001699
$1f:8fc3  02 91         cop #$91
$1f:8fc5  bc 3c 00      ldy $003c,x
$1f:8fc8  b9 02 00      lda $0002,y
$1f:8fcb  38            sec
$1f:8fcc  e9 20         sbc #$20
$1f:8fce  00 ac         brk #$ac
$1f:8fd0  9c 03 99      stz $9903
$1f:8fd3  02 00         cop #$00
$1f:8fd5  a9 ff         lda #$ff
$1f:8fd7  ff 99 06 00   sbc $000699,x
$1f:8fdb  de 25 00      dec $0025,x
$1f:8fde  f0 01         beq $8fe1
$1f:8fe0  6b            rtl
$1f:8fe1  ac 9c 03      ldy $039c
$1f:8fe4  b9 16 00      lda $0016,y
$1f:8fe7  09 00         ora #$00
$1f:8fe9  10 99         bpl $8f84
$1f:8feb  16 00         asl $00,x
$1f:8fed  a9 80         lda #$80
$1f:8fef  2f 1c 26 03   and $03261c
$1f:8ff3  02 86         cop #$86
$1f:8ff5  6b            rtl
$1f:8ff6  a9 80         lda #$80
$1f:8ff8  2f 0c 26 03   and $03260c
$1f:8ffc  a9 b0         lda #$b0
$1f:8ffe  01 9d         ora ($9d,x)
$1f:9000  25 00         and $00
$1f:9002  ac 9c 03      ldy $039c
$1f:9005  b9 16 00      lda $0016,y
$1f:9008  29 ff         and #$ff
$1f:900a  ef 99 16 00   sbc $001699
$1f:900e  02 91         cop #$91
$1f:9010  bc 3c 00      ldy $003c,x
$1f:9013  b9 02 00      lda $0002,y
$1f:9016  18            clc
$1f:9017  69 10         adc #$10
$1f:9019  00 ac         brk #$ac
$1f:901b  9c 03 99      stz $9903
$1f:901e  02 00         cop #$00
$1f:9020  a9 01         lda #$01
$1f:9022  00 99         brk #$99
$1f:9024  06 00         asl $00
$1f:9026  de 25 00      dec $0025,x
$1f:9029  f0 01         beq $902c
$1f:902b  6b            rtl
$1f:902c  ac 9c 03      ldy $039c
$1f:902f  b9 16 00      lda $0016,y
$1f:9032  09 00         ora #$00
$1f:9034  10 99         bpl $8fcf
$1f:9036  16 00         asl $00,x
$1f:9038  a9 80         lda #$80
$1f:903a  2f 1c 26 03   and $03261c
$1f:903e  02 86         cop #$86
$1f:9040  6b            rtl
$1f:9041  02 01         cop #$01
$1f:9043  4a            lsr a
$1f:9044  90 02         bcc $9048
$1f:9046  09 00         ora #$00
$1f:9048  80 6b         bra $90b5
$1f:904a  10 53         bpl $909f
$1f:904c  74 61         stz $61,x
$1f:904e  6e 64 20      ror $2064
$1f:9051  cd c2 6e      cmp $6ec2
$1f:9054  6f 73 65 2e   adc $2e6573
$1f:9058  20 13 44      jsr $4413
$1f:905b  aa            tax
$1f:905c  02 3b         cop #$3b
$1f:905e  b5 00         lda $00,x
$1f:9060  72 90         adc ($90)
$1f:9062  02 17         cop #$17
$1f:9064  5a            phy
$1f:9065  a9 e2         lda #$e2
$1f:9067  20 a9 00      jsr $00a9
$1f:906a  48            pha
$1f:906b  c2 20         rep #$20
$1f:906d  a9 5e b0      lda #$b05e
$1f:9070  48            pha
$1f:9071  6b            rtl
$1f:9072  02 85         cop #$85
$1f:9074  9d a9 00      sta $00a9,x
$1f:9077  02 17         cop #$17
$1f:9079  85 90         sta $90
$1f:907b  02 15         cop #$15
$1f:907d  02 91         cop #$91
$1f:907f  02 80         cop #$80
$1f:9081  02 02         cop #$02
$1f:9083  82 6b 02      brl $92f1
$1f:9086  18            clc
$1f:9087  13 8f         ora ($8f,s),y
$1f:9089  90 02         bcc $908d
$1f:908b  01 b5         ora ($b5,x)
$1f:908d  90 6b         bcc $90fa
$1f:908f  02 01         cop #$01
$1f:9091  99 90 00      sta $0090,y
$1f:9094  5e 02 0a      lsr $0a02,x
$1f:9097  13 6b         ora ($6b,s),y
$1f:9099  10 88         bpl $9023
$1f:909b  f1 b0         sbc ($b0),y
$1f:909d  fe 0d 03      inc $030d,x
$1f:90a0  24 e1         bit $e1
$1f:90a2  4d 61 67      eor $6761
$1f:90a5  69 63 20      adc #$2063
$1f:90a8  46 6c         lsr $6c
$1f:90aa  61 69         adc ($69,x)
$1f:90ac  72 2e         adc ($2e)
$1f:90ae  20 11 03      jsr $0311
$1f:90b1  20 13 b6      jsr $b613
$1f:90b4  90 10         bcc $90c6
$1f:90b6  4d 61 67      eor $6761
$1f:90b9  69 63 20      adc #$2063
$1f:90bc  46 6c         lsr $6c
$1f:90be  61 69         adc ($69,x)
$1f:90c0  72 20         adc ($20)
$1f:90c2  ba            tsx
$1f:90c3  75 73         adc $73,x
$1f:90c5  65 66         adc $66
$1f:90c7  75 6c         adc $6c,x
$1f:90c9  20 0d 61      jsr $610d
$1f:90cc  67 61         adc [$61]
$1f:90ce  69 6e 73      adc #$736e
$1f:90d1  74 20         stz $20,x
$1f:90d3  c4 e3         cpy $e3
$1f:90d5  0d 66 6c      ora $6c66
$1f:90d8  79 20 96      adc $9620,y
$1f:90db  b5 97         lda $97,x
$1f:90dd  6c 61 72      jmp ($7261)
$1f:90e0  67 65         adc [$65]
$1f:90e2  20 0d 61      jsr $610d
$1f:90e5  6d 6f 75      adc $756f
$1f:90e8  6e 74 20      ror $2074
$1f:90eb  cb            wai
$1f:90ec  68            pla
$1f:90ed  69 74 20      adc #$2074
$1f:90f0  70 6f         bvs $9161
$1f:90f2  69 6e 74      adc #$746e
$1f:90f5  73 2e         adc ($2e,s),y
$1f:90f7  20 11 95      jsr $9511
$1f:90fa  bd 77 68      lda $6877,x
$1f:90fd  69 63 68      adc #$6863
$1f:9100  20 0d c4      jsr $c40d
$1f:9103  88            dey
$1f:9104  9d 0d 72      sta $720d,x
$1f:9107  65 66         adc $66
$1f:9109  65 72         adc $72
$1f:910b  72 69         adc ($69)
$1f:910d  6e 67 20      ror $2067
$1f:9110  74 6f         stz $6f,x
$1f:9112  2c 20 72      bit $7220
$1f:9115  69 67 68      adc #$6867
$1f:9118  74 3f         stz $3f,x
$1f:911a  20 13 44      jsr $4413
$1f:911d  aa            tax
$1f:911e  02 14         cop #$14
$1f:9120  b6 00         ldx $00,y
$1f:9122  25 91         and $91
$1f:9124  6b            rtl
$1f:9125  02 30         cop #$30
$1f:9127  b6 00         ldx $00,y
$1f:9129  2e 92 1f      rol $1f92
$1f:912c  02 9f         cop #$9f
$1f:912e  08            php
$1f:912f  00 02         brk #$02
$1f:9131  07 02         ora [$02]
$1f:9133  9f 3f 91 02   sta $02913f,x
$1f:9137  15 02         ora $02,x
$1f:9139  17 15         ora [$15],y
$1f:913b  92 02         sta ($02)
$1f:913d  91 6b         sta ($6b),y
$1f:913f  02 11         cop #$11
$1f:9141  0d 00 c9      ora $c900
$1f:9144  02 11         cop #$11
$1f:9146  1a            inc a
$1f:9147  00 c9         brk #$c9
$1f:9149  a9 80 ff      lda #$ff80
$1f:914c  0c 26 03      tsb $0326
$1f:914f  02 03         cop #$03
$1f:9151  29 02 04      and #$0402
$1f:9154  02 01         cop #$01
$1f:9156  16 94         asl $94,x
$1f:9158  02 ac         cop #$ac
$1f:915a  aa            tax
$1f:915b  91 1f         sta ($1f),y
$1f:915d  00 02         brk #$02
$1f:915f  00 01         brk #$01
$1f:9161  50 00         bvc $9163
$1f:9163  02 05         cop #$05
$1f:9165  00 00         brk #$00
$1f:9167  02 03         cop #$03
$1f:9169  29 02 04      and #$0402
$1f:916c  02 01         cop #$01
$1f:916e  3b            tsc
$1f:916f  95 02         sta $02,x
$1f:9171  03 79         ora $79,s
$1f:9173  02 04         cop #$04
$1f:9175  02 ac         cop #$ac
$1f:9177  e2 91         sep #$91
$1f:9179  1f 00 02 00   ora $000200,x
$1f:917d  01 50         ora ($50,x)
$1f:917f  00 02         brk #$02
$1f:9181  05 01         ora $01
$1f:9183  00 02         brk #$02
$1f:9185  03 29         ora $29,s
$1f:9187  02 04         cop #$04
$1f:9189  02 01         cop #$01
$1f:918b  ce 95 02      dec $0295
$1f:918e  03 79         ora $79,s
$1f:9190  02 04         cop #$04
$1f:9192  a9 20 00      lda #$0020
$1f:9195  8d b4 03      sta $03b4
$1f:9198  02 10         cop #$10
$1f:919a  04 01         tsb $01
$1f:919c  01 20         ora ($20,x)
$1f:919e  01 e0         ora ($e0,x)
$1f:91a0  02 a9         cop #$a9
$1f:91a2  c0 bf         cpy #$bf
$1f:91a4  1c 26 03      trb $0326
$1f:91a7  02 91         cop #$91
$1f:91a9  6b            rtl
$1f:91aa  02 81         cop #$81
$1f:91ac  0d 04 02      ora $0204
$1f:91af  83 02         sta $02,s
$1f:91b1  9f f8 ff 02   sta $02fff8,x
$1f:91b5  96 02         stx $02,y
$1f:91b7  81 0e         sta ($0e,x)
$1f:91b9  02 02         cop #$02
$1f:91bb  83 02         sta $02,s
$1f:91bd  9f 08 00 02   sta $020008,x
$1f:91c1  97 02         sta [$02],y
$1f:91c3  81 0d         sta ($0d,x)
$1f:91c5  06 02         asl $02
$1f:91c7  83 02         sta $02,s
$1f:91c9  9f f8 ff 02   sta $02fff8,x
$1f:91cd  80 0e         bra $91dd
$1f:91cf  02 82         cop #$82
$1f:91d1  02 80         cop #$80
$1f:91d3  11 02         ora ($02),y
$1f:91d5  82 02 09      brl $9ada
$1f:91d8  00 80         brk #$80
$1f:91da  02 91         cop #$91
$1f:91dc  02 80         cop #$80
$1f:91de  11 02         ora ($02),y
$1f:91e0  82 6b 02      brl $944e
$1f:91e3  81 0d         sta ($0d,x)
$1f:91e5  04 02         tsb $02
$1f:91e7  83 02         sta $02,s
$1f:91e9  9f f8 ff 02   sta $02fff8,x
$1f:91ed  96 02         stx $02,y
$1f:91ef  81 0e         sta ($0e,x)
$1f:91f1  02 02         cop #$02
$1f:91f3  83 02         sta $02,s
$1f:91f5  9f 08 00 02   sta $020008,x
$1f:91f9  97 02         sta [$02],y
$1f:91fb  81 0d         sta ($0d,x)
$1f:91fd  05 02         ora $02
$1f:91ff  83 02         sta $02,s
$1f:9201  9f f8 ff 02   sta $02fff8,x
$1f:9205  80 11         bra $9218
$1f:9207  02 82         cop #$82
$1f:9209  02 09         cop #$09
$1f:920b  01 80         ora ($80,x)
$1f:920d  02 91         cop #$91
$1f:920f  02 80         cop #$80
$1f:9211  11 02         ora ($02),y
$1f:9213  82 6b 02      brl $9481
$1f:9216  07 02         ora [$02]
$1f:9218  9b            txy
$1f:9219  29 92 02      and #$0292
$1f:921c  01 52         ora ($52,x)
$1f:921e  92 00         sta ($00)
$1f:9220  5e 02 0a      lsr $0a02,x
$1f:9223  3c 02 09      bit $0902,x
$1f:9226  02 9b         cop #$9b
$1f:9228  6b            rtl
$1f:9229  02 01         cop #$01
$1f:922b  8c 93 6b      sty $6b93
$1f:922e  a9 ff ff      lda #$ffff
$1f:9231  8d fb 03      sta $03fb
$1f:9234  02 14         cop #$14
$1f:9236  bd 00 42      lda $4200,x
$1f:9239  92 02         sta ($02)
$1f:923b  14 92         trb $92
$1f:923d  00 42         brk #$42
$1f:923f  92 80         sta ($80)
$1f:9241  04 02         tsb $02
$1f:9243  01 90         ora ($90,x)
$1f:9245  93 02         sta ($02,s),y
$1f:9247  01 9f         ora ($9f,x)
$1f:9249  93 02         sta ($02,s),y
$1f:924b  37 9c         and [$9c],y
$1f:924d  fb            xce
$1f:924e  03 02         ora $02,s
$1f:9250  86 6b         stx $6b
$1f:9252  10 88         bpl $91dc
$1f:9254  b5 68         lda $68,x
$1f:9256  65 61         adc $61
$1f:9258  72 64         adc ($64)
$1f:925a  20 99 79      jsr $7999
$1f:925d  6f 75 0d ad   adc $ad0d75
$1f:9261  4c 75 65      jmp $6575
$1f:9264  2e 20 11      rol $1120
$1f:9267  95 98         sta $98,x
$1f:9269  e1 cc         sbc ($cc,x)
$1f:926b  fb            xce
$1f:926c  0d 73 61      ora $6173
$1f:926f  76 65         ror $65,x
$1f:9271  64 20         stz $20
$1f:9273  6d 65 2e      adc $2e65
$1f:9276  20 11 45      jsr $4511
$1f:9279  76 65         ror $65,x
$1f:927b  72 79         adc ($79)
$1f:927d  74 68         stz $68,x
$1f:927f  69 6e 67      adc #$676e
$1f:9282  20 d9 0d      jsr $0dd9
$1f:9285  f4 88 73      pea $7388
$1f:9288  61 77         adc ($77,x)
$1f:928a  20 e1 6a      jsr $6ae1
$1f:928d  65 77         adc $77
$1f:928f  65 6c         adc $6c
$1f:9291  20 0d e3      jsr $e30d
$1f:9294  4c 75 65      jmp $6575
$1f:9297  20 68 61      jsr $6168
$1f:929a  64 2e         stz $2e
$1f:929c  20 11 4f      jsr $4f11
$1f:929f  6e 65 20      ror $2065
$1f:92a2  67 6c         adc [$6c]
$1f:92a4  61 6e         adc ($6e,x)
$1f:92a6  63 65         adc $65,s
$1f:92a8  20 61 74      jsr $7461
$1f:92ab  20 e1 42      jsr $42e1
$1f:92ae  6c 75 65      jmp ($6575)
$1f:92b1  0d 90 63      ora $6390
$1f:92b4  61 75         adc ($75,x)
$1f:92b6  73 65         adc ($65,s),y
$1f:92b8  64 20         stz $20
$1f:92ba  64 65         stz $65
$1f:92bc  73 69         adc ($69,s),y
$1f:92be  72 65         adc ($65)
$1f:92c0  20 0d 96      jsr $960d
$1f:92c3  68            pla
$1f:92c4  61 74         adc ($74,x)
$1f:92c6  72 65         adc ($65)
$1f:92c8  64 20         stz $20
$1f:92ca  e2 0d         sep #$0d
$1f:92cc  6f 76 65 72   adc $726576
$1f:92d0  77 68         adc [$68],y
$1f:92d2  65 6c         adc $6c
$1f:92d4  6d 20 6d      adc $6d20
$1f:92d7  65 2e         adc $2e
$1f:92d9  20 11 52      jsr $5211
$1f:92dc  69 67 68      adc #$6867
$1f:92df  74 20         stz $20,x
$1f:92e1  9e e3 e1      stz $e1e3,x
$1f:92e4  0d aa 64      ora $64aa
$1f:92e7  69 73 61      adc #$6173
$1f:92ea  70 70         bvs $935c
$1f:92ec  65 61         adc $61
$1f:92ee  72 65         adc ($65)
$1f:92f0  64 20         stz $20
$1f:92f2  0d 96 e1      ora $e196
$1f:92f5  c4 74         cpy $74
$1f:92f7  6f 6f 6b 20   adc $206b6f
$1f:92fb  0d 6f 76      ora $766f
$1f:92fe  65 72         adc $72
$1f:9300  2e 20 11      rol $1120
$1f:9303  4d 61 79      eor $7961
$1f:9306  62 65 20      per $b36e
$1f:9309  a3 77         lda $77,s
$1f:930b  65 20         adc $20
$1f:930d  6c 65 74      jmp ($7465)
$1f:9310  20 0d 62      jsr $620d
$1f:9313  61 64         adc ($64,x)
$1f:9315  20 66 65      jsr $6566
$1f:9318  65 6c         adc $6c
$1f:931a  69 6e 67      adc #$676e
$1f:931d  20 64 6f      jsr $6f64
$1f:9320  6d 69 6e      adc $6e69
$1f:9323  61 74         adc ($74,x)
$1f:9325  65 20         adc $20
$1f:9327  0d 75 73      ora $7375
$1f:932a  20 77 65      jsr $6577
$1f:932d  20 63 72      jsr $7263
$1f:9330  65 61         adc $61
$1f:9332  74 65         stz $65,x
$1f:9334  64 20         stz $20
$1f:9336  e1 0d         sbc ($0d,x)
$1f:9338  c4 6f         cpy $6f
$1f:933a  75 72         adc $72,x
$1f:933c  73 65         adc ($65,s),y
$1f:933e  6c 76 65      jmp ($6576)
$1f:9341  73 2e         adc ($2e,s),y
$1f:9343  20 11 88      jsr $8811
$1f:9346  f1 b0         sbc ($b0),y
$1f:9348  fe 03 24      inc $2403,x
$1f:934b  e1 0d         sbc ($0d,x)
$1f:934d  42 6c         wdm #$6c
$1f:934f  75 65         adc $65,x
$1f:9351  20 53 74      jsr $7453
$1f:9354  6f 6e 65 2e   adc $2e656e
$1f:9358  20 11 03      jsr $0311
$1f:935b  20 8f 74      jsr $748f
$1f:935e  72 61         adc ($61)
$1f:9360  76 65         ror $65,x
$1f:9362  6c 20 e2      jmp ($e220)
$1f:9365  6f 74 68 65   adc $656874
$1f:9369  72 0d         adc ($0d)
$1f:936b  72 65         adc ($65)
$1f:936d  67 69         adc [$69]
$1f:936f  6f 6e 73 20   adc $20736e
$1f:9373  96 72         stx $72,y
$1f:9375  65 6c         adc $6c
$1f:9377  65 61         adc $61
$1f:9379  73 65         adc ($65,s),y
$1f:937b  20 0d 9a      jsr $9a0d
$1f:937e  63 72         adc $72,s
$1f:9380  65 61         adc $61
$1f:9382  74 75         stz $75,x
$1f:9384  72 65         adc ($65)
$1f:9386  73 2e         adc ($2e,s),y
$1f:9388  20 13 44      jsr $4413
$1f:938b  aa            tax
$1f:938c  10 13         bpl $93a1
$1f:938e  5c 93 10 0e   jml $0e1093
$1f:9392  1e 51 75      asl $7551,x
$1f:9395  65 65         adc $65
$1f:9397  6e 21 20      ror $2021
$1f:939a  0e 3c 13      asl $133c
$1f:939d  45 aa         eor $aa
$1f:939f  10 0e         bpl $93af
$1f:93a1  3c 81 62      bit $6281,x
$1f:93a4  65 61         adc $61
$1f:93a6  75 74         adc $74,x
$1f:93a8  69 66 75      adc #$7566
$1f:93ab  6c 20 f0      jmp ($f020)
$1f:93ae  63 61         adc $61,s
$1f:93b0  6d 65 0d      adc $0d65
$1f:93b3  ad 69 6e      lda $6e69
$1f:93b6  73 69         adc ($69,s),y
$1f:93b8  64 65         stz $65
$1f:93ba  20 e1 0d      jsr $0de1
$1f:93bd  70 61         bvs $9420
$1f:93bf  6c 61 63      jmp ($6361)
$1f:93c2  65 2e         adc $2e
$1f:93c4  20 11 88      jsr $8811
$1f:93c7  9d e1 4d      sta $4de1,x
$1f:93ca  65 72         adc $72
$1f:93cc  6d 61 69      adc $6961
$1f:93cf  64 20         stz $20
$1f:93d1  0d 51 75      ora $7551
$1f:93d4  65 65         adc $65
$1f:93d6  6e 2e 20      ror $202e
$1f:93d9  11 88         ora ($88),y
$1f:93db  bd ca fb      lda $fbca,x
$1f:93de  fe 0d 61      inc $610d,x
$1f:93e1  72 65         adc ($65)
$1f:93e3  2c 20 a2      bit $a220
$1f:93e6  74 68         stz $68,x
$1f:93e8  61 6e         adc ($6e,x)
$1f:93ea  6b            rtl
$1f:93eb  20 fe 66      jsr $66fe
$1f:93ee  6f 72 0d 72   adc $720d72
$1f:93f2  65 6c         adc $6c
$1f:93f4  65 61         adc $61
$1f:93f6  73 69         adc ($69,s),y
$1f:93f8  6e 67 20      ror $2067
$1f:93fb  6d 65 2e      adc $2e65
$1f:93fe  20 11 8f      jsr $8f11
$1f:9401  72 65         adc ($65)
$1f:9403  74 75         stz $75,x
$1f:9405  72 6e         adc ($6e)
$1f:9407  20 e2 e1      jsr $e1e2
$1f:940a  0d 70 61      ora $6170
$1f:940d  6c 61 63      jmp ($6361)
$1f:9410  65 2e         adc $2e
$1f:9412  20 13 44      jsr $4413
$1f:9415  aa            tax
$1f:9416  10 0f         bpl $9427
$1f:9418  02 02         cop #$02
$1f:941a  2c 20 0d      bit $0d20
$1f:941d  74 68         stz $68,x
$1f:941f  61 6e         adc ($6e,x)
$1f:9421  6b            rtl
$1f:9422  20 fe ee      jsr $eefe
$1f:9425  6d 75 63      adc $6375
$1f:9428  68            pla
$1f:9429  21 20         and ($20,x)
$1f:942b  0d 0e 3c      ora $3c0e
$1f:942e  50 65         bvc $9495
$1f:9430  61 63         adc ($63,x)
$1f:9432  65 20         adc $20
$1f:9434  b6 72         ldx $72,y
$1f:9436  65 74         adc $74
$1f:9438  75 72         adc $72,x
$1f:943a  6e 65 64      ror $6465
$1f:943d  20 0d 68      jsr $680d
$1f:9440  65 72         adc $72
$1f:9442  65 2c         adc $2c
$1f:9444  20 e2 53      jsr $53e2
$1f:9447  74 2e         stz $2e,x
$1f:9449  45 6c         eor $6c
$1f:944b  6c 65 73      jmp ($7365)
$1f:944e  2e 20 0d      rol $0d20
$1f:9451  0e 5a 91      asl $915a
$1f:9454  64 6f         stz $6f
$1f:9456  6c 70 68      jmp ($6870)
$1f:9459  69 6e 2c      adc #$2c6e
$1f:945c  20 4c 75      jsr $754c
$1f:945f  65 2c         adc $2c
$1f:9461  20 75 73      jsr $7375
$1f:9464  65 64         adc $64
$1f:9466  0d e2 c0      ora $c0e2
$1f:9469  f2 44         sbc ($44)
$1f:946b  72 2e         adc ($2e)
$1f:946d  4c 65 6f      jmp $6f65
$1f:9470  2e 20 0d      rol $0d20
$1f:9473  0e 5a 49      asl $495a
$1f:9476  74 60         stz $60,x
$1f:9478  d7 73         cmp [$73],y
$1f:947a  74 72         stz $72,x
$1f:947c  61 6e         adc ($6e,x)
$1f:947e  67 65         adc [$65]
$1f:9480  2c 20 77      bit $7720
$1f:9483  68            pla
$1f:9484  65 6e         adc $6e
$1f:9486  65 76         adc $76
$1f:9488  65 72         adc $72
$1f:948a  0d 68 65      ora $6568
$1f:948d  20 74 65      jsr $6574
$1f:9490  6c 6c 73      jmp ($736c)
$1f:9493  20 c3 99      jsr $99c3
$1f:9496  44 72 2e      mvp $2e,$72
$1f:9499  20 0d 8b      jsr $8b0d
$1f:949c  96 68         stx $68,y
$1f:949e  69 73 20      adc #$2073
$1f:94a1  64 61         stz $61
$1f:94a3  75 67         adc $67,x
$1f:94a5  68            pla
$1f:94a6  74 65         stz $65,x
$1f:94a8  72 20         adc ($20)
$1f:94aa  0d 4c 69      ora $694c
$1f:94ad  73 61         adc ($61,s),y
$1f:94af  2e 20 0d      rol $0d20
$1f:94b2  0e 2d 88      asl $882d
$1f:94b5  6d 69 73      adc $7369
$1f:94b8  73 20         adc ($20,s),y
$1f:94ba  74 68         stz $68,x
$1f:94bc  65 6d         adc $6d
$1f:94be  20 96 0d      jsr $0d96
$1f:94c1  73 6f         adc ($6f,s),y
$1f:94c3  6d 65 74      adc $7465
$1f:94c6  69 6d 65      adc #$656d
$1f:94c9  73 20         adc ($20,s),y
$1f:94cb  66 69         ror $69
$1f:94cd  6e 64 20      ror $2064
$1f:94d0  6d 79 73      adc $7379
$1f:94d3  65 6c         adc $6c
$1f:94d5  66 20         ror $20
$1f:94d7  0d 63 72      ora $7263
$1f:94da  79 69 6e      adc $6e69,y
$1f:94dd  67 2e         adc [$2e]
$1f:94df  20 0d 0e      jsr $0e0d
$1f:94e2  5a            phy
$1f:94e3  4e 6f 77      lsr $776f
$1f:94e6  20 44 72      jsr $7244
$1f:94e9  2e 8b ba      rol $ba8b
$1f:94ec  67 6f         adc [$6f]
$1f:94ee  6e 65 2c      ror $2c65
$1f:94f1  20 0d 0e      jsr $0e0d
$1f:94f4  1e 4c 69      asl $694c,x
$1f:94f7  73 61         adc ($61,s),y
$1f:94f9  20 6d 75      jsr $756d
$1f:94fc  73 74         adc ($74,s),y
$1f:94fe  20 a1 ee      jsr $eea1
$1f:9501  0d 6c 6f      ora $6f6c
$1f:9504  6e 65 6c      ror $6c65
$1f:9507  79 2e 20      adc $202e,y
$1f:950a  0d 0e 5a      ora $5a0e
$1f:950d  4f 68 2c 20   eor $202c68
$1f:9511  b9 63 6f      lda $6f63,y
$1f:9514  6d 65 73      adc $7365
$1f:9517  20 4c 75      jsr $754c
$1f:951a  65 2e         adc $2e
$1f:951c  20 48 65      jsr $6548
$1f:951f  0d 6d 75      ora $756d
$1f:9522  73 74         adc ($74,s),y
$1f:9524  20 b5 68      jsr $68b5
$1f:9527  65 61         adc $61
$1f:9529  72 64         adc ($64)
$1f:952b  20 ff 0d      jsr $0dff
$1f:952e  76 6f         ror $6f,x
$1f:9530  69 63 65      adc #$6563
$1f:9533  2e 20 0d      rol $0d20
$1f:9536  0e 78 13      asl $1378
$1f:9539  45 aa         eor $aa
$1f:953b  10 0f         bpl $954c
$1f:953d  50 68         bvc $95a7
$1f:953f  65 77         adc $77
$1f:9541  21 20         and ($20,x)
$1f:9543  0d 0e 5a      ora $5a0e
$1f:9546  02 02         cop #$02
$1f:9548  2c 20 0d      bit $0d20
$1f:954b  77 68         adc [$68],y
$1f:954d  79 20 64      adc $6420,y
$1f:9550  69 64 20      adc #$2064
$1f:9553  fe ca 76      inc $76ca,x
$1f:9556  69 73 69      adc #$6973
$1f:9559  74 20         stz $20,x
$1f:955b  0d 6d 65      ora $656d
$1f:955e  3f 20 0d 0e   and $0e0d20,x
$1f:9562  5a            phy
$1f:9563  88            dey
$1f:9564  64 65         stz $65
$1f:9566  63 69         adc $69,s
$1f:9568  64 65         stz $65
$1f:956a  64 20         stz $20
$1f:956c  e2 72         sep #$72
$1f:956e  65 74         adc $74
$1f:9570  75 72         adc $72,x
$1f:9572  6e 20 74      ror $7420
$1f:9575  6f 0d c2 68   adc $68c20d
$1f:9579  6f 6d 65 20   adc $20656d
$1f:957d  74 6f         stz $6f,x
$1f:957f  77 6e         adc [$6e],y
$1f:9581  20 61 6c      jsr $6c61
$1f:9584  6f 6e 67 20   adc $20676e
$1f:9588  0d f2 c2      ora $c2f2
$1f:958b  66 72         ror $72
$1f:958d  69 65         adc #$65
$1f:958f  6e 64 73      ror $7364
$1f:9592  2e 20 0d      rol $0d20
$1f:9595  0e 5a 54      asl $545a
$1f:9598  6f 20 e7 fe   adc $fee720
$1f:959c  e1 74         sbc ($74,x)
$1f:959e  72 75         adc ($75)
$1f:95a0  74 68         stz $68,x
$1f:95a2  2c 0d 0e      bit $0e0d
$1f:95a5  28            plp
$1f:95a6  88            dey
$1f:95a7  9d e2 a1      sta $a1e2,x
$1f:95aa  6d 61 72      adc $7261
$1f:95ad  72 69         adc ($69)
$1f:95af  65 64         adc $64
$1f:95b1  2e 20 0d      rol $0d20
$1f:95b4  0e 50 48      asl $4850
$1f:95b7  65 79         adc $79
$1f:95b9  20 4c 61      jsr $614c
$1f:95bc  6c 61 2c      jmp ($2c61)
$1f:95bf  20 a6 bb      jsr $bba6
$1f:95c2  0d 68 65      ora $6568
$1f:95c5  72 65         adc ($65)
$1f:95c7  21 20         and ($20,x)
$1f:95c9  0e 78 13      asl $1378
$1f:95cc  45 aa         eor $aa
$1f:95ce  10 0f         bpl $95df
$1f:95d0  44 6f 6e      mvp $6e,$6f
$1f:95d3  60            rts
$1f:95d4  e5 fe         sbc $fe
$1f:95d6  e8            inx
$1f:95d7  73 68         adc ($68,s),y
$1f:95d9  65 20         adc $20
$1f:95db  69 73         adc #$73
$1f:95dd  0d 62 65      ora $6562
$1f:95e0  61 75         adc ($75,x)
$1f:95e2  74 69         stz $69,x
$1f:95e4  66 75         ror $75
$1f:95e6  6c 2e 20      jmp ($202e)
$1f:95e9  0d 0e 5a      ora $5a0e
$1f:95ec  57 65         eor [$65],y
$1f:95ee  20 f1 a1      jsr $a1f1
$1f:95f1  68            pla
$1f:95f2  61 70         adc ($70,x)
$1f:95f4  70 79         bvs $966f
$1f:95f6  20 0d 74      jsr $740d
$1f:95f9  6f 67 65 74   adc $746567
$1f:95fd  68            pla
$1f:95fe  65 72         adc $72
$1f:9600  2e 20 0d      rol $0d20
$1f:9603  0e 5a 02      asl $025a
$1f:9606  02 2c         cop #$2c
$1f:9608  20 0d 88      jsr $880d
$1f:960b  77 69         adc [$69],y
$1f:960d  73 68         adc ($68,s),y
$1f:960f  20 fe 6c      jsr $6cfe
$1f:9612  75 63         adc $63,x
$1f:9614  6b            rtl
$1f:9615  2e 20 0e      rol $0e20
$1f:9618  78            sei
$1f:9619  13 45         ora ($45,s),y
$1f:961b  aa            tax
$1f:961c  02 14         cop #$14
$1f:961e  b9 00 23      lda $2300,y
$1f:9621  96 6b         stx $6b,y
$1f:9623  02 30         cop #$30
$1f:9625  b9 00 6c      lda $6c00,y
$1f:9628  96 1f         stx $1f,y
$1f:962a  02 17         cop #$17
$1f:962c  48            pha
$1f:962d  96 02         stx $02,y
$1f:962f  91 02         sta ($02),y
$1f:9631  0d 00 1c      ora $1c00
$1f:9634  1c 38 96      trb $9638
$1f:9637  6b            rtl
$1f:9638  02 11         cop #$11
$1f:963a  00 1c         brk #$1c
$1f:963c  1e 02 33      asl $3302,x
$1f:963f  a9 c0         lda #$c0
$1f:9641  af 1c 26 03   lda $03261c
$1f:9645  02 91         cop #$91
$1f:9647  6b            rtl
$1f:9648  02 01         cop #$01
$1f:964a  73 96         adc ($96,s),y
$1f:964c  02 07         cop #$07
$1f:964e  01 85         ora ($85,x)
$1f:9650  6b            rtl
$1f:9651  96 a9         stx $a9,y
$1f:9653  80 ef         bra $9644
$1f:9655  0c 26 03      tsb $0326
$1f:9658  a9 20         lda #$20
$1f:965a  00 8d         brk #$8d
$1f:965c  b4 03         ldy $03,x
$1f:965e  02 09         cop #$09
$1f:9660  03 89         ora $89,s
$1f:9662  02 10         cop #$10
$1f:9664  07 01         ora [$01]
$1f:9666  02 40         cop #$40
$1f:9668  01 40         ora ($40,x)
$1f:966a  00 6b         brk #$6b
$1f:966c  02 01         cop #$01
$1f:966e  27 8b         and [$8b]
$1f:9670  02 86         cop #$86
$1f:9672  6b            rtl
$1f:9673  10 88         bpl $95fd
$1f:9675  f1 6f         sbc ($6f),y
$1f:9677  70 65         bvs $96de
$1f:9679  6e 20 e1      ror $e120
$1f:967c  0d 70 61      ora $6170
$1f:967f  73 73         adc ($73,s),y
$1f:9681  61 67         adc ($67,x)
$1f:9683  65 20         adc $20
$1f:9685  ae 79 6f      ldx $6f79
$1f:9688  75 2e         adc $2e,x
$1f:968a  20 11 47      jsr $4711
$1f:968d  6f 20 7f 20   adc $207f20
$1f:9691  61 6c         adc ($6c,x)
$1f:9693  6f 6e 67 20   adc $20676e
$1f:9697  e1 0d         sbc ($0d,x)
$1f:9699  73 65         adc ($65,s),y
$1f:969b  61 62         adc ($62,x)
$1f:969d  65 64         adc $64
$1f:969f  20 96 fe      jsr $fe96
$1f:96a2  f1 0d         sbc ($0d),y
$1f:96a4  66 69         ror $69
$1f:96a6  6e 64 20      ror $2064
$1f:96a9  97 67         sta [$67],y
$1f:96ab  68            pla
$1f:96ac  6f 73 74 20   adc $207473
$1f:96b0  73 68         adc ($68,s),y
$1f:96b2  69 70         adc #$70
$1f:96b4  2e 20 13      rol $1320
$1f:96b7  44 aa 02      mvp $02,$aa
$1f:96ba  14 bd         trb $bd
$1f:96bc  00 c0         brk #$c0
$1f:96be  96 6b         stx $6b,y
$1f:96c0  02 07         cop #$07
$1f:96c2  02 9f         cop #$9f
$1f:96c4  04 97         tsb $97
$1f:96c6  02 85         cop #$85
$1f:96c8  9d a9 00      sta $00a9,x
$1f:96cb  02 17         cop #$17
$1f:96cd  07 97         ora [$97]
$1f:96cf  02 15         cop #$15
$1f:96d1  02 14         cop #$14
$1f:96d3  b6 00         ldx $00,y
$1f:96d5  df 96 02 80   cmp $800296,x
$1f:96d9  08            php
$1f:96da  02 82         cop #$82
$1f:96dc  82 f2 ff      brl $96d1
$1f:96df  02 16         cop #$16
$1f:96e1  02 9f         cop #$9f
$1f:96e3  10 00         bpl $96e5
$1f:96e5  02 81         cop #$81
$1f:96e7  0a            asl a
$1f:96e8  03 02         ora $02,s
$1f:96ea  83 02         sta $02,s
$1f:96ec  9f f0 ff 02   sta $02fff0,x
$1f:96f0  97 02         sta [$02],y
$1f:96f2  80 08         bra $96fc
$1f:96f4  02 82         cop #$82
$1f:96f6  02 15         cop #$15
$1f:96f8  02 17         cop #$17
$1f:96fa  0c 97 02      tsb $0297
$1f:96fd  91 02         sta ($02),y
$1f:96ff  80 08         bra $9709
$1f:9701  02 82         cop #$82
$1f:9703  6b            rtl
$1f:9704  02 86         cop #$86
$1f:9706  6b            rtl
$1f:9707  02 01         cop #$01
$1f:9709  11 97         ora ($97),y
$1f:970b  6b            rtl
$1f:970c  02 01         cop #$01
$1f:970e  6c 97 6b      jmp ($6b97)
$1f:9711  10 88         bpl $969b
$1f:9713  73 61         adc ($61,s),y
$1f:9715  77 20         adc [$20],y
$1f:9717  e1 51         sbc ($51,x)
$1f:9719  75 65         adc $65,x
$1f:971b  65 6e         adc $6e
$1f:971d  20 f4 0d      jsr $0df4
$1f:9720  88            dey
$1f:9721  f3 64         sbc ($64,s),y
$1f:9723  72 65         adc ($65)
$1f:9725  61 6d         adc ($6d,x)
$1f:9727  69 6e         adc #$6e
$1f:9729  67 2e         adc [$2e]
$1f:972b  20 0d 53      jsr $530d
$1f:972e  68            pla
$1f:972f  65 20         adc $20
$1f:9731  6c 6f 6f      jmp ($6f6f)
$1f:9734  6b            rtl
$1f:9735  65 64         adc $64
$1f:9737  20 ee 73      jsr $73ee
$1f:973a  61 64         adc ($64,x)
$1f:973c  2e 20 11      rol $1120
$1f:973f  49 74         eor #$74
$1f:9741  20 f3 e0      jsr $e0f3
$1f:9744  6e 65 61      ror $6165
$1f:9747  72 20         adc ($20)
$1f:9749  0d 97 73      ora $7397
$1f:974c  75 6e         adc $6e,x
$1f:974e  6b            rtl
$1f:974f  65 6e         adc $6e
$1f:9751  20 73 68      jsr $6873
$1f:9754  69 70         adc #$70
$1f:9756  2e 20 0d      rol $0d20
$1f:9759  8f 73 61 76   sta $766173
$1f:975d  65 20         adc $20
$1f:975f  e1 0d         sbc ($0d,x)
$1f:9761  51 75         eor ($75),y
$1f:9763  65 65         adc $65
$1f:9765  6e 21 21      ror $2121
$1f:9768  20 13 44      jsr $4413
$1f:976b  aa            tax
$1f:976c  10 94         bpl $9702
$1f:976e  fe ee 6d      inc $6dee,x
$1f:9771  75 63         adc $63,x
$1f:9773  68            pla
$1f:9774  21 20         and ($20,x)
$1f:9776  0d 88 a7      ora $a788
$1f:9779  68            pla
$1f:977a  61 72         adc ($72,x)
$1f:977c  64 6c         stz $6c
$1f:977e  79 20 a5      adc $a520,y
$1f:9781  0d e3 73      ora $73e3
$1f:9784  68            pla
$1f:9785  65 20         adc $20
$1f:9787  ba            tsx
$1f:9788  d5 0d         cmp $0d,x
$1f:978a  62 61 63      per $faee
$1f:978d  6b            rtl
$1f:978e  21 20         and ($20,x)
$1f:9790  13 44         ora ($44,s),y
$1f:9792  aa            tax
$1f:9793  02 3b         cop #$3b
$1f:9795  c0 00         cpy #$00
$1f:9797  a9 97         lda #$97
$1f:9799  02 17         cop #$17
$1f:979b  5a            phy
$1f:979c  a9 e2         lda #$e2
$1f:979e  20 a9 00      jsr $00a9
$1f:97a1  48            pha
$1f:97a2  c2 20         rep #$20
$1f:97a4  a9 5e b0      lda #$b05e
$1f:97a7  48            pha
$1f:97a8  6b            rtl
$1f:97a9  02 85         cop #$85
$1f:97ab  9d a9 00      sta $00a9,x
$1f:97ae  02 17         cop #$17
$1f:97b0  e2 97         sep #$97
$1f:97b2  02 91         cop #$91
$1f:97b4  02 97         cop #$97
$1f:97b6  02 81         cop #$81
$1f:97b8  0b            phd
$1f:97b9  05 02         ora $02
$1f:97bb  83 02         sta $02,s
$1f:97bd  9f 08 00 02   sta $020008,x
$1f:97c1  81 0a         sta ($0a,x)
$1f:97c3  02 02         cop #$02
$1f:97c5  83 02         sta $02,s
$1f:97c7  9f f8 ff 02   sta $02fff8,x
$1f:97cb  96 02         stx $02,y
$1f:97cd  81 0b         sta ($0b,x)
$1f:97cf  05 02         ora $02
$1f:97d1  83 02         sta $02,s
$1f:97d3  9f 08 00 02   sta $020008,x
$1f:97d7  81 09         sta ($09,x)
$1f:97d9  02 02         cop #$02
$1f:97db  83 02         sta $02,s
$1f:97dd  9f f8 ff 80   sta $80fff8,x
$1f:97e1  d2 02         cmp ($02)
$1f:97e3  01 e7         ora ($e7,x)
$1f:97e5  97 6b         sta [$6b],y
$1f:97e7  10 91         bpl $977a
$1f:97e9  63 6f         adc $6f,s
$1f:97eb  72 61         adc ($61)
$1f:97ed  6c 20 72      jmp ($7220)
$1f:97f0  65 65         adc $65
$1f:97f2  66 20         ror $20
$1f:97f4  ba            tsx
$1f:97f5  68            pla
$1f:97f6  6f 6d 65 0d   adc $0d656d
$1f:97fa  e2 e1         sep #$e1
$1f:97fc  64 6f         stz $6f
$1f:97fe  6c 70 68      jmp ($6870)
$1f:9801  69 6e         adc #$6e
$1f:9803  73 2e         adc ($2e,s),y
$1f:9805  20 11 91      jsr $9111
$1f:9808  70 65         bvs $986f
$1f:980a  61 72         adc ($72,x)
$1f:980c  6c 73 20      jmp ($2073)
$1f:980f  c8            iny
$1f:9810  bb            tyx
$1f:9811  74 68         stz $68,x
$1f:9813  65 0d         adc $0d
$1f:9815  72 65         adc ($65)
$1f:9817  65 66         adc $66
$1f:9819  20 98 74      jsr $7498
$1f:981c  68            pla
$1f:981d  65 69         adc $69
$1f:981f  72 20         adc ($20)
$1f:9821  0d 74 72      ora $7274
$1f:9824  65 61         adc $61
$1f:9826  73 75         adc ($75,s),y
$1f:9828  72 65         adc ($65)
$1f:982a  2e 20 13      rol $1320
$1f:982d  44 aa 02      mvp $02,$aa
$1f:9830  3b            tsc
$1f:9831  8e 00 45      stx $4500
$1f:9834  98            tya
$1f:9835  02 17         cop #$17
$1f:9837  5a            phy
$1f:9838  a9 e2         lda #$e2
$1f:983a  20 a9 00      jsr $00a9
$1f:983d  48            pha
$1f:983e  c2 20         rep #$20
$1f:9840  a9 5e b0      lda #$b05e
$1f:9843  48            pha
$1f:9844  6b            rtl
$1f:9845  02 85         cop #$85
$1f:9847  9d a9 00      sta $00a9,x
$1f:984a  02 17         cop #$17
$1f:984c  58            cli
$1f:984d  98            tya
$1f:984e  02 15         cop #$15
$1f:9850  02 91         cop #$91
$1f:9852  02 80         cop #$80
$1f:9854  06 02         asl $02
$1f:9856  82 6b 02      brl $9ac4
$1f:9859  18            clc
$1f:985a  18            clc
$1f:985b  5f 98 80 05   eor $058098,x
$1f:985f  02 18         cop #$18
$1f:9861  34 69         bit $69,x
$1f:9863  98            tya
$1f:9864  02 01         cop #$01
$1f:9866  c6 98         dec $98
$1f:9868  6b            rtl
$1f:9869  02 01         cop #$01
$1f:986b  73 98         adc ($98,s),y
$1f:986d  00 5e         brk #$5e
$1f:986f  02 0a         cop #$0a
$1f:9871  34 6b         bit $6b,x
$1f:9873  10 94         bpl $9809
$1f:9875  fe ee 0d      inc $0dee,x
$1f:9878  6d 75 63      adc $6375
$1f:987b  68            pla
$1f:987c  20 ae 72      jsr $72ae
$1f:987f  65 6c         adc $6c
$1f:9881  65 61         adc $61
$1f:9883  73 69         adc ($69,s),y
$1f:9885  6e 67 20      ror $2067
$1f:9888  6d 65 21      adc $2165
$1f:988b  11 88         ora ($88),y
$1f:988d  f1 b0         sbc ($b0),y
$1f:988f  fe 03 24      inc $2403,x
$1f:9892  e1 0d         sbc ($0d,x)
$1f:9894  52 65         eor ($65)
$1f:9896  64 2d         stz $2d
$1f:9898  48            pha
$1f:9899  6f 74 20 53   adc $532074
$1f:989d  74 69         stz $69,x
$1f:989f  63 6b         adc $6b,s
$1f:98a1  2e 20 0d      rol $0d20
$1f:98a4  03 20         ora $20,s
$1f:98a6  91 50         sta ($50),y
$1f:98a8  68            pla
$1f:98a9  6f 65 6e 69   adc $696e65
$1f:98ad  78            sei
$1f:98ae  20 72 65      jsr $6572
$1f:98b1  73 69         adc ($69,s),y
$1f:98b3  64 65         stz $65
$1f:98b5  73 20         adc ($20,s),y
$1f:98b7  6f 6e 0d e1   adc $e10d6e
$1f:98bb  53 74         eor ($74,s),y
$1f:98bd  69 63 6b      adc #$6b63
$1f:98c0  2e 20 11      rol $1120
$1f:98c3  13 c7         ora ($c7,s),y
$1f:98c5  98            tya
$1f:98c6  10 54         bpl $991c
$1f:98c8  61 6b         adc ($6b,x)
$1f:98ca  65 20         adc $20
$1f:98cc  e1 52         sbc ($52,x)
$1f:98ce  65 64         adc $64
$1f:98d0  2d 48 6f      and $6f48
$1f:98d3  74 20         stz $20,x
$1f:98d5  53 74         eor ($74,s),y
$1f:98d7  69 63 6b      adc #$6b63
$1f:98da  0d 96 76      ora $7696
$1f:98dd  69 73 69      adc #$6973
$1f:98e0  74 20         stz $20,x
$1f:98e2  e1 4d         sbc ($4d,x)
$1f:98e4  6f 75 6e 74   adc $746e75
$1f:98e8  61 69         adc ($69,x)
$1f:98ea  6e 0d 4b      ror $4b0d
$1f:98ed  69 6e 67      adc #$676e
$1f:98f0  2e 20 13      rol $1320
$1f:98f3  44 aa 02      mvp $02,$aa
$1f:98f6  14 8a         trb $8a
$1f:98f8  00 fc         brk #$fc
$1f:98fa  98            tya
$1f:98fb  6b            rtl
$1f:98fc  02 18         cop #$18
$1f:98fe  24 03         bit $03
$1f:9900  99 80 7c      sta $7c80,y
$1f:9903  02 0d         cop #$0d
$1f:9905  00 0a         brk #$0a
$1f:9907  27 7f         and [$7f]
$1f:9909  99 02 85      sta $8502,y
$1f:990c  9d a9 00      sta $00a9,x
$1f:990f  02 17         cop #$17
$1f:9911  a2 99         ldx #$99
$1f:9913  02 15         cop #$15
$1f:9915  02 80         cop #$80
$1f:9917  01 02         ora ($02,x)
$1f:9919  82 02 07      brl $a01e
$1f:991c  02 00         cop #$00
$1f:991e  15 99         ora $99,x
$1f:9920  02 16         cop #$16
$1f:9922  02 9f         cop #$9f
$1f:9924  f8            sed
$1f:9925  ff 02 80 05   sbc $058002,x
$1f:9929  02 82         cop #$82
$1f:992b  02 9f         cop #$9f
$1f:992d  08            php
$1f:992e  00 02         brk #$02
$1f:9930  81 04         sta ($04,x)
$1f:9932  02 02         cop #$02
$1f:9934  83 02         sta $02,s
$1f:9936  80 00         bra $9938
$1f:9938  02 82         cop #$82
$1f:993a  02 01         cop #$01
$1f:993c  0f 9a 00 4e   ora $4e009a
$1f:9940  02 85         cop #$85
$1f:9942  9d a9 00      sta $00a9,x
$1f:9945  02 81         cop #$81
$1f:9947  19 02 02      ora $0202,y
$1f:994a  83 00         sta $00,s
$1f:994c  4e 02 85      lsr $8502
$1f:994f  9d a9 00      sta $00a9,x
$1f:9952  02 80         cop #$80
$1f:9954  18            clc
$1f:9955  02 82         cop #$82
$1f:9957  02 01         cop #$01
$1f:9959  3f 9a 00 4e   and $4e009a,x
$1f:995d  02 85         cop #$85
$1f:995f  9d a9 00      sta $00a9,x
$1f:9962  02 80         cop #$80
$1f:9964  00 02         brk #$02
$1f:9966  82 02 01      brl $9a6b
$1f:9969  6f 9a a9 80   adc $80a99a
$1f:996d  2f 1c 26 03   and $03261c
$1f:9971  02 17         cop #$17
$1f:9973  d1 99         cmp ($99),y
$1f:9975  02 15         cop #$15
$1f:9977  02 91         cop #$91
$1f:9979  02 80         cop #$80
$1f:997b  00 02         brk #$02
$1f:997d  82 6b 02      brl $9beb
$1f:9980  16 02         asl $02,x
$1f:9982  17 d1         ora [$d1],y
$1f:9984  99 02 9f      sta $9f02,y
$1f:9987  f8            sed
$1f:9988  ff 02 80 05   sbc $058002,x
$1f:998c  02 82         cop #$82
$1f:998e  02 9f         cop #$9f
$1f:9990  08            php
$1f:9991  00 02         brk #$02
$1f:9993  81 04         sta ($04,x)
$1f:9995  02 02         cop #$02
$1f:9997  83 02         sta $02,s
$1f:9999  15 02         ora $02,x
$1f:999b  91 02         sta ($02),y
$1f:999d  80 00         bra $999f
$1f:999f  02 82         cop #$82
$1f:99a1  6b            rtl
$1f:99a2  02 01         cop #$01
$1f:99a4  e0 99         cpx #$99
$1f:99a6  02 1a         cop #$1a
$1f:99a8  02 cf         cop #$cf
$1f:99aa  02 b6         cop #$b6
$1f:99ac  99 af d0      sta $d0af,y
$1f:99af  03 00         ora $00,s
$1f:99b1  d0 03         bne $99b6
$1f:99b3  82 13 00      brl $99c9
$1f:99b6  02 01         cop #$01
$1f:99b8  00 9a         brk #$9a
$1f:99ba  02 17         cop #$17
$1f:99bc  00 00         brk #$00
$1f:99be  02 09         cop #$09
$1f:99c0  02 80         cop #$80
$1f:99c2  a9 80 2f      lda #$2f80
$1f:99c5  0c 26 03      tsb $0326
$1f:99c8  6b            rtl
$1f:99c9  02 01         cop #$01
$1f:99cb  a7 9a         lda [$9a]
$1f:99cd  02 27         cop #$27
$1f:99cf  7f 99 02 18   adc $180299,x
$1f:99d3  24 db         bit $db
$1f:99d5  99 02 01      sta $0102,y
$1f:99d8  ab            plb
$1f:99d9  9a            txs
$1f:99da  6b            rtl
$1f:99db  02 01         cop #$01
$1f:99dd  a7 9a         lda [$9a]
$1f:99df  6b            rtl
$1f:99e0  10 48         bpl $9a2a
$1f:99e2  61 76         adc ($76,x)
$1f:99e4  65 20         adc $20
$1f:99e6  fe 73 65      inc $6573,x
$1f:99e9  65 6e         adc $6e
$1f:99eb  20 e1 0d      jsr $0de1
$1f:99ee  51 75         eor ($75),y
$1f:99f0  65 65         adc $65
$1f:99f2  6e 20 cb      ror $cb20
$1f:99f5  e1 4d         sbc ($4d,x)
$1f:99f7  65 72         adc $72
$1f:99f9  6d 61 69      adc $6961
$1f:99fc  64 73         stz $73
$1f:99fe  3f 0c 4f 6b   and $6b4f0c,x
$1f:9a02  61 79         adc ($79,x)
$1f:9a04  2c 20 77      bit $7720
$1f:9a07  61 69         adc ($69,x)
$1f:9a09  74 2e         stz $2e,x
$1f:9a0b  20 13 44      jsr $4413
$1f:9a0e  aa            tax
$1f:9a0f  10 0a         bpl $9a1b
$1f:9a11  54 68 69      mvn $69,$68
$1f:9a14  73 40         adc ($40,s),y
$1f:9a16  69 73 40      adc #$4073
$1f:9a19  61 40         adc ($40,x)
$1f:9a1b  73 65         adc ($65,s),y
$1f:9a1d  63 72         adc $72,s
$1f:9a1f  65 74         adc $74
$1f:9a21  2c 40 74      bit $7440
$1f:9a24  68            pla
$1f:9a25  65 0d         adc $0d
$1f:9a27  51 75         eor ($75),y
$1f:9a29  65 65         adc $65
$1f:9a2b  6e 40 6c      ror $6c40
$1f:9a2e  6f 6f 6b 73   adc $736b6f
$1f:9a32  40            rti
$1f:9a33  6c 69 6b      jmp ($6b69)
$1f:9a36  65 40         adc $40
$1f:9a38  74 68         stz $68,x
$1f:9a3a  69 73 2e      adc #$2e73
$1f:9a3d  11 0c         ora ($0c),y
$1f:9a3f  0a            asl a
$1f:9a40  53 68         eor ($68,s),y
$1f:9a42  65 40         adc $40
$1f:9a44  61 6c         adc ($6c,x)
$1f:9a46  77 61         adc [$61],y
$1f:9a48  79 73 40      adc $4073,y
$1f:9a4b  73 69         adc ($69,s),y
$1f:9a4d  74 73         stz $73,x
$1f:9a4f  40            rti
$1f:9a50  6c 69 6b      jmp ($6b69)
$1f:9a53  65 0d         adc $0d
$1f:9a55  74 68         stz $68,x
$1f:9a57  69 73 2e      adc #$2e73
$1f:9a5a  0d 53 68      ora $6853
$1f:9a5d  65 40         adc $40
$1f:9a5f  6c 6f 6f      jmp ($6f6f)
$1f:9a62  6b            rtl
$1f:9a63  73 40         adc ($40,s),y
$1f:9a65  73 6f         adc ($6f,s),y
$1f:9a67  40            rti
$1f:9a68  6d 65 61      adc $6165
$1f:9a6b  6e 2e 11      ror $112e
$1f:9a6e  0c 0a 4c      tsb $4c0a
$1f:9a71  75 65         adc $65,x
$1f:9a73  2c 40 74      bit $7440
$1f:9a76  68            pla
$1f:9a77  65 40         adc $40
$1f:9a79  64 6f         stz $6f
$1f:9a7b  6c 70 68      jmp ($6870)
$1f:9a7e  69 6e 40      adc #$406e
$1f:9a81  68            pla
$1f:9a82  61 73         adc ($73,x)
$1f:9a84  0d 62 65      ora $6562
$1f:9a87  65 6e         adc $6e
$1f:9a89  40            rti
$1f:9a8a  63 61         adc $61,s
$1f:9a8c  70 74         bvs $9b02
$1f:9a8e  75 72         adc $72,x
$1f:9a90  65 64         adc $64
$1f:9a92  21 0d         and ($0d,x)
$1f:9a94  50 6c         bvc $9b02
$1f:9a96  65 61         adc $61
$1f:9a98  73 65         adc ($65,s),y
$1f:9a9a  40            rti
$1f:9a9b  73 61         adc ($61,s),y
$1f:9a9d  76 65         ror $65,x
$1f:9a9f  40            rti
$1f:9aa0  68            pla
$1f:9aa1  69 6d 21      adc #$216d
$1f:9aa4  13 44         ora ($44,s),y
$1f:9aa6  aa            tax
$1f:9aa7  10 13         bpl $9abc
$1f:9aa9  6f 9a 10 4c   adc $4c109a
$1f:9aad  75 65         adc $65,x
$1f:9aaf  20 a7 6c      jsr $6ca7
$1f:9ab2  65 61         adc $61
$1f:9ab4  76 65         ror $65,x
$1f:9ab6  20 77 68      jsr $6877
$1f:9ab9  65 6e         adc $6e
$1f:9abb  65 76         adc $76
$1f:9abd  65 72         adc $72
$1f:9abf  0d 68 65      ora $6568
$1f:9ac2  20 77 69      jsr $6977
$1f:9ac5  73 68         adc ($68,s),y
$1f:9ac7  65 73         adc $73
$1f:9ac9  2c 20 a2      bit $a220
$1f:9acc  68            pla
$1f:9acd  65 20         adc $20
$1f:9acf  0d 6e 65      ora $656e
$1f:9ad2  76 65         ror $65,x
$1f:9ad4  72 20         adc ($20)
$1f:9ad6  63 6f         adc $6f,s
$1f:9ad8  6d 65 73      adc $7365
$1f:9adb  20 6f 75      jsr $756f
$1f:9ade  74 2e         stz $2e,x
$1f:9ae0  20 11 4d      jsr $4d11
$1f:9ae3  61 79         adc ($79,x)
$1f:9ae5  62 65 20      per $bb4d
$1f:9ae8  68            pla
$1f:9ae9  65 20         adc $20
$1f:9aeb  6c 69 6b      jmp ($6b69)
$1f:9aee  65 73         adc $73
$1f:9af0  20 e3 0d      jsr $0de3
$1f:9af3  70 6c         bvs $9b61
$1f:9af5  61 63         adc ($63,x)
$1f:9af7  65 2e         adc $2e
$1f:9af9  20 13 44      jsr $4413
$1f:9afc  aa            tax
$1f:9afd  02 14         cop #$14
$1f:9aff  bb            tyx
$1f:9b00  00 04         brk #$04
$1f:9b02  9b            txy
$1f:9b03  6b            rtl
$1f:9b04  02 85         cop #$85
$1f:9b06  9d a9 00      sta $00a9,x
$1f:9b09  02 15         cop #$15
$1f:9b0b  02 17         cop #$17
$1f:9b0d  17 9b         ora [$9b],y
$1f:9b0f  02 80         cop #$80
$1f:9b11  11 02         ora ($02),y
$1f:9b13  82 82 f8      brl $9398
$1f:9b16  ff 02 07 06   sbc $060702,x
$1f:9b1a  85 38         sta $38
$1f:9b1c  9b            txy
$1f:9b1d  02 19         cop #$19
$1f:9b1f  1c 33 9b      trb $9b33
$1f:9b22  02 01         cop #$01
$1f:9b24  47 9b         eor [$9b]
$1f:9b26  02 3c         cop #$3c
$1f:9b28  04 02         tsb $02
$1f:9b2a  10 07         bpl $9b33
$1f:9b2c  04 00         tsb $00
$1f:9b2e  50 00         bvc $9b30
$1f:9b30  00 02         brk #$02
$1f:9b32  6b            rtl
$1f:9b33  02 01         cop #$01
$1f:9b35  3d 9b 6b      and $6b9b,x
$1f:9b38  02 01         cop #$01
$1f:9b3a  69 9b 6b      adc #$6b9b
$1f:9b3d  10 5a         bpl $9b99
$1f:9b3f  7a            ply
$1f:9b40  7a            ply
$1f:9b41  7a            ply
$1f:9b42  7a            ply
$1f:9b43  20 13 44      jsr $4413
$1f:9b46  aa            tax
$1f:9b47  10 02         bpl $9b4b
$1f:9b49  02 20         cop #$20
$1f:9b4b  74 6f         stz $6f,x
$1f:9b4d  75 63         adc $63,x
$1f:9b4f  68            pla
$1f:9b50  65 73         adc $73
$1f:9b52  20 0d e1      jsr $e10d
$1f:9b55  64 6f         stz $6f
$1f:9b57  6c 70 68      jmp ($6870)
$1f:9b5a  69 6e 20      adc #$206e
$1f:9b5d  f2 e1         sbc ($e1)
$1f:9b5f  0d 85 52      ora $5285
$1f:9b62  6f 64 2e 20   adc $202e64
$1f:9b66  13 44         ora ($44,s),y
$1f:9b68  aa            tax
$1f:9b69  10 48         bpl $9bb3
$1f:9b6b  65 79         adc $79
$1f:9b6d  2c 20 64      bit $6420
$1f:9b70  69 64 6e      adc #$6e64
$1f:9b73  60            rts
$1f:9b74  e5 88         sbc $88
$1f:9b76  6d 65 65      adc $6565
$1f:9b79  74 20         stz $20,x
$1f:9b7b  79 6f 75      adc $756f,y
$1f:9b7e  0d bb c2      ora $c2bb
$1f:9b81  64 72         stz $72
$1f:9b83  65 61         adc $61
$1f:9b85  6d 3f 20      adc $203f
$1f:9b88  13 44         ora ($44,s),y
$1f:9b8a  aa            tax
$1f:9b8b  02 14         cop #$14
$1f:9b8d  8f 00 92 9b   sta $9b9200
$1f:9b91  6b            rtl
$1f:9b92  02 30         cop #$30
$1f:9b94  8f 00 ed 9b   sta $9bed00
$1f:9b98  1f 02 85 9d   ora $9d8502,x
$1f:9b9c  a9 00 02      lda #$0200
$1f:9b9f  17 b5         ora [$b5],y
$1f:9ba1  9b            txy
$1f:9ba2  02 96         cop #$96
$1f:9ba4  02 81         cop #$81
$1f:9ba6  0e 04 02      asl $0204
$1f:9ba9  83 02         sta $02,s
$1f:9bab  97 02         sta [$02],y
$1f:9bad  81 0e         sta ($0e,x)
$1f:9baf  04 02         tsb $02
$1f:9bb1  83 82         sta $82,s
$1f:9bb3  ed ff 02      sbc $02ff
$1f:9bb6  18            clc
$1f:9bb7  24 d1         bit $d1
$1f:9bb9  9b            txy
$1f:9bba  bd 16 00      lda $0016,x
$1f:9bbd  29 ef ff      and #$ffef
$1f:9bc0  9d 16 00      sta $0016,x
$1f:9bc3  02 01         cop #$01
$1f:9bc5  86 9d         stx $9d
$1f:9bc7  bd 16 00      lda $0016,x
$1f:9bca  09 10 00      ora #$0010
$1f:9bcd  9d 16 00      sta $0016,x
$1f:9bd0  6b            rtl
$1f:9bd1  bd 16 00      lda $0016,x
$1f:9bd4  29 ef ff      and #$ffef
$1f:9bd7  9d 16 00      sta $0016,x
$1f:9bda  02 01         cop #$01
$1f:9bdc  12 9c         ora ($9c)
$1f:9bde  bd 16 00      lda $0016,x
$1f:9be1  09 10 00      ora #$0010
$1f:9be4  9d 16 00      sta $0016,x
$1f:9be7  00 5e         brk #$5e
$1f:9be9  02 0a         cop #$0a
$1f:9beb  24 6b         bit $6b
$1f:9bed  02 14         cop #$14
$1f:9bef  8c 00 f7      sty $f700
$1f:9bf2  9b            txy
$1f:9bf3  02 01         cop #$01
$1f:9bf5  fa            plx
$1f:9bf6  9b            txy
$1f:9bf7  02 86         cop #$86
$1f:9bf9  6b            rtl
$1f:9bfa  10 0e         bpl $9c0a
$1f:9bfc  3c 48 65      bit $6548,x
$1f:9bff  79 2c 20      adc $202c,y
$1f:9c02  73 6f         adc ($6f,s),y
$1f:9c04  6d 65 62      adc $6265
$1f:9c07  6f 64 79 20   adc $207964
$1f:9c0b  b7 6d         lda [$6d],y
$1f:9c0d  65 21         adc $21
$1f:9c0f  13 44         ora ($44,s),y
$1f:9c11  aa            tax
$1f:9c12  10 4d         bpl $9c61
$1f:9c14  79 20 6e      adc $6e20,y
$1f:9c17  61 6d         adc ($6d,x)
$1f:9c19  65 20         adc $20
$1f:9c1b  ba            tsx
$1f:9c1c  4c 75 65      jmp $6575
$1f:9c1f  2e 20 0d      rol $0d20
$1f:9c22  88            dey
$1f:9c23  ec e2 c0      cpx $c0e2
$1f:9c26  f2 0d         sbc ($0d)
$1f:9c28  e1 69         sbc ($69,x)
$1f:9c2a  6e 76 65      ror $6576
$1f:9c2d  6e 74 6f      ror $6f74
$1f:9c30  72 2c         adc ($2c)
$1f:9c32  20 44 72      jsr $7244
$1f:9c35  2e 4c 65      rol $654c
$1f:9c38  6f 2e 11 91   adc $91112e
$1f:9c3c  42 6c         wdm #$6c
$1f:9c3e  75 65         adc $65,x
$1f:9c40  20 90 88      jsr $8890
$1f:9c43  0d d4 ad      ora $add4
$1f:9c46  68            pla
$1f:9c47  69 6d 20      adc #$206d
$1f:9c4a  ba            tsx
$1f:9c4b  0d 97 da      ora $da97
$1f:9c4e  6a            ror a
$1f:9c4f  65 77         adc $77
$1f:9c51  65 6c         adc $6c
$1f:9c53  2e 20 11      rol $1120
$1f:9c56  49 74 20      eor #$2074
$1f:9c59  61 74         adc ($74,x)
$1f:9c5b  74 72         stz $72,x
$1f:9c5d  61 63         adc ($63,x)
$1f:9c5f  74 73         stz $73,x
$1f:9c61  20 61 6e      jsr $6e61
$1f:9c64  79 6f 6e      adc $6e6f,y
$1f:9c67  65 20         adc $20
$1f:9c69  77 68         adc [$68],y
$1f:9c6b  6f 0d 6c 6f   adc $6f6c0d
$1f:9c6f  6f 6b 73 20   adc $20736b
$1f:9c73  61 74         adc ($74,x)
$1f:9c75  20 69 74      jsr $7469
$1f:9c78  20 96 74      jsr $7496
$1f:9c7b  68            pla
$1f:9c7c  65 6e         adc $6e
$1f:9c7e  20 0d 63      jsr $630d
$1f:9c81  68            pla
$1f:9c82  61 6e         adc ($6e,x)
$1f:9c84  67 65         adc [$65]
$1f:9c86  73 20         adc ($20,s),y
$1f:9c88  74 68         stz $68,x
$1f:9c8a  65 69         adc $69
$1f:9c8c  72 20         adc ($20)
$1f:9c8e  0d 70 65      ora $6570
$1f:9c91  72 73         adc ($73)
$1f:9c93  6f 6e 61 6c   adc $6c616e
$1f:9c97  69 74 79      adc #$7974
$1f:9c9a  2e 20 11      rol $1120
$1f:9c9d  89 e3 d1      bit #$d1e3
$1f:9ca0  b6 97         ldx $97,y
$1f:9ca2  0d b2 6d      ora $6db2
$1f:9ca5  69 6e 64      adc #$646e
$1f:9ca8  2c 20 74      bit $7420
$1f:9cab  68            pla
$1f:9cac  65 79         adc $79
$1f:9cae  20 f1 0d      jsr $0df1
$1f:9cb1  62 65 63      per $0019
$1f:9cb4  6f 6d 65 20   adc $20656d
$1f:9cb8  97 67         sta [$67],y
$1f:9cba  72 65         adc ($65)
$1f:9cbc  61 74         adc ($74,x)
$1f:9cbe  20 70 65      jsr $6570
$1f:9cc1  72 73         adc ($73)
$1f:9cc3  6f 6e 2e 11   adc $112e6e
$1f:9cc7  89 74 68      bit #$6874
$1f:9cca  65 79         adc $79
$1f:9ccc  20 b5 97      jsr $97b5
$1f:9ccf  65 76         adc $76
$1f:9cd1  69 6c 20      adc #$206c
$1f:9cd4  0d 6d 69      ora $696d
$1f:9cd7  6e 64 2c      ror $2c64
$1f:9cda  20 74 68      jsr $6874
$1f:9cdd  65 79         adc $79
$1f:9cdf  20 f1 62      jsr $62f1
$1f:9ce2  65 63         adc $63
$1f:9ce4  6f 6d 65 0d   adc $0d656d
$1f:9ce8  97 62         sta [$62],y
$1f:9cea  61 64         adc ($64,x)
$1f:9cec  20 70 65      jsr $6570
$1f:9cef  72 73         adc ($73)
$1f:9cf1  6f 6e 2e 20   adc $202e6e
$1f:9cf5  11 4f         ora ($4f),y
$1f:9cf7  6e 65 20      ror $2065
$1f:9cfa  64 61         stz $61
$1f:9cfc  79 2c 20      adc $202c,y
$1f:9cff  e1 51         sbc ($51,x)
$1f:9d01  75 65         adc $65,x
$1f:9d03  65 6e         adc $6e
$1f:9d05  20 0d af      jsr $af0d
$1f:9d08  e1 6a         sbc ($6a,x)
$1f:9d0a  65 77         adc $77
$1f:9d0c  65 6c         adc $6c
$1f:9d0e  20 96 0d      jsr $0d96
$1f:9d11  74 6f         stz $6f,x
$1f:9d13  6f 6b 20 69   adc $69206b
$1f:9d17  74 2e         stz $2e,x
$1f:9d19  20 54 68      jsr $6854
$1f:9d1c  65 6e         adc $6e
$1f:9d1e  20 73 68      jsr $6873
$1f:9d21  65 20         adc $20
$1f:9d23  0d 70 6c      ora $6c70
$1f:9d26  61 63         adc ($63,x)
$1f:9d28  65 64         adc $64
$1f:9d2a  20 c3 bb      jsr $bbc3
$1f:9d2d  70 72         bvs $9da1
$1f:9d2f  69 73 6f      adc #$6f73
$1f:9d32  6e 2e 20      ror $202e
$1f:9d35  11 8f         ora ($8f),y
$1f:9d37  73 61         adc ($61,s),y
$1f:9d39  76 65         ror $65,x
$1f:9d3b  20 e1 51      jsr $51e1
$1f:9d3e  75 65         adc $65,x
$1f:9d40  65 6e         adc $6e
$1f:9d42  20 0d 96      jsr $960d
$1f:9d45  b4 e1         ldy $e1,x
$1f:9d47  42 6c         wdm #$6c
$1f:9d49  75 65         adc $65,x
$1f:9d4b  20 53 74      jsr $7453
$1f:9d4e  6f 6e 65 0d   adc $0d656e
$1f:9d52  62 61 63      per $00b6
$1f:9d55  6b            rtl
$1f:9d56  2e 20 11      rol $1120
$1f:9d59  88            dey
$1f:9d5a  bd e4 72      lda $72e4,x
$1f:9d5d  69 6e 67      adc #$676e
$1f:9d60  20 f1 0d      jsr $0df1
$1f:9d63  b7 d2         lda [$d2],y
$1f:9d65  e6 69         inc $69
$1f:9d67  74 2e         stz $2e,x
$1f:9d69  20 11 02      jsr $0211
$1f:9d6c  02 20         cop #$20
$1f:9d6e  d4 0d         pei ($0d)
$1f:9d70  03 24         ora $24,s
$1f:9d72  e1 54         sbc ($54,x)
$1f:9d74  68            pla
$1f:9d75  75 6e         adc $6e,x
$1f:9d77  64 65         stz $65
$1f:9d79  72 20         adc ($20)
$1f:9d7b  52 69         eor ($69)
$1f:9d7d  6e 67 2e      ror $2e67
$1f:9d80  20 03 20      jsr $2003
$1f:9d83  13 44         ora ($44,s),y
$1f:9d85  aa            tax
$1f:9d86  10 88         bpl $9d10
$1f:9d88  68            pla
$1f:9d89  65 61         adc $61
$1f:9d8b  72 64         adc ($64)
$1f:9d8d  20 e3 44      jsr $44e3
$1f:9d90  72 2e         adc ($2e)
$1f:9d92  8b            phb
$1f:9d93  0d f3 74      ora $74f3
$1f:9d96  61 6b         adc ($6b,x)
$1f:9d98  65 6e         adc $6e
$1f:9d9a  20 e2 e1      jsr $e1e2
$1f:9d9d  0d 8d 43      ora $438d
$1f:9da0  61 73         adc ($73,x)
$1f:9da2  74 6c         stz $6c,x
$1f:9da4  65 2e         adc $2e
$1f:9da6  20 0d 88      jsr $880d
$1f:9da9  77 6f         adc [$6f],y
$1f:9dab  6e 64 65      ror $6564
$1f:9dae  72 20         adc ($20)
$1f:9db0  68            pla
$1f:9db1  6f 77 20 68   adc $682077
$1f:9db5  65 20         adc $20
$1f:9db7  69 73 2e      adc #$2e73
$1f:9dba  20 13 44      jsr $4413
$1f:9dbd  aa            tax
$1f:9dbe  02 14         cop #$14
$1f:9dc0  8c 00 c5      sty $c500
$1f:9dc3  9d 6b 02      sta $026b,x
$1f:9dc6  30 8c         bmi $9d54
$1f:9dc8  00 32         brk #$32
$1f:9dca  9e 1f 02      stz $021f,x
$1f:9dcd  85 9d         sta $9d
$1f:9dcf  a9 00 02      lda #$0200
$1f:9dd2  1b            tcs
$1f:9dd3  d7 9d         cmp [$9d],y
$1f:9dd5  02 00         cop #$00
$1f:9dd7  02 07         cop #$07
$1f:9dd9  00 00         brk #$00
$1f:9ddb  0d 9e a9      ora $a99e
$1f:9dde  ff ff 8d fb   sbc $fb8dff,x
$1f:9de2  03 02         ora $02,s
$1f:9de4  09 01 86      ora #$8601
$1f:9de7  02 81         cop #$81
$1f:9de9  0e 09 02      asl $0209
$1f:9dec  83 02         sta $02,s
$1f:9dee  81 0c         sta ($0c,x)
$1f:9df0  03 02         ora $02,s
$1f:9df2  83 02         sta $02,s
$1f:9df4  80 17         bra $9e0d
$1f:9df6  02 82         cop #$82
$1f:9df8  00 4a         brk #$4a
$1f:9dfa  02 80         cop #$80
$1f:9dfc  17 02         ora [$02],y
$1f:9dfe  82 00 4a      brl $e801
$1f:9e01  9c fb 03      stz $03fb
$1f:9e04  02 80         cop #$80
$1f:9e06  17 02         ora [$02],y
$1f:9e08  82 00 4a      brl $e80b
$1f:9e0b  80 f7         bra $9e04
$1f:9e0d  02 11         cop #$11
$1f:9e0f  04 12         tsb $12
$1f:9e11  0b            phd
$1f:9e12  02 97         cop #$97
$1f:9e14  02 15         cop #$15
$1f:9e16  02 17         cop #$17
$1f:9e18  22 9e 02 91   jsl $91029e
$1f:9e1c  02 80         cop #$80
$1f:9e1e  11 02         ora ($02),y
$1f:9e20  82 6b 02      brl $a08e
$1f:9e23  14 8f         trb $8f
$1f:9e25  00 2d         brk #$2d
$1f:9e27  9e 02 01      stz $0102,x
$1f:9e2a  55 9e         eor $9e,x
$1f:9e2c  6b            rtl
$1f:9e2d  02 01         cop #$01
$1f:9e2f  7d 9e 6b      adc $6b9e,x
$1f:9e32  02 09         cop #$09
$1f:9e34  00 80         brk #$80
$1f:9e36  02 01         cop #$01
$1f:9e38  3d 9e 02      and $029e,x
$1f:9e3b  86 6b         stx $6b
$1f:9e3d  10 0e         bpl $9e4d
$1f:9e3f  1e 4c 75      asl $754c,x
$1f:9e42  65 21         adc $21
$1f:9e44  20 49 60      jsr $6049
$1f:9e47  c6 63         dec $63
$1f:9e49  6f 6d 69 6e   adc $6e696d
$1f:9e4d  67 21         adc [$21]
$1f:9e4f  20 0e 28      jsr $280e
$1f:9e52  13 45         ora ($45,s),y
$1f:9e54  aa            tax
$1f:9e55  10 88         bpl $9ddf
$1f:9e57  74 72         stz $72,x
$1f:9e59  69 65 64      adc #$6465
$1f:9e5c  20 68 61      jsr $6168
$1f:9e5f  72 64         adc ($64)
$1f:9e61  20 e2 73      jsr $73e2
$1f:9e64  61 76         adc ($76,x)
$1f:9e66  65 20         adc $20
$1f:9e68  0d 4c 75      ora $754c
$1f:9e6b  65 20         adc $20
$1f:9e6d  a2 68         ldx #$68
$1f:9e6f  65 20         adc $20
$1f:9e71  ba            tsx
$1f:9e72  ca            dex
$1f:9e73  0d 68 65      ora $6568
$1f:9e76  72 65         adc ($65)
$1f:9e78  2e 20 13      rol $1320
$1f:9e7b  44 aa 10      mvp $10,$aa
$1f:9e7e  4c 75 65      jmp $6575
$1f:9e81  20 74 6f      jsr $6f74
$1f:9e84  6c 64 20      jmp ($2064)
$1f:9e87  c3 c7         cmp $c7,s
$1f:9e89  0d 74 68      ora $6874
$1f:9e8c  69 6e 67      adc #$676e
$1f:9e8f  73 20         adc ($20,s),y
$1f:9e91  99 e1 0d      sta $0de1,y
$1f:9e94  51 75         eor ($75),y
$1f:9e96  65 65         adc $65
$1f:9e98  6e 2e 20      ror $202e
$1f:9e9b  11 88         ora ($88),y
$1f:9e9d  64 6f         stz $6f
$1f:9e9f  6e 60 e5      ror $e560
$1f:9ea2  e8            inx
$1f:9ea3  73 68         adc ($68,s),y
$1f:9ea5  65 20         adc $20
$1f:9ea7  f3 0d         sbc ($0d,s),y
$1f:9ea9  97 62         sta [$62],y
$1f:9eab  61 64         adc ($64,x)
$1f:9ead  20 70 65      jsr $6570
$1f:9eb0  72 73         adc ($73)
$1f:9eb2  6f 6e 2e 20   adc $202e6e
$1f:9eb6  53 68         eor ($68,s),y
$1f:9eb8  65 20         adc $20
$1f:9eba  f3 0d         sbc ($0d,s),y
$1f:9ebc  bc 61 74      ldy $7461,x
$1f:9ebf  74 72         stz $72,x
$1f:9ec1  61 63         adc ($63,x)
$1f:9ec3  74 65         stz $65,x
$1f:9ec5  64 20         stz $20
$1f:9ec7  e2 e1         sep #$e1
$1f:9ec9  0d 6a 65      ora $656a
$1f:9ecc  77 65         adc [$65],y
$1f:9ece  6c 2e 20      jmp ($202e)
$1f:9ed1  13 44         ora ($44,s),y
$1f:9ed3  aa            tax
$1f:9ed4  02 07         cop #$07
$1f:9ed6  06 84         asl $84
$1f:9ed8  e6 9e         inc $9e
$1f:9eda  02 15         cop #$15
$1f:9edc  02 91         cop #$91
$1f:9ede  02 0d         cop #$0d
$1f:9ee0  00 5b         brk #$5b
$1f:9ee2  24 f0         bit $f0
$1f:9ee4  9e 6b 02      stz $026b,x
$1f:9ee7  80 26         bra $9f0f
$1f:9ee9  02 82         cop #$82
$1f:9eeb  02 16         cop #$16
$1f:9eed  02 91         cop #$91
$1f:9eef  6b            rtl
$1f:9ef0  a9 80         lda #$80
$1f:9ef2  ef 0c 26 03   sbc $03260c
$1f:9ef6  02 34         cop #$34
$1f:9ef8  02 1b         cop #$1b
$1f:9efa  fe 9e 78      inc $789e,x
$1f:9efd  00 00         brk #$00
$1f:9eff  9c 02 81      stz $8102
$1f:9f02  26 10         rol $10
$1f:9f04  02 83         cop #$83
$1f:9f06  02 81         cop #$81
$1f:9f08  27 08         and [$08]
$1f:9f0a  02 83         cop #$83
$1f:9f0c  02 1b         cop #$1b
$1f:9f0e  12 9f         ora ($9f)
$1f:9f10  5a            phy
$1f:9f11  00 02         brk #$02
$1f:9f13  09 06         ora #$06
$1f:9f15  84 02         sty $02
$1f:9f17  09 03         ora #$03
$1f:9f19  09 02         ora #$02
$1f:9f1b  10 06         bpl $9f23
$1f:9f1d  01 01         ora ($01,x)
$1f:9f1f  20 02 20      jsr $2002
$1f:9f22  02 6b         cop #$6b
$1f:9f24  02 07         cop #$07
$1f:9f26  07 84         ora [$84]
$1f:9f28  36 9f         rol $9f,x
$1f:9f2a  02 15         cop #$15
$1f:9f2c  02 91         cop #$91
$1f:9f2e  02 0d         cop #$0d
$1f:9f30  00 6a         brk #$6a
$1f:9f32  04 40         tsb $40
$1f:9f34  9f 6b 02 80   sta $80026b,x
$1f:9f38  26 02         rol $02
$1f:9f3a  82 02 16      brl $b53f
$1f:9f3d  02 91         cop #$91
$1f:9f3f  6b            rtl
$1f:9f40  a9 80         lda #$80
$1f:9f42  ef 0c 26 03   sbc $03260c
$1f:9f46  02 34         cop #$34
$1f:9f48  02 1b         cop #$1b
$1f:9f4a  4e 9f 78      lsr $789f
$1f:9f4d  00 00         brk #$00
$1f:9f4f  9c 02 81      stz $8102
$1f:9f52  26 10         rol $10
$1f:9f54  02 83         cop #$83
$1f:9f56  02 81         cop #$81
$1f:9f58  27 08         and [$08]
$1f:9f5a  02 83         cop #$83
$1f:9f5c  02 1b         cop #$1b
$1f:9f5e  62 9f 5a      per $fa00
$1f:9f61  00 02         brk #$02
$1f:9f63  09 07         ora #$07
$1f:9f65  84 02         sty $02
$1f:9f67  09 03         ora #$03
$1f:9f69  09 02         ora #$02
$1f:9f6b  10 06         bpl $9f73
$1f:9f6d  01 01         ora ($01,x)
$1f:9f6f  20 02 c0      jsr $c002
$1f:9f72  01 6b         ora ($6b,x)
$1f:9f74  02 07         cop #$07
$1f:9f76  00 85         brk #$85
$1f:9f78  86 9f         stx $9f
$1f:9f7a  02 15         cop #$15
$1f:9f7c  02 91         cop #$91
$1f:9f7e  02 0d         cop #$0d
$1f:9f80  00 24         brk #$24
$1f:9f82  2b            pld
$1f:9f83  90 9f         bcc $9f24
$1f:9f85  6b            rtl
$1f:9f86  02 80         cop #$80
$1f:9f88  26 02         rol $02
$1f:9f8a  82 02 16      brl $b58f
$1f:9f8d  02 91         cop #$91
$1f:9f8f  6b            rtl
$1f:9f90  a9 80         lda #$80
$1f:9f92  ef 0c 26 03   sbc $03260c
$1f:9f96  02 34         cop #$34
$1f:9f98  02 1b         cop #$1b
$1f:9f9a  9e 9f 78      stz $789f,x
$1f:9f9d  00 00         brk #$00
$1f:9f9f  9c 02 81      stz $8102
$1f:9fa2  26 10         rol $10
$1f:9fa4  02 83         cop #$83
$1f:9fa6  02 81         cop #$81
$1f:9fa8  27 08         and [$08]
$1f:9faa  02 83         cop #$83
$1f:9fac  02 1b         cop #$1b
$1f:9fae  b2 9f         lda ($9f)
$1f:9fb0  5a            phy
$1f:9fb1  00 02         brk #$02
$1f:9fb3  09 00         ora #$00
$1f:9fb5  85 02         sta $02
$1f:9fb7  09 03         ora #$03
$1f:9fb9  09 02         ora #$02
$1f:9fbb  10 06         bpl $9fc3
$1f:9fbd  01 01         ora ($01,x)
$1f:9fbf  c0 01         cpy #$01
$1f:9fc1  20 02 6b      jsr $6b02
$1f:9fc4  02 07         cop #$07
$1f:9fc6  01 85         ora ($85,x)
$1f:9fc8  d6 9f         dec $9f,x
$1f:9fca  02 15         cop #$15
$1f:9fcc  02 91         cop #$91
$1f:9fce  02 0d         cop #$0d
$1f:9fd0  00 14         brk #$14
$1f:9fd2  04 e0         tsb $e0
$1f:9fd4  9f 6b 02 80   sta $80026b,x
$1f:9fd8  26 02         rol $02
$1f:9fda  82 02 16      brl $b5df
$1f:9fdd  02 91         cop #$91
$1f:9fdf  6b            rtl
$1f:9fe0  a9 80         lda #$80
$1f:9fe2  ef 0c 26 03   sbc $03260c
$1f:9fe6  02 34         cop #$34
$1f:9fe8  02 1b         cop #$1b
$1f:9fea  ee 9f 78      inc $789f
$1f:9fed  00 00         brk #$00
$1f:9fef  9c 02 81      stz $8102
$1f:9ff2  26 10         rol $10
$1f:9ff4  02 83         cop #$83
$1f:9ff6  02 81         cop #$81
$1f:9ff8  27 08         and [$08]
$1f:9ffa  02 83         cop #$83
$1f:9ffc  02 1b         cop #$1b
$1f:9ffe  02 a0         cop #$a0
$1f:a000  5a            phy
$1f:a001  00 02         brk #$02
$1f:a003  09 01         ora #$01
$1f:a005  85 02         sta $02
$1f:a007  09 03         ora #$03
$1f:a009  09 02         ora #$02
$1f:a00b  10 06         bpl $a013
$1f:a00d  01 01         ora ($01,x)
$1f:a00f  c0 01         cpy #$01
$1f:a011  c0 01         cpy #$01
$1f:a013  6b            rtl
$1f:a014  02 14         cop #$14
$1f:a016  b6 00         ldx $00,y
$1f:a018  2e a0 02      rol $02a0
$1f:a01b  14 9d         trb $9d
$1f:a01d  00 27         brk #$27
$1f:a01f  a0 02         ldy #$02
$1f:a021  17 31         ora [$31],y
$1f:a023  a0 02         ldy #$02
$1f:a025  91 6b         sta ($6b),y
$1f:a027  02 17         cop #$17
$1f:a029  3a            dec a
$1f:a02a  a0 02         ldy #$02
$1f:a02c  91 6b         sta ($6b),y
$1f:a02e  02 86         cop #$86
$1f:a030  6b            rtl
$1f:a031  02 01         cop #$01
$1f:a033  3f a0 02 09   and $0902a0,x
$1f:a037  02 85         cop #$85
$1f:a039  6b            rtl
$1f:a03a  02 01         cop #$01
$1f:a03c  d3 a0         cmp ($a0,s),y
$1f:a03e  6b            rtl
$1f:a03f  10 02         bpl $a043
$1f:a041  02 20         cop #$20
$1f:a043  68            pla
$1f:a044  65 61         adc $61
$1f:a046  72 64         adc ($64)
$1f:a048  20 0d 97      jsr $970d
$1f:a04b  73 6d         adc ($6d,s),y
$1f:a04d  61 6c         adc ($6c,x)
$1f:a04f  6c 20 76      jmp ($7620)
$1f:a052  6f 69 63 65   adc $656369
$1f:a056  2e 20 11      rol $1120
$1f:a059  92 ba         sta ($ba)
$1f:a05b  53 74         eor ($74,s),y
$1f:a05d  2e 45 6c      rol $6c45
$1f:a060  6c 65 73      jmp ($7365)
$1f:a063  20 0d 50      jsr $500d
$1f:a066  61 6c         adc ($6c,x)
$1f:a068  61 63         adc ($63,x)
$1f:a06a  65 20         adc $20
$1f:a06c  bb            tyx
$1f:a06d  e1 6f         sbc ($6f,x)
$1f:a06f  63 65         adc $65,s
$1f:a071  61 6e         adc ($6e,x)
$1f:a073  2e 20 11      rol $1120
$1f:a076  4e 6f 20      lsr $206f
$1f:a079  b8            clv
$1f:a07a  a7 c0         lda [$c0]
$1f:a07c  0d 75 6e      ora $6e75
$1f:a07f  64 65         stz $65
$1f:a081  72 20         adc ($20)
$1f:a083  e1 73         sbc ($73,x)
$1f:a085  65 61         adc $61
$1f:a087  2e 20 11      rol $1120
$1f:a08a  47 6f         eor [$6f]
$1f:a08c  20 e2 e1      jsr $e1e2
$1f:a08f  69 73         adc #$73
$1f:a091  6c 61 6e      jmp ($6e61)
$1f:a094  64 2c         stz $2c
$1f:a096  20 0d 53      jsr $530d
$1f:a099  6f 75 74 68   adc $687475
$1f:a09d  65 72         adc $72
$1f:a09f  74 61         stz $61,x
$1f:a0a1  2c 20 74      bit $7420
$1f:a0a4  68            pla
$1f:a0a5  72 6f         adc ($6f)
$1f:a0a7  75 67         adc $67,x
$1f:a0a9  68            pla
$1f:a0aa  20 74 68      jsr $6874
$1f:a0ad  65 0d         adc $0d
$1f:a0af  73 68         adc ($68,s),y
$1f:a0b1  72 69         adc ($69)
$1f:a0b3  6e 65 20      ror $2065
$1f:a0b6  96 6c         stx $6c,y
$1f:a0b8  6f 6f 6b 20   adc $206b6f
$1f:a0bc  ae 0d e1      ldx $e10d
$1f:a0bf  42 75         wdm #$75
$1f:a0c1  62 62 6c      per $0d26
$1f:a0c4  65 20         adc $20
$1f:a0c6  43 6c         eor $6c,s
$1f:a0c8  6f 74 68 69   adc $696874
$1f:a0cc  6e 67 2e      ror $2e67
$1f:a0cf  20 13 44      jsr $4413
$1f:a0d2  aa            tax
$1f:a0d3  10 4c         bpl $a121
$1f:a0d5  69 73         adc #$73
$1f:a0d7  74 65         stz $65,x
$1f:a0d9  6e 20 63      ror $6320
$1f:a0dc  6c 6f 73      jmp ($736f)
$1f:a0df  65 6c         adc $6c
$1f:a0e1  79 20 e2      adc $e220,y
$1f:a0e4  e1 0d         sbc ($0d,x)
$1f:a0e6  61 64         adc ($64,x)
$1f:a0e8  76 69         ror $69,x
$1f:a0ea  63 65         adc $65,s
$1f:a0ec  20 cb e1      jsr $e1cb
$1f:a0ef  34 20         bit $20,x
$1f:a0f1  0d 6d 65      ora $656d
$1f:a0f4  72 6d         adc ($6d)
$1f:a0f6  61 69         adc ($69,x)
$1f:a0f8  64 20         stz $20
$1f:a0fa  73 74         adc ($74,s),y
$1f:a0fc  61 74         adc ($74,x)
$1f:a0fe  75 65         adc $65,x
$1f:a100  73 2e         adc ($2e,s),y
$1f:a102  20 13 44      jsr $4413
$1f:a105  aa            tax
$1f:a106  02 17         cop #$17
$1f:a108  59 a1 02      eor $02a1,y
$1f:a10b  15 02         ora $02,x
$1f:a10d  80 10         bra $a11f
$1f:a10f  02 82         cop #$82
$1f:a111  02 07         cop #$07
$1f:a113  06 05         asl $05
$1f:a115  0c a1 02      tsb $02a1
$1f:a118  16 a9         asl $a9,x
$1f:a11a  80 2f         bra $a14b
$1f:a11c  0c 26 03      tsb $0326
$1f:a11f  02 81         cop #$81
$1f:a121  0d 04 02      ora $0204
$1f:a124  83 a9         sta $a9,s
$1f:a126  80 2f         bra $a157
$1f:a128  1c 26 03      trb $0326
$1f:a12b  02 15         cop #$15
$1f:a12d  02 14         cop #$14
$1f:a12f  79 00 3a      adc $3a00,y
$1f:a132  a1 02         lda ($02,x)
$1f:a134  80 10         bra $a146
$1f:a136  02 82         cop #$82
$1f:a138  80 f3         bra $a12d
$1f:a13a  a9 80         lda #$80
$1f:a13c  2f 0c 26 03   and $03260c
$1f:a140  02 81         cop #$81
$1f:a142  10 02         bpl $a146
$1f:a144  02 83         cop #$83
$1f:a146  a9 80         lda #$80
$1f:a148  2f 1c 26 03   and $03261c
$1f:a14c  02 3c         cop #$3c
$1f:a14e  04 02         tsb $02
$1f:a150  10 07         bpl $a159
$1f:a152  03 02         ora $02,s
$1f:a154  40            rti
$1f:a155  00 80         brk #$80
$1f:a157  00 6b         brk #$6b
$1f:a159  02 19         cop #$19
$1f:a15b  20 6e a1      jsr $a16e
$1f:a15e  02 01         cop #$01
$1f:a160  e9 a1         sbc #$a1
$1f:a162  02 0b         cop #$0b
$1f:a164  20 02 17      jsr $1702
$1f:a167  7f a1 02 09   adc $0902a1,x
$1f:a16b  06 85         asl $85
$1f:a16d  6b            rtl
$1f:a16e  02 01         cop #$01
$1f:a170  84 a1         sty $a1
$1f:a172  02 3c         cop #$3c
$1f:a174  04 02         tsb $02
$1f:a176  10 07         bpl $a17f
$1f:a178  03 00         ora $00,s
$1f:a17a  40            rti
$1f:a17b  00 70         brk #$70
$1f:a17d  00 6b         brk #$6b
$1f:a17f  02 01         cop #$01
$1f:a181  37 a2         and [$a2],y
$1f:a183  6b            rtl
$1f:a184  10 88         bpl $a10e
$1f:a186  ec e2 c0      cpx $c0e2
$1f:a189  0d 68 65      ora $6568
$1f:a18c  72 65         adc ($65)
$1f:a18e  2e 20 11      rol $1120
$1f:a191  88            dey
$1f:a192  9d 74 72      sta $7274,x
$1f:a195  79 69 6e      adc $6e69,y
$1f:a198  67 20         adc [$20]
$1f:a19a  e2 0d         sep #$0d
$1f:a19c  72 65         adc ($65)
$1f:a19e  6d 65 6d      adc $6d65
$1f:a1a1  62 65 72      per $1409
$1f:a1a4  20 d8 62      jsr $62d8
$1f:a1a7  75 74         adc $74,x
$1f:a1a9  0d 88 63      ora $6388
$1f:a1ac  61 6e         adc ($6e,x)
$1f:a1ae  6e 6f 74      ror $746f
$1f:a1b1  2e 20 11      rol $1120
$1f:a1b4  57 68         eor [$68],y
$1f:a1b6  65 6e         adc $6e
$1f:a1b8  20 88 63      jsr $6388
$1f:a1bb  6c 6f 73      jmp ($736f)
$1f:a1be  65 20         adc $20
$1f:a1c0  c2 65         rep #$65
$1f:a1c2  79 65 73      adc $7365,y
$1f:a1c5  2c 20 0d      bit $0d20
$1f:a1c8  88            dey
$1f:a1c9  db            stp
$1f:a1ca  d8            cld
$1f:a1cb  be 0d 97      ldx $970d,y
$1f:a1ce  62 61 6c      per $0e32
$1f:a1d1  6c 2c 20      jmp ($202c)
$1f:a1d4  73 68         adc ($68,s),y
$1f:a1d6  69 6e 79      adc #$796e
$1f:a1d9  20 96 0d      jsr $0d96
$1f:a1dc  62 6c 61      per $034b
$1f:a1df  63 6b         adc $6b,s
$1f:a1e1  2e 2e 2e      rol $2e2e
$1f:a1e4  2e 20 13      rol $1320
$1f:a1e7  44 aa 10      mvp $10,$aa
$1f:a1ea  54 68 61      mvn $61,$68
$1f:a1ed  74 20         stz $20,x
$1f:a1ef  50 65         bvc $a256
$1f:a1f1  61 72         adc ($72,x)
$1f:a1f3  6c 21 20      jmp ($2021)
$1f:a1f6  11 59         ora ($59),y
$1f:a1f8  65 73         adc $73
$1f:a1fa  2c 20 88      bit $8820
$1f:a1fd  f3 b1         sbc ($b1,s),y
$1f:a1ff  e2 0d         sep #$0d
$1f:a201  70 72         bvs $a275
$1f:a203  65 73         adc $73
$1f:a205  65 6e         adc $6e
$1f:a207  74 20         stz $20,x
$1f:a209  e3 50         sbc $50,s
$1f:a20b  65 61         adc $61
$1f:a20d  72 6c         adc ($6c)
$1f:a20f  2e 20 11      rol $1120
$1f:a212  92 ba         sta ($ba)
$1f:a214  e1 43         sbc ($43,x)
$1f:a216  6f 72 61 6c   adc $6c6172
$1f:a21a  20 0d 52      jsr $520d
$1f:a21d  65 65         adc $65
$1f:a21f  66 2e         ror $2e
$1f:a221  20 88 b5      jsr $b588
$1f:a224  6d 69 73      adc $7369
$1f:a227  73 65         adc ($65,s),y
$1f:a229  64 20         stz $20
$1f:a22b  0d e4 70      ora $70e4
$1f:a22e  6c 61 63      jmp ($6361)
$1f:a231  65 2e         adc $2e
$1f:a233  20 13 44      jsr $4413
$1f:a236  aa            tax
$1f:a237  10 13         bpl $a24c
$1f:a239  12 a2         ora ($a2)
$1f:a23b  02 17         cop #$17
$1f:a23d  52 a2         eor ($a2)
$1f:a23f  02 15         cop #$15
$1f:a241  02 91         cop #$91
$1f:a243  02 0d         cop #$0d
$1f:a245  00 04         brk #$04
$1f:a247  29 4b a2      and #$a24b
$1f:a24a  6b            rtl
$1f:a24b  02 01         cop #$01
$1f:a24d  5b            tcd
$1f:a24e  a2 02         ldx #$02
$1f:a250  91 6b         sta ($6b),y
$1f:a252  02 01         cop #$01
$1f:a254  69 a3 02      adc #$02a3
$1f:a257  09 00 80      ora #$8000
$1f:a25a  6b            rtl
$1f:a25b  10 0f         bpl $a26c
$1f:a25d  95 a7         sta $a7,x
$1f:a25f  68            pla
$1f:a260  65 61         adc $61
$1f:a262  72 20         adc ($20)
$1f:a264  e1 0d         sbc ($0d,x)
$1f:a266  63 6f         adc $6f,s
$1f:a268  6e 76 65      ror $6576
$1f:a26b  72 73         adc ($73)
$1f:a26d  61 74         adc ($74,x)
$1f:a26f  69 6f 6e      adc #$6e6f
$1f:a272  20 cb 11      jsr $11cb
$1f:a275  97 66         sta [$66],y
$1f:a277  61 74         adc ($74,x)
$1f:a279  68            pla
$1f:a27a  65 72         adc $72
$1f:a27c  20 96 73      jsr $7396
$1f:a27f  6f 6e 2e 20   adc $202e6e
$1f:a283  11 10         ora ($10),y
$1f:a285  44 61 64      mvp $64,$61
$1f:a288  64 79         stz $79
$1f:a28a  2c 20 68      bit $6820
$1f:a28d  6f 77 20 c7   adc $c72077
$1f:a291  64 61         stz $61
$1f:a293  79 73 20      adc $2073,y
$1f:a296  0d b5 70      ora $70b5
$1f:a299  61 73         adc ($73,x)
$1f:a29b  73 65         adc ($65,s),y
$1f:a29d  64 20         stz $20
$1f:a29f  73 69         adc ($69,s),y
$1f:a2a1  6e 63 65      ror $6563
$1f:a2a4  20 e1 0d      jsr $0de1
$1f:a2a7  73 68         adc ($68,s),y
$1f:a2a9  69 70 20      adc #$2070
$1f:a2ac  73 61         adc ($61,s),y
$1f:a2ae  6e 6b 3f      ror $3f6b
$1f:a2b1  20 11 88      jsr $8811
$1f:a2b4  9d 74 6f      sta $6f74,x
$1f:a2b7  6f 20 68 75   adc $756820
$1f:a2bb  6e 67 72      ror $7267
$1f:a2be  79 20 96      adc $9620,y
$1f:a2c1  0d 63 61      ora $6163
$1f:a2c4  6e 6e 6f      ror $6f6e
$1f:a2c7  74 20         stz $20,x
$1f:a2c9  74 72         stz $72,x
$1f:a2cb  61 76         adc ($76,x)
$1f:a2cd  65 6c         adc $6c
$1f:a2cf  20 61 6e      jsr $6e61
$1f:a2d2  79 20 0d      adc $0d20,y
$1f:a2d5  66 61         ror $61
$1f:a2d7  72 74         adc ($74)
$1f:a2d9  68            pla
$1f:a2da  65 72         adc $72
$1f:a2dc  2e 20 11      rol $1120
$1f:a2df  41 72         eor ($72,x)
$1f:a2e1  65 20         adc $20
$1f:a2e3  77 65         adc [$65],y
$1f:a2e5  20 b1 e2      jsr $e2b1
$1f:a2e8  64 69         stz $69
$1f:a2ea  65 3f         adc $3f
$1f:a2ec  20 11 53      jsr $5311
$1f:a2ef  65 72         adc $72
$1f:a2f1  76 61         ror $61,x
$1f:a2f3  73 2c         adc ($2c,s),y
$1f:a2f5  20 c2 73      jsr $73c2
$1f:a2f8  6f 6e 2c 20   adc $202c6e
$1f:a2fc  73 6f         adc ($6f,s),y
$1f:a2fe  6d 65 20      adc $2065
$1f:a301  0d cf a5      ora $a5cf
$1f:a304  e3 0d         sbc $0d,s
$1f:a306  b8            clv
$1f:a307  6c 69 66      jmp ($6669)
$1f:a30a  65 20         adc $20
$1f:a30c  64 6f         stz $6f
$1f:a30e  65 73         adc $73
$1f:a310  20 ca 0d      jsr $0dca
$1f:a313  65 6e         adc $6e
$1f:a315  64 20         stz $20
$1f:a317  61 74         adc ($74,x)
$1f:a319  20 64 65      jsr $6564
$1f:a31c  61 74         adc ($74,x)
$1f:a31e  68            pla
$1f:a31f  2e 20 11      rol $1120
$1f:a322  54 68 65      mvn $65,$68
$1f:a325  79 20 a5      adc $a520,y
$1f:a328  e3 74         sbc $74,s
$1f:a32a  68            pla
$1f:a32b  65 79         adc $79
$1f:a32d  0d f1 a1      ora $a1f1
$1f:a330  62 6f 72      per $15a2
$1f:a333  6e 20 69      ror $6920
$1f:a336  6e 74 6f      ror $6f74
$1f:a339  20 97 0d      jsr $0d97
$1f:a33c  6e 65 77      ror $7765
$1f:a33f  20 6c 69      jsr $696c
$1f:a342  66 65         ror $65
$1f:a344  2e 20 4c      rol $4c20
$1f:a347  69 76 65      adc #$6576
$1f:a34a  73 2c         adc ($2c,s),y
$1f:a34c  20 74 68      jsr $6874
$1f:a34f  65 79         adc $79
$1f:a351  20 0d 66      jsr $660d
$1f:a354  65 65         adc $65
$1f:a356  6c 2c 20      jmp ($202c)
$1f:a359  98            tya
$1f:a35a  65 76         adc $76
$1f:a35c  65 72         adc $72
$1f:a35e  6c 61 73      jmp ($7361)
$1f:a361  74 69         stz $69,x
$1f:a363  6e 67 2e      ror $2e67
$1f:a366  13 44         ora ($44,s),y
$1f:a368  aa            tax
$1f:a369  10 4f         bpl $a3ba
$1f:a36b  68            pla
$1f:a36c  2c 20 88      bit $8820
$1f:a36f  68            pla
$1f:a370  65 61         adc $61
$1f:a372  72 20         adc ($20)
$1f:a374  73 6f         adc ($6f,s),y
$1f:a376  6d 65 20      adc $2065
$1f:a379  0d 76 6f      ora $6f76
$1f:a37c  69 63 65      adc #$6563
$1f:a37f  73 2e         adc ($2e,s),y
$1f:a381  2e 2e 2e      rol $2e2e
$1f:a384  2e 20 6d      rol $6d20
$1f:a387  61 79         adc ($79,x)
$1f:a389  62 65 20      per $c3f1
$1f:a38c  e1 0d         sbc ($0d,x)
$1f:a38e  4d 61 73      eor $7361
$1f:a391  74 65         stz $65,x
$1f:a393  72 20         adc ($20)
$1f:a395  ba            tsx
$1f:a396  63 61         adc $61,s
$1f:a398  6c 6c 69      jmp ($696c)
$1f:a39b  6e 67 20      ror $2067
$1f:a39e  6d 65 2e      adc $2e65
$1f:a3a1  20 13 44      jsr $4413
$1f:a3a4  aa            tax
$1f:a3a5  02 17         cop #$17
$1f:a3a7  ae a3 02      ldx $02a3
$1f:a3aa  15 02         ora $02,x
$1f:a3ac  91 6b         sta ($6b),y
$1f:a3ae  02 07         cop #$07
$1f:a3b0  00 00         brk #$00
$1f:a3b2  c9 a3 02      cmp #$02a3
$1f:a3b5  01 db         ora ($db,x)
$1f:a3b7  a3 02         lda $02,s
$1f:a3b9  3c 04 02      bit $0204,x
$1f:a3bc  10 06         bpl $a3c4
$1f:a3be  01 03         ora ($03,x)
$1f:a3c0  c0 00         cpy #$00
$1f:a3c2  40            rti
$1f:a3c3  00 02         brk #$02
$1f:a3c5  09 04 87      ora #$8704
$1f:a3c8  6b            rtl
$1f:a3c9  02 01         cop #$01
$1f:a3cb  ce a3 6b      dec $6ba3
$1f:a3ce  10 2e         bpl $a3fe
$1f:a3d0  2e 2e 2e      rol $2e2e
$1f:a3d3  2e 2e 2e      rol $2e2e
$1f:a3d6  2e 20 13      rol $1320
$1f:a3d9  44 aa 10      mvp $10,$aa
$1f:a3dc  53 6f         eor ($6f,s),y
$1f:a3de  6d 65 6f      adc $6f65
$1f:a3e1  6e 65 20      ror $2065
$1f:a3e4  ba            tsx
$1f:a3e5  63 61         adc $61,s
$1f:a3e7  6c 6c 69      jmp ($696c)
$1f:a3ea  6e 67 20      ror $2067
$1f:a3ed  6d 65 2e      adc $2e65
$1f:a3f0  0d 57 68      ora $6857
$1f:a3f3  61 74         adc ($74,x)
$1f:a3f5  20 ba 74      jsr $74ba
$1f:a3f8  68            pla
$1f:a3f9  61 74         adc ($74,x)
$1f:a3fb  3f 20 11 88   and $881120,x
$1f:a3ff  bc d0 cc      ldy $ccd0,x
$1f:a402  47 45         eor [$45]
$1f:a404  4d 20 bb      eor $bb20
$1f:a407  0d 97 74      ora $7497
$1f:a40a  72 65         adc ($65)
$1f:a40c  61 73         adc ($73,x)
$1f:a40e  75 72         adc $72,x
$1f:a410  65 20         adc $20
$1f:a412  63 68         adc $68,s
$1f:a414  65 73         adc $73
$1f:a416  74 2e         stz $2e,x
$1f:a418  20 11 88      jsr $8811
$1f:a41b  68            pla
$1f:a41c  6f 70 65 20   adc $206570
$1f:a420  73 6f         adc ($6f,s),y
$1f:a422  6d 65 6f      adc $6f65
$1f:a425  6e 65 20      ror $2065
$1f:a428  f1 0d         sbc ($0d),y
$1f:a42a  66 69         ror $69
$1f:a42c  6e 64 20      ror $2064
$1f:a42f  69 74 2e      adc #$2e74
$1f:a432  20 11 2e      jsr $2e11
$1f:a435  2e 2e 2e      rol $2e2e
$1f:a438  2e 2e 2e      rol $2e2e
$1f:a43b  2e 20 13      rol $1320
$1f:a43e  44 aa 02      mvp $02,$aa
$1f:a441  14 a6         trb $a6
$1f:a443  00 47         brk #$47
$1f:a445  a4 6b         ldy $6b
$1f:a447  22 61 b1 03   jsl $03b161  ; -> Sub_03_b161
$1f:a44b  02 17         cop #$17
$1f:a44d  5b            tcd
$1f:a44e  a4 e2         ldy $e2
$1f:a450  20 a9 1f      jsr $1fa9
$1f:a453  48            pha
$1f:a454  c2 20         rep #$20
$1f:a456  a9 44 a9      lda #$a944
$1f:a459  48            pha
$1f:a45a  6b            rtl
$1f:a45b  02 07         cop #$07
$1f:a45d  00 9d         brk #$9d
$1f:a45f  6d a4 02      adc $02a4
$1f:a462  01 c5         ora ($c5,x)
$1f:a464  a9 02 38      lda #$3802
$1f:a467  00 02         brk #$02
$1f:a469  02 09         cop #$09
$1f:a46b  00 9d         brk #$9d
$1f:a46d  02 01         cop #$01
$1f:a46f  f0 a9         beq $a41a
$1f:a471  02 1a         cop #$1a
$1f:a473  5b            tcd
$1f:a474  cf 02 8f a4   cmp $a48f02
$1f:a478  af d0 03 00   lda $0003d0
$1f:a47c  f0 11         beq $a48f
$1f:a47e  02 01         cop #$01
$1f:a480  15 aa         ora $aa,x
$1f:a482  ee 2d 04      inc $042d
$1f:a485  02 10         cop #$10
$1f:a487  06 01         asl $01
$1f:a489  00 f8         brk #$f8
$1f:a48b  01 00         ora ($00,x)
$1f:a48d  02 6b         cop #$6b
$1f:a48f  02 01         cop #$01
$1f:a491  29 aa 6b      and #$6baa
$1f:a494  02 14         cop #$14
$1f:a496  7f 00 9b a4   adc $a49b00,x
$1f:a49a  6b            rtl
$1f:a49b  22 61 b1 03   jsl $03b161  ; -> Sub_03_b161
$1f:a49f  02 17         cop #$17
$1f:a4a1  af a4 e2 20   lda $20e2a4
$1f:a4a5  a9 1f 48      lda #$481f
$1f:a4a8  c2 20         rep #$20
$1f:a4aa  a9 44 a9      lda #$a944
$1f:a4ad  48            pha
$1f:a4ae  6b            rtl
$1f:a4af  02 07         cop #$07
$1f:a4b1  06 9d         asl $9d
$1f:a4b3  6d a4 02      adc $02a4
$1f:a4b6  01 c5         ora ($c5,x)
$1f:a4b8  a9 02 38      lda #$3802
$1f:a4bb  00 03         brk #$03
$1f:a4bd  02 09         cop #$09
$1f:a4bf  06 9d         asl $9d
$1f:a4c1  82 a9 ff      brl $a46d
$1f:a4c4  02 14         cop #$14
$1f:a4c6  7a            ply
$1f:a4c7  00 cb         brk #$cb
$1f:a4c9  a4 6b         ldy $6b
$1f:a4cb  22 61 b1 03   jsl $03b161  ; -> Sub_03_b161
$1f:a4cf  02 17         cop #$17
$1f:a4d1  df a4 e2 20   cmp $20e2a4,x
$1f:a4d5  a9 1f 48      lda #$481f
$1f:a4d8  c2 20         rep #$20
$1f:a4da  a9 44 a9      lda #$a944
$1f:a4dd  48            pha
$1f:a4de  6b            rtl
$1f:a4df  02 07         cop #$07
$1f:a4e1  07 9d         ora [$9d]
$1f:a4e3  6d a4 02      adc $02a4
$1f:a4e6  01 c5         ora ($c5,x)
$1f:a4e8  a9 02 38      lda #$3802
$1f:a4eb  50 02         bvc $a4ef
$1f:a4ed  02 09         cop #$09
$1f:a4ef  07 9d         ora [$9d]
$1f:a4f1  82 79 ff      brl $a46d
$1f:a4f4  02 14         cop #$14
$1f:a4f6  b8            clv
$1f:a4f7  00 fb         brk #$fb
$1f:a4f9  a4 6b         ldy $6b
$1f:a4fb  22 61 b1 03   jsl $03b161  ; -> Sub_03_b161
$1f:a4ff  02 17         cop #$17
$1f:a501  0f a5 e2 20   ora $20e2a5
$1f:a505  a9 1f 48      lda #$481f
$1f:a508  c2 20         rep #$20
$1f:a50a  a9 44 a9      lda #$a944
$1f:a50d  48            pha
$1f:a50e  6b            rtl
$1f:a50f  02 01         cop #$01
$1f:a511  16 a5         asl $a5,x
$1f:a513  82 57 ff      brl $a46d
$1f:a516  10 91         bpl $a4a9
$1f:a518  6d 6f 6e      adc $6e6f
$1f:a51b  75 6d         adc $6d,x
$1f:a51d  65 6e         adc $6e
$1f:a51f  74 73         stz $73,x
$1f:a521  20 cd e4      jsr $e4cd
$1f:a524  0d 69 73      ora $7369
$1f:a527  6c 61 6e      jmp ($6e61)
$1f:a52a  64 20         stz $20
$1f:a52c  98            tya
$1f:a52d  6c 69 67      jmp ($6769)
$1f:a530  68            pla
$1f:a531  74 6e         stz $6e,x
$1f:a533  69 6e 67      adc #$676e
$1f:a536  20 0d 70      jsr $700d
$1f:a539  79 72 61      adc $6172,y
$1f:a53c  6d 69 64      adc $6469
$1f:a53f  73 2e         adc ($2e,s),y
$1f:a541  20 11 89      jsr $8911
$1f:a544  fe 77 65      inc $6577,x
$1f:a547  61 72         adc ($72,x)
$1f:a549  20 e1 0d      jsr $0de1
$1f:a54c  54 68 75      mvn $75,$68
$1f:a54f  6e 64 65      ror $6564
$1f:a552  72 20         adc ($20)
$1f:a554  52 69         eor ($69)
$1f:a556  6e 67 20      ror $2067
$1f:a559  96 74         stx $74,y
$1f:a55b  6f 75 63 68   adc $686375
$1f:a55f  0d 74 68      ora $6874
$1f:a562  65 6d         adc $6d
$1f:a564  2c 20 11      bit $1120
$1f:a567  e1 4d         sbc ($4d,x)
$1f:a569  61 73         adc ($73,x)
$1f:a56b  74 65         stz $65,x
$1f:a56d  72 20         adc ($20)
$1f:a56f  f1 73         sbc ($73),y
$1f:a571  65 6e         adc $6e
$1f:a573  64 20         stz $20
$1f:a575  0d 64 6f      ora $6f64
$1f:a578  77 6e         adc [$6e],y
$1f:a57a  20 6c 69      jsr $696c
$1f:a57d  67 68         adc [$68]
$1f:a57f  74 6e         stz $6e,x
$1f:a581  69 6e 67      adc #$676e
$1f:a584  20 e2 0d      jsr $0de2
$1f:a587  64 65         stz $65
$1f:a589  73 74         adc ($74,s),y
$1f:a58b  72 6f         adc ($6f)
$1f:a58d  79 20 e1      adc $e120,y
$1f:a590  6d 6f 6e      adc $6e6f
$1f:a593  73 74         adc ($74,s),y
$1f:a595  65 72         adc $72
$1f:a597  73 2e         adc ($2e,s),y
$1f:a599  20 11 0c      jsr $0c11
$1f:a59c  e2 20         sep #$20
$1f:a59e  a0 ae         ldy #$ae
$1f:a5a0  a5 8c         lda $8c
$1f:a5a2  d8            cld
$1f:a5a3  03 a9         ora $a9,s
$1f:a5a5  1f 8d da 03   ora $03da8d,x
$1f:a5a9  c2 20         rep #$20
$1f:a5ab  02 86         cop #$86
$1f:a5ad  6b            rtl
$1f:a5ae  32 7b         and ($7b)
$1f:a5b0  0b            phd
$1f:a5b1  16 fc         asl $fc,x
$1f:a5b3  ff 00 00 7b   sbc $7b0000,x
$1f:a5b7  7d 0e 16      adc $160e,x
$1f:a5ba  fc ff 00      jsr ($00ff,x)
$1f:a5bd  00 ff         brk #$ff
$1f:a5bf  02 07         cop #$07
$1f:a5c1  03 85         ora $85,s
$1f:a5c3  d3 a5         cmp ($a5,s),y
$1f:a5c5  a9 47 00      lda #$0047
$1f:a5c8  22 62 f4 04   jsl $04f462  ; -> Sub_04_f462
$1f:a5cc  b0 01         bcs $a5cf
$1f:a5ce  6b            rtl
$1f:a5cf  02 39         cop #$39
$1f:a5d1  04 6b         tsb $6b
$1f:a5d3  02 86         cop #$86
$1f:a5d5  6b            rtl
$1f:a5d6  02 07         cop #$07
$1f:a5d8  03 85         ora $85,s
$1f:a5da  f7 a5         sbc [$a5],y
$1f:a5dc  02 b0         cop #$b0
$1f:a5de  fa            plx
$1f:a5df  a5 1f         lda $1f
$1f:a5e1  40            rti
$1f:a5e2  22 02 92 19   jsl $199202
$1f:a5e6  02 94         cop #$94
$1f:a5e8  02 07         cop #$07
$1f:a5ea  03 05         ora $05,s
$1f:a5ec  e3 a5         sbc $a5,s
$1f:a5ee  02 05         cop #$05
$1f:a5f0  01 00         ora ($00,x)
$1f:a5f2  02 92         cop #$92
$1f:a5f4  39 02 94      and $9402,y
$1f:a5f7  02 86         cop #$86
$1f:a5f9  6b            rtl
$1f:a5fa  bd 16 00      lda $0016,x
$1f:a5fd  29 ef ff      and #$ffef
$1f:a600  9d 16 00      sta $0016,x
$1f:a603  02 91         cop #$91
$1f:a605  02 0d         cop #$0d
$1f:a607  00 1f         brk #$1f
$1f:a609  21 0d         and ($0d,x)
$1f:a60b  a6 6b         ldx $6b
$1f:a60d  02 19         cop #$19
$1f:a60f  21 0c         and ($0c,x)
$1f:a611  a6 02         ldx $02
$1f:a613  09 03 85      ora #$8503
$1f:a616  02 0b         cop #$0b
$1f:a618  21 02         and ($02,x)
$1f:a61a  01 26         ora ($26,x)
$1f:a61c  a6 00         ldx $00
$1f:a61e  86 02         stx $02
$1f:a620  09 01 80      ora #$8001
$1f:a623  02 86         cop #$86
$1f:a625  6b            rtl
$1f:a626  10 02         bpl $a62a
$1f:a628  02 20         cop #$20
$1f:a62a  70 6f         bvs $a69b
$1f:a62c  75 72         adc $72,x
$1f:a62e  65 64         adc $64
$1f:a630  20 0d 6f      jsr $6f0d
$1f:a633  75 74         adc $74,x
$1f:a635  20 e1 6d      jsr $6de1
$1f:a638  65 72         adc $72
$1f:a63a  6d 61 69      adc $6961
$1f:a63d  64 60         stz $60
$1f:a63f  d7 0d         cmp [$0d],y
$1f:a641  74 65         stz $65,x
$1f:a643  61 72         adc ($72,x)
$1f:a645  73 2e         adc ($2e,s),y
$1f:a647  20 13 44      jsr $4413
$1f:a64a  aa            tax
$1f:a64b  02 91         cop #$91
$1f:a64d  02 07         cop #$07
$1f:a64f  03 89         ora $89,s
$1f:a651  a6 a6         ldx $a6
$1f:a653  02 19         cop #$19
$1f:a655  0b            phd
$1f:a656  97 a6         sta [$a6],y
$1f:a658  02 b0         cop #$b0
$1f:a65a  a9 a6 1f      lda #$1fa6
$1f:a65d  10 03         bpl $a662
$1f:a65f  02 91         cop #$91
$1f:a661  02 19         cop #$19
$1f:a663  0b            phd
$1f:a664  8a            txa
$1f:a665  a6 bc         ldx $bc
$1f:a667  3e 00 ad      rol $ad00,x
$1f:a66a  74 03         stz $03,x
$1f:a66c  99 00 00      sta $0000,y
$1f:a66f  ad 76 03      lda $0376
$1f:a672  38            sec
$1f:a673  e9 04 00      sbc #$0004
$1f:a676  99 02 00      sta $0002,y
$1f:a679  ad 12 03      lda $0312
$1f:a67c  29 ff 00      and #$00ff
$1f:a67f  f0 01         beq $a682
$1f:a681  6b            rtl
$1f:a682  02 af         cop #$af
$1f:a684  cb            wai
$1f:a685  a6 1f         ldx $1f
$1f:a687  40            rti
$1f:a688  20 6b bc      jsr $bc6b
$1f:a68b  3e 00 a9      rol $a900,x
$1f:a68e  00 00         brk #$00
$1f:a690  99 14 00      sta $0014,y
$1f:a693  02 27         cop #$27
$1f:a695  4b            phk
$1f:a696  a6 ad         ldx $ad
$1f:a698  12 03         ora ($03)
$1f:a69a  29 3f 00      and #$003f
$1f:a69d  d0 03         bne $a6a2
$1f:a69f  02 39         cop #$39
$1f:a6a1  01 02         ora ($02,x)
$1f:a6a3  27 4b         and [$4b]
$1f:a6a5  a6 02         ldx $02
$1f:a6a7  91 6b         sta ($6b),y
$1f:a6a9  02 a3         cop #$a3
$1f:a6ab  02 a2         cop #$a2
$1f:a6ad  30 a9         bmi $a658
$1f:a6af  24 00         bit $00
$1f:a6b1  9d 1e 00      sta $001e,x
$1f:a6b4  9e 20 00      stz $0020,x
$1f:a6b7  22 f3 88 00   jsl $0088f3  ; -> Sub_00_88f3
$1f:a6bb  02 a3         cop #$a3
$1f:a6bd  02 91         cop #$91
$1f:a6bf  02 19         cop #$19
$1f:a6c1  0b            phd
$1f:a6c2  c8            iny
$1f:a6c3  a6 02         ldx $02
$1f:a6c5  82 80 f7      brl $9e48
$1f:a6c8  02 86         cop #$86
$1f:a6ca  6b            rtl
$1f:a6cb  02 a3         cop #$a3
$1f:a6cd  02 a2         cop #$a2
$1f:a6cf  30 ad         bmi $a67e
$1f:a6d1  74 03         stz $03,x
$1f:a6d3  18            clc
$1f:a6d4  69 04 00      adc #$0004
$1f:a6d7  9d 00 00      sta $0000,x
$1f:a6da  ad 76 03      lda $0376
$1f:a6dd  38            sec
$1f:a6de  e9 10 00      sbc #$0010
$1f:a6e1  9d 02 00      sta $0002,x
$1f:a6e4  bd 16 00      lda $0016,x
$1f:a6e7  29 ff df      and #$dfff
$1f:a6ea  9d 16 00      sta $0016,x
$1f:a6ed  02 80         cop #$80
$1f:a6ef  22 02 82 02   jsl $028202  ; -> Sub_02_8202
$1f:a6f3  86 6b         stx $6b
$1f:a6f5  02 85         cop #$85
$1f:a6f7  8c a7 1f      sty $1fa7
$1f:a6fa  02 85         cop #$85
$1f:a6fc  77 a7         adc [$a7],y
$1f:a6fe  1f 02 91 ad   ora $ad9102,x
$1f:a702  a6 03         ldx $03
$1f:a704  d0 11         bne $a717
$1f:a706  ac 9c 03      ldy $039c
$1f:a709  b9 04 00      lda $0004,y
$1f:a70c  30 18         bmi $a726
$1f:a70e  d0 1b         bne $a72b
$1f:a710  b9 06 00      lda $0006,y
$1f:a713  30 0c         bmi $a721
$1f:a715  d0 05         bne $a71c
$1f:a717  a9 20 00      lda #$0020
$1f:a71a  80 12         bra $a72e
$1f:a71c  a9 22 00      lda #$0022
$1f:a71f  80 0d         bra $a72e
$1f:a721  a9 24 00      lda #$0024
$1f:a724  80 08         bra $a72e
$1f:a726  a9 26 00      lda #$0026
$1f:a729  80 03         bra $a72e
$1f:a72b  a9 28 00      lda #$0028
$1f:a72e  85 00         sta $00
$1f:a730  bc 3e 00      ldy $003e,x
$1f:a733  da            phx
$1f:a734  ae 9c 03      ldx $039c
$1f:a737  bd 00 00      lda $0000,x
$1f:a73a  99 00 00      sta $0000,y
$1f:a73d  bd 02 00      lda $0002,x
$1f:a740  1a            inc a
$1f:a741  99 02 00      sta $0002,y
$1f:a744  a5 00         lda $00
$1f:a746  d9 1e 00      cmp $001e,y
$1f:a749  f0 09         beq $a754
$1f:a74b  99 1e 00      sta $001e,y
$1f:a74e  a9 00 00      lda #$0000
$1f:a751  99 14 00      sta $0014,y
$1f:a754  b9 3e 00      lda $003e,y
$1f:a757  a8            tay
$1f:a758  bd 00 00      lda $0000,x
$1f:a75b  99 00 00      sta $0000,y
$1f:a75e  bd 02 00      lda $0002,x
$1f:a761  99 02 00      sta $0002,y
$1f:a764  fa            plx
$1f:a765  a5 00         lda $00
$1f:a767  1a            inc a
$1f:a768  d9 1e 00      cmp $001e,y
$1f:a76b  f0 09         beq $a776
$1f:a76d  99 1e 00      sta $001e,y
$1f:a770  a9 00 00      lda #$0000
$1f:a773  99 14 00      sta $0014,y
$1f:a776  6b            rtl
$1f:a777  a9 10 03      lda #$0310
$1f:a77a  9d 16 00      sta $0016,x
$1f:a77d  a9 20 00      lda #$0020
$1f:a780  9d 1e 00      sta $001e,x
$1f:a783  9e 20 00      stz $0020,x
$1f:a786  02 91         cop #$91
$1f:a788  02 82         cop #$82
$1f:a78a  80 fc         bra $a788
$1f:a78c  a9 10 03      lda #$0310
$1f:a78f  9d 16 00      sta $0016,x
$1f:a792  a9 21 00      lda #$0021
$1f:a795  9d 1e 00      sta $001e,x
$1f:a798  9e 20 00      stz $0020,x
$1f:a79b  02 91         cop #$91
$1f:a79d  02 82         cop #$82
$1f:a79f  80 fc         bra $a79d
$1f:a7a1  bd 00 00      lda $0000,x
$1f:a7a4  18            clc
$1f:a7a5  69 02 00      adc #$0002
$1f:a7a8  18            clc
$1f:a7a9  6d 82 03      adc $0382
$1f:a7ac  9d 00 00      sta $0000,x
$1f:a7af  8d 3e 03      sta $033e
$1f:a7b2  bd 02 00      lda $0002,x
$1f:a7b5  38            sec
$1f:a7b6  e9 06 00      sbc #$0006
$1f:a7b9  18            clc
$1f:a7ba  6d 84 03      adc $0384
$1f:a7bd  9d 02 00      sta $0002,x
$1f:a7c0  8d 40 03      sta $0340
$1f:a7c3  6b            rtl
$1f:a7c4  da            phx
$1f:a7c5  a2 00         ldx #$00
$1f:a7c7  00 a9         brk #$a9
$1f:a7c9  90 00         bcc $a7cb
$1f:a7cb  9f 00 70 7e   sta $7e7000,x
$1f:a7cf  a9 00 71      lda #$7100
$1f:a7d2  9f 01 70 7e   sta $7e7001,x
$1f:a7d6  e8            inx
$1f:a7d7  e8            inx
$1f:a7d8  e8            inx
$1f:a7d9  e0 2a         cpx #$2a
$1f:a7db  00 d0         brk #$d0
$1f:a7dd  ea            nop
$1f:a7de  a9 00 00      lda #$0000
$1f:a7e1  9f 00 70 7e   sta $7e7000,x
$1f:a7e5  fa            plx
$1f:a7e6  02 91         cop #$91
$1f:a7e8  da            phx
$1f:a7e9  ad 3a 03      lda $033a
$1f:a7ec  4a            lsr a
$1f:a7ed  85 00         sta $00
$1f:a7ef  ad 3c 03      lda $033c
$1f:a7f2  4a            lsr a
$1f:a7f3  85 02         sta $02
$1f:a7f5  ad 12 03      lda $0312
$1f:a7f8  4a            lsr a
$1f:a7f9  4a            lsr a
$1f:a7fa  18            clc
$1f:a7fb  65 02         adc $02
$1f:a7fd  29 0f 00      and #$000f
$1f:a800  0a            asl a
$1f:a801  aa            tax
$1f:a802  a0 00         ldy #$00
$1f:a804  00 e2         brk #$e2
$1f:a806  20 8b a9      jsr $a98b
$1f:a809  7e 48 ab      ror $ab48,x
$1f:a80c  c2 20         rep #$20
$1f:a80e  bf 34 a8 1f   lda $1fa834,x
$1f:a812  18            clc
$1f:a813  65 00         adc $00
$1f:a815  99 00 71      sta $7100,y
$1f:a818  e8            inx
$1f:a819  e8            inx
$1f:a81a  c8            iny
$1f:a81b  c8            iny
$1f:a81c  c0 20         cpy #$20
$1f:a81e  00 d0         brk #$d0
$1f:a820  ed ab e2      sbc $e2ab
$1f:a823  20 a9 0f      jsr $0fa9
$1f:a826  eb            xba
$1f:a827  a9 7e a0      lda #$a07e
$1f:a82a  00 70         brk #$70
$1f:a82c  22 6e 98 02   jsl $02986e  ; -> Sub_02_986e
$1f:a830  c2 20         rep #$20
$1f:a832  fa            plx
$1f:a833  6b            rtl
$1f:a834  00 00         brk #$00
$1f:a836  00 00         brk #$00
$1f:a838  00 00         brk #$00
$1f:a83a  00 00         brk #$00
$1f:a83c  01 00         ora ($00,x)
$1f:a83e  01 00         ora ($00,x)
$1f:a840  01 00         ora ($00,x)
$1f:a842  01 00         ora ($00,x)
$1f:a844  00 00         brk #$00
$1f:a846  00 00         brk #$00
$1f:a848  00 00         brk #$00
$1f:a84a  00 00         brk #$00
$1f:a84c  ff ff ff ff   sbc $ffffff,x
$1f:a850  ff ff ff ff   sbc $ffffff,x
$1f:a854  00 00         brk #$00
$1f:a856  00 00         brk #$00
$1f:a858  00 00         brk #$00
$1f:a85a  00 00         brk #$00
$1f:a85c  01 00         ora ($00,x)
$1f:a85e  01 00         ora ($00,x)
$1f:a860  01 00         ora ($00,x)
$1f:a862  01 00         ora ($00,x)
$1f:a864  00 00         brk #$00
$1f:a866  00 00         brk #$00
$1f:a868  00 00         brk #$00
$1f:a86a  00 00         brk #$00
$1f:a86c  ff ff ff ff   sbc $ffffff,x
$1f:a870  ff ff ff ff   sbc $ffffff,x
$1f:a874  da            phx
$1f:a875  a2 00         ldx #$00
$1f:a877  00 a9         brk #$a9
$1f:a879  90 00         bcc $a87b
$1f:a87b  9f 00 70 7e   sta $7e7000,x
$1f:a87f  9f 00 78 7e   sta $7e7800,x
$1f:a883  a9 00 71      lda #$7100
$1f:a886  9f 01 70 7e   sta $7e7001,x
$1f:a88a  a9 00 79      lda #$7900
$1f:a88d  9f 01 78 7e   sta $7e7801,x
$1f:a891  e8            inx
$1f:a892  e8            inx
$1f:a893  e8            inx
$1f:a894  e0 2a         cpx #$2a
$1f:a896  00 d0         brk #$d0
$1f:a898  df a9 00 00   cmp $0000a9,x
$1f:a89c  9f 00 70 7e   sta $7e7000,x
$1f:a8a0  9f 00 78 7e   sta $7e7800,x
$1f:a8a4  fa            plx
$1f:a8a5  02 91         cop #$91
$1f:a8a7  da            phx
$1f:a8a8  ad 3a 03      lda $033a
$1f:a8ab  4a            lsr a
$1f:a8ac  85 16         sta $16
$1f:a8ae  ad 3c 03      lda $033c
$1f:a8b1  4a            lsr a
$1f:a8b2  85 18         sta $18
$1f:a8b4  ad 12 03      lda $0312
$1f:a8b7  4a            lsr a
$1f:a8b8  4a            lsr a
$1f:a8b9  18            clc
$1f:a8ba  65 18         adc $18
$1f:a8bc  29 0f 00      and #$000f
$1f:a8bf  0a            asl a
$1f:a8c0  aa            tax
$1f:a8c1  a0 00         ldy #$00
$1f:a8c3  00 e2         brk #$e2
$1f:a8c5  20 8b a9      jsr $a98b
$1f:a8c8  7e 48 ab      ror $ab48,x
$1f:a8cb  bf 05 a9 1f   lda $1fa905,x
$1f:a8cf  18            clc
$1f:a8d0  65 16         adc $16
$1f:a8d2  99 00 71      sta $7100,y
$1f:a8d5  bf 05 a9 1f   lda $1fa905,x
$1f:a8d9  18            clc
$1f:a8da  65 18         adc $18
$1f:a8dc  99 00 79      sta $7900,y
$1f:a8df  e8            inx
$1f:a8e0  e8            inx
$1f:a8e1  c8            iny
$1f:a8e2  c8            iny
$1f:a8e3  c0 20         cpy #$20
$1f:a8e5  00 d0         brk #$d0
$1f:a8e7  e3 ab         sbc $ab,s
$1f:a8e9  a9 0d eb      lda #$eb0d
$1f:a8ec  a9 7e a0      lda #$a07e
$1f:a8ef  00 70         brk #$70
$1f:a8f1  22 6e 98 02   jsl $02986e  ; -> Sub_02_986e
$1f:a8f5  a9 0e eb      lda #$eb0e
$1f:a8f8  a9 7e a0      lda #$a07e
$1f:a8fb  00 78         brk #$78
$1f:a8fd  22 6e 98 02   jsl $02986e  ; -> Sub_02_986e
$1f:a901  c2 20         rep #$20
$1f:a903  fa            plx
$1f:a904  6b            rtl
$1f:a905  00 00         brk #$00
$1f:a907  00 00         brk #$00
$1f:a909  00 00         brk #$00
$1f:a90b  00 00         brk #$00
$1f:a90d  01 00         ora ($00,x)
$1f:a90f  01 00         ora ($00,x)
$1f:a911  01 00         ora ($00,x)
$1f:a913  01 00         ora ($00,x)
$1f:a915  00 00         brk #$00
$1f:a917  00 00         brk #$00
$1f:a919  00 00         brk #$00
$1f:a91b  00 00         brk #$00
$1f:a91d  ff ff ff ff   sbc $ffffff,x
$1f:a921  ff ff ff ff   sbc $ffffff,x
$1f:a925  00 00         brk #$00
$1f:a927  00 00         brk #$00
$1f:a929  00 00         brk #$00
$1f:a92b  00 00         brk #$00
$1f:a92d  01 00         ora ($00,x)
$1f:a92f  01 00         ora ($00,x)
$1f:a931  01 00         ora ($00,x)
$1f:a933  01 00         ora ($00,x)
$1f:a935  00 00         brk #$00
$1f:a937  00 00         brk #$00
$1f:a939  00 00         brk #$00
$1f:a93b  00 00         brk #$00
$1f:a93d  ff ff ff ff   sbc $ffffff,x
$1f:a941  ff ff ff ff   sbc $ffffff,x
$1f:a945  02 2e         cop #$2e
$1f:a947  00 18         brk #$18
$1f:a949  00 53         brk #$53
$1f:a94b  a9 02 80      lda #$8002
$1f:a94e  07 02         ora [$02]
$1f:a950  82 80 f2      brl $9bd3
$1f:a953  02 80         cop #$80
$1f:a955  0c 02 82      tsb $8202
$1f:a958  80 eb         bra $a945
$1f:a95a  02 1f         cop #$1f
$1f:a95c  ad 02 03      lda $0302
$1f:a95f  29 03 00      and #$0003
$1f:a962  f0 08         beq $a96c
$1f:a964  3a            dec a
$1f:a965  f0 0a         beq $a971
$1f:a967  02 01         cop #$01
$1f:a969  76 a9         ror $a9,x
$1f:a96b  6b            rtl
$1f:a96c  02 01         cop #$01
$1f:a96e  8c a9 6b      sty $6ba9
$1f:a971  02 01         cop #$01
$1f:a973  a4 a9         ldy $a9
$1f:a975  6b            rtl
$1f:a976  10 8f         bpl $a907
$1f:a978  73 6f         adc ($6f,s),y
$1f:a97a  6d 65 62      adc $6265
$1f:a97d  6f 64 79 20   adc $207964
$1f:a981  b7 0d         lda [$0d],y
$1f:a983  6d 65 2e      adc $2e65
$1f:a986  2e 2e 20      rol $202e
$1f:a989  13 44         ora ($44,s),y
$1f:a98b  aa            tax
$1f:a98c  10 88         bpl $a916
$1f:a98e  f8            sed
$1f:a98f  e2 72         sep #$72
$1f:a991  65 74         adc $74
$1f:a993  75 72         adc $72,x
$1f:a995  6e 20 e2      ror $e220
$1f:a998  0d 6d 79      ora $796d
$1f:a99b  73 65         adc ($65,s),y
$1f:a99d  6c 66 21      jmp ($2166)
$1f:a9a0  20 13 44      jsr $4413
$1f:a9a3  aa            tax
$1f:a9a4  10 48         bpl $a9ee
$1f:a9a6  65 6c         adc $6c
$1f:a9a8  70 21         bvs $a9cb
$1f:a9aa  20 53 6f      jsr $6f53
$1f:a9ad  6d 65 62      adc $6265
$1f:a9b0  6f 64 79 20   adc $207964
$1f:a9b4  0d 70 6c      ora $6c70
$1f:a9b7  65 61         adc $61
$1f:a9b9  73 65         adc ($65,s),y
$1f:a9bb  2e 2e 2e      rol $2e2e
$1f:a9be  2e 2e 2e      rol $2e2e
$1f:a9c1  20 13 44      jsr $4413
$1f:a9c4  aa            tax
$1f:a9c5  10 88         bpl $a94f
$1f:a9c7  9d f7 ce      sta $cef7,x
$1f:a9ca  74 68         stz $68,x
$1f:a9cc  65 0d         adc $0d
$1f:a9ce  77 6f         adc [$6f],y
$1f:a9d0  72 6c         adc ($6c)
$1f:a9d2  64 2e         stz $2e
$1f:a9d4  20 0d 48      jsr $480d
$1f:a9d7  65 72         adc $72
$1f:a9d9  65 2c         adc $2c
$1f:a9db  20 e6 74      jsr $74e6
$1f:a9de  68            pla
$1f:a9df  69 73         adc #$73
$1f:a9e1  2e 20 11      rol $1120
$1f:a9e4  02 02         cop #$02
$1f:a9e6  20 d4 0d      jsr $0dd4
$1f:a9e9  45 58         eor $58
$1f:a9eb  50 21         bvc $aa0e
$1f:a9ed  20 11 0c      jsr $0c11
$1f:a9f0  10 57         bpl $aa49
$1f:a9f2  6f 75 6c 64   adc $646c75
$1f:a9f6  20 fe be      jsr $befe
$1f:a9f9  e2 0d         sep #$0d
$1f:a9fb  72 65         adc ($65)
$1f:a9fd  74 75         stz $75,x
$1f:a9ff  72 6e         adc ($6e)
$1f:aa01  20 e2 e1      jsr $e1e2
$1f:aa04  53 65         eor ($65,s),y
$1f:aa06  61 62         adc ($62,x)
$1f:aa08  65 64         adc $64
$1f:aa0a  20 0d 50      jsr $500d
$1f:aa0d  61 6c         adc ($6c,x)
$1f:aa0f  61 63         adc ($63,x)
$1f:aa11  65 3f         adc $3f
$1f:aa13  20 0c 41      jsr $410c
$1f:aa16  6c 6c 72      jmp ($726c)
$1f:aa19  69 67         adc #$67
$1f:aa1b  68            pla
$1f:aa1c  74 2c         stz $2c,x
$1f:aa1e  20 b2 6c      jsr $6cb2
$1f:aa21  75 63         adc $63,x
$1f:aa23  6b            rtl
$1f:aa24  2e 20 13      rol $1320
$1f:aa27  44 aa 56      mvp $56,$aa
$1f:aa2a  69 73         adc #$73
$1f:aa2c  69 74         adc #$74
$1f:aa2e  20 c3 61      jsr $61c3
$1f:aa31  67 61         adc [$61]
$1f:aa33  69 6e         adc #$6e
$1f:aa35  20 f4 0d      jsr $0df4
$1f:aa38  fe 98 72      inc $7298,x
$1f:aa3b  65 61         adc $61
$1f:aa3d  64 79         stz $79
$1f:aa3f  2e 20 13      rol $1320
$1f:aa42  44 aa 12      mvp $12,$aa
$1f:aa45  08            php
$1f:aa46  08            php
$1f:aa47  04 0c         tsb $0c
$1f:aa49  bd 16 00      lda $0016,x
$1f:aa4c  89 00         bit #$00
$1f:aa4e  80 f0         bra $aa40
$1f:aa50  06 02         asl $02
$1f:aa52  1b            tcs
$1f:aa53  49 aa         eor #$aa
$1f:aa55  08            php
$1f:aa56  00 02         brk #$02
$1f:aa58  9a            txs
$1f:aa59  10 00         bpl $aa5b
$1f:aa5b  61 aa         adc ($aa,x)
$1f:aa5d  73 aa         adc ($aa,s),y
$1f:aa5f  6a            ror a
$1f:aa60  aa            tax
$1f:aa61  02 97         cop #$97
$1f:aa63  02 80         cop #$80
$1f:aa65  05 02         ora $02
$1f:aa67  82 80 09      brl $b3ea
$1f:aa6a  02 96         cop #$96
$1f:aa6c  02 80         cop #$80
$1f:aa6e  05 02         ora $02
$1f:aa70  82 80 00      brl $aaf3
$1f:aa73  02 9b         cop #$9b
$1f:aa75  10 00         bpl $aa77
$1f:aa77  7d aa 51      adc $51aa,x
$1f:aa7a  aa            tax
$1f:aa7b  86 aa         stx $aa
$1f:aa7d  02 97         cop #$97
$1f:aa7f  02 80         cop #$80
$1f:aa81  04 02         tsb $02
$1f:aa83  82 80 c3      brl $6e06
$1f:aa86  02 97         cop #$97
$1f:aa88  02 80         cop #$80
$1f:aa8a  03 02         ora $02,s
$1f:aa8c  82 80 ba      brl $650f
$1f:aa8f  bd 16 00      lda $0016,x
$1f:aa92  89 00         bit #$00
$1f:aa94  80 f0         bra $aa86
$1f:aa96  06 02         asl $02
$1f:aa98  1b            tcs
$1f:aa99  8f aa 08 00   sta $0008aa
$1f:aa9d  02 9a         cop #$9a
$1f:aa9f  10 00         bpl $aaa1
$1f:aaa1  a7 aa         lda [$aa]
$1f:aaa3  b9 aa b0      lda $b0aa,y
$1f:aaa6  aa            tax
$1f:aaa7  02 97         cop #$97
$1f:aaa9  02 80         cop #$80
$1f:aaab  0d 02 82      ora $8202
$1f:aaae  80 43         bra $aaf3
$1f:aab0  02 96         cop #$96
$1f:aab2  02 80         cop #$80
$1f:aab4  0d 02 82      ora $8202
$1f:aab7  80 3a         bra $aaf3
$1f:aab9  02 9b         cop #$9b
$1f:aabb  10 00         bpl $aabd
$1f:aabd  c3 aa         cmp $aa,s
$1f:aabf  f3 aa         sbc ($aa,s),y
$1f:aac1  db            stp
$1f:aac2  aa            tax
$1f:aac3  02 97         cop #$97
$1f:aac5  02 80         cop #$80
$1f:aac7  0c 02 82      tsb $8202
$1f:aaca  02 80         cop #$80
$1f:aacc  10 02         bpl $aad0
$1f:aace  82 02 85      brl $2fd3
$1f:aad1  61 ab         adc ($ab,x)
$1f:aad3  1f 02 80 36   ora $368002,x
$1f:aad7  02 82         cop #$82
$1f:aad9  80 18         bra $aaf3
$1f:aadb  02 97         cop #$97
$1f:aadd  02 80         cop #$80
$1f:aadf  0a            asl a
$1f:aae0  02 82         cop #$82
$1f:aae2  02 80         cop #$80
$1f:aae4  0f 02 82 02   ora $028202
$1f:aae8  85 6c         sta $6c
$1f:aaea  ab            plb
$1f:aaeb  1f 02 80 35   ora $358002,x
$1f:aaef  02 82         cop #$82
$1f:aaf1  80 00         bra $aaf3
$1f:aaf3  02 9b         cop #$9b
$1f:aaf5  10 00         bpl $aaf7
$1f:aaf7  fd aa 0f      sbc $0faa,x
$1f:aafa  ab            plb
$1f:aafb  06 ab         asl $ab
$1f:aafd  02 97         cop #$97
$1f:aaff  02 80         cop #$80
$1f:ab01  0b            phd
$1f:ab02  02 82         cop #$82
$1f:ab04  80 89         bra $aa8f
$1f:ab06  02 97         cop #$97
$1f:ab08  02 80         cop #$80
$1f:ab0a  09 02         ora #$02
$1f:ab0c  82 80 80      brl $2b8f
$1f:ab0f  02 9a         cop #$9a
$1f:ab11  10 00         bpl $ab13
$1f:ab13  19 ab 97      ora $97ab,y
$1f:ab16  aa            tax
$1f:ab17  32 ab         and ($ab)
$1f:ab19  02 97         cop #$97
$1f:ab1b  02 80         cop #$80
$1f:ab1d  0e 02 82      asl $8202
$1f:ab20  02 80         cop #$80
$1f:ab22  11 02         ora ($02),y
$1f:ab24  82 02 85      brl $3029
$1f:ab27  4b            phk
$1f:ab28  ab            plb
$1f:ab29  1f 02 80 37   ora $378002,x
$1f:ab2d  02 82         cop #$82
$1f:ab2f  82 65 ff      brl $aa97
$1f:ab32  02 96         cop #$96
$1f:ab34  02 80         cop #$80
$1f:ab36  0e 02 82      asl $8202
$1f:ab39  02 80         cop #$80
$1f:ab3b  11 02         ora ($02),y
$1f:ab3d  82 02 85      brl $3042
$1f:ab40  4b            phk
$1f:ab41  ab            plb
$1f:ab42  1f 02 80 37   ora $378002,x
$1f:ab46  02 82         cop #$82
$1f:ab48  82 4c ff      brl $aa97
$1f:ab4b  02 a1         cop #$a1
$1f:ab4d  ff ff 02 00   sbc $0002ff,x
$1f:ab51  a9 25         lda #$25
$1f:ab53  00 80         brk #$80
$1f:ab55  1f 02 a1 01   ora $01a102,x
$1f:ab59  00 02         brk #$02
$1f:ab5b  00 a9         brk #$a9
$1f:ab5d  25 00         and $00
$1f:ab5f  80 14         bra $ab75
$1f:ab61  02 a1         cop #$a1
$1f:ab63  04 00         tsb $00
$1f:ab65  f3 ff         sbc ($ff,s),y
$1f:ab67  a9 26         lda #$26
$1f:ab69  00 80         brk #$80
$1f:ab6b  09 02         ora #$02
$1f:ab6d  a1 fd         lda ($fd,x)
$1f:ab6f  ff 02 00 a9   sbc $a90002,x
$1f:ab73  27 00         and [$00]
$1f:ab75  9d 1e 00      sta $001e,x
$1f:ab78  9e 20 00      stz $0020,x
$1f:ab7b  a9 0c         lda #$0c
$1f:ab7d  00 9d         brk #$9d
$1f:ab7f  2a            rol a
$1f:ab80  00 a9         brk #$a9
$1f:ab82  00 02         brk #$02
$1f:ab84  9d 16 00      sta $0016,x
$1f:ab87  02 a3         cop #$a3
$1f:ab89  02 a2         cop #$a2
$1f:ab8b  30 00         bmi $ab8d
$1f:ab8d  5b            tcd
$1f:ab8e  02 91         cop #$91
$1f:ab90  02 83         cop #$83
$1f:ab92  02 80         cop #$80
$1f:ab94  24 02         bit $02
$1f:ab96  82 02 86      brl $319b
$1f:ab99  6b            rtl
$1f:ab9a  bd 16 00      lda $0016,x
$1f:ab9d  89 00         bit #$00
$1f:ab9f  80 f0         bra $ab91
$1f:aba1  06 02         asl $02
$1f:aba3  1b            tcs
$1f:aba4  9a            txs
$1f:aba5  ab            plb
$1f:aba6  10 00         bpl $aba8
$1f:aba8  02 0c         cop #$0c
$1f:abaa  00 05         brk #$05
$1f:abac  b5 ab         lda $ab,x
$1f:abae  02 80         cop #$80
$1f:abb0  1b            tcs
$1f:abb1  02 82         cop #$82
$1f:abb3  80 e5         bra $ab9a
$1f:abb5  02 9a         cop #$9a
$1f:abb7  10 00         bpl $abb9
$1f:abb9  bf ab fb ab   lda $abfbab,x
$1f:abbd  c9 ab         cmp #$ab
$1f:abbf  02 9b         cop #$9b
$1f:abc1  10 00         bpl $abc3
$1f:abc3  e7 ab         sbc [$ab]
$1f:abc5  1f ac f1 ab   ora $abf1ac,x
$1f:abc9  02 9b         cop #$9b
$1f:abcb  10 00         bpl $abcd
$1f:abcd  d3 ab         cmp ($ab,s),y
$1f:abcf  15 ac         ora $ac,x
$1f:abd1  dd ab 02      cmp $02ab,x
$1f:abd4  96 02         stx $02,y
$1f:abd6  81 1e         sta ($1e,x)
$1f:abd8  10 02         bpl $abdc
$1f:abda  83 80         sta $80,s
$1f:abdc  4c 02 96      jmp $9602
$1f:abdf  02 81         cop #$81
$1f:abe1  1d 10 02      ora $0210,x
$1f:abe4  83 80         sta $80,s
$1f:abe6  42 02         wdm #$02
$1f:abe8  97 02         sta [$02],y
$1f:abea  81 1e         sta ($1e,x)
$1f:abec  10 02         bpl $abf0
$1f:abee  83 80         sta $80,s
$1f:abf0  38            sec
$1f:abf1  02 97         cop #$97
$1f:abf3  02 81         cop #$81
$1f:abf5  1d 10 02      ora $0210,x
$1f:abf8  83 80         sta $80,s
$1f:abfa  2e 02 9b      rol $9b02
$1f:abfd  00 00         brk #$00
$1f:abff  0d ac 0d      ora $0dac
$1f:ac02  ac 05 ac      ldy $ac05
$1f:ac05  02 81         cop #$81
$1f:ac07  34 10         bit $10,x
$1f:ac09  02 83         cop #$83
$1f:ac0b  80 1c         bra $ac29
$1f:ac0d  02 81         cop #$81
$1f:ac0f  1a            inc a
$1f:ac10  10 02         bpl $ac14
$1f:ac12  83 80         sta $80,s
$1f:ac14  14 02         trb $02
$1f:ac16  96 02         stx $02,y
$1f:ac18  81 1c         sta ($1c,x)
$1f:ac1a  10 02         bpl $ac1e
$1f:ac1c  83 80         sta $80,s
$1f:ac1e  0a            asl a
$1f:ac1f  02 97         cop #$97
$1f:ac21  02 81         cop #$81
$1f:ac23  1c 10 02      trb $0210
$1f:ac26  83 80         sta $80,s
$1f:ac28  00 02         brk #$02
$1f:ac2a  80 1b         bra $ac47
$1f:ac2c  02 82         cop #$82
$1f:ac2e  82 69 ff      brl $ab9a
$1f:ac31  bd 16 00      lda $0016,x
$1f:ac34  89 00         bit #$00
$1f:ac36  80 f0         bra $ac28
$1f:ac38  06 02         asl $02
$1f:ac3a  1b            tcs
$1f:ac3b  31 ac         and ($ac),y
$1f:ac3d  10 00         bpl $ac3f
$1f:ac3f  02 1f         cop #$1f
$1f:ac41  ad 02 03      lda $0302
$1f:ac44  29 03         and #$03
$1f:ac46  00 f0         brk #$f0
$1f:ac48  09 3a         ora #$3a
$1f:ac4a  f0 0f         beq $ac5b
$1f:ac4c  3a            dec a
$1f:ac4d  f0 15         beq $ac64
$1f:ac4f  3a            dec a
$1f:ac50  f0 1d         beq $ac6f
$1f:ac52  02 9d         cop #$9d
$1f:ac54  14 02         trb $02
$1f:ac56  9e 39 ac      stz $ac39,x
$1f:ac59  80 d6         bra $ac31
$1f:ac5b  02 9d         cop #$9d
$1f:ac5d  12 02         ora ($02)
$1f:ac5f  9e 39 ac      stz $ac39,x
$1f:ac62  80 cd         bra $ac31
$1f:ac64  02 96         cop #$96
$1f:ac66  02 9d         cop #$9d
$1f:ac68  16 02         asl $02,x
$1f:ac6a  9e 39 ac      stz $ac39,x
$1f:ac6d  80 c2         bra $ac31
$1f:ac6f  02 97         cop #$97
$1f:ac71  02 9d         cop #$9d
$1f:ac73  16 02         asl $02,x
$1f:ac75  9e 39 ac      stz $ac39,x
$1f:ac78  80 b7         bra $ac31
$1f:ac7a  bd 16 00      lda $0016,x
$1f:ac7d  89 00         bit #$00
$1f:ac7f  80 f0         bra $ac71
$1f:ac81  06 02         asl $02
$1f:ac83  1b            tcs
$1f:ac84  7a            ply
$1f:ac85  ac 20 00      ldy $0020
$1f:ac88  02 0c         cop #$0c
$1f:ac8a  00 05         brk #$05
$1f:ac8c  95 ac         sta $ac,x
$1f:ac8e  02 80         cop #$80
$1f:ac90  2e 02 82      rol $8202
$1f:ac93  80 e5         bra $ac7a
$1f:ac95  02 80         cop #$80
$1f:ac97  2f 02 82 02   and $028202
$1f:ac9b  9c a0 ac      stz $aca0
$1f:ac9e  c0 ac         cpy #$ac
$1f:aca0  02 9a         cop #$9a
$1f:aca2  00 00         brk #$00
$1f:aca4  aa            tax
$1f:aca5  ac dc ac      ldy $acdc
$1f:aca8  b5 ac         lda $ac,x
$1f:acaa  02 97         cop #$97
$1f:acac  02 9d         cop #$9d
$1f:acae  33 02         and ($02,s),y
$1f:acb0  9e c0 ac      stz $acc0,x
$1f:acb3  80 27         bra $acdc
$1f:acb5  02 96         cop #$96
$1f:acb7  02 9d         cop #$9d
$1f:acb9  33 02         and ($02,s),y
$1f:acbb  9e c0 ac      stz $acc0,x
$1f:acbe  80 1c         bra $acdc
$1f:acc0  02 9b         cop #$9b
$1f:acc2  00 00         brk #$00
$1f:acc4  ca            dex
$1f:acc5  ac dc ac      ldy $acdc
$1f:acc8  d3 ac         cmp ($ac,s),y
$1f:acca  02 9d         cop #$9d
$1f:accc  32 02         and ($02)
$1f:acce  9e a0 ac      stz $aca0,x
$1f:acd1  80 09         bra $acdc
$1f:acd3  02 9d         cop #$9d
$1f:acd5  31 02         and ($02),y
$1f:acd7  9e a0 ac      stz $aca0,x
$1f:acda  80 00         bra $acdc
$1f:acdc  bd 16 00      lda $0016,x
$1f:acdf  89 00         bit #$00
$1f:ace1  80 d0         bra $acb3
$1f:ace3  07 02         ora [$02]
$1f:ace5  80 30         bra $ad17
$1f:ace7  02 82         cop #$82
$1f:ace9  80 af         bra $ac9a
$1f:aceb  02 80         cop #$80
$1f:aced  2e 02 82      rol $8202
$1f:acf0  80 88         bra $ac7a
$1f:acf2  bd 16 00      lda $0016,x
$1f:acf5  89 00         bit #$00
$1f:acf7  80 f0         bra $ace9
$1f:acf9  06 02         asl $02
$1f:acfb  1b            tcs
$1f:acfc  f2 ac         sbc ($ac)
$1f:acfe  08            php
$1f:acff  00 02         brk #$02
$1f:ad01  81 18         sta ($18,x)
$1f:ad03  08            php
$1f:ad04  02 83         cop #$83
$1f:ad06  02 80         cop #$80
$1f:ad08  19 02 82      ora $8202,y
$1f:ad0b  02 b0         cop #$b0
$1f:ad0d  14 ad         trb $ad
$1f:ad0f  1f 00 02 80   ora $800200,x
$1f:ad13  de 02 a3      dec $a302,x
$1f:ad16  02 a2         cop #$a2
$1f:ad18  30 00         bmi $ad1a
$1f:ad1a  64 a0         stz $a0
$1f:ad1c  1f 00 e2 20   ora $20e200,x
$1f:ad20  a9 00         lda #$00
$1f:ad22  48            pha
$1f:ad23  c2 20         rep #$20
$1f:ad25  a9 66 ad      lda #$ad66
$1f:ad28  48            pha
$1f:ad29  6b            rtl
$1f:ad2a  bd 16 00      lda $0016,x
$1f:ad2d  89 00 80      bit #$8000
$1f:ad30  f0 06         beq $ad38
$1f:ad32  02 1b         cop #$1b
$1f:ad34  2a            rol a
$1f:ad35  ad 10 00      lda $0010
$1f:ad38  02 9a         cop #$9a
$1f:ad3a  10 00         bpl $ad3c
$1f:ad3c  42 ad         wdm #$ad
$1f:ad3e  1b            tcs
$1f:ad3f  ae 42 ad      ldx $ad42
$1f:ad42  02 9b         cop #$9b
$1f:ad44  10 00         bpl $ad46
$1f:ad46  4c ad 53      jmp $53ad
$1f:ad49  ae 4c ad      ldx $ad4c
$1f:ad4c  02 9c         cop #$9c
$1f:ad4e  52 ad         eor ($ad)
$1f:ad50  b1 ad         lda ($ad),y
$1f:ad52  02 9a         cop #$9a
$1f:ad54  10 00         bpl $ad56
$1f:ad56  5c ad 07 ae   jml $ae07ad
$1f:ad5a  7b            tdc
$1f:ad5b  ad 02 23      lda $2302
$1f:ad5e  a1 ad         lda ($ad,x)
$1f:ad60  02 80         cop #$80
$1f:ad62  14 02         trb $02
$1f:ad64  82 02 9a      brl $4769
$1f:ad67  10 00         bpl $ad69
$1f:ad69  6f ad 1b ae   adc $ae1bad
$1f:ad6d  6f ad 02 23   adc $2302ad
$1f:ad71  a1 ad         lda ($ad,x)
$1f:ad73  02 80         cop #$80
$1f:ad75  0e 02 82      asl $8202
$1f:ad78  82 8c 00      brl $ae07
$1f:ad7b  02 24         cop #$24
$1f:ad7d  a1 ad         lda ($ad,x)
$1f:ad7f  02 96         cop #$96
$1f:ad81  02 80         cop #$80
$1f:ad83  14 02         trb $02
$1f:ad85  82 02 97      brl $448a
$1f:ad88  02 9a         cop #$9a
$1f:ad8a  10 00         bpl $ad8c
$1f:ad8c  92 ad         sta ($ad)
$1f:ad8e  1b            tcs
$1f:ad8f  ae 92 ad      ldx $ad92
$1f:ad92  02 24         cop #$24
$1f:ad94  a1 ad         lda ($ad,x)
$1f:ad96  02 96         cop #$96
$1f:ad98  02 80         cop #$80
$1f:ad9a  0e 02 82      asl $8202
$1f:ad9d  02 97         cop #$97
$1f:ad9f  80 66         bra $ae07
$1f:ada1  02 1b         cop #$1b
$1f:ada3  a7 ad         lda [$ad]
$1f:ada5  00 00         brk #$00
$1f:ada7  02 9b         cop #$9b
$1f:ada9  00 00         brk #$00
$1f:adab  bb            tyx
$1f:adac  ad d9 ad      lda $add9
$1f:adaf  d9 ad 02      cmp $02ad,y
$1f:adb2  9b            txy
$1f:adb3  10 00         bpl $adb5
$1f:adb5  bb            tyx
$1f:adb6  ad 07 ae      lda $ae07
$1f:adb9  d9 ad 02      cmp $02ad,y
$1f:adbc  21 f7         and ($f7,x)
$1f:adbe  ad 02 80      lda $8002
$1f:adc1  13 02         ora ($02,s),y
$1f:adc3  82 02 9b      brl $48c8
$1f:adc6  10 00         bpl $adc8
$1f:adc8  ce ad 53      dec $53ad
$1f:adcb  ae ce ad      ldx $adce
$1f:adce  02 21         cop #$21
$1f:add0  f7 ad         sbc [$ad],y
$1f:add2  02 80         cop #$80
$1f:add4  0d 02 82      ora $8202
$1f:add7  80 2e         bra $ae07
$1f:add9  02 22         cop #$22
$1f:addb  f7 ad         sbc [$ad],y
$1f:addd  02 80         cop #$80
$1f:addf  12 02         ora ($02)
$1f:ade1  82 02 9b      brl $48e6
$1f:ade4  10 00         bpl $ade6
$1f:ade6  ec ad 53      cpx $53ad
$1f:ade9  ae ec ad      ldx $adec
$1f:adec  02 22         cop #$22
$1f:adee  f7 ad         sbc [$ad],y
$1f:adf0  02 80         cop #$80
$1f:adf2  0c 02 82      tsb $8202
$1f:adf5  80 10         bra $ae07
$1f:adf7  02 1b         cop #$1b
$1f:adf9  fd ad 00      sbc $00ad,x
$1f:adfc  00 02         brk #$02
$1f:adfe  9a            txs
$1f:adff  00 00         brk #$00
$1f:ae01  5c ad 7b ad   jml $ad7bad
$1f:ae05  7b            tdc
$1f:ae06  ad 02 9a      lda $9a02
$1f:ae09  10 00         bpl $ae0b
$1f:ae0b  11 ae         ora ($ae),y
$1f:ae0d  1b            tcs
$1f:ae0e  ae 11 ae      ldx $ae11
$1f:ae11  02 9b         cop #$9b
$1f:ae13  10 00         bpl $ae15
$1f:ae15  2a            rol a
$1f:ae16  ad 53 ae      lda $ae53
$1f:ae19  2a            rol a
$1f:ae1a  ad 02 9b      lda $9b02
$1f:ae1d  00 00         brk #$00
$1f:ae1f  25 ae         and $ae
$1f:ae21  3c ae 3c      bit $3cae,x
$1f:ae24  ae 02 80      ldx $8002
$1f:ae27  0b            phd
$1f:ae28  02 82         cop #$82
$1f:ae2a  02 80         cop #$80
$1f:ae2c  16 02         asl $02,x
$1f:ae2e  82 02 85      brl $3333
$1f:ae31  af ae 1f 02   lda $021fae
$1f:ae35  80 10         bra $ae47
$1f:ae37  02 82         cop #$82
$1f:ae39  82 ee fe      brl $ad2a
$1f:ae3c  02 80         cop #$80
$1f:ae3e  0b            phd
$1f:ae3f  02 82         cop #$82
$1f:ae41  02 80         cop #$80
$1f:ae43  15 02         ora $02,x
$1f:ae45  82 02 85      brl $334a
$1f:ae48  ba            tsx
$1f:ae49  ae 1f 02      ldx $021f
$1f:ae4c  80 0f         bra $ae5d
$1f:ae4e  02 82         cop #$82
$1f:ae50  82 d7 fe      brl $ad2a
$1f:ae53  02 9a         cop #$9a
$1f:ae55  00 00         brk #$00
$1f:ae57  5d ae 74      eor $74ae,x
$1f:ae5a  ae 74 ae      ldx $ae74
$1f:ae5d  02 80         cop #$80
$1f:ae5f  0b            phd
$1f:ae60  02 82         cop #$82
$1f:ae62  02 80         cop #$80
$1f:ae64  17 02         ora [$02],y
$1f:ae66  82 02 85      brl $336b
$1f:ae69  8f ae 1f 02   sta $021fae
$1f:ae6d  80 11         bra $ae80
$1f:ae6f  02 82         cop #$82
$1f:ae71  82 b6 fe      brl $ad2a
$1f:ae74  02 96         cop #$96
$1f:ae76  02 80         cop #$80
$1f:ae78  0b            phd
$1f:ae79  02 82         cop #$82
$1f:ae7b  02 80         cop #$80
$1f:ae7d  17 02         ora [$02],y
$1f:ae7f  82 02 85      brl $3384
$1f:ae82  8f ae 1f 02   sta $021fae
$1f:ae86  80 11         bra $ae99
$1f:ae88  02 82         cop #$82
$1f:ae8a  02 97         cop #$97
$1f:ae8c  82 9b fe      brl $ad2a
$1f:ae8f  02 a1         cop #$a1
$1f:ae91  ff ff f8 ff   sbc $fff8ff,x
$1f:ae95  a9 00 02      lda #$0200
$1f:ae98  9d 16 00      sta $0016,x
$1f:ae9b  02 a3         cop #$a3
$1f:ae9d  02 a2         cop #$a2
$1f:ae9f  30 00         bmi $aea1
$1f:aea1  5b            tcd
$1f:aea2  02 80         cop #$80
$1f:aea4  26 02         rol $02
$1f:aea6  82 02 1c      brl $caab
$1f:aea9  00 80         brk #$80
$1f:aeab  e2 ae         sep #$ae
$1f:aead  80 f3         bra $aea2
$1f:aeaf  02 a1         cop #$a1
$1f:aeb1  04 00         tsb $00
$1f:aeb3  f1 ff         sbc ($ff),y
$1f:aeb5  a9 25         lda #$25
$1f:aeb7  00 80         brk #$80
$1f:aeb9  09 02         ora #$02
$1f:aebb  a1 fc         lda ($fc,x)
$1f:aebd  ff f8 ff a9   sbc $a9fff8,x
$1f:aec1  24 00         bit $00
$1f:aec3  9d 1e 00      sta $001e,x
$1f:aec6  9e 20 00      stz $0020,x
$1f:aec9  a9 00         lda #$00
$1f:aecb  02 9d         cop #$9d
$1f:aecd  16 00         asl $00,x
$1f:aecf  02 a3         cop #$a3
$1f:aed1  02 a2         cop #$a2
$1f:aed3  30 00         bmi $aed5
$1f:aed5  5b            tcd
$1f:aed6  02 91         cop #$91
$1f:aed8  02 82         cop #$82
$1f:aeda  02 1c         cop #$1c
$1f:aedc  00 80         brk #$80
$1f:aede  e2 ae         sep #$ae
$1f:aee0  80 f6         bra $aed8
$1f:aee2  02 86         cop #$86
$1f:aee4  6b            rtl
$1f:aee5  bd 1a 00      lda $001a,x
$1f:aee8  09 00         ora #$00
$1f:aeea  04 9d         tsb $9d
$1f:aeec  1a            inc a
$1f:aeed  00 02         brk #$02
$1f:aeef  a5 32         lda $32
$1f:aef1  af 20 af f8   lda $f8af20
$1f:aef5  ae 0e af      ldx $af0e
$1f:aef8  02 21         cop #$21
$1f:aefa  fe ae 80      inc $80ae,x
$1f:aefd  1a            inc a
$1f:aefe  02 24         cop #$24
$1f:af00  32 af         and ($af)
$1f:af02  02 96         cop #$96
$1f:af04  02 81         cop #$81
$1f:af06  21 02         and ($02,x)
$1f:af08  02 83         cop #$83
$1f:af0a  02 97         cop #$97
$1f:af0c  80 ea         bra $aef8
$1f:af0e  02 23         cop #$23
$1f:af10  14 af         trb $af
$1f:af12  80 16         bra $af2a
$1f:af14  02 21         cop #$21
$1f:af16  f8            sed
$1f:af17  ae 02 81      ldx $8102
$1f:af1a  20 02 02      jsr $0202
$1f:af1d  83 80         sta $80,s
$1f:af1f  ee 02 22      inc $2202
$1f:af22  26 af         rol $af
$1f:af24  80 16         bra $af3c
$1f:af26  02 23         cop #$23
$1f:af28  0e af 02      asl $02af
$1f:af2b  81 21         sta ($21,x)
$1f:af2d  02 02         cop #$02
$1f:af2f  83 80         sta $80,s
$1f:af31  ee 02 24      inc $2402
$1f:af34  38            sec
$1f:af35  af 80 ca 02   lda $02ca80
$1f:af39  22 20 af 02   jsl $02af20
$1f:af3d  81 1f         sta ($1f,x)
$1f:af3f  02 02         cop #$02
$1f:af41  83 80         sta $80,s
$1f:af43  ee 02 a2      inc $a202
$1f:af46  30 02         bmi $af4a
$1f:af48  a3 bd         lda $bd,s
$1f:af4a  16 00         asl $00,x
$1f:af4c  89 00         bit #$00
$1f:af4e  80 f0         bra $af40
$1f:af50  06 02         asl $02
$1f:af52  1b            tcs
$1f:af53  49 af         eor #$af
$1f:af55  10 00         bpl $af57
$1f:af57  02 9c         cop #$9c
$1f:af59  5d af 85      eor $85af,x
$1f:af5c  af 02 9a 10   lda $109a02
$1f:af60  00 67         brk #$67
$1f:af62  af 74 af 74   lda $74af74
$1f:af66  af 02 81 1c   lda $1c8102
$1f:af6a  02 02         cop #$02
$1f:af6c  83 02         sta $02,s
$1f:af6e  80 1d         bra $af8d
$1f:af70  02 82         cop #$82
$1f:af72  80 e3         bra $af57
$1f:af74  02 96         cop #$96
$1f:af76  02 81         cop #$81
$1f:af78  1c 02 02      trb $0202
$1f:af7b  83 02         sta $02,s
$1f:af7d  80 1d         bra $af9c
$1f:af7f  02 82         cop #$82
$1f:af81  02 97         cop #$97
$1f:af83  80 d2         bra $af57
$1f:af85  02 9b         cop #$9b
$1f:af87  10 00         bpl $af89
$1f:af89  8f af 9c af   sta $af9caf
$1f:af8d  9c af 02      stz $02af
$1f:af90  81 1a         sta ($1a,x)
$1f:af92  02 02         cop #$02
$1f:af94  83 02         sta $02,s
$1f:af96  80 1b         bra $afb3
$1f:af98  02 82         cop #$82
$1f:af9a  80 bb         bra $af57
$1f:af9c  02 96         cop #$96
$1f:af9e  02 81         cop #$81
$1f:afa0  18            clc
$1f:afa1  02 02         cop #$02
$1f:afa3  83 02         sta $02,s
$1f:afa5  80 19         bra $afc0
$1f:afa7  02 82         cop #$82
$1f:afa9  02 97         cop #$97
$1f:afab  80 aa         bra $af57
$1f:afad  bd 16 00      lda $0016,x
$1f:afb0  89 00         bit #$00
$1f:afb2  80 f0         bra $afa4
$1f:afb4  06 02         asl $02
$1f:afb6  1b            tcs
$1f:afb7  ad af 08      lda $08af
$1f:afba  00 02         brk #$02
$1f:afbc  97 02         sta [$02],y
$1f:afbe  80 22         bra $afe2
$1f:afc0  02 82         cop #$82
$1f:afc2  02 9b         cop #$9b
$1f:afc4  10 00         bpl $afc6
$1f:afc6  cc af d6      cpy $d6af
$1f:afc9  af cc af 02   lda $02afcc
$1f:afcd  9a            txs
$1f:afce  10 00         bpl $afd0
$1f:afd0  ad af f6      lda $f6af
$1f:afd3  af ad af 02   lda $02afad
$1f:afd7  9a            txs
$1f:afd8  00 00         brk #$00
$1f:afda  e0 af         cpx #$af
$1f:afdc  ea            nop
$1f:afdd  af ea af 02   lda $02afea
$1f:afe1  80 23         bra $b006
$1f:afe3  02 82         cop #$82
$1f:afe5  a9 29         lda #$29
$1f:afe7  00 80         brk #$80
$1f:afe9  2a            rol a
$1f:afea  02 80         cop #$80
$1f:afec  23 02         and $02,s
$1f:afee  82 02 96      brl $45f3
$1f:aff1  a9 29         lda #$29
$1f:aff3  00 80         brk #$80
$1f:aff5  1e 02 9b      asl $9b02,x
$1f:aff8  00 00         brk #$00
$1f:affa  00 b0         brk #$b0
$1f:affc  0a            asl a
$1f:affd  b0 0a         bcs $b009
$1f:afff  b0 02         bcs $b003
$1f:b001  80 23         bra $b026
$1f:b003  02 82         cop #$82
$1f:b005  a9 28         lda #$28
$1f:b007  00 80         brk #$80
$1f:b009  0a            asl a
$1f:b00a  02 80         cop #$80
$1f:b00c  23 02         and $02,s
$1f:b00e  82 a9 27      brl $d7ba
$1f:b011  00 80         brk #$80
$1f:b013  00 48         brk #$48
$1f:b015  02 84         cop #$84
$1f:b017  2f b0 1f 68   and $681fb0
$1f:b01b  99 1e 00      sta $001e,y
$1f:b01e  a9 00         lda #$00
$1f:b020  00 99         brk #$99
$1f:b022  20 00 02      jsr $0200
$1f:b025  97 02         sta [$02],y
$1f:b027  81 22         sta ($22,x)
$1f:b029  04 02         tsb $02
$1f:b02b  83 82         sta $82,s
$1f:b02d  7e ff a9      ror $a9ff,x
$1f:b030  00 02         brk #$02
$1f:b032  9d 16 00      sta $0016,x
$1f:b035  02 a2         cop #$a2
$1f:b037  30 02         bmi $b03b
$1f:b039  a3 02         lda $02,s
$1f:b03b  a0 fc         ldy #$fc
$1f:b03d  ff 00 64 02   sbc $026400,x
$1f:b041  91 02         sta ($02),y
$1f:b043  82 02 1c      brl $cc48
$1f:b046  00 80         brk #$80
$1f:b048  4c b0 80      jmp $80b0
$1f:b04b  f6 02         inc $02,x
$1f:b04d  86 6b         stx $6b
$1f:b04f  bd 16 00      lda $0016,x
$1f:b052  89 00         bit #$00
$1f:b054  80 f0         bra $b046
$1f:b056  06 02         asl $02
$1f:b058  1b            tcs
$1f:b059  4f b0 10 00   eor $0010b0
$1f:b05d  02 0c         cop #$0c
$1f:b05f  00 05         brk #$05
$1f:b061  65 b0         adc $b0
$1f:b063  80 f2         bra $b057
$1f:b065  02 80         cop #$80
$1f:b067  02 02         cop #$02
$1f:b069  82 02 81      brl $316e
$1f:b06c  03 02         ora $02,s
$1f:b06e  02 83         cop #$83
$1f:b070  02 80         cop #$80
$1f:b072  01 02         ora ($02,x)
$1f:b074  82 02 0c      brl $bc79
$1f:b077  00 05         brk #$05
$1f:b079  87 b0         sta [$b0]
$1f:b07b  02 80         cop #$80
$1f:b07d  02 02         cop #$02
$1f:b07f  82 02 80      brl $3084
$1f:b082  00 02         brk #$02
$1f:b084  82 80 d0      brl $8107
$1f:b087  02 9a         cop #$9a
$1f:b089  10 00         bpl $b08b
$1f:b08b  91 b0         sta ($b0),y
$1f:b08d  ab            plb
$1f:b08e  b0 9e         bcs $b02e
$1f:b090  b0 02         bcs $b094
$1f:b092  23 cf         and $cf,s
$1f:b094  b0 02         bcs $b098
$1f:b096  97 02         sta [$02],y
$1f:b098  80 06         bra $b0a0
$1f:b09a  02 82         cop #$82
$1f:b09c  80 0d         bra $b0ab
$1f:b09e  02 24         cop #$24
$1f:b0a0  cf b0 02 96   cmp $9602b0
$1f:b0a4  02 80         cop #$80
$1f:b0a6  06 02         asl $02
$1f:b0a8  82 80 00      brl $b12b
$1f:b0ab  02 9b         cop #$9b
$1f:b0ad  10 00         bpl $b0af
$1f:b0af  b5 b0         lda $b0,x
$1f:b0b1  cf b0 c2 b0   cmp $b0c2b0
$1f:b0b5  02 21         cop #$21
$1f:b0b7  cf b0 02 97   cmp $9702b0
$1f:b0bb  02 80         cop #$80
$1f:b0bd  05 02         ora $02
$1f:b0bf  82 80 0d      brl $be42
$1f:b0c2  02 22         cop #$22
$1f:b0c4  cf b0 02 97   cmp $9702b0
$1f:b0c8  02 80         cop #$80
$1f:b0ca  04 02         tsb $02
$1f:b0cc  82 80 00      brl $b14f
$1f:b0cf  02 80         cop #$80
$1f:b0d1  01 02         ora ($02,x)
$1f:b0d3  82 80 9f      brl $5056
$1f:b0d6  02 a2         cop #$a2
$1f:b0d8  00 02         brk #$02
$1f:b0da  a4 02         ldy $02
$1f:b0dc  a5 e5         lda $e5
$1f:b0de  b0 ed         bcs $b0cd
$1f:b0e0  b0 ed         bcs $b0cf
$1f:b0e2  b0 ed         bcs $b0d1
$1f:b0e4  b0 02         bcs $b0e8
$1f:b0e6  81 2c         sta ($2c,x)
$1f:b0e8  ff 02 83 80   sbc $808302,x
$1f:b0ec  f8            sed
$1f:b0ed  02 81         cop #$81
$1f:b0ef  2d ff 02      and $02ff
$1f:b0f2  83 80         sta $80,s
$1f:b0f4  f8            sed
$1f:b0f5  02 a5         cop #$a5
$1f:b0f7  ff b0 72 b1   sbc $b172b0,x
$1f:b0fb  e5 b1         sbc $b1
$1f:b0fd  5a            phy
$1f:b0fe  b2 bd         lda ($bd)
$1f:b100  16 00         asl $00,x
$1f:b102  89 00         bit #$00
$1f:b104  80 f0         bra $b0f6
$1f:b106  06 02         asl $02
$1f:b108  1b            tcs
$1f:b109  ff b0 08 00   sbc $0008b0,x
$1f:b10d  02 9a         cop #$9a
$1f:b10f  30 00         bmi $b111
$1f:b111  07 b1         ora [$b1]
$1f:b113  17 b1         ora [$b1],y
$1f:b115  07 b1         ora [$b1]
$1f:b117  02 9b         cop #$9b
$1f:b119  00 00         brk #$00
$1f:b11b  07 b1         ora [$b1]
$1f:b11d  07 b1         ora [$b1]
$1f:b11f  21 b1         and ($b1,x)
$1f:b121  bd 16 00      lda $0016,x
$1f:b124  29 ff         and #$ff
$1f:b126  df 9d 16 00   cmp $00169d,x
$1f:b12a  02 80         cop #$80
$1f:b12c  03 02         ora $02,s
$1f:b12e  82 bd 16      brl $c7ee
$1f:b131  00 29         brk #$29
$1f:b133  ff fd 9d 16   sbc $169dfd,x
$1f:b137  00 02         brk #$02
$1f:b139  80 00         bra $b13b
$1f:b13b  02 82         cop #$82
$1f:b13d  02 b2         cop #$b2
$1f:b13f  db            stp
$1f:b140  b2 1f         lda ($1f)
$1f:b142  00 00         brk #$00
$1f:b144  0c 00 00      tsb $0000
$1f:b147  02 02         cop #$02
$1f:b149  80 09         bra $b154
$1f:b14b  02 82         cop #$82
$1f:b14d  02 80         cop #$80
$1f:b14f  00 02         brk #$02
$1f:b151  82 bd 16      brl $c811
$1f:b154  00 09         brk #$09
$1f:b156  00 02         brk #$02
$1f:b158  9d 16 00      sta $0016,x
$1f:b15b  02 80         cop #$80
$1f:b15d  04 02         tsb $02
$1f:b15f  82 bd 16      brl $c81f
$1f:b162  00 09         brk #$09
$1f:b164  00 20         brk #$20
$1f:b166  9d 16 00      sta $0016,x
$1f:b169  20 cd b2      jsr $b2cd
$1f:b16c  02 1b         cop #$1b
$1f:b16e  ff b0 78 00   sbc $0078b0,x
$1f:b172  bd 16 00      lda $0016,x
$1f:b175  89 00         bit #$00
$1f:b177  80 f0         bra $b169
$1f:b179  06 02         asl $02
$1f:b17b  1b            tcs
$1f:b17c  72 b1         adc ($b1)
$1f:b17e  08            php
$1f:b17f  00 02         brk #$02
$1f:b181  9b            txy
$1f:b182  30 00         bmi $b184
$1f:b184  7a            ply
$1f:b185  b1 8a         lda ($8a),y
$1f:b187  b1 7a         lda ($7a),y
$1f:b189  b1 02         lda ($02),y
$1f:b18b  9a            txs
$1f:b18c  00 00         brk #$00
$1f:b18e  94 b1         sty $b1,x
$1f:b190  7a            ply
$1f:b191  b1 7a         lda ($7a),y
$1f:b193  b1 bd         lda ($bd),y
$1f:b195  16 00         asl $00,x
$1f:b197  29 ff         and #$ff
$1f:b199  df 9d 16 00   cmp $00169d,x
$1f:b19d  02 80         cop #$80
$1f:b19f  07 02         ora [$02]
$1f:b1a1  82 bd 16      brl $c861
$1f:b1a4  00 29         brk #$29
$1f:b1a6  ff fd 9d 16   sbc $169dfd,x
$1f:b1aa  00 02         brk #$02
$1f:b1ac  80 02         bra $b1b0
$1f:b1ae  02 82         cop #$82
$1f:b1b0  02 b2         cop #$b2
$1f:b1b2  e8            inx
$1f:b1b3  b2 1f         lda ($1f)
$1f:b1b5  f0 ff         beq $b1b6
$1f:b1b7  00 00         brk #$00
$1f:b1b9  00 02         brk #$02
$1f:b1bb  02 80         cop #$80
$1f:b1bd  0b            phd
$1f:b1be  02 82         cop #$82
$1f:b1c0  02 80         cop #$80
$1f:b1c2  02 02         cop #$02
$1f:b1c4  82 bd 16      brl $c884
$1f:b1c7  00 09         brk #$09
$1f:b1c9  00 02         brk #$02
$1f:b1cb  9d 16 00      sta $0016,x
$1f:b1ce  02 80         cop #$80
$1f:b1d0  08            php
$1f:b1d1  02 82         cop #$82
$1f:b1d3  bd 16 00      lda $0016,x
$1f:b1d6  09 00         ora #$00
$1f:b1d8  20 9d 16      jsr $169d
$1f:b1db  00 20         brk #$20
$1f:b1dd  cd b2 02      cmp $02b2
$1f:b1e0  1b            tcs
$1f:b1e1  72 b1         adc ($b1)
$1f:b1e3  78            sei
$1f:b1e4  00 bd         brk #$bd
$1f:b1e6  16 00         asl $00,x
$1f:b1e8  89 00         bit #$00
$1f:b1ea  80 f0         bra $b1dc
$1f:b1ec  06 02         asl $02
$1f:b1ee  1b            tcs
$1f:b1ef  e5 b1         sbc $b1
$1f:b1f1  08            php
$1f:b1f2  00 02         brk #$02
$1f:b1f4  9b            txy
$1f:b1f5  30 00         bmi $b1f7
$1f:b1f7  ed b1 fd      sbc $fdb1
$1f:b1fa  b1 ed         lda ($ed),y
$1f:b1fc  b1 02         lda ($02),y
$1f:b1fe  9a            txs
$1f:b1ff  00 00         brk #$00
$1f:b201  ed b1 ed      sbc $edb1
$1f:b204  b1 07         lda ($07),y
$1f:b206  b2 02         lda ($02)
$1f:b208  96 bd         stx $bd,y
$1f:b20a  16 00         asl $00,x
$1f:b20c  29 ff         and #$ff
$1f:b20e  df 9d 16 00   cmp $00169d,x
$1f:b212  02 80         cop #$80
$1f:b214  07 02         ora [$02]
$1f:b216  82 bd 16      brl $c8d6
$1f:b219  00 29         brk #$29
$1f:b21b  ff fd 9d 16   sbc $169dfd,x
$1f:b21f  00 02         brk #$02
$1f:b221  80 02         bra $b225
$1f:b223  02 82         cop #$82
$1f:b225  02 b2         cop #$b2
$1f:b227  e8            inx
$1f:b228  b2 1f         lda ($1f)
$1f:b22a  20 00 00      jsr $0000
$1f:b22d  00 00         brk #$00
$1f:b22f  02 02         cop #$02
$1f:b231  80 0b         bra $b23e
$1f:b233  02 82         cop #$82
$1f:b235  02 80         cop #$80
$1f:b237  02 02         cop #$02
$1f:b239  82 bd 16      brl $c8f9
$1f:b23c  00 09         brk #$09
$1f:b23e  00 02         brk #$02
$1f:b240  9d 16 00      sta $0016,x
$1f:b243  02 80         cop #$80
$1f:b245  08            php
$1f:b246  02 82         cop #$82
$1f:b248  bd 16 00      lda $0016,x
$1f:b24b  09 00         ora #$00
$1f:b24d  20 9d 16      jsr $169d
$1f:b250  00 20         brk #$20
$1f:b252  cd b2 02      cmp $02b2
$1f:b255  1b            tcs
$1f:b256  e5 b1         sbc $b1
$1f:b258  78            sei
$1f:b259  00 bd         brk #$bd
$1f:b25b  16 00         asl $00,x
$1f:b25d  89 00         bit #$00
$1f:b25f  80 f0         bra $b251
$1f:b261  06 02         asl $02
$1f:b263  1b            tcs
$1f:b264  5a            phy
$1f:b265  b2 08         lda ($08)
$1f:b267  00 02         brk #$02
$1f:b269  9a            txs
$1f:b26a  30 00         bmi $b26c
$1f:b26c  62 b2 72      per $2521
$1f:b26f  b2 62         lda ($62)
$1f:b271  b2 02         lda ($02)
$1f:b273  9b            txy
$1f:b274  00 00         brk #$00
$1f:b276  7c b2 62      jmp ($62b2,x)
$1f:b279  b2 62         lda ($62)
$1f:b27b  b2 bd         lda ($bd)
$1f:b27d  16 00         asl $00,x
$1f:b27f  29 ff         and #$ff
$1f:b281  df 9d 16 00   cmp $00169d,x
$1f:b285  02 80         cop #$80
$1f:b287  05 02         ora $02
$1f:b289  82 bd 16      brl $c949
$1f:b28c  00 29         brk #$29
$1f:b28e  ff fd 9d 16   sbc $169dfd,x
$1f:b292  00 02         brk #$02
$1f:b294  80 01         bra $b297
$1f:b296  02 82         cop #$82
$1f:b298  02 b2         cop #$b2
$1f:b29a  f5 b2         sbc $b2,x
$1f:b29c  1f 00 00 e0   ora $e00000,x
$1f:b2a0  ff 00 02 02   sbc $020200,x
$1f:b2a4  80 0a         bra $b2b0
$1f:b2a6  02 82         cop #$82
$1f:b2a8  02 80         cop #$80
$1f:b2aa  01 02         ora ($02,x)
$1f:b2ac  82 bd 16      brl $c96c
$1f:b2af  00 09         brk #$09
$1f:b2b1  00 02         brk #$02
$1f:b2b3  9d 16 00      sta $0016,x
$1f:b2b6  02 80         cop #$80
$1f:b2b8  06 02         asl $02
$1f:b2ba  82 bd 16      brl $c97a
$1f:b2bd  00 09         brk #$09
$1f:b2bf  00 20         brk #$20
$1f:b2c1  9d 16 00      sta $0016,x
$1f:b2c4  20 cd b2      jsr $b2cd
$1f:b2c7  02 1b         cop #$1b
$1f:b2c9  5a            phy
$1f:b2ca  b2 78         lda ($78)
$1f:b2cc  00 e2         brk #$e2
$1f:b2ce  20 bc 38      jsr $38bc
$1f:b2d1  00 b9         brk #$b9
$1f:b2d3  02 80         cop #$80
$1f:b2d5  9d 25 00      sta $0025,x
$1f:b2d8  c2 20         rep #$20
$1f:b2da  60            rts
$1f:b2db  02 a3         cop #$a3
$1f:b2dd  00 5b         brk #$5b
$1f:b2df  02 81         cop #$81
$1f:b2e1  16 08         asl $08,x
$1f:b2e3  02 83         cop #$83
$1f:b2e5  02 86         cop #$86
$1f:b2e7  6b            rtl
$1f:b2e8  02 a3         cop #$a3
$1f:b2ea  00 5b         brk #$5b
$1f:b2ec  02 81         cop #$81
$1f:b2ee  18            clc
$1f:b2ef  08            php
$1f:b2f0  02 83         cop #$83
$1f:b2f2  02 86         cop #$86
$1f:b2f4  6b            rtl
$1f:b2f5  02 a3         cop #$a3
$1f:b2f7  00 5b         brk #$5b
$1f:b2f9  02 81         cop #$81
$1f:b2fb  17 08         ora [$08],y
$1f:b2fd  02 83         cop #$83
$1f:b2ff  02 86         cop #$86
$1f:b301  6b            rtl
$1f:b302  bd 16 00      lda $0016,x
$1f:b305  89 00 80      bit #$8000
$1f:b308  f0 06         beq $b310
$1f:b30a  02 1b         cop #$1b
$1f:b30c  02 b3         cop #$b3
$1f:b30e  02 00         cop #$00
$1f:b310  02 9a         cop #$9a
$1f:b312  10 00         bpl $b314
$1f:b314  1a            inc a
$1f:b315  b3 2c         lda ($2c,s),y
$1f:b317  b3 23         lda ($23,s),y
$1f:b319  b3 02         lda ($02,s),y
$1f:b31b  97 02         sta [$02],y
$1f:b31d  80 26         bra $b345
$1f:b31f  02 82         cop #$82
$1f:b321  80 09         bra $b32c
$1f:b323  02 96         cop #$96
$1f:b325  02 80         cop #$80
$1f:b327  26 02         rol $02
$1f:b329  82 80 00      brl $b3ac
$1f:b32c  02 9b         cop #$9b
$1f:b32e  10 00         bpl $b330
$1f:b330  36 b3         rol $b3,x
$1f:b332  0a            asl a
$1f:b333  b3 3f         lda ($3f,s),y
$1f:b335  b3 02         lda ($02,s),y
$1f:b337  97 02         sta [$02],y
$1f:b339  80 25         bra $b360
$1f:b33b  02 82         cop #$82
$1f:b33d  80 c3         bra $b302
$1f:b33f  02 97         cop #$97
$1f:b341  02 80         cop #$80
$1f:b343  24 02         bit $02
$1f:b345  82 80 ba      brl $6dc8
$1f:b348  bd 16 00      lda $0016,x
$1f:b34b  89 00 80      bit #$8000
$1f:b34e  f0 06         beq $b356
$1f:b350  02 1b         cop #$1b
$1f:b352  48            pha
$1f:b353  b3 20         lda ($20,s),y
$1f:b355  00 02         brk #$02
$1f:b357  1f ad 02 03   ora $0302ad,x
$1f:b35b  29 03 00      and #$0003
$1f:b35e  f0 09         beq $b369
$1f:b360  3a            dec a
$1f:b361  f0 0f         beq $b372
$1f:b363  3a            dec a
$1f:b364  f0 15         beq $b37b
$1f:b366  3a            dec a
$1f:b367  f0 1d         beq $b386
$1f:b369  02 9d         cop #$9d
$1f:b36b  0e 02 9e      asl $9e02
$1f:b36e  50 b3         bvc $b323
$1f:b370  80 1f         bra $b391
$1f:b372  02 9d         cop #$9d
$1f:b374  0d 02 9e      ora $9e02
$1f:b377  50 b3         bvc $b32c
$1f:b379  80 16         bra $b391
$1f:b37b  02 96         cop #$96
$1f:b37d  02 9d         cop #$9d
$1f:b37f  0f 02 9e 50   ora $509e02
$1f:b383  b3 80         lda ($80,s),y
$1f:b385  0b            phd
$1f:b386  02 97         cop #$97
$1f:b388  02 9d         cop #$9d
$1f:b38a  0f 02 9e 50   ora $509e02
$1f:b38e  b3 80         lda ($80,s),y
$1f:b390  00 02         brk #$02
$1f:b392  9a            txs
$1f:b393  10 00         bpl $b395
$1f:b395  a5 b3         lda $b3
$1f:b397  9b            txy
$1f:b398  b3 af         lda ($af,s),y
$1f:b39a  b3 02         lda ($02,s),y
$1f:b39c  9b            txy
$1f:b39d  00 00         brk #$00
$1f:b39f  b9 b3 c2      lda $c2b3,y
$1f:b3a2  b3 c2         lda ($c2,s),y
$1f:b3a4  b3 02         lda ($02,s),y
$1f:b3a6  9b            txy
$1f:b3a7  10 00         bpl $b3a9
$1f:b3a9  48            pha
$1f:b3aa  b3 cb         lda ($cb,s),y
$1f:b3ac  b3 48         lda ($48,s),y
$1f:b3ae  b3 02         lda ($02,s),y
$1f:b3b0  9b            txy
$1f:b3b1  10 00         bpl $b3b3
$1f:b3b3  48            pha
$1f:b3b4  b3 d4         lda ($d4,s),y
$1f:b3b6  b3 48         lda ($48,s),y
$1f:b3b8  b3 02         lda ($02,s),y
$1f:b3ba  97 02         sta [$02],y
$1f:b3bc  85 f6         sta $f6
$1f:b3be  b3 1f         lda ($1f,s),y
$1f:b3c0  80 19         bra $b3db
$1f:b3c2  02 97         cop #$97
$1f:b3c4  02 85         cop #$85
$1f:b3c6  06 b4         asl $b4
$1f:b3c8  1f 80 10 02   ora $021080,x
$1f:b3cc  97 02         sta [$02],y
$1f:b3ce  85 16         sta $16
$1f:b3d0  b4 1f         ldy $1f,x
$1f:b3d2  80 07         bra $b3db
$1f:b3d4  02 96         cop #$96
$1f:b3d6  02 85         cop #$85
$1f:b3d8  16 b4         asl $b4,x
$1f:b3da  1f bd 16 00   ora $0016bd,x
$1f:b3de  09 00 02      ora #$0200
$1f:b3e1  9d 16 00      sta $0016,x
$1f:b3e4  02 81         cop #$81
$1f:b3e6  0c 02 02      tsb $0202
$1f:b3e9  83 bd         sta $bd,s
$1f:b3eb  16 00         asl $00,x
$1f:b3ed  29 ff fd      and #$fdff
$1f:b3f0  9d 16 00      sta $0016,x
$1f:b3f3  82 5a ff      brl $b350
$1f:b3f6  a9 00 02      lda #$0200
$1f:b3f9  9d 16 00      sta $0016,x
$1f:b3fc  02 a4         cop #$a4
$1f:b3fe  02 80         cop #$80
$1f:b400  12 02         ora ($02)
$1f:b402  82 02 86      brl $3a07
$1f:b405  6b            rtl
$1f:b406  a9 00 02      lda #$0200
$1f:b409  9d 16 00      sta $0016,x
$1f:b40c  02 a4         cop #$a4
$1f:b40e  02 80         cop #$80
$1f:b410  11 02         ora ($02),y
$1f:b412  82 02 86      brl $3a17
$1f:b415  6b            rtl
$1f:b416  a9 00 02      lda #$0200
$1f:b419  9d 16 00      sta $0016,x
$1f:b41c  02 a4         cop #$a4
$1f:b41e  bd 1c 00      lda $001c,x
$1f:b421  0a            asl a
$1f:b422  10 07         bpl $b42b
$1f:b424  02 80         cop #$80
$1f:b426  27 02         and [$02]
$1f:b428  82 80 05      brl $b9ab
$1f:b42b  02 80         cop #$80
$1f:b42d  13 02         ora ($02,s),y
$1f:b42f  82 02 86      brl $3a34
$1f:b432  6b            rtl
$1f:b433  02 15         cop #$15
$1f:b435  bd 16 00      lda $0016,x
$1f:b438  89 00 80      bit #$8000
$1f:b43b  d0 06         bne $b443
$1f:b43d  02 0c         cop #$0c
$1f:b43f  00 01         brk #$01
$1f:b441  49 b4 02      eor #$02b4
$1f:b444  1b            tcs
$1f:b445  35 b4         and $b4,x
$1f:b447  10 00         bpl $b449
$1f:b449  02 16         cop #$16
$1f:b44b  82 80 00      brl $b4ce
$1f:b44e  02 1f         cop #$1f
$1f:b450  ad 02 03      lda $0302
$1f:b453  08            php
$1f:b454  29 30 00      and #$0030
$1f:b457  18            clc
$1f:b458  69 20 00      adc #$0020
$1f:b45b  28            plp
$1f:b45c  10 04         bpl $b462
$1f:b45e  49 ff ff      eor #$ffff
$1f:b461  1a            inc a
$1f:b462  18            clc
$1f:b463  6d 74 03      adc $0374
$1f:b466  29 f0 ff      and #$fff0
$1f:b469  cd 42 03      cmp $0342
$1f:b46c  b0 70         bcs $b4de
$1f:b46e  9d 00 00      sta $0000,x
$1f:b471  02 1f         cop #$1f
$1f:b473  ad 02 03      lda $0302
$1f:b476  08            php
$1f:b477  29 30 00      and #$0030
$1f:b47a  18            clc
$1f:b47b  69 20 00      adc #$0020
$1f:b47e  28            plp
$1f:b47f  10 04         bpl $b485
$1f:b481  49 ff ff      eor #$ffff
$1f:b484  1a            inc a
$1f:b485  18            clc
$1f:b486  6d 76 03      adc $0376
$1f:b489  29 f0 ff      and #$fff0
$1f:b48c  cd 44 03      cmp $0344
$1f:b48f  b0 4d         bcs $b4de
$1f:b491  9d 02 00      sta $0002,x
$1f:b494  02 28         cop #$28
$1f:b496  de b4 bd      dec $bdb4,x
$1f:b499  16 00         asl $00,x
$1f:b49b  29 ff df      and #$dfff
$1f:b49e  9d 16 00      sta $0016,x
$1f:b4a1  00 5f         brk #$5f
$1f:b4a3  02 80         cop #$80
$1f:b4a5  10 02         bpl $b4a9
$1f:b4a7  82 bd 16      brl $cb67
$1f:b4aa  00 29         brk #$29
$1f:b4ac  ff fd 9d 16   sbc $169dfd,x
$1f:b4b0  00 02         brk #$02
$1f:b4b2  80 1c         bra $b4d0
$1f:b4b4  02 82         cop #$82
$1f:b4b6  02 80         cop #$80
$1f:b4b8  1d 02 82      ora $8202,x
$1f:b4bb  02 85         cop #$85
$1f:b4bd  e4 b4         cpx $b4
$1f:b4bf  1f 02 80 1c   ora $1c8002,x
$1f:b4c3  02 82         cop #$82
$1f:b4c5  bd 16 00      lda $0016,x
$1f:b4c8  09 00 02      ora #$0200
$1f:b4cb  9d 16 00      sta $0016,x
$1f:b4ce  00 5f         brk #$5f
$1f:b4d0  02 80         cop #$80
$1f:b4d2  10 02         bpl $b4d6
$1f:b4d4  82 bd 16      brl $cb94
$1f:b4d7  00 09         brk #$09
$1f:b4d9  00 20         brk #$20
$1f:b4db  9d 16 00      sta $0016,x
$1f:b4de  02 1b         cop #$1b
$1f:b4e0  4e b4 20      lsr $20b4
$1f:b4e3  00 a9         brk #$a9
$1f:b4e5  00 02         brk #$02
$1f:b4e7  9d 16 00      sta $0016,x
$1f:b4ea  02 a3         cop #$a3
$1f:b4ec  02 a0         cop #$a0
$1f:b4ee  f4 ff 00      pea $00ff
$1f:b4f1  5b            tcd
$1f:b4f2  02 9a         cop #$9a
$1f:b4f4  18            clc
$1f:b4f5  00 06         brk #$06
$1f:b4f7  b5 fc         lda $fc,x
$1f:b4f9  b4 10         ldy $10,x
$1f:b4fb  b5 02         lda $02,x
$1f:b4fd  9b            txy
$1f:b4fe  00 00         brk #$00
$1f:b500  58            cli
$1f:b501  b5 5e         lda $5e,x
$1f:b503  b5 32         lda $32,x
$1f:b505  b5 02         lda $02,x
$1f:b507  9b            txy
$1f:b508  18            clc
$1f:b509  00 1a         brk #$1a
$1f:b50b  b5 22         lda $22,x
$1f:b50d  b5 2a         lda $2a,x
$1f:b50f  b5 02         lda $02,x
$1f:b511  9b            txy
$1f:b512  18            clc
$1f:b513  00 4e         brk #$4e
$1f:b515  b5 44         lda $44,x
$1f:b517  b5 3a         lda $3a,x
$1f:b519  b5 02         lda $02,x
$1f:b51b  81 22         sta ($22,x)
$1f:b51d  10 02         bpl $b521
$1f:b51f  83 80         sta $80,s
$1f:b521  3c 02 81      bit $8102,x
$1f:b524  20 10 02      jsr $0210
$1f:b527  83 80         sta $80,s
$1f:b529  34 02         bit $02,x
$1f:b52b  81 21         sta ($21,x)
$1f:b52d  10 02         bpl $b531
$1f:b52f  83 80         sta $80,s
$1f:b531  2c 02 81      bit $8102
$1f:b534  1e 10 02      asl $0210,x
$1f:b537  83 80         sta $80,s
$1f:b539  24 02         bit $02
$1f:b53b  96 02         stx $02,y
$1f:b53d  81 21         sta ($21,x)
$1f:b53f  10 02         bpl $b543
$1f:b541  83 80         sta $80,s
$1f:b543  1a            inc a
$1f:b544  02 96         cop #$96
$1f:b546  02 81         cop #$81
$1f:b548  20 10 02      jsr $0210
$1f:b54b  83 80         sta $80,s
$1f:b54d  10 02         bpl $b551
$1f:b54f  96 02         stx $02,y
$1f:b551  81 22         sta ($22,x)
$1f:b553  10 02         bpl $b557
$1f:b555  83 80         sta $80,s
$1f:b557  06 02         asl $02
$1f:b559  81 1f         sta ($1f,x)
$1f:b55b  10 02         bpl $b55f
$1f:b55d  83 02         sta $02,s
$1f:b55f  86 6b         stx $6b
$1f:b561  02 ad         cop #$ad
$1f:b563  10 02         bpl $b567
$1f:b565  81 14         sta ($14,x)
$1f:b567  02 02         cop #$02
$1f:b569  83 02         sta $02,s
$1f:b56b  b2 7f         lda ($7f)
$1f:b56d  b5 1f         lda $1f,x
$1f:b56f  08            php
$1f:b570  00 fc         brk #$fc
$1f:b572  ff 00 00 02   sbc $020000,x
$1f:b576  ad 08 02      lda $0208
$1f:b579  80 14         bra $b58f
$1f:b57b  02 82         cop #$82
$1f:b57d  80 f6         bra $b575
$1f:b57f  02 a3         cop #$a3
$1f:b581  02 81         cop #$81
$1f:b583  15 02         ora $02,x
$1f:b585  02 83         cop #$83
$1f:b587  02 85         cop #$85
$1f:b589  96 ad         stx $ad,y
$1f:b58b  00 c0         brk #$c0
$1f:b58d  aa            tax
$1f:b58e  06 f0         asl $f0
$1f:b590  08            php
$1f:b591  02 81         cop #$81
$1f:b593  15 02         ora $02,x
$1f:b595  02 83         cop #$83
$1f:b597  80 ee         bra $b587
$1f:b599  02 86         cop #$86
$1f:b59b  6b            rtl
$1f:b59c  bd 1a 00      lda $001a,x
$1f:b59f  09 00 02      ora #$0200
$1f:b5a2  9d 1a 00      sta $001a,x
$1f:b5a5  02 03         cop #$03
$1f:b5a7  04 02         tsb $02
$1f:b5a9  80 28         bra $b5d3
$1f:b5ab  02 82         cop #$82
$1f:b5ad  02 80         cop #$80
$1f:b5af  2c 02 82      bit $8202
$1f:b5b2  02 04         cop #$04
$1f:b5b4  02 03         cop #$03
$1f:b5b6  04 02         tsb $02
$1f:b5b8  80 28         bra $b5e2
$1f:b5ba  02 82         cop #$82
$1f:b5bc  02 80         cop #$80
$1f:b5be  29 02 82      and #$8202
$1f:b5c1  02 04         cop #$04
$1f:b5c3  02 03         cop #$03
$1f:b5c5  04 02         tsb $02
$1f:b5c7  80 28         bra $b5f1
$1f:b5c9  02 82         cop #$82
$1f:b5cb  02 80         cop #$80
$1f:b5cd  2b            pld
$1f:b5ce  02 82         cop #$82
$1f:b5d0  02 04         cop #$04
$1f:b5d2  02 03         cop #$03
$1f:b5d4  04 02         tsb $02
$1f:b5d6  80 28         bra $b600
$1f:b5d8  02 82         cop #$82
$1f:b5da  02 80         cop #$80
$1f:b5dc  2a            rol a
$1f:b5dd  02 82         cop #$82
$1f:b5df  02 04         cop #$04
$1f:b5e1  80 c2         bra $b5a5
$1f:b5e3  bd 1a 00      lda $001a,x
$1f:b5e6  09 00 08      ora #$0800
$1f:b5e9  9d 1a 00      sta $001a,x
$1f:b5ec  bd 16 00      lda $0016,x
$1f:b5ef  89 00 80      bit #$8000
$1f:b5f2  f0 06         beq $b5fa
$1f:b5f4  02 1b         cop #$1b
$1f:b5f6  ec b5 10      cpx $10b5
$1f:b5f9  00 02         brk #$02
$1f:b5fb  a5 04         lda $04
$1f:b5fd  b6 23         ldx $23,y
$1f:b5ff  b6 42         ldx $42,y
$1f:b601  b6 61         ldx $61,y
$1f:b603  b6 02         ldx $02,y
$1f:b605  97 02         sta [$02],y
$1f:b607  80 0f         bra $b618
$1f:b609  02 82         cop #$82
$1f:b60b  02 ae         cop #$ae
$1f:b60d  f0 ff         beq $b60e
$1f:b60f  f0 ff         beq $b610
$1f:b611  61 b6         adc ($b6,x)
$1f:b613  02 ae         cop #$ae
$1f:b615  00 00         brk #$00
$1f:b617  e0 ff         cpx #$ff
$1f:b619  23 b6         and $b6,s
$1f:b61b  02 81         cop #$81
$1f:b61d  11 04         ora ($04),y
$1f:b61f  02 83         cop #$83
$1f:b621  80 e8         bra $b60b
$1f:b623  02 97         cop #$97
$1f:b625  02 80         cop #$80
$1f:b627  0f 02 82 02   ora $028202
$1f:b62b  ae f0 ff      ldx $fff0
$1f:b62e  00 00         brk #$00
$1f:b630  42 b6         wdm #$b6
$1f:b632  02 ae         cop #$ae
$1f:b634  00 00         brk #$00
$1f:b636  10 00         bpl $b638
$1f:b638  04 b6         tsb $b6
$1f:b63a  02 81         cop #$81
$1f:b63c  10 04         bpl $b642
$1f:b63e  02 83         cop #$83
$1f:b640  80 e8         bra $b62a
$1f:b642  02 96         cop #$96
$1f:b644  02 80         cop #$80
$1f:b646  0f 02 82 02   ora $028202
$1f:b64a  ae 20 00      ldx $0020
$1f:b64d  00 00         brk #$00
$1f:b64f  23 b6         and $b6,s
$1f:b651  02 ae         cop #$ae
$1f:b653  10 00         bpl $b655
$1f:b655  10 00         bpl $b657
$1f:b657  61 b6         adc ($b6,x)
$1f:b659  02 81         cop #$81
$1f:b65b  10 04         bpl $b661
$1f:b65d  02 83         cop #$83
$1f:b65f  80 e8         bra $b649
$1f:b661  02 96         cop #$96
$1f:b663  02 80         cop #$80
$1f:b665  0f 02 82 02   ora $028202
$1f:b669  ae 10 00      ldx $0010
$1f:b66c  e0 ff         cpx #$ff
$1f:b66e  42 b6         wdm #$b6
$1f:b670  02 ae         cop #$ae
$1f:b672  20 00 f0      jsr $f000
$1f:b675  ff 04 b6 02   sbc $02b604,x
$1f:b679  81 11         sta ($11,x)
$1f:b67b  04 02         tsb $02
$1f:b67d  83 80         sta $80,s
$1f:b67f  e8            inx
$1f:b680  bd 16 00      lda $0016,x
$1f:b683  89 00 80      bit #$8000
$1f:b686  f0 06         beq $b68e
$1f:b688  02 1b         cop #$1b
$1f:b68a  80 b6         bra $b642
$1f:b68c  10 00         bpl $b68e
$1f:b68e  02 80         cop #$80
$1f:b690  12 02         ora ($02)
$1f:b692  82 80 eb      brl $a215
$1f:b695  bd 16 00      lda $0016,x
$1f:b698  89 00 80      bit #$8000
$1f:b69b  f0 06         beq $b6a3
$1f:b69d  02 1b         cop #$1b
$1f:b69f  95 b6         sta $b6,x
$1f:b6a1  10 00         bpl $b6a3
$1f:b6a3  02 0c         cop #$0c
$1f:b6a5  00 06         brk #$06
$1f:b6a7  b0 b6         bcs $b65f
$1f:b6a9  02 80         cop #$80
$1f:b6ab  1a            inc a
$1f:b6ac  02 82         cop #$82
$1f:b6ae  80 e5         bra $b695
$1f:b6b0  02 80         cop #$80
$1f:b6b2  1b            tcs
$1f:b6b3  02 82         cop #$82
$1f:b6b5  02 a3         cop #$a3
$1f:b6b7  02 a2         cop #$a2
$1f:b6b9  30 02         bmi $b6bd
$1f:b6bb  9c c0 b6      stz $b6c0
$1f:b6be  dc b6 02      jml [$02b6]
$1f:b6c1  9a            txs
$1f:b6c2  00 00         brk #$00
$1f:b6c4  ca            dex
$1f:b6c5  b6 d3         ldx $d3,y
$1f:b6c7  b6 d3         ldx $d3,y
$1f:b6c9  b6 02         ldx $02,y
$1f:b6cb  97 02         sta [$02],y
$1f:b6cd  80 1e         bra $b6ed
$1f:b6cf  02 82         cop #$82
$1f:b6d1  80 e7         bra $b6ba
$1f:b6d3  02 96         cop #$96
$1f:b6d5  02 80         cop #$80
$1f:b6d7  1e 02 82      asl $8202,x
$1f:b6da  80 de         bra $b6ba
$1f:b6dc  02 9b         cop #$9b
$1f:b6de  00 00         brk #$00
$1f:b6e0  e6 b6         inc $b6
$1f:b6e2  ef b6 ef b6   sbc $b6efb6
$1f:b6e6  02 97         cop #$97
$1f:b6e8  02 80         cop #$80
$1f:b6ea  1d 02 82      ora $8202,x
$1f:b6ed  80 cb         bra $b6ba
$1f:b6ef  02 97         cop #$97
$1f:b6f1  02 80         cop #$80
$1f:b6f3  1c 02 82      trb $8202
$1f:b6f6  80 c2         bra $b6ba
$1f:b6f8  02 a5         cop #$a5
$1f:b6fa  02 b7         cop #$b7
$1f:b6fc  67 b7         adc [$b7]
$1f:b6fe  cc b7 33      cpy $33b7
$1f:b701  b8            clv
$1f:b702  02 a0         cop #$a0
$1f:b704  04 00         tsb $00
$1f:b706  bd 16 00      lda $0016,x
$1f:b709  89 00 80      bit #$8000
$1f:b70c  f0 06         beq $b714
$1f:b70e  02 1b         cop #$1b
$1f:b710  06 b7         asl $b7
$1f:b712  04 00         tsb $00
$1f:b714  02 9b         cop #$9b
$1f:b716  00 00         brk #$00
$1f:b718  0e b7 1e      asl $1eb7
$1f:b71b  b7 1e         lda [$1e],y
$1f:b71d  b7 02         lda [$02],y
$1f:b71f  9a            txs
$1f:b720  40            rti
$1f:b721  00 0e         brk #$0e
$1f:b723  b7 28         lda [$28],y
$1f:b725  b7 0e         lda [$0e],y
$1f:b727  b7 bd         lda [$bd],y
$1f:b729  16 00         asl $00,x
$1f:b72b  29 ff df      and #$dfff
$1f:b72e  9d 16 00      sta $0016,x
$1f:b731  02 80         cop #$80
$1f:b733  13 02         ora ($02,s),y
$1f:b735  82 02 85      brl $3c3a
$1f:b738  4a            lsr a
$1f:b739  b7 1f         lda [$1f],y
$1f:b73b  bd 16 00      lda $0016,x
$1f:b73e  09 00 20      ora #$2000
$1f:b741  9d 16 00      sta $0016,x
$1f:b744  02 1b         cop #$1b
$1f:b746  06 b7         asl $b7
$1f:b748  3c 00 a9      bit $a900,x
$1f:b74b  00 02         brk #$02
$1f:b74d  9d 16 00      sta $0016,x
$1f:b750  02 a0         cop #$a0
$1f:b752  08            php
$1f:b753  00 02         brk #$02
$1f:b755  a3 02         lda $02,s
$1f:b757  a2 30         ldx #$30
$1f:b759  02 80         cop #$80
$1f:b75b  14 02         trb $02
$1f:b75d  82 02 81      brl $3862
$1f:b760  17 20         ora [$20],y
$1f:b762  02 83         cop #$83
$1f:b764  02 86         cop #$86
$1f:b766  6b            rtl
$1f:b767  02 9f         cop #$9f
$1f:b769  fc ff bd      jsr ($bdff,x)
$1f:b76c  16 00         asl $00,x
$1f:b76e  89 00 80      bit #$8000
$1f:b771  f0 06         beq $b779
$1f:b773  02 1b         cop #$1b
$1f:b775  6b            rtl
$1f:b776  b7 04         lda [$04],y
$1f:b778  00 02         brk #$02
$1f:b77a  9a            txs
$1f:b77b  00 00         brk #$00
$1f:b77d  83 b7         sta $b7,s
$1f:b77f  83 b7         sta $b7,s
$1f:b781  73 b7         adc ($b7,s),y
$1f:b783  02 9b         cop #$9b
$1f:b785  40            rti
$1f:b786  00 73         brk #$73
$1f:b788  b7 8d         lda [$8d],y
$1f:b78a  b7 73         lda [$73],y
$1f:b78c  b7 bd         lda [$bd],y
$1f:b78e  16 00         asl $00,x
$1f:b790  29 ff df      and #$dfff
$1f:b793  9d 16 00      sta $0016,x
$1f:b796  02 80         cop #$80
$1f:b798  13 02         ora ($02,s),y
$1f:b79a  82 02 85      brl $3c9f
$1f:b79d  af b7 1f bd   lda $bd1fb7
$1f:b7a1  16 00         asl $00,x
$1f:b7a3  09 00 20      ora #$2000
$1f:b7a6  9d 16 00      sta $0016,x
$1f:b7a9  02 1b         cop #$1b
$1f:b7ab  6b            rtl
$1f:b7ac  b7 3c         lda [$3c],y
$1f:b7ae  00 a9         brk #$a9
$1f:b7b0  00 02         brk #$02
$1f:b7b2  9d 16 00      sta $0016,x
$1f:b7b5  02 9f         cop #$9f
$1f:b7b7  f8            sed
$1f:b7b8  ff 02 a3 02   sbc $02a302,x
$1f:b7bc  a2 30         ldx #$30
$1f:b7be  02 80         cop #$80
$1f:b7c0  16 02         asl $02,x
$1f:b7c2  82 02 81      brl $38c7
$1f:b7c5  19 20 02      ora $0220,y
$1f:b7c8  83 02         sta $02,s
$1f:b7ca  86 6b         stx $6b
$1f:b7cc  02 9f         cop #$9f
$1f:b7ce  04 00         tsb $00
$1f:b7d0  02 96         cop #$96
$1f:b7d2  bd 16 00      lda $0016,x
$1f:b7d5  89 00 80      bit #$8000
$1f:b7d8  f0 06         beq $b7e0
$1f:b7da  02 1b         cop #$1b
$1f:b7dc  d2 b7         cmp ($b7)
$1f:b7de  04 00         tsb $00
$1f:b7e0  02 9a         cop #$9a
$1f:b7e2  00 00         brk #$00
$1f:b7e4  da            phx
$1f:b7e5  b7 ea         lda [$ea],y
$1f:b7e7  b7 ea         lda [$ea],y
$1f:b7e9  b7 02         lda [$02],y
$1f:b7eb  9b            txy
$1f:b7ec  40            rti
$1f:b7ed  00 da         brk #$da
$1f:b7ef  b7 f4         lda [$f4],y
$1f:b7f1  b7 da         lda [$da],y
$1f:b7f3  b7 bd         lda [$bd],y
$1f:b7f5  16 00         asl $00,x
$1f:b7f7  29 ff df      and #$dfff
$1f:b7fa  9d 16 00      sta $0016,x
$1f:b7fd  02 80         cop #$80
$1f:b7ff  13 02         ora ($02,s),y
$1f:b801  82 02 85      brl $3d06
$1f:b804  16 b8         asl $b8,x
$1f:b806  1f bd 16 00   ora $0016bd,x
$1f:b80a  09 00 20      ora #$2000
$1f:b80d  9d 16 00      sta $0016,x
$1f:b810  02 1b         cop #$1b
$1f:b812  d2 b7         cmp ($b7)
$1f:b814  3c 00 a9      bit $a900,x
$1f:b817  00 02         brk #$02
$1f:b819  9d 16 00      sta $0016,x
$1f:b81c  02 9f         cop #$9f
$1f:b81e  08            php
$1f:b81f  00 02         brk #$02
$1f:b821  a3 02         lda $02,s
$1f:b823  a2 30         ldx #$30
$1f:b825  02 80         cop #$80
$1f:b827  16 02         asl $02,x
$1f:b829  82 02 81      brl $392e
$1f:b82c  19 20 02      ora $0220,y
$1f:b82f  83 02         sta $02,s
$1f:b831  86 6b         stx $6b
$1f:b833  02 a0         cop #$a0
$1f:b835  fc ff bd      jsr ($bdff,x)
$1f:b838  16 00         asl $00,x
$1f:b83a  89 00 80      bit #$8000
$1f:b83d  f0 06         beq $b845
$1f:b83f  02 1b         cop #$1b
$1f:b841  37 b8         and [$b8],y
$1f:b843  04 00         tsb $00
$1f:b845  02 9b         cop #$9b
$1f:b847  00 00         brk #$00
$1f:b849  4f b8 4f b8   eor $b84fb8
$1f:b84d  3f b8 02 9a   and $9a02b8,x
$1f:b851  40            rti
$1f:b852  00 3f         brk #$3f
$1f:b854  b8            clv
$1f:b855  59 b8 3f      eor $3fb8,y
$1f:b858  b8            clv
$1f:b859  bd 16 00      lda $0016,x
$1f:b85c  29 ff df      and #$dfff
$1f:b85f  9d 16 00      sta $0016,x
$1f:b862  02 80         cop #$80
$1f:b864  13 02         ora ($02,s),y
$1f:b866  82 02 85      brl $3d6b
$1f:b869  7b            tdc
$1f:b86a  b8            clv
$1f:b86b  1f bd 16 00   ora $0016bd,x
$1f:b86f  09 00 20      ora #$2000
$1f:b872  9d 16 00      sta $0016,x
$1f:b875  02 1b         cop #$1b
$1f:b877  37 b8         and [$b8],y
$1f:b879  3c 00 a9      bit $a900,x
$1f:b87c  00 02         brk #$02
$1f:b87e  9d 16 00      sta $0016,x
$1f:b881  02 a0         cop #$a0
$1f:b883  f0 ff         beq $b884
$1f:b885  02 a3         cop #$a3
$1f:b887  02 a2         cop #$a2
$1f:b889  30 02         bmi $b88d
$1f:b88b  80 15         bra $b8a2
$1f:b88d  02 82         cop #$82
$1f:b88f  02 81         cop #$81
$1f:b891  18            clc
$1f:b892  20 02 83      jsr $8302
$1f:b895  02 86         cop #$86
$1f:b897  6b            rtl
$1f:b898  bd 16 00      lda $0016,x
$1f:b89b  89 00 80      bit #$8000
$1f:b89e  f0 06         beq $b8a6
$1f:b8a0  02 1b         cop #$1b
$1f:b8a2  98            tya
$1f:b8a3  b8            clv
$1f:b8a4  10 00         bpl $b8a6
$1f:b8a6  02 9a         cop #$9a
$1f:b8a8  10 00         bpl $b8aa
$1f:b8aa  b0 b8         bcs $b864
$1f:b8ac  c2 b8         rep #$b8
$1f:b8ae  b9 b8 02      lda $02b8,y
$1f:b8b1  97 02         sta [$02],y
$1f:b8b3  80 0b         bra $b8c0
$1f:b8b5  02 82         cop #$82
$1f:b8b7  80 09         bra $b8c2
$1f:b8b9  02 96         cop #$96
$1f:b8bb  02 80         cop #$80
$1f:b8bd  0b            phd
$1f:b8be  02 82         cop #$82
$1f:b8c0  80 00         bra $b8c2
$1f:b8c2  02 9b         cop #$9b
$1f:b8c4  10 00         bpl $b8c6
$1f:b8c6  cc b8 a0      cpy $a0b8
$1f:b8c9  b8            clv
$1f:b8ca  d5 b8         cmp $b8,x
$1f:b8cc  02 97         cop #$97
$1f:b8ce  02 80         cop #$80
$1f:b8d0  07 02         ora [$02]
$1f:b8d2  82 80 c3      brl $7c55
$1f:b8d5  02 97         cop #$97
$1f:b8d7  02 80         cop #$80
$1f:b8d9  03 02         ora $02,s
$1f:b8db  82 80 ba      brl $735e
$1f:b8de  bd 16 00      lda $0016,x
$1f:b8e1  89 00 80      bit #$8000
$1f:b8e4  f0 06         beq $b8ec
$1f:b8e6  02 1b         cop #$1b
$1f:b8e8  de b8 10      dec $10b8,x
$1f:b8eb  00 02         brk #$02
$1f:b8ed  1f ad 02 03   ora $0302ad,x
$1f:b8f1  29 03 00      and #$0003
$1f:b8f4  f0 09         beq $b8ff
$1f:b8f6  3a            dec a
$1f:b8f7  f0 3e         beq $b937
$1f:b8f9  3a            dec a
$1f:b8fa  f0 70         beq $b96c
$1f:b8fc  82 a2 00      brl $b9a1
$1f:b8ff  02 97         cop #$97
$1f:b901  02 80         cop #$80
$1f:b903  02 02         cop #$02
$1f:b905  82 02 23      brl $dc0a
$1f:b908  de b8 bd      dec $bdb8,x
$1f:b90b  16 00         asl $00,x
$1f:b90d  09 00 02      ora #$0200
$1f:b910  9d 16 00      sta $0016,x
$1f:b913  02 80         cop #$80
$1f:b915  0c 02 82      tsb $8202
$1f:b918  02 a4         cop #$a4
$1f:b91a  02 81         cop #$81
$1f:b91c  0e 02 02      asl $0202
$1f:b91f  83 02         sta $02,s
$1f:b921  a7 02         lda [$02]
$1f:b923  80 0d         bra $b932
$1f:b925  02 82         cop #$82
$1f:b927  bd 16 00      lda $0016,x
$1f:b92a  29 ff fd      and #$fdff
$1f:b92d  9d 16 00      sta $0016,x
$1f:b930  02 80         cop #$80
$1f:b932  02 02         cop #$02
$1f:b934  82 80 a7      brl $60b7
$1f:b937  02 96         cop #$96
$1f:b939  02 80         cop #$80
$1f:b93b  02 02         cop #$02
$1f:b93d  82 bd 16      brl $cffd
$1f:b940  00 09         brk #$09
$1f:b942  00 02         brk #$02
$1f:b944  9d 16 00      sta $0016,x
$1f:b947  02 80         cop #$80
$1f:b949  0c 02 82      tsb $8202
$1f:b94c  02 a4         cop #$a4
$1f:b94e  02 81         cop #$81
$1f:b950  0e 02 02      asl $0202
$1f:b953  83 02         sta $02,s
$1f:b955  a7 02         lda [$02]
$1f:b957  80 0d         bra $b966
$1f:b959  02 82         cop #$82
$1f:b95b  bd 16 00      lda $0016,x
$1f:b95e  29 ff fd      and #$fdff
$1f:b961  9d 16 00      sta $0016,x
$1f:b964  02 80         cop #$80
$1f:b966  02 02         cop #$02
$1f:b968  82 82 72      brl $2bed
$1f:b96b  ff 02 97 02   sbc $029702,x
$1f:b96f  80 01         bra $b972
$1f:b971  02 82         cop #$82
$1f:b973  bd 16 00      lda $0016,x
$1f:b976  09 00 02      ora #$0200
$1f:b979  9d 16 00      sta $0016,x
$1f:b97c  02 80         cop #$80
$1f:b97e  08            php
$1f:b97f  02 82         cop #$82
$1f:b981  02 a4         cop #$a4
$1f:b983  02 81         cop #$81
$1f:b985  0a            asl a
$1f:b986  02 02         cop #$02
$1f:b988  83 02         sta $02,s
$1f:b98a  a7 02         lda [$02]
$1f:b98c  80 09         bra $b997
$1f:b98e  02 82         cop #$82
$1f:b990  bd 16 00      lda $0016,x
$1f:b993  29 ff fd      and #$fdff
$1f:b996  9d 16 00      sta $0016,x
$1f:b999  02 80         cop #$80
$1f:b99b  01 02         ora ($02,x)
$1f:b99d  82 82 3d      brl $f722
$1f:b9a0  ff 02 97 02   sbc $029702,x
$1f:b9a4  80 00         bra $b9a6
$1f:b9a6  02 82         cop #$82
$1f:b9a8  bd 16 00      lda $0016,x
$1f:b9ab  09 00 02      ora #$0200
$1f:b9ae  9d 16 00      sta $0016,x
$1f:b9b1  02 80         cop #$80
$1f:b9b3  04 02         tsb $02
$1f:b9b5  82 02 a4      brl $5dba
$1f:b9b8  02 81         cop #$81
$1f:b9ba  06 02         asl $02
$1f:b9bc  02 83         cop #$83
$1f:b9be  02 a7         cop #$a7
$1f:b9c0  02 80         cop #$80
$1f:b9c2  05 02         ora $02
$1f:b9c4  82 bd 16      brl $d084
$1f:b9c7  00 29         brk #$29
$1f:b9c9  ff fd 9d 16   sbc $169dfd,x
$1f:b9cd  00 02         brk #$02
$1f:b9cf  80 00         bra $b9d1
$1f:b9d1  02 82         cop #$82
$1f:b9d3  82 08 ff      brl $b8de
$1f:b9d6  02 ad         cop #$ad
$1f:b9d8  08            php
$1f:b9d9  02 9b         cop #$9b
$1f:b9db  00 00         brk #$00
$1f:b9dd  e3 b9         sbc $b9,s
$1f:b9df  01 ba         ora ($ba,x)
$1f:b9e1  01 ba         ora ($ba,x)
$1f:b9e3  02 97         cop #$97
$1f:b9e5  02 9b         cop #$9b
$1f:b9e7  18            clc
$1f:b9e8  00 ef         brk #$ef
$1f:b9ea  b9 68 ba      lda $ba68,y
$1f:b9ed  ef b9 02 21   sbc $2102b9
$1f:b9f1  fa            plx
$1f:b9f2  b9 02 80      lda $8002,y
$1f:b9f5  23 02         and $02,s
$1f:b9f7  82 80 dc      brl $967a
$1f:b9fa  02 80         cop #$80
$1f:b9fc  20 02 82      jsr $8202
$1f:b9ff  80 d5         bra $b9d6
$1f:ba01  02 97         cop #$97
$1f:ba03  02 9b         cop #$9b
$1f:ba05  18            clc
$1f:ba06  00 0d         brk #$0d
$1f:ba08  ba            tsx
$1f:ba09  68            pla
$1f:ba0a  ba            tsx
$1f:ba0b  0d ba 02      ora $02ba
$1f:ba0e  22 18 ba 02   jsl $02ba18
$1f:ba12  80 22         bra $ba36
$1f:ba14  02 82         cop #$82
$1f:ba16  80 be         bra $b9d6
$1f:ba18  02 80         cop #$80
$1f:ba1a  1f 02 82 80   ora $808202,x
$1f:ba1e  b7 02         lda [$02],y
$1f:ba20  ad 08 02      lda $0208
$1f:ba23  9a            txs
$1f:ba24  00 00         brk #$00
$1f:ba26  2c ba 4a      bit $4aba
$1f:ba29  ba            tsx
$1f:ba2a  4a            lsr a
$1f:ba2b  ba            tsx
$1f:ba2c  02 9a         cop #$9a
$1f:ba2e  18            clc
$1f:ba2f  00 36         brk #$36
$1f:ba31  ba            tsx
$1f:ba32  85 ba         sta $ba
$1f:ba34  36 ba         rol $ba,x
$1f:ba36  02 97         cop #$97
$1f:ba38  02 23         cop #$23
$1f:ba3a  43 ba         eor $ba,s
$1f:ba3c  02 80         cop #$80
$1f:ba3e  24 02         bit $02
$1f:ba40  82 80 dc      brl $96c3
$1f:ba43  02 80         cop #$80
$1f:ba45  21 02         and ($02,x)
$1f:ba47  82 80 d5      brl $8fca
$1f:ba4a  02 9a         cop #$9a
$1f:ba4c  18            clc
$1f:ba4d  00 54         brk #$54
$1f:ba4f  ba            tsx
$1f:ba50  85 ba         sta $ba
$1f:ba52  54 ba 02      mvn $02,$ba
$1f:ba55  96 02         stx $02,y
$1f:ba57  24 61         bit $61
$1f:ba59  ba            tsx
$1f:ba5a  02 80         cop #$80
$1f:ba5c  24 02         bit $02
$1f:ba5e  82 80 be      brl $78e1
$1f:ba61  02 80         cop #$80
$1f:ba63  21 02         and ($02,x)
$1f:ba65  82 80 b7      brl $71e8
$1f:ba68  02 1f         cop #$1f
$1f:ba6a  ad 02 03      lda $0302
$1f:ba6d  29 03 00      and #$0003
$1f:ba70  d0 ad         bne $ba1f
$1f:ba72  02 80         cop #$80
$1f:ba74  1f 02 82 02   ora $028202,x
$1f:ba78  b0 a6         bcs $ba20
$1f:ba7a  ba            tsx
$1f:ba7b  1f 00 02 02   ora $020200,x
$1f:ba7f  80 1f         bra $baa0
$1f:ba81  02 82         cop #$82
$1f:ba83  80 9a         bra $ba1f
$1f:ba85  02 1f         cop #$1f
$1f:ba87  ad 02 03      lda $0302
$1f:ba8a  29 03 00      and #$0003
$1f:ba8d  f0 03         beq $ba92
$1f:ba8f  82 44 ff      brl $b9d6
$1f:ba92  02 80         cop #$80
$1f:ba94  1f 02 82 02   ora $028202,x
$1f:ba98  b0 a6         bcs $ba40
$1f:ba9a  ba            tsx
$1f:ba9b  1f 00 02 02   ora $020200,x
$1f:ba9f  80 1f         bra $bac0
$1f:baa1  02 82         cop #$82
$1f:baa3  82 30 ff      brl $b9d6
$1f:baa6  02 a3         cop #$a3
$1f:baa8  02 a2         cop #$a2
$1f:baaa  30 00         bmi $baac
$1f:baac  64 a0         stz $a0
$1f:baae  28            plp
$1f:baaf  00 e2         brk #$e2
$1f:bab1  20 a9 00      jsr $00a9
$1f:bab4  48            pha
$1f:bab5  c2 20         rep #$20
$1f:bab7  a9 66 ad      lda #$ad66
$1f:baba  48            pha
$1f:babb  6b            rtl
$1f:babc  bd 1a 00      lda $001a,x
$1f:babf  09 00 04      ora #$0400
$1f:bac2  9d 1a 00      sta $001a,x
$1f:bac5  02 a5         cop #$a5
$1f:bac7  0b            phd
$1f:bac8  bb            tyx
$1f:bac9  f7 ba         sbc [$ba],y
$1f:bacb  cf ba e3 ba   cmp $bae3ba
$1f:bacf  02 21         cop #$21
$1f:bad1  d5 ba         cmp $ba,x
$1f:bad3  80 18         bra $baed
$1f:bad5  02 24         cop #$24
$1f:bad7  0b            phd
$1f:bad8  bb            tyx
$1f:bad9  02 96         cop #$96
$1f:badb  02 81         cop #$81
$1f:badd  27 02         and [$02]
$1f:badf  02 83         cop #$83
$1f:bae1  80 ec         bra $bacf
$1f:bae3  02 23         cop #$23
$1f:bae5  e9 ba 80      sbc #$80ba
$1f:bae8  18            clc
$1f:bae9  02 21         cop #$21
$1f:baeb  cf ba 02 97   cmp $9702ba
$1f:baef  02 81         cop #$81
$1f:baf1  26 02         rol $02
$1f:baf3  02 83         cop #$83
$1f:baf5  80 ec         bra $bae3
$1f:baf7  02 22         cop #$22
$1f:baf9  fd ba 80      sbc $80ba,x
$1f:bafc  18            clc
$1f:bafd  02 23         cop #$23
$1f:baff  e3 ba         sbc $ba,s
$1f:bb01  02 97         cop #$97
$1f:bb03  02 81         cop #$81
$1f:bb05  27 02         and [$02]
$1f:bb07  02 83         cop #$83
$1f:bb09  80 ec         bra $baf7
$1f:bb0b  02 24         cop #$24
$1f:bb0d  11 bb         ora ($bb),y
$1f:bb0f  80 c8         bra $bad9
$1f:bb11  02 22         cop #$22
$1f:bb13  f7 ba         sbc [$ba],y
$1f:bb15  02 97         cop #$97
$1f:bb17  02 81         cop #$81
$1f:bb19  25 02         and $02
$1f:bb1b  02 83         cop #$83
$1f:bb1d  80 ec         bra $bb0b
$1f:bb1f  bd 16 00      lda $0016,x
$1f:bb22  89 00 80      bit #$8000
$1f:bb25  f0 06         beq $bb2d
$1f:bb27  02 1b         cop #$1b
$1f:bb29  1f bb 10 00   ora $0010bb,x
$1f:bb2d  02 0c         cop #$0c
$1f:bb2f  00 05         brk #$05
$1f:bb31  3a            dec a
$1f:bb32  bb            tyx
$1f:bb33  02 80         cop #$80
$1f:bb35  04 02         tsb $02
$1f:bb37  82 80 e5      brl $a0ba
$1f:bb3a  02 9c         cop #$9c
$1f:bb3c  40            rti
$1f:bb3d  bb            tyx
$1f:bb3e  5c bb 02 9a   jml $9a02bb
$1f:bb42  00 00         brk #$00
$1f:bb44  4a            lsr a
$1f:bb45  bb            tyx
$1f:bb46  53 bb         eor ($bb,s),y
$1f:bb48  53 bb         eor ($bb,s),y
$1f:bb4a  02 97         cop #$97
$1f:bb4c  02 80         cop #$80
$1f:bb4e  07 02         ora [$02]
$1f:bb50  82 80 cc      brl $87d3
$1f:bb53  02 96         cop #$96
$1f:bb55  02 80         cop #$80
$1f:bb57  07 02         ora [$02]
$1f:bb59  82 80 c3      brl $7edc
$1f:bb5c  02 9b         cop #$9b
$1f:bb5e  00 00         brk #$00
$1f:bb60  66 bb         ror $bb
$1f:bb62  6f bb 6f bb   adc $bb6fbb
$1f:bb66  02 97         cop #$97
$1f:bb68  02 80         cop #$80
$1f:bb6a  06 02         asl $02
$1f:bb6c  82 80 b0      brl $6bef
$1f:bb6f  02 97         cop #$97
$1f:bb71  02 80         cop #$80
$1f:bb73  05 02         ora $02
$1f:bb75  82 80 a7      brl $62f8
$1f:bb78  bd 16 00      lda $0016,x
$1f:bb7b  89 00 80      bit #$8000
$1f:bb7e  f0 06         beq $bb86
$1f:bb80  02 1b         cop #$1b
$1f:bb82  78            sei
$1f:bb83  bb            tyx
$1f:bb84  3c 00 bd      bit $bd00,x
$1f:bb87  16 00         asl $00,x
$1f:bb89  29 ff df      and #$dfff
$1f:bb8c  9d 16 00      sta $0016,x
$1f:bb8f  02 80         cop #$80
$1f:bb91  22 02 82 bd   jsl $bd8202
$1f:bb95  16 00         asl $00,x
$1f:bb97  09 00 20      ora #$2000
$1f:bb9a  9d 16 00      sta $0016,x
$1f:bb9d  02 a0         cop #$a0
$1f:bb9f  48            pha
$1f:bba0  00 80         brk #$80
$1f:bba2  dd 02 a3      cmp $a302,x
$1f:bba5  02 a2         cop #$a2
$1f:bba7  30 02         bmi $bbab
$1f:bba9  ad 10 02      lda $0210
$1f:bbac  9a            txs
$1f:bbad  18            clc
$1f:bbae  00 b5         brk #$b5
$1f:bbb0  bb            tyx
$1f:bbb1  c9 bb b5      cmp #$b5bb
$1f:bbb4  bb            tyx
$1f:bbb5  02 9b         cop #$9b
$1f:bbb7  18            clc
$1f:bbb8  00 d3         brk #$d3
$1f:bbba  bb            tyx
$1f:bbbb  bf bb d3 bb   lda $bbd3bb,x
$1f:bbbf  02 9a         cop #$9a
$1f:bbc1  00 00         brk #$00
$1f:bbc3  01 bc         ora ($bc,x)
$1f:bbc5  09 bc 09      ora #$09bc
$1f:bbc8  bc 02 9b      ldy $9b02,x
$1f:bbcb  00 00         brk #$00
$1f:bbcd  11 bc         ora ($bc),y
$1f:bbcf  19 bc 19      ora $19bc,y
$1f:bbd2  bc 02 1f      ldy $1f02,x
$1f:bbd5  ad 02 03      lda $0302
$1f:bbd8  29 03 00      and #$0003
$1f:bbdb  f0 08         beq $bbe5
$1f:bbdd  3a            dec a
$1f:bbde  f0 0c         beq $bbec
$1f:bbe0  3a            dec a
$1f:bbe1  f0 10         beq $bbf3
$1f:bbe3  80 15         bra $bbfa
$1f:bbe5  02 80         cop #$80
$1f:bbe7  03 02         ora $02,s
$1f:bbe9  82 80 bc      brl $786c
$1f:bbec  02 80         cop #$80
$1f:bbee  2c 02 82      bit $8202
$1f:bbf1  80 b5         bra $bba8
$1f:bbf3  02 80         cop #$80
$1f:bbf5  02 02         cop #$02
$1f:bbf7  82 80 ae      brl $6a7a
$1f:bbfa  02 80         cop #$80
$1f:bbfc  01 02         ora ($02,x)
$1f:bbfe  82 80 a7      brl $6381
$1f:bc01  02 81         cop #$81
$1f:bc03  2a            rol a
$1f:bc04  02 02         cop #$02
$1f:bc06  83 80         sta $80,s
$1f:bc08  ca            dex
$1f:bc09  02 81         cop #$81
$1f:bc0b  2b            pld
$1f:bc0c  02 02         cop #$02
$1f:bc0e  83 80         sta $80,s
$1f:bc10  c2 02         rep #$02
$1f:bc12  81 29         sta ($29,x)
$1f:bc14  02 02         cop #$02
$1f:bc16  83 80         sta $80,s
$1f:bc18  ba            tsx
$1f:bc19  02 81         cop #$81
$1f:bc1b  28            plp
$1f:bc1c  02 02         cop #$02
$1f:bc1e  83 82         sta $82,s
$1f:bc20  b1 ff         lda ($ff),y
$1f:bc22  bd 1a 00      lda $001a,x
$1f:bc25  09 00 04      ora #$0400
$1f:bc28  9d 1a 00      sta $001a,x
$1f:bc2b  bd 16 00      lda $0016,x
$1f:bc2e  89 00 80      bit #$8000
$1f:bc31  f0 06         beq $bc39
$1f:bc33  02 1b         cop #$1b
$1f:bc35  2b            pld
$1f:bc36  bc 1e 00      ldy $001e,x
$1f:bc39  02 1f         cop #$1f
$1f:bc3b  ad 02 03      lda $0302
$1f:bc3e  29 03 00      and #$0003
$1f:bc41  f0 09         beq $bc4c
$1f:bc43  3a            dec a
$1f:bc44  f0 37         beq $bc7d
$1f:bc46  3a            dec a
$1f:bc47  f0 65         beq $bcae
$1f:bc49  82 94 00      brl $bce0
$1f:bc4c  02 23         cop #$23
$1f:bc4e  7d bc bd      adc $bdbc,x
$1f:bc51  1a            inc a
$1f:bc52  00 29         brk #$29
$1f:bc54  ff fb 9d 1a   sbc $1a9dfb,x
$1f:bc58  00 02         brk #$02
$1f:bc5a  80 1b         bra $bc77
$1f:bc5c  02 82         cop #$82
$1f:bc5e  02 80         cop #$80
$1f:bc60  1d 02 82      ora $8202,x
$1f:bc63  02 80         cop #$80
$1f:bc65  20 02 82      jsr $8202
$1f:bc68  02 80         cop #$80
$1f:bc6a  1c 02 82      trb $8202
$1f:bc6d  bd 1a 00      lda $001a,x
$1f:bc70  09 00 04      ora #$0400
$1f:bc73  9d 1a 00      sta $001a,x
$1f:bc76  02 80         cop #$80
$1f:bc78  1a            inc a
$1f:bc79  02 82         cop #$82
$1f:bc7b  80 b6         bra $bc33
$1f:bc7d  02 24         cop #$24
$1f:bc7f  ae bc bd      ldx $bdbc
$1f:bc82  1a            inc a
$1f:bc83  00 29         brk #$29
$1f:bc85  ff fb 9d 1a   sbc $1a9dfb,x
$1f:bc89  00 02         brk #$02
$1f:bc8b  80 1b         bra $bca8
$1f:bc8d  02 82         cop #$82
$1f:bc8f  02 80         cop #$80
$1f:bc91  1d 02 82      ora $8202,x
$1f:bc94  02 80         cop #$80
$1f:bc96  21 02         and ($02,x)
$1f:bc98  82 02 80      brl $3c9d
$1f:bc9b  1c 02 82      trb $8202
$1f:bc9e  bd 1a 00      lda $001a,x
$1f:bca1  09 00 04      ora #$0400
$1f:bca4  9d 1a 00      sta $001a,x
$1f:bca7  02 80         cop #$80
$1f:bca9  1a            inc a
$1f:bcaa  02 82         cop #$82
$1f:bcac  80 85         bra $bc33
$1f:bcae  02 21         cop #$21
$1f:bcb0  e0 bc bd      cpx #$bdbc
$1f:bcb3  1a            inc a
$1f:bcb4  00 29         brk #$29
$1f:bcb6  ff fb 9d 1a   sbc $1a9dfb,x
$1f:bcba  00 02         brk #$02
$1f:bcbc  80 1b         bra $bcd9
$1f:bcbe  02 82         cop #$82
$1f:bcc0  02 80         cop #$80
$1f:bcc2  1d 02 82      ora $8202,x
$1f:bcc5  02 80         cop #$80
$1f:bcc7  1f 02 82 02   ora $028202,x
$1f:bccb  80 1c         bra $bce9
$1f:bccd  02 82         cop #$82
$1f:bccf  bd 1a 00      lda $001a,x
$1f:bcd2  09 00 04      ora #$0400
$1f:bcd5  9d 1a 00      sta $001a,x
$1f:bcd8  02 80         cop #$80
$1f:bcda  1a            inc a
$1f:bcdb  02 82         cop #$82
$1f:bcdd  82 53 ff      brl $bc33
$1f:bce0  02 22         cop #$22
$1f:bce2  4c bc bd      jmp $bdbc
$1f:bce5  1a            inc a
$1f:bce6  00 29         brk #$29
$1f:bce8  ff fb 9d 1a   sbc $1a9dfb,x
$1f:bcec  00 02         brk #$02
$1f:bcee  80 1b         bra $bd0b
$1f:bcf0  02 82         cop #$82
$1f:bcf2  02 80         cop #$80
$1f:bcf4  1d 02 82      ora $8202,x
$1f:bcf7  02 80         cop #$80
$1f:bcf9  1e 02 82      asl $8202,x
$1f:bcfc  02 80         cop #$80
$1f:bcfe  1c 02 82      trb $8202
$1f:bd01  bd 1a 00      lda $001a,x
$1f:bd04  09 00 04      ora #$0400
$1f:bd07  9d 1a 00      sta $001a,x
$1f:bd0a  02 80         cop #$80
$1f:bd0c  1a            inc a
$1f:bd0d  02 82         cop #$82
$1f:bd0f  82 21 ff      brl $bc33
$1f:bd12  02 a5         cop #$a5
$1f:bd14  1c bd 23      trb $23bd
$1f:bd17  bd 2a bd      lda $bd2a,x
$1f:bd1a  33 bd         and ($bd,s),y
$1f:bd1c  02 80         cop #$80
$1f:bd1e  08            php
$1f:bd1f  02 82         cop #$82
$1f:bd21  80 15         bra $bd38
$1f:bd23  02 80         cop #$80
$1f:bd25  0a            asl a
$1f:bd26  02 82         cop #$82
$1f:bd28  80 0e         bra $bd38
$1f:bd2a  02 96         cop #$96
$1f:bd2c  02 80         cop #$80
$1f:bd2e  0a            asl a
$1f:bd2f  02 82         cop #$82
$1f:bd31  80 05         bra $bd38
$1f:bd33  02 80         cop #$80
$1f:bd35  09 02 82      ora #$8202
$1f:bd38  02 ad         cop #$ad
$1f:bd3a  08            php
$1f:bd3b  02 9c         cop #$9c
$1f:bd3d  41 bd         eor ($bd,x)
$1f:bd3f  c2 bd         rep #$bd
$1f:bd41  02 9a         cop #$9a
$1f:bd43  00 00         brk #$00
$1f:bd45  4b            phk
$1f:bd46  bd 86 bd      lda $bd86,x
$1f:bd49  86 bd         stx $bd
$1f:bd4b  02 97         cop #$97
$1f:bd4d  02 80         cop #$80
$1f:bd4f  0a            asl a
$1f:bd50  02 82         cop #$82
$1f:bd52  02 80         cop #$80
$1f:bd54  0d 02 82      ora $8202
$1f:bd57  02 9a         cop #$9a
$1f:bd59  00 00         brk #$00
$1f:bd5b  52 bd         eor ($bd)
$1f:bd5d  61 bd         adc ($bd,x)
$1f:bd5f  61 bd         adc ($bd,x)
$1f:bd61  bd 16 00      lda $0016,x
$1f:bd64  09 00 02      ora #$0200
$1f:bd67  9d 16 00      sta $0016,x
$1f:bd6a  02 b2         cop #$b2
$1f:bd6c  44 be 1f      mvp $1f,$be
$1f:bd6f  f8            sed
$1f:bd70  ff 08 00 00   sbc $000008,x
$1f:bd74  02 bd         cop #$bd
$1f:bd76  16 00         asl $00,x
$1f:bd78  29 ff fd      and #$fdff
$1f:bd7b  9d 16 00      sta $0016,x
$1f:bd7e  02 81         cop #$81
$1f:bd80  0a            asl a
$1f:bd81  02 02         cop #$02
$1f:bd83  83 80         sta $80,s
$1f:bd85  b2 02         lda ($02)
$1f:bd87  96 02         stx $02,y
$1f:bd89  80 0a         bra $bd95
$1f:bd8b  02 82         cop #$82
$1f:bd8d  02 80         cop #$80
$1f:bd8f  0d 02 82      ora $8202
$1f:bd92  02 9a         cop #$9a
$1f:bd94  00 00         brk #$00
$1f:bd96  9c bd 9c      stz $9cbd
$1f:bd99  bd 8d bd      lda $bd8d,x
$1f:bd9c  bd 16 00      lda $0016,x
$1f:bd9f  09 00 02      ora #$0200
$1f:bda2  9d 16 00      sta $0016,x
$1f:bda5  02 b2         cop #$b2
$1f:bda7  44 be 1f      mvp $1f,$be
$1f:bdaa  f8            sed
$1f:bdab  ff 08 00 00   sbc $000008,x
$1f:bdaf  02 bd         cop #$bd
$1f:bdb1  16 00         asl $00,x
$1f:bdb3  29 ff fd      and #$fdff
$1f:bdb6  9d 16 00      sta $0016,x
$1f:bdb9  02 81         cop #$81
$1f:bdbb  0a            asl a
$1f:bdbc  02 02         cop #$02
$1f:bdbe  83 82         sta $82,s
$1f:bdc0  76 ff         ror $ff,x
$1f:bdc2  02 9b         cop #$9b
$1f:bdc4  00 00         brk #$00
$1f:bdc6  cc bd 08      cpy $08bd
$1f:bdc9  be 08 be      ldx $be08,y
$1f:bdcc  02 97         cop #$97
$1f:bdce  02 80         cop #$80
$1f:bdd0  09 02 82      ora #$8202
$1f:bdd3  02 80         cop #$80
$1f:bdd5  0c 02 82      tsb $8202
$1f:bdd8  02 9b         cop #$9b
$1f:bdda  00 00         brk #$00
$1f:bddc  d3 bd         cmp ($bd,s),y
$1f:bdde  e2 bd         sep #$bd
$1f:bde0  e2 bd         sep #$bd
$1f:bde2  bd 16 00      lda $0016,x
$1f:bde5  09 00         ora #$00
$1f:bde7  02 9d         cop #$9d
$1f:bde9  16 00         asl $00,x
$1f:bdeb  02 b2         cop #$b2
$1f:bded  44 be 1f      mvp $1f,$be
$1f:bdf0  f8            sed
$1f:bdf1  ff 08 00 00   sbc $000008,x
$1f:bdf5  02 bd         cop #$bd
$1f:bdf7  16 00         asl $00,x
$1f:bdf9  29 ff         and #$ff
$1f:bdfb  fd 9d 16      sbc $169d,x
$1f:bdfe  00 02         brk #$02
$1f:be00  81 09         sta ($09,x)
$1f:be02  02 02         cop #$02
$1f:be04  83 82         sta $82,s
$1f:be06  30 ff         bmi $be07
$1f:be08  02 97         cop #$97
$1f:be0a  02 80         cop #$80
$1f:be0c  08            php
$1f:be0d  02 82         cop #$82
$1f:be0f  02 80         cop #$80
$1f:be11  0b            phd
$1f:be12  02 82         cop #$82
$1f:be14  02 9b         cop #$9b
$1f:be16  00 00         brk #$00
$1f:be18  1e be 1e      asl $1ebe,x
$1f:be1b  be 0f be      ldx $be0f,y
$1f:be1e  bd 16 00      lda $0016,x
$1f:be21  09 00         ora #$00
$1f:be23  02 9d         cop #$9d
$1f:be25  16 00         asl $00,x
$1f:be27  02 b2         cop #$b2
$1f:be29  44 be 1f      mvp $1f,$be
$1f:be2c  f8            sed
$1f:be2d  ff 08 00 00   sbc $000008,x
$1f:be31  02 bd         cop #$bd
$1f:be33  16 00         asl $00,x
$1f:be35  29 ff         and #$ff
$1f:be37  fd 9d 16      sbc $169d,x
$1f:be3a  00 02         brk #$02
$1f:be3c  81 08         sta ($08,x)
$1f:be3e  02 02         cop #$02
$1f:be40  83 82         sta $82,s
$1f:be42  f4 fe 02      pea $02fe
$1f:be45  a3 02         lda $02,s
$1f:be47  97 02         sta [$02],y
$1f:be49  99 02 81      sta $8102,y
$1f:be4c  10 08         bpl $be56
$1f:be4e  02 83         cop #$83
$1f:be50  00 4b         brk #$4b
$1f:be52  02 9c         cop #$9c
$1f:be54  58            cli
$1f:be55  be 62 be      ldx $be62,y
$1f:be58  02 9a         cop #$9a
$1f:be5a  00 00         brk #$00
$1f:be5c  78            sei
$1f:be5d  be 76 be      ldx $be76,y
$1f:be60  76 be         ror $be,x
$1f:be62  02 9b         cop #$9b
$1f:be64  00 00         brk #$00
$1f:be66  6c be 6e      jmp ($6ebe)
$1f:be69  be 6e be      ldx $be6e,y
$1f:be6c  02 98         cop #$98
$1f:be6e  02 81         cop #$81
$1f:be70  0e 20 02      asl $0220
$1f:be73  83 80         sta $80,s
$1f:be75  08            php
$1f:be76  02 96         cop #$96
$1f:be78  02 81         cop #$81
$1f:be7a  0f 20 02 83   ora $830220
$1f:be7e  02 86         cop #$86
$1f:be80  6b            rtl
$1f:be81  bd 25 00      lda $0025,x
$1f:be84  29 ff         and #$ff
$1f:be86  00 9d         brk #$9d
$1f:be88  30 00         bmi $be8a
$1f:be8a  02 ad         cop #$ad
$1f:be8c  08            php
$1f:be8d  02 9c         cop #$9c
$1f:be8f  93 be         sta ($be,s),y
$1f:be91  d3 be         cmp ($be,s),y
$1f:be93  02 9a         cop #$9a
$1f:be95  00 00         brk #$00
$1f:be97  9d be b8      sta $b8be,x
$1f:be9a  be b8 be      ldx $beb8,y
$1f:be9d  02 97         cop #$97
$1f:be9f  02 81         cop #$81
$1f:bea1  16 08         asl $08,x
$1f:bea3  02 83         cop #$83
$1f:bea5  20 13 bf      jsr $bf13
$1f:bea8  90 e0         bcc $be8a
$1f:beaa  02 81         cop #$81
$1f:beac  19 04 02      ora $0204,y
$1f:beaf  83 02         sta $02,s
$1f:beb1  81 13         sta ($13,x)
$1f:beb3  10 02         bpl $beb7
$1f:beb5  83 80         sta $80,s
$1f:beb7  d2 02         cmp ($02)
$1f:beb9  96 02         stx $02,y
$1f:bebb  81 16         sta ($16,x)
$1f:bebd  08            php
$1f:bebe  02 83         cop #$83
$1f:bec0  20 13 bf      jsr $bf13
$1f:bec3  90 c5         bcc $be8a
$1f:bec5  02 81         cop #$81
$1f:bec7  19 04 02      ora $0204,y
$1f:beca  83 02         sta $02,s
$1f:becc  81 13         sta ($13,x)
$1f:bece  10 02         bpl $bed2
$1f:bed0  83 80         sta $80,s
$1f:bed2  b7 02         lda [$02],y
$1f:bed4  9b            txy
$1f:bed5  00 00         brk #$00
$1f:bed7  dd be f8      cmp $f8be,x
$1f:beda  be f8 be      ldx $bef8,y
$1f:bedd  02 97         cop #$97
$1f:bedf  02 81         cop #$81
$1f:bee1  15 08         ora $08,x
$1f:bee3  02 83         cop #$83
$1f:bee5  20 13 bf      jsr $bf13
$1f:bee8  90 a0         bcc $be8a
$1f:beea  02 81         cop #$81
$1f:beec  18            clc
$1f:beed  04 02         tsb $02
$1f:beef  83 02         sta $02,s
$1f:bef1  81 12         sta ($12,x)
$1f:bef3  10 02         bpl $bef7
$1f:bef5  83 80         sta $80,s
$1f:bef7  92 02         sta ($02)
$1f:bef9  97 02         sta [$02],y
$1f:befb  81 14         sta ($14,x)
$1f:befd  08            php
$1f:befe  02 83         cop #$83
$1f:bf00  20 13 bf      jsr $bf13
$1f:bf03  90 85         bcc $be8a
$1f:bf05  02 81         cop #$81
$1f:bf07  17 04         ora [$04],y
$1f:bf09  02 83         cop #$83
$1f:bf0b  02 80         cop #$80
$1f:bf0d  11 02         ora ($02),y
$1f:bf0f  82 82 77      brl $3694
$1f:bf12  ff bd 25 00   sbc $0025bd,x
$1f:bf16  29 ff         and #$ff
$1f:bf18  00 dd         brk #$dd
$1f:bf1a  30 00         bmi $bf1c
$1f:bf1c  f0 05         beq $bf23
$1f:bf1e  9d 30 00      sta $0030,x
$1f:bf21  38            sec
$1f:bf22  60            rts
$1f:bf23  18            clc
$1f:bf24  60            rts
$1f:bf25  bd 16 00      lda $0016,x
$1f:bf28  89 00         bit #$00
$1f:bf2a  80 f0         bra $bf1c
$1f:bf2c  06 02         asl $02
$1f:bf2e  1b            tcs
$1f:bf2f  25 bf         and $bf
$1f:bf31  20 00 02      jsr $0200
$1f:bf34  19 24 2d      ora $2d24,y
$1f:bf37  bf 02 0c 00   lda $000c02,x
$1f:bf3b  02 40         cop #$40
$1f:bf3d  bf 80 ed 02   lda $02ed80,x
$1f:bf41  85 4b         sta $4b
$1f:bf43  bf 1f 02 1b   lda $1b021f,x
$1f:bf47  25 bf         and $bf
$1f:bf49  b4 00         ldy $00,x
$1f:bf4b  a9 a0         lda #$a0
$1f:bf4d  02 9d         cop #$9d
$1f:bf4f  16 00         asl $00,x
$1f:bf51  a9 ff         lda #$ff
$1f:bf53  00 9d         brk #$9d
$1f:bf55  30 00         bmi $bf57
$1f:bf57  02 a3         cop #$a3
$1f:bf59  02 a2         cop #$a2
$1f:bf5b  30 00         bmi $bf5d
$1f:bf5d  90 02         bcc $bf61
$1f:bf5f  a0 50         ldy #$50
$1f:bf61  ff 02 80 00   sbc $008002,x
$1f:bf65  02 82         cop #$82
$1f:bf67  02 85         cop #$85
$1f:bf69  88            dey
$1f:bf6a  bf 1f 02 a0   lda $a0021f,x
$1f:bf6e  80 00         bra $bf70
$1f:bf70  02 80         cop #$80
$1f:bf72  00 02         brk #$02
$1f:bf74  82 02 85      brl $4479
$1f:bf77  88            dey
$1f:bf78  bf 1f 02 a1   lda $a1021f,x
$1f:bf7c  e8            inx
$1f:bf7d  ff 48 00 02   sbc $020048,x
$1f:bf81  80 02         bra $bf85
$1f:bf83  02 82         cop #$82
$1f:bf85  02 86         cop #$86
$1f:bf87  6b            rtl
$1f:bf88  a9 ff         lda #$ff
$1f:bf8a  00 9d         brk #$9d
$1f:bf8c  30 00         bmi $bf8e
$1f:bf8e  a9 a0         lda #$a0
$1f:bf90  02 9d         cop #$9d
$1f:bf92  16 00         asl $00,x
$1f:bf94  02 a3         cop #$a3
$1f:bf96  02 a2         cop #$a2
$1f:bf98  30 02         bmi $bf9c
$1f:bf9a  80 01         bra $bf9d
$1f:bf9c  02 82         cop #$82
$1f:bf9e  02 86         cop #$86
$1f:bfa0  6b            rtl
$1f:bfa1  a9 b7         lda #$b7
$1f:bfa3  bf 9d 18 00   lda $00189d,x
$1f:bfa7  02 1f         cop #$1f
$1f:bfa9  ad 02 03      lda $0302
$1f:bfac  29 7f         and #$7f
$1f:bfae  00 18         brk #$18
$1f:bfb0  69 7f         adc #$7f
$1f:bfb2  00 9d         brk #$9d
$1f:bfb4  14 00         trb $00
$1f:bfb6  6b            rtl
$1f:bfb7  02 07         cop #$07
$1f:bfb9  03 85         ora $85,s
$1f:bfbb  c4 bf         cpy $bf
$1f:bfbd  02 85         cop #$85
$1f:bfbf  c7 bf         cmp [$bf]
$1f:bfc1  1f 80 e3 02   ora $02e380,x
$1f:bfc5  86 6b         stx $6b
$1f:bfc7  a9 01         lda #$01
$1f:bfc9  03 9d         ora $9d,s
$1f:bfcb  16 00         asl $00,x
$1f:bfcd  02 a3         cop #$a3
$1f:bfcf  00 50         brk #$50
$1f:bfd1  02 80         cop #$80
$1f:bfd3  03 02         ora $02,s
$1f:bfd5  82 02 1c      brl $dbda
$1f:bfd8  00 80         brk #$80
$1f:bfda  de bf 80      dec $80bf,x
$1f:bfdd  f3 02         sbc ($02,s),y
$1f:bfdf  1f ad 02 03   ora $0302ad,x
$1f:bfe3  29 7f         and #$7f
$1f:bfe5  00 38         brk #$38
$1f:bfe7  e9 40         sbc #$40
$1f:bfe9  00 18         brk #$18
$1f:bfeb  6d 74 03      adc $0374
$1f:bfee  9d 00 00      sta $0000,x
$1f:bff1  02 1f         cop #$1f
$1f:bff3  ad 02 03      lda $0302
$1f:bff6  29 7f         and #$7f
$1f:bff8  00 38         brk #$38
$1f:bffa  e9 40         sbc #$40
$1f:bffc  00 18         brk #$18
$1f:bffe  6d 76 03      adc $0376
$1f:c001  38            sec
$1f:c002  e9 e0         sbc #$e0
$1f:c004  00 9d         brk #$9d
$1f:c006  02 00         cop #$00
$1f:c008  02 81         cop #$81
$1f:c00a  04 07         tsb $07
$1f:c00c  02 83         cop #$83
$1f:c00e  a9 00         lda #$00
$1f:c010  02 9d         cop #$9d
$1f:c012  16 00         asl $00,x
$1f:c014  02 a6         cop #$a6
$1f:c016  02 80         cop #$80
$1f:c018  05 02         ora $02
$1f:c01a  82 02 86      brl $461f
$1f:c01d  6b            rtl
$1f:c01e  bd 16 00      lda $0016,x
$1f:c021  89 00         bit #$00
$1f:c023  80 f0         bra $c015
$1f:c025  06 02         asl $02
$1f:c027  1b            tcs
$1f:c028  1e c0 10      asl $10c0,x
$1f:c02b  00 02         brk #$02
$1f:c02d  1f ad 02 03   ora $0302ad,x
$1f:c031  29 03         and #$03
$1f:c033  00 f0         brk #$f0
$1f:c035  09 3a         ora #$3a
$1f:c037  f0 23         beq $c05c
$1f:c039  3a            dec a
$1f:c03a  f0 3d         beq $c079
$1f:c03c  3a            dec a
$1f:c03d  f0 57         beq $c096
$1f:c03f  02 97         cop #$97
$1f:c041  02 80         cop #$80
$1f:c043  09 02         ora #$02
$1f:c045  82 02 80      brl $404a
$1f:c048  06 02         asl $02
$1f:c04a  82 02 80      brl $404f
$1f:c04d  07 02         ora [$02]
$1f:c04f  82 02 85      brl $4554
$1f:c052  b4 c0         ldy $c0,x
$1f:c054  1f 02 80 06   ora $068002,x
$1f:c058  02 82         cop #$82
$1f:c05a  80 c2         bra $c01e
$1f:c05c  02 97         cop #$97
$1f:c05e  02 80         cop #$80
$1f:c060  08            php
$1f:c061  02 82         cop #$82
$1f:c063  02 80         cop #$80
$1f:c065  06 02         asl $02
$1f:c067  82 02 80      brl $406c
$1f:c06a  07 02         ora [$02]
$1f:c06c  82 02 85      brl $4571
$1f:c06f  b9 c0 1f      lda $1fc0,y
$1f:c072  02 80         cop #$80
$1f:c074  06 02         asl $02
$1f:c076  82 80 a5      brl $65f9
$1f:c079  02 96         cop #$96
$1f:c07b  02 80         cop #$80
$1f:c07d  0a            asl a
$1f:c07e  02 82         cop #$82
$1f:c080  02 80         cop #$80
$1f:c082  06 02         asl $02
$1f:c084  82 02 80      brl $4089
$1f:c087  07 02         ora [$02]
$1f:c089  82 02 85      brl $458e
$1f:c08c  be c0 1f      ldx $1fc0,y
$1f:c08f  02 80         cop #$80
$1f:c091  06 02         asl $02
$1f:c093  82 80 88      brl $4916
$1f:c096  02 97         cop #$97
$1f:c098  02 80         cop #$80
$1f:c09a  0a            asl a
$1f:c09b  02 82         cop #$82
$1f:c09d  02 80         cop #$80
$1f:c09f  06 02         asl $02
$1f:c0a1  82 02 80      brl $40a6
$1f:c0a4  07 02         ora [$02]
$1f:c0a6  82 02 85      brl $45ab
$1f:c0a9  be c0 1f      ldx $1fc0,y
$1f:c0ac  02 80         cop #$80
$1f:c0ae  06 02         asl $02
$1f:c0b0  82 82 6a      brl $2b35
$1f:c0b3  ff a9 0c 00   sbc $000ca9,x
$1f:c0b7  80 08         bra $c0c1
$1f:c0b9  a9 0b         lda #$0b
$1f:c0bb  00 80         brk #$80
$1f:c0bd  03 a9         ora $a9,s
$1f:c0bf  0d 00 9d      ora $9d00
$1f:c0c2  1e 00 9e      asl $9e00,x
$1f:c0c5  20 00 a9      jsr $a900
$1f:c0c8  06 00         asl $00
$1f:c0ca  9d 2a 00      sta $002a,x
$1f:c0cd  a9 00         lda #$00
$1f:c0cf  02 9d         cop #$9d
$1f:c0d1  16 00         asl $00,x
$1f:c0d3  02 a0         cop #$a0
$1f:c0d5  f8            sed
$1f:c0d6  ff 02 a3 02   sbc $02a302,x
$1f:c0da  a2 30         ldx #$30
$1f:c0dc  00 5b         brk #$5b
$1f:c0de  02 91         cop #$91
$1f:c0e0  02 83         cop #$83
$1f:c0e2  02 86         cop #$86
$1f:c0e4  6b            rtl
$1f:c0e5  bd 16 00      lda $0016,x
$1f:c0e8  89 00         bit #$00
$1f:c0ea  80 f0         bra $c0dc
$1f:c0ec  06 02         asl $02
$1f:c0ee  1b            tcs
$1f:c0ef  e5 c0         sbc $c0
$1f:c0f1  10 00         bpl $c0f3
$1f:c0f3  02 0c         cop #$0c
$1f:c0f5  00 04         brk #$04
$1f:c0f7  00 c1         brk #$c1
$1f:c0f9  02 80         cop #$80
$1f:c0fb  1d 02 82      ora $8202,x
$1f:c0fe  80 e5         bra $c0e5
$1f:c100  02 9c         cop #$9c
$1f:c102  06 c1         asl $c1
$1f:c104  2a            rol a
$1f:c105  c1 02         cmp ($02,x)
$1f:c107  9a            txs
$1f:c108  10 00         bpl $c10a
$1f:c10a  10 c1         bpl $c0cd
$1f:c10c  1d c1 1d      ora $1dc1,x
$1f:c10f  c1 02         cmp ($02,x)
$1f:c111  23 f9         and $f9,s
$1f:c113  c0 02         cpy #$02
$1f:c115  97 02         sta [$02],y
$1f:c117  80 20         bra $c139
$1f:c119  02 82         cop #$82
$1f:c11b  80 dc         bra $c0f9
$1f:c11d  02 24         cop #$24
$1f:c11f  f9 c0 02      sbc $02c0,y
$1f:c122  96 02         stx $02,y
$1f:c124  80 20         bra $c146
$1f:c126  02 82         cop #$82
$1f:c128  80 cf         bra $c0f9
$1f:c12a  02 9b         cop #$9b
$1f:c12c  10 00         bpl $c12e
$1f:c12e  34 c1         bit $c1,x
$1f:c130  41 c1         eor ($c1,x)
$1f:c132  41 c1         eor ($c1,x)
$1f:c134  02 21         cop #$21
$1f:c136  f9 c0 02      sbc $02c0,y
$1f:c139  97 02         sta [$02],y
$1f:c13b  80 1f         bra $c15c
$1f:c13d  02 82         cop #$82
$1f:c13f  80 b8         bra $c0f9
$1f:c141  02 22         cop #$22
$1f:c143  f9 c0 02      sbc $02c0,y
$1f:c146  97 02         sta [$02],y
$1f:c148  80 1e         bra $c168
$1f:c14a  02 82         cop #$82
$1f:c14c  80 ab         bra $c0f9
$1f:c14e  da            phx
$1f:c14f  bd 00 00      lda $0000,x
$1f:c152  85 16         sta $16
$1f:c154  bd 02 00      lda $0002,x
$1f:c157  38            sec
$1f:c158  e9 10         sbc #$10
$1f:c15a  00 85         brk #$85
$1f:c15c  18            clc
$1f:c15d  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$1f:c161  8a            txa
$1f:c162  fa            plx
$1f:c163  9d 30 00      sta $0030,x
$1f:c166  bd 16 00      lda $0016,x
$1f:c169  89 00         bit #$00
$1f:c16b  80 f0         bra $c15d
$1f:c16d  06 02         asl $02
$1f:c16f  1b            tcs
$1f:c170  66 c1         ror $c1
$1f:c172  08            php
$1f:c173  00 da         brk #$da
$1f:c175  bd 30 00      lda $0030,x
$1f:c178  aa            tax
$1f:c179  bf 00 80 7f   lda $7f8000,x
$1f:c17d  fa            plx
$1f:c17e  29 ff         and #$ff
$1f:c180  00 d0         brk #$d0
$1f:c182  03 82         ora $82,s
$1f:c184  e8            inx
$1f:c185  00 02         brk #$02
$1f:c187  9b            txy
$1f:c188  60            rts
$1f:c189  00 6e         brk #$6e
$1f:c18b  c1 90         cmp ($90,x)
$1f:c18d  c1 6e         cmp ($6e,x)
$1f:c18f  c1 02         cmp ($02,x)
$1f:c191  9a            txs
$1f:c192  00 00         brk #$00
$1f:c194  9a            txs
$1f:c195  c1 c7         cmp ($c7,x)
$1f:c197  c1 c7         cmp ($c7,x)
$1f:c199  c1 bd         cmp ($bd,x)
$1f:c19b  16 00         asl $00,x
$1f:c19d  29 ff         and #$ff
$1f:c19f  df 9d 16 00   cmp $00169d,x
$1f:c1a3  02 85         cop #$85
$1f:c1a5  0d c2 1f      ora $1fc2
$1f:c1a8  02 80         cop #$80
$1f:c1aa  2c 02 82      bit $8202
$1f:c1ad  02 85         cop #$85
$1f:c1af  23 c2         and $c2,s
$1f:c1b1  1f 02 80 2d   ora $2d8002,x
$1f:c1b5  02 82         cop #$82
$1f:c1b7  02 85         cop #$85
$1f:c1b9  0d c2 1f      ora $1fc2
$1f:c1bc  bd 16 00      lda $0016,x
$1f:c1bf  09 00         ora #$00
$1f:c1c1  20 9d 16      jsr $169d
$1f:c1c4  00 80         brk #$80
$1f:c1c6  2f 02 96 bd   and $bd9602
$1f:c1ca  16 00         asl $00,x
$1f:c1cc  29 ff         and #$ff
$1f:c1ce  df 9d 16 00   cmp $00169d,x
$1f:c1d2  02 85         cop #$85
$1f:c1d4  0d c2 1f      ora $1fc2
$1f:c1d7  02 80         cop #$80
$1f:c1d9  2c 02 82      bit $8202
$1f:c1dc  02 85         cop #$85
$1f:c1de  29 c2         and #$c2
$1f:c1e0  1f 02 80 2d   ora $2d8002,x
$1f:c1e4  02 82         cop #$82
$1f:c1e6  02 85         cop #$85
$1f:c1e8  0d c2 1f      ora $1fc2
$1f:c1eb  bd 16 00      lda $0016,x
$1f:c1ee  09 00         ora #$00
$1f:c1f0  20 9d 16      jsr $169d
$1f:c1f3  00 02         brk #$02
$1f:c1f5  97 02         sta [$02],y
$1f:c1f7  03 78         ora $78,s
$1f:c1f9  da            phx
$1f:c1fa  bd 30 00      lda $0030,x
$1f:c1fd  aa            tax
$1f:c1fe  bf 00 80 7f   lda $7f8000,x
$1f:c202  fa            plx
$1f:c203  29 ff         and #$ff
$1f:c205  00 f0         brk #$f0
$1f:c207  66 02         ror $02
$1f:c209  04 82         tsb $82
$1f:c20b  59 ff 02      eor $02ff,y
$1f:c20e  28            plp
$1f:c20f  13 c2         ora ($c2,s),y
$1f:c211  80 0d         bra $c220
$1f:c213  a9 00         lda #$00
$1f:c215  03 9d         ora $9d,s
$1f:c217  16 00         asl $00,x
$1f:c219  02 a4         cop #$a4
$1f:c21b  02 80         cop #$80
$1f:c21d  2e 02 82      rol $8202
$1f:c220  02 86         cop #$86
$1f:c222  6b            rtl
$1f:c223  02 9f         cop #$9f
$1f:c225  f8            sed
$1f:c226  ff 80 04 02   sbc $020480,x
$1f:c22a  9f 08 00 a9   sta $a90008,x
$1f:c22e  00 02         brk #$02
$1f:c230  9d 16 00      sta $0016,x
$1f:c233  02 a3         cop #$a3
$1f:c235  02 a2         cop #$a2
$1f:c237  30 00         bmi $c239
$1f:c239  5b            tcd
$1f:c23a  02 9b         cop #$9b
$1f:c23c  20 00 44      jsr $4400
$1f:c23f  c2 52         rep #$52
$1f:c241  c2 60         rep #$60
$1f:c243  c2 02         rep #$02
$1f:c245  81 33         sta ($33,x)
$1f:c247  0a            asl a
$1f:c248  02 83         cop #$83
$1f:c24a  02 80         cop #$80
$1f:c24c  39 02 82      and $8202,y
$1f:c24f  02 86         cop #$86
$1f:c251  6b            rtl
$1f:c252  02 81         cop #$81
$1f:c254  32 0a         and ($0a)
$1f:c256  02 83         cop #$83
$1f:c258  02 80         cop #$80
$1f:c25a  39 02 82      and $8202,y
$1f:c25d  02 86         cop #$86
$1f:c25f  6b            rtl
$1f:c260  02 81         cop #$81
$1f:c262  34 0a         bit $0a,x
$1f:c264  02 83         cop #$83
$1f:c266  02 80         cop #$80
$1f:c268  39 02 82      and $8202,y
$1f:c26b  02 86         cop #$86
$1f:c26d  6b            rtl
$1f:c26e  bd 16 00      lda $0016,x
$1f:c271  29 ff df      and #$dfff
$1f:c274  9d 16 00      sta $0016,x
$1f:c277  bd 1c 00      lda $001c,x
$1f:c27a  0a            asl a
$1f:c27b  30 06         bmi $c283
$1f:c27d  02 23         cop #$23
$1f:c27f  89 c2 80      bit #$80c2
$1f:c282  0b            phd
$1f:c283  02 24         cop #$24
$1f:c285  89 c2 80      bit #$80c2
$1f:c288  05 02         ora $02
$1f:c28a  87 82         sta [$82]
$1f:c28c  d8            cld
$1f:c28d  fe 02 80      inc $8002,x
$1f:c290  31 02         and ($02),y
$1f:c292  82 82 d0      brl $9317
$1f:c295  fe 02 aa      inc $aa02,x
$1f:c298  02 bd         cop #$bd
$1f:c29a  16 00         asl $00,x
$1f:c29c  89 00 80      bit #$8000
$1f:c29f  f0 06         beq $c2a7
$1f:c2a1  02 1b         cop #$1b
$1f:c2a3  99 c2 08      sta $08c2,y
$1f:c2a6  00 02         brk #$02
$1f:c2a8  9a            txs
$1f:c2a9  10 00         bpl $c2ab
$1f:c2ab  b1 c2         lda ($c2),y
$1f:c2ad  c3 c2         cmp $c2,s
$1f:c2af  ba            tsx
$1f:c2b0  c2 02         rep #$02
$1f:c2b2  97 02         sta [$02],y
$1f:c2b4  80 13         bra $c2c9
$1f:c2b6  02 82         cop #$82
$1f:c2b8  80 49         bra $c303
$1f:c2ba  02 96         cop #$96
$1f:c2bc  02 80         cop #$80
$1f:c2be  13 02         ora ($02,s),y
$1f:c2c0  82 80 40      brl $0343
$1f:c2c3  02 9b         cop #$9b
$1f:c2c5  10 00         bpl $c2c7
$1f:c2c7  cd c2 03      cmp $03c2
$1f:c2ca  c3 e8         cmp $e8,s
$1f:c2cc  c2 02         rep #$02
$1f:c2ce  97 02         sta [$02],y
$1f:c2d0  81 0f         sta ($0f,x)
$1f:c2d2  02 02         cop #$02
$1f:c2d4  83 02         sta $02,s
$1f:c2d6  81 15         sta ($15,x)
$1f:c2d8  02 02         cop #$02
$1f:c2da  83 02         sta $02,s
$1f:c2dc  85 9c         sta $9c
$1f:c2de  c3 1f         cmp $1f,s
$1f:c2e0  02 81         cop #$81
$1f:c2e2  0f 02 02 83   ora $830202
$1f:c2e6  80 1b         bra $c303
$1f:c2e8  02 97         cop #$97
$1f:c2ea  02 81         cop #$81
$1f:c2ec  0e 02 02      asl $0202
$1f:c2ef  83 02         sta $02,s
$1f:c2f1  81 14         sta ($14,x)
$1f:c2f3  02 02         cop #$02
$1f:c2f5  83 02         sta $02,s
$1f:c2f7  85 b9         sta $b9
$1f:c2f9  c3 1f         cmp $1f,s
$1f:c2fb  02 81         cop #$81
$1f:c2fd  0e 02 02      asl $0202
$1f:c300  83 80         sta $80,s
$1f:c302  00 02         brk #$02
$1f:c304  9b            txy
$1f:c305  10 00         bpl $c307
$1f:c307  0d c3 20      ora $20c3
$1f:c30a  c3 16         cmp $16,s
$1f:c30c  c3 02         cmp $02,s
$1f:c30e  97 02         sta [$02],y
$1f:c310  80 12         bra $c324
$1f:c312  02 82         cop #$82
$1f:c314  80 83         bra $c299
$1f:c316  02 97         cop #$97
$1f:c318  02 80         cop #$80
$1f:c31a  11 02         ora ($02),y
$1f:c31c  82 82 79      brl $3ca1
$1f:c31f  ff 02 9a 10   sbc $109a02,x
$1f:c323  00 2a         brk #$2a
$1f:c325  c3 a1         cmp $a1,s
$1f:c327  c2 46         rep #$46
$1f:c329  c3 02         cmp $02,s
$1f:c32b  97 02         sta [$02],y
$1f:c32d  81 10         sta ($10,x)
$1f:c32f  02 02         cop #$02
$1f:c331  83 02         sta $02,s
$1f:c333  81 16         sta ($16,x)
$1f:c335  02 02         cop #$02
$1f:c337  83 02         sta $02,s
$1f:c339  85 62         sta $62
$1f:c33b  c3 1f         cmp $1f,s
$1f:c33d  02 81         cop #$81
$1f:c33f  10 02         bpl $c343
$1f:c341  02 83         cop #$83
$1f:c343  82 5b ff      brl $c2a1
$1f:c346  02 96         cop #$96
$1f:c348  02 81         cop #$81
$1f:c34a  10 02         bpl $c34e
$1f:c34c  02 83         cop #$83
$1f:c34e  02 81         cop #$81
$1f:c350  16 02         asl $02,x
$1f:c352  02 83         cop #$83
$1f:c354  02 85         cop #$85
$1f:c356  7f c3 1f 02   adc $021fc3,x
$1f:c35a  81 10         sta ($10,x)
$1f:c35c  02 02         cop #$02
$1f:c35e  83 82         sta $82,s
$1f:c360  3f ff 20 d6   and $d620ff,x
$1f:c364  c3 02         cmp $02,s
$1f:c366  80 1b         bra $c383
$1f:c368  02 82         cop #$82
$1f:c36a  02 a6         cop #$a6
$1f:c36c  02 23         cop #$23
$1f:c36e  77 c3         adc [$c3],y
$1f:c370  02 80         cop #$80
$1f:c372  37 02         and [$02],y
$1f:c374  82 80 f5      brl $b8f7
$1f:c377  02 80         cop #$80
$1f:c379  38            sec
$1f:c37a  02 82         cop #$82
$1f:c37c  02 86         cop #$86
$1f:c37e  6b            rtl
$1f:c37f  20 d6 c3      jsr $c3d6
$1f:c382  02 80         cop #$80
$1f:c384  1b            tcs
$1f:c385  02 82         cop #$82
$1f:c387  02 a6         cop #$a6
$1f:c389  02 24         cop #$24
$1f:c38b  94 c3         sty $c3,x
$1f:c38d  02 80         cop #$80
$1f:c38f  37 02         and [$02],y
$1f:c391  82 80 f5      brl $b914
$1f:c394  02 80         cop #$80
$1f:c396  38            sec
$1f:c397  02 82         cop #$82
$1f:c399  02 86         cop #$86
$1f:c39b  6b            rtl
$1f:c39c  20 d6 c3      jsr $c3d6
$1f:c39f  02 80         cop #$80
$1f:c3a1  19 02 82      ora $8202,y
$1f:c3a4  02 a6         cop #$a6
$1f:c3a6  02 21         cop #$21
$1f:c3a8  b1 c3         lda ($c3),y
$1f:c3aa  02 80         cop #$80
$1f:c3ac  36 02         rol $02,x
$1f:c3ae  82 80 f5      brl $b931
$1f:c3b1  02 80         cop #$80
$1f:c3b3  38            sec
$1f:c3b4  02 82         cop #$82
$1f:c3b6  02 86         cop #$86
$1f:c3b8  6b            rtl
$1f:c3b9  20 d6 c3      jsr $c3d6
$1f:c3bc  02 80         cop #$80
$1f:c3be  17 02         ora [$02],y
$1f:c3c0  82 02 a6      brl $69c5
$1f:c3c3  02 22         cop #$22
$1f:c3c5  ce c3 02      dec $02c3
$1f:c3c8  80 35         bra $c3ff
$1f:c3ca  02 82         cop #$82
$1f:c3cc  80 f5         bra $c3c3
$1f:c3ce  02 80         cop #$80
$1f:c3d0  38            sec
$1f:c3d1  02 82         cop #$82
$1f:c3d3  02 86         cop #$86
$1f:c3d5  6b            rtl
$1f:c3d6  a9 02 02      lda #$0202
$1f:c3d9  9d 16 00      sta $0016,x
$1f:c3dc  02 aa         cop #$aa
$1f:c3de  02 02         cop #$02
$1f:c3e0  a3 02         lda $02,s
$1f:c3e2  a0 ee ff      ldy #$ffee
$1f:c3e5  00 61         brk #$61
$1f:c3e7  60            rts
$1f:c3e8  bd 1a 00      lda $001a,x
$1f:c3eb  09 00 04      ora #$0400
$1f:c3ee  9d 1a 00      sta $001a,x
$1f:c3f1  02 aa         cop #$aa
$1f:c3f3  04 bd         tsb $bd
$1f:c3f5  16 00         asl $00,x
$1f:c3f7  89 00 80      bit #$8000
$1f:c3fa  f0 06         beq $c402
$1f:c3fc  02 1b         cop #$1b
$1f:c3fe  f4 c3 08      pea $08c3
$1f:c401  00 02         brk #$02
$1f:c403  9a            txs
$1f:c404  10 00         bpl $c406
$1f:c406  0c c4 1e      tsb $1ec4
$1f:c409  c4 15         cpy $15
$1f:c40b  c4 02         cpy $02
$1f:c40d  97 02         sta [$02],y
$1f:c40f  80 13         bra $c424
$1f:c411  02 82         cop #$82
$1f:c413  80 43         bra $c458
$1f:c415  02 96         cop #$96
$1f:c417  02 80         cop #$80
$1f:c419  13 02         ora ($02,s),y
$1f:c41b  82 80 3a      brl $fe9e
$1f:c41e  02 9b         cop #$9b
$1f:c420  10 00         bpl $c422
$1f:c422  28            plp
$1f:c423  c4 58         cpy $58
$1f:c425  c4 40         cpy $40
$1f:c427  c4 02         cpy $02
$1f:c429  97 02         sta [$02],y
$1f:c42b  80 0f         bra $c43c
$1f:c42d  02 82         cop #$82
$1f:c42f  02 80         cop #$80
$1f:c431  15 02         ora $02,x
$1f:c433  82 02 85      brl $4938
$1f:c436  ea            nop
$1f:c437  c4 1f         cpy $1f
$1f:c439  02 80         cop #$80
$1f:c43b  0f 02 82 80   ora $808202
$1f:c43f  18            clc
$1f:c440  02 97         cop #$97
$1f:c442  02 80         cop #$80
$1f:c444  0e 02 82      asl $8202
$1f:c447  02 80         cop #$80
$1f:c449  14 02         trb $02
$1f:c44b  82 02 85      brl $4950
$1f:c44e  07 c5         ora [$c5]
$1f:c450  1f 02 80 0e   ora $0e8002,x
$1f:c454  02 82         cop #$82
$1f:c456  80 00         bra $c458
$1f:c458  02 9b         cop #$9b
$1f:c45a  10 00         bpl $c45c
$1f:c45c  62 c4 74      per $3923
$1f:c45f  c4 6b         cpy $6b
$1f:c461  c4 02         cpy $02
$1f:c463  97 02         sta [$02],y
$1f:c465  80 12         bra $c479
$1f:c467  02 82         cop #$82
$1f:c469  80 89         bra $c3f4
$1f:c46b  02 97         cop #$97
$1f:c46d  02 80         cop #$80
$1f:c46f  11 02         ora ($02),y
$1f:c471  82 80 80      brl $44f4
$1f:c474  02 9a         cop #$9a
$1f:c476  10 00         bpl $c478
$1f:c478  7e c4 fc      ror $fcc4,x
$1f:c47b  c3 97         cmp $97,s
$1f:c47d  c4 02         cpy $02
$1f:c47f  97 02         sta [$02],y
$1f:c481  80 10         bra $c493
$1f:c483  02 82         cop #$82
$1f:c485  02 80         cop #$80
$1f:c487  16 02         asl $02,x
$1f:c489  82 02 85      brl $498e
$1f:c48c  b0 c4         bcs $c452
$1f:c48e  1f 02 80 10   ora $108002,x
$1f:c492  02 82         cop #$82
$1f:c494  82 65 ff      brl $c3fc
$1f:c497  02 96         cop #$96
$1f:c499  02 80         cop #$80
$1f:c49b  10 02         bpl $c49f
$1f:c49d  82 02 80      brl $44a2
$1f:c4a0  16 02         asl $02,x
$1f:c4a2  82 02 85      brl $49a7
$1f:c4a5  cd c4 1f      cmp $1fc4
$1f:c4a8  02 80         cop #$80
$1f:c4aa  10 02         bpl $c4ae
$1f:c4ac  82 82 4c      brl $1131
$1f:c4af  ff 20 24 c5   sbc $c52420,x
$1f:c4b3  02 80         cop #$80
$1f:c4b5  1b            tcs
$1f:c4b6  02 82         cop #$82
$1f:c4b8  02 a6         cop #$a6
$1f:c4ba  02 23         cop #$23
$1f:c4bc  c5 c4         cmp $c4
$1f:c4be  02 80         cop #$80
$1f:c4c0  37 02         and [$02],y
$1f:c4c2  82 80 f5      brl $ba45
$1f:c4c5  02 80         cop #$80
$1f:c4c7  38            sec
$1f:c4c8  02 82         cop #$82
$1f:c4ca  02 86         cop #$86
$1f:c4cc  6b            rtl
$1f:c4cd  20 24 c5      jsr $c524
$1f:c4d0  02 80         cop #$80
$1f:c4d2  1b            tcs
$1f:c4d3  02 82         cop #$82
$1f:c4d5  02 a6         cop #$a6
$1f:c4d7  02 24         cop #$24
$1f:c4d9  e2 c4         sep #$c4
$1f:c4db  02 80         cop #$80
$1f:c4dd  37 02         and [$02],y
$1f:c4df  82 80 f5      brl $ba62
$1f:c4e2  02 80         cop #$80
$1f:c4e4  38            sec
$1f:c4e5  02 82         cop #$82
$1f:c4e7  02 86         cop #$86
$1f:c4e9  6b            rtl
$1f:c4ea  20 24 c5      jsr $c524
$1f:c4ed  02 80         cop #$80
$1f:c4ef  19 02 82      ora $8202,y
$1f:c4f2  02 a6         cop #$a6
$1f:c4f4  02 21         cop #$21
$1f:c4f6  ff c4 02 80   sbc $8002c4,x
$1f:c4fa  36 02         rol $02,x
$1f:c4fc  82 80 f5      brl $ba7f
$1f:c4ff  02 80         cop #$80
$1f:c501  38            sec
$1f:c502  02 82         cop #$82
$1f:c504  02 86         cop #$86
$1f:c506  6b            rtl
$1f:c507  20 24 c5      jsr $c524
$1f:c50a  02 80         cop #$80
$1f:c50c  17 02         ora [$02],y
$1f:c50e  82 02 a6      brl $6b13
$1f:c511  02 22         cop #$22
$1f:c513  1c c5 02      trb $02c5
$1f:c516  80 35         bra $c54d
$1f:c518  02 82         cop #$82
$1f:c51a  80 f5         bra $c511
$1f:c51c  02 80         cop #$80
$1f:c51e  38            sec
$1f:c51f  02 82         cop #$82
$1f:c521  02 86         cop #$86
$1f:c523  6b            rtl
$1f:c524  a9 02 02      lda #$0202
$1f:c527  9d 16 00      sta $0016,x
$1f:c52a  02 aa         cop #$aa
$1f:c52c  04 02         tsb $02
$1f:c52e  a3 02         lda $02,s
$1f:c530  a0 ee ff      ldy #$ffee
$1f:c533  00 61         brk #$61
$1f:c535  60            rts
$1f:c536  02 a3         cop #$a3
$1f:c538  02 a2         cop #$a2
$1f:c53a  30 02         bmi $c53e
$1f:c53c  0c 00 10      tsb $1000
$1f:c53f  47 c5         eor [$c5]
$1f:c541  02 1b         cop #$1b
$1f:c543  3b            tsc
$1f:c544  c5 10         cmp $10
$1f:c546  00 02         brk #$02
$1f:c548  9a            txs
$1f:c549  18            clc
$1f:c54a  00 51         brk #$51
$1f:c54c  c5 19         cmp $19
$1f:c54e  c6 5b         dec $5b
$1f:c550  c5 02         cmp $02
$1f:c552  9b            txy
$1f:c553  18            clc
$1f:c554  00 bf         brk #$bf
$1f:c556  c5 aa         cmp $aa
$1f:c558  c6 ec         dec $ec
$1f:c55a  c5 02         cmp $02
$1f:c55c  9b            txy
$1f:c55d  18            clc
$1f:c55e  00 65         brk #$65
$1f:c560  c5 7d         cmp $7d
$1f:c562  c6 92         dec $92
$1f:c564  c5 02         cmp $02
$1f:c566  96 02         stx $02,y
$1f:c568  81 25         sta ($25,x)
$1f:c56a  04 02         tsb $02
$1f:c56c  83 02         sta $02,s
$1f:c56e  0c 00 04      tsb $0400
$1f:c571  75 c5         adc $c5,x
$1f:c573  80 14         bra $c589
$1f:c575  02 80         cop #$80
$1f:c577  26 02         rol $02
$1f:c579  82 02 85      brl $4a7e
$1f:c57c  d7 c6         cmp [$c6],y
$1f:c57e  1f 02 80 27   ora $278002,x
$1f:c582  02 82         cop #$82
$1f:c584  02 80         cop #$80
$1f:c586  28            plp
$1f:c587  02 82         cop #$82
$1f:c589  02 81         cop #$81
$1f:c58b  25 04         and $04
$1f:c58d  02 83         cop #$83
$1f:c58f  82 a9 ff      brl $c53b
$1f:c592  02 96         cop #$96
$1f:c594  02 81         cop #$81
$1f:c596  24 04         bit $04
$1f:c598  02 83         cop #$83
$1f:c59a  02 0c         cop #$0c
$1f:c59c  00 04         brk #$04
$1f:c59e  a2 c5 80      ldx #$80c5
$1f:c5a1  14 02         trb $02
$1f:c5a3  80 26         bra $c5cb
$1f:c5a5  02 82         cop #$82
$1f:c5a7  02 85         cop #$85
$1f:c5a9  d7 c6         cmp [$c6],y
$1f:c5ab  1f 02 80 27   ora $278002,x
$1f:c5af  02 82         cop #$82
$1f:c5b1  02 80         cop #$80
$1f:c5b3  28            plp
$1f:c5b4  02 82         cop #$82
$1f:c5b6  02 81         cop #$81
$1f:c5b8  24 04         bit $04
$1f:c5ba  02 83         cop #$83
$1f:c5bc  82 7c ff      brl $c53b
$1f:c5bf  02 97         cop #$97
$1f:c5c1  02 81         cop #$81
$1f:c5c3  25 04         and $04
$1f:c5c5  02 83         cop #$83
$1f:c5c7  02 0c         cop #$0c
$1f:c5c9  00 04         brk #$04
$1f:c5cb  cf c5 80 14   cmp $1480c5
$1f:c5cf  02 80         cop #$80
$1f:c5d1  26 02         rol $02
$1f:c5d3  82 02 85      brl $4ad8
$1f:c5d6  d7 c6         cmp [$c6],y
$1f:c5d8  1f 02 80 27   ora $278002,x
$1f:c5dc  02 82         cop #$82
$1f:c5de  02 80         cop #$80
$1f:c5e0  28            plp
$1f:c5e1  02 82         cop #$82
$1f:c5e3  02 81         cop #$81
$1f:c5e5  25 04         and $04
$1f:c5e7  02 83         cop #$83
$1f:c5e9  82 4f ff      brl $c53b
$1f:c5ec  02 97         cop #$97
$1f:c5ee  02 81         cop #$81
$1f:c5f0  24 04         bit $04
$1f:c5f2  02 83         cop #$83
$1f:c5f4  02 0c         cop #$0c
$1f:c5f6  00 04         brk #$04
$1f:c5f8  fc c5 80      jsr ($80c5,x)
$1f:c5fb  14 02         trb $02
$1f:c5fd  80 26         bra $c625
$1f:c5ff  02 82         cop #$82
$1f:c601  02 85         cop #$85
$1f:c603  d7 c6         cmp [$c6],y
$1f:c605  1f 02 80 27   ora $278002,x
$1f:c609  02 82         cop #$82
$1f:c60b  02 80         cop #$80
$1f:c60d  28            plp
$1f:c60e  02 82         cop #$82
$1f:c610  02 81         cop #$81
$1f:c612  24 04         bit $04
$1f:c614  02 83         cop #$83
$1f:c616  82 22 ff      brl $c53b
$1f:c619  02 9b         cop #$9b
$1f:c61b  00 00         brk #$00
$1f:c61d  50 c6         bvc $c5e5
$1f:c61f  50 c6         bvc $c5e7
$1f:c621  23 c6         and $c6,s
$1f:c623  02 97         cop #$97
$1f:c625  02 81         cop #$81
$1f:c627  21 04         and ($04,x)
$1f:c629  02 83         cop #$83
$1f:c62b  02 0c         cop #$0c
$1f:c62d  00 04         brk #$04
$1f:c62f  33 c6         and ($c6,s),y
$1f:c631  80 14         bra $c647
$1f:c633  02 80         cop #$80
$1f:c635  26 02         rol $02
$1f:c637  82 02 85      brl $4b3c
$1f:c63a  d7 c6         cmp [$c6],y
$1f:c63c  1f 02 80 27   ora $278002,x
$1f:c640  02 82         cop #$82
$1f:c642  02 80         cop #$80
$1f:c644  28            plp
$1f:c645  02 82         cop #$82
$1f:c647  02 81         cop #$81
$1f:c649  21 04         and ($04,x)
$1f:c64b  02 83         cop #$83
$1f:c64d  82 eb fe      brl $c53b
$1f:c650  02 97         cop #$97
$1f:c652  02 81         cop #$81
$1f:c654  22 04 02 83   jsl $830204
$1f:c658  02 0c         cop #$0c
$1f:c65a  00 04         brk #$04
$1f:c65c  60            rts
$1f:c65d  c6 80         dec $80
$1f:c65f  14 02         trb $02
$1f:c661  80 26         bra $c689
$1f:c663  02 82         cop #$82
$1f:c665  02 85         cop #$85
$1f:c667  d7 c6         cmp [$c6],y
$1f:c669  1f 02 80 27   ora $278002,x
$1f:c66d  02 82         cop #$82
$1f:c66f  02 80         cop #$80
$1f:c671  28            plp
$1f:c672  02 82         cop #$82
$1f:c674  02 81         cop #$81
$1f:c676  22 04 02 83   jsl $830204
$1f:c67a  82 be fe      brl $c53b
$1f:c67d  02 96         cop #$96
$1f:c67f  02 81         cop #$81
$1f:c681  23 04         and $04,s
$1f:c683  02 83         cop #$83
$1f:c685  02 0c         cop #$0c
$1f:c687  00 04         brk #$04
$1f:c689  8d c6 80      sta $80c6
$1f:c68c  14 02         trb $02
$1f:c68e  80 26         bra $c6b6
$1f:c690  02 82         cop #$82
$1f:c692  02 85         cop #$85
$1f:c694  d7 c6         cmp [$c6],y
$1f:c696  1f 02 80 27   ora $278002,x
$1f:c69a  02 82         cop #$82
$1f:c69c  02 80         cop #$80
$1f:c69e  28            plp
$1f:c69f  02 82         cop #$82
$1f:c6a1  02 81         cop #$81
$1f:c6a3  23 04         and $04,s
$1f:c6a5  02 83         cop #$83
$1f:c6a7  82 91 fe      brl $c53b
$1f:c6aa  02 97         cop #$97
$1f:c6ac  02 81         cop #$81
$1f:c6ae  23 04         and $04,s
$1f:c6b0  02 83         cop #$83
$1f:c6b2  02 0c         cop #$0c
$1f:c6b4  00 04         brk #$04
$1f:c6b6  ba            tsx
$1f:c6b7  c6 80         dec $80
$1f:c6b9  14 02         trb $02
$1f:c6bb  80 26         bra $c6e3
$1f:c6bd  02 82         cop #$82
$1f:c6bf  02 85         cop #$85
$1f:c6c1  d7 c6         cmp [$c6],y
$1f:c6c3  1f 02 80 27   ora $278002,x
$1f:c6c7  02 82         cop #$82
$1f:c6c9  02 80         cop #$80
$1f:c6cb  28            plp
$1f:c6cc  02 82         cop #$82
$1f:c6ce  02 81         cop #$81
$1f:c6d0  23 04         and $04,s
$1f:c6d2  02 83         cop #$83
$1f:c6d4  82 64 fe      brl $c53b
$1f:c6d7  a9 00 02      lda #$0200
$1f:c6da  9d 16 00      sta $0016,x
$1f:c6dd  02 a0         cop #$a0
$1f:c6df  1c 00 00      trb $0000
$1f:c6e2  56 02         lsr $02,x
$1f:c6e4  80 29         bra $c70f
$1f:c6e6  02 82         cop #$82
$1f:c6e8  02 9a         cop #$9a
$1f:c6ea  00 00         brk #$00
$1f:c6ec  f2 c6         sbc ($c6)
$1f:c6ee  fc c6 fc      jsr ($fcc6,x)
$1f:c6f1  c6 02         dec $02
$1f:c6f3  9b            txy
$1f:c6f4  00 00         brk #$00
$1f:c6f6  06 c7         asl $c7
$1f:c6f8  10 c7         bpl $c6c1
$1f:c6fa  10 c7         bpl $c6c3
$1f:c6fc  02 9b         cop #$9b
$1f:c6fe  00 00         brk #$00
$1f:c700  1a            inc a
$1f:c701  c7 24         cmp [$24]
$1f:c703  c7 24         cmp [$24]
$1f:c705  c7 02         cmp [$02]
$1f:c707  97 02         sta [$02],y
$1f:c709  81 2b         sta ($2b,x)
$1f:c70b  08            php
$1f:c70c  02 83         cop #$83
$1f:c70e  80 1c         bra $c72c
$1f:c710  02 97         cop #$97
$1f:c712  02 81         cop #$81
$1f:c714  2a            rol a
$1f:c715  08            php
$1f:c716  02 83         cop #$83
$1f:c718  80 12         bra $c72c
$1f:c71a  02 96         cop #$96
$1f:c71c  02 81         cop #$81
$1f:c71e  2b            pld
$1f:c71f  08            php
$1f:c720  02 83         cop #$83
$1f:c722  80 08         bra $c72c
$1f:c724  02 96         cop #$96
$1f:c726  02 81         cop #$81
$1f:c728  2a            rol a
$1f:c729  08            php
$1f:c72a  02 83         cop #$83
$1f:c72c  02 86         cop #$86
$1f:c72e  6b            rtl
$1f:c72f  02 a4         cop #$a4
$1f:c731  02 a5         cop #$a5
$1f:c733  66 c7         ror $c7
$1f:c735  bc c7 91      ldy $91c7,x
$1f:c738  c7 3b         cmp [$3b]
$1f:c73a  c7 02         cmp [$02]
$1f:c73c  ad 08 02      lda $0208
$1f:c73f  0c 00 02      tsb $0200
$1f:c742  e7 c7         sbc [$c7]
$1f:c744  02 21         cop #$21
$1f:c746  73 c7         adc ($c7,s),y
$1f:c748  02 80         cop #$80
$1f:c74a  09 02 82      ora #$8202
$1f:c74d  02 85         cop #$85
$1f:c74f  35 c8         and $c8,x
$1f:c751  1f 02 a0 f8   ora $f8a002,x
$1f:c755  ff 02 80 09   sbc $098002,x
$1f:c759  02 82         cop #$82
$1f:c75b  02 85         cop #$85
$1f:c75d  35 c8         and $c8,x
$1f:c75f  1f 02 a0 f8   ora $f8a002,x
$1f:c763  ff 80 d5 02   sbc $02d580,x
$1f:c767  ad 08 02      lda $0208
$1f:c76a  0c 00 02      tsb $0200
$1f:c76d  e7 c7         sbc [$c7]
$1f:c76f  02 22         cop #$22
$1f:c771  48            pha
$1f:c772  c7 02         cmp [$02]
$1f:c774  80 09         bra $c77f
$1f:c776  02 82         cop #$82
$1f:c778  02 85         cop #$85
$1f:c77a  35 c8         and $c8,x
$1f:c77c  1f 02 a0 08   ora $08a002,x
$1f:c780  00 02         brk #$02
$1f:c782  80 09         bra $c78d
$1f:c784  02 82         cop #$82
$1f:c786  02 85         cop #$85
$1f:c788  35 c8         and $c8,x
$1f:c78a  1f 02 a0 08   ora $08a002,x
$1f:c78e  00 80         brk #$80
$1f:c790  d5 02         cmp $02,x
$1f:c792  ad 08 02      lda $0208
$1f:c795  0c 00 02      tsb $0200
$1f:c798  e7 c7         sbc [$c7]
$1f:c79a  02 24         cop #$24
$1f:c79c  c9 c7 02      cmp #$02c7
$1f:c79f  80 09         bra $c7aa
$1f:c7a1  02 82         cop #$82
$1f:c7a3  02 85         cop #$85
$1f:c7a5  35 c8         and $c8,x
$1f:c7a7  1f 02 9f 08   ora $089f02,x
$1f:c7ab  00 02         brk #$02
$1f:c7ad  80 09         bra $c7b8
$1f:c7af  02 82         cop #$82
$1f:c7b1  02 85         cop #$85
$1f:c7b3  35 c8         and $c8,x
$1f:c7b5  1f 02 9f 08   ora $089f02,x
$1f:c7b9  00 80         brk #$80
$1f:c7bb  d5 02         cmp $02,x
$1f:c7bd  ad 08 02      lda $0208
$1f:c7c0  0c 00 02      tsb $0200
$1f:c7c3  e7 c7         sbc [$c7]
$1f:c7c5  02 23         cop #$23
$1f:c7c7  9e c7 02      stz $02c7,x
$1f:c7ca  80 09         bra $c7d5
$1f:c7cc  02 82         cop #$82
$1f:c7ce  02 85         cop #$85
$1f:c7d0  35 c8         and $c8,x
$1f:c7d2  1f 02 9f f8   ora $f89f02,x
$1f:c7d6  ff 02 80 09   sbc $098002,x
$1f:c7da  02 82         cop #$82
$1f:c7dc  02 85         cop #$85
$1f:c7de  35 c8         and $c8,x
$1f:c7e0  1f 02 9f f8   ora $f89f02,x
$1f:c7e4  ff 80 d5 02   sbc $02d580,x
$1f:c7e8  a7 02         lda [$02]
$1f:c7ea  80 0b         bra $c7f7
$1f:c7ec  02 82         cop #$82
$1f:c7ee  a9 00 10      lda #$1000
$1f:c7f1  9d 16 00      sta $0016,x
$1f:c7f4  02 ad         cop #$ad
$1f:c7f6  08            php
$1f:c7f7  02 9c         cop #$9c
$1f:c7f9  fd c7 19      sbc $19c7,x
$1f:c7fc  c8            iny
$1f:c7fd  02 9a         cop #$9a
$1f:c7ff  10 00         bpl $c801
$1f:c801  07 c8         ora [$c8]
$1f:c803  10 c8         bpl $c7cd
$1f:c805  10 c8         bpl $c7cf
$1f:c807  02 97         cop #$97
$1f:c809  02 80         cop #$80
$1f:c80b  0e 02 82      asl $8202
$1f:c80e  80 e4         bra $c7f4
$1f:c810  02 96         cop #$96
$1f:c812  02 80         cop #$80
$1f:c814  0e 02 82      asl $8202
$1f:c817  80 db         bra $c7f4
$1f:c819  02 9b         cop #$9b
$1f:c81b  10 00         bpl $c81d
$1f:c81d  23 c8         and $c8,s
$1f:c81f  2c c8 2c      bit $2cc8
$1f:c822  c8            iny
$1f:c823  02 97         cop #$97
$1f:c825  02 80         cop #$80
$1f:c827  0d 02 82      ora $8202
$1f:c82a  80 c8         bra $c7f4
$1f:c82c  02 97         cop #$97
$1f:c82e  02 80         cop #$80
$1f:c830  0c 02 82      tsb $8202
$1f:c833  80 bf         bra $c7f4
$1f:c835  a9 00 03      lda #$0300
$1f:c838  9d 16 00      sta $0016,x
$1f:c83b  02 a4         cop #$a4
$1f:c83d  02 80         cop #$80
$1f:c83f  0a            asl a
$1f:c840  02 82         cop #$82
$1f:c842  02 86         cop #$86
$1f:c844  6b            rtl
$1f:c845  02 ad         cop #$ad
$1f:c847  08            php
$1f:c848  02 0c         cop #$0c
$1f:c84a  00 02         brk #$02
$1f:c84c  54 c8 02      mvn $02,$c8
$1f:c84f  1b            tcs
$1f:c850  45 c8         eor $c8
$1f:c852  08            php
$1f:c853  00 02         brk #$02
$1f:c855  80 29         bra $c880
$1f:c857  02 82         cop #$82
$1f:c859  02 80         cop #$80
$1f:c85b  1f 02 82 02   ora $028202,x
$1f:c85f  ad 08 02      lda $0208
$1f:c862  80 20         bra $c884
$1f:c864  02 82         cop #$82
$1f:c866  02 9a         cop #$9a
$1f:c868  18            clc
$1f:c869  00 84         brk #$84
$1f:c86b  c8            iny
$1f:c86c  70 c8         bvs $c836
$1f:c86e  95 c8         sta $c8,x
$1f:c870  02 9b         cop #$9b
$1f:c872  00 00         brk #$00
$1f:c874  a6 c8         ldx $c8
$1f:c876  b7 c8         lda [$c8],y
$1f:c878  b7 c8         lda [$c8],y
$1f:c87a  02 9a         cop #$9a
$1f:c87c  00 00         brk #$00
$1f:c87e  84 c8         sty $c8
$1f:c880  95 c8         sta $c8,x
$1f:c882  95 c8         sta $c8,x
$1f:c884  02 23         cop #$23
$1f:c886  8f c8 02 80   sta $8002c8
$1f:c88a  24 02         bit $02
$1f:c88c  82 80 39      brl $020f
$1f:c88f  02 1b         cop #$1b
$1f:c891  70 c8         bvs $c85b
$1f:c893  08            php
$1f:c894  00 02         brk #$02
$1f:c896  24 a0         bit $a0
$1f:c898  c8            iny
$1f:c899  02 80         cop #$80
$1f:c89b  23 02         and $02,s
$1f:c89d  82 80 28      brl $f120
$1f:c8a0  02 1b         cop #$1b
$1f:c8a2  70 c8         bvs $c86c
$1f:c8a4  08            php
$1f:c8a5  00 02         brk #$02
$1f:c8a7  21 b1         and ($b1,x)
$1f:c8a9  c8            iny
$1f:c8aa  02 80         cop #$80
$1f:c8ac  22 02 82 80   jsl $808202
$1f:c8b0  17 02         ora [$02],y
$1f:c8b2  1b            tcs
$1f:c8b3  7a            ply
$1f:c8b4  c8            iny
$1f:c8b5  08            php
$1f:c8b6  00 02         brk #$02
$1f:c8b8  22 c2 c8 02   jsl $02c8c2
$1f:c8bc  80 21         bra $c8df
$1f:c8be  02 82         cop #$82
$1f:c8c0  80 06         bra $c8c8
$1f:c8c2  02 1b         cop #$1b
$1f:c8c4  7a            ply
$1f:c8c5  c8            iny
$1f:c8c6  08            php
$1f:c8c7  00 02         brk #$02
$1f:c8c9  80 25         bra $c8f0
$1f:c8cb  02 82         cop #$82
$1f:c8cd  02 0c         cop #$0c
$1f:c8cf  00 04         brk #$04
$1f:c8d1  d5 c8         cmp $c8,x
$1f:c8d3  80 89         bra $c85e
$1f:c8d5  02 85         cop #$85
$1f:c8d7  f0 c8         beq $c8a1
$1f:c8d9  1f a9 00 02   ora $0200a9,x
$1f:c8dd  9d 16 00      sta $0016,x
$1f:c8e0  02 80         cop #$80
$1f:c8e2  27 02         and [$02]
$1f:c8e4  82 9e 16      brl $df85
$1f:c8e7  00 02         brk #$02
$1f:c8e9  80 1f         bra $c90a
$1f:c8eb  02 82         cop #$82
$1f:c8ed  82 6e ff      brl $c85e
$1f:c8f0  a9 00 02      lda #$0200
$1f:c8f3  9d 16 00      sta $0016,x
$1f:c8f6  02 80         cop #$80
$1f:c8f8  26 02         rol $02
$1f:c8fa  82 02 86      brl $4eff
$1f:c8fd  6b            rtl
$1f:c8fe  bd 16 00      lda $0016,x
$1f:c901  89 00 80      bit #$8000
$1f:c904  f0 06         beq $c90c
$1f:c906  02 1b         cop #$1b
$1f:c908  fe c8 04      inc $04c8,x
$1f:c90b  00 02         brk #$02
$1f:c90d  9b            txy
$1f:c90e  08            php
$1f:c90f  00 16         brk #$16
$1f:c911  c9 30 c9      cmp #$c930
$1f:c914  23 c9         and $c9,s
$1f:c916  02 21         cop #$21
$1f:c918  64 c9         stz $c9
$1f:c91a  02 97         cop #$97
$1f:c91c  02 80         cop #$80
$1f:c91e  04 02         tsb $02
$1f:c920  82 80 db      brl $a4a3
$1f:c923  02 22         cop #$22
$1f:c925  64 c9         stz $c9
$1f:c927  02 97         cop #$97
$1f:c929  02 80         cop #$80
$1f:c92b  03 02         ora $02,s
$1f:c92d  82 80 ce      brl $97b0
$1f:c930  02 9a         cop #$9a
$1f:c932  00 00         brk #$00
$1f:c934  3a            dec a
$1f:c935  c9 4b c9      cmp #$c94b
$1f:c938  4b            phk
$1f:c939  c9 02 ae      cmp #$ae02
$1f:c93c  f0 ff         beq $c93d
$1f:c93e  00 00         brk #$00
$1f:c940  64 c9         stz $c9
$1f:c942  02 97         cop #$97
$1f:c944  02 80         cop #$80
$1f:c946  08            php
$1f:c947  02 82         cop #$82
$1f:c949  80 11         bra $c95c
$1f:c94b  02 ae         cop #$ae
$1f:c94d  10 00         bpl $c94f
$1f:c94f  00 00         brk #$00
$1f:c951  64 c9         stz $c9
$1f:c953  02 96         cop #$96
$1f:c955  02 80         cop #$80
$1f:c957  08            php
$1f:c958  02 82         cop #$82
$1f:c95a  80 00         bra $c95c
$1f:c95c  bd 16 00      lda $0016,x
$1f:c95f  89 00 80      bit #$8000
$1f:c962  f0 06         beq $c96a
$1f:c964  02 1b         cop #$1b
$1f:c966  5c c9 04 00   jml $0004c9
$1f:c96a  02 9a         cop #$9a
$1f:c96c  08            php
$1f:c96d  00 74         brk #$74
$1f:c96f  c9 8e c9      cmp #$c98e
$1f:c972  81 c9         sta ($c9,x)
$1f:c974  02 23         cop #$23
$1f:c976  06 c9         asl $c9
$1f:c978  02 97         cop #$97
$1f:c97a  02 80         cop #$80
$1f:c97c  05 02         ora $02
$1f:c97e  82 80 db      brl $a501
$1f:c981  02 24         cop #$24
$1f:c983  06 c9         asl $c9
$1f:c985  02 96         cop #$96
$1f:c987  02 80         cop #$80
$1f:c989  05 02         ora $02
$1f:c98b  82 80 ce      brl $980e
$1f:c98e  02 9b         cop #$9b
$1f:c990  00 00         brk #$00
$1f:c992  98            tya
$1f:c993  c9 aa c9      cmp #$c9aa
$1f:c996  aa            tax
$1f:c997  c9 02 ae      cmp #$ae02
$1f:c99a  00 00         brk #$00
$1f:c99c  f0 ff         beq $c99d
$1f:c99e  06 c9         asl $c9
$1f:c9a0  02 97         cop #$97
$1f:c9a2  02 80         cop #$80
$1f:c9a4  07 02         ora [$02]
$1f:c9a6  82 82 54      brl $1e2b
$1f:c9a9  ff 02 ae 00   sbc $00ae02,x
$1f:c9ad  00 10         brk #$10
$1f:c9af  00 06         brk #$06
$1f:c9b1  c9 02 97      cmp #$9702
$1f:c9b4  02 80         cop #$80
$1f:c9b6  06 02         asl $02
$1f:c9b8  82 82 42      brl $0c3d
$1f:c9bb  ff 02 a5 c6   sbc $c6a502,x
$1f:c9bf  c9 cf c9      cmp #$c9cf
$1f:c9c2  d6 c9         dec $c9,x
$1f:c9c4  dd c9 02      cmp $02c9,x
$1f:c9c7  96 02         stx $02,y
$1f:c9c9  80 0f         bra $c9da
$1f:c9cb  02 82         cop #$82
$1f:c9cd  80 15         bra $c9e4
$1f:c9cf  02 80         cop #$80
$1f:c9d1  10 02         bpl $c9d5
$1f:c9d3  82 80 0e      brl $d856
$1f:c9d6  02 80         cop #$80
$1f:c9d8  0f 02 82 80   ora $808202
$1f:c9dc  07 02         ora [$02]
$1f:c9de  96 02         stx $02,y
$1f:c9e0  80 10         bra $c9f2
$1f:c9e2  02 82         cop #$82
$1f:c9e4  02 ad         cop #$ad
$1f:c9e6  08            php
$1f:c9e7  02 03         cop #$03
$1f:c9e9  08            php
$1f:c9ea  02 80         cop #$80
$1f:c9ec  33 02         and ($02,s),y
$1f:c9ee  82 02 0c      brl $d5f3
$1f:c9f1  00 03         brk #$03
$1f:c9f3  05 ca         ora $ca
$1f:c9f5  02 04         cop #$04
$1f:c9f7  02 80         cop #$80
$1f:c9f9  11 02         ora ($02),y
$1f:c9fb  82 02 b0      brl $7a00
$1f:c9fe  1f ca 1f 00   ora $001fca,x
$1f:ca02  02 80         cop #$80
$1f:ca04  df 02 8f 02   cmp $028f02,x
$1f:ca08  9b            txy
$1f:ca09  00 00         brk #$00
$1f:ca0b  11 ca         ora ($ca),y
$1f:ca0d  18            clc
$1f:ca0e  ca            dex
$1f:ca0f  18            clc
$1f:ca10  ca            dex
$1f:ca11  02 80         cop #$80
$1f:ca13  10 02         bpl $ca17
$1f:ca15  82 80 cc      brl $9698
$1f:ca18  02 80         cop #$80
$1f:ca1a  0f 02 82 80   ora $808202
$1f:ca1e  c5 02         cmp $02
$1f:ca20  a3 02         lda $02,s
$1f:ca22  a2 30 00      ldx #$0030
$1f:ca25  64 a0         stz $a0
$1f:ca27  2a            rol a
$1f:ca28  00 e2         brk #$e2
$1f:ca2a  20 a9 00      jsr $00a9
$1f:ca2d  48            pha
$1f:ca2e  c2 20         rep #$20
$1f:ca30  a9 66 ad      lda #$ad66
$1f:ca33  48            pha
$1f:ca34  6b            rtl
$1f:ca35  bd 1a 00      lda $001a,x
$1f:ca38  09 00 02      ora #$0200
$1f:ca3b  9d 1a 00      sta $001a,x
$1f:ca3e  02 a5         cop #$a5
$1f:ca40  48            pha
$1f:ca41  ca            dex
$1f:ca42  ad ca 12      lda $12ca
$1f:ca45  cb            wai
$1f:ca46  77 cb         adc [$cb],y
$1f:ca48  a9 05 00      lda #$0005
$1f:ca4b  9d 2c 00      sta $002c,x
$1f:ca4e  02 ad         cop #$ad
$1f:ca50  08            php
$1f:ca51  02 0c         cop #$0c
$1f:ca53  00 05         brk #$05
$1f:ca55  5e ca 02      lsr $02ca,x
$1f:ca58  80 2f         bra $ca89
$1f:ca5a  02 82         cop #$82
$1f:ca5c  80 f0         bra $ca4e
$1f:ca5e  02 9c         cop #$9c
$1f:ca60  64 ca         stz $ca
$1f:ca62  88            dey
$1f:ca63  ca            dex
$1f:ca64  02 9a         cop #$9a
$1f:ca66  10 00         bpl $ca68
$1f:ca68  6e ca 79      ror $79ca
$1f:ca6b  ca            dex
$1f:ca6c  79 ca 02      adc $02ca,y
$1f:ca6f  23 57         and $57,s
$1f:ca71  ca            dex
$1f:ca72  02 80         cop #$80
$1f:ca74  14 02         trb $02
$1f:ca76  82 80 2f      brl $f9f9
$1f:ca79  02 24         cop #$24
$1f:ca7b  57 ca         eor [$ca],y
$1f:ca7d  02 96         cop #$96
$1f:ca7f  02 80         cop #$80
$1f:ca81  14 02         trb $02
$1f:ca83  82 02 97      brl $6188
$1f:ca86  80 20         bra $caa8
$1f:ca88  02 9b         cop #$9b
$1f:ca8a  10 00         bpl $ca8c
$1f:ca8c  92 ca         sta ($ca)
$1f:ca8e  9d ca 9d      sta $9dca,x
$1f:ca91  ca            dex
$1f:ca92  02 21         cop #$21
$1f:ca94  57 ca         eor [$ca],y
$1f:ca96  02 80         cop #$80
$1f:ca98  13 02         ora ($02,s),y
$1f:ca9a  82 80 0b      brl $d61d
$1f:ca9d  02 22         cop #$22
$1f:ca9f  57 ca         eor [$ca],y
$1f:caa1  02 80         cop #$80
$1f:caa3  12 02         ora ($02)
$1f:caa5  82 80 00      brl $cb28
$1f:caa8  de 2c 00      dec $002c,x
$1f:caab  d0 a1         bne $ca4e
$1f:caad  a9 05 00      lda #$0005
$1f:cab0  9d 2c 00      sta $002c,x
$1f:cab3  02 ad         cop #$ad
$1f:cab5  08            php
$1f:cab6  02 0c         cop #$0c
$1f:cab8  00 05         brk #$05
$1f:caba  c3 ca         cmp $ca,s
$1f:cabc  02 80         cop #$80
$1f:cabe  30 02         bmi $cac2
$1f:cac0  82 80 f0      brl $bb43
$1f:cac3  02 9c         cop #$9c
$1f:cac5  c9 ca ed      cmp #$edca
$1f:cac8  ca            dex
$1f:cac9  02 9a         cop #$9a
$1f:cacb  10 00         bpl $cacd
$1f:cacd  d3 ca         cmp ($ca,s),y
$1f:cacf  de ca de      dec $deca,x
$1f:cad2  ca            dex
$1f:cad3  02 23         cop #$23
$1f:cad5  bc ca 02      ldy $02ca,x
$1f:cad8  80 17         bra $caf1
$1f:cada  02 82         cop #$82
$1f:cadc  80 2f         bra $cb0d
$1f:cade  02 24         cop #$24
$1f:cae0  bc ca 02      ldy $02ca,x
$1f:cae3  96 02         stx $02,y
$1f:cae5  80 17         bra $cafe
$1f:cae7  02 82         cop #$82
$1f:cae9  02 97         cop #$97
$1f:caeb  80 20         bra $cb0d
$1f:caed  02 9b         cop #$9b
$1f:caef  10 00         bpl $caf1
$1f:caf1  f7 ca         sbc [$ca],y
$1f:caf3  02 cb         cop #$cb
$1f:caf5  02 cb         cop #$cb
$1f:caf7  02 21         cop #$21
$1f:caf9  bc ca 02      ldy $02ca,x
$1f:cafc  80 16         bra $cb14
$1f:cafe  02 82         cop #$82
$1f:cb00  80 0b         bra $cb0d
$1f:cb02  02 22         cop #$22
$1f:cb04  bc ca 02      ldy $02ca,x
$1f:cb07  80 15         bra $cb1e
$1f:cb09  02 82         cop #$82
$1f:cb0b  80 00         bra $cb0d
$1f:cb0d  de 2c 00      dec $002c,x
$1f:cb10  d0 a1         bne $cab3
$1f:cb12  a9 05 00      lda #$0005
$1f:cb15  9d 2c 00      sta $002c,x
$1f:cb18  02 ad         cop #$ad
$1f:cb1a  08            php
$1f:cb1b  02 0c         cop #$0c
$1f:cb1d  00 05         brk #$05
$1f:cb1f  28            plp
$1f:cb20  cb            wai
$1f:cb21  02 80         cop #$80
$1f:cb23  31 02         and ($02),y
$1f:cb25  82 80 f0      brl $bba8
$1f:cb28  02 9c         cop #$9c
$1f:cb2a  2e cb 52      rol $52cb
$1f:cb2d  cb            wai
$1f:cb2e  02 9a         cop #$9a
$1f:cb30  10 00         bpl $cb32
$1f:cb32  38            sec
$1f:cb33  cb            wai
$1f:cb34  43 cb         eor $cb,s
$1f:cb36  43 cb         eor $cb,s
$1f:cb38  02 23         cop #$23
$1f:cb3a  21 cb         and ($cb,x)
$1f:cb3c  02 80         cop #$80
$1f:cb3e  1a            inc a
$1f:cb3f  02 82         cop #$82
$1f:cb41  80 2f         bra $cb72
$1f:cb43  02 24         cop #$24
$1f:cb45  21 cb         and ($cb,x)
$1f:cb47  02 96         cop #$96
$1f:cb49  02 80         cop #$80
$1f:cb4b  1a            inc a
$1f:cb4c  02 82         cop #$82
$1f:cb4e  02 97         cop #$97
$1f:cb50  80 20         bra $cb72
$1f:cb52  02 9b         cop #$9b
$1f:cb54  10 00         bpl $cb56
$1f:cb56  5c cb 67 cb   jml $cb67cb
$1f:cb5a  67 cb         adc [$cb]
$1f:cb5c  02 21         cop #$21
$1f:cb5e  21 cb         and ($cb,x)
$1f:cb60  02 80         cop #$80
$1f:cb62  19 02 82      ora $8202,y
$1f:cb65  80 0b         bra $cb72
$1f:cb67  02 22         cop #$22
$1f:cb69  21 cb         and ($cb,x)
$1f:cb6b  02 80         cop #$80
$1f:cb6d  18            clc
$1f:cb6e  02 82         cop #$82
$1f:cb70  80 00         bra $cb72
$1f:cb72  de 2c 00      dec $002c,x
$1f:cb75  d0 a1         bne $cb18
$1f:cb77  02 ad         cop #$ad
$1f:cb79  08            php
$1f:cb7a  02 0c         cop #$0c
$1f:cb7c  00 05         brk #$05
$1f:cb7e  87 cb         sta [$cb]
$1f:cb80  02 80         cop #$80
$1f:cb82  32 02         and ($02)
$1f:cb84  82 80 f0      brl $bc07
$1f:cb87  02 9c         cop #$9c
$1f:cb89  8d cb b1      sta $b1cb
$1f:cb8c  cb            wai
$1f:cb8d  02 9a         cop #$9a
$1f:cb8f  10 00         bpl $cb91
$1f:cb91  97 cb         sta [$cb],y
$1f:cb93  a2 cb a2      ldx #$a2cb
$1f:cb96  cb            wai
$1f:cb97  02 23         cop #$23
$1f:cb99  d7 cb         cmp [$cb],y
$1f:cb9b  02 80         cop #$80
$1f:cb9d  1d 02 82      ora $8202,x
$1f:cba0  80 2f         bra $cbd1
$1f:cba2  02 24         cop #$24
$1f:cba4  d7 cb         cmp [$cb],y
$1f:cba6  02 96         cop #$96
$1f:cba8  02 80         cop #$80
$1f:cbaa  1d 02 82      ora $8202,x
$1f:cbad  02 97         cop #$97
$1f:cbaf  80 20         bra $cbd1
$1f:cbb1  02 9b         cop #$9b
$1f:cbb3  10 00         bpl $cbb5
$1f:cbb5  bb            tyx
$1f:cbb6  cb            wai
$1f:cbb7  c6 cb         dec $cb
$1f:cbb9  c6 cb         dec $cb
$1f:cbbb  02 21         cop #$21
$1f:cbbd  d7 cb         cmp [$cb],y
$1f:cbbf  02 80         cop #$80
$1f:cbc1  1c 02 82      trb $8202
$1f:cbc4  80 0b         bra $cbd1
$1f:cbc6  02 22         cop #$22
$1f:cbc8  d7 cb         cmp [$cb],y
$1f:cbca  02 80         cop #$80
$1f:cbcc  1b            tcs
$1f:cbcd  02 82         cop #$82
$1f:cbcf  80 00         bra $cbd1
$1f:cbd1  02 1b         cop #$1b
$1f:cbd3  77 cb         adc [$cb],y
$1f:cbd5  01 00         ora ($00,x)
$1f:cbd7  02 80         cop #$80
$1f:cbd9  1e 02 82      asl $8202,x
$1f:cbdc  02 86         cop #$86
$1f:cbde  6b            rtl
$1f:cbdf  02 aa         cop #$aa
$1f:cbe1  00 bd         brk #$bd
$1f:cbe3  16 00         asl $00,x
$1f:cbe5  89 00 80      bit #$8000
$1f:cbe8  d0 06         bne $cbf0
$1f:cbea  02 0c         cop #$0c
$1f:cbec  00 05         brk #$05
$1f:cbee  52 cd         eor ($cd)
$1f:cbf0  02 1b         cop #$1b
$1f:cbf2  e2 cb         sep #$cb
$1f:cbf4  10 00         bpl $cbf6
$1f:cbf6  02 1f         cop #$1f
$1f:cbf8  ad 02 03      lda $0302
$1f:cbfb  29 03 00      and #$0003
$1f:cbfe  f0 0f         beq $cc0f
$1f:cc00  3a            dec a
$1f:cc01  f0 5c         beq $cc5f
$1f:cc03  3a            dec a
$1f:cc04  d0 03         bne $cc09
$1f:cc06  82 a9 00      brl $ccb2
$1f:cc09  3a            dec a
$1f:cc0a  d0 03         bne $cc0f
$1f:cc0c  82 f5 00      brl $cd04
$1f:cc0f  ad 74 03      lda $0374
$1f:cc12  9d 00 00      sta $0000,x
$1f:cc15  ad 76 03      lda $0376
$1f:cc18  38            sec
$1f:cc19  e9 40 00      sbc #$0040
$1f:cc1c  10 03         bpl $cc21
$1f:cc1e  82 48 01      brl $cd69
$1f:cc21  29 f0 ff      and #$fff0
$1f:cc24  9d 02 00      sta $0002,x
$1f:cc27  02 28         cop #$28
$1f:cc29  69 cd bd      adc #$bdcd
$1f:cc2c  16 00         asl $00,x
$1f:cc2e  29 ff df      and #$dfff
$1f:cc31  9d 16 00      sta $0016,x
$1f:cc34  02 80         cop #$80
$1f:cc36  0a            asl a
$1f:cc37  02 82         cop #$82
$1f:cc39  bd 16 00      lda $0016,x
$1f:cc3c  29 ff fd      and #$fdff
$1f:cc3f  9d 16 00      sta $0016,x
$1f:cc42  02 80         cop #$80
$1f:cc44  00 02         brk #$02
$1f:cc46  82 02 81      brl $4d4b
$1f:cc49  03 04         ora $04,s
$1f:cc4b  02 83         cop #$83
$1f:cc4d  02 85         cop #$85
$1f:cc4f  7a            ply
$1f:cc50  cd 1f 02      cmp $021f
$1f:cc53  80 04         bra $cc59
$1f:cc55  02 82         cop #$82
$1f:cc57  02 80         cop #$80
$1f:cc59  00 02         brk #$02
$1f:cc5b  82 82 f3      brl $bfe0
$1f:cc5e  00 ad         brk #$ad
$1f:cc60  74 03         stz $03,x
$1f:cc62  9d 00 00      sta $0000,x
$1f:cc65  ad 76 03      lda $0376
$1f:cc68  18            clc
$1f:cc69  69 40 00      adc #$0040
$1f:cc6c  cd 44 03      cmp $0344
$1f:cc6f  90 03         bcc $cc74
$1f:cc71  82 f5 00      brl $cd69
$1f:cc74  29 f0 ff      and #$fff0
$1f:cc77  9d 02 00      sta $0002,x
$1f:cc7a  02 28         cop #$28
$1f:cc7c  69 cd bd      adc #$bdcd
$1f:cc7f  16 00         asl $00,x
$1f:cc81  29 ff df      and #$dfff
$1f:cc84  9d 16 00      sta $0016,x
$1f:cc87  02 80         cop #$80
$1f:cc89  0a            asl a
$1f:cc8a  02 82         cop #$82
$1f:cc8c  bd 16 00      lda $0016,x
$1f:cc8f  29 ff fd      and #$fdff
$1f:cc92  9d 16 00      sta $0016,x
$1f:cc95  02 80         cop #$80
$1f:cc97  01 02         ora ($02,x)
$1f:cc99  82 02 81      brl $4d9e
$1f:cc9c  05 04         ora $04
$1f:cc9e  02 83         cop #$83
$1f:cca0  02 85         cop #$85
$1f:cca2  6f cd 1f 02   adc $021fcd
$1f:cca6  80 06         bra $ccae
$1f:cca8  02 82         cop #$82
$1f:ccaa  02 80         cop #$80
$1f:ccac  01 02         ora ($02,x)
$1f:ccae  82 82 a0      brl $6d33
$1f:ccb1  00 ad         brk #$ad
$1f:ccb3  74 03         stz $03,x
$1f:ccb5  18            clc
$1f:ccb6  69 40 00      adc #$0040
$1f:ccb9  cd 42 03      cmp $0342
$1f:ccbc  90 03         bcc $ccc1
$1f:ccbe  82 a8 00      brl $cd69
$1f:ccc1  29 f0 ff      and #$fff0
$1f:ccc4  9d 00 00      sta $0000,x
$1f:ccc7  ad 76 03      lda $0376
$1f:ccca  9d 02 00      sta $0002,x
$1f:cccd  02 28         cop #$28
$1f:cccf  69 cd bd      adc #$bdcd
$1f:ccd2  16 00         asl $00,x
$1f:ccd4  29 ff df      and #$dfff
$1f:ccd7  9d 16 00      sta $0016,x
$1f:ccda  02 80         cop #$80
$1f:ccdc  0a            asl a
$1f:ccdd  02 82         cop #$82
$1f:ccdf  bd 16 00      lda $0016,x
$1f:cce2  29 ff fd      and #$fdff
$1f:cce5  9d 16 00      sta $0016,x
$1f:cce8  02 80         cop #$80
$1f:ccea  02 02         cop #$02
$1f:ccec  82 02 81      brl $4df1
$1f:ccef  07 04         ora [$04]
$1f:ccf1  02 83         cop #$83
$1f:ccf3  02 85         cop #$85
$1f:ccf5  83 cd         sta $cd,s
$1f:ccf7  1f 02 80 08   ora $088002,x
$1f:ccfb  02 82         cop #$82
$1f:ccfd  02 80         cop #$80
$1f:ccff  02 02         cop #$02
$1f:cd01  82 80 4e      brl $1b84
$1f:cd04  ad 74 03      lda $0374
$1f:cd07  38            sec
$1f:cd08  e9 40 00      sbc #$0040
$1f:cd0b  30 5c         bmi $cd69
$1f:cd0d  29 f0 ff      and #$fff0
$1f:cd10  9d 00 00      sta $0000,x
$1f:cd13  ad 76 03      lda $0376
$1f:cd16  9d 02 00      sta $0002,x
$1f:cd19  02 28         cop #$28
$1f:cd1b  69 cd bd      adc #$bdcd
$1f:cd1e  16 00         asl $00,x
$1f:cd20  29 ff df      and #$dfff
$1f:cd23  9d 16 00      sta $0016,x
$1f:cd26  02 80         cop #$80
$1f:cd28  0a            asl a
$1f:cd29  02 82         cop #$82
$1f:cd2b  bd 16 00      lda $0016,x
$1f:cd2e  29 ff fd      and #$fdff
$1f:cd31  9d 16 00      sta $0016,x
$1f:cd34  02 96         cop #$96
$1f:cd36  02 80         cop #$80
$1f:cd38  02 02         cop #$02
$1f:cd3a  82 02 81      brl $4e3f
$1f:cd3d  07 04         ora [$04]
$1f:cd3f  02 83         cop #$83
$1f:cd41  02 85         cop #$85
$1f:cd43  8e cd 1f      stx $1fcd
$1f:cd46  02 80         cop #$80
$1f:cd48  08            php
$1f:cd49  02 82         cop #$82
$1f:cd4b  02 80         cop #$80
$1f:cd4d  02 02         cop #$02
$1f:cd4f  82 02 97      brl $6454
$1f:cd52  bd 16 00      lda $0016,x
$1f:cd55  09 00 02      ora #$0200
$1f:cd58  9d 16 00      sta $0016,x
$1f:cd5b  02 80         cop #$80
$1f:cd5d  09 02 82      ora #$8202
$1f:cd60  bd 16 00      lda $0016,x
$1f:cd63  09 00 20      ora #$2000
$1f:cd66  9d 16 00      sta $0016,x
$1f:cd69  02 1b         cop #$1b
$1f:cd6b  f6 cb         inc $cb,x
$1f:cd6d  20 00 02      jsr $0200
$1f:cd70  a1 02         lda ($02,x)
$1f:cd72  00 f8         brk #$f8
$1f:cd74  ff a9 0c 00   sbc $000ca9,x
$1f:cd78  80 1d         bra $cd97
$1f:cd7a  02 9f         cop #$9f
$1f:cd7c  ff ff a9 0b   sbc $0ba9ff,x
$1f:cd80  00 80         brk #$80
$1f:cd82  14 02         trb $02
$1f:cd84  a1 f7         lda ($f7,x)
$1f:cd86  ff fc ff a9   sbc $a9fffc,x
$1f:cd8a  0d 00 80      ora $8000
$1f:cd8d  09 02 a1      ora #$a102
$1f:cd90  09 00 fc      ora #$fc00
$1f:cd93  ff a9 0d 00   sbc $000da9,x
$1f:cd97  9d 1e 00      sta $001e,x
$1f:cd9a  9e 20 00      stz $0020,x
$1f:cd9d  a9 00 02      lda #$0200
$1f:cda0  9d 16 00      sta $0016,x
$1f:cda3  02 aa         cop #$aa
$1f:cda5  00 02         brk #$02
$1f:cda7  a3 02         lda $02,s
$1f:cda9  a2 30 a9      ldx #$a930
$1f:cdac  10 00         bpl $cdae
$1f:cdae  9d 2a 00      sta $002a,x
$1f:cdb1  00 52         brk #$52
$1f:cdb3  02 91         cop #$91
$1f:cdb5  02 83         cop #$83
$1f:cdb7  02 86         cop #$86
$1f:cdb9  6b            rtl
$1f:cdba  02 aa         cop #$aa
$1f:cdbc  02 bd         cop #$bd
$1f:cdbe  16 00         asl $00,x
$1f:cdc0  89 00 80      bit #$8000
$1f:cdc3  d0 06         bne $cdcb
$1f:cdc5  02 0c         cop #$0c
$1f:cdc7  00 05         brk #$05
$1f:cdc9  55 cf         eor $cf,x
$1f:cdcb  02 1b         cop #$1b
$1f:cdcd  bd cd 10      lda $10cd,x
$1f:cdd0  00 02         brk #$02
$1f:cdd2  1f ad 02 03   ora $0302ad,x
$1f:cdd6  29 03 00      and #$0003
$1f:cdd9  f0 0f         beq $cdea
$1f:cddb  3a            dec a
$1f:cddc  f0 66         beq $ce44
$1f:cdde  3a            dec a
$1f:cddf  d0 03         bne $cde4
$1f:cde1  82 bd 00      brl $cea1
$1f:cde4  3a            dec a
$1f:cde5  d0 03         bne $cdea
$1f:cde7  82 13 01      brl $cefd
$1f:cdea  ad 74 03      lda $0374
$1f:cded  9d 00 00      sta $0000,x
$1f:cdf0  ad 76 03      lda $0376
$1f:cdf3  38            sec
$1f:cdf4  e9 20 00      sbc #$0020
$1f:cdf7  10 03         bpl $cdfc
$1f:cdf9  82 70 01      brl $cf6c
$1f:cdfc  29 f0 ff      and #$fff0
$1f:cdff  9d 02 00      sta $0002,x
$1f:ce02  02 28         cop #$28
$1f:ce04  6c cf bd      jmp ($bdcf)
$1f:ce07  16 00         asl $00,x
$1f:ce09  29 ff df      and #$dfff
$1f:ce0c  9d 16 00      sta $0016,x
$1f:ce0f  02 80         cop #$80
$1f:ce11  0a            asl a
$1f:ce12  02 82         cop #$82
$1f:ce14  bd 16 00      lda $0016,x
$1f:ce17  29 ff fd      and #$fdff
$1f:ce1a  9d 16 00      sta $0016,x
$1f:ce1d  02 80         cop #$80
$1f:ce1f  00 02         brk #$02
$1f:ce21  82 02 81      brl $4f26
$1f:ce24  03 04         ora $04,s
$1f:ce26  02 83         cop #$83
$1f:ce28  02 85         cop #$85
$1f:ce2a  87 cf         sta [$cf]
$1f:ce2c  1f 02 85 8e   ora $8e8502,x
$1f:ce30  cf 1f 02 85   cmp $85021f
$1f:ce34  95 cf         sta $cf,x
$1f:ce36  1f 02 80 04   ora $048002,x
$1f:ce3a  02 82         cop #$82
$1f:ce3c  02 80         cop #$80
$1f:ce3e  00 02         brk #$02
$1f:ce40  82 82 11      brl $dfc5
$1f:ce43  01 ad         ora ($ad,x)
$1f:ce45  74 03         stz $03,x
$1f:ce47  9d 00 00      sta $0000,x
$1f:ce4a  ad 76 03      lda $0376
$1f:ce4d  18            clc
$1f:ce4e  69 20 00      adc #$0020
$1f:ce51  cd 44 03      cmp $0344
$1f:ce54  90 03         bcc $ce59
$1f:ce56  82 13 01      brl $cf6c
$1f:ce59  29 f0 ff      and #$fff0
$1f:ce5c  9d 02 00      sta $0002,x
$1f:ce5f  02 28         cop #$28
$1f:ce61  6c cf bd      jmp ($bdcf)
$1f:ce64  16 00         asl $00,x
$1f:ce66  29 ff df      and #$dfff
$1f:ce69  9d 16 00      sta $0016,x
$1f:ce6c  02 80         cop #$80
$1f:ce6e  0a            asl a
$1f:ce6f  02 82         cop #$82
$1f:ce71  bd 16 00      lda $0016,x
$1f:ce74  29 ff fd      and #$fdff
$1f:ce77  9d 16 00      sta $0016,x
$1f:ce7a  02 80         cop #$80
$1f:ce7c  01 02         ora ($02,x)
$1f:ce7e  82 02 81      brl $4f83
$1f:ce81  05 04         ora $04
$1f:ce83  02 83         cop #$83
$1f:ce85  02 85         cop #$85
$1f:ce87  72 cf         adc ($cf)
$1f:ce89  1f 02 85 79   ora $798502,x
$1f:ce8d  cf 1f 02 85   cmp $85021f
$1f:ce91  a3 cf         lda $cf,s
$1f:ce93  1f 02 80 06   ora $068002,x
$1f:ce97  02 82         cop #$82
$1f:ce99  02 80         cop #$80
$1f:ce9b  01 02         ora ($02,x)
$1f:ce9d  82 82 b4      brl $8322
$1f:cea0  00 ad         brk #$ad
$1f:cea2  74 03         stz $03,x
$1f:cea4  18            clc
$1f:cea5  69 20 00      adc #$0020
$1f:cea8  cd 42 03      cmp $0342
$1f:ceab  90 03         bcc $ceb0
$1f:cead  82 bc 00      brl $cf6c
$1f:ceb0  29 f0 ff      and #$fff0
$1f:ceb3  9d 00 00      sta $0000,x
$1f:ceb6  ad 76 03      lda $0376
$1f:ceb9  9d 02 00      sta $0002,x
$1f:cebc  02 28         cop #$28
$1f:cebe  6c cf bd      jmp ($bdcf)
$1f:cec1  16 00         asl $00,x
$1f:cec3  29 ff df      and #$dfff
$1f:cec6  9d 16 00      sta $0016,x
$1f:cec9  02 80         cop #$80
$1f:cecb  0a            asl a
$1f:cecc  02 82         cop #$82
$1f:cece  bd 16 00      lda $0016,x
$1f:ced1  29 ff fd      and #$fdff
$1f:ced4  9d 16 00      sta $0016,x
$1f:ced7  02 80         cop #$80
$1f:ced9  02 02         cop #$02
$1f:cedb  82 02 81      brl $4fe0
$1f:cede  07 04         ora [$04]
$1f:cee0  02 83         cop #$83
$1f:cee2  02 85         cop #$85
$1f:cee4  95 cf         sta $cf,x
$1f:cee6  1f 02 85 9c   ora $9c8502,x
$1f:ceea  cf 1f 02 85   cmp $85021f
$1f:ceee  a3 cf         lda $cf,s
$1f:cef0  1f 02 80 08   ora $088002,x
$1f:cef4  02 82         cop #$82
$1f:cef6  02 80         cop #$80
$1f:cef8  02 02         cop #$02
$1f:cefa  82 80 58      brl $277d
$1f:cefd  ad 74 03      lda $0374
$1f:cf00  38            sec
$1f:cf01  e9 20 00      sbc #$0020
$1f:cf04  30 66         bmi $cf6c
$1f:cf06  29 f0 ff      and #$fff0
$1f:cf09  9d 00 00      sta $0000,x
$1f:cf0c  ad 76 03      lda $0376
$1f:cf0f  9d 02 00      sta $0002,x
$1f:cf12  02 28         cop #$28
$1f:cf14  6c cf bd      jmp ($bdcf)
$1f:cf17  16 00         asl $00,x
$1f:cf19  29 ff df      and #$dfff
$1f:cf1c  9d 16 00      sta $0016,x
$1f:cf1f  02 80         cop #$80
$1f:cf21  0a            asl a
$1f:cf22  02 82         cop #$82
$1f:cf24  bd 16 00      lda $0016,x
$1f:cf27  29 ff fd      and #$fdff
$1f:cf2a  9d 16 00      sta $0016,x
$1f:cf2d  02 96         cop #$96
$1f:cf2f  02 80         cop #$80
$1f:cf31  02 02         cop #$02
$1f:cf33  82 02 81      brl $5038
$1f:cf36  07 04         ora [$04]
$1f:cf38  02 83         cop #$83
$1f:cf3a  02 85         cop #$85
$1f:cf3c  79 cf 1f      adc $1fcf,y
$1f:cf3f  02 85         cop #$85
$1f:cf41  80 cf         bra $cf12
$1f:cf43  1f 02 85 87   ora $878502,x
$1f:cf47  cf 1f 02 80   cmp $80021f
$1f:cf4b  08            php
$1f:cf4c  02 82         cop #$82
$1f:cf4e  02 80         cop #$80
$1f:cf50  02 02         cop #$02
$1f:cf52  82 02 97      brl $6657
$1f:cf55  bd 16 00      lda $0016,x
$1f:cf58  09 00 02      ora #$0200
$1f:cf5b  9d 16 00      sta $0016,x
$1f:cf5e  02 80         cop #$80
$1f:cf60  09 02 82      ora #$8202
$1f:cf63  bd 16 00      lda $0016,x
$1f:cf66  09 00 20      ora #$2000
$1f:cf69  9d 16 00      sta $0016,x
$1f:cf6c  02 1b         cop #$1b
$1f:cf6e  d1 cd         cmp ($cd),y
$1f:cf70  20 00 02      jsr $0200
$1f:cf73  97 a9         sta [$a9],y
$1f:cf75  11 00         ora ($00),y
$1f:cf77  80 2f         bra $cfa8
$1f:cf79  02 96         cop #$96
$1f:cf7b  a9 14 00      lda #$0014
$1f:cf7e  80 28         bra $cfa8
$1f:cf80  02 96         cop #$96
$1f:cf82  a9 12 00      lda #$0012
$1f:cf85  80 21         bra $cfa8
$1f:cf87  02 96         cop #$96
$1f:cf89  a9 13 00      lda #$0013
$1f:cf8c  80 1a         bra $cfa8
$1f:cf8e  02 97         cop #$97
$1f:cf90  a9 10 00      lda #$0010
$1f:cf93  80 13         bra $cfa8
$1f:cf95  02 97         cop #$97
$1f:cf97  a9 13 00      lda #$0013
$1f:cf9a  80 0c         bra $cfa8
$1f:cf9c  02 97         cop #$97
$1f:cf9e  a9 12 00      lda #$0012
$1f:cfa1  80 05         bra $cfa8
$1f:cfa3  02 97         cop #$97
$1f:cfa5  a9 14 00      lda #$0014
$1f:cfa8  9d 1e 00      sta $001e,x
$1f:cfab  9e 20 00      stz $0020,x
$1f:cfae  a9 00 02      lda #$0200
$1f:cfb1  9d 16 00      sta $0016,x
$1f:cfb4  02 aa         cop #$aa
$1f:cfb6  00 02         brk #$02
$1f:cfb8  a3 02         lda $02,s
$1f:cfba  a2 30 a9      ldx #$a930
$1f:cfbd  04 00         tsb $00
$1f:cfbf  9d 2a 00      sta $002a,x
$1f:cfc2  00 52         brk #$52
$1f:cfc4  02 91         cop #$91
$1f:cfc6  02 83         cop #$83
$1f:cfc8  02 80         cop #$80
$1f:cfca  15 02         ora $02,x
$1f:cfcc  82 02 81      brl $50d1
$1f:cfcf  2f 08 02 83   and $830208
$1f:cfd3  02 86         cop #$86
$1f:cfd5  6b            rtl
$1f:cfd6  02 ad         cop #$ad
$1f:cfd8  08            php
$1f:cfd9  02 80         cop #$80
$1f:cfdb  18            clc
$1f:cfdc  02 82         cop #$82
$1f:cfde  02 81         cop #$81
$1f:cfe0  19 08 02      ora $0208,y
$1f:cfe3  83 02         sta $02,s
$1f:cfe5  85 00         sta $00
$1f:cfe7  d0 1f         bne $d008
$1f:cfe9  02 85         cop #$85
$1f:cfeb  05 d0         ora $d0
$1f:cfed  1f 02 85 1d   ora $1d8502,x
$1f:cff1  d0 1f         bne $d012
$1f:cff3  02 85         cop #$85
$1f:cff5  22 d0 1f 02   jsl $021fd0
$1f:cff9  81 18         sta ($18,x)
$1f:cffb  0c 02 83      tsb $8302
$1f:cffe  80 d6         bra $cfd6
$1f:d000  a9 e0 ff      lda #$ffe0
$1f:d003  80 03         bra $d008
$1f:d005  a9 20 00      lda #$0020
$1f:d008  18            clc
$1f:d009  6d 76 03      adc $0376
$1f:d00c  29 f0 ff      and #$fff0
$1f:d00f  9d 02 00      sta $0002,x
$1f:d012  ad 74 03      lda $0374
$1f:d015  29 f0 ff      and #$fff0
$1f:d018  9d 00 00      sta $0000,x
$1f:d01b  80 1b         bra $d038
$1f:d01d  a9 e0 ff      lda #$ffe0
$1f:d020  80 03         bra $d025
$1f:d022  a9 20 00      lda #$0020
$1f:d025  18            clc
$1f:d026  6d 74 03      adc $0374
$1f:d029  29 f0 ff      and #$fff0
$1f:d02c  9d 00 00      sta $0000,x
$1f:d02f  ad 76 03      lda $0376
$1f:d032  29 f0 ff      and #$fff0
$1f:d035  9d 02 00      sta $0002,x
$1f:d038  02 28         cop #$28
$1f:d03a  55 d0         eor $d0,x
$1f:d03c  a9 00 03      lda #$0300
$1f:d03f  9d 16 00      sta $0016,x
$1f:d042  02 81         cop #$81
$1f:d044  16 02         asl $02,x
$1f:d046  02 83         cop #$83
$1f:d048  a9 00 02      lda #$0200
$1f:d04b  9d 16 00      sta $0016,x
$1f:d04e  00 5b         brk #$5b
$1f:d050  02 80         cop #$80
$1f:d052  17 02         ora [$02],y
$1f:d054  82 02 86      brl $5659
$1f:d057  6b            rtl
$1f:d058  bd 1a 00      lda $001a,x
$1f:d05b  09 00 01      ora #$0100
$1f:d05e  9d 1a 00      sta $001a,x
$1f:d061  02 ad         cop #$ad
$1f:d063  08            php
$1f:d064  a9 08 00      lda #$0008
$1f:d067  9d 2c 00      sta $002c,x
$1f:d06a  02 80         cop #$80
$1f:d06c  1a            inc a
$1f:d06d  02 82         cop #$82
$1f:d06f  bd 25 00      lda $0025,x
$1f:d072  29 ff 00      and #$00ff
$1f:d075  c9 18 00      cmp #$0018
$1f:d078  d0 0c         bne $d086
$1f:d07a  de 2c 00      dec $002c,x
$1f:d07d  d0 eb         bne $d06a
$1f:d07f  02 80         cop #$80
$1f:d081  1b            tcs
$1f:d082  02 82         cop #$82
$1f:d084  80 db         bra $d061
$1f:d086  a9 00 02      lda #$0200
$1f:d089  9d 16 00      sta $0016,x
$1f:d08c  02 81         cop #$81
$1f:d08e  1c 14 02      trb $0214
$1f:d091  83 00         sta $00,s
$1f:d093  64 02         stz $02
$1f:d095  85 c4         sta $c4
$1f:d097  d0 1f         bne $d0b8
$1f:d099  02 85         cop #$85
$1f:d09b  c9 d0 1f      cmp #$1fd0
$1f:d09e  02 85         cop #$85
$1f:d0a0  d0 d0         bne $d072
$1f:d0a2  1f 02 85 d7   ora $d78502,x
$1f:d0a6  d0 1f         bne $d0c7
$1f:d0a8  02 85         cop #$85
$1f:d0aa  de d0 1f      dec $1fd0,x
$1f:d0ad  02 85         cop #$85
$1f:d0af  e3 d0         sbc $d0,s
$1f:d0b1  1f 02 85 e8   ora $e88502,x
$1f:d0b5  d0 1f         bne $d0d6
$1f:d0b7  02 85         cop #$85
$1f:d0b9  ed d0 1f      sbc $1fd0
$1f:d0bc  02 80         cop #$80
$1f:d0be  1d 02 82      ora $8202,x
$1f:d0c1  02 86         cop #$86
$1f:d0c3  6b            rtl
$1f:d0c4  a9 1f 00      lda #$001f
$1f:d0c7  80 29         bra $d0f2
$1f:d0c9  02 96         cop #$96
$1f:d0cb  a9 22 00      lda #$0022
$1f:d0ce  80 22         bra $d0f2
$1f:d0d0  02 96         cop #$96
$1f:d0d2  a9 20 00      lda #$0020
$1f:d0d5  80 1b         bra $d0f2
$1f:d0d7  02 96         cop #$96
$1f:d0d9  a9 21 00      lda #$0021
$1f:d0dc  80 14         bra $d0f2
$1f:d0de  a9 1e 00      lda #$001e
$1f:d0e1  80 0f         bra $d0f2
$1f:d0e3  a9 21 00      lda #$0021
$1f:d0e6  80 0a         bra $d0f2
$1f:d0e8  a9 20 00      lda #$0020
$1f:d0eb  80 05         bra $d0f2
$1f:d0ed  a9 22 00      lda #$0022
$1f:d0f0  80 00         bra $d0f2
$1f:d0f2  9d 1e 00      sta $001e,x
$1f:d0f5  9e 20 00      stz $0020,x
$1f:d0f8  a9 00 02      lda #$0200
$1f:d0fb  9d 16 00      sta $0016,x
$1f:d0fe  a9 02 00      lda #$0002
$1f:d101  9d 2a 00      sta $002a,x
$1f:d104  02 a3         cop #$a3
$1f:d106  02 a2         cop #$a2
$1f:d108  30 02         bmi $d10c
$1f:d10a  a1 08         lda ($08,x)
$1f:d10c  00 f8         brk #$f8
$1f:d10e  ff 02 91 02   sbc $029102,x
$1f:d112  83 02         sta $02,s
$1f:d114  80 23         bra $d139
$1f:d116  02 82         cop #$82
$1f:d118  02 86         cop #$86
$1f:d11a  6b            rtl
$1f:d11b  02 a3         cop #$a3
$1f:d11d  02 1b         cop #$1b
$1f:d11f  23 d1         and $d1,s
$1f:d121  00 00         brk #$00
$1f:d123  02 ad         cop #$ad
$1f:d125  08            php
$1f:d126  82 6c 00      brl $d195
$1f:d129  02 97         cop #$97
$1f:d12b  02 80         cop #$80
$1f:d12d  29 02 82      and #$8202
$1f:d130  80 63         bra $d195
$1f:d132  02 96         cop #$96
$1f:d134  02 80         cop #$80
$1f:d136  26 02         rol $02
$1f:d138  82 80 6e      brl $3fbb
$1f:d13b  02 96         cop #$96
$1f:d13d  02 80         cop #$80
$1f:d13f  25 02         and $02
$1f:d141  82 80 51      brl $22c4
$1f:d144  02 96         cop #$96
$1f:d146  02 80         cop #$80
$1f:d148  2a            rol a
$1f:d149  02 82         cop #$82
$1f:d14b  80 5c         bra $d1a9
$1f:d14d  02 96         cop #$96
$1f:d14f  02 80         cop #$80
$1f:d151  27 02         and [$02]
$1f:d153  82 80 67      brl $38d6
$1f:d156  02 96         cop #$96
$1f:d158  02 80         cop #$80
$1f:d15a  24 02         bit $02
$1f:d15c  82 80 4a      brl $1bdf
$1f:d15f  02 97         cop #$97
$1f:d161  02 80         cop #$80
$1f:d163  28            plp
$1f:d164  02 82         cop #$82
$1f:d166  80 55         bra $d1bd
$1f:d168  02 97         cop #$97
$1f:d16a  02 80         cop #$80
$1f:d16c  24 02         bit $02
$1f:d16e  82 80 60      brl $31f1
$1f:d171  02 97         cop #$97
$1f:d173  02 80         cop #$80
$1f:d175  27 02         and [$02]
$1f:d177  82 80 43      brl $14fa
$1f:d17a  02 97         cop #$97
$1f:d17c  02 80         cop #$80
$1f:d17e  2a            rol a
$1f:d17f  02 82         cop #$82
$1f:d181  80 4e         bra $d1d1
$1f:d183  02 97         cop #$97
$1f:d185  02 80         cop #$80
$1f:d187  25 02         and $02
$1f:d189  82 80 09      brl $db0c
$1f:d18c  02 97         cop #$97
$1f:d18e  02 80         cop #$80
$1f:d190  26 02         rol $02
$1f:d192  82 80 3c      brl $0e15
$1f:d195  02 9b         cop #$9b
$1f:d197  00 00         brk #$00
$1f:d199  29 d1 9f      and #$9fd1
$1f:d19c  d1 9f         cmp ($9f),y
$1f:d19e  d1 02         cmp ($02),y
$1f:d1a0  9a            txs
$1f:d1a1  00 00         brk #$00
$1f:d1a3  8c d1 32      sty $32d1
$1f:d1a6  d1 32         cmp ($32),y
$1f:d1a8  d1 02         cmp ($02),y
$1f:d1aa  9a            txs
$1f:d1ab  00 00         brk #$00
$1f:d1ad  b3 d1         lda ($d1,s),y
$1f:d1af  b3 d1         lda ($d1,s),y
$1f:d1b1  44 d1 02      mvp $02,$d1
$1f:d1b4  9b            txy
$1f:d1b5  00 00         brk #$00
$1f:d1b7  3b            tsc
$1f:d1b8  d1 4d         cmp ($4d),y
$1f:d1ba  d1 4d         cmp ($4d),y
$1f:d1bc  d1 02         cmp ($02),y
$1f:d1be  9b            txy
$1f:d1bf  00 00         brk #$00
$1f:d1c1  c7 d1         cmp [$d1]
$1f:d1c3  c7 d1         cmp [$d1]
$1f:d1c5  5f d1 02 9a   eor $9a02d1,x
$1f:d1c9  00 00         brk #$00
$1f:d1cb  68            pla
$1f:d1cc  d1 68         cmp ($68),y
$1f:d1ce  d1 56         cmp ($56),y
$1f:d1d0  d1 02         cmp ($02),y
$1f:d1d2  9a            txs
$1f:d1d3  00 00         brk #$00
$1f:d1d5  7a            ply
$1f:d1d6  d1 db         cmp ($db),y
$1f:d1d8  d1 db         cmp ($db),y
$1f:d1da  d1 02         cmp ($02),y
$1f:d1dc  9b            txy
$1f:d1dd  00 00         brk #$00
$1f:d1df  83 d1         sta $d1,s
$1f:d1e1  83 d1         sta $d1,s
$1f:d1e3  71 d1         adc ($d1),y
$1f:d1e5  02 ad         cop #$ad
$1f:d1e7  08            php
$1f:d1e8  02 0c         cop #$0c
$1f:d1ea  00 05         brk #$05
$1f:d1ec  f5 d1         sbc $d1,x
$1f:d1ee  02 80         cop #$80
$1f:d1f0  2b            pld
$1f:d1f1  02 82         cop #$82
$1f:d1f3  80 f0         bra $d1e5
$1f:d1f5  02 1f         cop #$1f
$1f:d1f7  ad 02 03      lda $0302
$1f:d1fa  10 1e         bpl $d21a
$1f:d1fc  02 9a         cop #$9a
$1f:d1fe  00 00         brk #$00
$1f:d200  06 d2         asl $d2
$1f:d202  10 d2         bpl $d1d6
$1f:d204  10 d2         bpl $d1d8
$1f:d206  02 9b         cop #$9b
$1f:d208  00 00         brk #$00
$1f:d20a  61 d2         adc ($d2,x)
$1f:d20c  4e d2 4e      lsr $4ed2
$1f:d20f  d2 02         cmp ($02)
$1f:d211  9b            txy
$1f:d212  00 00         brk #$00
$1f:d214  28            plp
$1f:d215  d2 3b         cmp ($3b)
$1f:d217  d2 3b         cmp ($3b)
$1f:d219  d2 29         cmp ($29)
$1f:d21b  03 00         ora $00,s
$1f:d21d  f0 09         beq $d228
$1f:d21f  3a            dec a
$1f:d220  f0 19         beq $d23b
$1f:d222  3a            dec a
$1f:d223  f0 29         beq $d24e
$1f:d225  3a            dec a
$1f:d226  f0 39         beq $d261
$1f:d228  02 96         cop #$96
$1f:d22a  02 80         cop #$80
$1f:d22c  2c 02 82      bit $8202
$1f:d22f  02 80         cop #$80
$1f:d231  2e 02 82      rol $8202
$1f:d234  02 80         cop #$80
$1f:d236  2c 02 82      bit $8202
$1f:d239  80 aa         bra $d1e5
$1f:d23b  02 96         cop #$96
$1f:d23d  02 80         cop #$80
$1f:d23f  2c 02 82      bit $8202
$1f:d242  02 80         cop #$80
$1f:d244  2d 02 82      and $8202
$1f:d247  02 80         cop #$80
$1f:d249  2c 02 82      bit $8202
$1f:d24c  80 97         bra $d1e5
$1f:d24e  02 97         cop #$97
$1f:d250  02 80         cop #$80
$1f:d252  2c 02 82      bit $8202
$1f:d255  02 80         cop #$80
$1f:d257  2d 02 82      and $8202
$1f:d25a  02 80         cop #$80
$1f:d25c  2c 02 82      bit $8202
$1f:d25f  80 84         bra $d1e5
$1f:d261  02 97         cop #$97
$1f:d263  02 80         cop #$80
$1f:d265  2c 02 82      bit $8202
$1f:d268  02 80         cop #$80
$1f:d26a  2e 02 82      rol $8202
$1f:d26d  02 80         cop #$80
$1f:d26f  2c 02 82      bit $8202
$1f:d272  82 70 ff      brl $d1e5
$1f:d275  bd 1a 00      lda $001a,x
$1f:d278  09 00 04      ora #$0400
$1f:d27b  9d 1a 00      sta $001a,x
$1f:d27e  02 a5         cop #$a5
$1f:d280  16 d3         asl $d3,x
$1f:d282  ea            nop
$1f:d283  d2 88         cmp ($88)
$1f:d285  d2 bc         cmp ($bc)
$1f:d287  d2 02         cmp ($02)
$1f:d289  21 9c         and ($9c,x)
$1f:d28b  d2 02         cmp ($02)
$1f:d28d  96 02         stx $02,y
$1f:d28f  80 02         bra $d293
$1f:d291  02 82         cop #$82
$1f:d293  02 97         cop #$97
$1f:d295  02 80         cop #$80
$1f:d297  01 02         ora ($02,x)
$1f:d299  82 80 36      brl $091c
$1f:d29c  02 24         cop #$24
$1f:d29e  ac d2 02      ldy $02d2
$1f:d2a1  96 02         stx $02,y
$1f:d2a3  81 05         sta ($05,x)
$1f:d2a5  02 02         cop #$02
$1f:d2a7  83 02         sta $02,s
$1f:d2a9  97 80         sta [$80],y
$1f:d2ab  dc 02 96      jml [$9602]
$1f:d2ae  02 80         cop #$80
$1f:d2b0  02 02         cop #$02
$1f:d2b2  82 02 97      brl $69b7
$1f:d2b5  02 80         cop #$80
$1f:d2b7  00 02         brk #$02
$1f:d2b9  82 80 5a      brl $2d3c
$1f:d2bc  02 23         cop #$23
$1f:d2be  ce d2 02      dec $02d2
$1f:d2c1  97 02         sta [$02],y
$1f:d2c3  80 01         bra $d2c6
$1f:d2c5  02 82         cop #$82
$1f:d2c7  02 80         cop #$80
$1f:d2c9  02 02         cop #$02
$1f:d2cb  82 80 32      brl $054e
$1f:d2ce  02 21         cop #$21
$1f:d2d0  da            phx
$1f:d2d1  d2 02         cmp ($02)
$1f:d2d3  81 04         sta ($04,x)
$1f:d2d5  02 02         cop #$02
$1f:d2d7  83 80         sta $80,s
$1f:d2d9  e2 02         sep #$02
$1f:d2db  97 02         sta [$02],y
$1f:d2dd  80 01         bra $d2e0
$1f:d2df  02 82         cop #$82
$1f:d2e1  02 96         cop #$96
$1f:d2e3  02 80         cop #$80
$1f:d2e5  02 02         cop #$02
$1f:d2e7  82 80 9e      brl $716a
$1f:d2ea  02 22         cop #$22
$1f:d2ec  fc d2 02      jsr ($02d2,x)
$1f:d2ef  97 02         sta [$02],y
$1f:d2f1  80 02         bra $d2f5
$1f:d2f3  02 82         cop #$82
$1f:d2f5  02 80         cop #$80
$1f:d2f7  00 02         brk #$02
$1f:d2f9  82 80 33      brl $067c
$1f:d2fc  02 23         cop #$23
$1f:d2fe  08            php
$1f:d2ff  d3 02         cmp ($02,s),y
$1f:d301  81 05         sta ($05,x)
$1f:d303  02 02         cop #$02
$1f:d305  83 80         sta $80,s
$1f:d307  e2 02         sep #$02
$1f:d309  97 02         sta [$02],y
$1f:d30b  80 02         bra $d30f
$1f:d30d  02 82         cop #$82
$1f:d30f  02 80         cop #$80
$1f:d311  01 02         ora ($02,x)
$1f:d313  82 80 a6      brl $7996
$1f:d316  02 24         cop #$24
$1f:d318  2b            pld
$1f:d319  d3 02         cmp ($02,s),y
$1f:d31b  97 02         sta [$02],y
$1f:d31d  80 00         bra $d31f
$1f:d31f  02 82         cop #$82
$1f:d321  02 96         cop #$96
$1f:d323  02 80         cop #$80
$1f:d325  02 02         cop #$02
$1f:d327  82 82 75      brl $48ac
$1f:d32a  ff 02 22 37   sbc $372202,x
$1f:d32e  d3 02         cmp ($02,s),y
$1f:d330  81 03         sta ($03,x)
$1f:d332  02 02         cop #$02
$1f:d334  83 80         sta $80,s
$1f:d336  df 02 97 02   cmp $029702,x
$1f:d33a  80 00         bra $d33c
$1f:d33c  02 82         cop #$82
$1f:d33e  02 80         cop #$80
$1f:d340  02 02         cop #$02
$1f:d342  82 80 a5      brl $78c5
$1f:d345  bd 1a 00      lda $001a,x
$1f:d348  09 00 04      ora #$0400
$1f:d34b  9d 1a 00      sta $001a,x
$1f:d34e  bd 16 00      lda $0016,x
$1f:d351  89 00 80      bit #$8000
$1f:d354  f0 06         beq $d35c
$1f:d356  02 1b         cop #$1b
$1f:d358  4e d3 04      lsr $04d3
$1f:d35b  00 02         brk #$02
$1f:d35d  9a            txs
$1f:d35e  10 00         bpl $d360
$1f:d360  66 d3         ror $d3
$1f:d362  70 d3         bvs $d337
$1f:d364  66 d3         ror $d3
$1f:d366  02 9b         cop #$9b
$1f:d368  10 00         bpl $d36a
$1f:d36a  56 d3         lsr $d3,x
$1f:d36c  7a            ply
$1f:d36d  d3 56         cmp ($56,s),y
$1f:d36f  d3 02         cmp ($02,s),y
$1f:d371  9b            txy
$1f:d372  00 00         brk #$00
$1f:d374  c2 d3         rep #$d3
$1f:d376  e2 d3         sep #$d3
$1f:d378  e2 d3         sep #$d3
$1f:d37a  02 9a         cop #$9a
$1f:d37c  00 00         brk #$00
$1f:d37e  84 d3         sty $d3
$1f:d380  a3 d3         lda $d3,s
$1f:d382  a3 d3         lda $d3,s
$1f:d384  02 97         cop #$97
$1f:d386  02 80         cop #$80
$1f:d388  08            php
$1f:d389  02 82         cop #$82
$1f:d38b  02 81         cop #$81
$1f:d38d  0d 04 02      ora $0204
$1f:d390  83 02         sta $02,s
$1f:d392  80 08         bra $d39c
$1f:d394  02 82         cop #$82
$1f:d396  02 81         cop #$81
$1f:d398  0e 10 02      asl $0210
$1f:d39b  83 02         sta $02,s
$1f:d39d  80 08         bra $d3a7
$1f:d39f  02 82         cop #$82
$1f:d3a1  80 ab         bra $d34e
$1f:d3a3  02 96         cop #$96
$1f:d3a5  02 80         cop #$80
$1f:d3a7  08            php
$1f:d3a8  02 82         cop #$82
$1f:d3aa  02 81         cop #$81
$1f:d3ac  0d 04 02      ora $0204
$1f:d3af  83 02         sta $02,s
$1f:d3b1  80 08         bra $d3bb
$1f:d3b3  02 82         cop #$82
$1f:d3b5  02 81         cop #$81
$1f:d3b7  0e 10 02      asl $0210
$1f:d3ba  83 02         sta $02,s
$1f:d3bc  80 08         bra $d3c6
$1f:d3be  02 82         cop #$82
$1f:d3c0  80 8c         bra $d34e
$1f:d3c2  02 97         cop #$97
$1f:d3c4  02 80         cop #$80
$1f:d3c6  07 02         ora [$02]
$1f:d3c8  82 02 81      brl $54cd
$1f:d3cb  0b            phd
$1f:d3cc  04 02         tsb $02
$1f:d3ce  83 02         sta $02,s
$1f:d3d0  80 07         bra $d3d9
$1f:d3d2  02 82         cop #$82
$1f:d3d4  02 81         cop #$81
$1f:d3d6  0c 10 02      tsb $0210
$1f:d3d9  83 02         sta $02,s
$1f:d3db  80 07         bra $d3e4
$1f:d3dd  02 82         cop #$82
$1f:d3df  82 6c ff      brl $d34e
$1f:d3e2  02 97         cop #$97
$1f:d3e4  02 80         cop #$80
$1f:d3e6  06 02         asl $02
$1f:d3e8  82 02 81      brl $54ed
$1f:d3eb  09 04 02      ora #$0204
$1f:d3ee  83 02         sta $02,s
$1f:d3f0  80 06         bra $d3f8
$1f:d3f2  02 82         cop #$82
$1f:d3f4  02 81         cop #$81
$1f:d3f6  0a            asl a
$1f:d3f7  10 02         bpl $d3fb
$1f:d3f9  83 02         sta $02,s
$1f:d3fb  80 06         bra $d403
$1f:d3fd  02 82         cop #$82
$1f:d3ff  82 4c ff      brl $d34e
$1f:d402  bd 1a 00      lda $001a,x
$1f:d405  09 00 04      ora #$0400
$1f:d408  9d 1a 00      sta $001a,x
$1f:d40b  02 ad         cop #$ad
$1f:d40d  08            php
$1f:d40e  02 9c         cop #$9c
$1f:d410  14 d4         trb $d4
$1f:d412  1e d4 02      asl $02d4,x
$1f:d415  9a            txs
$1f:d416  00 00         brk #$00
$1f:d418  28            plp
$1f:d419  d4 40         pei ($40)
$1f:d41b  d4 40         pei ($40)
$1f:d41d  d4 02         pei ($02)
$1f:d41f  9b            txy
$1f:d420  00 00         brk #$00
$1f:d422  58            cli
$1f:d423  d4 70         pei ($70)
$1f:d425  d4 70         pei ($70)
$1f:d427  d4 02         pei ($02)
$1f:d429  97 02         sta [$02],y
$1f:d42b  81 18         sta ($18,x)
$1f:d42d  02 02         cop #$02
$1f:d42f  83 02         sta $02,s
$1f:d431  28            plp
$1f:d432  36 d4         rol $d4,x
$1f:d434  80 52         bra $d488
$1f:d436  02 9a         cop #$9a
$1f:d438  08            php
$1f:d439  00 2a         brk #$2a
$1f:d43b  d4 1e         pei ($1e)
$1f:d43d  d4 40         pei ($40)
$1f:d43f  d4 02         pei ($02)
$1f:d441  97 02         sta [$02],y
$1f:d443  81 19         sta ($19,x)
$1f:d445  02 02         cop #$02
$1f:d447  83 02         sta $02,s
$1f:d449  28            plp
$1f:d44a  4e d4 80      lsr $80d4
$1f:d44d  3a            dec a
$1f:d44e  02 9a         cop #$9a
$1f:d450  08            php
$1f:d451  00 28         brk #$28
$1f:d453  d4 1e         pei ($1e)
$1f:d455  d4 42         pei ($42)
$1f:d457  d4 02         pei ($02)
$1f:d459  97 02         sta [$02],y
$1f:d45b  81 17         sta ($17,x)
$1f:d45d  02 02         cop #$02
$1f:d45f  83 02         sta $02,s
$1f:d461  28            plp
$1f:d462  66 d4         ror $d4
$1f:d464  80 22         bra $d488
$1f:d466  02 9b         cop #$9b
$1f:d468  08            php
$1f:d469  00 5a         brk #$5a
$1f:d46b  d4 14         pei ($14)
$1f:d46d  d4 70         pei ($70)
$1f:d46f  d4 02         pei ($02)
$1f:d471  97 02         sta [$02],y
$1f:d473  81 16         sta ($16,x)
$1f:d475  02 02         cop #$02
$1f:d477  83 02         sta $02,s
$1f:d479  28            plp
$1f:d47a  7e d4 80      ror $80d4,x
$1f:d47d  0a            asl a
$1f:d47e  02 9b         cop #$9b
$1f:d480  08            php
$1f:d481  00 58         brk #$58
$1f:d483  d4 14         pei ($14)
$1f:d485  d4 72         pei ($72)
$1f:d487  d4 02         pei ($02)
$1f:d489  80 15         bra $d4a0
$1f:d48b  02 82         cop #$82
$1f:d48d  02 ad         cop #$ad
$1f:d48f  08            php
$1f:d490  02 9c         cop #$9c
$1f:d492  96 d4         stx $d4,y
$1f:d494  a0 d4         ldy #$d4
$1f:d496  02 9a         cop #$9a
$1f:d498  00 00         brk #$00
$1f:d49a  aa            tax
$1f:d49b  d4 c0         pei ($c0)
$1f:d49d  d4 c0         pei ($c0)
$1f:d49f  d4 02         pei ($02)
$1f:d4a1  9b            txy
$1f:d4a2  00 00         brk #$00
$1f:d4a4  d6 d4         dec $d4,x
$1f:d4a6  ec d4 ec      cpx $ecd4
$1f:d4a9  d4 02         pei ($02)
$1f:d4ab  97 02         sta [$02],y
$1f:d4ad  23 b8         and $b8,s
$1f:d4af  d4 02         pei ($02)
$1f:d4b1  81 14         sta ($14,x)
$1f:d4b3  04 02         tsb $02
$1f:d4b5  83 80         sta $80,s
$1f:d4b7  d5 02         cmp $02,x
$1f:d4b9  80 11         bra $d4cc
$1f:d4bb  02 82         cop #$82
$1f:d4bd  82 4b ff      brl $d40b
$1f:d4c0  02 96         cop #$96
$1f:d4c2  02 24         cop #$24
$1f:d4c4  ce d4 02      dec $02d4
$1f:d4c7  81 14         sta ($14,x)
$1f:d4c9  04 02         tsb $02
$1f:d4cb  83 80         sta $80,s
$1f:d4cd  bf 02 80 11   lda $118002,x
$1f:d4d1  02 82         cop #$82
$1f:d4d3  82 35 ff      brl $d40b
$1f:d4d6  02 97         cop #$97
$1f:d4d8  02 21         cop #$21
$1f:d4da  e4 d4         cpx $d4
$1f:d4dc  02 81         cop #$81
$1f:d4de  13 04         ora ($04,s),y
$1f:d4e0  02 83         cop #$83
$1f:d4e2  80 a9         bra $d48d
$1f:d4e4  02 80         cop #$80
$1f:d4e6  10 02         bpl $d4ea
$1f:d4e8  82 82 1f      brl $f46d
$1f:d4eb  ff 02 97 02   sbc $029702,x
$1f:d4ef  22 fa d4 02   jsl $02d4fa
$1f:d4f3  81 12         sta ($12,x)
$1f:d4f5  04 02         tsb $02
$1f:d4f7  83 80         sta $80,s
$1f:d4f9  93 02         sta ($02,s),y
$1f:d4fb  80 0f         bra $d50c
$1f:d4fd  02 82         cop #$82
$1f:d4ff  82 09 ff      brl $d40b
$1f:d502  02 a5         cop #$a5
$1f:d504  73 d6         adc ($d6,s),y
$1f:d506  83 d5         sta $d5,s
$1f:d508  0c d5 fa      tsb $fad5
$1f:d50b  d5 02         cmp $02,x
$1f:d50d  97 02         sta [$02],y
$1f:d50f  80 1b         bra $d52c
$1f:d511  02 82         cop #$82
$1f:d513  02 ad         cop #$ad
$1f:d515  08            php
$1f:d516  02 9a         cop #$9a
$1f:d518  20 00 20      jsr $2000
$1f:d51b  d5 2b         cmp $2b,x
$1f:d51d  d5 20         cmp $20,x
$1f:d51f  d5 02         cmp $02,x
$1f:d521  23 83         and $83,s
$1f:d523  d5 02         cmp $02,x
$1f:d525  80 1e         bra $d545
$1f:d527  02 82         cop #$82
$1f:d529  80 e8         bra $d513
$1f:d52b  02 9b         cop #$9b
$1f:d52d  00 00         brk #$00
$1f:d52f  35 d5         and $d5,x
$1f:d531  58            cli
$1f:d532  d5 58         cmp $58,x
$1f:d534  d5 02         cmp $02,x
$1f:d536  ae 00 00      ldx $0000
$1f:d539  d0 ff         bne $d53a
$1f:d53b  20 d5 02      jsr $02d5
$1f:d53e  ae 00 00      ldx $0000
$1f:d541  f0 ff         beq $d542
$1f:d543  47 d5         eor [$d5]
$1f:d545  80 d9         bra $d520
$1f:d547  02 80         cop #$80
$1f:d549  21 02         and ($02,x)
$1f:d54b  82 02 80      brl $5550
$1f:d54e  23 02         and $02,s
$1f:d550  82 02 80      brl $5555
$1f:d553  21 02         and ($02,x)
$1f:d555  82 80 21      brl $f6d8
$1f:d558  02 ae         cop #$ae
$1f:d55a  00 00         brk #$00
$1f:d55c  30 00         bmi $d55e
$1f:d55e  20 d5 02      jsr $02d5
$1f:d561  ae 00 00      ldx $0000
$1f:d564  10 00         bpl $d566
$1f:d566  6a            ror a
$1f:d567  d5 80         cmp $80,x
$1f:d569  b6 02         ldx $02,y
$1f:d56b  80 21         bra $d58e
$1f:d56d  02 82         cop #$82
$1f:d56f  02 80         cop #$80
$1f:d571  22 02 82 02   jsl $028202  ; -> Sub_02_8202
$1f:d575  80 21         bra $d598
$1f:d577  02 82         cop #$82
$1f:d579  02 9a         cop #$9a
$1f:d57b  00 00         brk #$00
$1f:d57d  0c d5 83      tsb $83d5
$1f:d580  d5 83         cmp $83,x
$1f:d582  d5 02         cmp $02,x
$1f:d584  96 02         stx $02,y
$1f:d586  80 1b         bra $d5a3
$1f:d588  02 82         cop #$82
$1f:d58a  02 ad         cop #$ad
$1f:d58c  08            php
$1f:d58d  02 9a         cop #$9a
$1f:d58f  20 00 97      jsr $9700
$1f:d592  d5 a2         cmp $a2,x
$1f:d594  d5 97         cmp $97,x
$1f:d596  d5 02         cmp $02,x
$1f:d598  24 0c         bit $0c
$1f:d59a  d5 02         cmp $02,x
$1f:d59c  80 1e         bra $d5bc
$1f:d59e  02 82         cop #$82
$1f:d5a0  80 e8         bra $d58a
$1f:d5a2  02 9b         cop #$9b
$1f:d5a4  00 00         brk #$00
$1f:d5a6  ac d5 cf      ldy $cfd5
$1f:d5a9  d5 cf         cmp $cf,x
$1f:d5ab  d5 02         cmp $02,x
$1f:d5ad  ae 00 00      ldx $0000
$1f:d5b0  d0 ff         bne $d5b1
$1f:d5b2  97 d5         sta [$d5],y
$1f:d5b4  02 ae         cop #$ae
$1f:d5b6  00 00         brk #$00
$1f:d5b8  f0 ff         beq $d5b9
$1f:d5ba  be d5 80      ldx $80d5,y
$1f:d5bd  d9 02 80      cmp $8002,y
$1f:d5c0  21 02         and ($02,x)
$1f:d5c2  82 02 80      brl $55c7
$1f:d5c5  23 02         and $02,s
$1f:d5c7  82 02 80      brl $55cc
$1f:d5ca  21 02         and ($02,x)
$1f:d5cc  82 80 21      brl $f74f
$1f:d5cf  02 ae         cop #$ae
$1f:d5d1  00 00         brk #$00
$1f:d5d3  30 00         bmi $d5d5
$1f:d5d5  97 d5         sta [$d5],y
$1f:d5d7  02 ae         cop #$ae
$1f:d5d9  00 00         brk #$00
$1f:d5db  10 00         bpl $d5dd
$1f:d5dd  e1 d5         sbc ($d5,x)
$1f:d5df  80 b6         bra $d597
$1f:d5e1  02 80         cop #$80
$1f:d5e3  21 02         and ($02,x)
$1f:d5e5  82 02 80      brl $55ea
$1f:d5e8  22 02 82 02   jsl $028202  ; -> Sub_02_8202
$1f:d5ec  80 21         bra $d60f
$1f:d5ee  02 82         cop #$82
$1f:d5f0  02 9a         cop #$9a
$1f:d5f2  00 00         brk #$00
$1f:d5f4  0c d5 83      tsb $83d5
$1f:d5f7  d5 83         cmp $83,x
$1f:d5f9  d5 02         cmp $02,x
$1f:d5fb  97 02         sta [$02],y
$1f:d5fd  80 1a         bra $d619
$1f:d5ff  02 82         cop #$82
$1f:d601  02 ad         cop #$ad
$1f:d603  08            php
$1f:d604  02 9b         cop #$9b
$1f:d606  20 00 0e      jsr $0e00
$1f:d609  d6 19         dec $19,x
$1f:d60b  d6 0e         dec $0e,x
$1f:d60d  d6 02         dec $02,x
$1f:d60f  21 73         and ($73,x)
$1f:d611  d6 02         dec $02,x
$1f:d613  80 1c         bra $d631
$1f:d615  02 82         cop #$82
$1f:d617  80 e8         bra $d601
$1f:d619  02 9a         cop #$9a
$1f:d61b  00 00         brk #$00
$1f:d61d  23 d6         and $d6,s
$1f:d61f  46 d6         lsr $d6
$1f:d621  46 d6         lsr $d6
$1f:d623  02 ae         cop #$ae
$1f:d625  d0 ff         bne $d626
$1f:d627  00 00         brk #$00
$1f:d629  0e d6 02      asl $02d6
$1f:d62c  ae f0 ff      ldx $fff0
$1f:d62f  00 00         brk #$00
$1f:d631  35 d6         and $d6,x
$1f:d633  80 d9         bra $d60e
$1f:d635  02 80         cop #$80
$1f:d637  1f 02 82 02   ora $028202,x
$1f:d63b  80 20         bra $d65d
$1f:d63d  02 82         cop #$82
$1f:d63f  02 80         cop #$80
$1f:d641  1f 02 82 80   ora $808202,x
$1f:d645  23 02         and $02,s
$1f:d647  ae 30 00      ldx $0030
$1f:d64a  00 00         brk #$00
$1f:d64c  0e d6 02      asl $02d6
$1f:d64f  ae 10 00      ldx $0010
$1f:d652  00 00         brk #$00
$1f:d654  58            cli
$1f:d655  d6 80         dec $80,x
$1f:d657  b6 02         ldx $02,y
$1f:d659  96 02         stx $02,y
$1f:d65b  80 1f         bra $d67c
$1f:d65d  02 82         cop #$82
$1f:d65f  02 80         cop #$80
$1f:d661  20 02 82      jsr $8202
$1f:d664  02 80         cop #$80
$1f:d666  1f 02 82 02   ora $028202,x
$1f:d66a  9b            txy
$1f:d66b  00 00         brk #$00
$1f:d66d  fa            plx
$1f:d66e  d5 73         cmp $73,x
$1f:d670  d6 73         dec $73,x
$1f:d672  d6 02         dec $02,x
$1f:d674  97 02         sta [$02],y
$1f:d676  80 1a         bra $d692
$1f:d678  02 82         cop #$82
$1f:d67a  02 ad         cop #$ad
$1f:d67c  08            php
$1f:d67d  02 9b         cop #$9b
$1f:d67f  20 00 87      jsr $8700
$1f:d682  d6 92         dec $92,x
$1f:d684  d6 87         dec $87,x
$1f:d686  d6 02         dec $02,x
$1f:d688  22 fa d5 02   jsl $02d5fa
$1f:d68c  80 1d         bra $d6ab
$1f:d68e  02 82         cop #$82
$1f:d690  80 e8         bra $d67a
$1f:d692  02 9a         cop #$9a
$1f:d694  00 00         brk #$00
$1f:d696  9c d6 bf      stz $bfd6
$1f:d699  d6 bf         dec $bf,x
$1f:d69b  d6 02         dec $02,x
$1f:d69d  ae d0 ff      ldx $ffd0
$1f:d6a0  00 00         brk #$00
$1f:d6a2  87 d6         sta [$d6]
$1f:d6a4  02 ae         cop #$ae
$1f:d6a6  f0 ff         beq $d6a7
$1f:d6a8  00 00         brk #$00
$1f:d6aa  ae d6 80      ldx $80d6
$1f:d6ad  d9 02 80      cmp $8002,y
$1f:d6b0  1f 02 82 02   ora $028202,x
$1f:d6b4  80 20         bra $d6d6
$1f:d6b6  02 82         cop #$82
$1f:d6b8  02 80         cop #$80
$1f:d6ba  1f 02 82 80   ora $808202,x
$1f:d6be  23 02         and $02,s
$1f:d6c0  ae 30 00      ldx $0030
$1f:d6c3  00 00         brk #$00
$1f:d6c5  87 d6         sta [$d6]
$1f:d6c7  02 ae         cop #$ae
$1f:d6c9  10 00         bpl $d6cb
$1f:d6cb  00 00         brk #$00
$1f:d6cd  d1 d6         cmp ($d6),y
$1f:d6cf  80 b6         bra $d687
$1f:d6d1  02 96         cop #$96
$1f:d6d3  02 80         cop #$80
$1f:d6d5  1f 02 82 02   ora $028202,x
$1f:d6d9  80 20         bra $d6fb
$1f:d6db  02 82         cop #$82
$1f:d6dd  02 80         cop #$80
$1f:d6df  1f 02 82 02   ora $028202,x
$1f:d6e3  9b            txy
$1f:d6e4  00 00         brk #$00
$1f:d6e6  fa            plx
$1f:d6e7  d5 73         cmp $73,x
$1f:d6e9  d6 73         dec $73,x
$1f:d6eb  d6 02         dec $02,x
$1f:d6ed  a5 f6         lda $f6
$1f:d6ef  d6 fc         dec $fc,x
$1f:d6f1  d6 24         dec $24,x
$1f:d6f3  d7 2a         cmp [$2a],y
$1f:d6f5  d7 02         cmp [$02],y
$1f:d6f7  9f f0 ff 80   sta $80fff0,x
$1f:d6fb  15 02         ora $02,x
$1f:d6fd  9f 10 00 bd   sta $bd0010,x
$1f:d701  16 00         asl $00,x
$1f:d703  09 00 01      ora #$0100
$1f:d706  9d 16 00      sta $0016,x
$1f:d709  02 a2         cop #$a2
$1f:d70b  20 02 80      jsr $8002
$1f:d70e  25 02         and $02
$1f:d710  82 bd 16      brl $edd0
$1f:d713  00 29         brk #$29
$1f:d715  ff fe 9d 16   sbc $169dfe,x
$1f:d719  00 02         brk #$02
$1f:d71b  a2 30         ldx #$30
$1f:d71d  02 80         cop #$80
$1f:d71f  24 02         bit $02
$1f:d721  82 80 dc      brl $b3a4
$1f:d724  02 a0         cop #$a0
$1f:d726  f8            sed
$1f:d727  ff 80 15 02   sbc $021580,x
$1f:d72b  a0 18         ldy #$18
$1f:d72d  00 bd         brk #$bd
$1f:d72f  16 00         asl $00,x
$1f:d731  09 00 01      ora #$0100
$1f:d734  9d 16 00      sta $0016,x
$1f:d737  02 a2         cop #$a2
$1f:d739  20 02 80      jsr $8002
$1f:d73c  27 02         and [$02]
$1f:d73e  82 bd 16      brl $edfe
$1f:d741  00 29         brk #$29
$1f:d743  ff fe 9d 16   sbc $169dfe,x
$1f:d747  00 02         brk #$02
$1f:d749  a2 30         ldx #$30
$1f:d74b  02 80         cop #$80
$1f:d74d  26 02         rol $02
$1f:d74f  82 80 dc      brl $b3d2
$1f:d752  02 a5         cop #$a5
$1f:d754  5c d7 1c d8   jml $d81cd7
$1f:d758  dc d7 9c      jml [$9cd7]
$1f:d75b  d7 20         cmp [$20],y
$1f:d75d  5c d8 02 24   jml $2402d8
$1f:d761  6b            rtl
$1f:d762  d7 02         cmp [$02],y
$1f:d764  81 2f         sta ($2f,x)
$1f:d766  04 02         tsb $02
$1f:d768  83 80         sta $80,s
$1f:d76a  f1 02         sbc ($02),y
$1f:d76c  1b            tcs
$1f:d76d  71 d7         adc ($d7),y
$1f:d76f  00 00         brk #$00
$1f:d771  02 ad         cop #$ad
$1f:d773  08            php
$1f:d774  02 22         cop #$22
$1f:d776  cd d7 02      cmp $02d7
$1f:d779  81 2c         sta ($2c,x)
$1f:d77b  04 02         tsb $02
$1f:d77d  83 20         sta $20,s
$1f:d77f  5c d8 02 23   jml $2302d8
$1f:d783  8d d7 02      sta $02d7
$1f:d786  81 2e         sta ($2e,x)
$1f:d788  04 02         tsb $02
$1f:d78a  83 80         sta $80,s
$1f:d78c  f1 02         sbc ($02),y
$1f:d78e  ad 08 02      lda $0208
$1f:d791  22 ab d7 02   jsl $02d7ab
$1f:d795  81 2c         sta ($2c,x)
$1f:d797  04 02         tsb $02
$1f:d799  83 80         sta $80,s
$1f:d79b  c0 20         cpy #$20
$1f:d79d  5c d8 02 23   jml $2302d8
$1f:d7a1  ab            plb
$1f:d7a2  d7 02         cmp [$02],y
$1f:d7a4  81 2e         sta ($2e,x)
$1f:d7a6  04 02         tsb $02
$1f:d7a8  83 80         sta $80,s
$1f:d7aa  f1 02         sbc ($02),y
$1f:d7ac  1b            tcs
$1f:d7ad  b1 d7         lda ($d7),y
$1f:d7af  00 00         brk #$00
$1f:d7b1  02 ad         cop #$ad
$1f:d7b3  08            php
$1f:d7b4  02 21         cop #$21
$1f:d7b6  8d d7 02      sta $02d7
$1f:d7b9  81 2d         sta ($2d,x)
$1f:d7bb  04 02         tsb $02
$1f:d7bd  83 20         sta $20,s
$1f:d7bf  5c d8 02 24   jml $2402d8
$1f:d7c3  cd d7 02      cmp $02d7
$1f:d7c6  81 2f         sta ($2f,x)
$1f:d7c8  04 02         tsb $02
$1f:d7ca  83 80         sta $80,s
$1f:d7cc  f1 02         sbc ($02),y
$1f:d7ce  ad 08 02      lda $0208
$1f:d7d1  21 6b         and ($6b,x)
$1f:d7d3  d7 02         cmp [$02],y
$1f:d7d5  81 2d         sta ($2d,x)
$1f:d7d7  04 02         tsb $02
$1f:d7d9  83 80         sta $80,s
$1f:d7db  c0 20         cpy #$20
$1f:d7dd  5c d8 02 22   jml $2202d8
$1f:d7e1  eb            xba
$1f:d7e2  d7 02         cmp [$02],y
$1f:d7e4  81 2c         sta ($2c,x)
$1f:d7e6  04 02         tsb $02
$1f:d7e8  83 80         sta $80,s
$1f:d7ea  f1 02         sbc ($02),y
$1f:d7ec  1b            tcs
$1f:d7ed  f1 d7         sbc ($d7),y
$1f:d7ef  00 00         brk #$00
$1f:d7f1  02 ad         cop #$ad
$1f:d7f3  08            php
$1f:d7f4  02 24         cop #$24
$1f:d7f6  4d d8 02      eor $02d8
$1f:d7f9  81 2f         sta ($2f,x)
$1f:d7fb  04 02         tsb $02
$1f:d7fd  83 20         sta $20,s
$1f:d7ff  5c d8 02 21   jml $2102d8
$1f:d803  0d d8 02      ora $02d8
$1f:d806  81 2d         sta ($2d,x)
$1f:d808  04 02         tsb $02
$1f:d80a  83 80         sta $80,s
$1f:d80c  f1 02         sbc ($02),y
$1f:d80e  ad 08 02      lda $0208
$1f:d811  24 2b         bit $2b
$1f:d813  d8            cld
$1f:d814  02 81         cop #$81
$1f:d816  2f 04 02 83   and $830204
$1f:d81a  80 c0         bra $d7dc
$1f:d81c  20 5c d8      jsr $d85c
$1f:d81f  02 21         cop #$21
$1f:d821  2b            pld
$1f:d822  d8            cld
$1f:d823  02 81         cop #$81
$1f:d825  2d 04 02      and $0204
$1f:d828  83 80         sta $80,s
$1f:d82a  f1 02         sbc ($02),y
$1f:d82c  1b            tcs
$1f:d82d  31 d8         and ($d8),y
$1f:d82f  00 00         brk #$00
$1f:d831  02 ad         cop #$ad
$1f:d833  08            php
$1f:d834  02 23         cop #$23
$1f:d836  0d d8 02      ora $02d8
$1f:d839  81 2e         sta ($2e,x)
$1f:d83b  04 02         tsb $02
$1f:d83d  83 20         sta $20,s
$1f:d83f  5c d8 02 22   jml $2202d8
$1f:d843  4d d8 02      eor $02d8
$1f:d846  81 2c         sta ($2c,x)
$1f:d848  04 02         tsb $02
$1f:d84a  83 80         sta $80,s
$1f:d84c  f1 02         sbc ($02),y
$1f:d84e  ad 08 02      lda $0208
$1f:d851  23 eb         and $eb,s
$1f:d853  d7 02         cmp [$02],y
$1f:d855  81 2e         sta ($2e,x)
$1f:d857  04 02         tsb $02
$1f:d859  83 80         sta $80,s
$1f:d85b  c0 02         cpy #$02
$1f:d85d  0c 00 02      tsb $0200
$1f:d860  63 d8         adc $d8,s
$1f:d862  60            rts
$1f:d863  68            pla
$1f:d864  9d 30 00      sta $0030,x
$1f:d867  02 80         cop #$80
$1f:d869  30 02         bmi $d86d
$1f:d86b  82 bd 16      brl $ef2b
$1f:d86e  00 09         brk #$09
$1f:d870  00 02         brk #$02
$1f:d872  9d 16 00      sta $0016,x
$1f:d875  00 56         brk #$56
$1f:d877  02 b2         cop #$b2
$1f:d879  e8            inx
$1f:d87a  d8            cld
$1f:d87b  1f 00 00 08   ora $080000,x
$1f:d87f  00 00         brk #$00
$1f:d881  02 02         cop #$02
$1f:d883  b2 fe         lda ($fe)
$1f:d885  d8            cld
$1f:d886  1f 10 00 f8   ora $f80010,x
$1f:d88a  ff 00 02 02   sbc $020200,x
$1f:d88e  b2 16         lda ($16)
$1f:d890  d9 1f 00      cmp $001f,y
$1f:d893  00 e8         brk #$e8
$1f:d895  ff 00 02 02   sbc $020200,x
$1f:d899  b2 2a         lda ($2a)
$1f:d89b  d9 1f f0      cmp $f01f,y
$1f:d89e  ff f8 ff 00   sbc $00fff8,x
$1f:d8a2  02 02         cop #$02
$1f:d8a4  1b            tcs
$1f:d8a5  a9 d8 01      lda #$01d8
$1f:d8a8  00 02         brk #$02
$1f:d8aa  b2 f2         lda ($f2)
$1f:d8ac  d8            cld
$1f:d8ad  1f 10 00 08   ora $080010,x
$1f:d8b1  00 00         brk #$00
$1f:d8b3  02 02         cop #$02
$1f:d8b5  b2 0a         lda ($0a)
$1f:d8b7  d9 1f 10      cmp $101f,y
$1f:d8ba  00 e8         brk #$e8
$1f:d8bc  ff 00 02 02   sbc $020200,x
$1f:d8c0  b2 20         lda ($20)
$1f:d8c2  d9 1f f0      cmp $f01f,y
$1f:d8c5  ff e8 ff 00   sbc $00ffe8,x
$1f:d8c9  02 02         cop #$02
$1f:d8cb  b2 34         lda ($34)
$1f:d8cd  d9 1f f0      cmp $f01f,y
$1f:d8d0  ff 08 00 00   sbc $000008,x
$1f:d8d4  02 02         cop #$02
$1f:d8d6  80 31         bra $d909
$1f:d8d8  02 82         cop #$82
$1f:d8da  bd 16 00      lda $0016,x
$1f:d8dd  29 ff fd      and #$fdff
$1f:d8e0  9d 16 00      sta $0016,x
$1f:d8e3  bd 30 00      lda $0030,x
$1f:d8e6  48            pha
$1f:d8e7  60            rts
$1f:d8e8  02 a3         cop #$a3
$1f:d8ea  02 81         cop #$81
$1f:d8ec  32 03         and ($03)
$1f:d8ee  02 83         cop #$83
$1f:d8f0  80 4a         bra $d93c
$1f:d8f2  02 a3         cop #$a3
$1f:d8f4  02 96         cop #$96
$1f:d8f6  02 81         cop #$81
$1f:d8f8  35 03         and $03,x
$1f:d8fa  02 83         cop #$83
$1f:d8fc  80 3e         bra $d93c
$1f:d8fe  02 a3         cop #$a3
$1f:d900  02 96         cop #$96
$1f:d902  02 81         cop #$81
$1f:d904  34 03         bit $03,x
$1f:d906  02 83         cop #$83
$1f:d908  80 32         bra $d93c
$1f:d90a  02 a3         cop #$a3
$1f:d90c  02 96         cop #$96
$1f:d90e  02 81         cop #$81
$1f:d910  36 03         rol $03,x
$1f:d912  02 83         cop #$83
$1f:d914  80 26         bra $d93c
$1f:d916  02 a3         cop #$a3
$1f:d918  02 81         cop #$81
$1f:d91a  33 03         and ($03,s),y
$1f:d91c  02 83         cop #$83
$1f:d91e  80 1c         bra $d93c
$1f:d920  02 a3         cop #$a3
$1f:d922  02 81         cop #$81
$1f:d924  36 03         rol $03,x
$1f:d926  02 83         cop #$83
$1f:d928  80 12         bra $d93c
$1f:d92a  02 a3         cop #$a3
$1f:d92c  02 81         cop #$81
$1f:d92e  34 03         bit $03,x
$1f:d930  02 83         cop #$83
$1f:d932  80 08         bra $d93c
$1f:d934  02 a3         cop #$a3
$1f:d936  02 81         cop #$81
$1f:d938  35 03         and $03,x
$1f:d93a  02 83         cop #$83
$1f:d93c  02 80         cop #$80
$1f:d93e  37 02         and [$02],y
$1f:d940  82 02 86      brl $5f45
$1f:d943  6b            rtl
$1f:d944  bd 16 00      lda $0016,x
$1f:d947  89 00 80      bit #$8000
$1f:d94a  f0 06         beq $d952
$1f:d94c  02 1b         cop #$1b
$1f:d94e  44 d9 04      mvp $04,$d9
$1f:d951  00 02         brk #$02
$1f:d953  9b            txy
$1f:d954  08            php
$1f:d955  00 5c         brk #$5c
$1f:d957  d9 76 d9      cmp $d976,y
$1f:d95a  69 d9 02      adc #$02d9
$1f:d95d  21 9c         and ($9c,x)
$1f:d95f  d9 02 97      cmp $9702,y
$1f:d962  02 80         cop #$80
$1f:d964  04 02         tsb $02
$1f:d966  82 80 db      brl $b4e9
$1f:d969  02 22         cop #$22
$1f:d96b  9c d9 02      stz $02d9
$1f:d96e  97 02         sta [$02],y
$1f:d970  80 03         bra $d975
$1f:d972  02 82         cop #$82
$1f:d974  80 ce         bra $d944
$1f:d976  02 9a         cop #$9a
$1f:d978  00 00         brk #$00
$1f:d97a  80 d9         bra $d955
$1f:d97c  8a            txa
$1f:d97d  d9 8a d9      cmp $d98a,y
$1f:d980  02 97         cop #$97
$1f:d982  02 81         cop #$81
$1f:d984  02 02         cop #$02
$1f:d986  02 83         cop #$83
$1f:d988  80 0a         bra $d994
$1f:d98a  02 96         cop #$96
$1f:d98c  02 81         cop #$81
$1f:d98e  02 02         cop #$02
$1f:d990  02 83         cop #$83
$1f:d992  80 00         bra $d994
$1f:d994  bd 16 00      lda $0016,x
$1f:d997  89 00 80      bit #$8000
$1f:d99a  f0 06         beq $d9a2
$1f:d99c  02 1b         cop #$1b
$1f:d99e  94 d9         sty $d9,x
$1f:d9a0  04 00         tsb $00
$1f:d9a2  02 9a         cop #$9a
$1f:d9a4  08            php
$1f:d9a5  00 ac         brk #$ac
$1f:d9a7  d9 c6 d9      cmp $d9c6,y
$1f:d9aa  b9 d9 02      lda $02d9,y
$1f:d9ad  23 4c         and $4c,s
$1f:d9af  d9 02 97      cmp $9702,y
$1f:d9b2  02 80         cop #$80
$1f:d9b4  05 02         ora $02
$1f:d9b6  82 80 db      brl $b539
$1f:d9b9  02 24         cop #$24
$1f:d9bb  4c d9 02      jmp $02d9
$1f:d9be  96 02         stx $02,y
$1f:d9c0  80 05         bra $d9c7
$1f:d9c2  02 82         cop #$82
$1f:d9c4  80 ce         bra $d994
$1f:d9c6  02 9b         cop #$9b
$1f:d9c8  00 00         brk #$00
$1f:d9ca  d0 d9         bne $d9a5
$1f:d9cc  db            stp
$1f:d9cd  d9 db d9      cmp $d9db,y
$1f:d9d0  02 97         cop #$97
$1f:d9d2  02 81         cop #$81
$1f:d9d4  01 02         ora ($02,x)
$1f:d9d6  02 83         cop #$83
$1f:d9d8  82 69 ff      brl $d944
$1f:d9db  02 97         cop #$97
$1f:d9dd  02 81         cop #$81
$1f:d9df  00 02         brk #$02
$1f:d9e1  02 83         cop #$83
$1f:d9e3  82 5e ff      brl $d944
$1f:d9e6  bd 16 00      lda $0016,x
$1f:d9e9  89 00 80      bit #$8000
$1f:d9ec  f0 06         beq $d9f4
$1f:d9ee  02 1b         cop #$1b
$1f:d9f0  e6 d9         inc $d9
$1f:d9f2  04 00         tsb $00
$1f:d9f4  02 9b         cop #$9b
$1f:d9f6  08            php
$1f:d9f7  00 fe         brk #$fe
$1f:d9f9  d9 18 da      cmp $da18,y
$1f:d9fc  0b            phd
$1f:d9fd  da            phx
$1f:d9fe  02 21         cop #$21
$1f:da00  5c da 02 97   jml $9702da
$1f:da04  02 80         cop #$80
$1f:da06  07 02         ora [$02]
$1f:da08  82 80 db      brl $b58b
$1f:da0b  02 22         cop #$22
$1f:da0d  5c da 02 97   jml $9702da
$1f:da11  02 80         cop #$80
$1f:da13  06 02         asl $02
$1f:da15  82 80 ce      brl $a898
$1f:da18  02 9a         cop #$9a
$1f:da1a  00 00         brk #$00
$1f:da1c  22 da 3b da   jsl $da3bda
$1f:da20  3b            tsc
$1f:da21  da            phx
$1f:da22  02 97         cop #$97
$1f:da24  02 80         cop #$80
$1f:da26  0d 02 82      ora $8202
$1f:da29  02 b2         cop #$b2
$1f:da2b  c4 da         cpy $da
$1f:da2d  1f f8 ff 00   ora $00fff8,x
$1f:da31  00 00         brk #$00
$1f:da33  02 02         cop #$02
$1f:da35  80 0e         bra $da45
$1f:da37  02 82         cop #$82
$1f:da39  80 19         bra $da54
$1f:da3b  02 96         cop #$96
$1f:da3d  02 80         cop #$80
$1f:da3f  0d 02 82      ora $8202
$1f:da42  02 b2         cop #$b2
$1f:da44  ce da 1f      dec $1fda
$1f:da47  08            php
$1f:da48  00 00         brk #$00
$1f:da4a  00 00         brk #$00
$1f:da4c  02 02         cop #$02
$1f:da4e  80 0e         bra $da5e
$1f:da50  02 82         cop #$82
$1f:da52  80 00         bra $da54
$1f:da54  bd 16 00      lda $0016,x
$1f:da57  89 00 80      bit #$8000
$1f:da5a  f0 06         beq $da62
$1f:da5c  02 1b         cop #$1b
$1f:da5e  54 da 04      mvn $04,$da
$1f:da61  00 02         brk #$02
$1f:da63  9a            txs
$1f:da64  08            php
$1f:da65  00 6c         brk #$6c
$1f:da67  da            phx
$1f:da68  86 da         stx $da
$1f:da6a  79 da 02      adc $02da,y
$1f:da6d  23 ee         and $ee,s
$1f:da6f  d9 02 97      cmp $9702,y
$1f:da72  02 80         cop #$80
$1f:da74  08            php
$1f:da75  02 82         cop #$82
$1f:da77  80 db         bra $da54
$1f:da79  02 24         cop #$24
$1f:da7b  ee d9 02      inc $02d9
$1f:da7e  96 02         stx $02,y
$1f:da80  80 08         bra $da8a
$1f:da82  02 82         cop #$82
$1f:da84  80 ce         bra $da54
$1f:da86  02 9b         cop #$9b
$1f:da88  00 00         brk #$00
$1f:da8a  90 da         bcc $da66
$1f:da8c  aa            tax
$1f:da8d  da            phx
$1f:da8e  aa            tax
$1f:da8f  da            phx
$1f:da90  02 97         cop #$97
$1f:da92  02 80         cop #$80
$1f:da94  0b            phd
$1f:da95  02 82         cop #$82
$1f:da97  02 b2         cop #$b2
$1f:da99  d8            cld
$1f:da9a  da            phx
$1f:da9b  1f 02 00 f8   ora $f80002,x
$1f:da9f  ff 00 02 02   sbc $020200,x
$1f:daa3  80 0c         bra $dab1
$1f:daa5  02 82         cop #$82
$1f:daa7  82 3c ff      brl $d9e6
$1f:daaa  02 97         cop #$97
$1f:daac  02 80         cop #$80
$1f:daae  09 02 82      ora #$8202
$1f:dab1  02 b2         cop #$b2
$1f:dab3  e2 da         sep #$da
$1f:dab5  1f fd ff 08   ora $08fffd,x
$1f:dab9  00 00         brk #$00
$1f:dabb  02 02         cop #$02
$1f:dabd  80 0a         bra $dac9
$1f:dabf  02 82         cop #$82
$1f:dac1  82 22 ff      brl $d9e6
$1f:dac4  00 5b         brk #$5b
$1f:dac6  02 81         cop #$81
$1f:dac8  11 08         ora ($08),y
$1f:daca  02 83         cop #$83
$1f:dacc  80 1c         bra $daea
$1f:dace  00 5b         brk #$5b
$1f:dad0  02 81         cop #$81
$1f:dad2  11 08         ora ($08),y
$1f:dad4  02 83         cop #$83
$1f:dad6  80 12         bra $daea
$1f:dad8  00 5b         brk #$5b
$1f:dada  02 81         cop #$81
$1f:dadc  10 08         bpl $dae6
$1f:dade  02 83         cop #$83
$1f:dae0  80 08         bra $daea
$1f:dae2  00 5b         brk #$5b
$1f:dae4  02 81         cop #$81
$1f:dae6  0f 08 02 83   ora $830208
$1f:daea  02 86         cop #$86
$1f:daec  6b            rtl
$1f:daed  bd 16 00      lda $0016,x
$1f:daf0  89 00 80      bit #$8000
$1f:daf3  f0 06         beq $dafb
$1f:daf5  02 1b         cop #$1b
$1f:daf7  ed da 04      sbc $04da
$1f:dafa  00 02         brk #$02
$1f:dafc  9b            txy
$1f:dafd  08            php
$1f:dafe  00 05         brk #$05
$1f:db00  db            stp
$1f:db01  1f db 12 db   ora $db12db,x
$1f:db05  02 21         cop #$21
$1f:db07  7b            tdc
$1f:db08  db            stp
$1f:db09  02 97         cop #$97
$1f:db0b  02 80         cop #$80
$1f:db0d  16 02         asl $02,x
$1f:db0f  82 80 db      brl $b692
$1f:db12  02 22         cop #$22
$1f:db14  7b            tdc
$1f:db15  db            stp
$1f:db16  02 97         cop #$97
$1f:db18  02 80         cop #$80
$1f:db1a  12 02         ora ($02)
$1f:db1c  82 80 ce      brl $a99f
$1f:db1f  02 9a         cop #$9a
$1f:db21  00 00         brk #$00
$1f:db23  29 db 4e      and #$4edb
$1f:db26  db            stp
$1f:db27  4e db 02      lsr $02db
$1f:db2a  97 bd         sta [$bd],y
$1f:db2c  16 00         asl $00,x
$1f:db2e  09 00 10      ora #$1000
$1f:db31  9d 16 00      sta $0016,x
$1f:db34  02 80         cop #$80
$1f:db36  1b            tcs
$1f:db37  02 82         cop #$82
$1f:db39  02 80         cop #$80
$1f:db3b  1c 02 82      trb $8202
$1f:db3e  02 80         cop #$80
$1f:db40  1d 02 82      ora $8202,x
$1f:db43  bd 16 00      lda $0016,x
$1f:db46  29 ff ef      and #$efff
$1f:db49  9d 16 00      sta $0016,x
$1f:db4c  80 25         bra $db73
$1f:db4e  02 96         cop #$96
$1f:db50  bd 16 00      lda $0016,x
$1f:db53  09 00 10      ora #$1000
$1f:db56  9d 16 00      sta $0016,x
$1f:db59  02 80         cop #$80
$1f:db5b  1b            tcs
$1f:db5c  02 82         cop #$82
$1f:db5e  02 80         cop #$80
$1f:db60  1c 02 82      trb $8202
$1f:db63  02 80         cop #$80
$1f:db65  1d 02 82      ora $8202,x
$1f:db68  bd 16 00      lda $0016,x
$1f:db6b  29 ff ef      and #$efff
$1f:db6e  9d 16 00      sta $0016,x
$1f:db71  80 00         bra $db73
$1f:db73  bd 16 00      lda $0016,x
$1f:db76  89 00 80      bit #$8000
$1f:db79  f0 06         beq $db81
$1f:db7b  02 1b         cop #$1b
$1f:db7d  73 db         adc ($db,s),y
$1f:db7f  04 00         tsb $00
$1f:db81  02 9a         cop #$9a
$1f:db83  08            php
$1f:db84  00 8b         brk #$8b
$1f:db86  db            stp
$1f:db87  a5 db         lda $db
$1f:db89  98            tya
$1f:db8a  db            stp
$1f:db8b  02 23         cop #$23
$1f:db8d  f5 da         sbc $da,x
$1f:db8f  02 97         cop #$97
$1f:db91  02 80         cop #$80
$1f:db93  1a            inc a
$1f:db94  02 82         cop #$82
$1f:db96  80 db         bra $db73
$1f:db98  02 24         cop #$24
$1f:db9a  f5 da         sbc $da,x
$1f:db9c  02 96         cop #$96
$1f:db9e  02 80         cop #$80
$1f:dba0  1a            inc a
$1f:dba1  02 82         cop #$82
$1f:dba3  80 ce         bra $db73
$1f:dba5  02 9b         cop #$9b
$1f:dba7  00 00         brk #$00
$1f:dba9  af db d5 db   lda $dbd5db
$1f:dbad  d5 db         cmp $db,x
$1f:dbaf  02 97         cop #$97
$1f:dbb1  bd 16 00      lda $0016,x
$1f:dbb4  09 00 10      ora #$1000
$1f:dbb7  9d 16 00      sta $0016,x
$1f:dbba  02 80         cop #$80
$1f:dbbc  17 02         ora [$02],y
$1f:dbbe  82 02 80      brl $5bc3
$1f:dbc1  18            clc
$1f:dbc2  02 82         cop #$82
$1f:dbc4  02 80         cop #$80
$1f:dbc6  19 02 82      ora $8202,y
$1f:dbc9  bd 16 00      lda $0016,x
$1f:dbcc  29 ff ef      and #$efff
$1f:dbcf  9d 16 00      sta $0016,x
$1f:dbd2  82 18 ff      brl $daed
$1f:dbd5  02 97         cop #$97
$1f:dbd7  bd 16 00      lda $0016,x
$1f:dbda  09 00 10      ora #$1000
$1f:dbdd  9d 16 00      sta $0016,x
$1f:dbe0  02 80         cop #$80
$1f:dbe2  13 02         ora ($02,s),y
$1f:dbe4  82 02 80      brl $5be9
$1f:dbe7  14 02         trb $02
$1f:dbe9  82 02 80      brl $5bee
$1f:dbec  15 02         ora $02,x
$1f:dbee  82 bd 16      brl $f2ae
$1f:dbf1  00 29         brk #$29
$1f:dbf3  ff ef 9d 16   sbc $169def,x
$1f:dbf7  00 82         brk #$82
$1f:dbf9  f2 fe         sbc ($fe)
$1f:dbfb  02 a2         cop #$a2
$1f:dbfd  20 bd 16      jsr $16bd
$1f:dc00  00 89         brk #$89
$1f:dc02  00 80         brk #$80
$1f:dc04  f0 06         beq $dc0c
$1f:dc06  02 1b         cop #$1b
$1f:dc08  fe db 20      inc $20db,x
$1f:dc0b  00 02         brk #$02
$1f:dc0d  9a            txs
$1f:dc0e  10 00         bpl $dc10
$1f:dc10  16 dc         asl $dc,x
$1f:dc12  20 dc 16      jsr $16dc
$1f:dc15  dc 02 9b      jml [$9b02]
$1f:dc18  10 00         bpl $dc1a
$1f:dc1a  06 dc         asl $dc
$1f:dc1c  2a            rol a
$1f:dc1d  dc 06 dc      jml [$dc06]
$1f:dc20  02 9b         cop #$9b
$1f:dc22  00 00         brk #$00
$1f:dc24  70 dc         bvs $dc02
$1f:dc26  8f dc 8f dc   sta $dc8fdc
$1f:dc2a  02 9a         cop #$9a
$1f:dc2c  00 00         brk #$00
$1f:dc2e  34 dc         bit $dc,x
$1f:dc30  52 dc         eor ($dc)
$1f:dc32  52 dc         eor ($dc)
$1f:dc34  02 97         cop #$97
$1f:dc36  02 80         cop #$80
$1f:dc38  27 02         and [$02]
$1f:dc3a  82 02 b2      brl $8e3f
$1f:dc3d  ae dc 1f      ldx $1fdc
$1f:dc40  f8            sed
$1f:dc41  ff f8 ff 00   sbc $00fff8,x
$1f:dc45  03 02         ora $02,s
$1f:dc47  80 29         bra $dc72
$1f:dc49  02 82         cop #$82
$1f:dc4b  02 80         cop #$80
$1f:dc4d  26 02         rol $02
$1f:dc4f  82 80 b4      brl $90d2
$1f:dc52  02 96         cop #$96
$1f:dc54  02 80         cop #$80
$1f:dc56  27 02         and [$02]
$1f:dc58  82 02 b2      brl $8e5d
$1f:dc5b  bb            tyx
$1f:dc5c  dc 1f 08      jml [$081f]
$1f:dc5f  00 f8         brk #$f8
$1f:dc61  ff 00 03 02   sbc $020300,x
$1f:dc65  80 29         bra $dc90
$1f:dc67  02 82         cop #$82
$1f:dc69  02 80         cop #$80
$1f:dc6b  26 02         rol $02
$1f:dc6d  82 80 96      brl $72f0
$1f:dc70  02 97         cop #$97
$1f:dc72  02 80         cop #$80
$1f:dc74  23 02         and $02,s
$1f:dc76  82 02 b2      brl $8e7b
$1f:dc79  c8            iny
$1f:dc7a  dc 1f 00      jml [$001f]
$1f:dc7d  00 f0         brk #$f0
$1f:dc7f  ff 00 03 02   sbc $020300,x
$1f:dc83  80 25         bra $dcaa
$1f:dc85  02 82         cop #$82
$1f:dc87  02 80         cop #$80
$1f:dc89  22 02 82 82   jsl $828202
$1f:dc8d  77 ff         adc [$ff],y
$1f:dc8f  02 97         cop #$97
$1f:dc91  02 80         cop #$80
$1f:dc93  1f 02 82 02   ora $028202,x
$1f:dc97  b2 d5         lda ($d5)
$1f:dc99  dc 1f 00      jml [$001f]
$1f:dc9c  00 f8         brk #$f8
$1f:dc9e  ff 00 03 02   sbc $020300,x
$1f:dca2  80 21         bra $dcc5
$1f:dca4  02 82         cop #$82
$1f:dca6  02 80         cop #$80
$1f:dca8  1e 02 82      asl $8202,x
$1f:dcab  82 58 ff      brl $dc06
$1f:dcae  02 97         cop #$97
$1f:dcb0  02 a3         cop #$a3
$1f:dcb2  00 52         brk #$52
$1f:dcb4  02 80         cop #$80
$1f:dcb6  28            plp
$1f:dcb7  02 82         cop #$82
$1f:dcb9  80 25         bra $dce0
$1f:dcbb  02 96         cop #$96
$1f:dcbd  02 a3         cop #$a3
$1f:dcbf  00 52         brk #$52
$1f:dcc1  02 80         cop #$80
$1f:dcc3  28            plp
$1f:dcc4  02 82         cop #$82
$1f:dcc6  80 18         bra $dce0
$1f:dcc8  02 97         cop #$97
$1f:dcca  02 a3         cop #$a3
$1f:dccc  00 52         brk #$52
$1f:dcce  02 80         cop #$80
$1f:dcd0  24 02         bit $02
$1f:dcd2  82 80 0b      brl $e855
$1f:dcd5  02 97         cop #$97
$1f:dcd7  02 a3         cop #$a3
$1f:dcd9  00 52         brk #$52
$1f:dcdb  02 80         cop #$80
$1f:dcdd  20 02 82      jsr $8202
$1f:dce0  bd 16 00      lda $0016,x
$1f:dce3  29 ff fe      and #$feff
$1f:dce6  9d 16 00      sta $0016,x
$1f:dce9  02 a2         cop #$a2
$1f:dceb  30 02         bmi $dcef
$1f:dced  a1 f8         lda ($f8,x)
$1f:dcef  ff 08 00 00   sbc $000008,x
$1f:dcf3  61 02         adc ($02,x)
$1f:dcf5  80 2a         bra $dd21
$1f:dcf7  02 82         cop #$82
$1f:dcf9  02 86         cop #$86
$1f:dcfb  6b            rtl
$1f:dcfc  02 a2         cop #$a2
$1f:dcfe  20 02 a5      jsr $a502
$1f:dd01  09 dd d9      ora #$d9dd
$1f:dd04  dd 94 dd      cmp $dd94,x
$1f:dd07  4e dd 02      lsr $02dd
$1f:dd0a  ad 08 02      lda $0208
$1f:dd0d  22 33 dd 02   jsl $02dd33
$1f:dd11  81 2d         sta ($2d,x)
$1f:dd13  04 02         tsb $02
$1f:dd15  83 02         sta $02,s
$1f:dd17  22 33 dd 02   jsl $02dd33
$1f:dd1b  81 2d         sta ($2d,x)
$1f:dd1d  04 02         tsb $02
$1f:dd1f  83 02         sta $02,s
$1f:dd21  b2 3b         lda ($3b)
$1f:dd23  de 1f 00      dec $001f,x
$1f:dd26  00 fa         brk #$fa
$1f:dd28  ff 00 02 02   sbc $020200,x
$1f:dd2c  81 2b         sta ($2b,x)
$1f:dd2e  08            php
$1f:dd2f  02 83         cop #$83
$1f:dd31  80 d6         bra $dd09
$1f:dd33  02 80         cop #$80
$1f:dd35  2b            pld
$1f:dd36  02 82         cop #$82
$1f:dd38  02 80         cop #$80
$1f:dd3a  32 02         and ($02)
$1f:dd3c  82 02 80      brl $5d41
$1f:dd3f  2c 02 82      bit $8202
$1f:dd42  02 80         cop #$80
$1f:dd44  31 02         and ($02),y
$1f:dd46  82 02 80      brl $5d4b
$1f:dd49  2b            pld
$1f:dd4a  02 82         cop #$82
$1f:dd4c  80 17         bra $dd65
$1f:dd4e  02 ad         cop #$ad
$1f:dd50  08            php
$1f:dd51  02 21         cop #$21
$1f:dd53  78            sei
$1f:dd54  dd 02 81      cmp $8102,x
$1f:dd57  2e 04 02      rol $0204
$1f:dd5a  83 02         sta $02,s
$1f:dd5c  21 78         and ($78,x)
$1f:dd5e  dd 02 81      cmp $8102,x
$1f:dd61  2e 04 02      rol $0204
$1f:dd64  83 02         sta $02,s
$1f:dd66  b2 2e         lda ($2e)
$1f:dd68  de 1f 00      dec $001f,x
$1f:dd6b  00 e6         brk #$e6
$1f:dd6d  ff 00 02 02   sbc $020200,x
$1f:dd71  81 2b         sta ($2b,x)
$1f:dd73  08            php
$1f:dd74  02 83         cop #$83
$1f:dd76  80 d6         bra $dd4e
$1f:dd78  02 80         cop #$80
$1f:dd7a  2b            pld
$1f:dd7b  02 82         cop #$82
$1f:dd7d  02 80         cop #$80
$1f:dd7f  32 02         and ($02)
$1f:dd81  82 02 80      brl $5d86
$1f:dd84  2c 02 82      bit $8202
$1f:dd87  02 80         cop #$80
$1f:dd89  31 02         and ($02),y
$1f:dd8b  82 02 80      brl $5d90
$1f:dd8e  2b            pld
$1f:dd8f  02 82         cop #$82
$1f:dd91  82 8c ff      brl $dd20
$1f:dd94  02 ad         cop #$ad
$1f:dd96  08            php
$1f:dd97  02 24         cop #$24
$1f:dd99  be dd 02      ldx $02dd,y
$1f:dd9c  81 30         sta ($30,x)
$1f:dd9e  04 02         tsb $02
$1f:dda0  83 02         sta $02,s
$1f:dda2  24 be         bit $be
$1f:dda4  dd 02 81      cmp $8102,x
$1f:dda7  30 04         bmi $ddad
$1f:dda9  02 83         cop #$83
$1f:ddab  02 b2         cop #$b2
$1f:ddad  1f de 1f 12   ora $121fde,x
$1f:ddb1  00 f9         brk #$f9
$1f:ddb3  ff 00 02 02   sbc $020200,x
$1f:ddb7  81 2c         sta ($2c,x)
$1f:ddb9  08            php
$1f:ddba  02 83         cop #$83
$1f:ddbc  80 d6         bra $dd94
$1f:ddbe  02 80         cop #$80
$1f:ddc0  2c 02 82      bit $8202
$1f:ddc3  02 80         cop #$80
$1f:ddc5  32 02         and ($02)
$1f:ddc7  82 02 80      brl $5dcc
$1f:ddca  2b            pld
$1f:ddcb  02 82         cop #$82
$1f:ddcd  02 80         cop #$80
$1f:ddcf  31 02         and ($02),y
$1f:ddd1  82 02 80      brl $5dd6
$1f:ddd4  2c 02 82      bit $8202
$1f:ddd7  80 17         bra $ddf0
$1f:ddd9  02 ad         cop #$ad
$1f:dddb  08            php
$1f:dddc  02 23         cop #$23
$1f:ddde  03 de         ora $de,s
$1f:dde0  02 81         cop #$81
$1f:dde2  2f 04 02 83   and $830204
$1f:dde6  02 23         cop #$23
$1f:dde8  03 de         ora $de,s
$1f:ddea  02 81         cop #$81
$1f:ddec  2f 04 02 83   and $830204
$1f:ddf0  02 b2         cop #$b2
$1f:ddf2  21 de         and ($de,x)
$1f:ddf4  1f fb ff f9   ora $f9fffb,x
$1f:ddf8  ff 00 02 02   sbc $020200,x
$1f:ddfc  81 2c         sta ($2c,x)
$1f:ddfe  08            php
$1f:ddff  02 83         cop #$83
$1f:de01  80 d6         bra $ddd9
$1f:de03  02 80         cop #$80
$1f:de05  2c 02 82      bit $8202
$1f:de08  02 80         cop #$80
$1f:de0a  32 02         and ($02)
$1f:de0c  82 02 80      brl $5e11
$1f:de0f  2b            pld
$1f:de10  02 82         cop #$82
$1f:de12  02 80         cop #$80
$1f:de14  31 02         and ($02),y
$1f:de16  82 02 80      brl $5e1b
$1f:de19  2c 02 82      bit $8202
$1f:de1c  82 8c ff      brl $ddab
$1f:de1f  02 96         cop #$96
$1f:de21  02 a3         cop #$a3
$1f:de23  02 a2         cop #$a2
$1f:de25  30 02         bmi $de29
$1f:de27  80 35         bra $de5e
$1f:de29  02 82         cop #$82
$1f:de2b  02 86         cop #$86
$1f:de2d  6b            rtl
$1f:de2e  02 a3         cop #$a3
$1f:de30  02 a2         cop #$a2
$1f:de32  30 02         bmi $de36
$1f:de34  80 34         bra $de6a
$1f:de36  02 82         cop #$82
$1f:de38  02 86         cop #$86
$1f:de3a  6b            rtl
$1f:de3b  02 a3         cop #$a3
$1f:de3d  02 a2         cop #$a2
$1f:de3f  30 02         bmi $de43
$1f:de41  80 33         bra $de76
$1f:de43  02 82         cop #$82
$1f:de45  02 86         cop #$86
$1f:de47  6b            rtl
$1f:de48  bd 1a 00      lda $001a,x
$1f:de4b  09 00 02      ora #$0200
$1f:de4e  9d 1a 00      sta $001a,x
$1f:de51  02 a5         cop #$a5
$1f:de53  5b            tcd
$1f:de54  de 65 de      dec $de65,x
$1f:de57  5b            tcd
$1f:de58  de 65 de      dec $de65,x
$1f:de5b  02 80         cop #$80
$1f:de5d  01 02         ora ($02,x)
$1f:de5f  82 02 ad      brl $8b64
$1f:de62  10 80         bpl $dde4
$1f:de64  f6 02         inc $02,x
$1f:de66  96 02         stx $02,y
$1f:de68  80 00         bra $de6a
$1f:de6a  02 82         cop #$82
$1f:de6c  02 ad         cop #$ad
$1f:de6e  10 80         bpl $ddf0
$1f:de70  f6 02         inc $02,x
$1f:de72  a5 7b         lda $7b
$1f:de74  de c7 de      dec $dec7,x
$1f:de77  13 df         ora ($df,s),y
$1f:de79  61 df         adc ($df,x)
$1f:de7b  bd 16 00      lda $0016,x
$1f:de7e  89 00 80      bit #$8000
$1f:de81  f0 06         beq $de89
$1f:de83  02 1b         cop #$1b
$1f:de85  7b            tdc
$1f:de86  de 78 00      dec $0078,x
$1f:de89  02 0c         cop #$0c
$1f:de8b  00 07         brk #$07
$1f:de8d  91 de         sta ($de),y
$1f:de8f  80 f2         bra $de83
$1f:de91  02 9b         cop #$9b
$1f:de93  10 00         bpl $de95
$1f:de95  83 de         sta $de,s
$1f:de97  83 de         sta $de,s
$1f:de99  9b            txy
$1f:de9a  de 02 28      dec $2802,x
$1f:de9d  a3 de         lda $de,s
$1f:de9f  02 27         cop #$27
$1f:dea1  83 de         sta $de,s
$1f:dea3  bd 16 00      lda $0016,x
$1f:dea6  29 ff df      and #$dfff
$1f:dea9  9d 16 00      sta $0016,x
$1f:deac  02 80         cop #$80
$1f:deae  02 02         cop #$02
$1f:deb0  82 02 b2      brl $90b5
$1f:deb3  ad df 1f      lda $1fdf
$1f:deb6  00 00         brk #$00
$1f:deb8  10 00         bpl $deba
$1f:deba  00 02         brk #$02
$1f:debc  bd 16 00      lda $0016,x
$1f:debf  09 00 20      ora #$2000
$1f:dec2  9d 16 00      sta $0016,x
$1f:dec5  80 bc         bra $de83
$1f:dec7  bd 16 00      lda $0016,x
$1f:deca  89 00 80      bit #$8000
$1f:decd  f0 06         beq $ded5
$1f:decf  02 1b         cop #$1b
$1f:ded1  c7 de         cmp [$de]
$1f:ded3  78            sei
$1f:ded4  00 02         brk #$02
$1f:ded6  0c 00 07      tsb $0700
$1f:ded9  dd de 80      cmp $80de,x
$1f:dedc  f2 02         sbc ($02)
$1f:dede  9a            txs
$1f:dedf  10 00         bpl $dee1
$1f:dee1  e7 de         sbc [$de]
$1f:dee3  cf de cf de   cmp $decfde
$1f:dee7  02 28         cop #$28
$1f:dee9  ef de 02 27   sbc $2702de
$1f:deed  cf de bd 16   cmp $16bdde
$1f:def1  00 29         brk #$29
$1f:def3  ff df 9d 16   sbc $169ddf,x
$1f:def7  00 02         brk #$02
$1f:def9  80 04         bra $deff
$1f:defb  02 82         cop #$82
$1f:defd  02 b2         cop #$b2
$1f:deff  ad df 1f      lda $1fdf
$1f:df02  f0 ff         beq $df03
$1f:df04  00 00         brk #$00
$1f:df06  00 02         brk #$02
$1f:df08  bd 16 00      lda $0016,x
$1f:df0b  09 00 20      ora #$2000
$1f:df0e  9d 16 00      sta $0016,x
$1f:df11  80 bc         bra $decf
$1f:df13  bd 16 00      lda $0016,x
$1f:df16  89 00 80      bit #$8000
$1f:df19  f0 06         beq $df21
$1f:df1b  02 1b         cop #$1b
$1f:df1d  13 df         ora ($df,s),y
$1f:df1f  78            sei
$1f:df20  00 02         brk #$02
$1f:df22  0c 00 07      tsb $0700
$1f:df25  29 df 80      and #$80df
$1f:df28  f2 02         sbc ($02)
$1f:df2a  9a            txs
$1f:df2b  10 00         bpl $df2d
$1f:df2d  1b            tcs
$1f:df2e  df 1b df 33   cmp $33df1b,x
$1f:df32  df 02 28 3b   cmp $3b2802,x
$1f:df36  df 02 27 1b   cmp $1b2702,x
$1f:df3a  df 02 96 bd   cmp $bd9602,x
$1f:df3e  16 00         asl $00,x
$1f:df40  29 ff df      and #$dfff
$1f:df43  9d 16 00      sta $0016,x
$1f:df46  02 80         cop #$80
$1f:df48  04 02         tsb $02
$1f:df4a  82 02 b2      brl $914f
$1f:df4d  ad df 1f      lda $1fdf
$1f:df50  10 00         bpl $df52
$1f:df52  00 00         brk #$00
$1f:df54  00 02         brk #$02
$1f:df56  bd 16 00      lda $0016,x
$1f:df59  09 00 20      ora #$2000
$1f:df5c  9d 16 00      sta $0016,x
$1f:df5f  80 ba         bra $df1b
$1f:df61  bd 16 00      lda $0016,x
$1f:df64  89 00 80      bit #$8000
$1f:df67  f0 06         beq $df6f
$1f:df69  02 1b         cop #$1b
$1f:df6b  61 df         adc ($df,x)
$1f:df6d  78            sei
$1f:df6e  00 02         brk #$02
$1f:df70  0c 00 07      tsb $0700
$1f:df73  77 df         adc [$df],y
$1f:df75  80 f2         bra $df69
$1f:df77  02 9b         cop #$9b
$1f:df79  10 00         bpl $df7b
$1f:df7b  81 df         sta ($df,x)
$1f:df7d  69 df 69      adc #$69df
$1f:df80  df 02 28 89   cmp $892802,x
$1f:df84  df 02 27 69   cmp $692702,x
$1f:df88  df bd 16 00   cmp $0016bd,x
$1f:df8c  29 ff df      and #$dfff
$1f:df8f  9d 16 00      sta $0016,x
$1f:df92  02 80         cop #$80
$1f:df94  03 02         ora $02,s
$1f:df96  82 02 b2      brl $919b
$1f:df99  ad df 1f      lda $1fdf
$1f:df9c  00 00         brk #$00
$1f:df9e  f0 ff         beq $df9f
$1f:dfa0  00 02         brk #$02
$1f:dfa2  bd 16 00      lda $0016,x
$1f:dfa5  09 00 20      ora #$2000
$1f:dfa8  9d 16 00      sta $0016,x
$1f:dfab  80 bc         bra $df69
$1f:dfad  02 a3         cop #$a3
$1f:dfaf  00 64         brk #$64
$1f:dfb1  a0 05         ldy #$05
$1f:dfb3  00 e2         brk #$e2
$1f:dfb5  20 a9 00      jsr $00a9
$1f:dfb8  48            pha
$1f:dfb9  c2 20         rep #$20
$1f:dfbb  a9 66 ad      lda #$ad66
$1f:dfbe  48            pha
$1f:dfbf  6b            rtl
$1f:dfc0  02 86         cop #$86
$1f:dfc2  6b            rtl
$1f:dfc3  02 ad         cop #$ad
$1f:dfc5  08            php
$1f:dfc6  02 0c         cop #$0c
$1f:dfc8  00 04         brk #$04
$1f:dfca  d3 df         cmp ($df,s),y
$1f:dfcc  02 80         cop #$80
$1f:dfce  0a            asl a
$1f:dfcf  02 82         cop #$82
$1f:dfd1  80 f0         bra $dfc3
$1f:dfd3  02 9a         cop #$9a
$1f:dfd5  00 00         brk #$00
$1f:dfd7  e1 df         sbc ($df,x)
$1f:dfd9  dd df dd      cmp $dddf,x
$1f:dfdc  df 02 96 80   cmp $809602,x
$1f:dfe0  02 02         cop #$02
$1f:dfe2  97 02         sta [$02],y
$1f:dfe4  9b            txy
$1f:dfe5  28            plp
$1f:dfe6  00 f7         brk #$f7
$1f:dfe8  df ed df 0c   cmp $0cdfed,x
$1f:dfec  e0 02         cpx #$02
$1f:dfee  9b            txy
$1f:dfef  00 00         brk #$00
$1f:dff1  fe df 05      inc $05df,x
$1f:dff4  e0 05         cpx #$05
$1f:dff6  e0 02         cpx #$02
$1f:dff8  80 0e         bra $e008
$1f:dffa  02 82         cop #$82
$1f:dffc  80 13         bra $e011
$1f:dffe  02 80         cop #$80
$1f:e000  0d 02 82      ora $8202
$1f:e003  80 0c         bra $e011
$1f:e005  02 80         cop #$80
$1f:e007  0c 02 82      tsb $8202
$1f:e00a  80 05         bra $e011
$1f:e00c  02 80         cop #$80
$1f:e00e  0b            phd
$1f:e00f  02 82         cop #$82
$1f:e011  02 81         cop #$81
$1f:e013  0a            asl a
$1f:e014  02 02         cop #$02
$1f:e016  83 02         sta $02,s
$1f:e018  0c 00 02      tsb $0200
$1f:e01b  c3 df         cmp $df,s
$1f:e01d  02 81         cop #$81
$1f:e01f  0f 04 02 83   ora $830204
$1f:e023  02 b0         cop #$b0
$1f:e025  32 e0         and ($e0)
$1f:e027  1f 00 02 02   ora $020200,x
$1f:e02b  81 0a         sta ($0a,x)
$1f:e02d  02 02         cop #$02
$1f:e02f  83 80         sta $80,s
$1f:e031  91 02         sta ($02),y
$1f:e033  a3 00         lda $00,s
$1f:e035  64 a0         stz $a0
$1f:e037  10 00         bpl $e039
$1f:e039  e2 20         sep #$20
$1f:e03b  a9 00         lda #$00
$1f:e03d  48            pha
$1f:e03e  c2 20         rep #$20
$1f:e040  a9 66 ad      lda #$ad66
$1f:e043  48            pha
$1f:e044  6b            rtl
$1f:e045  bd 1a 00      lda $001a,x
$1f:e048  09 00 08      ora #$0800
$1f:e04b  9d 1a 00      sta $001a,x
$1f:e04e  02 ad         cop #$ad
$1f:e050  08            php
$1f:e051  02 9b         cop #$9b
$1f:e053  08            php
$1f:e054  00 5b         brk #$5b
$1f:e056  e0 cc         cpx #$cc
$1f:e058  e0 73         cpx #$73
$1f:e05a  e0 02         cpx #$02
$1f:e05c  97 02         sta [$02],y
$1f:e05e  80 19         bra $e079
$1f:e060  02 82         cop #$82
$1f:e062  02 9b         cop #$9b
$1f:e064  18            clc
$1f:e065  00 5d         brk #$5d
$1f:e067  e0 6c         cpx #$6c
$1f:e069  e0 73         cpx #$73
$1f:e06b  e0 02         cpx #$02
$1f:e06d  80 16         bra $e085
$1f:e06f  02 82         cop #$82
$1f:e071  80 16         bra $e089
$1f:e073  02 97         cop #$97
$1f:e075  02 80         cop #$80
$1f:e077  18            clc
$1f:e078  02 82         cop #$82
$1f:e07a  02 9b         cop #$9b
$1f:e07c  18            clc
$1f:e07d  00 5b         brk #$5b
$1f:e07f  e0 84         cpx #$84
$1f:e081  e0 75         cpx #$75
$1f:e083  e0 02         cpx #$02
$1f:e085  80 15         bra $e09c
$1f:e087  02 82         cop #$82
$1f:e089  02 1f         cop #$1f
$1f:e08b  ad 02 03      lda $0302
$1f:e08e  10 3c         bpl $e0cc
$1f:e090  bd 16 00      lda $0016,x
$1f:e093  89 00 02      bit #$0200
$1f:e096  f0 1b         beq $e0b3
$1f:e098  bd 16 00      lda $0016,x
$1f:e09b  29 ff df      and #$dfff
$1f:e09e  9d 16 00      sta $0016,x
$1f:e0a1  00 60         brk #$60
$1f:e0a3  02 80         cop #$80
$1f:e0a5  1c 02 82      trb $8202
$1f:e0a8  bd 16 00      lda $0016,x
$1f:e0ab  29 ff fd      and #$fdff
$1f:e0ae  9d 16 00      sta $0016,x
$1f:e0b1  80 19         bra $e0cc
$1f:e0b3  bd 16 00      lda $0016,x
$1f:e0b6  09 00 02      ora #$0200
$1f:e0b9  9d 16 00      sta $0016,x
$1f:e0bc  00 60         brk #$60
$1f:e0be  02 80         cop #$80
$1f:e0c0  1b            tcs
$1f:e0c1  02 82         cop #$82
$1f:e0c3  bd 16 00      lda $0016,x
$1f:e0c6  09 00 20      ora #$2000
$1f:e0c9  9d 16 00      sta $0016,x
$1f:e0cc  02 9a         cop #$9a
$1f:e0ce  08            php
$1f:e0cf  00 d6         brk #$d6
$1f:e0d1  e0 04         cpx #$04
$1f:e0d3  e1 ee         sbc ($ee,x)
$1f:e0d5  e0 02         cpx #$02
$1f:e0d7  97 02         sta [$02],y
$1f:e0d9  80 1a         bra $e0f5
$1f:e0db  02 82         cop #$82
$1f:e0dd  02 9a         cop #$9a
$1f:e0df  18            clc
$1f:e0e0  00 d8         brk #$d8
$1f:e0e2  e0 e7         cpx #$e7
$1f:e0e4  e0 ee         cpx #$ee
$1f:e0e6  e0 02         cpx #$02
$1f:e0e8  80 17         bra $e101
$1f:e0ea  02 82         cop #$82
$1f:e0ec  80 16         bra $e104
$1f:e0ee  02 96         cop #$96
$1f:e0f0  02 80         cop #$80
$1f:e0f2  1a            inc a
$1f:e0f3  02 82         cop #$82
$1f:e0f5  02 9a         cop #$9a
$1f:e0f7  18            clc
$1f:e0f8  00 d6         brk #$d6
$1f:e0fa  e0 ff         cpx #$ff
$1f:e0fc  e0 f0         cpx #$f0
$1f:e0fe  e0 02         cpx #$02
$1f:e100  80 17         bra $e119
$1f:e102  02 82         cop #$82
$1f:e104  02 1f         cop #$1f
$1f:e106  ad 02 03      lda $0302
$1f:e109  30 03         bmi $e10e
$1f:e10b  82 43 ff      brl $e051
$1f:e10e  bd 16 00      lda $0016,x
$1f:e111  89 00 02      bit #$0200
$1f:e114  f0 1c         beq $e132
$1f:e116  bd 16 00      lda $0016,x
$1f:e119  29 ff df      and #$dfff
$1f:e11c  9d 16 00      sta $0016,x
$1f:e11f  00 60         brk #$60
$1f:e121  02 80         cop #$80
$1f:e123  1c 02 82      trb $8202
$1f:e126  bd 16 00      lda $0016,x
$1f:e129  29 ff fd      and #$fdff
$1f:e12c  9d 16 00      sta $0016,x
$1f:e12f  82 1f ff      brl $e051
$1f:e132  bd 16 00      lda $0016,x
$1f:e135  09 00 02      ora #$0200
$1f:e138  9d 16 00      sta $0016,x
$1f:e13b  00 60         brk #$60
$1f:e13d  02 80         cop #$80
$1f:e13f  1b            tcs
$1f:e140  02 82         cop #$82
$1f:e142  bd 16 00      lda $0016,x
$1f:e145  09 00 20      ora #$2000
$1f:e148  9d 16 00      sta $0016,x
$1f:e14b  82 03 ff      brl $e051
$1f:e14e  02 a5         cop #$a5
$1f:e150  58            cli
$1f:e151  e1 61         sbc ($61,x)
$1f:e153  e1 68         sbc ($68,x)
$1f:e155  e1 71         sbc ($71,x)
$1f:e157  e1 02         sbc ($02,x)
$1f:e159  96 02         stx $02,y
$1f:e15b  80 1d         bra $e17a
$1f:e15d  02 82         cop #$82
$1f:e15f  80 48         bra $e1a9
$1f:e161  02 80         cop #$80
$1f:e163  1f 02 82 80   ora $808202,x
$1f:e167  10 02         bpl $e16b
$1f:e169  96 02         stx $02,y
$1f:e16b  80 1f         bra $e18c
$1f:e16d  02 82         cop #$82
$1f:e16f  80 07         bra $e178
$1f:e171  02 80         cop #$80
$1f:e173  1e 02 82      asl $8202,x
$1f:e176  80 31         bra $e1a9
$1f:e178  02 ad         cop #$ad
$1f:e17a  08            php
$1f:e17b  02 9b         cop #$9b
$1f:e17d  08            php
$1f:e17e  00 8f         brk #$8f
$1f:e180  e1 85         sbc ($85,x)
$1f:e182  e1 8f         sbc ($8f,x)
$1f:e184  e1 02         sbc ($02,x)
$1f:e186  9a            txs
$1f:e187  00 00         brk #$00
$1f:e189  da            phx
$1f:e18a  e1 ee         sbc ($ee,x)
$1f:e18c  e1 ee         sbc ($ee,x)
$1f:e18e  e1 02         sbc ($02,x)
$1f:e190  9a            txs
$1f:e191  20 00 a3      jsr $a300
$1f:e194  e1 99         sbc ($99,x)
$1f:e196  e1 a3         sbc ($a3,x)
$1f:e198  e1 02         sbc ($02,x)
$1f:e19a  a5 ee         lda $ee
$1f:e19c  e1 da         sbc ($da,x)
$1f:e19e  e1 ee         sbc ($ee,x)
$1f:e1a0  e1 da         sbc ($da,x)
$1f:e1a2  e1 02         sbc ($02,x)
$1f:e1a4  1b            tcs
$1f:e1a5  78            sei
$1f:e1a6  e1 08         sbc ($08,x)
$1f:e1a8  00 02         brk #$02
$1f:e1aa  ad 08 02      lda $0208
$1f:e1ad  9a            txs
$1f:e1ae  08            php
$1f:e1af  00 c0         brk #$c0
$1f:e1b1  e1 b6         sbc ($b6,x)
$1f:e1b3  e1 c0         sbc ($c0,x)
$1f:e1b5  e1 02         sbc ($02,x)
$1f:e1b7  9b            txy
$1f:e1b8  00 00         brk #$00
$1f:e1ba  03 e2         ora $e2,s
$1f:e1bc  17 e2         ora [$e2],y
$1f:e1be  17 e2         ora [$e2],y
$1f:e1c0  02 9b         cop #$9b
$1f:e1c2  20 00 d4      jsr $d400
$1f:e1c5  e1 ca         sbc ($ca,x)
$1f:e1c7  e1 d4         sbc ($d4,x)
$1f:e1c9  e1 02         sbc ($02,x)
$1f:e1cb  a5 17         lda $17
$1f:e1cd  e2 03         sep #$03
$1f:e1cf  e2 17         sep #$17
$1f:e1d1  e2 03         sep #$03
$1f:e1d3  e2 02         sep #$02
$1f:e1d5  1b            tcs
$1f:e1d6  a9 e1 08      lda #$08e1
$1f:e1d9  00 02         brk #$02
$1f:e1db  97 02         sta [$02],y
$1f:e1dd  23 e7         and $e7,s
$1f:e1df  e1 02         sbc ($02,x)
$1f:e1e1  80 22         bra $e205
$1f:e1e3  02 82         cop #$82
$1f:e1e5  80 f5         bra $e1dc
$1f:e1e7  02 80         cop #$80
$1f:e1e9  1f 02 82 80   ora $808202,x
$1f:e1ed  8a            txa
$1f:e1ee  02 96         cop #$96
$1f:e1f0  02 24         cop #$24
$1f:e1f2  fb            xce
$1f:e1f3  e1 02         sbc ($02,x)
$1f:e1f5  80 22         bra $e219
$1f:e1f7  02 82         cop #$82
$1f:e1f9  80 f5         bra $e1f0
$1f:e1fb  02 80         cop #$80
$1f:e1fd  1f 02 82 82   ora $828202,x
$1f:e201  75 ff         adc $ff,x
$1f:e203  02 97         cop #$97
$1f:e205  02 21         cop #$21
$1f:e207  10 e2         bpl $e1eb
$1f:e209  02 80         cop #$80
$1f:e20b  21 02         and ($02,x)
$1f:e20d  82 80 f5      brl $d790
$1f:e210  02 80         cop #$80
$1f:e212  1e 02 82      asl $8202,x
$1f:e215  80 92         bra $e1a9
$1f:e217  02 96         cop #$96
$1f:e219  02 22         cop #$22
$1f:e21b  24 e2         bit $e2
$1f:e21d  02 80         cop #$80
$1f:e21f  20 02 82      jsr $8202
$1f:e222  80 f5         bra $e219
$1f:e224  02 80         cop #$80
$1f:e226  1d 02 82      ora $8202,x
$1f:e229  82 7d ff      brl $e1a9
$1f:e22c  02 80         cop #$80
$1f:e22e  23 02         and $02,s
$1f:e230  82 02 ad      brl $8f35
$1f:e233  08            php
$1f:e234  80 f6         bra $e22c
$1f:e236  02 ad         cop #$ad
$1f:e238  10 02         bpl $e23c
$1f:e23a  0c 00 02      tsb $0200
$1f:e23d  46 e2         lsr $e2
$1f:e23f  02 80         cop #$80
$1f:e241  3c 02 82      bit $8202,x
$1f:e244  80 f0         bra $e236
$1f:e246  02 80         cop #$80
$1f:e248  3d 02 82      and $8202,x
$1f:e24b  bd 16 00      lda $0016,x
$1f:e24e  29 ff fd      and #$fdff
$1f:e251  9d 16 00      sta $0016,x
$1f:e254  02 9b         cop #$9b
$1f:e256  00 00         brk #$00
$1f:e258  5e e2 86      lsr $86e2,x
$1f:e25b  e2 86         sep #$86
$1f:e25d  e2 02         sep #$02
$1f:e25f  97 02         sta [$02],y
$1f:e261  9b            txy
$1f:e262  18            clc
$1f:e263  00 6a         brk #$6a
$1f:e265  e2 75         sep #$75
$1f:e267  e2 6a         sep #$6a
$1f:e269  e2 02         sep #$02
$1f:e26b  21 bf         and ($bf,x)
$1f:e26d  e3 02         sbc $02,s
$1f:e26f  80 2d         bra $e29e
$1f:e271  02 82         cop #$82
$1f:e273  80 df         bra $e254
$1f:e275  02 9a         cop #$9a
$1f:e277  28            plp
$1f:e278  00 7f         brk #$7f
$1f:e27a  e2 45         sep #$45
$1f:e27c  e3 7f         sbc $7f,s
$1f:e27e  e2 02         sep #$02
$1f:e280  80 2c         bra $e2ae
$1f:e282  02 82         cop #$82
$1f:e284  80 26         bra $e2ac
$1f:e286  02 97         cop #$97
$1f:e288  02 9b         cop #$9b
$1f:e28a  18            clc
$1f:e28b  00 92         brk #$92
$1f:e28d  e2 9d         sep #$9d
$1f:e28f  e2 92         sep #$92
$1f:e291  e2 02         sep #$02
$1f:e293  22 bf e3 02   jsl $02e3bf
$1f:e297  80 25         bra $e2be
$1f:e299  02 82         cop #$82
$1f:e29b  80 b7         bra $e254
$1f:e29d  02 9a         cop #$9a
$1f:e29f  28            plp
$1f:e2a0  00 a7         brk #$a7
$1f:e2a2  e2 82         sep #$82
$1f:e2a4  e3 a7         sbc $a7,s
$1f:e2a6  e2 02         sep #$02
$1f:e2a8  80 24         bra $e2ce
$1f:e2aa  02 82         cop #$82
$1f:e2ac  02 9a         cop #$9a
$1f:e2ae  00 00         brk #$00
$1f:e2b0  b6 e2         ldx $e2,y
$1f:e2b2  df e2 df e2   cmp $e2dfe2,x
$1f:e2b6  02 97         cop #$97
$1f:e2b8  02 9a         cop #$9a
$1f:e2ba  18            clc
$1f:e2bb  00 c2         brk #$c2
$1f:e2bd  e2 cd         sep #$cd
$1f:e2bf  e2 c2         sep #$c2
$1f:e2c1  e2 02         sep #$02
$1f:e2c3  23 bf         and $bf,s
$1f:e2c5  e3 02         sbc $02,s
$1f:e2c7  80 35         bra $e2fe
$1f:e2c9  02 82         cop #$82
$1f:e2cb  80 df         bra $e2ac
$1f:e2cd  02 9b         cop #$9b
$1f:e2cf  28            plp
$1f:e2d0  00 d7         brk #$d7
$1f:e2d2  e2 08         sep #$08
$1f:e2d4  e3 d7         sbc $d7,s
$1f:e2d6  e2 02         sep #$02
$1f:e2d8  80 34         bra $e30e
$1f:e2da  02 82         cop #$82
$1f:e2dc  82 75 ff      brl $e254
$1f:e2df  02 96         cop #$96
$1f:e2e1  02 9a         cop #$9a
$1f:e2e3  18            clc
$1f:e2e4  00 eb         brk #$eb
$1f:e2e6  e2 f6         sep #$f6
$1f:e2e8  e2 eb         sep #$eb
$1f:e2ea  e2 02         sep #$02
$1f:e2ec  24 bf         bit $bf
$1f:e2ee  e3 02         sbc $02,s
$1f:e2f0  80 35         bra $e327
$1f:e2f2  02 82         cop #$82
$1f:e2f4  80 b6         bra $e2ac
$1f:e2f6  02 9b         cop #$9b
$1f:e2f8  28            plp
$1f:e2f9  00 00         brk #$00
$1f:e2fb  e3 08         sbc $08,s
$1f:e2fd  e3 00         sbc $00,s
$1f:e2ff  e3 02         sbc $02,s
$1f:e301  80 34         bra $e337
$1f:e303  02 82         cop #$82
$1f:e305  82 4c ff      brl $e254
$1f:e308  02 9b         cop #$9b
$1f:e30a  10 00         bpl $e30c
$1f:e30c  12 e3         ora ($e3)
$1f:e30e  23 e3         and $e3,s
$1f:e310  34 e3         bit $e3,x
$1f:e312  02 b0         cop #$b0
$1f:e314  04 e4         tsb $e4
$1f:e316  1f 00 02 00   ora $000200,x
$1f:e31a  41 02         eor ($02,x)
$1f:e31c  80 37         bra $e355
$1f:e31e  02 82         cop #$82
$1f:e320  82 31 ff      brl $e254
$1f:e323  02 b0         cop #$b0
$1f:e325  0b            phd
$1f:e326  e4 1f         cpx $1f
$1f:e328  00 02         brk #$02
$1f:e32a  00 41         brk #$41
$1f:e32c  02 80         cop #$80
$1f:e32e  38            sec
$1f:e32f  02 82         cop #$82
$1f:e331  82 20 ff      brl $e254
$1f:e334  02 b0         cop #$b0
$1f:e336  fd e3 1f      sbc $1fe3,x
$1f:e339  00 02         brk #$02
$1f:e33b  00 41         brk #$41
$1f:e33d  02 80         cop #$80
$1f:e33f  36 02         rol $02,x
$1f:e341  82 82 0f      brl $f2c6
$1f:e344  ff 02 9a 10   sbc $109a02,x
$1f:e348  00 4f         brk #$4f
$1f:e34a  e3 60         sbc $60,s
$1f:e34c  e3 71         sbc $71,s
$1f:e34e  e3 02         sbc $02,s
$1f:e350  b0 e8         bcs $e33a
$1f:e352  e3 1f         sbc $1f,s
$1f:e354  00 02         brk #$02
$1f:e356  00 41         brk #$41
$1f:e358  02 80         cop #$80
$1f:e35a  2e 02 82      rol $8202
$1f:e35d  82 4c ff      brl $e2ac
$1f:e360  02 b0         cop #$b0
$1f:e362  f6 e3         inc $e3,x
$1f:e364  1f 00 02 00   ora $000200,x
$1f:e368  41 02         eor ($02,x)
$1f:e36a  80 30         bra $e39c
$1f:e36c  02 82         cop #$82
$1f:e36e  82 3b ff      brl $e2ac
$1f:e371  02 b0         cop #$b0
$1f:e373  ef e3 1f 00   sbc $001fe3
$1f:e377  02 00         cop #$00
$1f:e379  41 02         eor ($02,x)
$1f:e37b  80 2f         bra $e3ac
$1f:e37d  02 82         cop #$82
$1f:e37f  82 2a ff      brl $e2ac
$1f:e382  02 9a         cop #$9a
$1f:e384  10 00         bpl $e386
$1f:e386  8c e3 9d      sty $9de3
$1f:e389  e3 ae         sbc $ae,s
$1f:e38b  e3 02         sbc $02,s
$1f:e38d  b0 d3         bcs $e362
$1f:e38f  e3 1f         sbc $1f,s
$1f:e391  00 02         brk #$02
$1f:e393  00 41         brk #$41
$1f:e395  02 80         cop #$80
$1f:e397  26 02         rol $02
$1f:e399  82 82 0f      brl $f31e
$1f:e39c  ff 02 b0 e1   sbc $e1b002,x
$1f:e3a0  e3 1f         sbc $1f,s
$1f:e3a2  00 02         brk #$02
$1f:e3a4  00 41         brk #$41
$1f:e3a6  02 80         cop #$80
$1f:e3a8  28            plp
$1f:e3a9  02 82         cop #$82
$1f:e3ab  82 fe fe      brl $e2ac
$1f:e3ae  02 b0         cop #$b0
$1f:e3b0  da            phx
$1f:e3b1  e3 1f         sbc $1f,s
$1f:e3b3  00 02         brk #$02
$1f:e3b5  00 41         brk #$41
$1f:e3b7  02 80         cop #$80
$1f:e3b9  27 02         and [$02]
$1f:e3bb  82 82 ed      brl $d140
$1f:e3be  fe bd 16      inc $16bd,x
$1f:e3c1  00 09         brk #$09
$1f:e3c3  00 02         brk #$02
$1f:e3c5  9d 16 00      sta $0016,x
$1f:e3c8  02 80         cop #$80
$1f:e3ca  3e 02 82      rol $8202,x
$1f:e3cd  02 1b         cop #$1b
$1f:e3cf  36 e2         rol $e2,x
$1f:e3d1  3c 00 02      bit $0200,x
$1f:e3d4  80 29         bra $e3ff
$1f:e3d6  02 82         cop #$82
$1f:e3d8  80 36         bra $e410
$1f:e3da  02 80         cop #$80
$1f:e3dc  2a            rol a
$1f:e3dd  02 82         cop #$82
$1f:e3df  80 2f         bra $e410
$1f:e3e1  02 80         cop #$80
$1f:e3e3  2b            pld
$1f:e3e4  02 82         cop #$82
$1f:e3e6  80 28         bra $e410
$1f:e3e8  02 80         cop #$80
$1f:e3ea  2e 02 82      rol $8202
$1f:e3ed  80 21         bra $e410
$1f:e3ef  02 80         cop #$80
$1f:e3f1  2f 02 82 80   and $808202
$1f:e3f5  1a            inc a
$1f:e3f6  02 80         cop #$80
$1f:e3f8  30 02         bmi $e3fc
$1f:e3fa  82 80 13      brl $f77d
$1f:e3fd  02 80         cop #$80
$1f:e3ff  39 02 82      and $8202,y
$1f:e402  80 0c         bra $e410
$1f:e404  02 80         cop #$80
$1f:e406  3a            dec a
$1f:e407  02 82         cop #$82
$1f:e409  80 05         bra $e410
$1f:e40b  02 80         cop #$80
$1f:e40d  3b            tsc
$1f:e40e  02 82         cop #$82
$1f:e410  02 86         cop #$86
$1f:e412  6b            rtl
$1f:e413  02 aa         cop #$aa
$1f:e415  00 02         brk #$02
$1f:e417  ad 08 02      lda $0208
$1f:e41a  9b            txy
$1f:e41b  00 00         brk #$00
$1f:e41d  23 e4         and $e4,s
$1f:e41f  41 e4         eor ($e4,x)
$1f:e421  41 e4         eor ($e4,x)
$1f:e423  02 97         cop #$97
$1f:e425  02 9b         cop #$9b
$1f:e427  18            clc
$1f:e428  00 2f         brk #$2f
$1f:e42a  e4 c0         cpx $c0
$1f:e42c  e4 2f         cpx $2f
$1f:e42e  e4 02         cpx $02
$1f:e430  21 3a         and ($3a,x)
$1f:e432  e4 02         cpx $02
$1f:e434  80 08         bra $e43e
$1f:e436  02 82         cop #$82
$1f:e438  80 dc         bra $e416
$1f:e43a  02 80         cop #$80
$1f:e43c  02 02         cop #$02
$1f:e43e  82 80 d5      brl $b9c1
$1f:e441  02 97         cop #$97
$1f:e443  02 9b         cop #$9b
$1f:e445  18            clc
$1f:e446  00 4d         brk #$4d
$1f:e448  e4 a8         cpx $a8
$1f:e44a  e4 4d         cpx $4d
$1f:e44c  e4 02         cpx $02
$1f:e44e  22 58 e4 02   jsl $02e458
$1f:e452  80 06         bra $e45a
$1f:e454  02 82         cop #$82
$1f:e456  80 be         bra $e416
$1f:e458  02 80         cop #$80
$1f:e45a  00 02         brk #$02
$1f:e45c  82 80 b7      brl $9bdf
$1f:e45f  02 ad         cop #$ad
$1f:e461  08            php
$1f:e462  02 9a         cop #$9a
$1f:e464  00 00         brk #$00
$1f:e466  6c e4 8a      jmp ($8ae4)
$1f:e469  e4 8a         cpx $8a
$1f:e46b  e4 02         cpx $02
$1f:e46d  9a            txs
$1f:e46e  18            clc
$1f:e46f  00 76         brk #$76
$1f:e471  e4 d9         cpx $d9
$1f:e473  e4 76         cpx $76
$1f:e475  e4 02         cpx $02
$1f:e477  97 02         sta [$02],y
$1f:e479  23 83         and $83,s
$1f:e47b  e4 02         cpx $02
$1f:e47d  80 0a         bra $e489
$1f:e47f  02 82         cop #$82
$1f:e481  80 dc         bra $e45f
$1f:e483  02 80         cop #$80
$1f:e485  04 02         tsb $02
$1f:e487  82 80 d5      brl $ba0a
$1f:e48a  02 9a         cop #$9a
$1f:e48c  18            clc
$1f:e48d  00 94         brk #$94
$1f:e48f  e4 d9         cpx $d9
$1f:e491  e4 94         cpx $94
$1f:e493  e4 02         cpx $02
$1f:e495  96 02         stx $02,y
$1f:e497  24 a1         bit $a1
$1f:e499  e4 02         cpx $02
$1f:e49b  80 0a         bra $e4a7
$1f:e49d  02 82         cop #$82
$1f:e49f  80 be         bra $e45f
$1f:e4a1  02 80         cop #$80
$1f:e4a3  04 02         tsb $02
$1f:e4a5  82 80 b7      brl $9c28
$1f:e4a8  00 41         brk #$41
$1f:e4aa  02 80         cop #$80
$1f:e4ac  0c 02 82      tsb $8202
$1f:e4af  02 b0         cop #$b0
$1f:e4b1  b8            clv
$1f:e4b2  e4 1f         cpx $1f
$1f:e4b4  00 02         brk #$02
$1f:e4b6  80 a7         bra $e45f
$1f:e4b8  02 80         cop #$80
$1f:e4ba  19 02 82      ora $8202,y
$1f:e4bd  02 86         cop #$86
$1f:e4bf  6b            rtl
$1f:e4c0  00 41         brk #$41
$1f:e4c2  02 80         cop #$80
$1f:e4c4  0d 02 82      ora $8202
$1f:e4c7  02 b0         cop #$b0
$1f:e4c9  d1 e4         cmp ($e4),y
$1f:e4cb  1f 00 02 82   ora $820200,x
$1f:e4cf  8e ff 02      stx $02ff
$1f:e4d2  80 1a         bra $e4ee
$1f:e4d4  02 82         cop #$82
$1f:e4d6  02 86         cop #$86
$1f:e4d8  6b            rtl
$1f:e4d9  00 41         brk #$41
$1f:e4db  02 80         cop #$80
$1f:e4dd  0e 02 82      asl $8202
$1f:e4e0  02 b0         cop #$b0
$1f:e4e2  ea            nop
$1f:e4e3  e4 1f         cpx $1f
$1f:e4e5  00 02         brk #$02
$1f:e4e7  82 2c ff      brl $e416
$1f:e4ea  02 80         cop #$80
$1f:e4ec  1b            tcs
$1f:e4ed  02 82         cop #$82
$1f:e4ef  02 86         cop #$86
$1f:e4f1  6b            rtl
$1f:e4f2  02 aa         cop #$aa
$1f:e4f4  02 02         cop #$02
$1f:e4f6  ad 08 02      lda $0208
$1f:e4f9  9b            txy
$1f:e4fa  00 00         brk #$00
$1f:e4fc  02 e5         cop #$e5
$1f:e4fe  20 e5 20      jsr $20e5
$1f:e501  e5 02         sbc $02
$1f:e503  97 02         sta [$02],y
$1f:e505  9b            txy
$1f:e506  18            clc
$1f:e507  00 0e         brk #$0e
$1f:e509  e5 b2         sbc $b2
$1f:e50b  e5 0e         sbc $0e
$1f:e50d  e5 02         sbc $02
$1f:e50f  21 19         and ($19,x)
$1f:e511  e5 02         sbc $02
$1f:e513  80 08         bra $e51d
$1f:e515  02 82         cop #$82
$1f:e517  80 dc         bra $e4f5
$1f:e519  02 80         cop #$80
$1f:e51b  02 02         cop #$02
$1f:e51d  82 80 d5      brl $baa0
$1f:e520  02 97         cop #$97
$1f:e522  02 9b         cop #$9b
$1f:e524  18            clc
$1f:e525  00 2c         brk #$2c
$1f:e527  e5 87         sbc $87
$1f:e529  e5 2c         sbc $2c
$1f:e52b  e5 02         sbc $02
$1f:e52d  22 37 e5 02   jsl $02e537
$1f:e531  80 06         bra $e539
$1f:e533  02 82         cop #$82
$1f:e535  80 be         bra $e4f5
$1f:e537  02 80         cop #$80
$1f:e539  00 02         brk #$02
$1f:e53b  82 80 b7      brl $9cbe
$1f:e53e  02 ad         cop #$ad
$1f:e540  08            php
$1f:e541  02 9a         cop #$9a
$1f:e543  00 00         brk #$00
$1f:e545  4b            phk
$1f:e546  e5 69         sbc $69
$1f:e548  e5 69         sbc $69
$1f:e54a  e5 02         sbc $02
$1f:e54c  9a            txs
$1f:e54d  18            clc
$1f:e54e  00 55         brk #$55
$1f:e550  e5 de         sbc $de
$1f:e552  e5 55         sbc $55
$1f:e554  e5 02         sbc $02
$1f:e556  97 02         sta [$02],y
$1f:e558  23 62         and $62,s
$1f:e55a  e5 02         sbc $02
$1f:e55c  80 0a         bra $e568
$1f:e55e  02 82         cop #$82
$1f:e560  80 dc         bra $e53e
$1f:e562  02 80         cop #$80
$1f:e564  04 02         tsb $02
$1f:e566  82 80 d5      brl $bae9
$1f:e569  02 9a         cop #$9a
$1f:e56b  18            clc
$1f:e56c  00 73         brk #$73
$1f:e56e  e5 de         sbc $de
$1f:e570  e5 73         sbc $73
$1f:e572  e5 02         sbc $02
$1f:e574  96 02         stx $02,y
$1f:e576  24 80         bit $80
$1f:e578  e5 02         sbc $02
$1f:e57a  80 0a         bra $e586
$1f:e57c  02 82         cop #$82
$1f:e57e  80 be         bra $e53e
$1f:e580  02 80         cop #$80
$1f:e582  04 02         tsb $02
$1f:e584  82 80 b7      brl $9d07
$1f:e587  00 52         brk #$52
$1f:e589  02 80         cop #$80
$1f:e58b  0f 02 82 02   ora $028202
$1f:e58f  b0 9c         bcs $e52d
$1f:e591  e5 1f         sbc $1f
$1f:e593  00 02         brk #$02
$1f:e595  02 80         cop #$80
$1f:e597  10 02         bpl $e59b
$1f:e599  82 80 a2      brl $881c
$1f:e59c  02 a3         cop #$a3
$1f:e59e  02 9a         cop #$9a
$1f:e5a0  00 00         brk #$00
$1f:e5a2  aa            tax
$1f:e5a3  e5 a8         sbc $a8
$1f:e5a5  e5 a8         sbc $a8
$1f:e5a7  e5 02         sbc $02
$1f:e5a9  96 02         stx $02,y
$1f:e5ab  80 15         bra $e5c2
$1f:e5ad  02 82         cop #$82
$1f:e5af  02 86         cop #$86
$1f:e5b1  6b            rtl
$1f:e5b2  00 52         brk #$52
$1f:e5b4  02 80         cop #$80
$1f:e5b6  11 02         ora ($02),y
$1f:e5b8  82 02 b0      brl $95bd
$1f:e5bb  c8            iny
$1f:e5bc  e5 1f         sbc $1f
$1f:e5be  00 02         brk #$02
$1f:e5c0  02 80         cop #$80
$1f:e5c2  12 02         ora ($02)
$1f:e5c4  82 82 76      brl $5c49
$1f:e5c7  ff 02 a3 02   sbc $02a302,x
$1f:e5cb  9a            txs
$1f:e5cc  00 00         brk #$00
$1f:e5ce  d6 e5         dec $e5,x
$1f:e5d0  d4 e5         pei ($e5)
$1f:e5d2  d4 e5         pei ($e5)
$1f:e5d4  02 96         cop #$96
$1f:e5d6  02 80         cop #$80
$1f:e5d8  18            clc
$1f:e5d9  02 82         cop #$82
$1f:e5db  02 86         cop #$86
$1f:e5dd  6b            rtl
$1f:e5de  00 52         brk #$52
$1f:e5e0  02 80         cop #$80
$1f:e5e2  13 02         ora ($02,s),y
$1f:e5e4  82 02 b0      brl $95e9
$1f:e5e7  f4 e5 1f      pea $1fe5
$1f:e5ea  00 02         brk #$02
$1f:e5ec  02 80         cop #$80
$1f:e5ee  14 02         trb $02
$1f:e5f0  82 82 01      brl $e775
$1f:e5f3  ff 02 a3 02   sbc $02a302,x
$1f:e5f7  9b            txy
$1f:e5f8  00 00         brk #$00
$1f:e5fa  00 e6         brk #$e6
$1f:e5fc  08            php
$1f:e5fd  e6 08         inc $08
$1f:e5ff  e6 02         inc $02
$1f:e601  80 17         bra $e61a
$1f:e603  02 82         cop #$82
$1f:e605  02 86         cop #$86
$1f:e607  6b            rtl
$1f:e608  02 80         cop #$80
$1f:e60a  16 02         asl $02,x
$1f:e60c  82 02 86      brl $6c11
$1f:e60f  6b            rtl
$1f:e610  02 80         cop #$80
$1f:e612  1c 02 82      trb $8202
$1f:e615  02 ad         cop #$ad
$1f:e617  08            php
$1f:e618  80 f6         bra $e610
$1f:e61a  02 a5         cop #$a5
$1f:e61c  24 e6         bit $e6
$1f:e61e  70 e6         bvs $e606
$1f:e620  bc e6 0a      ldy $0ae6,x
$1f:e623  e7 bd         sbc [$bd]
$1f:e625  16 00         asl $00,x
$1f:e627  89 00         bit #$00
$1f:e629  80 f0         bra $e61b
$1f:e62b  06 02         asl $02
$1f:e62d  1b            tcs
$1f:e62e  24 e6         bit $e6
$1f:e630  78            sei
$1f:e631  00 02         brk #$02
$1f:e633  0c 00 07      tsb $0700
$1f:e636  3a            dec a
$1f:e637  e6 80         inc $80
$1f:e639  f2 02         sbc ($02)
$1f:e63b  9b            txy
$1f:e63c  10 00         bpl $e63e
$1f:e63e  2c e6 2c      bit $2ce6
$1f:e641  e6 44         inc $44
$1f:e643  e6 02         inc $02
$1f:e645  28            plp
$1f:e646  4c e6 02      jmp $02e6
$1f:e649  27 2c         and [$2c]
$1f:e64b  e6 bd         inc $bd
$1f:e64d  16 00         asl $00,x
$1f:e64f  29 ff         and #$ff
$1f:e651  df 9d 16 00   cmp $00169d,x
$1f:e655  02 80         cop #$80
$1f:e657  1d 02 82      ora $8202,x
$1f:e65a  02 b2         cop #$b2
$1f:e65c  56 e7         lsr $e7,x
$1f:e65e  1f 00 00 10   ora $100000,x
$1f:e662  00 00         brk #$00
$1f:e664  02 bd         cop #$bd
$1f:e666  16 00         asl $00,x
$1f:e668  09 00         ora #$00
$1f:e66a  20 9d 16      jsr $169d
$1f:e66d  00 80         brk #$80
$1f:e66f  bc bd 16      ldy $16bd,x
$1f:e672  00 89         brk #$89
$1f:e674  00 80         brk #$80
$1f:e676  f0 06         beq $e67e
$1f:e678  02 1b         cop #$1b
$1f:e67a  70 e6         bvs $e662
$1f:e67c  78            sei
$1f:e67d  00 02         brk #$02
$1f:e67f  0c 00 07      tsb $0700
$1f:e682  86 e6         stx $e6
$1f:e684  80 f2         bra $e678
$1f:e686  02 9a         cop #$9a
$1f:e688  10 00         bpl $e68a
$1f:e68a  90 e6         bcc $e672
$1f:e68c  78            sei
$1f:e68d  e6 78         inc $78
$1f:e68f  e6 02         inc $02
$1f:e691  28            plp
$1f:e692  98            tya
$1f:e693  e6 02         inc $02
$1f:e695  27 78         and [$78]
$1f:e697  e6 bd         inc $bd
$1f:e699  16 00         asl $00,x
$1f:e69b  29 ff         and #$ff
$1f:e69d  df 9d 16 00   cmp $00169d,x
$1f:e6a1  02 80         cop #$80
$1f:e6a3  1f 02 82 02   ora $028202,x
$1f:e6a7  b2 56         lda ($56)
$1f:e6a9  e7 1f         sbc [$1f]
$1f:e6ab  f0 ff         beq $e6ac
$1f:e6ad  00 00         brk #$00
$1f:e6af  00 02         brk #$02
$1f:e6b1  bd 16 00      lda $0016,x
$1f:e6b4  09 00         ora #$00
$1f:e6b6  20 9d 16      jsr $169d
$1f:e6b9  00 80         brk #$80
$1f:e6bb  bc bd 16      ldy $16bd,x
$1f:e6be  00 89         brk #$89
$1f:e6c0  00 80         brk #$80
$1f:e6c2  f0 06         beq $e6ca
$1f:e6c4  02 1b         cop #$1b
$1f:e6c6  bc e6 78      ldy $78e6,x
$1f:e6c9  00 02         brk #$02
$1f:e6cb  0c 00 07      tsb $0700
$1f:e6ce  d2 e6         cmp ($e6)
$1f:e6d0  80 f2         bra $e6c4
$1f:e6d2  02 9a         cop #$9a
$1f:e6d4  10 00         bpl $e6d6
$1f:e6d6  c4 e6         cpy $e6
$1f:e6d8  c4 e6         cpy $e6
$1f:e6da  dc e6 02      jml [$02e6]
$1f:e6dd  28            plp
$1f:e6de  e4 e6         cpx $e6
$1f:e6e0  02 27         cop #$27
$1f:e6e2  c4 e6         cpy $e6
$1f:e6e4  02 96         cop #$96
$1f:e6e6  bd 16 00      lda $0016,x
$1f:e6e9  29 ff         and #$ff
$1f:e6eb  df 9d 16 00   cmp $00169d,x
$1f:e6ef  02 80         cop #$80
$1f:e6f1  1f 02 82 02   ora $028202,x
$1f:e6f5  b2 56         lda ($56)
$1f:e6f7  e7 1f         sbc [$1f]
$1f:e6f9  10 00         bpl $e6fb
$1f:e6fb  00 00         brk #$00
$1f:e6fd  00 02         brk #$02
$1f:e6ff  bd 16 00      lda $0016,x
$1f:e702  09 00         ora #$00
$1f:e704  20 9d 16      jsr $169d
$1f:e707  00 80         brk #$80
$1f:e709  ba            tsx
$1f:e70a  bd 16 00      lda $0016,x
$1f:e70d  89 00         bit #$00
$1f:e70f  80 f0         bra $e701
$1f:e711  06 02         asl $02
$1f:e713  1b            tcs
$1f:e714  0a            asl a
$1f:e715  e7 78         sbc [$78]
$1f:e717  00 02         brk #$02
$1f:e719  0c 00 07      tsb $0700
$1f:e71c  20 e7 80      jsr $80e7
$1f:e71f  f2 02         sbc ($02)
$1f:e721  9b            txy
$1f:e722  10 00         bpl $e724
$1f:e724  2a            rol a
$1f:e725  e7 12         sbc [$12]
$1f:e727  e7 12         sbc [$12]
$1f:e729  e7 02         sbc [$02]
$1f:e72b  28            plp
$1f:e72c  32 e7         and ($e7)
$1f:e72e  02 27         cop #$27
$1f:e730  12 e7         ora ($e7)
$1f:e732  bd 16 00      lda $0016,x
$1f:e735  29 ff         and #$ff
$1f:e737  df 9d 16 00   cmp $00169d,x
$1f:e73b  02 80         cop #$80
$1f:e73d  1e 02 82      asl $8202,x
$1f:e740  02 b2         cop #$b2
$1f:e742  56 e7         lsr $e7,x
$1f:e744  1f 00 00 f0   ora $f00000,x
$1f:e748  ff 00 02 bd   sbc $bd0200,x
$1f:e74c  16 00         asl $00,x
$1f:e74e  09 00         ora #$00
$1f:e750  20 9d 16      jsr $169d
$1f:e753  00 80         brk #$80
$1f:e755  bc 02 a3      ldy $a302,x
$1f:e758  00 64         brk #$64
$1f:e75a  a0 20         ldy #$20
$1f:e75c  00 e2         brk #$e2
$1f:e75e  20 a9 00      jsr $00a9
$1f:e761  48            pha
$1f:e762  c2 20         rep #$20
$1f:e764  a9 66 ad      lda #$ad66
$1f:e767  48            pha
$1f:e768  6b            rtl
$1f:e769  02 86         cop #$86
$1f:e76b  6b            rtl
$1f:e76c  bd 16 00      lda $0016,x
$1f:e76f  09 00 20      ora #$2000
$1f:e772  9d 16 00      sta $0016,x
$1f:e775  02 28         cop #$28
$1f:e777  7b            tdc
$1f:e778  e7 80         sbc [$80]
$1f:e77a  06 02         asl $02
$1f:e77c  1b            tcs
$1f:e77d  75 e7         adc $e7,x
$1f:e77f  08            php
$1f:e780  00 bd         brk #$bd
$1f:e782  16 00         asl $00,x
$1f:e784  29 ff df      and #$dfff
$1f:e787  9d 16 00      sta $0016,x
$1f:e78a  02 ad         cop #$ad
$1f:e78c  08            php
$1f:e78d  bd 16 00      lda $0016,x
$1f:e790  09 00 02      ora #$0200
$1f:e793  9d 16 00      sta $0016,x
$1f:e796  02 15         cop #$15
$1f:e798  02 97         cop #$97
$1f:e79a  02 03         cop #$03
$1f:e79c  32 02         and ($02)
$1f:e79e  0c 00 01      tsb $0100
$1f:e7a1  e1 e7         sbc ($e7,x)
$1f:e7a3  02 80         cop #$80
$1f:e7a5  25 02         and $02
$1f:e7a7  82 02 04      brl $ebac
$1f:e7aa  02 80         cop #$80
$1f:e7ac  29 02 82      and #$8202
$1f:e7af  02 16         cop #$16
$1f:e7b1  bd 16 00      lda $0016,x
$1f:e7b4  29 ff fd      and #$fdff
$1f:e7b7  9d 16 00      sta $0016,x
$1f:e7ba  02 1f         cop #$1f
$1f:e7bc  ad 02 03      lda $0302
$1f:e7bf  29 03 00      and #$0003
$1f:e7c2  f0 08         beq $e7cc
$1f:e7c4  3a            dec a
$1f:e7c5  f0 0c         beq $e7d3
$1f:e7c7  3a            dec a
$1f:e7c8  f0 10         beq $e7da
$1f:e7ca  02 96         cop #$96
$1f:e7cc  02 80         cop #$80
$1f:e7ce  28            plp
$1f:e7cf  02 82         cop #$82
$1f:e7d1  80 b7         bra $e78a
$1f:e7d3  02 80         cop #$80
$1f:e7d5  27 02         and [$02]
$1f:e7d7  82 80 b0      brl $985a
$1f:e7da  02 80         cop #$80
$1f:e7dc  26 02         rol $02
$1f:e7de  82 80 a9      brl $9161
$1f:e7e1  02 81         cop #$81
$1f:e7e3  25 0a         and $0a
$1f:e7e5  02 83         cop #$83
$1f:e7e7  02 16         cop #$16
$1f:e7e9  bd 16 00      lda $0016,x
$1f:e7ec  29 ff fd      and #$fdff
$1f:e7ef  9d 16 00      sta $0016,x
$1f:e7f2  02 1b         cop #$1b
$1f:e7f4  f8            sed
$1f:e7f5  e7 08         sbc [$08]
$1f:e7f7  00 02         brk #$02
$1f:e7f9  9c fe e7      stz $e7fe
$1f:e7fc  08            php
$1f:e7fd  e8            inx
$1f:e7fe  02 9a         cop #$9a
$1f:e800  08            php
$1f:e801  00 28         brk #$28
$1f:e803  e8            inx
$1f:e804  08            php
$1f:e805  e8            inx
$1f:e806  33 e8         and ($e8,s),y
$1f:e808  02 9b         cop #$9b
$1f:e80a  08            php
$1f:e80b  00 12         brk #$12
$1f:e80d  e8            inx
$1f:e80e  f2 e7         sbc ($e7)
$1f:e810  1d e8 02      ora $02e8,x
$1f:e813  97 02         sta [$02],y
$1f:e815  9d 2b 02      sta $022b,x
$1f:e818  9e 8a e7      stz $e78a,x
$1f:e81b  80 d5         bra $e7f2
$1f:e81d  02 97         cop #$97
$1f:e81f  02 9d         cop #$9d
$1f:e821  2a            rol a
$1f:e822  02 9e         cop #$9e
$1f:e824  8a            txa
$1f:e825  e7 80         sbc [$80]
$1f:e827  ca            dex
$1f:e828  02 97         cop #$97
$1f:e82a  02 9d         cop #$9d
$1f:e82c  2c 02 9e      bit $9e02
$1f:e82f  8a            txa
$1f:e830  e7 80         sbc [$80]
$1f:e832  bf 02 96 02   lda $029602,x
$1f:e836  9d 2c 02      sta $022c,x
$1f:e839  9e 8a e7      stz $e78a,x
$1f:e83c  80 b4         bra $e7f2
$1f:e83e  02 ad         cop #$ad
$1f:e840  08            php
$1f:e841  02 80         cop #$80
$1f:e843  2e 02 82      rol $8202
$1f:e846  02 80         cop #$80
$1f:e848  30 02         bmi $e84c
$1f:e84a  82 02 80      brl $684f
$1f:e84d  2e 02 82      rol $8202
$1f:e850  02 96         cop #$96
$1f:e852  02 80         cop #$80
$1f:e854  2f 02 82 02   and $028202
$1f:e858  80 2e         bra $e888
$1f:e85a  02 82         cop #$82
$1f:e85c  02 96         cop #$96
$1f:e85e  02 80         cop #$80
$1f:e860  30 02         bmi $e864
$1f:e862  82 02 80      brl $6867
$1f:e865  2e 02 82      rol $8202
$1f:e868  02 97         cop #$97
$1f:e86a  02 80         cop #$80
$1f:e86c  2f 02 82 02   and $028202
$1f:e870  80 2e         bra $e8a0
$1f:e872  02 82         cop #$82
$1f:e874  02 80         cop #$80
$1f:e876  30 02         bmi $e87a
$1f:e878  82 02 96      brl $7e7d
$1f:e87b  02 80         cop #$80
$1f:e87d  30 02         bmi $e881
$1f:e87f  82 02 80      brl $6884
$1f:e882  2f 02 82 02   and $028202
$1f:e886  97 02         sta [$02],y
$1f:e888  80 2f         bra $e8b9
$1f:e88a  02 82         cop #$82
$1f:e88c  80 b3         bra $e841
$1f:e88e  bd 16 00      lda $0016,x
$1f:e891  89 00 80      bit #$8000
$1f:e894  f0 06         beq $e89c
$1f:e896  02 1b         cop #$1b
$1f:e898  8e e8 08      stx $08e8
$1f:e89b  00 02         brk #$02
$1f:e89d  9a            txs
$1f:e89e  00 00         brk #$00
$1f:e8a0  a6 e8         ldx $e8
$1f:e8a2  b0 e8         bcs $e88c
$1f:e8a4  b0 e8         bcs $e88e
$1f:e8a6  02 9b         cop #$9b
$1f:e8a8  00 00         brk #$00
$1f:e8aa  36 e9         rol $e9,x
$1f:e8ac  0e e9 0e      asl $0ee9
$1f:e8af  e9 02 9b      sbc #$9b02
$1f:e8b2  00 00         brk #$00
$1f:e8b4  ba            tsx
$1f:e8b5  e8            inx
$1f:e8b6  e4 e8         cpx $e8
$1f:e8b8  e4 e8         cpx $e8
$1f:e8ba  02 1f         cop #$1f
$1f:e8bc  ad 02 03      lda $0302
$1f:e8bf  30 12         bmi $e8d3
$1f:e8c1  02 97         cop #$97
$1f:e8c3  02 ae         cop #$ae
$1f:e8c5  10 00         bpl $e8c7
$1f:e8c7  e0 ff         cpx #$ff
$1f:e8c9  90 e9         bcc $e8b4
$1f:e8cb  02 80         cop #$80
$1f:e8cd  43 02         eor $02,s
$1f:e8cf  82 82 bd      brl $a654
$1f:e8d2  00 02         brk #$02
$1f:e8d4  96 02         stx $02,y
$1f:e8d6  ae 20 00      ldx $0020
$1f:e8d9  f0 ff         beq $e8da
$1f:e8db  5d e9 02      eor $02e9,x
$1f:e8de  80 45         bra $e925
$1f:e8e0  02 82         cop #$82
$1f:e8e2  80 79         bra $e95d
$1f:e8e4  02 1f         cop #$1f
$1f:e8e6  ad 02 03      lda $0302
$1f:e8e9  30 11         bmi $e8fc
$1f:e8eb  02 96         cop #$96
$1f:e8ed  02 ae         cop #$ae
$1f:e8ef  20 00 10      jsr $1000
$1f:e8f2  00 5d         brk #$5d
$1f:e8f4  e9 02 80      sbc #$8002
$1f:e8f7  44 02 82      mvp $82,$02
$1f:e8fa  80 61         bra $e95d
$1f:e8fc  02 97         cop #$97
$1f:e8fe  02 ae         cop #$ae
$1f:e900  10 00         bpl $e902
$1f:e902  20 00 c3      jsr $c300
$1f:e905  e9 02 80      sbc #$8002
$1f:e908  41 02         eor ($02,x)
$1f:e90a  82 82 b5      brl $9e8f
$1f:e90d  00 02         brk #$02
$1f:e90f  97 02         sta [$02],y
$1f:e911  1f ad 02 03   ora $0302ad,x
$1f:e915  30 10         bmi $e927
$1f:e917  02 ae         cop #$ae
$1f:e919  f0 ff         beq $e91a
$1f:e91b  20 00 c3      jsr $c300
$1f:e91e  e9 02 80      sbc #$8002
$1f:e921  40            rti
$1f:e922  02 82         cop #$82
$1f:e924  82 9c 00      brl $e9c3
$1f:e927  02 ae         cop #$ae
$1f:e929  e0 ff         cpx #$ff
$1f:e92b  10 00         bpl $e92d
$1f:e92d  5d e9 02      eor $02e9,x
$1f:e930  80 44         bra $e976
$1f:e932  02 82         cop #$82
$1f:e934  80 27         bra $e95d
$1f:e936  02 97         cop #$97
$1f:e938  02 1f         cop #$1f
$1f:e93a  ad 02 03      lda $0302
$1f:e93d  30 0f         bmi $e94e
$1f:e93f  02 ae         cop #$ae
$1f:e941  e0 ff         cpx #$ff
$1f:e943  f0 ff         beq $e944
$1f:e945  5d e9 02      eor $02e9,x
$1f:e948  80 45         bra $e98f
$1f:e94a  02 82         cop #$82
$1f:e94c  80 0f         bra $e95d
$1f:e94e  02 ae         cop #$ae
$1f:e950  f0 ff         beq $e951
$1f:e952  e0 ff         cpx #$ff
$1f:e954  90 e9         bcc $e93f
$1f:e956  02 80         cop #$80
$1f:e958  42 02         wdm #$02
$1f:e95a  82 80 33      brl $1cdd
$1f:e95d  02 81         cop #$81
$1f:e95f  3f 04 02 83   and $830204,x
$1f:e963  bd 16 00      lda $0016,x
$1f:e966  09 00 02      ora #$0200
$1f:e969  9d 16 00      sta $0016,x
$1f:e96c  02 80         cop #$80
$1f:e96e  4c 02 82      jmp $8202
$1f:e971  20 f6 e9      jsr $e9f6
$1f:e974  02 80         cop #$80
$1f:e976  4d 02 82      eor $8202
$1f:e979  02 80         cop #$80
$1f:e97b  4e 02 82      lsr $8202
$1f:e97e  bd 16 00      lda $0016,x
$1f:e981  29 ff fd      and #$fdff
$1f:e984  9d 16 00      sta $0016,x
$1f:e987  02 81         cop #$81
$1f:e989  3f 04 02 83   and $830204,x
$1f:e98d  82 fe fe      brl $e88e
$1f:e990  02 81         cop #$81
$1f:e992  3e 04 02      rol $0204,x
$1f:e995  83 bd         sta $bd,s
$1f:e997  16 00         asl $00,x
$1f:e999  09 00 02      ora #$0200
$1f:e99c  9d 16 00      sta $0016,x
$1f:e99f  02 80         cop #$80
$1f:e9a1  49 02 82      eor #$8202
$1f:e9a4  20 f6 e9      jsr $e9f6
$1f:e9a7  02 80         cop #$80
$1f:e9a9  4a            lsr a
$1f:e9aa  02 82         cop #$82
$1f:e9ac  02 80         cop #$80
$1f:e9ae  4b            phk
$1f:e9af  02 82         cop #$82
$1f:e9b1  bd 16 00      lda $0016,x
$1f:e9b4  29 ff fd      and #$fdff
$1f:e9b7  9d 16 00      sta $0016,x
$1f:e9ba  02 81         cop #$81
$1f:e9bc  3e 04 02      rol $0204,x
$1f:e9bf  83 82         sta $82,s
$1f:e9c1  cb            wai
$1f:e9c2  fe 02 81      inc $8102,x
$1f:e9c5  3d 04 02      and $0204,x
$1f:e9c8  83 bd         sta $bd,s
$1f:e9ca  16 00         asl $00,x
$1f:e9cc  09 00 02      ora #$0200
$1f:e9cf  9d 16 00      sta $0016,x
$1f:e9d2  02 80         cop #$80
$1f:e9d4  46 02         lsr $02
$1f:e9d6  82 20 f6      brl $dff9
$1f:e9d9  e9 02 80      sbc #$8002
$1f:e9dc  47 02         eor [$02]
$1f:e9de  82 02 80      brl $69e3
$1f:e9e1  48            pha
$1f:e9e2  02 82         cop #$82
$1f:e9e4  bd 16 00      lda $0016,x
$1f:e9e7  29 ff fd      and #$fdff
$1f:e9ea  9d 16 00      sta $0016,x
$1f:e9ed  02 81         cop #$81
$1f:e9ef  3d 04 02      and $0204,x
$1f:e9f2  83 82         sta $82,s
$1f:e9f4  98            tya
$1f:e9f5  fe 02 b2      inc $b202,x
$1f:e9f8  0d ea 1f      ora $1fea
$1f:e9fb  00 00         brk #$00
$1f:e9fd  10 00         bpl $e9ff
$1f:e9ff  00 02         brk #$02
$1f:ea01  02 b2         cop #$b2
$1f:ea03  15 ea         ora $ea,x
$1f:ea05  1f f0 ff 00   ora $00fff0,x
$1f:ea09  00 00         brk #$00
$1f:ea0b  02 60         cop #$60
$1f:ea0d  02 80         cop #$80
$1f:ea0f  4f 02 82 02   eor $028202
$1f:ea13  86 6b         stx $6b
$1f:ea15  02 80         cop #$80
$1f:ea17  50 02         bvc $ea1b
$1f:ea19  82 02 86      brl $701e
$1f:ea1c  6b            rtl
$1f:ea1d  02 ad         cop #$ad
$1f:ea1f  08            php
$1f:ea20  02 9b         cop #$9b
$1f:ea22  00 00         brk #$00
$1f:ea24  2a            rol a
$1f:ea25  ea            nop
$1f:ea26  48            pha
$1f:ea27  ea            nop
$1f:ea28  48            pha
$1f:ea29  ea            nop
$1f:ea2a  02 97         cop #$97
$1f:ea2c  02 9b         cop #$9b
$1f:ea2e  18            clc
$1f:ea2f  00 36         brk #$36
$1f:ea31  ea            nop
$1f:ea32  e9 ea 36      sbc #$36ea
$1f:ea35  ea            nop
$1f:ea36  02 21         cop #$21
$1f:ea38  41 ea         eor ($ea,x)
$1f:ea3a  02 80         cop #$80
$1f:ea3c  04 02         tsb $02
$1f:ea3e  82 80 dc      brl $c6c1
$1f:ea41  02 80         cop #$80
$1f:ea43  01 02         ora ($02,x)
$1f:ea45  82 80 d5      brl $bfc8
$1f:ea48  02 97         cop #$97
$1f:ea4a  02 9b         cop #$9b
$1f:ea4c  18            clc
$1f:ea4d  00 54         brk #$54
$1f:ea4f  ea            nop
$1f:ea50  23 eb         and $eb,s
$1f:ea52  54 ea 02      mvn $02,$ea
$1f:ea55  22 5f ea 02   jsl $02ea5f
$1f:ea59  80 03         bra $ea5e
$1f:ea5b  02 82         cop #$82
$1f:ea5d  80 be         bra $ea1d
$1f:ea5f  02 80         cop #$80
$1f:ea61  00 02         brk #$02
$1f:ea63  82 80 b7      brl $a1e6
$1f:ea66  02 ad         cop #$ad
$1f:ea68  08            php
$1f:ea69  02 9a         cop #$9a
$1f:ea6b  00 00         brk #$00
$1f:ea6d  73 ea         adc ($ea,s),y
$1f:ea6f  91 ea         sta ($ea),y
$1f:ea71  91 ea         sta ($ea),y
$1f:ea73  02 9a         cop #$9a
$1f:ea75  18            clc
$1f:ea76  00 7d         brk #$7d
$1f:ea78  ea            nop
$1f:ea79  af ea 7d ea   lda $ea7dea
$1f:ea7d  02 97         cop #$97
$1f:ea7f  02 23         cop #$23
$1f:ea81  8a            txa
$1f:ea82  ea            nop
$1f:ea83  02 80         cop #$80
$1f:ea85  05 02         ora $02
$1f:ea87  82 80 dc      brl $c70a
$1f:ea8a  02 80         cop #$80
$1f:ea8c  02 02         cop #$02
$1f:ea8e  82 80 d5      brl $c011
$1f:ea91  02 9a         cop #$9a
$1f:ea93  18            clc
$1f:ea94  00 9b         brk #$9b
$1f:ea96  ea            nop
$1f:ea97  af ea 9b ea   lda $ea9bea
$1f:ea9b  02 96         cop #$96
$1f:ea9d  02 24         cop #$24
$1f:ea9f  a8            tay
$1f:eaa0  ea            nop
$1f:eaa1  02 80         cop #$80
$1f:eaa3  05 02         ora $02
$1f:eaa5  82 80 be      brl $a928
$1f:eaa8  02 80         cop #$80
$1f:eaaa  02 02         cop #$02
$1f:eaac  82 80 b7      brl $a22f
$1f:eaaf  02 9b         cop #$9b
$1f:eab1  00 00         brk #$00
$1f:eab3  b9 ea d1      lda $d1ea,y
$1f:eab6  ea            nop
$1f:eab7  d1 ea         cmp ($ea),y
$1f:eab9  02 80         cop #$80
$1f:eabb  0e 02 82      asl $8202
$1f:eabe  02 b2         cop #$b2
$1f:eac0  7b            tdc
$1f:eac1  eb            xba
$1f:eac2  1f f8 ff e8   ora $e8fff8,x
$1f:eac6  ff 00 02 02   sbc $020200,x
$1f:eaca  80 0f         bra $eadb
$1f:eacc  02 82         cop #$82
$1f:eace  82 4c ff      brl $ea1d
$1f:ead1  02 80         cop #$80
$1f:ead3  10 02         bpl $ead7
$1f:ead5  82 02 b2      brl $9cda
$1f:ead8  88            dey
$1f:ead9  eb            xba
$1f:eada  1f f8 ff 08   ora $08fff8,x
$1f:eade  00 00         brk #$00
$1f:eae0  02 02         cop #$02
$1f:eae2  80 11         bra $eaf5
$1f:eae4  02 82         cop #$82
$1f:eae6  82 34 ff      brl $ea1d
$1f:eae9  02 9a         cop #$9a
$1f:eaeb  00 00         brk #$00
$1f:eaed  f3 ea         sbc ($ea,s),y
$1f:eaef  0b            phd
$1f:eaf0  eb            xba
$1f:eaf1  0b            phd
$1f:eaf2  eb            xba
$1f:eaf3  02 80         cop #$80
$1f:eaf5  0c 02 82      tsb $8202
$1f:eaf8  02 b2         cop #$b2
$1f:eafa  5d eb 1f      eor $1feb,x
$1f:eafd  f8            sed
$1f:eafe  ff 08 00 00   sbc $000008,x
$1f:eb02  02 02         cop #$02
$1f:eb04  80 0d         bra $eb13
$1f:eb06  02 82         cop #$82
$1f:eb08  82 5b ff      brl $ea66
$1f:eb0b  02 80         cop #$80
$1f:eb0d  0a            asl a
$1f:eb0e  02 82         cop #$82
$1f:eb10  02 b2         cop #$b2
$1f:eb12  6c eb 1f      jmp ($1feb)
$1f:eb15  18            clc
$1f:eb16  00 08         brk #$08
$1f:eb18  00 00         brk #$00
$1f:eb1a  02 02         cop #$02
$1f:eb1c  80 0b         bra $eb29
$1f:eb1e  02 82         cop #$82
$1f:eb20  82 43 ff      brl $ea66
$1f:eb23  02 9a         cop #$9a
$1f:eb25  00 00         brk #$00
$1f:eb27  2d eb 45      and $45eb
$1f:eb2a  eb            xba
$1f:eb2b  45 eb         eor $eb
$1f:eb2d  02 80         cop #$80
$1f:eb2f  06 02         asl $02
$1f:eb31  82 02 b2      brl $9d36
$1f:eb34  5d eb 1f      eor $1feb,x
$1f:eb37  f8            sed
$1f:eb38  ff 08 00 00   sbc $000008,x
$1f:eb3c  02 02         cop #$02
$1f:eb3e  80 07         bra $eb47
$1f:eb40  02 82         cop #$82
$1f:eb42  82 21 ff      brl $ea66
$1f:eb45  02 80         cop #$80
$1f:eb47  08            php
$1f:eb48  02 82         cop #$82
$1f:eb4a  02 b2         cop #$b2
$1f:eb4c  6c eb 1f      jmp ($1feb)
$1f:eb4f  18            clc
$1f:eb50  00 08         brk #$08
$1f:eb52  00 00         brk #$00
$1f:eb54  02 02         cop #$02
$1f:eb56  80 09         bra $eb61
$1f:eb58  02 82         cop #$82
$1f:eb5a  82 09 ff      brl $ea66
$1f:eb5d  02 a3         cop #$a3
$1f:eb5f  02 97         cop #$97
$1f:eb61  00 52         brk #$52
$1f:eb63  02 81         cop #$81
$1f:eb65  14 08         trb $08
$1f:eb67  02 83         cop #$83
$1f:eb69  02 86         cop #$86
$1f:eb6b  6b            rtl
$1f:eb6c  02 a3         cop #$a3
$1f:eb6e  02 96         cop #$96
$1f:eb70  00 52         brk #$52
$1f:eb72  02 81         cop #$81
$1f:eb74  14 08         trb $08
$1f:eb76  02 83         cop #$83
$1f:eb78  02 86         cop #$86
$1f:eb7a  6b            rtl
$1f:eb7b  02 a3         cop #$a3
$1f:eb7d  00 52         brk #$52
$1f:eb7f  02 81         cop #$81
$1f:eb81  13 08         ora ($08,s),y
$1f:eb83  02 83         cop #$83
$1f:eb85  02 86         cop #$86
$1f:eb87  6b            rtl
$1f:eb88  02 a3         cop #$a3
$1f:eb8a  00 52         brk #$52
$1f:eb8c  02 81         cop #$81
$1f:eb8e  12 08         ora ($08)
$1f:eb90  02 83         cop #$83
$1f:eb92  02 86         cop #$86
$1f:eb94  6b            rtl
$1f:eb95  02 ad         cop #$ad
$1f:eb97  10 02         bpl $eb9b
$1f:eb99  9a            txs
$1f:eb9a  18            clc
$1f:eb9b  00 a2         brk #$a2
$1f:eb9d  eb            xba
$1f:eb9e  b6 eb         ldx $eb,y
$1f:eba0  ac eb 02      ldy $02eb
$1f:eba3  9b            txy
$1f:eba4  18            clc
$1f:eba5  00 c4         brk #$c4
$1f:eba7  eb            xba
$1f:eba8  a3 ec         lda $ec,s
$1f:ebaa  fd eb 02      sbc $02eb,x
$1f:ebad  9b            txy
$1f:ebae  18            clc
$1f:ebaf  00 c0         brk #$c0
$1f:ebb1  eb            xba
$1f:ebb2  9f ec f9 eb   sta $ebf9ec,x
$1f:ebb6  02 9b         cop #$9b
$1f:ebb8  00 00         brk #$00
$1f:ebba  69 ec 33      adc #$33ec
$1f:ebbd  ec 33 ec      cpx $ec33
$1f:ebc0  02 96         cop #$96
$1f:ebc2  80 02         bra $ebc6
$1f:ebc4  02 97         cop #$97
$1f:ebc6  02 80         cop #$80
$1f:ebc8  26 02         rol $02
$1f:ebca  82 bd 16      brl $028a
$1f:ebcd  00 09         brk #$09
$1f:ebcf  00 02         brk #$02
$1f:ebd1  9d 16 00      sta $0016,x
$1f:ebd4  02 80         cop #$80
$1f:ebd6  27 02         and [$02]
$1f:ebd8  82 02 81      brl $6cdd
$1f:ebdb  28            plp
$1f:ebdc  04 02         tsb $02
$1f:ebde  83 02         sta $02,s
$1f:ebe0  80 27         bra $ec09
$1f:ebe2  02 82         cop #$82
$1f:ebe4  bd 16 00      lda $0016,x
$1f:ebe7  29 ff fd      and #$fdff
$1f:ebea  9d 16 00      sta $0016,x
$1f:ebed  02 80         cop #$80
$1f:ebef  26 02         rol $02
$1f:ebf1  82 02 80      brl $6bf6
$1f:ebf4  19 02 82      ora $8202,y
$1f:ebf7  80 9f         bra $eb98
$1f:ebf9  02 96         cop #$96
$1f:ebfb  80 02         bra $ebff
$1f:ebfd  02 97         cop #$97
$1f:ebff  02 80         cop #$80
$1f:ec01  23 02         and $02,s
$1f:ec03  82 bd 16      brl $02c3
$1f:ec06  00 09         brk #$09
$1f:ec08  00 02         brk #$02
$1f:ec0a  9d 16 00      sta $0016,x
$1f:ec0d  02 80         cop #$80
$1f:ec0f  24 02         bit $02
$1f:ec11  82 02 81      brl $6d16
$1f:ec14  25 04         and $04
$1f:ec16  02 83         cop #$83
$1f:ec18  02 80         cop #$80
$1f:ec1a  24 02         bit $02
$1f:ec1c  82 bd 16      brl $02dc
$1f:ec1f  00 29         brk #$29
$1f:ec21  ff fd 9d 16   sbc $169dfd,x
$1f:ec25  00 02         brk #$02
$1f:ec27  80 23         bra $ec4c
$1f:ec29  02 82         cop #$82
$1f:ec2b  02 80         cop #$80
$1f:ec2d  18            clc
$1f:ec2e  02 82         cop #$82
$1f:ec30  82 65 ff      brl $eb98
$1f:ec33  02 97         cop #$97
$1f:ec35  02 80         cop #$80
$1f:ec37  1a            inc a
$1f:ec38  02 82         cop #$82
$1f:ec3a  bd 16 00      lda $0016,x
$1f:ec3d  09 00 02      ora #$0200
$1f:ec40  9d 16 00      sta $0016,x
$1f:ec43  02 80         cop #$80
$1f:ec45  1b            tcs
$1f:ec46  02 82         cop #$82
$1f:ec48  02 81         cop #$81
$1f:ec4a  1c 04 02      trb $0204
$1f:ec4d  83 02         sta $02,s
$1f:ec4f  80 1b         bra $ec6c
$1f:ec51  02 82         cop #$82
$1f:ec53  bd 16 00      lda $0016,x
$1f:ec56  29 ff fd      and #$fdff
$1f:ec59  9d 16 00      sta $0016,x
$1f:ec5c  02 80         cop #$80
$1f:ec5e  1a            inc a
$1f:ec5f  02 82         cop #$82
$1f:ec61  02 80         cop #$80
$1f:ec63  15 02         ora $02,x
$1f:ec65  82 82 2f      brl $1bea
$1f:ec68  ff 02 97 02   sbc $029702,x
$1f:ec6c  80 1d         bra $ec8b
$1f:ec6e  02 82         cop #$82
$1f:ec70  bd 16 00      lda $0016,x
$1f:ec73  09 00 02      ora #$0200
$1f:ec76  9d 16 00      sta $0016,x
$1f:ec79  02 80         cop #$80
$1f:ec7b  1e 02 82      asl $8202,x
$1f:ec7e  02 81         cop #$81
$1f:ec80  1f 04 02 83   ora $830204,x
$1f:ec84  02 80         cop #$80
$1f:ec86  1e 02 82      asl $8202,x
$1f:ec89  bd 16 00      lda $0016,x
$1f:ec8c  29 ff fd      and #$fdff
$1f:ec8f  9d 16 00      sta $0016,x
$1f:ec92  02 80         cop #$80
$1f:ec94  1d 02 82      ora $8202,x
$1f:ec97  02 80         cop #$80
$1f:ec99  16 02         asl $02,x
$1f:ec9b  82 82 f9      brl $e620
$1f:ec9e  fe 02 96      inc $9602,x
$1f:eca1  80 02         bra $eca5
$1f:eca3  02 97         cop #$97
$1f:eca5  02 80         cop #$80
$1f:eca7  20 02 82      jsr $8202
$1f:ecaa  bd 16 00      lda $0016,x
$1f:ecad  09 00 02      ora #$0200
$1f:ecb0  9d 16 00      sta $0016,x
$1f:ecb3  02 80         cop #$80
$1f:ecb5  21 02         and ($02,x)
$1f:ecb7  82 02 81      brl $6dbc
$1f:ecba  22 04 02 83   jsl $830204
$1f:ecbe  02 80         cop #$80
$1f:ecc0  21 02         and ($02,x)
$1f:ecc2  82 bd 16      brl $0382
$1f:ecc5  00 29         brk #$29
$1f:ecc7  ff fd 9d 16   sbc $169dfd,x
$1f:eccb  00 02         brk #$02
$1f:eccd  80 20         bra $ecef
$1f:eccf  02 82         cop #$82
$1f:ecd1  02 80         cop #$80
$1f:ecd3  17 02         ora [$02],y
$1f:ecd5  82 82 bf      brl $ac5a
$1f:ecd8  fe bd 1a      inc $1abd,x
$1f:ecdb  00 09         brk #$09
$1f:ecdd  00 02         brk #$02
$1f:ecdf  9d 1a 00      sta $001a,x
$1f:ece2  02 a5         cop #$a5
$1f:ece4  ec ec f9      cpx $f9ec
$1f:ece7  ec 06 ed      cpx $ed06
$1f:ecea  06 ed         asl $ed
$1f:ecec  02 99         cop #$99
$1f:ecee  02 22         cop #$22
$1f:ecf0  f9 ec 02      sbc $02ec,y
$1f:ecf3  80 2a         bra $ed1f
$1f:ecf5  02 82         cop #$82
$1f:ecf7  80 f5         bra $ecee
$1f:ecf9  02 98         cop #$98
$1f:ecfb  02 21         cop #$21
$1f:ecfd  ec ec 02      cpx $02ec
$1f:ed00  80 2a         bra $ed2c
$1f:ed02  02 82         cop #$82
$1f:ed04  80 f5         bra $ecfb
$1f:ed06  02 86         cop #$86
$1f:ed08  6b            rtl
$1f:ed09  da            phx
$1f:ed0a  bd 00 00      lda $0000,x
$1f:ed0d  85 16         sta $16
$1f:ed0f  bd 02 00      lda $0002,x
$1f:ed12  38            sec
$1f:ed13  e9 10 00      sbc #$0010
$1f:ed16  85 18         sta $18
$1f:ed18  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$1f:ed1c  8a            txa
$1f:ed1d  fa            plx
$1f:ed1e  9d 30 00      sta $0030,x
$1f:ed21  02 a1         cop #$a1
$1f:ed23  08            php
$1f:ed24  00 f1         brk #$f1
$1f:ed26  ff 02 ad 10   sbc $10ad02,x
$1f:ed2a  da            phx
$1f:ed2b  bd 30 00      lda $0030,x
$1f:ed2e  aa            tax
$1f:ed2f  bf 00 80 7f   lda $7f8000,x
$1f:ed33  fa            plx
$1f:ed34  29 ff 00      and #$00ff
$1f:ed37  f0 35         beq $ed6e
$1f:ed39  bd 16 00      lda $0016,x
$1f:ed3c  29 ff df      and #$dfff
$1f:ed3f  9d 16 00      sta $0016,x
$1f:ed42  02 80         cop #$80
$1f:ed44  2c 02 82      bit $8202
$1f:ed47  02 a0         cop #$a0
$1f:ed49  08            php
$1f:ed4a  00 02         brk #$02
$1f:ed4c  b2 71         lda ($71)
$1f:ed4e  ed 1f 00      sbc $001f
$1f:ed51  00 00         brk #$00
$1f:ed53  00 00         brk #$00
$1f:ed55  02 02         cop #$02
$1f:ed57  80 2d         bra $ed86
$1f:ed59  02 82         cop #$82
$1f:ed5b  02 a0         cop #$a0
$1f:ed5d  f8            sed
$1f:ed5e  ff bd 16 00   sbc $0016bd,x
$1f:ed62  09 00 20      ora #$2000
$1f:ed65  9d 16 00      sta $0016,x
$1f:ed68  02 1b         cop #$1b
$1f:ed6a  27 ed         and [$ed]
$1f:ed6c  78            sei
$1f:ed6d  00 02         brk #$02
$1f:ed6f  86 6b         stx $6b
$1f:ed71  02 a3         cop #$a3
$1f:ed73  00 64         brk #$64
$1f:ed75  02 80         cop #$80
$1f:ed77  2b            pld
$1f:ed78  02 82         cop #$82
$1f:ed7a  02 81         cop #$81
$1f:ed7c  2e 04 02      rol $0204
$1f:ed7f  83 a0         sta $a0,s
$1f:ed81  2e 00 e2      rol $e200
$1f:ed84  20 a9 00      jsr $00a9
$1f:ed87  48            pha
$1f:ed88  c2 20         rep #$20
$1f:ed8a  a9 66 ad      lda #$ad66
$1f:ed8d  48            pha
$1f:ed8e  6b            rtl
$1f:ed8f  02 a5         cop #$a5
$1f:ed91  99 ed c8      sta $c8ed,y
$1f:ed94  ed f7 ed      sbc $edf7
$1f:ed97  26 ee         rol $ee
$1f:ed99  02 ad         cop #$ad
$1f:ed9b  10 02         bpl $ed9f
$1f:ed9d  1b            tcs
$1f:ed9e  a2 ed         ldx #$ed
$1f:eda0  78            sei
$1f:eda1  00 9e         brk #$9e
$1f:eda3  30 00         bmi $eda5
$1f:eda5  00 5d         brk #$5d
$1f:eda7  02 03         cop #$03
$1f:eda9  07 02         ora [$02]
$1f:edab  b0 55         bcs $ee02
$1f:edad  ee 1f 00      inc $001f
$1f:edb0  02 bd         cop #$bd
$1f:edb2  30 00         bmi $edb4
$1f:edb4  18            clc
$1f:edb5  79 00 00      adc $0000,y
$1f:edb8  99 00 00      sta $0000,y
$1f:edbb  20 5d ee      jsr $ee5d
$1f:edbe  02 1b         cop #$1b
$1f:edc0  c4 ed         cpy $ed
$1f:edc2  01 00         ora ($00,x)
$1f:edc4  02 04         cop #$04
$1f:edc6  80 d1         bra $ed99
$1f:edc8  02 ad         cop #$ad
$1f:edca  10 02         bpl $edce
$1f:edcc  1b            tcs
$1f:edcd  d1 ed         cmp ($ed),y
$1f:edcf  78            sei
$1f:edd0  00 9e         brk #$9e
$1f:edd2  30 00         bmi $edd4
$1f:edd4  00 5d         brk #$5d
$1f:edd6  02 03         cop #$03
$1f:edd8  07 02         ora [$02]
$1f:edda  b0 55         bcs $ee31
$1f:eddc  ee 1f 00      inc $001f
$1f:eddf  02 b9         cop #$b9
$1f:ede1  00 00         brk #$00
$1f:ede3  38            sec
$1f:ede4  fd 30 00      sbc $0030,x
$1f:ede7  99 00 00      sta $0000,y
$1f:edea  20 5d ee      jsr $ee5d
$1f:eded  02 1b         cop #$1b
$1f:edef  f3 ed         sbc ($ed,s),y
$1f:edf1  01 00         ora ($00,x)
$1f:edf3  02 04         cop #$04
$1f:edf5  80 d1         bra $edc8
$1f:edf7  02 ad         cop #$ad
$1f:edf9  10 02         bpl $edfd
$1f:edfb  1b            tcs
$1f:edfc  00 ee         brk #$ee
$1f:edfe  78            sei
$1f:edff  00 9e         brk #$9e
$1f:ee01  30 00         bmi $ee03
$1f:ee03  00 5d         brk #$5d
$1f:ee05  02 03         cop #$03
$1f:ee07  07 02         ora [$02]
$1f:ee09  b0 55         bcs $ee60
$1f:ee0b  ee 1f 00      inc $001f
$1f:ee0e  02 bd         cop #$bd
$1f:ee10  30 00         bmi $ee12
$1f:ee12  18            clc
$1f:ee13  79 00 00      adc $0000,y
$1f:ee16  99 00 00      sta $0000,y
$1f:ee19  20 83 ee      jsr $ee83
$1f:ee1c  02 1b         cop #$1b
$1f:ee1e  22 ee 01 00   jsl $0001ee
$1f:ee22  02 04         cop #$04
$1f:ee24  80 d1         bra $edf7
$1f:ee26  02 ad         cop #$ad
$1f:ee28  10 02         bpl $ee2c
$1f:ee2a  1b            tcs
$1f:ee2b  2f ee 78 00   and $0078ee
$1f:ee2f  9e 30 00      stz $0030,x
$1f:ee32  00 5d         brk #$5d
$1f:ee34  02 03         cop #$03
$1f:ee36  07 02         ora [$02]
$1f:ee38  b0 55         bcs $ee8f
$1f:ee3a  ee 1f 00      inc $001f
$1f:ee3d  02 b9         cop #$b9
$1f:ee3f  00 00         brk #$00
$1f:ee41  38            sec
$1f:ee42  fd 30 00      sbc $0030,x
$1f:ee45  99 00 00      sta $0000,y
$1f:ee48  20 83 ee      jsr $ee83
$1f:ee4b  02 1b         cop #$1b
$1f:ee4d  51 ee         eor ($ee),y
$1f:ee4f  01 00         ora ($00,x)
$1f:ee51  02 04         cop #$04
$1f:ee53  80 d1         bra $ee26
$1f:ee55  02 80         cop #$80
$1f:ee57  29 02 82      and #$8202
$1f:ee5a  02 86         cop #$86
$1f:ee5c  6b            rtl
$1f:ee5d  5a            phy
$1f:ee5e  bc 30 00      ldy $0030,x
$1f:ee61  b9 94 fc      lda $fc94,y
$1f:ee64  7a            ply
$1f:ee65  29 ff 00      and #$00ff
$1f:ee68  4a            lsr a
$1f:ee69  49 ff ff      eor #$ffff
$1f:ee6c  1a            inc a
$1f:ee6d  18            clc
$1f:ee6e  79 02 00      adc $0002,y
$1f:ee71  18            clc
$1f:ee72  69 08 00      adc #$0008
$1f:ee75  99 02 00      sta $0002,y
$1f:ee78  bd 30 00      lda $0030,x
$1f:ee7b  18            clc
$1f:ee7c  69 10 00      adc #$0010
$1f:ee7f  9d 30 00      sta $0030,x
$1f:ee82  60            rts
$1f:ee83  5a            phy
$1f:ee84  bc 30 00      ldy $0030,x
$1f:ee87  b9 94 fc      lda $fc94,y
$1f:ee8a  7a            ply
$1f:ee8b  29 ff 00      and #$00ff
$1f:ee8e  4a            lsr a
$1f:ee8f  18            clc
$1f:ee90  79 02 00      adc $0002,y
$1f:ee93  38            sec
$1f:ee94  e9 08 00      sbc #$0008
$1f:ee97  99 02 00      sta $0002,y
$1f:ee9a  bd 30 00      lda $0030,x
$1f:ee9d  18            clc
$1f:ee9e  69 10 00      adc #$0010
$1f:eea1  9d 30 00      sta $0030,x
$1f:eea4  60            rts
$1f:eea5  6b            rtl
$1f:eea6  02 a5         cop #$a5
$1f:eea8  b0 ee         bcs $ee98
$1f:eeaa  df ee 0e ef   cmp $ef0eee,x
$1f:eeae  3d ef 02      and $02ef,x
$1f:eeb1  ad 10 02      lda $0210
$1f:eeb4  1b            tcs
$1f:eeb5  b9 ee 78      lda $78ee,y
$1f:eeb8  00 9e         brk #$9e
$1f:eeba  30 00         bmi $eebc
$1f:eebc  00 5d         brk #$5d
$1f:eebe  02 03         cop #$03
$1f:eec0  07 02         ora [$02]
$1f:eec2  b0 6c         bcs $ef30
$1f:eec4  ef 1f 00 02   sbc $02001f
$1f:eec8  bd 30 00      lda $0030,x
$1f:eecb  18            clc
$1f:eecc  79 02 00      adc $0002,y
$1f:eecf  99 02 00      sta $0002,y
$1f:eed2  20 74 ef      jsr $ef74
$1f:eed5  02 1b         cop #$1b
$1f:eed7  db            stp
$1f:eed8  ee 01 00      inc $0001
$1f:eedb  02 04         cop #$04
$1f:eedd  80 d1         bra $eeb0
$1f:eedf  02 ad         cop #$ad
$1f:eee1  10 02         bpl $eee5
$1f:eee3  1b            tcs
$1f:eee4  e8            inx
$1f:eee5  ee 78 00      inc $0078
$1f:eee8  9e 30 00      stz $0030,x
$1f:eeeb  00 5d         brk #$5d
$1f:eeed  02 03         cop #$03
$1f:eeef  07 02         ora [$02]
$1f:eef1  b0 6c         bcs $ef5f
$1f:eef3  ef 1f 00 02   sbc $02001f
$1f:eef7  b9 02 00      lda $0002,y
$1f:eefa  38            sec
$1f:eefb  fd 30 00      sbc $0030,x
$1f:eefe  99 02 00      sta $0002,y
$1f:ef01  20 74 ef      jsr $ef74
$1f:ef04  02 1b         cop #$1b
$1f:ef06  0a            asl a
$1f:ef07  ef 01 00 02   sbc $020001
$1f:ef0b  04 80         tsb $80
$1f:ef0d  d1 02         cmp ($02),y
$1f:ef0f  ad 10 02      lda $0210
$1f:ef12  1b            tcs
$1f:ef13  17 ef         ora [$ef],y
$1f:ef15  78            sei
$1f:ef16  00 9e         brk #$9e
$1f:ef18  30 00         bmi $ef1a
$1f:ef1a  00 5d         brk #$5d
$1f:ef1c  02 03         cop #$03
$1f:ef1e  07 02         ora [$02]
$1f:ef20  b0 6c         bcs $ef8e
$1f:ef22  ef 1f 00 02   sbc $02001f
$1f:ef26  bd 30 00      lda $0030,x
$1f:ef29  18            clc
$1f:ef2a  79 02 00      adc $0002,y
$1f:ef2d  99 02 00      sta $0002,y
$1f:ef30  20 96 ef      jsr $ef96
$1f:ef33  02 1b         cop #$1b
$1f:ef35  39 ef 01      and $01ef,y
$1f:ef38  00 02         brk #$02
$1f:ef3a  04 80         tsb $80
$1f:ef3c  d1 02         cmp ($02),y
$1f:ef3e  ad 10 02      lda $0210
$1f:ef41  1b            tcs
$1f:ef42  46 ef         lsr $ef
$1f:ef44  78            sei
$1f:ef45  00 9e         brk #$9e
$1f:ef47  30 00         bmi $ef49
$1f:ef49  00 5d         brk #$5d
$1f:ef4b  02 03         cop #$03
$1f:ef4d  07 02         ora [$02]
$1f:ef4f  b0 6c         bcs $efbd
$1f:ef51  ef 1f 00 02   sbc $02001f
$1f:ef55  b9 02 00      lda $0002,y
$1f:ef58  38            sec
$1f:ef59  fd 30 00      sbc $0030,x
$1f:ef5c  99 02 00      sta $0002,y
$1f:ef5f  20 96 ef      jsr $ef96
$1f:ef62  02 1b         cop #$1b
$1f:ef64  68            pla
$1f:ef65  ef 01 00 02   sbc $020001
$1f:ef69  04 80         tsb $80
$1f:ef6b  d1 02         cmp ($02),y
$1f:ef6d  80 29         bra $ef98
$1f:ef6f  02 82         cop #$82
$1f:ef71  02 86         cop #$86
$1f:ef73  6b            rtl
$1f:ef74  5a            phy
$1f:ef75  bc 30 00      ldy $0030,x
$1f:ef78  b9 94 fc      lda $fc94,y
$1f:ef7b  7a            ply
$1f:ef7c  29 ff 00      and #$00ff
$1f:ef7f  4a            lsr a
$1f:ef80  18            clc
$1f:ef81  79 00 00      adc $0000,y
$1f:ef84  38            sec
$1f:ef85  e9 0c 00      sbc #$000c
$1f:ef88  99 00 00      sta $0000,y
$1f:ef8b  bd 30 00      lda $0030,x
$1f:ef8e  18            clc
$1f:ef8f  69 10 00      adc #$0010
$1f:ef92  9d 30 00      sta $0030,x
$1f:ef95  60            rts
$1f:ef96  5a            phy
$1f:ef97  bc 30 00      ldy $0030,x
$1f:ef9a  b9 94 fc      lda $fc94,y
$1f:ef9d  7a            ply
$1f:ef9e  29 ff 00      and #$00ff
$1f:efa1  4a            lsr a
$1f:efa2  49 ff ff      eor #$ffff
$1f:efa5  1a            inc a
$1f:efa6  18            clc
$1f:efa7  79 00 00      adc $0000,y
$1f:efaa  18            clc
$1f:efab  69 0c 00      adc #$000c
$1f:efae  99 00 00      sta $0000,y
$1f:efb1  bd 30 00      lda $0030,x
$1f:efb4  18            clc
$1f:efb5  69 10 00      adc #$0010
$1f:efb8  9d 30 00      sta $0030,x
$1f:efbb  60            rts
$1f:efbc  a2 4e         ldx #$4e
$1f:efbe  f1 86         sbc ($86),y
$1f:efc0  29 a9 1f      and #$1fa9
$1f:efc3  85 2b         sta $2b
$1f:efc5  20 e6 f0      jsr $f0e6
$1f:efc8  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$1f:efcc  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$1f:efd0  a9 ff 8d      lda #$8dff
$1f:efd3  40            rti
$1f:efd4  21 a2         and ($a2,x)
$1f:efd6  00 80         brk #$80
$1f:efd8  86 29         stx $29
$1f:efda  a9 06 85      lda #$8506
$1f:efdd  2b            pld
$1f:efde  a2 00         ldx #$00
$1f:efe0  30 8e         bmi $ef70
$1f:efe2  20 03 22      jsr $2203
$1f:efe5  f5 ef         sbc $ef,x
$1f:efe7  1f c2 20 a5   ora $a520c2,x
$1f:efeb  02 18         cop #$18
$1f:efed  65 08         adc $08
$1f:efef  8d 20 03      sta $0320
$1f:eff2  e2 20         sep #$20
$1f:eff4  6b            rtl
$1f:eff5  08            php
$1f:eff6  5a            phy
$1f:eff7  20 e6 f0      jsr $f0e6
$1f:effa  88            dey
$1f:effb  88            dey
$1f:effc  e2 20         sep #$20
$1f:effe  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$1f:f002  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$1f:f006  a9 ff         lda #$ff
$1f:f008  8d 40 21      sta $2140
$1f:f00b  a9 cc         lda #$cc
$1f:f00d  85 04         sta $04
$1f:f00f  c2 20         rep #$20
$1f:f011  a9 aa bb      lda #$bbaa
$1f:f014  cd 40 21      cmp $2140
$1f:f017  d0 fb         bne $f014
$1f:f019  b7 29         lda [$29],y
$1f:f01b  c8            iny
$1f:f01c  84 06         sty $06
$1f:f01e  29 ff 00      and #$00ff
$1f:f021  85 0c         sta $0c
$1f:f023  ae 20 03      ldx $0320
$1f:f026  86 02         stx $02
$1f:f028  64 00         stz $00
$1f:f02a  c2 20         rep #$20
$1f:f02c  a2 00         ldx #$00
$1f:f02e  80 86         bra $efb6
$1f:f030  2c e2 20      bit $20e2
$1f:f033  a9 07 85      lda #$8507
$1f:f036  2e c2 20      rol $20c2
$1f:f039  a4 06         ldy $06
$1f:f03b  b7 29         lda [$29],y
$1f:f03d  c8            iny
$1f:f03e  84 06         sty $06
$1f:f040  29 ff 00      and #$00ff
$1f:f043  85 0e         sta $0e
$1f:f045  a5 02         lda $02
$1f:f047  18            clc
$1f:f048  65 00         adc $00
$1f:f04a  85 02         sta $02
$1f:f04c  a7 2c         lda [$2c]
$1f:f04e  85 00         sta $00
$1f:f050  85 08         sta $08
$1f:f052  e6 2c         inc $2c
$1f:f054  e6 2c         inc $2c
$1f:f056  a5 0e         lda $0e
$1f:f058  f0 14         beq $f06e
$1f:f05a  c6 0e         dec $0e
$1f:f05c  a5 2c         lda $2c
$1f:f05e  18            clc
$1f:f05f  65 00         adc $00
$1f:f061  85 2c         sta $2c
$1f:f063  90 e7         bcc $f04c
$1f:f065  09 00 80      ora #$8000
$1f:f068  85 2c         sta $2c
$1f:f06a  e6 2e         inc $2e
$1f:f06c  80 de         bra $f04c
$1f:f06e  a4 2c         ldy $2c
$1f:f070  64 2c         stz $2c
$1f:f072  e2 20         sep #$20
$1f:f074  a5 04         lda $04
$1f:f076  80 41         bra $f0b9
$1f:f078  b7 2c         lda [$2c],y
$1f:f07a  c8            iny
$1f:f07b  d0 05         bne $f082
$1f:f07d  a0 00         ldy #$00
$1f:f07f  80 e6         bra $f067
$1f:f081  2e eb a9      rol $a9eb
$1f:f084  00 80         brk #$80
$1f:f086  12 eb         ora ($eb)
$1f:f088  b7 2c         lda [$2c],y
$1f:f08a  c8            iny
$1f:f08b  d0 05         bne $f092
$1f:f08d  a0 00         ldy #$00
$1f:f08f  80 e6         bra $f077
$1f:f091  2e eb cd      rol $cdeb
$1f:f094  40            rti
$1f:f095  21 d0         and ($d0,x)
$1f:f097  fb            xce
$1f:f098  1a            inc a
$1f:f099  c2 20         rep #$20
$1f:f09b  8d 40 21      sta $2140
$1f:f09e  e2 20         sep #$20
$1f:f0a0  ca            dex
$1f:f0a1  d0 e4         bne $f087
$1f:f0a3  cd 40 21      cmp $2140
$1f:f0a6  d0 fb         bne $f0a3
$1f:f0a8  69 03         adc #$03
$1f:f0aa  f0 fc         beq $f0a8
$1f:f0ac  85 04         sta $04
$1f:f0ae  c6 0c         dec $0c
$1f:f0b0  f0 03         beq $f0b5
$1f:f0b2  82 75 ff      brl $f02a
$1f:f0b5  64 00         stz $00
$1f:f0b7  64 01         stz $01
$1f:f0b9  48            pha
$1f:f0ba  c2 20         rep #$20
$1f:f0bc  a5 00         lda $00
$1f:f0be  aa            tax
$1f:f0bf  a5 02         lda $02
$1f:f0c1  8d 42 21      sta $2142
$1f:f0c4  e2 20         sep #$20
$1f:f0c6  e0 01         cpx #$01
$1f:f0c8  00 a9         brk #$a9
$1f:f0ca  00 2a         brk #$2a
$1f:f0cc  8d 41 21      sta $2141
$1f:f0cf  69 7f         adc #$7f
$1f:f0d1  68            pla
$1f:f0d2  8d 40 21      sta $2140
$1f:f0d5  cd 40 21      cmp $2140
$1f:f0d8  d0 fb         bne $f0d5
$1f:f0da  70 9c         bvs $f078
$1f:f0dc  a9 7e         lda #$7e
$1f:f0de  85 2e         sta $2e
$1f:f0e0  9c 42 21      stz $2142
$1f:f0e3  7a            ply
$1f:f0e4  28            plp
$1f:f0e5  6b            rtl
$1f:f0e6  08            php
$1f:f0e7  da            phx
$1f:f0e8  c2 30         rep #$30
$1f:f0ea  a0 00 00      ldy #$0000
$1f:f0ed  a9 aa bb      lda #$bbaa
$1f:f0f0  cd 40 21      cmp $2140
$1f:f0f3  d0 fb         bne $f0f0
$1f:f0f5  e2 20         sep #$20
$1f:f0f7  a9 cc         lda #$cc
$1f:f0f9  80 26         bra $f121
$1f:f0fb  b7 29         lda [$29],y
$1f:f0fd  c8            iny
$1f:f0fe  eb            xba
$1f:f0ff  a9 00         lda #$00
$1f:f101  80 0b         bra $f10e
$1f:f103  eb            xba
$1f:f104  b7 29         lda [$29],y
$1f:f106  c8            iny
$1f:f107  eb            xba
$1f:f108  cd 40 21      cmp $2140
$1f:f10b  d0 fb         bne $f108
$1f:f10d  1a            inc a
$1f:f10e  c2 20         rep #$20
$1f:f110  8d 40 21      sta $2140
$1f:f113  e2 20         sep #$20
$1f:f115  ca            dex
$1f:f116  d0 eb         bne $f103
$1f:f118  cd 40 21      cmp $2140
$1f:f11b  d0 fb         bne $f118
$1f:f11d  69 03         adc #$03
$1f:f11f  f0 fc         beq $f11d
$1f:f121  48            pha
$1f:f122  c2 20         rep #$20
$1f:f124  b7 29         lda [$29],y
$1f:f126  c8            iny
$1f:f127  c8            iny
$1f:f128  aa            tax
$1f:f129  b7 29         lda [$29],y
$1f:f12b  c8            iny
$1f:f12c  c8            iny
$1f:f12d  8d 42 21      sta $2142
$1f:f130  e2 20         sep #$20
$1f:f132  e0 01 00      cpx #$0001
$1f:f135  a9 00         lda #$00
$1f:f137  2a            rol a
$1f:f138  8d 41 21      sta $2141
$1f:f13b  69 7f         adc #$7f
$1f:f13d  68            pla
$1f:f13e  8d 40 21      sta $2140
$1f:f141  cd 40 21      cmp $2140
$1f:f144  d0 fb         bne $f141
$1f:f146  70 b3         bvs $f0fb
$1f:f148  9c 42 21      stz $2142
$1f:f14b  fa            plx
$1f:f14c  28            plp
$1f:f14d  60            rts
$1f:f14e  47 0b         eor [$0b]
$1f:f150  00 04         brk #$04
$1f:f152  20 cd cf      jsr $cfcd
$1f:f155  bd e8 00      lda $00e8,x
$1f:f158  5d af c8      eor $c8af,x
$1f:f15b  f0 d0         beq $f12d
$1f:f15d  fb            xce
$1f:f15e  c5 ff         cmp $ff
$1f:f160  0f bc 3f a9   ora $a93fbc
$1f:f164  09 a2         ora #$a2
$1f:f166  48            pha
$1f:f167  e8            inx
$1f:f168  60            rts
$1f:f169  8d 0c 3f      sta $3f0c
$1f:f16c  b8            clv
$1f:f16d  05 8d         ora $8d
$1f:f16f  1c 3f b8      trb $b83f
$1f:f172  05 e8         ora $e8
$1f:f174  2c 8d 5d      bit $5d8d
$1f:f177  3f b8 05 e8   and $e805b8,x
$1f:f17b  30 c4         bmi $f141
$1f:f17d  f1 e8         sbc ($e8),y
$1f:f17f  10 c4         bpl $f145
$1f:f181  fa            plx
$1f:f182  c4 53         cpy $53
$1f:f184  e8            inx
$1f:f185  01 c4         ora ($c4,x)
$1f:f187  f1 e4         sbc ($e4),y
$1f:f189  36 48         rol $48,x
$1f:f18b  ff 24 4a c4   sbc $c44a24,x
$1f:f18f  38            sec
$1f:f190  8d 0a ad      sta $ad0a
$1f:f193  05 f0         ora $f0
$1f:f195  07 b0         ora [$b0]
$1f:f197  08            php
$1f:f198  69 4d         adc #$4d
$1f:f19a  4c d0 0f      jmp $0fd0
$1f:f19d  e3 4c         sbc $4c,s
$1f:f19f  0c f6 5d      tsb $5df6
$1f:f1a2  0d c4 f2      ora $f2c4
$1f:f1a5  f6 67         inc $67,x
$1f:f1a7  0d 5d e6      ora $e65d
$1f:f1aa  c4 f3         cpy $f3
$1f:f1ac  fe e4 cb      inc $cbe4,x
$1f:f1af  45 cb         eor $cb
$1f:f1b1  46 eb         lsr $eb
$1f:f1b3  fd f0 fc      sbc $fcf0,x
$1f:f1b6  6d e8 40      adc $40e8
$1f:f1b9  cf 60 84 43   cmp $438460
$1f:f1bd  c4 43         cpy $43
$1f:f1bf  90 0a         bcc $f1cb
$1f:f1c1  3f a0 0d 69   and $690da0,x
$1f:f1c5  4d 4c f0      eor $f04c
$1f:f1c8  02 ab         cop #$ab
$1f:f1ca  4c e4 53      jmp $53e4
$1f:f1cd  ee cf 60      inc $60cf
$1f:f1d0  84 51         sty $51
$1f:f1d2  c4 51         cpy $51
$1f:f1d4  90 19         bcc $f1ef
$1f:f1d6  3f 83 06 e4   and $e40683,x
$1f:f1da  30 f0         bmi $f1cc
$1f:f1dc  0a            asl a
$1f:f1dd  8b            phb
$1f:f1de  31 d0         and ($d0),y
$1f:f1e0  06 8f         asl $8f
$1f:f1e2  00 04         brk #$04
$1f:f1e4  3f e8 05 cd   and $cd05e8,x
$1f:f1e8  00 3f         brk #$3f
$1f:f1ea  b6 04         ldx $04,y
$1f:f1ec  5f 36 04 e4   eor $e40436,x
$1f:f1f0  04 f0         tsb $f0
$1f:f1f2  12 cd         ora ($cd)
$1f:f1f4  00 8f         brk #$8f
$1f:f1f6  01 47         ora ($47,x)
$1f:f1f8  f4 d5 f0      pea $f0d5
$1f:f1fb  03 3f         ora $3f,s
$1f:f1fd  34 0c         bit $0c,x
$1f:f1ff  3d 3d 0b      and $0b3d,x
$1f:f202  47 d0         eor [$d0]
$1f:f204  f3 5f         sbc ($5f,s),y
$1f:f206  36 04         rol $04,x
$1f:f208  f4 04 d4      pea $d404
$1f:f20b  f4 f4 f4      pea $f4f4
$1f:f20e  74 f4         stz $f4,x
$1f:f210  d0 fa         bne $f20c
$1f:f212  d4 00         pei ($00)
$1f:f214  6f ad ca 90   adc $90caad
$1f:f218  05 3f         ora $3f
$1f:f21a  df 07 8d a4   cmp $a48d07,x
$1f:f21e  ad c8 b0      lda $b0c8
$1f:f221  f2 e4         sbc ($e4)
$1f:f223  1a            inc a
$1f:f224  24 47         bit $47
$1f:f226  d0 ec         bne $f214
$1f:f228  dd 28 7f      cmp $7f28,x
$1f:f22b  60            rts
$1f:f22c  84 50         sty $50
$1f:f22e  60            rts
$1f:f22f  95 f0         sta $f0,x
$1f:f231  02 d5         cop #$d5
$1f:f233  7d 03 f5      adc $f503,x
$1f:f236  a5 03         lda $03
$1f:f238  d5 7c         cmp $7c,x
$1f:f23a  03 f5         ora $f5,s
$1f:f23c  a1 02         lda ($02,x)
$1f:f23e  5c e8 00 7c   jml $7c00e8
$1f:f242  d5 8c         cmp $8c,x
$1f:f244  02 e8         cop #$e8
$1f:f246  00 d4         brk #$d4
$1f:f248  ac d5 00      ldy $00d5
$1f:f24b  01 d5         ora ($d5,x)
$1f:f24d  c8            iny
$1f:f24e  02 d4         cop #$d4
$1f:f250  c0 09 47      cpy #$4709
$1f:f253  5e 09 47      lsr $4709,x
$1f:f256  45 f5         eor $f5
$1f:f258  64 02         stz $02
$1f:f25a  d4 98         pei ($98)
$1f:f25c  f0 1e         beq $f27c
$1f:f25e  f5 65         sbc $65,x
$1f:f260  02 d4         cop #$d4
$1f:f262  99 f5 78      sta $78f5,y
$1f:f265  02 d0         cop #$d0
$1f:f267  0a            asl a
$1f:f268  f5 7d         sbc $7d,x
$1f:f26a  03 80         ora $80,s
$1f:f26c  b5 79         lda $79,x
$1f:f26e  02 d5         cop #$d5
$1f:f270  7d 03 f5      adc $f503,x
$1f:f273  79 02 60      adc $6002,y
$1f:f276  95 7d         sta $7d,x
$1f:f278  03 3f         ora $3f,s
$1f:f27a  15 0a         ora $0a,x
$1f:f27c  3f 2d 0a 8d   and $8d0a2d,x
$1f:f280  00 e4         brk #$e4
$1f:f282  11 80         ora ($80),y
$1f:f284  a8            tay
$1f:f285  34 b0         bit $b0,x
$1f:f287  09 e4         ora #$e4
$1f:f289  11 80         ora ($80),y
$1f:f28b  a8            tay
$1f:f28c  13 b0         ora ($b0,s),y
$1f:f28e  06 dc         asl $dc
$1f:f290  1c 7a 10      trb $107a
$1f:f293  da            phx
$1f:f294  10 4d         bpl $f2e3
$1f:f296  e4 11         cpx $11
$1f:f298  1c 8d 00      trb $008d
$1f:f29b  cd 18 9e      cmp $9e18
$1f:f29e  5d f6 73      eor $73f6,x
$1f:f2a1  0d c4 15      ora $15c4
$1f:f2a4  f6 72         inc $72,x
$1f:f2a6  0d c4 14      ora $14c4
$1f:f2a9  f6 75         inc $75,x
$1f:f2ab  0d 2d f6      ora $f62d
$1f:f2ae  74 0d         stz $0d,x
$1f:f2b0  ee 9a 14      inc $149a
$1f:f2b3  eb            xba
$1f:f2b4  10 cf         bpl $f285
$1f:f2b6  dd 8d 00      cmp $008d,x
$1f:f2b9  7a            ply
$1f:f2ba  14 cb         trb $cb
$1f:f2bc  15 1c         ora $1c,x
$1f:f2be  2b            pld
$1f:f2bf  15 c4         ora $c4,x
$1f:f2c1  14 2f         trb $2f
$1f:f2c3  04 4b         tsb $4b
$1f:f2c5  15 7c         ora $7c,x
$1f:f2c7  3d c8 06      and $06c8,x
$1f:f2ca  d0 f8         bne $f2c4
$1f:f2cc  c4 14         cpy $14
$1f:f2ce  ce f5 28      dec $28f5
$1f:f2d1  02 eb         cop #$eb
$1f:f2d3  15 cf         ora $cf,x
$1f:f2d5  da            phx
$1f:f2d6  16 f5         asl $f5,x
$1f:f2d8  28            plp
$1f:f2d9  02 eb         cop #$eb
$1f:f2db  14 cf         trb $cf
$1f:f2dd  6d f5 29      adc $29f5
$1f:f2e0  02 eb         cop #$eb
$1f:f2e2  14 cf         trb $cf
$1f:f2e4  7a            ply
$1f:f2e5  16 da         asl $da,x
$1f:f2e7  16 f5         asl $f5,x
$1f:f2e9  29 02         and #$02
$1f:f2eb  eb            xba
$1f:f2ec  15 cf         ora $cf,x
$1f:f2ee  fd ae 7a      sbc $7aae,x
$1f:f2f1  16 da         asl $da,x
$1f:f2f3  16 f5         asl $f5,x
$1f:f2f5  8c 0d 08      sty $080d
$1f:f2f8  02 fd         cop #$fd
$1f:f2fa  e4 16         cpx $16
$1f:f2fc  3f b0 05 fc   and $fc05b0,x
$1f:f300  e4 17         cpx $17
$1f:f302  2d e4 47      and $47e4
$1f:f305  24 1a         bit $1a
$1f:f307  ae d0 04      ldx $04d0
$1f:f30a  cb            wai
$1f:f30b  f2 c4         sbc ($c4)
$1f:f30d  f3 6f         sbc ($6f,s),y
$1f:f30f  8d 00 f7      sta $f700
$1f:f312  40            rti
$1f:f313  3a            dec a
$1f:f314  40            rti
$1f:f315  2d f7 40      and $40f7
$1f:f318  3a            dec a
$1f:f319  40            rti
$1f:f31a  fd ae 6f      sbc $6fae,x
$1f:f31d  8f ff 30 8f   sta $8f30ff
$1f:f321  7f 31 c4 04   adc $04c431,x
$1f:f325  6f 2d e5 fd   adc $fde52d
$1f:f329  0f ec fe 0f   ora $0ffeec
$1f:f32d  da            phx
$1f:f32e  3b            tsc
$1f:f32f  e8            inx
$1f:f330  00 5d         brk #$5d
$1f:f332  c7 3b         cmp [$3b]
$1f:f334  3a            dec a
$1f:f335  3b            tsc
$1f:f336  d0 fa         bne $f332
$1f:f338  ae 6f 8f      ldx $8f6f
$1f:f33b  ff 46 8f 00   sbc $008f46,x
$1f:f33f  04 a2         tsb $a2
$1f:f341  48            pha
$1f:f342  c2 48         rep #$48
$1f:f344  e8            inx
$1f:f345  00 c4         brk #$c4
$1f:f347  e5 c4         sbc $c4
$1f:f349  e7 e8         sbc [$e8]
$1f:f34b  01 3f         ora ($3f,x)
$1f:f34d  a9 09         lda #$09
$1f:f34f  6f c2 48 6f   adc $6f48c2
$1f:f353  3f 06 0f c4   and $c40f06,x
$1f:f357  08            php
$1f:f358  c4 04         cpy $04
$1f:f35a  6f 68 f0 f0   adc $f0f068
$1f:f35e  db            stp
$1f:f35f  68            pla
$1f:f360  f1 f0         sbc ($f0),y
$1f:f362  ba            tsx
$1f:f363  68            pla
$1f:f364  f2 f0         sbc ($f0)
$1f:f366  e9 68         sbc #$68
$1f:f368  ff f0 e8 6f   sbc $6fe8f0,x
$1f:f36c  c4 04         cpy $04
$1f:f36e  1c f0 26      trb $26f0
$1f:f371  3f d4 05 5d   and $5d05d4,x
$1f:f375  f5 ff         sbc $ff,x
$1f:f377  0f fd f5 fe   ora $fef5fd
$1f:f37b  0f da 40 8f   ora $8f40da
$1f:f37f  02 0c         cop #$0c
$1f:f381  e8            inx
$1f:f382  00 c4         brk #$c4
$1f:f384  30 c4         bmi $f34a
$1f:f386  5f c4 39 c4   eor $c439c4,x
$1f:f38a  35 c4         and $c4,x
$1f:f38c  36 c4         rol $c4,x
$1f:f38e  e5 c4         sbc $c4
$1f:f390  e7 d2         sbc [$d2]
$1f:f392  48            pha
$1f:f393  e8            inx
$1f:f394  ff c4 f7 e4   sbc $e4f7c4,x
$1f:f398  1a            inc a
$1f:f399  48            pha
$1f:f39a  ff 0e 46 00   sbc $00460e,x
$1f:f39e  6f cd 0e 8f   adc $8f0ecd
$1f:f3a2  80 47         bra $f3eb
$1f:f3a4  e8            inx
$1f:f3a5  ff d5 05 03   sbc $0305d5,x
$1f:f3a9  e8            inx
$1f:f3aa  0a            asl a
$1f:f3ab  3f 49 08 d5   and $d50849,x
$1f:f3af  15 02         ora $02,x
$1f:f3b1  d5 a5         cmp $a5,x
$1f:f3b3  03 d5         ora $d5,s
$1f:f3b5  f0 02         beq $f3b9
$1f:f3b7  d5 64         cmp $64,x
$1f:f3b9  02 d4         cop #$d4
$1f:f3bb  ad d4 c1      lda $c1d4
$1f:f3be  1d 1d 4b      ora $4b1d,x
$1f:f3c1  47 d0         eor [$d0]
$1f:f3c3  e0 c4 5a      cpx #$5ac4
$1f:f3c6  c4 68         cpy $68
$1f:f3c8  c4 54         cpy $54
$1f:f3ca  c4 50         cpy $50
$1f:f3cc  c4 42         cpy $42
$1f:f3ce  8f c0 59 8f   sta $8f59c0
$1f:f3d2  20 53 6f      jsr $6f53
$1f:f3d5  eb            xba
$1f:f3d6  08            php
$1f:f3d7  e4 00         cpx $00
$1f:f3d9  68            pla
$1f:f3da  f0 90         beq $f36c
$1f:f3dc  03 5f         ora $5f,s
$1f:f3de  09 06         ora #$06
$1f:f3e0  c4 08         cpy $08
$1f:f3e2  7e 00 d0      ror $d000,x
$1f:f3e5  86 e4         stx $e4
$1f:f3e7  04 f0         tsb $f0
$1f:f3e9  ea            nop
$1f:f3ea  d2 48         cmp ($48)
$1f:f3ec  e4 0c         cpx $0c
$1f:f3ee  f0 52         beq $f442
$1f:f3f0  6e 0c ac      ror $ac0c
$1f:f3f3  3f bd 05 d0   and $d005bd,x
$1f:f3f7  19 fd d0      ora $d0fd,y
$1f:f3fa  05 c4         ora $c4
$1f:f3fc  f7 5f         sbc [$5f],y
$1f:f3fe  1a            inc a
$1f:f3ff  06 8b         asl $8b
$1f:f401  42 10         wdm #$10
$1f:f403  02 c4         cop #$c4
$1f:f405  42 3f         wdm #$3f
$1f:f407  bd 05 f8      lda $f805,x
$1f:f40a  42 f0         wdm #$f0
$1f:f40c  e6 da         inc $da
$1f:f40e  40            rti
$1f:f40f  2f e2 da 16   and $16dae2
$1f:f413  8d 0f f7      sta $f70f
$1f:f416  16 d6         asl $d6,x
$1f:f418  d4 00         pei ($00)
$1f:f41a  dc 10 f8      jml [$f810]
$1f:f41d  cd 00 8f      cmp $8f00
$1f:f420  01 47         ora ($47,x)
$1f:f422  f4 d5 f0      pea $f0d5
$1f:f425  0a            asl a
$1f:f426  f5 15         sbc $15,x
$1f:f428  02 d0         cop #$d0
$1f:f42a  05 e8         ora $e8
$1f:f42c  00 3f         brk #$3f
$1f:f42e  df 07 e8 00   cmp $00e807,x
$1f:f432  d5 b8         cmp $b8,x
$1f:f434  03 d4         ora $d4,s
$1f:f436  84 d4         sty $d4
$1f:f438  85 bc         sta $bc
$1f:f43a  d4 70         pei ($70)
$1f:f43c  3d 3d 0b      and $0b3d,x
$1f:f43f  47 d0         eor [$d0]
$1f:f441  e0 cd 00      cpx #$00cd
$1f:f444  d8            cld
$1f:f445  5e 8f 01      lsr $018f,x
$1f:f448  47 d8         eor [$d8]
$1f:f44a  44 f4 d5      mvp $d5,$f4
$1f:f44d  f0 6c         beq $f4bb
$1f:f44f  9b            txy
$1f:f450  70 d0         bvs $f422
$1f:f452  62 3f d5      per $c994
$1f:f455  07 d0         ora [$d0]
$1f:f457  1d f5 b8      ora $b8f5,x
$1f:f45a  03 f0         ora $f0,s
$1f:f45c  96 3f         stx $3f,y
$1f:f45e  41 09         eor ($09,x)
$1f:f460  f5 b8         sbc $b8,x
$1f:f462  03 9c         ora $9c,s
$1f:f464  d5 b8         cmp $b8,x
$1f:f466  03 d0         ora $d0,s
$1f:f468  ea            nop
$1f:f469  f5 3c         sbc $3c,x
$1f:f46b  02 d4         cop #$d4
$1f:f46d  d4 f5         pei ($f5)
$1f:f46f  3d 02 d4      and $d402,x
$1f:f472  d5 2f         cmp $2f,x
$1f:f474  de 30 20      dec $2030,x
$1f:f477  d5 00         cmp $00,x
$1f:f479  02 3f         cop #$3f
$1f:f47b  d5 07         cmp $07,x
$1f:f47d  30 18         bmi $f497
$1f:f47f  2d 9f 28      and $289f
$1f:f482  07 fd         ora [$fd]
$1f:f484  f6 00         inc $00,x
$1f:f486  2f d5 01 02   and $0201d5
$1f:f48a  ae 28 0f      ldx $0f28
$1f:f48d  fd f6 08      sbc $08f6,x
$1f:f490  2f d5 14 02   and $0214d5
$1f:f494  3f d5 07 68   and $6807d5,x
$1f:f498  e0 90 05      cpx #$0590
$1f:f49b  3f c3 07 2f   and $2f07c3,x
$1f:f49f  b3 3f         lda ($3f,s),y
$1f:f4a1  c3 04         cmp $04,s
$1f:f4a3  f5 00         sbc $00,x
$1f:f4a5  02 d4         cop #$d4
$1f:f4a7  70 fd         bvs $f4a6
$1f:f4a9  f5 01         sbc $01,x
$1f:f4ab  02 cf         cop #$cf
$1f:f4ad  dd d0 01      cmp $01d0,x
$1f:f4b0  bc d4 71      ldy $71d4,x
$1f:f4b3  2f 03 3f 5c   and $5c3f03
$1f:f4b7  0b            phd
$1f:f4b8  3f f5 09 3d   and $3d09f5,x
$1f:f4bc  3d 0b 47      and $470b,x
$1f:f4bf  d0 88         bne $f449
$1f:f4c1  e4 30         cpx $30
$1f:f4c3  f0 03         beq $f4c8
$1f:f4c5  8f ff 5e e4   sta $e45eff
$1f:f4c9  54 f0 0b      mvn $0b,$f0
$1f:f4cc  ba            tsx
$1f:f4cd  56 7a         lsr $7a,x
$1f:f4cf  52 6e         eor ($6e)
$1f:f4d1  54 02 ba      mvn $ba,$02
$1f:f4d4  54 da 52      mvn $52,$da
$1f:f4d7  e4 68         cpx $68
$1f:f4d9  f0 15         beq $f4f0
$1f:f4db  ba            tsx
$1f:f4dc  64 7a         stz $7a
$1f:f4de  60            rts
$1f:f4df  da            phx
$1f:f4e0  60            rts
$1f:f4e1  ba            tsx
$1f:f4e2  66 7a         ror $7a
$1f:f4e4  62 6e 68      per $5d55
$1f:f4e7  06 ba         asl $ba
$1f:f4e9  68            pla
$1f:f4ea  da            phx
$1f:f4eb  60            rts
$1f:f4ec  eb            xba
$1f:f4ed  6a            ror a
$1f:f4ee  da            phx
$1f:f4ef  62 e4 5a      per $4fd6
$1f:f4f2  f0 0e         beq $f502
$1f:f4f4  ba            tsx
$1f:f4f5  5c 7a 58 6e   jml $6e587a
$1f:f4f9  5a            phy
$1f:f4fa  02 ba         cop #$ba
$1f:f4fc  5a            phy
$1f:f4fd  da            phx
$1f:f4fe  58            cli
$1f:f4ff  8f ff 5e cd   sta $cd5eff
$1f:f503  00 8f         brk #$8f
$1f:f505  01 47         ora ($47,x)
$1f:f507  f4 d5 f0      pea $f0d5
$1f:f50a  03 3f         ora $3f,s
$1f:f50c  a5 0a         lda $0a
$1f:f50e  3d 3d 0b      and $0b3d,x
$1f:f511  47 d0         eor [$d0]
$1f:f513  f3 6f         sbc ($6f,s),y
$1f:f515  1c fd f6      trb $f6fd
$1f:f518  95 09         sta $09,x
$1f:f51a  2d f6 94      and $94f6
$1f:f51d  09 2d         ora #$2d
$1f:f51f  dd 5c fd      cmp $fd5c,x
$1f:f522  f6 2a         inc $2a,x
$1f:f524  0a            asl a
$1f:f525  f0 08         beq $f52f
$1f:f527  e7 d4         sbc [$d4]
$1f:f529  bb            tyx
$1f:f52a  d4 d0         pei ($d0)
$1f:f52c  02 bb         cop #$bb
$1f:f52e  d5 fd         cmp $fd,x
$1f:f530  6f d5 15 02   adc $0215d5
$1f:f534  eb            xba
$1f:f535  34 d0         bit $d0,x
$1f:f537  0f fd 10 06   ora $0610fd
$1f:f53b  80 a8         bra $f4e5
$1f:f53d  ca            dex
$1f:f53e  60            rts
$1f:f53f  84 5f         sty $5f
$1f:f541  60            rts
$1f:f542  85 ff         sta $ff
$1f:f544  0f 2f 09 fd   ora $fd092f
$1f:f548  10 06         bpl $f550
$1f:f54a  80 a8         bra $f4f4
$1f:f54c  ca            dex
$1f:f54d  60            rts
$1f:f54e  84 39         sty $39
$1f:f550  8d 06 cf      sta $cf06
$1f:f553  da            phx
$1f:f554  14 60         trb $60
$1f:f556  98            tya
$1f:f557  00 14         brk #$14
$1f:f559  98            tya
$1f:f55a  2e 15 e4      rol $e415
$1f:f55d  1a            inc a
$1f:f55e  24 47         bit $47
$1f:f560  d0 38         bne $f59a
$1f:f562  4d f5 8c      eor $8cf5
$1f:f565  0d 08 04      ora $0408
$1f:f568  5d 8d 00      eor $008d,x
$1f:f56b  f7 14         sbc [$14],y
$1f:f56d  10 0e         bpl $f57d
$1f:f56f  28            plp
$1f:f570  1f 38 20 48   ora $482038,x
$1f:f574  0e 48 00      asl $0048
$1f:f577  09 47         ora #$47
$1f:f579  49 dd         eor #$dd
$1f:f57b  2f 07 e4 47   and $47e407
$1f:f57f  4e 49 00      lsr $0049
$1f:f582  f7 14         sbc [$14],y
$1f:f584  d8            cld
$1f:f585  f2 c4         sbc ($c4)
$1f:f587  f3 3d         sbc ($3d,s),y
$1f:f589  fc ad 04      jsr ($04ad,x)
$1f:f58c  d0 f4         bne $f582
$1f:f58e  ce f7 14      dec $14f7
$1f:f591  d5 29         cmp $29,x
$1f:f593  02 fc         cop #$fc
$1f:f595  f7 14         sbc [$14],y
$1f:f597  d5 28         cmp $28,x
$1f:f599  02 6f         cop #$6f
$1f:f59b  d5 69         cmp $69,x
$1f:f59d  03 28         ora $28,s
$1f:f59f  1f d5 41 03   ora $0341d5,x
$1f:f5a3  e8            inx
$1f:f5a4  00 d5         brk #$d5
$1f:f5a6  40            rti
$1f:f5a7  03 6f         ora $6f,s
$1f:f5a9  d4 85         pei ($85)
$1f:f5ab  2d 3f d5      and $d53f
$1f:f5ae  07 d5         ora [$d5]
$1f:f5b0  68            pla
$1f:f5b1  03 80         ora $80,s
$1f:f5b3  b5 41         lda $41,x
$1f:f5b5  03 ce         ora $ce,s
$1f:f5b7  3f 38 0a d5   and $d50a38,x
$1f:f5bb  54 03 dd      mvn $dd,$03
$1f:f5be  d5 55         cmp $55,x
$1f:f5c0  03 6f         ora $6f,s
$1f:f5c2  d5 a0         cmp $a0,x
$1f:f5c4  02 3f         cop #$3f
$1f:f5c6  d5 07         cmp $07,x
$1f:f5c8  d5 8d         cmp $8d,x
$1f:f5ca  02 3f         cop #$3f
$1f:f5cc  d5 07         cmp $07,x
$1f:f5ce  d4 ad         pei ($ad)
$1f:f5d0  d5 b5         cmp $b5,x
$1f:f5d2  02 e8         cop #$e8
$1f:f5d4  00 d5         brk #$d5
$1f:f5d6  a1 02         lda ($02,x)
$1f:f5d8  6f d5 a1 02   adc $02a1d5
$1f:f5dc  2d 8d 00      and $008d
$1f:f5df  f4 ad ce      pea $cead
$1f:f5e2  9e f8 44      stz $44f8,x
$1f:f5e5  d5 b4         cmp $b4,x
$1f:f5e7  02 6f         cop #$6f
$1f:f5e9  dd 80 a8      cmp $a880,x
$1f:f5ec  00 fd         brk #$fd
$1f:f5ee  e8            inx
$1f:f5ef  00 da         brk #$da
$1f:f5f1  58            cli
$1f:f5f2  6f c4 5a 3f   adc $3f5ac4
$1f:f5f6  d5 07         cmp $07,x
$1f:f5f8  c4 5b         cpy $5b
$1f:f5fa  80 a4         bra $f5a0
$1f:f5fc  59 f8 5a      eor $5af8,y
$1f:f5ff  3f 38 0a da   and $da0a38,x
$1f:f603  5c 6f e4 34   jml $34e46f
$1f:f607  d0 04         bne $f60d
$1f:f609  e8            inx
$1f:f60a  00 da         brk #$da
$1f:f60c  52 6f         eor ($6f)
$1f:f60e  c4 54         cpy $54
$1f:f610  3f d5 07 c4   and $c407d5,x
$1f:f614  55 80         eor $80,x
$1f:f616  a4 53         ldy $53
$1f:f618  f8            sed
$1f:f619  54 3f 38      mvn $38,$3f
$1f:f61c  0a            asl a
$1f:f61d  da            phx
$1f:f61e  56 6f         lsr $6f,x
$1f:f620  c4 50         cpy $50
$1f:f622  6f d5 f0 02   adc $02f0d5
$1f:f626  6f d5 dc 02   adc $02dcd5
$1f:f62a  3f d5 07 d5   and $d507d5,x
$1f:f62e  c9 02         cmp #$02
$1f:f630  3f d5 07 d4   and $d407d5,x
$1f:f634  c1 6f         cmp ($6f,x)
$1f:f636  e8            inx
$1f:f637  01 2f         ora ($2f,x)
$1f:f639  02 e8         cop #$e8
$1f:f63b  00 d5         brk #$d5
$1f:f63d  78            sei
$1f:f63e  02 dd         cop #$dd
$1f:f640  d5 65         cmp $65,x
$1f:f642  02 3f         cop #$3f
$1f:f644  d5 07         cmp $07,x
$1f:f646  d5 64         cmp $64,x
$1f:f648  02 3f         cop #$3f
$1f:f64a  d5 07         cmp $07,x
$1f:f64c  d5 79         cmp $79,x
$1f:f64e  02 6f         cop #$6f
$1f:f650  d5 64         cmp $64,x
$1f:f652  02 6f         cop #$6f
$1f:f654  d5 05         cmp $05,x
$1f:f656  03 e8         ora $e8,s
$1f:f658  00 d5         brk #$d5
$1f:f65a  04 03         tsb $03
$1f:f65c  6f d4 84 2d   adc $2d84d4
$1f:f660  3f d5 07 d5   and $d507d5,x
$1f:f664  2c 03 80      bit $8003
$1f:f667  b5 05         lda $05,x
$1f:f669  03 ce         ora $ce,s
$1f:f66b  3f 38 0a d5   and $d50a38,x
$1f:f66f  18            clc
$1f:f670  03 dd         ora $dd,s
$1f:f672  d5 19         cmp $19,x
$1f:f674  03 6f         ora $6f,s
$1f:f676  d5 a5         cmp $a5,x
$1f:f678  03 6f         ora $6f,s
$1f:f67a  d5 50         cmp $50,x
$1f:f67c  02 3f         cop #$3f
$1f:f67e  d5 07         cmp $07,x
$1f:f680  d5 51         cmp $51,x
$1f:f682  02 3f         cop #$3f
$1f:f684  d5 07         cmp $07,x
$1f:f686  d5 b8         cmp $b8,x
$1f:f688  03 f4         ora $f4,s
$1f:f68a  d4 d5         pei ($d5)
$1f:f68c  3c 02 f4      bit $f402,x
$1f:f68f  d5 d5         cmp $d5,x
$1f:f691  3d 02 f5      and $f502,x
$1f:f694  50 02         bvc $f698
$1f:f696  d4 d4         pei ($d4)
$1f:f698  f5 51         sbc $51,x
$1f:f69a  02 d4         cop #$d4
$1f:f69c  d5 6f         cmp $6f,x
$1f:f69e  c4 4a         cpy $4a
$1f:f6a0  3f d5 07 e8   and $e807d5,x
$1f:f6a4  00 da         brk #$da
$1f:f6a6  60            rts
$1f:f6a7  3f d5 07 e8   and $e807d5,x
$1f:f6ab  00 da         brk #$da
$1f:f6ad  62 b2 48      per $3f62
$1f:f6b0  6f c4 68 3f   adc $3f68c4
$1f:f6b4  d5 07         cmp $07,x
$1f:f6b6  c4 69         cpy $69
$1f:f6b8  80 a4         bra $f65e
$1f:f6ba  61 f8         adc ($f8,x)
$1f:f6bc  68            pla
$1f:f6bd  3f 38 0a da   and $da0a38,x
$1f:f6c1  64 3f         stz $3f
$1f:f6c3  d5 07         cmp $07,x
$1f:f6c5  c4 6a         cpy $6a
$1f:f6c7  80 a4         bra $f66d
$1f:f6c9  63 f8         adc $f8,s
$1f:f6cb  68            pla
$1f:f6cc  3f 38 0a da   and $da0a38,x
$1f:f6d0  66 6f         ror $6f
$1f:f6d2  da            phx
$1f:f6d3  60            rts
$1f:f6d4  da            phx
$1f:f6d5  62 a2 48      per $3f7a
$1f:f6d8  6f 3f a9 09   adc $09a93f
$1f:f6dc  3f d5 07 c4   and $c407d5,x
$1f:f6e0  4e 3f d5      lsr $d53f
$1f:f6e3  07 8d         ora [$8d]
$1f:f6e5  08            php
$1f:f6e6  cf 5d 8d 0f   cmp $0f8d5d
$1f:f6ea  f5 3e         sbc $3e,x
$1f:f6ec  0d 3f b8      ora $b83f
$1f:f6ef  05 3d         ora $3d
$1f:f6f1  dd 60 88      cmp $8860,x
$1f:f6f4  10 fd         bpl $f6f3
$1f:f6f6  10 f2         bpl $f6ea
$1f:f6f8  f8            sed
$1f:f6f9  44 6f c4      mvp $c4,$6f
$1f:f6fc  4d 8d 7d      eor $7d8d
$1f:f6ff  cb            wai
$1f:f700  f2 e4         sbc ($e4)
$1f:f702  f3 64         sbc ($64,s),y
$1f:f704  4d f0 29      eor $29f0
$1f:f707  28            plp
$1f:f708  0f 48 ff f3   ora $f3ff48
$1f:f70c  4c 03 60      jmp $6003
$1f:f70f  84 4c         sty $4c
$1f:f711  c4 4c         cpy $4c
$1f:f713  8d 04 f6      sta $f604
$1f:f716  5d 0d c4      eor $c40d,x
$1f:f719  f2 e8         sbc ($e8)
$1f:f71b  00 c4         brk #$c4
$1f:f71d  f3 fe         sbc ($fe,s),y
$1f:f71f  f5 e4         sbc $e4,x
$1f:f721  48            pha
$1f:f722  08            php
$1f:f723  20 8d 6c      jsr $6c8d
$1f:f726  3f b8 05 e4   and $e405b8,x
$1f:f72a  4d 8d 7d      eor $7d8d
$1f:f72d  3f b8 05 1c   and $1c05b8,x
$1f:f731  1c 1c 48      trb $481c
$1f:f734  ff 80 88 ff   sbc $ff8880,x
$1f:f738  8d 6d 5f      sta $5f6d
$1f:f73b  b8            clv
$1f:f73c  05 eb         ora $eb
$1f:f73e  34 d0         bit $d0,x
$1f:f740  03 c4         ora $c4,s
$1f:f742  5f 6f c4 39   eor $39c46f,x
$1f:f746  6f f4 98 d0   adc $d098f4
$1f:f74a  33 e7         and ($e7,s),y
$1f:f74c  d4 68         pei ($68)
$1f:f74e  f9 d0 2d      sbc $2dd0,y
$1f:f751  3f d7 07 3f   and $3f07d7,x
$1f:f755  d5 07         cmp $07,x
$1f:f757  d4 99         pei ($99)
$1f:f759  3f d5 07 d4   and $d407d5,x
$1f:f75d  98            tya
$1f:f75e  3f d5 07 60   and $6007d5,x
$1f:f762  84 50         sty $50
$1f:f764  95 f0         sta $f0,x
$1f:f766  02 28         cop #$28
$1f:f768  7f d5 a4 03   adc $03a4d5,x
$1f:f76c  80 b5         bra $f723
$1f:f76e  7d 03 fb      adc $fb03,x
$1f:f771  98            tya
$1f:f772  6d ce 3f      adc $3fce
$1f:f775  38            sec
$1f:f776  0a            asl a
$1f:f777  d5 90         cmp $90,x
$1f:f779  03 dd         ora $dd,s
$1f:f77b  d5 91         cmp $91,x
$1f:f77d  03 6f         ora $6f,s
$1f:f77f  f5 7d         sbc $7d,x
$1f:f781  03 c4         ora $c4,s
$1f:f783  11 f5         ora ($f5),y
$1f:f785  7c 03 c4      jmp ($c403,x)
$1f:f788  10 6f         bpl $f7f9
$1f:f78a  ed 6b 12      sbc $126b
$1f:f78d  10 03         bpl $f792
$1f:f78f  48            pha
$1f:f790  ff bc 8d 00   sbc $008dbc,x
$1f:f794  9e 2d e8      stz $e82d,x
$1f:f797  00 9e         brk #$9e
$1f:f799  ee f8 44      inc $44f8
$1f:f79c  f3 12         sbc ($12,s),y
$1f:f79e  06 da         asl $da
$1f:f7a0  14 ba         trb $ba
$1f:f7a2  0e 9a 14      asl $149a
$1f:f7a5  6f df 07 49   adc $4907df
$1f:f7a9  08            php
$1f:f7aa  57 08         eor [$08],y
$1f:f7ac  70 08         bvs $f7b6
$1f:f7ae  7c 08 97      jmp ($9708,x)
$1f:f7b1  08            php
$1f:f7b2  a1 08         lda ($08,x)
$1f:f7b4  b3 08         lda ($08,s),y
$1f:f7b6  bc 08 ce      ldy $ce08,x
$1f:f7b9  08            php
$1f:f7ba  d1 08         cmp ($08),y
$1f:f7bc  d5 08         cmp $08,x
$1f:f7be  e1 08         sbc ($08,x)
$1f:f7c0  02 09         cop #$09
$1f:f7c2  0b            phd
$1f:f7c3  09 28         ora #$28
$1f:f7c5  09 87         ora #$87
$1f:f7c7  08            php
$1f:f7c8  e4 08         cpx $08
$1f:f7ca  e8            inx
$1f:f7cb  08            php
$1f:f7cc  fe 08 24      inc $2408,x
$1f:f7cf  09 4c         ora #$4c
$1f:f7d1  09 80         ora #$80
$1f:f7d3  09 87         ora #$87
$1f:f7d5  09 5f         ora #$5f
$1f:f7d7  09 05         ora #$05
$1f:f7d9  0a            asl a
$1f:f7da  eb            xba
$1f:f7db  09 01         ora #$01
$1f:f7dd  01 02         ora ($02,x)
$1f:f7df  03 00         ora $00,s
$1f:f7e1  01 02         ora ($02,x)
$1f:f7e3  01 02         ora ($02,x)
$1f:f7e5  01 01         ora ($01,x)
$1f:f7e7  03 00         ora $00,s
$1f:f7e9  01 02         ora ($02,x)
$1f:f7eb  03 01         ora $01,s
$1f:f7ed  03 03         ora $03,s
$1f:f7ef  00 01         brk #$01
$1f:f7f1  03 00         ora $00,s
$1f:f7f3  03 03         ora $03,s
$1f:f7f5  03 01         ora $01,s
$1f:f7f7  f4 84 f0      pea $f084
$1f:f7fa  09 e8         ora #$e8
$1f:f7fc  04 8d         tsb $8d
$1f:f7fe  03 9b         ora $9b,s
$1f:f800  84 3f         sty $3f
$1f:f802  38            sec
$1f:f803  0b            phd
$1f:f804  fb            xce
$1f:f805  c1 f0         cmp ($f0,x)
$1f:f807  23 f5         and $f5,s
$1f:f809  dc 02 de      jml [$de02]
$1f:f80c  c0 1b 09      cpy #$091b
$1f:f80f  47 5e         eor [$5e]
$1f:f811  f5 c8         sbc $c8,x
$1f:f813  02 10         cop #$10
$1f:f815  07 fc         ora [$fc]
$1f:f817  d0 04         bne $f81d
$1f:f819  e8            inx
$1f:f81a  80 2f         bra $f84b
$1f:f81c  04 60         tsb $60
$1f:f81e  95 c9         sta $c9,x
$1f:f820  02 d5         cop #$d5
$1f:f822  c8            iny
$1f:f823  02 3f         cop #$3f
$1f:f825  c0 0c 2f      cpy #$2f0c
$1f:f828  07 bb         ora [$bb]
$1f:f82a  c0 e8 ff      cpy #$ffe8
$1f:f82d  3f cb 0c f4   and $f40ccb,x
$1f:f831  85 f0         sta $f0
$1f:f833  09 e8         ora #$e8
$1f:f835  40            rti
$1f:f836  8d 03 9b      sta $9b03
$1f:f839  85 3f         sta $3f
$1f:f83b  38            sec
$1f:f83c  0b            phd
$1f:f83d  e4 47         cpx $47
$1f:f83f  24 5e         bit $5e
$1f:f841  f0 46         beq $f889
$1f:f843  f5 41         sbc $41,x
$1f:f845  03 fd         ora $fd,s
$1f:f847  f5 40         sbc $40,x
$1f:f849  03 da         ora $da,s
$1f:f84b  10 f5         bpl $f842
$1f:f84d  8c 0d c4      sty $c40d
$1f:f850  12 eb         ora ($eb)
$1f:f852  11 f6         ora ($f6),y
$1f:f854  ea            nop
$1f:f855  0c 80 b6      tsb $b680
$1f:f858  e9 0c         sbc #$0c
$1f:f85a  eb            xba
$1f:f85b  10 cf         bpl $f82c
$1f:f85d  dd eb 11      cmp $11eb,x
$1f:f860  60            rts
$1f:f861  96 e9         stx $e9,y
$1f:f863  0c fd f5      tsb $f5fd
$1f:f866  2d 03 cf      and $cf03
$1f:f869  f5 69         sbc $69,x
$1f:f86b  03 1c         ora $1c,s
$1f:f86d  13 12         ora ($12,s),y
$1f:f86f  01 1c         ora ($1c,x)
$1f:f871  dd 90 03      cmp $0390,x
$1f:f874  48            pha
$1f:f875  ff bc eb 12   sbc $12ebbc,x
$1f:f879  3f b0 05 8d   and $8d05b0,x
$1f:f87d  14 e8         trb $e8
$1f:f87f  00 9a         brk #$9a
$1f:f881  10 da         bpl $f85d
$1f:f883  10 ab         bpl $f830
$1f:f885  12 33         ora ($33)
$1f:f887  12 c8         ora ($c8)
$1f:f889  6f 09 47 5e   adc $5e4709
$1f:f88d  da            phx
$1f:f88e  14 da         trb $da
$1f:f890  16 4d         asl $4d,x
$1f:f892  ee 60 d0      inc $d060
$1f:f895  0a            asl a
$1f:f896  98            tya
$1f:f897  27 16         and [$16]
$1f:f899  e8            inx
$1f:f89a  00 d7         brk #$d7
$1f:f89c  14 fc         trb $fc
$1f:f89e  2f 09 98 14   and $149809
$1f:f8a2  16 3f         asl $3f,x
$1f:f8a4  55 0b         eor $0b,x
$1f:f8a6  fc f7 14      jsr ($14f7,x)
$1f:f8a9  97 16         sta [$16],y
$1f:f8ab  d7 14         cmp [$14],y
$1f:f8ad  6f f4 71 f0   adc $f071f4
$1f:f8b1  64 9b         stz $9b
$1f:f8b3  71 f0         adc ($f0),y
$1f:f8b5  05 e8         ora $e8
$1f:f8b7  02 de         cop #$de
$1f:f8b9  70 5b         bvs $f916
$1f:f8bb  f5 b8         sbc $b8,x
$1f:f8bd  03 c4         ora $c4,s
$1f:f8bf  17 f4         ora [$f4],y
$1f:f8c1  d4 fb         pei ($fb)
$1f:f8c3  d5 da         cmp $da,x
$1f:f8c5  14 8d         trb $8d
$1f:f8c7  00 f7         brk #$f7
$1f:f8c9  14 f0         trb $f0
$1f:f8cb  1c 30 05      trb $0530
$1f:f8ce  fc f7 14      jsr ($14f7,x)
$1f:f8d1  10 fb         bpl $f8ce
$1f:f8d3  68            pla
$1f:f8d4  c8            iny
$1f:f8d5  f0 3f         beq $f916
$1f:f8d7  68            pla
$1f:f8d8  ef f0 29 68   sbc $6829f0
$1f:f8dc  e0 90 30      cpx #$3090
$1f:f8df  6d fd ae      adc $aefd
$1f:f8e2  96 aa         stx $aa,y
$1f:f8e4  09 fd         ora #$fd
$1f:f8e6  2f e0 e4 17   and $17e4e0
$1f:f8ea  f0 23         beq $f90f
$1f:f8ec  8b            phb
$1f:f8ed  17 d0         ora [$d0],y
$1f:f8ef  0a            asl a
$1f:f8f0  f5 3d         sbc $3d,x
$1f:f8f2  02 2d         cop #$2d
$1f:f8f4  f5 3c         sbc $3c,x
$1f:f8f6  02 ee         cop #$ee
$1f:f8f8  2f ca f5 51   and $51f5ca
$1f:f8fc  02 2d         cop #$2d
$1f:f8fe  f5 50         sbc $50,x
$1f:f900  02 ee         cop #$ee
$1f:f902  2f c0 fc f7   and $f7fcc0
$1f:f906  14 2d         trb $2d
$1f:f908  fc f7 14      jsr ($14f7,x)
$1f:f90b  fd ae 2f      sbc $2fae,x
$1f:f90e  b5 e4         lda $e4,x
$1f:f910  47 8d         eor [$8d]
$1f:f912  5c 3f b0 05   jml $05b03f
$1f:f916  f2 13         sbc ($13)
$1f:f918  f4 98 f0      pea $f098
$1f:f91b  13 f4         ora ($f4,s),y
$1f:f91d  99 f0 04      sta $04f0,y
$1f:f920  9b            txy
$1f:f921  99 2f 0b      sta $0b2f,y
$1f:f924  e2 13         sep #$13
$1f:f926  e8            inx
$1f:f927  7c 8d 03      jmp ($038d,x)
$1f:f92a  9b            txy
$1f:f92b  98            tya
$1f:f92c  3f 3b 0b 3f   and $3f0b3b,x
$1f:f930  2d 0a f4      and $f40a
$1f:f933  ad f0 4c      lda $4cf0
$1f:f936  f5 a0         sbc $a0,x
$1f:f938  02 de         cop #$de
$1f:f93a  ac 44 f5      ldy $f544
$1f:f93d  00 01         brk #$01
$1f:f93f  75 a1         adc $a1,x
$1f:f941  02 d0         cop #$d0
$1f:f943  05 f5         ora $f5
$1f:f945  b5 02         lda $02,x
$1f:f947  2f 0d 40 bb   and $bb400d
$1f:f94b  00 20         brk #$20
$1f:f94d  fd f0 02      sbc $02f0,x
$1f:f950  f4 ad 60      pea $60ad
$1f:f953  95 b4         sta $b4,x
$1f:f955  02 d4         cop #$d4
$1f:f957  ad f5 8c      lda $8cf5
$1f:f95a  02 60         cop #$60
$1f:f95c  95 8d         sta $8d,x
$1f:f95e  02 d5         cop #$d5
$1f:f960  8c 02 c4      sty $c402
$1f:f963  12 1c         ora ($1c)
$1f:f965  1c 90 02      trb $0290
$1f:f968  48            pha
$1f:f969  ff fd f4 ad   sbc $adf4fd,x
$1f:f96d  68            pla
$1f:f96e  f1 90         sbc ($90),y
$1f:f970  05 28         ora $28
$1f:f972  0f cf 2f 04   ora $042fcf
$1f:f976  cf dd 8d 00   cmp $008ddd
$1f:f97a  3f ab 0c 5f   and $5f0cab,x
$1f:f97e  2d 05 bb      and $bb05
$1f:f981  ac e3 13      ldy $13e3
$1f:f984  f8            sed
$1f:f985  6f f2 13 f4   adc $f413f2
$1f:f989  c1 f0         cmp ($f0,x)
$1f:f98b  09 f5         ora #$f5
$1f:f98d  dc 02 de      jml [$de02]
$1f:f990  c0 03         cpy #$03
$1f:f992  3f b3 0c f5   and $f50cb3,x
$1f:f996  41 03         eor ($03,x)
$1f:f998  fd f5 40      sbc $40f5,x
$1f:f99b  03 da         ora $da,s
$1f:f99d  10 f4         bpl $f993
$1f:f99f  85 f0         sta $f0
$1f:f9a1  0a            asl a
$1f:f9a2  f5 55         sbc $55,x
$1f:f9a4  03 fd         ora $fd,s
$1f:f9a6  f5 54         sbc $54,x
$1f:f9a8  03 3f         ora $3f,s
$1f:f9aa  95 0c         sta $0c,x
$1f:f9ac  f3 13         sbc ($13,s),y
$1f:f9ae  03 3f         ora $3f,s
$1f:f9b0  fa            plx
$1f:f9b1  0a            asl a
$1f:f9b2  f2 13         sbc ($13)
$1f:f9b4  f5 7d         sbc $7d,x
$1f:f9b6  03 fd         ora $fd,s
$1f:f9b8  f5 7c         sbc $7c,x
$1f:f9ba  03 da         ora $da,s
$1f:f9bc  10 f4         bpl $f9b2
$1f:f9be  98            tya
$1f:f9bf  f0 0e         beq $f9cf
$1f:f9c1  f4 99 d0      pea $d099
$1f:f9c4  0a            asl a
$1f:f9c5  f5 91         sbc $91,x
$1f:f9c7  03 fd         ora $fd,s
$1f:f9c9  f5 90         sbc $90,x
$1f:f9cb  03 3f         ora $3f,s
$1f:f9cd  95 0c         sta $0c,x
$1f:f9cf  f4 ad f0      pea $f0ad
$1f:f9d2  af f5 a0 02   lda $02a0f5
$1f:f9d6  de ac a9      dec $a9ac,x
$1f:f9d9  eb            xba
$1f:f9da  51 f5         eor ($f5),y
$1f:f9dc  8d 02 cf      sta $cf02
$1f:f9df  dd 60 95      cmp $9560,x
$1f:f9e2  8c 02 5f      sty $5f02
$1f:f9e5  10 0c         bpl $f9f3
$1f:f9e7  e2 13         sep #$13
$1f:f9e9  cb            wai
$1f:f9ea  12 3f         ora ($3f)
$1f:f9ec  4a            lsr a
$1f:f9ed  0a            asl a
$1f:f9ee  6d eb 51      adc $51eb
$1f:f9f1  cf cb 14 8f   cmp $8f14cb
$1f:f9f5  00 15         brk #$15
$1f:f9f7  eb            xba
$1f:f9f8  51 ae         eor ($ae),y
$1f:f9fa  cf 7a 14 3f   cmp $3f147a
$1f:f9fe  4a            lsr a
$1f:f9ff  0a            asl a
$1f:fa00  7a            ply
$1f:fa01  10 da         bpl $f9dd
$1f:fa03  10 6f         bpl $fa74
$1f:fa05  e2 13         sep #$13
$1f:fa07  eb            xba
$1f:fa08  51 f5         eor ($f5),y
$1f:fa0a  c9 02         cmp #$02
$1f:fa0c  cf dd 60 95   cmp $9560dd
$1f:fa10  c8            iny
$1f:fa11  02 1c         cop #$1c
$1f:fa13  90 02         bcc $fa17
$1f:fa15  48            pha
$1f:fa16  ff fb c1 cf   sbc $cfc1fb,x
$1f:fa1a  dd 48 ff      cmp $ff48,x
$1f:fa1d  eb            xba
$1f:fa1e  34 d0         bit $d0,x
$1f:fa20  03 eb         ora $eb,s
$1f:fa22  59 cf f5      eor $f5cf,y
$1f:fa25  14 02         trb $02
$1f:fa27  cf f5 05 03   cmp $0305f5
$1f:fa2b  cf e4 30 f0   cmp $f030e4
$1f:fa2f  04 e4         tsb $e4
$1f:fa31  31 1c         and ($1c),y
$1f:fa33  cf dd cf dd   cmp $ddcfdd
$1f:fa37  d5 2d         cmp $2d,x
$1f:fa39  03 6f         ora $6f,s
$1f:fa3b  00 01         brk #$01
$1f:fa3d  03 07         ora $07,s
$1f:fa3f  0d 15 1e      ora $1e15
$1f:fa42  29 34         and #$34
$1f:fa44  42 51         wdm #$51
$1f:fa46  5e 67 6e      lsr $6e67,x
$1f:fa49  73 77         adc ($77,s),y
$1f:fa4b  7a            ply
$1f:fa4c  7c 7d 7e      jmp ($7e7d,x)
$1f:fa4f  7f 0a 0b 0c   adc $0c0b0a,x
$1f:fa53  0d 0e 0f      ora $0f0e
$1f:fa56  10 11         bpl $fa69
$1f:fa58  11 12         ora ($12),y
$1f:fa5a  12 13         ora ($13)
$1f:fa5c  13 13         ora ($13,s),y
$1f:fa5e  14 14         trb $14
$1f:fa60  14 14         trb $14
$1f:fa62  14 13         trb $13
$1f:fa64  13 13         ora ($13,s),y
$1f:fa66  12 12         ora ($12)
$1f:fa68  11 11         ora ($11),y
$1f:fa6a  10 0f         bpl $fa7b
$1f:fa6c  0e 0d 0c      asl $0c0d
$1f:fa6f  0b            phd
$1f:fa70  0a            asl a
$1f:fa71  09 08         ora #$08
$1f:fa73  07 06         ora [$06]
$1f:fa75  05 04         ora $04
$1f:fa77  03 03         ora $03,s
$1f:fa79  02 02         cop #$02
$1f:fa7b  01 01         ora ($01,x)
$1f:fa7d  01 00         ora ($00,x)
$1f:fa7f  00 00         brk #$00
$1f:fa81  00 00         brk #$00
$1f:fa83  01 01         ora ($01,x)
$1f:fa85  01 02         ora ($02,x)
$1f:fa87  02 03         cop #$03
$1f:fa89  03 04         ora $04,s
$1f:fa8b  05 06         ora $06
$1f:fa8d  07 08         ora [$08]
$1f:fa8f  09 7f         ora #$7f
$1f:fa91  00 00         brk #$00
$1f:fa93  00 00         brk #$00
$1f:fa95  00 00         brk #$00
$1f:fa97  00 58         brk #$58
$1f:fa99  bf db f0 fe   lda $fef0db,x
$1f:fa9d  07 0c         ora [$0c]
$1f:fa9f  0c 0c 21      tsb $210c
$1f:faa2  2b            pld
$1f:faa3  2b            pld
$1f:faa4  13 fe         ora ($fe,s),y
$1f:faa6  f3 f9         sbc ($f9,s),y
$1f:faa8  34 33         bit $33,x
$1f:faaa  00 d9         brk #$d9
$1f:faac  e5 01         sbc $01
$1f:faae  fc eb 2c      jsr ($2ceb,x)
$1f:fab1  3c 0d 4d      bit $4d0d,x
$1f:fab4  6c 4c 5c      jmp ($5c4c)
$1f:fab7  3d 2d 5c      and $5c2d,x
$1f:faba  61 63         adc ($63,x)
$1f:fabc  4e 38 48      lsr $4838
$1f:fabf  45 0e         eor $0e
$1f:fac1  49 4b         eor #$4b
$1f:fac3  46 5f         lsr $5f
$1f:fac5  08            php
$1f:fac6  de 08 65      dec $6508,x
$1f:fac9  09 f4         ora #$f4
$1f:facb  09 8c         ora #$8c
$1f:facd  0a            asl a
$1f:face  2c 0b d6      bit $d60b
$1f:fad1  0b            phd
$1f:fad2  8b            phb
$1f:fad3  0c 4a 0d      tsb $0d4a
$1f:fad6  14 0e         trb $0e
$1f:fad8  ea            nop
$1f:fad9  0e cd 0f      asl $0fcd
$1f:fadc  be 10 00      ldx $0010,y
$1f:fadf  00 10         brk #$10
$1f:fae1  00 20         brk #$20
$1f:fae3  00 30         brk #$30
$1f:fae5  00 40         brk #$40
$1f:fae7  00 50         brk #$50
$1f:fae9  00 60         brk #$60
$1f:faeb  00 70         brk #$70
$1f:faed  00 60         brk #$60
$1f:faef  00 70         brk #$70
$1f:faf1  00 fa         brk #$fa
$1f:faf3  1a            inc a
$1f:faf4  37 38         and [$38],y
$1f:faf6  3f 1a 8f ff   and $ff8f1a,x
$1f:fafa  34 8f         bit $8f,x
$1f:fafc  00 5e         brk #$5e
$1f:fafe  8f 40 47 cd   sta $cd4740
$1f:fb02  10 e4         bpl $fae8
$1f:fb04  f6 f0         inc $f0,x
$1f:fb06  39 30 04      and $0430,y
$1f:fb09  eb            xba
$1f:fb0a  35 d0         and $d0,x
$1f:fb0c  33 2d         and ($2d,s),y
$1f:fb0e  0d 09 47      ora $4709
$1f:fb11  46 09         lsr $09
$1f:fb13  47 37         eor [$37]
$1f:fb15  09 47         ora #$47
$1f:fb17  36 3f         rol $3f,x
$1f:fb19  14 0e         trb $0e
$1f:fb1b  8e 10 21      stx $2110
$1f:fb1e  3f 79 0e 8f   and $8f0e79,x
$1f:fb22  ff 35 8f 00   sbc $008f35,x
$1f:fb26  3f 8f 80 47   and $47808f,x
$1f:fb2a  cd 12 ae      cmp $ae12
$1f:fb2d  09 47         ora #$47
$1f:fb2f  46 09         lsr $09
$1f:fb31  47 37         eor [$37]
$1f:fb33  09 47         ora #$47
$1f:fb35  36 3f         rol $3f,x
$1f:fb37  14 0e         trb $0e
$1f:fb39  e8            inx
$1f:fb3a  03 d4         ora $d4,s
$1f:fb3c  70 2f         bvs $fb6d
$1f:fb3e  1d ae 3f      ora $3fae,x
$1f:fb41  79 0e 8f      adc $8f0e,y
$1f:fb44  80 47         bra $fb8d
$1f:fb46  cd 12 e4      cmp $e412
$1f:fb49  35 d0         and $d0,x
$1f:fb4b  10 e4         bpl $fb31
$1f:fb4d  f7 f0         sbc [$f0],y
$1f:fb4f  0c 09 47      tsb $4709
$1f:fb52  46 09         lsr $09
$1f:fb54  47 37         eor [$37]
$1f:fb56  09 47         ora #$47
$1f:fb58  36 3f         rol $3f,x
$1f:fb5a  14 0e         trb $0e
$1f:fb5c  3f 79 0e 8f   and $8f0e79,x
$1f:fb60  00 34         brk #$34
$1f:fb62  fa            plx
$1f:fb63  37 1a         and [$1a],y
$1f:fb65  6f 1c 4d 5d   adc $5d4d1c
$1f:fb69  f5 01         sbc $01,x
$1f:fb6b  24 fd         bit $fd
$1f:fb6d  f5 00         sbc $00,x
$1f:fb6f  24 ce         bit $ce
$1f:fb71  d4 d4         pei ($d4)
$1f:fb73  db            stp
$1f:fb74  d5 e8         cmp $e8,x
$1f:fb76  dc d5 05      jml [$05d5]
$1f:fb79  03 e8         ora $e8,s
$1f:fb7b  0a            asl a
$1f:fb7c  3f 49 08 e8   and $e80849,x
$1f:fb80  00 d5         brk #$d5
$1f:fb82  15 02         ora $02,x
$1f:fb84  d5 a5         cmp $a5,x
$1f:fb86  03 d5         ora $d5,s
$1f:fb88  f0 02         beq $fb8c
$1f:fb8a  d5 64         cmp $64,x
$1f:fb8c  02 d4         cop #$d4
$1f:fb8e  ad d4 c1      lda $c1d4
$1f:fb91  d5 b8         cmp $b8,x
$1f:fb93  03 d4         ora $d4,s
$1f:fb95  84 d4         sty $d4
$1f:fb97  85 e8         sta $e8
$1f:fb99  02 d4         cop #$d4
$1f:fb9b  70 6f         bvs $fc0c
$1f:fb9d  e4 47         cpx $47
$1f:fb9f  48            pha
$1f:fba0  ff fd 24 37   sbc $3724fd,x
$1f:fba4  c4 37         cpy $37
$1f:fba6  dd 24 36      cmp $3624,x
$1f:fba9  c4 36         cpy $36
$1f:fbab  09 47         ora #$47
$1f:fbad  5e fa 47      lsr $47fa,x
$1f:fbb0  5c 8f 00 34   jml $34008f
$1f:fbb4  4d 7d 80      eor $807d
$1f:fbb7  a8            tay
$1f:fbb8  04 5d         tsb $5d
$1f:fbba  f5 15         sbc $15,x
$1f:fbbc  02 3f         cop #$3f
$1f:fbbe  df 07 ce 8f   cmp $8fce07,x
$1f:fbc2  ff 34 e8 00   sbc $00e834,x
$1f:fbc6  d4 d5         pei ($d5)
$1f:fbc8  c4 35         cpy $35
$1f:fbca  6f f4 d5 d0   adc $d0d5f4
$1f:fbce  01 6f         ora ($6f,x)
$1f:fbd0  e4 35         cpx $35
$1f:fbd2  f0 28         beq $fbfc
$1f:fbd4  09 47         ora #$47
$1f:fbd6  5e c8 12      lsr $12c8,x
$1f:fbd9  d0 12         bne $fbed
$1f:fbdb  e4 3f         cpx $3f
$1f:fbdd  ab            plb
$1f:fbde  3f 5c 28 3f   and $3f285c,x
$1f:fbe2  fd f6 fe      sbc $fef6,x
$1f:fbe5  0c 08 c0      tsb $c008
$1f:fbe8  3f 49 08 2f   and $2f0849,x
$1f:fbec  0f e4 3f 48   ora $483fe4
$1f:fbf0  ff bc 5c 28   sbc $285cbc,x
$1f:fbf4  3f fd f6 fe   and $fef6fd,x
$1f:fbf8  0c 3f 49      tsb $493f
$1f:fbfb  08            php
$1f:fbfc  d8            cld
$1f:fbfd  44 9b 70      mvp $70,$9b
$1f:fc00  d0 45         bne $fc47
$1f:fc02  3f d5 07 f0   and $f007d5,x
$1f:fc06  96 30         stx $30,y
$1f:fc08  20 d5 00      jsr $00d5
$1f:fc0b  02 3f         cop #$3f
$1f:fc0d  d5 07         cmp $07,x
$1f:fc0f  30 18         bmi $fc29
$1f:fc11  2d 9f 28      and $289f
$1f:fc14  07 fd         ora [$fd]
$1f:fc16  f6 00         inc $00,x
$1f:fc18  2f d5 01 02   and $0201d5
$1f:fc1c  ae 28 0f      ldx $0f28
$1f:fc1f  fd f6 08      sbc $08f6,x
$1f:fc22  2f d5 14 02   and $0214d5
$1f:fc26  3f d5 07 68   and $6807d5,x
$1f:fc2a  e0 90         cpx #$90
$1f:fc2c  05 3f         ora $3f
$1f:fc2e  c3 07         cmp $07,s
$1f:fc30  2f d0 3f c3   and $c33fd0
$1f:fc34  04 f5         tsb $f5
$1f:fc36  00 02         brk #$02
$1f:fc38  d4 70         pei ($70)
$1f:fc3a  fd f5 01      sbc $01f5,x
$1f:fc3d  02 cf         cop #$cf
$1f:fc3f  dd d0 01      cmp $01d0,x
$1f:fc42  bc d4 71      ldy $71d4,x
$1f:fc45  2f 03 3f 5c   and $5c3f03
$1f:fc49  0b            phd
$1f:fc4a  3f f5 09 e4   and $e409f5,x
$1f:fc4e  30 f0         bmi $fc40
$1f:fc50  03 09         ora $09,s
$1f:fc52  47 5e         eor [$5e]
$1f:fc54  3f a5 0a 6f   and $6f0aa5,x
$1f:fc58  8d bb e8      sta $e8bb
$1f:fc5b  aa            tax
$1f:fc5c  da            phx
$1f:fc5d  f4 e4 f4      pea $f4e4
$1f:fc60  68            pla
$1f:fc61  cc d0 fa      cpy $fad0
$1f:fc64  2f 1e eb f4   and $f4eb1e
$1f:fc68  d0 fc         bne $fc66
$1f:fc6a  7e f4 d0      ror $d0f4,x
$1f:fc6d  10 cb         bpl $fc3a
$1f:fc6f  f4 e4 f5      pea $f5e4
$1f:fc72  d6 00         dec $00,x
$1f:fc74  00 fc         brk #$fc
$1f:fc76  d0 f2         bne $fc6a
$1f:fc78  ac 22 0f      ldy $0f22
$1f:fc7b  5f 18 0f 10   eor $100f18,x
$1f:fc7f  ea            nop
$1f:fc80  7e f4 10      ror $10f4,x
$1f:fc83  e6 ba         inc $ba
$1f:fc85  f6 c5         inc $c5,x
$1f:fc87  21 0f         and ($0f,x)
$1f:fc89  cc 22 0f      cpy $0f22
$1f:fc8c  eb            xba
$1f:fc8d  f4 e4 f5      pea $f5e4
$1f:fc90  cb            wai
$1f:fc91  f4 d0 d2      pea $d2d0
$1f:fc94  cd 31 d8      cmp $d831
$1f:fc97  f1 6f         sbc ($6f),y
$1f:fc99  00 00         brk #$00
$1f:fc9b  00 04         brk #$04
$1f:fc9d  ff ff ff 00   sbc $00ffff,x
$1f:fca1  00 00         brk #$00
$1f:fca3  00 00         brk #$00
$1f:fca5  00 00         brk #$00
$1f:fca7  00 00         brk #$00
$1f:fca9  00 00         brk #$00
$1f:fcab  00 00         brk #$00
$1f:fcad  00 00         brk #$00
$1f:fcaf  00 00         brk #$00
$1f:fcb1  00 00         brk #$00
$1f:fcb3  00 00         brk #$00
$1f:fcb5  00 00         brk #$00
$1f:fcb7  00 00         brk #$00
$1f:fcb9  00 00         brk #$00
$1f:fcbb  00 00         brk #$00
$1f:fcbd  00 00         brk #$00
$1f:fcbf  00 ff         brk #$ff
$1f:fcc1  ff ff ff ff   sbc $ffffff,x
$1f:fcc5  ff ff ff ff   sbc $ffffff,x
$1f:fcc9  ff ff ff ff   sbc $ffffff,x
$1f:fccd  ff ff ff ff   sbc $ffffff,x
$1f:fcd1  ff ff ff ff   sbc $ffffff,x
$1f:fcd5  ff ff ff ff   sbc $ffffff,x
$1f:fcd9  ff ff ff ff   sbc $ffffff,x
$1f:fcdd  ff ff ff 00   sbc $00ffff,x
$1f:fce1  00 00         brk #$00
$1f:fce3  00 00         brk #$00
$1f:fce5  00 00         brk #$00
$1f:fce7  00 00         brk #$00
$1f:fce9  00 00         brk #$00
$1f:fceb  00 00         brk #$00
$1f:fced  00 00         brk #$00
$1f:fcef  00 00         brk #$00
$1f:fcf1  00 00         brk #$00
$1f:fcf3  00 00         brk #$00
$1f:fcf5  00 00         brk #$00
$1f:fcf7  00 00         brk #$00
$1f:fcf9  00 00         brk #$00
$1f:fcfb  00 00         brk #$00
$1f:fcfd  00 00         brk #$00
$1f:fcff  00 ff         brk #$ff
$1f:fd01  ff ff ff ff   sbc $ffffff,x
$1f:fd05  ff ff ff ff   sbc $ffffff,x
$1f:fd09  ff ff ff ff   sbc $ffffff,x
$1f:fd0d  ff ff ff ff   sbc $ffffff,x
$1f:fd11  ff ff ff ff   sbc $ffffff,x
$1f:fd15  ff ff ff ff   sbc $ffffff,x
$1f:fd19  ff ff ff ff   sbc $ffffff,x
$1f:fd1d  ff ff ff 00   sbc $00ffff,x
$1f:fd21  00 00         brk #$00
$1f:fd23  00 00         brk #$00
$1f:fd25  00 00         brk #$00
$1f:fd27  00 00         brk #$00
$1f:fd29  00 00         brk #$00
$1f:fd2b  00 00         brk #$00
$1f:fd2d  00 00         brk #$00
$1f:fd2f  00 00         brk #$00
$1f:fd31  00 00         brk #$00
$1f:fd33  00 00         brk #$00
$1f:fd35  00 00         brk #$00
$1f:fd37  00 00         brk #$00
$1f:fd39  00 00         brk #$00
$1f:fd3b  00 00         brk #$00
$1f:fd3d  00 00         brk #$00
$1f:fd3f  10 ff         bpl $fd40
$1f:fd41  ff ff ff ff   sbc $ffffff,x
$1f:fd45  ff ff ff ff   sbc $ffffff,x
$1f:fd49  ff ff ff ff   sbc $ffffff,x
$1f:fd4d  ff ff ff ff   sbc $ffffff,x
$1f:fd51  ff ff ff ff   sbc $ffffff,x
$1f:fd55  ff ff ff ff   sbc $ffffff,x
$1f:fd59  ff ff ff ff   sbc $ffffff,x
$1f:fd5d  ff ff ff 00   sbc $00ffff,x
$1f:fd61  00 00         brk #$00
$1f:fd63  00 00         brk #$00
$1f:fd65  00 00         brk #$00
$1f:fd67  00 00         brk #$00
$1f:fd69  00 00         brk #$00
$1f:fd6b  00 00         brk #$00
$1f:fd6d  00 00         brk #$00
$1f:fd6f  00 00         brk #$00
$1f:fd71  00 00         brk #$00
$1f:fd73  00 00         brk #$00
$1f:fd75  00 00         brk #$00
$1f:fd77  00 00         brk #$00
$1f:fd79  00 00         brk #$00
$1f:fd7b  00 00         brk #$00
$1f:fd7d  00 00         brk #$00
$1f:fd7f  00 ff         brk #$ff
$1f:fd81  ff ff ff ff   sbc $ffffff,x
$1f:fd85  ff ff ff ff   sbc $ffffff,x
$1f:fd89  ff ff ff ff   sbc $ffffff,x
$1f:fd8d  ff ff ff ff   sbc $ffffff,x
$1f:fd91  ff ff ff ff   sbc $ffffff,x
$1f:fd95  ff ff ff ff   sbc $ffffff,x
$1f:fd99  ff ff ff ff   sbc $ffffff,x
$1f:fd9d  ff ff ff 00   sbc $00ffff,x
$1f:fda1  00 00         brk #$00
$1f:fda3  00 00         brk #$00
$1f:fda5  00 00         brk #$00
$1f:fda7  00 00         brk #$00
$1f:fda9  00 00         brk #$00
$1f:fdab  00 00         brk #$00
$1f:fdad  00 00         brk #$00
$1f:fdaf  00 00         brk #$00
$1f:fdb1  00 00         brk #$00
$1f:fdb3  00 00         brk #$00
$1f:fdb5  00 00         brk #$00
$1f:fdb7  04 00         tsb $00
$1f:fdb9  00 00         brk #$00
$1f:fdbb  00 00         brk #$00
$1f:fdbd  00 00         brk #$00
$1f:fdbf  00 ff         brk #$ff
$1f:fdc1  ff ff ff ff   sbc $ffffff,x
$1f:fdc5  ff ff ff ff   sbc $ffffff,x
$1f:fdc9  ff ff ff ff   sbc $ffffff,x
$1f:fdcd  ff ff ff ff   sbc $ffffff,x
$1f:fdd1  ff ff ff ff   sbc $ffffff,x
$1f:fdd5  ff ff ff ff   sbc $ffffff,x
$1f:fdd9  ff ff ff ff   sbc $ffffff,x
$1f:fddd  ff ff ff 00   sbc $00ffff,x
$1f:fde1  00 00         brk #$00
$1f:fde3  00 00         brk #$00
$1f:fde5  00 00         brk #$00
$1f:fde7  00 00         brk #$00
$1f:fde9  00 00         brk #$00
$1f:fdeb  00 00         brk #$00
$1f:fded  00 00         brk #$00
$1f:fdef  00 00         brk #$00
$1f:fdf1  00 00         brk #$00
$1f:fdf3  00 00         brk #$00
$1f:fdf5  00 00         brk #$00
$1f:fdf7  00 00         brk #$00
$1f:fdf9  00 00         brk #$00
$1f:fdfb  00 00         brk #$00
$1f:fdfd  00 00         brk #$00
$1f:fdff  00 ff         brk #$ff
$1f:fe01  ff ff ff ff   sbc $ffffff,x
$1f:fe05  ff ff ff ff   sbc $ffffff,x
$1f:fe09  ff ff ff ff   sbc $ffffff,x
$1f:fe0d  ff ff ff ff   sbc $ffffff,x
$1f:fe11  ff ff ff ff   sbc $ffffff,x
$1f:fe15  ff ff ff ff   sbc $ffffff,x
$1f:fe19  ff ff ff ff   sbc $ffffff,x
$1f:fe1d  ff ff ff 00   sbc $00ffff,x
$1f:fe21  00 00         brk #$00
$1f:fe23  00 00         brk #$00
$1f:fe25  00 00         brk #$00
$1f:fe27  00 00         brk #$00
$1f:fe29  00 00         brk #$00
$1f:fe2b  00 00         brk #$00
$1f:fe2d  00 00         brk #$00
$1f:fe2f  00 00         brk #$00
$1f:fe31  00 00         brk #$00
$1f:fe33  00 00         brk #$00
$1f:fe35  00 00         brk #$00
$1f:fe37  00 00         brk #$00
$1f:fe39  00 00         brk #$00
$1f:fe3b  00 00         brk #$00
$1f:fe3d  00 00         brk #$00
$1f:fe3f  10 ff         bpl $fe40
$1f:fe41  ff ff ff ff   sbc $ffffff,x
$1f:fe45  ff ff ff ff   sbc $ffffff,x
$1f:fe49  ff ff ff ff   sbc $ffffff,x
$1f:fe4d  ff ff ff ff   sbc $ffffff,x
$1f:fe51  ff ff ff ff   sbc $ffffff,x
$1f:fe55  ff ff ff ff   sbc $ffffff,x
$1f:fe59  ff ff ff ff   sbc $ffffff,x
$1f:fe5d  ff ff ff 00   sbc $00ffff,x
$1f:fe61  00 00         brk #$00
$1f:fe63  00 00         brk #$00
$1f:fe65  00 00         brk #$00
$1f:fe67  00 00         brk #$00
$1f:fe69  00 00         brk #$00
$1f:fe6b  00 00         brk #$00
$1f:fe6d  00 00         brk #$00
$1f:fe6f  00 00         brk #$00
$1f:fe71  00 00         brk #$00
$1f:fe73  00 00         brk #$00
$1f:fe75  00 00         brk #$00
$1f:fe77  00 00         brk #$00
$1f:fe79  00 00         brk #$00
$1f:fe7b  00 00         brk #$00
$1f:fe7d  00 08         brk #$08
$1f:fe7f  00 ff         brk #$ff
$1f:fe81  ff ff ff ff   sbc $ffffff,x
$1f:fe85  ff ff ff ff   sbc $ffffff,x
$1f:fe89  ff ff ff ff   sbc $ffffff,x
$1f:fe8d  ff ff ff ff   sbc $ffffff,x
$1f:fe91  ff ff ff ff   sbc $ffffff,x
$1f:fe95  ff ff ff ff   sbc $ffffff,x
$1f:fe99  ff ff ff ff   sbc $ffffff,x
$1f:fe9d  ff ff ff 00   sbc $00ffff,x
$1f:fea1  00 00         brk #$00
$1f:fea3  00 00         brk #$00
$1f:fea5  00 00         brk #$00
$1f:fea7  00 00         brk #$00
$1f:fea9  00 00         brk #$00
$1f:feab  00 00         brk #$00
$1f:fead  00 00         brk #$00
$1f:feaf  00 00         brk #$00
$1f:feb1  00 00         brk #$00
$1f:feb3  00 00         brk #$00
$1f:feb5  00 00         brk #$00
$1f:feb7  00 00         brk #$00
$1f:feb9  00 00         brk #$00
$1f:febb  00 00         brk #$00
$1f:febd  20 00 00      jsr $0000
$1f:fec0  ff ff ff ff   sbc $ffffff,x
$1f:fec4  ff ff ff ff   sbc $ffffff,x
$1f:fec8  ff ff ff ff   sbc $ffffff,x
$1f:fecc  ff ff ff ff   sbc $ffffff,x
$1f:fed0  ff ff ff ff   sbc $ffffff,x
$1f:fed4  ff ff ff ff   sbc $ffffff,x
$1f:fed8  ff ff ff ff   sbc $ffffff,x
$1f:fedc  ff ff ff ff   sbc $ffffff,x
$1f:fee0  00 00         brk #$00
$1f:fee2  00 00         brk #$00
$1f:fee4  00 00         brk #$00
$1f:fee6  00 00         brk #$00
$1f:fee8  00 00         brk #$00
$1f:feea  00 00         brk #$00
$1f:feec  00 00         brk #$00
$1f:feee  00 00         brk #$00
$1f:fef0  00 00         brk #$00
$1f:fef2  00 00         brk #$00
$1f:fef4  00 00         brk #$00
$1f:fef6  00 00         brk #$00
$1f:fef8  00 00         brk #$00
$1f:fefa  00 00         brk #$00
$1f:fefc  00 00         brk #$00
$1f:fefe  00 00         brk #$00
$1f:ff00  ff ff ff ff   sbc $ffffff,x
$1f:ff04  ff ff ff ff   sbc $ffffff,x
$1f:ff08  ff ff ff ff   sbc $ffffff,x
$1f:ff0c  ff ff ff ff   sbc $ffffff,x
$1f:ff10  ff ff ff ff   sbc $ffffff,x
$1f:ff14  ff ff ff ff   sbc $ffffff,x
$1f:ff18  ff ff ff ff   sbc $ffffff,x
$1f:ff1c  ff ff ff ff   sbc $ffffff,x
$1f:ff20  00 00         brk #$00
$1f:ff22  00 00         brk #$00
$1f:ff24  00 00         brk #$00
$1f:ff26  00 00         brk #$00
$1f:ff28  00 00         brk #$00
$1f:ff2a  00 00         brk #$00
$1f:ff2c  00 00         brk #$00
$1f:ff2e  00 00         brk #$00
$1f:ff30  00 00         brk #$00
$1f:ff32  00 00         brk #$00
$1f:ff34  00 00         brk #$00
$1f:ff36  00 00         brk #$00
$1f:ff38  00 00         brk #$00
$1f:ff3a  00 00         brk #$00
$1f:ff3c  00 00         brk #$00
$1f:ff3e  00 00         brk #$00
$1f:ff40  ff ff ff ff   sbc $ffffff,x
$1f:ff44  ff ff ff ff   sbc $ffffff,x
$1f:ff48  ff ff ff ff   sbc $ffffff,x
$1f:ff4c  ff ff ff ff   sbc $ffffff,x
$1f:ff50  ff ff ff ff   sbc $ffffff,x
$1f:ff54  ff ff ff ff   sbc $ffffff,x
$1f:ff58  ff ff ff ff   sbc $ffffff,x
$1f:ff5c  ff ff ff ff   sbc $ffffff,x
$1f:ff60  00 00         brk #$00
$1f:ff62  00 00         brk #$00
$1f:ff64  00 00         brk #$00
$1f:ff66  00 00         brk #$00
$1f:ff68  00 00         brk #$00
$1f:ff6a  00 00         brk #$00
$1f:ff6c  00 00         brk #$00
$1f:ff6e  00 00         brk #$00
$1f:ff70  00 00         brk #$00
$1f:ff72  00 00         brk #$00
$1f:ff74  00 00         brk #$00
$1f:ff76  00 00         brk #$00
$1f:ff78  00 00         brk #$00
$1f:ff7a  00 00         brk #$00
$1f:ff7c  00 00         brk #$00
$1f:ff7e  00 20         brk #$20
$1f:ff80  ff ff ff ff   sbc $ffffff,x
$1f:ff84  ff ff ff ff   sbc $ffffff,x
$1f:ff88  ff ff ff ff   sbc $ffffff,x
$1f:ff8c  ff ff ff ff   sbc $ffffff,x
$1f:ff90  ff ff ff ff   sbc $ffffff,x
$1f:ff94  ff ff ff ff   sbc $ffffff,x
$1f:ff98  ff ff ff ff   sbc $ffffff,x
$1f:ff9c  ff ff ff ff   sbc $ffffff,x
$1f:ffa0  00 00         brk #$00
$1f:ffa2  00 00         brk #$00
$1f:ffa4  00 00         brk #$00
$1f:ffa6  00 00         brk #$00
$1f:ffa8  00 00         brk #$00
$1f:ffaa  00 00         brk #$00
$1f:ffac  00 00         brk #$00
$1f:ffae  00 00         brk #$00
$1f:ffb0  00 00         brk #$00
$1f:ffb2  00 00         brk #$00
$1f:ffb4  00 00         brk #$00
$1f:ffb6  00 00         brk #$00
$1f:ffb8  00 00         brk #$00
$1f:ffba  00 00         brk #$00
$1f:ffbc  00 10         brk #$10
$1f:ffbe  00 00         brk #$00
$1f:ffc0  ff ff ff ff   sbc $ffffff,x
$1f:ffc4  ff ff ff ff   sbc $ffffff,x
$1f:ffc8  ff ff ff ff   sbc $ffffff,x
$1f:ffcc  ff ff ff ff   sbc $ffffff,x
$1f:ffd0  ff ff ff ff   sbc $ffffff,x
$1f:ffd4  ff ff ff ff   sbc $ffffff,x
$1f:ffd8  ff ff ff ff   sbc $ffffff,x
$1f:ffdc  ff ff ff ff   sbc $ffffff,x
$1f:ffe0  00 00         brk #$00
$1f:ffe2  13 01         ora ($01,s),y
$1f:ffe4  00 00         brk #$00
$1f:ffe6  59 18 00      eor $0018,y
$1f:ffe9  00 22         brk #$22
$1f:ffeb  70 00         bvs $ffed
$1f:ffed  00 c0         brk #$c0
$1f:ffef  02 00         cop #$00
$1f:fff1  00 79         brk #$79
$1f:fff3  bf 10 00 75   lda $750010,x
$1f:fff7  ef 00 00 17   sbc $170000
$1f:fffb  5b            tcd
$1f:fffc  00 00         brk #$00
$1f:fffe  7f            .db $7f                  ; Incomplete instruction at ROM end
