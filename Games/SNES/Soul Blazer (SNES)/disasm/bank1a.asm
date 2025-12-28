; Soul Blazer (SNES) - Bank $1a
; Disassembled from ROM
; File offset: $0d0000-$0d7fff
; CPU address: $1a:$8000-$1a:$ffff
;===========================================================

.bank $1a
.org $8000

$1a:8000  ca            dex
$1a:8001  16 a4         asl $a4,x
$1a:8003  4e 35 53      lsr $5335
$1a:8006  89 24 e7      bit #$e724
$1a:8009  2d 39 d8      and $d839
$1a:800c  4e 79 53      lsr $5379
$1a:800f  9f 24 e7 fd   sta $fde724,x
$1a:8013  39 8c 4e      and $4e8c,y
$1a:8016  a6 53         ldx $53
$1a:8018  aa            tax
$1a:8019  64 ea         stz $ea
$1a:801b  cd 3a c0      cmp $c03a
$1a:801e  4e b3 53      lsr $53b3
$1a:8021  ad a4 eb      lda $eba4
$1a:8024  9d 3a f4      sta $f43a,x
$1a:8027  4e a0 53      lsr $53a0
$1a:802a  b8            clv
$1a:802b  e4 ee         cpx $ee
$1a:802d  6d 3b a8      adc $a83b
$1a:8030  4e ee 53      lsr $53ee
$1a:8033  bd a4 ef      lda $efa4,x
$1a:8036  bd 3b 84      lda $843b,x
$1a:8039  4f 23 53 c9   eor $c95323
$1a:803d  64 f2         stz $f2
$1a:803f  7d 3c ac      adc $ac3c,x
$1a:8042  4f 2e 53 cc   eor $cc532e
$1a:8046  64 f3         stz $f3
$1a:8048  2d 3c e0      and $e03c
$1a:804b  4f 3c 53 cf   eor $cf533c
$1a:804f  e4 f2         cpx $f2
$1a:8051  1d 3d 80      ora $803d,x
$1a:8054  c0 3f         cpy #$3f
$1a:8056  9f f8 24 03   sta $0324f8,x
$1a:805a  3c 36 38      bit $3836,x
$1a:805d  1c 03 66      trb $6603
$1a:8060  36 38         rol $38,x
$1a:8062  10 f1         bpl $8055
$1a:8064  49 61 5f      eor #$5f61
$1a:8067  1b            tcs
$1a:8068  18            clc
$1a:8069  dc 2e 85      jml [$852e]
$1a:806c  65 c4         adc $c4
$1a:806e  95 96         sta $96,x
$1a:8070  40            rti
$1a:8071  36 1f         rol $1f,x
$1a:8073  ef fe 01 00   sbc $0001fe
$1a:8077  9a            txs
$1a:8078  8d 87 fc      sta $fc87
$1a:807b  72 1a         adc ($1a)
$1a:807d  50 d8         bvc $8057
$1a:807f  7f e7 21 36   adc $3621e7,x
$1a:8083  92 20         sta ($20)
$1a:8085  8e a4 88      stx $88a4
$1a:8088  23 e8         and $e8,s
$1a:808a  20 41 0e      jsr $0e41
$1a:808d  43 b4         eor $b4,s
$1a:808f  4d 91 14      eor $1491
$1a:8092  93 7e         sta ($7e,s),y
$1a:8094  ac f1 d8      ldy $d8f1
$1a:8097  15 49         ora $49,x
$1a:8099  76 45         ror $45,x
$1a:809b  d2 5d         cmp ($5d)
$1a:809d  91 94         sta ($94),y
$1a:809f  97 64         sta [$64],y
$1a:80a1  85 42         sta $42
$1a:80a3  18            clc
$1a:80a4  23 50         and $50,s
$1a:80a6  96 07         stx $07,y
$1a:80a8  d2 39         cmp ($39)
$1a:80aa  81 ad         sta ($ad,x)
$1a:80ac  11 3e         ora ($3e),y
$1a:80ae  02 14         cop #$14
$1a:80b0  08            php
$1a:80b1  2b            pld
$1a:80b2  d1 02         cmp ($02),y
$1a:80b4  0b            phd
$1a:80b5  74 3c         stz $3c,x
$1a:80b7  82 bd 0e      brl $8f77
$1a:80ba  20 b7 42      jsr $42b7
$1a:80bd  48            pha
$1a:80be  2b            pld
$1a:80bf  d0 a2         bne $8063
$1a:80c1  03 1f         ora $1f,s
$1a:80c3  21 2b         and ($2b,x)
$1a:80c5  3d 07 e0      and $e007,x
$1a:80c8  d7 41         cmp [$41],y
$1a:80ca  78            sei
$1a:80cb  37 d0         and [$d0],y
$1a:80cd  4e 0f f4      lsr $f40f
$1a:80d0  4b            phk
$1a:80d1  82 37 96      brl $170b
$1a:80d4  60            rts
$1a:80d5  ff f4 11 bb   sbc $bb11f4,x
$1a:80d9  41 86         eor ($86,x)
$1a:80db  1d 0a 12      ora $120a,x
$1a:80de  7d 25 0a      adc $0a25,x
$1a:80e1  61 7a         adc ($7a,x)
$1a:80e3  83 6c         sta $6c,s
$1a:80e5  30 94         bmi $807b
$1a:80e7  04 18         tsb $18
$1a:80e9  36 c9         rol $c9,x
$1a:80eb  46 4b         lsr $4b
$1a:80ed  94 56         sty $56,x
$1a:80ef  92 ec         sta ($ec)
$1a:80f1  96 a4         stx $a4,y
$1a:80f3  e9 01 78      sbc #$7801
$1a:80f6  3a            dec a
$1a:80f7  c2 61         rep #$61
$1a:80f9  40            rti
$1a:80fa  69 a6 22      adc #$22a6
$1a:80fd  7e f9 01      ror $01f9,x
$1a:8100  38            sec
$1a:8101  3e c3 c8      rol $c8c3,x
$1a:8104  82 12 29      brl $aa19
$1a:8107  35 c9         and $c9,x
$1a:8109  da            phx
$1a:810a  8e 12 77      stx $7712
$1a:810d  93 a4         sta ($a4,s),y
$1a:810f  92 a4         sta ($a4)
$1a:8111  a9 09 25      lda #$2509
$1a:8114  0c 0e 95      tsb $950e
$1a:8117  2a            rol a
$1a:8118  4a            lsr a
$1a:8119  54 96 21      mvn $21,$96
$1a:811c  b4 a4         ldy $a4,x
$1a:811e  ad c9 72      lda $72c9
$1a:8121  40            rti
$1a:8122  d0 10         bne $8134
$1a:8124  a0 55         ldy #$55
$1a:8126  17 60         ora [$60],y
$1a:8128  1d 23 1a      ora $1a23,x
$1a:812b  45 a9         eor $a9
$1a:812d  46 34         lsr $34
$1a:812f  87 53         sta [$53]
$1a:8131  0d 69 62      ora $6269
$1a:8134  a6 07         ldx $07
$1a:8136  d1 ee         cmp ($ee),y
$1a:8138  04 10         tsb $10
$1a:813a  2a            rol a
$1a:813b  a1 25         lda ($25,x)
$1a:813d  1e e0 51      asl $51e0,x
$1a:8140  28            plp
$1a:8141  2a            rol a
$1a:8142  38            sec
$1a:8143  f1 93         sbc ($93),y
$1a:8145  e3 7a         sbc $7a,s
$1a:8147  78            sei
$1a:8148  0e ca 49      asl $49ca
$1a:814b  03 6b         ora $6b,s
$1a:814d  5a            phy
$1a:814e  a9 46 f4      lda #$f446
$1a:8151  b3 52         lda ($52,s),y
$1a:8153  cd e8 c7      cmp $c7e8
$1a:8156  03 6b         ora $6b,s
$1a:8158  74 a8         stz $a8,x
$1a:815a  a6 f4         ldx $f4
$1a:815c  b8            clv
$1a:815d  2a            rol a
$1a:815e  95 3f         sta $3f,x
$1a:8160  12 ca         ora ($ca)
$1a:8162  09 bd 3b      ora #$3bbd
$1a:8165  14 03         trb $03
$1a:8167  7a            ply
$1a:8168  10 40         bpl $81aa
$1a:816a  da            phx
$1a:816b  db            stp
$1a:816c  e4 82         cpx $82
$1a:816e  c4 93         cpy $93
$1a:8170  0b            phd
$1a:8171  88            dey
$1a:8172  9f a8 5a 70   sta $705aa8,x
$1a:8176  7e 5e e4      ror $e45e,x
$1a:8179  fc de 82      jsr ($82de,x)
$1a:817c  f0 50         beq $81ce
$1a:817e  b6 01         ldx $01,y
$1a:8180  88            dey
$1a:8181  bd 46 22      lda $2246,x
$1a:8184  81 e3         sta ($e3,x)
$1a:8186  0d 43 37      ora $3743
$1a:8189  a7 a0         lda [$a0]
$1a:818b  58            cli
$1a:818c  ae d8 9a      ldx $9ad8
$1a:818f  51 8d         eor ($8d),y
$1a:8191  e9 96 23      sbc #$2396
$1a:8194  29 15 80      and #$8015
$1a:8197  e5 02         sbc $02
$1a:8199  2c 18 ac      bit $ac18
$1a:819c  0c 28 33      tsb $3328
$1a:819f  03 4a         ora $4a,s
$1a:81a1  52 a8         eor ($a8)
$1a:81a3  86 94         stx $94
$1a:81a5  d6 1e         dec $1e,x
$1a:81a7  16 1d         asl $1d,x
$1a:81a9  45 34         eor $34
$1a:81ab  a2 c4         ldx #$c4
$1a:81ad  0d 28 a9      ora $a928
$1a:81b0  03 4a         ora $4a,s
$1a:81b2  01 ca         ora ($ca,x)
$1a:81b4  0e 58 55      asl $5558
$1a:81b7  1a            inc a
$1a:81b8  7e 28 ca      ror $ca28,x
$1a:81bb  34 b0         bit $b0,x
$1a:81bd  d1 e1         cmp ($e1),y
$1a:81bf  45 83         eor $83
$1a:81c1  e5 51         sbc $51
$1a:81c3  e1 e5         sbc ($e5,x)
$1a:81c5  83 99         sta $99,s
$1a:81c7  d2 1d         cmp ($1d)
$1a:81c9  e0 c3         cpx #$c3
$1a:81cb  65 db         adc $db
$1a:81cd  2c d9 56      bit $56d9
$1a:81d0  cc d4 03      cpy $03d4
$1a:81d3  c4 a2         cpy $a2
$1a:81d5  84 2d         sty $2d
$1a:81d7  4b            phk
$1a:81d8  e5 08         sbc $08
$1a:81da  7a            ply
$1a:81db  c3 b0         cmp $b0,s
$1a:81dd  16 a4         asl $a4,x
$1a:81df  d0 78         bne $8259
$1a:81e1  f0 ea         beq $81cd
$1a:81e3  61 1d         adc ($1d,x)
$1a:81e5  37 54         and [$54],y
$1a:81e7  b1 e8         lda ($e8),y
$1a:81e9  40            rti
$1a:81ea  cb            wai
$1a:81eb  0a            asl a
$1a:81ec  2d 4c 75      and $754c
$1a:81ef  20 5a 9f      jsr $9f5a
$1a:81f2  06 50         asl $50
$1a:81f4  8b            phb
$1a:81f5  49 ea 1b      eor #$1bea
$1a:81f8  6a            ror a
$1a:81f9  60            rts
$1a:81fa  b4 bf         ldy $bf,x
$1a:81fc  df fe c9 38   cmp $38c9fe,x
$1a:8200  ff bf ff e5   sbc $e5ffbf,x
$1a:8204  31 ea         and ($ea),y
$1a:8206  10 12         bpl $821a
$1a:8208  c0 ff         cpy #$ff
$1a:820a  09 82 61      ora #$6182
$1a:820d  42 a8         wdm #$a8
$1a:820f  18            clc
$1a:8210  50 ba         bvc $81cc
$1a:8212  42 d2         wdm #$d2
$1a:8214  82 40 23      brl $a557
$1a:8217  f4 d7 a8      pea $a8d7
$1a:821a  26 52         rol $52
$1a:821c  37 4e         and [$4e],y
$1a:821e  42 a4         wdm #$a4
$1a:8220  c1 18         cmp ($18,x)
$1a:8222  b4 54         ldy $54,x
$1a:8224  62 db e9      per $6c02
$1a:8227  c7 12         cmp [$12]
$1a:8229  2c 07 22      bit $2207
$1a:822c  7a            ply
$1a:822d  5f 42 c0 4e   eor $4ec042,x
$1a:8231  e9 aa 54      sbc #$54aa
$1a:8234  b2 ad         lda ($ad)
$1a:8236  97 1e         sta [$1e],y
$1a:8238  b6 5f         ldx $5f,y
$1a:823a  8a            txa
$1a:823b  08            php
$1a:823c  57 f8         eor [$f8],y
$1a:823e  bd 65 a8      lda $a865,x
$1a:8241  06 41         asl $41
$1a:8243  0c 70 01      tsb $0170
$1a:8246  98            tya
$1a:8247  3a            dec a
$1a:8248  d3 6b         cmp ($6b,s),y
$1a:824a  4e 56 b0      lsr $b056
$1a:824d  cc 14 a8      cpy $a814
$1a:8250  f9 22 c0      sbc $c022,y
$1a:8253  44 02 02      mvp $02,$02
$1a:8256  0f 43 88 29   ora $298843
$1a:825a  4f 4c 85 10   eor $10854c
$1a:825e  8f ea 04 7e   sta $7e04ea
$1a:8262  33 1d         and ($1d,s),y
$1a:8264  50 e3         bvc $8249
$1a:8266  c6 63         dec $63
$1a:8268  c6 26         dec $26
$1a:826a  f8            sed
$1a:826b  cc 79 06      cpy $0679
$1a:826e  23 88         and $88,s
$1a:8270  c0 19         cpy #$19
$1a:8272  e0 17         cpx #$17
$1a:8274  9e 54 0b      stz $0b54,x
$1a:8277  f9 ff 86      sbc $86ff,y
$1a:827a  40            rti
$1a:827b  11 e0         ora ($e0),y
$1a:827d  8d 00 ba      sta $ba00
$1a:8280  26 8f         rol $8f
$1a:8282  68            pla
$1a:8283  8c f1 98      sty $98f1
$1a:8286  ed 60 5f      sbc $5f60
$1a:8289  4f fc 52 01   eor $0152fc
$1a:828d  1b            tcs
$1a:828e  80 2d         bra $82bd
$1a:8290  c2 11         rep #$11
$1a:8292  00 5f         brk #$5f
$1a:8294  81 88         sta ($88,x)
$1a:8296  46 63         lsr $63
$1a:8298  07 f9         ora [$f9]
$1a:829a  30 ca         bmi $8266
$1a:829c  0f 00 f9 60   ora $60f900
$1a:82a0  8c 41 21      sty $2141
$1a:82a3  80 4b         bra $82f0
$1a:82a5  c3 43         cmp $43,s
$1a:82a7  20 6d 0c      jsr $0c6d
$1a:82aa  28            plp
$1a:82ab  34 10         bit $10,x
$1a:82ad  88            dey
$1a:82ae  5c 3a 25 8a   jml $8a253a
$1a:82b2  0d 0c 4d      ora $4d0c
$1a:82b5  c8            iny
$1a:82b6  18            clc
$1a:82b7  90 d0         bcc $8289
$1a:82b9  43 60         eor $60,s
$1a:82bb  cd a0 a4      cmp $a4a0
$1a:82be  31 c6         and ($c6),y
$1a:82c0  29 16 89      and #$8916
$1a:82c3  5e 83 41      lsr $4183,x
$1a:82c6  03 88         ora $88,s
$1a:82c8  42 a2         wdm #$a2
$1a:82ca  d8            cld
$1a:82cb  c8            iny
$1a:82cc  23 f4         and $f4,s
$1a:82ce  63 50         adc $50,s
$1a:82d0  6d 60 0c      adc $0c60
$1a:82d3  22 6d e0 8b   jsl $8be06d
$1a:82d7  63 81         adc $81,s
$1a:82d9  44 07 0d      mvp $0d,$07
$1a:82dc  70 0c         bvs $82ea
$1a:82de  20 51 18      jsr $1851
$1a:82e1  1c 75 da      trb $da75
$1a:82e4  30 a8         bmi $828e
$1a:82e6  4b            phk
$1a:82e7  6c 2e 50      jmp ($502e)
$1a:82ea  48            pha
$1a:82eb  1b            tcs
$1a:82ec  68            pla
$1a:82ed  5a            phy
$1a:82ee  e4 65         cpx $65
$1a:82f0  06 ef         asl $ef
$1a:82f2  9b            txy
$1a:82f3  80 18         bra $830d
$1a:82f5  11 28         ora ($28),y
$1a:82f7  76 7a         ror $7a,x
$1a:82f9  08            php
$1a:82fa  f6 82         inc $82,x
$1a:82fc  30 67         bmi $8365
$1a:82fe  00 61         brk #$61
$1a:8300  0b            phd
$1a:8301  84 36         sty $36
$1a:8303  c3 a4         cmp $a4,s
$1a:8305  03 08         ora $08,s
$1a:8307  63 3c         adc $3c,s
$1a:8309  24 13         bit $13
$1a:830b  67 e3         adc [$e3]
$1a:830d  83 14         sta $14,s
$1a:830f  34 82         bit $82,x
$1a:8311  76 6d         ror $6d,x
$1a:8313  fb            xce
$1a:8314  b0 8c         bcs $82a2
$1a:8316  05 28         ora $28
$1a:8318  21 79         and ($79,x)
$1a:831a  4e cc fe      lsr $fecc
$1a:831d  78            sei
$1a:831e  f4 4f b4      pea $b44f
$1a:8321  02 65         cop #$65
$1a:8323  00 52         brk #$52
$1a:8325  c2 f6         rep #$f6
$1a:8327  8a            txa
$1a:8328  4a            lsr a
$1a:8329  9f 42 c3 32   sta $32c342,x
$1a:832d  51 aa         eor ($aa),y
$1a:832f  11 f8         ora ($f8),y
$1a:8331  04 b9         tsb $b9
$1a:8333  a9 10 a8      lda #$a810
$1a:8336  34 35         bit $35,x
$1a:8338  1a            inc a
$1a:8339  50 28         bvc $8363
$1a:833b  70 d0         bvs $830d
$1a:833d  12 a1         ora ($a1)
$1a:833f  00 82         brk #$82
$1a:8341  45 22         eor $22
$1a:8343  aa            tax
$1a:8344  92 80         sta ($80)
$1a:8346  44 23 30      mvp $30,$23
$1a:8349  6d 60 34      adc $3460
$1a:834c  22 10 02 48   jsl $480210
$1a:8350  6b            rtl
$1a:8351  81 a1         sta ($a1,x)
$1a:8353  09 83 89      ora #$8983
$1a:8356  41 70         eor ($70,x)
$1a:8358  30 58         bmi $83b2
$1a:835a  58            cli
$1a:835b  90 2e         bcc $838b
$1a:835d  04 52         tsb $52
$1a:835f  84 af         sty $af
$1a:8361  88            dey
$1a:8362  9c 06 50      stz $5006
$1a:8365  63 08         adc $08,s
$1a:8367  c8            iny
$1a:8368  20 d1 94      jsr $94d1
$1a:836b  70 33         bvs $83a0
$1a:836d  fd c1 d4      sbc $d4c1,x
$1a:8370  87 8f         sta [$8f]
$1a:8372  3e 82 34      rol $3482,x
$1a:8375  4a            lsr a
$1a:8376  26 12         rol $12
$1a:8378  80 41         bra $83bb
$1a:837a  56 05         lsr $05,x
$1a:837c  21 0e         and ($0e,x)
$1a:837e  a8            tay
$1a:837f  59 0e fe      eor $fe0e,y
$1a:8382  88            dey
$1a:8383  94 d4         sty $d4,x
$1a:8385  2a            rol a
$1a:8386  d5 72         cmp $72,x
$1a:8388  69 42 9a      adc #$9a42
$1a:838b  28            plp
$1a:838c  1d 60 ab      ora $ab60,x
$1a:838f  eb            xba
$1a:8390  82 17 81      brl $04aa
$1a:8393  9d e8 b7      sta $b7e8,x
$1a:8396  62 82 5b      per $df1b
$1a:8399  d4 fe         pei ($fe)
$1a:839b  b8            clv
$1a:839c  b4 a0         ldy $a0,x
$1a:839e  33 42         and ($42,s),y
$1a:83a0  e8            inx
$1a:83a1  56 08         lsr $08,x
$1a:83a3  04 88         tsb $88
$1a:83a5  45 4c         eor $4c
$1a:83a7  50 6e         bvc $8417
$1a:83a9  0d 00 ae      ora $ae00
$1a:83ac  23 71         and $71,s
$1a:83ae  a0 40 22      ldy #$2240
$1a:83b1  b0 68         bcs $841b
$1a:83b3  a4 52         ldy $52
$1a:83b5  f6 48         inc $48,x
$1a:83b7  08            php
$1a:83b8  84 0e         sty $0e
$1a:83ba  25 0e         and $0e
$1a:83bc  b7 1c         lda [$1c],y
$1a:83be  86 26         stx $26
$1a:83c0  99 0b 61      sta $610b,y
$1a:83c3  58            cli
$1a:83c4  20 f0 c6      jsr $c6f0
$1a:83c7  60            rts
$1a:83c8  4e 9b e4      lsr $e49b
$1a:83cb  4c 0a e1      jmp $e10a
$1a:83ce  58            cli
$1a:83cf  12 e0         ora ($e0)
$1a:83d1  4c 0a f1      jmp $f10a
$1a:83d4  58            cli
$1a:83d5  22 30 20 a0   jsl $a02030
$1a:83d9  a1 c2         lda ($c2,x)
$1a:83db  13 0a         ora ($0a,s),y
$1a:83dd  0d 93 98      ora $9893
$1a:83e0  24 67         bit $67
$1a:83e2  6f 43 fa 62   adc $62fa43
$1a:83e6  c5 c0         cmp $c0
$1a:83e8  cf 0b 93 dc   cmp $dc930b
$1a:83ec  99 c1 32      sta $32c1,y
$1a:83ef  55 7a         eor $7a,x
$1a:83f1  ec d8 fe      cpx $fed8
$1a:83f4  d8            cld
$1a:83f5  f7 4f         sbc [$4f],y
$1a:83f7  be a2 b4      ldx $b4a2,y
$1a:83fa  3d 25 a9      and $a925,x
$1a:83fd  81 d4         sta ($d4,x)
$1a:83ff  2b            pld
$1a:8400  e2 6f         sep #$6f
$1a:8402  1b            tcs
$1a:8403  fb            xce
$1a:8404  d3 aa         cmp ($aa,s),y
$1a:8406  c5 9f         cmp $9f
$1a:8408  35 79         and $79,x
$1a:840a  ef d1 9e 49   sbc $499ed1
$1a:840e  d9 a3 20      cmp $20a3,y
$1a:8411  56 e8         lsr $e8,x
$1a:8413  af 55 ef b3   lda $b3ef55
$1a:8417  bd bf e9      lda $e9bf,x
$1a:841a  c5 0f         cmp $0f
$1a:841c  04 e8         tsb $e8
$1a:841e  03 e1         ora $e1,s
$1a:8420  23 50         and $50,s
$1a:8422  2f ff ff 21   and $21ffff
$1a:8426  0d 54 1e      ora $1e54
$1a:8429  12 a3         ora ($a3)
$1a:842b  38            sec
$1a:842c  34 28         bit $28,x
$1a:842e  50 70         bvc $84a0
$1a:8430  e8            inx
$1a:8431  10 bc         bpl $83ef
$1a:8433  a0 30 c8      ldy #$c830
$1a:8436  20 78 2a      jsr $2a78
$1a:8439  41 c1         eor ($c1,x)
$1a:843b  88            dey
$1a:843c  3c 0a 01      bit $010a,x
$1a:843f  14 82         trb $82
$1a:8441  44 e2 a3      mvp $a3,$e2
$1a:8444  82 80 3a      brl $bec7
$1a:8447  52 20         eor ($20)
$1a:8449  52 41         eor ($41)
$1a:844b  10 03         bpl $8450
$1a:844d  4a            lsr a
$1a:844e  11 08         ora ($08),y
$1a:8450  83 c6         sta $c6,s
$1a:8452  45 40         eor $40
$1a:8454  6b            rtl
$1a:8455  09 20         ora #$20
$1a:8457  6b            rtl
$1a:8458  c5 7e         cmp $7e
$1a:845a  3c b8 4b      bit $4bb8,x
$1a:845d  2c 09 9e      bit $9e09
$1a:8460  5d 68 3c      eor $3c68,x
$1a:8463  31 8e         and ($8e),y
$1a:8465  17 48         ora [$48],y
$1a:8467  24 1a         bit $1a
$1a:8469  01 27         ora ($27,x)
$1a:846b  80 4b         bra $84b8
$1a:846d  a0 01 80      ldy #$8001
$1a:8470  63 94         adc $94,s
$1a:8472  30 72         bmi $84e6
$1a:8474  11 b8         ora ($b8),y
$1a:8476  14 1e         trb $1e
$1a:8478  2f 01 69 84   and $846901
$1a:847c  3e 1d 00      rol $001d,x
$1a:847f  8f 4d 03 01   sta $01034d
$1a:8483  19 86 44      ora $4486,y
$1a:8486  e2 74         sep #$74
$1a:8488  f0 c0         beq $844a
$1a:848a  42 a3         wdm #$a3
$1a:848c  63 20         adc $20,s
$1a:848e  a6 28         ldx $28
$1a:8490  82 2d 07      brl $8bc0
$1a:8493  84 45         sty $45
$1a:8495  a1 c7         lda ($c7,x)
$1a:8497  f1 8b         sbc ($8b),y
$1a:8499  c6 20         dec $20
$1a:849b  d2 c5         cmp ($c5)
$1a:849d  48            pha
$1a:849e  0f 80 8e 12   ora $128e80
$1a:84a2  e5 48         sbc $48
$1a:84a4  40            rti
$1a:84a5  a3 62         lda $62,s
$1a:84a7  41 51         eor ($51,x)
$1a:84a9  01 14         ora ($14,x)
$1a:84ab  08            php
$1a:84ac  00 8f         brk #$8f
$1a:84ae  04 38         tsb $38
$1a:84b0  43 e3         eor $e3,s
$1a:84b2  d0 0c         bne $84c0
$1a:84b4  92 40         sta ($40)
$1a:84b6  20 12 58      jsr $5812
$1a:84b9  3c 7c 30      bit $307c,x
$1a:84bc  32 58         and ($58)
$1a:84be  01 a8         ora ($a8,x)
$1a:84c0  68            pla
$1a:84c1  01 32         ora ($32,x)
$1a:84c3  61 80         adc ($80,x)
$1a:84c5  66 a3         ror $a3
$1a:84c7  02 60         cop #$60
$1a:84c9  17 8c         ora [$8c],y
$1a:84cb  50 66         bvc $8533
$1a:84cd  88            dey
$1a:84ce  d0 1d         bne $84ed
$1a:84d0  89 14         bit #$14
$1a:84d2  23 24         and $24,s
$1a:84d4  84 4d         sty $4d
$1a:84d6  81 41         sta ($41,x)
$1a:84d8  10 e0         bpl $84ba
$1a:84da  cc 03 08      cpy $0803
$1a:84dd  1a            inc a
$1a:84de  c3 20         cmp $20,s
$1a:84e0  66 33         ror $33
$1a:84e2  f8            sed
$1a:84e3  1b            tcs
$1a:84e4  4c fe 02      jmp $02fe
$1a:84e7  73 8f         adc ($8f,s),y
$1a:84e9  cd 92 e5      cmp $e592
$1a:84ec  09 2e         ora #$2e
$1a:84ee  90 f8         bcc $84e8
$1a:84f0  19 80 42      ora $4280,y
$1a:84f3  03 af         ora $af,s
$1a:84f5  a1 bd         lda ($bd,x)
$1a:84f7  2f ea 8f 5c   and $5c8fea
$1a:84fb  e5 21         sbc $21
$1a:84fd  91 ed         sta ($ed),y
$1a:84ff  9f 75 7b ef   sta $ef7b75,x
$1a:8503  c1 9e         cmp ($9e,x)
$1a:8505  bb            tyx
$1a:8506  a9 40         lda #$40
$1a:8508  ab            plb
$1a:8509  c7 7e         cmp [$7e]
$1a:850b  4c f2 ef      jmp $eff2
$1a:850e  9b            txy
$1a:850f  bc ff 53      ldy $53ff,x
$1a:8512  24 67         bit $67
$1a:8514  a7 7d         lda [$7d]
$1a:8516  5d eb ff      eor $ffeb,x
$1a:8519  68            pla
$1a:851a  79 fe ab      adc $abfe,y
$1a:851d  4e ef 7f      lsr $7fef
$1a:8520  f8            sed
$1a:8521  43 c4         eor $c4,s
$1a:8523  3e 32 f7      rol $f732,x
$1a:8526  0d 4e 8a      ora $8a4e
$1a:8529  1e 61 f3      asl $f361,x
$1a:852c  97 a0         sta [$a0],y
$1a:852e  fd 29 e4      sbc $e429,x
$1a:8531  3a            dec a
$1a:8532  ab            plb
$1a:8533  2c b5 9a      bit $9ab5
$1a:8536  12 d8         ora ($d8)
$1a:8538  04 cd         tsb $cd
$1a:853a  8c e4 d0      sty $d0e4
$1a:853d  89 46         bit #$46
$1a:853f  1b            tcs
$1a:8540  45 10         eor $10
$1a:8542  90 8d         bcc $84d1
$1a:8544  01 c4         ora ($c4,x)
$1a:8546  30 c8         bmi $8510
$1a:8548  ec 75 d0      cpx $d075
$1a:854b  51 c8         eor ($c8),y
$1a:854d  69 08         adc #$08
$1a:854f  1e 03 14      asl $1403,x
$1a:8552  8a            txa
$1a:8553  c8            iny
$1a:8554  df a3 01 84   cmp $8401a3,x
$1a:8558  48            pha
$1a:8559  61 11         adc ($11,x)
$1a:855b  b8            clv
$1a:855c  b3 8c         lda ($8c,s),y
$1a:855e  0a            asl a
$1a:855f  c0 57         cpy #$57
$1a:8561  15 58         ora $58,x
$1a:8563  40            rti
$1a:8564  25 30         and $30
$1a:8566  09 1c         ora #$1c
$1a:8568  15 c6         ora $c6,x
$1a:856a  06 40         asl $40
$1a:856c  32 8a         and ($8a)
$1a:856e  ac 22 b1      ldy $b122
$1a:8571  48            pha
$1a:8572  24 7e         bit $7e
$1a:8574  a8            tay
$1a:8575  3e 28 6a      rol $6a28,x
$1a:8578  dc 88 e0      jml [$e088]
$1a:857b  7a            ply
$1a:857c  05 f8         ora $f8
$1a:857e  3f c1 4c 13   and $134cc1,x
$1a:8582  41 44         eor ($44,x)
$1a:8584  45 e1         eor $e1
$1a:8586  51 96         eor ($96),y
$1a:8588  d1 42         cmp ($42),y
$1a:858a  23 29         and $29,s
$1a:858c  60            rts
$1a:858d  71 0c         adc ($0c),y
$1a:858f  12 2b         ora ($2b)
$1a:8591  1e 74 14      asl $1474,x
$1a:8594  52 0a         eor ($0a)
$1a:8596  a4 07         ldy $07
$1a:8598  80 c3         bra $855d
$1a:859a  21 b2         and ($b2,x)
$1a:859c  42 89         wdm #$89
$1a:859e  43 61         eor $61,s
$1a:85a0  90 39         bcc $85db
$1a:85a2  0d a1 c6      ora $c6a1
$1a:85a5  0d 60 84      ora $8460
$1a:85a8  47 22         eor [$22]
$1a:85aa  6e 30 8c      ror $8c30
$1a:85ad  a6 81         ldx $81
$1a:85af  82 06 11      brl $96b8
$1a:85b2  62 84 92      per $1839
$1a:85b5  06 c3         asl $c3
$1a:85b7  26 70         rol $70
$1a:85b9  98            tya
$1a:85ba  41 44         eor ($44,x)
$1a:85bc  10 e0         bpl $859e
$1a:85be  c9 2a         cmp #$2a
$1a:85c0  41 b8         eor ($b8,x)
$1a:85c2  08            php
$1a:85c3  30 81         bmi $8546
$1a:85c5  40            rti
$1a:85c6  24 50         bit $50
$1a:85c8  09 58         ora #$58
$1a:85ca  a1 61         lda ($61,x)
$1a:85cc  a1 40         lda ($40,x)
$1a:85ce  85 42         sta $42
$1a:85d0  a3 6b         lda $6b,s
$1a:85d2  32 80         and ($80)
$1a:85d4  45 20         eor $20
$1a:85d6  71 8a         adc ($8a),y
$1a:85d8  80 50         bra $862a
$1a:85da  22 90 08 14   jsl $140890
$1a:85de  66 a1         ror $a1
$1a:85e0  40            rti
$1a:85e1  80 41         bra $8624
$1a:85e3  a2 d1         ldx #$d1
$1a:85e5  04 f0         tsb $f0
$1a:85e7  c0 22         cpy #$22
$1a:85e9  b0 70         bcs $865b
$1a:85eb  68            pla
$1a:85ec  26 02         rol $02
$1a:85ee  03 02         ora $02,s
$1a:85f0  89 43         bit #$43
$1a:85f2  61 d1         adc ($d1,x)
$1a:85f4  c2 60         rep #$60
$1a:85f6  44 a0 41      mvp $41,$a0
$1a:85f9  b0 8f         bcs $858a
$1a:85fb  13 01         ora ($01,s),y
$1a:85fd  ec 10 58      cpx $5810
$1a:8600  b4 21         ldy $21,x
$1a:8602  0a            asl a
$1a:8603  10 28         bpl $862d
$1a:8605  d1 08         cmp ($08),y
$1a:8607  27 88         and [$88]
$1a:8609  50 8d         bvc $8598
$1a:860b  40            rti
$1a:860c  89 21 3f      bit #$3f21
$1a:860f  12 94         ora ($94)
$1a:8611  02 36         cop #$36
$1a:8613  89 00 c0      bit #$c000
$1a:8616  8a            txa
$1a:8617  41 bc         eor ($bc,x)
$1a:8619  22 00 14 82   jsl $821400
$1a:861d  0c 11 65      tsb $6511
$1a:8620  28            plp
$1a:8621  76 44         ror $44,x
$1a:8623  22 11 18 59   jsl $591811
$1a:8627  8b            phb
$1a:8628  50 23         bvc $864d
$1a:862a  11 a1         ora ($a1),y
$1a:862c  89 18 40      bit #$4018
$1a:862f  d0 03         bne $8634
$1a:8631  91 81         sta ($81),y
$1a:8633  43 8c         eor $8c,s
$1a:8635  c0 8d         cpy #$8d
$1a:8637  08            php
$1a:8638  0c 39 ce      tsb $ce39
$1a:863b  07 70         ora [$70]
$1a:863d  65 01         adc $01
$1a:863f  d0 21         bne $8662
$1a:8641  11 09         ora ($09),y
$1a:8643  81 e4         sta ($e4,x)
$1a:8645  90 82         bcc $85c9
$1a:8647  ca            dex
$1a:8648  18            clc
$1a:8649  84 28         sty $28
$1a:864b  38            sec
$1a:864c  51 08         eor ($08),y
$1a:864e  02 48         cop #$48
$1a:8650  04 82         tsb $82
$1a:8652  5f 08 10 a8   eor $a81008,x
$1a:8656  53 a6         eor ($a6,s),y
$1a:8658  40            rti
$1a:8659  14 80         trb $80
$1a:865b  28            plp
$1a:865c  01 bc         ora ($bc,x)
$1a:865e  29 70 50      and #$5070
$1a:8661  01 3b         ora ($3b,x)
$1a:8663  cb            wai
$1a:8664  fe 70 f4      inc $f470,x
$1a:8667  0f a4 bd 38   ora $38bda4
$1a:866b  50 58         bvc $86c5
$1a:866d  9a            txs
$1a:866e  a7 d7         lda [$d7]
$1a:8670  53 0b         eor ($0b,s),y
$1a:8672  63 7b         adc $7b,s
$1a:8674  5e dd 6e      lsr $6edd,x
$1a:8677  e6 37         inc $37
$1a:8679  97 80         sta [$80],y
$1a:867b  c8            iny
$1a:867c  2b            pld
$1a:867d  70 68         bvs $86e7
$1a:867f  04 9e         tsb $9e
$1a:8681  01 2f         ora ($2f,x)
$1a:8683  5f 2c 30 26   eor $26302c,x
$1a:8687  11 b8         ora ($b8),y
$1a:8689  14 1a         trb $1a
$1a:868b  33 01         and ($01,s),y
$1a:868d  a0 40         ldy #$40
$1a:868f  23 30         and $30,s
$1a:8691  c8            iny
$1a:8692  a4 4e         ldy $4e
$1a:8694  9e b9 08      stz $08b9,x
$1a:8697  54 6d 2a      mvn $2a,$6d
$1a:869a  14 c0         trb $c0
$1a:869c  98            tya
$1a:869d  41 a2         eor ($a2,x)
$1a:869f  f1 98         sbc ($98),y
$1a:86a1  34 b1         bit $b1,x
$1a:86a3  fc 11 68      jsr ($6811,x)
$1a:86a6  3a            dec a
$1a:86a7  8c 25 cd      sty $cd25
$1a:86aa  b1 8d         lda ($8d),y
$1a:86ac  a3 85         lda $85,s
$1a:86ae  e0 30         cpx #$30
$1a:86b0  f8            sed
$1a:86b1  f8            sed
$1a:86b2  d0 e4         bne $8698
$1a:86b4  b0 69         bcs $871f
$1a:86b6  0a            asl a
$1a:86b7  08            php
$1a:86b8  64 b0         stz $b0
$1a:86ba  05 f8         ora $f8
$1a:86bc  ba            tsx
$1a:86bd  42 1e         wdm #$1e
$1a:86bf  de 08 fd      dec $fd08,x
$1a:86c2  51 3e         eor ($3e),y
$1a:86c4  50 90         bvc $8656
$1a:86c6  c1 2a         cmp ($2a,x)
$1a:86c8  01 a8         ora ($a8,x)
$1a:86ca  07 b4         ora [$b4]
$1a:86cc  97 20         sta [$20],y
$1a:86ce  aa            tax
$1a:86cf  09 1a 48      ora #$481a
$1a:86d2  1c 4d 2c      trb $2c4d
$1a:86d5  8f 70 4f 1c   sta $1c4f70
$1a:86d9  61 48         adc ($48,x)
$1a:86db  80 50         bra $872d
$1a:86dd  56 1b         lsr $1b,x
$1a:86df  c0 56         cpy #$56
$1a:86e1  85 1e         sta $1e
$1a:86e3  5c a4 12 44   jml $4412a4
$1a:86e7  c1 31         cmp ($31,x)
$1a:86e9  08            php
$1a:86ea  b2 4e         lda ($4e)
$1a:86ec  3d 68 4f      and $4f68,x
$1a:86ef  94 21         sty $21,x
$1a:86f1  aa            tax
$1a:86f2  83 60         sta $60,s
$1a:86f4  3d fa 30      and $30fa,x
$1a:86f7  01 60         ora ($60,x)
$1a:86f9  90 06         bcc $8701
$1a:86fb  51 cd         eor ($cd),y
$1a:86fd  17 80         ora [$80],y
$1a:86ff  93 c6         sta ($c6,s),y
$1a:8701  ca            dex
$1a:8702  28            plp
$1a:8703  3c a4 2d      bit $2da4,x
$1a:8706  07 5b         ora [$5b]
$1a:8708  3c 1d d2      bit $d21d,x
$1a:870b  0c 22 4c      tsb $4c22
$1a:870e  0d 00 82      ora $8200
$1a:8711  53 02         eor ($02,s),y
$1a:8713  35 c6         and $c6,x
$1a:8715  4a            lsr a
$1a:8716  89 20 2d      bit #$2d20
$1a:8719  9c 55 f0      stz $f055
$1a:871c  8c 20 34      sty $3420
$1a:871f  9c 28 de      stz $de28
$1a:8722  91 a0         sta ($a0),y
$1a:8724  32 35         and ($35)
$1a:8726  c0 fc         cpy #$fc
$1a:8728  8b            phb
$1a:8729  50 00         bvc $872b
$1a:872b  93 40         sta ($40,s),y
$1a:872d  11 86         ora ($86),y
$1a:872f  99 0d 92      sta $920d,y
$1a:8732  50 e4         bvc $8718
$1a:8734  29 a4 7d      and #$7da4
$1a:8737  85 00         sta $00
$1a:8739  3a            dec a
$1a:873a  12 48         ora ($48)
$1a:873c  04 b8         tsb $b8
$1a:873e  8c b0 a6      sty $a6b0
$1a:8741  60            rts
$1a:8742  43 09         eor $09,s
$1a:8744  a1 1e         lda ($1e,x)
$1a:8746  99 33 02      sta $0233,y
$1a:8749  01 18         ora ($18,x)
$1a:874b  83 c5         sta $c5,s
$1a:874d  f9 cc c0      sbc $c0cc,y
$1a:8750  8c 27 80      sty $8027
$1a:8753  3c 05 50      bit $5005,x
$1a:8756  82 45 07      brl $8e9e
$1a:8759  a1 5c         lda ($5c,x)
$1a:875b  77 80         adc [$80],y
$1a:875d  a4 22         ldy $22
$1a:875f  10 eb         bpl $874c
$1a:8761  63 68         adc $68,s
$1a:8763  22 90 41 58   jsl $584190
$1a:8767  63 86         adc $86,s
$1a:8769  a4 32         ldy $32
$1a:876b  0c f3 68      tsb $68f3
$1a:876e  02 81         cop #$81
$1a:8770  1e 80 64      asl $6480,x
$1a:8773  9e c1 04      stz $04c1,x
$1a:8776  8e 47 21      stx $2147
$1a:8779  58            cli
$1a:877a  87 b0         sta [$b0]
$1a:877c  47 09         eor [$09]
$1a:877e  81 0a         sta ($0a,x)
$1a:8780  cc 41 00      cpy $0041
$1a:8783  a5 2f         lda $2f
$1a:8785  05 40         ora $40
$1a:8787  6c 63 01      jmp ($0163)
$1a:878a  f4 35 80      pea $8035
$1a:878d  9c a2 23      stz $23a2
$1a:8790  34 3c         bit $3c,x
$1a:8792  01 08         ora ($08,x)
$1a:8794  09 63 1d      ora #$1d63
$1a:8797  27 a2         and [$a2]
$1a:8799  18            clc
$1a:879a  0a            asl a
$1a:879b  e0 13         cpx #$13
$1a:879d  18            clc
$1a:879e  fc 03 20      jsr ($2003,x)
$1a:87a1  43 28         eor $28,s
$1a:87a3  04 7e         tsb $7e
$1a:87a5  b4 cc         ldy $cc,x
$1a:87a7  01 b8         ora ($b8,x)
$1a:87a9  42 47         wdm #$47
$1a:87ab  44 30 05      mvp $05,$30
$1a:87ae  10 0b         bpl $87bb
$1a:87b0  40            rti
$1a:87b1  b3 e6         lda ($e6,s),y
$1a:87b3  af 3d fa 33   lda $33fa3d
$1a:87b7  e5 10         sbc $10
$1a:87b9  05 32         ora $32
$1a:87bb  a7 d5         lda [$d5]
$1a:87bd  5b            tcd
$1a:87be  eb            xba
$1a:87bf  ef 67 fb 83   sbc $83fb67
$1a:87c3  e9 0f 2f      sbc #$2f0f
$1a:87c6  01 f8         ora ($f8,x)
$1a:87c8  53 c4         eor ($c4,s),y
$1a:87ca  be e2 d9      ldx $d9e2,y
$1a:87cd  d1 1b         cmp ($1b),y
$1a:87cf  ca            dex
$1a:87d0  fb            xce
$1a:87d1  08            php
$1a:87d2  8b            phb
$1a:87d3  9a            txs
$1a:87d4  0d 74 27      ora $2774
$1a:87d7  0f 40 f8 f9   ora $f9f840
$1a:87db  6e c9 af      ror $afc9
$1a:87de  2b            pld
$1a:87df  d9 04 a6      cmp $a604,y
$1a:87e2  46 2f         lsr $2f
$1a:87e4  78            sei
$1a:87e5  a3 19         lda $19,s
$1a:87e7  df 24 cc f4   cmp $f4cc24,x
$1a:87eb  4c aa 4a      jmp $4aaa
$1a:87ee  60            rts
$1a:87ef  02 b9         cop #$b9
$1a:87f1  00 41         brk #$41
$1a:87f3  23 21         and $21,s
$1a:87f5  74 35         stz $35,x
$1a:87f7  03 10         ora $10,s
$1a:87f9  a1 42         lda ($42,x)
$1a:87fb  44 89 32      mvp $32,$89
$1a:87fe  50 ee         bvc $87ee
$1a:8800  03 33         ora $33,s
$1a:8802  3f 00 e8 e3   and $e3e800,x
$1a:8806  c4 04         cpy $04
$1a:8808  49 83 7c      eor #$7c83
$1a:880b  c0 a1         cpy #$a1
$1a:880d  b2 4b         lda ($4b)
$1a:880f  04 02         tsb $02
$1a:8811  20 13 08      jsr $0813
$1a:8814  04 19         tsb $19
$1a:8816  4c 20 50      jmp $5020
$1a:8819  81 c0         sta ($c0,x)
$1a:881b  02 40         cop #$40
$1a:881d  a5 08         lda $08
$1a:881f  76 c0         ror $c0,x
$1a:8821  68            pla
$1a:8822  0a            asl a
$1a:8823  50 84         bvc $87a9
$1a:8825  41 b8         eor ($b8,x)
$1a:8827  03 b1         ora $b1,s
$1a:8829  82 45 a0      brl $2871
$1a:882c  19 68 12      ora $1268,y
$1a:882f  95 21         sta $21,x
$1a:8831  ea            nop
$1a:8832  c9 8b ae      cmp #$ae8b
$1a:8835  12 1e         ora ($1e)
$1a:8837  bf 05 98 c5   lda $c59805,x
$1a:883b  e0 1e         cpx #$1e
$1a:883d  06 3f         asl $3f
$1a:883f  b6 3e         ldx $3e,y
$1a:8841  15 02         ora $02,x
$1a:8843  fd ff e1      sbc $e1ff,x
$1a:8846  aa            tax
$1a:8847  61 52         adc ($52,x)
$1a:8849  92 9c         sta ($9c)
$1a:884b  1d 42 b4      ora $b442,x
$1a:884e  18            clc
$1a:884f  47 11         eor [$11]
$1a:8851  48            pha
$1a:8852  2b            pld
$1a:8853  c0 80         cpy #$80
$1a:8855  75 20         adc $20,x
$1a:8857  9f 6f fb 10   sta $10fb6f,x
$1a:885b  18            clc
$1a:885c  80 2a         bra $8888
$1a:885e  02 c9         cop #$c9
$1a:8860  08            php
$1a:8861  89 80 3e      bit #$3e80
$1a:8864  e1 c1         sbc ($c1,x)
$1a:8866  0e c6 80      asl $80c6
$1a:8869  39 28 07      and $0728,y
$1a:886c  bb            tyx
$1a:886d  80 38         bra $88a7
$1a:886f  12 48         ora ($48)
$1a:8871  e0 3f         cpx #$3f
$1a:8873  1f f5 48 2a   ora $2a48f5,x
$1a:8877  40            rti
$1a:8878  a8            tay
$1a:8879  03 26         ora $26,s
$1a:887b  13 04         ora ($04,s),y
$1a:887d  20 7a 22      jsr $227a
$1a:8880  60            rts
$1a:8881  32 89         and ($89)
$1a:8883  14 0c         trb $0c
$1a:8885  82 4a 38      brl $c0d2
$1a:8888  41 cc         eor ($cc,x)
$1a:888a  70 0a         bvs $8896
$1a:888c  50 19         bvc $88a7
$1a:888e  11 f9         ora ($f9),y
$1a:8890  21 8b         and ($8b,x)
$1a:8892  b1 88         lda ($88),y
$1a:8894  23 43         and $43,s
$1a:8896  fe a5 13      inc $13a5,x
$1a:8899  c8            iny
$1a:889a  24 00         bit $00
$1a:889c  8a            txa
$1a:889d  08            php
$1a:889e  e1 84         sbc ($84,x)
$1a:88a0  7f c9 80 8d   adc $8d80c9,x
$1a:88a4  04 e8         tsb $e8
$1a:88a6  9f 41 1a 0e   sta $0e1a41,x
$1a:88aa  e0 f7         cpx #$f7
$1a:88ac  a4 89         ldy $89
$1a:88ae  56 29         lsr $29,x
$1a:88b0  92 2b         sta ($2b)
$1a:88b2  07 bd         ora [$bd]
$1a:88b4  40            rti
$1a:88b5  4b            phk
$1a:88b6  91 3e         sta ($3e),y
$1a:88b8  8c 61 1a      sty $1a61
$1a:88bb  1f e3 08 c6   ora $c608e3,x
$1a:88bf  11 c1         ora ($c1),y
$1a:88c1  fe 3e 81      inc $813e,x
$1a:88c4  58            cli
$1a:88c5  18            clc
$1a:88c6  e2 45         sep #$45
$1a:88c8  02 b0         cop #$b0
$1a:88ca  33 84         and ($84,s),y
$1a:88cc  98            tya
$1a:88cd  28            plp
$1a:88ce  08            php
$1a:88cf  23 80         and $80,s
$1a:88d1  1c 02 c3      trb $c302
$1a:88d4  ec 76 80      cpx $8076
$1a:88d7  48            pha
$1a:88d8  5e 41 40      lsr $4041,x
$1a:88db  7a            ply
$1a:88dc  8a            txa
$1a:88dd  a8            tay
$1a:88de  3d 9c 07      and $079c,x
$1a:88e1  70 bf         bvs $88a2
$1a:88e3  c4 a7         cpy $a7
$1a:88e5  6e e0 77      ror $77e0
$1a:88e8  01 84         ora ($84,x)
$1a:88ea  7c 90 20      jmp ($2090,x)
$1a:88ed  57 bd         eor [$bd],y
$1a:88ef  c3 cd         cmp $cd,s
$1a:88f1  02 70         cop #$70
$1a:88f3  7a            ply
$1a:88f4  a8            tay
$1a:88f5  3d 10 27      and $2710,x
$1a:88f8  e1 fa         sbc ($fa,x)
$1a:88fa  28            plp
$1a:88fb  4e e3 e6      lsr $e6e3
$1a:88fe  12 08         ora ($08)
$1a:8900  a6 34         ldx $34
$1a:8902  24 21         bit $21
$1a:8904  47 a0         eor [$a0]
$1a:8906  1f f1 31 ac   ora $ac31f1,x
$1a:890a  41 dc         eor ($dc,x)
$1a:890c  30 d8         bmi $88e6
$1a:890e  07 a8         ora [$a8]
$1a:8910  90 46         bcc $8958
$1a:8912  f1 2e         sbc ($2e),y
$1a:8914  82 34 20      brl $a94b
$1a:8917  91 1e         sta ($1e),y
$1a:8919  28            plp
$1a:891a  cc 13 81      cpy $8113
$1a:891d  0c 84 f5      tsb $f584
$1a:8920  46 61         lsr $61
$1a:8922  0f 84 a1 04   ora $04a184
$1a:8926  ba            tsx
$1a:8927  08            php
$1a:8928  90 3e         bcc $8968
$1a:892a  89 3c e1      bit #$e13c
$1a:892d  be ac 13      ldx $13ac,y
$1a:8930  d4 93         pei ($93)
$1a:8932  41 c2         eor ($c2,x)
$1a:8934  7b            tdc
$1a:8935  81 a8         sta ($a8,x)
$1a:8937  0d 40 f7      ora $f740
$1a:893a  17 78         ora [$78],y
$1a:893c  86 0d         stx $0d
$1a:893e  ee 1b c8      inc $c81b
$1a:8941  10 00         bpl $8943
$1a:8943  20 80 3b      jsr $3b80
$1a:8946  e6 13         inc $13
$1a:8948  17 77         ora [$77],y
$1a:894a  d3 bc         cmp ($bc,s),y
$1a:894c  22 10 0f fb   jsl $fb0f10
$1a:8950  bd e0 30      lda $30e0,x
$1a:8953  2a            rol a
$1a:8954  0e ff c1      asl $c1ff
$1a:8957  e0 81         cpx #$81
$1a:8959  bb            tyx
$1a:895a  de 05 00      dec $0005,x
$1a:895d  c0 40         cpy #$40
$1a:895f  23 e0         and $e0,s
$1a:8961  c0 80         cpy #$80
$1a:8963  84 5b         sty $5b
$1a:8965  01 7f         ora ($7f,x)
$1a:8967  fc 7e 1d      jsr ($1d7e,x)
$1a:896a  e2 0d         sep #$0d
$1a:896c  51 38         eor ($38),y
$1a:896e  3b            tsc
$1a:896f  c2 0e         rep #$0e
$1a:8971  0c 20 6a      tsb $6a20
$1a:8974  8d c0 36      sta $36c0
$1a:8977  03 c3         ora $c3,s
$1a:8979  06 b8         asl $b8
$1a:897b  ac 41 80      ldy $8041
$1a:897e  67 27         adc [$27]
$1a:8980  78            sei
$1a:8981  d8            cld
$1a:8982  33 f3         and ($f3,s),y
$1a:8984  f0 68         beq $89ee
$1a:8986  8a            txa
$1a:8987  c3 f0         cmp $f0,s
$1a:8989  49 32 98      eor #$9832
$1a:898c  8e cf ff      stx $ffcf
$1a:898f  03 fc         ora $fc,s
$1a:8991  1a            inc a
$1a:8992  c0 1a         cpy #$1a
$1a:8994  9f f4 a0 3b   sta $3ba0f4,x
$1a:8998  c0 f6         cpy #$f6
$1a:899a  60            rts
$1a:899b  d7 06         cmp [$06],y
$1a:899d  82 2c 12      brl $9bcc
$1a:89a0  68            pla
$1a:89a1  91 68         sta ($68),y
$1a:89a3  0f f9 37 90   ora $9037f9
$1a:89a7  15 53         ora $53,x
$1a:89a9  cc 39 18      cpy $1839
$1a:89ac  01 68         ora ($68,x)
$1a:89ae  32 45         and ($45)
$1a:89b0  36 d0         rol $d0,x
$1a:89b2  87 f0         sta [$f0]
$1a:89b4  ae 84 52      ldx $5284
$1a:89b7  1f fe 00 35   ora $3500fe,x
$1a:89bb  92 86         sta ($86)
$1a:89bd  5b            tcd
$1a:89be  a4 29         ldy $29
$1a:89c0  a7 1f         lda [$1f]
$1a:89c2  81 20         sta ($20,x)
$1a:89c4  7b            tdc
$1a:89c5  e4 80         cpx $80
$1a:89c7  0d a5 31      ora $31a5
$1a:89ca  7c 78 a7      jmp ($a778,x)
$1a:89cd  03 4a         ora $4a,s
$1a:89cf  3e f2 7d      rol $7df2,x
$1a:89d2  60            rts
$1a:89d3  2f e5 dc 1b   and $1bdce5
$1a:89d7  89 3a d7      bit #$d73a
$1a:89da  74 59         stz $59,x
$1a:89dc  48            pha
$1a:89dd  7a            ply
$1a:89de  3b            tsc
$1a:89df  d3 f8         cmp ($f8,s),y
$1a:89e1  17 25         ora [$25],y
$1a:89e3  81 40         sta ($40,x)
$1a:89e5  60            rts
$1a:89e6  53 f1         eor ($f1,s),y
$1a:89e8  70 c0         bvs $89aa
$1a:89ea  7f d0 01 72   adc $7201d0,x
$1a:89ee  c0 9b         cpy #$9b
$1a:89f0  e2 2e         sep #$2e
$1a:89f2  08            php
$1a:89f3  0f ff 81 ff   ora $ff81ff
$1a:89f7  3d 84 72      and $7284,x
$1a:89fa  06 df         asl $df
$1a:89fc  47 9b         eor [$9b]
$1a:89fe  c4 1e         cpy $1e
$1a:8a00  75 07         adc $07,x
$1a:8a02  fc 5f ff      jsr ($ff5f,x)
$1a:8a05  fc 19 fb      jsr ($fb19,x)
$1a:8a08  ca            dex
$1a:8a09  20 f0 16      jsr $16f0
$1a:8a0c  f8            sed
$1a:8a0d  e0 1c         cpx #$1c
$1a:8a0f  86 f3         stx $f3
$1a:8a11  72 58         adc ($58)
$1a:8a13  60            rts
$1a:8a14  6f ef 26 66   adc $6626ef
$1a:8a18  38            sec
$1a:8a19  99 fe 07      sta $07fe,y
$1a:8a1c  a0 45         ldy #$45
$1a:8a1e  83 b8         sta $b8,s
$1a:8a20  47 2f         eor [$2f]
$1a:8a22  1f 2c 28 1d   ora $1d282c,x
$1a:8a26  e3 c5         sbc $c5,s
$1a:8a28  00 f8         brk #$f8
$1a:8a2a  04 43         tsb $43
$1a:8a2c  c1 1f         cmp ($1f,x)
$1a:8a2e  17 a7         ora [$a7],y
$1a:8a30  e0 7e         cpx #$7e
$1a:8a32  10 38         bpl $8a6c
$1a:8a34  7b            tdc
$1a:8a35  7c 84 80      jmp ($8084,x)
$1a:8a38  2d 56 e9      and $e956
$1a:8a3b  0f c1 ba 89   ora $89bac1
$1a:8a3f  73 4b         adc ($4b,s),y
$1a:8a41  8b            phb
$1a:8a42  ce 78 10      dec $1078
$1a:8a45  0f c2 56 9a   ora $9a56c2
$1a:8a49  e1 07         sbc ($07,x)
$1a:8a4b  52 63         eor ($63)
$1a:8a4d  a0 a0         ldy #$a0
$1a:8a4f  28            plp
$1a:8a50  10 9c         bpl $89ee
$1a:8a52  2c 81 a0      bit $a081
$1a:8a55  4d f2 c0      eor $c0f2
$1a:8a58  7f 99 65 08   adc $086599,x
$1a:8a5c  65 b2         adc $b2
$1a:8a5e  56 1b         lsr $1b,x
$1a:8a60  aa            tax
$1a:8a61  eb            xba
$1a:8a62  81 08         sta ($08,x)
$1a:8a64  c0 ff         cpy #$ff
$1a:8a66  83 12         sta $12,s
$1a:8a68  f0 3b         beq $8aa5
$1a:8a6a  9e 06 a4      stz $a406,x
$1a:8a6d  49 03         eor #$03
$1a:8a6f  2e 10 e0      rol $e010
$1a:8a72  81 07         sta ($07,x)
$1a:8a74  6c 0f c4      jmp ($c40f)
$1a:8a77  09 69         ora #$69
$1a:8a79  a4 1b         ldy $1b
$1a:8a7b  f9 23 e0      sbc $e023,y
$1a:8a7e  07 93         ora [$93]
$1a:8a80  2f f9 f8 11   and $11f8f9
$1a:8a84  ae 7b f4      ldx $f47b
$1a:8a87  63 c0         adc $c0,s
$1a:8a89  52 de         eor ($de)
$1a:8a8b  86 c0         stx $c0
$1a:8a8d  f8            sed
$1a:8a8e  ae 1d bc      ldx $bc1d
$1a:8a91  4b            phk
$1a:8a92  91 81         sta ($81),y
$1a:8a94  2e 52 03      rol $0352
$1a:8a97  01 75         ora ($75,x)
$1a:8a99  a3 d4         lda $d4,s
$1a:8a9b  a0 4e         ldy #$4e
$1a:8a9d  80 78         bra $8b17
$1a:8a9f  03 d4         ora $d4,s
$1a:8aa1  df a4 ee 18   cmp $18eea4,x
$1a:8aa5  18            clc
$1a:8aa6  30 34         bmi $8adc
$1a:8aa8  12 0e         ora ($0e)
$1a:8aaa  06 03         asl $03
$1a:8aac  81 40         sta ($40,x)
$1a:8aae  90 48         bcc $8af8
$1a:8ab0  3c 1a 0f      bit $0f1a,x
$1a:8ab3  07 82         ora [$82]
$1a:8ab5  21 10         and ($10,x)
$1a:8ab7  08            php
$1a:8ab8  0f 82 c0 17   ora $17c082
$1a:8abc  10 f8         bpl $8ab6
$1a:8abe  50 3c         bvc $8afc
$1a:8ac0  10 00         bpl $8ac2
$1a:8ac2  c8            iny
$1a:8ac3  7c 05 80      jmp ($8005,x)
$1a:8ac6  c4 c1         cpy $c1
$1a:8ac8  e7 3b         sbc [$3b]
$1a:8aca  d1 49         cmp ($49),y
$1a:8acc  14 0c         trb $0c
$1a:8ace  03 13         ora $13,s
$1a:8ad0  04 20         tsb $20
$1a:8ad2  a4 80         ldy $80
$1a:8ad4  d8            cld
$1a:8ad5  42 20         wdm #$20
$1a:8ad7  30 8a         bmi $8a63
$1a:8ad9  02 91         cop #$91
$1a:8adb  a4 06         ldy $06
$1a:8add  c0 80         cpy #$80
$1a:8adf  5c 20 13 15   jml $151320
$1a:8ae3  24 a1         bit $a1
$1a:8ae5  c1 0e         cmp ($0e,x)
$1a:8ae7  12 18         ora ($18)
$1a:8ae9  43 15         eor $15,s
$1a:8aeb  b8            clv
$1a:8aec  0a            asl a
$1a:8aed  61 e3         adc ($e3,x)
$1a:8aef  c0 38         cpy #$38
$1a:8af1  cc 59 8c      cpy $8c59
$1a:8af4  39 c7 c4      and $c4c7,y
$1a:8af7  3c 74 58      bit $5874,x
$1a:8afa  0a            asl a
$1a:8afb  03 f9         ora $f9,s
$1a:8afd  00 8e         brk #$8e
$1a:8aff  0f 26 05 11   ora $110526
$1a:8b03  81 41         sta ($41,x)
$1a:8b05  20 92 24      jsr $2492
$1a:8b08  fb            xce
$1a:8b09  43 1c         eor $1c,s
$1a:8b0b  c3 19         cmp $19,s
$1a:8b0d  75 0a         adc $0a,x
$1a:8b0f  3e 60 52      rol $5260,x
$1a:8b12  0a            asl a
$1a:8b13  05 04         ora $04
$1a:8b15  78            sei
$1a:8b16  ea            nop
$1a:8b17  70 e0         bvs $8af9
$1a:8b19  c0 30         cpy #$30
$1a:8b1b  70 02         bvs $8b1f
$1a:8b1d  f5 13         sbc $13,x
$1a:8b1f  80 9c         bra $8abd
$1a:8b21  1f 04 f3 ae   ora $aef304,x
$1a:8b25  c3 f4         cmp $f4,s
$1a:8b27  ca            dex
$1a:8b28  18            clc
$1a:8b29  30 fe         bmi $8b29
$1a:8b2b  68            pla
$1a:8b2c  92 0a         sta ($0a)
$1a:8b2e  64 22         stz $22
$1a:8b30  18            clc
$1a:8b31  7e 7c c1      ror $c17c,x
$1a:8b34  18            clc
$1a:8b35  66 04         ror $04
$1a:8b37  a1 27         lda ($27,x)
$1a:8b39  69 f9         adc #$f9
$1a:8b3b  d4 28         pei ($28)
$1a:8b3d  0d 98 83      ora $8398
$1a:8b40  e8            inx
$1a:8b41  20 54 4c      jsr $4c54
$1a:8b44  26 21         rol $21
$1a:8b46  bf 0c d0 9c   lda $9cd00c,x
$1a:8b4a  31 85         and ($85),y
$1a:8b4c  e1 05         sbc ($05,x)
$1a:8b4e  d1 c0         cmp ($c0),y
$1a:8b50  43 a2         eor $a2,s
$1a:8b52  2b            pld
$1a:8b53  18            clc
$1a:8b54  9f c0 2f ec   sta $ec2fc0,x
$1a:8b58  81 27         sta ($27,x)
$1a:8b5a  46 a2         lsr $a2
$1a:8b5c  01 68         ora ($68,x)
$1a:8b5e  4b            phk
$1a:8b5f  88            dey
$1a:8b60  fd aa 0c      sbc $0caa,x
$1a:8b63  61 06         adc ($06,x)
$1a:8b65  80 1c         bra $8b83
$1a:8b67  19 de df      ora $dfde,y
$1a:8b6a  f2 76         sbc ($76)
$1a:8b6c  40            rti
$1a:8b6d  43 20         eor $20,s
$1a:8b6f  4e ba 01      lsr $01ba
$1a:8b72  b6 41         ldx $41,y
$1a:8b74  45 e0         eor $e0
$1a:8b76  56 d0         lsr $d0,x
$1a:8b78  28            plp
$1a:8b79  a0 30         ldy #$30
$1a:8b7b  28            plp
$1a:8b7c  13 fc         ora ($fc,s),y
$1a:8b7e  06 64         asl $64
$1a:8b80  2c 38 0c      bit $0c38
$1a:8b83  0e 06 3e      asl $3e06
$1a:8b86  07 f0         ora [$f0]
$1a:8b88  10 c8         bpl $8b52
$1a:8b8a  6a            ror a
$1a:8b8b  70 19         bvs $8ba6
$1a:8b8d  07 02         ora [$02]
$1a:8b8f  21 10         and ($10,x)
$1a:8b91  0f 87 83 41   ora $418387
$1a:8b95  60            rts
$1a:8b96  b0 70         bcs $8c08
$1a:8b98  28            plp
$1a:8b99  1c 0c 07      trb $070c
$1a:8b9c  82 c1 f0      brl $7c60
$1a:8b9f  f8            sed
$1a:8ba0  78            sei
$1a:8ba1  3e 0a c0      rol $c00a,x
$1a:8ba4  a0 78         ldy #$78
$1a:8ba6  38            sec
$1a:8ba7  05 50         ora $50
$1a:8ba9  2e 81 98      rol $9881
$1a:8bac  63 10         adc $10,s
$1a:8bae  28            plp
$1a:8baf  84 12         sty $12
$1a:8bb1  01 08         ora ($08,x)
$1a:8bb3  88            dey
$1a:8bb4  4c 46 01      jmp $0146
$1a:8bb7  06 c4         asl $c4
$1a:8bb9  4e 01 43      lsr $4301
$1a:8bbc  21 80         and ($80,x)
$1a:8bbe  10 82         bpl $8b42
$1a:8bc0  0f 00 87 40   ora $408700
$1a:8bc4  3f 90 0b 80   and $800b90,x
$1a:8bc8  28            plp
$1a:8bc9  e5 74         sbc $74
$1a:8bcb  aa            tax
$1a:8bcc  0c 0a 8d      tsb $8d0a
$1a:8bcf  80 c0         bra $8b91
$1a:8bd1  80 0a         bra $8bdd
$1a:8bd3  10 42         bpl $8c17
$1a:8bd5  05 b8         ora $b8
$1a:8bd7  61 20         adc ($20,x)
$1a:8bd9  18            clc
$1a:8bda  c0 51         cpy #$51
$1a:8bdc  c3 d0         cmp $d0,s
$1a:8bde  42 0a         wdm #$0a
$1a:8be0  29 34         and #$34
$1a:8be2  90 e4         bcc $8bc8
$1a:8be4  10 4c         bpl $8c32
$1a:8be6  44 26 23      mvp $23,$26
$1a:8be9  10 90         bpl $8b7b
$1a:8beb  58            cli
$1a:8bec  30 01         bmi $8bef
$1a:8bee  02 8c         cop #$8c
$1a:8bf0  40            rti
$1a:8bf1  0f 60 89 01   ora $018960
$1a:8bf5  00 70         brk #$70
$1a:8bf7  c8            iny
$1a:8bf8  62 0a 28      per $b405
$1a:8bfb  24 22         bit $22
$1a:8bfd  b9 54 cc      lda $cc54,y
$1a:8c00  60            rts
$1a:8c01  67 30         adc [$30]
$1a:8c03  bb            tyx
$1a:8c04  04 03         tsb $03
$1a:8c06  81 01         sta ($01,x)
$1a:8c08  c7 82         cmp [$82]
$1a:8c0a  86 67         stx $67
$1a:8c0c  00 91         brk #$91
$1a:8c0e  c0 2c         cpy #$2c
$1a:8c10  d0 0e         bne $8c20
$1a:8c12  24 01         bit $01
$1a:8c14  b6 11         ldx $11,y
$1a:8c16  e0 52         cpx #$52
$1a:8c18  e2 20         sep #$20
$1a:8c1a  18            clc
$1a:8c1b  82 88 48      brl $d4a6
$1a:8c1e  24 14         bit $14
$1a:8c20  0e 03 20      asl $2003
$1a:8c23  e2 10         sep #$10
$1a:8c25  09 84         ora #$84
$1a:8c27  01 ae         ora ($ae,x)
$1a:8c29  30 0c         bmi $8c37
$1a:8c2b  3a            dec a
$1a:8c2c  00 5d         brk #$5d
$1a:8c2e  45 09         eor $09
$1a:8c30  84 44         sty $44
$1a:8c32  e2 52         sep #$52
$1a:8c34  79 26 3b      adc $3b26,y
$1a:8c37  13 0c         ora ($0c,s),y
$1a:8c39  88            dey
$1a:8c3a  4c 0b 40      jmp $400b
$1a:8c3d  ea            nop
$1a:8c3e  18            clc
$1a:8c3f  34 02         bit $02,x
$1a:8c41  18            clc
$1a:8c42  be 14 48      ldx $4814,y
$1a:8c45  78            sei
$1a:8c46  60            rts
$1a:8c47  18            clc
$1a:8c48  17 51         ora [$51],y
$1a:8c4a  c6 62         dec $62
$1a:8c4c  31 ac         and ($ac),y
$1a:8c4e  14 d2         trb $d2
$1a:8c50  49 21         eor #$21
$1a:8c52  88            dey
$1a:8c53  9d c6 11      sta $11c6,x
$1a:8c56  f8            sed
$1a:8c57  75 0b         adc $0b,x
$1a:8c59  5c 2c 2c 61   jml $612c2c
$1a:8c5d  e7 21         sbc [$21]
$1a:8c5f  84 c4         sty $c4
$1a:8c61  0e a2 81      asl $81a2
$1a:8c64  40            rti
$1a:8c65  a4 14         ldy $14
$1a:8c67  0b            phd
$1a:8c68  1e 0b 8d      asl $8d0b,x
$1a:8c6b  00 5d         brk #$5d
$1a:8c6d  93 a8         sta ($a8,s),y
$1a:8c6f  b8            clv
$1a:8c70  2e 61 10      rol $1061
$1a:8c73  81 92         sta ($92,x)
$1a:8c75  21 11         and ($11,x)
$1a:8c77  0c 86 03      tsb $0386
$1a:8c7a  21 00         and ($00,x)
$1a:8c7c  d8            cld
$1a:8c7d  68            pla
$1a:8c7e  24 10         bit $10
$1a:8c80  09 04         ora #$04
$1a:8c82  05 ae         ora $ae
$1a:8c84  09 d0         ora #$d0
$1a:8c86  62 83 5c      per $e90c
$1a:8c89  1a            inc a
$1a:8c8a  e1 40         sbc ($40,x)
$1a:8c8c  2f 08 6c 9f   and $9f6c08
$1a:8c90  a3 a2         lda $a2,s
$1a:8c92  3d 8c 22      and $228c,x
$1a:8c95  02 95         cop #$95
$1a:8c97  01 c0         ora ($c0,x)
$1a:8c99  de 07 a1      dec $a107,x
$1a:8c9c  00 a4         brk #$a4
$1a:8c9e  c0 23         cpy #$23
$1a:8ca0  f0 08         beq $8caa
$1a:8ca2  3b            tsc
$1a:8ca3  a0 48         ldy #$48
$1a:8ca5  ed 20 84      sbc $8420
$1a:8ca8  14 42         trb $42
$1a:8caa  8f 80 2b 81   sta $812b80
$1a:8cae  5d b8 ee      eor $eeb8,x
$1a:8cb1  61 61         adc ($61,x)
$1a:8cb3  60            rts
$1a:8cb4  dc 3f cc      jml [$cc3f]
$1a:8cb7  29 69         and #$69
$1a:8cb9  81 1c         sta ($1c,x)
$1a:8cbb  1c 5e b6      trb $b65e
$1a:8cbe  0b            phd
$1a:8cbf  fa            plx
$1a:8cc0  d0 2f         bne $8cf1
$1a:8cc2  f0 0f         beq $8cd3
$1a:8cc4  f8            sed
$1a:8cc5  f4 1f 62      pea $621f
$1a:8cc8  b8            clv
$1a:8cc9  47 c8         eor [$c8]
$1a:8ccb  c3 ff         cmp $ff,s
$1a:8ccd  ef b0 7f 1c   sbc $1c7fb0
$1a:8cd1  32 27         and ($27)
$1a:8cd3  0e ff 40      asl $40ff
$1a:8cd6  df 42 d3 0d   cmp $0dd342,x
$1a:8cda  ec f1 54      cpx $54f1
$1a:8cdd  51 06         eor ($06),y
$1a:8cdf  80 3e         bra $8d1f
$1a:8ce1  84 16         sty $16
$1a:8ce3  00 b0         brk #$b0
$1a:8ce5  e1 ff         sbc ($ff,x)
$1a:8ce7  e2 10         sep #$10
$1a:8ce9  ca            dex
$1a:8cea  8e cf 1f      stx $1fcf
$1a:8ced  82 bf 40      brl $cdaf
$1a:8cf0  7f f0 8e bc   adc $bc8ef0,x
$1a:8cf4  53 77         eor ($77,s),y
$1a:8cf6  82 53 82      brl $0f4c
$1a:8cf9  54 31 90      mvn $90,$31
$1a:8cfc  1b            tcs
$1a:8cfd  e4 13         cpx $13
$1a:8cff  fd 1e fb      sbc $fb1e,x
$1a:8d02  ff fd 7f fb   sbc $fb7ffd,x
$1a:8d06  e8            inx
$1a:8d07  a4 68         ldy $68
$1a:8d09  1c 0e 06      trb $060e
$1a:8d0c  03 c1         ora $c1,s
$1a:8d0e  a0 e0         ldy #$e0
$1a:8d10  50 2c         bvc $8d3e
$1a:8d12  1e 0e 85      asl $850e,x
$1a:8d15  c3 d3         cmp $d3,s
$1a:8d17  31 f7         and ($f7),y
$1a:8d19  4c 34 1e      jmp $1e34
$1a:8d1c  02 b8         cop #$b8
$1a:8d1e  50 3c         bvc $8d5c
$1a:8d20  12 0b         ora ($0b)
$1a:8d22  04 42         tsb $42
$1a:8d24  e1 b8         sbc ($b8,x)
$1a:8d26  fc 76 7f      jsr ($7f76,x)
$1a:8d29  dd 87 f3      cmp $f387,x
$1a:8d2c  aa            tax
$1a:8d2d  8e 49 b6      stx $b649
$1a:8d30  61 5f         adc ($5f,x)
$1a:8d32  6e 01 6d      ror $6d01
$1a:8d35  62 66 47      per $d49e
$1a:8d38  bc c2 bb      ldy $bbc2,x
$1a:8d3b  4c 1b 61      jmp $611b
$1a:8d3e  07 61         ora [$61]
$1a:8d40  57 ff         eor [$ff],y
$1a:8d42  55 55         eor $55,x
$1a:8d44  d5 39         cmp $39,x
$1a:8d46  6a            ror a
$1a:8d47  aa            tax
$1a:8d48  29 17         and #$17
$1a:8d4a  2b            pld
$1a:8d4b  c0 a0         cpy #$a0
$1a:8d4d  d0 2f         bne $8d7e
$1a:8d4f  ce b6 ab      dec $abb6
$1a:8d52  a1 00         lda ($00,x)
$1a:8d54  2b            pld
$1a:8d55  5c 20 8e 70   jml $708e20
$1a:8d59  ac fd be      ldy $befd
$1a:8d5c  21 b0         and ($b0,x)
$1a:8d5e  52 2c         eor ($2c)
$1a:8d60  22 11 1e 8d   jsl $8d1e11
$1a:8d64  4a            lsr a
$1a:8d65  25 9e         and $9e
$1a:8d67  e9 43         sbc #$43
$1a:8d69  bd e0 91      lda $91e0,x
$1a:8d6c  a8            tay
$1a:8d6d  24 a3         bit $a3
$1a:8d6f  ac 0b 06      ldy $060b
$1a:8d72  fb            xce
$1a:8d73  05 bc         ora $bc
$1a:8d75  4f e3 8f 24   eor $248fe3
$1a:8d79  f9 6b cd      sbc $cd6b,y
$1a:8d7c  7e 7c f4      ror $f47c,x
$1a:8d7f  6f a7 bd 5f   adc $5fbda7
$1a:8d83  ec 0f 68      cpx $680f
$1a:8d86  fb            xce
$1a:8d87  7e e0 70      ror $70e0,x
$1a:8d8a  0f fd fe 01   ora $01fefd
$1a:8d8e  e0 f0         cpx #$f0
$1a:8d90  67 de         adc [$de]
$1a:8d92  60            rts
$1a:8d93  ea            nop
$1a:8d94  3f e7 fd e2   and $e2fde7,x
$1a:8d98  1f f8 7c 7d   ora $7d7cf8,x
$1a:8d9c  be f8 1b      ldx $1bf8,y
$1a:8d9f  f4 77 c7      pea $c777
$1a:8da2  cf 98 3c 03   cmp $033c98
$1a:8da6  fd fe 8e      sbc $8efe,x
$1a:8da9  bc 01 da      ldy $da01,x
$1a:8dac  20 20 8f      jsr $8f20
$1a:8daf  ff f9 e0 20   sbc $20e0f9,x
$1a:8db3  80 40         bra $8df5
$1a:8db5  5d c1 10      eor $10c1,x
$1a:8db8  7d 9c 06      adc $069c,x
$1a:8dbb  b1 e2         lda ($e2),y
$1a:8dbd  eb            xba
$1a:8dbe  cd 3e f0      cmp $f03e
$1a:8dc1  8b            phb
$1a:8dc2  f4 07 9b      pea $9b07
$1a:8dc5  c2 e8         rep #$e8
$1a:8dc7  cd e3 50      cmp $50e3
$1a:8dca  c0 10         cpy #$10
$1a:8dcc  0f d3 fd 1e   ora $1efdd3
$1a:8dd0  9e 41 21      stz $2141,x
$1a:8dd3  18            clc
$1a:8dd4  18            clc
$1a:8dd5  0c 06 53      tsb $5306
$1a:8dd8  31 f5         and ($f5),y
$1a:8dda  4d f8 17      eor $17f8
$1a:8ddd  0b            phd
$1a:8dde  07 83         ora [$83]
$1a:8de0  81 40         sta ($40,x)
$1a:8de2  f0 68         beq $8e4c
$1a:8de4  38            sec
$1a:8de5  18            clc
$1a:8de6  0e 07 03      asl $0307
$1a:8de9  b3 fe         lda ($fe,s),y
$1a:8deb  ef fe 37 1f   sbc $1f37fe
$1a:8def  88            dey
$1a:8df0  85 c2         sta $c2
$1a:8df2  41 60         eor ($60,x)
$1a:8df4  2c 01 54      bit $5401
$1a:8df7  0c e1 ff      tsb $ffe1
$1a:8dfa  db            stp
$1a:8dfb  49 3b 6d      eor #$6d3b
$1a:8dfe  ff 3f 4f e7   sbc $e74f3f,x
$1a:8e02  b3 92         lda ($92,s),y
$1a:8e04  b7 9f         lda [$9f],y
$1a:8e06  aa            tax
$1a:8e07  03 06         ora $06,s
$1a:8e09  83 9f         sta $9f,s
$1a:8e0b  ae ab 00      ldx $00ab
$1a:8e0e  d5 6a         cmp $6a,x
$1a:8e10  8f d4 02 0a   sta $0a02d4
$1a:8e14  a8            tay
$1a:8e15  00 0f         brk #$0f
$1a:8e17  d3 59         cmp ($59,s),y
$1a:8e19  84 e8         sty $e8
$1a:8e1b  b5 70         lda $70,x
$1a:8e1d  68            pla
$1a:8e1e  34 12         bit $12,x
$1a:8e20  0c 87 7f      tsb $7f87
$1a:8e23  b5 6f         lda $6f,x
$1a:8e25  e8            inx
$1a:8e26  d6 06         dec $06,x
$1a:8e28  b3 c0         lda ($c0,s),y
$1a:8e2a  25 12         and $12
$1a:8e2c  8e 97 ea      stx $ea97
$1a:8e2f  21 1a         and ($1a,x)
$1a:8e31  82 43 1c      brl $aa77
$1a:8e34  ef d6 fd 41   sbc $41fdd6
$1a:8e38  1e 92 0d      asl $0d92,x
$1a:8e3b  f0 f7         beq $8e34
$1a:8e3d  8b            phb
$1a:8e3e  fc 81 e5      jsr ($e581,x)
$1a:8e41  1f 31 79 cf   ora $cf7931,x
$1a:8e45  d0 9e         bne $8de5
$1a:8e47  95 f5         sta $f5,x
$1a:8e49  37 ad         and [$ad],y
$1a:8e4b  fd 91 ed      sbc $ed91,x
$1a:8e4e  9f 75 74 7e   sta $7e7475,x
$1a:8e52  3f ff ff bb   and $bbffff,x
$1a:8e56  fd d6 b0      sbc $b0d6,x
$1a:8e59  38            sec
$1a:8e5a  1b            tcs
$1a:8e5b  f4 03 24      pea $2403
$1a:8e5e  0f f1 12 ff   ora $ff12f1
$1a:8e62  3f 9e 0f 06   and $060f9e,x
$1a:8e66  03 00         ora $00,s
$1a:8e68  1f 81 be 70   ora $70be81,x
$1a:8e6c  38            sec
$1a:8e6d  0e bc 2a      asl $2abc
$1a:8e70  dd fa 01      cmp $01fa,x
$1a:8e73  42 39         wdm #$39
$1a:8e75  a9 c8 0f      lda #$0fc8
$1a:8e78  be 6f f4      ldx $f46f,y
$1a:8e7b  ff ba d6 05   sbc $05d6ba,x
$1a:8e7f  02 81         cop #$81
$1a:8e81  c1 c2         cmp ($c2,x)
$1a:8e83  e1 07         sbc ($07,x)
$1a:8e85  58            cli
$1a:8e86  4a            lsr a
$1a:8e87  e8            inx
$1a:8e88  19 62 eb      ora $eb62,y
$1a:8e8b  81 e0         sta ($e0,x)
$1a:8e8d  70 07         bvs $8e96
$1a:8e8f  40            rti
$1a:8e90  56 91         lsr $91,x
$1a:8e92  d8            cld
$1a:8e93  0e 40 aa      asl $aa40
$1a:8e96  f1 08         sbc ($08),y
$1a:8e98  44 32 0b      mvp $0b,$32
$1a:8e9b  0e 65 0c      asl $0c65
$1a:8e9e  0d e0 b1      ora $b1e0
$1a:8ea1  08            php
$1a:8ea2  64 32         stz $32
$1a:8ea4  1f 0f 65 cc   ora $cc650f,x
$1a:8ea8  42 41         wdm #$41
$1a:8eaa  60            rts
$1a:8eab  a0 37         ldy #$37
$1a:8ead  07 80         ora [$80]
$1a:8eaf  3c 50 28      bit $2850,x
$1a:8eb2  58            cli
$1a:8eb3  2c 0e b2      bit $b20e
$1a:8eb6  2a            rol a
$1a:8eb7  b5 03         lda $03,x
$1a:8eb9  01 31         ora ($31,x)
$1a:8ebb  b0 47         bcs $8f04
$1a:8ebd  23 e0         and $e0,s
$1a:8ebf  90 85         bcc $8e46
$1a:8ec1  af 94 58 17   lda $175894
$1a:8ec5  1b            tcs
$1a:8ec6  8c 7c 74      sty $747c
$1a:8ec9  20 90 02      jsr $0290
$1a:8ecc  0c 80 a4      tsb $a480
$1a:8ecf  01 80         ora ($80,x)
$1a:8ed1  15 93         ora $93,x
$1a:8ed3  74 34         stz $34,x
$1a:8ed5  1c 00 28      trb $2800
$1a:8ed8  4c 26 05      jmp $0526
$1a:8edb  31 b0         and ($b0),y
$1a:8edd  0a            asl a
$1a:8ede  c8            iny
$1a:8edf  58            cli
$1a:8ee0  0e b0 53      asl $53b0
$1a:8ee3  f9 ff d5      sbc $d5ff,y
$1a:8ee6  01 01         ora ($01,x)
$1a:8ee8  48            pha
$1a:8ee9  94 05         sty $05,x
$1a:8eeb  30 88         bmi $8e75
$1a:8eed  f3 51         sbc ($51,s),y
$1a:8eef  ca            dex
$1a:8ef0  5c d1 de 9f   jml $9fded1
$1a:8ef4  84 17         sty $17
$1a:8ef6  b7 fe         lda [$fe],y
$1a:8ef8  01 7e         ora ($7e,x)
$1a:8efa  80 50         bra $8f4c
$1a:8efc  9e 6a f2      stz $f26a,x
$1a:8eff  07 ef         ora [$ef]
$1a:8f01  a0 da         ldy #$da
$1a:8f03  07 03         ora [$03]
$1a:8f05  24 84         bit $84
$1a:8f07  fe 7f ff      inc $ff7f,x
$1a:8f0a  ff 83 fc 44   sbc $44fc83,x
$1a:8f0e  a1 d0         lda ($d0,x)
$1a:8f10  1b            tcs
$1a:8f11  a0 bf         ldy #$bf
$1a:8f13  d0 66         bne $8f7b
$1a:8f15  1d 0f c7      ora $c70f,x
$1a:8f18  e0 da         cpx #$da
$1a:8f1a  18            clc
$1a:8f1b  0c 02 0d      tsb $0d02
$1a:8f1e  8a            txa
$1a:8f1f  b8            clv
$1a:8f20  1d 0e 07      ora $070e,x
$1a:8f23  00 0d         brk #$0d
$1a:8f25  47 3e         eor [$3e]
$1a:8f27  f8            sed
$1a:8f28  7c 00 d8      jmp ($d800,x)
$1a:8f2b  93 a8         sta ($a8,s),y
$1a:8f2d  3c 3e 04      bit $043e,x
$1a:8f30  ce b8 7c      dec $7cb8
$1a:8f33  3c 2e 00      bit $002e,x
$1a:8f36  6a            ror a
$1a:8f37  e0 16         cpx #$16
$1a:8f39  c0 b8         cpy #$b8
$1a:8f3b  05 c7         ora $c7
$1a:8f3d  66 8b         ror $8b
$1a:8f3f  3c 9a 93      bit $939a,x
$1a:8f42  03 83         ora $83,s
$1a:8f44  c1 61         cmp ($61,x)
$1a:8f46  d0 88         bne $8ed0
$1a:8f48  64 02         stz $02
$1a:8f4a  20 a7 75      jsr $75a7
$1a:8f4d  78            sei
$1a:8f4e  43 e1         eor $e1,s
$1a:8f50  90 c8         bcc $8f1a
$1a:8f52  83 d9         sta $d9,s
$1a:8f54  f0 1c         beq $8f72
$1a:8f56  0a            asl a
$1a:8f57  07 82         ora [$82]
$1a:8f59  41 60         eor ($60,x)
$1a:8f5b  7a            ply
$1a:8f5c  c1 d4         cmp ($d4,x)
$1a:8f5e  0b            phd
$1a:8f5f  21 60         and ($60,x)
$1a:8f61  b0 01         bcs $8f64
$1a:8f63  61 de         adc ($de,x)
$1a:8f65  10 67         bpl $8fce
$1a:8f67  f8            sed
$1a:8f68  41 a1         eor ($a1,x)
$1a:8f6a  90 48         bcc $8fb4
$1a:8f6c  44 22 21      mvp $21,$22
$1a:8f6f  08            php
$1a:8f70  7a            ply
$1a:8f71  93 fc         sta ($fc,s),y
$1a:8f73  07 e4         ora [$e4]
$1a:8f75  03 01         ora $01,s
$1a:8f77  b8            clv
$1a:8f78  46 23         lsr $23
$1a:8f7a  00 52         brk #$52
$1a:8f7c  34 85         bit $85,x
$1a:8f7e  c3 e1         cmp $e1,s
$1a:8f80  18            clc
$1a:8f81  1a            inc a
$1a:8f82  84 09         sty $09
$1a:8f84  2a            rol a
$1a:8f85  c4 f0         cpy $f0
$1a:8f87  49 84 72      eor #$7284
$1a:8f8a  39 06 83      and $8306,y
$1a:8f8d  25 71         and $71
$1a:8f8f  2a            rol a
$1a:8f90  cb            wai
$1a:8f91  1c 76 8c      trb $8c76
$1a:8f94  0e 02 8f      asl $8f02
$1a:8f97  14 70         trb $70
$1a:8f99  b0 41         bcs $8fdc
$1a:8f9b  82 10 78      brl $07ae
$1a:8f9e  bc 3e ff      ldy $ff3e,x
$1a:8fa1  ff 47 9a 8c   sbc $8c9a47,x
$1a:8fa5  df e1 1f 8f   cmp $8f1fe1,x
$1a:8fa9  ff d3 c6 8f   sbc $8fc6d3,x
$1a:8fad  68            pla
$1a:8fae  3b            tsc
$1a:8faf  bc 21 ea      ldy $ea21,x
$1a:8fb2  f7 53         sbc [$53],y
$1a:8fb4  18            clc
$1a:8fb5  04 0a         tsb $0a
$1a:8fb7  ed 80 06      sbc $0680
$1a:8fba  90 3c         bcc $8ff8
$1a:8fbc  3c 0c f7      bit $f70c,x
$1a:8fbf  73 88         adc ($88,s),y
$1a:8fc1  7c 8a e9      jmp ($e98a,x)
$1a:8fc4  f8            sed
$1a:8fc5  fc 13 c3      jsr ($c313,x)
$1a:8fc8  8d c6 c6      sta $c6c6
$1a:8fcb  63 33         adc $33,s
$1a:8fcd  99 c7 7f      sta $7fc7,y
$1a:8fd0  a0 ad         ldy #$ad
$1a:8fd2  9b            txy
$1a:8fd3  01 7c         ora ($7c,x)
$1a:8fd5  47 87         eor [$87]
$1a:8fd7  8c 6e 3c      sty $3c6e
$1a:8fda  7e 3e 3f      ror $3f3e,x
$1a:8fdd  1e 2f f6      asl $f62f,x
$1a:8fe0  f9 ab 40      sbc $40ab,y
$1a:8fe3  aa            tax
$1a:8fe4  c4 ff         cpy $ff
$1a:8fe6  6f 8d fd 3a   adc $3afd8d
$1a:8fea  05 51         ora $51
$1a:8fec  7a            ply
$1a:8fed  93 9c         sta ($9c,s),y
$1a:8fef  0d fe 62      ora $62fe
$1a:8ff2  53 ea         eor ($ea,s),y
$1a:8ff4  17 e1         ora [$e1],y
$1a:8ff6  2f 81 fa 58   and $58fa81
$1a:8ffa  fc 03 e1      jsr ($e103,x)
$1a:8ffd  f0 62         beq $9061
$1a:8fff  f8            sed
$1a:9000  7e af d0      ror $d0af,x
$1a:9003  0a            asl a
$1a:9004  13 cd         ora ($cd,s),y
$1a:9006  5e 40 fd      lsr $fd40,x
$1a:9009  f7 7f         sbc [$7f],y
$1a:900b  87 fc         sta [$fc]
$1a:900d  23 e2         and $e2,s
$1a:900f  2f 19 f9 13   and $13f919
$1a:9013  ca            dex
$1a:9014  be 66 f3      ldx $f366,y
$1a:9017  bf b5 72 03   lda $0372b5,x
$1a:901b  01 54         ora ($54,x)
$1a:901d  ea            nop
$1a:901e  db            stp
$1a:901f  5a            phy
$1a:9020  be 87 f4      ldx $f487,y
$1a:9023  c7 b9         cmp [$b9]
$1a:9025  e2 ff         sep #$ff
$1a:9027  7f 81 c0 c0   adc $c0c081,x
$1a:902b  fe e7 9e      inc $9ee7,x
$1a:902e  07 03         ora [$03]
$1a:9030  e1 f0         sbc ($f0,x)
$1a:9032  9c 4e 05      stz $054e
$1a:9035  3e e7 90      rol $90e7,x
$1a:9038  a8            tay
$1a:9039  46 63         lsr $63
$1a:903b  33 19         and ($19,s),y
$1a:903d  8d 8e c7      sta $c78e
$1a:9040  f7 fb         sbc [$fb],y
$1a:9042  93 fd         sta ($fd,s),y
$1a:9044  ce 3f f3      dec $f33f
$1a:9047  9c 9b fd      stz $fd9b
$1a:904a  01 e9         ora ($e9,x)
$1a:904c  1f 51 1f fb   ora $fb1f51,x
$1a:9050  fd f8 fc      sbc $fcf8,x
$1a:9053  0d 43 c3      ora $c343
$1a:9056  e1 57         sbc ($57,x)
$1a:9058  fb            xce
$1a:9059  9c 46 a0      stz $a046
$1a:905c  a3 09         lda $09,s
$1a:905e  fc fc 26      jsr ($26fc,x)
$1a:9061  03 50         ora $50,s
$1a:9063  19 83 3f      ora $3f83,y
$1a:9066  c9 46         cmp #$46
$1a:9068  9b            txy
$1a:9069  62 53 3d      per $cdbf
$1a:906c  7b            tdc
$1a:906d  c1 e0         cmp ($e0,x)
$1a:906f  03 fb         ora $fb,s
$1a:9071  e2 c4         sep #$c4
$1a:9073  64 29         stz $29
$1a:9075  f1 cb         sbc ($cb),y
$1a:9077  5f a0 14 22   eor $2214a0,x
$1a:907b  9a            txs
$1a:907c  94 80         sty $80,x
$1a:907e  bb            tyx
$1a:907f  e4 ff         cpx $ff
$1a:9081  3f f9 c7 d4   and $d4c7f9,x
$1a:9085  3d 01 59      and $5901,x
$1a:9088  02 c4         cop #$c4
$1a:908a  55 34         eor $34,x
$1a:908c  c1 35         cmp ($35,x)
$1a:908e  0f b6 7d 51   ora $517db6
$1a:9092  50 38         bvc $90cc
$1a:9094  1c 3e 1e      trb $1e3e
$1a:9097  27 01         and [$01]
$1a:9099  3b            tsc
$1a:909a  3d 72 3f      and $3f72,x
$1a:909d  1f 7d 90 34   ora $34907d,x
$1a:90a1  3f df ee 07   and $07eedf,x
$1a:90a5  00 1f         brk #$1f
$1a:90a7  e4 61         cpx $61
$1a:90a9  e0 f0         cpx #$f0
$1a:90ab  78            sei
$1a:90ac  7c 3f 3f      jmp ($3f3f,x)
$1a:90af  9c 6a 08      stz $086a
$1a:90b2  44 18 f2      mvp $f2,$18
$1a:90b5  10 b0         bpl $9067
$1a:90b7  18            clc
$1a:90b8  04 26         tsb $26
$1a:90ba  15 78         ora $78,x
$1a:90bc  de c1 30      dec $30c1,x
$1a:90bf  37 f9         and [$f9],y
$1a:90c1  fd 5e e1      sbc $e15e,x
$1a:90c4  0e 87 5f      asl $5f87
$1a:90c7  ef ef d6 4a   sbc $4ad6ef
$1a:90cb  f5 06         sbc $06,x
$1a:90cd  83 87         sta $87,s
$1a:90cf  c3 84         cmp $84,s
$1a:90d1  d1 5f         cmp ($5f),y
$1a:90d3  e7 f1         sbc [$f1]
$1a:90d5  fc 7e 02      jsr ($027e,x)
$1a:90d8  a8            tay
$1a:90d9  cb            wai
$1a:90da  f5 e3         sbc $e3,x
$1a:90dc  b9 7d ed      lda $ed7d,y
$1a:90df  a3 10         lda $10,s
$1a:90e1  03 fb         ora $fb,s
$1a:90e3  e2 c0         sep #$c0
$1a:90e5  70 2f         bvs $9116
$1a:90e7  f2 07         sbc ($07)
$1a:90e9  94 7c         sty $7c,x
$1a:90eb  c5 e7         cmp $e7
$1a:90ed  3f 42 7a 57   and $577a42,x
$1a:90f1  c0 82         cpy #$82
$1a:90f3  d3 00         cmp ($00,s),y
$1a:90f5  a8            tay
$1a:90f6  61 f0         adc ($f0,x)
$1a:90f8  ea            nop
$1a:90f9  ff 4f ae 1b   sbc $1bae4f,x
$1a:90fd  0d 3c 9e      ora $9e3c
$1a:9100  2e 43 e1      rol $e143
$1a:9103  f0 67         beq $916c
$1a:9105  fa            plx
$1a:9106  7c 2f d0      jmp ($d02f,x)
$1a:9109  0a            asl a
$1a:910a  13 cd         ora ($cd,s),y
$1a:910c  5e 40 fd      lsr $fd40,x
$1a:910f  f7 7f         sbc [$7f],y
$1a:9111  87 fd         sta [$fd]
$1a:9113  3e 50 78      rol $7850,x
$1a:9116  3c 7a 3d      bit $3d7a,x
$1a:9119  04 82         tsb $82
$1a:911b  0a            asl a
$1a:911c  fd 3e 34      sbc $343e,x
$1a:911f  02 78         cop #$78
$1a:9121  e0 30         cpx #$30
$1a:9123  02 48         cop #$48
$1a:9125  27 f0         and [$f0]
$1a:9127  3f cf fe 71   and $71fecf,x
$1a:912b  f4 17 a4      pea $a417
$1a:912e  fd 49 eb      sbc $eb49,x
$1a:9131  5f 70 d3 4b   eor $4bd370,x
$1a:9135  dc 7e f4      jml [$f47e]
$1a:9138  f0 2f         beq $9169
$1a:913a  85 bc         sta $bc
$1a:913c  4f e3 8f 24   eor $248fe3
$1a:9140  f9 6b d1      sbc $d16b,y
$1a:9143  5d 03 81      eor $8103,x
$1a:9146  ff ff e8 ff   sbc $ffe8ff,x
$1a:914a  35 2c         and $2c,x
$1a:914c  3e 1f 3f      rol $3f1f,x
$1a:914f  9f a7 41 5b   sta $5b41a7,x
$1a:9153  e9 e5         sbc #$e5
$1a:9155  4d 93 5d      eor $5d93
$1a:9158  19 fe 70      ora $70fe,y
$1a:915b  f0 07         beq $9164
$1a:915d  9a            txs
$1a:915e  86 02         stx $02
$1a:9160  15 14         ora $14,x
$1a:9162  d8            cld
$1a:9163  47 23         eor [$23]
$1a:9165  80 df         bra $9146
$1a:9167  80 43         bra $91ac
$1a:9169  21 94         and ($94,x)
$1a:916b  ea            nop
$1a:916c  77 7b         adc [$7b],y
$1a:916e  bd 9e cf      lda $cf9e,x
$1a:9171  6d 36 94      adc $9436
$1a:9174  0a            asl a
$1a:9175  00 54         brk #$54
$1a:9177  05 be         ora $be
$1a:9179  04 9c         tsb $9c
$1a:917b  06 03         asl $03
$1a:917d  80 5b         bra $91da
$1a:917f  12 7f         ora ($7f)
$1a:9181  bc 3d 01      ldy $013d,x
$1a:9184  e7 2f         sbc [$2f]
$1a:9186  41 fa         eor ($fa,x)
$1a:9188  53 d4         eor ($d4,s),y
$1a:918a  be b6 f6      ldx $f6b6,y
$1a:918d  3f b6 3d d3   and $d33db6,x
$1a:9191  ef af 05 f8   sbc $f805af
$1a:9195  73 c5         adc ($c5,s),y
$1a:9197  be 5d f2      ldx $f25d,y
$1a:919a  7f 9f fc e3   adc $e3fc9f,x
$1a:919e  e8            inx
$1a:919f  2f 49 fb 0f   and $0ffb49
$1a:91a3  d5 2d         cmp $2d,x
$1a:91a5  0f 87 b3 fd   ora $fdb387
$1a:91a9  61 e0         adc ($e0,x)
$1a:91ab  0f 79 78 8b   ora $8b7879
$1a:91af  e0 10         cpx #$10
$1a:91b1  18            clc
$1a:91b2  08            php
$1a:91b3  9f c1 2b c0   sta $c02bc1,x
$1a:91b7  27 8e         and [$8e]
$1a:91b9  03 00         ora $00,s
$1a:91bb  24 82         bit $82
$1a:91bd  7f 03 fc ff   adc $fffc03,x
$1a:91c1  e7 1f         sbc [$1f]
$1a:91c3  41 7a         eor ($7a,x)
$1a:91c5  4f d4 9e b5   eor $b59ed4
$1a:91c9  f6 37         inc $37,x
$1a:91cb  b5 fd         lda $fd,x
$1a:91cd  d1 ef         cmp ($ef),y
$1a:91cf  9f 05 78 6f   sta $6f7805,x
$1a:91d3  c5 9e         cmp $9e
$1a:91d5  41 f2         eor ($f2,x)
$1a:91d7  77 9f         adc [$9f],y
$1a:91d9  bc e1 ea      ldy $eae1,x
$1a:91dc  0f 49 7a 8f   ora $8f7a49
$1a:91e0  d6 9e         dec $9e,x
$1a:91e2  c5 f6         cmp $f6
$1a:91e4  b7 b9         lda [$b9],y
$1a:91e6  fd f1 e0      sbc $e0f1,x
$1a:91e9  9f 0d 78 af   sta $af780d,x
$1a:91ed  c7 9e         cmp [$9e]
$1a:91ef  4d f3 ef      eor $eff3
$1a:91f2  9b            txy
$1a:91f3  fd 3f e9      sbc $e93f,x
$1a:91f6  1f 51 7a cf   ora $cf7a51,x
$1a:91fa  d8            cld
$1a:91fb  9e d5 f7      stz $f7d5,x
$1a:91fe  37 bd         and [$bd],y
$1a:9200  fc 11 e1      jsr ($e111,x)
$1a:9203  9f 15 78 ef   sta $ef7815,x
$1a:9207  c9 9e         cmp #$9e
$1a:9209  61 f3         adc ($f3,x)
$1a:920b  77 a7         adc [$a7],y
$1a:920d  bd 21 ec      lda $ec21,x
$1a:9210  0f 59 7b 0f   ora $0f7b59
$1a:9214  da            phx
$1a:9215  9e e5 f7      stz $f7e5,x
$1a:9218  b7 81         lda [$81],y
$1a:921a  fc 31 e2      jsr ($e231,x)
$1a:921d  9f 1d 79 2f   sta $2f791d,x
$1a:9221  cb            wai
$1a:9222  9e 6d f4      stz $f46d,x
$1a:9225  ef a3 fd 7f   sbc $7ffda3
$1a:9229  eb            xba
$1a:922a  1f 61 7b 4f   ora $4f7b61,x
$1a:922e  dc 9e f5      jml [$f59e]
$1a:9231  f0 37         beq $926a
$1a:9233  85 fc         sta $fc
$1a:9235  51 e3         eor ($e3),y
$1a:9237  9f 25 79 6f   sta $6f7925,x
$1a:923b  cd 9e 81      cmp $819e
$1a:923e  f4 77 af      pea $af77
$1a:9241  bd 61 ee      lda $ee61,x
$1a:9244  0c 78 14      tsb $1478
$1a:9247  b2 4e         lda ($4e)
$1a:9249  30 d3         bmi $921e
$1a:924b  8d 44 e3      sta $e344
$1a:924e  95 38         sta $38,x
$1a:9250  92 4e         sta ($4e)
$1a:9252  70 d3         bvs $9227
$1a:9254  9f 04 e6 85   sta $85e604,x
$1a:9258  3a            dec a
$1a:9259  d2 4e         cmp ($4e)
$1a:925b  a2 d3         ldx #$d3
$1a:925d  b9 04 ee      lda $ee04,y
$1a:9260  55 3b         eor $3b,x
$1a:9262  9a            txs
$1a:9263  4e ea d3      lsr $d3ea
$1a:9266  bb            tyx
$1a:9267  c4 ef         cpy $ef
$1a:9269  35 3b         and $3b,x
$1a:926b  de 4e e3      dec $e34e,x
$1a:926e  d3 ca         cmp ($ca,s),y
$1a:9270  c4 f3         cpy $f3
$1a:9272  65 3c         adc $3c
$1a:9274  f6 4f         inc $4f,x
$1a:9276  23 d3         and $d3,s
$1a:9278  d9 c4 f6      cmp $f6c4,y
$1a:927b  b5 3d         lda $3d,x
$1a:927d  be 4f 73      ldx $734f,y
$1a:9280  d3 dd         cmp ($dd,s),y
$1a:9282  44 f7 65      mvp $65,$f7
$1a:9285  3d de 4f      and $4fde,x
$1a:9288  78            sei
$1a:9289  d3 d9         cmp ($d9,s),y
$1a:928b  04 fa         tsb $fa
$1a:928d  65 3e         adc $3e
$1a:928f  a2 4f         ldx #$4f
$1a:9291  aa            tax
$1a:9292  d3 eb         cmp ($eb,s),y
$1a:9294  44 fa f5      mvp $f5,$fa
$1a:9297  3e d2 4f      rol $4fd2,x
$1a:929a  b8            clv
$1a:929b  d3 ef         cmp ($ef,s),y
$1a:929d  44 fa 15      mvp $15,$fa
$1a:92a0  3f b2 4f f1   and $f14fb2,x
$1a:92a4  d3 fc         cmp ($fc,s),y
$1a:92a6  c4 ff         cpy $ff
$1a:92a8  45 3f         eor $3f
$1a:92aa  d6 4f         dec $4f,x
$1a:92ac  f6 d3         inc $d3,x
$1a:92ae  fe 04 ff      inc $ff04,x
$1a:92b1  95 3f         sta $3f,x
$1a:92b3  ea            nop
$1a:92b4  4f ea d4 08   eor $08d4ea
$1a:92b8  34 00         bit $00,x
$1a:92ba  a8            tay
$1a:92bb  5a            phy
$1a:92bc  82 92 f4      brl $8751
$1a:92bf  8a            txa
$1a:92c0  4b            phk
$1a:92c1  fc 29 2c      jsr ($2c29,x)
$1a:92c4  9a            txs
$1a:92c5  83 ff         sta $ff,s
$1a:92c7  ff 94 d3 11   sbc $11d394,x
$1a:92cb  41 29         eor ($29,x)
$1a:92cd  a6 c8         ldx $c8
$1a:92cf  f8            sed
$1a:92d0  bd c3 e2      lda $e2c3,x
$1a:92d3  c1 a8         cmp ($a8,x)
$1a:92d5  47 36         eor [$36]
$1a:92d7  bb            tyx
$1a:92d8  50 8a         bvc $9264
$1a:92da  69 a0         adc #$a0
$1a:92dc  4f 2f 0d 3c   eor $3c0d2f
$1a:92e0  be 64 a0      ldx $a064,y
$1a:92e3  c0 ca         cpy #$ca
$1a:92e5  87 5d         sta [$5d]
$1a:92e7  a1 ae         lda ($ae,x)
$1a:92e9  53 0f         eor ($0f,s),y
$1a:92eb  43 80         eor $80,s
$1a:92ed  95 07         sta $07,x
$1a:92ef  fb            xce
$1a:92f0  ff b6 50 59   sbc $5950b6,x
$1a:92f4  25 fe         and $fe
$1a:92f6  67 29         adc [$29]
$1a:92f8  50 19         bvc $9313
$1a:92fa  e8            inx
$1a:92fb  c9 06         cmp #$06
$1a:92fd  7a            ply
$1a:92fe  40            rti
$1a:92ff  9b            txy
$1a:9300  ca            dex
$1a:9301  b9 06 7a      lda $7a06,y
$1a:9304  41 1b         eor ($1b,x)
$1a:9306  cb            wai
$1a:9307  05 6f         ora $6f
$1a:9309  29 4c         and #$4c
$1a:930b  19 e0 73      ora $73e0,y
$1a:930e  06 49         asl $49
$1a:9310  7e 99 cb      ror $cb99,x
$1a:9313  fb            xce
$1a:9314  67 2f         adc [$2f]
$1a:9316  f1 9c         sbc ($9c),y
$1a:9318  ac de 39      ldy $39de
$1a:931b  83 5f         sta $5f,s
$1a:931d  1d b4 b9      ora $b9b4,x
$1a:9320  e5 ca         sbc $ca
$1a:9322  6c 68 6b      jmp ($6b68)
$1a:9325  7f 64 1f e7   adc $e71f64,x
$1a:9329  ff 4c a1 04   sbc $04a14c,x
$1a:932d  d1 16         cmp ($16),y
$1a:932f  81 f0         sta ($f0,x)
$1a:9331  45 a0         eor $a0
$1a:9333  9c 11 68      stz $6811
$1a:9336  cd 04 5a      cmp $5a04
$1a:9339  35 41         and $41,x
$1a:933b  16 87         asl $87,x
$1a:933d  30 45         bmi $9384
$1a:933f  a0 ac         ldy #$ac
$1a:9341  11 68         ora ($68),y
$1a:9343  75 04         adc $04,x
$1a:9345  58            cli
$1a:9346  04 51         tsb $51
$1a:9348  52 cb         eor ($cb)
$1a:934a  9e 27 83      stz $8327,x
$1a:934d  0e 05 65      asl $6505
$1a:9350  04 61         tsb $61
$1a:9352  2c 15 84      bit $8415
$1a:9355  b0 66         bcs $93bd
$1a:9357  12 c1         ora ($c1)
$1a:9359  d8            cld
$1a:935a  42 5b         wdm #$5b
$1a:935c  f3 67         sbc ($67,s),y
$1a:935e  9f 58 40 1f   sta $1f4058,x
$1a:9362  6f fa 44 27   adc $2744fa
$1a:9366  44 01 58      mvp $58,$01
$1a:9369  81 14         sta ($14,x)
$1a:936b  99 e0 b1      sta $b1e0,y
$1a:936e  05 08         ora $08
$1a:9370  13 d1         ora ($d1,s),y
$1a:9372  a6 04         ldx $04
$1a:9374  f4 58 81      pea $8158
$1a:9377  3d 05 e0      and $e005,x
$1a:937a  4f 41 00 13   eor $130041
$1a:937e  d1 9e         cmp ($9e),y
$1a:9380  04 f2         tsb $f2
$1a:9382  17 91         ora [$91],y
$1a:9384  fd 1f 60      sbc $601f,x
$1a:9387  47 06         eor [$06]
$1a:9389  69 33         adc #$33
$1a:938b  c0 aa         cpy #$aa
$1a:938d  8c f0 2e      sty $2ef0
$1a:9390  a3 ac         lda $ac,s
$1a:9392  0d a8 eb      ora $eba8
$1a:9395  03 aa         ora $aa,s
$1a:9397  3a            dec a
$1a:9398  c0 fa         cpy #$fa
$1a:939a  8e b0 75      stx $75b0
$1a:939d  82 e5 10      brl $a485
$1a:93a0  a8            tay
$1a:93a1  eb            xba
$1a:93a2  04 69         tsb $69
$1a:93a4  3a            dec a
$1a:93a5  48            pha
$1a:93a6  16 0d         asl $0d,x
$1a:93a8  1a            inc a
$1a:93a9  84 06         sty $06
$1a:93ab  8d 5a 41      sta $415a
$1a:93ae  bf 16 1c 3d   lda $3d1c16,x
$1a:93b2  e8            inx
$1a:93b3  75 0a         adc $0a,x
$1a:93b5  08            php
$1a:93b6  0d a6 14      ora $14a6
$1a:93b9  20 1b 44      jsr $441b
$1a:93bc  12 03         ora ($03)
$1a:93be  07 7a         ora [$7a]
$1a:93c0  1f 6e 86 23   ora $23866e,x
$1a:93c4  4f b8 a9 45   eor $45a9b8
$1a:93c8  2d 13 a2      and $a213
$1a:93cb  20 c9 e8      jsr $e8c9
$1a:93ce  08            php
$1a:93cf  90 14         bcc $93e5
$1a:93d1  81 15         sta ($15,x)
$1a:93d3  06 20         asl $20
$1a:93d5  45 c2         eor $c2
$1a:93d7  0b            phd
$1a:93d8  24 40         bit $40
$1a:93da  96 89         stx $89,y
$1a:93dc  10 29         bpl $9407
$1a:93de  a1 ae         lda ($ae,x)
$1a:93e0  08            php
$1a:93e1  28            plp
$1a:93e2  73 01         adc ($01,s),y
$1a:93e4  39 22 50      and $5022,y
$1a:93e7  a6 48         ldx $48
$1a:93e9  ba            tsx
$1a:93ea  20 93 d0      jsr $d093
$1a:93ed  e0 18         cpx #$18
$1a:93ef  ca            dex
$1a:93f0  3c 15 e8      bit $e815,x
$1a:93f3  7c 3a 49      jmp ($493a,x)
$1a:93f6  44 15 a9      mvp $a9,$15
$1a:93f9  04 5a         tsb $5a
$1a:93fb  2b            pld
$1a:93fc  ad 16 20      lda $2016
$1a:93ff  f3 45         sbc ($45,s),y
$1a:9401  c8            iny
$1a:9402  3c d1 62      bit $62d1,x
$1a:9405  0c b4 5c      tsb $5cb4
$1a:9408  83 0d         sta $0d,s
$1a:940a  16 20         asl $20,x
$1a:940c  bb            tyx
$1a:940d  45 c8         eor $c8
$1a:940f  2c d1 62      bit $62d1
$1a:9412  03 c3         ora $c3,s
$1a:9414  5c 08 85 19   jml $198508
$1a:9418  61 2f         adc ($2f,x)
$1a:941a  a2 03         ldx #$03
$1a:941c  52 96         eor ($96)
$1a:941e  14 5b         trb $5b
$1a:9420  70 50         bvs $9472
$1a:9422  c7 80         cmp [$80]
$1a:9424  23 4f         and $4f,s
$1a:9426  f7 fc         sbc [$fc],y
$1a:9428  56 c1         lsr $c1,x
$1a:942a  b4 18         ldy $18,x
$1a:942c  80 4c         bra $947a
$1a:942e  01 68         ora ($68,x)
$1a:9430  31 0c         and ($0c),y
$1a:9432  c5 10         cmp $10
$1a:9434  06 50         asl $50
$1a:9436  e8            inx
$1a:9437  06 d2         asl $d2
$1a:9439  89 06         bit #$06
$1a:943b  24 19         bit $19
$1a:943d  54 09 e9      mvn $e9,$09
$1a:9440  d7 2b         cmp [$2b],y
$1a:9442  29 94         and #$94
$1a:9444  04 a8         tsb $a8
$1a:9446  6d 46 58      adc $5846
$1a:9449  19 40 06      ora $0640,y
$1a:944c  5f 22 e0 95   eor $95e022,x
$1a:9450  c9 96         cmp #$96
$1a:9452  05 d4         ora $d4
$1a:9454  41 81         eor ($81,x)
$1a:9456  34 10         bit $10,x
$1a:9458  e8            inx
$1a:9459  4d 00 59      eor $5900
$1a:945c  0c 40 06      tsb $0640
$1a:945f  10 1a         bpl $947b
$1a:9461  2a            rol a
$1a:9462  85 23         sta $23
$1a:9464  aa            tax
$1a:9465  85 a0         sta $a0
$1a:9467  2a            rol a
$1a:9468  04 06         tsb $06
$1a:946a  4b            phk
$1a:946b  72 71         adc ($71)
$1a:946d  92 fd         sta ($fd)
$1a:946f  95 e4         sta $e4,x
$1a:9471  c3 25         cmp $25,s
$1a:9473  38            sec
$1a:9474  02 d0         cop #$d0
$1a:9476  06 16         asl $16
$1a:9478  a5 c2         lda $c2
$1a:947a  e8            inx
$1a:947b  97 0b         sta [$0b],y
$1a:947d  e1 5c         sbc ($5c,x)
$1a:947f  2c 82 8c      bit $8c82
$1a:9482  eb            xba
$1a:9483  c7 48         cmp [$48]
$1a:9485  36 42         rol $42,x
$1a:9487  06 ec         asl $ec
$1a:9489  3a            dec a
$1a:948a  fd 18 1a      sbc $1a18,x
$1a:948d  97 40         sta [$40],y
$1a:948f  a2 e2         ldx #$e2
$1a:9491  68            pla
$1a:9492  cd 90 80      cmp $8090
$1a:9495  9e 0f 3d      stz $3d0f,x
$1a:9498  46 13         lsr $13
$1a:949a  a7 20         lda [$20]
$1a:949c  5c bf 21 72   jml $7221bf
$1a:94a0  c7 28         cmp [$28]
$1a:94a2  e2 54         sep #$54
$1a:94a4  35 80         and $80,x
$1a:94a6  b5 0d         lda $0d,x
$1a:94a8  60            rts
$1a:94a9  35 45         and $45,x
$1a:94ab  98            tya
$1a:94ac  0f 51 66 04   ora $046651
$1a:94b0  54 59 90      mvn $90,$59
$1a:94b3  b4 96         ldy $96,x
$1a:94b5  64 35         stz $35
$1a:94b7  25 99         and $99
$1a:94b9  0f 49 66 44   ora $446649
$1a:94bd  52 75         eor ($75)
$1a:94bf  93 0c         sta ($0c,s),y
$1a:94c1  28            plp
$1a:94c2  c8            iny
$1a:94c3  a5 32         lda $32
$1a:94c5  82 4d 10      brl $a515
$1a:94c8  a4 93         ldy $93
$1a:94ca  28            plp
$1a:94cb  7b            tdc
$1a:94cc  b0 f1         bcs $94bf
$1a:94ce  88            dey
$1a:94cf  a5 76         lda $76
$1a:94d1  06 be         asl $be
$1a:94d3  8e ab 4e      stx $4eab
$1a:94d6  cd 1c 4e      cmp $4e1c
$1a:94d9  4e c0 81      lsr $81c0
$1a:94dc  d2 18         cmp ($18)
$1a:94de  a8            tay
$1a:94df  c3 f6         cmp $f6,s
$1a:94e1  a7 b9         lda [$b9]
$1a:94e3  7d ec a2      adc $a2ec,x
$1a:94e6  56 9a         lsr $9a,x
$1a:94e8  3f 0c 76 14   and $14760c,x
$1a:94ec  90 62         bcc $9550
$1a:94ee  99 40 2a      sta $2a40,y
$1a:94f1  86 50         stx $50
$1a:94f3  0e a2 14      asl $14a2
$1a:94f6  82 a4 85      brl $1a9d
$1a:94f9  21 7b         and ($7b,x)
$1a:94fb  04 d0         tsb $d0
$1a:94fd  8e 42 f6      stx $f642
$1a:9500  12 a1         ora ($a1)
$1a:9502  64 83         stz $83
$1a:9504  a4 91         ldy $91
$1a:9506  07 71         ora [$71]
$1a:9508  57 a9         eor [$a9],y
$1a:950a  06 94         asl $94
$1a:950c  bd 52 23      lda $2352,x
$1a:950f  ee e3 ce      inc $cee3
$1a:9512  d2 16         cmp ($16)
$1a:9514  a8            tay
$1a:9515  77 05         adc [$05],y
$1a:9517  aa            tax
$1a:9518  1b            tcs
$1a:9519  c1 66         cmp ($66,x)
$1a:951b  81 70         sta ($70,x)
$1a:951d  e3 a0         sbc $a0,s
$1a:951f  0c 2e 1e      tsb $1e2e
$1a:9522  34 d2         bit $d2,x
$1a:9524  a6 5b         ldx $5b
$1a:9526  fe 90 53      inc $5390,x
$1a:9529  38            sec
$1a:952a  46 e9         lsr $e9
$1a:952c  2b            pld
$1a:952d  54 9b af      mvn $af,$9b
$1a:9530  15 76         ora $76,x
$1a:9532  d5 3a         cmp $3a,x
$1a:9534  4a            lsr a
$1a:9535  44 8c e0      mvp $e0,$8c
$1a:9538  ee 0b 7a      inc $7a0b
$1a:953b  f0 5b         beq $9598
$1a:953d  25 8b         and $8b
$1a:953f  6f 2b 75 b4   adc $b4752b
$1a:9543  ed 43 1e      sbc $1e43
$1a:9546  94 06         sty $06,x
$1a:9548  8a            txa
$1a:9549  7a            ply
$1a:954a  08            php
$1a:954b  71 e8         adc ($e8),y
$1a:954d  63 b4         adc $b4,s
$1a:954f  58            cli
$1a:9550  33 e8         and ($e8,s),y
$1a:9552  c0 e0         cpy #$e0
$1a:9554  01 4a         ora ($4a,x)
$1a:9556  00 21         brk #$21
$1a:9558  42 e0         wdm #$e0
$1a:955a  81 40         sta ($40,x)
$1a:955c  f9 1a 48      sbc $481a,y
$1a:955f  2e 07 a0      rol $a007
$1a:9562  f9 03 0c      sbc $0c03,y
$1a:9565  12 06         ora ($06)
$1a:9567  92 07         sta ($07)
$1a:9569  90 cc         bcc $9537
$1a:956b  9f e0 39 47   sta $4739e0,x
$1a:956f  f8            sed
$1a:9570  36 48         rol $48,x
$1a:9572  f4 5d 8a      pea $8a5d
$1a:9575  49 4d         eor #$4d
$1a:9577  3e 94 98      rol $9894,x
$1a:957a  29 e8         and #$e8
$1a:957c  e3 d4         sbc $d4,s
$1a:957e  a1 59         lda ($59,x)
$1a:9580  17 c8         ora [$c8],y
$1a:9582  d6 85         dec $85,x
$1a:9584  90 78         bcc $95fe
$1a:9586  84 3d         sty $3d
$1a:9588  b0 75         bcs $95ff
$1a:958a  6a            ror a
$1a:958b  51 ec         eor ($ec),y
$1a:958d  95 e0         sta $e0,x
$1a:958f  81 66         sta ($66,x)
$1a:9591  79 23 59      adc $5923,y
$1a:9594  12 08         ora ($08)
$1a:9596  32 11         and ($11)
$1a:9598  1c 02 d6      trb $d602
$1a:959b  a2 57         ldx #$57
$1a:959d  88            dey
$1a:959e  2a            rol a
$1a:959f  d9 12 0a      cmp $0a12,y
$1a:95a2  b4 fe         ldy $fe,x
$1a:95a4  3c 85 56      bit $5685,x
$1a:95a7  06 b4         asl $b4
$1a:95a9  64 80         stz $80
$1a:95ab  88            dey
$1a:95ac  20 8a 83      jsr $838a
$1a:95af  65 c4         adc $c4
$1a:95b1  0d ad bf      ora $bfad
$1a:95b4  d6 36         dec $36,x
$1a:95b6  86 c9         stx $c9
$1a:95b8  93 42         sta ($42,s),y
$1a:95ba  b2 64         lda ($64)
$1a:95bc  d2 24         cmp ($24)
$1a:95be  99 34 7f      sta $7f34,y
$1a:95c1  26 48         rol $48
$1a:95c3  39 49 52      and $5249,y
$1a:95c6  83 b4         sta $b4,s
$1a:95c8  d8            cld
$1a:95c9  8e 97 c4      stx $c497
$1a:95cc  3a            dec a
$1a:95cd  5f b8 e9 61   eor $61e9b8,x
$1a:95d1  94 b1         sty $b1,x
$1a:95d3  da            phx
$1a:95d4  4f 4c 8b 6e   eor $6e8b4c
$1a:95d8  32 2e         and ($2e)
$1a:95da  98            tya
$1a:95db  c8            iny
$1a:95dc  bd 73 22      lda $2273,x
$1a:95df  c2 29         rep #$29
$1a:95e1  83 b4         sta $b4,s
$1a:95e3  a7 53         lda [$53]
$1a:95e5  16 e5         asl $e5,x
$1a:95e7  10 80         bpl $9569
$1a:95e9  48            pha
$1a:95ea  0a            asl a
$1a:95eb  c2 99         rep #$99
$1a:95ed  26 a8         rol $a8
$1a:95ef  c1 60         cmp ($60,x)
$1a:95f1  70 88         bvs $957b
$1a:95f3  86 d9         stx $d9
$1a:95f5  48            pha
$1a:95f6  50 08         bvc $9600
$1a:95f8  c6 98         dec $98
$1a:95fa  48            pha
$1a:95fb  49 90 d9      eor #$d990
$1a:95fe  09 0a 11      ora #$110a
$1a:9601  08            php
$1a:9602  d1 27         cmp ($27),y
$1a:9604  0e 3c 9c      asl $9c3c
$1a:9607  84 50         sty $50
$1a:9609  40            rti
$1a:960a  22 da 76 79   jsl $7976da
$1a:960e  34 83         bit $83,x
$1a:9610  50 24         bvc $9636
$1a:9612  28            plp
$1a:9613  72 dd         adc ($dd)
$1a:9615  20 cb e5      jsr $e5cb
$1a:9618  4d cc 0e      eor $0ecc
$1a:961b  0a            asl a
$1a:961c  af 0d 4b e0   lda $e04b0d
$1a:9620  95 01         sta $01,x
$1a:9622  b9 5c b2      lda $b25c,y
$1a:9625  cd 58 3e      cmp $3e58
$1a:9628  d2 0d         cmp ($0d)
$1a:962a  bb            tyx
$1a:962b  55 37         eor $37,x
$1a:962d  0d cf 4c      ora $4ccf
$1a:9630  c4 09         cpy $09
$1a:9632  64 89         stz $89
$1a:9634  b0 59         bcs $968f
$1a:9636  8a            txa
$1a:9637  60            rts
$1a:9638  53 8b         eor ($8b,s),y
$1a:963a  f8            sed
$1a:963b  ff 91 dd 14   sbc $14dd91,x
$1a:963f  04 b3         tsb $b3
$1a:9641  84 40         sty $40
$1a:9643  22 4e ae 04   jsl $04ae4e
$1a:9647  84 62         sty $62
$1a:9649  01 c6         ora ($c6,x)
$1a:964b  67 92         adc [$92]
$1a:964d  20 38 e5      jsr $e538
$1a:9650  34 d2         bit $d2,x
$1a:9652  2e 53 68      rol $6853
$1a:9655  f0 5f         beq $96b6
$1a:9657  f1 88         sbc ($88),y
$1a:9659  d9 a7 16      cmp $16a7,y
$1a:965c  80 72         bra $96d0
$1a:965e  19 e7 00      ora $00e7,y
$1a:9661  e4 94         cpx $94
$1a:9663  ce 1c 98      dec $981c
$1a:9666  48            pha
$1a:9667  32 7d         and ($7d)
$1a:9669  8f b7 d6 45   sta $45d6b7
$1a:966d  a7 5d         lda [$5d]
$1a:966f  25 ea         and $ea
$1a:9671  3f ec 2d 53   and $532dec,x
$1a:9675  b2 bc         lda ($bc)
$1a:9677  f2 0e         sbc ($0e)
$1a:9679  b3 02         lda ($02,s),y
$1a:967b  80 4c         bra $96c9
$1a:967d  4b            phk
$1a:967e  03 40         ora $40,s
$1a:9680  e5 0d         sbc $0d
$1a:9682  07 77         ora [$77]
$1a:9684  14 42         trb $42
$1a:9686  64 ed         stz $ed
$1a:9688  24 78         bit $78
$1a:968a  54 8d 44      mvn $44,$8d
$1a:968d  d4 01         pei ($01)
$1a:968f  90 1c         bcc $96ad
$1a:9691  85 a8         sta $a8
$1a:9693  14 16         trb $16
$1a:9695  80 b3         bra $964a
$1a:9697  c1 1e         cmp ($1e,x)
$1a:9699  06 52         asl $52
$1a:969b  66 81         ror $81
$1a:969d  1c 99 a1      trb $a199
$1a:96a0  08            php
$1a:96a1  b9 1c 88      lda $881c,y
$1a:96a4  b2 18         lda ($18)
$1a:96a6  27 68         and [$68]
$1a:96a8  1d 46 01      ora $0146,x
$1a:96ab  64 28         stz $28
$1a:96ad  93 30         sta ($30,s),y
$1a:96af  30 06         bmi $96b7
$1a:96b1  4b            phk
$1a:96b2  81 9c         sta ($9c,x)
$1a:96b4  bc bc 36      ldy $36bc,x
$1a:96b7  64 77         stz $77
$1a:96b9  a7 ff         lda [$ff]
$1a:96bb  08            php
$1a:96bc  64 f6         stz $f6
$1a:96be  17 e1         ora [$e1],y
$1a:96c0  90 e9         bcc $96ab
$1a:96c2  81 6a         sta ($6a,x)
$1a:96c4  7b            tdc
$1a:96c5  94 66         sty $66,x
$1a:96c7  87 94         sta [$94]
$1a:96c9  a2 20 12      ldx #$1220
$1a:96cc  8c 87 49      sty $4987
$1a:96cf  23 f8         and $f8,s
$1a:96d1  c8            iny
$1a:96d2  a0 b8 a8      ldy #$a8b8
$1a:96d5  83 84         sta $84,s
$1a:96d7  61 03         adc ($03,x)
$1a:96d9  f1 8a         sbc ($8a),y
$1a:96db  a0 09 ca      ldy #$ca09
$1a:96de  12 65         ora ($65)
$1a:96e0  68            pla
$1a:96e1  c5 e0         cmp $e0
$1a:96e3  11 a8         ora ($a8),y
$1a:96e5  07 fb         ora [$fb]
$1a:96e7  fe 46 27      inc $2746,x
$1a:96ea  09 43 d5      ora #$d543
$1a:96ed  a1 d0         lda ($d0,x)
$1a:96ef  81 40         sta ($40,x)
$1a:96f1  4b            phk
$1a:96f2  80 5d         bra $9751
$1a:96f4  1a            inc a
$1a:96f5  11 68         ora ($68),y
$1a:96f7  5e 81 e0      lsr $e081,x
$1a:96fa  30 11         bmi $970d
$1a:96fc  ac 68 44      ldy $4468
$1a:96ff  c2 5b         rep #$5b
$1a:9701  11 52         ora ($52),y
$1a:9703  7a            ply
$1a:9704  46 04         lsr $04
$1a:9706  e9 19 d3      sbc #$d319
$1a:9709  c4 6e         cpy $6e
$1a:970b  4f 11 d7 cb   eor $cbd711
$1a:970f  83 d4         sta $d4,s
$1a:9711  30 27         bmi $973a
$1a:9713  50 ce         bvc $96e3
$1a:9715  9e 44 c2      stz $c244,x
$1a:9718  79 28 47      adc $4728,y
$1a:971b  c2 52         rep #$52
$1a:971d  34 08         bit $08,x
$1a:971f  18            clc
$1a:9720  26 31         rol $31
$1a:9722  8e 41 1b      stx $1b41
$1a:9725  02 f4         cop #$f4
$1a:9727  09 60 2c      ora #$2c60
$1a:972a  20 11 16      jsr $1611
$1a:972d  6d 37 ca      adc $ca37
$1a:9730  1c de 11      trb $11de
$1a:9733  f0 40         beq $9775
$1a:9735  25 cd         and $cd
$1a:9737  e1 66         sbc ($66,x)
$1a:9739  62 f0 1f      per $b72c
$1a:973c  04 12         tsb $12
$1a:973e  17 f8         ora [$f8],y
$1a:9740  ff 7f f0 d5   sbc $d5f07f,x
$1a:9744  48            pha
$1a:9745  bb            tyx
$1a:9746  19 e2 2f      ora $2fe2,y
$1a:9749  e0 b7 b9      cpx #$b9b7
$1a:974c  44 5a 36      mvp $36,$5a
$1a:974f  e7 28         sbc [$28]
$1a:9751  aa            tax
$1a:9752  82 40 a5      brl $3c95
$1a:9755  31 f0         and ($f0),y
$1a:9757  40            rti
$1a:9758  da            phx
$1a:9759  e7 10         sbc [$10]
$1a:975b  ae 2b 02      ldx $022b
$1a:975e  07 05         ora [$05]
$1a:9760  88            dey
$1a:9761  0d ca 0b      ora $0bca
$1a:9764  03 52         ora $52,s
$1a:9766  00 c4         brk #$c4
$1a:9768  95 41         sta $41,x
$1a:976a  30 52         bmi $97be
$1a:976c  99 84 15      sta $1584,y
$1a:976f  84 e6         sty $e6
$1a:9771  09 01 34      ora #$3401
$1a:9774  1b            tcs
$1a:9775  03 10         ora $10,s
$1a:9777  26 24         rol $24
$1a:9779  80 a6         bra $9721
$1a:977b  92 81         sta ($81)
$1a:977d  80 87         bra $9706
$1a:977f  bd 8a 16      lda $168a,x
$1a:9782  fc 20 cc      jsr ($cc20,x)
$1a:9785  5f c1 6e 4d   eor $4d6ec1,x
$1a:9789  88            dey
$1a:978a  f3 5e         sbc ($5e,s),y
$1a:978c  01 5c         ora ($5c,x)
$1a:978e  51 01         eor ($01),y
$1a:9790  40            rti
$1a:9791  21 11         and ($11,x)
$1a:9793  05 08         ora $08
$1a:9795  95 c1         sta $c1,x
$1a:9797  d2 09         cmp ($09)
$1a:9799  a2 2f e8      ldx #$e82f
$1a:979c  f8            sed
$1a:979d  16 c0         asl $c0,x
$1a:979f  72 45         adc ($45)
$1a:97a1  b9 c8 17      lda $17c8,y
$1a:97a4  a9 28 62      lda #$6228
$1a:97a7  20 30 3f      jsr $3f30
$1a:97aa  5f f1 32 8b   eor $8b32f1,x
$1a:97ae  86 05         stx $05
$1a:97b0  4c 34 80      jmp $8034
$1a:97b3  00 60         brk #$60
$1a:97b5  14 d1         trb $d1
$1a:97b7  90 8f         bcc $9748
$1a:97b9  80 44         bra $97ff
$1a:97bb  40            rti
$1a:97bc  e2 23         sep #$23
$1a:97be  01 28         ora ($28,x)
$1a:97c0  0b            phd
$1a:97c1  21 08         and ($08,x)
$1a:97c3  01 94         ora ($94,x)
$1a:97c5  42 05         wdm #$05
$1a:97c7  06 05         asl $05
$1a:97c9  04 05         tsb $05
$1a:97cb  16 54         asl $54,x
$1a:97cd  e2 e0         sep #$e0
$1a:97cf  99 c1 16      sta $16c1,y
$1a:97d2  43 12         eor $12,s
$1a:97d4  2e 0b b0      rol $b00b
$1a:97d7  03 a9         ora $a9,s
$1a:97d9  20 12 22      jsr $2212
$1a:97dc  2c 45 a1      bit $a145
$1a:97df  01 53         ora ($53,x)
$1a:97e1  90 b4         bcc $9797
$1a:97e3  a3 e1         lda $e1,s
$1a:97e5  b1 06         lda ($06),y
$1a:97e7  24 19         bit $19
$1a:97e9  a6 30         ldx $30
$1a:97eb  f7 f8         sbc [$f8],y
$1a:97ed  42 04         wdm #$04
$1a:97ef  e0 68 00      cpx #$0068
$1a:97f2  00 46         brk #$46
$1a:97f4  04 e0         tsb $e0
$1a:97f6  69 16         adc #$16
$1a:97f8  10 51         bpl $984b
$1a:97fa  20 11 74      jsr $7411
$1a:97fd  80 da         bra $97d9
$1a:97ff  ce 84 6a      dec $6a84
$1a:9802  13 d8         ora ($d8,s),y
$1a:9804  40            rti
$1a:9805  62 c6 b0      per $48ce
$1a:9808  b5 9e         lda $9e,x
$1a:980a  c0 b4 6d      cpy #$6db4
$1a:980d  40            rti
$1a:980e  07 14         ora [$14]
$1a:9810  1c cc 70      trb $70cc
$1a:9813  98            tya
$1a:9814  52 08         eor ($08)
$1a:9816  d4 61         pei ($61)
$1a:9818  44 37 14      mvp $14,$37
$1a:981b  06 34         asl $34
$1a:981d  74 35         stz $35,x
$1a:981f  88            dey
$1a:9820  1e c2 19      asl $19c2,x
$1a:9823  0b            phd
$1a:9824  88            dey
$1a:9825  c0 21 a2      cpy #$a221
$1a:9828  e0 3e 8c      cpx #$8c3e
$1a:982b  05 02         ora $02
$1a:982d  08            php
$1a:982e  a2 84 a3      ldx #$a384
$1a:9831  c8            iny
$1a:9832  a6 01         ldx $01
$1a:9834  c0 7e 02      cpy #$027e
$1a:9837  65 9f         adc $9f
$1a:9839  41 0a         eor ($0a,x)
$1a:983b  9c 1d 04      stz $041d
$1a:983e  ce 0e 20      dec $200e
$1a:9841  56 0c         lsr $0c,x
$1a:9843  42 11         wdm #$11
$1a:9845  02 a4         cop #$a4
$1a:9847  39 09 de      and $de09,y
$1a:984a  2b            pld
$1a:984b  a1 86         lda ($86,x)
$1a:984d  44 97 60      mvp $60,$97
$1a:9850  2e 00 e0      rol $e000
$1a:9853  08            php
$1a:9854  c1 8e         cmp ($8e,x)
$1a:9856  27 90         and [$90]
$1a:9858  84 42         sty $42
$1a:985a  99 de df      sta $dfde,y
$1a:985d  29 d3         and #$d3
$1a:985f  91 27         sta ($27),y
$1a:9861  4e b4 a5      lsr $a5b4
$1a:9864  3c 92 94      bit $9492,x
$1a:9867  f9 46 00      sbc $0046,y
$1a:986a  80 af         bra $981b
$1a:986c  f9 ff 86      sbc $86ff,y
$1a:986f  2e c2 00      rol $00c2
$1a:9872  4e 07 00      lsr $0007
$1a:9875  38            sec
$1a:9876  00 4c         brk #$4c
$1a:9878  05 b3         ora $b3
$1a:987a  83 14         sta $14,s
$1a:987c  c4 a1         cpy $a1
$1a:987e  ed c0 31      sbc $31c0
$1a:9881  fa            plx
$1a:9882  a0 18 60      ldy #$6018
$1a:9885  a8            tay
$1a:9886  02 b1         cop #$b1
$1a:9888  23 50         and $50,s
$1a:988a  0e 2b 60      asl $602b
$1a:988d  5b            tcd
$1a:988e  07 99         ora [$99]
$1a:9890  3a            dec a
$1a:9891  29 c1         and #$c1
$1a:9893  f3 72         sbc ($72,s),y
$1a:9895  13 62         ora ($62,s),y
$1a:9897  9d 0f b2      sta $b20f,x
$1a:989a  84 94         sty $94
$1a:989c  41 f6         eor ($f6,x)
$1a:989e  54 0a 3f      mvn $3f,$0a
$1a:98a1  fc ea 14      jsr ($14ea,x)
$1a:98a4  f3 aa         sbc ($aa,s),y
$1a:98a6  13 ee         ora ($ee,s),y
$1a:98a8  af 4f ba db   lda $dbba4f
$1a:98ac  d3 a3         cmp ($a3,s),y
$1a:98ae  e8            inx
$1a:98af  50 a7         bvc $9858
$1a:98b1  a1 50         lda ($50,x)
$1a:98b3  9f 85 7a 7e   sta $7e7a85,x
$1a:98b7  1c 1e 9d      trb $9d1e
$1a:98ba  1f 4a 85 3d   ora $3d854a,x
$1a:98be  2a            rol a
$1a:98bf  84 fc         sty $fc
$1a:98c1  ab            plb
$1a:98c2  d3 f2         cmp ($f2,s),y
$1a:98c4  a8            tay
$1a:98c5  19 00 d8      ora $d800,y
$1a:98c8  43 e0         eor $e0,s
$1a:98ca  37 44         and [$44],y
$1a:98cc  20 04 c2      jsr $c204
$1a:98cf  31 a0         and ($a0),y
$1a:98d1  81 40         sta ($40,x)
$1a:98d3  41 e2         eor ($e2,x)
$1a:98d5  47 24         eor [$24]
$1a:98d7  a0 44 21      ldy #$2144
$1a:98da  1b            tcs
$1a:98db  02 49         cop #$49
$1a:98dd  15 08         ora $08,x
$1a:98df  98            tya
$1a:98e0  23 70         and $70,s
$1a:98e2  bd a6 c6      lda $c6a6,x
$1a:98e5  20 62 32      jsr $3262
$1a:98e8  a0 18 8e      ldy #$8e18
$1a:98eb  30 36         bmi $9923
$1a:98ed  13 20         ora ($20,s),y
$1a:98ef  a5 04         lda $04
$1a:98f1  6e 00 b4      ror $b400
$1a:98f4  81 84         sta ($84,x)
$1a:98f6  02 09         cop #$09
$1a:98f8  04 33         tsb $33
$1a:98fa  86 28         stx $28
$1a:98fc  84 26         sty $26
$1a:98fe  c1 b4         cmp ($b4,x)
$1a:9900  23 c8         and $c8,s
$1a:9902  26 18         rol $18
$1a:9904  83 d5         sta $d5,s
$1a:9906  85 c5         sta $c5
$1a:9908  14 04         trb $04
$1a:990a  60            rts
$1a:990b  b5 07         lda $07,x
$1a:990d  c1 15         cmp ($15,x)
$1a:990f  e9 bf         sbc #$bf
$1a:9911  59 8c 32      eor $328c,y
$1a:9914  18            clc
$1a:9915  b8            clv
$1a:9916  05 62         ora $62
$1a:9918  ae bc fc      ldx $fcbc
$1a:991b  f0 55         beq $9972
$1a:991d  5d de 96      eor $96de,x
$1a:9920  44 d9 27      mvp $27,$d9
$1a:9923  26 7f         rol $7f
$1a:9925  3f f0 c8 00   and $00c8f0,x
$1a:9929  94 04         sty $04,x
$1a:992b  60            rts
$1a:992c  83 27         sta $27,s
$1a:992e  21 20         and ($20,x)
$1a:9930  07 21         ora [$21]
$1a:9932  08            php
$1a:9933  11 fa         ora ($fa),y
$1a:9935  00 32         brk #$32
$1a:9937  20 d0 41      jsr $41d0
$1a:993a  0c 4a 01      tsb $014a
$1a:993d  fe 15 1c      inc $1c15,x
$1a:9940  09 00         ora #$00
$1a:9942  30 80         bmi $98c4
$1a:9944  68            pla
$1a:9945  62 cb 62      per $fc13
$1a:9948  5b            tcd
$1a:9949  13 00         ora ($00,s),y
$1a:994b  a0 86 30      ldy #$3086
$1a:994e  80 77         bra $99c7
$1a:9950  58            cli
$1a:9951  83 43         sta $43,s
$1a:9953  74 5a         stz $5a,x
$1a:9955  33 31         and ($31,s),y
$1a:9957  13 08         ora ($08,s),y
$1a:9959  ce 8f 64      dec $648f
$1a:995c  7b            tdc
$1a:995d  02 a8         cop #$a8
$1a:995f  1d 66 7c      ora $7c66,x
$1a:9962  03 b9         ora $b9,s
$1a:9964  42 33         wdm #$33
$1a:9966  45 a3         eor $a3
$1a:9968  44 91 30      mvp $30,$91
$1a:996b  63 06         adc $06,s
$1a:996d  7c 2c 83      jmp ($832c,x)
$1a:9970  90 a1         bcc $9913
$1a:9972  17 c8         ora [$c8],y
$1a:9974  21 dc         and ($dc,x)
$1a:9976  f1 80         sbc ($80),y
$1a:9978  20 5b fc      jsr $fc5b
$1a:997b  22 fc ca 4c   jsl $4ccafc
$1a:997f  73 28         adc ($28,s),y
$1a:9981  61 eb         adc ($eb,x)
$1a:9983  20 2d 0b      jsr $0b2d
$1a:9986  6a            ror a
$1a:9987  a8            tay
$1a:9988  8e 74 a2      stx $a274
$1a:998b  26 c9         rol $c9
$1a:998d  e5 ba         sbc $ba
$1a:998f  c6 52         dec $52
$1a:9991  6f 1a 3e 5b   adc $5b3e1a
$1a:9995  1d 73 29      ora $2973,x
$1a:9998  37 ce         and [$ce],y
$1a:999a  df 1b 10 09   cmp $09101b,x
$1a:999e  37 c0         and [$c0],y
$1a:99a0  9f 51 0f 69   sta $690f51,x
$1a:99a4  94 9e         sty $9e,x
$1a:99a6  a1 2f         lda ($2f,x)
$1a:99a8  a8            tay
$1a:99a9  87 b8         sta [$b8]
$1a:99ab  ca            dex
$1a:99ac  4f 61 e7 d2   eor $d2e761
$1a:99b0  03 de         ora $de,s
$1a:99b2  65 27         adc $27
$1a:99b4  b9 2a 29      lda $292a,y
$1a:99b7  20 49 03      jsr $0349
$1a:99ba  61 1f         adc ($1f,x)
$1a:99bc  84 35         sty $35
$1a:99be  19 3a 6c      ora $6c3a,y
$1a:99c1  e2 50         sep #$50
$1a:99c3  0f f7 fc 94   ora $94fcf7
$1a:99c7  89 01         bit #$01
$1a:99c9  49 06         eor #$06
$1a:99cb  2d 20 4f      and $4f20
$1a:99ce  f0 6d         beq $9a3d
$1a:99d0  0a            asl a
$1a:99d1  5e 52 a2      lsr $a252,x
$1a:99d4  d6 17         dec $17,x
$1a:99d6  01 2d         ora ($2d,x)
$1a:99d8  86 20         stx $20
$1a:99da  e1 28         sbc ($28,x)
$1a:99dc  41 30         eor ($30,x)
$1a:99de  35 6b         and $6b,x
$1a:99e0  23 84         and $84,s
$1a:99e2  01 04         ora ($04,x)
$1a:99e4  96 32         stx $32,y
$1a:99e6  04 da         tsb $da
$1a:99e8  c1 9a         cmp ($9a,x)
$1a:99ea  86 fc         stx $fc
$1a:99ec  25 b0         and $b0
$1a:99ee  c6 1e         dec $1e
$1a:99f0  c6 01         dec $01
$1a:99f2  0c db f8      tsb $f8db
$1a:99f5  e1 02         sbc ($02,x)
$1a:99f7  e3 3f         sbc $3f,s
$1a:99f9  00 10         brk #$10
$1a:99fb  c6 60         dec $60
$1a:99fd  0b            phd
$1a:99fe  25 a7         and $a7
$1a:9a00  b1 48         lda ($48),y
$1a:9a02  22 01 10 49   jsl $491001
$1a:9a06  01 71         ora ($71,x)
$1a:9a08  15 60         ora $60,x
$1a:9a0a  98            tya
$1a:9a0b  1d 04 0a      ora $0a04,x
$1a:9a0e  02 d1         cop #$d1
$1a:9a10  03 59         ora $59,s
$1a:9a12  b4 00         ldy $00,x
$1a:9a14  66 1b         ror $1b
$1a:9a16  03 71         ora $71,s
$1a:9a18  1e 48 48      asl $4848,x
$1a:9a1b  21 10         and ($10,x)
$1a:9a1d  bd bf c9      lda $c9bf,x
$1a:9a20  0e 63 30      asl $3063
$1a:9a23  43 98         eor $98,s
$1a:9a25  e8            inx
$1a:9a26  10 e4         bpl $9a0c
$1a:9a28  d3 08         cmp ($08,s),y
$1a:9a2a  73 b0         adc ($b0,s),y
$1a:9a2c  d9 e5 05      cmp $05e5,y
$1a:9a2f  60            rts
$1a:9a30  84 08         sty $08
$1a:9a32  32 10         and ($10)
$1a:9a34  cc d3 4c      cpy $4cd3
$1a:9a37  61 10         adc ($10,x)
$1a:9a39  48            pha
$1a:9a3a  44 2a 06      mvp $06,$2a
$1a:9a3d  46 15         lsr $15
$1a:9a3f  c0 d0         cpy #$d0
$1a:9a41  c8            iny
$1a:9a42  c3 0c         cmp $0c,s
$1a:9a44  80 42         bra $9a88
$1a:9a46  b8            clv
$1a:9a47  6d e1 63      adc $63e1
$1a:9a4a  0e 0d 94      asl $940d
$1a:9a4d  24 e1         bit $e1
$1a:9a4f  fc 7f c9      jsr ($c97f,x)
$1a:9a52  b3 aa         lda ($aa,s),y
$1a:9a54  5a            phy
$1a:9a55  13 53         ora ($53,s),y
$1a:9a57  b7 50         lda [$50],y
$1a:9a59  25 30         and $30
$1a:9a5b  44 60 11      mvp $11,$60
$1a:9a5e  48            pha
$1a:9a5f  07 f5         ora [$f5]
$1a:9a61  b0 6a         bcs $9acd
$1a:9a63  c1 83         cmp ($83,x)
$1a:9a65  ac 02 13      ldy $1302
$1a:9a68  ca            dex
$1a:9a69  a1 02         lda ($02,x)
$1a:9a6b  46 0f         lsr $0f
$1a:9a6d  02 e5         cop #$e5
$1a:9a6f  70 8a         bvs $99fb
$1a:9a71  61 0d         adc ($0d,x)
$1a:9a73  06 0a         asl $0a
$1a:9a75  0c 61 a1      tsb $a161
$1a:9a78  31 c1         and ($c1),y
$1a:9a7a  06 0a         asl $0a
$1a:9a7c  00 b3         brk #$b3
$1a:9a7e  07 de         ora [$de]
$1a:9a80  86 0b         stx $0b
$1a:9a82  76 83         ror $83,x
$1a:9a84  08            php
$1a:9a85  42 b0         wdm #$b0
$1a:9a87  07 c0         ora [$c0]
$1a:9a89  0f 02 10 42   ora $421002
$1a:9a8d  20 3b b0      jsr $b03b
$1a:9a90  b1 12         lda ($12),y
$1a:9a92  c4 48         cpy $48
$1a:9a94  8e 40 7d      stx $7d40
$1a:9a97  a2 44         ldx #$44
$1a:9a99  5d e2 b0      eor $b0e2,x
$1a:9a9c  00 b9         brk #$b9
$1a:9a9e  43 39         eor $39,s
$1a:9aa0  64 03         stz $03
$1a:9aa2  37 81         and [$81],y
$1a:9aa4  1c e0 9c      trb $9ce0
$1a:9aa7  b2 71         lda ($71)
$1a:9aa9  9f 40 48 70   sta $704840,x
$1a:9aad  37 c8         and [$c8],y
$1a:9aaf  1a            inc a
$1a:9ab0  02 0e         cop #$0e
$1a:9ab2  c6 05         dec $05
$1a:9ab4  98            tya
$1a:9ab5  7f bf e6 10   adc $10e6bf,x
$1a:9ab9  87 98         sta [$98]
$1a:9abb  94 70         sty $70,x
$1a:9abd  30 38         bmi $9af7
$1a:9abf  38            sec
$1a:9ac0  40            rti
$1a:9ac1  03 83         ora $83,s
$1a:9ac3  0a            asl a
$1a:9ac4  04 08         tsb $08
$1a:9ac6  38            sec
$1a:9ac7  55 60         eor $60,x
$1a:9ac9  a5 00         lda $00
$1a:9acb  a8            tay
$1a:9acc  a9 01         lda #$01
$1a:9ace  68            pla
$1a:9acf  22 40 55 02   jsl $025540
$1a:9ad3  94 0b         sty $0b,x
$1a:9ad5  60            rts
$1a:9ad6  95 08         sta $08,x
$1a:9ad8  aa            tax
$1a:9ad9  60            rts
$1a:9ada  5e 40 9d      lsr $9d40,x
$1a:9add  67 40         adc [$40]
$1a:9adf  42 07         wdm #$07
$1a:9ae1  e3 0b         sbc $0b,s
$1a:9ae3  79 83 60      adc $6083,y
$1a:9ae6  01 e0         ora ($e0,x)
$1a:9ae8  dc 06 b0      jml [$b006]
$1a:9aeb  13 4a         ora ($4a,s),y
$1a:9aed  17 07         ora [$07],y
$1a:9aef  80 a3         bra $9a94
$1a:9af1  05 aa         ora $aa
$1a:9af3  0e 51 c1      asl $c151
$1a:9af6  07 41         ora [$41]
$1a:9af8  90 50         bcc $9b4a
$1a:9afa  33 21         and ($21,s),y
$1a:9afc  b5 80         lda $80,x
$1a:9afe  3c 10 f5      bit $f510,x
$1a:9b01  20 2a 06      jsr $062a
$1a:9b04  0f 08 04 09   ora $090408
$1a:9b08  1c 01 a0      trb $a001
$1a:9b0b  ab            plb
$1a:9b0c  0e 53 a0      asl $a053
$1a:9b0f  61 e1         adc ($e1,x)
$1a:9b11  61 43         adc ($43,x)
$1a:9b13  00 34         brk #$34
$1a:9b15  15 41         ora $41,x
$1a:9b17  cb            wai
$1a:9b18  38            sec
$1a:9b19  82 64 44      brl $df80
$1a:9b1c  a0 47         ldy #$47
$1a:9b1e  06 50         asl $50
$1a:9b20  42 20         wdm #$20
$1a:9b22  5c b5 b8 03   jml $03b8b5
$1a:9b26  40            rti
$1a:9b27  64 2f         stz $2f
$1a:9b29  61 87         adc ($87,x)
$1a:9b2b  1d 42 00      ora $0042,x
$1a:9b2e  5d 03 29      eor $2903,x
$1a:9b31  17 41         ora [$41],y
$1a:9b33  ba            tsx
$1a:9b34  2d 73 01      and $0173
$1a:9b37  8b            phb
$1a:9b38  7c 9a c2      jmp ($c29a,x)
$1a:9b3b  e6 37         inc $37
$1a:9b3d  91 80         sta ($80),y
$1a:9b3f  04 05         tsb $05
$1a:9b41  00 14         brk #$14
$1a:9b43  80 3b         bra $9b80
$1a:9b45  fc 01 e0      jsr ($e001,x)
$1a:9b48  b8            clv
$1a:9b49  90 c8         bcc $9b13
$1a:9b4b  a4 61         ldy $61
$1a:9b4d  94 12         sty $12,x
$1a:9b4f  2c a3 1d      bit $1da3
$1a:9b52  88            dey
$1a:9b53  05 8c         ora $8c
$1a:9b55  9b            txy
$1a:9b56  15 88         ora $88,x
$1a:9b58  1a            inc a
$1a:9b59  40            rti
$1a:9b5a  bd a6 e3      lda $e3a6,x
$1a:9b5d  42 86         wdm #$86
$1a:9b5f  0f 5a 16 34   ora $34165a
$1a:9b63  58            cli
$1a:9b64  64 28         stz $28
$1a:9b66  5f 24 73 17   eor $177324,x
$1a:9b6a  c9 30         cmp #$30
$1a:9b6c  4d b5 0a      eor $0ab5
$1a:9b6f  c4 76         cpy $76
$1a:9b71  fa            plx
$1a:9b72  08            php
$1a:9b73  c0 0d         cpy #$0d
$1a:9b75  0c a4 5a      tsb $5aa4
$1a:9b78  07 84         ora [$84]
$1a:9b7a  ee c6 23      inc $23c6
$1a:9b7d  31 91         and ($91),y
$1a:9b7f  81 91         sta ($91,x)
$1a:9b81  ce 67 34      dec $3467
$1a:9b84  ee c6 f8      inc $f8c6
$1a:9b87  1e 31 82      asl $8231,x
$1a:9b8a  42 d1         wdm #$d1
$1a:9b8c  21 88         and ($88,x)
$1a:9b8e  9a            txs
$1a:9b8f  cd 95 61      cmp $6195
$1a:9b92  e2 2f         sep #$2f
$1a:9b94  08            php
$1a:9b95  c8            iny
$1a:9b96  4f 44 8b 1d   eor $1d8b44
$1a:9b9a  04 6d         tsb $6d
$1a:9b9c  52 03         eor ($03)
$1a:9b9e  03 44         ora $44,s
$1a:9ba0  81 1c         sta ($1c,x)
$1a:9ba2  13 65         ora ($65,s),y
$1a:9ba4  42 5c         wdm #$5c
$1a:9ba6  80 c1         bra $9b69
$1a:9ba8  21 a9         and ($a9,x)
$1a:9baa  91 56         sta ($56),y
$1a:9bac  07 06         ora [$06]
$1a:9bae  8e ec 00      stx $00ec
$1a:9bb1  5f bf b4 48   eor $48b4bf,x
$1a:9bb5  c1 34         cmp ($34,x)
$1a:9bb7  92 c0         sta ($c0)
$1a:9bb9  06 92         asl $92
$1a:9bbb  21 0c         and ($0c,x)
$1a:9bbd  7c b6 46      jmp ($46b6,x)
$1a:9bc0  76 62         ror $62,x
$1a:9bc2  60            rts
$1a:9bc3  ad 85 c6      lda $c685
$1a:9bc6  6b            rtl
$1a:9bc7  61 85         adc ($85,x)
$1a:9bc9  42 dc         wdm #$dc
$1a:9bcb  80 97         bra $9b64
$1a:9bcd  03 50         ora $50,s
$1a:9bcf  b9 46 18      lda $1846,y
$1a:9bd2  e5 1f         sbc $1f
$1a:9bd4  e8            inx
$1a:9bd5  7e c4 26      ror $26c4,x
$1a:9bd8  8b            phb
$1a:9bd9  24 60         bit $60
$1a:9bdb  8f 08 92 69   sta $699208
$1a:9bdf  b2 3d         lda ($3d)
$1a:9be1  09 a5         ora #$a5
$1a:9be3  0d 23 a0      ora $a023
$1a:9be6  8d f0 bc      sta $bcf0
$1a:9be9  68            pla
$1a:9bea  b1 3d         lda ($3d),y
$1a:9bec  19 e8 e8      ora $e8e8,y
$1a:9bef  4c d0 85      jmp $85d0
$1a:9bf2  2d 41 d6      and $d641
$1a:9bf5  4a            lsr a
$1a:9bf6  05 6e         ora $6e
$1a:9bf8  81 44         sta ($44,x)
$1a:9bfa  21 9e         and ($9e,x)
$1a:9bfc  15 01         ora $01,x
$1a:9bfe  f0 3c         beq $9c3c
$1a:9c00  69 f3         adc #$f3
$1a:9c02  f1 27         sbc ($27),y
$1a:9c04  42 1a         wdm #$1a
$1a:9c06  8b            phb
$1a:9c07  2f 1c 37 fa   and $fa371c
$1a:9c0b  bf 35 60 c2   lda $c26035,x
$1a:9c0f  fc 8d 09      jsr ($098d,x)
$1a:9c12  4e 0d 19      lsr $190d
$1a:9c15  41 0b         eor ($0b,x)
$1a:9c17  a1 86         lda ($86,x)
$1a:9c19  f1 00         sbc ($00),y
$1a:9c1b  1a            inc a
$1a:9c1c  fd f0 77      sbc $77f0,x
$1a:9c1f  48            pha
$1a:9c20  c3 f3         cmp $f3,s
$1a:9c22  24 92         bit $92
$1a:9c24  83 83         sta $83,s
$1a:9c26  10 2f         bpl $9c57
$1a:9c28  9c 4c 9c      stz $9c4c
$1a:9c2b  5a            phy
$1a:9c2c  d0 a3         bne $9bd1
$1a:9c2e  a8            tay
$1a:9c2f  c3 71         cmp $71,s
$1a:9c31  18            clc
$1a:9c32  f9 68 7c      sbc $7c68,y
$1a:9c35  0c ec 69      tsb $69ec
$1a:9c38  0e 88 bc      asl $bc88
$1a:9c3b  a1 a8         lda ($a8,x)
$1a:9c3d  70 3c         bvs $9c7b
$1a:9c3f  a1 f4         lda ($f4,x)
$1a:9c41  23 42         and $42,s
$1a:9c43  f1 23         sbc ($23),y
$1a:9c45  02 5c         cop #$5c
$1a:9c47  56 a0         lsr $a0,x
$1a:9c49  8b            phb
$1a:9c4a  2e 0c 72      rol $720c
$1a:9c4d  19 88 67      ora $6788,y
$1a:9c50  06 23         asl $23
$1a:9c52  c7 15         cmp [$15]
$1a:9c54  8a            txa
$1a:9c55  b4 0e         ldy $0e,x
$1a:9c57  19 e1 8e      ora $8ee1,y
$1a:9c5a  10 8d         bpl $9be9
$1a:9c5c  5e 3f 15      lsr $153f,x
$1a:9c5f  c8            iny
$1a:9c60  4c e6 90      jmp $90e6
$1a:9c63  d4 40         pei ($40)
$1a:9c65  15 c9         ora $c9,x
$1a:9c67  0e 0e 23      asl $230e
$1a:9c6a  9a            txs
$1a:9c6b  cd bc 5e      cmp $5ebc
$1a:9c6e  1a            inc a
$1a:9c6f  19 9c 61      ora $619c,y
$1a:9c72  58            cli
$1a:9c73  84 fa         sty $fa
$1a:9c75  3a            dec a
$1a:9c76  86 16         stx $16
$1a:9c78  76 21         ror $21,x
$1a:9c7a  78            sei
$1a:9c7b  27 cb         and [$cb]
$1a:9c7d  fa            plx
$1a:9c7e  e9 28         sbc #$28
$1a:9c80  64 35         stz $35
$1a:9c82  0e 25 70      asl $7025
$1a:9c85  57 bc         eor [$bc],y
$1a:9c87  2a            rol a
$1a:9c88  17 0a         ora [$0a],y
$1a:9c8a  54 12 54      mvn $54,$12
$1a:9c8d  16 2a         asl $2a,x
$1a:9c8f  c8            iny
$1a:9c90  15 c0         ora $c0,x
$1a:9c92  f8            sed
$1a:9c93  c1 de         cmp ($de,x)
$1a:9c95  ff f9 0c 88   sbc $880cf9,x
$1a:9c99  49 20         eor #$20
$1a:9c9b  01 93         ora ($93,x)
$1a:9c9d  62 88 c2      per $5f28
$1a:9ca0  37 60         and [$60],y
$1a:9ca2  f1 91         sbc ($91),y
$1a:9ca4  c8            iny
$1a:9ca5  b4 38         ldy $38,x
$1a:9ca7  f9 60 6c      sbc $6c60,y
$1a:9caa  43 41         eor $41,s
$1a:9cac  26 c5         rol $c5
$1a:9cae  e3 06         sbc $06,s
$1a:9cb0  63 fd         adc $fd,s
$1a:9cb2  3d 80 e4      and $e480,x
$1a:9cb5  c5 41         cmp $41
$1a:9cb7  30 f2         bmi $9cab
$1a:9cb9  f9 86 42      sbc $4286,y
$1a:9cbc  34 31         bit $31,x
$1a:9cbe  50 8a         bvc $9c4a
$1a:9cc0  88            dey
$1a:9cc1  82 67 b0      brl $4d2b
$1a:9cc4  11 80         ora ($80),y
$1a:9cc6  a8            tay
$1a:9cc7  71 f2         adc ($f2),y
$1a:9cc9  d0 d0         bne $9c9b
$1a:9ccb  14 54         trb $54
$1a:9ccd  50 62         bvc $9d31
$1a:9ccf  84 20         sty $20
$1a:9cd1  8a            txa
$1a:9cd2  1c b1 a2      trb $a2b1
$1a:9cd5  b0 85         bcs $9c5c
$1a:9cd7  8e 4c e6      stx $e64c
$1a:9cda  09 64         ora #$64
$1a:9cdc  99 1f 86      sta $861f,y
$1a:9cdf  18            clc
$1a:9ce0  2a            rol a
$1a:9ce1  50 02         bvc $9ce5
$1a:9ce3  08            php
$1a:9ce4  c4 de         cpy $de
$1a:9ce6  01 39         ora ($39,x)
$1a:9ce8  e8            inx
$1a:9ce9  2f c3 a2 77   and $77a2c3
$1a:9ced  31 3a         and ($3a),y
$1a:9cef  c6 59         dec $59
$1a:9cf1  e1 1a         sbc ($1a,x)
$1a:9cf3  1b            tcs
$1a:9cf4  14 28         trb $28
$1a:9cf6  4e be 3f      lsr $3fbe
$1a:9cf9  1f 06 38 36   ora $363806,x
$1a:9cfd  28            plp
$1a:9cfe  60            rts
$1a:9cff  dd 86 04      cmp $0486,x
$1a:9d02  e7 2e         sbc [$2e]
$1a:9d04  ec 6f c5      cpx $c56f
$1a:9d07  e1 a3         sbc ($a3,x)
$1a:9d09  d1 fe         cmp ($fe),y
$1a:9d0b  22 f4 7a a4   jsl $a47af4
$1a:9d0f  35 be         and $be,x
$1a:9d11  1e 37 fd      asl $fd37,x
$1a:9d14  42 e1         wdm #$e1
$1a:9d16  41 b0         eor ($b0,x)
$1a:9d18  7f dc 30 56   adc $5630dc,x
$1a:9d1c  0e fa 0d      asl $0dfa
$1a:9d1f  b8            clv
$1a:9d20  70 04         bvs $9d26
$1a:9d22  d8            cld
$1a:9d23  e6 20         inc $20
$1a:9d25  c5 11         cmp $11
$1a:9d27  45 ee         eor $ee
$1a:9d29  3c 2f 21      bit $212f,x
$1a:9d2c  31 e6         and ($e6),y
$1a:9d2e  e2 c0         sep #$c0
$1a:9d30  ee 47 67      inc $6747
$1a:9d33  33 90         and ($90,s),y
$1a:9d35  d0 87         bne $9cbe
$1a:9d37  d2 1a         cmp ($1a)
$1a:9d39  63 1e         adc $1e,s
$1a:9d3b  f4 7a 88      pea $887a
$1a:9d3e  6a            ror a
$1a:9d3f  18            clc
$1a:9d40  04 86         tsb $86
$1a:9d42  53 8e         eor ($8e,s),y
$1a:9d44  62 99 54      per $f1e0
$1a:9d47  0f 06 f0 29   ora $29f006
$1a:9d4b  bb            tyx
$1a:9d4c  0d 51 22      ora $2251
$1a:9d4f  9e 23 21      stz $2123,x
$1a:9d52  21 40         and ($40,x)
$1a:9d54  28            plp
$1a:9d55  a2 06         ldx #$06
$1a:9d57  73 92         adc ($92,s),y
$1a:9d59  ed 31 78      sbc $7831
$1a:9d5c  c6 93         dec $93
$1a:9d5e  2e ce 61      rol $61ce
$1a:9d61  e5 70         sbc $70
$1a:9d63  b7 9b         lda [$9b],y
$1a:9d65  14 08         trb $08
$1a:9d67  1a            inc a
$1a:9d68  35 1e         and $1e,x
$1a:9d6a  8f 33 9a 46   sta $469a33
$1a:9d6e  23 2f         and $2f,s
$1a:9d70  53 8d         eor ($8d,s),y
$1a:9d72  11 03         ora ($03),y
$1a:9d74  8b            phb
$1a:9d75  0d f1 c5      ora $c5f1
$1a:9d78  a6 b3         ldx $b3
$1a:9d7a  68            pla
$1a:9d7b  df f5 e0 00   cmp $00e0f5,x
$1a:9d7f  61 8e         adc ($8e,x)
$1a:9d81  73 b2         adc ($b2,s),y
$1a:9d83  70 c2         bvs $9d47
$1a:9d85  d8            cld
$1a:9d86  71 1e         adc ($1e),y
$1a:9d88  81 42         sta ($42,x)
$1a:9d8a  03 1d         ora $1d,s
$1a:9d8c  1e 86 fa      asl $fa86,x
$1a:9d8f  12 58         ora ($58)
$1a:9d91  71 23         adc ($23),y
$1a:9d93  61 54         adc ($54,x)
$1a:9d95  03 98         ora $98,s
$1a:9d97  38            sec
$1a:9d98  84 55         sty $55
$1a:9d9a  ce 0f e0      dec $e00f
$1a:9d9d  6c 05 f9      jmp ($f905)
$1a:9da0  ac cb 73      ldy $73cb
$1a:9da3  79 dc f1      adc $f1dc,y
$1a:9da6  14 c5         trb $c5
$1a:9da8  f5 21         sbc $21,x
$1a:9daa  17 7a         ora [$7a],y
$1a:9dac  28            plp
$1a:9dad  84 0b         sty $0b
$1a:9daf  a1 96         lda ($96,x)
$1a:9db1  8b            phb
$1a:9db2  3d 06 85      and $8506,x
$1a:9db5  06 81         asl $81
$1a:9db7  22 88 42 19   jsl $194288
$1a:9dbb  59 e4 fb      eor $fbe4,y
$1a:9dbe  57 1b         eor [$1b],y
$1a:9dc0  44 8c f2      mvp $f2,$8c
$1a:9dc3  7b            tdc
$1a:9dc4  3d 80 a7      and $a780,x
$1a:9dc7  01 1e         ora ($1e,x)
$1a:9dc9  5a            phy
$1a:9dca  8d 54 6e      sta $6e54
$1a:9dcd  0b            phd
$1a:9dce  3c 4e 04      bit $044e,x
$1a:9dd1  fe 29 12      inc $1229,x
$1a:9dd4  56 02         lsr $02,x
$1a:9dd6  3c b5 71      bit $71b5,x
$1a:9dd9  8a            txa
$1a:9dda  14 15         trb $15
$1a:9ddc  38            sec
$1a:9ddd  0a            asl a
$1a:9dde  b0 89         bcs $9d69
$1a:9de0  bd 05 1e      lda $1e05,x
$1a:9de3  29 32         and #$32
$1a:9de5  4e 04 f6      lsr $f604
$1a:9de8  1e 12 1c      asl $1c12,x
$1a:9deb  c6 61         dec $61
$1a:9ded  5e 6a 51      lsr $516a,x
$1a:9df0  9f 4f e1 f1   sta $f1e14f,x
$1a:9df4  b6 68         ldx $68,y
$1a:9df6  33 4f         and ($4f,s),y
$1a:9df8  29 47         and #$47
$1a:9dfa  52 84         eor ($84)
$1a:9dfc  f9 70 11      sbc $1170,y
$1a:9dff  36 d0         rol $d0,x
$1a:9e01  67 b3         adc [$b3]
$1a:9e03  99 c0 10      sta $10c0,y
$1a:9e06  01 8e         ora ($8e,x)
$1a:9e08  77 ce         adc [$ce],y
$1a:9e0a  7b            tdc
$1a:9e0b  86 4c         stx $4c
$1a:9e0d  5e 02 f0      lsr $f002,x
$1a:9e10  f0 9c         beq $9dae
$1a:9e12  e2 35         sep #$35
$1a:9e14  0d fe 8f      ora $8ffe
$1a:9e17  c2 17         rep #$17
$1a:9e19  e3 f1         sbc $f1,s
$1a:9e1b  9b            txy
$1a:9e1c  c9 02         cmp #$02
$1a:9e1e  3a            dec a
$1a:9e1f  d8            cld
$1a:9e20  e3 ec         sbc $ec,s
$1a:9e22  87 e1         sta [$e1]
$1a:9e24  0d 3f 94      ora $943f
$1a:9e27  f0 4c         beq $9e75
$1a:9e29  19 48 e0      ora $e048,y
$1a:9e2c  7c 61 8f      jmp ($8f61,x)
$1a:9e2f  91 30         sta ($30),y
$1a:9e31  82 44 04      brl $a278
$1a:9e34  c6 fb         dec $fb
$1a:9e36  20 48 73      jsr $7348
$1a:9e39  d6 80         dec $80,x
$1a:9e3b  34 19         bit $19,x
$1a:9e3d  f0 a0         beq $9ddf
$1a:9e3f  5f 21 e4 f2   eor $f2e421,x
$1a:9e43  6b            rtl
$1a:9e44  68            pla
$1a:9e45  61 41         adc ($41,x)
$1a:9e47  22 89 1c 4a   jsl $4a1c89
$1a:9e4b  01 1a         ora ($1a,x)
$1a:9e4d  78            sei
$1a:9e4e  86 a6         stx $a6
$1a:9e50  76 60         ror $60,x
$1a:9e52  0d 4e 48      ora $484e
$1a:9e55  8a            txa
$1a:9e56  53 c0         eor ($c0,s),y
$1a:9e58  c0 bc 40      cpy #$40bc
$1a:9e5b  0c 40 90      tsb $9040
$1a:9e5e  d4 98         pei ($98)
$1a:9e60  c0 ce 25      cpy #$25ce
$1a:9e63  90 2e         bcc $9e93
$1a:9e65  02 5c         cop #$5c
$1a:9e67  12 e1         ora ($e1)
$1a:9e69  07 28         ora [$28]
$1a:9e6b  00 24         brk #$24
$1a:9e6d  06 a4         asl $a4
$1a:9e6f  6b            rtl
$1a:9e70  19 fa 9c      ora $9cfa,y
$1a:9e73  60            rts
$1a:9e74  28            plp
$1a:9e75  11 8e         ora ($8e),y
$1a:9e77  19 88 52      ora $5288,y
$1a:9e7a  14 78         trb $78
$1a:9e7c  94 45         sty $45,x
$1a:9e7e  8c 29 00      sty $0029
$1a:9e81  82 25 c0      brl $5ea9
$1a:9e84  8c 66 e0      sty $e066
$1a:9e87  8d 27 c6      sta $c627
$1a:9e8a  7d 3d 53      adc $533d,x
$1a:9e8d  01 90         ora ($90,x)
$1a:9e8f  15 47         ora $47,x
$1a:9e91  98            tya
$1a:9e92  2d 0c fa      and $fa0c
$1a:9e95  03 3f         ora $3f,s
$1a:9e97  82 1f 00      brl $9eb9
$1a:9e9a  8a            txa
$1a:9e9b  2b            pld
$1a:9e9c  c2 67         rep #$67
$1a:9e9e  82 5c 12      brl $b0fd
$1a:9ea1  22 96 14 d1   jsl $d11496
$1a:9ea5  e7 33         sbc [$33]
$1a:9ea7  ed 10 50      sbc $5010
$1a:9eaa  0a            asl a
$1a:9eab  94 95         sty $95,x
$1a:9ead  46 1d         lsr $1d
$1a:9eaf  0f 0c 73 11   ora $11730c
$1a:9eb3  88            dey
$1a:9eb4  86 3c         stx $3c
$1a:9eb6  c2 16         rep #$16
$1a:9eb8  f3 0c         sbc ($0c,s),y
$1a:9eba  46 26         lsr $26
$1a:9ebc  4f 00 15 83   eor $831500
$1a:9ec0  c4 80         cpy $80
$1a:9ec2  67 0d         adc [$0d]
$1a:9ec4  7d 93 bc      adc $bc93,x
$1a:9ec7  df 04 03 27   cmp $270304,x
$1a:9ecb  e4 4d         cpx $4d
$1a:9ecd  c2 ec         rep #$ec
$1a:9ecf  ef 47 98 42   sbc $429847
$1a:9ed3  9f 23 0b 7e   sta $7e0b23,x
$1a:9ed7  43 e0         eor $e0,s
$1a:9ed9  3f af 94 f1   and $f194af,x
$1a:9edd  0c 14 46      tsb $4614
$1a:9ee0  6f c1 99 cd   adc $cd99c1
$1a:9ee4  00 22         brk #$22
$1a:9ee6  0a            asl a
$1a:9ee7  00 b3         brk #$b3
$1a:9ee9  cd 66 dc      cmp $dc66
$1a:9eec  30 11         bmi $9eff
$1a:9eee  c3 1e         cmp $1e,s
$1a:9ef0  e4 fc         cpx $fc
$1a:9ef2  1f dc e6 73   ora $73e6dc,x
$1a:9ef6  1f 19 b3 ec   ora $ecb319,x
$1a:9efa  a8            tay
$1a:9efb  d4 58         pei ($58)
$1a:9efd  f7 7c         sbc [$7c],y
$1a:9eff  4a            lsr a
$1a:9f00  a3 70         lda $70,s
$1a:9f02  7e 0a 04      ror $040a,x
$1a:9f05  c2 8b         rep #$8b
$1a:9f07  0d 7e 0d      ora $0d7e
$1a:9f0a  15 24         ora $24,x
$1a:9f0c  20 a0 3b      jsr $3ba0
$1a:9f0f  83 cc         sta $cc,s
$1a:9f11  31 8b         and ($8b),y
$1a:9f13  90 c6         bcc $9edb
$1a:9f15  bf 40 04 6b   lda $6b0440,x
$1a:9f19  91 5d         sta ($5d),y
$1a:9f1b  87 9f         sta [$9f]
$1a:9f1d  ca            dex
$1a:9f1e  ca            dex
$1a:9f1f  09 92 f8      ora #$f892
$1a:9f22  d9 06 cc      cmp $cc06,y
$1a:9f25  16 d1         asl $d1,x
$1a:9f27  3c 87 13      bit $1387,x
$1a:9f2a  e7 6c         sbc [$6c]
$1a:9f2c  a3 a7         lda $a7,s
$1a:9f2e  a4 d8         ldy $d8
$1a:9f30  ae ec 6f      ldx $6fec
$1a:9f33  c4 e9         cpy $e9
$1a:9f35  89 0c a7      bit #$a70c
$1a:9f38  1c fc b7      trb $b7fc
$1a:9f3b  d0 62         bne $9f9f
$1a:9f3d  01 9b         ora ($9b,x)
$1a:9f3f  0b            phd
$1a:9f40  06 6f         asl $6f
$1a:9f42  f7 9e         sbc [$9e],y
$1a:9f44  0d ce ec      ora $ecce
$1a:9f47  62 84 3e      per $ddce
$1a:9f4a  c8            iny
$1a:9f4b  df 02 14 02   cmp $021402,x
$1a:9f4f  69 14 8e      adc #$8e14
$1a:9f52  50 0b         bvc $9f5f
$1a:9f54  28            plp
$1a:9f55  60            rts
$1a:9f56  4a            lsr a
$1a:9f57  14 40         trb $40
$1a:9f59  fc 12 f3      jsr ($f312,x)
$1a:9f5c  1d 98 dc      ora $dc98,x
$1a:9f5f  a0 91 c4      ldy #$c491
$1a:9f62  26 00         rol $00
$1a:9f64  f7 07         sbc [$07],y
$1a:9f66  63 45         adc $45,s
$1a:9f68  2c 86 46      bit $4686
$1a:9f6b  b2 03         lda ($03)
$1a:9f6d  48            pha
$1a:9f6e  29 d4 fc      and #$fcd4
$1a:9f71  2a            rol a
$1a:9f72  54 4c 04      mvn $04,$4c
$1a:9f75  2d 14 3c      and $3c14
$1a:9f78  24 70         bit $70
$1a:9f7a  48            pha
$1a:9f7b  56 a5         lsr $a5,x
$1a:9f7d  0b            phd
$1a:9f7e  85 29         sta $29
$1a:9f80  cb            wai
$1a:9f81  b9 ca 9c      lda $9cca,y
$1a:9f84  8b            phb
$1a:9f85  81 0c         sta ($0c,x)
$1a:9f87  50 c6         bvc $9f4f
$1a:9f89  48            pha
$1a:9f8a  30 cf         bmi $9f5b
$1a:9f8c  bd 44 f1      lda $f144,x
$1a:9f8f  71 23         adc ($23),y
$1a:9f91  79 5c a5      adc $a55c,y
$1a:9f94  1e 37 05      asl $0537,x
$1a:9f97  80 c0         bra $9f59
$1a:9f99  61 e4         adc ($e4,x)
$1a:9f9b  c0 cc 66      cpy #$66cc
$1a:9f9e  74 3f         stz $3f,x
$1a:9fa0  17 7a         ora [$7a],y
$1a:9fa2  cf 5e e1 1b   cmp $1be15e
$1a:9fa6  cc 3e c3      cpy $c33e
$1a:9fa9  45 9b         eor $9b
$1a:9fab  77 ac         adc [$ac],y
$1a:9fad  f2 7a         sbc ($7a)
$1a:9faf  08            php
$1a:9fb0  2d 36 9f      and $9f36
$1a:9fb3  30 ef         bmi $9fa4
$1a:9fb5  59 f4 06      eor $06f4,y
$1a:9fb8  1d 1d 9c      ora $9c1d,x
$1a:9fbb  82 80 14      brl $b43e
$1a:9fbe  0e f4 84      asl $84f4
$1a:9fc1  40            rti
$1a:9fc2  de c1 38      dec $38c1,x
$1a:9fc5  a2 4e 47      ldx #$474e
$1a:9fc8  62 ef 31      per $d1ba
$1a:9fcb  48            pha
$1a:9fcc  4e 5e a3      lsr $a35e
$1a:9fcf  38            sec
$1a:9fd0  8f 12 c5 de   sta $dec512
$1a:9fd4  33 cc         and ($cc,s),y
$1a:9fd6  b7 1a         lda [$1a],y
$1a:9fd8  3d cc 1a      and $1acc,x
$1a:9fdb  90 18         bcc $9ff5
$1a:9fdd  27 d0         and [$d0]
$1a:9fdf  42 79         wdm #$79
$1a:9fe1  18            clc
$1a:9fe2  83 56         sta $56,s
$1a:9fe4  44 11 a8      mvp $a8,$11
$1a:9fe7  1a            inc a
$1a:9fe8  86 12         stx $12
$1a:9fea  ef 0d 76 5e   sbc $5e760d
$1a:9fee  79 3e 9e      adc $9e3e,y
$1a:9ff1  15 04         ora $04,x
$1a:9ff3  76 43         ror $43,x
$1a:9ff5  b0 e2         bcs $9fd9
$1a:9ff7  91 04         sta ($04),y
$1a:9ff9  e2 07         sep #$07
$1a:9ffb  20 3a 8a      jsr $8a3a
$1a:9ffe  24 e1         bit $e1
$1a:a000  67 64         adc [$64]
$1a:a002  ca            dex
$1a:a003  9d 00 c4      sta $c400,x
$1a:a006  09 72 86      ora #$8672
$1a:a009  c3 21         cmp $21,s
$1a:a00b  a8            tay
$1a:a00c  81 a2         sta ($a2,x)
$1a:a00e  18            clc
$1a:a00f  47 fa         eor [$fa]
$1a:a011  62 13 98      per $3827
$1a:a014  35 41         and $41,x
$1a:a016  5e 26 f2      lsr $f226,x
$1a:a019  5b            tcd
$1a:a01a  aa            tax
$1a:a01b  7c 54 00      jmp ($0054,x)
$1a:a01e  7f 26 32 c2   adc $c23226,x
$1a:a022  e1 5f         sbc ($5f,x)
$1a:a024  d5 80         cmp $80,x
$1a:a026  a2 14 96      ldx #$9614
$1a:a029  2b            pld
$1a:a02a  f3 70         sbc ($70,s),y
$1a:a02c  4e 87 35      lsr $3587
$1a:a02f  98            tya
$1a:a030  a1 c6         lda ($c6,x)
$1a:a032  86 e1         stx $e1
$1a:a034  01 82         ora ($82,x)
$1a:a036  47 13         eor [$13]
$1a:a038  23 94         and $94,s
$1a:a03a  8e 51 f4      stx $f451
$1a:a03d  6f 00 cc 3e   adc $3ecc00
$1a:a041  01 ea         ora ($ea,x)
$1a:a043  69 70 d7      adc #$d770
$1a:a046  bf 43 4d a7   lda $a74d43,x
$1a:a04a  00 89         brk #$89
$1a:a04c  6c 1e c7      jmp ($c71e)
$1a:a04f  94 9c         sty $9c,x
$1a:a051  c7 e8         cmp [$e8]
$1a:a053  e1 10         sbc ($10,x)
$1a:a055  cc 07 02      cpy $0207
$1a:a058  07 fd         ora [$fd]
$1a:a05a  80 c2         bra $a01e
$1a:a05c  43 05         eor $05,s
$1a:a05e  45 e3         eor $e3
$1a:a060  d1 d9         cmp ($d9),y
$1a:a062  83 45         sta $45,s
$1a:a064  a3 d1         lda $d1,s
$1a:a066  e1 10         sbc ($10,x)
$1a:a068  9a            txs
$1a:a069  38            sec
$1a:a06a  20 5f 81      jsr $815f
$1a:a06d  0d e1 b7      ora $b7e1
$1a:a070  04 66         tsb $66
$1a:a072  04 22         tsb $22
$1a:a074  0c 14 73      tsb $7314
$1a:a077  c3 39         cmp $39,s
$1a:a079  21 21         and ($21,x)
$1a:a07b  14 df         trb $df
$1a:a07d  63 e1         adc $e1,s
$1a:a07f  a2 fc 48      ldx #$48fc
$1a:a082  46 cc         lsr $cc
$1a:a084  18            clc
$1a:a085  fc f3 2e      jsr ($2ef3,x)
$1a:a088  0c 0f 0c      tsb $0c0f
$1a:a08b  72 72         adc ($72)
$1a:a08d  6f 3a 2b 70   adc $702b3a
$1a:a091  38            sec
$1a:a092  e1 b0         sbc ($b0,x)
$1a:a094  9c c7 cd      stz $cdc7
$1a:a097  a0 d6 4e      ldy #$4ed6
$1a:a09a  3a            dec a
$1a:a09b  60            rts
$1a:a09c  45 60         eor $60
$1a:a09e  77 03         adc [$03],y
$1a:a0a0  68            pla
$1a:a0a1  02 81         cop #$81
$1a:a0a3  58            cli
$1a:a0a4  29 12 cb      and #$cb12
$1a:a0a7  83 01         sta $01,s
$1a:a0a9  9e 06 d0      stz $d006,x
$1a:a0ac  48            pha
$1a:a0ad  9b            txy
$1a:a0ae  e4 8f         cpx $8f
$1a:a0b0  42 df         wdm #$df
$1a:a0b2  03 68         ora $68,s
$1a:a0b4  65 d5         adc $d5
$1a:a0b6  eb            xba
$1a:a0b7  af 45 0a 6c   lda $6c0a45
$1a:a0bb  8d e8 6f      sta $6fe8
$1a:a0be  15 50         ora $50,x
$1a:a0c0  aa            tax
$1a:a0c1  c8            iny
$1a:a0c2  fe 88 22      inc $2288,x
$1a:a0c5  4d 82 6c      eor $6c82
$1a:a0c8  99 24 df      sta $df24,y
$1a:a0cb  8e 1c 72      stx $721c
$1a:a0ce  39 0a c4      and $c40a,y
$1a:a0d1  62 64 f0      per $9138
$1a:a0d4  07 a0         ora [$a0]
$1a:a0d6  48            pha
$1a:a0d7  64 52         stz $52
$1a:a0d9  39 1c 92      and $921c,y
$1a:a0dc  4a            lsr a
$1a:a0dd  f4 08 e6      pea $e608
$1a:a0e0  21 e2         and ($e2,x)
$1a:a0e2  2f 71 94 63   and $639471
$1a:a0e6  80 04         bra $a0ec
$1a:a0e8  fd 17 81      sbc $8117,x
$1a:a0eb  49 b1 40      eor #$40b1
$1a:a0ee  00 0b         brk #$0b
$1a:a0f0  08            php
$1a:a0f1  2c f1 10      bit $10f1
$1a:a0f4  c0 91 4d      cpy #$4d91
$1a:a0f7  db            stp
$1a:a0f8  e0 19 60      cpx #$6019
$1a:a0fb  8a            txa
$1a:a0fc  26 c2         rol $c2
$1a:a0fe  6f 88 c7 cb   adc $cbc788
$1a:a102  5f 81 1f 18   eor $181f81,x
$1a:a106  24 2c         bit $2c
$1a:a108  00 02         brk #$02
$1a:a10a  71 79         adc ($79),y
$1a:a10c  0f 7c 00 18   ora $18007c
$1a:a110  d0 99         bne $a0ab
$1a:a112  f7 3f         sbc [$3f],y
$1a:a114  63 80         adc $80,s
$1a:a116  79 0b c0      adc $c00b,y
$1a:a119  7c f3 29      jmp ($29f3,x)
$1a:a11c  36 2c         rol $2c,x
$1a:a11e  00 10         brk #$10
$1a:a120  a7 80         lda [$80]
$1a:a122  3c 48 6c      bit $6c48,x
$1a:a125  0f 21 98 79   ora $799821
$1a:a129  b1 50         lda ($50),y
$1a:a12b  c4 d8         cpy $d8
$1a:a12d  1a            inc a
$1a:a12e  91 e2         sta ($e2),y
$1a:a130  61 40         adc ($40,x)
$1a:a132  34 8e         bit $8e,x
$1a:a134  23 18         and $18,s
$1a:a136  52 03         eor ($03)
$1a:a138  70 42         bvs $a17c
$1a:a13a  90 27         bcc $a163
$1a:a13c  8b            phb
$1a:a13d  c6 25         dec $25
$1a:a13f  c3 1b         cmp $1b,s
$1a:a141  e7 f2         sbc [$f2]
$1a:a143  cc 8f cb      cpy $cb8f
$1a:a146  30 f2         bmi $a13a
$1a:a148  a9 89 3a      lda #$3a89
$1a:a14b  0f 40 00 00   ora $000040
$1a:a14f  ec 1f 46      cpx $461f
$1a:a152  b6 50         ldx $50,y
$1a:a154  00 11         brk #$11
$1a:a156  85 62         sta $62
$1a:a158  2f 94 56 91   and $915694
$1a:a15c  20 02 c6      jsr $c602
$1a:a15f  f1 43         sbc ($43),y
$1a:a161  70 12         bvs $a175
$1a:a163  40            rti
$1a:a164  8c 30 a2      sty $a230
$1a:a167  30 b6         bmi $a11f
$1a:a169  51 08         eor ($08),y
$1a:a16b  26 70         rol $70
$1a:a16d  44 8b d8      mvp $d8,$8b
$1a:a170  b1 1d         lda ($1d),y
$1a:a172  d8            cld
$1a:a173  df 89 de 49   cmp $49de89,x
$1a:a177  f1 4d         sbc ($4d),y
$1a:a179  82 98 0e      brl $b014
$1a:a17c  a0 fc 0e      ldy #$0efc
$1a:a17f  12 50         ora ($50)
$1a:a181  b1 10         lda ($10),y
$1a:a183  c6 c9         dec $c9
$1a:a185  8d 03 b9      sta $b903
$1a:a188  1d 9c a9      ora $a99c,x
$1a:a18b  07 cc         ora [$cc]
$1a:a18d  65 00         adc $00
$1a:a18f  aa            tax
$1a:a190  e2 3b         sep #$3b
$1a:a192  d1 e5         cmp ($e5),y
$1a:a194  b0 9d         bcs $a133
$1a:a196  03 16         ora $16,s
$1a:a198  8c 19 0c      sty $0c19
$1a:a19b  8a            txa
$1a:a19c  51 8e         eor ($8e),y
$1a:a19e  34 8a         bit $8a,x
$1a:a1a0  d8            cld
$1a:a1a1  94 a2         sty $a2,x
$1a:a1a3  9d 00 01      sta $0100,x
$1a:a1a6  38            sec
$1a:a1a7  45 6c         eor $6c
$1a:a1a9  ef 01 69 0c   sbc $0c6901
$1a:a1ad  28            plp
$1a:a1ae  9f 4d 42 27   sta $27424d,x
$1a:a1b2  c2 58         rep #$58
$1a:a1b4  92 e0         sta ($e0)
$1a:a1b6  b6 75         ldx $75,y
$1a:a1b8  2a            rol a
$1a:a1b9  79 56 ce      adc $ce56,y
$1a:a1bc  97 f5         sta [$f5],y
$1a:a1be  47 ae         eor [$ae]
$1a:a1c0  7d 95 ed      adc $ed95,x
$1a:a1c3  bf 18 04 2e   lda $2e0418,x
$1a:a1c7  14 ef         trb $ef
$1a:a1c9  cf 23 fe a1   cmp $a1fe23
$1a:a1cd  90 d8         bcc $a1a7
$1a:a1cf  64 e4         stz $e4
$1a:a1d1  1f 5c 27 f8   ora $f8275c,x
$1a:a1d5  47 83         eor [$83]
$1a:a1d7  f3 cc         sbc ($cc,s),y
$1a:a1d9  07 89         ora [$89]
$1a:a1db  a8            tay
$1a:a1dc  cd a1 0a      cmp $0aa1
$1a:a1df  35 17         and $17,x
$1a:a1e1  78            sei
$1a:a1e2  3e 26 a2      rol $a226,x
$1a:a1e5  9b            txy
$1a:a1e6  e2 21         sep #$21
$1a:a1e8  83 27         sta $27,s
$1a:a1ea  36 84         rol $84,x
$1a:a1ec  2c 5e b0      bit $b05e
$1a:a1ef  d2 72         cmp ($72)
$1a:a1f1  16 40         asl $40,x
$1a:a1f3  8a            txa
$1a:a1f4  13 7f         ora ($7f,s),y
$1a:a1f6  e8            inx
$1a:a1f7  d5 08         cmp $08,x
$1a:a1f9  a1 0c         lda ($0c,x)
$1a:a1fb  c6 63         dec $63
$1a:a1fd  0a            asl a
$1a:a1fe  70 39         bvs $a239
$1a:a200  03 78         ora $78,s
$1a:a202  79 7c d8      adc $d87c,y
$1a:a205  a2 92 11      ldx #$1192
$1a:a208  4b            phk
$1a:a209  13 e7         ora ($e7,s),y
$1a:a20b  f2 c0         sbc ($c0)
$1a:a20d  24 d8         bit $d8
$1a:a20f  b3 78         lda ($78,s),y
$1a:a211  1b            tcs
$1a:a212  cc a2 38      cpy $38a2
$1a:a215  d9 3c 86      cmp $863c,y
$1a:a218  01 30         ora ($30,x)
$1a:a21a  f2 a8         sbc ($a8)
$1a:a21c  45 00         eor $00
$1a:a21e  25 91         and $91
$1a:a220  46 04         lsr $04
$1a:a222  ca            dex
$1a:a223  4c e6 49      jmp $49e6
$1a:a226  32 04         and ($04)
$1a:a228  f1 32         sbc ($32),y
$1a:a22a  74 78         stz $78,x
$1a:a22c  2b            pld
$1a:a22d  d5 22         cmp $22,x
$1a:a22f  69 c0         adc #$c0
$1a:a231  4f 83 99 14   eor $149983
$1a:a235  06 a1         asl $a1
$1a:a237  09 93         ora #$93
$1a:a239  3d 1b d5      and $d51b,x
$1a:a23c  0b            phd
$1a:a23d  85 3b         sta $3b
$1a:a23f  e7 c3         sbc [$c3]
$1a:a241  39 8f c3      and $c38f,y
$1a:a244  61 8f         adc ($8f,x)
$1a:a246  f9 f0 d1      sbc $d1f0,y
$1a:a249  7b            tdc
$1a:a24a  fe 40 7d      inc $7d40,x
$1a:a24d  70 e3         bvs $a232
$1a:a24f  98            tya
$1a:a250  89 c8         bit #$c8
$1a:a252  7e e3 f8      ror $f8e3,x
$1a:a255  88            dey
$1a:a256  f0 be         beq $a216
$1a:a258  fb            xce
$1a:a259  e5 24         sbc $24
$1a:a25b  ed cc e6      sbc $e6cc
$1a:a25e  84 50         sty $50
$1a:a260  38            sec
$1a:a261  a2 64 53      ldx #$5364
$1a:a264  21 dc         and ($dc,x)
$1a:a266  9a            txs
$1a:a267  cd 8a a0      cmp $a08a
$1a:a26a  85 52         sta $52
$1a:a26c  da            phx
$1a:a26d  11 05         ora ($05),y
$1a:a26f  28            plp
$1a:a270  3f d8 54 dd   and $dd54d8,x
$1a:a274  2a            rol a
$1a:a275  58            cli
$1a:a276  84 a0         sty $a0
$1a:a278  15 07         ora $07,x
$1a:a27a  ce a5 04      dec $04a5
$1a:a27d  c8            iny
$1a:a27e  a9 42         lda #$42
$1a:a280  14 aa         trb $aa
$1a:a282  16 c1         asl $c1,x
$1a:a284  c9 96         cmp #$96
$1a:a286  c5 29         cmp $29
$1a:a288  c7 16         cmp [$16]
$1a:a28a  c1 76         cmp ($76,x)
$1a:a28c  2c 14 39      bit $3914
$1a:a28f  04 35         tsb $35
$1a:a291  6c 58 f9      jmp ($f958)
$1a:a294  6c 92 4a      jmp ($4a92)
$1a:a297  d2 23         cmp ($23)
$1a:a299  d0 1c         bne $a2b7
$1a:a29b  83 17         sta $17,s
$1a:a29d  37 39         and [$39],y
$1a:a29f  12 8c         ora ($8c)
$1a:a2a1  14 c4         trb $c4
$1a:a2a3  8a            txa
$1a:a2a4  04 08         tsb $08
$1a:a2a6  79 93 61      adc $6193,y
$1a:a2a9  8d 3c 8a      sta $8a3c
$1a:a2ac  4c d3 40      jmp $40d3
$1a:a2af  69 05         adc #$05
$1a:a2b1  50 5f         bvc $a312
$1a:a2b3  bc e8 90      ldy $90e8,x
$1a:a2b6  c5 e3         cmp $e3
$1a:a2b8  52 85         eor ($85)
$1a:a2ba  30 42         bmi $a2fe
$1a:a2bc  8a            txa
$1a:a2bd  64 30         stz $30
$1a:a2bf  29 40         and #$40
$1a:a2c1  6d 8c c9      adc $c98c
$1a:a2c4  2a            rol a
$1a:a2c5  69 70         adc #$70
$1a:a2c7  28            plp
$1a:a2c8  82 f4 0c      brl $afbf
$1a:a2cb  42 5c         wdm #$5c
$1a:a2cd  15 18         ora $18,x
$1a:a2cf  48            pha
$1a:a2d0  d4 a2         pei ($a2)
$1a:a2d2  f3 35         sbc ($35,s),y
$1a:a2d4  80 a7         bra $a27d
$1a:a2d6  40            rti
$1a:a2d7  c4 29         cpy $29
$1a:a2d9  31 24         and ($24),y
$1a:a2db  a2 74 0b      ldx #$0b74
$1a:a2de  80 5c         bra $a33c
$1a:a2e0  10 62         bpl $a344
$1a:a2e2  01 09         ora ($09,x)
$1a:a2e4  e0 80 c7      cpx #$c780
$1a:a2e7  2e 18 28      rol $2818
$1a:a2ea  cf 82 72 05   cmp $057282
$1a:a2ee  e8            inx
$1a:a2ef  3c 45 60      bit $6045,x
$1a:a2f2  10 b0         bpl $a2a4
$1a:a2f4  61 8d         adc ($8d,x)
$1a:a2f6  54 84 40      mvn $40,$84
$1a:a2f9  c2 1f         rep #$1f
$1a:a2fb  99 49 52      sta $5249,y
$1a:a2fe  62 08 01      per $a409
$1a:a301  38            sec
$1a:a302  91 8c         sta ($8c),y
$1a:a304  d2 86         cmp ($86)
$1a:a306  01 0b         ora ($0b,x)
$1a:a308  08            php
$1a:a309  c1 41         cmp ($41,x)
$1a:a30b  88            dey
$1a:a30c  f0 11         beq $a31f
$1a:a30e  a9 18         lda #$18
$1a:a310  04 18         tsb $18
$1a:a312  a7 73         lda [$73]
$1a:a314  05 02         ora $02
$1a:a316  f4 1a c2      pea $c21a
$1a:a319  60            rts
$1a:a31a  46 68         lsr $68
$1a:a31c  2d 4b 1a      and $1a4b
$1a:a31f  d2 08         cmp ($08)
$1a:a321  02 d9         cop #$d9
$1a:a323  5b            tcd
$1a:a324  82 dc 17      brl $bb03
$1a:a327  38            sec
$1a:a328  b1 9d         lda ($9d),y
$1a:a32a  af ee 8f 77   lda $778fee
$1a:a32e  a4 9b         ldy $9b
$1a:a330  17 8c         ora [$8c],y
$1a:a332  15 02         ora $02,x
$1a:a334  d4 9d         pei ($9d)
$1a:a336  eb            xba
$1a:a337  30 f2         bmi $a32b
$1a:a339  f9 b1 58      sbc $58b1,y
$1a:a33c  96 29         stx $29,y
$1a:a33e  3d e0 26      and $26e0,x
$1a:a341  06 d0         asl $d0
$1a:a343  7a            ply
$1a:a344  d6 2b         dec $2b,x
$1a:a346  1f 2d 92 bb   ora $bb922d,x
$1a:a34a  de 43 22      dec $2243,x
$1a:a34d  94 63         sty $63,x
$1a:a34f  b1 03         lda ($03),y
$1a:a351  49 11         eor #$11
$1a:a353  01 a1         ora ($a1,x)
$1a:a355  49 31         eor #$31
$1a:a357  fd 5a 02      sbc $025a,x
$1a:a35a  b0 49         bcs $a3a5
$1a:a35c  32 14         and ($14)
$1a:a35e  16 ab         asl $ab,x
$1a:a360  9c 0c 4b      stz $4b0c
$1a:a363  20 01 32      jsr $3201
$1a:a366  89 00         bit #$00
$1a:a368  24 60         bit $60
$1a:a36a  97 64         sta [$64],y
$1a:a36c  91 40         sta ($40),y
$1a:a36e  5e 78 a7      lsr $a778,x
$1a:a371  c9 0c         cmp #$0c
$1a:a373  a4 86         ldy $86
$1a:a375  0e f3 ea      asl $eaf3
$1a:a378  92 a0         sta ($a0)
$1a:a37a  70 f2         bvs $a36e
$1a:a37c  37 10         and [$10],y
$1a:a37e  10 85         bpl $a305
$1a:a380  51 8f         eor ($8f),y
$1a:a382  5f 03 78 5f   eor $5f7803,x
$1a:a386  c5 1e         cmp $1e
$1a:a388  39 f2 57      and $57f2,y
$1a:a38b  96 fa         stx $fa,y
$1a:a38d  03 03         ora $03,s
$1a:a38f  84 aa         sty $aa
$1a:a391  6f a9 39 9c   adc $9c39a9
$1a:a395  9b            txy
$1a:a396  f2 3d         sbc ($3d)
$1a:a398  1e 54 dc      asl $dc54,x
$1a:a39b  f1 38         sbc ($38),y
$1a:a39d  08            php
$1a:a39e  fd 9f 17      sbc $179f,x
$1a:a3a1  ef 2f 97 4f   sbc $4f972f
$1a:a3a5  61 f4         adc ($f4,x)
$1a:a3a7  3a            dec a
$1a:a3a8  85 fb         sta $fb
$1a:a3aa  46 87         lsr $87
$1a:a3ac  51 b0         eor ($b0),y
$1a:a3ae  4e 2f 79      lsr $792f
$1a:a3b1  f8            sed
$1a:a3b2  13 c2         ora ($c2,s),y
$1a:a3b4  78            sei
$1a:a3b5  7d 01 20      adc $2001,x
$1a:a3b8  f5 0f         sbc $0f,x
$1a:a3ba  d0 8d         bne $a349
$1a:a3bc  01 a0         ora ($a0,x)
$1a:a3be  f5 11         sbc $11,x
$1a:a3c0  d1 88         cmp ($88),y
$1a:a3c2  22 20 ee 21   jsl $21ee20
$1a:a3c6  58            cli
$1a:a3c7  88            dey
$1a:a3c8  61 22         adc ($22,x)
$1a:a3ca  f1 10         sbc ($10),y
$1a:a3cc  b2 20         lda ($20)
$1a:a3ce  63 31         adc $31,s
$1a:a3d0  81 37         sta ($37,x)
$1a:a3d2  34 81         bit $81,x
$1a:a3d4  a4 31         ldy $31
$1a:a3d6  be 7f 30      ldx $307f,y
$1a:a3d9  4f d1 7e 9c   eor $9c7ed1
$1a:a3dd  f5 6f         sbc $6f,x
$1a:a3df  af bd 9f ee   lda $ee9fbd
$1a:a3e3  0f 74 2f f5   ora $f52f74
$1a:a3e7  d1 b0         cmp ($b0),y
$1a:a3e9  b7 42         lda [$42],y
$1a:a3eb  49 b1         eor #$b1
$1a:a3ed  44 43 c6      mvp $c6,$43
$1a:a3f0  c9 c9         cmp #$c9
$1a:a3f2  4a            lsr a
$1a:a3f3  10 12         bpl $a407
$1a:a3f5  b8            clv
$1a:a3f6  42 f1         wdm #$f1
$1a:a3f8  3e 79 91      rol $9179,x
$1a:a3fb  29 24         and #$24
$1a:a3fd  32 9c         and ($9c)
$1a:a3ff  71 50         adc ($50),y
$1a:a401  71 18         adc ($18),y
$1a:a403  99 39 8c      sta $8c39,y
$1a:a406  01 67         ora ($67,x)
$1a:a408  28            plp
$1a:a409  18            clc
$1a:a40a  80 48         bra $a454
$1a:a40c  86 ce         stx $ce
$1a:a40e  e8            inx
$1a:a40f  8f fb a1 08   sta $08a1fb
$1a:a413  4a            lsr a
$1a:a414  5e 17 42      lsr $4217,x
$1a:a417  63 02         adc $02,s
$1a:a419  41 0c         eor ($0c,x)
$1a:a41b  32 57         and ($57)
$1a:a41d  9b            txy
$1a:a41e  15 0b         ora $0b,x
$1a:a420  31 d8         and ($d8),y
$1a:a422  40            rti
$1a:a423  61 41         adc ($41,x)
$1a:a425  70 33         bvs $a45a
$1a:a427  40            rti
$1a:a428  c0 44 c2      cpy #$c244
$1a:a42b  66 87         ror $87
$1a:a42d  87 b0         sta [$b0]
$1a:a42f  3d a3 ee      and $eea3,x
$1a:a432  2a            rol a
$1a:a433  03 07         ora $07,s
$1a:a435  00 15         brk #$15
$1a:a437  80 3b         bra $a474
$1a:a439  fc 01 e1      jsr ($e101,x)
$1a:a43c  1f 11 78 cf   ora $cf7811,x
$1a:a440  c8            iny
$1a:a441  9e 55 f3      stz $f355,x
$1a:a444  37 9d         and [$9d],y
$1a:a446  fd 11 e9      sbc $e911,x
$1a:a449  9f 55 7a ef   sta $ef7a55,x
$1a:a44d  d9 9e dd      cmp $dd9e,y
$1a:a450  f8            sed
$1a:a451  05 36         ora $36
$1a:a453  73 38         adc ($38,s),y
$1a:a455  a0 46 62      ldy #$6246
$1a:a458  11 88         ora ($88),y
$1a:a45a  d4 62         pei ($62)
$1a:a45c  71 18         adc ($18),y
$1a:a45e  7a            ply
$1a:a45f  0c 4a 01      tsb $014a
$1a:a462  45 9c         eor $9c
$1a:a464  4e 69 11      lsr $1169
$1a:a467  18            clc
$1a:a468  c4 42         cpy $42
$1a:a46a  25 d8         and $d8
$1a:a46c  ec f6 80      cpx $80f6
$1a:a46f  83 1a         sta $1a,s
$1a:a471  77 bf         adc [$bf],y
$1a:a473  83 c3         sta $c3,s
$1a:a475  e0 7d 96      cpx #$967d
$1a:a478  e2 22         sep #$22
$1a:a47a  01 5e         ora ($5e,x)
$1a:a47c  de ff b6      dec $b6ff,x
$1a:a47f  0b            phd
$1a:a480  2d c4 65      and $65c4
$1a:a483  e2 be         sep #$be
$1a:a485  3f 17 8c 37   and $378c17,x
$1a:a489  52 59         eor ($59)
$1a:a48b  54 06 55      mvn $55,$06
$1a:a48e  24 22         bit $22
$1a:a490  88            dey
$1a:a491  bc e7 d2      ldy $d2e7,x
$1a:a494  19 04 06      ora $0604,y
$1a:a497  03 a6         ora $a6,s
$1a:a499  80 c2         bra $a45d
$1a:a49b  0a            asl a
$1a:a49c  a1 a6         lda ($a6,x)
$1a:a49e  db            stp
$1a:a49f  66 00         ror $00
$1a:a4a1  23 6a         and $6a,s
$1a:a4a3  2b            pld
$1a:a4a4  86 9c         stx $9c
$1a:a4a6  ae 05 71      ldx $7105
$1a:a4a9  84 40         sty $40
$1a:a4ab  60            rts
$1a:a4ac  1b            tcs
$1a:a4ad  6c d6 ea      jmp ($ead6)
$1a:a4b0  81 17         sta ($17,x)
$1a:a4b2  b7 15         lda [$15],y
$1a:a4b4  c2 10         rep #$10
$1a:a4b6  75 03         adc $03,x
$1a:a4b8  38            sec
$1a:a4b9  5b            tcd
$1a:a4ba  cd c0 df      cmp $dfc0
$1a:a4bd  0d c5 22      ora $22c5
$1a:a4c0  81 1d         sta ($1d,x)
$1a:a4c2  36 81         rol $81,x
$1a:a4c4  f4 0e c3      pea $c30e
$1a:a4c7  01 8a         ora ($8a,x)
$1a:a4c9  b7 c4         lda [$c4],y
$1a:a4cb  be 14 88      ldx $8814,y
$1a:a4ce  bc 4d 12      ldy $124d,x
$1a:a4d1  5a            phy
$1a:a4d2  63 38         adc $38,s
$1a:a4d4  b7 cb         lda [$cb],y
$1a:a4d6  71 40         adc ($40),y
$1a:a4d8  88            dey
$1a:a4d9  ce 8c 80      dec $808c
$1a:a4dc  59 08 9c      eor $9c08,y
$1a:a4df  52 27         eor ($27)
$1a:a4e1  16 4f         asl $4f,x
$1a:a4e3  9d 22 33      sta $3322,x
$1a:a4e6  38            sec
$1a:a4e7  8b            phb
$1a:a4e8  9b            txy
$1a:a4e9  42 2d         wdm #$2d
$1a:a4eb  1b            tcs
$1a:a4ec  8e 46 df      stx $df46
$1a:a4ef  c0 8f 38      cpy #$388f
$1a:a4f2  8c e6 23      sty $23e6
$1a:a4f5  6a            ror a
$1a:a4f6  b5 c4         lda $c4,x
$1a:a4f8  9e a0 0d      stz $0da0,x
$1a:a4fb  15 79         ora $79,x
$1a:a4fd  ad 42 33      lda $3342
$1a:a500  6a            ror a
$1a:a501  8a            txa
$1a:a502  bd c1 f8      lda $f8c1,x
$1a:a505  4b            phk
$1a:a506  f4 63 04      pea $0463
$1a:a509  76 2a         ror $2a,x
$1a:a50b  ca            dex
$1a:a50c  3a            dec a
$1a:a50d  4d 04 6a      eor $6a04
$1a:a510  14 66         trb $66
$1a:a512  79 bd 12      adc $12bd,y
$1a:a515  83 49         sta $49,s
$1a:a517  66 05         ror $05
$1a:a519  39 e9 2e      and $2ee9,y
$1a:a51c  ff 00 7b 70   sbc $707b00,x
$1a:a520  77 21         adc [$21],y
$1a:a522  48            pha
$1a:a523  af 88 06 34   lda $340688
$1a:a527  34 98         bit $98,x
$1a:a529  a8            tay
$1a:a52a  c3 6d         cmp $6d,s
$1a:a52c  62 01 cc      per $7130
$1a:a52f  ed c2 91      sbc $91c2
$1a:a532  16 a0         asl $a0,x
$1a:a534  ee f3 46      inc $46f3
$1a:a537  49 0f         eor #$0f
$1a:a539  01 8e         ora ($8e,x)
$1a:a53b  81 84         sta ($84,x)
$1a:a53d  54 90 d9      mvn $d9,$90
$1a:a540  a4 35         ldy $35
$1a:a542  1f c8 0d 80   ora $800dc8,x
$1a:a546  24 35         bit $35
$1a:a548  9d ee ef      sta $efee,x
$1a:a54b  7f f8 43 d7   adc $d743f8,x
$1a:a54f  63 6c         adc $6c,s
$1a:a551  b6 db         ldx $db,y
$1a:a553  54 75 68      mvn $68,$75
$1a:a556  80 8d         bra $a4e5
$1a:a558  42 d2         wdm #$d2
$1a:a55a  a3 9b         lda $9b,s
$1a:a55c  56 9a         lsr $9a,x
$1a:a55e  dd 01 b5      cmp $b501,x
$1a:a561  a8            tay
$1a:a562  e6 3a         inc $3a
$1a:a564  35 18         and $18,x
$1a:a566  b2 8e         lda ($8e)
$1a:a568  62 f1 38      per $de5c
$1a:a56b  a4 5a         ldy $5a
$1a:a56d  8c a3 9a      sty $9aa3
$1a:a570  2c 6e 39      bit $396e
$1a:a573  12 a7         ora ($a7)
$1a:a575  28            plp
$1a:a576  e6 9b         inc $9b
$1a:a578  10 8c         bpl $a506
$1a:a57a  46 93         lsr $93
$1a:a57c  f3 b8         sbc ($b8,s),y
$1a:a57e  a0 46 22      ldy #$2246
$1a:a581  11 a5         ora ($a5),y
$1a:a583  7c ee 29      jmp ($29ee,x)
$1a:a586  08            php
$1a:a587  50 89         bvc $a512
$1a:a589  2f e7 6d 98   and $986de7
$1a:a58d  4a            lsr a
$1a:a58e  82 a2 56      brl $fc33
$1a:a591  23 9a         and $9a,s
$1a:a593  cd 2e 29      cmp $292e
$1a:a596  a5 ee         lda $ee
$1a:a598  3f 80 6e a3   and $a36e80,x
$1a:a59c  31 db         and ($db),y
$1a:a59e  5c 69 2a 11   jml $112a69
$1a:a5a2  8c ca b1      sty $b1ca
$1a:a5a5  ed 51 5c      sbc $5c51
$1a:a5a8  cb            wai
$1a:a5a9  14 18         trb $18
$1a:a5ab  d1 b8         cmp ($b8),y
$1a:a5ad  b5 5a         lda $5a,x
$1a:a5af  d3 30         cmp ($30,s),y
$1a:a5b1  40            rti
$1a:a5b2  1b            tcs
$1a:a5b3  44 06 dd      mvp $dd,$06
$1a:a5b6  69 0e         adc #$0e
$1a:a5b8  54 20 aa      mvn $aa,$20
$1a:a5bb  11 55         ora ($55),y
$1a:a5bd  cc da 87      cpy $87da
$1a:a5c0  00 38         brk #$38
$1a:a5c2  01 54         ora ($54,x)
$1a:a5c4  c5 f4         cmp $f4
$1a:a5c6  df dd 38 e6   cmp $e638dd,x
$1a:a5ca  ab            plb
$1a:a5cb  b1 d2         lda ($d2),y
$1a:a5cd  38            sec
$1a:a5ce  da            phx
$1a:a5cf  d7 31         cmp [$31],y
$1a:a5d1  65 8b         adc $8b
$1a:a5d3  8a            txa
$1a:a5d4  02 03         cop #$03
$1a:a5d6  16 2e         asl $2e,x
$1a:a5d8  4c 44 ce      jmp $ce44
$1a:a5db  11 6a         ora ($6a),y
$1a:a5dd  32 e5         and ($e5)
$1a:a5df  f7 14         sbc [$14],y
$1a:a5e1  88            dey
$1a:a5e2  cd aa 2b      cmp $2baa
$1a:a5e5  12 a7         ora ($a7)
$1a:a5e7  0f 98 0a 28   ora $280a98
$1a:a5eb  70 7c         bvs $a669
$1a:a5ed  85 04         sta $04
$1a:a5ef  35 1b         and $1b,x
$1a:a5f1  84 b9         sty $b9
$1a:a5f3  52 43         eor ($43)
$1a:a5f5  50 06         bvc $a5fd
$1a:a5f7  17 c8         ora [$c8],y
$1a:a5f9  66 41         ror $41
$1a:a5fb  ce 15 17      dec $1715
$1a:a5fe  c0 32 e8      cpy #$e832
$1a:a601  4c 31 50      jmp $5031
$1a:a604  d1 b6         cmp ($b6),y
$1a:a606  e9 f5         sbc #$f5
$1a:a608  e0 bf 0e      cpx #$0ebf
$1a:a60b  78            sei
$1a:a60c  b7 c7         lda [$c7],y
$1a:a60e  55 6c         eor $6c,x
$1a:a610  b6 5b         ldx $5b,y
$1a:a612  47 54         eor [$54]
$1a:a614  e7 02         sbc [$02]
$1a:a616  d8            cld
$1a:a617  5a            phy
$1a:a618  5b            tcd
$1a:a619  93 6a         sta ($6a,s),y
$1a:a61b  2d 8d ac      and $ac8d
$1a:a61e  81 31         sta ($31,x)
$1a:a620  7d 35 ba      adc $ba35,x
$1a:a623  03 16         ora $16,s
$1a:a625  20 4d 17      jsr $174d
$1a:a628  5b            tcd
$1a:a629  14 8b         trb $8b
$1a:a62b  51 88         eor ($88),y
$1a:a62d  13 4d         ora ($4d,s),y
$1a:a62f  8d c7 22      sta $22c7
$1a:a632  54 e2 04      mvn $04,$e2
$1a:a635  6e 28 11      ror $1128
$1a:a638  08            php
$1a:a639  c4 6a         cpy $6a
$1a:a63b  82 9f a8      brl $4edd
$1a:a63e  c4 41         cpy $41
$1a:a640  5b            tcd
$1a:a641  74 85         stz $85,x
$1a:a643  58            cli
$1a:a644  44 a9 24      mvp $24,$a9
$1a:a647  08            php
$1a:a648  db            stp
$1a:a649  66 17         ror $17
$1a:a64b  63 99         adc $99,s
$1a:a64d  20 4e db      jsr $db4e
$1a:a650  34 eb         bit $eb,x
$1a:a652  0d b9 02      ora $02b9
$1a:a655  5f 3e 0a f0   eor $f00a3e,x
$1a:a659  df 8b 3c 7b   cmp $7b3c8b,x
$1a:a65d  e4 ef         cpx $ef
$1a:a65f  2f f9 c3 d0   and $d0c3f9
$1a:a663  3e 8e ab      rol $ab8e,x
$1a:a666  6a            ror a
$1a:a667  3b            tsc
$1a:a668  60            rts
$1a:a669  36 94         rol $94,x
$1a:a66b  76 42         ror $42,x
$1a:a66d  15 e1         ora $e1,x
$1a:a66f  6c b6 27      jmp ($27b6)
$1a:a672  e6 03         inc $03
$1a:a674  a6 80         ldx $80
$1a:a676  b4 46         ldy $46,x
$1a:a678  d2 9f         cmp ($9f)
$1a:a67a  76 89         ror $89,x
$1a:a67c  2f c1 a6 28   and $28a6c1
$1a:a680  eb            xba
$1a:a681  b6 5a         ldx $5a,y
$1a:a683  20 36 f6      jsr $f636
$1a:a686  00 a3         brk #$a3
$1a:a688  99 ec 00      sta $00ec,y
$1a:a68b  54 58 35      mvn $35,$58
$1a:a68e  a8            tay
$1a:a68f  0a            asl a
$1a:a690  76 e8         ror $e8,x
$1a:a692  0d ac 1b      ora $1bac
$1a:a695  1a            inc a
$1a:a696  70 3d         bvs $a6d5
$1a:a698  05 11         ora $11
$1a:a69a  9e 21 c5      stz $c521,x
$1a:a69d  8e 86 80      stx $8086
$1a:a6a0  0a            asl a
$1a:a6a1  91 54         sta ($54),y
$1a:a6a3  72 45         adc ($45)
$1a:a6a5  dc 24 45      jml [$4524]
$1a:a6a8  28            plp
$1a:a6a9  b2 38         lda ($38)
$1a:a6ab  f7 14         sbc [$14],y
$1a:a6ad  02 a0         cop #$a0
$1a:a6af  b4 47         ldy $47,x
$1a:a6b1  4f 15 a3 17   eor $17a315
$1a:a6b5  92 91         sta ($91)
$1a:a6b7  40            rti
$1a:a6b8  8e 8e 48      stx $488e
$1a:a6bb  b8            clv
$1a:a6bc  14 e2         trb $e2
$1a:a6be  f2 d2         sbc ($d2)
$1a:a6c0  22 f1 36 88   jsl $8836f1
$1a:a6c4  45 22         eor $22
$1a:a6c6  d4 1a         pei ($1a)
$1a:a6c8  0e e4 de      asl $dee4
$1a:a6cb  b1 19         lda ($19),y
$1a:a6cd  d5 aa         cmp $aa,x
$1a:a6cf  2b            pld
$1a:a6d0  1c 89 52      trb $5289
$1a:a6d3  69 28         adc #$28
$1a:a6d5  e3 db         sbc $db,s
$1a:a6d7  66 29         ror $29
$1a:a6d9  11 99         ora ($99),y
$1a:a6db  c5 aa         cmp $aa
$1a:a6dd  d7 18         cmp [$18],y
$1a:a6df  8d 50 73      sta $7350
$1a:a6e2  3b            tsc
$1a:a6e3  73 71         adc ($71,s),y
$1a:a6e5  a8            tay
$1a:a6e6  c2 23         rep #$23
$1a:a6e8  39 8e da      and $da8e,y
$1a:a6eb  e2 09         sep #$09
$1a:a6ed  b0 47         bcs $a736
$1a:a6ef  19 80 94      ora $9480,y
$1a:a6f2  c3 15         cmp $15,s
$1a:a6f4  55 02         eor $02,x
$1a:a6f6  b4 ad         ldy $ad,x
$1a:a6f8  96 db         stx $db,y
$1a:a6fa  6a            ror a
$1a:a6fb  84 96         sty $96
$1a:a6fd  e1 15         sbc ($15,x)
$1a:a6ff  88            dey
$1a:a700  2b            pld
$1a:a701  46 d0         lsr $d0
$1a:a703  f6 35         inc $35,x
$1a:a705  08            php
$1a:a706  ee 95 01      inc $0195
$1a:a709  bb            tyx
$1a:a70a  6e 0c 05      ror $050c
$1a:a70d  7c af 5f      jmp ($5faf,x)
$1a:a710  03 78         ora $78,s
$1a:a712  5f c5 1e 39   eor $391ec5,x
$1a:a716  f2 57         sbc ($57)
$1a:a718  96 fc         stx $fc,y
$1a:a71a  d9 e7 df      cmp $dfe7,y
$1a:a71d  47 7a         eor [$7a]
$1a:a71f  7f d5 d8 d2   adc $d2d8d5,x
$1a:a723  15 75         ora $75,x
$1a:a725  b8            clv
$1a:a726  89 87 6c      bit #$6c87
$1a:a729  fd 84 37      sbc $3784,x
$1a:a72c  c1 e0         cmp ($e0,x)
$1a:a72e  56 eb         lsr $eb,x
$1a:a730  5b            tcd
$1a:a731  61 9d         adc ($9d,x)
$1a:a733  e3 a7         sbc $a7,s
$1a:a735  b7 37         lda [$37],y
$1a:a737  c2 2a         rep #$2a
$1a:a739  d8            cld
$1a:a73a  70 7a         bvs $a7b6
$1a:a73c  b4 16         ldy $16,x
$1a:a73e  df 01 d3 3b   cmp $3bd301,x
$1a:a742  c6 dc         dec $dc
$1a:a744  ef 07 ba 6e   sbc $6eba07
$1a:a748  1b            tcs
$1a:a749  e1 13         sbc ($13,x)
$1a:a74b  8a            txa
$1a:a74c  3d 40 40      and $4040,x
$1a:a74f  00 65         brk #$65
$1a:a751  dc 45 22      jml [$2245]
$1a:a754  d1 b8         cmp ($b8),y
$1a:a756  e4 5c         cpx $5c
$1a:a758  62 03 10      per $b75e
$1a:a75b  8b            phb
$1a:a75c  0a            asl a
$1a:a75d  52 39         eor ($39)
$1a:a75f  12 88         ora ($88)
$1a:a761  46 22         lsr $22
$1a:a763  24 10         bit $10
$1a:a765  20 84 49      jsr $4984
$1a:a768  a8            tay
$1a:a769  7b            tdc
$1a:a76a  68            pla
$1a:a76b  c4 6a         cpy $6a
$1a:a76d  31 d3         and ($d3),y
$1a:a76f  8c 94 40      sty $4094
$1a:a772  a2 11 a5      ldx #$a511
$1a:a775  fa            plx
$1a:a776  44 0a 01      mvp $01,$0a
$1a:a779  be 88 99      ldx $9988,y
$1a:a77c  44 de 15      mvp $15,$de
$1a:a77f  4b            phk
$1a:a780  4d b4 f6      eor $f6b4
$1a:a783  25 f1         and $f1
$1a:a785  e5 98         sbc $98
$1a:a787  d2 a8         cmp ($a8)
$1a:a789  34 28         bit $28,x
$1a:a78b  0c 42 4b      tsb $4b42
$1a:a78e  21 95         and ($95,x)
$1a:a790  49 0e 85      eor #$850e
$1a:a793  25 6f         and $6f
$1a:a795  81 14         sta ($14,x)
$1a:a797  62 73 ab      per $530d
$1a:a79a  50 cc         bvc $a768
$1a:a79c  64 32         stz $32
$1a:a79e  05 20         ora $20
$1a:a7a0  37 c2         and [$c2],y
$1a:a7a2  2c 55 18      bit $1855
$1a:a7a5  dc e2 3a      jml [$3ae2]
$1a:a7a8  ef 10 f8 3c   sbc $3cf810
$1a:a7ac  06 2d         asl $2d
$1a:a7ae  41 a1         eor ($a1,x)
$1a:a7b0  50 d7         bvc $a789
$1a:a7b2  61 39         adc ($39,x)
$1a:a7b4  8b            phb
$1a:a7b5  bc 0c 6c      ldy $6c0c,x
$1a:a7b8  16 ba         asl $ba,x
$1a:a7ba  0d 39 c6      ora $c639
$1a:a7bd  53 8a         eor ($8a,s),y
$1a:a7bf  01 0c         ora ($0c,x)
$1a:a7c1  c8            iny
$1a:a7c2  c3 49         cmp $49,s
$1a:a7c4  a3 12         lda $12,s
$1a:a7c6  4a            lsr a
$1a:a7c7  73 48         adc ($48,s),y
$1a:a7c9  29 99 58      and #$5899
$1a:a7cc  59 29 6a      eor $6a29,y
$1a:a7cf  d3 01         cmp ($01,s),y
$1a:a7d1  00 50         brk #$50
$1a:a7d3  5b            tcd
$1a:a7d4  8b            phb
$1a:a7d5  54 57 72      mvn $72,$57
$1a:a7d8  6d 08 ec      adc $ec08
$1a:a7db  06 3b         asl $3b
$1a:a7dd  fd 5b 88      sbc $885b,x
$1a:a7e0  ac a3 b6      ldy $b6a3
$1a:a7e3  b7 d0         lda [$d0],y
$1a:a7e5  a8            tay
$1a:a7e6  00 86         brk #$86
$1a:a7e8  31 66         and ($66),y
$1a:a7ea  51 01         eor ($01),y
$1a:a7ec  d2 2f         cmp ($2f)
$1a:a7ee  a6 a4         ldx $a4
$1a:a7f0  39 89 f4      and $f489,y
$1a:a7f3  2f 74 a2 eb   and $eba274
$1a:a7f7  68            pla
$1a:a7f8  06 61         asl $61
$1a:a7fa  a4 be         ldy $be
$1a:a7fc  86 d0         stx $d0
$1a:a7fe  b7 0b         lda [$0b],y
$1a:a800  49 b4 29      eor #$29b4
$1a:a803  b1 ba         lda ($ba),y
$1a:a805  41 d8         eor ($d8,x)
$1a:a807  73 3b         adc ($3b,s),y
$1a:a809  70 59         bvs $a864
$1a:a80b  23 02         and $02,s
$1a:a80d  d3 b8         cmp ($b8,s),y
$1a:a80f  17 86         ora [$86],y
$1a:a811  61 2a         adc ($2a,x)
$1a:a813  04 30         tsb $30
$1a:a815  b6 5b         ldx $5b,y
$1a:a817  06 e2         asl $e2
$1a:a819  c5 0b         cmp $0b
$1a:a81b  5e e0 7e      lsr $7ee0,x
$1a:a81e  1b            tcs
$1a:a81f  6c d6 6b      jmp ($6bd6)
$1a:a822  6e 56 28      ror $2856
$1a:a825  0e 9d 6e      asl $6e9d
$1a:a828  16 bd         asl $bd,x
$1a:a82a  b1 3c         lda ($3c),y
$1a:a82c  2d b6 cb      and $cbb6
$1a:a82f  68            pla
$1a:a830  dc 16 86      jml [$8616]
$1a:a833  b7 08         lda [$08],y
$1a:a835  ac 00 be      ldy $be00
$1a:a838  06 81         asl $81
$1a:a83a  62 8a 04      per $acc7
$1a:a83d  80 00         bra $a83f
$1a:a83f  f3 28         sbc ($28,s),y
$1a:a841  a3 05         lda $05,s
$1a:a843  5e 20 69      lsr $6920,x
$1a:a846  17 60         ora [$60],y
$1a:a848  c7 1a         cmp [$1a]
$1a:a84a  2b            pld
$1a:a84b  13 00         ora ($00,s),y
$1a:a84d  85 bc         sta $bc
$1a:a84f  f6 0e         inc $0e,x
$1a:a851  c0 a1 38      cpy #$38a1
$1a:a854  56 36         lsr $36,x
$1a:a856  0f 27 59 53   ora $535927
$1a:a85a  4a            lsr a
$1a:a85b  00 c1         brk #$c1
$1a:a85d  37 08         and [$08],y
$1a:a85f  d7 9d         cmp [$9d],y
$1a:a861  65 45         adc $45
$1a:a863  61 24         adc ($24,x)
$1a:a865  62 32 d2      per $7a9a
$1a:a868  0b            phd
$1a:a869  32 f2         and ($f2)
$1a:a86b  c8            iny
$1a:a86c  00 cb         brk #$cb
$1a:a86e  23 38         and $38,s
$1a:a870  2a            rol a
$1a:a871  c9 e5 09      cmp #$09e5
$1a:a874  94 02         sty $02,x
$1a:a876  42 5c         wdm #$5c
$1a:a878  17 66         ora [$66],y
$1a:a87a  04 75         tsb $75
$1a:a87c  d0 51         bne $a8cf
$1a:a87e  82 57 1c      brl $c4d8
$1a:a881  89 53 82      bit #$8253
$1a:a884  57 18         eor [$18],y
$1a:a886  8d 50 77      sta $7750
$1a:a889  21 2a         and ($2a,x)
$1a:a88b  88            dey
$1a:a88c  44 a9 24      mvp $24,$a9
$1a:a88f  2b            pld
$1a:a890  1f 86 67 6e   ora $6e6786,x
$1a:a894  12 ac         ora ($ac)
$1a:a896  d6 68         dec $68,x
$1a:a898  c5 67         cmp $67
$1a:a89a  df 47 7a 7f   cmp $7f7a47,x
$1a:a89e  d6 1e         dec $1e,x
$1a:a8a0  c1 f6         cmp ($f6,x)
$1a:a8a2  97 81         sta [$81],y
$1a:a8a4  27 fa         and [$fa]
$1a:a8a6  03 1b         ora $1b,s
$1a:a8a8  6d b0 48      adc $48b0
$1a:a8ab  db            stp
$1a:a8ac  8b            phb
$1a:a8ad  57 e4         eor [$e4],y
$1a:a8af  58            cli
$1a:a8b0  16 88         asl $88,x
$1a:a8b2  0d ba d2      ora $d2ba
$1a:a8b5  24 50         bit $50
$1a:a8b7  10 00         bpl $a8b9
$1a:a8b9  0b            phd
$1a:a8ba  fb            xce
$1a:a8bb  01 80         ora ($80,x)
$1a:a8bd  da            phx
$1a:a8be  6d a1 72      adc $72a1
$1a:a8c1  b4 42         ldy $42,x
$1a:a8c3  01 c3         ora ($c3,x)
$1a:a8c5  6a            ror a
$1a:a8c6  80 e9         bra $a8b1
$1a:a8c8  b4 e0         ldy $e0,x
$1a:a8ca  30 80         bmi $a84c
$1a:a8cc  89 00 4a      bit #$4a00
$1a:a8cf  21 40         and ($40,x)
$1a:a8d1  0f 90 c8 a2   ora $a2c890
$1a:a8d5  91 31         sta ($31),y
$1a:a8d7  b8            clv
$1a:a8d8  c5 34         cmp $34
$1a:a8da  df f2 e0 45   cmp $45e0f2,x
$1a:a8de  c2 40         rep #$40
$1a:a8e0  26 08         rol $08
$1a:a8e2  b4 72         ldy $72,x
$1a:a8e4  36 47         rol $47,x
$1a:a8e6  22 08 02 42   jsl $420208
$1a:a8ea  8b            phb
$1a:a8eb  17 1c         ora [$1c],y
$1a:a8ed  04 5a         tsb $5a
$1a:a8ef  83 42         sta $42,s
$1a:a8f1  a1 95         lda ($95,x)
$1a:a8f3  ca            dex
$1a:a8f4  33 1d         and ($1d,s),y
$1a:a8f6  04 85         tsb $85
$1a:a8f8  36 22         rol $22,x
$1a:a8fa  48            pha
$1a:a8fb  08            php
$1a:a8fc  95 39         sta $39,x
$1a:a8fe  bc 94 52      ldy $5294,x
$1a:a901  f0 6e         beq $a971
$1a:a903  28            plp
$1a:a904  11 98         ora ($98),y
$1a:a906  84 62         sty $62
$1a:a908  35 41         and $41,x
$1a:a90a  dc b7 8e      jml [$8eb7]
$1a:a90d  9b            txy
$1a:a90e  6a            ror a
$1a:a90f  7e 05 22      ror $2205,x
$1a:a912  23 18         and $18,s
$1a:a914  88            dey
$1a:a915  44 a9 27      mvp $27,$a9
$1a:a918  73 dc         adc ($dc,s),y
$1a:a91a  44 4b c1      mvp $c1,$4b
$1a:a91d  b6 cc         ldx $cc,y
$1a:a91f  1c 8b 33      trb $338b
$1a:a922  b7 44         lda [$44],y
$1a:a924  1c 64 fc      trb $fc64
$1a:a927  08            php
$1a:a928  f1 41         sbc ($41),y
$1a:a92a  82 59 11      brl $ba86
$1a:a92d  e2 9e         sep #$9e
$1a:a92f  14 78         trb $78
$1a:a931  66 b3         ror $b3
$1a:a933  4a            lsr a
$1a:a934  64 7d         stz $7d
$1a:a936  89 78 58      bit #$5878
$1a:a939  1e d1 f6      asl $f6d1,x
$1a:a93c  f5 5a         sbc $5a,x
$1a:a93e  ce e8 de      dec $dee8
$1a:a941  3b            tsc
$1a:a942  61 e4         adc ($e4,x)
$1a:a944  6d d6 96      adc $96d6
$1a:a947  f3 da         sbc ($da,s),y
$1a:a949  1f e5 01 8a   ora $8a01e5,x
$1a:a94d  b7 9c         lda [$9c],y
$1a:a94f  62 01 01      per $aa53
$1a:a952  1a            inc a
$1a:a953  85 a6         sta $a6
$1a:a955  da            phx
$1a:a956  22 4b 40 7c   jsl $7c404b
$1a:a95a  04 01         tsb $01
$1a:a95c  00 d3         brk #$d3
$1a:a95e  8a            txa
$1a:a95f  87 4c         sta [$4c]
$1a:a961  32 18         and ($18)
$1a:a963  08            php
$1a:a964  bc 3f a2      ldy $a23f,x
$1a:a967  f0 0e         beq $a977
$1a:a969  00 a8         brk #$a8
$1a:a96b  62 91 32      per $dbff
$1a:a96e  11 8a         ora ($8a),y
$1a:a970  86 03         stx $03
$1a:a972  6b            rtl
$1a:a973  7f 04 06 2d   adc $2d0604,x
$1a:a977  1c 8d 94      trb $948d
$1a:a97a  8e 2f a6      stx $a62f
$1a:a97d  27 88         and [$88]
$1a:a97f  38            sec
$1a:a980  22 d4 1a 15   jsl $151ad4
$1a:a984  0c c4 71      tsb $71c4
$1a:a987  1d 6c 52      ora $526c,x
$1a:a98a  2d 46 80      and $8046
$1a:a98d  45 62         eor $62
$1a:a98f  54 e6 f2      mvn $f2,$e6
$1a:a992  d3 4a         cmp ($4a,s),y
$1a:a994  60            rts
$1a:a995  70 1b         bvs $a9b2
$1a:a997  5c 6a 82 f0   jml $f0826a
$1a:a99b  4d c5 02      eor $02c5
$1a:a99e  21 18         and ($18,x)
$1a:a9a0  40            rti
$1a:a9a1  09 bc 29      ora #$29bc
$1a:a9a4  28            plp
$1a:a9a5  25 a4         and $a4
$1a:a9a7  46 22         lsr $22
$1a:a9a9  09 01 3f      ora #$3f01
$1a:a9ac  86 65         stx $65
$1a:a9ae  6a            ror a
$1a:a9af  9b            txy
$1a:a9b0  6c c2 28      jmp ($28c2)
$1a:a9b3  54 21 6b      mvn $6b,$21
$1a:a9b6  50 aa         bvc $a962
$1a:a9b8  98            tya
$1a:a9b9  73 4b         adc ($4b,s),y
$1a:a9bb  a0 58         ldy #$58
$1a:a9bd  b3 13         lda ($13,s),y
$1a:a9bf  da            phx
$1a:a9c0  be de 61      ldx $61de,y
$1a:a9c3  10 29         bpl $a9ee
$1a:a9c5  8a            txa
$1a:a9c6  73 1d         adc ($1d,s),y
$1a:a9c8  8a            txa
$1a:a9c9  c4 14         cpy $14
$1a:a9cb  23 68         and $68,s
$1a:a9cd  0a            asl a
$1a:a9ce  85 bc         sta $bc
$1a:a9d0  58            cli
$1a:a9d1  2a            rol a
$1a:a9d2  70 dd         bvs $a9b1
$1a:a9d4  5a            phy
$1a:a9d5  ad 7b bd      lda $bd7b
$1a:a9d8  b8            clv
$1a:a9d9  a0 4e         ldy #$4e
$1a:a9db  80 4f         bra $aa2c
$1a:a9dd  0b            phd
$1a:a9de  75 a4         adc $a4,x
$1a:a9e0  4e 76 9b      lsr $9b76
$1a:a9e3  40            rti
$1a:a9e4  bc 3f e7      ldy $e73f,x
$1a:a9e7  40            rti
$1a:a9e8  24 90         bit $90
$1a:a9ea  dc 49 24      jml [$2449]
$1a:a9ed  48            pha
$1a:a9ee  13 a0         ora ($a0,s),y
$1a:a9f0  1a            inc a
$1a:a9f1  c2 2e         rep #$2e
$1a:a9f3  43 11         eor $11,s
$1a:a9f5  39 14 40      and $4014,y
$1a:a9f8  b2 07         lda ($07)
$1a:a9fa  40            rti
$1a:a9fb  3d 81 48      and $4881,x
$1a:a9fe  a3 b0         lda $b0,s
$1a:aa00  18            clc
$1a:aa01  a9 08 68      lda #$6808
$1a:aa04  1a            inc a
$1a:aa05  d3 a0         cmp ($a0,s),y
$1a:aa07  22 c0 c4 56   jsl $56c4c0
$1a:aa0b  a8            tay
$1a:aa0c  0d ac a4      ora $a4ac
$1a:aa0f  34 88         bit $88,x
$1a:aa11  d9 d0 13      cmp $13d0,y
$1a:aa14  60            rts
$1a:aa15  92 22         sta ($22)
$1a:aa17  a8            tay
$1a:aa18  69 a5 56      adc #$56a5
$1a:aa1b  94 40         sty $40,x
$1a:aa1d  b7 bc         lda [$bc],y
$1a:aa1f  fb            xce
$1a:aa20  e8            inx
$1a:aa21  ef 4f fa c3   sbc $c3fa4f
$1a:aa25  d8            cld
$1a:aa26  3e d2 f7      rol $f7d2,x
$1a:aa29  0e 5b 1c      asl $1c5b
$1a:aa2c  21 b8         and ($b8,x)
$1a:aa2e  70 cd         bvs $a9fd
$1a:aa30  a2 dd         ldx #$dd
$1a:aa32  69 7a 5d      adc #$5d7a
$1a:aa35  aa            tax
$1a:aa36  11 15         ora ($15),y
$1a:aa38  7a            ply
$1a:aa39  55 a0         eor $a0,x
$1a:aa3b  6a            ror a
$1a:aa3c  36 9d         rol $9d,x
$1a:aa3e  b3 86         lda ($86,s),y
$1a:aa40  23 b0         and $b0,s
$1a:aa42  8d 39 18      sta $1839
$1a:aa45  1c 33 1d      trb $1d33
$1a:aa48  10 87         bpl $a9d1
$1a:aa4a  f6 d6         inc $d6,x
$1a:aa4c  e1 98         sbc ($98,x)
$1a:aa4e  be 98 42      ldx $4298,y
$1a:aa51  11 67         ora ($67),y
$1a:aa53  0c d3 62      tsb $62d3
$1a:aa56  e3 30         sbc $30,s
$1a:aa58  af 38 63 71   lda $716338
$1a:aa5c  48            pha
$1a:aa5d  88            dey
$1a:aa5e  da            phx
$1a:aa5f  ad 76 63      lda $6376
$1a:aa62  2c d0 23      bit $23d0
$1a:aa65  31 db         and ($db),y
$1a:aa67  5c 4b 72 66   jml $66724b
$1a:aa6b  b8            clv
$1a:aa6c  ac 69 0b      ldy $0b69
$1a:aa6f  1b            tcs
$1a:aa70  6c c4 65      jmp ($65c4)
$1a:aa73  24 1b         bit $1b
$1a:aa75  bd bb 86      lda $86bb,x
$1a:aa78  13 e0         ora ($e0,s),y
$1a:aa7a  82 04 2c      brl $d681
$1a:aa7d  1b            tcs
$1a:aa7e  09 65 c7      ora #$c765
$1a:aa81  20 79 0a      jsr $0a79
$1a:aa84  de a0 20      dec $20a0,x
$1a:aa87  21 62         and ($62,x)
$1a:aa89  b5 0e         lda $0e,x
$1a:aa8b  84 ef         sty $ef
$1a:aa8d  08            php
$1a:aa8e  89 00 22      bit #$2200
$1a:aa91  d4 66         pei ($66)
$1a:aa93  28            plp
$1a:aa94  51 75         eor ($75),y
$1a:aa96  b1 47         lda ($47),y
$1a:aa98  b1 17         lda ($17),y
$1a:aa9a  84 e4         sty $e4
$1a:aa9c  11 2a         ora ($2a),y
$1a:aa9e  71 78         adc ($78),y
$1a:aaa0  63 71         adc $71,s
$1a:aaa2  c0 31         cpy #$31
$1a:aaa4  1f 85 24 34   ora $342485,x
$1a:aaa8  1d c9 fc      ora $fcc9,x
$1a:aaab  22 11 80 b0   jsl $b08011
$1a:aaaf  1b            tcs
$1a:aab0  0d 24 11      ora $1124
$1a:aab3  2a            rol a
$1a:aab4  48            pha
$1a:aab5  60            rts
$1a:aab6  63 11         adc $11,s
$1a:aab8  00 e9         brk #$e9
$1a:aaba  ac 05 26      ldy $2605
$1a:aabd  19 9d b9      ora $b99d,y
$1a:aac0  bc 03 60      ldy $6003,x
$1a:aac3  26 05         rol $05
$1a:aac5  ea            nop
$1a:aac6  28            plp
$1a:aac7  c9 3e 02      cmp #$023e
$1a:aaca  b1 cc         lda ($cc),y
$1a:aacc  af 67 6d 9a   lda $9a6d67
$1a:aad0  2d 82 94      and $9482
$1a:aad3  da            phx
$1a:aad4  21 15         and ($15,x)
$1a:aad6  42 85         wdm #$85
$1a:aad8  b0 d0         bcs $aaaa
$1a:aada  2c a8 dc      bit $dca8
$1a:aadd  da            phx
$1a:aade  20 27 81      jsr $8127
$1a:aae1  72 9d         adc ($9d)
$1a:aae3  b6 d8         ldx $d8,y
$1a:aae5  77 07         adc [$07],y
$1a:aae7  20 5a 8f      jsr $8f5a
$1a:aaea  01 6e         ora ($6e,x)
$1a:aaec  80 da         bra $aac8
$1a:aaee  d8            cld
$1a:aaef  a2 77         ldx #$77
$1a:aaf1  33 c0         and ($c0,s),y
$1a:aaf3  69 d2 26      adc #$26d2
$1a:aaf6  e5 18         sbc $18
$1a:aaf8  ef f5 2e 89   sbc $892ef5
$1a:aafc  13 46         ora ($46,s),y
$1a:aafe  0a            asl a
$1a:aaff  1c 54 71      trb $7154
$1a:ab02  15 4f         ora $4f,x
$1a:ab04  0c 22 03      tsb $0322
$1a:ab07  6f 3c 0b 04   adc $040b3c
$1a:ab0b  11 40         ora ($40),y
$1a:ab0d  78            sei
$1a:ab0e  08            php
$1a:ab0f  b1 b0         lda ($b0),y
$1a:ab11  22 f1 35 1b   jsl $1b35f1
$1a:ab15  e9 e2 af      sbc #$afe2
$1a:ab18  72 9d         adc ($9d)
$1a:ab1a  2c 0a 28      bit $280a
$1a:ab1d  d1 38         cmp ($38),y
$1a:ab1f  b0 38         bcs $ab59
$1a:ab21  9e 1e 01      stz $011e,x
$1a:ab24  f0 97         beq $aabd
$1a:ab26  88            dey
$1a:ab27  fc 69 e4      jsr ($e469,x)
$1a:ab2a  5f 2b 79 81   eor $81792b,x
$1a:ab2e  e8            inx
$1a:ab2f  b1 b8         lda ($b8),y
$1a:ab31  e4 49         cpx $49
$1a:ab33  da            phx
$1a:ab34  34 58         bit $58,x
$1a:ab36  ba            tsx
$1a:ab37  58            cli
$1a:ab38  22 d4 1a 11   jsl $111ad4
$1a:ab3c  b0 29         bcs $ab67
$1a:ab3e  b1 08         lda ($08),y
$1a:ab40  c4 6a         cpy $6a
$1a:ab42  83 b9         sta $b9,s
$1a:ab44  40            rti
$1a:ab45  04 46         tsb $46
$1a:ab47  d5 6b         cmp $6b,x
$1a:ab49  3a            dec a
$1a:ab4a  16 e2         asl $e2,x
$1a:ab4c  81 18         sta ($18,x)
$1a:ab4e  88            dey
$1a:ab4f  46 a9         lsr $a9
$1a:ab51  3b            tsc
$1a:ab52  94 80         sty $80,x
$1a:ab54  46 6d         lsr $6d
$1a:ab56  51 54         eor ($54),y
$1a:ab58  21 6e         and ($6e,x)
$1a:ab5a  29 08 20      and #$2008
$1a:ab5d  89 66 76      bit #$7666
$1a:ab60  ea            nop
$1a:ab61  00 44         brk #$44
$1a:ab63  84 56         sty $56
$1a:ab65  24 95         bit $95
$1a:ab67  08            php
$1a:ab68  06 db         asl $db
$1a:ab6a  30 92         bmi $aafe
$1a:ab6c  05 28         ora $28
$1a:ab6e  2b            pld
$1a:ab6f  c6 33         dec $33
$1a:ab71  1d 4d 82      ora $824d,x
$1a:ab74  d0 55         bne $abcb
$1a:ab76  e1 9a         sbc ($9a,x)
$1a:ab78  cd 2f 85      cmp $852f
$1a:ab7b  5e 31 db      lsr $db31,x
$1a:ab7e  5a            phy
$1a:ab7f  f4 8c 0f      pea $0f8c
$1a:ab82  b8            clv
$1a:ab83  4d 02 18      eor $1802
$1a:ab86  0c 09 6d      tsb $6d09
$1a:ab89  b6 35         ldx $35,y
$1a:ab8b  8e d6 dc      stx $dcd6
$1a:ab8e  1b            tcs
$1a:ab8f  4a            lsr a
$1a:ab90  40            rti
$1a:ab91  10 48         bpl $abdb
$1a:ab93  e1 23         sbc ($23,x)
$1a:ab95  60            rts
$1a:ab96  da            phx
$1a:ab97  d4 00         pei ($00)
$1a:ab99  92 05         sta ($05)
$1a:ab9b  61 1b         adc ($1b,x)
$1a:ab9d  02 d1         cop #$d1
$1a:ab9f  01 b4         ora ($b4,x)
$1a:aba1  bf 45 60 08   lda $086045,x
$1a:aba5  21 66         and ($66,x)
$1a:aba7  1d aa 02      ora $02aa,x
$1a:abaa  0b            phd
$1a:abab  18            clc
$1a:abac  ab            plb
$1a:abad  00 98         brk #$98
$1a:abaf  65 6d         adc $6d
$1a:abb1  b4 42         ldy $42,x
$1a:abb3  03 61         ora $61,s
$1a:abb5  6b            rtl
$1a:abb6  80 02         bra $abba
$1a:abb8  c2 da         rep #$da
$1a:abba  31 30         and ($30),y
$1a:abbc  50 0e         bvc $abcc
$1a:abbe  07 4e         ora [$4e]
$1a:abc0  2d 18 0e      and $0e18
$1a:abc3  98            tya
$1a:abc4  80 27         bra $abed
$1a:abc6  a0 80 db      ldy #$db80
$1a:abc9  c3 61         cmp $61,s
$1a:abcb  fd 80 87      sbc $8780,x
$1a:abce  c2 03         rep #$03
$1a:abd0  14 89         trb $89
$1a:abd2  94 0c         sty $0c,x
$1a:abd4  70 44         bvs $ac1a
$1a:abd6  10 16         bpl $abee
$1a:abd8  84 5a         sty $5a
$1a:abda  38            sec
$1a:abdb  72 03         adc ($03)
$1a:abdd  09 1e 40      ora #$401e
$1a:abe0  82 16 e8      brl $93f9
$1a:abe3  9c 5a 01      stz $015a
$1a:abe6  41 a1         eor ($a1,x)
$1a:abe8  50 ce         bvc $abb8
$1a:abea  07 11         ora [$11]
$1a:abec  8b            phb
$1a:abed  94 42         sty $42,x
$1a:abef  2d 1b a7      and $a71b
$1a:abf2  40            rti
$1a:abf3  0f a0 de 4a   ora $4adea0
$1a:abf7  6c 44 c2      jmp ($c244)
$1a:abfa  11 28         ora ($28),y
$1a:abfc  e5 1a         sbc $1a
$1a:abfe  01 5e         ora ($5e,x)
$1a:ac00  67 2d         adc [$2d]
$1a:ac02  16 32         asl $32,x
$1a:ac04  f2 08         sbc ($08)
$1a:ac06  8c 60 fe      sty $fe60
$1a:ac09  ca            dex
$1a:ac0a  4f 5a fb 1b   eor $1bfb5a
$1a:ac0e  da            phx
$1a:ac0f  fe 81 4d      inc $4d81,x
$1a:ac12  c4 66         cpy $66
$1a:ac14  70 78         bvs $ac8e
$1a:ac16  28            plp
$1a:ac17  e4 e8         cpx $e8
$1a:ac19  f0 54         beq $ac6f
$1a:ac1b  9a            txs
$1a:ac1c  0e e7 71      asl $71e7
$1a:ac1f  11 9c         ora ($9c),y
$1a:ac21  a2 0a 75      ldx #$750a
$1a:ac24  38            sec
$1a:ac25  44 15 06      mvp $06,$15
$1a:ac28  92 fe         sta ($fe)
$1a:ac2a  07 80         ora [$80]
$1a:ac2c  26 06         rol $06
$1a:ac2e  35 38         and $38,x
$1a:ac30  9c 84 89      stz $8984
$1a:ac33  f8            sed
$1a:ac34  3b            tsc
$1a:ac35  6c c0 04      jmp ($04c0)
$1a:ac38  23 11         and $11,s
$1a:ac3a  08            php
$1a:ac3b  94 e4         sty $e4,x
$1a:ac3d  0e 02 31      asl $3102
$1a:ac40  a0 e6 76      ldy #$76e6
$1a:ac43  f6 d0         inc $d0,x
$1a:ac45  f8            sed
$1a:ac46  04 8b         tsb $8b
$1a:ac48  77 ba         adc [$ba],y
$1a:ac4a  09 10 b4      ora #$b410
$1a:ac4d  20 10 1b      jsr $1b10
$1a:ac50  48            pha
$1a:ac51  7c 04 60      jmp ($6004,x)
$1a:ac54  2d 02 0a      and $0a02
$1a:ac57  20 42 02      jsr $0242
$1a:ac5a  3f 1c d6 68   and $68d61c,x
$1a:ac5e  98            tya
$1a:ac5f  25 24         and $24
$1a:ac61  2e f9 bb      rol $bbf9
$1a:ac64  cf fe 90 f5   cmp $f590fe
$1a:ac68  0f ac bd 87   ora $87bdac
$1a:ac6c  ed 4f 70      sbc $704f
$1a:ac6f  4d b6 d9      eor $d9b6
$1a:ac72  68            pla
$1a:ac73  80 db         bra $ac50
$1a:ac75  ad 2f 12      lda $122f
$1a:ac78  28            plp
$1a:ac79  03 80         ora $80,s
$1a:ac7b  5f 22 01 87   eor $870122,x
$1a:ac7f  e0 da a0      cpx #$a0da
$1a:ac82  3a            dec a
$1a:ac83  70 0a         bvs $ac8f
$1a:ac85  db            stp
$1a:ac86  9f 41 6b 70   sta $706b41,x
$1a:ac8a  04 5c         tsb $5c
$1a:ac8c  02 81         cop #$81
$1a:ac8e  24 0e         bit $0e
$1a:ac90  8d 76 3b      sta $3b76
$1a:ac93  01 b7         ora ($b7,x)
$1a:ac95  80 52         bra $ace9
$1a:ac97  11 01         ora ($01),y
$1a:ac99  fe 87 46      inc $4687,x
$1a:ac9c  ca            dex
$1a:ac9d  20 50 09      jsr $0950
$1a:aca0  c5 60         cmp $60
$1a:aca2  1b            tcs
$1a:aca3  8a            txa
$1a:aca4  04 e8         tsb $e8
$1a:aca6  20 0f a0      jsr $a00f
$1a:aca9  89 86 0e      bit #$0e86
$1a:acac  03 16         ora $16,s
$1a:acae  27 05         and [$05]
$1a:acb0  22 71 17 89   jsl $891771
$1a:acb4  c5 22         cmp $22
$1a:acb6  d3 a1         cmp ($a1,s),y
$1a:acb8  88            dey
$1a:acb9  09 46 2b      ora #$2b46
$1a:acbc  46 80         lsr $80
$1a:acbe  6d b3 13      adc $13b3
$1a:acc1  98            tya
$1a:acc2  8c 6e 39      sty $396e
$1a:acc5  12 30         ora ($30)
$1a:acc7  80 04         bra $accd
$1a:acc9  a2 d4 9d      ldx #$9dd4
$1a:accc  c9 38 27      cmp #$2738
$1a:accf  11 98         ora ($98),y
$1a:acd1  84 62         sty $62
$1a:acd3  35 39         and $39,x
$1a:acd5  9d 18 8a      sta $8a18,x
$1a:acd8  93 41         sta ($41,s),y
$1a:acda  3f 09 c4 23   and $23c409,x
$1a:acde  11 03         ora ($03),y
$1a:ace0  a8            tay
$1a:ace1  4e 0e 45      lsr $450e
$1a:ace4  41 3e         eor ($3e,x)
$1a:ace6  89 bc 10      bit #$10bc
$1a:ace9  47 39         eor [$39]
$1a:aceb  41 15         eor ($15,x)
$1a:aced  27 33         and [$33]
$1a:acef  b7 70         lda [$70],y
$1a:acf1  01 bc         ora ($bc,x)
$1a:acf3  12 61         ora ($61)
$1a:acf5  99 dd 25      sta $25dd,y
$1a:acf8  c1 26         cmp ($26,x)
$1a:acfa  28            plp
$1a:acfb  d1 b6         cmp ($b6),y
$1a:acfd  5b            tcd
$1a:acfe  2d bb 6c      and $6cbb
$1a:ad01  d6 6b         dec $6b,x
$1a:ad03  6e a0 45      ror $45a0
$1a:ad06  68            pla
$1a:ad07  82 8a da      brl $8794
$1a:ad0a  ee 15 89      inc $8915
$1a:ad0d  ed d8 00      sbc $00d8
$1a:ad10  39 17 d2      and $d217,y
$1a:ad13  30 88         bmi $ac9d
$1a:ad15  00 16         brk #$16
$1a:ad17  f0 2a         beq $ad43
$1a:ad19  00 4e         brk #$4e
$1a:ad1b  2e 0d ff      rol $ff0d
$1a:ad1e  e8            inx
$1a:ad1f  b8            clv
$1a:ad20  03 d0         ora $d0,s
$1a:ad22  0e ff ef      asl $efff
$1a:ad25  b8            clv
$1a:ad26  0e 00 0f      asl $0f00
$1a:ad29  ff e0 b8 07   sbc $07b8e0,x
$1a:ad2d  a8            tay
$1a:ad2e  10 ff         bpl $ad2f
$1a:ad30  e0 b8 03      cpx #$03b8
$1a:ad33  00 11         brk #$11
$1a:ad35  ff e0 b8 06   sbc $06b8e0,x
$1a:ad39  15 12         ora $12,x
$1a:ad3b  ff e0 b8 07   sbc $07b8e0,x
$1a:ad3f  a8            tay
$1a:ad40  13 ff         ora ($ff,s),y
$1a:ad42  e0 b8 07      cpx #$07b8
$1a:ad45  a8            tay
$1a:ad46  18            clc
$1a:ad47  00 00         brk #$00
$1a:ad49  2f 32 65 7f   and $7f6532
$1a:ad4d  98            tya
$1a:ad4e  b2 cb         lda ($cb)
$1a:ad50  e5 fc         sbc $fc
$1a:ad52  19 32 4c      ora $4c32,y
$1a:ad55  65 72         adc $72
$1a:ad57  7f 8c 98 a5   adc $a5988c,x
$1a:ad5b  b2 bf         lda ($bf)
$1a:ad5d  cb            wai
$1a:ad5e  d8            cld
$1a:ad5f  e5 f2         sbc $f2
$1a:ad61  fc 40 08      jsr ($0840,x)
$1a:ad64  00 10         brk #$10
$1a:ad66  02 10         cop #$10
$1a:ad68  0a            asl a
$1a:ad69  10 ff         bpl $ad6a
$1a:ad6b  00 02         brk #$02
$1a:ad6d  10 00         bpl $ad6f
$1a:ad6f  00 1a         brk #$1a
$1a:ad71  10 fc         bpl $ad6f
$1a:ad73  10 c3         bpl $ad38
$1a:ad75  11 04         ora ($04),y
$1a:ad77  13 eb         ora ($eb,s),y
$1a:ad79  14 a0         trb $a0
$1a:ad7b  15 d3         ora $d3,x
$1a:ad7d  16 c6         asl $c6,x
$1a:ad7f  17 fa         ora [$fa],y
$1a:ad81  04 ea         tsb $ea
$1a:ad83  00 e0         brk #$e0
$1a:ad85  00 e7         brk #$e7
$1a:ad87  1a            inc a
$1a:ad88  ed c8 e5      sbc $e5c8
$1a:ad8b  ff e1 0a f5   sbc $f50ae1,x
$1a:ad8f  80 78         bra $ae09
$1a:ad91  78            sei
$1a:ad92  f7 03         sbc [$03],y
$1a:ad94  aa            tax
$1a:ad95  00 e3         brk #$e3
$1a:ad97  24 46         bit $46
$1a:ad99  40            rti
$1a:ad9a  60            rts
$1a:ad9b  c9 c9 c9      cmp #$c9c9
$1a:ad9e  c9 30 5d      cmp #$5d30
$1a:ada1  b5 0c         lda $0c,x
$1a:ada3  c8            iny
$1a:ada4  06 b4         asl $b4
$1a:ada6  b2 0c         lda ($0c)
$1a:ada8  b4 b2         ldy $b2,x
$1a:adaa  12 b4         ora ($b4)
$1a:adac  06 b2         asl $b2
$1a:adae  30 78         bmi $ae28
$1a:adb0  c8            iny
$1a:adb1  18            clc
$1a:adb2  c9 30 5d      cmp #$5d30
$1a:adb5  b5 0c         lda $0c,x
$1a:adb7  c8            iny
$1a:adb8  06 b4         asl $b4
$1a:adba  b2 0c         lda ($0c)
$1a:adbc  b4 b2         ldy $b2,x
$1a:adbe  12 b4         ora ($b4)
$1a:adc0  06 b2         asl $b2
$1a:adc2  0c 7d c8      tsb $c87d
$1a:adc5  24 5d         bit $5d
$1a:adc7  af 18 c9 12   lda $12c918
$1a:adcb  b2 ae         lda ($ae)
$1a:adcd  0c b2 12      tsb $12b2
$1a:add0  b4 b0         ldy $b0,x
$1a:add2  0c b4 12      tsb $12b4
$1a:add5  b6 b2         ldx $b2,y
$1a:add7  0c b6 12      tsb $12b6
$1a:adda  b8            clv
$1a:addb  b4 0c         ldy $0c,x
$1a:addd  b8            clv
$1a:adde  60            rts
$1a:addf  5b            tcd
$1a:ade0  ba            tsx
$1a:ade1  60            rts
$1a:ade2  68            pla
$1a:ade3  c8            iny
$1a:ade4  ed cd ea      sbc $eacd
$1a:ade7  e8            inx
$1a:ade8  06 5d         asl $5d
$1a:adea  b7 c3         lda [$c3],y
$1a:adec  b5 c1         lda $c1,x
$1a:adee  b7 c3         lda [$c3],y
$1a:adf0  b5 c1         lda $c1,x
$1a:adf2  b7 c3         lda [$c3],y
$1a:adf4  b5 c1         lda $c1,x
$1a:adf6  b7 c3         lda [$c3],y
$1a:adf8  b5 c1         lda $c1,x
$1a:adfa  b7 c3         lda [$c3],y
$1a:adfc  b5 c1         lda $c1,x
$1a:adfe  b7 c3         lda [$c3],y
$1a:ae00  b5 12         lda $12,x
$1a:ae02  1d c6 06      ora $06c6,x
$1a:ae05  5d c3 0c      eor $0cc3,x
$1a:ae08  c1 06         cmp ($06,x)
$1a:ae0a  5e b5 0c      lsr $0cb5,x
$1a:ae0d  5d b6 06      eor $06b6,x
$1a:ae10  b7 c3         lda [$c3],y
$1a:ae12  b5 c1         lda $c1,x
$1a:ae14  b7 c3         lda [$c3],y
$1a:ae16  b5 c1         lda $c1,x
$1a:ae18  b7 c3         lda [$c3],y
$1a:ae1a  b5 c1         lda $c1,x
$1a:ae1c  b7 c3         lda [$c3],y
$1a:ae1e  b5 c1         lda $c1,x
$1a:ae20  b7 c3         lda [$c3],y
$1a:ae22  b5 c1         lda $c1,x
$1a:ae24  b7 c3         lda [$c3],y
$1a:ae26  b5 12         lda $12,x
$1a:ae28  c6 06         dec $06
$1a:ae2a  c3 12         cmp $12,s
$1a:ae2c  3d c3 0c      and $0cc3,x
$1a:ae2f  c9 18 c9      cmp #$c918
$1a:ae32  06 5d         asl $5d
$1a:ae34  b7 bb         lda [$bb],y
$1a:ae36  bf b9 bd c1   lda $c1bdb9,x
$1a:ae3a  bb            tyx
$1a:ae3b  bf c3 bd c1   lda $c1bdc3,x
$1a:ae3f  c5 bf         cmp $bf
$1a:ae41  c3 c7         cmp $c7,s
$1a:ae43  c3 48         cmp $48,s
$1a:ae45  c9 18 c9      cmp #$c918
$1a:ae48  06 b7         asl $b7
$1a:ae4a  bb            tyx
$1a:ae4b  bf b9 bd c1   lda $c1bdb9,x
$1a:ae4f  bb            tyx
$1a:ae50  bf c3 bd c1   lda $c1bdc3,x
$1a:ae54  c5 bf         cmp $bf
$1a:ae56  c3 c7         cmp $c7,s
$1a:ae58  c3 48         cmp $48,s
$1a:ae5a  c9 ed c8      cmp #$c8ed
$1a:ae5d  ea            nop
$1a:ae5e  00 60         brk #$60
$1a:ae60  c9 00 ea      cmp #$ea00
$1a:ae63  00 e0         brk #$e0
$1a:ae65  00 ed         brk #$ed
$1a:ae67  b9 e1 0a      lda $0ae1,y
$1a:ae6a  60            rts
$1a:ae6b  c9 c9 c9      cmp #$c9c9
$1a:ae6e  c9 30 5d      cmp #$5d30
$1a:ae71  ad 0c c8      lda $c80c
$1a:ae74  06 b0         asl $b0
$1a:ae76  af 0c b0 af   lda $afb00c
$1a:ae7a  12 b0         ora ($b0)
$1a:ae7c  06 af         asl $af
$1a:ae7e  30 78         bmi $aef8
$1a:ae80  c8            iny
$1a:ae81  18            clc
$1a:ae82  c9 30 5d      cmp #$5d30
$1a:ae85  ad 0c c8      lda $c80c
$1a:ae88  06 b0         asl $b0
$1a:ae8a  af 0c b0 af   lda $afb00c
$1a:ae8e  12 b0         ora ($b0)
$1a:ae90  06 af         asl $af
$1a:ae92  0c 7d c8      tsb $c87d
$1a:ae95  24 5d         bit $5d
$1a:ae97  ab            plb
$1a:ae98  18            clc
$1a:ae99  c9 12 ae      cmp #$ae12
$1a:ae9c  aa            tax
$1a:ae9d  0c ae 12      tsb $12ae
$1a:aea0  b0 ac         bcs $ae4e
$1a:aea2  0c b0 12      tsb $12b0
$1a:aea5  b2 ae         lda ($ae)
$1a:aea7  0c b2 12      tsb $12b2
$1a:aeaa  b4 b0         ldy $b0,x
$1a:aeac  0c b4 60      tsb $60b4
$1a:aeaf  b6 60         ldx $60,y
$1a:aeb1  68            pla
$1a:aeb2  c8            iny
$1a:aeb3  ed a5 ea      sbc $eaa5
$1a:aeb6  e8            inx
$1a:aeb7  06 5d         asl $5d
$1a:aeb9  ab            plb
$1a:aeba  b7 c3         lda [$c3],y
$1a:aebc  b7 ab         lda [$ab],y
$1a:aebe  b7 c3         lda [$c3],y
$1a:aec0  b7 ab         lda [$ab],y
$1a:aec2  b7 c3         lda [$c3],y
$1a:aec4  b7 ab         lda [$ab],y
$1a:aec6  b7 c3         lda [$c3],y
$1a:aec8  b7 ab         lda [$ab],y
$1a:aeca  b7 c3         lda [$c3],y
$1a:aecc  b7 ab         lda [$ab],y
$1a:aece  b7 c3         lda [$c3],y
$1a:aed0  b7 ab         lda [$ab],y
$1a:aed2  b7 c3         lda [$c3],y
$1a:aed4  b7 c9         lda [$c9],y
$1a:aed6  f9 06 06      sbc $0606,y
$1a:aed9  b7 12         lda [$12],y
$1a:aedb  5f c3 06 5d   eor $5d06c3,x
$1a:aedf  ab            plb
$1a:aee0  b7 c3         lda [$c3],y
$1a:aee2  b7 ab         lda [$ab],y
$1a:aee4  b7 c3         lda [$c3],y
$1a:aee6  b7 ab         lda [$ab],y
$1a:aee8  b7 c3         lda [$c3],y
$1a:aeea  b7 ab         lda [$ab],y
$1a:aeec  b7 c3         lda [$c3],y
$1a:aeee  b7 ab         lda [$ab],y
$1a:aef0  b7 c3         lda [$c3],y
$1a:aef2  b7 ab         lda [$ab],y
$1a:aef4  b7 c3         lda [$c3],y
$1a:aef6  b7 ab         lda [$ab],y
$1a:aef8  b7 c3         lda [$c3],y
$1a:aefa  b7 18         lda [$18],y
$1a:aefc  c9 06 b7      cmp #$b706
$1a:aeff  bb            tyx
$1a:af00  bf b9 bd c1   lda $c1bdb9,x
$1a:af04  bb            tyx
$1a:af05  bf c3 bd c1   lda $c1bdc3,x
$1a:af09  c5 bf         cmp $bf
$1a:af0b  c3 c7         cmp $c7,s
$1a:af0d  c3 60         cmp $60,s
$1a:af0f  c9 06 b7      cmp #$b706
$1a:af12  bb            tyx
$1a:af13  bf b9 bd c1   lda $c1bdb9,x
$1a:af17  bb            tyx
$1a:af18  bf c3 bd c1   lda $c1bdc3,x
$1a:af1c  c5 bf         cmp $bf
$1a:af1e  c3 c7         cmp $c7,s
$1a:af20  c3 60         cmp $60,s
$1a:af22  c9 ed b9      cmp #$b9ed
$1a:af25  ea            nop
$1a:af26  00 c9         brk #$c9
$1a:af28  00 ea         brk #$ea
$1a:af2a  f4 e0 01      pea $01e0
$1a:af2d  ed aa e1      sbc $e1aa
$1a:af30  0a            asl a
$1a:af31  e3 18         sbc $18,s
$1a:af33  46 7f         lsr $7f
$1a:af35  12 5d         ora ($5d)
$1a:af37  93 06         sta ($06,s),y
$1a:af39  93 12         sta ($12,s),y
$1a:af3b  c9 06 93      cmp #$9306
$1a:af3e  c9 93 c9      cmp #$c993
$1a:af41  93 0c         sta ($0c,s),y
$1a:af43  91 92         sta ($92),y
$1a:af45  12 93         ora ($93)
$1a:af47  06 93         asl $93
$1a:af49  12 c9         ora ($c9)
$1a:af4b  06 93         asl $93
$1a:af4d  c9 93 c9      cmp #$c993
$1a:af50  93 0c         sta ($0c,s),y
$1a:af52  91 92         sta ($92),y
$1a:af54  12 93         ora ($93)
$1a:af56  06 93         asl $93
$1a:af58  12 c9         ora ($c9)
$1a:af5a  06 93         asl $93
$1a:af5c  c9 93 c9      cmp #$c993
$1a:af5f  93 0c         sta ($0c,s),y
$1a:af61  91 92         sta ($92),y
$1a:af63  12 93         ora ($93)
$1a:af65  06 93         asl $93
$1a:af67  12 c9         ora ($c9)
$1a:af69  06 93         asl $93
$1a:af6b  c9 93 c9      cmp #$c993
$1a:af6e  93 0c         sta ($0c,s),y
$1a:af70  91 92         sta ($92),y
$1a:af72  12 93         ora ($93)
$1a:af74  06 93         asl $93
$1a:af76  12 c9         ora ($c9)
$1a:af78  06 93         asl $93
$1a:af7a  c9 93 c9      cmp #$c993
$1a:af7d  93 0c         sta ($0c,s),y
$1a:af7f  91 92         sta ($92),y
$1a:af81  12 93         ora ($93)
$1a:af83  06 93         asl $93
$1a:af85  12 c9         ora ($c9)
$1a:af87  06 93         asl $93
$1a:af89  c9 93 c9      cmp #$c993
$1a:af8c  93 0c         sta ($0c,s),y
$1a:af8e  91 92         sta ($92),y
$1a:af90  12 93         ora ($93)
$1a:af92  06 93         asl $93
$1a:af94  12 c9         ora ($c9)
$1a:af96  06 93         asl $93
$1a:af98  c9 93 c9      cmp #$c993
$1a:af9b  93 0c         sta ($0c,s),y
$1a:af9d  91 92         sta ($92),y
$1a:af9f  12 93         ora ($93)
$1a:afa1  06 93         asl $93
$1a:afa3  12 c9         ora ($c9)
$1a:afa5  06 93         asl $93
$1a:afa7  c9 93 c9      cmp #$c993
$1a:afaa  93 0c         sta ($0c,s),y
$1a:afac  91 92         sta ($92),y
$1a:afae  12 93         ora ($93)
$1a:afb0  06 93         asl $93
$1a:afb2  12 c9         ora ($c9)
$1a:afb4  06 93         asl $93
$1a:afb6  c9 93 c9      cmp #$c993
$1a:afb9  93 0c         sta ($0c,s),y
$1a:afbb  91 92         sta ($92),y
$1a:afbd  12 93         ora ($93)
$1a:afbf  06 93         asl $93
$1a:afc1  12 c9         ora ($c9)
$1a:afc3  06 93         asl $93
$1a:afc5  c9 93 c9      cmp #$c993
$1a:afc8  93 0c         sta ($0c,s),y
$1a:afca  91 92         sta ($92),y
$1a:afcc  12 93         ora ($93)
$1a:afce  06 93         asl $93
$1a:afd0  12 c9         ora ($c9)
$1a:afd2  06 93         asl $93
$1a:afd4  c9 93 c9      cmp #$c993
$1a:afd7  93 0c         sta ($0c,s),y
$1a:afd9  91 92         sta ($92),y
$1a:afdb  12 93         ora ($93)
$1a:afdd  06 93         asl $93
$1a:afdf  12 c9         ora ($c9)
$1a:afe1  06 93         asl $93
$1a:afe3  c9 93 c9      cmp #$c993
$1a:afe6  93 0c         sta ($0c,s),y
$1a:afe8  91 92         sta ($92),y
$1a:afea  ed b4 12      sbc $12b4
$1a:afed  93 06         sta ($06,s),y
$1a:afef  93 12         sta ($12,s),y
$1a:aff1  c9 06 93      cmp #$9306
$1a:aff4  c9 93 c9      cmp #$c993
$1a:aff7  93 0c         sta ($0c,s),y
$1a:aff9  91 92         sta ($92),y
$1a:affb  12 93         ora ($93)
$1a:affd  06 93         asl $93
$1a:afff  12 c9         ora ($c9)
$1a:b001  06 93         asl $93
$1a:b003  c9 93 c9      cmp #$c993
$1a:b006  93 0c         sta ($0c,s),y
$1a:b008  91 92         sta ($92),y
$1a:b00a  12 93         ora ($93)
$1a:b00c  06 93         asl $93
$1a:b00e  12 c9         ora ($c9)
$1a:b010  06 93         asl $93
$1a:b012  c9 93 c9      cmp #$c993
$1a:b015  93 0c         sta ($0c,s),y
$1a:b017  91 92         sta ($92),y
$1a:b019  12 93         ora ($93)
$1a:b01b  06 93         asl $93
$1a:b01d  12 c9         ora ($c9)
$1a:b01f  06 93         asl $93
$1a:b021  c9 93 c9      cmp #$c993
$1a:b024  93 0c         sta ($0c,s),y
$1a:b026  91 92         sta ($92),y
$1a:b028  12 93         ora ($93)
$1a:b02a  06 93         asl $93
$1a:b02c  12 c9         ora ($c9)
$1a:b02e  06 93         asl $93
$1a:b030  c9 93 c9      cmp #$c993
$1a:b033  93 0c         sta ($0c,s),y
$1a:b035  91 92         sta ($92),y
$1a:b037  12 93         ora ($93)
$1a:b039  06 93         asl $93
$1a:b03b  12 c9         ora ($c9)
$1a:b03d  06 93         asl $93
$1a:b03f  c9 93 c9      cmp #$c993
$1a:b042  93 0c         sta ($0c,s),y
$1a:b044  91 92         sta ($92),y
$1a:b046  12 93         ora ($93)
$1a:b048  06 93         asl $93
$1a:b04a  12 c9         ora ($c9)
$1a:b04c  06 93         asl $93
$1a:b04e  c9 93 c9      cmp #$c993
$1a:b051  93 0c         sta ($0c,s),y
$1a:b053  91 92         sta ($92),y
$1a:b055  12 93         ora ($93)
$1a:b057  06 93         asl $93
$1a:b059  12 c9         ora ($c9)
$1a:b05b  06 93         asl $93
$1a:b05d  c9 93 c9      cmp #$c993
$1a:b060  93 0c         sta ($0c,s),y
$1a:b062  91 92         sta ($92),y
$1a:b064  18            clc
$1a:b065  c9 c9 c9      cmp #$c9c9
$1a:b068  c9 00 ea      cmp #$ea00
$1a:b06b  fd ed 8c      sbc $8ced,x
$1a:b06e  e1 0b         sbc ($0b,x)
$1a:b070  0c c9 06      tsb $06c9
$1a:b073  5d cc 06      eor $06cc,x
$1a:b076  5b            tcd
$1a:b077  cc 0c c9      cpy $c90c
$1a:b07a  06 5d         asl $5d
$1a:b07c  cc 06 5b      cpy $5b06
$1a:b07f  cc 0c c9      cpy $c90c
$1a:b082  06 5d         asl $5d
$1a:b084  cc 06 5b      cpy $5b06
$1a:b087  cc c9 06      cpy $06c9
$1a:b08a  6b            rtl
$1a:b08b  cc 06 6d      cpy $6d06
$1a:b08e  cc 06 6b      cpy $6b06
$1a:b091  cc 0c c9      cpy $c90c
$1a:b094  06 5d         asl $5d
$1a:b096  cc 06 5b      cpy $5b06
$1a:b099  cc 0c c9      cpy $c90c
$1a:b09c  06 5d         asl $5d
$1a:b09e  cc 06 5b      cpy $5b06
$1a:b0a1  cc c9 cc      cpy $ccc9
$1a:b0a4  c9 cc c9      cmp #$c9cc
$1a:b0a7  06 6b         asl $6b
$1a:b0a9  cc 06 6d      cpy $6d06
$1a:b0ac  cc 06 6b      cpy $6b06
$1a:b0af  cc 0c c9      cpy $c90c
$1a:b0b2  06 5d         asl $5d
$1a:b0b4  cc 06 5b      cpy $5b06
$1a:b0b7  cc 0c c9      cpy $c90c
$1a:b0ba  06 5d         asl $5d
$1a:b0bc  cc 06 5b      cpy $5b06
$1a:b0bf  cc 0c c9      cpy $c90c
$1a:b0c2  06 5d         asl $5d
$1a:b0c4  cc 06 5b      cpy $5b06
$1a:b0c7  cc c9 06      cpy $06c9
$1a:b0ca  6b            rtl
$1a:b0cb  cc 06 6d      cpy $6d06
$1a:b0ce  cc 06 6b      cpy $6b06
$1a:b0d1  cc 0c c9      cpy $c90c
$1a:b0d4  06 5b         asl $5b
$1a:b0d6  cc cc 0c      cpy $0ccc
$1a:b0d9  c9 06 cc      cmp #$cc06
$1a:b0dc  cc c9 cc      cpy $ccc9
$1a:b0df  c9 cc c9      cmp #$c9cc
$1a:b0e2  06 6b         asl $6b
$1a:b0e4  cc c9 cc      cpy $ccc9
$1a:b0e7  0c c9 06      tsb $06c9
$1a:b0ea  5d cc 06      eor $06cc,x
$1a:b0ed  5b            tcd
$1a:b0ee  cc 0c c9      cpy $c90c
$1a:b0f1  06 5d         asl $5d
$1a:b0f3  cc 06 5b      cpy $5b06
$1a:b0f6  cc 0c c9      cpy $c90c
$1a:b0f9  06 5d         asl $5d
$1a:b0fb  cc 06 5b      cpy $5b06
$1a:b0fe  cc c9 06      cpy $06c9
$1a:b101  6b            rtl
$1a:b102  cc 06 6d      cpy $6d06
$1a:b105  cc 06 6b      cpy $6b06
$1a:b108  cc 0c c9      cpy $c90c
$1a:b10b  06 5d         asl $5d
$1a:b10d  cc 06 5b      cpy $5b06
$1a:b110  cc 0c c9      cpy $c90c
$1a:b113  06 5d         asl $5d
$1a:b115  cc 06 5b      cpy $5b06
$1a:b118  cc c9 cc      cpy $ccc9
$1a:b11b  c9 cc c9      cmp #$c9cc
$1a:b11e  06 6b         asl $6b
$1a:b120  cc 06 6d      cpy $6d06
$1a:b123  cc 06 6b      cpy $6b06
$1a:b126  cc 0c c9      cpy $c90c
$1a:b129  06 5d         asl $5d
$1a:b12b  cc 06 5b      cpy $5b06
$1a:b12e  cc 0c c9      cpy $c90c
$1a:b131  06 5d         asl $5d
$1a:b133  cc 06 5b      cpy $5b06
$1a:b136  cc 0c c9      cpy $c90c
$1a:b139  06 5d         asl $5d
$1a:b13b  cc 06 5b      cpy $5b06
$1a:b13e  cc c9 06      cpy $06c9
$1a:b141  6b            rtl
$1a:b142  cc 06 6d      cpy $6d06
$1a:b145  cc 06 6b      cpy $6b06
$1a:b148  cc 0c c9      cpy $c90c
$1a:b14b  06 5b         asl $5b
$1a:b14d  cc cc 0c      cpy $0ccc
$1a:b150  c9 06 cc      cmp #$cc06
$1a:b153  cc c9 cc      cpy $ccc9
$1a:b156  c9 cc c9      cmp #$c9cc
$1a:b159  06 6b         asl $6b
$1a:b15b  cc c9 cc      cpy $ccc9
$1a:b15e  0c c9 06      tsb $06c9
$1a:b161  5d cc 06      eor $06cc,x
$1a:b164  5b            tcd
$1a:b165  cc 0c c9      cpy $c90c
$1a:b168  06 5d         asl $5d
$1a:b16a  cc 06 5b      cpy $5b06
$1a:b16d  cc 0c c9      cpy $c90c
$1a:b170  06 5d         asl $5d
$1a:b172  cc 06 5b      cpy $5b06
$1a:b175  cc c9 06      cpy $06c9
$1a:b178  6b            rtl
$1a:b179  cc 06 6d      cpy $6d06
$1a:b17c  cc 06 6b      cpy $6b06
$1a:b17f  cc 0c c9      cpy $c90c
$1a:b182  06 5d         asl $5d
$1a:b184  cc 06 5b      cpy $5b06
$1a:b187  cc 0c c9      cpy $c90c
$1a:b18a  06 5d         asl $5d
$1a:b18c  cc 06 5b      cpy $5b06
$1a:b18f  cc c9 cc      cpy $ccc9
$1a:b192  c9 cc c9      cmp #$c9cc
$1a:b195  06 6b         asl $6b
$1a:b197  cc 06 6d      cpy $6d06
$1a:b19a  cc 06 6b      cpy $6b06
$1a:b19d  cc 0c c9      cpy $c90c
$1a:b1a0  06 5d         asl $5d
$1a:b1a2  cc 06 5b      cpy $5b06
$1a:b1a5  cc 0c c9      cpy $c90c
$1a:b1a8  06 5d         asl $5d
$1a:b1aa  cc 06 5b      cpy $5b06
$1a:b1ad  cc 0c c9      cpy $c90c
$1a:b1b0  06 5d         asl $5d
$1a:b1b2  cc 06 5b      cpy $5b06
$1a:b1b5  cc c9 06      cpy $06c9
$1a:b1b8  6b            rtl
$1a:b1b9  cc 06 6d      cpy $6d06
$1a:b1bc  cc 06 6b      cpy $6b06
$1a:b1bf  cc 0c c9      cpy $c90c
$1a:b1c2  06 5b         asl $5b
$1a:b1c4  cc cc 0c      cpy $0ccc
$1a:b1c7  c9 06 cc      cmp #$cc06
$1a:b1ca  cc c9 cc      cpy $ccc9
$1a:b1cd  c9 cc c9      cmp #$c9cc
$1a:b1d0  06 6b         asl $6b
$1a:b1d2  cc c9 cc      cpy $ccc9
$1a:b1d5  0c c9 0c      tsb $0cc9
$1a:b1d8  5b            tcd
$1a:b1d9  cc c9 cc      cpy $ccc9
$1a:b1dc  c9 cc c9      cmp #$c9cc
$1a:b1df  cc c9 cc      cpy $ccc9
$1a:b1e2  c9 cc c9      cmp #$c9cc
$1a:b1e5  cc c9 cc      cpy $ccc9
$1a:b1e8  c9 cc c9      cmp #$c9cc
$1a:b1eb  cc c9 cc      cpy $ccc9
$1a:b1ee  c9 cc c9      cmp #$c9cc
$1a:b1f1  cc c9 cc      cpy $ccc9
$1a:b1f4  c9 cc c9      cmp #$c9cc
$1a:b1f7  cc c9 06      cpy $06c9
$1a:b1fa  cc cc 0c      cpy $0ccc
$1a:b1fd  c9 06 cc      cmp #$cc06
$1a:b200  cc 0c c9      cpy $c90c
$1a:b203  06 cc         asl $cc
$1a:b205  cc 0c c9      cpy $c90c
$1a:b208  06 6b         asl $6b
$1a:b20a  cc cc 0c      cpy $0ccc
$1a:b20d  c9 06 5b      cmp #$5b06
$1a:b210  cc cc 0c      cpy $0ccc
$1a:b213  c9 06 cc      cmp #$cc06
$1a:b216  cc 0c c9      cpy $c90c
$1a:b219  06 cc         asl $cc
$1a:b21b  cc 0c c9      cpy $c90c
$1a:b21e  06 6b         asl $6b
$1a:b220  cc cc 0c      cpy $0ccc
$1a:b223  c9 06 5b      cmp #$5b06
$1a:b226  cc cc 0c      cpy $0ccc
$1a:b229  c9 06 cc      cmp #$cc06
$1a:b22c  cc 0c c9      cpy $c90c
$1a:b22f  06 cc         asl $cc
$1a:b231  cc 0c c9      cpy $c90c
$1a:b234  06 6b         asl $6b
$1a:b236  cc cc 0c      cpy $0ccc
$1a:b239  c9 06 5b      cmp #$5b06
$1a:b23c  cc cc 0c      cpy $0ccc
$1a:b23f  c9 06 cc      cmp #$cc06
$1a:b242  cc 0c c9      cpy $c90c
$1a:b245  06 cc         asl $cc
$1a:b247  cc 0c c9      cpy $c90c
$1a:b24a  06 6b         asl $6b
$1a:b24c  cc cc 60      cpy $60cc
$1a:b24f  c9 00 ea      cmp #$ea00
$1a:b252  f4 e0 03      pea $03e0
$1a:b255  ed 5a e1      sbc $e15a
$1a:b258  0a            asl a
$1a:b259  60            rts
$1a:b25a  c9 c9 c9      cmp #$c9c9
$1a:b25d  c9 c9 c9      cmp #$c9c9
$1a:b260  c9 c9 12      cmp #$12c9
$1a:b263  4d b2 ae      eor $aeb2
$1a:b266  0c b2 12      tsb $12b2
$1a:b269  b4 b0         ldy $b0,x
$1a:b26b  0c b4 12      tsb $12b4
$1a:b26e  b6 b2         ldx $b2,y
$1a:b270  0c b6 12      tsb $12b6
$1a:b273  b8            clv
$1a:b274  b4 0c         ldy $0c,x
$1a:b276  b8            clv
$1a:b277  60            rts
$1a:b278  4b            phk
$1a:b279  ba            tsx
$1a:b27a  60            rts
$1a:b27b  58            cli
$1a:b27c  c8            iny
$1a:b27d  ed b4 ea      sbc $eab4
$1a:b280  00 ea         brk #$ea
$1a:b282  fa            plx
$1a:b283  e1 0b         sbc ($0b,x)
$1a:b285  e0 02 0c      cpx #$0c02
$1a:b288  c9 0c 5d      cmp #$5d0c
$1a:b28b  a9 08 c9      lda #$c908
$1a:b28e  a6 c9         ldx $c9
$1a:b290  0c a4 06      tsb $06a4
$1a:b293  c9 a6 c9      cmp #$c9a6
$1a:b296  a6 0c         ldx $0c
$1a:b298  a1 e1         lda ($e1,x)
$1a:b29a  09 c9 a9      ora #$a9c9
$1a:b29d  08            php
$1a:b29e  c9 a6 c9      cmp #$c9a6
$1a:b2a1  0c a4 06      tsb $06a4
$1a:b2a4  c9 a6 c9      cmp #$c9a6
$1a:b2a7  a3 0c         lda $0c,s
$1a:b2a9  c9 e1 0b      cmp #$0be1
$1a:b2ac  c9 a9 08      cmp #$08a9
$1a:b2af  c9 a6 c9      cmp #$c9a6
$1a:b2b2  0c a4 06      tsb $06a4
$1a:b2b5  c9 a6 c9      cmp #$c9a6
$1a:b2b8  a6 0c         ldx $0c
$1a:b2ba  a1 e1         lda ($e1,x)
$1a:b2bc  09 c9 a9      ora #$a9c9
$1a:b2bf  06 a6         asl $a6
$1a:b2c1  a6 c9         ldx $c9
$1a:b2c3  a4 c9         ldy $c9
$1a:b2c5  a6 0c         ldx $0c
$1a:b2c7  a6 06         ldx $06
$1a:b2c9  a6 a4         ldx $a4
$1a:b2cb  0c a3 ed      tsb $eda3
$1a:b2ce  5a            phy
$1a:b2cf  ea            nop
$1a:b2d0  00 ea         brk #$ea
$1a:b2d2  f4 e1 0a      pea $0ae1
$1a:b2d5  e0 03 30      cpx #$3003
$1a:b2d8  c9 06 4d      cmp #$4d06
$1a:b2db  b7 bb         lda [$bb],y
$1a:b2dd  bf b9 bd c1   lda $c1bdb9,x
$1a:b2e1  bb            tyx
$1a:b2e2  bf c3 bd c1   lda $c1bdc3,x
$1a:b2e6  c5 bf         cmp $bf
$1a:b2e8  c3 c7         cmp $c7,s
$1a:b2ea  c3 30         cmp $30,s
$1a:b2ec  c9 c9 06      cmp #$06c9
$1a:b2ef  b7 bb         lda [$bb],y
$1a:b2f1  bf b9 bd c1   lda $c1bdb9,x
$1a:b2f5  bb            tyx
$1a:b2f6  bf c3 bd c1   lda $c1bdc3,x
$1a:b2fa  c5 bf         cmp $bf
$1a:b2fc  c3 c7         cmp $c7,s
$1a:b2fe  c3 30         cmp $30,s
$1a:b300  c9 60 c9      cmp #$c960
$1a:b303  e0 03 00      cpx #$0003
$1a:b306  ea            nop
$1a:b307  00 ed         brk #$ed
$1a:b309  c3 18         cmp $18,s
$1a:b30b  5b            tcd
$1a:b30c  ca            dex
$1a:b30d  18            clc
$1a:b30e  5d cb 18      eor $18cb,x
$1a:b311  5b            tcd
$1a:b312  ca            dex
$1a:b313  18            clc
$1a:b314  5d cb 18      eor $18cb,x
$1a:b317  5b            tcd
$1a:b318  ca            dex
$1a:b319  18            clc
$1a:b31a  5d cb 0c      eor $0ccb,x
$1a:b31d  5b            tcd
$1a:b31e  ca            dex
$1a:b31f  ca            dex
$1a:b320  18            clc
$1a:b321  5d cb 18      eor $18cb,x
$1a:b324  5b            tcd
$1a:b325  ca            dex
$1a:b326  18            clc
$1a:b327  5d cb 18      eor $18cb,x
$1a:b32a  5b            tcd
$1a:b32b  ca            dex
$1a:b32c  18            clc
$1a:b32d  5d cb 18      eor $18cb,x
$1a:b330  5b            tcd
$1a:b331  ca            dex
$1a:b332  18            clc
$1a:b333  5d cb 0c      eor $0ccb,x
$1a:b336  5b            tcd
$1a:b337  ca            dex
$1a:b338  ca            dex
$1a:b339  0c 5d cb      tsb $cb5d
$1a:b33c  0c 5b ca      tsb $ca5b
$1a:b33f  18            clc
$1a:b340  ca            dex
$1a:b341  18            clc
$1a:b342  5d cb 18      eor $18cb,x
$1a:b345  5b            tcd
$1a:b346  ca            dex
$1a:b347  18            clc
$1a:b348  5d cb 18      eor $18cb,x
$1a:b34b  5b            tcd
$1a:b34c  ca            dex
$1a:b34d  18            clc
$1a:b34e  5d cb 0c      eor $0ccb,x
$1a:b351  5b            tcd
$1a:b352  ca            dex
$1a:b353  ca            dex
$1a:b354  18            clc
$1a:b355  5d cb 18      eor $18cb,x
$1a:b358  5b            tcd
$1a:b359  ca            dex
$1a:b35a  18            clc
$1a:b35b  5d cb 18      eor $18cb,x
$1a:b35e  5b            tcd
$1a:b35f  ca            dex
$1a:b360  18            clc
$1a:b361  5d cb 18      eor $18cb,x
$1a:b364  5b            tcd
$1a:b365  ca            dex
$1a:b366  18            clc
$1a:b367  5d cb 0c      eor $0ccb,x
$1a:b36a  5b            tcd
$1a:b36b  ca            dex
$1a:b36c  ca            dex
$1a:b36d  0c 5d cb      tsb $cb5d
$1a:b370  0c 5b ca      tsb $ca5b
$1a:b373  18            clc
$1a:b374  ca            dex
$1a:b375  18            clc
$1a:b376  5d cb 18      eor $18cb,x
$1a:b379  5b            tcd
$1a:b37a  ca            dex
$1a:b37b  18            clc
$1a:b37c  5d cb 18      eor $18cb,x
$1a:b37f  5b            tcd
$1a:b380  ca            dex
$1a:b381  18            clc
$1a:b382  5d cb 0c      eor $0ccb,x
$1a:b385  5b            tcd
$1a:b386  ca            dex
$1a:b387  ca            dex
$1a:b388  18            clc
$1a:b389  5d cb 18      eor $18cb,x
$1a:b38c  5b            tcd
$1a:b38d  ca            dex
$1a:b38e  18            clc
$1a:b38f  5d cb 18      eor $18cb,x
$1a:b392  5b            tcd
$1a:b393  ca            dex
$1a:b394  18            clc
$1a:b395  5d cb 18      eor $18cb,x
$1a:b398  5b            tcd
$1a:b399  ca            dex
$1a:b39a  18            clc
$1a:b39b  5d cb 0c      eor $0ccb,x
$1a:b39e  5b            tcd
$1a:b39f  ca            dex
$1a:b3a0  ca            dex
$1a:b3a1  0c 5d cb      tsb $cb5d
$1a:b3a4  0c 5b ca      tsb $ca5b
$1a:b3a7  18            clc
$1a:b3a8  ca            dex
$1a:b3a9  18            clc
$1a:b3aa  59 cb 18      eor $18cb,y
$1a:b3ad  5b            tcd
$1a:b3ae  ca            dex
$1a:b3af  18            clc
$1a:b3b0  59 cb 18      eor $18cb,y
$1a:b3b3  5b            tcd
$1a:b3b4  ca            dex
$1a:b3b5  18            clc
$1a:b3b6  59 cb 18      eor $18cb,y
$1a:b3b9  5b            tcd
$1a:b3ba  ca            dex
$1a:b3bb  06 59         asl $59
$1a:b3bd  cb            wai
$1a:b3be  06 5b         asl $5b
$1a:b3c0  ca            dex
$1a:b3c1  0c c9 18      tsb $18c9
$1a:b3c4  ca            dex
$1a:b3c5  18            clc
$1a:b3c6  59 cb 18      eor $18cb,y
$1a:b3c9  5b            tcd
$1a:b3ca  ca            dex
$1a:b3cb  18            clc
$1a:b3cc  59 cb 18      eor $18cb,y
$1a:b3cf  5b            tcd
$1a:b3d0  ca            dex
$1a:b3d1  18            clc
$1a:b3d2  59 cb 18      eor $18cb,y
$1a:b3d5  5b            tcd
$1a:b3d6  ca            dex
$1a:b3d7  06 59         asl $59
$1a:b3d9  cb            wai
$1a:b3da  06 5b         asl $5b
$1a:b3dc  ca            dex
$1a:b3dd  0c c9 18      tsb $18c9
$1a:b3e0  ca            dex
$1a:b3e1  18            clc
$1a:b3e2  5d cb 18      eor $18cb,x
$1a:b3e5  5b            tcd
$1a:b3e6  ca            dex
$1a:b3e7  18            clc
$1a:b3e8  5d cb 18      eor $18cb,x
$1a:b3eb  5b            tcd
$1a:b3ec  ca            dex
$1a:b3ed  18            clc
$1a:b3ee  5d cb 18      eor $18cb,x
$1a:b3f1  5b            tcd
$1a:b3f2  ca            dex
$1a:b3f3  18            clc
$1a:b3f4  5d cb 18      eor $18cb,x
$1a:b3f7  5b            tcd
$1a:b3f8  ca            dex
$1a:b3f9  18            clc
$1a:b3fa  5d cb 18      eor $18cb,x
$1a:b3fd  5b            tcd
$1a:b3fe  ca            dex
$1a:b3ff  18            clc
$1a:b400  5d cb 18      eor $18cb,x
$1a:b403  5b            tcd
$1a:b404  ca            dex
$1a:b405  18            clc
$1a:b406  5d cb 18      eor $18cb,x
$1a:b409  5b            tcd
$1a:b40a  ca            dex
$1a:b40b  18            clc
$1a:b40c  5d cb 06      eor $06cb,x
$1a:b40f  58            cli
$1a:b410  cb            wai
$1a:b411  06 5a         asl $5a
$1a:b413  cb            wai
$1a:b414  06 5c         asl $5c
$1a:b416  cb            wai
$1a:b417  06 5d         asl $5d
$1a:b419  cb            wai
$1a:b41a  06 5a         asl $5a
$1a:b41c  cb            wai
$1a:b41d  0c 5d cb      tsb $cb5d
$1a:b420  06 5a         asl $5a
$1a:b422  cb            wai
$1a:b423  0c 5c cb      tsb $cb5c
$1a:b426  06 5a         asl $5a
$1a:b428  cb            wai
$1a:b429  06 58         asl $58
$1a:b42b  cb            wai
$1a:b42c  06 5a         asl $5a
$1a:b42e  cb            wai
$1a:b42f  06 5c         asl $5c
$1a:b431  cb            wai
$1a:b432  06 5d         asl $5d
$1a:b434  cb            wai
$1a:b435  06 5d         asl $5d
$1a:b437  cb            wai
$1a:b438  00 e0         brk #$e0
$1a:b43a  00 ea         brk #$ea
$1a:b43c  00 ed         brk #$ed
$1a:b43e  8c e1 09      sty $09e1
$1a:b441  e3 03         sbc $03,s
$1a:b443  5a            phy
$1a:b444  1e 0c c9      asl $c90c,x
$1a:b447  0c 6d b7      tsb $b76d
$1a:b44a  f9 06 06      sbc $0606,y
$1a:b44d  ab            plb
$1a:b44e  48            pha
$1a:b44f  c9 0c c9      cmp #$c90c
$1a:b452  b7 f9         lda [$f9],y
$1a:b454  06 06         asl $06
$1a:b456  ab            plb
$1a:b457  48            pha
$1a:b458  c9 0c c9      cmp #$c90c
$1a:b45b  b7 f9         lda [$f9],y
$1a:b45d  06 06         asl $06
$1a:b45f  ab            plb
$1a:b460  48            pha
$1a:b461  c9 0c c9      cmp #$c90c
$1a:b464  b7 f9         lda [$f9],y
$1a:b466  06 06         asl $06
$1a:b468  ab            plb
$1a:b469  48            pha
$1a:b46a  c9 ed 96      cmp #$96ed
$1a:b46d  0c c9 b7      tsb $b7c9
$1a:b470  f9 06 06      sbc $0606,y
$1a:b473  ab            plb
$1a:b474  18            clc
$1a:b475  c9 0c c9      cmp #$c90c
$1a:b478  b7 f9         lda [$f9],y
$1a:b47a  06 06         asl $06
$1a:b47c  ab            plb
$1a:b47d  18            clc
$1a:b47e  c9 0c c9      cmp #$c90c
$1a:b481  b7 f9         lda [$f9],y
$1a:b483  06 06         asl $06
$1a:b485  ab            plb
$1a:b486  18            clc
$1a:b487  c9 0c c9      cmp #$c90c
$1a:b48a  b7 f9         lda [$f9],y
$1a:b48c  06 06         asl $06
$1a:b48e  ab            plb
$1a:b48f  18            clc
$1a:b490  c9 0c c9      cmp #$c90c
$1a:b493  b7 f9         lda [$f9],y
$1a:b495  06 06         asl $06
$1a:b497  ab            plb
$1a:b498  18            clc
$1a:b499  c9 0c c9      cmp #$c90c
$1a:b49c  b7 f9         lda [$f9],y
$1a:b49e  06 06         asl $06
$1a:b4a0  ab            plb
$1a:b4a1  18            clc
$1a:b4a2  c9 0c c9      cmp #$c90c
$1a:b4a5  b7 f9         lda [$f9],y
$1a:b4a7  06 06         asl $06
$1a:b4a9  ab            plb
$1a:b4aa  18            clc
$1a:b4ab  c9 0c c9      cmp #$c90c
$1a:b4ae  b7 f9         lda [$f9],y
$1a:b4b0  06 06         asl $06
$1a:b4b2  ab            plb
$1a:b4b3  18            clc
$1a:b4b4  c9 0c c9      cmp #$c90c
$1a:b4b7  b7 f9         lda [$f9],y
$1a:b4b9  06 06         asl $06
$1a:b4bb  ab            plb
$1a:b4bc  18            clc
$1a:b4bd  c9 0c c9      cmp #$c90c
$1a:b4c0  b7 f9         lda [$f9],y
$1a:b4c2  06 06         asl $06
$1a:b4c4  ab            plb
$1a:b4c5  18            clc
$1a:b4c6  c9 0c c9      cmp #$c90c
$1a:b4c9  b7 f9         lda [$f9],y
$1a:b4cb  06 06         asl $06
$1a:b4cd  ab            plb
$1a:b4ce  18            clc
$1a:b4cf  c9 0c c9      cmp #$c90c
$1a:b4d2  b7 f9         lda [$f9],y
$1a:b4d4  06 06         asl $06
$1a:b4d6  ab            plb
$1a:b4d7  18            clc
$1a:b4d8  c9 0c c9      cmp #$c90c
$1a:b4db  b7 f9         lda [$f9],y
$1a:b4dd  06 06         asl $06
$1a:b4df  ab            plb
$1a:b4e0  18            clc
$1a:b4e1  c9 0c c9      cmp #$c90c
$1a:b4e4  b7 f9         lda [$f9],y
$1a:b4e6  06 06         asl $06
$1a:b4e8  ab            plb
$1a:b4e9  18            clc
$1a:b4ea  c9 0c c9      cmp #$c90c
$1a:b4ed  b7 f9         lda [$f9],y
$1a:b4ef  06 06         asl $06
$1a:b4f1  ab            plb
$1a:b4f2  18            clc
$1a:b4f3  c9 0c c9      cmp #$c90c
$1a:b4f6  b7 f9         lda [$f9],y
$1a:b4f8  06 06         asl $06
$1a:b4fa  ab            plb
$1a:b4fb  18            clc
$1a:b4fc  c9 60 c9      cmp #$c960
$1a:b4ff  c9 c9 c9      cmp #$c9c9
$1a:b502  c9 0c c9      cmp #$c90c
$1a:b505  b7 f9         lda [$f9],y
$1a:b507  06 06         asl $06
$1a:b509  ab            plb
$1a:b50a  18            clc
$1a:b50b  c9 0c c9      cmp #$c90c
$1a:b50e  b7 f9         lda [$f9],y
$1a:b510  06 06         asl $06
$1a:b512  ab            plb
$1a:b513  18            clc
$1a:b514  c9 60 c9      cmp #$c960
$1a:b517  0c c9 b7      tsb $b7c9
$1a:b51a  f9 06 06      sbc $0606,y
$1a:b51d  ab            plb
$1a:b51e  18            clc
$1a:b51f  c9 0c c9      cmp #$c90c
$1a:b522  b7 f9         lda [$f9],y
$1a:b524  06 06         asl $06
$1a:b526  ab            plb
$1a:b527  18            clc
$1a:b528  c9 60 c9      cmp #$c960
$1a:b52b  00 ea         brk #$ea
$1a:b52d  f4 e0 03      pea $03e0
$1a:b530  ed 37 e1      sbc $e137
$1a:b533  08            php
$1a:b534  66 c9         ror $c9
$1a:b536  60            rts
$1a:b537  c9 c9 c9      cmp #$c9c9
$1a:b53a  c9 c9 c9      cmp #$c9c9
$1a:b53d  c9 12 3d      cmp #$3d12
$1a:b540  b2 ae         lda ($ae)
$1a:b542  0c b2 12      tsb $12b2
$1a:b545  b4 b0         ldy $b0,x
$1a:b547  0c b4 12      tsb $12b4
$1a:b54a  b6 b2         ldx $b2,y
$1a:b54c  0c b6 12      tsb $12b6
$1a:b54f  b8            clv
$1a:b550  b4 0c         ldy $0c,x
$1a:b552  b8            clv
$1a:b553  60            rts
$1a:b554  ba            tsx
$1a:b555  60            rts
$1a:b556  48            pha
$1a:b557  c8            iny
$1a:b558  ed aa ea      sbc $eaaa
$1a:b55b  00 ea         brk #$ea
$1a:b55d  fa            plx
$1a:b55e  e1 0b         sbc ($0b,x)
$1a:b560  e0 02 c9      cpx #$c902
$1a:b563  e1 09         sbc ($09,x)
$1a:b565  c9 e1 0b      cmp #$0be1
$1a:b568  c9 e1 09      cmp #$09e1
$1a:b56b  c9 ed 37      cmp #$37ed
$1a:b56e  ea            nop
$1a:b56f  00 ea         brk #$ea
$1a:b571  f4 e1 08      pea $08e1
$1a:b574  e0 03 30      cpx #$3003
$1a:b577  c9 06 3d      cmp #$3d06
$1a:b57a  b7 bb         lda [$bb],y
$1a:b57c  bf b9 bd c1   lda $c1bdb9,x
$1a:b580  bb            tyx
$1a:b581  bf c3 bd c1   lda $c1bdc3,x
$1a:b585  c5 bf         cmp $bf
$1a:b587  c3 c7         cmp $c7,s
$1a:b589  c3 30         cmp $30,s
$1a:b58b  c9 c9 06      cmp #$06c9
$1a:b58e  b7 bb         lda [$bb],y
$1a:b590  bf b9 bd c1   lda $c1bdb9,x
$1a:b594  bb            tyx
$1a:b595  bf c3 bd c1   lda $c1bdc3,x
$1a:b599  c5 bf         cmp $bf
$1a:b59b  c3 c7         cmp $c7,s
$1a:b59d  c3 30         cmp $30,s
$1a:b59f  c9 5a c9      cmp #$c95a
$1a:b5a2  e0 03 00      cpx #$0003
$1a:b5a5  00 1c         brk #$1c
$1a:b5a7  00 34         brk #$34
$1a:b5a9  2c 53 73      bit $7353
$1a:b5ac  82 77 4f      brl $0526
$1a:b5af  86 ac         stx $ac
$1a:b5b1  8c 2a 8d      sty $8d2a
$1a:b5b4  2a            rol a
$1a:b5b5  8d f5 a0      sta $a0f5
$1a:b5b8  2b            pld
$1a:b5b9  a1 46         lda ($46,x)
$1a:b5bb  a1 46         lda ($46,x)
$1a:b5bd  a1 ab         lda ($ab,x)
$1a:b5bf  a5 ab         lda $ab
$1a:b5c1  a5 95         lda $95
$1a:b5c3  af 95 af 02   lda $02af95
$1a:b5c7  00 fd         brk #$fd
$1a:b5c9  0f 77 b2 00   ora $00b277
$1a:b5cd  00 07         brk #$07
$1a:b5cf  11 10         ora ($10),y
$1a:b5d1  17 15         ora [$15],y
$1a:b5d3  18            clc
$1a:b5d4  19 1a 04      ora $041a,y
$1a:b5d7  04 00         tsb $00
$1a:b5d9  10 6f         bpl $b64a
$1a:b5db  7b            tdc
$1a:b5dc  ff e4 1a 70   sbc $701ae4,x
$1a:b5e0  0e 69 72      asl $7269
$1a:b5e3  fb            xce
$1a:b5e4  e1 18         sbc ($18,x)
$1a:b5e6  ef 44 6a 01   sbc $016a44
$1a:b5ea  0b            phd
$1a:b5eb  06 b7         asl $b7
$1a:b5ed  9a            txs
$1a:b5ee  33 0b         and ($0b,s),y
$1a:b5f0  8e 0c 66      stx $660c
$1a:b5f3  a3 00         lda $00,s
$1a:b5f5  18            clc
$1a:b5f6  86 2b         stx $2b
$1a:b5f8  1b            tcs
$1a:b5f9  8e 22 38      stx $3822
$1a:b5fc  bc 88 61      ldy $6188,x
$1a:b5ff  8f c0 95 80   sta $8095c0
$1a:b603  86 84         stx $84
$1a:b605  f6 c1         inc $c1,x
$1a:b607  96 0b         stx $0b,y
$1a:b609  03 be         ora $be,s
$1a:b60b  d3 00         cmp ($00,s),y
$1a:b60d  42 c3         wdm #$c3
$1a:b60f  bf c5 5d 8a   lda $8a5dc5,x
$1a:b613  a1 f6         lda ($f6,x)
$1a:b615  2c 01 d0      bit $d001
$1a:b618  35 bd         and $bd,x
$1a:b61a  1e 98 04      asl $0498,x
$1a:b61d  2c 44 20      bit $2044
$1a:b620  ba            tsx
$1a:b621  9d 4d 08      sta $084d,x
$1a:b624  1a            inc a
$1a:b625  d2 00         cmp ($00)
$1a:b627  13 ce         ora ($ce,s),y
$1a:b629  ee 55 0f      inc $0f55
$1a:b62c  e9 60 12      sbc #$1260
$1a:b62f  81 ad         sta ($ad,x)
$1a:b631  e3 61         sbc $61,s
$1a:b633  89 ec 77      bit #$77ec
$1a:b636  12 a0         ora ($a0)
$1a:b638  6b            rtl
$1a:b639  62 88 e1      per $97c4
$1a:b63c  b0 a8         bcs $b5e6
$1a:b63e  a3 7f         lda $7f,s
$1a:b640  32 b0         and ($b0)
$1a:b642  9f c4 e4 58   sta $58e4c4,x
$1a:b646  3f b6 0c f2   and $f20cb6,x
$1a:b64a  52 19         eor ($19)
$1a:b64c  49 3c ee      eor #$ee3c
$1a:b64f  a4 53         ldy $53
$1a:b651  45 0c         eor $0c
$1a:b653  9a            txs
$1a:b654  10 8f         bpl $b5e5
$1a:b656  63 b8         adc $b8,s
$1a:b658  63 93         adc $93,s
$1a:b65a  43 30         eor $30,s
$1a:b65c  97 00         sta [$00],y
$1a:b65e  68            pla
$1a:b65f  88            dey
$1a:b660  1f ff e8 4e   ora $4ee8ff,x
$1a:b664  b1 98         lda ($98),y
$1a:b666  f9 07 ec      sbc $ec07,y
$1a:b669  5e 1a 77      lsr $771a,x
$1a:b66c  7b            tdc
$1a:b66d  dd ae d8      cmp $d8ae,x
$1a:b670  3c 1e fb      bit $fb1e,x
$1a:b673  7d 97 37      adc $3797,x
$1a:b676  0b            phd
$1a:b677  bd 2e f7      lda $f72e,x
$1a:b67a  72 28         adc ($28)
$1a:b67c  73 6e         adc ($6e,s),y
$1a:b67e  3a            dec a
$1a:b67f  d7 7c         cmp [$7c],y
$1a:b681  b5 47         lda $47,x
$1a:b683  16 31         asl $31,x
$1a:b685  a1 d8         lda ($d8,x)
$1a:b687  90 37         bcc $b6c0
$1a:b689  1f a5 10 c3   ora $c310a5,x
$1a:b68d  bc b1 3d      ldy $3db1,x
$1a:b690  4d 7c c8      eor $c87c
$1a:b693  c7 76         cmp [$76]
$1a:b695  0c 21 0a      tsb $0a21
$1a:b698  f1 38         sbc ($38),y
$1a:b69a  6c 24 94      jmp ($9424)
$1a:b69d  c7 72         cmp [$72]
$1a:b69f  9c 14 b6      stz $b614
$1a:b6a2  46 92         lsr $92
$1a:b6a4  9c 4c 16      stz $164c
$1a:b6a7  b3 01         lda ($01,s),y
$1a:b6a9  95 a8         sta $a8,x
$1a:b6ab  a6 55         ldx $55
$1a:b6ad  01 aa         ora ($aa,x)
$1a:b6af  55 60         eor $60,x
$1a:b6b1  30 1a         bmi $b6cd
$1a:b6b3  c4 b5         cpy $b5
$1a:b6b5  24 d5         bit $d5
$1a:b6b7  78            sei
$1a:b6b8  0d 5a af      ora $af5a
$1a:b6bb  0b            phd
$1a:b6bc  58            cli
$1a:b6bd  93 1d         sta ($1d,s),y
$1a:b6bf  60            rts
$1a:b6c0  ac 20 aa      ldy $aa20
$1a:b6c3  55 9a         eor $9a,x
$1a:b6c5  01 01         ora ($01,x)
$1a:b6c7  82 49 df      brl $9613
$1a:b6ca  ef 33 9a 4d   sbc $4d9a33
$1a:b6ce  60            rts
$1a:b6cf  10 0b         bpl $b6dc
$1a:b6d1  ed f9 ea      sbc $eaf9
$1a:b6d4  0f 92 77 94   ora $947792
$1a:b6d8  da            phx
$1a:b6d9  6e f5 8e      ror $8ef5
$1a:b6dc  28            plp
$1a:b6dd  00 a9         brk #$a9
$1a:b6df  f0 0c         beq $b6ed
$1a:b6e1  0e f8 2e      asl $2ef8
$1a:b6e4  3b            tsc
$1a:b6e5  d0 b8         bne $b69f
$1a:b6e7  e3 82         sbc $82,s
$1a:b6e9  09 ad f4      ora #$f4ad
$1a:b6ec  7a            ply
$1a:b6ed  45 08         eor $08
$1a:b6ef  1f e0 00 04   ora $0400e0,x
$1a:b6f3  4f 7f f3 f9   eor $f9f37f
$1a:b6f7  85 83         sta $83
$1a:b6f9  6c 17 11      jmp ($1117)
$1a:b6fc  fa            plx
$1a:b6fd  eb            xba
$1a:b6fe  7e 9f 4d      ror $4d9f,x
$1a:b701  6e 87 5b      ror $5b87
$1a:b704  a3 d0         lda $d0,s
$1a:b706  e8            inx
$1a:b707  89 f3 a9      bit #$a9f3
$1a:b70a  d6 ea         dec $ea,x
$1a:b70c  f5 3a         sbc $3a,x
$1a:b70e  a2 7c 85      ldx #$857c
$1a:b711  4c df 5a      jmp $5adf
$1a:b714  df ee 34 3e   cmp $3e34ee,x
$1a:b718  24 14         bit $14
$1a:b71a  2b            pld
$1a:b71b  86 fc         stx $fc
$1a:b71d  4a            lsr a
$1a:b71e  18            clc
$1a:b71f  a4 6b         ldy $6b
$1a:b721  a1 91         lda ($91,x)
$1a:b723  39 ea de      and $deea,y
$1a:b726  bb            tyx
$1a:b727  5d 95 f9      eor $f995,x
$1a:b72a  77 bb         adc [$bb],y
$1a:b72c  a3 fa         lda $fa,s
$1a:b72e  fd 7d 04      sbc $047d,x
$1a:b731  a5 f6         lda $f6
$1a:b733  fc 0d 07      jsr ($070d,x)
$1a:b736  c9 3b fb      cmp #$fb3b
$1a:b739  7a            ply
$1a:b73a  4c 1d f0      jmp $f01d
$1a:b73d  3c f0 2f      bit $2ff0,x
$1a:b740  13 1c         ora ($1c,s),y
$1a:b742  2f ab d7 eb   and $ebd7ab
$1a:b746  3c 80 6e      bit $6e80,x
$1a:b749  bd 9e c1      lda $c19e,x
$1a:b74c  4a            lsr a
$1a:b74d  03 c3         ora $c3,s
$1a:b74f  03 b9         ora $b9,s
$1a:b751  dd 1e c3      cmp $c31e,x
$1a:b754  02 37         cop #$37
$1a:b756  07 48         ora [$48]
$1a:b758  3c 4b 47      bit $474b,x
$1a:b75b  a1 d6         lda ($d6,x)
$1a:b75d  90 83         bcc $b6e2
$1a:b75f  5b            tcd
$1a:b760  a3 d6         lda $d6,s
$1a:b762  8d db 57      sta $57db
$1a:b765  a9 28 96      lda #$9628
$1a:b768  ac ac e1      ldy $e1ac
$1a:b76b  71 21         adc ($21),y
$1a:b76d  0a            asl a
$1a:b76e  e8            inx
$1a:b76f  06 ec         asl $ec
$1a:b771  ad 05 68      lda $6805
$1a:b774  62 d7 22      per $da4e
$1a:b777  77 86         adc [$86],y
$1a:b779  68            pla
$1a:b77a  20 c7 7e      jsr $7ec7
$1a:b77d  47 66         eor [$66]
$1a:b77f  68            pla
$1a:b780  37 41         and [$41],y
$1a:b782  07 57         ora [$57]
$1a:b784  5b            tcd
$1a:b785  aa            tax
$1a:b786  07 1b         ora [$1b]
$1a:b788  a0 81 ec      ldy #$ec81
$1a:b78b  6e 3b 16      ror $163b
$1a:b78e  c4 f8         cpy $f8
$1a:b790  02 59         cop #$59
$1a:b792  e4 12         cpx $12
$1a:b794  0b            phd
$1a:b795  0e b7 15      asl $15b7
$1a:b798  8d c7 e0      sta $e0c7
$1a:b79b  7e d8 17      ror $17d8,x
$1a:b79e  98            tya
$1a:b79f  ef e4 b2 67   sbc $67b2e4
$1a:b7a3  78            sei
$1a:b7a4  58            cli
$1a:b7a5  9e 51 ad      stz $ad51,x
$1a:b7a8  99 3f 86      sta $863f,y
$1a:b7ab  c1 bf         cmp ($bf,x)
$1a:b7ad  c5 5d         cmp $5d
$1a:b7af  9e a1 fd      stz $fda1,x
$1a:b7b2  7c 00 50      jmp ($5000,x)
$1a:b7b5  35 b2         and $b2,x
$1a:b7b7  09 80 3c      ora #$3c80
$1a:b7ba  5e 41 75      lsr $7541,x
$1a:b7bd  7a            ply
$1a:b7be  98            tya
$1a:b7bf  90 03         bcc $b7c4
$1a:b7c1  80 2d         bra $b7f0
$1a:b7c3  17 88         ora [$88],y
$1a:b7c5  dd de a6      cmp $a6de,x
$1a:b7c8  34 07         bit $07,x
$1a:b7ca  e0 0b 44      cpx #$440b
$1a:b7cd  02 84         cop #$84
$1a:b7cf  60            rts
$1a:b7d0  04 98         tsb $98
$1a:b7d2  b4 44         ldy $44,x
$1a:b7d4  22 f4 0c 19   jsl $190cf4
$1a:b7d8  58            cli
$1a:b7d9  01 24         ora ($24,x)
$1a:b7db  2d 22 89      and $8922
$1a:b7de  34 05         bit $05,x
$1a:b7e0  be 22 b4      ldx $b422,y
$1a:b7e3  d2 e5         cmp ($e5)
$1a:b7e5  f4 cd 10      pea $10cd
$1a:b7e8  d2 ef         cmp ($ef)
$1a:b7ea  77 c7         adc [$c7],y
$1a:b7ec  81 39         sta ($39,x)
$1a:b7ee  04 85         tsb $85
$1a:b7f0  fe 3a fe      inc $fe3a,x
$1a:b7f3  9e e7 75      stz $75e7,x
$1a:b7f6  d4 c2         pei ($c2)
$1a:b7f8  74 7a         stz $7a,x
$1a:b7fa  48            pha
$1a:b7fb  80 d7         bra $b7d4
$1a:b7fd  83 46         sta $46,s
$1a:b7ff  c1 60         cmp ($60,x)
$1a:b801  c2 58         rep #$58
$1a:b803  37 36         and [$36],y
$1a:b805  c4 88         cpy $88
$1a:b807  a6 07         ldx $07
$1a:b809  09 20 07      ora #$0720
$1a:b80c  16 13         asl $13,x
$1a:b80e  8c 94 0c      sty $0c94
$1a:b811  32 88         and ($88)
$1a:b813  30 ca         bmi $b7df
$1a:b815  80 4e         bra $b865
$1a:b817  00 78         brk #$78
$1a:b819  6c 3e 38      jmp ($383e)
$1a:b81c  a2 50 16      ldx #$1650
$1a:b81f  22 90 05 88   jsl $880590
$1a:b823  0f 40 7a 13   ora $137a40
$1a:b827  09 8d 8d      ora #$8d8d
$1a:b82a  28            plp
$1a:b82b  0c 10 26      tsb $2610
$1a:b82e  8b            phb
$1a:b82f  18            clc
$1a:b830  a5 a3         lda $a3
$1a:b832  d1 49         cmp ($49),y
$1a:b834  88            dey
$1a:b835  b4 85         ldy $85,x
$1a:b837  a5 21         lda $21
$1a:b839  82 49 da      brl $9285
$1a:b83c  37 26         and [$26],y
$1a:b83e  82 c4 30      brl $e905
$1a:b841  0f 12 aa c2   ora $c2aa12
$1a:b845  5c 02 2d 28   jml $282d02
$1a:b849  44 3b 04      mvp $04,$3b
$1a:b84c  01 28         ora ($28,x)
$1a:b84e  24 bc         bit $bc
$1a:b850  9a            txs
$1a:b851  42 d1         wdm #$d1
$1a:b853  97 41         sta [$41],y
$1a:b855  6a            ror a
$1a:b856  90 18         bcc $b870
$1a:b858  0d 5a ae      ora $ae5a
$1a:b85b  f7 65         sbc [$65],y
$1a:b85d  68            pla
$1a:b85e  4b            phk
$1a:b85f  b7 90         lda [$90],y
$1a:b861  38            sec
$1a:b862  ae d2 06      ldx $06d2
$1a:b865  07 66         ora [$66]
$1a:b867  48            pha
$1a:b868  ec 50 81      cpx $8150
$1a:b86b  b2 63         lda ($63)
$1a:b86d  93 59         sta ($59,s),y
$1a:b86f  b7 08         lda [$08],y
$1a:b871  40            rti
$1a:b872  dd 8d e1      cmp $e18d,x
$1a:b875  ba            tsx
$1a:b876  1c 0e 0f      trb $0f0e
$1a:b879  0b            phd
$1a:b87a  87 25         sta [$25]
$1a:b87c  90 c8         bcc $b846
$1a:b87e  a4 65         ldy $65
$1a:b880  83 2a         sta $2a,s
$1a:b882  84 a6         sty $a6
$1a:b884  55 01         eor $01,x
$1a:b886  ac ca e5      ldy $e5ca
$1a:b889  b2 83         lda ($83)
$1a:b88b  08            php
$1a:b88c  04 82         tsb $82
$1a:b88e  a9 55 80      lda #$8055
$1a:b891  cb            wai
$1a:b892  4c 03 57      jmp $5703
$1a:b895  34 09         bit $09,x
$1a:b897  a8            tay
$1a:b898  82 61 0c      brl $c4fc
$1a:b89b  80 c1         bra $b85e
$1a:b89d  20 b5 93      jsr $93b5
$1a:b8a0  58            cli
$1a:b8a1  44 3b 7d      mvp $7d,$3b
$1a:b8a4  d4 21         pei ($21)
$1a:b8a6  84 c6         sty $c6
$1a:b8a8  09 08 34      ora #$3408
$1a:b8ab  0c 3f bb      tsb $bb3f
$1a:b8ae  e4 4a         cpx $4a
$1a:b8b0  97 76         sta [$76],y
$1a:b8b2  a9 59 80      lda #$8059
$1a:b8b5  c2 41         rep #$41
$1a:b8b7  e0 6c 08      cpx #$086c
$1a:b8ba  7f 6e ac 69   adc $69ac6e,x
$1a:b8be  15 18         ora $18,x
$1a:b8c0  d5 80         cmp $80,x
$1a:b8c2  c0 ee 00      cpy #$00ee
$1a:b8c5  a0 24 c0      ldy #$c024
$1a:b8c8  24 1f         bit $1f
$1a:b8ca  d4 90         pei ($90)
$1a:b8cc  d6 6a         dec $6a,x
$1a:b8ce  ad f0 77      lda $77f0
$1a:b8d1  02 44         cop #$44
$1a:b8d3  8d 40 c1      sta $c140
$1a:b8d6  33 e8         and ($e8,s),y
$1a:b8d8  49 cc 02      eor #$02cc
$1a:b8db  a2 13 88      ldx #$8813
$1a:b8de  29 41 a6      and #$a641
$1a:b8e1  2c c1 47      bit $47c1
$1a:b8e4  82 84 56      brl $0f6b
$1a:b8e7  81 d8         sta ($d8,x)
$1a:b8e9  ec f6 97      cpx $97f6
$1a:b8ec  20 11 03      jsr $0311
$1a:b8ef  20 06 c6      jsr $c606
$1a:b8f2  67 36         adc [$36]
$1a:b8f4  a7 c0         lda [$c0]
$1a:b8f6  35 bf         and $bf,x
$1a:b8f8  4f a6 b6 01   eor $01b6a6
$1a:b8fc  b5 df         lda $df,x
$1a:b8fe  3f 01 df 5a   and $5adf01,x
$1a:b902  dd 1e 87      cmp $871e,x
$1a:b905  44 ef 8c      mvp $8c,$ef
$1a:b908  0e fb 7a      asl $7afb
$1a:b90b  fc bf 87      jsr ($87bf,x)
$1a:b90e  c4 54         cpy $54
$1a:b910  4e f5 df      lsr $dff5
$1a:b913  89 f4 2c      bit #$2cf4
$1a:b916  64 a2         stz $a2
$1a:b918  77 ce         adc [$ce],y
$1a:b91a  80 1a         bra $b936
$1a:b91c  00 c0         brk #$c0
$1a:b91e  92 bc         sta ($bc)
$1a:b920  23 51         and $51,s
$1a:b922  a9 d5 6a      lda #$6ad5
$1a:b925  f5 32         sbc $32,x
$1a:b927  77 84         adc [$84],y
$1a:b929  67 b0         adc [$b0]
$1a:b92b  39 0c 8e      and $8e0c,y
$1a:b92e  40            rti
$1a:b92f  de a3 61      dec $61a3,x
$1a:b932  df 8d 43 31   cmp $31438d,x
$1a:b936  99 cc 1b      sta $1bcc,y
$1a:b939  e7 0f         sbc [$0f]
$1a:b93b  ad cb 27      lda $27cb
$1a:b93e  02 64         cop #$64
$1a:b940  f0 8c         beq $b8ce
$1a:b942  fe b7 97      inc $97b7,x
$1a:b945  fd e5 bb      sbc $bbe5,x
$1a:b948  eb            xba
$1a:b949  7f cb 5e 03   adc $035ecb,x
$1a:b94d  be bc d9      ldx $d9bc,y
$1a:b950  4c 9e 54      jmp $549e
$1a:b953  5f 08 90 ef   eor $ef9008,x
$1a:b957  e7 33         sbc [$33]
$1a:b959  99 d2 fc      sta $fcd2,y
$1a:b95c  e1 cb         sbc ($cb,x)
$1a:b95e  44 4a 3d      mvp $3d,$4a
$1a:b961  b9 94 3d      lda $3d94,y
$1a:b964  9e c6 48      stz $48c6,x
$1a:b967  3e 88 ba      rol $ba88,x
$1a:b96a  05 c1         ora $c1
$1a:b96c  64 83         stz $83
$1a:b96e  d9 c9 47      cmp $47c9,y
$1a:b971  bd df 60      lda $60df,x
$1a:b974  7d be d2      adc $d2be,x
$1a:b977  48            pha
$1a:b978  60            rts
$1a:b979  5f 42 3a 31   eor $313a42,x
$1a:b97d  d1 7c         cmp ($7c),y
$1a:b97f  bd 7e b7      lda $b77e,x
$1a:b982  c9 07 e1      cmp #$e107
$1a:b985  ee 08 90      inc $9008
$1a:b988  06 a8         asl $a8
$1a:b98a  3c b0 2f      bit $2fb0,x
$1a:b98d  74 00         stz $00,x
$1a:b98f  89 3c f4      bit #$f43c
$1a:b992  8f 65 d5 6a   sta $6ad565
$1a:b996  f5 25         sbc $25,x
$1a:b998  f3 d6         sbc ($d6,s),y
$1a:b99a  3d 97 23      and $2397,x
$1a:b99d  90 37         bcc $b9d6
$1a:b99f  96 4b         stx $4b,y
$1a:b9a1  02 aa         cop #$aa
$1a:b9a3  07 ba         ora [$ba]
$1a:b9a5  66 73         ror $73
$1a:b9a7  07 f2         ora [$f2]
$1a:b9a9  cd 36 43      cmp $4336
$1a:b9ac  7e 39 4c      ror $4c39,x
$1a:b9af  b2 3c         lda ($3c)
$1a:b9b1  ef 4e 90 7b   sbc $7b904e
$1a:b9b5  2a            rol a
$1a:b9b6  f0 57         beq $ba0f
$1a:b9b8  a1 fd         lda ($fd,x)
$1a:b9ba  bd eb 73      lda $73eb,x
$1a:b9bd  c9 8a e5      cmp #$e58a
$1a:b9c0  de db 20      dec $20db,x
$1a:b9c3  f6 5f         inc $5f,x
$1a:b9c5  32 88         and ($88)
$1a:b9c7  3c d9 4c      bit $4cd9,x
$1a:b9ca  9d f3 cc      sta $ccf3,x
$1a:b9cd  f5 6e         sbc $6e,x
$1a:b9cf  f2 3c         sbc ($3c)
$1a:b9d1  3b            tsc
$1a:b9d2  d9 cc e6      cmp $e6cc,y
$1a:b9d5  77 be         adc [$be],y
$1a:b9d7  87 6e         sta [$6e]
$1a:b9d9  f6 e7         inc $e7,x
$1a:b9db  75 de         adc $de,x
$1a:b9dd  2a            rol a
$1a:b9de  12 5d         ora ($5d)
$1a:b9e0  a0 92 79      ldy #$7992
$1a:b9e3  04 82         tsb $82
$1a:b9e5  c1 b9         cmp ($b9,x)
$1a:b9e7  b6 3c         ldx $3c,y
$1a:b9e9  41 ec         eor ($ec,x)
$1a:b9eb  93 09         sta ($09,s),y
$1a:b9ed  5c b6 4b 20   jml $204bb6
$1a:b9f1  d3 bd         cmp ($bd,s),y
$1a:b9f3  1b            tcs
$1a:b9f4  4f 20 90 d5   eor $d59020
$1a:b9f8  dd e3 bf      cmp $bfe3,x
$1a:b9fb  7a            ply
$1a:b9fc  06 97         asl $97
$1a:b9fe  7a            ply
$1a:b9ff  43 2c         eor $2c,s
$1a:ba01  be 9a 53      ldx $539a,y
$1a:ba04  54 7f 84      mvn $84,$7f
$1a:ba07  8f 5a e0 0b   sta $0be05a
$1a:ba0b  8e 0f 9a      stx $9a0f
$1a:ba0e  28            plp
$1a:ba0f  0b            phd
$1a:ba10  8e b6 1f      stx $1fb6
$1a:ba13  18            clc
$1a:ba14  89 44 6a      bit #$6a44
$1a:ba17  d0 fd         bne $ba16
$1a:ba19  6e 33 1d      ror $1d33
$1a:ba1c  8d 1a 96      sta $961a
$1a:ba1f  3c 58 11      bit $1158,x
$1a:ba22  b8            clv
$1a:ba23  cc 6a aa      cpy $aa6a
$1a:ba26  32 1b         and ($1b)
$1a:ba28  b5 d8         lda $d8,x
$1a:ba2a  6a            ror a
$1a:ba2b  04 50         tsb $50
$1a:ba2d  1d 94 1e      ora $1e94,x
$1a:ba30  39 12 89      and $8912,y
$1a:ba33  8c c2 ef      sty $efc2
$1a:ba36  77 1a         adc [$1a],y
$1a:ba38  81 54         sta ($54,x)
$1a:ba3a  07 65         ora [$65]
$1a:ba3c  04 ad         tsb $ad
$1a:ba3e  8f c3 7e 34   sta $347ec3
$1a:ba42  1f e8 e0 b7   ora $b7e0e8,x
$1a:ba46  f0 e8         beq $ba30
$1a:ba48  ed 52 04      sbc $0452
$1a:ba4b  4f 01 9c 41   eor $419c01
$1a:ba4f  6b            rtl
$1a:ba50  30 1a         bmi $ba6c
$1a:ba52  ac 10 e4      ldy $e410
$1a:ba55  24 56         bit $56
$1a:ba57  84 56         sty $56
$1a:ba59  21 50         and ($50,x)
$1a:ba5b  b8            clv
$1a:ba5c  0c 1c a7      tsb $a71c
$1a:ba5f  15 18         ora $18,x
$1a:ba61  45 5e         eor $5e
$1a:ba63  03 01         ora $01,s
$1a:ba65  82 0c e2      brl $9c74
$1a:ba68  a3 51         lda $51,s
$1a:ba6a  89 2b c2      bit #$c22b
$1a:ba6d  2d 81 59      and $5981
$1a:ba70  98            tya
$1a:ba71  d4 16         pei ($16)
$1a:ba73  65 6b         adc $6b
$1a:ba75  5f 8e 0d 86   eor $860d8e,x
$1a:ba79  78            sei
$1a:ba7a  ac 5b 0c      ldy $0c5b
$1a:ba7d  b2 cc         lda ($cc)
$1a:ba7f  f1 c5         sbc ($c5),y
$1a:ba81  0d 8c 6a      ora $6a8c
$1a:ba84  9c a6 f8      stz $f8a6
$1a:ba87  b4 ea         ldy $ea,x
$1a:ba89  5d 05 aa      eor $aa05,x
$1a:ba8c  10 43         bpl $bad1
$1a:ba8e  b7 dd         lda [$dd],y
$1a:ba90  f0 78         beq $bb0a
$1a:ba92  7c 5d de      jmp ($de5d,x)
$1a:ba95  dd 5a aa      cmp $aa5a,x
$1a:ba98  a1 09         lda ($09,x)
$1a:ba9a  4c aa 03      jmp $03aa
$1a:ba9d  56 87         lsr $87,x
$1a:ba9f  79 00 80      adc $8000,y
$1a:baa2  03 20         ora $20,s
$1a:baa4  08            php
$1a:baa5  40            rti
$1a:baa6  61 30         adc ($30,x)
$1a:baa8  85 78         sta $78
$1a:baaa  ab            plb
$1a:baab  c2 23         rep #$23
$1a:baad  01 88         ora ($88,x)
$1a:baaf  04 0e         tsb $0e
$1a:bab1  13 2f         ora ($2f,s),y
$1a:bab3  8c fd e3      sty $e3fd
$1a:bab6  22 11 8d 14   jsl $148d11
$1a:baba  42 30         wdm #$30
$1a:babc  21 2c         and ($2c,x)
$1a:babe  0e fa 0d      asl $0dfa
$1a:bac1  01 81         ora ($81,x)
$1a:bac3  0c 42 0e      tsb $0e42
$1a:bac6  60            rts
$1a:bac7  08            php
$1a:bac8  cd 6a 0c      cmp $0c6a
$1a:bacb  32 1c         and ($1c)
$1a:bacd  17 16         ora [$16],y
$1a:bacf  0a            asl a
$1a:bad0  a0 0a a0      ldy #$a00a
$1a:bad3  30 06         bmi $badb
$1a:bad5  23 02         and $02,s
$1a:bad7  80 9f         bra $ba78
$1a:bad9  81 42         sta ($42,x)
$1a:badb  18            clc
$1a:badc  a8            tay
$1a:badd  44 0e ae      mvp $ae,$0e
$1a:bae0  f1 05         sbc ($05),y
$1a:bae2  00 10         brk #$10
$1a:bae4  41 40         eor ($40,x)
$1a:bae6  10 ca         bpl $bab2
$1a:bae8  ad 50 9a      lda $9a50
$1a:baeb  11 ea         ora ($ea),y
$1a:baed  e0 fc 01      cpx #$01fc
$1a:baf0  80 01         bra $baf3
$1a:baf2  0a            asl a
$1a:baf3  b4 0e         ldy $0e,x
$1a:baf5  07 01         ora [$01]
$1a:baf7  85 44         sta $44
$1a:baf9  30 1b         bmi $bb16
$1a:bafb  ea            nop
$1a:bafc  84 6e         sty $6e
$1a:bafe  10 4a         bpl $bb4a
$1a:bb00  13 40         ora ($40,s),y
$1a:bb02  42 55         wdm #$55
$1a:bb04  a1 08         lda ($08,x)
$1a:bb06  80 c3         bra $bacb
$1a:bb08  f5 bc         sbc $bc,x
$1a:bb0a  58            cli
$1a:bb0b  74 75         stz $75,x
$1a:bb0d  3a            dec a
$1a:bb0e  07 62         ora [$62]
$1a:bb10  42 94         wdm #$94
$1a:bb12  22 2b 81 e3   jsl $e3812b
$1a:bb16  40            rti
$1a:bb17  6a            ror a
$1a:bb18  11 e4         ora ($e4),y
$1a:bb1a  2a            rol a
$1a:bb1b  4b            phk
$1a:bb1c  e5 c8         sbc $c8
$1a:bb1e  51 f1         eor ($f1),y
$1a:bb20  c7 09         cmp [$09]
$1a:bb22  e1 5e         sbc ($5e,x)
$1a:bb24  4a            lsr a
$1a:bb25  94 c6         sty $c6,x
$1a:bb27  63 32         adc $32,s
$1a:bb29  98            tya
$1a:bb2a  26 4a         rol $4a
$1a:bb2c  3f 81 57 8e   and $8e5781,x
$1a:bb30  f9 66 0b      sbc $0b66,y
$1a:bb33  26 df         rol $df
$1a:bb35  60            rts
$1a:bb36  d7 e0         cmp [$e0],y
$1a:bb38  7d 06 18      adc $1806,x
$1a:bb3b  60            rts
$1a:bb3c  d8            cld
$1a:bb3d  6b            rtl
$1a:bb3e  c5 72         cmp $72
$1a:bb40  86 3f         stx $3f
$1a:bb42  5b            tcd
$1a:bb43  8a            txa
$1a:bb44  73 3b         adc ($3b,s),y
$1a:bb46  54 9a 2b      mvn $2b,$9a
$1a:bb49  fd 6a 8e      sbc $8e6a,x
$1a:bb4c  2d 5e 12      and $125e
$1a:bb4f  79 04 82      adc $8204,y
$1a:bb52  67 36         adc [$36]
$1a:bb54  a7 c0         lda [$c0]
$1a:bb56  35 bf         and $bf,x
$1a:bb58  4f a6 b7 3f   eor $3fb7a6
$1a:bb5c  a8            tay
$1a:bb5d  d4 ea         pei ($ea)
$1a:bb5f  b5 6e         lda $6e,x
$1a:bb61  f9 80 02      sbc $0280,y
$1a:bb64  8a            txa
$1a:bb65  64 00         stz $00
$1a:bb67  dd f2 e8      cmp $e8f2,x
$1a:bb6a  44 04 07      mvp $07,$04
$1a:bb6d  01 02         ora ($02,x)
$1a:bb6f  71 58         adc ($58),y
$1a:bb71  c2 30         rep #$30
$1a:bb73  2f af d4 60   and $60d4af
$1a:bb77  98            tya
$1a:bb78  bf 87 c4 83   lda $83c487,x
$1a:bb7c  63 fe         adc $fe,s
$1a:bb7e  0f b1 85 85   ora $8585b1
$1a:bb82  ec 71 6c      cpx $6c71
$1a:bb85  2e 17 0d      rol $0d17
$1a:bb88  c6 3f         dec $3f
$1a:bb8a  d5 96         cmp $96,x
$1a:bb8c  c1 60         cmp ($60,x)
$1a:bb8e  79 12 55      adc $5512,y
$1a:bb91  dd ea 95      cmp $95ea,x
$1a:bb94  73 06         adc ($06,s),y
$1a:bb96  e0 4e 1b      cpx #$1b4e
$1a:bb99  83 72         sta $72,s
$1a:bb9b  8b            phb
$1a:bb9c  41 3f         eor ($3f,x)
$1a:bb9e  ac f4 c0      ldy $c0f4
$1a:bba1  b7 f7         lda [$f7],y
$1a:bba3  bd b9 dd      lda $ddb9,x
$1a:bba6  77 b5         adc [$b5],y
$1a:bba8  3a            dec a
$1a:bba9  ad 5e b3      lda $b35e
$1a:bbac  3d ad f6      and $f6ad,x
$1a:bbaf  7b            tdc
$1a:bbb0  03 25         ora $25,s
$1a:bbb2  e6 78         inc $78
$1a:bbb4  07 99         ora [$99]
$1a:bbb6  34 6f         bit $6f,x
$1a:bbb8  85 f3         sta $f3
$1a:bbba  bc 03 ce      ldy $ce03,x
$1a:bbbd  03 ac         ora $ac,s
$1a:bbbf  0b            phd
$1a:bbc0  c0 30 29      cpy #$2930
$1a:bbc3  a3 df         lda $df,s
$1a:bbc5  be 43 7e      ldx $7e43,y
$1a:bbc8  9a            txs
$1a:bbc9  1c 1b c0      trb $c01b
$1a:bbcc  1f 64 06 7f   ora $7f0664,x
$1a:bbd0  90 c3         bcc $bb95
$1a:bbd2  c8            iny
$1a:bbd3  22 69 15 88   jsl $881569
$1a:bbd7  06 55         asl $55
$1a:bbd9  60            rts
$1a:bbda  20 70 3e      jsr $3e70
$1a:bbdd  81 ec         sta ($ec,x)
$1a:bbdf  1f 28 bf 20   ora $20bf28,x
$1a:bbe3  38            sec
$1a:bbe4  62 9a 81      per $3d81
$1a:bbe7  8b            phb
$1a:bbe8  14 a6         trb $a6
$1a:bbea  17 0b         ora [$0b],y
$1a:bbec  86 cf         stx $cf
$1a:bbee  1c c6 ed      trb $edc6
$1a:bbf1  76 3c         ror $3c,x
$1a:bbf3  09 09 00      ora #$0009
$1a:bbf6  a5 8a         lda $8a
$1a:bbf8  bb            tyx
$1a:bbf9  dd d1 18      cmp $18d1,x
$1a:bbfc  76 37         ror $37,x
$1a:bbfe  d9 15 84      cmp $8415,y
$1a:bc01  ac 28 58      ldy $5828
$1a:bc04  33 09         and ($09,s),y
$1a:bc06  98            tya
$1a:bc07  52 a8         eor ($a8)
$1a:bc09  7b            tdc
$1a:bc0a  2c 71 d8      bit $d871
$1a:bc0d  1a            inc a
$1a:bc0e  08            php
$1a:bc0f  88            dey
$1a:bc10  5c 0b 7d 91   jml $917d0b
$1a:bc14  0b            phd
$1a:bc15  6b            rtl
$1a:bc16  77 89         adc [$89],y
$1a:bc18  50 8c         bvc $bba6
$1a:bc1a  20 df 4e      jsr $4edf
$1a:bc1d  23 fc         and $fc,s
$1a:bc1f  70 86         bvs $bba7
$1a:bc21  51 e2         eor ($e2),y
$1a:bc23  eb            xba
$1a:bc24  70 6d         bvs $bc93
$1a:bc26  f0 c1         beq $bbe9
$1a:bc28  82 03 8e      brl $4a2e
$1a:bc2b  0f 1c 20 3c   ora $3c201c
$1a:bc2f  7f 1a dc 63   adc $63dc1a,x
$1a:bc33  7c 31 e7      jmp ($e731,x)
$1a:bc36  40            rti
$1a:bc37  81 56         sta ($56,x)
$1a:bc39  20 57 2c      jsr $2c57
$1a:bc3c  10 84         bpl $bbc2
$1a:bc3e  2d b5 b0      and $b0b5
$1a:bc41  c0 60 f0      cpy #$f060
$1a:bc44  61 c1         adc ($c1,x)
$1a:bc46  c0 55 2a      cpy #$2a55
$1a:bc49  b0 ef         bcs $bc3a
$1a:bc4b  dd 66 1f      cmp $1f66,x
$1a:bc4e  81 8e         sta ($8e,x)
$1a:bc50  6f f1 88 60   adc $6088f1
$1a:bc54  c7 ef         cmp [$ef]
$1a:bc56  db            stp
$1a:bc57  e1 56         sbc ($56,x)
$1a:bc59  ab            plb
$1a:bc5a  55 6a         eor $6a,x
$1a:bc5c  95 61         sta $61,x
$1a:bc5e  a8            tay
$1a:bc5f  86 01         stx $01
$1a:bc61  2c 01 c0      bit $c001
$1a:bc64  04 85         tsb $85
$1a:bc66  66 a9         ror $a9
$1a:bc68  0c 80 c0      tsb $c080
$1a:bc6b  61 de         adc ($de,x)
$1a:bc6d  32 38         and ($38)
$1a:bc6f  b3 c0         lda ($c0,s),y
$1a:bc71  38            sec
$1a:bc72  1f dc 0c 06   ora $060cdc,x
$1a:bc76  ad 01 81      lda $8101
$1a:bc79  c0 61 35      cpy #$3561
$1a:bc7c  1d 2e 5f      ora $5f2e,x
$1a:bc7f  4c cf 03      jmp $03cf
$1a:bc82  38            sec
$1a:bc83  2c 00 c4      bit $c400
$1a:bc86  06 50         asl $50
$1a:bc88  c4 d4         cpy $d4
$1a:bc8a  63 f7         adc $f7,s
$1a:bc8c  9d 7f 4f      sta $4f7f,x
$1a:bc8f  13 89         ora ($89,s),y
$1a:bc91  ea            nop
$1a:bc92  6b            rtl
$1a:bc93  fa            plx
$1a:bc94  38            sec
$1a:bc95  23 28         and $28,s
$1a:bc97  54 63 b8      mvn $b8,$63
$1a:bc9a  98            tya
$1a:bc9b  fd 4a 1f      sbc $1f4a,x
$1a:bc9e  84 af         sty $af
$1a:bca0  9e 82 be      stz $be82,x
$1a:bca3  88            dey
$1a:bca4  04 08         tsb $08
$1a:bca6  47 a3         eor [$a3]
$1a:bca8  df ac 48 7c   cmp $7c48ac,x
$1a:bcac  10 e1         bpl $bc8f
$1a:bcae  c6 3d         dec $3d
$1a:bcb0  06 19         asl $19
$1a:bcb2  30 08         bmi $bcbc
$1a:bcb4  10 82         bpl $bc38
$1a:bcb6  94 c2         sty $c2,x
$1a:bcb8  b3 56         lda ($56,s),y
$1a:bcba  86 56         stx $56
$1a:bcbc  11 09         ora ($09),y
$1a:bcbe  6d 8f 47      adc $478f
$1a:bcc1  60            rts
$1a:bcc2  a4 10         ldy $10
$1a:bcc4  ab            plb
$1a:bcc5  d5 2a         cmp $2a,x
$1a:bcc7  f0 ec         beq $bcb5
$1a:bcc9  16 00         asl $00,x
$1a:bccb  f4 18 0c      pea $0c18
$1a:bcce  16 0a         asl $0a,x
$1a:bcd0  a1 1b         lda ($1b,x)
$1a:bcd2  84 18         sty $18
$1a:bcd4  02 06         cop #$06
$1a:bcd6  c4 15         cpy $15
$1a:bcd8  b8            clv
$1a:bcd9  1e 83 04      asl $0483,x
$1a:bcdc  50 08         bvc $bce6
$1a:bcde  74 76         stz $76,x
$1a:bce0  a3 08         lda $08,s
$1a:bce2  40            rti
$1a:bce3  0a            asl a
$1a:bce4  04 21         tsb $21
$1a:bce6  0c 42 62      tsb $6242
$1a:bce9  04 06         tsb $06
$1a:bceb  a1 1e         lda ($1e,x)
$1a:bced  40            rti
$1a:bcee  85 75         sta $75
$1a:bcf0  22 15 c6 a1   jsl $a1c615
$1a:bcf4  35 04         and $04,x
$1a:bcf6  7c 03 e0      jmp ($e003,x)
$1a:bcf9  df 3c c1 e4   cmp $e4c13c,x
$1a:bcfd  78            sei
$1a:bcfe  ec 5e 04      cpx $045e
$1a:bd01  54 02 a0      mvn $a0,$02
$1a:bd04  d6 f1         dec $f1,x
$1a:bd06  40            rti
$1a:bd07  61 84         adc ($84,x)
$1a:bd09  01 88         ora ($88,x)
$1a:bd0b  b4 1f         ldy $1f,x
$1a:bd0d  81 8c         sta ($8c,x)
$1a:bd0f  c6 be         dec $be
$1a:bd11  c3 5b         cmp $5b,s
$1a:bd13  c6 c2         dec $c2
$1a:bd15  a7 04         lda [$04]
$1a:bd17  28            plp
$1a:bd18  00 a2         brk #$a2
$1a:bd1a  fb            xce
$1a:bd1b  03 ca         ora $ca,s
$1a:bd1d  c0 23 0c      cpy #$0c23
$1a:bd20  20 8c 43      jsr $438c
$1a:bd23  46 f0         lsr $f0
$1a:bd25  0c 5e fe      tsb $fe5e
$1a:bd28  29 60 b0      and #$b060
$1a:bd2b  f8            sed
$1a:bd2c  c6 62         dec $62
$1a:bd2e  1a            inc a
$1a:bd2f  30 00         bmi $bd31
$1a:bd31  7d b5 b3      adc $b3b5,x
$1a:bd34  29 04 c2      and #$c204
$1a:bd37  62 43 0b      per $c87d
$1a:bd3a  10 69         bpl $bda5
$1a:bd3c  e4 05         cpx $05
$1a:bd3e  33 b0         and ($b0,s),y
$1a:bd40  60            rts
$1a:bd41  43 64         eor $64,s
$1a:bd43  f3 1c         sbc ($1c,s),y
$1a:bd45  be 98 a8      ldx $a898,y
$1a:bd48  80 a3         bra $bced
$1a:bd4a  e9 74 7a      sbc #$7a74
$1a:bd4d  5a            phy
$1a:bd4e  f9 64 94      sbc $9464,y
$1a:bd51  ca            dex
$1a:bd52  fb            xce
$1a:bd53  ea            nop
$1a:bd54  f9 fc 30      sbc $30fc,y
$1a:bd57  90 49         bcc $bda2
$1a:bd59  39 95 b0      and $b095,y
$1a:bd5c  7c 5c 37      jmp ($375c,x)
$1a:bd5f  18            clc
$1a:bd60  2a            rol a
$1a:bd61  12 b3         ora ($b3)
$1a:bd63  99 8e 4b      sta $4b8e,y
$1a:bd66  e1 f1         sbc ($f1,x)
$1a:bd68  b6 a7         ldx $a7,y
$1a:bd6a  c3 09         cmp $09,s
$1a:bd6c  58            cli
$1a:bd6d  49 99 24      eor #$2499
$1a:bd70  93 a1         sta ($a1,s),y
$1a:bd72  82 57 8d      brl $4acc
$1a:bd75  52 aa         eor ($aa)
$1a:bd77  93 22         sta ($22,s),y
$1a:bd79  c8            iny
$1a:bd7a  3d 0a 03      and $030a,x
$1a:bd7d  56 aa         lsr $aa,x
$1a:bd7f  d5 aa         cmp $aa,x
$1a:bd81  f0 18         beq $bd9b
$1a:bd83  0c ae 5b      tsb $5bae
$1a:bd86  24 8a         bit $8a
$1a:bd88  01 85         ora ($85,x)
$1a:bd8a  1a            inc a
$1a:bd8b  10 36         bpl $bdc3
$1a:bd8d  7b            tdc
$1a:bd8e  7f 6c a1 61   adc $61a16c,x
$1a:bd92  0c 05 45      tsb $4505
$1a:bd95  be d2 fb      ldx $fbd2,y
$1a:bd98  18            clc
$1a:bd99  98            tya
$1a:bd9a  ac 00 00      ldy $0000
$1a:bd9d  77 e6         adc [$e6],y
$1a:bd9f  38            sec
$1a:bda0  9e 00 0b      stz $0b00,x
$1a:bda3  b9 dd 01      lda $01dd,y
$1a:bda6  e3 8c         sbc $8c,s
$1a:bda8  7f c5 d0 28   adc $28d0c5,x
$1a:bdac  18            clc
$1a:bdad  b0 f8         bcs $bda7
$1a:bdaf  e0 4a 01      cpx #$014a
$1a:bdb2  ee f7 aa      inc $aaf7
$1a:bdb5  c0 52 01      cpy #$0152
$1a:bdb8  30 fe         bmi $bdb8
$1a:bdba  e2 c2         sep #$c2
$1a:bdbc  61 8f         adc ($8f,x)
$1a:bdbe  d6 8a         dec $8a,x
$1a:bdc0  42 01         wdm #$01
$1a:bdc2  00 1b         brk #$1b
$1a:bdc4  90 7d         bcc $be43
$1a:bdc6  06 a0         asl $a0
$1a:bdc8  39 01 a0      and $a001,y
$1a:bdcb  11 c8         ora ($c8),y
$1a:bdcd  1e 98 f5      asl $f598,x
$1a:bdd0  d1 96         cmp ($96),y
$1a:bdd2  09 fe 83      ora #$83fe
$1a:bdd5  50 65         bvc $be3c
$1a:bdd7  91 a0         sta ($a0),y
$1a:bdd9  8b            phb
$1a:bdda  0b            phd
$1a:bddb  81 4e         sta ($4e,x)
$1a:bddd  81 e1         sta ($e1,x)
$1a:bddf  0d 0b 83      ora $830b
$1a:bde2  3b            tsc
$1a:bde3  b2 2e         lda ($2e)
$1a:bde5  fe 58 ac      inc $ac58,x
$1a:bde8  6a            ror a
$1a:bde9  3f 71 66 f6   and $f66671,x
$1a:bded  2b            pld
$1a:bdee  b1 fd         lda ($fd),y
$1a:bdf0  8c ed c6      sty $c6ed
$1a:bdf3  c2 e1         rep #$e1
$1a:bdf5  70 cc         bvs $bdc3
$1a:bdf7  fa            plx
$1a:bdf8  b0 37         bcs $be31
$1a:bdfa  c2 67         rep #$67
$1a:bdfc  36 a7         rol $a7,x
$1a:bdfe  8e 41 ca      stx $ca41
$1a:be01  d8            cld
$1a:be02  37 7a         and [$7a],y
$1a:be04  e0 7e de      cpx #$de7e
$1a:be07  cf 61 18 60   cmp $601861
$1a:be0b  01 55         ora ($55,x)
$1a:be0d  c5 bd         cmp $bd
$1a:be0f  fc 10 3b      jsr ($3b10,x)
$1a:be12  f7 28         sbc [$28],y
$1a:be14  ab            plb
$1a:be15  40            rti
$1a:be16  6e 0a d0      ror $d00a
$1a:be19  c0 81 87      cpy #$8781
$1a:be1c  db            stp
$1a:be1d  ed 7d 90      sbc $907d
$1a:be20  84 05         sty $05
$1a:be22  a5 ad         lda $ad
$1a:be24  fb            xce
$1a:be25  60            rts
$1a:be26  71 81         adc ($81),y
$1a:be28  50 7d         bvc $bea7
$1a:be2a  93 94         sta ($94,s),y
$1a:be2c  0a            asl a
$1a:be2d  80 e5         bra $be14
$1a:be2f  01 a8         ora ($a8,x)
$1a:be31  91 c9         sta ($c9),y
$1a:be33  ca            dex
$1a:be34  27 05         and [$05]
$1a:be36  fb            xce
$1a:be37  3b            tsc
$1a:be38  c9 f6 48      cmp #$48f6
$1a:be3b  05 1c         ora $1c
$1a:be3d  00 10         brk #$10
$1a:be3f  5f 64 95 7b   eor $7b9564,x
$1a:be43  b5 d8         lda $d8,x
$1a:be45  d5 97         cmp $97,x
$1a:be47  7b            tdc
$1a:be48  b8            clv
$1a:be49  e8            inx
$1a:be4a  d6 16         dec $16,x
$1a:be4c  e5 1d         sbc $1d
$1a:be4e  6b            rtl
$1a:be4f  06 89         asl $89
$1a:be51  84 cf         sty $cf
$1a:be53  06 93         asl $93
$1a:be55  e7 9d         sbc [$9d]
$1a:be57  84 e5         sty $e5
$1a:be59  87 29         sta [$29]
$1a:be5b  ae c9 a5      ldx $a5c9
$1a:be5e  ee 39 04      inc $0439
$1a:be61  05 00         ora $00
$1a:be63  14 bc         trb $bc
$1a:be65  5f 1e 19 80   eor $80191e,x
$1a:be69  bc bc 76      ldy $76bc,x
$1a:be6c  f1 84         sbc ($84),y
$1a:be6e  08            php
$1a:be6f  de 03 01      dec $0103,x
$1a:be72  10 8f         bpl $be03
$1a:be74  c4 44         cpy $44
$1a:be76  72 1f         adc ($1f)
$1a:be78  08            php
$1a:be79  c4 bb         cpy $bb
$1a:be7b  21 06         and ($06,x)
$1a:be7d  1a            inc a
$1a:be7e  40            rti
$1a:be7f  bc a0 90      ldy $90a0,x
$1a:be82  b2 24         lda ($24)
$1a:be84  0f d2 14 55   ora $5514d2
$1a:be88  72 7f         adc ($7f)
$1a:be8a  98            tya
$1a:be8b  3c 83 26      bit $2683,x
$1a:be8e  c5 cc         cmp $cc
$1a:be90  41 60         eor ($60,x)
$1a:be92  b2 b8         lda ($b8)
$1a:be94  5c a9 2a 26   jml $262aa9
$1a:be98  c4 91         cpy $91
$1a:be9a  c7 54         cmp [$54]
$1a:be9c  61 24         adc ($24,x)
$1a:be9e  85 ef         sta $ef
$1a:bea0  27 47         and [$47]
$1a:bea2  33 0f         and ($0f,s),y
$1a:bea4  84 82         sty $82
$1a:bea6  42 b2         wdm #$b2
$1a:bea8  29 8d 3c      and #$3c8d
$1a:beab  84 81         sty $81
$1a:bead  f0 4c         beq $befb
$1a:beaf  07 0a         ora [$0a]
$1a:beb1  81 41         sta ($41,x)
$1a:beb3  80 cd         bra $be82
$1a:beb5  06 21         asl $21
$1a:beb7  29 4a 02      and #$024a
$1a:beba  50 03         bvc $bebf
$1a:bebc  e1 07         sbc ($07,x)
$1a:bebe  fe c5 69      inc $69c5,x
$1a:bec1  14 96         trb $96
$1a:bec3  30 a8         bmi $be6d
$1a:bec5  89 46 0c      bit #$0c46
$1a:bec8  f1 86         sbc ($86),y
$1a:beca  c6 e3         dec $e3
$1a:becc  90 e8         bcc $beb6
$1a:bece  0f 15 62 92   ora $926215
$1a:bed2  10 0e         bpl $bee2
$1a:bed4  3f 3e f9 84   and $84f93e,x
$1a:bed8  07 ec         ora [$ec]
$1a:beda  44 3e 91      mvp $91,$3e
$1a:bedd  78            sei
$1a:bede  95 16         sta $16,x
$1a:bee0  8a            txa
$1a:bee1  98            tya
$1a:bee2  06 58         asl $58
$1a:bee4  c1 85         cmp ($85,x)
$1a:bee6  e7 91         sbc [$91]
$1a:bee8  97 c6         sta [$c6],y
$1a:beea  a7 b3         lda [$b3]
$1a:beec  d8            cld
$1a:beed  3c a6 53      bit $53a6,x
$1a:bef0  90 83         bcc $be75
$1a:bef2  21 12         and ($12,x)
$1a:bef4  0e 36 01      asl $0136
$1a:bef7  40            rti
$1a:bef8  0e 86 09      asl $0986
$1a:befb  08            php
$1a:befc  32 99         and ($99)
$1a:befe  10 87         bpl $be87
$1a:bf00  06 93         asl $93
$1a:bf02  02 7b         cop #$7b
$1a:bf04  92 07         sta ($07)
$1a:bf06  3b            tsc
$1a:bf07  01 1d         ora ($1d,x)
$1a:bf09  81 3f         sta ($3f,x)
$1a:bf0b  25 39         and $39
$1a:bf0d  d2 fd         cmp ($fd)
$1a:bf0f  1e c4 dd      asl $ddc4,x
$1a:bf12  86 b1         stx $b1
$1a:bf14  3f ef 00 7e   and $7e00ef,x
$1a:bf18  e7 84         sbc [$84]
$1a:bf1a  93 0a         sta ($0a,s),y
$1a:bf1c  c8            iny
$1a:bf1d  5a            phy
$1a:bf1e  1f d4 33 49   ora $4933d4,x
$1a:bf22  a3 ac         lda $ac,s
$1a:bf24  f4 92 2d      pea $2d92
$1a:bf27  da            phx
$1a:bf28  42 df         wdm #$df
$1a:bf2a  59 10 a0      eor $a010,y
$1a:bf2d  20 50 18      jsr $1850
$1a:bf30  13 b0         ora ($b0,s),y
$1a:bf32  00 1a         brk #$1a
$1a:bf34  fd fc 20      sbc $20fc,x
$1a:bf37  3f 57 e8 bf   and $bfe857,x
$1a:bf3b  39 59 a0      and $a059,y
$1a:bf3e  25 50         and $50
$1a:bf40  58            cli
$1a:bf41  30 be         bmi $bf01
$1a:bf43  26 75         rol $75
$1a:bf45  ea            nop
$1a:bf46  fc ca 0d      jsr ($0dca,x)
$1a:bf49  08            php
$1a:bf4a  1f cd 56 aa   ora $aa56cd,x
$1a:bf4e  3f 00 fd 55   and $55fd00,x
$1a:bf52  aa            tax
$1a:bf53  f1 b9         sbc ($b9),y
$1a:bf55  2a            rol a
$1a:bf56  34 0b         bit $0b,x
$1a:bf58  e8            inx
$1a:bf59  9c 18 22      stz $2218
$1a:bf5c  20 53 82      jsr $8253
$1a:bf5f  64 42         stz $42
$1a:bf61  f8            sed
$1a:bf62  c1 17         cmp ($17,x)
$1a:bf64  08            php
$1a:bf65  73 55         adc ($55,s),y
$1a:bf67  60            rts
$1a:bf68  1a            inc a
$1a:bf69  88            dey
$1a:bf6a  be 9f d4      ldx $d49f,y
$1a:bf6d  2a            rol a
$1a:bf6e  1e ca 50      asl $50ca,x
$1a:bf71  9f 2e 02 7c   sta $7c022e,x
$1a:bf75  cd 43 ae      cmp $ae43
$1a:bf78  80 c4         bra $bf3e
$1a:bf7a  26 11         rol $11
$1a:bf7c  e8            inx
$1a:bf7d  b4 4a         ldy $4a,x
$1a:bf7f  4c af 33      jmp $33af
$1a:bf82  d1 c6         cmp ($c6),y
$1a:bf84  35 d1         and $d1,x
$1a:bf86  38            sec
$1a:bf87  24 6a         bit $6a
$1a:bf89  4c bf 08      jmp $08bf
$1a:bf8c  cb            wai
$1a:bf8d  08            php
$1a:bf8e  11 47         ora ($47),y
$1a:bf90  18            clc
$1a:bf91  99 4a 66      sta $664a,y
$1a:bf94  6c 31 68      jmp ($6831)
$1a:bf97  11 e8         ora ($e8),y
$1a:bf99  75 d3         adc $d3,x
$1a:bf9b  a9 04 86      lda #$8604
$1a:bf9e  63 21         adc $21,s
$1a:bfa0  91 40         sta ($40),y
$1a:bfa2  5b            tcd
$1a:bfa3  e8            inx
$1a:bfa4  3b            tsc
$1a:bfa5  09 1c 74      ora #$741c
$1a:bfa8  01 b7         ora ($b7,x)
$1a:bfaa  a7 7e         lda [$7e]
$1a:bfac  5e f0 38      lsr $38f0,x
$1a:bfaf  40            rti
$1a:bfb0  7d de b0      adc $b0de,x
$1a:bfb3  24 f9         bit $f9
$1a:bfb5  2c 0e 07      bit $070e
$1a:bfb8  03 06         ora $06,s
$1a:bfba  17 82         ora [$82],y
$1a:bfbc  00 05         brk #$05
$1a:bfbe  e2 34         sep #$34
$1a:bfc0  38            sec
$1a:bfc1  20 b4 21      jsr $21b4
$1a:bfc4  03 f0         ora $f0,s
$1a:bfc6  6e 80 fc      ror $fc80
$1a:bfc9  48            pha
$1a:bfca  87 88         sta [$88]
$1a:bfcc  16 84         asl $84,x
$1a:bfce  96 38         stx $38,y
$1a:bfd0  41 08         eor ($08,x)
$1a:bfd2  0f 22 6a 55   ora $556a22
$1a:bfd6  22 51 ce a5   jsl $a5ce51
$1a:bfda  f0 89         beq $bf65
$1a:bfdc  94 ce         sty $ce,x
$1a:bfde  68            pla
$1a:bfdf  af 09 6a c8   lda $c86a09
$1a:bfe3  05 21         ora $21
$1a:bfe5  29 16         and #$16
$1a:bfe7  84 a4         sty $a4
$1a:bfe9  c0 03         cpy #$03
$1a:bfeb  f0 9a         beq $bf87
$1a:bfed  46 20         lsr $20
$1a:bfef  39 d8 0c      and $0cd8,y
$1a:bff2  69 3e         adc #$3e
$1a:bff4  22 d0 ce ce   jsl $ceced0
$1a:bff8  a4 a4         ldy $a4
$1a:bffa  f0 3a         beq $c036
$1a:bffc  1c f1 62      trb $62f1
$1a:bfff  26 d1         rol $d1
$1a:c001  47 8c         eor [$8c]
$1a:c003  bc e8 70      ldy $70e8,x
$1a:c006  19 4b 08      ora $084b,y
$1a:c009  11 b1         ora ($b1),y
$1a:c00b  fd 94 e7      sbc $e794,x
$1a:c00e  72 e9         adc ($e9)
$1a:c010  b3 3b         lda ($3b,s),y
$1a:c012  82 48 d6      brl $965d
$1a:c015  c3 06         cmp $06,s
$1a:c017  69 02         adc #$02
$1a:c019  35 78         and $78,x
$1a:c01b  ad f0 63      lda $63f0
$1a:c01e  1c 89 1a      trb $1a89
$1a:c021  47 f0         eor [$f0]
$1a:c023  30 02         bmi $c027
$1a:c025  3c 91 e2      bit $e291,x
$1a:c028  3c 18 eb      bit $eb18,x
$1a:c02b  7c 64 8d      jmp ($8d64,x)
$1a:c02e  49 c0         eor #$c0
$1a:c030  60            rts
$1a:c031  20 f0 d9      jsr $d9f0
$1a:c034  74 be         stz $be,x
$1a:c036  1d 02 84      ora $8402,x
$1a:c039  3d d5 de      and $ded5,x
$1a:c03c  da            phx
$1a:c03d  d8            cld
$1a:c03e  14 04         trb $04
$1a:c040  10 20         bpl $c062
$1a:c042  c0 77         cpy #$77
$1a:c044  ac 04 0e      ldy $0e04
$1a:c047  12 a3         ora ($a3)
$1a:c049  50 06         bvc $c051
$1a:c04b  84 1f         sty $1f
$1a:c04d  10 76         bpl $c0c5
$1a:c04f  a9 87         lda #$87
$1a:c051  ed 4e 02      sbc $024e
$1a:c054  e6 03         inc $03
$1a:c056  08            php
$1a:c057  a6 c8         ldx $c8
$1a:c059  de 57 f8      dec $f857,x
$1a:c05c  14 ca         trb $ca
$1a:c05e  0c 7a 27      tsb $277a
$1a:c061  79 48 e4      adc $e448,y
$1a:c064  81 51         sta ($51,x)
$1a:c066  04 a4         tsb $a4
$1a:c068  05 de         ora $de
$1a:c06a  10 19         bpl $c085
$1a:c06c  42 48         wdm #$48
$1a:c06e  36 d0         rol $d0,x
$1a:c070  1e 44 d5      asl $d544,x
$1a:c073  30 50         bmi $c0c5
$1a:c075  89 bb         bit #$bb
$1a:c077  bc 22 13      ldy $1322,x
$1a:c07a  09 6c         ora #$6c
$1a:c07c  7a            ply
$1a:c07d  2d 12 9a      and $9a12
$1a:c080  28            plp
$1a:c081  45 4a         eor $4a
$1a:c083  10 14         bpl $c099
$1a:c085  70 c6         bvs $c04d
$1a:c087  0b            phd
$1a:c088  23 04         and $04,s
$1a:c08a  8d 4d 16      sta $164d
$1a:c08d  22 b5 09 4c   jsl $4c09b5
$1a:c091  99 5e 31      sta $315e,y
$1a:c094  38            sec
$1a:c095  e2 d0         sep #$d0
$1a:c097  f4 d1 39      pea $39d1
$1a:c09a  9a            txs
$1a:c09b  f1 10         sbc ($10),y
$1a:c09d  60            rts
$1a:c09e  b4 1e         ldy $1e,x
$1a:c0a0  2c 82 42      bit $4282
$1a:c0a3  d9 09 14      cmp $1409,y
$1a:c0a6  a6 2a         ldx $2a
$1a:c0a8  af 18 4b 0c   lda $0c4b18
$1a:c0ac  b9 29 12      lda $1229,y
$1a:c0af  94 4a         sty $4a,x
$1a:c0b1  78            sei
$1a:c0b2  10 87         bpl $c03b
$1a:c0b4  7b            tdc
$1a:c0b5  4f 67 ae f3   eor $f3ae67
$1a:c0b9  46 0a         lsr $0a
$1a:c0bb  b4 11         ldy $11,x
$1a:c0bd  65 45         adc $45
$1a:c0bf  a2 a2         ldx #$a2
$1a:c0c1  4a            lsr a
$1a:c0c2  11 05         ora ($05),y
$1a:c0c4  07 a6         ora [$a6]
$1a:c0c6  7e 04 f8      ror $f804,x
$1a:c0c9  02 c8         cop #$c8
$1a:c0cb  67 41         adc [$41]
$1a:c0cd  a0 6a         ldy #$6a
$1a:c0cf  35 98         and $98,x
$1a:c0d1  67 20         adc [$20]
$1a:c0d3  40            rti
$1a:c0d4  80 0d         bra $c0e3
$1a:c0d6  0c 04 3d      tsb $3d04
$1a:c0d9  01 83         ora ($83,x)
$1a:c0db  16 a1         asl $a1,x
$1a:c0dd  f4 25 3a      pea $3a25
$1a:c0e0  70 38         bvs $c11a
$1a:c0e2  86 98         stx $98
$1a:c0e4  4c 10 2d      jmp $2d10
$1a:c0e7  b2 2c         lda ($2c)
$1a:c0e9  03 10         ora $10,s
$1a:c0eb  26 08         rol $08
$1a:c0ed  82 a8 49      brl $0a98
$1a:c0f0  0a            asl a
$1a:c0f1  43 08         eor $08,s
$1a:c0f3  31 18         and ($18),y
$1a:c0f5  23 1a         and $1a,s
$1a:c0f7  e8            inx
$1a:c0f8  a4 68         ldy $68
$1a:c0fa  30 a0         bmi $c09c
$1a:c0fc  41 00         eor ($00,x)
$1a:c0fe  02 c4         cop #$c4
$1a:c100  16 a0         asl $a0,x
$1a:c102  28            plp
$1a:c103  59 aa 3c      eor $3caa,y
$1a:c106  67 f2         adc [$f2]
$1a:c108  c5 a0         cmp $a0
$1a:c10a  8e 16 21      stx $2116
$1a:c10d  30 32         bmi $c141
$1a:c10f  8a            txa
$1a:c110  11 98         ora ($98),y
$1a:c112  81 08         sta ($08,x)
$1a:c114  42 03         wdm #$03
$1a:c116  10 50         bpl $c168
$1a:c118  81 fd         sta ($fd,x)
$1a:c11a  3b            tsc
$1a:c11b  b4 63         ldy $63,x
$1a:c11d  4d 97 99      eor $9997
$1a:c120  ac c2 64      ldy $64c2
$1a:c123  c2 02         rep #$02
$1a:c125  42 c8         wdm #$c8
$1a:c127  24 2d         bit $2d
$1a:c129  00 91         brk #$91
$1a:c12b  33 c6         and ($c6,s),y
$1a:c12d  44 18 59      mvp $59,$18
$1a:c130  43 7d         eor $7d,s
$1a:c132  0a            asl a
$1a:c133  a0 48         ldy #$48
$1a:c135  5e 42 3c      lsr $3c42,x
$1a:c138  a6 b0         ldx $b0
$1a:c13a  87 a9         sta [$a9]
$1a:c13c  d5 6a         cmp $6a,x
$1a:c13e  af 50 9a 27   lda $279a50
$1a:c142  ce 0a 05      dec $050a
$1a:c145  29 5d         and #$5d
$1a:c147  5a            phy
$1a:c148  af 1b 92 cd   lda $cd921b
$1a:c14c  15 e6         ora $e6,x
$1a:c14e  33 15         and ($15,s),y
$1a:c150  58            cli
$1a:c151  96 03         stx $03,y
$1a:c153  5d 01 07      eor $0701,x
$1a:c156  86 9a         stx $9a
$1a:c158  32 c2         and ($c2)
$1a:c15a  00 aa         brk #$aa
$1a:c15c  12 0b         ora ($0b)
$1a:c15e  8a            txa
$1a:c15f  cf 30 ac 42   cmp $42ac30
$1a:c163  20 e5 c0      jsr $c0e5
$1a:c166  21 33         and ($33,x)
$1a:c168  20 20 32      jsr $3220
$1a:c16b  91 f9         sta ($f9),y
$1a:c16d  42 ca         wdm #$ca
$1a:c16f  69 9a         adc #$9a
$1a:c171  6c 11 3c      jmp ($3c11)
$1a:c174  e1 46         sbc ($46,x)
$1a:c176  43 cd         eor $cd,s
$1a:c178  32 07         and ($07)
$1a:c17a  3a            dec a
$1a:c17b  5f 42 29 1a   eor $1a2942,x
$1a:c17f  40            rti
$1a:c180  b7 05         lda [$05],y
$1a:c182  21 3c         and ($3c,x)
$1a:c184  09 2c         ora #$2c
$1a:c186  e6 5a         inc $5a
$1a:c188  44 13 96      mvp $96,$13
$1a:c18b  cc a6 48      cpy $48a6
$1a:c18e  43 fe         eor $fe,s
$1a:c190  9a            txs
$1a:c191  84 7a         sty $7a
$1a:c193  32 ac         and ($ac)
$1a:c195  da            phx
$1a:c196  4a            lsr a
$1a:c197  49 aa         eor #$aa
$1a:c199  84 73         sty $73
$1a:c19b  6f 97 b6 02   adc $02b697
$1a:c19f  ce 07 79      dec $7907
$1a:c1a2  89 4c         bit #$4c
$1a:c1a4  50 38         bvc $c1de
$1a:c1a6  1c 0c 95      trb $950c
$1a:c1a9  fe 31 ce      inc $ce31,x
$1a:c1ac  44 a0 0a      mvp $0a,$a0
$1a:c1af  39 d9 d3      and $d3d9,y
$1a:c1b2  ec 84 a1      cpx $a184
$1a:c1b5  9d 80 cb      sta $cb80,x
$1a:c1b8  e6 91         inc $91
$1a:c1ba  09 84         ora #$84
$1a:c1bc  5a            phy
$1a:c1bd  24 f9         bit $f9
$1a:c1bf  49 48         eor #$48
$1a:c1c1  7c 42 61      jmp ($6142,x)
$1a:c1c4  18            clc
$1a:c1c5  83 c1         sta $c1,s
$1a:c1c7  23 41         and $41,s
$1a:c1c9  f1 06         sbc ($06),y
$1a:c1cb  10 44         bpl $c211
$1a:c1cd  04 45         tsb $45
$1a:c1cf  ae 89 8a      ldx $8a89
$1a:c1d2  18            clc
$1a:c1d3  40            rti
$1a:c1d4  93 29         sta ($29,s),y
$1a:c1d6  98            tya
$1a:c1d7  a1 78         lda ($78,x)
$1a:c1d9  00 50         brk #$50
$1a:c1db  db            stp
$1a:c1dc  40            rti
$1a:c1dd  b8            clv
$1a:c1de  b2 09         lda ($09)
$1a:c1e0  0c 86 44      tsb $4486
$1a:c1e3  30 17         bmi $c1fc
$1a:c1e5  e0 c0         cpx #$c0
$1a:c1e7  42 a4         wdm #$a4
$1a:c1e9  f4 99 30      pea $3099
$1a:c1ec  94 a1         sty $a1,x
$1a:c1ee  03 01         ora $01,s
$1a:c1f0  34 3c         bit $3c,x
$1a:c1f2  52 53         eor ($53)
$1a:c1f4  39 32 59      and $5932,y
$1a:c1f7  18            clc
$1a:c1f8  4e 93 15      lsr $1593
$1a:c1fb  2a            rol a
$1a:c1fc  92 10         sta ($10)
$1a:c1fe  4e a6 2c      lsr $2ca6
$1a:c201  56 f0         lsr $f0,x
$1a:c203  19 62 02      ora $0262,y
$1a:c206  76 1f         ror $1f,x
$1a:c208  eb            xba
$1a:c209  cc 39 13      cpy $1339
$1a:c20c  56 39         lsr $39,x
$1a:c20e  07 16         ora [$16]
$1a:c210  53 ad         eor ($ad,s),y
$1a:c212  80 c9         bra $c1dd
$1a:c214  82 a1 2d      brl $efb8
$1a:c217  0b            phd
$1a:c218  81 70         sta ($70,x)
$1a:c21a  96 08         stx $08,y
$1a:c21c  6f 11 58 46   adc $465811
$1a:c220  85 83         sta $83
$1a:c222  80 c0         bra $c1e4
$1a:c224  46 24         lsr $24
$1a:c226  72 47         adc ($47)
$1a:c228  48            pha
$1a:c229  85 06         sta $06
$1a:c22b  3c 17 19      bit $1917,x
$1a:c22e  33 bc         and ($bc,s),y
$1a:c230  63 31         adc $31,s
$1a:c232  c7 a1         cmp [$a1]
$1a:c234  0d 42 32      ora $3242
$1a:c237  27 17         and [$17]
$1a:c239  f1 3c         sbc ($3c),y
$1a:c23b  90 8a         bcc $c1c7
$1a:c23d  10 62         bpl $c2a1
$1a:c23f  38            sec
$1a:c240  bf 8b 2e 03   lda $032e8b,x
$1a:c244  22 a1 15 c2   jsl $c215a1
$1a:c248  03 01         ora $01,s
$1a:c24a  77 a4         adc [$a4],y
$1a:c24c  a6 72         ldx $72
$1a:c24e  c6 36         dec $36
$1a:c250  20 42 1d      jsr $1d42
$1a:c253  e3 14         sbc $14,s
$1a:c255  01 99         ora ($99,x)
$1a:c257  80 9d         bra $c1f6
$1a:c259  01 29         ora ($29,x)
$1a:c25b  07 c1         ora [$c1]
$1a:c25d  c4 60         cpy $60
$1a:c25f  f9 d9 d3      sbc $d3d9,y
$1a:c262  bc 62 60      ldy $6062,x
$1a:c265  33 96         and ($96,s),y
$1a:c267  67 61         adc [$61]
$1a:c269  25 b0         and $b0
$1a:c26b  26 9c         rol $9c
$1a:c26d  ba            tsx
$1a:c26e  5e 54 79      lsr $7954,x
$1a:c271  4c 3d fe      jmp $fe3d
$1a:c274  52 40         eor ($40)
$1a:c276  d0 85         bne $c1fd
$1a:c278  c4 36         cpy $36
$1a:c27a  04 c3         tsb $c3
$1a:c27c  14 10         trb $10
$1a:c27e  ac 04 e5      ldy $e504
$1a:c281  22 0c 84 18   jsl $18840c
$1a:c285  3e 15 1a      rol $1a15,x
$1a:c288  82 86 83      brl $4611
$1a:c28b  e1 47         sbc ($47,x)
$1a:c28d  a3 2c         lda $2c,s
$1a:c28f  68            pla
$1a:c290  3e 12 ac      rol $ac12,x
$1a:c293  f9 20 b5      sbc $b520,y
$1a:c296  b0 19         bcs $c2b1
$1a:c298  2b            pld
$1a:c299  24 c3         bit $c3
$1a:c29b  e1 07         sbc ($07,x)
$1a:c29d  73 08         adc ($08,s),y
$1a:c29f  2c 35 b0      bit $b035
$1a:c2a2  21 a0         and ($a0,x)
$1a:c2a4  7f 46 80 8e   adc $8e8046,x
$1a:c2a8  16 88         asl $88,x
$1a:c2aa  eb            xba
$1a:c2ab  a2 8d         ldx #$8d
$1a:c2ad  62 e0 50      per $1390
$1a:c2b0  28            plp
$1a:c2b1  30 d9         bmi $c28c
$1a:c2b3  49 20         eor #$20
$1a:c2b5  23 c4         and $c4,s
$1a:c2b7  a0 24         ldy #$24
$1a:c2b9  14 f6         trb $f6
$1a:c2bb  7a            ply
$1a:c2bc  4c 0c ec      jmp $ec0c
$1a:c2bf  06 10         asl $10
$1a:c2c1  e3 08         sbc $08,s
$1a:c2c3  49 68         eor #$68
$1a:c2c5  23 10         and $10,s
$1a:c2c7  18            clc
$1a:c2c8  14 6a         trb $6a
$1a:c2ca  8b            phb
$1a:c2cb  45 7d         eor $7d
$1a:c2cd  22 70 11 40   jsl $401170
$1a:c2d1  58            cli
$1a:c2d2  27 c1         and [$c1]
$1a:c2d4  c0 a1         cpy #$a1
$1a:c2d6  09 12         ora #$12
$1a:c2d8  91 38         sta ($38),y
$1a:c2da  c8            iny
$1a:c2db  10 61         bpl $c33e
$1a:c2dd  d0 17         bne $c2f6
$1a:c2df  11 9c         ora ($9c),y
$1a:c2e1  10 82         bpl $c265
$1a:c2e3  f8            sed
$1a:c2e4  56 e0         lsr $e0,x
$1a:c2e6  ca            dex
$1a:c2e7  62 a9 82      per $4593
$1a:c2ea  14 28         trb $28
$1a:c2ec  fc 87 e5      jsr ($e587,x)
$1a:c2ef  04 1c         tsb $1c
$1a:c2f1  3c 3c a4      bit $a43c,x
$1a:c2f4  82 85 87      brl $4a7c
$1a:c2f7  43 5d         eor $5d,s
$1a:c2f9  a1 9d         lda ($9d,x)
$1a:c2fb  9d 4e 8a      sta $8a4e,x
$1a:c2fe  c7 fd         cmp [$fd]
$1a:c300  7e 09 c0      ror $c009,x
$1a:c303  5d a0 64      eor $64a0,x
$1a:c306  98            tya
$1a:c307  32 3d         and ($3d)
$1a:c309  66 6f         ror $6f
$1a:c30b  80 81         bra $c28e
$1a:c30d  26 86         rol $86
$1a:c30f  11 51         ora ($51),y
$1a:c311  a8            tay
$1a:c312  27 d4         and [$d4]
$1a:c314  90 0a         bcc $c320
$1a:c316  03 a3         ora $a3,s
$1a:c318  d1 95         cmp ($95),y
$1a:c31a  f9 25 5f      sbc $5f25,y
$1a:c31d  8d 4e a4      sta $a44e
$1a:c320  c4 62         cpy $62
$1a:c322  6a            ror a
$1a:c323  49 9d         eor #$9d
$1a:c325  ea            nop
$1a:c326  f1 13         sbc ($13),y
$1a:c328  f0 4a         beq $c374
$1a:c32a  5c 01 26 7f   jml $7f2601
$1a:c32e  84 4c         sty $4c
$1a:c330  04 3a         tsb $3a
$1a:c332  e8            inx
$1a:c333  c8            iny
$1a:c334  08            php
$1a:c335  05 c1         ora $c1
$1a:c337  07 0e         ora [$0e]
$1a:c339  04 2d         tsb $2d
$1a:c33b  e6 99         inc $99
$1a:c33d  a0 c0         ldy #$c0
$1a:c33f  6b            rtl
$1a:c340  a0 3c         ldy #$3c
$1a:c342  93 a0         sta ($a0,s),y
$1a:c344  26 88         rol $88
$1a:c346  04 64         tsb $64
$1a:c348  82 9a 36      brl $f9e5
$1a:c34b  44 24 8d      mvp $8d,$24
$1a:c34e  70 1c         bvs $c36c
$1a:c350  14 d2         trb $d2
$1a:c352  30 3a         bmi $c38e
$1a:c354  01 12         ora ($12,x)
$1a:c356  39 c0 90      and $90c0,y
$1a:c359  0f d0 0f 86   ora $860fd0
$1a:c35d  ba            tsx
$1a:c35e  29 9d         and #$9d
$1a:c360  cb            wai
$1a:c361  e7 46         sbc [$46]
$1a:c363  40            rti
$1a:c364  eb            xba
$1a:c365  12 c0         ora ($c0)
$1a:c367  40            rti
$1a:c368  43 da         eor $da,s
$1a:c36a  f0 09         beq $c375
$1a:c36c  a4 b0         ldy $b0
$1a:c36e  44 5f d1      mvp $d1,$5f
$1a:c371  31 86         and ($86),y
$1a:c373  fc 58 83      jsr ($8358,x)
$1a:c376  40            rti
$1a:c377  89 8d         bit #$8d
$1a:c379  c3 3b         cmp $3b,s
$1a:c37b  09 2c         ora #$2c
$1a:c37d  b4 c9         ldy $c9,x
$1a:c37f  26 48         rol $48
$1a:c381  51 99         eor ($99),y
$1a:c383  92 8f         sta ($8f)
$1a:c385  8b            phb
$1a:c386  20 90 a4      jsr $a490
$1a:c389  5a            phy
$1a:c38a  44 5b 04      mvp $04,$5b
$1a:c38d  08            php
$1a:c38e  54 6a 09      mvn $09,$6a
$1a:c391  f8            sed
$1a:c392  25 82         and $82
$1a:c394  7c 28 f4      jmp ($f428,x)
$1a:c397  65 7e         adc $7e
$1a:c399  03 e0         ora $e0,s
$1a:c39b  24 85         bit $85
$1a:c39d  f0 9d         beq $c33c
$1a:c39f  08            php
$1a:c3a0  94 44         sty $44,x
$1a:c3a2  64 e0         stz $e0
$1a:c3a4  8c 40 8e      sty $8e40
$1a:c3a7  61 13         adc ($13,x)
$1a:c3a9  8c 8c 82      sty $828c
$1a:c3ac  13 fb         ora ($fb,s),y
$1a:c3ae  8a            txa
$1a:c3af  1d 06 29      ora $2906,x
$1a:c3b2  c1 80         cmp ($80,x)
$1a:c3b4  ca            dex
$1a:c3b5  1e 21 08      asl $0821,x
$1a:c3b8  94 c9         sty $c9,x
$1a:c3ba  a3 1a         lda $1a,s
$1a:c3bc  68            pla
$1a:c3bd  ca            dex
$1a:c3be  24 20         bit $20
$1a:c3c0  98            tya
$1a:c3c1  1c 0c 99      trb $990c
$1a:c3c4  80 01         bra $c3c7
$1a:c3c6  90 7a         bcc $c442
$1a:c3c8  04 55         tsb $55
$1a:c3ca  20 52 27      jsr $2752
$1a:c3cd  e1 18         sbc ($18,x)
$1a:c3cf  00 92         brk #$92
$1a:c3d1  10 8c         bpl $c35f
$1a:c3d3  e8            inx
$1a:c3d4  f4 0c a6      pea $a60c
$1a:c3d7  0d 2c b8      ora $b82c
$1a:c3da  48            pha
$1a:c3db  4c 4c 0d      jmp $0d4c
$1a:c3de  29 92         and #$92
$1a:c3e0  24 04         bit $04
$1a:c3e2  86 15         stx $15
$1a:c3e4  17 e0         ora [$e0],y
$1a:c3e6  c0 52         cpy #$52
$1a:c3e8  03 22         ora $22,s
$1a:c3ea  7a            ply
$1a:c3eb  00 55         brk #$55
$1a:c3ed  1f 82 62 31   ora $316282,x
$1a:c3f1  21 05         and ($05,x)
$1a:c3f3  48            pha
$1a:c3f4  98            tya
$1a:c3f5  61 51         adc ($51,x)
$1a:c3f7  12 49         ora ($49)
$1a:c3f9  14 c2         trb $c2
$1a:c3fb  88            dey
$1a:c3fc  15 01         ora $01,x
$1a:c3fe  e1 19         sbc ($19,x)
$1a:c400  48            pha
$1a:c401  48            pha
$1a:c402  21 53         and ($53,x)
$1a:c404  36 0c         rol $0c,x
$1a:c406  19 1e 50      ora $501e,y
$1a:c409  84 79         sty $79
$1a:c40b  a3 c2         lda $c2,s
$1a:c40d  66 fd         ror $fd
$1a:c40f  0a            asl a
$1a:c410  8d 41 3e      sta $3e41
$1a:c413  35 94         and $94,x
$1a:c415  f9 a8 05      sbc $05a8,y
$1a:c418  fa            plx
$1a:c419  14 7a         trb $7a
$1a:c41b  32 bc         and ($bc)
$1a:c41d  6b            rtl
$1a:c41e  0a            asl a
$1a:c41f  f3 58         sbc ($58,s),y
$1a:c421  0b            phd
$1a:c422  f4 23 cb      pea $cb23
$1a:c425  f0 01         beq $c428
$1a:c427  0c aa 0a      tsb $0aaa
$1a:c42a  c6 39         dec $39
$1a:c42c  5b            tcd
$1a:c42d  f4 1d 41      pea $411d
$1a:c430  14 09         trb $09
$1a:c432  0c 1d 0a      tsb $0a1d
$1a:c435  30 22         bmi $c459
$1a:c437  d1 c6         cmp ($c6),y
$1a:c439  73 b1         adc ($b1,s),y
$1a:c43b  96 92         stx $92,y
$1a:c43d  1a            inc a
$1a:c43e  17 01         ora [$01],y
$1a:c440  80 83         bra $c3c5
$1a:c442  83 c0         sta $c0,s
$1a:c444  62 3a d3      per $9781
$1a:c447  b0 45         bcs $c48e
$1a:c449  69 14         adc #$14
$1a:c44b  99 4c 35      sta $354c,y
$1a:c44e  de 31 52      dec $5231,x
$1a:c451  01 3d         ora ($3d,x)
$1a:c453  c6 53         dec $53
$1a:c455  c0 94         cpy #$94
$1a:c457  03 01         ora $01,s
$1a:c459  de 20 b0      dec $b020,x
$1a:c45c  fe ca 20      inc $20ca,x
$1a:c45f  3c 98 10      bit $1098,x
$1a:c462  30 27         bmi $c48b
$1a:c464  d1 09         cmp ($09),y
$1a:c466  84 79         sty $79
$1a:c468  de 41 c0      dec $c041,x
$1a:c46b  61 04         adc ($04,x)
$1a:c46d  d0 38         bne $c4a7
$1a:c46f  31 e9         and ($e9),y
$1a:c471  db            stp
$1a:c472  54 1d e7      mvn $e7,$1d
$1a:c475  07 69         ora [$69]
$1a:c477  04 d0         tsb $d0
$1a:c479  66 05         ror $05
$1a:c47b  52 8a         eor ($8a)
$1a:c47d  3b            tsc
$1a:c47e  cf 5d 09 1b   cmp $1b095d
$1a:c482  14 35         trb $35
$1a:c484  fa            plx
$1a:c485  04 c0         tsb $c0
$1a:c487  77 b0         adc [$b0],y
$1a:c489  dc 26 52      jml [$5226]
$1a:c48c  94 79         sty $79,x
$1a:c48e  3f db 8a 03   and $038adb,x
$1a:c492  09 88         ora #$88
$1a:c494  10 00         bpl $c496
$1a:c496  80 ef         bra $c487
$1a:c498  17 30         ora [$30],y
$1a:c49a  a1 c2         lda ($c2,x)
$1a:c49c  10 77         bpl $c515
$1a:c49e  53 7b         eor ($7b,s),y
$1a:c4a0  40            rti
$1a:c4a1  a0 30         ldy #$30
$1a:c4a3  14 28         trb $28
$1a:c4a5  a1 c0         lda ($c0,x)
$1a:c4a7  de 89 26      dec $2689,x
$1a:c4aa  3a            dec a
$1a:c4ab  82 3f 0e      brl $d2ed
$1a:c4ae  80 8f         bra $c43f
$1a:c4b0  fc 04 c8      jsr ($c804,x)
$1a:c4b3  b6 4c         ldx $4c,y
$1a:c4b5  26 d2         rol $d2
$1a:c4b7  60            rts
$1a:c4b8  31 58         and ($58),y
$1a:c4ba  26 8d         rol $8d
$1a:c4bc  b4 37         ldy $37,x
$1a:c4be  04 a8         tsb $a8
$1a:c4c0  22 90 ca 4a   jsl $4aca90
$1a:c4c4  a0 f4         ldy #$f4
$1a:c4c6  38            sec
$1a:c4c7  40            rti
$1a:c4c8  64 10         stz $10
$1a:c4ca  e1 02         sbc ($02,x)
$1a:c4cc  34 14         bit $14,x
$1a:c4ce  88            dey
$1a:c4cf  08            php
$1a:c4d0  70 81         bvs $c453
$1a:c4d2  28            plp
$1a:c4d3  1d d7 91      ora $91d7,x
$1a:c4d6  35 0c         and $0c,x
$1a:c4d8  94 20         sty $20,x
$1a:c4da  6a            ror a
$1a:c4db  10 88         bpl $c465
$1a:c4dd  dc 94 46      jml [$4694]
$1a:c4e0  31 c9         and ($c9),y
$1a:c4e2  34 42         bit $42,x
$1a:c4e4  61 2d         adc ($2d,x)
$1a:c4e6  07 88         ora [$88]
$1a:c4e8  7c 77 14      jmp ($1477,x)
$1a:c4eb  0a            asl a
$1a:c4ec  0c 76 3b      tsb $3b76
$1a:c4ef  24 29         bit $29
$1a:c4f1  01 c4         ora ($c4,x)
$1a:c4f3  03 e2         ora $e2,s
$1a:c4f5  1f 18 6d 22   ora $226d18,x
$1a:c4f9  93 0d         sta ($0d,s),y
$1a:c4fb  78            sei
$1a:c4fc  96 9a         stx $9a,y
$1a:c4fe  26 fc         rol $fc
$1a:c500  17 e0         ora [$e0],y
$1a:c502  c3 e5         cmp $e5,s
$1a:c504  30 df         bmi $c4e5
$1a:c506  e9 cc         sbc #$cc
$1a:c508  22 a0 40 36   jsl $3640a0
$1a:c50c  00 34         brk #$34
$1a:c50e  01 82         ora ($82,x)
$1a:c510  a8            tay
$1a:c511  45 41         eor $41
$1a:c513  2f 40 22 46   and $462240
$1a:c517  2b            pld
$1a:c518  80 9f         bra $c4b9
$1a:c51a  c0 c5         cpy #$c5
$1a:c51c  30 28         bmi $c546
$1a:c51e  40            rti
$1a:c51f  04 0c         tsb $0c
$1a:c521  50 8b         bvc $c4ae
$1a:c523  20 10 20      jsr $2010
$1a:c526  68            pla
$1a:c527  fb            xce
$1a:c528  c7 d2         cmp [$d2]
$1a:c52a  81 41         sta ($41,x)
$1a:c52c  98            tya
$1a:c52d  4f a4 46 83   eor $8346a4
$1a:c531  83 30         sta $30,s
$1a:c533  6c ec c1      jmp ($c1ec)
$1a:c536  e0 21         cpx #$21
$1a:c538  13 48         ora ($48,s),y
$1a:c53a  c4 eb         cpy $eb
$1a:c53c  3b            tsc
$1a:c53d  19 45 86      ora $8645,y
$1a:c540  5f 3b 3a 45   eor $453a3b,x
$1a:c544  84 64         sty $64
$1a:c546  aa            tax
$1a:c547  19 d7 79      ora $79d7,y
$1a:c54a  44 d1 61      mvp $61,$d1
$1a:c54d  13 01         ora ($01,s),y
$1a:c54f  04 52         tsb $52
$1a:c551  32 06         and ($06)
$1a:c553  08            php
$1a:c554  a3 f8         lda $f8,s
$1a:c556  60            rts
$1a:c557  4f 72 7c 01   eor $017c72
$1a:c55b  a0 e1         ldy #$e1
$1a:c55d  2f e1 80 80   and $8080e1
$1a:c561  8a            txa
$1a:c562  32 0d         and ($0d)
$1a:c564  0c bc 53      tsb $53bc
$1a:c567  2f 13 78 83   and $837813
$1a:c56b  bc 82 c2      ldy $c282,x
$1a:c56e  f7 01         sbc [$01],y
$1a:c570  91 bc         sta ($bc),y
$1a:c572  c0 1e         cpy #$1e
$1a:c574  42 60         wdm #$60
$1a:c576  89 c2         bit #$c2
$1a:c578  5e c1 13      lsr $13c1,x
$1a:c57b  89 e5         bit #$e5
$1a:c57d  e7 51         sbc [$51]
$1a:c57f  40            rti
$1a:c580  f1 41         sbc ($41),y
$1a:c582  a5 2c         lda $2c
$1a:c584  47 8c         eor [$8c]
$1a:c586  e9 38         sbc #$38
$1a:c588  b2 09         lda ($09)
$1a:c58a  0c 86 62      tsb $6286
$1a:c58d  61 03         adc ($03,x)
$1a:c58f  23 eb         and $eb,s
$1a:c591  57 a0         eor [$a0],y
$1a:c593  71 bd         adc ($bd),y
$1a:c595  6c 0a 75      jmp ($750a)
$1a:c598  9b            txy
$1a:c599  80 e6         bra $c581
$1a:c59b  e0 48         cpx #$48
$1a:c59d  27 37         and [$37]
$1a:c59f  82 ca 16      brl $dc6c
$1a:c5a2  c4 7f         cpy $7f
$1a:c5a4  09 4b         ora #$4b
$1a:c5a6  f0 12         beq $c5ba
$1a:c5a8  98            tya
$1a:c5a9  b1 b3         lda ($b3),y
$1a:c5ab  f8            sed
$1a:c5ac  15 18         ora $18,x
$1a:c5ae  a8            tay
$1a:c5af  90 8c         bcc $c53d
$1a:c5b1  5b            tcd
$1a:c5b2  8a            txa
$1a:c5b3  1a            inc a
$1a:c5b4  25 08         and $08
$1a:c5b6  c0 b4         cpy #$b4
$1a:c5b8  32 27         and ($27)
$1a:c5ba  fd 89 c1      sbc $c189,x
$1a:c5bd  23 50         and $50,s
$1a:c5bf  88            dey
$1a:c5c0  3e 76 02      rol $0276,x
$1a:c5c3  18            clc
$1a:c5c4  28            plp
$1a:c5c5  26 07         rol $07
$1a:c5c7  03 13         ora $13,s
$1a:c5c9  0e 03 c8      asl $c803
$1a:c5cc  83 24         sta $24,s
$1a:c5ce  33 07         and ($07,s),y
$1a:c5d0  e0 91         cpx #$91
$1a:c5d2  c3 2e         cmp $2e,s
$1a:c5d4  f2 1d         sbc ($1d)
$1a:c5d6  70 cc         bvs $c5a4
$1a:c5d8  5f 29 09 24   eor $240929,x
$1a:c5dc  80 09         bra $c5e7
$1a:c5de  1e c4 fc      asl $fcc4,x
$1a:c5e1  17 c9         ora [$c9],y
$1a:c5e3  3c c8 2c      bit $2cc8,x
$1a:c5e6  61 c3         adc ($c3,x)
$1a:c5e8  8a            txa
$1a:c5e9  00 95         brk #$95
$1a:c5eb  f2 91         sbc ($91)
$1a:c5ed  48            pha
$1a:c5ee  cc 4e 66      cpy $664e
$1a:c5f1  13 17         ora ($17,s),y
$1a:c5f3  b9 02 40      lda $4002,y
$1a:c5f6  58            cli
$1a:c5f7  32 12         and ($12)
$1a:c5f9  f8            sed
$1a:c5fa  c8            iny
$1a:c5fb  a1 13         lda ($13,x)
$1a:c5fd  26 09         rol $09
$1a:c5ff  64 45         stz $45
$1a:c601  65 08         adc $08
$1a:c603  37 c0         and [$c0],y
$1a:c605  14 05         trb $05
$1a:c607  83 02         sta $02,s
$1a:c609  cd c0 50      cmp $50c0
$1a:c60c  02 7f         cop #$7f
$1a:c60e  09 d2         ora #$d2
$1a:c610  00 33         brk #$33
$1a:c612  22 b5 58 c2   jsl $c258b5
$1a:c616  33 d3         and ($d3,s),y
$1a:c618  bf 81 33 12   lda $123381,x
$1a:c61c  fd e6 6f      sbc $6fe6,x
$1a:c61f  d0 c1         bne $c5e2
$1a:c621  33 ef         and ($ef,s),y
$1a:c623  24 ce         bit $ce
$1a:c625  d6 e0         dec $e0,x
$1a:c627  40            rti
$1a:c628  1d ed fb      ora $fbed,x
$1a:c62b  11 04         ora ($04),y
$1a:c62d  9a            txs
$1a:c62e  31 ae         and ($ae),y
$1a:c630  fd d7 2b      sbc $2bd7,x
$1a:c633  ae f7 77      ldx $77f7
$1a:c636  9d 6a b7      sta $b76a,x
$1a:c639  00 99         brk #$99
$1a:c63b  7f 4a 41 29   adc $29414a,x
$1a:c63f  7d 80 48      adc $4880,x
$1a:c642  00 38         brk #$38
$1a:c644  28            plp
$1a:c645  f1 cf         sbc ($cf),y
$1a:c647  92 bc         sta ($bc)
$1a:c649  b7 e6         lda [$e6],y
$1a:c64b  cf 3e fa 3b   cmp $3bfa3e
$1a:c64f  d3 fe         cmp ($fe,s),y
$1a:c651  b0 f6         bcs $c649
$1a:c653  0f b4 bd c7   ora $c7bdb4
$1a:c657  ef 4f 02 f8   sbc $f8024f
$1a:c65b  5b            tcd
$1a:c65c  c4 fe         cpy $fe
$1a:c65e  38            sec
$1a:c65f  f2 4f         sbc ($4f)
$1a:c661  96 bc         stx $bc,y
$1a:c663  d7 e7         cmp [$e7],y
$1a:c665  cf 46 fa 7b   cmp $7bfa46
$1a:c669  d5 fe         cmp $fe,x
$1a:c66b  c0 f6         cpy #$f6
$1a:c66d  8f b8 bd d0   sta $d0bdb8
$1a:c671  72 99         adc ($99)
$1a:c673  4f fd f2 12   eor $12f2fd
$1a:c677  97 47         sta [$47],y
$1a:c679  83 fe         sta $fe,s
$1a:c67b  0e fc 11      asl $11fc
$1a:c67e  11 41         ora ($41),y
$1a:c680  03 5e         ora $5e,s
$1a:c682  2b            pld
$1a:c683  f7 a2         sbc [$a2],y
$1a:c685  be 50 73      ldx $7350,y
$1a:c688  e5 af         sbc $af
$1a:c68a  08            php
$1a:c68b  24 ca         bit $ca
$1a:c68d  0c 82 49      tsb $4982
$1a:c690  98            tya
$1a:c691  43 d3         eor $d3,s
$1a:c693  5e ab f5      lsr $f5ab,x
$1a:c696  e7 b3         sbc [$b3]
$1a:c698  7d bd ee      adc $eebd,x
$1a:c69b  ff 00 78 47   sbc $477800,x
$1a:c69f  c4 5e         cpy $5e
$1a:c6a1  30 bf         bmi $c662
$1a:c6a3  ec a6 73      cpx $73a6
$1a:c6a6  08            php
$1a:c6a7  31 19         and ($19),y
$1a:c6a9  e9 a6         sbc #$a6
$1a:c6ab  71 a8         adc ($a8),y
$1a:c6ad  46 76         lsr $76
$1a:c6af  02 47         cop #$47
$1a:c6b1  89 0c         bit #$0c
$1a:c6b3  86 44         stx $44
$1a:c6b5  44 12 a8      mvp $a8,$12
$1a:c6b8  8c 14 ac      sty $ac14
$1a:c6bb  24 4b         bit $4b
$1a:c6bd  24 07         bit $07
$1a:c6bf  fe 11 08      inc $0811,x
$1a:c6c2  e4 4d         cpx $4d
$1a:c6c4  50 e0         bvc $c6a6
$1a:c6c6  7a            ply
$1a:c6c7  79 4e b6      adc $b64e,y
$1a:c6ca  03 26         ora $26,s
$1a:c6cc  88            dey
$1a:c6cd  4c 25 a6      jmp $a625
$1a:c6d0  aa            tax
$1a:c6d1  93 46         sta ($46,s),y
$1a:c6d3  20 e4 96      jsr $96e4
$1a:c6d6  94 2c         sty $2c,x
$1a:c6d8  41 48         eor ($48,x)
$1a:c6da  53 2f         eor ($2f,s),y
$1a:c6dc  e8            inx
$1a:c6dd  c3 d9         cmp $d9,s
$1a:c6df  5e db f7      lsr $f7db,x
$1a:c6e2  60            rts
$1a:c6e3  00 24         brk #$24
$1a:c6e5  00 4e         brk #$4e
$1a:c6e7  2e 0d ff      rol $ff0d
$1a:c6ea  e0 b8         cpx #$b8
$1a:c6ec  01 80         ora ($80,x)
$1a:c6ee  0e ff e0      asl $e0ff
$1a:c6f1  b8            clv
$1a:c6f2  00 f0         brk #$f0
$1a:c6f4  0f ff e0 b8   ora $b8e0ff
$1a:c6f8  07 a8         ora [$a8]
$1a:c6fa  10 ff         bpl $c6fb
$1a:c6fc  f3 b8         sbc ($b8,s),y
$1a:c6fe  03 00         ora $00,s
$1a:c700  11 ff         ora ($ff),y
$1a:c702  e0 b8         cpx #$b8
$1a:c704  03 c0         ora $c0,s
$1a:c706  12 ff         ora ($ff)
$1a:c708  e0 b8         cpx #$b8
$1a:c70a  06 15         asl $15
$1a:c70c  18            clc
$1a:c70d  00 00         brk #$00
$1a:c70f  2f 32 65 7f   and $7f6532
$1a:c713  98            tya
$1a:c714  b2 cb         lda ($cb)
$1a:c716  e5 fc         sbc $fc
$1a:c718  19 32 4c      ora $4c32,y
$1a:c71b  65 72         adc $72
$1a:c71d  7f 8c 98 a5   adc $a5988c,x
$1a:c721  b2 bf         lda ($bf)
$1a:c723  cb            wai
$1a:c724  d8            cld
$1a:c725  e5 f2         sbc $f2
$1a:c727  fc ef 07      jsr ($07ef,x)
$1a:c72a  00 10         brk #$10
$1a:c72c  02 10         cop #$10
$1a:c72e  0a            asl a
$1a:c72f  10 ff         bpl $c730
$1a:c731  00 02         brk #$02
$1a:c733  10 00         bpl $c735
$1a:c735  00 1a         brk #$1a
$1a:c737  10 0b         bpl $c744
$1a:c739  11 d3         ora ($d3),y
$1a:c73b  11 80         ora ($80),y
$1a:c73d  13 63         ora ($63,s),y
$1a:c73f  14 e1         trb $e1
$1a:c741  15 6f         ora $6f,x
$1a:c743  16 30         asl $30,x
$1a:c745  17 fa         ora [$fa],y
$1a:c747  05 ea         ora $ea
$1a:c749  f4 e0 03      pea $03e0
$1a:c74c  e7 17         sbc [$17]
$1a:c74e  ed 8c e5      sbc $e58c
$1a:c751  ff e1 0a f5   sbc $f50ae1,x
$1a:c755  80 7f         bra $c7d6
$1a:c757  7f f7 03 aa   adc $aa03f7,x
$1a:c75b  00 e3         brk #$e3
$1a:c75d  01 1e         ora ($1e,x)
$1a:c75f  05 30         ora $30
$1a:c761  5d b5 24      eor $24b5,x
$1a:c764  b9 0c b7      lda $b70c,y
$1a:c767  48            pha
$1a:c768  7d c8 0c      adc $0cc8,x
$1a:c76b  5d b7 b5      eor $b5b7,x
$1a:c76e  06 b4         asl $b4
$1a:c770  06 5b         asl $5b
$1a:c772  b5 06         lda $06,x
$1a:c774  5d b4 06      eor $06b4,x
$1a:c777  59 b2 30      eor $30b2,y
$1a:c77a  7d c8 0c      adc $0cc8,x
$1a:c77d  5d b0 b2      eor $b2b0,x
$1a:c780  48            pha
$1a:c781  78            sei
$1a:c782  c8            iny
$1a:c783  18            clc
$1a:c784  c9 30         cmp #$30
$1a:c786  5d b5 24      eor $24b5,x
$1a:c789  b9 0c b7      lda $b70c,y
$1a:c78c  48            pha
$1a:c78d  7d c8 0c      adc $0cc8,x
$1a:c790  5d b7 b5      eor $b5b7,x
$1a:c793  06 b4         asl $b4
$1a:c795  06 5b         asl $5b
$1a:c797  b5 06         lda $06,x
$1a:c799  5d b4 06      eor $06b4,x
$1a:c79c  59 b2 30      eor $30b2,y
$1a:c79f  7d c8 0c      adc $0cc8,x
$1a:c7a2  5d b0 b2      eor $b2b0,x
$1a:c7a5  48            pha
$1a:c7a6  78            sei
$1a:c7a7  c8            iny
$1a:c7a8  18            clc
$1a:c7a9  c9 10         cmp #$10
$1a:c7ab  c9 10         cmp #$10
$1a:c7ad  5d b9 b7      eor $b7b9,x
$1a:c7b0  b5 b4         lda $b4,x
$1a:c7b2  b5 b7         lda $b7,x
$1a:c7b4  b5 b4         lda $b4,x
$1a:c7b6  30 b2         bmi $c76a
$1a:c7b8  10 c9         bpl $c783
$1a:c7ba  b9 b7 b5      lda $b5b7,y
$1a:c7bd  b4 b5         ldy $b5,x
$1a:c7bf  b7 b5         lda [$b5],y
$1a:c7c1  b4 30         ldy $30,x
$1a:c7c3  b2 0c         lda ($0c)
$1a:c7c5  c9 a9         cmp #$a9
$1a:c7c7  3c 7d c8      bit $c87d,x
$1a:c7ca  0c 5d a6      tsb $a65d
$1a:c7cd  0c 7d c8      tsb $c87d
$1a:c7d0  0c 5d a4      tsb $a45d
$1a:c7d3  30 a6         bmi $c77b
$1a:c7d5  18            clc
$1a:c7d6  c9 c9         cmp #$c9
$1a:c7d8  30 a9         bmi $c783
$1a:c7da  0c 7d c8      tsb $c87d
$1a:c7dd  0c 5d a6      tsb $a65d
$1a:c7e0  0c 7d c8      tsb $c87d
$1a:c7e3  0c 5d a4      tsb $a45d
$1a:c7e6  18            clc
$1a:c7e7  a6 e4         ldx $e4
$1a:c7e9  30 c9         bmi $c7b4
$1a:c7eb  e3 01         sbc $01,s
$1a:c7ed  28            plp
$1a:c7ee  3c 10 4d      bit $4d10,x
$1a:c7f1  be be 10      ldx $10be,y
$1a:c7f4  4a            lsr a
$1a:c7f5  be 18 c8      ldx $c818,y
$1a:c7f8  18            clc
$1a:c7f9  4d bc b9      eor $b9bc
$1a:c7fc  bc 30 4b      ldy $4b30,x
$1a:c7ff  be 10 4d      ldx $4d10,y
$1a:c802  be be 10      ldx $10be,y
$1a:c805  4a            lsr a
$1a:c806  be 18 c8      ldx $c818,y
$1a:c809  18            clc
$1a:c80a  4d bc b9      eor $b9bc
$1a:c80d  bc 30 4b      ldy $4b30,x
$1a:c810  b9 10 4d      lda $4d10,y
$1a:c813  be be 10      ldx $10be,y
$1a:c816  4a            lsr a
$1a:c817  be 18 c8      ldx $c818,y
$1a:c81a  18            clc
$1a:c81b  4d bc b9      eor $b9bc
$1a:c81e  bc 30 4b      ldy $4b30,x
$1a:c821  be 10 4d      ldx $4d10,y
$1a:c824  be be 10      ldx $10be,y
$1a:c827  4a            lsr a
$1a:c828  be 18 c8      ldx $c818,y
$1a:c82b  18            clc
$1a:c82c  4d bc b9      eor $b9bc
$1a:c82f  18            clc
$1a:c830  49 c1         eor #$c1
$1a:c832  30 4a         bmi $c87e
$1a:c834  be e4 00      ldx $00e4,y
$1a:c837  ea            nop
$1a:c838  f4 e0 03      pea $03e0
$1a:c83b  ed 5a e1      sbc $e15a
$1a:c83e  0a            asl a
$1a:c83f  30 5d         bmi $c89e
$1a:c841  b0 24         bcs $c867
$1a:c843  b4 0c         ldy $0c,x
$1a:c845  b2 48         lda ($48)
$1a:c847  7d c8 0c      adc $0cc8,x
$1a:c84a  5d b2 b0      eor $b0b2,x
$1a:c84d  06 af         asl $af
$1a:c84f  06 5b         asl $5b
$1a:c851  b0 06         bcs $c859
$1a:c853  5d af 06      eor $06af,x
$1a:c856  59 ad 30      eor $30ad,y
$1a:c859  7d c8 0c      adc $0cc8,x
$1a:c85c  5d ab ad      eor $adab,x
$1a:c85f  48            pha
$1a:c860  78            sei
$1a:c861  c8            iny
$1a:c862  18            clc
$1a:c863  c9 30         cmp #$30
$1a:c865  5d b0 24      eor $24b0,x
$1a:c868  b4 0c         ldy $0c,x
$1a:c86a  b2 48         lda ($48)
$1a:c86c  7d c8 0c      adc $0cc8,x
$1a:c86f  5d b2 b0      eor $b0b2,x
$1a:c872  06 af         asl $af
$1a:c874  06 5b         asl $5b
$1a:c876  b0 06         bcs $c87e
$1a:c878  5d af 06      eor $06af,x
$1a:c87b  59 ad 30      eor $30ad,y
$1a:c87e  7d c8 0c      adc $0cc8,x
$1a:c881  5d ab ad      eor $adab,x
$1a:c884  48            pha
$1a:c885  78            sei
$1a:c886  c8            iny
$1a:c887  18            clc
$1a:c888  c9 10         cmp #$10
$1a:c88a  c9 10         cmp #$10
$1a:c88c  5d b4 b2      eor $b2b4,x
$1a:c88f  b0 af         bcs $c840
$1a:c891  b0 b2         bcs $c845
$1a:c893  b0 af         bcs $c844
$1a:c895  30 ad         bmi $c844
$1a:c897  10 c9         bpl $c862
$1a:c899  b4 b2         ldy $b2,x
$1a:c89b  b0 af         bcs $c84c
$1a:c89d  b0 b2         bcs $c851
$1a:c89f  b0 af         bcs $c850
$1a:c8a1  30 ad         bmi $c850
$1a:c8a3  ed 46 0c      sbc $0c46
$1a:c8a6  c9 a9         cmp #$a9
$1a:c8a8  3c 7d c8      bit $c87d,x
$1a:c8ab  0c 5d a6      tsb $a65d
$1a:c8ae  0c 7d c8      tsb $c87d
$1a:c8b1  0c 5d a4      tsb $a45d
$1a:c8b4  30 a6         bmi $c85c
$1a:c8b6  18            clc
$1a:c8b7  c9 c9         cmp #$c9
$1a:c8b9  30 a9         bmi $c864
$1a:c8bb  0c 7d c8      tsb $c87d
$1a:c8be  0c 5d a6      tsb $a65d
$1a:c8c1  0c 7d c8      tsb $c87d
$1a:c8c4  0c 5d a4      tsb $a45d
$1a:c8c7  18            clc
$1a:c8c8  a6 30         ldx $30
$1a:c8ca  c9 ed         cmp #$ed
$1a:c8cc  64 e0         stz $e0
$1a:c8ce  03 10         ora $10,s
$1a:c8d0  b9 b9 b9      lda $b9b9,y
$1a:c8d3  18            clc
$1a:c8d4  c8            iny
$1a:c8d5  b7 b4         lda [$b4],y
$1a:c8d7  b7 30         lda [$30],y
$1a:c8d9  b9 10 b9      lda $b910,y
$1a:c8dc  b9 b9 18      lda $18b9,y
$1a:c8df  c8            iny
$1a:c8e0  b7 b4         lda [$b4],y
$1a:c8e2  b7 30         lda [$30],y
$1a:c8e4  b4 10         ldy $10,x
$1a:c8e6  b9 b9 b9      lda $b9b9,y
$1a:c8e9  18            clc
$1a:c8ea  c8            iny
$1a:c8eb  b7 b4         lda [$b4],y
$1a:c8ed  b7 30         lda [$30],y
$1a:c8ef  b9 10 b9      lda $b910,y
$1a:c8f2  b9 b9 18      lda $18b9,y
$1a:c8f5  c8            iny
$1a:c8f6  b7 b4         lda [$b4],y
$1a:c8f8  18            clc
$1a:c8f9  57 bb         eor [$bb],y
$1a:c8fb  30 59         bmi $c956
$1a:c8fd  b9 00 ea      lda $ea00,y
$1a:c900  00 e0         brk #$e0
$1a:c902  00 ed         brk #$ed
$1a:c904  91 e1         sta ($e1),y
$1a:c906  0a            asl a
$1a:c907  18            clc
$1a:c908  5d 8e 0c      eor $0c8e,x
$1a:c90b  5b            tcd
$1a:c90c  9a            txs
$1a:c90d  18            clc
$1a:c90e  95 18         sta $18,x
$1a:c910  59 98 0c      eor $0c98,y
$1a:c913  5d 9a 0c      eor $0c9a,x
$1a:c916  6d c8 0c      adc $0cc8
$1a:c919  5d 8e 0c      eor $0c8e,x
$1a:c91c  5b            tcd
$1a:c91d  9a            txs
$1a:c91e  0c 59 95      tsb $9559
$1a:c921  18            clc
$1a:c922  4b            phk
$1a:c923  98            tya
$1a:c924  0c 5d 9a      tsb $9a5d
$1a:c927  0c 59 95      tsb $9559
$1a:c92a  18            clc
$1a:c92b  5d 8e 0c      eor $0c8e,x
$1a:c92e  5b            tcd
$1a:c92f  9a            txs
$1a:c930  18            clc
$1a:c931  95 18         sta $18,x
$1a:c933  59 98 0c      eor $0c98,y
$1a:c936  5d 9a 0c      eor $0c9a,x
$1a:c939  6d c8 0c      adc $0cc8
$1a:c93c  5d 8e 0c      eor $0c8e,x
$1a:c93f  5b            tcd
$1a:c940  9a            txs
$1a:c941  0c 59 95      tsb $9559
$1a:c944  18            clc
$1a:c945  4b            phk
$1a:c946  98            tya
$1a:c947  0c 5d 9a      tsb $9a5d
$1a:c94a  0c 59 95      tsb $9559
$1a:c94d  18            clc
$1a:c94e  5d 8e 0c      eor $0c8e,x
$1a:c951  5b            tcd
$1a:c952  9a            txs
$1a:c953  18            clc
$1a:c954  95 18         sta $18,x
$1a:c956  59 98 0c      eor $0c98,y
$1a:c959  5d 9a 0c      eor $0c9a,x
$1a:c95c  6d c8 0c      adc $0cc8
$1a:c95f  5d 8e 0c      eor $0c8e,x
$1a:c962  5b            tcd
$1a:c963  9a            txs
$1a:c964  0c 59 95      tsb $9559
$1a:c967  18            clc
$1a:c968  4b            phk
$1a:c969  98            tya
$1a:c96a  0c 5d 9a      tsb $9a5d
$1a:c96d  0c 59 95      tsb $9559
$1a:c970  18            clc
$1a:c971  5d 8e 0c      eor $0c8e,x
$1a:c974  5b            tcd
$1a:c975  9a            txs
$1a:c976  18            clc
$1a:c977  95 18         sta $18,x
$1a:c979  59 98 0c      eor $0c98,y
$1a:c97c  5d 9a 0c      eor $0c9a,x
$1a:c97f  6d c8 0c      adc $0cc8
$1a:c982  5d 8e 0c      eor $0c8e,x
$1a:c985  5b            tcd
$1a:c986  9a            txs
$1a:c987  0c 59 95      tsb $9559
$1a:c98a  18            clc
$1a:c98b  4b            phk
$1a:c98c  98            tya
$1a:c98d  0c 5d 9a      tsb $9a5d
$1a:c990  0c 59 95      tsb $9559
$1a:c993  18            clc
$1a:c994  5d 8e 0c      eor $0c8e,x
$1a:c997  5b            tcd
$1a:c998  9a            txs
$1a:c999  18            clc
$1a:c99a  95 18         sta $18,x
$1a:c99c  59 98 0c      eor $0c98,y
$1a:c99f  5d 9a 0c      eor $0c9a,x
$1a:c9a2  6d c8 0c      adc $0cc8
$1a:c9a5  5d 8e 0c      eor $0c8e,x
$1a:c9a8  5b            tcd
$1a:c9a9  9a            txs
$1a:c9aa  0c 59 95      tsb $9559
$1a:c9ad  18            clc
$1a:c9ae  4b            phk
$1a:c9af  98            tya
$1a:c9b0  0c 5d 9a      tsb $9a5d
$1a:c9b3  0c 59 95      tsb $9559
$1a:c9b6  18            clc
$1a:c9b7  5d 8e 0c      eor $0c8e,x
$1a:c9ba  5b            tcd
$1a:c9bb  9a            txs
$1a:c9bc  18            clc
$1a:c9bd  95 18         sta $18,x
$1a:c9bf  59 98 0c      eor $0c98,y
$1a:c9c2  5d 9a 0c      eor $0c9a,x
$1a:c9c5  6d c8 0c      adc $0cc8
$1a:c9c8  5d 8e 0c      eor $0c8e,x
$1a:c9cb  5b            tcd
$1a:c9cc  9a            txs
$1a:c9cd  0c 59 95      tsb $9559
$1a:c9d0  18            clc
$1a:c9d1  4b            phk
$1a:c9d2  98            tya
$1a:c9d3  0c 5d 9a      tsb $9a5d
$1a:c9d6  0c 59 95      tsb $9559
$1a:c9d9  18            clc
$1a:c9da  5d 8e 0c      eor $0c8e,x
$1a:c9dd  5b            tcd
$1a:c9de  9a            txs
$1a:c9df  18            clc
$1a:c9e0  95 18         sta $18,x
$1a:c9e2  59 98 0c      eor $0c98,y
$1a:c9e5  5d 9a 0c      eor $0c9a,x
$1a:c9e8  6d c8 0c      adc $0cc8
$1a:c9eb  5d 8e 0c      eor $0c8e,x
$1a:c9ee  5b            tcd
$1a:c9ef  9a            txs
$1a:c9f0  0c 59 95      tsb $9559
$1a:c9f3  18            clc
$1a:c9f4  4b            phk
$1a:c9f5  98            tya
$1a:c9f6  0c 5d 9a      tsb $9a5d
$1a:c9f9  0c 59 95      tsb $9559
$1a:c9fc  18            clc
$1a:c9fd  5d 8e 0c      eor $0c8e,x
$1a:ca00  5b            tcd
$1a:ca01  9a            txs
$1a:ca02  18            clc
$1a:ca03  95 18         sta $18,x
$1a:ca05  59 98 0c      eor $0c98,y
$1a:ca08  5d 9a 0c      eor $0c9a,x
$1a:ca0b  6d c8 0c      adc $0cc8
$1a:ca0e  5d 8e 0c      eor $0c8e,x
$1a:ca11  5b            tcd
$1a:ca12  9a            txs
$1a:ca13  0c 59 95      tsb $9559
$1a:ca16  18            clc
$1a:ca17  4b            phk
$1a:ca18  98            tya
$1a:ca19  0c 5d 9a      tsb $9a5d
$1a:ca1c  0c 59 95      tsb $9559
$1a:ca1f  18            clc
$1a:ca20  5d 8e 0c      eor $0c8e,x
$1a:ca23  5b            tcd
$1a:ca24  9a            txs
$1a:ca25  18            clc
$1a:ca26  95 18         sta $18,x
$1a:ca28  59 98 0c      eor $0c98,y
$1a:ca2b  5d 9a 0c      eor $0c9a,x
$1a:ca2e  6d c8 0c      adc $0cc8
$1a:ca31  5d 8e 0c      eor $0c8e,x
$1a:ca34  5b            tcd
$1a:ca35  9a            txs
$1a:ca36  0c 59 95      tsb $9559
$1a:ca39  18            clc
$1a:ca3a  4b            phk
$1a:ca3b  98            tya
$1a:ca3c  0c 5d 9a      tsb $9a5d
$1a:ca3f  0c 59 95      tsb $9559
$1a:ca42  18            clc
$1a:ca43  5d 8e 0c      eor $0c8e,x
$1a:ca46  5b            tcd
$1a:ca47  9a            txs
$1a:ca48  18            clc
$1a:ca49  95 18         sta $18,x
$1a:ca4b  59 98 0c      eor $0c98,y
$1a:ca4e  5d 9a 0c      eor $0c9a,x
$1a:ca51  6d c8 0c      adc $0cc8
$1a:ca54  5d 8e 0c      eor $0c8e,x
$1a:ca57  5b            tcd
$1a:ca58  9a            txs
$1a:ca59  0c 59 95      tsb $9559
$1a:ca5c  18            clc
$1a:ca5d  4b            phk
$1a:ca5e  98            tya
$1a:ca5f  0c 5d 9a      tsb $9a5d
$1a:ca62  0c 59 95      tsb $9559
$1a:ca65  18            clc
$1a:ca66  5d 8e 0c      eor $0c8e,x
$1a:ca69  5b            tcd
$1a:ca6a  9a            txs
$1a:ca6b  18            clc
$1a:ca6c  95 18         sta $18,x
$1a:ca6e  59 98 0c      eor $0c98,y
$1a:ca71  5d 9a 0c      eor $0c9a,x
$1a:ca74  6d c8 0c      adc $0cc8
$1a:ca77  5d 8e 0c      eor $0c8e,x
$1a:ca7a  5b            tcd
$1a:ca7b  9a            txs
$1a:ca7c  0c 59 95      tsb $9559
$1a:ca7f  18            clc
$1a:ca80  4b            phk
$1a:ca81  98            tya
$1a:ca82  0c 5d 9a      tsb $9a5d
$1a:ca85  0c 59 95      tsb $9559
$1a:ca88  18            clc
$1a:ca89  5d 8e 0c      eor $0c8e,x
$1a:ca8c  5b            tcd
$1a:ca8d  9a            txs
$1a:ca8e  18            clc
$1a:ca8f  95 18         sta $18,x
$1a:ca91  59 98 0c      eor $0c98,y
$1a:ca94  5d 9a 0c      eor $0c9a,x
$1a:ca97  6d c8 0c      adc $0cc8
$1a:ca9a  5d 8e 0c      eor $0c8e,x
$1a:ca9d  5b            tcd
$1a:ca9e  9a            txs
$1a:ca9f  0c 59 95      tsb $9559
$1a:caa2  18            clc
$1a:caa3  4b            phk
$1a:caa4  98            tya
$1a:caa5  0c 5d 9a      tsb $9a5d
$1a:caa8  0c 59 95      tsb $9559
$1a:caab  00 ea         brk #$ea
$1a:caad  f4 e0 01      pea $01e0
$1a:cab0  ed 87 e1      sbc $e187
$1a:cab3  0b            phd
$1a:cab4  30 5d         bmi $cb13
$1a:cab6  b5 24         lda $24,x
$1a:cab8  b9 0c b7      lda $b70c,y
$1a:cabb  48            pha
$1a:cabc  7d c8 0c      adc $0cc8,x
$1a:cabf  5d b7 b5      eor $b5b7,x
$1a:cac2  06 b4         asl $b4
$1a:cac4  06 5b         asl $5b
$1a:cac6  b5 06         lda $06,x
$1a:cac8  5d b4 06      eor $06b4,x
$1a:cacb  59 b2 30      eor $30b2,y
$1a:cace  7d c8 0c      adc $0cc8,x
$1a:cad1  5d b0 b2      eor $b2b0,x
$1a:cad4  48            pha
$1a:cad5  78            sei
$1a:cad6  c8            iny
$1a:cad7  18            clc
$1a:cad8  c9 30         cmp #$30
$1a:cada  5d b5 24      eor $24b5,x
$1a:cadd  b9 0c b7      lda $b70c,y
$1a:cae0  48            pha
$1a:cae1  7d c8 0c      adc $0cc8,x
$1a:cae4  5d b7 b5      eor $b5b7,x
$1a:cae7  06 b4         asl $b4
$1a:cae9  06 5b         asl $5b
$1a:caeb  b5 06         lda $06,x
$1a:caed  5d b4 06      eor $06b4,x
$1a:caf0  59 b2 30      eor $30b2,y
$1a:caf3  7d c8 0c      adc $0cc8,x
$1a:caf6  5d b0 b2      eor $b2b0,x
$1a:caf9  48            pha
$1a:cafa  78            sei
$1a:cafb  c8            iny
$1a:cafc  18            clc
$1a:cafd  c9 10         cmp #$10
$1a:caff  c9 10         cmp #$10
$1a:cb01  5d b9 b7      eor $b7b9,x
$1a:cb04  b5 b4         lda $b4,x
$1a:cb06  b5 b7         lda $b7,x
$1a:cb08  b5 b4         lda $b4,x
$1a:cb0a  30 b2         bmi $cabe
$1a:cb0c  10 c9         bpl $cad7
$1a:cb0e  b9 b7 b5      lda $b5b7,y
$1a:cb11  b4 b5         ldy $b5,x
$1a:cb13  b7 b5         lda [$b5],y
$1a:cb15  b4 30         ldy $30,x
$1a:cb17  b2 0c         lda ($0c)
$1a:cb19  c9 a9         cmp #$a9
$1a:cb1b  3c 7d c8      bit $c87d,x
$1a:cb1e  0c 5d a6      tsb $a65d
$1a:cb21  0c 7d c8      tsb $c87d
$1a:cb24  0c 5d a4      tsb $a45d
$1a:cb27  30 a6         bmi $cacf
$1a:cb29  18            clc
$1a:cb2a  c9 c9         cmp #$c9
$1a:cb2c  30 a9         bmi $cad7
$1a:cb2e  0c 7d c8      tsb $c87d
$1a:cb31  0c 5d a6      tsb $a65d
$1a:cb34  0c 7d c8      tsb $c87d
$1a:cb37  0c 5d a4      tsb $a45d
$1a:cb3a  18            clc
$1a:cb3b  a6 30         ldx $30
$1a:cb3d  c9 10         cmp #$10
$1a:cb3f  be 10 5b      ldx $5b10,y
$1a:cb42  be 10 59      ldx $5910,y
$1a:cb45  be 18 4d      ldx $4d18,y
$1a:cb48  c8            iny
$1a:cb49  18            clc
$1a:cb4a  5d bc b9      eor $b9bc,x
$1a:cb4d  bc 30 59      ldy $5930,x
$1a:cb50  be 10 5d      ldx $5d10,y
$1a:cb53  be 10 5b      ldx $5b10,y
$1a:cb56  be 10 59      ldx $5910,y
$1a:cb59  be 18 4d      ldx $4d18,y
$1a:cb5c  c8            iny
$1a:cb5d  18            clc
$1a:cb5e  5d bc b9      eor $b9bc,x
$1a:cb61  bc 30 5b      ldy $5b30,x
$1a:cb64  b9 10 5d      lda $5d10,y
$1a:cb67  be 10 5b      ldx $5b10,y
$1a:cb6a  be 10 59      ldx $5910,y
$1a:cb6d  be 18 c8      ldx $c818,y
$1a:cb70  18            clc
$1a:cb71  5d bc b9      eor $b9bc,x
$1a:cb74  bc 30 59      ldy $5930,x
$1a:cb77  be 10 5d      ldx $5d10,y
$1a:cb7a  be 10 5b      ldx $5b10,y
$1a:cb7d  be 10 59      ldx $5910,y
$1a:cb80  be 18 c8      ldx $c818,y
$1a:cb83  18            clc
$1a:cb84  5d bc 18      eor $18bc,x
$1a:cb87  5b            tcd
$1a:cb88  b9 18 59      lda $5918,y
$1a:cb8b  c1 30         cmp ($30,x)
$1a:cb8d  be 00 e0      ldx $e000,y
$1a:cb90  02 ea         cop #$ea
$1a:cb92  e8            inx
$1a:cb93  ed aa e1      sbc $e1aa
$1a:cb96  0a            asl a
$1a:cb97  e1 0b         sbc ($0b,x)
$1a:cb99  12 1d         ora ($1d)
$1a:cb9b  ab            plb
$1a:cb9c  06 ab         asl $ab
$1a:cb9e  c9 ab         cmp #$ab
$1a:cba0  0c a8 ab      tsb $aba8
$1a:cba3  a8            tay
$1a:cba4  ad a8 e1      lda $e1a8
$1a:cba7  09 12         ora #$12
$1a:cba9  ab            plb
$1a:cbaa  06 ab         asl $ab
$1a:cbac  c9 ab         cmp #$ab
$1a:cbae  0c a8 ab      tsb $aba8
$1a:cbb1  a8            tay
$1a:cbb2  06 ad         asl $ad
$1a:cbb4  ad 0c a8      lda $a80c
$1a:cbb7  e1 0b         sbc ($0b,x)
$1a:cbb9  12 ab         ora ($ab)
$1a:cbbb  06 ab         asl $ab
$1a:cbbd  c9 ab         cmp #$ab
$1a:cbbf  0c a8 ab      tsb $aba8
$1a:cbc2  a8            tay
$1a:cbc3  ad a8 e1      lda $e1a8
$1a:cbc6  09 12         ora #$12
$1a:cbc8  ab            plb
$1a:cbc9  06 ab         asl $ab
$1a:cbcb  c9 ab         cmp #$ab
$1a:cbcd  0c a8 ab      tsb $aba8
$1a:cbd0  a8            tay
$1a:cbd1  06 ad         asl $ad
$1a:cbd3  ad 0c a8      lda $a80c
$1a:cbd6  e1 0b         sbc ($0b,x)
$1a:cbd8  12 ab         ora ($ab)
$1a:cbda  06 ab         asl $ab
$1a:cbdc  c9 ab         cmp #$ab
$1a:cbde  0c a8 ab      tsb $aba8
$1a:cbe1  a8            tay
$1a:cbe2  ad a8 e1      lda $e1a8
$1a:cbe5  09 12         ora #$12
$1a:cbe7  ab            plb
$1a:cbe8  06 ab         asl $ab
$1a:cbea  c9 ab         cmp #$ab
$1a:cbec  0c a8 ab      tsb $aba8
$1a:cbef  a8            tay
$1a:cbf0  06 ad         asl $ad
$1a:cbf2  ad 0c a8      lda $a80c
$1a:cbf5  e1 0b         sbc ($0b,x)
$1a:cbf7  12 ab         ora ($ab)
$1a:cbf9  06 ab         asl $ab
$1a:cbfb  c9 ab         cmp #$ab
$1a:cbfd  0c a8 ab      tsb $aba8
$1a:cc00  a8            tay
$1a:cc01  ad a8 e1      lda $e1a8
$1a:cc04  09 12         ora #$12
$1a:cc06  ab            plb
$1a:cc07  06 ab         asl $ab
$1a:cc09  c9 ab         cmp #$ab
$1a:cc0b  0c a8 ab      tsb $aba8
$1a:cc0e  a8            tay
$1a:cc0f  06 ad         asl $ad
$1a:cc11  ad 0c a8      lda $a80c
$1a:cc14  e1 0b         sbc ($0b,x)
$1a:cc16  12 ab         ora ($ab)
$1a:cc18  06 ab         asl $ab
$1a:cc1a  c9 ab         cmp #$ab
$1a:cc1c  0c a8 ab      tsb $aba8
$1a:cc1f  a8            tay
$1a:cc20  ad a8 e1      lda $e1a8
$1a:cc23  09 12         ora #$12
$1a:cc25  ab            plb
$1a:cc26  06 ab         asl $ab
$1a:cc28  c9 ab         cmp #$ab
$1a:cc2a  0c a8 ab      tsb $aba8
$1a:cc2d  a8            tay
$1a:cc2e  06 ad         asl $ad
$1a:cc30  ad 0c a8      lda $a80c
$1a:cc33  e1 0b         sbc ($0b,x)
$1a:cc35  12 ab         ora ($ab)
$1a:cc37  06 ab         asl $ab
$1a:cc39  c9 ab         cmp #$ab
$1a:cc3b  0c a8 ab      tsb $aba8
$1a:cc3e  a8            tay
$1a:cc3f  ad a8 e1      lda $e1a8
$1a:cc42  09 12         ora #$12
$1a:cc44  ab            plb
$1a:cc45  06 ab         asl $ab
$1a:cc47  c9 ab         cmp #$ab
$1a:cc49  0c a8 ab      tsb $aba8
$1a:cc4c  a8            tay
$1a:cc4d  06 ad         asl $ad
$1a:cc4f  ad 0c a8      lda $a80c
$1a:cc52  e1 0b         sbc ($0b,x)
$1a:cc54  12 ab         ora ($ab)
$1a:cc56  06 ab         asl $ab
$1a:cc58  c9 ab         cmp #$ab
$1a:cc5a  0c a8 ab      tsb $aba8
$1a:cc5d  a8            tay
$1a:cc5e  ad a8 e1      lda $e1a8
$1a:cc61  09 12         ora #$12
$1a:cc63  ab            plb
$1a:cc64  06 ab         asl $ab
$1a:cc66  c9 ab         cmp #$ab
$1a:cc68  0c a8 ab      tsb $aba8
$1a:cc6b  a8            tay
$1a:cc6c  06 ad         asl $ad
$1a:cc6e  ad 0c a8      lda $a80c
$1a:cc71  e1 0b         sbc ($0b,x)
$1a:cc73  12 ab         ora ($ab)
$1a:cc75  06 ab         asl $ab
$1a:cc77  c9 ab         cmp #$ab
$1a:cc79  0c a8 ab      tsb $aba8
$1a:cc7c  a8            tay
$1a:cc7d  ad a8 e1      lda $e1a8
$1a:cc80  09 12         ora #$12
$1a:cc82  ab            plb
$1a:cc83  06 ab         asl $ab
$1a:cc85  c9 ab         cmp #$ab
$1a:cc87  0c a8 ab      tsb $aba8
$1a:cc8a  a8            tay
$1a:cc8b  06 ad         asl $ad
$1a:cc8d  ad 0c a8      lda $a80c
$1a:cc90  e1 0b         sbc ($0b,x)
$1a:cc92  12 ab         ora ($ab)
$1a:cc94  06 ab         asl $ab
$1a:cc96  c9 ab         cmp #$ab
$1a:cc98  0c a8 ab      tsb $aba8
$1a:cc9b  a8            tay
$1a:cc9c  ad a8 e1      lda $e1a8
$1a:cc9f  09 12         ora #$12
$1a:cca1  ab            plb
$1a:cca2  06 ab         asl $ab
$1a:cca4  c9 ab         cmp #$ab
$1a:cca6  0c a8 ab      tsb $aba8
$1a:cca9  a8            tay
$1a:ccaa  06 ad         asl $ad
$1a:ccac  ad 0c a8      lda $a80c
$1a:ccaf  e1 0b         sbc ($0b,x)
$1a:ccb1  12 ab         ora ($ab)
$1a:ccb3  06 ab         asl $ab
$1a:ccb5  c9 ab         cmp #$ab
$1a:ccb7  0c a8 ab      tsb $aba8
$1a:ccba  a8            tay
$1a:ccbb  ad a8 e1      lda $e1a8
$1a:ccbe  09 12         ora #$12
$1a:ccc0  ab            plb
$1a:ccc1  06 ab         asl $ab
$1a:ccc3  c9 ab         cmp #$ab
$1a:ccc5  0c a8 ab      tsb $aba8
$1a:ccc8  a8            tay
$1a:ccc9  06 ad         asl $ad
$1a:cccb  ad 0c a8      lda $a80c
$1a:ccce  e1 0b         sbc ($0b,x)
$1a:ccd0  12 ab         ora ($ab)
$1a:ccd2  06 ab         asl $ab
$1a:ccd4  c9 ab         cmp #$ab
$1a:ccd6  0c a8 ab      tsb $aba8
$1a:ccd9  a8            tay
$1a:ccda  ad a8 e1      lda $e1a8
$1a:ccdd  09 12         ora #$12
$1a:ccdf  ab            plb
$1a:cce0  06 ab         asl $ab
$1a:cce2  c9 ab         cmp #$ab
$1a:cce4  0c a8 ab      tsb $aba8
$1a:cce7  a8            tay
$1a:cce8  06 ad         asl $ad
$1a:ccea  ad 0c a8      lda $a80c
$1a:cced  e1 0b         sbc ($0b,x)
$1a:ccef  12 ab         ora ($ab)
$1a:ccf1  06 ab         asl $ab
$1a:ccf3  c9 ab         cmp #$ab
$1a:ccf5  0c a8 ab      tsb $aba8
$1a:ccf8  a8            tay
$1a:ccf9  ad a8 e1      lda $e1a8
$1a:ccfc  09 12         ora #$12
$1a:ccfe  ab            plb
$1a:ccff  06 ab         asl $ab
$1a:cd01  c9 ab         cmp #$ab
$1a:cd03  0c a8 ab      tsb $aba8
$1a:cd06  a8            tay
$1a:cd07  06 ad         asl $ad
$1a:cd09  ad 0c a8      lda $a80c
$1a:cd0c  00 ea         brk #$ea
$1a:cd0e  00 e0         brk #$e0
$1a:cd10  03 ed         ora $ed,s
$1a:cd12  9b            txy
$1a:cd13  e1 0c         sbc ($0c,x)
$1a:cd15  18            clc
$1a:cd16  5d ca 30      eor $30ca,x
$1a:cd19  c9 0c         cmp #$0c
$1a:cd1b  c9 ca         cmp #$ca
$1a:cd1d  18            clc
$1a:cd1e  ca            dex
$1a:cd1f  48            pha
$1a:cd20  c9 18         cmp #$18
$1a:cd22  ca            dex
$1a:cd23  30 c9         bmi $ccee
$1a:cd25  0c c9 ca      tsb $cac9
$1a:cd28  18            clc
$1a:cd29  ca            dex
$1a:cd2a  48            pha
$1a:cd2b  c9 18         cmp #$18
$1a:cd2d  ca            dex
$1a:cd2e  30 c9         bmi $ccf9
$1a:cd30  0c c9 ca      tsb $cac9
$1a:cd33  18            clc
$1a:cd34  ca            dex
$1a:cd35  48            pha
$1a:cd36  c9 18         cmp #$18
$1a:cd38  ca            dex
$1a:cd39  30 c9         bmi $cd04
$1a:cd3b  0c c9 ca      tsb $cac9
$1a:cd3e  18            clc
$1a:cd3f  ca            dex
$1a:cd40  48            pha
$1a:cd41  c9 18         cmp #$18
$1a:cd43  ca            dex
$1a:cd44  30 c9         bmi $cd0f
$1a:cd46  0c c9 ca      tsb $cac9
$1a:cd49  18            clc
$1a:cd4a  ca            dex
$1a:cd4b  48            pha
$1a:cd4c  c9 18         cmp #$18
$1a:cd4e  ca            dex
$1a:cd4f  30 c9         bmi $cd1a
$1a:cd51  0c c9 ca      tsb $cac9
$1a:cd54  18            clc
$1a:cd55  ca            dex
$1a:cd56  48            pha
$1a:cd57  c9 18         cmp #$18
$1a:cd59  ca            dex
$1a:cd5a  30 c9         bmi $cd25
$1a:cd5c  0c c9 ca      tsb $cac9
$1a:cd5f  18            clc
$1a:cd60  ca            dex
$1a:cd61  48            pha
$1a:cd62  c9 18         cmp #$18
$1a:cd64  ca            dex
$1a:cd65  30 c9         bmi $cd30
$1a:cd67  0c c9 ca      tsb $cac9
$1a:cd6a  18            clc
$1a:cd6b  ca            dex
$1a:cd6c  48            pha
$1a:cd6d  c9 18         cmp #$18
$1a:cd6f  ca            dex
$1a:cd70  30 c9         bmi $cd3b
$1a:cd72  0c c9 ca      tsb $cac9
$1a:cd75  18            clc
$1a:cd76  ca            dex
$1a:cd77  48            pha
$1a:cd78  c9 18         cmp #$18
$1a:cd7a  ca            dex
$1a:cd7b  30 c9         bmi $cd46
$1a:cd7d  0c c9 ca      tsb $cac9
$1a:cd80  18            clc
$1a:cd81  ca            dex
$1a:cd82  48            pha
$1a:cd83  c9 18         cmp #$18
$1a:cd85  ca            dex
$1a:cd86  30 c9         bmi $cd51
$1a:cd88  0c c9 ca      tsb $cac9
$1a:cd8b  18            clc
$1a:cd8c  ca            dex
$1a:cd8d  48            pha
$1a:cd8e  c9 18         cmp #$18
$1a:cd90  ca            dex
$1a:cd91  30 c9         bmi $cd5c
$1a:cd93  0c c9 ca      tsb $cac9
$1a:cd96  18            clc
$1a:cd97  ca            dex
$1a:cd98  48            pha
$1a:cd99  c9 00         cmp #$00
$1a:cd9b  ea            nop
$1a:cd9c  f4 e0 03      pea $03e0
$1a:cd9f  ed 50 e1      sbc $e150
$1a:cda2  08            php
$1a:cda3  3c 5d b5      bit $b55d,x
$1a:cda6  24 b9         bit $b9
$1a:cda8  0c b7 48      tsb $48b7
$1a:cdab  7d c8 0c      adc $0cc8,x
$1a:cdae  5d b7 b5      eor $b5b7,x
$1a:cdb1  06 b4         asl $b4
$1a:cdb3  06 5b         asl $5b
$1a:cdb5  b5 06         lda $06,x
$1a:cdb7  5d b4 06      eor $06b4,x
$1a:cdba  59 b2 30      eor $30b2,y
$1a:cdbd  7d c8 0c      adc $0cc8,x
$1a:cdc0  5d b0 b2      eor $b2b0,x
$1a:cdc3  48            pha
$1a:cdc4  78            sei
$1a:cdc5  c8            iny
$1a:cdc6  18            clc
$1a:cdc7  c9 30         cmp #$30
$1a:cdc9  5d b5 24      eor $24b5,x
$1a:cdcc  b9 0c b7      lda $b70c,y
$1a:cdcf  48            pha
$1a:cdd0  7d c8 0c      adc $0cc8,x
$1a:cdd3  5d b7 b5      eor $b5b7,x
$1a:cdd6  06 b4         asl $b4
$1a:cdd8  06 5b         asl $5b
$1a:cdda  b5 06         lda $06,x
$1a:cddc  5d b4 06      eor $06b4,x
$1a:cddf  59 b2 30      eor $30b2,y
$1a:cde2  7d c8 0c      adc $0cc8,x
$1a:cde5  5d b0 b2      eor $b2b0,x
$1a:cde8  48            pha
$1a:cde9  78            sei
$1a:cdea  c8            iny
$1a:cdeb  18            clc
$1a:cdec  c9 10         cmp #$10
$1a:cdee  c9 10         cmp #$10
$1a:cdf0  5d b9 b7      eor $b7b9,x
$1a:cdf3  b5 b4         lda $b4,x
$1a:cdf5  b5 b7         lda $b7,x
$1a:cdf7  b5 b4         lda $b4,x
$1a:cdf9  30 b2         bmi $cdad
$1a:cdfb  10 c9         bpl $cdc6
$1a:cdfd  b9 b7 b5      lda $b5b7,y
$1a:ce00  b4 b5         ldy $b5,x
$1a:ce02  b7 b5         lda [$b5],y
$1a:ce04  b4 30         ldy $30,x
$1a:ce06  b2 0c         lda ($0c)
$1a:ce08  c9 a9         cmp #$a9
$1a:ce0a  3c 7d c8      bit $c87d,x
$1a:ce0d  0c 5d a6      tsb $a65d
$1a:ce10  0c 7d c8      tsb $c87d
$1a:ce13  0c 5d a4      tsb $a45d
$1a:ce16  30 a6         bmi $cdbe
$1a:ce18  18            clc
$1a:ce19  c9 c9         cmp #$c9
$1a:ce1b  30 a9         bmi $cdc6
$1a:ce1d  0c 7d c8      tsb $c87d
$1a:ce20  0c 5d a6      tsb $a65d
$1a:ce23  0c 7d c8      tsb $c87d
$1a:ce26  0c 5d a4      tsb $a45d
$1a:ce29  18            clc
$1a:ce2a  a6 30         ldx $30
$1a:ce2c  c9 10         cmp #$10
$1a:ce2e  be be be      ldx $bebe,y
$1a:ce31  18            clc
$1a:ce32  c8            iny
$1a:ce33  bc b9 bc      ldy $bcb9,x
$1a:ce36  30 be         bmi $cdf6
$1a:ce38  10 be         bpl $cdf8
$1a:ce3a  be be 18      ldx $18be,y
$1a:ce3d  c8            iny
$1a:ce3e  bc b9 bc      ldy $bcb9,x
$1a:ce41  30 b9         bmi $cdfc
$1a:ce43  10 be         bpl $ce03
$1a:ce45  be be 18      ldx $18be,y
$1a:ce48  c8            iny
$1a:ce49  bc b9 bc      ldy $bcb9,x
$1a:ce4c  30 be         bmi $ce0c
$1a:ce4e  10 be         bpl $ce0e
$1a:ce50  be be 18      ldx $18be,y
$1a:ce53  c8            iny
$1a:ce54  bc b9 18      ldy $18b9,x
$1a:ce57  59 c1 24      eor $24c1,y
$1a:ce5a  be 00 ea      ldx $ea00,y
$1a:ce5d  f4 e0 01      pea $01e0
$1a:ce60  ed 3e e1      sbc $e13e
$1a:ce63  07 06         ora [$06]
$1a:ce65  c9 30         cmp #$30
$1a:ce67  5d b5 24      eor $24b5,x
$1a:ce6a  b9 0c b7      lda $b70c,y
$1a:ce6d  48            pha
$1a:ce6e  7d c8 0c      adc $0cc8,x
$1a:ce71  5d b7 b5      eor $b5b7,x
$1a:ce74  06 b4         asl $b4
$1a:ce76  06 5b         asl $5b
$1a:ce78  b5 06         lda $06,x
$1a:ce7a  5d b4 06      eor $06b4,x
$1a:ce7d  59 b2 30      eor $30b2,y
$1a:ce80  7d c8 0c      adc $0cc8,x
$1a:ce83  5d b0 b2      eor $b2b0,x
$1a:ce86  48            pha
$1a:ce87  78            sei
$1a:ce88  c8            iny
$1a:ce89  18            clc
$1a:ce8a  c9 30         cmp #$30
$1a:ce8c  5d b5 24      eor $24b5,x
$1a:ce8f  b9 0c b7      lda $b70c,y
$1a:ce92  48            pha
$1a:ce93  7d c8 0c      adc $0cc8,x
$1a:ce96  5d b7 b5      eor $b5b7,x
$1a:ce99  06 b4         asl $b4
$1a:ce9b  06 5b         asl $5b
$1a:ce9d  b5 06         lda $06,x
$1a:ce9f  5d b4 06      eor $06b4,x
$1a:cea2  59 b2 30      eor $30b2,y
$1a:cea5  7d c8 0c      adc $0cc8,x
$1a:cea8  5d b0 b2      eor $b2b0,x
$1a:ceab  48            pha
$1a:ceac  78            sei
$1a:cead  c8            iny
$1a:ceae  18            clc
$1a:ceaf  c9 10         cmp #$10
$1a:ceb1  c9 10         cmp #$10
$1a:ceb3  5d b9 b7      eor $b7b9,x
$1a:ceb6  b5 b4         lda $b4,x
$1a:ceb8  b5 b7         lda $b7,x
$1a:ceba  b5 b4         lda $b4,x
$1a:cebc  30 b2         bmi $ce70
$1a:cebe  10 c9         bpl $ce89
$1a:cec0  b9 b7 b5      lda $b5b7,y
$1a:cec3  b4 b5         ldy $b5,x
$1a:cec5  b7 b5         lda [$b5],y
$1a:cec7  b4 30         ldy $30,x
$1a:cec9  b2 0c         lda ($0c)
$1a:cecb  c9 a9         cmp #$a9
$1a:cecd  3c 7d c8      bit $c87d,x
$1a:ced0  0c 5d a6      tsb $a65d
$1a:ced3  0c 7d c8      tsb $c87d
$1a:ced6  0c 5d a4      tsb $a45d
$1a:ced9  30 a6         bmi $ce81
$1a:cedb  18            clc
$1a:cedc  c9 c9         cmp #$c9
$1a:cede  30 a9         bmi $ce89
$1a:cee0  0c 7d c8      tsb $c87d
$1a:cee3  0c 5d a6      tsb $a65d
$1a:cee6  0c 7d c8      tsb $c87d
$1a:cee9  0c 5d a4      tsb $a45d
$1a:ceec  18            clc
$1a:ceed  a6 2a         ldx $2a
$1a:ceef  c9 ea         cmp #$ea
$1a:cef1  00 e1         brk #$e1
$1a:cef3  0a            asl a
$1a:cef4  e0 04         cpx #$04
$1a:cef6  ed 55 e3      sbc $e355
$1a:cef9  0c 0c 0c      tsb $0c0c
$1a:cefc  60            rts
$1a:cefd  7d a6 30      adc $30a6,x
$1a:cf00  a4 30         ldy $30
$1a:cf02  79 a6 60      adc $60a6,y
$1a:cf05  7d a6 30      adc $30a6,x
$1a:cf08  c8            iny
$1a:cf09  a8            tay
$1a:cf0a  60            rts
$1a:cf0b  a6 30         ldx $30
$1a:cf0d  a4 30         ldy $30
$1a:cf0f  79 a6 60      adc $60a6,y
$1a:cf12  7d a6 30      adc $30a6,x
$1a:cf15  a8            tay
$1a:cf16  30 7b         bmi $cf93
$1a:cf18  a6 00         ldx $00
$1a:cf1a  00 18         brk #$18
$1a:cf1c  00 34         brk #$34
$1a:cf1e  2c 53 73      bit $7353
$1a:cf21  89 73         bit #$73
$1a:cf23  a4 73         ldy $73
$1a:cf25  08            php
$1a:cf26  76 51         ror $51,x
$1a:cf28  78            sei
$1a:cf29  51 78         eor ($78),y
$1a:cf2b  89 85         bit #$85
$1a:cf2d  ad 85 c8      lda $c885
$1a:cf30  85 e3         sta $e3
$1a:cf32  85 dc         sta $dc
$1a:cf34  9b            txy
$1a:cf35  dc 9b 02      jml [$029b]
$1a:cf38  00 fd         brk #$fd
$1a:cf3a  0f 41 a0 00   ora $00a041
$1a:cf3e  00 06         brk #$06
$1a:cf40  14 1e         trb $1e
$1a:cf42  09 0e         ora #$0e
$1a:cf44  1f 18 29 0e   ora $0e2918,x
$1a:cf48  85 4e         sta $4e
$1a:cf4a  22 93 88 f4   jsl $f48893
$1a:cf4e  e2 51         sep #$51
$1a:cf50  38            sec
$1a:cf51  b5 4e         lda $4e,x
$1a:cf53  21 f0         and ($f0,x)
$1a:cf55  07 d1         ora [$d1]
$1a:cf57  6f 27 1f ff   adc $ff1f27
$1a:cf5b  fb            xce
$1a:cf5c  e5 35         sbc $35
$1a:cf5e  53 90         eor ($90,s),y
$1a:cf60  0b            phd
$1a:cf61  46 a7         lsr $a7
$1a:cf63  40            rti
$1a:cf64  10 81         bpl $cee7
$1a:cf66  be 8e a5      ldx $a58e,y
$1a:cf69  3a            dec a
$1a:cf6a  0b            phd
$1a:cf6b  a5 3a         lda $3a
$1a:cf6d  76 17         ror $17,x
$1a:cf6f  4a            lsr a
$1a:cf70  c4 f0         cpy $f0
$1a:cf72  2e 97 09      rol $0997
$1a:cf75  e8            inx
$1a:cf76  5d 31 13      eor $1331,x
$1a:cf79  e0 ba         cpx #$ba
$1a:cf7b  66 67         ror $67
$1a:cf7d  e1 74         sbc ($74,x)
$1a:cf7f  ca            dex
$1a:cf80  d0 22         bne $cfa4
$1a:cf82  4f a7 89 81   eor $8189a7
$1a:cf86  14 2e         trb $2e
$1a:cf88  98            tya
$1a:cf89  aa            tax
$1a:cf8a  08            php
$1a:cf8b  5d 21 f4      eor $f421,x
$1a:cf8e  20 ba 6a      jsr $6aba
$1a:cf91  68            pla
$1a:cf92  50 17         bvc $cfab
$1a:cf94  d1 cf         cmp ($cf),y
$1a:cf96  28            plp
$1a:cf97  67 94         adc [$94]
$1a:cf99  d9 a0 16      cmp $16a0,y
$1a:cf9c  55 44         eor $44,x
$1a:cf9e  3c a6 86      bit $86a6,x
$1a:cfa1  89 02         bit #$02
$1a:cfa3  7d 1c b6      adc $b61c,x
$1a:cfa6  8a            txa
$1a:cfa7  17 4d         ora [$4d],y
$1a:cfa9  5d 14 02      eor $0214,x
$1a:cfac  18            clc
$1a:cfad  07 d0         ora [$d0]
$1a:cfaf  c4 15         cpy $15
$1a:cfb1  86 af         stx $af
$1a:cfb3  09 03         ora #$03
$1a:cfb5  e8            inx
$1a:cfb6  6f 10 08 44   adc $440810
$1a:cfba  01 32         ora ($32,x)
$1a:cfbc  10 8b         bpl $cf49
$1a:cfbe  82 f0 20      brl $f0b1
$1a:cfc1  29 90         and #$90
$1a:cfc3  88            dey
$1a:cfc4  5a            phy
$1a:cfc5  17 81         ora [$81],y
$1a:cfc7  02 4c         cop #$4c
$1a:cfc9  84 62         sty $62
$1a:cfcb  c0 bc         cpy #$bc
$1a:cfcd  08            php
$1a:cfce  1a            inc a
$1a:cfcf  64 24         stz $24
$1a:cfd1  15 85         ora $85,x
$1a:cfd3  e0 41         cpx #$41
$1a:cfd5  13 21         ora ($21,s),y
$1a:cfd7  28            plp
$1a:cfd8  a8            tay
$1a:cfd9  2f 02 0a 99   and $990a02
$1a:cfdd  09 85         ora #$85
$1a:cfdf  21 78         and ($78,x)
$1a:cfe1  10 64         bpl $d047
$1a:cfe3  c8            iny
$1a:cfe4  4e 28 0b      lsr $0b28
$1a:cfe7  c0 83         cpy #$83
$1a:cfe9  a6 42         ldx $42
$1a:cfeb  81 38         sta ($38,x)
$1a:cfed  5e 03 2c      lsr $2c03,x
$1a:cff0  20 14 89      jsr $8914
$1a:cff3  82 f0 21      brl $f1e6
$1a:cff6  29 90         and #$90
$1a:cff8  a8            tay
$1a:cff9  4a            lsr a
$1a:cffa  17 81         ora [$81],y
$1a:cffc  0a            asl a
$1a:cffd  4c 85 61      jmp $6185
$1a:d000  6e 10 88      ror $8810
$1a:d003  5a            phy
$1a:d004  64 2c         stz $2c
$1a:d006  11 85         ora ($85),y
$1a:d008  e0 43         cpx #$43
$1a:d00a  13 21         ora ($21,s),y
$1a:d00c  68            pla
$1a:d00d  57 84         eor [$84],y
$1a:d00f  22 1a 99 0b   jsl $0b991a
$1a:d013  82 f4 21      brl $f20a
$1a:d016  10 e4         bpl $cffc
$1a:d018  c8            iny
$1a:d019  de 17 a1      dec $a117,x
$1a:d01c  10 82         bpl $cfa0
$1a:d01e  30 05         bmi $d025
$1a:d020  7a            ply
$1a:d021  11 11         ora ($11),y
$1a:d023  40            rti
$1a:d024  32 01         and ($01)
$1a:d026  7a            ply
$1a:d027  11 21         ora ($21),y
$1a:d029  40            rti
$1a:d02a  33 c1         and ($c1,s),y
$1a:d02c  7a            ply
$1a:d02d  11 31         ora ($31),y
$1a:d02f  40            rti
$1a:d030  35 81         and $81,x
$1a:d032  7a            ply
$1a:d033  11 41         ora ($41),y
$1a:d035  40            rti
$1a:d036  37 41         and [$41],y
$1a:d038  7a            ply
$1a:d039  11 51         ora ($51),y
$1a:d03b  40            rti
$1a:d03c  39 01 7a      and $7a01,y
$1a:d03f  11 61         ora ($61),y
$1a:d041  40            rti
$1a:d042  3a            dec a
$1a:d043  c1 7a         cmp ($7a,x)
$1a:d045  11 71         ora ($71),y
$1a:d047  40            rti
$1a:d048  3c 81 7a      bit $7a81,x
$1a:d04b  11 81         ora ($81),y
$1a:d04d  40            rti
$1a:d04e  3e 41 7a      rol $7a41,x
$1a:d051  11 91         ora ($91),y
$1a:d053  40            rti
$1a:d054  00 01         brk #$01
$1a:d056  7a            ply
$1a:d057  11 a1         ora ($a1),y
$1a:d059  40            rti
$1a:d05a  01 c1         ora ($c1,x)
$1a:d05c  7a            ply
$1a:d05d  11 b1         ora ($b1),y
$1a:d05f  40            rti
$1a:d060  03 81         ora $81,s
$1a:d062  7a            ply
$1a:d063  11 c1         ora ($c1),y
$1a:d065  40            rti
$1a:d066  05 41         ora $41
$1a:d068  7a            ply
$1a:d069  11 d1         ora ($d1),y
$1a:d06b  40            rti
$1a:d06c  07 01         ora [$01]
$1a:d06e  7a            ply
$1a:d06f  11 e1         ora ($e1),y
$1a:d071  40            rti
$1a:d072  2e c0 52      rol $52c0
$1a:d075  10 f5         bpl $d06c
$1a:d077  f8            sed
$1a:d078  2e ca 3e      rol $3eca
$1a:d07b  28            plp
$1a:d07c  07 c0         ora [$c0]
$1a:d07e  2d 85 66      and $6685
$1a:d081  49 f0         eor #$f0
$1a:d083  87 2e         sta [$2e]
$1a:d085  06 81         asl $81
$1a:d087  10 8c         bpl $d015
$1a:d089  50 17         bvc $d0a2
$1a:d08b  e3 38         sbc $38,s
$1a:d08d  55 05         eor $05,x
$1a:d08f  05 8c         ora $8c
$1a:d091  33 05         and ($05,s),y
$1a:d093  50 50         bvc $d0e5
$1a:d095  84 23         sty $23
$1a:d097  40            rti
$1a:d098  8c 44 2a      sty $2a44
$1a:d09b  02 81         cop #$81
$1a:d09d  9c 2f c2      stz $c22f
$1a:d0a0  a2 2f         ldx #$2f
$1a:d0a2  19 82 fc      ora $fc82,y
$1a:d0a5  2a            rol a
$1a:d0a6  50 48         bvc $d0f0
$1a:d0a8  0c 42 50      tsb $5042
$1a:d0ab  08            php
$1a:d0ac  09 03         ora #$03
$1a:d0ae  40            rti
$1a:d0af  93 81         sta ($81,s),y
$1a:d0b1  22 48 84 62   jsl $628448
$1a:d0b5  50 aa         bvc $d061
$1a:d0b7  0a            asl a
$1a:d0b8  1b            tcs
$1a:d0b9  78            sei
$1a:d0ba  97 e1         sta [$e1],y
$1a:d0bc  53 68         eor ($68,s),y
$1a:d0be  04 81         tsb $81
$1a:d0c0  7e 11 0a      ror $0a11,x
$1a:d0c3  24 1a         bit $1a
$1a:d0c5  02 63         cop #$63
$1a:d0c7  07 80         ora [$80]
$1a:d0c9  51 a0         eor ($a0),y
$1a:d0cb  cb            wai
$1a:d0cc  d0 4f         bne $d11d
$1a:d0ce  04 62         tsb $62
$1a:d0d0  90 fa         bcc $d0cc
$1a:d0d2  25 f8         and $f8
$1a:d0d4  56 1f         lsr $1f,x
$1a:d0d6  40            rti
$1a:d0d7  76 04         ror $04,x
$1a:d0d9  f0 a3         beq $d07e
$1a:d0db  45 28         eor $28
$1a:d0dd  2f a0 80 9a   and $9a80a0
$1a:d0e1  01 1a         ora ($1a,x)
$1a:d0e3  12 48         ora ($48)
$1a:d0e5  43 44         eor $44,s
$1a:d0e7  1f 81 00 93   ora $930081,x
$1a:d0eb  07 42         ora [$42]
$1a:d0ed  41 30         eor ($30,x)
$1a:d0ef  46 81         lsr $81
$1a:d0f1  a8            tay
$1a:d0f2  1e 80 9d      asl $9d80,x
$1a:d0f5  08            php
$1a:d0f6  04 a8         tsb $a8
$1a:d0f8  3a            dec a
$1a:d0f9  0a            asl a
$1a:d0fa  90 46         bcc $d142
$1a:d0fc  84 b0         sty $b0
$1a:d0fe  3a            dec a
$1a:d0ff  01 91         ora ($91,x)
$1a:d101  80 4b         bra $d14e
$1a:d103  a1 18         lda ($18,x)
$1a:d105  05 30         ora $30
$1a:d107  83 5a         sta $5a,s
$1a:d109  44 a6 1b      mvp $1b,$a6
$1a:d10c  c2 54         rep #$54
$1a:d10e  22 0c 21 42   jsl $42210c
$1a:d112  84 02         sty $02
$1a:d114  22 c9 1b 42   jsl $421bc9
$1a:d118  54 22 48      mvn $48,$22
$1a:d11b  a0 8c 58      ldy #$588c
$1a:d11e  12 a1         ora ($a1)
$1a:d120  13 45         ora ($45,s),y
$1a:d122  04 82         tsb $82
$1a:d124  b0 95         bcs $d0bb
$1a:d126  08            php
$1a:d127  a2 28 25      ldx #$2528
$1a:d12a  15 04         ora $04,x
$1a:d12c  a8            tay
$1a:d12d  45 51         eor $51
$1a:d12f  41 30         eor ($30,x)
$1a:d131  a4 25         ldy $25
$1a:d133  42 2c         wdm #$2c
$1a:d135  78            sei
$1a:d136  09 c5         ora #$c5
$1a:d138  01 2a         ora ($2a,x)
$1a:d13a  11 73         ora ($73),y
$1a:d13c  c0 50 27      cpy #$2750
$1a:d13f  08            php
$1a:d140  30 8c         bmi $d0ce
$1a:d142  1e 02 90      asl $9002,x
$1a:d145  f5 08         sbc $08,x
$1a:d147  04 64         tsb $64
$1a:d149  f0 15         beq $d160
$1a:d14b  01 50         ora ($50,x)
$1a:d14d  40            rti
$1a:d14e  23 47         and $47,s
$1a:d150  80 ac         bra $d0fe
$1a:d152  48            pha
$1a:d153  10 61         bpl $d1b6
$1a:d155  1b            tcs
$1a:d156  3c 05 82      bit $8205,x
$1a:d159  30 83         bmi $d0de
$1a:d15b  08            php
$1a:d15c  e1 e0         sbc ($e0,x)
$1a:d15e  2d 11 04      and $0411
$1a:d161  18            clc
$1a:d162  47 4f         eor [$4f]
$1a:d164  00 58         brk #$58
$1a:d166  04 18         tsb $18
$1a:d168  47 8f         eor [$8f]
$1a:d16a  01 78         ora ($78,x)
$1a:d16c  25 0c         and $0c
$1a:d16e  7c f0 0b      jmp ($0bf0,x)
$1a:d171  82 b0 3e      brl $1024
$1a:d174  80 ae         bra $d124
$1a:d176  04 a0         tsb $a0
$1a:d178  b0 be         bcs $d138
$1a:d17a  80 bc         bra $d138
$1a:d17c  04 a0         tsb $a0
$1a:d17e  b1 3e         lda ($3e),y
$1a:d180  80 ca         bra $d14c
$1a:d182  04 a0         tsb $a0
$1a:d184  b1 b3         lda ($b3),y
$1a:d186  12 05         ora ($05)
$1a:d188  02 6a         cop #$6a
$1a:d18a  1c 0d c2      trb $c20d
$1a:d18d  06 c0         asl $c0
$1a:d18f  25 04         and $04
$1a:d191  11 c2         ora ($c2),y
$1a:d193  07 30         ora [$30]
$1a:d195  25 04         and $04
$1a:d197  15 c2         ora $c2,x
$1a:d199  07 a0         ora [$a0]
$1a:d19b  25 04         and $04
$1a:d19d  19 c2 08      ora $08c2,y
$1a:d1a0  10 25         bpl $d1c7
$1a:d1a2  04 1d         tsb $1d
$1a:d1a4  c2 08         rep #$08
$1a:d1a6  80 25         bra $d1cd
$1a:d1a8  03 7c         ora $7c,s
$1a:d1aa  11 c2         ora ($c2),y
$1a:d1ac  4a            lsr a
$1a:d1ad  08            php
$1a:d1ae  4b            phk
$1a:d1af  84 12         sty $12
$1a:d1b1  c0 4a 08      cpy #$084a
$1a:d1b4  53 84         eor ($84,s),y
$1a:d1b6  13 a0         ora ($a0,s),y
$1a:d1b8  4a            lsr a
$1a:d1b9  08            php
$1a:d1ba  5b            tcd
$1a:d1bb  84 14         sty $14
$1a:d1bd  80 4a         bra $d209
$1a:d1bf  08            php
$1a:d1c0  63 84         adc $84,s
$1a:d1c2  15 60         ora $60,x
$1a:d1c4  4a            lsr a
$1a:d1c5  08            php
$1a:d1c6  6b            rtl
$1a:d1c7  84 0b         sty $0b
$1a:d1c9  03 08         ora $08,s
$1a:d1cb  87 38         sta [$38]
$1a:d1cd  41 72         eor ($72,x)
$1a:d1cf  04 a0         tsb $a0
$1a:d1d1  87 c0         sta [$c0]
$1a:d1d3  b0 04         bcs $d1d9
$1a:d1d5  f0 29         beq $d200
$1a:d1d7  80 f8         bra $d1d1
$1a:d1d9  46 23         lsr $23
$1a:d1db  00 92         brk #$92
$1a:d1dd  0f 86 f0 83   ora $83f086
$1a:d1e1  08            php
$1a:d1e2  82 dc 18      brl $eac1
$1a:d1e5  e0 83 08      cpx #$0883
$1a:d1e8  8a            txa
$1a:d1e9  dc 19 c0      jml [$c019]
$1a:d1ec  83 08         sta $08,s
$1a:d1ee  92 dc         sta ($dc)
$1a:d1f0  1a            inc a
$1a:d1f1  a0 83 08      ldy #$0883
$1a:d1f4  9a            txs
$1a:d1f5  dc 1d 40      jml [$401d]
$1a:d1f8  83 08         sta $08,s
$1a:d1fa  a2 dc 1e      ldx #$1edc
$1a:d1fd  20 83 08      jsr $0883
$1a:d200  aa            tax
$1a:d201  dc 1f 00      jml [$001f]
$1a:d204  71 08         adc ($08),y
$1a:d206  b2 dc         lda ($dc)
$1a:d208  1f e0 71 08   ora $0871e0,x
$1a:d20c  ba            tsx
$1a:d20d  dc 00 c0      jml [$c000]
$1a:d210  71 08         adc ($08),y
$1a:d212  c2 dc         rep #$dc
$1a:d214  01 a0         ora ($a0,x)
$1a:d216  71 08         adc ($08),y
$1a:d218  ca            dex
$1a:d219  dc 02 80      jml [$8002]
$1a:d21c  71 08         adc ($08),y
$1a:d21e  d2 dc         cmp ($dc)
$1a:d220  03 60         ora $60,s
$1a:d222  71 08         adc ($08),y
$1a:d224  da            phx
$1a:d225  dc 04 40      jml [$4004]
$1a:d228  71 08         adc ($08),y
$1a:d22a  e2 dc         sep #$dc
$1a:d22c  05 20         ora $20
$1a:d22e  71 08         adc ($08),y
$1a:d230  ea            nop
$1a:d231  94 06         sty $06,x
$1a:d233  00 71         brk #$71
$1a:d235  08            php
$1a:d236  f2 94         sbc ($94)
$1a:d238  06 e0         asl $e0
$1a:d23a  71 08         adc ($08),y
$1a:d23c  f9 44 88      sbc $8844,y
$1a:d23f  81 71         sta ($71,x)
$1a:d241  6d 25 c9      adc $c925
$1a:d244  82 0e 32      brl $0455
$1a:d247  b9 b0 41      lda $41b0,y
$1a:d24a  d4 57         pei ($57)
$1a:d24c  46 08         lsr $08
$1a:d24e  3c 4a ea      bit $ea4a,x
$1a:d251  c1 05         cmp ($05,x)
$1a:d253  a1 c0         lda ($c0,x)
$1a:d255  97 67         sta [$67],y
$1a:d257  01 72         ora ($72,x)
$1a:d259  03 28         ora $28,s
$1a:d25b  a0 6e         ldy #$6e
$1a:d25d  40            rti
$1a:d25e  68            pla
$1a:d25f  94 11         sty $11,x
$1a:d261  c8            iny
$1a:d262  0d 82 82      ora $8282
$1a:d265  b9 00 ec      lda $ec00,y
$1a:d268  04 40         tsb $40
$1a:d26a  83 39         sta $39,s
$1a:d26c  00 fa         brk #$fa
$1a:d26e  04 40         tsb $40
$1a:d270  83 b9         sta $b9,s
$1a:d272  01 08         ora ($08,x)
$1a:d274  04 40         tsb $40
$1a:d276  84 39         sty $39
$1a:d278  01 16         ora ($16,x)
$1a:d27a  04 40         tsb $40
$1a:d27c  84 b9         sty $b9
$1a:d27e  01 24         ora ($24,x)
$1a:d280  04 40         tsb $40
$1a:d282  85 39         sta $39
$1a:d284  01 32         ora ($32,x)
$1a:d286  04 40         tsb $40
$1a:d288  85 b9         sta $b9
$1a:d28a  01 40         ora ($40,x)
$1a:d28c  04 40         tsb $40
$1a:d28e  86 39         stx $39
$1a:d290  01 4e         ora ($4e,x)
$1a:d292  0d a0 86      ora $86a0
$1a:d295  b9 00 a8      lda $a800,y
$1a:d298  30 88         bmi $d222
$1a:d29a  73 90         adc ($90,s),y
$1a:d29c  16 a0         asl $a0,x
$1a:d29e  da            phx
$1a:d29f  08            php
$1a:d2a0  7c 0b 00      jmp ($000b,x)
$1a:d2a3  de 06 10      dec $1006,x
$1a:d2a6  12 04         ora ($04)
$1a:d2a8  76 30         ror $30,x
$1a:d2aa  09 31         ora #$31
$1a:d2ac  20 6f 07      jsr $076f
$1a:d2af  10 88         bpl $d239
$1a:d2b1  2e 88 e2      rol $e288
$1a:d2b4  11 15         ora ($15),y
$1a:d2b6  28            plp
$1a:d2b7  30 c0         bmi $d279
$1a:d2b9  be 11 25      ldx $2511,y
$1a:d2bc  28            plp
$1a:d2bd  32 80         and ($80)
$1a:d2bf  be 11 35      ldx $3511,y
$1a:d2c2  28            plp
$1a:d2c3  34 40         bit $40,x
$1a:d2c5  be 11 45      ldx $4511,y
$1a:d2c8  28            plp
$1a:d2c9  36 00         rol $00,x
$1a:d2cb  be 11 55      ldx $5511,y
$1a:d2ce  28            plp
$1a:d2cf  00 80         brk #$80
$1a:d2d1  be 11 65      ldx $6511,y
$1a:d2d4  28            plp
$1a:d2d5  02 40         cop #$40
$1a:d2d7  be 11 75      ldx $7511,y
$1a:d2da  28            plp
$1a:d2db  04 00         tsb $00
$1a:d2dd  be 11 85      ldx $8511,y
$1a:d2e0  28            plp
$1a:d2e1  05 c0         ora $c0
$1a:d2e3  be 11 94      ldx $9411,y
$1a:d2e6  98            tya
$1a:d2e7  07 80         ora [$80]
$1a:d2e9  be 11 a4      ldx $a411,y
$1a:d2ec  98            tya
$1a:d2ed  09 40         ora #$40
$1a:d2ef  be 11 b4      ldx $b411,y
$1a:d2f2  98            tya
$1a:d2f3  0b            phd
$1a:d2f4  00 be         brk #$be
$1a:d2f6  11 c4         ora ($c4),y
$1a:d2f8  98            tya
$1a:d2f9  0c c0 be      tsb $bec0
$1a:d2fc  11 d4         ora ($d4),y
$1a:d2fe  98            tya
$1a:d2ff  0e 80 be      asl $be80
$1a:d302  11 e4         ora ($e4),y
$1a:d304  98            tya
$1a:d305  38            sec
$1a:d306  0a            asl a
$1a:d307  3e 5b 26      rol $265b,x
$1a:d30a  d0 60         bne $d36c
$1a:d30c  5b            tcd
$1a:d30d  a0 64         ldy #$64
$1a:d30f  02 e0         cop #$e0
$1a:d311  60            rts
$1a:d312  99 60 ed      sta $ed60,y
$1a:d315  2c 1b 2c      bit $2c1b
$1a:d318  1e 85 84      asl $8485,x
$1a:d31b  65 83         adc $83
$1a:d31d  ec b0 ac      cpx $acb0
$1a:d320  b0 01         bcs $d323
$1a:d322  16 19         asl $19,x
$1a:d324  96 00         stx $00,y
$1a:d326  92 c3         sta ($c3)
$1a:d328  b2 c1         lda ($c1)
$1a:d32a  7c 70 26      jmp ($2670,x)
$1a:d32d  29 c0         and #$c0
$1a:d32f  5f 80 cd 28   eor $28cd80,x
$1a:d333  13 f0         ora ($f0,s),y
$1a:d335  1b            tcs
$1a:d336  65 04         adc $04
$1a:d338  7e 03 88      ror $8803,x
$1a:d33b  a0 af         ldy #$af
$1a:d33d  c0 74         cpy #$74
$1a:d33f  94 19         sty $19,x
$1a:d341  f8            sed
$1a:d342  0f 02 83 bf   ora $bf8302
$1a:d346  01 1c         ora ($1c,x)
$1a:d348  05 c0         ora $c0
$1a:d34a  04 02         tsb $02
$1a:d34c  50 4b         bvc $d399
$1a:d34e  81 09         sta ($09,x)
$1a:d350  7e 02 70      ror $7002,x
$1a:d353  0b            phd
$1a:d354  81 0a         sta ($0a,x)
$1a:d356  81 28         sta ($28,x)
$1a:d358  84 b8         sty $b8
$1a:d35a  10 b1         bpl $d30d
$1a:d35c  d8            cld
$1a:d35d  2a            rol a
$1a:d35e  80 b8         bra $d318
$1a:d360  10 c1         bpl $d323
$1a:d362  d8            cld
$1a:d363  2c 41 fa      bit $fa41
$1a:d366  10 d1         bpl $d339
$1a:d368  d8            cld
$1a:d369  2e 01 fa      rol $fa01
$1a:d36c  10 e1         bpl $d34f
$1a:d36e  d8            cld
$1a:d36f  2f c1 fa 10   and $10fac1
$1a:d373  f8            sed
$1a:d374  16 01         asl $01,x
$1a:d376  ec 00 40      cpx $4000
$1a:d379  30 09         bmi $d384
$1a:d37b  4c 60 12      jmp $1260
$1a:d37e  63 00         adc $00,s
$1a:d380  de 1f 41      dec $411f,x
$1a:d383  10 62         bpl $d3e7
$1a:d385  13 e8         ora ($e8,s),y
$1a:d387  22 29 30 02   jsl $023029
$1a:d38b  83 e8         sta $e8,s
$1a:d38d  22 49 30 6a   jsl $6a3049
$1a:d391  03 e8         ora $e8,s
$1a:d393  22 68 10 06   jsl $061068
$1a:d397  03 e8         ora $e8,s
$1a:d399  22 88 10 09   jsl $091088
$1a:d39d  83 e8         sta $e8,s
$1a:d39f  22 a8 10 0d   jsl $0d10a8
$1a:d3a3  03 e8         ora $e8,s
$1a:d3a5  22 c8 10 10   jsl $1010c8
$1a:d3a9  83 e8         sta $e8,s
$1a:d3ab  22 e8 10 14   jsl $1410e8
$1a:d3af  03 e8         ora $e8,s
$1a:d3b1  23 08         and $08,s
$1a:d3b3  10 17         bpl $d3cc
$1a:d3b5  83 e8         sta $e8,s
$1a:d3b7  23 28         and $28,s
$1a:d3b9  10 1b         bpl $d3d6
$1a:d3bb  03 e8         ora $e8,s
$1a:d3bd  23 48         and $48,s
$1a:d3bf  10 1e         bpl $d3df
$1a:d3c1  83 e8         sta $e8,s
$1a:d3c3  23 68         and $68,s
$1a:d3c5  10 22         bpl $d3e9
$1a:d3c7  03 e8         ora $e8,s
$1a:d3c9  23 88         and $88,s
$1a:d3cb  10 25         bpl $d3f2
$1a:d3cd  83 e8         sta $e8,s
$1a:d3cf  23 a8         and $a8,s
$1a:d3d1  10 3b         bpl $d40e
$1a:d3d3  03 e8         ora $e8,s
$1a:d3d5  23 c8         and $c8,s
$1a:d3d7  10 7c         bpl $d455
$1a:d3d9  14 7d         trb $7d
$1a:d3db  02 4f         cop #$4f
$1a:d3dd  d0 c9         bne $d3a8
$1a:d3df  bd 40 18      lda $1840,x
$1a:d3e2  59 47 18      eor $1847,y
$1a:d3e5  04 cb         tsb $cb
$1a:d3e7  2a            rol a
$1a:d3e8  e3 00         sbc $00,s
$1a:d3ea  d1 65         cmp ($65),y
$1a:d3ec  9c 60 21      stz $2160
$1a:d3ef  2c bb 8c      bit $8cbb
$1a:d3f2  05 05         ora $05
$1a:d3f4  98            tya
$1a:d3f5  71 80         adc ($80),y
$1a:d3f7  bc b3 2e      ldy $2eb3,x
$1a:d3fa  30 1b         bmi $d417
$1a:d3fc  16 69         asl $69,x
$1a:d3fe  c6 0d         dec $0d
$1a:d400  63 2b         adc $2b,s
$1a:d402  81 d4         sta ($d4,x)
$1a:d404  0b            phd
$1a:d405  61 01         adc ($01,x)
$1a:d407  2b            pld
$1a:d408  81 f0         sta ($f0,x)
$1a:d40a  0b            phd
$1a:d40b  61 02         adc ($02,x)
$1a:d40d  2b            pld
$1a:d40e  83 78         sta $78,s
$1a:d410  a0 65         ldy #$65
$1a:d412  70 79         bvs $d48d
$1a:d414  94 18         sty $18,x
$1a:d416  ae 0f a2      ldx $a20f
$1a:d419  83 95         sta $95,s
$1a:d41b  c0 02         cpy #$02
$1a:d41d  42 70         wdm #$70
$1a:d41f  03 9c         ora $9c,s
$1a:d421  24 8a         bit $8a
$1a:d423  00 f2         brk #$f2
$1a:d425  85 11         sta $11
$1a:d427  41 76         eor ($76,x)
$1a:d429  04 90         tsb $90
$1a:d42b  85 91         sta $91
$1a:d42d  41 84         eor ($84,x)
$1a:d42f  04 90         tsb $90
$1a:d431  86 11         stx $11
$1a:d433  41 92         eor ($92,x)
$1a:d435  04 90         tsb $90
$1a:d437  86 91         stx $91
$1a:d439  41 a0         eor ($a0,x)
$1a:d43b  04 90         tsb $90
$1a:d43d  87 11         sta [$11]
$1a:d43f  41 ae         eor ($ae,x)
$1a:d441  04 90         tsb $90
$1a:d443  87 c0         sta [$c0]
$1a:d445  b0 01         bcs $d448
$1a:d447  50 11         bvc $d45a
$1a:d449  81 e0         sta ($e0,x)
$1a:d44b  4d 63 00      eor $0063
$1a:d44e  92 9e         sta ($9e)
$1a:d450  06 f0         asl $f0
$1a:d452  d9 08 83      cmp $8308,y
$1a:d455  70 03         bvs $d45a
$1a:d457  a0 d9         ldy #$d9
$1a:d459  08            php
$1a:d45a  8b            phb
$1a:d45b  70 04         bvs $d461
$1a:d45d  80 d9         bra $d438
$1a:d45f  08            php
$1a:d460  93 70         sta ($70,s),y
$1a:d462  9b            txy
$1a:d463  21 13         and ($13,x)
$1a:d465  6e 03 94      ror $9403
$1a:d468  1b            tcs
$1a:d469  21 14         and ($14,x)
$1a:d46b  6e 03 b0      ror $b003
$1a:d46e  1b            tcs
$1a:d46f  21 15         and ($15,x)
$1a:d471  6e 03 cc      ror $cc03
$1a:d474  1b            tcs
$1a:d475  21 16         and ($16,x)
$1a:d477  6e 03 e8      ror $e803
$1a:d47a  1b            tcs
$1a:d47b  21 17         and ($17,x)
$1a:d47d  6e 00 04      ror $0400
$1a:d480  1b            tcs
$1a:d481  21 18         and ($18,x)
$1a:d483  6e 00 20      ror $2000
$1a:d486  1b            tcs
$1a:d487  21 19         and ($19,x)
$1a:d489  6e 00 3c      ror $3c00
$1a:d48c  18            clc
$1a:d48d  e1 1a         sbc ($1a,x)
$1a:d48f  49 01         eor #$01
$1a:d491  54 18 e1      mvn $e1,$18
$1a:d494  1b            tcs
$1a:d495  49 01         eor #$01
$1a:d497  70 18         bvs $d4b1
$1a:d499  e1 1c         sbc ($1c,x)
$1a:d49b  49 01         eor #$01
$1a:d49d  8c 18 e1      sty $e118
$1a:d4a0  1d 49 02      ora $0249,x
$1a:d4a3  38            sec
$1a:d4a4  18            clc
$1a:d4a5  e1 1e         sbc ($1e,x)
$1a:d4a7  49 00         eor #$00
$1a:d4a9  5c a3 ea 02   jml $02eaa3
$1a:d4ad  24 86         bit $86
$1a:d4af  90 1a         bcc $d4cb
$1a:d4b1  0a            asl a
$1a:d4b2  90 24         bcc $d4d8
$1a:d4b4  86 95         stx $95
$1a:d4b6  f6 03         inc $03,x
$1a:d4b8  22 d3 3e c0   jsl $c03ed3
$1a:d4bc  72 5a         adc ($5a)
$1a:d4be  77 d8         adc [$d8],y
$1a:d4c0  10 0b         bpl $d4cd
$1a:d4c2  50 fb         bvc $d4bf
$1a:d4c4  02 39         cop #$39
$1a:d4c6  6a            ror a
$1a:d4c7  5f 60 4e 2d   eor $2d4e60,x
$1a:d4cb  53 ec         eor ($ec,s),y
$1a:d4cd  0a            asl a
$1a:d4ce  a5 ab         lda $ab
$1a:d4d0  7d 81 70      adc $7081,x
$1a:d4d3  b5 82         lda $82,x
$1a:d4d5  c0 31         cpy #$31
$1a:d4d7  96 b4         stx $b4,y
$1a:d4d9  58            cli
$1a:d4da  06 a2         asl $a2
$1a:d4dc  d7 0b         cmp [$0b],y
$1a:d4de  00 e2         brk #$e2
$1a:d4e0  5a            phy
$1a:d4e1  f1 60         sbc ($60),y
$1a:d4e3  3b            tsc
$1a:d4e4  8c de 08      sty $08de
$1a:d4e7  d0 40         bne $d529
$1a:d4e9  04 04         tsb $04
$1a:d4eb  de 09 40      dec $4009,x
$1a:d4ee  40            rti
$1a:d4ef  04 08         tsb $08
$1a:d4f1  de 09 b0      dec $b009,x
$1a:d4f4  40            rti
$1a:d4f5  04 0c         tsb $0c
$1a:d4f7  ba            tsx
$1a:d4f8  0f 62 82 17   ora $178262
$1a:d4fc  41 fa         eor ($fa,x)
$1a:d4fe  50 52         bvc $d552
$1a:d500  e8            inx
$1a:d501  01 0a         ora ($0a,x)
$1a:d503  0c 5d 01      tsb $015d
$1a:d506  e1 43         sbc ($43,x)
$1a:d508  8b            phb
$1a:d509  a0 43         ldy #$43
$1a:d50b  28            plp
$1a:d50c  7c 0b 00      jmp ($000b,x)
$1a:d50f  44 02 b8      mvp $b8,$02
$1a:d512  22 44 7a 30   jsl $307a44
$1a:d516  09 12         ora #$12
$1a:d518  24 6f         bit $6f
$1a:d51a  0c 70 88      tsb $8870
$1a:d51d  30 c0         bmi $d4df
$1a:d51f  a2 0c         ldx #$0c
$1a:d521  70 88         bvs $d4ab
$1a:d523  b0 c0         bcs $d4e5
$1a:d525  b0 0c         bcs $d533
$1a:d527  70 89         bvs $d4b2
$1a:d529  30 c0         bmi $d4eb
$1a:d52b  be 0c 70      ldx $700c,y
$1a:d52e  89 bd         bit #$bd
$1a:d530  09 8e         ora #$8e
$1a:d532  11 45         ora ($45),y
$1a:d534  88            dey
$1a:d535  1b            tcs
$1a:d536  41 6a         eor ($6a,x)
$1a:d538  11 55         ora ($55),y
$1a:d53a  88            dey
$1a:d53b  1d 01 6a      ora $6a01,x
$1a:d53e  11 65         ora ($65),y
$1a:d540  88            dey
$1a:d541  02 c1         cop #$c1
$1a:d543  6a            ror a
$1a:d544  11 75         ora ($75),y
$1a:d546  88            dey
$1a:d547  04 81         tsb $81
$1a:d549  6a            ror a
$1a:d54a  11 85         ora ($85),y
$1a:d54c  88            dey
$1a:d54d  06 41         asl $41
$1a:d54f  6a            ror a
$1a:d550  11 95         ora ($95),y
$1a:d552  88            dey
$1a:d553  08            php
$1a:d554  01 6a         ora ($6a,x)
$1a:d556  11 a5         ora ($a5),y
$1a:d558  88            dey
$1a:d559  09 c1         ora #$c1
$1a:d55b  6a            ror a
$1a:d55c  11 b5         ora ($b5),y
$1a:d55e  88            dey
$1a:d55f  0b            phd
$1a:d560  81 6a         sta ($6a,x)
$1a:d562  11 c5         ora ($c5),y
$1a:d564  88            dey
$1a:d565  0d 41 6a      ora $6a41
$1a:d568  11 d5         ora ($d5),y
$1a:d56a  88            dey
$1a:d56b  1e c1 6a      asl $6ac1,x
$1a:d56e  11 e5         ora ($e5),y
$1a:d570  88            dey
$1a:d571  12 ca         ora ($ca)
$1a:d573  3e f0 24      rol $24f0,x
$1a:d576  78            sei
$1a:d577  6f 47 49 be   adc $be4947
$1a:d57b  20 a6 fc      jsr $fca6
$1a:d57e  91 e5         sta ($e5),y
$1a:d580  9f 35 7b 20   sta $207b35,x
$1a:d584  11 e1         ora ($e1),y
$1a:d586  07 17         ora [$17]
$1a:d588  83 3c         sta $3c,s
$1a:d58a  11 e0         ora ($e0),y
$1a:d58c  2d 06 a8      and $a806
$1a:d58f  a3 c2         lda $c2,s
$1a:d591  12 2f         ora ($2f)
$1a:d593  06 e8         asl $e8
$1a:d595  23 c2         and $c2,s
$1a:d597  14 2f         trb $2f
$1a:d599  07 20         ora [$20]
$1a:d59b  23 c2         and $c2,s
$1a:d59d  16 2f         asl $2f,x
$1a:d59f  07 58         ora [$58]
$1a:d5a1  23 c2         and $c2,s
$1a:d5a3  18            clc
$1a:d5a4  2f 00 39 43   and $433900
$1a:d5a8  45 e0         eor $e0
$1a:d5aa  0e 28 74      asl $7428
$1a:d5ad  0b            phd
$1a:d5ae  00 1b         brk #$1b
$1a:d5b0  01 48         ora ($48,x)
$1a:d5b2  21 44         and ($44,x)
$1a:d5b4  1e 30 09      asl $0930,x
$1a:d5b7  0a            asl a
$1a:d5b8  14 6f         trb $6f
$1a:d5ba  0b            phd
$1a:d5bb  50 88         bvc $d545
$1a:d5bd  2c 40 46      bit $4640
$1a:d5c0  0b            phd
$1a:d5c1  50 88         bvc $d54b
$1a:d5c3  ac 40 54      ldy $5440
$1a:d5c6  0b            phd
$1a:d5c7  50 89         bvc $d552
$1a:d5c9  27 c0         and [$c0]
$1a:d5cb  62 0a 30      per $05d8
$1a:d5ce  89 a7         bit #$a7
$1a:d5d0  c0 70         cpy #$70
$1a:d5d2  0a            asl a
$1a:d5d3  30 8a         bmi $d55f
$1a:d5d5  27 c0         and [$c0]
$1a:d5d7  7e 0a 30      ror $300a,x
$1a:d5da  8a            txa
$1a:d5db  a7 c0         lda [$c0]
$1a:d5dd  8c 0a 30      sty $300a
$1a:d5e0  8b            phb
$1a:d5e1  27 c0         and [$c0]
$1a:d5e3  9a            txs
$1a:d5e4  0a            asl a
$1a:d5e5  30 8b         bmi $d572
$1a:d5e7  a7 c0         lda [$c0]
$1a:d5e9  a8            tay
$1a:d5ea  0a            asl a
$1a:d5eb  30 8c         bmi $d579
$1a:d5ed  27 c0         and [$c0]
$1a:d5ef  b6 0a         ldx $0a,y
$1a:d5f1  30 8c         bmi $d57f
$1a:d5f3  a7 c0         lda [$c0]
$1a:d5f5  c4 0a         cpy $0a
$1a:d5f7  30 8d         bmi $d586
$1a:d5f9  27 c0         and [$c0]
$1a:d5fb  d2 0a         cmp ($0a)
$1a:d5fd  30 8d         bmi $d58c
$1a:d5ff  a7 c0         lda [$c0]
$1a:d601  e0 0a         cpx #$0a
$1a:d603  30 8e         bmi $d593
$1a:d605  01 49         ora ($49,x)
$1a:d607  46 11         lsr $11
$1a:d609  d4 f8         pei ($f8)
$1a:d60b  03 81         ora $81,s
$1a:d60d  46 11         lsr $11
$1a:d60f  e4 f8         cpx $f8
$1a:d611  07 4a         ora [$4a]
$1a:d613  3e fa 20      rol $20fa,x
$1a:d616  f0 73         beq $d68b
$1a:d618  c3 5e         cmp $5e,s
$1a:d61a  2b            pld
$1a:d61b  f1 e7         sbc ($e7),y
$1a:d61d  93 7c         sta ($7c,s),y
$1a:d61f  bd e6 ff      lda $ffe6,x
$1a:d622  40            rti
$1a:d623  10 08         bpl $d62d
$1a:d625  e1 e1         sbc ($e1,x)
$1a:d627  d0 24         bne $d64d
$1a:d629  00 94         brk #$94
$1a:d62b  02 e0         cop #$e0
$1a:d62d  0c 14 e0      tsb $e014
$1a:d630  82 40 82      brl $5873
$1a:d633  11 08         ora ($08),y
$1a:d635  c6 00         dec $00
$1a:d637  10 10         bpl $d649
$1a:d639  89 c4         bit #$c4
$1a:d63b  62 21 91      per $675f
$1a:d63e  04 04         tsb $04
$1a:d640  42 60         wdm #$60
$1a:d642  91 0c         sta ($0c),y
$1a:d644  90 20         bcc $d666
$1a:d646  51 23         eor ($23),y
$1a:d648  40            rti
$1a:d649  07 8c         ora [$8c]
$1a:d64b  e1 14         sbc ($14,x)
$1a:d64d  14 10         trb $10
$1a:d64f  b0 cc         bcs $d61d
$1a:d651  11 41         ora ($41),y
$1a:d653  42 0e         wdm #$0e
$1a:d655  8c a1 14      sty $14a1
$1a:d658  14 33         trb $33
$1a:d65a  c0 d0         cpy #$d0
$1a:d65c  12 21         ora ($21)
$1a:d65e  50 68         bvc $d6c8
$1a:d660  02 3c         cop #$3c
$1a:d662  aa            tax
$1a:d663  2b            pld
$1a:d664  e0 4b         cpx #$4b
$1a:d666  15 49         ora $49,x
$1a:d668  7c 0b 20      jmp ($200b,x)
$1a:d66b  48            pha
$1a:d66c  85 4e         sta $4e
$1a:d66e  09 01         ora #$01
$1a:d670  88            dey
$1a:d671  14 42         trb $42
$1a:d673  41 22         eor ($22,x)
$1a:d675  81 35         sta ($35,x)
$1a:d677  04 b0         tsb $b0
$1a:d679  12 06         ora ($06)
$1a:d67b  98            tya
$1a:d67c  48            pha
$1a:d67d  12 21         ora ($21)
$1a:d67f  10 a2         bpl $d623
$1a:d681  41 a0         eor ($a0,x)
$1a:d683  33 08         and ($08,s),y
$1a:d685  43 94         eor $94,s
$1a:d687  28            plp
$1a:d688  c0 80         cpy #$80
$1a:d68a  1e 02 28      asl $2802,x
$1a:d68d  29 0e         and #$0e
$1a:d68f  f2 48         sbc ($48)
$1a:d691  85 61         sta $61
$1a:d693  36 27         rol $27,x
$1a:d695  b8            clv
$1a:d696  8a            txa
$1a:d697  21 93         and ($93,x)
$1a:d699  40            rti
$1a:d69a  8d 24 50      sta $5024
$1a:d69d  68            pla
$1a:d69e  52 84         eor ($84)
$1a:d6a0  8a            txa
$1a:d6a1  0d 12 6c      ora $6c12
$1a:d6a4  16 45         asl $45,x
$1a:d6a6  a3 4a         lda $4a,s
$1a:d6a8  26 c8         rol $c8
$1a:d6aa  40            rti
$1a:d6ab  49 10         eor #$10
$1a:d6ad  d9 a6 fd      cmp $fda6,y
$1a:d6b0  59 eb df      eor $dfeb,y
$1a:d6b3  67 7b         adc [$7b]
$1a:d6b5  7f de 1e 01   adc $011ede,x
$1a:d6b9  78            sei
$1a:d6ba  99 48 07      sta $0748,y
$1a:d6bd  c5 c1         cmp $c1
$1a:d6bf  0c a7 08      tsb $08a7
$1a:d6c2  40            rti
$1a:d6c3  9c 31 72      stz $7231
$1a:d6c6  74 c4         stz $c4,x
$1a:d6c8  e9 d2         sbc #$d2
$1a:d6ca  1a            inc a
$1a:d6cb  f9 1b ca      sbc $ca1b,y
$1a:d6ce  fe 68 f3      inc $f368,x
$1a:d6d1  cf a2 bd 36   cmp $36bda2
$1a:d6d5  f0 f8         beq $d6cf
$1a:d6d7  04 06         tsb $06
$1a:d6d9  19 2c 84      ora $842c,y
$1a:d6dc  46 2c         lsr $2c
$1a:d6de  cc 8f 6c      cpy $6c8f
$1a:d6e1  fb            xce
$1a:d6e2  ab            plb
$1a:d6e3  df 7e 0c f0   cmp $f00c7e,x
$1a:d6e7  ef 8b ba d0   sbc $d0ba8b
$1a:d6eb  3f f2 87 98   and $9887f2,x
$1a:d6ef  7c e5 e8      jmp ($e8e5,x)
$1a:d6f2  3f 4a 78 bb   and $bb784a,x
$1a:d6f6  ad 4b 6f      lda $6f4b
$1a:d6f9  63 fb         adc $fb,s
$1a:d6fb  63 dd         adc $dd,s
$1a:d6fd  3e fa f0      rol $f0fa,x
$1a:d700  5f a9 5e 24   eor $245ea9,x
$1a:d704  af 08 24 d0   lda $d02408
$1a:d708  d2 16         cmp ($16)
$1a:d70a  c3 d0         cmp $d0,s
$1a:d70c  44 e4 aa      mvp $aa,$e4
$1a:d70f  11 a3         ora ($a3),y
$1a:d711  29 46         and #$46
$1a:d713  1f 11 b6 71   ora $71b611,x
$1a:d717  93 c2         sta ($c2,s),y
$1a:d719  af 1c 30 bb   lda $bb301c
$1a:d71d  c7 fe         cmp [$fe]
$1a:d71f  50 f3         bvc $d714
$1a:d721  0f 9c bd 07   ora $07bd9c
$1a:d725  e9 46         sbc #$46
$1a:d727  4b            phk
$1a:d728  04 06         tsb $06
$1a:d72a  19 2c 7a      ora $7a2c,y
$1a:d72d  85 b8         sta $b8
$1a:d72f  0c 02 b0      tsb $b002
$1a:d732  57 85         eor [$85],y
$1a:d734  b9 73 ec      lda $ec73,y
$1a:d737  af 6d fb b3   lda $b3fb6d
$1a:d73b  df be 0e f0   cmp $f00ebe,x
$1a:d73f  ff 63 86 09   sbc $098663,x
$1a:d743  8e 1b f9      stx $f91b
$1a:d746  23 cb         and $cb,s
$1a:d748  3e 6a f3      rol $f36a,x
$1a:d74b  df a3 30 30   cmp $3030a3,x
$1a:d74f  00 4e         brk #$4e
$1a:d751  2e 0d ff      rol $ff0d
$1a:d754  ef b8 0e 00   sbc $000eb8
$1a:d758  0e ff e0      asl $e0ff
$1a:d75b  b8            clv
$1a:d75c  00 f0         brk #$f0
$1a:d75e  0f ff f1 b8   ora $b8f1ff
$1a:d762  07 00         ora [$00]
$1a:d764  10 ff         bpl $d765
$1a:d766  e0 b8         cpx #$b8
$1a:d768  03 c0         ora $c0,s
$1a:d76a  11 ff         ora ($ff),y
$1a:d76c  ec b8 07      cpx $07b8
$1a:d76f  00 12         brk #$12
$1a:d771  ff e0 b8 06   sbc $06b8e0,x
$1a:d775  15 13         ora $13,x
$1a:d777  ff e0 b8 07   sbc $07b8e0,x
$1a:d77b  a8            tay
$1a:d77c  14 ff         trb $ff
$1a:d77e  f1 b8         sbc ($b8),y
$1a:d780  03 30         ora $30,s
$1a:d782  18            clc
$1a:d783  00 00         brk #$00
$1a:d785  2f 32 65 7f   and $7f6532
$1a:d789  98            tya
$1a:d78a  b2 cb         lda ($cb)
$1a:d78c  e5 fc         sbc $fc
$1a:d78e  19 32 4c      ora $4c32,y
$1a:d791  65 72         adc $72
$1a:d793  7f 8c 98 a5   adc $a5988c,x
$1a:d797  b2 bf         lda ($bf)
$1a:d799  cb            wai
$1a:d79a  d8            cld
$1a:d79b  e5 f2         sbc $f2
$1a:d79d  fc 71 07      jsr ($0771,x)
$1a:d7a0  00 10         brk #$10
$1a:d7a2  02 10         cop #$10
$1a:d7a4  0a            asl a
$1a:d7a5  10 ff         bpl $d7a6
$1a:d7a7  00 02         brk #$02
$1a:d7a9  10 00         bpl $d7ab
$1a:d7ab  00 1a         brk #$1a
$1a:d7ad  10 24         bpl $d7d3
$1a:d7af  11 e5         ora ($e5),y
$1a:d7b1  11 b9         ora ($b9),y
$1a:d7b3  12 bf         ora ($bf)
$1a:d7b5  13 83         ora ($83,s),y
$1a:d7b7  14 81         trb $81
$1a:d7b9  15 89         ora $89,x
$1a:d7bb  16 fa         asl $fa,x
$1a:d7bd  05 ea         ora $ea
$1a:d7bf  f4 e0 04      pea $04e0
$1a:d7c2  e7 18         sbc [$18]
$1a:d7c4  ed 9e e5      sbc $e59e
$1a:d7c7  ff e1 0a f5   sbc $f50ae1,x
$1a:d7cb  80 7f         bra $d84c
$1a:d7cd  7f f7 03 aa   adc $aa03f7,x
$1a:d7d1  00 24         brk #$24
$1a:d7d3  5d b0 18      eor $18b0,x
$1a:d7d6  ae 0c ad      ldx $ad0c
$1a:d7d9  18            clc
$1a:d7da  ab            plb
$1a:d7db  0c a9 24      tsb $24a9
$1a:d7de  ab            plb
$1a:d7df  0c ab ad      tsb $adab
$1a:d7e2  ae 18 ad      ldx $ad18
$1a:d7e5  0c ae 48      tsb $48ae
$1a:d7e8  ab            plb
$1a:d7e9  24 b0         bit $b0
$1a:d7eb  18            clc
$1a:d7ec  ae 0c ad      ldx $ad0c
$1a:d7ef  18            clc
$1a:d7f0  ab            plb
$1a:d7f1  0c a9 24      tsb $24a9
$1a:d7f4  ab            plb
$1a:d7f5  0c b0 ae      tsb $aeb0
$1a:d7f8  ad ae ad      lda $adae
$1a:d7fb  ae 48 ab      ldx $ab48
$1a:d7fe  ed 9b ea      sbc $ea9b
$1a:d801  00 e0         brk #$e0
$1a:d803  03 0c         ora $0c,s
$1a:d805  a9 b0         lda #$b0
$1a:d807  b0 a9         bcs $d7b2
$1a:d809  a8            tay
$1a:d80a  a9 18         lda #$18
$1a:d80c  b0 0c         bcs $d81a
$1a:d80e  5b            tcd
$1a:d80f  b0 24         bcs $d835
$1a:d811  68            pla
$1a:d812  c8            iny
$1a:d813  24 6d         bit $6d
$1a:d815  b5 b4         lda $b4,x
$1a:d817  48            pha
$1a:d818  6b            rtl
$1a:d819  b0 24         bcs $d83f
$1a:d81b  c8            iny
$1a:d81c  c9 0c         cmp #$0c
$1a:d81e  5d a9 b0      eor $b0a9,x
$1a:d821  b0 a9         bcs $d7cc
$1a:d823  a8            tay
$1a:d824  a9 18         lda #$18
$1a:d826  b0 0c         bcs $d834
$1a:d828  5b            tcd
$1a:d829  b0 24         bcs $d84f
$1a:d82b  68            pla
$1a:d82c  c8            iny
$1a:d82d  24 6d         bit $6d
$1a:d82f  b5 b4         lda $b4,x
$1a:d831  48            pha
$1a:d832  6b            rtl
$1a:d833  b0 24         bcs $d859
$1a:d835  c8            iny
$1a:d836  c9 e0         cmp #$e0
$1a:d838  01 ea         ora ($ea,x)
$1a:d83a  f4 ed b9      pea $b9ed
$1a:d83d  06 5d         asl $5d
$1a:d83f  b0 06         bcs $d847
$1a:d841  5b            tcd
$1a:d842  bc 06 5d      ldy $5d06,x
$1a:d845  ae ba b0      ldx $b0ba
$1a:d848  06 5b         asl $5b
$1a:d84a  bc 06 5d      ldy $5d06,x
$1a:d84d  b0 06         bcs $d855
$1a:d84f  5b            tcd
$1a:d850  bc 06 5d      ldy $5d06,x
$1a:d853  ae ba b0      ldx $b0ba
$1a:d856  06 5b         asl $5b
$1a:d858  bc 06 5d      ldy $5d06,x
$1a:d85b  b5 b4         lda $b4,x
$1a:d85d  0c b0 ae      tsb $aeb0
$1a:d860  24 5b         bit $5b
$1a:d862  b0 06         bcs $d86a
$1a:d864  5d b0 06      eor $06b0,x
$1a:d867  5b            tcd
$1a:d868  bc 06 5d      ldy $5d06,x
$1a:d86b  ae ba b0      ldx $b0ba
$1a:d86e  06 5b         asl $5b
$1a:d870  bc 06 5d      ldy $5d06,x
$1a:d873  b0 06         bcs $d87b
$1a:d875  5b            tcd
$1a:d876  bc 06 5d      ldy $5d06,x
$1a:d879  ae ba b0      ldx $b0ba
$1a:d87c  06 5b         asl $5b
$1a:d87e  bc 06 5d      ldy $5d06,x
$1a:d881  b5 b4         lda $b4,x
$1a:d883  0c b0 ae      tsb $aeb0
$1a:d886  24 5b         bit $5b
$1a:d888  b0 ed         bcs $d877
$1a:d88a  9b            txy
$1a:d88b  ea            nop
$1a:d88c  00 e0         brk #$e0
$1a:d88e  03 24         ora $24,s
$1a:d890  5d a8 24      eor $24a8,x
$1a:d893  5b            tcd
$1a:d894  b4 18         ldy $18,x
$1a:d896  5d b2 0c      eor $0cb2,x
$1a:d899  ab            plb
$1a:d89a  24 ad         bit $ad
$1a:d89c  a6 24         ldx $24
$1a:d89e  5b            tcd
$1a:d89f  b5 18         lda $18,x
$1a:d8a1  5d b4 0c      eor $0cb4,x
$1a:d8a4  b0 24         bcs $d8ca
$1a:d8a6  5b            tcd
$1a:d8a7  b2 24         lda ($24)
$1a:d8a9  5d a8 24      eor $24a8,x
$1a:d8ac  5b            tcd
$1a:d8ad  b4 18         ldy $18,x
$1a:d8af  5d b2 0c      eor $0cb2,x
$1a:d8b2  ab            plb
$1a:d8b3  24 ad         bit $ad
$1a:d8b5  06 a9         asl $a9
$1a:d8b7  a8            tay
$1a:d8b8  0c a9 0c      tsb $0ca9
$1a:d8bb  5b            tcd
$1a:d8bc  b0 0c         bcs $d8ca
$1a:d8be  5d a9 a8      eor $a8a9,x
$1a:d8c1  a9 48         lda #$48
$1a:d8c3  5b            tcd
$1a:d8c4  b0 00         bcs $d8c6
$1a:d8c6  ea            nop
$1a:d8c7  f4 e0 04      pea $04e0
$1a:d8ca  ed 5a e1      sbc $e15a
$1a:d8cd  0a            asl a
$1a:d8ce  0c c9 24      tsb $24c9
$1a:d8d1  5d b0 18      eor $18b0,x
$1a:d8d4  ae 0c ad      ldx $ad0c
$1a:d8d7  18            clc
$1a:d8d8  ab            plb
$1a:d8d9  0c a9 24      tsb $24a9
$1a:d8dc  ab            plb
$1a:d8dd  0c ab ad      tsb $adab
$1a:d8e0  ae 18 ad      ldx $ad18
$1a:d8e3  0c ae 48      tsb $48ae
$1a:d8e6  ab            plb
$1a:d8e7  24 b0         bit $b0
$1a:d8e9  18            clc
$1a:d8ea  ae 0c ad      ldx $ad0c
$1a:d8ed  18            clc
$1a:d8ee  ab            plb
$1a:d8ef  0c a9 24      tsb $24a9
$1a:d8f2  ab            plb
$1a:d8f3  0c b0 ae      tsb $aeb0
$1a:d8f6  ad ae ad      lda $adae
$1a:d8f9  ae 48 ab      ldx $ab48
$1a:d8fc  ea            nop
$1a:d8fd  00 e0         brk #$e0
$1a:d8ff  01 0c         ora ($0c,x)
$1a:d901  a9 b0         lda #$b0
$1a:d903  b0 a9         bcs $d8ae
$1a:d905  a8            tay
$1a:d906  a9 18         lda #$18
$1a:d908  b0 0c         bcs $d916
$1a:d90a  5b            tcd
$1a:d90b  b0 24         bcs $d931
$1a:d90d  48            pha
$1a:d90e  c8            iny
$1a:d90f  24 6d         bit $6d
$1a:d911  b5 b4         lda $b4,x
$1a:d913  48            pha
$1a:d914  6b            rtl
$1a:d915  b0 24         bcs $d93b
$1a:d917  48            pha
$1a:d918  c8            iny
$1a:d919  c9 0c         cmp #$0c
$1a:d91b  5d a9 b0      eor $b0a9,x
$1a:d91e  b0 a9         bcs $d8c9
$1a:d920  a8            tay
$1a:d921  a9 18         lda #$18
$1a:d923  b0 0c         bcs $d931
$1a:d925  b0 24         bcs $d94b
$1a:d927  68            pla
$1a:d928  c8            iny
$1a:d929  24 6d         bit $6d
$1a:d92b  b5 b4         lda $b4,x
$1a:d92d  48            pha
$1a:d92e  b0 24         bcs $d954
$1a:d930  c8            iny
$1a:d931  c9 ea         cmp #$ea
$1a:d933  f4 e0 01      pea $01e0
$1a:d936  ed 69 06      sbc $0669
$1a:d939  5d b0 bc      eor $bcb0,x
$1a:d93c  ae ba b0      ldx $b0ba
$1a:d93f  bc b0 bc      ldy $bcb0,x
$1a:d942  ae ba b0      ldx $b0ba
$1a:d945  bc b5 b4      ldy $b4b5,x
$1a:d948  0c b0 ae      tsb $aeb0
$1a:d94b  24 b0         bit $b0
$1a:d94d  06 b0         asl $b0
$1a:d94f  bc ae ba      ldy $baae,x
$1a:d952  b0 bc         bcs $d910
$1a:d954  b0 bc         bcs $d912
$1a:d956  ae ba b0      ldx $b0ba
$1a:d959  bc b5 b4      ldy $b4b5,x
$1a:d95c  0c b0 ae      tsb $aeb0
$1a:d95f  24 b0         bit $b0
$1a:d961  ed 5a a8      sbc $a85a
$1a:d964  b4 18         ldy $18,x
$1a:d966  b2 0c         lda ($0c)
$1a:d968  ab            plb
$1a:d969  24 ad         bit $ad
$1a:d96b  a6 b5         ldx $b5
$1a:d96d  18            clc
$1a:d96e  b4 0c         ldy $0c,x
$1a:d970  b0 24         bcs $d996
$1a:d972  b2 a8         lda ($a8)
$1a:d974  b4 18         ldy $18,x
$1a:d976  b2 0c         lda ($0c)
$1a:d978  ab            plb
$1a:d979  24 ad         bit $ad
$1a:d97b  06 a9         asl $a9
$1a:d97d  a8            tay
$1a:d97e  0c a9 b0      tsb $b0a9
$1a:d981  a9 a8         lda #$a8
$1a:d983  a9 3c         lda #$3c
$1a:d985  b0 00         bcs $d987
$1a:d987  ea            nop
$1a:d988  00 e0         brk #$e0
$1a:d98a  00 ed         brk #$ed
$1a:d98c  91 e1         sta ($e1),y
$1a:d98e  0a            asl a
$1a:d98f  24 6d         bit $6d
$1a:d991  8e 18 c8      stx $c818
$1a:d994  0c 6a 9a      tsb $9a6a
$1a:d997  48            pha
$1a:d998  6d 8e 24      adc $248e
$1a:d99b  8e 18 c8      stx $c818
$1a:d99e  0c 6a 9a      tsb $9a6a
$1a:d9a1  24 6d         bit $6d
$1a:d9a3  8e 0c 6a      stx $6a0c
$1a:d9a6  9a            txs
$1a:d9a7  0c 6d 95      tsb $956d
$1a:d9aa  8e 24 8e      stx $8e24
$1a:d9ad  18            clc
$1a:d9ae  c8            iny
$1a:d9af  0c 6a 9a      tsb $9a6a
$1a:d9b2  48            pha
$1a:d9b3  6d 8e 24      adc $248e
$1a:d9b6  8e 18 c8      stx $c818
$1a:d9b9  0c 6a 9a      tsb $9a6a
$1a:d9bc  24 6d         bit $6d
$1a:d9be  8e 0c 6a      stx $6a0c
$1a:d9c1  9a            txs
$1a:d9c2  0c 6d 95      tsb $956d
$1a:d9c5  8e 24 8e      stx $8e24
$1a:d9c8  8e 8c 8c      stx $8c8c
$1a:d9cb  8e 8e 90      stx $908e
$1a:d9ce  0c 6a 9c      tsb $9c6a
$1a:d9d1  0c 6d 96      tsb $966d
$1a:d9d4  90 24         bcc $d9fa
$1a:d9d6  90 18         bcc $d9f0
$1a:d9d8  6a            ror a
$1a:d9d9  9c 0c 6d      stz $6d0c
$1a:d9dc  90 24         bcc $da02
$1a:d9de  8e 8e 8c      stx $8c8e
$1a:d9e1  8c 8e 8e      sty $8e8e
$1a:d9e4  90 0c         bcc $d9f2
$1a:d9e6  6a            ror a
$1a:d9e7  9c 0c 6d      stz $6d0c
$1a:d9ea  96 90         stx $90,y
$1a:d9ec  24 90         bit $90
$1a:d9ee  18            clc
$1a:d9ef  6a            ror a
$1a:d9f0  9c 0c 6d      stz $6d0c
$1a:d9f3  90 48         bcc $da3d
$1a:d9f5  7d 8e c8      adc $c88e,x
$1a:d9f8  8e c8 18      stx $18c8
$1a:d9fb  6d 8e 0c      adc $0c8e
$1a:d9fe  6a            ror a
$1a:d9ff  9a            txs
$1a:da00  18            clc
$1a:da01  6d 8c 0c      adc $0c8c
$1a:da04  6a            ror a
$1a:da05  98            tya
$1a:da06  18            clc
$1a:da07  6d 8e 0c      adc $0c8e
$1a:da0a  6a            ror a
$1a:da0b  9a            txs
$1a:da0c  18            clc
$1a:da0d  6d 8c 0c      adc $0c8c
$1a:da10  6a            ror a
$1a:da11  98            tya
$1a:da12  18            clc
$1a:da13  6d 8e 0c      adc $0c8e
$1a:da16  6a            ror a
$1a:da17  9a            txs
$1a:da18  18            clc
$1a:da19  6d 8c 0c      adc $0c8c
$1a:da1c  6a            ror a
$1a:da1d  98            tya
$1a:da1e  18            clc
$1a:da1f  6d 8e 0c      adc $0c8e
$1a:da22  6a            ror a
$1a:da23  9a            txs
$1a:da24  18            clc
$1a:da25  6d 8c 0c      adc $0c8c
$1a:da28  6a            ror a
$1a:da29  98            tya
$1a:da2a  18            clc
$1a:da2b  6d 8e 0c      adc $0c8e
$1a:da2e  6a            ror a
$1a:da2f  9a            txs
$1a:da30  18            clc
$1a:da31  6d 8c 0c      adc $0c8c
$1a:da34  6a            ror a
$1a:da35  98            tya
$1a:da36  18            clc
$1a:da37  6d 8e 0c      adc $0c8e
$1a:da3a  6a            ror a
$1a:da3b  9a            txs
$1a:da3c  18            clc
$1a:da3d  6d 8c 0c      adc $0c8c
$1a:da40  6a            ror a
$1a:da41  98            tya
$1a:da42  18            clc
$1a:da43  6d 8e 0c      adc $0c8e
$1a:da46  6a            ror a
$1a:da47  9a            txs
$1a:da48  18            clc
$1a:da49  6d 8c 0c      adc $0c8c
$1a:da4c  6a            ror a
$1a:da4d  98            tya
$1a:da4e  18            clc
$1a:da4f  6d 8e 0c      adc $0c8e
$1a:da52  6a            ror a
$1a:da53  9a            txs
$1a:da54  18            clc
$1a:da55  6d 8c 0c      adc $0c8c
$1a:da58  6a            ror a
$1a:da59  98            tya
$1a:da5a  00 ea         brk #$ea
$1a:da5c  0c e0 02      tsb $02e0
$1a:da5f  ed 69 e1      sbc $e169
$1a:da62  0b            phd
$1a:da63  48            pha
$1a:da64  c9 c9         cmp #$c9
$1a:da66  c9 c9         cmp #$c9
$1a:da68  c9 c9         cmp #$c9
$1a:da6a  c9 c9         cmp #$c9
$1a:da6c  06 3d         asl $3d
$1a:da6e  a6 ab         ldx $ab
$1a:da70  ad ae ad      lda $adae
$1a:da73  ab            plb
$1a:da74  a6 ab         ldx $ab
$1a:da76  ad ae ad      lda $adae
$1a:da79  ab            plb
$1a:da7a  a6 ab         ldx $ab
$1a:da7c  ad ae ad      lda $adae
$1a:da7f  ab            plb
$1a:da80  a6 ab         ldx $ab
$1a:da82  ad ae ad      lda $adae
$1a:da85  ab            plb
$1a:da86  a4 a9         ldy $a9
$1a:da88  ab            plb
$1a:da89  b0 ab         bcs $da36
$1a:da8b  a9 a6         lda #$a6
$1a:da8d  ab            plb
$1a:da8e  ad ae ad      lda $adae
$1a:da91  ab            plb
$1a:da92  a8            tay
$1a:da93  ad ae ad      lda $adae
$1a:da96  ae ad a8      ldx $a8ad
$1a:da99  ad ae ad      lda $adae
$1a:da9c  ae ad 48      ldx $48ad
$1a:da9f  b0 06         bcs $daa7
$1a:daa1  a6 ab         ldx $ab
$1a:daa3  ad ae ad      lda $adae
$1a:daa6  ab            plb
$1a:daa7  a6 ab         ldx $ab
$1a:daa9  ad ae ad      lda $adae
$1a:daac  ab            plb
$1a:daad  a6 ab         ldx $ab
$1a:daaf  ad ae ad      lda $adae
$1a:dab2  ab            plb
$1a:dab3  a6 ab         ldx $ab
$1a:dab5  ad ae ad      lda $adae
$1a:dab8  ab            plb
$1a:dab9  a4 a9         ldy $a9
$1a:dabb  ab            plb
$1a:dabc  b0 ab         bcs $da69
$1a:dabe  a9 a6         lda #$a6
$1a:dac0  ab            plb
$1a:dac1  ad ae ad      lda $adae
$1a:dac4  ab            plb
$1a:dac5  a8            tay
$1a:dac6  ad ae ad      lda $adae
$1a:dac9  ae ad a8      ldx $a8ad
$1a:dacc  ad ae ad      lda $adae
$1a:dacf  ae ad 48      ldx $48ad
$1a:dad2  b0 06         bcs $dada
$1a:dad4  a9 a9         lda #$a9
$1a:dad6  a7 a7         lda [$a7]
$1a:dad8  a9 a9         lda #$a9
$1a:dada  a9 a9         lda #$a9
$1a:dadc  a7 a7         lda [$a7]
$1a:dade  a9 a9         lda #$a9
$1a:dae0  ae ad 0c      ldx $0cad
$1a:dae3  a9 a7         lda #$a7
$1a:dae5  24 a9         bit $a9
$1a:dae7  06 a9         asl $a9
$1a:dae9  a9 a7         lda #$a7
$1a:daeb  a7 a9         lda [$a9]
$1a:daed  a9 a9         lda #$a9
$1a:daef  a9 a7         lda #$a7
$1a:daf1  a7 a9         lda [$a9]
$1a:daf3  a9 ae         lda #$ae
$1a:daf5  ad 0c a9      lda $a90c
$1a:daf8  a7 24         lda [$24]
$1a:dafa  a9 06         lda #$06
$1a:dafc  9a            txs
$1a:dafd  9f a1 a6 a1   sta $a1a6a1,x
$1a:db01  9f 9a 9f a1   sta $a19f9a,x
$1a:db05  a6 06         ldx $06
$1a:db07  4d a1 9f      eor $9fa1
$1a:db0a  06 3d         asl $3d
$1a:db0c  98            tya
$1a:db0d  9d 9f a4      sta $a49f,x
$1a:db10  9f 9d 98 9d   sta $9d989d,x
$1a:db14  9f a4 9f 9d   sta $9d9fa4,x
$1a:db18  98            tya
$1a:db19  9d 9f a4      sta $a49f,x
$1a:db1c  9f 9d 98 9d   sta $9d989d,x
$1a:db20  9f a4 9f 9d   sta $9d9fa4,x
$1a:db24  98            tya
$1a:db25  9d 9f a4      sta $a49f,x
$1a:db28  9f 9d 98 9d   sta $9d989d,x
$1a:db2c  9f a4 9f 9d   sta $9d9fa4,x
$1a:db30  98            tya
$1a:db31  9d 9f a4      sta $a49f,x
$1a:db34  9f 9d 98 9d   sta $9d989d,x
$1a:db38  9f a4 9f 9d   sta $9d9fa4,x
$1a:db3c  98            tya
$1a:db3d  9d 9f a4      sta $a49f,x
$1a:db40  9f 9d 98 9d   sta $9d989d,x
$1a:db44  9f a4 9f 9d   sta $9d9fa4,x
$1a:db48  9a            txs
$1a:db49  9f a1 a6 a1   sta $a1a6a1,x
$1a:db4d  9f 9a 9f a1   sta $a19f9a,x
$1a:db51  a6 a1         ldx $a1
$1a:db53  9f 9a 9f a1   sta $a19f9a,x
$1a:db57  a6 a1         ldx $a1
$1a:db59  9f 9a 9f a1   sta $a19f9a,x
$1a:db5d  a6 a1         ldx $a1
$1a:db5f  9f 00 ea f4   sta $f4ea00,x
$1a:db63  e0 04         cpx #$04
$1a:db65  ed 3c e1      sbc $e13c
$1a:db68  08            php
$1a:db69  06 c9         asl $c9
$1a:db6b  24 5d         bit $5d
$1a:db6d  b0 18         bcs $db87
$1a:db6f  ae 0c ad      ldx $ad0c
$1a:db72  18            clc
$1a:db73  ab            plb
$1a:db74  0c a9 24      tsb $24a9
$1a:db77  ab            plb
$1a:db78  0c ab ad      tsb $adab
$1a:db7b  ae 18 ad      ldx $ad18
$1a:db7e  0c ae 48      tsb $48ae
$1a:db81  ab            plb
$1a:db82  24 b0         bit $b0
$1a:db84  18            clc
$1a:db85  ae 0c ad      ldx $ad0c
$1a:db88  18            clc
$1a:db89  ab            plb
$1a:db8a  0c a9 24      tsb $24a9
$1a:db8d  ab            plb
$1a:db8e  0c b0 ae      tsb $aeb0
$1a:db91  ad ae ad      lda $adae
$1a:db94  ae 48 5b      ldx $5b48
$1a:db97  ab            plb
$1a:db98  ea            nop
$1a:db99  00 e0         brk #$e0
$1a:db9b  03 0c         ora $0c,s
$1a:db9d  5d a9 b0      eor $b0a9,x
$1a:dba0  b0 a9         bcs $db4b
$1a:dba2  a8            tay
$1a:dba3  a9 18         lda #$18
$1a:dba5  b0 0c         bcs $dbb3
$1a:dba7  b0 24         bcs $dbcd
$1a:dba9  68            pla
$1a:dbaa  c8            iny
$1a:dbab  24 6d         bit $6d
$1a:dbad  b5 b4         lda $b4,x
$1a:dbaf  48            pha
$1a:dbb0  b0 24         bcs $dbd6
$1a:dbb2  c8            iny
$1a:dbb3  c9 0c         cmp #$0c
$1a:dbb5  5d a9 b0      eor $b0a9,x
$1a:dbb8  b0 a9         bcs $db63
$1a:dbba  a8            tay
$1a:dbbb  a9 18         lda #$18
$1a:dbbd  b0 0c         bcs $dbcb
$1a:dbbf  b0 24         bcs $dbe5
$1a:dbc1  68            pla
$1a:dbc2  c8            iny
$1a:dbc3  24 6d         bit $6d
$1a:dbc5  b5 b4         lda $b4,x
$1a:dbc7  48            pha
$1a:dbc8  b0 24         bcs $dbee
$1a:dbca  c8            iny
$1a:dbcb  c9 e0         cmp #$e0
$1a:dbcd  01 ea         ora ($ea,x)
$1a:dbcf  f4 ed 50      pea $50ed
$1a:dbd2  06 5d         asl $5d
$1a:dbd4  b0 bc         bcs $db92
$1a:dbd6  ae ba b0      ldx $b0ba
$1a:dbd9  bc b0 bc      ldy $bcb0,x
$1a:dbdc  ae ba b0      ldx $b0ba
$1a:dbdf  bc b5 b4      ldy $b4b5,x
$1a:dbe2  0c b0 ae      tsb $aeb0
$1a:dbe5  24 b0         bit $b0
$1a:dbe7  06 b0         asl $b0
$1a:dbe9  bc ae ba      ldy $baae,x
$1a:dbec  b0 bc         bcs $dbaa
$1a:dbee  b0 bc         bcs $dbac
$1a:dbf0  ae ba b0      ldx $b0ba
$1a:dbf3  bc b5 b4      ldy $b4b5,x
$1a:dbf6  0c b0 ae      tsb $aeb0
$1a:dbf9  24 b0         bit $b0
$1a:dbfb  ed 3c ea      sbc $ea3c
$1a:dbfe  00 e0         brk #$e0
$1a:dc00  03 a8         ora $a8,s
$1a:dc02  b4 18         ldy $18,x
$1a:dc04  b2 0c         lda ($0c)
$1a:dc06  ab            plb
$1a:dc07  24 ad         bit $ad
$1a:dc09  a6 b5         ldx $b5
$1a:dc0b  18            clc
$1a:dc0c  b4 0c         ldy $0c,x
$1a:dc0e  b0 24         bcs $dc34
$1a:dc10  b2 a8         lda ($a8)
$1a:dc12  b4 18         ldy $18,x
$1a:dc14  b2 0c         lda ($0c)
$1a:dc16  ab            plb
$1a:dc17  24 ad         bit $ad
$1a:dc19  06 a9         asl $a9
$1a:dc1b  a8            tay
$1a:dc1c  0c a9 b0      tsb $b0a9
$1a:dc1f  a9 a8         lda #$a8
$1a:dc21  a9 42         lda #$42
$1a:dc23  b0 00         bcs $dc25
$1a:dc25  ea            nop
$1a:dc26  00 e0         brk #$e0
$1a:dc28  03 ed         ora $ed,s
$1a:dc2a  a0 e1         ldy #$e1
$1a:dc2c  0a            asl a
$1a:dc2d  24 5b         bit $5b
$1a:dc2f  ca            dex
$1a:dc30  24 5d         bit $5d
$1a:dc32  cb            wai
$1a:dc33  24 5b         bit $5b
$1a:dc35  ca            dex
$1a:dc36  18            clc
$1a:dc37  5d cb 0c      eor $0ccb,x
$1a:dc3a  59 cb 24      eor $24cb,y
$1a:dc3d  5b            tcd
$1a:dc3e  ca            dex
$1a:dc3f  18            clc
$1a:dc40  5d cb 0c      eor $0ccb,x
$1a:dc43  5b            tcd
$1a:dc44  ca            dex
$1a:dc45  c9 18         cmp #$18
$1a:dc47  ca            dex
$1a:dc48  18            clc
$1a:dc49  5d cb 0c      eor $0ccb,x
$1a:dc4c  59 ca 24      eor $24ca,y
$1a:dc4f  5b            tcd
$1a:dc50  ca            dex
$1a:dc51  24 5d         bit $5d
$1a:dc53  cb            wai
$1a:dc54  24 5b         bit $5b
$1a:dc56  ca            dex
$1a:dc57  18            clc
$1a:dc58  5d cb 0c      eor $0ccb,x
$1a:dc5b  59 cb 24      eor $24cb,y
$1a:dc5e  5b            tcd
$1a:dc5f  ca            dex
$1a:dc60  18            clc
$1a:dc61  5d cb 0c      eor $0ccb,x
$1a:dc64  ca            dex
$1a:dc65  c9 18         cmp #$18
$1a:dc67  5b            tcd
$1a:dc68  ca            dex
$1a:dc69  18            clc
$1a:dc6a  5d cb 0c      eor $0ccb,x
$1a:dc6d  59 ca 24      eor $24ca,y
$1a:dc70  5b            tcd
$1a:dc71  ca            dex
$1a:dc72  24 5d         bit $5d
$1a:dc74  cb            wai
$1a:dc75  24 5b         bit $5b
$1a:dc77  ca            dex
$1a:dc78  24 5d         bit $5d
$1a:dc7a  cb            wai
$1a:dc7b  24 5b         bit $5b
$1a:dc7d  ca            dex
$1a:dc7e  18            clc
$1a:dc7f  5d cb 0c      eor $0ccb,x
$1a:dc82  5b            tcd
$1a:dc83  ca            dex
$1a:dc84  c9 18         cmp #$18
$1a:dc86  ca            dex
$1a:dc87  18            clc
$1a:dc88  5d cb 0c      eor $0ccb,x
$1a:dc8b  59 ca 24      eor $24ca,y
$1a:dc8e  5b            tcd
$1a:dc8f  ca            dex
$1a:dc90  18            clc
$1a:dc91  5d cb 0c      eor $0ccb,x
$1a:dc94  5b            tcd
$1a:dc95  ca            dex
$1a:dc96  24 ca         bit $ca
$1a:dc98  cb            wai
$1a:dc99  ca            dex
$1a:dc9a  24 5d         bit $5d
$1a:dc9c  cb            wai
$1a:dc9d  24 5b         bit $5b
$1a:dc9f  ca            dex
$1a:dca0  18            clc
$1a:dca1  5d cb 0c      eor $0ccb,x
$1a:dca4  5b            tcd
$1a:dca5  ca            dex
$1a:dca6  c9 18         cmp #$18
$1a:dca8  ca            dex
$1a:dca9  18            clc
$1a:dcaa  5d cb 0c      eor $0ccb,x
$1a:dcad  59 ca c9      eor $c9ca,y
$1a:dcb0  18            clc
$1a:dcb1  5b            tcd
$1a:dcb2  ca            dex
$1a:dcb3  0c cb 0c      tsb $0ccb
$1a:dcb6  5d cb 0c      eor $0ccb,x
$1a:dcb9  5f cb 48 6f   eor $6f48cb,x
$1a:dcbd  cc 30 c9      cpy $c930
$1a:dcc0  e1 0c         sbc ($0c,x)
$1a:dcc2  0c cc e1      tsb $e1cc
$1a:dcc5  08            php
$1a:dcc6  cc e1 0a      cpy $0ae1
$1a:dcc9  48            pha
$1a:dcca  cc 30 c9      cpy $c930
$1a:dccd  e1 0c         sbc ($0c,x)
$1a:dccf  0c cc e1      tsb $e1cc
$1a:dcd2  08            php
$1a:dcd3  cc e1 0a      cpy $0ae1
$1a:dcd6  18            clc
$1a:dcd7  5b            tcd
$1a:dcd8  ca            dex
$1a:dcd9  0c ca 18      tsb $18ca
$1a:dcdc  5d cb 0c      eor $0ccb,x
$1a:dcdf  5b            tcd
$1a:dce0  ca            dex
$1a:dce1  c9 18         cmp #$18
$1a:dce3  ca            dex
$1a:dce4  18            clc
$1a:dce5  5d cb 0c      eor $0ccb,x
$1a:dce8  5b            tcd
$1a:dce9  ca            dex
$1a:dcea  18            clc
$1a:dceb  ca            dex
$1a:dcec  0c ca 18      tsb $18ca
$1a:dcef  5d cb 0c      eor $0ccb,x
$1a:dcf2  5b            tcd
$1a:dcf3  ca            dex
$1a:dcf4  c9 18         cmp #$18
$1a:dcf6  ca            dex
$1a:dcf7  18            clc
$1a:dcf8  5d cb 0c      eor $0ccb,x
$1a:dcfb  5b            tcd
$1a:dcfc  ca            dex
$1a:dcfd  18            clc
$1a:dcfe  ca            dex
$1a:dcff  0c ca 18      tsb $18ca
$1a:dd02  5d cb 0c      eor $0ccb,x
$1a:dd05  5b            tcd
$1a:dd06  ca            dex
$1a:dd07  c9 18         cmp #$18
$1a:dd09  ca            dex
$1a:dd0a  18            clc
$1a:dd0b  5d cb 0c      eor $0ccb,x
$1a:dd0e  5b            tcd
$1a:dd0f  ca            dex
$1a:dd10  18            clc
$1a:dd11  ca            dex
$1a:dd12  0c ca 18      tsb $18ca
$1a:dd15  5d cb 0c      eor $0ccb,x
$1a:dd18  5b            tcd
$1a:dd19  ca            dex
$1a:dd1a  c9 18         cmp #$18
$1a:dd1c  ca            dex
$1a:dd1d  0c 5d cb      tsb $cb5d
$1a:dd20  cb            wai
$1a:dd21  cb            wai
$1a:dd22  00 ea         brk #$ea
$1a:dd24  0c e0 02      tsb $02e0
$1a:dd27  ed 41 e1      sbc $e141
$1a:dd2a  09 48         ora #$48
$1a:dd2c  c9 c9         cmp #$c9
$1a:dd2e  c9 c9         cmp #$c9
$1a:dd30  c9 c9         cmp #$c9
$1a:dd32  c9 4c         cmp #$4c
$1a:dd34  c9 06         cmp #$06
$1a:dd36  3d a6 ab      and $aba6,x
$1a:dd39  ad ae ad      lda $adae
$1a:dd3c  ab            plb
$1a:dd3d  a6 ab         ldx $ab
$1a:dd3f  ad ae ad      lda $adae
$1a:dd42  ab            plb
$1a:dd43  a6 ab         ldx $ab
$1a:dd45  ad ae ad      lda $adae
$1a:dd48  ab            plb
$1a:dd49  a6 ab         ldx $ab
$1a:dd4b  ad ae ad      lda $adae
$1a:dd4e  ab            plb
$1a:dd4f  a4 a9         ldy $a9
$1a:dd51  ab            plb
$1a:dd52  b0 ab         bcs $dcff
$1a:dd54  a9 a6         lda #$a6
$1a:dd56  ab            plb
$1a:dd57  ad ae ad      lda $adae
$1a:dd5a  ab            plb
$1a:dd5b  a8            tay
$1a:dd5c  ad ae ad      lda $adae
$1a:dd5f  ae ad a8      ldx $a8ad
$1a:dd62  ad ae ad      lda $adae
$1a:dd65  ae ad 48      ldx $48ad
$1a:dd68  b0 06         bcs $dd70
$1a:dd6a  a6 ab         ldx $ab
$1a:dd6c  ad ae ad      lda $adae
$1a:dd6f  ab            plb
$1a:dd70  a6 ab         ldx $ab
$1a:dd72  ad ae ad      lda $adae
$1a:dd75  ab            plb
$1a:dd76  a6 ab         ldx $ab
$1a:dd78  ad ae ad      lda $adae
$1a:dd7b  ab            plb
$1a:dd7c  a6 ab         ldx $ab
$1a:dd7e  ad ae ad      lda $adae
$1a:dd81  ab            plb
$1a:dd82  a4 a9         ldy $a9
$1a:dd84  ab            plb
$1a:dd85  b0 ab         bcs $dd32
$1a:dd87  a9 a6         lda #$a6
$1a:dd89  ab            plb
$1a:dd8a  ad ae ad      lda $adae
$1a:dd8d  ab            plb
$1a:dd8e  a8            tay
$1a:dd8f  ad ae ad      lda $adae
$1a:dd92  ae ad a8      ldx $a8ad
$1a:dd95  ad ae ad      lda $adae
$1a:dd98  ae ad 48      ldx $48ad
$1a:dd9b  b0 06         bcs $dda3
$1a:dd9d  a9 a9         lda #$a9
$1a:dd9f  a7 a7         lda [$a7]
$1a:dda1  a9 a9         lda #$a9
$1a:dda3  a9 a9         lda #$a9
$1a:dda5  a7 a7         lda [$a7]
$1a:dda7  a9 a9         lda #$a9
$1a:dda9  ae ad 0c      ldx $0cad
$1a:ddac  a9 a7         lda #$a7
$1a:ddae  24 a9         bit $a9
$1a:ddb0  06 a9         asl $a9
$1a:ddb2  a9 a7         lda #$a7
$1a:ddb4  a7 a9         lda [$a9]
$1a:ddb6  a9 a9         lda #$a9
$1a:ddb8  a9 a7         lda #$a7
$1a:ddba  a7 a9         lda [$a9]
$1a:ddbc  a9 ae         lda #$ae
$1a:ddbe  ad 0c a9      lda $a90c
$1a:ddc1  a7 24         lda [$24]
$1a:ddc3  a9 06         lda #$06
$1a:ddc5  9a            txs
$1a:ddc6  9f a1 a6 a1   sta $a1a6a1,x
$1a:ddca  9f 9a 9f a1   sta $a19f9a,x
$1a:ddce  a6 06         ldx $06
$1a:ddd0  4d a1 9f      eor $9fa1
$1a:ddd3  06 3d         asl $3d
$1a:ddd5  98            tya
$1a:ddd6  9d 9f a4      sta $a49f,x
$1a:ddd9  9f 9d 98 9d   sta $9d989d,x
$1a:dddd  9f a4 9f 9d   sta $9d9fa4,x
$1a:dde1  98            tya
$1a:dde2  9d 9f a4      sta $a49f,x
$1a:dde5  9f 9d 98 9d   sta $9d989d,x
$1a:dde9  9f a4 9f 9d   sta $9d9fa4,x
$1a:dded  98            tya
$1a:ddee  9d 9f a4      sta $a49f,x
$1a:ddf1  9f 9d 98 9d   sta $9d989d,x
$1a:ddf5  9f a4 9f 9d   sta $9d9fa4,x
$1a:ddf9  98            tya
$1a:ddfa  9d 9f a4      sta $a49f,x
$1a:ddfd  9f 9d 98 9d   sta $9d989d,x
$1a:de01  9f a4 9f 9d   sta $9d9fa4,x
$1a:de05  98            tya
$1a:de06  9d 9f a4      sta $a49f,x
$1a:de09  9f 9d 98 9d   sta $9d989d,x
$1a:de0d  9f a4 9f 9d   sta $9d9fa4,x
$1a:de11  9a            txs
$1a:de12  9f a1 a6 a1   sta $a1a6a1,x
$1a:de16  9f 9a 9f a1   sta $a19f9a,x
$1a:de1a  a6 a1         ldx $a1
$1a:de1c  9f 9a 9f a1   sta $a19f9a,x
$1a:de20  a6 a1         ldx $a1
$1a:de22  9f 9a 9f a1   sta $a19f9a,x
$1a:de26  a6 a1         ldx $a1
$1a:de28  02 9f         cop #$9f
$1a:de2a  00 ea         brk #$ea
$1a:de2c  0c e0 02      tsb $02e0
$1a:de2f  ed 53 e1      sbc $e153
$1a:de32  0a            asl a
$1a:de33  0c 5d 9d      tsb $9d5d
$1a:de36  0c 5b a2      tsb $a25b
$1a:de39  0c 59 a4      tsb $a459
$1a:de3c  0c 5d 9f      tsb $9f5d
$1a:de3f  0c 5b a4      tsb $a45b
$1a:de42  0c 59 a6      tsb $a659
$1a:de45  0c 5d 9d      tsb $9d5d
$1a:de48  0c 5b a2      tsb $a25b
$1a:de4b  0c 59 a4      tsb $a459
$1a:de4e  0c 5d 9f      tsb $9f5d
$1a:de51  0c 5b a4      tsb $a45b
$1a:de54  0c 59 a6      tsb $a659
$1a:de57  0c 5d 9d      tsb $9d5d
$1a:de5a  0c 5b a2      tsb $a25b
$1a:de5d  0c 59 a4      tsb $a459
$1a:de60  0c 5d 9f      tsb $9f5d
$1a:de63  0c 5b a4      tsb $a45b
$1a:de66  0c 59 a6      tsb $a659
$1a:de69  0c 5d 9d      tsb $9d5d
$1a:de6c  0c 5b a2      tsb $a25b
$1a:de6f  0c 59 a4      tsb $a459
$1a:de72  0c 5d 9f      tsb $9f5d
$1a:de75  0c 5b a4      tsb $a45b
$1a:de78  0c 59 a6      tsb $a659
$1a:de7b  0c 5d 9d      tsb $9d5d
$1a:de7e  0c 5b a2      tsb $a25b
$1a:de81  0c 59 a4      tsb $a459
$1a:de84  0c 5d 9f      tsb $9f5d
$1a:de87  0c 5b a4      tsb $a45b
$1a:de8a  0c 59 a6      tsb $a659
$1a:de8d  0c 5d 9d      tsb $9d5d
$1a:de90  0c 5b a2      tsb $a25b
$1a:de93  0c 59 a4      tsb $a459
$1a:de96  0c 5d 9f      tsb $9f5d
$1a:de99  0c 5b a4      tsb $a45b
$1a:de9c  0c 59 a6      tsb $a659
$1a:de9f  0c 5d 9d      tsb $9d5d
$1a:dea2  0c 5b a2      tsb $a25b
$1a:dea5  0c 59 a4      tsb $a459
$1a:dea8  0c 5d 9f      tsb $9f5d
$1a:deab  0c 5b a4      tsb $a45b
$1a:deae  0c 59 a6      tsb $a659
$1a:deb1  0c 5d 9d      tsb $9d5d
$1a:deb4  0c 5b a2      tsb $a25b
$1a:deb7  0c 59 a4      tsb $a459
$1a:deba  0c 5d 9f      tsb $9f5d
$1a:debd  0c 5b a4      tsb $a45b
$1a:dec0  0c 59 a6      tsb $a659
$1a:dec3  48            pha
$1a:dec4  c9 c9         cmp #$c9
$1a:dec6  c9 c9         cmp #$c9
$1a:dec8  c9 c9         cmp #$c9
$1a:deca  c9 c9         cmp #$c9
$1a:decc  c9 c9         cmp #$c9
$1a:dece  c9 c9         cmp #$c9
$1a:ded0  c9 4e         cmp #$4e
$1a:ded2  c9 ed         cmp #$ed
$1a:ded4  4b            phk
$1a:ded5  e1 07         sbc ($07,x)
$1a:ded7  ea            nop
$1a:ded8  00 e0         brk #$e0
$1a:deda  03 24         ora $24,s
$1a:dedc  5d a8 24      eor $24a8,x
$1a:dedf  5b            tcd
$1a:dee0  b4 18         ldy $18,x
$1a:dee2  5d b2 0c      eor $0cb2,x
$1a:dee5  ab            plb
$1a:dee6  24 ad         bit $ad
$1a:dee8  a6 24         ldx $24
$1a:deea  5b            tcd
$1a:deeb  b5 18         lda $18,x
$1a:deed  5d b4 0c      eor $0cb4,x
$1a:def0  b0 24         bcs $df16
$1a:def2  5b            tcd
$1a:def3  b2 24         lda ($24)
$1a:def5  5d a8 24      eor $24a8,x
$1a:def8  5b            tcd
$1a:def9  b4 18         ldy $18,x
$1a:defb  5d b2 0c      eor $0cb2,x
$1a:defe  ab            plb
$1a:deff  24 ad         bit $ad
$1a:df01  06 a9         asl $a9
$1a:df03  a8            tay
$1a:df04  0c a9 0c      tsb $0ca9
$1a:df07  5b            tcd
$1a:df08  b0 0c         bcs $df16
$1a:df0a  5d a9 a8      eor $a8a9,x
$1a:df0d  a9 42         lda #$42
$1a:df0f  5b            tcd
$1a:df10  b0 00         bcs $df12
$1a:df12  00 20         brk #$20
$1a:df14  00 34         brk #$34
$1a:df16  2c 53 73      bit $7353
$1a:df19  b0 79         bcs $df94
$1a:df1b  2e 7a 92      rol $927a
$1a:df1e  7c db 7e      jmp ($7edb,x)
$1a:df21  1c 83 5b      trb $5b83
$1a:df24  83 76         sta $76,s
$1a:df26  83 6f         sta $6f,s
$1a:df28  99 8b 9b      sta $9b8b,y
$1a:df2b  ca            dex
$1a:df2c  9b            txy
$1a:df2d  ca            dex
$1a:df2e  9b            txy
$1a:df2f  2f a0 2f a0   and $a02fa0
$1a:df33  19 aa 66      ora $66aa,y
$1a:df36  ab            plb
$1a:df37  02 00         cop #$00
$1a:df39  fd 0f cb      sbc $cb0f,x
$1a:df3c  af 00 00 08   lda $080000
$1a:df40  10 1e         bpl $df60
$1a:df42  1d 1f 13      ora $131f,x
$1a:df45  18            clc
$1a:df46  19 0a 74      ora $740a,y
$1a:df49  11 b0         ora ($b0),y
$1a:df4b  4e 2d 53      lsr $532d
$1a:df4e  8b            phb
$1a:df4f  a4 e2         ldy $e2
$1a:df51  fd 38 c8      sbc $c838,x
$1a:df54  4e 33 53      lsr $5333
$1a:df57  8d 64 e3      sta $e364
$1a:df5a  6d 38 e4      adc $e438
$1a:df5d  4e 3a 53      lsr $533a
$1a:df60  8d 24 e6      sta $e624
$1a:df63  ed 3a c4      sbc $c43a
$1a:df66  4e b3 53      lsr $53b3
$1a:df69  ad 64 eb      lda $eb64
$1a:df6c  7d 3a e8      adc $e83a,x
$1a:df6f  4e bc 53      lsr $53bc
$1a:df72  af a4 ea 0d   lda $0deaa4
$1a:df76  3b            tsc
$1a:df77  8c 4e e5      sty $e54e
$1a:df7a  53 ba         eor ($ba,s),y
$1a:df7c  64 ee         stz $ee
$1a:df7e  ed 3b d0      sbc $d03b
$1a:df81  4e f5 53      lsr $53f5
$1a:df84  be e4 ef      ldx $efe4,y
$1a:df87  cd 3b 80      cmp $803b
$1a:df8a  4f 22 53 c9   eor $c95322
$1a:df8e  a4 f2         ldy $f2
$1a:df90  9d 3c b4      sta $b43c,x
$1a:df93  4f 30 53 cc   eor $cc5330
$1a:df97  e4 f3         cpx $f3
$1a:df99  6d 3c e0      adc $e03c
$1a:df9c  4f 21 53 da   eor $da5321
$1a:dfa0  a4 f7         ldy $f7
$1a:dfa2  3d 3d f4      and $f43d,x
$1a:dfa5  4f 60 53 e8   eor $e85360
$1a:dfa9  e4 fa         cpx $fa
$1a:dfab  6d 3e ac      adc $ac3e
$1a:dfae  4f ad 53 ed   eor $ed53ad
$1a:dfb2  64 fb         stz $fb
$1a:dfb4  dd 3e 87      cmp $873e,x
$1a:dfb7  c0 0a         cpy #$0a
$1a:dfb9  05 10         ora $10
$1a:dfbb  9f ff ff e4   sta $e4ffff,x
$1a:dfbf  f4 c0 15      pea $15c0
$1a:dfc2  9f e0 56 18   sta $1856e0,x
$1a:dfc6  09 40         ora #$40
$1a:dfc8  e5 93         sbc $93
$1a:dfca  f3 6a         sbc ($6a,s),y
$1a:dfcc  59 0a cf      eor $cf0a,y
$1a:dfcf  48            pha
$1a:dfd0  35 3e         and $3e,x
$1a:dfd2  70 e8         bvs $dfbc
$1a:dfd4  bd 42 b3      lda $b342,x
$1a:dfd7  ee 0d 4f      inc $4f0d
$1a:dfda  0c a0 1b      tsb $1ba0
$1a:dfdd  52 89         eor ($89)
$1a:dfdf  40            rti
$1a:dfe0  2b            pld
$1a:dfe1  b4 a1         ldy $a1,x
$1a:dfe3  68            pla
$1a:dfe4  30 72         bmi $e058
$1a:dfe6  82 b0 50      brl $3099
$1a:dfe9  d2 10         cmp ($10)
$1a:dfeb  62 d2 b4      per $94c0
$1a:dfee  52 c1         eor ($c1)
$1a:dff0  40            rti
$1a:dff1  82 94 15      brl $f588
$1a:dff4  c2 86         rep #$86
$1a:dff6  90 82         bcc $df7a
$1a:dff8  16 95         asl $95,x
$1a:dffa  e2 8d         sep #$8d
$1a:dffc  f0 81         beq $df7f
$1a:dffe  94 14         sty $14,x
$1a:e000  02 8c         cop #$8c
$1a:e002  f0 00         beq $e004
$1a:e004  a1 7c         lda ($7c,x)
$1a:e006  00 28         brk #$28
$1a:e008  df 08 11 41   cmp $411108,x
$1a:e00c  44 28 cf      mvp $cf,$28
$1a:e00f  01 0a         ora ($0a,x)
$1a:e011  35 c0         and $c0,x
$1a:e013  42 81         wdm #$81
$1a:e015  ff 3a 2b 5c   sbc $5c2b3a,x
$1a:e019  0d a8 df      ora $dfa8
$1a:e01c  05 2a         ora $2a
$1a:e01e  31 c1         and ($c1),y
$1a:e020  4a            lsr a
$1a:e021  84 ff         sty $ff
$1a:e023  56 2d         lsr $2d,x
$1a:e025  f1 58         sbc ($58),y
$1a:e027  b9 85 a0      lda $a085,y
$1a:e02a  a0 78         ldy #$78
$1a:e02c  c3 ec         cmp $ec,s
$1a:e02e  a3 2b         lda $2b,s
$1a:e030  fa            plx
$1a:e031  a9 c6         lda #$c6
$1a:e033  3e 22 f6      rol $f622,x
$1a:e036  ae 06 51      ldx $5106
$1a:e039  d2 00         cmp ($00)
$1a:e03b  34 78         bit $78,x
$1a:e03d  80 0d         bra $e04c
$1a:e03f  1b            tcs
$1a:e040  20 03 47      jsr $4703
$1a:e043  08            php
$1a:e044  41 1c         eor ($1c,x)
$1a:e046  8a            txa
$1a:e047  23 47         and $47,s
$1a:e049  88            dey
$1a:e04a  41 56         eor ($56,x)
$1a:e04c  8a            txa
$1a:e04d  33 47         and ($47,s),y
$1a:e04f  08            php
$1a:e050  41 9c         eor ($9c,x)
$1a:e052  8a            txa
$1a:e053  43 47         eor $47,s
$1a:e055  88            dey
$1a:e056  41 d6         eor ($d6,x)
$1a:e058  8a            txa
$1a:e059  53 47         eor ($47,s),y
$1a:e05b  08            php
$1a:e05c  24 50         bit $50
$1a:e05e  46 1c         lsr $1c
$1a:e060  26 11         rol $11
$1a:e062  88            dey
$1a:e063  c3 d8         cmp $d8,s
$1a:e065  90 5f         bcc $e0c6
$1a:e067  e7 fc         sbc [$fc]
$1a:e069  d6 87         dec $87,x
$1a:e06b  b0 39         bcs $e0a6
$1a:e06d  a1 ec         lda ($ec,x)
$1a:e06f  1d 80 6b      ora $6b80,x
$1a:e072  24 59         bit $59
$1a:e074  1c d0 ea      trb $ead0
$1a:e077  46 b2         lsr $b2
$1a:e079  3a            dec a
$1a:e07a  92 5d         sta ($5d)
$1a:e07c  8e a0 a1      stx $a1a0
$1a:e07f  43 a8         eor $a8,s
$1a:e081  1c d8 46      trb $46d8
$1a:e084  11 6a         ora ($6a),y
$1a:e086  09 95         ora #$95
$1a:e088  25 74         and $74
$1a:e08a  13 ab         ora ($ab,s),y
$1a:e08c  31 50         and ($50),y
$1a:e08e  f6 0c         inc $0c,x
$1a:e090  d4 45         pei ($45)
$1a:e092  93 14         sta ($14,s),y
$1a:e094  91 64         sta ($64),y
$1a:e096  df 66 1a 3d   cmp $3d1a66,x
$1a:e09a  c9 be         cmp #$be
$1a:e09c  cd 54 04      cmp $0454
$1a:e09f  93 34         sta ($34,s),y
$1a:e0a1  a0 45         ldy #$45
$1a:e0a3  43 a0         eor $a0,s
$1a:e0a5  50 43         bvc $e0ea
$1a:e0a7  29 55         and #$55
$1a:e0a9  10 2d         bpl $e0d8
$1a:e0ab  fc 40 bb      jsr ($bb40,x)
$1a:e0ae  76 70         ror $70,x
$1a:e0b0  c0 ca         cpy #$ca
$1a:e0b2  87 d3         sta [$d3]
$1a:e0b4  a0 8e         ldy #$8e
$1a:e0b6  d3 ec         cmp ($ec,s),y
$1a:e0b8  42 58         wdm #$58
$1a:e0ba  cd 08 76      cmp $7608
$1a:e0bd  93 c2         sta ($c2,s),y
$1a:e0bf  92 d7         sta ($d7)
$1a:e0c1  e8            inx
$1a:e0c2  47 54         eor [$54]
$1a:e0c4  15 05         ora $05,x
$1a:e0c6  ee 84 65      inc $6584
$1a:e0c9  4c 85 0a      jmp $0a85
$1a:e0cc  3e 2a 3d      rol $3d2a,x
$1a:e0cf  29 49         and #$49
$1a:e0d1  4e 60 53      lsr $5360
$1a:e0d4  43 58         eor $58,s
$1a:e0d6  2a            rol a
$1a:e0d7  c2 0e         rep #$0e
$1a:e0d9  2a            rol a
$1a:e0da  3e 09 89      rol $8909,x
$1a:e0dd  d2 a0         cmp ($a0)
$1a:e0df  65 4a         adc $4a
$1a:e0e1  6d 0d 33      adc $330d
$1a:e0e4  91 55         sta ($55),y
$1a:e0e6  46 f7         lsr $f7
$1a:e0e8  51 8f         eor ($8f),y
$1a:e0ea  85 a1         sta $a1
$1a:e0ec  8e 5a 23      stx $235a
$1a:e0ef  44 29 a5      mvp $a5,$29
$1a:e0f2  b1 b8         lda ($b8),y
$1a:e0f4  bc 7a 20      ldy $207a,x
$1a:e0f7  14 05         trb $05
$1a:e0f9  46 d0         lsr $d0
$1a:e0fb  17 7a         ora [$7a],y
$1a:e0fd  72 da         adc ($da)
$1a:e0ff  4f 22 a2 9f   eor $9fa222
$1a:e103  52 c2         eor ($c2)
$1a:e105  08            php
$1a:e106  5d 38 21      eor $2138,x
$1a:e109  60            rts
$1a:e10a  54 67 68      mvn $68,$67
$1a:e10d  41 43         eor ($43,x)
$1a:e10f  85 00         sta $00
$1a:e111  b2 51         lda ($51)
$1a:e113  a0 82         ldy #$82
$1a:e115  43 bc         eor $bc,s
$1a:e117  8a            txa
$1a:e118  97 1c         sta [$1c],y
$1a:e11a  20 5f f7      jsr $f75f
$1a:e11d  fc 52 84      jsr ($8452,x)
$1a:e120  10 18         bpl $e13a
$1a:e122  a1 04         lda ($04,x)
$1a:e124  07 28         ora [$28]
$1a:e126  41 04         eor ($04,x)
$1a:e128  48            pha
$1a:e129  0a            asl a
$1a:e12a  48            pha
$1a:e12b  b2 43         lda ($43)
$1a:e12d  12 2c         ora ($2c)
$1a:e12f  91 4d         sta ($4d),y
$1a:e131  84 e8         sty $e8
$1a:e133  73 23         adc ($23,s),y
$1a:e135  2a            rol a
$1a:e136  0d d8 82      ora $82d8
$1a:e139  04 14         tsb $14
$1a:e13b  46 91         lsr $91
$1a:e13d  95 0a         sta $0a,x
$1a:e13f  28            plp
$1a:e140  dd 4d 18      cmp $184d,x
$1a:e143  80 44         bra $e189
$1a:e145  e0 d3         cpx #$d3
$1a:e147  2d c5 1a      and $1ac5
$1a:e14a  02 b0         cop #$b0
$1a:e14c  3f 15 19 5e   and $5e1915,x
$1a:e150  91 aa         sta ($aa),y
$1a:e152  38            sec
$1a:e153  9c 0e 64      stz $640e
$1a:e156  b5 23         lda $23,x
$1a:e158  99 2f 48      sta $482f,y
$1a:e15b  e6 54         inc $54
$1a:e15d  0a            asl a
$1a:e15e  40            rti
$1a:e15f  9c 3f bf      stz $bf3f
$1a:e162  f5 b8         sbc $b8,x
$1a:e164  7e a8 eb      ror $eba8,x
$1a:e167  70 70         bvs $e1d9
$1a:e169  94 75         sty $75,x
$1a:e16b  bc ad d0      ldy $d0ad,x
$1a:e16e  56 93         lsr $93,x
$1a:e170  84 04         sty $04
$1a:e172  20 e5 41      jsr $41e5
$1a:e175  08            php
$1a:e176  3b            tsc
$1a:e177  50 42         bvc $e1bb
$1a:e179  0d d2 46      ora $46d2
$1a:e17c  93 94         sta ($94,s),y
$1a:e17e  91 a4         sta ($a4),y
$1a:e180  ed 24 69      sbc $6924
$1a:e183  70 98         bvs $e11d
$1a:e185  c2 6f         rep #$6f
$1a:e187  07 08         ora [$08]
$1a:e189  54 9c c2      mvn $c2,$9c
$1a:e18c  2b            pld
$1a:e18d  2c 50 a1      bit $a150
$1a:e190  44 e0 ad      mvp $ad,$e0
$1a:e193  41 6f         eor ($6f,x)
$1a:e195  89 8c 46      bit #$468c
$1a:e198  44 92 11      mvp $11,$92
$1a:e19b  90 dc         bcc $e179
$1a:e19d  84 64         sty $64
$1a:e19f  dd 47 ef      cmp $ef47,x
$1a:e1a2  83 85         sta $85,s
$1a:e1a4  ee 8e 3f      inc $3f8e
$1a:e1a7  6e 1b 64      ror $641b
$1a:e1aa  82 e8 53      brl $3595
$1a:e1ad  00 fa         brk #$fa
$1a:e1af  14 c2         trb $c2
$1a:e1b1  34 28         bit $28,x
$1a:e1b3  38            sec
$1a:e1b4  1c 03 71      trb $7103
$1a:e1b7  46 25         lsr $25
$1a:e1b9  93 04         sta ($04,s),y
$1a:e1bb  3c 54 65      bit $6554,x
$1a:e1be  ea            nop
$1a:e1bf  2e c0 82      rol $82c0
$1a:e1c2  4d 80 29      eor $2980
$1a:e1c5  83 0c         sta $0c,s
$1a:e1c7  9b            txy
$1a:e1c8  24 cb         bit $cb
$1a:e1ca  26 c9         rol $c9
$1a:e1cc  34 d8         bit $d8,x
$1a:e1ce  be 8f 32      ldx $328f,y
$1a:e1d1  28            plp
$1a:e1d2  93 cc         sta ($cc,s),y
$1a:e1d4  87 e8         sta [$e8]
$1a:e1d6  5f 06 c0 2a   eor $2ac006,x
$1a:e1da  d1 b0         cmp ($b0),y
$1a:e1dc  0b            phd
$1a:e1dd  34 6c         bit $6c,x
$1a:e1df  02 24         cop #$24
$1a:e1e1  98            tya
$1a:e1e2  20 26 2b      jsr $2b26
$1a:e1e5  1d 20 4a      ora $4a20,x
$1a:e1e8  9d a1 62      sta $62a1,x
$1a:e1eb  8a            txa
$1a:e1ec  db            stp
$1a:e1ed  de 22 7c      dec $7c22,x
$1a:e1f0  35 21         and $21,x
$1a:e1f2  be 4d 80      ldx $804d,y
$1a:e1f5  cd a2 85      cmp $85a2
$1a:e1f8  8a            txa
$1a:e1f9  5f bf fe c0   eor $c0febf,x
$1a:e1fd  9c 28 70      stz $7028
$1a:e200  4f 81 7d 10   eor $107d81
$1a:e204  e0 5f         cpx #$5f
$1a:e206  45 68         eor $68
$1a:e208  1b            tcs
$1a:e209  db            stp
$1a:e20a  8a            txa
$1a:e20b  60            rts
$1a:e20c  36 08         rol $08,x
$1a:e20e  1f d2 0a 7e   ora $7e0ad2,x
$1a:e212  58            cli
$1a:e213  39 f8 4a      and $4af8,y
$1a:e216  e9 f9 2f      sbc #$2ff9
$1a:e219  29 77 cc      and #$cc77
$1a:e21c  ce 7f 43      dec $437f
$1a:e21f  ef a5 8d 1a   sbc $1a8da5
$1a:e223  03 72         ora $72,s
$1a:e225  90 52         bcc $e279
$1a:e227  5b            tcd
$1a:e228  a9 3c 72      lda #$723c
$1a:e22b  2d 61 c8      and $c861
$1a:e22e  b0 4a         bcs $e27a
$1a:e230  49 14 06      eor #$0614
$1a:e233  e1 10         sbc ($10,x)
$1a:e235  80 46         bra $e27d
$1a:e237  06 e2         asl $e2
$1a:e239  01 00         ora ($00,x)
$1a:e23b  08            php
$1a:e23c  40            rti
$1a:e23d  a0 04         ldy #$04
$1a:e23f  f2 84         sbc ($84)
$1a:e241  4c 01 85      jmp $8501
$1a:e244  08            php
$1a:e245  80 50         bra $e297
$1a:e247  00 86         brk #$86
$1a:e249  03 d7         ora $d7,s
$1a:e24b  78            sei
$1a:e24c  05 0c         ora $0c
$1a:e24e  3a            dec a
$1a:e24f  01 bf         ora ($bf,x)
$1a:e251  08            php
$1a:e252  00 2c         brk #$2c
$1a:e254  c2 e1         rep #$e1
$1a:e256  12 1b         ora ($1b)
$1a:e258  78            sei
$1a:e259  3c 66 50      bit $5066,x
$1a:e25c  40            rti
$1a:e25d  a1 d0         lda ($d0,x)
$1a:e25f  a0 85         ldy #$85
$1a:e261  3f 08 04 d0   and $d00408,x
$1a:e265  26 94         rol $94
$1a:e267  42 97         wdm #$97
$1a:e269  83 c4         sta $c4,s
$1a:e26b  dc 01 43      jml [$4301]
$1a:e26e  8a            txa
$1a:e26f  22 bc 1e 30   jsl $301ebc
$1a:e273  60            rts
$1a:e274  9a            txs
$1a:e275  45 94         eor $94
$1a:e277  de 16 1a      dec $1a16,x
$1a:e27a  31 9c         and ($9c),y
$1a:e27c  82 01 36      brl $1880
$1a:e27f  37 78         and [$78],y
$1a:e281  3c 67 01      bit $0167,x
$1a:e284  34 a4         bit $a4,x
$1a:e286  30 bd         bmi $e245
$1a:e288  6e 2b f0      ror $f02b
$1a:e28b  5e 1a ad      lsr $ad1a,x
$1a:e28e  15 7b         ora $7b,x
$1a:e290  0a            asl a
$1a:e291  5d a4 68      eor $68a4,x
$1a:e294  2d eb 71      and $71eb
$1a:e297  9d 19 d2      sta $d219,x
$1a:e29a  94 de         sty $de,x
$1a:e29c  f7 79         sbc [$79],y
$1a:e29e  50 1e         bvc $e2be
$1a:e2a0  89 40 27      bit #$2740
$1a:e2a3  04 4e         tsb $4e
$1a:e2a5  01 15         ora ($15,x)
$1a:e2a7  80 7f         bra $e328
$1a:e2a9  3f ea f6 83   and $83f6ea,x
$1a:e2ad  ad 03 24      lda $2403
$1a:e2b0  d7 03         cmp [$03],y
$1a:e2b2  d8            cld
$1a:e2b3  c0 32         cpy #$32
$1a:e2b5  5c 42 70 29   jml $297042
$1a:e2b9  41 56         eor ($56,x)
$1a:e2bb  c4 e0         cpy $e0
$1a:e2bd  5a            phy
$1a:e2be  82 fc 21      brl $04bd
$1a:e2c1  16 06         asl $06,x
$1a:e2c3  b8            clv
$1a:e2c4  83 46         sta $46,s
$1a:e2c6  e0 d7         cpx #$d7
$1a:e2c8  05 f8         ora $f8
$1a:e2ca  26 02         rol $02
$1a:e2cc  c2 a2         rep #$a2
$1a:e2ce  24 f8         bit $f8
$1a:e2d0  5c 49 c3 0f   jml $0fc349
$1a:e2d4  28            plp
$1a:e2d5  0f fc e4 64   ora $64e4fc
$1a:e2d9  e1 3d         sbc ($3d,x)
$1a:e2db  0c 1f 64      tsb $641f
$1a:e2de  4e 03 d8      lsr $d803
$1a:e2e1  30 86         bmi $e269
$1a:e2e3  88            dey
$1a:e2e4  c0 28         cpy #$28
$1a:e2e6  06 cb         asl $cb
$1a:e2e8  88            dey
$1a:e2e9  bf 16 80 e1   lda $e18016,x
$1a:e2ed  16 3e         asl $3e,x
$1a:e2ef  7a            ply
$1a:e2f0  0d 99 38      ora $3899
$1a:e2f3  5a            phy
$1a:e2f4  c3 b3         cmp $b3,s
$1a:e2f6  6d 03 1c      adc $1c03
$1a:e2f9  b6 6c         ldx $6c,y
$1a:e2fb  c4 d9         cpy $d9
$1a:e2fd  f1 0e         sbc ($0e),y
$1a:e2ff  21 0c         and ($0c,x)
$1a:e301  80 01         bra $e304
$1a:e303  c0 e2         cpy #$e2
$1a:e305  84 12         sty $12
$1a:e307  19 0e 0e      ora $0e0e,y
$1a:e30a  08            php
$1a:e30b  05 f0         ora $f0
$1a:e30d  b0 d1         bcs $e2e0
$1a:e30f  03 5e         ora $5e,s
$1a:e311  8c 0b 1a      sty $1a0b
$1a:e314  c0 51         cpy #$51
$1a:e316  e4 8d         cpx $8d
$1a:e318  63 29         adc $29,s
$1a:e31a  42 2c         wdm #$2c
$1a:e31c  a8            tay
$1a:e31d  70 52         bvs $e371
$1a:e31f  15 95         ora $95,x
$1a:e321  98            tya
$1a:e322  09 d2 ba      ora #$bad2
$1a:e325  96 08         stx $08,y
$1a:e327  c6 25         dec $25
$1a:e329  f1 47         sbc ($47),y
$1a:e32b  82 2d a0      brl $835b
$1a:e32e  c5 13         cmp $13
$1a:e330  88            dey
$1a:e331  5c cb 06 80   jml $8006cb
$1a:e335  02 f9         cop #$f9
$1a:e337  c2 2c         rep #$2c
$1a:e339  86 63         stx $63
$1a:e33b  47 01         eor [$01]
$1a:e33d  7c 8e 01      jmp ($018e,x)
$1a:e340  74 33         stz $33,x
$1a:e342  12 6c         ora ($6c)
$1a:e344  4d b7 02      eor $02b7
$1a:e347  12 9c         ora ($9c)
$1a:e349  22 19 04 13   jsl $130419
$1a:e34d  09 f8 23      ora #$23f8
$1a:e350  90 47         bcc $e399
$1a:e352  08            php
$1a:e353  44 60 11      mvp $11,$60
$1a:e356  62 4a c0      per $a3a3
$1a:e359  ca            dex
$1a:e35a  27 0e         and [$0e]
$1a:e35c  e0 14         cpx #$14
$1a:e35e  8a            txa
$1a:e35f  13 05         ora ($05,s),y
$1a:e361  6a            ror a
$1a:e362  8c 0e 0b      sty $0b0e
$1a:e365  0e 80 35      asl $3580
$1a:e368  40            rti
$1a:e369  4c 07 00      jmp $0007
$1a:e36c  8b            phb
$1a:e36d  ac 45 94      ldy $9445
$1a:e370  b0 28         bcs $e39a
$1a:e372  3c 0e 1d      bit $1d0e,x
$1a:e375  c1 24         cmp ($24,x)
$1a:e377  84 24         sty $24
$1a:e379  92 11         sta ($11)
$1a:e37b  16 a8         asl $a8,x
$1a:e37d  b6 41         ldx $41,y
$1a:e37f  88            dey
$1a:e380  0e 30 61      asl $6130
$1a:e383  01 c0         ora ($c0,x)
$1a:e385  23 50         and $50,s
$1a:e387  0f b0 84 d9   ora $d984b0
$1a:e38b  c3 03         cmp $03,s
$1a:e38d  33 0b         and ($0b,s),y
$1a:e38f  fc a0 e7      jsr ($e7a0,x)
$1a:e392  e0 6a         cpx #$6a
$1a:e394  8c 1e 01      sty $011e
$1a:e397  05 81         ora $81
$1a:e399  be 03 f8      ldx $f803,y
$1a:e39c  c3 18         cmp $18,s
$1a:e39e  9b            txy
$1a:e39f  90 d9         bcc $e37a
$1a:e3a1  86 ba         stx $ba
$1a:e3a3  18            clc
$1a:e3a4  63 fc         adc $fc,s
$1a:e3a6  a0 b0         ldy #$b0
$1a:e3a8  76 d9         ror $d9,x
$1a:e3aa  41 47         eor ($47,x)
$1a:e3ac  80 e2         bra $e390
$1a:e3ae  11 58         ora ($58),y
$1a:e3b0  43 58         eor $58,s
$1a:e3b2  a3 fe         lda $fe,s
$1a:e3b4  07 9a         ora [$9a]
$1a:e3b6  c8            iny
$1a:e3b7  18            clc
$1a:e3b8  e1 01         sbc ($01,x)
$1a:e3ba  25 03         and $03
$1a:e3bc  e0 56         cpx #$56
$1a:e3be  82 3d 31      brl $14fe
$1a:e3c1  99 32 11      sta $1132,y
$1a:e3c4  68            pla
$1a:e3c5  0b            phd
$1a:e3c6  42 80         wdm #$80
$1a:e3c8  70 8d         bvs $e357
$1a:e3ca  3e c7 1f      rol $1fc7,x
$1a:e3cd  13 1c         ora ($1c,s),y
$1a:e3cf  d5 5b         cmp $5b,x
$1a:e3d1  d0 50         bne $e423
$1a:e3d3  92 f8         sta ($f8)
$1a:e3d5  3c 09 3f      bit $3f09,x
$1a:e3d8  6b            rtl
$1a:e3d9  0f 51 50 9e   ora $9e5051
$1a:e3dd  45 7d         eor $7d
$1a:e3df  c1 8b         cmp ($8b,x)
$1a:e3e1  82 43 08      brl $ec27
$1a:e3e4  5e 91 54      lsr $5491,x
$1a:e3e7  4d d1 a0      eor $a0d1
$1a:e3ea  36 86         rol $86,x
$1a:e3ec  1b            tcs
$1a:e3ed  03 da         ora $da,s
$1a:e3ef  2a            rol a
$1a:e3f0  89 d6 34      bit #$34d6
$1a:e3f3  05 f7         ora $f7
$1a:e3f5  b3 fb         lda ($fb,s),y
$1a:e3f7  4a            lsr a
$1a:e3f8  e0 4d         cpx #$4d
$1a:e3fa  2b            pld
$1a:e3fb  9d 36 ae      sta $ae36,x
$1a:e3fe  e4 da         cpx $da
$1a:e400  bd 7c 0d      lda $0d7c,x
$1a:e403  fc 47 02      jsr ($0247,x)
$1a:e406  71 1c         adc ($1c),y
$1a:e408  e9 c5 77      sbc #$77c5
$1a:e40b  27 14         and [$14]
$1a:e40d  5b            tcd
$1a:e40e  f2 08         sbc ($08)
$1a:e410  04 a0         tsb $a0
$1a:e412  e6 67         inc $67
$1a:e414  60            rts
$1a:e415  56 02         lsr $02,x
$1a:e417  88            dey
$1a:e418  22 11 08 46   jsl $460811
$1a:e41c  1a            inc a
$1a:e41d  09 01 5c      ora #$5c01
$1a:e420  0c 23 11      tsb $1123
$1a:e423  04 80         tsb $80
$1a:e425  43 21         eor $21,s
$1a:e427  90 88         bcc $e3b1
$1a:e429  c6 69         dec $69
$1a:e42b  1e 47 50      asl $5047,x
$1a:e42e  c5 22         cmp $22
$1a:e430  01 06         ora ($06,x)
$1a:e432  59 04 40      eor $4004,y
$1a:e435  43 d1         eor $d1,s
$1a:e437  20 a2 0a      jsr $0aa2
$1a:e43a  22 08 5a 01   jsl $015a08
$1a:e43e  a0 52         ldy #$52
$1a:e440  12 bc         ora ($bc)
$1a:e442  68            pla
$1a:e443  86 70         stx $70
$1a:e445  90 9d         bcc $e3e4
$1a:e447  e9 12 08      sbc #$0812
$1a:e44a  53 88         eor ($88,s),y
$1a:e44c  a2 d2         ldx #$d2
$1a:e44e  1a            inc a
$1a:e44f  92 46         sta ($46)
$1a:e451  b8            clv
$1a:e452  26 92         rol $92
$1a:e454  22 a1 48 12   jsl $1248a1
$1a:e458  a1 22         lda ($22,x)
$1a:e45a  2a            rol a
$1a:e45b  f4 81 2d      pea $2d81
$1a:e45e  90 ed         bcc $e44d
$1a:e460  10 b6         bpl $e418
$1a:e462  38            sec
$1a:e463  c3 d0         cmp $d0,s
$1a:e465  a1 66         lda ($66,x)
$1a:e467  44 04 26      mvp $26,$04
$1a:e46a  0e 85 0b      asl $0b85
$1a:e46d  3a            dec a
$1a:e46e  3c 21 11      bit $1121,x
$1a:e471  08            php
$1a:e472  2c 6e de      bit $de6e
$1a:e475  9d 44 3f      sta $3f44,x
$1a:e478  a6 3d         ldx $3d
$1a:e47a  53 e0         eor ($e0,s),y
$1a:e47c  0d 82 c2      ora $c282
$1a:e47f  c4 c1         cpy $c1
$1a:e481  69 67 04      adc #$0467
$1a:e484  36 06         rol $06,x
$1a:e486  26 0b         rol $0b
$1a:e488  50 8b         bvc $e415
$1a:e48a  a1 50         lda ($50,x)
$1a:e48c  e8            inx
$1a:e48d  34 6a         bit $6a,x
$1a:e48f  fe 30 f2      inc $f230,x
$1a:e492  0f 94 bc c6   ora $c6bc94
$1a:e496  b0 78         bcs $e510
$1a:e498  48            pha
$1a:e499  98            tya
$1a:e49a  2d 8a 04      and $048a
$1a:e49d  b6 88         ldx $88,y
$1a:e49f  bd 2b ea      lda $ea2b,x
$1a:e4a2  6f 87 c2 51   adc $51c287
$1a:e4a6  e1 9c         sbc ($9c,x)
$1a:e4a8  45 b4         eor $b4
$1a:e4aa  0e 01 23      asl $2301
$1a:e4ad  80 48         bra $e4f7
$1a:e4af  a0 10         ldy #$10
$1a:e4b1  23 11         and $11,s
$1a:e4b3  c1 cc         cmp ($cc,x)
$1a:e4b5  01 13         ora ($13,x)
$1a:e4b7  85 c5         sta $c5
$1a:e4b9  21 19         and ($19,x)
$1a:e4bb  ac 23 10      ldy $1023
$1a:e4be  21 f0         and ($f0,x)
$1a:e4c0  38            sec
$1a:e4c1  8f 19 da 21   sta $21da19
$1a:e4c5  d0 8a         bne $e451
$1a:e4c7  69 94 e3      adc #$e394
$1a:e4ca  16 81         asl $81,x
$1a:e4cc  44 bc cd      mvp $cd,$bc
$1a:e4cf  80 8b         bra $e45c
$1a:e4d1  40            rti
$1a:e4d2  21 10         and ($10,x)
$1a:e4d4  cf 31 68 04   cmp $046831
$1a:e4d8  01 1c         ora ($1c,x)
$1a:e4da  80 62         bra $e53e
$1a:e4dc  84 a1         sty $a1
$1a:e4de  03 89         ora $89,s
$1a:e4e0  c4 a0         cpy $a0
$1a:e4e2  5a            phy
$1a:e4e3  6c 24 1a      jmp ($1a24)
$1a:e4e6  01 25         ora ($25,x)
$1a:e4e8  5e 8a f1      lsr $f18a,x
$1a:e4eb  21 0c         and ($0c,x)
$1a:e4ed  30 83         bmi $e472
$1a:e4ef  45 5b         eor $5b
$1a:e4f1  40            rti
$1a:e4f2  39 28 2b      and $2b28,y
$1a:e4f5  68            pla
$1a:e4f6  06 43         asl $43
$1a:e4f8  03 8c         ora $8c,s
$1a:e4fa  40            rti
$1a:e4fb  a1 dc         lda ($dc,x)
$1a:e4fd  65 a8         adc $a8
$1a:e4ff  45 a1         eor $a1
$1a:e501  b0 08         bcs $e50b
$1a:e503  c6 2d         dec $2d
$1a:e505  6a            ror a
$1a:e506  32 38         and ($38)
$1a:e508  94 1b         sty $1b,x
$1a:e50a  18            clc
$1a:e50b  df 00 98 35   cmp $359800,x
$1a:e50f  43 36         eor $36,s
$1a:e511  df 03 a0 42   cmp $42a003,x
$1a:e515  22 1b 66 f8   jsl $f8661b
$1a:e519  43 8c         eor $8c,s
$1a:e51b  01 08         ora ($08,x)
$1a:e51d  3f 81 70 24   and $247081,x
$1a:e521  f0 08         beq $e52b
$1a:e523  f3 0c         sbc ($0c,s),y
$1a:e525  17 ab         ora [$ab],y
$1a:e527  00 8f         brk #$8f
$1a:e529  c2 22         rep #$22
$1a:e52b  70 4c         bvs $e579
$1a:e52d  d9 c8 21      cmp $21c8,y
$1a:e530  11 f8         ora ($f8),y
$1a:e532  64 2d         stz $2d
$1a:e534  52 31         eor ($31)
$1a:e536  e8            inx
$1a:e537  4c 1e 20      jmp $201e
$1a:e53a  7f 18 9c 52   adc $529c18,x
$1a:e53e  09 13 eb      ora #$eb13
$1a:e541  71 20         adc ($20),y
$1a:e543  10 a8         bpl $e4ed
$1a:e545  ec 0e 28      cpx $280e
$1a:e548  39 00 b0      and $b000,y
$1a:e54b  49 61 70      eor #$7061
$1a:e54e  cf 3b 7c 13   cmp $137c3b
$1a:e552  01 16         ora ($16,x)
$1a:e554  80 f5         bra $e54b
$1a:e556  9e 81 0a      stz $0a81,x
$1a:e559  8a            txa
$1a:e55a  c3 e0         cmp $e0,s
$1a:e55c  1b            tcs
$1a:e55d  6c 24 02      jmp ($0224)
$1a:e560  07 24         ora [$24]
$1a:e562  53 82         eor ($82,s),y
$1a:e564  34 52         bit $52,x
$1a:e566  e0 a7         cpx #$a7
$1a:e568  0e b0 b0      asl $b0b0
$1a:e56b  22 b0 a0 18   jsl $18a0b0
$1a:e56f  6a            ror a
$1a:e570  12 a3         ora ($a3)
$1a:e572  29 80 11      and #$1180
$1a:e575  40            rti
$1a:e576  ac 90 c2      ldy $c290
$1a:e579  e8            inx
$1a:e57a  44 22 2f      mvp $2f,$22
$1a:e57d  d0 d4         bne $e553
$1a:e57f  1c 82 43      trb $4382
$1a:e582  08            php
$1a:e583  83 c3         sta $c3,s
$1a:e585  58            cli
$1a:e586  a2 07         ldx #$07
$1a:e588  08            php
$1a:e589  a4 01         ldy $01
$1a:e58b  d0 09         bne $e596
$1a:e58d  d0 84         bne $e513
$1a:e58f  8c 03 ce      sty $ce03
$1a:e592  72 07         adc ($07)
$1a:e594  98            tya
$1a:e595  44 20 9b      mvp $9b,$20
$1a:e598  96 d8         stx $d8,y
$1a:e59a  44 23 23      mvp $23,$23
$1a:e59d  e0 e3         cpx #$e3
$1a:e59f  33 42         and ($42,s),y
$1a:e5a1  03 28         ora $28,s
$1a:e5a3  86 42         stx $42
$1a:e5a5  38            sec
$1a:e5a6  ea            nop
$1a:e5a7  a1 90         lda ($90,x)
$1a:e5a9  84 01         sty $01
$1a:e5ab  98            tya
$1a:e5ac  31 88         and ($88),y
$1a:e5ae  88            dey
$1a:e5af  94 11         sty $11,x
$1a:e5b1  a3 05         lda $05,s
$1a:e5b3  92 07         sta ($07)
$1a:e5b5  80 fe         bra $e5b5
$1a:e5b7  2f 20 08 06   and $060820
$1a:e5bb  e1 9a         sbc ($9a,x)
$1a:e5bd  10 99         bpl $e558
$1a:e5bf  04 15         tsb $15
$1a:e5c1  dc 3f cf      jml [$cf3f]
$1a:e5c4  fb            xce
$1a:e5c5  f4 1f a0      pea $a01f
$1a:e5c8  53 08         eor ($08,s),y
$1a:e5ca  82 0c 13      brl $f8d9
$1a:e5cd  62 60 3c      per $2230
$1a:e5d0  59 4b de      eor $de4b,y
$1a:e5d3  c2 94         rep #$94
$1a:e5d5  03 47         ora $47,s
$1a:e5d7  a8            tay
$1a:e5d8  c3 36         cmp $36,s
$1a:e5da  e2 12         sep #$12
$1a:e5dc  d9 24 90      cmp $9024,y
$1a:e5df  be 05 f3      ldx $f305,y
$1a:e5e2  77 82         adc [$82],y
$1a:e5e4  e0 60         cpx #$60
$1a:e5e6  11 78         ora ($78),y
$1a:e5e8  07 e0         ora [$e0]
$1a:e5ea  b4 6e         ldy $6e,x
$1a:e5ec  21 84         and ($84,x)
$1a:e5ee  41 e0         eor ($e0,x)
$1a:e5f0  10 7e         bpl $e670
$1a:e5f2  42 d0         wdm #$d0
$1a:e5f4  96 e1         stx $e1,y
$1a:e5f6  d8            cld
$1a:e5f7  7b            tdc
$1a:e5f8  0b            phd
$1a:e5f9  60            rts
$1a:e5fa  20 ff 86      jsr $86ff
$1a:e5fd  19 31 86      ora $8631,y
$1a:e600  81 06         sta ($06,x)
$1a:e602  80 45         bra $e649
$1a:e604  55 4e         eor $4e,x
$1a:e606  d1 08         cmp ($08),y
$1a:e608  04 28         tsb $28
$1a:e60a  2c 0b 92      bit $920b
$1a:e60d  70 02         bvs $e611
$1a:e60f  fc e1 10      jsr ($10e1,x)
$1a:e612  b8            clv
$1a:e613  1c 13 d2      trb $d213
$1a:e616  97 18         sta [$18],y
$1a:e618  9b            txy
$1a:e619  c0 3d         cpy #$3d
$1a:e61b  09 20 85      ora #$8520
$1a:e61e  c2 1e         rep #$1e
$1a:e620  03 40         ora $40,s
$1a:e622  54 0b dc      mvn $dc,$0b
$1a:e625  68            pla
$1a:e626  0a            asl a
$1a:e627  72 8c         adc ($8c)
$1a:e629  35 a1         and $a1,x
$1a:e62b  6c 30 85      jmp ($8530)
$1a:e62e  d2 40         cmp ($40)
$1a:e630  58            cli
$1a:e631  27 08         and [$08]
$1a:e633  80 76         bra $e6ab
$1a:e635  58            cli
$1a:e636  64 28         stz $28
$1a:e638  10 08         bpl $e642
$1a:e63a  32 c6         and ($c6)
$1a:e63c  11 c9         ora ($c9),y
$1a:e63e  00 80         brk #$80
$1a:e640  b0 b9         bcs $e5fb
$1a:e642  20 40 80      jsr $8040
$1a:e645  44 95 43      mvp $43,$95
$1a:e648  f9 6c 34      sbc $346c,y
$1a:e64b  1d a2 10      ora $10a2,x
$1a:e64e  8e 51 38      stx $3851
$1a:e651  85 01         sta $01
$1a:e653  da            phx
$1a:e654  4b            phk
$1a:e655  8c 34 50      sty $5034
$1a:e658  1d b2 e8      ora $e8b2,x
$1a:e65b  8b            phb
$1a:e65c  87 b6         sta [$b6]
$1a:e65e  01 03         ora ($03,x)
$1a:e660  28            plp
$1a:e661  3b            tsc
$1a:e662  43 96         eor $96,s
$1a:e664  39 13 28      and $2813,y
$1a:e667  f2 db         sbc ($db)
$1a:e669  82 d3 22      brl $093f
$1a:e66c  3b            tsc
$1a:e66d  b8            clv
$1a:e66e  04 a6         tsb $a6
$1a:e670  4e e0 10      lsr $10e0
$1a:e673  87 e9         sta [$e9]
$1a:e675  f4 49 11      pea $1149
$1a:e678  1c 8c 4c      trb $4c8c
$1a:e67b  42 1f         wdm #$1f
$1a:e67d  97 a0         sta [$a0],y
$1a:e67f  ae 01 40      ldx $4001
$1a:e682  00 10         brk #$10
$1a:e684  70 01         bvs $e687
$1a:e686  64 88         stz $88
$1a:e688  24 0d         bit $0d
$1a:e68a  01 28         ora ($28,x)
$1a:e68c  12 62         ora ($62)
$1a:e68e  20 54 12      jsr $1254
$1a:e691  f0 c2         beq $e655
$1a:e693  3d 66 33      and $3366,x
$1a:e696  65 01         adc $01
$1a:e698  c4 82         cpy $82
$1a:e69a  21 fb         and ($fb,x)
$1a:e69c  31 93         and ($93),y
$1a:e69e  5c 40 20 57   jml $572040
$1a:e6a2  18            clc
$1a:e6a3  41 6c         eor ($6c,x)
$1a:e6a5  82 21 1a      brl $00c9
$1a:e6a8  23 2a         and $2a,s
$1a:e6aa  c4 20         cpy $20
$1a:e6ac  10 55         bpl $e703
$1a:e6ae  88            dey
$1a:e6af  42 f1         wdm #$f1
$1a:e6b1  af 62 84 40   lda $408462
$1a:e6b5  f3 b0         sbc ($b0,s),y
$1a:e6b7  08            php
$1a:e6b8  08            php
$1a:e6b9  94 16         sty $16,x
$1a:e6bb  21 aa         and ($aa,x)
$1a:e6bd  5b            tcd
$1a:e6be  19 f5 9e      ora $9ef5,y
$1a:e6c1  a6 67         ldx $67
$1a:e6c3  0c f3 d8      tsb $d8f3
$1a:e6c6  e1 18         sbc ($18,x)
$1a:e6c8  e0 21 35      cpx #$3521
$1a:e6cb  00 14         brk #$14
$1a:e6cd  8b            phb
$1a:e6ce  56 7a         lsr $7a,x
$1a:e6d0  8c 1a 04      sty $041a
$1a:e6d3  b9 0c f8      lda $f80c,y
$1a:e6d6  f0 9a         beq $e672
$1a:e6d8  01 8f         ora ($8f,x)
$1a:e6da  13 9c         ora ($9c,s),y
$1a:e6dc  20 14 8b      jsr $8b14
$1a:e6df  90 1a         bcc $e6fb
$1a:e6e1  b0 a0         bcs $e683
$1a:e6e3  f5 90         sbc $90,x
$1a:e6e5  42 68         wdm #$68
$1a:e6e7  ab            plb
$1a:e6e8  43 d4         eor $d4,s
$1a:e6ea  66 05         ror $05
$1a:e6ec  68            pla
$1a:e6ed  1a            inc a
$1a:e6ee  86 88         stx $88
$1a:e6f0  52 a0         eor ($a0)
$1a:e6f2  28            plp
$1a:e6f3  0a            asl a
$1a:e6f4  0f 5c 66 13   ora $13665c
$1a:e6f8  bf f3 91 3e   lda $3e91f3,x
$1a:e6fc  c5 1f         cmp $1f
$1a:e6fe  72 7b         adc ($7b)
$1a:e700  cc 4a b6      cpy $b64a
$1a:e703  fe 63 23      inc $2363,x
$1a:e706  c9 83 ec      cmp #$ec83
$1a:e709  6e 98 cd      ror $cd98
$1a:e70c  a0 44 a4      ldy #$a444
$1a:e70f  86 41         stx $41
$1a:e711  09 62 1d      ora #$1d62
$1a:e714  08            php
$1a:e715  e3 cb         sbc $cb,s
$1a:e717  cc e3 0e      cpy $0ee3
$1a:e71a  03 a4         ora $a4,s
$1a:e71c  78            sei
$1a:e71d  1d e6 71      ora $71e6,x
$1a:e720  9e 08 d2      stz $d208,x
$1a:e723  98            tya
$1a:e724  2a            rol a
$1a:e725  f2 08         sbc ($08)
$1a:e727  cf 84 69 4e   cmp $4e6984
$1a:e72b  82 00 00      brl $e72e
$1a:e72e  08            php
$1a:e72f  81 40         sta ($40,x)
$1a:e731  1d e9 08      ora $08e9,x
$1a:e734  aa            tax
$1a:e735  74 38         stz $38,x
$1a:e737  4f 71 e0 bf   eor $bfe071
$1a:e73b  41 ee         eor ($ee,x)
$1a:e73d  95 ef         sta $ef,x
$1a:e73f  3c 2a 3e      bit $3e2a,x
$1a:e742  07 19         ora [$19]
$1a:e744  78            sei
$1a:e745  24 23         bit $23
$1a:e747  c0 c1 08      cpy #$08c1
$1a:e74a  83 dc         sta $dc,s
$1a:e74c  02 e4         cop #$e4
$1a:e74e  ff 27 ba 40   sbc $40ba27,x
$1a:e752  04 ea         tsb $ea
$1a:e754  f7 47         sbc [$47],y
$1a:e756  d9 f0 87      cmp $87f0,y
$1a:e759  22 fe 30 b9   jsl $b930fe
$1a:e75d  57 bd         eor [$bd],y
$1a:e75f  60            rts
$1a:e760  91 24         sta ($24),y
$1a:e762  00 38         brk #$38
$1a:e764  89 82 51      bit #$5182
$1a:e767  1a            inc a
$1a:e768  6c 2a 7b      jmp ($7b2a)
$1a:e76b  0a            asl a
$1a:e76c  8e 15 c6      stx $c615
$1a:e76f  5b            tcd
$1a:e770  0a            asl a
$1a:e771  c0 42 a9      cpy #$a942
$1a:e774  d4 a8         pei ($a8)
$1a:e776  e1 94         sbc ($94,x)
$1a:e778  0a            asl a
$1a:e779  21 4a         and ($4a,x)
$1a:e77b  96 14         stx $14,y
$1a:e77d  47 8d         eor [$8d]
$1a:e77f  0a            asl a
$1a:e780  b2 42         lda ($42)
$1a:e782  ba            tsx
$1a:e783  d4 ab         pei ($ab)
$1a:e785  21 d4         and ($d4,x)
$1a:e787  0e 22 76      asl $7622
$1a:e78a  13 b8         ora ($b8,s),y
$1a:e78c  9c 0c 0e      stz $0e0c
$1a:e78f  14 a8         trb $a8
$1a:e791  fd 3a a6      sbc $a63a,x
$1a:e794  65 00         adc $00
$1a:e796  79 c7 21      adc $21c7,y
$1a:e799  d5 38         cmp $38,x
$1a:e79b  54 b2 15      mvn $15,$b2
$1a:e79e  0e 85 4f      asl $4f85
$1a:e7a1  21 51         and ($51,x)
$1a:e7a3  e8            inx
$1a:e7a4  54 34 d6      mvn $d6,$34
$1a:e7a7  09 d0 a5      ora #$a5d0
$1a:e7aa  4f 14 a0 51   eor $51a014
$1a:e7ae  0a            asl a
$1a:e7af  74 2c         stz $2c,x
$1a:e7b1  a2 10 89      ldx #$8910
$1a:e7b4  6c 22 3b      jmp ($3b22)
$1a:e7b7  08            php
$1a:e7b8  9e c2 21      stz $21c2,x
$1a:e7bb  8a            txa
$1a:e7bc  f1 5a         sbc ($5a),y
$1a:e7be  02 d0         cop #$d0
$1a:e7c0  4c a3 2c      jmp $2ca3
$1a:e7c3  50 8c         bvc $e751
$1a:e7c5  b6 bd         ldx $bd,y
$1a:e7c7  e9 a7 58      sbc #$58a7
$1a:e7ca  e9 d7 34      sbc #$34d7
$1a:e7cd  68            pla
$1a:e7ce  a6 00         ldx $00
$1a:e7d0  b8            clv
$1a:e7d1  12 e4         ora ($e4)
$1a:e7d3  b8            clv
$1a:e7d4  43 ac         eor $ac,s
$1a:e7d6  71 ef         adc ($ef),y
$1a:e7d8  4a            lsr a
$1a:e7d9  4c 6e 70      jmp $706e
$1a:e7dc  a9 f4 2a      lda #$2af4
$1a:e7df  9f 0e 95 b8   sta $b8950e,x
$1a:e7e3  c1 be         cmp ($be,x)
$1a:e7e5  c4 70         cpy $70
$1a:e7e7  a7 5d         lda [$5d]
$1a:e7e9  09 65 5e      ora #$5e65
$1a:e7ec  f7 c2         sbc [$c2],y
$1a:e7ee  a7 f5         lda [$f5]
$1a:e7f0  ee fa 74      inc $74fa
$1a:e7f3  53 41         eor ($41,s),y
$1a:e7f5  0f 4e 8c be   ora $be8c4e
$1a:e7f9  94 02         sty $02,x
$1a:e7fb  08            php
$1a:e7fc  69 34 5f      adc #$5f34
$1a:e7ff  c4 0a         cpy $0a
$1a:e801  04 f0         tsb $f0
$1a:e803  27 82         and [$82]
$1a:e805  7f 1e 7c 04   adc $047c1e,x
$1a:e809  7a            ply
$1a:e80a  3d df 87      and $87df,x
$1a:e80d  5d 0a 28      eor $280a,x
$1a:e810  af 5c fb dc   lda $dcfb5c
$1a:e814  00 e0         brk #$e0
$1a:e816  fb            xce
$1a:e817  10 30         bpl $e849
$1a:e819  42 a1         wdm #$a1
$1a:e81b  51 a8         eor ($a8),y
$1a:e81d  54 22 15      mvn $15,$22
$1a:e820  09 85 63      ora #$6385
$1a:e823  d1 e0         cmp ($e0),y
$1a:e825  e5 10         sbc $10
$1a:e827  60            rts
$1a:e828  47 c7         eor [$c7]
$1a:e82a  e3 2f         sbc $2f,s
$1a:e82c  71 84         adc ($84),y
$1a:e82e  22 a8 4f 0e   jsl $0e4fa8
$1a:e832  87 0b         sta [$0b]
$1a:e834  a1 c1         lda ($c1,x)
$1a:e836  00 80         brk #$80
$1a:e838  64 44         stz $44
$1a:e83a  81 df         sta ($df,x)
$1a:e83c  7b            tdc
$1a:e83d  8e 3d ee      stx $ee3d
$1a:e840  14 e8         trb $e8
$1a:e842  d8            cld
$1a:e843  fc 03 21      jsr ($2103,x)
$1a:e846  0e 8d 86      asl $868d
$1a:e849  42 85         wdm #$85
$1a:e84b  00 37         brk #$37
$1a:e84d  85 7a         sta $7a
$1a:e84f  33 5e         and ($5e,s),y
$1a:e851  8c 57 a0      sty $a057
$1a:e854  f5 e8         sbc $e8,x
$1a:e856  35 7a         and $7a,x
$1a:e858  2f 5e 8b 57   and $578b5e
$1a:e85c  a0 b1 e8      ldy #$e8b1
$1a:e85f  2d 7a 2b      and $2b7a
$1a:e862  1e 42 04      asl $0442,x
$1a:e865  1a            inc a
$1a:e866  3d 07 8f      and $8f07,x
$1a:e869  45 a3         eor $a3
$1a:e86b  d1 78         cmp ($78),y
$1a:e86d  14 01         trb $01
$1a:e86f  1e 11 e8      asl $e811,x
$1a:e872  c4 7a         cpy $7a
$1a:e874  32 41         and ($41)
$1a:e876  08            php
$1a:e877  f5 bc         sbc $bc,x
$1a:e879  46 3e         lsr $3e
$1a:e87b  f7 b8         sbc [$b8],y
$1a:e87d  c7 de         cmp [$de]
$1a:e87f  e2 46         sep #$46
$1a:e881  12 c9         ora ($c9)
$1a:e883  a7 82         lda [$82]
$1a:e885  53 5e         eor ($5e,s),y
$1a:e887  94 57         sty $57,x
$1a:e889  a7 35         lda [$35]
$1a:e88b  e9 c5 7a      sbc #$7ac5
$1a:e88e  4f 5e 93 57   eor $57935e
$1a:e892  a6 f5         ldx $f5
$1a:e894  e9 b5 7a      sbc #$7ab5
$1a:e897  4b            phk
$1a:e898  1e 92 d7      asl $d792,x
$1a:e89b  a6 b1         ldx $b1
$1a:e89d  e6 20         inc $20
$1a:e89f  49 a3 d2      eor #$d2a3
$1a:e8a2  78            sei
$1a:e8a3  f4 da 3d      pea $3dda
$1a:e8a6  37 8f         and [$8f],y
$1a:e8a8  4a            lsr a
$1a:e8a9  23 d2         and $d2,s
$1a:e8ab  98            tya
$1a:e8ac  f4 e2 3d      pea $3de2
$1a:e8af  39 8f 4a      and $4a8f,y
$1a:e8b2  92 23         sta ($23)
$1a:e8b4  3a            dec a
$1a:e8b5  8f 4e d3 e6   sta $e6d34e
$1a:e8b9  34 15         bit $15,x
$1a:e8bb  3a            dec a
$1a:e8bc  97 82         sta [$82],y
$1a:e8be  93 5e         sta ($5e,s),y
$1a:e8c0  a4 57         ldy $57
$1a:e8c2  ab            plb
$1a:e8c3  35 ea         and $ea,x
$1a:e8c5  c5 7a         cmp $7a
$1a:e8c7  8f 5e a3 57   sta $57a35e
$1a:e8cb  aa            tax
$1a:e8cc  f5 ea         sbc $ea,x
$1a:e8ce  b5 7a         lda $7a,x
$1a:e8d0  8b            phb
$1a:e8d1  1e a2 d7      asl $d7a2,x
$1a:e8d4  aa            tax
$1a:e8d5  b1 e0         lda ($e0),y
$1a:e8d7  20 51 a3      jsr $a351
$1a:e8da  d4 78         pei ($78)
$1a:e8dc  f5 5a         sbc $5a,x
$1a:e8de  3d 57 8f      and $8f57,x
$1a:e8e1  52 23         eor ($23)
$1a:e8e3  d4 98         pei ($98)
$1a:e8e5  f5 62         sbc $62,x
$1a:e8e7  3d 59 8f      and $8f59,x
$1a:e8ea  52 a3         eor ($a3)
$1a:e8ec  d4 b8         pei ($b8)
$1a:e8ee  f5 6a         sbc $6a,x
$1a:e8f0  3d 5b 8f      and $8f5b,x
$1a:e8f3  53 12         eor ($12,s),y
$1a:e8f5  23 5c         and $5c,s
$1a:e8f7  47 85         eor [$85]
$1a:e8f9  7b            tdc
$1a:e8fa  d7 0a         cmp [$0a],y
$1a:e8fc  8e 09 c6      stx $c609
$1a:e8ff  59 5e b4      eor $b45e,y
$1a:e902  d7 ad         cmp [$ad],y
$1a:e904  15 eb         ora $eb,x
$1a:e906  cd 7a f1      cmp $f17a
$1a:e909  5e b3 d7      lsr $d7b3,x
$1a:e90c  ac d5 eb      ldy $ebd5
$1a:e90f  bd 7a ed      lda $ed7a,x
$1a:e912  5e b2 c7      lsr $c7b2,x
$1a:e915  ac b5 eb      ldy $ebb5
$1a:e918  ac 78 88      ldy $8878
$1a:e91b  16 68         asl $68,x
$1a:e91d  f5 9e         sbc $9e,x
$1a:e91f  3d 76 8f      and $8f76,x
$1a:e922  5d e3 d6      eor $d6e3,x
$1a:e925  88            dey
$1a:e926  f5 a6         sbc $a6,x
$1a:e928  3d 78 8f      and $8f78,x
$1a:e92b  5e 63 d6      lsr $d663,x
$1a:e92e  a8            tay
$1a:e92f  f5 ae         sbc $ae,x
$1a:e931  3d 7a 8f      and $8f7a,x
$1a:e934  5e e3 d6      lsr $d6e3,x
$1a:e937  c8            iny
$1a:e938  f5 b6         sbc $b6,x
$1a:e93a  3d 7c 8f      and $8f7c,x
$1a:e93d  5f 44 e3 3c   eor $3ce344,x
$1a:e941  13 84         ora ($84,s),y
$1a:e943  3a            dec a
$1a:e944  17 5e         ora [$5e],y
$1a:e946  c4 d7         cpy $d7
$1a:e948  b1 15         lda ($15),y
$1a:e94a  ec cd 7b      cpx $7bcd
$1a:e94d  31 5e         and ($5e),y
$1a:e94f  c3 d2         cmp $d2,s
$1a:e951  a1 f5         lda ($f5,x)
$1a:e953  ec ba 94      cpx $94ba
$1a:e956  61 b0         adc ($b0,x)
$1a:e958  a8            tay
$1a:e959  74 2a         stz $2a,x
$1a:e95b  3c 83 18      bit $1883,x
$1a:e95e  7c 7b 0e      jmp ($0e7b,x)
$1a:e961  eb            xba
$1a:e962  1c bc 7b      trb $7bbc
$1a:e965  11 1e         ora ($1e),y
$1a:e967  c4 c7         cpy $c7
$1a:e969  b3 11         lda ($11,s),y
$1a:e96b  ec cc 7b      cpx $7bcc
$1a:e96e  15 1e         ora $1e,x
$1a:e970  c5 c7         cmp $c7
$1a:e972  b3 51         lda ($51,s),y
$1a:e974  ec dc 7b      cpx $7bdc
$1a:e977  19 1e c6      ora $c61e,y
$1a:e97a  c7 b3         cmp [$b3]
$1a:e97c  91 ec         sta ($ec),y
$1a:e97e  ec 7b 1c      cpx $1c7b
$1a:e981  d9 1c f0      cmp $f01c,y
$1a:e984  94 75         sty $75,x
$1a:e986  35 ed         and $ed,x
$1a:e988  45 7b         eor $7b
$1a:e98a  73 5e         adc ($5e,s),y
$1a:e98c  dc 57 b4      jml [$b457]
$1a:e98f  ee 11 f3      inc $f311
$1a:e992  ba            tsx
$1a:e993  c2 11         rep #$11
$1a:e995  2d 84 4b      and $4b84
$1a:e998  a1 13         lda ($13,x)
$1a:e99a  d5 f8         cmp $f8,x
$1a:e99c  39 c5 70      and $70c5,y
$1a:e99f  0e c0 f3      asl $f3c0
$1a:e9a2  c7 b5         cmp [$b5]
$1a:e9a4  11 ed         ora ($ed),y
$1a:e9a6  4c 7b 71      jmp $717b
$1a:e9a9  1e dc c7      asl $c7dc,x
$1a:e9ac  b5 51         lda $51,x
$1a:e9ae  ed 5c 7b      sbc $7b5c
$1a:e9b1  75 1e         adc $1e,x
$1a:e9b3  dd c7 b5      cmp $b5c7,x
$1a:e9b6  91 ed         sta ($ed),y
$1a:e9b8  6c 7b 79      jmp ($797b)
$1a:e9bb  1e de c7      asl $c7de,x
$1a:e9be  b5 d1         lda $d1,x
$1a:e9c0  ed 7c 7b      sbc $7b7c
$1a:e9c3  7d 1e df      adc $df1e,x
$1a:e9c6  d7 b9         cmp [$b9],y
$1a:e9c8  35 ee         and $ee,x
$1a:e9ca  45 7b         eor $7b
$1a:e9cc  b3 5e         lda ($5e,s),y
$1a:e9ce  ec 57 b8      cpx $b857
$1a:e9d1  eb            xba
$1a:e9d2  91 eb         sta ($eb),y
$1a:e9d4  af 4d 88 0c   lda $0c884d
$1a:e9d8  44 7c 02      mvp $02,$7c
$1a:e9db  30 3a         bmi $ea17
$1a:e9dd  f1 ee         sbc ($ee),y
$1a:e9df  44 7b 93      mvp $93,$7b
$1a:e9e2  1e ec 47      asl $47ec,x
$1a:e9e5  bb            tyx
$1a:e9e6  31 ee         and ($ee),y
$1a:e9e8  54 7b 97      mvn $97,$7b
$1a:e9eb  1e ed 47      asl $47ed,x
$1a:e9ee  bb            tyx
$1a:e9ef  71 ee         adc ($ee),y
$1a:e9f1  64 7b         stz $7b
$1a:e9f3  9b            txy
$1a:e9f4  1e ee 47      asl $47ee,x
$1a:e9f7  bb            tyx
$1a:e9f8  b1 ee         lda ($ee),y
$1a:e9fa  74 7b         stz $7b,x
$1a:e9fc  9f 1e ef 47   sta $47ef1e,x
$1a:ea00  bb            tyx
$1a:ea01  f5 ef         sbc $ef,x
$1a:ea03  4d 7b d0      eor $d07b
$1a:ea06  2f 23 f8 cf   and $cff823
$1a:ea0a  d0 65         bne $ea71
$1a:ea0c  4a            lsr a
$1a:ea0d  85 10         sta $10
$1a:ea0f  06 10         asl $10
$1a:ea11  43 11         eor $11,s
$1a:ea13  d0 20         bne $ea35
$1a:ea15  8e 3d e8      stx $e83d
$1a:ea18  8f 7a 49 e7   sta $e7497a
$1a:ea1c  ea            nop
$1a:ea1d  8f 7a ca e7   sta $e7ca7a
$1a:ea21  ec 8f 7b      cpx $7b8f
$1a:ea24  4b            phk
$1a:ea25  e7 ee         sbc [$ee]
$1a:ea27  8f 7b cc e4   sta $e4cc7b
$1a:ea2b  2f 37 a0 c7   and $c7a037
$1a:ea2f  2f d1 cb f9   and $f9cbd1
$1a:ea33  dc 6f d1      jml [$d16f]
$1a:ea36  ea            nop
$1a:ea37  f4 7a be      pea $be7a
$1a:ea3a  5f 3b 74 7a   eor $7a743b,x
$1a:ea3e  de 67 32      dec $3267,x
$1a:ea41  81 05         sta ($05,x)
$1a:ea43  08            php
$1a:ea44  b0 41         bcs $ea87
$1a:ea46  c2 30         rep #$30
$1a:ea48  10 90         bpl $e9da
$1a:ea4a  8d 04 2c      sta $2c04
$1a:ea4d  18            clc
$1a:ea4e  74 2e         stz $2e,x
$1a:ea50  95 4f         sta $4f,x
$1a:ea52  ef 72 61 d2   sbc $d26172
$1a:ea56  b8            clv
$1a:ea57  55 76         eor $76,x
$1a:ea59  15 61         ora $61,x
$1a:ea5b  44 85 79      mvp $79,$85
$1a:ea5e  78            sei
$1a:ea5f  56 ea         lsr $ea,x
$1a:ea61  f1 b8         sbc ($b8),y
$1a:ea63  3d d5 ea      and $ead5,x
$1a:ea66  fd 79 92      sbc $9279,x
$1a:ea69  1e da f7      asl $f7da,x
$1a:ea6c  b2 15         lda ($15)
$1a:ea6e  4f a7 42 d6   eor $d642a7
$1a:ea72  a1 9e         lda ($9e,x)
$1a:ea74  e4 e7         cpx $e7
$1a:ea76  bb            tyx
$1a:ea77  59 ee de      eor $deee,y
$1a:ea7a  7b            tdc
$1a:ea7b  95 9e         sta $9e,x
$1a:ea7d  e5 e7         sbc $e7
$1a:ea7f  bb            tyx
$1a:ea80  99 ee ee      sta $eeee,y
$1a:ea83  7b            tdc
$1a:ea84  99 9e e6      sta $e69e,y
$1a:ea87  e7 bb         sbc [$bb]
$1a:ea89  d9 ee fe      cmp $feee,y
$1a:ea8c  7b            tdc
$1a:ea8d  9d 9e e7      sta $e79e,x
$1a:ea90  f7 b7         sbc [$b7],y
$1a:ea92  3d ed c7      and $c7ed,x
$1a:ea95  7b            tdc
$1a:ea96  53 de         eor ($de,s),y
$1a:ea98  d4 77         pei ($77)
$1a:ea9a  bc fd ed      ldy $edfd,x
$1a:ea9d  b7 7b         lda [$7b],y
$1a:ea9f  4f de d3 57   eor $57d3de
$1a:eaa3  30 b1         bmi $ea56
$1a:eaa5  cc 2d 73      cpy $732d
$1a:eaa8  2b            pld
$1a:eaa9  1c ca e7      trb $e7ca
$1a:eaac  b6 d9         ldx $d9,y
$1a:eaae  ef 3e 7b 4d   sbc $4d7b3e
$1a:eab2  9e d3 e7      stz $e7d3,x
$1a:eab5  b7 19         lda [$19],y
$1a:eab7  ed ce 7b      sbc $7bce
$1a:eaba  51 9e         eor ($9e),y
$1a:eabc  d4 e7         pei ($e7)
$1a:eabe  b7 59         lda [$59],y
$1a:eac0  ed de 7b      sbc $7bde
$1a:eac3  55 9e         eor $9e,x
$1a:eac5  d5 e7         cmp $e7,x
$1a:eac7  b7 99         lda [$99],y
$1a:eac9  ed ee 7b      sbc $7bee
$1a:eacc  59 9e d6      eor $d69e,y
$1a:eacf  e7 b7         sbc [$b7]
$1a:ead1  d9 ed fe      cmp $feed,y
$1a:ead4  7b            tdc
$1a:ead5  5d 9e d7      eor $d79e,x
$1a:ead8  f7 b3         sbc [$b3],y
$1a:eada  3d ec c7      and $c7ec,x
$1a:eadd  7b            tdc
$1a:eade  13 de         ora ($de,s),y
$1a:eae0  c4 77         cpy $77
$1a:eae2  b2 fd         lda ($fd)
$1a:eae4  ec b7 7b      cpx $7bb7
$1a:eae7  0f de c3 57   ora $57c3de
$1a:eaeb  34 b1         bit $b1,x
$1a:eaed  cd 2d 73      cmp $732d
$1a:eaf0  6b            rtl
$1a:eaf1  1c da e7      trb $e7da
$1a:eaf4  b2 d9         lda ($d9)
$1a:eaf6  ec be 7b      cpx $7bbe
$1a:eaf9  0d 9e c3      ora $c39e
$1a:eafc  e7 b3         sbc [$b3]
$1a:eafe  19 ec ce      ora $ceec,y
$1a:eb01  7b            tdc
$1a:eb02  11 9e         ora ($9e),y
$1a:eb04  c4 e7         cpy $e7
$1a:eb06  b3 59         lda ($59,s),y
$1a:eb08  ec de 7b      cpx $7bde
$1a:eb0b  15 9e         ora $9e,x
$1a:eb0d  c5 e7         cmp $e7
$1a:eb0f  b3 99         lda ($99,s),y
$1a:eb11  ec ee 7b      cpx $7bee
$1a:eb14  19 9e c6      ora $c69e,y
$1a:eb17  e7 b3         sbc [$b3]
$1a:eb19  d8            cld
$1a:eb1a  28            plp
$1a:eb1b  06 7b         asl $7b
$1a:eb1d  1c 69 0e      trb $0e69
$1a:eb20  f5 e7         sbc $e7,x
$1a:eb22  bd 78 ef      lda $ef78,x
$1a:eb25  5a            phy
$1a:eb26  7b            tdc
$1a:eb27  d6 8e         dec $8e,x
$1a:eb29  f5 df         sbc $df,x
$1a:eb2b  bd 76 ef      lda $ef76,x
$1a:eb2e  59 fb d6      eor $d6fb,y
$1a:eb31  6a            ror a
$1a:eb32  e7 16         sbc [$16]
$1a:eb34  39 c5 ae      and $aec5,y
$1a:eb37  75 63         adc $63,x
$1a:eb39  9d 5c f5      sta $f55c,x
$1a:eb3c  db            stp
$1a:eb3d  3d 77 cf      and $cf77,x
$1a:eb40  59 b3 d6      eor $d6b3,y
$1a:eb43  7c f5 e3      jmp ($e3f5,x)
$1a:eb46  3d 79 cf      and $cf79,x
$1a:eb49  5a            phy
$1a:eb4a  33 d6         and ($d6,s),y
$1a:eb4c  9c f5 eb      stz $ebf5
$1a:eb4f  3d 7b cf      and $cf7b,x
$1a:eb52  5a            phy
$1a:eb53  b3 d6         lda ($d6,s),y
$1a:eb55  bc f5 f3      ldy $f3f5,x
$1a:eb58  3d 7d cf      and $cf7d,x
$1a:eb5b  5b            tcd
$1a:eb5c  33 d6         and ($d6,s),y
$1a:eb5e  da            phx
$1a:eb5f  f5 4a         sbc $4a,x
$1a:eb61  3d 52 af      and $af52,x
$1a:eb64  58            cli
$1a:eb65  a3 d6         lda $d6,s
$1a:eb67  2e f5 67      rol $67f5
$1a:eb6a  bd 58 ef      lda $ef58,x
$1a:eb6d  52 7b         eor ($7b)
$1a:eb6f  d4 8e         pei ($8e)
$1a:eb71  f5 5f         sbc $5f,x
$1a:eb73  bd 56 ef      lda $ef56,x
$1a:eb76  51 fb         eor ($fb),y
$1a:eb78  d4 6a         pei ($6a)
$1a:eb7a  f4 12 3d      pea $3d12
$1a:eb7d  04 af         tsb $af
$1a:eb7f  45 23         eor $23
$1a:eb81  d1 4c         cmp ($4c),y
$1a:eb83  f5 5b         sbc $5b,x
$1a:eb85  3d 57 cf      and $cf57,x
$1a:eb88  51 b3         eor ($b3),y
$1a:eb8a  d4 7c         pei ($7c)
$1a:eb8c  f5 63         sbc $63,x
$1a:eb8e  3d 59 cf      and $cf59,x
$1a:eb91  52 33         eor ($33)
$1a:eb93  d4 9c         pei ($9c)
$1a:eb95  f5 6b         sbc $6b,x
$1a:eb97  3d 5b cf      and $cf5b,x
$1a:eb9a  52 b3         eor ($b3)
$1a:eb9c  d4 bc         pei ($bc)
$1a:eb9e  f5 70         sbc $70,x
$1a:eba0  d2 34         cmp ($34)
$1a:eba2  c3 48         cmp $48,s
$1a:eba4  57 ae         eor [$ae],y
$1a:eba6  51 eb         eor ($eb),y
$1a:eba8  95 7b         sta $7b,x
$1a:ebaa  05 1e         ora $1e
$1a:ebac  c1 77         cmp ($77,x)
$1a:ebae  a7 3d         lda [$3d]
$1a:ebb0  e9 c5 7b      sbc #$7bc5
$1a:ebb3  21 de         and ($de,x)
$1a:ebb5  94 77         sty $77,x
$1a:ebb7  a6 fd         ldx $fd
$1a:ebb9  e9 b7 7a      sbc #$7ab7
$1a:ebbc  4f de 93 57   eor $5793de
$1a:ebc0  a4 91         ldy $91
$1a:ebc2  e9 25 7a      sbc #$7a25
$1a:ebc5  69 1e 9a      adc #$9a1e
$1a:ebc8  67 a6         adc [$a6]
$1a:ebca  d9 e9 be      cmp $bee9,y
$1a:ebcd  7a            ply
$1a:ebce  4d 9e 93      eor $939e
$1a:ebd1  e7 a7         sbc [$a7]
$1a:ebd3  19 e9 ce      ora $cee9,y
$1a:ebd6  7a            ply
$1a:ebd7  51 1e         eor ($1e),y
$1a:ebd9  c8            iny
$1a:ebda  67 be         adc [$be]
$1a:ebdc  b1 ec         lda ($ec),y
$1a:ebde  24 7b         bit $7b
$1a:ebe0  27 1e         and [$1e]
$1a:ebe2  ca            dex
$1a:ebe3  47 b4         eor [$b4]
$1a:ebe5  66 90         ror $90
$1a:ebe7  8f 6c e3 db   sta $dbe36c
$1a:ebeb  4a            lsr a
$1a:ebec  f6 4a         inc $4a,x
$1a:ebee  3d 92 af      and $af92,x
$1a:ebf1  60            rts
$1a:ebf2  e3 d8         sbc $d8,s
$1a:ebf4  3a            dec a
$1a:ebf5  f6 82         inc $82,x
$1a:ebf7  bd d0 af      lda $afd0,x
$1a:ebfa  6c 2b de      jmp ($de2b)
$1a:ebfd  0e f4 5f      asl $5ff4
$1a:ec00  bd 16 af      lda $af16,x
$1a:ec03  54 6b d5      mvn $d5,$6b
$1a:ec06  0a            asl a
$1a:ec07  f5 12         sbc $12,x
$1a:ec09  3d 44 af      and $af44,x
$1a:ec0c  69 23 da      adc #$da23
$1a:ec0f  4c f4 5b      jmp $5bf4
$1a:ec12  3d 17 8f      and $8f17,x
$1a:ec15  54 23 d5      mvn $d5,$23
$1a:ec18  18            clc
$1a:ec19  f7 42         sbc [$42],y
$1a:ec1b  3d a0 8f      and $8fa0,x
$1a:ec1e  78            sei
$1a:ec1f  23 db         and $db,s
$1a:ec21  08            php
$1a:ec22  f6 86         inc $86,x
$1a:ec24  3d c3 8f      and $8fc3,x
$1a:ec27  6c 63 db      jmp ($db63)
$1a:ec2a  22 b8 e8 8b   jsl $8be8b8
$1a:ec2e  65 88         adc $88
$1a:ec30  f1 99         sbc ($99),y
$1a:ec32  c7 6e         cmp [$6e]
$1a:ec34  6b            rtl
$1a:ec35  08            php
$1a:ec36  f4 0a 3d      pea $3d0a
$1a:ec39  03 8f         ora $8f,s
$1a:ec3b  40            rti
$1a:ec3c  63 d2         adc $d2,s
$1a:ec3e  3a            dec a
$1a:ec3f  f4 0e bd      pea $bd0e
$1a:ec42  02 af         cop #$af
$1a:ec44  1d 82 03      ora $0382,x
$1a:ec47  42 73         wdm #$73
$1a:ec49  04 aa         tsb $aa
$1a:ec4b  bd 3b af      lda $af3b,x
$1a:ec4e  4e bb dd      lsr $ddbb
$1a:ec51  fe f2 24      inc $24f2,x
$1a:ec54  39 fd ee      and $eefd,y
$1a:ec57  77 7b         adc [$7b],y
$1a:ec59  bb            tyx
$1a:ec5a  de ee 77      dec $77ee,x
$1a:ec5d  b9 bd ee      lda $eebd,y
$1a:ec60  67 7b         adc [$7b]
$1a:ec62  b7 de         lda [$de],y
$1a:ec64  ed 77 b9      sbc $b977
$1a:ec67  7d ee 54      adc $54ee,x
$1a:ec6a  7a            ply
$1a:ec6b  23 1e         and $1e,s
$1a:ec6d  89 c7 a4      bit #$a4c7
$1a:ec70  27 50         and [$50]
$1a:ec72  8f 44 94 23   sta $239444
$1a:ec76  22 3a 84 2a   jsl $2a843a
$1a:ec7a  7f 1e f7 c2   adc $c2f71e,x
$1a:ec7e  a3 cb         lda $cb,s
$1a:ec80  10 3f         bpl $ecc1
$1a:ec82  8d 30 fe      sta $fe30
$1a:ec85  35 ca         and $ca,x
$1a:ec87  f5 2e         sbc $2e,x
$1a:ec89  bd 4a af      lda $af4a,x
$1a:ec8c  56 eb         lsr $eb,x
$1a:ec8e  d5 ae         cmp $ae,x
$1a:ec90  f6 ff         inc $ff,x
$1a:ec92  bd be ef      lda $efbe,x
$1a:ec95  6b            rtl
$1a:ec96  fb            xce
$1a:ec97  da            phx
$1a:ec98  ee f6 f7      inc $f7f6
$1a:ec9b  bd bc ef      lda $efbc,x
$1a:ec9e  6b            rtl
$1a:ec9f  7b            tdc
$1a:eca0  da            phx
$1a:eca1  ce f6 ef      dec $eff6
$1a:eca4  bd ba ef      lda $efba,x
$1a:eca7  6a            ror a
$1a:eca8  fb            xce
$1a:eca9  da            phx
$1a:ecaa  a8            tay
$1a:ecab  f4 c6 3d      pea $3dc6
$1a:ecae  33 8f         and ($8f,s),y
$1a:ecb0  50 63         bvc $ed15
$1a:ecb2  d4 38         pei ($38)
$1a:ecb4  f4 c9 c2      pea $c2c9
$1a:ecb7  34 27         bit $27,x
$1a:ecb9  28            plp
$1a:ecba  42 be         wdm #$be
$1a:ecbc  d0 ad         bne $ec6b
$1a:ecbe  bc 2a 5f      ldy $5f2a,x
$1a:ecc1  0a            asl a
$1a:ecc2  f1 d7         sbc ($d7),y
$1a:ecc4  ad b5 eb      lda $ebb5
$1a:ecc7  65 7a         adc $7a
$1a:ecc9  fb            xce
$1a:ecca  5e be 57      lsr $57be,x
$1a:eccd  ad 75 eb      lda $eb75
$1a:ecd0  55 7a         eor $7a,x
$1a:ecd2  f7 5e         sbc [$5e],y
$1a:ecd4  bd 70 a0      lda $a070,x
$1a:ecd7  1d ec f0      ora $f0ec,x
$1a:ecda  1c 71 dd      trb $dd71
$1a:ecdd  ec ef 7b      cpx $7bef
$1a:ece0  39 de c6      and $c6de,y
$1a:ece3  f7 b1         sbc [$b1],y
$1a:ece5  9d ec df      sta $dfec,x
$1a:ece8  7b            tdc
$1a:ece9  35 de         and $de,x
$1a:eceb  c5 f7         cmp $f7
$1a:eced  b1 55         lda ($55),y
$1a:ecef  ef 5c 2a 3f   sbc $3f2a5c
$1a:ecf3  5e ed bc      lsr $bced,x
$1a:ecf6  c6 3f         dec $3f
$1a:ecf8  1e 10 04      asl $0410,x
$1a:ecfb  be 3d db      ldx $db3d,y
$1a:ecfe  3f 8e 38 fe   and $fe388e,x
$1a:ed02  39 ea f6      and $f6ea,y
$1a:ed05  36 bd         rol $bd,x
$1a:ed07  8c af 67      sty $67af
$1a:ed0a  6b            rtl
$1a:ed0b  d9 ca f6      cmp $f6ca,y
$1a:ed0e  2e bc 1e      rol $1ebc
$1a:ed11  0c dd 7b      tsb $7bdd
$1a:ed14  35 5e         and $5e,x
$1a:ed16  d9 57 ac      cmp $ac57,y
$1a:ed19  15 eb         ora $eb,x
$1a:ed1b  8d 7a e1      sta $e17a
$1a:ed1e  de be f7      dec $f7be,x
$1a:ed21  af 9d eb 6f   lda $6feb9d
$1a:ed25  7a            ply
$1a:ed26  d9 de bd      cmp $bdde,y
$1a:ed29  f7 af         sbc [$af],y
$1a:ed2b  5d eb 5f      eor $5feb,x
$1a:ed2e  78            sei
$1a:ed2f  04 11         tsb $11
$1a:ed31  3a            dec a
$1a:ed32  f4 48 f6      pea $f648
$1a:ed35  32 22         and ($22)
$1a:ed37  f8            sed
$1a:ed38  c4 4c         cpy $4c
$1a:ed3a  63 21         adc $21,s
$1a:ed3c  af 6b eb da   lda $daeb6b
$1a:ed40  ea            nop
$1a:ed41  f6 fe         inc $fe,x
$1a:ed43  bd be af      lda $afbe,x
$1a:ed46  6b            rtl
$1a:ed47  6b            rtl
$1a:ed48  da            phx
$1a:ed49  ca            dex
$1a:ed4a  f6 f6         inc $f6,x
$1a:ed4c  bd bc af      lda $afbc,x
$1a:ed4f  6a            ror a
$1a:ed50  eb            xba
$1a:ed51  da            phx
$1a:ed52  aa            tax
$1a:ed53  f6 ee         inc $ee,x
$1a:ed55  bd ba af      lda $afba,x
$1a:ed58  60            rts
$1a:ed59  40            rti
$1a:ed5a  e1 5e         sbc ($5e,x)
$1a:ed5c  c8            iny
$1a:ed5d  ad c0 0e      lda $0ec0
$1a:ed60  35 c0         and $c0,x
$1a:ed62  38            sec
$1a:ed63  d3 3b         cmp ($3b,s),y
$1a:ed65  d5 be         cmp $be,x
$1a:ed67  f3 18         sbc ($18,s),y
$1a:ed69  29 7d e6      and #$e67d
$1a:ed6c  10 4c         bpl $edba
$1a:ed6e  eb            xba
$1a:ed6f  d3 2a         cmp ($2a,s),y
$1a:ed71  f5 0e         sbc $0e,x
$1a:ed73  bd 42 4f      lda $4f42,x
$1a:ed76  8c c5 46      sty $46c5
$1a:ed79  34 1a         bit $1a,x
$1a:ed7b  f7 3e         sbc [$3e],y
$1a:ed7d  bd ce af      lda $afce,x
$1a:ed80  77 eb         adc [$eb],y
$1a:ed82  dd ea f7      cmp $f7ea,x
$1a:ed85  36 bd         rol $bd,x
$1a:ed87  cc af 77      cpy $77af
$1a:ed8a  6b            rtl
$1a:ed8b  dd ca f7      cmp $f7ca,x
$1a:ed8e  2e bd ca      rol $cabd
$1a:ed91  11 85         ora ($85),y
$1a:ed93  7b            tdc
$1a:ed94  b5 5e         lda $5e,x
$1a:ed96  e0 57 b4      cpx #$b457
$1a:ed99  35 ee         and $ee,x
$1a:ed9b  95 7b         sta $7b,x
$1a:ed9d  a2 89 1d      ldx #$1d89
$1a:eda0  1d 7b 69      ora $697b,x
$1a:eda3  5e d9 d7      lsr $d7d9,x
$1a:eda6  b0 9d         bcs $ed45
$1a:eda8  ef ad 7b 29   sbc $297bad
$1a:edac  5e c9 c7      lsr $c7c9,x
$1a:edaf  ac 11 ed      ldy $ed11
$1a:edb2  94 7a         sty $7a,x
$1a:edb4  e1 1e         sbc ($1e,x)
$1a:edb6  b8            clv
$1a:edb7  c7 b4         cmp [$b4]
$1a:edb9  31 ee         and ($ee),y
$1a:edbb  04 7b         tsb $7b
$1a:edbd  a3 1e         lda $1e,s
$1a:edbf  66 07         ror $07
$1a:edc1  be bd ee      ldx $eebd,y
$1a:edc4  77 9f         adc [$9f],y
$1a:edc6  b6 bd         ldx $bd,y
$1a:edc8  ec 7b 9f      cpx $9f7b
$1a:edcb  ae bd ea      ldx $eabd
$1a:edce  7f 9f 8a bd   adc $bd8a9f,x
$1a:edd2  e1 af         sbc ($af,x)
$1a:edd4  7c ab df      jmp ($dfab,x)
$1a:edd7  1a            inc a
$1a:edd8  f6 89         inc $89,x
$1a:edda  92 24         sta ($24)
$1a:eddc  80 d8         bra $edb6
$1a:edde  d7 b8         cmp [$b8],y
$1a:ede0  61 14         adc ($14,x)
$1a:ede2  47 84         eor [$84]
$1a:ede4  7b            tdc
$1a:ede5  03 02         ora $02,s
$1a:ede7  10 06         bpl $edef
$1a:ede9  46 3d         lsr $3d
$1a:edeb  e1 8f         sbc ($8f,x)
$1a:eded  78            sei
$1a:edee  a3 df         lda $df,s
$1a:edf0  18            clc
$1a:edf1  f0 30         beq $ee23
$1a:edf3  1e 04 b4      asl $b404,x
$1a:edf6  27 c1         and [$c1]
$1a:edf8  2f 08 00 4c   and $4c0008
$1a:edfc  41 84         eor ($84,x)
$1a:edfe  79 61 1e      adc $1e61,y
$1a:ee01  62 39 57      per $453d
$1a:ee04  b8            clv
$1a:ee05  95 ee         sta $ee,x
$1a:ee07  0d 7b a9      ora $a97b
$1a:ee0a  5e e9 d7      lsr $d7e9,x
$1a:ee0d  b8            clv
$1a:ee0e  45 11         eor $11
$1a:ee10  66 07         ror $07
$1a:ee12  4e 3d c1      lsr $c13d
$1a:ee15  8f 70 a3 c5   sta $c5a370
$1a:ee19  e0 e9 17      cpx #$17e9
$1a:ee1c  c7 88         cmp [$88]
$1a:ee1e  63 1e         adc $1e,s
$1a:ee20  a4 4a         ldy $4a
$1a:ee22  21 52         and ($52,x)
$1a:ee24  88            dey
$1a:ee25  44 a4 15      mvp $15,$a4
$1a:ee28  29 04 4a      and #$4a04
$1a:ee2b  61 52         adc ($52,x)
$1a:ee2d  98            tya
$1a:ee2e  44 a8 15      mvp $15,$a8
$1a:ee31  2a            rol a
$1a:ee32  04 43         tsb $43
$1a:ee34  e1 08         sbc ($08,x)
$1a:ee36  9e a0 46      stz $46a0,x
$1a:ee39  5a            phy
$1a:ee3a  85 03         sta $03
$1a:ee3c  f9 cb 6b      sbc $6bcb,y
$1a:ee3f  de 4a f4      dec $f44a,x
$1a:ee42  8e bd f4      stx $f4bd
$1a:ee45  af 7c c0 e2   lda $e2c07c
$1a:ee49  92 00         sta ($00)
$1a:ee4b  60            rts
$1a:ee4c  7c e3 d2      jmp ($d2e3,x)
$1a:ee4f  31 48         and ($48),y
$1a:ee51  a7 83         lda [$83]
$1a:ee53  e4 9f         cpx $9f
$1a:ee55  1f 22 8c 7e   ora $7e8c22,x
$1a:ee59  90 4f         bcc $eeaa
$1a:ee5b  ed 13 fb      sbc $fb13
$1a:ee5e  84 fe         sty $fe
$1a:ee60  f1 3f         sbc ($3f),y
$1a:ee62  b1 8f         lda ($8f),y
$1a:ee64  f5 63         sbc $63,x
$1a:ee66  fd 98 ff      sbc $ff98,x
$1a:ee69  76 3f         ror $3f,x
$1a:ee6b  c2 30         rep #$30
$1a:ee6d  5f a4 1b ef   eor $ef1ba4,x
$1a:ee71  46 fb         lsr $fb
$1a:ee73  c1 bf         cmp ($bf,x)
$1a:ee75  14 6f         trb $6f
$1a:ee77  c4 1b         cpy $1b
$1a:ee79  f3 46         sbc ($46,s),y
$1a:ee7b  fc c1 bf      jsr ($bfc1,x)
$1a:ee7e  54 6f d4      mvn $d4,$6f
$1a:ee81  13 ff         ora ($ff,s),y
$1a:ee83  44 ff e1      mvp $e1,$ff
$1a:ee86  3f fc 4f fc   and $fc4ffc,x
$1a:ee8a  13 f9         ora ($f9,s),y
$1a:ee8c  44 fe 61      mvp $61,$fe
$1a:ee8f  3f 9c 4f e4   and $e44f9c,x
$1a:ee93  13 f7         ora ($f7,s),y
$1a:ee95  44 fd e1      mvp $e1,$fd
$1a:ee98  3f 7c 4f d8   and $d84f7c,x
$1a:ee9c  1e 00 4e      asl $4e00,x
$1a:ee9f  2e 0d ff      rol $ff0d
$1a:eea2  f1 b8         sbc ($b8),y
$1a:eea4  07 00         ora [$00]
$1a:eea6  0e ff e0      asl $e0ff
$1a:eea9  b8            clv
$1a:eeaa  03 00         ora $00,s
$1a:eeac  0f ff e0 b8   ora $b8e0ff
$1a:eeb0  03 c0         ora $c0,s
$1a:eeb2  10 ff         bpl $eeb3
$1a:eeb4  e0 b8 01      cpx #$01b8
$1a:eeb7  80 11         bra $eeca
$1a:eeb9  ff e0 b8 00   sbc $00b8e0,x
$1a:eebd  f0 18         beq $eed7
$1a:eebf  00 00         brk #$00
$1a:eec1  2f 32 65 7f   and $7f6532
$1a:eec5  98            tya
$1a:eec6  b2 cb         lda ($cb)
$1a:eec8  e5 fc         sbc $fc
$1a:eeca  19 32 4c      ora $4c32,y
$1a:eecd  65 72         adc $72
$1a:eecf  7f 8c 98 a5   adc $a5988c,x
$1a:eed3  b2 bf         lda ($bf)
$1a:eed5  cb            wai
$1a:eed6  d8            cld
$1a:eed7  e5 f2         sbc $f2
$1a:eed9  fc e6 06      jsr ($06e6,x)
$1a:eedc  00 10         brk #$10
$1a:eede  02 10         cop #$10
$1a:eee0  0a            asl a
$1a:eee1  10 ff         bpl $eee2
$1a:eee3  00 02         brk #$02
$1a:eee5  10 00         bpl $eee7
$1a:eee7  00 1a         brk #$1a
$1a:eee9  10 65         bpl $ef50
$1a:eeeb  11 04         ora ($04),y
$1a:eeed  12 5c         ora ($5c)
$1a:eeef  13 8f         ora ($8f,s),y
$1a:eef1  13 d6         ora ($d6,s),y
$1a:eef3  14 1d         trb $1d
$1a:eef5  16 b0         asl $b0,x
$1a:eef7  16 fa         asl $fa,x
$1a:eef9  05 ea         ora $ea
$1a:eefb  00 e0         brk #$e0
$1a:eefd  01 e7         ora ($e7,x)
$1a:eeff  13 ed         ora ($ed,s),y
$1a:ef01  ba            tsx
$1a:ef02  e5 ff         sbc $ff
$1a:ef04  e1 0a         sbc ($0a,x)
$1a:ef06  f5 80         sbc $80,x
$1a:ef08  6e 73 f7      ror $f773
$1a:ef0b  03 aa         ora $aa,s
$1a:ef0d  00 e3         brk #$e3
$1a:ef0f  30 1e         bmi $ef2f
$1a:ef11  22 06 5d b4   jsl $b45d06
$1a:ef15  b2 0c         lda ($0c)
$1a:ef17  b0 af         bcs $eec8
$1a:ef19  b0 06         bcs $ef21
$1a:ef1b  b2 b0         lda ($b0)
$1a:ef1d  0c af 18      tsb $18af
$1a:ef20  5b            tcd
$1a:ef21  ad 06 5d      lda $5d06
$1a:ef24  b0 af         bcs $eed5
$1a:ef26  0c ad ad      tsb $adad
$1a:ef29  ac 18 ad      ldy $ad18
$1a:ef2c  18            clc
$1a:ef2d  5a            phy
$1a:ef2e  ad ed af      lda $afed
$1a:ef31  0c 5d b5      tsb $b55d
$1a:ef34  06 b4         asl $b4
$1a:ef36  b5 0c         lda $0c,x
$1a:ef38  b2 b0         lda ($b0)
$1a:ef3a  18            clc
$1a:ef3b  b2 18         lda ($18)
$1a:ef3d  5b            tcd
$1a:ef3e  ab            plb
$1a:ef3f  0c 5d b4      tsb $b45d
$1a:ef42  06 b2         asl $b2
$1a:ef44  b4 0c         ldy $0c,x
$1a:ef46  b0 af         bcs $eef7
$1a:ef48  18            clc
$1a:ef49  b0 18         bcs $ef63
$1a:ef4b  5b            tcd
$1a:ef4c  a9 0c 5d      lda #$5d0c
$1a:ef4f  b2 06         lda ($06)
$1a:ef51  b0 b2         bcs $ef05
$1a:ef53  0c af ad      tsb $adaf
$1a:ef56  18            clc
$1a:ef57  af 18 5b b4   lda $b45b18
$1a:ef5b  0c 5a b9      tsb $b95a
$1a:ef5e  06 5d         asl $5d
$1a:ef60  b4 b2         ldy $b2,x
$1a:ef62  0c b0 af      tsb $afb0
$1a:ef65  18            clc
$1a:ef66  ad 18 5a      lda $5a18
$1a:ef69  ad e1 0a      lda $0ae1
$1a:ef6c  ed af 06      sbc $06af
$1a:ef6f  1d a1 06      ora $06a1,x
$1a:ef72  1b            tcs
$1a:ef73  ad 06 1d      lda $1d06
$1a:ef76  ab            plb
$1a:ef77  06 19         asl $19
$1a:ef79  ad 06 1d      lda $1d06
$1a:ef7c  a9 06 1b      lda #$1b06
$1a:ef7f  ab            plb
$1a:ef80  06 1d         asl $1d
$1a:ef82  a8            tay
$1a:ef83  06 19         asl $19
$1a:ef85  a9 06 1d      lda #$1d06
$1a:ef88  a6 06         ldx $06
$1a:ef8a  1b            tcs
$1a:ef8b  a8            tay
$1a:ef8c  06 1d         asl $1d
$1a:ef8e  a9 06 19      lda #$1906
$1a:ef91  a8            tay
$1a:ef92  06 1d         asl $1d
$1a:ef94  a6 06         ldx $06
$1a:ef96  1b            tcs
$1a:ef97  a4 06         ldy $06
$1a:ef99  1d a3 06      ora $06a3,x
$1a:ef9c  19 a1 06      ora $06a1,y
$1a:ef9f  1d 9f 06      ora $069f,x
$1a:efa2  1b            tcs
$1a:efa3  ab            plb
$1a:efa4  06 1d         asl $1d
$1a:efa6  a9 06 19      lda #$1906
$1a:efa9  ab            plb
$1a:efaa  06 1d         asl $1d
$1a:efac  a8            tay
$1a:efad  06 1b         asl $1b
$1a:efaf  a9 06 1d      lda #$1d06
$1a:efb2  a6 06         ldx $06
$1a:efb4  19 a8 06      ora $06a8,y
$1a:efb7  1d a4 06      ora $06a4,x
$1a:efba  1b            tcs
$1a:efbb  a6 06         ldx $06
$1a:efbd  1d a8 06      ora $06a8,x
$1a:efc0  19 a6 06      ora $06a6,y
$1a:efc3  1d a4 06      ora $06a4,x
$1a:efc6  1b            tcs
$1a:efc7  a3 06         lda $06,s
$1a:efc9  1d a1 06      ora $06a1,x
$1a:efcc  19 9f 06      ora $069f,y
$1a:efcf  1d a1 06      ora $06a1,x
$1a:efd2  1b            tcs
$1a:efd3  a9 06 1d      lda #$1d06
$1a:efd6  a8            tay
$1a:efd7  06 19         asl $19
$1a:efd9  a9 06 1d      lda #$1d06
$1a:efdc  a6 06         ldx $06
$1a:efde  1b            tcs
$1a:efdf  a8            tay
$1a:efe0  06 1d         asl $1d
$1a:efe2  a4 06         ldy $06
$1a:efe4  19 a6 06      ora $06a6,y
$1a:efe7  1d a3 06      ora $06a3,x
$1a:efea  1b            tcs
$1a:efeb  a4 06         ldy $06
$1a:efed  1d a6 06      ora $06a6,x
$1a:eff0  19 a4 06      ora $06a4,y
$1a:eff3  1d a6 06      ora $06a6,x
$1a:eff6  1b            tcs
$1a:eff7  a4 06         ldy $06
$1a:eff9  1d a3 06      ora $06a3,x
$1a:effc  19 a1 06      ora $06a1,y
$1a:efff  1d 9f 06      ora $069f,x
$1a:f002  1b            tcs
$1a:f003  a8            tay
$1a:f004  06 1d         asl $1d
$1a:f006  a6 06         ldx $06
$1a:f008  19 a8 06      ora $06a8,y
$1a:f00b  1d a3 06      ora $06a3,x
$1a:f00e  1b            tcs
$1a:f00f  a8            tay
$1a:f010  06 1d         asl $1d
$1a:f012  a0 06 19      ldy #$1906
$1a:f015  a8            tay
$1a:f016  06 1d         asl $1d
$1a:f018  a1 06         lda ($06,x)
$1a:f01a  1b            tcs
$1a:f01b  a4 06         ldy $06
$1a:f01d  1d a8 06      ora $06a8,x
$1a:f020  19 ad 18      ora $18ad,y
$1a:f023  4d a1 30      eor $30a1
$1a:f026  c9 e1 0a      cmp #$0ae1
$1a:f029  ed 6e a7      sbc $a76e
$1a:f02c  18            clc
$1a:f02d  a9 b0 30      lda #$30b0
$1a:f030  b2 18         lda ($18)
$1a:f032  a7 b2         lda [$b2]
$1a:f034  30 b0         bmi $efe6
$1a:f036  0c b2 b0      tsb $b0b2
$1a:f039  b5 b3         lda $b3,x
$1a:f03b  b7 b5         lda [$b5],y
$1a:f03d  b3 b2         lda ($b2,s),y
$1a:f03f  18            clc
$1a:f040  b3 b3         lda ($b3,s),y
$1a:f042  00 ea         brk #$ea
$1a:f044  00 e0         brk #$e0
$1a:f046  02 ed         cop #$ed
$1a:f048  a0 e1 09      ldy #$09e1
$1a:f04b  60            rts
$1a:f04c  c9 c9 e3      cmp #$e3c9
$1a:f04f  30 1e         bmi $f06f
$1a:f051  22 0c c9 0c   jsl $0cc90c
$1a:f055  5d ad b2      eor $b2ad,x
$1a:f058  ad 18 af      lda $af18
$1a:f05b  18            clc
$1a:f05c  67 b7         adc [$b7]
$1a:f05e  0c c9 0c      tsb $0cc9
$1a:f061  5d ab b0      eor $b0ab,x
$1a:f064  ab            plb
$1a:f065  18            clc
$1a:f066  ad 18 67      lda $6718
$1a:f069  b5 0c         lda $0c,x
$1a:f06b  c9 0c 5d      cmp #$5d0c
$1a:f06e  a9 af a9      lda #$a9af
$1a:f071  18            clc
$1a:f072  ac af 60      ldy $60af
$1a:f075  5b            tcd
$1a:f076  b0 ed         bcs $f065
$1a:f078  8c 30 5d      sty $5d30
$1a:f07b  b0 0c         bcs $f089
$1a:f07d  b2 0c         lda ($0c)
$1a:f07f  5b            tcd
$1a:f080  b0 0c         bcs $f08e
$1a:f082  5d af 0c      eor $0caf,x
$1a:f085  59 ad 30      eor $30ad,y
$1a:f088  5d af 0c      eor $0caf,x
$1a:f08b  b0 0c         bcs $f099
$1a:f08d  5b            tcd
$1a:f08e  af 0c 5d ad   lda $ad5d0c
$1a:f092  0c 59 ab      tsb $ab59
$1a:f095  30 5d         bmi $f0f4
$1a:f097  ad 0c af      lda $af0c
$1a:f09a  0c 5b ad      tsb $ad5b
$1a:f09d  0c 5d b2      tsb $b25d
$1a:f0a0  0c 59 b0      tsb $b059
$1a:f0a3  18            clc
$1a:f0a4  5d af 18      eor $18af,x
$1a:f0a7  5b            tcd
$1a:f0a8  b2 60         lda ($60)
$1a:f0aa  3b            tsc
$1a:f0ab  b0 e1         bcs $f08e
$1a:f0ad  0a            asl a
$1a:f0ae  ed b4 18      sbc $18b4
$1a:f0b1  5b            tcd
$1a:f0b2  b0 18         bcs $f0cc
$1a:f0b4  5c b7 30 6a   jml $6a30b7
$1a:f0b8  b8            clv
$1a:f0b9  18            clc
$1a:f0ba  5b            tcd
$1a:f0bb  ae 18 5c      ldx $5c18
$1a:f0be  b5 30         lda $30,x
$1a:f0c0  6a            ror a
$1a:f0c1  b7 18         lda [$18],y
$1a:f0c3  5b            tcd
$1a:f0c4  ac 18 5c      ldy $5c18
$1a:f0c7  b3 0c         lda ($0c,s),y
$1a:f0c9  b5 b3         lda $b3,x
$1a:f0cb  0c 5c b2      tsb $b25c
$1a:f0ce  0c 59 b0      tsb $b059
$1a:f0d1  0c 5b b3      tsb $b35b
$1a:f0d4  06 5c         asl $5c
$1a:f0d6  b2 b0         lda ($b0)
$1a:f0d8  0c b0 af      tsb $afb0
$1a:f0db  18            clc
$1a:f0dc  b0 18         bcs $f0f6
$1a:f0de  5b            tcd
$1a:f0df  b0 e4         bcs $f0c5
$1a:f0e1  00 ea         brk #$ea
$1a:f0e3  00 e0         brk #$e0
$1a:f0e5  03 ed         ora $ed,s
$1a:f0e7  87 e1         sta [$e1]
$1a:f0e9  0a            asl a
$1a:f0ea  60            rts
$1a:f0eb  c9 c9 0c      cmp #$0cc9
$1a:f0ee  1c a6 0c      trb $0ca6
$1a:f0f1  1a            inc a
$1a:f0f2  b2 0c         lda ($0c)
$1a:f0f4  1c a6 0c      trb $0ca6
$1a:f0f7  18            clc
$1a:f0f8  b2 0c         lda ($0c)
$1a:f0fa  1c ab 0c      trb $0cab
$1a:f0fd  1a            inc a
$1a:f0fe  b7 0c         lda [$0c],y
$1a:f100  1c ab 0c      trb $0cab
$1a:f103  18            clc
$1a:f104  b7 0c         lda [$0c],y
$1a:f106  1c a4 0c      trb $0ca4
$1a:f109  1a            inc a
$1a:f10a  b0 0c         bcs $f118
$1a:f10c  1c a4 0c      trb $0ca4
$1a:f10f  18            clc
$1a:f110  b0 0c         bcs $f11e
$1a:f112  1c a9 0c      trb $0ca9
$1a:f115  1a            inc a
$1a:f116  b5 0c         lda $0c,x
$1a:f118  1c a9 0c      trb $0ca9
$1a:f11b  18            clc
$1a:f11c  b5 0c         lda $0c,x
$1a:f11e  1c a6 0c      trb $0ca6
$1a:f121  1a            inc a
$1a:f122  b2 0c         lda ($0c)
$1a:f124  1c a6 0c      trb $0ca6
$1a:f127  18            clc
$1a:f128  b2 0c         lda ($0c)
$1a:f12a  1c a8 0c      trb $0ca8
$1a:f12d  1a            inc a
$1a:f12e  b4 0c         ldy $0c,x
$1a:f130  1c ac 0c      trb $0cac
$1a:f133  18            clc
$1a:f134  b8            clv
$1a:f135  0c 1a b9      tsb $b91a
$1a:f138  b4 0c         ldy $0c,x
$1a:f13a  1c b0 0c      trb $0cb0
$1a:f13d  18            clc
$1a:f13e  b4 0c         ldy $0c,x
$1a:f140  1c ad 0c      trb $0cad
$1a:f143  1a            inc a
$1a:f144  a8            tay
$1a:f145  0c 1c a4      tsb $a41c
$1a:f148  0c 18 a8      tsb $a818
$1a:f14b  e0 03 18      cpx #$1803
$1a:f14e  0b            phd
$1a:f14f  a1 0c         lda ($0c,x)
$1a:f151  c9 0c 0a      cmp #$0a0c
$1a:f154  a4 18         ldy $18
$1a:f156  0b            phd
$1a:f157  a6 c9         ldx $c9
$1a:f159  18            clc
$1a:f15a  0b            phd
$1a:f15b  9f 0c c9 0c   sta $0cc90c,x
$1a:f15f  0a            asl a
$1a:f160  a3 18         lda $18,s
$1a:f162  0b            phd
$1a:f163  a4 c9         ldy $c9
$1a:f165  18            clc
$1a:f166  0b            phd
$1a:f167  9d 0c c9      sta $c90c,x
$1a:f16a  0c 0a a1      tsb $a10a
$1a:f16d  18            clc
$1a:f16e  0b            phd
$1a:f16f  a3 c9         lda $c9,s
$1a:f171  18            clc
$1a:f172  0b            phd
$1a:f173  9c 0c c9      stz $c90c
$1a:f176  0c 0a a0      tsb $a00a
$1a:f179  18            clc
$1a:f17a  1b            tcs
$1a:f17b  a1 48         lda ($48,x)
$1a:f17d  c9 ed 87      cmp #$87ed
$1a:f180  e0 03 06      cpx #$0603
$1a:f183  1c a4 06      trb $06a4
$1a:f186  1a            inc a
$1a:f187  b0 06         bcs $f18f
$1a:f189  1c ab 06      trb $06ab
$1a:f18c  18            clc
$1a:f18d  b0 06         bcs $f195
$1a:f18f  1c a4 06      trb $06a4
$1a:f192  1a            inc a
$1a:f193  b0 06         bcs $f19b
$1a:f195  1c ab 06      trb $06ab
$1a:f198  18            clc
$1a:f199  b0 06         bcs $f1a1
$1a:f19b  1c a9 06      trb $06a9
$1a:f19e  1a            inc a
$1a:f19f  b5 06         lda $06,x
$1a:f1a1  1c b0 06      trb $06b0
$1a:f1a4  18            clc
$1a:f1a5  b5 06         lda $06,x
$1a:f1a7  1c a9 06      trb $06a9
$1a:f1aa  1a            inc a
$1a:f1ab  b5 06         lda $06,x
$1a:f1ad  1c b0 06      trb $06b0
$1a:f1b0  18            clc
$1a:f1b1  b5 06         lda $06,x
$1a:f1b3  1c a2 06      trb $06a2
$1a:f1b6  1a            inc a
$1a:f1b7  ae 06 1c      ldx $1c06
$1a:f1ba  a9 06 18      lda #$1806
$1a:f1bd  ae 06 1c      ldx $1c06
$1a:f1c0  a2 06 1a      ldx #$1a06
$1a:f1c3  ae 06 1c      ldx $1c06
$1a:f1c6  a9 06 18      lda #$1806
$1a:f1c9  ae 06 1c      ldx $1c06
$1a:f1cc  a7 06         lda [$06]
$1a:f1ce  1a            inc a
$1a:f1cf  b3 06         lda ($06,s),y
$1a:f1d1  1c ae 06      trb $06ae
$1a:f1d4  18            clc
$1a:f1d5  b3 06         lda ($06,s),y
$1a:f1d7  1c a7 06      trb $06a7
$1a:f1da  1a            inc a
$1a:f1db  b3 06         lda ($06,s),y
$1a:f1dd  1c ae 06      trb $06ae
$1a:f1e0  18            clc
$1a:f1e1  b3 06         lda ($06,s),y
$1a:f1e3  1c a0 06      trb $06a0
$1a:f1e6  1a            inc a
$1a:f1e7  ac 06 1c      ldy $1c06
$1a:f1ea  a7 06         lda [$06]
$1a:f1ec  18            clc
$1a:f1ed  ac 06 1c      ldy $1c06
$1a:f1f0  a0 06 1a      ldy #$1a06
$1a:f1f3  ac 06 1c      ldy $1c06
$1a:f1f6  a7 06         lda [$06]
$1a:f1f8  18            clc
$1a:f1f9  ac 06 1c      ldy $1c06
$1a:f1fc  9d 06 1a      sta $1a06,x
$1a:f1ff  a9 06 1c      lda #$1c06
$1a:f202  a4 06         ldy $06
$1a:f204  18            clc
$1a:f205  a9 06 1c      lda #$1c06
$1a:f208  9d 06 1a      sta $1a06,x
$1a:f20b  a9 06 1c      lda #$1c06
$1a:f20e  a4 06         ldy $06
$1a:f210  18            clc
$1a:f211  a9 06 1c      lda #$1c06
$1a:f214  9f 06 1a ab   sta $ab1a06,x
$1a:f218  06 1c         asl $1c
$1a:f21a  a6 06         ldx $06
$1a:f21c  18            clc
$1a:f21d  ab            plb
$1a:f21e  06 1c         asl $1c
$1a:f220  9f 06 1a ab   sta $ab1a06,x
$1a:f224  06 1c         asl $1c
$1a:f226  a6 06         ldx $06
$1a:f228  18            clc
$1a:f229  ab            plb
$1a:f22a  06 1c         asl $1c
$1a:f22c  a4 06         ldy $06
$1a:f22e  1a            inc a
$1a:f22f  b0 06         bcs $f237
$1a:f231  1c ab 06      trb $06ab
$1a:f234  18            clc
$1a:f235  b0 18         bcs $f24f
$1a:f237  37 a4         and [$a4],y
$1a:f239  00 e0         brk #$e0
$1a:f23b  04 ea         tsb $ea
$1a:f23d  f4 ed 96      pea $96ed
$1a:f240  e1 0a         sbc ($0a,x)
$1a:f242  60            rts
$1a:f243  c9 c9 c9      cmp #$c9c9
$1a:f246  c9 c9 c9      cmp #$c9c9
$1a:f249  18            clc
$1a:f24a  4d b9 c0      eor $c0b9
$1a:f24d  30 59         bmi $f2a8
$1a:f24f  c1 18         cmp ($18,x)
$1a:f251  4d b7 be      eor $beb7
$1a:f254  30 59         bmi $f2af
$1a:f256  c0 18 5d      cpy #$5d18
$1a:f259  b5 b0         lda $b0,x
$1a:f25b  0c 4d b2      tsb $b24d
$1a:f25e  b0 af         bcs $f20f
$1a:f260  ad 18 5d      lda $5d18
$1a:f263  ac af 60      ldy $60af
$1a:f266  5b            tcd
$1a:f267  ad c9 c9      lda $c9c9
$1a:f26a  c9 c9 00      cmp #$00c9
$1a:f26d  ea            nop
$1a:f26e  f4 e0 01      pea $01e0
$1a:f271  ed 55 e1      sbc $e155
$1a:f274  09 e3 30      ora #$30e3
$1a:f277  1e 22 06      asl $0622,x
$1a:f27a  5d b4 b2      eor $b2b4,x
$1a:f27d  0c b0 af      tsb $afb0
$1a:f280  b0 06         bcs $f288
$1a:f282  b2 b0         lda ($b0)
$1a:f284  0c af 18      tsb $18af
$1a:f287  5b            tcd
$1a:f288  ad 06 5d      lda $5d06
$1a:f28b  b0 af         bcs $f23c
$1a:f28d  0c ad ad      tsb $adad
$1a:f290  ac 18 ad      ldy $ad18
$1a:f293  18            clc
$1a:f294  5b            tcd
$1a:f295  ad ea 00      lda $00ea
$1a:f298  e4 e0         cpx $e0
$1a:f29a  00 e1         brk #$e1
$1a:f29c  0a            asl a
$1a:f29d  ea            nop
$1a:f29e  f4 0c 5d      pea $5d0c
$1a:f2a1  b5 06         lda $06,x
$1a:f2a3  b4 b5         ldy $b5,x
$1a:f2a5  0c b2 b0      tsb $b0b2
$1a:f2a8  18            clc
$1a:f2a9  b2 ab         lda ($ab)
$1a:f2ab  0c b4 06      tsb $06b4
$1a:f2ae  b2 b4         lda ($b4)
$1a:f2b0  0c b0 af      tsb $afb0
$1a:f2b3  18            clc
$1a:f2b4  b0 a9         bcs $f25f
$1a:f2b6  0c b2 06      tsb $06b2
$1a:f2b9  b0 b2         bcs $f26d
$1a:f2bb  0c af ad      tsb $adaf
$1a:f2be  18            clc
$1a:f2bf  af b4 0c b9   lda $b90cb4
$1a:f2c3  06 b4         asl $b4
$1a:f2c5  b2 0c         lda ($0c)
$1a:f2c7  b0 af         bcs $f278
$1a:f2c9  18            clc
$1a:f2ca  ad ad ea      lda $eaad
$1a:f2cd  00 ea         brk #$ea
$1a:f2cf  0c e1 0b      tsb $0be1
$1a:f2d2  ed 8c 06      sbc $068c
$1a:f2d5  3d a1 06      and $06a1,x
$1a:f2d8  3b            tsc
$1a:f2d9  ad 06 3d      lda $3d06
$1a:f2dc  ab            plb
$1a:f2dd  06 39         asl $39
$1a:f2df  ad 06 3d      lda $3d06
$1a:f2e2  a9 06 3b      lda #$3b06
$1a:f2e5  ab            plb
$1a:f2e6  06 3d         asl $3d
$1a:f2e8  a8            tay
$1a:f2e9  06 39         asl $39
$1a:f2eb  a9 06 3d      lda #$3d06
$1a:f2ee  a6 06         ldx $06
$1a:f2f0  3b            tsc
$1a:f2f1  a8            tay
$1a:f2f2  06 3d         asl $3d
$1a:f2f4  a9 06 39      lda #$3906
$1a:f2f7  a8            tay
$1a:f2f8  06 3d         asl $3d
$1a:f2fa  a6 06         ldx $06
$1a:f2fc  3b            tsc
$1a:f2fd  a4 06         ldy $06
$1a:f2ff  3d a3 06      and $06a3,x
$1a:f302  39 a1 06      and $06a1,y
$1a:f305  3d 9f 06      and $069f,x
$1a:f308  3b            tsc
$1a:f309  ab            plb
$1a:f30a  06 3d         asl $3d
$1a:f30c  a9 06 39      lda #$3906
$1a:f30f  ab            plb
$1a:f310  06 3d         asl $3d
$1a:f312  a8            tay
$1a:f313  06 3b         asl $3b
$1a:f315  a9 06 3d      lda #$3d06
$1a:f318  a6 06         ldx $06
$1a:f31a  39 a8 06      and $06a8,y
$1a:f31d  3d a4 06      and $06a4,x
$1a:f320  3b            tsc
$1a:f321  a6 06         ldx $06
$1a:f323  3d a8 06      and $06a8,x
$1a:f326  39 a6 06      and $06a6,y
$1a:f329  3d a4 06      and $06a4,x
$1a:f32c  3b            tsc
$1a:f32d  a3 06         lda $06,s
$1a:f32f  3d a1 06      and $06a1,x
$1a:f332  39 9f 06      and $069f,y
$1a:f335  3d a1 06      and $06a1,x
$1a:f338  3b            tsc
$1a:f339  a9 06 3d      lda #$3d06
$1a:f33c  a8            tay
$1a:f33d  06 39         asl $39
$1a:f33f  a9 06 3d      lda #$3d06
$1a:f342  a6 06         ldx $06
$1a:f344  3b            tsc
$1a:f345  a8            tay
$1a:f346  06 3d         asl $3d
$1a:f348  a4 06         ldy $06
$1a:f34a  39 a6 06      and $06a6,y
$1a:f34d  3d a3 06      and $06a3,x
$1a:f350  3b            tsc
$1a:f351  a4 06         ldy $06
$1a:f353  3d a6 06      and $06a6,x
$1a:f356  39 a4 06      and $06a4,y
$1a:f359  3d a6 06      and $06a6,x
$1a:f35c  3b            tsc
$1a:f35d  a4 06         ldy $06
$1a:f35f  3d a3 06      and $06a3,x
$1a:f362  39 a1 06      and $06a1,y
$1a:f365  3d 9f 06      and $069f,x
$1a:f368  3b            tsc
$1a:f369  a8            tay
$1a:f36a  06 3d         asl $3d
$1a:f36c  a6 06         ldx $06
$1a:f36e  39 a8 06      and $06a8,y
$1a:f371  3d a3 06      and $06a3,x
$1a:f374  3b            tsc
$1a:f375  a8            tay
$1a:f376  06 3d         asl $3d
$1a:f378  a0 06 39      ldy #$3906
$1a:f37b  a8            tay
$1a:f37c  06 3d         asl $3d
$1a:f37e  a1 06         lda ($06,x)
$1a:f380  3b            tsc
$1a:f381  a4 06         ldy $06
$1a:f383  3d a8 06      and $06a8,x
$1a:f386  39 ad 18      and $18ad,y
$1a:f389  5d a1 30      eor $30a1,x
$1a:f38c  c9 e3 30      cmp #$30e3
$1a:f38f  1e 22 ea      asl $ea22,x
$1a:f392  00 e1         brk #$e1
$1a:f394  0a            asl a
$1a:f395  ed 5a 30      sbc $305a
$1a:f398  5d a7 18      eor $18a7,x
$1a:f39b  a9 b0 30      lda #$30b0
$1a:f39e  b2 18         lda ($18)
$1a:f3a0  a7 b2         lda [$b2]
$1a:f3a2  30 b0         bmi $f354
$1a:f3a4  0c b2 b0      tsb $b0b2
$1a:f3a7  b5 b3         lda $b3,x
$1a:f3a9  b7 b5         lda [$b5],y
$1a:f3ab  b3 b2         lda ($b2,s),y
$1a:f3ad  18            clc
$1a:f3ae  b3 18         lda ($18,s),y
$1a:f3b0  5b            tcd
$1a:f3b1  b3 e4         lda ($e4,s),y
$1a:f3b3  00 ea         brk #$ea
$1a:f3b5  00 e0         brk #$e0
$1a:f3b7  01 ed         ora ($ed,x)
$1a:f3b9  69 e1 07      adc #$07e1
$1a:f3bc  e3 30         sbc $30,s
$1a:f3be  1e 22 06      asl $0622,x
$1a:f3c1  c9 06 4d      cmp #$4d06
$1a:f3c4  b4 b2         ldy $b2,x
$1a:f3c6  0c b0 af      tsb $afb0
$1a:f3c9  b0 06         bcs $f3d1
$1a:f3cb  b2 b0         lda ($b0)
$1a:f3cd  0c af 18      tsb $18af
$1a:f3d0  4b            phk
$1a:f3d1  ad 06 4d      lda $4d06
$1a:f3d4  b0 af         bcs $f385
$1a:f3d6  0c ad ad      tsb $adad
$1a:f3d9  ac 18 ad      ldy $ad18
$1a:f3dc  18            clc
$1a:f3dd  4b            phk
$1a:f3de  ad 0c 4d      lda $4d0c
$1a:f3e1  b5 06         lda $06,x
$1a:f3e3  b4 b5         ldy $b5,x
$1a:f3e5  0c b2 b0      tsb $b0b2
$1a:f3e8  18            clc
$1a:f3e9  b2 18         lda ($18)
$1a:f3eb  4b            phk
$1a:f3ec  ab            plb
$1a:f3ed  0c 4d b4      tsb $b44d
$1a:f3f0  06 b2         asl $b2
$1a:f3f2  b4 0c         ldy $0c,x
$1a:f3f4  b0 af         bcs $f3a5
$1a:f3f6  18            clc
$1a:f3f7  b0 18         bcs $f411
$1a:f3f9  4b            phk
$1a:f3fa  a9 0c 4d      lda #$4d0c
$1a:f3fd  b2 06         lda ($06)
$1a:f3ff  b0 b2         bcs $f3b3
$1a:f401  0c af ad      tsb $adaf
$1a:f404  18            clc
$1a:f405  af 18 4b b4   lda $b44b18
$1a:f409  0c 49 b9      tsb $b949
$1a:f40c  06 4d         asl $4d
$1a:f40e  b4 b2         ldy $b2,x
$1a:f410  0c b0 af      tsb $afb0
$1a:f413  18            clc
$1a:f414  ad 18 4b      lda $4b18
$1a:f417  ad e4 ea      lda $eae4
$1a:f41a  0c e0 00      tsb $00e0
$1a:f41d  e1 0f         sbc ($0f,x)
$1a:f41f  ed 64 06      sbc $0664
$1a:f422  1d a1 06      ora $06a1,x
$1a:f425  1b            tcs
$1a:f426  ad 06 1d      lda $1d06
$1a:f429  ab            plb
$1a:f42a  06 19         asl $19
$1a:f42c  ad 06 1d      lda $1d06
$1a:f42f  a9 06 1b      lda #$1b06
$1a:f432  ab            plb
$1a:f433  06 1d         asl $1d
$1a:f435  a8            tay
$1a:f436  06 19         asl $19
$1a:f438  a9 06 1d      lda #$1d06
$1a:f43b  a6 06         ldx $06
$1a:f43d  1b            tcs
$1a:f43e  a8            tay
$1a:f43f  06 1d         asl $1d
$1a:f441  a9 06 19      lda #$1906
$1a:f444  a8            tay
$1a:f445  06 1d         asl $1d
$1a:f447  a6 06         ldx $06
$1a:f449  1b            tcs
$1a:f44a  a4 06         ldy $06
$1a:f44c  1d a3 06      ora $06a3,x
$1a:f44f  19 a1 06      ora $06a1,y
$1a:f452  1d 9f 06      ora $069f,x
$1a:f455  1b            tcs
$1a:f456  ab            plb
$1a:f457  06 1d         asl $1d
$1a:f459  a9 06 19      lda #$1906
$1a:f45c  ab            plb
$1a:f45d  06 1d         asl $1d
$1a:f45f  a8            tay
$1a:f460  06 1b         asl $1b
$1a:f462  a9 06 1d      lda #$1d06
$1a:f465  a6 06         ldx $06
$1a:f467  19 a8 06      ora $06a8,y
$1a:f46a  1d a4 06      ora $06a4,x
$1a:f46d  1b            tcs
$1a:f46e  a6 06         ldx $06
$1a:f470  1d a8 06      ora $06a8,x
$1a:f473  19 a6 06      ora $06a6,y
$1a:f476  1d a4 06      ora $06a4,x
$1a:f479  1b            tcs
$1a:f47a  a3 06         lda $06,s
$1a:f47c  1d a1 06      ora $06a1,x
$1a:f47f  19 9f 06      ora $069f,y
$1a:f482  1d a1 06      ora $06a1,x
$1a:f485  1b            tcs
$1a:f486  a9 06 1d      lda #$1d06
$1a:f489  a8            tay
$1a:f48a  06 19         asl $19
$1a:f48c  a9 06 1d      lda #$1d06
$1a:f48f  a6 06         ldx $06
$1a:f491  1b            tcs
$1a:f492  a8            tay
$1a:f493  06 1d         asl $1d
$1a:f495  a4 06         ldy $06
$1a:f497  19 a6 06      ora $06a6,y
$1a:f49a  1d a3 06      ora $06a3,x
$1a:f49d  1b            tcs
$1a:f49e  a4 06         ldy $06
$1a:f4a0  1d a6 06      ora $06a6,x
$1a:f4a3  19 a4 06      ora $06a4,y
$1a:f4a6  1d a6 06      ora $06a6,x
$1a:f4a9  1b            tcs
$1a:f4aa  a4 06         ldy $06
$1a:f4ac  1d a3 06      ora $06a3,x
$1a:f4af  19 a1 06      ora $06a1,y
$1a:f4b2  1d 9f 06      ora $069f,x
$1a:f4b5  1b            tcs
$1a:f4b6  a8            tay
$1a:f4b7  06 1d         asl $1d
$1a:f4b9  a6 06         ldx $06
$1a:f4bb  19 a8 06      ora $06a8,y
$1a:f4be  1d a3 06      ora $06a3,x
$1a:f4c1  1b            tcs
$1a:f4c2  a8            tay
$1a:f4c3  06 1d         asl $1d
$1a:f4c5  a0 06 19      ldy #$1906
$1a:f4c8  a8            tay
$1a:f4c9  06 1d         asl $1d
$1a:f4cb  a1 06         lda ($06,x)
$1a:f4cd  1b            tcs
$1a:f4ce  a4 06         ldy $06
$1a:f4d0  1d a8 06      ora $06a8,x
$1a:f4d3  19 ad 18      ora $18ad,y
$1a:f4d6  4d a1 30      eor $30a1
$1a:f4d9  c9 e0 01      cmp #$01e0
$1a:f4dc  ea            nop
$1a:f4dd  00 e1         brk #$e1
$1a:f4df  0e ed 37      asl $37ed
$1a:f4e2  a7 18         lda [$18]
$1a:f4e4  a9 b0 30      lda #$30b0
$1a:f4e7  b2 18         lda ($18)
$1a:f4e9  a7 b2         lda [$b2]
$1a:f4eb  30 b0         bmi $f49d
$1a:f4ed  0c b2 b0      tsb $b0b2
$1a:f4f0  b5 b3         lda $b3,x
$1a:f4f2  b7 b5         lda [$b5],y
$1a:f4f4  b3 b2         lda ($b2,s),y
$1a:f4f6  18            clc
$1a:f4f7  b3 12         lda ($12,s),y
$1a:f4f9  b3 00         lda ($00,s),y
$1a:f4fb  ea            nop
$1a:f4fc  00 e0         brk #$e0
$1a:f4fe  02 ed         cop #$ed
$1a:f500  64 e1         stz $e1
$1a:f502  07 66         ora [$66]
$1a:f504  c9 60 c9      cmp #$c960
$1a:f507  0c c9 0c      tsb $0cc9
$1a:f50a  5d ad b2      eor $b2ad,x
$1a:f50d  ad 18 af      lda $af18
$1a:f510  18            clc
$1a:f511  58            cli
$1a:f512  b7 0c         lda [$0c],y
$1a:f514  c9 0c 5d      cmp #$5d0c
$1a:f517  ab            plb
$1a:f518  b0 ab         bcs $f4c5
$1a:f51a  18            clc
$1a:f51b  ad 18 58      lda $5818
$1a:f51e  b5 0c         lda $0c,x
$1a:f520  c9 0c 5d      cmp #$5d0c
$1a:f523  a9 af a9      lda #$a9af
$1a:f526  18            clc
$1a:f527  ac af 60      ldy $60af
$1a:f52a  b0 30         bcs $f55c
$1a:f52c  b0 0c         bcs $f53a
$1a:f52e  b2 0c         lda ($0c)
$1a:f530  5b            tcd
$1a:f531  b0 0c         bcs $f53f
$1a:f533  5d af 0c      eor $0caf,x
$1a:f536  58            cli
$1a:f537  ad 30 5d      lda $5d30
$1a:f53a  af 0c b0 0c   lda $0cb00c
$1a:f53e  5b            tcd
$1a:f53f  af 0c 5d ad   lda $ad5d0c
$1a:f543  0c 58 ab      tsb $ab58
$1a:f546  30 5d         bmi $f5a5
$1a:f548  ad 0c af      lda $af0c
$1a:f54b  0c 5b ad      tsb $ad5b
$1a:f54e  0c 5d b2      tsb $b25d
$1a:f551  0c 58 b0      tsb $b058
$1a:f554  18            clc
$1a:f555  5d af 18      eor $18af,x
$1a:f558  5b            tcd
$1a:f559  b2 60         lda ($60)
$1a:f55b  39 b0 e1      and $e1b0,y
$1a:f55e  08            php
$1a:f55f  ed 7d 18      sbc $187d
$1a:f562  5d b0 b7      eor $b7b0,x
$1a:f565  30 6b         bmi $f5d2
$1a:f567  b8            clv
$1a:f568  18            clc
$1a:f569  5d ae b5      eor $b5ae,x
$1a:f56c  30 69         bmi $f5d7
$1a:f56e  b7 18         lda [$18],y
$1a:f570  5d ac b3      eor $b3ac,x
$1a:f573  0c b5 0c      tsb $0cb5
$1a:f576  5b            tcd
$1a:f577  b3 0c         lda ($0c,s),y
$1a:f579  5d b2 0c      eor $0cb2,x
$1a:f57c  59 b0 0c      eor $0cb0,y
$1a:f57f  5d b3 06      eor $06b3,x
$1a:f582  b2 b0         lda ($b0)
$1a:f584  0c b0 af      tsb $afb0
$1a:f587  18            clc
$1a:f588  b0 12         bcs $f59c
$1a:f58a  5a            phy
$1a:f58b  b0 e4         bcs $f571
$1a:f58d  00 e0         brk #$e0
$1a:f58f  04 ea         tsb $ea
$1a:f591  f4 ed 50      pea $50ed
$1a:f594  e1 06         sbc ($06,x)
$1a:f596  66 c9         ror $c9
$1a:f598  60            rts
$1a:f599  c9 c9 c9      cmp #$c9c9
$1a:f59c  c9 c9 18      cmp #$18c9
$1a:f59f  4d b9 c0      eor $c0b9
$1a:f5a2  30 59         bmi $f5fd
$1a:f5a4  c1 18         cmp ($18,x)
$1a:f5a6  4d b7 be      eor $beb7
$1a:f5a9  30 59         bmi $f604
$1a:f5ab  c0 18 5d      cpy #$5d18
$1a:f5ae  b5 b0         lda $b0,x
$1a:f5b0  0c 4d b2      tsb $b24d
$1a:f5b3  b0 af         bcs $f564
$1a:f5b5  ad 18 5d      lda $5d18
$1a:f5b8  ac af 60      ldy $60af
$1a:f5bb  5a            phy
$1a:f5bc  ad c9 c9      lda $c9c9
$1a:f5bf  c9 5a c9      cmp #$c95a
$1a:f5c2  00 00         brk #$00
$1a:f5c4  14 00         trb $00
$1a:f5c6  34 2c         bit $2c,x
$1a:f5c8  53 73         eor ($73,s),y
$1a:f5ca  94 77         sty $77,x
$1a:f5cc  d3 77         cmp ($77,s),y
$1a:f5ce  4e 7b 69      lsr $697b
$1a:f5d1  7b            tdc
$1a:f5d2  84 7b         sty $7b
$1a:f5d4  7d 91 b3      adc $b391,x
$1a:f5d7  91 ce         sta ($ce),y
$1a:f5d9  91 32         sta ($32),y
$1a:f5db  94 02         sty $02,x
$1a:f5dd  00 fd         brk #$fd
$1a:f5df  0f 7b 96 00   ora $00967b
$1a:f5e3  00 05         brk #$05
$1a:f5e5  1d 1b 1f      ora $1f1b,x
$1a:f5e8  14 1e         trb $1e
$1a:f5ea  08            php
$1a:f5eb  08            php
$1a:f5ec  00 40         brk #$40
$1a:f5ee  ff bb fc 01   sbc $01fcbb,x
$1a:f5f2  e1 1f         sbc ($1f,x)
$1a:f5f4  0f 54 00 5f   ora $5f0054
$1a:f5f8  e4 0f         cpx $0f
$1a:f5fa  28            plp
$1a:f5fb  f9 7a 83      sbc $837a,y
$1a:f5fe  de 7f f4      dec $f47f,x
$1a:f601  87 88         sta [$88]
$1a:f603  bd 65 ec      lda $ec65,x
$1a:f606  3f 6a 79 9b   and $9b796a,x
$1a:f60a  de de 07      dec $07de,x
$1a:f60d  f0 c7         beq $f5d6
$1a:f60f  aa            tax
$1a:f610  bc 75 e4      ldy $e475,x
$1a:f613  bf 2e 7b bb   lda $bb7b2e,x
$1a:f617  cf de 8f f1   cmp $f18fde
$1a:f61b  0f ac 7d 85   ora $857dac
$1a:f61f  ed 3f 32      sbc $323f
$1a:f622  fb            xce
$1a:f623  d7 c0         cmp [$c0],y
$1a:f625  de 17 f5      dec $f517,x
$1a:f628  4f 8e 7c 95   eor $957c8e
$1a:f62c  e5 bf         sbc $bf
$1a:f62e  76 f9         ror $f9,x
$1a:f630  f7 d1         sbc [$d1],y
$1a:f632  de 20 f5      dec $f520,x
$1a:f635  87 b0         sta [$b0]
$1a:f637  7d a5 e6      adc $e6a5,x
$1a:f63a  4c 80 40      jmp $4080
$1a:f63d  60            rts
$1a:f63e  50 34         bvc $f674
$1a:f640  f0 c1         beq $f603
$1a:f642  e1 10         sbc ($10,x)
$1a:f644  98            tya
$1a:f645  54 2e 19      mvn $19,$2e
$1a:f648  0d 87 43      ora $4387
$1a:f64b  e0 c9 e6      cpx #$e6c9
$1a:f64e  ad d7 13      lda $13d7
$1a:f651  de 1d f6      dec $f61d,x
$1a:f654  f7 8f         sbc [$8f],y
$1a:f656  fc a1 ee      jsr ($eea1,x)
$1a:f659  2e 88 44      rol $4488
$1a:f65c  62 51 30      per $26b0
$1a:f65f  f0 c5         beq $f626
$1a:f661  e3 11         sbc $11,s
$1a:f663  98            tya
$1a:f664  d4 6e         pei ($6e)
$1a:f666  39 1d 8f      and $8f1d,y
$1a:f669  47 e2         eor [$e2]
$1a:f66b  c1 e6         cmp ($e6,x)
$1a:f66d  b5 db         lda $db,x
$1a:f66f  03 de         ora $de,s
$1a:f671  9d f2 f7      sta $f7f2,x
$1a:f674  af fd a1 e6   lda $e6a1fd
$1a:f678  2e 90 48      rol $4890
$1a:f67b  64 52         stz $52
$1a:f67d  39 24 96      and $9624,y
$1a:f680  4d 27 94      eor $9427
$1a:f683  4a            lsr a
$1a:f684  65 52         adc $52
$1a:f686  b9 64 b6      lda $b664,y
$1a:f689  5d 2f a8      eor $a82f,x
$1a:f68c  54 6a 55      mvn $55,$6a
$1a:f68f  3a            dec a
$1a:f690  a5 56         lda $56
$1a:f692  ad 57 ac      lda $ac57
$1a:f695  56 6b         lsr $6b,x
$1a:f697  49 ef 0e      eor #$0eef
$1a:f69a  fb            xce
$1a:f69b  7b            tdc
$1a:f69c  c7 fe         cmp [$fe]
$1a:f69e  50 f7         bvc $f697
$1a:f6a0  17 4c         ora [$4c],y
$1a:f6a2  26 33         rol $33
$1a:f6a4  29 9c d2      and #$d29c
$1a:f6a7  6b            rtl
$1a:f6a8  36 9b         rol $9b,x
$1a:f6aa  ce 27 33      dec $3327
$1a:f6ad  a9 dc f2      lda #$f2dc
$1a:f6b0  7b            tdc
$1a:f6b1  3e 9f d8      rol $d89f,x
$1a:f6b4  2c 36 2b      bit $2b36
$1a:f6b7  1d 92 cb      ora $cb92,x
$1a:f6ba  66 b3         ror $b3
$1a:f6bc  da            phx
$1a:f6bd  2d 36 a0      and $a036
$1a:f6c0  f7 a7         sbc [$a7],y
$1a:f6c2  7c bd eb      jmp ($ebbd,x)
$1a:f6c5  ff 68 79 8b   sbc $8b7968,x
$1a:f6c9  a8            tay
$1a:f6ca  14 1a         trb $1a
$1a:f6cc  15 0e         ora $0e,x
$1a:f6ce  89 45 a3      bit #$a345
$1a:f6d1  51 e9         eor ($e9),y
$1a:f6d3  14 9a         trb $9a
$1a:f6d5  55 2e         eor $2e,x
$1a:f6d7  99 4d a7      sta $a74d,y
$1a:f6da  53 ee         eor ($ee,s),y
$1a:f6dc  17 1b         ora [$1b],y
$1a:f6de  95 ce         sta $ce,x
$1a:f6e0  e9 75 bb      sbc #$bb75
$1a:f6e3  5d ef 17      eor $17ef,x
$1a:f6e6  9b            txy
$1a:f6e7  d2 7b         cmp ($7b)
$1a:f6e9  c3 be         cmp $be,s
$1a:f6eb  de f1 ff      dec $fff1,x
$1a:f6ee  94 3d         sty $3d,x
$1a:f6f0  c5 c7         cmp $c7
$1a:f6f2  1f 41 7a 4f   ora $4f7a41,x
$1a:f6f6  c4 be         cpy $be
$1a:f6f8  b5 f6         lda $f6,x
$1a:f6fa  37 b5         and [$b5],y
$1a:f6fc  fc d3 ef      jsr ($efd3,x)
$1a:f6ff  9f 05 78 6f   sta $6f7805,x
$1a:f703  d5 be         cmp $be,x
$1a:f705  3d f2 77      and $77f2,x
$1a:f708  b8            clv
$1a:f709  3c e1 e8      bit $e8e1,x
$1a:f70c  1f 49 78 93   ora $937849,x
$1a:f710  d6 9e         dec $9e,x
$1a:f712  c5 f6         cmp $f6
$1a:f714  b7 9a         lda [$9a],y
$1a:f716  3d f1 e0      and $e0f1,x
$1a:f719  9f 0d 7a b3   sta $b37a0d,x
$1a:f71d  c7 9e         cmp [$9e]
$1a:f71f  4d f6 ff      eor $fff6
$1a:f722  9b            txy
$1a:f723  fd 01 e9      sbc $e901,x
$1a:f726  1f 11 fa cf   ora $cffa11,x
$1a:f72a  d8            cld
$1a:f72b  9e d5 f3      stz $f3d5,x
$1a:f72e  3f bd fc 11   and $11fcbd,x
$1a:f732  e1 9f         sbc ($9f,x)
$1a:f734  55 f8         eor $f8,x
$1a:f736  ef c9 9e 5d   sbc $5d9ec9
$1a:f73a  f0 f7         beq $f733
$1a:f73c  9f fd 21 e2   sta $e221fd,x
$1a:f740  2f 59 7b 0f   and $0f7b59
$1a:f744  da            phx
$1a:f745  9e 66 f7      stz $f766,x
$1a:f748  b7 81         lda [$81],y
$1a:f74a  fc 31 ea      jsr ($ea31,x)
$1a:f74d  af 1d 79 2f   lda $2f791d
$1a:f751  cb            wai
$1a:f752  9e ee f3      stz $f3ee,x
$1a:f755  f7 a3         sbc [$a3],y
$1a:f757  fc 43 eb      jsr ($eb43,x)
$1a:f75a  1f 61 7b 4f   ora $4f7b61,x
$1a:f75e  cc be f5      cpy $f5be
$1a:f761  f0 37         beq $f79a
$1a:f763  85 fd         sta $fd
$1a:f765  53 e3         eor ($e3,s),y
$1a:f767  9f 25 79 6f   sta $6f7925,x
$1a:f76b  dd be 7d      cmp $7dbe,x
$1a:f76e  f4 77 88      pea $8877
$1a:f771  3d 61 ec      and $ec61,x
$1a:f774  1f 69 79 93   ora $937969,x
$1a:f778  de 9e 05      dec $059e,x
$1a:f77b  f0 b7         beq $f734
$1a:f77d  aa            tax
$1a:f77e  3c 71 e4      bit $e471,x
$1a:f781  9f 2d 7b b3   sta $b37b2d,x
$1a:f785  cf 9e 8d f0   cmp $f08d9e
$1a:f789  ff ab fd 81   sbc $81fdab,x
$1a:f78d  ed 1f 31      sbc $311f
$1a:f790  fb            xce
$1a:f791  cf c0 9e 15   cmp $159ec0
$1a:f795  f5 3f         sbc $3f,x
$1a:f797  8d fc 91      sta $91fc
$1a:f79a  e5 9f         sbc $9f
$1a:f79c  75 f9         adc $f9,x
$1a:f79e  ef d1 9e 9d   sbc $9d9ed1
$1a:f7a2  f2 f7         sbc ($f7)
$1a:f7a4  af fd a1 e6   lda $e6a1fd
$1a:f7a8  2f 79 78 0f   and $0f7879
$1a:f7ac  c2 9e         rep #$9e
$1a:f7ae  a6 f1         ldx $f1
$1a:f7b0  b7 91         lda [$91],y
$1a:f7b2  fc b1 ee      jsr ($eeb1,x)
$1a:f7b5  af 3d 7a 2f   lda $2f7a3d
$1a:f7b9  d3 9e         cmp ($9e,s),y
$1a:f7bb  2e f5 f7      rol $f7f5
$1a:f7be  b3 fc         lda ($fc,s),y
$1a:f7c0  c3 ef         cmp $ef,s
$1a:f7c2  1f 01 78 4f   ora $4f7801,x
$1a:f7c6  d4 be         pei ($be)
$1a:f7c8  35 f2         and $f2,x
$1a:f7ca  37 95         and [$95],y
$1a:f7cc  fd d3 e7      sbc $e7d3,x
$1a:f7cf  9f 45 7a 6f   sta $6f7a45,x
$1a:f7d3  c5 be         cmp $be
$1a:f7d5  bd f6 77      lda $77f6,x
$1a:f7d8  98            tya
$1a:f7d9  3d e1 e0      and $e0e1,x
$1a:f7dc  1f 09 7a 93   ora $937a09,x
$1a:f7e0  c6 9e         dec $9e
$1a:f7e2  45 f2         eor $f2
$1a:f7e4  b7 ba         lda [$ba],y
$1a:f7e6  3c f1 e8      bit $e8f1,x
$1a:f7e9  9f 4d 78 b3   sta $b3784d,x
$1a:f7ed  d7 9e         cmp [$9e],y
$1a:f7ef  cd f2 ff      cmp $fff2
$1a:f7f2  bb            tyx
$1a:f7f3  fc 01 e1      jsr ($e101,x)
$1a:f7f6  1f 51 f8 cf   ora $cff851,x
$1a:f7fa  c8            iny
$1a:f7fb  9e 55 f7      stz $f755,x
$1a:f7fe  3f 9d fd 11   and $11fd9d,x
$1a:f802  e9 9f 15      sbc #$159f
$1a:f805  fa            plx
$1a:f806  ef d9 9e dd   sbc $dd9ed9
$1a:f80a  f4 f7 bf      pea $bff7
$1a:f80d  fc 21 ea      jsr ($ea21,x)
$1a:f810  2f 19 79 0f   and $0f7919
$1a:f814  ca            dex
$1a:f815  9e e6 f3      stz $f3e6,x
$1a:f818  b7 a1         lda [$a1],y
$1a:f81a  fd 31 e2      sbc $e231,x
$1a:f81d  af 5d 7b 2f   lda $2f7b5d
$1a:f821  db            stp
$1a:f822  9e 6e f7      stz $f76e,x
$1a:f825  f7 83         sbc [$83],y
$1a:f827  fd 43 e3      sbc $e343,x
$1a:f82a  1f 21 79 4f   ora $4f7921,x
$1a:f82e  dc be 75      jml [$75be]
$1a:f831  f4 37 a5      pea $a537
$1a:f834  fc 53 eb      jsr ($eb53,x)
$1a:f837  9f 65 7b 6f   sta $6f7b65,x
$1a:f83b  cd be fd      cmp $fdbe
$1a:f83e  f0 77         beq $f8b7
$1a:f840  a8            tay
$1a:f841  3c 61 e4      bit $e461,x
$1a:f844  1f 29 7b 93   ora $937b29,x
$1a:f848  ce 9e 85      dec $859e
$1a:f84b  f4 b7 8a      pea $8ab7
$1a:f84e  3d 71 ec      and $ec71,x
$1a:f851  9f 6d 79 b3   sta $b3796d,x
$1a:f855  df 9e 0d f4   cmp $f40d9e,x
$1a:f859  ff 8b fc 81   sbc $81fc8b,x
$1a:f85d  e5 1f         sbc $1f
$1a:f85f  71 f9         adc ($f9),y
$1a:f861  cf d0 9e 95   cmp $959ed0
$1a:f865  f1 3f         sbc ($3f),y
$1a:f867  ad fd 91      lda $91fd
$1a:f86a  ed 9f 35      sbc $359f
$1a:f86d  fb            xce
$1a:f86e  ef c1 9e 1d   sbc $1d9ec1
$1a:f872  f6 f7         inc $f7,x
$1a:f874  8f fc a1 ee   sta $eea1fc
$1a:f878  2f 39 7a 0f   and $0f7a39
$1a:f87c  d2 9e         cmp ($9e)
$1a:f87e  26 f5         rol $f5
$1a:f880  b7 b1         lda [$b1],y
$1a:f882  fd b1 e6      sbc $e6b1,x
$1a:f885  af 7d 78 2f   lda $2f787d
$1a:f889  c3 9e         cmp $9e,s
$1a:f88b  ae f1 f7      ldx $f7f1
$1a:f88e  93 fd         sta ($fd,s),y
$1a:f890  c3 e7         cmp $e7,s
$1a:f892  1f 41 7a 4f   ora $4f7a41,x
$1a:f896  c4 be         cpy $be
$1a:f898  b5 f6         lda $f6,x
$1a:f89a  37 b5         and [$b5],y
$1a:f89c  fc d3 ef      jsr ($efd3,x)
$1a:f89f  9f 05 78 6f   sta $6f7805,x
$1a:f8a3  d5 be         cmp $be,x
$1a:f8a5  3d f2 77      and $77f2,x
$1a:f8a8  b8            clv
$1a:f8a9  3c e1 e8      bit $e8e1,x
$1a:f8ac  1f 49 78 93   ora $937849,x
$1a:f8b0  d6 9e         dec $9e,x
$1a:f8b2  c5 f6         cmp $f6
$1a:f8b4  b7 9a         lda [$9a],y
$1a:f8b6  3d f1 e0      and $e0f1,x
$1a:f8b9  9f 0d 7a b3   sta $b37a0d,x
$1a:f8bd  c7 9e         cmp [$9e]
$1a:f8bf  4d f6 ff      eor $fff6
$1a:f8c2  9b            txy
$1a:f8c3  fd 01 e9      sbc $e901,x
$1a:f8c6  1f 11 fa cf   ora $cffa11,x
$1a:f8ca  d8            cld
$1a:f8cb  9e d5 f3      stz $f3d5,x
$1a:f8ce  3f bd fc 11   and $11fcbd,x
$1a:f8d2  e1 9f         sbc ($9f,x)
$1a:f8d4  55 f8         eor $f8,x
$1a:f8d6  ef c9 9e 5d   sbc $5d9ec9
$1a:f8da  f0 f7         beq $f8d3
$1a:f8dc  9f fd 21 e2   sta $e221fd,x
$1a:f8e0  2f 59 7b 0f   and $0f7b59
$1a:f8e4  da            phx
$1a:f8e5  9e 66 f7      stz $f766,x
$1a:f8e8  b7 81         lda [$81],y
$1a:f8ea  fc 31 ea      jsr ($ea31,x)
$1a:f8ed  af 1d 79 2f   lda $2f791d
$1a:f8f1  cb            wai
$1a:f8f2  9e ee f3      stz $f3ee,x
$1a:f8f5  f7 a3         sbc [$a3],y
$1a:f8f7  fc 43 eb      jsr ($eb43,x)
$1a:f8fa  1f 61 7b 4f   ora $4f7b61,x
$1a:f8fe  cc be f5      cpy $f5be
$1a:f901  f0 37         beq $f93a
$1a:f903  85 fd         sta $fd
$1a:f905  53 e3         eor ($e3,s),y
$1a:f907  9f 25 79 6f   sta $6f7925,x
$1a:f90b  dd be 7d      cmp $7dbe,x
$1a:f90e  f4 77 88      pea $8877
$1a:f911  3d 61 ec      and $ec61,x
$1a:f914  1f 69 79 93   ora $937969,x
$1a:f918  de 9e 05      dec $059e,x
$1a:f91b  f0 b7         beq $f8d4
$1a:f91d  aa            tax
$1a:f91e  3c 71 e4      bit $e471,x
$1a:f921  9f 2d 7b b3   sta $b37b2d,x
$1a:f925  cf 9e 8d f0   cmp $f08d9e
$1a:f929  ff ab fd 81   sbc $81fdab,x
$1a:f92d  ed 1f 31      sbc $311f
$1a:f930  fb            xce
$1a:f931  cf c0 9e 15   cmp $159ec0
$1a:f935  f5 3f         sbc $3f,x
$1a:f937  8d fc 91      sta $91fc
$1a:f93a  e5 9f         sbc $9f
$1a:f93c  75 f9         adc $f9,x
$1a:f93e  ef d1 9e 9d   sbc $9d9ed1
$1a:f942  f2 f7         sbc ($f7)
$1a:f944  af fd a1 ee   lda $eea1fd
$1a:f948  0d 95 cb      ora $cb95
$1a:f94b  2f 73 87 a1   and $a18773
$1a:f94f  46 6d         lsr $6d
$1a:f951  55 8a         eor $8a,x
$1a:f953  c5 a6         cmp $a6
$1a:f955  33 39         and ($39,s),y
$1a:f957  9d 3f 02      sta $023f,x
$1a:f95a  15 01         ora $01,x
$1a:f95c  02 5c         cop #$5c
$1a:f95e  22 bc 10 18   jsl $1810bc
$1a:f962  cc 66 93      cpy $9366
$1a:f965  2d 96 c6      and $c696
$1a:f968  a2 32 29      ldx #$2932
$1a:f96b  1f 57 8f ad   ora $ad8f57,x
$1a:f96f  11 1f         ora ($1f),y
$1a:f971  12 a3         ora ($a3)
$1a:f973  41 a1         eor ($a1,x)
$1a:f975  4c 66 53      jmp $5366
$1a:f978  37 07         and [$07],y
$1a:f97a  8f fc a1 e6   sta $e6a1fc
$1a:f97e  0d 9d db      ora $db9d
$1a:f981  ad 94 83      lda $8394
$1a:f984  a1 3c         lda ($3c,x)
$1a:f986  c8            iny
$1a:f987  2e 13 9b      rol $9b13
$1a:f98a  58            cli
$1a:f98b  5c 23 30 90   jml $903023
$1a:f98f  1a            inc a
$1a:f990  84 8e         sty $8e
$1a:f992  13 49         ora ($49,s),y
$1a:f994  8d 24 00      sta $0024
$1a:f997  fa            plx
$1a:f998  33 a9         and ($a9,s),y
$1a:f99a  6c a6 55      jmp ($55a6)
$1a:f99d  31 91         and ($91),y
$1a:f99f  48            pha
$1a:f9a0  a2 62 05      ldx #$0562
$1a:f9a3  e2 44         sep #$44
$1a:f9a5  62 75 01      per $fb1d
$1a:f9a8  48            pha
$1a:f9a9  54 4c 1e      mvn $1e,$4c
$1a:f9ac  bf f6 87 b8   lda $b887f6,x
$1a:f9b0  7a            ply
$1a:f9b1  97 6e         sta [$6e],y
$1a:f9b3  9e bd 00      stz $00bd,x
$1a:f9b6  34 12         bit $12,x
$1a:f9b8  d3 b1         cmp ($b1,s),y
$1a:f9ba  d2 4e         cmp ($4e)
$1a:f9bc  e6 83         inc $83
$1a:f9be  00 30         brk #$30
$1a:f9c0  c2 a1         rep #$a1
$1a:f9c2  09 80 af      ora #$af80
$1a:f9c5  42 12         wdm #$12
$1a:f9c7  e3 68         sbc $68,s
$1a:f9c9  40            rti
$1a:f9ca  8c 66 93      sty $9366
$1a:f9cd  2d 8d 2a      and $2a8d
$1a:f9d0  42 41         wdm #$41
$1a:f9d2  21 98         and ($98,x)
$1a:f9d4  27 c3         and [$c3]
$1a:f9d6  ae a3 1f      ldx $1fa3
$1a:f9d9  47 a7         eor [$a7]
$1a:f9db  ac 1e 08      ldy $081e
$1a:f9de  9a            txs
$1a:f9df  a4 20         ldy $20
$1a:f9e1  2e 1f 1f      rol $1f1f
$1a:f9e4  f9 43 cc      sbc $cc43,y
$1a:f9e7  3f 4c a6 d3   and $d3a64c,x
$1a:f9eb  69 6f 31      adc #$316f
$1a:f9ee  7b            tdc
$1a:f9ef  8b            phb
$1a:f9f0  e4 0f         cpx $0f
$1a:f9f2  47 48         eor [$48]
$1a:f9f4  01 0a         ora ($0a,x)
$1a:f9f6  18            clc
$1a:f9f7  42 03         wdm #$03
$1a:f9f9  69 8c bf      adc #$bf8c
$1a:f9fc  82 b2 8e      brl $88b1
$1a:f9ff  17 f0         ora [$f0],y
$1a:fa01  3d c2 35      and $35c2,x
$1a:fa04  21 91         and ($91,x)
$1a:fa06  44 a4 49      mvp $49,$a4
$1a:fa09  e0 99 88      cpx #$8899
$1a:fa0c  80 4c         bra $fa5a
$1a:fa0e  3c 18 8a      bit $8a18,x
$1a:fa11  7c 64 32      jmp ($3264,x)
$1a:fa14  3e 01 8b      rol $8b01,x
$1a:fa17  d7 fe         cmp [$fe],y
$1a:fa19  d0 f7         bne $fa12
$1a:fa1b  0f bc bc 07   ora $07bcbc
$1a:fa1f  e1 4f         sbc ($4f,x)
$1a:fa21  12 f8         ora ($f8)
$1a:fa23  db            stp
$1a:fa24  c8            iny
$1a:fa25  fe 58 f3      inc $f358,x
$1a:fa28  4f 9e bd 17   eor $17bd9e
$1a:fa2c  e9 cf 56      sbc #$56cf
$1a:fa2f  fa            plx
$1a:fa30  fb            xce
$1a:fa31  d9 fe e0      cmp $e0fe,y
$1a:fa34  f7 8f         sbc [$8f],y
$1a:fa36  80 bc         bra $f9f4
$1a:fa38  27 e2         and [$e2]
$1a:fa3a  4f 1a f9 1b   eor $1bf91a
$1a:fa3e  ca            dex
$1a:fa3f  fe 68 f3      inc $f368,x
$1a:fa42  cf a2 bd 37   cmp $37bda2
$1a:fa46  ea            nop
$1a:fa47  cf 5e fb 3b   cmp $3bfb5e
$1a:fa4b  db            stp
$1a:fa4c  fe f0 f0      inc $f0f0,x
$1a:fa4f  0f 84 bc 47   ora $47bc84
$1a:fa53  e3 4f         sbc $4f,s
$1a:fa55  22 f9 5b cc   jsl $cc5bf9
$1a:fa59  fe 78 f4      inc $f478,x
$1a:fa5c  4f a6 bd 57   eor $57bda6
$1a:fa60  eb            xba
$1a:fa61  cf 66 fb 7b   cmp $7bfb66
$1a:fa65  dd fe 00      cmp $00fe,x
$1a:fa68  f0 8f         beq $f9f9
$1a:fa6a  88            dey
$1a:fa6b  bc 67 e4      ldy $e467,x
$1a:fa6e  4f 2a f9 9b   eor $9bf92a
$1a:fa72  ce fe 88      dec $88fe
$1a:fa75  f4 cf aa      pea $aacf
$1a:fa78  bd 77 ec      lda $ec77,x
$1a:fa7b  cf 6e fb bb   cmp $bbfb6e
$1a:fa7f  df fe 10 f1   cmp $f110fe,x
$1a:fa83  0f 8c bc 87   ora $87bc8c
$1a:fa87  e5 4f         sbc $4f
$1a:fa89  32 f9         and ($f9)
$1a:fa8b  db            stp
$1a:fa8c  d0 fe         bne $fa8c
$1a:fa8e  98            tya
$1a:fa8f  f5 4f         sbc $4f,x
$1a:fa91  ae bd 97      ldx $97bd
$1a:fa94  ed cf 76      sbc $76cf
$1a:fa97  fb            xce
$1a:fa98  fb            xce
$1a:fa99  c1 fe         cmp ($fe,x)
$1a:fa9b  20 f1 8f      jsr $8ff1
$1a:fa9e  90 bc         bcc $fa5c
$1a:faa0  a7 e6         lda [$e6]
$1a:faa2  4f 3a fa 1b   eor $1bfa3a
$1a:faa6  d2 fe         cmp ($fe)
$1a:faa8  a8            tay
$1a:faa9  f5 cf         sbc $cf,x
$1a:faab  b2 bd         lda ($bd)
$1a:faad  b7 ee         lda [$ee],y
$1a:faaf  cf 7e f8 3b   cmp $3bf87e
$1a:fab3  c3 fe         cmp $fe,s
$1a:fab5  30 f2         bmi $faa9
$1a:fab7  0f 94 bc c7   ora $c7bc94
$1a:fabb  e7 4f         sbc [$4f]
$1a:fabd  42 fa         wdm #$fa
$1a:fabf  5b            tcd
$1a:fac0  d4 fe         pei ($fe)
$1a:fac2  b8            clv
$1a:fac3  f6 4f         inc $4f,x
$1a:fac5  b6 bd         ldx $bd,y
$1a:fac7  d7 ef         cmp [$ef],y
$1a:fac9  cf 06 f8 7b   cmp $7bf806
$1a:facd  c5 fe         cmp $fe
$1a:facf  40            rti
$1a:fad0  f2 8f         sbc ($8f)
$1a:fad2  98            tya
$1a:fad3  bc e7 e8      ldy $e8e7,x
$1a:fad6  4f 4a fa 9b   eor $9bfa4a
$1a:fada  d6 fe         dec $fe,x
$1a:fadc  c8            iny
$1a:fadd  f6 cf         inc $cf,x
$1a:fadf  ba            tsx
$1a:fae0  bd f7 e0      lda $e0f7,x
$1a:fae3  cf 0e f8 bb   cmp $bbf80e
$1a:fae7  c7 fe         cmp [$fe]
$1a:fae9  50 f3         bvc $fade
$1a:faeb  0f 9c bd 07   ora $07bd9c
$1a:faef  e9 4f 52      sbc #$524f
$1a:faf2  fa            plx
$1a:faf3  db            stp
$1a:faf4  d8            cld
$1a:faf5  fe d8 f7      inc $f7d8,x
$1a:faf8  4f be bc 17   eor $17bcbe
$1a:fafc  e1 cf         sbc ($cf,x)
$1a:fafe  16 f8         asl $f8,x
$1a:fb00  fb            xce
$1a:fb01  c9 fe 60      cmp #$60fe
$1a:fb04  f3 8f         sbc ($8f,s),y
$1a:fb06  a0 bd 27      ldy #$27bd
$1a:fb09  ea            nop
$1a:fb0a  4f 5a fb 1b   eor $1bfb5a
$1a:fb0e  da            phx
$1a:fb0f  fe e8 f7      inc $f7e8,x
$1a:fb12  cf 82 bc 37   cmp $37bc82
$1a:fb16  e2 cf         sep #$cf
$1a:fb18  1e f9 3b      asl $3bf9,x
$1a:fb1b  cb            wai
$1a:fb1c  fe 70 f4      inc $f470,x
$1a:fb1f  0f a4 bd 47   ora $47bda4
$1a:fb23  eb            xba
$1a:fb24  4f 62 fb 5b   eor $5bfb62
$1a:fb28  dc fe f8      jml [$f8fe]
$1a:fb2b  f0 4f         beq $fb7c
$1a:fb2d  86 bc         stx $bc
$1a:fb2f  57 e3         eor [$e3],y
$1a:fb31  cf 26 f9 7b   cmp $7bf926
$1a:fb35  cd fe 80      cmp $80fe
$1a:fb38  f4 8f a8      pea $a88f
$1a:fb3b  bd 67 ec      lda $ec67,x
$1a:fb3e  4f 6a fb 9b   eor $9bfb6a
$1a:fb42  de fe 08      dec $08fe,x
$1a:fb45  f0 cf         beq $fb16
$1a:fb47  8a            txa
$1a:fb48  bc 77 e4      ldy $e477,x
$1a:fb4b  cf 2e f9 bb   cmp $bbf92e
$1a:fb4f  cf fe 90 f5   cmp $f590fe
$1a:fb53  0f ac bd 87   ora $87bdac
$1a:fb57  ed 4f 72      sbc $724f
$1a:fb5a  fb            xce
$1a:fb5b  db            stp
$1a:fb5c  c0 fe 18      cpy #$18fe
$1a:fb5f  f1 4f         sbc ($4f),y
$1a:fb61  8e bc 97      stx $97bc
$1a:fb64  e5 cf         sbc $cf
$1a:fb66  36 f9         rol $f9,x
$1a:fb68  fb            xce
$1a:fb69  d1 fe         cmp ($fe),y
$1a:fb6b  a0 f5 8f      ldy #$8ff5
$1a:fb6e  b0 bd         bcs $fb2d
$1a:fb70  a7 ee         lda [$ee]
$1a:fb72  4f 7a f8 1b   eor $1bf87a
$1a:fb76  c2 fe         rep #$fe
$1a:fb78  28            plp
$1a:fb79  f1 cf         sbc ($cf),y
$1a:fb7b  92 bc         sta ($bc)
$1a:fb7d  b7 e6         lda [$e6],y
$1a:fb7f  cf 3e fa 3b   cmp $3bfa3e
$1a:fb83  d3 fe         cmp ($fe,s),y
$1a:fb85  b0 f6         bcs $fb7d
$1a:fb87  0f b4 bd c7   ora $c7bdb4
$1a:fb8b  ef 4f 02 f8   sbc $f8024f
$1a:fb8f  5b            tcd
$1a:fb90  c4 fe         cpy $fe
$1a:fb92  38            sec
$1a:fb93  f2 4f         sbc ($4f)
$1a:fb95  96 bc         stx $bc,y
$1a:fb97  d7 e7         cmp [$e7],y
$1a:fb99  cf 46 fa 7b   cmp $7bfa46
$1a:fb9d  d5 fe         cmp $fe,x
$1a:fb9f  c0 f6 8f      cpy #$8ff6
$1a:fba2  b8            clv
$1a:fba3  bd e7 e0      lda $e0e7,x
$1a:fba6  4f 0a f8 9b   eor $9bf80a
$1a:fbaa  c6 fe         dec $fe
$1a:fbac  48            pha
$1a:fbad  f2 cf         sbc ($cf)
$1a:fbaf  9a            txs
$1a:fbb0  bc f7 e8      ldy $e8f7,x
$1a:fbb3  cf 4e fa bb   cmp $bbfa4e
$1a:fbb7  d7 fe         cmp [$fe],y
$1a:fbb9  d0 f7         bne $fbb2
$1a:fbbb  0f bc bc 07   ora $07bcbc
$1a:fbbf  e1 4f         sbc ($4f,x)
$1a:fbc1  12 f8         ora ($f8)
$1a:fbc3  db            stp
$1a:fbc4  c8            iny
$1a:fbc5  fe 58 f3      inc $f358,x
$1a:fbc8  4f 9e bd 17   eor $17bd9e
$1a:fbcc  e9 cf 56      sbc #$56cf
$1a:fbcf  fa            plx
$1a:fbd0  fb            xce
$1a:fbd1  d9 fe e0      cmp $e0fe,y
$1a:fbd4  f7 8f         sbc [$8f],y
$1a:fbd6  80 bc         bra $fb94
$1a:fbd8  27 e2         and [$e2]
$1a:fbda  4f 1a f9 1b   eor $1bf91a
$1a:fbde  ca            dex
$1a:fbdf  fe 68 f3      inc $f368,x
$1a:fbe2  cf a2 bd 37   cmp $37bda2
$1a:fbe6  ea            nop
$1a:fbe7  cf 5e fb 3b   cmp $3bfb5e
$1a:fbeb  db            stp
$1a:fbec  fe f0 f0      inc $f0f0,x
$1a:fbef  0f 84 bc 47   ora $47bc84
$1a:fbf3  e3 4f         sbc $4f,s
$1a:fbf5  22 f9 5b cc   jsl $cc5bf9
$1a:fbf9  fe 78 f4      inc $f478,x
$1a:fbfc  4f a6 bd 57   eor $57bda6
$1a:fc00  eb            xba
$1a:fc01  cf 66 fb 7b   cmp $7bfb66
$1a:fc05  dd fe 00      cmp $00fe,x
$1a:fc08  f0 8f         beq $fb99
$1a:fc0a  88            dey
$1a:fc0b  bc 67 e4      ldy $e467,x
$1a:fc0e  4f 2a f9 9b   eor $9bf92a
$1a:fc12  ce fe 88      dec $88fe
$1a:fc15  f4 cf aa      pea $aacf
$1a:fc18  bd 77 ec      lda $ec77,x
$1a:fc1b  cf 6e fb bb   cmp $bbfb6e
$1a:fc1f  df fe 10 f1   cmp $f110fe,x
$1a:fc23  0f 8c bc 87   ora $87bc8c
$1a:fc27  e5 4f         sbc $4f
$1a:fc29  32 f9         and ($f9)
$1a:fc2b  db            stp
$1a:fc2c  d0 fe         bne $fc2c
$1a:fc2e  98            tya
$1a:fc2f  f5 4f         sbc $4f,x
$1a:fc31  ae bd 97      ldx $97bd
$1a:fc34  ed cf 76      sbc $76cf
$1a:fc37  fb            xce
$1a:fc38  fb            xce
$1a:fc39  c1 fe         cmp ($fe,x)
$1a:fc3b  20 f1 8f      jsr $8ff1
$1a:fc3e  90 bc         bcc $fbfc
$1a:fc40  a7 e6         lda [$e6]
$1a:fc42  4f 3a fa 1b   eor $1bfa3a
$1a:fc46  d2 fe         cmp ($fe)
$1a:fc48  a8            tay
$1a:fc49  f5 cf         sbc $cf,x
$1a:fc4b  b2 bd         lda ($bd)
$1a:fc4d  b7 ee         lda [$ee],y
$1a:fc4f  cf 7e f8 3b   cmp $3bf87e
$1a:fc53  c3 fe         cmp $fe,s
$1a:fc55  30 f2         bmi $fc49
$1a:fc57  0f 94 bc c7   ora $c7bc94
$1a:fc5b  e7 4f         sbc [$4f]
$1a:fc5d  42 fa         wdm #$fa
$1a:fc5f  5b            tcd
$1a:fc60  d4 fe         pei ($fe)
$1a:fc62  b8            clv
$1a:fc63  f6 4f         inc $4f,x
$1a:fc65  b6 bd         ldx $bd,y
$1a:fc67  d7 ef         cmp [$ef],y
$1a:fc69  cf 06 f8 7b   cmp $7bf806
$1a:fc6d  c5 fe         cmp $fe
$1a:fc6f  40            rti
$1a:fc70  f2 8f         sbc ($8f)
$1a:fc72  98            tya
$1a:fc73  bc e7 e8      ldy $e8e7,x
$1a:fc76  4f 4a fa 9b   eor $9bfa4a
$1a:fc7a  d6 fe         dec $fe,x
$1a:fc7c  c8            iny
$1a:fc7d  f6 cf         inc $cf,x
$1a:fc7f  ba            tsx
$1a:fc80  bd f7 e0      lda $e0f7,x
$1a:fc83  cf 0e f8 bb   cmp $bbf80e
$1a:fc87  c7 fe         cmp [$fe]
$1a:fc89  50 f3         bvc $fc7e
$1a:fc8b  0f 9c bd 07   ora $07bd9c
$1a:fc8f  e9 4f 52      sbc #$524f
$1a:fc92  fa            plx
$1a:fc93  db            stp
$1a:fc94  d8            cld
$1a:fc95  fe d8 f7      inc $f7d8,x
$1a:fc98  4f be bc 17   eor $17bcbe
$1a:fc9c  e1 cf         sbc ($cf,x)
$1a:fc9e  16 f8         asl $f8,x
$1a:fca0  fb            xce
$1a:fca1  c9 fe 60      cmp #$60fe
$1a:fca4  f3 8f         sbc ($8f,s),y
$1a:fca6  a0 bd 27      ldy #$27bd
$1a:fca9  ea            nop
$1a:fcaa  4f 5a fb 1b   eor $1bfb5a
$1a:fcae  da            phx
$1a:fcaf  fe e8 f7      inc $f7e8,x
$1a:fcb2  cf 82 bc 37   cmp $37bc82
$1a:fcb6  e2 cf         sep #$cf
$1a:fcb8  1e f9 3b      asl $3bf9,x
$1a:fcbb  cb            wai
$1a:fcbc  fe 70 f4      inc $f470,x
$1a:fcbf  0f a4 bd 47   ora $47bda4
$1a:fcc3  eb            xba
$1a:fcc4  4f 62 fb 5b   eor $5bfb62
$1a:fcc8  dc fe f8      jml [$f8fe]
$1a:fccb  f0 4f         beq $fd1c
$1a:fccd  86 bc         stx $bc
$1a:fccf  57 e3         eor [$e3],y
$1a:fcd1  cf 26 f9 7b   cmp $7bf926
$1a:fcd5  cd fe 80      cmp $80fe
$1a:fcd8  f4 8f a8      pea $a88f
$1a:fcdb  bd 67 ec      lda $ec67,x
$1a:fcde  4f 6a fb 9b   eor $9bfb6a
$1a:fce2  de fe 08      dec $08fe,x
$1a:fce5  f0 cf         beq $fcb6
$1a:fce7  8a            txa
$1a:fce8  bc 77 e4      ldy $e477,x
$1a:fceb  cf 2e f9 bb   cmp $bbf92e
$1a:fcef  cf fe 90 f5   cmp $f590fe
$1a:fcf3  0f ac bd 87   ora $87bdac
$1a:fcf7  ed 4f 72      sbc $724f
$1a:fcfa  fb            xce
$1a:fcfb  db            stp
$1a:fcfc  c0 fe 18      cpy #$18fe
$1a:fcff  f1 4f         sbc ($4f),y
$1a:fd01  8e bc 97      stx $97bc
$1a:fd04  e5 cf         sbc $cf
$1a:fd06  36 f9         rol $f9,x
$1a:fd08  fb            xce
$1a:fd09  d1 fe         cmp ($fe),y
$1a:fd0b  a0 f5 8f      ldy #$8ff5
$1a:fd0e  b0 bd         bcs $fccd
$1a:fd10  a7 ee         lda [$ee]
$1a:fd12  4f 7a f8 1b   eor $1bf87a
$1a:fd16  c2 fe         rep #$fe
$1a:fd18  28            plp
$1a:fd19  f1 cf         sbc ($cf),y
$1a:fd1b  92 bc         sta ($bc)
$1a:fd1d  b7 e6         lda [$e6],y
$1a:fd1f  cf 3e fa 3b   cmp $3bfa3e
$1a:fd23  d3 fe         cmp ($fe,s),y
$1a:fd25  b0 f6         bcs $fd1d
$1a:fd27  0f b4 bd c7   ora $c7bdb4
$1a:fd2b  20 03 03      jsr $0303
$1a:fd2e  00 09         brk #$09
$1a:fd30  80 3b         bra $fd6d
$1a:fd32  fc 01 e1      jsr ($e101,x)
$1a:fd35  1f 11 78 cf   ora $cf7811,x
$1a:fd39  c8            iny
$1a:fd3a  9e 55 f3      stz $f355,x
$1a:fd3d  37 9d         and [$9d],y
$1a:fd3f  fd 11 e9      sbc $e911,x
$1a:fd42  9f 55 7a ef   sta $ef7a55,x
$1a:fd46  d9 9e dd      cmp $dd9e,y
$1a:fd49  f7 77         sbc [$77],y
$1a:fd4b  bc ca 61      ldy $61ca,x
$1a:fd4e  31 99         and ($99),y
$1a:fd50  4c e6 8f      jmp $8fe6
$1a:fd53  38            sec
$1a:fd54  d9 4e 27      cmp $274e,y
$1a:fd57  33 a9         and ($a9,s),y
$1a:fd59  dc f2 7a      jml [$7af2]
$1a:fd5c  f3 6d         sbc ($6d,s),y
$1a:fd5e  ce ea 81      dec $81ea
$1a:fd61  41 a1         eor ($a1,x)
$1a:fd63  50 e8         bvc $fd4d
$1a:fd65  94 5a         sty $5a,x
$1a:fd67  33 cd         and ($cd,s),y
$1a:fd69  78            sei
$1a:fd6a  3c 2a 45      bit $452a,x
$1a:fd6d  26 95         rol $95
$1a:fd6f  4b            phk
$1a:fd70  a6 53         ldx $53
$1a:fd72  69 cf 34      adc #$34cf
$1a:fd75  e4 72         cpx $72
$1a:fd77  79 55 0a      adc $0a55,y
$1a:fd7a  8d 4a a7      sta $a74a
$1a:fd7d  54 aa d5      mvn $d5,$aa
$1a:fd80  aa            tax
$1a:fd81  ef 33 e8 74   sbc $74e833
$1a:fd85  7a            ply
$1a:fd86  55 8a         eor $8a,x
$1a:fd88  cc 62 b7      cpy $b762
$1a:fd8b  5c ae d7 ab   jml $abd7ae
$1a:fd8f  ef 33 ec 76   sbc $76ec33
$1a:fd93  7b            tdc
$1a:fd94  56 0b         lsr $0b,x
$1a:fd96  0c 62 c7      tsb $c762
$1a:fd99  64 b2         stz $b2
$1a:fd9b  d9 ac ef      cmp $efac,y
$1a:fd9e  33 f0         and ($f0,s),y
$1a:fda0  78            sei
$1a:fda1  7c 56 88      jmp ($8856,x)
$1a:fda4  1c 62 09      trb $0962
$1a:fda7  6c b6 db      jmp ($dbb6)
$1a:fdaa  ad e6 cf      lda $cfe6
$1a:fdad  79 97 a3      adc $a397,y
$1a:fdb0  d3 ea         cmp ($ea,s),y
$1a:fdb2  b8            clv
$1a:fdb3  44 e4 f1      mvp $f1,$e4
$1a:fdb6  4b            phk
$1a:fdb7  a5 d6         lda $d6
$1a:fdb9  ed 77 3e      sbc $3e77
$1a:fdbc  34 6e         bit $6e,x
$1a:fdbe  35 62         and $62,x
$1a:fdc0  8e 47 4f      stx $4f47
$1a:fdc3  31 20         and ($20),y
$1a:fdc5  52 85         eor ($85)
$1a:fdc7  8a            txa
$1a:fdc8  b5 1c         lda $1c,x
$1a:fdca  93 1e         sta ($1e,s),y
$1a:fdcc  93 6d         sta ($6d,s),y
$1a:fdce  b7 db         lda [$db],y
$1a:fdd0  f1 ac         sbc ($ac),y
$1a:fdd2  51 9f         eor ($9f),y
$1a:fdd4  85 8a         sta $8a
$1a:fdd6  31 c7         and ($c7),y
$1a:fdd8  e7 73         sbc [$73]
$1a:fdda  b9 ef 31      lda $31ef,y
$1a:fddd  df 6f f7 f0   cmp $f0f76f,x
$1a:fde1  bb            tyx
$1a:fde2  14 9f         trb $9f
$1a:fde4  e2 c7         sep #$c7
$1a:fde6  08            php
$1a:fde7  67 5b         adc [$5b]
$1a:fde9  ad d7 5f      lda $5fd7
$1a:fdec  0e c3 61      asl $61c3
$1a:fdef  7b            tdc
$1a:fdf0  69 87 ca      adc #$ca87
$1a:fdf3  c5 f3         cmp $f3
$1a:fdf5  6c 05 cb      jmp ($cb05)
$1a:fdf8  63 b1         adc $b1,s
$1a:fdfa  66 13         ror $13
$1a:fdfc  c3 c0         cmp $c0,s
$1a:fdfe  3e 12 f1      rol $f112,x
$1a:fe01  0e 41 c6      asl $c641
$1a:fe04  02 35         cop #$35
$1a:fe06  51 6b         eor ($6b),y
$1a:fe08  8c d4 5a      sty $5ad4
$1a:fe0b  a3 b2         lda $b2,s
$1a:fe0d  19 18 bc      ora $bc18,y
$1a:fe10  87 0a         sta [$0a]
$1a:fe12  38            sec
$1a:fe13  71 ab         adc ($ab),y
$1a:fe15  0e 54 e3      asl $e354
$1a:fe18  46 cf         lsr $cf
$1a:fe1a  3e fa 3b      rol $3bfa,x
$1a:fe1d  d3 da         cmp ($da,s),y
$1a:fe1f  bc f6 7e      ldy $7ef6,x
$1a:fe22  08            php
$1a:fe23  7d fb db      adc $dbfb,x
$1a:fe26  67 ee         adc [$ee]
$1a:fe28  ef 9f be 2f   sbc $2fbe9f
$1a:fe2c  f2 07         sbc ($07)
$1a:fe2e  94 7c         sty $7c,x
$1a:fe30  c5 e7         cmp $e7
$1a:fe32  3f 42 7a 57   and $577a42,x
$1a:fe36  d4 de         pei ($de)
$1a:fe38  b7 f6         lda [$f6],y
$1a:fe3a  47 b6         eor [$b6]
$1a:fe3c  7c 34 7b      jmp ($7b34,x)
$1a:fe3f  fd ff a7      sbc $a7ff,x
$1a:fe42  8d 62 7a      sta $7a62
$1a:fe45  0c 63 8f      tsb $8f63
$1a:fe48  76 eb         ror $eb,x
$1a:fe4a  75 ba         adc $ba,x
$1a:fe4c  f0 0d         beq $fe5b
$1a:fe4e  86 c2         stx $c2
$1a:fe50  f5 e1         sbc $e1,x
$1a:fe52  85 bd         sta $bd
$1a:fe54  0e 19 6e      asl $6e19
$1a:fe57  b9 ec 76      lda $76ec,y
$1a:fe5a  3c f7 80      bit $80f7,x
$1a:fe5d  78            sei
$1a:fe5e  00 43         brk #$43
$1a:fe60  f3 b1         sbc ($b1,s),y
$1a:fe62  7c 81 03      jmp ($0381,x)
$1a:fe65  6f 7d 94 02   adc $02947d
$1a:fe69  51 24         eor ($24),y
$1a:fe6b  92 3d         sta ($3d)
$1a:fe6d  0a            asl a
$1a:fe6e  4e 22 09      lsr $0922
$1a:fe71  6b            rtl
$1a:fe72  78            sei
$1a:fe73  e6 d5         inc $d5
$1a:fe75  aa            tax
$1a:fe76  d3 d0         cmp ($d0,s),y
$1a:fe78  ac 55 a8      ldy $a855
$1a:fe7b  c4 dc         cpy $dc
$1a:fe7d  58            cli
$1a:fe7e  8f 40 f9 3d   sta $3df940
$1a:fe82  04 2a         tsb $2a
$1a:fe84  03 a5         ora $a5,s
$1a:fe86  9f 3d 02 d4   sta $d4023d,x
$1a:fe8a  54 19 4b      mvn $4b,$19
$1a:fe8d  dc 27 e3      jml [$e327]
$1a:fe90  c6 bc         dec $bc
$1a:fe92  c1 65         cmp ($65,x)
$1a:fe94  90 6b         bcc $ff01
$1a:fe96  c8            iny
$1a:fe97  9c 37 05      stz $0537
$1a:fe9a  c7 80         cmp [$80]
$1a:fe9c  c2 60         rep #$60
$1a:fe9e  46 80         lsr $80
$1a:fea0  b1 6b         lda ($6b),y
$1a:fea2  e0 e7 c0      cpx #$c0e7
$1a:fea5  27 97         and [$97]
$1a:fea7  cc e8 7f      cpy $7fe8
$1a:feaa  28            plp
$1a:feab  cf 00 b8 f0   cmp $f0b800
$1a:feaf  88            dey
$1a:feb0  4c 28 d0      jmp $d028
$1a:feb3  11 89         ora ($89),y
$1a:feb5  a9 71 e2      lda #$e271
$1a:feb8  11 18         ora ($18),y
$1a:feba  92 60         sta ($60)
$1a:febc  49 6e a4      eor #$a46e
$1a:febf  52 db         eor ($db)
$1a:fec1  7c a4 ea      jmp ($eaa4,x)
$1a:fec4  51 0a         eor ($0a),y
$1a:fec6  00 ea         brk #$ea
$1a:fec8  07 00         ora [$00]
$1a:feca  32 21         and ($21)
$1a:fecc  d1 ed         cmp ($ed),y
$1a:fece  b6 f2         ldx $f2,y
$1a:fed0  19 24 88      ora $8824,y
$1a:fed3  08            php
$1a:fed4  51 99         eor ($99),y
$1a:fed6  1c 92 4b      trb $4b92
$1a:fed9  ce e7 8b      dec $8be7
$1a:fedc  04 f8         tsb $f8
$1a:fede  2f 17 77 6b   and $6b7717
$1a:fee2  f0 9e         beq $fe82
$1a:fee4  1e 01 f0      asl $f001,x
$1a:fee7  97 88         sta [$88],y
$1a:fee9  fc 89 e3      jsr ($e389,x)
$1a:feec  58            cli
$1a:feed  20 59 71      jsr $7159
$1a:fef0  c7 e2         cmp [$e2]
$1a:fef2  3f 04 29 0f   and $0f2904,x
$1a:fef6  4c ba 68      jmp $68ba
$1a:fef9  e6 2d         inc $2d
$1a:fefb  32 39         and ($39)
$1a:fefd  c7 f4         cmp [$f4]
$1a:feff  ad f6 6f      lda $6ff6
$1a:ff02  b7 bd         lda [$bd],y
$1a:ff04  df e0 0f 08   cmp $080fe0,x
$1a:ff08  f8            sed
$1a:ff09  8b            phb
$1a:ff0a  c6 7e         dec $7e
$1a:ff0c  44 f2 af      mvp $af,$f2
$1a:ff0f  99 bc ef      sta $efbc,y
$1a:ff12  e8            inx
$1a:ff13  8f 4c fa f4   sta $f4fa4c
$1a:ff17  e3 13         sbc $13,s
$1a:ff19  7f ca 7e bd   adc $bd7eca,x
$1a:ff1d  6b            rtl
$1a:ff1e  00 84         brk #$84
$1a:ff20  ac f2 7f      ldy $7ff2
$1a:ff23  fe 59 ef      inc $ef59,x
$1a:ff26  f5 3f         sbc $3f,x
$1a:ff28  5b            tcd
$1a:ff29  ed fc ba      sbc $bafc
$1a:ff2c  3d 2a b1      and $b12a,x
$1a:ff2f  3d 06 31      and $3106,x
$1a:ff32  2b            pld
$1a:ff33  8f cb fa dd   sta $ddfacb
$1a:ff37  77 68         adc [$68],y
$1a:ff39  f8            sed
$1a:ff3a  2f 70 b7 a1   and $a1b770
$1a:ff3e  c3 2e         cmp $2e,s
$1a:ff40  56 f7         lsr $f7,x
$1a:ff42  e8            inx
$1a:ff43  ab            plb
$1a:ff44  43 d1         eor $d1,s
$1a:ff46  e9 e3 58      sbc #$58e3
$1a:ff49  be 7f df      ldx $df7f,y
$1a:ff4c  94 63         sty $63,x
$1a:ff4e  8f 76 bb aa   sta $aabb76
$1a:ff52  cf c1 e1 a3   cmp $a3e1c1
$1a:ff56  c3 5e         cmp $5e,s
$1a:ff58  83 0e         sta $0e,s
$1a:ff5a  87 db         sta [$db]
$1a:ff5c  ad e1 c5      lda $c5e1
$1a:ff5f  a7 c5         lda [$c5]
$1a:ff61  6d 31 9b      adc $9b31
$1a:ff64  5c 5a 2e 2a   jml $2a2e5a
$1a:ff68  5d 9e d3      eor $d39e,x
$1a:ff6b  6b            rtl
$1a:ff6c  78            sei
$1a:ff6d  8f 5c 63 d7   sta $d7635c
$1a:ff71  cb            wai
$1a:ff72  ed fa fe      sbc $fefa
$1a:ff75  ab            plb
$1a:ff76  3d de f3      and $f3de,x
$1a:ff79  7b            tdc
$1a:ff7a  80 c0         bra $ff3c
$1a:ff7c  e0 b0 78      cpx #$78b0
$1a:ff7f  4c 2e 1b      jmp $1b2e
$1a:ff82  0e ab 3e      asl $3eab
$1a:ff85  1f 13 8b 88   ora $888b13,x
$1a:ff89  c4 e2         cpy $e2
$1a:ff8b  b1 78         lda ($78),y
$1a:ff8d  cc 6e 3b      cpy $3b6e
$1a:ff90  1e aa 4e      asl $4eaa,x
$1a:ff93  67 37         adc [$37]
$1a:ff95  21 91         and ($91,x)
$1a:ff97  c9 64 f2      cmp #$f264
$1a:ff9a  99 5c b2      sta $b25c,y
$1a:ff9d  7d 7a 9d      adc $9d7a,x
$1a:ffa0  5c c6 67 35   jml $3567c6
$1a:ffa4  9b            txy
$1a:ffa5  ce 67 73      dec $7367
$1a:ffa8  c9 f5 ee      cmp #$eef5
$1a:ffab  77 74         adc [$74],y
$1a:ffad  1a            inc a
$1a:ffae  1d 16 8f      ora $8f16,x
$1a:ffb1  49 a5 d3      eor #$d3a5
$1a:ffb4  23 17         and $17,s
$1a:ffb6  c9 e5 d4      cmp #$d4e5
$1a:ffb9  6a            ror a
$1a:ffba  75 5a         adc $5a,x
$1a:ffbc  bd 66 b7      lda $b766,x
$1a:ffbf  5c 9a 4f 67   jml $674f9a
$1a:ffc3  b7 db         lda [$db],y
$1a:ffc5  db            stp
$1a:ffc6  e5 e5         sbc $e5
$1a:ffc8  fb            xce
$1a:ffc9  dd ff 77      cmp $77ff,x
$1a:ffcc  bb            tyx
$1a:ffcd  de d3 3f      dec $3fd3,x
$1a:ffd0  a7 d7         lda [$d7]
$1a:ffd2  eb            xba
$1a:ffd3  e3 e9         sbc $e9,s
$1a:ffd5  e7 fc         sbc [$fc]
$1a:ffd7  de 7f b7      dec $b77f,x
$1a:ffda  db            stp
$1a:ffdb  ee e3 8d      inc $8de3
$1a:ffde  3b            tsc
$1a:ffdf  32 1c         and ($1c)
$1a:ffe1  1e f1 f0      asl $f0f1,x
$1a:ffe4  17 84         ora [$84],y
$1a:ffe6  fc 49 e3      jsr ($e349,x)
$1a:ffe9  5f 23 79 5f   eor $5f7923,x
$1a:ffed  cd 1e 79      cmp $791e
$1a:fff0  f4 57 a6      pea $a657
$1a:fff3  fd 59 eb      sbc $eb59,x
$1a:fff6  df 67 7b 7f   cmp $7f7b67,x
$1a:fffa  40            rti
$1a:fffb  00 00         brk #$00
$1a:fffd  00 00         brk #$00
$1a:ffff  00 04         brk #$04
