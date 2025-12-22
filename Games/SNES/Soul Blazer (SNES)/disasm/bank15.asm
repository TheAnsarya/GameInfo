; Soul Blazer (SNES) - Bank $15
; Disassembled from ROM
; File offset: $0a8000-$0affff
; CPU address: $15:$8000-$15:$ffff
;===========================================================

.bank $15
.org $8000

$15:8000  00 20         brk #$20
$15:8002  80 c0         bra $7fc4
$15:8004  a8            tay
$15:8005  34 6e         bit $6e,x
$15:8007  2e 3f a3      rol $a33f
$15:800a  9b            txy
$15:800b  e0 f2 f9      cpx #$f9f2
$15:800e  7e fe 2f      ror $2ffe,x
$15:8011  9b            txy
$15:8012  43 b1         eor $b1,s
$15:8014  80 c0         bra $7fd6
$15:8016  28            plp
$15:8017  34 0e         bit $0e,x
$15:8019  0e 07 8b      asl $8b07
$15:801c  81 ca         sta ($ca,x)
$15:801e  e0 76 38      cpx #$3876
$15:8021  1d ce 03      ora $03ce,x
$15:8024  df 81 c0 60   cmp $60c081,x
$15:8028  28            plp
$15:8029  14 0d         trb $0d
$15:802b  04 83         tsb $83
$15:802d  c1 20         cmp ($20,x)
$15:802f  f8            sed
$15:8030  48            pha
$15:8031  3a            dec a
$15:8032  14 89         trb $89
$15:8034  84 23         sty $23
$15:8036  f9 98 80      sbc $8098,y
$15:8039  40            rti
$15:803a  30 10         bmi $804c
$15:803c  0e 04 03      asl $0304
$15:803f  a0 24 1d      ldy #$1d24
$15:8042  c4 03         cpy $03
$15:8044  f1 04         sbc ($04),y
$15:8046  f4 61 83      pea $8361
$15:8049  e0 ef 08      cpx #$08ef
$15:804c  0c 1a 0b      tsb $0b1a
$15:804f  0f 88 c6 e4   ora $e4c688
$15:8053  32 be         and ($be)
$15:8055  5d bd f6      eor $f6bd,x
$15:8058  02 f1         cop #$f1
$15:805a  20 14 06      jsr $0614
$15:805d  0b            phd
$15:805e  01 9a         ora ($9a,x)
$15:8060  c0 7e 30      cpy #$307e
$15:8063  1f c8 84 04   ora $0484c8,x
$15:8067  00 10         brk #$10
$15:8069  8a            txa
$15:806a  00 6c         brk #$6c
$15:806c  03 e0         ora $e0,s
$15:806e  1f 8d 80 a8   ora $a8808d,x
$15:8072  0b            phd
$15:8073  e2 31         sep #$31
$15:8075  4a            lsr a
$15:8076  8d 6d ee      sta $ee6d
$15:8079  3a            dec a
$15:807a  fe 2e 98      inc $982e,x
$15:807d  7e d4 5a      ror $5ad4,x
$15:8080  0f 57 83 f1   ora $f18357
$15:8084  c0 93         cpy #$93
$15:8086  74 34         stz $34,x
$15:8088  25 fa         and $fa
$15:808a  14 90         trb $90
$15:808c  be 20 30      ldx $3020,y
$15:808f  b8            clv
$15:8090  5c be 0b 66   jml $660bbe
$15:8094  1f c4 56 03   ora $0356c4,x
$15:8098  31 80         and ($80),y
$15:809a  de 4c 04      dec $044c,x
$15:809d  92 f5         sta ($f5)
$15:809f  1e 07 c2      asl $c207,x
$15:80a2  07 03         ora [$03]
$15:80a4  87 c3         sta [$c3]
$15:80a6  a7 93         lda [$93]
$15:80a8  8b            phb
$15:80a9  85 83         sta $83
$15:80ab  80 4e         bra $80fb
$15:80ad  17 7f         ora [$7f],y
$15:80af  46 23         lsr $23
$15:80b1  1f cf 87 c3   ora $c387cf,x
$15:80b5  00 fc         brk #$fc
$15:80b7  52 f8         eor ($f8)
$15:80b9  83 f8         sta $f8,s
$15:80bb  51 17         eor ($17),y
$15:80bd  08            php
$15:80be  17 3e         ora [$3e],y
$15:80c0  0d fe 77      ora $77fe
$15:80c3  1b            tcs
$15:80c4  f5 10         sbc $10,x
$15:80c6  61 7f         adc ($7f,x)
$15:80c8  83 5f         sta $5f,s
$15:80ca  dd c6 83      cmp $83c6,x
$15:80cd  08            php
$15:80ce  1c 06 0f      trb $0f06
$15:80d1  02 8f         cop #$8f
$15:80d3  07 82         ora [$82]
$15:80d5  01 1a         ora ($1a,x)
$15:80d7  1b            tcs
$15:80d8  83 00         sta $00,s
$15:80da  ca            dex
$15:80db  a5 0f         lda $0f
$15:80dd  80 c3         bra $80a2
$15:80df  e0 f0         cpx #$f0
$15:80e1  f8            sed
$15:80e2  28            plp
$15:80e3  dc 24 10      jml [$1024]
$15:80e6  88            dey
$15:80e7  24 42         bit $42
$15:80e9  7d 24 87      adc $8724,x
$15:80ec  43 63         eor $63,s
$15:80ee  f1 e3         sbc ($e3),y
$15:80f0  48            pha
$15:80f1  30 c0         bmi $80b3
$15:80f3  6e 13 09      ror $0913
$15:80f6  c4 b2         cpy $b2
$15:80f8  79 1a 9f      adc $9f1a,y
$15:80fb  47 a3         eor [$a3]
$15:80fd  90 78         bcc $8177
$15:80ff  f1 f0         sbc ($f0),y
$15:8101  b0 10         bcs $8113
$15:8103  00 58         brk #$58
$15:8105  70 28         bvs $812f
$15:8107  1e 0a 05      asl $050a,x
$15:810a  81 2e         sta ($2e,x)
$15:810c  2f 90 b8 4c   and $4cb890
$15:8110  11 e4         ora ($e4),y
$15:8112  95 05         sta $05,x
$15:8114  18            clc
$15:8115  a6 14         ldx $14
$15:8117  be 86 11      ldx $1186,y
$15:811a  5b            tcd
$15:811b  89 54         bit #$54
$15:811d  1e 60 af      asl $af60,x
$15:8120  e9 44         sbc #$44
$15:8122  22 69 26 8c   jsl $8c2669
$15:8126  41 a0         eor ($a0,x)
$15:8128  10 e3         bpl $810d
$15:812a  f0 b5         beq $80e1
$15:812c  ce e1 78      dec $78e1
$15:812f  8c 4f a3      sty $a34f
$15:8132  11 e9         ora ($e9),y
$15:8134  84 f9         sty $f9
$15:8136  ae db dd      ldx $dddb
$15:8139  97 7f         sta [$7f],y
$15:813b  31 f7         and ($f7),y
$15:813d  bc 78 eb      ldy $eb78,x
$15:8140  9f 4f 67 ab   sta $ab674f,x
$15:8144  4d a4 c6      eor $c6a4
$15:8147  77 6b         adc [$6b],y
$15:8149  bf 2c 17 63   lda $63172c,x
$15:814d  41 f8         eor ($f8,x)
$15:814f  a0 7c         ldy #$7c
$15:8151  28            plp
$15:8152  1e 3b 47      asl $473b,x
$15:8155  c6 6f         dec $6f
$15:8157  f3 a8         sbc ($a8,s),y
$15:8159  48            pha
$15:815a  ae 17 6c      ldx $6c17
$15:815d  07 fa         ora [$fa]
$15:815f  21 e6         and ($e6,x)
$15:8161  91 65         sta ($65),y
$15:8163  6c dd ff      jmp ($ffdd)
$15:8166  16 f7         asl $f7,x
$15:8168  81 5b         sta ($5b,x)
$15:816a  b4 64         ldy $64,x
$15:816c  fc 18 0c      jsr ($0c18,x)
$15:816f  74 42         stz $42,x
$15:8171  1d 22 8e      ora $8e22,x
$15:8174  34 82         bit $82,x
$15:8176  05 2c         ora $2c
$15:8178  80 70         bra $81ea
$15:817a  b0 90         bcs $810c
$15:817c  c1 60         cmp ($60,x)
$15:817e  78            sei
$15:817f  7e 3c df      ror $df3c,x
$15:8182  96 7f         stx $7f,y
$15:8184  71 af         adc ($af),y
$15:8186  d8            cld
$15:8187  74 e5         stz $e5,x
$15:8189  9d 5e 6f      sta $6f5e,x
$15:818c  eb            xba
$15:818d  2d ac ca      and $caac
$15:8190  6b            rtl
$15:8191  f0 3b         beq $81ce
$15:8193  2c 17 e3      bit $e317
$15:8196  01 f0         ora ($f0,x)
$15:8198  51 04         eor ($04),y
$15:819a  03 c5         ora $c5,s
$15:819c  48            pha
$15:819d  f0 c5         beq $8164
$15:819f  fc 75 0f      jsr ($0f75,x)
$15:81a2  c6 62         dec $62
$15:81a4  e9 80         sbc #$80
$15:81a6  fe 44 3e      inc $3e44,x
$15:81a9  d3 2d         cmp ($2d,s),y
$15:81ab  d5 be         cmp $be,x
$15:81ad  49 c7         eor #$c7
$15:81af  d9 f0 eb      cmp $ebf0,y
$15:81b2  16 0f         asl $0f,x
$15:81b4  46 10         lsr $10
$15:81b6  3e 53 28      rol $2853,x
$15:81b9  64 be         stz $be
$15:81bb  21 07         and ($07,x)
$15:81bd  8c 40 f9      sty $f940
$15:81c0  98            tya
$15:81c1  08            php
$15:81c2  3e 87 63      rol $6387,x
$15:81c5  fd f9 7b      sbc $7bf9,x
$15:81c8  fd 19 7c      sbc $7c19,x
$15:81cb  c7 6f         cmp [$6f]
$15:81cd  29 e4         and #$e4
$15:81cf  be 7e a8      ldx $a87e,y
$15:81d2  df cf 27 bc   cmp $bc27cf,x
$15:81d6  80 3a         bra $8212
$15:81d8  8c 80 04      sty $0480
$15:81db  3a            dec a
$15:81dc  1a            inc a
$15:81dd  0f 99 28 28   ora $282899
$15:81e1  fe 3b 07      inc $073b,x
$15:81e4  f0 a0         beq $8186
$15:81e6  3f a8 f7 b2   and $b2f7a8,x
$15:81ea  4d ba af      eor $afba
$15:81ed  56 2d         lsr $2d,x
$15:81ef  5b            tcd
$15:81f0  2e 07 7b      rol $7b07
$15:81f3  c1 e8         cmp ($e8,x)
$15:81f5  c3 18         cmp $18,s
$15:81f7  42 3d         wdm #$3d
$15:81f9  00 69         brk #$69
$15:81fb  02 8c         cop #$8c
$15:81fd  30 d2         bmi $81d1
$15:81ff  c8            iny
$15:8200  67 31         adc [$31]
$15:8202  7e 14 1f      ror $1f14,x
$15:8205  8e b7 e5      stx $e5b7
$15:8208  8f e4 55 fb   sta $fb55e4
$15:820c  13 fd         ora ($fd,s),y
$15:820e  06 fb         asl $fb
$15:8210  03 fa         ora $fa,s
$15:8212  e3 7f         sbc $7f,s
$15:8214  30 9e         bmi $81b4
$15:8216  f8            sed
$15:8217  0f ca 05 c8   ora $c805ca
$15:821b  98            tya
$15:821c  76 24         ror $24,x
$15:821e  1a            inc a
$15:821f  0a            asl a
$15:8220  06 02         asl $02
$15:8222  81 c1         sta ($c1,x)
$15:8224  83 e0         sta $e0,s
$15:8226  e0 08         cpx #$08
$15:8228  ff 50 6a b4   sbc $b46a50,x
$15:822c  21 90         and ($90,x)
$15:822e  08            php
$15:822f  b4 02         ldy $02,x
$15:8231  17 22         ora [$22],y
$15:8233  e3 65         sbc $65,s
$15:8235  3b            tsc
$15:8236  91 0e         sta ($0e),y
$15:8238  87 01         sta [$01]
$15:823a  da            phx
$15:823b  4e f1 86      lsr $86f1
$15:823e  47 27         eor [$27]
$15:8240  d6 8f         dec $8f,x
$15:8242  e7 83         sbc [$83]
$15:8244  e1 20         sbc ($20,x)
$15:8246  f0 50         beq $8298
$15:8248  28            plp
$15:8249  0f d4 76 94   ora $9476d4
$15:824d  04 30         tsb $30
$15:824f  01 b1         ora ($b1,x)
$15:8251  07 f6         ora [$f6]
$15:8253  02 01         cop #$01
$15:8255  b4 80         ldy $80,x
$15:8257  6b            rtl
$15:8258  20 1e 1a      jsr $1a1e
$15:825b  0f 46 83 1c   ora $1c8346
$15:825f  80 48         bra $82a9
$15:8261  a4 51         ldy $51
$15:8263  c8            iny
$15:8264  e5 fe         sbc $fe
$15:8266  7d 7f 95      adc $957f,x
$15:8269  5f e4 53 e2   eor $e253e4,x
$15:826d  20 45 27      jsr $2745
$15:8270  c3 d0         cmp $d0,s
$15:8272  76 8a         ror $8a,x
$15:8274  9c 07 21      stz $2107
$15:8277  14 80         trb $80
$15:8279  46 a1         lsr $a1
$15:827b  10 d8         bpl $8255
$15:827d  2c 1a 04      bit $041a
$15:8280  ed 28 7c      sbc $7c28
$15:8283  14 be         trb $be
$15:8285  50 78         bvc $82ff
$15:8287  11 68         ora ($68),y
$15:8289  c1 ed         cmp ($ed,x)
$15:828b  80 64         bra $82f1
$15:828d  87 03         sta [$03]
$15:828f  61 f0         adc ($f0,x)
$15:8291  b6 5f         ldx $5f,y
$15:8293  23 04         and $04,s
$15:8295  b2 38         lda ($38)
$15:8297  1c 03 81      trb $8103
$15:829a  80 b8         bra $8254
$15:829c  58            cli
$15:829d  23 91         and $91,s
$15:829f  85 68         sta $68
$15:82a1  5c 0d 14 9b   jml $9b140d
$15:82a5  f2 68         sbc ($68)
$15:82a7  19 80 b2      ora $b280,y
$15:82aa  10 48         bpl $82f4
$15:82ac  24 32         bit $32
$15:82ae  09 18         ora #$18
$15:82b0  84 4c         sty $4c
$15:82b2  22 17 09 87   jsl $870917
$15:82b6  82 c0 af      brl $3279
$15:82b9  e2 68         sep #$68
$15:82bb  50 e0         bvc $829d
$15:82bd  5c 7a 27 17   jml $17277a
$15:82c1  03 8f         ora $8f,s
$15:82c3  c7 62         cmp [$62]
$15:82c5  70 9c         bvs $8263
$15:82c7  4c 37 2f      jmp $2f37
$15:82ca  86 4d         stx $4d
$15:82cc  0a            asl a
$15:82cd  0c 03 87      tsb $8703
$15:82d0  40            rti
$15:82d1  e3 60         sbc $60,s
$15:82d3  38            sec
$15:82d4  38            sec
$15:82d5  0e 5e 03      asl $035e
$15:82d8  93 80         sta ($80,s),y
$15:82da  f2 70         sbc ($70)
$15:82dc  3e d0 ff      rol $ffd0,x
$15:82df  b4 7f         ldy $7f,x
$15:82e1  d7 1c         cmp [$1c],y
$15:82e3  fb            xce
$15:82e4  cf 3e 70 4a   cmp $4a703e
$15:82e8  fc 22 7f      jsr ($7f22,x)
$15:82eb  00 83         brk #$83
$15:82ed  aa            tax
$15:82ee  c8            iny
$15:82ef  72 03         adc ($03)
$15:82f1  90 9e         bcc $8291
$15:82f3  4e 27 93      lsr $9327
$15:82f6  09 c2         ora #$c2
$15:82f8  ac a3 fe      ldy $fea3
$15:82fb  0b            phd
$15:82fc  fe 43 5f      inc $5f43,x
$15:82ff  70 ef         bvs $82f0
$15:8301  de 33 d4      dec $d433,x
$15:8304  0f b4 83 f9   ora $f983b4
$15:8308  00 f0         brk #$f0
$15:830a  2a            rol a
$15:830b  ca            dex
$15:830c  20 8e 1b      jsr $1b8e
$15:830f  c4 e2         cpy $e2
$15:8311  f1 18         sbc ($18),y
$15:8313  05 1f         ora $1f
$15:8315  aa            tax
$15:8316  f5 f8         sbc $f8,x
$15:8318  84 ff         sty $ff
$15:831a  e0 fe         cpx #$fe
$15:831c  78            sei
$15:831d  67 ce         adc [$ce]
$15:831f  29 e7         and #$e7
$15:8321  96 5c         stx $5c,y
$15:8323  df 03 05 b8   cmp $b80503,x
$15:8327  41 83         eor ($83,x)
$15:8329  e5 1c         sbc $1c
$15:832b  84 47         sty $47
$15:832d  22 00 63 bc   jsl $bc6300
$15:8331  5b            tcd
$15:8332  3a            dec a
$15:8333  de 49 37      dec $3749,x
$15:8336  a3 df         lda $df,s
$15:8338  29 ff         and #$ff
$15:833a  c0 7f         cpy #$7f
$15:833c  f0 02         beq $8340
$15:833e  c8            iny
$15:833f  06 c3         asl $c3
$15:8341  01 0f         ora ($0f,x)
$15:8343  84 43         sty $43
$15:8345  62 17 98      per $1b5f
$15:8348  8c e2 02      sty $02e2
$15:834b  a2 5f         ldx #$5f
$15:834d  1e bf 51      asl $51bf,x
$15:8350  07 ef         ora [$ef]
$15:8352  54 7a f3      mvn $f3,$7a
$15:8355  82 c8 5f      brl $e320
$15:8358  e0 0f         cpx #$0f
$15:835a  b0 87         bcs $82e3
$15:835c  c0 3e         cpy #$3e
$15:835e  13 0b         ora ($0b,s),y
$15:8360  85 42         sta $42
$15:8362  40            rti
$15:8363  24 00         bit $00
$15:8365  51 aa         eor ($aa),y
$15:8367  ca            dex
$15:8368  bd e0 f9      lda $f9e0,x
$15:836b  78            sei
$15:836c  37 1c         and [$1c],y
$15:836e  0e 75 83      asl $8375
$15:8371  3d 50 e7      and $e750,x
$15:8374  da            phx
$15:8375  33 f4         and ($f4,s),y
$15:8377  0f f4 a1 10   ora $10a1f4
$15:837b  8b            phb
$15:837c  a0 41         ldy #$41
$15:837e  84 40         sty $40
$15:8380  4c 31 09      jmp $0931
$15:8383  c7 cf         cmp [$cf]
$15:8385  1f d8 9b f5   ora $f59bd8,x
$15:8389  a3 3f         lda $3f,s
$15:838b  b9 e1 e5      lda $e5e1,y
$15:838e  00 01         brk #$01
$15:8390  80 00         bra $8392
$15:8392  04 c2         tsb $c2
$15:8394  40            rti
$15:8395  0a            asl a
$15:8396  09 e2         ora #$e2
$15:8398  1f d3 1e a9   ora $a91ed3,x
$15:839c  48            pha
$15:839d  1c 0e 0f      trb $0f0e
$15:83a0  03 87         ora $87,s
$15:83a2  c0 ab         cpy #$ab
$15:83a4  55 0b         eor $0b,x
$15:83a6  84 4b         sty $4b
$15:83a8  a1 1c         lda ($1c,x)
$15:83aa  d0 68         bne $8414
$15:83ac  1c 60 ef      trb $ef60
$15:83af  28            plp
$15:83b0  6c 3a 5d      jmp ($5d3a)
$15:83b3  7e f6 7f      ror $7ff6,x
$15:83b6  bc 1f ca      ldy $ca1f,x
$15:83b9  00 74         brk #$74
$15:83bb  60            rts
$15:83bc  30 18         bmi $83d6
$15:83be  18            clc
$15:83bf  40            rti
$15:83c0  1d e1 02      ora $02e1,x
$15:83c3  0b            phd
$15:83c4  04 18         tsb $18
$15:83c6  30 10         bmi $83d8
$15:83c8  68            pla
$15:83c9  74 10         stz $10,x
$15:83cb  1f cc 84 77   ora $7784cc,x
$15:83cf  84 02         sty $02
$15:83d1  04 37         tsb $37
$15:83d3  00 b0         brk #$b0
$15:83d5  05 41         ora $41
$15:83d7  8e c6 70      stx $70c6
$15:83da  33 80         and ($80,s),y
$15:83dc  d8            cld
$15:83dd  09 62         ora #$62
$15:83df  14 10         trb $10
$15:83e1  a8            tay
$15:83e2  40            rti
$15:83e3  4a            lsr a
$15:83e4  44 37 10      mvp $10,$37
$15:83e7  70 04         bvs $83ed
$15:83e9  44 94 24      mvp $24,$94
$15:83ec  76 1f         ror $1f,x
$15:83ee  39 18 63      and $6318,y
$15:83f1  f0 1f         beq $8412
$15:83f3  fc 7f e1      jsr ($e17f,x)
$15:83f6  f0 37         beq $842f
$15:83f8  f1 24         sbc ($24),y
$15:83fa  60            rts
$15:83fb  30 f8         bmi $83f5
$15:83fd  1c fa 1d      trb $1dfa
$15:8400  f8            sed
$15:8401  9c 78 01      stz $0178
$15:8404  82 45 24      brl $a84c
$15:8407  8e 70 38      stx $3870
$15:840a  18            clc
$15:840b  0c 01 b9      tsb $b901
$15:840e  d5 9e         cmp $9e,x
$15:8410  e3 0f         sbc $0f,s
$15:8412  45 12         eor $12
$15:8414  ff 60 b7 c8   sbc $c8b760,x
$15:8418  67 d1         adc [$d1]
$15:841a  38            sec
$15:841b  fc 0e 3d      jsr ($3d0e,x)
$15:841e  02 6c         cop #$6c
$15:8420  84 6e         sty $6e
$15:8422  11 e7         ora ($e7),y
$15:8424  aa            tax
$15:8425  78            sei
$15:8426  2e 16 19      rol $1916
$15:8429  84 cc         sty $cc
$15:842b  d4 45         pei ($45)
$15:842d  50 80         bvc $83af
$15:842f  c1 21         cmp ($21,x)
$15:8431  89 c4         bit #$c4
$15:8433  81 41         sta ($41,x)
$15:8435  e1 10         sbc ($10,x)
$15:8437  d8            cld
$15:8438  04 16         tsb $16
$15:843a  0b            phd
$15:843b  07 81         ora [$81]
$15:843d  39 41 00      and $0041,y
$15:8440  a3 80         lda $80,s
$15:8442  85 40         sta $40
$15:8444  21 10         and ($10,x)
$15:8446  09 e4         ora #$e4
$15:8448  02 09         cop #$09
$15:844a  04 e3         tsb $e3
$15:844c  50 b4         bvc $8402
$15:844e  72 2e         adc ($2e)
$15:8450  9e 4f e7      stz $e74f,x
$15:8453  91 fd         sta ($fd),y
$15:8455  e4 7d         cpx $7d
$15:8457  3a            dec a
$15:8458  1c fc 18      trb $18fc
$15:845b  1e 18 68      asl $6818,x
$15:845e  17 0e         ora [$0e],y
$15:8460  05 e3         ora $e3
$15:8462  c1 fa         cmp ($fa,x)
$15:8464  f0 22         beq $8488
$15:8466  70 ed         bvs $8455
$15:8468  e0 7f         cpx #$7f
$15:846a  e4 16         cpx $16
$15:846c  7a            ply
$15:846d  24 d6         bit $d6
$15:846f  4b            phk
$15:8470  77 59         adc [$59],y
$15:8472  c1 6c         cmp ($6c,x)
$15:8474  27 50         and [$50]
$15:8476  0b            phd
$15:8477  c2 e9         rep #$e9
$15:8479  28            plp
$15:847a  1a            inc a
$15:847b  49 27 5b      eor #$5b27
$15:847e  25 f3         and $f3
$15:8480  c9 7e f2      cmp #$f27e
$15:8483  7e bd 08      ror $08bd,x
$15:8486  08            php
$15:8487  96 41         stx $41,y
$15:8489  c4 82         cpy $82
$15:848b  79 b0 5e      adc $5eb0,y
$15:848e  b3 40         lda ($40,s),y
$15:8490  60            rts
$15:8491  c5 60         cmp $60
$15:8493  2f b7 d0 8f   and $8fd0b7
$15:8497  e8            inx
$15:8498  12 44         ora ($44)
$15:849a  f4 d0 48      pea $48d0
$15:849d  3a            dec a
$15:849e  19 0f 86      ora $860f,y
$15:84a1  43 fd         eor $fd,s
$15:84a3  96 f6         stx $f6,y
$15:84a5  e9 4b e9      sbc #$e94b
$15:84a8  c0 80         cpy #$80
$15:84aa  78            sei
$15:84ab  30 1e         bmi $84cb
$15:84ad  8c 07 bb      sty $bb07
$15:84b0  01 dd         ora ($dd,x)
$15:84b2  c1 46         cmp ($46,x)
$15:84b4  22 10 c8 47   jsl $47c810
$15:84b8  1a            inc a
$15:84b9  89 a6 93      bit #$93a6
$15:84bc  75 f2         adc $f2,x
$15:84be  df 7c af fd   cmp $fdaf7c,x
$15:84c2  38            sec
$15:84c3  2a            rol a
$15:84c4  f2 c3         sbc ($c3)
$15:84c6  41 38         eor ($38,x)
$15:84c8  f0 6f         beq $8539
$15:84ca  19 a0 30      ora $30a0,y
$15:84cd  3e f5 60      rol $60f5,x
$15:84d0  80 1a         bra $84ec
$15:84d2  29 04 fc      and #$fc04
$15:84d5  7a            ply
$15:84d6  3d 18 4e      and $4e18,x
$15:84d9  02 35         cop #$35
$15:84db  00 a3         brk #$a3
$15:84dd  38            sec
$15:84de  9e 7d 3d      stz $3d7d,x
$15:84e1  9f 8c e3 74   sta $74e38c,x
$15:84e5  2f 12 0c c4   and $c40c12
$15:84e9  83 f1         sta $f1,s
$15:84eb  80 fc         bra $84e9
$15:84ed  40            rti
$15:84ee  1e ad 70      asl $70ad,x
$15:84f1  90 29         bcc $851c
$15:84f3  40            rti
$15:84f4  05 f0         ora $f0
$15:84f6  08            php
$15:84f7  84 22         sty $22
$15:84f9  41 10         eor ($10,x)
$15:84fb  7f 87 c2 01   adc $01c287,x
$15:84ff  f0 00         beq $8501
$15:8501  ac c2 01      ldy $01c2
$15:8504  60            rts
$15:8505  52 0a         eor ($0a)
$15:8507  94 30         sty $30,x
$15:8509  18            clc
$15:850a  0a            asl a
$15:850b  1c 0b 8f      trb $8f0b
$15:850e  44 e2 e0      mvp $e0,$e2
$15:8511  71 f8         adc ($f8),y
$15:8513  ec 4e 13      cpx $134e
$15:8516  89 86 e5      bit #$e586
$15:8519  f0 fd         beq $8518
$15:851b  14 4a         trb $4a
$15:851d  0c 03 87      tsb $8703
$15:8520  40            rti
$15:8521  e3 60         sbc $60,s
$15:8523  38            sec
$15:8524  38            sec
$15:8525  0e 5e 03      asl $035e
$15:8528  93 80         sta ($80,s),y
$15:852a  f2 70         sbc ($70)
$15:852c  3c f5 4e      bit $4ef5,x
$15:852f  87 43         sta [$43]
$15:8531  d1 08         cmp ($08),y
$15:8533  98            tya
$15:8534  48            pha
$15:8535  3b            tsc
$15:8536  15 0f         ora $0f,x
$15:8538  e4 53         cpx $53
$15:853a  d1 28         cmp ($28),y
$15:853c  ce 60 bf      dec $bf60
$15:853f  56 2f         lsr $2f,x
$15:8541  07 00         ora [$00]
$15:8543  36 1d         rol $1d,x
$15:8545  88            dey
$15:8546  07 a2         ora [$a2]
$15:8548  81 e8         sta ($e8,x)
$15:854a  80 75         bra $85c1
$15:854c  20 17 e8      jsr $e817
$15:854f  07 f8         ora [$f8]
$15:8551  4e 10 08      lsr $0810
$15:8554  1c 0a 0f      trb $0f0a
$15:8557  04 c2         tsb $c2
$15:8559  c0 46         cpy #$46
$15:855b  a9 eb a1      lda #$a1eb
$15:855e  a8            tay
$15:855f  02 02         cop #$02
$15:8561  70 08         bvs $856b
$15:8563  06 1a         asl $1a
$15:8565  01 81         ora ($81,x)
$15:8567  c0 62         cpy #$62
$15:8569  c9 05 40      cmp #$4005
$15:856c  50 01         bvc $856f
$15:856e  3f 04 40 5f   and $5f4004,x
$15:8572  c3 7a         cmp $7a,s
$15:8574  41 60         eor ($60,x)
$15:8576  30 f8         bmi $8570
$15:8578  74 26         stz $26,x
$15:857a  09 04 83      ora #$8304
$15:857d  42 d0         wdm #$d0
$15:857f  60            rts
$15:8580  80 38         bra $85ba
$15:8582  32 00         and ($00)
$15:8584  61 70         adc ($70,x)
$15:8586  08            php
$15:8587  4c 02 08      jmp $0802
$15:858a  22 12 7c ca   jsl $ca7c12
$15:858e  93 b9         sta ($b9,s),y
$15:8590  d6 35         dec $35,x
$15:8592  0c c2 d1      tsb $d1c2
$15:8595  58            cli
$15:8596  aa            tax
$15:8597  61 e1         adc ($e1,x)
$15:8599  19 98 ee      ora $ee98,y
$15:859c  ca            dex
$15:859d  7d e5 bf      adc $bfe5,x
$15:85a0  f1 af         sbc ($af),y
$15:85a2  f5 7b         sbc $7b,x
$15:85a4  7d 9e 01      adc $019e,x
$15:85a7  53 90         eor ($90,s),y
$15:85a9  42 2e         wdm #$2e
$15:85ab  11 db         ora ($db),y
$15:85ad  14 fa         trb $fa
$15:85af  83 7f         sta $7f,s
$15:85b1  80 02         bra $85b5
$15:85b3  42 df         wdm #$df
$15:85b5  00 fe         brk #$fe
$15:85b7  f3 7f         sbc ($7f,s),y
$15:85b9  51 0f         eor ($0f),y
$15:85bb  ac 12 33      ldy $3312
$15:85be  c8            iny
$15:85bf  9d c6 ae      sta $aec6,x
$15:85c2  13 2f         ora ($2f,s),y
$15:85c4  c7 ca         cmp [$ca]
$15:85c6  5d 24 fa      eor $fa24,x
$15:85c9  f0 bc         beq $8587
$15:85cb  0b            phd
$15:85cc  30 85         bmi $8553
$15:85ce  f2 26         sbc ($26)
$15:85d0  f1 af         sbc ($af),y
$15:85d2  2c cb 9b      bit $9bcb
$15:85d5  f2 86         sbc ($86)
$15:85d7  c9 3b 3c      cmp #$3c3b
$15:85da  2e 9e 43      rol $439e
$15:85dd  11 98         ora ($98),y
$15:85df  ca            dex
$15:85e0  6f f7 1f 5f   adc $5f1ff7
$15:85e4  ef 8b fd 89   sbc $89fd8b
$15:85e8  ff db b3 fd   sbc $fdb3db,x
$15:85ec  c9 06 1e      cmp #$1e06
$15:85ef  c1 93         cmp ($93,x)
$15:85f1  b0 6e         bcs $8661
$15:85f3  28            plp
$15:85f4  1f d8 17 fa   ora $fa17d8,x
$15:85f8  03 ff         ora $ff,s
$15:85fa  80 67         bra $8663
$15:85fc  e0 19         cpx #$19
$15:85fe  d8            cld
$15:85ff  2f ff 9d f9   and $f99dff
$15:8603  88            dey
$15:8604  fd 82 83      sbc $8382,x
$15:8607  79 8c 5c      adc $5c8c,y
$15:860a  ee 5e df      inc $df5e
$15:860d  37 fe         and [$fe],y
$15:860f  03 f7         ora $f7,s
$15:8611  e0 78         cpx #$78
$15:8613  60            rts
$15:8614  c2 32         rep #$32
$15:8616  8c 79 ee      sty $ee79
$15:8619  58            cli
$15:861a  df 34 66 25   cmp $256634,x
$15:861e  03 88         ora $88,s
$15:8620  4a            lsr a
$15:8621  23 17         and $17,s
$15:8623  49 3d a2      eor #$a23d
$15:8626  91 4c         sta ($4c),y
$15:8628  ad d7 ea      lda $ead7
$15:862b  15 fb         ora $fb,x
$15:862d  8d fe 19      sta $19fe
$15:8630  00 93         brk #$93
$15:8632  c0 2e 70      cpy #$702e
$15:8635  0b            phd
$15:8636  44 42 99      mvp $99,$42
$15:8639  33 af         and ($af,s),y
$15:863b  c8            iny
$15:863c  11 20         ora ($20),y
$15:863e  09 0c f4      ora #$f40c
$15:8641  13 fb         ora ($fb,s),y
$15:8643  cc ff c5      cpy $c5ff
$15:8646  be f0 69      ldx $69f0,y
$15:8649  d7 aa         cmp [$aa],y
$15:864b  35 0a         and $0a,x
$15:864d  de 66 ad      dec $ad66,x
$15:8650  9e af e4      stz $e4af,x
$15:8653  0f e9 c3 f3   ora $f3c3e9
$15:8657  40            rti
$15:8658  60            rts
$15:8659  d0 9f         bne $85fa
$15:865b  54 56 15      mvn $15,$56
$15:865e  f5 cd         sbc $cd,x
$15:8660  59 54 e1      eor $e154,y
$15:8663  03 81         ora $81,s
$15:8665  c3 e1         cmp $e1,s
$15:8667  d1 e8         cmp ($e8),y
$15:8669  c4 e2         cpy $e2
$15:866b  41 60         eor ($60,x)
$15:866d  a0 70 30      ldy #$3070
$15:8670  18            clc
$15:8671  06 70         asl $70
$15:8673  ab            plb
$15:8674  f9 98 dc      sbc $dc98,y
$15:8677  08            php
$15:8678  04 83         tsb $83
$15:867a  01 20         ora ($20,x)
$15:867c  d0 40         bne $86be
$15:867e  19 6f e0      ora $e06f,y
$15:8681  f0 58         beq $86db
$15:8683  3c 14 0f      bit $0f14,x
$15:8686  03 75         ora $75,s
$15:8688  d7 01         cmp [$01],y
$15:868a  e0 e0 68      cpx #$68e0
$15:868d  3c 1f 0e      bit $0e1f,x
$15:8690  06 41         asl $41
$15:8692  a2 da 0c      ldx #$0cda
$15:8695  07 83         ora [$83]
$15:8697  01 50         ora ($50,x)
$15:8699  e0 5c 30      cpx #$305c
$15:869c  1f 08 05 c2   ora $c20508,x
$15:86a0  01 f0         ora ($f0,x)
$15:86a2  07 00         ora [$00]
$15:86a4  50 c1         bvc $8667
$15:86a6  a0 0d 05      ldy #$050d
$15:86a9  d8            cld
$15:86aa  32 e9         and ($e9)
$15:86ac  78            sei
$15:86ad  17 fb         ora [$fb],y
$15:86af  05 be         ora $be
$15:86b1  43 3e         eor $3e,s
$15:86b3  89 c7 20      bit #$20c7
$15:86b6  91 f8         sta ($f8),y
$15:86b8  04 6a         tsb $6a
$15:86ba  0d 2d 91      ora $912d
$15:86bd  45 60         eor $60
$15:86bf  3e 0b 85      rol $850b,x
$15:86c2  86 61         stx $61
$15:86c4  33 80         and ($80,s),y
$15:86c6  41 20         eor ($20,x)
$15:86c8  6b            rtl
$15:86c9  e0 81 41      cpx #$4181
$15:86cc  62 13 29      per $afe2
$15:86cf  f4 fe e9      pea $e9fe
$15:86d2  30 fd         bmi $86d1
$15:86d4  40            rti
$15:86d5  75 f8         adc $f8,x
$15:86d7  19 ef f6      ora $f6ef,y
$15:86da  5d 66 cb      eor $cb66,x
$15:86dd  cc 2b 51      cpy $512b
$15:86e0  8c 2c 17      sty $172c
$15:86e3  f1 32         sbc ($32),y
$15:86e5  52 06         eor ($06)
$15:86e7  06 fd         asl $fd
$15:86e9  fd 81 59      sbc $5981,x
$15:86ec  b3 33         lda ($33,s),y
$15:86ee  0e 7c 63      asl $637c
$15:86f1  cf 05 bd 5a   cmp $5abd05
$15:86f5  2c 93 f9      bit $f993
$15:86f8  04 6e         tsb $6e
$15:86fa  2f 30 84 cf   and $cf8430
$15:86fe  a1 11         lda ($11,x)
$15:8700  b8            clv
$15:8701  05 36         ora $36
$15:8703  81 2a         sta ($2a,x)
$15:8705  80 79         bra $8780
$15:8707  ee 96 09      inc $0996
$15:870a  84 de         sty $de
$15:870c  01 09         ora ($09,x)
$15:870e  83 42         sta $42,s
$15:8710  20 f0 08      jsr $08f0
$15:8713  3c 82 c7      bit $c782,x
$15:8716  7c be fe      jmp ($febe,x)
$15:8719  ac 44 f1      ldy $f144
$15:871c  80 67         bra $8785
$15:871e  30 37         bmi $8757
$15:8720  1f 8d 7f 9f   ora $9f7f8d,x
$15:8724  2e b0 6d      rol $6db0
$15:8727  26 1f         rol $1f
$15:8729  eb            xba
$15:872a  01 7c         ora ($7c,x)
$15:872c  20 06 21      jsr $2106
$15:872f  f8            sed
$15:8730  c3 b9         cmp $b9,s
$15:8732  f3 0b         sbc ($0b,s),y
$15:8734  06 7c         asl $7c
$15:8736  d2 10         cmp ($10)
$15:8738  81 b0         sta ($b0,x)
$15:873a  c3 e0         cmp $e0,s
$15:873c  31 e8         and ($e8),y
$15:873e  9c 7e 07      stz $077e
$15:8741  1e 81 2e      asl $2e81,x
$15:8744  42 36         wdm #$36
$15:8746  87 08         sta [$08]
$15:8748  a4 02         ldy $02
$15:874a  21 01         and ($01,x)
$15:874c  88            dey
$15:874d  44 c8 e1      mvp $e1,$c8
$15:8750  00 81         brk #$81
$15:8752  40            rti
$15:8753  59 21 04      eor $0421,y
$15:8756  86 7e         stx $7e
$15:8758  ac 77 69      ldy $6977
$15:875b  89 44 3e      bit #$3e44
$15:875e  bf 19 ff fb   lda $fbff19,x
$15:8762  27 30         and [$30]
$15:8764  e2 47         sep #$47
$15:8766  26 70         rol $70
$15:8768  3f fd 83 f2   and $f283fd,x
$15:876c  60            rts
$15:876d  15 38         ora $38,x
$15:876f  7f a0 26 90   adc $9026a0,x
$15:8773  8e 78 e0      stx $e078
$15:8776  7f c9 d5 3a   adc $3ad5c9,x
$15:877a  f7 0f         sbc [$0f],y
$15:877c  be c1 e6      ldx $e6c1,y
$15:877f  f1 c9         sbc ($c9),y
$15:8781  4c 3a 67      jmp $673a
$15:8784  02 1b         cop #$1b
$15:8786  82 20 28      brl $afa9
$15:8789  d0 12         bne $879d
$15:878b  30 40         bmi $87cd
$15:878d  45 61         eor $61
$15:878f  1c 88 47      trb $4788
$15:8792  a1 90         lda ($90,x)
$15:8794  e1 59         sbc ($59,x)
$15:8796  55 e8         eor $e8,x
$15:8798  39 fc 44      and $44fc,y
$15:879b  be 01 96      ldx $9601,y
$15:879e  ce 72 ab      dec $ab72
$15:87a1  1e 69 07      asl $0769,x
$15:87a4  f2 01         sbc ($01)
$15:87a6  f0 80         beq $8728
$15:87a8  50 77         bvc $8821
$15:87aa  18            clc
$15:87ab  8b            phb
$15:87ac  80 70         bra $881e
$15:87ae  32 16         and ($16)
$15:87b0  ca            dex
$15:87b1  24 f2         bit $f2
$15:87b3  31 38         and ($38),y
$15:87b5  05 95         ora $95
$15:87b7  f2 19         sbc ($19)
$15:87b9  74 86         stz $86,x
$15:87bb  7c e1 ff      jmp ($ffe1,x)
$15:87be  a8            tay
$15:87bf  77 fe         adc [$fe],y
$15:87c1  0f 75 8f 3d   ora $3d8f75
$15:87c5  c2 27         rep #$27
$15:87c7  02 86         cop #$86
$15:87c9  40            rti
$15:87ca  c7 e0         cmp [$e0]
$15:87cc  88            dey
$15:87cd  06 58         asl $58
$15:87cf  00 c6         brk #$c6
$15:87d1  3c 07 2a      bit $2a07,x
$15:87d4  25 1b         and $1b
$15:87d6  35 8e         and $8e,x
$15:87d8  b0 c3         bcs $879d
$15:87da  69 f1 29      adc #$29f1
$15:87dd  f4 02 fd      pea $fd02
$15:87e0  00 0d         brk #$0d
$15:87e2  95 1b         sta $1b,x
$15:87e4  73 8e         adc ($8e,s),y
$15:87e6  b8            clv
$15:87e7  c1 7e         cmp ($7e,x)
$15:87e9  50 2f         bvc $881a
$15:87eb  04 03         tsb $03
$15:87ed  81 00         sta ($00,x)
$15:87ef  c0 02 ca      cpy #$ca02
$15:87f2  c3 7f         cmp $7f,s
$15:87f4  f0 cf         beq $87c5
$15:87f6  fb            xce
$15:87f7  92 7b         sta ($7b)
$15:87f9  f4 0e 7f      pea $7f0e
$15:87fc  00 58         brk #$58
$15:87fe  8b            phb
$15:87ff  18            clc
$15:8800  6f f0 09 9c   adc $9c09f0
$15:8804  02 42         cop #$42
$15:8806  0b            phd
$15:8807  24 22         bit $22
$15:8809  c4 e2         cpy $e2
$15:880b  32 b9         and ($b9)
$15:880d  0e 3f 09      asl $093f
$15:8810  57 e0         eor [$e0],y
$15:8812  49 bc 1f      eor #$1fbc
$15:8815  68            pla
$15:8816  67 2a         adc [$2a]
$15:8818  71 e4         adc ($e4),y
$15:881a  90 44         bcc $8860
$15:881c  7d 92 1e      adc $1e92,x
$15:881f  e6 12         inc $12
$15:8821  f1 c0         sbc ($c0),y
$15:8823  9c 48 23      stz $2348
$15:8826  10 08         bpl $8830
$15:8828  64 10         stz $10
$15:882a  50 31         bvc $885d
$15:882c  08            php
$15:882d  02 a0         cop #$a0
$15:882f  27 d3         and [$d3]
$15:8831  88            dey
$15:8832  7c 3a 06      jmp ($063a,x)
$15:8835  01 04         ora ($04,x)
$15:8837  21 ab         and ($ab,x)
$15:8839  f9 08 86      sbc $8608,y
$15:883c  a0 f0 60      ldy #$60f0
$15:883f  3f 9f 08 fc   and $fc089f,x
$15:8843  79 9b f0      adc $f09b,y
$15:8846  0b            phd
$15:8847  05 42         ora $42
$15:8849  c1 40         cmp ($40,x)
$15:884b  78            sei
$15:884c  80 2c         bra $887a
$15:884e  34 1a         bit $1a,x
$15:8850  0e 05 80      asl $8005
$15:8853  cc 16 08      cpy $0816
$15:8856  06 c2         asl $c2
$15:8858  81 a0         sta ($a0,x)
$15:885a  00 0f         brk #$0f
$15:885c  83 81         sta $81,s
$15:885e  40            rti
$15:885f  7a            ply
$15:8860  0a            asl a
$15:8861  2c b8 18      bit $18b8
$15:8864  00 79         brk #$79
$15:8866  01 41         ora ($41,x)
$15:8868  e2 4f         sep #$4f
$15:886a  10 b8         bpl $8824
$15:886c  58            cli
$15:886d  01 fd         ora ($fd,x)
$15:886f  23 95         and $95,s
$15:8871  c2 20         rep #$20
$15:8873  f3 c8         sbc ($c8,s),y
$15:8875  1d f6 06      ora $06f6,x
$15:8878  7f 01 b8 c0   adc $c0b801,x
$15:887c  a7 90         lda [$90]
$15:887e  08            php
$15:887f  a1 dc         lda ($dc,x)
$15:8881  20 e8 46      jsr $46e8
$15:8884  80 ad         bra $8833
$15:8886  c2 07         rep #$07
$15:8888  42 c1         wdm #$c1
$15:888a  48            pha
$15:888b  38            sec
$15:888c  1d 2f 94      ora $942f,x
$15:888f  ae 71 1f      ldx $1f71
$15:8892  f0 6f         beq $8903
$15:8894  f4 13 eb      pea $eb13
$15:8897  05 e2         ora $e2
$15:8899  81 02         sta ($02,x)
$15:889b  de 40 23      dec $2340,x
$15:889e  d1 28         cmp ($28),y
$15:88a0  67 22         adc [$22]
$15:88a2  08            php
$15:88a3  e6 0a         inc $0a
$15:88a5  03 5c         ora $5c,s
$15:88a7  1a            inc a
$15:88a8  e1 c0         sbc ($c0,x)
$15:88aa  a3 d5         lda $d5,s
$15:88ac  a2 30 e9      ldx #$e930
$15:88af  e4 4e         cpx $4e
$15:88b1  c5 0e         cmp $0e
$15:88b3  fe c0 ff      inc $ffc0,x
$15:88b6  f0 03         beq $88bb
$15:88b8  c8            iny
$15:88b9  0d c2 51      ora $51c2
$15:88bc  7e 80 43      ror $4380,x
$15:88bf  a0 11 08      ldy #$0811
$15:88c2  8a            txa
$15:88c3  c4 19         cpy $19
$15:88c5  2b            pld
$15:88c6  19 8c e3      ora $e38c,y
$15:88c9  a1 dc         lda ($dc,x)
$15:88cb  6a            ror a
$15:88cc  07 3b         ora [$3b]
$15:88ce  11 4f         ora ($4f),y
$15:88d0  b0 70         bcs $8942
$15:88d2  e7 9e         sbc [$9e]
$15:88d4  fa            plx
$15:88d5  66 3a         ror $3a
$15:88d7  11 19         ora ($19),y
$15:88d9  f3 43         sbc ($43,s),y
$15:88db  ae 14 09      ldx $0914
$15:88de  c4 22         cpy $22
$15:88e0  61 80         adc ($80,x)
$15:88e2  5f 84 f2 61   eor $61f284,x
$15:88e6  7c b8 5e      jmp ($5eb8,x)
$15:88e9  22 b0 18 d4   jsl $d418b0
$15:88ed  2e 3f 00      rol $003f
$15:88f0  9e c0 6f      stz $6fc0,x
$15:88f3  d0 4b         bne $8940
$15:88f5  84 3e         sty $3e
$15:88f7  f7 13         sbc [$13],y
$15:88f9  b1 c0         lda ($c0),y
$15:88fb  a1 d0         lda ($d0,x)
$15:88fd  f8            sed
$15:88fe  24 3d         bit $3d
$15:8900  18            clc
$15:8901  10 22         bpl $8925
$15:8903  50 19         bvc $891e
$15:8905  82 1f 0c      brl $9527
$15:8908  8f c7 23 d4   sta $d423c7
$15:890c  9c 09 44      stz $4409
$15:890f  2b            pld
$15:8910  1e 8f 27      asl $278f,x
$15:8913  e2 5f         sep #$5f
$15:8915  30 3c         bmi $8953
$15:8917  97 f8         sta [$f8],y
$15:8919  94 1b         sty $1b,x
$15:891b  e8            inx
$15:891c  07 7a         ora [$7a]
$15:891e  11 06         ora ($06),y
$15:8920  62 07 02      per $8b2a
$15:8923  00 e8         brk #$e8
$15:8925  88            dey
$15:8926  44 22 75      mvp $75,$22
$15:8929  3a            dec a
$15:892a  b3 59         lda ($59,s),y
$15:892c  aa            tax
$15:892d  54 2a d5      mvn $d5,$2a
$15:8930  0a            asl a
$15:8931  78            sei
$15:8932  3d 07 42      and $4207,x
$15:8935  a1 80         lda ($80,x)
$15:8937  7a            ply
$15:8938  0f e7 74 1c   ora $1c74e7
$15:893c  82 41 70      brl $f980
$15:893f  b8            clv
$15:8940  59 2c 80      eor $802c,y
$15:8943  cb            wai
$15:8944  15 f8         ora $f8,x
$15:8946  f3 dd         sbc ($dd,s),y
$15:8948  0f 42 e1 e9   ora $e9e142
$15:894c  74 b4         stz $b4,x
$15:894e  2a            rol a
$15:894f  13 a2         ora ($a2,s),y
$15:8951  38            sec
$15:8952  70 02         bvs $8956
$15:8954  d0 c9         bne $891f
$15:8956  00 87         brk #$87
$15:8958  7e 80 76      ror $7680,x
$15:895b  dd 02 6c      cmp $6c02,x
$15:895e  0b            phd
$15:895f  34 00         bit $00,x
$15:8961  ce 06 fe      dec $fe06
$15:8964  23 64         and $64,s
$15:8966  06 07         asl $07
$15:8968  07 48         ora [$48]
$15:896a  5c 01 3c 31   jml $313c01
$15:896e  05 78         ora $78
$15:8970  44 36 53      mvp $53,$36
$15:8973  29 b5 93      and #$93b5
$15:8976  c9 d0 e8      cmp #$e8d0
$15:8979  64 30         stz $30
$15:897b  19 0c 2a      ora $2a0c,y
$15:897e  c0 60         cpy #$60
$15:8980  1b            tcs
$15:8981  28            plp
$15:8982  04 da         tsb $da
$15:8984  81 e4         sta ($e4,x)
$15:8986  80 74         bra $89fc
$15:8988  24 18         bit $18
$15:898a  0b            phd
$15:898b  86 16         stx $16
$15:898d  e4 98         cpx $98
$15:898f  48            pha
$15:8990  34 3a         bit $3a,x
$15:8992  17 18         ora [$18],y
$15:8994  8b            phb
$15:8995  c4 e3         cpy $e3
$15:8997  f3 79         sbc ($79,s),y
$15:8999  7c 9d 22      jmp ($229d,x)
$15:899c  50 38         bvc $89d6
$15:899e  04 3a         tsb $3a
$15:89a0  03 18         ora $18,s
$15:89a2  83 c4         sta $c4,s
$15:89a4  e1 f3         sbc ($f3,x)
$15:89a6  78            sei
$15:89a7  7c 9e 3e      jmp ($3e9e,x)
$15:89aa  55 0a         eor $0a,x
$15:89ac  03 c0         ora $c0,s
$15:89ae  1e 63 60      asl $6063,x
$15:89b1  7b            tdc
$15:89b2  0c c2 40      tsb $40c2
$15:89b5  fb            xce
$15:89b6  07 7f         ora [$7f]
$15:89b8  a4 47         ldy $47
$15:89ba  81 c0         sta ($c0,x)
$15:89bc  f8            sed
$15:89bd  7c 3f 93      jmp ($933f,x)
$15:89c0  c8            iny
$15:89c1  74 1a         stz $1a,x
$15:89c3  07 01         ora [$01]
$15:89c5  55 80         eor $80,x
$15:89c7  3f d1 f7 80   and $80f7d1,x
$15:89cb  c0 0b         cpy #$0b
$15:89cd  f9 f6 53      sbc $53f6,y
$15:89d0  89 84 62      bit #$6284
$15:89d3  21 1c         and ($1c,x)
$15:89d5  8c 43 21      sty $2143
$15:89d8  10 e8         bpl $89c2
$15:89da  64 1e         stz $1e
$15:89dc  0c 4f e6      tsb $e64f
$15:89df  a0 27         ldy #$27
$15:89e1  41 38         eor ($38,x)
$15:89e3  10 18         bpl $89fd
$15:89e5  11 d4         ora ($d4),y
$15:89e7  1a            inc a
$15:89e8  81 02         sta ($02,x)
$15:89ea  82 38 c2      brl $4c25
$15:89ed  06 76         asl $76
$15:89ef  04 09         tsb $09
$15:89f1  2a            rol a
$15:89f2  85 56         sta $56
$15:89f4  0e 30 7f      asl $7f30
$15:89f7  87 e2         sta [$e2]
$15:89f9  31 0a         and ($0a),y
$15:89fb  81 5c         sta ($5c,x)
$15:89fd  60            rts
$15:89fe  32 18         and ($18)
$15:8a00  0e 36 03      asl $0336
$15:8a03  f3 81         sbc ($81,s),y
$15:8a05  47 a3         eor [$a3]
$15:8a07  1f 88 07 82   ora $820788,x
$15:8a0b  01 fc         ora ($fc,x)
$15:8a0d  f8            sed
$15:8a0e  7f b1 9f ee   adc $ee9fb1,x
$15:8a12  22 8c 14 20   jsl $20148c
$15:8a16  9f 07 f8 48   sta $48f807,x
$15:8a1a  28            plp
$15:8a1b  0c a0 b0      tsb $b0a0
$15:8a1e  27 82         and [$82]
$15:8a20  80 b5         bra $89d7
$15:8a22  0b            phd
$15:8a23  84 83         sty $83
$15:8a25  f1 90         sbc ($90),y
$15:8a27  d8            cld
$15:8a28  64 1f         stz $1f
$15:8a2a  e5 c0         sbc $c0
$15:8a2c  26 03         rol $03
$15:8a2e  10 78         bpl $8aa8
$15:8a30  0b            phd
$15:8a31  20 c0 5a      jsr $5ac0
$15:8a34  39 04 16      and $1604,y
$15:8a37  61 82         adc ($82,x)
$15:8a39  d4 2a         pei ($2a)
$15:8a3b  11 09         ora ($09),y
$15:8a3d  f4 30 87      pea $8730
$15:8a40  29 e1 ff      and #$ffe1
$15:8a43  73 22         adc ($22,s),y
$15:8a45  11 09         ora ($09),y
$15:8a47  a4 d2         ldy $d2
$15:8a49  ad 56 b5      lda $b556
$15:8a4c  52 aa         eor ($aa)
$15:8a4e  94 47         sty $47,x
$15:8a50  b8            clv
$15:8a51  3c 42 71      bit $7142,x
$15:8a54  38            sec
$15:8a55  20 94 82      jsr $8294
$15:8a58  01 34         ora ($34,x)
$15:8a5a  80 3f         bra $8a9b
$15:8a5c  81 fc         sta ($fc,x)
$15:8a5e  10 82         bpl $89e2
$15:8a60  08            php
$15:8a61  d3 29         cmp ($29,s),y
$15:8a63  92 49         sta ($49)
$15:8a65  25 82         and $82
$15:8a67  c1 70         cmp ($70,x)
$15:8a69  b8            clv
$15:8a6a  56 2b         lsr $2b,x
$15:8a6c  16 8a         asl $8a,x
$15:8a6e  40            rti
$15:8a6f  68            pla
$15:8a70  26 13         rol $13
$15:8a72  02 0b         cop #$0b
$15:8a74  00 c0         brk #$c0
$15:8a76  3c 01 e3      bit $e301,x
$15:8a79  e1 c0         sbc ($c0,x)
$15:8a7b  3c f0 0b      bit $0bf0,x
$15:8a7e  33 3c         and ($3c,s),y
$15:8a80  6b            rtl
$15:8a81  50 0f         bvc $8a92
$15:8a83  fc 02 fc      jsr ($fc02,x)
$15:8a86  37 01         and [$01],y
$15:8a88  86 c0         stx $c0
$15:8a8a  20 b1 d8      jsr $d8b1
$15:8a8d  9c ee 1b      stz $1bee
$15:8a90  7c 83 c7      jmp ($c783,x)
$15:8a93  e0 32         cpx #$32
$15:8a95  f8            sed
$15:8a96  24 1e         bit $1e
$15:8a98  01 09         ora ($09,x)
$15:8a9a  44 04 76      mvp $76,$04
$15:8a9d  03 3f         ora $3f,s
$15:8a9f  80 df         bra $8a80
$15:8aa1  20 71 f8      jsr $f871
$15:8aa4  04 be         tsb $be
$15:8aa6  00 5a         brk #$5a
$15:8aa8  35 68         and $68,x
$15:8aaa  42 60         wdm #$60
$15:8aac  b0 78         bcs $8b26
$15:8aae  14 3a         trb $3a
$15:8ab0  1b            tcs
$15:8ab1  3c 05 14      bit $1405,x
$15:8ab4  0a            asl a
$15:8ab5  05 0c         ora $0c
$15:8ab7  86 17         stx $17
$15:8ab9  00 b4         brk #$b4
$15:8abb  10 e8         bpl $8aa5
$15:8abd  0c f4 ee      tsb $eef4
$15:8ac0  90 46         bcc $8b08
$15:8ac2  f0 c0         beq $8a84
$15:8ac4  a0 11         ldy #$11
$15:8ac6  68            pla
$15:8ac7  04 90         tsb $90
$15:8ac9  50 73         bvc $8b3e
$15:8acb  68            pla
$15:8acc  04 8e         tsb $8e
$15:8ace  01 11         ora ($11,x)
$15:8ad0  48            pha
$15:8ad1  6c 03 85      jmp ($8503)
$15:8ad4  c3 b8         cmp $b8,s
$15:8ad6  fe 5f a1      inc $a15f,x
$15:8ad9  10 dc         bpl $8ab7
$15:8adb  40            rti
$15:8adc  22 0b 71 16   jsl $16710b
$15:8ae0  94 83         sty $83,x
$15:8ae2  f2 06         sbc ($06)
$15:8ae4  0a            asl a
$15:8ae5  02 d9         cop #$d9
$15:8ae7  c3 ed         cmp $ed,s
$15:8ae9  03 80         ora $80,s
$15:8aeb  43 da         eor $da,s
$15:8aed  e2 65         sep #$65
$15:8aef  03 28         ora $28,s
$15:8af1  34 76         bit $76,x
$15:8af3  71 30         adc ($30),y
$15:8af5  8e 46 23      stx $2346
$15:8af8  d1 88         cmp ($88),y
$15:8afa  7c 3a 0f      jmp ($0f3a,x)
$15:8afd  07 80         ora [$80]
$15:8aff  9b            txy
$15:8b00  44 4a 0e      mvp $0e,$4a
$15:8b03  fe 67 37      inc $3767,x
$15:8b06  02 01         cop #$01
$15:8b08  f0 e0         beq $8aea
$15:8b0a  4f 8e c0 0e   eor $0ec08e
$15:8b0e  fe 05 02      inc $0205,x
$15:8b11  c1 20         cmp ($20,x)
$15:8b13  98            tya
$15:8b14  0c c2 21      tsb $21c2
$15:8b17  18            clc
$15:8b18  1b            tcs
$15:8b19  8c 72 18      sty $1872
$15:8b1c  3b            tsc
$15:8b1d  01 7f         ora ($7f,x)
$15:8b1f  40            rti
$15:8b20  e0 60         cpx #$60
$15:8b22  9c 27 f6      stz $f627
$15:8b25  00 2c         brk #$2c
$15:8b27  18            clc
$15:8b28  0f 07 02 e1   ora $e10207
$15:8b2c  60            rts
$15:8b2d  8c 44 21      sty $2144
$15:8b30  c4 e1         cpy $e1
$15:8b32  36 fa         rol $fa,x
$15:8b34  36 ce         rol $ce,x
$15:8b36  21 fe         and ($fe,x)
$15:8b38  f8            sed
$15:8b39  23 f8         and $f8,s
$15:8b3b  6a            ror a
$15:8b3c  17 08         ora [$08],y
$15:8b3e  c5 e2         cmp $e2
$15:8b40  21 f8         and ($f8,x)
$15:8b42  88            dey
$15:8b43  54 20 16      mvn $16,$20
$15:8b46  0a            asl a
$15:8b47  07 01         ora [$01]
$15:8b49  4e 3e 8a      lsr $8a3e
$15:8b4c  47 81         eor [$81]
$15:8b4e  80 14         bra $8b64
$15:8b50  0f 01 c8 0f   ora $0fc801
$15:8b54  c2 a7         rep #$a7
$15:8b56  2e 2c 03      rol $032c
$15:8b59  ab            plb
$15:8b5a  00 da         brk #$da
$15:8b5c  c0 33         cpy #$33
$15:8b5e  f0 2a         beq $8b8a
$15:8b60  5c 0b a9 86   jml $86a90b
$15:8b64  94 63         sty $63,x
$15:8b66  32 15         and ($15)
$15:8b68  8f f6 e3 fd   sta $fde3f6
$15:8b6c  a8            tay
$15:8b6d  70 87         bvs $8af6
$15:8b6f  f3 11         sbc ($11,s),y
$15:8b71  fc a4 5e      jsr ($5ea4,x)
$15:8b74  2a            rol a
$15:8b75  57 09         eor [$09],y
$15:8b77  24 82         bit $82
$15:8b79  10 66         bpl $8be1
$15:8b7b  49 04 82      eor #$8204
$15:8b7e  81 40         sta ($40,x)
$15:8b80  2e 84 12      rol $1284
$15:8b83  08            php
$15:8b84  66 73         ror $73
$15:8b86  33 cf         and ($cf,s),y
$15:8b88  e0 17         cpx #$17
$15:8b8a  f9 ff 22      sbc $22ff,y
$15:8b8d  81 80         sta ($80,x)
$15:8b8f  9f 78 e4 5b   sta $5be478,x
$15:8b93  eb            xba
$15:8b94  18            clc
$15:8b95  5c 67 c0 c2   jml $c2c067
$15:8b99  9f df ef f4   sta $f4efdf,x
$15:8b9d  1b            tcs
$15:8b9e  1d 74 4e      ora $4e74,x
$15:8ba1  42 50         wdm #$50
$15:8ba3  bf c0 3b b7   lda $b73bc0,x
$15:8ba7  fe e5 fb      inc $fbe5,x
$15:8baa  45 22         eor $22
$15:8bac  ff c8 86 a1   sbc $a186c8,x
$15:8bb0  d6 80         dec $80,x
$15:8bb2  6f df 02 10   adc $1002df
$15:8bb6  11 33         ora ($33),y
$15:8bb8  5f e0 34 1a   eor $1a34e0,x
$15:8bbc  15 0a         ora $0a,x
$15:8bbe  31 42         and ($42),y
$15:8bc0  80 14         bra $8bd6
$15:8bc2  ee 48 53      inc $5348
$15:8bc5  c8            iny
$15:8bc6  04 0a         tsb $0a
$15:8bc8  05 07         ora $07
$15:8bca  82 41 60      brl $ec0e
$15:8bcd  30 78         bmi $8c47
$15:8bcf  34 1e         bit $1e,x
$15:8bd1  05 7d         ora $7d
$15:8bd3  80 ff         bra $8bd4
$15:8bd5  ef 85 30 80   sbc $803085
$15:8bd9  c0 e0         cpy #$e0
$15:8bdb  70 78         bvs $8c55
$15:8bdd  3c 14 e2      bit $e214,x
$15:8be0  10 68         bpl $8c4a
$15:8be2  14 0e         trb $0e
$15:8be4  03 3c         ora $3c,s
$15:8be6  1f 11 4c ff   ora $ff4c11,x
$15:8bea  f0 0f         beq $8bfb
$15:8bec  e5 0f         sbc $0f
$15:8bee  ff 40 c2 03   sbc $03c240,x
$15:8bf2  c0 a6         cpy #$a6
$15:8bf4  f0 37         beq $8c2d
$15:8bf6  c0 50         cpy #$50
$15:8bf8  2f e8 e7 29   and $29e7e8
$15:8bfc  97 03         sta [$03],y
$15:8bfe  01 ed         ora ($ed,x)
$15:8c00  a2 2b         ldx #$2b
$15:8c02  f2 f5         sbc ($f5)
$15:8c04  5c 03 3c 02   jml $023c03
$15:8c08  31 00         and ($00),y
$15:8c0a  bf 56 a7 86   lda $86a756,x
$15:8c0e  1b            tcs
$15:8c0f  9e 46 1b      stz $1b46,x
$15:8c12  80 bd         bra $8bd1
$15:8c14  0c e4 73      tsb $73e4
$15:8c17  ed 12 ff      sbc $ff12
$15:8c1a  c4 37         cpy $37
$15:8c1c  f1 20         sbc ($20),y
$15:8c1e  b8            clv
$15:8c1f  78            sei
$15:8c20  83 83         sta $83,s
$15:8c22  fb            xce
$15:8c23  af de e4 f3   lda $f3e4de
$15:8c27  19 5c c2      ora $c25c,y
$15:8c2a  59 73 b6      eor $b673,y
$15:8c2d  8a            txa
$15:8c2e  51 9f         eor ($9f),y
$15:8c30  1a            inc a
$15:8c31  0d 02 a8      ora $a802
$15:8c34  03 20         ora $20,s
$15:8c36  cf 8a 07 80   cmp $80078a
$15:8c3a  54 02 90      mvn $90,$02
$15:8c3d  71 24         adc ($24),y
$15:8c3f  22 21 28 96   jsl $962821
$15:8c43  45 20         eor $20
$15:8c45  83 70         sta $70,s
$15:8c47  1a            inc a
$15:8c48  83 89         sta $89,s
$15:8c4a  62 11 09      per $955e
$15:8c4d  e4 e2         cpx $e2
$15:8c4f  78            sei
$15:8c50  47 02         eor [$02]
$15:8c52  28            plp
$15:8c53  09 c2 15      ora #$15c2
$15:8c56  0a            asl a
$15:8c57  82 40 61      brl $ed9a
$15:8c5a  70 a8         bvs $8c04
$15:8c5c  64 5a         stz $5a
$15:8c5e  81 58         sta ($58,x)
$15:8c60  c8            iny
$15:8c61  64 34         stz $34
$15:8c63  12 01         ora ($01)
$15:8c65  38            sec
$15:8c66  41 21         eor ($21,x)
$15:8c68  d0 e8         bne $8c52
$15:8c6a  79 84 20      adc $2084,y
$15:8c6d  11 69         ora ($69),y
$15:8c6f  05 e2         ora $e2
$15:8c71  c1 f0         cmp ($f0,x)
$15:8c73  e0 0b         cpx #$0b
$15:8c75  8e a1 50      stx $50a1
$15:8c78  90 62         bcc $8cdc
$15:8c7a  3b            tsc
$15:8c7b  07 40         ora [$40]
$15:8c7d  b8            clv
$15:8c7e  38            sec
$15:8c7f  98            tya
$15:8c80  f2 17         sbc ($17)
$15:8c82  0f c1 e4 4f   ora $4fe4c1
$15:8c86  4f 00 80 a4   eor $a48000
$15:8c8a  c1 2c         cmp ($2c,x)
$15:8c8c  51 78         eor ($78),y
$15:8c8e  ac 22 06      ldy $0622
$15:8c91  8f 64 99 42   sta $429964
$15:8c95  23 b1         and $b1,s
$15:8c97  c8            iny
$15:8c98  fa            plx
$15:8c99  04 7f         tsb $7f
$15:8c9b  1a            inc a
$15:8c9c  8c 65 c2      sty $c265
$15:8c9f  09 74 5b      ora #$5b74
$15:8ca2  0c 92 09      tsb $0992
$15:8ca5  8b            phb
$15:8ca6  c6 89         dec $89
$15:8ca8  87 f1         sta [$f1]
$15:8caa  70 fe         bvs $8caa
$15:8cac  7e 18 8b      ror $8b18,x
$15:8caf  70 fe         bvs $8caf
$15:8cb1  b8            clv
$15:8cb2  24 4c         bit $4c
$15:8cb4  54 06 7e      mvn $7e,$06
$15:8cb7  60            rts
$15:8cb8  38            sec
$15:8cb9  04 24         tsb $24
$15:8cbb  8c 46 25      sty $2546
$15:8cbe  12 8a         ora ($8a)
$15:8cc0  95 0a         sta $0a,x
$15:8cc2  dd 66 9e      cmp $9e66,x
$15:8cc5  13 00         ora ($00,s),y
$15:8cc7  7e d0 09      ror $09d0,x
$15:8cca  c4 02         cpy $02
$15:8ccc  30 26         bmi $8cf4
$15:8cce  1d f4 fb      ora $fbf4,x
$15:8cd1  35 00         and $00,x
$15:8cd3  ff c0 b8 d0   sbc $d0b8c0,x
$15:8cd7  2c 0c f7      bit $f70c
$15:8cda  7f 3f f6 db   adc $dbf63f,x
$15:8cde  6f f0 0a 0d   adc $0d0af0
$15:8ce2  fc 40 10      jsr ($1040,x)
$15:8ce5  18            clc
$15:8ce6  1d f6 ff      ora $fff6,x
$15:8ce9  7e a1 df      ror $dfa1,x
$15:8cec  e8            inx
$15:8ced  11 20         ora ($20),y
$15:8cef  e8            inx
$15:8cf0  40            rti
$15:8cf1  37 f4         and [$f4],y
$15:8cf3  0f fd 03 7f   ora $7f03fd
$15:8cf7  00 0a         brk #$0a
$15:8cf9  8c f0 32      sty $32f0
$15:8cfc  8d c0 6e      sta $6ec0
$15:8cff  0d 00 4a      ora $4a00
$15:8d02  17 f1         ora [$f1],y
$15:8d04  42 cf         wdm #$cf
$15:8d06  24 93         bit $93
$15:8d08  cb            wai
$15:8d09  33 d4         and ($d4,s),y
$15:8d0b  19 f1 66      ora $66f1,y
$15:8d0e  92 18         sta ($18)
$15:8d10  02 78         cop #$78
$15:8d12  54 9f 14      mvn $14,$9f
$15:8d15  0b            phd
$15:8d16  fd 00 fe      sbc $fe00,x
$15:8d19  c9 2c 84      cmp #$842c
$15:8d1c  21 6f         and ($6f,x)
$15:8d1e  25 ce         and $ce
$15:8d20  fb            xce
$15:8d21  3f 8f dd e4   and $e4dd8f,x
$15:8d25  a7 58         lda [$58]
$15:8d27  c4 cd         cpy $cd
$15:8d29  f1 32         sbc ($32),y
$15:8d2b  fe d4 1f      inc $1fd4,x
$15:8d2e  5b            tcd
$15:8d2f  20 07 80      jsr $8007
$15:8d32  6c 3f e1      jmp ($e13f)
$15:8d35  20 80 5b      jsr $5b80
$15:8d38  e8            inx
$15:8d39  17 fa         ora [$fa],y
$15:8d3b  45 fe         eor $fe
$15:8d3d  e5 7f         sbc $7f
$15:8d3f  af df e8 24   lda $24e8df
$15:8d43  b2 78         lda ($78)
$15:8d45  86 6e         stx $6e
$15:8d47  35 f3         and $f3,x
$15:8d49  89 6f 62      bit #$626f
$15:8d4c  9f e9 17 fe   sta $fe17e9,x
$15:8d50  41 a2         eor ($a2,x)
$15:8d52  91 2e         sta ($2e),y
$15:8d54  43 fe         eor $fe,s
$15:8d56  26 09         rol $09
$15:8d58  14 de         trb $de
$15:8d5a  55 73         eor $73,x
$15:8d5c  b7 d8         lda [$d8],y
$15:8d5e  6b            rtl
$15:8d5f  76 0a         ror $0a,x
$15:8d61  e5 8e         sbc $8e
$15:8d63  ba            tsx
$15:8d64  c9 08 05      cmp #$0508
$15:8d67  fc 26 c1      jsr ($c126,x)
$15:8d6a  94 0e         sty $0e,x
$15:8d6c  80 8d         bra $8cfb
$15:8d6e  85 28         sta $28
$15:8d70  05 00         ora $00
$15:8d72  7f 88 36 81   adc $813688,x
$15:8d76  e0 d0         cpx #$d0
$15:8d78  22 43 41 60   jsl $604143
$15:8d7c  e0 50         cpx #$50
$15:8d7e  34 18         bit $18,x
$15:8d80  0c 06 83      tsb $8306
$15:8d83  41 00         eor ($00,x)
$15:8d85  c0 40         cpy #$40
$15:8d87  3c 04 11      bit $1104,x
$15:8d8a  10 07         bpl $8d93
$15:8d8c  00 26         brk #$26
$15:8d8e  3e 00 78      rol $7800,x
$15:8d91  50 04         bvc $8d97
$15:8d93  c1 18         cmp ($18,x)
$15:8d95  94 4a         sty $4a,x
$15:8d97  24 12         bit $12
$15:8d99  09 84 82      ora #$8284
$15:8d9c  10 54         bpl $8df2
$15:8d9e  18            clc
$15:8d9f  24 12         bit $12
$15:8da1  21 10         and ($10,x)
$15:8da3  17 84         ora [$84],y
$15:8da5  42 71         wdm #$71
$15:8da7  18            clc
$15:8da8  21 08         and ($08,x)
$15:8daa  bc 23 91      ldy $9123,x
$15:8dad  c2 40         rep #$40
$15:8daf  0d c2 a1      ora $a1c2
$15:8db2  70 19         bvs $8dcd
$15:8db4  82 19 ca      brl $57d0
$15:8db7  e5 70         sbc $70
$15:8db9  e0 04         cpx #$04
$15:8dbb  03 c1         ora $c1,s
$15:8dbd  80 13         bra $8dd2
$15:8dbf  01 5d         ora ($5d,x)
$15:8dc1  c3 61         cmp $61,s
$15:8dc3  0e 87 52      asl $5287
$15:8dc6  2a            rol a
$15:8dc7  33 29         and ($29,s),y
$15:8dc9  99 5d 81      sta $815d,y
$15:8dcc  e1 e0         sbc ($e0,x)
$15:8dce  f7 6b         sbc [$6b],y
$15:8dd0  bf f4 c0 60   lda $60c0f4,x
$15:8dd4  ba            tsx
$15:8dd5  ca            dex
$15:8dd6  2d 15 8d      and $8d15
$15:8dd9  4b            phk
$15:8dda  64 37         stz $37
$15:8ddc  8a            txa
$15:8ddd  05 46         ora $46
$15:8ddf  81 50         sta ($50,x)
$15:8de1  98            tya
$15:8de2  15 06         ora $06,x
$15:8de4  a1 50         lda ($50,x)
$15:8de6  84 47         sty $47
$15:8de8  60            rts
$15:8de9  12 d8         ora ($d8)
$15:8deb  05 e2         ora $e2
$15:8ded  42 50         wdm #$50
$15:8def  0b            phd
$15:8df0  80 38         bra $8e2a
$15:8df2  26 0a         rol $0a
$15:8df4  61 90         adc ($90,x)
$15:8df6  5d b1 78      eor $78b1,x
$15:8df9  db            stp
$15:8dfa  b7 e7         lda [$e7],y
$15:8dfc  11 76         ora ($76),y
$15:8dfe  9c 71 b7      stz $b771
$15:8e01  57 ca         eor [$ca],y
$15:8e03  26 eb         rol $eb
$15:8e05  77 c6         adc [$c6],y
$15:8e07  ec ff ee      cpx $eeff
$15:8e0a  1f d8 07 e6   ora $e607d8,x
$15:8e0e  0d 70 a2      ora $a270
$15:8e11  60            rts
$15:8e12  a0 17         ldy #$17
$15:8e14  c8            iny
$15:8e15  0e ee 03      asl $03ee
$15:8e18  c7 0f         cmp [$0f]
$15:8e1a  05 02         ora $02
$15:8e1c  c1 a0         cmp ($a0,x)
$15:8e1e  e8            inx
$15:8e1f  76 27         ror $27,x
$15:8e21  10 49         bpl $8e6c
$15:8e23  24 22         bit $22
$15:8e25  11 00         ora ($00),y
$15:8e27  6d 00 94      adc $9400
$15:8e2a  38            sec
$15:8e2b  18            clc
$15:8e2c  01 00         ora ($00,x)
$15:8e2e  74 20         stz $20,x
$15:8e30  04 20         tsb $20
$15:8e32  9e 45 23      stz $2345,x
$15:8e35  90 48         bcc $8e7f
$15:8e37  61 f4         adc ($f4,x)
$15:8e39  8f a5 03 81   sta $8103a5
$15:8e3d  43 e1         eor $e1,s
$15:8e3f  90 78         bcc $8eb9
$15:8e41  0b            phd
$15:8e42  e4 23         cpx $23
$15:8e44  d0 a7         bne $8ded
$15:8e46  6a            ror a
$15:8e47  40            rti
$15:8e48  60            rts
$15:8e49  30 38         bmi $8e83
$15:8e4b  44 24 12      mvp $12,$24
$15:8e4e  31 38         and ($38),y
$15:8e50  5b            tcd
$15:8e51  b5 1c         lda $1c,x
$15:8e53  41 b8         eor ($b8,x)
$15:8e55  80 6b         bra $8ec2
$15:8e57  21 12         and ($12,x)
$15:8e59  e8            inx
$15:8e5a  75 fa         adc $fa,x
$15:8e5c  0c ed 4d      tsb $4ded
$15:8e5f  86 c3         stx $c3
$15:8e61  b1 d8         lda ($d8),y
$15:8e63  e6 75         inc $75
$15:8e65  3b            tsc
$15:8e66  9d 2d e6      sta $e62d,x
$15:8e69  e8            inx
$15:8e6a  0a            asl a
$15:8e6b  05 d0         ora $d0
$15:8e6d  84 c1         sty $c1
$15:8e6f  20 30 a8      jsr $a830
$15:8e72  24 1e         bit $1e
$15:8e74  19 0a 85      ora $850a,y
$15:8e77  43 a0         eor $a0,s
$15:8e79  ed a0 80      sbc $80a0
$15:8e7c  82 46 1b      brl $a9c5
$15:8e7f  05 87         ora $87
$15:8e81  be 80 8a      ldx $8a80,y
$15:8e84  04 50         tsb $50
$15:8e86  83 c1         sta $c1,s
$15:8e88  f0 04         beq $8e8e
$15:8e8a  f0 80         beq $8e0c
$15:8e8c  64 20         stz $20
$15:8e8e  12 0c         ora ($0c)
$15:8e90  81 3c         sta ($3c,x)
$15:8e92  2e 11 06      rol $0611
$15:8e95  88            dey
$15:8e96  d4 20         pei ($20)
$15:8e98  18            clc
$15:8e99  0c 86 40      tsb $4086
$15:8e9c  4a            lsr a
$15:8e9d  1e 0f 82      asl $820f,x
$15:8ea0  08            php
$15:8ea1  0c a0 6a      tsb $6aa0
$15:8ea4  04 10         tsb $10
$15:8ea6  0b            phd
$15:8ea7  c8            iny
$15:8ea8  60            rts
$15:8ea9  10 88         bpl $8e33
$15:8eab  14 12         trb $12
$15:8ead  1d 0e 85      ora $850e,x
$15:8eb0  42 e1         wdm #$e1
$15:8eb2  90 97         bcc $8e4b
$15:8eb4  60            rts
$15:8eb5  01 40         ora ($40,x)
$15:8eb7  80 30         bra $8ee9
$15:8eb9  d2 30         cmp ($30)
$15:8ebb  12 8a         ora ($8a)
$15:8ebd  1f 03 27 19   ora $192703,x
$15:8ec1  7c 2a 14      jmp ($142a,x)
$15:8ec4  09 04 c1      ora #$c104
$15:8ec7  56 1a         lsr $1a,x
$15:8ec9  0a            asl a
$15:8eca  05 42         ora $42
$15:8ecc  60            rts
$15:8ecd  5f 02 78 18   eor $187802,x
$15:8ed1  47 e1         eor [$e1]
$15:8ed3  c0 33         cpy #$33
$15:8ed5  01 a8         ora ($a8,x)
$15:8ed7  78            sei
$15:8ed8  06 e0         asl $e0
$15:8eda  02 0b         cop #$0b
$15:8edc  d0 20         bne $8efe
$15:8ede  b0 48         bcs $8f28
$15:8ee0  24 15         bit $15
$15:8ee2  1a            inc a
$15:8ee3  10 a8         bpl $8e8d
$15:8ee5  4c 6a 26      jmp $266a
$15:8ee8  2f 17 d0 41   and $41d017
$15:8eec  d1 a1         cmp ($a1),y
$15:8eee  02 83         cop #$83
$15:8ef0  c0 09         cpy #$09
$15:8ef2  a0 f7         ldy #$f7
$15:8ef4  08            php
$15:8ef5  f2 48         sbc ($48)
$15:8ef7  5c 61 e0 e2   jml $e2e061
$15:8efb  56 34         lsr $34,x
$15:8efd  56 4b         lsr $4b,x
$15:8eff  26 8b         rol $8b
$15:8f01  21 02         and ($02,x)
$15:8f03  a5 a7         lda $a7
$15:8f05  c7 80         cmp [$80]
$15:8f07  a7 0f         lda [$0f]
$15:8f09  86 f3         stx $f3
$15:8f0b  f9 de ff      sbc $ffde,y
$15:8f0e  57 bf         eor [$bf],y
$15:8f10  ce a0 ff      dec $ffa0
$15:8f13  ff e2 17 ca   sbc $ca17e2,x
$15:8f17  a7 1a         lda [$1a]
$15:8f19  71 82         adc ($82),y
$15:8f1b  dd 3d 07      cmp $073d,x
$15:8f1e  25 82         and $82
$15:8f20  a2 71         ldx #$71
$15:8f22  a2 1b         ldx #$1b
$15:8f24  a8            tay
$15:8f25  05 f2         ora $f2
$15:8f27  71 fe         adc ($fe),y
$15:8f29  be 00 94      ldx $9400,y
$15:8f2c  02 16         cop #$16
$15:8f2e  cf f4 02 79   cmp $7902f4
$15:8f32  3c bf 54      bit $54bf,x
$15:8f35  b8            clv
$15:8f36  73 ac         adc ($ac,s),y
$15:8f38  1e eb 07      asl $07eb,x
$15:8f3b  92 c1         sta ($c1)
$15:8f3d  d1 b8         cmp ($b8),y
$15:8f3f  f5 cb         sbc $cb,x
$15:8f41  f0 3c         beq $8f7f
$15:8f43  20 17 e9      jsr $e917
$15:8f46  e7 fe         sbc [$fe]
$15:8f48  f8            sed
$15:8f49  24 3d         bit $3d
$15:8f4b  c7 ff         cmp [$ff]
$15:8f4d  40            rti
$15:8f4e  0e 00 78      asl $7800
$15:8f51  5f ab 5c 3d   eor $3d5cab,x
$15:8f55  ee 04 6a      inc $6a04
$15:8f58  19 9c 0c      ora $0c9c,y
$15:8f5b  0f 07 2e b7   ora $b72e07
$15:8f5f  1c 40 42      trb $4240
$15:8f62  57 e2         eor [$e2],y
$15:8f64  21 89         and ($89,x)
$15:8f66  43 a0         eor $a0,s
$15:8f68  2e 19 c3      rol $c319
$15:8f6b  c0 5e         cpy #$5e
$15:8f6d  a9 46 e3      lda #$e346
$15:8f70  47 19         eor [$19]
$15:8f72  c2 ff         rep #$ff
$15:8f74  8d c7 fb      sta $fbc7
$15:8f77  c0 2e 17      cpy #$172e
$15:8f7a  79 3d 58      adc $583d,y
$15:8f7d  06 05         asl $05
$15:8f7f  fa            plx
$15:8f80  00 84         brk #$84
$15:8f82  00 1c         brk #$1c
$15:8f84  14 01         trb $01
$15:8f86  f8            sed
$15:8f87  40            rti
$15:8f88  d9 21 01      cmp $0121,y
$15:8f8b  83 32         sta $32,s
$15:8f8d  41 24         eor ($24,x)
$15:8f8f  23 f0         and $f0,s
$15:8f91  90 58         bcc $8feb
$15:8f93  07 e2         ora [$e2]
$15:8f95  3f 05 f8 29   and $29f805,x
$15:8f99  85 42         sta $42
$15:8f9b  54 6c 16      mvn $16,$6c
$15:8f9e  02 87         cop #$87
$15:8fa0  f2 e1         sbc ($e1)
$15:8fa2  4f 3c 11 d9   eor $d9113c
$15:8fa6  0d fe 81      ora $81fe
$15:8fa9  ff 80 5f d4   sbc $d45f80,x
$15:8fad  a1 83         lda ($83,x)
$15:8faf  80 50         bra $9001
$15:8fb1  e0 3c 3e      cpx #$3e3c
$15:8fb4  1c 8f 85      trb $858f
$15:8fb7  e3 70         sbc $70,s
$15:8fb9  02 84         cop #$84
$15:8fbb  d9 21 c0      cmp $c021,y
$15:8fbe  48            pha
$15:8fbf  03 44         ora $44,s
$15:8fc1  30 0c         bmi $8fcf
$15:8fc3  91 65         sta ($65),y
$15:8fc5  06 01         asl $01
$15:8fc7  9c 2d 41      stz $412d
$15:8fca  6c aa 84      jmp ($84aa)
$15:8fcd  a3 f1         lda $f1,s
$15:8fcf  48            pha
$15:8fd0  24 12         bit $12
$15:8fd2  2b            pld
$15:8fd3  04 88         tsb $88
$15:8fd5  44 e1 b0      mvp $b0,$e1
$15:8fd8  58            cli
$15:8fd9  74 1a         stz $1a,x
$15:8fdb  37 08         and [$08],y
$15:8fdd  8b            phb
$15:8fde  c0 23 91      cpy #$9123
$15:8fe1  88            dey
$15:8fe2  64 2e         stz $2e
$15:8fe4  3e 02 08      rol $0802,x
$15:8fe7  e4 1e         cpx $1e
$15:8fe9  0d 0f 83      ora $830f
$15:8fec  c3 21         cmp $21,s
$15:8fee  00 c0         brk #$c0
$15:8ff0  f9 5c b8      sbc $b85c,y
$15:8ff3  50 2d         bvc $9022
$15:8ff5  35 1a         and $1a,x
$15:8ff7  3d e6 f1      and $f1e6,x
$15:8ffa  7e be 5f      ror $5fbe,x
$15:8ffd  ab            plb
$15:8ffe  c5 f3         cmp $f3
$15:9000  19 0c be      ora $be0c,y
$15:9003  43 a0         eor $a0,s
$15:9005  9f ef a7 eb   sta $eba7ef,x
$15:9009  f9 1a fe      sbc $fe1a,y
$15:900c  41 af         eor ($af,x)
$15:900e  98            tya
$15:900f  6c 70 3c      jmp ($3c70)
$15:9012  2f d0 90 08   and $0890d0
$15:9016  42 a0         wdm #$a0
$15:9018  b0 c8         bcs $8fe2
$15:901a  6c 12 1a      jmp ($1a12)
$15:901d  94 08         sty $08,x
$15:901f  54 12 33      mvn $33,$12
$15:9022  16 8d         asl $8d,x
$15:9024  40            rti
$15:9025  e0 f0 58      cpx #$58f0
$15:9028  7c 0c 84      jmp ($840c,x)
$15:902b  10 78         bpl $90a5
$15:902d  1c 0e 03      trb $030e
$15:9030  0b            phd
$15:9031  81 c6         sta ($c6,x)
$15:9033  e0 31 ba      cpx #$ba31
$15:9036  84 c3         sty $c3
$15:9038  21 00         and ($00,x)
$15:903a  e8            inx
$15:903b  44 2e 1a      mvp $1a,$2e
$15:903e  0f 06 43 41   ora $414306
$15:9042  80 a0         bra $8fe4
$15:9044  68            pla
$15:9045  32 12         and ($12)
$15:9047  0e 07 83      asl $8307
$15:904a  e1 f0         sbc ($f0,x)
$15:904c  30 01         bmi $904f
$15:904e  7c 38 1d      jmp ($1d38,x)
$15:9051  03 40         ora $40,s
$15:9053  76 3f         ror $3f,x
$15:9055  06 b0         asl $b0
$15:9057  81 c2         sta ($c2,x)
$15:9059  a1 b0         lda ($b0,x)
$15:905b  c1 98         cmp ($98,x)
$15:905d  42 a0         wdm #$a0
$15:905f  e3 70         sbc $70,s
$15:9061  83 1d         sta $1d,s
$15:9063  42 37         wdm #$37
$15:9065  17 8c         ora [$8c],y
$15:9067  c1 48         cmp ($48,x)
$15:9069  c0 42 18      cpy #$1842
$15:906c  09 18 e0      ora #$e018
$15:906f  11 b8         ora ($b8),y
$15:9071  04 67         tsb $67
$15:9073  01 30         ora ($30,x)
$15:9075  a8            tay
$15:9076  60            rts
$15:9077  2a            rol a
$15:9078  19 0d 81      ora $810d,y
$15:907b  58            cli
$15:907c  22 12 08 05   jsl $050812
$15:9080  02 c1         cop #$c1
$15:9082  b0 68         bcs $90ec
$15:9084  81 82         sta ($82,x)
$15:9086  73 1f         adc ($1f,s),y
$15:9088  89 c7 e2      bit #$e2c7
$15:908b  3b            tsc
$15:908c  07 9d         ora [$9d]
$15:908e  42 68         wdm #$68
$15:9090  30 08         bmi $909a
$15:9092  74 3b         stz $3b,x
$15:9094  63 be         adc $be,s
$15:9096  b1 de         lda ($de),y
$15:9098  20 33 72      jsr $7233
$15:909b  18            clc
$15:909c  4e 27 97      lsr $9727
$15:909f  7b            tdc
$15:90a0  ff ff ff f1   sbc $f1ffff,x
$15:90a4  ff d0 3f d0   sbc $d03fd0,x
$15:90a8  0b            phd
$15:90a9  c4 02         cpy $02
$15:90ab  6f 00 87 e6   adc $e68700
$15:90af  6a            ror a
$15:90b0  1d 9c 86      ora $869c,x
$15:90b3  c6 71         dec $71
$15:90b5  64 a6         stz $a6
$15:90b7  7d 65 b5      adc $b565,x
$15:90ba  ee 36 db      inc $db36
$15:90bd  0d d4 d2      ora $d2d4
$15:90c0  7b            tdc
$15:90c1  ff ed f0 e7   sbc $e7f0ed,x
$15:90c5  ff f3 7d f8   sbc $f87df3,x
$15:90c9  d4 fe         pei ($fe)
$15:90cb  71 fe         adc ($fe),y
$15:90cd  bc 3a 83      ldy $833a,x
$15:90d0  f9 44 e3      sbc $e344,y
$15:90d3  4e 2f 90      lsr $902f
$15:90d6  09 c4 01      ora #$01c4
$15:90d9  ea            nop
$15:90da  ee 90 80      inc $8090
$15:90dd  3c ae 11      bit $11ae,x
$15:90e0  0c c8 66      tsb $66c8
$15:90e3  20 17 07      jsr $0717
$15:90e6  ac 7c 3f      ldy $3f7c
$15:90e9  96 0f         stx $0f,y
$15:90eb  c0 4e 81      cpy #$814e
$15:90ee  fe 20 dd      inc $dd20,x
$15:90f1  86 f2         stx $f2
$15:90f3  81 f0         sta ($f0,x)
$15:90f5  7a            ply
$15:90f6  c3 d4         cmp $d4,s
$15:90f8  28            plp
$15:90f9  1f c1 f0 14   ora $14f0c1,x
$15:90fd  e9 e3 8f      sbc #$8fe3
$15:9100  51 38         eor ($38),y
$15:9102  74 02         stz $02,x
$15:9104  fd 00 a1      sbc $a100,x
$15:9107  24 95         bit $95
$15:9109  22 09 cf 39   jsl $39cf09
$15:910d  dc 5e 19      jml [$195e]
$15:9110  0b            phd
$15:9111  8c 1c ee      sty $ee1c
$15:9114  19 04 8e      ora $8e04,y
$15:9117  14 eb         trb $eb
$15:9119  a1 60         lda ($60,x)
$15:911b  d0 4c         bne $9169
$15:911d  0e 77 60      asl $6077
$15:9120  a0 5c 23      ldy #$235c
$15:9123  f0 87         beq $90ac
$15:9125  78            sei
$15:9126  45 d9         eor $d9
$15:9128  a3 10         lda $10,s
$15:912a  83 c5         sta $c5,s
$15:912c  e0 f1 08      cpx #$08f1
$15:912f  04 7c         tsb $7c
$15:9131  5c 02 f0 84   jml $84f002
$15:9135  43 a0         eor $a0,s
$15:9137  90 f0         bcc $9129
$15:9139  28            plp
$15:913a  42 00         wdm #$00
$15:913c  e3 0f         sbc $0f,s
$15:913e  2e 87 ca      rol $ca87
$15:9141  01 fe         ora ($fe,x)
$15:9143  80 70         bra $91b5
$15:9145  28            plp
$15:9146  14 0b         trb $0b
$15:9148  e5 f7         sbc $f7
$15:914a  f9 c1 e0      sbc $e0c1,y
$15:914d  57 ec         eor [$ec],y
$15:914f  1f f6 58 43   ora $4358f6,x
$15:9153  0b            phd
$15:9154  a1 3e         lda ($3e,x)
$15:9156  bf 67 bc 5f   lda $5fbc67,x
$15:915a  e8            inx
$15:915b  16 fa         asl $fa,x
$15:915d  fd 80 f0      sbc $f080,x
$15:9160  17 42         ora [$42],y
$15:9162  27 1d         and [$1d]
$15:9164  78            sei
$15:9165  04 da         tsb $da
$15:9167  1d 29 8a      ora $8a29,x
$15:916a  4b            phk
$15:916b  62 72 b8      per $49e0
$15:916e  e4 5a         cpx $5a
$15:9170  1c 0c 18      trb $180c
$15:9173  eb            xba
$15:9174  f0 20         beq $9196
$15:9176  30 f8         bmi $9170
$15:9178  1c 5c 5c      trb $5c5c
$15:917b  10 08         bpl $9185
$15:917d  e1 0c         sbc ($0c,x)
$15:917f  04 21         tsb $21
$15:9181  18            clc
$15:9182  b0 56         bcs $91da
$15:9184  37 1f         and [$1f],y
$15:9186  48            pha
$15:9187  c6 92         dec $92
$15:9189  61 cc         adc ($cc,x)
$15:918b  f8            sed
$15:918c  69 2b 1e      adc #$1e2b
$15:918f  88            dey
$15:9190  87 c2         sta [$c2]
$15:9192  01 b8         ora ($b8,x)
$15:9194  fc 5c 3f      jsr ($3f5c,x)
$15:9197  1e 0f c7      asl $c70f,x
$15:919a  23 f1         and $f1,s
$15:919c  08            php
$15:919d  fc 4c 2f      jsr ($2f4c,x)
$15:91a0  1e 02 e8      asl $e802,x
$15:91a3  0b            phd
$15:91a4  82 39 0d      brl $9ee0
$15:91a7  8e 4c e1      stx $e14c
$15:91aa  03 59         ora $59,s
$15:91ac  8e 40 e3      stx $e340
$15:91af  f0 72         beq $9223
$15:91b1  25 78         and $78
$15:91b3  3b            tsc
$15:91b4  13 82         ora ($82,s),y
$15:91b6  9d 5e 3f      sta $3f5e,x
$15:91b9  1f 03 15 a0   ora $a01503,x
$15:91bd  c2 0d         rep #$0d
$15:91bf  0e 8d c1      asl $c18d
$15:91c2  a2 90 a8      ldx #$a890
$15:91c5  b4 26         ldy $26,x
$15:91c7  2b            pld
$15:91c8  0e 85 c1      asl $c185
$15:91cb  e0 e2 10      cpx #$10e2
$15:91ce  87 90         sta [$90]
$15:91d0  c2 03         rep #$03
$15:91d2  07 80         ora [$80]
$15:91d4  c2 e0         rep #$e0
$15:91d6  10 98         bpl $9170
$15:91d8  04 39         tsb $39
$15:91da  5c 02 10 a8   jml $a81002
$15:91de  48            pha
$15:91df  39 93 4f      and $4f93,y
$15:91e2  54 73 a5      mvn $a5,$73
$15:91e5  18            clc
$15:91e6  f3 7e         sbc ($7e,s),y
$15:91e8  3a            dec a
$15:91e9  52 cb         eor ($cb)
$15:91eb  a1 9c         lda ($9c,x)
$15:91ed  20 1f cf      jsr $cf1f
$15:91f0  e7 e3         sbc [$e3]
$15:91f2  f9 f0 fe      sbc $fef0,y
$15:91f5  79 3f 90      adc $903f,y
$15:91f8  4f e4 62 78   eor $7862e4
$15:91fc  a1 01         lda ($01,x)
$15:91fe  08            php
$15:91ff  60            rts
$15:9200  1d e6 ee      ora $eee6,x
$15:9203  01 08         ora ($08,x)
$15:9205  3d d5 e8      and $e8d5,x
$15:9208  4f 49 9f 4a   eor $4a9f49
$15:920c  a7 d5         lda [$d5]
$15:920e  c8            iny
$15:920f  e5 72         sbc $72
$15:9211  7d 3e 8e      adc $8e3e,x
$15:9214  4a            lsr a
$15:9215  02 e5         cop #$e5
$15:9217  08            php
$15:9218  84 47         sty $47
$15:921a  21 01         and ($01,x)
$15:921c  60            rts
$15:921d  0b            phd
$15:921e  00 90         brk #$90
$15:9220  43 c2         eor $c2,s
$15:9222  27 20         and [$20]
$15:9224  68            pla
$15:9225  5f a0 14 21   eor $2114a0,x
$15:9229  92 8c         sta ($8c)
$15:922b  40            rti
$15:922c  79 ef 71      adc $71ef,y
$15:922f  18            clc
$15:9230  f9 0b ca      sbc $ca0b,y
$15:9233  7e 64 f3      ror $f364,x
$15:9236  af bd de 33   lda $33debd
$15:923a  09 8f 41      ora #$418f
$15:923d  e0 90 b8      cpx #$b890
$15:9240  1c 32 16      trb $1632
$15:9243  b2 18         lda ($18)
$15:9245  5c 32 09 08   jml $080932
$15:9249  83 43         sta $43,s
$15:924b  e0 10 78      cpx #$7810
$15:924e  44 0d 7a      mvp $7a,$0d
$15:9251  0c 10 80      tsb $8010
$15:9254  42 e0         wdm #$e0
$15:9256  10 c8         bpl $9220
$15:9258  04 22         tsb $22
$15:925a  61 20         adc ($20,x)
$15:925c  f8            sed
$15:925d  70 28         bvs $9287
$15:925f  1a            inc a
$15:9260  0c 05 83      tsb $8305
$15:9263  40            rti
$15:9264  d2 1d         cmp ($1d)
$15:9266  05 82         ora $82
$15:9268  81 20         sta ($20,x)
$15:926a  e0 78 20      cpx #$2078
$15:926d  1c 09 06      trb $0609
$15:9270  01 ba         ora ($ba,x)
$15:9272  0e 10 80      asl $8010
$15:9275  68            pla
$15:9276  20 16 08      jsr $0816
$15:9279  04 82         tsb $82
$15:927b  06 c1         asl $c1
$15:927d  08            php
$15:927e  0c 3e 1b      tsb $1b3e
$15:9281  2b            pld
$15:9282  85 4d         sta $4d
$15:9284  a4 4b         ldy $4b
$15:9286  20 90 c0      jsr $c090
$15:9289  24 73         bit $73
$15:928b  08            php
$15:928c  1c 06 13      trb $1306
$15:928f  09 8c c4      ora #$c48c
$15:9292  67 f1         adc [$f1]
$15:9294  39 cc ee      and $eecc,y
$15:9297  39 18 9c      and $9c18,y
$15:929a  47 e5         eor [$e5]
$15:929c  f2 fc         sbc ($fc)
$15:929e  03 a4         ora $a4,s
$15:92a0  24 0e         bit $0e
$15:92a2  a0 98 44      ldy #$4498
$15:92a5  2e 11 0e      rol $0e11
$15:92a8  c5 23         cmp $23
$15:92aa  11 08         ora ($08),y
$15:92ac  a8            tay
$15:92ad  64 30         stz $30
$15:92af  18            clc
$15:92b0  06 f8         asl $f8
$15:92b2  74 3a         stz $3a,x
$15:92b4  1d 8e 46      ora $468e,x
$15:92b7  e3 51         sbc $51,s
$15:92b9  70 9c         bvs $9257
$15:92bb  44 3f 1d      mvp $1d,$3f
$15:92be  8f 44 06 02   sta $020644
$15:92c2  ad 08 0c      lda $0c08
$15:92c5  0a            asl a
$15:92c6  13 02         ora ($02,s),y
$15:92c8  80 31         bra $92fb
$15:92ca  02 1f         cop #$1f
$15:92cc  09 65 03      ora #$0365
$15:92cf  bc 05 e0      ldy $e005,x
$15:92d2  00 08         brk #$08
$15:92d4  5c 35 e6 10   jml $10e635
$15:92d8  f7 90         sbc [$90],y
$15:92da  41 48         eor ($48,x)
$15:92dc  c2 1f         rep #$1f
$15:92de  05 68         ora $68
$15:92e0  39 02 21      and $2102,y
$15:92e3  c0 6a 07      cpy #$076a
$15:92e6  43 21         eor $21,s
$15:92e8  d0 d0         bne $92ba
$15:92ea  6c 32 05      jmp ($0532)
$15:92ed  20 0f 81      jsr $810f
$15:92f0  68            pla
$15:92f1  36 1f         rol $1f,x
$15:92f3  03 30         ora $30,s
$15:92f5  78            sei
$15:92f6  0c c2 66      tsb $66c2
$15:92f9  08            php
$15:92fa  14 0a         trb $0a
$15:92fc  0a            asl a
$15:92fd  b2 08         lda ($08)
$15:92ff  34 06         bit $06,x
$15:9301  0c 35 48      tsb $4835
$15:9304  0b            phd
$15:9305  fc 1d e5      jsr ($e51d,x)
$15:9308  07 84         ora [$84]
$15:930a  91 84         sta ($84),y
$15:930c  8e 44 d1      stx $d144
$15:930f  70 80         bvs $9291
$15:9311  3c 28 0d      bit $0d28,x
$15:9314  50 2a         bvc $9340
$15:9316  83 8c         sta $8c,s
$15:9318  0b            phd
$15:9319  21 b0         and ($b0,x)
$15:931b  10 07         bpl $9324
$15:931d  02 c1         cop #$c1
$15:931f  e0 d0 78      cpx #$78d0
$15:9322  32 1f         and ($1f)
$15:9324  03 2b         ora $2b,s
$15:9326  0c 41 5e      tsb $5e41
$15:9329  23 00         and $00,s
$15:932b  1b            tcs
$15:932c  0c 0a 0d      tsb $0d0a
$15:932f  1a            inc a
$15:9330  8c d7 68      sty $68d7
$15:9333  ea            nop
$15:9334  f2 81         sbc ($81)
$15:9336  9f 89 fe 10   sta $10fe89,x
$15:933a  78            sei
$15:933b  3c 7e 71      bit $717e,x
$15:933e  7c a0 3a      jmp ($3aa0,x)
$15:9341  c2 81         rep #$81
$15:9343  68            pla
$15:9344  f8            sed
$15:9345  7d 35 1a      adc $1a35,x
$15:9348  2e 24 c2      rol $c224
$15:934b  a5 a9         lda $a9
$15:934d  95 50         sta $50,x
$15:934f  a0 36 0b      ldy #$0b36
$15:9352  04 c2         tsb $c2
$15:9354  e1 f8         sbc ($f8,x)
$15:9356  fc 57 3f      jsr ($3f57,x)
$15:9359  93 ef         sta ($ef,s),y
$15:935b  f6 bb         inc $bb,x
$15:935d  fd d7 ff      sbc $ffd7,x
$15:9360  bb            tyx
$15:9361  02 11         cop #$11
$15:9363  08            php
$15:9364  8e 4a 1e      stx $1e4a
$15:9367  25 3e         and $3e
$15:9369  9f 47 23 92   sta $922347,x
$15:936d  aa            tax
$15:936e  44 72 b9      mvp $b9,$72
$15:9371  1c 78 00      trb $0078
$15:9374  01 23         ora ($23,x)
$15:9376  8f 80 9b 40   sta $409b80
$15:937a  24 50         bit $50
$15:937c  07 78         ora [$78]
$15:937e  bf c2 30 13   lda $1330c2,x
$15:9382  58            cli
$15:9383  80 6c         bra $93f1
$15:9385  1f e0 20 90   ora $9020e0,x
$15:9389  70 2b         bvs $93b6
$15:938b  c6 fd         dec $fd
$15:938d  00 a1         brk #$a1
$15:938f  0c 94 62      tsb $6294
$15:9392  03 cf         ora $cf,s
$15:9394  17 79         ora [$79],y
$15:9396  7b            tdc
$15:9397  ca            dex
$15:9398  1e 61 f3      asl $f361,x
$15:939b  97 a7         sta [$a7],y
$15:939d  aa            tax
$15:939e  11 04         ora ($04),y
$15:93a0  83 c1         sta $c1,s
$15:93a2  27 30         and [$30]
$15:93a4  eb            xba
$15:93a5  9c 7a c3      stz $c37a
$15:93a8  02 bb         cop #$bb
$15:93aa  c1 27         cmp ($27,x)
$15:93ac  f0 08         beq $93b6
$15:93ae  7a            ply
$15:93af  38            sec
$15:93b0  20 90 88      jsr $8890
$15:93b3  64 0a         stz $0a
$15:93b5  19 0c 89      ora $890c,y
$15:93b8  47 23         eor [$23]
$15:93ba  d1 88         cmp ($88),y
$15:93bc  e2 2c         sep #$2c
$15:93be  a4 14         ldy $14
$15:93c0  0e 05 02      asl $0205
$15:93c3  71 e0         adc ($e0),y
$15:93c5  ce 7c 21      dec $217c
$15:93c8  98            tya
$15:93c9  0e e5 03      asl $03e5
$15:93cc  f1 00         sbc ($00),y
$15:93ce  f0 23         beq $93f3
$15:93d0  82 81 20      brl $b454
$15:93d3  b0 60         bcs $9435
$15:93d5  2c 16 0c      bit $0c16
$15:93d8  85 c3         sta $c3
$15:93da  e1 30         sbc ($30,x)
$15:93dc  b8            clv
$15:93dd  22 ca 31 1b   jsl $1b31ca
$15:93e1  9e c4 64      stz $64c4,x
$15:93e4  32 18         and ($18)
$15:93e6  24 1a         bit $1a
$15:93e8  31 12         and ($12),y
$15:93ea  bf ca 22 d2   lda $d222ca,x
$15:93ee  98            tya
$15:93ef  cc 1a 3f      cpy $3f1a
$15:93f2  1c 9f c4      trb $c49f
$15:93f5  a4 72         ldy $72
$15:93f7  28            plp
$15:93f8  0c 1e 1b      tsb $1b1e
$15:93fb  1f b8 4a 22   ora $224ab8,x
$15:93ff  30 09         bmi $940a
$15:9401  34 82         bit $82,x
$15:9403  61 90         adc ($90,x)
$15:9405  c4 7a         cpy $7a
$15:9407  39 1e 8f      and $8f1e,y
$15:940a  27 d0         and [$d0]
$15:940c  2a            rol a
$15:940d  16 4b         asl $4b,x
$15:940f  a4 93         ldy $93
$15:9411  69 cc         adc #$cc
$15:9413  82 7e 2d      brl $c194
$15:9416  1f 08 c0 84   ora $84c008,x
$15:941a  3f 10 cb c6   and $c6cb10,x
$15:941e  33 71         and ($71,s),y
$15:9420  cc ec 5b      cpy $5bec
$15:9423  26 13         rol $13
$15:9425  45 80         eor $80
$15:9427  43 61         eor $61,s
$15:9429  d0 18         bne $9443
$15:942b  54 26 04      mvn $04,$26
$15:942e  33 18         and ($18,s),y
$15:9430  54 16 2d      mvn $2d,$16
$15:9433  1f 8f c2 61   ora $61c28f,x
$15:9437  f0 18         beq $9451
$15:9439  7c 14 84      jmp ($8414,x)
$15:943c  10 72         bpl $94b0
$15:943e  18            clc
$15:943f  c3 e1         cmp $e1,s
$15:9441  31 f8         and ($f8),y
$15:9443  04 7e         tsb $7e
$15:9445  81 d0         sta ($d0,x)
$15:9447  98            tya
$15:9448  68            pla
$15:9449  26 1b         rol $1b
$15:944b  0d 84 80      ora $8084
$15:944e  a4 1a         ldy $1a
$15:9450  08            php
$15:9451  01 64         ora ($64,x)
$15:9453  3a            dec a
$15:9454  18            clc
$15:9455  0d 87 c3      ora $c387
$15:9458  a1 f0         lda ($f0,x)
$15:945a  e0 18 83      cpx #$8318
$15:945d  c0 63 03      cpy #$0363
$15:9460  40            rti
$15:9461  7e 3f 17      ror $173f,x
$15:9464  8f c2 c0 21   sta $21c0c2
$15:9468  8b            phb
$15:9469  d0 85         bne $93f0
$15:946b  8d 5e 3c      sta $3c5e
$15:946e  3f c8 0c 7f   and $7f0cc8,x
$15:9472  a1 c0         lda ($c0,x)
$15:9474  d0 14         bne $948a
$15:9476  84 a2         sty $a2
$15:9478  12 0d         ora ($0d)
$15:947a  81 64         sta ($64,x)
$15:947c  b2 10         lda ($10)
$15:947e  02 fe         cop #$fe
$15:9480  1a            inc a
$15:9481  c6 13         dec $13
$15:9483  01 81         ora ($81,x)
$15:9485  c6 e3         dec $e3
$15:9487  1b            tcs
$15:9488  4d e4 07      eor $07e4
$15:948b  fd 03 80      sbc $8003,x
$15:948e  01 42         ora ($42,x)
$15:9490  07 0f         ora [$0f]
$15:9492  fb            xce
$15:9493  7f bf ff ff   adc $ffffbf,x
$15:9497  3f fe 87 ff   and $ff87fe,x
$15:949b  80 7f         bra $951c
$15:949d  9d 83 07      sta $0783,x
$15:94a0  80 43         bra $94e5
$15:94a2  fb            xce
$15:94a3  51 1a         eor ($1a),y
$15:94a5  ce 43 73      dec $7343
$15:94a8  30 b2         bmi $945c
$15:94aa  d3 3e         cmp ($3e,s),y
$15:94ac  92 ca         sta ($ca)
$15:94ae  6f 57 6d 86   adc $866d57
$15:94b2  aa            tax
$15:94b3  49 3d         eor #$3d
$15:94b5  ff f6 f8 73   sbc $73f8f6,x
$15:94b9  ff f9 be fc   sbc $fcbef9,x
$15:94bd  6e 7f 3a      ror $3a7f
$15:94c0  ff de 3f df   sbc $df3fde,x
$15:94c4  8f e3 24 60   sta $6024e3
$15:94c8  10 28         bpl $94f2
$15:94ca  17 fe         ora [$fe],y
$15:94cc  7f 02 64 13   adc $136402,x
$15:94d0  e5 60         sbc $60
$15:94d2  30 07         bmi $94db
$15:94d4  a8            tay
$15:94d5  00 c1         brk #$c1
$15:94d7  f2 d0         sbc ($d0)
$15:94d9  b8            clv
$15:94da  45 fe         eor $fe
$15:94dc  1e c1 00      asl $00c1,x
$15:94df  98            tya
$15:94e0  42 ef         wdm #$ef
$15:94e2  10 05         bpl $94e9
$15:94e4  c8            iny
$15:94e5  32 4f         and ($4f)
$15:94e7  fe 14 11      inc $1114,x
$15:94ea  18            clc
$15:94eb  33 01         and ($01,s),y
$15:94ed  f2 97         sbc ($97)
$15:94ef  e8            inx
$15:94f0  05 08         ora $08
$15:94f2  64 a3         stz $a3
$15:94f4  10 1e         bpl $9514
$15:94f6  78            sei
$15:94f7  bb            tyx
$15:94f8  cb            wai
$15:94f9  de 50 f3      dec $f350,x
$15:94fc  0f 9c bd 07   ora $07bd9c
$15:9500  e9 4f         sbc #$4f
$15:9502  52 fa         eor ($fa)
$15:9504  db            stp
$15:9505  df 2d 71 b7   cmp $b7712d,x
$15:9509  58            cli
$15:950a  65 d7         adc $d7
$15:950c  bb            tyx
$15:950d  b4 f2         ldy $f2,x
$15:950f  33 31         and ($31,s),y
$15:9511  83 c9         sta $c9,s
$15:9513  e5 f3         sbc $f3
$15:9515  48            pha
$15:9516  a4 ce         ldy $ce
$15:9518  01 4e         ora ($4e,x)
$15:951a  b0 5f         bcs $957b
$15:951c  a4 13         ldy $13
$15:951e  db            stp
$15:951f  9c de 7d      stz $7dde
$15:9522  3f 9c 47 e6   and $e6479c,x
$15:9526  10 f8         bpl $9520
$15:9528  dc 32 19      jml [$1932]
$15:952b  ec 82 61      cpx $6182
$15:952e  32 91         and ($91)
$15:9530  cb            wai
$15:9531  c5 c3         cmp $c3
$15:9533  e1 ce         sbc ($ce,x)
$15:9535  e0 4f a0      cpx #$a04f
$15:9538  1f e0 d0 c4   ora $c4d0e0,x
$15:953c  22 97 8f 67   jsl $678f97
$15:9540  f3 09         sbc ($09,s),y
$15:9542  fc 86 7c      jsr ($7c86,x)
$15:9545  26 1c         rol $1c
$15:9547  0e 03 34      asl $3403
$15:954a  a3 d1         lda $d1,s
$15:954c  e8            inx
$15:954d  6c 72 6f      jmp ($6f72)
$15:9550  0c 94 c5      tsb $c594
$15:9553  25 b1         and $b1
$15:9555  39 5c 72      and $725c,y
$15:9558  2d 0e 87      and $870e
$15:955b  c0 20 31      cpy #$3120
$15:955e  f8            sed
$15:955f  19 00 21      ora $2100,y
$15:9562  f0 38         beq $959c
$15:9564  bc 02 27      ldy $2702,x
$15:9567  00 8e         brk #$8e
$15:9569  40            rti
$15:956a  47 a1         eor [$a1]
$15:956c  00 d0         brk #$d0
$15:956e  50 3d         bvc $95ad
$15:9570  13 8e         ora ($8e,s),y
$15:9572  a4 e3         ldy $e3
$15:9574  49 30         eor #$30
$15:9576  e6 7c         inc $7c
$15:9578  34 95         bit $95,x
$15:957a  8f 44 43 e1   sta $e14344
$15:957e  00 fc         brk #$fc
$15:9580  7e 3e 1f      ror $1f3e,x
$15:9583  8f 07 e3 91   sta $91e307
$15:9587  f8            sed
$15:9588  84 7e         sty $7e
$15:958a  26 17         rol $17
$15:958c  8f 01 74 20   sta $207401
$15:9590  11 f8         ora ($f8),y
$15:9592  fc 30 65      jsr ($6530,x)
$15:9595  66 e0         ror $e0
$15:9597  20 ef 00      jsr $00ef
$15:959a  a3 97         lda $97,s
$15:959c  83 06         sta $06,s
$15:959e  c1 a1         cmp ($a1,x)
$15:95a0  d0 58         bne $95fa
$15:95a2  64 66         stz $66
$15:95a4  09 14         ora #$14
$15:95a6  85 45         sta $45
$15:95a8  a1 31         lda ($31,x)
$15:95aa  58            cli
$15:95ab  74 2e         stz $2e,x
$15:95ad  0f 07 1f 01   ora $011f07
$15:95b1  10 08         bpl $95bb
$15:95b3  81 07         sta ($07,x)
$15:95b5  80 c2         bra $9579
$15:95b7  e0 10 98      cpx #$9810
$15:95ba  04 3a         tsb $3a
$15:95bc  00 bd         brk #$bd
$15:95be  08            php
$15:95bf  07 42         ora [$42]
$15:95c1  41 cc         eor ($cc,x)
$15:95c3  9a            txs
$15:95c4  7a            ply
$15:95c5  a3 9d         lda $9d,s
$15:95c7  28            plp
$15:95c8  c7 9b         cmp [$9b]
$15:95ca  f1 d2         sbc ($d2),y
$15:95cc  96 5d         stx $5d,y
$15:95ce  0c e1 00      tsb $00e1
$15:95d1  fe 7f 3f      inc $3f7f,x
$15:95d4  1f cf 87 f3   ora $f387cf,x
$15:95d8  c9 fc         cmp #$fc
$15:95da  82 7f 23      brl $b95c
$15:95dd  13 c3         ora ($c3,s),y
$15:95df  08            php
$15:95e0  0a            asl a
$15:95e1  ca            dex
$15:95e2  fd 00 a1      sbc $a100,x
$15:95e5  3c 95 e2      bit $e295,x
$15:95e8  0f cf 77 78   ora $7877cf
$15:95ec  7b            tdc
$15:95ed  c2 1e         rep #$1e
$15:95ef  21 f1         and ($f1,x)
$15:95f1  97 90         sta [$90],y
$15:95f3  fc a9 e6      jsr ($e6a9,x)
$15:95f6  5f 3b 7a 1f   eor $1f7a3b,x
$15:95fa  d3 1e         cmp ($1e,s),y
$15:95fc  a9 f5         lda #$f5
$15:95fe  d7 ba         cmp [$ba],y
$15:9600  88            dey
$15:9601  00 20         brk #$20
$15:9603  81 41         sta ($41,x)
$15:9605  a1 d1         lda ($d1,x)
$15:9607  e8            inx
$15:9608  a4 f2         ldy $f2
$15:960a  4b            phk
$15:960b  34 92         bit $92,x
$15:960d  59 20 d6      eor $d620,y
$15:9610  6a            ror a
$15:9611  1d 1e 87      ora $871e,x
$15:9614  43 80         eor $80,s
$15:9616  c0 1f e1      cpy #$e11f
$15:9619  03 01         ora $01,s
$15:961b  1b            tcs
$15:961c  fc 01 45      jsr ($4501,x)
$15:961f  40            rti
$15:9620  b0 50         bcs $9672
$15:9622  21 1e         and ($1e,x)
$15:9624  0a            asl a
$15:9625  27 d3         and [$d3]
$15:9627  c9 e0         cmp #$e0
$15:9629  a1 50         lda ($50,x)
$15:962b  20 41 a0      jsr $a041
$15:962e  f1 78         sbc ($78),y
$15:9630  b0 10         bcs $9642
$15:9632  0f 84 03 f1   ora $f10384
$15:9636  40            rti
$15:9637  fc 78 3f      jsr ($3f78,x)
$15:963a  94 0f         sty $0f,x
$15:963c  e4 00         cpx $00
$15:963e  52 11         eor ($11)
$15:9640  c0 50 c1      cpy #$c150
$15:9643  e1 f1         sbc ($f1,x)
$15:9645  e9 f4         sbc #$f4
$15:9647  8a            txa
$15:9648  ed 42 b1      sbc $b142
$15:964b  50 b8         bvc $9605
$15:964d  58            cli
$15:964e  3e 1e 07      rol $071e,x
$15:9651  06 0a         asl $0a
$15:9653  27 f9         and [$f9]
$15:9655  3f c8 94 92   and $9294c8,x
$15:9659  09 85         ora #$85
$15:965b  a2 19 74      ldx #$7419
$15:965e  93 7e         sta ($7e,s),y
$15:9660  ae 57 09      ldx $0957
$15:9663  0c 86 03      tsb $0386
$15:9666  81 c0         sta ($c0,x)
$15:9668  82 83 80      brl $16ee
$15:966b  20 29 07      jsr $0729
$15:966e  f2 e1         sbc ($e1)
$15:9670  fe 90 7f      inc $7f90,x
$15:9673  a0 17 e0      ldy #$e017
$15:9676  00 40         brk #$40
$15:9678  60            rts
$15:9679  b0 f8         bcs $9673
$15:967b  4c 3e 05      jmp $053e
$15:967e  1e 3a 84      asl $843a,x
$15:9681  4a            lsr a
$15:9682  7d 33 fc      adc $fc33,x
$15:9685  fd 05 20      sbc $2005,x
$15:9688  0a            asl a
$15:9689  32 1a         and ($1a)
$15:968b  41 86         eor ($86,x)
$15:968d  01 04         ora ($04,x)
$15:968f  05 06         ora $06
$15:9691  83 e1         sta $e1,s
$15:9693  10 b8         bpl $964d
$15:9695  50 2f         bvc $96c6
$15:9697  1c 0b c5      trb $c50b
$15:969a  22 f9 cc cf   jsl $cfccf9
$15:969e  cb            wai
$15:969f  e7 e1         sbc [$e1]
$15:96a1  f0 05         beq $96a8
$15:96a3  00 7c         brk #$7c
$15:96a5  14 69         trb $69
$15:96a7  60            rts
$15:96a8  80 78         bra $9722
$15:96aa  24 06         bit $06
$15:96ac  f2 85         sbc ($85)
$15:96ae  9d 06 15      sta $1506,x
$15:96b1  3e b9 7f      rol $7fb9,x
$15:96b4  b2 79         lda ($79)
$15:96b6  9a            txs
$15:96b7  a0 b4 88      ldy #$88b4
$15:96ba  0f 66 80 79   ora $798066
$15:96be  d1 c7         cmp ($c7),y
$15:96c0  50 4a         bvc $970c
$15:96c2  0f 42 f9 4e   ora $4ef942
$15:96c6  bf f2 73 32   lda $3273f2,x
$15:96ca  a9 c2         lda #$c2
$15:96cc  7e 99 63      ror $6399,x
$15:96cf  20 05 01      jsr $0105
$15:96d2  c4 20         cpy $20
$15:96d4  30 f8         bmi $96ce
$15:96d6  84 da         sty $da
$15:96d8  15 4e         ora $4e,x
$15:96da  ad 57 ae      lda $ae57
$15:96dd  7f 9b a7 f0   adc $f0a79b,x
$15:96e1  92 90         sta ($90)
$15:96e3  98            tya
$15:96e4  04 c6         tsb $c6
$15:96e6  01 21         ora ($21,x)
$15:96e8  45 1e         eor $1e
$15:96ea  03 00         ora $00,s
$15:96ec  91 08         sta ($08),y
$15:96ee  05 c2         ora $c2
$15:96f0  11 6c         ora ($6c),y
$15:96f2  e8            inx
$15:96f3  5c ab 57 ae   jml $ae57ab
$15:96f7  76 7e         ror $7e,x
$15:96f9  5d 3f 26      eor $263f,x
$15:96fc  13 8c         ora ($8c,s),y
$15:96fe  32 10         and ($10)
$15:9700  0c 64 03      tsb $0364
$15:9703  08            php
$15:9704  aa            tax
$15:9705  32 60         and ($60)
$15:9707  40            rti
$15:9708  a1 50         lda ($50,x)
$15:970a  a8            tay
$15:970b  71 d4         adc ($d4),y
$15:970d  67 d1         adc [$d1]
$15:970f  2b            pld
$15:9710  f1 ec         sbc ($ec),y
$15:9712  1f a5 05 42   ora $4205a5,x
$15:9716  2a            rol a
$15:9717  25 01         and $01
$15:9719  e1 c0         sbc ($c0,x)
$15:971b  e8            inx
$15:971c  34 cb         bit $cb,x
$15:971e  81 7c         sta ($7c,x)
$15:9720  a4 5f         ldy $5f
$15:9722  93 60         sta ($60,s),y
$15:9724  1d 27 70      ora $7027,x
$15:9727  28            plp
$15:9728  e8            inx
$15:9729  42 06         wdm #$06
$15:972b  f2 57         sbc ($57)
$15:972d  83 fd         sta $fd,s
$15:972f  23 11         and $11,s
$15:9731  13 7a         ora ($7a,s),y
$15:9733  31 8c         and ($8c),y
$15:9735  e4 51         cpx $51
$15:9737  88            dey
$15:9738  22 3c a4 92   jsl $92a43c
$15:973c  08            php
$15:973d  26 4b         rol $4b
$15:973f  09 64         ora #$64
$15:9741  d1 44         cmp ($44),y
$15:9743  6f 75 ec ec   adc $ecec75
$15:9747  01 9c         ora ($9c,x)
$15:9749  0c e0 92      tsb $92e0
$15:974c  40            rti
$15:974d  26 d0         rol $d0
$15:974f  0d b4 83      ora $83b4
$15:9752  ad 39 e3      lda $e339
$15:9755  63 6e         adc $6e,s
$15:9757  46 f4         lsr $f4
$15:9759  81 40         sta ($40,x)
$15:975b  8e c5 18      stx $18c5
$15:975e  88            dey
$15:975f  43 00         eor $00,s
$15:9761  a0 6f 48      ldy #$486f
$15:9764  1b            tcs
$15:9765  14 48         trb $48
$15:9767  a1 18         lda ($18,x)
$15:9769  80 c3         bra $972e
$15:976b  21 0c         and ($0c,x)
$15:976d  f1 82         sbc ($82),y
$15:976f  33 c2         and ($c2,s),y
$15:9771  49 a0         eor #$a0
$15:9773  86 4e         stx $4e
$15:9775  b5 98         lda $98,x
$15:9777  db            stp
$15:9778  5c f3 3f 00   jml $003ff3
$15:977c  84 37         sty $37
$15:977e  c6 19         dec $19
$15:9780  00 96         brk #$96
$15:9782  42 36         wdm #$36
$15:9784  d2 8e         cmp ($8e)
$15:9786  b4 a7         ldy $a7,x
$15:9788  ad 95 b5      lda $b595
$15:978b  50 68         bvc $97f5
$15:978d  50 3b         bvc $97ca
$15:978f  24 9e         bit $9e
$15:9791  51 17         eor ($17),y
$15:9793  9c 43 e3      stz $e343
$15:9796  f0 b8         beq $9750
$15:9798  3c 4e 11      bit $114e,x
$15:979b  18            clc
$15:979c  72 03         adc ($03)
$15:979e  fe 22 10      inc $1022,x
$15:97a1  08            php
$15:97a2  a4 02         ldy $02
$15:97a4  27 72         and [$72]
$15:97a6  f9 6c 2e      sbc $2e6c,y
$15:97a9  5b            tcd
$15:97aa  4b            phk
$15:97ab  a5 a3         lda $a3
$15:97ad  d9 f0 fc      cmp $fcf0,y
$15:97b0  74 3c         stz $3c,x
$15:97b2  1c 88 84      trb $8488
$15:97b5  62 e0 e4      per $7c98
$15:97b8  07 20         ora [$20]
$15:97ba  38            sec
$15:97bb  00 14         brk #$14
$15:97bd  02 61         cop #$61
$15:97bf  70 04         bvs $97c5
$15:97c1  a2 01 88      ldx #$8801
$15:97c4  c0 60 70      cpy #$7060
$15:97c7  3c 2a 1d      bit $1d2a,x
$15:97ca  12 8f         ora ($8f)
$15:97cc  68            pla
$15:97cd  9f 4c 63 f1   sta $f1634c,x
$15:97d1  f8            sed
$15:97d2  7b            tdc
$15:97d3  e8            inx
$15:97d4  04 c4         tsb $c4
$15:97d6  3e 63 08      rol $0863,x
$15:97d9  02 82         cop #$82
$15:97db  39 e1 f0      and $f0e1,y
$15:97de  dc 7e 20      jml [$207e]
$15:97e1  f0 07         beq $97ea
$15:97e3  87 93         sta [$93]
$15:97e5  c9 d8         cmp #$d8
$15:97e7  ec 7c 3c      cpx $3c7c
$15:97ea  1c 08 84      trb $8408
$15:97ed  7a            ply
$15:97ee  01 0e         ora ($0e,x)
$15:97f0  71 8b         adc ($8b),y
$15:97f2  90 23         bcc $9817
$15:97f4  04 90         tsb $90
$15:97f6  51 03         eor ($03),y
$15:97f8  90 25         bcc $981f
$15:97fa  14 ee         trb $ee
$15:97fc  75 32         adc $32,x
$15:97fe  99 35 92      sta $9235,y
$15:9801  2f 82 21 10   and $102182
$15:9805  67 84         adc [$84]
$15:9807  0a            asl a
$15:9808  0c c9 09      tsb $09c9
$15:980b  ac 12 67      ldy $6712
$15:980e  00 8d         brk #$8d
$15:9810  c0 23 f0      cpy #$f023
$15:9813  08            php
$15:9814  7c 02 0e      jmp ($0e02,x)
$15:9817  c9 10         cmp #$10
$15:9819  38            sec
$15:981a  5c ae 7b 29   jml $297bae
$15:981e  97 b2         sta [$b2],y
$15:9820  49 90         eor #$90
$15:9822  16 84         asl $84,x
$15:9824  20 ee 14      jsr $14ee
$15:9827  0b            phd
$15:9828  04 03         tsb $03
$15:982a  01 ac         ora ($ac,x)
$15:982c  90 73         bcc $98a1
$15:982e  20 1d 88      jsr $881d
$15:9831  07 e2         ora [$e2]
$15:9833  01 f0         ora ($f0,x)
$15:9835  80 78         bra $98af
$15:9837  13 a0         ora ($a0,s),y
$15:9839  07 1d         ora [$1d]
$15:983b  f6 7a         inc $7a,x
$15:983d  99 cc 84      sta $84cc,y
$15:9840  d2 24         cmp ($24)
$15:9842  32 08         and ($08)
$15:9844  1c 82 23      trb $2382
$15:9847  10 82         bpl $97cb
$15:9849  43 20         eor $20,s
$15:984b  30 3b         bmi $9888
$15:984d  2a            rol a
$15:984e  00 66         brk #$66
$15:9850  e8            inx
$15:9851  41 42         eor ($42,x)
$15:9853  94 0c         sty $0c,x
$15:9855  0e 37 db      asl $db37
$15:9858  ce ca 67      dec $67ca
$15:985b  d0 89         bne $97e6
$15:985d  71 20         adc ($20),y
$15:985f  9c 08 22      stz $2208
$15:9862  5c 24 13 0c   jml $0c1324
$15:9866  07 03         ora [$03]
$15:9868  4c a0 1f      jmp $1fa0
$15:986b  62 90 54      per $ecfe
$15:986e  a5 c0         lda $c0
$15:9870  03 8f         ora $8f,s
$15:9872  fb            xce
$15:9873  fd ec f6      sbc $f6ec,x
$15:9876  52 79         eor ($79)
$15:9878  14 1a         trb $1a
$15:987a  04 1e         tsb $1e
$15:987c  81 23         sta ($23,x)
$15:987e  90 42         bcc $98c2
$15:9880  63 10         adc $10,s
$15:9882  38            sec
$15:9883  3c 16 08      bit $0816,x
$15:9886  3d 06 18      and $1806,x
$15:9889  4f c0 82 c5   eor $c582c0
$15:988d  04 48         tsb $48
$15:988f  12 02         ora ($02)
$15:9891  ff 7f db cd   sbc $cddb7f,x
$15:9895  fa            plx
$15:9896  51 3e         eor ($3e),y
$15:9898  14 0b         trb $0b
$15:989a  c1 02         cmp ($02,x)
$15:989c  6a            ror a
$15:989d  86 42         stx $42
$15:989f  31 c0         and ($c0),y
$15:98a1  f0 68         beq $990b
$15:98a3  24 1c         bit $1c
$15:98a5  87 10         sta [$10]
$15:98a7  ff 04 82 a5   sbc $a58204,x
$15:98ab  05 48         ora $48
$15:98ad  12 03         ora ($03)
$15:98af  bd de ce      lda $cede,x
$15:98b2  67 21         adc [$21]
$15:98b4  38            sec
$15:98b5  87 a8         sta [$a8]
$15:98b7  3e 41 72      rol $7241,x
$15:98ba  10 c5         bpl $9881
$15:98bc  e0 c9 60      cpx #$60c9
$15:98bf  96 38         stx $38,y
$15:98c1  05 dc         ora $dc
$15:98c3  0c 6c 94      tsb $946c
$15:98c6  bd de f7      lda $f7de,x
$15:98c9  33 9e         and ($9e,s),y
$15:98cb  84 44         sty $44
$15:98cd  2a            rol a
$15:98ce  0d 50 6c      ora $6c50
$15:98d1  84 c1         sty $c1
$15:98d3  b8            clv
$15:98d4  3a            dec a
$15:98d5  49 07         eor #$07
$15:98d7  1a            inc a
$15:98d8  01 ee         ora ($ee,x)
$15:98da  13 1b         ora ($1b,s),y
$15:98dc  a5 21         lda $21
$15:98de  10 d8         bpl $98b8
$15:98e0  2c 06 09      bit $0906
$15:98e3  04 b9         tsb $b9
$15:98e5  58            cli
$15:98e6  e5 31         sbc $31
$15:98e8  18            clc
$15:98e9  2c 1a 61      bit $611a
$15:98ec  46 87         lsr $87
$15:98ee  43 e0         eor $e0,s
$15:98f0  30 e0         bmi $98d2
$15:98f2  50 41         bvc $9935
$15:98f4  20 70 3b      jsr $3b70
$15:98f7  84 06         sty $06
$15:98f9  7c 0a 08      jmp ($080a,x)
$15:98fc  35 e5         and $e5,x
$15:98fe  92 1a         sta ($1a)
$15:9900  2f ad 2b cf   and $cf2bad
$15:9904  49 cf         eor #$cf
$15:9906  e8            inx
$15:9907  b9 f5 4e      lda $4ef5,y
$15:990a  4c 0a f3      jmp $f30a
$15:990d  a0 f7 4c      ldy #$4cf7
$15:9910  b8            clv
$15:9911  be 58 d7      ldx $d758,y
$15:9914  9e 31 1f      stz $1f31,x
$15:9917  f0 62         beq $997b
$15:9919  ee 9c 99      inc $999c
$15:991c  b5 e7         lda $e7,x
$15:991e  0d ee 88      ora $88ee
$15:9921  e1 2f         sbc ($2f,x)
$15:9923  70 28         bvs $994d
$15:9925  2c 0a 03      bit $030a
$15:9928  05 3c         ora $3c
$15:992a  84 0e         sty $0e
$15:992c  ca            dex
$15:992d  8c 08 34      sty $3408
$15:9930  56 4d         lsr $4d,x
$15:9932  3e 3f 04      rol $043f,x
$15:9935  1a            inc a
$15:9936  03 02         ora $02,s
$15:9938  41 8c         eor ($8c,x)
$15:993a  02 03         cop #$03
$15:993c  7e 60 00      ror $0060,x
$15:993f  10 09         bpl $994a
$15:9941  21 b3         and ($b3,x)
$15:9943  fe a4 42      inc $42a4,x
$15:9946  03 b7         ora $b7,s
$15:9948  d0 53         bne $999d
$15:994a  ea            nop
$15:994b  5c 9c 34 ef   jml $ef349c
$15:994f  41 cd         eor ($cd,x)
$15:9951  89 71         bit #$71
$15:9953  3e b0 a5      rol $a5b0,x
$15:9956  08            php
$15:9957  4d f9 10      eor $10f9
$15:995a  df 92 9c 27   cmp $279c92,x
$15:995e  7c 4c 65      jmp ($654c,x)
$15:9961  cf 89 3b 86   cmp $863b89
$15:9965  41 22         eor ($22,x)
$15:9967  10 58         bpl $99c1
$15:9969  24 04         bit $04
$15:996b  e4 0c         cpx $0c
$15:996d  60            rts
$15:996e  06 09         asl $09
$15:9970  30 60         bmi $99d2
$15:9972  71 82         adc ($82),y
$15:9974  30 c1         bmi $9937
$15:9976  e0 10 57      cpx #$5710
$15:9979  bb            tyx
$15:997a  68            pla
$15:997b  36 14         rol $14,x
$15:997d  08            php
$15:997e  84 42         sty $42
$15:9980  81 00         sta ($00,x)
$15:9982  0a            asl a
$15:9983  00 5d         brk #$5d
$15:9985  68            pla
$15:9986  00 00         brk #$00
$15:9988  34 87         bit $87,x
$15:998a  40            rti
$15:998b  2b            pld
$15:998c  12 08         ora ($08)
$15:998e  64 22         stz $22
$15:9990  1e ef 48      asl $48ef,x
$15:9993  1c 22 04      trb $0422
$15:9996  f9 29 9b      sbc $9b29,y
$15:9999  f4 e2 f0      pea $f0e2
$15:999c  08            php
$15:999d  6c 02 17      jmp ($1702)
$15:99a0  00 81         brk #$81
$15:99a2  1b            tcs
$15:99a3  46 21         lsr $21
$15:99a5  14 f8         trb $f8
$15:99a7  68            pla
$15:99a8  36 01         rol $01,x
$15:99aa  30 a4         bmi $9950
$15:99ac  0b            phd
$15:99ad  45 f2         eor $f2
$15:99af  7e 88 04      ror $0488,x
$15:99b2  30 22         bmi $99d6
$15:99b4  10 0f         bpl $99c5
$15:99b6  c4 02         cpy $02
$15:99b8  d0 59         bne $9a13
$15:99ba  58            cli
$15:99bb  3c 06 3f      bit $3f06,x
$15:99be  16 9e         asl $9e,x
$15:99c0  49 2d         eor #$2d
$15:99c2  95 8a         sta $8a,x
$15:99c4  c4 73         cpy $73
$15:99c6  39 19 cc      and $cc19,y
$15:99c9  62 71 06      per $a03d
$15:99cc  c3 82         cmp $82,s
$15:99ce  45 e0         eor $e0
$15:99d0  92 78         sta ($78)
$15:99d2  05 8e         ora $8e
$15:99d4  01 67         ora ($67,x)
$15:99d6  80 5d         bra $9a35
$15:99d8  c3 81         cmp $81,s
$15:99da  e0 c0 7e      cpx #$7ec0
$15:99dd  2d 07 40      and $4007
$15:99e0  9b            txy
$15:99e1  46 a3         lsr $a3
$15:99e3  5b            tcd
$15:99e4  89 cf         bit #$cf
$15:99e6  62 33 d1      per $6b1c
$15:99e9  88            dey
$15:99ea  be 4b c1      ldx $c14b,y
$15:99ed  20 f4 48      jsr $48f4
$15:99f0  3c 90 0e      bit $0e90,x
$15:99f3  34 03         bit $03,x
$15:99f5  cd 00 f7      cmp $f700
$15:99f8  3f 46 03 0f   and $0f0346,x
$15:99fc  83 47         sta $47,s
$15:99fe  22 93 c9 85   jsl $85c993
$15:9a02  e2 b9         sep #$b9
$15:9a04  5c 3d 86 e7   jml $e7863d
$15:9a08  30 7f         bmi $9a89
$15:9a0a  46 18         lsr $18
$15:9a0c  c0 24         cpy #$24
$15:9a0e  68            pla
$15:9a0f  a1 45         lda ($45,x)
$15:9a11  84 03         sty $03
$15:9a13  81 80         sta ($80,x)
$15:9a15  f8            sed
$15:9a16  58            cli
$15:9a17  27 12         and [$12]
$15:9a19  09 e4         ora #$e4
$15:9a1b  32 3d         and ($3d)
$15:9a1d  ba            tsx
$15:9a1e  9d 26 c3      sta $c326,x
$15:9a21  bb            tyx
$15:9a22  19 4f a3      ora $a34f,y
$15:9a25  8c 60 1c      sty $1c60
$15:9a28  45 50         eor $50
$15:9a2a  aa            tax
$15:9a2b  c1 5e         cmp ($5e,x)
$15:9a2d  30 78         bmi $9aa7
$15:9a2f  30 cc         bmi $99fd
$15:9a31  23 90         and $90,s
$15:9a33  09 c4         ora #$c4
$15:9a35  b2 79         lda ($79)
$15:9a37  39 bc 5a      and $5abc,y
$15:9a3a  4d 00 c0      eor $c000
$15:9a3d  78            sei
$15:9a3e  19 bc 08      ora $08bc,y
$15:9a41  a2 cf         ldx #$cf
$15:9a43  1f 05 82 61   ora $618205,x
$15:9a47  20 9c 40      jsr $409c
$15:9a4a  23 9b         and $9b,s
$15:9a4c  49 e7         eor #$e7
$15:9a4e  72 3d         adc ($3d)
$15:9a50  d6 8b         dec $8b,x
$15:9a52  37 e3         and [$e3],y
$15:9a54  80 8f         bra $99e5
$15:9a56  02 f8         cop #$f8
$15:9a58  ab            plb
$15:9a59  ea            nop
$15:9a5a  b3 d8         lda ($d8,s),y
$15:9a5c  cc af ad      cpy $adaf
$15:9a5f  0e 0c d6      asl $d60c
$15:9a62  94 35         sty $35,x
$15:9a64  8f b5 1b ec   sta $ec1bb5
$15:9a68  b7 ad         lda [$ad],y
$15:9a6a  4e 0a b0      lsr $b00a
$15:9a6d  88            dey
$15:9a6e  c3 b9         cmp $b9,s
$15:9a70  3f 19 e4 16   and $16e419,x
$15:9a74  59 0e 8f      eor $8f0e,y
$15:9a77  4b            phk
$15:9a78  a7 90         lda [$90]
$15:9a7a  29 f4         and #$f4
$15:9a7c  36 7f         rol $7f,x
$15:9a7e  10 80         bpl $9a00
$15:9a80  4f e0 3f e8   eor $e83fe0
$15:9a84  24 0e         bit $0e
$15:9a86  11 17         ora ($17),y
$15:9a88  87 4c         sta [$4c]
$15:9a8a  41 41         eor ($41,x)
$15:9a8c  01 86         ora ($86,x)
$15:9a8e  40            rti
$15:9a8f  23 7a         and $7a,s
$15:9a91  0f 75 c3 3f   ora $3fc375
$15:9a95  ac 9e e3      ldy $e39e
$15:9a98  bc bb 59      ldy $59bb,x
$15:9a9b  5d 8b 9f      eor $9f8b,x
$15:9a9e  c6 de         dec $de
$15:9aa0  dc bf 3e      jml [$3ebf]
$15:9aa3  e8            inx
$15:9aa4  8e 7e c1      stx $c17e
$15:9aa7  3d e1 79      and $79e1,x
$15:9aaa  63 52         adc $52,s
$15:9aac  be a7 2e      ldx $2ea7,y
$15:9aaf  69 9d         adc #$9d
$15:9ab1  b1 6e         lda ($6e),y
$15:9ab3  68            pla
$15:9ab4  d2 98         cmp ($98)
$15:9ab6  35 2e         and $2e,x
$15:9ab8  e7 3d         sbc [$3d]
$15:9aba  83 4c         sta $4c,s
$15:9abc  a2 53         ldx #$53
$15:9abe  6a            ror a
$15:9abf  34 fe         bit $fe,x
$15:9ac1  09 38         ora #$38
$15:9ac3  83 ce         sta $ce,s
$15:9ac5  61 10         adc ($10,x)
$15:9ac7  08            php
$15:9ac8  fc 0e f8      jsr ($f80e,x)
$15:9acb  0a            asl a
$15:9acc  08            php
$15:9acd  94 36         sty $36,x
$15:9acf  0d 79 41      ora $4179
$15:9ad2  84 06         sty $06
$15:9ad4  0d 00 87      ora $8700
$15:9ad7  c8            iny
$15:9ad8  2d df 08      and $08df
$15:9adb  fd 32 fa      sbc $fa32,x
$15:9ade  95 0d         sta $0d,x
$15:9ae0  8c b6 a5      sty $a5b6
$15:9ae3  cf a3 5b 6a   cmp $6a5ba3
$15:9ae7  5b            tcd
$15:9ae8  8b            phb
$15:9ae9  76 46         ror $46,x
$15:9aeb  3f e0 be e0   and $e0bee0,x
$15:9aef  94 a1         sty $a1,x
$15:9af1  29 eb         and #$eb
$15:9af3  73 e6         adc ($e6,s),y
$15:9af5  14 dd         trb $dd
$15:9af7  96 60         stx $60,y
$15:9af9  9a            txs
$15:9afa  23 f2         and $f2,s
$15:9afc  81 c1         sta ($c1,x)
$15:9afe  ce c1 3c      dec $3cc1
$15:9b01  9e 49 6f      stz $6f49,x
$15:9b04  94 4b         sty $4b,x
$15:9b06  23 bd         and $bd,s
$15:9b08  08            php
$15:9b09  01 01         ora ($01,x)
$15:9b0b  7a            ply
$15:9b0c  00 20         brk #$20
$15:9b0e  dd e9 c0      cmp $c0e9,x
$15:9b11  f0 54         beq $9b67
$15:9b13  23 1e         and $1e,s
$15:9b15  ca            dex
$15:9b16  67 db         adc [$db]
$15:9b18  cd e2 a1      cmp $a1e2
$15:9b1b  3f db c1 00   and $00c1db,x
$15:9b1f  f8            sed
$15:9b20  50 3f         bvc $9b61
$15:9b22  1e 0f e5      asl $e50f,x
$15:9b25  01 e2         ora ($e2,x)
$15:9b27  50 77         bvc $9ba0
$15:9b29  b0 43         bcs $9b6e
$15:9b2b  a3 91         lda $91,s
$15:9b2d  c8            iny
$15:9b2e  e8            inx
$15:9b2f  dc 27 91      jml [$9127]
$15:9b32  69 f0         adc #$f0
$15:9b34  07 00         ora [$00]
$15:9b36  e0 f1         cpx #$f1
$15:9b38  2b            pld
$15:9b39  05 82         ora $82
$15:9b3b  a1 10         lda ($10,x)
$15:9b3d  f4 52 3e      pea $3e52
$15:9b40  1e 0f 05      asl $050f,x
$15:9b43  12 81         ora ($81)
$15:9b45  04 78         tsb $78
$15:9b47  96 00         stx $00,y
$15:9b49  4c bf 81      jmp $81bf
$15:9b4c  50 40         bvc $9b8e
$15:9b4e  31 b8         and ($b8),y
$15:9b50  c3 78         cmp $78,s
$15:9b52  51 28         eor ($28),y
$15:9b54  92 0b         sta ($0b)
$15:9b56  04 22         tsb $22
$15:9b58  71 06         adc ($06),y
$15:9b5a  8b            phb
$15:9b5b  42 61         wdm #$61
$15:9b5d  6f 20 b9 9f   adc $9fb920
$15:9b61  86 76         stx $76
$15:9b63  bf 06 18 40   lda $401806,x
$15:9b67  21 30         and ($30,x)
$15:9b69  02 f0         cop #$f0
$15:9b6b  01 c3         ora ($c3,x)
$15:9b6d  e3 31         sbc $31,s
$15:9b6f  d8            cld
$15:9b70  cc 74 52      cpy $5274
$15:9b73  28            plp
$15:9b74  24 1a         bit $1a
$15:9b76  21 1c         and ($1c,x)
$15:9b78  b0 5a         bcs $9bd4
$15:9b7a  22 15 07 90   jsl $900715
$15:9b7e  73 93         adc ($93,s),y
$15:9b80  c3 dc         cmp $dc,s
$15:9b82  80 1b         bra $9b9f
$15:9b84  40            rti
$15:9b85  4e 19 08      lsr $0819
$15:9b88  06 80         asl $80
$15:9b8a  c4 3a         cpy $3a
$15:9b8c  dc 65 76      jml [$7665]
$15:9b8f  99 24 92      sta $9224,y
$15:9b92  3c 82 21      bit $2182,x
$15:9b95  18            clc
$15:9b96  85 43         sta $43
$15:9b98  a0 10         ldy #$10
$15:9b9a  a3 e9         lda $e9,s
$15:9b9c  4c e0 11      jmp $11e0
$15:9b9f  b4 21         ldy $21,x
$15:9ba1  91 42         sta ($42),y
$15:9ba3  0a            asl a
$15:9ba4  06 1f         asl $1f
$15:9ba6  ac c7 75      ldy $75c7
$15:9ba9  32 d2         and ($d2)
$15:9bab  2d 06 11      and $1106
$15:9bae  18            clc
$15:9baf  a8            tay
$15:9bb0  5c 30 1d 0c   jml $0c1d30
$15:9bb4  06 01         asl $01
$15:9bb6  42 1c         wdm #$1c
$15:9bb8  c8            iny
$15:9bb9  07 61         ora [$61]
$15:9bbb  48            pha
$15:9bbc  66 30         ror $30
$15:9bbe  90 10         bcc $9bd0
$15:9bc0  86 93         stx $93
$15:9bc2  c8            iny
$15:9bc3  aa            tax
$15:9bc4  f1 21         sbc ($21),y
$15:9bc6  96 48         stx $48,y
$15:9bc8  14 49         trb $49
$15:9bca  ac 0b 90      ldy $900b
$15:9bcd  4a            lsr a
$15:9bce  81 08         sta ($08,x)
$15:9bd0  26 e8         rol $e8
$15:9bd2  21 61         and ($61,x)
$15:9bd4  84 35         sty $35
$15:9bd6  8c 60 92      sty $9260
$15:9bd9  e9 44         sbc #$44
$15:9bdb  f5 52         sbc $52,x
$15:9bdd  3d 84 9a      and $9a84,x
$15:9be0  81 48         sta ($48,x)
$15:9be2  5b            tcd
$15:9be3  03 64         ora $64,s
$15:9be5  34 06         bit $06,x
$15:9be7  50 80         bvc $9b69
$15:9be9  7b            tdc
$15:9bea  14 42         trb $42
$15:9bec  e3 0d         sbc $0d,s
$15:9bee  83 98         sta $98,s
$15:9bf0  cc 24 6f      cpy $6f24
$15:9bf3  08            php
$15:9bf4  69 c8         adc #$c8
$15:9bf6  66 13         ror $13
$15:9bf8  08            php
$15:9bf9  24 72         bit $72
$15:9bfb  01 06         ora ($06,x)
$15:9bfd  82 c1 e0      brl $7cc1
$15:9c00  30 13         bmi $9c15
$15:9c02  fa            plx
$15:9c03  43 e0         eor $e0,s
$15:9c05  10 36         bpl $9c3d
$15:9c07  40            rti
$15:9c08  97 c9         sta [$c9],y
$15:9c0a  1e 1b 04      asl $041b,x
$15:9c0d  90 c3         bcc $9bd2
$15:9c0f  21 92         and ($92,x)
$15:9c11  09 c4         ora #$c4
$15:9c13  02 c0         cop #$c0
$15:9c15  75 04         adc $04,x
$15:9c17  eb            xba
$15:9c18  7c 20 1c      jmp ($1c20,x)
$15:9c1b  07 40         ora [$40]
$15:9c1d  9a            txs
$15:9c1e  4a            lsr a
$15:9c1f  7b            tdc
$15:9c20  02 8d         cop #$8d
$15:9c22  c1 10         cmp ($10,x)
$15:9c24  a1 0f         lda ($0f,x)
$15:9c26  80 b1         bra $9bd9
$15:9c28  c0 8e         cpy #$8e
$15:9c2a  04 a3         tsb $a3
$15:9c2c  7e 04 10      ror $1004,x
$15:9c2f  10 68         bpl $9c99
$15:9c31  75 c0         adc $c0,x
$15:9c33  4a            lsr a
$15:9c34  ef 38 be ee   sbc $eebe38
$15:9c38  0f d7 04 ee   ora $ee04d7
$15:9c3c  c9 3f         cmp #$3f
$15:9c3e  f0 44         beq $9c84
$15:9c40  c8            iny
$15:9c41  31 42         and ($42),y
$15:9c43  53 56         eor ($56,s),y
$15:9c45  84 f5         sty $f5
$15:9c47  a0 3b         ldy #$3b
$15:9c49  68            pla
$15:9c4a  04 da         tsb $da
$15:9c4c  01 26         ora ($26,x)
$15:9c4e  40            rti
$15:9c4f  8a            txa
$15:9c50  08            php
$15:9c51  00 01         brk #$01
$15:9c53  04 8b         tsb $8b
$15:9c55  c2 23         rep #$23
$15:9c57  f0 12         beq $9c6b
$15:9c59  28            plp
$15:9c5a  1d e6 18      ora $18e6,x
$15:9c5d  85 82         sta $82
$15:9c5f  60            rts
$15:9c60  50 2d         bvc $9c8f
$15:9c62  5b            tcd
$15:9c63  c9 77 72      cmp #$7277
$15:9c66  0d fd 83      ora $83fd
$15:9c69  7b            tdc
$15:9c6a  e0 5d         cpx #$5d
$15:9c6c  f9 17 fe      sbc $fe17,y
$15:9c6f  04 73         tsb $73
$15:9c71  09 47 5e      ora #$5e47
$15:9c74  59 d3 82      eor $82d3,y
$15:9c77  4c e0 93      jmp $93e0
$15:9c7a  28            plp
$15:9c7b  03 98         ora $98,s
$15:9c7d  24 50         bit $50
$15:9c7f  08            php
$15:9c80  11 30         ora ($30),y
$15:9c82  30 dc         bmi $9c60
$15:9c84  6c 1e 0f      jmp ($0f1e)
$15:9c87  02 f3         cop #$f3
$15:9c89  0e 15 0e      asl $0e15
$15:9c8c  89 67 b4      bit #$b467
$15:9c8f  4d e7 11      eor $11e7
$15:9c92  b8            clv
$15:9c93  e3 12         sbc $12,s
$15:9c95  40            rti
$15:9c96  07 41         ora [$41]
$15:9c98  24 8f         bit $8f
$15:9c9a  83 c1         sta $c1,s
$15:9c9c  61 f0         adc ($f0,x)
$15:9c9e  ec 2e 1b      cpx $1b2e
$15:9ca1  2b            pld
$15:9ca2  96 d2         stx $d2,y
$15:9ca4  e9 68 f4      sbc #$f468
$15:9ca7  7f a0 1f f8   adc $f81fa0,x
$15:9cab  01 cc         ora ($cc,x)
$15:9cad  23 d0         and $d0,s
$15:9caf  08            php
$15:9cb0  73 04         adc ($04,s),y
$15:9cb2  61 10         adc ($10,x)
$15:9cb4  08            php
$15:9cb5  84 02         sty $02
$15:9cb7  4f 77 b3 d9   eor $d9b377
$15:9cbb  e8            inx
$15:9cbc  36 7a         rol $7a,x
$15:9cbe  35 26         and $26,x
$15:9cc0  5d 31 9a      eor $9a31,x
$15:9cc3  ce e3 f1      dec $f1e3
$15:9cc6  f8            sed
$15:9cc7  62 b0 47      per $e47a
$15:9cca  f5 03         sbc $03,x
$15:9ccc  98            tya
$15:9ccd  41 20         eor ($20,x)
$15:9ccf  d8            cld
$15:9cd0  2c 17 0b      bit $0b17
$15:9cd3  85 f2         sta $f2
$15:9cd5  f9 7c 3e      sbc $3e7c,y
$15:9cd8  1e 4f 26      asl $264f,x
$15:9cdb  23 11         and $11,s
$15:9cdd  38            sec
$15:9cde  90 7e         bcc $9d5e
$15:9ce0  20 17 c8      jsr $c817
$15:9ce3  04 f1         tsb $f1
$15:9ce5  82 2c 20      brl $bd14
$15:9ce8  8c 40 2e      sty $2e40
$15:9ceb  10 0e         bpl $9cfb
$15:9ced  00 ac         brk #$ac
$15:9cef  16 c1         asl $c1,x
$15:9cf1  0f 88 4f a4   ora $a44f88
$15:9cf5  57 3a         eor [$3a],y
$15:9cf7  0d fe 41      ora $41fe
$15:9cfa  f2 b4         sbc ($b4)
$15:9cfc  fb            xce
$15:9cfd  69 dc e2      adc #$e2dc
$15:9d00  50 b0         bvc $9cb2
$15:9d02  c5 84         cmp $84
$15:9d04  04 a0         tsb $a0
$15:9d06  86 c0         stx $c0
$15:9d08  23 50         and $50,s
$15:9d0a  89 c9 b8      bit #$b8c9
$15:9d0d  78            sei
$15:9d0e  1e 09 84      asl $8409,x
$15:9d11  c0 b6         cpy #$b6
$15:9d13  1f 4f b4 f6   ora $f6b44f,x
$15:9d17  7f 08 87 f0   adc $f08708,x
$15:9d1b  0f e4 6c 03   ora $036ce4
$15:9d1f  50 8a         bvc $9cab
$15:9d21  c1 3a         cmp ($3a,x)
$15:9d23  1f 01 00 c0   ora $c00001,x
$15:9d27  60            rts
$15:9d28  70 21         bvs $9d4b
$15:9d2a  38            sec
$15:9d2b  47 a0         eor [$a0]
$15:9d2d  53 38         eor ($38,s),y
$15:9d2f  0c fe 41      tsb $41fe
$15:9d32  72 b4         adc ($b4)
$15:9d34  db            stp
$15:9d35  4f a4 ff 04   eor $04ffa4
$15:9d39  1d 24 42      ora $4224,x
$15:9d3c  41 30         eor ($30,x)
$15:9d3e  84 42         sty $42
$15:9d40  30 98         bmi $9cda
$15:9d42  4f af d6 79   eor $79d6af
$15:9d46  3e 4d a2      rol $a24d,x
$15:9d49  a4 af         ldy $af
$15:9d4b  10 08         bpl $9d55
$15:9d4d  54 03 82      mvn $82,$03
$15:9d50  aa            tax
$15:9d51  33 f9         and ($f9,s),y
$15:9d53  c3 e0         cmp $e0,s
$15:9d55  51 38         eor ($38),y
$15:9d57  08            php
$15:9d58  8c 26 52      sty $5226
$15:9d5b  95 e1         sta $e1,x
$15:9d5d  9f c9 0b 57   sta $570bc9,x
$15:9d61  0f c4 12 09   ora $0912c4
$15:9d65  81 c1         sta ($c1,x)
$15:9d67  fc be cd      jsr ($cdbe,x)
$15:9d6a  96 25         stx $25,y
$15:9d6c  01 7c         ora ($7c,x)
$15:9d6e  a1 2e         lda ($2e,x)
$15:9d70  87 57         sta [$57]
$15:9d72  84 02         sty $02
$15:9d74  1c f5 15      trb $15f5
$15:9d77  c3 a0         cmp $a0,s
$15:9d79  7b            tdc
$15:9d7a  c1 f0         cmp ($f0,x)
$15:9d7c  69 e3 c0      adc #$c0e3
$15:9d7f  1c 7c 3f      trb $3f7c
$15:9d82  25 80         and $80
$15:9d84  40            rti
$15:9d85  60            rts
$15:9d86  2d 30 86      and $8630
$15:9d89  c1 4d         cmp ($4d,x)
$15:9d8b  d0 c2         bne $9d4f
$15:9d8d  18            clc
$15:9d8e  44 04 0a      mvp $0a,$04
$15:9d91  2d 30 48      and $4830
$15:9d94  8d 12 41      sta $4112
$15:9d97  04 9d         tsb $9d
$15:9d99  6b            rtl
$15:9d9a  32 f5         and ($f5)
$15:9d9c  9b            txy
$15:9d9d  e6 7d         inc $7d
$15:9d9f  e0 20         cpx #$20
$15:9da1  e0 02         cpx #$02
$15:9da3  85 b2         sta $b2
$15:9da5  01 3e         ora ($3e,x)
$15:9da7  94 65         sty $65,x
$15:9da9  a3 3e         lda $3e,s
$15:9dab  6c ed 88      jmp ($88ed)
$15:9dae  dc c7 90      jml [$90c7]
$15:9db1  1f 94 34 4e   ora $4e3494,x
$15:9db5  0a            asl a
$15:9db6  f7 1f         sbc [$1f],y
$15:9db8  98            tya
$15:9db9  14 42         trb $42
$15:9dbb  61 04         adc ($04,x)
$15:9dbd  4b            phk
$15:9dbe  0a            asl a
$15:9dbf  5c 27 da 8c   jml $8cda27
$15:9dc3  ad ee 91      lda $91ee
$15:9dc6  9b            txy
$15:9dc7  78            sei
$15:9dc8  0c 12 01      tsb $0112
$15:9dcb  44 80 59      mvp $59,$80
$15:9dce  20 1b 69      jsr $691b
$15:9dd1  47 5a         eor [$5a]
$15:9dd3  73 c6         adc ($c6,s),y
$15:9dd5  cc d9 a2      cpy $a2d9
$15:9dd8  f0 7a         beq $9e54
$15:9dda  1a            inc a
$15:9ddb  50 21         bvc $9dfe
$15:9ddd  90 c8         bcc $9da7
$15:9ddf  a4 82         ldy $82
$15:9de1  0b            phd
$15:9de2  05 07         ora $07
$15:9de4  04 09         tsb $09
$15:9de6  94 31         sty $31,x
$15:9de8  88            dey
$15:9de9  05 d0         ora $d0
$15:9deb  ec 10 30      cpx $3010
$15:9dee  00 4d         brk #$4d
$15:9df0  c9 02 32      cmp #$3202
$15:9df3  08            php
$15:9df4  07 a3         ora [$a3]
$15:9df6  c1 c2         cmp ($c2,x)
$15:9df8  88            dey
$15:9df9  44 2e 1a      mvp $1a,$2e
$15:9dfc  0d 82 54      ora $5482
$15:9dff  28            plp
$15:9e00  12 08         ora ($08)
$15:9e02  04 41         tsb $41
$15:9e04  fa            plx
$15:9e05  72 e8         adc ($e8)
$15:9e07  06 02         asl $02
$15:9e09  80 00         bra $9e0b
$15:9e0b  0f e4 02 c0   ora $c002e4
$15:9e0f  1b            tcs
$15:9e10  28            plp
$15:9e11  3c 26 03      bit $0326,x
$15:9e14  06 8a         asl $8a
$15:9e16  c0 0f         cpy #$0f
$15:9e18  c0 fa         cpy #$fa
$15:9e1a  45 91         eor $91
$15:9e1c  80 02         bra $9e20
$15:9e1e  2e 09 18      rol $1809
$15:9e21  58            cli
$15:9e22  e1 3c         sbc ($3c,x)
$15:9e24  99 0c 85      sta $850c,y
$15:9e27  82 a1 00      brl $9ecb
$15:9e2a  a4 40         ldy $40
$15:9e2c  03 40         ora $40,s
$15:9e2e  6e 54 70      ror $7054
$15:9e31  07 03         ora [$03]
$15:9e33  f1 00         sbc ($00),y
$15:9e35  b4 15         ldy $15,x
$15:9e37  9a            txs
$15:9e38  27 80         and [$80]
$15:9e3a  9f e0 28 74   sta $7428e0,x
$15:9e3e  08            php
$15:9e3f  cc e2 09      cpy $09e2
$15:9e42  0c 81 40      tsb $4081
$15:9e45  96 e5         stx $e5,y
$15:9e47  7f 3f 0c fc   adc $fc0c3f,x
$15:9e4b  5c 00 b1 5c   jml $5cb100
$15:9e4f  1c 03 fd      trb $fd03
$15:9e52  00 fc         brk #$fc
$15:9e54  c0 7e         cpy #$7e
$15:9e56  10 3e         bpl $9e96
$15:9e58  04 0a         tsb $0a
$15:9e5a  0d 06 7c      ora $7c06
$15:9e5d  0c 32 c1      tsb $c132
$15:9e60  f8            sed
$15:9e61  ff a3 84 50   sbc $5084a3,x
$15:9e65  1f d4 80 40   ora $4080d4,x
$15:9e69  3f 50 0f 81   and $810f50,x
$15:9e6d  b1 6b         lda ($6b),y
$15:9e6f  f4 08 65      pea $6508
$15:9e72  02 09         cop #$09
$15:9e74  27 1e         and [$1e]
$15:9e76  21 fd         and ($fd,x)
$15:9e78  10 60         bpl $9eda
$15:9e7a  00 01         brk #$01
$15:9e7c  e2 23         sep #$23
$15:9e7e  d2 09         cmp ($09)
$15:9e80  06 b2         asl $b2
$15:9e82  f9 61 11      sbc $1161,y
$15:9e85  c1 f1         cmp ($f1,x)
$15:9e87  27 d1         and [$d1]
$15:9e89  4e 11 a1      lsr $a111
$15:9e8c  da            phx
$15:9e8d  ab            plb
$15:9e8e  ca            dex
$15:9e8f  3f 80 a3 d0   and $d0a380,x
$15:9e93  20 01 90      jsr $9001
$15:9e96  90 43         bcc $9edb
$15:9e98  e3 e7         sbc $e7,s
$15:9e9a  d4 60         pei ($60)
$15:9e9c  a3 f0         lda $f0,s
$15:9e9e  51 8f         eor ($8f),y
$15:9ea0  cd 87 c8      cmp $c887
$15:9ea3  26 18         rol $18
$15:9ea5  0e 04 03      asl $0304
$15:9ea8  00 dd         brk #$dd
$15:9eaa  65 58         adc $58
$15:9eac  06 80         asl $80
$15:9eae  d3 0b         cmp ($0b,s),y
$15:9eb0  30 83         bmi $9e35
$15:9eb2  be 06 21      ldx $2106,y
$15:9eb5  10 3b         bpl $9ef2
$15:9eb7  84 06         sty $06
$15:9eb9  06 01         asl $01
$15:9ebb  88            dey
$15:9ebc  7a            ply
$15:9ebd  18            clc
$15:9ebe  51 ad         eor ($ad),y
$15:9ec0  c4 4c         cpy $4c
$15:9ec2  1c 42 31      trb $3142
$15:9ec5  c0 f8         cpy #$f8
$15:9ec7  37 d9         and [$d9],y
$15:9ec9  52 5e         eor ($5e)
$15:9ecb  01 58         ora ($58,x)
$15:9ecd  c0 a0         cpy #$a0
$15:9ecf  a6 e0         ldx $e0
$15:9ed1  82 41 25      brl $c415
$15:9ed4  53 38         eor ($38,s),y
$15:9ed6  5c 16 15 06   jml $061516
$15:9eda  88            dey
$15:9edb  41 e3         eor ($e3,x)
$15:9edd  d2 78         cmp ($78)
$15:9edf  0c 3a 01      tsb $013a
$15:9ee2  07 82         ora [$82]
$15:9ee4  40            rti
$15:9ee5  e0 73         cpx #$73
$15:9ee7  88            dey
$15:9ee8  0c 7a 0d      tsb $0d7a
$15:9eeb  01 82         ora ($82,x)
$15:9eed  42 e0         wdm #$e0
$15:9eef  f3 8d         sbc ($8d,s),y
$15:9ef1  97 f6         sta [$f6],y
$15:9ef3  95 e7         sta $e7,x
$15:9ef5  84 f7         sty $f7
$15:9ef7  f0 1e         beq $9f17
$15:9ef9  fa            plx
$15:9efa  a7 2b         lda [$2b]
$15:9efc  85 3b         sta $3b
$15:9efe  c8            iny
$15:9eff  5b            tcd
$15:9f00  a2 7c         ldx #$7c
$15:9f02  4f ac 2b cf   eor $cf2bac
$15:9f06  18            clc
$15:9f07  8f f8 31 f7   sta $f731f8
$15:9f0b  0e 44 de      asl $de44
$15:9f0e  77 c4         adc [$c4],y
$15:9f10  a6 6c         ldx $6c
$15:9f12  f8            sed
$15:9f13  93 b3         sta ($b3,s),y
$15:9f15  7a            ply
$15:9f16  40            rti
$15:9f17  a0 72         ldy #$72
$15:9f19  d9 8c 26      cmp $268c,y
$15:9f1c  0d 19 81      ora $8119
$15:9f1f  cb            wai
$15:9f20  a9 e7         lda #$e7
$15:9f22  f5 82         sbc $82,x
$15:9f24  40            rti
$15:9f25  67 c8         adc [$c8]
$15:9f27  31 9e         and ($9e),y
$15:9f29  43 ee         eor $ee,s
$15:9f2b  1a            inc a
$15:9f2c  2f af 29 24   and $2429af
$15:9f30  15 fd         ora $fd,x
$15:9f32  06 3e         asl $3e
$15:9f34  a1 cd         lda ($cd,x)
$15:9f36  c3 4e         cmp $4e,s
$15:9f38  60            rts
$15:9f39  14 e8         trb $e8
$15:9f3b  8f 9b cb 1a   sta $1acb9b
$15:9f3f  b3 e6         lda ($e6,s),y
$15:9f41  14 65         trb $65
$15:9f43  c9 9b         cmp #$9b
$15:9f45  4e 78 d4      lsr $d478
$15:9f48  ed 8a b4      sbc $b48a
$15:9f4b  20 90 07      jsr $0790
$15:9f4e  78            sei
$15:9f4f  40            rti
$15:9f50  a0 42         ldy #$42
$15:9f52  b0 80         bcs $9ed4
$15:9f54  c1 5e         cmp ($5e,x)
$15:9f56  81 06         sta ($06,x)
$15:9f58  80 43         bra $9f9d
$15:9f5a  a1 07         lda ($07,x)
$15:9f5c  30 7f         bmi $9fdd
$15:9f5e  8c 18 08      sty $0818
$15:9f61  10 77         bpl $9fda
$15:9f63  a0 41         ldy #$41
$15:9f65  c9 41         cmp #$41
$15:9f67  10 81         bpl $9eea
$15:9f69  c8            iny
$15:9f6a  20 00 f0      jsr $f000
$15:9f6d  a0 50         ldy #$50
$15:9f6f  05 61         ora $61
$15:9f71  80 d0         bra $9f43
$15:9f73  05 02         ora $02
$15:9f75  c1 00         cmp ($00,x)
$15:9f77  b8            clv
$15:9f78  44 06 e0      mvp $e0,$06
$15:9f7b  1f 1b 00 90   ora $90001b,x
$15:9f7f  3c 01 90      bit $9001,x
$15:9f82  35 87         and $87,x
$15:9f84  02 11         cop #$11
$15:9f86  c0 26         cpy #$26
$15:9f88  09 30         ora #$30
$15:9f8a  50 81         bvc $9f0d
$15:9f8c  06 5a         asl $5a
$15:9f8e  01 30         ora ($30,x)
$15:9f90  61 f0         adc ($f0,x)
$15:9f92  b7 b0         lda [$b0],y
$15:9f94  0f ca 06 f0   ora $f006ca
$15:9f98  02 28         cop #$28
$15:9f9a  41 c0         eor ($c0,x)
$15:9f9c  c1 15         cmp ($15,x)
$15:9f9e  7d 80 58      adc $5880,x
$15:9fa1  0a            asl a
$15:9fa2  03 c0         ora $c0,s
$15:9fa4  e0 58         cpx #$58
$15:9fa6  24 01         bit $01
$15:9fa8  41 80         eor ($80,x)
$15:9faa  7c 3a 05      jmp ($053a,x)
$15:9fad  03 c0         ora $c0,s
$15:9faf  0b            phd
$15:9fb0  82 40 2e      brl $cdf3
$15:9fb3  0f 00 98 35   ora $359800
$15:9fb7  01 b0         ora ($b0,x)
$15:9fb9  37 bc         and [$bc],y
$15:9fbb  05 ee         ora $ee
$15:9fbd  10 5b         bpl $a01a
$15:9fbf  f1 be         sbc ($be),y
$15:9fc1  07 e2         ora [$e2]
$15:9fc3  f8            sed
$15:9fc4  1f f9 00 1e   ora $1e00f9,x
$15:9fc8  81 18         sta ($18,x)
$15:9fca  88            dey
$15:9fcb  58            cli
$15:9fcc  61 1f         adc ($1f,x)
$15:9fce  6b            rtl
$15:9fcf  85 e2         sta $e2
$15:9fd1  01 b0         ora ($b0,x)
$15:9fd3  a8            tay
$15:9fd4  7a            ply
$15:9fd5  29 07         and #$07
$15:9fd7  90 02         bcc $9fdb
$15:9fd9  04 72         tsb $72
$15:9fdb  19 03 bd      ora $bd03,y
$15:9fde  df b1 d0 cf   cmp $cfd0b1,x
$15:9fe2  e5 43         sbc $43
$15:9fe4  11 48         ora ($48),y
$15:9fe6  c8            iny
$15:9fe7  4d 32 3e      eor $3e32
$15:9fea  fe 1d 2b      inc $2b1d,x
$15:9fed  03 df         ora $df,s
$15:9fef  e5 e7         sbc $e7
$15:9ff1  71 b5         adc ($b5),y
$15:9ff3  ae 5c 92      ldx $925c
$15:9ff6  cd 18 9e      cmp $9e18
$15:9ff9  64 6d         stz $6d
$15:9ffb  dc 35 f0      jml [$f035]
$15:9ffe  fe e0 9b      inc $9be0,x
$15:a001  da            phx
$15:a002  13 14         ora ($14,s),y
$15:a004  2e d0 89      rol $89d0
$15:a007  e0 40         cpx #$40
$15:a009  26 1c         rol $1c
$15:a00b  0e 06 02      asl $0206
$15:a00e  41 d0         eor ($d0,x)
$15:a010  e0 64         cpx #$64
$15:a012  24 1b         bit $1b
$15:a014  0f 05 86 c3   ora $c38605
$15:a018  c0 f0         cpy #$f0
$15:a01a  34 05         bit $05,x
$15:a01c  9e 3d 89      stz $893d,x
$15:a01f  04 e3         tsb $e3
$15:a021  81 f8         sta ($f8,x)
$15:a023  80 5c         bra $a081
$15:a025  70 5e         bvs $a085
$15:a027  02 00         cop #$00
$15:a029  0c 49 46      tsb $4649
$15:a02c  11 28         ora ($28),y
$15:a02e  14 36         trb $36
$15:a030  07 04         ora [$04]
$15:a032  1a            inc a
$15:a033  00 fc         brk #$fc
$15:a035  45 e7         eor $e7
$15:a037  0c 48 09      tsb $0948
$15:a03a  14 05         trb $05
$15:a03c  e7 30         sbc [$30]
$15:a03e  88            dey
$15:a03f  4a            lsr a
$15:a040  21 11         and ($11,x)
$15:a042  47 a8         eor [$a8]
$15:a044  41 31         eor ($31,x)
$15:a046  58            cli
$15:a047  4a            lsr a
$15:a048  56 22         lsr $22,x
$15:a04a  a8            tay
$15:a04b  1b            tcs
$15:a04c  03 b8         ora $b8,s
$15:a04e  44 20 10      mvp $10,$20
$15:a051  80 20         bra $a073
$15:a053  be 83 09      ldx $0983,y
$15:a056  00 c4         brk #$c4
$15:a058  0a            asl a
$15:a059  86 41         stx $41
$15:a05b  20 88 08      jsr $0888
$15:a05e  41 24         eor ($24,x)
$15:a060  11 81         ora ($81),y
$15:a062  00 8c         brk #$8c
$15:a064  40            rti
$15:a065  64 27         stz $27
$15:a067  52 1e         eor ($1e)
$15:a069  10 8c         bpl $9ff7
$15:a06b  08            php
$15:a06c  e4 36         cpx $36
$15:a06e  08            php
$15:a06f  21 3c         and ($3c,x)
$15:a071  44 40 54      mvp $54,$40
$15:a074  02 88         cop #$88
$15:a076  c5 07         cmp $07
$15:a078  6c fa 02      jmp ($02fa)
$15:a07b  90 92         bcc $a00f
$15:a07d  16 6b         asl $6b,x
$15:a07f  02 92         cop #$92
$15:a081  c6 6f         dec $6f
$15:a083  96 79         stx $79,y
$15:a085  d4 2a         pei ($2a)
$15:a087  37 02         and [$02],y
$15:a089  9e 50 e7      stz $e750,x
$15:a08c  d0 d9         bne $a067
$15:a08e  e8            inx
$15:a08f  34 21         bit $21,x
$15:a091  f0 18         beq $a0ab
$15:a093  f4 12 e7      pea $e712
$15:a096  0a            asl a
$15:a097  82 c0 8f      brl $305a
$15:a09a  a1 67         lda ($67,x)
$15:a09c  80 c3         bra $a061
$15:a09e  9f 61 a0 f7   sta $f7a061,x
$15:a0a2  58            cli
$15:a0a3  21 fa         and ($fa,x)
$15:a0a5  c9 ee         cmp #$ee
$15:a0a7  0b            phd
$15:a0a8  cb            wai
$15:a0a9  b1 93         lda ($93),y
$15:a0ab  c0 bb         cpy #$bb
$15:a0ad  f2 4a         sbc ($4a)
$15:a0af  ed 6a d1      sbc $d16a
$15:a0b2  ee 88 c3      inc $c388
$15:a0b5  fe 13 de      inc $de13,x
$15:a0b8  17 96         ora [$96],y
$15:a0ba  35 25         and $25,x
$15:a0bc  ed 73 e6      sbc $e673
$15:a0bf  14 dd         trb $dd
$15:a0c1  95 23         sta $23,x
$15:a0c3  6f 29 83 51   adc $518329
$15:a0c7  67 3f         adc [$3f]
$15:a0c9  fe 34 c2      inc $c234,x
$15:a0cc  07 3f         ora [$3f]
$15:a0ce  87 4e         sta [$4e]
$15:a0d0  62 d3 c8      per $69a6
$15:a0d3  c9 f4         cmp #$f4
$15:a0d5  63 f0         adc $f0,s
$15:a0d7  1b            tcs
$15:a0d8  f4 1b c2      pea $c21b
$15:a0db  7f 08 74 46   adc $467408,x
$15:a0df  21 2f         and ($2f,x)
$15:a0e1  40            rti
$15:a0e2  82 34 a6      brl $4719
$15:a0e5  19 fb 66      ora $66fb,y
$15:a0e8  f7 1d         sbc [$1d],y
$15:a0ea  e5 d9         sbc $d9
$15:a0ec  cb            wai
$15:a0ed  6a            ror a
$15:a0ee  1c fa 35      trb $35fa
$15:a0f1  be e5 f9      ldx $f9e5,y
$15:a0f4  4f 86 7e c0   eor $c07e86
$15:a0f8  a3 29         lda $29,s
$15:a0fa  6f 4b 9b 32   adc $329b4b
$15:a0fe  a7 ec         lda [$ec]
$15:a100  3b            tsc
$15:a101  32 66         and ($66)
$15:a103  30 41         bmi $a146
$15:a105  60            rts
$15:a106  10 68         bpl $a170
$15:a108  14 08         trb $08
$15:a10a  9e 10 68      stz $6810,x
$15:a10d  24 3a         bit $3a
$15:a10f  11 0e         ora ($0e),y
$15:a111  82 42 e2      brl $8356
$15:a114  d0 18         bne $a12e
$15:a116  44 0e 05      mvp $05,$0e
$15:a119  01 82         ora ($82,x)
$15:a11b  40            rti
$15:a11c  60            rts
$15:a11d  c8            iny
$15:a11e  b0 04         bcs $a124
$15:a120  0c 2e 09      tsb $092e
$15:a123  f0 b8         beq $a0dd
$15:a125  68            pla
$15:a126  20 1e 0a      jsr $0a1e
$15:a129  07 82         ora [$82]
$15:a12b  41 80         eor ($80,x)
$15:a12d  a0 68         ldy #$68
$15:a12f  2a            rol a
$15:a130  1b            tcs
$15:a131  0b            phd
$15:a132  84 83         sty $83
$15:a134  21 68         and ($68,x)
$15:a136  c0 44         cpy #$44
$15:a138  38            sec
$15:a139  14 0c         trb $0c
$15:a13b  00 58         brk #$58
$15:a13d  f4 17 0c      pea $0c17
$15:a140  06 42         asl $42
$15:a142  c1 09         cmp ($09,x)
$15:a144  85 91         sta $91
$15:a146  06 05         asl $05
$15:a148  05 82         ora $82
$15:a14a  c0 e1         cpy #$e1
$15:a14c  30 e8         bmi $a136
$15:a14e  64 16         stz $16
$15:a150  13 0f         ora ($0f,s),y
$15:a152  86 c4         stx $c4
$15:a154  ca            dex
$15:a155  61 01         adc ($01,x)
$15:a157  01 82         ora ($82,x)
$15:a159  18            clc
$15:a15a  21 30         and ($30,x)
$15:a15c  68            pla
$15:a15d  60            rts
$15:a15e  dc 20 d0      jml [$d020]
$15:a161  d8            cld
$15:a162  14 42         trb $42
$15:a164  a1 80         lda ($80,x)
$15:a166  80 05         bra $a16d
$15:a168  c2 41         rep #$41
$15:a16a  20 a0 44      jsr $44a0
$15:a16d  3e 13 0d      rol $0d13,x
$15:a170  06 42         asl $42
$15:a172  e1 70         sbc ($70,x)
$15:a174  a4 08         ldy $08
$15:a176  00 2e         brk #$2e
$15:a178  02 40         cop #$40
$15:a17a  e0 44         cpx #$44
$15:a17c  3c 13 03      bit $0313,x
$15:a17f  30 58         bmi $a1d9
$15:a181  36 10         rol $10,x
$15:a183  0e 08 c4      asl $c408
$15:a186  57 c1         eor [$c1],y
$15:a188  01 3a         ora ($3a,x)
$15:a18a  80 cc         bra $a158
$15:a18c  11 a1         ora ($a1),y
$15:a18e  00 82         brk #$82
$15:a190  2f 83 fe 71   and $71fe83
$15:a194  35 f0         and $f0,x
$15:a196  1e c2 0e      asl $0ec2,x
$15:a199  89 2e         bit #$2e
$15:a19b  64 33         stz $33
$15:a19d  b1 d8         lda ($d8),y
$15:a19f  82 4f 0b      brl $acf1
$15:a1a2  a1 20         lda ($20,x)
$15:a1a4  34 87         bit $87,x
$15:a1a6  00 c8         brk #$c8
$15:a1a8  3c 08 47      bit $4708,x
$15:a1ab  c3 ad         cmp $ad,s
$15:a1ad  20 9c 40      jsr $409c
$15:a1b0  05 60         ora $60
$15:a1b2  98            tya
$15:a1b3  19 02 70      ora $7002,y
$15:a1b6  64 07         stz $07
$15:a1b8  02 a0         cop #$a0
$15:a1ba  40            rti
$15:a1bb  3b            tsc
$15:a1bc  72 4f         adc ($4f)
$15:a1be  45 5e         eor $5e
$15:a1c0  65 5d         adc $5d
$15:a1c2  97 c1         sta [$c1],y
$15:a1c4  21 e7         and ($e7,x)
$15:a1c6  03 43         ora $43,s
$15:a1c8  04 92         tsb $92
$15:a1ca  0d 57 82      ora $8257
$15:a1cd  57 4f         eor [$4f],y
$15:a1cf  81 10         sta ($10,x)
$15:a1d1  5f 22 cc 2f   eor $2fcc22,x
$15:a1d5  ed 41 9f      sbc $9f41
$15:a1d8  c0 23         cpy #$23
$15:a1da  e8            inx
$15:a1db  91 6f         sta ($6f),y
$15:a1dd  79 d4 22      adc $22d4,y
$15:a1e0  51 09         eor ($09),y
$15:a1e2  4c e3 89      jmp $89e3
$15:a1e5  c4 9d         cpy $9d
$15:a1e7  c1 f9         cmp ($f9,x)
$15:a1e9  0d c4 3b      ora $3bc4
$15:a1ec  83 30         sta $30,s
$15:a1ee  14 61         trb $61
$15:a1f0  c4 6e         cpy $6e
$15:a1f2  2e 22 e9      rol $e922
$15:a1f5  ec 89 4d      cpx $4d89
$15:a1f8  39 51 cd      and $cd51,y
$15:a1fb  16 3a         asl $3a,x
$15:a1fd  e3 7f         sbc $7f,s
$15:a1ff  c0 43         cpy #$43
$15:a201  ee 10 78      inc $7810
$15:a204  46 22         lsr $22
$15:a206  01 ec         ora ($ec,x)
$15:a208  80 4d         bra $a257
$15:a20a  20 11 c8      jsr $c811
$15:a20d  06 39         asl $39
$15:a20f  a8            tay
$15:a210  2b            pld
$15:a211  d0 6e         bne $a281
$15:a213  a1 d4         lda ($d4,x)
$15:a215  29 57         and #$57
$15:a217  a8            tay
$15:a218  44 21 bf      mvp $bf,$21
$15:a21b  58            cli
$15:a21c  48            pha
$15:a21d  07 c1         ora [$c1]
$15:a21f  bf 74 0b 04   lda $040b74,x
$15:a223  22 19 13 99   jsl $991319
$15:a227  b7 e3         lda [$e3],y
$15:a229  00 46         brk #$46
$15:a22b  18            clc
$15:a22c  61 7c         adc ($7c,x)
$15:a22e  e7 b0         sbc [$b0]
$15:a230  28            plp
$15:a231  dc 12 2f      jml [$2f12]
$15:a234  08            php
$15:a235  15 94         ora $94,x
$15:a237  0c be 87      tsb $87be
$15:a23a  90 83         bcc $a1bf
$15:a23c  1a            inc a
$15:a23d  14 be         trb $be
$15:a23f  7a            ply
$15:a240  a9 47         lda #$47
$15:a242  d2 0d         cmp ($0d)
$15:a244  75 e1         adc $e1,x
$15:a246  7f 70 5f f8   adc $f85f70,x
$15:a24a  17 be         ora [$be],y
$15:a24c  25 ff         and $ff
$15:a24e  6d 0c 22      adc $220c
$15:a251  ef 04 ad c0   sbc $c0ad04
$15:a255  3b            tsc
$15:a256  50 0c         bvc $a264
$15:a258  94 02         sty $02,x
$15:a25a  24 a7         bit $a7
$15:a25c  13 61         ora ($61,s),y
$15:a25e  c7 4e         cmp [$4e]
$15:a260  02 75         cop #$75
$15:a262  d8            cld
$15:a263  22 16 38 5a   jsl $5a3816
$15:a267  9a            txs
$15:a268  7c a6 fb      jmp ($fba6,x)
$15:a26b  88            dey
$15:a26c  dd e3 3d      cmp $3de3,x
$15:a26f  f9 4f fc      sbc $fc4f,y
$15:a272  11 36         ora ($36),y
$15:a274  5a            phy
$15:a275  9a            txs
$15:a276  b4 a7         ldy $a7,x
$15:a278  ad 08 71      lda $7108
$15:a27b  07 52         ora [$52]
$15:a27d  01 94         ora ($94,x)
$15:a27f  61 a4         adc ($a4,x)
$15:a281  2e 19 02      rol $0219
$15:a284  85 49         sta $49
$15:a286  6d 94 3a      adc $3a94
$15:a289  3d 02 c7      and $c702,x
$15:a28c  25 ba         and $ba
$15:a28e  c0 a4         cpy #$a4
$15:a290  50 c8         bvc $a25a
$15:a292  e4 32         cpx $32
$15:a294  07 0a         ora [$0a]
$15:a296  82 db 20      brl $c374
$15:a299  74 78         stz $78,x
$15:a29b  05 8e         ora $8e
$15:a29d  00 fa         brk #$fa
$15:a29f  18            clc
$15:a2a0  e0 94         cpx #$94
$15:a2a2  3a            dec a
$15:a2a3  13 0a         ora ($0a,s),y
$15:a2a5  05 43         ora $43
$15:a2a7  40            rti
$15:a2a8  10 0b         bpl $a2b5
$15:a2aa  04 03         tsb $03
$15:a2ac  80 61         bra $a30f
$15:a2ae  21 88         and ($88,x)
$15:a2b0  4c 38 01      jmp $0138
$15:a2b3  21 e0         and ($e0,x)
$15:a2b5  58            cli
$15:a2b6  30 01         bmi $a2b9
$15:a2b8  85 77         sta $77
$15:a2ba  04 2e         tsb $2e
$15:a2bc  0b            phd
$15:a2bd  0d 81 c1      ora $c181
$15:a2c0  e0 27         cpx #$27
$15:a2c2  91 80         sta ($80),y
$15:a2c4  c0 45         cpy #$45
$15:a2c6  67 04         adc [$04]
$15:a2c8  86 c0         stx $c0
$15:a2ca  8e e6 39      stx $39e6
$15:a2cd  48            pha
$15:a2ce  05 42         ora $42
$15:a2d0  a1 60         lda ($60,x)
$15:a2d2  b8            clv
$15:a2d3  72 3c         adc ($3c)
$15:a2d5  18            clc
$15:a2d6  4e 03 10      lsr $1003
$15:a2d9  29 14         and #$14
$15:a2db  0c 86 02      tsb $0286
$15:a2de  e1 70         sbc ($70,x)
$15:a2e0  c8            iny
$15:a2e1  48            pha
$15:a2e2  36 10         rol $10,x
$15:a2e4  0b            phd
$15:a2e5  04 30         tsb $30
$15:a2e7  ac 38 4a      ldy $4a38
$15:a2ea  06 33         asl $33
$15:a2ec  01 78         ora ($78,x)
$15:a2ee  b8            clv
$15:a2ef  1f c4 72 10   ora $1072c4,x
$15:a2f3  48            pha
$15:a2f4  24 0c         bit $0c
$15:a2f6  de 2b a4      dec $a42b,x
$15:a2f9  5b            tcd
$15:a2fa  04 06         tsb $06
$15:a2fc  0c 74 ac      tsb $ac74
$15:a2ff  04 83         tsb $83
$15:a301  41 e0         eor ($e0,x)
$15:a303  b0 d8         bcs $a2dd
$15:a305  78            sei
$15:a306  1e 09 07      asl $0709,x
$15:a309  82 a3 51      brl $f4af
$15:a30c  91 58         sta ($58),y
$15:a30e  81 81         sta ($81,x)
$15:a310  20 4a 84      jsr $844a
$15:a313  02 c3         cop #$c3
$15:a315  82 f0 40      brl $e408
$15:a318  54 a0 9a      mvn $9a,$a0
$15:a31b  34 42         bit $42,x
$15:a31d  93 03         sta ($03,s),y
$15:a31f  05 84         ora $84
$15:a321  80 61         bra $a384
$15:a323  b8            clv
$15:a324  16 dc         asl $dc,x
$15:a326  fc 85 5c      jsr ($5c85,x)
$15:a329  d8            cld
$15:a32a  48            pha
$15:a32b  36 1a         rol $1a,x
$15:a32d  69 60         adc #$60
$15:a32f  8f c8 68 0a   sta $0a68c8
$15:a333  e6 a0         inc $a0
$15:a335  af 82 c3 01   lda $01c382
$15:a339  db            stp
$15:a33a  7e 57 00      ror $0057,x
$15:a33d  88            dey
$15:a33e  59 0d 82      eor $820d,y
$15:a341  c3 2c         cmp $2c,s
$15:a343  83 7e         sta $7e,s
$15:a345  30 90         bmi $a2d7
$15:a347  24 4a         bit $4a
$15:a349  bd 46 04      lda $0446,x
$15:a34c  55 08         eor $08,x
$15:a34e  36 f5         rol $f5,x
$15:a350  10 c0         bpl $a312
$15:a352  41 63         eor ($63,x)
$15:a354  82 08 20      brl $c35f
$15:a357  16 25         asl $25,x
$15:a359  73 c0         adc ($c0,s),y
$15:a35b  28            plp
$15:a35c  12 08         ora ($08)
$15:a35e  05 db         ora $db
$15:a360  53 1d         eor ($1d,s),y
$15:a362  07 c4         ora [$c4]
$15:a364  82 d9 66      brl $0a40
$15:a367  9c 47 68      stz $6847
$15:a36a  40            rti
$15:a36b  f8            sed
$15:a36c  84 c4         sty $c4
$15:a36e  20 11 9b      jsr $9b11
$15:a371  b0 3e         bcs $a3b1
$15:a373  20 11 08      jsr $0811
$15:a376  cc 64 74      cpy $7464
$15:a379  18            clc
$15:a37a  91 f4         sta ($f4),y
$15:a37c  81 47         sta ($47,x)
$15:a37e  c8            iny
$15:a37f  4f a7 a8 c0   eor $c0a8a7
$15:a383  23 08         and $08,s
$15:a385  85 1b         sta $1b
$15:a387  24 e6         bit $e6
$15:a389  2c 05 03      bit $0305
$15:a38c  7b            tdc
$15:a38d  92 42         sta ($42)
$15:a38f  73 50         adc ($50,s),y
$15:a391  c0 5a         cpy #$5a
$15:a393  4d ec 0a      eor $0aec
$15:a396  08            php
$15:a397  2e 0e 1f      rol $1f0e
$15:a39a  c0 c6         cpy #$c6
$15:a39c  0e 81 20      asl $2081
$15:a39f  d0 0c         bne $a3ad
$15:a3a1  1e 03 81      asl $8103,x
$15:a3a4  a0 88         ldy #$88
$15:a3a6  58            cli
$15:a3a7  0d f0 e3      ora $e3f0
$15:a3aa  28            plp
$15:a3ab  10 30         bpl $a3dd
$15:a3ad  15 f7         ora $f7,x
$15:a3af  04 53         tsb $53
$15:a3b1  82 be c3      brl $6772
$15:a3b4  22 af b9 05   jsl $05b9af
$15:a3b8  80 18         bra $a3d2
$15:a3ba  0e f2 81      asl $81f2
$15:a3bd  2f 42 09 01   and $010942
$15:a3c1  82 83 02      brl $a647
$15:a3c4  1d 08 7b      ora $7b08,x
$15:a3c7  83 fc         sta $fc,s
$15:a3c9  e0 d0         cpx #$d0
$15:a3cb  28            plp
$15:a3cc  34 1e         bit $1e,x
$15:a3ce  05 12         ora $12
$15:a3d0  83 c4         sta $c4,s
$15:a3d2  20 6d e0      jsr $e06d
$15:a3d5  07 95         ora [$95]
$15:a3d7  01 ba         ora ($ba,x)
$15:a3d9  12 0c         ora ($0c)
$15:a3db  06 81         asl $81
$15:a3dd  bc 17 08      ldy $0817,x
$15:a3e0  80 5c         bra $a43e
$15:a3e2  03 e7         ora $e7,s
$15:a3e4  60            rts
$15:a3e5  a0 58         ldy #$58
$15:a3e7  3c 14 0a      bit $0a14,x
$15:a3ea  47 82         eor [$82]
$15:a3ec  11 c0         ora ($c0),y
$15:a3ee  74 94         stz $94,x
$15:a3f0  0e 07 06      asl $0607
$15:a3f3  66 8c         ror $8c
$15:a3f5  22 11 0b 87   jsl $870b11
$15:a3f9  c0 e0         cpy #$e0
$15:a3fb  ed a1 80      sbc $80a1
$15:a3fe  c0 d9         cpy #$d9
$15:a400  81 03         sta ($03,x)
$15:a402  82 41 e2      brl $8646
$15:a405  d0 78         bne $a47f
$15:a407  ac 08 7c      ldy $7c08
$15:a40a  58            cli
$15:a40b  08            php
$15:a40c  07 03         ora [$03]
$15:a40e  81 60         sta ($60,x)
$15:a410  76 82         ror $82,x
$15:a412  20 22 1d      jsr $1d22
$15:a415  0f 80 9c 1b   ora $1b9c80
$15:a419  43 80         eor $80,s
$15:a41b  17 04         ora [$04],y
$15:a41d  83 81         sta $81,s
$15:a41f  20 f0 5a      jsr $5af0
$15:a422  3c 1a 81      bit $811a,x
$15:a425  38            sec
$15:a426  60            rts
$15:a427  1a            inc a
$15:a428  ca            dex
$15:a429  41 02         eor ($02,x)
$15:a42b  08            php
$15:a42c  10 82         bpl $a3b0
$15:a42e  04 7b         tsb $7b
$15:a430  03 7b         ora $7b,s
$15:a432  1e 05 ea      asl $ea05,x
$15:a435  08            php
$15:a436  90 82         bcc $a3ba
$15:a438  c2 0b         rep #$0b
$15:a43a  00 90         brk #$90
$15:a43c  15 70         ora $70,x
$15:a43e  62 24 1d      per $c165
$15:a441  0e 07 80      asl $8007
$15:a444  a4 15         ldy $15
$15:a446  01 c8         ora ($c8,x)
$15:a448  46 23         lsr $23
$15:a44a  13 09         ora ($09,s),y
$15:a44c  85 82         sta $82
$15:a44e  c1 08         cmp ($08,x)
$15:a450  f4 7e 27      pea $277e
$15:a453  17 02         ora [$02],y
$15:a455  e0 4c         cpx #$4c
$15:a457  37 9d         and [$9d],y
$15:a459  1b            tcs
$15:a45a  bc 0a cf      ldy $cf0a,x
$15:a45d  18            clc
$15:a45e  f5 c0         sbc $c0,x
$15:a460  37 f1         and [$f1],y
$15:a462  08            php
$15:a463  7c 42 18      jmp ($1842,x)
$15:a466  8f 08 07 46   sta $460708
$15:a46a  15 02         ora $02,x
$15:a46c  cc 46 0d      cpy $0d46
$15:a46f  c1 9c         cmp ($9c,x)
$15:a471  88            dey
$15:a472  63 a2         adc $a2,s
$15:a474  03 90         ora $90,s
$15:a476  7d 84 02      adc $0284,x
$15:a479  7b            tdc
$15:a47a  8b            phb
$15:a47b  f7 50         sbc [$50],y
$15:a47d  3e d0 8e      rol $8ed0,x
$15:a480  bc 03 fb      ldy $fb03,x
$15:a483  08            php
$15:a484  f8            sed
$15:a485  42 26         wdm #$26
$15:a487  09 10         ora #$10
$15:a489  80 62         bra $a4ed
$15:a48b  ea            nop
$15:a48c  14 08         trb $08
$15:a48e  cc 20 ee      cpy $ee20
$15:a491  13 98         ora ($98,s),y
$15:a493  45 c6         eor $c6
$15:a495  10 59         bpl $a4f0
$15:a497  00 78         brk #$78
$15:a499  40            rti
$15:a49a  33 f4         and ($f4,s),y
$15:a49c  1c 64 c6      trb $c664
$15:a49f  df 42 b9 f3   cmp $f3b942,x
$15:a4a3  2e b0 09      rol $09b0
$15:a4a6  fc 23 0f      jsr ($0f23,x)
$15:a4a9  08            php
$15:a4aa  c3 41         cmp $41,s
$15:a4ac  28            plp
$15:a4ad  32 09         and ($09)
$15:a4af  8d 2a 85      sta $852a
$15:a4b2  98            tya
$15:a4b3  e6 0c         inc $0c
$15:a4b5  03 1c         ora $1c,s
$15:a4b7  fa            plx
$15:a4b8  1c 24 13      trb $1324
$15:a4bb  05 fc         ora $fc
$15:a4bd  c1 4a         cmp ($4a,x)
$15:a4bf  b1 9e         lda ($9e),y
$15:a4c1  7a            ply
$15:a4c2  87 ee         sta [$ee]
$15:a4c4  09 ea         ora #$ea
$15:a4c6  80 7f         bra $a547
$15:a4c8  a0 9f         ldy #$9f
$15:a4ca  88            dey
$15:a4cb  24 62         bit $62
$15:a4cd  11 82         ora ($82),y
$15:a4cf  80 e3         bra $a4b4
$15:a4d1  2a            rol a
$15:a4d2  35 08         and $08,x
$15:a4d4  6b            rtl
$15:a4d5  30 63         bmi $a53a
$15:a4d7  90 49         bcc $a522
$15:a4d9  c4 11         cpy $11
$15:a4db  3e 11 0f      rol $0f11,x
$15:a4de  fe 1b a1      inc $a11b,x
$15:a4e1  46 cf         lsr $cf
$15:a4e3  ca            dex
$15:a4e4  6f f8 0a fc   adc $fc0af8
$15:a4e8  83 9f         sta $9f,s
$15:a4ea  10 d7         bpl $a4c3
$15:a4ec  c0 28         cpy #$28
$15:a4ee  18            clc
$15:a4ef  0c 34 02      tsb $0234
$15:a4f2  8d 29 94      sta $9429
$15:a4f5  f0 0d         beq $a504
$15:a4f7  c0 65         cpy #$65
$15:a4f9  08            php
$15:a4fa  82 6c 3a      brl $df69
$15:a4fd  18            clc
$15:a4fe  0a            asl a
$15:a4ff  07 c2         ora [$c2]
$15:a501  31 ba         and ($ba),y
$15:a503  93 e6         sta ($e6,s),y
$15:a505  28            plp
$15:a506  5e 91 d0      lsr $d091,x
$15:a509  50 27         bvc $a532
$15:a50b  98            tya
$15:a50c  0a            asl a
$15:a50d  81 18         sta ($18,x)
$15:a50f  22 11 88 34   jsl $348811
$15:a513  9e 81 42      stz $4281,x
$15:a516  98            tya
$15:a517  c4 20         cpy $20
$15:a519  34 09         bit $09,x
$15:a51b  8e 02 e1      stx $e102
$15:a51e  00 d8         brk #$d8
$15:a520  3a            dec a
$15:a521  c2 7f         rep #$7f
$15:a523  46 e8         lsr $e8
$15:a525  61 b7         adc ($b7,x)
$15:a527  f4 9a 7e      pea $7e9a
$15:a52a  c2 ad         rep #$ad
$15:a52c  00 ef         brk #$ef
$15:a52e  be 02 41      ldx $4102,y
$15:a531  19 98 51      ora $5198,y
$15:a534  87 c1         sta [$c1]
$15:a536  29 a4 c8      and #$c8a4
$15:a539  36 0b         rol $0b,x
$15:a53b  d0 dc         bne $a519
$15:a53d  b9 40 ba      lda $ba40,y
$15:a540  13 08         ora ($08,s),y
$15:a542  4f 01 08 11   eor $110801
$15:a546  8e 84 82      stx $8284
$15:a549  41 d0         eor ($d0,x)
$15:a54b  d4 40         pei ($40)
$15:a54d  37 10         and [$10],y
$15:a54f  0f 05 03 80   ora $800305
$15:a553  8f 08 c4 62   sta $62c408
$15:a557  81 20         sta ($20,x)
$15:a559  a4 74         ldy $74
$15:a55b  17 81         ora [$81],y
$15:a55d  d0 80         bne $a4df
$15:a55f  70 07         bvs $a568
$15:a561  a1 c0         lda ($c0,x)
$15:a563  1e 04 1b      asl $1b04,x
$15:a566  bf 62 b3 76   lda $76b362,x
$15:a56a  e6 d5         inc $d5
$15:a56c  5b            tcd
$15:a56d  fc 43 4f      jsr ($4f43,x)
$15:a570  10 84         bpl $a4f6
$15:a572  a9 82 01      lda #$0182
$15:a575  06 82         asl $82
$15:a577  58            cli
$15:a578  a0 1d b8      ldy #$b81d
$15:a57b  05 57         ora $57
$15:a57d  11 10         ora ($10),y
$15:a57f  c7 44         cmp [$44]
$15:a581  31 10         and ($10),y
$15:a583  81 28         sta ($28,x)
$15:a585  c0 ac 1f      cpy #$1fac
$15:a588  ba            tsx
$15:a589  35 db         and $db,x
$15:a58b  97 6c         sta [$6c],y
$15:a58d  d5 7f         cmp $7f,x
$15:a58f  a1 1e         lda ($1e,x)
$15:a591  58            cli
$15:a592  46 42         lsr $42
$15:a594  20 86 0b      jsr $0b86
$15:a597  04 82         tsb $82
$15:a599  8d 00 e5      sta $e500
$15:a59c  c0 35 51      cpy #$5135
$15:a59f  18            clc
$15:a5a0  45 c6         eor $c6
$15:a5a2  11 11         ora ($11),y
$15:a5a4  36 82         rol $82,x
$15:a5a6  18            clc
$15:a5a7  21 d0         and ($d0,x)
$15:a5a9  88            dey
$15:a5aa  3c 1a 0a      bit $0a1a,x
$15:a5ad  be 08 54      ldx $5408,y
$15:a5b0  2a            rol a
$15:a5b1  19 06 86      ora $8606,y
$15:a5b4  42 21         wdm #$21
$15:a5b6  d0 48         bne $a600
$15:a5b8  74 42         stz $42,x
$15:a5ba  07 06         ora [$06]
$15:a5bc  80 c0         bra $a57e
$15:a5be  20 70 a8      jsr $a870
$15:a5c1  0c 30 0c      tsb $0c30
$15:a5c4  30 e0         bmi $a5a6
$15:a5c6  50 dc         bvc $a5a4
$15:a5c8  09 21 60      ora #$6021
$15:a5cb  d0 26         bne $a5f3
$15:a5cd  82 a1 f0      brl $9671
$15:a5d0  98            tya
$15:a5d1  68            pla
$15:a5d2  2a            rol a
$15:a5d3  19 0b 86      ora $860b,y
$15:a5d6  02 a1         cop #$a1
$15:a5d8  08            php
$15:a5d9  e0 58 30      cpx #$3058
$15:a5dc  0a            asl a
$15:a5dd  90 a8         bcc $a587
$15:a5df  60            rts
$15:a5e0  26 01         rol $01
$15:a5e2  d0 d0         bne $a5b4
$15:a5e4  07 04         ora [$04]
$15:a5e6  26 10         rol $10
$15:a5e8  24 30         bit $30
$15:a5ea  33 82         and ($82,s),y
$15:a5ec  0b            phd
$15:a5ed  05 81         ora $81
$15:a5ef  c2 61         rep #$61
$15:a5f1  d0 c8         bne $a5bb
$15:a5f3  2c 26 1f      bit $1f26
$15:a5f6  0d 81 40      ora $4081
$15:a5f9  60            rts
$15:a5fa  10 11         bpl $a60d
$15:a5fc  f8            sed
$15:a5fd  41 60         eor ($60,x)
$15:a5ff  50 97         bvc $a598
$15:a601  c8            iny
$15:a602  0d c2 0c      ora $0cc2
$15:a605  3e 0c 02      rol $020c,x
$15:a608  ac 20 04      ldy $0420
$15:a60b  f0 4a         beq $a657
$15:a60d  07 03         ora [$03]
$15:a60f  20 17 10      jsr $1017
$15:a612  d8            cld
$15:a613  5c 0a 07 80   jml $80070a
$15:a617  2b            pld
$15:a618  0d 82 61      ora $6182
$15:a61b  c0 88 58      cpy #$5888
$15:a61e  10 a0         bpl $a5c0
$15:a620  f3 08         sbc ($08,s),y
$15:a622  fc 03 cf      jsr ($cf03,x)
$15:a625  07 11         ora [$11]
$15:a627  03 74         ora $74,s
$15:a629  20 24 00      jsr $0024
$15:a62c  20 83 74      jsr $7483
$15:a62f  21 f0         and ($f0,x)
$15:a631  09 fc 1f      ora #$1ffc
$15:a634  f0 a9         beq $a5df
$15:a636  03 d9         ora $d9,s
$15:a638  90 07         bcc $a641
$15:a63a  61 30         adc ($30,x)
$15:a63c  cc 46 34      cpy $3446
$15:a63f  06 d0         asl $d0
$15:a641  bc 72 31      ldy $3172,x
$15:a644  08            php
$15:a645  f0 f2         beq $a639
$15:a647  43 26         eor $26,s
$15:a649  53 29         eor ($29,s),y
$15:a64b  65 02         adc $02
$15:a64d  29 e0 d8      and #$d8e0
$15:a650  50 2f         bvc $a681
$15:a652  10 0c         bpl $a660
$15:a654  45 c2         eor $c2
$15:a656  61 c8         adc ($c8,x)
$15:a658  84 7c         sty $7c
$15:a65a  26 9c         rol $9c
$15:a65c  86 70         stx $70
$15:a65e  10 82         bpl $a5e2
$15:a660  67 16         adc [$16]
$15:a662  8c 4b 22      sty $224b
$15:a665  51 e8         eor ($e8),y
$15:a667  2c 7e 0d      bit $0d7e
$15:a66a  14 c4         trb $c4
$15:a66c  c6 20         dec $20
$15:a66e  30 35         bmi $a6a5
$15:a670  f8            sed
$15:a671  48            pha
$15:a672  60            rts
$15:a673  f1 38         sbc ($38),y
$15:a675  3c 05 00      bit $0005,x
$15:a678  10 f8         bpl $a672
$15:a67a  5c 7f ce 71   jml $71ce7f
$15:a67e  0c 06 03      tsb $0306
$15:a681  81 03         sta ($03,x)
$15:a683  a1 70         lda ($70,x)
$15:a685  ac 30 6b      ldy $6b30
$15:a688  97 83         sta [$83],y
$15:a68a  d5 d0         cmp $d0,x
$15:a68c  8e 6c 27      stx $276c
$15:a68f  85 20         sta $20
$15:a691  11 86         ora ($86),y
$15:a693  07 81         ora [$81]
$15:a695  86 f0         stx $f0
$15:a697  63 3e         adc $3e,s
$15:a699  11 4f         ora ($4f),y
$15:a69b  c7 83         cmp [$83]
$15:a69d  f9 c0 fe      sbc $fec0,y
$15:a6a0  1f 82 61 12   ora $126182,x
$15:a6a4  8d cb a2      sta $a2cb
$15:a6a7  31 c8         and ($c8),y
$15:a6a9  52 e0         eor ($e0)
$15:a6ab  26 f0         rol $f0
$15:a6ad  49 85 2f      eor #$2f85
$15:a6b0  b0 7e         bcs $a730
$15:a6b2  09 0c 0e      ora #$0e0c
$15:a6b5  23 07         and $07,s
$15:a6b7  81 b1         sta ($b1,x)
$15:a6b9  86 11         stx $11
$15:a6bb  3f 87 cf e4   and $e4cf87,x
$15:a6bf  e7 10         sbc [$10]
$15:a6c1  80 40         bra $a703
$15:a6c3  f0 50         beq $a715
$15:a6c5  2a            rol a
$15:a6c6  0f 1a e5 24   ora $24e51a
$15:a6ca  be 50 29      ldx $2950,y
$15:a6cd  8d b0 ea      sta $eab0
$15:a6d0  47 8e         eor [$8e]
$15:a6d2  e3 80         sbc $80,s
$15:a6d4  c3 70         cmp $70,s
$15:a6d6  31 9e         and ($9e),y
$15:a6d8  0c 07 c3      tsb $c307
$15:a6db  60            rts
$15:a6dc  ea            nop
$15:a6dd  1f 07 f8 fc   ora $fcf807,x
$15:a6e1  12 c9         ora ($c9)
$15:a6e3  25 2a         and $2a
$15:a6e5  b5 42         lda $42,x
$15:a6e7  1a            inc a
$15:a6e8  85 9a         sta $9a
$15:a6ea  48            pha
$15:a6eb  de 01 d9      dec $d901,x
$15:a6ee  c6 20         dec $20
$15:a6f0  12 42         ora ($42)
$15:a6f2  10 91         bpl $a685
$15:a6f4  9a            txs
$15:a6f5  61 50         adc ($50,x)
$15:a6f7  a0 50 20      ldy #$2050
$15:a6fa  72 58         adc ($58)
$15:a6fc  24 12         bit $12
$15:a6fe  81 42         sta ($42,x)
$15:a700  b0 68         bcs $a76a
$15:a702  1a            inc a
$15:a703  01 00         ora ($00,x)
$15:a705  a0 48 20      ldy #$2048
$15:a708  11 05         ora ($05),y
$15:a70a  78            sei
$15:a70b  40            rti
$15:a70c  28            plp
$15:a70d  24 b1         bit $b1
$15:a70f  a0 40 24      ldy #$2440
$15:a712  50 08         bvc $a71c
$15:a714  24 00         bit $00
$15:a716  b2 50         lda ($50)
$15:a718  6a            ror a
$15:a719  54 22 11      mvn $11,$22
$15:a71c  80 c2         bra $a6e0
$15:a71e  13 ca         ora ($ca,s),y
$15:a720  09 24 34      ora #$3424
$15:a723  81 7c         sta ($7c,x)
$15:a725  0d a1 82      ora $82a1
$15:a728  25 89         and $89
$15:a72a  7c 22 90      jmp ($9022,x)
$15:a72d  08            php
$15:a72e  41 38         eor ($38,x)
$15:a730  e1 93         sbc ($93,x)
$15:a732  48            pha
$15:a733  81 84         sta ($84,x)
$15:a735  21 11         and ($11,x)
$15:a737  89 44 82      bit #$8244
$15:a73a  41 02         eor ($02,x)
$15:a73c  89 17 c9      bit #$c917
$15:a73f  1a            inc a
$15:a740  06 d0         asl $d0
$15:a742  07 81         ora [$81]
$15:a744  84 21         sty $21
$15:a746  44 b1 8b      mvp $8b,$b1
$15:a749  c3 e0         cmp $e0,s
$15:a74b  73 fa         adc ($fa,s),y
$15:a74d  3c fe 87      bit $87fe,x
$15:a750  3f a7 4f ae   and $ae4fa7,x
$15:a754  13 f8         ora ($f8,s),y
$15:a756  c5 82         cmp $82
$15:a758  27 4d         and [$4d]
$15:a75a  4a            lsr a
$15:a75b  81 44         sta ($44,x)
$15:a75d  18            clc
$15:a75e  25 41         and $41
$15:a760  60            rts
$15:a761  8c 7e 3f      sty $3f7e
$15:a764  32 99         and ($99)
$15:a766  54 23 15      mvn $15,$23
$15:a769  c8            iny
$15:a76a  f5 72         sbc $72,x
$15:a76c  38            sec
$15:a76d  d3 0b         cmp ($0b,s),y
$15:a76f  24 12         bit $12
$15:a771  21 f0         and ($f0,x)
$15:a773  85 41         sta $41
$15:a775  a2 16 2f      ldx #$2f16
$15:a778  04 01         tsb $01
$15:a77a  be 1e 27      ldx $271e,y
$15:a77d  10 fe         bpl $a77d
$15:a77f  a0 10 e8      ldy #$e810
$15:a782  07 e3         ora [$e3]
$15:a784  f1 9c         sbc ($9c),y
$15:a786  8e 41 21      stx $2141
$15:a789  d0 28         bne $a7b3
$15:a78b  38            sec
$15:a78c  40            rti
$15:a78d  20 2f 51      jsr $512f
$15:a790  10 01         bpl $a793
$15:a792  2c a1 d0      bit $d0a1
$15:a795  17 90         ora [$90],y
$15:a797  be 45 f0      ldx $f045,y
$15:a79a  b0 0d         bcs $a7a9
$15:a79c  05 c2         ora $c2
$15:a79e  80 df         bra $a77f
$15:a7a0  0e 01 2c      asl $2c01
$15:a7a3  8a            txa
$15:a7a4  21 a4         and ($a4,x)
$15:a7a6  d0 55         bne $a7fd
$15:a7a8  28            plp
$15:a7a9  97 0c         sta [$0c],y
$15:a7ab  00 48         brk #$48
$15:a7ad  f0 02         beq $a7b1
$15:a7af  50 a0         bvc $a751
$15:a7b1  60            rts
$15:a7b2  34 14         bit $14,x
$15:a7b4  4a            lsr a
$15:a7b5  24 e2         bit $e2
$15:a7b7  17 0b         ora [$0b],y
$15:a7b9  82 c3 60      brl $087f
$15:a7bc  70 78         bvs $a836
$15:a7be  08            php
$15:a7bf  0c 06 eb      tsb $eb06
$15:a7c2  0b            phd
$15:a7c3  82 43 5e      brl $0609
$15:a7c6  24 66         bit $66
$15:a7c8  00 4a         brk #$4a
$15:a7ca  40            rti
$15:a7cb  2a            rol a
$15:a7cc  15 0b         ora $0b,x
$15:a7ce  05 c3         ora $c3
$15:a7d0  81 e0         sta ($e0,x)
$15:a7d2  c0 70 30      cpy #$3070
$15:a7d5  02 60         cop #$60
$15:a7d7  1b            tcs
$15:a7d8  9e 42 41      stz $4142,x
$15:a7db  b0 80         bcs $a75d
$15:a7dd  58            cli
$15:a7de  02 62         cop #$62
$15:a7e0  58            cli
$15:a7e1  51 b9         eor ($b9),y
$15:a7e3  bd c5 40      lda $40c5,x
$15:a7e6  11 08         ora ($08),y
$15:a7e8  44 21 2a      mvp $2a,$21
$15:a7eb  10 77         bpl $a864
$15:a7ed  90 3e         bcc $a82d
$15:a7ef  05 f4         ora $f4
$15:a7f1  32 08         and ($08)
$15:a7f3  84 80         sty $80
$15:a7f5  f4 30 f7      pea $f730
$15:a7f8  90 78         bcc $a872
$15:a7fa  a1 56         lda ($56,x)
$15:a7fc  ab            plb
$15:a7fd  d4 52         pei ($52)
$15:a7ff  39 e0 f8      and $f8e0,y
$15:a802  40            rti
$15:a803  3e 14 0b      rol $0b14,x
$15:a806  01 54         ora ($54,x)
$15:a808  1f 81 0c f8   ora $f80c81,x
$15:a80c  5f 30 11 84   eor $841130,x
$15:a810  a9 18 81      lda #$8118
$15:a813  36 50         rol $50,x
$15:a815  0b            phd
$15:a816  36 f6         rol $f6,x
$15:a818  23 7f         and $7f,s
$15:a81a  98            tya
$15:a81b  5c 25 96 09   jml $099625
$15:a81f  ad c2 31      lda $31c2
$15:a822  78            sei
$15:a823  a3 cf         lda $cf,s
$15:a825  e6 10         inc $10
$15:a827  fa            plx
$15:a828  14 76         trb $76
$15:a82a  01 7f         ora ($7f,x)
$15:a82c  87 df         sta [$df]
$15:a82e  e3 ec         sbc $ec,s
$15:a830  21 83         and ($83,x)
$15:a832  df e0 13 f8   cmp $f813e0,x
$15:a836  04 3e         tsb $3e
$15:a838  d1 7e         cmp ($7e),y
$15:a83a  ce 73 b4      dec $b473
$15:a83d  9c ee 24      stz $24ee
$15:a840  db            stp
$15:a841  d1 0e         cmp ($0e),y
$15:a843  99 4f 38      sta $384f,y
$15:a846  9f 85 18 60   sta $601885,x
$15:a84a  3f d3 0e 73   and $730ed3,x
$15:a84e  84 39         sty $39
$15:a850  1f ef 87 fb   ora $fb87ef,x
$15:a854  81 fc         sta ($fc,x)
$15:a856  80 7e         bra $a8d6
$15:a858  20 1e 0e      jsr $0e1e
$15:a85b  b4 f6         ldy $f6,x
$15:a85d  53 6f         eor ($6f,s),y
$15:a85f  99 d8 e1      sta $e1d8,y
$15:a862  16 0a         asl $0a,x
$15:a864  b4 c2         ldy $c2,x
$15:a866  99 3c 91      sta $913c,y
$15:a869  c7 e3         cmp [$e3]
$15:a86b  10 7e         bpl $a8eb
$15:a86d  14 76         trb $76
$15:a86f  21 7f         and ($7f,x)
$15:a871  8e 31 0a      stx $0a31
$15:a874  7f 03 66 04   adc $046603,x
$15:a878  7e 01 07      ror $0701,x
$15:a87b  94 4e         sty $4e,x
$15:a87d  a3 15         lda $15,s
$15:a87f  a6 88         ldx $88
$15:a881  54 25 df      mvn $df,$25
$15:a884  a8            tay
$15:a885  e3 65         sbc $65,s
$15:a887  38            sec
$15:a888  9f e6 98 38   sta $3898e6,x
$15:a88c  43 a1         eor $a1,s
$15:a88e  ee f0 7f      inc $7ff0
$15:a891  1d 28 6f      ora $6f28,x
$15:a894  29 04 a2      and #$a204
$15:a897  49 24 80      eor #$8024
$15:a89a  46 0d         lsr $0d
$15:a89c  6c 38 08      jmp ($0838)
$15:a89f  21 a2         and ($a2,x)
$15:a8a1  4e 01 40      lsr $4001
$15:a8a4  a0 1c 02      ldy #$021c
$15:a8a7  11 28         ora ($28),y
$15:a8a9  90 48         bcc $a8f3
$15:a8ab  0e c1 04      asl $04c1
$15:a8ae  21 89         and ($89,x)
$15:a8b0  48            pha
$15:a8b1  49 a3 10      eor #$10a3
$15:a8b4  2a            rol a
$15:a8b5  01 08         ora ($08,x)
$15:a8b7  cb            wai
$15:a8b8  00 84         brk #$84
$15:a8ba  13 68         ora ($68,s),y
$15:a8bc  c4 2a         cpy $2a
$15:a8be  05 11         ora $11
$15:a8c0  90 40         bcc $a902
$15:a8c2  a0 46 b4      ldy #$b446
$15:a8c5  35 91         and $91,x
$15:a8c7  94 0f         sty $0f,x
$15:a8c9  82 64 12      brl $bb30
$15:a8cc  7d 40 60      adc $6040,x
$15:a8cf  25 da         and $da
$15:a8d1  4e 09 b0      lsr $b009
$15:a8d4  74 55         stz $55,x
$15:a8d6  dd 7d 5f      cmp $5f7d,x
$15:a8d9  73 49         adc ($49,s),y
$15:a8db  c9 54 f1      cmp #$f154
$15:a8de  75 ad         adc $ad,x
$15:a8e0  2d 3b 6d      and $6d3b
$15:a8e3  41 d0         eor ($d0,x)
$15:a8e5  56 24         lsr $24,x
$15:a8e7  52 29         eor ($29)
$15:a8e9  44 a2 6d      mvp $6d,$a2
$15:a8ec  30 96         bmi $a884
$15:a8ee  49 24 b2      eor #$b224
$15:a8f1  59 8c c6      eor $c68c,y
$15:a8f4  7d 3e 93      adc $933e,x
$15:a8f7  c9 e8 bf      cmp #$bfe8
$15:a8fa  ad 2f 6a      lda $6a2f
$15:a8fd  c3 52         cmp $52,s
$15:a8ff  ce ee bd      dec $bdee
$15:a902  bd ac 2f      lda $2fac,x
$15:a905  2b            pld
$15:a906  03 22         ora $22,s
$15:a908  a0 da 8d      ldy #$8dda
$15:a90b  e5 ac         sbc $ac
$15:a90d  92 1e         sta ($1e)
$15:a90f  06 41         asl $41
$15:a911  30 98         bmi $a8ab
$15:a913  77 3b         adc [$3b],y
$15:a915  99 4c a1      sta $a14c,y
$15:a918  12 df         ora ($df)
$15:a91a  7e 45 a8      ror $a845,x
$15:a91d  1c 0e 19      trb $190e
$15:a920  0f 88 47 01   ora $014788
$15:a924  1e 16 38      asl $3816,x
$15:a927  fc 7f c1      jsr ($c17f,x)
$15:a92a  ff 80 7c 04   sbc $047c80,x
$15:a92e  5e 2a 5c      lsr $5c2a,x
$15:a931  26 13         rol $13
$15:a933  f1 f8         sbc ($f8),y
$15:a935  87 ff         sta [$ff]
$15:a937  e0 37 f8      cpx #$f837
$15:a93a  04 3c         tsb $3c
$15:a93c  64 08         stz $08
$15:a93e  12 bc         ora ($bc)
$15:a940  40            rti
$15:a941  20 e4 2d      jsr $2de4
$15:a944  48            pha
$15:a945  84 42         sty $42
$15:a947  21 c4         and ($c4,x)
$15:a949  e2 58         sep #$58
$15:a94b  bc 53 1f      ldy $1f53,x
$15:a94e  88            dey
$15:a94f  a9 30 10      lda #$1030
$15:a952  0f 04 02 71   ora $710204
$15:a956  00 0f         brk #$0f
$15:a958  04 38         tsb $38
$15:a95a  85 e9         sta $e9
$15:a95c  ef 57 fb 03   sbc $03fb57
$15:a960  c5 4b         cmp $4b
$15:a962  01 80         ora ($80,x)
$15:a964  c1 a0         cmp ($a0,x)
$15:a966  f0 84         beq $a8ec
$15:a968  6f b5 52 1f   adc $1f52b5
$15:a96c  0f b8 5f f0   ora $f05fb8
$15:a970  03 a0         ora $a0,s
$15:a972  42 83         wdm #$83
$15:a974  f7 c5         sbc [$c5],y
$15:a976  e5 fe         sbc $fe
$15:a978  ff 41 bf d0   sbc $d0bf41,x
$15:a97c  11 c0         ora ($c0),y
$15:a97e  47 cc         eor [$cc]
$15:a980  82 5e 37      brl $e0e1
$15:a983  88            dey
$15:a984  80 b6         bra $a93c
$15:a986  41 20         eor ($20,x)
$15:a988  c4 62         cpy $62
$15:a98a  3a            dec a
$15:a98b  5c 2b 6f 86   jml $866f2b
$15:a98f  ec fa 07      cpx $07fa
$15:a992  71 f0         adc ($f0),y
$15:a994  20 17 08      jsr $0817
$15:a997  04 f2         tsb $f2
$15:a999  01 1e         ora ($1e,x)
$15:a99b  80 43         bra $a9e0
$15:a99d  c0 5b         cpy #$5b
$15:a99f  80 7e         bra $aa1f
$15:a9a1  79 bb cf      adc $cfbb,y
$15:a9a4  fe d5 68      inc $68d5,x
$15:a9a7  c4 7a         cpy $7a
$15:a9a9  41 38         eor ($38,x)
$15:a9ab  a0 58         ldy #$58
$15:a9ad  10 9e         bpl $a94d
$15:a9af  ef 18 fc 7f   sbc $7ffc18
$15:a9b3  c0 18         cpy #$18
$15:a9b5  0f 02 8b dd   ora $dd8b02
$15:a9b9  c7 a0         cmp [$a0]
$15:a9bb  af ef df 01   lda $01dfef
$15:a9bf  7f c2 d0 31   adc $31d0c2,x
$15:a9c3  15 ad         ora $ad,x
$15:a9c5  2d 01 a6      and $a601
$15:a9c8  01 80         ora ($80,x)
$15:a9ca  1a            inc a
$15:a9cb  82 44 a7      brl $5112
$15:a9ce  53 a9         eor ($a9,s),y
$15:a9d0  2c 96 7f      bit $7f96
$15:a9d3  3f 45 d4 0a   and $0ad445,x
$15:a9d7  07 04         ora [$04]
$15:a9d9  83 3e         sta $3e,s
$15:a9db  42 11         wdm #$11
$15:a9dd  0c 5f 74      tsb $745f
$15:a9e0  82 60 9d      brl $4743
$15:a9e3  0c 01 14      tsb $1401
$15:a9e6  30 0b         bmi $a9f3
$15:a9e8  ef 13 f8 e3   sbc $e3f813
$15:a9ec  c9 3e 5a      cmp #$5a3e
$15:a9ef  f4 88 c6      pea $c688
$15:a9f2  3f 10 eb f4   and $f4eb10,x
$15:a9f6  0e 3f 00      asl $003f
$15:a9f9  83 a5         sta $a5,s
$15:a9fb  01 18         ora ($18,x)
$15:a9fd  87 67         sta [$67]
$15:a9ff  76 2e         ror $2e,x
$15:aa01  03 01         ora $01,s
$15:aa03  40            rti
$15:aa04  a0 37         ldy #$37
$15:aa06  c1 1e         cmp ($1e,x)
$15:aa08  15 0e         ora $0e,x
$15:aa0a  84 81         sty $81
$15:aa0c  70 16         bvs $aa24
$15:aa0e  08            php
$15:aa0f  84 c1         sty $c1
$15:aa11  1a            inc a
$15:aa12  30 00         bmi $aa14
$15:aa14  a0 58         ldy #$58
$15:aa16  1b            tcs
$15:aa17  c1 00         cmp ($00,x)
$15:aa19  88            dey
$15:aa1a  2a            rol a
$15:aa1b  05 d7         ora $d7
$15:aa1d  8f 72 2f 74   sta $742f72
$15:aa21  42 30         wdm #$30
$15:aa23  0f f7 0f bc   ora $bc0ff7
$15:aa27  bc c5 47      ldy $47c5,x
$15:aa2a  80 40         bra $aa6c
$15:aa2c  e0 7b         cpx #$7b
$15:aa2e  66 7f         ror $7f
$15:aa30  09 df e2      ora #$e2df
$15:aa33  33 f8         and ($f8,s),y
$15:aa35  8e 7f 0e      stx $0e7f
$15:aa38  23 3f         and $3f,s
$15:aa3a  80 43         bra $aa7f
$15:aa3c  e0 10         cpx #$10
$15:aa3e  31 e0         and ($e0),y
$15:aa40  1d 80 ec      ora $ec80,x
$15:aa43  10 34         bpl $aa79
$15:aa45  03 a4         ora $a4,s
$15:aa47  43 41         eor $41,s
$15:aa49  20 6b 07      jsr $076b
$15:aa4c  42 20         wdm #$20
$15:aa4e  a5 0d         lda $0d
$15:aa50  06 03         asl $03
$15:aa52  91 c8         sta ($c8),y
$15:aa54  b0 78         bcs $aace
$15:aa56  14 24         trb $24
$15:aa58  9a            txs
$15:aa59  04 d0         tsb $d0
$15:aa5b  7c 20 17      jmp ($1720,x)
$15:aa5e  08            php
$15:aa5f  02 78         cop #$78
$15:aa61  23 0b         and $0b,s
$15:aa63  49 5e 84      eor #$845e
$15:aa66  22 1d 08 86   jsl $86081d
$15:aa6a  07 bb         ora [$bb]
$15:aa6c  00 d6         brk #$d6
$15:aa6e  f5 07         sbc $07,x
$15:aa70  ac 7c 09      ldy $097c
$15:aa73  79 af ef      adc $efaf,y
$15:aa76  ea            nop
$15:aa77  03 fe         ora $fe,s
$15:aa79  fe c0 a8      inc $a8c0,x
$15:aa7c  bc a9 ac      ldy $aca9,x
$15:aa7f  09 a6 1f      ora #$1fa6
$15:aa82  f8            sed
$15:aa83  05 92         ora $92
$15:aa85  c9 04 82      cmp #$8204
$15:aa88  03 0a         ora $0a,s
$15:aa8a  61 30         adc ($30,x)
$15:aa8c  fe 7f 01      inc $017f,x
$15:aa8f  84 7d         sty $7d
$15:aa91  03 e8         ora $e8,s
$15:aa93  44 23 0f      mvp $0f,$23
$15:aa96  32 90         and ($90)
$15:aa98  4c 1f 24      jmp $241f
$15:aa9b  be f0 7f      ldx $7ff0,y
$15:aa9e  88            dey
$15:aa9f  3c dc b0      bit $b0dc,x
$15:aaa2  48            pha
$15:aaa3  39 e4 84      and $84e4,y
$15:aaa6  9c f9 0a      stz $0af9
$15:aaa9  05 81         ora $81
$15:aaab  1f e6 3f 3a   ora $3a3fe6,x
$15:aaaf  7b            tdc
$15:aab0  19 e1 13      ora $13e1,y
$15:aab3  88            dey
$15:aab4  44 61 22      mvp $22,$61
$15:aab7  10 48         bpl $ab01
$15:aab9  e4 12         cpx $12
$15:aabb  18            clc
$15:aabc  97 43         sta [$43],y
$15:aabe  f7 0e         sbc [$0e],y
$15:aac0  c5 e0         cmp $e0
$15:aac2  2f 16 7b 81   and $817b16
$15:aac6  fb            xce
$15:aac7  d9 fe e0      cmp $e0fe,y
$15:aaca  f8            sed
$15:aacb  07 f3         ora [$f3]
$15:aacd  f9 03 ff      sbc $ff03,y
$15:aad0  c0 20         cpy #$20
$15:aad2  6e 2f 20      ror $202f
$15:aad5  cf 03 81 30   cmp $308103
$15:aad9  f8            sed
$15:aada  43 27         eor $27,s
$15:aadc  90 28         bcc $ab06
$15:aade  74 05         stz $05,x
$15:aae0  f1 e2         sbc ($e2),y
$15:aae2  ef 40 68 5c   sbc $5c6840
$15:aae6  22 97 40 c8   jsl $c84097
$15:aaea  43 12         eor $12,s
$15:aaec  c0 96         cpy #$96
$15:aaee  58            cli
$15:aaef  42 38         wdm #$38
$15:aaf1  10 58         bpl $ab4b
$15:aaf3  b6 08         ldx $08,y
$15:aaf5  e2 dc         sep #$dc
$15:aaf7  a4 13         ldy $13
$15:aaf9  83 b8         sta $b8,s
$15:aafb  cc 0f 60      cpy $600f
$15:aafe  3e f4 7f      rol $7ff4,x
$15:ab01  90 34         bcc $ab37
$15:ab03  3c 10 15      bit $1510,x
$15:ab06  89 ad fc      bit #$fcad
$15:ab09  d2 98         cmp ($98)
$15:ab0b  0c 00 54      tsb $5400
$15:ab0e  28            plp
$15:ab0f  1c 0b 07      trb $070b
$15:ab12  81 aa         sta ($aa,x)
$15:ab14  01 70         ora ($70,x)
$15:ab16  6c 8d c1      jmp ($c18d)
$15:ab19  7d e6 a3      adc $a3e6,x
$15:ab1c  b8            clv
$15:ab1d  dc 70 f8      jml [$f870]
$15:ab20  0e 7f 02      asl $027f
$15:ab23  4f 60 91 c8   eor $c89160
$15:ab27  0d 29 0e      ora $0e29
$15:ab2a  80 5f         bra $ab8b
$15:ab2c  e0 13         cpx #$13
$15:ab2e  f8            sed
$15:ab2f  04 7c         tsb $7c
$15:ab31  14 26         trb $26
$15:ab33  56 90         lsr $90,x
$15:ab35  48            pha
$15:ab36  3d 10 8f      and $8f10,x
$15:ab39  c4 03         cpy $03
$15:ab3b  f8            sed
$15:ab3c  65 7e         adc $7e
$15:ab3e  04 03         tsb $03
$15:ab40  e0 1c         cpx #$1c
$15:ab42  1f f1 b8 21   ora $21b8f1,x
$15:ab46  c6 f0         dec $f0
$15:ab48  8c 1c 80      sty $801c
$15:ab4b  68            pla
$15:ab4c  51 89         eor ($89),y
$15:ab4e  84 e0         sty $e0
$15:ab50  76 0e         ror $0e,x
$15:ab52  4f 27 fa 87   eor $87fa27
$15:ab56  22 33 08 44   jsl $440833
$15:ab5a  62 19 1c      per $c776
$15:ab5d  83 43         sta $43,s
$15:ab5f  a0 70         ldy #$70
$15:ab61  f8            sed
$15:ab62  0c 1d 5e      tsb $5e1d
$15:ab65  30 08         bmi $ab6f
$15:ab67  7c 00 f4      jmp ($f400,x)
$15:ab6a  4b            phk
$15:ab6b  68            pla
$15:ab6c  16 87         asl $87,x
$15:ab6e  fc 0c 71      jsr ($710c,x)
$15:ab71  88            dey
$15:ab72  07 0f         ora [$0f]
$15:ab74  87 7c         sta [$7c]
$15:ab76  48            pha
$15:ab77  87 f1         sta [$f1]
$15:ab79  1e 4a 14      asl $144a,x
$15:ab7c  9e 32 51      stz $5132,x
$15:ab7f  92 7d         sta ($7d)
$15:ab81  fe 03 ec      inc $ec03,x
$15:ab84  22 73 08 5c   jsl $5c0873
$15:ab88  62 0b 0c      per $b796
$15:ab8b  77 a0         adc [$a0],y
$15:ab8d  24 8f         bit $8f
$15:ab8f  e8            inx
$15:ab90  ea            nop
$15:ab91  6c 04 03      jmp ($0304)
$15:ab94  c0 28         cpy #$28
$15:ab96  10 d8         bpl $ab70
$15:ab98  34 70         bit $70,x
$15:ab9a  3b            tsc
$15:ab9b  0f 6f 32 32   ora $32326f
$15:ab9f  14 10         trb $10
$15:aba1  b0 1b         bcs $abbe
$15:aba3  f5 f8         sbc $f8,x
$15:aba5  41 21         eor ($21,x)
$15:aba7  90 28         bcc $abd1
$15:aba9  34 0d         bit $0d,x
$15:abab  97 28         sta [$28],y
$15:abad  3a            dec a
$15:abae  5f 93 b4 26   eor $26b493,x
$15:abb2  10 08         bpl $abbc
$15:abb4  34 1b         bit $1b,x
$15:abb6  f0 ed         beq $aba5
$15:abb8  06 ea         asl $ea
$15:abba  a7 c1         lda [$c1]
$15:abbc  3e 0d d6      rol $d60d,x
$15:abbf  5f a2 e4 21   eor $21e4a2,x
$15:abc3  31 81         and ($81),y
$15:abc5  78            sei
$15:abc6  0c e1 93      tsb $93e1
$15:abc9  8d 50 a0      sta $a050
$15:abcc  50 34         bvc $ac02
$15:abce  12 0a         ora ($0a)
$15:abd0  84 41         sty $41
$15:abd2  2c 19 0c      bit $0c19
$15:abd5  c5 c0         cmp $c0
$15:abd7  c6 17         dec $17
$15:abd9  06 a9         asl $a9
$15:abdb  70 1b         bvs $abf8
$15:abdd  02 d9         cop #$d9
$15:abdf  0b            phd
$15:abe0  02 1a         cop #$1a
$15:abe2  56 9e         lsr $9e,x
$15:abe4  86 78         stx $78
$15:abe6  c5 e2         cmp $e2
$15:abe8  21 70         and ($70,x)
$15:abea  68            pla
$15:abeb  84 52         sty $52
$15:abed  69 18 9c      adc #$9c18
$15:abf0  42 1b         wdm #$1b
$15:abf2  06 9f         asl $9f
$15:abf4  08            php
$15:abf5  43 80         eor $80,s
$15:abf7  e0 8e         cpx #$8e
$15:abf9  65 00         adc $00
$15:abfb  20 86 c2      jsr $c286
$15:abfe  23 b0         and $b0,s
$15:ac00  88            dey
$15:ac01  f4 32 6f      pea $6f32
$15:ac04  d2 90         cmp ($90)
$15:ac06  e3 28         sbc $28,s
$15:ac08  bd ea 9f      lda $9fea,x
$15:ac0b  32 7f         and ($7f)
$15:ac0d  e1 84         sbc ($84,x)
$15:ac0f  41 9f         eor ($9f,x)
$15:ac11  e1 01         sbc ($01,x)
$15:ac13  80 c3         bra $abd8
$15:ac15  20 15 e8      jsr $e815
$15:ac18  64 fa         stz $fa
$15:ac1a  3d 2c 8f      and $8f2c,x
$15:ac1d  40            rti
$15:ac1e  21 be         and ($be,x)
$15:ac20  0a            asl a
$15:ac21  07 a2         ora [$a2]
$15:ac23  81 78         sta ($78,x)
$15:ac25  98            tya
$15:ac26  77 69         adc [$69],y
$15:ac28  78            sei
$15:ac29  59 86 4a      eor $4a86,y
$15:ac2c  fd ca 9b      sbc $9bca,x
$15:ac2f  7e 70 f4      ror $f470,x
$15:ac32  09 80 7c      ora #$7c80
$15:ac35  30 18         bmi $ac4f
$15:ac37  09 84 02      ora #$0284
$15:ac3a  f7 30         sbc [$30],y
$15:ac3c  bc de 26      ldy $26de,x
$15:ac3f  37 88         and [$88],y
$15:ac41  06 c2         asl $c2
$15:ac43  05 12         ora $12
$15:ac45  83 43         sta $43,s
$15:ac47  61 70         adc ($70,x)
$15:ac49  78            sei
$15:ac4a  24 32         bit $32
$15:ac4c  29 0c aa      and #$aa0c
$15:ac4f  73 37         adc ($37,s),y
$15:ac51  d8            cld
$15:ac52  ba            tsx
$15:ac53  bf 00 0a 10   lda $100a00,x
$15:ac57  08            php
$15:ac58  0c 02 0f      tsb $0f02
$15:ac5b  03 87         ora $87,s
$15:ac5d  91 42         sta ($42),y
$15:ac5f  47 0f         eor [$0f]
$15:ac61  b5 41         lda $41,x
$15:ac63  64 10         stz $10
$15:ac65  a9 45 a2      lda #$a245
$15:ac68  a1 b0         lda ($b0,x)
$15:ac6a  e8            inx
$15:ac6b  78            sei
$15:ac6c  3c 13 0b      bit $0b13,x
$15:ac6f  84 c2         sty $c2
$15:ac71  f5 36         sbc $36,x
$15:ac73  be f5 37      ldx $37f5,y
$15:ac76  50 68         bvc $ace0
$15:ac78  81 00         sta ($00,x)
$15:ac7a  30 10         bmi $ac8c
$15:ac7c  0f 07 03 e0   ora $e00307
$15:ac80  65 0e         adc $0e
$15:ac82  0f c2 a7 a0   ora $a0a7c2
$15:ac86  80 d4         bra $ac5c
$15:ac88  23 53         and $53,s
$15:ac8a  29 0c 7a      and #$7a0c
$15:ac8d  37 01         and [$01],y
$15:ac8f  96 44         stx $44,y
$15:ac91  0d e1 24      ora $24e1
$15:ac94  8b            phb
$15:ac95  4c 61 d3      jmp $d361
$15:ac98  89 24 f2      bit #$f224
$15:ac9b  61 10         adc ($10,x)
$15:ac9d  90 43         bcc $ace2
$15:ac9f  22 31 f9 8c   jsl $8cf931
$15:aca3  f6 63         inc $63,x
$15:aca5  19 98 c0      ora $c098,y
$15:aca8  62 70 38      per $e51b
$15:acab  3c 67 99      bit $9967,x
$15:acae  62 f0 71      per $1ea1
$15:acb1  fe 31 d9      inc $d931,x
$15:acb4  84 2a         sty $2a
$15:acb6  21 35         and ($35,x)
$15:acb8  90 ee         bcc $aca8
$15:acba  e2 5e         sep #$5e
$15:acbc  fe ec c2      inc $c2ec,x
$15:acbf  05 18         ora $18
$15:acc1  83 c0         sta $c0,s
$15:acc3  79 9d 0f      adc $0f9d,y
$15:acc6  57 c3         eor [$c3],y
$15:acc8  cf c1 f7 74   cmp $74f7c1
$15:accc  b9 91 ce      lda $ce91,y
$15:accf  03 cc         ora $cc,s
$15:acd1  22 f1 20 20   jsl $2020f1
$15:acd5  59 7f d3      eor $d37f,y
$15:acd8  3c 65 7b      bit $7b65,x
$15:acdb  83 5f         sta $5f,s
$15:acdd  e0 4c         cpx #$4c
$15:acdf  ff e4 00 02   sbc $0200e4,x
$15:ace3  83 cc         sta $cc,s
$15:ace5  23 d1         and $d1,s
$15:ace7  eb            xba
$15:ace8  64 79         stz $79
$15:acea  dc 12 02      jml [$0212]
$15:aced  00 4f         brk #$4f
$15:acef  c2 61         rep #$61
$15:acf1  d8            cld
$15:acf2  a4 09         ldy $09
$15:acf4  03 27         ora $27,s
$15:acf6  7f e4 cd 2f   adc $2fcde4,x
$15:acfa  58            cli
$15:acfb  6f d4 1b 93   adc $931bd4
$15:acff  fb            xce
$15:ad00  20 00 94      jsr $9400
$15:ad03  02 61         cop #$61
$15:ad05  78            sei
$15:ad06  bc 4c ef      ldy $ef4c,x
$15:ad09  10 1d         bpl $ad28
$15:ad0b  81 08         sta ($08,x)
$15:ad0d  20 9f c9      jsr $c99f
$15:ad10  bc b4 7e      ldy $7eb4,x
$15:ad13  33 f8         and ($f8,s),y
$15:ad15  3c e2 19      bit $19e2,x
$15:ad18  34 1c         bit $1c,x
$15:ad1a  a4 02         ldy $02
$15:ad1c  43 33         eor $33,s
$15:ad1e  99 b3 42      sta $42b3,y
$15:ad21  01 38         ora ($38,x)
$15:ad23  81 cd         sta ($cd,x)
$15:ad25  c9 29 dc      cmp #$dc29
$15:ad28  da            phx
$15:ad29  09 42 01      ora #$0142
$15:ad2c  fc f0 47      jsr ($47f0,x)
$15:ad2f  3e 12 cb      rol $cb12,x
$15:ad32  51 68         eor ($68),y
$15:ad34  e0 18         cpx #$18
$15:ad36  4e 67 30      lsr $3067
$15:ad39  26 10         rol $10
$15:ad3b  05 68         ora $68
$15:ad3d  7b            tdc
$15:ad3e  0d 29 0d      ora $0d29
$15:ad41  80 45         bra $ad88
$15:ad43  a1 10         lda ($10,x)
$15:ad45  d8            cld
$15:ad46  cc 4a 17      cpy $174a
$15:ad49  09 83 42      ora #$4283
$15:ad4c  62 d6 39      per $e725
$15:ad4f  c7 9e         cmp [$9e]
$15:ad51  71 06         adc ($06),y
$15:ad53  84 43         sty $43
$15:ad55  e3 11         sbc $11,s
$15:ad57  e8            inx
$15:ad58  c4 32         cpy $32
$15:ad5a  31 00         and ($00),y
$15:ad5c  84 0c         sty $0c
$15:ad5e  02 8d         cop #$8d
$15:ad60  7e e3 7f      ror $7fe3,x
$15:ad63  91 e5         sta ($e5),y
$15:ad65  07 f8         ora [$f8]
$15:ad67  e7 76         sbc [$76]
$15:ad69  18            clc
$15:ad6a  ac 86 d7      ldy $d786
$15:ad6d  43 db         eor $db,s
$15:ad6f  f9 4b d3      sbc $d34b,y
$15:ad72  cb            wai
$15:ad73  50 f5         bvc $ad6a
$15:ad75  5c 3c f4 1f   jml $1ff43c
$15:ad79  74 4b         stz $4b,x
$15:ad7b  d8            cld
$15:ad7c  ad 00 90      lda $9000
$15:ad7f  1b            tcs
$15:ad80  e2 51         sep #$51
$15:ad82  28            plp
$15:ad83  98            tya
$15:ad84  32 c4         and ($c4)
$15:ad86  e3 31         sbc $31,s
$15:ad88  09 01 10      ora #$1001
$15:ad8b  21 91         and ($91,x)
$15:ad8d  a2 18         ldx #$18
$15:ad8f  47 a2         eor [$a2]
$15:ad91  71 b9         adc ($b9),y
$15:ad93  2c de 81      bit $81de
$15:ad96  6c 80 54      jmp ($5480)
$15:ad99  0d e2 c1      ora $c1e2
$15:ad9c  15 08         ora $08,x
$15:ad9e  c6 e0         dec $e0
$15:ada0  13 78         ora ($78,s),y
$15:ada2  02 69         cop #$69
$15:ada4  0d eb 34      ora $34eb
$15:ada7  96 4b         stx $4b,y
$15:ada9  20 12 c9      jsr $c912
$15:adac  24 12         bit $12
$15:adae  48            pha
$15:adaf  6f 69 64 62   adc $626469
$15:adb3  31 24         and ($24),y
$15:adb5  23 01         and $01,s
$15:adb7  18            clc
$15:adb8  0d ec a0      ora $a0ec
$15:adbb  01 89         ora ($89,x)
$15:adbd  44 21 e6      mvp $e6,$21
$15:adc0  f6 1f         inc $1f,x
$15:adc2  a4 22         ldy $22
$15:adc4  21 1c         and ($1c,x)
$15:adc6  f0 4f         beq $ae17
$15:adc8  3a            dec a
$15:adc9  9e a8 37      stz $37a8,x
$15:adcc  b6 07         ldx $07,y
$15:adce  07 80         ora [$80]
$15:add0  44 e0 11      mvp $11,$e0
$15:add3  f8            sed
$15:add4  03 78         ora $78,s
$15:add6  20 6f f0      jsr $f06f
$15:add9  83 c4         sta $c4,s
$15:addb  60            rts
$15:addc  f1 08         sbc ($08),y
$15:adde  19 18 1b      ora $1b18,y
$15:ade1  c9 f8 83      cmp #$83f8
$15:ade4  d7 21         cmp [$21],y
$15:ade6  73 f9         adc ($f9,s),y
$15:ade8  07 ff         ora [$ff]
$15:adea  81 f0         sta ($f0,x)
$15:adec  80 7a         bra $ae68
$15:adee  01 c1         ora ($c1,x)
$15:adf0  00 0b         brk #$0b
$15:adf2  87 03         sta [$03]
$15:adf4  81 e0         sta ($e0,x)
$15:adf6  f0 72         beq $ae6a
$15:adf8  3c 10 8e      bit $8e10,x
$15:adfb  01 18         ora ($18,x)
$15:adfd  02 e0         cop #$e0
$15:adff  6f 2a df 2a   adc $2adf2a
$15:ae03  6f e9 8e 79   adc $798ee9
$15:ae07  27 fd         and [$fd]
$15:ae09  3f 7c 23 e6   and $e6237c,x
$15:ae0d  fa            plx
$15:ae0e  39 54 12      and $1254,y
$15:ae11  13 00         ora ($00,s),y
$15:ae13  82 3f c2      brl $7055
$15:ae16  01 10         ora ($10,x)
$15:ae18  04 2f         tsb $2f
$15:ae1a  6a            ror a
$15:ae1b  ad e9 cb      lda $cbe9
$15:ae1e  ce 24 ff      dec $ff24
$15:ae21  ce 5f de      dec $de5f
$15:ae24  01 ef         ora ($ef,x)
$15:ae26  0d 1d 46      ora $461d
$15:ae29  41 90         eor ($90,x)
$15:ae2b  80 48         bra $ae75
$15:ae2d  03 e0         ora $e0,s
$15:ae2f  cc 11 4a      cpy $4a11
$15:ae32  5d 61 b7      eor $b761,x
$15:ae35  48            pha
$15:ae36  7d e2 0f      adc $0fe2,x
$15:ae39  5e 80 db      lsr $db80,x
$15:ae3c  a0 b7         ldy #$b7
$15:ae3e  e8            inx
$15:ae3f  0c fc 14      tsb $14fc
$15:ae42  32 28         and ($28)
$15:ae44  7c 82 1d      jmp ($1d82,x)
$15:ae47  20 83 4c      jsr $4c83
$15:ae4a  19 8f 4f      ora $4f8f,y
$15:ae4d  e4 65         cpx $65
$15:ae4f  f0 98         beq $ade9
$15:ae51  bf c5 df 1b   lda $1bdfc5,x
$15:ae55  a3 ef         lda $ef,s
$15:ae57  54 fb 90      mvn $90,$fb
$15:ae5a  6f c0 6c 26   adc $266cc0
$15:ae5e  30 0b         bmi $ae6b
$15:ae60  cc 02 0b      cpy $0b02
$15:ae63  00 81         brk #$81
$15:ae65  02 86         cop #$86
$15:ae67  40            rti
$15:ae68  ce 43 28      dec $2843
$15:ae6b  05 42         ora $42
$15:ae6d  7f ff 9f d0   adc $d09fff,x
$15:ae71  20 15 d9      jsr $d915
$15:ae74  32 e4         and ($e4)
$15:ae76  2e d0 99      rol $99d0
$15:ae79  f9 ec 18      sbc $18ec,y
$15:ae7c  06 bf         asl $bf
$15:ae7e  08            php
$15:ae7f  cb            wai
$15:ae80  20 62 11      jsr $1162
$15:ae83  99 61 14      sta $1461,y
$15:ae86  3f f0 3f e7   and $e73ff0,x
$15:ae8a  ff f8 a5 0e   sbc $0ea5f8,x
$15:ae8e  f5 91         sbc $91,x
$15:ae90  b2 1e         lda ($1e)
$15:ae92  e8            inx
$15:ae93  87 f3         sta [$f3]
$15:ae95  f9 00 70      sbc $7000,y
$15:ae98  1b            tcs
$15:ae99  7c 33 0e      jmp ($0e33,x)
$15:ae9c  81 c4         sta ($c4,x)
$15:ae9e  66 05         ror $05
$15:aea0  fe 40 f2      inc $f240,x
$15:aea3  8f 98 af c3   sta $c3af98
$15:aea7  38            sec
$15:aea8  b0 4e         bcs $aef8
$15:aeaa  7c 13 9f      jmp ($9f13,x)
$15:aead  44 e6 e1      mvp $e1,$e6
$15:aeb0  33 e3         and ($e3,s),y
$15:aeb2  41 78         eor ($78,x)
$15:aeb4  f0 83         beq $ae39
$15:aeb6  e8            inx
$15:aeb7  41 a7         eor ($a7,x)
$15:aeb9  d4 6b         pei ($6b)
$15:aebb  f7 1b         sbc [$1b],y
$15:aebd  fc 3f 0a      jsr ($0a3f,x)
$15:aec0  65 fb         adc $fb
$15:aec2  f1 fc         sbc ($fc),y
$15:aec4  98            tya
$15:aec5  4e 11 be      lsr $be11
$15:aec8  9e f9 84      stz $84f9,x
$15:aecb  c2 4d         rep #$4d
$15:aecd  36 8a         rol $8a,x
$15:aecf  45 a2         eor $a2
$15:aed1  11 48         ora ($48),y
$15:aed3  00 f0         brk #$f0
$15:aed5  62 91 48      per $f769
$15:aed8  c0 1c         cpy #$1c
$15:aeda  26 10         rol $10
$15:aedc  09 b4 02      ora #$02b4
$15:aedf  2c 7a 03      bit $037a
$15:aee2  b9 c2 22      lda $22c2,y
$15:aee5  10 c4         bpl $aeab
$15:aee7  70 59         bvs $af42
$15:aee9  2d 92 8b      and $8b92
$15:aeec  44 22 50      mvp $50,$22
$15:aeef  06 18         asl $18
$15:aef1  04 a2         tsb $a2
$15:aef3  51 30         eor ($30),y
$15:aef5  34 84         bit $84,x
$15:aef7  32 01         and ($01)
$15:aef9  6c 80 5a      jmp ($5a80)
$15:aefc  13 40         ora ($40,s),y
$15:aefe  97 38         sta [$38],y
$15:af00  84 80         sty $80
$15:af02  4e 0a fb      lsr $fb0a
$15:af05  80 ab         bra $aeb2
$15:af07  f0 ce         beq $aed7
$15:af09  06 52         asl $52
$15:af0b  3b            tsc
$15:af0c  8a            txa
$15:af0d  2c 25 92      bit $9225
$15:af10  48            pha
$15:af11  83 64         sta $64,s
$15:af13  21 07         and ($07,x)
$15:af15  d1 36         cmp ($36),y
$15:af17  08            php
$15:af18  9c 27 8d      stz $8d27
$15:af1b  c0 3b         cpy #$3b
$15:af1d  91 dc         sta ($dc),y
$15:af1f  63 71         adc $71,s
$15:af21  07 78         ora [$78]
$15:af23  47 a1         eor [$a1]
$15:af25  93 7e         sta ($7e,s),y
$15:af27  97 87         sta [$87],y
$15:af29  99 a5 cf      sta $cfa5,y
$15:af2c  74 f9         stz $f9,x
$15:af2e  95 fe         sta $fe,x
$15:af30  0a            asl a
$15:af31  34 11         bit $11,x
$15:af33  a1 01         lda ($01,x)
$15:af35  80 a8         bra $aedf
$15:af37  01 e6         ora ($e6,x)
$15:af39  17 e8         ora [$e8],y
$15:af3b  f4 b2 3d      pea $3db2
$15:af3e  20 86 fc      jsr $fc86
$15:af41  24 00         bit $00
$15:af43  f0 bc         beq $af01
$15:af45  4c 3b 94      jmp $943b
$15:af48  bc 34 cb      ldy $cb34,x
$15:af4b  2b            pld
$15:af4c  7c e7 4d      jmp ($4de7,x)
$15:af4f  bf 58 65 68   lda $686558,x
$15:af53  2b            pld
$15:af54  43 01         eor $01,s
$15:af56  80 40         bra $af98
$15:af58  05 e6         ora $e6
$15:af5a  61 7b         adc ($7b,x)
$15:af5c  bc 4c 6f      ldy $6f4c,x
$15:af5f  10 1d         bpl $af7e
$15:af61  84 0a         sty $0a
$15:af63  25 06         and $06
$15:af65  86 c2         stx $c2
$15:af67  e0 f0         cpx #$f0
$15:af69  48            pha
$15:af6a  64 52         stz $52
$15:af6c  19 34 fe      ora $fe34,y
$15:af6f  57 3e         eor [$3e],y
$15:af71  de 7e c2      dec $c27e,x
$15:af74  80 17         bra $af8d
$15:af76  83 07         sta $07,s
$15:af78  81 c3         sta ($c3,x)
$15:af7a  c8            iny
$15:af7b  a3 3f         lda $3f,s
$15:af7d  82 ce e4      brl $944e
$15:af80  15 c4         ora $c4,x
$15:af82  98            tya
$15:af83  54 36 1d      mvn $1d,$36
$15:af86  0f 07 82 61   ora $618207
$15:af8a  70 98         bvs $af24
$15:af8c  5f 67 f3 ab   eor $abf367,x
$15:af90  77 1e         adc [$1e],y
$15:af92  3c 98 1c      bit $1c98,x
$15:af95  04 03         tsb $03
$15:af97  c1 c0         cmp ($c0,x)
$15:af99  f8            sed
$15:af9a  19 47 f9      ora $f947,y
$15:af9d  a1 ee         lda ($ee,x)
$15:af9f  40            rti
$15:afa0  67 51         adc [$51]
$15:afa2  a9 94 86      lda #$8694
$15:afa5  3d 1b 80      and $801b,x
$15:afa8  cb            wai
$15:afa9  22 06 f0 92   jsl $92f006
$15:afad  45 a6         eor $a6
$15:afaf  30 e9         bmi $af9a
$15:afb1  c4 92         cpy $92
$15:afb3  79 30 56      adc $5630,y
$15:afb6  04 32         tsb $32
$15:afb8  23 1f         and $1f,s
$15:afba  98            tya
$15:afbb  cf 66 31 99   cmp $993166
$15:afbf  8c 06 27      sty $2706
$15:afc2  03 83         ora $83,s
$15:afc4  ce b3 10      dec $10b3
$15:afc7  5c 0f 6f e5   jml $e56f0f
$15:afcb  07 9a         ora [$9a]
$15:afcd  47 60         eor [$60]
$15:afcf  13 a9         ora ($a9,s),y
$15:afd1  06 d6         asl $d6
$15:afd3  03 eb         ora $eb,s
$15:afd5  ed 58 20      sbc $2058
$15:afd8  f7 18         sbc [$18],y
$15:afda  74 4b         stz $4b,x
$15:afdc  99 d4 f4      sta $f4d4,y
$15:afdf  78            sei
$15:afe0  3c 5c 0f      bit $0f5c,x
$15:afe3  3f 07 9d 1a   and $1a9d07,x
$15:afe7  e2 3c         sep #$3c
$15:afe9  c2 2f         rep #$2f
$15:afeb  12 02         ora ($02)
$15:afed  04 97         tsb $97
$15:afef  fc fb 0d      jsr ($0dfb,x)
$15:aff2  f6 07         inc $07,x
$15:aff4  bf c0 99 ff   lda $ff99c0,x
$15:aff8  dc 20 05      jml [$0520]
$15:affb  28            plp
$15:affc  f0 28         beq $b026
$15:affe  6c 10 d9      jmp ($d910)
$15:b001  03 84         ora $84,s
$15:b003  27 e1         and [$e1]
$15:b005  30 ec         bmi $aff3
$15:b007  52 04         eor ($04)
$15:b009  81 91         sta ($91,x)
$15:b00b  bf 86 c2 fb   lda $fbc286,x
$15:b00f  84 ff         sty $ff
$15:b011  41 b9         eor ($b9,x)
$15:b013  3f b5 f8 09   and $09f8b5,x
$15:b017  40            rti
$15:b018  26 17         rol $17
$15:b01a  81 50         sta ($50,x)
$15:b01c  c0 f6         cpy #$f6
$15:b01e  04 20         tsb $20
$15:b020  82 7f 26      brl $d6a2
$15:b023  f2 d1         sbc ($d1)
$15:b025  f8            sed
$15:b026  cf e0 f3 81   cmp $81f3e0
$15:b02a  c0 0e         cpy #$0e
$15:b02c  52 01         eor ($01)
$15:b02e  21 99         and ($99,x)
$15:b030  cc d9 a1      cpy $a1d9
$15:b033  00 9c         brk #$9c
$15:b035  40            rti
$15:b036  e6 e4         inc $e4
$15:b038  94 ee         sty $ee,x
$15:b03a  6d 04 a1      adc $a104
$15:b03d  00 fe         brk #$fe
$15:b03f  78            sei
$15:b040  23 9f         and $9f,s
$15:b042  09 61 65      ora #$6561
$15:b045  20 18 4e      jsr $4e18
$15:b048  67 30         adc [$30]
$15:b04a  26 10         rol $10
$15:b04c  08            php
$15:b04d  e7 03         sbc [$03]
$15:b04f  d8            cld
$15:b050  69 48 6c      adc #$6c48
$15:b053  02 2d         cop #$2d
$15:b055  08            php
$15:b056  86 c6         stx $c6
$15:b058  62 50 b8      per $68ab
$15:b05b  4c 1a 13      jmp $131a
$15:b05e  16 b1         asl $b1,x
$15:b060  ce 3c f3      dec $f33c
$15:b063  88            dey
$15:b064  34 22         bit $22,x
$15:b066  1f 18 8f 46   ora $468f18,x
$15:b06a  21 91         and ($91,x)
$15:b06c  88            dey
$15:b06d  04 20         tsb $20
$15:b06f  60            rts
$15:b070  14 6b         trb $6b
$15:b072  f7 1b         sbc [$1b],y
$15:b074  fc 8f 28      jsr ($288f,x)
$15:b077  df cb 0f b4   cmp $b40fcb,x
$15:b07b  ce e0 37      dec $37e0
$15:b07e  5a            phy
$15:b07f  0e af 86      asl $86af
$15:b082  56 9e         lsr $9e,x
$15:b084  5a            phy
$15:b085  a7 a2         lda [$a2]
$15:b087  c1 e2         cmp ($e2,x)
$15:b089  a0 79         ldy #$79
$15:b08b  e0 3e         cpx #$3e
$15:b08d  e5 68         sbc $68
$15:b08f  33 00         and ($00,s),y
$15:b091  de d0 f8      dec $f8d0,x
$15:b094  6c 5a 21      jmp ($215a)
$15:b097  0e 92 1b      asl $1b92
$15:b09a  e2 01         sep #$01
$15:b09c  0d 86 c7      ora $c786
$15:b09f  63 b3         adc $b3,s
$15:b0a1  d3 7b         cmp ($7b,s),y
$15:b0a3  78            sei
$15:b0a4  3c 15 68      bit $6815,x
$15:b0a7  f7 b6         sbc [$b6],y
$15:b0a9  83 4e         sta $4e,s
$15:b0ab  82 1b dd      brl $8dc9
$15:b0ae  2e 1f ef      rol $ef1f
$15:b0b1  b7 dd         lda [$dd],y
$15:b0b3  58            cli
$15:b0b4  10 38         bpl $b0ee
$15:b0b6  1c 16 09      trb $0916
$15:b0b9  03 84         ora $84,s
$15:b0bb  c0 61         cpy #$61
$15:b0bd  11 c8         ora ($c8),y
$15:b0bf  a4 9e         ldy $9e
$15:b0c1  57 1b         eor [$1b],y
$15:b0c3  a6 42         ldx $42
$15:b0c5  68            pla
$15:b0c6  10 05         bpl $b0cd
$15:b0c8  78            sei
$15:b0c9  41 e0         eor ($e0,x)
$15:b0cb  f0 f6         beq $b0c3
$15:b0cd  18            clc
$15:b0ce  40            rti
$15:b0cf  e2 f1         sep #$f1
$15:b0d1  09 dc         ora #$dc
$15:b0d3  e2 f9         sep #$f9
$15:b0d5  3e bf 1b      rol $1bbf,x
$15:b0d8  c9 7c         cmp #$7c
$15:b0da  1a            inc a
$15:b0db  0a            asl a
$15:b0dc  03 4c         ora $4c,s
$15:b0de  5a            phy
$15:b0df  a2 be         ldx #$be
$15:b0e1  04 99         tsb $99
$15:b0e3  a5 82         lda $82
$15:b0e5  80 e3         bra $b0ca
$15:b0e7  06 e9         asl $e9
$15:b0e9  2f 82 79 e0   and $e07982
$15:b0ed  9e 75 3d      stz $3d75,x
$15:b0f0  50 6f         bvc $b161
$15:b0f2  6b            rtl
$15:b0f3  04 20         tsb $20
$15:b0f5  11 38         ora ($38),y
$15:b0f7  04 7c         tsb $7c
$15:b0f9  f0 0b         beq $b106
$15:b0fb  f1 60         sbc ($60),y
$15:b0fd  84 46         sty $46
$15:b0ff  0f 10 81 91   ora $918110
$15:b103  81 fa         sta ($fa,x)
$15:b105  06 f2         asl $f2
$15:b107  fc c1 eb      jsr ($ebc1,x)
$15:b10a  90 b9         bcc $b0c5
$15:b10c  fc 83 ff      jsr ($ff83,x)
$15:b10f  c0 f8         cpy #$f8
$15:b111  40            rti
$15:b112  3d 10 0f      and $0f10,x
$15:b115  c4 00         cpy $00
$15:b117  2e 1c 0e      rol $0e1c
$15:b11a  02 5c         cop #$5c
$15:b11c  39 1e 08      and $081e,y
$15:b11f  47 00         eor [$00]
$15:b121  8c 01 70      sty $7001
$15:b124  37 97         and [$97],y
$15:b126  cf e5 6f f8   cmp $f86fe5
$15:b12a  cf 3c 93 fe   cmp $fe933c
$15:b12e  9f be 11 f3   sta $f311be,x
$15:b132  7d 1c 0a      adc $0a1c,x
$15:b135  f9 01 98      sbc $9801,y
$15:b138  2c 82 07      bit $0782
$15:b13b  00 88         brk #$88
$15:b13d  02 17         cop #$17
$15:b13f  9d 4e fb      sta $fb4e,x
$15:b142  63 a7         adc $a7,s
$15:b144  32 7f         and ($7f)
$15:b146  e7 2f         sbc [$2f]
$15:b148  ef 00 f7 86   sbc $86f700
$15:b14c  8e 83 3e      stx $3e83
$15:b14f  c0 c3         cpy #$c3
$15:b151  24 01         bit $01
$15:b153  f0 80         beq $b0d5
$15:b155  09 da         ora #$da
$15:b157  eb            xba
$15:b158  0d ba 43      ora $43ba
$15:b15b  ef 10 7a f4   sbc $f47a10
$15:b15f  06 dd         asl $dd
$15:b161  05 bf         ora $bf
$15:b163  40            rti
$15:b164  67 e6         adc [$e6]
$15:b166  c1 91         cmp ($91,x)
$15:b168  43 e4         eor $e4,s
$15:b16a  10 e9         bpl $b155
$15:b16c  04 1a         tsb $1a
$15:b16e  60            rts
$15:b16f  66 14         ror $14
$15:b171  fa            plx
$15:b172  42 f1         wdm #$f1
$15:b174  ba            tsx
$15:b175  7c 24 3e      jmp ($3e24,x)
$15:b178  f9 77 c6      sbc $c677,y
$15:b17b  c8            iny
$15:b17c  fb            xce
$15:b17d  d6 bf         dec $bf,x
$15:b17f  64 1b         stz $1b
$15:b181  f0 1b         beq $b19e
$15:b183  0b            phd
$15:b184  a4 02         ldy $02
$15:b186  f3 00         sbc ($00,s),y
$15:b188  c0 8f         cpy #$8f
$15:b18a  82 00 a6      brl $578d
$15:b18d  02 38         cop #$38
$15:b18f  2a            rol a
$15:b190  8c ca 01      sty $01ca
$15:b193  50 9f         bvc $b134
$15:b195  ff e7 ee 90   sbc $90eee7,x
$15:b199  ae c9 97      ldx $97c9
$15:b19c  21 76         and ($76,x)
$15:b19e  84 cf         sty $cf
$15:b1a0  cf 60 c0 35   cmp $35c060
$15:b1a4  f8            sed
$15:b1a5  46 59         lsr $59
$15:b1a7  03 10         ora $10,s
$15:b1a9  8c cb 08      sty $08cb
$15:b1ac  a1 ff         lda ($ff,x)
$15:b1ae  81 ff         sta ($ff,x)
$15:b1b0  3f ff c5 28   and $28c5ff,x
$15:b1b4  77 ac         adc [$ac],y
$15:b1b6  8d 90 f7      sta $f790
$15:b1b9  44 3f 9f      mvp $9f,$3f
$15:b1bc  c8            iny
$15:b1bd  03 80         ora $80,s
$15:b1bf  db            stp
$15:b1c0  e1 98         sbc ($98,x)
$15:b1c2  74 0e         stz $0e,x
$15:b1c4  23 30         and $30,s
$15:b1c6  2f f2 07 94   and $9407f2
$15:b1ca  7c c5 7e      jmp ($7ec5,x)
$15:b1cd  19 c5 82      ora $82c5,y
$15:b1d0  73 e0         adc ($e0,s),y
$15:b1d2  9c fa 27      stz $27fa
$15:b1d5  37 09         and [$09],y
$15:b1d7  9f 1a 0b c7   sta $c70b1a,x
$15:b1db  84 29         sty $29
$15:b1dd  82 0d 3e      brl $efed
$15:b1e0  a3 5f         lda $5f,s
$15:b1e2  b8            clv
$15:b1e3  df e1 f8 53   cmp $53f8e1,x
$15:b1e7  2f df 8f e4   and $e48fdf
$15:b1eb  c2 70         rep #$70
$15:b1ed  a6 04         ldx $04
$15:b1ef  7f a8 36 cb   adc $cb36a8,x
$15:b1f3  43 98         eor $98,s
$15:b1f5  e4 23         cpx $23
$15:b1f7  f8            sed
$15:b1f8  ea            nop
$15:b1f9  77 06         adc [$06],y
$15:b1fb  69 7a fc      adc #$fc7a
$15:b1fe  c0 7d d1      cpy #$d17d
$15:b201  fb            xce
$15:b202  8c 3a 39      sty $393a
$15:b205  5f a7 77 ac   eor $ac77a7,x
$15:b209  1e e9 87      asl $87e9,x
$15:b20c  c6 03         dec $03
$15:b20e  7b            tdc
$15:b20f  83 41         sta $41,s
$15:b211  df 43 0e 8a   cmp $8a0e43,x
$15:b215  46 3e         lsr $3e
$15:b217  3e 18 ff      rol $ff18,x
$15:b21a  bb            tyx
$15:b21b  5d 10 a2      eor $a210,x
$15:b21e  ea            nop
$15:b21f  ea            nop
$15:b220  7b            tdc
$15:b221  03 d8         ora $d8,s
$15:b223  7c 61 de      jmp ($de61,x)
$15:b226  7f fc 38 32   adc $3238fc,x
$15:b22a  1e e8 0c      asl $0ce8,x
$15:b22d  46 21         lsr $21
$15:b22f  bb            tyx
$15:b230  86 6f         stx $6f
$15:b232  11 65         ora ($65),y
$15:b234  23 b1         and $b1,s
$15:b236  4f 23 d1 c9   eor $c9d123
$15:b23a  05 02         ora $02
$15:b23c  f9 20 cd      sbc $cd20,y
$15:b23f  44 30 54      mvp $54,$30
$15:b242  4e 34 e2      lsr $e234
$15:b245  f9 1c bf      sbc $bf1c,y
$15:b248  40            rti
$15:b249  23 d0         and $d0,s
$15:b24b  09 04 02      ora #$0204
$15:b24e  f9 64 ff      sbc $ff64,y
$15:b251  5f 3f d3 8f   eor $8fd33f,x
$15:b255  f3 14         sbc ($14,s),y
$15:b257  09 82 4c      ora #$4c82
$15:b25a  0b            phd
$15:b25b  e4 03         cpx $03
$15:b25d  75 10         adc $10,x
$15:b25f  5d 1b 44      eor $441b,x
$15:b262  5a            phy
$15:b263  07 44         ora [$44]
$15:b265  64 2b         stz $2b
$15:b267  44 21 b0      mvp $b0,$21
$15:b26a  98            tya
$15:b26b  ec 26 3f      cpx $3f26
$15:b26e  05 9c         ora $9c
$15:b270  f9 e6 98      sbc $98e6,y
$15:b273  fa            plx
$15:b274  a7 31         lda [$31]
$15:b276  f2 13         sbc ($13)
$15:b278  6f 74 22 0c   adc $0c2274
$15:b27c  ff 08 23 40   sbc $402308,x
$15:b280  20 d6 05      jsr $05d6
$15:b283  70 43         bvs $b2c8
$15:b285  c1 21         cmp ($21,x)
$15:b287  01 87         ora ($87,x)
$15:b289  f8            sed
$15:b28a  28            plp
$15:b28b  1e 8a 07      asl $078a,x
$15:b28e  e2 41         sep #$41
$15:b290  99 b3 ca      sta $cab3,y
$15:b293  6e 92 a9      ror $a992
$15:b296  b4 2a         ldy $2a,x
$15:b298  2d c9 8b      and $8bc9
$15:b29b  f0 26         beq $b2c3
$15:b29d  01 f0         ora ($f0,x)
$15:b29f  d0 40         bne $b2e1
$15:b2a1  30 16         bmi $b2b9
$15:b2a3  0c 1d c3      tsb $c31d
$15:b2a6  83 f0         sta $f0,s
$15:b2a8  f0 fc         beq $b2a6
$15:b2aa  3c 1f 08      bit $081f,x
$15:b2ad  08            php
$15:b2ae  bc 20 70      ldy $7020,x
$15:b2b1  b8            clv
$15:b2b2  3c 56 1b      bit $1b56,x
$15:b2b5  14 86         trb $86
$15:b2b7  be 43 7d      ldx $7d43,y
$15:b2ba  8b            phb
$15:b2bb  ab            plb
$15:b2bc  f0 1b         beq $b2d9
$15:b2be  e2 65         sep #$65
$15:b2c0  08            php
$15:b2c1  34 0a         bit $0a,x
$15:b2c3  1c 45 09      trb $0945
$15:b2c6  1c 3e d5      trb $d53e
$15:b2c9  05 90         ora $90
$15:b2cb  42 b0         wdm #$b0
$15:b2cd  02 40         cop #$40
$15:b2cf  a0 74 2c      ldy #$2c74
$15:b2d2  1e 89 85      asl $8589,x
$15:b2d5  e2 61         sep #$61
$15:b2d7  7a            ply
$15:b2d8  9b            txy
$15:b2d9  5f 7a 9b a8   eor $a89b7a,x
$15:b2dd  31 3c         and ($3c),y
$15:b2df  84 a1         sty $a1
$15:b2e1  c0 b8 19      cpy #$19b8
$15:b2e4  40            rti
$15:b2e5  52 15         eor ($15)
$15:b2e7  3d 04 06      and $0604,x
$15:b2ea  a0 df 18      ldy #$18df
$15:b2ed  04 06         tsb $06
$15:b2ef  05 04         ora $04
$15:b2f1  82 c0 21      brl $d4b4
$15:b2f4  11 28         ora ($28),y
$15:b2f6  c4 ce         cpy $ce
$15:b2f8  51 20         eor ($20),y
$15:b2fa  98            tya
$15:b2fb  1b            tcs
$15:b2fc  c8            iny
$15:b2fd  82 10 28      brl $db10
$15:b300  3c 1e 1f      bit $1f1e,x
$15:b303  0f 43 84 5e   ora $5e8443
$15:b307  2f 1f cc d3   and $d3cc1f
$15:b30b  3c 56 0e      bit $0e56,x
$15:b30e  3c c7 3b      bit $3bc7,x
$15:b311  70 c5         bvs $b2d8
$15:b313  74 26         stz $26,x
$15:b315  b2 1d         lda ($1d)
$15:b317  dc 4b df      jml [$df4b]
$15:b31a  dd d8 40      cmp $40d8,x
$15:b31d  b3 10         lda ($10,s),y
$15:b31f  7c 0c 33      jmp ($330c,x)
$15:b322  21 6a         and ($6a,x)
$15:b324  98            tya
$15:b325  59 f8 3e      eor $3ef8,y
$15:b328  ee 97 32      inc $3297
$15:b32b  38            sec
$15:b32c  3e 25 8f      rol $8f25,x
$15:b32f  af a8 5e 2d   lda $2d5ea8
$15:b333  1f 6f 52 fb   ora $fb526f,x
$15:b337  df ff 60 b0   cmp $b060ff,x
$15:b33b  5c 2e 13 09   jml $09132e
$15:b33f  84 e2         sty $e2
$15:b341  71 18         adc ($18),y
$15:b343  0c 8c 72      tsb $728c
$15:b346  38            sec
$15:b347  0f f8 04 0e   ora $0e04f8
$15:b34b  07 05         ora [$05]
$15:b34d  82 46 e2      brl $9596
$15:b350  32 99         and ($99)
$15:b352  04 52         tsb $52
$15:b354  99 0f a1      sta $a10f,y
$15:b357  d8            cld
$15:b358  64 48         stz $48
$15:b35a  11 18         ora ($18),y
$15:b35c  82 18 11      brl $c477
$15:b35f  81 37         sta ($37,x)
$15:b361  99 df e7      sta $e7df,y
$15:b364  17 b8         ora [$b8],y
$15:b366  e4 f9         cpx $f9
$15:b368  04 18         tsb $18
$15:b36a  0c 05 02      tsb $0205
$15:b36d  81 b0         sta ($b0,x)
$15:b36f  88            dey
$15:b370  4a            lsr a
$15:b371  21 15         and ($15,x)
$15:b373  0b            phd
$15:b374  27 83         and [$83]
$15:b376  09 0c         ora #$0c
$15:b378  c4 20         cpy $20
$15:b37a  44 a2 1c      mvp $1c,$a2
$15:b37d  0e 07 43      asl $4307
$15:b380  a1 d8         lda ($d8,x)
$15:b382  cc 7f 27      cpy $277f
$15:b385  1b            tcs
$15:b386  cb            wai
$15:b387  87 e0         sta [$e0]
$15:b389  00 90         brk #$90
$15:b38b  78            sei
$15:b38c  2c 2a 11      bit $112a
$15:b38f  06 88         asl $88
$15:b391  40            rti
$15:b392  62 71 98      per $4c06
$15:b395  40            rti
$15:b396  01 60         ora ($60,x)
$15:b398  b0 58         bcs $b3f2
$15:b39a  6c 36 3b      jmp ($3b36)
$15:b39d  0c 8f c1      tsb $c18f
$15:b3a0  a1 cc         lda ($cc,x)
$15:b3a2  b2 f0         lda ($f0)
$15:b3a4  78            sei
$15:b3a5  2b            pld
$15:b3a6  91 4f         sta ($4f),y
$15:b3a8  55 0a         eor $0a,x
$15:b3aa  99 01 88      sta $8801,y
$15:b3ad  46 7e         lsr $7e
$15:b3af  7e 26 51      ror $5126,x
$15:b3b2  a4 c3         ldy $c3
$15:b3b4  e9 f4         sbc #$f4
$15:b3b6  fb            xce
$15:b3b7  7d be fe      adc $febe,x
$15:b3ba  6f fc 33 dc   adc $dc33fc
$15:b3be  c7 88         cmp [$88]
$15:b3c0  14 0a         trb $0a
$15:b3c2  03 04         ora $04,s
$15:b3c4  80 2f         bra $b3f5
$15:b3c6  01 7e         ora ($7e,x)
$15:b3c8  cd e0 21      cmp $21e0
$15:b3cb  09 0c         ora #$0c
$15:b3cd  17 e8         ora [$e8],y
$15:b3cf  17 0e         ora [$0e],y
$15:b3d1  bd 17 75      lda $7517,x
$15:b3d4  10 c9         bpl $b39f
$15:b3d6  c0 28 9c      cpy #$9c28
$15:b3d9  68            pla
$15:b3da  03 7d         ora $7d,s
$15:b3dc  02 e1         cop #$e1
$15:b3de  7d 74 14      adc $1474,x
$15:b3e1  e7 ff         sbc [$ff]
$15:b3e3  15 f7         ora $f7,x
$15:b3e5  48            pha
$15:b3e6  bb            tyx
$15:b3e7  9f 48 cf ba   sta $bacf48,x
$15:b3eb  03 0f         ora $0f,s
$15:b3ed  84 44         sty $44
$15:b3ef  e0 11 f8      cpx #$f811
$15:b3f2  04 3d         tsb $3d
$15:b3f4  be 08 e0      ldx $e008,y
$15:b3f7  86 c0         stx $c0
$15:b3f9  61 71         adc ($71,x)
$15:b3fb  18            clc
$15:b3fc  19 e8 1f      ora $1fe8,y
$15:b3ff  a2 df 1d      ldx #$1ddf
$15:b402  45 5e         eor $5e
$15:b404  99 3b d7      sta $d73b,y
$15:b407  e4 2f         cpx $2f
$15:b409  f8            sed
$15:b40a  0f 84 03 d1   ora $d10384
$15:b40e  00 37         brk #$37
$15:b410  00 5c         brk #$5c
$15:b412  24 17         bit $17
$15:b414  08            php
$15:b415  06 c3         asl $c3
$15:b417  11 d0         ora ($d0),y
$15:b419  c4 70         cpy $70
$15:b41b  23 01         and $01,s
$15:b41d  61 6f         adc ($6f,x)
$15:b41f  95 6f         sta $6f,x
$15:b421  95 37         sta $37,x
$15:b423  f4 c7 3c      pea $3cc7
$15:b426  93 fe         sta ($fe,s),y
$15:b428  9f be 11 f3   sta $f311be,x
$15:b42c  7d 1c aa      adc $aa1c,x
$15:b42f  09 09         ora #$09
$15:b431  5e 83 28      lsr $2883,x
$15:b434  20 11 07      jsr $0711
$15:b437  e1 37         sbc ($37,x)
$15:b439  c7 b5         cmp [$b5]
$15:b43b  56 f4         lsr $f4,x
$15:b43d  e5 e7         sbc $e7
$15:b43f  12 7f         ora ($7f)
$15:b441  e7 2f         sbc [$2f]
$15:b443  ef 00 f7 c0   sbc $c0f700
$15:b447  03 65         ora $65,s
$15:b449  51 90         eor ($90),y
$15:b44b  64 03         stz $03
$15:b44d  c1 c0         cmp ($c0,x)
$15:b44f  e0 40 23      cpx #$2340
$15:b452  05 c1         ora $c1
$15:b454  41 15         eor ($15,x)
$15:b456  56 1b         lsr $1b,x
$15:b458  74 87         stz $87,x
$15:b45a  de 20 f5      dec $f520,x
$15:b45d  e8            inx
$15:b45e  0d ba 0b      ora $0bba
$15:b461  3e 80 be      rol $be80,x
$15:b464  c1 a4         cmp ($a4,x)
$15:b466  12 a8         ora ($a8)
$15:b468  bc a2 0d      ldy $0da2,x
$15:b46b  20 83 4c      jsr $4c83
$15:b46e  0c c2 b1      tsb $b1c2
$15:b471  4a            lsr a
$15:b472  7f 23 2f 84   adc $842f23,x
$15:b476  c5 fe         cmp $fe
$15:b478  2e f8 dd      rol $ddf8
$15:b47b  1f 7a a7 dc   ora $dca77a,x
$15:b47f  83 7e         sta $7e,s
$15:b481  03 61         ora $61,s
$15:b483  31 80         and ($80),y
$15:b485  5e 60 10      lsr $1060,x
$15:b488  58            cli
$15:b489  04 09         tsb $09
$15:b48b  a4 32         ldy $32
$15:b48d  04 42         tsb $42
$15:b48f  ab            plb
$15:b490  2b            pld
$15:b491  ff ff 57 f4   sbc $f457ff,x
$15:b495  05 9f         ora $9f
$15:b497  26 d0         rol $d0
$15:b499  fe 7f 19      inc $197f,x
$15:b49c  fc ac f7      jsr ($f7ac,x)
$15:b49f  f6 c3         inc $c3,x
$15:b4a1  21 90         and ($90,x)
$15:b4a3  e8            inx
$15:b4a4  74 18         stz $18,x
$15:b4a6  26 30         rol $30
$15:b4a8  78            sei
$15:b4a9  39 10 20      and $2010,y
$15:b4ac  4a            lsr a
$15:b4ad  51 07         eor ($07),y
$15:b4af  f4 f6 bd      pea $bdf6
$15:b4b2  0c a8 d8      tsb $d8a8
$15:b4b5  e4 53         cpx $53
$15:b4b7  ec e4 37      cpx $37e4
$15:b4ba  25 45         and $45
$15:b4bc  e3 6e         sbc $6e,s
$15:b4be  ef 94 79 c4   sbc $c47994
$15:b4c2  02 bd         cop #$bd
$15:b4c4  22 b9 c7 27   jsl $27c7b9
$15:b4c8  d4 0e         pei ($0e)
$15:b4ca  e5 83         sbc $83
$15:b4cc  e5 38         sbc $38
$15:b4ce  ff 40 2f 90   sbc $902f40,x
$15:b4d2  09 c5         ora #$c5
$15:b4d4  e3 e9         sbc $e9,s
$15:b4d6  60            rts
$15:b4d7  8a            txa
$15:b4d8  63 31         adc $31,s
$15:b4da  1f 8b 95 83   ora $83958b,x
$15:b4de  25 44         and $44
$15:b4e0  e3 6e         sbc $6e,s
$15:b4e2  af 9c 41 f0   lda $f0419c
$15:b4e6  7d 31 19      adc $1931,x
$15:b4e9  cb            wai
$15:b4ea  87 e2         sta [$e2]
$15:b4ec  09 76         ora #$76
$15:b4ee  86 67         stx $67
$15:b4f0  89 29         bit #$29
$15:b4f2  0f 93 c8 e0   ora $e0c893
$15:b4f6  97 1a         sta [$1a],y
$15:b4f8  8c fb 1f      sty $1ffb
$15:b4fb  17 c4         ora [$c4],y
$15:b4fd  0e 52 21      asl $2152
$15:b500  37 8c         and [$8c],y
$15:b502  47 21         eor [$21]
$15:b504  d5 fb         cmp $fb,x
$15:b506  07 bc         ora [$bc]
$15:b508  c6 04         dec $04
$15:b50a  94 df         sty $df,x
$15:b50c  57 23         eor [$23],y
$15:b50e  1a            inc a
$15:b50f  48            pha
$15:b510  8e c6 1f      stx $1fc6
$15:b513  1e fe c0      asl $c0fe,x
$15:b516  be 90 cf      ldx $cf90,y
$15:b519  dc 1f f9      jml [$f91f]
$15:b51c  03 80         ora $80,s
$15:b51e  d7 60         cmp [$60],y
$15:b520  7a            ply
$15:b521  78            sei
$15:b522  76 fe         ror $fe,x
$15:b524  01 1e         ora ($1e,x)
$15:b526  80 8a         bra $b4b2
$15:b528  42 1f         wdm #$1f
$15:b52a  00 83         brk #$83
$15:b52c  c0 20 70      cpy #$7020
$15:b52f  e8            inx
$15:b530  54 de 43      mvn $43,$de
$15:b533  52 a0         eor ($a0)
$15:b535  ca            dex
$15:b536  33 11         and ($11,s),y
$15:b538  fc 3d 13      jsr ($133d,x)
$15:b53b  86 3b         stx $3b
$15:b53d  28            plp
$15:b53e  0c 2e 19      tsb $192e
$15:b541  2d 97 5b      and $5b97
$15:b544  ec ff fb      cpx $fbff
$15:b547  87 de         sta [$de]
$15:b549  71 fb         adc ($fb),y
$15:b54b  25 95         and $95
$15:b54d  f2 71         sbc ($71)
$15:b54f  ef eb f1 a0   sbc $a0f1eb
$15:b553  38            sec
$15:b554  2e 35 f7      rol $f735
$15:b557  07 fe         ora [$fe]
$15:b559  80 ff         bra $b55a
$15:b55b  e0 0d b0      cpx #$b00d
$15:b55e  c1 ee         cmp ($ee,x)
$15:b560  e0 1d 78      cpx #$781d
$15:b563  04 06         tsb $06
$15:b565  03 c7         ora $c7,s
$15:b567  6f 03 8c 01   adc $018c03
$15:b56b  45 1b         eor $1b
$15:b56d  88            dey
$15:b56e  bb            tyx
$15:b56f  c2 3f         rep #$3f
$15:b571  05 9c         ora $9c
$15:b573  f9 fa 9c      sbc $9cfa,y
$15:b576  fd a6 33      sbc $33a6,x
$15:b579  a9 cc ab      lda #$abcc
$15:b57c  73 a2         adc ($a2,s),y
$15:b57e  10 c7         bpl $b547
$15:b580  f8            sed
$15:b581  41 05         eor ($05,x)
$15:b583  a1 06         lda ($06,x)
$15:b585  90 43         bcc $b5ca
$15:b587  ac 70 f9      ldy $f970
$15:b58a  1c 3e 43      trb $433e
$15:b58d  0f f8 48 01   ora $0148f8
$15:b591  e1 f8         sbc ($f8,x)
$15:b593  90 66         bcc $b5fb
$15:b595  6c f2 eb      jmp ($ebf2)
$15:b598  b4 b6         ldy $b6,x
$15:b59a  69 0e 8b      adc #$8b0e
$15:b59d  72 a2         adc ($a2)
$15:b59f  da            phx
$15:b5a0  08            php
$15:b5a1  c0 7c 60      cpy #$607c
$15:b5a4  18            clc
$15:b5a5  0b            phd
$15:b5a6  06 06         asl $06
$15:b5a8  e1 c3         sbc ($c3,x)
$15:b5aa  f8            sed
$15:b5ab  78            sei
$15:b5ac  45 42         eor $42
$15:b5ae  e4 08         cpx $08
$15:b5b0  0c 0e 17      tsb $170e
$15:b5b3  07 8a         ora [$8a]
$15:b5b5  c3 62         cmp $62,s
$15:b5b7  90 d9         bcc $b592
$15:b5b9  a7 f2         lda [$f2]
$15:b5bb  b9 f6 f3      lda $f3f6,y
$15:b5be  f6 1d         inc $1d,x
$15:b5c0  63 02         adc $02,s
$15:b5c2  02 84         cop #$84
$15:b5c4  0a            asl a
$15:b5c5  1c 45 08      trb $0845
$15:b5c8  1c fe 0b      trb $0bfe
$15:b5cb  3b            tsc
$15:b5cc  90 57         bcc $b625
$15:b5ce  30 02         bmi $b5d2
$15:b5d0  40            rti
$15:b5d1  a0 74 2c      ldy #$2c74
$15:b5d4  1e 89 85      asl $8589,x
$15:b5d7  e2 61         sep #$61
$15:b5d9  7d 9f ce      adc $ce9f,x
$15:b5dc  ad dc 78      lda $78dc
$15:b5df  f1 3c         sbc ($3c),y
$15:b5e1  84 a1         sty $a1
$15:b5e3  c0 b8 19      cpy #$19b8
$15:b5e6  47 f9         eor [$f9]
$15:b5e8  a1 ee         lda ($ee,x)
$15:b5ea  40            rti
$15:b5eb  67 4e         adc [$4e]
$15:b5ed  b2 80         lda ($80)
$15:b5ef  c0 a0 90      cpy #$90a0
$15:b5f2  58            cli
$15:b5f3  04 22         tsb $22
$15:b5f5  25 18         and $18
$15:b5f7  99 ca 24      sta $24ca,y
$15:b5fa  13 07         ora ($07,s),y
$15:b5fc  59 10 42      eor $4210,y
$15:b5ff  05 07         ora $07
$15:b601  83 c3         sta $c3,s
$15:b603  e1 e8         sbc ($e8,x)
$15:b605  70 8b         bvs $b592
$15:b607  c5 e3         cmp $e3
$15:b609  fb            xce
$15:b60a  a8            tay
$15:b60b  c6 16         dec $16
$15:b60d  03 db         ora $db,s
$15:b60f  99 61 ee      sta $ee61,y
$15:b612  99 de 04      sta $04de,y
$15:b615  ea            nop
$15:b616  41 b5         eor ($b5,x)
$15:b618  80 fa         bra $b614
$15:b61a  fb            xce
$15:b61b  5e 08 3f      lsr $3f08,x
$15:b61e  c6 1d         dec $1d
$15:b620  92 86         sta ($86)
$15:b622  65 2d         adc $2d
$15:b624  12 0b         ora ($0b)
$15:b626  17 03         ora [$03],y
$15:b628  cf c1 e7 46   cmp $46e7c1
$15:b62c  b8            clv
$15:b62d  87 f3         sta [$f3]
$15:b62f  75 8c         adc $8c,x
$15:b631  12 09         ora ($09)
$15:b633  0e 87 21      asl $2187
$15:b636  82 07 03      brl $b940
$15:b639  57 fb         eor [$fb],y
$15:b63b  3e f0 04      rol $04f0,x
$15:b63e  f0 68         beq $b6a8
$15:b640  7b            tdc
$15:b641  c3 c0         cmp $c0,s
$15:b643  3e 12 f1      rol $f112,x
$15:b646  1f af d2 03   ora $03d2af,x
$15:b64a  01 82         ora ($82,x)
$15:b64c  41 85         eor ($85,x)
$15:b64e  db            stp
$15:b64f  07 5f         ora [$5f]
$15:b651  b2 e4         lda ($e4)
$15:b653  3e bd 1b      rol $1bbd,x
$15:b656  74 13         stz $13,x
$15:b658  c9 40         cmp #$40
$15:b65a  6f ba e4 3b   adc $3be4ba
$15:b65e  e6 a2         inc $a2
$15:b660  15 79         ora $79,x
$15:b662  ff d7 ec bd   sbc $bdecd7,x
$15:b666  09 ec         ora #$ec
$15:b668  d2 b7         cmp ($b7)
$15:b66a  41 47         eor ($47,x)
$15:b66c  5c de 6f 77   jml $776fde
$15:b670  6f c4 e2 71   adc $71e2c4
$15:b674  44 be 4e      mvp $4e,$be
$15:b677  3f cd f9 9c   and $9cf9cd,x
$15:b67b  40            rti
$15:b67c  2f 90 05 f1   and $f10590
$15:b680  ae 52 a9      ldx $a952
$15:b683  c6 9c         dec $9c
$15:b685  64 a2         stz $a2
$15:b687  18            clc
$15:b688  26 2c         rol $2c
$15:b68a  2f 42 f8 ea   and $eaf842
$15:b68e  19 af ba      ora $baaf,y
$15:b691  45 dc         eor $dc
$15:b693  fa            plx
$15:b694  46 7d         lsr $7d
$15:b696  d0 18         bne $b6b0
$15:b698  7c 22 27      jmp ($2722,x)
$15:b69b  00 8f         brk #$8f
$15:b69d  c0 21 e5      cpy #$e521
$15:b6a0  51 80         eor ($80),y
$15:b6a2  43 60         eor $60,s
$15:b6a4  30 b8         bmi $b65e
$15:b6a6  8c 0e 20      sty $200e
$15:b6a9  f6 02         inc $02,x
$15:b6ab  39 ea 6a      and $6aea,y
$15:b6ae  f4 c9 de      pea $dec9
$15:b6b1  bf 21 7f c0   lda $c07f21,x
$15:b6b5  7c 20 1e      jmp ($1e20,x)
$15:b6b8  88            dey
$15:b6b9  07 e2         ora [$e2]
$15:b6bb  00 17         brk #$17
$15:b6bd  09 05         ora #$05
$15:b6bf  c2 01         rep #$01
$15:b6c1  b0 c4         bcs $b687
$15:b6c3  74 31         stz $31,x
$15:b6c5  1c 08 c0      trb $c008
$15:b6c8  58            cli
$15:b6c9  52 a5         eor ($a5)
$15:b6cb  f3 f9         sbc ($f9,s),y
$15:b6cd  5b            tcd
$15:b6ce  fe 33 cf      inc $cf33,x
$15:b6d1  24 ff         bit $ff
$15:b6d3  a7 ef         lda [$ef]
$15:b6d5  84 7c         sty $7c
$15:b6d7  df 47 02 be   cmp $be0247,x
$15:b6db  40            rti
$15:b6dc  66 10         ror $10
$15:b6de  44 c8 40      mvp $40,$c8
$15:b6e1  22 0f c2 4a   jsl $4ac20f
$15:b6e5  8f 3a 9d f6   sta $f69d3a
$15:b6e9  c7 4e         cmp [$4e]
$15:b6eb  64 ff         stz $ff
$15:b6ed  ce 5f de      dec $de5f
$15:b6f0  01 ef         ora ($ef,x)
$15:b6f2  80 06         bra $b6fa
$15:b6f4  ca            dex
$15:b6f5  83 3e         sta $3e,s
$15:b6f7  c0 c3 24      cpy #$24c3
$15:b6fa  1c 0e 04      trb $040e
$15:b6fd  02 30         cop #$30
$15:b6ff  5c 14 a9 55   jml $55a914
$15:b703  61 b7         adc ($b7,x)
$15:b705  48            pha
$15:b706  7d e2 0f      adc $0fe2,x
$15:b709  5e 80 db      lsr $db80,x
$15:b70c  a0 b3 e8      ldy #$e8b3
$15:b70f  0b            phd
$15:b710  ec 12 e1      cpx $e112
$15:b713  2a            rol a
$15:b714  8b            phb
$15:b715  ca            dex
$15:b716  20 d2 08      jsr $08d2
$15:b719  34 c0         bit $c0,x
$15:b71b  cc 2b 34      cpy $342b
$15:b71e  85 e3         sta $e3
$15:b720  74 f8         stz $f8,x
$15:b722  48            pha
$15:b723  7d f2 ef      adc $eff2,x
$15:b726  8d 91 f7      sta $f791
$15:b729  ad 7e c8      lda $c87e
$15:b72c  37 e0         and [$e0],y
$15:b72e  36 17         rol $17,x
$15:b730  48            pha
$15:b731  05 e6         ora $e6
$15:b733  01 81         ora ($81,x)
$15:b735  1f 01 b0 48   ora $48b001,x
$15:b739  e0 6a 28      cpx #$286a
$15:b73c  0c 05 84      tsb $8405
$15:b73f  c8            iny
$15:b740  94 57         sty $57,x
$15:b742  f1 90         sbc ($90),y
$15:b744  3c 1e 0b      bit $0b1e,x
$15:b747  85 c2         sta $c2
$15:b749  71 38         adc ($38),y
$15:b74b  8e 47 21      stx $2147
$15:b74e  d0 e8         bne $b738
$15:b750  34 19         bit $19,x
$15:b752  9b            txy
$15:b753  e6 c1         inc $c1
$15:b755  b0 58         bcs $b7af
$15:b757  2f 17 89 fc   and $fc8917
$15:b75b  fe 1f 0f      inc $0f1f,x
$15:b75e  57 b3         eor [$b3],y
$15:b760  c7 99         cmp [$99]
$15:b762  2c 9c 0b      bit $0b9c
$15:b765  f5 fa         sbc $fa,x
$15:b767  19 0c 07      ora $070c,y
$15:b76a  f4 2a 11      pea $112a
$15:b76d  35 91         and $91,x
$15:b76f  d4 e8         pei ($e8)
$15:b771  12 8c         ora ($8c)
$15:b773  c4 7f         cpy $7f
$15:b775  0f 44 e1 ee   ora $eee144
$15:b779  ef 94 79 c4   sbc $c47994
$15:b77d  16 1b         asl $1b,x
$15:b77f  0c 97 cb      tsb $cb97
$15:b782  ad d6 7f      lda $7fd6
$15:b785  fd c3 ef      sbc $efc3,x
$15:b788  38            sec
$15:b789  fd c0 2f      sbc $2fc0,x
$15:b78c  90 09         bcc $b797
$15:b78e  c5 46         cmp $46
$15:b790  63 1f         adc $1f,s
$15:b792  87 7a         sta [$7a]
$15:b794  be bc 09      ldx $09bc,y
$15:b797  05 ff         ora $ff
$15:b799  01 ff         ora ($ff,x)
$15:b79b  80 16         bra $b7b3
$15:b79d  4b            phk
$15:b79e  9d ff f0      sta $f0ff,x
$15:b7a1  7b            tdc
$15:b7a2  a0 1f 58      ldy #$581f
$15:b7a5  04 82         tsb $82
$15:b7a7  01 80         ora ($80,x)
$15:b7a9  44 a4 0e      mvp $0e,$a4
$15:b7ac  07 3d         ora [$3d]
$15:b7ae  9a            txs
$15:b7af  56 e8         lsr $e8,x
$15:b7b1  33 9c         and ($9c,s),y
$15:b7b3  84 53         sty $53
$15:b7b5  19 47 e1      ora $e147,y
$15:b7b8  ee af a3      inc $a3af
$15:b7bb  d0 37         bne $b7f4
$15:b7bd  0c de 6f      tsb $6fde
$15:b7c0  77 bb         adc [$bb],y
$15:b7c2  fd ee 7f      sbc $7fee,x
$15:b7c5  f2 48         sbc ($48)
$15:b7c7  df 49 a1 b9   cmp $b9a149,x
$15:b7cb  88            dey
$15:b7cc  65 21         adc $21
$15:b7ce  87 90         sta [$90]
$15:b7d0  bd 4f 6c      lda $6c4f,x
$15:b7d3  f5 8d         sbc $8d,x
$15:b7d5  ff 00 ae 48   sbc $48ae00,x
$15:b7d9  40            rti
$15:b7da  b9 df c9      lda $c9df,y
$15:b7dd  21 80         and ($80,x)
$15:b7df  de e0 3b      dec $3be0,x
$15:b7e2  02 60         cop #$60
$15:b7e4  33 95         and ($95,s),y
$15:b7e6  53 8d         eor ($8d,s),y
$15:b7e8  38            sec
$15:b7e9  c9 44         cmp #$44
$15:b7eb  30 44         bmi $b831
$15:b7ed  c0 aa 51      cpy #$51aa
$15:b7f0  16 25         asl $25,x
$15:b7f2  c6 5c         dec $5c
$15:b7f4  07 fa         ora [$fa]
$15:b7f6  f8            sed
$15:b7f7  c0 17 f8      cpy #$f817
$15:b7fa  4e 2f 8c      lsr $8c2f
$15:b7fd  12 63         ora ($63)
$15:b7ff  8f 1a 20 b8   sta $b8201a
$15:b803  3a            dec a
$15:b804  27 1a         and [$1a]
$15:b806  a9 38         lda #$38
$15:b808  9c 34 03      stz $0334
$15:b80b  05 00         ora $00
$15:b80d  58            cli
$15:b80e  03 21         ora $21,s
$15:b810  18            clc
$15:b811  80 7e         bra $b891
$15:b813  0e 33 04      asl $0433
$15:b816  26 52         rol $52
$15:b818  2a            rol a
$15:b819  a5 32         lda $32
$15:b81b  7f 2d cb ec   adc $eccb2d,x
$15:b81f  a4 34         ldy $34
$15:b821  cf 2e 7a 67   cmp $677a2e
$15:b825  4c 87 40      jmp $4087
$15:b828  60            rts
$15:b829  32 39         and ($39)
$15:b82b  1d be 81      ora $81be,x
$15:b82e  61 a6         adc ($a6,x)
$15:b830  78            sei
$15:b831  33 dc         and ($dc,s),y
$15:b833  c8            iny
$15:b834  f6 7a         inc $7a,x
$15:b836  19 5e a0      ora $a05e,y
$15:b839  53 69         eor ($69,s),y
$15:b83b  14 0d         trb $0d
$15:b83d  64 c3         stz $c3
$15:b83f  f5 b0         sbc $b0,x
$15:b841  ed 53 30      sbc $3053
$15:b844  b3 2c         lda ($2c,s),y
$15:b846  bd e3 9f      lda $9fe3,x
$15:b849  31 fb         and ($fb),y
$15:b84b  60            rts
$15:b84c  b0 9c         bcs $b7ea
$15:b84e  4e 37 da      lsr $da37
$15:b851  0d 86 99      ora $9986
$15:b854  c1 ef         cmp ($ef,x)
$15:b856  33 3b         and ($3b,s),y
$15:b858  c5 e6         cmp $e6
$15:b85a  63 7a         adc $7a,s
$15:b85c  81 6d         sta ($6d,x)
$15:b85e  21 50         and ($50,x)
$15:b860  28            plp
$15:b861  ac 26 1f      ldy $1f26
$15:b864  19 89 c3      ora $c389,y
$15:b867  61 63         adc ($63,x)
$15:b869  04 85         tsb $85
$15:b86b  c1 21         cmp ($21,x)
$15:b86d  10 e8         bpl $b857
$15:b86f  c4 7a         cpy $7a
$15:b871  31 08         and ($08),y
$15:b873  88            dey
$15:b874  8f d2 19 18   sta $1819d2
$15:b878  98            tya
$15:b879  40            rti
$15:b87a  2f 10 8b c4   and $c48b10
$15:b87e  40            rti
$15:b87f  88            dey
$15:b880  11 8b         ora ($8b),y
$15:b882  07 c3         ora [$c3]
$15:b884  81 d8         sta ($d8,x)
$15:b886  a0 16 c2      ldy #$c216
$15:b889  f1 78         sbc ($78),y
$15:b88b  80 42         bra $b8cf
$15:b88d  3c 1f 0f      bit $0f1f,x
$15:b890  87 e3         sta [$e3]
$15:b892  01 e0         ora ($e0,x)
$15:b894  9c 7e 27      stz $277e
$15:b897  17 83         ora [$83],y
$15:b899  58            cli
$15:b89a  47 23         eor [$23]
$15:b89c  92 e9         sta ($e9)
$15:b89e  75 1e         adc $1e,x
$15:b8a0  87 43         sta [$43]
$15:b8a2  a0 9d 82      ldy #$829d
$15:b8a5  45 22         eor $22
$15:b8a7  37 84         and [$84],y
$15:b8a9  00 fa         brk #$fa
$15:b8ab  31 c8         and ($c8),y
$15:b8ad  64 ba         stz $ba
$15:b8af  05 06         ora $06
$15:b8b1  80 49         bra $b8fc
$15:b8b3  90 00         bcc $b8b5
$15:b8b5  7d 24 52      adc $5224,x
$15:b8b8  c6 23         dec $23
$15:b8ba  12 c9         ora ($c9)
$15:b8bc  22 60 12 a0   jsl $a01260
$15:b8c0  8b            phb
$15:b8c1  93 08         sta ($08,s),y
$15:b8c3  22 96 fd 00   jsl $00fd96
$15:b8c7  a1 2c         lda ($2c,x)
$15:b8c9  95 62         sta $62,x
$15:b8cb  0b            phd
$15:b8cc  cf 57 7b 7b   cmp $7b7b57
$15:b8d0  da            phx
$15:b8d1  1e e1 f7      asl $f7e1,x
$15:b8d4  97 88         sta [$88],y
$15:b8d6  32 03         and ($03)
$15:b8d8  01 81         ora ($81,x)
$15:b8da  c0 c6 21      cpy #$21c6
$15:b8dd  01 86         ora ($86,x)
$15:b8df  c3 a2         cmp $a2,s
$15:b8e1  10 f8         bpl $b8db
$15:b8e3  85 7e         sta $7e
$15:b8e5  40            rti
$15:b8e6  2f 21 90 8c   and $8c9021
$15:b8ea  c2 1f         rep #$1f
$15:b8ec  01 88         ora ($88,x)
$15:b8ee  c0 22 1c      cpy #$1c22
$15:b8f1  0f 00 81 30   ora $308100
$15:b8f5  05 40         ora $40
$15:b8f7  b0 78         bcs $b971
$15:b8f9  36 1e         rol $1e,x
$15:b8fb  0a            asl a
$15:b8fc  87 d3         sta [$d3]
$15:b8fe  50 51         bvc $b951
$15:b900  33 19         and ($19,s),y
$15:b902  78            sei
$15:b903  28            plp
$15:b904  1f 0f 07 c2   ora $c2070f,x
$15:b908  8d ee 9c      sta $9cee
$15:b90b  4e 2a 94      lsr $942a
$15:b90e  49 c6         eor #$c6
$15:b910  4a            lsr a
$15:b911  21 82         and ($82,x)
$15:b913  a2 71 a7      ldx #$a771
$15:b916  14 4b         trb $4b
$15:b918  e1 c0         sbc ($c0,x)
$15:b91a  60            rts
$15:b91b  06 f0         asl $f0
$15:b91d  be 5f 3f      ldx $3f5f,y
$15:b920  c8            iny
$15:b921  30 9c         bmi $b8bf
$15:b923  7f a0 07 e3   adc $e307a0,x
$15:b927  38            sec
$15:b928  bd f0 fe      lda $fef0,x
$15:b92b  02 02         cop #$02
$15:b92d  40            rti
$15:b92e  ba            tsx
$15:b92f  61 6f         adc ($6f,x)
$15:b931  9b            txy
$15:b932  a9 c1         lda #$c1
$15:b934  d8            cld
$15:b935  77 57         adc [$57],y
$15:b937  ca            dex
$15:b938  26 eb         rol $eb
$15:b93a  74 95         stz $95,x
$15:b93c  38            sec
$15:b93d  02 e4         cop #$e4
$15:b93f  94 c5         sty $c5,x
$15:b941  ba            tsx
$15:b942  44 90 80      mvp $80,$90
$15:b945  0e e0 7b      asl $7be0
$15:b948  0b            phd
$15:b949  e7 18         sbc [$18]
$15:b94b  ea            nop
$15:b94c  4b            phk
$15:b94d  50 4b         bvc $b99a
$15:b94f  1a            inc a
$15:b950  20 13 40      jsr $4013
$15:b953  d0 05         bne $b95a
$15:b955  23 d0         and $d0,s
$15:b957  46 01         lsr $01
$15:b959  5a            phy
$15:b95a  bd 43 63      lda $6343,x
$15:b95d  f2 29         sbc ($29)
$15:b95f  dc b2 3b      jml [$3bb2]
$15:b962  10 ae         bpl $b912
$15:b964  42 25         wdm #$25
$15:b966  f4 aa 05      pea $05aa
$15:b969  02 31         cop #$31
$15:b96b  40            rti
$15:b96c  b4 5c         ldy $5c,x
$15:b96e  6b            rtl
$15:b96f  17 a2         ora [$a2],y
$15:b971  38            sec
$15:b972  4c e0 72      jmp $72e0
$15:b975  9a            txs
$15:b976  1c 4a c9      trb $c94a
$15:b979  8e 82 5a      stx $5a82
$15:b97c  79 7f bc      adc $bc7f,y
$15:b97f  04 43         tsb $43
$15:b981  15 fc         ora $fc,x
$15:b983  a2 7e 2d      ldx #$2d7e
$15:b986  15 88         ora $88,x
$15:b988  87 d2         sta [$d2]
$15:b98a  29 04         and #$04
$15:b98c  84 4e         sty $4e
$15:b98e  3e 77 3f      rol $3f77,x
$15:b991  9c d7 ff      stz $ffd7
$15:b994  c0 c0 6b      cpy #$6bc0
$15:b997  3a            dec a
$15:b998  19 4d 04      ora $044d,y
$15:b99b  22 01 6d 83   jsl $836d01
$15:b99f  6f 20 3f 9b   adc $9b3f20
$15:b9a3  35 de         and $de,x
$15:b9a5  13 00         ora ($00,s),y
$15:b9a7  c8            iny
$15:b9a8  63 ee         adc $ee,s
$15:b9aa  16 c8         asl $c8,x
$15:b9ac  1e df 69      asl $69df,x
$15:b9af  00 b4         brk #$b4
$15:b9b1  64 3e         stz $3e
$15:b9b3  1f 0c 87 db   ora $db870c,x
$15:b9b7  ff 6f ff c0   sbc $c0ff6f,x
$15:b9bb  2e 19 0c      rol $0c19
$15:b9be  1d 23 c1      ora $c123,x
$15:b9c1  d0 80         bne $b943
$15:b9c3  7b            tdc
$15:b9c4  a0 5f aa      ldy #$aa5f
$15:b9c7  57 92         eor [$92],y
$15:b9c9  79 ca bb      adc $bbca,y
$15:b9cc  7f a0 5c 28   adc $285ca0,x
$15:b9d0  14 ea         trb $ea
$15:b9d2  54 80 0a      mvn $0a,$80
$15:b9d5  95 53         sta $53,x
$15:b9d7  15 c4         ora $c4,x
$15:b9d9  80 48         bra $ba23
$15:b9db  09 21         ora #$21
$15:b9dd  02 9e         cop #$9e
$15:b9df  40            rti
$15:b9e0  af 92 4e 02   lda $024e92
$15:b9e4  f8            sed
$15:b9e5  20 27 11      jsr $1127
$15:b9e8  88            dey
$15:b9e9  44 21 02      mvp $02,$21
$15:b9ec  d0 55         bne $ba43
$15:b9ee  8d 82 c0      sta $c082
$15:b9f1  6f f8 05 fa   adc $fa05f8
$15:b9f5  01 42         ora ($42,x)
$15:b9f7  49 2a         eor #$2a
$15:b9f9  44 13 9e      mvp $9e,$13
$15:b9fc  8f 04 87 b0   sta $b08704
$15:ba00  39 63 ec      and $ec63,y
$15:ba03  2f 69 fb 93   and $93fb69
$15:ba07  de be 1e      dec $1ebe,x
$15:ba0a  7e ff 83      ror $83ff,x
$15:ba0d  1f b0 89 c7   ora $c789b0,x
$15:ba11  e1 b1         sbc ($b1,x)
$15:ba13  d8            cld
$15:ba14  3c 3e 01      bit $013e,x
$15:ba17  03 1d         ora $1d,s
$15:ba19  01 c4         ora ($c4,x)
$15:ba1b  38            sec
$15:ba1c  1e 0a 07      asl $070a,x
$15:ba1f  c2 03         rep #$03
$15:ba21  1f 81 c7 e0   ora $e0c781,x
$15:ba25  23 81         and $81,s
$15:ba27  80 8f         bra $b9b8
$15:ba29  07 ef         ora [$ef]
$15:ba2b  0f f1 46 a2   ora $a246f1
$15:ba2f  17 0f         ora [$0f],y
$15:ba31  05 c2         ora $c2
$15:ba33  80 7e         bra $bab3
$15:ba35  0c 00 78      tsb $7800
$15:ba38  86 e1         stx $e1
$15:ba3a  04 8f         tsb $8f
$15:ba3c  60            rts
$15:ba3d  3e 06 31      rol $3106,x
$15:ba40  f0 16         beq $ba58
$15:ba42  40            rti
$15:ba43  d4 00         pei ($00)
$15:ba45  f0 9c         beq $b9e3
$15:ba47  64 a2         stz $a2
$15:ba49  18            clc
$15:ba4a  2a            rol a
$15:ba4b  27 1a         and [$1a]
$15:ba4d  71 7c         adc ($7c),y
$15:ba4f  37 00         and [$00],y
$15:ba51  78            sei
$15:ba52  a7 07         lda [$07]
$15:ba54  50 ff         bvc $ba55
$15:ba56  1f c2 71 fe   ora $fe71c2,x
$15:ba5a  80 1d         bra $ba79
$15:ba5c  94 f8         sty $f8,x
$15:ba5e  33 8a         and ($8a,s),y
$15:ba60  a5 10         lda $10
$15:ba62  df 67 d1 3f   cmp $3fd167,x
$15:ba66  e1 f4         sbc ($f4,x)
$15:ba68  28            plp
$15:ba69  97 c4         sta [$c4],y
$15:ba6b  18            clc
$15:ba6c  55 0e         eor $0e,x
$15:ba6e  80 70         bra $bae0
$15:ba70  1b            tcs
$15:ba71  e7 18         sbc [$18]
$15:ba73  f4 48 51      pea $5148
$15:ba76  41 09         eor ($09,x)
$15:ba78  fc a0 07      jsr ($07a0,x)
$15:ba7b  40            rti
$15:ba7c  59 49 cc      eor $cc49,y
$15:ba7f  0e c0 c1      asl $c1c0
$15:ba82  a4 18         ldy $18
$15:ba84  c0 2b f6      cpy #$f62b
$15:ba87  6d 7e d2      adc $d27e
$15:ba8a  2f 4b b1 f1   and $f1b14b
$15:ba8e  6d 3c ac      adc $ac3c
$15:ba91  9f 63 4f ec   sta $ec4f63,x
$15:ba95  a5 df         lda $df
$15:ba97  a0 97 8a      ldy #$8a97
$15:ba9a  3f e3 65 fc   and $fc65e3,x
$15:ba9e  41 84         eor ($84,x)
$15:baa0  d3 fd         cmp ($fd,s),y
$15:baa2  24 ff         bit $ff
$15:baa4  44 10 81      mvp $81,$10
$15:baa7  7e ee 53      ror $53ee,x
$15:baaa  3b            tsc
$15:baab  51 cf         eor ($cf),y
$15:baad  97 e3         sta [$e3],y
$15:baaf  bd e0 bd      lda $bde0,x
$15:bab2  60            rts
$15:bab3  3d 90 0f      and $0f90,x
$15:bab6  c4 03         cpy $03
$15:bab8  41 00         eor ($00,x)
$15:baba  98            tya
$15:babb  40            rti
$15:babc  3c 9c 08      bit $089c,x
$15:babf  44 12 41      mvp $41,$12
$15:bac2  0a            asl a
$15:bac3  c0 4b 20      cpy #$204b
$15:bac6  1b            tcs
$15:bac7  48            pha
$15:bac8  06 42         asl $42
$15:baca  01 c0         ora ($c0,x)
$15:bacc  be f6 65      ldx $65f6,y
$15:bacf  bd c9 fc      lda $fcc9,x
$15:bad2  1e 37 05      asl $0537,x
$15:bad5  9f 40 62 f0   sta $f06240,x
$15:bad9  08            php
$15:bada  6c 02 07      jmp ($0702)
$15:badd  00 83         brk #$83
$15:badf  78            sei
$15:bae0  22 7c 08 04   jsl $04087c
$15:bae4  42 09         wdm #$09
$15:bae6  30 80         bmi $ba68
$15:bae8  c9 07         cmp #$07
$15:baea  43 0b         eor $0b,s
$15:baec  80 40         bra $bb2e
$15:baee  bd d2 6f      lda $6fd2,x
$15:baf1  6c 3b f3      jmp ($f33b)
$15:baf4  fc f7 fc      jsr ($fcf7,x)
$15:baf7  37 b4         and [$b4],y
$15:baf9  0f b4 03 f9   ora $f903b4
$15:bafd  00 e8         brk #$e8
$15:baff  40            rti
$15:bb00  23 10         and $10,s
$15:bb02  0f 95 82 09   ora $098295
$15:bb06  02 88         cop #$88
$15:bb08  41 68         eor ($68,x)
$15:bb0a  11 68         ora ($68),y
$15:bb0c  05 6a         ora $6a
$15:bb0e  01 48         ora ($48,x)
$15:bb10  80 58         bra $bb6a
$15:bb12  1d a1 7e      ora $7ea1,x
$15:bb15  80 50         bra $bb67
$15:bb17  8e 4a 71      stx $714a
$15:bb1a  03 e7         ora $e7,s
$15:bb1c  ab            plb
$15:bb1d  84 e3         sty $e3
$15:bb1f  e8            inx
$15:bb20  2f 49 fa 93   and $93fa49
$15:bb24  d6 be         dec $be,x
$15:bb26  c6 f6         dec $f6
$15:bb28  bf ba 3d f3   lda $f33dba,x
$15:bb2c  e2 5a         sep #$5a
$15:bb2e  81 c0         sta ($c0,x)
$15:bb30  e1 90         sbc ($90,x)
$15:bb32  f8            sed
$15:bb33  81 54         sta ($54,x)
$15:bb35  27 f1         and [$f1]
$15:bb37  01 7b         ora ($7b,x)
$15:bb39  40            rti
$15:bb3a  21 90         and ($90,x)
$15:bb3c  08            php
$15:bb3d  87 83         sta [$83]
$15:bb3f  e1 70         sbc ($70,x)
$15:bb41  b8            clv
$15:bb42  03 82         ora $82,s
$15:bb44  41 20         eor ($20,x)
$15:bb46  b0 58         bcs $bba0
$15:bb48  28            plp
$15:bb49  14 0e         trb $0e
$15:bb4b  04 80         tsb $80
$15:bb4d  96 1e         stx $1e,y
$15:bb4f  0a            asl a
$15:bb50  87 c3         sta [$c3]
$15:bb52  50 4f         bvc $bba3
$15:bb54  4f 07 82 81   eor $818207
$15:bb58  60            rts
$15:bb59  80 16         bra $bb71
$15:bb5b  83 e1         sta $e1,s
$15:bb5d  40            rti
$15:bb5e  f4 03 4a      pea $4a03
$15:bb61  03 01         ora $01,s
$15:bb63  1b            tcs
$15:bb64  04 06         tsb $06
$15:bb66  1b            tcs
$15:bb67  0d 88 c3      ora $c388
$15:bb6a  a2 15         ldx #$15
$15:bb6c  f9 01 bd      sbc $bd01,y
$15:bb6f  0e 83 0f      asl $0f83
$15:bb72  81 c4         sta ($c4,x)
$15:bb74  e0 31         cpx #$31
$15:bb76  1e 07 80      asl $8007,x
$15:bb79  4a            lsr a
$15:bb7a  d8            cld
$15:bb7b  03 20         ora $20,s
$15:bb7d  5c 3c 1d 0f   jml $0f1d3c
$15:bb81  a1 78         lda ($78,x)
$15:bb83  52 66         eor ($66)
$15:bb85  a5 0f         lda $0f
$15:bb87  06 03         asl $03
$15:bb89  e1 60         sbc ($60,x)
$15:bb8b  f8            sed
$15:bb8c  51 bd         eor ($bd),y
$15:bb8e  d1 0a         cmp ($0a),y
$15:bb90  24 e3         bit $e3
$15:bb92  25 10         and $10
$15:bb94  c1 51         cmp ($51,x)
$15:bb96  38            sec
$15:bb97  d5 49         cmp $49,x
$15:bb99  c4 e3         cpy $e3
$15:bb9b  8c b3 29      sty $29b3
$15:bb9e  c5 f2         cmp $f2
$15:bba0  f9 fe 60      sbc $60fe,y
$15:bba3  84 e3         sty $e3
$15:bba5  fd 00 9c      sbc $9c00,x
$15:bba8  40            rti
$15:bba9  38            sec
$15:bbaa  cc 32 aa      cpy $aa32
$15:bbad  2c 3d 83      bit $833d
$15:bbb0  95 fb         sta $fb,x
$15:bbb2  36 af         rol $af,x
$15:bbb4  61 17         adc ($17,x)
$15:bbb6  a5 d8         lda $d8
$15:bbb8  f8            sed
$15:bbb9  b6 8e         ldx $8e,y
$15:bbbb  5e 4f b1      lsr $b14f,x
$15:bbbe  a7 f6         lda [$f6]
$15:bbc0  52 ef         eor ($ef)
$15:bbc2  d0 4b         bne $bc0f
$15:bbc4  c5 1f         cmp $1f
$15:bbc6  f3 b0         sbc ($b0,s),y
$15:bbc8  fe 31 42      inc $4231,x
$15:bbcb  6b            rtl
$15:bbcc  fe 92 7f      inc $7f92,x
$15:bbcf  62 1f d8      per $93f1
$15:bbd2  05 ff         ora $ff
$15:bbd4  b9 4c ed      lda $ed4c,y
$15:bbd7  47 3f         eor [$3f]
$15:bbd9  df 0f 67 43   cmp $43670f,x
$15:bbdd  7d 40 fa      adc $fa40,x
$15:bbe0  40            rti
$15:bbe1  3b            tsc
$15:bbe2  10 04         bpl $bbe8
$15:bbe4  70 4c         bvs $bc32
$15:bbe6  20 1e 4c      jsr $4c1e
$15:bbe9  14 02         trb $02
$15:bbeb  09 10         ora #$10
$15:bbed  83 50         sta $50,s
$15:bbef  22 50 0a c4   jsl $c40a50
$15:bbf3  02 d0         cop #$d0
$15:bbf5  50 0a         bvc $bc01
$15:bbf7  ef e6 5b dc   sbc $dc5be6
$15:bbfb  93 c3         sta ($c3,s),y
$15:bbfd  e7 b0         sbc [$b0]
$15:bbff  39 7c 02      and $027c,y
$15:bc02  37 00         and [$00],y
$15:bc04  87 c0         sta [$c0]
$15:bc06  20 50 08      jsr $0850
$15:bc09  37 82         and [$82],y
$15:bc0b  27 c0         and [$c0]
$15:bc0d  84 44         sty $44
$15:bc0f  20 52 88      jsr $8852
$15:bc12  04 6a         tsb $6a
$15:bc14  01 16         ora ($16,x)
$15:bc16  11 81         ora ($81),y
$15:bc18  c8            iny
$15:bc19  3d d2 6f      and $6fd2,x
$15:bc1c  6c 3b ff      jmp ($ff3b)
$15:bc1f  f8            sed
$15:bc20  fb            xce
$15:bc21  7a            ply
$15:bc22  2b            pld
$15:bc23  fa            plx
$15:bc24  0f d4 03 d9   ora $d903d4
$15:bc28  00 f8         brk #$f8
$15:bc2a  40            rti
$15:bc2b  23 10         and $10,s
$15:bc2d  0f 97 04 78   ora $780497
$15:bc31  10 88         bpl $bbbb
$15:bc33  1e 82 13      asl $1382,x
$15:bc36  00 d6         brk #$d6
$15:bc38  40            rti
$15:bc39  36 90         rol $90,x
$15:bc3b  0c 82 00      tsb $0082
$15:bc3e  2f d0 0a 11   and $110ad0
$15:bc42  c9 4e         cmp #$4e
$15:bc44  20 7c f5      jsr $f57c
$15:bc47  08            php
$15:bc48  9c 7d 41      stz $417d
$15:bc4b  a9 1f         lda #$1f
$15:bc4d  51 7a         eor ($7a),y
$15:bc4f  cf d8 9e d5   cmp $d59ed8
$15:bc53  f7 37         sbc [$37],y
$15:bc55  bd fc 3c      lda $3cfc,x
$15:bc58  b1 f9         lda ($f9),y
$15:bc5a  04 3e         tsb $3e
$15:bc5c  61 13         adc ($13,x)
$15:bc5e  8f c3 63 b0   sta $b063c3
$15:bc62  78            sei
$15:bc63  7c 12 07      jmp ($0712,x)
$15:bc66  0c 86 42      tsb $4286
$15:bc69  21 10         and ($10,x)
$15:bc6b  09 04         ora #$04
$15:bc6d  02 61         cop #$61
$15:bc6f  01 8f         ora ($8f,x)
$15:bc71  c0 e3         cpy #$e3
$15:bc73  f0 18         beq $bc8d
$15:bc75  7c 30 90      jmp ($9030,x)
$15:bc78  03 c1         ora $c1,s
$15:bc7a  f8            sed
$15:bc7b  42 3c         wdm #$3c
$15:bc7d  11 88         ora ($88),y
$15:bc7f  f5 db         sbc $db,x
$15:bc81  c1 70         cmp ($70,x)
$15:bc83  a0 58         ldy #$58
$15:bc85  20 18 04      jsr $0418
$15:bc88  21 c2         and ($c2,x)
$15:bc8a  20 91 cc      jsr $cc91
$15:bc8d  77 fb         adc [$fb],y
$15:bc8f  01 f0         ora ($f0,x)
$15:bc91  c0 78         cpy #$78
$15:bc93  0b            phd
$15:bc94  29 df         and #$df
$15:bc96  f0 63         beq $bcfb
$15:bc98  f6 11         inc $11,x
$15:bc9a  08            php
$15:bc9b  fc 3e 3f      jsr ($3f3e,x)
$15:bc9e  07 86         ora [$86]
$15:bca0  c0 4f         cpy #$4f
$15:bca2  22 0f 0e 07   jsl $070e0f
$15:bca6  82 81 f0      brl $ad2a
$15:bca9  17 01         ora [$01],y
$15:bcab  0c 61 f0      tsb $f061
$15:bcae  38            sec
$15:bcaf  19 ec be      ora $beec,y
$15:bcb2  f0 ff         beq $bcb3
$15:bcb4  14 6a         trb $6a
$15:bcb6  21 f0         and ($f0,x)
$15:bcb8  b0 5c         bcs $bd16
$15:bcba  38            sec
$15:bcbb  05 80         ora $80
$15:bcbd  0f 18 dc 63   ora $63dc18
$15:bcc1  d0 03         bne $bcc6
$15:bcc3  30 19         bmi $bcde
$15:bcc5  87 00         sta [$00]
$15:bcc7  5a            phy
$15:bcc8  39 c5 f2      and $f2c5,y
$15:bccb  f8            sed
$15:bccc  ae 0c 94      ldx $940c
$15:bccf  43 05         eor $05,s
$15:bcd1  44 e3 6e      mvp $6e,$e3
$15:bcd4  af 9c 65 78   lda $78659c
$15:bcd8  03 c1         ora $c1,s
$15:bcda  7a            ply
$15:bcdb  5f e6 18 4e   eor $4e18e6,x
$15:bcdf  3f cb f1 9c   and $9cf1cb,x
$15:bce3  2b            pld
$15:bce4  7d 7d f9      adc $f97d,x
$15:bce7  a8            tay
$15:bce8  b7 5b         lda [$5b],y
$15:bcea  01 6a         ora ($6a,x)
$15:bcec  ad ce 24      lda $24ce
$15:bcef  95 1a         sta $1a,x
$15:bcf1  64 c2         stz $c2
$15:bcf3  59 94 d6      eor $d694,y
$15:bcf6  4e e8 f1      lsr $f1e8
$15:bcf9  6c 66 32      jmp ($3266)
$15:bcfc  a5 44         lda $44
$15:bcfe  90 c0         bcc $bcc0
$15:bd00  e4 f2         cpx $f2
$15:bd02  3b            tsc
$15:bd03  7d 0c 10      adc $100c,x
$15:bd06  1e fc 07      asl $07fc,x
$15:bd09  1e d1 58      asl $58d1,x
$15:bd0c  ac 40 25      ldy $2540
$15:bd0f  1e 89 c4      asl $c489,x
$15:bd12  83 b9         sta $b9,s
$15:bd14  00 ad         brk #$ad
$15:bd16  44 25 53      mvp $53,$25
$15:bd19  4e ef 8a      lsr $8aef
$15:bd1c  b1 30         lda ($30),y
$15:bd1e  98            tya
$15:bd1f  52 22         eor ($22)
$15:bd21  18            clc
$15:bd22  0e 27 93      asl $9327
$15:bd25  cc 27 0f      cpy $0f27
$15:bd28  b7 0f         lda [$0f],y
$15:bd2a  ef 01 f1 c3   sbc $c3f101
$15:bd2e  20 11 e3      jsr $e311
$15:bd31  98            tya
$15:bd32  42 63         wdm #$63
$15:bd34  11 08         ora ($08),y
$15:bd36  c4 19         cpy $19
$15:bd38  10 11         bpl $bd4b
$15:bd3a  b8            clv
$15:bd3b  10 ec         bpl $bd29
$15:bd3d  23 ca         and $ca,s
$15:bd3f  20 88 0e      jsr $0e88
$15:bd42  00 ea         brk #$ea
$15:bd44  10 18         bpl $bd5e
$15:bd46  3c 72 3f      bit $3f72,x
$15:bd49  1c 8f 12      trb $128f
$15:bd4c  c0 04         cpy #$04
$15:bd4e  1a            inc a
$15:bd4f  ac a7 cb      ldy $cba7
$15:bd52  39 ca da      and $daca,y
$15:bd55  77 a8         adc [$a8],y
$15:bd57  1a            inc a
$15:bd58  ec a7 db      cpx $dba7
$15:bd5b  33 cb         and ($cb,s),y
$15:bd5d  e8            inx
$15:bd5e  49 22         eor #$22
$15:bd60  57 48         eor [$48],y
$15:bd62  d5 f2         cmp $f2,x
$15:bd64  35 14         and $14,x
$15:bd66  c5 49         cmp $49
$15:bd68  e2 f7         sep #$f7
$15:bd6a  38            sec
$15:bd6b  fd e2 33      sbc $33e2,x
$15:bd6e  37 8f         and [$8f],y
$15:bd70  b7 82         lda [$82],y
$15:bd72  fd 00 a1      sbc $a100,x
$15:bd75  1c 94 e2      trb $e294
$15:bd78  07 cf         ora [$cf]
$15:bd7a  55 89         eor $89,x
$15:bd7c  c7 d0         cmp [$d0]
$15:bd7e  5e 93 f5      lsr $f593,x
$15:bd81  27 ad         and [$ad]
$15:bd83  7d 8d ed      adc $ed8d,x
$15:bd86  7f 74 7b e7   adc $e77b74,x
$15:bd8a  c4 93         cpy $93
$15:bd8c  40            rti
$15:bd8d  a1 c8         lda ($c8,x)
$15:bd8f  e5 91         sbc $91
$15:bd91  f8            sed
$15:bd92  c1 b8         cmp ($b8,x)
$15:bd94  23 f2         and $f2,s
$15:bd96  01 7b         ora ($7b,x)
$15:bd98  5c 2f 93 89   jml $89932f
$15:bd9c  c4 42         cpy $42
$15:bd9e  21 00         and ($00,x)
$15:bda0  1f 2c 13 09   ora $09132c,x
$15:bda4  88            dey
$15:bda5  b4 7c         ldy $7c,x
$15:bda7  3a            dec a
$15:bda8  1f 0b 07 c3   ora $c3070b,x
$15:bdac  50 4f         bvc $bdfd
$15:bdae  68            pla
$15:bdaf  e1 20         sbc ($20,x)
$15:bdb1  3f 05 a0 a0   and $a0a005,x
$15:bdb5  7a            ply
$15:bdb6  01 c1         ora ($c1,x)
$15:bdb8  01 38         ora ($38,x)
$15:bdba  8c 02 07      sty $0702
$15:bdbd  03 87         ora $87,s
$15:bdbf  c3 e2         cmp $e2,s
$15:bdc1  30 d8         bmi $bd9b
$15:bdc3  8d 78 7c      sta $7c78
$15:bdc6  27 10         and [$10]
$15:bdc8  3b            tsc
$15:bdc9  01 d4         ora ($d4,x)
$15:bdcb  20 30 f8      jsr $f830
$15:bdce  1c 4d 12      trb $124d
$15:bdd1  1c 1f 08      trb $081f
$15:bdd4  30 b0         bmi $bd86
$15:bdd6  09 11         ora #$11
$15:bdd8  c0 78         cpy #$78
$15:bdda  3c 1f 0e      bit $0e1f,x
$15:bddd  04 43         tsb $43
$15:bddf  68            pla
$15:bde0  5e 34 b0      lsr $b034,x
$15:bde3  24 87         bit $87
$15:bde5  c1 80         cmp ($80,x)
$15:bde7  f8            sed
$15:bde8  26 42         rol $42
$15:bdea  8d ee 04      sta $04ee
$15:bded  31 24         and ($24),y
$15:bdef  28            plp
$15:bdf0  84 80         sty $80
$15:bdf2  ff 55 38 c0   sbc $c03855,x
$15:bdf6  87 9c         sta [$9c]
$15:bdf8  40            rti
$15:bdf9  2f 90 0f f2   and $f20f90
$15:bdfd  ec 09 21      cpx $2109
$15:be00  54 a2 40      mvn $40,$a2
$15:be03  37 4b         and [$4b],y
$15:be05  b0 a2         bcs $bda9
$15:be07  33 05         and ($05,s),y
$15:be09  7a            ply
$15:be0a  13 8c         ora ($8c,s),y
$15:be0c  12 d8         ora ($d8)
$15:be0e  6f 8d 70 65   adc $65708d
$15:be12  83 94         sta $94,s
$15:be14  9a            txs
$15:be15  a3 c6         lda $c6,s
$15:be17  da            phx
$15:be18  68            pla
$15:be19  e4 70         cpx $70
$15:be1b  08            php
$15:be1c  5c 32 2d 19   jml $192d32
$15:be20  9d ce a1      sta $a1ce,x
$15:be23  f0 78         beq $be9d
$15:be25  c4 0a         cpy $0a
$15:be27  6d 35 88      adc $8835
$15:be2a  6c e4 03      jmp ($03e4)
$15:be2d  e2 80         sep #$80
$15:be2f  c2 20         rep #$20
$15:be31  d2 48         cmp ($48)
$15:be33  dc 86 2f      jml [$2f86]
$15:be36  14 84         trb $84
$15:be38  cd 38 9d      cmp $9d38
$15:be3b  e9 85 53      sbc #$5385
$15:be3e  65 e9         adc $e9
$15:be40  ce d7 3b      dec $3bd7
$15:be43  9b            txy
$15:be44  2d 16 62      and $6216
$15:be47  85 6d         sta $6d
$15:be49  d7 c0         cmp [$c0],y
$15:be4b  78            sei
$15:be4c  b0 c9         bcs $be17
$15:be4e  f4 03 0d      pea $0d03
$15:be51  02 c3         cop #$c3
$15:be53  c4 fc         cpy $fc
$15:be55  76 5e         ror $5e,x
$15:be57  de 17 d7      dec $d717,x
$15:be5a  28            plp
$15:be5b  c9 c2 e0      cmp #$e0c2
$15:be5e  17 7a         ora [$7a],y
$15:be60  05 7e         ora $7e
$15:be62  a5 27         lda $27
$15:be64  9e d4 ed      stz $edd4,x
$15:be67  d7 fa         cmp [$fa],y
$15:be69  05 0e         ora $0e
$15:be6b  81 5c         sta ($5c,x)
$15:be6d  aa            tax
$15:be6e  47 23         eor [$23]
$15:be70  94 a9         sty $a9,x
$15:be72  55 45         eor $45,x
$15:be74  e2 10         sep #$10
$15:be76  58            cli
$15:be77  04 3a         tsb $3a
$15:be79  81 3c         sta ($3c,x)
$15:be7b  a0 4f         ldy #$4f
$15:be7d  a4 90         ldy $90
$15:be7f  3d f5 82      and $82f5,x
$15:be82  19 88 c5      ora $c588,y
$15:be85  5b            tcd
$15:be86  3a            dec a
$15:be87  50 cb         bvc $be54
$15:be89  d6 52         dec $52,x
$15:be8b  a5 04         lda $04
$15:be8d  f9 c1 3d      sbc $3dc1,y
$15:be90  52 d4         eor ($d4)
$15:be92  48            pha
$15:be93  40            rti
$15:be94  a1 51         lda ($51,x)
$15:be96  08            php
$15:be97  f6 d3         inc $d3,x
$15:be99  75 44         adc $44,x
$15:be9b  e9 7b 3c      sbc #$3c7b
$15:be9e  50 c8         bvc $be68
$15:bea0  1c 51 08      trb $0851
$15:bea3  10 0b         bpl $beb0
$15:bea5  f4 02 84      pea $8402
$15:bea8  72 53         adc ($53)
$15:beaa  88            dey
$15:beab  1f 3d 68 27   ora $27683d,x
$15:beaf  1f 41 7a 4f   ora $4f7a41,x
$15:beb3  d4 9e         pei ($9e)
$15:beb5  b5 f6         lda $f6,x
$15:beb7  37 b5         and [$b5],y
$15:beb9  fd d1 ef      sbc $efd1,x
$15:bebc  9f 05 9c 7e   sta $7e9c05,x
$15:bec0  41 0f         eor ($0f,x)
$15:bec2  98            tya
$15:bec3  44 e3 f2      mvp $f2,$e3
$15:bec6  d9 ed 9e      cmp $9eed,y
$15:bec9  df 40 a1 82   cmp $82a140,x
$15:becd  ce 41 00      dec $0041
$15:bed0  98            tya
$15:bed1  40            rti
$15:bed2  63 f0         adc $f0,s
$15:bed4  39 fc c6      and $c6fc,y
$15:bed7  ff 60 b1 83   sbc $83b160,x
$15:bedb  4b            phk
$15:bedc  e1 08         sbc ($08,x)
$15:bede  f0 46         beq $bf26
$15:bee0  22 17 0f 45   jsl $450f17
$15:bee4  e2 99         sep #$99
$15:bee6  6c 82 61      jmp ($6182)
$15:bee9  01 67         ora ($67,x)
$15:beeb  08            php
$15:beec  80 46         bra $bf34
$15:beee  30 1f         bmi $bf0f
$15:bef0  0c 07 e3      tsb $e307
$15:bef3  31 fc         and ($fc),y
$15:bef5  86 63         stx $63
$15:bef7  01 a5         ora ($a5,x)
$15:bef9  df f0 63 f6   cmp $f663f0,x
$15:befd  11 38         ora ($38),y
$15:beff  e4 32         cpx $32
$15:bf01  3f 05 86 c0   and $c08605,x
$15:bf05  60            rts
$15:bf06  30 38         bmi $bf40
$15:bf08  19 e4 38      ora $38e4,y
$15:bf0b  1e 0a 07      asl $070a,x
$15:bf0e  c2 01         rep #$01
$15:bf10  1c 17 04      trb $0417
$15:bf13  0e 1e 7b      asl $7b1e
$15:bf16  13 e0         ora ($e0,s),y
$15:bf18  fd e1 fe      sbc $fee1,x
$15:bf1b  28            plp
$15:bf1c  d6 42         dec $42,x
$15:bf1e  e1 60         sbc ($60,x)
$15:bf20  f8            sed
$15:bf21  70 2c         bvs $bf4f
$15:bf23  18            clc
$15:bf24  00 59         brk #$59
$15:bf26  c1 e1         cmp ($e1,x)
$15:bf28  f0 48         beq $bf72
$15:bf2a  f4 02 e0      pea $e002
$15:bf2d  4e 0c 07      lsr $070c
$15:bf30  83 00         sta $00,s
$15:bf32  a9 10 68      lda #$6810
$15:bf35  ee a7 1f      inc $1fa7
$15:bf38  ea            nop
$15:bf39  a7 1a         lda [$1a]
$15:bf3b  71 92         adc ($92),y
$15:bf3d  88            dey
$15:bf3e  60            rts
$15:bf3f  a8            tay
$15:bf40  9c 6b e4      stz $e46b
$15:bf43  02 a9         cop #$a9
$15:bf45  44 a2 7f      mvp $7f,$a2
$15:bf48  a0 1f         ldy #$1f
$15:bf4a  e5 88         sbc $88
$15:bf4c  5f 18 82 b1   eor $b18218,x
$15:bf50  00 68         brk #$68
$15:bf52  4e 2f 97      lsr $972f
$15:bf55  cd d2 ce      cmp $ced2
$15:bf58  96 a0         stx $a0,y
$15:bf5a  af 26 2c ff   lda $ff2c26
$15:bf5e  af 73 2a dc   lda $dc2a73
$15:bf62  e2 ff         sep #$ff
$15:bf64  0f 9b c2 ef   ora $efc29b
$15:bf68  b0 29         bcs $bf93
$15:bf6a  7c 02 36      jmp ($3602,x)
$15:bf6d  9e 08 04      stz $0408,x
$15:bf70  32 81         and ($81)
$15:bf72  27 1f         and [$1f]
$15:bf74  0c 22 c1      tsb $c122
$15:bf77  02 a4         cop #$a4
$15:bf79  40            rti
$15:bf7a  23 50         and $50,s
$15:bf7c  08            php
$15:bf7d  b4 02         ldy $02,x
$15:bf7f  09 de         ora #$de
$15:bf81  a7 76         lda [$76]
$15:bf83  a3 9f         lda $9f,s
$15:bf85  2f c7 7b c1   and $c17bc7
$15:bf89  7a            ply
$15:bf8a  c0 7b         cpy #$7b
$15:bf8c  20 1f 88      jsr $881f
$15:bf8f  06 80         asl $80
$15:bf91  82 10 2f      brl $eea4
$15:bf94  27 02         and [$02]
$15:bf96  11 04         ora ($04),y
$15:bf98  90 42         bcc $bfdc
$15:bf9a  b0 12         bcs $bfae
$15:bf9c  c8            iny
$15:bf9d  06 d2         asl $d2
$15:bf9f  01 90         ora ($90,x)
$15:bfa1  80 70         bra $c013
$15:bfa3  3e f6 4d      rol $4df6,x
$15:bfa6  bd c3 ff      lda $ffc3,x
$15:bfa9  1f b7 c5 ff   ora $ffc5b7,x
$15:bfad  50 5a         bvc $c009
$15:bfaf  fc 02 6f      jsr ($6f02,x)
$15:bfb2  00 87         brk #$87
$15:bfb4  98            tya
$15:bfb5  46 9f         lsr $9f
$15:bfb7  01 80         ora ($80,x)
$15:bfb9  50 22         bvc $bfdd
$15:bfbb  1c 08 28      trb $2808
$15:bfbe  b0 26         bcs $bfe6
$15:bfc0  b0 09         bcs $bfcb
$15:bfc2  6c 02 13      jmp ($1302)
$15:bfc5  b4 c9         ldy $c9,x
$15:bfc7  6a            ror a
$15:bfc8  24 9e         bit $9e
$15:bfca  3f ce cf 83   and $83cfce,x
$15:bfce  ec 8a f4      cpx $f48a
$15:bfd1  e2 dc         sep #$dc
$15:bfd3  a9 64         lda #$64
$15:bfd5  b2 e1         lda ($e1)
$15:bfd7  61 87         adc ($87,x)
$15:bfd9  f0 f3         beq $bfce
$15:bfdb  f1 68         sbc ($68),y
$15:bfdd  7d 3a 3f      adc $3f3a,x
$15:bfe0  0a            asl a
$15:bfe1  af c2 2f d1   lda $d12fc2
$15:bfe5  09 e2         ora #$e2
$15:bfe7  94 13         sty $13,x
$15:bfe9  61 7e         adc ($7e,x)
$15:bfeb  80 50         bra $c03d
$15:bfed  8e 4a 71      stx $714a
$15:bff0  03 e7         ora $e7,s
$15:bff2  a2 84         ldx #$84
$15:bff4  e3 e8         sbc $e8,s
$15:bff6  2f 49 fa 93   and $93fa49
$15:bffa  d6 be         dec $be,x
$15:bffc  c6 f6         dec $f6
$15:bffe  bf ba 3d f3   lda $f33dba,x
$15:c002  e0 a5         cpx #$a5
$15:c004  84 42         sty $42
$15:c006  21 90         and ($90,x)
$15:c008  c8            iny
$15:c009  24 16         bit $16
$15:c00b  0f 08 87 c4   ora $c48708
$15:c00f  07 21         ora [$21]
$15:c011  1f 90 0b d2   ora $d20b90,x
$15:c015  1d 0f 82      ora $820f,x
$15:c018  43 20         eor $20,s
$15:c01a  11 02         ora ($02),y
$15:c01c  48            pha
$15:c01d  8f 84 14 78   sta $781484
$15:c021  0c 05 83      tsb $8305
$15:c024  c1 b0         cmp ($b0,x)
$15:c026  f7 57         sbc [$57],y
$15:c028  bf 1b 02 7b   lda $7b021b,x
$15:c02c  40            rti
$15:c02d  2c 14 0f      bit $0f14
$15:c030  87 bb         sta [$bb]
$15:c032  fd 5c fe      sbc $fe5c,x
$15:c035  40            rti
$15:c036  60            rts
$15:c037  30 38         bmi $c071
$15:c039  19 bc 20      ora $20bc,y
$15:c03c  07 10         ora [$10]
$15:c03e  86 0e         stx $0e
$15:c040  4a            lsr a
$15:c041  bf 23 37 81   lda $813723,x
$15:c045  c0 60         cpy #$60
$15:c047  67 50         adc [$50]
$15:c049  80 12         bra $c05d
$15:c04b  0f 83 e3 31   ora $31e383
$15:c04f  21 55         and ($55,x)
$15:c051  3c 15 0f      bit $0f15,x
$15:c054  a6 a0         ldx $a0
$15:c056  a8            tay
$15:c057  45 60         eor $60
$15:c059  32 a7         and ($a7)
$15:c05b  83 e1         sta $e1,s
$15:c05d  46 f7         lsr $f7
$15:c05f  4e 32 51      lsr $5132
$15:c062  0c 15 13      tsb $1315
$15:c065  8d 38 be      sta $be38
$15:c068  5f 20 0a f4   eor $f40a20,x
$15:c06c  be 7f 97      ldx $977f,y
$15:c06f  e1 38         sbc ($38,x)
$15:c071  ff 40 16 e0   sbc $e01640,x
$15:c075  c5 06         cmp $06
$15:c077  01 ac         ora ($ac,x)
$15:c079  5a            phy
$15:c07a  a9 44         lda #$44
$15:c07c  5c b3 0d 16   jml $160db3
$15:c080  a2 c0         ldx #$c0
$15:c082  39 dc ca      and $cadc,y
$15:c085  b7 38         lda [$38],y
$15:c087  a7 c7         lda [$c7]
$15:c089  ef 70 7a f4   sbc $f47a70
$15:c08d  06 6f         asl $6f
$15:c08f  00 8f         brk #$8f
$15:c091  c0 20         cpy #$20
$15:c093  a8            tay
$15:c094  71 93         adc ($93),y
$15:c096  c0 62         cpy #$62
$15:c098  12 08         ora ($08)
$15:c09a  25 42         and $42
$15:c09c  03 34         ora $34,s
$15:c09e  80 4b         bra $c0eb
$15:c0a0  60            rts
$15:c0a1  10 93         bpl $c036
$15:c0a3  a8            tay
$15:c0a4  77 a9         adc [$a9],y
$15:c0a6  dd a8 e7      cmp $e7a8,x
$15:c0a9  fb            xce
$15:c0aa  e1 ec         sbc ($ec,x)
$15:c0ac  e8            inx
$15:c0ad  6f a8 1f 48   adc $481fa8
$15:c0b1  07 62         ora [$62]
$15:c0b3  01 e0         ora ($e0,x)
$15:c0b5  80 4c         bra $c103
$15:c0b7  20 5e 4c      jsr $4c5e
$15:c0ba  14 02         trb $02
$15:c0bc  09 10         ora #$10
$15:c0be  83 50         sta $50,s
$15:c0c0  22 50 0a c4   jsl $c40a50
$15:c0c4  02 d0         cop #$d0
$15:c0c6  4d 0b bd      eor $bd0b
$15:c0c9  93 6f         sta ($6f,s),y
$15:c0cb  70 cf         bvs $c09c
$15:c0cd  cf fe f0 fd   cmp $fdf0fe
$15:c0d1  ec 0a df      cpx $df0a
$15:c0d4  00 9f         brk #$9f
$15:c0d6  c0 21         cpy #$21
$15:c0d8  70 08         bvs $c0e2
$15:c0da  c4 02         cpy $02
$15:c0dc  9f 03 90 50   sta $509003,x
$15:c0e0  21 1a         and ($1a,x)
$15:c0e2  08            php
$15:c0e3  10 b0         bpl $c095
$15:c0e5  2b            pld
$15:c0e6  50 01         bvc $c0e9
$15:c0e8  40            rti
$15:c0e9  41 b6         eor ($b6,x)
$15:c0eb  99 2d 44      sta $442d,y
$15:c0ee  93 e7         sta ($e7,s),y
$15:c0f0  e9 e9         sbc #$e9
$15:c0f2  e8            inx
$15:c0f3  6d 99 5f      adc $5f99
$15:c0f6  9c 5b 15      stz $155b
$15:c0f9  2c d6 5c      bit $5cd6
$15:c0fc  2c 30 fe      bit $fe30
$15:c0ff  1c 7e 0d      trb $0d7e
$15:c102  0f 97 43 f1   ora $f14397
$15:c106  53 f8         eor ($f8,s),y
$15:c108  46 fa         lsr $fa
$15:c10a  21 fc         and ($fc,x)
$15:c10c  80 5c         bra $c16a
$15:c10e  11 e1         ora ($e1),y
$15:c110  7e 80 50      ror $5080,x
$15:c113  8e 4a 71      stx $714a
$15:c116  03 e7         ora $e7,s
$15:c118  a0 04         ldy #$04
$15:c11a  e3 e8         sbc $e8,s
$15:c11c  2f 49 fa 93   and $93fa49
$15:c120  d6 be         dec $be,x
$15:c122  c6 f6         dec $f6
$15:c124  bf ba 3d f3   lda $f33dba,x
$15:c128  e1 e3         sbc ($e3,x)
$15:c12a  8f c8 21 f3   sta $f321c8
$15:c12e  0f 9f 7e 1b   ora $1b7e9f
$15:c132  1d 83 c3      ora $c383,x
$15:c135  e0 10         cpx #$10
$15:c137  30 f1         bmi $c12a
$15:c139  c8            iny
$15:c13a  28            plp
$15:c13b  17 0f         ora [$0f],y
$15:c13d  0f fe 07 1f   ora $1f07fe
$15:c141  80 8e         bra $c0d1
$15:c143  17 e1         ora [$e1],y
$15:c145  08            php
$15:c146  f0 46         beq $c18e
$15:c148  22 17 0f 05   jsl $050f17
$15:c14c  c2 81         rep #$81
$15:c14e  60            rts
$15:c14f  a0 60         ldy #$60
$15:c151  2c 16 09      bit $0916
$15:c154  04 82         tsb $82
$15:c156  01 08         ora ($08,x)
$15:c158  80 46         bra $c1a0
$15:c15a  30 1f         bmi $c17b
$15:c15c  03 18         ora $18,s
$15:c15e  f8            sed
$15:c15f  2c 06 80      bit $8006
$15:c162  2e 0f 7f      rol $7f0f
$15:c165  c3 8d         cmp $8d,s
$15:c167  d8            cld
$15:c168  44 e3 90      mvp $90,$e3
$15:c16b  c8            iny
$15:c16c  f8            sed
$15:c16d  dc a0 30      jml [$30a0]
$15:c170  18            clc
$15:c171  1c 0f 87      trb $870f
$15:c174  e3 a1         sbc $a1,s
$15:c176  fc e0 11      jsr ($11e0,x)
$15:c179  c1 70         cmp ($70,x)
$15:c17b  40            rti
$15:c17c  07 02         ora [$02]
$15:c17e  7d 03 e0      adc $e003,x
$15:c181  7d f1 fe      adc $fef1,x
$15:c184  2c d6 42      bit $42d6
$15:c187  e1 60         sbc ($60,x)
$15:c189  f8            sed
$15:c18a  70 3c         bvs $c1c8
$15:c18c  10 0c         bpl $c19a
$15:c18e  06 00         asl $00
$15:c190  1c 38 7c      trb $7c38
$15:c193  7c 13 3d      jmp ($3d13,x)
$15:c196  00 b8         brk #$b8
$15:c198  13 82         ora ($82,s),y
$15:c19a  00 98         brk #$98
$15:c19c  25 50         and $50
$15:c19e  ce 2f 97      dec $972f
$15:c1a1  c8            iny
$15:c1a2  04 e3         tsb $e3
$15:c1a4  25 10         and $10
$15:c1a6  c1 51         cmp ($51,x)
$15:c1a8  38            sec
$15:c1a9  db            stp
$15:c1aa  ab            plb
$15:c1ab  e7 19         sbc [$19]
$15:c1ad  5e 00 f0      lsr $f000,x
$15:c1b0  5e 97 f9      lsr $f997,x
$15:c1b3  86 13         stx $13
$15:c1b5  8f f2 fc 67   sta $67fcf2
$15:c1b9  0b            phd
$15:c1ba  e2 aa         sep #$aa
$15:c1bc  51 16         eor ($16),y
$15:c1be  76 b2         ror $b2,x
$15:c1c0  05 80         ora $80
$15:c1c2  31 24         and ($24),y
$15:c1c4  00 20         brk #$20
$15:c1c6  80 40         bra $c208
$15:c1c8  2f d0 0a 13   and $130ad0
$15:c1cc  c9 5e         cmp #$5e
$15:c1ce  20 fc f0      jsr $f0fc
$15:c1d1  00 bc         brk #$bc
$15:c1d3  7c 05 e1      jmp ($e105,x)
$15:c1d6  3f 12 78 d7   and $d77812,x
$15:c1da  c8            iny
$15:c1db  de 57 f3      dec $f357,x
$15:c1de  47 9e         eor [$9e]
$15:c1e0  7d 15 e9      adc $e915,x
$15:c1e3  bf 56 7b 73   lda $737b56,x
$15:c1e7  d9 de fe      cmp $fede,y
$15:c1ea  f7 87         sbc [$87],y
$15:c1ec  80 7c         bra $c26a
$15:c1ee  25 e2         and $e2
$15:c1f0  3f 1a 79 17   and $17791a,x
$15:c1f4  ca            dex
$15:c1f5  de 67 f3      dec $f367,x
$15:c1f8  c7 a2         cmp [$a2]
$15:c1fa  7d 35 ea      adc $ea35,x
$15:c1fd  bf 60 7b 3c   lda $3c7b60,x
$15:c201  20 70 08      jsr $0870
$15:c204  2c 0e 1b      bit $1b0e
$15:c207  03 87         ora $87,s
$15:c209  40            rti
$15:c20a  61 f0         adc ($f0,x)
$15:c20c  08            php
$15:c20d  bc 02 47      ldy $4702,x
$15:c210  0b            phd
$15:c211  9b            txy
$15:c212  40            rti
$15:c213  60            rts
$15:c214  10 78         bpl $c28e
$15:c216  1c 3c 02      trb $023c
$15:c219  10 18         bpl $c233
$15:c21b  fc 00 0c      jsr ($0c00,x)
$15:c21e  13 f8         ora ($f8,s),y
$15:c220  5c f2 03 2e   jml $2e03f2
$15:c224  a0 50         ldy #$50
$15:c226  24 1a         bit $1a
$15:c228  08            php
$15:c229  07 02         ora [$02]
$15:c22b  81 80         sta ($80,x)
$15:c22d  f8            sed
$15:c22e  40            rti
$15:c22f  37 00         and [$00],y
$15:c231  f0 c0         beq $c1f3
$15:c233  5c 26 01 50   jml $500126
$15:c237  d0 70         bne $c2a9
$15:c239  38            sec
$15:c23a  1e 0c 07      asl $070c,x
$15:c23d  80 26         bra $c265
$15:c23f  3b            tsc
$15:c240  0c 05 e2      tsb $e205
$15:c243  61 c8         adc ($c8,x)
$15:c245  77 84         adc [$84],y
$15:c247  3a            dec a
$15:c248  13 06         ora ($06,s),y
$15:c24a  7b            tdc
$15:c24b  0c 0e 19      tsb $190e
$15:c24e  0d 89 40      ora $4089
$15:c251  a0 30         ldy #$30
$15:c253  d8            cld
$15:c254  63 fc         adc $fc,s
$15:c256  21 30         and ($30,x)
$15:c258  77 b0         adc [$b0],y
$15:c25a  c7 e1         cmp [$e1]
$15:c25c  91 38         sta ($38),y
$15:c25e  94 36         sty $36,x
$15:c260  03 1e         ora $1e,s
$15:c262  23 84         and $84,s
$15:c264  03 01         ora $01,s
$15:c266  80 e0         bra $c248
$15:c268  08            php
$15:c269  42 41         wdm #$41
$15:c26b  d0 f0         bne $c25d
$15:c26d  42 3a         wdm #$3a
$15:c26f  10 8c         bpl $c1fd
$15:c271  46 e2         lsr $e2
$15:c273  b1 a8         lda ($a8),y
$15:c275  28            plp
$15:c276  80 8c         bra $c204
$15:c278  04 60         tsb $60
$15:c27a  56 1f         lsr $1f,x
$15:c27c  81 9c         sta ($9c,x)
$15:c27e  37 17         and [$17],y
$15:c280  0d 45 81      ora $8145
$15:c283  9f e7 ff 38   sta $38ffe7,x
$15:c287  fa            plx
$15:c288  0b            phd
$15:c289  d2 7e         cmp ($7e)
$15:c28b  a4 f5         ldy $f5
$15:c28d  af b1 bd af   lda $afbdb1
$15:c291  ee 8f 7c      inc $7c8f
$15:c294  f8            sed
$15:c295  2b            pld
$15:c296  c3 7e         cmp $7e,s
$15:c298  2c f2 e7      bit $e7f2
$15:c29b  93 bc         sta ($bc,s),y
$15:c29d  fd e7 0f      sbc $0fe7,x
$15:c2a0  40            rti
$15:c2a1  fa            plx
$15:c2a2  4b            phk
$15:c2a3  d4 7e         pei ($7e)
$15:c2a5  b4 f6         ldy $f6,x
$15:c2a7  f4 43 e0      pea $e043
$15:c2aa  11 b8         ora ($b8),y
$15:c2ac  94 3e         sty $3e,x
$15:c2ae  19 04 85      ora $8504,y
$15:c2b1  cd a0 32      cmp $32a0
$15:c2b4  f8            sed
$15:c2b5  24 36         bit $36
$15:c2b7  1d 0b 86      ora $860b,x
$15:c2ba  40            rti
$15:c2bb  22 11 28 63   jsl $632811
$15:c2bf  f8            sed
$15:c2c0  21 13         and ($13,x)
$15:c2c2  08            php
$15:c2c3  04 e2         tsb $e2
$15:c2c5  09 30         ora #$30
$15:c2c7  87 40         sta [$40]
$15:c2c9  1f c1 a8 8c   ora $8ca8c1,x
$15:c2cd  74 27         stz $27,x
$15:c2cf  16 88         asl $88,x
$15:c2d1  87 c2         sta [$c2]
$15:c2d3  11 60         ora ($60),y
$15:c2d5  c8            iny
$15:c2d6  7e 24 18      ror $1824,x
$15:c2d9  8b            phb
$15:c2da  87 a3         sta [$a3]
$15:c2dc  21 18         and ($18,x)
$15:c2de  f8            sed
$15:c2df  4e 3f 11      lsr $113f
$15:c2e2  0f c4 23 e1   ora $e123c4
$15:c2e6  90 84         bcc $c26c
$15:c2e8  48            pha
$15:c2e9  23 17         and $17,s
$15:c2eb  08            php
$15:c2ec  86 42         stx $42
$15:c2ee  c1 19         cmp ($19,x)
$15:c2f0  8a            txa
$15:c2f1  45 21         eor $21
$15:c2f3  d1 a8         cmp ($a8),y
$15:c2f5  23 bc         and $bc,s
$15:c2f7  20 70 c8      jsr $c870
$15:c2fa  5c 0a c5 15   jml $15c50a
$15:c2fe  97 c0         sta [$c0],y
$15:c300  a2 90         ldx #$90
$15:c302  f8            sed
$15:c303  74 7e         stz $7e,x
$15:c305  09 1f         ora #$1f
$15:c307  77 03         adc [$03],y
$15:c309  f8            sed
$15:c30a  20 51 c8      jsr $c851
$15:c30d  a5 a2         lda $a2
$15:c30f  05 70         ora $70
$15:c311  b4 66         ldy $66,x
$15:c313  34 17         bit $17,x
$15:c315  09 01         ora #$01
$15:c317  44 3a 16      mvp $16,$3a
$15:c31a  0f 86 02 c1   ora $c10286
$15:c31e  80 c0         bra $c2e0
$15:c320  50 3a         bvc $c35c
$15:c322  19 86 78      ora $7886,y
$15:c325  4c 0a c1      jmp $c10a
$15:c328  20 a8 44      jsr $44a8
$15:c32b  28            plp
$15:c32c  17 08         ora [$08],y
$15:c32e  01 a4         ora ($a4,x)
$15:c330  24 0c         bit $0c
$15:c332  ef 3f 79 c3   sbc $c3793f
$15:c336  d0 3e         bne $c376
$15:c338  92 f5         sta ($f5)
$15:c33a  1f ad 3d 8b   ora $8b3dad,x
$15:c33e  ed 6f 73      sbc $736f
$15:c341  fb            xce
$15:c342  e3 c1         sbc $c1,s
$15:c344  3e 1a f1      rol $f11a,x
$15:c347  5f 90 3c 9b   eor $9b3c90,x
$15:c34b  e7 df         sbc [$df]
$15:c34d  37 fa         and [$fa],y
$15:c34f  7f d5 0d 05   adc $050dd5,x
$15:c353  82 40 e1      brl $a496
$15:c356  30 78         bmi $c3d0
$15:c358  a2 a2         ldx #$a2
$15:c35a  20 70 08      jsr $0870
$15:c35d  3c 06 11      bit $1106,x
$15:c360  10 54         bpl $c3b6
$15:c362  45 02         eor $02
$15:c364  81 a0         sta ($a0,x)
$15:c366  90 6c         bcc $c3d4
$15:c368  26 0a         rol $0a
$15:c36a  88            dey
$15:c36b  c0 40         cpy #$40
$15:c36d  38            sec
$15:c36e  0d 80 80      ora $8080
$15:c371  47 60         eor [$60]
$15:c373  53 28         eor ($28,s),y
$15:c375  9c fe 00      stz $00fe
$15:c378  f3 08         sbc ($08,s),y
$15:c37a  fc 02 1e      jsr ($1e02,x)
$15:c37d  c8            iny
$15:c37e  14 78         trb $78
$15:c380  40            rti
$15:c381  a0 11         ldy #$11
$15:c383  38            sec
$15:c384  62 a2 be      per $8229
$15:c387  10 0a         bpl $c393
$15:c389  84 03         sty $03
$15:c38b  31 60         and ($60),y
$15:c38d  ce 05 02      dec $0205
$15:c390  01 5c         ora ($5c,x)
$15:c392  80 7e         bra $c412
$15:c394  24 0a         bit $0a
$15:c396  81 f0         sta ($f0,x)
$15:c398  07 c2         ora [$c2]
$15:c39a  c1 00         cmp ($00,x)
$15:c39c  11 80         ora ($80),y
$15:c39e  90 7c         bcc $c41c
$15:c3a0  12 07         ora ($07)
$15:c3a2  58            cli
$15:c3a3  40            rti
$15:c3a4  23 90         and $90,s
$15:c3a6  f9 fc 12      sbc $12fc,y
$15:c3a9  7a            ply
$15:c3aa  f0 08         beq $c3b4
$15:c3ac  14 e9         trb $e9
$15:c3ae  ec 2a 82      cpx $822a
$15:c3b1  7c 84 11      jmp ($1184,x)
$15:c3b4  fc 30 28      jsr ($2830,x)
$15:c3b7  6b            rtl
$15:c3b8  28            plp
$15:c3b9  15 09         ora $09,x
$15:c3bb  d8            cld
$15:c3bc  90 5e         bcc $c41c
$15:c3be  3c 1f 80      bit $801f,x
$15:c3c1  d0 03         bne $c3c6
$15:c3c3  84 58         sty $58
$15:c3c5  2a            rol a
$15:c3c6  81 0e         sta ($0e,x)
$15:c3c8  00 80         brk #$80
$15:c3ca  10 7e         bpl $c44a
$15:c3cc  94 f3         sty $f3,x
$15:c3ce  2f 9d bd 0f   and $0fbd9d
$15:c3d2  e9 8f         sbc #$8f
$15:c3d4  54 fa eb      mvn $eb,$fa
$15:c3d7  d9 7e e0      cmp $e07e,y
$15:c3da  f7 6f         sbc [$6f],y
$15:c3dc  87 7c         sta [$7c]
$15:c3de  1f e3 ff 18   ora $18ffe3,x
$15:c3e2  f9 0b ca      sbc $ca0b,y
$15:c3e5  7e 64 f3      ror $f364,x
$15:c3e8  af a7 9e 0b   lda $0b9ea7
$15:c3ec  1b            tcs
$15:c3ed  85 45         sta $45
$15:c3ef  a3 70         lda $70,s
$15:c3f1  68            pla
$15:c3f2  2c 2e 01      bit $012e
$15:c3f5  07 4f         ora [$4f]
$15:c3f7  24 0e         bit $0e
$15:c3f9  11 06         ora ($06),y
$15:c3fb  88            dey
$15:c3fc  c1 97         cmp ($97,x)
$15:c3fe  c2 b7         rep #$b7
$15:c400  6a            ror a
$15:c401  06 c3         asl $c3
$15:c403  41 d0         eor ($d0,x)
$15:c405  98            tya
$15:c406  50 28         bvc $c430
$15:c408  1a            inc a
$15:c409  08            php
$15:c40a  07 01         ora [$01]
$15:c40c  3c 98 09      bit $0998,x
$15:c40f  07 03         ora [$03]
$15:c411  21 40         and ($40,x)
$15:c413  c0 37 c1      cpy #$c137
$15:c416  ae d0 58      ldx $58d0
$15:c419  24 2a         bit $2a
$15:c41b  13 06         ora ($06,s),y
$15:c41d  80 bc         bra $c3db
$15:c41f  c2 6f         rep #$6f
$15:c421  00 bd         brk #$bd
$15:c423  d2 33         cmp ($33)
$15:c425  9a            txs
$15:c426  4d d4 86      eor $86d4
$15:c429  09 03 84      ora #$8403
$15:c42c  c1 e0         cmp ($e0,x)
$15:c42e  30 f8         bmi $c428
$15:c430  0c be 01      tsb $01be
$15:c433  2f a4 49 f4   and $f449a4
$15:c437  96 b9         stx $b9,y
$15:c439  0f 9d a8 12   ora $12a89d
$15:c43d  0d 06 03      ora $0306
$15:c440  80 13         bra $c455
$15:c442  0a            asl a
$15:c443  c6 03         dec $03
$15:c445  79 24 f9      adc $f924,y
$15:c448  72 bf         adc ($bf)
$15:c44a  58            cli
$15:c44b  87 18         sta [$18]
$15:c44d  68            pla
$15:c44e  38            sec
$15:c44f  1c 0f 07      trb $070f
$15:c452  03 d1         ora $d1,s
$15:c454  80 f4         bra $c44a
$15:c456  49 39 1c      eor #$1c39
$15:c459  a9 66 23      lda #$2366
$15:c45c  9c ef cd      stz $cdef
$15:c45f  f3 fb         sbc ($fb,s),y
$15:c461  bd e0 fa      lda $fae0,x
$15:c464  b9 52 b7      lda $b752,y
$15:c467  5c 80 fd 52   jml $52fd80
$15:c46b  b5 9c         lda $9c,x
$15:c46d  8f 72 f4 60   sta $60f472
$15:c471  0f 30 8f 44   ora $448f30
$15:c475  63 f1         adc $f1,s
$15:c477  08            php
$15:c478  7c 02 2b      jmp ($2b02,x)
$15:c47b  00 8d         brk #$8d
$15:c47d  a7 88         lda [$88]
$15:c47f  04 31         tsb $31
$15:c481  18            clc
$15:c482  79 e0 63      adc $63e0,y
$15:c485  f0 08         beq $c48f
$15:c487  f4 02 1a      pea $1a02
$15:c48a  dc 21 10      jml [$1021]
$15:c48d  08            php
$15:c48e  c2 61         rep #$61
$15:c490  d0 e0         bne $c472
$15:c492  44 3c 10      mvp $10,$3c
$15:c495  8d 85 21      sta $2185
$15:c498  20 7e 05      jsr $057e
$15:c49b  20 74 3c      jsr $3c74
$15:c49e  11 0f         ora ($0f),y
$15:c4a0  44 22 21      mvp $21,$22
$15:c4a3  48            pha
$15:c4a4  f0 61         beq $c507
$15:c4a6  3f f5 bc fc   and $fcbcf5,x
$15:c4aa  9f 0f 1a c2   sta $c21a0f,x
$15:c4ae  d5 f9         cmp $f9,x
$15:c4b0  f4 7e 7c      pea $7c7e
$15:c4b3  5f 1f 46 e7   eor $e7461f,x
$15:c4b7  c0 3f f6      cpy #$f63f
$15:c4ba  0f fd e3 ff   ora $ffe3fd
$15:c4be  7f ff cf d8   adc $d8cfff,x
$15:c4c2  c2 c5         rep #$c5
$15:c4c4  28            plp
$15:c4c5  97 fb         sta [$fb],y
$15:c4c7  d7 e9         cmp [$e9],y
$15:c4c9  df ec 6b 3a   cmp $3a6bec,x
$15:c4cd  5b            tcd
$15:c4ce  af e7 a5 f8   lda $f8a5e7
$15:c4d2  fa            plx
$15:c4d3  fe ff df      inc $dfff,x
$15:c4d6  08            php
$15:c4d7  0f fe 2d ff   ora $ff2dfe
$15:c4db  a7 7f         lda [$7f]
$15:c4dd  ff ce 41 74   sbc $7441ce,x
$15:c4e1  03 9c         ora $9c,s
$15:c4e3  96 e1         stx $e1,y
$15:c4e5  46 e6         lsr $e6
$15:c4e7  c5 b1         cmp $b1
$15:c4e9  74 ce         stz $ce,x
$15:c4eb  0d 1b 91      ora $911b
$15:c4ee  47 e6         eor [$e6]
$15:c4f0  49 b5 f6      eor #$f6b5
$15:c4f3  af 2b 1c 7f   lda $7f1c2b
$15:c4f7  97 bf         sta [$bf],y
$15:c4f9  e4 c7         cpx $c7
$15:c4fb  fd 38 ff      sbc $ff38,x
$15:c4fe  cf 3f f5 ff   cmp $fff53f
$15:c502  fc 7f fe      jsr ($fe7f,x)
$15:c505  d7 0b         cmp [$0b],y
$15:c507  96 63         stx $63,y
$15:c509  6b            rtl
$15:c50a  6b            rtl
$15:c50b  8f 70 36 d8   sta $d83670
$15:c50f  8f bc 67 e7   sta $e767bc
$15:c513  f9 9f 76      sbc $769f,y
$15:c516  1c a1 bf      trb $bfa1
$15:c519  af db a3 fc   lda $fca3db
$15:c51d  79 fe 3e      adc $3efe,y
$15:c520  ff 1e 75 2d   sbc $2d751e,x
$15:c524  17 9b         ora [$9b],y
$15:c526  10 c5         bpl $c4ed
$15:c528  d3 78         cmp ($78,s),y
$15:c52a  d4 0e         pei ($0e)
$15:c52c  58            cli
$15:c52d  c4 1f         cpy $1f
$15:c52f  69 3d ff      adc #$ff3d
$15:c532  00 c2         brk #$c2
$15:c534  6d f8 9d      adc $9df8
$15:c537  ff 08 20 0b   sbc $0b2008,x
$15:c53b  58            cli
$15:c53c  c6 d6         dec $d6
$15:c53e  17 7e         ora [$7e],y
$15:c540  e0 4d b1      cpx #$b14d
$15:c543  17 70         ora [$70],y
$15:c545  d2 83         cmp ($83)
$15:c547  42 1d         wdm #$1d
$15:c549  ff 12 d3 e4   sbc $e4d312,x
$15:c54d  22 d8 87 a8   jsl $a887d8
$15:c551  f2 de         sbc ($de)
$15:c553  20 fb 40      jsr $40fb
$15:c556  48            pha
$15:c557  30 c0         bmi $c519
$15:c559  0a            asl a
$15:c55a  04 70         tsb $70
$15:c55c  00 80         brk #$80
$15:c55e  2d 3e 45      and $453e
$15:c561  20 c5 d7      jsr $d7c5
$15:c564  b0 1b         bcs $c581
$15:c566  6b            rtl
$15:c567  44 df b2      mvp $b2,$df
$15:c56a  5b            tcd
$15:c56b  6c 75 ff      jmp ($ff75)
$15:c56e  0f 7f b7 c7   ora $c7b77f
$15:c572  ff ca 80 36   sbc $3680ca,x
$15:c576  3d 3d ed      and $ed3d,x
$15:c579  28            plp
$15:c57a  14 03         trb $03
$15:c57c  c5 4a         cmp $4a
$15:c57e  b1 25         lda ($25),y
$15:c580  e5 d7         sbc $d7
$15:c582  b6 10         ldx $10,y
$15:c584  6f 45 5e b2   adc $b25e45
$15:c588  1b            tcs
$15:c589  4a            lsr a
$15:c58a  fe ff 9d      inc $9dff,x
$15:c58d  3f db c3 fd   and $fdc3db,x
$15:c591  f1 fa         sbc ($fa),y
$15:c593  f6 fd         inc $fd,x
$15:c595  be 0e c0      ldx $c00e,y
$15:c598  eb            xba
$15:c599  ca            dex
$15:c59a  2f b0 49 be   and $be49b0
$15:c59e  2e b1 27      rol $27b1
$15:c5a1  cb            wai
$15:c5a2  c2 22         rep #$22
$15:c5a4  98            tya
$15:c5a5  fc 5d 7e      jsr ($7e5d,x)
$15:c5a8  f1 0c         sbc ($0c),y
$15:c5aa  94 78         sty $78,x
$15:c5ac  20 9e 3c      jsr $3c9e
$15:c5af  1d 82 43      ora $4382,x
$15:c5b2  80 80         bra $c534
$15:c5b4  70 31         bvs $c5e7
$15:c5b6  1c 0a e6      trb $e60a
$15:c5b9  02 19         cop #$19
$15:c5bb  e0 eb 4a      cpx #$4aeb
$15:c5be  2f 94 0e d6   and $d60e94
$15:c5c2  82 69 c8      brl $8e2e
$15:c5c5  e9 48 2a      sbc #$2a48
$15:c5c8  1e 2d 17      asl $172d,x
$15:c5cb  d2 79         cmp ($79)
$15:c5cd  60            rts
$15:c5ce  94 43         sty $43,x
$15:c5d0  a8            tay
$15:c5d1  18            clc
$15:c5d2  e0 60 42      cpx #$4260
$15:c5d5  20 50 08      jsr $0850
$15:c5d8  34 8a         bit $8a,x
$15:c5da  0d 74 81      ora $8174
$15:c5dd  58            cli
$15:c5de  21 dc         and ($dc,x)
$15:c5e0  f9 85 9e      sbc $9e85,y
$15:c5e3  31 a8         and ($a8),y
$15:c5e5  8f df 21 95   sta $9521df
$15:c5e9  4a            lsr a
$15:c5ea  66 17         ror $17
$15:c5ec  9b            txy
$15:c5ed  19 87 4f      ora $4f87,y
$15:c5f0  26 93         rol $93
$15:c5f2  0f 3c 43 c1   ora $c1433c
$15:c5f6  10 b2         bpl $c5aa
$15:c5f8  c0 f0 f4      cpy #$f4f0
$15:c5fb  3c 2f 2a      bit $2a2f,x
$15:c5fe  03 02         ora $02,s
$15:c600  90 4c         bcc $c64e
$15:c602  e0 16 6c      cpx #$6c16
$15:c605  c7 32         cmp [$32]
$15:c607  61 2a         adc ($2a,x)
$15:c609  f8            sed
$15:c60a  5f 2c 15 4b   eor $4b152c,x
$15:c60e  25 0a         and $0a
$15:c610  cd 30 f0      cmp $f030
$15:c613  5e 2b 19      lsr $192b,x
$15:c616  8e 74 42      stx $4274
$15:c619  1d 10 a6      ora $a610,x
$15:c61c  60            rts
$15:c61d  38            sec
$15:c61e  58            cli
$15:c61f  4a            lsr a
$15:c620  16 9a         asl $9a,x
$15:c622  01 80         ora ($80,x)
$15:c624  84 66         sty $66
$15:c626  20 11 e8      jsr $e811
$15:c629  04 06         tsb $06
$15:c62b  13 03         ora ($03,s),y
$15:c62d  85 40         sta $40
$15:c62f  ce 01 00      dec $0001
$15:c632  81 40         sta ($40,x)
$15:c634  60            rts
$15:c635  e2 70         sep #$70
$15:c637  3b            tsc
$15:c638  84 0e         sty $0e
$15:c63a  13 16         ora ($16,s),y
$15:c63c  85 41         sta $41
$15:c63e  60            rts
$15:c63f  07 b0         ora [$b0]
$15:c641  3a            dec a
$15:c642  82 24 4e      brl $1469
$15:c645  e1 18         sbc ($18,x)
$15:c647  80 78         bra $c6c1
$15:c649  3c 1b 0a      bit $0a1b,x
$15:c64c  85 43         sta $43
$15:c64e  c1 a8         cmp ($a8,x)
$15:c650  a0 56         ldy #$56
$15:c652  34 91         bit $91,x
$15:c654  8c 87 c2      sty $c287
$15:c657  41 00         eor ($00,x)
$15:c659  f8            sed
$15:c65a  78            sei
$15:c65b  23 15         and $15,s
$15:c65d  0f 47 83 f1   ora $f18347
$15:c661  40            rti
$15:c662  f8            sed
$15:c663  68            pla
$15:c664  20 19 4b      jsr $4b19
$15:c667  04 b3         tsb $b3
$15:c669  81 43         sta ($43,x)
$15:c66b  e7 d1         sbc [$d1]
$15:c66d  f9 f2 6d      sbc $6df2,y
$15:c670  7d ab cb      adc $cbab,x
$15:c673  74 f5         stz $f5,x
$15:c675  d1 3b         cmp ($3b),y
$15:c677  f6 0e         inc $0e,x
$15:c679  fc eb 0b      jsr ($0beb,x)
$15:c67c  3f ff af c2   and $c2afff,x
$15:c680  bf ff 8f b1   lda $b18fff,x
$15:c684  05 7e         ora $7e
$15:c686  57 ff         eor [$ff],y
$15:c688  ff 9b f1 f7   sbc $f7f19b,x
$15:c68c  fc fc ff      jsr ($fffc,x)
$15:c68f  33 ee         and ($ee,s),y
$15:c691  c5 2b         cmp $2b
$15:c693  f9 87 be      sbc $be87,y
$15:c696  e5 3d         sbc $3d
$15:c698  d6 5c         dec $5c,x
$15:c69a  df ff ff fe   cmp $feffff,x
$15:c69e  70 0b         bvs $c6ab
$15:c6a0  90 9c         bcc $c63e
$15:c6a2  64 e1         stz $e1
$15:c6a4  0a            asl a
$15:c6a5  ba            tsx
$15:c6a6  c0 62         cpy #$62
$15:c6a8  f8            sed
$15:c6a9  fa            plx
$15:c6aa  17 0d         ora [$0d],y
$15:c6ac  5e cc 94      lsr $94cc,x
$15:c6af  9f ff 17 ed   sta $ed17ff,x
$15:c6b3  75 fc         adc $fc,x
$15:c6b5  f4 bf 1f      pea $1fbf
$15:c6b8  5f de 9a c0   eor $c09ade,x
$15:c6bc  cf 67 4a 5f   cmp $5f4a67
$15:c6c0  d8            cld
$15:c6c1  e0 e0         cpx #$e0
$15:c6c3  57 79         eor [$79],y
$15:c6c5  45 b1         eor $b1
$15:c6c7  b4 ee         ldy $ee,x
$15:c6c9  1d 0b 9a      ora $9a0b,x
$15:c6cc  f9 9f e4      sbc $e49f,y
$15:c6cf  cc 0c 00      cpy $000c
$15:c6d2  61 05         adc ($05,x)
$15:c6d4  b5 d7         lda $d7,x
$15:c6d6  37 be         and [$be],y
$15:c6d8  b0 49         bcs $c723
$15:c6da  bb            tyx
$15:c6db  01 98         ora ($98,x)
$15:c6dd  df 57 ec ec   cmp $ecec57,x
$15:c6e1  51 14         eor ($14),y
$15:c6e3  b5 1b         lda $1b,x
$15:c6e5  99 14 c4      sta $c414,y
$15:c6e8  8d 42 89      sta $8942
$15:c6eb  c9 38         cmp #$38
$15:c6ed  83 ed         sta $ed,s
$15:c6ef  27 9f         and [$9f]
$15:c6f1  fb            xce
$15:c6f2  cf f8 8a 13   cmp $138af8
$15:c6f6  9f f2 04 01   sta $0104f2,x
$15:c6fa  69 b2         adc #$b2
$15:c6fc  cc 55 71      cpy $7155
$15:c6ff  65 50         adc $50
$15:c701  8b            phb
$15:c702  72 36         adc ($36)
$15:c704  f9 90 da      sbc $da90,y
$15:c707  67 ef         adc [$ef]
$15:c709  f8            sed
$15:c70a  eb            xba
$15:c70b  f9 94 39      sbc $3994,y
$15:c70e  f3 fc         sbc ($fc,s),y
$15:c710  f5 fd         sbc $fd,x
$15:c712  c6 50         dec $50
$15:c714  08            php
$15:c715  04 92         tsb $92
$15:c717  31 5a         and ($5a),y
$15:c719  9e 4f 2f      stz $2f4f,x
$15:c71c  cb            wai
$15:c71d  50 59         bvc $c778
$15:c71f  82 c4 15      brl $dce6
$15:c722  e0 b4         cpx #$b4
$15:c724  1b            tcs
$15:c725  f3 90         sbc ($90,s),y
$15:c727  dc 82 c1      jml [$c182]
$15:c72a  05 a0         ora $a0
$15:c72c  2b            pld
$15:c72d  c2 01         rep #$01
$15:c72f  18            clc
$15:c730  8c 2e 82      sty $822e
$15:c733  cc d5 06      cpy $06d5
$15:c736  98            tya
$15:c737  34 41         bit $41,x
$15:c739  9e 2d 01      stz $012d,x
$15:c73c  5f 04 62 fc   eor $fc6204,x
$15:c740  e5 05         sbc $05
$15:c742  f0 36         beq $c77a
$15:c744  cb            wai
$15:c745  a1 28         lda ($28,x)
$15:c747  bd c1 27      lda $27c1,x
$15:c74a  78            sei
$15:c74b  cb            wai
$15:c74c  7c 62 bf      jmp ($bf62,x)
$15:c74f  30 bf         bmi $c710
$15:c751  c0 27         cpy #$27
$15:c753  f0 08         beq $c75d
$15:c755  7c 02 51      jmp ($5102,x)
$15:c758  d0 82         bne $c6dc
$15:c75a  70 31         bvs $c78d
$15:c75c  96 05         stx $05,y
$15:c75e  e0 4c         cpx #$4c
$15:c760  1b            tcs
$15:c761  a6 af         ldx $af
$15:c763  08            php
$15:c764  b4 a3         ldy $a3,x
$15:c766  79 40 dc      adc $dc40,y
$15:c769  58            cli
$15:c76a  bd 93 0f      lda $0f93,x
$15:c76d  a4 63         ldy $63
$15:c76f  f9 00 fc      sbc $fc00,y
$15:c772  40            rti
$15:c773  3c 0f e0      bit $e00f,x
$15:c776  8b            phb
$15:c777  50 20         bvc $c799
$15:c779  d6 28         dec $28,x
$15:c77b  60            rts
$15:c77c  1c 1b 88      trb $881b
$15:c77f  af 0b 7c 42   lda $427c0b
$15:c783  df 30 a7 c2   cmp $c2a730,x
$15:c787  2e ef a3      rol $a3ef
$15:c78a  6e 94 40      ror $4094
$15:c78d  0c 30 81      tsb $8130
$15:c790  2c 40 3d      bit $3d40
$15:c793  91 0f         sta ($0f),y
$15:c795  64 63         stz $63
$15:c797  c9 20         cmp #$20
$15:c799  ee 06 8c      inc $8c06
$15:c79c  76 8b         ror $8b,x
$15:c79e  c0 90         cpy #$90
$15:c7a0  01 62         ora ($62,x)
$15:c7a2  01 03         ora ($03,x)
$15:c7a4  80 43         bra $c7e9
$15:c7a6  a0 11         ldy #$11
$15:c7a8  b8            clv
$15:c7a9  14 7e         trb $7e
$15:c7ab  00 75         brk #$75
$15:c7ad  18            clc
$15:c7ae  0c 35 ba      tsb $ba35
$15:c7b1  50 73         bvc $c826
$15:c7b3  f8            sed
$15:c7b4  40            rti
$15:c7b5  a0 8d         ldy #$8d
$15:c7b7  d2 80         cmp ($80)
$15:c7b9  9b            txy
$15:c7ba  4a            lsr a
$15:c7bb  01 78         ora ($78,x)
$15:c7bd  e4 60         cpx $60
$15:c7bf  2e 17 8a      rol $8a17
$15:c7c2  06 73         asl $73
$15:c7c4  41 9c         eor ($9c,x)
$15:c7c6  90 5f         bcc $c827
$15:c7c8  22 1b 89 02   jsl $02891b
$15:c7cc  bc 38 90      ldy $9038,x
$15:c7cf  0b            phd
$15:c7d0  84 02         sty $02
$15:c7d2  81 80         sta ($80,x)
$15:c7d4  d0 50         bne $c826
$15:c7d6  24 14         bit $14
$15:c7d8  08            php
$15:c7d9  86 02         stx $02
$15:c7db  41 c0         eor ($c0,x)
$15:c7dd  04 24         tsb $24
$15:c7df  2e 31 2c      rol $2c31
$15:c7e2  b3 f5         lda ($f5,s),y
$15:c7e4  eb            xba
$15:c7e5  1a            inc a
$15:c7e6  fe 84 bf      inc $bf84,x
$15:c7e9  a1 9f         lda ($9f,x)
$15:c7eb  a8            tay
$15:c7ec  1f 11 b8 1a   ora $1ab811,x
$15:c7f0  03 10         ora $10,s
$15:c7f2  32 0c         and ($0c)
$15:c7f4  14 5d         trb $5d
$15:c7f6  88            dey
$15:c7f7  c4 d3         cpy $d3
$15:c7f9  c9 eb         cmp #$eb
$15:c7fb  8d 7d 61      sta $617d
$15:c7fe  7f 48 5f e6   adc $e65f48,x
$15:c802  14 0a         trb $0a
$15:c804  20 e8 46      jsr $46e8
$15:c807  a0 10         ldy #$10
$15:c809  58            cli
$15:c80a  02 10         cop #$10
$15:c80c  1d 25 00      ora $0025,x
$15:c80f  81 02         sta ($02,x)
$15:c811  8e 05 02      stx $0205
$15:c814  83 3e         sta $3e,s
$15:c816  02 09         cop #$09
$15:c818  04 80         tsb $80
$15:c81a  a2 41         ldx #$41
$15:c81c  e0 b0         cpx #$b0
$15:c81e  08            php
$15:c81f  30 1c         bmi $c83d
$15:c821  50 80         bvc $c7a3
$15:c823  89 11         bit #$11
$15:c825  d1 42         cmp ($42),y
$15:c827  21 19         and ($19,x)
$15:c829  8d c6 a3      sta $a3c6
$15:c82c  d1 50         cmp ($50),y
$15:c82e  ac 64 32      ldy $3264
$15:c831  06 85         asl $85
$15:c833  84 40         sty $40
$15:c835  37 11         and [$11],y
$15:c837  0f c6 83 f1   ora $f183c6
$15:c83b  60            rts
$15:c83c  f8            sed
$15:c83d  3d 49 f6      and $f649,x
$15:c840  05 d0         ora $d0
$15:c842  82 c1 61      brl $2a06
$15:c845  b0 d8         bcs $c81f
$15:c847  3c 1e 17      bit $171e,x
$15:c84a  0b            phd
$15:c84b  02 9a         cop #$9a
$15:c84d  10 9c         bpl $c7eb
$15:c84f  e1 0d         sbc ($0d,x)
$15:c851  84 43         sty $43
$15:c853  e0 90         cpx #$90
$15:c855  f8            sed
$15:c856  80 74         bra $c8cc
$15:c858  37 13         and [$13],y
$15:c85a  0b            phd
$15:c85b  c7 43         cmp [$43]
$15:c85d  a0 1d         ldy #$1d
$15:c85f  00 e8         brk #$e8
$15:c861  48            pha
$15:c862  24 18         bit $18
$15:c864  0c 04 00      tsb $0004
$15:c867  3c 1b 8c      bit $8c1b,x
$15:c86a  07 e2         ora [$e2]
$15:c86c  41 f0         eor ($f0,x)
$15:c86e  16 80         asl $80,x
$15:c870  b4 38         ldy $38,x
$15:c872  1e 0a 02      asl $020a,x
$15:c875  b0 9e         bcs $c815
$15:c877  c1 03         cmp ($03,x)
$15:c879  82 41 47      brl $0fbd
$15:c87c  61 0a         adc ($0a,x)
$15:c87e  85 05         sta $05
$15:c880  42 1b         wdm #$1b
$15:c882  09 01         ora #$01
$15:c884  9c 0e 04      stz $040e
$15:c887  c3 08         cmp $08,s
$15:c889  3c 12 1d      bit $1d12,x
$15:c88c  06 45         asl $45
$15:c88e  04 3c         tsb $3c
$15:c890  b6 15         ldx $15,y
$15:c892  04 88         tsb $88
$15:c894  96 c2         stx $c2,y
$15:c896  81 40         sta ($40,x)
$15:c898  88            dey
$15:c899  44 36 1b      mvp $1b,$36
$15:c89c  0d 03 1c      ora $1c03
$15:c89f  64 17         stz $17
$15:c8a1  05 08         ora $08
$15:c8a3  50 2c         bvc $c8d1
$15:c8a5  10 0a         bpl $c8b1
$15:c8a7  04 02         tsb $02
$15:c8a9  21 00         and ($00,x)
$15:c8ab  d8            cld
$15:c8ac  31 86         and ($86),y
$15:c8ae  08            php
$15:c8af  f8            sed
$15:c8b0  01 c0         ora ($c0,x)
$15:c8b2  42 61         wdm #$61
$15:c8b4  27 90         and [$90]
$15:c8b6  7d 83 d8      adc $d883,x
$15:c8b9  9d 03 06      sta $0603,x
$15:c8bc  81 43         sta ($43,x)
$15:c8be  d1 a0         cmp ($a0),y
$15:c8c0  89 07         bit #$07
$15:c8c2  40            rti
$15:c8c3  81 88         sta ($88,x)
$15:c8c5  26 09         rol $09
$15:c8c7  90 98         bcc $c861
$15:c8c9  28            plp
$15:c8ca  00 20         brk #$20
$15:c8cc  4a            lsr a
$15:c8cd  00 b0         brk #$b0
$15:c8cf  5a            phy
$15:c8d0  19 e5 00      ora $00e5,y
$15:c8d3  98            tya
$15:c8d4  27 c0         and [$c0]
$15:c8d6  20 6d 60      jsr $606d
$15:c8d9  6f 0c 16 09   adc $09160c
$15:c8dd  0a            asl a
$15:c8de  84 c1         sty $c1
$15:c8e0  a0 31         ldy #$31
$15:c8e2  68            pla
$15:c8e3  0d 9e a1      ora $a19e
$15:c8e6  fb            xce
$15:c8e7  d4 47         pei ($47)
$15:c8e9  2c 81 30      bit $3081
$15:c8ec  82 40 e1      brl $aa2f
$15:c8ef  30 78         bmi $c969
$15:c8f1  0c 3e 03      tsb $033e
$15:c8f4  3f a8 4b f5   and $f54ba8,x
$15:c8f8  14 7b         trb $7b
$15:c8fa  27 2c         and [$2c]
$15:c8fc  48            pha
$15:c8fd  09 70         ora #$70
$15:c8ff  90 68         bcc $c969
$15:c901  30 1c         bmi $c91f
$15:c903  00 a8         brk #$a8
$15:c905  55 30         eor $30,x
$15:c907  19 a9 17      ora $17a9,y
$15:c90a  3b            tsc
$15:c90b  c8            iny
$15:c90c  0f 1c 06 83   ora $83061c
$15:c910  80 6b         bra $c97d
$15:c912  03 58         ora $58,s
$15:c914  60            rts
$15:c915  3d 92 2e      and $2e92,x
$15:c918  67 92         adc [$92]
$15:c91a  34 ef         bit $ef,x
$15:c91c  8b            phb
$15:c91d  bd 01 f6      lda $f601,x
$15:c920  13 ca         ora ($ca,s),y
$15:c922  23 fe         and $fe,s
$15:c924  28            plp
$15:c925  00 a1         brk #$a1
$15:c927  a2 03         ldx #$03
$15:c929  af 75 22 a7   lda $a72275
$15:c92d  3f 84 43 56   and $564384,x
$15:c931  4c d3 5c      jmp $5cd3
$15:c934  a0 6c         ldy #$6c
$15:c936  d0 80         bne $c8b8
$15:c938  c7 a2         cmp [$a2]
$15:c93a  31 f8         and ($f8),y
$15:c93c  84 3e         sty $3e
$15:c93e  01 13         ora ($13,x)
$15:c940  73 9c         adc ($9c,s),y
$15:c942  00 08         brk #$08
$15:c944  31 18         and ($18),y
$15:c946  79 e8 63      adc $63e8,y
$15:c949  f0 08         beq $c953
$15:c94b  e3 9c         sbc $9c,s
$15:c94d  c2 a1         rep #$a1
$15:c94f  c0 e8         cpy #$e8
$15:c951  7c 25 1d      jmp ($1d25,x)
$15:c954  0e a4 23      asl $23a4
$15:c957  c9 28 48      cmp #$4828
$15:c95a  2f 83 e1 e0   and $e0e183
$15:c95e  e8            inx
$15:c95f  7a            ply
$15:c960  13 83         ora ($83,s),y
$15:c962  14 df         trb $df
$15:c964  da            phx
$15:c965  3a            dec a
$15:c966  d3 0d         cmp ($0d,s),y
$15:c968  0d 66 15      ora $1566
$15:c96b  e1 a2         sbc ($a2,x)
$15:c96d  7a            ply
$15:c96e  b2 1b         lda ($1b)
$15:c970  2e 25 f2      rol $f225
$15:c973  55 56         eor $56,x
$15:c975  88            dey
$15:c976  40            rti
$15:c977  0f 61 06 80   ora $800661
$15:c97b  45 20         eor $20
$15:c97d  91 18         sta ($18),y
$15:c97f  05 36         ora $36
$15:c981  01 83         ora ($83,x)
$15:c983  80 68         bra $c9ed
$15:c985  60            rts
$15:c986  1f d8 b5 ae   ora $aeb5d8,x
$15:c98a  19 85 cd      ora $cd85,y
$15:c98d  74 b0         stz $b0,x
$15:c98f  f2 da         sbc ($da)
$15:c991  af ca 89 e1   lda $e189ca
$15:c995  9e 6c 65      stz $656c,x
$15:c998  50 88         bvc $c922
$15:c99a  07 c2         ora [$c2]
$15:c99c  01 60         ora ($60,x)
$15:c99e  80 4a         bra $c9ea
$15:c9a0  24 18         bit $18
$15:c9a2  a8            tay
$15:c9a3  06 ee         asl $ee
$15:c9a5  01 c3         ora ($c3,x)
$15:c9a7  80 71         bra $ca1a
$15:c9a9  4e 41 03      lsr $0341
$15:c9ac  82 c1 60      brl $2a70
$15:c9af  30 18         bmi $c9c9
$15:c9b1  54 22 1b      mvn $1b,$22
$15:c9b4  0a            asl a
$15:c9b5  85 c2         sta $c2
$15:c9b7  20 90 47      jsr $4790
$15:c9ba  98            tya
$15:c9bb  1c 82 05      trb $0582
$15:c9be  07 83         ora [$83]
$15:c9c0  41 e0         eor ($e0,x)
$15:c9c2  f0 f0         beq $c9b4
$15:c9c4  29 40 e0      and #$e040
$15:c9c7  f0 08         beq $c9d1
$15:c9c9  0d 41 7e      ora $7e41
$15:c9cc  10 0a         bpl $c9d8
$15:c9ce  44 21 54      mvp $54,$21
$15:c9d1  12 8e         ora ($8e)
$15:c9d3  40            rti
$15:c9d4  5c 3a 11 0f   jml $0f113a
$15:c9d8  00 74         brk #$74
$15:c9da  3e 02 01      rol $0102,x
$15:c9dd  fc 08 d1      jsr ($d108,x)
$15:c9e0  4c 10 0f      jmp $0f10
$15:c9e3  04 66         tsb $66
$15:c9e5  33 10         and ($10,s),y
$15:c9e7  88            dey
$15:c9e8  44 a2 0c      mvp $0c,$a2
$15:c9eb  30 94         bmi $c981
$15:c9ed  c9 a6 b3      cmp #$b3a6
$15:c9f0  28            plp
$15:c9f1  dc 66 0c      jml [$0c66]
$15:c9f4  3d 08 fc      and $fc08,x
$15:c9f7  3c 80 24      bit $2480,x
$15:c9fa  41 9f         eor ($9f,x)
$15:c9fc  c3 e7         cmp $e7,s
$15:c9fe  e3 f0         sbc $f0,s
$15:ca00  3a            dec a
$15:ca01  06 03         asl $03
$15:ca03  00 1d         brk #$1d
$15:ca05  0d 06 82      ora $8206
$15:ca08  41 20         eor ($20,x)
$15:ca0a  0d 86 c2      ora $c286
$15:ca0d  a0 0f         ldy #$0f
$15:ca0f  0f 07 82 81   ora $818207
$15:ca13  c0 16         cpy #$16
$15:ca15  85 03         sta $03
$15:ca17  c0 a5         cpy #$a5
$15:ca19  0f 02 9c 0d   ora $0d9c02
$15:ca1d  02 2d         cop #$2d
$15:ca1f  08            php
$15:ca20  d4 62         pei ($62)
$15:ca22  3d 18 1a      and $1a18,x
$15:ca25  84 5e         sty $5e
$15:ca27  21 28         and ($28,x)
$15:ca29  93 8d         sta ($8d,s),y
$15:ca2b  c2 2d         rep #$2d
$15:ca2d  10 87         bpl $c9b6
$15:ca2f  81 82         sta ($82,x)
$15:ca31  3e 7f 03      rol $037f,x
$15:ca34  e8            inx
$15:ca35  10 c6         bpl $c9fd
$15:ca37  7e 47 12      ror $1247,x
$15:ca3a  60            rts
$15:ca3b  43 f2         eor $f2,s
$15:ca3d  19 0d 86      ora $860d,y
$15:ca40  c3 f1         cmp $f1,s
$15:ca42  f8            sed
$15:ca43  b4 5a         ldy $5a,x
$15:ca45  33 11         and ($11,s),y
$15:ca47  8d 44 20      sta $2044
$15:ca4a  62 05 d0      per $9a52
$15:ca4d  80 64         bra $cab3
$15:ca4f  20 1b 08      jsr $081b
$15:ca52  07 e3         ora [$e3]
$15:ca54  20 2a 01      jsr $012a
$15:ca57  42 c2         wdm #$c2
$15:ca59  1e c1 0d      asl $0dc1,x
$15:ca5c  84 c2         sty $c2
$15:ca5e  5e a1 15      lsr $15a1,x
$15:ca61  89 2d c1      bit #$c12d
$15:ca64  ea            nop
$15:ca65  00 40         brk #$40
$15:ca67  82 43 20      brl $eaad
$15:ca6a  50 f8         bvc $ca64
$15:ca6c  30 18         bmi $ca86
$15:ca6e  61 e4         adc ($e4,x)
$15:ca70  21 02         and ($02,x)
$15:ca72  84 02         sty $02
$15:ca74  0f d0 ec 24   ora $24ecd0
$15:ca78  41 36         eor ($36,x)
$15:ca7a  32 0a         and ($0a)
$15:ca7c  86 42         stx $42
$15:ca7e  21 d0         and ($d0,x)
$15:ca80  0d 94 83      ora $8394
$15:ca83  f1 40         sbc ($40),y
$15:ca85  34 09         bit $09,x
$15:ca87  96 27         stx $27,y
$15:ca89  54 1d bc      mvn $bc,$1d
$15:ca8c  22 fb 04 db   jsl $db04fb
$15:ca90  c2 fb         rep #$fb
$15:ca92  18            clc
$15:ca93  7e bd 23      ror $23bd,x
$15:ca96  29 af a5      and #$a5af
$15:ca99  f7 e8         sbc [$e8],y
$15:ca9b  3c 78 47      bit $4778,x
$15:ca9e  02 09         cop #$09
$15:caa0  c3 81         cmp $81,s
$15:caa2  d0 30         bne $cad4
$15:caa4  30 0a         bmi $cab0
$15:caa6  04 03         tsb $03
$15:caa8  51 40         eor ($40),y
$15:caaa  ee 40 3c      inc $3c40
$15:caad  59 0e b4      eor $b40e,y
$15:cab0  c2 c9         rep #$c9
$15:cab2  50 ed         bvc $caa1
$15:cab4  68            pla
$15:cab5  26 1c         rol $1c
$15:cab7  ce a4 8a      dec $8aa4
$15:caba  ad e4 dd      lda $dde4
$15:cabd  7c 32 1d      jmp ($1d32,x)
$15:cac0  e9 84 7a      sbc #$7a84
$15:cac3  a1 9e         lda ($9e,x)
$15:cac5  c0 47 18      cpy #$1847
$15:cac8  01 02         ora ($02,x)
$15:caca  80 49         bra $cb15
$15:cacc  20 57 08      jsr $0857
$15:cacf  34 fa         bit $fa,x
$15:cad1  83 af         sta $af,s
$15:cad3  88            dey
$15:cad4  59 e3 12      eor $12e3,y
$15:cad7  88            dey
$15:cad8  fc 6e 17      jsr ($176e,x)
$15:cadb  16 86         asl $86,x
$15:cadd  45 61         eor $61
$15:cadf  b1 98         lda ($98),y
$15:cae1  75 07         adc $07,x
$15:cae3  9f 10 e3 c4   sta $c4e310,x
$15:cae7  38            sec
$15:cae8  11 0a         ora ($0a),y
$15:caea  2c 12 0f      bit $0f12
$15:caed  03 82         ora $82,s
$15:caef  c2 a0         rep #$a0
$15:caf1  22 90 c1 7c   jsl $7cc190
$15:caf5  2a            rol a
$15:caf6  db            stp
$15:caf7  0f 24 42 35   ora $354224
$15:cafb  e0 cf 78      cpx #$78cf
$15:cafe  aa            tax
$15:caff  96 4a         stx $4a,y
$15:cb01  e5 92         sbc $92
$15:cb03  71 e6         adc ($e6),y
$15:cb05  f8            sed
$15:cb06  77 b6         adc [$b6],y
$15:cb08  1d e8 84      ora $84e8,x
$15:cb0b  7a            ply
$15:cb0c  41 5c         eor ($5c,x)
$15:cb0e  91 70         sta ($70),y
$15:cb10  30 94         bmi $caa6
$15:cb12  2d 24 0b      and $0b24
$15:cb15  0d 00 8f      ora $8f00
$15:cb18  c2 23         rep #$23
$15:cb1a  90 08         bcc $cb24
$15:cb1c  1c 4e 0f      trb $0f4e
$15:cb1f  14 83         trb $83
$15:cb21  40            rti
$15:cb22  61 6c         adc ($6c,x)
$15:cb24  d0 66         bne $cb8c
$15:cb26  84 06         sty $06
$15:cb28  11 03         ora ($03),y
$15:cb2a  3e 04 4e      rol $4e04,x
$15:cb2d  19 14 85      ora $8514,y
$15:cb30  c0 61 e7      cpy #$e761
$15:cb33  a1 80         lda ($80,x)
$15:cb35  40            rti
$15:cb36  60            rts
$15:cb37  16 0c         asl $0c,x
$15:cb39  44 e2 01      mvp $01,$e2
$15:cb3c  c8            iny
$15:cb3d  e0 5a 34      cpx #$345a
$15:cb40  1a            inc a
$15:cb41  8e 25 63      stx $6325
$15:cb44  01 70         ora ($70,x)
$15:cb46  c4 7e         cpy $7e
$15:cb48  31 18         and ($18),y
$15:cb4a  8e a3 b4      stx $b4a3
$15:cb4d  38            sec
$15:cb4e  13 0d         ora ($0d,s),y
$15:cb50  07 43         ora [$43]
$15:cb52  81 f0         sta ($f0,x)
$15:cb54  c2 78         rep #$78
$15:cb56  31 90         and ($90),y
$15:cb58  0c 24 02      tsb $0224
$15:cb5b  10 ae         bpl $cb0b
$15:cb5d  03 80         ora $80,s
$15:cb5f  1c 02 29      trb $2902
$15:cb62  36 5b         rol $5b,x
$15:cb64  02 e4         cop #$e4
$15:cb66  24 51         bit $51
$15:cb68  48            pha
$15:cb69  a2 bd a7      ldx #$a7bd
$15:cb6c  cc 60 9b      cpy $9b60
$15:cb6f  1c 41 5e      trb $5e41
$15:cb72  10 12         bpl $cb86
$15:cb74  60            rts
$15:cb75  0a            asl a
$15:cb76  42 03         wdm #$03
$15:cb78  05 83         ora $83
$15:cb7a  11 c2         ora ($c2),y
$15:cb7c  35 0e         and $0e,x
$15:cb7e  82 c7 24      brl $f048
$15:cb81  0c d2 81      tsb $81d2
$15:cb84  b8            clv
$15:cb85  86 0d         stx $0d
$15:cb87  00 82         brk #$82
$15:cb89  44 63 11      mvp $11,$63
$15:cb8c  38            sec
$15:cb8d  84 ce         sty $ce
$15:cb8f  48            pha
$15:cb90  8b            phb
$15:cb91  0c 06 01      tsb $0106
$15:cb94  16 14         asl $14,x
$15:cb96  0e 03 d4      asl $d403
$15:cb99  36 1e         rol $1e,x
$15:cb9b  0a            asl a
$15:cb9c  05 c2         ora $c2
$15:cb9e  11 20         ora ($20),y
$15:cba0  45 83         eor $83
$15:cba2  c0 5e 21      cpy #$215e
$15:cba5  c0 7a 04      cpy #$047a
$15:cba8  42 61         wdm #$61
$15:cbaa  90 88         bcc $cb34
$15:cbac  66 29         ror $29
$15:cbae  0c f2 a0      tsb $a0f2
$15:cbb1  50 74         bvc $cc27
$15:cbb3  b2 6a         lda ($6a)
$15:cbb5  44 3e a5      mvp $a5,$3e
$15:cbb8  0e 92 b2      asl $b292
$15:cbbb  d2 07         cmp ($07)
$15:cbbd  83 e1         sta $e1,s
$15:cbbf  f4 fe df      pea $dffe
$15:cbc2  0f e5 c6 f1   ora $f1c6e5
$15:cbc6  33 88         and ($88,s),y
$15:cbc8  44 e0 8e      mvp $8e,$e0
$15:cbcb  f2 82         sbc ($82)
$15:cbcd  41 29         eor ($29,x)
$15:cbcf  5c 89 27 83   jml $832789
$15:cbd3  29 e0 a4      and #$a4e0
$15:cbd6  5c 20 0f e3   jml $e30f20
$15:cbda  c1 61         cmp ($61,x)
$15:cbdc  b2 dd         lda ($dd)
$15:cbde  e8            inx
$15:cbdf  f5 fa         sbc $fa,x
$15:cbe1  39 3c cc      and $cc3c,y
$15:cbe4  44 32 14      mvp $14,$32
$15:cbe7  07 f8         ora [$f8]
$15:cbe9  bf c5 a2 10   lda $10a2c5,x
$15:cbed  c8            iny
$15:cbee  65 ae         adc $ae
$15:cbf0  c3 a6         cmp $a6,s
$15:cbf2  c0 56 a8      cpy #$a856
$15:cbf5  84 f4         sty $f4
$15:cbf7  2a            rol a
$15:cbf8  0c 3a 3d      tsb $3d3a
$15:cbfb  7f bf ff e7   adc $e7ffbf,x
$15:cbff  f7 c8         sbc [$c8],y
$15:cc01  84 42         sty $42
$15:cc03  51 28         eor ($28),y
$15:cc05  80 44         bra $cc4b
$15:cc07  2a            rol a
$15:cc08  96 cc         stx $cc,y
$15:cc0a  16 ea         asl $ea,x
$15:cc0c  53 ef         eor ($ef,s),y
$15:cc0e  aa            tax
$15:cc0f  71 a0         adc ($a0),y
$15:cc11  18            clc
$15:cc12  23 98         and $98,s
$15:cc14  44 27 08      mvp $08,$27
$15:cc17  21 b6         and ($b6,x)
$15:cc19  51 38         eor ($38),y
$15:cc1b  d1 0c         cmp ($0c),y
$15:cc1d  1c e6 03      trb $03e6
$15:cc20  39 2f 2b      and $2b2f,y
$15:cc23  c4 2c         cpy $2c
$15:cc25  16 09         asl $09,x
$15:cc27  64 33         stz $33
$15:cc29  95 02         sta $02,x
$15:cc2b  da            phx
$15:cc2c  17 99         ora [$99],y
$15:cc2e  e2 1e         sep #$1e
$15:cc30  01 38         ora ($38,x)
$15:cc32  7f 3f df 8b   adc $8bdf3f,x
$15:cc36  e3 3e         sbc $3e,s
$15:cc38  21 4d         and ($4d,x)
$15:cc3a  a0 86         ldy #$86
$15:cc3c  48            pha
$15:cc3d  0e 40 20      asl $2040
$15:cc40  17 1a         ora [$1a],y
$15:cc42  40            rti
$15:cc43  61 0e         adc ($0e,x)
$15:cc45  b0 89         bcs $cbd0
$15:cc47  cd 1d f1      cmp $f11d
$15:cc4a  a0 f0         ldy #$f0
$15:cc4c  50 2c         bvc $cc7a
$15:cc4e  10 83         bpl $cbd3
$15:cc50  90 00         bcc $cc52
$15:cc52  1e 01 20      asl $2001,x
$15:cc55  05 86         ora $86
$15:cc57  42 b0         wdm #$b0
$15:cc59  74 08         stz $08,x
$15:cc5b  8c 52 1f      sty $1f52
$15:cc5e  18            clc
$15:cc5f  9f c1 2f 71   sta $712fc1,x
$15:cc63  cb            wai
$15:cc64  7c a2 bf      jmp ($bfa2,x)
$15:cc67  10 8f         bpl $cbf8
$15:cc69  c0 2a         cpy #$2a
$15:cc6b  90 88         bcc $cbf5
$15:cc6d  a4 22         ldy $22
$15:cc6f  30 c7         bmi $cc38
$15:cc71  08            php
$15:cc72  00 70         brk #$70
$15:cc74  25 06         and $06
$15:cc76  f0 1f         beq $cc97
$15:cc78  0d 42 71      ora $7142
$15:cc7b  b6 a5         ldx $a5,y
$15:cc7d  76 a4         ror $a4,x
$15:cc7f  1e c8 87      asl $87c8,x
$15:cc82  e2 01         sep #$01
$15:cc84  f0 82         beq $cc08
$15:cc86  78            sei
$15:cc87  0c 43 38      tsb $3843
$15:cc8a  83 52         sta $52,s
$15:cc8c  9d 21 1c      sta $1c21,x
$15:cc8f  88            dey
$15:cc90  4b            phk
$15:cc91  20 10 c8      jsr $c810
$15:cc94  20 0c 0c      jsr $0c0c
$15:cc97  43 1c         eor $1c,s
$15:cc99  8a            txa
$15:cc9a  4f e7 16 f8   eor $f816e7
$15:cc9e  85 be         sta $be
$15:cca0  61 4f         adc ($4f,x)
$15:cca2  84 4d         sty $4d
$15:cca4  e0 11         cpx #$11
$15:cca6  e3 10         sbc $10,s
$15:cca8  c4 e4         cpy $e4
$15:ccaa  13 88         ora ($88,s),y
$15:ccac  04 42         tsb $42
$15:ccae  01 30         ora ($30,x)
$15:ccb0  80 42         bra $ccf4
$15:ccb2  08            php
$15:ccb3  a0 2a         ldy #$2a
$15:ccb5  3b            tsc
$15:ccb6  d5 1b         cmp $1b,x
$15:ccb8  f9 12 fe      sbc $fe12,y
$15:ccbb  40            rti
$15:ccbc  02 e3         cop #$e3
$15:ccbe  00 e0         brk #$e0
$15:ccc0  28            plp
$15:ccc1  4f 0d 00 89   eor $89000d
$15:ccc5  28            plp
$15:ccc6  4c c4 d3      jmp $d3c4
$15:ccc9  f8            sed
$15:ccca  45 82         eor $82
$15:cccc  13 2c         ora ($2c,s),y
$15:ccce  91 c5         sta ($c5),y
$15:ccd0  a1 ef         lda ($ef,x)
$15:ccd2  d0 87         bne $cc5b
$15:ccd4  c0 20         cpy #$20
$15:ccd6  ea            nop
$15:ccd7  11 84         ora ($84),y
$15:ccd9  5d e1 37      eor $37e1,x
$15:ccdc  69 1d 00      adc #$001d
$15:ccdf  f2 06         sbc ($06)
$15:cce1  26 b6         rol $b6
$15:cce3  65 3a         adc $3a
$15:cce5  93 8c         sta ($8c,s),y
$15:cce7  c4 03         cpy $03
$15:cce9  99 50 f3      sta $f350,y
$15:ccec  42 3b         wdm #$3b
$15:ccee  d4 4b         pei ($4b)
$15:ccf0  74 21         stz $21,x
$15:ccf2  14 19         trb $19
$15:ccf4  00 f0         brk #$f0
$15:ccf6  22 82 c1 50   jsl $50c182
$15:ccfa  90 42         bcc $cd3e
$15:ccfc  22 14 45 30   jsl $304514
$15:cd00  15 c1         ora $c1,x
$15:cd02  14 04         trb $04
$15:cd04  30 21         bmi $cd27
$15:cd06  82 cd 16      brl $e3d6
$15:cd09  05 10         ora $10
$15:cd0b  01 00         ora ($00,x)
$15:cd0d  08            php
$15:cd0e  51 46         eor ($46),y
$15:cd10  bf 26 58 4d   lda $4d5826,x
$15:cd14  63 70         adc $70,s
$15:cd16  a8            tay
$15:cd17  0d b6 51      ora $51b6
$15:cd1a  07 86         ora [$86]
$15:cd1c  41 60         eor ($60,x)
$15:cd1e  90 18         bcc $cd38
$15:cd20  0c 0e 05      tsb $050e
$15:cd23  00 11         brk #$11
$15:cd25  04 52         tsb $52
$15:cd27  c1 66         cmp ($66,x)
$15:cd29  a4 58         ldy $58
$15:cd2b  e9 94 18      sbc #$1894
$15:cd2e  24 0d         bit $0d
$15:cd30  b4 30         ldy $30,x
$15:cd32  18            clc
$15:cd33  04 06         tsb $06
$15:cd35  b1 b0         lda ($b0),y
$15:cd37  d0 23         bne $cd5c
$15:cd39  82 51 c0      brl $8d8d
$15:cd3c  b0 50         bcs $cd8e
$15:cd3e  28            plp
$15:cd3f  0d d0 c0      ora $c0d0
$15:cd42  60            rts
$15:cd43  1b            tcs
$15:cd44  a1 08         lda ($08,x)
$15:cd46  a8            tay
$15:cd47  43 39         eor $39,s
$15:cd49  92 4c         sta ($4c)
$15:cd4b  65 92         adc $92
$15:cd4d  09 40 7e      ora #$7e40
$15:cd50  03 ec         ora $ec,s
$15:cd52  a0 11         ldy #$11
$15:cd54  56 80         lsr $80,x
$15:cd56  c3 61         cmp $61,s
$15:cd58  0d 58 80      ora $8058
$15:cd5b  45 20         eor $20
$15:cd5d  10 68         bpl $cdc7
$15:cd5f  44 0e 19      mvp $19,$0e
$15:cd62  01 73         ora ($73,x)
$15:cd64  b5 41         lda $41,x
$15:cd66  e0 36         cpx #$36
$15:cd68  09 03 d6      ora #$d603
$15:cd6b  20 15 02      jsr $0215
$15:cd6e  c0 48         cpy #$48
$15:cd70  30 16         bmi $cd88
$15:cd72  08            php
$15:cd73  00 1d         brk #$1d
$15:cd75  b6 98         ldx $98,y
$15:cd77  90 60         bcc $cdd9
$15:cd79  94 66         sty $66,x
$15:cd7b  fd f9 28      sbc $28f9,x
$15:cd7e  e5 53         sbc $53
$15:cd80  77 aa         adc [$aa],y
$15:cd82  88            dey
$15:cd83  75 b0         adc $b0,x
$15:cd85  57 ce         eor [$ce],y
$15:cd87  35 52         and $52,x
$15:cd89  89 10 88      bit #$8810
$15:cd8c  4e 25 00      lsr $0025
$15:cd8f  c1 a2         cmp ($a2,x)
$15:cd91  bc 83 05      ldy $0583,x
$15:cd94  38            sec
$15:cd95  e3 2a         sbc $2a,s
$15:cd97  02 70         cop #$70
$15:cd99  7a            ply
$15:cd9a  18            clc
$15:cd9b  82 f4 2b      brl $f992
$15:cd9e  52 22         eor ($22)
$15:cda0  8e 7f 27      stx $277f
$15:cda3  c5 1c         cmp $1c
$15:cda5  8a            txa
$15:cda6  c2 e3         rep #$e3
$15:cda8  50 18         bvc $cdc2
$15:cdaa  eb            xba
$15:cdab  50 68         bvc $ce15
$15:cdad  b0 4a         bcs $cdf9
$15:cdaf  0c 07 06      tsb $0607
$15:cdb2  dc 19 84      jml [$8419]
$15:cdb5  d2 e1         cmp ($e1)
$15:cdb7  66 bc         ror $bc
$15:cdb9  58            cli
$15:cdba  ff 9d 1b 25   sbc $251b9d,x
$15:cdbe  8f 83 c3 c1   sta $c1c383
$15:cdc2  60            rts
$15:cdc3  45 a3         eor $a3
$15:cdc5  a0 d8         ldy #$d8
$15:cdc7  40            rti
$15:cdc8  2e 0f 41      rol $410f
$15:cdcb  a2 50         ldx #$50
$15:cdcd  20 90 0c      jsr $0c90
$15:cdd0  10 20         bpl $cdf2
$15:cdd2  20 11 8a      jsr $8a11
$15:cdd5  c4 73         cpy $73
$15:cdd7  99 3c c6      sta $c63c,y
$15:cdda  5f a2 d4 cc   eor $ccd4a2,x
$15:cdde  64 1b         stz $1b
$15:cde0  0d 82 0e      ora $0e82
$15:cde3  14 00         trb $00
$15:cde5  2e 10 a8      rol $a810
$15:cde8  4c 1a 02      jmp $021a
$15:cdeb  f5 0a         sbc $0a,x
$15:cded  bc 03 67      ldy $6703,x
$15:cdf0  88            dey
$15:cdf1  f2 53         sbc ($53)
$15:cdf3  15 a0         ora $a0,x
$15:cdf5  27 08         and [$08]
$15:cdf7  4c 1e 03      jmp $031e
$15:cdfa  0f 02 84 02   ora $028402
$15:cdfe  df 88 b3 d3   cmp $d3b388,x
$15:ce02  36 6a         rol $6a,x
$15:ce04  d0 1b         bne $ce21
$15:ce06  84 83         sty $83
$15:ce08  41 80         eor ($80,x)
$15:ce0a  e0 64         cpx #$64
$15:ce0c  38            sec
$15:ce0d  15 cc         ora $cc,x
$15:ce0f  26 fa         rol $fa
$15:ce11  55 f0         eor $f0,x
$15:ce13  e6 03         inc $03
$15:ce15  c7 01         cmp [$01]
$15:ce17  a0 e0         ldy #$e0
$15:ce19  70 3c         bvs $ce57
$15:ce1b  1c 0f c6      trb $c60f
$15:ce1e  13 d1         ora ($d1,s),y
$15:ce20  2a            rol a
$15:ce21  e2 73         sep #$73
$15:ce23  24 ce         bit $ce
$15:ce25  fa            plx
$15:ce26  dd bf 3c      cmp $3cbf,x
$15:ce29  1b            tcs
$15:ce2a  d7 8a         cmp [$8a],y
$15:ce2c  20 7f 28      jsr $287f
$15:ce2f  9a            txs
$15:ce30  65 09         adc $09
$15:ce32  40            rti
$15:ce33  e0 0f         cpx #$0f
$15:ce35  70 8f         bvs $cdc6
$15:ce37  44 63 f1      mvp $f1,$63
$15:ce3a  02 40         cop #$40
$15:ce3c  45 d4         eor $d4
$15:ce3e  28            plp
$15:ce3f  44 18 8c      mvp $8c,$18
$15:ce42  3c f4 31      bit $31f4,x
$15:ce45  f4 58 a8      pea $a858
$15:ce48  48            pha
$15:ce49  2a            rol a
$15:ce4a  02 41         cop #$41
$15:ce4c  90 70         bcc $cebe
$15:ce4e  3a            dec a
$15:ce4f  11 0f         ora ($0f),y
$15:ce51  02 3d         cop #$3d
$15:ce53  bc 0a 60      ldy $600a,x
$15:ce56  12 82         ora ($82)
$15:ce58  70 62         bvs $cebc
$15:ce5a  0a            asl a
$15:ce5b  de 84 46      dec $4684,x
$15:ce5e  17 f8         ora [$f8],y
$15:ce60  71 18         adc ($18),y
$15:ce62  14 06         trb $06
$15:ce64  03 05         ora $05,s
$15:ce66  83 34         sta $34,s
$15:ce68  82 0d 0a      brl $d878
$15:ce6b  80 c2         bra $ce2f
$15:ce6d  24 90         bit $90
$15:ce6f  c8            iny
$15:ce70  04 05         tsb $05
$15:ce72  a4 30         ldy $30
$15:ce74  37 b8         and [$b8],y
$15:ce76  1d 04 82      ora $8204,x
$15:ce79  10 49         bpl $cec4
$15:ce7b  9a            txs
$15:ce7c  84 14         sty $14
$15:ce7e  41 80         eor ($80,x)
$15:ce80  07 8f         ora [$8f]
$15:ce82  01 e4         ora ($e4,x)
$15:ce84  1c 0d 04      trb $040d
$15:ce87  02 41         cop #$41
$15:ce89  48            pha
$15:ce8a  b0 28         bcs $ceb4
$15:ce8c  45 42         eor $42
$15:ce8e  4a            lsr a
$15:ce8f  10 02         bpl $ce93
$15:ce91  80 84         bra $ce17
$15:ce93  28            plp
$15:ce94  19 87 70      ora $7087,y
$15:ce97  b4 63         ldy $63,x
$15:ce99  83 08         sta $08,s
$15:ce9b  ea            nop
$15:ce9c  6f 1b f5 e3   adc $e3f51b
$15:cea0  f2 58         sbc ($58)
$15:cea2  d3 a2         cmp ($a2,s),y
$15:cea4  f1 88         sbc ($88),y
$15:cea6  34 82         bit $82,x
$15:cea8  ad 7a 7f      lda $7f7a
$15:ceab  d6 3a         dec $3a,x
$15:cead  9d 8c 87      sta $878c,x
$15:ceb0  3b            tsc
$15:ceb1  84 a3         sty $a3
$15:ceb3  e6 0c         inc $0c
$15:ceb5  9c 4a 22      stz $224a
$15:ceb8  11 0a         ora ($0a),y
$15:ceba  a5 b0         lda $b0
$15:cebc  e4 16         cpx $16
$15:cebe  cd 54 43      cmp $4354
$15:cec1  05 44         ora $44
$15:cec3  e3 2f         sbc $2f,s
$15:cec5  40            rti
$15:cec6  e4 33         cpx $33
$15:cec8  8b            phb
$15:cec9  62 b8 10      per $df84
$15:cecc  a1 44         lda ($44,x)
$15:cece  9c 22 80      stz $8022
$15:ced1  c1 e9         cmp ($e9,x)
$15:ced3  ef 68 5c 11   sbc $115c68
$15:ced7  bd b0 37      lda $37b0,x
$15:ceda  76 d0         ror $d0,x
$15:cedc  1f da d2 0c   ora $0cd2da,x
$15:cee0  54 47 af      mvn $af,$47
$15:cee3  18            clc
$15:cee4  a6 c5         ldx $c5
$15:cee6  36 f0         rol $f0,x
$15:cee8  b8            clv
$15:cee9  c5 9e         cmp $9e
$15:ceeb  af 88 ea 53   lda $53ea88
$15:ceef  f7 71         sbc [$71],y
$15:cef1  f8            sed
$15:cef2  8f de 31 f0   sta $f031de
$15:cef6  8a            txa
$15:cef7  7c e0 77      jmp ($77e0,x)
$15:cefa  0b            phd
$15:cefb  0b            phd
$15:cefc  44 69 18      mvp $18,$69
$15:ceff  08            php
$15:cf00  e7 03         sbc [$03]
$15:cf02  f1 84         sbc ($84),y
$15:cf04  ed 48 2f      sbc $2f48
$15:cf07  94 0e         sty $0e,x
$15:cf09  d6 82         dec $82,x
$15:cf0b  6d c2 eb      adc $ebc2
$15:cf0e  49 2a         eor #$2a
$15:cf10  5e ad 27      lsr $27ad,x
$15:cf13  db            stp
$15:cf14  09 c6         ora #$c6
$15:cf16  90 41         bcc $cf59
$15:cf18  a8            tay
$15:cf19  18            clc
$15:cf1a  6c 04 12      jmp ($1204)
$15:cf1d  05 00         ora $00
$15:cf1f  82 40 25      brl $f462
$15:cf22  50 4b         bvc $cf6f
$15:cf24  b4 03         ldy $03,x
$15:cf26  0d 19 78      ora $7819
$15:cf29  85 3e         sta $3e
$15:cf2b  21 b0         and ($b0,x)
$15:cf2d  87 fc         sta [$fc]
$15:cf2f  f1 f5         sbc ($f5),y
$15:cf31  4a            lsr a
$15:cf32  65 d6         adc $d6
$15:cf34  9b            txy
$15:cf35  39 e7 46      and $46e7,y
$15:cf38  40            rti
$15:cf39  01 f7         ora ($f7,x)
$15:cf3b  88            dey
$15:cf3c  7c 21 17      jmp ($1721,x)
$15:cf3f  5c 44 1e 87   jml $871e44
$15:cf43  85 a5         sta $a5
$15:cf45  60            rts
$15:cf46  78            sei
$15:cf47  50 0d         bvc $cf56
$15:cf49  c7 12         cmp [$12]
$15:cf4b  d5 90         cmp $90,x
$15:cf4d  e6 4c         inc $4c
$15:cf4f  25 1f         and $1f
$15:cf51  0d 86 83      ora $8386
$15:cf54  a1 60         lda ($60,x)
$15:cf56  6e 84 c3      ror $c384
$15:cf59  c1 c4         cmp ($c4,x)
$15:cf5b  f3 64         sbc ($64,s),y
$15:cf5d  38            sec
$15:cf5e  d1 08         cmp ($08),y
$15:cf60  32 24         and ($24)
$15:cf62  1a            inc a
$15:cf63  a3 40         lda $40,s
$15:cf65  6d 03 84      adc $8403
$15:cf68  23 30         and $30,s
$15:cf6a  08            php
$15:cf6b  fc 42 51      jsr ($5142,x)
$15:cf6e  04 8a         tsb $8a
$15:cf70  ca            dex
$15:cf71  6c 31 0d      jmp ($0d31)
$15:cf74  14 07         trb $07
$15:cf76  07 02         ora [$02]
$15:cf78  a0 b1         ldy #$b1
$15:cf7a  82 1d 10      brl $df9a
$15:cf7d  64 84         stz $84
$15:cf7f  6e 53 42      ror $4253
$15:cf82  88            dey
$15:cf83  78            sei
$15:cf84  e0 26         cpx #$26
$15:cf86  b2 a0         lda ($a0)
$15:cf88  74 25         stz $25,x
$15:cf8a  10 88         bpl $cf14
$15:cf8c  07 c3         ora [$c3]
$15:cf8e  e1 d8         sbc ($d8,x)
$15:cf90  94 6a         sty $6a,x
$15:cf92  2e 15 09      rol $0915
$15:cf95  27 92         and [$92]
$15:cf97  39 bc 47      and $47bc,y
$15:cf9a  87 c2         sta [$c2]
$15:cf9c  01 f8         ora ($f8,x)
$15:cf9e  f8            sed
$15:cf9f  43 25         eor $25,s
$15:cfa1  1f 4b 87 f2   ora $f2874b,x
$15:cfa5  49 f8         eor #$f8
$15:cfa7  8e 40 22      stx $2240
$15:cfaa  10 86         bpl $cf32
$15:cfac  b0 7c         bcs $d02a
$15:cfae  2c 17 8b      bit $8b17
$15:cfb1  c5 a2         cmp $a2
$15:cfb3  51 34         eor ($34),y
$15:cfb5  9a            txs
$15:cfb6  42 12         wdm #$12
$15:cfb8  20 29 08      jsr $0829
$15:cfbb  13 58         ora ($58,s),y
$15:cfbd  3f 16 0b e5   and $e50b16,x
$15:cfc1  e2 f9         sep #$f9
$15:cfc3  28            plp
$15:cfc4  bc 4c 26      ldy $264c,x
$15:cfc7  8b            phb
$15:cfc8  d0 83         bne $cf4d
$15:cfca  40            rti
$15:cfcb  60            rts
$15:cfcc  72 48         adc ($48)
$15:cfce  e4 0a         cpx $0a
$15:cfd0  1d 01 87      ora $8701,x
$15:cfd3  c2 61         rep #$61
$15:cfd5  d0 48         bne $d01f
$15:cfd7  29 f8 20      and #$20f8
$15:cfda  50 28         bvc $d004
$15:cfdc  0c 06 e7      tsb $e706
$15:cfdf  70 98         bvs $cf79
$15:cfe1  cc 20 10      cpy $1020
$15:cfe4  88            dey
$15:cfe5  1c 3a 07      trb $073a
$15:cfe8  07 81         ora [$81]
$15:cfea  c0 d9         cpy #$d9
$15:cfec  a1 00         lda ($00,x)
$15:cfee  80 d2         bra $cfc2
$15:cff0  2e 18 0f      rol $0f18
$15:cff3  04 03         tsb $03
$15:cff5  c1 20         cmp ($20,x)
$15:cff7  f0 50         beq $d049
$15:cff9  28            plp
$15:cffa  10 03         bpl $cfff
$15:cffc  60            rts
$15:cffd  60            rts
$15:cffe  1f 21 9c 8e   ora $8e9c21,x
$15:d002  46 23         lsr $23
$15:d004  10 09         bpl $d00f
$15:d006  03 c4         ora $c4,s
$15:d008  30 0b         bmi $d015
$15:d00a  f0 7e         beq $d08a
$15:d00c  03 f0         ora $f0,s
$15:d00e  64 90         stz $90
$15:d010  ca            dex
$15:d011  95 39         sta $39,x
$15:d013  a7 5f         lda [$5f]
$15:d015  3f 04 c6 e1   and $e1c604,x
$15:d019  30 9c         bmi $cfb7
$15:d01b  39 66 c1      and $c166,y
$15:d01e  94 f2         sty $f2,x
$15:d020  3c eb 3d      bit $3deb,x
$15:d023  0e 8c 00      asl $008c
$15:d026  02 70         cop #$70
$15:d028  05 8d         ora $8d
$15:d02a  a6 26         ldx $26
$15:d02c  b5 44         lda $44,x
$15:d02e  d3 60         cmp ($60,s),y
$15:d030  2d 16 08      and $0816
$15:d033  64 31         stz $31
$15:d035  b6 0f         ldx $0f,y
$15:d037  90 7c         bcc $d0b5
$15:d039  85 fb         sta $fb
$15:d03b  f3 3f         sbc ($3f,s),y
$15:d03d  be 5f ff      ldx $ff5f,y
$15:d040  f1 fb         sbc ($fb),y
$15:d042  fb            xce
$15:d043  44 17 a0      mvp $a0,$17
$15:d046  5b            tcd
$15:d047  2a            rol a
$15:d048  27 1e         and [$1e]
$15:d04a  51 ee         eor ($ee),y
$15:d04c  88            dey
$15:d04d  7f b2 5e ea   adc $ea5eb2,x
$15:d051  25 52         and $52
$15:d053  21 00         and ($00,x)
$15:d055  94 4a         sty $4a,x
$15:d057  22 11 09 c4   jsl $c40911
$15:d05b  06 22         asl $22
$15:d05d  ed 0c 1c      sbc $1c0c
$15:d060  e7 df         sbc [$df]
$15:d062  38            sec
$15:d063  be 4e 27      ldx $274e,y
$15:d066  07 e0         ora [$e0]
$15:d068  56 05         lsr $05,x
$15:d06a  6a            ror a
$15:d06b  45 b4         eor $b4
$15:d06d  a2 72         ldx #$72
$15:d06f  a0 52         ldy #$52
$15:d071  c8            iny
$15:d072  65 82         adc $82
$15:d074  c0 fb         cpy #$fb
$15:d076  27 c8         and [$c8]
$15:d078  7f 27 df 8b   adc $8bdf27,x
$15:d07c  e7 f3         sbc [$f3]
$15:d07e  fd f0 fe      sbc $fef0,x
$15:d081  3c 45 34      bit $3445,x
$15:d084  71 48         adc ($48),y
$15:d086  66 0b         ror $0b
$15:d088  3d 41 a7      and $a741,x
$15:d08b  da            phx
$15:d08c  6d d1 48      adc $48d1
$15:d08f  a8            tay
$15:d090  65 22         adc $22
$15:d092  70 0b         bvs $d09f
$15:d094  8f 42 61 78   sta $786142
$15:d098  89 df a0      bit #$a0df
$15:d09b  71 77         adc ($77),y
$15:d09d  4a            lsr a
$15:d09e  54 2c 18      mvn $18,$2c
$15:d0a1  2f 94 13 c9   and $c91394
$15:d0a5  2c f6 54      bit $54f6
$15:d0a8  2a            rol a
$15:d0a9  0f 94 c8 40   ora $40c894
$15:d0ad  23 91         and $91,s
$15:d0af  68            pla
$15:d0b0  c4 f3         cpy $f3
$15:d0b2  20 a6 0e      jsr $0ea6
$15:d0b5  80 25         bra $d0dc
$15:d0b7  22 93 8e de   jsl $de8e93
$15:d0bb  93 6f         sta ($6f,s),y
$15:d0bd  08            php
$15:d0be  b7 c4         lda [$c4],y
$15:d0c0  27 f0         and [$f0]
$15:d0c2  08            php
$15:d0c3  fd 02 1e      sbc $1e02,x
$15:d0c6  82 08 04      brl $d4d1
$15:d0c9  e3 81         sbc $81,s
$15:d0cb  a4 80         ldy $80
$15:d0cd  42 2e         wdm #$2e
$15:d0cf  11 0b         ora ($0b),y
$15:d0d1  44 02 c1      mvp $c1,$02
$15:d0d4  40            rti
$15:d0d5  98            tya
$15:d0d6  16 ca         asl $ca,x
$15:d0d8  20 78 0a      jsr $0a78
$15:d0db  87 82         sta [$82]
$15:d0dd  61 f8         adc ($f8,x)
$15:d0df  a0 6f         ldy #$6f
$15:d0e1  2e 1e c9      rol $c91e
$15:d0e4  47 d2         eor [$d2]
$15:d0e6  21 f0         and ($f0,x)
$15:d0e8  80 55         bra $d13f
$15:d0ea  24 15         bit $15
$15:d0ec  09 00 28      ora #$2800
$15:d0ef  07 01         ora [$01]
$15:d0f1  70 3d         bvs $d130
$15:d0f3  01 f4         ora ($f4,x)
$15:d0f5  21 05         and ($05,x)
$15:d0f7  c0 de         cpy #$de
$15:d0f9  71 2f         adc ($2f),y
$15:d0fb  f9 0b fc      sbc $fc0b,y
$15:d0fe  01 ee         ora ($ee,x)
$15:d100  30 08         bmi $d10a
$15:d102  39 6c a0      and $a06c,y
$15:d105  1c 36 f0      trb $f036
$15:d108  90 aa         bcc $d0b4
$15:d10a  e1 50         sbc ($50,x)
$15:d10c  fc 4e 3d      jsr ($3d4e,x)
$15:d10f  91 0f         sta ($0f),y
$15:d111  64 63         stz $63
$15:d113  c9 20 ec      cmp #$ec20
$15:d116  40            rti
$15:d117  03 a0         ora $a0,s
$15:d119  dd 18 42      cmp $4218,x
$15:d11c  30 60         bmi $d17e
$15:d11e  11 88         ora ($88),y
$15:d120  04 80         tsb $80
$15:d122  ca            dex
$15:d123  00 a3         brk #$a3
$15:d125  5c 80 e4 23   jml $23e480
$15:d129  b0 19         bcs $d144
$15:d12b  f4 0a 78      pea $780a
$15:d12e  76 08         ror $08,x
$15:d130  2c 58 84      bit $8458
$15:d133  b0 15         bcs $d14a
$15:d135  d8            cld
$15:d136  af 02 0b 02   lda $020b02
$15:d13a  80 3e         bra $d17a
$15:d13c  c2 01         rep #$01
$15:d13e  e0 8a         cpx #$8a
$15:d140  44 39 9b      mvp $9b,$39
$15:d143  ce 47 52      dec $5247
$15:d146  01 fc         ora ($fc,x)
$15:d148  88            dey
$15:d149  5e 38 1f      lsr $1f38,x
$15:d14c  07 61         ora [$61]
$15:d14e  42 39         wdm #$39
$15:d150  93 0e         sta ($0e,s),y
$15:d152  40            rti
$15:d153  28            plp
$15:d154  27 06         and [$06]
$15:d156  30 e0         bmi $d138
$15:d158  3a            dec a
$15:d159  c8            iny
$15:d15a  18            clc
$15:d15b  30 e8         bmi $d145
$15:d15d  34 fe         bit $fe,x
$15:d15f  3b            tsc
$15:d160  f0 b0         beq $d112
$15:d162  2c c1 62      bit $62c1
$15:d165  04 24         tsb $24
$15:d167  86 41         stx $41
$15:d169  27 d1         and [$d1]
$15:d16b  cf fd 81 86   cmp $8681fd
$15:d16f  0c 10 06      tsb $0610
$15:d172  0b            phd
$15:d173  2c 9d 81      bit $819d
$15:d176  40            rti
$15:d177  33 01         and ($01,s),y
$15:d179  88            dey
$15:d17a  45 80         eor $80
$15:d17c  ca            dex
$15:d17d  08            php
$15:d17e  16 03         asl $03,x
$15:d180  01 40         ora ($40,x)
$15:d182  e0 48         cpx #$48
$15:d184  2c 11 09      bit $0911
$15:d187  84 22         sty $22
$15:d189  31 04         and ($04),y
$15:d18b  86 40         stx $40
$15:d18d  a0 d0         ldy #$d0
$15:d18f  18            clc
$15:d190  1b            tcs
$15:d191  2c 8d e0      bit $e08d
$15:d194  ba            tsx
$15:d195  08            php
$15:d196  cc 6e f9      cpy $f96e
$15:d199  50 fd         bvc $d198
$15:d19b  40            rti
$15:d19c  2b            pld
$15:d19d  cd 40 78      cmp $7840
$15:d1a0  1a            inc a
$15:d1a1  2c 1d 01      bit $011d
$15:d1a4  51 f7         eor ($f7),y
$15:d1a6  40            rti
$15:d1a7  3e f4 1d      rol $1df4,x
$15:d1aa  c3 2c         cmp $2c,s
$15:d1ac  a8            tay
$15:d1ad  01 31         ora ($31,x)
$15:d1af  f8            sed
$15:d1b0  4c 2a 51      jmp $512a
$15:d1b3  ac de 56      ldy $56de
$15:d1b6  45 3a         eor $3a
$15:d1b8  67 1f         adc [$1f]
$15:d1ba  03 41         ora $41,s
$15:d1bc  20 e0 15      jsr $15e0
$15:d1bf  02 1d         cop #$1d
$15:d1c1  6e 83 f3      ror $f383
$15:d1c4  21 cc         and ($cc,x)
$15:d1c6  b5 65         lda $65,x
$15:d1c8  aa            tax
$15:d1c9  e9 45 f1      sbc #$f145
$15:d1cc  0f 90 38 c2   ora $c23890
$15:d1d0  41 58         eor ($58,x)
$15:d1d2  84 58         sty $58
$15:d1d4  20 16 8c      jsr $8c16
$15:d1d7  06 d2         asl $d2
$15:d1d9  89 30 e0      bit #$e030
$15:d1dc  5a            phy
$15:d1dd  2d 14 0b      and $0b14
$15:d1e0  05 42         ora $42
$15:d1e2  e1 70         sbc ($70,x)
$15:d1e4  bc 19 03      ldy $0319,x
$15:d1e7  f0 67         beq $d250
$15:d1e9  0b            phd
$15:d1ea  e4 f2         cpx $f2
$15:d1ec  79 90 9c      adc $9c90,y
$15:d1ef  0d 61 ee      ora $ee61
$15:d1f2  84 58         sty $58
$15:d1f4  03 a3         ora $a3,s
$15:d1f6  2c b8 14      bit $14b8
$15:d1f9  0e 84 42      asl $4284
$15:d1fc  91 48         sta ($48),y
$15:d1fe  f0 4f         beq $d24f
$15:d200  03 24         ora $24,s
$15:d202  cb            wai
$15:d203  2d 07 83      and $8307
$15:d206  c1 f0         cmp ($f0,x)
$15:d208  d8            cld
$15:d209  4e 38 11      lsr $1138
$15:d20c  c1 49         cmp ($49,x)
$15:d20e  1c e9 fa      trb $fae9
$15:d211  10 99         bpl $d1ac
$15:d213  ca            dex
$15:d214  0e 81 a1      asl $a181
$15:d217  39 1e 98      and $981e,y
$15:d21a  56 39         lsr $39,x
$15:d21c  1f 80 f9 a4   ora $a4f980,x
$15:d220  80 50         bra $d272
$15:d222  d1 88         cmp ($88),y
$15:d224  2c 12 15      bit $1512
$15:d227  09 83 40      ora #$4083
$15:d22a  5e 61 7f      lsr $7f61,x
$15:d22d  84 5a         sty $5a
$15:d22f  e1 13         sbc ($13,x)
$15:d231  48            pha
$15:d232  26 ea         rol $ea
$15:d234  a3 04         lda $04,s
$15:d236  81 c2         sta ($c2,x)
$15:d238  60            rts
$15:d239  f0 18         beq $d253
$15:d23b  78            sei
$15:d23c  0c 21 17      tsb $1721
$15:d23f  70 38         bvs $d279
$15:d241  41 29         eor ($29,x)
$15:d243  75 1c         adc $1c,x
$15:d245  3b            tsc
$15:d246  4c 24 1a      jmp $1a24
$15:d249  0c 07 00      tsb $0007
$15:d24c  26 15         rol $15
$15:d24e  4c 06 6a      jmp $6a06
$15:d251  45 ca         eor $ca
$15:d253  f0 78         beq $d2cd
$15:d255  b2 14         lda ($14)
$15:d257  0c 06 83      tsb $8306
$15:d25a  81 c0         sta ($c0,x)
$15:d25c  f0 08         beq $d266
$15:d25e  c3 01         cmp $01,s
$15:d260  ec 91 73      cpx $7391
$15:d263  3c 11 ec      bit $ec11,x
$15:d266  87 7a         sta [$7a]
$15:d268  00 2f         brk #$2f
$15:d26a  17 7a         ora [$7a],y
$15:d26c  45 a0         eor $a0
$15:d26e  37 7a         and [$7a],y
$15:d270  07 ef         ora [$ef]
$15:d272  50 2f         bvc $d2a3
$15:d274  27 fa         and [$fa]
$15:d276  cf e8 12 fd   cmp $fd12e8
$15:d27a  45 1c         eor $1c
$15:d27c  5e 40 f0      lsr $f040,x
$15:d27f  96 68         stx $68,y
$15:d281  31 dc         and ($dc),y
$15:d283  0c 27 02      tsb $0227
$15:d286  b9 82 db      lda $db82,y
$15:d289  44 89 e6      mvp $e6,$89
$15:d28c  20 0e 77      jsr $770e
$15:d28f  03 dd         ora $dd,s
$15:d291  c0 f5         cpy #$f5
$15:d293  60            rts
$15:d294  bc 11 2e      ldy $2e11,x
$15:d297  c0 bc         cpy #$bc
$15:d299  20 30 08      jsr $0830
$15:d29c  1b            tcs
$15:d29d  0c 21 00      tsb $0021
$15:d2a0  60            rts
$15:d2a1  57 04         eor [$04],y
$15:d2a3  25 86         and $86
$15:d2a5  10 41         bpl $d2e8
$15:d2a7  78            sei
$15:d2a8  9c c2 0e      stz $0ec2
$15:d2ab  78            sei
$15:d2ac  03 c0         ora $c0,s
$15:d2ae  c3 e0         cmp $e0,s
$15:d2b0  10 e8         bpl $d29a
$15:d2b2  21 c4         and ($c4,x)
$15:d2b4  20 18 ca      jsr $ca18
$15:d2b7  05 bb         ora $bb
$15:d2b9  c1 68         cmp ($68,x)
$15:d2bb  fe 65 2d      inc $2d65,x
$15:d2be  5e a8 27      lsr $27a8,x
$15:d2c1  ca            dex
$15:d2c2  29 b2 a2      and #$a2b2
$15:d2c5  14 47         trb $47
$15:d2c7  dd e0 ff      cmp $ffe0,x
$15:d2ca  7f 3e 56 af   adc $af563e,x
$15:d2ce  a2 68         ldx #$68
$15:d2d0  61 74         adc ($74,x)
$15:d2d2  4f 58 bc 95   eor $95bc58
$15:d2d6  e7 c7         sbc [$c7]
$15:d2d8  57 ba         eor [$ba],y
$15:d2da  d4 97         pei ($97)
$15:d2dc  00 b8         brk #$b8
$15:d2de  b6 90         ldx $90,y
$15:d2e0  ff da 48 d2   sbc $d248da,x
$15:d2e4  56 c0         lsr $c0,x
$15:d2e6  36 16         rol $16,x
$15:d2e8  13 39         ora ($39,s),y
$15:d2ea  81 01         sta ($01,x)
$15:d2ec  00 e0         brk #$e0
$15:d2ee  28            plp
$15:d2ef  e1 69         sbc ($69,x)
$15:d2f1  1c e6 0d      trb $0de6
$15:d2f4  0c 7a 10      tsb $107a
$15:d2f7  14 da         trb $da
$15:d2f9  45 c0         eor $c0
$15:d2fb  fc 42 3f      jsr ($3f42,x)
$15:d2fe  13 0d         ora ($0d,s),y
$15:d300  c7 82         cmp [$82]
$15:d302  01 50         ora ($50,x)
$15:d304  88            dey
$15:d305  68            pla
$15:d306  34 0d         bit $0d,x
$15:d308  23 8c         and $8c,s
$15:d30a  40            rti
$15:d30b  27 00         and [$00]
$15:d30d  f0 f8         beq $d307
$15:d30f  7c 3c 1f      jmp ($1f3c,x)
$15:d312  0a            asl a
$15:d313  00 54         brk #$54
$15:d315  1a            inc a
$15:d316  43 19         eor $19,s
$15:d318  8d df 2a      sta $2adf
$15:d31b  1f a8 05 7a   ora $7a05a8,x
$15:d31f  80 ef         bra $d310
$15:d321  20 e1 c1      jsr $c1e1
$15:d324  2a            rol a
$15:d325  3e e8 07      rol $07e8,x
$15:d328  de 83 b8      dec $b883,x
$15:d32b  7f 93 48 bf   adc $bf4893,x
$15:d32f  13 8a         ora ($8a,s),y
$15:d331  94 6b         sty $6b,x
$15:d333  37 95         and [$95],y
$15:d335  b9 4a b6      lda $b64a,y
$15:d338  18            clc
$15:d339  0f a7 f0 16   ora $16f0a7
$15:d33d  71 8f         adc ($8f),y
$15:d33f  64 3a         stz $3a
$15:d341  dd 07 ee      cmp $ee07,x
$15:d344  5f af 17 88   eor $8817af,x
$15:d348  01 68         ora ($68,x)
$15:d34a  c6 b0         dec $b0
$15:d34c  d2 42         cmp ($42)
$15:d34e  2c 34 92      bit $9234
$15:d351  45 3a         eor $3a
$15:d353  e8            inx
$15:d354  7c 22 9c      jmp ($9c22,x)
$15:d357  4d c5 23      eor $23c5
$15:d35a  d1 08         cmp ($08),y
$15:d35c  e8            inx
$15:d35d  54 1a 45      mvn $45,$1a
$15:d360  cc 87 42      cpy $4287
$15:d363  23 13         and $13,s
$15:d365  89 e7 c2      bit #$c2e7
$15:d368  f1 f0         sbc ($f0),y
$15:d36a  fc 68 3e      jsr ($3e68,x)
$15:d36d  0d 22 1c      ora $1c22
$15:d370  94 0e         sty $0e,x
$15:d372  04 04         tsb $04
$15:d374  18            clc
$15:d375  14 0d         trb $0d
$15:d377  5c 00 41 00   jml $004100
$15:d37b  9a            txs
$15:d37c  e0 20         cpx #$20
$15:d37e  30 36         bmi $d3b6
$15:d380  39 ae 02      and $02ae,y
$15:d383  41 f0         eor ($f0,x)
$15:d385  a8            tay
$15:d386  64 12         stz $12
$15:d388  e3 10         sbc $10,s
$15:d38a  6a            ror a
$15:d38b  80 68         bra $d3f5
$15:d38d  13 27         ora ($27,s),y
$15:d38f  30 13         bmi $d3a4
$15:d391  82 9c 04      brl $d830
$15:d394  e0 e5         cpx #$e5
$15:d396  1f 02 a4 30   ora $30a402,x
$15:d39a  18            clc
$15:d39b  0c 7c 82      tsb $827c
$15:d39e  bb            tyx
$15:d39f  64 c3         stz $c3
$15:d3a1  fa            plx
$15:d3a2  e3 10         sbc $10,s
$15:d3a4  78            sei
$15:d3a5  bc 22 29      ldy $2922,x
$15:d3a8  0f 85 c7 e3   ora $e3c785
$15:d3ac  73 c9         adc ($c9,s),y
$15:d3ae  07 42         ora [$42]
$15:d3b0  c9 93 f1      cmp #$f193
$15:d3b3  c4 18         cpy $18
$15:d3b5  20 1c 49      jsr $491c
$15:d3b8  e4 03         cpx $03
$15:d3ba  ad 30 b2      lda $b230
$15:d3bd  54 3b 5a      mvn $5a,$3b
$15:d3c0  09 07 73      ora #$7307
$15:d3c3  a9 22 ab      lda #$ab22
$15:d3c6  79 32 4e      adc $4e32,y
$15:d3c9  a0 b8         ldy #$b8
$15:d3cb  4c 23 d5      jmp $d523
$15:d3ce  0c f6 02      tsb $02f6
$15:d3d1  39 1c 81      and $811c,y
$15:d3d4  2d 02 09      and $0902
$15:d3d7  02 90         cop #$90
$15:d3d9  41 ae         eor ($ae,x)
$15:d3db  10 69         bpl $d446
$15:d3dd  e5 12         sbc $12
$15:d3df  7d 41 d7      adc $d741,x
$15:d3e2  c4 2c         cpy $2c
$15:d3e4  f1 89         sbc ($89),y
$15:d3e6  24 7e         bit $7e
$15:d3e8  25 0b         and $0b
$15:d3ea  83 43         sta $43,s
$15:d3ec  a7 30         lda [$30]
$15:d3ee  ea            nop
$15:d3ef  27 2e         and [$2e]
$15:d3f1  83 cf         sta $cf,s
$15:d3f3  88            dey
$15:d3f4  71 e2         adc ($e2),y
$15:d3f6  1c 88 85      trb $8588
$15:d3f9  3a            dec a
$15:d3fa  09 0b 84      ora #$840b
$15:d3fd  c0 a0         cpy #$a0
$15:d3ff  d0 08         bne $d409
$15:d401  75 ab         adc $ab,x
$15:d403  59 82 a4      eor $a482,y
$15:d406  60            rts
$15:d407  3b            tsc
$15:d408  10 0a         bpl $d414
$15:d40a  a6 12         ldx $12
$15:d40c  f1 98         sbc ($98),y
$15:d40e  a8            tay
$15:d40f  68            pla
$15:d410  32 16         and ($16)
$15:d412  0b            phd
$15:d413  56 d3         lsr $d3,x
$15:d415  05 7c         ora $7c
$15:d417  c0 5f         cpy #$5f
$15:d419  20 17 c2      jsr $c217
$15:d41c  c0 46         cpy #$46
$15:d41e  2c 12 04      bit $0412
$15:d421  d8            cld
$15:d422  c3 98         cmp $98,s
$15:d424  01 09         ora ($09,x)
$15:d426  81 c2         sta ($c2,x)
$15:d428  97 21         sta [$21],y
$15:d42a  05 59         ora $59
$15:d42c  03 00         ora $00,s
$15:d42e  63 f0         adc $f0,s
$15:d430  45 90         eor $90
$15:d432  42 60         wdm #$60
$15:d434  d0 a3         bne $d3d9
$15:d436  b8            clv
$15:d437  41 cf         eor ($cf,x)
$15:d439  02 9b         cop #$9b
$15:d43b  18            clc
$15:d43c  24 ee         bit $ee
$15:d43e  39 00 f2      and $f200,y
$15:d441  78            sei
$15:d442  36 95         rol $95,x
$15:d444  0a            asl a
$15:d445  a7 83         lda [$83]
$15:d447  51 44         eor ($44),y
$15:d449  de 51 3e      dec $3e51,x
$15:d44c  1c 8d 85      trb $858d
$15:d44f  42 01         wdm #$01
$15:d451  f3 f0         sbc ($f0,s),y
$15:d453  46 aa         lsr $aa
$15:d455  1e 8f 07      asl $078f,x
$15:d458  e2 81         sep #$81
$15:d45a  f0 a0         beq $d3fc
$15:d45c  40            rti
$15:d45d  38            sec
$15:d45e  90 0a         bcc $d46a
$15:d460  66 01         ror $01
$15:d462  86 10         stx $10
$15:d464  18            clc
$15:d465  54 26 25      mvn $25,$26
$15:d468  19 91 4c      ora $4c91,y
$15:d46b  a8            tay
$15:d46c  12 5a         ora ($5a)
$15:d46e  14 06         trb $06
$15:d470  8d 09 a3      sta $a309
$15:d473  1c 00 0a      trb $0a00
$15:d476  10 18         bpl $d490
$15:d478  44 26 21      mvp $21,$26
$15:d47b  39 80 4e      and $4e80,y
$15:d47e  20 2c 90      jsr $902c
$15:d481  98            tya
$15:d482  01 43         ora ($43,x)
$15:d484  01 00         ora ($00,x)
$15:d486  0a            asl a
$15:d487  06 42         asl $42
$15:d489  61 88         adc ($88,x)
$15:d48b  cc 41 29      cpy $2941
$15:d48e  18            clc
$15:d48f  48            pha
$15:d490  47 12         eor [$12]
$15:d492  40            rti
$15:d493  ab            plb
$15:d494  00 31         brk #$31
$15:d496  48            pha
$15:d497  24 11         bit $11
$15:d499  09 c3 20      ora #$20c3
$15:d49c  1d 02 0b      ora $0b02,x
$15:d49f  08            php
$15:d4a0  04 32         tsb $32
$15:d4a2  19 12 8e      ora $8e12,y
$15:d4a5  47 9e         eor [$9e]
$15:d4a7  61 1a         adc ($1a,x)
$15:d4a9  9e 5f e2      stz $e25f,x
$15:d4ac  17 7b         ora [$7b],y
$15:d4ae  45 9e         eor $9e
$15:d4b0  74 6d         stz $6d,x
$15:d4b2  08            php
$15:d4b3  41 f8         eor ($f8,x)
$15:d4b5  11 24         ora ($24),y
$15:d4b7  2a            rol a
$15:d4b8  0a            asl a
$15:d4b9  11 34         ora ($34),y
$15:d4bb  0f c1 80 71   ora $7180c1
$15:d4bf  0e 03 c1      asl $c103
$15:d4c2  40            rti
$15:d4c3  d0 58         bne $d51d
$15:d4c5  0b            phd
$15:d4c6  a1 c0         lda ($c0,x)
$15:d4c8  f8            sed
$15:d4c9  58            cli
$15:d4ca  3c 16 0a      bit $0a16,x
$15:d4cd  06 03         asl $03
$15:d4cf  80 89         bra $d45a
$15:d4d1  2a            rol a
$15:d4d2  05 02         ora $02
$15:d4d4  41 30         eor ($30,x)
$15:d4d6  80 44         bra $d51c
$15:d4d8  05 43         ora $43
$15:d4da  02 7f         cop #$7f
$15:d4dc  8c 0a 1d      sty $1d0a
$15:d4df  04 85         tsb $85
$15:d4e1  3c 40 96      bit $9640,x
$15:d4e4  11 33         ora ($33),y
$15:d4e6  c0 44         cpy #$44
$15:d4e8  20 90 20      jsr $2090
$15:d4eb  58            cli
$15:d4ec  22 8a 09 08   jsl $08098a
$15:d4f0  47 82         eor [$82]
$15:d4f2  3c 21 86      bit $8621,x
$15:d4f5  d0 b0         bne $d4a7
$15:d4f7  05 c1         ora $c1
$15:d4f9  9e 38 0c      stz $0c38,x
$15:d4fc  05 23         ora $23
$15:d4fe  d9 00 ea      cmp $ea00,y
$15:d501  49 39 9b      eor #$9b39
$15:d504  87 10         sta [$10]
$15:d506  d0 2e         bne $d536
$15:d508  10 03         bpl $d50d
$15:d50a  18            clc
$15:d50b  4c 30 11      jmp $1130
$15:d50e  8c 27 20      sty $2027
$15:d511  4a            lsr a
$15:d512  0d f3 85      ora $85f3
$15:d515  c6 25         dec $25
$15:d517  96 7e         stx $7e,y
$15:d519  bd 63 5f      lda $5f63,x
$15:d51c  d0 97         bne $d4b5
$15:d51e  f4 33 f5      pea $f533
$15:d521  02 11         cop #$11
$15:d523  41 dd         eor ($dd,x)
$15:d525  83 a0         sta $a0,s
$15:d527  71 82         adc ($82),y
$15:d529  20 c8 45      jsr $45c8
$15:d52c  d8            cld
$15:d52d  8c 4d 3c      sty $3c4d
$15:d530  9e b8 d7      stz $d7b8,x
$15:d533  d6 17         dec $17,x
$15:d535  f4 85 fe      pea $fe85
$15:d538  61 44         adc ($44,x)
$15:d53a  22 f0 40 23   jsl $2340f0
$15:d53e  50 08         bvc $d548
$15:d540  28            plp
$15:d541  30 55         bmi $d598
$15:d543  24 6f         bit $6f
$15:d545  f4 07 a4      pea $a407
$15:d548  7d 45 77      adc $7745,x
$15:d54b  48            pha
$15:d54c  c5 ce         cmp $ce
$15:d54e  19 4f 9c      ora $9c4f,y
$15:d551  57 e6         eor [$e6],y
$15:d553  17 f8         ora [$f8],y
$15:d555  04 fd         tsb $fd
$15:d557  84 2b         sty $2b
$15:d559  10 62         bpl $d5bd
$15:d55b  81 34         sta ($34,x)
$15:d55d  27 06         and [$06]
$15:d55f  60            rts
$15:d560  57 19         eor [$19],y
$15:d562  08            php
$15:d563  a0 d5         ldy #$d5
$15:d565  28            plp
$15:d566  d5 83         cmp $83,x
$15:d568  d9 10 fc      cmp $fc10,y
$15:d56b  50 32         bvc $d59f
$15:d56d  16 4f         asl $4f,x
$15:d56f  24 e3         bit $e3
$15:d571  e9 10 f8      sbc #$f810
$15:d574  40            rti
$15:d575  2a            rol a
$15:d576  52 0b         eor ($0b)
$15:d578  04 72         tsb $72
$15:d57a  21 2c         and ($2c,x)
$15:d57c  a0 43         ldy #$43
$15:d57e  2c 91 80      bit $8091
$15:d581  18            clc
$15:d582  44 21 04      mvp $04,$21
$15:d585  e0 be         cpx #$be
$15:d587  41 2f         eor ($2f,x)
$15:d589  f1 07         sbc ($07),y
$15:d58b  b9 47 df      lda $df47,y
$15:d58e  46 4e         lsr $4e
$15:d590  08            php
$15:d591  18            clc
$15:d592  a8            tay
$15:d593  00 ce         brk #$ce
$15:d595  ae 2b 85      ldx $852b
$15:d598  43 f1         eor $f1,s
$15:d59a  38            sec
$15:d59b  09 87 b2      ora #$b287
$15:d59e  31 e4         and ($e4),y
$15:d5a0  90 76         bcc $d618
$15:d5a2  20 01 d0      jsr $d001
$15:d5a5  7e 86 42      ror $4286,x
$15:d5a8  10 29         bpl $d5d3
$15:d5aa  16 20         asl $20,x
$15:d5ac  c8            iny
$15:d5ad  18            clc
$15:d5ae  a0 05         ldy #$05
$15:d5b0  39 84 12      and $1284,y
$15:d5b3  2f 10 8e c0   and $c08e10
$15:d5b7  67 d0         adc [$d0]
$15:d5b9  29 e1 d8      and #$d8e1
$15:d5bc  20 b1 65      jsr $65b1
$15:d5bf  70 c1         bvs $d582
$15:d5c1  27 71         and [$71]
$15:d5c3  09 04 06      ora #$0604
$15:d5c6  05 02         ora $02
$15:d5c8  41 84         eor ($84,x)
$15:d5ca  06 0b         asl $0b
$15:d5cc  02 80         cop #$80
$15:d5ce  43 df         eor $df,s
$15:d5d0  a1 54         lda ($54,x)
$15:d5d2  da            phx
$15:d5d3  57 3d         eor [$3d],y
$15:d5d5  17 cc         ora [$cc],y
$15:d5d7  07 52         ora [$52]
$15:d5d9  71 fc         adc ($fc),y
$15:d5db  80 5e         bra $d63b
$15:d5dd  38            sec
$15:d5de  1f 0c 03 f4   ora $f4030c,x
$15:d5e2  37 0e         and [$0e],y
$15:d5e4  21 4e         and ($4e,x)
$15:d5e6  00 0c         brk #$0c
$15:d5e8  1f a1 c0 51   ora $51c0a1,x
$15:d5ec  0b            phd
$15:d5ed  f4 2a b8      pea $b82a
$15:d5f0  ee e4 3b      inc $3be4
$15:d5f3  d9 1e 8a      cmp $8a1e,y
$15:d5f6  43 a1         eor $a1,s
$15:d5f8  30 67         bmi $d661
$15:d5fa  38            sec
$15:d5fb  20 c0 7e      jsr $7ec0
$15:d5fe  12 1a         ora ($1a)
$15:d600  05 87         ora $87
$15:d602  01 01         ora ($01,x)
$15:d604  5d 03 f4      eor $f403,x
$15:d607  10 c2         bpl $d5cb
$15:d609  ba            tsx
$15:d60a  06 18         asl $18
$15:d60c  45 34         eor $34
$15:d60e  55 6c         eor $6c,x
$15:d610  04 bb         tsb $bb
$15:d612  61 50         adc ($50,x)
$15:d614  f0 48         beq $d65e
$15:d616  38            sec
$15:d617  0a            asl a
$15:d618  90 51         bcc $d66b
$15:d61a  02 70         cop #$70
$15:d61c  29 10 4b      and #$4b10
$15:d61f  64 0a         stz $0a
$15:d621  80 0a         bra $d62d
$15:d623  35 59         and $59,x
$15:d625  03 42         ora $42,s
$15:d627  47 1a         eor [$1a]
$15:d629  77 84         adc [$84],y
$15:d62b  8a            txa
$15:d62c  37 12         and [$12],y
$15:d62e  85 c7         sta $c7
$15:d630  a0 71         ldy #$71
$15:d632  c8            iny
$15:d633  1c 6e 01      trb $016e
$15:d636  0c 3f 03      tsb $033f
$15:d639  f9 4f c0      sbc $c04f,y
$15:d63c  fd 11 60      sbc $6011,x
$15:d63f  f8            sed
$15:d640  35 12         and $12,x
$15:d642  0b            phd
$15:d643  46 63         lsr $63
$15:d645  69 78 ea      adc #$ea78
$15:d648  4f 39 1c c1   eor $c11c39
$15:d64c  d1 98         cmp ($98),y
$15:d64e  c3 20         cmp $20,s
$15:d650  de 03 e8      dec $e803,x
$15:d653  42 00         wdm #$00
$15:d655  a2 49         ldx #$49
$15:d657  38            sec
$15:d658  ac ca 23      ldy $23ca
$15:d65b  36 94         rol $94,x
$15:d65d  d1 86         cmp ($86),y
$15:d65f  61 5d         adc ($5d,x)
$15:d661  81 59         sta ($59,x)
$15:d663  99 82 24      sta $2482,y
$15:d666  11 f0         ora ($f0),y
$15:d668  9a            txs
$15:d669  81 02         sta ($02,x)
$15:d66b  16 01         asl $01,x
$15:d66d  42 e2         wdm #$e2
$15:d66f  36 04         rol $04,x
$15:d671  f2 c8         sbc ($c8)
$15:d673  68            pla
$15:d674  13 61         ora ($61,s),y
$15:d676  70 c0         bvs $d638
$15:d678  6c 20 04      jmp ($0420)
$15:d67b  70 71         bvs $d6ee
$15:d67d  81 7d         sta ($7d,x)
$15:d67f  0b            phd
$15:d680  c0 5d         cpy #$5d
$15:d682  19 00 18      ora $1800,y
$15:d685  37 97         and [$97],y
$15:d687  1e 5c a3      asl $a35c,x
$15:d68a  55 50         eor $50,x
$15:d68c  82 fa e8      brl $bf89
$15:d68f  5e 2c 8e      lsr $8e2c,x
$15:d692  c3 97         cmp $97,s
$15:d694  7c 97 d4      jmp ($d497,x)
$15:d697  21 d0         and ($d0,x)
$15:d699  08            php
$15:d69a  bc 02 0b      ldy $0b02,x
$15:d69d  04 0f         tsb $0f
$15:d69f  84 76         sty $76
$15:d6a1  01 4f         ora ($4f,x)
$15:d6a3  51 0e         eor ($0e),y
$15:d6a5  82 01 3d      brl $13a9
$15:d6a8  c7 74         cmp [$74]
$15:d6aa  e2 95         sep #$95
$15:d6ac  58            cli
$15:d6ad  56 8b         lsr $8b,x
$15:d6af  af dd a2 fc   lda $fca2dd
$15:d6b3  a0 9d         ldy #$9d
$15:d6b5  19 e7 c6      ora $c6e7,y
$15:d6b8  15 70         ora $70,x
$15:d6ba  80 7a         bra $d736
$15:d6bc  11 81         ora ($81),y
$15:d6be  20 06 06      jsr $0606
$15:d6c1  ea            nop
$15:d6c2  01 fb         ora ($fb,x)
$15:d6c4  80 2f         bra $d6f5
$15:d6c6  42 0b         wdm #$0b
$15:d6c8  00 df         brk #$df
$15:d6ca  da            phx
$15:d6cb  3a            dec a
$15:d6cc  73 3d         adc ($3d,s),y
$15:d6ce  3d 46 21      and $2146,x
$15:d6d1  e9 a7 78      sbc #$78a7
$15:d6d4  73 3b         adc ($3b,s),y
$15:d6d6  3e 25 f2      rol $f225,x
$15:d6d9  55 56         eor $56,x
$15:d6db  0f 80 24 0f   ora $0f2480
$15:d6df  e1 06         sbc ($06,x)
$15:d6e1  0f 0d 32 01   ora $01320d
$15:d6e5  83 80         sta $80,s
$15:d6e7  68            pla
$15:d6e8  60            rts
$15:d6e9  1f d8 b7 2f   ora $2fb7d8,x
$15:d6ed  99 65 c5      sta $c565,y
$15:d6f0  42 b2         wdm #$b2
$15:d6f2  ff 5c 2e 4a   sbc $4a2e5c,x
$15:d6f6  89 e1 9e      bit #$9ee1
$15:d6f9  6c 65 44      jmp ($4465)
$15:d6fc  12 4f         ora ($4f)
$15:d6fe  81 a4         sta ($a4,x)
$15:d700  21 50         and ($50,x)
$15:d702  0d dc 03      ora $03dc
$15:d705  87 00         sta [$00]
$15:d707  e2 c0         sep #$c0
$15:d709  00 00         brk #$00
$15:d70b  20 80 3b      jsr $3b80
$15:d70e  fd fd 9f      sbc $9ffd,x
$15:d711  df ff ff fb   cmp $fbffff,x
$15:d715  fa            plx
$15:d716  fe ff 7f      inc $7fff,x
$15:d719  01 50         ora ($50,x)
$15:d71b  f8            sed
$15:d71c  fe 3e 1f      inc $1f3e,x
$15:d71f  8f 47 c0 22   sta $22c047
$15:d723  01 f1         ora ($f1,x)
$15:d725  fc 08 cc      jsr ($cc08,x)
$15:d728  3c 01 e0      bit $e001,x
$15:d72b  f0 04         beq $d731
$15:d72d  00 5e         brk #$5e
$15:d72f  5f b1 98 fd   eor $fd98b1,x
$15:d733  ff 7f bf 9f   sbc $9fbf7f,x
$15:d737  e7 e6         sbc [$e6]
$15:d739  2f 41 a0 8d   and $8da041
$15:d73d  40            rti
$15:d73e  7c 03 e0      jmp ($e003,x)
$15:d741  f8            sed
$15:d742  8b            phb
$15:d743  d3 fd         cmp ($fd,s),y
$15:d745  ff fe 15 84   sbc $8415fe,x
$15:d749  26 1f         rol $1f
$15:d74b  6f c8 fd 4a   adc $4afdc8
$15:d74f  a8            tay
$15:d750  28            plp
$15:d751  2f fe ff ff   and $fffffe
$15:d755  5f df eb e3   eor $e3ebdf,x
$15:d759  fb            xce
$15:d75a  f8            sed
$15:d75b  7e 5e 1f      ror $1f5e,x
$15:d75e  53 c3         eor ($c3,s),y
$15:d760  ed e0 62      sbc $62e0
$15:d763  f1 38         sbc ($38),y
$15:d765  84 7f         sty $7f
$15:d767  ff 0f 42 8c   sbc $8c420f,x
$15:d76b  1f fe 7e 08   ora $087efe,x
$15:d76f  1b            tcs
$15:d770  fb            xce
$15:d771  d3 db         cmp ($db,s),y
$15:d773  8d b9 57      sta $57b9
$15:d776  b7 bb         lda [$bb],y
$15:d778  cb            wai
$15:d779  3f de bd f1   and $f1bdde,x
$15:d77d  af 62 2f 7a   lda $7a2f62
$15:d781  0b            phd
$15:d782  7f 16 bd ff   adc $ffbd16,x
$15:d786  80 7f         bra $d807
$15:d788  e3 9e         sbc $9e,s
$15:d78a  79 27 0e      adc $0e27,y
$15:d78d  85 c3         sta $c3
$15:d78f  a0 71         ldy #$71
$15:d791  e0 1d         cpx #$1d
$15:d793  38            sec
$15:d794  07 8e         ora [$8e]
$15:d796  81 ef         sta ($ef,x)
$15:d798  a7 79         lda [$79]
$15:d79a  a8            tay
$15:d79b  ff ea 3f ca   sbc $ca3fea,x
$15:d79f  f7 71         sbc [$71],y
$15:d7a1  ef 62 6f 5a   sbc $5a6f62
$15:d7a5  1b            tcs
$15:d7a6  75 13         adc $13,x
$15:d7a8  bf d2 a1 76   lda $76a1d2,x
$15:d7ac  e8            inx
$15:d7ad  5d fa 37      eor $37fa,x
$15:d7b0  9e c4 c7      stz $c7c4,x
$15:d7b3  69 45 2a      adc #$2a45
$15:d7b6  85 a5         sta $a5
$15:d7b8  a9 e6 a9      lda #$a9e6
$15:d7bb  9f 39 15 f2   sta $f21539,x
$15:d7bf  29 28 4f      and #$4f28
$15:d7c2  0f ff af 00   ora $00afff
$15:d7c6  cc c0 34      cpy $34c0
$15:d7c9  b0 0d         bcs $d7d8
$15:d7cb  8c 03 86      sty $8603
$15:d7ce  c0 00         cpy #$00
$15:d7d0  41 f4         eor ($f4,x)
$15:d7d2  6f fc 09 fc   adc $fc09fc
$15:d7d6  0b            phd
$15:d7d7  ff b0 b4 70   sbc $70b4b0,x
$15:d7db  67 1d         adc [$1d]
$15:d7dd  99 46 d6      sta $d646,y
$15:d7e0  d1 f3         cmp ($f3),y
$15:d7e2  94 70         sty $70,x
$15:d7e4  28            plp
$15:d7e5  1d e8 07      ora $07e8,x
$15:d7e8  42 00         wdm #$00
$15:d7ea  ff 0e b0 90   sbc $90b00e,x
$15:d7ee  59 61 d5      eor $d561,y
$15:d7f1  80 74         bra $d867
$15:d7f3  ad fb 0b      lda $0bfb
$15:d7f6  7c 2b ff      jmp ($ff2b,x)
$15:d7f9  80 a0         bra $d79b
$15:d7fb  40            rti
$15:d7fc  38            sec
$15:d7fd  18            clc
$15:d7fe  1a            inc a
$15:d7ff  06 aa         asl $aa
$15:d801  80 2d         bra $d830
$15:d803  0e 85 03      asl $0385
$15:d806  be 37 00      ldx $0037,y
$15:d809  41 ff         eor ($ff,x)
$15:d80b  85 83         sta $83
$15:d80d  ea            nop
$15:d80e  80 52         bra $d862
$15:d810  7f df 39 e7   adc $e739df,x
$15:d814  cf 7b e0 91   cmp $91e07b
$15:d818  c8            iny
$15:d819  7c 78 4f      jmp ($4f78,x)
$15:d81c  1e 26 c7      asl $c726,x
$15:d81f  f7 76         sbc [$76],y
$15:d821  0f ae 41 e3   ora $e341ae
$15:d825  d0 ff         bne $d826
$15:d827  e4 1d         cpx $1d
$15:d829  c8            iny
$15:d82a  07 63         ora [$63]
$15:d82c  01 d4         ora ($d4,x)
$15:d82e  80 72         bra $d8a2
$15:d830  20 14 3f      jsr $3f14
$15:d833  e5 f7         sbc $f7
$15:d835  7d 73 de      adc $de73,x
$15:d838  fc 27 fa      jsr ($fa27,x)
$15:d83b  cc 1d b3      cpy $b31d
$15:d83e  87 08         sta [$08]
$15:d840  e1 c9         sbc ($c9,x)
$15:d842  20 3f fa      jsr $fa3f
$15:d845  07 8e         ora [$8e]
$15:d847  41 eb         eor ($eb,x)
$15:d849  2b            pld
$15:d84a  84 82         sty $82
$15:d84c  e3 00         sbc $00,s
$15:d84e  98            tya
$15:d84f  c0 26         cpy #$26
$15:d851  b0 0e         bcs $d861
$15:d853  dc 03 fb      jml [$fb03]
$15:d856  5e e9 e0      lsr $e0e9,x
$15:d859  b5 3b         lda $3b,x
$15:d85b  ce 1c ff      dec $ff1c
$15:d85e  4b            phk
$15:d85f  bc c8 a5      ldy $a5c8,x
$15:d862  02 85         cop #$85
$15:d864  7e 90 7f      ror $7f90,x
$15:d867  eb            xba
$15:d868  9f dc 07 0f   sta $0f07dc,x
$15:d86c  01 c1         ora ($c1,x)
$15:d86e  80 a8         bra $d818
$15:d870  c1 46         cmp ($46,x)
$15:d872  1b            tcs
$15:d873  d6 00         dec $00,x
$15:d875  48            pha
$15:d876  20 7f cc      jsr $cc7f
$15:d879  2f eb 27 ec   and $ec27eb
$15:d87d  d3 fe         cmp ($fe,s),y
$15:d87f  3a            dec a
$15:d880  de 9c cf      dec $cf9c,x
$15:d883  bb            tyx
$15:d884  8d ff ca      sta $caff
$15:d887  7e c1 23      ror $23c1,x
$15:d88a  80 60         bra $d8ec
$15:d88c  8e 83 ff      stx $ff83
$15:d88f  c0 ff         cpy #$ff
$15:d891  e2 3f         sep #$3f
$15:d893  eb            xba
$15:d894  b0 c8         bcs $d85e
$15:d896  7a            ply
$15:d897  22 ff 48 5f   jsl $5f48ff
$15:d89b  fa            plx
$15:d89c  02 d3         cop #$d3
$15:d89e  00 48         brk #$48
$15:d8a0  5a            phy
$15:d8a1  f2 90         sbc ($90)
$15:d8a3  6f cc 3b e2   adc $e23bcc
$15:d8a7  09 47         ora #$47
$15:d8a9  0d cf 39      ora $39cf
$15:d8ac  b7 2d         lda [$2d],y
$15:d8ae  97 87         sta [$87],y
$15:d8b0  21 e1         and ($e1,x)
$15:d8b2  bd 70 62      lda $6270,x
$15:d8b5  fe 0e 54      inc $540e,x
$15:d8b8  d5 de         cmp $de,x
$15:d8ba  47 f0         eor [$f0]
$15:d8bc  62 87 bf      per $9846
$15:d8bf  01 e5         ora ($e5,x)
$15:d8c1  a0 7f         ldy #$7f
$15:d8c3  5d 83 e4      eor $e483,x
$15:d8c6  f8            sed
$15:d8c7  78            sei
$15:d8c8  be 1e 8f      ldx $8f1e,y
$15:d8cb  80 3c         bra $d909
$15:d8cd  3d 5f 0f      and $0f5f,x
$15:d8d0  07 e3         ora [$e3]
$15:d8d2  a9 e8         lda #$e8
$15:d8d4  ed 78 3f      sbc $3f78
$15:d8d7  e1 ea         sbc ($ea,x)
$15:d8d9  64 07         stz $07
$15:d8db  02 d7         cop #$d7
$15:d8dd  f1 f5         sbc ($f5),y
$15:d8df  dc 7b 36      jml [$367b]
$15:d8e2  1f 45 07 a9   ora $a90745,x
$15:d8e6  69 d6         adc #$d6
$15:d8e8  dc 36 17      jml [$1736]
$15:d8eb  4b            phk
$15:d8ec  54 d3 ff      mvn $ff,$d3
$15:d8ef  61 1f         adc ($1f,x)
$15:d8f1  8d 04 06      sta $0604
$15:d8f4  20 40 4f      jsr $4f40
$15:d8f7  04 c0         tsb $c0
$15:d8f9  ca            dex
$15:d8fa  1f 4f df f3   ora $f3df4f,x
$15:d8fe  e7 e5         sbc [$e5]
$15:d900  fd fa 3e      sbc $3efa,x
$15:d903  fe 6f df      inc $df6f,x
$15:d906  af fd ef fe   lda $feeffd
$15:d90a  7d 7f df      adc $df7f,x
$15:d90d  ff 81 7c 7c   sbc $7c7c81,x
$15:d911  21 f1         and ($f1,x)
$15:d913  f1 7f         sbc ($7f),y
$15:d915  fd 5f ff      sbc $ff5f,x
$15:d918  67 ff         adc [$ff]
$15:d91a  e9 65         sbc #$65
$15:d91c  c1 da         cmp ($da,x)
$15:d91e  f0 3b         beq $d95b
$15:d920  3a            dec a
$15:d921  0f 46 43 d4   ora $d44346
$15:d925  90 e6         bcc $d90d
$15:d927  6c 15 cd      jmp ($cd15)
$15:d92a  47 72         eor [$72]
$15:d92c  f9 ff 6b      sbc $6bff,y
$15:d92f  02 01         cop #$01
$15:d931  1d c5 08      ora $08c5,x
$15:d934  ff d7 20 08   sbc $0820d7,x
$15:d938  ff 4f 65 b7   sbc $b7654f,x
$15:d93c  9d e5 a3      sta $a3e5,x
$15:d93f  4b            phk
$15:d940  39 f6 4e      and $4ef6,y
$15:d943  3e b6 9c      rol $9cb6,x
$15:d946  b5 0d         lda $0d,x
$15:d948  45 2f         eor $2f
$15:d94a  49 47         eor #$47
$15:d94c  e9 d0         sbc #$d0
$15:d94e  3b            tsc
$15:d94f  74 0e         stz $0e,x
$15:d951  9c 01 82      stz $8201
$15:d954  9d 76 20      sta $2076,x
$15:d957  2b            pld
$15:d958  87 c9         sta [$c9]
$15:d95a  47 d6         eor [$d6]
$15:d95c  53 d6         eor ($d6,s),y
$15:d95e  a0 af         ldy #$af
$15:d960  05 e8         ora $e8
$15:d962  7a            ply
$15:d963  69 4b         adc #$4b
$15:d965  d9 60 04      cmp $0460,y
$15:d968  03 ae         ora $ae,s
$15:d96a  e8            inx
$15:d96b  1f fb bf df   ora $dfbffb,x
$15:d96f  d9 48 ff      cmp $ff48,y
$15:d972  f1 27         sbc ($27),y
$15:d974  f1 3f         sbc ($3f),y
$15:d976  6e 8e f9      ror $f98e
$15:d979  4f dc 74 f5   eor $f574dc
$15:d97d  9d 39 77      sta $7739,x
$15:d980  8e 78 eb      stx $eb78
$15:d983  0e bc 13      asl $13bc
$15:d986  af 01 65 80   lda $806501
$15:d98a  94 70         sty $70,x
$15:d98c  1d 78 13      ora $1378,x
$15:d98f  2c 25 ff      bit $ff25
$15:d992  89 7f         bit #$7f
$15:d994  62 8f fd      per $d726
$15:d997  83 c3         sta $c3,s
$15:d999  2a            rol a
$15:d99a  b0 f9         bcs $d995
$15:d99c  6c 1f 43      jmp ($431f)
$15:d99f  07 ab         ora [$ab]
$15:d9a1  c0 61         cpy #$61
$15:d9a3  f0 8f         beq $d934
$15:d9a5  7c 22 0f      jmp ($0f22,x)
$15:d9a8  05 fb         ora $fb
$15:d9aa  c1 34         cmp ($34,x)
$15:d9ac  30 1e         bmi $d9cc
$15:d9ae  8c 06 b3      sty $b306
$15:d9b1  01 d4         ora ($d4,x)
$15:d9b3  c0 7f         cpy #$7f
$15:d9b5  75 ef         adc $ef,x
$15:d9b7  3c fa 27      bit $27fa,x
$15:d9ba  fe 81 95      inc $9581,x
$15:d9bd  03 c5         ora $c5,s
$15:d9bf  03 81         ora $81,s
$15:d9c1  54 e0 5b      mvn $5b,$e0
$15:d9c4  78            sei
$15:d9c5  17 8e         ora [$8e],y
$15:d9c7  85 eb         sta $eb
$15:d9c9  91 42         sta ($42),y
$15:d9cb  e0 56         cpx #$56
$15:d9cd  38            sec
$15:d9ce  14 7e         trb $7e
$15:d9d0  05 ff         ora $ff
$15:d9d2  81 6b         sta ($6b,x)
$15:d9d4  e0 54         cpx #$54
$15:d9d6  b8            clv
$15:d9d7  15 3f         ora $3f,x
$15:d9d9  7f 33 e7 e7   adc $e7e733,x
$15:d9dd  7c 79 8f      jmp ($8f79,x)
$15:d9e0  3f c3 9f a3   and $a39fc3,x
$15:d9e4  ee 7f b6      inc $b67f
$15:d9e7  7e 47 f0      ror $f047,x
$15:d9ea  43 ff         eor $ff,s
$15:d9ec  f0 3f         beq $da2d
$15:d9ee  fe 07 ff      inc $ff07,x
$15:d9f1  80 ff         bra $d9f2
$15:d9f3  f0 10         beq $da05
$15:d9f5  a3 b2         lda $b2,s
$15:d9f7  ff 9f 43 ef   sbc $ef439f,x
$15:d9fb  f3 f3         sbc ($f3,s),y
$15:d9fd  fd 78 7f      sbc $7f78,x
$15:da00  ac 0f 42      ldy $420f
$15:da03  43 44         eor $44,s
$15:da05  d8            cld
$15:da06  f2 ae         sbc ($ae)
$15:da08  b9 3f ea      lda $ea3f,y
$15:da0b  3c 3f fe      bit $fe3f,x
$15:da0e  3f ff 05 0a   and $0a05ff,x
$15:da12  2e e0 77      rol $77e0
$15:da15  05 03         ora $03
$15:da17  ff 91 c5 ff   sbc $ffc591,x
$15:da1b  10 c1         bpl $d9de
$15:da1d  90 ff         bcc $da1e
$15:da1f  e1 bf         sbc ($bf,x)
$15:da21  f8            sed
$15:da22  df ff 0f ff   cmp $ff0fff,x
$15:da26  c6 ff         dec $ff
$15:da28  e8            inx
$15:da29  1f c1 88 42   ora $4288c1,x
$15:da2d  8a            txa
$15:da2e  ce 7f 90      dec $907f
$15:da31  3f 8c 3d 04   and $043d8c,x
$15:da35  1a            inc a
$15:da36  9f fd 5d fc   sta $fc5dfd,x
$15:da3a  3b            tsc
$15:da3b  ff fd fd fc   sbc $fcfdfd,x
$15:da3f  0a            asl a
$15:da40  80 80         bra $d9c2
$15:da42  a0 45         ldy #$45
$15:da44  aa            tax
$15:da45  f0 07         beq $da4e
$15:da47  7f bf b3 95   adc $95b3bf,x
$15:da4b  f4 e9 f9      pea $f9e9
$15:da4e  3a            dec a
$15:da4f  be 2e 8f      ldx $8f2e,y
$15:da52  8b            phb
$15:da53  93 f2         sta ($f2,s),y
$15:da55  ed f8 3a      sbc $3af8
$15:da58  de 9e 5f      dec $5f9e,x
$15:da5b  d5 0e         cmp $0e,x
$15:da5d  22 0a e0 dd   jsl $dde00a
$15:da61  a7 16         lda [$16]
$15:da63  b9 e7 56      lda $56e7,y
$15:da66  7d 4f 9f      adc $9f4f,x
$15:da69  75 27         adc $27,x
$15:da6b  fd d9 fe      sbc $fed9,x
$15:da6e  1a            inc a
$15:da6f  ff 49 db ff   sbc $ffdb49,x
$15:da73  e6 1f         inc $1f
$15:da75  f9 47 fe      sbc $fe47,y
$15:da78  29 ff         and #$ff
$15:da7a  87 10         sta [$10]
$15:da7c  c6 3b         dec $3b
$15:da7e  ff 83 38 43   sbc $433883,x
$15:da82  9f f8 c1 ff   sta $ffc1f8,x
$15:da86  35 bf         and $bf,x
$15:da88  2e 7f c3      rol $c37f
$15:da8b  2d e9 d6      and $d6e9
$15:da8e  f4 bb 9e      pea $9ebb
$15:da91  3d f2 e4      and $e4f2,x
$15:da94  39 08 51      and $5108,y
$15:da97  5e 82 20      lsr $2082,x
$15:da9a  90 c5         bcc $da61
$15:da9c  82 ce 7f      brl $5a6d
$15:da9f  e1 0a         sbc ($0a,x)
$15:daa1  71 e4         adc ($e4),y
$15:daa3  cd b2 f6      cmp $f6b2
$15:daa6  8b            phb
$15:daa7  66 4f         ror $4f
$15:daa9  f1 07         sbc ($07),y
$15:daab  fe c0 bf      inc $bfc0,x
$15:daae  e6 f4         inc $f4
$15:dab0  42 3d         wdm #$3d
$15:dab2  25 64         and $64
$15:dab4  34 cf         bit $cf,x
$15:dab6  9f 06 7d 07   sta $077d06,x
$15:daba  fc 66 ec      jsr ($ec66,x)
$15:dabd  96 fc         stx $fc,y
$15:dabf  86 ce         stx $ce
$15:dac1  99 ff 47      sta $47ff,y
$15:dac4  95 01         sta $01,x
$15:dac6  07 3f         ora [$3f]
$15:dac8  f8            sed
$15:dac9  7f fe e7 8f   adc $8fe7fe,x
$15:dacd  8e f8 f5      stx $f5f8
$15:dad0  d5 1f         cmp $1f,x
$15:dad2  f4 07 d3      pea $d307
$15:dad5  37 fa         and [$fa],y
$15:dad7  ac 41 5e      ldy $5e41
$15:dada  4e 40 71      lsr $7140
$15:dadd  02 28         cop #$28
$15:dadf  a4 3f         ldy $3f
$15:dae1  f8            sed
$15:dae2  2f dc e2 39   and $39e2dc
$15:dae6  ab            plb
$15:dae7  2d 3b 63      and $633b
$15:daea  74 c5         stz $c5,x
$15:daec  ec 69 f6      cpx $f669
$15:daef  5c fe 2e fe   jml $fe2efe
$15:daf3  83 96         sta $96,s
$15:daf5  30 41         bmi $db38
$15:daf7  7f f0 be 3c   adc $3cbef0,x
$15:dafb  e3 19         sbc $19,s
$15:dafd  73 b0         adc ($b0,s),y
$15:daff  67 ce         adc [$ce]
$15:db01  a1 96         lda ($96,x)
$15:db03  b4 cf         ldy $cf,x
$15:db05  f8            sed
$15:db06  1f a8 2f 96   ora $962fa8,x
$15:db0a  34 83         bit $83,x
$15:db0c  a4 4a         ldy $4a
$15:db0e  43 fe         eor $fe,s
$15:db10  1a            inc a
$15:db11  3a            dec a
$15:db12  e5 77         sbc $77
$15:db14  44 b9 03      mvp $03,$b9
$15:db17  d8            cld
$15:db18  4c b9 b4      jmp $b4b9
$15:db1b  dd 93 ff      cmp $ff93,x
$15:db1e  e0 15         cpx #$15
$15:db20  fd 06 de      sbc $de06,x
$15:db23  91 6e         sta ($6e),y
$15:db25  e8            inx
$15:db26  c2 be         rep #$be
$15:db28  ba            tsx
$15:db29  4f dd 43 ff   eor $ff43dd
$15:db2d  f1 5f         sbc ($5f),y
$15:db2f  82 11 14      brl $ef43
$15:db32  84 64         sty $64
$15:db34  01 d9         ora ($d9,x)
$15:db36  0b            phd
$15:db37  8e 4b da      stx $da4b
$15:db3a  85 fd         sta $fd
$15:db3c  3a            dec a
$15:db3d  1f ff 4f fe   ora $fe4fff,x
$15:db41  a4 3e         ldy $3e
$15:db43  64 51         stz $51
$15:db45  16 52         asl $52,x
$15:db47  01 ef         ora ($ef,x)
$15:db49  88            dey
$15:db4a  27 43         and [$43]
$15:db4c  8d 39 b8      sta $b839
$15:db4f  e7 e9         sbc [$e9]
$15:db51  9b            txy
$15:db52  f9 5f d3      sbc $d35f,y
$15:db55  ea            nop
$15:db56  5e 88 8f      lsr $8f88,x
$15:db59  fe 19 ff      inc $ff19,x
$15:db5c  90 7f         bcc $dbdd
$15:db5e  fe bf b8      inc $b8bf,x
$15:db61  3f f6 07 ed   and $ed07f6,x
$15:db65  89 e7 6c      bit #$6ce7
$15:db68  73 de         adc ($de,s),y
$15:db6a  1f e6 0f a3   ora $a30fe6,x
$15:db6e  bf f2 fe ec   lda $ecfef2,x
$15:db72  33 51         and ($51,s),y
$15:db74  34 8f         bit $8f,x
$15:db76  ff c3 cf ff   sbc $ffcfc3,x
$15:db7a  f1 5f         sbc ($5f),y
$15:db7c  fe 07 ff      inc $ff07,x
$15:db7f  c2 3e         rep #$3e
$15:db81  0f ff a3 ff   ora $ffa3ff
$15:db85  f2 ff         sbc ($ff)
$15:db87  ff 47 c0 af   sbc $afc047,x
$15:db8b  de df ff      dec $ffdf,x
$15:db8e  4f ff a5 ff   eor $ffa5ff
$15:db92  e6 3f         inc $3f
$15:db94  fe 0a 7c      inc $7c0a,x
$15:db97  62 ff fb      per $d799
$15:db9a  78            sei
$15:db9b  f8            sed
$15:db9c  19 fb 00      ora $00fb,y
$15:db9f  77 fb         adc [$fb],y
$15:dba1  fb            xce
$15:dba2  3a            dec a
$15:dba3  25 a1         and $a1
$15:dba5  ee ff ff      inc $ffff
$15:dba8  2d f1 5e      and $5ef1
$15:dbab  88            dey
$15:dbac  68            pla
$15:dbad  81 fb         sta ($fb,x)
$15:dbaf  3f f9 c6 be   and $bec6f9,x
$15:dbb3  79 7f cf      adc $cf7f,y
$15:dbb6  77 f3         adc [$f3],y
$15:dbb8  b1 fe         lda ($fe),y
$15:dbba  e5 ff         sbc $ff
$15:dbbc  bd 9f fe      lda $fe9f,x
$15:dbbf  ec fc 13      cpx $13fc
$15:dbc2  3f fc 4b ff   and $ff4bfc,x
$15:dbc6  91 ff         sta ($ff),y
$15:dbc8  8e c3 63      stx $63c3
$15:dbcb  ff ca 91 47   sbc $4791ca,x
$15:dbcf  77 d2         adc [$d2],y
$15:dbd1  f7 ed         sbc [$ed],y
$15:dbd3  fb            xce
$15:dbd4  1c ff 86      trb $86ff
$15:dbd7  b7 e5         lda [$e5],y
$15:dbd9  d2 f6         cmp ($f6)
$15:dbdb  e6 7c         inc $7c
$15:dbdd  dd 7f 47      cmp $477f,x
$15:dbe0  1f f1 ff e1   ora $e1fff1,x
$15:dbe4  7f f2 0b 21   adc $210bf2,x
$15:dbe8  d0 2c         bne $dc16
$15:dbea  87 00         sta [$00]
$15:dbec  b2 15         lda ($15)
$15:dbee  98            tya
$15:dbef  7f ff df ff   adc $ffdfff,x
$15:dbf3  87 ff         sta [$ff]
$15:dbf5  93 fe         sta ($fe,s),y
$15:dbf7  c9 12 43      cmp #$4312
$15:dbfa  f5 cb         sbc $cb,x
$15:dbfc  fa            plx
$15:dbfd  6a            ror a
$15:dbfe  fe 82 c1      inc $c182,x
$15:dc01  38            sec
$15:dc02  97 23         sta [$23],y
$15:dc04  fe 77 03      inc $0377,x
$15:dc07  11 df         ora ($df),y
$15:dc09  f0 1e         beq $dc29
$15:dc0b  f8            sed
$15:dc0c  87 7e         sta [$7e]
$15:dc0e  41 7e         eor ($7e,x)
$15:dc10  d0 ea         bne $dbfc
$15:dc12  ae b5 4d      ldx $4db5
$15:dc15  d9 88 17      cmp $1788,y
$15:dc18  21 ff         and ($ff,x)
$15:dc1a  80 27         bra $dc43
$15:dc1c  ce 40 a5      dec $a540
$15:dc1f  18            clc
$15:dc20  81 84         sta ($84,x)
$15:dc22  7d 1f 78      adc $781f,x
$15:dc25  7d 97 3f      adc $3f97,x
$15:dc28  e5 8f         sbc $8f
$15:dc2a  f7 67         sbc [$67],y
$15:dc2c  f5 3d         sbc $3d,x
$15:dc2e  fe 4e ff      inc $ff4e,x
$15:dc31  27 ff         and [$ff]
$15:dc33  fb            xce
$15:dc34  c5 a1         cmp $a1
$15:dc36  07 ff         ora [$ff]
$15:dc38  c1 58         cmp ($58,x)
$15:dc3a  23 1d         and $1d,s
$15:dc3c  ff c4 d8 e2   sbc $e2d8c4,x
$15:dc40  bb            tyx
$15:dc41  1f cc 1e 7b   ora $7b1ecc,x
$15:dc45  c3 8e         cmp $8e,s
$15:dc47  f8            sed
$15:dc48  f3 36         sbc ($36,s),y
$15:dc4a  7b            tdc
$15:dc4b  1e 7f e7      asl $e77f,x
$15:dc4e  0f ee c8 fd   ora $fdc8ee
$15:dc52  ac a0 80      ldy $80a0
$15:dc55  b7 d6         lda [$d6],y
$15:dc57  06 e7         asl $e7
$15:dc59  17 00         ora [$00],y
$15:dc5b  f0 e7         beq $dc44
$15:dc5d  9a            txs
$15:dc5e  fa            plx
$15:dc5f  87 e2         sta [$e2]
$15:dc61  0f c0 9f e4   ora $e49fc0
$15:dc65  ed 92 de      sbc $de92
$15:dc68  92 4c         sta ($4c)
$15:dc6a  11 e1         ora ($e1),y
$15:dc6c  ff 50 20 01   sbc $012050,x
$15:dc70  fe f0 87      inc $87f0,x
$15:dc73  f8            sed
$15:dc74  43 fe         eor $fe,s
$15:dc76  12 3e         ora ($3e)
$15:dc78  e5 77         sbc $77
$15:dc7a  44 0f 20      mvp $20,$0f
$15:dc7d  df c0 05 de   cmp $de05c0,x
$15:dc81  3f f2 87 97   and $9787f2,x
$15:dc85  ad 04 15      lda $1504
$15:dc88  5f f6 8f f9   eor $f98ff6,x
$15:dc8c  2f e8 55 fd   and $fd55e8
$15:dc90  08            php
$15:dc91  c0 5f 07      cpy #$075f
$15:dc94  73 c7         adc ($c7,s),y
$15:dc96  ff 37 85 53   sbc $538537,x
$15:dc9a  ff a0 51 8d   sbc $8d51a0,x
$15:dc9e  03 fe         ora $fe,s
$15:dca0  79 2e 04      adc $042e,y
$15:dca3  6f cf fb 83   adc $83fbcf
$15:dca7  ab            plb
$15:dca8  c3 4f         cmp $4f,s
$15:dcaa  5f a7 ef e7   eor $e7efa7,x
$15:dcae  ff ff 3f ff   sbc $ff3fff,x
$15:dcb2  ae bd 07      ldx $07bd
$15:dcb5  41 30         eor ($30,x)
$15:dcb7  01 80         ora ($80,x)
$15:dcb9  10 ff         bpl $dcba
$15:dcbb  fa            plx
$15:dcbc  64 b8         stz $b8
$15:dcbe  fc f4 d0      jsr ($d0f4,x)
$15:dcc1  f4 ff fe      pea $feff
$15:dcc4  2f ff a7 ff   and $ffa7ff
$15:dcc8  f8            sed
$15:dcc9  ff fd 3f ff   sbc $ff3ffd,x
$15:dccd  c3 d0         cmp $d0,s
$15:dccf  2b            pld
$15:dcd0  ff e3 ff f8   sbc $f8ffe3,x
$15:dcd4  2f 06 f1 ff   and $fff106
$15:dcd8  da            phx
$15:dcd9  ff e7 3f fc   sbc $fc3fe7,x
$15:dcdd  e9 e8 5a      sbc #$5ae8
$15:dce0  19 54 99      ora $9954,y
$15:dce3  e9 73 9c      sbc #$9c73
$15:dce6  ae 35 97      ldx $9735
$15:dce9  c7 32         cmp [$32]
$15:dceb  f8            sed
$15:dcec  e4 ee         cpx $ee
$15:dcee  1e 4f 1d      asl $1d4f,x
$15:dcf1  6a            ror a
$15:dcf2  8d 8d c1      sta $c18d
$15:dcf5  50 f8         bvc $dcef
$15:dcf7  13 1f         ora ($1f,s),y
$15:dcf9  84 63         sty $63
$15:dcfb  f1 0c         sbc ($0c),y
$15:dcfd  fe 01 c0      inc $c001,x
$15:dd00  0a            asl a
$15:dd01  1a            inc a
$15:dd02  1f 07 22 e5   ora $e52207,x
$15:dd06  33 e1         and ($e1,s),y
$15:dd08  f3 a1         sbc ($a1,s),y
$15:dd0a  f5 98         sbc $98,x
$15:dd0c  fe cf 7f      inc $7fcf,x
$15:dd0f  66 ff         ror $ff
$15:dd11  62 f2 f9      per $d706
$15:dd14  4f 9d f7 09   eor $09f79d
$15:dd18  fc 80 7c      jsr ($7c80,x)
$15:dd1b  20 1e 08      jsr $081e
$15:dd1e  05 02         ora $02
$15:dd20  01 01         ora ($01,x)
$15:dd22  80 58         bra $dd7c
$15:dd24  2c 10 8f      bit $8f10
$15:dd27  c7 ae         cmp [$ae]
$15:dd29  cf 95 c7 5a   cmp $5ac795
$15:dd2d  a3 96         lda $96,s
$15:dd2f  18            clc
$15:dd30  cf 6a 41 99   cmp $99416a
$15:dd34  8f 5b 6c ba   sta $ba6c5b
$15:dd38  6c f4 7e      jmp ($7ef4)
$15:dd3b  01 7e         ora ($7e,x)
$15:dd3d  80 a1         bra $dce0
$15:dd3f  43 fc         eor $fc,s
$15:dd41  86 08         stx $08
$15:dd43  07 9e         ora [$9e]
$15:dd45  01 9d         ora ($9d,x)
$15:dd47  81 10         sta ($10,x)
$15:dd49  42 af         wdm #$af
$15:dd4b  37 d4         and [$d4],y
$15:dd4d  e6 7a         inc $7a
$15:dd4f  d0 e9         bne $dd3a
$15:dd51  cd 1e 41      cmp $411e
$15:dd54  3f a3 61 e9   and $e961a3,x
$15:dd58  37 18         and [$18],y
$15:dd5a  97 72         sta [$72],y
$15:dd5c  11 ff         ora ($ff),y
$15:dd5e  c3 5f         cmp $5f,s
$15:dd60  c8            iny
$15:dd61  41 80         eor ($80,x)
$15:dd63  bf 9e 42 71   lda $71429e,x
$15:dd67  3f c3 41 fc   and $fc41c3,x
$15:dd6b  30 18         bmi $dd85
$15:dd6d  84 42         sty $42
$15:dd6f  40            rti
$15:dd70  71 18         adc ($18),y
$15:dd72  01 d0         ora ($d0,x)
$15:dd74  8f 21 02 3d   sta $3d0221
$15:dd78  84 40         sty $40
$15:dd7a  ea            nop
$15:dd7b  87 63         sta [$63]
$15:dd7d  3e 09 e4      rol $e409,x
$15:dd80  0f e0 90 54   ora $5490e0
$15:dd84  82 27 a1      brl $7eae
$15:dd87  32 a2         and ($a2)
$15:dd89  90 80         bcc $dd0b
$15:dd8b  8a            txa
$15:dd8c  41 16         eor ($16,x)
$15:dd8e  47 c0         eor [$c0]
$15:dd90  82 2e 85      brl $62c1
$15:dd93  5e 49 e9      lsr $e949,x
$15:dd96  66 fa         ror $fa
$15:dd98  7a            ply
$15:dd99  30 0e         bmi $dda9
$15:dd9b  91 a0         sta ($a0),y
$15:dd9d  09 c1 df      ora #$dfc1
$15:dda0  ef ec f6 ff   sbc $fff6ec
$15:dda4  fe 3f fe      inc $fe3f,x
$15:dda7  8f ff 97 ff   sta $ff97ff
$15:ddab  f1 ff         sbc ($ff),y
$15:ddad  f4 ff fe      pea $feff
$15:ddb0  18            clc
$15:ddb1  50 7f         bvc $de32
$15:ddb3  e0 fd 7f      cpx #$7ffd
$15:ddb6  78            sei
$15:ddb7  ff ca 1e 5e   sbc $5e1eca,x
$15:ddbb  bd 67 4f      lda $4f67,x
$15:ddbe  a1 ef         lda ($ef,x)
$15:ddc0  d1 06         cmp ($06),y
$15:ddc2  87 af         sta [$af]
$15:ddc4  ff f7 7f e1   sbc $e17ff7,x
$15:ddc8  9f f8 38 78   sta $7838f8,x
$15:ddcc  30 1f         bmi $dded
$15:ddce  fe 07 fc      inc $fc07,x
$15:ddd1  e7 3e         sbc [$3e]
$15:ddd3  78            sei
$15:ddd4  ff 3e 7f 17   sbc $177f3e,x
$15:ddd8  ff d7 ff fa   sbc $faffd7,x
$15:dddc  ff fd 3f ff   sbc $ff3ffd,x
$15:dde0  0f ff c7 c3   ora $c3c7ff
$15:dde4  c0 7d 04      cpy #$047d
$15:dde7  d8            cld
$15:dde8  24 e7         bit $e7
$15:ddea  f5 ff         sbc $ff,x
$15:ddec  fe 7f d5      inc $d57f,x
$15:ddef  e0 1e 0f      cpx #$0f1e
$15:ddf2  ea            nop
$15:ddf3  d0 57         bne $de4c
$15:ddf5  06 af         asl $af
$15:ddf7  d0 a8         bne $dda1
$15:ddf9  70 7f         bvs $de7a
$15:ddfb  fe 5f ff      inc $ff5f,x
$15:ddfe  af ff f7 5a   lda $5af7ff
$15:de02  0f bd 97 e1   ora $e197bd
$15:de06  e0 b3 7f      cpx #$7fb3
$15:de09  72 bf         adc ($bf)
$15:de0b  3b            tsc
$15:de0c  5f 93 39 81   eor $813993,x
$15:de10  a2 41 ec      ldx #$ec41
$15:de13  57 cc         eor [$cc],y
$15:de15  97 8e         sta [$8e],y
$15:de17  93 8d         sta ($8d,s),y
$15:de19  81 c0         sta ($c0,x)
$15:de1b  21 f0         and ($f0,x)
$15:de1d  08            php
$15:de1e  fc 02 fd      jsr ($fd02,x)
$15:de21  01 fc         ora ($fc,x)
$15:de23  40            rti
$15:de24  30 30         bmi $de56
$15:de26  18            clc
$15:de27  64 3e         stz $3e
$15:de29  63 3e         adc $3e,s
$15:de2b  db            stp
$15:de2c  e3 b9         sbc $b9,s
$15:de2e  3c 7d ac      bit $ac7d,x
$15:de31  ce 8d 81      dec $818d
$15:de34  cd f8 2a      cmp $2af8
$15:de37  7b            tdc
$15:de38  cd 64 7f      cmp $7f64
$15:de3b  ab            plb
$15:de3c  cd c0 5f      cmp $5fc0
$15:de3f  b8            clv
$15:de40  13 fd         ora ($fd,s),y
$15:de42  85 3e         sta $3e
$15:de44  01 ff         ora ($ff,x)
$15:de46  12 a7         ora ($a7)
$15:de48  0a            asl a
$15:de49  7f ad e4 56   adc $56e4ad,x
$15:de4d  ec 96 2b      cpx $2b96
$15:de50  ee 77 3f      inc $3f77
$15:de53  ca            dex
$15:de54  e5 59         sbc $59
$15:de56  7c 3d 6e      jmp ($6e3d,x)
$15:de59  7c b6 3d      jmp ($3db6,x)
$15:de5c  08            php
$15:de5d  fb            xce
$15:de5e  a0 01 00      ldy #$0001
$15:de61  16 0f         asl $0f,x
$15:de63  fc d7 ff      jsr ($ffd7,x)
$15:de66  1a            inc a
$15:de67  fd c8 3c      sbc $3cc8,x
$15:de6a  7c 0e 3d      jmp ($3d0e,x)
$15:de6d  66 75         ror $75
$15:de6f  a6 b0         ldx $b0
$15:de71  d4 f9         pei ($f9)
$15:de73  fa            plx
$15:de74  6c f5 32      jmp ($32f5)
$15:de77  79 ca 9d      adc $9dca,y
$15:de7a  49 e3 f2      eor #$f2e3
$15:de7d  bf 3c 13 e9   lda $e9133c,x
$15:de81  18            clc
$15:de82  fc 48 3c      jsr ($3c48,x)
$15:de85  14 1e         trb $1e
$15:de87  06 0f         asl $0f
$15:de89  01 05         ora ($05,x)
$15:de8b  80 70         bra $defd
$15:de8d  38            sec
$15:de8e  11 0f         ora ($0f),y
$15:de90  84 02         sty $02
$15:de92  08            php
$15:de93  6f 03 80 51   adc $518003
$15:de97  20 14 83      jsr $8314
$15:de9a  b0 c8         bcs $de64
$15:de9c  20 07 c0      jsr $c007
$15:de9f  38            sec
$15:dea0  09 f5 21      ora #$21f5
$15:dea3  08            php
$15:dea4  70 45         bvs $deeb
$15:dea6  04 a2         tsb $a2
$15:dea8  10 7b         bpl $df25
$15:deaa  03 d9         ora $d9,s
$15:deac  24 8a         bit $8a
$15:deae  40            rti
$15:deaf  99 14 b8      sta $b814,y
$15:deb2  9e 89 1e      stz $1e89,x
$15:deb5  4a            lsr a
$15:deb6  44 56 dc      mvp $dc,$56
$15:deb9  42 20         wdm #$20
$15:debb  99 04 31      sta $3104,y
$15:debe  a1 c6         lda ($c6,x)
$15:dec0  20 c6 33      jsr $33c6
$15:dec3  d9 50 1a      cmp $1a50,y
$15:dec6  22 99 34 79   jsl $793499
$15:deca  44 1a 20      mvp $20,$1a
$15:decd  ad 66 d1      lda $d166
$15:ded0  ab            plb
$15:ded1  71 f7         adc ($f7),y
$15:ded3  ef e0 d1 ff   sbc $ffd1e0
$15:ded7  f8            sed
$15:ded8  ff fd 3f ff   sbc $ff3ffd,x
$15:dedc  af ff e7 ff   lda $ffe7ff
$15:dee0  fd ff fe      sbc $feff,x
$15:dee3  ff fc 38 20   sbc $2038fc,x
$15:dee7  fd df ff      sbc $ffdf,x
$15:deea  f2 ff         sbc ($ff)
$15:deec  fe 2f ff      inc $ff2f,x
$15:deef  17 ff         ora [$ff],y
$15:def1  d0 85         bne $de78
$15:def3  87 ab         sta [$ab]
$15:def5  ff f1 8b 7f   sbc $7f8bf1,x
$15:def9  f5 ff         sbc $ff,x
$15:defb  fe 7f c9      inc $c97f,x
$15:defe  e0 1c 0f      cpx #$0f1c
$15:df01  e8            inx
$15:df02  70 83         bvs $de87
$15:df04  84 4f         sty $4f
$15:df06  d1 a8         cmp ($a8),y
$15:df08  75 86         adc $86,x
$15:df0a  43 eb         eor $eb,s
$15:df0c  ff f6 ff ff   sbc $fffff6,x
$15:df10  2f ff b0 d7   and $d7b0ff
$15:df14  e1 c0         sbc ($c0,x)
$15:df16  8d ff e8      sta $e8ff
$15:df19  e3 41         sbc $41,s
$15:df1b  93 ff         sta ($ff,s),y
$15:df1d  f3 ff         sbc ($ff,s),y
$15:df1f  fb            xce
$15:df20  f9 61 11      sbc $1161,y
$15:df23  fb            xce
$15:df24  fc af f5      jsr ($f5af,x)
$15:df27  f0 5b         beq $df84
$15:df29  cd 8f 1e      cmp $1e8f
$15:df2c  7b            tdc
$15:df2d  a5 de         lda $de
$15:df2f  64 77         stz $77
$15:df31  9c 3a 15      stz $153a
$15:df34  fa            plx
$15:df35  41 ff         eor ($ff,x)
$15:df37  ae 7f f0      ldx $f07f
$15:df3a  5c fc 07 0e   jml $0e07fc
$15:df3e  03 c3         ora $c3,s
$15:df40  62 06 03      per $e249
$15:df43  7b            tdc
$15:df44  00 ff         brk #$ff
$15:df46  c8            iny
$15:df47  3f b5 ee 5e   and $5eeeb5,x
$15:df4b  0b            phd
$15:df4c  1b            tcs
$15:df4d  b8            clv
$15:df4e  f5 ce         sbc $ce,x
$15:df50  fa            plx
$15:df51  3d 4c cc      and $cc4c,x
$15:df54  b3 97         lda ($97,s),y
$15:df56  c2 ff         rep #$ff
$15:df58  2f 87 fb 80   and $80fb87
$15:df5c  e3 e0         sbc $e0,s
$15:df5e  38            sec
$15:df5f  b0 1d         bcs $df7e
$15:df61  5e 03 a7      lsr $a703,x
$15:df64  00 de         brk #$de
$15:df66  e0 19 a1      cpx #$a119
$15:df69  eb            xba
$15:df6a  b9 e5 7c      lda $7ce5,y
$15:df6d  96 ac         stx $ac,y
$15:df6f  4d 87 0f      eor $0f87
$15:df72  da            phx
$15:df73  82 e6 6f      brl $4f5c
$15:df76  16 df         asl $df,x
$15:df78  be 9b 8f      ldx $8f9b,y
$15:df7b  03 be         ora $be,s
$15:df7d  41 7f         eor ($7f,x)
$15:df7f  50 8f         bvc $df10
$15:df81  bb            tyx
$15:df82  30 00         bmi $df84
$15:df84  a5 07         lda $07
$15:df86  fc 02 c2      jsr ($c202,x)
$15:df89  af 9f d4 f3   lda $f3d49f
$15:df8d  fa            plx
$15:df8e  d2 79         cmp ($79)
$15:df90  ce 06 41      dec $4106
$15:df93  e0 a3 4f      cpx #$4fa3
$15:df96  a9 3c 78      lda #$783c
$15:df99  94 c7         sty $c7,x
$15:df9b  c1 00         cmp ($00,x)
$15:df9d  f8            sed
$15:df9e  40            rti
$15:df9f  3f 10 0b f6   and $f60b10,x
$15:dfa3  02 3f         cop #$3f
$15:dfa5  00 c0         brk #$c0
$15:dfa7  e0 26 1f      cpx #$1f26
$15:dfaa  08            php
$15:dfab  67 f2         adc [$f2]
$15:dfad  a9 98 d2      lda #$d298
$15:dfb0  f1 b9         sbc ($b9),y
$15:dfb2  5f 3b 2d e6   eor $e62d3b,x
$15:dfb6  65 3c         adc $3c
$15:dfb8  c9 c7 3c      cmp #$3cc7
$15:dfbb  9f 8a d7 8e   sta $8ed78a,x
$15:dfbf  45 3d         eor $3d
$15:dfc1  8c 47 e0      sty $e047
$15:dfc4  90 7c         bcc $e042
$15:dfc6  14 0f         trb $0f
$15:dfc8  83 01         sta $01,s
$15:dfca  0f 84 0e 06   ora $060e84
$15:dfce  43 0e         eor $0e,s
$15:dfd0  45 16         eor $16
$15:dfd2  67 0f         adc [$0f]
$15:dfd4  e7 4f         sbc [$4f]
$15:dfd6  ab            plb
$15:dfd7  3b            tsc
$15:dfd8  9d 9f ce      sta $ce9f,x
$15:dfdb  cd 67 c5      cmp $c567
$15:dfde  f8            sed
$15:dfdf  f2 99         sbc ($99)
$15:dfe1  8e 14 ed      stx $ed14
$15:dfe4  98            tya
$15:dfe5  10 1f         bpl $e006
$15:dfe7  fc 1b ff      jsr ($ff1b,x)
$15:dfea  0c ff e6      tsb $e6ff
$15:dfed  3f f1 4c bd   and $bd4cf1,x
$15:dff1  8e 07 00      stx $0007
$15:dff4  37 ac         and [$ac],y
$15:dff6  82 41 28      brl $083a
$15:dff9  94 42         sty $42,x
$15:dffb  25 10         and $10
$15:dffd  49 24 c2      eor #$c224
$15:e000  21 10         and ($10,x)
$15:e002  80 20         bra $e024
$15:e004  4a            lsr a
$15:e005  10 86         bpl $df8d
$15:e007  19 44 02      ora $0244,y
$15:e00a  48            pha
$15:e00b  6f 18 22 40   adc $402218
$15:e00f  d2 d0         cmp ($d0)
$15:e011  91 54         sta ($54),y
$15:e013  8a            txa
$15:e014  40            rti
$15:e015  8e e0 77      stx $77e0
$15:e018  0a            asl a
$15:e019  02 cc         cop #$cc
$15:e01b  60            rts
$15:e01c  0b            phd
$15:e01d  60            rts
$15:e01e  48            pha
$15:e01f  1c 81 7c      trb $7c81
$15:e022  2b            pld
$15:e023  63 5c         adc $5c,s
$15:e025  09 bc d0      ora #$d0bc
$15:e028  06 87         asl $87
$15:e02a  26 52         rol $52
$15:e02c  b7 49         lda [$49],y
$15:e02e  0a            asl a
$15:e02f  6e 82 82      ror $8282
$15:e032  41 3f         eor ($3f,x)
$15:e034  ee f7 e7      inc $e7f7
$15:e037  ff f5 ff 3e   sbc $3efff5,x
$15:e03b  f7 85         sbc [$85],y
$15:e03d  df 0f 81 d1   cmp $d1810f,x
$15:e041  ff f8 0e f3   sbc $f30ef8,x
$15:e045  fb            xce
$15:e046  f9 fe fc      sbc $fcfe,y
$15:e049  7f 9e 0f e7   adc $e70f9e,x
$15:e04d  4b            phk
$15:e04e  f8            sed
$15:e04f  e9 7e 20      sbc #$207e
$15:e052  f4 ff f9      pea $f9ff
$15:e055  ff fc 3f fe   sbc $fe3ffc,x
$15:e059  0f ff 41 ff   ora $ff41ff
$15:e05d  e8            inx
$15:e05e  7f b5 ee 5e   adc $5eeeb5,x
$15:e062  0b            phd
$15:e063  23 a4         and $a4,s
$15:e065  e3 c3         sbc $c3,s
$15:e067  f4 7b cc      pea $cc7b
$15:e06a  8e f3 97      stx $97f3
$15:e06d  42 bf         wdm #$bf
$15:e06f  49 3f f5      eor #$f53f
$15:e072  cf ee 03 b7   cmp $b703ee
$15:e076  80 f8         bra $e070
$15:e078  c0 78 78      cpy #$7878
$15:e07b  02 38         cop #$38
$15:e07d  6f 4c 21 24   adc $24214c
$15:e081  17 87         ora [$87],y
$15:e083  4f 05 a9 de   eor $dea905
$15:e087  70 e7         bvs $e070
$15:e089  fa            plx
$15:e08a  5d 96 23      eor $2396,x
$15:e08d  4b            phk
$15:e08e  c1 aa         cmp ($aa,x)
$15:e090  59 a7 03      eor $03a7,y
$15:e093  f2 23         sbc ($23)
$15:e095  87 06         sta [$06]
$15:e097  03 cf         ora $cf,s
$15:e099  c0 77 f0      cpy #$f077
$15:e09c  1b            tcs
$15:e09d  b2 60         lda ($60)
$15:e09f  2f c0 df e8   and $e8dfc0
$15:e0a3  0f 48 fa 8b   ora $8bfa48
$15:e0a7  d6 7e         dec $7e,x
$15:e0a9  c4 f6         cpy $f6
$15:e0ab  af b7 9b 5b   lda $5b9bb7
$15:e0af  9a            txs
$15:e0b0  ad f0 2c      lda $2cf0
$15:e0b3  5e 0c ef      lsr $ef0c,x
$15:e0b6  f7 95         sbc [$95],y
$15:e0b8  ff b2 de fa   sbc $fadeb2,x
$15:e0bc  de 69 6f      dec $6f69,x
$15:e0bf  32 ff         and ($ff)
$15:e0c1  00 9f         brk #$9f
$15:e0c3  c0 23 f0      cpy #$f023
$15:e0c6  08            php
$15:e0c7  13 78         ora ($78,s),y
$15:e0c9  70 10         bvs $e0db
$15:e0cb  08            php
$15:e0cc  4c 32 27      jmp $2732
$15:e0cf  18            clc
$15:e0d0  ac e7 34      ldy $34e7
$15:e0d3  d3 8a         cmp ($8a,s),y
$15:e0d5  9d 8f 4d      sta $4d8f,x
$15:e0d8  c7 a6         cmp [$a6]
$15:e0da  63 f9         adc $f9,s
$15:e0dc  50 f9         bvc $e0d7
$15:e0de  3f 1e 57 33   and $33571e,x
$15:e0e2  f1 42         sbc ($42),y
$15:e0e4  8c a1 8c      sty $8ca1
$15:e0e7  87 c6         sta [$c6]
$15:e0e9  23 f3         and $f3,s
$15:e0eb  09 f8 9c      ora #$9cf8
$15:e0ee  04 a1         tsb $a1
$15:e0f0  c4 83         cpy $83
$15:e0f2  d9 ac 99      cmp $99ac,y
$15:e0f5  5c cd ae e1   jml $e1aecd
$15:e0f9  9c f1 51      stz $51f1
$15:e0fc  37 96         and [$96],y
$15:e0fe  2f 0e 4b 1d   and $1d4b0e
$15:e102  49 9d e6      eor #$e69d
$15:e105  3f f6 1f f6   and $f61ff6,x
$15:e109  03 ff         ora $ff,s
$15:e10b  01 ff         ora ($ff,x)
$15:e10d  40            rti
$15:e10e  ff f1 cf e5   sbc $e5cff1,x
$15:e112  87 c1         sta [$c1]
$15:e114  87 c0         sta [$c0]
$15:e116  6d f8 dc      adc $dcf8
$15:e119  9f 8e d6 f3   sta $f3d68e,x
$15:e11d  46 9c         lsr $9c
$15:e11f  66 f0         ror $f0
$15:e121  95 38         sta $38,x
$15:e123  86 b2         stx $b2
$15:e125  99 d5 f3      sta $f3d5,y
$15:e128  fe 20 1f      inc $1f20,x
$15:e12b  e8            inx
$15:e12c  05 f8         ora $f8
$15:e12e  86 10         stx $10
$15:e130  07 f8         ora [$f8]
$15:e132  7b            tdc
$15:e133  e0 1f 38      cpx #$381f
$15:e136  01 7c         ora ($7c,x)
$15:e138  20 94 43      jsr $4394
$15:e13b  78            sei
$15:e13c  50 a0         bvc $e0de
$15:e13e  54 00 28      mvn $28,$00
$15:e141  01 49         ora ($49,x)
$15:e143  bc 34 43      ldy $4334,x
$15:e146  f0 9d         beq $e0e5
$15:e148  02 01         cop #$01
$15:e14a  42 3b         wdm #$3b
$15:e14c  b3 78         lda ($78,s),y
$15:e14e  a0 49 33      ldy #$3349
$15:e151  02 08         cop #$08
$15:e153  14 93         trb $93
$15:e155  08            php
$15:e156  76 78         ror $78,x
$15:e158  24 02         bit $02
$15:e15a  10 de         bpl $e13a
$15:e15c  78            sei
$15:e15d  82 ec 5b      brl $3d4c
$15:e160  c4 b1         cpy $b1
$15:e162  06 19         asl $19
$15:e164  2f 81 92 50   and $509281
$15:e168  46 79         lsr $79
$15:e16a  a4 ca         ldy $ca
$15:e16c  10 d9         bpl $e147
$15:e16e  34 4c         bit $4c,x
$15:e170  30 93         bmi $e105
$15:e172  59 f3 ea      eor $eaf3,y
$15:e175  fa            plx
$15:e176  f9 7f 7d      sbc $7d7f,y
$15:e179  2f 7f 37 ff   and $ff377f
$15:e17d  9b            txy
$15:e17e  ff fb bf fb   sbc $fbbffb,x
$15:e182  bf ff ff a0   lda $a0ffff,x
$15:e186  ff f0 7f fc   sbc $fc7ff0,x
$15:e18a  3f fe 17 fe   and $fe17fe,x
$15:e18e  f7 5e         sbc [$5e],y
$15:e190  cf c7 db f0   cmp $f0dbc7
$15:e194  d5 fc         cmp $fc,x
$15:e196  3b            tsc
$15:e197  df 1e af ef   cmp $efaf1e,x
$15:e19b  65 ff         adc $ff
$15:e19d  eb            xba
$15:e19e  ff f7 6f e0   sbc $e06ff7,x
$15:e1a2  e8            inx
$15:e1a3  ff fc 0f f1   sbc $f10ffc,x
$15:e1a7  e8            inx
$15:e1a8  07 c4         ora [$c4]
$15:e1aa  32 90         and ($90)
$15:e1ac  0f d4 33 e5   ora $e533d4
$15:e1b0  1c e2 de      trb $dee2
$15:e1b3  b0 5f         bcs $e214
$15:e1b5  cc 67 c3      cpy $c367
$15:e1b8  a5 64         lda $64
$15:e1ba  b6 e4         ldx $e4,y
$15:e1bc  05 e1         ora $e1
$15:e1be  ff 84 7f e2   sbc $e27f84,x
$15:e1c2  1f fa 07 f7   ora $f707fa,x
$15:e1c6  01 fb         ora ($fb,x)
$15:e1c8  32 05         and ($05)
$15:e1ca  03 ed         ora $ed,s
$15:e1cc  00 fb         brk #$fb
$15:e1ce  c2 0c         rep #$0c
$15:e1d0  e1 3f         sbc ($3f,x)
$15:e1d2  90 44         bcc $e218
$15:e1d4  e1 95         sbc ($95,x)
$15:e1d6  d8            cld
$15:e1d7  97 ae         sta [$ae],y
$15:e1d9  19 ad 85      ora $85ad,y
$15:e1dc  14 40         trb $40
$15:e1de  7e 25 e0      ror $e025,x
$15:e1e1  90 0f         bcc $e1f2
$15:e1e3  c6 21         dec $21
$15:e1e5  5f 84 77 e1   eor $e17784,x
$15:e1e9  1e f5 c0      asl $c0f5,x
$15:e1ec  9c 3d 03      stz $033d
$15:e1ef  e9 2f 51      sbc #$512f
$15:e1f2  fa            plx
$15:e1f3  d3 d8         cmp ($d8,s),y
$15:e1f5  be d6 f6      ldx $f6d6,y
$15:e1f8  f2 cc         sbc ($cc)
$15:e1fa  e7 93         sbc [$93]
$15:e1fc  19 f3 bd      ora $bdf3,y
$15:e1ff  a7 f3         lda [$f3]
$15:e201  0f 81 48 38   ora $384881
$15:e205  0f f8 98 70   ora $7098f8
$15:e209  1b            tcs
$15:e20a  c1 cc         cmp ($cc,x)
$15:e20c  87 e3         sta [$e3]
$15:e20e  21 e0         and ($e0,x)
$15:e210  f2 e7         sbc ($e7)
$15:e212  c0 1f a0      cpy #$a01f
$15:e215  de 27 e8      dec $e827,x
$15:e218  07 d9         ora [$d9]
$15:e21a  d3 0f         cmp ($0f,s),y
$15:e21c  b2 6f         lda ($6f)
$15:e21e  30 1d         bmi $e23d
$15:e220  9b            txy
$15:e221  cc 17 66      cpy $6617
$15:e224  f3 14         sbc ($14,s),y
$15:e226  71 bc         adc ($bc),y
$15:e228  15 2c         ora $2c,x
$15:e22a  d9 bf 3c      cmp $3cbf,y
$15:e22d  70 43         bvs $e272
$15:e22f  fe 04 c1      inc $c104,x
$15:e232  1f 81 f8 0f   ora $0ff881,x
$15:e236  a3 bd         lda $bd,s
$15:e238  a6 33         ldx $33
$15:e23a  f9 8c ee      sbc $ee8c,y
$15:e23d  43 1b         eor $1b,s
$15:e23f  f0 d6         beq $e217
$15:e241  df ef c3 9b   cmp $9bc3ef,x
$15:e245  f3 e6         sbc ($e6,s),y
$15:e247  ff f6 58 38   sbc $3858f6,x
$15:e24b  35 bb         and $bb,x
$15:e24d  f7 68         sbc [$68],y
$15:e24f  37 42         and [$42],y
$15:e251  3f 8e 98 cf   and $cf988e,x
$15:e255  68            pla
$15:e256  5b            tcd
$15:e257  fe 05 73      inc $7305,x
$15:e25a  c7 61         cmp [$61]
$15:e25c  cf 7e 20 ff   cmp $ff207e
$15:e260  98            tya
$15:e261  07 82         ora [$82]
$15:e263  00 44         brk #$44
$15:e265  0c 01 49      tsb $4901
$15:e268  ed 10 fd      sbc $fd10
$15:e26b  b6 1e         ldx $1e,y
$15:e26d  b9 c0 d7      lda $d7c0,y
$15:e270  d8            cld
$15:e271  2a            rol a
$15:e272  bf 08 77 e3   lda $e37708,x
$15:e276  27 69         and [$69]
$15:e278  fb            xce
$15:e279  43 15         eor $15,s
$15:e27b  a1 78         lda ($78,x)
$15:e27d  1f 04 02 3f   ora $3f0204,x
$15:e281  00 87         brk #$87
$15:e283  c0 20 f0      cpy #$f020
$15:e286  08            php
$15:e287  34 02         bit $02,x
$15:e289  07 00         ora [$00]
$15:e28b  ef c8 27 9c   sbc $9c27c8
$15:e28f  3e 7f c1      rol $c17f,x
$15:e292  e2 13         sep #$13
$15:e294  78            sei
$15:e295  3c a3 c1      bit $c1a3,x
$15:e298  4f d0 77 78   eor $7877d0
$15:e29c  25 24         and $24
$15:e29e  00 87         brk #$87
$15:e2a0  e0 48         cpx #$48
$15:e2a2  22 50 9f 40   jsl $409f50
$15:e2a6  35 b6         and $b6,x
$15:e2a8  6d a5 9e      adc $9ea5
$15:e2ab  23 c6         and $c6,s
$15:e2ad  aa            tax
$15:e2ae  71 e6         adc ($e6),y
$15:e2b0  90 7f         bcc $e331
$15:e2b2  c4 0f         cpy $0f
$15:e2b4  15 03         ora $03,x
$15:e2b6  e2 70         sep #$70
$15:e2b8  63 10         adc $10,s
$15:e2ba  02 f8         cop #$f8
$15:e2bc  4e 0c 42      lsr $420c
$15:e2bf  47 0f         eor [$0f]
$15:e2c1  e1 a0         sbc ($a0,x)
$15:e2c3  49 a1         eor #$a1
$15:e2c5  e4 8e         cpx $8e
$15:e2c7  5e 70 ff      lsr $ff70,x
$15:e2ca  c8            iny
$15:e2cb  1f ee 09 1f   ora $1f09ee,x
$15:e2cf  f0 5f         beq $e330
$15:e2d1  b0 2c         bcs $e2ff
$15:e2d3  e0 bf         cpx #$bf
$15:e2d5  e0 05         cpx #$05
$15:e2d7  a0 80         ldy #$80
$15:e2d9  cb            wai
$15:e2da  1c 31 1e      trb $1e31
$15:e2dd  1a            inc a
$15:e2de  9c 75 a3      stz $a375
$15:e2e1  9f 16 e3 ec   sta $ece316,x
$15:e2e5  2c fb 3b      bit $3bfb
$15:e2e8  24 d7         bit $d7
$15:e2ea  cc 1f 00      cpy $001f
$15:e2ed  f8            sed
$15:e2ee  5c 20 13 03   jml $031320
$15:e2f2  10 97         bpl $e28b
$15:e2f4  c8            iny
$15:e2f5  c2 0c         rep #$0c
$15:e2f7  e0 57         cpx #$57
$15:e2f9  96 1f         stx $1f,y
$15:e2fb  f1 3f         sbc ($3f),y
$15:e2fd  e0 1e         cpx #$1e
$15:e2ff  cb            wai
$15:e300  ce 61 04      dec $0461
$15:e303  06 f8         asl $f8
$15:e305  23 f1         and $f1,s
$15:e307  ef 09 ec 0f   sbc $0fec09
$15:e30b  61 fe         adc ($fe,x)
$15:e30d  80 fc         bra $e30b
$15:e30f  21 e7         and ($e7,x)
$15:e311  30 fc         bmi $e30f
$15:e313  8a            txa
$15:e314  41 01         eor ($01,x)
$15:e316  b3 39         lda ($39,s),y
$15:e318  e4 c6         cpx $c6
$15:e31a  7c ef 49      jmp ($49ef,x)
$15:e31d  e4 c1         cpx $c1
$15:e31f  4a            lsr a
$15:e320  1c 01 10      trb $1001
$15:e323  70 1f         bvs $e344
$15:e325  e9 3c         sbc #$3c
$15:e327  e0 4c         cpx #$4c
$15:e329  38            sec
$15:e32a  0f c1 80 73   ora $7380c1
$15:e32e  e1 98         sbc ($98,x)
$15:e330  c5 00         cmp $00
$15:e332  83 05         sta $05,s
$15:e334  04 a9         tsb $a9
$15:e336  f2 0a         sbc ($0a)
$15:e338  c2 0a         rep #$0a
$15:e33a  21 10         and ($10,x)
$15:e33c  08            php
$15:e33d  14 03         trb $03
$15:e33f  11 00         ora ($00),y
$15:e341  92 89         sta ($89)
$15:e343  bc 6e d8      ldy $d86e,x
$15:e346  a8            tay
$15:e347  05 5e         ora $5e
$15:e349  01 af         ora ($af,x)
$15:e34b  82 5f a0      brl $83ad
$15:e34e  2b            pld
$15:e34f  fe a9 66      inc $66a9,x
$15:e352  cd f9 e3      cmp $e3f9
$15:e355  82 1f f3      brl $d677
$15:e358  9b            txy
$15:e359  0f 47 8c 2f   ora $2f8c47
$15:e35d  8b            phb
$15:e35e  03 4a         ora $4a,s
$15:e360  87 96         sta [$96]
$15:e362  47 a5         eor [$a5]
$15:e364  b1 a6         lda ($a6),y
$15:e366  c3 e3         cmp $e3,s
$15:e368  01 f9         ora ($f9,x)
$15:e36a  c0 fe         cpy #$fe
$15:e36c  f0 7f         beq $e3ed
$15:e36e  fc 3f ff      jsr ($ff3f,x)
$15:e371  1f ef cf f3   ora $f3cfef,x
$15:e375  f7 f8         sbc [$f8],y
$15:e377  ff ff c3 5b   sbc $5bc3ff,x
$15:e37b  57 e4         eor [$e4],y
$15:e37d  df fe bf c1   cmp $c1bffe,x
$15:e381  f7 98         sbc [$98],y
$15:e383  36 ff         rol $ff,x
$15:e385  80 cf         bra $e356
$15:e387  d8            cld
$15:e388  2e f8 88      rol $88f8
$15:e38b  ef 8b 21 ff   sbc $ff218b
$15:e38f  b1 df         lda ($df),y
$15:e391  f8            sed
$15:e392  a5 c0         lda $c0
$15:e394  31 4e         and ($4e),y
$15:e396  02 01         cop #$01
$15:e398  fb            xce
$15:e399  80 33         bra $e3ce
$15:e39b  83 9f         sta $9f,s
$15:e39d  3c 91 f6      bit $f691,x
$15:e3a0  39 73 88      and $8873,y
$15:e3a3  b7 c2         lda [$c2],y
$15:e3a5  9d c0 9a      sta $9ac0,x
$15:e3a8  c0 7f         cpy #$7f
$15:e3aa  b0 18         bcs $e3c4
$15:e3ac  5c 06 07 00   jml $000706
$15:e3b0  83 88         sta $88,s
$15:e3b2  06 1f         asl $1f
$15:e3b4  00 9f         brk #$9f
$15:e3b6  c0 3f         cpy #$3f
$15:e3b8  c2 83         rep #$83
$15:e3ba  b2 41         lda ($41)
$15:e3bc  f2 71         sbc ($71)
$15:e3be  ca            dex
$15:e3bf  75 c7         adc $c7,x
$15:e3c1  43 fe         eor $fe,s
$15:e3c3  87 fc         sta [$fc]
$15:e3c5  1d e1 bf      ora $bfe1,x
$15:e3c8  e0 47         cpx #$47
$15:e3ca  bc 3f 88      ldy $883f,x
$15:e3cd  07 80         ora [$80]
$15:e3cf  10 26         bpl $e3f7
$15:e3d1  28            plp
$15:e3d2  9a            txs
$15:e3d3  fc 71 57      jsr ($5771,x)
$15:e3d6  8b            phb
$15:e3d7  ae 33 c5      ldx $c533
$15:e3da  1e fc c1      asl $c1fc,x
$15:e3dd  fc 91 fc      jsr ($fc91,x)
$15:e3e0  75 c6         adc $c6,x
$15:e3e2  f9 83 87      sbc $8783,y
$15:e3e5  08            php
$15:e3e6  84 3e         sty $3e
$15:e3e8  10 17         bpl $e401
$15:e3ea  0b            phd
$15:e3eb  c7 3c         cmp [$3c]
$15:e3ed  7b            tdc
$15:e3ee  1e 75 7a      asl $7a75,x
$15:e3f1  c3 a1         cmp $a1,s
$15:e3f3  9f d3 a1 d6   sta $d6a1d3,x
$15:e3f7  38            sec
$15:e3f8  06 f3         asl $f3
$15:e3fa  01 bb         ora ($bb,x)
$15:e3fc  c1 81         cmp ($81,x)
$15:e3fe  53 81         eor ($81,s),y
$15:e400  00 f8         brk #$f8
$15:e402  83 06         sta $06,s
$15:e404  ff 00 be 40   sbc $40be00,x
$15:e408  23 3c         and $3c,s
$15:e40a  2b            pld
$15:e40b  d7 0e         cmp [$0e],y
$15:e40d  59 81 aa      eor $aa81,y
$15:e410  c4 70         cpy $70
$15:e412  53 8c         eor ($8c,s),y
$15:e414  cc 93 8b      cpy $8b93
$15:e417  1c d9 e0      trb $e0d9
$15:e41a  27 90         and [$90]
$15:e41c  04 f8         tsb $f8
$15:e41e  3f 43 dd 00   and $00dd43,x
$15:e422  e3 c0         sbc $c0,s
$15:e424  38            sec
$15:e425  70 0f         bvs $e436
$15:e427  1a            inc a
$15:e428  28            plp
$15:e429  7f 10 7f f4   adc $f47f10,x
$15:e42d  04 ba         tsb $ba
$15:e42f  10 2f         bpl $e460
$15:e431  f6 4f         inc $4f,x
$15:e433  e1 9c         sbc ($9c,x)
$15:e435  80 78         bra $e4af
$15:e437  a0 71         ldy #$71
$15:e439  08            php
$15:e43a  fb            xce
$15:e43b  85 0c         sta $0c
$15:e43d  a0 25         ldy #$25
$15:e43f  04 48         tsb $48
$15:e441  7f 08 03 62   adc $620308,x
$15:e445  cf 42 ff 14   cmp $14ff42
$15:e449  6e 03 f4      ror $f403
$15:e44c  0f c1 45 be   ora $be45c1
$15:e450  4e 38 dc      lsr $dc38
$15:e453  59 d9 94      eor $94d9,y
$15:e456  04 61         tsb $61
$15:e458  3f 64 0a 24   and $240a64,x
$15:e45c  0f c0 65 29   ora $2965c0
$15:e460  9c f2 63      stz $63f2
$15:e463  3e 77 d4      rol $d477,x
$15:e466  ff 80 ff ce   sbc $ceff80,x
$15:e46a  6c 3b 1d      jmp ($1d3b)
$15:e46d  0c e6 42      tsb $42e6
$15:e470  31 10         and ($10),y
$15:e472  0e 84 03      asl $0384
$15:e475  40            rti
$15:e476  84 14         sty $14
$15:e478  18            clc
$15:e479  7c 03 ca      jmp ($ca03,x)
$15:e47c  41 00         eor ($00,x)
$15:e47e  d9 11 03      cmp $0311,y
$15:e481  15 00         ora $00,x
$15:e483  ab            plb
$15:e484  c0 35         cpy #$35
$15:e486  70 44         bvs $e4cc
$15:e488  58            cli
$15:e489  6d e1 1f      adc $1fe1
$15:e48c  b8            clv
$15:e48d  a5 de         lda $de
$15:e48f  51 b3         eor ($b3),y
$15:e491  8e 19 8a      stx $8a19
$15:e494  08            php
$15:e495  64 18         stz $18
$15:e497  55 02         eor $02,x
$15:e499  2b            pld
$15:e49a  00 95         brk #$95
$15:e49c  e0 23         cpx #$23
$15:e49e  b4 0d         ldy $0d,x
$15:e4a0  ec 2b dd      cpx $dd2b
$15:e4a3  05 ee         ora $ee
$15:e4a5  42 f5         wdm #$f5
$15:e4a7  d0 de         bne $e487
$15:e4a9  64 1f         stz $1f
$15:e4ab  59 0f e6      eor $e60f,y
$15:e4ae  43 f1         eor $f1,s
$15:e4b0  90 fa         bcc $e4ac
$15:e4b2  04 02         tsb $02
$15:e4b4  20 18 1a      jsr $1a18
$15:e4b7  84 03         sty $03
$15:e4b9  60            rts
$15:e4ba  16 1b         asl $1b,x
$15:e4bc  80 78         bra $e536
$15:e4be  6a            ror a
$15:e4bf  79 ba 89      adc $89ba,y
$15:e4c2  c0 e8         cpy #$e8
$15:e4c4  39 bb 09      and $09bb,y
$15:e4c7  e0 bb         cpx #$bb
$15:e4c9  7e 38 2f      ror $2f38,x
$15:e4cc  8e 0f e7      stx $e70f
$15:e4cf  41 04         eor ($04,x)
$15:e4d1  3f ef 1f fb   and $fb1fef,x
$15:e4d5  cf d1 21 b7   cmp $b721d1
$15:e4d9  bf c9 6c 76   lda $766cc9,x
$15:e4dd  5b            tcd
$15:e4de  1d 15 24      ora $2415,x
$15:e4e1  34 db         bit $db,x
$15:e4e3  5d 26 df      eor $df26,x
$15:e4e6  4b            phk
$15:e4e7  b6 d2         ldx $d2,y
$15:e4e9  ed 99 fb      sbc $fb99
$15:e4ec  fe 7e 7f      inc $7f7e,x
$15:e4ef  9f 8f e3 d4   sta $d4e38f,x
$15:e4f3  81 17         sta ($17,x)
$15:e4f5  c7 c4         cmp [$c4]
$15:e4f7  f1 f1         sbc ($f1),y
$15:e4f9  1c 7c 43      trb $437c
$15:e4fc  4b            phk
$15:e4fd  63 57         adc $57,s
$15:e4ff  e4 7f         cpx $7f
$15:e501  fe bf c1      inc $c1bf,x
$15:e504  f9 34 bd      sbc $bd34,y
$15:e507  bd 3e 18      lda $183e,x
$15:e50a  0c 62 3f      tsb $3f62
$15:e50d  83 fe         sta $fe,s
$15:e50f  57 fc         eor [$fc],y
$15:e511  15 7d         ora $7d,x
$15:e513  c7 c2         cmp [$c2]
$15:e515  1f fc 81 fe   ora $fe81fc,x
$15:e519  20 ff e1      jsr $e1ff
$15:e51c  30 b7         bmi $e4d5
$15:e51e  ab            plb
$15:e51f  cd e0 8d      cmp $8de0
$15:e522  fe 38 b3      inc $b338,x
$15:e525  cf 94 3b 03   cmp $033b94
$15:e529  7f 99 73 f3   adc $f37399,x
$15:e52d  9e 3b f6      stz $f63b,x
$15:e530  06 3f         asl $3f
$15:e532  00 83         brk #$83
$15:e534  c0 20         cpy #$20
$15:e536  64 41         stz $41
$15:e538  6f 36 ff 81   adc $81ff36
$15:e53c  8f f8 50 2f   sta $2f50f8
$15:e540  fd 3b e6      sbc $e63b,x
$15:e543  be 61 57      ldx $5761,y
$15:e546  8c 78 71      sty $7178
$15:e549  d3 4c         cmp ($4c,s),y
$15:e54b  3b            tsc
$15:e54c  78            sei
$15:e54d  b0 04         bcs $e553
$15:e54f  21 e0         and ($e0,x)
$15:e551  00 04         brk #$04
$15:e553  d6 17         dec $17,x
$15:e555  88            dey
$15:e556  07 ca         ora [$ca]
$15:e558  1b            tcs
$15:e559  3c e1 fc      bit $fce1,x
$15:e55c  61 fc         adc ($fc,x)
$15:e55e  a9 f6         lda #$f6
$15:e560  d6 99         dec $99,x
$15:e562  ca            dex
$15:e563  9c 49 7c      stz $7c49
$15:e566  39 dc 0b      and $0bdc,y
$15:e569  79 04 a0      adc $a004,y
$15:e56c  23 01         and $01,s
$15:e56e  08            php
$15:e56f  47 a0         eor [$a0]
$15:e571  17 e8         ora [$e8],y
$15:e573  07 b3         ora [$b3]
$15:e575  1f 53 8e 63   ora $638e53,x
$15:e579  26 75         rol $75
$15:e57b  fb            xce
$15:e57c  04 3e         tsb $3e
$15:e57e  e1 be         sbc ($be,x)
$15:e580  e0 df         cpx #$df
$15:e582  f0 16         beq $e59a
$15:e584  3c e1 2c      bit $2ce1,x
$15:e587  00 20         brk #$20
$15:e589  47 02         eor [$02]
$15:e58b  19 37 92      ora $9237,y
$15:e58e  5d e0 cb      eor $cbe0,x
$15:e591  5c 3c 51 8f   jml $8f513c
$15:e595  ac 33 13      ldy $1333
$15:e598  7c b1 67      jmp ($67b1,x)
$15:e59b  bf 10 6f ec   lda $ec6f10,x
$15:e59f  0c 3e 10      tsb $103e
$15:e5a2  f1 01         sbc ($01),y
$15:e5a4  88            dey
$15:e5a5  c8            iny
$15:e5a6  4a            lsr a
$15:e5a7  54 fb 86      mvn $86,$fb
$15:e5aa  7f c0 31 09   adc $0931c0,x
$15:e5ae  9d 30 ea      sta $ea30,x
$15:e5b1  1a            inc a
$15:e5b2  69 cf         adc #$cf
$15:e5b4  22 1e 4d 04   jsl $044d1e
$15:e5b8  3a            dec a
$15:e5b9  10 d3         bpl $e58e
$15:e5bb  e1 00         sbc ($00,x)
$15:e5bd  ff c0 1f 65   sbc $651fc0,x
$15:e5c1  e1 8f         sbc ($8f,x)
$15:e5c3  c4 bd         cpy $bd
$15:e5c5  c1 30         cmp ($30,x)
$15:e5c7  89 fc         bit #$fc
$15:e5c9  33 f8         and ($f8,s),y
$15:e5cb  0f 88 09 4c   ora $4c0988
$15:e5cf  a4 a1         ldy $a1
$15:e5d1  0b            phd
$15:e5d2  fb            xce
$15:e5d3  30 66         bmi $e63b
$15:e5d5  73 c9         adc ($c9,s),y
$15:e5d7  94 f2         sty $f2,x
$15:e5d9  69 38         adc #$38
$15:e5db  9c 4c 26      stz $264c
$15:e5de  12 09         ora ($09)
$15:e5e0  04 02         tsb $02
$15:e5e2  80 42         bra $e626
$15:e5e4  19 f7 02      ora $02f7,y
$15:e5e7  79 c0 9c      adc $9cc0,y
$15:e5ea  70 26         bvs $e612
$15:e5ec  1c 09 01      trb $0109
$15:e5ef  1c 10 64      trb $6410
$15:e5f2  0d f0 f7      ora $f7f0
$15:e5f5  5e e6 93      lsr $93e6,x
$15:e5f8  18            clc
$15:e5f9  f6 ce         inc $ce,x
$15:e5fb  79 31 9f      adc $9f31,y
$15:e5fe  3b            tsc
$15:e5ff  c0 6a         cpy #$6a
$15:e601  93 7c         sta ($7c,s),y
$15:e603  04 7f         tsb $7f
$15:e605  81 3f         sta ($3f,x)
$15:e607  a0 4f         ldy #$4f
$15:e609  c8            iny
$15:e60a  40            rti
$15:e60b  46 5e         lsr $5e
$15:e60d  64 3f         stz $3f
$15:e60f  19 0f 27      ora $270f,y
$15:e612  d3 2c         cmp ($2c,s),y
$15:e614  0b            phd
$15:e615  f9 61 ed      sbc $ed61,y
$15:e618  9b            txy
$15:e619  cb            wai
$15:e61a  c3 5b         cmp $5b,s
$15:e61c  3a            dec a
$15:e61d  b6 de         ldx $de,y
$15:e61f  fe 7f 29      inc $297f,x
$15:e622  bf fd 0a d4   lda $d40afd,x
$15:e626  bb            tyx
$15:e627  62 3f 31      per $1769
$15:e62a  f1 04         sbc ($04),y
$15:e62c  fe 58 6b      inc $6b58,x
$15:e62f  6a            ror a
$15:e630  f0 a0         beq $e5d2
$15:e632  de e8 36      dec $36e8,x
$15:e635  b5 aa         lda $aa,x
$15:e637  50 ed         bvc $e626
$15:e639  67 f1         adc [$f1]
$15:e63b  9f e5 e3 f8   sta $f8e3e5,x
$15:e63f  78            sei
$15:e640  fe 3e 2f      inc $2f3e,x
$15:e643  8f 89 b2 43   sta $43b289
$15:e647  1b            tcs
$15:e648  11 16         ora ($16),y
$15:e64a  83 43         sta $43,s
$15:e64c  db            stp
$15:e64d  d7 83         cmp [$83],y
$15:e64f  be 53 f6      ldx $f653,y
$15:e652  1e 38 e4      asl $e438,x
$15:e655  f3 87         sbc ($87,s),y
$15:e657  d3 fe         cmp ($fe,s),y
$15:e659  43 ee         eor $ee,s
$15:e65b  1a            inc a
$15:e65c  79 c7 46      adc $46c7,y
$15:e65f  3c de 8c      bit $8cde,x
$15:e662  04 03         tsb $03
$15:e664  81 00         sta ($00,x)
$15:e666  f0 40         beq $e6a8
$15:e668  3f d0 1f fc   and $fc1fd0,x
$15:e66c  03 79         ora $79,s
$15:e66e  43 e1         eor $e1,s
$15:e670  4f fe 30 eb   eor $eb30fe
$15:e674  fe 03 1f      inc $1f03,x
$15:e677  70 f1         bvs $e66a
$15:e679  47 40         eor [$40]
$15:e67b  86 1f         stx $1f
$15:e67d  9b            txy
$15:e67e  c7 02         cmp [$02]
$15:e680  af c0 cc 70   lda $70ccc0
$15:e684  22 5c 3c ad   jsl $ad3c5c
$15:e688  1a            inc a
$15:e689  21 c7         and ($c7,x)
$15:e68b  b5 f3         lda $f3,x
$15:e68d  24 f8         bit $f8
$15:e68f  89 fc         bit #$fc
$15:e691  00 7e         brk #$7e
$15:e693  53 c8         eor ($c8,s),y
$15:e695  04 e0         tsb $e0
$15:e697  8c 33 08      sty $0833
$15:e69a  05 c2         ora $c2
$15:e69c  01 fa         ora ($fa,x)
$15:e69e  81 c2         sta ($c2,x)
$15:e6a0  a0 7b         ldy #$7b
$15:e6a2  5f 8d 2f 73   eor $732f8d,x
$15:e6a6  b6 a6         ldx $a6,y
$15:e6a8  7e 60 9f      ror $9f60,x
$15:e6ab  68            pla
$15:e6ac  77 2a         adc [$2a],y
$15:e6ae  6d fc 80      adc $80fc
$15:e6b1  17 c2         ora [$c2],y
$15:e6b3  1d 00 83      ora $8300,x
$15:e6b6  40            rti
$15:e6b7  20 66 61      jsr $6166
$15:e6ba  80 9a         bra $e656
$15:e6bc  86 19         stx $19
$15:e6be  f3 9f         sbc ($9f,s),y
$15:e6c0  f0 03         beq $e6c5
$15:e6c2  21 7e         and ($7e,x)
$15:e6c4  c0 ec         cpy #$ec
$15:e6c6  79 d0 7b      adc $7bd0,y
$15:e6c9  c7 32         cmp [$32]
$15:e6cb  e7 b0         sbc [$b0]
$15:e6cd  1f 80 7d c1   ora $c17d80,x
$15:e6d1  20 09 2f      jsr $2f09
$15:e6d4  c4 1f         cpy $1f
$15:e6d6  c9 1b         cmp #$1b
$15:e6d8  cc d9 fe      cpy $fed9
$15:e6db  90 ee         bcc $e6cb
$15:e6dd  14 fb         trb $fb
$15:e6df  e3 0c         sbc $0c,s
$15:e6e1  e5 4e         sbc $4e
$15:e6e3  26 bf         rol $bf
$15:e6e5  10 fa         bpl $e6e1
$15:e6e7  1a            inc a
$15:e6e8  c8            iny
$15:e6e9  ce 10 73      dec $7310
$15:e6ec  10 d9         bpl $e6c7
$15:e6ee  e0 14         cpx #$14
$15:e6f0  58            cli
$15:e6f1  e6 a6         inc $a6
$15:e6f3  69 96         adc #$96
$15:e6f5  96 72         stx $72,y
$15:e6f7  e3 3e         sbc $3e,s
$15:e6f9  48            pha
$15:e6fa  0c 76 03      tsb $0376
$15:e6fd  26 f0         rol $f0
$15:e6ff  04 43         tsb $43
$15:e701  c7 00         cmp [$00]
$15:e703  e1 b0         sbc ($b0,x)
$15:e705  87 cc         sta [$cc]
$15:e707  0e 06 40      asl $4006
$15:e70a  c7 e0         cmp [$e0]
$15:e70c  1c e8 76      trb $76e8
$15:e70f  96 77         stx $77,y
$15:e711  1e b0 ef      asl $efb0,x
$15:e714  f8            sed
$15:e715  0f 50 8f f8   ora $f88f50
$15:e719  28            plp
$15:e71a  fb            xce
$15:e71b  83 88         sta $88,s
$15:e71d  27 80         and [$80]
$15:e71f  16 00         asl $00,x
$15:e721  90 0f         bcc $e732
$15:e723  c4 ce         cpy $ce
$15:e725  79 31 9f      adc $9f31,y
$15:e728  3b            tsc
$15:e729  e8            inx
$15:e72a  e2 0f         sep #$0f
$15:e72c  fc e6 43      jsr ($43e6,x)
$15:e72f  f1 90         sbc ($90),y
$15:e731  f0 7d         beq $e7b0
$15:e733  7c 20 01      jmp ($0120,x)
$15:e736  fc 17 78      jsr ($7817,x)
$15:e739  fb            xce
$15:e73a  79 f0 cc      adc $ccf0,y
$15:e73d  60            rts
$15:e73e  80 5c         bra $e79c
$15:e740  24 57         bit $57
$15:e742  40            rti
$15:e743  f9 23 40      sbc $4023,y
$15:e746  7d 1e 1a      adc $1a1e,x
$15:e749  d9 bd ac      cmp $acbd,y
$15:e74c  27 83         and [$83]
$15:e74e  9b            txy
$15:e74f  ff cf f9 4b   sbc $4bf9cf,x
$15:e753  b6 23         ldx $23,y
$15:e755  f3 1f         sbc ($1f,s),y
$15:e757  10 4f         bpl $e7a8
$15:e759  e5 0e         sbc $0e
$15:e75b  d6 af         dec $af,x
$15:e75d  2a            rol a
$15:e75e  12 d1         ora ($d1)
$15:e760  f1 b1         sbc ($b1),y
$15:e762  15 f9         ora $f9,x
$15:e764  63 22         adc $22,s
$15:e766  0c 56 76      tsb $7656
$15:e769  83 43         sta $43,s
$15:e76b  db            stp
$15:e76c  d7 24         cmp [$24],y
$15:e76e  83 d6         sta $d6,s
$15:e770  38            sec
$15:e771  1a            inc a
$15:e772  fb            xce
$15:e773  06 a2         asl $a2
$15:e775  c1 94         cmp ($94,x)
$15:e777  a3 d6         lda $d6,s
$15:e779  f9 9a 6c      sbc $6c9a,y
$15:e77c  4d 86 0d      eor $0d86
$15:e77f  f8            sed
$15:e780  80 4f         bra $e7d1
$15:e782  e0 11         cpx #$11
$15:e784  f0 10         beq $e796
$15:e786  ce 20 13      dec $1320
$15:e789  08            php
$15:e78a  05 c2         ora $c2
$15:e78c  00 ff         brk #$ff
$15:e78e  0b            phd
$15:e78f  a6 2f         ldx $2f
$15:e791  13 ff         ora ($ff,s),y
$15:e793  93 4f         sta ($4f,s),y
$15:e795  bd 70 8a      lda $8a70,x
$15:e798  f7 02         sbc [$02],y
$15:e79a  5b            tcd
$15:e79b  e1 d5         sbc ($d5,x)
$15:e79d  58            cli
$15:e79e  ea            nop
$15:e79f  bc 66 f1      ldy $f166,x
$15:e7a2  70 60         bvs $e804
$15:e7a4  1f 70 00 c7   ora $c70070,x
$15:e7a8  a0 11         ldy #$11
$15:e7aa  c0 30         cpy #$30
$15:e7ac  e8            inx
$15:e7ad  f1 97         sbc ($97),y
$15:e7af  08            php
$15:e7b0  3f 6a 07 0c   and $0c076a,x
$15:e7b4  80 72         bra $e828
$15:e7b6  ff 13 2e 77   sbc $772e13,x
$15:e7ba  f6 07         inc $07,x
$15:e7bc  f9 83 82      sbc $8283,y
$15:e7bf  cb            wai
$15:e7c0  f9 00 ff      sbc $ff00,y
$15:e7c3  c0 20         cpy #$20
$15:e7c5  f0 08         beq $e7cf
$15:e7c7  0b            phd
$15:e7c8  78            sei
$15:e7c9  fe 50 ef      inc $ef50,x
$15:e7cc  2c 72 15      bit $1572
$15:e7cf  f8            sed
$15:e7d0  d2 f8         cmp ($f8)
$15:e7d2  63 50         adc $50,s
$15:e7d4  3f ac 1a 6b   and $6b1aac,x
$15:e7d8  06 ac         asl $ac
$15:e7da  70 c9         bvs $e7a5
$15:e7dc  21 03         and ($03,x)
$15:e7de  23 08         and $08,s
$15:e7e0  a4 08         ldy $08
$15:e7e2  60            rts
$15:e7e3  ff 07 f8 4f   sbc $4ff807,x
$15:e7e7  20 15 c8      jsr $c815
$15:e7ea  ff 9a 0d 33   sbc $330d9a,x
$15:e7ee  37 07         and [$07],y
$15:e7f0  03 25         ora $25,s
$15:e7f2  43 d4         eor $d4,s
$15:e7f4  53 e6         eor ($e6,s),y
$15:e7f6  79 ca 64      adc $64ca,y
$15:e7f9  4f c1 00 fc   eor $fc00c1
$15:e7fd  91 04         sta ($04),y
$15:e7ff  02 06         cop #$06
$15:e801  d0 04         bne $e807
$15:e803  85 82         sta $82
$15:e805  00 7f         brk #$7f
$15:e807  0e 57 0e      asl $0e57
$15:e80a  f5 03         sbc $03,x
$15:e80c  f4 40 e3      pea $e340
$15:e80f  d0 39         bne $e84a
$15:e811  2f 87 95 38   and $389587
$15:e815  da            phx
$15:e816  d3 3f         cmp ($3f,s),y
$15:e818  50 63         bvc $e87d
$15:e81a  68            pla
$15:e81b  10 c1         bpl $e7de
$15:e81d  42 42         wdm #$42
$15:e81f  90 23         bcc $e844
$15:e821  81 84         sta ($84,x)
$15:e823  09 21         ora #$21
$15:e825  4b            phk
$15:e826  dc 78 63      jml [$6378]
$15:e829  9c 89 b5      stz $b589
$15:e82c  f3 07         sbc ($07,s),y
$15:e82e  1a            inc a
$15:e82f  f2 d0         sbc ($d0)
$15:e831  af d9 98 c7   lda $c798d9
$15:e835  f9 50 ad      sbc $ad50,y
$15:e838  e2 c0         sep #$c0
$15:e83a  c0 3c         cpy #$3c
$15:e83c  e4 41         cpx $41
$15:e83e  ce 78 e8      dec $e878
$15:e841  37 fc         and [$fc],y
$15:e843  ec 72 c7      cpx $c772
$15:e846  00 df         brk #$df
$15:e848  60            rts
$15:e849  29 b0         and #$b0
$15:e84b  1f c4 04 ae   ora $ae04c4,x
$15:e84f  04 a0         tsb $a0
$15:e851  c0 40         cpy #$40
$15:e853  3c 64 41      bit $4164,x
$15:e856  bf c0 17 a0   lda $a017c0,x
$15:e85a  bd 02 18      lda $1802,x
$15:e85d  12 82         ora ($82)
$15:e85f  05 00         ora $00
$15:e861  84 12         sty $12
$15:e863  06 15         asl $15
$15:e865  00 93         brk #$93
$15:e867  c0 31         cpy #$31
$15:e869  70 08         bvs $e873
$15:e86b  b4 14         ldy $14,x
$15:e86d  94 6f         sty $6f,x
$15:e86f  f9 d7 c0      sbc $c0d7,y
$15:e872  2f 70 4d bc   and $bc4d70
$15:e876  22 77 14 fb   jsl $fb1477
$15:e87a  ca            dex
$15:e87b  36 31         rol $31,x
$15:e87d  eb            xba
$15:e87e  9c b0 32      stz $32b0
$15:e881  0f 10 7f 03   ora $037f10
$15:e885  dc 22 b4      jml [$b422]
$15:e888  09 5c         ora #$5c
$15:e88a  02 3f         cop #$3f
$15:e88c  40            rti
$15:e88d  97 e0         sta [$e0],y
$15:e88f  05 21         ora $21
$15:e891  cc 87 e3      cpy $e387
$15:e894  21 e2         and ($e2,x)
$15:e896  fa            plx
$15:e897  d8            cld
$15:e898  40            rti
$15:e899  3e 04 0b      rol $0b04,x
$15:e89c  70 81         bvs $e81f
$15:e89e  3f 1f fd 21   and $21fd1f,x
$15:e8a2  8d 9b c6      sta $c69b
$15:e8a5  77 31         adc [$31],y
$15:e8a7  3a            dec a
$15:e8a8  14 fe         trb $fe
$15:e8aa  67 3d         adc [$3d]
$15:e8ac  99 cf 26      sta $26cf,y
$15:e8af  ff f3 f8 f7   sbc $f7f8f3,x
$15:e8b3  e6 fc         inc $fc
$15:e8b5  f9 ff 1e      sbc $1eff,y
$15:e8b8  7f c3 9f f0   adc $f09fc3,x
$15:e8bc  67 fc         adc [$fc]
$15:e8be  0a            asl a
$15:e8bf  5d b1 1f      eor $1fb1,x
$15:e8c2  98            tya
$15:e8c3  f8            sed
$15:e8c4  82 7f 28      brl $1146
$15:e8c7  76 a5         ror $a5,x
$15:e8c9  78            sei
$15:e8ca  50 ad         bvc $e879
$15:e8cc  0b            phd
$15:e8cd  30 a2         bmi $e871
$15:e8cf  5a            phy
$15:e8d0  29 16         and #$16
$15:e8d2  0b            phd
$15:e8d3  85 03         sta $03
$15:e8d5  81 00         sta ($00,x)
$15:e8d7  c6 44         dec $44
$15:e8d9  17 e9         ora [$e9],y
$15:e8db  88            dey
$15:e8dc  88            dey
$15:e8dd  60            rts
$15:e8de  19 00 5e      ora $5e00,y
$15:e8e1  f6 e7         inc $e7,x
$15:e8e3  c0 33         cpy #$33
$15:e8e5  70 38         bvs $e91f
$15:e8e7  bd c2 6b      lda $6bc2,x
$15:e8ea  cc b2 66      cpy $66b2
$15:e8ed  a7 34         lda [$34]
$15:e8ef  7c 95 bb      jmp ($bb95,x)
$15:e8f2  13 38         ora ($38,s),y
$15:e8f4  e3 c0         sbc $c0,s
$15:e8f6  3f 90 0c 7c   and $7c0c90,x
$15:e8fa  02 07         cop #$07
$15:e8fc  00 80         brk #$80
$15:e8fe  97 07         sta [$07],y
$15:e900  03 00         ora $00,s
$15:e902  7e 87 fe      ror $fe87,x
$15:e905  01 69         ora ($69,x)
$15:e907  87 75         sta [$75]
$15:e909  23 fd         and $fd,s
$15:e90b  08            php
$15:e90c  fe 9e 71      inc $719e,x
$15:e90f  af 98 68 27   lda $276898
$15:e913  e1 50         sbc ($50,x)
$15:e915  e9 c7         sbc #$c7
$15:e917  08            php
$15:e918  21 e0         and ($e0,x)
$15:e91a  10 0a         bpl $e926
$15:e91c  f4 04 a8      pea $a804
$15:e91f  21 0f         and ($0f,x)
$15:e921  24 7e         bit $7e
$15:e923  1f f0 06 80   ora $8006f0,x
$15:e927  34 27         bit $27,x
$15:e929  9c 3f 8c      stz $8c3f
$15:e92c  3b            tsc
$15:e92d  27 7c         and [$7c]
$15:e92f  f0 47         beq $e978
$15:e931  db            stp
$15:e932  dd 2c f0      cmp $f02c,x
$15:e935  45 fe         eor $fe
$15:e937  1c b9 c4      trb $c4b9
$15:e93a  0f f1 b5 e6   ora $e6b5f1
$15:e93e  79 63 9f      adc $9f63,y
$15:e941  38            sec
$15:e942  47 2a         eor [$2a]
$15:e944  70 3e         bvs $e984
$15:e946  08            php
$15:e947  7c 02 0e      jmp ($0e02,x)
$15:e94a  62 10 18      per $015d
$15:e94d  00 c0         brk #$c0
$15:e94f  c6 58         dec $58
$15:e951  f9 87 1e      sbc $1e87,y
$15:e954  f1 19         sbc ($19),y
$15:e956  b3 53         lda ($53,s),y
$15:e958  ee 1a 39      inc $391a
$15:e95b  e7 a2         sbc [$a2]
$15:e95d  1f 1a 81 e5   ora $e5811a,x
$15:e961  fe 0b d0      inc $d00b,x
$15:e964  65 82         adc $82
$15:e966  04 97         tsb $97
$15:e968  a0 1f         ldy #$1f
$15:e96a  07 f8         ora [$f8]
$15:e96c  18            clc
$15:e96d  43 b5         eor $b5,s
$15:e96f  26 f4         rol $f4
$15:e971  c7 3e         cmp [$3e]
$15:e973  f0 cd         beq $e942
$15:e975  55 63         eor $63,x
$15:e977  8b            phb
$15:e978  31 85         and ($85),y
$15:e97a  78            sei
$15:e97b  eb            xba
$15:e97c  bc 69 ac      ldy $ac69,x
$15:e97f  18            clc
$15:e980  0a            asl a
$15:e981  06 74         asl $74
$15:e983  87 40         sta [$40]
$15:e985  23 90         and $90,s
$15:e987  09 c4         ora #$c4
$15:e989  03 f1         ora $f1,s
$15:e98b  00 f1         brk #$f1
$15:e98d  40            rti
$15:e98e  f2 31         sbc ($31)
$15:e990  ea            nop
$15:e991  25 ef         and $ef
$15:e993  3f e0 bf 60   and $60bfe0,x
$15:e997  7f 10 7e 7c   adc $7c7e10,x
$15:e99b  c0 1a         cpy #$1a
$15:e99d  0f f0 10 82   ora $8210f0
$15:e9a1  0c 1b d1      tsb $d11b
$15:e9a4  48            pha
$15:e9a5  e1 e6         sbc ($e6,x)
$15:e9a7  2e 7e 48      rol $487e
$15:e9aa  8d 33 73      sta $7333
$15:e9ad  32 e4         and ($e4)
$15:e9af  24 c1         bit $c1
$15:e9b1  22 10 1f e4   jsl $e41f10
$15:e9b5  f2 01         sbc ($01)
$15:e9b7  0c 53 0c      tsb $0c53
$15:e9ba  18            clc
$15:e9bb  c8            iny
$15:e9bc  aa            tax
$15:e9bd  30 65         bmi $ea24
$15:e9bf  04 0a         tsb $0a
$15:e9c1  01 08         ora ($08,x)
$15:e9c3  80 27         bra $e9ec
$15:e9c5  c2 15         rep #$15
$15:e9c7  00 93         brk #$93
$15:e9c9  c0 31 70      cpy #$7031
$15:e9cc  08            php
$15:e9cd  9c 11 94      stz $9411
$15:e9d0  6f f7 82 c0   adc $c082f7
$15:e9d4  35 b0         and $b0,x
$15:e9d6  2b            pld
$15:e9d7  f4 17 7b      pea $7b17
$15:e9da  0a            asl a
$15:e9db  97 41         sta [$41],y
$15:e9dd  7b            tdc
$15:e9de  90 bd         bcc $e99d
$15:e9e0  64 3f         stz $3f
$15:e9e2  b9 0f 0c      lda $0c0f,y
$15:e9e5  83 fd         sta $fd,s
$15:e9e7  2a            rol a
$15:e9e8  10 09         bpl $e9f3
$15:e9ea  00 90         brk #$90
$15:e9ec  74 02         stz $02,x
$15:e9ee  41 b9         eor ($b9,x)
$15:e9f0  cf 26 33 e9   cmp $e93326
$15:e9f4  98            tya
$15:e9f5  c2 67         rep #$67
$15:e9f7  f8            sed
$15:e9f8  09 ff 00      ora #$00ff
$15:e9fb  83 4f         sta $4f,s
$15:e9fd  fc 2e 7c      jsr ($7c2e,x)
$15:ea00  00 66         brk #$66
$15:ea02  03 30         ora $30,s
$15:ea04  9f cc 11 20   sta $2011cc,x
$15:ea08  ff 62 09 4c   sbc $4c0962,x
$15:ea0c  09 d3 4f      ora #$4fd3
$15:ea0f  b0 1d         bcs $ea2e
$15:ea11  61 94         adc ($94,x)
$15:ea13  58            cli
$15:ea14  08            php
$15:ea15  81 87         sta ($87,x)
$15:ea17  d6 16         dec $16,x
$15:ea19  41 c2         eor ($c2,x)
$15:ea1b  6f b7 7e f1   adc $f17eb7
$15:ea1f  00 b4         brk #$b4
$15:ea21  43 f4         eor $f4,s
$15:ea23  d3 9e         cmp ($9e,s),y
$15:ea25  4d da 3f      eor $3fda
$15:ea28  60            rts
$15:ea29  87 dc         sta [$dc]
$15:ea2b  3a            dec a
$15:ea2c  77 cc         adc [$cc],y
$15:ea2e  c4 9f         cpy $9f
$15:ea30  ff 00 3a 83   sbc $833a00,x
$15:ea34  38            sec
$15:ea35  30 00         bmi $ea37
$15:ea37  45 67         eor $67
$15:ea39  05 42         ora $42
$15:ea3b  3f a9 c7 c4   and $c4c7a9,x
$15:ea3f  38            sec
$15:ea40  f8            sed
$15:ea41  cb            wai
$15:ea42  3d 6f 67      and $676f,x
$15:ea45  e6 88         inc $88
$15:ea47  78            sei
$15:ea48  e3 1d         sbc $1d,s
$15:ea4a  59 67 82      eor $8267,y
$15:ea4d  01 70         ora ($70,x)
$15:ea4f  80 4e         bra $ea9f
$15:ea51  20 11 88      jsr $8811
$15:ea54  04 32         tsb $32
$15:ea56  01 0f         ora ($0f,x)
$15:ea58  80 41         bra $ea9b
$15:ea5a  e0 10 38      cpx #$3810
$15:ea5d  07 fa         ora [$fa]
$15:ea5f  03 1f         ora $1f,s
$15:ea61  f0 3f         beq $eaa2
$15:ea63  c2 79         rep #$79
$15:ea65  c3 80         cmp $80,s
$15:ea67  7f f8 5f ec   adc $ec5ff8,x
$15:ea6b  0c 02 fe      tsb $fe02
$15:ea6e  e0 98 08      cpx #$0898
$15:ea71  dc 09 43      jml [$4309]
$15:ea74  44 f8 f5      mvp $f5,$f8
$15:ea77  a6 70         ldx $70
$15:ea79  9f 14 f3 cf   sta $cff314,x
$15:ea7d  91 c3         sta ($c3),y
$15:ea7f  5e e1 9a      lsr $9ae1,x
$15:ea82  08            php
$15:ea83  7f 92 1f 0e   adc $0e1f92,x
$15:ea87  13 0c         ora ($0c,s),y
$15:ea89  70 48         bvs $ead3
$15:ea8b  2e f0 48      rol $48f0
$15:ea8e  81 a4         sta ($a4,x)
$15:ea90  a4 9d         ldy $9d
$15:ea92  cf c4 1f cd   cmp $cd1fc4
$15:ea96  19 60 83      ora $8360,y
$15:ea99  fc 38 d3      jsr ($d338,x)
$15:ea9c  98            tya
$15:ea9d  cf 9a ff 80   cmp $80ff9a
$15:eaa1  16 83         asl $83,x
$15:eaa3  83 3e         sta $3e,s
$15:eaa5  10 7c         bpl $eb23
$15:eaa7  d6 1e         dec $1e,x
$15:eaa9  51 e3         eor ($e3),y
$15:eaab  ca            dex
$15:eaac  5c 79 53 88   jml $885379
$15:eab0  9f e3 8b 3c   sta $3c8be3,x
$15:eab4  f8            sed
$15:eab5  c3 3f         cmp $3f,s
$15:eab7  06 61         asl $61
$15:eab9  31 81         and ($81),y
$15:eabb  7c 05 60      jmp ($6005,x)
$15:eabe  2b            pld
$15:eabf  21 68         and ($68,x)
$15:eac1  78            sei
$15:eac2  e3 83         sbc $83,s
$15:eac4  12 b9         ora ($b9)
$15:eac6  e3 23         sbc $23,s
$15:eac8  9e 3a 1d      stz $1d3a,x
$15:eacb  ff 33 18 7f   sbc $7f1833,x
$15:eacf  83 82         sta $82,s
$15:ead1  00 a1         brk #$a1
$15:ead3  e7 25         sbc [$25]
$15:ead5  0a            asl a
$15:ead6  74 3c         stz $3c,x
$15:ead8  f1 ce         sbc ($ce),y
$15:eada  14 e2         trb $e2
$15:eadc  09 f1 94      ora #$94f1
$15:eadf  f8            sed
$15:eae0  a7 b0         lda [$b0]
$15:eae2  6f 9c 13 c3   adc $c3139c
$15:eae6  06 55         asl $55
$15:eae8  90 ac         bcc $ea96
$15:eaea  0b            phd
$15:eaeb  e0 63 04      cpx #$0463
$15:eaee  f8            sed
$15:eaef  3a            dec a
$15:eaf0  49 03 44      eor #$4403
$15:eaf3  90 81         bcc $ea76
$15:eaf5  20 35 f2      jsr $f235
$15:eaf8  90 58         bcc $eb52
$15:eafa  04 2a         tsb $2a
$15:eafc  03 07         ora $07,s
$15:eafe  81 05         sta ($05,x)
$15:eb00  42 2d         wdm #$2d
$15:eb02  03 0a         ora $0a,s
$15:eb04  83 d6         sta $d6,s
$15:eb06  09 20 ad      ora #$ad20
$15:eb09  08            php
$15:eb0a  0c 12 2d      tsb $2d12
$15:eb0d  0b            phd
$15:eb0e  95 40         sta $40,x
$15:eb10  c5 e1         cmp $e1
$15:eb12  3a            dec a
$15:eb13  89 c4 86      bit #$86c4
$15:eb16  83 52         sta $52,s
$15:eb18  85 cc         sta $cc
$15:eb1a  a3 6a         lda $6a,s
$15:eb1c  b1 82         lda ($82),y
$15:eb1e  0f cc 8c a3   ora $a38ccc
$15:eb22  b2 1d         lda ($1d)
$15:eb24  87 c8         sta [$c8]
$15:eb26  a4 11         ldy $11
$15:eb28  b2 a8         lda ($a8)
$15:eb2a  e6 fa         inc $fa
$15:eb2c  51 b9         eor ($b9),y
$15:eb2e  19 18 4b      ora $4b18,y
$15:eb31  e1 43         sbc ($43,x)
$15:eb33  31 1e         and ($1e),y
$15:eb35  8e 09 63      stx $6309
$15:eb38  82 3d 59      brl $4478
$15:eb3b  86 02         stx $02
$15:eb3d  72 85         adc ($85)
$15:eb3f  30 d0         bmi $eb11
$15:eb41  fd 21 30      sbc $3021,x
$15:eb44  95 40         sta $40,x
$15:eb46  62 b0 2d      per $18f9
$15:eb49  74 16         stz $16,x
$15:eb4b  b9 0b d6      lda $d60b,y
$15:eb4e  41 eb         eor ($eb,x)
$15:eb50  90 ff         bcc $eb51
$15:eb52  64 3c         stz $3c
$15:eb54  fd 11 08      sbc $0811,x
$15:eb57  04 82         tsb $82
$15:eb59  01 50         ora ($50,x)
$15:eb5b  80 73         bra $ebd0
$15:eb5d  21 ea         and ($ea,x)
$15:eb5f  fc d8 40      jsr ($40d8,x)
$15:eb62  2e 10 05      rol $0510
$15:eb65  f9 7c 18      sbc $187c,y
$15:eb68  ca            dex
$15:eb69  ce f6 f6      dec $f6f6
$15:eb6c  df e4 14 f8   cmp $f814e4,x
$15:eb70  85 06         sta $06
$15:eb72  3d b7 cc      and $ccb7,x
$15:eb75  48            pha
$15:eb76  f1 92         sbc ($92),y
$15:eb78  8c 7c cf      sty $cf7c
$15:eb7b  07 bf         ora [$bf]
$15:eb7d  c0 70 20      cpy #$2070
$15:eb80  1e 00 00      asl $0000,x
$15:eb83  d8            cld
$15:eb84  18            clc
$15:eb85  02 c1         cop #$c1
$15:eb87  0b            phd
$15:eb88  e3 b8         sbc $b8,s
$15:eb8a  20 1e 58      jsr $581e
$15:eb8d  e6 0e         inc $0e
$15:eb8f  f1 ea         sbc ($ea),y
$15:eb91  8c 71 66      sty $6671
$15:eb94  30 af         bmi $eb45
$15:eb96  1d 63 87      ora $8763,x
$15:eb99  75 83         adc $83,x
$15:eb9b  7a            ply
$15:eb9c  21 f0         and ($f0,x)
$15:eb9e  38            sec
$15:eb9f  04 1c         tsb $1c
$15:eba1  40            rti
$15:eba2  30 e8         bmi $eb8c
$15:eba4  04 72         tsb $72
$15:eba6  01 3c         ora ($3c,x)
$15:eba8  80 7e         bra $ec28
$15:ebaa  18            clc
$15:ebab  c3 9e         cmp $9e,s
$15:ebad  8f 58 2f f9   sta $f92f58
$15:ebb1  ef 0d e3 0f   sbc $0fe30d
$15:ebb5  e7 8c         sbc [$8c]
$15:ebb7  7f e0 03 70   adc $7003e0,x
$15:ebbb  8f f8 3c 30   sta $303cf8
$15:ebbf  0c 03 7a      tsb $7a03
$15:ebc2  ed 70 cd      sbc $cd70
$15:ebc5  86 1e         stx $1e
$15:ebc7  a9 c7 8c      lda #$8cc7
$15:ebca  f0 65         beq $ec31
$15:ebcc  fe 0d 65      inc $650d,x
$15:ebcf  83 13         sta $13,s
$15:ebd1  61 e5         adc ($e5,x)
$15:ebd3  48            pha
$15:ebd4  d8            cld
$15:ebd5  e1 78         sbc ($78,x)
$15:ebd7  80 4e         bra $ec27
$15:ebd9  20 13 e8      jsr $e813
$15:ebdc  04 7c         tsb $7c
$15:ebde  cc 31 e1      cpy $e131
$15:ebe1  30 8e         bmi $eb71
$15:ebe3  43 e1         eor $e1,s
$15:ebe5  0f e1 ff 21   ora $21ffe1
$15:ebe9  ff 08 84 7f   sbc $7f8408,x
$15:ebed  e5 03         sbc $03
$15:ebef  a7 70         lda [$70]
$15:ebf1  22 2c d7 00   jsl $00d72c
$15:ebf5  87 f2         sta [$f2]
$15:ebf7  01 3f         ora ($3f,x)
$15:ebf9  80 27         bra $ec22
$15:ebfb  83 e3         sta $e3,s
$15:ebfd  0c 07 87      tsb $8707
$15:ec00  8e 31 ca      stx $ca31
$15:ec03  9c 45 3e      stz $3e45
$15:ec06  34 8e         bit $8e,x
$15:ec08  1c d2 0f      trb $0fd2
$15:ec0b  f1 83         sbc ($83),y
$15:ec0d  07 c0         ora [$c0]
$15:ec0f  3e c2 92      rol $92c2,x
$15:ec12  15 83         ora $83,x
$15:ec14  fc 0e e1      jsr ($e10e,x)
$15:ec17  4e b8 cf      lsr $cfb8
$15:ec1a  f8            sed
$15:ec1b  1f e8 0d e7   ora $e70de8,x
$15:ec1f  0c 3d 0c      tsb $0c3d
$15:ec22  1d f0 72      ora $72f0,x
$15:ec25  00 10         brk #$10
$15:ec27  c0 37 a6      cpy #$a637
$15:ec2a  e5 05         sbc $05
$15:ec2c  ca            dex
$15:ec2d  e1 a5         sbc ($a5,x)
$15:ec2f  3e 2c 25      rol $252c,x
$15:ec32  c6 65         dec $65
$15:ec34  c8            iny
$15:ec35  fa            plx
$15:ec36  c3 3f         cmp $3f,s
$15:ec38  30 4f         bmi $ec89
$15:ec3a  e4 08         cpx $08
$15:ec3c  56 17         lsr $17,x
$15:ec3e  81 30         sta ($30,x)
$15:ec40  89 40 42      bit #$4240
$15:ec43  09 f2 80      ora #$80f2
$15:ec46  c0 00 2a      cpy #$2a00
$15:ec49  00 4e         brk #$4e
$15:ec4b  2e 0d ff      rol $ff0d
$15:ec4e  e0 b8 03      cpx #$03b8
$15:ec51  00 0e         brk #$0e
$15:ec53  ff e0 b8 01   sbc $01b8e0,x
$15:ec57  80 0f         bra $ec68
$15:ec59  ff e0 b8 03   sbc $03b8e0,x
$15:ec5d  80 10         bra $ec6f
$15:ec5f  ff e0 b8 03   sbc $03b8e0,x
$15:ec63  c0 11 ff      cpy #$ff11
$15:ec66  e0 b8 06      cpx #$06b8
$15:ec69  15 12         ora $12,x
$15:ec6b  ff e0 b8 07   sbc $07b8e0,x
$15:ec6f  a8            tay
$15:ec70  13 ff         ora ($ff,s),y
$15:ec72  e0 b8 07      cpx #$07b8
$15:ec75  a8            tay
$15:ec76  18            clc
$15:ec77  00 00         brk #$00
$15:ec79  2f 32 65 7f   and $7f6532
$15:ec7d  98            tya
$15:ec7e  b2 cb         lda ($cb)
$15:ec80  e5 fc         sbc $fc
$15:ec82  19 32 4c      ora $4c32,y
$15:ec85  65 72         adc $72
$15:ec87  7f 8c 98 a5   adc $a5988c,x
$15:ec8b  b2 bf         lda ($bf)
$15:ec8d  cb            wai
$15:ec8e  d8            cld
$15:ec8f  e5 f2         sbc $f2
$15:ec91  fc 0b 13      jsr ($130b,x)
$15:ec94  00 10         brk #$10
$15:ec96  02 10         cop #$10
$15:ec98  0c 10 1c      tsb $1c10
$15:ec9b  10 ff         bpl $ec9c
$15:ec9d  00 04         brk #$04
$15:ec9f  10 00         bpl $eca1
$15:eca1  00 2c         brk #$2c
$15:eca3  10 44         bpl $ece9
$15:eca5  11 f9         ora ($f9),y
$15:eca7  11 24         ora ($24),y
$15:eca9  13 60         ora ($60,s),y
$15:ecab  14 5f         trb $5f
$15:ecad  15 23         ora $23,x
$15:ecaf  16 00         asl $00,x
$15:ecb1  00 22         brk #$22
$15:ecb3  17 a5         ora [$a5],y
$15:ecb5  18            clc
$15:ecb6  63 19         adc $19,s
$15:ecb8  49 1b 67      eor #$671b
$15:ecbb  1c 2e 1f      trb $1f2e
$15:ecbe  9a            txs
$15:ecbf  20 ba 21      jsr $21ba
$15:ecc2  fa            plx
$15:ecc3  04 ea         tsb $ea
$15:ecc5  00 e0         brk #$e0
$15:ecc7  00 e7         brk #$e7
$15:ecc9  0d ed aa      ora $aaed
$15:eccc  e5 fa         sbc $fa
$15:ecce  e1 0a         sbc ($0a,x)
$15:ecd0  f5 80         sbc $80,x
$15:ecd2  7f 7f f7 03   adc $03f77f,x
$15:ecd6  aa            tax
$15:ecd7  00 e3         brk #$e3
$15:ecd9  18            clc
$15:ecda  46 40         lsr $40
$15:ecdc  18            clc
$15:ecdd  5d a8 08      eor $08a8,x
$15:ece0  5e a8 08      lsr $08a8,x
$15:ece3  5d a9 ab      eor $aba9,x
$15:ece6  30 5c         bmi $ed44
$15:ece8  ad 18 5d      lda $5d18
$15:eceb  a6 08         ldx $08
$15:eced  5e a6 08      lsr $08a6,x
$15:ecf0  5d a8 a9      eor $a9a8,x
$15:ecf3  30 5c         bmi $ed51
$15:ecf5  ab            plb
$15:ecf6  18            clc
$15:ecf7  5d a4 08      eor $08a4,x
$15:ecfa  5e a4 08      lsr $08a4,x
$15:ecfd  5d a6 a8      eor $a8a6,x
$15:ed00  18            clc
$15:ed01  a9 08 5e      lda #$5e08
$15:ed04  a9 08 5d      lda #$5d08
$15:ed07  ab            plb
$15:ed08  08            php
$15:ed09  5c ad 54 4a   jml $4a54ad
$15:ed0d  af 0c c9 18   lda $18c90c
$15:ed11  5d a8 08      eor $08a8,x
$15:ed14  5e a8 08      lsr $08a8,x
$15:ed17  5d a9 ab      eor $aba9,x
$15:ed1a  30 5c         bmi $ed78
$15:ed1c  ad 18 5d      lda $5d18
$15:ed1f  a6 08         ldx $08
$15:ed21  5e a6 08      lsr $08a6,x
$15:ed24  5d a8 a9      eor $a9a8,x
$15:ed27  30 5c         bmi $ed85
$15:ed29  ab            plb
$15:ed2a  18            clc
$15:ed2b  5d a4 08      eor $08a4,x
$15:ed2e  5e a4 08      lsr $08a4,x
$15:ed31  5d a6 a8      eor $a8a6,x
$15:ed34  18            clc
$15:ed35  aa            tax
$15:ed36  08            php
$15:ed37  5e aa 08      lsr $08aa,x
$15:ed3a  5d ab 08      eor $08ab,x
$15:ed3d  5c ad 18 5d   jml $5d18ad
$15:ed41  af 08 5e af   lda $af5e08
$15:ed45  08            php
$15:ed46  5d ad af      eor $afad,x
$15:ed49  30 4a         bmi $ed95
$15:ed4b  b0 08         bcs $ed55
$15:ed4d  5e ab 08      lsr $08ab,x
$15:ed50  5d a6 a6      eor $a6a6,x
$15:ed53  08            php
$15:ed54  5e a6 08      lsr $08a6,x
$15:ed57  5d a4 a6      eor $a6a4,x
$15:ed5a  30 5c         bmi $edb8
$15:ed5c  a8            tay
$15:ed5d  08            php
$15:ed5e  5e ab 08      lsr $08ab,x
$15:ed61  5d a6 a6      eor $a6a6,x
$15:ed64  08            php
$15:ed65  5e a6 08      lsr $08a6,x
$15:ed68  5d a4 a6      eor $a6a4,x
$15:ed6b  18            clc
$15:ed6c  a9 18 5c      lda #$5c18
$15:ed6f  a8            tay
$15:ed70  08            php
$15:ed71  5e ab 08      lsr $08ab,x
$15:ed74  5d a6 a6      eor $a6a6,x
$15:ed77  08            php
$15:ed78  5e a6 08      lsr $08a6,x
$15:ed7b  5d a4 a6      eor $a6a4,x
$15:ed7e  08            php
$15:ed7f  5e a9 08      lsr $08a9,x
$15:ed82  5d a8 a9      eor $a9a8,x
$15:ed85  08            php
$15:ed86  5e ab 08      lsr $08ab,x
$15:ed89  5d a8 08      eor $08a8,x
$15:ed8c  5c ab 08 5e   jml $5e08ab
$15:ed90  ae 08 5d      ldx $5d08
$15:ed93  ad ae 08      lda $08ae
$15:ed96  5e b0 08      lsr $08b0,x
$15:ed99  5d ae 08      eor $08ae,x
$15:ed9c  5c b0 30 5b   jml $5b30b0
$15:eda0  b2 ed         lda ($ed)
$15:eda2  78            sei
$15:eda3  e1 09         sbc ($09,x)
$15:eda5  30 5d         bmi $ee04
$15:eda7  ab            plb
$15:eda8  08            php
$15:eda9  5e a9 08      lsr $08a9,x
$15:edac  5d ad b0      eor $b0ad,x
$15:edaf  10 b5         bpl $ed66
$15:edb1  08            php
$15:edb2  5b            tcd
$15:edb3  b4 18         ldy $18,x
$15:edb5  b7 18         lda [$18],y
$15:edb7  5d ab 08      eor $08ab,x
$15:edba  5e b0 08      lsr $08b0,x
$15:edbd  5d ab b0      eor $b0ab,x
$15:edc0  10 b4         bpl $ed76
$15:edc2  08            php
$15:edc3  5b            tcd
$15:edc4  b2 18         lda ($18)
$15:edc6  5d b4 ad      eor $adb4,x
$15:edc9  28            plp
$15:edca  5c b2 08 5b   jml $5b08b2
$15:edce  b0 20         bcs $edf0
$15:edd0  5d af 08      eor $08af,x
$15:edd3  ad ab 36      lda $36ab
$15:edd6  5a            phy
$15:edd7  ab            plb
$15:edd8  00 00         brk #$00
$15:edda  ea            nop
$15:eddb  00 e0         brk #$e0
$15:eddd  02 ed         cop #$ed
$15:eddf  69 e1 0b      adc #$0be1
$15:ede2  60            rts
$15:ede3  c9 c9 c9      cmp #$c9c9
$15:ede6  c9 c9 c9      cmp #$c9c9
$15:ede9  c9 c9 08      cmp #$08c9
$15:edec  c9 08 5d      cmp #$5d08
$15:edef  a3 08         lda $08,s
$15:edf1  5b            tcd
$15:edf2  ab            plb
$15:edf3  c9 08 5d      cmp #$5d08
$15:edf6  a3 08         lda $08,s
$15:edf8  5b            tcd
$15:edf9  ab            plb
$15:edfa  c9 08 5d      cmp #$5d08
$15:edfd  a4 08         ldy $08
$15:edff  5b            tcd
$15:ee00  ab            plb
$15:ee01  c9 08 5d      cmp #$5d08
$15:ee04  a4 08         ldy $08
$15:ee06  5b            tcd
$15:ee07  ab            plb
$15:ee08  c9 08 5d      cmp #$5d08
$15:ee0b  a3 08         lda $08,s
$15:ee0d  5b            tcd
$15:ee0e  ab            plb
$15:ee0f  c9 08 5d      cmp #$5d08
$15:ee12  a3 08         lda $08,s
$15:ee14  5b            tcd
$15:ee15  ab            plb
$15:ee16  c9 08 5d      cmp #$5d08
$15:ee19  a4 08         ldy $08
$15:ee1b  5b            tcd
$15:ee1c  a9 c9 08      lda #$08c9
$15:ee1f  5d a4 08      eor $08a4,x
$15:ee22  5b            tcd
$15:ee23  a8            tay
$15:ee24  c9 08 5d      cmp #$5d08
$15:ee27  a3 08         lda $08,s
$15:ee29  5b            tcd
$15:ee2a  ab            plb
$15:ee2b  c9 08 5d      cmp #$5d08
$15:ee2e  a3 08         lda $08,s
$15:ee30  5b            tcd
$15:ee31  ab            plb
$15:ee32  c9 08 5d      cmp #$5d08
$15:ee35  a1 08         lda ($08,x)
$15:ee37  5b            tcd
$15:ee38  a9 c9 08      lda #$08c9
$15:ee3b  5d a4 08      eor $08a4,x
$15:ee3e  5b            tcd
$15:ee3f  ab            plb
$15:ee40  c9 08 5d      cmp #$5d08
$15:ee43  a2 08 5b      ldx #$5b08
$15:ee46  a9 c9 08      lda #$08c9
$15:ee49  5d a4 08      eor $08a4,x
$15:ee4c  5b            tcd
$15:ee4d  a7 c9         lda [$c9]
$15:ee4f  08            php
$15:ee50  5d a3 08      eor $08a3,x
$15:ee53  5b            tcd
$15:ee54  a6 c9         ldx $c9
$15:ee56  08            php
$15:ee57  5d a3 08      eor $08a3,x
$15:ee5a  5b            tcd
$15:ee5b  ab            plb
$15:ee5c  ed 5d 18      sbc $185d
$15:ee5f  5d a4 08      eor $08a4,x
$15:ee62  5e a4 08      lsr $08a4,x
$15:ee65  5d a6 a8      eor $a8a6,x
$15:ee68  30 a9         bmi $ee13
$15:ee6a  18            clc
$15:ee6b  a3 08         lda $08,s
$15:ee6d  5e a3 08      lsr $08a3,x
$15:ee70  5d a4 a6      eor $a6a4,x
$15:ee73  30 a8         bmi $ee1d
$15:ee75  18            clc
$15:ee76  a1 08         lda ($08,x)
$15:ee78  5e a1 08      lsr $08a1,x
$15:ee7b  5d a3 a4      eor $a4a3,x
$15:ee7e  18            clc
$15:ee7f  a6 08         ldx $08
$15:ee81  5e a6 08      lsr $08a6,x
$15:ee84  5d a8 aa      eor $aaa8,x
$15:ee87  20 ab 08      jsr $08ab
$15:ee8a  a9 ab 36      lda #$36ab
$15:ee8d  a8            tay
$15:ee8e  00 ea         brk #$ea
$15:ee90  0c e0 01      tsb $01e0
$15:ee93  ed 53 e1      sbc $e153
$15:ee96  0b            phd
$15:ee97  e3 01         sbc $01,s
$15:ee99  22 1e 08 2e   jsl $2e081e
$15:ee9d  a4 08         ldy $08
$15:ee9f  2d ab a8      and $a8ab
$15:eea2  08            php
$15:eea3  2c b0 08      bit $08b0
$15:eea6  2d ab a8      and $a8ab
$15:eea9  08            php
$15:eeaa  2e 9d 08      rol $089d
$15:eead  2d a4 a1      and $a1a4
$15:eeb0  08            php
$15:eeb1  2e a9 08      rol $08a9
$15:eeb4  2d a4 a1      and $a1a4
$15:eeb7  08            php
$15:eeb8  2e 9f 08      rol $089f
$15:eebb  2d a6 a3      and $a3a6
$15:eebe  08            php
$15:eebf  2e ab 08      rol $08ab
$15:eec2  2d a6 a3      and $a3a6
$15:eec5  08            php
$15:eec6  2e a4 08      rol $08a4
$15:eec9  2d ab a8      and $a8ab
$15:eecc  08            php
$15:eecd  2c b0 08      bit $08b0
$15:eed0  2d ab a8      and $a8ab
$15:eed3  08            php
$15:eed4  2e a1 08      rol $08a1
$15:eed7  2d a8 a4      and $a4a8
$15:eeda  08            php
$15:eedb  2e ad 08      rol $08ad
$15:eede  2d a8 a4      and $a4a8
$15:eee1  08            php
$15:eee2  2e a6 08      rol $08a6
$15:eee5  2d ad a9      and $a9ad
$15:eee8  08            php
$15:eee9  2c b2 08      bit $08b2
$15:eeec  2d ad a9      and $a9ad
$15:eeef  08            php
$15:eef0  2e 9f 08      rol $089f
$15:eef3  2d a6 a3      and $a3a6
$15:eef6  08            php
$15:eef7  2e ab 08      rol $08ab
$15:eefa  2d a6 a3      and $a3a6
$15:eefd  08            php
$15:eefe  2e 9f 08      rol $089f
$15:ef01  2d a3 a6      and $a6a3
$15:ef04  08            php
$15:ef05  2e a9 08      rol $08a9
$15:ef08  2d ab 08      and $08ab
$15:ef0b  2b            pld
$15:ef0c  af 08 2e a4   lda $a42e08
$15:ef10  08            php
$15:ef11  2d ab a8      and $a8ab
$15:ef14  08            php
$15:ef15  2c b0 08      bit $08b0
$15:ef18  2d ab a8      and $a8ab
$15:ef1b  08            php
$15:ef1c  2e 9d 08      rol $089d
$15:ef1f  2d a4 a1      and $a1a4
$15:ef22  08            php
$15:ef23  2e a9 08      rol $08a9
$15:ef26  2d a4 a1      and $a1a4
$15:ef29  08            php
$15:ef2a  2e 9f 08      rol $089f
$15:ef2d  2d a6 a3      and $a3a6
$15:ef30  08            php
$15:ef31  2e ab 08      rol $08ab
$15:ef34  2d a6 a3      and $a3a6
$15:ef37  08            php
$15:ef38  2e a4 08      rol $08a4
$15:ef3b  2d ab a8      and $a8ab
$15:ef3e  08            php
$15:ef3f  2c b0 08      bit $08b0
$15:ef42  2d ab a8      and $a8ab
$15:ef45  08            php
$15:ef46  2e a1 08      rol $08a1
$15:ef49  2d a8 a4      and $a4a8
$15:ef4c  08            php
$15:ef4d  2e ad 08      rol $08ad
$15:ef50  2d a8 a4      and $a4a8
$15:ef53  08            php
$15:ef54  2e 9a 08      rol $089a
$15:ef57  2d a1 a6      and $a6a1
$15:ef5a  08            php
$15:ef5b  2e aa 08      rol $08aa
$15:ef5e  2d ad 08      and $08ad
$15:ef61  2b            pld
$15:ef62  b2 08         lda ($08)
$15:ef64  2e 9f 08      rol $089f
$15:ef67  2d a6 a3      and $a3a6
$15:ef6a  08            php
$15:ef6b  2e ab 08      rol $08ab
$15:ef6e  2d a6 a3      and $a3a6
$15:ef71  08            php
$15:ef72  2e a4 08      rol $08a4
$15:ef75  2d ab a8      and $a8ab
$15:ef78  08            php
$15:ef79  2c b0 08      bit $08b0
$15:ef7c  2d ab 08      and $08ab
$15:ef7f  2b            pld
$15:ef80  a8            tay
$15:ef81  ea            nop
$15:ef82  00 e1         brk #$e1
$15:ef84  0a            asl a
$15:ef85  ed 68 18      sbc $1868
$15:ef88  5d 9f 9f      eor $9f9f,x
$15:ef8b  18            clc
$15:ef8c  5c a4 18 5d   jml $5d18a4
$15:ef90  98            tya
$15:ef91  9f 9f 18 5c   sta $5c189f,x
$15:ef95  a4 18         ldy $18
$15:ef97  5d 98 9f      eor $9f98,x
$15:ef9a  9f 9d 9c 9a   sta $9a9c9d,x
$15:ef9e  a0 9f 93      ldy #$939f
$15:efa1  98            tya
$15:efa2  98            tya
$15:efa3  9d 9d 93      sta $939d,x
$15:efa6  9f 98 08 98   sta $980898,x
$15:efaa  c9 97 18      cmp #$1897
$15:efad  95 9c         sta $9c,x
$15:efaf  9a            txs
$15:efb0  9e 9f 93      stz $939f,x
$15:efb3  10 98         bpl $ef4d
$15:efb5  08            php
$15:efb6  93 1e         sta ($1e,s),y
$15:efb8  98            tya
$15:efb9  00 ea         brk #$ea
$15:efbb  0c e0 01      tsb $01e0
$15:efbe  ed 40 e1      sbc $e140
$15:efc1  09 e3 01      ora #$01e3
$15:efc4  18            clc
$15:efc5  14 03         trb $03
$15:efc7  c9 08 2e      cmp #$2e08
$15:efca  a4 08         ldy $08
$15:efcc  2d ab a8      and $a8ab
$15:efcf  08            php
$15:efd0  2c b0 08      bit $08b0
$15:efd3  2d ab a8      and $a8ab
$15:efd6  08            php
$15:efd7  2e 9d 08      rol $089d
$15:efda  2d a4 a1      and $a1a4
$15:efdd  08            php
$15:efde  2e a9 08      rol $08a9
$15:efe1  2d a4 a1      and $a1a4
$15:efe4  08            php
$15:efe5  2e 9f 08      rol $089f
$15:efe8  2d a6 a3      and $a3a6
$15:efeb  08            php
$15:efec  2e ab 08      rol $08ab
$15:efef  2d a6 a3      and $a3a6
$15:eff2  08            php
$15:eff3  2e a4 08      rol $08a4
$15:eff6  2d ab a8      and $a8ab
$15:eff9  08            php
$15:effa  2c b0 08      bit $08b0
$15:effd  2d ab a8      and $a8ab
$15:f000  08            php
$15:f001  2e a1 08      rol $08a1
$15:f004  2d a8 a4      and $a4a8
$15:f007  08            php
$15:f008  2e ad 08      rol $08ad
$15:f00b  2d a8 a4      and $a4a8
$15:f00e  08            php
$15:f00f  2e a6 08      rol $08a6
$15:f012  2d ad a9      and $a9ad
$15:f015  08            php
$15:f016  2c b2 08      bit $08b2
$15:f019  2d ad a9      and $a9ad
$15:f01c  08            php
$15:f01d  2e 9f 08      rol $089f
$15:f020  2d a6 a3      and $a3a6
$15:f023  08            php
$15:f024  2e ab 08      rol $08ab
$15:f027  2d a6 a3      and $a3a6
$15:f02a  08            php
$15:f02b  2e 9f 08      rol $089f
$15:f02e  2d a3 a6      and $a6a3
$15:f031  08            php
$15:f032  2e a9 08      rol $08a9
$15:f035  2d ab 08      and $08ab
$15:f038  2b            pld
$15:f039  af 08 2e a4   lda $a42e08
$15:f03d  08            php
$15:f03e  2d ab a8      and $a8ab
$15:f041  08            php
$15:f042  2c b0 08      bit $08b0
$15:f045  2d ab a8      and $a8ab
$15:f048  08            php
$15:f049  2e 9d 08      rol $089d
$15:f04c  2d a4 a1      and $a1a4
$15:f04f  08            php
$15:f050  2e a9 08      rol $08a9
$15:f053  2d a4 a1      and $a1a4
$15:f056  08            php
$15:f057  2e 9f 08      rol $089f
$15:f05a  2d a6 a3      and $a3a6
$15:f05d  08            php
$15:f05e  2e ab 08      rol $08ab
$15:f061  2d a6 a3      and $a3a6
$15:f064  08            php
$15:f065  2e a4 08      rol $08a4
$15:f068  2d ab a8      and $a8ab
$15:f06b  08            php
$15:f06c  2c b0 08      bit $08b0
$15:f06f  2d ab a8      and $a8ab
$15:f072  08            php
$15:f073  2e a1 08      rol $08a1
$15:f076  2d a8 a4      and $a4a8
$15:f079  08            php
$15:f07a  2e ad 08      rol $08ad
$15:f07d  2d a8 a4      and $a4a8
$15:f080  08            php
$15:f081  2e 9a 08      rol $089a
$15:f084  2d a1 a6      and $a6a1
$15:f087  08            php
$15:f088  2e aa 08      rol $08aa
$15:f08b  2d ad 08      and $08ad
$15:f08e  2b            pld
$15:f08f  b2 08         lda ($08)
$15:f091  2e 9f 08      rol $089f
$15:f094  2d a6 a3      and $a3a6
$15:f097  08            php
$15:f098  2e ab 08      rol $08ab
$15:f09b  2d a6 a3      and $a3a6
$15:f09e  08            php
$15:f09f  2e a4 08      rol $08a4
$15:f0a2  2d ab a8      and $a8ab
$15:f0a5  08            php
$15:f0a6  2c b0 08      bit $08b0
$15:f0a9  2d ab 08      and $08ab
$15:f0ac  2b            pld
$15:f0ad  a8            tay
$15:f0ae  63 c9         adc $c9,s
$15:f0b0  60            rts
$15:f0b1  c9 c9 c9      cmp #$c9c9
$15:f0b4  ea            nop
$15:f0b5  00 e1         brk #$e1
$15:f0b7  09 e3 18      ora #$18e3
$15:f0ba  46 40         lsr $40
$15:f0bc  ed 5a e0      sbc $e05a
$15:f0bf  03 18         ora $18,s
$15:f0c1  5d a8 08      eor $08a8,x
$15:f0c4  5e a8 08      lsr $08a8,x
$15:f0c7  5d a9 ab      eor $aba9,x
$15:f0ca  30 ad         bmi $f079
$15:f0cc  18            clc
$15:f0cd  a6 08         ldx $08
$15:f0cf  5e a6 08      lsr $08a6,x
$15:f0d2  5d a8 a9      eor $a9a8,x
$15:f0d5  30 ab         bmi $f082
$15:f0d7  18            clc
$15:f0d8  a4 08         ldy $08
$15:f0da  5e a4 08      lsr $08a4,x
$15:f0dd  5d a6 a8      eor $a8a6,x
$15:f0e0  18            clc
$15:f0e1  aa            tax
$15:f0e2  08            php
$15:f0e3  5e aa 08      lsr $08aa,x
$15:f0e6  5d ab ad      eor $adab,x
$15:f0e9  18            clc
$15:f0ea  af 08 5e af   lda $af5e08
$15:f0ee  08            php
$15:f0ef  5d ad af      eor $afad,x
$15:f0f2  30 59         bmi $f14d
$15:f0f4  b0 00         bcs $f0f6
$15:f0f6  ea            nop
$15:f0f7  00 e0         brk #$e0
$15:f0f9  00 ed         brk #$ed
$15:f0fb  5a            phy
$15:f0fc  e1 09         sbc ($09,x)
$15:f0fe  06 c9         asl $c9
$15:f100  18            clc
$15:f101  5d a8 08      eor $08a8,x
$15:f104  5e a8 08      lsr $08a8,x
$15:f107  5d a9 ab      eor $aba9,x
$15:f10a  30 5c         bmi $f168
$15:f10c  ad 18 5d      lda $5d18
$15:f10f  a6 08         ldx $08
$15:f111  5e a6 08      lsr $08a6,x
$15:f114  5d a8 a9      eor $a9a8,x
$15:f117  30 5c         bmi $f175
$15:f119  ab            plb
$15:f11a  18            clc
$15:f11b  5d a4 08      eor $08a4,x
$15:f11e  5e a4 08      lsr $08a4,x
$15:f121  5d a6 a8      eor $a8a6,x
$15:f124  18            clc
$15:f125  a9 08 5e      lda #$5e08
$15:f128  a9 08 5d      lda #$5d08
$15:f12b  ab            plb
$15:f12c  08            php
$15:f12d  5c ad 54 4a   jml $4a54ad
$15:f131  af 0c c9 18   lda $18c90c
$15:f135  5d a8 08      eor $08a8,x
$15:f138  5e a8 08      lsr $08a8,x
$15:f13b  5d a9 ab      eor $aba9,x
$15:f13e  30 5c         bmi $f19c
$15:f140  ad 18 5d      lda $5d18
$15:f143  a6 08         ldx $08
$15:f145  5e a6 08      lsr $08a6,x
$15:f148  5d a8 a9      eor $a9a8,x
$15:f14b  30 5c         bmi $f1a9
$15:f14d  ab            plb
$15:f14e  18            clc
$15:f14f  5d a4 08      eor $08a4,x
$15:f152  5e a4 08      lsr $08a4,x
$15:f155  5d a6 a8      eor $a8a6,x
$15:f158  18            clc
$15:f159  aa            tax
$15:f15a  08            php
$15:f15b  5e aa 08      lsr $08aa,x
$15:f15e  5d ab 08      eor $08ab,x
$15:f161  5c ad 18 5d   jml $5d18ad
$15:f165  af 08 5e af   lda $af5e08
$15:f169  08            php
$15:f16a  5d ad af      eor $afad,x
$15:f16d  30 4a         bmi $f1b9
$15:f16f  b0 08         bcs $f179
$15:f171  5e ab 08      lsr $08ab,x
$15:f174  5d a6 a6      eor $a6a6,x
$15:f177  08            php
$15:f178  5e a6 08      lsr $08a6,x
$15:f17b  5d a4 a6      eor $a6a4,x
$15:f17e  30 5c         bmi $f1dc
$15:f180  a8            tay
$15:f181  08            php
$15:f182  5e ab 08      lsr $08ab,x
$15:f185  5d a6 a6      eor $a6a6,x
$15:f188  08            php
$15:f189  5e a6 08      lsr $08a6,x
$15:f18c  5d a4 a6      eor $a6a4,x
$15:f18f  18            clc
$15:f190  a9 18 5c      lda #$5c18
$15:f193  a8            tay
$15:f194  08            php
$15:f195  5e ab 08      lsr $08ab,x
$15:f198  5d a6 a6      eor $a6a6,x
$15:f19b  08            php
$15:f19c  5e a6 08      lsr $08a6,x
$15:f19f  5d a4 a6      eor $a6a4,x
$15:f1a2  08            php
$15:f1a3  5e a9 08      lsr $08a9,x
$15:f1a6  5d a8 a9      eor $a9a8,x
$15:f1a9  08            php
$15:f1aa  5e ab 08      lsr $08ab,x
$15:f1ad  5d a8 08      eor $08a8,x
$15:f1b0  5c ab 08 5e   jml $5e08ab
$15:f1b4  ae 08 5d      ldx $5d08
$15:f1b7  ad ae 08      lda $08ae
$15:f1ba  5e b0 08      lsr $08b0,x
$15:f1bd  5d ae b0      eor $b0ae,x
$15:f1c0  30 5e         bmi $f220
$15:f1c2  b2 ed         lda ($ed)
$15:f1c4  46 e1         lsr $e1
$15:f1c6  08            php
$15:f1c7  30 5d         bmi $f226
$15:f1c9  ab            plb
$15:f1ca  08            php
$15:f1cb  5e a9 08      lsr $08a9,x
$15:f1ce  5d ad b0      eor $b0ad,x
$15:f1d1  10 b5         bpl $f188
$15:f1d3  08            php
$15:f1d4  b4 18         ldy $18,x
$15:f1d6  b7 ab         lda [$ab],y
$15:f1d8  08            php
$15:f1d9  5e b0 08      lsr $08b0,x
$15:f1dc  5d ab b0      eor $b0ab,x
$15:f1df  10 b4         bpl $f195
$15:f1e1  08            php
$15:f1e2  b2 18         lda ($18)
$15:f1e4  b4 ad         ldy $ad,x
$15:f1e6  28            plp
$15:f1e7  5e b2 08      lsr $08b2,x
$15:f1ea  5d b0 20      eor $20b0,x
$15:f1ed  af 08 ad ab   lda $abad08
$15:f1f1  30 59         bmi $f24c
$15:f1f3  ab            plb
$15:f1f4  00 ea         brk #$ea
$15:f1f6  00 e0         brk #$e0
$15:f1f8  02 ed         cop #$ed
$15:f1fa  3c e1 0b      bit $0be1,x
$15:f1fd  e4 63         cpx $63
$15:f1ff  c9 60 c9      cmp #$c960
$15:f202  c9 c9 c9      cmp #$c9c9
$15:f205  c9 c9 c9      cmp #$c9c9
$15:f208  08            php
$15:f209  c9 08 5d      cmp #$5d08
$15:f20c  a3 08         lda $08,s
$15:f20e  5b            tcd
$15:f20f  ab            plb
$15:f210  c9 08 5d      cmp #$5d08
$15:f213  a3 08         lda $08,s
$15:f215  5b            tcd
$15:f216  ab            plb
$15:f217  c9 08 5d      cmp #$5d08
$15:f21a  a4 08         ldy $08
$15:f21c  5b            tcd
$15:f21d  ab            plb
$15:f21e  c9 08 5d      cmp #$5d08
$15:f221  a4 08         ldy $08
$15:f223  5b            tcd
$15:f224  ab            plb
$15:f225  c9 08 5d      cmp #$5d08
$15:f228  a3 08         lda $08,s
$15:f22a  5b            tcd
$15:f22b  ab            plb
$15:f22c  c9 08 5d      cmp #$5d08
$15:f22f  a3 08         lda $08,s
$15:f231  5b            tcd
$15:f232  ab            plb
$15:f233  c9 08 5d      cmp #$5d08
$15:f236  a4 08         ldy $08
$15:f238  5b            tcd
$15:f239  a9 c9 08      lda #$08c9
$15:f23c  5d a4 08      eor $08a4,x
$15:f23f  5b            tcd
$15:f240  a8            tay
$15:f241  c9 08 5d      cmp #$5d08
$15:f244  a3 08         lda $08,s
$15:f246  5b            tcd
$15:f247  ab            plb
$15:f248  c9 08 5d      cmp #$5d08
$15:f24b  a3 08         lda $08,s
$15:f24d  5b            tcd
$15:f24e  ab            plb
$15:f24f  c9 08 5d      cmp #$5d08
$15:f252  a1 08         lda ($08,x)
$15:f254  5b            tcd
$15:f255  a9 c9 08      lda #$08c9
$15:f258  5d a4 08      eor $08a4,x
$15:f25b  5b            tcd
$15:f25c  ab            plb
$15:f25d  c9 08 5d      cmp #$5d08
$15:f260  a2 08 5b      ldx #$5b08
$15:f263  a9 c9 08      lda #$08c9
$15:f266  5d a4 08      eor $08a4,x
$15:f269  5b            tcd
$15:f26a  a7 c9         lda [$c9]
$15:f26c  08            php
$15:f26d  5d a3 08      eor $08a3,x
$15:f270  5b            tcd
$15:f271  a6 c9         ldx $c9
$15:f273  08            php
$15:f274  5d a3 05      eor $05a3,x
$15:f277  5b            tcd
$15:f278  ab            plb
$15:f279  e1 0a         sbc ($0a,x)
$15:f27b  e3 18         sbc $18,s
$15:f27d  46 40         lsr $40
$15:f27f  ed aa e0      sbc $e0aa
$15:f282  03 18         ora $18,s
$15:f284  5d a8 08      eor $08a8,x
$15:f287  5e a8 08      lsr $08a8,x
$15:f28a  5d a9 ab      eor $aba9,x
$15:f28d  30 ad         bmi $f23c
$15:f28f  18            clc
$15:f290  a6 08         ldx $08
$15:f292  5e a6 08      lsr $08a6,x
$15:f295  5d a8 a9      eor $a9a8,x
$15:f298  30 ab         bmi $f245
$15:f29a  18            clc
$15:f29b  a4 08         ldy $08
$15:f29d  5e a4 08      lsr $08a4,x
$15:f2a0  5d a6 a8      eor $a8a6,x
$15:f2a3  18            clc
$15:f2a4  aa            tax
$15:f2a5  08            php
$15:f2a6  5e aa 08      lsr $08aa,x
$15:f2a9  5d ab ad      eor $adab,x
$15:f2ac  18            clc
$15:f2ad  af 08 5e af   lda $af5e08
$15:f2b1  08            php
$15:f2b2  5d ad af      eor $afad,x
$15:f2b5  36 5b         rol $5b,x
$15:f2b7  b0 00         bcs $f2b9
$15:f2b9  ea            nop
$15:f2ba  00 e0         brk #$e0
$15:f2bc  00 ed         brk #$ed
$15:f2be  32 e1         and ($e1)
$15:f2c0  08            php
$15:f2c1  06 c9         asl $c9
$15:f2c3  18            clc
$15:f2c4  5d a8 08      eor $08a8,x
$15:f2c7  5e a8 08      lsr $08a8,x
$15:f2ca  5d a9 ab      eor $aba9,x
$15:f2cd  30 ad         bmi $f27c
$15:f2cf  18            clc
$15:f2d0  a6 08         ldx $08
$15:f2d2  5e a6 08      lsr $08a6,x
$15:f2d5  5d a8 a9      eor $a9a8,x
$15:f2d8  30 ab         bmi $f285
$15:f2da  18            clc
$15:f2db  a4 08         ldy $08
$15:f2dd  5e a4 08      lsr $08a4,x
$15:f2e0  5d a6 a8      eor $a8a6,x
$15:f2e3  18            clc
$15:f2e4  a9 08 5e      lda #$5e08
$15:f2e7  a9 08 5d      lda #$5d08
$15:f2ea  ab            plb
$15:f2eb  08            php
$15:f2ec  59 ad 54      eor $54ad,y
$15:f2ef  49 af 0c      eor #$0caf
$15:f2f2  c9 18 5d      cmp #$5d18
$15:f2f5  a8            tay
$15:f2f6  08            php
$15:f2f7  5e a8 08      lsr $08a8,x
$15:f2fa  5d a9 ab      eor $aba9,x
$15:f2fd  30 ad         bmi $f2ac
$15:f2ff  18            clc
$15:f300  a6 08         ldx $08
$15:f302  5e a6 08      lsr $08a6,x
$15:f305  5d a8 a9      eor $a9a8,x
$15:f308  30 ab         bmi $f2b5
$15:f30a  18            clc
$15:f30b  a4 08         ldy $08
$15:f30d  5e a4 08      lsr $08a4,x
$15:f310  5d a6 a8      eor $a8a6,x
$15:f313  18            clc
$15:f314  aa            tax
$15:f315  08            php
$15:f316  5e aa 08      lsr $08aa,x
$15:f319  5d ab ad      eor $adab,x
$15:f31c  18            clc
$15:f31d  af 08 5e af   lda $af5e08
$15:f321  08            php
$15:f322  5d ad af      eor $afad,x
$15:f325  30 49         bmi $f370
$15:f327  b0 08         bcs $f331
$15:f329  5e ab 08      lsr $08ab,x
$15:f32c  5d a6 a6      eor $a6a6,x
$15:f32f  08            php
$15:f330  5e a6 08      lsr $08a6,x
$15:f333  5d a4 a6      eor $a6a4,x
$15:f336  30 a8         bmi $f2e0
$15:f338  08            php
$15:f339  5e ab 08      lsr $08ab,x
$15:f33c  5d a6 a6      eor $a6a6,x
$15:f33f  08            php
$15:f340  5e a6 08      lsr $08a6,x
$15:f343  5d a4 a6      eor $a6a4,x
$15:f346  18            clc
$15:f347  a9 a8 08      lda #$08a8
$15:f34a  5e ab 08      lsr $08ab,x
$15:f34d  5d a6 a6      eor $a6a6,x
$15:f350  08            php
$15:f351  5e a6 08      lsr $08a6,x
$15:f354  5d a4 a6      eor $a6a4,x
$15:f357  08            php
$15:f358  5e a9 08      lsr $08a9,x
$15:f35b  5d a8 a9      eor $a9a8,x
$15:f35e  08            php
$15:f35f  5e ab 08      lsr $08ab,x
$15:f362  5d a8 ab      eor $aba8,x
$15:f365  08            php
$15:f366  5e ae 08      lsr $08ae,x
$15:f369  5d ad ae      eor $aead,x
$15:f36c  08            php
$15:f36d  5e b0 08      lsr $08b0,x
$15:f370  5d ae 08      eor $08ae,x
$15:f373  5c b0 30 59   jml $5930b0
$15:f377  b2 e1         lda ($e1)
$15:f379  07 e3         ora [$e3]
$15:f37b  18            clc
$15:f37c  46 40         lsr $40
$15:f37e  ed 32 e0      sbc $e032
$15:f381  03 18         ora $18,s
$15:f383  5d a8 08      eor $08a8,x
$15:f386  5e a8 08      lsr $08a8,x
$15:f389  5d a9 ab      eor $aba9,x
$15:f38c  30 ad         bmi $f33b
$15:f38e  18            clc
$15:f38f  a6 08         ldx $08
$15:f391  5e a6 08      lsr $08a6,x
$15:f394  5d a8 a9      eor $a9a8,x
$15:f397  30 ab         bmi $f344
$15:f399  18            clc
$15:f39a  a4 08         ldy $08
$15:f39c  5e a4 08      lsr $08a4,x
$15:f39f  5d a6 a8      eor $a8a6,x
$15:f3a2  18            clc
$15:f3a3  aa            tax
$15:f3a4  08            php
$15:f3a5  5e aa 08      lsr $08aa,x
$15:f3a8  5d ab ad      eor $adab,x
$15:f3ab  18            clc
$15:f3ac  af 08 5e af   lda $af5e08
$15:f3b0  08            php
$15:f3b1  5d ad af      eor $afad,x
$15:f3b4  30 59         bmi $f40f
$15:f3b6  b0 00         bcs $f3b8
$15:f3b8  ea            nop
$15:f3b9  00 e0         brk #$e0
$15:f3bb  00 e7         brk #$e7
$15:f3bd  1d ed 69      ora $69ed,x
$15:f3c0  e5 f5         sbc $f5
$15:f3c2  e1 0b         sbc ($0b,x)
$15:f3c4  f5 80         sbc $80,x
$15:f3c6  7f 7f f7 03   adc $03f77f,x
$15:f3ca  aa            tax
$15:f3cb  00 e3         brk #$e3
$15:f3cd  18            clc
$15:f3ce  46 40         lsr $40
$15:f3d0  18            clc
$15:f3d1  c9 0c 5d      cmp #$5d0c
$15:f3d4  ab            plb
$15:f3d5  c9 0c 5c      cmp #$5c0c
$15:f3d8  a8            tay
$15:f3d9  0c 5a ab      tsb $ab5a
$15:f3dc  18            clc
$15:f3dd  c9 c9 0c      cmp #$0cc9
$15:f3e0  5d ad c9      eor $c9ad,x
$15:f3e3  0c 5c a9      tsb $a95c
$15:f3e6  0c 5a ad      tsb $ad5a
$15:f3e9  18            clc
$15:f3ea  c9 c9 0c      cmp #$0cc9
$15:f3ed  5d af c9      eor $c9af,x
$15:f3f0  0c 5c ab      tsb $ab5c
$15:f3f3  0c 5a af      tsb $af5a
$15:f3f6  18            clc
$15:f3f7  c9 c9 0c      cmp #$0cc9
$15:f3fa  5d ab c9      eor $c9ab,x
$15:f3fd  0c 5c a8      tsb $a85c
$15:f400  0c 5a ab      tsb $ab5a
$15:f403  18            clc
$15:f404  c9 c9 0c      cmp #$0cc9
$15:f407  5d ad c9      eor $c9ad,x
$15:f40a  0c 5c a8      tsb $a85c
$15:f40d  0c 5a ad      tsb $ad5a
$15:f410  18            clc
$15:f411  c9 c9 0c      cmp #$0cc9
$15:f414  5d ad c9      eor $c9ad,x
$15:f417  0c 5c aa      tsb $aa5c
$15:f41a  0c 5a ad      tsb $ad5a
$15:f41d  18            clc
$15:f41e  c9 c9 0c      cmp #$0cc9
$15:f421  5d af c9      eor $c9af,x
$15:f424  0c 5c ab      tsb $ab5c
$15:f427  0c 5a af      tsb $af5a
$15:f42a  18            clc
$15:f42b  c9 c9 0c      cmp #$0cc9
$15:f42e  5d b0 c9      eor $c9b0,x
$15:f431  0c 5c a8      tsb $a85c
$15:f434  c9 18 c9      cmp #$c918
$15:f437  60            rts
$15:f438  c9 c9 c9      cmp #$c9c9
$15:f43b  c9 c9 c9      cmp #$c9c9
$15:f43e  c9 c9 ed      cmp #$edc9
$15:f441  75 06         adc $06,x
$15:f443  4e a8 06      lsr $06a8
$15:f446  4d a4 a6      eor $a6a4
$15:f449  a8            tay
$15:f44a  06 4e         asl $4e
$15:f44c  a9 06 4d      lda #$4d06
$15:f44f  ab            plb
$15:f450  ad af 06      lda $06af
$15:f453  4e b0 06      lsr $06b0
$15:f456  4d b2 b4      eor $b4b2
$15:f459  b2 06         lda ($06)
$15:f45b  4e b0 06      lsr $06b0
$15:f45e  4d af ad      eor $adaf
$15:f461  ab            plb
$15:f462  06 4e         asl $4e
$15:f464  a9 06 4d      lda #$4d06
$15:f467  a4 a6         ldy $a6
$15:f469  a8            tay
$15:f46a  06 4e         asl $4e
$15:f46c  a9 06 4d      lda #$4d06
$15:f46f  ab            plb
$15:f470  ad af 06      lda $06af
$15:f473  4e b0 06      lsr $06b0
$15:f476  4d b2 b4      eor $b4b2
$15:f479  b5 06         lda $06,x
$15:f47b  4e b4 06      lsr $06b4
$15:f47e  4d b2 b5      eor $b5b2
$15:f481  b2 06         lda ($06)
$15:f483  4e af 06      lsr $06af
$15:f486  4d ad ab      eor $abad
$15:f489  a9 06 4e      lda #$4e06
$15:f48c  a8            tay
$15:f48d  06 4d         asl $4d
$15:f48f  a6 a4         ldx $a4
$15:f491  a3 b2         lda $b2,s
$15:f493  b0 af         bcs $f444
$15:f495  ad 06 4e      lda $4e06
$15:f498  ab            plb
$15:f499  06 4d         asl $4d
$15:f49b  a9 a8 a6      lda #$a6a8
$15:f49e  06 4e         asl $4e
$15:f4a0  a4 06         ldy $06
$15:f4a2  4d a6 a8      eor $a8a6
$15:f4a5  a9 06 4e      lda #$4e06
$15:f4a8  ab            plb
$15:f4a9  06 4d         asl $4d
$15:f4ab  ad af b0      lda $b0af
$15:f4ae  06 4e         asl $4e
$15:f4b0  b2 06         lda ($06)
$15:f4b2  4d b4 b2      eor $b2b4
$15:f4b5  b0 06         bcs $f4bd
$15:f4b7  4e af 06      lsr $06af
$15:f4ba  4d ad ab      eor $abad
$15:f4bd  a9 06 4e      lda #$4e06
$15:f4c0  a8            tay
$15:f4c1  06 4d         asl $4d
$15:f4c3  a1 a3         lda ($a3,x)
$15:f4c5  a4 06         ldy $06
$15:f4c7  4e a6 06      lsr $06a6
$15:f4ca  4d a8 a9      eor $a9a8
$15:f4cd  ab            plb
$15:f4ce  06 4e         asl $4e
$15:f4d0  ad 06 4d      lda $4d06
$15:f4d3  af 06 4b b0   lda $b04b06
$15:f4d7  06 4d         asl $4d
$15:f4d9  b2 b4         lda ($b4)
$15:f4db  06 4b         asl $4b
$15:f4dd  b5 06         lda $06,x
$15:f4df  49 b7 06      eor #$06b7
$15:f4e2  47 b9         eor [$b9]
$15:f4e4  06 4e         asl $4e
$15:f4e6  a6 06         ldx $06
$15:f4e8  4d a1 a3      eor $a3a1
$15:f4eb  a4 06         ldy $06
$15:f4ed  4e a6 06      lsr $06a6
$15:f4f0  4d a8 aa      eor $aaa8
$15:f4f3  ab            plb
$15:f4f4  06 4e         asl $4e
$15:f4f6  ad 06 4d      lda $4d06
$15:f4f9  af b0 b2 06   lda $06b2b0
$15:f4fd  4e b4 06      lsr $06b4
$15:f500  4d b6 b4      eor $b4b6
$15:f503  b2 06         lda ($06)
$15:f505  4e af 06      lsr $06af
$15:f508  4d ad ab      eor $abad
$15:f50b  a9 06 4e      lda #$4e06
$15:f50e  a8            tay
$15:f50f  06 4d         asl $4d
$15:f511  a6 b2         ldx $b2
$15:f513  b0 06         bcs $f51b
$15:f515  4e af 06      lsr $06af
$15:f518  4d ad ab      eor $abad
$15:f51b  a9 06 4e      lda #$4e06
$15:f51e  a8            tay
$15:f51f  06 4d         asl $4d
$15:f521  a6 a4         ldx $a4
$15:f523  a3 06         lda $06,s
$15:f525  4e a4 06      lsr $06a4
$15:f528  4d a6 a8      eor $a8a6
$15:f52b  a9 06 4e      lda #$4e06
$15:f52e  ab            plb
$15:f52f  06 4d         asl $4d
$15:f531  ad af b0      lda $b0af
$15:f534  0c 4e a4      tsb $a44e
$15:f537  24 c9         bit $c9
$15:f539  00 00         brk #$00
$15:f53b  ea            nop
$15:f53c  00 e0         brk #$e0
$15:f53e  02 ed         cop #$ed
$15:f540  7b            tdc
$15:f541  e1 0a         sbc ($0a,x)
$15:f543  e3 18         sbc $18,s
$15:f545  1e 20 30      asl $3020,x
$15:f548  5d a8 10      eor $10a8,x
$15:f54b  5e a8 10      lsr $10a8,x
$15:f54e  5d a9 ab      eor $aba9,x
$15:f551  48            pha
$15:f552  ad 18 c9      lda $c918
$15:f555  30 a6         bmi $f4fd
$15:f557  10 5e         bpl $f5b7
$15:f559  a6 10         ldx $10
$15:f55b  5d a8 a9      eor $a9a8,x
$15:f55e  48            pha
$15:f55f  ab            plb
$15:f560  18            clc
$15:f561  c9 30 a4      cmp #$a430
$15:f564  10 5e         bpl $f5c4
$15:f566  a4 10         ldy $10
$15:f568  5d a6 a8      eor $a8a6,x
$15:f56b  30 aa         bmi $f517
$15:f56d  10 5e         bpl $f5cd
$15:f56f  aa            tax
$15:f570  10 5d         bpl $f5cf
$15:f572  ab            plb
$15:f573  ad 40 af      lda $af40
$15:f576  10 ad         bpl $f525
$15:f578  af 48 5b b0   lda $b05b48
$15:f57c  18            clc
$15:f57d  c9 e1 0a      cmp #$0ae1
$15:f580  ed 70 60      sbc $6070
$15:f583  5d 9f 10      eor $109f,x
$15:f586  5e 9c 10      lsr $109c,x
$15:f589  5d 9f 9c      eor $9c9f,x
$15:f58c  10 5e         bpl $f5ec
$15:f58e  a4 10         ldy $10
$15:f590  5d a8 a4      eor $a4a8,x
$15:f593  60            rts
$15:f594  9f 10 5e 9c   sta $9c5e10,x
$15:f598  10 5d         bpl $f5f7
$15:f59a  9f 9c 10 5e   sta $5e109c,x
$15:f59e  a4 10         ldy $10
$15:f5a0  5d a8 a4      eor $a4a8,x
$15:f5a3  60            rts
$15:f5a4  9f 10 5e a1   sta $a15e10,x
$15:f5a8  10 5d         bpl $f607
$15:f5aa  9c a1 10      stz $10a1
$15:f5ad  5e 9c 10      lsr $109c,x
$15:f5b0  5d 9f a4      eor $a49f,x
$15:f5b3  10 5e         bpl $f613
$15:f5b5  9a            txs
$15:f5b6  10 5d         bpl $f615
$15:f5b8  9d a2 10      sta $10a2,x
$15:f5bb  5e 98 10      lsr $1098,x
$15:f5be  5d 9b a0      eor $a09b,x
$15:f5c1  60            rts
$15:f5c2  9f 30 a4 10   sta $10a430,x
$15:f5c6  5e a4 10      lsr $10a4,x
$15:f5c9  5d a6 a8      eor $a8a6,x
$15:f5cc  48            pha
$15:f5cd  a9 18 c9      lda #$c918
$15:f5d0  30 a3         bmi $f575
$15:f5d2  10 5e         bpl $f632
$15:f5d4  a3 10         lda $10,s
$15:f5d6  5d a4 a6      eor $a6a4,x
$15:f5d9  48            pha
$15:f5da  a8            tay
$15:f5db  18            clc
$15:f5dc  c9 30 a1      cmp #$a130
$15:f5df  10 5e         bpl $f63f
$15:f5e1  a1 10         lda ($10,x)
$15:f5e3  5d a3 a4      eor $a4a3,x
$15:f5e6  30 a6         bmi $f58e
$15:f5e8  10 5e         bpl $f648
$15:f5ea  a6 10         ldx $10
$15:f5ec  5d a8 aa      eor $aaa8,x
$15:f5ef  40            rti
$15:f5f0  ab            plb
$15:f5f1  10 a9         bpl $f59c
$15:f5f3  ab            plb
$15:f5f4  48            pha
$15:f5f5  a8            tay
$15:f5f6  18            clc
$15:f5f7  c9 00 ea      cmp #$ea00
$15:f5fa  f4 e0 01      pea $01e0
$15:f5fd  ed 91 e1      sbc $e191
$15:f600  0a            asl a
$15:f601  e3 18         sbc $18,s
$15:f603  22 1e 0c 5d   jsl $5d0c1e
$15:f607  a4 0c         ldy $0c
$15:f609  5b            tcd
$15:f60a  a4 0c         ldy $0c
$15:f60c  5d a4 0c      eor $0ca4,x
$15:f60f  59 a4 0c      eor $0ca4,y
$15:f612  5d a4 0c      eor $0ca4,x
$15:f615  5b            tcd
$15:f616  a4 0c         ldy $0c
$15:f618  5d a4 0c      eor $0ca4,x
$15:f61b  59 a4 0c      eor $0ca4,y
$15:f61e  5d 9d 0c      eor $0c9d,x
$15:f621  5b            tcd
$15:f622  9d 0c 5d      sta $5d0c,x
$15:f625  9d 0c 59      sta $590c,x
$15:f628  9d 0c 5d      sta $5d0c,x
$15:f62b  9d 0c 5b      sta $5b0c,x
$15:f62e  9d 0c 5d      sta $5d0c,x
$15:f631  9d 0c 59      sta $590c,x
$15:f634  9d 0c 5d      sta $5d0c,x
$15:f637  9f 0c 5b 9f   sta $9f5b0c,x
$15:f63b  0c 5d 9f      tsb $9f5d
$15:f63e  0c 59 9f      tsb $9f59
$15:f641  0c 5d 9f      tsb $9f5d
$15:f644  0c 5b 9f      tsb $9f5b
$15:f647  0c 5d 9f      tsb $9f5d
$15:f64a  0c 59 9f      tsb $9f59
$15:f64d  0c 5d a4      tsb $a45d
$15:f650  0c 5b a4      tsb $a45b
$15:f653  0c 5d a4      tsb $a45d
$15:f656  0c 59 a4      tsb $a459
$15:f659  0c 5d a4      tsb $a45d
$15:f65c  0c 5b a4      tsb $a45b
$15:f65f  0c 5d a3      tsb $a35d
$15:f662  0c 59 a3      tsb $a359
$15:f665  0c 5d a1      tsb $a15d
$15:f668  0c 5b a1      tsb $a15b
$15:f66b  0c 5d a1      tsb $a15d
$15:f66e  0c 59 a1      tsb $a159
$15:f671  0c 5d a1      tsb $a15d
$15:f674  0c 5b a1      tsb $a15b
$15:f677  0c 5d a1      tsb $a15d
$15:f67a  0c 59 a1      tsb $a159
$15:f67d  0c 5d a6      tsb $a65d
$15:f680  0c 5b a6      tsb $a65b
$15:f683  0c 5d a6      tsb $a65d
$15:f686  0c 59 a6      tsb $a659
$15:f689  0c 5d a6      tsb $a65d
$15:f68c  0c 5b a6      tsb $a65b
$15:f68f  0c 5d a6      tsb $a65d
$15:f692  0c 59 a6      tsb $a659
$15:f695  0c 5d 9f      tsb $9f5d
$15:f698  0c 5b 9f      tsb $9f5b
$15:f69b  0c 5d 9f      tsb $9f5d
$15:f69e  0c 59 9f      tsb $9f59
$15:f6a1  0c 5d 9f      tsb $9f5d
$15:f6a4  0c 5b 9f      tsb $9f5b
$15:f6a7  0c 5d 9f      tsb $9f5d
$15:f6aa  0c 59 9f      tsb $9f59
$15:f6ad  0c 5d a4      tsb $a45d
$15:f6b0  0c 5b a4      tsb $a45b
$15:f6b3  0c 5d a4      tsb $a45d
$15:f6b6  0c 59 a4      tsb $a459
$15:f6b9  0c 5d a4      tsb $a45d
$15:f6bc  0c 5b a4      tsb $a45b
$15:f6bf  0c 5d a4      tsb $a45d
$15:f6c2  0c 59 a4      tsb $a459
$15:f6c5  24 5d         bit $5d
$15:f6c7  9f 0c 5b 9f   sta $9f5b0c,x
$15:f6cb  24 5d         bit $5d
$15:f6cd  9f 0c 59 9f   sta $9f590c,x
$15:f6d1  24 5d         bit $5d
$15:f6d3  a4 0c         ldy $0c
$15:f6d5  5b            tcd
$15:f6d6  a4 24         ldy $24
$15:f6d8  5d a4 0c      eor $0ca4,x
$15:f6db  59 a4 24      eor $24a4,y
$15:f6de  5d 9f 0c      eor $0c9f,x
$15:f6e1  5b            tcd
$15:f6e2  9f 24 5d 9f   sta $9f5d24,x
$15:f6e6  0c 59 9f      tsb $9f59
$15:f6e9  24 5d         bit $5d
$15:f6eb  a4 0c         ldy $0c
$15:f6ed  5b            tcd
$15:f6ee  a4 24         ldy $24
$15:f6f0  5d a4 0c      eor $0ca4,x
$15:f6f3  59 a4 24      eor $24a4,y
$15:f6f6  5c ab 0c 5a   jml $5a0cab
$15:f6fa  ab            plb
$15:f6fb  24 5c         bit $5c
$15:f6fd  ab            plb
$15:f6fe  0c 5a ab      tsb $ab5a
$15:f701  24 5c         bit $5c
$15:f703  a9 0c 5a      lda #$5a0c
$15:f706  a9 24 5c      lda #$5c24
$15:f709  a8            tay
$15:f70a  0c 5a a8      tsb $a85a
$15:f70d  24 5c         bit $5c
$15:f70f  a6 0c         ldx $0c
$15:f711  5a            phy
$15:f712  a6 24         ldx $24
$15:f714  5c a0 0c 5a   jml $5a0ca0
$15:f718  a0 24 5c      ldy #$5c24
$15:f71b  9f 0c 5a ab   sta $ab5a0c,x
$15:f71f  24 5c         bit $5c
$15:f721  9f 0c 5a ab   sta $ab5a0c,x
$15:f725  0c 5c a4      tsb $a45c
$15:f728  0c 5a a4      tsb $a45a
$15:f72b  0c 5c a4      tsb $a45c
$15:f72e  0c 58 a4      tsb $a458
$15:f731  0c 5c a4      tsb $a45c
$15:f734  0c 5a a4      tsb $a45a
$15:f737  0c 5c a4      tsb $a45c
$15:f73a  0c 58 a4      tsb $a458
$15:f73d  0c 5d 9d      tsb $9d5d
$15:f740  0c 5b 9d      tsb $9d5b
$15:f743  0c 5d 9d      tsb $9d5d
$15:f746  0c 59 9d      tsb $9d59
$15:f749  0c 5d 9d      tsb $9d5d
$15:f74c  0c 5b 9d      tsb $9d5b
$15:f74f  0c 5d 9d      tsb $9d5d
$15:f752  0c 59 9d      tsb $9d59
$15:f755  0c 5d 9f      tsb $9f5d
$15:f758  0c 5b 9f      tsb $9f5b
$15:f75b  0c 5d 9f      tsb $9f5d
$15:f75e  0c 59 9f      tsb $9f59
$15:f761  0c 5d 9f      tsb $9f5d
$15:f764  0c 5b 9f      tsb $9f5b
$15:f767  0c 5d 9f      tsb $9f5d
$15:f76a  0c 59 9f      tsb $9f59
$15:f76d  0c 5d a4      tsb $a45d
$15:f770  0c 5b a4      tsb $a45b
$15:f773  0c 5d a4      tsb $a45d
$15:f776  0c 59 a4      tsb $a459
$15:f779  0c 5d a4      tsb $a45d
$15:f77c  0c 5b a4      tsb $a45b
$15:f77f  0c 5d a3      tsb $a35d
$15:f782  0c 59 a3      tsb $a359
$15:f785  0c 5d a1      tsb $a15d
$15:f788  0c 5b a1      tsb $a15b
$15:f78b  0c 5d a1      tsb $a15d
$15:f78e  0c 59 a1      tsb $a159
$15:f791  0c 5d a1      tsb $a15d
$15:f794  0c 5b a1      tsb $a15b
$15:f797  0c 5d a1      tsb $a15d
$15:f79a  0c 59 a1      tsb $a159
$15:f79d  0c 5d a6      tsb $a65d
$15:f7a0  0c 5b a6      tsb $a65b
$15:f7a3  0c 5d a6      tsb $a65d
$15:f7a6  0c 59 a6      tsb $a659
$15:f7a9  0c 5d a6      tsb $a65d
$15:f7ac  0c 5b a6      tsb $a65b
$15:f7af  0c 5d a6      tsb $a65d
$15:f7b2  0c 59 a6      tsb $a659
$15:f7b5  0c 5d 9f      tsb $9f5d
$15:f7b8  0c 5b 9f      tsb $9f5b
$15:f7bb  0c 5d 9f      tsb $9f5d
$15:f7be  0c 59 9f      tsb $9f59
$15:f7c1  0c 5d 9f      tsb $9f5d
$15:f7c4  0c 5b 9f      tsb $9f5b
$15:f7c7  0c 5d 9f      tsb $9f5d
$15:f7ca  0c 59 9f      tsb $9f59
$15:f7cd  0c 5d a4      tsb $a45d
$15:f7d0  0c 5b a4      tsb $a45b
$15:f7d3  0c 5d a4      tsb $a45d
$15:f7d6  0c 59 a4      tsb $a459
$15:f7d9  0c 5d a4      tsb $a45d
$15:f7dc  24 c9         bit $c9
$15:f7de  00 ea         brk #$ea
$15:f7e0  00 e0         brk #$e0
$15:f7e2  03 ed         ora $ed,s
$15:f7e4  7d e1 09      adc $09e1,x
$15:f7e7  e3 18         sbc $18,s
$15:f7e9  22 1e 0c c9   jsl $c90c1e
$15:f7ed  0c 3d a4      tsb $a43d
$15:f7f0  0c 3b ab      tsb $ab3b
$15:f7f3  0c 3d a4      tsb $a43d
$15:f7f6  ab            plb
$15:f7f7  a4 c9         ldy $c9
$15:f7f9  0c 3b a4      tsb $a43b
$15:f7fc  c9 0c 3d      cmp #$3d0c
$15:f7ff  a4 0c         ldy $0c
$15:f801  3b            tsc
$15:f802  b0 0c         bcs $f810
$15:f804  3d a4 b0      and $b0a4,x
$15:f807  a4 0c         ldy $0c
$15:f809  3b            tsc
$15:f80a  b0 a4         bcs $f7b0
$15:f80c  c9 0c 3d      cmp #$3d0c
$15:f80f  a3 0c         lda $0c,s
$15:f811  3b            tsc
$15:f812  af 0c 3d a3   lda $a33d0c
$15:f816  af a3 c9 0c   lda $0cc9a3
$15:f81a  3b            tsc
$15:f81b  a3 c9         lda $c9,s
$15:f81d  0c 3d a4      tsb $a43d
$15:f820  0c 3b b0      tsb $b03b
$15:f823  0c 3d a4      tsb $a43d
$15:f826  b0 a4         bcs $f7cc
$15:f828  0c 3b b0      tsb $b03b
$15:f82b  a4 c9         ldy $c9
$15:f82d  0c 3d a4      tsb $a43d
$15:f830  0c 3b ad      tsb $ad3b
$15:f833  0c 3d a4      tsb $a43d
$15:f836  ad a4 c9      lda $c9a4
$15:f839  0c 3b a4      tsb $a43b
$15:f83c  c9 0c 3d      cmp #$3d0c
$15:f83f  a4 0c         ldy $0c
$15:f841  3b            tsc
$15:f842  b0 0c         bcs $f850
$15:f844  3d a4 b0      and $b0a4,x
$15:f847  a4 0c         ldy $0c
$15:f849  3b            tsc
$15:f84a  b0 a4         bcs $f7f0
$15:f84c  c9 0c 3d      cmp #$3d0c
$15:f84f  a3 0c         lda $0c,s
$15:f851  3b            tsc
$15:f852  af 0c 3d a3   lda $a33d0c
$15:f856  af a3 c9 0c   lda $0cc9a3
$15:f85a  3b            tsc
$15:f85b  a3 c9         lda $c9,s
$15:f85d  0c 3d a4      tsb $a43d
$15:f860  0c 3b b0      tsb $b03b
$15:f863  0c 3d a4      tsb $a43d
$15:f866  b0 a4         bcs $f80c
$15:f868  0c 3b b0      tsb $b03b
$15:f86b  a4 ed         ldy $ed
$15:f86d  a5 e1         lda $e1
$15:f86f  0a            asl a
$15:f870  10 5e         bpl $f8d0
$15:f872  ab            plb
$15:f873  10 5d         bpl $f8d2
$15:f875  a6 a6         ldx $a6
$15:f877  10 5e         bpl $f8d7
$15:f879  a6 10         ldx $10
$15:f87b  5d a4 a6      eor $a6a4,x
$15:f87e  60            rts
$15:f87f  5c a8 10 5e   jml $5e10a8
$15:f883  ab            plb
$15:f884  10 5d         bpl $f8e3
$15:f886  a6 a6         ldx $a6
$15:f888  10 5e         bpl $f8e8
$15:f88a  a6 10         ldx $10
$15:f88c  5d a4 a6      eor $a6a4,x
$15:f88f  30 a9         bmi $f83a
$15:f891  30 5c         bmi $f8ef
$15:f893  a8            tay
$15:f894  10 5e         bpl $f8f4
$15:f896  ab            plb
$15:f897  10 5d         bpl $f8f6
$15:f899  a6 a6         ldx $a6
$15:f89b  10 5e         bpl $f8fb
$15:f89d  a6 10         ldx $10
$15:f89f  5d a4 a6      eor $a6a4,x
$15:f8a2  10 5e         bpl $f902
$15:f8a4  a9 10 5d      lda #$5d10
$15:f8a7  a8            tay
$15:f8a8  a9 10 5e      lda #$5e10
$15:f8ab  ab            plb
$15:f8ac  10 5d         bpl $f90b
$15:f8ae  a8            tay
$15:f8af  ab            plb
$15:f8b0  10 5e         bpl $f910
$15:f8b2  ae 10 5d      ldx $5d10
$15:f8b5  ad ae 10      lda $10ae
$15:f8b8  5e b0 10      lsr $10b0,x
$15:f8bb  5d ae b0      eor $b0ae,x
$15:f8be  60            rts
$15:f8bf  5c b2 30 5d   jml $5d30b2
$15:f8c3  a8            tay
$15:f8c4  10 5e         bpl $f924
$15:f8c6  a8            tay
$15:f8c7  10 5d         bpl $f926
$15:f8c9  a9 ab 60      lda #$60ab
$15:f8cc  5c ad 30 5d   jml $5d30ad
$15:f8d0  a6 10         ldx $10
$15:f8d2  5e a6 10      lsr $10a6,x
$15:f8d5  5d a8 a9      eor $a9a8,x
$15:f8d8  60            rts
$15:f8d9  5c ab 30 5d   jml $5d30ab
$15:f8dd  a4 10         ldy $10
$15:f8df  5e a4 10      lsr $10a4,x
$15:f8e2  5d a6 a8      eor $a8a6,x
$15:f8e5  30 aa         bmi $f891
$15:f8e7  10 5e         bpl $f947
$15:f8e9  aa            tax
$15:f8ea  10 5d         bpl $f949
$15:f8ec  ab            plb
$15:f8ed  ad 30 af      lda $af30
$15:f8f0  10 5e         bpl $f950
$15:f8f2  af 10 5d ad   lda $ad5d10
$15:f8f6  af 48 5c b0   lda $b05c48
$15:f8fa  18            clc
$15:f8fb  c9 00 ed      cmp #$ed00
$15:f8fe  60            rts
$15:f8ff  e1 0b         sbc ($0b,x)
$15:f901  0c 5d cc      tsb $cc5d
$15:f904  0c 5b cc      tsb $cc5b
$15:f907  0c 5d cc      tsb $cc5d
$15:f90a  0c 59 cc      tsb $cc59
$15:f90d  0c 5d cc      tsb $cc5d
$15:f910  0c 5b cc      tsb $cc5b
$15:f913  0c 5d cc      tsb $cc5d
$15:f916  0c 59 cc      tsb $cc59
$15:f919  0c 5d cc      tsb $cc5d
$15:f91c  0c 5b cc      tsb $cc5b
$15:f91f  0c 5d cc      tsb $cc5d
$15:f922  0c 59 cc      tsb $cc59
$15:f925  0c 5d cc      tsb $cc5d
$15:f928  0c 5b cc      tsb $cc5b
$15:f92b  0c 5d cc      tsb $cc5d
$15:f92e  ea            nop
$15:f92f  02 cc         cop #$cc
$15:f931  ea            nop
$15:f932  00 cc         brk #$cc
$15:f934  0c 5b cc      tsb $cc5b
$15:f937  0c 5d cc      tsb $cc5d
$15:f93a  0c 59 cc      tsb $cc59
$15:f93d  0c 5d cc      tsb $cc5d
$15:f940  0c 5b cc      tsb $cc5b
$15:f943  0c 5d cc      tsb $cc5d
$15:f946  0c 59 cc      tsb $cc59
$15:f949  0c 5d cc      tsb $cc5d
$15:f94c  0c 5b cc      tsb $cc5b
$15:f94f  0c 5d cc      tsb $cc5d
$15:f952  0c 59 cc      tsb $cc59
$15:f955  0c 5d cc      tsb $cc5d
$15:f958  0c 5b cc      tsb $cc5b
$15:f95b  0c 5d cc      tsb $cc5d
$15:f95e  0c 59 cc      tsb $cc59
$15:f961  0c 5d cc      tsb $cc5d
$15:f964  0c 5b cc      tsb $cc5b
$15:f967  0c 5d cc      tsb $cc5d
$15:f96a  0c 59 cc      tsb $cc59
$15:f96d  0c 5d cc      tsb $cc5d
$15:f970  0c 5b cc      tsb $cc5b
$15:f973  0c 5d cc      tsb $cc5d
$15:f976  0c 59 cc      tsb $cc59
$15:f979  0c 5d cc      tsb $cc5d
$15:f97c  0c 5b cc      tsb $cc5b
$15:f97f  0c 5d cc      tsb $cc5d
$15:f982  0c 59 cc      tsb $cc59
$15:f985  0c 5d cc      tsb $cc5d
$15:f988  0c 5b cc      tsb $cc5b
$15:f98b  0c 5d cc      tsb $cc5d
$15:f98e  ea            nop
$15:f98f  02 cc         cop #$cc
$15:f991  ea            nop
$15:f992  00 cc         brk #$cc
$15:f994  0c 5b cc      tsb $cc5b
$15:f997  0c 5d cc      tsb $cc5d
$15:f99a  0c 59 cc      tsb $cc59
$15:f99d  0c 5d cc      tsb $cc5d
$15:f9a0  0c 5b cc      tsb $cc5b
$15:f9a3  0c 5d cc      tsb $cc5d
$15:f9a6  0c 59 cc      tsb $cc59
$15:f9a9  0c 5d cc      tsb $cc5d
$15:f9ac  0c 5b cc      tsb $cc5b
$15:f9af  0c 5d cc      tsb $cc5d
$15:f9b2  0c 59 cc      tsb $cc59
$15:f9b5  0c 5d cc      tsb $cc5d
$15:f9b8  24 c9         bit $c9
$15:f9ba  06 cc         asl $cc
$15:f9bc  06 5b         asl $5b
$15:f9be  cc ea 02      cpy $02ea
$15:f9c1  0c 5d cc      tsb $cc5d
$15:f9c4  ea            nop
$15:f9c5  00 0c         brk #$0c
$15:f9c7  5b            tcd
$15:f9c8  cc ea 02      cpy $02ea
$15:f9cb  0c 5d cc      tsb $cc5d
$15:f9ce  ea            nop
$15:f9cf  00 0c         brk #$0c
$15:f9d1  59 cc ea      eor $eacc,y
$15:f9d4  02 0c         cop #$0c
$15:f9d6  5d cc ea      eor $eacc,x
$15:f9d9  00 06         brk #$06
$15:f9db  cc 06 5b      cpy $5b06
$15:f9de  cc ea 02      cpy $02ea
$15:f9e1  0c 5d cc      tsb $cc5d
$15:f9e4  ea            nop
$15:f9e5  00 0c         brk #$0c
$15:f9e7  5b            tcd
$15:f9e8  cc ea 02      cpy $02ea
$15:f9eb  0c 5d cc      tsb $cc5d
$15:f9ee  ea            nop
$15:f9ef  00 06         brk #$06
$15:f9f1  cc 06 5b      cpy $5b06
$15:f9f4  cc ea 02      cpy $02ea
$15:f9f7  0c 5d cc      tsb $cc5d
$15:f9fa  ea            nop
$15:f9fb  00 0c         brk #$0c
$15:f9fd  59 cc ea      eor $eacc,y
$15:fa00  02 0c         cop #$0c
$15:fa02  5d cc ea      eor $eacc,x
$15:fa05  00 06         brk #$06
$15:fa07  cc 06 5b      cpy $5b06
$15:fa0a  cc ea 02      cpy $02ea
$15:fa0d  0c 5d cc      tsb $cc5d
$15:fa10  ea            nop
$15:fa11  00 06         brk #$06
$15:fa13  cc 06 5b      cpy $5b06
$15:fa16  cc ea 02      cpy $02ea
$15:fa19  0c 5d cc      tsb $cc5d
$15:fa1c  ea            nop
$15:fa1d  00 0c         brk #$0c
$15:fa1f  5b            tcd
$15:fa20  cc ea 02      cpy $02ea
$15:fa23  0c 5d cc      tsb $cc5d
$15:fa26  ea            nop
$15:fa27  00 0c         brk #$0c
$15:fa29  59 cc ea      eor $eacc,y
$15:fa2c  02 0c         cop #$0c
$15:fa2e  5d cc ea      eor $eacc,x
$15:fa31  00 06         brk #$06
$15:fa33  cc 06 5b      cpy $5b06
$15:fa36  cc ea 02      cpy $02ea
$15:fa39  0c 5d cc      tsb $cc5d
$15:fa3c  ea            nop
$15:fa3d  00 0c         brk #$0c
$15:fa3f  5b            tcd
$15:fa40  cc ea 02      cpy $02ea
$15:fa43  0c 5d cc      tsb $cc5d
$15:fa46  ea            nop
$15:fa47  00 06         brk #$06
$15:fa49  cc 06 5b      cpy $5b06
$15:fa4c  cc ea 02      cpy $02ea
$15:fa4f  0c 5d cc      tsb $cc5d
$15:fa52  ea            nop
$15:fa53  00 0c         brk #$0c
$15:fa55  59 cc ea      eor $eacc,y
$15:fa58  02 0c         cop #$0c
$15:fa5a  5d cc ea      eor $eacc,x
$15:fa5d  00 06         brk #$06
$15:fa5f  cc 06 5b      cpy $5b06
$15:fa62  cc ea 02      cpy $02ea
$15:fa65  0c 5d cc      tsb $cc5d
$15:fa68  ea            nop
$15:fa69  00 06         brk #$06
$15:fa6b  cc 06 5b      cpy $5b06
$15:fa6e  cc ea 02      cpy $02ea
$15:fa71  0c 5d cc      tsb $cc5d
$15:fa74  ea            nop
$15:fa75  00 0c         brk #$0c
$15:fa77  5b            tcd
$15:fa78  cc ea 02      cpy $02ea
$15:fa7b  0c 5d cc      tsb $cc5d
$15:fa7e  ea            nop
$15:fa7f  00 0c         brk #$0c
$15:fa81  59 cc ea      eor $eacc,y
$15:fa84  02 0c         cop #$0c
$15:fa86  5d cc ea      eor $eacc,x
$15:fa89  00 06         brk #$06
$15:fa8b  cc 06 5b      cpy $5b06
$15:fa8e  cc ea 02      cpy $02ea
$15:fa91  0c 5d cc      tsb $cc5d
$15:fa94  ea            nop
$15:fa95  00 06         brk #$06
$15:fa97  cc 06 5b      cpy $5b06
$15:fa9a  cc ea 02      cpy $02ea
$15:fa9d  0c 5d cc      tsb $cc5d
$15:faa0  ea            nop
$15:faa1  00 0c         brk #$0c
$15:faa3  5b            tcd
$15:faa4  cc ea 02      cpy $02ea
$15:faa7  0c 5d cc      tsb $cc5d
$15:faaa  ea            nop
$15:faab  00 0c         brk #$0c
$15:faad  59 cc ea      eor $eacc,y
$15:fab0  02 0c         cop #$0c
$15:fab2  5d cc ea      eor $eacc,x
$15:fab5  00 06         brk #$06
$15:fab7  cc 06 5b      cpy $5b06
$15:faba  cc ea 02      cpy $02ea
$15:fabd  0c 5d cc      tsb $cc5d
$15:fac0  ea            nop
$15:fac1  00 06         brk #$06
$15:fac3  cc 06 5b      cpy $5b06
$15:fac6  cc ea 02      cpy $02ea
$15:fac9  0c 5d cc      tsb $cc5d
$15:facc  ea            nop
$15:facd  00 0c         brk #$0c
$15:facf  5b            tcd
$15:fad0  cc ea 02      cpy $02ea
$15:fad3  0c 5d cc      tsb $cc5d
$15:fad6  ea            nop
$15:fad7  00 0c         brk #$0c
$15:fad9  59 cc ea      eor $eacc,y
$15:fadc  02 0c         cop #$0c
$15:fade  5d cc ea      eor $eacc,x
$15:fae1  00 06         brk #$06
$15:fae3  cc 06 5b      cpy $5b06
$15:fae6  cc ea 02      cpy $02ea
$15:fae9  0c 5d cc      tsb $cc5d
$15:faec  ea            nop
$15:faed  00 0c         brk #$0c
$15:faef  5b            tcd
$15:faf0  cc ea 02      cpy $02ea
$15:faf3  0c 5d cc      tsb $cc5d
$15:faf6  ea            nop
$15:faf7  00 06         brk #$06
$15:faf9  cc 06 5b      cpy $5b06
$15:fafc  cc ea 02      cpy $02ea
$15:faff  0c 5d cc      tsb $cc5d
$15:fb02  ea            nop
$15:fb03  00 cc         brk #$cc
$15:fb05  24 c9         bit $c9
$15:fb07  ed 66 e1      sbc $e166
$15:fb0a  0b            phd
$15:fb0b  0c cc 0c      tsb $0ccc
$15:fb0e  5b            tcd
$15:fb0f  cc 0c 5d      cpy $5d0c
$15:fb12  cc 0c 59      cpy $590c
$15:fb15  cc 0c 5d      cpy $5d0c
$15:fb18  cc 0c 5b      cpy $5b0c
$15:fb1b  cc 0c 5d      cpy $5d0c
$15:fb1e  cc 0c 59      cpy $590c
$15:fb21  cc 0c 5d      cpy $5d0c
$15:fb24  cc 0c 5b      cpy $5b0c
$15:fb27  cc 0c 5d      cpy $5d0c
$15:fb2a  cc 0c 59      cpy $590c
$15:fb2d  cc 0c 5d      cpy $5d0c
$15:fb30  cc 0c 5b      cpy $5b0c
$15:fb33  cc 0c 5d      cpy $5d0c
$15:fb36  cc ea 02      cpy $02ea
$15:fb39  cc ea 00      cpy $00ea
$15:fb3c  cc 0c 5b      cpy $5b0c
$15:fb3f  cc 0c 5d      cpy $5d0c
$15:fb42  cc 0c 59      cpy $590c
$15:fb45  cc 0c 5d      cpy $5d0c
$15:fb48  cc 0c 5b      cpy $5b0c
$15:fb4b  cc 0c 5d      cpy $5d0c
$15:fb4e  cc 0c 59      cpy $590c
$15:fb51  cc 0c 5d      cpy $5d0c
$15:fb54  cc 0c 5b      cpy $5b0c
$15:fb57  cc 0c 5d      cpy $5d0c
$15:fb5a  cc 0c 59      cpy $590c
$15:fb5d  cc 0c 5d      cpy $5d0c
$15:fb60  cc 0c 5b      cpy $5b0c
$15:fb63  cc 0c 5d      cpy $5d0c
$15:fb66  cc 0c 59      cpy $590c
$15:fb69  cc 0c 5d      cpy $5d0c
$15:fb6c  cc 0c 5b      cpy $5b0c
$15:fb6f  cc 0c 5d      cpy $5d0c
$15:fb72  cc 0c 59      cpy $590c
$15:fb75  cc 0c 5d      cpy $5d0c
$15:fb78  cc 0c 5b      cpy $5b0c
$15:fb7b  cc 0c 5d      cpy $5d0c
$15:fb7e  cc 0c 59      cpy $590c
$15:fb81  cc 0c 5d      cpy $5d0c
$15:fb84  cc 0c 5b      cpy $5b0c
$15:fb87  cc 0c 5d      cpy $5d0c
$15:fb8a  cc 0c 59      cpy $590c
$15:fb8d  cc 0c 5d      cpy $5d0c
$15:fb90  cc 0c 5b      cpy $5b0c
$15:fb93  cc 0c 5d      cpy $5d0c
$15:fb96  cc ea 02      cpy $02ea
$15:fb99  cc ea 00      cpy $00ea
$15:fb9c  cc 0c 5b      cpy $5b0c
$15:fb9f  cc 0c 5d      cpy $5d0c
$15:fba2  cc 0c 59      cpy $590c
$15:fba5  cc 0c 5d      cpy $5d0c
$15:fba8  cc 0c 5b      cpy $5b0c
$15:fbab  cc 0c 5d      cpy $5d0c
$15:fbae  cc 0c 59      cpy $590c
$15:fbb1  cc 0c 5d      cpy $5d0c
$15:fbb4  cc 0c 5b      cpy $5b0c
$15:fbb7  cc 0c 5d      cpy $5d0c
$15:fbba  cc 0c 59      cpy $590c
$15:fbbd  cc 0c 5d      cpy $5d0c
$15:fbc0  cc 24 c9      cpy $c924
$15:fbc3  00 ed         brk #$ed
$15:fbc5  be e1 0a      ldx $0ae1,y
$15:fbc8  18            clc
$15:fbc9  5b            tcd
$15:fbca  ca            dex
$15:fbcb  18            clc
$15:fbcc  5d cb 18      eor $18cb,x
$15:fbcf  5b            tcd
$15:fbd0  ca            dex
$15:fbd1  18            clc
$15:fbd2  5d cb 18      eor $18cb,x
$15:fbd5  5b            tcd
$15:fbd6  ca            dex
$15:fbd7  18            clc
$15:fbd8  5d cb 0c      eor $0ccb,x
$15:fbdb  5b            tcd
$15:fbdc  ca            dex
$15:fbdd  ca            dex
$15:fbde  18            clc
$15:fbdf  5d cb 18      eor $18cb,x
$15:fbe2  5b            tcd
$15:fbe3  ca            dex
$15:fbe4  18            clc
$15:fbe5  5d cb 18      eor $18cb,x
$15:fbe8  5b            tcd
$15:fbe9  ca            dex
$15:fbea  18            clc
$15:fbeb  5d cb 18      eor $18cb,x
$15:fbee  5b            tcd
$15:fbef  ca            dex
$15:fbf0  0c 5d cb      tsb $cb5d
$15:fbf3  0c 5b ca      tsb $ca5b
$15:fbf6  ca            dex
$15:fbf7  ca            dex
$15:fbf8  0c 5d cb      tsb $cb5d
$15:fbfb  0c 5b ca      tsb $ca5b
$15:fbfe  18            clc
$15:fbff  ca            dex
$15:fc00  18            clc
$15:fc01  5d cb 18      eor $18cb,x
$15:fc04  5b            tcd
$15:fc05  ca            dex
$15:fc06  18            clc
$15:fc07  5d cb 18      eor $18cb,x
$15:fc0a  5b            tcd
$15:fc0b  ca            dex
$15:fc0c  18            clc
$15:fc0d  5d cb 0c      eor $0ccb,x
$15:fc10  5b            tcd
$15:fc11  ca            dex
$15:fc12  ca            dex
$15:fc13  18            clc
$15:fc14  5d cb 18      eor $18cb,x
$15:fc17  5b            tcd
$15:fc18  ca            dex
$15:fc19  18            clc
$15:fc1a  5d cb 18      eor $18cb,x
$15:fc1d  5b            tcd
$15:fc1e  ca            dex
$15:fc1f  18            clc
$15:fc20  5d cb 18      eor $18cb,x
$15:fc23  5b            tcd
$15:fc24  ca            dex
$15:fc25  0c 5d cb      tsb $cb5d
$15:fc28  0c 5b ca      tsb $ca5b
$15:fc2b  ca            dex
$15:fc2c  0c 5e cb      tsb $cb5e
$15:fc2f  cb            wai
$15:fc30  cb            wai
$15:fc31  18            clc
$15:fc32  5b            tcd
$15:fc33  ca            dex
$15:fc34  0c 5d cb      tsb $cb5d
$15:fc37  0c 5b ca      tsb $ca5b
$15:fc3a  18            clc
$15:fc3b  ca            dex
$15:fc3c  0c 5d cb      tsb $cb5d
$15:fc3f  0c 5b ca      tsb $ca5b
$15:fc42  18            clc
$15:fc43  ca            dex
$15:fc44  0c 5d cb      tsb $cb5d
$15:fc47  0c 5b ca      tsb $ca5b
$15:fc4a  ca            dex
$15:fc4b  ca            dex
$15:fc4c  0c 5d cb      tsb $cb5d
$15:fc4f  0c 5b ca      tsb $ca5b
$15:fc52  18            clc
$15:fc53  ca            dex
$15:fc54  0c 5d cb      tsb $cb5d
$15:fc57  0c 5b ca      tsb $ca5b
$15:fc5a  18            clc
$15:fc5b  ca            dex
$15:fc5c  0c 5d cb      tsb $cb5d
$15:fc5f  0c 5b ca      tsb $ca5b
$15:fc62  18            clc
$15:fc63  ca            dex
$15:fc64  0c 5d cb      tsb $cb5d
$15:fc67  0c 5b ca      tsb $ca5b
$15:fc6a  ca            dex
$15:fc6b  ca            dex
$15:fc6c  0c 5d cb      tsb $cb5d
$15:fc6f  0c 5b ca      tsb $ca5b
$15:fc72  18            clc
$15:fc73  ca            dex
$15:fc74  0c 5d cb      tsb $cb5d
$15:fc77  0c 5b ca      tsb $ca5b
$15:fc7a  18            clc
$15:fc7b  ca            dex
$15:fc7c  0c 5d cb      tsb $cb5d
$15:fc7f  0c 5b ca      tsb $ca5b
$15:fc82  18            clc
$15:fc83  ca            dex
$15:fc84  0c 5d cb      tsb $cb5d
$15:fc87  0c 5b ca      tsb $ca5b
$15:fc8a  18            clc
$15:fc8b  ca            dex
$15:fc8c  0c 5d cb      tsb $cb5d
$15:fc8f  0c 5b ca      tsb $ca5b
$15:fc92  18            clc
$15:fc93  ca            dex
$15:fc94  0c 5d cb      tsb $cb5d
$15:fc97  0c 5b ca      tsb $ca5b
$15:fc9a  18            clc
$15:fc9b  ca            dex
$15:fc9c  0c 5d cb      tsb $cb5d
$15:fc9f  0c 5b ca      tsb $ca5b
$15:fca2  18            clc
$15:fca3  ca            dex
$15:fca4  0c 5d cb      tsb $cb5d
$15:fca7  0c 5b ca      tsb $ca5b
$15:fcaa  ca            dex
$15:fcab  06 5d         asl $5d
$15:fcad  cb            wai
$15:fcae  cb            wai
$15:fcaf  0c cb cb      tsb $cbcb
$15:fcb2  18            clc
$15:fcb3  5b            tcd
$15:fcb4  ca            dex
$15:fcb5  0c 5d cb      tsb $cb5d
$15:fcb8  0c 5b ca      tsb $ca5b
$15:fcbb  ca            dex
$15:fcbc  ca            dex
$15:fcbd  0c 5d cb      tsb $cb5d
$15:fcc0  0c 5b ca      tsb $ca5b
$15:fcc3  18            clc
$15:fcc4  ca            dex
$15:fcc5  0c 5d cb      tsb $cb5d
$15:fcc8  0c 5b ca      tsb $ca5b
$15:fccb  18            clc
$15:fccc  ca            dex
$15:fccd  0c 5d cb      tsb $cb5d
$15:fcd0  0c 5b ca      tsb $ca5b
$15:fcd3  18            clc
$15:fcd4  ca            dex
$15:fcd5  0c 5d cb      tsb $cb5d
$15:fcd8  0c 5b ca      tsb $ca5b
$15:fcdb  ca            dex
$15:fcdc  ca            dex
$15:fcdd  0c 5d cb      tsb $cb5d
$15:fce0  0c 5b ca      tsb $ca5b
$15:fce3  18            clc
$15:fce4  ca            dex
$15:fce5  0c 5d cb      tsb $cb5d
$15:fce8  0c 5b ca      tsb $ca5b
$15:fceb  ca            dex
$15:fcec  ca            dex
$15:fced  0c 5d cb      tsb $cb5d
$15:fcf0  0c 5b ca      tsb $ca5b
$15:fcf3  18            clc
$15:fcf4  ca            dex
$15:fcf5  0c 5d cb      tsb $cb5d
$15:fcf8  0c 5b ca      tsb $ca5b
$15:fcfb  ca            dex
$15:fcfc  ca            dex
$15:fcfd  0c 5d cb      tsb $cb5d
$15:fd00  0c 5b ca      tsb $ca5b
$15:fd03  18            clc
$15:fd04  ca            dex
$15:fd05  0c 5d cb      tsb $cb5d
$15:fd08  0c 5b ca      tsb $ca5b
$15:fd0b  ca            dex
$15:fd0c  ca            dex
$15:fd0d  0c 5d cb      tsb $cb5d
$15:fd10  0c 5b ca      tsb $ca5b
$15:fd13  18            clc
$15:fd14  ca            dex
$15:fd15  0c 5d cb      tsb $cb5d
$15:fd18  0c 5b ca      tsb $ca5b
$15:fd1b  ca            dex
$15:fd1c  ca            dex
$15:fd1d  0c 5d cb      tsb $cb5d
$15:fd20  0c 5b ca      tsb $ca5b
$15:fd23  ca            dex
$15:fd24  0c 5d cb      tsb $cb5d
$15:fd27  cb            wai
$15:fd28  cb            wai
$15:fd29  0c 5e cb      tsb $cb5e
$15:fd2c  cb            wai
$15:fd2d  cb            wai
$15:fd2e  cb            wai
$15:fd2f  00 ea         brk #$ea
$15:fd31  00 e0         brk #$e0
$15:fd33  03 ed         ora $ed,s
$15:fd35  46 e1         lsr $e1
$15:fd37  07 e3         ora [$e3]
$15:fd39  18            clc
$15:fd3a  22 1e 12 c9   jsl $c9121e
$15:fd3e  0c 3d a4      tsb $a43d
$15:fd41  0c 3b ab      tsb $ab3b
$15:fd44  0c 3d a4      tsb $a43d
$15:fd47  ab            plb
$15:fd48  a4 c9         ldy $c9
$15:fd4a  0c 3b a4      tsb $a43b
$15:fd4d  c9 0c 3d      cmp #$3d0c
$15:fd50  a4 0c         ldy $0c
$15:fd52  3b            tsc
$15:fd53  b0 0c         bcs $fd61
$15:fd55  3d a4 b0      and $b0a4,x
$15:fd58  a4 0c         ldy $0c
$15:fd5a  3b            tsc
$15:fd5b  b0 a4         bcs $fd01
$15:fd5d  c9 0c 3d      cmp #$3d0c
$15:fd60  a3 0c         lda $0c,s
$15:fd62  3b            tsc
$15:fd63  af 0c 3d a3   lda $a33d0c
$15:fd67  af a3 c9 0c   lda $0cc9a3
$15:fd6b  3b            tsc
$15:fd6c  a3 c9         lda $c9,s
$15:fd6e  0c 3d a4      tsb $a43d
$15:fd71  0c 3b b0      tsb $b03b
$15:fd74  0c 3d a4      tsb $a43d
$15:fd77  b0 a4         bcs $fd1d
$15:fd79  0c 3b b0      tsb $b03b
$15:fd7c  a4 c9         ldy $c9
$15:fd7e  0c 3d a4      tsb $a43d
$15:fd81  0c 3b ad      tsb $ad3b
$15:fd84  0c 3d a4      tsb $a43d
$15:fd87  ad a4 c9      lda $c9a4
$15:fd8a  0c 3b a4      tsb $a43b
$15:fd8d  c9 0c 3d      cmp #$3d0c
$15:fd90  a4 0c         ldy $0c
$15:fd92  3b            tsc
$15:fd93  b0 0c         bcs $fda1
$15:fd95  3d a4 b0      and $b0a4,x
$15:fd98  a4 0c         ldy $0c
$15:fd9a  3b            tsc
$15:fd9b  b0 a4         bcs $fd41
$15:fd9d  c9 0c 3d      cmp #$3d0c
$15:fda0  a3 0c         lda $0c,s
$15:fda2  3b            tsc
$15:fda3  af 0c 3d a3   lda $a33d0c
$15:fda7  af a3 c9 0c   lda $0cc9a3
$15:fdab  3b            tsc
$15:fdac  a3 c9         lda $c9,s
$15:fdae  0c 3d a4      tsb $a43d
$15:fdb1  0c 3b b0      tsb $b03b
$15:fdb4  0c 3d a4      tsb $a43d
$15:fdb7  b0 a4         bcs $fd5d
$15:fdb9  0c 3b b0      tsb $b03b
$15:fdbc  a4 ed         ldy $ed
$15:fdbe  56 02         lsr $02,x
$15:fdc0  c9 e1 09      cmp #$09e1
$15:fdc3  10 5e         bpl $fe23
$15:fdc5  ab            plb
$15:fdc6  10 5d         bpl $fe25
$15:fdc8  a6 a6         ldx $a6
$15:fdca  10 5e         bpl $fe2a
$15:fdcc  a6 10         ldx $10
$15:fdce  5d a4 a6      eor $a6a4,x
$15:fdd1  60            rts
$15:fdd2  5b            tcd
$15:fdd3  a8            tay
$15:fdd4  10 5e         bpl $fe34
$15:fdd6  ab            plb
$15:fdd7  10 5d         bpl $fe36
$15:fdd9  a6 a6         ldx $a6
$15:fddb  10 5e         bpl $fe3b
$15:fddd  a6 10         ldx $10
$15:fddf  5d a4 a6      eor $a6a4,x
$15:fde2  30 a9         bmi $fd8d
$15:fde4  30 5c         bmi $fe42
$15:fde6  a8            tay
$15:fde7  10 5e         bpl $fe47
$15:fde9  ab            plb
$15:fdea  10 5d         bpl $fe49
$15:fdec  a6 a6         ldx $a6
$15:fdee  10 5e         bpl $fe4e
$15:fdf0  a6 10         ldx $10
$15:fdf2  5d a4 a6      eor $a6a4,x
$15:fdf5  10 5e         bpl $fe55
$15:fdf7  a9 10 5d      lda #$5d10
$15:fdfa  a8            tay
$15:fdfb  a9 10 5e      lda #$5e10
$15:fdfe  ab            plb
$15:fdff  10 5d         bpl $fe5e
$15:fe01  a8            tay
$15:fe02  ab            plb
$15:fe03  10 5e         bpl $fe63
$15:fe05  ae 10 5d      ldx $5d10
$15:fe08  ad ae 10      lda $10ae
$15:fe0b  5e b0 10      lsr $10b0,x
$15:fe0e  5d ae b0      eor $b0ae,x
$15:fe11  60            rts
$15:fe12  5b            tcd
$15:fe13  b2 30         lda ($30)
$15:fe15  5d a8 10      eor $10a8,x
$15:fe18  5e a8 10      lsr $10a8,x
$15:fe1b  5d a9 ab      eor $aba9,x
$15:fe1e  60            rts
$15:fe1f  5b            tcd
$15:fe20  ad 30 5d      lda $5d30
$15:fe23  a6 10         ldx $10
$15:fe25  5e a6 10      lsr $10a6,x
$15:fe28  5d a8 a9      eor $a9a8,x
$15:fe2b  60            rts
$15:fe2c  5b            tcd
$15:fe2d  ab            plb
$15:fe2e  30 5d         bmi $fe8d
$15:fe30  a4 10         ldy $10
$15:fe32  5e a4 10      lsr $10a4,x
$15:fe35  5d a6 a8      eor $a8a6,x
$15:fe38  30 aa         bmi $fde4
$15:fe3a  10 5e         bpl $fe9a
$15:fe3c  aa            tax
$15:fe3d  10 5d         bpl $fe9c
$15:fe3f  ab            plb
$15:fe40  ad 30 af      lda $af30
$15:fe43  10 5e         bpl $fea3
$15:fe45  af 10 5d ad   lda $ad5d10
$15:fe49  af 48 5b b0   lda $b05b48
$15:fe4d  10 c9         bpl $fe18
$15:fe4f  00 ea         brk #$ea
$15:fe51  00 e0         brk #$e0
$15:fe53  02 ed         cop #$ed
$15:fe55  37 e1         and [$e1],y
$15:fe57  07 08         ora [$08]
$15:fe59  c9 30 3d      cmp #$3d30
$15:fe5c  a8            tay
$15:fe5d  10 3e         bpl $fe9d
$15:fe5f  a8            tay
$15:fe60  10 3d         bpl $fe9f
$15:fe62  a9 ab 48      lda #$48ab
$15:fe65  ad 18 c9      lda $c918
$15:fe68  30 a6         bmi $fe10
$15:fe6a  10 3e         bpl $feaa
$15:fe6c  a6 10         ldx $10
$15:fe6e  3d a8 a9      and $a9a8,x
$15:fe71  48            pha
$15:fe72  ab            plb
$15:fe73  18            clc
$15:fe74  c9 30 a4      cmp #$a430
$15:fe77  10 3e         bpl $feb7
$15:fe79  a4 10         ldy $10
$15:fe7b  3d a6 a8      and $a8a6,x
$15:fe7e  30 aa         bmi $fe2a
$15:fe80  10 3e         bpl $fec0
$15:fe82  aa            tax
$15:fe83  10 3d         bpl $fec2
$15:fe85  ab            plb
$15:fe86  ad 40 af      lda $af40
$15:fe89  10 ad         bpl $fe38
$15:fe8b  af 48 3b b0   lda $b03b48
$15:fe8f  18            clc
$15:fe90  c9 60 c9      cmp #$c960
$15:fe93  c9 c9 c9      cmp #$c9c9
$15:fe96  c9 c9 5e      cmp #$5ec9
$15:fe99  c9 ea 00      cmp #$00ea
$15:fe9c  e0 00 ed      cpx #$ed00
$15:fe9f  3c e1 06      bit $06e1,x
$15:fea2  e3 18         sbc $18,s
$15:fea4  46 40         lsr $40
$15:fea6  60            rts
$15:fea7  c9 06 3e      cmp #$3e06
$15:feaa  a8            tay
$15:feab  06 3d         asl $3d
$15:fead  a4 a6         ldy $a6
$15:feaf  a8            tay
$15:feb0  06 3e         asl $3e
$15:feb2  a9 06 3d      lda #$3d06
$15:feb5  ab            plb
$15:feb6  ad af 06      lda $06af
$15:feb9  3e b0 06      rol $06b0,x
$15:febc  3d b2 b4      and $b4b2,x
$15:febf  b2 06         lda ($06)
$15:fec1  3e b0 06      rol $06b0,x
$15:fec4  3d af ad      and $adaf,x
$15:fec7  ab            plb
$15:fec8  06 3e         asl $3e
$15:feca  a9 06 3d      lda #$3d06
$15:fecd  a4 a6         ldy $a6
$15:fecf  a8            tay
$15:fed0  06 3e         asl $3e
$15:fed2  a9 06 3d      lda #$3d06
$15:fed5  ab            plb
$15:fed6  ad af 06      lda $06af
$15:fed9  3e b0 06      rol $06b0,x
$15:fedc  3d b2 b4      and $b4b2,x
$15:fedf  b5 06         lda $06,x
$15:fee1  3e b4 06      rol $06b4,x
$15:fee4  3d b2 b5      and $b5b2,x
$15:fee7  b2 06         lda ($06)
$15:fee9  3e af 06      rol $06af,x
$15:feec  3d ad ab      and $abad,x
$15:feef  a9 06 3e      lda #$3e06
$15:fef2  a8            tay
$15:fef3  06 3d         asl $3d
$15:fef5  a6 a4         ldx $a4
$15:fef7  a3 b2         lda $b2,s
$15:fef9  b0 af         bcs $feaa
$15:fefb  ad 06 3e      lda $3e06
$15:fefe  ab            plb
$15:feff  06 3d         asl $3d
$15:ff01  a9 a8 a6      lda #$a6a8
$15:ff04  06 3e         asl $3e
$15:ff06  a4 06         ldy $06
$15:ff08  3d a6 a8      and $a8a6,x
$15:ff0b  a9 06 3e      lda #$3e06
$15:ff0e  ab            plb
$15:ff0f  06 3d         asl $3d
$15:ff11  ad af b0      lda $b0af
$15:ff14  06 3e         asl $3e
$15:ff16  b2 06         lda ($06)
$15:ff18  3d b4 b2      and $b2b4,x
$15:ff1b  b0 06         bcs $ff23
$15:ff1d  3e af 06      rol $06af,x
$15:ff20  3d ad ab      and $abad,x
$15:ff23  a9 06 3e      lda #$3e06
$15:ff26  a8            tay
$15:ff27  06 3d         asl $3d
$15:ff29  a1 a3         lda ($a3,x)
$15:ff2b  a4 06         ldy $06
$15:ff2d  3e a6 06      rol $06a6,x
$15:ff30  3d a8 a9      and $a9a8,x
$15:ff33  ab            plb
$15:ff34  06 3e         asl $3e
$15:ff36  ad 06 3d      lda $3d06
$15:ff39  af 06 3b b0   lda $b03b06
$15:ff3d  06 3d         asl $3d
$15:ff3f  b2 b4         lda ($b4)
$15:ff41  06 3b         asl $3b
$15:ff43  b5 06         lda $06,x
$15:ff45  39 b7 06      and $06b7,y
$15:ff48  37 b9         and [$b9],y
$15:ff4a  06 3e         asl $3e
$15:ff4c  a6 06         ldx $06
$15:ff4e  3d a1 a3      and $a3a1,x
$15:ff51  a4 06         ldy $06
$15:ff53  3e a6 06      rol $06a6,x
$15:ff56  3d a8 aa      and $aaa8,x
$15:ff59  ab            plb
$15:ff5a  06 3e         asl $3e
$15:ff5c  ad 06 3d      lda $3d06
$15:ff5f  af b0 b2 06   lda $06b2b0
$15:ff63  3e b4 06      rol $06b4,x
$15:ff66  3d b6 b4      and $b4b6,x
$15:ff69  b2 06         lda ($06)
$15:ff6b  3e af 06      rol $06af,x
$15:ff6e  3d ad ab      and $abad,x
$15:ff71  a9 06 3e      lda #$3e06
$15:ff74  a8            tay
$15:ff75  06 3d         asl $3d
$15:ff77  a6 b2         ldx $b2
$15:ff79  b0 06         bcs $ff81
$15:ff7b  3e af 06      rol $06af,x
$15:ff7e  3d ad ab      and $abad,x
$15:ff81  a9 06 3e      lda #$3e06
$15:ff84  a8            tay
$15:ff85  06 3d         asl $3d
$15:ff87  a6 a4         ldx $a4
$15:ff89  a3 06         lda $06,s
$15:ff8b  3e a4 06      rol $06a4,x
$15:ff8e  3d a6 a8      and $a8a6,x
$15:ff91  a9 06 3e      lda #$3e06
$15:ff94  ab            plb
$15:ff95  06 3d         asl $3d
$15:ff97  ad af b0      lda $b0af
$15:ff9a  0c 3e a4      tsb $a43e
$15:ff9d  1e c9 00      asl $00c9,x
$15:ffa0  00 1c         brk #$1c
$15:ffa2  00 34         brk #$34
$15:ffa4  2c 53 73      bit $7353
$15:ffa7  ce 76 e9      dec $e976
$15:ffaa  76 1f         ror $1f,x
$15:ffac  77 3a         adc [$3a],y
$15:ffae  77 a3         adc [$a3],y
$15:ffb0  7a            ply
$15:ffb1  e2 7a         sep #$7a
$15:ffb3  fd 7a f6      sbc $f67a,x
$15:ffb6  90 f6         bcc $ffae
$15:ffb8  90 5b         bcc $0015
$15:ffba  95 5b         sta $5b,x
$15:ffbc  95 45         sta $45,x
$15:ffbe  9f 45 9f 02   sta $029f45,x
$15:ffc2  00 fd         brk #$fd
$15:ffc4  0f 27 a2 00   ora $00a227
$15:ffc8  00 07         brk #$07
$15:ffca  1b            tcs
$15:ffcb  14 12         trb $12
$15:ffcd  1f 18 19 1a   ora $1a1918,x
$15:ffd1  01 01         ora ($01,x)
$15:ffd3  00 01         brk #$01
$15:ffd5  b8            clv
$15:ffd6  5c 6f 17 97   jml $97176f
$15:ffda  7d 3c 71      adc $713c,x
$15:ffdd  de 0e ff      dec $ff0e,x
$15:ffe0  00 78         brk #$78
$15:ffe2  47 c4         eor [$c4]
$15:ffe4  5e 33 f2      lsr $f233,x
$15:ffe7  27 95         and [$95]
$15:ffe9  7c cd e7      jmp ($e7cd,x)
$15:ffec  7f 44 7a 67   adc $677a44,x
$15:fff0  d5 5e         cmp $5e,x
$15:fff2  bb            tyx
$15:fff3  f7 40         sbc [$40],y
$15:fff5  80 11         bra $0008
$15:fff7  06 09         asl $09
$15:fff9  44 e0 0c      mvp $0c,$e0
$15:fffc  ff 70 60 00   sbc $006070,x
