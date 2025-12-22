; Soul Blazer (SNES) - Bank $14
; Disassembled from ROM
; File offset: $0a0000-$0a7fff
; CPU address: $14:$8000-$14:$ffff
;===========================================================

.bank $14
.org $8000

$14:8000  00 20         brk #$20
$14:8002  80 3b         bra $803f
$14:8004  ea            nop
$14:8005  02 fc         cop #$fc
$14:8007  07 85         ora [$85]
$14:8009  82 84 1d      brl $9d90
$14:800c  b8            clv
$14:800d  00 96         brk #$96
$14:800f  07 96         ora [$96]
$14:8011  07 00         ora [$00]
$14:8013  86 40         stx $40
$14:8015  20 f2 09      jsr $09f2
$14:8018  bd 42 ed      lda $ed42,x
$14:801b  6c e6 0c      jmp ($0ce6)
$14:801e  0e 19 0c      asl $0c19
$14:8021  89 c1         bit #$c1
$14:8023  27 72         and [$72]
$14:8025  0a            asl a
$14:8026  fd 43 5f      sbc $5f43,x
$14:8029  cc 99 bb      cpy $bb99
$14:802c  c9 da         cmp #$da
$14:802e  37 08         and [$08],y
$14:8030  06 62         asl $62
$14:8032  01 5c         ora ($5c,x)
$14:8034  82 73 23      brl $a3aa
$14:8037  1f e2 79 f4   ora $f479e2,x
$14:803b  2e 18 88      rol $8818
$14:803e  87 b2         sta [$b2]
$14:8040  81 be         sta ($be,x)
$14:8042  e2 4e         sep #$4e
$14:8044  e3 5e         sbc $5e,s
$14:8046  51 7b         eor ($7b),y
$14:8048  44 22 e3      mvp $e3,$22
$14:804b  90 88         bcc $7fd5
$14:804d  5d a1 9e      eor $9ea1,x
$14:8050  41 fb         eor ($fb,x)
$14:8052  45 25         eor $25
$14:8054  64 92         stz $92
$14:8056  f2 46         sbc ($46)
$14:8058  dd e9 20      cmp $20e9,x
$14:805b  b8            clv
$14:805c  5c 3b 05 98   jml $98053b
$14:8060  80 7c         bra $80de
$14:8062  0c a1 58      tsb $58a1
$14:8065  d2 1a         cmp ($1a)
$14:8067  6a            ror a
$14:8068  05 0e         ora $0e
$14:806a  84 47         sty $47
$14:806c  cf 27 ec 1f   cmp $1fec27
$14:8070  a4 3a         ldy $3a
$14:8072  23 1c         and $1c,s
$14:8074  91 92         sta ($92),y
$14:8076  4b            phk
$14:8077  d9 13 47      cmp $4713,y
$14:807a  b1 5c         lda ($5c),y
$14:807c  20 95 c8      jsr $c895
$14:807f  e7 22         sbc [$22]
$14:8081  3f f5 4f b1   and $b14ff5,x
$14:8085  9c 28 9b      stz $9b28
$14:8088  ae 04 fe      ldx $fe04
$14:808b  25 ed         and $ed
$14:808d  17 ac         ora [$ac],y
$14:808f  22 03 06 81   jsl $810603
$14:8093  cd 24 15      cmp $1524
$14:8096  68            pla
$14:8097  07 34         ora [$34]
$14:8099  7e 90 88      ror $8890,x
$14:809c  bc 16 77      ldy $7716,x
$14:809f  03 bf         ora $bf,s
$14:80a1  c8            iny
$14:80a2  3f ee b0 10   and $10b0ee,x
$14:80a6  29 50         and #$50
$14:80a8  33 18         and ($18,s),y
$14:80aa  8a            txa
$14:80ab  a4 13         ldy $13
$14:80ad  95 c0         sta $c0,x
$14:80af  97 27         sta [$27],y
$14:80b1  d2 41         cmp ($41)
$14:80b3  d8            cld
$14:80b4  33 86         and ($86,s),y
$14:80b6  23 fd         and $fd,s
$14:80b8  c4 9f         cpy $9f
$14:80ba  f0 bf         beq $807b
$14:80bc  b3 bb         lda ($bb,s),y
$14:80be  c4 ce         cpy $ce
$14:80c0  e1 33         sbc ($33,x)
$14:80c2  a8            tay
$14:80c3  0c c2 e7      tsb $e7c2
$14:80c6  d0 1b         bne $80e3
$14:80c8  9f c2 cf 1c   sta $1ccfc2,x
$14:80cc  b7 c7         lda [$c7],y
$14:80ce  29 f3         and #$f3
$14:80d0  c2 18         rep #$18
$14:80d2  73 c8         adc ($c8,s),y
$14:80d4  ca            dex
$14:80d5  0f 54 f8 40   ora $40f854
$14:80d9  4b            phk
$14:80da  00 56         brk #$56
$14:80dc  17 a0         ora [$a0],y
$14:80de  14 1c         trb $1c
$14:80e0  ae 70 3e      ldx $3e70
$14:80e3  4e da 11      lsr $11da
$14:80e6  7f ce 4d a5   adc $a54dce,x
$14:80ea  51 4b         eor ($4b),y
$14:80ec  1c fa 29      trb $29fa
$14:80ef  08            php
$14:80f0  9b            txy
$14:80f1  47 23         eor [$23]
$14:80f3  90 0c         bcc $8101
$14:80f5  a5 ae         lda $ae
$14:80f7  93 b6         sta ($b6,s),y
$14:80f9  9b            txy
$14:80fa  72 62         adc ($62)
$14:80fc  96 b9         stx $b9,y
$14:80fe  15 76         ora $76,x
$14:8100  01 3e         ora ($3e,x)
$14:8102  8e 48 a0      stx $a048
$14:8105  07 d0         ora [$d0]
$14:8107  47 cc         eor [$cc]
$14:8109  22 39 16 07   jsl $071639
$14:810d  30 3d         bmi $814c
$14:810f  0f a1 3f a8   ora $a83fa1
$14:8113  44 34 12      mvp $12,$34
$14:8116  0e 05 03      asl $0305
$14:8119  01 80         ora ($80,x)
$14:811b  27 b7         and [$b7]
$14:811d  83 61         sta $61,s
$14:811f  40            rti
$14:8120  f0 40         beq $8162
$14:8122  38            sec
$14:8123  10 05         bpl $812a
$14:8125  b3 e0         lda ($e0,s),y
$14:8127  38            sec
$14:8128  0b            phd
$14:8129  60            rts
$14:812a  5b            tcd
$14:812b  12 d4         ora ($d4)
$14:812d  16 82         asl $82,x
$14:812f  d8            cld
$14:8130  0a            asl a
$14:8131  03 0c         ora $0c,s
$14:8133  da            phx
$14:8134  22 d1 15 a0   jsl $a015d1
$14:8138  37 42         and [$42],y
$14:813a  41 20         eor ($20,x)
$14:813c  80 cc         bra $810a
$14:813e  2c 36 16      bit $1636
$14:8141  f0 58         beq $819b
$14:8143  20 36 1f      jsr $1f36
$14:8146  0d 06 01      ora $0106
$14:8149  30 b8         bmi $8103
$14:814b  4b            phk
$14:814c  a6 10         ldx $10
$14:814e  1b            tcs
$14:814f  04 46         tsb $46
$14:8151  81 a1         sta ($a1,x)
$14:8153  01 85         ora ($85,x)
$14:8155  07 40         ora [$40]
$14:8157  07 09         ora [$09]
$14:8159  05 46         ora $46
$14:815b  41 5f         eor ($5f,x)
$14:815d  84 60         sty $60
$14:815f  31 90         and ($90),y
$14:8161  48            pha
$14:8162  3c 0b 05      bit $050b,x
$14:8165  86 c1         stx $c1
$14:8167  c1 a0         cmp ($a0,x)
$14:8169  d0 3c         bne $81a7
$14:816b  34 32         bit $32,x
$14:816d  19 f2 86      ora $86f2,y
$14:8170  60            rts
$14:8171  20 d8 88      jsr $88d8
$14:8174  1e 13 07      asl $0713,x
$14:8177  04 12         tsb $12
$14:8179  96 1a         stx $1a,y
$14:817b  11 86         ora ($86),y
$14:817d  bc 40 ef      ldy $ef40,x
$14:8180  50 2b         bvc $81ad
$14:8182  c4 3e         cpy $3e
$14:8184  5d 24 7f      eor $7f24,x
$14:8187  04 6e         tsb $6e
$14:8189  31 0b         and ($0b),y
$14:818b  84 41         sty $41
$14:818d  a0 90 a8      ldy #$a890
$14:8190  17 f6         ora [$f6],y
$14:8192  43 df         eor $df,s
$14:8194  96 d4         stx $d4,y
$14:8196  a4 d5         ldy $d5
$14:8198  98            tya
$14:8199  c4 9e         cpy $9e
$14:819b  15 35         ora $35,x
$14:819d  83 46         sta $46,s
$14:819f  61 51         adc ($51,x)
$14:81a1  5f 86 ef e1   eor $e1ef86,x
$14:81a5  56 e8         lsr $e8,x
$14:81a7  47 24         eor [$24]
$14:81a9  1e c7 18      asl $18c7,x
$14:81ac  42 25         wdm #$25
$14:81ae  19 8f c7      ora $c78f,y
$14:81b1  03 a1         ora $a1,s
$14:81b3  38            sec
$14:81b4  e3 e5         sbc $e5,s
$14:81b6  ad 3f 49      lda $493f
$14:81b9  57 b2         eor [$b2],y
$14:81bb  25 80         and $80
$14:81bd  be 4a 3a      ldx $3a4a,y
$14:81c0  9f 86 f8 4e   sta $4ef886,x
$14:81c4  27 75         and [$75]
$14:81c6  0b            phd
$14:81c7  c4 4e         cpy $4e
$14:81c9  3b            tsc
$14:81ca  27 82         and [$82]
$14:81cc  4b            phk
$14:81cd  a0 03 80      ldy #$8003
$14:81d0  8d c2 21      sta $21c2
$14:81d3  d0 08         bne $81dd
$14:81d5  64 3b         stz $3b
$14:81d7  eb            xba
$14:81d8  23 ee         and $ee,s
$14:81da  49 eb         eor #$eb
$14:81dc  04 52         tsb $52
$14:81de  8d 49 61      sta $6149
$14:81e1  d1 18         cmp ($18),y
$14:81e3  64 4f         stz $4f
$14:81e5  61 eb         adc ($eb,x)
$14:81e7  88            dey
$14:81e8  65 bc         adc $bc
$14:81ea  13 c9         ora ($c9,s),y
$14:81ec  47 12         eor [$12]
$14:81ee  21 80         and ($80,x)
$14:81f0  94 42         sty $42,x
$14:81f2  3f 19 85 f8   and $f88519,x
$14:81f6  6a            ror a
$14:81f7  2a            rol a
$14:81f8  f1 6f         sbc ($6f),y
$14:81fa  4c 93 b5      jmp $b593
$14:81fd  d4 9d         pei ($9d)
$14:81ff  68            pla
$14:8200  2f 90 8f a6   and $a68f90
$14:8204  62 c1 a0      per $22c8
$14:8207  ac 50 ef      ldy $ef50
$14:820a  56 0a         lsr $0a,x
$14:820c  dc 72 4f      jml [$4f72]
$14:820f  05 94         ora $94
$14:8211  41 e7         eor ($e7,x)
$14:8213  c3 81         cmp $81,s
$14:8215  86 c0         stx $c0
$14:8217  61 94         adc ($94,x)
$14:8219  2d ed 0f      and $0fed
$14:821c  78            sei
$14:821d  83 09         sta $09,s
$14:821f  15 7e         ora $7e,x
$14:8221  7b            tdc
$14:8222  02 8c         cop #$8c
$14:8224  c9 91         cmp #$91
$14:8226  a0 8d 0f      ldy #$0f8d
$14:8229  be e2 25      ldx $25e2,y
$14:822c  94 80         sty $80,x
$14:822e  57 34         eor [$34],y
$14:8230  1e cc 04      asl $04cc,x
$14:8233  03 10         ora $10,s
$14:8235  5a            phy
$14:8236  58            cli
$14:8237  a7 ae         lda [$ae]
$14:8239  89 ba         bit #$ba
$14:823b  32 84         and ($84)
$14:823d  03 f8         ora $f8,s
$14:823f  69 49         adc #$49
$14:8241  85 22         sta $22
$14:8243  21 49         and ($49,x)
$14:8245  80 45         bra $828c
$14:8247  a0 91 e8      ldy #$e891
$14:824a  0c 4a 21      tsb $214a
$14:824d  1d 84 42      ora $4284,x
$14:8250  a0 10 09      ldy #$0910
$14:8253  87 fe         sta [$fe]
$14:8255  23 fe         and $fe,s
$14:8257  83 5e         sta $5e,s
$14:8259  40            rti
$14:825a  61 11         adc ($11,x)
$14:825c  97 91         sta [$91],y
$14:825e  c2 11         rep #$11
$14:8260  17 80         ora [$80],y
$14:8262  47 f2         eor [$f2]
$14:8264  17 b8         ora [$b8],y
$14:8266  06 4a         asl $4a
$14:8268  01 5a         ora ($5a,x)
$14:826a  80 7d         bra $82e9
$14:826c  20 1e 88      jsr $881e
$14:826f  04 42         tsb $42
$14:8271  21 b8         and ($b8,x)
$14:8273  a0 74 37      ldy #$3774
$14:8276  1c 78 97      trb $9778
$14:8279  b6 81         ldx $81,y
$14:827b  be f0 47      ldx $47f0,y
$14:827e  b1 17         lda ($17),y
$14:8280  48            pha
$14:8281  87 b0         sta [$b0]
$14:8283  38            sec
$14:8284  06 d0         asl $d0
$14:8286  b3 f8         lda ($f8,s),y
$14:8288  05 e3         ora $e3
$14:828a  a0 19 bf      ldy #$bf19
$14:828d  83 bf         sta $bf,s
$14:828f  38            sec
$14:8290  1f 86 7e f0   ora $f07e86,x
$14:8294  43 61         eor $61,s
$14:8296  f8            sed
$14:8297  40            rti
$14:8298  a0 50 38      ldy #$3850
$14:829b  1c 06 07      trb $0706
$14:829e  00 80         brk #$80
$14:82a0  bf 40 ae 85   lda $85ae40,x
$14:82a4  31 30         and ($30),y
$14:82a6  11 59         ora ($59),y
$14:82a8  cb            wai
$14:82a9  48            pha
$14:82aa  53 08         eor ($08,s),y
$14:82ac  3c 3a 27      bit $273a,x
$14:82af  36 9a         rol $9a,x
$14:82b1  d9 ef 95      cmp $95ef,y
$14:82b4  02 d2         cop #$d2
$14:82b6  18            clc
$14:82b7  42 03         wdm #$03
$14:82b9  0f 87 cf e3   ora $e3cf87
$14:82bd  17 f9         ora [$f9],y
$14:82bf  05 fe         ora $fe
$14:82c1  6b            rtl
$14:82c2  71 95         adc ($95),y
$14:82c4  68            pla
$14:82c5  ab            plb
$14:82c6  70 2f         bvs $82f7
$14:82c8  ad 13 dd      lda $dd13
$14:82cb  b8            clv
$14:82cc  b4 d9         ldy $d9,x
$14:82ce  63 3f         adc $3f,s
$14:82d0  ab            plb
$14:82d1  24 76         bit $76
$14:82d3  1d 7f ae      ora $ae7f,x
$14:82d6  ff ff bf fd   sbc $fdbfff,x
$14:82da  df ff ef ff   cmp $ffefff,x
$14:82de  cf 7f e0 ff   cmp $ffe07f
$14:82e2  f8            sed
$14:82e3  1f ff 01 e0   ora $e001ff,x
$14:82e7  cc 47 2c      cpy $2c47
$14:82ea  b7 fc         lda [$fc],y
$14:82ec  37 1f         and [$1f],y
$14:82ee  75 98         adc $98,x
$14:82f0  aa            tax
$14:82f1  c4 74         cpy $74
$14:82f3  52 be         eor ($be)
$14:82f5  65 1e         adc $1e
$14:82f7  01 e0         ora ($e0,x)
$14:82f9  f0 7f         beq $837a
$14:82fb  30 1f         bmi $831c
$14:82fd  f9 c7 fe      sbc $fec7,y
$14:8300  c9 ff         cmp #$ff
$14:8302  f4 ff ba      pea $baff
$14:8305  7f cd bf e2   adc $e2bfcd,x
$14:8309  09 08         ora #$08
$14:830b  88            dey
$14:830c  c8            iny
$14:830d  69 f8         adc #$f8
$14:830f  fd c4 ff      sbc $ffc4,x
$14:8312  20 ac 0f      jsr $0fac
$14:8315  e4 9b         cpx $9b
$14:8317  b1 7c         lda ($7c),y
$14:8319  c0 40 21      cpy #$2140
$14:831c  f0 19         beq $8337
$14:831e  f4 3f e1      pea $e13f
$14:8321  3f e0 7f e0   and $e07fe0,x
$14:8325  0e 74 8c      asl $8c74
$14:8328  c5 a1         cmp $a1
$14:832a  70 88         bvs $82b4
$14:832c  13 c4         ora ($c4,s),y
$14:832e  20 f1 29      jsr $29f1
$14:8331  64 92         stz $92
$14:8333  93 65         sta ($65,s),y
$14:8335  98            tya
$14:8336  ce 26 f1      dec $f126
$14:8339  09 7c         ora #$7c
$14:833b  22 2f 02 86   jsl $86022f
$14:833f  c0 23 f0      cpy #$f023
$14:8342  09 fc         ora #$fc
$14:8344  06 fd         asl $fd
$14:8346  31 a7         and ($a7),y
$14:8348  4c 29 f9      jmp $f929
$14:834b  4f 65 02 21   eor $210265
$14:834f  60            rts
$14:8350  a8            tay
$14:8351  74 29         stz $29,x
$14:8353  1a            inc a
$14:8354  cb            wai
$14:8355  25 5a         and $5a
$14:8357  65 ba         adc $ba
$14:8359  84 50         sty $50
$14:835b  30 d8         bmi $8335
$14:835d  cb            wai
$14:835e  84 43         sty $43
$14:8360  d1 40         cmp ($40),y
$14:8362  d8            cld
$14:8363  50 37         bvc $839c
$14:8365  16 4c         asl $4c,x
$14:8367  c7 da         cmp [$da]
$14:8369  11 ee         ora ($ee),y
$14:836b  88            dey
$14:836c  41 bf         eor ($bf,x)
$14:836e  10 78         bpl $83e8
$14:8370  39 44 20      and $2044,y
$14:8373  03 39         ora $39,s
$14:8375  83 c2         sta $c2,s
$14:8377  20 70 48      jsr $4870
$14:837a  01 92         ora ($92,x)
$14:837c  bc 10 06      ldy $0610,x
$14:837f  f0 37         beq $83b8
$14:8381  80 8f         bra $8312
$14:8383  11 0c         ora ($0c),y
$14:8385  05 83         ora $83
$14:8387  01 40         ora ($40,x)
$14:8389  29 c0         and #$c0
$14:838b  bf c8 1b c0   lda $c01bc8,x
$14:838f  31 01         and ($01),y
$14:8391  cc 0a 93      cpy $930a
$14:8394  60            rts
$14:8395  c8            iny
$14:8396  13 c0         ora ($c0,s),y
$14:8398  c7 70         cmp [$70]
$14:839a  63 8e         adc $8e,s
$14:839c  41 a1         eor ($a1,x)
$14:839e  24 1f         bit $1f
$14:83a0  29 79         and #$79
$14:83a2  8e 97 c0      stx $c097
$14:83a5  c5 16         cmp $16
$14:83a7  34 2f         bit $2f,x
$14:83a9  86 02         stx $02
$14:83ab  f0 06         beq $83b3
$14:83ad  25 68         and $68
$14:83af  1c 77 00      trb $0077
$14:83b2  90 74         bcc $8428
$14:83b4  38            sec
$14:83b5  1a            inc a
$14:83b6  04 70         tsb $70
$14:83b8  34 e2         bit $e2,x
$14:83ba  cf e0 bb f4   cmp $f4bbe0
$14:83be  26 75         rol $75
$14:83c0  09 c5         ora #$c5
$14:83c2  e2 39         sep #$39
$14:83c4  2c 87 c5      bit $c587
$14:83c7  e0 f0         cpx #$f0
$14:83c9  c3 98         cmp $98,s
$14:83cb  77 e7         adc [$e7],y
$14:83cd  1c f9 c5      trb $c5f9
$14:83d0  3e 79 67      rol $6779,x
$14:83d3  8f c8 e3 f1   sta $f1e3c8
$14:83d7  08            php
$14:83d8  7c 30 e4      jmp ($e430,x)
$14:83db  d0 78         bne $8455
$14:83dd  04 7e         tsb $7e
$14:83df  01 3f         ora ($3f,x)
$14:83e1  80 5f         bra $8442
$14:83e3  e0 1f         cpx #$1f
$14:83e5  f2 d8         sbc ($d8)
$14:83e7  94 76         sty $76,x
$14:83e9  b3 41         lda ($41,s),y
$14:83eb  9b            txy
$14:83ec  e9 f5         sbc #$f5
$14:83ee  18            clc
$14:83ef  fe 8f 7a      inc $7a8f,x
$14:83f2  4e 40 0f      lsr $0f40
$14:83f5  84 7a         sty $7a
$14:83f7  c3 9d         cmp $9d,s
$14:83f9  f1 c8         sbc ($c8),y
$14:83fb  6f d4 7f c5   adc $c57fd4
$14:83ff  3f e1 1f f0   and $f01fe1,x
$14:8403  6f f8 17 fc   adc $fc17f8
$14:8407  02 24         cop #$24
$14:8409  0b            phd
$14:840a  81 9a         sta ($9a,x)
$14:840c  c3 7d         cmp $7d,s
$14:840e  7e 73 af      ror $af73,x
$14:8411  cf 3a 7b ad   cmp $ad7b3a
$14:8415  b1 48         lda ($48),y
$14:8417  30 2e         bmi $8447
$14:8419  42 c0         wdm #$c0
$14:841b  df fe 10 ff   cmp $ff10fe,x
$14:841f  c4 1f         cpy $1f
$14:8421  f9 03 f0      sbc $f003,y
$14:8424  47 f0         eor [$f0]
$14:8426  16 11         asl $11,x
$14:8428  19 55 32      ora $3255,y
$14:842b  f9 8a 7d      sbc $7d8a,y
$14:842e  ee bb cb      inc $cbbb
$14:8431  d6 d1         dec $d1,x
$14:8433  3a            dec a
$14:8434  32 ef         and ($ef)
$14:8436  24 d7         bit $d7
$14:8438  e5 2c         sbc $2c
$14:843a  b6 f9         ldx $f9,y
$14:843c  ff 1e ff 83   sbc $83ff1e,x
$14:8440  04 2e         tsb $2e
$14:8442  ff 89 ff e2   sbc $e2ff89,x
$14:8446  37 fc         and [$fc],y
$14:8448  97 f7         sta [$f7],y
$14:844a  25 75         and $75
$14:844c  6e c4 83      ror $83c4
$14:844f  19 70 a7      ora $a770,y
$14:8452  6c 20 df      jmp ($df20)
$14:8455  8c b7 e3      sty $e3b7
$14:8458  ad 58 9e      lda $9e58
$14:845b  5c 37 50 12   jml $125037
$14:845f  e1 37         sbc ($37,x)
$14:8461  d3 bf         cmp ($bf,s),y
$14:8463  20 2e 16      jsr $162e
$14:8466  42 97         wdm #$97
$14:8468  55 dd         eor $dd,x
$14:846a  47 3a         eor [$3a]
$14:846c  3e e8 6e      rol $6ee8,x
$14:846f  5e c5 48      lsr $48c5,x
$14:8472  9a            txs
$14:8473  dd 29 55      cmp $5529,x
$14:8476  79 51 6c      adc $6c51,y
$14:8479  23 16         and $16,s
$14:847b  78            sei
$14:847c  e5 8e         sbc $8e
$14:847e  1b            tcs
$14:847f  b2 81         lda ($81)
$14:8481  cf 20 31 ea   cmp $ea3120
$14:8485  05 7e         ora $7e
$14:8487  07 4c         ora [$4c]
$14:8489  de c9 6b      dec $6bc9,x
$14:848c  97 3d         sta [$3d],y
$14:848e  35 c7         and $c7,x
$14:8490  ab            plb
$14:8491  1c b5 c3      trb $c3b5
$14:8494  3a            dec a
$14:8495  d6 0c         dec $0c,x
$14:8497  97 22         sta [$22],y
$14:8499  ad 20 92      lda $9220
$14:849c  f6 ab         inc $ab,x
$14:849e  3a            dec a
$14:849f  69 ef         adc #$ef
$14:84a1  0b            phd
$14:84a2  3b            tsc
$14:84a3  62 e5 4d      per $d28b
$14:84a6  78            sei
$14:84a7  93 ac         sta ($ac,s),y
$14:84a9  d5 93         cmp $93,x
$14:84ab  c9 1a         cmp #$1a
$14:84ad  26 84         rol $84
$14:84af  fa            plx
$14:84b0  bb            tyx
$14:84b1  eb            xba
$14:84b2  e0 ed         cpx #$ed
$14:84b4  b9 3d d9      lda $d93d,y
$14:84b7  17 77         ora [$77],y
$14:84b9  d7 6b         cmp [$6b],y
$14:84bb  80 55         bra $8512
$14:84bd  75 45         adc $45,x
$14:84bf  f0 8e         beq $844f
$14:84c1  58            cli
$14:84c2  ef fb 6a ee   sbc $ee6afb
$14:84c6  db            stp
$14:84c7  ff 80 bb e2   sbc $e2bb80,x
$14:84cb  25 5d         and $5d
$14:84cd  d1 b8         cmp ($b8),y
$14:84cf  41 7e         eor ($7e,x)
$14:84d1  78            sei
$14:84d2  0b            phd
$14:84d3  e5 d7         sbc $d7
$14:84d5  f3 ab         sbc ($ab,s),y
$14:84d7  b9 55 a4      lda $a455,y
$14:84da  ba            tsx
$14:84db  ec 6f 62      cpx $626f
$14:84de  af 70 d7 c1   lda $c1d770
$14:84e2  d4 61         pei ($61)
$14:84e4  f8            sed
$14:84e5  c7 e3         cmp [$e3]
$14:84e7  bb            tyx
$14:84e8  9d ff c7      sta $c7ff,x
$14:84eb  fe e1 ff      inc $ffe1,x
$14:84ee  75 19         adc $19,x
$14:84f0  bf 21 86 fd   lda $fd8621,x
$14:84f4  87 9b         sta [$9b]
$14:84f6  f6 c0         inc $c0,x
$14:84f8  6f df 06 86   adc $8606df
$14:84fc  43 dc         eor $dc,s
$14:84fe  ca            dex
$14:84ff  4d ee b3      eor $b3ee
$14:8502  d8            cld
$14:8503  4c 7e 2d      jmp $2d7e
$14:8506  02 82         cop #$82
$14:8508  9b            txy
$14:8509  ca            dex
$14:850a  bd ff d5      lda $d5ff,x
$14:850d  dd e9 53      cmp $53e9,x
$14:8510  d8            cld
$14:8511  14 fe         trb $fe
$14:8513  29 0b         and #$0b
$14:8515  82 c0 90      brl $15d8
$14:8518  1d 30 80      ora $8030,x
$14:851b  50 0d         bvc $852a
$14:851d  fa            plx
$14:851e  2f 08 1c 06   and $061c08
$14:8522  01 01         ora ($01,x)
$14:8524  83 40         sta $40,s
$14:8526  e0 50         cpx #$50
$14:8528  38            sec
$14:8529  6c 1a 0b      jmp ($0b1a)
$14:852c  06 79         asl $79
$14:852e  04 6e         tsb $6e
$14:8530  18            clc
$14:8531  ca            dex
$14:8532  06 50         asl $50
$14:8534  41 00         eor ($00,x)
$14:8536  43 08         eor $08,s
$14:8538  03 1c         ora $1c,s
$14:853a  41 dc         eor ($dc,x)
$14:853c  10 28         bpl $8566
$14:853e  0c 0a 0f      tsb $0f0a
$14:8541  04 81         tsb $81
$14:8543  c1 20         cmp ($20,x)
$14:8545  f0 00         beq $8547
$14:8547  b8            clv
$14:8548  43 e1         eor $e1,s
$14:854a  10 70         bpl $85bc
$14:854c  38            sec
$14:854d  07 fe         ora [$fe]
$14:854f  02 f0         cop #$f0
$14:8551  17 88         ora [$88],y
$14:8553  03 c8         ora $c8,s
$14:8555  22 0f 91 37   jsl $37910f
$14:8559  8b            phb
$14:855a  fc 8d e4      jsr ($e48d,x)
$14:855d  03 01         ora $01,s
$14:855f  6a            ror a
$14:8560  0c 50 60      tsb $6050
$14:8563  ae 0d ee      ldx $ee0d
$14:8566  78            sei
$14:8567  aa            tax
$14:8568  71 ea         adc ($ea),y
$14:856a  dd 0b a9      cmp $a90b,x
$14:856d  d2 95         cmp ($95)
$14:856f  5e a3 b0      lsr $b0a3,x
$14:8572  f8            sed
$14:8573  50 00         bvc $8575
$14:8575  20 57 ec      jsr $ec57
$14:8578  0f bb e3 bc   ora $bce3bb
$14:857c  ff cb ff f0   sbc $f0ffcb,x
$14:8580  5b            tcd
$14:8581  fc 02 3f      jsr ($3f02,x)
$14:8584  01 87         ora ($87,x)
$14:8586  ae 51 ae      ldx $ae51
$14:8589  18            clc
$14:858a  0c 07 02      tsb $0207
$14:858d  81 a0         sta ($a0,x)
$14:858f  4c 8f 03      jmp $038f
$14:8592  c0 e0         cpy #$e0
$14:8594  54 a9 78      mvn $78,$a9
$14:8597  15 21         ora $21,x
$14:8599  00 f0         brk #$f0
$14:859b  54 a2 71      mvn $71,$a2
$14:859e  5a            phy
$14:859f  8d af 13      sta $13af
$14:85a2  3a            dec a
$14:85a3  e4 c5         cpx $c5
$14:85a5  fc 18 1b      jsr ($1b18,x)
$14:85a8  b7 1e         lda [$1e],y
$14:85aa  79 ce 9c      adc $9cce,y
$14:85ad  c4 ed         cpy $ed
$14:85af  91 1b         sta ($1b),y
$14:85b1  74 27         stz $27,x
$14:85b3  ec c3 08      cpx $08c3
$14:85b6  0f fa 07 fc   ora $fc07fa
$14:85ba  83 7e         sta $7e,s
$14:85bc  61 9f         adc ($9f,x)
$14:85be  3a            dec a
$14:85bf  36 0a         rol $0a,x
$14:85c1  91 80         sta ($80),y
$14:85c3  98            tya
$14:85c4  74 35         stz $35,x
$14:85c6  16 0a         asl $0a,x
$14:85c8  84 c3         sty $c3
$14:85ca  51 18         eor ($18),y
$14:85cc  a8            tay
$14:85cd  42 21         wdm #$21
$14:85cf  1c 4f f4      trb $f44f
$14:85d2  03 f1         ora $f1,s
$14:85d4  04 f8         tsb $f8
$14:85d6  42 3c         wdm #$3c
$14:85d8  11 87         ora ($87),y
$14:85da  18            clc
$14:85db  7e 20 17      ror $1720,x
$14:85de  8c 24 73      sty $7324
$14:85e1  c5 51         cmp $51
$14:85e3  97 41         sta [$41],y
$14:85e5  ef 56 18 f5   sbc $f51856
$14:85e9  e2 4f         sep #$4f
$14:85eb  25 8c         and $8c
$14:85ed  c6 60         dec $60
$14:85ef  c8            iny
$14:85f0  90 0d         bcc $85ff
$14:85f2  04 02         tsb $02
$14:85f4  ff 03 9e 40   sbc $409e03,x
$14:85f8  27 f2         and [$f2]
$14:85fa  0b            phd
$14:85fb  fc 06 1c      jsr ($1c06,x)
$14:85fe  fd 17 e0      sbc $e017,x
$14:8601  d4 a1         pei ($a1)
$14:8603  97 69         sta [$69],y
$14:8605  57 32         eor [$32],y
$14:8607  69 2a         adc #$2a
$14:8609  e8            inx
$14:860a  55 36         eor $36,x
$14:860c  13 08         ora ($08,s),y
$14:860e  44 43 c1      mvp $c1,$43
$14:8611  d0 88         bne $859b
$14:8613  46 3c         lsr $3c
$14:8615  de 28 e4      dec $e428,x
$14:8618  12 f4         ora ($f4)
$14:861a  1f 0f 84 31   ora $31840f,x
$14:861e  c0 0e         cpy #$0e
$14:8620  00 0d         brk #$0d
$14:8622  81 82         sta ($82,x)
$14:8624  8a            txa
$14:8625  44 2f b1      mvp $b1,$2f
$14:8628  c8            iny
$14:8629  c1 e0         cmp ($e0,x)
$14:862b  51 b8         eor ($b8),y
$14:862d  44 de 21      mvp $21,$de
$14:8630  6f 90 77 f8   adc $f87790
$14:8634  19 f8 06      ora $06f8,y
$14:8637  ff 00 5b 08   sbc $085b00,x
$14:863b  0c 1a 0f      tsb $0f1a
$14:863e  1c 87 ce      trb $ce87
$14:8641  23 f7         and $f7,s
$14:8643  0d fd 82      ora $82fd
$14:8646  ff e0 bf f0   sbc $f0bfe0,x
$14:864a  0d 61 00      ora $0061
$14:864d  8c c0 22      sty $22c0
$14:8650  f0 79         beq $86cb
$14:8652  7c 3e 3d      jmp ($3d3e,x)
$14:8655  1f 9c 4f ee   ora $ee4f9c,x
$14:8659  17 fb         ora [$fb],y
$14:865b  2d fb d7      and $d7fb
$14:865e  01 8f         ora ($8f,x)
$14:8660  41 e3         eor ($e3,x)
$14:8662  10 f9         bpl $865d
$14:8664  84 7a         sty $7a
$14:8666  43 38         eor $38,s
$14:8668  a3 dc         lda $dc,s
$14:866a  21 f6         and ($f6,x)
$14:866c  1c f7 8e      trb $8ef7
$14:866f  39 00 cc      and $cc00,y
$14:8672  40            rti
$14:8673  3e 9c 0f      rol $0f9c,x
$14:8676  d7 c2         cmp [$c2],y
$14:8678  7d c0 b6      adc $b6c0,x
$14:867b  e0 34         cpx #$34
$14:867d  10 0a         bpl $8689
$14:867f  04 03         tsb $03
$14:8681  01 80         ora ($80,x)
$14:8683  bc 09 c3      ldy $c309,x
$14:8686  f1 06         sbc ($06),y
$14:8688  9e 70 ac      stz $ac70,x
$14:868b  19 dc 05      ora $05dc,y
$14:868e  82 00 6e      brl $f491
$14:8691  0c 01 24      tsb $2401
$14:8694  a0 4b         ldy #$4b
$14:8696  21 82         and ($82,x)
$14:8698  2d 95 7d      and $7d95
$14:869b  ca            dex
$14:869c  e1 68         sbc ($68,x)
$14:869e  fb            xce
$14:869f  7a            ply
$14:86a0  a0 70         ldy #$70
$14:86a2  c9 a4         cmp #$a4
$14:86a4  76 21         ror $21,x
$14:86a6  17 98         ora [$98],y
$14:86a8  43 e4         eor $e4,s
$14:86aa  15 fa         ora $fa,x
$14:86ac  04 be         tsb $be
$14:86ae  21 af         and ($af,x)
$14:86b0  f8            sed
$14:86b1  59 e2 10      eor $10e2,y
$14:86b4  09 1c         ora #$1c
$14:86b6  02 5f         cop #$5f
$14:86b8  00 9f         brk #$9f
$14:86ba  c0 2f         cpy #$2f
$14:86bc  e0 61         cpx #$61
$14:86be  ff c0 0b 21   sbc $210bc0,x
$14:86c2  0f 80 47 22   ora $224780
$14:86c6  50 88         bvc $8650
$14:86c8  9c 62 3e      stz $3e62
$14:86cb  f3 09         sbc ($09,s),y
$14:86cd  00 0c         brk #$0c
$14:86cf  25 f7         and $f7
$14:86d1  8a            txa
$14:86d2  79 24 a0      adc $a024,y
$14:86d5  e2 21         sep #$21
$14:86d7  01 84         ora ($84,x)
$14:86d9  7e 01 5f      ror $5f01,x
$14:86dc  11 0c         ora ($0c),y
$14:86de  0e 08 2f      asl $2f08
$14:86e1  08            php
$14:86e2  5c 32 1f 08   jml $081f32
$14:86e6  83 8d         sta $8d,s
$14:86e8  8e 2f 18      stx $182f
$14:86eb  0f 84 21 8e   ora $8e2184
$14:86ef  d0 07         bne $86f8
$14:86f1  f8            sed
$14:86f2  07 ca         ora [$ca]
$14:86f4  07 02         ora [$02]
$14:86f6  28            plp
$14:86f7  84 04         sty $04
$14:86f9  a8            tay
$14:86fa  b0 35         bcs $8731
$14:86fc  90 98         bcc $8696
$14:86fe  34 82         bit $82,x
$14:8700  10 83         bpl $8685
$14:8702  91 9c         sta ($9c),y
$14:8704  44 d8 a7      mvp $a7,$d8
$14:8707  e3 3c         sbc $3c,s
$14:8709  2c 02 8d      bit $8d02
$14:870c  83 a4         sta $a4,s
$14:870e  60            rts
$14:870f  a6 5d         ldx $5d
$14:8711  4d 55 92      eor $9255
$14:8714  af 34 d6 c7   lda $c7d634
$14:8718  aa            tax
$14:8719  50 b8         bvc $86d3
$14:871b  4f 14 16 1f   eor $1f1614
$14:871f  b8            clv
$14:8720  27 de         and [$de]
$14:8722  11 e7         ora ($e7),y
$14:8724  8c 28 c0      sty $c028
$14:8727  16 17         asl $17,x
$14:8729  bc 24 77      ldy $7724,x
$14:872c  c5 14         cmp $14
$14:872e  9d ca 23      sta $23ca,x
$14:8731  f5 98         sbc $98,x
$14:8733  b5 6a         lda $6a,x
$14:8735  2b            pld
$14:8736  24 a6         bit $a6
$14:8738  46 e5         lsr $e5
$14:873a  70 58         bvs $8794
$14:873c  34 2a         bit $2a,x
$14:873e  09 18         ora #$18
$14:8740  93 af         sta ($af,s),y
$14:8742  c2 21         rep #$21
$14:8744  6f 61 84 32   adc $328461
$14:8748  e5 0b         sbc $0b
$14:874a  9a            txs
$14:874b  0d ca 0b      ora $0bca
$14:874e  f3 c0         sbc ($c0,s),y
$14:8750  5f 21 3f 78   eor $783f21,x
$14:8754  3f e9 9c 10   and $109ce9,x
$14:8758  ef ae 16 f3   sbc $f316ae
$14:875c  43 9d         eor $9d,s
$14:875e  41 ff         eor ($ff,x)
$14:8760  0d f2 87      ora $87f2
$14:8763  7c 61 82      jmp ($8261,x)
$14:8766  f0 fd         beq $8765
$14:8768  c0 7f         cpy #$7f
$14:876a  d0 3f         bne $87ab
$14:876c  e4 26         cpx $26
$14:876e  0d 0b 82      ora $820b
$14:8771  2f 42 04 f4   and $f40442
$14:8775  02 1b         cop #$1b
$14:8777  09 42 1e      ora #$1e42
$14:877a  22 32 e8 10   jsl $10e832
$14:877e  cf 41 20 a0   cmp $a02041
$14:8782  58            cli
$14:8783  34 1c         bit $1c,x
$14:8785  09 06 02      ora #$0206
$14:8788  81 80         sta ($80,x)
$14:878a  21 a4         and ($a4,x)
$14:878c  83 a1         sta $a1,s
$14:878e  60            rts
$14:878f  c8            iny
$14:8790  78            sei
$14:8791  22 1e 08 07   jsl $07081e
$14:8795  00 86         brk #$86
$14:8797  b1 89         lda ($89),y
$14:8799  e4 d2         cpx $d2
$14:879b  ed 7e f7      sbc $f77e
$14:879e  d6 bb         dec $bb,x
$14:87a0  76 ef         ror $ef,x
$14:87a2  1d 43 9b      ora $9b43,x
$14:87a5  34 b7         bit $b7,x
$14:87a7  42 24         wdm #$24
$14:87a9  90 09         bcc $87b4
$14:87ab  e4 22         cpx $22
$14:87ad  dd 10 ef      cmp $ef10,x
$14:87b0  c9 3f f1      cmp #$f13f
$14:87b3  cf fc fb ff   cmp $fffbfc
$14:87b7  18            clc
$14:87b8  bd 0b c2      lda $c20b,x
$14:87bb  79 18 b3      adc $b318,y
$14:87be  49 3b 74      eor #$743b
$14:87c1  2d ee 04      and $04ee
$14:87c4  aa            tax
$14:87c5  05 30         ora $30
$14:87c7  28            plp
$14:87c8  81 3c         sta ($3c,x)
$14:87ca  07 e1         ora [$e1]
$14:87cc  18            clc
$14:87cd  bf 4f 3c f7   lda $f73c4f,x
$14:87d1  ee 19 94      inc $9419
$14:87d4  0c 60 61      tsb $6160
$14:87d7  01 f8         ora ($f8,x)
$14:87d9  4f ad 50 c0   eor $c050ad
$14:87dd  10 40         bpl $881f
$14:87df  5f 07 10 80   eor $801007,x
$14:87e3  42 a0         wdm #$a0
$14:87e5  10 2b         bpl $8812
$14:87e7  14 76         trb $76
$14:87e9  1c 74 03      trb $0374
$14:87ec  a3 43         lda $43,s
$14:87ee  a0 50         ldy #$50
$14:87f0  58            cli
$14:87f1  1c 0a 07      trb $070a
$14:87f4  01 48         ora ($48,x)
$14:87f6  84 1a         sty $1a
$14:87f8  09 06 83      ora #$8306
$14:87fb  41 d1         eor ($d1,x)
$14:87fd  a1 00         lda ($00,x)
$14:87ff  4b            phk
$14:8800  84 08         sty $08
$14:8802  e8            inx
$14:8803  00 80         brk #$80
$14:8805  81 a3         sta ($a3,x)
$14:8807  81 1c         sta ($1c,x)
$14:8809  09 40 81      ora #$8140
$14:880c  c1 a0         cmp ($a0,x)
$14:880e  20 00 7c      jsr $7c00
$14:8811  2c 05 04      bit $0405
$14:8814  4b            phk
$14:8815  71 58         adc ($58),y
$14:8817  ab            plb
$14:8818  e1 5e         sbc ($5e,x)
$14:881a  e0 ba         cpx #$ba
$14:881c  24 88         bit $88
$14:881e  2d c1 3c      and $3cc1
$14:8821  10 34         bpl $8857
$14:8823  88            dey
$14:8824  c1 20         cmp ($20,x)
$14:8826  e7 42         sbc [$42]
$14:8828  7b            tdc
$14:8829  83 dc         sta $dc,s
$14:882b  13 61         ora ($61,s),y
$14:882d  04 74         tsb $74
$14:882f  08            php
$14:8830  70 3d         bvs $886f
$14:8832  13 7c         ora ($7c,s),y
$14:8834  a5 6e         lda $6e
$14:8836  4b            phk
$14:8837  72 e9         adc ($e9)
$14:8839  67 74         adc [$74]
$14:883b  b9 68 94      lda $9468,y
$14:883e  ef 1b ad e9   sbc $e9ad1b
$14:8842  69 bb f0      adc #$f0bb
$14:8845  0f 7c 03 9f   ora $9f037c
$14:8849  00 b1         brk #$b1
$14:884b  c0 2d         cpy #$2d
$14:884d  10 0f         bpl $885e
$14:884f  24 02         bit $02
$14:8851  e5 00         sbc $00
$14:8853  bc c0 2e      ldy $2ec0,x
$14:8856  16 7a         asl $7a,x
$14:8858  65 5f         adc $5f
$14:885a  3b            tsc
$14:885b  c5 b7         cmp $b7
$14:885d  6c bb f3      jmp ($f3bb)
$14:8860  0c 5d 93      tsb $935d
$14:8863  8b            phb
$14:8864  2a            rol a
$14:8865  f7 4a         sbc [$4a],y
$14:8867  4e 41 a3      lsr $a341
$14:886a  80 48         bra $88b4
$14:886c  8e 66 8a      stx $8a66
$14:886f  01 49         ora ($49,x)
$14:8871  41 e3         eor ($e3,x)
$14:8873  10 f8         bpl $886d
$14:8875  84 be         sty $be
$14:8877  60            rts
$14:8878  33 08         and ($08,s),y
$14:887a  fc 82 bf      jsr ($bf82,x)
$14:887d  60            rts
$14:887e  1c 84 fe      trb $fe84
$14:8881  80 87         bra $880a
$14:8883  09 02 bc      ora #$bc02
$14:8886  c7 c2         cmp [$c2]
$14:8888  87 1c         sta [$1c]
$14:888a  02 84         cop #$84
$14:888c  94 23         sty $23,x
$14:888e  07 6e         ora [$6e]
$14:8890  84 11         sty $11
$14:8892  b8            clv
$14:8893  0d c0 85      ora $85c0
$14:8896  c3 15         cmp $15,s
$14:8898  e4 eb         cpx $eb
$14:889a  25 79         and $79
$14:889c  42 15         wdm #$15
$14:889e  ec af 32      cpx $32af
$14:88a1  08            php
$14:88a2  54 26 12      mvn $12,$26
$14:88a5  8b            phb
$14:88a6  81 b2         sta ($b2,x)
$14:88a8  a2 15         ldx #$15
$14:88aa  09 05 a2      ora #$a205
$14:88ad  0b            phd
$14:88ae  f3 c0         sbc ($c0,s),y
$14:88b0  5f 21 3f 78   eor $783f21,x
$14:88b4  3f ea 11 15   and $1511ea,x
$14:88b8  87 7d         sta [$7d]
$14:88ba  70 b7         bvs $8873
$14:88bc  9a            txs
$14:88bd  1c ea 0f      trb $0fea
$14:88c0  f8            sed
$14:88c1  4f 94 3b e3   eor $e33b94
$14:88c5  0c 89 c1      tsb $c189
$14:88c8  3f 70 1f f4   and $f41f70,x
$14:88cc  0f f9 0a 2c   ora $2c0af9
$14:88d0  8c 09 9e      sty $9e09
$14:88d3  4e 11 69      lsr $6911
$14:88d6  0b            phd
$14:88d7  64 0b         stz $0b
$14:88d9  c1 07         cmp ($07,x)
$14:88db  28            plp
$14:88dc  0a            asl a
$14:88dd  d0 4a         bne $8929
$14:88df  01 01         ora ($01,x)
$14:88e1  5d 04 0b      eor $0b04,x
$14:88e4  2f 4c ca 4a   and $4aca4c
$14:88e8  6d 7a 89      adc $897a
$14:88eb  85 6b         sta $6b
$14:88ed  bf 91 fa 4e   lda $4efa91,x
$14:88f1  70 54         bvs $8947
$14:88f3  bd d7 37      lda $37d7,x
$14:88f6  8d 39 9f      sta $9f39
$14:88f9  70 65         bvs $8960
$14:88fb  dd 18 e7      cmp $e718,x
$14:88fe  8f 3b 62 8c   sta $8c623b
$14:8902  71 e5         adc ($e5),y
$14:8904  5d 5d 65      eor $655d,x
$14:8907  4c d9 64      jmp $64d9
$14:890a  56 7a         lsr $7a,x
$14:890c  79 7d 21      adc $217d,y
$14:890f  50 88         bvc $8899
$14:8911  91 78         sta ($78),y
$14:8913  c2 4d         rep #$4d
$14:8915  08            php
$14:8916  83 47         sta $47,s
$14:8918  20 50 09      jsr $0950
$14:891b  e4 02         cpx $02
$14:891d  fd 00 ff      sbc $ff00,x
$14:8920  8c cf fc      sty $fccf
$14:8923  31 11         and ($11),y
$14:8925  80 0c         bra $8933
$14:8927  38            sec
$14:8928  d0 11         bne $893b
$14:892a  89 e4 92      bit #$92e4
$14:892d  49 42 2a      eor #$2a42
$14:8930  81 4c         sta ($4c,x)
$14:8932  0a            asl a
$14:8933  20 70 22      jsr $2270
$14:8936  e0 49         cpx #$49
$14:8938  23 15         and $15,s
$14:893a  a9 e1 94      lda #$94e1
$14:893d  0c 60 5c      tsb $5c60
$14:8940  28            plp
$14:8941  14 1c         trb $1c
$14:8943  de 0b c0      dec $c00b,x
$14:8946  5d 88 9c      eor $9c88,x
$14:8949  16 e2         asl $e2,x
$14:894b  27 06         and [$06]
$14:894d  10 30         bpl $897f
$14:894f  81 96         sta ($96,x)
$14:8951  0c 40 5a      tsb $5a40
$14:8954  98            tya
$14:8955  02 30         cop #$30
$14:8957  09 50 4c      ora #$4c50
$14:895a  02 5c         cop #$5c
$14:895c  01 ae         ora ($ae,x)
$14:895e  99 3c 05      sta $053c,y
$14:8961  00 1c         brk #$1c
$14:8963  10 36         bpl $899b
$14:8965  60            rts
$14:8966  b1 06         lda ($06),y
$14:8968  06 b6         asl $b6
$14:896a  04 38         tsb $38
$14:896c  a2 6c         ldx #$6c
$14:896e  5c 07 82 86   jml $868207
$14:8972  41 a0         eor ($a0,x)
$14:8974  90 58         bcc $89ce
$14:8976  6c 3a 11      jmp ($113a)
$14:8979  0d 83 40      ora $4083
$14:897c  e1 e7         sbc ($e7,x)
$14:897e  30 84         bmi $8904
$14:8980  c1 5b         cmp ($5b,x)
$14:8982  60            rts
$14:8983  1a            inc a
$14:8984  06 31         asl $31
$14:8986  87 80         sta [$80]
$14:8988  3c 10 e8      bit $e810,x
$14:898b  04 1a         tsb $1a
$14:898d  01 94         ora ($94,x)
$14:898f  b3 f2         lda ($f2,s),y
$14:8991  ee 76 8e      inc $8e76
$14:8994  86 1a         stx $1a
$14:8996  b1 af         lda ($af),y
$14:8998  bf 4d 32 76   lda $76324d,x
$14:899c  ec 2e a3      cpx $a32e
$14:899f  97 f8         sta [$f8],y
$14:89a1  1f 8c fc 04   ora $04fc8c,x
$14:89a5  31 f8         and ($f8),y
$14:89a7  05 de         ora $de
$14:89a9  11 43         ora ($43),y
$14:89ab  9e 52 e6      stz $e652,x
$14:89ae  9c fa 45      stz $45fa
$14:89b1  8f 09 f0 8b   sta $8bf009
$14:89b5  d9 b2 ff      cmp $ffb2,y
$14:89b8  78            sei
$14:89b9  2f 62 71 6e   and $6e7162
$14:89bd  d5 53         cmp $53,x
$14:89bf  31 93         and ($93),y
$14:89c1  02 d8         cop #$d8
$14:89c3  c2 04         rep #$04
$14:89c5  42 e7         wdm #$e7
$14:89c7  08            php
$14:89c8  5c 12 13 14   jml $141312
$14:89cc  97 c4         sta [$c4],y
$14:89ce  37 fc         and [$fc],y
$14:89d0  01 78         ora ($78,x)
$14:89d2  7f f0 17 f1   adc $f117f0,x
$14:89d6  a0 8b         ldy #$8b
$14:89d8  c2 3f         rep #$3f
$14:89da  60            rts
$14:89db  af d8 11 58   lda $5811d8
$14:89df  6c 08 7c      jmp ($7c08)
$14:89e2  22 0e 50 32   jsl $32500e
$14:89e6  78            sei
$14:89e7  13 c2         ora ($c2,s),y
$14:89e9  17 0c         ora [$0c],y
$14:89eb  81 c1         sta ($c1,x)
$14:89ed  17 b4         ora [$b4],y
$14:89ef  e2 01         sep #$01
$14:89f1  18            clc
$14:89f2  54 25 92      mvn $92,$25
$14:89f5  2a            rol a
$14:89f6  e5 9e         sbc $9e
$14:89f8  b1 30         lda ($30),y
$14:89fa  b7 d5         lda [$d5],y
$14:89fc  e4 12         cpx $12
$14:89fe  b8            clv
$14:89ff  9c 45 d6      stz $d645
$14:8a02  10 77         bpl $8a7b
$14:8a04  30 c7         bmi $89cd
$14:8a06  e8            inx
$14:8a07  17 f9         ora [$f9],y
$14:8a09  00 0c         brk #$0c
$14:8a0b  1b            tcs
$14:8a0c  20 01 00      jsr $0001
$14:8a0f  38            sec
$14:8a10  41 e8         eor ($e8,x)
$14:8a12  d8            cld
$14:8a13  3a            dec a
$14:8a14  46 0a         lsr $0a
$14:8a16  65 d4         adc $d4
$14:8a18  d6 d9         dec $d9,x
$14:8a1a  aa            tax
$14:8a1b  13 0d         ora ($0d,s),y
$14:8a1d  44 62 a1      mvp $a1,$62
$14:8a20  08            php
$14:8a21  84 71         sty $71
$14:8a23  3f f0 0f dc   and $dc0ff0,x
$14:8a27  13 ef         ora ($ef,s),y
$14:8a29  08            php
$14:8a2a  f3 c6         sbc ($c6,s),y
$14:8a2c  3e 10 87      rol $8710,x
$14:8a2f  f8            sed
$14:8a30  5e 30 91      lsr $9130,x
$14:8a33  cf 13 25 08   cmp $082513
$14:8a37  31 00         and ($00),y
$14:8a39  81 ac         sta ($ac,x)
$14:8a3b  85 67         sta $67
$14:8a3d  35 49         and $49,x
$14:8a3f  47 cb         eor [$cb]
$14:8a41  41 67         eor ($67,x)
$14:8a43  a6 67         ldx $67
$14:8a45  65 36         adc $36
$14:8a47  a9 34 8e      lda #$8e34
$14:8a4a  19 1a 87      ora $871a,y
$14:8a4d  42 a0         wdm #$a0
$14:8a4f  93 2e         sta ($2e,s),y
$14:8a51  6f d6 15 7e   adc $7e15d6
$14:8a55  c0 ce 78      cpy #$78ce
$14:8a58  d2 fa         cmp ($fa)
$14:8a5a  84 3e         sty $3e
$14:8a5c  61 0e         adc ($0e,x)
$14:8a5e  88            dey
$14:8a5f  c0 21 d4      cpy #$d421
$14:8a62  09 01 c7      ora #$c701
$14:8a65  56 00         lsr $00,x
$14:8a67  82 b8 24      brl $af22
$14:8a6a  13 ad         ora ($ad,s),y
$14:8a6c  8a            txa
$14:8a6d  a5 58         lda $58
$14:8a6f  a6 1c         ldx $1c
$14:8a71  4d 74 d3      eor $d374
$14:8a74  29 10 cc      and #$cc10
$14:8a77  2c 03 c1      bit $c103
$14:8a7a  3c 81 7e      bit $7e81,x
$14:8a7d  a0 96 2c      ldy #$2c96
$14:8a80  e4 13         cpx $13
$14:8a82  f5 3c         sbc $3c,x
$14:8a84  e1 7c         sbc ($7c,x)
$14:8a86  10 00         bpl $8a88
$14:8a88  a9 0f 02      lda #$020f
$14:8a8b  c0 e0 2c      cpy #$2ce0
$14:8a8e  23 81         and $81,s
$14:8a90  40            rti
$14:8a91  60            rts
$14:8a92  63 b0         adc $b0,s
$14:8a94  17 a3         ora [$a3],y
$14:8a96  04 c7         tsb $c7
$14:8a98  80 3a         bra $8ad4
$14:8a9a  08            php
$14:8a9b  16 92         asl $92,x
$14:8a9d  31 a2         and ($a2),y
$14:8a9f  8e e8 23      stx $23e8
$14:8aa2  f4 69 cf      pea $cf69
$14:8aa5  27 61         and [$61]
$14:8aa7  e6 98         inc $98
$14:8aa9  f3 62         sbc ($62,s),y
$14:8aab  9b            txy
$14:8aac  7e 04 0b      ror $0b04,x
$14:8aaf  fb            xce
$14:8ab0  00 4f         brk #$4f
$14:8ab2  81 88         sta ($88,x)
$14:8ab4  70 17         bvs $8acd
$14:8ab6  f8            sed
$14:8ab7  07 7e         ora [$7e]
$14:8ab9  49 db d0      eor #$d0db
$14:8abc  57 d8         eor [$d8],y
$14:8abe  a5 be         lda $be
$14:8ac0  ee fa b8      inc $b8fa
$14:8ac3  1b            tcs
$14:8ac4  ea            nop
$14:8ac5  0f af 6f 7e   ora $7e6faf
$14:8ac9  a4 52         ldy $52
$14:8acb  74 4c         stz $4c,x
$14:8acd  52 8e         eor ($8e)
$14:8acf  78            sei
$14:8ad0  ef db 7e ee   sbc $ee7edb
$14:8ad4  d9 c6 17      cmp $17c6,y
$14:8ad7  6c 4e aa      jmp ($aa4e)
$14:8ada  ba            tsx
$14:8adb  b0 0b         bcs $8ae8
$14:8add  05 83         ora $83
$14:8adf  11 88         ora ($88),y
$14:8ae1  fa            plx
$14:8ae2  6d 3d 55      adc $553d
$14:8ae5  2e a6 e2      rol $e2a6
$14:8ae8  15 0e         ora $0e,x
$14:8aea  82 61 16      brl $a14e
$14:8aed  03 60         ora $60,s
$14:8aef  b8            clv
$14:8af0  7e 29 1f      ror $1f29,x
$14:8af3  cc 27 1a      cpy $1a27
$14:8af6  05 82         ora $82
$14:8af8  88            dey
$14:8af9  60            rts
$14:8afa  b3 10         lda ($10,s),y
$14:8afc  c3 40         cmp $40,s
$14:8afe  18            clc
$14:8aff  81 5e         sta ($5e,x)
$14:8b01  4b            phk
$14:8b02  57 c0         eor [$c0],y
$14:8b04  2f 55 68 b0   and $b06855
$14:8b08  18            clc
$14:8b09  28            plp
$14:8b0a  f0 07         beq $8b13
$14:8b0c  23 02         and $02,s
$14:8b0e  1b            tcs
$14:8b0f  11 fc         ora ($fc),y
$14:8b11  a0 c3 90      ldy #$90c3
$14:8b14  24 83         bit $83
$14:8b16  88            dey
$14:8b17  5b            tcd
$14:8b18  0b            phd
$14:8b19  00 ca         brk #$ca
$14:8b1b  5b            tcd
$14:8b1c  61 ff         adc ($ff,x)
$14:8b1e  7b            tdc
$14:8b1f  36 eb         rol $eb,x
$14:8b21  c3 4f         cmp $4f,s
$14:8b23  ee e5 24      inc $24e5
$14:8b26  9b            txy
$14:8b27  2f 54 ef e3   and $e3ef54
$14:8b2b  39 e2 ce      and $cee2,y
$14:8b2e  bc 71 ce      ldy $ce71,x
$14:8b31  84 3f         sty $3f
$14:8b33  79 03 b5      adc $b503,y
$14:8b36  c0 39 b0      cpy #$b039
$14:8b39  0e 24 03      asl $0324
$14:8b3c  8d 00 ab      sta $ab00
$14:8b3f  71 b1         adc ($b1),y
$14:8b41  78            sei
$14:8b42  69 2c 8e      adc #$8e2c
$14:8b45  a5 59         lda $59
$14:8b47  96 cc         stx $cc,y
$14:8b49  e3 d2         sbc $d2,s
$14:8b4b  5b            tcd
$14:8b4c  dd 92 f3      cmp $f392,x
$14:8b4f  66 93         ror $93
$14:8b51  c6 2e         dec $2e
$14:8b53  50 ce         bvc $8b23
$14:8b55  cc 1b 49      cpy $491b
$14:8b58  03 a0         ora $a0,s
$14:8b5a  40            rti
$14:8b5b  04 e0         tsb $e0
$14:8b5d  7f 2a 7d c2   adc $c27d2a,x
$14:8b61  1f 30 97 8c   ora $8c9730,x
$14:8b65  86 1f         stx $1f
$14:8b67  10 9f         bpl $8b08
$14:8b69  c4 23         cpy $23
$14:8b6b  f1 08         sbc ($08),y
$14:8b6d  79 fc 45      adc $45fc,y
$14:8b70  29 20 23      and #$2320
$14:8b73  09 fc 22      ora #$22fc
$14:8b76  0e 20 82      asl $8220
$14:8b79  41 ca         eor ($ca,x)
$14:8b7b  02 e5         cop #$e5
$14:8b7d  16 a0         asl $a0,x
$14:8b7f  95 c9         sta $c9,x
$14:8b81  b2 90         lda ($90)
$14:8b83  43 20         eor $20,s
$14:8b85  b6 52         ldx $52,y
$14:8b87  29 3b 94      and #$943b
$14:8b8a  47 eb         eor [$eb]
$14:8b8c  31 6a         and ($6a),y
$14:8b8e  d4 56         pei ($56)
$14:8b90  49 4d 8d      eor #$8d4d
$14:8b93  ca            dex
$14:8b94  e0 b0 68      cpx #$68b0
$14:8b97  54 12 30      mvn $30,$12
$14:8b9a  1f 09 3c 42   ora $423c09,x
$14:8b9e  de 83 08      dec $0883,x
$14:8ba1  65 ce         adc $ce
$14:8ba3  17 34         ora [$34],y
$14:8ba5  83 c2         sta $c2,s
$14:8ba7  11 61         ora ($61),y
$14:8ba9  05 f9         ora $f9
$14:8bab  e0 2f 90      cpx #$902f
$14:8bae  9f bc 1f f5   sta $f51fbc,x
$14:8bb2  08            php
$14:8bb3  fa            plx
$14:8bb4  c3 be         cmp $be,s
$14:8bb6  b8            clv
$14:8bb7  5b            tcd
$14:8bb8  cd 0e 75      cmp $750e
$14:8bbb  07 fc         ora [$fc]
$14:8bbd  27 ca         and [$ca]
$14:8bbf  1d f1 86      ora $86f1,x
$14:8bc2  7c e0 9f      jmp ($9fe0,x)
$14:8bc5  b8            clv
$14:8bc6  0f fa 07 fc   ora $fc07fa
$14:8bca  74 2b         stz $2b,x
$14:8bcc  88            dey
$14:8bcd  20 f0 08      jsr $08f0
$14:8bd0  44 02 60      mvp $60,$02
$14:8bd3  28            plp
$14:8bd4  56 16         lsr $16,x
$14:8bd6  c6 63         dec $63
$14:8bd8  f0 0f         beq $8be9
$14:8bda  03 0b         ora $0b,s
$14:8bdc  dc 31 04      jml [$0431]
$14:8bdf  32 04         and ($04)
$14:8be1  12 18         ora ($18)
$14:8be3  f5 18         sbc $18,x
$14:8be5  43 d0         eor $d0,s
$14:8be7  1e 40 63      asl $6340,x
$14:8bea  48            pha
$14:8beb  60            rts
$14:8bec  10 5f         bpl $8c4d
$14:8bee  42 63         wdm #$63
$14:8bf0  18            clc
$14:8bf1  09 58 02      ora #$0258
$14:8bf4  16 10         asl $10,x
$14:8bf6  d8            cld
$14:8bf7  08            php
$14:8bf8  3c 0b 81      bit $810b,x
$14:8bfb  04 81         tsb $81
$14:8bfd  3e 82 21      rol $2182,x
$14:8c00  08            php
$14:8c01  90 44         bcc $8c47
$14:8c03  28            plp
$14:8c04  12 0c         ora ($0c)
$14:8c06  02 f8         cop #$f8
$14:8c08  05 c1         ora $c1
$14:8c0a  02 81         cop #$81
$14:8c0c  3d 02 11      and $1102,x
$14:8c0f  08            php
$14:8c10  88            dey
$14:8c11  44 24 12      mvp $12,$24
$14:8c14  0a            asl a
$14:8c15  05 03         ora $03
$14:8c17  01 00         ora ($00,x)
$14:8c19  27 03         and [$03]
$14:8c1b  86 ca         stx $ca
$14:8c1d  1b            tcs
$14:8c1e  00 ea         brk #$ea
$14:8c20  ea            nop
$14:8c21  a1 17         lda ($17,x)
$14:8c23  7c 4d fe      jmp ($fe4d,x)
$14:8c26  39 36 b5      and $b536,y
$14:8c29  cd 97 41      cmp $4197
$14:8c2c  36 8e         rol $8e,x
$14:8c2e  47 20         eor [$20]
$14:8c30  1d d9 14      ora $14d9,x
$14:8c33  53 d7         eor ($d7,s),y
$14:8c35  49 db 4d      eor #$4ddb
$14:8c38  a9 28 50      lda #$5028
$14:8c3b  84 1e         sty $1e
$14:8c3d  c2 45         rep #$45
$14:8c3f  00 8e         brk #$8e
$14:8c41  66 33         ror $33
$14:8c43  04 80         tsb $80
$14:8c45  28            plp
$14:8c46  56 02         lsr $02,x
$14:8c48  20 9e 12      jsr $129e
$14:8c4b  84 c1         sty $c1
$14:8c4d  a0 50 58      ldy #$5850
$14:8c50  0c 16 0a      tsb $0a16
$14:8c53  42 08         wdm #$08
$14:8c55  1c 06 06      trb $0606
$14:8c58  31 05         and ($05),y
$14:8c5a  d9 41 e0      cmp $e041,y
$14:8c5d  50 78         bvc $8cd7
$14:8c5f  32 dc         and ($dc)
$14:8c61  60            rts
$14:8c62  0b            phd
$14:8c63  92 08         sta ($08)
$14:8c65  0f fe 01 bf   ora $bf01fe
$14:8c69  68            pla
$14:8c6a  0e be 01      asl $01be
$14:8c6d  75 a0         adc $a0,x
$14:8c6f  54 a8 1d      mvn $1d,$a8
$14:8c72  ae 47 af      ldx $af47
$14:8c75  52 cf         eor ($cf)
$14:8c77  0f fd 01 c2   ora $c201fd
$14:8c7b  35 0d         and $0d,x
$14:8c7d  ff 2b 7f ed   sbc $ed7f2b,x
$14:8c81  9b            txy
$14:8c82  fb            xce
$14:8c83  6a            ror a
$14:8c84  db            stp
$14:8c85  dc e4 53      jml [$53e4]
$14:8c88  e5 5e         sbc $5e
$14:8c8a  eb            xba
$14:8c8b  56 bd         lsr $bd,x
$14:8c8d  b6 bf         ldx $bf,y
$14:8c8f  d5 b7         cmp $b7,x
$14:8c91  94 f8         sty $f8,x
$14:8c93  1e dd f3      asl $f3dd,x
$14:8c96  c7 00         cmp [$00]
$14:8c98  d0 80         bne $8c1a
$14:8c9a  07 20         ora [$20]
$14:8c9c  04 52         tsb $52
$14:8c9e  70 5f         bvs $8cff
$14:8ca0  2c 74 eb      bit $eb74
$14:8ca3  8d fa a3      sta $a3fa
$14:8ca6  7f a8 5b ea   adc $ea5ba8,x
$14:8caa  17 7a         ora [$7a],y
$14:8cac  45 fe         eor $fe
$14:8cae  91 57         sta ($57),y
$14:8cb0  b4 26         ldy $26,x
$14:8cb2  8c 3f 30      sty $303f
$14:8cb5  f8            sed
$14:8cb6  04 7e         tsb $7e
$14:8cb8  20 31 28      jsr $2831
$14:8cbb  78            sei
$14:8cbc  d9 54 00      cmp $0054,y
$14:8cbf  1f c8 0a e8   ora $e80ac8,x
$14:8cc3  0a            asl a
$14:8cc4  0a            asl a
$14:8cc5  b9 02 c9      lda $c902,y
$14:8cc8  07 fa         ora [$fa]
$14:8cca  15 03         ora $03,x
$14:8ccc  82 2e 45      brl $d1fd
$14:8ccf  98            tya
$14:8cd0  21 f5         and ($f5,x)
$14:8cd2  81 c3         sta ($c3,x)
$14:8cd4  20 10 76      jsr $7610
$14:8cd7  38            sec
$14:8cd8  1d 61 50      ora $5061,x
$14:8cdb  8b            phb
$14:8cdc  50 15         bvc $8cf3
$14:8cde  14 21         trb $21
$14:8ce0  36 24         rol $24,x
$14:8ce2  d1 4a         cmp ($4a),y
$14:8ce4  00 a8         brk #$a8
$14:8ce6  60            rts
$14:8ce7  89 a0 47      bit #$47a0
$14:8cea  20 34 16      jsr $1634
$14:8ced  3e bf b4      rol $b4bf,x
$14:8cf0  d9 c6 22      cmp $22c6,y
$14:8cf3  11 c8         ora ($c8),y
$14:8cf5  64 72         stz $72
$14:8cf7  11 1c         ora ($1c),y
$14:8cf9  8a            txa
$14:8cfa  27 09         and [$09]
$14:8cfc  3c 30 88      bit $8830,x
$14:8cff  84 22         sty $22
$14:8d01  09 18 80      ora #$8018
$14:8d04  36 c9         rol $c9,x
$14:8d06  14 ca         trb $ca
$14:8d08  70 82         bvs $8c8c
$14:8d0a  3e 01 ee      rol $ee01,x
$14:8d0d  28            plp
$14:8d0e  00 7a         brk #$7a
$14:8d10  23 d4         and $d4,s
$14:8d12  94 c2         sty $c2,x
$14:8d14  fe 21 51      inc $5121,x
$14:8d17  c8            iny
$14:8d18  20 13 08      jsr $0813
$14:8d1b  80 60         bra $8d7d
$14:8d1d  03 62         ora $62,s
$14:8d1f  11 49         ora ($49),y
$14:8d21  00 64         brk #$64
$14:8d23  02 e1         cop #$e1
$14:8d25  00 88         brk #$88
$14:8d27  09 41 4a      ora #$4a41
$14:8d2a  4b            phk
$14:8d2b  fa            plx
$14:8d2c  80 8c         bra $8cba
$14:8d2e  04 61         tsb $61
$14:8d30  10 11         bpl $8d43
$14:8d32  f1 23         sbc ($23),y
$14:8d34  95 60         sta $60,x
$14:8d36  18            clc
$14:8d37  02 d0         cop #$d0
$14:8d39  e8            inx
$14:8d3a  0a            asl a
$14:8d3b  6e 57 29      ror $2957
$14:8d3e  01 78         ora ($78,x)
$14:8d40  23 13         and $13,s
$14:8d42  c8            iny
$14:8d43  a5 5a         lda $5a
$14:8d45  61 a1         adc ($a1,x)
$14:8d47  8f 60 6a 1c   sta $1c6a60
$14:8d4b  f9 26 7e      sbc $7e26,y
$14:8d4e  59 5e 88      eor $885e,y
$14:8d51  4b            phk
$14:8d52  20 13 c9      jsr $c913
$14:8d55  45 ba         eor $ba
$14:8d57  bd df bf      lda $bfdf,x
$14:8d5a  7f e7 df fb   adc $fbdfe7,x
$14:8d5e  d7 ee         cmp [$ee],y
$14:8d60  61 72         adc ($72,x)
$14:8d62  37 84         and [$84],y
$14:8d64  02 49         cop #$49
$14:8d66  30 ad         bmi $8d15
$14:8d68  4b            phk
$14:8d69  36 32         rol $32,x
$14:8d6b  2c ed 03      bit $03ed
$14:8d6e  7f 0e df 9e   adc $9edf0e,x
$14:8d72  c0 fe 06      cpy #$06fe
$14:8d75  f0 96         beq $8d0d
$14:8d77  20 8d 0a      jsr $0a8d
$14:8d7a  17 0f         ora [$0f],y
$14:8d7c  8a            txa
$14:8d7d  2c d9 65      bit $65d9
$14:8d80  02 81         cop #$81
$14:8d82  41 a0         eor ($a0,x)
$14:8d84  8b            phb
$14:8d85  60            rts
$14:8d86  7d 84 31      adc $3184,x
$14:8d89  78            sei
$14:8d8a  0b            phd
$14:8d8b  30 59         bmi $8de6
$14:8d8d  8a            txa
$14:8d8e  dc 20 0c      jml [$0c20]
$14:8d91  50 06         bvc $8d99
$14:8d93  03 98         ora $98,s
$14:8d95  1c c0 f1      trb $f1c0
$14:8d98  10 d9         bpl $8d73
$14:8d9a  42 22         wdm #$22
$14:8d9c  15 88         ora $88,x
$14:8d9e  05 42         ora $42
$14:8da0  80 db         bra $8d7d
$14:8da2  0e 03 44      asl $4403
$14:8da5  45 41         eor $41
$14:8da7  48            pha
$14:8da8  84 54         sty $54
$14:8daa  1b            tcs
$14:8dab  03 80         ora $80,s
$14:8dad  a0 60 1b      ldy #$1b60
$14:8db0  c1 d3         cmp ($d3,x)
$14:8db2  ba            tsx
$14:8db3  71 6e         adc ($6e),y
$14:8db5  da            phx
$14:8db6  59 b3 cc      eor $ccb3,y
$14:8db9  35 b3         and $b3,x
$14:8dbb  ed 2c fb      sbc $fb2c
$14:8dbe  51 33         eor ($33),y
$14:8dc0  b4 ec         ldy $ec,x
$14:8dc2  f1 10         sbc ($10),y
$14:8dc4  07 f8         ora [$f8]
$14:8dc6  72 00         adc ($00)
$14:8dc8  42 de         wdm #$de
$14:8dca  06 f0         asl $f0
$14:8dcc  71 01         adc ($01),y
$14:8dce  43 57         eor $57,s
$14:8dd0  b4 03         ldy $03,x
$14:8dd2  c2 bf         rep #$bf
$14:8dd4  60            rts
$14:8dd5  09 94 7e      ora #$7e94
$14:8dd8  41 3b         eor ($3b,x)
$14:8dda  92 06         sta ($06)
$14:8ddc  c0 67 14      cpy #$1467
$14:8ddf  01 41         ora ($41,x)
$14:8de1  c3 e2         cmp $e2,s
$14:8de3  11 78         ora ($78),y
$14:8de5  c0 c4 a0      cpy #$a0c4
$14:8de8  f0 88         beq $8d72
$14:8dea  34 26         bit $26,x
$14:8dec  1d 09 8f      ora $8f09,x
$14:8def  42 4a         wdm #$4a
$14:8df1  0c e1 12      tsb $12e1
$14:8df4  31 c0         and ($c0),y
$14:8df6  20 25 00      jsr $0025
$14:8df9  0f c2 c8 4b   ora $4bc8c2
$14:8dfd  c2 52         rep #$52
$14:8dff  02 94         cop #$94
$14:8e01  65 e9         adc $e9
$14:8e03  99 49 4d      sta $4d49,y
$14:8e06  af 51 30 ed   lda $ed3051
$14:8e0a  47 fa         eor [$fa]
$14:8e0c  35 4c         and $4c,x
$14:8e0e  cd 8b 17      cmp $178b
$14:8e11  7a            ply
$14:8e12  c6 f1         dec $f1
$14:8e14  a7 33         lda [$33]
$14:8e16  ee 0c bb      inc $bb0c
$14:8e19  a3 1c         lda $1c,s
$14:8e1b  f1 c7         sbc ($c7),y
$14:8e1d  7c 51 8f      jmp ($8f51,x)
$14:8e20  3c 2b eb      bit $eb2b,x
$14:8e23  0c f9 91      tsb $91f9
$14:8e26  81 c0         sta ($c0,x)
$14:8e28  50 09         bvc $8e33
$14:8e2a  02 54         cop #$54
$14:8e2c  44 e0 96      mvp $96,$e0
$14:8e2f  41 0a         eor ($0a,x)
$14:8e31  a7 91         lda [$91]
$14:8e33  80 04         bra $8e39
$14:8e35  e1 29         sbc ($29,x)
$14:8e37  d4 0c         pei ($0c)
$14:8e39  c5 70         cmp $70
$14:8e3b  0a            asl a
$14:8e3c  f4 9b e5      pea $e59b
$14:8e3f  a0 b3 d3      ldy #$d3b3
$14:8e42  33 b2         and ($b2,s),y
$14:8e44  9b            txy
$14:8e45  54 9a 47      mvn $47,$9a
$14:8e48  0c 8d 43      tsb $438d
$14:8e4b  a1 50         lda ($50,x)
$14:8e4d  49 b7 27      eor #$27b7
$14:8e50  eb            xba
$14:8e51  0a            asl a
$14:8e52  bf 60 67 3c   lda $3c6760,x
$14:8e56  69 7d 42      adc #$427d
$14:8e59  1f 30 87 44   ora $448730,x
$14:8e5d  60            rts
$14:8e5e  10 e8         bpl $8e48
$14:8e60  23 bc         and $bc,s
$14:8e62  21 90         and ($90,x)
$14:8e64  48            pha
$14:8e65  4c 16 13      jmp $1316
$14:8e68  0d 7b 94      ora $947b
$14:8e6b  32 1b         and ($1b)
$14:8e6d  1e 79 84      asl $8479,x
$14:8e70  32 03         and ($03)
$14:8e72  09 79 83      ora #$8379
$14:8e75  cc 22 80      cpy $8022
$14:8e78  70 84         bvs $8dfe
$14:8e7a  45 e3         eor $e3
$14:8e7c  50 54         bvc $8ed2
$14:8e7e  80 c8         bra $8e48
$14:8e80  26 01         rol $01
$14:8e82  20 9c 4c      jsr $4c9c
$14:8e85  37 13         and [$13],y
$14:8e87  0d 46 e3      ora $e346
$14:8e8a  d0 1b         bne $8ea7
$14:8e8c  04 a0         tsb $a0
$14:8e8e  84 42         sty $42
$14:8e90  31 28         and ($28),y
$14:8e92  c8            iny
$14:8e93  6a            ror a
$14:8e94  2a            rol a
$14:8e95  02 70         cop #$70
$14:8e97  0f 00 78 4a   ora $4a7800
$14:8e9b  01 05         ora ($05,x)
$14:8e9d  19 0c 1e      ora $1e0c,y
$14:8ea0  0b            phd
$14:8ea1  0b            phd
$14:8ea2  83 c3         sta $c3,s
$14:8ea4  e1 f0         sbc ($f0,x)
$14:8ea6  e8            inx
$14:8ea7  6c 3a 03      jmp ($033a)
$14:8eaa  04 82         tsb $82
$14:8eac  c0 20 b0      cpy #$b020
$14:8eaf  28            plp
$14:8eb0  3c 22 17      bit $1722,x
$14:8eb3  04 23         tsb $23
$14:8eb5  84 2a         sty $2a
$14:8eb7  2a            rol a
$14:8eb8  4b            phk
$14:8eb9  0c 06 83      tsb $8306
$14:8ebc  01 20         ora ($20,x)
$14:8ebe  d0 14         bne $8ed4
$14:8ec0  83 60         sta $60,s
$14:8ec2  55 2d         eor $2d,x
$14:8ec4  87 43         sta [$43]
$14:8ec6  e1 50         sbc ($50,x)
$14:8ec8  d0 25         bne $8eef
$14:8eca  43 20         eor $20,s
$14:8ecc  61 09         adc ($09,x)
$14:8ece  86 00         stx $00
$14:8ed0  ca            dex
$14:8ed1  3c 02 f0      bit $f002,x
$14:8ed4  17 82         ora [$82],y
$14:8ed6  31 24         and ($24),y
$14:8ed8  88            dey
$14:8ed9  5f a7 5f d9   eor $d95fa7,x
$14:8edd  e7 fe         sbc [$fe]
$14:8edf  b9 bf 9f      lda $9fbf,y
$14:8ee2  7f e3 97 e8   adc $e897e3,x
$14:8ee6  04 f2         tsb $f2
$14:8ee8  31 3c         and ($3c),y
$14:8eea  96 5b         stx $5b,y
$14:8eec  a8            tay
$14:8eed  dc 7a 17      jml [$177a]
$14:8ef0  0e c5 e3      asl $e3c5
$14:8ef3  a0 70 64      ldy #$6470
$14:8ef6  16 23         asl $23,x
$14:8ef8  f8            sed
$14:8ef9  1f 42 51 56   ora $565142,x
$14:8efd  89 7b 65      bit #$657b
$14:8f00  9d 38 d7      sta $d738,x
$14:8f03  86 a1         stx $a1
$14:8f05  a1 96         lda ($96,x)
$14:8f07  53 a2         eor ($a2,s),y
$14:8f09  12 43         ora ($43)
$14:8f0b  e8            inx
$14:8f0c  44 2d d2      mvp $d2,$2d
$14:8f0f  0e fc 03      asl $03fc
$14:8f12  fe a5 28      inc $28a5,x
$14:8f15  65 c8         adc $c8
$14:8f17  fa            plx
$14:8f18  0e f0 80      asl $80f0
$14:8f1b  2c 01 98      bit $9801
$14:8f1e  03 00         ora $00,s
$14:8f20  84 c0         sty $c0
$14:8f22  61 70         adc ($70,x)
$14:8f24  98            tya
$14:8f25  54 2c 8e      mvn $8e,$2c
$14:8f28  0b            phd
$14:8f29  10 80         bpl $8eab
$14:8f2b  8b            phb
$14:8f2c  c6 11         dec $11
$14:8f2e  09 81 42      ora #$4281
$14:8f31  e0 10 a8      cpx #$a810
$14:8f34  0c 2a 0b      tsb $0b2a
$14:8f37  40            rti
$14:8f38  c0 70 1a      cpy #$1a70
$14:8f3b  00 cf         brk #$cf
$14:8f3d  0a            asl a
$14:8f3e  87 03         sta [$03]
$14:8f40  a0 d7 0e      ldy #$0ed7
$14:8f43  85 41         sta $41
$14:8f45  b4 18         ldy $18,x
$14:8f47  06 78         asl $78
$14:8f49  50 28         bvc $8f73
$14:8f4b  19 0a 83      ora $830a,y
$14:8f4e  54 1a a1      mvn $a1,$1a
$14:8f51  88            dey
$14:8f52  14 07         trb $07
$14:8f54  42 51         wdm #$51
$14:8f56  6b            rtl
$14:8f57  99 c5 eb      sta $ebc5,y
$14:8f5a  52 68         eor ($68)
$14:8f5c  0c 42 39      tsb $3942
$14:8f5f  00 8c         brk #$8c
$14:8f61  2c c5 66      bit $66c5
$14:8f64  34 48         bit $48,x
$14:8f66  05 96         ora $96
$14:8f68  01 3f         ora ($3f,x)
$14:8f6a  80 47         bra $8fb3
$14:8f6c  23 11         and $11,s
$14:8f6e  80 f8         bra $8f68
$14:8f70  3e 4e 17      rol $174e,x
$14:8f73  14 8f         trb $8f
$14:8f75  c5 60         cmp $60
$14:8f77  d0 68         bne $8fe1
$14:8f79  44 22 00      mvp $00,$22
$14:8f7c  16 07         asl $07,x
$14:8f7e  c9 c8 03      cmp #$03c8
$14:8f81  c3 19         cmp $19,s
$14:8f83  80 43         bra $8fc8
$14:8f85  02 a0         cop #$a0
$14:8f87  18            clc
$14:8f88  58            cli
$14:8f89  44 3a 01      mvp $01,$3a
$14:8f8c  06 81         asl $81
$14:8f8e  c1 95         cmp ($95,x)
$14:8f90  e2 37         sep #$37
$14:8f92  56 10         lsr $10,x
$14:8f94  42 48         wdm #$48
$14:8f96  03 02         ora $02,s
$14:8f98  58            cli
$14:8f99  9b            txy
$14:8f9a  e4 95         cpx $95
$14:8f9c  e1 d6         sbc ($d6,x)
$14:8f9e  c5 52         cmp $52
$14:8fa0  ac 53 0e      ldy $0e53
$14:8fa3  26 ba         rol $ba
$14:8fa5  69 94         adc #$94
$14:8fa7  88            dey
$14:8fa8  66 16         ror $16
$14:8faa  61 e0         adc ($e0,x)
$14:8fac  82 40 bf      brl $4eef
$14:8faf  50 4b         bvc $8ffc
$14:8fb1  16 72         asl $72,x
$14:8fb3  09 fa         ora #$fa
$14:8fb5  9e 70 be      stz $be70,x
$14:8fb8  10 c8         bpl $8f82
$14:8fba  07 e0         ora [$e0]
$14:8fbc  ba            tsx
$14:8fbd  03 d2         ora $d2,s
$14:8fbf  61 01         adc ($01,x)
$14:8fc1  d3 cf         cmp ($cf,s),y
$14:8fc3  cf 40 0f 05   cmp $050f40
$14:8fc7  02 81         cop #$81
$14:8fc9  60            rts
$14:8fca  88            dey
$14:8fcb  48            pha
$14:8fcc  26 12         rol $12
$14:8fce  00 41         brk #$41
$14:8fd0  87 c1         sta [$c1]
$14:8fd2  14 a1         trb $a1
$14:8fd4  d4 3f         pei ($3f)
$14:8fd6  41 c4         eor ($c4,x)
$14:8fd8  e0 30         cpx #$30
$14:8fda  23 9f         and $9f,s
$14:8fdc  a3 c9         lda $c9,s
$14:8fde  20 0d 40      jsr $400d
$14:8fe1  3f 78 dd 61   and $61dd78,x
$14:8fe5  f1 b8         sbc ($b8),y
$14:8fe7  5c 36 17 0f   jml $0f1736
$14:8feb  87 47         sta [$47]
$14:8fed  e1 d1         sbc ($d1,x)
$14:8fef  b8            clv
$14:8ff0  74 76         stz $76,x
$14:8ff2  1f 1e 8f c7   ora $c78f1e,x
$14:8ff6  e3 70         sbc $70,s
$14:8ff8  48            pha
$14:8ff9  6c 48 02      jmp ($0248)
$14:8ffc  11 d8         ora ($d8),y
$14:8ffe  14 66         trb $66
$14:9000  0c 07 08      tsb $0807
$14:9003  d4 14         pei ($14)
$14:9005  16 17         asl $17,x
$14:9007  0e c6 c2      asl $c2c6
$14:900a  b1 a0         lda ($a0),y
$14:900c  a8            tay
$14:900d  6c 3e 1f      jmp ($1f3e)
$14:9010  0f c7 c3 50   ora $50c3c7
$14:9014  19 0f c7      ora $c70f,y
$14:9017  e3 b1         sbc $b1,s
$14:9019  20 09 0e      jsr $0e09
$14:901c  a0 46         ldy #$46
$14:901e  01 20         ora ($20,x)
$14:9020  84 7c         sty $7c
$14:9022  05 20         ora $20
$14:9024  12 07         ora ($07)
$14:9026  90 43         bcc $906b
$14:9028  63 f0         adc $f0,s
$14:902a  b8            clv
$14:902b  f4 2e 39      pea $392e
$14:902e  07 8e         ora [$8e]
$14:9030  c5 e2         cmp $e2
$14:9032  f0 78         beq $90ac
$14:9034  fc 3e 13      jsr ($133e,x)
$14:9037  0a            asl a
$14:9038  8a            txa
$14:9039  c7 a0         cmp [$a0]
$14:903b  24 10         bit $10
$14:903d  8e 40 c0      stx $c040
$14:9040  a1 15         lda ($15,x)
$14:9042  85 01         sta $01
$14:9044  42 13         wdm #$13
$14:9046  16 0b         asl $0b,x
$14:9048  06 80         asl $80
$14:904a  a0 3f         ldy #$3f
$14:904c  0d c7 c3      ora $c3c7
$14:904f  31 70         and ($70),y
$14:9051  0c 07 63      tsb $6307
$14:9054  e1 38         sbc ($38,x)
$14:9056  e8            inx
$14:9057  4a            lsr a
$14:9058  0b            phd
$14:9059  e5 98         sbc $98
$14:905b  b0 19         bcs $9076
$14:905d  43 71         eor $71,s
$14:905f  40            rti
$14:9060  32 84         and ($84)
$14:9062  63 c1         adc $c1,s
$14:9064  18            clc
$14:9065  96 4f         stx $4f,y
$14:9067  2a            rol a
$14:9068  57 ed         eor [$ed],y
$14:906a  9d fb 5b      sta $5bfb,x
$14:906d  7a            ply
$14:906e  c5 dc         cmp $dc
$14:9070  36 32         rol $32,x
$14:9072  cb            wai
$14:9073  14 02         trb $02
$14:9075  49 00         eor #$00
$14:9077  9e 40 2d      stz $2d40,x
$14:907a  d0 0e         bne $908a
$14:907c  fc 03 ff      jsr ($ff03,x)
$14:907f  04 ff         tsb $ff
$14:9081  c3 bf         cmp $bf,s
$14:9083  f1 cb         sbc ($cb),y
$14:9085  f4 62 79      pea $7962
$14:9088  0f 84 41 60   ora $604184
$14:908c  90 35         bcc $90c3
$14:908e  e8            inx
$14:908f  2f 9e 0f 08   and $080f9e
$14:9093  81 c1         sta ($c1,x)
$14:9095  a0 10         ldy #$10
$14:9097  35 c1         and $c1,x
$14:9099  32 52         and ($52)
$14:909b  16 af         asl $af,x
$14:909d  08            php
$14:909e  2c 2e 09      bit $092e
$14:90a1  0f 83 c3 c6   ora $c6c383
$14:90a5  41 1f         eor ($1f,x)
$14:90a7  85 44         sta $44
$14:90a9  e1 51         sbc ($51,x)
$14:90ab  b8            clv
$14:90ac  52 44         eor ($44)
$14:90ae  16 61         asl $61,x
$14:90b0  1b            tcs
$14:90b1  06 01         asl $01
$14:90b3  24 09         bit $09
$14:90b5  21 11         and ($11,x)
$14:90b7  7b            tdc
$14:90b8  84 12         sty $12
$14:90ba  a1 a0         lda ($a0,x)
$14:90bc  b8            clv
$14:90bd  4a            lsr a
$14:90be  2e 13 0a      rol $0a13
$14:90c1  87 e2         sta [$e2]
$14:90c3  a1 e8         lda ($e8,x)
$14:90c5  ac 76 3b      ldy $3b76
$14:90c8  00 f0         brk #$f0
$14:90ca  98            tya
$14:90cb  68            pla
$14:90cc  2b            pld
$14:90cd  06 00         asl $00
$14:90cf  90 76         bcc $9147
$14:90d1  3d 11 07      and $0711,x
$14:90d4  28            plp
$14:90d5  07 c2         ora [$c2]
$14:90d7  e1 88         sbc ($88,x)
$14:90d9  98            tya
$14:90da  72 15         adc ($15)
$14:90dc  28            plp
$14:90dd  a6 05         ldx $05
$14:90df  30 c0         bmi $90a1
$14:90e1  52 82         eor ($82)
$14:90e3  a4 07         ldy $07
$14:90e5  ff 84 3c 43   sbc $433c84,x
$14:90e9  ef 59 81 09   sbc $098159
$14:90ed  7b            tdc
$14:90ee  00 4e         brk #$4e
$14:90f0  18            clc
$14:90f1  41 3c         eor ($3c,x)
$14:90f3  72 04         adc ($04)
$14:90f5  f0 88         beq $907f
$14:90f7  16 4c         asl $4c,x
$14:90f9  44 e4 f2      mvp $f2,$e4
$14:90fc  79 c0 e4      adc $e4c0,y
$14:90ff  a0 70         ldy #$70
$14:9101  15 10         ora $10,x
$14:9103  09 7a         ora #$7a
$14:9105  40            rti
$14:9106  a9 34         lda #$34
$14:9108  78            sei
$14:9109  68            pla
$14:910a  11 c1         ora ($c1),y
$14:910c  80 a0         bra $90ae
$14:910e  68            pla
$14:910f  3c 09 70      bit $7009,x
$14:9112  11 68         ora ($68),y
$14:9114  e4 a1         cpx $a1
$14:9116  30 38         bmi $9150
$14:9118  54 02 1b      mvn $1b,$02
$14:911b  03 85         ora $85,s
$14:911d  c1 e1         cmp ($e1,x)
$14:911f  d0 18         bne $9139
$14:9121  54 1c 8e      mvn $8e,$1c
$14:9124  c6 18         dec $18
$14:9126  35 15         and $15,x
$14:9128  01 a8         ora ($a8,x)
$14:912a  18            clc
$14:912b  0e 86 03      asl $0386
$14:912e  41 d0         eor ($d0,x)
$14:9130  f0 17         beq $9149
$14:9132  8c d2 84      sty $84d2
$14:9135  74 8e         stz $8e,x
$14:9137  c3 e2         cmp $e2,s
$14:9139  b0 f8         bcs $9133
$14:913b  bc 9e 2f      ldy $2f9e,x
$14:913e  35 8b         and $8b,x
$14:9140  cf 62 73 f9   cmp $f97362
$14:9144  d4 fa         pei ($fa)
$14:9146  55 36         eor $36,x
$14:9148  85 4d         sta $4d
$14:914a  61 d3         adc ($d3,x)
$14:914c  19 34 66      ora $6634,y
$14:914f  69 0b         adc #$0b
$14:9151  9e 40 c0      stz $c040,x
$14:9154  e1 3d         sbc ($3d,x)
$14:9156  81 cd         sta ($cd,x)
$14:9158  61 77         adc ($77,x)
$14:915a  8a            txa
$14:915b  84 e2         sty $e2
$14:915d  a9 38         lda #$38
$14:915f  be 5a 2f      ldx $2f5a,y
$14:9162  94 c9         sty $c9,x
$14:9164  e5 62         sbc $62
$14:9166  f9 d4 b6      sbc $b6d4,y
$14:9169  7d 2e 9d      adc $9d2e,x
$14:916c  0d 67 53      ora $5367
$14:916f  51 f4         eor ($f4),y
$14:9171  c4 08         cpy $08
$14:9173  c3 69         cmp $69,s
$14:9175  c8            iny
$14:9176  de 70 35      dec $3570,x
$14:9179  95 0d         sta $0d,x
$14:917b  25 62         and $62
$14:917d  1d 1f 8f      ora $8f1f,x
$14:9180  47 e2         eor [$e2]
$14:9182  b3 f8         lda ($f8,s),y
$14:9184  ac d2 2b      ldy $2bd2
$14:9187  2f 9d 8e 02   and $028e9d
$14:918b  43 1b         eor $1b,s
$14:918d  9e c6 e4      stz $e4c6,x
$14:9190  83 f0         sta $f0,s
$14:9192  9d c1 00      sta $00c1,x
$14:9195  a1 2e         lda ($2e,x)
$14:9197  88            dey
$14:9198  91 c2         sta ($c2),y
$14:919a  41 1f         eor ($1f,x)
$14:919c  02 87         cop #$87
$14:919e  a3 f1         lda $f1,s
$14:91a0  a8            tay
$14:91a1  28            plp
$14:91a2  07 f3         ora [$f3]
$14:91a4  a1 fc         lda ($fc,x)
$14:91a6  ea            nop
$14:91a7  69 3a         adc #$3a
$14:91a9  98            tya
$14:91aa  ca            dex
$14:91ab  c5 a2         cmp $a2
$14:91ad  f1 7c         sbc ($7c),y
$14:91af  ac 0b 43      ldy $430b
$14:91b2  49 7c         eor #$7c
$14:91b4  c0 18         cpy #$18
$14:91b6  c2 49         rep #$49
$14:91b8  d8            cld
$14:91b9  86 7c         stx $7c
$14:91bb  35 1d         and $1d,x
$14:91bd  4d 67 41      eor $4167
$14:91c0  12 50         ora ($50)
$14:91c2  b8            clv
$14:91c3  04 4a         tsb $4a
$14:91c5  05 2b         ora $2b
$14:91c7  95 5f         sta $5f,x
$14:91c9  eb            xba
$14:91ca  be fd cc      ldx $ccfd,y
$14:91cd  fe 76 ca      inc $ca76,x
$14:91d0  28            plp
$14:91d1  7c 11 de      jmp ($de11,x)
$14:91d4  11 49         ora ($49),y
$14:91d6  fc 46 dd      jsr ($dd46,x)
$14:91d9  30 e7         bmi $91c2
$14:91db  f2 7e         sbc ($7e)
$14:91dd  cc a2 e8      cpy $e8a2
$14:91e0  44 3d 10      mvp $10,$3d
$14:91e3  8f 45 83 fd   sta $fd8345
$14:91e7  aa            tax
$14:91e8  9b            txy
$14:91e9  cf 65 fc 36   cmp $36fc65
$14:91ed  51 78         eor ($78),y
$14:91ef  26 1f         rol $1f
$14:91f1  08            php
$14:91f2  c4 53         cpy $53
$14:91f4  f9 88 bb      sbc $bb88,y
$14:91f7  73 3e         adc ($3e,s),y
$14:91f9  7d 29 ec      adc $ec29,x
$14:91fc  26 3f         rol $3f
$14:91fe  1d 19 04      ora $0419,x
$14:9201  e2 2b         sep #$2b
$14:9203  3a            dec a
$14:9204  8f 8e 42 7f   sta $7f428e
$14:9208  2f 97 ca a6   and $a6ca97
$14:920c  51 f2         eor ($f2),y
$14:920e  58            cli
$14:920f  48            pha
$14:9210  27 10         and [$10]
$14:9212  79 d4 15      adc $15d4,y
$14:9215  8a            txa
$14:9216  52 a8         eor ($a8)
$14:9218  ac d6 1f      ldy $1fd6
$14:921b  e8            inx
$14:921c  d0 7a         bne $9298
$14:921e  33 1e         and ($1e,s),y
$14:9220  8f e1 74 2f   sta $2f74e1
$14:9224  16 c9         asl $c9,x
$14:9226  a5 b3         lda $b3
$14:9228  a9 54         lda #$54
$14:922a  ea            nop
$14:922b  47 24         eor [$24]
$14:922d  1d c8 c7      ora $c7c8,x
$14:9230  92 b9         sta ($b9)
$14:9232  a0 ee         ldy #$ee
$14:9234  68            pla
$14:9235  39 9b 07      and $079b,y
$14:9238  38            sec
$14:9239  79 27 1a      adc $1a27,y
$14:923c  cb            wai
$14:923d  84 1a         sty $1a
$14:923f  05 02         ora $02
$14:9241  83 40         sta $40,s
$14:9243  20 8f 10      jsr $108f
$14:9246  82 c0 de      brl $7109
$14:9249  81 07         sta ($07,x)
$14:924b  80 bd         bra $920a
$14:924d  c2 03         rep #$03
$14:924f  00 7f         brk #$7f
$14:9251  84 0c         sty $0c
$14:9253  00 29         brk #$29
$14:9255  f0 02         beq $9259
$14:9257  92 7c         sta ($7c)
$14:9259  b0 10         bcs $926b
$14:925b  0d 00 48      ora $4800
$14:925e  70 12         bvs $9272
$14:9260  0a            asl a
$14:9261  06 82         asl $82
$14:9263  61 e0         adc ($e0,x)
$14:9265  a8            tay
$14:9266  70 01         bvs $9269
$14:9268  4a            lsr a
$14:9269  0a            asl a
$14:926a  59 00 08      eor $0800,y
$14:926d  1f e3 05 79   ora $7905e3,x
$14:9271  80 00         bra $9273
$14:9273  06 a0         asl $a0
$14:9275  f7 01         sbc [$01],y
$14:9277  98            tya
$14:9278  3c 80 3f      bit $3f80,x
$14:927b  60            rts
$14:927c  51 88         eor ($88),y
$14:927e  4e 22 11      lsr $1122
$14:9281  89 84         bit #$84
$14:9283  a2 61         ldx #$61
$14:9285  20 98 64      jsr $6498
$14:9288  24 11         bit $11
$14:928a  0d 05 40      ora $4005
$14:928d  26 05         rol $05
$14:928f  fd 7a 04      sbc $047a,x
$14:9292  32 07         and ($07)
$14:9294  0b            phd
$14:9295  82 c2 20      brl $b35a
$14:9298  f0 d8         beq $9272
$14:929a  14 26         trb $26
$14:929c  0d 07 86      ora $8607
$14:929f  42 a0         wdm #$a0
$14:92a1  a0 96         ldy #$96
$14:92a3  0f b7 80 34   ora $3480b7
$14:92a7  33 0b         and ($0b,s),y
$14:92a9  07 43         ora [$43]
$14:92ab  c1 a8         cmp ($a8,x)
$14:92ad  a8            tay
$14:92ae  56 36         lsr $36,x
$14:92b0  19 8d 05      ora $058d,y
$14:92b3  a2 60         ldx #$60
$14:92b5  0d 40 52      ora $5240
$14:92b8  50 20         bvc $92da
$14:92ba  01 e0         ora ($e0,x)
$14:92bc  81 43         sta ($43,x)
$14:92be  62 90 a8      per $3b51
$14:92c1  f4 1a 37      pea $371a
$14:92c4  07 88         ora [$88]
$14:92c6  c3 e0         cmp $e0,s
$14:92c8  d0 e8         bne $92b2
$14:92ca  54 19 76      mvn $76,$19
$14:92cd  00 72         brk #$72
$14:92cf  04 a3         tsb $a3
$14:92d1  fc 9f e1      jsr ($e19f,x)
$14:92d4  50 b0         bvc $9286
$14:92d6  07 00         ora [$00]
$14:92d8  34 05         bit $05,x
$14:92da  50 2a         bvc $9306
$14:92dc  87 22         sta [$22]
$14:92de  e1 a8         sbc ($a8,x)
$14:92e0  98            tya
$14:92e1  75 23         adc $23,x
$14:92e3  01 10         ora ($10,x)
$14:92e5  08            php
$14:92e6  80 78         bra $9360
$14:92e8  1c 64 e1      trb $e164
$14:92eb  2f 04 02 1d   and $1d0204
$14:92ef  2e 86 4f      rol $4f86
$14:92f2  21 b3         and ($b3,x)
$14:92f4  88            dey
$14:92f5  ec f2 73      cpx $73f2
$14:92f8  28            plp
$14:92f9  9c ce 27      stz $27ce
$14:92fc  77 87         adc [$87],y
$14:92fe  d8            cld
$14:92ff  49 63         eor #$63
$14:9301  73 78         adc ($78,s),y
$14:9303  5c ce 1c 03   jml $031cce
$14:9307  09 3d         ora #$3d
$14:9309  78            sei
$14:930a  0e 16 78      asl $7816
$14:930d  e0 2c         cpx #$2c
$14:930f  3e 15 ce      rol $ce15,x
$14:9312  85 63         sta $63
$14:9314  31 1c         and ($1c),y
$14:9316  09 86         ora #$86
$14:9318  72 28         adc ($28)
$14:931a  17 0e         ora [$0e],y
$14:931c  e4 78         cpx $78
$14:931e  36 18         rol $18,x
$14:9320  c6 d0         dec $d0
$14:9322  5d 3d 97      eor $973d,x
$14:9325  01 18         ora ($18,x)
$14:9327  79 2f 42      adc $422f,y
$14:932a  70 f3         bvs $931f
$14:932c  4e 05 61      lsr $6105
$14:932f  1b            tcs
$14:9330  9f c7 a7 cf   sta $cfa7c7,x
$14:9334  36 9c         rol $9c,x
$14:9336  bf 06 69 0b   lda $0b6906,x
$14:933a  9a            txs
$14:933b  80 a2         bra $92df
$14:933d  3c 0b 0b      bit $0b0b,x
$14:9340  c5 72         cmp $72
$14:9342  71 1c         adc ($1c),y
$14:9344  9c 4d 27      stz $274d
$14:9347  93 40         sta ($40,s),y
$14:9349  b8            clv
$14:934a  c7 03         cmp [$03]
$14:934c  67 f0         adc [$f0]
$14:934e  e6 7c         inc $7c
$14:9350  38            sec
$14:9351  9f 83 18 09   sta $091883,x
$14:9355  da            phx
$14:9356  fb            xce
$14:9357  25 fd         and $fd
$14:9359  6c 2a d5      jmp ($d52a)
$14:935c  08            php
$14:935d  ec 06 5f      cpx $5f06
$14:9360  0c 9b c8      tsb $c89b
$14:9363  a1 70         lda ($70,x)
$14:9365  18            clc
$14:9366  8c 47 45      sty $4547
$14:9369  df 8b fb 67   cmp $67fb8b,x
$14:936d  f6 9b         inc $9b,x
$14:936f  35 ee         and $ee,x
$14:9371  61 1f         adc ($1f,x)
$14:9373  8c 4b e3      sty $e34b
$14:9376  91 78         sta ($78),y
$14:9378  74 7f         stz $7f,x
$14:937a  af 84 f6 da   lda $daf684
$14:937e  77 47         adc [$47],y
$14:9380  20 81 5a      jsr $5a81
$14:9383  20 1d ce      jsr $ce1d
$14:9386  25 42         and $42
$14:9388  81 d8         sta ($d8,x)
$14:938a  84 6e         sty $6e
$14:938c  2d f1 6f      and $6ff1
$14:938f  dd 53 dd      cmp $dd53,x
$14:9392  e8            inx
$14:9393  df 67 3e 93   cmp $933e67,x
$14:9397  8f 26 e3 d1   sta $d1e326
$14:939b  e0 9c         cpx #$9c
$14:939d  46 a7         lsr $a7
$14:939f  4a            lsr a
$14:93a0  f0 8c         beq $932e
$14:93a2  ce 23 2f      dec $2f23
$14:93a5  80 7c         bra $9423
$14:93a7  2c d6 1e      bit $1ed6
$14:93aa  bf 09 b8 18   lda $18b809,x
$14:93ae  23 c0         and $c0,s
$14:93b0  76 e8         ror $e8,x
$14:93b2  33 82         and ($82,s),y
$14:93b4  b9 c8 a6      lda $a6c8,y
$14:93b7  05 c2         ora $c2
$14:93b9  39 14 ae      and $ae14,y
$14:93bc  36 00         rol $00,x
$14:93be  38            sec
$14:93bf  3a            dec a
$14:93c0  cb            wai
$14:93c1  83 7c         sta $7c,s
$14:93c3  37 82         and [$82],y
$14:93c5  60            rts
$14:93c6  bc 79 3f      ldy $3f79,x
$14:93c9  5e 4d d7      lsr $d74d,x
$14:93cc  9b            txy
$14:93cd  70 2b         bvs $93fa
$14:93cf  08            php
$14:93d0  24 0a         bit $0a
$14:93d2  15 06         ora $06,x
$14:93d4  78            sei
$14:93d5  84 2e         sty $2e
$14:93d7  0d 09 82      ora $8209
$14:93da  45 a1         eor $a1
$14:93dc  d1 58         cmp ($58),y
$14:93de  64 52         stz $52
$14:93e0  19 01 80      ora $8001,y
$14:93e3  3f d2 06 04   and $0406d2,x
$14:93e7  30 38         bmi $9421
$14:93e9  7c 2c 1d      jmp ($1d2c,x)
$14:93ec  0b            phd
$14:93ed  05 40         ora $40
$14:93ef  24 7a         bit $7a
$14:93f1  89 80         bit #$80
$14:93f3  64 31         stz $31
$14:93f5  13 0c         ora ($0c,s),y
$14:93f7  04 00         tsb $00
$14:93f9  3e dc 01      rol $01dc,x
$14:93fc  41 c3         eor ($c3,x)
$14:93fe  20 c2 f0      jsr $f0c2
$14:9401  85 c1         sta $c1
$14:9403  e1 cf         sbc ($cf,x)
$14:9405  21 78         and ($78,x)
$14:9407  94 7a         sty $7a,x
$14:9409  06 ff         asl $ff
$14:940b  22 10 3f d8   jsl $d83f10
$14:940f  84 1b         sty $1b
$14:9411  0d 05 a2      ora $a205
$14:9414  60            rts
$14:9415  51 0f         eor ($0f),y
$14:9417  40            rti
$14:9418  68            pla
$14:9419  7a            ply
$14:941a  11 8a         ora ($8a),y
$14:941c  c4 43         cpy $43
$14:941e  21 b8         and ($b8,x)
$14:9420  a0 0a         ldy #$0a
$14:9422  14 5a         trb $5a
$14:9424  1e 03 40      asl $4003,x
$14:9427  97 c2         sta [$c2],y
$14:9429  13 07         ora ($07,s),y
$14:942b  86 c0         stx $c0
$14:942d  e1 50         sbc ($50,x)
$14:942f  58            cli
$14:9430  79 b8 62      adc $62b8,y
$14:9433  f0 b8         beq $93ed
$14:9435  94 39         sty $39,x
$14:9437  f2 04         sbc ($04)
$14:9439  21 3f         and ($3f,x)
$14:943b  bb            tyx
$14:943c  fc af 91      jsr ($91af,x)
$14:943f  0d a6 62      ora $62a6
$14:9442  e9 d8         sbc #$d8
$14:9444  9a            txs
$14:9445  46 28         lsr $28
$14:9447  18            clc
$14:9448  88            dey
$14:9449  85 60         sta $60
$14:944b  32 19         and ($19)
$14:944d  49 c1         eor #$c1
$14:944f  ac 2c 10      ldy $102c
$14:9452  09 01         ora #$01
$14:9454  a0 6e         ldy #$6e
$14:9456  10 0d         bpl $9465
$14:9458  00 a0         brk #$a0
$14:945a  de 21 0c      dec $0c21,x
$14:945d  78            sei
$14:945e  0b            phd
$14:945f  ec a3 4b      cpx $4ba3
$14:9462  41 7d         eor ($7d,x)
$14:9464  80 05         bra $946b
$14:9466  80 ed         bra $9455
$14:9468  74 8c         stz $8c,x
$14:946a  23 c3         and $c3,s
$14:946c  e1 18         sbc ($18,x)
$14:946e  2c 87 51      bit $5187
$14:9471  ac 7a c9      ldy $c97a
$14:9474  81 a4         sta ($a4,x)
$14:9476  9b            txy
$14:9477  f0 2d         beq $94a6
$14:9479  0c 16 0a      tsb $0a16
$14:947c  21 10         and ($10,x)
$14:947e  21 05         and ($05,x)
$14:9480  0a            asl a
$14:9481  84 42         sty $42
$14:9483  07 89         ora [$89]
$14:9485  40            rti
$14:9486  a0 4e         ldy #$4e
$14:9488  e0 7c         cpx #$7c
$14:948a  01 08         ora ($08,x)
$14:948c  5e c2 01      lsr $01c2,x
$14:948f  37 f0         and [$f0],y
$14:9491  1f d7 00 01   ora $0100d7,x
$14:9495  33 fc         and ($fc,s),y
$14:9497  85 e6         sta $e6
$14:9499  41 20         eor ($20,x)
$14:949b  a8            tay
$14:949c  44 24 90      mvp $90,$24
$14:949f  48            pha
$14:94a0  54 0a 08      mvn $08,$0a
$14:94a3  26 01         rol $01
$14:94a5  e2 0c         sep #$0c
$14:94a7  c1 4e         cmp ($4e,x)
$14:94a9  03 70         ora $70,s
$14:94ab  3f 00 ed de   and $deed00,x
$14:94af  e8            inx
$14:94b0  59 a2 c4      eor $c4a2,y
$14:94b3  28            plp
$14:94b4  c0 78         cpy #$78
$14:94b6  50 82         bvc $943a
$14:94b8  6c 1c 7c      jmp ($7c1c)
$14:94bb  b0 88         bcs $9445
$14:94bd  8f 3b ca d3   sta $d3ca3b
$14:94c1  d8            cld
$14:94c2  be d6 f1      ldx $f1d6,y
$14:94c5  e2 c5         sep #$c5
$14:94c7  a1 d1         lda ($d1,x)
$14:94c9  a8            tay
$14:94ca  34 66         bit $66,x
$14:94cc  0e ef 08      asl $08ef
$14:94cf  a4 32         ldy $32
$14:94d1  0d 0e 82      ora $820e
$14:94d4  c3 20         cmp $20,s
$14:94d6  10 c8         bpl $94a0
$14:94d8  0c 01 fe      tsb $fe01
$14:94db  02 60         cop #$60
$14:94dd  7f 84 0c 08   adc $080c84,x
$14:94e1  60            rts
$14:94e2  70 f4         bvs $94d8
$14:94e4  4c 3f 12      jmp $123f
$14:94e7  09 c4         ora #$c4
$14:94e9  82 91 70      brl $057d
$14:94ec  d4 4c         pei ($4c)
$14:94ee  33 11         and ($11,s),y
$14:94f0  0d 40 58      ora $5840
$14:94f3  22 1c 08 00   jsl $00081c
$14:94f7  7c b0 02      jmp ($02b0,x)
$14:94fa  01 f0         ora ($f0,x)
$14:94fc  09 0e         ora #$0e
$14:94fe  2b            pld
$14:94ff  0b            phd
$14:9500  78            sei
$14:9501  84 56         sty $56
$14:9503  18            clc
$14:9504  33 07         and ($07,s),y
$14:9506  d8            cld
$14:9507  42 a0         wdm #$a0
$14:9509  d1 a8         cmp ($a8),y
$14:950b  2c 5c ee      bit $ee5c
$14:950e  20 94 03      jsr $0394
$14:9511  91 28         sta ($28),y
$14:9513  b8            clv
$14:9514  11 8e         ora ($8e),y
$14:9516  c4 43         cpy $43
$14:9518  91 10         sta ($10),y
$14:951a  d2 4e         cmp ($4e)
$14:951c  3a            dec a
$14:951d  91 82         sta ($82),y
$14:951f  b8            clv
$14:9520  65 33         adc $33
$14:9522  01 00         ora ($00,x)
$14:9524  14 81         trb $81
$14:9526  7c 84 e4      jmp ($e484,x)
$14:9529  29 0b         and #$0b
$14:952b  01 28         ora ($28,x)
$14:952d  62 50 e1      per $7680
$14:9530  78            sei
$14:9531  47 a0         eor [$a0]
$14:9533  51 98         eor ($98),y
$14:9535  21 d4         and ($d4,x)
$14:9537  06 64         asl $64
$14:9539  33 00         and ($00,s),y
$14:953b  0b            phd
$14:953c  21 5b         and ($5b,x)
$14:953e  f9 30 ca      sbc $ca30,y
$14:9541  16 05         asl $05,x
$14:9543  26 9f         rol $9f
$14:9545  42 c0         wdm #$c0
$14:9547  99 51 43      sta $4351,y
$14:954a  0f 70 3c a2   ora $a23c70
$14:954e  c5 90         cmp $90
$14:9550  b0 43         bcs $9595
$14:9552  4d 64 c3      eor $c364
$14:9555  c9 38         cmp #$38
$14:9557  fa            plx
$14:9558  4a            lsr a
$14:9559  19 e0 55      ora $55e0,y
$14:955c  44 e9 37      mvp $37,$e9
$14:955f  d8            cld
$14:9560  be 83 f0      ldx $f083,y
$14:9563  05 82         ora $82
$14:9565  f8            sed
$14:9566  22 70 f9 7c   jsl $7cf970
$14:956a  72 5f         adc ($5f)
$14:956c  18            clc
$14:956d  af cc 1f 61   lda $611fcc
$14:9571  03 81         ora $81,s
$14:9573  c3 e1         cmp $e1,s
$14:9575  f1 f8         sbc ($f8),y
$14:9577  fc fe 7f      jsr ($7ffe,x)
$14:957a  7c be 5e      jmp ($5ebe,x)
$14:957d  2f 1f 00 58   and $58001f
$14:9581  92 89         sta ($89)
$14:9583  e2 51         sep #$51
$14:9585  b8            clv
$14:9586  3c 5e 1c      bit $1c5e,x
$14:9589  f7 27         sbc [$27],y
$14:958b  78            sei
$14:958c  80 16         bra $95a4
$14:958e  7d 3e 03      adc $033e,x
$14:9591  91 28         sta ($28),y
$14:9593  d8            cld
$14:9594  03 04         ora $04,s
$14:9596  81 c2         sta ($c2,x)
$14:9598  60            rts
$14:9599  ef 50 0c 80   sbc $800c50
$14:959d  3c c0 06      bit $06c0,x
$14:95a0  25 41         and $41
$14:95a2  7a            ply
$14:95a3  0c 5a 0a      tsb $0a5a
$14:95a6  cb            wai
$14:95a7  02 93         cop #$93
$14:95a9  40            rti
$14:95aa  e0 f0         cpx #$f0
$14:95ac  70 08         bvs $95b6
$14:95ae  00 41         brk #$41
$14:95b0  96 06         stx $06,y
$14:95b2  e0 8e         cpx #$8e
$14:95b4  43 e6         eor $e6,s
$14:95b6  71 cb         adc ($cb),y
$14:95b8  64 c2         stz $c2
$14:95ba  d1 30         cmp ($30),y
$14:95bc  e8            inx
$14:95bd  58            cli
$14:95be  0f 60 1f 80   ora $801f60
$14:95c2  28            plp
$14:95c3  5f d1 62 ef   eor $ef62d1,x
$14:95c7  23 8a         and $8a,s
$14:95c9  4d a3 07      eor $07a3
$14:95cc  72 1f         adc ($1f)
$14:95ce  e0 14         cpx #$14
$14:95d0  01 e8         ora ($e8,x)
$14:95d2  71 28         adc ($28),y
$14:95d4  cc 39 2e      cpy $2e39
$14:95d7  46 16         lsr $16
$14:95d9  35 91         and $91,x
$14:95db  1c 8a 31      trb $318a
$14:95de  07 81         ora [$81]
$14:95e0  c3 20         cmp $20,s
$14:95e2  f0 d8         beq $95bc
$14:95e4  31 3e         and ($3e),y
$14:95e6  4d 02 69      eor $6902
$14:95e9  08            php
$14:95ea  d4 18         pei ($18)
$14:95ec  2e 11 d8      rol $d811
$14:95ef  1c 5e 11      trb $115e
$14:95f2  1c 81 c6      trb $c681
$14:95f5  20 91 48      jsr $4891
$14:95f8  64 56         stz $56
$14:95fa  19 01 28      ora $2801,y
$14:95fd  48            pha
$14:95fe  24 b5         bit $b5
$14:9600  93 0d         sta ($0d,s),y
$14:9602  24 e2         bit $e2
$14:9604  29 28         and #$28
$14:9606  b4 7c         ldy $7c,x
$14:9608  34 17         bit $17,x
$14:960a  89 a5         bit #$a5
$14:960c  23 39         and $39,s
$14:960e  20 c6 4c      jsr $4cc6
$14:9611  38            sec
$14:9612  10 00         bpl $9614
$14:9614  f9 0f cb      sbc $cb0f,y
$14:9617  00 20         brk #$20
$14:9619  38            sec
$14:961a  c4 1e         cpy $1e
$14:961c  2b            pld
$14:961d  0b            phd
$14:961e  89 43         bit #$43
$14:9620  9f a0 35 66   sta $6635a0,x
$14:9624  09 3f         ora #$3f
$14:9626  c0 12         cpy #$12
$14:9628  80 92         bra $95bc
$14:962a  fc 4c 35      jsr ($354c,x)
$14:962d  1d 0a c6      ora $c60a,x
$14:9630  83 49         sta $49,s
$14:9632  f8            sed
$14:9633  aa            tax
$14:9634  56 36         lsr $36,x
$14:9636  92 8c         sta ($8c)
$14:9638  24 63         bit $63
$14:963a  a8            tay
$14:963b  be 53 f8      ldx $f853,y
$14:963e  68            pla
$14:963f  05 83         ora $83
$14:9641  e0 35         cpx #$35
$14:9643  0b            phd
$14:9644  f4 22 e7      pea $e722
$14:9647  03 7e         ora $7e,s
$14:9649  84 16         sty $16
$14:964b  19 0b 83      ora $830b,y
$14:964e  c1 a0         cmp ($a0,x)
$14:9650  24 58         bit $58
$14:9652  26 83         rol $83
$14:9654  04 bc         tsb $bc
$14:9656  90 84         bcc $95dc
$14:9658  78            sei
$14:9659  17 41         ora [$41],y
$14:965b  26 59         rol $59
$14:965d  c8            iny
$14:965e  84 a2         sty $a2
$14:9660  61 d0         adc ($d0,x)
$14:9662  f0 7c         beq $96e0
$14:9664  20 09 f0      jsr $f009
$14:9667  35 91         and $91,x
$14:9669  ac 84 64      ldy $6484
$14:966c  ef 08 f4 0a   sbc $0af408
$14:9670  29 0b         and #$0b
$14:9672  8d 41 62      sta $6241
$14:9675  70 e8         bvs $965f
$14:9677  54 1a 12      mvn $12,$1a
$14:967a  7c 17 f8      jmp ($f817,x)
$14:967d  3f d1 7e df   and $df7ed1,x
$14:9681  c8            iny
$14:9682  82 44 73      brl $09c9
$14:9685  15 4e         ora $4e,x
$14:9687  c7 52         cmp [$52]
$14:9689  f0 99         beq $9624
$14:968b  43 58         eor $58,s
$14:968d  27 c2         and [$c2]
$14:968f  c1 00         cmp ($00,x)
$14:9691  90 0a         bcc $969d
$14:9693  05 52         ora $52
$14:9695  80 00         bra $9697
$14:9697  20 81 c0      jsr $c081
$14:969a  61 d0         adc ($d0,x)
$14:969c  79 cc 7b      adc $7bcc,y
$14:969f  cf 78 9c 47   cmp $479c78
$14:96a3  9e 20 ef      stz $ef20,x
$14:96a6  08            php
$14:96a7  04 02         tsb $02
$14:96a9  03 03         ora $03,s
$14:96ab  83 c3         sta $c3,s
$14:96ad  e3 d3         sbc $d3,s
$14:96af  fb            xce
$14:96b0  c7 fc         cmp [$fc]
$14:96b2  06 00         asl $00
$14:96b4  10 7f         bpl $9735
$14:96b6  83 f4         sta $f4,s
$14:96b8  28            plp
$14:96b9  18            clc
$14:96ba  09 07         ora #$07
$14:96bc  03 3d         ora $3d,s
$14:96be  19 8c 79      ora $798c,y
$14:96c1  a0 30         ldy #$30
$14:96c3  70 88         bvs $964d
$14:96c5  03 c1         ora $c1,s
$14:96c7  fa            plx
$14:96c8  18            clc
$14:96c9  0e 07 03      asl $0307
$14:96cc  c1 18         cmp ($18,x)
$14:96ce  f2 f9         sbc ($f9)
$14:96d0  7f f0 4f f8   adc $f84ff0,x
$14:96d4  84 03         sty $03
$14:96d6  e0 fd         cpx #$fd
$14:96d8  00 68         brk #$68
$14:96da  d2 36         cmp ($36)
$14:96dc  d1 ed         cmp ($ed),y
$14:96de  5c 67 a7 5c   jml $5ca767
$14:96e2  a2 ca         ldx #$ca
$14:96e4  66 70         ror $70
$14:96e6  28            plp
$14:96e7  70 b4         bvs $969d
$14:96e9  66 00         ror $00
$14:96eb  e0 80         cpx #$80
$14:96ed  51 a0         eor ($a0),y
$14:96ef  12 18         ora ($18)
$14:96f1  04 4a         tsb $4a
$14:96f3  01 0c         ora ($0c,x)
$14:96f5  16 91         asl $91,x
$14:96f7  31 68         and ($68),y
$14:96f9  5c 3d 2e 96   jml $962e3d
$14:96fd  85 42         sta $42
$14:96ff  26 49         rol $49
$14:9701  58            cli
$14:9702  20 12 41      jsr $4112
$14:9705  69 46         adc #$46
$14:9707  20 17 e8      jsr $e817
$14:970a  07 6c         ora [$6c]
$14:970c  5a            phy
$14:970d  26 b0         rol $b0
$14:970f  b3 40         lda ($40,s),y
$14:9711  38            sec
$14:9712  65 da         adc $da
$14:9714  44 7b f4      mvp $f4,$7b
$14:9717  d1 7f         cmp ($7f),y
$14:9719  10 57         bpl $9772
$14:971b  84 43         sty $43
$14:971d  65 32         adc $32
$14:971f  9b            txy
$14:9720  59 3c 9d      eor $9d3c,y
$14:9723  0e 02 c0      asl $c002
$14:9726  60            rts
$14:9727  a4 c4         ldy $c4
$14:9729  21 80         and ($80,x)
$14:972b  fc be 10      jsr ($10be,x)
$14:972e  0f 92 5d 60   ora $605d92
$14:9732  d0 e8         bne $971c
$14:9734  5c 62 2f 13   jml $132f62
$14:9738  8f cd e5 f2   sta $f2e5cd
$14:973c  74 b2         stz $b2,x
$14:973e  c0 13         cpy #$13
$14:9740  c1 0f         cmp ($0f,x)
$14:9742  81 c3         sta ($c3,x)
$14:9744  e0 f1         cpx #$f1
$14:9746  f4 f2 c0      pea $c0f2
$14:9749  a0 50         ldy #$50
$14:974b  d8            cld
$14:974c  63 dc         adc $dc,s
$14:974e  22 b1 c8 b4   jsl $b4c8b1
$14:9752  79 de 70      adc $70de,y
$14:9755  37 b0         and [$b0],y
$14:9757  c4 c0         cpy $c0
$14:9759  e1 1c         sbc ($1c,x)
$14:975b  91 c7         sta ($c7),y
$14:975d  88            dey
$14:975e  e0 4c         cpx #$4c
$14:9760  3f 04 02 a1   and $a10204,x
$14:9764  e0 f8         cpx #$f8
$14:9766  78            sei
$14:9767  02 e1         cop #$e1
$14:9769  e8            inx
$14:976a  84 13         sty $13
$14:976c  0f 81 00 0c   ora $0c0081
$14:9770  87 e0         sta [$e0]
$14:9772  4e 3f c8      lsr $c83f
$14:9775  47 d1         eor [$d1]
$14:9777  36 03         rol $03,x
$14:9779  01 81         ora ($81,x)
$14:977b  42 a1         wdm #$a1
$14:977d  90 c8         bcc $9747
$14:977f  46 22         lsr $22
$14:9781  21 b0         and ($b0,x)
$14:9783  b0 58         bcs $97dd
$14:9785  1e 80 3e      asl $3e80,x
$14:9788  18            clc
$14:9789  22 b4 c7 a0   jsl $a0c7b4
$14:978d  a0 fa         ldy #$fa
$14:978f  c6 53         dec $53
$14:9791  48            pha
$14:9792  a4 a9         ldy $a9
$14:9794  04 02         tsb $02
$14:9796  90 4a         bcc $97e2
$14:9798  b7 a8         lda [$a8],y
$14:979a  31 48         and ($48),y
$14:979c  e1 54         sbc ($54,x)
$14:979e  03 eb         ora $eb,s
$14:97a0  ac 81 a2      ldy $a281
$14:97a3  10 80         bpl $9725
$14:97a5  f2 15         sbc ($15)
$14:97a7  55 82         eor $82,x
$14:97a9  29 c7         and #$c7
$14:97ab  4d 94 10      eor $1094
$14:97ae  86 23         stx $23
$14:97b0  00 57         brk #$57
$14:97b2  31 9c         and ($9c),y
$14:97b4  48            pha
$14:97b5  63 40         adc $40,s
$14:97b7  a0 a4         ldy #$a4
$14:97b9  7d 45 e6      adc $e645,x
$14:97bc  71 ff         adc ($ff),y
$14:97be  bc 85 e8      ldy $e885,x
$14:97c1  2e b8 7b      rol $7bb8
$14:97c4  8b            phb
$14:97c5  e2 85         sep #$85
$14:97c7  81 0c         sta ($0c,x)
$14:97c9  f8            sed
$14:97ca  7f 01 34 17   adc $173401,x
$14:97ce  10 c3         bpl $9793
$14:97d0  70 e0         bvs $97b2
$14:97d2  1e 78 05      asl $0578,x
$14:97d5  98            tya
$14:97d6  ce 35 a0      dec $a035
$14:97d9  38            sec
$14:97da  df 86 e2 3f   cmp $3fe286,x
$14:97de  d8            cld
$14:97df  2c 76 27      bit $2776
$14:97e2  3b            tsc
$14:97e3  86 df         stx $df
$14:97e5  20 f1 f8      jsr $f8f1
$14:97e8  0c be 09      tsb $09be
$14:97eb  07 80         ora [$80]
$14:97ed  42 57         wdm #$57
$14:97ef  83 01         sta $01,s
$14:97f1  82 c0 60      brl $f8b4
$14:97f4  68            pla
$14:97f5  0a            asl a
$14:97f6  84 c1         sty $c1
$14:97f8  60            rts
$14:97f9  f0 28         beq $9823
$14:97fb  74 36         stz $36,x
$14:97fd  78            sei
$14:97fe  ab            plb
$14:97ff  28            plp
$14:9800  14 0a         trb $0a
$14:9802  19 0c 68      ora $680c,y
$14:9805  92 f8         sta ($f8)
$14:9807  17 c5         ora [$c5],y
$14:9809  02 64         cop #$64
$14:980b  92 1c         sta ($1c)
$14:980d  a2 d0         ldx #$d0
$14:980f  09 24         ora #$24
$14:9811  02 60         cop #$60
$14:9813  95 19         sta $19,x
$14:9815  b4 02         ldy $02,x
$14:9817  47 00         eor [$00]
$14:9819  88            dey
$14:981a  8f fb 85 c3   sta $c385fb
$14:981e  b8            clv
$14:981f  fe 67 13      inc $1367,x
$14:9822  88            dey
$14:9823  86 e1         stx $e1
$14:9825  ca            dex
$14:9826  2e 62 80      rol $8062
$14:9829  48            pha
$14:982a  1a            inc a
$14:982b  23 40         and $40,s
$14:982d  1f f2 04 0c   ora $0c04f2,x
$14:9831  61 0f         adc ($0f,x)
$14:9833  6b            rtl
$14:9834  8c 7d b6      sty $b67d
$14:9837  24 0d         bit $0d
$14:9839  89 c7         bit #$c7
$14:983b  e2 31         sep #$31
$14:983d  f8            sed
$14:983e  44 3e 1d      mvp $1d,$3e
$14:9841  0f 81 98 d6   ora $d69881
$14:9845  3f 20 7f 84   and $847f20,x
$14:9849  3e 20 03      rol $0320,x
$14:984c  08            php
$14:984d  19 f8 0c      ora $0cf8,y
$14:9850  67 18         adc [$18]
$14:9852  8c 7a 3f      sty $3f7a
$14:9855  11 0f         ora ($0f),y
$14:9857  84 c3         sty $c3
$14:9859  e1 c0         sbc ($c0,x)
$14:985b  e0 19         cpx #$19
$14:985d  12 31         ora ($31)
$14:985f  e4 fc         cpx $fc
$14:9861  41 3e         eor ($3e,x)
$14:9863  10 81         bpl $97e6
$14:9865  18            clc
$14:9866  70 12         bvs $987a
$14:9868  c0 18         cpy #$18
$14:986a  32 f0         and ($f0)
$14:986c  1e c2 0b      asl $0bc2,x
$14:986f  00 39         brk #$39
$14:9871  04 18         tsb $18
$14:9873  c4 28         cpy $28
$14:9875  52 40         eor ($40)
$14:9877  92 24         sta ($24)
$14:9879  0c 91 0c      tsb $0c91
$14:987c  c9 72         cmp #$72
$14:987e  ad 7b 6c      lda $6c7b
$14:9881  8c 92 f9      sty $f992
$14:9884  53 82         eor ($82,s),y
$14:9886  e8            inx
$14:9887  7e dd 69      ror $69dd,x
$14:988a  e5 f2         sbc $f2
$14:988c  01 60         ora ($60,x)
$14:988e  80 45         bra $98d5
$14:9890  20 14 88      jsr $8814
$14:9893  06 0e         asl $0e
$14:9895  01 a8         ora ($a8,x)
$14:9897  80 42         bra $98db
$14:9899  19 4a b8      ora $b84a,y
$14:989c  03 48         ora $48,s
$14:989e  22 cc d4 d1   jsl $d1d4cc
$14:98a2  08            php
$14:98a3  44 22 08      mvp $08,$22
$14:98a6  75 19         adc $19,x
$14:98a8  02 fc         cop #$fc
$14:98aa  50 a0         bvc $984c
$14:98ac  83 0c         sta $0c,s
$14:98ae  26 11         rol $11
$14:98b0  0a            asl a
$14:98b1  14 6a         trb $6a
$14:98b3  35 92         and $92,x
$14:98b5  c8            iny
$14:98b6  81 0d         sta ($0d,x)
$14:98b8  14 82         trb $82
$14:98ba  14 63         trb $63
$14:98bc  03 48         ora $48,s
$14:98be  61 0e         adc ($0e,x)
$14:98c0  83 46         sta $46,s
$14:98c2  81 59         sta ($59,x)
$14:98c4  a4 f3         ldy $f3
$14:98c6  7c 9e ce      jmp ($ce9e,x)
$14:98c9  a7 5b         lda [$5b]
$14:98cb  17 83         ora [$83],y
$14:98cd  29 08         and #$08
$14:98cf  6d 20 90      adc $9020
$14:98d2  a0 41         ldy #$41
$14:98d4  66 70         ror $70
$14:98d6  2c 06 01      bit $0106
$14:98d9  f8            sed
$14:98da  08            php
$14:98db  32 48         and ($48)
$14:98dd  80 c4         bra $98a3
$14:98df  28            plp
$14:98e0  14 01         trb $01
$14:98e2  79 32 82      adc $8232,y
$14:98e5  82 3b 03      brl $9c23
$14:98e8  a8            tay
$14:98e9  28            plp
$14:98ea  80 62         bra $994e
$14:98ec  14 28         trb $28
$14:98ee  14 0c         trb $0c
$14:98f0  70 18         bvs $990a
$14:98f2  1c 0d 02      trb $020d
$14:98f5  82 b3 24      brl $bdab
$14:98f8  78            sei
$14:98f9  4e a7 56      lsr $56a7
$14:98fc  6b            rtl
$14:98fd  35 4a         and $4a,x
$14:98ff  85 5a         sta $5a
$14:9901  a1 4f         lda ($4f,x)
$14:9903  27 87         and [$87]
$14:9905  66 8c         ror $8c
$14:9907  40            rti
$14:9908  1f c0 fe 21   ora $21fec0,x
$14:990c  d8            cld
$14:990d  10 44         bpl $9953
$14:990f  60            rts
$14:9910  10 18         bpl $992a
$14:9912  bc 4e a9      ldy $a94e,x
$14:9915  14 85         trb $85
$14:9917  ca            dex
$14:9918  21 32         and ($32,x)
$14:991a  85 78         sta $78
$14:991c  2b            pld
$14:991d  c2 06         rep #$06
$14:991f  23 18         and $18,s
$14:9921  24 5e         bit $5e
$14:9923  97 5f         sta [$5f],y
$14:9925  93 cb         sta ($cb,s),y
$14:9927  c5 60         cmp $60
$14:9929  b5 28         lda $28,x
$14:992b  24 0a         bit $0a
$14:992d  2d 13 85      and $8513
$14:9930  cb            wai
$14:9931  e1 94         sbc ($94,x)
$14:9933  c9 dd         cmp #$dd
$14:9935  62 37 78      per $116f
$14:9938  62 94 1a      per $b3cf
$14:993b  0d 07 8b      ora $8b07
$14:993e  c9 25         cmp #$25
$14:9940  f4 3a 7d      pea $7d3a
$14:9943  9e fe 4b      stz $4bfe,x
$14:9946  03 f0         ora $f0,s
$14:9948  d0 0f         bne $9959
$14:994a  c1 c0         cmp ($c0,x)
$14:994c  a0 32         ldy #$32
$14:994e  43 41         eor $41,s
$14:9950  20 d4 4a      jsr $4ad4
$14:9953  26 13         rol $13
$14:9955  22 80 94 87   jsl $879480
$14:9959  00 55         brk #$55
$14:995b  0e 07 03      asl $0307
$14:995e  c1 c0         cmp ($c0,x)
$14:9960  f4 70 be      pea $be70
$14:9963  4c 52 81      jmp $8152
$14:9966  b7 c4         lda [$c4],y
$14:9968  86 10         stx $10
$14:996a  b8            clv
$14:996b  6d b6 9f      adc $9fb6
$14:996e  f7 27         sbc [$27],y
$14:9970  0b            phd
$14:9971  a4 20         ldy $20
$14:9973  f0 78         beq $99ed
$14:9975  7c 3e 13      jmp ($133e,x)
$14:9978  0f 83 43 ed   ora $ed4383
$14:997c  d6 fd         dec $fd,x
$14:997e  47 fd         eor [$fd]
$14:9980  e0 1e         cpx #$1e
$14:9982  02 a0         cop #$a0
$14:9984  24 06         bit $06
$14:9986  39 00 e1      and $e100,y
$14:9989  70 b3         bvs $993e
$14:998b  99 cd c0      sta $c0cd,y
$14:998e  f8            sed
$14:998f  7f 1f 8f 27   adc $278f1f,x
$14:9993  93 f3         sta ($f3,s),y
$14:9995  f9 ff 7f      sbc $7fff,y
$14:9998  a7 9f         lda [$9f]
$14:999a  eb            xba
$14:999b  07 f3         ora [$f3]
$14:999d  81 f8         sta ($f8,x)
$14:999f  37 a4         and [$a4],y
$14:99a1  14 ec         trb $ec
$14:99a3  70 d8         bvs $997d
$14:99a5  7c de 7e      jmp ($7ede,x)
$14:99a8  7f a8 74 3e   adc $3e74a8,x
$14:99ac  50 be         bvc $996c
$14:99ae  1b            tcs
$14:99af  84 03         sty $03
$14:99b1  71 00         adc ($00),y
$14:99b3  87 40         sta [$40]
$14:99b5  3b            tsc
$14:99b6  10 0e         bpl $99c6
$14:99b8  97 0b         sta [$0b],y
$14:99ba  19 8c d8      ora $d88c,y
$14:99bd  5f 9e 00 a5   eor $a5009e,x
$14:99c1  2f ff fd 4e   and $4efdff
$14:99c5  57 0f         eor [$0f],y
$14:99c7  e7 3b         sbc [$3b]
$14:99c9  fc 00 57      jsr ($5700,x)
$14:99cc  af 81 bc 18   lda $18bc81
$14:99d0  70 88         bvs $995a
$14:99d2  40            rti
$14:99d3  3b            tsc
$14:99d4  90 00         bcc $99d6
$14:99d6  0c 18 b8      tsb $b818
$14:99d9  30 a0         bmi $997b
$14:99db  83 01         sta $01,s
$14:99dd  80 c1         bra $99a0
$14:99df  e0 23         cpx #$23
$14:99e1  01 8b         ora ($8b,x)
$14:99e3  8d 0e 0a      sta $0a0e
$14:99e6  b5 08         lda $08,x
$14:99e8  02 0c         cop #$0c
$14:99ea  23 1d         and $1d,s
$14:99ec  a8            tay
$14:99ed  cf 7f 01 66   cmp $66017f
$14:99f1  a8            tay
$14:99f2  69 ac         adc #$ac
$14:99f4  13 a9         ora ($a9,s),y
$14:99f6  07 52         ora [$52]
$14:99f8  31 62         and ($62),y
$14:99fa  e4 7a         cpx $7a
$14:99fc  38            sec
$14:99fd  fd ff 1f      sbc $1fff,x
$14:9a00  ff f1 fe fa   sbc $fafef1,x
$14:9a04  fd ee 57      sbc $57ee,x
$14:9a07  af 87 d2 f9   lda $f9d287
$14:9a0b  7e f0 7a      ror $7af0,x
$14:9a0e  1f 23 48 26   ora $264823,x
$14:9a12  03 e4         ora $e4,s
$14:9a14  a1 4f         lda ($4f,x)
$14:9a16  91 81         sta ($81),y
$14:9a18  c3 c7         cmp $c7,s
$14:9a1a  e1 48         sbc ($48,x)
$14:9a1c  a4 30         ldy $30
$14:9a1e  c0 7e         cpy #$7e
$14:9a20  12 09         ora ($09)
$14:9a22  04 28         tsb $28
$14:9a24  f2 2c         sbc ($2c)
$14:9a26  51 e4         eor ($e4),y
$14:9a28  43 61         eor $61,s
$14:9a2a  9c 48 24      stz $2448
$14:9a2d  da            phx
$14:9a2e  05 00         ora $00
$14:9a30  d9 48 38      cmp $3848,y
$14:9a33  11 88         ora ($88),y
$14:9a35  15 03         ora $03,x
$14:9a37  09 d3         ora #$d3
$14:9a39  ed cc 67      sbc $67cc
$14:9a3c  bc 8e 67      ldy $678e,x
$14:9a3f  d3 ed         cmp ($ed,s),y
$14:9a41  0a            asl a
$14:9a42  dd 7c 3e      cmp $3e7c,x
$14:9a45  1f cf f7 43   ora $43f7cf,x
$14:9a49  a8            tay
$14:9a4a  30 08         bmi $9a54
$14:9a4c  80 e0         bra $9a2e
$14:9a4e  1f 26 79 33   ora $337926,x
$14:9a52  e0 40         cpx #$40
$14:9a54  f2 19         sbc ($19)
$14:9a56  02 68         cop #$68
$14:9a58  3e 41 0e      rol $0e41,x
$14:9a5b  84 d0         sty $d0
$14:9a5d  c0 50         cpy #$50
$14:9a5f  16 20         asl $20,x
$14:9a61  f9 4d 05      sbc $054d,y
$14:9a64  01 f2         ora ($f2,x)
$14:9a66  14 0c         trb $0c
$14:9a68  07 83         ora [$83]
$14:9a6a  c1 30         cmp ($30,x)
$14:9a6c  98            tya
$14:9a6d  07 43         ora [$43]
$14:9a6f  81 c0         sta ($c0,x)
$14:9a71  7c 83 7c      jmp ($7c83,x)
$14:9a74  1a            inc a
$14:9a75  41 e8         eor ($e8,x)
$14:9a77  f4 44 22      pea $2244
$14:9a7a  13 49         ora ($49,s),y
$14:9a7c  a5 5a         lda $5a
$14:9a7e  ad 6a a5      lda $a56a
$14:9a81  55 28         eor $28,x
$14:9a83  8f 70 78 84   sta $847870
$14:9a87  e2 70         sep #$70
$14:9a89  d2 29         cmp ($29)
$14:9a8b  04 02         tsb $02
$14:9a8d  69 00         adc #$00
$14:9a8f  7f 03 f8 03   adc $03f803,x
$14:9a93  c5 16         cmp $16
$14:9a95  ab            plb
$14:9a96  57 73         eor [$73],y
$14:9a98  75 bc         adc $bc,x
$14:9a9a  dc db af      jml [$afdb]
$14:9a9d  02 bb         cop #$bb
$14:9a9f  50 67         bvc $9b08
$14:9aa1  7a            ply
$14:9aa2  98            tya
$14:9aa3  c4 e3         cpy $e3
$14:9aa5  21 49         and ($49,x)
$14:9aa7  af f1 bb e5   lda $e5bbf1
$14:9aab  f0 f4         beq $9aa1
$14:9aad  ff ef b7 fb   sbc $fbb7ef,x
$14:9ab1  bd ff 67      lda $67ff,x
$14:9ab4  bb            tyx
$14:9ab5  dc 6e 2a      jml [$2a6e]
$14:9ab8  93 4e         sta ($4e,s),y
$14:9aba  fc ef ab      jsr ($abef,x)
$14:9abd  3f cb 5d f2   and $f25dcb,x
$14:9ac1  56 69         lsr $69,x
$14:9ac3  0d ee 53      ora $53ee
$14:9ac6  78            sei
$14:9ac7  d4 5c         pei ($5c)
$14:9ac9  2d 77 ff      and $ff77
$14:9acc  27 fc         and [$fc]
$14:9ace  c2 02         rep #$02
$14:9ad0  50 fe         bvc $9ad0
$14:9ad2  ff c5 21 73   sbc $7321c5,x
$14:9ad6  bd fe 3f      lda $3ffe,x
$14:9ad9  1d 4e 95      ora $954e,x
$14:9adc  c3 69         cmp $69,s
$14:9ade  b2 da         lda ($da)
$14:9ae0  75 3b         adc $3b,x
$14:9ae2  d8            cld
$14:9ae3  8e f4 23      stx $23f4
$14:9ae6  39 24 9c      and $9c24,y
$14:9ae9  4e a2 12      lsr $12a2
$14:9aec  6f b7 13 e9   adc $e913b7
$14:9af0  c6 fb         dec $fb
$14:9af2  4b            phk
$14:9af3  bf d7 ef f7   lda $f7efd7,x
$14:9af7  73 b9         adc ($b9,s),y
$14:9af9  9c de 4e      stz $4ede
$14:9afc  a7 55         lda [$55]
$14:9afe  5f b5 c6 bd   eor $bdc6b5,x
$14:9b02  0a            asl a
$14:9b03  82 40 60      brl $fb46
$14:9b06  3c 3f 7e      bit $7e3f,x
$14:9b09  fb            xce
$14:9b0a  df 91 b7 59   cmp $59b791,x
$14:9b0e  a1 1a         lda ($1a,x)
$14:9b10  bf fc be ff   lda $ffbefc,x
$14:9b14  0f 87 9d 43   ora $439d87
$14:9b18  df ef ff a2   cmp $a2ffef,x
$14:9b1c  46 fd         lsr $fd
$14:9b1e  7e bc 4e      ror $4ebc,x
$14:9b21  6a            ror a
$14:9b22  16 e9         asl $e9,x
$14:9b24  9f ff d7 f2   sta $f2d7ff,x
$14:9b28  93 f0         sta ($f0,s),y
$14:9b2a  6d 7f 39      adc $397f
$14:9b2d  34 69         bit $69,x
$14:9b2f  a4 1c         ldy $1c
$14:9b31  1f ce fb fc   ora $fcfbce,x
$14:9b35  89 24         bit #$24
$14:9b37  49 4f         eor #$4f
$14:9b39  27 cd         and [$cd]
$14:9b3b  20 ba cd      jsr $cdba
$14:9b3e  a6 37         ldx $37
$14:9b40  e8            inx
$14:9b41  d4 52         pei ($52)
$14:9b43  00 76         brk #$76
$14:9b45  4b            phk
$14:9b46  7d 9e 13      adc $139e,x
$14:9b49  4b            phk
$14:9b4a  bf d3 ef f0   lda $f0efd3,x
$14:9b4e  f8            sed
$14:9b4f  fa            plx
$14:9b50  15 ef         ora $ef,x
$14:9b52  f6 39         inc $39,x
$14:9b54  df 77 e3 37   cmp $37e377,x
$14:9b58  fd d2 fe      sbc $fed2,x
$14:9b5b  11 7f         ora ($7f),y
$14:9b5d  cc 27 3f      cpy $3f27
$14:9b60  02 e0         cop #$e0
$14:9b62  a7 43         lda [$43]
$14:9b64  bf ff 9f a8   lda $a89fff,x
$14:9b68  d7 bf         cmp [$bf],y
$14:9b6a  df f1 f8 df   cmp $dff8f1,x
$14:9b6e  e4 ee         cpx $ee
$14:9b70  28            plp
$14:9b71  23 b7         and $b7,s
$14:9b73  60            rts
$14:9b74  8f e9 c2 61   sta $61c2e9
$14:9b78  20 d0 6a      jsr $6ad0
$14:9b7b  3d 1e 89      and $891e,x
$14:9b7e  44 9d ce      mvp $ce,$9d
$14:9b81  35 32         and $32,x
$14:9b83  88            dey
$14:9b84  25 11         and $11
$14:9b86  f6 38         inc $38,x
$14:9b88  48            pha
$14:9b89  04 1a         tsb $1a
$14:9b8b  01 47         ora ($47,x)
$14:9b8d  91 d9         sta ($d9),y
$14:9b8f  e0 f3         cpx #$f3
$14:9b91  fc be fe      jsr ($febe,x)
$14:9b94  b7 5f         lda [$5f],y
$14:9b96  88            dey
$14:9b97  be c6 04      ldx $04c6,y
$14:9b9a  ee 48 0c      inc $0c48
$14:9b9d  10 66         bpl $9c05
$14:9b9f  31 11         and ($11),y
$14:9ba1  78            sei
$14:9ba2  c0 86         cpy #$86
$14:9ba4  66 85         ror $85
$14:9ba6  00 98         brk #$98
$14:9ba8  27 42         and [$42]
$14:9baa  39 e6 c0      and $c0e6,y
$14:9bad  41 28         eor ($28,x)
$14:9baf  13 0d         ora ($0d,s),y
$14:9bb1  85 82         sta $82
$14:9bb3  c1 c0         cmp ($c0,x)
$14:9bb5  a0 60         ldy #$60
$14:9bb7  1d c5 f8      ora $f8c5,x
$14:9bba  ff 7c 3e 9f   sbc $9f3e7c,x
$14:9bbe  8f c7 c3 e1   sta $e1c3c7
$14:9bc2  e0 f0         cpx #$f0
$14:9bc4  70 38         bvs $9bfe
$14:9bc6  0e e2 90      asl $90e2
$14:9bc9  bb            tyx
$14:9bca  8c 88 83      sty $8388
$14:9bcd  b0 88         bcs $9b57
$14:9bcf  40            rti
$14:9bd0  34 7a         bit $7a,x
$14:9bd2  37 71         and [$71],y
$14:9bd4  42 a1         wdm #$a1
$14:9bd6  54 0a 01      mvn $01,$0a
$14:9bd9  24 a2         bit $a2
$14:9bdb  11 0a         ora ($0a),y
$14:9bdd  e4 99         cpx $99
$14:9bdf  fa            plx
$14:9be0  19 08 05      ora $0508,y
$14:9be3  42 41         wdm #$41
$14:9be5  20 e0 16      jsr $16e0
$14:9be8  8c bc 37      sty $37bc
$14:9beb  0b            phd
$14:9bec  a6 e3         ldx $e3
$14:9bee  71 70         adc ($70),y
$14:9bf0  b8            clv
$14:9bf1  19 c3 00      ora $00c3,y
$14:9bf4  5a            phy
$14:9bf5  38            sec
$14:9bf6  64 7d         stz $7d
$14:9bf8  56 44         lsr $44,x
$14:9bfa  c1 80         cmp ($80,x)
$14:9bfc  40            rti
$14:9bfd  44 63 08      mvp $08,$63
$14:9c00  80 57         bra $9c59
$14:9c02  eb            xba
$14:9c03  ea            nop
$14:9c04  b2 87         lda ($87)
$14:9c06  43 b4         eor $b4,s
$14:9c08  1a            inc a
$14:9c09  02 49         cop #$49
$14:9c0b  46 23         lsr $23
$14:9c0d  0a            asl a
$14:9c0e  b2 55         lda ($55)
$14:9c10  94 81         sty $81,x
$14:9c12  5a            phy
$14:9c13  05 a3         ora $a3
$14:9c15  54 92 a4      mvn $a4,$92
$14:9c18  21 10         and ($10,x)
$14:9c1a  84 b0         sty $b0
$14:9c1c  2a            rol a
$14:9c1d  51 d7         eor ($d7),y
$14:9c1f  09 60         ora #$60
$14:9c21  52 85         eor ($85)
$14:9c23  92 c8         sta ($c8)
$14:9c25  eb            xba
$14:9c26  c5 68         cmp $68
$14:9c28  56 36         lsr $36,x
$14:9c2a  13 0f         ora ($0f,s),y
$14:9c2c  c4 03         cpy $03
$14:9c2e  10 53         bpl $9c83
$14:9c30  09 a1         ora #$a1
$14:9c32  58            cli
$14:9c33  28            plp
$14:9c34  92 0a         sta ($0a)
$14:9c36  02 b4         cop #$b4
$14:9c38  0c 60 1f      tsb $1f60
$14:9c3b  4b            phk
$14:9c3c  e5 f1         sbc $f1
$14:9c3e  fa            plx
$14:9c3f  05 60         ora $60
$14:9c41  56 85         lsr $85,x
$14:9c43  a0 d0         ldy #$d0
$14:9c45  1b            tcs
$14:9c46  00 bb         brk #$bb
$14:9c48  2a            rol a
$14:9c49  cb            wai
$14:9c4a  31 f8         and ($f8),y
$14:9c4c  bc 09 9d      ldy $9d09,x
$14:9c4f  56 53         lsr $53,x
$14:9c51  28            plp
$14:9c52  c4 72         cpy $72
$14:9c54  75 18         adc $18,x
$14:9c56  9f 43 25 d0   sta $d02543,x
$14:9c5a  68            pla
$14:9c5b  d5 62         cmp $62,x
$14:9c5d  19 0c aa      ora $aa0c,y
$14:9c60  42 20         wdm #$20
$14:9c62  93 a9         sta ($a9,s),y
$14:9c64  d4 f8         pei ($f8)
$14:9c66  c2 33         rep #$33
$14:9c68  29 f5 f2      and #$f2f5
$14:9c6b  fc 27 0a      jsr ($0a27,x)
$14:9c6e  65 70         adc $70
$14:9c70  b4 0a         ldy $0a,x
$14:9c72  d0 88         bne $9bfc
$14:9c74  48            pha
$14:9c75  2c 9f 8d      bit $8d9f
$14:9c78  0f 07 81 f0   ora $f08107
$14:9c7c  d0 70         bne $9cee
$14:9c7e  19 e9 30      ora $30e9,y
$14:9c81  98            tya
$14:9c82  7f 3f 9e 1f   adc $1f9e3f,x
$14:9c86  0f c3 e0 a7   ora $a7e0c3
$14:9c8a  06 79         asl $79
$14:9c8c  c0 a2 10      cpy #$10a2
$14:9c8f  ca            dex
$14:9c90  46 fb         lsr $fb
$14:9c92  c1 fc         cmp ($fc,x)
$14:9c94  e8            inx
$14:9c95  78            sei
$14:9c96  3e 01 20      rol $2001,x
$14:9c99  3d 0c 0a      and $0a0c,x
$14:9c9c  05 1c         ora $1c
$14:9c9e  8e 7f bf      stx $bf7f
$14:9ca1  c8            iny
$14:9ca2  30 43         bmi $9ce7
$14:9ca4  80 7c         bra $9d22
$14:9ca6  38            sec
$14:9ca7  07 a5         ora [$a5]
$14:9ca9  59 7b ae      eor $ae7b,y
$14:9cac  55 65         eor $65,x
$14:9cae  40            rti
$14:9caf  c0 64 3c      cpy #$3c64
$14:9cb2  7e 4f c6      ror $c64f,x
$14:9cb5  19 14 18      ora $1814,y
$14:9cb8  88            dey
$14:9cb9  03 38         ora $38,s
$14:9cbb  d5 61         cmp $61,x
$14:9cbd  f3 f9         sbc ($f9,s),y
$14:9cbf  a0 c3 cd      ldy #$cdc3
$14:9cc2  e6 c4         inc $c4
$14:9cc4  37 05         and [$05],y
$14:9cc6  da            phx
$14:9cc7  52 09         eor ($09)
$14:9cc9  14 42         trb $42
$14:9ccb  20 dd 04      jsr $04dd
$14:9cce  f8            sed
$14:9ccf  3d 42 4d      and $4d42,x
$14:9cd2  2f 76 94 42   and $429476
$14:9cd6  67 22         adc [$22]
$14:9cd8  02 04         cop #$04
$14:9cda  8e 42 08      stx $0842
$14:9cdd  09 8c 42      ora #$428c
$14:9ce0  7e ed 2c      ror $2ced,x
$14:9ce3  00 4c         brk #$4c
$14:9ce5  e8            inx
$14:9ce6  14 09         trb $09
$14:9ce8  44 63 08      mvp $08,$63
$14:9ceb  ec 3c 00      cpx $003c
$14:9cee  88            dey
$14:9cef  da            phx
$14:9cf0  61 98         adc ($98,x)
$14:9cf2  f8            sed
$14:9cf3  5e 3f 8e      lsr $8e3f,x
$14:9cf6  d4 88         pei ($88)
$14:9cf8  c4 64         cpy $64
$14:9cfa  d2 e8         cmp ($e8)
$14:9cfc  44 e2 4b      mvp $4b,$e2
$14:9cff  11 8a         ora ($8a),y
$14:9d01  c0 5d e6      cpy #$e65d
$14:9d04  43 09         eor $09,s
$14:9d06  8c 46 7f      sty $7f46
$14:9d09  07 9f         ora [$9f]
$14:9d0b  c3 a3         cmp $a3,s
$14:9d0d  f0 e8         beq $9cf7
$14:9d0f  7b            tdc
$14:9d10  b5 10         lda $10,x
$14:9d12  e1 34         sbc ($34,x)
$14:9d14  82 7a bc      brl $5991
$14:9d17  59 bf d7      eor $d7bf,y
$14:9d1a  ae 34 ed      ldx $ed34
$14:9d1d  42 a0         wdm #$a0
$14:9d1f  7e 3f 8a      ror $8a3f,x
$14:9d22  20 82 1a      jsr $1a82
$14:9d25  82 3d 03      brl $a065
$14:9d28  84 c3         sty $c3
$14:9d2a  61 31         adc ($31,x)
$14:9d2c  d8            cld
$14:9d2d  4c 72 11      jmp $1172
$14:9d30  13 84         ora ($84,s),y
$14:9d32  47 20         eor [$20]
$14:9d34  90 d8         bcc $9d0e
$14:9d36  1c 0e 01      trb $010e
$14:9d39  06 87         asl $87
$14:9d3b  9f ca 0e 84   sta $840eca,x
$14:9d3f  18            clc
$14:9d40  1c 1e 00      trb $001e
$14:9d43  7d 08 05      adc $0508,x
$14:9d46  c3 21         cmp $21,s
$14:9d48  98            tya
$14:9d49  84 37         sty $37
$14:9d4b  03 80         ora $80,s
$14:9d4d  18            clc
$14:9d4e  0b            phd
$14:9d4f  04 82         tsb $82
$14:9d51  61 50         adc ($50,x)
$14:9d53  8c 24 07      sty $0724
$14:9d56  31 00         and ($00),y
$14:9d58  84 04         sty $04
$14:9d5a  0f c1 c0 f8   ora $f8c0c1
$14:9d5e  78            sei
$14:9d5f  3f 16 0f c3   and $c30f16,x
$14:9d63  b5 0f         lda $0f,x
$14:9d65  81 0c         sta ($0c,x)
$14:9d67  86 45         stx $45
$14:9d69  62 32 a9      per $469e
$14:9d6c  14 a2         trb $a2
$14:9d6e  40            rti
$14:9d6f  5f 53 e0 43   eor $43e053,x
$14:9d73  c9 61 1c      cmp #$1c61
$14:9d76  9f 47 27 81   sta $812747,x
$14:9d7a  90 0c         bcc $9d88
$14:9d7c  86 83         stx $83
$14:9d7e  40            rti
$14:9d7f  a4 27         ldy $27
$14:9d81  6a            ror a
$14:9d82  a6 02         ldx $02
$14:9d84  c1 40         cmp ($40,x)
$14:9d86  54 07 01      mvn $01,$07
$14:9d89  ac 0d 50      ldy $500d
$14:9d8c  74 95         stz $95,x
$14:9d8e  32 99         and ($99)
$14:9d90  24 92         bit $92
$14:9d92  58            cli
$14:9d93  2c 17 0b      bit $0b17
$14:9d96  85 62         sta $62
$14:9d98  b1 68         lda ($68),y
$14:9d9a  a4 3e         ldy $3e
$14:9d9c  82 61 30      brl $ce00
$14:9d9f  74 a3         stz $a3,x
$14:9da1  74 60         stz $60,x
$14:9da3  0f e0 7f 24   ora $247fe0
$14:9da7  c2 20         rep #$20
$14:9da9  98            tya
$14:9daa  08            php
$14:9dab  85 e2         sta $e2
$14:9dad  17 13         ora [$13],y
$14:9daf  86 5b         stx $5b
$14:9db1  2f 72 89 bd   and $bd8972
$14:9db5  c0 1e 33      cpy #$331e
$14:9db8  07 98         ora [$98]
$14:9dba  5a            phy
$14:9dbb  2f 17 8b dd   and $dd8b17
$14:9dbf  ce ff 77      dec $77ff
$14:9dc2  bf db ef e1   lda $e1efdb,x
$14:9dc6  14 84         trb $84
$14:9dc8  44 29 76      mvp $76,$29
$14:9dcb  3f 65 f3 57   and $57f365,x
$14:9dcf  78            sei
$14:9dd0  bb            tyx
$14:9dd1  6c 04 2a      jmp ($2a04)
$14:9dd4  26 1f         rol $1f
$14:9dd6  9f ff ef ff   sta $ffefff,x
$14:9dda  f7 ff         sbc [$ff],y
$14:9ddc  e0 04 f1      cpx #$f104
$14:9ddf  8c 44 21      sty $2144
$14:9de2  90 8c         bcc $9d70
$14:9de4  86 f2         stx $f2
$14:9de6  c5 70         cmp $70
$14:9de8  d2 4b         cmp ($4b)
$14:9dea  ba            tsx
$14:9deb  d1 e2         cmp ($e2),y
$14:9ded  79 c6 16      adc $16c6,y
$14:9df0  e1 2c         sbc ($2c,x)
$14:9df2  de 67 bf      dec $bf67,x
$14:9df5  dd ef f7      cmp $f7ef,x
$14:9df8  bb            tyx
$14:9df9  fc 4f 08      jsr ($084f,x)
$14:9dfc  14 09         trb $09
$14:9dfe  18            clc
$14:9dff  10 48         bpl $9e49
$14:9e01  04 1a         tsb $1a
$14:9e03  0d 0b 86      ora $860b
$14:9e06  db            stp
$14:9e07  69 ff 7b      adc #$7bff
$14:9e0a  f9 3c 20      sbc $203c,y
$14:9e0d  30 38         bmi $9e47
$14:9e0f  3c 1e 1f      bit $1f1e,x
$14:9e12  0f 84 c3 e0   ora $e0c384
$14:9e16  d0 fb         bne $9e13
$14:9e18  75 bf         adc $bf,x
$14:9e1a  51 ff         eor ($ff),y
$14:9e1c  88            dey
$14:9e1d  40            rti
$14:9e1e  3a            dec a
$14:9e1f  11 0c         ora ($0c),y
$14:9e21  c4 61         cpy $61
$14:9e23  aa            tax
$14:9e24  17 08         ora [$08],y
$14:9e26  06 73         asl $73
$14:9e28  01 9c         ora ($9c,x)
$14:9e2a  ce 6e 2f      dec $2f6e
$14:9e2d  02 10         cop #$10
$14:9e2f  f0 7c         beq $9ead
$14:9e31  3c 1f 8f      bit $8f1f,x
$14:9e34  f7 fb         sbc [$fb],y
$14:9e36  f9 fc bf      sbc $bffc,y
$14:9e39  7f ac 3f de   adc $de3fac,x
$14:9e3d  07 e1         ora [$e1]
$14:9e3f  aa            tax
$14:9e40  0c 60 32      tsb $3260
$14:9e43  84 42         sty $42
$14:9e45  21 20         and ($20,x)
$14:9e47  5b            tcd
$14:9e48  8b            phb
$14:9e49  3c 96 03      bit $0396,x
$14:9e4c  0f 86 47 e2   ora $e24786
$14:9e50  13 c9         ora ($c9,s),y
$14:9e52  05 c1         ora $c1
$14:9e54  8e 14 0f      stx $0f14
$14:9e57  03 2c         ora $2c,s
$14:9e59  12 a0         ora ($a0)
$14:9e5b  b0 08         bcs $9e65
$14:9e5d  04 32         tsb $32
$14:9e5f  00 8f         brk #$8f
$14:9e61  00 38         brk #$38
$14:9e63  01 c1         ora ($c1,x)
$14:9e65  7c 0b e0      jmp ($e00b,x)
$14:9e68  68            pla
$14:9e69  ec a6 73      cpx $73a6
$14:9e6c  22 89 c4 a0   jsl $a0c489
$14:9e70  71 28         adc ($28),y
$14:9e72  04 66         tsb $66
$14:9e74  11 1e         ora ($1e),y
$14:9e76  83 43         sta $43,s
$14:9e78  56 20         lsr $20,x
$14:9e7a  76 09         ror $09,x
$14:9e7c  fb            xce
$14:9e7d  0c 21 88      tsb $8821
$14:9e80  50 87         bvc $9e09
$14:9e82  a1 02         lda ($02,x)
$14:9e84  03 07         ora $07,s
$14:9e86  39 82 54      and $5482,y
$14:9e89  22 5f 6b ce   jsl $ce6b5f
$14:9e8d  2b            pld
$14:9e8e  f3 0a         sbc ($0a,s),y
$14:9e90  fc c4 bc      jsr ($bcc4,x)
$14:9e93  70 68         bvs $9efd
$14:9e95  3c 23 7d      bit $7d23,x
$14:9e98  88            dey
$14:9e99  57 04         eor [$04],y
$14:9e9b  3b            tsc
$14:9e9c  f9 06 c7      sbc $c706,y
$14:9e9f  41 a1         eor ($a1,x)
$14:9ea1  d0 e8         bne $9e8b
$14:9ea3  f2 98         sbc ($98)
$14:9ea5  3f 1f cc 42   and $42cc1f,x
$14:9ea9  5c 20 11 68   jml $681120
$14:9ead  04 6d         tsb $6d
$14:9eaf  f0 a3         beq $9e54
$14:9eb1  84 02         sty $02
$14:9eb3  a3 44         lda $44,s
$14:9eb5  47 0b         eor [$0b]
$14:9eb7  95 fb         sta $fb,x
$14:9eb9  48            pha
$14:9eba  e7 95         sbc [$95]
$14:9ebc  e8            inx
$14:9ebd  87 13         sta [$13]
$14:9ebf  91 a8         sta ($a8),y
$14:9ec1  b6 72         ldx $72,y
$14:9ec3  27 8d         and [$8d]
$14:9ec5  31 84         and ($84),y
$14:9ec7  42 3f         wdm #$3f
$14:9ec9  dc 0f e2      jml [$e20f]
$14:9ecc  84 26         sty $26
$14:9ece  1f 88 85 f2   ora $f28588,x
$14:9ed2  00 5a         brk #$5a
$14:9ed4  38            sec
$14:9ed5  08            php
$14:9ed6  e0 d6 25      cpx #$25d6
$14:9ed9  16 88         asl $88,x
$14:9edb  4a            lsr a
$14:9edc  24 13         bit $13
$14:9ede  29 10 e1      and #$e110
$14:9ee1  58            cli
$14:9ee2  03 0f         ora $0f,s
$14:9ee4  8f c7 e7 f1   sta $f1e7c7
$14:9ee8  c9 fe a3      cmp #$a3fe
$14:9eeb  10 8f         bpl $9e7c
$14:9eed  2a            rol a
$14:9eee  c4 63         cpy $63
$14:9ef0  21 10         and ($10,x)
$14:9ef2  98            tya
$14:9ef3  4c 34 1a      jmp $1a34
$14:9ef6  01 68         ora ($68,x)
$14:9ef8  5c 3f 09 f0   jml $f0093f
$14:9efc  bc 7c 3d      ldy $3d7c,x
$14:9eff  1f 0f 87 83   ora $83870f,x
$14:9f03  a1 e0         lda ($e0,x)
$14:9f05  90 70         bcc $9f77
$14:9f07  20 18 09      jsr $0918
$14:9f0a  24 92         bit $92
$14:9f0c  09 04 91      ora #$9104
$14:9f0f  48            pha
$14:9f10  a4 92         ldy $92
$14:9f12  00 58         brk #$58
$14:9f14  44 22 0b      mvp $0b,$22
$14:9f17  10 16         bpl $9f2f
$14:9f19  84 62         sty $62
$14:9f1b  79 38 9e      adc $9e38,y
$14:9f1e  4f 23 d3 f8   eor $f8d323
$14:9f22  fa            plx
$14:9f23  24 22         bit $22
$14:9f25  f0 f8         beq $9f1f
$14:9f27  21 19         and ($19,x)
$14:9f29  d3 21         cmp ($21,s),y
$14:9f2b  e8            inx
$14:9f2c  84 47         sty $47
$14:9f2e  21 94         and ($94,x)
$14:9f30  ca            dex
$14:9f31  21 ec         and ($ec,x)
$14:9f33  07 09         ora [$09]
$14:9f35  c0 53 07      cpy #$0753
$14:9f38  e3 e1         sbc $e1,s
$14:9f3a  fc 9c 7f      jsr ($7f9c,x)
$14:9f3d  23 86         and $86,s
$14:9f3f  80 1c         bra $9f5d
$14:9f41  1c 82 41      trb $4182
$14:9f44  40            rti
$14:9f45  a0 0b 41      ldy #$410b
$14:9f48  76 4f         ror $4f,x
$14:9f4a  ee cb dc      inc $dccb
$14:9f4d  22 5b 04 c0   jsl $c0045b
$14:9f51  5e 65 3b      lsr $3b65,x
$14:9f54  bb            tyx
$14:9f55  5d 4b d7      eor $d74b,x
$14:9f58  a0 e2 d0      ldy #$d0e2
$14:9f5b  70 7e         bvs $9fdb
$14:9f5d  ff f8 7c 2d   sbc $2d7cf8,x
$14:9f61  f7 fb         sbc [$fb],y
$14:9f63  b5 ff         lda $ff,x
$14:9f65  e9 ff 13      sbc #$13ff
$14:9f68  87 ab         sta [$ab]
$14:9f6a  df ec f7 c5   cmp $c5f7ec,x
$14:9f6e  a6 11         ldx $11
$14:9f70  29 85 42      and #$4285
$14:9f73  61 29         adc ($29,x)
$14:9f75  bc c7 6d      ldy $6dc7,x
$14:9f78  b5 49         lda $49,x
$14:9f7a  6c 8a 37      jmp ($378a)
$14:9f7d  05 8f         ora $8f
$14:9f7f  88            dey
$14:9f80  c0 7e 42      cpy #$427e
$14:9f83  50 b9         bvc $9f3e
$14:9f85  11 86         ora ($86),y
$14:9f87  e9 7f 98      sbc #$987f
$14:9f8a  4f fb 51 6a   eor $6a51fb
$14:9f8e  84 5a         sty $5a
$14:9f90  a5 15         lda $15
$14:9f92  95 4d         sta $4d,x
$14:9f94  38            sec
$14:9f95  de ca c7      dec $c7ca,x
$14:9f98  b2 49         lda ($49)
$14:9f9a  d8            cld
$14:9f9b  cc 44 3d      cpy $3d44
$14:9f9e  df e2 f8 07   cmp $07f8e2,x
$14:9fa2  c3 9d         cmp $9d,s
$14:9fa4  fe 8f 19      inc $198f,x
$14:9fa7  86 79         stx $79
$14:9fa9  fc fc 7e      jsr ($7efc,x)
$14:9fac  2a            rol a
$14:9fad  bf 6b 8d 7a   lda $7a8d6b,x
$14:9fb1  14 fc         trb $fc
$14:9fb3  3b            tsc
$14:9fb4  1d de bf      ora $bfde,x
$14:9fb7  77 a4         adc [$a4],y
$14:9fb9  4d f5 7f      eor $7ff5
$14:9fbc  f9 7d fe      sbc $fe7d,y
$14:9fbf  1f 0f 80 c0   ora $c0800f,x
$14:9fc3  5f 21 77 bb   eor $bb7721,x
$14:9fc7  df d1 63 78   cmp $7863d1,x
$14:9fcb  9c 5f 28      stz $285f
$14:9fce  1d bd ee      ora $eebd,x
$14:9fd1  d7 ff         cmp [$ff],y
$14:9fd3  5e f1 cc      lsr $ccf1,x
$14:9fd6  f8            sed
$14:9fd7  3d cf 7d      and $7dcf,x
$14:9fda  a3 e1         lda $e1,s
$14:9fdc  c0 fc 6f      cpy #$6ffc
$14:9fdf  3f 97 ff fa   and $faff97,x
$14:9fe3  8c 14 c9      sty $c914
$14:9fe6  b8            clv
$14:9fe7  fc 45 20      jsr ($2045,x)
$14:9fea  14 9a         trb $9a
$14:9fec  4c aa 45      jmp $45aa
$14:9fef  5d a0 c8      eor $c8a0,x
$14:9ff2  ac 6f e4      ldy $e46f
$14:9ff5  9b            txy
$14:9ff6  2f c2 ff 5d   and $5dffc2
$14:9ffa  bf cf af f1   lda $f1afcf,x
$14:9ffe  cb            wai
$14:9fff  fb            xce
$14:a000  fa            plx
$14:a001  25 12         and $12
$14:a003  08            php
$14:a004  b4 49         ldy $49,x
$14:a006  aa            tax
$14:a007  0d 80 8b      ora $8b80
$14:a00a  4d a5 b6      eor $b6a5
$14:a00d  f7 89         sbc [$89],y
$14:a00f  47 27         eor [$27]
$14:a011  90 c8         bcc $9fdb
$14:a013  f3 94         sbc ($94,s),y
$14:a015  a1 13         lda ($13,x)
$14:a017  e8            inx
$14:a018  82 08 27      brl $c723
$14:a01b  f2 4b         sbc ($4b)
$14:a01d  ff ce f9 ef   sbc $eff9ce,x
$14:a021  b4 e1         ldy $e1,x
$14:a023  e8            inx
$14:a024  1d 09 05      ora $0509,x
$14:a027  92 21         sta ($21)
$14:a029  1f 43 84 fe   ora $fe8443,x
$14:a02d  80 00         bra $a02f
$14:a02f  09 e5 42      ora #$42e5
$14:a032  73 5f         adc ($5f,s),y
$14:a034  9f c9 e3 f1   sta $f1e3c9,x
$14:a038  08            php
$14:a039  7a            ply
$14:a03a  1c 2a 19      trb $192a
$14:a03d  0d 06 03      ora $0306
$14:a040  55 82         eor $82,x
$14:a042  a4 40         ldy $40
$14:a044  33 91         and ($91,s),y
$14:a046  49 94 ab      eor #$ab94
$14:a049  4d d4 fe      eor $fed4
$14:a04c  40            rti
$14:a04d  2c 1f 0b      bit $0b1f
$14:a050  80 80         bra $9fd2
$14:a052  3e 42 40      rol $4042,x
$14:a055  f1 7d         sbc ($7d),y
$14:a057  b8            clv
$14:a058  9e ee 44      stz $44ee,x
$14:a05b  71 0e         adc ($0e),y
$14:a05d  1d 0e 86      ora $860e,x
$14:a060  c3 21         cmp $21,s
$14:a062  48            pha
$14:a063  a4 56         ldy $56
$14:a065  29 12 c9      and #$c912
$14:a068  20 dc 07      jsr $07dc
$14:a06b  41 50         eor ($50,x)
$14:a06d  a2 48 3e      ldx #$3e48
$14:a070  01 f0         ora ($f0,x)
$14:a072  98            tya
$14:a073  5e 08 61      lsr $6108,x
$14:a076  18            clc
$14:a077  9e 11 ca      stz $ca11,x
$14:a07a  79 78 94      adc $9478,y
$14:a07d  40            rti
$14:a07e  3f dd 6a a1   and $a16add,x
$14:a082  4c 28 9b      jmp $9b28
$14:a085  ac 15 53      ldy $5315
$14:a088  89 38 fc      bit #$fc38
$14:a08b  07 82         ora [$82]
$14:a08d  d9 6c 94      cmp $946c,y
$14:a090  6e b5 5b      ror $5bb5
$14:a093  ad d7 fa      lda $fad7
$14:a096  f9 fe 9c      sbc $9cfe,y
$14:a099  07 40         ora [$40]
$14:a09b  b8            clv
$14:a09c  35 4a         and $4a,x
$14:a09e  20 d4 29      jsr $29d4
$14:a0a1  94 c1         sty $c1,x
$14:a0a3  98            tya
$14:a0a4  4a            lsr a
$14:a0a5  25 12         and $12
$14:a0a7  49 23 60      eor #$6023
$14:a0aa  20 11 e9      jsr $e911
$14:a0ad  c5 fa         cmp $fa
$14:a0af  61 7c         adc ($7c,x)
$14:a0b1  9a            txs
$14:a0b2  11 06         ora ($06),y
$14:a0b4  21 38         and ($38,x)
$14:a0b6  23 83         and $83,s
$14:a0b8  94 0f         sty $0f,x
$14:a0ba  a0 d1 18      ldy #$18d1
$14:a0bd  85 f2         sta $f2
$14:a0bf  a9 d6 eb      lda #$ebd6
$14:a0c2  5f 28 99 2c   eor $2c9928,x
$14:a0c6  11 40         ora ($40),y
$14:a0c8  22 1f e0 68   jsl $68e01f
$14:a0cc  5b            tcd
$14:a0cd  2f 92 89 c1   and $c18992
$14:a0d1  84 0c         sty $0c
$14:a0d3  a5 44         lda $44
$14:a0d5  e3 2a         sbc $2a,s
$14:a0d7  c1 92         cmp ($92,x)
$14:a0d9  f0 18         beq $a0f3
$14:a0db  04 0a         tsb $0a
$14:a0dd  01 06         ora ($06,x)
$14:a0df  5c 8a c2 e0   jml $e0c28a
$14:a0e3  90 68         bcc $a14d
$14:a0e5  83 3c         sta $3c,s
$14:a0e7  64 97         stz $97
$14:a0e9  c8            iny
$14:a0ea  04 11         tsb $11
$14:a0ec  aa            tax
$14:a0ed  2b            pld
$14:a0ee  23 86         and $86,s
$14:a0f0  22 82 79 00   jsl $007982
$14:a0f4  6a            ror a
$14:a0f5  4b            phk
$14:a0f6  10 9a         bpl $a092
$14:a0f8  21 18         and ($18,x)
$14:a0fa  8c 1d c2      sty $c21d
$14:a0fd  a5 42         lda $42
$14:a0ff  b7 59         lda [$59],y
$14:a101  89 80 eb      bit #$eb80
$14:a104  78            sei
$14:a105  04 e2         tsb $e2
$14:a107  01 18         ora ($18,x)
$14:a109  62 8e 16      per $b79a
$14:a10c  85 45         sta $45
$14:a10e  81 d0         sta ($d0,x)
$14:a110  60            rts
$14:a111  70 28         bvs $a13b
$14:a113  0c 0d 70      tsb $700d
$14:a116  10 10         bpl $a128
$14:a118  c0 c0 39      cpy #$39c0
$14:a11b  fc fa 38      jsr ($38fa,x)
$14:a11e  84 60         sty $60
$14:a120  f0 78         beq $a19a
$14:a122  18            clc
$14:a123  9c c3 41      stz $41c3
$14:a126  1c 96 48      trb $4896
$14:a129  60            rts
$14:a12a  90 15         bcc $a141
$14:a12c  e4 cc         cpx $cc
$14:a12e  e7 f2         sbc [$f2]
$14:a130  79 38 94      adc $9438,y
$14:a133  20 d0 68      jsr $68d0
$14:a136  11 1c         ora ($1c),y
$14:a138  58            cli
$14:a139  85 48         sta $48
$14:a13b  c8            iny
$14:a13c  60            rts
$14:a13d  39 12 0e      and $0e12,y
$14:a140  07 02         ora [$02]
$14:a142  c1 40         cmp ($40,x)
$14:a144  b0 40         bcs $a186
$14:a146  28            plp
$14:a147  14 08         trb $08
$14:a149  06 02         asl $02
$14:a14b  01 f8         ora ($f8,x)
$14:a14d  2f 8f 80 c6   and $c6808f
$14:a151  76 02         ror $02,x
$14:a153  b0 50         bcs $a1a5
$14:a155  30 18         bmi $a16f
$14:a157  09 94 15      ora #$1594
$14:a15a  d3 0c         cmp ($0c,s),y
$14:a15c  42 9f         wdm #$9f
$14:a15e  cf ce 38 c5   cmp $c538ce
$14:a162  12 e8         ora ($e8)
$14:a164  21 71         and ($71,x)
$14:a166  25 af         and $af
$14:a168  10 aa         bpl $a114
$14:a16a  51 25         eor ($25),y
$14:a16c  92 49         sta ($49)
$14:a16e  54 8a 25      mvn $25,$8a
$14:a171  12 8b         ora ($8b)
$14:a173  4d a5 b6      eor $b6a5
$14:a176  f4 e9 4e      pea $4ee9
$14:a179  2f 91 89 e4   and $e48991
$14:a17d  72 7d         adc ($7d)
$14:a17f  0c 8f 42      tsb $428f
$14:a182  27 d1         and [$d1]
$14:a184  0b            phd
$14:a185  fa            plx
$14:a186  74 a2         stz $a2,x
$14:a188  91 08         sta ($08),y
$14:a18a  e4 62         cpx $62
$14:a18c  3d 1a 5c      and $5c1a,x
$14:a18f  c4 3a         cpy $3a
$14:a191  3d 06 8f      and $8f06,x
$14:a194  41 23         eor ($23,x)
$14:a196  cc 98 77      cpy $7798
$14:a199  a4 2a         ldy $2a
$14:a19b  31 09         and ($09),y
$14:a19d  84 ae         sty $ae
$14:a19f  41 df         eor ($df,x)
$14:a1a1  10 78         bpl $a21b
$14:a1a3  fc 1a 1e      jsr ($1e1a,x)
$14:a1a6  c9 09 24      cmp #$2409
$14:a1a9  91 66         sta ($66),y
$14:a1ab  14 fa         trb $fa
$14:a1ad  46 bf         lsr $bf
$14:a1af  11 ae         ora ($ae),y
$14:a1b1  c4 65         cpy $65
$14:a1b3  30 9d         bmi $a152
$14:a1b5  aa            tax
$14:a1b6  17 16         ora [$16],y
$14:a1b8  02 c5         cop #$c5
$14:a1ba  06 18         asl $18
$14:a1bc  4c 2f 17      jmp $172f
$14:a1bf  0f c0 94 2f   ora $2f94c0
$14:a1c3  1f c9 e5 fa   ora $fae5c9,x
$14:a1c7  7d 3f 82      adc $823f,x
$14:a1ca  4f 24 56 ee   eor $ee5624
$14:a1ce  fd 67 9d      sbc $9d67,x
$14:a1d1  4a            lsr a
$14:a1d2  e2 d0         sep #$d0
$14:a1d4  32 14         and ($14)
$14:a1d6  0e e4 c1      asl $c1e4
$14:a1d9  00 10         brk #$10
$14:a1db  39 fd 46      and $46fd,y
$14:a1de  7f 60 9c dc   adc $dc9c60,x
$14:a1e2  67 75         adc [$75]
$14:a1e4  f9 fd 3e      sbc $3efd,y
$14:a1e7  7f 30 87 b8   adc $b88730,x
$14:a1eb  42 41         wdm #$41
$14:a1ed  20 a8 40      jsr $40a8
$14:a1f0  2b            pld
$14:a1f1  05 21         ora $21
$14:a1f3  d0 ce         bne $a1c3
$14:a1f5  69 d7 ed      adc #$edd7
$14:a1f8  f7 03         sbc [$03],y
$14:a1fa  c1 00         cmp ($00,x)
$14:a1fc  2e 01 80      rol $8001
$14:a1ff  bc 3e 1e      ldy $1e3e,x
$14:a202  37 ff         and [$ff],y
$14:a204  41 de         eor ($de,x)
$14:a206  e0 3b         cpx #$3b
$14:a208  e1 de         sbc ($de,x)
$14:a20a  76 2b         ror $2b,x
$14:a20c  16 77         asl $77,x
$14:a20e  3a            dec a
$14:a20f  6c a8 e5      jmp ($e5a8)
$14:a212  fa            plx
$14:a213  c5 ff         cmp $ff
$14:a215  9c 4e 2a      stz $2a4e
$14:a218  97 c9         sta [$c9],y
$14:a21a  45 f2         eor $f2
$14:a21c  21 38         and ($38,x)
$14:a21e  56 2b         lsr $2b,x
$14:a220  84 28         sty $28
$14:a222  89 f1 b6      bit #$b6f1
$14:a225  30 81         bmi $a1a8
$14:a227  2e d4 0a      rol $0ad4
$14:a22a  86 42         stx $42
$14:a22c  21 b0         and ($b0,x)
$14:a22e  8c 2c c3      sty $c32c
$14:a231  a1 40         lda ($40,x)
$14:a233  fa            plx
$14:a234  4f 2d 71 c8   eor $c8712d
$14:a238  f1 38         sbc ($38),y
$14:a23a  2e 16 06      rol $0616
$14:a23d  00 5e         brk #$5e
$14:a23f  18            clc
$14:a240  61 38         adc ($38,x)
$14:a242  bc 43 26      ldy $2643,x
$14:a245  11 c4         ora ($c4),y
$14:a247  bb            tyx
$14:a248  bd c3 81      lda $81c3,x
$14:a24b  c0 d0         cpy #$d0
$14:a24d  68            pla
$14:a24e  28            plp
$14:a24f  0d b1 67      ora $67b1
$14:a252  45 03         eor $03
$14:a254  c1 20         cmp ($20,x)
$14:a256  b0 3a         bcs $a292
$14:a258  c0 ee         cpy #$ee
$14:a25a  51 09         eor ($09),y
$14:a25c  94 92         sty $92,x
$14:a25e  c3 37         cmp $37,s
$14:a260  b8            clv
$14:a261  e4 6e         cpx $6e
$14:a263  3c cb e6      bit $e6cb,x
$14:a266  be d2 76      ldx $76d2,y
$14:a269  28            plp
$14:a26a  64 01         stz $01
$14:a26c  7a            ply
$14:a26d  10 e0         bpl $a24f
$14:a26f  30 c0         bmi $a231
$14:a271  e0 11         cpx #$11
$14:a273  65 43         adc $43
$14:a275  50 28         bvc $a29f
$14:a277  54 2b 0d      mvn $0d,$2b
$14:a27a  82 8d 60      brl $030a
$14:a27d  84 17         sty $17
$14:a27f  41 52         eor ($52,x)
$14:a281  b0 1a         bcs $a29d
$14:a283  1c 1e cf      trb $cf1e
$14:a286  0f b7 c7 ff   ora $ffc7b7
$14:a28a  e7 62         sbc [$62]
$14:a28c  88            dey
$14:a28d  c4 73         cpy $73
$14:a28f  d8            cld
$14:a290  0b            phd
$14:a291  0c 03 00      tsb $0003
$14:a294  0a            asl a
$14:a295  08            php
$14:a296  19 3c 0e      ora $0e3c,y
$14:a299  c5 0e         cmp $0e
$14:a29b  8f df ff e4   sta $e4ffdf
$14:a29f  62 e1 ff      per $a283
$14:a2a2  24 06         bit $06
$14:a2a4  b5 0a         lda $0a,x
$14:a2a6  86 82         stx $82
$14:a2a8  41 50         eor ($50,x)
$14:a2aa  88            dey
$14:a2ab  42 21         wdm #$21
$14:a2ad  19 8c 42      ora $428c,y
$14:a2b0  65 30         adc $30
$14:a2b2  1c 0e 07      trb $070e
$14:a2b5  83 c1         sta $c1,s
$14:a2b7  f0 f8         beq $a2b1
$14:a2b9  7e 3e 17      ror $173e,x
$14:a2bc  84 31         sty $31
$14:a2be  45 a2         eor $a2
$14:a2c0  15 9a         ora $9a,x
$14:a2c2  04 1b         tsb $1b
$14:a2c4  0d b0 d8      ora $d8b0
$14:a2c7  19 80 70      ora $7080,y
$14:a2ca  29 d1 87      and #$87d1
$14:a2cd  c7 e7         cmp [$e7]
$14:a2cf  f7 fb         sbc [$fb],y
$14:a2d1  ff e6 a1 e0   sbc $e0a1e6,x
$14:a2d5  a0 0e         ldy #$0e
$14:a2d7  40            rti
$14:a2d8  fc 66 31      jsr ($3166,x)
$14:a2db  c0 15         cpy #$15
$14:a2dd  c1 bc         cmp ($bc,x)
$14:a2df  19 0c 05      ora $050c,y
$14:a2e2  32 88         and ($88)
$14:a2e4  0e 53 28      asl $2853
$14:a2e7  1a            inc a
$14:a2e8  46 f1         lsr $f1
$14:a2ea  f8            sed
$14:a2eb  9c 5f 19      stz $195f
$14:a2ee  92 3a         sta ($3a)
$14:a2f0  18            clc
$14:a2f1  24 11         bit $11
$14:a2f3  5f 43 a1 83   eor $83a143,x
$14:a2f7  ab            plb
$14:a2f8  e0 d4         cpx #$d4
$14:a2fa  10 c8         bpl $a2c4
$14:a2fc  65 aa         adc $aa
$14:a2fe  c4 af         cpy $af
$14:a300  93 50         sta ($50,s),y
$14:a302  7f 33 9f e5   adc $e59f33,x
$14:a306  7c 42 23      jmp ($2342,x)
$14:a309  11 7d         ora ($7d),y
$14:a30b  bf 33 3e af   lda $af3e33,x
$14:a30f  88            dey
$14:a310  3c 7e 91      bit $917e,x
$14:a313  ff b0 0b 86   sbc $860bb0,x
$14:a317  80 56         bra $a36f
$14:a319  0d 02 58      ora $5802
$14:a31c  20 1e 09      jsr $091e
$14:a31f  04 c3         tsb $c3
$14:a321  01 88         ora ($88,x)
$14:a323  b0 79         bcs $a39e
$14:a325  10 01         bpl $a328
$14:a327  20 b0 50      jsr $50b0
$14:a32a  11 41         ora ($41),y
$14:a32c  e0 0b         cpx #$0b
$14:a32e  87 03         sta [$03]
$14:a330  e1 70         sbc ($70,x)
$14:a332  fc 46 3f      jsr ($3f46,x)
$14:a335  8a            txa
$14:a336  f8            sed
$14:a337  90 48         bcc $a381
$14:a339  6a            ror a
$14:a33a  d4 79         pei ($79)
$14:a33c  4c 3d 5f      jmp $5f3d
$14:a33f  11 e9         ora ($e9),y
$14:a341  fc e2 ff      jsr ($ffe2,x)
$14:a344  71 bf         adc ($bf),y
$14:a346  3c 93 4d      bit $4d93,x
$14:a349  a6 d5         ldx $d5
$14:a34b  6a            ror a
$14:a34c  b4 9b         ldy $9b,x
$14:a34e  48            pha
$14:a34f  c4 a3         cpy $a3
$14:a351  31 30         and ($30),y
$14:a353  79 27 02      adc $0227,y
$14:a356  cd c4 b7      cmp $b7c4
$14:a359  72 2f         adc ($2f)
$14:a35b  94 0f         sty $0f,x
$14:a35d  45 03         eor $03
$14:a35f  e1 20         sbc ($20,x)
$14:a361  b0 cc         bcs $a32f
$14:a363  e6 71         inc $71
$14:a365  98            tya
$14:a366  cc 1e 0f      cpy $0f1e
$14:a369  02 80         cop #$80
$14:a36b  8f 82 3f 01   sta $013f82
$14:a36f  8f 40 a3 d7   sta $d7a340
$14:a373  f8            sed
$14:a374  64 fe         stz $fe
$14:a376  0d 1f 04      ora $041f
$14:a379  04 02         tsb $02
$14:a37b  02 f6         cop #$f6
$14:a37d  18            clc
$14:a37e  0c 06 06      tsb $0606
$14:a381  af ae 07 03   lda $0307ae
$14:a385  c0 26         cpy #$26
$14:a387  04 7d         tsb $7d
$14:a389  85 c1         sta $c1
$14:a38b  90 90         bcc $a31d
$14:a38d  e8            inx
$14:a38e  64 42         stz $42
$14:a390  21 2b         and ($2b,x)
$14:a392  91 c4         sta ($c4),y
$14:a394  a0 76         ldy #$76
$14:a396  5a            phy
$14:a397  30 d0         bmi $a369
$14:a399  d6 61         dec $61,x
$14:a39b  0f 87 c7 e3   ora $e3c787
$14:a39f  f3 c9         sbc ($c9,s),y
$14:a3a1  fc f2 7d      jsr ($7df2,x)
$14:a3a4  78            sei
$14:a3a5  a4 53         ldy $53
$14:a3a7  31 18         and ($18),y
$14:a3a9  cc 81 6c      cpy $6c81
$14:a3ac  26 1d         rol $1d
$14:a3ae  00 c0         brk #$c0
$14:a3b0  26 c2         rol $c2
$14:a3b2  01 80         ora ($80,x)
$14:a3b4  80 4f         bra $a405
$14:a3b6  2e 17 cf      rol $cf17
$14:a3b9  87 e3         sta [$e3]
$14:a3bb  c1 f0         cmp ($f0,x)
$14:a3bd  4e 02 ac      lsr $ac02
$14:a3c0  40            rti
$14:a3c1  a5 be         lda $be
$14:a3c3  a4 f8         ldy $f8
$14:a3c5  ea            nop
$14:a3c6  ba            tsx
$14:a3c7  cb            wai
$14:a3c8  0f 26 55 76   ora $765526
$14:a3cc  8a            txa
$14:a3cd  4f 06 2b 08   eor $082b06
$14:a3d1  80 45         bra $a418
$14:a3d3  a0 11         ldy #$11
$14:a3d5  40            rti
$14:a3d6  00 8c         brk #$8c
$14:a3d8  53 63         eor ($63,s),y
$14:a3da  e1 a2         sbc ($a2,x)
$14:a3dc  71 29         adc ($29),y
$14:a3de  1c 88 86      trb $8688
$14:a3e1  41 ae         eor ($ae,x)
$14:a3e3  13 07         ora ($07,s),y
$14:a3e5  31 c7         and ($c7),y
$14:a3e7  7f d3 cf c4   adc $c4cfd3,x
$14:a3eb  e3 e1         sbc $e1,s
$14:a3ed  70 f0         bvs $a3df
$14:a3ef  58            cli
$14:a3f0  30 0e         bmi $a400
$14:a3f2  94 60         sty $60,x
$14:a3f4  82 34 20      brl $c42b
$14:a3f7  50 79         bvc $a472
$14:a3f9  74 7e         stz $7e,x
$14:a3fb  49 15 9b      eor #$9b15
$14:a3fe  b1 c1         lda ($c1),y
$14:a400  0a            asl a
$14:a401  2c 12 42      bit $4212
$14:a404  84 22         sty $22
$14:a406  2f 16 85 9e   and $9e8516
$14:a40a  41 80         eor ($80,x)
$14:a40c  54 4a 24      mvn $24,$4a
$14:a40f  8a            txa
$14:a410  44 b7 08      mvp $08,$b7
$14:a413  44 22 07      mvp $07,$22
$14:a416  0b            phd
$14:a417  80 40         bra $a459
$14:a419  98            tya
$14:a41a  05 38         ora $38
$14:a41c  be 47 27      ldx $2747,y
$14:a41f  cc 70 83      cpy $8370
$14:a422  c3 ca         cmp $ca,s
$14:a424  c0 5a         cpy #$5a
$14:a426  36 09         rol $09,x
$14:a428  e3 71         sbc $71,s
$14:a42a  b0 28         bcs $a454
$14:a42c  16 33         asl $33,x
$14:a42e  18            clc
$14:a42f  9f 71 90 63   sta $639071,x
$14:a433  ff 9f eb 87   sbc $87eb9f,x
$14:a437  f1 3e         sbc ($3e),y
$14:a439  92 a9         sta ($a9)
$14:a43b  14 96         trb $96
$14:a43d  43 13         eor $13,s
$14:a43f  2a            rol a
$14:a440  0c 1a 1c      tsb $1c1a
$14:a443  41 18         eor ($18,x)
$14:a445  0b            phd
$14:a446  04 0c         tsb $0c
$14:a448  21 1e         and ($1e,x)
$14:a44a  9f 98 ca 13   sta $13ca98,x
$14:a44e  07 4d         ora [$4d]
$14:a450  1c 02 13      trb $1302
$14:a453  09 f8 fc      ora #$fcf8
$14:a456  61 50         adc ($50,x)
$14:a458  3a            dec a
$14:a459  94 0e         sty $0e,x
$14:a45b  19 0f fc      ora $fc0f,y
$14:a45e  ff a0 ff 89   sbc $89ffa0,x
$14:a462  fc 02 0d      jsr ($0d02,x)
$14:a465  0f 87 7f ff   ora $ff7f87
$14:a469  9f ff ef fb   sta $fbefff,x
$14:a46d  ef f8 ff 40   sbc $40fff8
$14:a471  3f 07 f1 da   and $daf107,x
$14:a475  fc 67 7c      jsr ($7c67,x)
$14:a478  9b            txy
$14:a479  be 37 eb      ldx $eb37,y
$14:a47c  0d f8 c2      ora $c2f8
$14:a47f  7f 70 af b4   adc $b4af70,x
$14:a483  53 e9         eor ($e9,s),y
$14:a485  38            sec
$14:a486  60            rts
$14:a487  84 1b         sty $1b
$14:a489  9f 82 87 c0   sta $c08782,x
$14:a48d  a1 eb         lda ($eb,x)
$14:a48f  f0 82         beq $a413
$14:a491  43 a1         eor $a1,s
$14:a493  11 c2         ora ($c2),y
$14:a495  f0 68         beq $a4ff
$14:a497  f3 52         sbc ($52,s),y
$14:a499  1c 6d 4a      trb $4a6d
$14:a49c  81 0e         sta ($0e,x)
$14:a49e  a0 52         ldy #$52
$14:a4a0  25 16         and $16
$14:a4a2  f5 08         sbc $08,x
$14:a4a4  40            rti
$14:a4a5  09 21 64      ora #$6421
$14:a4a8  ff 5c bf f3   sbc $f3bf5c,x
$14:a4ac  fb            xce
$14:a4ad  fd fe 7f      sbc $7ffe,x
$14:a4b0  3f 8b c7 8d   and $8dc78b,x
$14:a4b4  87 38         sta [$38]
$14:a4b6  f9 75 a6      sbc $a675,y
$14:a4b9  5d 79 96      eor $9679,x
$14:a4bc  ee e5 97      inc $97e5
$14:a4bf  a3 4f         lda $4f,s
$14:a4c1  ff d9 6b a2   sbc $a26bd9,x
$14:a4c5  20 21 9f      jsr $9f21
$14:a4c8  e8            inx
$14:a4c9  64 f8         stz $f8
$14:a4cb  42 37         wdm #$37
$14:a4cd  e9 c5 fa      sbc #$fac5
$14:a4d0  05 fc         ora $fc
$14:a4d2  ba            tsx
$14:a4d3  42 0f         wdm #$0f
$14:a4d5  e1 27         sbc ($27,x)
$14:a4d7  85 4b         sta $4b
$14:a4d9  21 b5         and ($b5,x)
$14:a4db  3a            dec a
$14:a4dc  04 12         tsb $12
$14:a4de  85 53         sta $53
$14:a4e0  99 d9 5f      sta $5fd9,y
$14:a4e3  47 70         eor [$70]
$14:a4e5  bd dc ef      lda $efdc,x
$14:a4e8  f3 cb         sbc ($cb,s),y
$14:a4ea  fd ea 7f      sbc $7fea,x
$14:a4ed  32 86         and ($86)
$14:a4ef  82 52 d9      brl $7e44
$14:a4f2  c8            iny
$14:a4f3  ba            tsx
$14:a4f4  55 2e         eor $2e,x
$14:a4f6  d1 4e         cmp ($4e),y
$14:a4f8  76 b3         ror $b3,x
$14:a4fa  7d 7c 97      adc $977c,x
$14:a4fd  7a            ply
$14:a4fe  2b            pld
$14:a4ff  9d 06 58      sta $5806,x
$14:a502  64 3b         stz $3b
$14:a504  10 8e         bpl $a494
$14:a506  e6 23         inc $23
$14:a508  39 10 de      and $de10,y
$14:a50b  41 2f         eor ($2f,x)
$14:a50d  10 8f         bpl $a49e
$14:a50f  87 42         sta [$42]
$14:a511  40            rti
$14:a512  7f 08 f4 0a   adc $0af408,x
$14:a516  3b            tsc
$14:a517  04 86         tsb $86
$14:a519  c1 21         cmp ($21,x)
$14:a51b  8e 90 81      stx $8190
$14:a51e  41 a0         eor ($a0,x)
$14:a520  50 38         bvc $a55a
$14:a522  0a            asl a
$14:a523  70 20         bvs $a545
$14:a525  30 38         bmi $a55f
$14:a527  1a            inc a
$14:a528  a0 10         ldy #$10
$14:a52a  42 7f         wdm #$7f
$14:a52c  03 f8         ora $f8,s
$14:a52e  2a            rol a
$14:a52f  8b            phb
$14:a530  a1 d0         lda ($d0,x)
$14:a532  c0 60         cpy #$60
$14:a534  35 18         and $18,x
$14:a536  0a            asl a
$14:a537  44 03 31      mvp $31,$03
$14:a53a  10 98         bpl $a4d4
$14:a53c  48            pha
$14:a53d  2c 14 04      bit $0414
$14:a540  e0 48         cpx #$48
$14:a542  3e 17 05      rol $0517,x
$14:a545  00 a9         brk #$a9
$14:a547  03 c1         ora $c1,s
$14:a549  f0 e0         beq $a52b
$14:a54b  78            sei
$14:a54c  30 1c         bmi $a56a
$14:a54e  05 58         ora $58
$14:a550  49 60 d2      eor #$d260
$14:a553  18            clc
$14:a554  35 4e         and $4e,x
$14:a556  85 49         sta $49
$14:a558  a0 c8         ldy #$c8
$14:a55a  a4 13         ldy $13
$14:a55c  98            tya
$14:a55d  c4 70         cpy $70
$14:a55f  ec 37 eb      cpx $eb37
$14:a562  c2 fc         rep #$fc
$14:a564  27 97         and [$97]
$14:a566  e9 f5 fe      sbc #$fef5
$14:a569  3f 3f 83 c7   and $c7833f,x
$14:a56d  d0 a4         bne $a513
$14:a56f  4a            lsr a
$14:a570  32 58         and ($58)
$14:a572  a4 41         ldy $41
$14:a574  3a            dec a
$14:a575  2d b1 67      and $67b1
$14:a578  b3 58         lda ($58,s),y
$14:a57a  78            sei
$14:a57b  0a            asl a
$14:a57c  90 54         bcc $a5d2
$14:a57e  81 e0         sta ($e0,x)
$14:a580  0e 81 06      asl $0681
$14:a583  5e 84 3a      lsr $3a84,x
$14:a586  13 0f         ora ($0f,s),y
$14:a588  82 c3 60      brl $064e
$14:a58b  f0 99         beq $a526
$14:a58d  e4 a9         cpx $a9
$14:a58f  18            clc
$14:a590  08            php
$14:a591  a2 46 0c      ldx #$0c46
$14:a594  02 05         cop #$05
$14:a596  00 98         brk #$98
$14:a598  22 ca 81 80   jsl $8081ca
$14:a59c  90 78         bcc $a616
$14:a59e  1b            tcs
$14:a59f  62 91 00      per $a633
$14:a5a2  98            tya
$14:a5a3  70 24         bvs $a5c9
$14:a5a5  17 84         ora [$84],y
$14:a5a7  98            tya
$14:a5a8  40            rti
$14:a5a9  38            sec
$14:a5aa  02 03         cop #$03
$14:a5ac  b0 08         bcs $a5b6
$14:a5ae  06 30         asl $30
$14:a5b0  df 73 e0 40   cmp $40e073,x
$14:a5b4  60            rts
$14:a5b5  50 28         bvc $a5df
$14:a5b7  24 02         bit $02
$14:a5b9  19 14 84      ora $8414,y
$14:a5bc  0b            phd
$14:a5bd  da            phx
$14:a5be  05 03         ora $03
$14:a5c0  82 41 e1      brl $8704
$14:a5c3  90 e8         bcc $a5ad
$14:a5c5  44 7a 75      mvp $75,$7a
$14:a5c8  1c b8 58      trb $58b8
$14:a5cb  38            sec
$14:a5cc  09 10 6f      ora #$6f10
$14:a5cf  bc 72 7f      ldy $7f72,x
$14:a5d2  60            rts
$14:a5d3  bc 06 00      ldy $0006,x
$14:a5d6  40            rti
$14:a5d7  25 58         and $58
$14:a5d9  35 c3         and $c3,x
$14:a5db  34 07         bit $07,x
$14:a5dd  40            rti
$14:a5de  6b            rtl
$14:a5df  98            tya
$14:a5e0  10 20         bpl $a602
$14:a5e2  40            rti
$14:a5e3  e2 f0         sep #$f0
$14:a5e5  18            clc
$14:a5e6  2c 31 2c      bit $2c31
$14:a5e9  0f 30 81 c3   ora $c38130
$14:a5ed  d9 80 33      cmp $3380,y
$14:a5f0  10 00         bpl $a5f2
$14:a5f2  a8            tay
$14:a5f3  c8            iny
$14:a5f4  0a            asl a
$14:a5f5  43 03         eor $03,s
$14:a5f7  08            php
$14:a5f8  18            clc
$14:a5f9  7c 24 12      jmp ($1224,x)
$14:a5fc  0e 03 b0      asl $b003
$14:a5ff  1a            inc a
$14:a600  84 20         sty $20
$14:a602  33 21         and ($21,s),y
$14:a604  2a            rol a
$14:a605  93 81         sta ($81,s),y
$14:a607  c0 f8         cpy #$f8
$14:a609  4c 2d 11      jmp $112d
$14:a60c  88            dey
$14:a60d  a4 31         ldy $31
$14:a60f  22 08 c3 68   jsl $68c308
$14:a613  0c c3 e1      tsb $e1c3
$14:a616  18            clc
$14:a617  bc 43 23      ldy $2343,x
$14:a61a  90 68         bcc $a684
$14:a61c  30 e0         bmi $a5fe
$14:a61e  11 e9         ora ($e9),y
$14:a620  0d 4c 04      ora $044c
$14:a623  1a            inc a
$14:a624  03 09         ora $09,s
$14:a626  83 c2         sta $c2,s
$14:a628  e1 90         sbc ($90,x)
$14:a62a  a8            tay
$14:a62b  5c 25 42 90   jml $904225
$14:a62f  98            tya
$14:a630  03 68         ora $68,s
$14:a632  13 e4         ora ($e4,s),y
$14:a634  da            phx
$14:a635  0a            asl a
$14:a636  05 03         ora $03
$14:a638  40            rti
$14:a639  b4 75         ldy $75,x
$14:a63b  90 2d         bcc $a66a
$14:a63d  49 87         eor #$87
$14:a63f  96 88         stx $88,y
$14:a641  05 b2         ora $b2
$14:a643  51 36         eor ($36),y
$14:a645  82 44 a1      brl $478c
$14:a648  13 48         ora ($48,s),y
$14:a64a  a5 32         lda $32
$14:a64c  81 38         sta ($38,x)
$14:a64e  80 58         bra $a6a8
$14:a650  20 13 08      jsr $0813
$14:a653  04 42         tsb $42
$14:a655  01 08         ora ($08,x)
$14:a657  80 1f         bra $a678
$14:a659  80 86         bra $a5e1
$14:a65b  1b            tcs
$14:a65c  06 43         asl $43
$14:a65e  ab            plb
$14:a65f  42 f1         wdm #$f1
$14:a661  00 fe         brk #$fe
$14:a663  41 3d         eor ($3d,x)
$14:a665  11 4f         ora ($4f),y
$14:a667  84 53         sty $53
$14:a669  91 0c         sta ($0c),y
$14:a66b  40            rti
$14:a66c  c2 b4         rep #$b4
$14:a66e  08            php
$14:a66f  60            rts
$14:a670  3f 04 0a 43   and $430a04,x
$14:a674  a0 55 18      ldy #$1855
$14:a677  0f 3a 1d 5d   ora $5d1d3a
$14:a67b  80 e9         bra $a666
$14:a67d  23 ca         and $ca,s
$14:a67f  c4 8e         cpy $8e
$14:a681  47 bf         eor [$bf]
$14:a683  df ff 8f fd   cmp $fd8fff,x
$14:a687  0e 16 1f      asl $1f16
$14:a68a  d8            cld
$14:a68b  3c 02 e1      bit $e102,x
$14:a68e  50 88         bvc $a618
$14:a690  4a            lsr a
$14:a691  21 19         and ($19,x)
$14:a693  8c 47 52      sty $5247
$14:a696  89 c4 a2      bit #$a2c4
$14:a699  5b            tcd
$14:a69a  24 98         bit $98
$14:a69c  0e 07 03      asl $0307
$14:a69f  c1 e0         cmp ($e0,x)
$14:a6a1  f8            sed
$14:a6a2  7c 3f 17      jmp ($173f,x)
$14:a6a5  0f c4 e2 f8   ora $f8e2c4
$14:a6a9  a9 08 c4      lda #$c408
$14:a6ac  f2 0f         sbc ($0f)
$14:a6ae  01 01         ora ($01,x)
$14:a6b0  80 2c         bra $a6de
$14:a6b2  26 33         rol $33
$14:a6b4  09 7c be      ora #$be7c
$14:a6b7  61 10         adc ($10,x)
$14:a6b9  8f c1 e1 e0   sta $e0e1c1
$14:a6bd  92 40         sta ($40)
$14:a6bf  12 e4         ora ($e4)
$14:a6c1  27 f0         and [$f0]
$14:a6c3  f8            sed
$14:a6c4  fc 02 0e      jsr ($0e02,x)
$14:a6c7  80 04         bra $a6cd
$14:a6c9  98            tya
$14:a6ca  74 32         stz $32,x
$14:a6cc  0d 22 98      ora $9822
$14:a6cf  48            pha
$14:a6d0  3e 0a 10      rol $100a,x
$14:a6d3  80 05         bra $a6da
$14:a6d5  41 46         eor ($46,x)
$14:a6d7  16 07         asl $07,x
$14:a6d9  01 b6         ora ($b6,x)
$14:a6db  84 96         sty $96
$14:a6dd  73 58         adc ($58,s),y
$14:a6df  64 26         stz $26
$14:a6e1  2b            pld
$14:a6e2  06 8d         asl $8d
$14:a6e4  42 e3         wdm #$e3
$14:a6e6  90 c8         bcc $a6b0
$14:a6e8  2b            pld
$14:a6e9  30 50         bmi $a73b
$14:a6eb  03 02         ora $02,s
$14:a6ed  7f 0b 00 9f   adc $9f000b,x
$14:a6f1  e0 7f 4c      cpx #$4c7f
$14:a6f4  c2 44         rep #$44
$14:a6f6  28            plp
$14:a6f7  1e 0d 07      asl $070d,x
$14:a6fa  02 a1         cop #$a1
$14:a6fc  20 25 29      jsr $2925
$14:a6ff  2c 32 04      bit $0432
$14:a702  01 0b         ora ($0b,x)
$14:a704  b2 00         lda ($00)
$14:a706  63 11         adc $11,s
$14:a708  88            dey
$14:a709  80 5c         bra $a767
$14:a70b  1f a3 41 94   ora $9441a3,x
$14:a70f  da            phx
$14:a710  28            plp
$14:a711  d6 48         dec $48,x
$14:a713  85 42         sta $42
$14:a715  31 1c         and ($1c),y
$14:a717  88            dey
$14:a718  4b            phk
$14:a719  26 10         rol $10
$14:a71b  89 c4 02      bit #$02c4
$14:a71e  65 00         adc $00
$14:a720  83 0b         sta $0b,s
$14:a722  c0 48 21      cpy #$2148
$14:a725  10 27         bpl $a74e
$14:a727  90 90         bcc $a6b9
$14:a729  06 40         asl $40
$14:a72b  32 18         and ($18)
$14:a72d  84 22         sty $22
$14:a72f  21 40         and ($40,x)
$14:a731  b0 17         bcs $a74a
$14:a733  c9 22 12      cmp #$1222
$14:a736  06 b8         asl $b8
$14:a738  2e 40 d6      rol $d640
$14:a73b  11 88         ora ($88),y
$14:a73d  24 12         bit $12
$14:a73f  04 ff         tsb $ff
$14:a741  21 58         and ($58,x)
$14:a743  42 21         wdm #$21
$14:a745  10 c8         bpl $a70f
$14:a747  41 dc         eor ($dc,x)
$14:a749  5f e1 04 40   eor $4004e1,x
$14:a74d  28            plp
$14:a74e  ac 21 88      ldy $8821
$14:a751  01 84         ora ($84,x)
$14:a753  40            rti
$14:a754  a5 53         lda $53
$14:a756  98            tya
$14:a757  f4 62 11      pea $1162
$14:a75a  17 83         ora [$83],y
$14:a75c  42 18         wdm #$18
$14:a75e  09 3d 40      ora #$403d
$14:a761  08            php
$14:a762  0c 98 08      tsb $0898
$14:a765  2e 1c 06      rol $061c
$14:a768  a2 71 50      ldx #$5071
$14:a76b  c8            iny
$14:a76c  78            sei
$14:a76d  3a            dec a
$14:a76e  1e 09 00      asl $0009,x
$14:a771  a9 2f 10      lda #$102f
$14:a774  02 a0         cop #$a0
$14:a776  8a            txa
$14:a777  18            clc
$14:a778  56 26         lsr $26,x
$14:a77a  f0 80         beq $a6fc
$14:a77c  c0 61 70      cpy #$7061
$14:a77f  e8            inx
$14:a780  a4 52         ldy $52
$14:a782  10 d7         bpl $a75b
$14:a784  08            php
$14:a785  81 bc         sta ($bc,x)
$14:a787  21 30         and ($30,x)
$14:a789  98            tya
$14:a78a  1c 01 f2      trb $f201
$14:a78d  10 28         bpl $a7b7
$14:a78f  0c 20 44      tsb $4420
$14:a792  22 e1 24 0c   jsl $0c24e1
$14:a796  21 16         and ($16,x)
$14:a798  0e 30 81      asl $8130
$14:a79b  bc c1 4c      ldy $4cc1,x
$14:a79e  ef 78 15 9f   sbc $9f1578
$14:a7a2  42 61         wdm #$61
$14:a7a4  b0 ec         bcs $a792
$14:a7a6  7e 25 17      ror $1725,x
$14:a7a9  8e 47 e3      stx $e347
$14:a7ac  41 60         eor ($60,x)
$14:a7ae  e0 00 ad      cpx #$ad00
$14:a7b1  89 2a 30      bit #$302a
$14:a7b4  70 84         bvs $a73a
$14:a7b6  3c 6c 2e      bit $2e6c,x
$14:a7b9  11 3a         ora ($3a),y
$14:a7bb  10 a2         bpl $a75f
$14:a7bd  f4 13 8b      pea $8b13
$14:a7c0  05 02         ora $02
$14:a7c2  a1 a0         lda ($a0,x)
$14:a7c4  cc 48 37      cpy $3748
$14:a7c7  90 0f         bcc $a7d8
$14:a7c9  e5 03         sbc $03
$14:a7cb  b1 a0         lda ($a0),y
$14:a7cd  98            tya
$14:a7ce  48            pha
$14:a7cf  03 41         ora $41,s
$14:a7d1  80 65         bra $a838
$14:a7d3  0b            phd
$14:a7d4  04 18         tsb $18
$14:a7d6  20 ca 20      jsr $20ca
$14:a7d9  d0 44         bne $a81f
$14:a7db  30 91         bmi $a76e
$14:a7dd  2c 9c 32      bit $329c
$14:a7e0  3d 04 8b      and $8b04,x
$14:a7e3  48            pha
$14:a7e4  25 0e         and $0e
$14:a7e6  63 80         adc $80,s
$14:a7e8  6e ff f8      ror $f8ff
$14:a7eb  cc fc 02      cpy $02fc
$14:a7ee  1d 08 87      ora $8708,x
$14:a7f1  44 23 12      mvp $12,$23
$14:a7f4  09 83 28      ora #$2883
$14:a7f7  a1 d0         lda ($d0,x)
$14:a7f9  28            plp
$14:a7fa  8c 06 dd      sty $dd06
$14:a7fd  0e ee c0      asl $c0ee
$14:a800  6c b1 fc      jmp ($fcb1)
$14:a803  8e 16 65      stx $6516
$14:a806  33 1b         and ($1b,s),y
$14:a808  04 72         tsb $72
$14:a80a  3d 3e 9f      and $9f3e,x
$14:a80d  fc 7f ff      jsr ($ff7f,x)
$14:a810  ef ff 83 f7   sbc $f783ff
$14:a814  7a            ply
$14:a815  ff c3 27 e3   sbc $e327c3,x
$14:a819  60            rts
$14:a81a  81 c0         sta ($c0,x)
$14:a81c  e1 90         sbc ($90,x)
$14:a81e  c8            iny
$14:a81f  8c 46 4f      sty $4f46
$14:a822  26 97         rol $97
$14:a824  4a            lsr a
$14:a825  17 00         ora [$00],y
$14:a827  d5 05         cmp $05,x
$14:a829  88            dey
$14:a82a  40            rti
$14:a82b  15 e1         ora $e1,x
$14:a82d  0f 87 47 e3   ora $e34787
$14:a831  13 e8         ora ($e8,s),y
$14:a833  84 e1         sty $e1
$14:a835  8e 10 88      stx $8810
$14:a838  e4 02         cpx $02
$14:a83a  19 2c 92      ora $922c,y
$14:a83d  34 02         bit $02,x
$14:a83f  89 44 d6      bit #$d644
$14:a842  62 2b 11      per $b970
$14:a845  0b            phd
$14:a846  85 83         sta $83
$14:a848  c1 80         cmp ($80,x)
$14:a84a  30 84         bmi $a7d0
$14:a84c  62 78 df      per $87c7
$14:a84f  09 c5 f2      ora #$f2c5
$14:a852  e1 f8         sbc ($f8,x)
$14:a854  f0 7c         beq $a8d2
$14:a856  30 1e         bmi $a876
$14:a858  03 01         ora $01,s
$14:a85a  8b            phb
$14:a85b  52 11         eor ($11)
$14:a85d  0b            phd
$14:a85e  83 a4         sta $a4,s
$14:a860  02 21         cop #$21
$14:a862  10 84         bpl $a7e8
$14:a864  42 05         wdm #$05
$14:a866  10 fe         bpl $a866
$14:a868  07 f0         ora [$f0]
$14:a86a  1e 86 80      asl $8086,x
$14:a86d  5f 03 00 70   eor $700003,x
$14:a871  02 a2         cop #$a2
$14:a873  10 00         bpl $a875
$14:a875  c9 99 c3      cmp #$c399
$14:a878  80 14         bra $a88e
$14:a87a  10 a0         bpl $a81c
$14:a87c  09 94 0a      ora #$0a94
$14:a87f  87 a3         sta [$a3]
$14:a881  90 48         bcc $a8cb
$14:a883  0c 65 02      tsb $0265
$14:a886  80 41         bra $a8c9
$14:a888  01 03         ora ($03,x)
$14:a88a  18            clc
$14:a88b  3c 82 24      bit $2482,x
$14:a88e  64 14         stz $14
$14:a890  0b            phd
$14:a891  03 78         ora $78,s
$14:a893  1f a1 08 86   ora $8608a1,x
$14:a897  41 0a         eor ($0a,x)
$14:a899  a1 06         lda ($06,x)
$14:a89b  81 16         sta ($16,x)
$14:a89d  42 07         wdm #$07
$14:a89f  01 80         ora ($80,x)
$14:a8a1  c6 0a         dec $0a
$14:a8a3  02 b1         cop #$b1
$14:a8a5  02 b0         cop #$b0
$14:a8a7  96 05         stx $05,y
$14:a8a9  5e 05 d0      lsr $d005,x
$14:a8ac  1f 81 64 1e   ora $1e6481,x
$14:a8b0  00 57         brk #$57
$14:a8b2  08            php
$14:a8b3  54 22 0d      mvn $0d,$22
$14:a8b6  01 87         ora ($87,x)
$14:a8b8  3f 82 04 42   and $420482,x
$14:a8bc  02 10         cop #$10
$14:a8be  41 9e         eor ($9e,x)
$14:a8c0  02 83         cop #$83
$14:a8c2  08            php
$14:a8c3  61 f8         adc ($f8,x)
$14:a8c5  20 45 80      jsr $8045
$14:a8c8  76 b2         ror $b2,x
$14:a8ca  0c 21 50      tsb $5021
$14:a8cd  38            sec
$14:a8ce  b4 02         ldy $02,x
$14:a8d0  35 0b         and $0b,x
$14:a8d2  76 b1         ror $b1,x
$14:a8d4  b8            clv
$14:a8d5  08            php
$14:a8d6  41 09         eor ($09,x)
$14:a8d8  80 49         bra $a923
$14:a8da  04 20         tsb $20
$14:a8dc  af 10 e8 86   lda $86e810
$14:a8e0  05 d6         ora $d6
$14:a8e2  14 06         trb $06
$14:a8e4  e0 07 40      cpx #$4007
$14:a8e7  4c e2 62      jmp $62e2
$14:a8ea  a0 3a 82      ldy #$823a
$14:a8ed  0a            asl a
$14:a8ee  6e 06 95      ror $9506
$14:a8f1  23 9c         and $9c,s
$14:a8f3  04 a4         tsb $a4
$14:a8f5  a0 94 46      ldy #$4694
$14:a8f8  26 91         rol $91
$14:a8fa  4b            phk
$14:a8fb  04 a2         tsb $a2
$14:a8fd  a1 08         lda ($08,x)
$14:a8ff  a4 4a         ldy $4a
$14:a901  2f 11 09 04   and $040911
$14:a905  42 18         wdm #$18
$14:a907  41 31         eor ($31,x)
$14:a909  a8            tay
$14:a90a  12 80         ora ($80)
$14:a90c  6a            ror a
$14:a90d  07 c0         ora [$c0]
$14:a90f  3e 02 44      rol $4402,x
$14:a912  27 13         and [$13]
$14:a914  85 78         sta $78
$14:a916  34 aa         bit $aa,x
$14:a918  71 3c         adc ($3c),y
$14:a91a  e0 7e 20      cpx #$207e
$14:a91d  0c e0 c0      tsb $c0e0
$14:a920  24 52         bit $52
$14:a922  40            rti
$14:a923  4b            phk
$14:a924  09 41 28      ora #$2841
$14:a927  0a            asl a
$14:a928  01 10         ora ($10,x)
$14:a92a  84 5d         sty $5d
$14:a92c  1e 00 fd      asl $fd00,x
$14:a92f  00 32         brk #$32
$14:a931  9f c8 f8 15   sta $15f8c8,x
$14:a935  08            php
$14:a936  05 81         ora $81
$14:a938  ac f7 88      ldy $88f7
$14:a93b  07 f2         ora [$f2]
$14:a93d  09 e8 8a      ora #$8ae8
$14:a940  78            sei
$14:a941  15 a0         ora $a0,x
$14:a943  d2 b8         cmp ($b8)
$14:a945  c3 65         cmp $65,s
$14:a947  4e 83 03      lsr $0383
$14:a94a  3b            tsc
$14:a94b  84 04         sty $04
$14:a94d  f6 27         inc $27,x
$14:a94f  07 43         ora [$43]
$14:a951  89 ed 30      bit #$30ed
$14:a954  09 10 e0      ora #$e010
$14:a957  54 2c 13      mvn $13,$2c
$14:a95a  69 c4 36      adc #$36c4
$14:a95d  1d 02 47      ora $4702,x
$14:a960  0a            asl a
$14:a961  3c 82 61      bit $6182,x
$14:a964  60            rts
$14:a965  b8            clv
$14:a966  4e 27 d0      lsr $d027
$14:a969  e8            inx
$14:a96a  7c 06 06      jmp ($0606,x)
$14:a96d  6e 26 68      ror $6826
$14:a970  49 2f 10      eor #$102f
$14:a973  c8            iny
$14:a974  fc 0e 0e      jsr ($0e0e,x)
$14:a977  d6 6f         dec $6f,x
$14:a979  07 82         ora [$82]
$14:a97b  f1 7c         sbc ($7c),y
$14:a97d  8f c7 e0 eb   sta $ebe0c7
$14:a981  87 5e         sta [$5e]
$14:a983  9c 03 9f      stz $9f03
$14:a986  f0 9e         beq $a926
$14:a988  5f d9 55 f0   eor $f055d9,x
$14:a98c  ff df db 46   sbc $46dbdf,x
$14:a990  3d 09 7c      and $7c09,x
$14:a993  82 7f 08      brl $b215
$14:a996  b9 c4 2c      lda $2cc4,y
$14:a999  70 48         bvs $a9e3
$14:a99b  fc 22 1e      jsr ($1e22,x)
$14:a99e  6e 11 f9      ror $f911
$14:a9a1  1b            tcs
$14:a9a2  82 18 6c      brl $15bd
$14:a9a5  11 98         ora ($98),y
$14:a9a7  1b            tcs
$14:a9a8  8f 01 40 50   sta $504001
$14:a9ac  85 02         sta $02
$14:a9ae  41 40         eor ($40,x)
$14:a9b0  26 06         rol $06
$14:a9b2  03 40         ora $40,s
$14:a9b4  a0 04 f8      ldy #$f804
$14:a9b7  f0 14         beq $a9cd
$14:a9b9  40            rti
$14:a9ba  b1 05         lda ($05),y
$14:a9bc  88            dey
$14:a9bd  58            cli
$14:a9be  2c 12 0b      bit $0b12
$14:a9c1  00 50         brk #$50
$14:a9c3  0d c2 16      ora $16c2
$14:a9c6  0a            asl a
$14:a9c7  00 44         brk #$44
$14:a9c9  03 62         ora $62,s
$14:a9cb  34 1a         bit $1a,x
$14:a9cd  00 70         brk #$70
$14:a9cf  04 40         tsb $40
$14:a9d1  2a            rol a
$14:a9d2  01 d8         ora ($d8,x)
$14:a9d4  08            php
$14:a9d5  04 86         tsb $86
$14:a9d7  9c 06 a8      stz $a806
$14:a9da  05 04         ora $04
$14:a9dc  80 36         bra $aa14
$14:a9de  09 84 82      ora #$8284
$14:a9e1  51 30         eor ($30),y
$14:a9e3  8c 44 22      sty $2244
$14:a9e6  91 81         sta ($81),y
$14:a9e8  f8            sed
$14:a9e9  98            tya
$14:a9ea  05 4a         ora $4a
$14:a9ec  12 09         ora ($09)
$14:a9ee  84 c2         sty $c2
$14:a9f0  71 10         adc ($10),y
$14:a9f2  8c 46 23      sty $2346
$14:a9f5  83 01         sta $01,s
$14:a9f7  17 21         ora [$21],y
$14:a9f9  d0 ce         bne $a9c9
$14:a9fb  e4 79         cpx $79
$14:a9fd  44 13 44      mvp $44,$13
$14:aa00  26 11         rol $11
$14:aa02  79 c4 be      adc $bec4,y
$14:aa05  31 77         and ($77),y
$14:aa07  94 3d         sty $3d,x
$14:aa09  42 7f         wdm #$7f
$14:aa0b  00 7d         brk #$7d
$14:aa0d  93 35         sta ($35,s),y
$14:aa0f  80 a0         bra $a9b1
$14:aa11  cd 5a 00      cmp $005a
$14:aa14  80 02         bra $aa18
$14:aa16  a0 32 26      ldy #$2632
$14:aa19  6a            ror a
$14:aa1a  2d c9 6e      and $6ec9
$14:aa1d  0b            phd
$14:aa1e  70 e0         bvs $aa00
$14:aa20  27 22         and [$22]
$14:aa22  05 04         ora $04
$14:aa24  83 47         sta $47,s
$14:aa26  23 05         and $05,s
$14:aa28  80 84         bra $a9ae
$14:aa2a  02 16         cop #$16
$14:aa2c  09 00 6c      ora #$6c00
$14:aa2f  80 38         bra $aa69
$14:aa31  00 20         brk #$20
$14:aa33  09 54 e3      ora #$e354
$14:aa36  c7 e3         cmp [$e3]
$14:aa38  fe 1f f4      inc $f41f,x
$14:aa3b  01 6e         ora ($6e,x)
$14:aa3d  cf 63 ff 7f   cmp $7fff63
$14:aa41  f0 0f         beq $aa52
$14:aa43  e7 bf         sbc [$bf]
$14:aa45  df f1 bf 3f   cmp $3fbff1,x
$14:aa49  fa            plx
$14:aa4a  72 42         adc ($42)
$14:aa4c  e0 1a 10      cpx #$101a
$14:aa4f  d8            cld
$14:aa50  c0 53 85      cpy #$8553
$14:aa53  01 83         ora ($83,x)
$14:aa55  40            rti
$14:aa56  a1 90         lda ($90,x)
$14:aa58  18            clc
$14:aa59  6c 02 3d      jmp ($3d02)
$14:aa5c  05 88         ora $88
$14:aa5e  c4 45         cpy $45
$14:aa60  e0 2f 21      cpx #$212f
$14:aa63  78            sei
$14:aa64  40            rti
$14:aa65  88            dey
$14:aa66  c2 c1         rep #$c1
$14:aa68  08            php
$14:aa69  73 68         adc ($68,s),y
$14:aa6b  27 9f         and [$9f]
$14:aa6d  8c 07 a2      sty $a207
$14:aa70  29 98 be      and #$be98
$14:aa73  7f 20 05 70   adc $700520,x
$14:aa77  fc 40 3c      jsr ($3c40,x)
$14:aa7a  0c 6a 64      tsb $646a
$14:aa7d  c4 0e         cpy $0e
$14:aa7f  11 0e         ora ($0e),y
$14:aa81  98            tya
$14:aa82  4e 38 1f      lsr $1f38
$14:aa85  0c 03 1c      tsb $1c03
$14:aa88  16 e7         asl $e7,x
$14:aa8a  03 81         ora $81,s
$14:aa8c  c3 a1         cmp $a1,s
$14:aa8e  d3 89         cmp ($89,s),y
$14:aa90  c7 c3         cmp [$c3]
$14:aa92  e1 c0         sbc ($c0,x)
$14:aa94  58            cli
$14:aa95  80 34         bra $aacb
$14:aa97  56 c1         lsr $c1,x
$14:aa99  a0 e0 54      ldy #$54e0
$14:aa9c  2c 10 c9      bit $c910
$14:aa9f  80 d8         bra $aa79
$14:aaa1  09 06 0d      ora #$0d06
$14:aaa4  04 58         tsb $58
$14:aaa6  78            sei
$14:aaa7  2c 17 89      bit $8917
$14:aaaa  84 fa         sty $fa
$14:aaac  19 0f 39      ora $390f,y
$14:aaaf  81 a2         sta ($a2,x)
$14:aab1  24 3a         bit $3a
$14:aab3  18            clc
$14:aab4  04 44         tsb $44
$14:aab6  1b            tcs
$14:aab7  02 50         cop #$50
$14:aab9  af 17 06 c0   lda $c00617
$14:aabd  bd 68 14      lda $1468,x
$14:aac0  16 09         asl $09,x
$14:aac2  40            rti
$14:aac3  c1 68         cmp ($68,x)
$14:aac5  37 8b         and [$8b],y
$14:aac7  d6 17         dec $17,x
$14:aac9  82 b0 2f      brl $da7c
$14:aacc  a9 00 5e      lda #$5e00
$14:aacf  c2 c5         rep #$c5
$14:aad1  21 10         and ($10,x)
$14:aad3  38            sec
$14:aad4  bc 2a 52      ldy $522a,x
$14:aad7  ee b8 04      inc $04b8
$14:aada  41 d5         eor ($d5,x)
$14:aadc  52 0c         eor ($0c)
$14:aade  07 43         ora [$43]
$14:aae0  20 0d c1      jsr $c10d
$14:aae3  50 ac         bvc $aa91
$14:aae5  48            pha
$14:aae6  fc 07 e0      jsr ($e007,x)
$14:aae9  74 8d         stz $8d,x
$14:aaeb  00 56         brk #$56
$14:aaed  11 01         ora ($01),y
$14:aaef  58            cli
$14:aaf0  1f 88 66 64   ora $646688,x
$14:aaf4  80 0c         bra $ab02
$14:aaf6  84 82         sty $82
$14:aaf8  60            rts
$14:aaf9  ea            nop
$14:aafa  aa            tax
$14:aafb  4c c2 1c      jmp $1cc2
$14:aafe  e3 07         sbc $07,s
$14:ab00  54 cc 3f      mvn $3f,$cc
$14:ab03  f0 18         beq $ab1d
$14:ab05  79 20 38      adc $3820,y
$14:ab08  07 09         ora [$09]
$14:ab0a  3d 11 c2      and $c211,x
$14:ab0d  94 40         sty $40,x
$14:ab0f  db            stp
$14:ab10  78            sei
$14:ab11  0c 1a 01      tsb $011a
$14:ab14  0a            asl a
$14:ab15  81 a6         sta ($a6,x)
$14:ab17  41 7b         eor ($7b,x)
$14:ab19  0e 30 82      asl $8230
$14:ab1c  40            rti
$14:ab1d  21 2e         and ($2e,x)
$14:ab1f  a9 47 06      lda #$0647
$14:ab22  e3 11         sbc $11,s
$14:ab24  c0 8c 3a      cpy #$3a8c
$14:ab27  aa            tax
$14:ab28  81 00         sta ($00,x)
$14:ab2a  1f 02 5c 21   ora $215c02,x
$14:ab2e  d0 f9         bne $ab29
$14:ab30  04 e2         tsb $e2
$14:ab32  01 60         ora ($60,x)
$14:ab34  a0 0c c4      ldy #$c40c
$14:ab37  6a            ror a
$14:ab38  49 70 87      eor #$8770
$14:ab3b  c3 e7         cmp $e7,s
$14:ab3d  13 8b         ora ($8b,s),y
$14:ab3f  05 83         ora $83
$14:ab41  01 c0         ora ($c0,x)
$14:ab43  6d 08 d4      adc $d408
$14:ab46  66 13         ror $13
$14:ab48  ca            dex
$14:ab49  05 c3         ora $c3
$14:ab4b  01 e0         ora ($e0,x)
$14:ab4d  73 8a         adc ($8a,s),y
$14:ab4f  08            php
$14:ab50  2c 12 89      bit $8912
$14:ab53  84 2a         sty $2a
$14:ab55  19 3c 9e      ora $9e3c,y
$14:ab58  5c 2e 1e 0f   jml $0f1e2e
$14:ab5c  02 30         cop #$30
$14:ab5e  78            sei
$14:ab5f  0e 50 98      asl $9850
$14:ab62  4e 21 90      lsr $9021
$14:ab65  e0 29 22      cpx #$2229
$14:ab68  c0 26 2c      cpy #$2c26
$14:ab6b  b0 0c         bcs $ab79
$14:ab6d  18            clc
$14:ab6e  14 81         trb $81
$14:ab70  e6 27         inc $27
$14:ab72  58            cli
$14:ab73  64 02         stz $02
$14:ab75  34 30         bit $30,x
$14:ab77  08            php
$14:ab78  44 3a 09      mvp $09,$3a
$14:ab7b  08            php
$14:ab7c  81 46         sta ($46,x)
$14:ab7e  61 94         adc ($94,x)
$14:ab80  5a            phy
$14:ab81  24 79         bit $79
$14:ab83  6c 22 f0      jmp ($f022)
$14:ab86  55 81         eor $81,x
$14:ab88  64 15         stz $15
$14:ab8a  61 02         adc ($02,x)
$14:ab8c  80 6e         bra $abfc
$14:ab8e  97 02         sta [$02],y
$14:ab90  4e 69 e4      lsr $e469
$14:ab93  02 fd         cop #$fd
$14:ab95  02 fa         cop #$fa
$14:ab97  42 be         wdm #$be
$14:ab99  18            clc
$14:ab9a  22 73 93 8c   jsl $8c9373
$14:ab9e  5e 05 f8      lsr $f805,x
$14:aba1  7f 82 36 0a   adc $0a3682,x
$14:aba5  67 7c         adc [$7c]
$14:aba7  e0 7c 17      cpx #$177c
$14:abaa  00 f3         brk #$f3
$14:abac  0d 07 01      ora $0107
$14:abaf  22 cf 90 7c   jsl $7c90cf
$14:abb3  80 0c         bra $abc1
$14:abb5  54 0e e5      mvn $e5,$0e
$14:abb8  07 28         ora [$28]
$14:abba  46 22         lsr $22
$14:abbc  11 08         ora ($08),y
$14:abbe  c0 d8 06      cpy #$06d8
$14:abc1  c0 46 08      cpy #$0846
$14:abc4  14 12         trb $12
$14:abc6  02 49         cop #$49
$14:abc8  08            php
$14:abc9  0a            asl a
$14:abca  c4 18         cpy $18
$14:abcc  01 08         ora ($08,x)
$14:abce  86 30         stx $30
$14:abd0  c2 09         rep #$09
$14:abd2  06 82         asl $82
$14:abd4  41 e0         eor ($e0,x)
$14:abd6  50 36         bvc $ac0e
$14:abd8  f8            sed
$14:abd9  13 99         ora ($99,s),y
$14:abdb  d8            cld
$14:abdc  12 0e         ora ($0e)
$14:abde  04 22         tsb $22
$14:abe0  60            rts
$14:abe1  b9 06 83      lda $8306,y
$14:abe4  9e c3 e1      stz $e1c3,x
$14:abe7  30 9e         bmi $ab87
$14:abe9  32 42         and ($42)
$14:abeb  20 d8 09      jsr $09d8
$14:abee  04 46         tsb $46
$14:abf0  31 0f         and ($0f),y
$14:abf2  84 4f         sty $4f
$14:abf4  e1 17         sbc ($17,x)
$14:abf6  38            sec
$14:abf7  85 8e         sta $8e
$14:abf9  09 1f 6d      ora #$6d1f
$14:abfc  84 01         sty $01
$14:abfe  de 08 70      dec $7008,x
$14:ac01  00 90         brk #$90
$14:ac03  bc 23 10      ldy $1023,x
$14:ac06  07 f8         ora [$f8]
$14:ac08  3c 42 11      bit $1142,x
$14:ac0b  68            pla
$14:ac0c  da            phx
$14:ac0d  50 39         bvc $ac48
$14:ac0f  92 8f         sta ($8f)
$14:ac11  e4 03         cpx $03
$14:ac13  f1 00         sbc ($00),y
$14:ac15  f0 00         beq $ac17
$14:ac17  8d de 00      sta $00de
$14:ac1a  b0 00         bcs $ac1c
$14:ac1c  91 39         sta ($39),y
$14:ac1e  21 11         and ($11,x)
$14:ac20  05 a8         ora $a8
$14:ac22  37 46         and [$46],y
$14:ac24  06 d3         asl $d3
$14:ac26  26 99         rol $99
$14:ac28  2c 42 11      bit $1142
$14:ac2b  0e 64 84      asl $8464
$14:ac2e  0c 6c e3      tsb $e36c
$14:ac31  74 3e         stz $3e,x
$14:ac33  04 63         tsb $63
$14:ac35  c1 1b         cmp ($1b,x)
$14:ac37  9e 40 60      stz $6040,x
$14:ac3a  e3 75         sbc $75,s
$14:ac3c  6b            rtl
$14:ac3d  87 c3         sta [$c3]
$14:ac3f  c1 ff         cmp ($ff,x)
$14:ac41  9e 4f e0      stz $e04f,x
$14:ac44  e5 c6         sbc $c6
$14:ac46  1b            tcs
$14:ac47  9c 3a 01      stz $013a
$14:ac4a  da            phx
$14:ac4b  f3 4f         sbc ($4f,s),y
$14:ac4d  af c4 79 ff   lda $ff79c4
$14:ac51  79 bf d7      adc $d7bf,y
$14:ac54  eb            xba
$14:ac55  f4 2a 37      pea $372a
$14:ac58  11 90         ora ($90),y
$14:ac5a  43 e2         eor $e2,s
$14:ac5c  11 79         ora ($79),y
$14:ac5e  c5 be         cmp $be
$14:ac60  31 77         and ($77),y
$14:ac62  94 4c         sty $4c,x
$14:ac64  e2 11         sep #$11
$14:ac66  f5 b8         sbc $b8,x
$14:ac68  0f 06 40 37   ora $374006
$14:ac6c  50 48         bvc $acb6
$14:ac6e  0f 43 31 b0   ora $b03143
$14:ac72  ee 4a 33      inc $334a
$14:ac75  91 00         sta ($00),y
$14:ac77  b9 7c 0a      lda $0a7c,y
$14:ac7a  82 3d 0a      brl $b6ba
$14:ac7d  03 54         ora $54,s
$14:ac7f  20 16 06      jsr $0616
$14:ac82  00 b1         brk #$b1
$14:ac84  1a            inc a
$14:ac85  8f 3f 9e 70   sta $709e3f
$14:ac89  d8            cld
$14:ac8a  93 00         sta ($00,s),y
$14:ac8c  9f df f8 7f   sta $7ff8df,x
$14:ac90  f6 9d         inc $9d,x
$14:ac92  0d 61 d4      ora $d461
$14:ac95  a4 6f         ldy $6f
$14:ac97  8b            phb
$14:ac98  5a            phy
$14:ac99  00 59         brk #$59
$14:ac9b  68            pla
$14:ac9c  3f 54 02 03   and $030254,x
$14:aca0  01 83         ora ($83,x)
$14:aca2  40            rti
$14:aca3  61 f0         adc ($f0,x)
$14:aca5  28            plp
$14:aca6  d4 2d         pei ($2d)
$14:aca8  3a            dec a
$14:aca9  10 f8         bpl $aca3
$14:acab  01 b0         ora ($b0,x)
$14:acad  20 2c 45      jsr $452c
$14:acb0  4f 93 11 3d   eor $3d1193
$14:acb4  12 ce         ora ($ce)
$14:acb6  45 42         eor $42
$14:acb8  31 24         and ($24),y
$14:acba  cf 48 3a d1   cmp $d13a48
$14:acbe  8f b4 43 dd   sta $dd43b4
$14:acc2  14 e3         trb $e3
$14:acc4  51 22         eor ($22),y
$14:acc6  0a            asl a
$14:acc7  21 07         and ($07,x)
$14:acc9  80 3c         bra $ad07
$14:accb  14 61         trb $61
$14:accd  08            php
$14:acce  80 1a         bra $acea
$14:acd0  82 70 6a      brl $1743
$14:acd3  18            clc
$14:acd4  84 c0         sty $c0
$14:acd6  d8            cld
$14:acd7  67 55         adc [$55]
$14:acd9  8c 1a 0c      sty $0c1a
$14:acdc  eb            xba
$14:acdd  15 0b         ora $0b,x
$14:acdf  02 3c         cop #$3c
$14:ace1  ae 16 09      ldx $0916
$14:ace4  84 82         sty $82
$14:ace6  40            rti
$14:ace7  97 09         sta [$09],y
$14:ace9  84 e2         sty $e2
$14:aceb  60            rts
$14:acec  94 15         sty $15,x
$14:acee  01 a6         ora ($a6,x)
$14:acf0  41 50         eor ($50,x)
$14:acf2  73 8c         adc ($8c,s),y
$14:acf4  04 02         tsb $02
$14:acf6  81 80         sta ($80,x)
$14:acf8  d8            cld
$14:acf9  70 39         bvs $ad34
$14:acfb  df 09 c4 fe   cmp $fec409,x
$14:acff  0e 3b 03      asl $033b
$14:ad02  a9 60 30      lda #$3060
$14:ad05  1c 0e 07      trb $070e
$14:ad08  c3 e1         cmp $e1,s
$14:ad0a  fe 9f ae      inc $ae9f,x
$14:ad0d  18            clc
$14:ad0e  ea            nop
$14:ad0f  dc 06 08      jml [$0806]
$14:ad12  33 2d         and ($2d,s),y
$14:ad14  ce 27 52      dec $5227
$14:ad17  00 20         brk #$20
$14:ad19  80 3b         bra $ad56
$14:ad1b  fd e8 54      sbc $54e8,x
$14:ad1e  00 20         brk #$20
$14:ad20  80 c9         bra $aceb
$14:ad22  e8            inx
$14:ad23  93 cf         sta ($cf,s),y
$14:ad25  ec 3b ff      cpx $ff3b
$14:ad28  0a            asl a
$14:ad29  a1 40         lda ($40,x)
$14:ad2b  a0 50         ldy #$50
$14:ad2d  0a            asl a
$14:ad2e  14 02         trb $02
$14:ad30  38            sec
$14:ad31  f4 28 6c      pea $6c28
$14:ad34  33 c7         and ($c7,s),y
$14:ad36  02 e4         cop #$e4
$14:ad38  41 60         eor ($60,x)
$14:ad3a  90 0c         bcc $ad48
$14:ad3c  34 62         bit $62,x
$14:ad3e  69 c0 80      adc #$80c0
$14:ad41  58            cli
$14:ad42  2c 1f 0b      bit $0b1f
$14:ad45  87 e2         sta [$e2]
$14:ad47  71 fc         adc ($fc),y
$14:ad49  8e 5f 21      stx $215f
$14:ad4c  93 e8         sta ($e8,s),y
$14:ad4e  06 72         asl $72
$14:ad50  41 80         eor ($80,x)
$14:ad52  77 04         adc [$04],y
$14:ad54  42 01         wdm #$01
$14:ad56  28            plp
$14:ad57  90 65         bcc $adbe
$14:ad59  22 1c a8 45   jsl $45a81c
$14:ad5d  9b            txy
$14:ad5e  09 bc a1      ora #$a1bc
$14:ad61  7a            ply
$14:ad62  22 8f 40 b3   jsl $b3408f
$14:ad66  59 a4 f6      eor $f6a4,y
$14:ad69  78            sei
$14:ad6a  0e 0e 41      asl $410e
$14:ad6d  e1 88         sbc ($88,x)
$14:ad6f  4e 1e 89      lsr $891e
$14:ad72  22 91 60 60   jsl $606091
$14:ad76  20 71 81      jsr $8171
$14:ad79  51 70         eor ($70),y
$14:ad7b  53 2a         eor ($2a,s),y
$14:ad7d  64 20         stz $20
$14:ad7f  82 06 ff      brl $ac88
$14:ad82  40            rti
$14:ad83  7a            ply
$14:ad84  29 e0 d0      and #$d0e0
$14:ad87  68            pla
$14:ad88  3c 1d 15      bit $151d,x
$14:ad8b  41 90         eor ($90,x)
$14:ad8d  80 c0         bra $ad4f
$14:ad8f  51 51         eor ($51),y
$14:ad91  e0 f0         cpx #$f0
$14:ad93  5c 3e 10 8b   jml $8b103e
$14:ad97  c3 ee         cmp $ee,s
$14:ad99  68            pla
$14:ad9a  0e c4 f8      asl $f8c4
$14:ad9d  40            rti
$14:ad9e  21 1f         and ($1f,x)
$14:ada0  08            php
$14:ada1  24 62         bit $62
$14:ada3  c1 64         cmp ($64,x)
$14:ada5  e9 78 30      sbc #$3078
$14:ada8  18            clc
$14:ada9  af 07 90 5c   lda $5c9007
$14:adad  1f 88 07 f2   ora $f20788,x
$14:adb1  01 fe         ora ($fe,x)
$14:adb3  f0 7f         beq $ae34
$14:adb5  b3 1f         lda ($1f,s),y
$14:adb7  f8            sed
$14:adb8  27 fe         and [$fe]
$14:adba  e1 ff         sbc ($ff,x)
$14:adbc  8c 00 17      sty $1700
$14:adbf  00 8a         brk #$8a
$14:adc1  0b            phd
$14:adc2  04 02         tsb $02
$14:adc4  a0 b8         ldy #$b8
$14:adc6  01 48         ora ($48,x)
$14:adc8  3c 4c 5c      bit $5c4c,x
$14:adcb  14 0c         trb $0c
$14:adcd  05 83         ora $83
$14:adcf  01 50         ora ($50,x)
$14:add1  d0 7b         bne $ae4e
$14:add3  0d c9 02      ora $02c9
$14:add6  80 40         bra $ae18
$14:add8  c2 a1         rep #$a1
$14:adda  03 83         ora $83,s
$14:addc  c3 e1         cmp $e1,s
$14:adde  f3 f9         sbc ($f9,s),y
$14:ade0  fa            plx
$14:ade1  95 55         sta $55,x
$14:ade3  06 9d         asl $9d
$14:ade5  08            php
$14:ade6  e4 72         cpx $72
$14:ade8  05 06         ora $06
$14:adea  82 c3 21      brl $cfb0
$14:aded  71 88         adc ($88),y
$14:adef  dc e2 2f      jml [$2fe2]
$14:adf2  30 1b         bmi $ae0f
$14:adf4  84 4e         sty $4e
$14:adf6  60            rts
$14:adf7  35 05         and $05,x
$14:adf9  70 05         bvs $ae00
$14:adfb  81 3c         sta ($3c,x)
$14:adfd  09 e0 87      ora #$87e0
$14:ae00  91 8d         sta ($8d),y
$14:ae02  3c 14 0b      bit $0b14,x
$14:ae05  06 82         asl $82
$14:ae07  61 d0         adc ($d0,x)
$14:ae09  8c 76 23      sty $2376
$14:ae0c  9e 88 61      stz $6188,x
$14:ae0f  5c 39 10 c2   jml $c21039
$14:ae13  a8            tay
$14:ae14  60            rts
$14:ae15  00 83         brk #$83
$14:ae17  e0 31         cpx #$31
$14:ae19  0b            phd
$14:ae1a  44 0c e4      mvp $e4,$0c
$14:ae1d  63 04         adc $04,s
$14:ae1f  53 ab         eor ($ab,s),y
$14:ae21  8d 5d 0a      sta $0a5d
$14:ae24  e0 56         cpx #$56
$14:ae26  00 5c         brk #$5c
$14:ae28  20 a1 40      jsr $40a1
$14:ae2b  80 c3         bra $adf0
$14:ae2d  e4 11         cpx $11
$14:ae2f  fa            plx
$14:ae30  04 ff         tsb $ff
$14:ae32  00 1e         brk #$1e
$14:ae34  0b            phd
$14:ae35  fc 03 bf      jsr ($bf03,x)
$14:ae38  00 f1         brk #$f1
$14:ae3a  c1 20         cmp ($20,x)
$14:ae3c  f0 84         beq $adc2
$14:ae3e  b9 7f d3      lda $d37f,y
$14:ae41  01 80         ora ($80,x)
$14:ae43  53 87         eor ($87,s),y
$14:ae45  7e 41 ef      ror $ef41,x
$14:ae48  88            dey
$14:ae49  50 3e         bvc $ae89
$14:ae4b  0d 40 fc      ora $fc40
$14:ae4e  41 bf         eor ($bf,x)
$14:ae50  90 35         bcc $ae87
$14:ae52  a8            tay
$14:ae53  7e e0 ff      ror $ffe0,x
$14:ae56  f8            sed
$14:ae57  7f fe 7e 0e   adc $0e7efe,x
$14:ae5b  07 18         ora [$18]
$14:ae5d  38            sec
$14:ae5e  c5 c4         cmp $c4
$14:ae60  2e 10 33      rol $3310
$14:ae63  87 72         sta [$72]
$14:ae65  38            sec
$14:ae66  6e 77 b0      ror $b077
$14:ae69  01 43         ora ($43,x)
$14:ae6b  81 80         sta ($80,x)
$14:ae6d  36 bb         rol $bb,x
$14:ae6f  60            rts
$14:ae70  00 60         brk #$60
$14:ae72  03 09         ora $09,s
$14:ae74  01 b8         ora ($b8,x)
$14:ae76  42 c1         wdm #$c1
$14:ae78  0c 81 c4      tsb $c481
$14:ae7b  21 92         and ($92,x)
$14:ae7d  38            sec
$14:ae7e  d4 92         pei ($92)
$14:ae80  29 05 aa      and #$aa05
$14:ae83  d5 e1         cmp $e1,x
$14:ae85  e1 60         sbc ($60,x)
$14:ae87  23 84         and $84,s
$14:ae89  7e 01 3f      ror $3f01,x
$14:ae8c  81 ef         sta ($ef,x)
$14:ae8e  e0 9f         cpx #$9f
$14:ae90  f8            sed
$14:ae91  5f fe 15 ff   eor $ff15fe,x
$14:ae95  90 4a         bcc $aee1
$14:ae97  21 10         and ($10,x)
$14:ae99  08            php
$14:ae9a  4c 02 0b      jmp $0b02
$14:ae9d  05 26         ora $26
$14:ae9f  82 34 20      brl $ced6
$14:aea2  30 63         bmi $af07
$14:aea4  70 cc         bvs $ae72
$14:aea6  20 11 19      jsr $1911
$14:aea9  04 26         tsb $26
$14:aeab  21 0a         and ($0a,x)
$14:aead  88            dey
$14:aeae  41 a1         eor ($a1,x)
$14:aeb0  02 70         cop #$70
$14:aeb2  4f 84 0a 0b   eor $0b0a84
$14:aeb6  18            clc
$14:aeb7  6c 03 4d      jmp ($4d03)
$14:aeba  1b            tcs
$14:aebb  00 38         brk #$38
$14:aebd  28            plp
$14:aebe  07 62         ora [$62]
$14:aec0  41 80         eor ($80,x)
$14:aec2  a0 10         ldy #$10
$14:aec4  40            rti
$14:aec5  6c 23 01      jmp ($0123)
$14:aec8  18            clc
$14:aec9  14 22         trb $22
$14:aecb  30 50         bmi $af1d
$14:aecd  08            php
$14:aece  80 7c         bra $af4c
$14:aed0  17 e1         ora [$e1],y
$14:aed2  11 a0         ora ($a0),y
$14:aed4  42 6d         wdm #$6d
$14:aed6  11 c8         ora ($c8),y
$14:aed8  14 19         trb $19
$14:aeda  7e 10 88      ror $8810,x
$14:aedd  43 b4         eor $b4,s
$14:aedf  1d a1 29      ora $29a1,x
$14:aee2  a0 58         ldy #$58
$14:aee4  72 16         adc ($16)
$14:aee6  0c 0c c6      tsb $c60c
$14:aee9  90 cf         bcc $aeba
$14:aeeb  3b            tsc
$14:aeec  05 83         ora $83
$14:aeee  e1 70         sbc ($70,x)
$14:aef0  fc 4e 3f      jsr ($3f4e,x)
$14:aef3  91 cb         sta ($cb),y
$14:aef5  e4 22         cpx $22
$14:aef7  7c cf 27      jmp ($27cf,x)
$14:aefa  68            pla
$14:aefb  2f c2 51 20   and $2051c2
$14:aeff  ca            dex
$14:af00  44 39 50      mvp $50,$39
$14:af03  8b            phb
$14:af04  16 02         asl $02,x
$14:af06  02 16         cop #$16
$14:af08  08            php
$14:af09  14 02         trb $02
$14:af0b  02 cf         cop #$cf
$14:af0d  72 70         adc ($70)
$14:af0f  40            rti
$14:af10  20 90 88      jsr $8890
$14:af13  1c 12 02      trb $0212
$14:af16  92 04         sta ($04)
$14:af18  c3 18         cmp $18,s
$14:af1a  80 20         bra $af3c
$14:af1c  0d 80 20      ora $2080
$14:af1f  04 86         tsb $86
$14:af21  01 61         ora ($61,x)
$14:af23  29 84 06      and #$0684
$14:af26  60            rts
$14:af27  85 18         sta $18
$14:af29  85 42         sta $42
$14:af2b  40            rti
$14:af2c  de 0d 0d      dec $0d0d,x
$14:af2f  02 82         cop #$82
$14:af31  3d 08 0a      and $0a08,x
$14:af34  e0 0d         cpx #$0d
$14:af36  f9 0c 3f      sbc $3f0c,y
$14:af39  6d 9b 09      adc $099b
$14:af3c  c3 8f         cmp $8f,s
$14:af3e  e1 e7         sbc ($e7,x)
$14:af40  ef 10 83 e7   sbc $e78310
$14:af44  e0 77         cpx #$77
$14:af46  fc 7c fe      jsr ($fe7c,x)
$14:af49  87 1f         sta [$1f]
$14:af4b  f0 41         beq $af8e
$14:af4d  ff 10 0f 84   sbc $840f10,x
$14:af51  03 e3         ora $e3,s
$14:af53  01 01         ora ($01,x)
$14:af55  87 46         sta [$46]
$14:af57  03 e7         ora $e7,s
$14:af59  83 de         sta $de,s
$14:af5b  70 3f         bvs $af9c
$14:af5d  f8            sed
$14:af5e  07 9f         ora [$9f]
$14:af60  ff c3 08 08   sbc $0808c3,x
$14:af64  3c 2f 9f      bit $9f2f,x
$14:af67  ff 87 eb 25   sbc $25eb87,x
$14:af6b  f7 80         sbc [$80],y
$14:af6d  7c af d7      jmp ($d7af,x)
$14:af70  ef f8 84 7f   sbc $7f84f8
$14:af74  df ef df e3   cmp $e3dfef,x
$14:af78  eb            xba
$14:af79  f0 fa         beq $af75
$14:af7b  fe 3c b0      inc $b03c,x
$14:af7e  88            dey
$14:af7f  4c 62 1b      jmp $1b62
$14:af82  1c 82 43      trb $4382
$14:af85  20 50 e2      jsr $e250
$14:af88  e8            inx
$14:af89  23 c6         and $c6,s
$14:af8b  06 93         asl $93
$14:af8d  01 d1         ora ($d1,x)
$14:af8f  0f 05 26 f9   ora $f92605
$14:af93  08            php
$14:af94  c6 c2         dec $c2
$14:af96  71 20         adc ($20),y
$14:af98  98            tya
$14:af99  50 2e         bvc $afc9
$14:af9b  14 0b         trb $0b
$14:af9d  06 01         asl $01
$14:af9f  8a            txa
$14:afa0  1c 05 98      trb $9805
$14:afa3  16 88         asl $88,x
$14:afa5  b8            clv
$14:afa6  2b            pld
$14:afa7  31 24         and ($24),y
$14:afa9  20 f0 20      jsr $20f0
$14:afac  a4 81         ldy $81
$14:afae  49 12 98      eor #$9812
$14:afb1  e0 4a         cpx #$4a
$14:afb3  30 87         bmi $af3c
$14:afb5  a4 c2         ldy $c2
$14:afb7  1d 07 84      ora $8407,x
$14:afba  41 61         eor ($61,x)
$14:afbc  48            pha
$14:afbd  50 83         bvc $af42
$14:afbf  42 50         wdm #$50
$14:afc1  a0 ef         ldy #$ef
$14:afc3  f0 07         beq $afcc
$14:afc5  84 7c         sty $7c
$14:afc7  45 65         eor $65
$14:afc9  90 c0         bcc $af8b
$14:afcb  17 03         ora [$03],y
$14:afcd  a1 c0         lda ($c0,x)
$14:afcf  f0 50         beq $b021
$14:afd1  38            sec
$14:afd2  0d 50 67      ora $6750
$14:afd5  8e 82 41      stx $4182
$14:afd8  00 b8         brk #$b8
$14:afda  40            rti
$14:afdb  26 10         rol $10
$14:afdd  0d 86 03      ora $0386
$14:afe0  60            rts
$14:afe1  4e 0c 07      lsr $070c
$14:afe4  43 00         eor $00,s
$14:afe6  e1 02         sbc ($02,x)
$14:afe8  41 c6         eor ($c6,x)
$14:afea  23 13         and $13,s
$14:afec  c8            iny
$14:afed  e5 fa         sbc $fa
$14:afef  1d 7f 83      ora $837f,x
$14:aff2  c7 e0         cmp [$e0]
$14:aff4  48            pha
$14:aff5  10 24         bpl $b01b
$14:aff7  0c 22 01      tsb $0122
$14:affa  04 80         tsb $80
$14:affc  52 a1         eor ($a1)
$14:affe  16 58         asl $58,x
$14:b000  24 ca         bit $ca
$14:b002  85 18         sta $18
$14:b004  6f 80 3f 0c   adc $0c3f80
$14:b008  a0 13         ldy #$13
$14:b00a  b0 f1         bcs $affd
$14:b00c  41 20         eor ($20,x)
$14:b00e  51 08         eor ($08),y
$14:b010  4c 82 25      jmp $2582
$14:b013  04 98         tsb $98
$14:b015  52 65         eor ($65)
$14:b017  b4 d9         ldy $d9,x
$14:b019  6d 1e 4f      adc $4f1e
$14:b01c  07 80         ora [$80]
$14:b01e  47 e0         eor [$e0]
$14:b020  13 f8         ora ($f8,s),y
$14:b022  25 fe         and $fe
$14:b024  13 7f         ora ($7f,s),y
$14:b026  85 df         sta $df
$14:b028  e2 5f         sep #$5f
$14:b02a  f2 50         sbc ($50)
$14:b02c  46 20         lsr $20
$14:b02e  06 f0         asl $f0
$14:b030  07 d9         ora [$d9]
$14:b032  e4 cc         cpx $cc
$14:b034  15 1c         ora $1c,x
$14:b036  6f 81 38 0c   adc $0c3881
$14:b03a  11 bc         ora ($bc),y
$14:b03c  a1 4a         lda ($4a,x)
$14:b03e  22 87 3a 14   jsl $143a87
$14:b042  8d 01 c6      sta $c601
$14:b045  18            clc
$14:b046  8b            phb
$14:b047  84 13         sty $13
$14:b049  31 e4         and ($e4),y
$14:b04b  f4 64 b2      pea $b264
$14:b04e  9d ae 67      sta $67ae,x
$14:b051  c2 01         rep #$01
$14:b053  e0 80         cpx #$80
$14:b055  7e 30 1f      ror $1f30,x
$14:b058  c8            iny
$14:b059  07 fa         ora [$fa]
$14:b05b  c1 fe         cmp ($fe,x)
$14:b05d  88            dey
$14:b05e  7f ed 1f f9   adc $f91fed,x
$14:b062  04 22         tsb $22
$14:b064  37 24         and [$24],y
$14:b066  87 4d         sta [$4d]
$14:b068  21 86         and ($86,x)
$14:b06a  f0 80         beq $afec
$14:b06c  00 c0         brk #$c0
$14:b06e  48            pha
$14:b06f  73 98         adc ($98,s),y
$14:b071  44 de 89      mvp $89,$de
$14:b074  30 49         bmi $b0bf
$14:b076  05 00         ora $00
$14:b078  1a            inc a
$14:b079  e7 0f         sbc [$0f]
$14:b07b  40            rti
$14:b07c  f1 74         sbc ($74),y
$14:b07e  a0 8b         ldy #$8b
$14:b080  70 81         bvs $b003
$14:b082  c6 20         dec $20
$14:b084  73 89         adc ($89,s),y
$14:b086  dc c6 7e      jml [$7ec6]
$14:b089  5d 02 80      eor $8002,x
$14:b08c  41 a0         eor ($a0,x)
$14:b08e  30 58         bmi $b0e8
$14:b090  54 6e 09      mvn $09,$6e
$14:b093  0e 88 43      asl $4388
$14:b096  a5 03         lda $03
$14:b098  70 12         bvs $b0ac
$14:b09a  1d 02 b1      ora $b102,x
$14:b09d  f8            sed
$14:b09e  f0 7c         beq $b11c
$14:b0a0  02 e3         cop #$e3
$14:b0a2  f8            sed
$14:b0a3  f8            sed
$14:b0a4  27 c1         and [$c1]
$14:b0a6  20 02 01      jsr $0102
$14:b0a9  c4 42         cpy $42
$14:b0ab  22 01 30 a0   jsl $a03001
$14:b0af  5a            phy
$14:b0b0  2c 12 89      bit $8912
$14:b0b3  01 40         ora ($40,x)
$14:b0b5  22 90 39 5c   jsl $5c3990
$14:b0b9  5e b9 34      lsr $34b9,x
$14:b0bc  a0 ca         ldy #$ca
$14:b0be  35 76         and $76,x
$14:b0c0  8d bd 93      sta $93bd
$14:b0c3  77 60         adc [$60],y
$14:b0c5  0f 80 fc 80   ora $80fc80
$14:b0c9  21 17         and ($17,x)
$14:b0cb  23 0c         and $0c,s
$14:b0cd  6e 01 1f      ror $1f01
$14:b0d0  80 28         bra $b0fa
$14:b0d2  42 31         wdm #$31
$14:b0d4  e0 f2         cpx #$f2
$14:b0d6  7e 39 50      ror $5039,x
$14:b0d9  cd 64 c2      cmp $c264
$14:b0dc  95 4c         sta $4c,x
$14:b0de  f2 c1         sbc ($c1)
$14:b0e0  be b0 61      ldx $61b0,y
$14:b0e3  fa            plx
$14:b0e4  27 c3         and [$c3]
$14:b0e6  81 00         sta ($00,x)
$14:b0e8  d8            cld
$14:b0e9  40            rti
$14:b0ea  3f 06 a1 79   and $79a106,x
$14:b0ee  08            php
$14:b0ef  04 20         tsb $20
$14:b0f1  23 f4         and $f4,s
$14:b0f3  01 04         ora ($04,x)
$14:b0f5  0e 1f 03      asl $031f
$14:b0f8  82 1f c1      brl $721a
$14:b0fb  e4 27         cpx $27
$14:b0fd  43 82         eor $82,s
$14:b0ff  2d c7 83      and $83c7
$14:b102  1f e1 c7 29   ora $29c7e1,x
$14:b106  91 0d         sta ($0d),y
$14:b108  46 2e         lsr $2e
$14:b10a  a9 47 80      lda #$8047
$14:b10d  48            pha
$14:b10e  e4 4b         cpx $4b
$14:b110  80 80         bra $b092
$14:b112  9b            txy
$14:b113  43 fe         eor $fe,s
$14:b115  a0 08         ldy #$08
$14:b117  1d fe 0f      ora $0ffe,x
$14:b11a  7f e5 cf e8   adc $e8cfe5,x
$14:b11e  f3 e8         sbc ($e8,s),y
$14:b120  0c 0e 19      tsb $190e
$14:b123  f0 fc         beq $b121
$14:b125  7f e1 f8 fc   adc $fcf8e1,x
$14:b129  3e 5b e7      rol $e75b,x
$14:b12c  e4 b9         cpx $b9
$14:b12e  c2 38         rep #$38
$14:b130  83 f2         sta $f2,s
$14:b132  b9 5d 56      lda $565d,y
$14:b135  21 fa         and ($fa,x)
$14:b137  b9 7f 2d      lda $2d7f,y
$14:b13a  1f d8 c7 eb   ora $ebc7d8,x
$14:b13e  e1 70         sbc ($70,x)
$14:b140  c6 60         dec $60
$14:b142  2e 02 90      rol $9002
$14:b145  c0 19 c0      cpy #$c019
$14:b148  46 03         lsr $03
$14:b14a  f3 b0         sbc ($b0,s),y
$14:b14c  58            cli
$14:b14d  2e 1f 0d      rol $0d1f
$14:b150  03 68         ora $68,s
$14:b152  02 60         cop #$60
$14:b154  d3 68         cmp ($68,s),y
$14:b156  04 82         tsb $82
$14:b158  41 00         eor ($00,x)
$14:b15a  83 c0         sta $c0,s
$14:b15c  22 10 64 68   jsl $686410
$14:b160  42 21         wdm #$21
$14:b162  91 e8         sta ($e8),y
$14:b164  0c c5 32      tsb $32c5
$14:b167  10 88         bpl $b0f1
$14:b169  0c 3e 21      tsb $213e
$14:b16c  12 86         ora ($86)
$14:b16e  c5 8a         cmp $8a
$14:b170  00 3f         brk #$3f
$14:b172  18            clc
$14:b173  d4 12         pei ($12)
$14:b175  69 08 95      adc #$9508
$14:b178  c5 17         cmp $17
$14:b17a  a0 0f 6e      ldy #$6e0f
$14:b17d  07 03         ora [$03]
$14:b17f  e1 f0         sbc ($f0,x)
$14:b181  98            tya
$14:b182  19 41 ca      ora $ca41,y
$14:b185  c1 f0         cmp ($f0,x)
$14:b187  c0 36 c2      cpy #$c236
$14:b18a  21 10         and ($10,x)
$14:b18c  07 91         ora [$91]
$14:b18e  c0 11 63      cpy #$6311
$14:b191  01 e4         ora ($e4,x)
$14:b193  70 e0         bvs $b175
$14:b195  34 3a         bit $3a,x
$14:b197  0d 8d 7a      ora $7a8d
$14:b19a  07 20         ora [$20]
$14:b19c  83 40         sta $40,s
$14:b19e  60            rts
$14:b19f  b0 a0         bcs $b141
$14:b1a1  48            pha
$14:b1a2  67 b0         adc [$b0]
$14:b1a4  15 68         ora $68,x
$14:b1a6  44 51 1a      mvp $1a,$51
$14:b1a9  00 f2         brk #$f2
$14:b1ab  a0 51 3c      ldy #$3c51
$14:b1ae  de 0f a7      dec $a70f,x
$14:b1b1  83 e1         sta $e1,s
$14:b1b3  e0 fb 7e      cpx #$7efb
$14:b1b6  03 c0         ora $c0,s
$14:b1b8  1f 16 a0 60   ora $60a016,x
$14:b1bc  a0 15 4a      ldy #$4a15
$14:b1bf  05 92         ora $92
$14:b1c1  c1 6a         cmp ($6a,x)
$14:b1c3  b0 52         bcs $b217
$14:b1c5  a8            tay
$14:b1c6  82 f6 a4      brl $56bf
$14:b1c9  70 e1         bvs $b1ac
$14:b1cb  14 32         trb $32
$14:b1cd  00 43         brk #$43
$14:b1cf  3d 23 f6      and $f623,x
$14:b1d2  cd c1 2b      cmp $2bc1
$14:b1d5  d0 02         bne $b1d9
$14:b1d7  58            cli
$14:b1d8  6c a1 85      jmp ($85a1)
$14:b1db  f0 47         beq $b224
$14:b1dd  8b            phb
$14:b1de  3c 3c 05      bit $053c,x
$14:b1e1  91 f8         sta ($f8),y
$14:b1e3  79 be d7      adc $d7be,y
$14:b1e6  0c a1 7d      tsb $7da1
$14:b1e9  1a            inc a
$14:b1ea  81 50         sta ($50,x)
$14:b1ec  a0 36 c2      ldy #$c236
$14:b1ef  45 22         eor $22
$14:b1f1  c2 38         rep #$38
$14:b1f3  41 1e         eor ($1e,x)
$14:b1f5  23 31         and $31,s
$14:b1f7  98            tya
$14:b1f8  42 22         wdm #$22
$14:b1fa  70 88         bvs $b184
$14:b1fc  1c 42 27      trb $2742
$14:b1ff  3b            tsc
$14:b200  9b            txy
$14:b201  0f d2 4b 0a   ora $0a4bd2
$14:b205  8d c1 23      sta $23c1
$14:b208  d0 09         bne $b213
$14:b20a  34 62         bit $62,x
$14:b20c  09 3b 47      ora #$473b
$14:b20f  d7 a3         cmp [$a3],y
$14:b211  f1 d0         sbc ($d0),y
$14:b213  2f 28 80 05   and $058028
$14:b217  c0 94 0a      cpy #$0a94
$14:b21a  45 21         eor $21
$14:b21c  28            plp
$14:b21d  11 e8         ora ($e8),y
$14:b21f  fc 02 1d      jsr ($1d02,x)
$14:b222  19 80 c4      ora $c480,y
$14:b225  60            rts
$14:b226  f0 92         beq $b1ba
$14:b228  08            php
$14:b229  40            rti
$14:b22a  c6 60         dec $60
$14:b22c  5f 08 2c d2   eor $d22c08,x
$14:b230  27 20         and [$20]
$14:b232  8d 49 23      sta $2349
$14:b235  92 08         sta ($08)
$14:b237  64 42         stz $42
$14:b239  0d 08 81      ora $8108
$14:b23c  40            rti
$14:b23d  60            rts
$14:b23e  30 0f         bmi $b24f
$14:b240  80 3c         bra $b27e
$14:b242  cb            wai
$14:b243  21 c0         and ($c0,x)
$14:b245  f0 40         beq $b287
$14:b247  38            sec
$14:b248  08            php
$14:b249  f2 90         sbc ($90)
$14:b24b  07 d5         ora [$d5]
$14:b24d  1e 58 04      asl $0458,x
$14:b250  79 9c 51      adc $519c,y
$14:b253  72 0b         adc ($0b)
$14:b255  90 39         bcc $b290
$14:b257  00 f0         brk #$f0
$14:b259  0f ec c7 28   ora $28c7ec
$14:b25d  ac 20 96      ldy $9620
$14:b260  08            php
$14:b261  f8            sed
$14:b262  07 87         ora [$87]
$14:b264  e3 d1         sbc $d1,s
$14:b266  b8            clv
$14:b267  0c 00 a8      tsb $a800
$14:b26a  54 6d 48      mvn $48,$6d
$14:b26d  ac 42 26      ldy $2642
$14:b270  10 08         bpl $b27a
$14:b272  38            sec
$14:b273  b1 45         lda ($45),y
$14:b275  8b            phb
$14:b276  0d 61 01      ora $0161
$14:b279  c6 e0         dec $e0
$14:b27b  22 63 7d 83   jsl $837d63
$14:b27f  ec 01 a1      cpx $a101
$14:b282  01 38         ora ($38,x)
$14:b284  04 0e         tsb $0e
$14:b286  f3 86         sbc ($86,s),y
$14:b288  05 83         ora $83
$14:b28a  e4 1f         cpx $1f
$14:b28c  03 04         ora $04,s
$14:b28e  22 84 12 10   jsl $101284
$14:b292  ab            plb
$14:b293  08            php
$14:b294  14 38         trb $38
$14:b296  32 3c         and ($3c)
$14:b298  0c 00 ac      tsb $ac00
$14:b29b  3c 16 0b      bit $0b16,x
$14:b29e  80 54         bra $b2f4
$14:b2a0  7e 11 9f      ror $9f11,x
$14:b2a3  03 84         ora $84,s
$14:b2a5  8a            txa
$14:b2a6  60            rts
$14:b2a7  26 0a         rol $0a
$14:b2a9  07 01         ora [$01]
$14:b2ab  94 0e         sty $0e,x
$14:b2ad  70 07         bvs $b2b6
$14:b2af  00 78         brk #$78
$14:b2b1  0a            asl a
$14:b2b2  40            rti
$14:b2b3  d3 8c         cmp ($8c,s),y
$14:b2b5  84 02         sty $02
$14:b2b7  c0 d3 a2      cpy #$a2d3
$14:b2ba  00 90         brk #$90
$14:b2bc  04 1a         tsb $1a
$14:b2be  0d 37 89      ora $8937
$14:b2c1  c3 20         cmp $20,s
$14:b2c3  8a            txa
$14:b2c4  61 7a         adc ($7a,x)
$14:b2c6  4c c1 6a      jmp $6ac1
$14:b2c9  16 02         asl $02,x
$14:b2cb  f0 24         beq $b2f1
$14:b2cd  0d a6 56      ora $56a6
$14:b2d0  05 b0         ora $b0
$14:b2d2  38            sec
$14:b2d3  44 bc 2d      mvp $2d,$bc
$14:b2d6  35 80         and $80,x
$14:b2d8  d0 e0         bne $b2ba
$14:b2da  30 38         bmi $b314
$14:b2dc  48            pha
$14:b2dd  c8            iny
$14:b2de  61 0a         adc ($0a,x)
$14:b2e0  51 4a         eor ($4a),y
$14:b2e2  81 48         sta ($48,x)
$14:b2e4  2e 90 88      rol $8890
$14:b2e7  a4 22         ldy $22
$14:b2e9  39 00 86      and $8600,y
$14:b2ec  44 16 00      mvp $00,$16
$14:b2ef  81 05         sta ($05,x)
$14:b2f1  08            php
$14:b2f2  28            plp
$14:b2f3  83 e0         sta $e0,s
$14:b2f5  4f 15 d8 2e   eor $2ed815
$14:b2f9  c4 28         cpy $28
$14:b2fb  0b            phd
$14:b2fc  20 69 8d      jsr $8d69
$14:b2ff  00 be         brk #$be
$14:b301  6c d1 64      jmp ($64d1)
$14:b304  03 08         ora $08,s
$14:b306  a0 13 f8      ldy #$f813
$14:b309  a4 7e         ldy $7e
$14:b30b  14 33         trb $33
$14:b30d  18            clc
$14:b30e  38            sec
$14:b30f  cc 07 29      cpy $2907
$14:b312  a5 af         lda $af
$14:b314  45 61         eor $61
$14:b316  51 a8         eor ($a8),y
$14:b318  21 14         and ($14,x)
$14:b31a  21 84         and ($84,x)
$14:b31c  85 fa         sta $fa
$14:b31e  6b            rtl
$14:b31f  3e 1a 4c      rol $4c1a,x
$14:b322  87 40         sta [$40]
$14:b324  a6 2c         ldx $2c
$14:b326  00 2d         brk #$2d
$14:b328  1c 83 e1      trb $e183
$14:b32b  5c d0 31 82   jml $8231d0
$14:b32f  c1 60         cmp ($60,x)
$14:b331  2f 83 10 0d   and $0d1083
$14:b335  67 2d         adc [$2d]
$14:b337  8b            phb
$14:b338  c5 22         cmp $22
$14:b33a  70 75         bvs $b3b1
$14:b33c  98            tya
$14:b33d  0c c0 62      tsb $62c0
$14:b340  07 b2         ora [$b2]
$14:b342  88            dey
$14:b343  cb            wai
$14:b344  e4 51         cpx $51
$14:b346  d8            cld
$14:b347  c4 8e         cpy $8e
$14:b349  39 20 22      and $2220,y
$14:b34c  84 12         sty $12
$14:b34e  10 8b         bpl $b2db
$14:b350  2c 45 63      bit $6345
$14:b353  01 98         ora ($98,x)
$14:b355  98            tya
$14:b356  5c 12 b1 28   jml $28b112
$14:b35a  c4 54         cpy $54
$14:b35c  34 02         bit $02,x
$14:b35e  01 b0         ora ($b0,x)
$14:b360  70 0b         bvs $b36d
$14:b362  42 6b         wdm #$6b
$14:b364  21 31         and ($31,x)
$14:b366  1e c2 09      asl $09c2,x
$14:b369  00 1b         brk #$1b
$14:b36b  80 dc         bra $b349
$14:b36d  23 11         and $11,s
$14:b36f  28            plp
$14:b370  f1 1c         sbc ($1c),y
$14:b372  0f 20 48 08   ora $084820
$14:b376  0c 16 15      tsb $1516
$14:b379  1b            tcs
$14:b37a  82 47 a0      brl $53c4
$14:b37d  10 58         bpl $b3d7
$14:b37f  c4 45         cpy $45
$14:b381  0e 05 b4      asl $b405
$14:b384  4b            phk
$14:b385  81 48         sta ($48,x)
$14:b387  c9 e0 67      cmp #$67e0
$14:b38a  05 58         ora $58
$14:b38c  08            php
$14:b38d  4a            lsr a
$14:b38e  a0 5f 4a      ldy #$4a5f
$14:b391  01 30         ora ($30,x)
$14:b393  60            rts
$14:b394  87 51         sta [$51]
$14:b396  83 be         sta $be,s
$14:b398  42 01         wdm #$01
$14:b39a  01 3d         ora ($3d,x)
$14:b39c  94 4a         sty $4a,x
$14:b39e  18            clc
$14:b39f  81 08         sta ($08,x)
$14:b3a1  e4 01         cpx $01
$14:b3a3  0a            asl a
$14:b3a4  10 f5         bpl $b39b
$14:b3a6  c8            iny
$14:b3a7  41 11         eor ($11,x)
$14:b3a9  65 9c         adc $9c
$14:b3ab  fa            plx
$14:b3ac  47 3f         eor [$3f]
$14:b3ae  85 20         sta $20
$14:b3b0  fc 7f 2e      jsr ($2e7f,x)
$14:b3b3  1f 88 07 81   ora $810788,x
$14:b3b7  36 71         rol $71,x
$14:b3b9  8e 44 22      stx $2244
$14:b3bc  71 38         adc ($38),y
$14:b3be  88            dey
$14:b3bf  44 21 10      mvp $10,$21
$14:b3c2  00 f0         brk #$f0
$14:b3c4  3a            dec a
$14:b3c5  da            phx
$14:b3c6  50 f4         bvc $b3bc
$14:b3c8  18            clc
$14:b3c9  64 61         stz $61
$14:b3cb  92 06         sta ($06)
$14:b3cd  70 36         bvs $b405
$14:b3cf  ac 42 49      ldy $4942
$14:b3d2  18            clc
$14:b3d3  8a            txa
$14:b3d4  48            pha
$14:b3d5  18            clc
$14:b3d6  a1 08         lda ($08,x)
$14:b3d8  88            dey
$14:b3d9  2b            pld
$14:b3da  04 9a         tsb $9a
$14:b3dc  09 1b 24      ora #$241b
$14:b3df  80 e8         bra $b3c9
$14:b3e1  d2 30         cmp ($30)
$14:b3e3  5a            phy
$14:b3e4  35 35         and $35,x
$14:b3e6  36 8d         rol $8d,x
$14:b3e8  23 70         and $70,s
$14:b3ea  48            pha
$14:b3eb  a4 5a         ldy $5a
$14:b3ed  7d 40 8b      adc $8b40,x
$14:b3f0  24 60         bit $60
$14:b3f2  e6 12         inc $12
$14:b3f4  ca            dex
$14:b3f5  25 aa         and $aa
$14:b3f7  01 14         ora ($14,x)
$14:b3f9  39 81 b1      and $b181,y
$14:b3fc  09 81 03      ora #$0381
$14:b3ff  80 c1         bra $b3c2
$14:b401  e0 0f 60      cpx #$600f
$14:b404  48            pha
$14:b405  0c 62 30      tsb $3062
$14:b408  cd 58 04      cmp $0458
$14:b40b  19 3c 71      ora $713c,y
$14:b40e  08            php
$14:b40f  89 70 70      bit #$7070
$14:b412  18            clc
$14:b413  0e 07 03      asl $0307
$14:b416  c1 e0         cmp ($e0,x)
$14:b418  f8            sed
$14:b419  5c 3e 12 02   jml $02123e
$14:b41d  c0 5c 02      cpy #$025c
$14:b420  03 00         ora $00,s
$14:b422  a0 40 34      ldy #$3440
$14:b425  18            clc
$14:b426  0a            asl a
$14:b427  85 02         sta $02
$14:b429  51 20         eor ($20),y
$14:b42b  c4 1a         cpy $1a
$14:b42d  00 f6         brk #$f6
$14:b42f  49 f1 84      eor #$84f1
$14:b432  3d 04 6e      and $6e04,x
$14:b435  30 d1         bmi $b408
$14:b437  d8            cld
$14:b438  1c 41 ec      trb $ec41
$14:b43b  10 e3         bpl $b420
$14:b43d  b0 44         bcs $b483
$14:b43f  22 90 89 64   jsl $648990
$14:b443  42 54         wdm #$54
$14:b445  4a            lsr a
$14:b446  13 61         ora ($61,s),y
$14:b448  85 07         sta $07
$14:b44a  e1 d0         sbc ($d0,x)
$14:b44c  f8            sed
$14:b44d  70 3e         bvs $b48d
$14:b44f  1e 0d 82      asl $820d,x
$14:b452  c0 e8 02      cpy #$02e8
$14:b455  30 80         bmi $b3d7
$14:b457  44 26 19      mvp $19,$26
$14:b45a  0f 06 03 e1   ora $e10306
$14:b45e  18            clc
$14:b45f  90 23         bcc $b484
$14:b461  48            pha
$14:b462  6a            ror a
$14:b463  14 8e         trb $8e
$14:b465  1c 26 87      trb $8726
$14:b468  0c 84 c7      tsb $c784
$14:b46b  ff 13 f8 62   sbc $62f813,x
$14:b46f  84 06         sty $06
$14:b471  41 0a         eor ($0a,x)
$14:b473  82 63 a2      brl $56d9
$14:b476  14 e8         trb $e8
$14:b478  85 0a         sta $0a
$14:b47a  39 a5 8d      and $8da5,y
$14:b47d  6c e9 85      jmp ($85e9)
$14:b480  12 c0         ora ($c0)
$14:b482  78            sei
$14:b483  0b            phd
$14:b484  43 f0         eor $f0,s
$14:b486  b3 65         lda ($65,s),y
$14:b488  be 1a 4f      ldx $4f1a,y
$14:b48b  a5 b0         lda $b0
$14:b48d  42 46         wdm #$46
$14:b48f  e0 13 80      cpx #$8013
$14:b492  9c 30 56      stz $5630
$14:b495  2b            pld
$14:b496  26 c3         rol $c3
$14:b498  21 60         and ($60,x)
$14:b49a  66 14         ror $14
$14:b49c  08            php
$14:b49d  08            php
$14:b49e  23 50         and $50,s
$14:b4a0  1a            inc a
$14:b4a1  85 02         sta $02
$14:b4a3  c7 21         cmp [$21]
$14:b4a5  93 8c         sta ($8c,s),y
$14:b4a7  04 0c         tsb $0c
$14:b4a9  10 18         bpl $b4c3
$14:b4ab  2c 2a 37      bit $372a
$14:b4ae  04 8f         tsb $8f
$14:b4b0  40            rti
$14:b4b1  22 d0 88 a4   jsl $a488d0
$14:b4b5  25 d6         and $d6
$14:b4b7  74 0a         stz $0a,x
$14:b4b9  47 e0         eor [$e0]
$14:b4bb  ac 05 60      ldy $6005
$14:b4be  f8            sed
$14:b4bf  7a            ply
$14:b4c0  3f 15 00 f9   and $f90015,x
$14:b4c4  38            sec
$14:b4c5  48            pha
$14:b4c6  4e 0e 81      lsr $810e
$14:b4c9  a8            tay
$14:b4ca  54 3f 11      mvn $11,$3f
$14:b4cd  98            tya
$14:b4ce  dc 4a 09      jml [$094a]
$14:b4d1  11 83         ora ($83),y
$14:b4d3  bc c1 80      ldy $80c1,x
$14:b4d6  30 25         bmi $b4fd
$14:b4d8  98            tya
$14:b4d9  2c 46 79      bit $7946
$14:b4dc  3e 80 cf      rol $cf80,x
$14:b4df  20 11 c9      jsr $c911
$14:b4e2  04 3a         tsb $3a
$14:b4e4  21 07         and ($07,x)
$14:b4e6  84 40         sty $40
$14:b4e8  a0 30 11      ldy #$1130
$14:b4eb  60            rts
$14:b4ec  7c 2e 01      jmp ($012e,x)
$14:b4ef  01 b0         ora ($b0,x)
$14:b4f1  7c 28 1e      jmp ($1e28,x)
$14:b4f4  0c 07 00      tsb $0007
$14:b4f7  be 9c 01      ldx $019c,y
$14:b4fa  01 a7         ora ($a7,x)
$14:b4fc  c1 be         cmp ($be,x)
$14:b4fe  42 c4         wdm #$c4
$14:b500  59 8c 41      eor $418c,y
$14:b503  6e 4c 00      ror $004c
$14:b506  62 02 fd      per $b20b
$14:b509  22 ac 65 65   jsl $6565ac
$14:b50d  83 3d         sta $3d,s
$14:b50f  02 e0         cop #$e0
$14:b511  97 00         sta [$00],y
$14:b513  78            sei
$14:b514  d0 2e         bne $b544
$14:b516  16 86         asl $86,x
$14:b518  fc 3b 03      jsr ($033b,x)
$14:b51b  81 70         sta ($70,x)
$14:b51d  35 80         and $80,x
$14:b51f  a0 4d e8      ldy #$e84d
$14:b522  0d 03 ab      ora $ab03
$14:b525  1c d4 16      trb $16d4
$14:b528  0c 00 82      tsb $8200
$14:b52b  ac c2 03      ldy $03c2
$14:b52e  0f 90 47 e8   ora $e84790
$14:b532  13 fc         ora ($fc,s),y
$14:b534  04 fe         tsb $fe
$14:b536  01 7f         ora ($7f,x)
$14:b538  80 77         bra $b5b1
$14:b53a  e0 1e 38      cpx #$381e
$14:b53d  20 24 12      jsr $1224
$14:b540  e5 ff         sbc $ff
$14:b542  4c 06 01      jmp $0106
$14:b545  4e 1d f9      lsr $f91d
$14:b548  07 be         ora [$be]
$14:b54a  21 40         and ($40,x)
$14:b54c  2c 84 13      bit $1384
$14:b54f  f1 06         sbc ($06),y
$14:b551  fe 40 d6      inc $d640,x
$14:b554  a1 fb         lda ($fb,x)
$14:b556  83 ff         sta $ff,s
$14:b558  e1 ff         sbc ($ff,x)
$14:b55a  f9 fc 42      sbc $42fc,y
$14:b55d  01 fc         ora ($fc,x)
$14:b55f  60            rts
$14:b560  0f f9 80 3f   ora $3f80f9
$14:b564  80 70         bra $b5d6
$14:b566  40            rti
$14:b567  3b            tsc
$14:b568  91 c3         sta ($c3),y
$14:b56a  7b            tdc
$14:b56b  8a            txa
$14:b56c  c0 34 1c      cpy #$1c34
$14:b56f  0c 07 81      tsb $8107
$14:b572  a1 14         lda ($14,x)
$14:b574  07 40         ora [$40]
$14:b576  c8            iny
$14:b577  00 81         brk #$81
$14:b579  3d 83 cf      and $cf83,x
$14:b57c  e0 70 f8      cpx #$f870
$14:b57f  45 1a         eor $1a
$14:b581  09 31 80      ora #$8031
$14:b584  43 46         eor $46,s
$14:b586  42 f9         wdm #$f9
$14:b588  08            php
$14:b589  75 8a         adc $8a,x
$14:b58b  05 19         ora $19
$14:b58d  90 cb         bcc $b55a
$14:b58f  62 14 48      per $fda6
$14:b592  54 d6 04      mvn $04,$d6
$14:b595  4d 2c 04      eor $042c
$14:b598  02 c0         cop #$c0
$14:b59a  6f 73 79 68   adc $687973
$14:b59e  2a            rol a
$14:b59f  0d e1 07      ora $07e1
$14:b5a2  81 be         sta ($be,x)
$14:b5a4  20 e8 a0      jsr $a0e8
$14:b5a7  84 27         sty $27
$14:b5a9  c2 06         rep #$06
$14:b5ab  8b            phb
$14:b5ac  04 78         tsb $78
$14:b5ae  3f 06 00 0b   and $0b0006,x
$14:b5b2  08            php
$14:b5b3  9c 32 3d      stz $3d32
$14:b5b6  00 87         brk #$87
$14:b5b8  44 20 c3      mvp $c3,$20
$14:b5bb  51 44         eor ($44),y
$14:b5bd  82 28 2f      brl $e4e8
$14:b5c0  18            clc
$14:b5c1  4f c4 13 f9   eor $f913c4
$14:b5c5  6c be 7f      jmp ($7fbe)
$14:b5c8  2f 1f cb 03   and $03cb1f
$14:b5cc  24 02         bit $02
$14:b5ce  23 7c         and $7c,s
$14:b5d0  64 0f         stz $0f
$14:b5d2  e2 11         sep #$11
$14:b5d4  18            clc
$14:b5d5  8c 44 17      sty $1744
$14:b5d8  e0 d9         cpx #$d9
$14:b5da  11 68         ora ($68),y
$14:b5dc  47 e0         eor [$e0]
$14:b5de  10 f7         bpl $b5d7
$14:b5e0  98            tya
$14:b5e1  41 a0         eor ($a0,x)
$14:b5e3  30 31         bmi $b616
$14:b5e5  78            sei
$14:b5e6  22 c0 76 46   jsl $4676c0
$14:b5ea  f0 37         beq $b623
$14:b5ec  81 14         sta ($14,x)
$14:b5ee  22 90 88 24   jsl $248890
$14:b5f2  22 05 04 25   jsl $250405
$14:b5f6  97 c2         sta [$c2],y
$14:b5f8  09 e0 c8      ora #$c8e0
$14:b5fb  78            sei
$14:b5fc  04 01         tsb $01
$14:b5fe  f0 e0         beq $b5e0
$14:b600  08            php
$14:b601  40            rti
$14:b602  d6 4c         dec $4c,x
$14:b604  01 10         ora ($10,x)
$14:b606  80 44         bra $b64c
$14:b608  3a            dec a
$14:b609  0d c0 c0      ora $c0c0
$14:b60c  3a            dec a
$14:b60d  40            rti
$14:b60e  48            pha
$14:b60f  57 3b         eor [$3b],y
$14:b611  f4 2e 87      pea $872e
$14:b614  09 82 c2      ora #$c282
$14:b617  60            rts
$14:b618  f0 91         beq $b5ab
$14:b61a  b0 8e         bcs $b5aa
$14:b61c  ca            dex
$14:b61d  59 23 b6      eor $b623,y
$14:b620  44 e3 d0      mvp $d0,$e3
$14:b623  18            clc
$14:b624  64 42         stz $42
$14:b626  19 00 82      ora $8200,y
$14:b629  12 8f         ora ($8f)
$14:b62b  f1 a0         sbc ($a0),y
$14:b62d  e8            inx
$14:b62e  46 36         lsr $36
$14:b630  1b            tcs
$14:b631  8f 87 e1 2a   sta $2ae187
$14:b635  18            clc
$14:b636  01 08         ora ($08,x)
$14:b638  8b            phb
$14:b639  43 21         eor $21,s
$14:b63b  e8            inx
$14:b63c  0f 85 83 41   ora $418385
$14:b640  60            rts
$14:b641  b0 50         bcs $b693
$14:b643  15 20         ora $20,x
$14:b645  aa            tax
$14:b646  31 61         and ($61),y
$14:b648  41 60         eor ($60,x)
$14:b64a  63 50         adc $50,s
$14:b64c  86 42         stx $42
$14:b64e  6b            rtl
$14:b64f  fd 88 fd      sbc $fd88,x
$14:b652  32 3e         and ($3e)
$14:b654  21 11         and ($11,x)
$14:b656  b0 11         bcs $b669
$14:b658  c1 06         cmp ($06,x)
$14:b65a  10 38         bpl $b694
$14:b65c  e6 16         inc $16
$14:b65e  35 53         and $53,x
$14:b660  86 6f         stx $6f
$14:b662  db            stp
$14:b663  65 80         adc $80
$14:b665  4b            phk
$14:b666  82 54 2c      brl $e2bd
$14:b669  1b            tcs
$14:b66a  06 c0         asl $c0
$14:b66c  05 83         ora $83
$14:b66e  ed 06 07      sbc $0706
$14:b671  1a            inc a
$14:b672  ac 5c 81      ldy $815c
$14:b675  40            rti
$14:b676  d8            cld
$14:b677  64 2c         stz $2c
$14:b679  1f 25 d8 32   ora $32d825,x
$14:b67d  40            rti
$14:b67e  8e 0b 60      stx $600b
$14:b681  83 92         sta $92,s
$14:b683  04 f4         tsb $f4
$14:b685  71 58         adc ($58),y
$14:b687  54 52 13      mvn $13,$52
$14:b68a  1c 80 31      trb $3180
$14:b68d  42 1d         wdm #$1d
$14:b68f  00 3c         brk #$3c
$14:b691  02 2c         cop #$2c
$14:b693  bd 1f 88      lda $881f,x
$14:b696  c5 e2         cmp $e2
$14:b698  e1 f8         sbc ($f8,x)
$14:b69a  6a            ror a
$14:b69b  92 65         sta ($65)
$14:b69d  1e 01 d0      asl $d001,x
$14:b6a0  88            dey
$14:b6a1  6c 26 10      jmp ($1026)
$14:b6a4  85 60         sta $60
$14:b6a6  bf 81 56 40   lda $405681,x
$14:b6aa  10 82         bpl $b62e
$14:b6ac  ab            plb
$14:b6ad  05 76         ora $76
$14:b6af  0c d0 5d      tsb $5dd0
$14:b6b2  93 28         sta ($28,s),y
$14:b6b4  20 70 48      jsr $4870
$14:b6b7  7b            tdc
$14:b6b8  c4 21         cpy $21
$14:b6ba  c3 60         cmp $60,s
$14:b6bc  82 c2 86      brl $3d81
$14:b6bf  c1 06         cmp ($06,x)
$14:b6c1  1a            inc a
$14:b6c2  8f 0e 3f 87   sta $873f0e
$14:b6c6  9f a4 42 0f   sta $0f42a4,x
$14:b6ca  9f 81 df f1   sta $f1df81,x
$14:b6ce  f3 fa         sbc ($fa,s),y
$14:b6d0  1b            tcs
$14:b6d1  f4 20 ff      pea $ff20
$14:b6d4  88            dey
$14:b6d5  01 60         ora ($60,x)
$14:b6d7  3e 30 15      rol $1530,x
$14:b6da  18            clc
$14:b6db  74 60         stz $60,x
$14:b6dd  3e 78 3d      rol $3d78,x
$14:b6e0  e7 03         sbc [$03]
$14:b6e2  ff 80 79 ff   sbc $ff7980,x
$14:b6e6  fc 35 80      jsr ($8035,x)
$14:b6e9  ab            plb
$14:b6ea  c2 ff         rep #$ff
$14:b6ec  ff ff 7f f1   sbc $f17fff,x
$14:b6f0  1f e8 37 fa   ora $fa37e8,x
$14:b6f4  fd 7e ff      sbc $ff7e,x
$14:b6f7  b0 47         bcs $b740
$14:b6f9  fd fe fe      sbc $fefe,x
$14:b6fc  ff 58 a1 fa   sbc $faa158,x
$14:b700  fc f8 a0      jsr ($a0f8,x)
$14:b703  78            sei
$14:b704  0f 00 48 0c   ora $0c4800
$14:b708  00 13         brk #$13
$14:b70a  00 90         brk #$90
$14:b70c  58            cli
$14:b70d  3c 16 00      bit $0016,x
$14:b710  b0 58         bcs $b76a
$14:b712  24 10         bit $10
$14:b714  0b            phd
$14:b715  84 02         sty $02
$14:b717  61 00         adc ($00,x)
$14:b719  d8            cld
$14:b71a  60            rts
$14:b71b  1c 21 d0      trb $d021
$14:b71e  a0 4c 24      ldy #$244c
$14:b721  19 00 78      ora $7800,y
$14:b724  83 c0         sta $c0,s
$14:b726  ee 50 44      inc $4450
$14:b729  18            clc
$14:b72a  41 61         eor ($61,x)
$14:b72c  d0 f8         bne $b726
$14:b72e  61 24         adc ($24,x)
$14:b730  0d 86 7f      ora $7f86
$14:b733  24 50         bit $50
$14:b735  40            rti
$14:b736  21 d0         and ($d0,x)
$14:b738  a8            tay
$14:b739  b0 80         bcs $b6bb
$14:b73b  6c 0e 20      jmp ($200e)
$14:b73e  90 7e         bcc $b7be
$14:b740  26 1f         rol $1f
$14:b742  89 c6 f3      bit #$f3c6
$14:b745  70 1a         bvs $b761
$14:b747  13 39         ora ($39,s),y
$14:b749  54 32 18      mvn $18,$32
$14:b74c  8c 40 3c      sty $3c40
$14:b74f  2a            rol a
$14:b750  91 4a         sta ($4a),y
$14:b752  84 40         sty $40
$14:b754  52 06         eor ($06)
$14:b756  50 8b         bvc $b6e3
$14:b758  c0 23 32      cpy #$3223
$14:b75b  09 14 62      ora #$6214
$14:b75e  45 10         eor $10
$14:b760  98            tya
$14:b761  c2 23         rep #$23
$14:b763  4f e0 87 c2   eor $c287e0
$14:b767  62 d1 78      per $303b
$14:b76a  44 66 4d      mvp $4d,$66
$14:b76d  2b            pld
$14:b76e  88            dey
$14:b76f  48            pha
$14:b770  e2 93         sep #$93
$14:b772  58            cli
$14:b773  54 6e 09      mvn $09,$6e
$14:b776  02 86         cop #$86
$14:b778  40            rti
$14:b779  3f 10 88 44   and $448810,x
$14:b77d  52 19         eor ($19)
$14:b77f  8c c2 42      sty $42c2
$14:b782  3c 97 8b      bit $8b97,x
$14:b785  25 c3         and $c3
$14:b787  d1 d0         cmp ($d0),y
$14:b789  f8            sed
$14:b78a  66 20         ror $20
$14:b78c  17 8c         ora [$8c],y
$14:b78e  04 53         tsb $53
$14:b790  d1 0c         cmp ($0c),y
$14:b792  a0 4a         ldy #$4a
$14:b794  20 95 8e      jsr $8e95
$14:b797  25 c2         and $c2
$14:b799  11 10         ora ($10),y
$14:b79b  90 0b         bcc $b7a8
$14:b79d  d6 20         dec $20,x
$14:b79f  35 01         and $01,x
$14:b7a1  cd 48 e2      cmp $e248
$14:b7a4  04 7f         tsb $7f
$14:b7a6  fa            plx
$14:b7a7  16 7c         asl $7c,x
$14:b7a9  d4 60         pei ($60)
$14:b7ab  f1 00         sbc ($00),y
$14:b7ad  94 06         sty $06,x
$14:b7af  03 03         ora $03,s
$14:b7b1  5b            tcd
$14:b7b2  84 22         sty $22
$14:b7b4  07 cc         ora [$cc]
$14:b7b6  69 02 bc      adc #$bc02
$14:b7b9  c1 41         cmp ($41,x)
$14:b7bb  0a            asl a
$14:b7bc  83 0b         sta $0b,s
$14:b7be  82 35 06      brl $bdf6
$14:b7c1  ce e0 95      dec $95e0
$14:b7c4  e7 80         sbc [$80]
$14:b7c6  c0 70         cpy #$70
$14:b7c8  38            sec
$14:b7c9  1e 0f 27      asl $270f,x
$14:b7cc  db            stp
$14:b7cd  81 f0         sta ($f0,x)
$14:b7cf  88            dey
$14:b7d0  7d 97 e8      adc $e897,x
$14:b7d3  0f 06 b0 78   ora $78b006
$14:b7d7  bc 11 48      ldy $4811,x
$14:b7da  87 2b         sta [$2b]
$14:b7dc  81 3f         sta ($3f,x)
$14:b7de  1e 84 0e      asl $0e84,x
$14:b7e1  1f 06 87 c1   ora $c18706,x
$14:b7e5  21 2b         and ($2b,x)
$14:b7e7  40            rti
$14:b7e8  81 c0         sta ($c0,x)
$14:b7ea  81 e3         sta ($e3,x)
$14:b7ec  bf a0 43 e2   lda $e243a0,x
$14:b7f0  11 e8         ora ($e8),y
$14:b7f2  04 32         tsb $32
$14:b7f4  20 8e 06      jsr $068e
$14:b7f7  28            plp
$14:b7f8  40            rti
$14:b7f9  96 c1         stx $c1,y
$14:b7fb  00 fa         brk #$fa
$14:b7fd  43 3e         eor $3e,s
$14:b7ff  18            clc
$14:b800  4f 85 43 c0   eor $c04385
$14:b804  14 0f         trb $0f
$14:b806  06 01         asl $01
$14:b808  7c 7f 08      jmp ($087f,x)
$14:b80b  07 f2         ora [$f2]
$14:b80d  01 60         ora ($60,x)
$14:b80f  11 0d         ora ($0d),y
$14:b811  02 80         cop #$80
$14:b813  d2 17         cmp ($17)
$14:b815  02 c2         cop #$c2
$14:b817  23 10         and $10,s
$14:b819  01 a0         ora ($a0,x)
$14:b81b  9b            txy
$14:b81c  c1 c0         cmp ($c0,x)
$14:b81e  91 08         sta ($08),y
$14:b820  02 b8         cop #$b8
$14:b822  15 c1         ora $c1,x
$14:b824  18            clc
$14:b825  94 1b         sty $1b,x
$14:b827  01 c0         ora ($c0,x)
$14:b829  ad 02 8e      lda $8e02
$14:b82c  43 23         eor $23,s
$14:b82e  90 44         bcc $b874
$14:b830  70 12         bvs $b844
$14:b832  de 29 00      dec $0029,x
$14:b835  82 49 15      brl $cd81
$14:b838  a0 92         ldy #$92
$14:b83a  06 10         asl $10
$14:b83c  be c1 68      ldx $68c1,y
$14:b83f  24 b8         bit $b8
$14:b841  81 c1         sta ($c1,x)
$14:b843  0f e0 6f 13   ora $136fe0
$14:b847  a3 f0         lda $f0,s
$14:b849  63 e8         adc $e8,s
$14:b84b  f0 a0         beq $b7ed
$14:b84d  47 f4         eor [$f4]
$14:b84f  18            clc
$14:b850  fa            plx
$14:b851  85 0e         sta $0e
$14:b853  11 20         ora ($20),y
$14:b855  91 0e         sta ($0e),y
$14:b857  42 03         wdm #$03
$14:b859  f8            sed
$14:b85a  80 27         bra $b883
$14:b85c  c0 42         cpy #$42
$14:b85e  17 e8         ora [$e8],y
$14:b860  05 ff         ora $ff
$14:b862  81 3b         sta ($3b,x)
$14:b864  a2 4f         ldx #$4f
$14:b866  a0 30         ldy #$30
$14:b868  38            sec
$14:b869  67 fd         adc [$fd]
$14:b86b  5e 73 ef      lsr $ef73,x
$14:b86e  fc 01 6c      jsr ($6c01,x)
$14:b871  17 06         ora [$06],y
$14:b873  81 5f         sta ($5f,x)
$14:b875  af d7 fb fc   lda $fcfbd7
$14:b879  fa            plx
$14:b87a  7d 18 8c      adc $8c18,x
$14:b87d  61 e0         adc ($e0,x)
$14:b87f  1f e5 c8 63   ora $63c8e5,x
$14:b883  30 0b         bmi $b890
$14:b885  a0 90         ldy #$90
$14:b887  06 44         asl $44
$14:b889  56 c7         lsr $c7,x
$14:b88b  c1 b0         cmp ($b0,x)
$14:b88d  60            rts
$14:b88e  04 a2         tsb $a2
$14:b890  d3 98         cmp ($98,s),y
$14:b892  f4 06 3f      pea $3f06
$14:b895  00 87         brk #$87
$14:b897  c1 a2         cmp ($a2,x)
$14:b899  30 77         bmi $b912
$14:b89b  a8            tay
$14:b89c  42 20         wdm #$20
$14:b89e  67 00         adc [$00]
$14:b8a0  76 8c         ror $8c,x
$14:b8a2  82 7f 00      brl $b924
$14:b8a5  8f c8 23 92   sta $9223c8
$14:b8a9  08            php
$14:b8aa  a4 a2         ldy $a2
$14:b8ac  1d 10 81      ora $8110,x
$14:b8af  41 4e         eor ($4e,x)
$14:b8b1  81 78         sta ($78,x)
$14:b8b3  bc 66 23      ldy $2366,x
$14:b8b6  1d 8f c7      ora $c78f,x
$14:b8b9  43 f1         eor $f1,s
$14:b8bb  80 e8         bra $b8a5
$14:b8bd  34 44         bit $44,x
$14:b8bf  f8            sed
$14:b8c0  39 08 86      and $8608,y
$14:b8c3  82 81 20      brl $d947
$14:b8c6  90 12         bcc $b8da
$14:b8c8  02 61         cop #$61
$14:b8ca  10 a0         bpl $b86c
$14:b8cc  50 1c         bvc $b8ea
$14:b8ce  a5 0c         lda $0c
$14:b8d0  88            dey
$14:b8d1  cf 20 13 28   cmp $281320
$14:b8d5  64 82         stz $82
$14:b8d7  27 2c         and [$2c]
$14:b8d9  8c c5 21      sty $21c5
$14:b8dc  30 98         bmi $b876
$14:b8de  3c 1d e4      bit $e41d,x
$14:b8e1  11 09         ora ($09),y
$14:b8e3  ec 0a 77      cpx $770a
$14:b8e6  00 92         brk #$92
$14:b8e8  c6 25         dec $25
$14:b8ea  d1 08         cmp ($08),y
$14:b8ec  ac 2a 13      ldy $132a
$14:b8ef  06 1e         asl $1e
$14:b8f1  84 a3         sty $a3
$14:b8f3  b1 34         lda ($34),y
$14:b8f5  86 59         stx $59
$14:b8f7  31 9e         and ($9e),y
$14:b8f9  0e 64 22      asl $2264
$14:b8fc  69 d0 84      adc #$84d0
$14:b8ff  7c 38 1e      jmp ($1e38,x)
$14:b902  08            php
$14:b903  05 a2         ora $a2
$14:b905  21 f4         and ($f4,x)
$14:b907  84 59         sty $59
$14:b909  21 16         and ($16,x)
$14:b90b  0a            asl a
$14:b90c  65 63         adc $63
$14:b90e  09 d0 94      ora #$94d0
$14:b911  7c 20 05      jmp ($0520,x)
$14:b914  d0 17         bne $b92d
$14:b916  94 f2         sty $f2,x
$14:b918  03 20         ora $20,s
$14:b91a  8f ca 23 11   sta $1123ca
$14:b91e  68            pla
$14:b91f  40            rti
$14:b920  ed a7 d0      sbc $d0a7
$14:b923  09 4c 42      ora #$424c
$14:b926  57 14         eor [$14],y
$14:b928  8b            phb
$14:b929  0e 80 98      asl $9880
$14:b92c  be 48 65      ldx $6548,y
$14:b92f  83 f9         sta $f9,s
$14:b931  08            php
$14:b932  c2 54         rep #$54
$14:b934  31 05         and ($05),y
$14:b936  b6 f2         ldx $f2,y
$14:b938  09 82 59      ora #$5982
$14:b93b  68            pla
$14:b93c  8a            txa
$14:b93d  16 44         asl $44,x
$14:b93f  d8            cld
$14:b940  34 8b         bit $8b,x
$14:b942  0c 22 82      tsb $8222
$14:b945  f9 05 99      sbc $9905,y
$14:b948  40            rti
$14:b949  1f 47 1b 82   ora $821b47,x
$14:b94d  5e a0 90      lsr $90a0,x
$14:b950  a8            tay
$14:b951  a3 0c         lda $0c,s
$14:b953  60            rts
$14:b954  d0 26         bne $b97c
$14:b956  40            rti
$14:b957  40            rti
$14:b958  41 a1         eor ($a1,x)
$14:b95a  68            pla
$14:b95b  f8            sed
$14:b95c  78            sei
$14:b95d  1a            inc a
$14:b95e  09 e0 0c      ora #$0ce0
$14:b961  a4 2a         ldy $2a
$14:b963  08            php
$14:b964  1b            tcs
$14:b965  27 0a         and [$0a]
$14:b967  0a            asl a
$14:b968  c9 c2 70      cmp #$70c2
$14:b96b  68            pla
$14:b96c  1c 3e 00      trb $003e
$14:b96f  3d 07 0b      and $0b07,x
$14:b972  b8            clv
$14:b973  02 11         cop #$11
$14:b975  00 86         brk #$86
$14:b977  bc c1 c3      ldy $c3c1,x
$14:b97a  0b            phd
$14:b97b  d0 83         bne $b900
$14:b97d  c0 61 ef      cpy #$ef61
$14:b980  50 82         bvc $b904
$14:b982  44 21 91      mvp $91,$21
$14:b985  07 ea         ora [$ea]
$14:b987  c1 21         cmp ($21,x)
$14:b989  10 88         bpl $b913
$14:b98b  2c 16 39      bit $3916
$14:b98e  10 15         bpl $b9a5
$14:b990  83 84         sta $84,s
$14:b992  e0 38 0c      cpx #$0c38
$14:b995  0f 03 83 80   ora $808303
$14:b999  f0 40         beq $b9db
$14:b99b  bc 10 3a      ldy $3a10,x
$14:b99e  00 c0         brk #$c0
$14:b9a0  e0 2b 80      cpx #$802b
$14:b9a3  c1 e0         cmp ($e0,x)
$14:b9a5  20 30 2d      jsr $2d30
$14:b9a8  16 86         asl $86,x
$14:b9aa  c6 da         dec $da
$14:b9ac  19 85 e2      ora $e285,y
$14:b9af  f1 fc         sbc ($fc),y
$14:b9b1  be 15 06      ldx $0615,y
$14:b9b4  61 f8         adc ($f8,x)
$14:b9b6  80 5c         bra $ba14
$14:b9b8  1d 65 88      ora $8865,x
$14:b9bb  80 4d         bra $ba0a
$14:b9bd  26 13         rol $13
$14:b9bf  89 c2 f4      bit #$f4c2
$14:b9c2  30 8a         bmi $b94e
$14:b9c4  e0 c2 64      cpx #$64c2
$14:b9c7  2d 0e 17      and $170e
$14:b9ca  66 81         ror $81
$14:b9cc  d5 8e         cmp $8e,x
$14:b9ce  6a            ror a
$14:b9cf  cb            wai
$14:b9d0  05 c8         ora $c8
$14:b9d2  41 57         eor ($57,x)
$14:b9d4  60            rts
$14:b9d5  17 09         ora [$09],y
$14:b9d7  04 7e         tsb $7e
$14:b9d9  81 3f         sta ($3f,x)
$14:b9db  c0 4f e0      cpy #$e04f
$14:b9de  17 f8         ora [$f8],y
$14:b9e0  07 7e         ora [$7e]
$14:b9e2  01 e3         ora ($e3,x)
$14:b9e4  82 41 e1      brl $9b28
$14:b9e7  09 72 ff      ora #$ff72
$14:b9ea  a6 03         ldx $03
$14:b9ec  00 a7         brk #$a7
$14:b9ee  0e fc 83      asl $83fc
$14:b9f1  df 10 a0 7c   cmp $7ca010,x
$14:b9f5  3e 10 4f      rol $4f10,x
$14:b9f8  c4 1b         cpy $1b
$14:b9fa  f9 03 5a      sbc $5a03,y
$14:b9fd  87 ee         sta [$ee]
$14:b9ff  0f ff 87 ff   ora $ff87ff
$14:ba03  e7 e1         sbc [$e1]
$14:ba05  e0 fe 30      cpx #$30fe
$14:ba08  07 fc         ora [$fc]
$14:ba0a  c0 12 d0      cpy #$d012
$14:ba0d  7c 20 1d      jmp ($1d20,x)
$14:ba10  c8            iny
$14:ba11  e3 8a         sbc $8a,s
$14:ba13  49 c1 c0      eor #$c0c1
$14:ba16  1c 83 42      trb $4283
$14:ba19  07 c0         ora [$c0]
$14:ba1b  3e 09 00      rol $0009,x
$14:ba1e  10 60         bpl $ba80
$14:ba20  e3 30         sbc $30,s
$14:ba22  76 83         ror $83,x
$14:ba24  50 64         bvc $ba8a
$14:ba26  56 0a         lsr $0a,x
$14:ba28  17 82         ora [$82],y
$14:ba2a  c3 c0         cmp $c0,s
$14:ba2c  84 c5         sty $c5
$14:ba2e  93 e1         sta ($e1,s),y
$14:ba30  79 c3 22      adc $22c3,y
$14:ba33  4a            lsr a
$14:ba34  47 40         eor [$40]
$14:ba36  a1 e9         lda ($e9,x)
$14:ba38  2c b8 a6      bit $a6b8
$14:ba3b  40            rti
$14:ba3c  a2 02 1c      ldx #$1c02
$14:ba3f  d9 2c 16      cmp $162c,y
$14:ba42  1a            inc a
$14:ba43  07 e7         ora [$e7]
$14:ba45  b2 dc         lda ($dc)
$14:ba47  f3 05         sbc ($05,s),y
$14:ba49  b1 8c         lda ($8c),y
$14:ba4b  f8            sed
$14:ba4c  30 0d         bmi $ba5b
$14:ba4e  71 81         adc ($81),y
$14:ba50  51 24         eor ($24),y
$14:ba52  70 4a         bvs $ba9e
$14:ba54  2f 09 df e0   and $e0df09
$14:ba58  0f 08 f8 8a   ora $8af808
$14:ba5c  dc 47 07      jml [$0747]
$14:ba5f  81 c3         sta ($c3,x)
$14:ba61  e0 f1 f8      cpx #$f8f1
$14:ba64  3c 7a 4f      bit $4f7a,x
$14:ba67  0b            phd
$14:ba68  8f 8b c1 a8   sta $a8c18b
$14:ba6c  30 48         bmi $bab6
$14:ba6e  04 6e         tsb $6e
$14:ba70  07 13         ora [$13]
$14:ba72  81 cc         sta ($cc,x)
$14:ba74  20 33 a8      jsr $a833
$14:ba77  34 52         bit $52,x
$14:ba79  56 d4         lsr $d4,x
$14:ba7b  28            plp
$14:ba7c  66 33         ror $33
$14:ba7e  81 c8         sta ($c8,x)
$14:ba80  e0 53 1b      cpx #$1b53
$14:ba83  c1 70         cmp ($70,x)
$14:ba85  84 7e         sty $7e
$14:ba87  10 60         bpl $bae9
$14:ba89  d4 18         pei ($18)
$14:ba8b  41 f8         eor ($f8,x)
$14:ba8d  6d 9c 0c      adc $0c9c
$14:ba90  e5 8a         sbc $8a
$14:ba92  61 44         adc ($44,x)
$14:ba94  28            plp
$14:ba95  04 92         tsb $92
$14:ba97  49 5a a1      eor #$a15a
$14:ba9a  56 b8         lsr $b8,x
$14:ba9c  74 2e         stz $2e,x
$14:ba9e  1c 92 cd      trb $cd92
$14:baa1  3c bf 46      bit $46bf,x
$14:baa4  27 90         and [$90]
$14:baa6  08            php
$14:baa7  c4 62         cpy $62
$14:baa9  00 bc         brk #$bc
$14:baab  06 09         asl $09
$14:baad  2f c1 90 8b   and $8b90c1
$14:bab1  e0 57 82      cpx #$8257
$14:bab4  dc 16 e0      jml [$e016]
$14:bab7  bb            tyx
$14:bab8  05 d9         ora $d9
$14:baba  32 cd         and ($cd)
$14:babc  c0 6e 6a      cpy #$6a6e
$14:babf  b0 58         bcs $bb19
$14:bac1  2e 1f 08      rol $081f
$14:bac4  03 d8         ora $d8,s
$14:bac6  06 86         asl $86
$14:bac8  c8            iny
$14:bac9  49 04 83      eor #$8304
$14:bacc  20 f2 06      jsr $06f2
$14:bacf  41 9f         eor ($9f,x)
$14:bad1  8e 06 e6      stx $e606
$14:bad4  88            dey
$14:bad5  cc 1a 15      cpy $151a
$14:bad8  05 3a         ora $3a
$14:bada  03 9a         ora $9a,s
$14:badc  68            pla
$14:badd  10 0c         bpl $baeb
$14:badf  0c 42 65      tsb $6542
$14:bae2  04 8f         tsb $8f
$14:bae4  40            rti
$14:bae5  a0 e1 30      ldy #$30e1
$14:bae8  3f 15 83 03   and $038315,x
$14:baec  c1 90         cmp ($90,x)
$14:baee  e8            inx
$14:baef  6c 10 a9      jmp ($a910)
$14:baf2  5c 26 21 07   jml $072126
$14:baf6  84 c2         sty $c2
$14:baf8  60            rts
$14:baf9  c3 d1         cmp $d1,s
$14:bafb  73 58         adc ($58,s),y
$14:bafd  f0 13         beq $bb12
$14:baff  21 80         and ($80,x)
$14:bb01  18            clc
$14:bb02  06 01         asl $01
$14:bb04  cd 01 40      cmp $4001
$14:bb07  82 8f 06      brl $c199
$14:bb0a  05 00         ora $00
$14:bb0c  80 9d         bra $baab
$14:bb0e  04 ec         tsb $ec
$14:bb10  07 c0         ora [$c0]
$14:bb12  81 c1         sta ($c1,x)
$14:bb14  21 e7         and ($e7,x)
$14:bb16  60            rts
$14:bb17  87 41         sta [$41]
$14:bb19  e1 10         sbc ($10,x)
$14:bb1b  58            cli
$14:bb1c  52 14         eor ($14)
$14:bb1e  20 c8 a1      jsr $a1c8
$14:bb21  e1 c7         sbc ($c7,x)
$14:bb23  f0 f3         beq $bb18
$14:bb25  f4 88 41      pea $4188
$14:bb28  f3 f0         sbc ($f0,s),y
$14:bb2a  3b            tsc
$14:bb2b  fe 3e 7f      inc $7f3e,x
$14:bb2e  43 cf         eor $cf,s
$14:bb30  f8            sed
$14:bb31  30 ff         bmi $bb32
$14:bb33  87 b8         sta [$b8]
$14:bb35  fc 60 2a      jsr ($2a60,x)
$14:bb38  30 e8         bmi $bb22
$14:bb3a  c0 7c f0      cpy #$f07c
$14:bb3d  7b            tdc
$14:bb3e  cc 06 ff      cpy $ff06
$14:bb41  00 f3         brk #$f3
$14:bb43  ff f8 6b 01   sbc $016bf8,x
$14:bb47  57 85         eor [$85],y
$14:bb49  ff fe b8 0c   sbc $0cb8fe,x
$14:bb4d  47 fe         eor [$fe]
$14:bb4f  0f ff bf 5f   ora $5fbfff
$14:bb53  97 03         sta [$03],y
$14:bb55  ff ff 7f bf   sbc $bf7fff,x
$14:bb59  bf d6 28 7e   lda $7e28d6,x
$14:bb5d  ff 1e 38 1e   sbc $1e381e,x
$14:bb61  03 c1         ora $c1,s
$14:bb63  80 e0         bra $bb45
$14:bb65  40            rti
$14:bb66  3a            dec a
$14:bb67  1c 06 81      trb $8106
$14:bb6a  68            pla
$14:bb6b  1a            inc a
$14:bb6c  a0 d5 07      ldy #$07d5
$14:bb6f  d0 5c         bne $bbcd
$14:bb71  20 13 08      jsr $0813
$14:bb74  06 c3         asl $c3
$14:bb76  00 e1         brk #$e1
$14:bb78  0e 84 02      asl $0284
$14:bb7b  20 e4 1a      jsr $1ae4
$14:bb7e  0f 1e a1 d3   ora $d3a11e
$14:bb82  c0 58 70      cpy #$7058
$14:bb85  16 0d         asl $0d,x
$14:bb87  7d 83 3f      adc $3f83,x
$14:bb8a  60            rts
$14:bb8b  56 84         lsr $84,x
$14:bb8d  7e 01 64      ror $6401,x
$14:bb90  c4 3f         cpy $3f
$14:bb92  c3 07         cmp $07,s
$14:bb94  44 c0 d8      mvp $d8,$c0
$14:bb97  b5 f4         lda $f4,x
$14:bb99  07 ca         ora [$ca]
$14:bb9b  78            sei
$14:bb9c  7e 7c 9f      ror $9f7c,x
$14:bb9f  fa            plx
$14:bba0  a0 20 50      ldy #$5020
$14:bba3  5f 94 17 fd   eor $fd1794,x
$14:bba7  01 fe         ora ($fe,x)
$14:bba9  40            rti
$14:bbaa  93 e1         sta ($e1,s),y
$14:bbac  c5 e1         cmp $e1
$14:bbae  44 60 5e      mvp $5e,$60
$14:bbb1  18            clc
$14:bbb2  17 08         ora [$08],y
$14:bbb4  2c f6 17      bit $17f6
$14:bbb7  80 e8         bra $bba1
$14:bbb9  28            plp
$14:bbba  2f 5c d1 81   and $81d15c
$14:bbbe  27 ca         and [$ca]
$14:bbc0  10 18         bpl $bbda
$14:bbc2  2f 8c 2b 9e   and $9e2b8c
$14:bbc6  51 24         eor ($24),y
$14:bbc8  9b            txy
$14:bbc9  82 f9 7e      brl $3ac5
$14:bbcc  9c 4f a2      stz $a24f
$14:bbcf  11 e8         ora ($e8),y
$14:bbd1  24 7a         bit $7a
$14:bbd3  05 26         ora $26
$14:bbd5  80 50         bra $bc27
$14:bbd7  8d c2 7b      sta $7bc2
$14:bbda  0a            asl a
$14:bbdb  15 92         ora $92,x
$14:bbdd  49 78 8c      eor #$8c78
$14:bbe0  5e 0e 01      lsr $010e,x
$14:bbe3  00 b3         brk #$b3
$14:bbe5  46 0d         lsr $0d
$14:bbe7  e1 08         sbc ($08,x)
$14:bbe9  88            dey
$14:bbea  4c a3 10      jmp $10a3
$14:bbed  e9 55 be      sbc #$be55
$14:bbf0  49 09 a0      eor #$a009
$14:bbf3  ca            dex
$14:bbf4  ac 75 59      ldy $5975
$14:bbf7  b4 ba         ldy $ba,x
$14:bbf9  38            sec
$14:bbfa  7d 27 58      adc $5827,x
$14:bbfd  46 a0         lsr $a0
$14:bbff  13 e8         ora ($e8,s),y
$14:bc01  02 78         cop #$78
$14:bc03  21 06         and ($06,x)
$14:bc05  e1 81         sbc ($81,x)
$14:bc07  c0 22 90      cpy #$9022
$14:bc0a  39 5c 5e      and $5e5c,y
$14:bc0d  b9 34 a0      lda $a034,y
$14:bc10  ca            dex
$14:bc11  35 76         and $76,x
$14:bc13  8d bd 93      sta $93bd
$14:bc16  77 60         adc [$60],y
$14:bc18  3e 92 b4      rol $b492,x
$14:bc1b  a2 ec 61      ldx #$61ec
$14:bc1e  8d bf 07      sta $07bf
$14:bc21  c1 00         cmp ($00,x)
$14:bc23  8c 78 3c      sty $3c78
$14:bc26  9f 8e 54 33   sta $33548e,x
$14:bc2a  59 30 a5      eor $a530,y
$14:bc2d  53 3c         eor ($3c,s),y
$14:bc2f  b0 6f         bcs $bca0
$14:bc31  ac 19 7e      ldy $7e19
$14:bc34  9f 08 07 02   sta $020708,x
$14:bc38  01 b0         ora ($b0,x)
$14:bc3a  80 17         bra $bc53
$14:bc3c  40            rti
$14:bc3d  ba            tsx
$14:bc3e  10 76         bpl $bcb6
$14:bc40  50 41         bvc $bc83
$14:bc42  a5 71         lda $71
$14:bc44  9a            txs
$14:bc45  b4 ca         ldy $ca,x
$14:bc47  e1 34         sbc ($34,x)
$14:bc49  96 d9         stx $d9,y
$14:bc4b  35 b6         and $b6,x
$14:bc4d  0d 3a f8      ora $f83a
$14:bc50  e0 90 08      cpx #$0890
$14:bc53  4c 02 16      jmp $1602
$14:bc56  ca            dex
$14:bc57  36 68         rol $68,x
$14:bc59  39 c2 11      and $11c2,y
$14:bc5c  f0 fa         beq $bc58
$14:bc5e  7e 23 51      ror $5123,x
$14:bc61  cb            wai
$14:bc62  34 13         bit $13,x
$14:bc64  d3 32         cmp ($32,s),y
$14:bc66  c7 c2         cmp [$c2]
$14:bc68  bc e0 30      ldy $30e0,x
$14:bc6b  5f 9b 3c 0b   eor $0b3c9b,x
$14:bc6f  a1 c4         lda ($c4,x)
$14:bc71  72 09         adc ($09)
$14:bc73  74 18         stz $18,x
$14:bc75  a1 0c         lda ($0c,x)
$14:bc77  81 c4         sta ($c4,x)
$14:bc79  e1 f2         sbc ($f2,x)
$14:bc7b  c8            iny
$14:bc7c  e6 6a         inc $6a
$14:bc7e  73 d4         adc ($d4,s),y
$14:bc80  98            tya
$14:bc81  7d 6a 18      adc $186a,x
$14:bc84  fa            plx
$14:bc85  c2 fd         rep #$fd
$14:bc87  9b            txy
$14:bc88  c1 0f         cmp ($0f,x)
$14:bc8a  24 0c         bit $0c
$14:bc8c  9d c8 36      sta $36c8,x
$14:bc8f  0e 05 22      asl $2205
$14:bc92  61 74         adc ($74,x)
$14:bc94  fc 66 b3      jsr ($b366,x)
$14:bc97  9e a8 66      stz $66a8,x
$14:bc9a  56 0d         lsr $0d,x
$14:bc9c  cd 8b 1f      cmp $1f8b
$14:bc9f  4b            phk
$14:bca0  00 7e         brk #$7e
$14:bca2  17 f0         ora [$f0],y
$14:bca4  0a            asl a
$14:bca5  cb            wai
$14:bca6  d0 7f         bne $bd27
$14:bca8  08            php
$14:bca9  0a            asl a
$14:bcaa  80 4e         bra $bcfa
$14:bcac  04 75         tsb $75
$14:bcae  58            cli
$14:bcaf  14 12         trb $12
$14:bcb1  02 de         cop #$de
$14:bcb3  08            php
$14:bcb4  11 ce         ora ($ce),y
$14:bcb6  28            plp
$14:bcb7  39 fe 0c      and $0cfe,y
$14:bcba  7e 81 1f      ror $1f81,x
$14:bcbd  d0 63         bne $bd22
$14:bcbf  ea            nop
$14:bcc0  14 38         trb $38
$14:bcc2  44 82 45      mvp $45,$82
$14:bcc5  08            php
$14:bcc6  37 85         and [$85],y
$14:bcc8  e1 d4         sbc ($d4,x)
$14:bcca  3f c8 05 fa   and $fa05c8,x
$14:bcce  01 7f         ora ($7f,x)
$14:bcd0  e0 4e e8      cpx #$e84e
$14:bcd3  93 e8         sta ($e8,s),y
$14:bcd5  0c 0e 19      tsb $190e
$14:bcd8  ff 57 9c fb   sbc $fb9c57,x
$14:bcdc  ff 00 5b 05   sbc $055b00,x
$14:bce0  c1 fe         cmp ($fe,x)
$14:bce2  57 f5         eor [$f5],y
$14:bce4  f8            sed
$14:bce5  cf a7 d1 88   cmp $88d1a7
$14:bce9  c6 16         dec $16
$14:bceb  01 fe         ora ($fe,x)
$14:bced  5c 86 33 01   jml $013386
$14:bcf1  70 c0         bvs $bcb3
$14:bcf3  70 19         bvs $bd0e
$14:bcf5  e0 62 33      cpx #$3362
$14:bcf8  aa            tax
$14:bcf9  c8            iny
$14:bcfa  0c c3 40      tsb $40c3
$14:bcfd  69 d4 05      adc #$05d4
$14:bd00  58            cli
$14:bd01  10 18         bpl $bd1b
$14:bd03  3c 4e 2f      bit $2f4e,x
$14:bd06  03 83         ora $83,s
$14:bd08  c9 a7 f0      cmp #$f0a7
$14:bd0b  48            pha
$14:bd0c  7c 52 3e      jmp ($3e52,x)
$14:bd0f  84 02         sty $02
$14:bd11  38            sec
$14:bd12  43 20         eor $20,s
$14:bd14  10 d8         bpl $bcee
$14:bd16  8c 66 03      sty $0366
$14:bd19  1b            tcs
$14:bd1a  91 cf         sta ($cf),y
$14:bd1c  e0 f2 b8      cpx #$b8f2
$14:bd1f  9b            txy
$14:bd20  3c 7c 1c      bit $1c7c,x
$14:bd23  0f 85 80 28   ora $288085
$14:bd27  1f 89 80 60   ora $608089,x
$14:bd2b  dc 60 df      jml [$df60]
$14:bd2e  0c 86 03      tsb $0386
$14:bd31  91 c0         sta ($c0),y
$14:bd33  12 87         ora ($87)
$14:bd35  93 c0         sta ($c0,s),y
$14:bd37  29 0f 67      and #$670f
$14:bd3a  81 38         sta ($38,x)
$14:bd3c  10 78         bpl $bdb6
$14:bd3e  04 05         tsb $05
$14:bd40  be 07 c1      ldx $c107,y
$14:bd43  91 58         sta ($58),y
$14:bd45  28            plp
$14:bd46  5e 0a 0f      lsr $0f0a,x
$14:bd49  02 13         cop #$13
$14:bd4b  16 83         asl $83,x
$14:bd4d  c2 2f         rep #$2f
$14:bd4f  38            sec
$14:bd50  68            pla
$14:bd51  11 c0         ora ($c0),y
$14:bd53  20 72 3a      jsr $3a72
$14:bd56  05 0f         ora $0f
$14:bd58  49 65 c5      eor #$c565
$14:bd5b  1a            inc a
$14:bd5c  86 01         stx $01
$14:bd5e  02 87         cop #$87
$14:bd60  40            rti
$14:bd61  1a            inc a
$14:bd62  41 c0         eor ($c0,x)
$14:bd64  c1 61         cmp ($61,x)
$14:bd66  a0 7e 7b      ldy #$7b7e
$14:bd69  0d cf 30      ora $30cf
$14:bd6c  b9 0c 04      lda $040c,y
$14:bd6f  67 c0         adc [$c0]
$14:bd71  d4 06         pei ($06)
$14:bd73  a0 40 a8      ldy #$a840
$14:bd76  92 38         sta ($38)
$14:bd78  25 17         and $17
$14:bd7a  84 84         sty $84
$14:bd7c  08            php
$14:bd7d  64 0a         stz $0a
$14:bd7f  17 1e         ora [$1e],y
$14:bd81  9a            txs
$14:bd82  c5 6d         cmp $6d
$14:bd84  32 19         and ($19)
$14:bd86  55 8e         eor $8e,x
$14:bd88  ab            plb
$14:bd89  36 97         rol $97,x
$14:bd8b  47 1d         eor [$1d]
$14:bd8d  49 0a 80      eor #$800a
$14:bd90  47 a0         eor [$a0]
$14:bd92  07 e0         ora [$e0]
$14:bd94  17 83         ora [$83],y
$14:bd96  b8            clv
$14:bd97  11 63         ora ($63),y
$14:bd99  18            clc
$14:bd9a  9b            txy
$14:bd9b  44 25 72      mvp $72,$25
$14:bd9e  68            pla
$14:bd9f  65 14         adc $14
$14:bda1  f3 02         sbc ($02,s),y
$14:bda3  f0 8c         beq $bd31
$14:bda5  40            rti
$14:bda6  27 48         and [$48]
$14:bda8  85 d7         sta $d7
$14:bdaa  d8            cld
$14:bdab  34 f6         bit $f6,x
$14:bdad  0a            asl a
$14:bdae  94 ca         sty $ca,x
$14:bdb0  6b            rtl
$14:bdb1  0c a9 cc      tsb $cca9
$14:bdb4  24 f1         bit $f1
$14:bdb6  f8            sed
$14:bdb7  c4 1c         cpy $1c
$14:bdb9  62 11 f5      per $b2cd
$14:bdbc  f0 c3         beq $bd81
$14:bdbe  48            pha
$14:bdbf  e1 00         sbc ($00,x)
$14:bdc1  87 b9         sta [$b9]
$14:bdc3  97 bb         sta [$bb],y
$14:bdc5  06 f6         asl $f6
$14:bdc7  c9 ba b1      cmp #$b1ba
$14:bdca  6c 14 52      jmp ($5214)
$14:bdcd  75 2c         adc $2c,x
$14:bdcf  ea            nop
$14:bdd0  7a            ply
$14:bdd1  25 1c         and $1c
$14:bdd3  02 b0         cop #$b0
$14:bdd5  14 03         trb $03
$14:bdd7  b1 00         lda ($00),y
$14:bdd9  f4 38 84      pea $8438
$14:bddc  ac 0e 84      ldy $840e
$14:bddf  f3 c8         sbc ($c8,s),y
$14:bde1  3e 35 0c      rol $0c35,x
$14:bde4  bd 32 cd      lda $cd32,x
$14:bde7  20 ac 4e      jsr $4eac
$14:bdea  25 f1         and $f1
$14:bdec  f8            sed
$14:bded  84 3d         sty $3d
$14:bdef  8a            txa
$14:bdf0  0b            phd
$14:bdf1  f0 63         beq $be56
$14:bdf3  84 8d         sty $8d
$14:bdf5  7c 23 10      jmp ($1023,x)
$14:bdf8  74 27         stz $27,x
$14:bdfa  96 0d         stx $0d,y
$14:bdfc  b5 83         lda $83,x
$14:bdfe  6d 24 d0      adc $d024
$14:be01  e9 65 aa      sbc #$aa65
$14:be04  99 d4 cc      sta $ccd4,y
$14:be07  76 2c         ror $2c,x
$14:be09  1e 06 f0      asl $f006,x
$14:be0c  b7 cb         lda [$cb],y
$14:be0e  a1 00         lda ($00,x)
$14:be10  c8            iny
$14:be11  40            rti
$14:be12  24 0e         bit $0e
$14:be14  83 d9         sta $d9,s
$14:be16  da            phx
$14:be17  35 36         and $36,x
$14:be19  0a            asl a
$14:be1a  bc c2 b3      ldy $b3c2,x
$14:be1d  39 97 47      and $4797,y
$14:be20  e2 50         sep #$50
$14:be22  c8            iny
$14:be23  34 0d         bit $0d,x
$14:be25  8e 11 77      stx $7711
$14:be28  f1 c1         sbc ($c1),y
$14:be2a  9d 03 01      sta $0103,x
$14:be2d  74 1f         stz $1f,x
$14:be2f  c6 35         dec $35
$14:be31  af 85 4a e1   lda $e14a85
$14:be35  95 9c         sta $9c,x
$14:be37  e4 d2         cpx $d2
$14:be39  71 c8         adc ($c8),y
$14:be3b  f8            sed
$14:be3c  4c 1b 83      jmp $831b
$14:be3f  e4 80         cpx $80
$14:be41  7c 0c 03      jmp ($030c,x)
$14:be44  60            rts
$14:be45  80 39         bra $be80
$14:be47  d8            cld
$14:be48  dd e7 ff      cmp $ffe7,x
$14:be4b  48            pha
$14:be4c  7a            ply
$14:be4d  87 d6         sta [$d6]
$14:be4f  5e c3 f6      lsr $f6c3,x
$14:be52  a7 b7         lda [$b7]
$14:be54  9e 27 17      stz $1727,x
$14:be57  88            dey
$14:be58  bc 1a 0f      ldy $0f1a,x
$14:be5b  31 7d         and ($7d),y
$14:be5d  0c b6 23      tsb $23b6
$14:be60  2c 88 00      bit $0088
$14:be63  5a            phy
$14:be64  39 30 05      and $0530,y
$14:be67  87 83         sta [$83]
$14:be69  f0 0f         beq $be7a
$14:be6b  6f 47 c3 d8   adc $d8c347
$14:be6f  1a            inc a
$14:be70  1e 67 00      asl $0067,x
$14:be73  3e dc 42      rol $42dc,x
$14:be76  e0 72         cpx #$72
$14:be78  05 61         ora $61
$14:be7a  61 e3         adc ($e3,x)
$14:be7c  d4 3a         pei ($3a)
$14:be7e  7a            ply
$14:be7f  0a            asl a
$14:be80  0e 02 81      asl $8102
$14:be83  af b0 67 ec   lda $ec67b0
$14:be87  17 f8         ora [$f8],y
$14:be89  04 7e         tsb $7e
$14:be8b  01 64         ora ($64,x)
$14:be8d  c4 0f         cpy $0f
$14:be8f  c3 47         cmp $47,s
$14:be91  44 d0 d0      mvp $d0,$d0
$14:be94  b5 f4         lda $f4,x
$14:be96  01 ca         ora ($ca,x)
$14:be98  79 7e 7c      adc $7c7e,y
$14:be9b  9f fc 17 c7   sta $c717fc,x
$14:be9f  02 80         cop #$80
$14:bea1  fc a0 bf      jsr ($bfa0,x)
$14:bea4  e8            inx
$14:bea5  0f f2 05 f8   ora $f805f2
$14:bea9  80 71         bra $bf1c
$14:beab  78            sei
$14:beac  51 18         eor ($18),y
$14:beae  17 96         ora [$96],y
$14:beb0  05 c6         ora $c6
$14:beb2  2b            pld
$14:beb3  3c 82 01      bit $0182,x
$14:beb6  18            clc
$14:beb7  9c 4f ef      stz $ef4f
$14:beba  9f 28 e5 e2   sta $e2e528,x
$14:bebe  39 38 8e      and $8e38,y
$14:bec1  46 27         lsr $27
$14:bec3  87 b0         sta [$b0]
$14:bec5  37 0c         and [$0c],y
$14:bec7  02 7b         cop #$7b
$14:bec9  3f cd 7e a9   and $a97ecd,x
$14:becd  16 89         asl $89,x
$14:becf  42 20         wdm #$20
$14:bed1  29 14 88      and #$8814
$14:bed4  44 05 d6      mvp $d6,$05
$14:bed7  08            php
$14:bed8  f0 80         beq $be5a
$14:beda  a5 02         lda $02
$14:bedc  06 95         asl $95
$14:bede  28            plp
$14:bedf  1c 12 04      trb $0412
$14:bee2  de c4 78      dec $78c4,x
$14:bee5  b7 95         lda [$95],y
$14:bee7  3c 10 18      bit $1810,x
$14:beea  14 1a         trb $1a
$14:beec  07 09         ora [$09]
$14:beee  82 b7 b1      brl $70a8
$14:bef1  3c 98 03      bit $0398,x
$14:bef4  70 60         bvs $bf56
$14:bef6  38            sec
$14:bef7  1a            inc a
$14:bef8  09 85 83      ora #$8385
$14:befb  b1 50         lda ($50),y
$14:befd  e8            inx
$14:befe  56 17         lsr $17,x
$14:bf00  f0 d3         beq $bed5
$14:bf02  0d 03 a8      ora $a803
$14:bf05  56 39         lsr $39,x
$14:bf07  14 86         trb $86
$14:bf09  30 72         bmi $bf7d
$14:bf0b  06 d0         asl $d0
$14:bf0d  36 90         rol $90,x
$14:bf0f  05 03         ora $03
$14:bf11  40            rti
$14:bf12  35 09         and $09,x
$14:bf14  06 c1         asl $c1
$14:bf16  b4 2d         ldy $2d,x
$14:bf18  fa            plx
$14:bf19  74 93         stz $93,x
$14:bf1b  25 57         and $57
$14:bf1d  41 02         eor ($02,x)
$14:bf1f  84 c1         sty $c1
$14:bf21  20 90 d8      jsr $d890
$14:bf24  dc 25 87      jml [$8725]
$14:bf27  40            rti
$14:bf28  b0 83         bcs $bead
$14:bf2a  38            sec
$14:bf2b  9e 81 80      stz $8081,x
$14:bf2e  d0 70         bne $bfa0
$14:bf30  28            plp
$14:bf31  16 0f         asl $0f,x
$14:bf33  85 81         sta $81
$14:bf35  7f 42 92 51   adc $519242,x
$14:bf39  54 16 07      mvn $07,$16
$14:bf3c  07 87         ora [$87]
$14:bf3e  af f1 7e b0   lda $b07ef1
$14:bf42  7a            ply
$14:bf43  1c fe 3d      trb $3dfe
$14:bf46  fe f8 fc      inc $fcf8,x
$14:bf49  20 f0 0d      jsr $0df0
$14:bf4c  d9 b5 e0      cmp $e0b5,y
$14:bf4f  30 03         bmi $bf54
$14:bf51  f0 7f         beq $bfd2
$14:bf53  e0 17         cpx #$17
$14:bf55  f1 78         sbc ($78),y
$14:bf57  cf 2f 91 2f   cmp $2f912f
$14:bf5b  9c 83 c3      stz $c383
$14:bf5e  20 f0 40      jsr $40f0
$14:bf61  ac 50 08      ldy $0850
$14:bf64  f5 01         sbc $01,x
$14:bf66  0a            asl a
$14:bf67  78            sei
$14:bf68  58            cli
$14:bf69  47 06         eor [$06]
$14:bf6b  21 c0         and ($c0,x)
$14:bf6d  88            dey
$14:bf6e  f0 22         beq $bf92
$14:bf70  97 6c         sta [$6c],y
$14:bf72  05 32         ora $32
$14:bf74  61 00         adc ($00,x)
$14:bf76  b0 17         bcs $bf8f
$14:bf78  02 e1         cop #$e1
$14:bf7a  f8            sed
$14:bf7b  9c 7f 23      stz $237f
$14:bf7e  97 c8         sta [$c8],y
$14:bf80  44 fa 01      mvp $01,$fa
$14:bf83  9c 90 60      stz $6090
$14:bf86  24 10         bit $10
$14:bf88  08            php
$14:bf89  84 02         sty $02
$14:bf8b  51 20         eor ($20),y
$14:bf8d  ca            dex
$14:bf8e  44 39 50      mvp $50,$39
$14:bf91  8b            phb
$14:bf92  16 03         asl $03,x
$14:bf94  79 42 b4      adc $b442,y
$14:bf97  45 2e         eor $2e
$14:bf99  30 77         bmi $c012
$14:bf9b  78            sei
$14:bf9c  7c 5e 43      jmp ($435e,x)
$14:bf9f  98            tya
$14:bfa0  85 c3         sta $c3
$14:bfa2  20 b0 70      jsr $70b0
$14:bfa5  68            pla
$14:bfa6  cf 2e 0f f0   cmp $f00f2e
$14:bfaa  be 7c 2f      ldx $2f7c,y
$14:bfad  9e 0c b6      stz $b60c,x
$14:bfb0  22 16 3a 07   jsl $073a16
$14:bfb4  e0 fb         cpx #$fb
$14:bfb6  be 00 f0      ldx $f000,y
$14:bfb9  f7 fc         sbc [$fc],y
$14:bfbb  3c ff 0e      bit $0eff,x
$14:bfbe  0f c2 21 d0   ora $d021c2
$14:bfc2  90 0b         bcc $bfcf
$14:bfc4  47 a1         eor [$a1]
$14:bfc6  cc ec 73      cpy $73ec
$14:bfc9  3b            tsc
$14:bfca  9c ee 77      stz $77ee
$14:bfcd  1f 33 81 b0   ora $b08133,x
$14:bfd1  31 81         and ($81),y
$14:bfd3  be 10 08      ldx $0810,y
$14:bfd6  44 02 2f      mvp $2f,$02
$14:bfd9  00 8c         brk #$8c
$14:bfdb  c8            iny
$14:bfdc  24 51         bit $51
$14:bfde  49 14 42      eor #$4214
$14:bfe1  63 08         adc $08,s
$14:bfe3  8d 26 c2      sta $c226
$14:bfe6  1f 09 8b 45   ora $458b09,x
$14:bfea  e1 11         sbc ($11,x)
$14:bfec  99 34 9e      sta $9e34,y
$14:bfef  21 23         and ($23,x)
$14:bff1  8a            txa
$14:bff2  4d 61 51      eor $5161
$14:bff5  b8            clv
$14:bff6  24 0a         bit $0a
$14:bff8  19 00 fc      ora $fc00,y
$14:bffb  42 21         wdm #$21
$14:bffd  11 48         ora ($48),y
$14:bfff  66 b3         ror $b3
$14:c001  49 08 f2      eor #$f208
$14:c004  5e 2c 97      lsr $972c,x
$14:c007  0f 47 43 e1   ora $e14347
$14:c00b  98            tya
$14:c00c  80 5e         bra $c06c
$14:c00e  30 11         bmi $c021
$14:c010  4f 44 32 81   eor $813244
$14:c014  28            plp
$14:c015  82 56 38      brl $f86e
$14:c018  97 08         sta [$08],y
$14:c01a  44 42 41      mvp $41,$42
$14:c01d  18            clc
$14:c01e  9e 2c 02      stz $022c,x
$14:c021  01 18         ora ($18,x)
$14:c023  70 0a         bvs $c02f
$14:c025  25 57         and $57
$14:c027  a1 24         lda ($24,x)
$14:c029  33 01         and ($01,s),y
$14:c02b  cc 24 07      cpy $0724
$14:c02e  61 3b         adc ($3b,x)
$14:c030  1c 0a 0d      trb $0d0a
$14:c033  0a            asl a
$14:c034  83 46         sta $46,s
$14:c036  20 92 58      jsr $5892
$14:c039  e4 66         cpx $66
$14:c03b  71 13         adc ($13),y
$14:c03d  98            tya
$14:c03e  42 63         wdm #$63
$14:c040  10 b8         bpl $bffa
$14:c042  3c 06 00      bit $0006,x
$14:c045  9f 07 e0 3f   sta $3fe007,x
$14:c049  00 78         brk #$78
$14:c04b  2a            rol a
$14:c04c  61 3e         adc ($3e,x)
$14:c04e  81 4c         sta ($4c,x)
$14:c050  20 d1 09      jsr $09d1
$14:c053  84 42         sty $42
$14:c055  37 38         and [$38],y
$14:c057  95 46         sta $46,x
$14:c059  0a            asl a
$14:c05a  61 09         adc ($09,x)
$14:c05c  55 8b         eor $8b,x
$14:c05e  f0 15         beq $c075
$14:c060  20 a9 21      jsr $21a9
$14:c063  e0 3f         cpx #$3f
$14:c065  04 f2         tsb $f2
$14:c067  39 0c c5      and $c50c,y
$14:c06a  62 31 d0      per $909e
$14:c06d  8c 6a 26      sty $266a
$14:c070  12 09         ora ($09)
$14:c072  86 43         stx $43
$14:c074  41 20         eor ($20,x)
$14:c076  e0 1f         cpx #$1f
$14:c078  42 c1         wdm #$c1
$14:c07a  00 f0         brk #$f0
$14:c07c  38            sec
$14:c07d  05 b8         ora $b8
$14:c07f  0d c0 3f      ora $3fc0
$14:c082  81 e4         sta ($e4,x)
$14:c084  a1 51         lda ($51,x)
$14:c086  89 b4 41      bit #$41b4
$14:c089  64 0b         stz $0b
$14:c08b  58            cli
$14:c08c  53 93         eor ($93,s),y
$14:c08e  0e aa 15      asl $15aa
$14:c091  8c c6 62      sty $62c6
$14:c094  a0 d4         ldy #$d4
$14:c096  9d 03 78      sta $7803,x
$14:c099  dc e0 e7      jml [$e7e0]
$14:c09c  65 88         adc $88
$14:c09e  3c 71 82      bit $8271,x
$14:c0a1  4c 3a 8c      jmp $8c3a
$14:c0a4  44 19 e0      mvp $e0,$19
$14:c0a7  13 a7         ora ($a7,s),y
$14:c0a9  08            php
$14:c0aa  08            php
$14:c0ab  72 09         adc ($09)
$14:c0ad  0c 8e c3      tsb $c38e
$14:c0b0  21 11         and ($11,x)
$14:c0b2  89 5c 62      bit #$625c
$14:c0b5  2f 30 b3 c4   and $c4b330
$14:c0b9  2b            pld
$14:c0ba  93 ca         sta ($ca,s),y
$14:c0bc  4c e1 46      jmp $46e1
$14:c0bf  8f f4 52 95   sta $9552f4
$14:c0c3  7e 81 df      ror $df81,x
$14:c0c6  80 7f         bra $c147
$14:c0c8  e0 17         cpx #$17
$14:c0ca  f4 90 a4      pea $a490
$14:c0cd  d3 7e         cmp ($7e,s),y
$14:c0cf  96 35         stx $35,y
$14:c0d1  0c 40 22      tsb $2240
$14:c0d4  30 08         bmi $c0de
$14:c0d6  4a            lsr a
$14:c0d7  c4 21         cpy $21
$14:c0d9  10 e8         bpl $c0c3
$14:c0db  84 7a         sty $7a
$14:c0dd  09 18 83      ora #$8318
$14:c0e0  c4 09         cpy $09
$14:c0e2  a1 21         lda ($21,x)
$14:c0e4  a0 46         ldy #$46
$14:c0e6  24 11         bit $11
$14:c0e8  b8            clv
$14:c0e9  04 4e         tsb $4e
$14:c0eb  01 26         ora ($26,x)
$14:c0ed  80 c3         bra $c0b2
$14:c0ef  a4 31         ldy $31
$14:c0f1  f3 70         sbc ($70,s),y
$14:c0f3  3b            tsc
$14:c0f4  c3 00         cmp $00,s
$14:c0f6  e9 2c 00      sbc #$002c
$14:c0f9  28            plp
$14:c0fa  c9 65 98      cmp #$9865
$14:c0fd  b0 07         bcs $c106
$14:c0ff  07 00         ora [$00]
$14:c101  d5 88         cmp $88,x
$14:c103  14 1a         trb $1a
$14:c105  0b            phd
$14:c106  0c 85 c6      tsb $c685
$14:c109  1e 64 f1      asl $f164,x
$14:c10c  07 88         ora [$88]
$14:c10e  3b            tsc
$14:c10f  c2 02         rep #$02
$14:c111  80 52         bra $c165
$14:c113  39 12 41      and $4112,y
$14:c116  fe 14 0b      inc $0b14,x
$14:c119  06 82         asl $82
$14:c11b  61 d0         adc ($d0,x)
$14:c11d  8c 04 c8      sty $c804
$14:c120  22 01 10 07   jsl $071001
$14:c124  83 54         sta $54,s
$14:c126  0c e0 63      tsb $63e0
$14:c129  01 19         ora ($19,x)
$14:c12b  19 49 aa      ora $aa49,y
$14:c12e  10 c8         bpl $c0f8
$14:c130  8c e2 09      sty $09e2
$14:c133  39 81 4b      and $4b81,y
$14:c136  22 32 88 d4   jsl $d48832
$14:c13a  4e 19 09      lsr $0919
$14:c13d  83 a1         sta $a1,s
$14:c13f  46 21         lsr $21
$14:c141  3d 81 4e      and $4e81,x
$14:c144  60            rts
$14:c145  92 e8         sta ($e8)
$14:c147  84 a2         sty $a2
$14:c149  2b            pld
$14:c14a  17 84         ora [$84],y
$14:c14c  42 60         wdm #$60
$14:c14e  c8            iny
$14:c14f  d0 94         bne $c0e5
$14:c151  76 22         ror $22,x
$14:c153  92 c9         sta ($c9)
$14:c155  25 33         and $33
$14:c157  c1 8c         cmp ($8c,x)
$14:c159  94 51         sty $51,x
$14:c15b  32 12         and ($12)
$14:c15d  8f 87 00 46   sta $460087
$14:c161  16 88         asl $88,x
$14:c163  86 d2         stx $d2
$14:c165  91 a4         sta ($a4),y
$14:c167  84 15         sty $15
$14:c169  43 51         eor $51,s
$14:c16b  04 d8         tsb $d8
$14:c16d  52 3e         eor ($3e)
$14:c16f  02 21         cop #$21
$14:c171  6b            rtl
$14:c172  2c 05 de      bit $de05
$14:c175  90 78         bcc $c1ef
$14:c177  e1 b9         sbc ($b9,x)
$14:c179  c0 06         cpy #$06
$14:c17b  09 06 b2      ora #$b206
$14:c17e  b4 00         ldy $00,x
$14:c180  20 3e 09      jsr $093e
$14:c183  c0 4c         cpy #$4c
$14:c185  11 ce         ora ($ce),y
$14:c187  28            plp
$14:c188  31 18         and ($18),y
$14:c18a  40            rti
$14:c18b  60            rts
$14:c18c  70 47         bvs $c1d5
$14:c18e  90 c5         bcc $c155
$14:c190  e6 16         inc $16
$14:c192  f9 04 de      sbc $de04,y
$14:c195  e1 af         sbc ($af,x)
$14:c197  b0 71         bcs $c20a
$14:c199  e4 0e         cpx $0e
$14:c19b  d0 00         bne $c19d
$14:c19d  94 3e         sty $3e,x
$14:c19f  01 1f         ora ($1f,x)
$14:c1a1  62 1b 1c      per $ddbf
$14:c1a4  30 1c         bmi $c1c2
$14:c1a6  09 00 48      ora #$4800
$14:c1a9  7d 10 cf      adc $cf10,x
$14:c1ac  b4 13         ldy $13,x
$14:c1ae  e9 06 f5      sbc #$f506
$14:c1b1  c3 3c         cmp $3c,s
$14:c1b3  b0 63         bcs $c218
$14:c1b5  a0 2a         ldy #$2a
$14:c1b7  c8            iny
$14:c1b8  d6 1f         dec $1f,x
$14:c1ba  87 30         sta [$30]
$14:c1bc  b9 4a af      lda $af4a,y
$14:c1bf  30 b5         bmi $c176
$14:c1c1  46 2c         lsr $2c
$14:c1c3  91 c9         sta ($c9),y
$14:c1c5  4c 62 69      jmp $6962
$14:c1c8  0c 8b 43      tsb $438b
$14:c1cb  a2 70         ldx #$70
$14:c1cd  f8            sed
$14:c1ce  44 1d 8a      mvp $8a,$1d
$14:c1d1  08            php
$14:c1d2  b2 45         lda ($45)
$14:c1d4  92 1c         sta ($1c)
$14:c1d6  0e 45 ff      asl $ff45
$14:c1d9  80 5f         bra $c23a
$14:c1db  e0 1e         cpx #$1e
$14:c1dd  f8            sed
$14:c1de  06 7e         asl $7e
$14:c1e0  01 3b         ora ($3b,x)
$14:c1e2  80 69         bra $c24d
$14:c1e4  b0 1a         bcs $c200
$14:c1e6  cd 06 97      cmp $9706
$14:c1e9  ca            dex
$14:c1ea  0f 00 fb 04   ora $04fb00
$14:c1ee  42 bf         wdm #$bf
$14:c1f0  00 8d         brk #$8d
$14:c1f2  40            rti
$14:c1f3  24 16         bit $16
$14:c1f5  09 05 92      ora #$9205
$14:c1f8  89 20 a0      bit #$a020
$14:c1fb  34 42         bit $42,x
$14:c1fd  21 20         and ($20,x)
$14:c1ff  89 44 a1      bit #$a144
$14:c202  31 18         and ($18),y
$14:c204  41 b9         eor ($b9,x)
$14:c206  91 ce         sta ($ce),y
$14:c208  a7 02         lda [$02]
$14:c20a  78            sei
$14:c20b  af 82 41 10   lda $104182
$14:c20f  88            dey
$14:c210  42 21         wdm #$21
$14:c212  90 2c         bcc $c240
$14:c214  10 25         bpl $c23b
$14:c216  0c 7e 88      tsb $887e
$14:c219  08            php
$14:c21a  0c 1e 07      tsb $071e
$14:c21d  0f 83 c7 e1   ora $e1c783
$14:c221  ec 70 3f      cpx $3f70
$14:c224  98            tya
$14:c225  1c 20 90      trb $9020
$14:c228  01 f0         ora ($f0,x)
$14:c22a  44 20 11      mvp $11,$20
$14:c22d  10 48         bpl $c277
$14:c22f  30 c2         bmi $c1f3
$14:c231  7f 0f ff df   adc $dfff0f,x
$14:c235  ff e9 66 61   sbc $6166e9,x
$14:c239  84 c1         sty $c1
$14:c23b  c0 24         cpy #$24
$14:c23d  c0 87         cpy #$87
$14:c23f  c3 e7         cmp $e7,s
$14:c241  f3 f4         sbc ($f4,s),y
$14:c243  b1 30         lda ($30),y
$14:c245  82 06 7c      brl $3e4e
$14:c248  09 fc 7e      ora #$7efc
$14:c24b  ff 3f 5b 02   sbc $025b3f,x
$14:c24f  50 52         bvc $c2a3
$14:c251  a0 87         ldy #$87
$14:c253  04 58         tsb $58
$14:c255  15 42         ora $42,x
$14:c257  8e fe 08      stx $08fe
$14:c25a  7e 7e 3e      ror $3e7e,x
$14:c25d  ca            dex
$14:c25e  22 60 b3 d9   jsl $d9b360
$14:c262  fe 09 20      inc $2009,x
$14:c265  08            php
$14:c266  83 46         sta $46,s
$14:c268  54 21 40      mvn $40,$21
$14:c26b  80 40         bra $c2ad
$14:c26d  a0 d0         ldy #$d0
$14:c26f  10 3b         bpl $c2ac
$14:c271  33 cc         and ($cc,s),y
$14:c273  bd d4 0b      lda $0bd4,x
$14:c276  06 01         asl $01
$14:c278  46 05         lsr $05
$14:c27a  00 67         brk #$67
$14:c27c  b8            clv
$14:c27d  52 59         eor ($59)
$14:c27f  ec 8b 02      cpx $028b
$14:c282  c0 46         cpy #$46
$14:c284  06 a1         asl $a1
$14:c286  08            php
$14:c287  96 40         stx $40,y
$14:c289  24 86         bit $86
$14:c28b  5a            phy
$14:c28c  60            rts
$14:c28d  84 60         sty $60
$14:c28f  94 20         sty $20,x
$14:c291  c0 be         cpy #$be
$14:c293  5f a7 13 e8   eor $e813a7,x
$14:c297  84 7a         sty $7a
$14:c299  09 1e 81      ora #$811e
$14:c29c  49 a0 14      eor #$14a0
$14:c29f  23 89         and $89,s
$14:c2a1  50 a8         bvc $c24b
$14:c2a3  56 49         lsr $49,x
$14:c2a5  25 e2         and $e2
$14:c2a7  31 78         and ($78),y
$14:c2a9  28            plp
$14:c2aa  04 02         tsb $02
$14:c2ac  cc 4d 18      cpy $184d
$14:c2af  cc 22 29      cpy $2922
$14:c2b2  0c 85 c1      tsb $c185
$14:c2b5  e0 90         cpx #$90
$14:c2b7  37 90         and [$90],y
$14:c2b9  10 d1         bpl $c28c
$14:c2bb  20 07 76      jsr $7607
$14:c2be  21 a6         and ($a6,x)
$14:c2c0  62 21 a8      per $6ae4
$14:c2c3  d8            cld
$14:c2c4  54 3c 12      mvn $12,$3c
$14:c2c7  0e 00 48      asl $4800
$14:c2ca  08            php
$14:c2cb  69 e0 76      adc #$76e0
$14:c2ce  08            php
$14:c2cf  f6 b7         inc $b7,x
$14:c2d1  57 8d         eor [$8d],y
$14:c2d3  85 c2         sta $c2
$14:c2d5  b1 3c         lda ($3c),y
$14:c2d7  a3 cf         lda $cf,s
$14:c2d9  e6 f0         inc $f0
$14:c2db  f8            sed
$14:c2dc  9c 3e 18      stz $183e
$14:c2df  76 13         ror $13,x
$14:c2e1  f8            sed
$14:c2e2  36 81         rol $81,x
$14:c2e4  03 5c         ora $5c,s
$14:c2e6  d8            cld
$14:c2e7  74 36         stz $36,x
$14:c2e9  1d 2a 9e      ora $9e2a,x
$14:c2ec  6c bf 99      jmp ($99bf)
$14:c2ef  4f c5 21 62   eor $6221c5
$14:c2f3  01 11         ora ($11,x)
$14:c2f5  f8            sed
$14:c2f6  37 85         and [$85],y
$14:c2f8  2e c4 32      rol $32c4
$14:c2fb  85 41         sta $41
$14:c2fd  4f e1 01 41   eor $4101e1
$14:c301  5b            tcd
$14:c302  fb            xce
$14:c303  2f ff fb 3f   and $3ffbff
$14:c307  fe 1d ff      inc $ff1d,x
$14:c30a  f0 47         beq $c353
$14:c30c  ef 90 33 f8   sbc $f83390
$14:c310  06 bc         asl $bc
$14:c312  8c 30 88      sty $8830
$14:c315  24 11         bit $11
$14:c317  40            rti
$14:c318  32 17         and ($17)
$14:c31a  49 c0 9e      eor #$9ec0
$14:c31d  7e e9 28      ror $28e9,x
$14:c320  83 a4         sta $a4,s
$14:c322  b0 1d         bcs $c341
$14:c324  89 c4 c6      bit #$c6c4
$14:c327  1f 0e 80 b8   ora $b8800e,x
$14:c32b  e9 d2 90      sbc #$90d2
$14:c32e  f9 fc 7c      sbc $7cfc,y
$14:c331  e0 17         cpx #$17
$14:c333  f3 98         sbc ($98,s),y
$14:c335  4f ce c1 ff   eor $ffc1ce
$14:c339  3c 94 8e      bit $8e94,x
$14:c33c  06 7f         asl $7f
$14:c33e  0a            asl a
$14:c33f  3c 1d 06      bit $061d,x
$14:c342  10 f8         bpl $c33c
$14:c344  7e 3d 10      ror $103d,x
$14:c347  7f f4 7f a7   adc $a77ff4,x
$14:c34b  b1 d8         lda ($d8),y
$14:c34d  23 c0         and $c0,s
$14:c34f  81 ac         sta ($ac,x)
$14:c351  c2 03         rep #$03
$14:c353  07 5b         ora [$5b]
$14:c355  a2 c0         ldx #$c0
$14:c357  a0 4c         ldy #$4c
$14:c359  21 18         and ($18,x)
$14:c35b  83 1d         sta $1d,s
$14:c35d  0f 20 0f 04   ora $040f20
$14:c361  f5 61         sbc $61,x
$14:c363  e0 f1         cpx #$f1
$14:c365  f3 88         sbc ($88,s),y
$14:c367  1d c1 a2      ora $a2c1,x
$14:c36a  e0 00         cpx #$00
$14:c36c  20 8c 40      jsr $408c
$14:c36f  29 10 0b      and #$0b10
$14:c372  c5 42         cmp $42
$14:c374  59 18 82      eor $8218,y
$14:c377  43 26         eor $26,s
$14:c379  52 68         eor ($68)
$14:c37b  5c 82 63 18   jml $186382
$14:c37f  9c 40 3f      stz $3f40
$14:c382  10 08         bpl $c38c
$14:c384  44 82 89      mvp $89,$82
$14:c387  20 81 4c      jsr $4c81
$14:c38a  24 d1         bit $d1
$14:c38c  99 04 7e      sta $7e04,y
$14:c38f  31 07         and ($07),y
$14:c391  98            tya
$14:c392  40            rti
$14:c393  24 90         bit $90
$14:c395  09 e4 52      ora #$52e4
$14:c398  d1 30         cmp ($30),y
$14:c39a  a0 58         ldy #$58
$14:c39c  33 1c         and ($1c,s),y
$14:c39e  8d 04 22      sta $2204
$14:c3a1  31 30         and ($30),y
$14:c3a3  7f 84 fa 01   adc $01fa84,x
$14:c3a7  20 84 51      jsr $5184
$14:c3aa  21 18         and ($18,x)
$14:c3ac  08            php
$14:c3ad  c7 22         cmp [$22]
$14:c3af  61 08         adc ($08,x)
$14:c3b1  f8            sed
$14:c3b2  4c 38 10      jmp $1038
$14:c3b5  08            php
$14:c3b6  04 72         tsb $72
$14:c3b8  01 54         ora ($54,x)
$14:c3ba  88            dey
$14:c3bb  5f 2b 12 a7   eor $a7122b,x
$14:c3bf  b2 8b         lda ($8b)
$14:c3c1  c2 79         rep #$79
$14:c3c3  00 b6         brk #$b6
$14:c3c5  40            rti
$14:c3c6  20 d2 02      jsr $02d2
$14:c3c9  28            plp
$14:c3ca  01 d0         ora ($d0,x)
$14:c3cc  5e 0e f0      lsr $f00e,x
$14:c3cf  89 08 02      bit #$0208
$14:c3d2  2d 6c 9a      and $9a6c
$14:c3d5  05 d0         ora $d0
$14:c3d7  5e 51 e8      lsr $e851,x
$14:c3da  04 86         tsb $86
$14:c3dc  11 42         ora ($42),y
$14:c3de  13 28         ora ($28,s),y
$14:c3e0  bc 0d e5      ldy $e50d,x
$14:c3e3  01 3a         ora ($3a,x)
$14:c3e5  84 02         sty $02
$14:c3e7  07 01         ora [$01]
$14:c3e9  8e c1 a5      stx $a5c1
$14:c3ec  10 e3         bpl $c3d1
$14:c3ee  7a            ply
$14:c3ef  8b            phb
$14:c3f0  c0 f2 10      cpy #$10f2
$14:c3f3  68            pla
$14:c3f4  34 62         bit $62,x
$14:c3f6  1d 31 37      ora $3731,x
$14:c3f9  a5 62         lda $62
$14:c3fb  01 9e         ora ($9e,x)
$14:c3fd  c0 4f e0      cpy #$e04f
$14:c400  1d 0c 07      ora $070c,x
$14:c403  82 e0 6f      brl $33e6
$14:c406  48            pha
$14:c407  c7 03         cmp [$03]
$14:c409  3d 00 4c      and $4c00,x
$14:c40c  86 e2         stx $e2
$14:c40e  81 40         sta ($40,x)
$14:c410  c0 1b d0      cpy #$d01b
$14:c413  de 87 90      dec $9087,x
$14:c416  8e 41 96      stx $9641
$14:c419  16 8a         asl $8a,x
$14:c41b  15 7b         ora $7b,x
$14:c41d  17 83         ora [$83],y
$14:c41f  19 00 3f      ora $3f00,y
$14:c422  04 65         tsb $65
$14:c424  5e f0 c6      lsr $c6f0,x
$14:c427  d0 60         bne $c489
$14:c429  21 f0         and ($f0,x)
$14:c42b  02 70         cop #$70
$14:c42d  ac ae 52      ldy $52ae
$14:c430  eb            xba
$14:c431  06 15         asl $15
$14:c433  c3 e6         cmp $e6,s
$14:c435  06 f4         asl $f4
$14:c437  07 06         ora [$06]
$14:c439  fa            plx
$14:c43a  01 38         ora ($38,x)
$14:c43c  6a            ror a
$14:c43d  8e a0 1c      stx $1ca0
$14:c440  f3 ec         sbc ($ec,s),y
$14:c442  01 04         ora ($04,x)
$14:c444  01 c1         ora ($c1,x)
$14:c446  48            pha
$14:c447  c0 41 20      cpy #$2041
$14:c44a  d0 28         bne $c474
$14:c44c  5c 1e 2f 13   jml $132f1e
$14:c450  89 c5 26      bit #$26c5
$14:c453  11 b9         ora ($b9),y
$14:c455  c4 da         cpy $da
$14:c457  7d 13 9c      adc $9c13,x
$14:c45a  97 c2         sta [$c2],y
$14:c45c  08            php
$14:c45d  d6 17         dec $17,x
$14:c45f  38            sec
$14:c460  3a            dec a
$14:c461  c2 0e         rep #$0e
$14:c463  84 28         sty $28
$14:c465  35 03         and $03,x
$14:c467  81 80         sta ($80,x)
$14:c469  d0 70         bne $c4db
$14:c46b  3a            dec a
$14:c46c  19 0c 85      ora $850c,y
$14:c46f  42 31         wdm #$31
$14:c471  b0 9c         bcs $c40f
$14:c473  76 3f         ror $3f,x
$14:c475  19 00 c8      ora $c800,y
$14:c478  d0 20         bne $c49a
$14:c47a  12 08         ora ($08)
$14:c47c  05 82         ora $82
$14:c47e  01 e0         ora ($e0,x)
$14:c480  80 70         bra $c4f2
$14:c482  0f e5 c0 80   ora $80c0e5
$14:c486  c1 e0         cmp ($e0,x)
$14:c488  30 98         bmi $c422
$14:c48a  1c 4c 68      trb $684c
$14:c48d  03 72         ora $72,s
$14:c48f  8a            txa
$14:c490  4f 22 e9 90   eor $90e922
$14:c494  26 83         rol $83
$14:c496  98            tya
$14:c497  48            pha
$14:c498  a9 03 35      lda #$3503
$14:c49b  19 88 30      ora $3088,y
$14:c49e  19 02 a0      ora $a002,y
$14:c4a1  15 ca         ora $ca,x
$14:c4a3  a1 78         lda ($78,x)
$14:c4a5  e8            inx
$14:c4a6  7e 11 c4      ror $c411,x
$14:c4a9  65 03         adc $03
$14:c4ab  2a            rol a
$14:c4ac  60            rts
$14:c4ad  1c 0b 0e      trb $0e0b
$14:c4b0  87 c2         sta [$c2]
$14:c4b2  60            rts
$14:c4b3  33 79         and ($79,s),y
$14:c4b5  3c 72 01      bit $0172,x
$14:c4b8  0b            phd
$14:c4b9  87 ca         sta [$ca]
$14:c4bb  67 6e         adc [$6e]
$14:c4bd  04 8f         tsb $8f
$14:c4bf  40            rti
$14:c4c0  23 10         and $10,s
$14:c4c2  03 f0         ora $f0,s
$14:c4c4  03 84         ora $84,s
$14:c4c6  82 0f 22      brl $e6d8
$14:c4c9  c0 60 38      cpy #$3860
$14:c4cc  14 0b         trb $0b
$14:c4ce  07 03         ora [$03]
$14:c4d0  c1 e0         cmp ($e0,x)
$14:c4d2  f8            sed
$14:c4d3  68            pla
$14:c4d4  3e 0f f6      rol $f60f,x
$14:c4d7  55 b4         eor $b4,x
$14:c4d9  5a            phy
$14:c4da  07 0f         ora [$0f]
$14:c4dc  80 c0         bra $c49e
$14:c4de  a1 90         lda ($90,x)
$14:c4e0  d8            cld
$14:c4e1  24 14         bit $14
$14:c4e3  34 10         bit $10,x
$14:c4e5  22 58 a2 82   jsl $82a258
$14:c4e9  19 01 83      ora $8301,y
$14:c4ec  43 20         eor $20,s
$14:c4ee  b0 44         bcs $c534
$14:c4f0  58            cli
$14:c4f1  40            rti
$14:c4f2  df 47 00 e8   cmp $e80047,x
$14:c4f6  60            rts
$14:c4f7  0c e1 80      tsb $80e1
$14:c4fa  b0 58         bcs $c554
$14:c4fc  28            plp
$14:c4fd  06 10         asl $10
$14:c4ff  55 20         eor $20,x
$14:c501  4c 0d a0      jmp $a00d
$14:c504  15 10         ora $10,x
$14:c506  d0 35         bne $c53d
$14:c508  01 be         ora ($be,x)
$14:c50a  73 18         adc ($18,s),y
$14:c50c  c3 bf         cmp $bf,s
$14:c50e  23 10         and $10,s
$14:c510  77 fe         adc [$fe],y
$14:c512  46 26         lsr $26
$14:c514  00 fc         brk #$fc
$14:c516  98            tya
$14:c517  70 03         bvs $c51c
$14:c519  f9 7f 82      sbc $827f,y
$14:c51c  7b            tdc
$14:c51d  66 df         ror $df
$14:c51f  78            sei
$14:c520  c5 2a         cmp $2a
$14:c522  cb            wai
$14:c523  06 8c         asl $8c
$14:c525  b7 d2         lda [$d2],y
$14:c527  09 7b 9b      ora #$9b7b
$14:c52a  74 23         stz $23,x
$14:c52c  1e 0b 2c      asl $2c0b,x
$14:c52f  60            rts
$14:c530  f0 b0         beq $c4e2
$14:c532  0c 87 83      tsb $8387
$14:c535  71 40         adc ($40),y
$14:c537  86 40         stx $40
$14:c539  23 51         and $51,s
$14:c53b  80 51         bra $c58e
$14:c53d  a3 0a         lda $0a,s
$14:c53f  01 78         ora ($78,x)
$14:c541  80 2e         bra $c571
$14:c543  42 0c         wdm #$0c
$14:c545  fe 06 fa      inc $fa06,x
$14:c548  ca            dex
$14:c549  61 e6         adc ($e6,x)
$14:c54b  f2 fb         sbc ($fb)
$14:c54d  1d 02 c9      ora $c902,x
$14:c550  06 8c         asl $8c
$14:c552  37 ca         and [$ca],y
$14:c554  1f 30 3f a5   ora $a53f30,x
$14:c558  92 30         sta ($30)
$14:c55a  ba            tsx
$14:c55b  38            sec
$14:c55c  06 c2         asl $c2
$14:c55e  61 e8         adc ($e8,x)
$14:c560  cc 7c 21      cpy $217c
$14:c563  0b            phd
$14:c564  a0 9a 4c      ldy #$4c9a
$14:c567  20 49 83      jsr $8349
$14:c56a  86 60         stx $60
$14:c56c  34 10         bit $10,x
$14:c56e  0b            phd
$14:c56f  84 02         sty $02
$14:c571  70 de         bvs $c551
$14:c573  05 20         ora $20
$14:c575  a6 08         ldx $08
$14:c577  de 5f 48      dec $485f,x
$14:c57a  dd 2d 70      cmp $702d,x
$14:c57d  a7 d4         lda [$d4]
$14:c57f  8d b1 9c      sta $9cb1
$14:c582  74 19         stz $19,x
$14:c584  cf 07 9a 01   cmp $019a07
$14:c588  8d 6f 82      sta $826f
$14:c58b  61 41         adc ($41,x)
$14:c58d  a3 00         lda $00,s
$14:c58f  9f 29 9d 30   sta $309d29,x
$14:c593  50 78         bvc $c60d
$14:c595  c4 2e         cpy $2e
$14:c597  0d 0d 82      ora $820d
$14:c59a  45 a2         eor $a2
$14:c59c  41 66         eor ($66,x)
$14:c59e  84 41         sty $41
$14:c5a0  e2 90         sep #$90
$14:c5a2  32 08         and ($08)
$14:c5a4  40            rti
$14:c5a5  92 ec         sta ($ec)
$14:c5a7  63 09         adc $09,s
$14:c5a9  86 80         stx $80
$14:c5ab  c8            iny
$14:c5ac  3d 04 f8      and $f804,x
$14:c5af  26 16         rol $16
$14:c5b1  41 c0         eor ($c0,x)
$14:c5b3  a8            tay
$14:c5b4  60            rts
$14:c5b5  0c 20 15      tsb $1520
$14:c5b8  89 5c fe      bit #$fe5c
$14:c5bb  1f 1f 82 c3   ora $c3821f,x
$14:c5bf  c5 c0         cmp $c0
$14:c5c1  a6 69         ldx $69
$14:c5c3  02 61         cop #$61
$14:c5c5  48            pha
$14:c5c6  cd a8 fc      cmp $fca8
$14:c5c9  78            sei
$14:c5ca  3e 14 0f      rol $0f14,x
$14:c5cd  01 38         ora ($38,x)
$14:c5cf  20 01 55      jsr $5501
$14:c5d2  84 1a         sty $1a
$14:c5d4  15 40         ora $40,x
$14:c5d6  d3 88         cmp ($88,s),y
$14:c5d8  14 da         trb $da
$14:c5da  3d 0c 8e      and $8e0c,x
$14:c5dd  4e 27 90      lsr $9027
$14:c5e0  68            pla
$14:c5e1  d2 05         cmp ($05)
$14:c5e3  67 90         adc [$90]
$14:c5e5  d9 84 7a      cmp $7a84,y
$14:c5e8  40            rti
$14:c5e9  21 00         and ($00,x)
$14:c5eb  3b            tsc
$14:c5ec  40            rti
$14:c5ed  3e 0c f1      rol $f10c,x
$14:c5f0  50 5d         bvc $c64f
$14:c5f2  01 41         ora ($41,x)
$14:c5f4  73 f8         adc ($f8,s),y
$14:c5f6  05 fe         ora $fe
$14:c5f8  21 bf         and ($bf,x)
$14:c5fa  d0 45         bne $c641
$14:c5fc  ed 19 98      sbc $9819
$14:c5ff  37 52         and [$52],y
$14:c601  97 8a         sta [$8a],y
$14:c603  ae de 23      ldx $23de
$14:c606  90 0b         bcc $c613
$14:c608  04 42         tsb $42
$14:c60a  c1 a0         cmp ($a0,x)
$14:c60c  a0 5a         ldy #$5a
$14:c60e  30 10         bmi $c620
$14:c610  6e 05 2f      ror $2f05
$14:c613  01 5d         ora ($5d,x)
$14:c615  c0 47         cpy #$47
$14:c617  3c 1f 88      bit $881f,x
$14:c61a  07 f2         ora [$f2]
$14:c61c  21 fa         and ($fa,x)
$14:c61e  85 74         sta $74
$14:c620  25 93         and $93
$14:c622  2e 05 5b      rol $5b05
$14:c625  49 a2 ba      eor #$baa2
$14:c628  4f 2e 10 08   eor $08102e
$14:c62c  64 42         stz $42
$14:c62e  19 0a 82      ora $820a,y
$14:c631  4b            phk
$14:c632  20 5c 08      jsr $085c
$14:c635  36 92         rol $92,x
$14:c637  05 74         ora $74
$14:c639  81 5c         sta ($5c,x)
$14:c63b  21 ce         and ($ce,x)
$14:c63d  f1 d0         sbc ($d0),y
$14:c63f  4b            phk
$14:c640  f6 13         inc $13,x
$14:c642  fa            plx
$14:c643  04 5e         tsb $5e
$14:c645  91 19         sta ($19),y
$14:c647  c3 4d         cmp $4d,s
$14:c649  25 78         and $78
$14:c64b  ac eb 80      ldy $80eb
$14:c64e  00 61         brk #$61
$14:c650  b0 a0         bcs $c5f2
$14:c652  50 30         bvc $c684
$14:c654  14 8c         trb $8c
$14:c656  06 1a         asl $1a
$14:c658  81 2b         sta ($2b,x)
$14:c65a  e0 67         cpx #$67
$14:c65c  68            pla
$14:c65d  00 f0         brk #$f0
$14:c65f  fc 42 3f      jsr ($3f42,x)
$14:c662  11 0f         ora ($0f),y
$14:c664  a4 03         ldy $03
$14:c666  b5 2a         lda $2a,x
$14:c668  98            tya
$14:c669  71 2a         adc ($2a),y
$14:c66b  5a            phy
$14:c66c  6d f5 d1      adc $d1f5
$14:c66f  3a            dec a
$14:c670  42 10         wdm #$10
$14:c672  0f 84 aa 09   ora $09aa84
$14:c676  c4 81         cpy $81
$14:c678  69 a0 02      adc #$02a0
$14:c67b  b0 5d         bcs $c6da
$14:c67d  9a            txs
$14:c67e  1c 0e 82      trb $820e
$14:c681  73 28         adc ($28,s),y
$14:c683  09 b8 d7      ora #$d7b8
$14:c686  66 be         ror $be
$14:c688  08            php
$14:c689  11 f4         ora ($f4),y
$14:c68b  0f c9 a0 21   ora $21a0c9
$14:c68f  84 41         sty $41
$14:c691  26 1f         rol $1f
$14:c693  0a            asl a
$14:c694  86 02         stx $02
$14:c696  81 e0         sta ($e0,x)
$14:c698  30 82         bmi $c61c
$14:c69a  f0 40         beq $c6dc
$14:c69c  61 00         adc ($00,x)
$14:c69e  f0 10         beq $c6b0
$14:c6a0  c2 a1         rep #$a1
$14:c6a2  20 a0 4c      jsr $4ca0
$14:c6a5  21 01         and ($01,x)
$14:c6a7  e0 40         cpx #$40
$14:c6a9  b1 c8         lda ($c8),y
$14:c6ab  a0 67         ldy #$67
$14:c6ad  d6 5b         dec $5b,x
$14:c6af  2c 00 dc      bit $dc00
$14:c6b2  41 e0         eor ($e0,x)
$14:c6b4  28            plp
$14:c6b5  85 02         sta $02
$14:c6b7  f5 8c         sbc $8c,x
$14:c6b9  9b            txy
$14:c6ba  52 2e         eor ($2e)
$14:c6bc  df ca a6 d2   cmp $d2a6ca,x
$14:c6c0  b0 70         bcs $c732
$14:c6c2  18            clc
$14:c6c3  44 22 09      mvp $09,$22
$14:c6c6  6a            ror a
$14:c6c7  c2 49         rep #$49
$14:c6c9  b8            clv
$14:c6ca  17 6c         ora [$6c],y
$14:c6cc  05 53         ora $53
$14:c6ce  01 58         ora ($58,x)
$14:c6d0  c0 20         cpy #$20
$14:c6d2  54 e8 67      mvn $67,$e8
$14:c6d5  f6 58         inc $58,x
$14:c6d7  3b            tsc
$14:c6d8  2c 19 60      bit $6019
$14:c6db  7f 3e 85 43   adc $43853e,x
$14:c6df  51 08         eor ($08),y
$14:c6e1  ea            nop
$14:c6e2  75 37         adc $37,x
$14:c6e4  dc aa b7      jml [$b7aa]
$14:c6e7  a8            tay
$14:c6e8  fe 8a 90      inc $908a,x
$14:c6eb  56 87         lsr $87,x
$14:c6ed  52 51         eor ($51)
$14:c6ef  ca            dex
$14:c6f0  82 7a a0      brl $676d
$14:c6f3  97 fc         sta [$fc],y
$14:c6f5  06 ff         asl $ff
$14:c6f7  21 3f         and ($3f,x)
$14:c6f9  b0 65         bcs $c760
$14:c6fb  e5 15         sbc $15
$14:c6fd  9a            txs
$14:c6fe  37 7b         and [$7b],y
$14:c700  03 ff         ora $ff,s
$14:c702  af 7f e7 f8   lda $f8e77f
$14:c706  0b            phd
$14:c707  06 42         asl $42
$14:c709  c1 60         cmp ($60,x)
$14:c70b  c0 4a         cpy #$4a
$14:c70d  38            sec
$14:c70e  14 6c         trb $6c
$14:c710  06 7e         asl $7e
$14:c712  c1 7f         cmp ($7f,x)
$14:c714  cf 5f f7 ff   cmp $fff75f
$14:c718  06 90         asl $90
$14:c71a  44 3e 90      mvp $90,$3e
$14:c71d  0e a4 92      asl $92a4
$14:c720  61 cc         adc ($cc,x)
$14:c722  ba            tsx
$14:c723  65 3e         adc $3e
$14:c725  12 4f         ora ($4f)
$14:c727  03 80         ora $80,s
$14:c729  62 10 c8      per $8f3c
$14:c72c  04 32         tsb $32
$14:c72e  49 08 e6      eor #$e608
$14:c731  40            rti
$14:c732  32 90         and ($90)
$14:c734  89 24 63      bit #$6324
$14:c737  00 ae         brk #$ae
$14:c739  35 e0         and $e0,x
$14:c73b  43 a1         eor $a1,s
$14:c73d  10 d8         bpl $c717
$14:c73f  44 ce 01      mvp $01,$ce
$14:c742  2d 92 4e      and $4e92
$14:c745  17 c7         ora [$c7],y
$14:c747  01 83         ora ($83,x)
$14:c749  42 20         wdm #$20
$14:c74b  f0 88         beq $c6d5
$14:c74d  bc 02 7f      ldy $7f02,x
$14:c750  3c 81 df      bit $df81,x
$14:c753  a0 33         ldy #$33
$14:c755  c8            iny
$14:c756  05 fa         ora $fa
$14:c758  79 bf 9f      adc $9fbf,y
$14:c75b  7f e7 d6 f9   adc $f9d6e7,x
$14:c75f  76 7e         ror $7e,x
$14:c761  0d 6f a6      ora $a66f
$14:c764  4e b0 08      lsr $08b0
$14:c767  f2 9f         sbc ($9f)
$14:c769  ff a7 fd e9   sbc $e9fda7,x
$14:c76d  7f 7a 0f fe   adc $fe0f7a,x
$14:c771  bf 61 7f 80   lda $807f61,x
$14:c775  e5 79         sbc $79
$14:c777  11 88         ora ($88),y
$14:c779  21 f0         and ($f0,x)
$14:c77b  88            dey
$14:c77c  7a            ply
$14:c77d  b9 c1 25      lda $25c1,y
$14:c780  0b            phd
$14:c781  80 41         bra $c7c4
$14:c783  e3 62         sbc $62,s
$14:c785  13 a8         ora ($a8,s),y
$14:c787  4a            lsr a
$14:c788  03 07         ora $07,s
$14:c78a  d6 95         dec $95,x
$14:c78c  7f 39 42 1c   adc $1c4239,x
$14:c790  f5 71         sbc $71,x
$14:c792  3a            dec a
$14:c793  12 8b         ora ($8b)
$14:c795  dc 12 7f      jml [$7f12]
$14:c798  88            dey
$14:c799  af ce 2f f3   lda $f32fce
$14:c79d  0b            phd
$14:c79e  fa            plx
$14:c79f  24 17         bit $17
$14:c7a1  41 00         eor ($00,x)
$14:c7a3  94 74         sty $74,x
$14:c7a5  20 9c 0c      jsr $0c9c
$14:c7a8  45 82         eor $82
$14:c7aa  71 00         adc ($00),y
$14:c7ac  98            tya
$14:c7ad  2b            pld
$14:c7ae  d6 2d         dec $2d,x
$14:c7b0  28            plp
$14:c7b1  de 50 3f      dec $3f50,x
$14:c7b4  12 2f         ora ($2f)
$14:c7b6  a4 e3         ldy $e3
$14:c7b8  f9 18 fe      sbc $fe18,y
$14:c7bb  14 02         trb $02
$14:c7bd  00 5d         brk #$5d
$14:c7bf  09 44 5a      ora #$5a44
$14:c7c2  81 06         sta ($06,x)
$14:c7c4  91 43         sta ($43),y
$14:c7c6  00 a1         brk #$a1
$14:c7c8  18            clc
$14:c7c9  57 ad         eor [$ad],y
$14:c7cb  52 a9         eor ($a9)
$14:c7cd  11 8a         ora ($8a),y
$14:c7cf  43 e3         eor $e3,s
$14:c7d1  11 b8         ora ($b8),y
$14:c7d3  24 be         bit $be
$14:c7d5  30 f5         bmi $c7cc
$14:c7d7  27 d8         and [$d8]
$14:c7d9  55 21         eor $21,x
$14:c7db  11 48         ora ($48),y
$14:c7dd  40            rti
$14:c7de  9c 20 82      stz $8220
$14:c7e1  61 02         adc ($02,x)
$14:c7e3  a5 42         lda $42
$14:c7e5  71 b6         adc ($b6),y
$14:c7e7  a5 76         lda $76
$14:c7e9  24 1e         bit $1e
$14:c7eb  c8            iny
$14:c7ec  80 6c         bra $c85a
$14:c7ee  3e 10 40      rol $4010,x
$14:c7f1  e8            inx
$14:c7f2  60            rts
$14:c7f3  09 01 06      ora #$0601
$14:c7f6  a5 41         lda $41
$14:c7f8  24 11         bit $11
$14:c7fa  c8            iny
$14:c7fb  84 b2         sty $b2
$14:c7fd  01 0c         ora ($0c,x)
$14:c7ff  82 46 15      brl $dd48
$14:c802  e5 03         sbc $03
$14:c804  80 af         bra $c7b5
$14:c806  82 1d 00      brl $c826
$14:c809  8d c0 a3      sta $a3c0
$14:c80c  f0 03         beq $c811
$14:c80e  b8            clv
$14:c80f  ae 05 8e      ldx $8e05
$14:c812  30 76         bmi $c88a
$14:c814  60            rts
$14:c815  40            rti
$14:c816  88            dey
$14:c817  a0 c4         ldy #$c4
$14:c819  5f c4 a3 f1   eor $f1a3c4,x
$14:c81d  98            tya
$14:c81e  d0 5c         bne $c87c
$14:c820  37 1c         and [$1c],y
$14:c822  0b            phd
$14:c823  c7 03         cmp [$03]
$14:c825  f1 60         sbc ($60),y
$14:c827  94 4c         sty $4c,x
$14:c829  2a            rol a
$14:c82a  09 a0 e0      ora #$e0a0
$14:c82d  66 20         ror $20
$14:c82f  17 08         ora [$08],y
$14:c831  07 01         ora [$01]
$14:c833  48            pha
$14:c834  36 00         rol $00,x
$14:c836  30 70         bmi $c8a8
$14:c838  2c 18 03      bit $0318
$14:c83b  88            dey
$14:c83c  4d e0 16      eor $16e0
$14:c83f  88            dey
$14:c840  4c a2 4f      jmp $4fa2
$14:c843  1e 87 9d      asl $9d87,x
$14:c846  c1 fa         cmp ($fa,x)
$14:c848  08            php
$14:c849  20 44 0d      jsr $0d44
$14:c84c  fe 13 76      inc $7613,x
$14:c84f  93 d0         sta ($d0,s),y
$14:c851  1f a0 09 4f   ora $4f09a0,x
$14:c855  07 62         ora [$62]
$14:c857  51 58         eor ($58),y
$14:c859  ec 4e 37      cpx $374e
$14:c85c  17 0f         ora [$0f],y
$14:c85e  65 c3         adc $c3
$14:c860  fd 10 e5      sbc $e510,x
$14:c863  53 22         eor ($22,s),y
$14:c865  d1 8e         cmp ($8e),y
$14:c867  c4 02         cpy $02
$14:c869  b1 80         lda ($80),y
$14:c86b  9c 28 85      stz $8528
$14:c86e  46 11         lsr $11
$14:c870  08            php
$14:c871  05 32         ora $32
$14:c873  61 18         adc ($18,x)
$14:c875  2d 84 0c      and $0c84
$14:c878  e2 10         sep #$10
$14:c87a  68            pla
$14:c87b  0c 7e 07      tsb $077e
$14:c87e  3e 81 cf      rol $cf81,x
$14:c881  60            rts
$14:c882  73 c8         adc ($c8,s),y
$14:c884  24 44         bit $44
$14:c886  e0 28         cpx #$28
$14:c888  92 38         sta ($38)
$14:c88a  80 14         bra $c8a0
$14:c88c  a0 86         ldy #$86
$14:c88e  f0 87         beq $c817
$14:c890  7f 39 5d 09   adc $095d39,x
$14:c894  15 b3         ora $b3,x
$14:c896  8d fc e2      sta $e2fc
$14:c899  7a            ply
$14:c89a  20 1f 88      jsr $881f
$14:c89d  42 54         wdm #$54
$14:c89f  2e 18 0e      rol $0e18
$14:c8a2  54 12 45      mvn $45,$12
$14:c8a5  0c e3 46      tsb $46e3
$14:c8a8  38            sec
$14:c8a9  84 70         sty $70
$14:c8ab  8e 42 14      stx $1442
$14:c8ae  82 5d 0b      brl $d40e
$14:c8b1  fc fc 5e      jsr ($5efc,x)
$14:c8b4  71 eb         adc ($eb),y
$14:c8b6  fc 82 ff      jsr ($ff82,x)
$14:c8b9  00 9f         brk #$9f
$14:c8bb  ae 84 5e      ldx $5e84
$14:c8be  93 f8         sta ($f8,s),y
$14:c8c0  f4 f9 90      pea $90f9
$14:c8c3  c1 80         cmp ($80,x)
$14:c8c5  90 7b         bcc $c942
$14:c8c7  22 1f 49 c7   jsl $c7491f
$14:c8cb  f2 31         sbc ($31)
$14:c8cd  fc 0c 01      jsr ($010c,x)
$14:c8d0  38            sec
$14:c8d1  70 16         bvs $c8e9
$14:c8d3  0d 05 03      ora $0305
$14:c8d6  21 00         and ($00,x)
$14:c8d8  71 84         adc ($84),y
$14:c8da  61 90         adc ($90,x)
$14:c8dc  bf f8 0c fa   lda $fa0cf8,x
$14:c8e0  83 1e         sta $1e,s
$14:c8e2  a8            tay
$14:c8e3  c8            iny
$14:c8e4  ef b3 18 4c   sbc $4c18b3
$14:c8e8  5a            phy
$14:c8e9  1d 0a a3      ora $a30a,x
$14:c8ec  45 e3         eor $e3
$14:c8ee  ff d1 70 40   sbc $4070d1,x
$14:c8f2  2b            pld
$14:c8f3  f2 01         sbc ($01)
$14:c8f5  c8            iny
$14:c8f6  42 60         wdm #$60
$14:c8f8  d0 e8         bne $c8e2
$14:c8fa  0d 19 e8      ora $e819
$14:c8fd  12 03         ora ($03)
$14:c8ff  78            sei
$14:c900  7e 20 5f      ror $5f20,x
$14:c903  48            pha
$14:c904  96 12         stx $12,y
$14:c906  ed 18 90      sbc $9018
$14:c909  74 3c         stz $3c,x
$14:c90b  1a            inc a
$14:c90c  0e 07 43      asl $4307
$14:c90f  e0 39         cpx #$39
$14:c911  0f d4 17 e5   ora $e517d4
$14:c915  0d fb 42      ora $42fb
$14:c918  24 1c         bit $1c
$14:c91a  07 70         ora [$70]
$14:c91c  0a            asl a
$14:c91d  c3 e1         cmp $e1,s
$14:c91f  08            php
$14:c920  8f c1 d5 e5   sta $e5d5c1
$14:c924  3f 5a 04 0c   and $0c045a,x
$14:c928  76 11         ror $11,x
$14:c92a  f8            sed
$14:c92b  0c 70 78      tsb $7870
$14:c92e  11 75         ora ($75),y
$14:c930  f8            sed
$14:c931  c1 d8         cmp ($d8,x)
$14:c933  61 07         adc ($07,x)
$14:c935  78            sei
$14:c936  08            php
$14:c937  0c 01 01      tsb $0101
$14:c93a  d0 e1         bne $c91d
$14:c93c  7f 3c 9f 0f   adc $0f9f3c,x
$14:c940  07 e3         ora [$e3]
$14:c942  91 f8         sta ($f8),y
$14:c944  e0 7e         cpx #$7e
$14:c946  20 12 89      jsr $8912
$14:c949  85 42         sta $42
$14:c94b  c0 d0         cpy #$d0
$14:c94d  1f c3 50 3b   ora $3b50c3,x
$14:c951  1e 0f 07      asl $070f,x
$14:c954  00 56         brk #$56
$14:c956  13 0e         ora ($0e,s),y
$14:c958  05 80         ora $80
$14:c95a  5a            phy
$14:c95b  06 81         asl $81
$14:c95d  06 0c         asl $0c
$14:c95f  22 1b 08 99   jsl $99081b
$14:c963  c0 25         cpy #$25
$14:c965  b2 49         lda ($49)
$14:c967  c4 08         cpy $08
$14:c969  d0 50         bne $c9bb
$14:c96b  18            clc
$14:c96c  34 22         bit $22,x
$14:c96e  0f 08 8b 8e   ora $8e8b08
$14:c972  82 79 03      brl $ccee
$14:c975  bf 32 c5 e0   lda $e0c532,x
$14:c979  18            clc
$14:c97a  02 70         cop #$70
$14:c97c  48            pha
$14:c97d  2c 12 0c      bit $0c12
$14:c980  c4 02         cpy $02
$14:c982  d1 48         cmp ($48),y
$14:c984  9c 04 c0      stz $c004
$14:c987  d0 5c         bne $c9e5
$14:c989  05 38         ora $38
$14:c98b  26 00         rol $00
$14:c98d  b4 17         ldy $17,x
$14:c98f  8c 01 64      sty $6401
$14:c992  0d 08 f3      ora $f308
$14:c995  79 01 a1      adc $a101,y
$14:c998  00 70         brk #$70
$14:c99a  68            pla
$14:c99b  40            rti
$14:c99c  9b            txy
$14:c99d  56 2f         lsr $2f,x
$14:c99f  02 e5         cop #$e5
$14:c9a1  12 3c         ora ($3c)
$14:c9a3  4e 24 cb      lsr $cb24
$14:c9a6  08            php
$14:c9a7  84 82         sty $82
$14:c9a9  61 20         adc ($20,x)
$14:c9ab  dc f8 0e      jml [$0ef8]
$14:c9ae  e1 d4         sbc ($d4,x)
$14:c9b0  98            tya
$14:c9b1  5f 63 91 28   eor $289163,x
$14:c9b5  64 06         stz $06
$14:c9b7  3f 30 8f dc   and $dc8f30,x
$14:c9bb  2b            pld
$14:c9bc  f3 8e         sbc ($8e,s),y
$14:c9be  fa            plx
$14:c9bf  1c 26 90      trb $9026
$14:c9c2  f8            sed
$14:c9c3  ec 0f 91      cpx $910f
$14:c9c6  48            pha
$14:c9c7  d8            cld
$14:c9c8  40            rti
$14:c9c9  2c 30 5e      bit $5e30
$14:c9cc  2c 1f df      bit $df1f
$14:c9cf  c4 f7         cpy $f7
$14:c9d1  71 3f         adc ($3f),y
$14:c9d3  50 c9         bvc $c99e
$14:c9d5  f4 e2 91      pea $91e2
$14:c9d8  30 d8         bmi $c9b2
$14:c9da  7e 2c df      ror $df2c,x
$14:c9dd  b8            clv
$14:c9de  27 ef         and [$ef]
$14:c9e0  99 f8 53      sta $53f8,y
$14:c9e3  84 f3         sty $f3
$14:c9e5  e1 38         sbc ($38,x)
$14:c9e7  e0 32         cpx #$32
$14:c9e9  40            rti
$14:c9ea  de d3 99      dec $99d3,x
$14:c9ed  05 e6         ora $e6
$14:c9ef  c1 94         cmp ($94,x)
$14:c9f1  f8            sed
$14:c9f2  40            rti
$14:c9f3  21 87         and ($87,x)
$14:c9f5  f4 41 85      pea $8541
$14:c9f8  e2 bf         sep #$bf
$14:c9fa  b8            clv
$14:c9fb  45 07         eor $07
$14:c9fd  3d d2 08      and $08d2,x
$14:ca00  f2 b0         sbc ($b0)
$14:ca02  41 38         eor ($38,x)
$14:ca04  b0 5f         bcs $ca65
$14:ca06  6f 1d b2 1f   adc $1fb21d
$14:ca0a  b8            clv
$14:ca0b  64 02         stz $02
$14:ca0d  60            rts
$14:ca0e  9f 2b 27 e2   sta $e2272b,x
$14:ca12  0c a6 07      tsb $07a6
$14:ca15  40            rti
$14:ca16  aa            tax
$14:ca17  c1 5e         cmp ($5e,x)
$14:ca19  db            stp
$14:ca1a  0d 01 dd      ora $dd01
$14:ca1d  17 ed         ora [$ed],y
$14:ca1f  70 44         bvs $ca65
$14:ca21  0a            asl a
$14:ca22  24 99         bit $99
$14:ca24  ed c4 82      sbc $82c4
$14:ca27  7b            tdc
$14:ca28  38            sec
$14:ca29  9e ce 37      stz $37ce,x
$14:ca2c  e6 1e         inc $1e
$14:ca2e  df 68 27 e3   cmp $e32768,x
$14:ca32  9d fa e6      sta $e6fa,x
$14:ca35  bb            tyx
$14:ca36  03 e6         ora $e6,s
$14:ca38  6f 2c 86 83   adc $83862c
$14:ca3c  61 e0         adc ($e0,x)
$14:ca3e  fc ae 82      jsr ($82ae,x)
$14:ca41  41 54         eor ($54,x)
$14:ca43  3e 28 1c      rol $1c28,x
$14:ca46  26 08         rol $08
$14:ca48  80 8f         bra $c9d9
$14:ca4a  91 c1         sta ($c1),y
$14:ca4c  16 c1         asl $c1,x
$14:ca4e  52 6c         eor ($6c)
$14:ca50  a2 75         ldx #$75
$14:ca52  1c a3 fa      trb $faa3
$14:ca55  74 a2         stz $a2,x
$14:ca57  b4 20         ldy $20,x
$14:ca59  b0 58         bcs $cab3
$14:ca5b  84 4a         sty $4a
$14:ca5d  0b            phd
$14:ca5e  1f 81 41 62   ora $624181,x
$14:ca62  71 c8         adc ($c8),y
$14:ca64  6c 3a a3      jmp ($a33a)
$14:ca67  53 80         eor ($80,s),y
$14:ca69  41 a3         eor ($a3,x)
$14:ca6b  11 d8         ora ($d8),y
$14:ca6d  6c 7e 01      jmp ($017e)
$14:ca70  15 9c         ora $9c,x
$14:ca72  4e 6c 17      lsr $176c
$14:ca75  ca            dex
$14:ca76  05 3a         ora $3a
$14:ca78  19 5d 8c      ora $8c5d,y
$14:ca7b  c6 e4         dec $e4
$14:ca7d  12 08         ora ($08)
$14:ca7f  45 22         eor $22
$14:ca81  41 78         eor ($78,x)
$14:ca83  e0 68         cpx #$68
$14:ca85  39 13 8d      and $8d13,y
$14:ca88  85 c2         sta $c2
$14:ca8a  15 4a         ora $4a,x
$14:ca8c  a0 58         ldy #$58
$14:ca8e  33 1b         and ($1b,s),y
$14:ca90  87 18         sta [$18]
$14:ca92  60            rts
$14:ca93  35 11         and $11,x
$14:ca95  cc e4 1a      cpy $1ae4
$14:ca98  7d 02 b9      adc $b902,x
$14:ca9b  6c 37 59      jmp ($5937)
$14:ca9e  8e c4 01      stx $01c4
$14:caa1  5e 23 10      lsr $1023,x
$14:caa4  57 a4         eor [$a4],y
$14:caa6  0e 03 17      asl $1703
$14:caa9  77 82         adc [$82],y
$14:caab  bc 5d e1      ldy $e15d,x
$14:caae  07 80         ora [$80]
$14:cab0  42 18         wdm #$18
$14:cab2  43 17         eor $17,s
$14:cab4  5e 2e 01      lsr $012e,x
$14:cab7  68            pla
$14:cab8  6d 30 e0      adc $e030
$14:cabb  60            rts
$14:cabc  3c 00 f0      bit $f000,x
$14:cabf  57 88         eor [$88],y
$14:cac1  3c 3c 10      bit $103c,x
$14:cac4  08            php
$14:cac5  83 88         sta $88,s
$14:cac7  b0 1e         bcs $cae7
$14:cac9  8e 07 fe      stx $fe07
$14:cacc  03 3e         ora $3e,s
$14:cace  80 c7         bra $ca97
$14:cad0  a2 30         ldx #$30
$14:cad2  38            sec
$14:cad3  6b            rtl
$14:cad4  18            clc
$14:cad5  56 87         lsr $87,x
$14:cad7  fd 80 4f      sbc $4f80,x
$14:cada  e8            inx
$14:cadb  11 f9         ora ($f9),y
$14:cadd  00 78         brk #$78
$14:cadf  1f 0b 00 ff   ora $ff000b,x
$14:cae3  40            rti
$14:cae4  3f 10 0f 84   and $840f10,x
$14:cae8  43 01         eor $01,s
$14:caea  60            rts
$14:caeb  80 48         bra $cb35
$14:caed  1f 29 7e 08   ora $087e29,x
$14:caf1  04 13         tsb $13
$14:caf3  e1 08         sbc ($08,x)
$14:caf5  72 80         adc ($80)
$14:caf7  61 60         adc ($60,x)
$14:caf9  13 c8         ora ($c8,s),y
$14:cafb  17 f5         ora [$f5],y
$14:cafd  e4 10         cpx $10
$14:caff  18            clc
$14:cb00  34 25         bit $25,x
$14:cb02  ea            nop
$14:cb03  d7 e8         cmp [$e8],y
$14:cb05  0f fe 00 03   ora $0300fe
$14:cb09  20 2b 4c      jsr $4c2b
$14:cb0c  38            sec
$14:cb0d  1b            tcs
$14:cb0e  88            dey
$14:cb0f  07 f0         ora [$f0]
$14:cb11  1c 38 00      trb $0038
$14:cb14  c0 06         cpy #$06
$14:cb16  0f a1 00 bc   ora $bc00a1
$14:cb1a  14 8c         trb $8c
$14:cb1c  4a            lsr a
$14:cb1d  d3 79         cmp ($79,s),y
$14:cb1f  7d 76 c5      adc $c576,x
$14:cb22  3e b0 bc      rol $bcb0,x
$14:cb25  44 68 10      mvp $10,$68
$14:cb28  18            clc
$14:cb29  12 cc         ora ($cc)
$14:cb2b  69 f6         adc #$f6
$14:cb2d  08            php
$14:cb2e  10 58         bpl $cb88
$14:cb30  2c 2b 21      bit $212b
$14:cb33  43 24         eor $24,s
$14:cb35  03 d9         ora $d9,s
$14:cb37  f6 dc         inc $dc,x
$14:cb39  51 3f         eor ($3f),y
$14:cb3b  f8            sed
$14:cb3c  3b            tsc
$14:cb3d  e4 0a         cpx $0a
$14:cb3f  ff 01 75 82   sbc $827501,x
$14:cb43  68            pla
$14:cb44  15 e1         ora $e1,x
$14:cb46  f0 83         beq $cacb
$14:cb48  50 a0         bvc $caea
$14:cb4a  d0 0c         bne $cb58
$14:cb4c  1e 07 07      asl $0707,x
$14:cb4f  80 c0         bra $cb11
$14:cb51  b4 85         ldy $85,x
$14:cb53  38            sec
$14:cb54  37 dc         and [$dc],y
$14:cb56  e5 de         sbc $de
$14:cb58  df 1d 91 57   cmp $57911d,x
$14:cb5c  ec 17 f2      cpx $f217
$14:cb5f  30 a3         bmi $cb04
$14:cb61  06 01         asl $01
$14:cb63  1d c1 c3      ora $c3c1,x
$14:cb66  ec 14 20      cpx $2014
$14:cb69  b0 05         bcs $cb70
$14:cb6b  80 10         bra $cb7d
$14:cb6d  b3 e9         lda ($e9,s),y
$14:cb6f  c7 bb         cmp [$bb]
$14:cb71  ed 38 e2      sbc $e238
$14:cb74  5e b8 df      lsr $dfb8,x
$14:cb77  cb            wai
$14:cb78  06 02         asl $02
$14:cb7a  80 d9         bra $cb55
$14:cb7c  0d 05 82      ora $8205
$14:cb7f  71 c0         adc ($c0),y
$14:cb81  4f 8e 1a 01   eor $011a8e
$14:cb85  c6 62         dec $62
$14:cb87  84 81         sty $81
$14:cb89  d0 2c         bne $cbb7
$14:cb8b  50 be         bvc $cb4b
$14:cb8d  c7 26         cmp [$26]
$14:cb8f  eb            xba
$14:cb90  21 ff         and ($ff,x)
$14:cb92  70 67         bvs $cbfb
$14:cb94  d4 1e         pei ($1e)
$14:cb96  76 04         ror $04,x
$14:cb98  f6 51         inc $51,x
$14:cb9a  d8            cld
$14:cb9b  1b            tcs
$14:cb9c  04 f8         tsb $f8
$14:cb9e  38            sec
$14:cb9f  0e 0c 01      asl $010c
$14:cba2  50 08         bvc $cbac
$14:cba4  c1 9f         cmp ($9f,x)
$14:cba6  4e 7d 9f      lsr $9f7d
$14:cba9  4d d5 1b      eor $1bd5
$14:cbac  f9 86 be      sbc $be86,y
$14:cbaf  31 47         and ($47),y
$14:cbb1  00 9c         brk #$9c
$14:cbb3  19 c7 07      ora $07c7,y
$14:cbb6  e5 06         sbc $06
$14:cbb8  a0 28         ldy #$28
$14:cbba  83 0c         sta $0c,s
$14:cbbc  1b            tcs
$14:cbbd  00 d8         brk #$d8
$14:cbbf  a7 04         lda [$04]
$14:cbc1  de 17 cb      dec $cb17,x
$14:cbc4  1c 76 47      trb $4776
$14:cbc7  5c b1 4e e0   jml $e04eb1
$14:cbcb  d1 f8         cmp ($f8),y
$14:cbcd  04 0d         tsb $0d
$14:cbcf  94 30         sty $30,x
$14:cbd1  f9 04 0a      sbc $0a04,y
$14:cbd4  c3 40         cmp $40,s
$14:cbd6  b1 c0         lda ($c0),y
$14:cbd8  6c 70 05      jmp ($0570)
$14:cbdb  10 32         bpl $cc0f
$14:cbdd  8c 22 1b      sty $1b22
$14:cbe0  ea            nop
$14:cbe1  37 e2         and [$e2],y
$14:cbe3  09 fa         ora #$fa
$14:cbe5  83 7f         sta $7f,s
$14:cbe7  13 c0         ora ($c0,s),y
$14:cbe9  ab            plb
$14:cbea  24 f0         bit $f0
$14:cbec  41 04         eor ($04,x)
$14:cbee  61 02         adc ($02,x)
$14:cbf0  51 01         eor ($01),y
$14:cbf2  21 59         and ($59,x)
$14:cbf4  43 0e         eor $0e,s
$14:cbf6  80 c2         bra $cbba
$14:cbf8  e0 11         cpx #$11
$14:cbfa  34 38         bit $38,x
$14:cbfc  1d 81 90      ora $9081,x
$14:cbff  91 d8         sta ($d8),y
$14:cc01  9c 6a 23      stz $236a
$14:cc04  12 3b         ora ($3b)
$14:cc06  89 e1         bit #$e1
$14:cc08  60            rts
$14:cc09  14 0b         trb $0b
$14:cc0b  84 02         sty $02
$14:cc0d  a1 00         lda ($00,x)
$14:cc0f  a4 06         ldy $06
$14:cc11  85 58         sta $58
$14:cc13  2c a2 dc      bit $dca2
$14:cc16  72 3b         adc ($3b)
$14:cc18  18            clc
$14:cc19  8e 42 5c      stx $5c42
$14:cc1c  53 0b         eor ($0b,s),y
$14:cc1e  00 83         brk #$83
$14:cc20  c0 e0         cpy #$e0
$14:cc22  67 75         adc [$75]
$14:cc24  3c 24 5e      bit $5e24,x
$14:cc27  07 07         ora [$07]
$14:cc29  80 8e         bra $cbb9
$14:cc2b  c2 10         rep #$10
$14:cc2d  ae 08 00      ldx $0008
$14:cc30  ec 8f 41      cpx $418f
$14:cc33  e8            inx
$14:cc34  e0 70 12      cpx #$1270
$14:cc37  ea            nop
$14:cc38  98            tya
$14:cc39  46 78         lsr $78
$14:cc3b  7a            ply
$14:cc3c  30 1c         bmi $cc5a
$14:cc3e  08            php
$14:cc3f  04 42         tsb $42
$14:cc41  01 e0         ora ($e0,x)
$14:cc43  80 38         bra $cc7d
$14:cc45  c0 f4 51      cpy #$51f4
$14:cc48  68            pla
$14:cc49  d4 a2         pei ($a2)
$14:cc4b  05 76         ora $76
$14:cc4d  88            dey
$14:cc4e  d0 7a         bne $ccca
$14:cc50  33 9a         and ($9a,s),y
$14:cc52  4d 5a 9d      eor $9d5a
$14:cc55  8a            txa
$14:cc56  e3 45         sbc $45,s
$14:cc58  e3 f1         sbc $f1,s
$14:cc5a  a9 0c         lda #$0c
$14:cc5c  0a            asl a
$14:cc5d  fb            xce
$14:cc5e  11 b7         ora ($b7),y
$14:cc60  74 65         stz $65,x
$14:cc62  d4 9c         pei ($9c)
$14:cc64  35 3b         and $3b,x
$14:cc66  03 c6         ora $c6,s
$14:cc68  80 c7         bra $cc31
$14:cc6a  e4 1d         cpx $1d
$14:cc6c  0d 84 a3      ora $a384
$14:cc6f  01 dc         ora ($dc,x)
$14:cc71  88            dey
$14:cc72  41 22         eor ($22,x)
$14:cc74  d3 89         cmp ($89,s),y
$14:cc76  27 53         and [$53]
$14:cc78  c9 a2         cmp #$a2
$14:cc7a  e3 74         sbc $74,s
$14:cc7c  3e 1b 08      rol $081b,x
$14:cc7f  46 02         lsr $02
$14:cc81  f9 10 f6      sbc $f610,y
$14:cc84  45 bd         eor $bd
$14:cc86  12 4e         ora ($4e)
$14:cc88  17 92         ora [$92],y
$14:cc8a  05 c6         ora $c6
$14:cc8c  2f 04 22 31   and $312204
$14:cc90  66 93         ror $93
$14:cc92  62 af 19      per $e644
$14:cc95  2a            rol a
$14:cc96  b7 46         lda [$46],y
$14:cc98  43 71         eor $71,s
$14:cc9a  8c c2 62      sty $62c2
$14:cc9d  d0 e8         bne $cc87
$14:cc9f  54 1a cd      mvn $cd,$1a
$14:cca2  01 c5         ora ($c5,x)
$14:cca4  5c 72 56 d0   jml $d05672
$14:cca8  28            plp
$14:cca9  5c 61 d0 98   jml $98d061
$14:ccad  31 c0         and ($c0),y
$14:ccaf  20 d0 19      jsr $19d0
$14:ccb2  07 00         ora [$00]
$14:ccb4  1e 14 8e      asl $8e14,x
$14:ccb7  67 a2         adc [$a2]
$14:ccb9  01 04         ora ($04,x)
$14:ccbb  89 4c         bit #$4c
$14:ccbd  a4 c1         ldy $c1
$14:ccbf  90 ce         bcc $cc8f
$14:ccc1  7d 1c 61      adc $611c,x
$14:ccc4  b0 80         bcs $cc46
$14:ccc6  73 26         adc ($26,s),y
$14:ccc8  10 0f         bpl $ccd9
$14:ccca  e4 4b         cpx $4b
$14:cccc  d9 26 e4      cmp $e426,y
$14:cccf  0a            asl a
$14:ccd0  43 e9         eor $e9,s
$14:ccd2  02 80         cop #$80
$14:ccd4  1b            tcs
$14:ccd5  81 74         sta ($74,x)
$14:ccd7  10 48         bpl $cd21
$14:ccd9  04 2a         tsb $2a
$14:ccdb  15 0e         ora $0e,x
$14:ccdd  8b            phb
$14:ccde  45 a2         eor $a2
$14:cce0  91 49         sta ($49),y
$14:cce2  2c 94 de      bit $de94
$14:cce5  d0 08         bne $ccef
$14:cce7  74 22         stz $22,x
$14:cce9  3d 08 8e      and $8e08,x
$14:ccec  46 27         lsr $27
$14:ccee  ab            plb
$14:ccef  a2 a0 50      ldx #$50a0
$14:ccf2  21 10         and ($10,x)
$14:ccf4  8c c6 e3      sty $e3c6
$14:ccf7  51 ea         eor ($ea),y
$14:ccf9  ac 56 b3      ldy $b356
$14:ccfc  59 e5 d1      eor $d1e5,y
$14:ccff  d0 18         bne $cd19
$14:cd01  83 b8         sta $b8,s
$14:cd03  88            dey
$14:cd04  7e b4 1f      ror $1fb4,x
$14:cd07  ab            plb
$14:cd08  07 f8         ora [$f8]
$14:cd0a  de 10 28      dec $2810,x
$14:cd0d  34 10         bit $10,x
$14:cd0f  e8            inx
$14:cd10  10 08         bpl $cd1a
$14:cd12  2c 16 1b      bit $1b16
$14:cd15  0d 83 c1      ora $c183
$14:cd18  e5 72         sbc $72
$14:cd1a  b3 78         lda ($78,s),y
$14:cd1c  c1 8e         cmp ($8e,x)
$14:cd1e  62 b5 18      per $e5d6
$14:cd21  04 36         tsb $36
$14:cd23  11 0f         ora ($0f),y
$14:cd25  82 4b e2      brl $af73
$14:cd28  19 0c 86      ora $860c,y
$14:cd2b  e2 61         sep #$61
$14:cd2d  78            sei
$14:cd2e  e8            inx
$14:cd2f  74 32         stz $32,x
$14:cd31  99 4c d6      sta $d64c,y
$14:cd34  6a            ror a
$14:cd35  45 22         eor $22
$14:cd37  c6 61         dec $61
$14:cd39  20 19 05      jsr $0519
$14:cd3c  38            sec
$14:cd3d  60            rts
$14:cd3e  3f 12 0f 85   and $850f12,x
$14:cd42  83 e9         sta $e9,s
$14:cd44  64 ff         stz $ff
$14:cd46  77 3f         adc [$3f],y
$14:cd48  d7 8f         cmp [$8f],y
$14:cd4a  e1 cc         sbc ($cc,x)
$14:cd4c  62 d0 28      per $f61f
$14:cd4f  fc 52 3b      jsr ($3b52,x)
$14:cd52  0b            phd
$14:cd53  95 c0         sta $c0,x
$14:cd55  a4 52         ldy $52
$14:cd57  c9 04         cmp #$04
$14:cd59  96 92         stx $92,y
$14:cd5b  ef 28 04 7d   sbc $7d0428
$14:cd5f  e6 33         inc $33
$14:cd61  f8            sed
$14:cd62  e4 fa         cpx $fa
$14:cd64  3d 3e 9f      and $9f3e,x
$14:cd67  5f e4 12 0a   eor $0a12e4,x
$14:cd6b  80 44         bra $cdb1
$14:cd6d  41 e0         eor ($e0,x)
$14:cd6f  93 08         sta ($08,s),y
$14:cd71  84 43         sty $43
$14:cd73  69 b4         adc #$b4
$14:cd75  d1 68         cmp ($68),y
$14:cd77  a0 00 f0      ldy #$f000
$14:cd7a  b8            clv
$14:cd7b  08            php
$14:cd7c  42 81         wdm #$81
$14:cd7e  60            rts
$14:cd7f  51 8c         eor ($8c),y
$14:cd81  42 01         wdm #$01
$14:cd83  b4 8a         ldy $8a,x
$14:cd85  6d 8a c1      adc $c18a
$14:cd88  06 83         asl $83
$14:cd8a  2e 02 13      rol $1302
$14:cd8d  09 3b         ora #$3b
$14:cd8f  02 cc         cop #$cc
$14:cd91  20 50 21      jsr $2150
$14:cd94  88            dey
$14:cd95  1c c6 0d      trb $0dc6
$14:cd98  02 87         cop #$87
$14:cd9a  c1 99         cmp ($99,x)
$14:cd9c  81 0e         sta ($0e,x)
$14:cd9e  39 8b 00      and $008b,y
$14:cda1  89 e0         bit #$e0
$14:cda3  19 09 84      ora $8409,y
$14:cda6  82 40 4f      brl $1ce9
$14:cda9  10 f8         bpl $cda3
$14:cdab  d9 2d 84      cmp $842d,y
$14:cdae  f2 80         sbc ($80)
$14:cdb0  4c 03 e0      jmp $e003
$14:cdb3  57 23         eor [$23],y
$14:cdb5  28            plp
$14:cdb6  db            stp
$14:cdb7  21 71         and ($71,x)
$14:cdb9  8f 74 9e 11   sta $119e74
$14:cdbd  4f db d6 37   eor $37d6db
$14:cdc1  f5 0f         sbc $0f,x
$14:cdc3  7c 42 df      jmp ($df42,x)
$14:cdc6  50 cb         bvc $cd93
$14:cdc8  d6 20         dec $20,x
$14:cdca  f0 0e         beq $cdda
$14:cdcc  c4 03         cpy $03
$14:cdce  60            rts
$14:cdcf  65 12         adc $12
$14:cdd1  b0 09         bcs $cddc
$14:cdd3  83 40         sta $40,s
$14:cdd5  8a            txa
$14:cdd6  1e 84 62      asl $6284,x
$14:cdd9  ef e4 89 7c   sbc $7c89e4
$14:cddd  bd b1 af      lda $afb1,x
$14:cde0  ec 2b ef      cpx $ef2b
$14:cde3  08            php
$14:cde4  fb            xce
$14:cde5  42 bd         wdm #$bd
$14:cde7  31 af         and ($af),y
$14:cde9  04 02         tsb $02
$14:cdeb  36 c9         rol $c9,x
$14:cded  01 f8         ora ($f8,x)
$14:cdef  90 05         bcc $cdf6
$14:cdf1  8e 2c 80      stx $802c
$14:cdf4  35 15         and $15,x
$14:cdf6  06 01         asl $01
$14:cdf8  07 80         ora [$80]
$14:cdfa  c3 e0         cmp $e0,s
$14:cdfc  f1 f8         sbc ($f8),y
$14:cdfe  7a            ply
$14:cdff  e4 27         cpx $27
$14:ce01  f1 f8         sbc ($f8),y
$14:ce03  61 8c         adc ($8c,x)
$14:ce05  6c 70 0a      jmp ($0a70)
$14:ce08  7c 07 3f      jmp ($3f07,x)
$14:ce0b  07 cf         ora [$cf]
$14:ce0d  af 01 78 26   lda $267801
$14:ce11  40            rti
$14:ce12  5f 86 1a 01   eor $011a86,x
$14:ce16  e2 c0         sep #$c0
$14:ce18  7c 7c 1f      jmp ($1f7c,x)
$14:ce1b  9f 83 64 3f   sta $3f6483,x
$14:ce1f  9f 8f 84 02   sta $02848f,x
$14:ce23  39 00 e3      and $e300,y
$14:ce26  40            rti
$14:ce27  3e 58 0f      rol $0f58,x
$14:ce2a  db            stp
$14:ce2b  60            rts
$14:ce2c  7f ae a0 fc   adc $fca0ae,x
$14:ce30  4c e6 36      jmp $36e6
$14:ce33  88            dey
$14:ce34  cd be 61      cmp $61be
$14:ce37  57 8c         eor [$8c],y
$14:ce39  49 e0         eor #$e0
$14:ce3b  10 f8         bpl $ce35
$14:ce3d  04 0c         tsb $0c
$14:ce3f  9e 33 18      stz $1833,x
$14:ce42  74 66         stz $66,x
$14:ce44  0c 64 08      tsb $0864
$14:ce47  c1 58         cmp ($58,x)
$14:ce49  23 06         and $06,s
$14:ce4b  73 80         adc ($80,s),y
$14:ce4d  66 23         ror $23
$14:ce4f  12 c9         ora ($c9)
$14:ce51  87 b2         sta [$b2]
$14:ce53  31 d4         and ($d4),y
$14:ce55  98            tya
$14:ce56  72 20         adc ($20)
$14:ce58  09 f0         ora #$f0
$14:ce5a  c0 13 c6      cpy #$c613
$14:ce5d  31 e0         and ($e0),y
$14:ce5f  98            tya
$14:ce60  70 01         bvs $ce63
$14:ce62  01 30         ora ($30,x)
$14:ce64  84 18         sty $18
$14:ce66  c4 ce         cpy $ce
$14:ce68  71 78         adc ($78),y
$14:ce6a  fc 4e 23      jsr ($234e,x)
$14:ce6d  38            sec
$14:ce6e  9c db e2      stz $e2db
$14:ce71  16 79         asl $79,x
$14:ce73  c3 d4         cmp $d4,s
$14:ce75  a3 d0         lda $d0,s
$14:ce77  08            php
$14:ce78  fc 02 23      jsr ($2302,x)
$14:ce7b  2e 9c c1      rol $c19c
$14:ce7e  8c 41 38      sty $3841
$14:ce81  02 2f         cop #$2f
$14:ce83  23 ad         and $ad,s
$14:ce85  ba            tsx
$14:ce86  93 5f         sta ($5f,s),y
$14:ce88  2a            rol a
$14:ce89  5f c8 03 7c   eor $7c03c8,x
$14:ce8d  03 29         ora $29,s
$14:ce8f  d6 90         dec $90,x
$14:ce91  49 b8         eor #$b8
$14:ce93  15 20         ora $20,x
$14:ce95  d9 19 56      cmp $5619,y
$14:ce98  47 2b         eor [$2b]
$14:ce9a  b3 d3         lda ($d3,s),y
$14:ce9c  6c 74 69      jmp ($6974)
$14:ce9f  34 c2         bit $c2,x
$14:cea1  4f 2f 8a c4   eor $c48a2f
$14:cea5  e1 d0         sbc ($d0,x)
$14:cea7  c8            iny
$14:cea8  3c 1e 39      bit $391e,x
$14:ceab  3f 9f 5f e7   and $e75f9f,x
$14:ceaf  f7 f8         sbc [$f8],y
$14:ceb1  fb            xce
$14:ceb2  34 19         bit $19,x
$14:ceb4  61 1f         adc ($1f,x)
$14:ceb6  81 be         sta ($be,x)
$14:ceb8  42 0f         wdm #$0f
$14:ceba  4e 8f 5b      lsr $5b8f
$14:cebd  a7 5c         lda [$5c]
$14:cebf  6b            rtl
$14:cec0  15 92         ora $92,x
$14:cec2  19 e4 fa      ora $fae4,y
$14:cec5  69 38         adc #$38
$14:cec7  95 80         sta $80,x
$14:cec9  f8            sed
$14:ceca  78            sei
$14:cecb  3e 1f ef      rol $ef1f,x
$14:cece  a7 fb         lda [$fb]
$14:ced0  f9 fe fc      sbc $fcfe,y
$14:ced3  37 41         and [$41],y
$14:ced5  4c 3e 0f      jmp $0f3e
$14:ced8  c0 60 22      cpy #$2260
$14:cedb  b1 99         lda ($99),y
$14:cedd  f4 52 47      pea $4752
$14:cee0  06 88         asl $88
$14:cee2  c2 25         rep #$25
$14:cee4  72 79         adc ($79)
$14:cee6  ac ce 33      ldy $33ce
$14:cee9  18            clc
$14:ceea  83 41         sta $41,s
$14:ceec  a5 d3         lda $d3
$14:ceee  f9 7c fd      sbc $fd7c,y
$14:cef1  84 48         sty $48
$14:cef3  71 9f         adc ($9f),y
$14:cef5  c1 c7         cmp ($c7,x)
$14:cef7  e1 06         sbc ($06,x)
$14:cef9  de 67 3d      dec $3d67,x
$14:cefc  9b            txy
$14:cefd  8f e5 a3 89   sta $89a3e5
$14:cf01  0c f6 7f      tsb $7ff6
$14:cf04  35 1c         and $1c,x
$14:cf06  8a            txa
$14:cf07  84 41         sty $41
$14:cf09  3a            dec a
$14:cf0a  17 0f         ora [$0f],y
$14:cf0c  e5 d3         sbc $d3
$14:cf0e  f9 f4 53      sbc $53f4,y
$14:cf11  0f c1 cc 1f   ora $1fccc1
$14:cf15  84 f0         sty $f0
$14:cf17  2b            pld
$14:cf18  42 dd         wdm #$dd
$14:cf1a  48            pha
$14:cf1b  a3 5b         lda $5b,s
$14:cf1d  22 f7 68 dc   jsl $dc68f7
$14:cf21  61 82         adc ($82,x)
$14:cf23  0b            phd
$14:cf24  70 8b         bvs $ceb1
$14:cf26  44 61 ec      mvp $ec,$61
$14:cf29  90 41         bcc $cf6c
$14:cf2b  0b            phd
$14:cf2c  fc 50 c2      jsr ($c250,x)
$14:cf2f  87 28         sta [$28]
$14:cf31  04 3f         tsb $3f
$14:cf33  a9 c0 da      lda #$dac0
$14:cf36  64 2d         stz $2d
$14:cf38  96 4c         stx $4c,y
$14:cf3a  24 33         bit $33
$14:cf3c  d1 f8         cmp ($f8),y
$14:cf3e  6c 84 63      jmp ($6384)
$14:cf41  30 9d         bmi $cee0
$14:cf43  09 f7 fa      ora #$faf7
$14:cf46  fd fe fd      sbc $fdfe,x
$14:cf49  29 05 d2      and #$d205
$14:cf4c  0e 91 56      asl $5691
$14:cf4f  0c a2 51      tsb $51a2
$14:cf52  01 84         ora ($84,x)
$14:cf54  c6 e3         dec $e3
$14:cf56  d1 38         cmp ($38),y
$14:cf58  02 dc         cop #$dc
$14:cf5a  22 b1 28 54   jsl $5428b1
$14:cf5e  22 0f 07 82   jsl $82070f
$14:cf62  4b            phk
$14:cf63  25 d2         and $d2
$14:cf65  f9 3b 11      sbc $113b,y
$14:cf68  23 f0         and $f0,s
$14:cf6a  74 60         stz $60,x
$14:cf6c  f4 3b 19      pea $193b
$14:cf6f  6c 15 5a      jmp ($5a15)
$14:cf72  e5 cc         sbc $cc
$14:cf74  82 73 3f      brl $0eea
$14:cf77  92 8e         sta ($8e)
$14:cf79  47 41         eor [$41]
$14:cf7b  b8            clv
$14:cf7c  32 4f         and ($4f)
$14:cf7e  e5 f3         sbc $f3
$14:cf80  fd ec 12      sbc $12ec,x
$14:cf83  13 a1         ora ($a1,s),y
$14:cf85  76 7e         ror $7e,x
$14:cf87  4e fc e3      lsr $e3fc
$14:cf8a  e7 0f         sbc [$0f]
$14:cf8c  fd d1 7b      sbc $7bd1,x
$14:cf8f  90 2e         bcc $cfbf
$14:cf91  f6 0b         inc $0b,x
$14:cf93  7d 22 c6      adc $c622,x
$14:cf96  c8            iny
$14:cf97  e3 04         sbc $04,s
$14:cf99  d0 80         bne $cf1b
$14:cf9b  48            pha
$14:cf9c  10 43         bpl $cfe1
$14:cf9e  61 43         adc ($43,x)
$14:cfa0  0f 06 01 c0   ora $c00106
$14:cfa4  80 73         bra $d019
$14:cfa6  64 ff         stz $ff
$14:cfa8  b8            clv
$14:cfa9  e7 df         sbc [$df]
$14:cfab  f1 4b         sbc ($4b),y
$14:cfad  99 6f e8      sta $e86f,y
$14:cfb0  9b            txy
$14:cfb1  d8            cld
$14:cfb2  2e ee 0d      rol $0dee
$14:cfb5  b3 a3         lda ($a3,s),y
$14:cfb7  1f c3 c1 00   ora $00c1c3,x
$14:cfbb  82 40 30      brl $fffe
$14:cfbe  90 0c         bcc $cfcc
$14:cfc0  14 03         trb $03
$14:cfc2  84 8a         sty $8a
$14:cfc4  1c 0c 00      trb $000c
$14:cfc7  10 19         bpl $cfe2
$14:cfc9  f8            sed
$14:cfca  7a            ply
$14:cfcb  c4 31         cpy $31
$14:cfcd  f0 7a         beq $d049
$14:cfcf  3c 05 0e      bit $0e05,x
$14:cfd2  13 08         ora ($08,s),y
$14:cfd4  04 32         tsb $32
$14:cfd6  01 bf         ora ($bf,x)
$14:cfd8  8f ef d6 43   sta $43d6ef
$14:cfdc  df 83 d3 e0   cmp $e0d383,x
$14:cfe0  36 38         rol $38,x
$14:cfe2  04 e0         tsb $e0
$14:cfe4  1a            inc a
$14:cfe5  10 07         bpl $cfee
$14:cfe7  20 0a 07      jsr $070a
$14:cfea  e1 f0         sbc ($f0,x)
$14:cfec  0e 86 01      asl $0186
$14:cfef  4e 0a 30      lsr $300a
$14:cff2  6e 03 3c      ror $3c03
$14:cff5  0c c1 f9      tsb $f9c1
$14:cff8  71 07         adc ($07),y
$14:cffa  83 e5         sta $e5,s
$14:cffc  80 e3         bra $cfe1
$14:cffe  2f 05 76 0e   and $0e7605
$14:d002  e4 1e         cpx $1e
$14:d004  84 76         sty $76
$14:d006  3b            tsc
$14:d007  20 9f cc      jsr $cc9f
$14:d00a  e6 6f         inc $6f
$14:d00c  90 78         bcc $d086
$14:d00e  9c 00 fe      stz $fe00
$14:d011  12 28         ora ($28)
$14:d013  05 02         ora $02
$14:d015  01 4c         ora ($4c,x)
$14:d017  04 0b         tsb $0b
$14:d019  b9 1a 81      lda $811a,y
$14:d01c  0c fe 64      tsb $64fe
$14:d01f  b3 d1         lda ($d1,s),y
$14:d021  4f a4 0b fc   eor $fc0ba4
$14:d025  11 37         ora ($37),y
$14:d027  50 c0         bvc $cfe9
$14:d029  90 c3         bcc $cfee
$14:d02b  0b            phd
$14:d02c  80 40         bra $d06e
$14:d02e  5d cf 1a      eor $1acf,x
$14:d031  8f 44 23 f3   sta $f32344
$14:d035  99 cb f6      sta $f6cb,y
$14:d038  24 30         bit $30
$14:d03a  0b            phd
$14:d03b  04 02         tsb $02
$14:d03d  8c 0c 9c      sty $9c0c
$14:d040  67 f2         adc [$f2]
$14:d042  95 ce         sta $ce,x
$14:d044  c5 7e         cmp $7e
$14:d046  83 b5         sta $b5,s
$14:d048  31 80         and ($80),y
$14:d04a  41 45         eor ($45,x)
$14:d04c  8b            phb
$14:d04d  60            rts
$14:d04e  b0 54         bcs $d0a4
$14:d050  2e 1a 1d      rol $1d1a
$14:d053  85 2e         sta $2e
$14:d055  b3 05         lda ($05,s),y
$14:d057  86 41         stx $41
$14:d059  a1 c6         lda ($c6,x)
$14:d05b  f4 b8 5c      pea $5cb8
$14:d05e  36 1b         rol $1b,x
$14:d060  3a            dec a
$14:d061  cd 7e 19      cmp $197e
$14:d064  0b            phd
$14:d065  87 0b         sta [$0b]
$14:d067  4e 19 0c      lsr $0c19
$14:d06a  8a            txa
$14:d06b  47 21         eor [$21]
$14:d06d  51 ac         eor ($ac),y
$14:d06f  a4 d2         ldy $d2
$14:d071  81 60         sta ($60,x)
$14:d073  e0 78 11      cpx #$1178
$14:d076  e9 1c 8e      sbc #$8e1c
$14:d079  46 b3         lsr $b3
$14:d07b  53 4f         eor ($4f,s),y
$14:d07d  a5 83         lda $83
$14:d07f  40            rti
$14:d080  9e 33 81      stz $8133,x
$14:d083  d4 6e         pei ($6e)
$14:d085  1a            inc a
$14:d086  3d 8d 56      and $568d,x
$14:d089  b8            clv
$14:d08a  7d 44 09      adc $0944,x
$14:d08d  dc f6 3b      jml [$3bf6]
$14:d090  7a            ply
$14:d091  e5 6e         sbc $6e
$14:d093  1d 09 77      ora $7709,x
$14:d096  22 4c b1 51   jsl $51b14c
$14:d09a  aa            tax
$14:d09b  a5 d1         lda $d1
$14:d09d  3a            dec a
$14:d09e  8a            txa
$14:d09f  13 ce         ora ($ce,s),y
$14:d0a1  46 bb         lsr $bb
$14:d0a3  57 4d         eor [$4d],y
$14:d0a5  a7 82         lda [$82]
$14:d0a7  40            rti
$14:d0a8  2e 51 60      rol $6051
$14:d0ab  c0 e0 3c      cpy #$3ce0
$14:d0ae  5e 64 5a      lsr $5a64,x
$14:d0b1  3c ef 67      bit $67ef,x
$14:d0b4  c0 c1 f9      cpy #$f9c1
$14:d0b7  9c 38 f4      stz $f438
$14:d0ba  65 fe         adc $fe
$14:d0bc  f0 0c         beq $d0ca
$14:d0be  01 28         ora ($28,x)
$14:d0c0  2c dd 03      bit $03dd
$14:d0c3  18            clc
$14:d0c4  04 63         tsb $63
$14:d0c6  81 66         sta ($66,x)
$14:d0c8  c3 7c         cmp $7c,s
$14:d0ca  26 0e         rol $0e
$14:d0cc  fa            plx
$14:d0cd  3d 87 3b      and $3b87,x
$14:d0d0  8c ff a8      sty $a8ff
$14:d0d3  64 0f         stz $0f
$14:d0d5  8d c1 07      sta $07c1
$14:d0d8  d2 6c         cmp ($6c)
$14:d0da  3c c3 e8      bit $e8c3,x
$14:d0dd  14 0d         trb $0d
$14:d0df  83 01         sta $01,s
$14:d0e1  c6 83         dec $83
$14:d0e3  03 e0         ora $e0,s
$14:d0e5  f1 e8         sbc ($e8),y
$14:d0e7  9f 4d 78 0d   sta $0d784d,x
$14:d0eb  1c 81 00      trb $0081
$14:d0ee  88            dey
$14:d0ef  40            rti
$14:d0f0  1d c0 ee      ora $eec0,x
$14:d0f3  0a            asl a
$14:d0f4  02 e8         cop #$e8
$14:d0f6  56 21         lsr $21,x
$14:d0f8  0f 80 47 20   ora $204780
$14:d0fc  02 e0         cop #$e0
$14:d0fe  b0 40         bcs $d140
$14:d100  2d 10 0e      and $0e10
$14:d103  83 28         sta $28,s
$14:d105  44 a1 c0      mvp $c0,$a1
$14:d108  62 0c 22      per $f317
$14:d10b  01 24         ora ($24,x)
$14:d10d  80 45         bra $d154
$14:d10f  20 10 a6      jsr $a610
$14:d112  d0 b4         bne $d0c8
$14:d114  40            rti
$14:d115  3c 13 88      bit $8813,x
$14:d118  07 32         ora [$32]
$14:d11a  01 36         ora ($36,x)
$14:d11c  80 45         bra $d163
$14:d11e  a0 11 b8      ldy #$b811
$14:d121  04 2e         tsb $2e
$14:d123  01 12         ora ($12,x)
$14:d125  8f 42 a1 72   sta $72a142
$14:d129  09 fd 06      ora #$06fd
$14:d12c  ff 52 b9 bc   sbc $bcb952,x
$14:d130  c2 7b         rep #$7b
$14:d132  3d 87 c3      and $c387,x
$14:d135  e4 30         cpx $30
$14:d137  09 a2 e8      ora #$e8a2
$14:d13a  43 21         eor $21,s
$14:d13c  8c 80 34      sty $3480
$14:d13f  42 84         wdm #$84
$14:d141  b4 1a         ldy $1a,x
$14:d143  65 f2         adc $f2
$14:d145  e1 f0         sbc ($f0,x)
$14:d147  90 78         bcc $d1c1
$14:d149  24 01         bit $01
$14:d14b  50 f0         bvc $d13d
$14:d14d  58            cli
$14:d14e  3c 1c 00      bit $001c,x
$14:d151  48            pha
$14:d152  40            rti
$14:d153  30 4b         bmi $d1a0
$14:d155  23 04         and $04,s
$14:d157  82 d4 16      brl $e82e
$14:d15a  a4 59         ldy $59
$14:d15c  08            php
$14:d15d  8c 7e 0b      sty $0b7e
$14:d160  05 79         ora $79
$14:d162  85 82         sta $82
$14:d164  ff 49 bc c4   sbc $c4bc49,x
$14:d168  23 f3         and $f3,s
$14:d16a  e9 f3 f4      sbc #$f4f3
$14:d16d  16 e1         asl $e1,x
$14:d16f  3a            dec a
$14:d170  01 1e         ora ($1e,x)
$14:d172  1a            inc a
$14:d173  01 e0         ora ($e0,x)
$14:d175  80 50         bra $d1c7
$14:d177  56 83         lsr $83,x
$14:d179  2c 9e 4c      bit $4c9e
$14:d17c  02 43         cop #$43
$14:d17e  80 c0         bra $d140
$14:d180  05 db         ora $db
$14:d182  84 b2         sty $b2
$14:d184  36 38         rol $38,x
$14:d186  09 da 1f      ora #$1fda
$14:d189  0b            phd
$14:d18a  85 ac         sta $ac
$14:d18c  c2 17         rep #$17
$14:d18e  04 86         tsb $86
$14:d190  40            rti
$14:d191  e0 eb e1      cpx #$e1eb
$14:d194  3d 8b b4      and $b48b,x
$14:d197  0e 56 48      asl $4856
$14:d19a  0d 06 81      ora $8106
$14:d19d  8e 1a 0a      stx $0a1a
$14:d1a0  05 83         ora $83
$14:d1a2  00 09         brk #$09
$14:d1a4  01 68         ora ($68,x)
$14:d1a6  1e c7 40      asl $40c7,x
$14:d1a9  c6 14         dec $14
$14:d1ab  a4 9b         ldy $9b
$14:d1ad  bc ff e9      ldy $e9ff,x
$14:d1b0  0f 69 5c 03   ora $035c69
$14:d1b4  1f fb e5 f3   ora $f3e5fb,x
$14:d1b8  16 75         asl $75,x
$14:d1ba  fb            xce
$14:d1bb  f8            sed
$14:d1bc  73 38         adc ($38,s),y
$14:d1be  0c 3a f1      tsb $f13a
$14:d1c1  6f b4 d6 66   adc $66d6b4
$14:d1c5  9d 6f a3      sta $a36f,x
$14:d1c8  d6 68         dec $68,x
$14:d1ca  32 8e         and ($8e)
$14:d1cc  a2 f1 bc      ldx #$bcf1
$14:d1cf  5f f3 81 cb   eor $cb81f3,x
$14:d1d3  5a            phy
$14:d1d4  c4 6e         cpy $6e
$14:d1d6  31 fc         and ($fc),y
$14:d1d8  f8            sed
$14:d1d9  72 f8         adc ($f8)
$14:d1db  8c 58 e8      sty $e858
$14:d1de  6c 34 57      jmp ($5734)
$14:d1e1  e8            inx
$14:d1e2  36 99         rol $99,x
$14:d1e4  c9 1b 09      cmp #$091b
$14:d1e7  85 fa         sta $fa
$14:d1e9  3d a6 a3      and $a3a6,x
$14:d1ec  29 61 76      and #$7661
$14:d1ef  50 18         bvc $d209
$14:d1f1  02 e0         cop #$e0
$14:d1f3  21 e7         and ($e7,x)
$14:d1f5  61 5c         adc ($5c,x)
$14:d1f7  01 cc         ora ($cc,x)
$14:d1f9  0f de bb 16   ora $16bbde
$14:d1fd  d0 78         bne $d277
$14:d1ff  20 1f 04      jsr $041f
$14:d202  b0 a5         bcs $d1a9
$14:d204  40            rti
$14:d205  d3 06         cmp ($06,s),y
$14:d207  a6 a8         ldx $a8
$14:d209  2b            pld
$14:d20a  86 51         stx $51
$14:d20c  00 92         brk #$92
$14:d20e  40            rti
$14:d20f  22 10 08 60   jsl $600810
$14:d213  20 fa 10      jsr $10fa
$14:d216  0e c4 02      asl $02c4
$14:d219  d1 00         cmp ($00),y
$14:d21b  b6 40         ldx $40,y
$14:d21d  26 70         rol $70
$14:d21f  08            php
$14:d220  e1 d8         sbc ($d8,x)
$14:d222  41 21         eor ($21,x)
$14:d224  02 67         cop #$67
$14:d226  0c 11 a4      tsb $a411
$14:d229  30 88         bmi $d1b3
$14:d22b  04 c2         tsb $c2
$14:d22d  00 67         brk #$67
$14:d22f  00 e8         brk #$e8
$14:d231  42 db         wdm #$db
$14:d233  c3 16         cmp $16,s
$14:d235  80 41         bra $d278
$14:d237  97 03         sta [$03],y
$14:d239  38            sec
$14:d23a  4b            phk
$14:d23b  0b            phd
$14:d23c  6c 8d e5      jmp ($e58d)
$14:d23f  07 83         ora [$83]
$14:d241  c6 63         dec $63
$14:d243  f2 89         sbc ($89)
$14:d245  7c b2 79      jmp ($79b2,x)
$14:d248  10 8f         bpl $d1d9
$14:d24a  bc 4e 01      ldy $014e,x
$14:d24d  18            clc
$14:d24e  80 48         bra $d298
$14:d250  15 c3         ora $c3,x
$14:d252  43 80         eor $80,s
$14:d254  58            cli
$14:d255  0d 4b f0      ora $f04b
$14:d258  f8            sed
$14:d259  53 2f         eor ($2f,s),y
$14:d25b  92 6f         sta ($6f)
$14:d25d  37 13         and [$13],y
$14:d25f  f9 02 ff      sbc $ff02,y
$14:d262  04 4d         tsb $4d
$14:d264  70 38         bvs $d29e
$14:d266  28            plp
$14:d267  04 64         tsb $64
$14:d269  90 27         bcc $d292
$14:d26b  d6 7a         dec $7a,x
$14:d26d  84 62         sty $62
$14:d26f  3f 34 9b c9   and $c99b34,x
$14:d273  a7 cf         lda [$cf]
$14:d275  da            phx
$14:d276  a4 40         ldy $40
$14:d278  28            plp
$14:d279  20 c9 d6      jsr $d6c9
$14:d27c  6f 22 5f 2b   adc $2b5f22
$14:d280  15 f8         ora $f8,x
$14:d282  3b            tsc
$14:d283  14 28         trb $28
$14:d285  04 36         tsb $36
$14:d287  01 81         ora ($81,x)
$14:d289  16 5c         asl $5c,x
$14:d28b  de 6f 24      dec $246f,x
$14:d28e  9e 46 40      stz $4046,x
$14:d291  a0 40 90      ldy #$9040
$14:d294  58            cli
$14:d295  59 e0 08      eor $08e0,y
$14:d298  e4 2a         cpx $2a
$14:d29a  97 4b         sta [$4b],y
$14:d29c  e5 a2         sbc $a2
$14:d29e  9f 74 b3 c9   sta $c9b374,x
$14:d2a2  13 32         ora ($32,s),y
$14:d2a4  2f 06 01 e1   and $e10106
$14:d2a8  c0 23 8a      cpy #$8a23
$14:d2ab  07 03         ora [$03]
$14:d2ad  86 43         stx $43
$14:d2af  0f a1 1a 8d   ora $8d1aa1
$14:d2b3  1e 42 7b      asl $7b42,x
$14:d2b6  3f 47 20 ac   and $ac2047,x
$14:d2ba  00 61         brk #$61
$14:d2bc  05 80         ora $80
$14:d2be  42 11         wdm #$11
$14:d2c0  cb            wai
$14:d2c1  18            clc
$14:d2c2  8c 6d 26      sty $266d
$14:d2c5  9d ec f6      sta $f6ec,x
$14:d2c8  52 39         eor ($39)
$14:d2ca  2c 96 7a      bit $7a96
$14:d2cd  bd c8 e2      lda $e2c8,x
$14:d2d0  f0 40         beq $d312
$14:d2d2  39 0e 20      and $200e,y
$14:d2d5  c0 78 a0      cpy #$a078
$14:d2d8  1d 28 04      ora $0428,x
$14:d2db  42 01         wdm #$01
$14:d2dd  02 81         cop #$81
$14:d2df  41 60         eor ($60,x)
$14:d2e1  8b            phb
$14:d2e2  50 5c         bvc $d340
$14:d2e4  84 ae         sty $ae
$14:d2e6  5e 37 0a      lsr $0a37,x
$14:d2e9  85 7e         sta $7e
$14:d2eb  c1 7f         cmp ($7f,x)
$14:d2ed  16 80         asl $80,x
$14:d2ef  ac 05 60      ldy $6005
$14:d2f2  c9 07 68      cmp #$6807
$14:d2f5  21 c1         and ($c1,x)
$14:d2f7  0e 08 e0      asl $e008
$14:d2fa  57 07         eor [$07],y
$14:d2fc  03 01         ora $01,s
$14:d2fe  d0 88         bne $d288
$14:d300  34 c3         bit $c3,x
$14:d302  d9 ec be      cmp $beec,y
$14:d305  7f 27 5f a9   adc $a95f27,x
$14:d309  f7 fb         sbc [$fb],y
$14:d30b  80 e6         bra $d2f3
$14:d30d  17 18         ora [$18],y
$14:d30f  38            sec
$14:d310  c1 da         cmp ($da,x)
$14:d312  08            php
$14:d313  e0 82 23      cpx #$2382
$14:d316  95 1c         sta $1c,x
$14:d318  4f 10 86 c3   eor $c38610
$14:d31c  22 d1 e9 1a   jsl $1ae9d1
$14:d320  f8            sed
$14:d321  d8            cld
$14:d322  a1 0f         lda ($0f,x)
$14:d324  80 46         bra $d36c
$14:d326  e0 11 38      cpx #$3811
$14:d329  04 84         tsb $84
$14:d32b  58            cli
$14:d32c  e0 f4 98      cpx #$98f4
$14:d32f  4c 3d 1f      jmp $1f3d
$14:d332  82 98 14      brl $e7cd
$14:d335  c0 3e 0a      cpy #$0a3e
$14:d338  30 fc         bmi $d336
$14:d33a  60            rts
$14:d33b  3d 10 0e      and $0e10,x
$14:d33e  60            rts
$14:d33f  aa            tax
$14:d340  60            rts
$14:d341  90 48         bcc $d38b
$14:d343  ec 72 6b      cpx $6b72
$14:d346  3c 93 4f      bit $4f93,x
$14:d349  8d c8 c7      sta $c7c8
$14:d34c  02 38         cop #$38
$14:d34e  48            pha
$14:d34f  d8            cld
$14:d350  83 41         sta $41,s
$14:d352  37 3e         and [$3e],y
$14:d354  82 41 d8      brl $ab98
$14:d357  cc 76 23      cpy $2376
$14:d35a  13 49         ora ($49,s),y
$14:d35c  e1 b9         sbc ($b9,x)
$14:d35e  1c 61 d8      trb $d861
$14:d361  80 79         bra $d3dc
$14:d363  30 1e         bmi $d383
$14:d365  48            pha
$14:d366  07 08         ora [$08]
$14:d368  dc b0 24      jml [$24b0]
$14:d36b  20 40 a2      jsr $a240
$14:d36e  e1 41         sbc ($41,x)
$14:d370  93 8f         sta ($8f,s),y
$14:d372  8c 8a 11      sty $118a
$14:d375  f6 20         inc $20,x
$14:d377  40            rti
$14:d378  a5 f0         lda $f0
$14:d37a  09 39 b9      ora #$b939
$14:d37d  ca            dex
$14:d37e  61 40         adc ($40,x)
$14:d380  a0 58 2c      ldy #$2c58
$14:d383  1f 0f 87 40   ora $40870f,x
$14:d387  ca            dex
$14:d388  05 f1         ora $f1
$14:d38a  07 80         ora [$80]
$14:d38c  94 36         sty $36,x
$14:d38e  10 0c         bpl $d39c
$14:d390  c4 02         cpy $02
$14:d392  11 00         ora ($00),y
$14:d394  86 09         stx $09
$14:d396  82 3f 12      brl $e5d8
$14:d399  89 48 27      bit #$2748
$14:d39c  f3 09         sbc ($09,s),y
$14:d39e  fd 12 f8      sbc $f812,x
$14:d3a1  ef 09 f4 fa   sbc $faf409
$14:d3a5  1f 0f 90 40   ora $40900f,x
$14:d3a9  25 ad         and $ad
$14:d3ab  60            rts
$14:d3ac  31 0e         and ($0e),y
$14:d3ae  0d 48 28      ora $2848
$14:d3b1  d0 13         bne $d3c6
$14:d3b3  86 73         stx $73
$14:d3b5  39 b0 f8      and $f8b0,y
$14:d3b8  48            pha
$14:d3b9  3c 14 0e      bit $0e14,x
$14:d3bc  07 83         ora [$83]
$14:d3be  c1 60         cmp ($60,x)
$14:d3c0  f0 70         beq $d432
$14:d3c2  0c 61 00      tsb $0061
$14:d3c5  b1 3b         lda ($3b),y
$14:d3c7  0a            asl a
$14:d3c8  00 ff         brk #$ff
$14:d3ca  00 68         brk #$68
$14:d3cc  08            php
$14:d3cd  c8            iny
$14:d3ce  aa            tax
$14:d3cf  0e f0 8c      asl $8cf0
$14:d3d2  c6 5e         dec $5e
$14:d3d4  61 18         adc ($18,x)
$14:d3d6  8f d0 af d4   sta $d4afd0
$14:d3da  8a            txa
$14:d3db  7c ee 7e      jmp ($7eee,x)
$14:d3de  fd 29 30      sbc $3029,x
$14:d3e1  08            php
$14:d3e2  54 a1 81      mvn $81,$a1
$14:d3e5  73 08         adc ($08,s),y
$14:d3e7  0c 01 a1      tsb $a101
$14:d3ea  4c e6 5c      jmp $5ce6
$14:d3ed  2e 01 30      rol $3001
$14:d3f0  09 83 64      ora #$6483
$14:d3f3  02 62         cop #$62
$14:d3f5  03 08         ora $08,s
$14:d3f7  04 ca         tsb $ca
$14:d3f9  01 8c         ora ($8c,x)
$14:d3fb  06 08         asl $08
$14:d3fd  74 32         stz $32,x
$14:d3ff  00 c1         brk #$c1
$14:d401  d0 38         bne $d43b
$14:d403  86 35         stx $35
$14:d405  1a            inc a
$14:d406  8d c6 e5      sta $e5c6
$14:d409  93 c8         sta ($c8,s),y
$14:d40b  f8            sed
$14:d40c  d9 e4 b0      cmp $b0e4,y
$14:d40f  09 24 02      ora #$0224
$14:d412  86 44         stx $44
$14:d414  9c e4 72      stz $72e4
$14:d417  21 10         and ($10,x)
$14:d419  98            tya
$14:d41a  4c 02 e2      jmp $e202
$14:d41d  58            cli
$14:d41e  5f 14 03 d9   eor $d90314,x
$14:d422  00 e4         brk #$e4
$14:d424  03 04         ora $04,s
$14:d426  ce d6 8b      dec $8bd6
$14:d429  fc 21 ec      jsr ($ec21,x)
$14:d42c  17 fb         ora [$fb],y
$14:d42e  8d fe c1      sta $c1fe
$14:d431  7f 94 4b e7   adc $e74b94,x
$14:d435  13 87         ora ($87,s),y
$14:d437  e8            inx
$14:d438  35 44         and $44,x
$14:d43a  c8            iny
$14:d43b  2c 22 06      bit $0622
$14:d43e  84 1c         sty $1c
$14:d440  c8            iny
$14:d441  33 af         and ($af,s),y
$14:d443  f4 b3 d9      pea $d9b3
$14:d446  5c ee 7e bf   jml $bf7eee
$14:d44a  53 0f         eor ($0f,s),y
$14:d44c  87 93         sta [$93]
$14:d44e  c9 98 cc      cmp #$cc98
$14:d451  05 c0         ora $c0
$14:d453  3a            dec a
$14:d454  11 28         ora ($28),y
$14:d456  04 8a         tsb $8a
$14:d458  01 04         ora ($04,x)
$14:d45a  10 0c         bpl $d468
$14:d45c  62 01 60      per $3460
$14:d45f  32 0d         and ($0d)
$14:d461  02 be         cop #$be
$14:d463  b7 0a         lda [$0a],y
$14:d465  02 e0         cop #$e0
$14:d467  27 f2         and [$f2]
$14:d469  79 fc 6a      adc $6afc,y
$14:d46c  3d 07 65      and $6507,x
$14:d46f  88            dey
$14:d470  fc 00 0d      jsr ($0d00,x)
$14:d473  01 61         ora ($61,x)
$14:d475  1c ab f5      trb $f5ab
$14:d478  5a            phy
$14:d479  fd 4c be      sbc $be4c,x
$14:d47c  57 4f         eor [$4f],y
$14:d47e  a7 b3         lda [$b3]
$14:d480  d9 b8 dc      cmp $dcb8,y
$14:d483  37 49         and [$49],y
$14:d485  ca            dex
$14:d486  0e 52 84      asl $8452
$14:d489  32 04         and ($04)
$14:d48b  b8            clv
$14:d48c  20 62 8f      jsr $8f62
$14:d48f  c8            iny
$14:d490  27 e3         and [$e3]
$14:d492  10 88         bpl $d41c
$14:d494  4f e7 07 50   eor $5007e7
$14:d498  87 c2         sta [$c2]
$14:d49a  e0 f0 37      cpx #$37f0
$14:d49d  f4 b0 93      pea $93b0
$14:d4a0  91 f8         sta ($f8),y
$14:d4a2  84 14         sty $14
$14:d4a4  06 21         asl $21
$14:d4a6  f4 96 7a      pea $7a96
$14:d4a9  3f 1f 0a 85   and $850a1f,x
$14:d4ad  83 80         sta $80,s
$14:d4af  1e 37 28      asl $2837,x
$14:d4b2  09 49 da      ora #$da49
$14:d4b5  0a            asl a
$14:d4b6  d0 76         bne $d52e
$14:d4b8  85 0e         sta $0e
$14:d4ba  ff 41 5b 0c   sbc $0c5b41,x
$14:d4be  82 ff 70      brl $45c0
$14:d4c1  9f cf 23 f1   sta $f123cf,x
$14:d4c5  78            sei
$14:d4c6  7b            tdc
$14:d4c7  2c 8f d9      bit $d98f
$14:d4ca  e4 fe         cpx $fe
$14:d4cc  71 3f         adc ($3f),y
$14:d4ce  90 4f         bcc $d51f
$14:d4d0  e4 23         cpx $23
$14:d4d2  f5 16         sbc $16,x
$14:d4d4  fa            plx
$14:d4d5  5f 3f 1a 8d   eor $8d1a3f,x
$14:d4d9  83 78         sta $78,s
$14:d4db  20 49 e3      jsr $e349
$14:d4de  31 92         and ($92),y
$14:d4e0  fd 20 63      sbc $6320,x
$14:d4e3  01 98         ora ($98,x)
$14:d4e5  0d 04 f2      ora $f204
$14:d4e8  03 9f         ora $9f,s
$14:d4ea  3f 19 44 8a   and $8a4419,x
$14:d4ee  73 20         adc ($20,s),y
$14:d4f0  2f f1 f8 e1   and $e1f8f1
$14:d4f4  f0 f9         beq $d4ef
$14:d4f6  7c c2 41      jmp ($41c2,x)
$14:d4f9  49 cb 4b      eor #$4bcb
$14:d4fc  ea            nop
$14:d4fd  18            clc
$14:d4fe  0e 83 c0      asl $c083
$14:d501  e0 12 f5      cpx #$f512
$14:d504  f0 43         beq $d549
$14:d506  df 43 af e8   cmp $e8af43,x
$14:d50a  01 41         ora ($41,x)
$14:d50c  50 32         bvc $d540
$14:d50e  69 55 57      adc #$5755
$14:d511  bb            tyx
$14:d512  c1 bf         cmp ($bf,x)
$14:d514  e9 a9 3d      sbc #$3da9
$14:d517  d8            cld
$14:d518  e6 0e         inc $0e
$14:d51a  fe 7e 29      inc $297e,x
$14:d51d  54 73 bb      mvn $bb,$73
$14:d520  22 0f 05 26   jsl $26050f
$14:d524  39 1c 13      and $131c,y
$14:d527  0b            phd
$14:d528  bf c0 1e 21   lda $211ec0,x
$14:d52c  19 10 54      ora $5410,y
$14:d52f  b5 54         lda $54,x
$14:d531  10 db         bpl $d50e
$14:d533  48            pha
$14:d534  84 87         sty $87
$14:d536  41 15         eor ($15,x)
$14:d538  41 b9         eor ($b9,x)
$14:d53a  3f e7 81 3d   and $3d81e7,x
$14:d53e  09 cb d0      ora #$d0cb
$14:d541  3e 94 c9      rol $c994,x
$14:d544  24 62         bit $62
$14:d546  b5 3c         lda $3c,x
$14:d548  9e 5f 96      stz $965f,x
$14:d54b  a0 b3 05      ldy #$05b3
$14:d54e  88            dey
$14:d54f  14 41         trb $41
$14:d551  68            pla
$14:d552  37 e4         and [$e4],y
$14:d554  e8            inx
$14:d555  30 d1         bmi $d528
$14:d557  82 0b 40      brl $1565
$14:d55a  9e 40 16      stz $1640,x
$14:d55d  c0 ca 06      cpy #$06ca
$14:d560  9a            txs
$14:d561  33 05         and ($05,s),y
$14:d563  7c 0d 0d      jmp ($0d0d,x)
$14:d566  5e 8c 61      lsr $618c,x
$14:d569  6c 2f 52      jmp ($522f)
$14:d56c  5a            phy
$14:d56d  02 f0         cop #$f0
$14:d56f  5d fe d0      eor $d0fe,x
$14:d572  08            php
$14:d573  05 08         ora $08
$14:d575  24 a1         bit $a1
$14:d577  10 0e         bpl $d587
$14:d579  78            sei
$14:d57a  3b            tsc
$14:d57b  c7 de         cmp [$de]
$14:d57d  30 f2         bmi $d571
$14:d57f  0f 94 bc c7   ora $c7bc94
$14:d583  e7 4f         sbc [$4f]
$14:d585  52 74         eor ($74)
$14:d587  06 03         asl $03
$14:d589  07 83         ora [$83]
$14:d58b  c7 63         cmp [$63]
$14:d58d  f0 98         beq $d527
$14:d58f  7c c2 7e      jmp ($7ec2,x)
$14:d592  b1 38         lda ($38),y
$14:d594  04 1a         tsb $1a
$14:d596  01 08         ora ($08,x)
$14:d598  47 0c         eor [$0c]
$14:d59a  41 48         eor ($48,x)
$14:d59c  fa            plx
$14:d59d  0c 05 c2      tsb $c205
$14:d5a0  41 70         eor ($70,x)
$14:d5a2  80 62         bra $d606
$14:d5a4  31 1f         and ($1f),y
$14:d5a6  cf e2 34 be   cmp $be34e2
$14:d5aa  10 0b         bpl $d5b7
$14:d5ac  c4 03         cpy $03
$14:d5ae  f1 20         sbc ($20),y
$14:d5b0  6f 05 d1 1c   adc $1cd105
$14:d5b4  36 0d         rol $0d,x
$14:d5b6  84 7e         sty $7e
$14:d5b8  5f 20 87 bd   eor $bd8720,x
$14:d5bc  06 13         asl $13
$14:d5be  0d 85 be      ora $be85
$14:d5c1  4b            phk
$14:d5c2  61 0f         adc ($0f,x)
$14:d5c4  97 c0         sta [$c0],y
$14:d5c6  21 e0         and ($e0,x)
$14:d5c8  21 84         and ($84,x)
$14:d5ca  c0 21 60      cpy #$6021
$14:d5cd  83 c0         sta $c0,s
$14:d5cf  e0 ef ff      cpx #$ffef
$14:d5d2  df f5 ee 39   cmp $39eef5,x
$14:d5d6  26 52         rol $52
$14:d5d8  36 0e         rol $0e,x
$14:d5da  f9 fd 80      sbc $80fd,y
$14:d5dd  5e e0 01      lsr $01e0,x
$14:d5e0  67 77         adc [$77]
$14:d5e2  7b            tdc
$14:d5e3  ff c2 1e 21   sbc $211ec2,x
$14:d5e7  c8            iny
$14:d5e8  07 fd         ora [$fd]
$14:d5ea  49 87 0d      eor #$0d87
$14:d5ed  3e f9 ff      rol $fff9,x
$14:d5f0  c5 a1         cmp $a1
$14:d5f2  18            clc
$14:d5f3  8c 4f 24      sty $244f
$14:d5f6  96 65         stx $65,y
$14:d5f8  a8            tay
$14:d5f9  2c c1 62      bit $62c1
$14:d5fc  0a            asl a
$14:d5fd  d4 80         pei ($80)
$14:d5ff  4f 23 17 e6   eor $e61723
$14:d603  28            plp
$14:d604  30 c1         bmi $d5c7
$14:d606  76 5f         ror $5f,x
$14:d608  98            tya
$14:d609  3f ea 09 fd   and $fd09ea,x
$14:d60d  81 ff         sta ($ff,x)
$14:d60f  e0 29 00      cpx #$0029
$14:d612  48            pha
$14:d613  06 ff         asl $ff
$14:d615  a0 db 08      ldy #$08db
$14:d618  3c 02 09      bit $0902,x
$14:d61b  01 81         ora ($81,x)
$14:d61d  c0 20 22      cpy #$2220
$14:d620  a3 e8         lda $e8,s
$14:d622  3a            dec a
$14:d623  86 d7         stx $d7
$14:d625  7b            tdc
$14:d626  fb            xce
$14:d627  d8            cld
$14:d628  ff e9 01 f7   sbc $f701e9,x
$14:d62c  59 aa 7c      eor $7caa,y
$14:d62f  a9 ae b2      lda #$b2ae
$14:d632  23 88         and $88,s
$14:d634  bd e1 2c      lda $2ce1,x
$14:d637  78            sei
$14:d638  c4 80         cpy $80
$14:d63a  ff e2 37 79   sbc $7937e2,x
$14:d63e  af fe a7 ff   lda $ffa7fe
$14:d642  bb            tyx
$14:d643  ff f5 be fe   sbc $febef5,x
$14:d647  f0 08         beq $d651
$14:d649  1e 8b 15      asl $158b,x
$14:d64c  c6 4c         dec $4c
$14:d64e  75 1e         adc $1e,x
$14:d650  f8            sed
$14:d651  80 70         bra $d6c3
$14:d653  00 6d         brk #$6d
$14:d655  73 ff         adc ($ff,s),y
$14:d657  d5 ff         cmp $ff,x
$14:d659  f5 fb         sbc $fb,x
$14:d65b  07 7e         ora [$7e]
$14:d65d  c1 bf         cmp ($bf,x)
$14:d65f  e0 7f f0      cpx #$f07f
$14:d662  0d 72 fe      ora $fe72
$14:d665  c2 c7         rep #$c7
$14:d667  61 60         adc ($60,x)
$14:d669  c0 0f c3      cpy #$c30f
$14:d66c  81 00         sta ($00,x)
$14:d66e  c0 2b 4e      cpy #$4e2b
$14:d671  16 4a         asl $4a,x
$14:d673  15 80         ora $80,x
$14:d675  40            rti
$14:d676  e0 30 68      cpx #$6830
$14:d679  04 36         tsb $36
$14:d67b  07 0d         ora [$0d]
$14:d67d  81 47         sta ($47,x)
$14:d67f  a0 31 d9      ldy #$d931
$14:d682  1d e3 ce      ora $cee3,x
$14:d685  af 18 09 88   lda $880918
$14:d689  0a            asl a
$14:d68a  01 00         ora ($00,x)
$14:d68c  81 39         sta ($39,x)
$14:d68e  06 47         asl $47
$14:d690  00 2f         brk #$2f
$14:d692  11 08         ora ($08),y
$14:d694  30 12         bmi $d6a8
$14:d696  0e 06 83      asl $8306
$14:d699  81 50         sta ($50,x)
$14:d69b  b0 74         bcs $d711
$14:d69d  2d 13 cf      and $cf13
$14:d6a0  71 bc         adc ($bc),y
$14:d6a2  88            dey
$14:d6a3  82 43 03      brl $d9e9
$14:d6a6  98            tya
$14:d6a7  78            sei
$14:d6a8  30 1e         bmi $d6c8
$14:d6aa  87 b0         sta [$b0]
$14:d6ac  2c 01 90      bit $9001
$14:d6af  14 24         trb $24
$14:d6b1  92 b2         sta ($b2)
$14:d6b3  01 39         ora ($39,x)
$14:d6b5  f0 09         beq $d6c0
$14:d6b7  84 fe         sty $fe
$14:d6b9  21 1f         and ($1f,x)
$14:d6bb  57 84         eor [$84],y
$14:d6bd  62 7f 3c      per $133f
$14:d6c0  8f c7 e1 f0   sta $f0e1c7
$14:d6c4  b8            clv
$14:d6c5  3b            tsc
$14:d6c6  8c 09 21      sty $2109
$14:d6c9  20 4f 5d      jsr $5d4f
$14:d6cc  c3 f1         cmp $f1,s
$14:d6ce  00 fc         brk #$fc
$14:d6d0  43 3f         eor $3f,s
$14:d6d2  90 0f         bcc $d6e3
$14:d6d4  a4 b3         ldy $b3
$14:d6d6  d1 f8         cmp ($f8),y
$14:d6d8  f8            sed
$14:d6d9  74 3c         stz $3c,x
$14:d6db  04 30         tsb $30
$14:d6dd  82 37 84      brl $5b17
$14:d6e0  92 10         sta ($10)
$14:d6e2  88            dey
$14:d6e3  04 41         tsb $41
$14:d6e5  3c a6 80      bit $80a6,x
$14:d6e8  25 84         and $84
$14:d6ea  3e 01 1f      rol $1f01,x
$14:d6ed  7a            ply
$14:d6ee  0d 7e 81      ora $817e
$14:d6f1  6f b8 5b ea   adc $ea5bb8
$14:d6f5  09 e5 60      ora #$60e5
$14:d6f8  84 82         sty $82
$14:d6fa  81 20         sta ($20,x)
$14:d6fc  b8            clv
$14:d6fd  40            rti
$14:d6fe  1f c1 80 3a   ora $3a80c1,x
$14:d702  05 01         ora $01
$14:d704  9c 16 8d      stz $8d16
$14:d707  a5 e3         lda $e3
$14:d709  d9 7d fc      cmp $fc7d,y
$14:d70c  e7 ef         sbc [$ef]
$14:d70e  f8            sed
$14:d70f  fc e8 40      jsr ($40e8,x)
$14:d712  75 17         adc $17,x
$14:d714  0d 46 d2      ora $d246
$14:d717  15 ec         ora $ec,x
$14:d719  81 7e         sta ($7e,x)
$14:d71b  60            rts
$14:d71c  57 f8         eor [$f8],y
$14:d71e  06 76         asl $76
$14:d720  c0 64 08      cpy #$0864
$14:d723  3b            tsc
$14:d724  d0 16         bne $d73c
$14:d726  20 b1 18      jsr $18b1
$14:d729  7c c2 5f      jmp ($5fc2,x)
$14:d72c  10 97         bpl $d6c5
$14:d72e  cc 1d 65      cpy $651d
$14:d731  10 73         bpl $d7a6
$14:d733  08            php
$14:d734  f8            sed
$14:d735  26 14         rol $14
$14:d737  08            php
$14:d738  85 00         sta $00
$14:d73a  92 0e         sta ($0e)
$14:d73c  30 a0         bmi $d6de
$14:d73e  68            pla
$14:d73f  22 1e 8f 85   jsl $858f1e
$14:d743  22 f9 f2 be   jsl $bef2f9
$14:d747  7f b3 d7 cc   adc $ccd7b3,x
$14:d74b  76 78         ror $78,x
$14:d74d  a0 35 0f      ldy #$0f35
$14:d750  45 52         eor $52
$14:d752  91 14         sta ($14),y
$14:d754  f9 41 3f      sbc $3f41,y
$14:d757  d0 1b         bne $d774
$14:d759  e4 07         cpx $07
$14:d75b  3d 61 d8      and $d861,x
$14:d75e  74 0d         stz $0d,x
$14:d760  f9 d0 80      sbc $80d0,y
$14:d763  1f f1 1d e9   ora $e91df1,x
$14:d767  ed 86 c2      sbc $c286
$14:d76a  d5 f8         cmp $f8,x
$14:d76c  f1 05         sbc ($05),y
$14:d76e  fe 6f fa      inc $fa6f,x
$14:d771  0c f0 ff      tsb $fff0
$14:d774  fc 1e 61      jsr ($611e,x)
$14:d777  bf f8 57 da   lda $da57f8,x
$14:d77b  01 10         ora ($10,x)
$14:d77d  69 81 fc      adc #$fc81
$14:d780  be 00 30      ldx $3000,y
$14:d783  f8            sed
$14:d784  38            sec
$14:d785  c3 a1         cmp $a1,s
$14:d787  20 88 58      jsr $5888
$14:d78a  1c 61 53      trb $5361
$14:d78d  e5 4c         sbc $4c
$14:d78f  f5 4f         sbc $4f,x
$14:d791  10 9a         bpl $d72d
$14:d793  eb            xba
$14:d794  2a            rol a
$14:d795  bc c8 8e      ldy $8ec8,x
$14:d798  21 e2         and ($e2,x)
$14:d79a  0e f0 9a      asl $9af0
$14:d79d  ff ea a0 01   sbc $01a0ea,x
$14:d7a1  a9 ff e6      lda #$e6ff
$14:d7a4  7f fb b8 00   adc $00b8fb,x
$14:d7a8  5f e0 f1 08   eor $08f1e0,x
$14:d7ac  ae 30 22      ldx $2230
$14:d7af  13 1d         ora ($1d,s),y
$14:d7b1  43 bc         eor $bc,s
$14:d7b3  1e e0 f7      asl $f7e0,x
$14:d7b6  07 88         ora [$88]
$14:d7b8  00 42         brk #$42
$14:d7ba  e6 20         inc $20
$14:d7bc  1a            inc a
$14:d7bd  b8            clv
$14:d7be  30 80         bmi $d740
$14:d7c0  c2 01         rep #$01
$14:d7c2  0f ec 2c 5e   ora $5e2cec
$14:d7c6  1f f8 7b 8c   ora $8c7bf8,x
$14:d7ca  3f 70 ff ac   and $acff70,x
$14:d7ce  37 f7         and [$f7],y
$14:d7d0  01 19         ora ($19,x)
$14:d7d2  82 fc 9a      brl $72d1
$14:d7d5  a0 42 06      ldy #$0642
$14:d7d8  a8            tay
$14:d7d9  43 60         eor $60,s
$14:d7db  50 18         bvc $d7f5
$14:d7dd  33 54         and ($54,s),y
$14:d7df  33 be         and ($be,s),y
$14:d7e1  28            plp
$14:d7e2  b7 82         lda [$82],y
$14:d7e4  f7 80         sbc [$80],y
$14:d7e6  dc 71 bf      jml [$bf71]
$14:d7e9  d4 2b         pei ($2b)
$14:d7eb  dc 02 7f      jml [$7f02]
$14:d7ee  00 ff         brk #$ff
$14:d7f0  c0 20 de      cpy #$de20
$14:d7f3  28            plp
$14:d7f4  47 86         eor [$86]
$14:d7f6  01 85         ora ($85,x)
$14:d7f8  83 71         sta $71,s
$14:d7fa  e0 d4 18      cpx #$18d4
$14:d7fd  26 02         rol $02
$14:d7ff  01 c0         ora ($c0,x)
$14:d801  80 58         bra $d85b
$14:d803  2e 58 ae      rol $ae58
$14:d806  64 53         stz $53
$14:d808  51 16         eor ($16),y
$14:d80a  99 73 be      sta $be73,y
$14:d80d  d8            cld
$14:d80e  cd b4 23      cmp $23b4
$14:d811  f1 00         sbc ($00),y
$14:d813  cf 58 38 98   cmp $983858
$14:d817  e9 14 5a      sbc #$5a14
$14:d81a  01 56         ora ($56,x)
$14:d81c  e0 73 b8      cpx #$b873
$14:d81f  10 ca         bpl $d7eb
$14:d821  04 28         tsb $28
$14:d823  bc 10 0b      ldy $0b10,x
$14:d826  62 b0 2f      per $07d9
$14:d829  d0 0a         bne $d835
$14:d82b  12 49         ora ($49)
$14:d82d  52 20         eor ($20)
$14:d82f  9c f5 00      stz $00f5
$14:d832  a4 7d         ldy $7d
$14:d834  45 eb         eor $eb
$14:d836  3f 6f 4d be   and $be4d6f,x
$14:d83a  e1 6f         sbc ($6f,x)
$14:d83c  98            tya
$14:d83d  3b            tsc
$14:d83e  c2 5f         rep #$5f
$14:d840  10 97         bpl $d7d9
$14:d842  cc 23 e4      cpy $e423
$14:d845  21 81         and ($81,x)
$14:d847  c0 2e 10      cpy #$102e
$14:d84a  09 83 f8      ora #$f883
$14:d84d  62 00 01      per $d950
$14:d850  6f 26 3f 3f   adc $3f3f26
$14:d854  7f f7 57 fd   adc $fd57f7,x
$14:d858  f2 ee         sbc ($ee)
$14:d85a  e7 7a         sbc [$7a]
$14:d85c  7d bc bc      adc $bcbc,x
$14:d85f  5e 3d 16      lsr $163d,x
$14:d862  0d 06 7e      ora $7e06
$14:d865  c1 ee         cmp ($ee,x)
$14:d867  80 7b         bra $d8e4
$14:d869  e0 1d c8      cpx #$c81d
$14:d86c  04 fa         tsb $fa
$14:d86e  01 78         ora ($78,x)
$14:d870  80 7a         bra $d8ec
$14:d872  20 1a 07      jsr $071a
$14:d875  70 3c         bvs $d8b3
$14:d877  85 e2         sta $e2
$14:d879  0f 70 7a 84   ora $847a70
$14:d87d  3c 70 0f      bit $0f70,x
$14:d880  c1 00         cmp ($00,x)
$14:d882  90 04         bcc $d888
$14:d884  00 20         brk #$20
$14:d886  05 00         ora $00
$14:d888  28            plp
$14:d889  02 cf         cop #$cf
$14:d88b  3d 7f f7      and $f77f,x
$14:d88e  d7 fd         cmp [$fd],y
$14:d890  d2 ee         cmp ($ee)
$14:d892  f7 7a         sbc [$7a],y
$14:d894  79 bc be      adc $bebc,y
$14:d897  5e 3e 1e      lsr $1e3e,x
$14:d89a  0a            asl a
$14:d89b  01 f4         ora ($f4,x)
$14:d89d  04 60         tsb $60
$14:d89f  21 0e         and ($0e,x)
$14:d8a1  f4 02 79      pea $7902
$14:d8a4  00 be         brk #$be
$14:d8a6  40            rti
$14:d8a7  3e 10 0a      rol $0a10,x
$14:d8aa  04 03         tsb $03
$14:d8ac  61 d0         adc ($d0,x)
$14:d8ae  37 87         and [$87],y
$14:d8b0  c0 d6 06      cpy #$06d6
$14:d8b3  e0 f8 54      cpx #$54f8
$14:d8b6  0e 01 10      asl $1001
$14:d8b9  39 87 42      and $4287,y
$14:d8bc  00 7f         brk #$7f
$14:d8be  03 a0         ora $a0,s
$14:d8c0  9c c7 a1      stz $a1c7
$14:d8c3  20 88 58      jsr $5888
$14:d8c6  0e 82 8f      asl $8f82
$14:d8c9  f4 f6 43      pea $43f6
$14:d8cc  61 6a         adc ($6a,x)
$14:d8ce  f0 87         beq $d857
$14:d8d0  be c2 00      ldx $00c2,y
$14:d8d3  b2 08         lda ($08)
$14:d8d5  2a            rol a
$14:d8d6  bc 20 2b      ldy $2b20,x
$14:d8d9  30 85         bmi $d860
$14:d8db  ad 81 f4      lda $f481
$14:d8de  2f a0 7d 84   and $847da0
$14:d8e2  36 05         rol $05,x
$14:d8e4  01 83         ora ($83,x)
$14:d8e6  3e c2 33      rol $33c2,x
$14:d8e9  07 85         ora [$85]
$14:d8eb  7d 3f 70      adc $703f,x
$14:d8ee  74 f0         stz $f0,x
$14:d8f0  ff ff e9 e3   sbc $e3e9ff,x
$14:d8f4  83 fc         sta $fc,s
$14:d8f6  3e 90 16      rol $1690,x
$14:d8f9  a0 b6 15      ldy #$15b6
$14:d8fc  88            dey
$14:d8fd  16 bb         asl $bb,x
$14:d8ff  df de c6 d8   cmp $d8c6de,x
$14:d903  36 c2         rol $c2,x
$14:d905  de f0 96      dec $96f0,x
$14:d908  3c 63 64      bit $6463,x
$14:d90b  5c cf ad f7   jml $f7adcf
$14:d90f  f7 80         sbc [$80],y
$14:d911  40            rti
$14:d912  f4 9f 7c      pea $7c9f
$14:d915  43 19         eor $19,s
$14:d917  31 01         and ($01),y
$14:d919  d5 46         cmp $46,x
$14:d91b  c1 d0         cmp ($d0,x)
$14:d91d  b7 f7         lda [$f7],y
$14:d91f  fc 10 16      jsr ($1610,x)
$14:d922  b3 d8         lda ($d8,s),y
$14:d924  31 f6         and ($f6),y
$14:d926  fc 07 81      jsr ($8107,x)
$14:d929  c9 39 f8      cmp #$f839
$14:d92c  07 f6         ora [$f6]
$14:d92e  05 f8         ora $f8
$14:d930  83 df         sta $df,s
$14:d932  e0 05 50      cpx #$5005
$14:d935  9f b0 88 7a   sta $7a88b0,x
$14:d939  30 08         bmi $d943
$14:d93b  13 78         ora ($78,s),y
$14:d93d  13 d1         ora ($d1,s),y
$14:d93f  4a            lsr a
$14:d940  e8            inx
$14:d941  65 ab         adc $ab
$14:d943  16 6f         asl $6f,x
$14:d945  c7 32         cmp [$32]
$14:d947  61 bc         adc ($bc,x)
$14:d949  a0 7e 20      ldy #$207e
$14:d94c  04 31         tsb $31
$14:d94e  80 48         bra $d998
$14:d950  3f 92 0b c4   and $c40b92,x
$14:d954  00 f2         brk #$f2
$14:d956  13 08         ora ($08,s),y
$14:d958  05 01         ora $01
$14:d95a  3c 97 d8      bit $d897,x
$14:d95d  07 5a         ora [$5a]
$14:d95f  53 ee         eor ($ee,s),y
$14:d961  80 ee         bra $d951
$14:d963  e0 18 3b      cpx #$3b18
$14:d966  65 b6         adc $b6
$14:d968  50 f9         bvc $d963
$14:d96a  07 c8         ora [$c8]
$14:d96c  71 a0         adc ($a0),y
$14:d96e  12 89         ora ($89)
$14:d970  4c 02 23      jmp $2302
$14:d973  00 aa         brk #$aa
$14:d975  7b            tdc
$14:d976  af 9a a8 80   lda $80a89a
$14:d97a  21 2f         and ($2f,x)
$14:d97c  d0 0a         bne $d988
$14:d97e  12 c9         ora ($c9)
$14:d980  56 20         lsr $20,x
$14:d982  bc f5 77      ldy $77f5,x
$14:d985  b7 b8         lda [$b8],y
$14:d987  00 20         brk #$20
$14:d989  80 3b         bra $d9c6
$14:d98b  fd fd 9b      sbc $9bfd,x
$14:d98e  2c 07 32      bit $3207
$14:d991  67 f7         adc [$f7]
$14:d993  ff 85 02 c1   sbc $c10285,x
$14:d997  ff 8f 85 07   sbc $07858f,x
$14:d99b  8d ff bf      sta $bfff
$14:d99e  85 04         sta $04
$14:d9a0  41 4f         eor ($4f,x)
$14:d9a2  e0 82 c3      cpx #$c382
$14:d9a5  26 51         rol $51
$14:d9a7  1e 45 1f      asl $1f45,x
$14:d9aa  ff 80 17 06   sbc $061780,x
$14:d9ae  02 01         cop #$01
$14:d9b0  0e 87 3f      asl $3f87
$14:d9b3  82 07 0f      brl $e8bd
$14:d9b6  87 cf         sta [$cf]
$14:d9b8  e7 e1         sbc [$e1]
$14:d9ba  e5 f8         sbc $f8
$14:d9bc  8b            phb
$14:d9bd  86 41         stx $41
$14:d9bf  30 d8         bmi $d999
$14:d9c1  f0 65         beq $da28
$14:d9c3  9f 0d d5 f7   sta $f7d50d,x
$14:d9c7  87 3c         sta [$3c]
$14:d9c9  b8            clv
$14:d9ca  43 a1         eor $a1,s
$14:d9cc  90 27         bcc $d9f5
$14:d9ce  f0 70         beq $da40
$14:d9d0  3e 1f e1      rol $e11f,x
$14:d9d3  25 bf         and $bf
$14:d9d5  87 01         sta [$01]
$14:d9d7  80 e0         bra $d9b9
$14:d9d9  58            cli
$14:d9da  36 19         rol $19,x
$14:d9dc  3a            dec a
$14:d9dd  fd b2 19      sbc $19b2,x
$14:d9e0  2d 86 1b      and $1b86
$14:d9e3  d0 c0         bne $d9a5
$14:d9e5  06 10         asl $10
$14:d9e7  f0 7f         beq $da68
$14:d9e9  fe 68 a1      inc $a168,x
$14:d9ec  7f 24 0a 05   adc $050a24,x
$14:d9f0  03 96         ora $96,s
$14:d9f2  6a            ror a
$14:d9f3  32 1c         and ($1c)
$14:d9f5  07 f3         ora [$f3]
$14:d9f7  c0 60 71      cpy #$7160
$14:d9fa  f9 f8 7d      sbc $7df8,y
$14:d9fd  1f c8 ed 0e   ora $0eedc8,x
$14:da01  84 e3         sty $e3
$14:da03  e1 0c         sbc ($0c,x)
$14:da05  be 40 a3      ldx $a340,y
$14:da08  ef e5 e0 78   sbc $78e0e5
$14:da0c  3f 9f cf f7   and $f7cf9f,x
$14:da10  fb            xce
$14:da11  fa            plx
$14:da12  ac 75 fa      ldy $fa75
$14:da15  c4 2c         cpy $2c
$14:da17  1f 47 f5 78   ora $78f547,x
$14:da1b  3e 1f 8f      rol $8f1f,x
$14:da1e  e0 03 5f      cpx #$5f03
$14:da21  be df 88      ldx $88df,y
$14:da24  0c 02 0f      tsb $0f02
$14:da27  03 85         ora $85,s
$14:da29  41 81         eor ($81,x)
$14:da2b  d9 01 87      cmp $8701,y
$14:da2e  93 82         sta ($82,s),y
$14:da30  6d bb ff      adc $ffbb
$14:da33  ff e7 9f f8   sbc $f89fe7,x
$14:da37  32 30         and ($30)
$14:da39  21 d2         and ($d2,x)
$14:da3b  9e 37 52      stz $5237,x
$14:da3e  47 00         eor [$00]
$14:da40  ff df 0c 92   sbc $920cdf,x
$14:da44  ac 25 70      ldy $7025
$14:da47  57 fc         eor [$fc],y
$14:da49  15 3f         ora $3f,x
$14:da4b  26 62         rol $62
$14:da4d  fb            xce
$14:da4e  e4 8f         cpx $8f
$14:da50  5d e1 f9      eor $f9e1,x
$14:da53  18            clc
$14:da54  71 40         adc ($40),y
$14:da56  7f f8 0f ff   adc $ff0ff8,x
$14:da5a  e3 ff         sbc $ff,s
$14:da5c  fe 24 49      inc $4924,x
$14:da5f  bd 2e 3f      lda $3f2e,x
$14:da62  aa            tax
$14:da63  96 3e         stx $3e,y
$14:da65  09 03 38      ora #$3803
$14:da68  3f ff f8 66   and $66f8ff,x
$14:da6c  43 fc         eor $fc,s
$14:da6e  40            rti
$14:da6f  2f f8 0b 1d   and $1d0bf8
$14:da73  d1 21         cmp ($21),y
$14:da75  24 f1         bit $f1
$14:da77  32 81         and ($81)
$14:da79  be 3f 10      ldx $103f,y
$14:da7c  0e 2c 1e      asl $1e2c
$14:da7f  65 3d         adc $3d
$14:da81  5a            phy
$14:da82  1a            inc a
$14:da83  5c 61 df f9   jml $f9df61
$14:da87  ff fe f1 ff   sbc $fff1fe,x
$14:da8b  e0 23 ae      cpx #$ae23
$14:da8e  3f 20 b7 7a   and $7ab720,x
$14:da92  1a            inc a
$14:da93  10 63         bpl $daf8
$14:da95  06 68         asl $68
$14:da97  44 52 e3      mvp $e3,$52
$14:da9a  0c 33 1f      tsb $1f33
$14:da9d  7f ff 0b ff   adc $ff0bff,x
$14:daa1  d8            cld
$14:daa2  33 f1         and ($f1,s),y
$14:daa4  cf 19 0b 09   cmp $090b19
$14:daa8  c5 c6         cmp $c6
$14:daaa  1c 01 14      trb $1401
$14:daad  f3 c3         sbc ($c3,s),y
$14:daaf  61 f0         adc ($f0,x)
$14:dab1  47 df         eor [$df]
$14:dab3  fd 23 9f      sbc $9f23,x
$14:dab6  d0 53         bne $db0b
$14:dab8  61 ff         adc ($ff,x)
$14:daba  cc 67 e0      cpy $e067
$14:dabd  d0 7f         bne $db3e
$14:dabf  8f c7 31 f8   sta $f831c7
$14:dac3  87 b3         sta [$b3]
$14:dac5  04 c6         tsb $c6
$14:dac7  0c 50 b0      tsb $b050
$14:daca  19 05 8e      ora $8e05,y
$14:dacd  10 74         bpl $db43
$14:dacf  b8            clv
$14:dad0  e1 b0         sbc ($b0,x)
$14:dad2  3e 3f 07      rol $073f,x
$14:dad5  e7 f1         sbc [$f1]
$14:dad7  3e ff 0f      rol $0fff,x
$14:dada  43 07         eor $07,s
$14:dadc  ff 8c 46 03   sbc $03468c,x
$14:dae0  81 7f         sta ($7f,x)
$14:dae2  ff 87 80 96   sbc $968087,x
$14:dae6  10 16         bpl $dafe
$14:dae8  01 f9         ora ($f9,x)
$14:daea  cc 03 0e      cpy $0e03
$14:daed  80 56         bra $db45
$14:daef  30 1d         bmi $db0e
$14:daf1  19 0d ca      ora $ca0d,y
$14:daf4  19 8c c1      ora $c18c,y
$14:daf7  fc 3e 1f      jsr ($1f3e,x)
$14:dafa  cf e4 fd 92   cmp $92fde4
$14:dafe  00 c1         brk #$c1
$14:db00  79 91 7c      adc $7c91,y
$14:db03  07 a1         ora [$a1]
$14:db05  03 75         ora $75,s
$14:db07  14 46         trb $46
$14:db09  cd 66 ec      cmp $ec66
$14:db0c  f7 df         sbc [$df],y
$14:db0e  c1 86         cmp ($86,x)
$14:db10  bf f8 27 f7   lda $f727f8,x
$14:db14  08            php
$14:db15  7c 72 07      jmp ($0772,x)
$14:db18  ee ff e6      inc $e6ff
$14:db1b  7f f2 07 32   adc $3207f2,x
$14:db1f  aa            tax
$14:db20  8a            txa
$14:db21  07 00         ora [$00]
$14:db23  58            cli
$14:db24  07 0f         ora [$0f]
$14:db26  81 e2         sta ($e2,x)
$14:db28  f0 d9         beq $db03
$14:db2a  7c 54 ce      jmp ($ce54,x)
$14:db2d  04 c6         tsb $c6
$14:db2f  63 ae         adc $ae,s
$14:db31  3f 19 f8 03   and $03f819,x
$14:db35  c0 1e 03      cpy #$031e
$14:db38  f0 73         beq $dbad
$14:db3a  bf ea 90 cc   lda $cc90ea,x
$14:db3e  5f 73 f7 fa   eor $faf773,x
$14:db42  c7 9e         cmp [$9e]
$14:db44  f9 83 e7      sbc $e783,y
$14:db47  40            rti
$14:db48  61 d0         adc ($d0,x)
$14:db4a  1f 7f 82 ab   ora $ab827f,x
$14:db4e  c4 79         cpy $79
$14:db50  93 81         sta ($81,s),y
$14:db52  98            tya
$14:db53  e1 3b         sbc ($3b,x)
$14:db55  ff ac 07 01   sbc $0107ac,x
$14:db59  80 e0         bra $db3b
$14:db5b  50 34         bvc $db91
$14:db5d  14 0d         trb $0d
$14:db5f  ff 3e 7f b0   sbc $b07f3e,x
$14:db63  9b            txy
$14:db64  c0 e3 ee      cpy #$eee3
$14:db67  f4 e0 78      pea $78e0
$14:db6a  15 20         ora $20,x
$14:db6c  a9 0e 7a      lda #$7a0e
$14:db6f  a8            tay
$14:db70  63 b0         adc $b0,s
$14:db72  c8            iny
$14:db73  5c 62 6d 10   jml $106d62
$14:db77  9c 5c 20      stz $205c
$14:db7a  70 32         bvs $dbae
$14:db7c  f8            sed
$14:db7d  50 33         bvc $dbb2
$14:db7f  d0 cf         bne $db50
$14:db81  63 f4         adc $f4,s
$14:db83  20 f1 f8      jsr $f8f1
$14:db86  7c fe 1f      jmp ($1ffe,x)
$14:db89  7f fe 3b 83   adc $833bfe,x
$14:db8d  ff e1 ff fc   sbc $fcffe1,x
$14:db91  ff f1 38 65   sbc $6538f1,x
$14:db95  f6 07         inc $07,x
$14:db97  b3 98         lda ($98,s),y
$14:db99  59 bc 11      eor $11bc,y
$14:db9c  9f c6 1b fd   sta $fd1bc6,x
$14:dba0  21 9f         and ($9f,x)
$14:dba2  cd 3e ea      cmp $ea3e
$14:dba5  a2 05 81      ldx #$8105
$14:dba8  85 15         sta $15
$14:dbaa  21 08         and ($08,x)
$14:dbac  65 04         adc $04
$14:dbae  03 cb         ora $cb,s
$14:dbb0  99 a6 ff      sta $ffa6,y
$14:dbb3  b3 30         lda ($30,s),y
$14:dbb5  7b            tdc
$14:dbb6  14 06         trb $06
$14:dbb8  5b            tcd
$14:dbb9  0c eb 71      tsb $71eb
$14:dbbc  a6 6a         ldx $6a
$14:dbbe  a1 6f         lda ($6f,x)
$14:dbc0  b0 b4         bcs $db76
$14:dbc2  27 22         and [$22]
$14:dbc4  81 b1         sta ($b1,x)
$14:dbc6  d8            cld
$14:dbc7  7e 5f 1a      ror $1a5f,x
$14:dbca  4f a3 15 fa   eor $fa15a3
$14:dbce  ba            tsx
$14:dbcf  e3 73         sbc $73,s
$14:dbd1  50 6b         bvc $dc3e
$14:dbd3  7d 87 a9      adc $a987,x
$14:dbd6  f3 cf         sbc ($cf,s),y
$14:dbd8  ff e1 ff f1   sbc $f1ffe1,x
$14:dbdc  f0 7f         beq $dc5d
$14:dbde  4c 02 85      jmp $8502
$14:dbe1  0c f2 00      tsb $00f2
$14:dbe4  63 1f         adc $1f,s
$14:dbe6  be 6f f6      ldx $f66f,y
$14:dbe9  67 cf         adc [$cf]
$14:dbeb  fa            plx
$14:dbec  42 e1         wdm #$e1
$14:dbee  70 0b         bvs $dbfb
$14:dbf0  0d 82 a9      ora $a982
$14:dbf3  dc ef d8      jml [$d8ef]
$14:dbf6  44 e0 a0      mvp $a0,$e0
$14:dbf9  63 f8         adc $f8,s
$14:dbfb  48            pha
$14:dbfc  ff f8 05 00   sbc $0005f8,x
$14:dc00  7e 2f 9f      ror $9f2f,x
$14:dc03  fc 17 fe      jsr ($fe17,x)
$14:dc06  45 c1         eor $c1
$14:dc08  e5 43         sbc $43
$14:dc0a  b3 91         lda ($91,s),y
$14:dc0c  d9 64 cb      cmp $cb64,y
$14:dc0f  1b            tcs
$14:dc10  ed b0 2b      sbc $2bb0
$14:dc13  c1 40         cmp ($40,x)
$14:dc15  7f 1f ff bb   adc $bbff1f,x
$14:dc19  ff df ff dc   sbc $dcffdf,x
$14:dc1d  ff ff bb dd   sbc $ddbbff,x
$14:dc21  5a            phy
$14:dc22  df 22 e2 64   cmp $64e222,x
$14:dc26  62 35 fb      per $d75e
$14:dc29  fa            plx
$14:dc2a  c4 3c         cpy $3c
$14:dc2c  ff 8c cf 86   sbc $86cf8c,x
$14:dc30  7e a0 36      ror $36a0,x
$14:dc33  48            pha
$14:dc34  63 ff         adc $ff,s
$14:dc36  ed f0 0c      sbc $0cf0
$14:dc39  81 84         sta ($84,x)
$14:dc3b  30 17         bmi $dc54
$14:dc3d  fb            xce
$14:dc3e  3b            tsc
$14:dc3f  28            plp
$14:dc40  55 c3         eor $c3,x
$14:dc42  ff 85 ff 23   sbc $23ff85,x
$14:dc46  1e 7e 74      asl $747e,x
$14:dc49  c5 40         cmp $40
$14:dc4b  ea            nop
$14:dc4c  05 b8         ora $b8
$14:dc4e  7f e3 bf ef   adc $efbfe3,x
$14:dc52  7f fc 7c 13   adc $137cfc,x
$14:dc56  0f ff 1e 71   ora $711eff
$14:dc5a  b1 87         lda ($87),y
$14:dc5c  53 d5         eor ($d5,s),y
$14:dc5e  a2 ff cc      ldx #$ccff
$14:dc61  3f fe 4f 3f   and $3f4ffe,x
$14:dc65  c9 c7 ea      cmp #$eac7
$14:dc68  19 09 7f      ora $7f09,y
$14:dc6b  3f 4f 0f e0   and $e00f4f,x
$14:dc6f  47 2f         eor [$2f]
$14:dc71  30 63         bmi $dcd6
$14:dc73  68            pla
$14:dc74  70 3f         bvs $dcb5
$14:dc76  fe 0f f8      inc $f80f,x
$14:dc79  4c 3e 04      jmp $043e
$14:dc7c  61 f1         adc ($f1,x)
$14:dc7e  a8            tay
$14:dc7f  07 df         ora [$df]
$14:dc81  d0 ef         bne $dc72
$14:dc83  f8            sed
$14:dc84  23 f2         and $f2,s
$14:dc86  0b            phd
$14:dc87  fd 03 b1      sbc $b103,x
$14:dc8a  c0 db 61      cpy #$61db
$14:dc8d  b9 f0 f9      lda $f9f0,y
$14:dc90  84 fd         sty $fd
$14:dc92  d2 0e         cmp ($0e)
$14:dc94  90 31         bcc $dcc7
$14:dc96  06 fd         asl $fd
$14:dc98  d0 37         bne $dcd1
$14:dc9a  9f f9 1c 08   sta $081cf9,x
$14:dc9e  21 4a         and ($4a,x)
$14:dca0  c4 e8         cpy $e8
$14:dca2  e8            inx
$14:dca3  1c c9 87      trb $87c9
$14:dca6  96 33         stx $33,y
$14:dca8  71 87         adc ($87),y
$14:dcaa  40            rti
$14:dcab  e0 1f ef      cpx #$ef1f
$14:dcae  f4 7f c0      pea $c07f
$14:dcb1  15 04         ora $04,x
$14:dcb3  01 3b         ora ($3b,x)
$14:dcb5  41 00         eor ($00,x)
$14:dcb7  50 1f         bvc $dcd8
$14:dcb9  fc 7d d4      jsr ($d47d,x)
$14:dcbc  18            clc
$14:dcbd  0c dc 02      tsb $02dc
$14:dcc0  05 02         ora $02
$14:dcc2  c2 7f         rep #$7f
$14:dcc4  3f 7f 8c f4   and $f48c7f,x
$14:dcc8  7a            ply
$14:dcc9  63 07         adc $07,s
$14:dccb  ed 46 d0      sbc $d046
$14:dcce  05 fd         ora $fd
$14:dcd0  ff c0 ff f0   sbc $f0ffc0,x
$14:dcd4  7f ff 87 fe   adc $fe87ff,x
$14:dcd8  f7 0f         sbc [$0f],y
$14:dcda  27 fe         and [$fe]
$14:dcdc  01 df         ora ($df,x)
$14:dcde  d0 50         bne $dd30
$14:dce0  3e 30 ee      rol $ee30,x
$14:dce3  7c c2 71      jmp ($71c2,x)
$14:dce6  c0 f8 40      cpy #$40f8
$14:dce9  31 f8         and ($f8),y
$14:dceb  08            php
$14:dcec  0f 00 86 0c   ora $0c8600
$14:dcf0  08            php
$14:dcf1  75 83         adc $83,x
$14:dcf3  a4 2f         ldy $2f
$14:dcf5  7f 8e 7f 02   adc $027f8e,x
$14:dcf9  79 03 dc      adc $dc03,y
$14:dcfc  41 f9         eor ($f9,x)
$14:dcfe  f0 03         beq $dd03
$14:dd00  c8            iny
$14:dd01  5c 2e 1b f9   jml $f91b2e
$14:dd05  fa            plx
$14:dd06  9c 19 a0      stz $a019
$14:dd09  26 6c         rol $6c
$14:dd0b  79 b0 79      adc $79b0,y
$14:dd0e  f3 fd         sbc ($fd,s),y
$14:dd10  05 fe         ora $fe
$14:dd12  0f f8 9e f0   ora $f09ef8
$14:dd16  3e 50 0e      rol $0e50,x
$14:dd19  0c 06 1f      tsb $1f06
$14:dd1c  0f 51 80 7e   ora $7e8051
$14:dd20  10 a0         bpl $dcc2
$14:dd22  47 01         eor [$01]
$14:dd24  f8            sed
$14:dd25  73 3e         adc ($3e,s),y
$14:dd27  72 cf         adc ($cf)
$14:dd29  9f 0e 79 e3   sta $e3790e,x
$14:dd2d  8e 46 a0      stx $a046
$14:dd30  b8            clv
$14:dd31  7c 07 c3      jmp ($c307,x)
$14:dd34  e1 fc         sbc ($fc,x)
$14:dd36  fe 3f a1      inc $a13f,x
$14:dd39  96 10         stx $10,y
$14:dd3b  f5 20         sbc $20,x
$14:dd3d  f1 e7         sbc ($e7),y
$14:dd3f  ff c8 1a 3c   sbc $3c1ac8,x
$14:dd43  38            sec
$14:dd44  33 ef         and ($ef,s),y
$14:dd46  dc 1f fc      jml [$fc1f]
$14:dd49  8b            phb
$14:dd4a  00 68         brk #$68
$14:dd4c  40            rti
$14:dd4d  07 82         ora [$82]
$14:dd4f  40            rti
$14:dd50  bb            tyx
$14:dd51  e6 0e         inc $0e
$14:dd53  0b            phd
$14:dd54  fa            plx
$14:dd55  1c 87 ca      trb $ca87
$14:dd58  1d 8c 52      ora $528c,x
$14:dd5b  00 78         brk #$78
$14:dd5d  07 8e         ora [$8e]
$14:dd5f  3a            dec a
$14:dd60  32 01         and ($01)
$14:dd62  dc bd dc      jml [$dcbd]
$14:dd65  e9 8e 17      sbc #$178e
$14:dd68  0d 30 98      ora $9830
$14:dd6b  5c dd 60 3f   jml $3f60dd
$14:dd6f  31 d1         and ($d1),y
$14:dd71  5e 1d c0      lsr $c01d,x
$14:dd74  40            rti
$14:dd75  7b            tdc
$14:dd76  0c 6b e3      tsb $e36b
$14:dd79  33 fd         and ($fd,s),y
$14:dd7b  c2 3b         rep #$3b
$14:dd7d  de 2f d7      dec $d72f,x
$14:dd80  f7 00         sbc [$00],y
$14:dd82  cb            wai
$14:dd83  01 e0         ora ($e0,x)
$14:dd85  87 82         sta [$82]
$14:dd87  1d ff 6f      ora $6fff,x
$14:dd8a  81 96         sta ($96,x)
$14:dd8c  21 d0         and ($d0,x)
$14:dd8e  fb            xce
$14:dd8f  3f e3 01 47   and $4701e3,x
$14:dd93  dd 60 28      cmp $2860,x
$14:dd96  3c 1c ed      bit $ed1c,x
$14:dd99  f8            sed
$14:dd9a  2a            rol a
$14:dd9b  00 c1         brk #$c1
$14:dd9d  70 0f         bvs $ddae
$14:dd9f  e3 fe         sbc $fe,s
$14:dda1  29 09 f1      and #$f109
$14:dda4  01 69         ora ($69,x)
$14:dda6  58            cli
$14:dda7  ea            nop
$14:dda8  cd e7 b9      cmp $b9e7
$14:ddab  df b3 de 27   cmp $27deb3,x
$14:ddaf  ee d0 1f      inc $1fd0
$14:ddb2  9f c7 ff 86   sta $86ffc7,x
$14:ddb6  ff c8 3f f8   sbc $f83fc8,x
$14:ddba  02 03         cop #$03
$14:ddbc  e0 2f f1      cpx #$f12f
$14:ddbf  8f 3f 06 7f   sta $7f063f
$14:ddc3  b7 bf         lda [$bf],y
$14:ddc5  b6 02         ldx $02,y
$14:ddc7  7b            tdc
$14:ddc8  c2 06         rep #$06
$14:ddca  07 3d         ora [$3d]
$14:ddcc  7c 2f fc      jmp ($fc2f,x)
$14:ddcf  76 85         ror $85,x
$14:ddd1  f7 fc         sbc [$fc],y
$14:ddd3  27 0c         and [$0c]
$14:ddd5  1f fe 63 cf   ora $cf63fe,x
$14:ddd9  18            clc
$14:ddda  86 7e         stx $7e
$14:dddc  01 c3         ora ($c3,x)
$14:ddde  7f 7e 73 01   adc $01737e,x
$14:dde2  c3 e1         cmp $e1,s
$14:dde4  84 82         sty $82
$14:dde6  59 3f 83      eor $833f,y
$14:dde9  c6 39         dec $39
$14:ddeb  1c fe dc      trb $dcfe
$14:ddee  ed d8 0c      sbc $0cd8
$14:ddf1  50 9e         bvc $dd91
$14:ddf3  3b            tsc
$14:ddf4  05 b0         ora $b0
$14:ddf6  1e 0f fc      asl $fc0f,x
$14:ddf9  c3 ff         cmp $ff,s
$14:ddfb  04 76         tsb $76
$14:ddfd  0f 7f c1 3e   ora $3ec17f
$14:de01  e0 de 30      cpx #$30de
$14:de04  9e 78 be      stz $be78,x
$14:de07  a2 df f3      ldx #$f3df
$14:de0a  fe 47 c8      inc $c847,x
$14:de0d  e1 00         sbc ($00,x)
$14:de0f  75 94         adc $94,x
$14:de11  0f ff 08 ff   ora $ff08ff
$14:de15  c4 1d         cpy $1d
$14:de17  46 ed         lsr $ed
$14:de19  09 06 03      ora #$0306
$14:de1c  07 03         ora [$03]
$14:de1e  f8            sed
$14:de1f  7f e1 e7 30   adc $30e7e1,x
$14:de23  34 a0         bit $a0,x
$14:de25  f8            sed
$14:de26  53 e0         eor ($e0,s),y
$14:de28  78            sei
$14:de29  57 51         eor [$51],y
$14:de2b  c1 a0         cmp ($a0,x)
$14:de2d  df 2f 9c 73   cmp $739c2f,x
$14:de31  f9 e3 8f      sbc $8fe3,y
$14:de34  86 40         stx $40
$14:de36  7a            ply
$14:de37  09 92 fc      ora #$fc92
$14:de3a  ff e1 86 21   sbc $2186e1,x
$14:de3e  4d 1a 64      eor $641a
$14:de41  e2 17         sep #$17
$14:de43  0e 65 f3      asl $f365
$14:de46  63 cf         adc $cf,s
$14:de48  96 4c         stx $4c,y
$14:de4a  ef 7f cc 3d   sbc $3dcc7f
$14:de4e  ff e1 0f 1e   sbc $1e0fe1,x
$14:de52  86 3d         stx $3d
$14:de54  44 6d 85      mvp $85,$6d
$14:de57  4c 8c 46      jmp $468c
$14:de5a  3f 0f 87 f8   and $f8870f,x
$14:de5e  3c 13 0f      bit $0f13,x
$14:de61  86 0e         stx $0e
$14:de63  fe 51 09      inc $0951,x
$14:de66  9f f1 76 04   sta $0476f1,x
$14:de6a  70 39         bvs $dea5
$14:de6c  84 7c         sty $7c
$14:de6e  e8            inx
$14:de6f  0a            asl a
$14:de70  47 f9         eor [$f9]
$14:de72  a3 83         lda $83,s
$14:de74  ff 99 ff c9   sbc $c9ff99,x
$14:de78  27 98         and [$98]
$14:de7a  0c 01 04      tsb $0401
$14:de7d  07 a1         ora [$a1]
$14:de7f  3f e0 29 53   and $5329e0,x
$14:de83  87 ff         sta [$ff]
$14:de85  1f 82 95 17   ora $179582,x
$14:de89  e0 cd         cpx #$cd
$14:de8b  09 84 1e      ora #$1e84
$14:de8e  09 01 d8      ora #$d801
$14:de91  7c 3e 90      jmp ($903e,x)
$14:de94  cf dc 1c ba   cmp $ba1cdc
$14:de98  9f 8f ff f9   sta $f9ff8f,x
$14:de9c  c8            iny
$14:de9d  29 84 52      and #$5284
$14:dea0  46 fe         lsr $fe
$14:dea2  71 0e         adc ($0e),y
$14:dea4  be 6a bb      ldx $bb6a,y
$14:dea7  6a            ror a
$14:dea8  58            cli
$14:dea9  b8            clv
$14:deaa  7f d3 e1 fd   adc $fde1d3,x
$14:deae  17 1f         ora [$1f],y
$14:deb0  f2 04         sbc ($04)
$14:deb2  1b            tcs
$14:deb3  0f a4 3e e7   ora $e73ea4
$14:deb7  64 c1         stz $c1
$14:deb9  7f 63 3e 24   adc $243e63,x
$14:debd  d1 40         cmp ($40),y
$14:debf  54 42 1c      mvn $1c,$42
$14:dec2  0f 7b e8 0d   ora $0de87b
$14:dec6  43 cc         eor $cc,s
$14:dec8  80 5e         bra $df28
$14:deca  e0 1b         cpx #$1b
$14:decc  e8            inx
$14:decd  07 b2         ora [$b2]
$14:decf  01 9f         ora ($9f,x)
$14:ded1  80 4d         bra $df20
$14:ded3  60            rts
$14:ded4  17 98         ora [$98],y
$14:ded6  07 4a         ora [$4a]
$14:ded8  00 fb         brk #$fb
$14:deda  03 fe         ora $fe,s
$14:dedc  72 e2         adc ($e2)
$14:dede  95 49         sta $49,x
$14:dee0  1e ce 99      asl $99ce,x
$14:dee3  ec 88 fe      cpx $fe88
$14:dee6  e0 92         cpx #$92
$14:dee8  ec 8f 66      cpx $668f
$14:deeb  4d b6 84      eor $84b6
$14:deee  9f fa 09 fb   sta $fb09fa,x
$14:def2  ac e9 a6      ldy $a6e9
$14:def5  1c fa 16      trb $16fa
$14:def8  f6 19         inc $19,x
$14:defa  f3 94         sbc ($94,s),y
$14:defc  f5 b8         sbc $b8,x
$14:defe  13 fc         ora ($fc,s),y
$14:df00  5d d0 ff      eor $ffd0,x
$14:df03  c7 e0         cmp [$e0]
$14:df05  80 ff         bra $df06
$14:df07  a2 1e         ldx #$1e
$14:df09  f3 f1         sbc ($f1,s),y
$14:df0b  48            pha
$14:df0c  bb            tyx
$14:df0d  a7 e2         lda [$e2]
$14:df0f  3f f2 b4 05   and $05b4f2,x
$14:df13  21 f7         and ($f7,x)
$14:df15  35 0e         and $0e,x
$14:df17  07 fe         ora [$fe]
$14:df19  b7 0f         lda [$0f],y
$14:df1b  b4 3f         ldy $3f,x
$14:df1d  e1 0f         sbc ($0f,x)
$14:df1f  35 1b         and $1b,x
$14:df21  fe 5f 81      inc $815f,x
$14:df24  c7 fc         cmp [$fc]
$14:df26  7c 3f ff      jmp ($ff3f,x)
$14:df29  ef ff 0f fe   sbc $fe0fff
$14:df2d  b3 0e         lda ($0e,s),y
$14:df2f  e4 fe         cpx $fe
$14:df31  62 15 07      per $e649
$14:df34  ff 38 27 fd   sbc $fd2738,x
$14:df38  02 fe         cop #$fe
$14:df3a  41 1c         eor ($1c,x)
$14:df3c  14 63         trb $63
$14:df3e  23 fa         and $fa,s
$14:df40  7f 20 1f b8   adc $b81f20,x
$14:df44  1f de 0f 1d   ora $1d0fde,x
$14:df48  8f d8 2f ee   sta $ee2fd8
$14:df4c  04 78         tsb $78
$14:df4e  84 13         sty $13
$14:df50  ff 08 ff f8   sbc $f8ff08,x
$14:df54  3f f8 06 f0   and $f006f8,x
$14:df58  fc 20 18      jsr ($1820,x)
$14:df5b  f8            sed
$14:df5c  7f cf e1 fc   adc $fce1cf,x
$14:df60  fe 73 c9      inc $c973,x
$14:df63  42 e0         wdm #$e0
$14:df65  27 f0         and [$f0]
$14:df67  5c 10 02 f1   jml $f10210
$14:df6b  07 02         ora [$02]
$14:df6d  0b            phd
$14:df6e  ca            dex
$14:df6f  7f 00 e7 f0   adc $f0e700,x
$14:df73  3c f6 0a      bit $0af6,x
$14:df76  9c c3 19      stz $19c3
$14:df79  bc d9 e3      ldy $e3d9,x
$14:df7c  da            phx
$14:df7d  e1 c0         sbc ($c0,x)
$14:df7f  ff 84 c2 71   sbc $71c284,x
$14:df83  ff ce 7f f9   sbc $f97fce,x
$14:df87  9f fa 1f fe   sta $fe1ffa,x
$14:df8b  80 de         bra $df6b
$14:df8d  98            tya
$14:df8e  fc 03 cf      jsr ($cf03,x)
$14:df91  e0 9c         cpx #$9c
$14:df93  7e 1c 10      ror $101c,x
$14:df96  13 08         ora ($08,s),y
$14:df98  c7 fe         cmp [$fe]
$14:df9a  0e 2e b1      asl $b12e
$14:df9d  79 34 35      adc $3534,y
$14:dfa0  9d ed ff      sta $ffed,x
$14:dfa3  18            clc
$14:dfa4  4f e6 31 e1   eor $e131e6
$14:dfa8  49 80 3e      eor #$3e80
$14:dfab  60            rts
$14:dfac  c0 f1         cpy #$f1
$14:dfae  b0 e4         bcs $df94
$14:dfb0  aa            tax
$14:dfb1  74 ef         stz $ef,x
$14:dfb3  67 8e         adc [$8e]
$14:dfb5  3f fe f1 a0   and $a0f1fe,x
$14:dfb9  03 f9         ora $f9,s
$14:dfbb  22 8d 56 f8   jsl $f8568d
$14:dfbf  80 e0         bra $dfa1
$14:dfc1  df ff e3 e7   cmp $e7e3ff,x
$14:dfc5  a3 51         lda $51,s
$14:dfc7  87 f7         sta [$f7]
$14:dfc9  ff 3f ff da   sbc $daff3f,x
$14:dfcd  30 9f         bmi $df6e
$14:dfcf  38            sec
$14:dfd0  1e f7 79      asl $79f7,x
$14:dfd3  e2 81         sep #$81
$14:dfd5  f2 3f         sbc ($3f)
$14:dfd7  fb            xce
$14:dfd8  1c 0f 26      trb $260f
$14:dfdb  1f 40 bf 83   ora $83bf40,x
$14:dfdf  83 f9         sta $f9,s
$14:dfe1  ff e1 98 04   sbc $0498e1,x
$14:dfe5  20 17 e5      jsr $e517
$14:dfe8  10 e0         bpl $dfca
$14:dfea  3f fa af dd   and $ddaffa,x
$14:dfee  6f bf ed fe   adc $feedbf
$14:dff2  d5 fe         cmp $fe,x
$14:dff4  f6 bb         inc $bb,x
$14:dff6  7e 93 fb      ror $fb93,x
$14:dff9  d5 ff         cmp $ff,x
$14:dffb  c9 ee f0      cmp #$f0ee
$14:dffe  48            pha
$14:dfff  04 82         tsb $82
$14:e001  01 02         ora ($02,x)
$14:e003  80 42         bra $e047
$14:e005  20 19 04      jsr $0419
$14:e008  10 bf         bpl $dfc9
$14:e00a  83 11         sta $11,s
$14:e00c  00 ad         brk #$ad
$14:e00e  76 b4         ror $b4,x
$14:e010  ba            tsx
$14:e011  5b            tcd
$14:e012  57 ab         eor [$ab],y
$14:e014  63 b1         adc $b1,s
$14:e016  bf 5f bc 9e   lda $9ebc5f,x
$14:e01a  4c 76 3a      jmp $3a76
$14:e01d  63 31         adc $31,s
$14:e01f  92 a3         sta ($a3)
$14:e021  82 01 15      brl $f525
$14:e024  80 53         bra $e079
$14:e026  a0 18         ldy #$18
$14:e028  18            clc
$14:e029  04 6e         tsb $6e
$14:e02b  01 71         ora ($71,x)
$14:e02d  80 73         bra $e0a2
$14:e02f  a0 15         ldy #$15
$14:e031  28            plp
$14:e032  86 b2         stx $b2
$14:e034  49 2b c4      eor #$c42b
$14:e037  1f c3 3b 04   ora $043bc3,x
$14:e03b  b1 d8         lda ($d8),y
$14:e03d  35 98         and $98,x
$14:e03f  88            dey
$14:e040  4c 03 df      jmp $df03
$14:e043  00 ed         brk #$ed
$14:e045  c0 2e         cpy #$2e
$14:e047  e1 01         sbc ($01,x)
$14:e049  fd c0 33      sbc $33c0,x
$14:e04c  ec 23 96      cpx $9623
$14:e04f  e4 ba         cpx $ba
$14:e051  f2 0d         sbc ($0d)
$14:e053  b5 26         lda $26,x
$14:e055  9d b1 ee      sta $eeb1,x
$14:e058  c8            iny
$14:e059  bd 31 6a      lda $6a31,x
$14:e05c  36 e7         rol $e7,x
$14:e05e  37 64         and [$64],y
$14:e060  00 68         brk #$68
$14:e062  40            rti
$14:e063  7f 90 0b 84   adc $840b90,x
$14:e067  03 00         ora $00,s
$14:e069  ae 0c 66      ldx $660c
$14:e06c  0f ff 08 ff   ora $ff08ff
$14:e070  d8            cld
$14:e071  e3 85         sbc $85,s
$14:e073  f0 7f         beq $e0f4
$14:e075  ec 02 ff      cpx $ff02
$14:e078  00 83         brk #$83
$14:e07a  c0 26         cpy #$26
$14:e07c  10 fc         bpl $e07a
$14:e07e  dd fc 8a      cmp $8afc,x
$14:e081  17 ac         ora [$ac],y
$14:e083  3f c6 1c ff   and $ff1cc6,x
$14:e087  ef cc 07 f7   sbc $f707cc
$14:e08b  0b            phd
$14:e08c  db            stp
$14:e08d  e1 f9         sbc ($f9,x)
$14:e08f  9c f9 9f      stz $9ff9
$14:e092  f3 8f         sbc ($8f,s),y
$14:e094  38            sec
$14:e095  ef c8 0c c1   sbc $c10cc8
$14:e099  06 ff         asl $ff
$14:e09b  c1 3f         cmp ($3f,x)
$14:e09d  f4 8f fc      pea $fc8f
$14:e0a0  c1 ce         cmp ($ce,x)
$14:e0a2  f8            sed
$14:e0a3  cf 9e c7 9d   cmp $9dc79e
$14:e0a7  37 e4         and [$e4],y
$14:e0a9  5f cd a0 e8   eor $e8a0cd,x
$14:e0ad  57 07         eor [$07],y
$14:e0af  7f 83 20 e2   adc $e22083,x
$14:e0b3  b7 07         lda [$07],y
$14:e0b5  5f 3c 7b fb   eor $fb7b3c,x
$14:e0b9  87 66         sta [$66]
$14:e0bb  71 e3         adc ($e3),y
$14:e0bd  8f ff 20 67   sta $6720ff
$14:e0c1  98            tya
$14:e0c2  1f 83 8a 31   ora $318a83,x
$14:e0c6  b7 ff         lda [$ff],y
$14:e0c8  14 77         trb $77
$14:e0ca  ed 09 bf      sbc $bf09
$14:e0cd  b3 03         lda ($03,s),y
$14:e0cf  81 1b         sta ($1b,x)
$14:e0d1  fe 1e e0      inc $e01e,x
$14:e0d4  ac ff f9      ldy $f9ff
$14:e0d7  fc 03 bf      jsr ($bf03,x)
$14:e0da  c0 b7         cpy #$b7
$14:e0dc  f8            sed
$14:e0dd  21 ff         and ($ff,x)
$14:e0df  8f 9c 3b e6   sta $e63b9c
$14:e0e3  d5 08         cmp $08,x
$14:e0e5  39 80 38      and $3880,y
$14:e0e8  1f f1 e0 44   ora $44e0f1,x
$14:e0ec  0c 12 60      tsb $6012
$14:e0ef  2f c4 63 cd   and $cd63c4
$14:e0f3  3e a0 ff      rol $ffa0,x
$14:e0f6  e3 de         sbc $de,s
$14:e0f8  12 a9         ora ($a9)
$14:e0fa  19 c9 b8      ora $b8c9,y
$14:e0fd  07 08         ora [$08]
$14:e0ff  f6 4c         inc $4c,x
$14:e101  fb            xce
$14:e102  f6 00         inc $00,x
$14:e104  88            dey
$14:e105  6f f8 05 50   adc $5005f8
$14:e109  2a            rol a
$14:e10a  a1 7f         lda ($7f,x)
$14:e10c  be 31 1a      ldx $1a31,y
$14:e10f  6f 3b 8f 38   adc $388f3b
$14:e113  30 47         bmi $e15c
$14:e115  bb            tyx
$14:e116  ff 30 30 5c   sbc $5c3030,x
$14:e11a  ff 80 71 f1   sbc $f17180,x
$14:e11e  05 c5         ora $c5
$14:e120  3f f4 af fc   and $fcaff4,x
$14:e124  4b            phk
$14:e125  ff 94 ff cc   sbc $ccff94,x
$14:e129  7f f8 af fc   adc $fcaff8,x
$14:e12d  9b            txy
$14:e12e  ff 49 7e 89   sbc $897e49,x
$14:e132  ff 32 b0 8a   sbc $8ab032,x
$14:e136  d4 87         pei ($87)
$14:e138  55 44         eor $44,x
$14:e13a  f6 c4         inc $c4,x
$14:e13c  2b            pld
$14:e13d  5a            phy
$14:e13e  5d 6c 4a      eor $4a6c,x
$14:e141  b7 a4         lda [$a4],y
$14:e143  da            phx
$14:e144  42 c4         wdm #$c4
$14:e146  1b            tcs
$14:e147  00 e2         brk #$e2
$14:e149  40            rti
$14:e14a  2d 70 0c      and $0c70
$14:e14d  d4 02         pei ($02)
$14:e14f  d9 00 cd      cmp $cd00,y
$14:e152  c1 24         cmp ($24,x)
$14:e154  b1 0a         lda ($0a),y
$14:e156  f4 87 a7      pea $a787
$14:e159  0c 10 6c      tsb $6c10
$14:e15c  02 a5         cop #$a5
$14:e15e  d2 d2         cmp ($d2)
$14:e160  69 2d 5e      adc #$5e2d
$14:e163  ad 96 c2      lda $c296
$14:e166  99 4c f0      sta $f04c,y
$14:e169  f8            sed
$14:e16a  35 58         and $58,x
$14:e16c  89 8c c2      bit #$c28c
$14:e16f  5b            tcd
$14:e170  00 ad         brk #$ad
$14:e172  c0 22         cpy #$22
$14:e174  b0 0a         bcs $e180
$14:e176  7c 03 67      jmp ($6703,x)
$14:e179  00 8f         brk #$8f
$14:e17b  c0 2e         cpy #$2e
$14:e17d  f0 0e         beq $e18d
$14:e17f  7c 02 8f      jmp ($8f02,x)
$14:e182  38            sec
$14:e183  de 50 38      dec $3850,x
$14:e186  50 1c         bvc $e1a4
$14:e188  4c 1a a1      jmp $a11a
$14:e18b  40            rti
$14:e18c  c3 e1         cmp $e1,s
$14:e18e  fe 1f 0e      inc $0e1f,x
$14:e191  7f 3f fe ff   adc $fffe3f,x
$14:e195  5d ff fe      eor $feff,x
$14:e198  f1 ff         sbc ($ff),y
$14:e19a  87 90         sta [$90]
$14:e19c  07 dd         ora [$dd]
$14:e19e  10 9c         bpl $e13c
$14:e1a0  40            rti
$14:e1a1  22 de 69 ec   jsl $ec69de
$14:e1a5  02 03         cop #$03
$14:e1a7  01 fc         ora ($fc,x)
$14:e1a9  7e 1f e1      ror $e11f,x
$14:e1ac  c7 e3         cmp [$e3]
$14:e1ae  bf cb f2 ff   lda $fff2cb,x
$14:e1b2  1f f7 fe 0e   ora $0efef7,x
$14:e1b6  a1 19         lda ($19,x)
$14:e1b8  c7 fe         cmp [$fe]
$14:e1ba  b7 24         lda [$24],y
$14:e1bc  de 50 ed      dec $ed50,x
$14:e1bf  38            sec
$14:e1c0  6c cc 07      jmp ($07cc)
$14:e1c3  cd e6 e9      cmp $e9e6
$14:e1c6  f7 e2         sbc [$e2],y
$14:e1c8  9e fd 9d      stz $9dfd,x
$14:e1cb  31 fe         and ($fe),y
$14:e1cd  82 70 8c      brl $6e40
$14:e1d0  ff e4 0a 13   sbc $130ae4,x
$14:e1d4  9c 71 f0      stz $f071
$14:e1d7  1f dc cc 6a   ora $6accdc,x
$14:e1db  55 24         eor $24,x
$14:e1dd  d2 66         cmp ($66)
$14:e1df  27 7c         and [$7c]
$14:e1e1  3e 3c 1e      rol $1e3c,x
$14:e1e4  69 33 25      adc #$2533
$14:e1e7  84 0f         sty $0f
$14:e1e9  ff e7 ff f7   sbc $f7ffe7,x
$14:e1ed  ff f7 ff ff   sbc $fffff7,x
$14:e1f1  f3 fe         sbc ($fe,s),y
$14:e1f3  1a            inc a
$14:e1f4  07 f0         ora [$f0]
$14:e1f6  17 ca         ora [$ca],y
$14:e1f8  17 f8         ora [$f8],y
$14:e1fa  b7 78         lda [$78],y
$14:e1fc  32 10         and ($10)
$14:e1fe  0e 14 0a      asl $0a14
$14:e201  6f 7f a7 55   adc $55a77f
$14:e205  89 64 29      bit #$2964
$14:e208  08            php
$14:e209  fb            xce
$14:e20a  fc 7f bf      jsr ($bf7f,x)
$14:e20d  fc 07 ff      jsr ($ff07,x)
$14:e210  73 ff         adc ($ff,s),y
$14:e212  b0 43         bcs $e257
$14:e214  ed 1f 3e      sbc $3e1f
$14:e217  64 fb         stz $fb
$14:e219  ed 0f 85      sbc $850f
$14:e21c  c1 f2         cmp ($f2,x)
$14:e21e  d8            cld
$14:e21f  9d 56 46      sta $4656,x
$14:e222  8b            phb
$14:e223  42 f8         wdm #$f8
$14:e225  1a            inc a
$14:e226  05 fe         ora $fe
$14:e228  86 70         stx $70
$14:e22a  33 80         and ($80,s),y
$14:e22c  1c 18 1a      trb $1a18
$14:e22f  80 05         bra $e236
$14:e231  fe ac 3d      inc $3dac,x
$14:e234  7f b4 0f fc   adc $fc0fb4,x
$14:e238  07 fd         ora [$fd]
$14:e23a  10 f6         bpl $e232
$14:e23c  c8            iny
$14:e23d  3b            tsc
$14:e23e  e4 b0         cpx $b0
$14:e240  90 57         bcc $e299
$14:e242  c9 61 12      cmp #$1261
$14:e245  44 81 2c      mvp $2c,$81
$14:e248  7f b0 2e f9   adc $f92eb0,x
$14:e24c  24 6f         bit $6f
$14:e24e  e8            inx
$14:e24f  b0 01         bcs $e252
$14:e251  04 02         tsb $02
$14:e253  89 bb ac      bit #$acbb
$14:e256  e9 a6 1d      sbc #$1da6
$14:e259  fa            plx
$14:e25a  d6 36         dec $36,x
$14:e25c  3b            tsc
$14:e25d  f2 94         sbc ($94)
$14:e25f  f5 b8         sbc $b8,x
$14:e261  53 fc         eor ($fc,s),y
$14:e263  5d d1 5c      eor $5cd1,x
$14:e266  9c f9 83      stz $83f9
$14:e269  5d c0 22      eor $22c0,x
$14:e26c  f5 02         sbc $02,x
$14:e26e  48            pha
$14:e26f  76 2a         ror $2a,x
$14:e271  e3 50         sbc $50,s
$14:e273  7a            ply
$14:e274  92 fc         sta ($fc)
$14:e276  60            rts
$14:e277  52 08         eor ($08)
$14:e279  01 0c         ora ($0c,x)
$14:e27b  3b            tsc
$14:e27c  12 02         ora ($02)
$14:e27e  18            clc
$14:e27f  4a            lsr a
$14:e280  17 e3         ora [$e3],y
$14:e282  10 f7         bpl $e27b
$14:e284  c4 3f         cpy $3f
$14:e286  e4 f0         cpx $f0
$14:e288  ff 51 49 e1   sbc $e14951,x
$14:e28c  90 29         bcc $e2b7
$14:e28e  09 fc 22      ora #$22fc
$14:e291  04 e0         tsb $e0
$14:e293  25 04         and $04
$14:e295  43 8d         eor $8d,s
$14:e297  28            plp
$14:e298  31 86         and ($86),y
$14:e29a  42 01         wdm #$01
$14:e29c  12 5f         ora ($5f)
$14:e29e  8c b3 f9      sty $f9b3
$14:e2a1  5a            phy
$14:e2a2  ed 74 fe      sbc $fe74
$14:e2a5  fb            xce
$14:e2a6  ef f4 17 fb   sbc $fb17f4
$14:e2aa  b6 ff         ldx $ff,y
$14:e2ac  d0 bf         bne $e26d
$14:e2ae  f0 8f         beq $e23f
$14:e2b0  fc 0e 01      jsr ($010e,x)
$14:e2b3  25 80         and $80
$14:e2b5  42 20         wdm #$20
$14:e2b7  10 12         bpl $e2cb
$14:e2b9  08            php
$14:e2ba  2f d7 55 fb   and $fb55d7
$14:e2be  ad f7 f4      lda $f4f7
$14:e2c1  9b            txy
$14:e2c2  ca            dex
$14:e2c3  bf de 15 ee   lda $ee15de,x
$14:e2c7  92 7f         sta ($7f)
$14:e2c9  72 bb         adc ($bb)
$14:e2cb  f9 3f de      sbc $de3f,y
$14:e2ce  08            php
$14:e2cf  44 1a 1a      mvp $1a,$1a
$14:e2d2  08            php
$14:e2d3  62 a8 61      per $447e
$14:e2d6  a0 20         ldy #$20
$14:e2d8  87 59         sta [$59]
$14:e2da  8c fa cc      sty $ccfa
$14:e2dd  64 f2         stz $f2
$14:e2df  7b            tdc
$14:e2e0  e5 f3         sbc $f3
$14:e2e2  53 89         eor ($89,s),y
$14:e2e4  ab            plb
$14:e2e5  55 f4         eor $f4,x
$14:e2e7  b2 5a         lda ($5a)
$14:e2e9  55 2e         eor $2e,x
$14:e2eb  e7 00         sbc [$00]
$14:e2ed  e7 11         sbc [$11]
$14:e2ef  82 01 83      brl $65f3
$14:e2f2  80 5d         bra $e351
$14:e2f4  a0 1a         ldy #$1a
$14:e2f6  88            dey
$14:e2f7  07 6a         ora [$6a]
$14:e2f9  01 b4         ora ($b4,x)
$14:e2fb  27 07         and [$07]
$14:e2fd  fe 88 f0      inc $f088,x
$14:e300  01 58         ora ($58,x)
$14:e302  9f 41 de 10   sta $10de41,x
$14:e306  21 d0         and ($d0,x)
$14:e308  0f 89 bf 78   ora $78bf89
$14:e30c  fc 7f 22      jsr ($227f,x)
$14:e30f  61 79         adc ($79,x)
$14:e311  ff 71 bf f8   sbc $f8bf71,x
$14:e315  7f c4 77 c7   adc $c777c4,x
$14:e319  c9 9f 61      cmp #$619f
$14:e31c  ef 17 0f f8   sbc $f80f17
$14:e320  03 3f         ora $3f,s
$14:e322  9f cf 5f a2   sta $a25fcf,x
$14:e326  75 07         adc $07,x
$14:e328  8f ff ec 3f   sta $3fecff
$14:e32c  f8            sed
$14:e32d  e7 8f         sbc [$8f]
$14:e32f  d5 07         cmp $07,x
$14:e331  c8            iny
$14:e332  43 e0         eor $e0,s
$14:e334  7f f8 b8 02   adc $02b8f8,x
$14:e338  f3 f0         sbc ($f0,s),y
$14:e33a  0b            phd
$14:e33b  06 03         asl $03
$14:e33d  33 60         and ($60,s),y
$14:e33f  be 40 3b      ldx $3b40,y
$14:e342  71 8d         adc ($8d),y
$14:e344  1f 7f b7 3c   ora $3cb77f,x
$14:e348  f3 05         sbc ($05,s),y
$14:e34a  40            rti
$14:e34b  00 be         brk #$be
$14:e34d  76 a0         ror $a0,x
$14:e34f  92 4a         sta ($4a)
$14:e351  07 80         ora [$80]
$14:e353  fb            xce
$14:e354  40            rti
$14:e355  79 70 8d      adc $8d70,y
$14:e358  b6 1a         ldx $1a,y
$14:e35a  c7 63         cmp [$63]
$14:e35c  ae 47 2e      ldx $2e47
$14:e35f  7f fe 44 fc   adc $fc44fe,x
$14:e363  00 5f         brk #$5f
$14:e365  7f fd e7 ff   adc $ffe7fd,x
$14:e369  9c ff f8      stz $f8ff
$14:e36c  c9 0a 6f      cmp #$6f0a
$14:e36f  d6 fe         dec $fe,x
$14:e371  d1 ef         cmp ($ef),y
$14:e373  19 ff 04      ora $04ff,y
$14:e376  ff 81 7f c0   sbc $c07f81,x
$14:e37a  1b            tcs
$14:e37b  9b            txy
$14:e37c  00 df         brk #$df
$14:e37e  d3 87         cmp ($87,s),y
$14:e380  a8            tay
$14:e381  3c dd 5f      bit $5fdd,x
$14:e384  78            sei
$14:e385  41 ff         eor ($ff,x)
$14:e387  89 a1 01      bit #$01a1
$14:e38a  ff 40 37 e4   sbc $e43740,x
$14:e38e  92 92         sta ($92)
$14:e390  76 c9         ror $c9,x
$14:e392  24 48         bit $48
$14:e394  2d fd 00      and $00fd
$14:e397  90 5f         bcc $e3f8
$14:e399  b8            clv
$14:e39a  22 ec de 01   jsl $01deec
$14:e39e  be 8c 7b      ldx $7b8c,y
$14:e3a1  f0 17         beq $e3ba
$14:e3a3  79 57 8e      adc $8e57,y
$14:e3a6  45 d5         eor $d5
$14:e3a8  c4 5f         cpy $5f
$14:e3aa  df a4 03 26   cmp $2603a4,x
$14:e3ae  e8            inx
$14:e3af  78            sei
$14:e3b0  e3 8d         sbc $8d,s
$14:e3b2  d0 4a         bne $e3fe
$14:e3b4  92 ba         sta ($ba)
$14:e3b6  21 1f         and ($1f,x)
$14:e3b8  75 d4         adc $d4,x
$14:e3ba  60            rts
$14:e3bb  0f e4 de 45   ora $45dee4
$14:e3bf  b8            clv
$14:e3c0  c0 96         cpy #$96
$14:e3c2  7b            tdc
$14:e3c3  02 3f         cop #$3f
$14:e3c5  8d 01 bf      sta $bf01
$14:e3c8  e7 8f         sbc [$8f]
$14:e3ca  3f 1f 32 01   and $01321f,x
$14:e3ce  7b            tdc
$14:e3cf  80 6f         bra $e440
$14:e3d1  a0 1e         ldy #$1e
$14:e3d3  c8            iny
$14:e3d4  06 7e         asl $7e
$14:e3d6  01 35         ora ($35,x)
$14:e3d8  80 5e         bra $e438
$14:e3da  64 1d         stz $1d
$14:e3dc  26 c2         rol $c2
$14:e3de  b3 e1         lda ($e1,s),y
$14:e3e0  1e 5a e8      asl $e85a,x
$14:e3e3  85 b3         sta $b3
$14:e3e5  01 9b         ora ($9b,x)
$14:e3e7  82 4d 20      brl $0437
$14:e3ea  36 b8         rol $b8,x
$14:e3ec  87 5a         sta [$5a]
$14:e3ee  02 d1         cop #$d1
$14:e3f0  a1 81         lda ($81,x)
$14:e3f2  4a            lsr a
$14:e3f3  a5 7d         lda $7d
$14:e3f5  fe fe 93      inc $93fe,x
$14:e3f8  59 77 fb      eor $fb77,y
$14:e3fb  f2 b9         sbc ($b9)
$14:e3fd  d6 4f         dec $4f,x
$14:e3ff  ee 57 7f      inc $7f57
$14:e402  27 fb         and [$fb]
$14:e404  f5 20         sbc $20,x
$14:e406  12 08         ora ($08)
$14:e408  05 4c         ora $4c
$14:e40a  92 33         sta ($33)
$14:e40c  13 10         ora ($10,s),y
$14:e40e  99 c0 94      sta $94c0,y
$14:e411  13 ee         ora ($ee,s),y
$14:e413  04 af         tsb $af
$14:e415  8f 90 b7 d1   sta $d1b790
$14:e419  a7 1b         lda [$1b]
$14:e41b  8c 06 1b      sty $1b06
$14:e41e  0f 58 af 58   ora $58af58
$14:e422  c3 c0         cmp $c0,s
$14:e424  fe 5b ff      inc $ff5b,x
$14:e427  fe f1 ff      inc $fff1,x
$14:e42a  d0 8c         bne $e3b8
$14:e42c  06 4f         asl $4f
$14:e42e  18            clc
$14:e42f  b7 64         lda [$64],y
$14:e431  67 3c         adc [$3c]
$14:e433  68            pla
$14:e434  64 03         stz $03
$14:e436  a3 c1         lda $c1,s
$14:e438  d7 63         cmp [$63],y
$14:e43a  e8            inx
$14:e43b  37 cb         and [$cb],y
$14:e43d  1e 50 08      asl $0850,x
$14:e440  21 f3         and ($f3,x)
$14:e442  9f 7f ee 1f   sta $1fee7f,x
$14:e446  fc 1f fd      jsr ($fd1f,x)
$14:e449  48            pha
$14:e44a  55 4e         eor $4e,x
$14:e44c  46 e6         lsr $e6
$14:e44e  0c e9 09      tsb $09e9
$14:e451  84 c3         sty $c3
$14:e453  5d ff 82      eor $82ff,x
$14:e456  76 63         ror $63,x
$14:e458  29 30 ff      and #$ff30
$14:e45b  cf c3 e7 cf   cmp $cfe7c3
$14:e45f  06 09         asl $09
$14:e461  04 00         tsb $00
$14:e463  e1 b2         sbc ($b2,x)
$14:e465  be de 70      ldx $70de,y
$14:e468  de 38 04      dec $0438,x
$14:e46b  b2 79         lda ($79)
$14:e46d  40            rti
$14:e46e  04 06         tsb $06
$14:e470  1e 7f c0      asl $c07f,x
$14:e473  bf e0 03 e9   lda $e903e0,x
$14:e477  c3 62         cmp $62,s
$14:e479  c1 bf         cmp ($bf,x)
$14:e47b  cf d9 1f d0   cmp $d01fd9
$14:e47f  57 ec         eor [$ec],y
$14:e481  1b            tcs
$14:e482  f2 e1         sbc ($e1)
$14:e484  31 95         and ($95),y
$14:e486  d6 18         dec $18,x
$14:e488  03 f5         ora $f5,s
$14:e48a  b1 4b         lda ($4b),y
$14:e48c  fd 01 fc      sbc $fc01,x
$14:e48f  c1 fe         cmp ($fe,x)
$14:e491  90 cf         bcc $e462
$14:e493  4c 63 ed      jmp $ed63
$14:e496  11 ea         ora ($ea),y
$14:e498  4c cf cd      jmp $cdcf
$14:e49b  03 80         ora $80,s
$14:e49d  41 e0         eor ($e0,x)
$14:e49f  10 f8         bpl $e499
$14:e4a1  00 54         brk #$54
$14:e4a3  3b            tsc
$14:e4a4  b3 6d         lda ($6d,s),y
$14:e4a6  cd aa 53      cmp $53aa
$14:e4a9  be a9 dd      ldx $dda9,y
$14:e4ac  26 72         rol $72
$14:e4ae  4e 5c 33      lsr $335c
$14:e4b1  57 cc         eor [$cc],y
$14:e4b3  e9 e9 11      sbc #$11e9
$14:e4b6  a1 04         lda ($04,x)
$14:e4b8  4f 0e 22 01   eor $01220e
$14:e4bc  d8            cld
$14:e4bd  80 7c         bra $e53b
$14:e4bf  1d 03 78      ora $7803,x
$14:e4c2  80 74         bra $e538
$14:e4c4  fe 76 af      inc $af76,x
$14:e4c7  76 f7         ror $f7,x
$14:e4c9  fb            xce
$14:e4ca  ee ff e5      inc $e5ff
$14:e4cd  be d7 5f      ldx $5fd7,y
$14:e4d0  fd e7 ff      sbc $ffe7,x
$14:e4d3  d2 ff         cmp ($ff)
$14:e4d5  c3 3f         cmp $3f,s
$14:e4d7  f1 1f         sbc ($1f),y
$14:e4d9  fc 09 36      jsr ($3609,x)
$14:e4dc  30 93         bmi $e471
$14:e4de  47 86         eor [$86]
$14:e4e0  3d 53 06      and $0653,x
$14:e4e3  63 88         adc $88,s
$14:e4e5  02 b6         cop #$b6
$14:e4e7  20 1f 30      jsr $301f
$14:e4ea  18            clc
$14:e4eb  44 3d e3      mvp $e3,$3d
$14:e4ee  70 82         bvs $e472
$14:e4f0  02 13         cop #$13
$14:e4f2  fa            plx
$14:e4f3  37 08         and [$08],y
$14:e4f5  11 20         ora ($20),y
$14:e4f7  dc 24 4c      jml [$4c24]
$14:e4fa  29 03 b8      and #$b803
$14:e4fd  21 96         and ($96,x)
$14:e4ff  a8            tay
$14:e500  8e f6 05      stx $05f6
$14:e503  ee 80 65      inc $6580
$14:e506  a1 37         lda ($37,x)
$14:e508  58            cli
$14:e509  05 e6         ora $e6
$14:e50b  01 d2         ora ($d2,x)
$14:e50d  17 c0         ora [$c0],y
$14:e50f  bd 79 7e      lda $7e79,x
$14:e512  ba            tsx
$14:e513  a7 73         lda [$73]
$14:e515  67 b3         adc [$b3]
$14:e517  f6 7b         inc $7b,x
$14:e519  bf 7f b9 75   lda $75b97f,x
$14:e51d  bb            tyx
$14:e51e  b3 d9         lda ($d9,s),y
$14:e520  db            stp
$14:e521  7d a2 9f      adc $9fa2,x
$14:e524  f9 1f fe      sbc $fe1f,y
$14:e527  98            tya
$14:e528  00 12         brk #$12
$14:e52a  a8            tay
$14:e52b  64 7f         stz $7f
$14:e52d  f2 60         sbc ($60)
$14:e52f  30 c9         bmi $e4fa
$14:e531  20 95 9a      jsr $9a95
$14:e534  cc d2 61      cpy $61d2
$14:e537  52 a1         eor ($a1)
$14:e539  53 21         eor ($21,s),y
$14:e53b  92 99         sta ($99)
$14:e53d  4f 13 81 ab   eor $ab8113
$14:e541  c5 fe         cmp $fe
$14:e543  ff fa 6f ff   sbc $ff6ffa,x
$14:e547  3f ff bd ff   and $ffbdff,x
$14:e54b  fc ff fd      jsr ($fdff,x)
$14:e54e  6f fc ff ff   adc $fffffc
$14:e552  74 ff         stz $ff,x
$14:e554  d4 20         pei ($20)
$14:e556  18            clc
$14:e557  58            cli
$14:e558  0d 42 21      ora $2142
$14:e55b  c5 80         cmp $80
$14:e55d  62 20 12      per $f780
$14:e560  29 14 26      and #$2614
$14:e563  01 2c         ora ($2c,x)
$14:e565  1b            tcs
$14:e566  87 ff         sta [$ff]
$14:e568  fd ff f7      sbc $f7ff,x
$14:e56b  b7 c1         lda [$c1],y
$14:e56d  c8            iny
$14:e56e  3d d7 21      and $21d7,x
$14:e571  c5 be         cmp $be
$14:e573  f5 4e         sbc $4e,x
$14:e575  46 e6         lsr $e6
$14:e577  0d de 9f      ora $9fde
$14:e57a  e0 6f         cpx #$6f
$14:e57c  fd e8 0c      sbc $0ce8,x
$14:e57f  82 3f 58      brl $3dc1
$14:e582  9f c2 19 42   sta $4219c2,x
$14:e586  02 a8         cop #$a8
$14:e588  57 ef         eor [$ef],y
$14:e58a  13 e6         ora ($e6,s),y
$14:e58c  e0 4f         cpx #$4f
$14:e58e  e1 ff         sbc ($ff,x)
$14:e590  fe 0f fe      inc $fe0f,x
$14:e593  71 c7         adc ($c7),y
$14:e595  a2 60         ldx #$60
$14:e597  e6 3d         inc $3d
$14:e599  02 a8         cop #$a8
$14:e59b  47 c0         eor [$c0]
$14:e59d  52 e3         eor ($e3)
$14:e59f  08            php
$14:e5a0  a7 ce         lda [$ce]
$14:e5a2  a1 cf         lda ($cf,x)
$14:e5a4  86 7f         stx $7f
$14:e5a6  f8            sed
$14:e5a7  1f fc 07 fe   ora $fe07fc,x
$14:e5ab  1d f1 b1      ora $b1f1,x
$14:e5ae  e0 28         cpx #$28
$14:e5b0  b4 20         ldy $20,x
$14:e5b2  a8            tay
$14:e5b3  00 6b         brk #$6b
$14:e5b5  7f ff e5 5e   adc $5ee5ff,x
$14:e5b9  ed 1a 6d      sbc $6d1a
$14:e5bc  04 7e         tsb $7e
$14:e5be  1f f0 99 73   ora $7399f0,x
$14:e5c2  31 97         and ($97),y
$14:e5c4  0b            phd
$14:e5c5  9e 0f dd      stz $dd0f,x
$14:e5c8  0e c2 7f      asl $7fc2
$14:e5cb  fb            xce
$14:e5cc  e0 27         cpx #$27
$14:e5ce  fe 7f fe      inc $fe7f,x
$14:e5d1  3f ff 17 87   and $8717ff,x
$14:e5d5  11 86         ora ($86),y
$14:e5d7  d1 e7         cmp ($e7),y
$14:e5d9  29 53 49      and #$4953
$14:e5dc  ad 22 e1      lda $e122
$14:e5df  88            dey
$14:e5e0  b5 64         lda $64,x
$14:e5e2  21 be         and ($be,x)
$14:e5e4  d8            cld
$14:e5e5  f4 02 fb      pea $fb02
$14:e5e8  00 b9         brk #$b9
$14:e5ea  c0 38         cpy #$38
$14:e5ec  70 0c         bvs $e5fa
$14:e5ee  3c 02 0f      bit $0f02,x
$14:e5f1  00 87         brk #$87
$14:e5f3  c0 22         cpy #$22
$14:e5f5  50 0f         bvc $e606
$14:e5f7  14 4e         trb $4e
$14:e5f9  2d 67 b4      and $b467
$14:e5fc  f3 b6         sbc ($b6,s),y
$14:e5fe  f3 8a         sbc ($8a,s),y
$14:e600  7d c2 bf      adc $bfc2,x
$14:e603  60            rts
$14:e604  df 84 c3 81   cmp $81c384,x
$14:e608  0c 80 66      tsb $6680
$14:e60b  20 1f 08      jsr $081f
$14:e60e  07 02         ora [$02]
$14:e610  01 80         ora ($80,x)
$14:e612  53 0a         eor ($0a,s),y
$14:e614  a8            tay
$14:e615  b9 12 7e      lda $7e12,y
$14:e618  84 df         sty $df
$14:e61a  d5 18         cmp $18,x
$14:e61c  f6 46         inc $46,x
$14:e61e  7a            ply
$14:e61f  33 8e         and ($8e,s),y
$14:e621  24 ab         bit $ab
$14:e623  0d 59 d4      ora $d459
$14:e626  d9 a3 10      cmp $10a3,y
$14:e629  08            php
$14:e62a  42 20         wdm #$20
$14:e62c  60            rts
$14:e62d  48            pha
$14:e62e  81 8a         sta ($8a,x)
$14:e630  c0 24         cpy #$24
$14:e632  10 05         bpl $e639
$14:e634  f8            sed
$14:e635  43 f6         eor $f6,s
$14:e637  94 19         sty $19,x
$14:e639  d5 07         cmp $07,x
$14:e63b  75 03         adc $03,x
$14:e63d  ca            dex
$14:e63e  69 e1 11      adc #$11e1
$14:e641  7a            ply
$14:e642  c6 bd         dec $bd
$14:e644  30 1e         bmi $e664
$14:e646  0a            asl a
$14:e647  44 03 89      mvp $89,$03
$14:e64a  00 a2         brk #$a2
$14:e64c  40            rti
$14:e64d  2d 10 0e      and $0e10
$14:e650  84 03         sty $03
$14:e652  40            rti
$14:e653  a8            tay
$14:e654  3b            tsc
$14:e655  d4 03         pei ($03)
$14:e657  fb            xce
$14:e658  01 8d         ora ($8d,x)
$14:e65a  50 27         bvc $e683
$14:e65c  d0 0f         bne $e66d
$14:e65e  3c 02 5d      bit $5d02,x
$14:e661  20 ce bd      jsr $bdce
$14:e664  84 44         sty $44
$14:e666  1f e1 12 98   ora $9812e1,x
$14:e66a  52 69         eor ($69)
$14:e66c  00 d2         brk #$d2
$14:e66e  d0 6b         bne $e6db
$14:e670  51 0d         eor ($0d),y
$14:e672  26 22         rol $22
$14:e674  d7 1c         cmp [$1c],y
$14:e676  93 4a         sta ($4a,s),y
$14:e678  b3 38         lda ($38,s),y
$14:e67a  04 18         tsb $18
$14:e67c  3f cb df ff   and $ffdfcb,x
$14:e680  bf 90 87 ba   lda $ba8790,x
$14:e684  42 37         wdm #$37
$14:e686  f0 3f         beq $e6c7
$14:e688  82 40 32      brl $18cb
$14:e68b  0e ff 63      asl $63ff
$14:e68e  5e 35 09      lsr $0935,x
$14:e691  07 dc         ora [$dc]
$14:e693  5e 2c 40      lsr $402c,x
$14:e696  62 84 80      per $671d
$14:e699  88            dey
$14:e69a  17 0f         ora [$0f],y
$14:e69c  c1 10         cmp ($10,x)
$14:e69e  21 12         and ($12,x)
$14:e6a0  85 50         sta $50
$14:e6a2  44 3f f1      mvp $f1,$3f
$14:e6a5  0f 7c 43 af   ora $af437c
$14:e6a9  fe d5 94      inc $94d5,x
$14:e6ac  c3 21         cmp $21,s
$14:e6ae  6f 88 7f 45   adc $457f88
$14:e6b2  e3 10         sbc $10,s
$14:e6b4  30 04         bmi $e6ba
$14:e6b6  e2 71         sep #$71
$14:e6b8  6c f7 18      jmp ($18f7)
$14:e6bb  c3 21         cmp $21,s
$14:e6bd  90 81         bcc $e640
$14:e6bf  23 42         and $42,s
$14:e6c1  01 cc         ora ($cc,x)
$14:e6c3  ff de ff fb   sbc $fbffde,x
$14:e6c7  ef ff b3 ff   sbc $ffb3ff
$14:e6cb  9f ff cd 7f   sta $7fcdff,x
$14:e6cf  f7 9f         sbc [$9f],y
$14:e6d1  ff 48 5c 67   sbc $675c48,x
$14:e6d5  fa            plx
$14:e6d6  ed 7f f6      sbc $f67f
$14:e6d9  bf ff 57 ff   lda $ff57ff,x
$14:e6dd  73 ff         adc ($ff,s),y
$14:e6df  a7 7f         lda [$7f]
$14:e6e1  fc 9f fc      jsr ($fc9f,x)
$14:e6e4  d7 fe         cmp [$fe],y
$14:e6e6  66 2e         ror $2e
$14:e6e8  09 2c         ora #$2c
$14:e6ea  02 95         cop #$95
$14:e6ec  00 88         brk #$88
$14:e6ee  c0 28         cpy #$28
$14:e6f0  d0 0c         bne $e6fe
$14:e6f2  0c 02 37      tsb $3702
$14:e6f5  00 b0         brk #$b0
$14:e6f7  9b            txy
$14:e6f8  82 a5 ff      brl $e6a0
$14:e6fb  d6 7f         dec $7f,x
$14:e6fd  e5 7f         sbc $7f
$14:e6ff  f8            sed
$14:e700  27 ff         and [$ff]
$14:e702  2d ff b0      and $b0ff
$14:e705  ac 06 12      ldy $1206
$14:e708  2e 0f 7c      rol $7c0f
$14:e70b  03 b7         ora $b7,s
$14:e70d  00 bb         brk #$bb
$14:e70f  8b            phb
$14:e710  c7 f7         cmp [$f7]
$14:e712  00 cf         brk #$cf
$14:e714  b0 cd         bcs $e6e3
$14:e716  9f ed ec d9   sta $d9eced,x
$14:e71a  df e0 df 9b   cmp $9bdfe0,x
$14:e71e  fe 01 50      inc $5001,x
$14:e721  13 c9         ora ($c9,s),y
$14:e723  e5 fe         sbc $fe
$14:e725  ff 24 ef fe   sbc $feef24,x
$14:e729  60            rts
$14:e72a  c2 a3         rep #$a3
$14:e72c  13 0f         ora ($0f,s),y
$14:e72e  0f ff 80 17   ora $1780ff
$14:e732  1d 63 4f      ora $4f63,x
$14:e735  c3 fe         cmp $fe,s
$14:e737  62 6e 17      per $fea8
$14:e73a  c5 38         cmp $38
$14:e73c  40            rti
$14:e73d  65 33         adc $33
$14:e73f  98            tya
$14:e740  a7 73         lda [$73]
$14:e742  07 7f         ora [$7f]
$14:e744  7f b7 fb ff   adc $fffbb7,x
$14:e748  c6 ff         dec $ff
$14:e74a  c8            iny
$14:e74b  cf c3 73 c0   cmp $c073c3
$14:e74f  45 bc         eor $bc
$14:e751  3e b8 24      rol $24b8,x
$14:e754  f0 be         beq $e714
$14:e756  10 0e         bpl $e766
$14:e758  0f 07 cf e7   ora $e7cf07
$14:e75c  87 3f         sta [$3f]
$14:e75e  d8            cld
$14:e75f  08            php
$14:e760  33 ef         and ($ef,s),y
$14:e762  fc 60 fc      jsr ($fc60,x)
$14:e765  38            sec
$14:e766  6b            rtl
$14:e767  cc c3 ff      cpy $ffc3
$14:e76a  f3 6f         sbc ($6f,s),y
$14:e76c  0c e2 71      tsb $71e2
$14:e76f  c3 e1         cmp $e1,s
$14:e771  c1 a7         cmp ($a7,x)
$14:e773  f3 8e         sbc ($8e,s),y
$14:e775  3b            tsc
$14:e776  fd 8b c1      sbc $c18b,x
$14:e779  3c ff f0      bit $f0ff,x
$14:e77c  0f c3 5b cd   ora $cd5bc3
$14:e780  ed 36 f4      sbc $f436
$14:e783  b8            clv
$14:e784  67 1f         adc [$1f]
$14:e786  f1 3f         sbc ($3f),y
$14:e788  e0 3c         cpx #$3c
$14:e78a  c0 14         cpy #$14
$14:e78c  5e 48 05      lsr $0548,x
$14:e78f  22 01 f0 6f   jsl $6ff001
$14:e793  49 e5 12      eor #$12e5
$14:e796  30 9e         bmi $e736
$14:e798  e4 8d         cpx $8d
$14:e79a  7e a0 df      ror $dfa0,x
$14:e79d  58            cli
$14:e79e  62 7a a0      per $881b
$14:e7a1  30 08         bmi $e7ab
$14:e7a3  1a            inc a
$14:e7a4  49 ff 90      eor #$90ff
$14:e7a7  30 e8         bmi $e791
$14:e7a9  6f a7 f0 de   adc $def0a7
$14:e7ad  72 7a         adc ($7a)
$14:e7af  b8            clv
$14:e7b0  08            php
$14:e7b1  21 26         and ($26,x)
$14:e7b3  07 fa         ora [$fa]
$14:e7b5  03 f0         ora $f0,s
$14:e7b7  87 e6         sta [$e6]
$14:e7b9  2f f6 0f fe   and $fe0ff6
$14:e7bd  43 df         eor $df,s
$14:e7bf  64 cf         stz $cf
$14:e7c1  e2 6f         sep #$6f
$14:e7c3  e9 ee         sbc #$ee
$14:e7c5  d7 d4         cmp [$d4],y
$14:e7c7  29 fb         and #$fb
$14:e7c9  09 ff         ora #$ff
$14:e7cb  82 af e8      brl $d07d
$14:e7ce  b3 f6         lda ($f6,s),y
$14:e7d0  35 fd         and $fd,x
$14:e7d2  0c 7f c3      tsb $c37f
$14:e7d5  bf b0 4f 7a   lda $7a4fb0,x
$14:e7d9  65 1f         adc $1f
$14:e7db  c0 97         cpy #$97
$14:e7dd  bc 06 01      ldy $0106,x
$14:e7e0  4d 50 2f      eor $2f50
$14:e7e3  ea            nop
$14:e7e4  70 77         bvs $e85d
$14:e7e6  e4 f2         cpx $f2
$14:e7e8  4e 24 0a      lsr $0a24
$14:e7eb  04 1f         tsb $1f
$14:e7ed  0a            asl a
$14:e7ee  05 00         ora $00
$14:e7f0  3f e7 9f 3f   and $3f9fe7,x
$14:e7f4  16 57         asl $57,x
$14:e7f6  ef 5a ef 7a   sbc $7aef5a
$14:e7fa  bf 7e df 7e   lda $7edf7e,x
$14:e7fe  db            stp
$14:e7ff  6d af f7      adc $f7af
$14:e802  d6 eb         dec $eb,x
$14:e804  7b            tdc
$14:e805  4f a4 23 ff   eor $ff23a4
$14:e809  21 ff         and ($ff,x)
$14:e80b  c1 3b         cmp ($3b,x)
$14:e80d  f1 0d         sbc ($0d),y
$14:e80f  fd 27 ff      sbc $ff27,x
$14:e812  10 ff         bpl $e813
$14:e814  e9 3f         sbc #$3f
$14:e816  f0 bf         beq $e7d7
$14:e818  ff 13 ff 6b   sbc $6bff13,x
$14:e81c  ff e6 bf f6   sbc $f6bfe6,x
$14:e820  cf fd 6e f7   cmp $f76efd
$14:e824  a5 f7         lda $f7
$14:e826  d7 bb         cmp [$bb],y
$14:e828  dd 3f 98      cmp $983f,x
$14:e82b  c4 c7         cpy $c7
$14:e82d  43 84         eor $84,s
$14:e82f  54 0a 84      mvn $84,$0a
$14:e832  21 9f         and ($9f,x)
$14:e834  fa            plx
$14:e835  92 a8         sta ($a8)
$14:e837  6d 5f fd      adc $fd5f
$14:e83a  97 fe         sta [$fe],y
$14:e83c  99 ff f0      sta $f0ff,y
$14:e83f  ff f5 5f f9   sbc $f95ff5,x
$14:e843  88            dey
$14:e844  d0 25         bne $e86b
$14:e846  b0 0a         bcs $e852
$14:e848  dc 02 2b      jml [$2b02]
$14:e84b  00 a7         brk #$a7
$14:e84d  c0 36         cpy #$36
$14:e84f  70 08         bvs $e859
$14:e851  fc 02 ef      jsr ($ef02,x)
$14:e854  00 e7         brk #$e7
$14:e856  b0 15         bcs $e86d
$14:e858  7e bf e8      ror $e8bf,x
$14:e85b  09 fb         ora #$fb
$14:e85d  bd 31 9f      lda $9f31,x
$14:e860  2c 47 b7      bit $b747
$14:e863  33 eb         and ($eb,s),y
$14:e865  4d b5 b6      eor $b6b5
$14:e868  dc a5 7e      jml [$7ea5]
$14:e86b  d7 fc         cmp [$fc],y
$14:e86d  d3 f6         cmp ($f6,s),y
$14:e86f  20 d0 08      jsr $08d0
$14:e872  74 02         stz $02,x
$14:e874  19 00 84      ora $8400,y
$14:e877  c0 22         cpy #$22
$14:e879  50 09         bvc $e884
$14:e87b  01 2d         ora ($2d,x)
$14:e87d  9f 47 f9 83   sta $83f947,x
$14:e881  f9 23 9d      sbc $9d23,y
$14:e884  19 87 3a      ora $3a87,y
$14:e887  42 7e         wdm #$7e
$14:e889  88            dey
$14:e88a  1c 02 1e      trb $1e02
$14:e88d  e9 17         sbc #$17
$14:e88f  e8            inx
$14:e890  7c a1 f9      jmp ($f9a1,x)
$14:e893  5b            tcd
$14:e894  ba            tsx
$14:e895  44 1f c1      mvp $c1,$1f
$14:e898  76 80         ror $80,x
$14:e89a  63 6e         adc $6e,s
$14:e89c  35 5e         and $5e,x
$14:e89e  c9 f8         cmp #$f8
$14:e8a0  a1 10         lda ($10,x)
$14:e8a2  01 f0         ora ($f0,x)
$14:e8a4  0c 4e 01      tsb $014e
$14:e8a7  de 90 6d      dec $6d90,x
$14:e8aa  7e d4 be      ror $bed4,x
$14:e8ad  66 5f         ror $5f
$14:e8af  31 a7         and ($a7),y
$14:e8b1  9c 57 ee      stz $ee57
$14:e8b4  1e ff 86      asl $86ff,x
$14:e8b7  bf 61 5f b0   lda $b05f61,x
$14:e8bb  18            clc
$14:e8bc  c2 61         rep #$61
$14:e8be  00 b0         brk #$b0
$14:e8c0  40            rti
$14:e8c1  38            sec
$14:e8c2  10 0c         bpl $e8d0
$14:e8c4  03 fc         ora $fc,s
$14:e8c6  68            pla
$14:e8c7  08            php
$14:e8c8  61 17         adc ($17,x)
$14:e8ca  a2 3e         ldx #$3e
$14:e8cc  1f fd eb 8d   ora $8debfd,x
$14:e8d0  f5 a6         sbc $a6,x
$14:e8d2  7c b9 3f      jmp ($3fb9,x)
$14:e8d5  32 41         and ($41)
$14:e8d7  b3 b9         lda ($b9,s),y
$14:e8d9  6f ef 35 fe   adc $fe35ef
$14:e8dd  15 7b         ora $7b,x
$14:e8df  99 04 11      sta $1104,y
$14:e8e2  0c 71 d2      tsb $d271
$14:e8e5  30 d7         bmi $e8be
$14:e8e7  f8            sed
$14:e8e8  cc 60 13      cpy $1360
$14:e8eb  38            sec
$14:e8ec  05 52         ora $52
$14:e8ee  4f d5 d3 ff   eor $ffd3d5
$14:e8f2  b0 d6         bcs $e8ca
$14:e8f4  58            cli
$14:e8f5  27 32         and [$32]
$14:e8f7  19 69 84      ora $8469,y
$14:e8fa  c2 e1         rep #$e1
$14:e8fc  73 69         adc ($69,s),y
$14:e8fe  bf e2 01 78   lda $7801e2,x
$14:e902  80 5e         bra $e962
$14:e904  60            rts
$14:e905  1f b8 07 ce   ora $ce07b8,x
$14:e909  01 f6         ora ($f6,x)
$14:e90b  80 7d         bra $e98a
$14:e90d  20 1c 88      jsr $881c
$14:e910  04 c7         tsb $c7
$14:e912  ff d3 ef e9   sbc $e9efd3,x
$14:e916  a7 f4         lda [$f4]
$14:e918  ab            plb
$14:e919  de 3b f7      dec $f73b,x
$14:e91c  52 d9         eor ($d9)
$14:e91e  d7 36         cmp [$36],y
$14:e920  fa            plx
$14:e921  4b            phk
$14:e922  39 1c 05      and $051c,y
$14:e925  20 85 0c      jsr $0c85
$14:e928  24 01         bit $01
$14:e92a  7e 46 30      ror $3046,x
$14:e92d  8c 40 21      sty $2140
$14:e930  ff 09 ff 82   sbc $82ff09,x
$14:e934  3f e0 af 85   and $85afe0,x
$14:e938  07 3e         ora [$3e]
$14:e93a  18            clc
$14:e93b  19 bd 21      ora $21bd,y
$14:e93e  41 88         eor ($88,x)
$14:e940  71 47         adc ($47),y
$14:e942  bc 43 de      ldy $de43,x
$14:e945  9a            txs
$14:e946  c8            iny
$14:e947  84 40         sty $40
$14:e949  7e 50 2f      ror $2f50,x
$14:e94c  ec 41 1e      cpx $1e41
$14:e94f  9b            txy
$14:e950  f4 72 40      pea $4072
$14:e953  a0 44         ldy #$44
$14:e955  80 1f         bra $e976
$14:e957  95 01         sta $01,x
$14:e959  16 03         asl $03,x
$14:e95b  f3 8a         sbc ($8a,s),y
$14:e95d  7f e9 5f f8   adc $f85fe9,x
$14:e961  97 ff         sta [$ff],y
$14:e963  29 ff 77      and #$77ff
$14:e966  86 2b         stx $2b
$14:e968  ff 26 ff d2   sbc $d2ff26,x
$14:e96c  53 be         eor ($be,s),y
$14:e96e  8e f4 f6      stx $f6f4
$14:e971  eb            xba
$14:e972  3f ff 5f fc   and $fc5fff,x
$14:e976  9f ff 7c ff   sta $ff7cff,x
$14:e97a  ea            nop
$14:e97b  7f f5 6f fe   adc $fe6ff5,x
$14:e97f  94 e0         sty $e0,x
$14:e981  30 0b         bmi $e98e
$14:e983  9c 03 9d      stz $9d03
$14:e986  00 ec         brk #$ec
$14:e988  40            rti
$14:e989  30 70         bmi $e9fb
$14:e98b  0b            phd
$14:e98c  b4 03         ldy $03,x
$14:e98e  51 00         eor ($00),y
$14:e990  ed 40 36      sbc $3640
$14:e993  85 10         sta $10
$14:e995  a2 7f         ldx #$7f
$14:e997  e0 25         cpx #$25
$14:e999  41 84         eor ($84,x)
$14:e99b  7f e8 05 e0   adc $e005e8,x
$14:e99f  ff c8 0f df   sbc $df0fc8,x
$14:e9a3  fe 80 bb      inc $bb80,x
$14:e9a6  c3 fb         cmp $fb,s
$14:e9a8  03 79         ora $79,s
$14:e9aa  87 ea         sta [$ea]
$14:e9ac  0c f7 0f      tsb $0ff7
$14:e9af  ac 33 e9      ldy $e933
$14:e9b2  0c 1f b4      tsb $b41f
$14:e9b5  04 0c         tsb $0c
$14:e9b7  30 30         bmi $e9e9
$14:e9b9  50 f5         bvc $e9b0
$14:e9bb  26 7c         rol $7c
$14:e9bd  c9 6f 56      cmp #$566f
$14:e9c0  79 a1 bc      adc $bca1,y
$14:e9c3  e9 2e f8      sbc #$f82e
$14:e9c6  bb            tyx
$14:e9c7  66 be         ror $be
$14:e9c9  e1 5f         sbc ($5f,x)
$14:e9cb  f0 43         beq $ea10
$14:e9cd  a0 11         ldy #$11
$14:e9cf  30 50         bmi $ea21
$14:e9d1  c1 a0         cmp ($a0,x)
$14:e9d3  10 83         bpl $e958
$14:e9d5  0a            asl a
$14:e9d6  2b            pld
$14:e9d7  82 c7 b7      brl $a1a1
$14:e9da  b8            clv
$14:e9db  6b            rtl
$14:e9dc  ec 19 5a      cpx $5a19
$14:e9df  75 6b         adc $6b,x
$14:e9e1  89 4a f1      bit #$f14a
$14:e9e4  d0 bb         bne $e9a1
$14:e9e6  f5 1e         sbc $1e,x
$14:e9e8  4c 7e 01      jmp $017e
$14:e9eb  0f 80 0f c2   ora $c20f80
$14:e9ef  7e 44 18      ror $1844,x
$14:e9f2  e4 02         cpx $02
$14:e9f4  41 00         eor ($00,x)
$14:e9f6  9f 40 3e df   sta $df3e40,x
$14:e9fa  8c e5 83      sty $83e5
$14:e9fd  f1 00         sbc ($00),y
$14:e9ff  e2 c1         sep #$c1
$14:ea01  6e 70 3a      ror $3a70
$14:ea04  4c c6 11      jmp $11c6
$14:ea07  01 b6         ora ($b6,x)
$14:ea09  64 5a         stz $5a
$14:ea0b  82 60 1f      brl $096e
$14:ea0e  d4 03         pei ($03)
$14:ea10  f8            sed
$14:ea11  ee 03 40      inc $4003
$14:ea14  87 c2         sta [$c2]
$14:ea16  ff 40 df f0   sbc $f0df40,x
$14:ea1a  0e 21 7f      asl $7f21
$14:ea1d  c0 1d         cpy #$1d
$14:ea1f  5b            tcd
$14:ea20  00 2a         brk #$2a
$14:ea22  34 04         bit $04,x
$14:ea24  3b            tsc
$14:ea25  d3 f9         cmp ($f9,s),y
$14:ea27  02 fd         cop #$fd
$14:ea29  c1 ff         cmp ($ff,x)
$14:ea2b  50 7f         bvc $eaac
$14:ea2d  e4 1f         cpx $1f
$14:ea2f  d2 3f         cmp ($3f)
$14:ea31  01 51         ora ($51,x)
$14:ea33  82 41 00      brl $ea77
$14:ea36  d8            cld
$14:ea37  4c 44 a6      jmp $a644
$14:ea3a  43 7a         eor $7a,s
$14:ea3c  b1 e5         lda ($e5),y
$14:ea3e  78            sei
$14:ea3f  f4 ae 75      pea $75ae
$14:ea42  5b            tcd
$14:ea43  bd 95 ce      lda $ce95,x
$14:ea46  4a            lsr a
$14:ea47  27 17         and [$17]
$14:ea49  f8            sed
$14:ea4a  07 7a         ora [$7a]
$14:ea4c  01 9c         ora ($9c,x)
$14:ea4e  80 4e         bra $ea9e
$14:ea50  20 13 18      jsr $1813
$14:ea53  04 86         tsb $86
$14:ea55  01 63         ora ($63,x)
$14:ea57  80 71         bra $eaca
$14:ea59  d8            cld
$14:ea5a  01 ff         ora ($ff,x)
$14:ea5c  bd 7e fc      lda $fc7e,x
$14:ea5f  9e 7b 24      stz $247b,x
$14:ea62  1f b3 6f d5   ora $d56fb3,x
$14:ea66  53 b9         eor ($b9,s),y
$14:ea68  b0 da         bcs $ea44
$14:ea6a  ce 66 01      dec $0166
$14:ea6d  00 82         brk #$82
$14:ea6f  40            rti
$14:ea70  23 10         and $10,s
$14:ea72  02 98         cop #$98
$14:ea74  7c 20 1f      jmp ($1f20,x)
$14:ea77  18            clc
$14:ea78  07 ca         ora [$ca]
$14:ea7a  01 e6         ora ($e6,x)
$14:ea7c  80 6a         bra $eae8
$14:ea7e  6d f5 0e      adc $0ef5
$14:ea81  f7 8b         sbc [$8b],y
$14:ea83  fd c5 fe      sbc $fec5,x
$14:ea86  d4 6e         pei ($6e)
$14:ea88  3a            dec a
$14:ea89  5f 4c 77 83   eor $83774c,x
$14:ea8d  5a            phy
$14:ea8e  e1 8a         sbc ($8a,x)
$14:ea90  41 92         eor ($92,x)
$14:ea92  0a            asl a
$14:ea93  50 81         bvc $ea16
$14:ea95  40            rti
$14:ea96  31 d0         and ($d0),y
$14:ea98  08            php
$14:ea99  f1 30         sbc ($30),y
$14:ea9b  67 90         adc [$90]
$14:ea9d  0d bf 23      ora $23bf
$14:eaa0  4f d8 08 85   eor $8508d8
$14:eaa4  3f 60 15 08   and $081560,x
$14:eaa8  ff 80 32 13   sbc $133280,x
$14:eaac  fe 03 7c      inc $7c03,x
$14:eaaf  03 f9         ora $f9,s
$14:eab1  4a            lsr a
$14:eab2  80 58         bra $eb0c
$14:eab4  60            rts
$14:eab5  39 48 95      and $9548,y
$14:eab8  82 41 96      brl $80fc
$14:eabb  80 4b         bra $eb08
$14:eabd  34 1c         bit $1c,x
$14:eabf  a8            tay
$14:eac0  04 5c         tsb $5c
$14:eac2  c0 1f         cpy #$1f
$14:eac4  ff f7 ff de   sbc $defff7,x
$14:eac8  3f 02 20 f7   and $f72002,x
$14:eacc  c8            iny
$14:eacd  83 fd         sta $fd,s
$14:eacf  fe d5 28      inc $28d5,x
$14:ead2  95 9a         sta $9a,x
$14:ead4  ce da 41      dec $41da
$14:ead7  5a            phy
$14:ead8  99 47 61      sta $6147,y
$14:eadb  ba            tsx
$14:eadc  99 4f 5b      sta $5b4f,y
$14:eadf  81 ab         sta ($ab,x)
$14:eae1  c5 ee         cmp $ee
$14:eae3  ff fa 62 40   sbc $4062fa,x
$14:eae7  ff 7f ff 2f   sbc $2fff7f,x
$14:eaeb  ff 5b ff 3f   sbc $3fff5b,x
$14:eaef  ff dd 3f f2   sbc $f23fdd,x
$14:eaf3  cf fd 6b ff   cmp $ff6bfd
$14:eaf7  d3 ff         cmp ($ff,s),y
$14:eaf9  ef bf f0 5f   sbc $5ff0bf
$14:eafd  fe db ff      inc $ffdb,x
$14:eb00  42 ff         wdm #$ff
$14:eb02  c2 3f         rep #$3f
$14:eb04  f0 08         beq $eb0e
$14:eb06  1c 02 4b      trb $4b02
$14:eb09  00 84         brk #$84
$14:eb0b  00 8d         brk #$8d
$14:eb0d  13 e9         ora ($e9,s),y
$14:eb0f  af 0f 8f 33   lda $338f0f
$14:eb13  ff 7b ff eb   sbc $ebff7b,x
$14:eb17  bd f6 cb      lda $cbf6,x
$14:eb1a  fe 6f f7      inc $f76f,x
$14:eb1d  34 ff         bit $ff,x
$14:eb1f  5a            phy
$14:eb20  fd fd 6f      sbc $6ffd,x
$14:eb23  f4 00 fc      pea $fc00
$14:eb26  1f f8 87 ff   ora $ff87f8,x
$14:eb2a  01 ff         ora ($ff,x)
$14:eb2c  82 7f e0      brl $cbae
$14:eb2f  2c 21 64      bit $6421
$14:eb32  82 7b c3      brl $aeb0
$14:eb35  fa            plx
$14:eb36  7e 0f f4      ror $f40f,x
$14:eb39  07 f9         ora [$f9]
$14:eb3b  03 77         ora $77,s
$14:eb3d  b3 3b         lda ($3b,s),y
$14:eb3f  c7 80         cmp [$80]
$14:eb41  70 0d         bvs $eb50
$14:eb43  d6 aa         dec $aa,x
$14:eb45  fd 2d fe      sbc $fe2d,x
$14:eb48  45 3f         eor $3f
$14:eb4a  9d 59 ee      sta $ee59,x
$14:eb4d  ae f7 aa      ldx $aaf7
$14:eb50  bd 03 02      lda $0203,x
$14:eb53  0a            asl a
$14:eb54  85 14         sta $14
$14:eb56  00 20         brk #$20
$14:eb58  01 10         ora ($10,x)
$14:eb5a  10 41         bpl $eb9d
$14:eb5c  00 cc         brk #$cc
$14:eb5e  e8            inx
$14:eb5f  7e 28 1e      ror $1e28,x
$14:eb62  a6 11         ldx $11
$14:eb64  4b            phk
$14:eb65  a5 f5         lda $f5
$14:eb67  7b            tdc
$14:eb68  99 0c e6      sta $e60c,y
$14:eb6b  a7 1f         lda [$1f]
$14:eb6d  da            phx
$14:eb6e  e1 7f         sbc ($7f,x)
$14:eb70  20 03 f0      jsr $f003
$14:eb73  fb            xce
$14:eb74  c0 36 90      cpy #$9036
$14:eb77  09 1c 02      ora #$021c
$14:eb7a  c7 00         cmp [$00]
$14:eb7c  b8            clv
$14:eb7d  40            rti
$14:eb7e  27 b0         and [$b0]
$14:eb80  0a            asl a
$14:eb81  5c ce 35 02   jml $0235ce
$14:eb85  ba            tsx
$14:eb86  d9 60 d6      cmp $d660,y
$14:eb89  7c 64 3f      jmp ($3f64,x)
$14:eb8c  73 be         adc ($be,s),y
$14:eb8e  b1 df         lda ($df),y
$14:eb90  28            plp
$14:eb91  f7 81         sbc [$81],y
$14:eb93  f8            sed
$14:eb94  7f 60 19 a8   adc $a81960,x
$14:eb98  06 62         asl $62
$14:eb9a  01 f0         ora ($f0,x)
$14:eb9c  80 50         bra $ebee
$14:eb9e  20 18 03      jsr $0318
$14:eba1  50 be         bvc $eb61
$14:eba3  c8            iny
$14:eba4  de 8f 10      dec $108f,x
$14:eba7  3c 93 ff      bit $ff93,x
$14:ebaa  ba            tsx
$14:ebab  53 ee         eor ($ee,s),y
$14:ebad  6c f3 33      jmp ($33f3)
$14:ebb0  79 d5 58      adc $58d5,y
$14:ebb3  aa            tax
$14:ebb4  3c 0b a7      bit $a70b,x
$14:ebb7  13 2d         ora ($2d,s),y
$14:ebb9  a6 ca         ldx $ca
$14:ebbb  f9 c4 65      sbc $65c4,y
$14:ebbe  06 80         asl $80
$14:ebc0  47 60         eor [$60]
$14:ebc2  13 f8         ora ($f8,s),y
$14:ebc4  04 ee         tsb $ee
$14:ebc6  01 79         ora ($79,x)
$14:ebc8  80 5e         bra $ec28
$14:ebca  20 1b 29      jsr $291b
$14:ebcd  95 92         sta $92,x
$14:ebcf  c9 cd e6      cmp #$e6cd
$14:ebd2  76 63         ror $63,x
$14:ebd4  1b            tcs
$14:ebd5  2a            rol a
$14:ebd6  8f 2e 07 2c   sta $2c072e
$14:ebda  93 ee         sta ($ee,s),y
$14:ebdc  b6 bc         ldx $bc,y
$14:ebde  d8            cld
$14:ebdf  06 6e         asl $6e
$14:ebe1  01 33         ora ($33,x)
$14:ebe3  80 79         bra $ec5e
$14:ebe5  e0 1e f2      cpx #$f21e
$14:ebe8  00 f6         brk #$f6
$14:ebea  20 14 88      jsr $8814
$14:ebed  06 ce         asl $ce
$14:ebef  67 8a         adc [$8a]
$14:ebf1  81 fd         sta ($fd,x)
$14:ebf3  e0 fa 9b      cpx #$9bfa
$14:ebf6  87 7a         sta [$7a]
$14:ebf8  73 49         adc ($49,s),y
$14:ebfa  9f 7c f1 99   sta $99f17c,x
$14:ebfe  ec 07 30      cpx $3007
$14:ec01  80 3f         bra $ec42
$14:ec03  83 72         sta $72,s
$14:ec05  df dd 43 52   cmp $5243dd,x
$14:ec09  e1 e9         sbc ($e9,x)
$14:ec0b  30 f4         bmi $ec01
$14:ec0d  88            dey
$14:ec0e  7f 42 3f a0   adc $a03f42,x
$14:ec12  9f c8 a7 f4   sta $f4a7c8,x
$14:ec16  5b            tcd
$14:ec17  f3 ec         sbc ($ec,s),y
$14:ec19  27 8a         and [$8a]
$14:ec1b  c1 33         cmp ($33,x)
$14:ec1d  87 82         sta [$82]
$14:ec1f  01 c0         ora ($c0,x)
$14:ec21  03 09         ora $09,s
$14:ec23  ac a7 fc      ldy $fca7
$14:ec26  00 78         brk #$78
$14:ec28  5f f0 01 30   eor $3001f0,x
$14:ec2c  74 80         stz $80,x
$14:ec2e  5d 0f fd      eor $fd0f,x
$14:ec31  fd 81 8b      sbc $8b81,x
$14:ec34  c0 f2 87      cpy #$87f2
$14:ec37  92 ff         sta ($ff)
$14:ec39  9f be db 0c   sta $0cdbbe,x
$14:ec3d  8a            txa
$14:ec3e  c7 35         cmp [$35]
$14:ec40  fb            xce
$14:ec41  cc 56 e2      cpy $e256
$14:ec44  bd 78 cb      lda $cb78,x
$14:ec47  7c 32 3f      jmp ($3f32,x)
$14:ec4a  59 6f 87      eor $876f,y
$14:ec4d  e7 00         sbc [$00]
$14:ec4f  f1 c0         sbc ($c0),y
$14:ec51  28            plp
$14:ec52  70 0a         bvs $ec5e
$14:ec54  3c 03 0f      bit $0f03,x
$14:ec57  00 87         brk #$87
$14:ec59  c0 21 d0      cpy #$d021
$14:ec5c  08            php
$14:ec5d  f4 02 0f      pea $0f02
$14:ec60  00 be         brk #$be
$14:ec62  d9 ab 54      cmp $54ab,y
$14:ec65  ee 77 0b      inc $0b77
$14:ec68  87 d8         sta [$d8]
$14:ec6a  c0 6f b2      cpy #$b26f
$14:ec6d  1b            tcs
$14:ec6e  f8            sed
$14:ec6f  6f f9 d2 19   adc $19d2f9
$14:ec73  98            tya
$14:ec74  06 c6         asl $c6
$14:ec76  01 3d         ora ($3d,x)
$14:ec78  80 49         bra $ecc3
$14:ec7a  e0 14 18      cpx #$1814
$14:ec7d  05 02         ora $02
$14:ec7f  00 3e         brk #$3e
$14:ec81  0b            phd
$14:ec82  bc ae 93      ldy $93ae,x
$14:ec85  2a            rol a
$14:ec86  d5 47         cmp $47,x
$14:ec88  21 98         and ($98,x)
$14:ec8a  0d cc e6      ora $e6cc
$14:ec8d  6d 33 e2      adc $e233
$14:ec90  5d eb 37      eor $37eb,x
$14:ec93  fe e4 03      inc $03e4,x
$14:ec96  ee e6 3e      inc $3ee6
$14:ec99  34 01         bit $01,x
$14:ec9b  be 18 80      ldx $8018,y
$14:ec9e  50 ce         bvc $ec6e
$14:eca0  67 ff         adc [$ff]
$14:eca2  3f fd 16 fb   and $fb16fd,x
$14:eca6  8e ff c6      stx $c6ff
$14:eca9  bf 75 4f be   lda $be4f75,x
$14:ecad  b3 df         lda ($df,s),y
$14:ecaf  49 e7 81      eor #$81e7
$14:ecb2  c0 7e 18      cpy #$187e
$14:ecb5  21 f8         and ($f8,x)
$14:ecb7  c1 20         cmp ($20,x)
$14:ecb9  10 88         bpl $ec43
$14:ecbb  04 42         tsb $42
$14:ecbd  01 30         ora ($30,x)
$14:ecbf  80 71         bra $ed32
$14:ecc1  ff 18 7f c4   sbc $c47f18,x
$14:ecc5  3f e0 d3 08   and $08d3e0,x
$14:ecc9  ff 82 7f c0   sbc $c07f82,x
$14:eccd  df 84 84 7f   cmp $7f8484,x
$14:ecd1  c1 d0         cmp ($d0,x)
$14:ecd3  77 90         adc [$90],y
$14:ecd5  dc bf 83      jml [$83bf]
$14:ecd8  00 81         brk #$81
$14:ecda  07 7e         ora [$7e]
$14:ecdc  01 86         ora ($86,x)
$14:ecde  bb            tyx
$14:ecdf  d5 7e         cmp $7e,x
$14:ece1  f0 af         beq $ec92
$14:ece3  74 97         stz $97,x
$14:ece5  fb            xce
$14:ece6  4b            phk
$14:ece7  fd e7 2f      sbc $2fe7,x
$14:ecea  f3 2f         sbc ($2f,s),y
$14:ecec  fc 87 fc      jsr ($fc87,x)
$14:ecef  c9 06 48      cmp #$4806
$14:ecf2  44 60 10      mvp $10,$60
$14:ecf5  26 30         rol $30
$14:ecf7  8f d3 8b c1   sta $c18bd3
$14:ecfb  cd e6 ee      cmp $eee6
$14:ecfe  b7 7d         lda [$7d],y
$14:ed00  4f b6 cd ff   eor $ffcdb6
$14:ed04  c2 fd         rep #$fd
$14:ed06  a2 7f c6      ldx #$c67f
$14:ed09  98            tya
$14:ed0a  4f a0 16 45   eor $4516a0
$14:ed0e  50 c4         bvc $ecd4
$14:ed10  9f c2 c9 07   sta $07c9c2,x
$14:ed14  f1 77         sbc ($77),y
$14:ed16  fc 0d b2      jsr ($b20d,x)
$14:ed19  77 a3         adc [$a3],y
$14:ed1b  bc 8b dc      ldy $dc8b,x
$14:ed1e  f5 23         sbc $23,x
$14:ed20  7a            ply
$14:ed21  3e 46 07      rol $0746,x
$14:ed24  f9 83 97      sbc $9783,y
$14:ed27  bb            tyx
$14:ed28  57 cf         eor [$cf],y
$14:ed2a  f6 63         inc $63,x
$14:ed2c  35 58         and $58,x
$14:ed2e  8d 26 03      sta $0326
$14:ed31  7b            tdc
$14:ed32  81 d2         sta ($d2,x)
$14:ed34  e6 7b         inc $7b
$14:ed36  5b            tcd
$14:ed37  c9 cd 1a      cmp #$1acd
$14:ed3a  e1 00         sbc ($00,x)
$14:ed3c  b9 c0 2e      lda $2ec0,y
$14:ed3f  f0 0b         beq $ed4c
$14:ed41  fc 02 fc      jsr ($fc02,x)
$14:ed44  a6 15         ldx $15
$14:ed46  28            plp
$14:ed47  17 42         ora [$42],y
$14:ed49  6f 33 b8 5c   adc $5cb833
$14:ed4d  35 fe         and $fe,x
$14:ed4f  6e cf 32      ror $32cf
$14:ed52  95 de         sta $de,x
$14:ed54  aa            tax
$14:ed55  73 f1         adc ($f1,s),y
$14:ed57  58            cli
$14:ed58  39 b4 cf      and $cfb4,y
$14:ed5b  99 00 c7      sta $c700,y
$14:ed5e  c0 23 30      cpy #$3023
$14:ed61  09 9c 02      ora #$029c
$14:ed64  63 00         adc $00,s
$14:ed66  9c 40 2f      stz $2f40
$14:ed69  90 0e         bcc $ed79
$14:ed6b  7c 02 75      jmp ($7502,x)
$14:ed6e  3c f2 4f      bit $4ff2,x
$14:ed71  3e 9a cc      rol $cc9a,x
$14:ed74  ee 66 b7      inc $b766
$14:ed77  43 a0         eor $a0,s
$14:ed79  f0 7a         beq $edf5
$14:ed7b  d9 0c 4c      cmp $4c0c,y
$14:ed7e  1b            tcs
$14:ed7f  8f 00 e1 c0   sta $c0e100
$14:ed83  28            plp
$14:ed84  70 0b         bvs $ed91
$14:ed86  34 03         bit $03,x
$14:ed88  79 00 1f      adc $1f00,y
$14:ed8b  85 bc         sta $bc
$14:ed8d  ac 34 3b      ldy $3b34
$14:ed90  e6 2f         inc $2f
$14:ed92  f9 97 fc      sbc $fc97,y
$14:ed95  3c c2 5f      bit $5fc2,x
$14:ed98  f0 7b         beq $ee15
$14:ed9a  87 bf         sta [$bf]
$14:ed9c  e1 5e         sbc ($5e,x)
$14:ed9e  b0 e0         bcs $ed80
$14:eda0  0b            phd
$14:eda1  d6 ff         dec $ff,x
$14:eda3  02 ac         cop #$ac
$14:eda5  6f e8 13 f2   adc $f213e8
$14:eda9  90 97         bcc $ed42
$14:edab  b8            clv
$14:edac  f2 47         sbc ($47)
$14:edae  b0 fd         bcs $edad
$14:edb0  41 86         eor ($86,x)
$14:edb2  a0 7d 0f      ldy #$0f7d
$14:edb5  dc 1c 6a      jml [$6a1c]
$14:edb8  00 b0         brk #$b0
$14:edba  1f 94 04 88   ora $880494,x
$14:edbe  24 14         bit $14
$14:edc0  ec f0 6f      cpx $6ff0
$14:edc3  70 3c         bvs $ee01
$14:edc5  dd 8e af      cmp $af8e,x
$14:edc8  e6 db         inc $db
$14:edca  51 bd         eor ($bd),y
$14:edcc  b0 cb         bcs $ed99
$14:edce  64 33         stz $33
$14:edd0  b7 99         lda [$99],y
$14:edd2  74 87         stz $87,x
$14:edd4  f0 c0         beq $ed96
$14:edd6  3f 93 20 fc   and $fc2093,x
$14:edda  cd 02 e5      cmp $e502
$14:eddd  0d 07 fa      ora $fa07
$14:ede0  73 fd         adc ($fd,s),y
$14:ede2  ed 5f f4      sbc $f45f
$14:ede5  93 fe         sta ($fe,s),y
$14:ede7  ec 1e 57      cpx $571e
$14:edea  4f ba 4f 29   eor $294fba
$14:edee  57 82         eor [$82],y
$14:edf0  28            plp
$14:edf1  60            rts
$14:edf2  81 83         sta ($83,x)
$14:edf4  c8            iny
$14:edf5  80 7e         bra $ee75
$14:edf7  20 1f 07      jsr $071f
$14:edfa  00 e1         brk #$e1
$14:edfc  e0 1b 3f      cpx #$3f1b
$14:edff  fc af f7      jsr ($f7af,x)
$14:ee02  56 fb         lsr $fb,x
$14:ee04  6a            ror a
$14:ee05  3d 15 ae      and $ae15,x
$14:ee08  a6 af         ldx $af
$14:ee0a  4d 6e b0      eor $b06e
$14:ee0d  60            rts
$14:ee0e  dc 21 00      jml [$0021]
$14:ee11  82 40 21      brl $0f54
$14:ee14  30 08         bmi $ee1e
$14:ee16  bc 02 5f      ldy $5f02,x
$14:ee19  00 af         brk #$af
$14:ee1b  c0 33 f0      cpy #$f033
$14:ee1e  09 e4 03      ora #$03e4
$14:ee21  25 9f         and $9f
$14:ee23  92 cf         sta ($cf)
$14:ee25  9d e1 47      sta $47e1,x
$14:ee28  bc 63 fe      ldy $fe63,x
$14:ee2b  0b            phd
$14:ee2c  70 cf         bvs $edfd
$14:ee2e  f8            sed
$14:ee2f  23 fe         and $fe,s
$14:ee31  0b            phd
$14:ee32  04 03         tsb $03
$14:ee34  80 0c         bra $ee42
$14:ee36  17 fc         ora [$fc],y
$14:ee38  03 e0         ora $e0,s
$14:ee3a  1e 8d ee      asl $ee8d,x
$14:ee3d  ff 40 5d e0   sbc $e05d40,x
$14:ee41  31 01         and ($01),y
$14:ee43  78            sei
$14:ee44  7e a0 ff      ror $ffa0,x
$14:ee47  38            sec
$14:ee48  67 9e         adc [$9e]
$14:ee4a  31 cf         and ($cf),y
$14:ee4c  98            tya
$14:ee4d  07 fa         ora [$fa]
$14:ee4f  95 fd         sta $fd,x
$14:ee51  d2 7e         cmp ($7e)
$14:ee53  e3 3e         sbc $3e,s
$14:ee55  6b            rtl
$14:ee56  9e 33 df      stz $df33,x
$14:ee59  10 6c         bpl $eec7
$14:ee5b  fb            xce
$14:ee5c  fc e7 fc      jsr ($fce7,x)
$14:ee5f  0b            phd
$14:ee60  fe 01 a7      inc $a701,x
$14:ee63  ef f9 67 d3   sbc $d367f9
$14:ee67  c4 9f         cpy $9f
$14:ee69  fd f2 87      sbc $87f2,x
$14:ee6c  fc e1 fe      jsr ($fee1,x)
$14:ee6f  58            cli
$14:ee70  ff b2 3d d2   sbc $d23db2,x
$14:ee74  9b            txy
$14:ee75  52 b9         eor ($b9)
$14:ee77  da            phx
$14:ee78  ac 76 b6      ldy $b676
$14:ee7b  98            tya
$14:ee7c  ff 48 0a 88   sbc $880a48,x
$14:ee80  66 30         ror $30
$14:ee82  0b            phd
$14:ee83  8c 03 e7      sty $e703
$14:ee86  00 b3         brk #$b3
$14:ee88  c0 23 51      cpy #$5123
$14:ee8b  9b            txy
$14:ee8c  ed 92 2b      sbc $2b92
$14:ee8f  30 af         bmi $ee40
$14:ee91  c3 b5         cmp $b5,s
$14:ee93  74 6c         stz $6c,x
$14:ee95  b5 9a         lda $9a,x
$14:ee97  33 01         and ($01,s),y
$14:ee99  1d 87 9e      ora $9e87,x
$14:ee9c  01 9b         ora ($9b,x)
$14:ee9e  80 75         bra $ef15
$14:eea0  e1 1f         sbc ($1f,x)
$14:eea2  d8            cld
$14:eea3  02 9c         cop #$9c
$14:eea5  3f 2e e0 80   and $80e02e,x
$14:eea9  5d 6e 54      eor $546e,x
$14:eeac  aa            tax
$14:eead  24 5a         bit $5a
$14:eeaf  1f 24 8d 4f   ora $4f8d24,x
$14:eeb3  b8            clv
$14:eeb4  3c dc 66      bit $66dc,x
$14:eeb7  ea            nop
$14:eeb8  5d f7 ea      eor $eaf7,x
$14:eebb  e3 e0         sbc $e0,s
$14:eebd  1b            tcs
$14:eebe  f2 c1         sbc ($c1)
$14:eec0  8e c1 1a      stx $1ac1
$14:eec3  1d d8 04      ora $04d8,x
$14:eec6  da            phx
$14:eec7  11 36         ora ($36),y
$14:eec9  98            tya
$14:eeca  4a            lsr a
$14:eecb  27 1a         and [$1a]
$14:eecd  69 f7 77      adc #$77f7
$14:eed0  3b            tsc
$14:eed1  c9 e4 d8      cmp #$d8e4
$14:eed4  b8            clv
$14:eed5  7a            ply
$14:eed6  4a            lsr a
$14:eed7  3d 22 1f      and $1f22,x
$14:eeda  cf 80 71 e0   cmp $e07180
$14:eede  1c 18 07      trb $0718
$14:eee1  8a            txa
$14:eee2  01 f6         ora ($f6,x)
$14:eee4  80 7f         bra $ef65
$14:eee6  20 1f 88      jsr $881f
$14:eee9  07 c2         ora [$c2]
$14:eeeb  01 5c         ora ($5c,x)
$14:eeed  b1 ee         lda ($ee),y
$14:eeef  78            sei
$14:eef0  fb            xce
$14:eef1  2e 7e 93      rol $937e
$14:eef4  bf 09 ff 44   lda $44ff09,x
$14:eef8  7f d7 3f e6   adc $e63fd7,x
$14:eefc  8f 79 80 0f   sta $0f8079
$14:ef00  dd 02 00      cmp $0002,x
$14:ef03  31 01         and ($01),y
$14:ef05  8f 90 bc 27   sta $27bc90
$14:ef09  e3 e9         sbc $e9,s
$14:ef0b  fd c1 fe      sbc $fec1,x
$14:ef0e  b0 df         bcs $eeef
$14:ef10  3c 7c e6      bit $e67c,x
$14:ef13  1d 69 f7      ora $f769,x
$14:ef16  2a            rol a
$14:ef17  7d ab bf      adc $bfab,x
$14:ef1a  d5 54         cmp $54,x
$14:ef1c  e1 00         sbc ($00,x)
$14:ef1e  81 20         sta ($20,x)
$14:ef20  15 0a         ora $0a,x
$14:ef22  05 f2         ora $f2
$14:ef24  e6 60         inc $60
$14:ef26  36 b2         rol $b2,x
$14:ef28  9c cc 0e      stz $0ecc
$14:ef2b  a5 46         lda $46
$14:ef2d  a4 52         ldy $52
$14:ef2f  34 b8         bit $b8,x
$14:ef31  1c 56 0a      trb $0a56
$14:ef34  a9 24 bf      lda #$bf24
$14:ef37  c0 3b ce      cpy #$ce3b
$14:ef3a  81 dc         sta ($dc,x)
$14:ef3c  c0 36 f0      cpy #$f036
$14:ef3f  0b            phd
$14:ef40  f4 02 fa      pea $fa02
$14:ef43  4e 08 06      lsr $0608
$14:ef46  af c7 4f e7   lda $e74fc7
$14:ef4a  c5 63         cmp $63
$14:ef4c  95 ab         sta $ab,x
$14:ef4e  c5 97         cmp $97
$14:ef50  cb            wai
$14:ef51  a9 c4 d2      lda #$d2c4
$14:ef54  a0 7b 7a      ldy #$7a7b
$14:ef57  3c 72 01      bit $0172,x
$14:ef5a  30 80         bmi $eedc
$14:ef5c  78            sei
$14:ef5d  e0 18 78      cpx #$7818
$14:ef60  04 6a         tsb $6a
$14:ef62  01 76         ora ($76,x)
$14:ef64  74 1e         stz $1e,x
$14:ef66  7b            tdc
$14:ef67  3f 20 9f d7   and $d79f20,x
$14:ef6b  6f fa ef 3e   adc $3eeffa
$14:ef6f  93 cf         sta ($cf,s),y
$14:ef71  19 ff 5c      ora $5cff,y
$14:ef74  7f cf d0 b0   adc $b0d0cf,x
$14:ef78  40            rti
$14:ef79  38            sec
$14:ef7a  10 07         bpl $ef83
$14:ef7c  f8            sed
$14:ef7d  46 18         lsr $18
$14:ef7f  82 09 49      brl $388b
$14:ef82  ff 03 7f c0   sbc $c07f03,x
$14:ef86  08            php
$14:ef87  d3 7b         cmp ($7b,s),y
$14:ef89  80 30         bra $efbb
$14:ef8b  00 4e         brk #$4e
$14:ef8d  2e 0d ff      rol $ff0d
$14:ef90  e0 b8 03      cpx #$03b8
$14:ef93  00 0e         brk #$0e
$14:ef95  ff ef b8 0e   sbc $0eb8ef,x
$14:ef99  00 0f         brk #$0f
$14:ef9b  ff e0 b8 00   sbc $00b8e0,x
$14:ef9f  f0 10         beq $efb1
$14:efa1  ff ec b8 07   sbc $07b8ec,x
$14:efa5  00 11         brk #$11
$14:efa7  ff eb b8 01   sbc $01b8eb,x
$14:efab  00 12         brk #$12
$14:efad  ff e0 b8 06   sbc $06b8e0,x
$14:efb1  15 13         ora $13,x
$14:efb3  ff e0 b8 07   sbc $07b8e0,x
$14:efb7  a8            tay
$14:efb8  14 ff         trb $ff
$14:efba  e0 b8 07      cpx #$07b8
$14:efbd  a8            tay
$14:efbe  18            clc
$14:efbf  00 00         brk #$00
$14:efc1  2f 32 65 7f   and $7f6532
$14:efc5  98            tya
$14:efc6  b2 cb         lda ($cb)
$14:efc8  e5 fc         sbc $fc
$14:efca  19 32 4c      ora $4c32,y
$14:efcd  65 72         adc $72
$14:efcf  7f 8c 98 a5   adc $a5988c,x
$14:efd3  b2 bf         lda ($bf)
$14:efd5  cb            wai
$14:efd6  d8            cld
$14:efd7  e5 f2         sbc $f2
$14:efd9  fc 3e 0f      jsr ($0f3e,x)
$14:efdc  00 10         brk #$10
$14:efde  02 10         cop #$10
$14:efe0  0a            asl a
$14:efe1  10 ff         bpl $efe2
$14:efe3  00 02         brk #$02
$14:efe5  10 00         bpl $efe7
$14:efe7  00 2a         brk #$2a
$14:efe9  10 aa         bpl $ef95
$14:efeb  11 fd         ora ($fd),y
$14:efed  12 4d         ora ($4d)
$14:efef  14 97         trb $97
$14:eff1  15 b2         ora $b2,x
$14:eff3  19 e6 1a      ora $1ae6,y
$14:eff6  3f 1c ac 1e   and $1eac1c,x
$14:effa  ce 1e e4      dec $e41e
$14:effd  1e f4 1e      asl $1ef4,x
$14:f000  09 1f 11      ora #$111f
$14:f003  1f 19 1f 2d   ora $2d1f19,x
$14:f007  1f fa 05 ea   ora $ea05fa,x
$14:f00b  00 e0         brk #$e0
$14:f00d  00 e7         brk #$e7
$14:f00f  1b            tcs
$14:f010  ed 96 e5      sbc $e596
$14:f013  f0 e1         beq $eff6
$14:f015  0a            asl a
$14:f016  f5 80         sbc $80,x
$14:f018  7f 7f f7 03   adc $03f77f,x
$14:f01c  aa            tax
$14:f01d  00 e3         brk #$e3
$14:f01f  18            clc
$14:f020  46 40         lsr $40
$14:f022  04 5d         tsb $5d
$14:f024  ad 14 ae      lda $ae14
$14:f027  0c ab c9      tsb $c9ab
$14:f02a  a9 ab c9      lda #$c9ab
$14:f02d  04 6d         tsb $6d
$14:f02f  ad 08 5d      lda $5d08
$14:f032  ae 18 c8      ldx $c818
$14:f035  0c ab c9      tsb $c9ab
$14:f038  b0 ae         bcs $efe8
$14:f03a  c9 04 b1      cmp #$b104
$14:f03d  08            php
$14:f03e  b2 18         lda ($18)
$14:f040  c8            iny
$14:f041  0c b0 ae      tsb $aeb0
$14:f044  b0 b2         bcs $eff8
$14:f046  c9 04 aa      cmp #$aa04
$14:f049  08            php
$14:f04a  ab            plb
$14:f04b  48            pha
$14:f04c  c8            iny
$14:f04d  0c c9 04      tsb $04c9
$14:f050  ad 08 ae      lda $ae08
$14:f053  18            clc
$14:f054  c8            iny
$14:f055  0c ab c9      tsb $c9ab
$14:f058  a9 ab c9      lda #$c9ab
$14:f05b  04 ad         tsb $ad
$14:f05d  08            php
$14:f05e  ae 18 c8      ldx $c818
$14:f061  0c ab c9      tsb $c9ab
$14:f064  b0 ae         bcs $f014
$14:f066  c9 04 b1      cmp #$b104
$14:f069  08            php
$14:f06a  b2 18         lda ($18)
$14:f06c  c8            iny
$14:f06d  0c b0 ae      tsb $aeb0
$14:f070  b0 b2         bcs $f024
$14:f072  c9 04 aa      cmp #$aa04
$14:f075  08            php
$14:f076  ab            plb
$14:f077  48            pha
$14:f078  c8            iny
$14:f079  0c c9 e4      tsb $e4c9
$14:f07c  ea            nop
$14:f07d  f4 e0 02      pea $02e0
$14:f080  ab            plb
$14:f081  18            clc
$14:f082  c8            iny
$14:f083  0c ae 30      tsb $30ae
$14:f086  c9 0c b0      cmp #$b00c
$14:f089  18            clc
$14:f08a  c8            iny
$14:f08b  0c b2 30      tsb $30b2
$14:f08e  c9 0c ab      cmp #$ab0c
$14:f091  18            clc
$14:f092  c8            iny
$14:f093  0c ae 30      tsb $30ae
$14:f096  c9 0c b0      cmp #$b00c
$14:f099  18            clc
$14:f09a  c8            iny
$14:f09b  0c b2 30      tsb $30b2
$14:f09e  c9 e3 06      cmp #$06e3
$14:f0a1  0a            asl a
$14:f0a2  0c 0c 59      tsb $590c
$14:f0a5  bc 18 c8      ldy $c818,x
$14:f0a8  0c 5b bb      tsb $bb5b
$14:f0ab  30 c9         bmi $f076
$14:f0ad  0c 5d ba      tsb $ba5d
$14:f0b0  18            clc
$14:f0b1  c8            iny
$14:f0b2  0c b7 30      tsb $30b7
$14:f0b5  c9 0c 59      cmp #$590c
$14:f0b8  bc 18 c8      ldy $c818,x
$14:f0bb  0c 5b bb      tsb $bb5b
$14:f0be  30 c9         bmi $f089
$14:f0c0  0c ba 18      tsb $18ba
$14:f0c3  c8            iny
$14:f0c4  0c b7 30      tsb $30b7
$14:f0c7  c9 ea 00      cmp #$00ea
$14:f0ca  e4 e3         cpx $e3
$14:f0cc  30 46         bmi $f114
$14:f0ce  40            rti
$14:f0cf  ed 8c e0      sbc $e08c
$14:f0d2  00 0c         brk #$0c
$14:f0d4  5c b0 0c 5c   jml $5c0cb0
$14:f0d8  b3 b0         lda ($b0,s),y
$14:f0da  b5 b0         lda $b0,x
$14:f0dc  b7 b6         lda [$b6],y
$14:f0de  b5 b3         lda $b3,x
$14:f0e0  c9 3c 5a      cmp #$5a3c
$14:f0e3  b0 0c         bcs $f0f1
$14:f0e5  c9 0c 5c      cmp #$5c0c
$14:f0e8  b0 b3         bcs $f09d
$14:f0ea  b0 b5         bcs $f0a1
$14:f0ec  b0 b7         bcs $f0a5
$14:f0ee  b6 b5         ldx $b5,y
$14:f0f0  b3 c9         lda ($c9,s),y
$14:f0f2  3c 5a b0      bit $b05a,x
$14:f0f5  0c c9 0c      tsb $0cc9
$14:f0f8  5b            tcd
$14:f0f9  b5 0c         lda $0c,x
$14:f0fb  5c b8 b5 ba   jml $bab5b8
$14:f0ff  b5 0c         lda $0c,x
$14:f101  5b            tcd
$14:f102  bc bb ba      ldy $babb,x
$14:f105  b8            clv
$14:f106  c9 3c 59      cmp #$593c
$14:f109  b5 0c         lda $0c,x
$14:f10b  c9 0c 5b      cmp #$5b0c
$14:f10e  b5 0c         lda $0c,x
$14:f110  5c b8 b5 ba   jml $bab5b8
$14:f114  b5 0c         lda $0c,x
$14:f116  5b            tcd
$14:f117  bc bb ba      ldy $babb,x
$14:f11a  b8            clv
$14:f11b  c9 3c 59      cmp #$593c
$14:f11e  b5 0c         lda $0c,x
$14:f120  c9 e0 03      cmp #$03e0
$14:f123  ed 78 0c      sbc $0c78
$14:f126  4e b2 b2      lsr $b2b2
$14:f129  0c 4d b2      tsb $b24d
$14:f12c  b2 b2         lda ($b2)
$14:f12e  0c 4e b2      tsb $b24e
$14:f131  0c 4d b2      tsb $b24d
$14:f134  b2 b2         lda ($b2)
$14:f136  c9 b0 3c      cmp #$3cb0
$14:f139  c9 0c 4e      cmp #$4e0c
$14:f13c  b2 b2         lda ($b2)
$14:f13e  0c 4d b2      tsb $b24d
$14:f141  b2 b2         lda ($b2)
$14:f143  0c 4e b2      tsb $b24e
$14:f146  0c 4d b2      tsb $b24d
$14:f149  b2 b2         lda ($b2)
$14:f14b  c9 3c b0      cmp #$b03c
$14:f14e  0c c9 0c      tsb $0cc9
$14:f151  4e b2 b2      lsr $b2b2
$14:f154  0c 4d b2      tsb $b24d
$14:f157  b2 b2         lda ($b2)
$14:f159  b2 b2         lda ($b2)
$14:f15b  b2 0c         lda ($0c)
$14:f15d  4e b2 0c      lsr $0cb2
$14:f160  5d c8 18      eor $18c8,x
$14:f163  b1 18         lda ($18),y
$14:f165  5e b0 18      lsr $18b0,x
$14:f168  5d af 0c      eor $0caf,x
$14:f16b  5e ae c8      lsr $c8ae,x
$14:f16e  18            clc
$14:f16f  5d ad 18      eor $18ad,x
$14:f172  5e ac 18      lsr $18ac,x
$14:f175  5d ab 0c      eor $0cab,x
$14:f178  5e aa c8      lsr $c8aa,x
$14:f17b  18            clc
$14:f17c  5d a9 18      eor $18a9,x
$14:f17f  5e a8 24      lsr $24a8,x
$14:f182  5d a7 60      eor $60a7,x
$14:f185  c9 00 00      cmp #$0000
$14:f188  ea            nop
$14:f189  00 e0         brk #$e0
$14:f18b  00 ed         brk #$ed
$14:f18d  78            sei
$14:f18e  e1 09         sbc ($09,x)
$14:f190  e3 18         sbc $18,s
$14:f192  1e 20 ea      asl $ea20,x
$14:f195  f4 04 5d      pea $5d04
$14:f198  ad 14 ae      lda $ae14
$14:f19b  0c ab c9      tsb $c9ab
$14:f19e  a9 ab c9      lda #$c9ab
$14:f1a1  04 6d         tsb $6d
$14:f1a3  ad 08 5d      lda $5d08
$14:f1a6  ae 18 c8      ldx $c818
$14:f1a9  0c ab c9      tsb $c9ab
$14:f1ac  b0 ae         bcs $f15c
$14:f1ae  c9 04 b1      cmp #$b104
$14:f1b1  08            php
$14:f1b2  b2 18         lda ($18)
$14:f1b4  c8            iny
$14:f1b5  0c b0 ae      tsb $aeb0
$14:f1b8  b0 b2         bcs $f16c
$14:f1ba  c9 04 aa      cmp #$aa04
$14:f1bd  08            php
$14:f1be  ab            plb
$14:f1bf  48            pha
$14:f1c0  c8            iny
$14:f1c1  0c c9 04      tsb $04c9
$14:f1c4  ad 08 ae      lda $ae08
$14:f1c7  18            clc
$14:f1c8  c8            iny
$14:f1c9  0c ab c9      tsb $c9ab
$14:f1cc  a9 ab c9      lda #$c9ab
$14:f1cf  04 ad         tsb $ad
$14:f1d1  08            php
$14:f1d2  ae 18 c8      ldx $c818
$14:f1d5  0c ab c9      tsb $c9ab
$14:f1d8  b0 ae         bcs $f188
$14:f1da  c9 04 b1      cmp #$b104
$14:f1dd  08            php
$14:f1de  b2 18         lda ($18)
$14:f1e0  c8            iny
$14:f1e1  0c b0 ae      tsb $aeb0
$14:f1e4  b0 b2         bcs $f198
$14:f1e6  c9 04 aa      cmp #$aa04
$14:f1e9  08            php
$14:f1ea  ab            plb
$14:f1eb  48            pha
$14:f1ec  c8            iny
$14:f1ed  0c c9 e4      tsb $e4c9
$14:f1f0  e0 02 9f      cpx #$9f02
$14:f1f3  18            clc
$14:f1f4  c8            iny
$14:f1f5  0c a2 30      tsb $30a2
$14:f1f8  c9 0c a4      cmp #$a40c
$14:f1fb  18            clc
$14:f1fc  c8            iny
$14:f1fd  0c a6 30      tsb $30a6
$14:f200  c9 0c 9f      cmp #$9f0c
$14:f203  18            clc
$14:f204  c8            iny
$14:f205  0c a2 30      tsb $30a2
$14:f208  c9 0c a4      cmp #$a40c
$14:f20b  18            clc
$14:f20c  c8            iny
$14:f20d  0c a6 30      tsb $30a6
$14:f210  c9 e3 0a      cmp #$0ae3
$14:f213  0a            asl a
$14:f214  0c 0c ab      tsb $ab0c
$14:f217  18            clc
$14:f218  c8            iny
$14:f219  0c aa 30      tsb $30aa
$14:f21c  c9 0c a9      cmp #$a90c
$14:f21f  18            clc
$14:f220  c8            iny
$14:f221  0c a6 30      tsb $30a6
$14:f224  c9 0c ab      cmp #$ab0c
$14:f227  18            clc
$14:f228  c8            iny
$14:f229  0c aa 30      tsb $30aa
$14:f22c  c9 0c a9      cmp #$a90c
$14:f22f  18            clc
$14:f230  c8            iny
$14:f231  0c a6 30      tsb $30a6
$14:f234  c9 ed 6e      cmp #$6eed
$14:f237  e0 00 0c      cpx #$0c00
$14:f23a  b0 b3         bcs $f1ef
$14:f23c  b0 b5         bcs $f1f3
$14:f23e  b0 b7         bcs $f1f7
$14:f240  b6 b5         ldx $b5,y
$14:f242  b3 c9         lda ($c9,s),y
$14:f244  3c b0 0c      bit $0cb0,x
$14:f247  c9 b0 b3      cmp #$b3b0
$14:f24a  b0 b5         bcs $f201
$14:f24c  b0 b7         bcs $f205
$14:f24e  b6 b5         ldx $b5,y
$14:f250  b3 c9         lda ($c9,s),y
$14:f252  3c b0 0c      bit $0cb0,x
$14:f255  c9 b5 b8      cmp #$b8b5
$14:f258  b5 ba         lda $ba,x
$14:f25a  b5 bc         lda $bc,x
$14:f25c  bb            tyx
$14:f25d  ba            tsx
$14:f25e  b8            clv
$14:f25f  c9 3c b5      cmp #$b53c
$14:f262  0c c9 b5      tsb $b5c9
$14:f265  b8            clv
$14:f266  b5 ba         lda $ba,x
$14:f268  b5 bc         lda $bc,x
$14:f26a  bb            tyx
$14:f26b  ba            tsx
$14:f26c  b8            clv
$14:f26d  c9 3c 59      cmp #$593c
$14:f270  b5 0c         lda $0c,x
$14:f272  c9 ea 00      cmp #$00ea
$14:f275  ed 64 e0      sbc $e064
$14:f278  03 0c         ora $0c,s
$14:f27a  4e ad ad      lsr $adad
$14:f27d  0c 4d ad      tsb $ad4d
$14:f280  ad ad 0c      lda $0cad
$14:f283  4e ad 0c      lsr $0cad
$14:f286  4d ad ad      eor $adad
$14:f289  ad c9 ab      lda $abc9
$14:f28c  3c c9 0c      bit $0cc9,x
$14:f28f  4e ad ad      lsr $adad
$14:f292  0c 4d ad      tsb $ad4d
$14:f295  ad ad 0c      lda $0cad
$14:f298  4e ad 0c      lsr $0cad
$14:f29b  4d ad ad      eor $adad
$14:f29e  ad c9 3c      lda $3cc9
$14:f2a1  ab            plb
$14:f2a2  0c c9 0c      tsb $0cc9
$14:f2a5  4e ad ad      lsr $adad
$14:f2a8  0c 4d ad      tsb $ad4d
$14:f2ab  ad ad ad      lda $adad
$14:f2ae  ad ad 0c      lda $0cad
$14:f2b1  4e ad 0c      lsr $0cad
$14:f2b4  5d c8 18      eor $18c8,x
$14:f2b7  ac 18 5e      ldy $5e18
$14:f2ba  ab            plb
$14:f2bb  18            clc
$14:f2bc  5d aa 0c      eor $0caa,x
$14:f2bf  5e a9 c8      lsr $c8a9,x
$14:f2c2  18            clc
$14:f2c3  5d a8 18      eor $18a8,x
$14:f2c6  5e a7 18      lsr $18a7,x
$14:f2c9  5d a6 0c      eor $0ca6,x
$14:f2cc  5e a5 c8      lsr $c8a5,x
$14:f2cf  18            clc
$14:f2d0  5d a4 18      eor $18a4,x
$14:f2d3  5e a3 24      lsr $24a3,x
$14:f2d6  5d a2 60      eor $60a2,x
$14:f2d9  c9 00 ea      cmp #$ea00
$14:f2dc  f4 e0 01      pea $01e0
$14:f2df  ed b7 e1      sbc $e1b7
$14:f2e2  0a            asl a
$14:f2e3  e3 18         sbc $18,s
$14:f2e5  46 7f         lsr $7f
$14:f2e7  18            clc
$14:f2e8  5e 93 3c      lsr $3c93,x
$14:f2eb  c9 0c 5d      cmp #$5d0c
$14:f2ee  93 54         sta ($54,s),y
$14:f2f0  c9 0c 93      cmp #$930c
$14:f2f3  54 c9 0c      mvn $0c,$c9
$14:f2f6  93 54         sta ($54,s),y
$14:f2f8  c9 0c 93      cmp #$930c
$14:f2fb  54 c9 0c      mvn $0c,$c9
$14:f2fe  93 54         sta ($54,s),y
$14:f300  c9 0c 93      cmp #$930c
$14:f303  54 c9 0c      mvn $0c,$c9
$14:f306  93 c9         sta ($c9,s),y
$14:f308  18            clc
$14:f309  5d 8e 96      eor $968e,x
$14:f30c  18            clc
$14:f30d  5e 91 0c      lsr $0c91,x
$14:f310  5d 95 18      eor $1895,x
$14:f313  5e 93 0c      lsr $0c93,x
$14:f316  c9 18 5d      cmp #$5d18
$14:f319  9f 8e 0c 91   sta $910c8e,x
$14:f31d  18            clc
$14:f31e  93 24         sta ($24,s),y
$14:f320  c9 0c 9f      cmp #$9f0c
$14:f323  9a            txs
$14:f324  9d 18 5e      sta $5e18,x
$14:f327  93 0c         sta ($0c,s),y
$14:f329  c9 18 5d      cmp #$5d18
$14:f32c  9f 8e 0c 91   sta $910c8e,x
$14:f330  18            clc
$14:f331  93 24         sta ($24,s),y
$14:f333  c9 0c 9f      cmp #$9f0c
$14:f336  9a            txs
$14:f337  9d 18 5e      sta $5e18,x
$14:f33a  93 0c         sta ($0c,s),y
$14:f33c  c9 18 5d      cmp #$5d18
$14:f33f  9f 8e 0c 91   sta $910c8e,x
$14:f343  18            clc
$14:f344  93 24         sta ($24,s),y
$14:f346  c9 0c 9f      cmp #$9f0c
$14:f349  9a            txs
$14:f34a  9d 18 5e      sta $5e18,x
$14:f34d  93 0c         sta ($0c,s),y
$14:f34f  c9 18 5d      cmp #$5d18
$14:f352  9f 8e 0c 91   sta $910c8e,x
$14:f356  18            clc
$14:f357  93 3c         sta ($3c,s),y
$14:f359  c9 ed aa      cmp #$aaed
$14:f35c  0c 5e 98      tsb $985e
$14:f35f  98            tya
$14:f360  0c 5d 98      tsb $985d
$14:f363  98            tya
$14:f364  98            tya
$14:f365  0c 5e 98      tsb $985e
$14:f368  0c 5d 98      tsb $985d
$14:f36b  98            tya
$14:f36c  98            tya
$14:f36d  0c 5e 98      tsb $985e
$14:f370  0c 5d 98      tsb $985d
$14:f373  98            tya
$14:f374  98            tya
$14:f375  0c 5e 98      tsb $985e
$14:f378  0c 5d 98      tsb $985d
$14:f37b  98            tya
$14:f37c  98            tya
$14:f37d  c9 98 98      cmp #$9898
$14:f380  98            tya
$14:f381  0c 5e 98      tsb $985e
$14:f384  0c 5d 98      tsb $985d
$14:f387  98            tya
$14:f388  98            tya
$14:f389  0c 5e 98      tsb $985e
$14:f38c  0c 5d 98      tsb $985d
$14:f38f  98            tya
$14:f390  98            tya
$14:f391  0c 5e 98      tsb $985e
$14:f394  0c 5d 98      tsb $985d
$14:f397  98            tya
$14:f398  0c 5e 9d      tsb $9d5e
$14:f39b  9d 0c 5d      sta $5d0c,x
$14:f39e  9d 9d 9d      sta $9d9d,x
$14:f3a1  0c 5e 9d      tsb $9d5e
$14:f3a4  0c 5d 9d      tsb $9d5d
$14:f3a7  9d 9d 0c      sta $0c9d,x
$14:f3aa  5e 9d 0c      lsr $0c9d,x
$14:f3ad  5d 9d 9d      eor $9d9d,x
$14:f3b0  9d 0c 5e      sta $5e0c,x
$14:f3b3  9d 0c 5d      sta $5d0c,x
$14:f3b6  9d 9d 9d      sta $9d9d,x
$14:f3b9  c9 9d 9d      cmp #$9d9d
$14:f3bc  9d 0c 5e      sta $5e0c,x
$14:f3bf  9d 0c 5d      sta $5d0c,x
$14:f3c2  9d 9d 9d      sta $9d9d,x
$14:f3c5  0c 5e 9d      tsb $9d5e
$14:f3c8  0c 5d 9d      tsb $9d5d
$14:f3cb  9d 9d 0c      sta $0c9d,x
$14:f3ce  5e 9d 0c      lsr $0c9d,x
$14:f3d1  5d 9d 9d      eor $9d9d,x
$14:f3d4  9d 18 5e      sta $5e18,x
$14:f3d7  93 3c         sta ($3c,s),y
$14:f3d9  c9 0c 5d      cmp #$5d0c
$14:f3dc  9f 0c 5e 93   sta $935e0c,x
$14:f3e0  0c 5d 93      tsb $935d
$14:f3e3  24 c9         bit $c9
$14:f3e5  0c 9f c9      tsb $c99f
$14:f3e8  9a            txs
$14:f3e9  18            clc
$14:f3ea  5e 93 3c      lsr $3c93,x
$14:f3ed  c9 0c 5d      cmp #$5d0c
$14:f3f0  9f 0c 5e 93   sta $935e0c,x
$14:f3f4  0c 5d 93      tsb $935d
$14:f3f7  24 c9         bit $c9
$14:f3f9  0c 9f c9      tsb $c99f
$14:f3fc  9a            txs
$14:f3fd  18            clc
$14:f3fe  5e 93 3c      lsr $3c93,x
$14:f401  c9 0c 9f      cmp #$9f0c
$14:f404  c8            iny
$14:f405  18            clc
$14:f406  5d 9e 18      eor $189e,x
$14:f409  5e 9d 18      lsr $189d,x
$14:f40c  5d 9c 0c      eor $0c9c,x
$14:f40f  5e 9b c8      lsr $c89b,x
$14:f412  18            clc
$14:f413  5d 9a 18      eor $189a,x
$14:f416  5e 99 18      lsr $1899,x
$14:f419  5d 98 0c      eor $0c98,x
$14:f41c  5e 97 c8      lsr $c897,x
$14:f41f  18            clc
$14:f420  5d 96 18      eor $1896,x
$14:f423  5e 95 24      lsr $2495,x
$14:f426  5d 94 60      eor $6094,x
$14:f429  c9 00 e0      cmp #$e000
$14:f42c  04 ea         tsb $ea
$14:f42e  f4 ed a0      pea $a0ed
$14:f431  e1 0b         sbc ($0b,x)
$14:f433  e3 30         sbc $30,s
$14:f435  5a            phy
$14:f436  1e 04 5d      asl $5d04,x
$14:f439  ad 14 ae      lda $ae14
$14:f43c  0c ab c9      tsb $c9ab
$14:f43f  a9 ab c9      lda #$c9ab
$14:f442  04 6d         tsb $6d
$14:f444  ad 08 5d      lda $5d08
$14:f447  ae 18 c8      ldx $c818
$14:f44a  0c ab c9      tsb $c9ab
$14:f44d  b0 ae         bcs $f3fd
$14:f44f  c9 04 b1      cmp #$b104
$14:f452  08            php
$14:f453  b2 18         lda ($18)
$14:f455  c8            iny
$14:f456  0c b0 ae      tsb $aeb0
$14:f459  b0 b2         bcs $f40d
$14:f45b  c9 04 aa      cmp #$aa04
$14:f45e  08            php
$14:f45f  ab            plb
$14:f460  48            pha
$14:f461  c8            iny
$14:f462  0c c9 04      tsb $04c9
$14:f465  ad 08 ae      lda $ae08
$14:f468  18            clc
$14:f469  c8            iny
$14:f46a  0c ab c9      tsb $c9ab
$14:f46d  a9 ab c9      lda #$c9ab
$14:f470  04 ad         tsb $ad
$14:f472  08            php
$14:f473  ae 18 c8      ldx $c818
$14:f476  0c ab c9      tsb $c9ab
$14:f479  b0 ae         bcs $f429
$14:f47b  c9 04 b1      cmp #$b104
$14:f47e  08            php
$14:f47f  b2 18         lda ($18)
$14:f481  c8            iny
$14:f482  0c b0 ae      tsb $aeb0
$14:f485  b0 b2         bcs $f439
$14:f487  c9 04 aa      cmp #$aa04
$14:f48a  08            php
$14:f48b  ab            plb
$14:f48c  48            pha
$14:f48d  c8            iny
$14:f48e  0c c9 e0      tsb $e0c9
$14:f491  02 ab         cop #$ab
$14:f493  18            clc
$14:f494  c8            iny
$14:f495  0c ae 30      tsb $30ae
$14:f498  c9 0c b0      cmp #$b00c
$14:f49b  18            clc
$14:f49c  c8            iny
$14:f49d  0c b2 30      tsb $30b2
$14:f4a0  c9 0c ab      cmp #$ab0c
$14:f4a3  18            clc
$14:f4a4  c8            iny
$14:f4a5  0c ae 30      tsb $30ae
$14:f4a8  c9 0c b0      cmp #$b00c
$14:f4ab  18            clc
$14:f4ac  c8            iny
$14:f4ad  0c b2 30      tsb $30b2
$14:f4b0  c9 0c bc      cmp #$bc0c
$14:f4b3  18            clc
$14:f4b4  c8            iny
$14:f4b5  0c bb 30      tsb $30bb
$14:f4b8  c9 0c ba      cmp #$ba0c
$14:f4bb  18            clc
$14:f4bc  c8            iny
$14:f4bd  0c b7 30      tsb $30b7
$14:f4c0  c9 0c bc      cmp #$bc0c
$14:f4c3  18            clc
$14:f4c4  c8            iny
$14:f4c5  0c bb 30      tsb $30bb
$14:f4c8  c9 0c ba      cmp #$ba0c
$14:f4cb  18            clc
$14:f4cc  c8            iny
$14:f4cd  0c b7 30      tsb $30b7
$14:f4d0  c9 ed 96      cmp #$96ed
$14:f4d3  e0 00 0c      cpx #$0c00
$14:f4d6  b0 b3         bcs $f48b
$14:f4d8  b0 b5         bcs $f48f
$14:f4da  b0 b7         bcs $f493
$14:f4dc  b6 b5         ldx $b5,y
$14:f4de  b3 c9         lda ($c9,s),y
$14:f4e0  3c b0 0c      bit $0cb0,x
$14:f4e3  c9 b0 b3      cmp #$b3b0
$14:f4e6  b0 b5         bcs $f49d
$14:f4e8  b0 b7         bcs $f4a1
$14:f4ea  b6 b5         ldx $b5,y
$14:f4ec  b3 c9         lda ($c9,s),y
$14:f4ee  3c b0 0c      bit $0cb0,x
$14:f4f1  c9 b5 b8      cmp #$b8b5
$14:f4f4  b5 ba         lda $ba,x
$14:f4f6  b5 bc         lda $bc,x
$14:f4f8  bb            tyx
$14:f4f9  ba            tsx
$14:f4fa  b8            clv
$14:f4fb  c9 3c b5      cmp #$b53c
$14:f4fe  0c c9 b5      tsb $b5c9
$14:f501  b8            clv
$14:f502  b5 ba         lda $ba,x
$14:f504  b5 bc         lda $bc,x
$14:f506  bb            tyx
$14:f507  ba            tsx
$14:f508  b8            clv
$14:f509  c9 3c b5      cmp #$b53c
$14:f50c  0c c9 ea      tsb $eac9
$14:f50f  f4 ed 8c      pea $8ced
$14:f512  e0 03 0c      cpx #$0c03
$14:f515  5e b2 b2      lsr $b2b2,x
$14:f518  0c 5d b2      tsb $b25d
$14:f51b  b2 b2         lda ($b2)
$14:f51d  0c 5e b2      tsb $b25e
$14:f520  0c 5d b2      tsb $b25d
$14:f523  b2 b2         lda ($b2)
$14:f525  c9 b0 3c      cmp #$3cb0
$14:f528  c9 0c 5e      cmp #$5e0c
$14:f52b  b2 b2         lda ($b2)
$14:f52d  0c 5d b2      tsb $b25d
$14:f530  b2 b2         lda ($b2)
$14:f532  0c 5e b2      tsb $b25e
$14:f535  0c 5d b2      tsb $b25d
$14:f538  b2 b2         lda ($b2)
$14:f53a  c9 3c b0      cmp #$b03c
$14:f53d  0c c9 0c      tsb $0cc9
$14:f540  5e b2 b2      lsr $b2b2,x
$14:f543  0c 5d b2      tsb $b25d
$14:f546  b2 b2         lda ($b2)
$14:f548  b2 b2         lda ($b2)
$14:f54a  b2 0c         lda ($0c)
$14:f54c  5e b2 c8      lsr $c8b2,x
$14:f54f  18            clc
$14:f550  5d b1 18      eor $18b1,x
$14:f553  5e b0 18      lsr $18b0,x
$14:f556  5d af 0c      eor $0caf,x
$14:f559  5e ae c8      lsr $c8ae,x
$14:f55c  18            clc
$14:f55d  5d ad 18      eor $18ad,x
$14:f560  5e ac 18      lsr $18ac,x
$14:f563  5d ab 0c      eor $0cab,x
$14:f566  5e aa c8      lsr $c8aa,x
$14:f569  18            clc
$14:f56a  5d a9 18      eor $18a9,x
$14:f56d  5e a8 24      lsr $24a8,x
$14:f570  5d a7 60      eor $60a7,x
$14:f573  c9 00 ed      cmp #$ed00
$14:f576  8c e1 09      sty $09e1
$14:f579  0c 5d cc      tsb $cc5d
$14:f57c  0c 5b cc      tsb $cc5b
$14:f57f  0c 5d cc      tsb $cc5d
$14:f582  0c 59 cc      tsb $cc59
$14:f585  0c 5d cc      tsb $cc5d
$14:f588  0c 5b cc      tsb $cc5b
$14:f58b  0c 5d cc      tsb $cc5d
$14:f58e  0c 59 cc      tsb $cc59
$14:f591  0c 5d cc      tsb $cc5d
$14:f594  0c 5b cc      tsb $cc5b
$14:f597  0c 5d cc      tsb $cc5d
$14:f59a  0c 59 cc      tsb $cc59
$14:f59d  0c 5d cc      tsb $cc5d
$14:f5a0  0c 5b cc      tsb $cc5b
$14:f5a3  0c 5d cc      tsb $cc5d
$14:f5a6  0c 59 cc      tsb $cc59
$14:f5a9  0c 5d cc      tsb $cc5d
$14:f5ac  0c 5b cc      tsb $cc5b
$14:f5af  0c 5d cc      tsb $cc5d
$14:f5b2  0c 59 cc      tsb $cc59
$14:f5b5  0c 5d cc      tsb $cc5d
$14:f5b8  0c 5b cc      tsb $cc5b
$14:f5bb  0c 5d cc      tsb $cc5d
$14:f5be  0c 59 cc      tsb $cc59
$14:f5c1  0c 5d cc      tsb $cc5d
$14:f5c4  0c 5b cc      tsb $cc5b
$14:f5c7  0c 5d cc      tsb $cc5d
$14:f5ca  0c 59 cc      tsb $cc59
$14:f5cd  0c 5d cc      tsb $cc5d
$14:f5d0  0c 5b cc      tsb $cc5b
$14:f5d3  0c 5d cc      tsb $cc5d
$14:f5d6  0c 59 cc      tsb $cc59
$14:f5d9  0c 5d cc      tsb $cc5d
$14:f5dc  0c 5b cc      tsb $cc5b
$14:f5df  0c 5d cc      tsb $cc5d
$14:f5e2  0c 59 cc      tsb $cc59
$14:f5e5  0c 5d cc      tsb $cc5d
$14:f5e8  0c 5b cc      tsb $cc5b
$14:f5eb  0c 5d cc      tsb $cc5d
$14:f5ee  0c 59 cc      tsb $cc59
$14:f5f1  0c 5d cc      tsb $cc5d
$14:f5f4  0c 5b cc      tsb $cc5b
$14:f5f7  0c 5d cc      tsb $cc5d
$14:f5fa  0c 59 cc      tsb $cc59
$14:f5fd  0c 5d cc      tsb $cc5d
$14:f600  0c 5b cc      tsb $cc5b
$14:f603  0c 5d cc      tsb $cc5d
$14:f606  0c 59 cc      tsb $cc59
$14:f609  0c 5d cc      tsb $cc5d
$14:f60c  0c 5b cc      tsb $cc5b
$14:f60f  0c 5d cc      tsb $cc5d
$14:f612  0c 59 cc      tsb $cc59
$14:f615  0c 5d cc      tsb $cc5d
$14:f618  0c 5b cc      tsb $cc5b
$14:f61b  0c 5d cc      tsb $cc5d
$14:f61e  0c 59 cc      tsb $cc59
$14:f621  0c 5d cc      tsb $cc5d
$14:f624  0c 5b cc      tsb $cc5b
$14:f627  0c 5d cc      tsb $cc5d
$14:f62a  0c 59 cc      tsb $cc59
$14:f62d  0c 5d cc      tsb $cc5d
$14:f630  0c 5b cc      tsb $cc5b
$14:f633  0c 5d cc      tsb $cc5d
$14:f636  0c 59 cc      tsb $cc59
$14:f639  0c 5d cc      tsb $cc5d
$14:f63c  0c 5b cc      tsb $cc5b
$14:f63f  0c 5d cc      tsb $cc5d
$14:f642  0c 59 cc      tsb $cc59
$14:f645  06 5d         asl $5d
$14:f647  cc 06 5c      cpy $5c06
$14:f64a  cc 0c 5b      cpy $5b0c
$14:f64d  cc 0c 5d      cpy $5d0c
$14:f650  cc 0c 59      cpy $590c
$14:f653  cc 06 5d      cpy $5d06
$14:f656  cc 06 5c      cpy $5c06
$14:f659  cc 0c 5b      cpy $5b0c
$14:f65c  cc 0c 5d      cpy $5d0c
$14:f65f  cc 0c 59      cpy $590c
$14:f662  cc 06 5d      cpy $5d06
$14:f665  cc 06 5c      cpy $5c06
$14:f668  cc 0c 5b      cpy $5b0c
$14:f66b  cc 0c 5d      cpy $5d0c
$14:f66e  cc ea 03      cpy $03ea
$14:f671  0c 59 cc      tsb $cc59
$14:f674  ea            nop
$14:f675  00 0c         brk #$0c
$14:f677  5d cc 0c      eor $0ccc,x
$14:f67a  5b            tcd
$14:f67b  cc 0c 5d      cpy $5d0c
$14:f67e  cc 0c 59      cpy $590c
$14:f681  cc 06 5d      cpy $5d06
$14:f684  cc 06 5c      cpy $5c06
$14:f687  cc 0c 5b      cpy $5b0c
$14:f68a  cc 0c 5d      cpy $5d0c
$14:f68d  cc 0c 59      cpy $590c
$14:f690  cc 06 5d      cpy $5d06
$14:f693  cc 06 5c      cpy $5c06
$14:f696  cc 0c 5b      cpy $5b0c
$14:f699  cc 0c 5d      cpy $5d0c
$14:f69c  cc 0c 59      cpy $590c
$14:f69f  cc 06 5d      cpy $5d06
$14:f6a2  cc 06 5c      cpy $5c06
$14:f6a5  cc 0c 5b      cpy $5b0c
$14:f6a8  cc 0c 5d      cpy $5d0c
$14:f6ab  cc ea 03      cpy $03ea
$14:f6ae  0c 59 cc      tsb $cc59
$14:f6b1  ea            nop
$14:f6b2  00 0c         brk #$0c
$14:f6b4  5d cc 0c      eor $0ccc,x
$14:f6b7  5b            tcd
$14:f6b8  cc 0c 5d      cpy $5d0c
$14:f6bb  cc 0c 59      cpy $590c
$14:f6be  cc 06 5d      cpy $5d06
$14:f6c1  cc 06 5c      cpy $5c06
$14:f6c4  cc 0c 5b      cpy $5b0c
$14:f6c7  cc 0c 5d      cpy $5d0c
$14:f6ca  cc 0c 59      cpy $590c
$14:f6cd  cc 06 5d      cpy $5d06
$14:f6d0  cc 06 5c      cpy $5c06
$14:f6d3  cc 0c 5b      cpy $5b0c
$14:f6d6  cc 0c 5d      cpy $5d0c
$14:f6d9  cc 0c 59      cpy $590c
$14:f6dc  cc 06 5d      cpy $5d06
$14:f6df  cc 06 5c      cpy $5c06
$14:f6e2  cc 0c 5b      cpy $5b0c
$14:f6e5  cc 0c 5d      cpy $5d0c
$14:f6e8  cc ea 03      cpy $03ea
$14:f6eb  0c 59 cc      tsb $cc59
$14:f6ee  ea            nop
$14:f6ef  00 0c         brk #$0c
$14:f6f1  5d cc 0c      eor $0ccc,x
$14:f6f4  5b            tcd
$14:f6f5  cc 0c 5d      cpy $5d0c
$14:f6f8  cc 0c 59      cpy $590c
$14:f6fb  cc 06 5d      cpy $5d06
$14:f6fe  cc 06 5c      cpy $5c06
$14:f701  cc 0c 5b      cpy $5b0c
$14:f704  cc 0c 5d      cpy $5d0c
$14:f707  cc 0c 59      cpy $590c
$14:f70a  cc 06 5d      cpy $5d06
$14:f70d  cc 06 5c      cpy $5c06
$14:f710  cc 0c 5b      cpy $5b0c
$14:f713  cc 0c 5d      cpy $5d0c
$14:f716  cc 0c 59      cpy $590c
$14:f719  cc 06 5d      cpy $5d06
$14:f71c  cc 06 5c      cpy $5c06
$14:f71f  cc 0c 5b      cpy $5b0c
$14:f722  cc 0c 5d      cpy $5d0c
$14:f725  cc ea 03      cpy $03ea
$14:f728  0c 59 cc      tsb $cc59
$14:f72b  ea            nop
$14:f72c  00 0c         brk #$0c
$14:f72e  5d cc ea      eor $eacc,x
$14:f731  03 0c         ora $0c,s
$14:f733  5b            tcd
$14:f734  cc ea 00      cpy $00ea
$14:f737  0c 5d cc      tsb $cc5d
$14:f73a  ea            nop
$14:f73b  03 0c         ora $0c,s
$14:f73d  59 cc ea      eor $eacc,y
$14:f740  00 0c         brk #$0c
$14:f742  5d cc ea      eor $eacc,x
$14:f745  03 0c         ora $0c,s
$14:f747  5b            tcd
$14:f748  cc ea 00      cpy $00ea
$14:f74b  0c 5d cc      tsb $cc5d
$14:f74e  ea            nop
$14:f74f  03 0c         ora $0c,s
$14:f751  59 cc ea      eor $eacc,y
$14:f754  00 0c         brk #$0c
$14:f756  5d cc ea      eor $eacc,x
$14:f759  03 0c         ora $0c,s
$14:f75b  5b            tcd
$14:f75c  cc ea 00      cpy $00ea
$14:f75f  0c 5d cc      tsb $cc5d
$14:f762  ea            nop
$14:f763  03 0c         ora $0c,s
$14:f765  59 cc ea      eor $eacc,y
$14:f768  00 0c         brk #$0c
$14:f76a  5d cc ea      eor $eacc,x
$14:f76d  03 0c         ora $0c,s
$14:f76f  5b            tcd
$14:f770  cc ea 00      cpy $00ea
$14:f773  0c 5d cc      tsb $cc5d
$14:f776  ea            nop
$14:f777  03 0c         ora $0c,s
$14:f779  59 cc ea      eor $eacc,y
$14:f77c  00 0c         brk #$0c
$14:f77e  5d cc ea      eor $eacc,x
$14:f781  03 0c         ora $0c,s
$14:f783  5b            tcd
$14:f784  cc ea 00      cpy $00ea
$14:f787  0c 5d cc      tsb $cc5d
$14:f78a  ea            nop
$14:f78b  03 0c         ora $0c,s
$14:f78d  59 cc ea      eor $eacc,y
$14:f790  00 0c         brk #$0c
$14:f792  5d cc ea      eor $eacc,x
$14:f795  03 0c         ora $0c,s
$14:f797  5b            tcd
$14:f798  cc ea 00      cpy $00ea
$14:f79b  0c 5d cc      tsb $cc5d
$14:f79e  ea            nop
$14:f79f  03 0c         ora $0c,s
$14:f7a1  59 cc ea      eor $eacc,y
$14:f7a4  00 0c         brk #$0c
$14:f7a6  5d cc ea      eor $eacc,x
$14:f7a9  03 0c         ora $0c,s
$14:f7ab  5b            tcd
$14:f7ac  cc ea 00      cpy $00ea
$14:f7af  0c 5d cc      tsb $cc5d
$14:f7b2  ea            nop
$14:f7b3  03 0c         ora $0c,s
$14:f7b5  59 cc ea      eor $eacc,y
$14:f7b8  00 0c         brk #$0c
$14:f7ba  5d cc ea      eor $eacc,x
$14:f7bd  03 0c         ora $0c,s
$14:f7bf  5b            tcd
$14:f7c0  cc ea 00      cpy $00ea
$14:f7c3  0c 5d cc      tsb $cc5d
$14:f7c6  ea            nop
$14:f7c7  03 0c         ora $0c,s
$14:f7c9  59 cc ea      eor $eacc,y
$14:f7cc  00 0c         brk #$0c
$14:f7ce  5d cc ea      eor $eacc,x
$14:f7d1  03 0c         ora $0c,s
$14:f7d3  5b            tcd
$14:f7d4  cc ea 00      cpy $00ea
$14:f7d7  0c 5d cc      tsb $cc5d
$14:f7da  ea            nop
$14:f7db  03 0c         ora $0c,s
$14:f7dd  59 cc ea      eor $eacc,y
$14:f7e0  00 0c         brk #$0c
$14:f7e2  5d cc ea      eor $eacc,x
$14:f7e5  03 0c         ora $0c,s
$14:f7e7  5b            tcd
$14:f7e8  cc ea 00      cpy $00ea
$14:f7eb  0c 5d cc      tsb $cc5d
$14:f7ee  ea            nop
$14:f7ef  03 0c         ora $0c,s
$14:f7f1  59 cc ea      eor $eacc,y
$14:f7f4  00 0c         brk #$0c
$14:f7f6  5d cc ea      eor $eacc,x
$14:f7f9  03 0c         ora $0c,s
$14:f7fb  5b            tcd
$14:f7fc  cc ea 00      cpy $00ea
$14:f7ff  0c 5d cc      tsb $cc5d
$14:f802  ea            nop
$14:f803  03 0c         ora $0c,s
$14:f805  59 cc ea      eor $eacc,y
$14:f808  00 0c         brk #$0c
$14:f80a  5d cc ea      eor $eacc,x
$14:f80d  03 0c         ora $0c,s
$14:f80f  5b            tcd
$14:f810  cc ea 00      cpy $00ea
$14:f813  0c 5d cc      tsb $cc5d
$14:f816  ea            nop
$14:f817  03 0c         ora $0c,s
$14:f819  59 cc ea      eor $eacc,y
$14:f81c  00 0c         brk #$0c
$14:f81e  5d cc ea      eor $eacc,x
$14:f821  03 0c         ora $0c,s
$14:f823  5b            tcd
$14:f824  cc ea 00      cpy $00ea
$14:f827  0c 5d cc      tsb $cc5d
$14:f82a  ea            nop
$14:f82b  03 0c         ora $0c,s
$14:f82d  59 cc ea      eor $eacc,y
$14:f830  00 0c         brk #$0c
$14:f832  5d cc ea      eor $eacc,x
$14:f835  03 0c         ora $0c,s
$14:f837  5b            tcd
$14:f838  cc ea 00      cpy $00ea
$14:f83b  0c 5d cc      tsb $cc5d
$14:f83e  ea            nop
$14:f83f  03 0c         ora $0c,s
$14:f841  59 cc ea      eor $eacc,y
$14:f844  00 0c         brk #$0c
$14:f846  5d cc ea      eor $eacc,x
$14:f849  03 0c         ora $0c,s
$14:f84b  5b            tcd
$14:f84c  cc ea 00      cpy $00ea
$14:f84f  0c 5d cc      tsb $cc5d
$14:f852  ea            nop
$14:f853  03 0c         ora $0c,s
$14:f855  59 cc ea      eor $eacc,y
$14:f858  00 0c         brk #$0c
$14:f85a  5d cc 24      eor $24cc,x
$14:f85d  c9 06 cc      cmp #$cc06
$14:f860  06 5c         asl $5c
$14:f862  cc ea 03      cpy $03ea
$14:f865  0c 5b cc      tsb $cc5b
$14:f868  ea            nop
$14:f869  00 0c         brk #$0c
$14:f86b  5d cc 0c      eor $0ccc,x
$14:f86e  59 cc 06      eor $06cc,y
$14:f871  5d cc 06      eor $06cc,x
$14:f874  5c cc ea 03   jml $03eacc
$14:f878  0c 5b cc      tsb $cc5b
$14:f87b  ea            nop
$14:f87c  00 0c         brk #$0c
$14:f87e  5d cc 0c      eor $0ccc,x
$14:f881  59 cc 06      eor $06cc,y
$14:f884  5d cc 06      eor $06cc,x
$14:f887  5c cc ea 03   jml $03eacc
$14:f88b  0c 5b cc      tsb $cc5b
$14:f88e  ea            nop
$14:f88f  00 0c         brk #$0c
$14:f891  5d cc 0c      eor $0ccc,x
$14:f894  59 cc 06      eor $06cc,y
$14:f897  5d cc 06      eor $06cc,x
$14:f89a  5c cc ea 03   jml $03eacc
$14:f89e  0c 5b cc      tsb $cc5b
$14:f8a1  ea            nop
$14:f8a2  00 0c         brk #$0c
$14:f8a4  5d cc 0c      eor $0ccc,x
$14:f8a7  59 cc 06      eor $06cc,y
$14:f8aa  5d cc 06      eor $06cc,x
$14:f8ad  5c cc ea 03   jml $03eacc
$14:f8b1  0c 5b cc      tsb $cc5b
$14:f8b4  ea            nop
$14:f8b5  00 0c         brk #$0c
$14:f8b7  5d cc 0c      eor $0ccc,x
$14:f8ba  59 cc 06      eor $06cc,y
$14:f8bd  5d cc 06      eor $06cc,x
$14:f8c0  5c cc ea 03   jml $03eacc
$14:f8c4  0c 5b cc      tsb $cc5b
$14:f8c7  ea            nop
$14:f8c8  00 0c         brk #$0c
$14:f8ca  5d cc 0c      eor $0ccc,x
$14:f8cd  59 cc 06      eor $06cc,y
$14:f8d0  5d cc 06      eor $06cc,x
$14:f8d3  5c cc ea 03   jml $03eacc
$14:f8d7  0c 5b cc      tsb $cc5b
$14:f8da  ea            nop
$14:f8db  00 0c         brk #$0c
$14:f8dd  5d cc 0c      eor $0ccc,x
$14:f8e0  59 cc 06      eor $06cc,y
$14:f8e3  5d cc 06      eor $06cc,x
$14:f8e6  5c cc ea 03   jml $03eacc
$14:f8ea  0c 5b cc      tsb $cc5b
$14:f8ed  ea            nop
$14:f8ee  00 0c         brk #$0c
$14:f8f0  5d cc 0c      eor $0ccc,x
$14:f8f3  59 cc 06      eor $06cc,y
$14:f8f6  5d cc 06      eor $06cc,x
$14:f8f9  5c cc ea 03   jml $03eacc
$14:f8fd  0c 5b cc      tsb $cc5b
$14:f900  ea            nop
$14:f901  00 0c         brk #$0c
$14:f903  5d cc 0c      eor $0ccc,x
$14:f906  59 cc 06      eor $06cc,y
$14:f909  5d cc 06      eor $06cc,x
$14:f90c  5c cc ea 03   jml $03eacc
$14:f910  0c 5b cc      tsb $cc5b
$14:f913  ea            nop
$14:f914  00 0c         brk #$0c
$14:f916  5d cc 0c      eor $0ccc,x
$14:f919  59 cc 06      eor $06cc,y
$14:f91c  5d cc 06      eor $06cc,x
$14:f91f  5c cc ea 03   jml $03eacc
$14:f923  0c 5b cc      tsb $cc5b
$14:f926  ea            nop
$14:f927  00 0c         brk #$0c
$14:f929  5d cc 0c      eor $0ccc,x
$14:f92c  59 cc 06      eor $06cc,y
$14:f92f  5d cc 06      eor $06cc,x
$14:f932  5c cc ea 03   jml $03eacc
$14:f936  0c 5b cc      tsb $cc5b
$14:f939  ea            nop
$14:f93a  00 0c         brk #$0c
$14:f93c  5d cc 0c      eor $0ccc,x
$14:f93f  59 cc 06      eor $06cc,y
$14:f942  5d cc 06      eor $06cc,x
$14:f945  5c cc ea 03   jml $03eacc
$14:f949  0c 5b cc      tsb $cc5b
$14:f94c  ea            nop
$14:f94d  00 0c         brk #$0c
$14:f94f  5d cc 0c      eor $0ccc,x
$14:f952  59 cc 06      eor $06cc,y
$14:f955  5d cc 06      eor $06cc,x
$14:f958  5c cc ea 03   jml $03eacc
$14:f95c  0c 5b cc      tsb $cc5b
$14:f95f  ea            nop
$14:f960  00 0c         brk #$0c
$14:f962  5d cc 0c      eor $0ccc,x
$14:f965  59 cc 06      eor $06cc,y
$14:f968  5d cc 06      eor $06cc,x
$14:f96b  5c cc ea 03   jml $03eacc
$14:f96f  0c 5b cc      tsb $cc5b
$14:f972  ea            nop
$14:f973  00 0c         brk #$0c
$14:f975  5d cc 0c      eor $0ccc,x
$14:f978  59 cc 06      eor $06cc,y
$14:f97b  5d cc 06      eor $06cc,x
$14:f97e  5c cc ea 03   jml $03eacc
$14:f982  0c 5b cc      tsb $cc5b
$14:f985  ea            nop
$14:f986  00 0c         brk #$0c
$14:f988  5d cc 0c      eor $0ccc,x
$14:f98b  59 cc 60      eor $60cc,y
$14:f98e  c9 00 ed      cmp #$ed00
$14:f991  c3 e1         cmp $e1,s
$14:f993  0a            asl a
$14:f994  18            clc
$14:f995  5d ca cb      eor $cbca,x
$14:f998  0c c9 ca      tsb $cac9
$14:f99b  c9 cb c9      cmp #$c9cb
$14:f99e  ca            dex
$14:f99f  c9 cb c9      cmp #$c9cb
$14:f9a2  ca            dex
$14:f9a3  cb            wai
$14:f9a4  ca            dex
$14:f9a5  18            clc
$14:f9a6  ca            dex
$14:f9a7  cb            wai
$14:f9a8  0c c9 ca      tsb $cac9
$14:f9ab  c9 cb c9      cmp #$c9cb
$14:f9ae  ca            dex
$14:f9af  c9 cb c9      cmp #$c9cb
$14:f9b2  ca            dex
$14:f9b3  cb            wai
$14:f9b4  ca            dex
$14:f9b5  18            clc
$14:f9b6  ca            dex
$14:f9b7  cb            wai
$14:f9b8  0c c9 ca      tsb $cac9
$14:f9bb  c9 cb c9      cmp #$c9cb
$14:f9be  ca            dex
$14:f9bf  c9 cb c9      cmp #$c9cb
$14:f9c2  ca            dex
$14:f9c3  cb            wai
$14:f9c4  ca            dex
$14:f9c5  18            clc
$14:f9c6  ca            dex
$14:f9c7  cb            wai
$14:f9c8  0c c9 ca      tsb $cac9
$14:f9cb  c9 cb c9      cmp #$c9cb
$14:f9ce  ca            dex
$14:f9cf  c9 cb c9      cmp #$c9cb
$14:f9d2  ca            dex
$14:f9d3  cb            wai
$14:f9d4  ca            dex
$14:f9d5  18            clc
$14:f9d6  ca            dex
$14:f9d7  cb            wai
$14:f9d8  0c ca ca      tsb $caca
$14:f9db  18            clc
$14:f9dc  cb            wai
$14:f9dd  0c c9 ca      tsb $cac9
$14:f9e0  18            clc
$14:f9e1  cb            wai
$14:f9e2  0c ca ca      tsb $caca
$14:f9e5  cb            wai
$14:f9e6  ca            dex
$14:f9e7  18            clc
$14:f9e8  ca            dex
$14:f9e9  cb            wai
$14:f9ea  0c ca ca      tsb $caca
$14:f9ed  cb            wai
$14:f9ee  ca            dex
$14:f9ef  c9 ca cb      cmp #$cbca
$14:f9f2  ca            dex
$14:f9f3  ca            dex
$14:f9f4  ca            dex
$14:f9f5  cb            wai
$14:f9f6  ca            dex
$14:f9f7  18            clc
$14:f9f8  ca            dex
$14:f9f9  cb            wai
$14:f9fa  0c ca ca      tsb $caca
$14:f9fd  cb            wai
$14:f9fe  ca            dex
$14:f9ff  c9 ca cb      cmp #$cbca
$14:fa02  ca            dex
$14:fa03  ca            dex
$14:fa04  ca            dex
$14:fa05  cb            wai
$14:fa06  ca            dex
$14:fa07  18            clc
$14:fa08  ca            dex
$14:fa09  cb            wai
$14:fa0a  0c c9 ca      tsb $cac9
$14:fa0d  cb            wai
$14:fa0e  ca            dex
$14:fa0f  c9 ca cb      cmp #$cbca
$14:fa12  ca            dex
$14:fa13  ca            dex
$14:fa14  ca            dex
$14:fa15  cb            wai
$14:fa16  ca            dex
$14:fa17  18            clc
$14:fa18  ca            dex
$14:fa19  0c cb ca      tsb $cacb
$14:fa1c  ca            dex
$14:fa1d  ca            dex
$14:fa1e  cb            wai
$14:fa1f  ca            dex
$14:fa20  18            clc
$14:fa21  ca            dex
$14:fa22  0c cb ca      tsb $cacb
$14:fa25  ca            dex
$14:fa26  ca            dex
$14:fa27  cb            wai
$14:fa28  ca            dex
$14:fa29  18            clc
$14:fa2a  ca            dex
$14:fa2b  0c cb ca      tsb $cacb
$14:fa2e  ca            dex
$14:fa2f  ca            dex
$14:fa30  cb            wai
$14:fa31  ca            dex
$14:fa32  18            clc
$14:fa33  ca            dex
$14:fa34  0c cb ca      tsb $cacb
$14:fa37  ca            dex
$14:fa38  ca            dex
$14:fa39  cb            wai
$14:fa3a  ca            dex
$14:fa3b  18            clc
$14:fa3c  ca            dex
$14:fa3d  0c cb ca      tsb $cacb
$14:fa40  ca            dex
$14:fa41  ca            dex
$14:fa42  cb            wai
$14:fa43  ca            dex
$14:fa44  18            clc
$14:fa45  ca            dex
$14:fa46  0c cb ca      tsb $cacb
$14:fa49  ca            dex
$14:fa4a  ca            dex
$14:fa4b  cb            wai
$14:fa4c  ca            dex
$14:fa4d  18            clc
$14:fa4e  ca            dex
$14:fa4f  0c cb ca      tsb $cacb
$14:fa52  ca            dex
$14:fa53  ca            dex
$14:fa54  cb            wai
$14:fa55  ca            dex
$14:fa56  18            clc
$14:fa57  ca            dex
$14:fa58  0c cb ca      tsb $cacb
$14:fa5b  ca            dex
$14:fa5c  0c 5e cb      tsb $cb5e
$14:fa5f  cb            wai
$14:fa60  cb            wai
$14:fa61  0c 5d ca      tsb $ca5d
$14:fa64  cb            wai
$14:fa65  c9 ca cb      cmp #$cbca
$14:fa68  c9 ca cb      cmp #$cbca
$14:fa6b  c9 ca cb      cmp #$cbca
$14:fa6e  c9 ca cb      cmp #$cbca
$14:fa71  18            clc
$14:fa72  c9 0c ca      cmp #$ca0c
$14:fa75  cb            wai
$14:fa76  c9 ca cb      cmp #$cbca
$14:fa79  c9 ca cb      cmp #$cbca
$14:fa7c  c9 ca cb      cmp #$cbca
$14:fa7f  c9 ca cb      cmp #$cbca
$14:fa82  18            clc
$14:fa83  c9 0c ca      cmp #$ca0c
$14:fa86  cb            wai
$14:fa87  c9 ca cb      cmp #$cbca
$14:fa8a  c9 ca cb      cmp #$cbca
$14:fa8d  c9 ca cb      cmp #$cbca
$14:fa90  c9 ca cb      cmp #$cbca
$14:fa93  c9 ca cb      cmp #$cbca
$14:fa96  c9 ca cb      cmp #$cbca
$14:fa99  c9 ca cb      cmp #$cbca
$14:fa9c  c9 ca cb      cmp #$cbca
$14:fa9f  c9 ca cb      cmp #$cbca
$14:faa2  c9 0c 5e      cmp #$5e0c
$14:faa5  cb            wai
$14:faa6  cb            wai
$14:faa7  30 c9         bmi $fa72
$14:faa9  04 ca         tsb $ca
$14:faab  04 5e         tsb $5e
$14:faad  ca            dex
$14:faae  04 5e         tsb $5e
$14:fab0  ca            dex
$14:fab1  04 5e         tsb $5e
$14:fab3  ca            dex
$14:fab4  04 5d         tsb $5d
$14:fab6  ca            dex
$14:fab7  04 5d         tsb $5d
$14:fab9  ca            dex
$14:faba  0c 5e cb      tsb $cb5e
$14:fabd  06 5e         asl $5e
$14:fabf  cb            wai
$14:fac0  06 5d         asl $5d
$14:fac2  cb            wai
$14:fac3  00 ea         brk #$ea
$14:fac5  00 e0         brk #$e0
$14:fac7  00 ed         brk #$ed
$14:fac9  5a            phy
$14:faca  e1 08         sbc ($08,x)
$14:facc  0c c9 04      tsb $04c9
$14:facf  5d ad 14      eor $14ad,x
$14:fad2  ae 0c ab      ldx $ab0c
$14:fad5  c9 a9 ab      cmp #$aba9
$14:fad8  c9 04 6d      cmp #$6d04
$14:fadb  ad 08 5d      lda $5d08
$14:fade  ae 18 c8      ldx $c818
$14:fae1  0c ab c9      tsb $c9ab
$14:fae4  b0 ae         bcs $fa94
$14:fae6  c9 04 b1      cmp #$b104
$14:fae9  08            php
$14:faea  b2 18         lda ($18)
$14:faec  c8            iny
$14:faed  0c b0 ae      tsb $aeb0
$14:faf0  b0 b2         bcs $faa4
$14:faf2  c9 04 aa      cmp #$aa04
$14:faf5  08            php
$14:faf6  ab            plb
$14:faf7  48            pha
$14:faf8  c8            iny
$14:faf9  0c c9 04      tsb $04c9
$14:fafc  ad 08 ae      lda $ae08
$14:faff  18            clc
$14:fb00  c8            iny
$14:fb01  0c ab c9      tsb $c9ab
$14:fb04  a9 ab c9      lda #$c9ab
$14:fb07  04 ad         tsb $ad
$14:fb09  08            php
$14:fb0a  ae 18 c8      ldx $c818
$14:fb0d  0c ab c9      tsb $c9ab
$14:fb10  b0 ae         bcs $fac0
$14:fb12  c9 04 b1      cmp #$b104
$14:fb15  08            php
$14:fb16  b2 18         lda ($18)
$14:fb18  c8            iny
$14:fb19  0c b0 ae      tsb $aeb0
$14:fb1c  b0 b2         bcs $fad0
$14:fb1e  c9 04 aa      cmp #$aa04
$14:fb21  08            php
$14:fb22  ab            plb
$14:fb23  48            pha
$14:fb24  c8            iny
$14:fb25  0c c9 e4      tsb $e4c9
$14:fb28  e0 02 ea      cpx #$ea02
$14:fb2b  f4 ab 18      pea $18ab
$14:fb2e  c8            iny
$14:fb2f  0c ae 30      tsb $30ae
$14:fb32  c9 0c b0      cmp #$b00c
$14:fb35  18            clc
$14:fb36  c8            iny
$14:fb37  0c b2 30      tsb $30b2
$14:fb3a  c9 0c ab      cmp #$ab0c
$14:fb3d  18            clc
$14:fb3e  c8            iny
$14:fb3f  0c ae 30      tsb $30ae
$14:fb42  c9 0c b0      cmp #$b00c
$14:fb45  18            clc
$14:fb46  c8            iny
$14:fb47  0c b2 30      tsb $30b2
$14:fb4a  c9 e3 0a      cmp #$0ae3
$14:fb4d  0a            asl a
$14:fb4e  0c 0c 5b      tsb $5b0c
$14:fb51  bc 18 c8      ldy $c818,x
$14:fb54  0c 5d bb      tsb $bb5d
$14:fb57  30 c9         bmi $fb22
$14:fb59  0c 5b ba      tsb $ba5b
$14:fb5c  18            clc
$14:fb5d  c8            iny
$14:fb5e  0c 5d b7      tsb $b75d
$14:fb61  30 c9         bmi $fb2c
$14:fb63  0c 5b bc      tsb $bc5b
$14:fb66  18            clc
$14:fb67  c8            iny
$14:fb68  0c 5d bb      tsb $bb5d
$14:fb6b  30 c9         bmi $fb36
$14:fb6d  0c 5b ba      tsb $ba5b
$14:fb70  18            clc
$14:fb71  c8            iny
$14:fb72  0c 5d b7      tsb $b75d
$14:fb75  30 c9         bmi $fb40
$14:fb77  ea            nop
$14:fb78  00 e4         brk #$e4
$14:fb7a  ed 50 e0      sbc $e050
$14:fb7d  00 0c         brk #$0c
$14:fb7f  b0 b3         bcs $fb34
$14:fb81  b0 b5         bcs $fb38
$14:fb83  b0 b7         bcs $fb3c
$14:fb85  b6 b5         ldx $b5,y
$14:fb87  b3 c9         lda ($c9,s),y
$14:fb89  3c b0 0c      bit $0cb0,x
$14:fb8c  c9 b0 b3      cmp #$b3b0
$14:fb8f  b0 b5         bcs $fb46
$14:fb91  b0 b7         bcs $fb4a
$14:fb93  b6 b5         ldx $b5,y
$14:fb95  b3 c9         lda ($c9,s),y
$14:fb97  3c b0 0c      bit $0cb0,x
$14:fb9a  c9 b5 b8      cmp #$b8b5
$14:fb9d  b5 ba         lda $ba,x
$14:fb9f  b5 bc         lda $bc,x
$14:fba1  bb            tyx
$14:fba2  ba            tsx
$14:fba3  b8            clv
$14:fba4  c9 3c b5      cmp #$b53c
$14:fba7  0c c9 b5      tsb $b5c9
$14:fbaa  b8            clv
$14:fbab  b5 ba         lda $ba,x
$14:fbad  b5 bc         lda $bc,x
$14:fbaf  bb            tyx
$14:fbb0  ba            tsx
$14:fbb1  b8            clv
$14:fbb2  c9 3c b5      cmp #$b53c
$14:fbb5  0c c9 ed      tsb $edc9
$14:fbb8  46 e0         lsr $e0
$14:fbba  03 0c         ora $0c,s
$14:fbbc  4e b2 b2      lsr $b2b2
$14:fbbf  0c 4d b2      tsb $b24d
$14:fbc2  b2 b2         lda ($b2)
$14:fbc4  0c 4e b2      tsb $b24e
$14:fbc7  0c 4d b2      tsb $b24d
$14:fbca  b2 b2         lda ($b2)
$14:fbcc  c9 b0 3c      cmp #$3cb0
$14:fbcf  c9 0c 4e      cmp #$4e0c
$14:fbd2  b2 b2         lda ($b2)
$14:fbd4  0c 4d b2      tsb $b24d
$14:fbd7  b2 b2         lda ($b2)
$14:fbd9  0c 4e b2      tsb $b24e
$14:fbdc  0c 4d b2      tsb $b24d
$14:fbdf  b2 b2         lda ($b2)
$14:fbe1  c9 3c b0      cmp #$b03c
$14:fbe4  0c c9 0c      tsb $0cc9
$14:fbe7  4e b2 b2      lsr $b2b2
$14:fbea  0c 4d b2      tsb $b24d
$14:fbed  b2 b2         lda ($b2)
$14:fbef  b2 b2         lda ($b2)
$14:fbf1  b2 0c         lda ($0c)
$14:fbf3  4e b2 0c      lsr $0cb2
$14:fbf6  5d c8 18      eor $18c8,x
$14:fbf9  b1 18         lda ($18),y
$14:fbfb  5e b0 18      lsr $18b0,x
$14:fbfe  5d af 0c      eor $0caf,x
$14:fc01  5e ae c8      lsr $c8ae,x
$14:fc04  18            clc
$14:fc05  5d ad 18      eor $18ad,x
$14:fc08  5e ac 18      lsr $18ac,x
$14:fc0b  5d ab 0c      eor $0cab,x
$14:fc0e  5e aa c8      lsr $c8aa,x
$14:fc11  18            clc
$14:fc12  5d a9 18      eor $18a9,x
$14:fc15  5e a8 24      lsr $24a8,x
$14:fc18  5d a7 54      eor $54a7,x
$14:fc1b  c9 00 e0      cmp #$e000
$14:fc1e  04 ea         tsb $ea
$14:fc20  00 ed         brk #$ed
$14:fc22  64 e1         stz $e1
$14:fc24  0b            phd
$14:fc25  0c 1d 9f      tsb $9f1d
$14:fc28  a4 0c         ldy $0c
$14:fc2a  1b            tcs
$14:fc2b  a9 0c 1d      lda #$1d0c
$14:fc2e  a4 0c         ldy $0c
$14:fc30  1b            tcs
$14:fc31  ab            plb
$14:fc32  0c 1d a4      tsb $a41d
$14:fc35  0c 1b a9      tsb $a91b
$14:fc38  a4 0c         ldy $0c
$14:fc3a  1d 9f a4      ora $a49f,x
$14:fc3d  0c 1b a9      tsb $a91b
$14:fc40  0c 1d a4      tsb $a41d
$14:fc43  0c 1b ab      tsb $ab1b
$14:fc46  0c 1d a4      tsb $a41d
$14:fc49  0c 1b a9      tsb $a91b
$14:fc4c  a4 0c         ldy $0c
$14:fc4e  1d 9f a4      ora $a49f,x
$14:fc51  0c 1b a9      tsb $a91b
$14:fc54  0c 1d a4      tsb $a41d
$14:fc57  0c 1b ab      tsb $ab1b
$14:fc5a  0c 1d a4      tsb $a41d
$14:fc5d  0c 1b a9      tsb $a91b
$14:fc60  a4 0c         ldy $0c
$14:fc62  1d 9f a4      ora $a49f,x
$14:fc65  0c 1b a9      tsb $a91b
$14:fc68  0c 1d a4      tsb $a41d
$14:fc6b  0c 1b ab      tsb $ab1b
$14:fc6e  0c 1d a4      tsb $a41d
$14:fc71  0c 1b a9      tsb $a91b
$14:fc74  a4 0c         ldy $0c
$14:fc76  1d 9f a4      ora $a49f,x
$14:fc79  0c 1b a9      tsb $a91b
$14:fc7c  0c 1d a4      tsb $a41d
$14:fc7f  0c 1b ab      tsb $ab1b
$14:fc82  0c 1d a4      tsb $a41d
$14:fc85  0c 1b a9      tsb $a91b
$14:fc88  a4 0c         ldy $0c
$14:fc8a  1d 9f a4      ora $a49f,x
$14:fc8d  0c 1b a9      tsb $a91b
$14:fc90  0c 1d a4      tsb $a41d
$14:fc93  0c 1b ab      tsb $ab1b
$14:fc96  0c 1d a4      tsb $a41d
$14:fc99  0c 1b a9      tsb $a91b
$14:fc9c  a4 0c         ldy $0c
$14:fc9e  1d 9f a4      ora $a49f,x
$14:fca1  0c 1b a9      tsb $a91b
$14:fca4  0c 1d a4      tsb $a41d
$14:fca7  0c 1b ab      tsb $ab1b
$14:fcaa  0c 1d a4      tsb $a41d
$14:fcad  0c 1b a9      tsb $a91b
$14:fcb0  a4 0c         ldy $0c
$14:fcb2  1d 9f a4      ora $a49f,x
$14:fcb5  0c 1b a9      tsb $a91b
$14:fcb8  0c 1d a4      tsb $a41d
$14:fcbb  0c 1b ab      tsb $ab1b
$14:fcbe  0c 1d a4      tsb $a41d
$14:fcc1  0c 1b a9      tsb $a91b
$14:fcc4  a4 0c         ldy $0c
$14:fcc6  1d 9f a4      ora $a49f,x
$14:fcc9  0c 1b a9      tsb $a91b
$14:fccc  0c 1d a4      tsb $a41d
$14:fccf  0c 1b ab      tsb $ab1b
$14:fcd2  0c 1d a4      tsb $a41d
$14:fcd5  0c 1b a9      tsb $a91b
$14:fcd8  a4 0c         ldy $0c
$14:fcda  1d 9f a4      ora $a49f,x
$14:fcdd  0c 1b a9      tsb $a91b
$14:fce0  0c 1d a4      tsb $a41d
$14:fce3  0c 1b ab      tsb $ab1b
$14:fce6  0c 1d a4      tsb $a41d
$14:fce9  0c 1b a9      tsb $a91b
$14:fcec  a4 0c         ldy $0c
$14:fcee  1d 9f a4      ora $a49f,x
$14:fcf1  0c 1b a9      tsb $a91b
$14:fcf4  0c 1d a4      tsb $a41d
$14:fcf7  0c 1b ab      tsb $ab1b
$14:fcfa  0c 1d a4      tsb $a41d
$14:fcfd  0c 1b a9      tsb $a91b
$14:fd00  a4 0c         ldy $0c
$14:fd02  1d 9f a4      ora $a49f,x
$14:fd05  0c 1b a9      tsb $a91b
$14:fd08  0c 1d a4      tsb $a41d
$14:fd0b  0c 1b ab      tsb $ab1b
$14:fd0e  0c 1d a4      tsb $a41d
$14:fd11  0c 1b a9      tsb $a91b
$14:fd14  a4 0c         ldy $0c
$14:fd16  1d 9f a4      ora $a49f,x
$14:fd19  0c 1b a9      tsb $a91b
$14:fd1c  0c 1d a4      tsb $a41d
$14:fd1f  0c 1b ab      tsb $ab1b
$14:fd22  0c 1d a4      tsb $a41d
$14:fd25  0c 1b a9      tsb $a91b
$14:fd28  a4 0c         ldy $0c
$14:fd2a  1d 9f a4      ora $a49f,x
$14:fd2d  0c 1b a9      tsb $a91b
$14:fd30  0c 1d a4      tsb $a41d
$14:fd33  0c 1b ab      tsb $ab1b
$14:fd36  0c 1d a4      tsb $a41d
$14:fd39  0c 1b a9      tsb $a91b
$14:fd3c  a4 0c         ldy $0c
$14:fd3e  1d 9f a4      ora $a49f,x
$14:fd41  0c 1b a9      tsb $a91b
$14:fd44  0c 1d a4      tsb $a41d
$14:fd47  0c 1b ab      tsb $ab1b
$14:fd4a  0c 1d a4      tsb $a41d
$14:fd4d  0c 1b a9      tsb $a91b
$14:fd50  a4 0c         ldy $0c
$14:fd52  1d 9f a4      ora $a49f,x
$14:fd55  0c 1b a9      tsb $a91b
$14:fd58  0c 1d a4      tsb $a41d
$14:fd5b  0c 1b ab      tsb $ab1b
$14:fd5e  0c 1d a4      tsb $a41d
$14:fd61  0c 1b a9      tsb $a91b
$14:fd64  a4 0c         ldy $0c
$14:fd66  1d 9f a4      ora $a49f,x
$14:fd69  0c 1b a9      tsb $a91b
$14:fd6c  0c 1d a4      tsb $a41d
$14:fd6f  0c 1b ab      tsb $ab1b
$14:fd72  0c 1d a4      tsb $a41d
$14:fd75  0c 1b a9      tsb $a91b
$14:fd78  a4 0c         ldy $0c
$14:fd7a  1d 9f a4      ora $a49f,x
$14:fd7d  0c 1b a9      tsb $a91b
$14:fd80  0c 1d a4      tsb $a41d
$14:fd83  0c 1b ab      tsb $ab1b
$14:fd86  0c 1d a4      tsb $a41d
$14:fd89  0c 1b a9      tsb $a91b
$14:fd8c  a4 0c         ldy $0c
$14:fd8e  1d 9f a4      ora $a49f,x
$14:fd91  0c 1b a9      tsb $a91b
$14:fd94  0c 1d a4      tsb $a41d
$14:fd97  0c 1b ab      tsb $ab1b
$14:fd9a  0c 1d a4      tsb $a41d
$14:fd9d  0c 1b a9      tsb $a91b
$14:fda0  a4 0c         ldy $0c
$14:fda2  1d 9f a4      ora $a49f,x
$14:fda5  0c 1b a9      tsb $a91b
$14:fda8  0c 1d a4      tsb $a41d
$14:fdab  0c 1b ab      tsb $ab1b
$14:fdae  0c 1d a4      tsb $a41d
$14:fdb1  0c 1b a9      tsb $a91b
$14:fdb4  a4 0c         ldy $0c
$14:fdb6  1d 9d a2      ora $a29d,x
$14:fdb9  a7 a2         lda [$a2]
$14:fdbb  a9 a2 a7      lda #$a7a2
$14:fdbe  a2 9d a2      ldx #$a29d
$14:fdc1  a7 a2         lda [$a2]
$14:fdc3  a9 a2 a7      lda #$a7a2
$14:fdc6  a2 9d a2      ldx #$a29d
$14:fdc9  a7 a2         lda [$a2]
$14:fdcb  a9 a2 a7      lda #$a7a2
$14:fdce  a2 9d a2      ldx #$a29d
$14:fdd1  a7 a2         lda [$a2]
$14:fdd3  a9 a2 a7      lda #$a7a2
$14:fdd6  a2 9f a4      ldx #$a49f
$14:fdd9  0c 1b a9      tsb $a91b
$14:fddc  0c 1d a4      tsb $a41d
$14:fddf  0c 1b ab      tsb $ab1b
$14:fde2  0c 1d a4      tsb $a41d
$14:fde5  0c 1b a9      tsb $a91b
$14:fde8  a4 0c         ldy $0c
$14:fdea  1d 9f a4      ora $a49f,x
$14:fded  0c 1b a9      tsb $a91b
$14:fdf0  0c 1d a4      tsb $a41d
$14:fdf3  0c 1b ab      tsb $ab1b
$14:fdf6  0c 1d a4      tsb $a41d
$14:fdf9  0c 1b a9      tsb $a91b
$14:fdfc  a4 0c         ldy $0c
$14:fdfe  1d 9f a4      ora $a49f,x
$14:fe01  0c 1b a9      tsb $a91b
$14:fe04  0c 1d a4      tsb $a41d
$14:fe07  0c 1b ab      tsb $ab1b
$14:fe0a  0c 1d a4      tsb $a41d
$14:fe0d  0c 1b a9      tsb $a91b
$14:fe10  a4 0c         ldy $0c
$14:fe12  1d 9f a4      ora $a49f,x
$14:fe15  0c 1b a9      tsb $a91b
$14:fe18  0c 1d a4      tsb $a41d
$14:fe1b  0c 1b ab      tsb $ab1b
$14:fe1e  0c 1d a4      tsb $a41d
$14:fe21  0c 1b a9      tsb $a91b
$14:fe24  a4 0c         ldy $0c
$14:fe26  1d 9f a4      ora $a49f,x
$14:fe29  0c 1b a9      tsb $a91b
$14:fe2c  0c 1d a4      tsb $a41d
$14:fe2f  0c 1b ab      tsb $ab1b
$14:fe32  0c 1d a4      tsb $a41d
$14:fe35  0c 1b a9      tsb $a91b
$14:fe38  a4 0c         ldy $0c
$14:fe3a  1d 9f a4      ora $a49f,x
$14:fe3d  0c 1b a9      tsb $a91b
$14:fe40  0c 1d a4      tsb $a41d
$14:fe43  0c 1b ab      tsb $ab1b
$14:fe46  0c 1d a4      tsb $a41d
$14:fe49  0c 1b a9      tsb $a91b
$14:fe4c  a4 0c         ldy $0c
$14:fe4e  1d 9f a4      ora $a49f,x
$14:fe51  0c 1b a9      tsb $a91b
$14:fe54  0c 1d a4      tsb $a41d
$14:fe57  0c 1b ab      tsb $ab1b
$14:fe5a  0c 1d a4      tsb $a41d
$14:fe5d  0c 1b a9      tsb $a91b
$14:fe60  a4 0c         ldy $0c
$14:fe62  1d 9f a4      ora $a49f,x
$14:fe65  0c 1b a9      tsb $a91b
$14:fe68  0c 1d a4      tsb $a41d
$14:fe6b  0c 1b ab      tsb $ab1b
$14:fe6e  0c 1d a4      tsb $a41d
$14:fe71  0c 1b a9      tsb $a91b
$14:fe74  a4 0c         ldy $0c
$14:fe76  1d 9f a4      ora $a49f,x
$14:fe79  0c 1b a9      tsb $a91b
$14:fe7c  0c 1d a4      tsb $a41d
$14:fe7f  0c 1b ab      tsb $ab1b
$14:fe82  0c 1d a4      tsb $a41d
$14:fe85  0c 1b a9      tsb $a91b
$14:fe88  a4 00         ldy $00
$14:fe8a  ea            nop
$14:fe8b  00 e0         brk #$e0
$14:fe8d  00 e7         brk #$e7
$14:fe8f  1b            tcs
$14:fe90  ed 96 e5      sbc $e596
$14:fe93  f0 e1         beq $fe76
$14:fe95  0a            asl a
$14:fe96  f5 80         sbc $80,x
$14:fe98  7f 7f f7 03   adc $03f77f,x
$14:fe9c  aa            tax
$14:fe9d  00 e3         brk #$e3
$14:fe9f  18            clc
$14:fea0  46 40         lsr $40
$14:fea2  04 6d         tsb $6d
$14:fea4  ad 08 5d      lda $5d08
$14:fea7  ae 0c c9      ldx $c90c
$14:feaa  00 00         brk #$00
$14:feac  ea            nop
$14:fead  00 e0         brk #$e0
$14:feaf  00 ed         brk #$ed
$14:feb1  78            sei
$14:feb2  e1 09         sbc ($09,x)
$14:feb4  e3 18         sbc $18,s
$14:feb6  1e 20 ea      asl $ea20,x
$14:feb9  f4 04 5d      pea $5d04
$14:febc  ad 08 ae      lda $ae08
$14:febf  0c c9 00      tsb $00c9
$14:fec2  ea            nop
$14:fec3  f4 e0 01      pea $01e0
$14:fec6  ed b4 e1      sbc $e1b4
$14:fec9  0a            asl a
$14:feca  e3 18         sbc $18,s
$14:fecc  46 7f         lsr $7f
$14:fece  0c c9 c9      tsb $c9c9
$14:fed1  00 e0         brk #$e0
$14:fed3  04 ea         tsb $ea
$14:fed5  f4 ed a0      pea $a0ed
$14:fed8  e1 0b         sbc ($0b,x)
$14:feda  e3 30         sbc $30,s
$14:fedc  5a            phy
$14:fedd  1e 04 6d      asl $6d04,x
$14:fee0  ad 08 5d      lda $5d08
$14:fee3  ae 0c c9      ldx $c90c
$14:fee6  00 ed         brk #$ed
$14:fee8  a5 e1         lda $e1
$14:feea  0a            asl a
$14:feeb  0c c9 c9      tsb $c9c9
$14:feee  00 ed         brk #$ed
$14:fef0  c3 e1         cmp $e1,s
$14:fef2  0a            asl a
$14:fef3  0c c9 c9      tsb $c9c9
$14:fef6  00 ea         brk #$ea
$14:fef8  00 e0         brk #$e0
$14:fefa  00 ed         brk #$ed
$14:fefc  5a            phy
$14:fefd  e1 08         sbc ($08,x)
$14:feff  e3 18         sbc $18,s
$14:ff01  46 40         lsr $40
$14:ff03  0c c9 04      tsb $04c9
$14:ff06  5d ad 08      eor $08ad,x
$14:ff09  ae 00 e0      ldx $e000
$14:ff0c  04 ea         tsb $ea
$14:ff0e  00 ed         brk #$ed
$14:ff10  78            sei
$14:ff11  e1 0b         sbc ($0b,x)
$14:ff13  e3 03         sbc $03,s
$14:ff15  5a            phy
$14:ff16  1e 0c c9      asl $c90c,x
$14:ff19  c9 00 00      cmp #$0000
$14:ff1c  20 00 34      jsr $3400
$14:ff1f  2c 53 73      bit $7353
$14:ff22  ce 76 e9      dec $e976
$14:ff25  76 46         ror $46,x
$14:ff27  7d c4 7d      adc $7dc4,x
$14:ff2a  28            plp
$14:ff2b  80 71         bra $ff9e
$14:ff2d  82 8d 84      brl $83bd
$14:ff30  cc 84 e7      cpy $e784
$14:ff33  84 f0         sty $f0
$14:ff35  84 f0         sty $f0
$14:ff37  84 55         sty $55
$14:ff39  89 55 89      bit #$8955
$14:ff3c  3f 93 3f 93   and $933f93,x
$14:ff40  02 00         cop #$00
$14:ff42  fd 0f 21      sbc $210f,x
$14:ff45  96 00         stx $00,y
$14:ff47  00 08         brk #$08
$14:ff49  1b            tcs
$14:ff4a  10 1e         bpl $ff6a
$14:ff4c  13 0c         ora ($0c,s),y
$14:ff4e  18            clc
$14:ff4f  19 1a 01      ora $011a,y
$14:ff52  01 00         ora ($00,x)
$14:ff54  01 8d         ora ($8d,x)
$14:ff56  46 a2         lsr $a2
$14:ff58  11 b8         ora ($b8),y
$14:ff5a  83 bc         sta $bc,s
$14:ff5c  23 31         and $31,s
$14:ff5e  97 88         sta [$88],y
$14:ff60  46 de         lsr $de
$14:ff62  00 f6         brk #$f6
$14:ff64  07 78         ora [$78]
$14:ff66  46 23         lsr $23
$14:ff68  71 88         adc ($88),y
$14:ff6a  d4 8a         pei ($8a)
$14:ff6c  43 19         eor $19,s
$14:ff6e  00 83         brk #$83
$14:ff70  e8            inx
$14:ff71  23 0f         and $0f,s
$14:ff73  d2 78         cmp ($78)
$14:ff75  8c 8a 07      sty $078a
$14:ff78  02 90         cop #$90
$14:ff7a  be 06 45      ldx $4506,y
$14:ff7d  0b            phd
$14:ff7e  03 00         ora $00,s
$14:ff80  10 21         bpl $ffa3
$14:ff82  72 38         adc ($38)
$14:ff84  58            cli
$14:ff85  8c a0 52      sty $52a0
$14:ff88  39 1c 12      and $121c,y
$14:ff8b  17 0a         ora [$0a],y
$14:ff8d  7f 04 2e 06   adc $062e04,x
$14:ff91  23 0e         and $0e,s
$14:ff93  b8            clv
$14:ff94  cc ee d3      cpy $d3ee
$14:ff97  38            sec
$14:ff98  20 b4 85      jsr $85b4
$14:ff9b  61 d7         adc ($d7,x)
$14:ff9d  18            clc
$14:ff9e  88            dey
$14:ff9f  8c 22 43      sty $4322
$14:ffa2  a0 88 8b      ldy #$8b88
$14:ffa5  48            pha
$14:ffa6  66 22         ror $22
$14:ffa8  30 82         bmi $ff2c
$14:ffaa  c4 de         cpy $de
$14:ffac  60            rts
$14:ffad  3a            dec a
$14:ffae  08            php
$14:ffaf  c8            iny
$14:ffb0  b4 48         ldy $48,x
$14:ffb2  85 04         sta $04
$14:ffb4  89 43 40      bit #$4043
$14:ffb7  42 5a         wdm #$5a
$14:ffb9  18            clc
$14:ffba  8c 84 9e      sty $9e84
$14:ffbd  91 a3         sta ($a3),y
$14:ffbf  30 16         bmi $ffd7
$14:ffc1  0e 33 13      asl $1333
$14:ffc4  27 88         and [$88]
$14:ffc6  c0 63 51      cpy #$5163
$14:ffc9  50 10         bvc $ffdb
$14:ffcb  06 c0         asl $c0
$14:ffcd  2c 11 97      bit $9711
$14:ffd0  d0 1c         bne $ffee
$14:ffd2  18            clc
$14:ffd3  82 22 c1      brl $c0f8
$14:ffd6  0d 00 ac      ora $ac00
$14:ffd9  04 62         tsb $62
$14:ffdb  85 09         sta $09
$14:ffdd  19 10 e4      ora $e410,y
$14:ffe0  31 b8         and ($b8),y
$14:ffe2  9c 44 66      stz $6644
$14:ffe5  30 33         bmi $001a
$14:ffe7  a8            tay
$14:ffe8  41 c4         eor ($c4,x)
$14:ffea  62 34 08      per $0821
$14:ffed  24 8e         bit $8e
$14:ffef  36 6c         rol $6c,x
$14:fff1  02 38         cop #$38
$14:fff3  a1 41         lda ($41,x)
$14:fff5  ee 11 06      inc $0611
$14:fff8  09 44 e0      ora #$e044
$14:fffb  0c ff 70      tsb $70ff
$14:fffe  60            rts
$14:ffff  00 00         brk #$00
