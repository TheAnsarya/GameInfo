; Soul Blazer (SNES) - Bank $07
; Disassembled from ROM
; File offset: $038000-$03ffff
; CPU address: $07:$8000-$07:$ffff
;===========================================================

.bank $07
.org $8000

$07:8000  01 0b         ora ($0b,x)
$07:8002  00 00         brk #$00
$07:8004  00 00         brk #$00
$07:8006  00 00         brk #$00
$07:8008  00 00         brk #$00
$07:800a  00 74         brk #$74
$07:800c  05 dc         ora $dc
$07:800e  00 c2         brk #$c2
$07:8010  61 be         adc ($be,x)
$07:8012  03 2e         ora $2e,s
$07:8014  80 f1         bra $8007
$07:8016  fc d1 64      jsr ($64d1,x)
$07:8019  0e ed f5      asl $f5ed
$07:801c  3d 90 ee      and $ee90,x
$07:801f  d0 21         bne $8042
$07:8021  0e d1 42      asl $42d1
$07:8024  ff e0 84 6f   sbc $6f84e0,x
$07:8028  af 23 11 c9   lda $c91123
$07:802c  26 1f         rol $1f
$07:802e  dd 80 25      cmp $2580,x
$07:8031  0d 0d 92      ora $920d
$07:8034  4d 13 21      eor $2113
$07:8037  ee 90 21      inc $2190
$07:803a  fd d1 10      sbc $10d1,x
$07:803d  10 f1         bpl $8030
$07:803f  33 0f         and ($0f,s),y
$07:8041  94 02         sty $02,x
$07:8043  4e b1 ef      lsr $efb1
$07:8046  33 fe         and ($fe,s),y
$07:8048  f3 10         sbc ($10,s),y
$07:804a  80 66         bra $80b2
$07:804c  4e d0 14      lsr $14d0
$07:804f  0b            phd
$07:8050  d0 35         bne $8087
$07:8052  1f 84 12 2d   ora $2d1284,x
$07:8056  2d c4 4c      and $4cc4
$07:8059  d2 14         cmp ($14)
$07:805b  3e 80 13      rol $1380,x
$07:805e  2f 33 db bf   and $bfdb33
$07:8062  25 51         and $51
$07:8064  ef 84 27 19   sbc $192784
$07:8068  d1 03         cmp ($03),y
$07:806a  4d a0 05      eor $05a0
$07:806d  4a            lsr a
$07:806e  90 df         bcc $804f
$07:8070  ce fe 10      dec $10fe
$07:8073  c1 21         cmp ($21,x)
$07:8075  43 1f         eor $1f,s
$07:8077  94 01         sty $01,x
$07:8079  22 ef 1e 01   jsl $011eef
$07:807d  bf 0a f4 94   lda $94f40a,x
$07:8081  f0 42         beq $80c5
$07:8083  13 32         ora ($32,s),y
$07:8085  4f d0 fd ee   eor $eefdd0
$07:8089  98            tya
$07:808a  f1 2f         sbc ($2f),y
$07:808c  12 fe         ora ($fe)
$07:808e  02 2c         cop #$2c
$07:8090  e3 0d         sbc $0d,s
$07:8092  94 01         sty $01,x
$07:8094  10 ff         bpl $8095
$07:8096  13 ff         ora ($ff,s),y
$07:8098  dc 25 fd      jml [$fd25]
$07:809b  94 e0         sty $e0,x
$07:809d  23 4e         and $4e,s
$07:809f  ce 14 4f      dec $4f14
$07:80a2  cb            wai
$07:80a3  d3 94         cmp ($94,s),y
$07:80a5  31 0c         and ($0c),y
$07:80a7  c2 64         rep #$64
$07:80a9  0d b0 53      ora $53b0
$07:80ac  0b            phd
$07:80ad  94 ef         sty $ef,x
$07:80af  15 f9         ora $f9,x
$07:80b1  ed 36 eb      sbc $eb36
$07:80b4  fd e4 94      sbc $94e4,x
$07:80b7  4e e3 36      lsr $36e3
$07:80ba  7f 10 00 dd   adc $dd0010,x
$07:80be  cb            wai
$07:80bf  98            tya
$07:80c0  22 1f 30 d3   jsl $d3301f
$07:80c4  3c e2 e1      bit $e1e2,x
$07:80c7  0c 94 d1      tsb $d194
$07:80ca  dd 41 03      cmp $0341,x
$07:80cd  cf 31 0f bf   cmp $bf0f31
$07:80d1  94 10         sty $10,x
$07:80d3  24 e0         bit $e0
$07:80d5  1f 44 ad 21   ora $21ad44,x
$07:80d9  21 94         and ($94,x)
$07:80db  ce 03 21      dec $2103
$07:80de  09 e5 fe      ora #$fee5
$07:80e1  eb            xba
$07:80e2  0e 94 f2      asl $f294
$07:80e5  bd 2f 46      lda $462f,x
$07:80e8  22 54 35 1d   jsl $1d3554
$07:80ec  94 dc         sty $dc,x
$07:80ee  cd dd ee      cmp $eedd
$07:80f1  23 34         and $34,s
$07:80f3  33 41         and ($41,s),y
$07:80f5  94 21         sty $21,x
$07:80f7  dd d0 fd      cmp $fdd0,x
$07:80fa  df 22 2f 12   cmp $122f22,x
$07:80fe  98            tya
$07:80ff  d3 de         cmp ($de,s),y
$07:8101  0d 54 d1      ora $d154
$07:8104  ef 43 cf a4   sbc $a4cf43
$07:8108  ff f0 1e f0   sbc $f01ef0,x
$07:810c  d3 30         cmp ($30,s),y
$07:810e  10 e1         bpl $80f1
$07:8110  94 4c         sty $4c,x
$07:8112  dc ce be      jml [$bece]
$07:8115  d0 1e         bne $8135
$07:8117  10 47         bpl $8160
$07:8119  98            tya
$07:811a  a6 fc         ldx $fc
$07:811c  6b            rtl
$07:811d  01 dd         ora ($dd,x)
$07:811f  20 10 ff      jsr $ff10
$07:8122  98            tya
$07:8123  44 e1 3c      mvp $3c,$e1
$07:8126  30 b3         bmi $80db
$07:8128  fd 1f 11      sbc $111f,x
$07:812b  94 0f         sty $0f,x
$07:812d  e2 0f         sep #$0f
$07:812f  3f 01 ab f0   and $f0ab01,x
$07:8133  20 a8 00      jsr $00a8
$07:8136  1f 30 c1 0e   ora $0ec130,x
$07:813a  4f c1 f2 a8   eor $a8f2c1
$07:813e  0f 2e f4 e1   ora $e1f42e
$07:8142  2e 01 00      rol $0001
$07:8145  ff 98 a1 6c   sbc $6ca198,x
$07:8149  1f f3 22 13   ora $1322f3,x
$07:814d  fd d4 94      sbc $94d4,x
$07:8150  1f ea e0 e5   ora $e5e0ea,x
$07:8154  2f 40 11 ec   and $ec1140
$07:8158  98            tya
$07:8159  e0 41 0d      cpx #$0d41
$07:815c  4f 33 cd 3b   eor $3bcd33
$07:8160  3f a8 c4 0d   and $0dc4a8,x
$07:8164  30 02         bmi $8168
$07:8166  00 f1         brk #$f1
$07:8168  d1 0f         cmp ($0f),y
$07:816a  98            tya
$07:816b  1f 2d 15 b1   ora $b1152d,x
$07:816f  0c f1 10      tsb $10f1
$07:8172  20 98 02      jsr $0298
$07:8175  33 ff         and ($ff,s),y
$07:8177  de ef 0c      dec $0cef,x
$07:817a  e0 24 98      cpx #$9824
$07:817d  22 12 32 ec   jsl $ec3212
$07:8181  fe fd 03      inc $03fd,x
$07:8184  e4 94         cpx $94
$07:8186  0d 34 42      ora $4234
$07:8189  ed fe cb      sbc $cbfe
$07:818c  cd 11 a8      cmp $a811
$07:818f  1f c2 1f 3d   ora $3d1fc2,x
$07:8193  b4 30         ldy $30,x
$07:8195  11 d1         ora ($d1),y
$07:8197  98            tya
$07:8198  2c 2f ad      bit $ad2f
$07:819b  03 10         ora $10,s
$07:819d  12 01         ora ($01)
$07:819f  32 98         and ($98)
$07:81a1  f1 cd         sbc ($cd),y
$07:81a3  2e 20 d2      rol $d220
$07:81a6  04 0d         tsb $0d
$07:81a8  5e a4 cf      lsr $cfa4,x
$07:81ab  0d ff c0      ora $c0ff
$07:81ae  00 32         brk #$32
$07:81b0  24 31         bit $31
$07:81b2  a4 00         ldy $00
$07:81b4  0f 0e ee f3   ora $f3ee0e
$07:81b8  0c ed d1      tsb $d1ed
$07:81bb  a4 10         ldy $10
$07:81bd  ee 23 45      inc $4523
$07:81c0  00 11         brk #$11
$07:81c2  30 cd         bmi $8191
$07:81c4  94 c0         sty $c0,x
$07:81c6  42 0c         wdm #$0c
$07:81c8  c2 33         rep #$33
$07:81ca  1e ce 13      asl $13ce,x
$07:81cd  98            tya
$07:81ce  21 cf         and ($cf,x)
$07:81d0  3f 11 cf ef   and $efcf11,x
$07:81d4  34 fd         bit $fd,x
$07:81d6  a8            tay
$07:81d7  30 e5         bmi $81be
$07:81d9  d0 0b         bne $81e6
$07:81db  00 e1         brk #$e1
$07:81dd  13 00         ora ($00,s),y
$07:81df  98            tya
$07:81e0  f1 03         sbc ($03),y
$07:81e2  6f cb ff 0d   adc $0dffcb
$07:81e6  ec 05 98      cpx $9805
$07:81e9  41 20         eor ($20,x)
$07:81eb  11 61         ora ($61),y
$07:81ed  ac 0d 22      ldy $220d
$07:81f0  c1 a8         cmp ($a8,x)
$07:81f2  fe 42 f0      inc $f042,x
$07:81f5  fe 22 fe      inc $fe22,x
$07:81f8  2e 03 a4      rol $a403
$07:81fb  12 10         ora ($10)
$07:81fd  f0 2d         beq $822c
$07:81ff  04 cf         tsb $cf
$07:8201  1e 10 94      asl $9410,x
$07:8204  b6 22         ldx $22,y
$07:8206  1b            tcs
$07:8207  34 03         bit $03,x
$07:8209  ce ff 30      dec $30ff
$07:820c  98            tya
$07:820d  00 ed         brk #$ed
$07:820f  c1 f3         cmp ($f3,x)
$07:8211  5f 01 01 43   eor $430101,x
$07:8215  98            tya
$07:8216  fc a1 e0      jsr ($e0a1,x)
$07:8219  fd b1 66      sbc $66b1,x
$07:821c  10 11         bpl $822f
$07:821e  98            tya
$07:821f  41 fd         eor ($fd,x)
$07:8221  ce ff 21      dec $21ff
$07:8224  b1 52         lda ($52),y
$07:8226  30 a8         bmi $81d0
$07:8228  fc 3f e2      jsr ($e23f,x)
$07:822b  d0 21         bne $824e
$07:822d  20 02 f0      jsr $f002
$07:8230  98            tya
$07:8231  ce 0e de      dec $de0e
$07:8234  12 3e         ora ($3e)
$07:8236  32 14         and ($14)
$07:8238  d3 98         cmp ($98,s),y
$07:823a  fb            xce
$07:823b  5c b5 b1 1c   jml $1cb1b5
$07:823f  20 1f 22      jsr $221f
$07:8242  98            tya
$07:8243  c0 1f 32      cpy #$321f
$07:8246  d3 2e         cmp ($2e,s),y
$07:8248  30 b0         bmi $81fa
$07:824a  fe 98 ef      inc $ef98,x
$07:824d  1e 32 f5      asl $f532,x
$07:8250  13 fe         ora ($fe,s),y
$07:8252  2f ef 98 f2   and $f298ef
$07:8256  ed 33 c1      sbc $c133
$07:8259  10 ef         bpl $824a
$07:825b  2d 33 a8      and $a833
$07:825e  f0 f0         beq $8250
$07:8260  4e f1 d0      lsr $d0f1
$07:8263  01 10         ora ($10,x)
$07:8265  e0 a4 12      cpx #$12a4
$07:8268  23 0f         and $0f,s
$07:826a  1f 10 d1 ec   ora $ecd110,x
$07:826e  2f a4 d0 be   and $bed0a4
$07:8272  2e f2 02      rol $02f2
$07:8275  44 44 22      mvp $22,$44
$07:8278  98            tya
$07:8279  0e ee ee      asl $eeee
$07:827c  10 05         bpl $8283
$07:827e  23 11         and $11,s
$07:8280  30 98         bmi $821a
$07:8282  fc ef c0      jsr ($c0ef,x)
$07:8285  1c 6e 06      trb $066e
$07:8288  3f 2c a8 f1   and $f1a82c,x
$07:828c  f0 0f         beq $829d
$07:828e  0c f3 03      tsb $03f3
$07:8291  1e f0 b8      asl $b8f0,x
$07:8294  11 1f         ora ($1f),y
$07:8296  ee 04 2d      inc $2d04
$07:8299  ef 03 10 a8   sbc $a81003
$07:829d  cd f6 5f      cmp $5ff6
$07:82a0  ec f0 42      cpx $42f0
$07:82a3  df ff 98 60   cmp $6098ff,x
$07:82a7  44 eb 03      mvp $03,$eb
$07:82aa  d1 1c         cmp ($1c),y
$07:82ac  0c e0 a8      tsb $a8e0
$07:82af  01 22         ora ($22,x)
$07:82b1  f0 f0         beq $82a3
$07:82b3  14 0f         trb $0f
$07:82b5  dd 10 98      cmp $9810,x
$07:82b8  ff de 24 40   sbc $4024de,x
$07:82bc  e1 f3         sbc ($f3,x)
$07:82be  30 dd         bmi $829d
$07:82c0  94 02         sty $02,x
$07:82c2  14 fb         trb $fb
$07:82c4  1c e3 d0      trb $d0e3
$07:82c7  fb            xce
$07:82c8  fd 98 ff      sbc $ff98,x
$07:82cb  6d f4 b3      adc $b3f4
$07:82ce  3e 5a c2      rol $c25a,x
$07:82d1  21 a8         and ($a8,x)
$07:82d3  01 d0         ora ($d0,x)
$07:82d5  5e ef ee      lsr $eeef,x
$07:82d8  41 10         eor ($10,x)
$07:82da  b1 a8         lda ($a8),y
$07:82dc  41 30         eor ($30,x)
$07:82de  db            stp
$07:82df  04 0e         tsb $0e
$07:82e1  ee 03 30      inc $3003
$07:82e4  98            tya
$07:82e5  0f e5 0e ed   ora $ed0ee5
$07:82e9  e0 10 24      cpx #$2410
$07:82ec  22 a8 0e 01   jsl $010ea8
$07:82f0  ff 1d f0 14   sbc $14f01d,x
$07:82f4  2f 10 a8 ed   and $eda810
$07:82f8  ef 04 1c 13   sbc $131c04
$07:82fc  10 32         bpl $8330
$07:82fe  cd a8 01      cmp $01a8
$07:8301  ef fe e4 31   sbc $31e4fe
$07:8305  00 11         brk #$11
$07:8307  30 98         bmi $82a1
$07:8309  aa            tax
$07:830a  ff fd 0e 23   sbc $230efd,x
$07:830e  36 31         rol $31,x
$07:8310  eb            xba
$07:8311  a8            tay
$07:8312  f0 10         beq $8324
$07:8314  df f3 23 0f   cmp $0f23f3,x
$07:8318  db            stp
$07:8319  e7 a4         sbc [$a4]
$07:831b  f0 1a         beq $8337
$07:831d  03 23         ora $23,s
$07:831f  66 52         ror $52
$07:8321  10 ee         bpl $8311
$07:8323  98            tya
$07:8324  ff bd 55 13   sbc $1355bd,x
$07:8328  00 16         brk #$16
$07:832a  3c ae a8      bit $a8ae,x
$07:832d  f0 0e         beq $833d
$07:832f  00 12         brk #$12
$07:8331  33 ce         and ($ce,s),y
$07:8333  1f 00 98 af   ora $af9800,x
$07:8337  12 32         ora ($32)
$07:8339  f5 30         sbc $30,x
$07:833b  df ef fd 98   cmp $98fdef,x
$07:833f  dd f7 2e      cmp $2ef7,x
$07:8342  2f 34 23 da   and $da2334
$07:8346  f0 88         beq $82d0
$07:8348  1b            tcs
$07:8349  cd d5 11      cmp $11d5
$07:834c  70 34         bvs $8382
$07:834e  f3 1a         sbc ($1a,s),y
$07:8350  98            tya
$07:8351  2d c2 03      and $03c2
$07:8354  0e 2f d0      asl $d02f
$07:8357  12 2e         ora ($2e)
$07:8359  a8            tay
$07:835a  c0 22 40      cpy #$4022
$07:835d  c0 03 2d      cpy #$2d03
$07:8360  ef 00 a8 fe   sbc $fea800
$07:8364  f0 22         beq $8388
$07:8366  11 f0         ora ($f0),y
$07:8368  12 3f         ora ($3f)
$07:836a  ce 98 f1      dec $f198
$07:836d  0d ec e5      ora $e5ec
$07:8370  51 3f         eor ($3f),y
$07:8372  01 35         ora ($35,x)
$07:8374  a8            tay
$07:8375  ff ee ff 12   sbc $12ffee,x
$07:8379  e0 02 41      cpx #$4102
$07:837c  fd a8 e0      sbc $e0a8,x
$07:837f  23 cf         and $cf,s
$07:8381  fd 63 01      sbc $0163,x
$07:8384  ba            tsx
$07:8385  35 b4         and $b4,x
$07:8387  02 0c         cop #$0c
$07:8389  e0 13 31      cpx #$3113
$07:838c  00 01         brk #$01
$07:838e  30 98         bmi $8328
$07:8390  ad 13 4f      lda $4f13
$07:8393  df 24 40 0d   cmp $0d4024,x
$07:8397  d0 a4         bne $833d
$07:8399  12 10         ora ($10)
$07:839b  0e 21 f0      asl $f021
$07:839e  ce fd fe      dec $fefd
$07:83a1  98            tya
$07:83a2  b5 31         lda $31,x
$07:83a4  1e 04 22      asl $2204,x
$07:83a7  db            stp
$07:83a8  01 fe         ora ($fe,x)
$07:83aa  98            tya
$07:83ab  0f bf 32 40   ora $4032bf
$07:83af  12 03         ora ($03)
$07:83b1  5e db 98      lsr $98db,x
$07:83b4  d0 10         bne $83c6
$07:83b6  ec d3 42      cpx $42d3
$07:83b9  01 11         ora ($11,x)
$07:83bb  13 98         ora ($98,s),y
$07:83bd  1f bf 1f 1e   ora $1e1fbf,x
$07:83c1  e0 15 fc      cpx #$fc15
$07:83c4  0f 88 00 35   ora $350088
$07:83c8  bf 26 6f 22   lda $226f26,x
$07:83cc  ee cc 98      inc $98cc
$07:83cf  f1 00         sbc ($00),y
$07:83d1  ed ef 24      sbc $24ef
$07:83d4  22 0f 12 98   jsl $98120f
$07:83d8  52 cb         eor ($cb)
$07:83da  e0 00 e0      cpx #$e000
$07:83dd  de 51 d0      dec $d051,x
$07:83e0  98            tya
$07:83e1  01 4f         ora ($4f,x)
$07:83e3  10 11         bpl $83f6
$07:83e5  4f 0d df ff   eor $ffdf0d
$07:83e9  98            tya
$07:83ea  de 00 31      dec $3100,x
$07:83ed  34 12         bit $12,x
$07:83ef  3f 0d c0 98   and $98c00d,x
$07:83f3  f0 01         beq $83f6
$07:83f5  fd c0 30      sbc $30c0,x
$07:83f8  43 0c         eor $0c,s
$07:83fa  2f 98 46 bd   and $bd4698
$07:83fe  0b            phd
$07:83ff  24 b0         bit $b0
$07:8401  0d 3b f4      ora $f43b
$07:8404  98            tya
$07:8405  03 2e         ora $2e,s
$07:8407  20 43 0b      jsr $0b43
$07:840a  ef e0 ef 98   sbc $98efe0
$07:840e  ef 12 54 11   sbc $115412
$07:8412  c2 6b         rep #$6b
$07:8414  ee af a8      inc $a8af
$07:8417  10 f2         bpl $840b
$07:8419  1f 32 00 de   ora $de0032,x
$07:841d  1f f1 98 c0   ora $c098f1,x
$07:8421  4f 64 0e de   eor $de0e64
$07:8425  22 dd dd 98   jsl $98dddd
$07:8429  24 0f         bit $0f
$07:842b  20 01 12      jsr $1201
$07:842e  1d 3d c2      ora $c23d,x
$07:8431  98            tya
$07:8432  f2 0c         sbc ($0c)
$07:8434  12 ff         ora ($ff)
$07:8436  2e 00 33      rol $3300
$07:8439  ef 98 31 2d   sbc $2d3198
$07:843d  e1 ef         sbc ($ef,x)
$07:843f  0e 1e 24      asl $241e
$07:8442  11 b4         ora ($b4),y
$07:8444  11 fe         ora ($fe),y
$07:8446  ff 22 ed e1   sbc $e1ed22,x
$07:844a  34 1f         bit $1f,x
$07:844c  a4 d5         ldy $d5
$07:844e  61 db         adc ($db,x)
$07:8450  ae 30 ca      ldx $ca30
$07:8453  d2 54         cmp ($54)
$07:8455  a4 fb         ldy $fb
$07:8457  c3 43         cmp $43,s
$07:8459  2f 25 53 1f   and $1f5325
$07:845d  ee a8 1f      inc $1fa8
$07:8460  e0 02 30      cpx #$3002
$07:8463  f2 d1         sbc ($d1)
$07:8465  21 fe         and ($fe,x)
$07:8467  a8            tay
$07:8468  e1 fe         sbc ($fe,x)
$07:846a  f3 11         sbc ($11,s),y
$07:846c  ec 44 03      cpx $0344
$07:846f  ca            dex
$07:8470  a8            tay
$07:8471  34 0e         bit $0e,x
$07:8473  dd 06 1e      cmp $1e06,x
$07:8476  cf 32 21 a4   cmp $a42132
$07:847a  1e 13 64      asl $6413,x
$07:847d  1f ef 10 eb   ora $eb10ef,x
$07:8481  cf 98 21 de   cmp $de2198
$07:8485  12 30         ora ($30)
$07:8487  ef de 34 fe   sbc $fe34de
$07:848b  98            tya
$07:848c  1f 35 fb ff   ora $fffb35,x
$07:8490  e1 de         sbc ($de,x)
$07:8492  01 33         ora ($33,x)
$07:8494  98            tya
$07:8495  20 13 20      jsr $2013
$07:8498  ec df 1f      cpx $1fdf
$07:849b  fd ff 88      sbc $88ff,x
$07:849e  57 23         eor [$23],y
$07:84a0  01 33         ora ($33,x)
$07:84a2  1d db 0f      ora $0fdb,x
$07:84a5  c1 88         cmp ($88,x)
$07:84a7  3d 11 35      and $3511,x
$07:84aa  2b            pld
$07:84ab  e4 0f         cpx $0f
$07:84ad  1d d0 94      ora $94d0,x
$07:84b0  ff ff f0 22   sbc $22f0ff,x
$07:84b4  42 de         wdm #$de
$07:84b6  d0 30         bne $84e8
$07:84b8  a8            tay
$07:84b9  f1 03         sbc ($03),y
$07:84bb  0f fe ef 33   ora $33effe
$07:84bf  ec d5 a8      cpx $a8d5
$07:84c2  4f 1f c4 40   eor $40c41f
$07:84c6  ce 0f 02      dec $020f
$07:84c9  ec 98 13      cpx $1398
$07:84cc  61 1f         adc ($1f,x)
$07:84ce  11 0f         ora ($0f),y
$07:84d0  22 2b ce a8   jsl $a8ce2b
$07:84d4  14 fd         trb $fd
$07:84d6  ff 03 1e 02   sbc $021e03,x
$07:84da  00 00         brk #$00
$07:84dc  98            tya
$07:84dd  33 be         and ($be,s),y
$07:84df  f1 50         sbc ($50),y
$07:84e1  bc c0 56      ldy $56c0,x
$07:84e4  19 a8 d2      ora $d2a8,y
$07:84e7  33 10         and ($10,s),y
$07:84e9  bc 34 1e      ldy $1e34,x
$07:84ec  de 11 98      dec $9811,x
$07:84ef  4f d2 0f ef   eor $ef0fd2
$07:84f3  42 0e         wdm #$0e
$07:84f5  d1 55         cmp ($55),y
$07:84f7  98            tya
$07:84f8  1c df 1f      trb $1fdf
$07:84fb  ff 0c f0 21   sbc $21f00c,x
$07:84ff  32 98         and ($98)
$07:8501  00 02         brk #$02
$07:8503  41 dd         eor ($dd,x)
$07:8505  ff f0 ef f3   sbc $f3eff0,x
$07:8509  98            tya
$07:850a  21 df         and ($df,x)
$07:850c  01 02         ora ($02,x)
$07:850e  20 ed 13      jsr $13ed
$07:8511  51 88         eor ($88),y
$07:8513  d9 de 0f      cmp $0fde,y
$07:8516  0b            phd
$07:8517  af 25 51 43   lda $435125
$07:851b  88            dey
$07:851c  03 f2         ora $f2,s
$07:851e  ec ec ec      cpx $ecec
$07:8521  1f 23 21 88   ora $882123,x
$07:8525  03 2f         ora $2f,s
$07:8527  2d e0 b3      and $b3e0
$07:852a  0d 01 13      ora $1301
$07:852d  88            dey
$07:852e  10 10         bpl $8540
$07:8530  d2 2c         cmp ($2c)
$07:8532  01 12         ora ($12,x)
$07:8534  1f d9 a8 f0   ora $f0a8d9,x
$07:8538  23 0d         and $0d,s
$07:853a  d0 44         bne $8580
$07:853c  1d cf 24      ora $24cf,x
$07:853f  98            tya
$07:8540  eb            xba
$07:8541  bf 62 dd 05   lda $05dd62,x
$07:8545  5c ae 46 a8   jml $a846ae
$07:8549  fd e2 42      sbc $42e2,x
$07:854c  0d f1 1f      ora $1ff1
$07:854f  ff e0 98 20   sbc $2098e0,x
$07:8553  e1 53         sbc ($53,x)
$07:8555  11 01         ora ($01),y
$07:8557  2e de f0      rol $f0de
$07:855a  98            tya
$07:855b  0f db 23 52   ora $5223db
$07:855f  f0 00         beq $8561
$07:8561  53 eb         eor ($eb,s),y
$07:8563  98            tya
$07:8564  be 03 2f      ldx $2f03,y
$07:8567  e0 11 20      cpx #$2011
$07:856a  10 de         bpl $854a
$07:856c  98            tya
$07:856d  00 31         brk #$31
$07:856f  ef e2 52 ee   sbc $ee52e2
$07:8573  f2 1d         sbc ($1d)
$07:8575  88            dey
$07:8576  ce 21 da      dec $da21
$07:8579  f6 45         inc $45,x
$07:857b  4b            phk
$07:857c  42 41         wdm #$41
$07:857e  88            dey
$07:857f  ae ef dd      ldx $ddef
$07:8582  dd 23 13      cmp $1323,x
$07:8585  25 1e         and $1e
$07:8587  98            tya
$07:8588  f2 3f         sbc ($3f)
$07:858a  cb            wai
$07:858b  e2 52         sep #$52
$07:858d  ed d2 42      sbc $42d2
$07:8590  88            dey
$07:8591  1c be d4      trb $d4be
$07:8594  53 fa         eor ($fa,s),y
$07:8596  d1 25         cmp ($25),y
$07:8598  1b            tcs
$07:8599  88            dey
$07:859a  bc 26 3f      ldy $3f26,x
$07:859d  fb            xce
$07:859e  04 34         tsb $34
$07:85a0  1e cf 88      asl $88cf,x
$07:85a3  f0 3e         beq $85e3
$07:85a5  fd d1 22      sbc $22d1,x
$07:85a8  2f e2 55 98   and $9855e2
$07:85ac  0f 0f 1f fe   ora $fe1f0f
$07:85b0  fd c2 62      sbc $62c2,x
$07:85b3  ed a8 03      sbc $03a8
$07:85b6  01 3e         ora ($3e,x)
$07:85b8  c0 21         cpy #$21
$07:85ba  ee e0 21      inc $21e0
$07:85bd  a8            tay
$07:85be  f1 12         sbc ($12),y
$07:85c0  0e e1 31      asl $31e1
$07:85c3  db            stp
$07:85c4  f4 41 98      pea $9841
$07:85c7  bb            tyx
$07:85c8  35 2d         and $2d,x
$07:85ca  de 01 ed      dec $ed01,x
$07:85cd  02 31         cop #$31
$07:85cf  98            tya
$07:85d0  ff 34 20 cd   sbc $cd2034,x
$07:85d4  11 0f         ora ($0f),y
$07:85d6  ef 0e 98 e0   sbc $e0980e
$07:85da  33 2f         and ($2f,s),y
$07:85dc  d1 44         cmp ($44),y
$07:85de  2c af 31      bit $31af
$07:85e1  98            tya
$07:85e2  ec e2 2f      cpx $2fe2
$07:85e5  f0 34         beq $861b
$07:85e7  2f bf 42 98   and $9842bf
$07:85eb  ea            nop
$07:85ec  d2 33         cmp ($33)
$07:85ee  0e 22 2f      asl $2f22
$07:85f1  de 00 98      dec $9800,x
$07:85f4  1e df 14      asl $14df,x
$07:85f7  30 e0         bmi $85d9
$07:85f9  32 1e         and ($1e)
$07:85fb  df a4 0f fd   cmp $fd0fa4,x
$07:85ff  e0 11         cpx #$11
$07:8601  fd d0 23      sbc $23d0,x
$07:8604  2f 98 c2 46   and $46c298
$07:8608  0b            phd
$07:8609  be 34 3f      ldx $3f34,y
$07:860c  dd 11 88      cmp $8811,x
$07:860f  32 0f         and ($0f)
$07:8611  1a            inc a
$07:8612  d0 26         bne $863a
$07:8614  1c bd 34      trb $34bd
$07:8617  88            dey
$07:8618  41 03         eor ($03,x)
$07:861a  de 0f 31      dec $310f,x
$07:861d  bc d2 50      ldy $50d2,x
$07:8620  78            sei
$07:8621  10 d0         bpl $85f3
$07:8623  25 3f         and $3f
$07:8625  10 f0         bpl $8617
$07:8627  d3 30         cmp ($30,s),y
$07:8629  98            tya
$07:862a  00 fd         brk #$fd
$07:862c  c0 33         cpy #$33
$07:862e  3c c0 54      bit $54c0,x
$07:8631  32 98         and ($98)
$07:8633  aa            tax
$07:8634  15 2c         ora $2c,x
$07:8636  cd 03 1e      cmp $1e03
$07:8639  03 40         ora $40,s
$07:863b  98            tya
$07:863c  dd 34 2e      cmp $2e34,x
$07:863f  bd 13 1e      lda $1e13,x
$07:8642  e1 21         sbc ($21,x)
$07:8644  88            dey
$07:8645  cf 36 2b 9e   cmp $9e2b36
$07:8649  24 1f         bit $1f
$07:864b  ef 33 98 00   sbc $009833
$07:864f  01 0f         ora ($0f,x)
$07:8651  ff 11 0e ce   sbc $ce0e11,x
$07:8655  23 98         and $98,s
$07:8657  32 db         and ($db)
$07:8659  15 42         ora $42,x
$07:865b  db            stp
$07:865c  e1 20         sbc ($20,x)
$07:865e  ef 94 ee dc   sbc $dcee94
$07:8662  cf 44 1e e1   cmp $e11e44
$07:8666  33 1f         and ($1f,s),y
$07:8668  88            dey
$07:8669  11 10         ora ($10),y
$07:866b  f3 30         sbc ($30,s),y
$07:866d  fc e2 1e      jsr ($1ee2,x)
$07:8670  df 88 03 2f   cmp $2f0388,x
$07:8674  11 42         ora ($42),y
$07:8676  0e e1 1f      asl $1fe1
$07:8679  dd 98 f1      cmp $f198,x
$07:867c  12 1f         ora ($1f)
$07:867e  df f2 43 ea   cmp $ea43f2,x
$07:8682  b2 98         lda ($98)
$07:8684  64 0c         stz $0c
$07:8686  c2 32         rep #$32
$07:8688  0d f1 0e      ora $0ef1
$07:868b  d0 98         bne $8625
$07:868d  23 0c         and $0c,s
$07:868f  e2 33         sep #$33
$07:8691  0e 02 2e      asl $2e02
$07:8694  de 88 13      dec $1388,x
$07:8697  3b            tsc
$07:8698  af 55 2c 02   lda $022c55
$07:869c  22 ee 84 24   jsl $2484ee
$07:86a0  30 dd         bmi $867f
$07:86a2  03 2e         ora $2e,s
$07:86a4  de 34 21      dec $2134,x
$07:86a7  88            dey
$07:86a8  01 0c         ora ($0c,x)
$07:86aa  be 06 4f      ldx $4f06,y
$07:86ad  dd 17 51      cmp $5117,x
$07:86b0  88            dey
$07:86b1  ea            nop
$07:86b2  e0 11         cpx #$11
$07:86b4  cd 1f f1      cmp $f11f
$07:86b7  04 50         tsb $50
$07:86b9  88            dey
$07:86ba  fc e5 42      jsr ($42e5,x)
$07:86bd  ba            tsx
$07:86be  e1 30         sbc ($30,x)
$07:86c0  ff 32 88 1e   sbc $1e8832,x
$07:86c4  00 12         brk #$12
$07:86c6  ec f2 11      cpx $11f2
$07:86c9  e0 30         cpx #$30
$07:86cb  88            dey
$07:86cc  1f f3 11 dc   ora $dc11f3,x
$07:86d0  01 30         ora ($30,x)
$07:86d2  de 14 88      dec $8814,x
$07:86d5  2f cc 13 30   and $3013cc
$07:86d9  ce 32 31      dec $3132
$07:86dc  ee 78 f2      inc $f278
$07:86df  ef de 2d d1   sbc $d12dde
$07:86e3  15 3d         ora $3d,x
$07:86e5  e0 78         cpx #$78
$07:86e7  46 3e         lsr $3e
$07:86e9  cd e1 1d      cmp $1de1
$07:86ec  ef 01 f2 88   sbc $88f201
$07:86f0  31 0e         and ($0e),y
$07:86f2  ef 32 fe d0   sbc $d0fe32
$07:86f6  32 2f         and ($2f)
$07:86f8  78            sei
$07:86f9  af 54 0d 9c   lda $9c0d54
$07:86fd  31 2f         and ($2f),y
$07:86ff  e4 22         cpx $22
$07:8701  88            dey
$07:8702  0f ef 23 2d   ora $2d23ef
$07:8706  bf 13 30 ee   lda $ee3013,x
$07:870a  88            dey
$07:870b  f1 00         sbc ($00),y
$07:870d  f1 1e         sbc ($1e),y
$07:870f  00 14         brk #$14
$07:8711  0f ee 78 32   ora $3278ee
$07:8715  ef c0 21 30   sbc $3021c0
$07:8719  22 fe e2 78   jsl $78e2fe
$07:871d  2e cc f3      rol $f3cc
$07:8720  30 1f         bmi $8741
$07:8722  25 1f         and $1f
$07:8724  1e 88 f0      asl $f088,x
$07:8727  df 00 10 01   cmp $011000,x
$07:872b  43 1f         eor $1f,s
$07:872d  d1 88         cmp ($88),y
$07:872f  1e dc c1      asl $c1dc,x
$07:8732  42 ee         wdm #$ee
$07:8734  25 31         and $31
$07:8736  ff 88 11 fc   sbc $fc1188,x
$07:873a  de f2 f0      dec $f0f2,x
$07:873d  01 23         ora ($23,x)
$07:873f  e1 88         sbc ($88,x)
$07:8741  11 1d         ora ($1d),y
$07:8743  d0 04         bne $8749
$07:8745  0e ff 33      asl $33ff
$07:8748  ff 78 dd f0   sbc $f0dd78,x
$07:874c  00 0e         brk #$0e
$07:874e  e2 26         sep #$26
$07:8750  3f 1f 78 e3   and $e3781f,x
$07:8754  1d fe a0      ora $a0fe,x
$07:8757  30 33         bmi $878c
$07:8759  b0 41         bcs $879c
$07:875b  88            dey
$07:875c  31 df         and ($df),y
$07:875e  0d 0e d2      ora $d20e
$07:8761  22 1d 24 88   jsl $88241d
$07:8765  41 dd         eor ($dd,x)
$07:8767  e0 0e         cpx #$0e
$07:8769  ee e3 20      inc $20e3
$07:876c  11 78         ora ($78),y
$07:876e  44 ff 0f      mvp $0f,$ff
$07:8771  1d dd c2      ora $c2dd,x
$07:8774  21 31         and ($31,x)
$07:8776  78            sei
$07:8777  24 10         bit $10
$07:8779  bd 0d cf      lda $cf0d,x
$07:877c  e0 31         cpx #$31
$07:877e  36 78         rol $78,x
$07:8780  24 2d         bit $2d
$07:8782  2d cf ea      and $eacf
$07:8785  e0 f0         cpx #$f0
$07:8787  52 78         eor ($78)
$07:8789  23 f2         and $f2,s
$07:878b  41 00         eor ($00,x)
$07:878d  ac e0 1d      ldy $1de0
$07:8790  c2 78         rep #$78
$07:8792  04 2d         tsb $2d
$07:8794  24 24         bit $24
$07:8796  ee 00 0d      inc $0d00
$07:8799  fe 78 c2      inc $c278,x
$07:879c  0d 21 e3      ora $e321
$07:879f  f1 40         sbc ($40),y
$07:87a1  4f c0 78 23   eor $2378c0
$07:87a5  2b            pld
$07:87a6  ef 01 f0 c0   sbc $c0f001
$07:87aa  2e 14 78      rol $7814
$07:87ad  e1 0f         sbc ($0f,x)
$07:87af  12 02         ora ($02)
$07:87b1  de 31 03      dec $0331,x
$07:87b4  df 78 ff 00   cmp $00ff78,x
$07:87b8  f1 ed         sbc ($ed),y
$07:87ba  14 32         trb $32
$07:87bc  ee 23 78      inc $7823
$07:87bf  12 eb         ora ($eb)
$07:87c1  e2 fe         sep #$fe
$07:87c3  db            stp
$07:87c4  11 34         ora ($34),y
$07:87c6  12 68         ora ($68)
$07:87c8  5e 62 c1      lsr $c162,x
$07:87cb  b9 bb de      lda $debb,y
$07:87ce  24 02         bit $02
$07:87d0  68            pla
$07:87d1  2f 45 12 3c   and $3c1245
$07:87d5  ad 62 40      lda $4062
$07:87d8  b0 68         bcs $8842
$07:87da  1e fd df      asl $dffd,x
$07:87dd  be ff 64      ldx $64ff,y
$07:87e0  54 4c 68      mvn $68,$4c
$07:87e3  46 0c         lsr $0c
$07:87e5  ba            tsx
$07:87e6  df da d1 76   cmp $76d1da,x
$07:87ea  03 68         ora $68,s
$07:87ec  20 65 09      jsr $0965
$07:87ef  ec b2 ee      cpx $eeb2
$07:87f2  7d d4 78      adc $78d4,x
$07:87f5  11 32         ora ($32),y
$07:87f7  cf 0e 0d f1   cmp $f10d0e
$07:87fb  10 f1         bpl $87ee
$07:87fd  78            sei
$07:87fe  42 31         wdm #$31
$07:8800  ef 0e ec c1   sbc $c1ec0e
$07:8804  22 ff 78 f3   jsl $f378ff
$07:8808  44 10 df      mvp $df,$10
$07:880b  0e 0f de      asl $de0f
$07:880e  f2 68         sbc ($68)
$07:8810  55 7f         eor $7f,x
$07:8812  d2 e0         cmp ($e0)
$07:8814  de ba 10      dec $10ba,x
$07:8817  f4 78 22      pea $2278
$07:881a  40            rti
$07:881b  20 0f ec      jsr $ec0f
$07:881e  e0 e0         cpx #$e0
$07:8820  f1 78         sbc ($78),y
$07:8822  13 41         ora ($41,s),y
$07:8824  01 10         ora ($10,x)
$07:8826  fd ee f0      sbc $f0ee,x
$07:8829  00 78         brk #$78
$07:882b  31 13         and ($13),y
$07:882d  f0 2f         beq $885e
$07:882f  ff dc f0 00   sbc $00f0dc,x
$07:8833  78            sei
$07:8834  11 11         ora ($11),y
$07:8836  13 30         ora ($30,s),y
$07:8838  0f e0 ff cd   ora $cdffe0
$07:883c  78            sei
$07:883d  02 0f         cop #$0f
$07:883f  00 42         brk #$42
$07:8841  21 1f         and ($1f,x)
$07:8843  0e ef 68      asl $68ef
$07:8846  e2 f0         sep #$f0
$07:8848  21 13         and ($13,x)
$07:884a  4e ce ef      lsr $efce
$07:884d  0c 68 20      tsb $2068
$07:8850  33 f2         and ($f2,s),y
$07:8852  44 3e eb      mvp $eb,$3e
$07:8855  f1 db         sbc ($db),y
$07:8857  68            pla
$07:8858  f1 ef         sbc ($ef),y
$07:885a  00 25         brk #$25
$07:885c  43 1f         eor $1f,s
$07:885e  14 dc         trb $dc
$07:8860  68            pla
$07:8861  cb            wai
$07:8862  f4 ff 0d      pea $0dff
$07:8865  25 f1         and $f1
$07:8867  2f 24 68 ce   and $ce6824
$07:886b  20 3e bc      jsr $bc3e
$07:886e  23 1d         and $1d,s
$07:8870  b0 72         bcs $88e4
$07:8872  68            pla
$07:8873  fe f3 42      inc $42f3,x
$07:8876  ec f4 0f      cpx $0ff4
$07:8879  ec 10 68      cpx $6810
$07:887c  01 e0         ora ($e0,x)
$07:887e  00 ff         brk #$ff
$07:8880  34 01         bit $01,x
$07:8882  ff 32 68 1f   sbc $1f6832,x
$07:8886  ff fb f0 de   sbc $def0fb,x
$07:888a  12 02         ora ($02)
$07:888c  22 68 10 33   jsl $331068
$07:8890  ee 0c 10      inc $100c
$07:8893  ec e1 12      cpx $12e1
$07:8896  58            cli
$07:8897  f1 d6         sbc ($d6),y
$07:8899  74 1b         stz $1b,x
$07:889b  bc 23 fd      ldy $fd23,x
$07:889e  ce 68 12      dec $1268
$07:88a1  53 ef         eor ($ef,s),y
$07:88a3  ed 03 cd      sbc $cd03
$07:88a6  1f 16 68 f0   ora $f06816,x
$07:88aa  6f e3 e0 2e   adc $2ee0e3
$07:88ae  be e1 fe      ldx $fee1,y
$07:88b1  68            pla
$07:88b2  d2 52         cmp ($52)
$07:88b4  02 14         cop #$14
$07:88b6  2e 0d d0      rol $d00d
$07:88b9  dd 68 10      cmp $1068,x
$07:88bc  00 f0         brk #$f0
$07:88be  32 40         and ($40)
$07:88c0  ec 32 01      cpx $0132
$07:88c3  68            pla
$07:88c4  cd 11 31      cmp $3111
$07:88c7  e1 0e         sbc ($0e,x)
$07:88c9  01 00         ora ($00,x)
$07:88cb  ef 68 ef 31   sbc $31ef68
$07:88cf  f1 22         sbc ($22),y
$07:88d1  22 0e 0f be   jsl $be0f0e
$07:88d5  68            pla
$07:88d6  01 e0         ora ($e0,x)
$07:88d8  f0 23         beq $88fd
$07:88da  42 e0         wdm #$e0
$07:88dc  01 0d         ora ($0d,x)
$07:88de  68            pla
$07:88df  dd 10 e0      cmp $e010,x
$07:88e2  12 43         ora ($43)
$07:88e4  01 0e         ora ($0e,x)
$07:88e6  1d 68 df      ora $df68,x
$07:88e9  0d 01 03      ora $0301
$07:88ec  5e 12 02      lsr $0212,x
$07:88ef  0b            phd
$07:88f0  68            pla
$07:88f1  e1 0f         sbc ($0f,x)
$07:88f3  1e f4 e2      asl $e2f4,x
$07:88f6  0d 12 1f      ora $1f12
$07:88f9  68            pla
$07:88fa  fd 04 0f      sbc $0f04,x
$07:88fd  3f 01 e0 20   and $20e001,x
$07:8901  dd 58 a2      cmp $a258,x
$07:8904  33 2d         and ($2d,s),y
$07:8906  f2 66         sbc ($66)
$07:8908  fe 2d 02      inc $022d,x
$07:890b  58            cli
$07:890c  cd f1 eb      cmp $ebf1
$07:890f  33 e1         and ($e1,s),y
$07:8911  ce 64 31      dec $3164
$07:8914  58            cli
$07:8915  d0 01         bne $8918
$07:8917  41 bb         eor ($bb,x)
$07:8919  d1 22         cmp ($22),y
$07:891b  fc f3 58      jsr ($58f3,x)
$07:891e  40            rti
$07:891f  00 3f         brk #$3f
$07:8921  ff d0 52 ce   sbc $ce52d0,x
$07:8925  e4 58         cpx $58
$07:8927  31 fd         and ($fd),y
$07:8929  fe 14 fc      inc $fc14,x
$07:892c  ed f6 50      sbc $50f6
$07:892f  58            cli
$07:8930  0e 04 1f      asl $1f04
$07:8933  fd d1 fe      sbc $fed1,x
$07:8936  1f f5 58 f0   ora $f058f5,x
$07:893a  3f 22 e2 1e   and $1ee222,x
$07:893e  fe ff de      inc $deff,x
$07:8941  68            pla
$07:8942  0f 4f 01 02   ora $02014f
$07:8946  3f ef f2 ff   and $fff2ef,x
$07:894a  58            cli
$07:894b  ee d2 20      inc $20d2
$07:894e  31 0e         and ($0e),y
$07:8950  f0 24         beq $8976
$07:8952  f0 48         beq $899c
$07:8954  0c 27 ec      tsb $ec27
$07:8957  bc 1e 00      ldy $001e,x
$07:895a  03 0f         ora $0f,s
$07:895c  48            pha
$07:895d  00 43         brk #$43
$07:895f  51 e1         eor ($e1),y
$07:8961  20 ca 0d      jsr $0dca
$07:8964  d0 58         bne $89be
$07:8966  0d 03 22      ora $2203
$07:8969  01 02         ora ($02,x)
$07:896b  10 ef         bpl $895c
$07:896d  0c 58 e1      tsb $e158
$07:8970  21 0f         and ($0f,x)
$07:8972  ff 44 ff df   sbc $dfff44,x
$07:8976  1f 48 4c f3   ora $f34c48,x
$07:897a  e2 3e         sep #$3e
$07:897c  40            rti
$07:897d  d0 1d         bne $899c
$07:897f  10 48         bpl $89c9
$07:8981  a4 ff         ldy $ff
$07:8983  4f 14 ed 23   eor $23ed14
$07:8987  f3 ec         sbc ($ec,s),y
$07:8989  48            pha
$07:898a  3e 03 e0      rol $e003,x
$07:898d  0b            phd
$07:898e  e3 11         sbc $11,s
$07:8990  ed 57 48      sbc $4857
$07:8993  f0 de         beq $8973
$07:8995  22 f1 be 4a   jsl $4abef1
$07:8999  05 e1         ora $e1
$07:899b  48            pha
$07:899c  fc 33 31      jsr ($3133,x)
$07:899f  b0 00         bcs $89a1
$07:89a1  4e ef 0f      lsr $0fef
$07:89a4  48            pha
$07:89a5  3f 04 00 0e   and $0e0004,x
$07:89a9  ee e0 f0      inc $f0e0
$07:89ac  12 48         ora ($48)
$07:89ae  01 42         ora ($42,x)
$07:89b0  14 cd         trb $cd
$07:89b2  ef 1e de f1   sbc $f1de1e
$07:89b6  48            pha
$07:89b7  23 f4         and $f4,s
$07:89b9  0e 42 fe      asl $fe42
$07:89bc  d0 00         bne $89be
$07:89be  0d 44 cc      ora $cc44
$07:89c1  cf f0 e0 13   cmp $13e0f0
$07:89c5  40            rti
$07:89c6  dd df 48      cmp $48df,x
$07:89c9  10 20         bpl $89eb
$07:89cb  12 0e         ora ($0e)
$07:89cd  00 0f         brk #$0f
$07:89cf  ce 10 48      dec $4810
$07:89d2  f2 01         sbc ($01)
$07:89d4  33 00         and ($00,s),y
$07:89d6  0d 10 0e      ora $0e10
$07:89d9  fc 48 f1      jsr ($f148,x)
$07:89dc  03 4f         ora $4f,s
$07:89de  11 f3         ora ($f3),y
$07:89e0  ef ed 00 38   sbc $3800ed
$07:89e4  30 e0         bmi $89c6
$07:89e6  07 5e         ora [$5e]
$07:89e8  f1 2e         sbc ($2e),y
$07:89ea  cc e4 38      cpy $38e4
$07:89ed  fd e1 43      sbc $43e1,x
$07:89f0  21 2e         and ($2e,x)
$07:89f2  0f ee c1 38   ora $38c1ee
$07:89f6  1e 01 05      asl $0501,x
$07:89f9  e0 20         cpx #$20
$07:89fb  2f dd 22 38   and $3822dd
$07:89ff  0f 01 00 0f   ora $0f0001
$07:8a03  00 f0         brk #$f0
$07:8a05  de 32 38      dec $3832,x
$07:8a08  10 11         bpl $8a1b
$07:8a0a  04 10         tsb $10
$07:8a0c  cd 1c 10      cmp $101c
$07:8a0f  00 38         brk #$38
$07:8a11  d1 11         cmp ($11),y
$07:8a13  33 0c         and ($0c,s),y
$07:8a15  02 11         cop #$11
$07:8a17  fe 00 28      inc $2800,x
$07:8a1a  22 ca e2 5e   jsl $5ee2ca
$07:8a1e  c5 1f         cmp $1f
$07:8a20  32 f0         and ($f0)
$07:8a22  24 42         bit $42
$07:8a24  e3 32         sbc $32,s
$07:8a26  4e c1 e4      lsr $e4c1
$07:8a29  30 3e         bmi $8a69
$07:8a2b  38            sec
$07:8a2c  f2 e2         sbc ($e2)
$07:8a2e  fe 02 12      inc $1202,x
$07:8a31  ff e1 40 28   sbc $2840e1,x
$07:8a35  de c4 2e      dec $2ec4,x
$07:8a38  fe 04 e0      inc $e004,x
$07:8a3b  f2 10         sbc ($10)
$07:8a3d  28            plp
$07:8a3e  0e f0 01      asl $01f0
$07:8a41  50 df         bvc $8a22
$07:8a43  20 5d 90      jsr $905d
$07:8a46  28            plp
$07:8a47  e0 30         cpx #$30
$07:8a49  02 f1         cop #$f1
$07:8a4b  33 2c         and ($2c,s),y
$07:8a4d  ca            dex
$07:8a4e  d2 28         cmp ($28)
$07:8a50  22 0b 24 25   jsl $25240b
$07:8a54  11 eb         ora ($eb),y
$07:8a56  0e 10 28      asl $2810
$07:8a59  cf e1 32 00   cmp $0032e1
$07:8a5d  42 0e         wdm #$0e
$07:8a5f  df 10 18 0f   cmp $0f1810,x
$07:8a63  2d 12 15      and $1512
$07:8a66  0d fe f4      ora $f4fe
$07:8a69  0f 28 ee f3   ora $f3ee28
$07:8a6d  3f 20 11 0f   and $0f1120,x
$07:8a71  e1 1c         sbc ($1c,x)
$07:8a73  18            clc
$07:8a74  ce 06 40      dec $4006
$07:8a77  0a            asl a
$07:8a78  33 04         and ($04,s),y
$07:8a7a  ff dc 14 de   sbc $de14dc,x
$07:8a7e  33 02         and ($02,s),y
$07:8a80  ef 11 f0 dd   sbc $ddf011
$07:8a84  ee 18 03      inc $0318
$07:8a87  20 1c 01      jsr $011c
$07:8a8a  10 ec         bpl $8a78
$07:8a8c  01 00         ora ($00,x)
$07:8a8e  18            clc
$07:8a8f  0e 22 40      asl $4022
$07:8a92  00 1e         brk #$1e
$07:8a94  f0 fe         beq $8a94
$07:8a96  1f 18 11 0f   ora $0f1118,x
$07:8a9a  ff 04 11 ff   sbc $ff1104,x
$07:8a9e  00 21         brk #$21
$07:8aa0  18            clc
$07:8aa1  0f c0 11 0f   ora $0f11c0
$07:8aa5  f0 10         beq $8ab7
$07:8aa7  21 0e         and ($0e,x)
$07:8aa9  08            php
$07:8aaa  11 22         ora ($22),y
$07:8aac  00 de         brk #$de
$07:8aae  01 00         ora ($00,x)
$07:8ab0  ef 0f 14 de   sbc $de140f
$07:8ab4  e0 01         cpx #$01
$07:8ab6  11 22         ora ($22),y
$07:8ab8  32 11         and ($11)
$07:8aba  10 04         bpl $8ac0
$07:8abc  dd de fc      cmp $fcde,x
$07:8abf  bd 00 00      lda $0000,x
$07:8ac2  12 22         ora ($22)
$07:8ac4  00 21         brk #$21
$07:8ac6  13 44         ora ($44,s),y
$07:8ac8  10 00         bpl $8aca
$07:8aca  10 0f         bpl $8adb
$07:8acc  cb            wai
$07:8acd  04 00         tsb $00
$07:8acf  00 00         brk #$00
$07:8ad1  11 42         ora ($42),y
$07:8ad3  10 00         bpl $8ad5
$07:8ad5  00 00         brk #$00
$07:8ad7  20 dc cd      jsr $cddc
$07:8ada  ef 00 00 21   sbc $210000
$07:8ade  00 00         brk #$00
$07:8ae0  00 00         brk #$00
$07:8ae2  0f 00 00 00   ora $000000
$07:8ae6  00 0f         brk #$0f
$07:8ae8  00 00         brk #$00
$07:8aea  00 00         brk #$00
$07:8aec  00 00         brk #$00
$07:8aee  00 00         brk #$00
$07:8af0  00 00         brk #$00
$07:8af2  00 00         brk #$00
$07:8af4  00 00         brk #$00
$07:8af6  00 00         brk #$00
$07:8af8  00 00         brk #$00
$07:8afa  01 00         ora ($00,x)
$07:8afc  00 00         brk #$00
$07:8afe  00 00         brk #$00
$07:8b00  00 00         brk #$00
$07:8b02  00 ea         brk #$ea
$07:8b04  09 00         ora #$00
$07:8b06  00 00         brk #$00
$07:8b08  00 00         brk #$00
$07:8b0a  00 00         brk #$00
$07:8b0c  00 00         brk #$00
$07:8b0e  98            tya
$07:8b0f  0b            phd
$07:8b10  51 1d         eor ($1d),y
$07:8b12  bf 23 2f cd   lda $cd2f23,x
$07:8b16  05 98         ora $98
$07:8b18  2e f0 f0      rol $f0f0
$07:8b1b  04 10         tsb $10
$07:8b1d  fe 00 13      inc $1300,x
$07:8b20  98            tya
$07:8b21  0d e2 32      ora $32e2
$07:8b24  ee 03 30      inc $3003
$07:8b27  d2 3f         cmp ($3f)
$07:8b29  98            tya
$07:8b2a  df 34 09 d4   cmp $d40934,x
$07:8b2e  40            rti
$07:8b2f  0f df 32 88   ora $8832df
$07:8b33  c9 d4         cmp #$d4
$07:8b35  54 2b ad      mvn $ad,$2b
$07:8b38  12 e1         ora ($e1)
$07:8b3a  1f 98 ee 21   ora $21ee98,x
$07:8b3e  0f 22 fe df   ora $dffe22
$07:8b42  21 f0         and ($f0,x)
$07:8b44  88            dey
$07:8b45  26 3c         rol $3c
$07:8b47  f0 2d         beq $8b76
$07:8b49  d0 ff         bne $8b4a
$07:8b4b  21 10         and ($10,x)
$07:8b4d  98            tya
$07:8b4e  1e 03 3d      asl $3d03,x
$07:8b51  e2 e0         sep #$e0
$07:8b53  2e ff 11      rol $11ff
$07:8b56  94 00         sty $00,x
$07:8b58  fe cb d3      inc $d3cb,x
$07:8b5b  52 de         eor ($de)
$07:8b5d  f1 11         sbc ($11),y
$07:8b5f  88            dey
$07:8b60  33 ce         and ($ce,s),y
$07:8b62  fb            xce
$07:8b63  df 36 3b 04   cmp $043b36,x
$07:8b67  1b            tcs
$07:8b68  98            tya
$07:8b69  d3 2f         cmp ($2f,s),y
$07:8b6b  f0 13         beq $8b80
$07:8b6d  fd e2 33      sbc $33e2,x
$07:8b70  f0 88         beq $8afa
$07:8b72  fe ad 44      inc $44ad,x
$07:8b75  51 c2         eor ($c2),y
$07:8b77  31 f1         and ($f1),y
$07:8b79  f0 88         beq $8b03
$07:8b7b  00 ff         brk #$ff
$07:8b7d  f0 10         beq $8b8f
$07:8b7f  56 1c         lsr $1c,x
$07:8b81  9c ee b4      stz $b4ee
$07:8b84  ff ee f0 00   sbc $00f0ee,x
$07:8b88  01 1e         ora ($1e,x)
$07:8b8a  f1 04         sbc ($04),y
$07:8b8c  b4 41         ldy $41,x
$07:8b8e  10 00         bpl $8b90
$07:8b90  0e e5 1d      asl $1de5
$07:8b93  ed 01 94      sbc $9401
$07:8b96  0c c1 35      tsb $35c1
$07:8b99  21 0f         and ($0f,x)
$07:8b9b  f0 11         beq $8bae
$07:8b9d  22 a4 22 22   jsl $2222a4
$07:8ba1  33 63         and ($63,s),y
$07:8ba3  9b            txy
$07:8ba4  31 33         and ($33),y
$07:8ba6  32 a8         and ($a8)
$07:8ba8  0f 0f 0f f2   ora $f20f0f
$07:8bac  3f fb d3 00   and $00d3fb,x
$07:8bb0  b8            clv
$07:8bb1  14 de         trb $de
$07:8bb3  03 fe         ora $fe,s
$07:8bb5  f0 01         beq $8bb8
$07:8bb7  0f 00 84 31   ora $318400
$07:8bbb  1f 00 20 ff   ora $ff2000,x
$07:8bbf  35 2b         and $2b,x
$07:8bc1  c2 88         rep #$88
$07:8bc3  10 4e         bpl $8c13
$07:8bc5  c0 5f         cpy #$5f
$07:8bc7  fe e1 21      inc $21e1,x
$07:8bca  12 68         ora ($68)
$07:8bcc  35 70         and $70,x
$07:8bce  23 20         and $20,s
$07:8bd0  00 2f         brk #$2f
$07:8bd2  13 dd         ora ($dd,s),y
$07:8bd4  78            sei
$07:8bd5  f1 1a         sbc ($1a),y
$07:8bd7  04 0f         tsb $0f
$07:8bd9  10 0f         bpl $8bea
$07:8bdb  f0 fe         beq $8bdb
$07:8bdd  78            sei
$07:8bde  cf df ff 1e   cmp $1effdf
$07:8be2  0e 0e 20      asl $200e
$07:8be5  1e 78 2f      asl $2f78,x
$07:8be8  12 11         ora ($11)
$07:8bea  20 23 21      jsr $2123
$07:8bed  40            rti
$07:8bee  34 98         bit $98,x
$07:8bf0  10 0f         bpl $8c01
$07:8bf2  11 0c         ora ($0c),y
$07:8bf4  22 02 2f 00   jsl $002f02
$07:8bf8  68            pla
$07:8bf9  af cf e1 fe   lda $fee1cf
$07:8bfd  fe b9 fb      inc $fbb9,x
$07:8c00  ca            dex
$07:8c01  78            sei
$07:8c02  de cd ed      dec $edcd,x
$07:8c05  cb            wai
$07:8c06  de ec b1      dec $b1ec,x
$07:8c09  ce 88 ff      dec $ff88
$07:8c0c  1f ff 10 e0   ora $e010ff,x
$07:8c10  00 e0         brk #$e0
$07:8c12  33 78         and ($78,s),y
$07:8c14  ec b5 55      cpx $55b5
$07:8c17  21 44         and ($44,x)
$07:8c19  16 13         asl $13,x
$07:8c1b  34 78         bit $78,x
$07:8c1d  43 33         eor $33,s
$07:8c1f  24 43         bit $43
$07:8c21  34 24         bit $24,x
$07:8c23  30 20         bmi $8c45
$07:8c25  78            sei
$07:8c26  22 0e 00 0f   jsl $0f000e
$07:8c2a  0f 00 2a 01   ora $012a00
$07:8c2e  78            sei
$07:8c2f  fe de df      inc $dfde,x
$07:8c32  d3 9b         cmp ($9b,s),y
$07:8c34  de bf db      dec $dbbf,x
$07:8c37  78            sei
$07:8c38  2b            pld
$07:8c39  de ed dd      dec $dded,x
$07:8c3c  ee ec 0d      inc $0dec
$07:8c3f  00 78         brk #$78
$07:8c41  e0 f1         cpx #$f1
$07:8c43  10 22         bpl $8c67
$07:8c45  22 20 20 3e   jsl $3e2020
$07:8c49  78            sei
$07:8c4a  42 12         wdm #$12
$07:8c4c  43 43         eor $43,s
$07:8c4e  5f 54 23 23   eor $232354,x
$07:8c52  78            sei
$07:8c53  43 21         eor $21,s
$07:8c55  42 34         wdm #$34
$07:8c57  22 31 c6 2f   jsl $2fc631
$07:8c5b  78            sei
$07:8c5c  11 1f         ora ($1f),y
$07:8c5e  00 0e         brk #$0e
$07:8c60  2c ee e1      bit $e1ee
$07:8c63  da            phx
$07:8c64  88            dey
$07:8c65  ee 11 ff      inc $ff11
$07:8c68  dc e0 fe      jml [$fee0]
$07:8c6b  ef fd 84 c0   sbc $c084fd
$07:8c6f  fa            plx
$07:8c70  e3 ff         sbc $ff,s
$07:8c72  0f cb ee 10   ora $10eecb
$07:8c76  78            sei
$07:8c77  e4 ef         cpx $ef
$07:8c79  13 ff         ora ($ff,s),y
$07:8c7b  20 41 f0      jsr $f041
$07:8c7e  45 88         eor $88
$07:8c80  11 f2         ora ($f2),y
$07:8c82  25 13         and $13
$07:8c84  11 32         ora ($32),y
$07:8c86  f4 01 74      pea $7401
$07:8c89  0d 20 dc      ora $dc20
$07:8c8c  cc db dc      cpy $dcdb
$07:8c8f  e4 2c         cpx $2c
$07:8c91  78            sei
$07:8c92  23 14         and $14,s
$07:8c94  de 12 2f      dec $2f12,x
$07:8c97  de fd 42      dec $42fd,x
$07:8c9a  88            dey
$07:8c9b  fc e4 2b      jsr ($2be4,x)
$07:8c9e  c2 f1         rep #$f1
$07:8ca0  fa            plx
$07:8ca1  f0 ff         beq $8ca2
$07:8ca3  88            dey
$07:8ca4  fd b1 4f      sbc $4fb1,x
$07:8ca7  cf ed 0e c4   cmp $c40eed
$07:8cab  ff 88 1e dc   sbc $dc1e88,x
$07:8caf  e2 2e         sep #$2e
$07:8cb1  02 ed         cop #$ed
$07:8cb3  e2 f0         sep #$f0
$07:8cb5  78            sei
$07:8cb6  3f f0 21 1f   and $1f21f0,x
$07:8cba  4e 1f 20      lsr $201f
$07:8cbd  46 88         lsr $88
$07:8cbf  0f 4e 13 1e   ora $1e134e
$07:8cc3  43 f1         eor $f1,s
$07:8cc5  14 11         trb $11
$07:8cc7  78            sei
$07:8cc8  22 2b 33 ff   jsl $ff332b
$07:8ccc  67 d2         adc [$d2]
$07:8cce  f1 4e         sbc ($4e),y
$07:8cd0  74 10         stz $10,x
$07:8cd2  10 12         bpl $8ce6
$07:8cd4  01 21         ora ($21,x)
$07:8cd6  0c 92 5d      tsb $5d92
$07:8cd9  78            sei
$07:8cda  d1 01         cmp ($01),y
$07:8cdc  ec bc b1      cpx $b1bc
$07:8cdf  11 f1         ora ($f1),y
$07:8ce1  a4 88         ldy $88
$07:8ce3  ee ae 42      inc $42ae
$07:8ce6  e9 e3         sbc #$e3
$07:8ce8  0a            asl a
$07:8ce9  01 9a         ora ($9a,x)
$07:8ceb  98            tya
$07:8cec  04 3c         tsb $3c
$07:8cee  c2 3c         rep #$3c
$07:8cf0  92 5f         sta ($5f)
$07:8cf2  9c 65 98      stz $9865
$07:8cf5  3d ce 23      and $23ce,x
$07:8cf8  00 e0         brk #$e0
$07:8cfa  f3 2e         sbc ($2e,s),y
$07:8cfc  12 98         ora ($98)
$07:8cfe  33 e1         and ($e1,s),y
$07:8d00  01 42         ora ($42,x)
$07:8d02  fd 16 4b      sbc $4b16,x
$07:8d05  a2 84 bb      ldx #$bb84
$07:8d08  bd cf 24      lda $24cf,x
$07:8d0b  02 33         cop #$33
$07:8d0d  46 66         lsr $66
$07:8d0f  88            dey
$07:8d10  03 10         ora $10,s
$07:8d12  de 10 00      dec $0010,x
$07:8d15  de 44 aa      dec $aa44,x
$07:8d18  88            dey
$07:8d19  14 2e         trb $2e
$07:8d1b  da            phx
$07:8d1c  bd 03 db      lda $db03,x
$07:8d1f  af 1f 88 dd   lda $dd881f
$07:8d23  0e fe d0      asl $d0fe
$07:8d26  d0 df         bne $8d07
$07:8d28  22 be 98 10   jsl $1098be
$07:8d2c  01 50         ora ($50,x)
$07:8d2e  cc f5 30      cpy $30f5
$07:8d31  e0 01 98      cpx #$9801
$07:8d34  12 1f         ora ($1f)
$07:8d36  04 20         tsb $20
$07:8d38  11 00         ora ($00),y
$07:8d3a  00 00         brk #$00
$07:8d3c  88            dey
$07:8d3d  3f 2f 02 0e   and $0e022f,x
$07:8d41  ed f3 44      sbc $44f3
$07:8d44  30 88         bmi $8cce
$07:8d46  ec ee dd      cpx $ddee
$07:8d49  ef 10 ee 03   sbc $03ee10
$07:8d4d  fd 98 f2      sbc $f298,x
$07:8d50  00 01         brk #$01
$07:8d52  0f ef 02 25   ora $2502ef
$07:8d56  1c 98 03      trb $0398
$07:8d59  2e e0 21      rol $21e0
$07:8d5c  01 11         ora ($11,x)
$07:8d5e  01 01         ora ($01,x)
$07:8d60  88            dey
$07:8d61  2e f2 00      rol $00f2
$07:8d64  f0 f0         beq $8d56
$07:8d66  f0 fb         beq $8d63
$07:8d68  d3 88         cmp ($88,s),y
$07:8d6a  0d fc 31      ora $31fc
$07:8d6d  ec ce 2e      cpx $2ece
$07:8d70  02 ce         cop #$ce
$07:8d72  a8            tay
$07:8d73  ef 00 01 1f   sbc $1f0100
$07:8d77  f0 3e         beq $8db7
$07:8d79  ff 3f 94 d3   sbc $d3943f,x
$07:8d7d  40            rti
$07:8d7e  12 32         ora ($32)
$07:8d80  44 21 35      mvp $35,$21
$07:8d83  32 88         and ($88)
$07:8d85  21 34         and ($34,x)
$07:8d87  f0 30         beq $8db9
$07:8d89  13 11         ora ($11,s),y
$07:8d8b  0d 54 98      ora $9854
$07:8d8e  d0 3f         bne $8dcf
$07:8d90  df 03 1d 03   cmp $031d03,x
$07:8d94  fc 12 78      jsr ($7812,x)
$07:8d97  9e 90 eb      stz $eb90,x
$07:8d9a  0d ff ce      ora $ceff
$07:8d9d  ff fd 84 ee   sbc $ee84fd,x
$07:8da1  f0 12         beq $8db5
$07:8da3  b9 f5 3f      lda $3ff5,y
$07:8da6  e0 17 94      cpx #$9417
$07:8da9  53 dc         eor ($dc,s),y
$07:8dab  36 40         rol $40,x
$07:8dad  03 66         ora $66,s
$07:8daf  20 f1 74      jsr $74f1
$07:8db2  35 44         and $44,x
$07:8db4  21 26         and ($26,x)
$07:8db6  33 20         and ($20,s),y
$07:8db8  05 3b         ora $3b
$07:8dba  94 04         sty $04,x
$07:8dbc  2e 02 2f      rol $2f02
$07:8dbf  ef 03 41 fd   sbc $fd4103
$07:8dc3  98            tya
$07:8dc4  f6 39         inc $39,x
$07:8dc6  a2 41 0f      ldx #$0f41
$07:8dc9  f0 0f         beq $8dda
$07:8dcb  fe a8 00      inc $00a8,x
$07:8dce  00 ff         brk #$ff
$07:8dd0  01 0f         ora ($0f,x)
$07:8dd2  ef e1 31 a4   sbc $a431e1
$07:8dd6  11 ed         ora ($ed),y
$07:8dd8  0f e1 30 cd   ora $cd30e1
$07:8ddc  12 0e         ora ($0e)
$07:8dde  a8            tay
$07:8ddf  f3 1e         sbc ($1e,s),y
$07:8de1  e2 30         sep #$30
$07:8de3  e0 ff         cpx #$ff
$07:8de5  14 0e         trb $0e
$07:8de7  a4 22         ldy $22
$07:8de9  24 40         bit $40
$07:8deb  f4 62 bb      pea $bb62
$07:8dee  04 50         tsb $50
$07:8df0  a8            tay
$07:8df1  d3 73         cmp ($73,s),y
$07:8df3  ca            dex
$07:8df4  e6 50         inc $50
$07:8df6  ec 04 0c      cpx $0c04
$07:8df9  a8            tay
$07:8dfa  23 ed         and $ed,s
$07:8dfc  23 f0         and $f0,s
$07:8dfe  3f cd 14 1c   and $1c14cd,x
$07:8e02  a4 dd         ldy $dd
$07:8e04  00 eb         brk #$eb
$07:8e06  dd be 33      cmp $33be,x
$07:8e09  db            stp
$07:8e0a  16 a8         asl $a8,x
$07:8e0c  eb            xba
$07:8e0d  00 25         brk #$25
$07:8e0f  eb            xba
$07:8e10  04 2c         tsb $2c
$07:8e12  bf 47 a4 1b   lda $1ba447,x
$07:8e16  b1 42         lda ($42),y
$07:8e18  bb            tyx
$07:8e19  02 12         cop #$12
$07:8e1b  41 fe         eor ($fe,x)
$07:8e1d  a8            tay
$07:8e1e  13 2f         ora ($2f,s),y
$07:8e20  ff 24 fd ee   sbc $eefd24,x
$07:8e24  e1 52         sbc ($52,x)
$07:8e26  a4 dc         ldy $dc
$07:8e28  20 cf 2d      jsr $2dcf
$07:8e2b  de 04 64      dec $6404,x
$07:8e2e  31 98         and ($98),y
$07:8e30  cc 13 b0      cpy $b013
$07:8e33  43 2e         eor $2e,s
$07:8e35  c1 1b         cmp ($1b,x)
$07:8e37  f5 a8         sbc $a8,x
$07:8e39  10 f4         bpl $8e2f
$07:8e3b  2d c0 1e      and $1ec0
$07:8e3e  e0 4f         cpx #$4f
$07:8e40  ef 98 33 12   sbc $123398
$07:8e44  10 1e         bpl $8e64
$07:8e46  b0 11         bcs $8e59
$07:8e48  40            rti
$07:8e49  0c a8 cf      tsb $cfa8
$07:8e4c  45 0d         eor $0d
$07:8e4e  e0 13         cpx #$13
$07:8e50  22 fb c1 a4   jsl $a4c1fb
$07:8e54  14 2f         trb $2f
$07:8e56  02 11         cop #$11
$07:8e58  10 ef         bpl $8e49
$07:8e5a  01 10         ora ($10,x)
$07:8e5c  94 de         sty $de,x
$07:8e5e  00 0f         brk #$0f
$07:8e60  ed fe ff      sbc $fffe
$07:8e63  0f a2 b4 2c   ora $2cb4a2
$07:8e67  e0 11         cpx #$11
$07:8e69  ff 01 1f f2   sbc $f21f01,x
$07:8e6d  10 98         bpl $8e07
$07:8e6f  da            phx
$07:8e70  f4 0e e3      pea $e30e
$07:8e73  31 01         and ($01),y
$07:8e75  00 0e         brk #$0e
$07:8e77  b8            clv
$07:8e78  00 00         brk #$00
$07:8e7a  0f f4 1e 0e   ora $0e1ef4
$07:8e7e  10 c2         bpl $8e42
$07:8e80  b8            clv
$07:8e81  20 23 0f      jsr $0f23
$07:8e84  ee 02 0c      inc $0c02
$07:8e87  11 12         ora ($12),y
$07:8e89  98            tya
$07:8e8a  5d de 11      eor $11de,x
$07:8e8d  0d ef ff      ora $ffef
$07:8e90  00 e2         brk #$e2
$07:8e92  68            pla
$07:8e93  33 c2         and ($c2,s),y
$07:8e95  02 5f         cop #$5f
$07:8e97  db            stp
$07:8e98  9f fc ff b4   sta $b4fffc,x
$07:8e9c  00 11         brk #$11
$07:8e9e  11 11         ora ($11),y
$07:8ea0  fe 33 1d      inc $1d33,x
$07:8ea3  cd b4 de      cmp $deb4
$07:8ea6  d0 45         bne $8eed
$07:8ea8  2d e0 12      and $12e0
$07:8eab  0f f0 b8 f4   ora $f4b8f0
$07:8eaf  3e a0 04      rol $04a0,x
$07:8eb2  20 f1 bc      jsr $bcf1
$07:8eb5  74 b4         stz $b4,x
$07:8eb7  1c ce 34      trb $34ce
$07:8eba  23 1c         and $1c,s
$07:8ebc  ac 23 1f      ldy $1f23
$07:8ebf  b4 f0         ldy $f0,x
$07:8ec1  10 ff         bpl $8ec2
$07:8ec3  ff ff e0 1d   sbc $1de0ff,x
$07:8ec7  df b4 f5 53   cmp $53f5b4,x
$07:8ecb  ff ef df 54   sbc $54dfef,x
$07:8ecf  0d e0 b8      ora $b8e0
$07:8ed2  0f 00 20 e0   ora $e02000
$07:8ed6  1d 34 0b      ora $0b34,x
$07:8ed9  c2 a8         rep #$a8
$07:8edb  62 ef 0f      per $9ecd
$07:8ede  21 21         and ($21,x)
$07:8ee0  ed 46 ce      sbc $ce46
$07:8ee3  b4 fe         ldy $fe,x
$07:8ee5  f0 cd         beq $8eb4
$07:8ee7  e0 22         cpx #$22
$07:8ee9  23 12         and $12,s
$07:8eeb  2c b4 af      bit $afb4
$07:8eee  21 32         and ($32,x)
$07:8ef0  cb            wai
$07:8ef1  f3 10         sbc ($10,s),y
$07:8ef3  0f 00 a8 ef   ora $efa800
$07:8ef7  01 00         ora ($00,x)
$07:8ef9  ff 02 6a e6   sbc $e66a02,x
$07:8efd  0b            phd
$07:8efe  b0 32         bcs $8f32
$07:8f00  10 0d         bpl $8f0f
$07:8f02  b0 42         bcs $8f46
$07:8f04  eb            xba
$07:8f05  bc dd b8      ldy $b8dd,x
$07:8f08  01 00         ora ($00,x)
$07:8f0a  e0 42         cpx #$42
$07:8f0c  ec f2 10      cpx $10f2
$07:8f0f  00 a8         brk #$a8
$07:8f11  00 21         brk #$21
$07:8f13  cf 22 40 df   cmp $df4022
$07:8f17  10 ff         bpl $8f18
$07:8f19  98            tya
$07:8f1a  00 0f         brk #$0f
$07:8f1c  00 00         brk #$00
$07:8f1e  f1 01         sbc ($01),y
$07:8f20  0e 05 b4      asl $b405
$07:8f23  0c d3 63      tsb $63d3
$07:8f26  de 20 f1      dec $f120,x
$07:8f29  00 f0         brk #$f0
$07:8f2b  a4 00         ldy $00
$07:8f2d  ff f0 00 00   sbc $0000f0,x
$07:8f31  00 ff         brk #$ff
$07:8f33  55 b4         eor $b4,x
$07:8f35  11 2c         ora ($2c),y
$07:8f37  b1 12         lda ($12),y
$07:8f39  20 01 22      jsr $2201
$07:8f3c  00 c0         brk #$c0
$07:8f3e  44 32 14      mvp $14,$32
$07:8f41  44 b5 54      mvp $54,$b5
$07:8f44  21 0f         and ($0f,x)
$07:8f46  98            tya
$07:8f47  f4 12 0f      pea $0f12
$07:8f4a  ef 11 fe ee   sbc $eefe11
$07:8f4e  f0 78         beq $8fc8
$07:8f50  cd 2f 4e      cmp $4e2f
$07:8f53  00 01         brk #$01
$07:8f55  13 ff         ora ($ff,s),y
$07:8f57  ee 94 33      inc $3394
$07:8f5a  32 11         and ($11)
$07:8f5c  22 33 21 0f   jsl $0f2133
$07:8f60  a0 94         ldy #$94
$07:8f62  2c bb ac      bit $acbb
$07:8f65  dc ef fe      jml [$feef]
$07:8f68  f0 1f         beq $8f89
$07:8f6a  b0 cd         bcs $8f39
$07:8f6c  de 00 23      dec $2300,x
$07:8f6f  54 ee 02      mvn $02,$ee
$07:8f72  41 b8         eor ($b8,x)
$07:8f74  11 31         ora ($31),y
$07:8f76  e0 1f         cpx #$1f
$07:8f78  0f 11 cf 24   ora $24cf11
$07:8f7c  98            tya
$07:8f7d  39 c1 2e      and $2ec1,y
$07:8f80  ee f0 0f      inc $0ff0
$07:8f83  1f 0f 98 0f   ora $0f980f,x
$07:8f87  33 bf         and ($bf,s),y
$07:8f89  ff 01 0e f1   sbc $f10e01,x
$07:8f8d  10 b4         bpl $8f43
$07:8f8f  11 11         ora ($11),y
$07:8f91  00 00         brk #$00
$07:8f93  0f e3 1e ff   ora $ff1ee3
$07:8f97  a4 f0         ldy $f0
$07:8f99  1d 55 cf      ora $cf55,x
$07:8f9c  12 01         ora ($01)
$07:8f9e  12 21         ora ($21)
$07:8fa0  78            sei
$07:8fa1  e5 3d         sbc $3d
$07:8fa3  c0 12         cpy #$12
$07:8fa5  b5 22         lda $22,x
$07:8fa7  54 1d 88      mvn $88,$1d
$07:8faa  00 02         brk #$02
$07:8fac  00 ef         brk #$ef
$07:8fae  f1 2c         sbc ($2c),y
$07:8fb0  ce 26 a8      dec $a826
$07:8fb3  00 00         brk #$00
$07:8fb5  ff 0f c6 4c   sbc $4cc60f,x
$07:8fb9  ec f2 a8      cpx $a8f2
$07:8fbc  2c 3f f3      bit $f33f
$07:8fbf  10 f0         bpl $8fb1
$07:8fc1  11 0e         ora ($0e),y
$07:8fc3  00 94         brk #$94
$07:8fc5  0e ed ef      asl $efed
$07:8fc8  01 12         ora ($12,x)
$07:8fca  23 fe         and $fe,s
$07:8fcc  40            rti
$07:8fcd  b4 05         ldy $05,x
$07:8fcf  20 0f e0      jsr $e00f
$07:8fd2  0e de f0      asl $f0de
$07:8fd5  00 a4         brk #$a4
$07:8fd7  f0 00         beq $8fd9
$07:8fd9  0f ef e0 3e   ora $3ee0ef
$07:8fdd  fe f1 88      inc $88f1,x
$07:8fe0  2b            pld
$07:8fe1  cf 00 df 01   cmp $01df00
$07:8fe5  1f 30 01 78   ora $780130,x
$07:8fe9  2d 32 2b      and $2b32
$07:8fec  2f 30 d0 21   and $21d030
$07:8ff0  15 68         ora $68,x
$07:8ff2  41 f0         eor ($f0,x)
$07:8ff4  1c ad e9      trb $e9ad
$07:8ff7  df a2 bc 78   cmp $78bca2,x
$07:8ffb  00 e1         brk #$e1
$07:8ffd  4a            lsr a
$07:8ffe  0f 43 3a 0e   ora $0e3a43
$07:9002  fe a4 00      inc $00a4,x
$07:9005  11 11         ora ($11),y
$07:9007  21 12         and ($12,x)
$07:9009  24 d0         bit $d0
$07:900b  31 88         and ($88),y
$07:900d  79 c3 21      adc $21c3,y
$07:9010  ef f2 11 01   sbc $0111f2
$07:9014  e0 78         cpx #$78
$07:9016  ee a0 bf      inc $bfa0
$07:9019  dc db d1      jml [$d1db]
$07:901c  1f af a4 00   ora $00a4af,x
$07:9020  23 10         and $10,s
$07:9022  f1 00         sbc ($00),y
$07:9024  11 25         ora ($25),y
$07:9026  0e a8 22      asl $22a8
$07:9029  41 b0         eor ($b0,x)
$07:902b  11 00         ora ($00),y
$07:902d  11 df         ora ($df),y
$07:902f  12 b4         ora ($b4)
$07:9031  ed ef 41      sbc $41ef
$07:9034  0f e4 3e ed   ora $ed3ee4
$07:9038  f2 b8         sbc ($b8)
$07:903a  ff e0 11 fe   sbc $fe11e0,x
$07:903e  11 f0         ora ($f0),y
$07:9040  40            rti
$07:9041  ed 88 2f      sbc $2f88
$07:9044  72 54         adc ($54)
$07:9046  0f ef 02 1f   ora $1f02ef
$07:904a  de a4 0f      dec $0fa4,x
$07:904d  ee ee f0      inc $f0ee
$07:9050  00 05         brk #$05
$07:9052  0a            asl a
$07:9053  d1 b8         cmp ($b8),y
$07:9055  22 ec 02 11   jsl $1102ec
$07:9059  fe f1 11      inc $11f1,x
$07:905c  0f 88 af 41   ora $41af88
$07:9060  2b            pld
$07:9061  d0 43         bne $90a6
$07:9063  2f 0e 00 98   and $98000e
$07:9067  ff 00 f0 00   sbc $00f000,x
$07:906b  00 f0         brk #$f0
$07:906d  4a            lsr a
$07:906e  46 a4         lsr $a4
$07:9070  6d ac f2      adc $f2ac
$07:9073  32 11         and ($11)
$07:9075  22 10 11 88   jsl $881110
$07:9079  f0 21         beq $909c
$07:907b  11 11         ora ($11),y
$07:907d  0f 11 00 3b   ora $3b0011
$07:9081  78            sei
$07:9082  14 c2         trb $c2
$07:9084  e0 0d         cpx #$0d
$07:9086  b2 ee         lda ($ee)
$07:9088  0f 2f 84 0f   ora $0f842f
$07:908c  ff fe ee dc   sbc $dceefe,x
$07:9090  df fe e5 88   cmp $88e5fe,x
$07:9094  dd e1 50      cmp $50e1,x
$07:9097  ef 02 30 0f   sbc $0f3002
$07:909b  10 88         bpl $9025
$07:909d  00 01         brk #$01
$07:909f  42 f1         wdm #$f1
$07:90a1  23 11         and $11,s
$07:90a3  01 11         ora ($11,x)
$07:90a5  78            sei
$07:90a6  11 e5         ora ($e5),y
$07:90a8  0f f0 00 1e   ora $1e00f0
$07:90ac  01 ed         ora ($ed,x)
$07:90ae  78            sei
$07:90af  0f ff fe 00   ora $00feff
$07:90b3  b1 de         lda ($de),y
$07:90b5  be d0 88      ldx $88d0,y
$07:90b8  ef 00 ef 10   sbc $10ef00
$07:90bc  10 f0         bpl $90ae
$07:90be  ef 51 88 e6   sbc $e68851
$07:90c2  c9 51 21      cmp #$2151
$07:90c5  01 01         ora ($01,x)
$07:90c7  01 42         ora ($42,x)
$07:90c9  94 22         sty $22,x
$07:90cb  11 22         ora ($22),y
$07:90cd  10 00         bpl $90cf
$07:90cf  fe e0 1a      inc $1ae0,x
$07:90d2  a8            tay
$07:90d3  01 f2         ora ($f2,x)
$07:90d5  01 00         ora ($00,x)
$07:90d7  ef f1 30 cc   sbc $cc30f1
$07:90db  a4 ef         ldy $ef
$07:90dd  ff 1e 0f f0   sbc $f00f1e,x
$07:90e1  01 21         ora ($21,x)
$07:90e3  34 a4         bit $a4,x
$07:90e5  21 11         and ($11,x)
$07:90e7  11 01         ora ($01),y
$07:90e9  20 ef 52      jsr $52ef
$07:90ec  fc 94 b2      jsr ($b294,x)
$07:90ef  20 f0 00      jsr $00f0
$07:90f2  00 01         brk #$01
$07:90f4  11 14         ora ($14),y
$07:90f6  a4 1d         ldy $1d
$07:90f8  11 3d         ora ($3d),y
$07:90fa  d3 0f         cmp ($0f,s),y
$07:90fc  02 fa         cop #$fa
$07:90fe  b4 94         ldy $94,x
$07:9100  7b            tdc
$07:9101  dd 00 ff      cmp $ff00,x
$07:9104  0f ee ff fb   ora $fbffee
$07:9108  94 c4         sty $c4,x
$07:910a  52 fd         eor ($fd)
$07:910c  a9 03 41      lda #$4103
$07:910f  02 44         cop #$44
$07:9111  98            tya
$07:9112  f1 11         sbc ($11),y
$07:9114  0e 00 11      asl $1100
$07:9117  10 1e         bpl $9137
$07:9119  c5 78         cmp $78
$07:911b  5b            tcd
$07:911c  cf 50 ed 0e   cmp $0eed50
$07:9120  21 f1         and ($f1,x)
$07:9122  2d a4 23      and $23a4
$07:9125  ae 52 e0      ldx $e052
$07:9128  32 30         and ($30)
$07:912a  a0 22         ldy #$22
$07:912c  a4 0b         ldy $0b
$07:912e  de 01 31      dec $3101,x
$07:9131  ff f1 10 ff   sbc $ff10f1,x
$07:9135  a4 ff         ldy $ff
$07:9137  f0 f0         beq $9129
$07:9139  12 1c         ora ($1c)
$07:913b  03 2d         ora $2d,s
$07:913d  f0 a8         beq $90e7
$07:913f  04 3b         tsb $3b
$07:9141  f0 b6         beq $90f9
$07:9143  5b            tcd
$07:9144  0e 21 0e      asl $0e21
$07:9147  a4 d6         ldy $d6
$07:9149  4f fc c0 ff   eor $ffc0fc
$07:914d  00 10         brk #$10
$07:914f  00 a4         brk #$a4
$07:9151  11 0f         ora ($0f),y
$07:9153  ee ff 10      inc $10ff
$07:9156  bf 23 21 a4   lda $a42123,x
$07:915a  11 0f         ora ($0f),y
$07:915c  13 ea         ora ($ea,s),y
$07:915e  d6 5c         dec $5c,x
$07:9160  d5 3d         cmp $3d,x
$07:9162  a4 d3         ldy $d3
$07:9164  0d ee f0      ora $f0ee
$07:9167  00 00         brk #$00
$07:9169  00 00         brk #$00
$07:916b  88            dey
$07:916c  e0 10         cpx #$10
$07:916e  fe 01 1f      inc $1f01,x
$07:9171  f3 11         sbc ($11,s),y
$07:9173  ff 78 23 62   sbc $622378,x
$07:9177  0b            phd
$07:9178  f1 42         sbc ($42),y
$07:917a  0d 15 43      ora $4315
$07:917d  88            dey
$07:917e  11 0f         ora ($0f),y
$07:9180  e1 0f         sbc ($0f,x)
$07:9182  f0 00         beq $9184
$07:9184  d0 6b         bne $91f1
$07:9186  78            sei
$07:9187  0b            phd
$07:9188  f3 e0         sbc ($e0,s),y
$07:918a  2f ef e2 1d   and $1de2ef
$07:918e  df 68 c1 42   cmp $42c168,x
$07:9192  03 22         ora $22,s
$07:9194  42 f2         wdm #$f2
$07:9196  3f 5c 98 00   and $00985c,x
$07:919a  00 11         brk #$11
$07:919c  e0 3c         cpx #$3c
$07:919e  e3 11         sbc $11,s
$07:91a0  1e 88 e0      asl $e088,x
$07:91a3  0b            phd
$07:91a4  f6 2c         inc $2c,x
$07:91a6  c7 39         cmp [$39]
$07:91a8  ce 11 84      dec $8411
$07:91ab  df 60 01 12   cmp $120160,x
$07:91af  32 23         and ($23)
$07:91b1  34 33         bit $33,x
$07:91b3  94 11         sty $11,x
$07:91b5  22 21 12 10   jsl $101221
$07:91b9  fe 01 cd      inc $cd01,x
$07:91bc  94 10         sty $10,x
$07:91be  12 34         ora ($34)
$07:91c0  32 0f         and ($0f)
$07:91c2  ef dd ee 98   sbc $98eedd
$07:91c6  10 0c         bpl $91d4
$07:91c8  e5 f0         sbc $f0
$07:91ca  20 ef 00      jsr $00ef
$07:91cd  0f 78 ab e0   ora $e0ab78
$07:91d1  5e ee fe      lsr $feee,x
$07:91d4  ee 07 20      inc $2007
$07:91d7  b0 01         bcs $91da
$07:91d9  11 22         ora ($22),y
$07:91db  11 34         ora ($34),y
$07:91dd  4d 44 44      eor $4444
$07:91e0  84 10         sty $10
$07:91e2  12 1f         ora ($1f)
$07:91e4  ec 01 cc      cpx $cc01
$07:91e7  cc e0 98      cpy $98e0
$07:91ea  00 f0         brk #$f0
$07:91ec  10 10         bpl $91fe
$07:91ee  ef 00 fc 43   sbc $43fc00
$07:91f2  84 66         sty $66
$07:91f4  55 43         eor $43,x
$07:91f6  5b            tcd
$07:91f7  c3 02         cmp $02,s
$07:91f9  0e ee 94      asl $94ee
$07:91fc  01 0b         ora ($0b,x)
$07:91fe  cf 12 22 0c   cmp $0c2212
$07:9202  15 20         ora $20,x
$07:9204  88            dey
$07:9205  ac 12 21      ldy $2112
$07:9208  f0 ff         beq $9209
$07:920a  33 0f         and ($0f,s),y
$07:920c  f0 94         beq $91a2
$07:920e  21 f1         and ($f1,x)
$07:9210  53 1c         eor ($1c,s),y
$07:9212  95 1a         sta $1a,x
$07:9214  ce 35 88      dec $8835
$07:9217  dc 23 df      jml [$df23]
$07:921a  1e 1f 02      asl $021f,x
$07:921d  11 0e         ora ($0e),y
$07:921f  a0 13         ldy #$13
$07:9221  2e ee 05      rol $05ee
$07:9224  40            rti
$07:9225  f2 23         sbc ($23)
$07:9227  2f a4 c0 20   and $20c0a4
$07:922b  ff ff 00 00   sbc $0000ff,x
$07:922f  f0 42         beq $9273
$07:9231  a4 ed         ldy $ed
$07:9233  e0 00         cpx #$00
$07:9235  0f 04 5f de   ora $de5f04
$07:9239  f2 88         sbc ($88)
$07:923b  09 e3 31      ora #$31e3
$07:923e  fe 00 f0      inc $f000,x
$07:9241  11 01         ora ($01),y
$07:9243  68            pla
$07:9244  16 f0         asl $f0,x
$07:9246  12 f0         ora ($f0)
$07:9248  20 ff e0      jsr $e0ff
$07:924b  22 78 fd 02   jsl $02fd78
$07:924f  00 ff         brk #$ff
$07:9251  10 ef         bpl $9242
$07:9253  5f cb 58 cf   eor $cf58cb,x
$07:9257  11 12         ora ($12),y
$07:9259  ec 2e fa      cpx $fa2e
$07:925c  04 12         tsb $12
$07:925e  78            sei
$07:925f  ff e6 1a 22   sbc $221ae6,x
$07:9263  1f 01 32 b0   ora $b03201,x
$07:9267  94 22         sty $22,x
$07:9269  1d ef 11      ora $11ef,x
$07:926c  1f f0 01 10   ora $1001f0,x
$07:9270  68            pla
$07:9271  d5 3d         cmp $3d,x
$07:9273  1e d2 1e      asl $1ed2,x
$07:9276  1d f0 3b      ora $3bf0,x
$07:9279  74 a9         stz $a9,x
$07:927b  c0 de         cpy #$de
$07:927d  3c 01 be      bit $be01,x
$07:9280  e2 20         sep #$20
$07:9282  84 f4         sty $f4
$07:9284  30 e0         bmi $9266
$07:9286  ff 10 00 f3   sbc $f30010,x
$07:928a  41 98         eor ($98,x)
$07:928c  0e 43 ce      asl $ce43
$07:928f  10 02         bpl $9293
$07:9291  1f 01 00 68   ora $680001,x
$07:9295  20 04 22      jsr $2204
$07:9298  22 39 b1 2f   jsl $2fb139
$07:929c  02 98         cop #$98
$07:929e  0f 11 0f 2e   ora $2e0f11
$07:92a2  c3 11         cmp $11,s
$07:92a4  0f e2 84 0a   ora $0a84e2
$07:92a8  f2 ac         sbc ($ac)
$07:92aa  ff 2e f0 11   sbc $11f02e,x
$07:92ae  00 98         brk #$98
$07:92b0  10 de         bpl $9290
$07:92b2  21 03         and ($03,x)
$07:92b4  0c e1 12      tsb $12e1
$07:92b7  0f 94 20 24   ora $242094
$07:92bb  00 ff         brk #$ff
$07:92bd  f0 40         beq $92ff
$07:92bf  e3 00         sbc $00,s
$07:92c1  a0 2c         ldy #$2c
$07:92c3  44 31 00      mvp $00,$31
$07:92c6  13 44         ora ($44,s),y
$07:92c8  41 ef         eor ($ef,x)
$07:92ca  98            tya
$07:92cb  5a            phy
$07:92cc  b2 22         lda ($22)
$07:92ce  00 ff         brk #$ff
$07:92d0  00 1c         brk #$1c
$07:92d2  03 84         ora $84,s
$07:92d4  15 39         ora $39,x
$07:92d6  bf f4 40 f1   lda $f140f4,x
$07:92da  21 fe         and ($fe,x)
$07:92dc  68            pla
$07:92dd  e0 ee         cpx #$ee
$07:92df  04 f0         tsb $f0
$07:92e1  f0 10         beq $92f3
$07:92e3  0e c1 84      asl $84c1
$07:92e6  45 1e         eor $1e
$07:92e8  f2 2d         sbc ($2d)
$07:92ea  d3 32         cmp ($32,s),y
$07:92ec  10 11         bpl $92ff
$07:92ee  54 30 1f      mvn $1f,$30
$07:92f1  fb            xce
$07:92f2  cd cb 9b      cmp $9bcb
$07:92f5  bd 2b 88      lda $882b,x
$07:92f8  d5 4f         cmp $4f,x
$07:92fa  bb            tyx
$07:92fb  12 22         ora ($22)
$07:92fd  0f 0f 10 78   ora $78100f
$07:9301  ff 10 02 3e   sbc $3e0210,x
$07:9305  d1 5c         cmp ($5c),y
$07:9307  e2 11         sep #$11
$07:9309  88            dey
$07:930a  f0 10         beq $931c
$07:930c  ff 21 0c f1   sbc $f10c21,x
$07:9310  21 0e         and ($0e,x)
$07:9312  88            dey
$07:9313  23 cd         and $cd,s
$07:9315  f1 10         sbc ($10),y
$07:9317  f0 01         beq $931a
$07:9319  1f d2 84 63   ora $6384d2,x
$07:931d  ec 16 0f      cpx $0f16
$07:9320  ef 72 ce f0   sbc $f0ce72
$07:9324  88            dey
$07:9325  04 2b         tsb $2b
$07:9327  0f 00 5c b4   ora $b45c00
$07:932b  22 30 84 10   jsl $108430
$07:932f  0f e0 fc bc   ora $bcfce0
$07:9333  36 01         rol $01,x
$07:9335  2e 88 df      rol $df88
$07:9338  50 01         bvc $933b
$07:933a  ef 12 0e ef   sbc $ef0e12
$07:933e  01 68         ora ($68,x)
$07:9340  2c e3 31      bit $31e3
$07:9343  ec 02 10      cpx $1002
$07:9346  20 e1 74      jsr $74e1
$07:9349  22 33 1f df   jsl $df1f33
$07:934d  34 31         bit $31,x
$07:934f  0f 22 68 be   ora $be6822
$07:9353  01 e3         ora ($e3,x)
$07:9355  10 de         bpl $9335
$07:9357  24 2d         bit $2d
$07:9359  a0 68         ldy #$68
$07:935b  52 dd         eor ($dd)
$07:935d  05 2c         ora $2c
$07:935f  d0 02         bne $9363
$07:9361  0f e0 74 f0   ora $f074e0
$07:9365  23 10         and $10,s
$07:9367  11 11         ora ($11),y
$07:9369  1b            tcs
$07:936a  f0 00         beq $936c
$07:936c  58            cli
$07:936d  30 af         bmi $931e
$07:936f  1f ce f5 f1   ora $f1f5ce,x
$07:9373  20 b0 64      jsr $64b0
$07:9376  01 1f         ora ($1f,x)
$07:9378  ff f0 23 0d   sbc $0d23f0,x
$07:937c  e1 0f         sbc ($0f,x)
$07:937e  78            sei
$07:937f  0e 24 ed      asl $ed24
$07:9382  11 10         ora ($10),y
$07:9384  00 00         brk #$00
$07:9386  2f 74 11 11   and $111174
$07:938a  10 01         bpl $938d
$07:938c  11 0e         ora ($0e),y
$07:938e  d1 50         cmp ($50),y
$07:9390  74 cf         stz $cf,x
$07:9392  33 0b         and ($0b,s),y
$07:9394  bf 34 2b cc   lda $cc2b34,x
$07:9398  12 64         ora ($64)
$07:939a  eb            xba
$07:939b  cd f0 ff      cmp $fff0
$07:939e  ed df ee      sbc $eedf
$07:93a1  ff 68 f1 2d   sbc $2df168,x
$07:93a5  df 23 ca 41   cmp $41ca23,x
$07:93a9  1f f0 64 12   ora $1264f0,x
$07:93ad  54 dc f1      mvn $f1,$dc
$07:93b0  4f ff e2 30   eor $30e2ff
$07:93b4  58            cli
$07:93b5  02 2f         cop #$2f
$07:93b7  13 30         ora ($30,s),y
$07:93b9  1d 01 12      ora $1201,x
$07:93bc  11 58         ora ($58),y
$07:93be  0f 50 0e 33   ora $330e50
$07:93c2  11 d4         ora ($d4),y
$07:93c4  41 db         eor ($db,x)
$07:93c6  58            cli
$07:93c7  15 1a         ora $1a,x
$07:93c9  a3 61         lda $61,s
$07:93cb  0e d1 32      asl $32d1
$07:93ce  cc 64 de      cpy $de64
$07:93d1  01 10         ora ($10,x)
$07:93d3  1e ae 0f      asl $0fae,x
$07:93d6  50 ee         bvc $93c6
$07:93d8  58            cli
$07:93d9  f1 00         sbc ($00),y
$07:93db  01 ef         ora ($ef,x)
$07:93dd  cd 04 0d      cmp $0d04
$07:93e0  03 48         ora $48,s
$07:93e2  7d ec 0f      adc $0fec,x
$07:93e5  d0 10         bne $93f7
$07:93e7  32 21         and ($21)
$07:93e9  41 48         eor ($48,x)
$07:93eb  01 e1         ora ($e1,x)
$07:93ed  12 22         ora ($22)
$07:93ef  11 22         ora ($22),y
$07:93f1  21 b4         and ($b4,x)
$07:93f3  58            cli
$07:93f4  1e ff 14      asl $14ff,x
$07:93f7  2e bf 02      rol $02bf
$07:93fa  0f 00 54 ff   ora $ff5400
$07:93fe  ff ff ff ee   sbc $eeffff,x
$07:9402  f4 41 f0      pea $f041
$07:9405  54 11 10      mvn $10,$11
$07:9408  14 53         trb $53
$07:940a  0e 56 61      asl $6156
$07:940d  11 68         ora ($68),y
$07:940f  00 1f         brk #$1f
$07:9411  2f 00 2f c2   and $c22f00
$07:9415  41 dd         eor ($dd,x)
$07:9417  54 a3 0c      mvn $0c,$a3
$07:941a  ee f0 00      inc $00f0
$07:941d  ed ce ff      sbc $ffce
$07:9420  70 cc         bvs $93ee
$07:9422  cc cc cc      cpy $cccc
$07:9425  cc 4c cf      cpy $cf4c
$07:9428  44 70 4c      mvp $4c,$70
$07:942b  33 44         and ($44,s),y
$07:942d  3c 44 30      bit $3044,x
$07:9430  12 22         ora ($22)
$07:9432  74 01         stz $01,x
$07:9434  10 a6         bpl $93dc
$07:9436  00 0f         brk #$0f
$07:9438  ff 00 00 54   sbc $540000,x
$07:943c  ff f1 44 ca   sbc $ca44f1,x
$07:9440  22 22 33 11   jsl $113322
$07:9444  60            rts
$07:9445  54 20 ff      mvn $ff,$20
$07:9448  11 10         ora ($10),y
$07:944a  ec b5 bb      cpx $bbb5
$07:944d  44 14 dd      mvp $dd,$14
$07:9450  05 2d         ora $2d
$07:9452  ac f0 43      ldy $43f0
$07:9455  46 44         lsr $44
$07:9457  53 0f         eor ($0f,s),y
$07:9459  f0 11         beq $946c
$07:945b  10 23         bpl $9480
$07:945d  cd 14 48      cmp $4814
$07:9460  4a            lsr a
$07:9461  01 00         ora ($00,x)
$07:9463  e0 00         cpx #$00
$07:9465  10 f0         bpl $9457
$07:9467  5e 38 ce      lsr $ce38,x
$07:946a  fe 67 9a      inc $9a67,x
$07:946d  02 02         cop #$02
$07:946f  0e fe 38      asl $38fe
$07:9472  00 e1         brk #$e1
$07:9474  0e 30 10      asl $1030
$07:9477  00 1f         brk #$1f
$07:9479  ff 34 12 12   sbc $121234,x
$07:947d  1a            inc a
$07:947e  f3 21         sbc ($21,s),y
$07:9480  ee 1c ae      inc $ae1c
$07:9483  30 f4         bmi $9479
$07:9485  44 44 44      mvp $44,$44
$07:9488  44 44 33      mvp $33,$44
$07:948b  32 44         and ($44)
$07:948d  f0 10         beq $949f
$07:948f  ff 23 fd e0   sbc $e0fd23,x
$07:9493  22 10 38 10   jsl $103810
$07:9497  0e f3 21      asl $21f3
$07:949a  fd 11 1f      sbc $1f11,x
$07:949d  f1 40         sbc ($40),y
$07:949f  10 ff         bpl $94a0
$07:94a1  ff ed dc bb   sbc $bbdced,x
$07:94a5  cd 5d 14      cmp $145d
$07:94a8  ec cf ff      cpx $ffcf
$07:94ab  ff 00 10 13   sbc $131000,x
$07:94af  45 18         eor $18
$07:94b1  c0 22         cpy #$22
$07:94b3  00 00         brk #$00
$07:94b5  1e 10 11      asl $1110,x
$07:94b8  00 14         brk #$14
$07:94ba  00 11         brk #$11
$07:94bc  10 00         bpl $94be
$07:94be  00 00         brk #$00
$07:94c0  d0 50         bne $9512
$07:94c2  04 ba         tsb $ba
$07:94c4  bf dd ef ef   lda $efefdd,x
$07:94c8  00 00         brk #$00
$07:94ca  00 04         brk #$04
$07:94cc  00 00         brk #$00
$07:94ce  00 00         brk #$00
$07:94d0  00 00         brk #$00
$07:94d2  0f 00 00 df   ora $df0000
$07:94d6  fe ee ee      inc $eeee,x
$07:94d9  ff ff 00 00   sbc $0000ff,x
$07:94dd  00 00         brk #$00
$07:94df  00 00         brk #$00
$07:94e1  00 00         brk #$00
$07:94e3  00 00         brk #$00
$07:94e5  00 01         brk #$01
$07:94e7  00 00         brk #$00
$07:94e9  00 00         brk #$00
$07:94eb  00 00         brk #$00
$07:94ed  00 00         brk #$00
$07:94ef  5a            phy
$07:94f0  00 02         brk #$02
$07:94f2  00 00         brk #$00
$07:94f4  00 00         brk #$00
$07:94f6  00 00         brk #$00
$07:94f8  00 00         brk #$00
$07:94fa  c6 b2         dec $b2
$07:94fc  3f 10 04 2f   and $2f0410,x
$07:9500  11 10         ora ($10),y
$07:9502  00 b6         brk #$b6
$07:9504  11 10         ora ($10),y
$07:9506  01 11         ora ($11,x)
$07:9508  00 10         brk #$10
$07:950a  2b            pld
$07:950b  b1 62         lda ($62),y
$07:950d  ec da 10      cpx $10da
$07:9510  10 fe         bpl $9510
$07:9512  e1 f1         sbc ($f1,x)
$07:9514  f0 b6         beq $94cc
$07:9516  00 00         brk #$00
$07:9518  00 01         brk #$01
$07:951a  f5 60         sbc $60,x
$07:951c  21 19         and ($19,x)
$07:951e  92 e3         sta ($e3)
$07:9520  ef ef ff ff   sbc $ffffef
$07:9524  ff 00 00 b6   sbc $b60000,x
$07:9528  00 0f         brk #$0f
$07:952a  1a            inc a
$07:952b  a1 ff         lda ($ff,x)
$07:952d  ff 00 ff 8a   sbc $8aff00,x
$07:9531  f0 be         beq $94f1
$07:9533  ed dd ee      sbc $eedd
$07:9536  dd fd d0      cmp $d0fd,x
$07:9539  c6 f2         dec $f2
$07:953b  30 10         bmi $954d
$07:953d  f4 30 00      pea $0030
$07:9540  11 00         ora ($00),y
$07:9542  b7 01         lda [$01],y
$07:9544  11 00         ora ($00),y
$07:9546  11 10         ora ($10),y
$07:9548  10 2a         bpl $9574
$07:954a  a2 ea         ldx #$ea
$07:954c  09 00         ora #$00
$07:954e  00 00         brk #$00
$07:9550  00 00         brk #$00
$07:9552  00 00         brk #$00
$07:9554  00 00         brk #$00
$07:9556  a8            tay
$07:9557  00 00         brk #$00
$07:9559  2b            pld
$07:955a  6b            rtl
$07:955b  14 a4         trb $a4
$07:955d  1b            tcs
$07:955e  46 a0         lsr $a0
$07:9560  a1 0a         lda ($0a,x)
$07:9562  1a            inc a
$07:9563  e1 6d         sbc ($6d,x)
$07:9565  41 04         eor ($04,x)
$07:9567  b4 a0         ldy $a0,x
$07:9569  b1 2b         lda ($2b),y
$07:956b  6d 01 00      adc $0001
$07:956e  c0 2d         cpy #$2d
$07:9570  30 90         bmi $9502
$07:9572  d0 ee         bne $9562
$07:9574  a5 ca         lda $ca
$07:9576  42 04         wdm #$04
$07:9578  3e 62 b0      rol $b062,x
$07:957b  01 11         ora ($11,x)
$07:957d  00 01         brk #$01
$07:957f  e1 ee         sbc ($ee,x)
$07:9581  ed 04 b0      sbc $b004
$07:9584  e1 2c         sbc ($2c,x)
$07:9586  3c 2d 04      bit $042d,x
$07:9589  d4 20         pei ($20)
$07:958b  23 a0         and $a0,s
$07:958d  2d f3 a1      and $a1f3
$07:9590  4c e0 fc      jmp $fce0
$07:9593  1d c0 a0      ora $a0c0,x
$07:9596  5f e1 f2 f3   eor $f3f2e1,x
$07:959a  20 54 2e      jsr $2e54
$07:959d  5c b0 0e d1   jml $d10eb0
$07:95a1  49 5f         eor #$5f
$07:95a3  c6 a3         dec $a3
$07:95a5  a1 4a         lda ($4a,x)
$07:95a7  b0 61         bcs $960a
$07:95a9  f0 20         beq $95cb
$07:95ab  ff 3d 14 e0   sbc $e0143d,x
$07:95af  01 b0         ora ($b0,x)
$07:95b1  e0 ff         cpx #$ff
$07:95b3  d4 f0         pei ($f0)
$07:95b5  2e 3d 2f      rol $2f3d
$07:95b8  01 c0         ora ($c0,x)
$07:95ba  e1 f1         sbc ($f1,x)
$07:95bc  fe 23 d3      inc $d323,x
$07:95bf  e0 0e         cpx #$0e
$07:95c1  3d b0 44      and $44b0,x
$07:95c4  b2 f0         lda ($f0)
$07:95c6  0f 2e c6 fe   ora $fec62e
$07:95ca  30 b0         bmi $957c
$07:95cc  1d 10 c2      ora $c210,x
$07:95cf  00 20         brk #$20
$07:95d1  4e f2 cf      lsr $cff2
$07:95d4  b0 11         bcs $95e7
$07:95d6  2e 1f d2      rol $d21f
$07:95d9  bc 51 f5      ldy $f551,x
$07:95dc  e3 c0         sbc $c0,s
$07:95de  f0 1c         beq $95fc
$07:95e0  21 f1         and ($f1,x)
$07:95e2  f1 f1         sbc ($f1),y
$07:95e4  2e f1 a0      rol $a0f1
$07:95e7  df 05 0b 01   cmp $010b05,x
$07:95eb  9e 02 c2      stz $c202,x
$07:95ee  6b            rtl
$07:95ef  b0 02         bcs $95f3
$07:95f1  f2 ff         sbc ($ff)
$07:95f3  1b            tcs
$07:95f4  2c f5 5d      bit $5df5
$07:95f7  40            rti
$07:95f8  c0 00         cpy #$00
$07:95fa  f0 b0         beq $95ac
$07:95fc  1f 11 10 00   ora $001011,x
$07:9600  fd b0 20      sbc $20b0,x
$07:9603  0f 10 fe 2e   ora $2efe10
$07:9607  cf 23 d2 b0   cmp $b0d223
$07:960b  0f 31 2c e2   ora $e22c31
$07:960f  df fd 45 01   cmp $0145fd,x
$07:9613  b0 fe         bcs $9613
$07:9615  1f 2c f4 f2   ora $f2f42c,x
$07:9619  1f 1f 4f b0   ora $b04f1f,x
$07:961d  f0 15         beq $9634
$07:961f  0f 1e d2 fd   ora $fdd21e
$07:9623  d3 1e         cmp ($1e,s),y
$07:9625  b0 3e         bcs $9665
$07:9627  e3 1e         sbc $1e,s
$07:9629  ee 0e 0f      inc $0f0e
$07:962c  52 40         eor ($40)
$07:962e  b0 4e         bcs $967e
$07:9630  ff 2d f1 2f   sbc $2ff12d,x
$07:9634  31 ee         and ($ee),y
$07:9636  10 b4         bpl $95ec
$07:9638  0e 32 ff      asl $ff32
$07:963b  1d 0d 4f      ora $4f0d,x
$07:963e  d3 2f         cmp ($2f,s),y
$07:9640  b4 01         ldy $01,x
$07:9642  1c 0e 1e      trb $1e0e
$07:9645  31 12         and ($12),y
$07:9647  6b            rtl
$07:9648  1c a0 3a      trb $3aa0
$07:964b  1e d0 53      asl $53d0,x
$07:964e  63 fc         adc $fc,s
$07:9650  da            phx
$07:9651  2e b0 2e      rol $2eb0
$07:9654  34 f2         bit $f2,x
$07:9656  ef 1f 1e d2   sbc $d21e1f
$07:965a  14 c4         trb $c4
$07:965c  ee 3f e2      inc $e23f
$07:965f  e1 02         sbc ($02,x)
$07:9661  04 d0         tsb $d0
$07:9663  f1 c0         sbc ($c0),y
$07:9665  2d 2f 01      and $012f
$07:9668  20 10 1f      jsr $1f10
$07:966b  ff f0 b0 3b   sbc $3bb0f0,x
$07:966f  51 3e         eor ($3e),y
$07:9671  f0 c0         beq $9633
$07:9673  fd f1 53      sbc $53f1,x
$07:9676  c4 e2         cpy $e2
$07:9678  fe ff 3e      inc $3eff,x
$07:967b  03 04         ora $04,s
$07:967d  b3 c4         lda ($c4,s),y
$07:967f  b0 bf         bcs $9640
$07:9681  ff 20 50 1e   sbc $1e5020,x
$07:9685  0f ed 01 b0   ora $b001ed
$07:9689  3d 50 2a      and $2a50,x
$07:968c  ff 1d 0d 01   sbc $010d1d,x
$07:9690  54 c4 d1      mvn $d1,$c4
$07:9693  00 d1         brk #$d1
$07:9695  01 f3         ora ($f3,x)
$07:9697  04 c1         tsb $c1
$07:9699  d2 b0         cmp ($b0)
$07:969b  0d f0 10      ora $10f0
$07:969e  51 3e         eor ($3e),y
$07:96a0  0e ee ed      asl $edee
$07:96a3  b4 4d         ldy $4d,x
$07:96a5  5f fb 04 fd   eor $fd04fb,x
$07:96a9  03 21         ora $21,s
$07:96ab  2d c4 f0      and $f0c4
$07:96ae  f1 d0         sbc ($d0),y
$07:96b0  21 10         and ($10,x)
$07:96b2  f5 c0         sbc $c0,x
$07:96b4  00 a4         brk #$a4
$07:96b6  29 25         and #$25
$07:96b8  0f 40 de a0   ora $a0de40
$07:96bc  03 2b         ora $2b,s
$07:96be  b0 01         bcs $96c1
$07:96c0  f2 fc         sbc ($fc)
$07:96c2  be 3d df      ldx $df3d,y
$07:96c5  34 53         bit $53,x
$07:96c7  c0 f1         cpy #$f1
$07:96c9  e0 fd         cpx #$fd
$07:96cb  df 12 04 5f   cmp $5f0412,x
$07:96cf  11 b0         ora ($b0),y
$07:96d1  d1 f1         cmp ($f1),y
$07:96d3  31 41         and ($41),y
$07:96d5  02 da         cop #$da
$07:96d7  00 01         brk #$01
$07:96d9  b0 f1         bcs $96cc
$07:96db  1f 0a ce 10   ora $10ce0a,x
$07:96df  0e 15 43      asl $4315
$07:96e2  c0 ff         cpy #$ff
$07:96e4  fd f0 df      sbc $dff0,x
$07:96e7  00 2f         brk #$2f
$07:96e9  25 e0         and $e0
$07:96eb  b0 3a         bcs $9727
$07:96ed  5e 25 c6      lsr $c625,x
$07:96f0  fd 1f c1      sbc $c11f,x
$07:96f3  30 b0         bmi $96a5
$07:96f5  1e f2 cf      asl $cff2,x
$07:96f8  da            phx
$07:96f9  2e 02 d0      rol $d002
$07:96fc  34 c0         bit $c0,x
$07:96fe  0f e0 0d 20   ora $200de0
$07:9702  e0 00         cpx #$00
$07:9704  0f f4 c0 4e   ora $4ec0f4
$07:9708  20 c3 0d      jsr $0dc3
$07:970b  3e f3 e1      rol $e1f3,x
$07:970e  30 b0         bmi $96c0
$07:9710  01 21         ora ($21,x)
$07:9712  11 c1         ora ($c1),y
$07:9714  3c 1e 91      bit $911e,x
$07:9717  1d b0 6d      ora $6db0,x
$07:971a  b2 15         lda ($15)
$07:971c  fb            xce
$07:971d  f2 bd         sbc ($bd)
$07:971f  2d f1 c0      and $c0f1
$07:9722  f1 0d         sbc ($0d),y
$07:9724  26 d2         rol $d2
$07:9726  df 49 2d f4   cmp $f42d49,x
$07:972a  c0 d3         cpy #$d3
$07:972c  0e 01 0f      asl $0f01
$07:972f  e1 3f         sbc ($3f,x)
$07:9731  01 d4         ora ($d4,x)
$07:9733  c0 f2         cpy #$f2
$07:9735  0a            asl a
$07:9736  21 1f         and ($1f,x)
$07:9738  c2 0d         rep #$0d
$07:973a  f0 1e         beq $975a
$07:973c  c0 12         cpy #$12
$07:973e  00 c5         brk #$c5
$07:9740  4a            lsr a
$07:9741  2c 03 a2      bit $a203
$07:9744  ef c0 50 1f   sbc $1f50c0
$07:9748  e0 21         cpx #$21
$07:974a  f0 f0         beq $973c
$07:974c  1e 3e c0      asl $c03e,x
$07:974f  d3 e2         cmp ($e2,s),y
$07:9751  eb            xba
$07:9752  31 1e         and ($1e),y
$07:9754  d2 1f         cmp ($1f)
$07:9756  f0 c0         beq $9718
$07:9758  12 00         ora ($00)
$07:975a  4d e1 e7      eor $e7e1
$07:975d  fa            plx
$07:975e  5e f3 c0      lsr $c0f3,x
$07:9761  b2 0e         lda ($0e)
$07:9763  40            rti
$07:9764  02 01         cop #$01
$07:9766  21 f0         and ($f0,x)
$07:9768  1f c0 11 f0   ora $f011c0,x
$07:976c  d1 3e         cmp ($3e),y
$07:976e  1c f4 0f      trb $0ff4
$07:9771  ef c0 33 00   sbc $0033c0
$07:9775  de 10 ff      dec $ff10,x
$07:9778  eb            xba
$07:9779  10 13         bpl $978e
$07:977b  c0 71         cpy #$71
$07:977d  3b            tsc
$07:977e  5f b3 f5 2d   eor $2df5b3,x
$07:9782  4f 42 c0 13   eor $13c042
$07:9786  d3 3e         cmp ($3e,s),y
$07:9788  3e c2 e0      rol $e0c2,x
$07:978b  fc 10 c0      jsr ($c010,x)
$07:978e  24 ef         bit $ef
$07:9790  f0 2f         beq $97c1
$07:9792  ec d2 1f      cpx $1fd2
$07:9795  bf c0 ec 4b   lda $4becc0,x
$07:9799  e9 b1         sbc #$b1
$07:979b  4a            lsr a
$07:979c  31 e4         and ($e4),y
$07:979e  02 c0         cop #$c0
$07:97a0  50 43         bvc $97e5
$07:97a2  01 03         ora ($03,x)
$07:97a4  e0 4d         cpx #$4d
$07:97a6  00 f2         brk #$f2
$07:97a8  b0 ad         bcs $9757
$07:97aa  5f 40 c1 ec   eor $ecc140,x
$07:97ae  d4 0c         pei ($0c)
$07:97b0  0f c0 ee ee   ora $eeeec0
$07:97b4  0d df ed      ora $eddf
$07:97b7  ff 24 d0 c0   sbc $c0d024,x
$07:97bb  6f f4 b2 3f   adc $3fb2f4
$07:97bf  41 10         eor ($10,x)
$07:97c1  12 14         ora ($14)
$07:97c3  b0 d3         bcs $9798
$07:97c5  6e 22 ec      ror $ec22
$07:97c8  ff 11 de 20   sbc $20de11,x
$07:97cc  c4 1f         cpy $1f
$07:97ce  e1 f1         sbc ($f1,x)
$07:97d0  01 ee         ora ($ee,x)
$07:97d2  40            rti
$07:97d3  e2 ec         sep #$ec
$07:97d5  c0 00         cpy #$00
$07:97d7  ee 11 47      inc $4711
$07:97da  d0 1d         bne $97f9
$07:97dc  03 ee         ora $ee,s
$07:97de  c4 4f         cpy $4f
$07:97e0  5f c1 f0 01   eor $01f0c1,x
$07:97e4  fe 23 d0      inc $d023,x
$07:97e7  b0 0b         bcs $97f4
$07:97e9  a2 dd         ldx #$dd
$07:97eb  3d df cf      and $cfdf,x
$07:97ee  5a            phy
$07:97ef  90 c0         bcc $97b1
$07:97f1  01 2e         ora ($2e,x)
$07:97f3  c4 1e         cpy $1e
$07:97f5  0f ec f0 fe   ora $fef0ec
$07:97f9  c0 f2         cpy #$f2
$07:97fb  55 a0         eor $a0,x
$07:97fd  ff 4f f2 03   sbc $03f24f,x
$07:9801  51 c0         eor ($c0),y
$07:9803  fd 13 3f      sbc $3f13,x
$07:9806  d3 2f         cmp ($2f,s),y
$07:9808  1f c0 01 c0   ora $c001c0,x
$07:980c  19 e1 12      ora $12e1,y
$07:980f  cf 21 2f 0e   cmp $0e2f21
$07:9813  01 c0         ora ($c0,x)
$07:9815  ff df fd fd   sbc $fdfddf,x
$07:9819  bf e5 4a 11   lda $114ae5,x
$07:981d  c0 e1         cpy #$e1
$07:981f  4e 13 35      lsr $3513
$07:9822  02 11         cop #$11
$07:9824  32 4d         and ($4d)
$07:9826  c0 24         cpy #$24
$07:9828  f1 dc         sbc ($dc),y
$07:982a  e3 0f         sbc $0f,s
$07:982c  1c 01 f0      trb $f001
$07:982f  b0 bd         bcs $97ee
$07:9831  57 0f         eor [$0f],y
$07:9833  fa            plx
$07:9834  11 cc         ora ($cc),y
$07:9836  cb            wai
$07:9837  d6 c0         dec $c0,x
$07:9839  0a            asl a
$07:983a  ed cf 1d      sbc $1dcf
$07:983d  51 e1         eor ($e1),y
$07:983f  40            rti
$07:9840  d3 c0         cmp ($c0,s),y
$07:9842  e1 33         sbc ($33,x)
$07:9844  23 3f         and $3f,s
$07:9846  30 10         bmi $9858
$07:9848  0c 35 b0      tsb $b035
$07:984b  b1 2b         lda ($2b),y
$07:984d  fb            xce
$07:984e  ae 2d 07      ldx $072d
$07:9851  11 2b         ora ($2b),y
$07:9853  c4 31         cpy $31
$07:9855  ed 21 f3      sbc $f321
$07:9858  c0 1e         cpy #$1e
$07:985a  20 df c0      jsr $c0df
$07:985d  1d c6 2f      ora $2fc6,x
$07:9860  6e a3 fe      ror $fea3
$07:9863  f4 21 c0      pea $c021
$07:9866  55 4e         eor $4e,x
$07:9868  2e 32 d4      rol $d432
$07:986b  c4 31         cpy $31
$07:986d  de c0 1d      dec $1dc0,x
$07:9870  42 f3         wdm #$f3
$07:9872  13 21         ora ($21,s),y
$07:9874  0d 10 f2      ora $f210
$07:9877  c0 ff         cpy #$ff
$07:9879  f0 ff         beq $987a
$07:987b  dd 1e f0      cmp $f01e,x
$07:987e  cf ef c4 0d   cmp $0dc4ef
$07:9882  5c 0c 31 2f   jml $2f310c
$07:9886  2d 5d 02      and $025d
$07:9889  c0 42         cpy #$42
$07:988b  05 0e         ora $0e
$07:988d  2f 50 04 12   and $120450
$07:9891  1f b0 4b 31   ora $314bb0,x
$07:9895  02 02         cop #$02
$07:9897  d5 4c         cmp $4c,x
$07:9899  22 e2 c0 1f   jsl $1fc0e2
$07:989d  ef 00 2c e0   sbc $e02c00
$07:98a1  fd de ed      sbc $edde,x
$07:98a4  c0 ec         cpy #$ec
$07:98a6  2d e0 22      and $22e0
$07:98a9  d1 d3         cmp ($d3),y
$07:98ab  02 1f         cop #$1f
$07:98ad  c0 23         cpy #$23
$07:98af  02 23         cop #$23
$07:98b1  d2 24         cmp ($24)
$07:98b3  2e 42 22      rol $2242
$07:98b6  b0 a3         bcs $985b
$07:98b8  d1 5e         cmp ($5e),y
$07:98ba  61 13         adc ($13,x)
$07:98bc  13 f0         ora ($f0,s),y
$07:98be  d1 b4         cmp ($b4),y
$07:98c0  0c 2d f4      tsb $f42d
$07:98c3  d2 cf         cmp ($cf)
$07:98c5  49 6d         eor #$6d
$07:98c7  f1 b0         sbc ($b0),y
$07:98c9  c9 dc         cmp #$dc
$07:98cb  e1 b2         sbc ($b2,x)
$07:98cd  1b            tcs
$07:98ce  6c 04 b1      jmp ($b104)
$07:98d1  b0 6d         bcs $9940
$07:98d3  43 24         eor $24,s
$07:98d5  21 52         and ($52,x)
$07:98d7  56 42         lsr $42,x
$07:98d9  15 b4         ora $b4,x
$07:98db  1b            tcs
$07:98dc  2f 21 b5 c3   and $c3b521
$07:98e0  ff 10 df b4   sbc $b4df10,x
$07:98e4  31 c1         and ($c1),y
$07:98e6  e2 2f         sep #$2f
$07:98e8  b4 de         ldy $de,x
$07:98ea  00 ef         brk #$ef
$07:98ec  c0 0e         cpy #$0e
$07:98ee  f1 ce         sbc ($ce),y
$07:98f0  ee 02 ef      inc $ef02
$07:98f3  1f 2f c4 21   ora $21c42f,x
$07:98f7  e3 f0         sbc $f0,s
$07:98f9  02 e1         cop #$e1
$07:98fb  0d 4e 31      ora $314e
$07:98fe  b4 ce         ldy $ce,x
$07:9900  10 e3         bpl $98e5
$07:9902  e0 f0         cpx #$f0
$07:9904  5d e1 f1      eor $f1e1,x
$07:9907  b4 d4         ldy $d4,x
$07:9909  c2 f1         rep #$f1
$07:990b  d0 4d         bne $995a
$07:990d  b5 a2         lda $a2,x
$07:990f  29 b0 dd      and #$ddb0
$07:9912  bb            tyx
$07:9913  ed 9a cb      sbc $cb9a
$07:9916  fe 6a 44      inc $446a,x
$07:9919  c0 d1 0e      cpy #$0ed1
$07:991c  12 01         ora ($01)
$07:991e  42 24         wdm #$24
$07:9920  23 13         and $13,s
$07:9922  b4 f1         ldy $f1,x
$07:9924  3c 3e 1c      bit $1c3e,x
$07:9927  30 d1         bmi $98fa
$07:9929  ff 3e b4 2d   sbc $2db43e,x
$07:992d  01 f2         ora ($f2,x)
$07:992f  e1 0c         sbc ($0c,x)
$07:9931  30 de         bmi $9911
$07:9933  01 b4         ora ($b4,x)
$07:9935  1e 2a 4d      asl $4d2a,x
$07:9938  4d f3 c3      eor $c3f3
$07:993b  e5 c1         sbc $c1
$07:993d  b0 11         bcs $9950
$07:993f  f3 c2         sbc ($c2,s),y
$07:9941  12 f6         ora ($f6)
$07:9943  31 27         and ($27),y
$07:9945  25 b4         and $b4
$07:9947  10 f1         bpl $993a
$07:9949  20 d4 c2      jsr $c2d4
$07:994c  d2 f2         cmp ($f2)
$07:994e  b5 b0         lda $b0,x
$07:9950  01 01         ora ($01,x)
$07:9952  f1 0f         sbc ($0f),y
$07:9954  1f f1 c0 0f   ora $0fc0f1,x
$07:9958  b4 f0         ldy $f0,x
$07:995a  ff 0e fe 4b   sbc $4bfe0e,x
$07:995e  54 bd 2e      mvn $2e,$bd
$07:9961  c0 ed 00      cpy #$00ed
$07:9964  ef 4e d2 e1   sbc $e1d24e
$07:9968  e1 21         sbc ($21,x)
$07:996a  c4 f4         cpy $f4
$07:996c  fe 4f e0      inc $e04f,x
$07:996f  4f d0 30 d1   eor $d130d0
$07:9973  b4 1e         ldy $1e,x
$07:9975  02 fe         cop #$fe
$07:9977  23 d2         and $d2,s
$07:9979  d2 ee         cmp ($ee)
$07:997b  11 c0         ora ($c0),y
$07:997d  f0 10         beq $998f
$07:997f  e1 ec         sbc ($ec,x)
$07:9981  de fe c1      dec $c1fe,x
$07:9984  e4 c4         cpx $c4
$07:9986  ce e4 ed      dec $ede4
$07:9989  30 10         bmi $999b
$07:998b  02 fe         cop #$fe
$07:998d  2d b0 5f      and $5fb0
$07:9990  25 25         and $25
$07:9992  53 34         eor ($34,s),y
$07:9994  72 36         adc ($36)
$07:9996  64 b4         stz $b4
$07:9998  f5 cd         sbc $cd,x
$07:999a  5b            tcd
$07:999b  11 01         ora ($01),y
$07:999d  f0 1e         beq $99bd
$07:999f  f2 b4         sbc ($b4)
$07:99a1  fe 1e 5e      inc $5e1e,x
$07:99a4  e3 cd         sbc $cd,s
$07:99a6  3e fc 51      rol $51fc,x
$07:99a9  b4 d0         ldy $d0,x
$07:99ab  12 a4         ora ($a4)
$07:99ad  f1 c3         sbc ($c3),y
$07:99af  e1 2f         sbc ($2f,x)
$07:99b1  21 b0         and ($b0,x)
$07:99b3  cf 4b 03 f3   cmp $f3034b
$07:99b7  32 73         and ($73)
$07:99b9  53 42         eor ($42,s),y
$07:99bb  b0 64         bcs $9a21
$07:99bd  25 41         and $41
$07:99bf  21 02         and ($02,x)
$07:99c1  1e 53 22      asl $2253,x
$07:99c4  b4 0f         ldy $0f,x
$07:99c6  f0 1e         beq $99e6
$07:99c8  f2 f2         sbc ($f2)
$07:99ca  f1 ee         sbc ($ee),y
$07:99cc  e4 b4         cpx $b4
$07:99ce  b1 2f         lda ($2f),y
$07:99d0  e0 4b f4      cpx #$f44b
$07:99d3  b1 4d         lda ($4d),y
$07:99d5  c5 b0         cmp $b0
$07:99d7  bf 2d 12 be   lda $be122d,x
$07:99db  20 03 30      jsr $3003
$07:99de  32 b0         and ($b0)
$07:99e0  43 35         eor $35,s
$07:99e2  5e 56 32      lsr $3256,x
$07:99e5  62 31 f3      per $8d19
$07:99e8  b0 10         bcs $99fa
$07:99ea  63 f2         adc $f2,s
$07:99ec  4e 01 fc      lsr $fc01
$07:99ef  1e 11 b4      asl $b411,x
$07:99f2  1c 2d 0f      trb $0f2d
$07:99f5  e3 e0         sbc $e0,s
$07:99f7  3c 00 00      bit $0000,x
$07:99fa  b4 1d         ldy $1d,x
$07:99fc  4c f5 e0      jmp $e0f5
$07:99ff  20 00 d3      jsr $d300
$07:9a02  1e b4 50      asl $50b4,x
$07:9a05  b4 11         ldy $11,x
$07:9a07  e5 d1         sbc $d1
$07:9a09  c2 6b         rep #$6b
$07:9a0b  04 a0         tsb $a0
$07:9a0d  64 47         stz $47
$07:9a0f  c7 64         cmp [$64]
$07:9a11  62 62 1f      per $b976
$07:9a14  50 b0         bvc $99c6
$07:9a16  b3 ce         lda ($ce,s),y
$07:9a18  1f fd fe bc   ora $bcfefd,x
$07:9a1c  ef bf b4 fc   sbc $fcb4bf
$07:9a20  20 d4 ed      jsr $edd4
$07:9a23  3f e4 f1 3e   and $3ef1e4,x
$07:9a27  a4 96         ldy $96
$07:9a29  e1 52         sbc ($52,x)
$07:9a2b  e2 03         sep #$03
$07:9a2d  01 e2         ora ($e2,x)
$07:9a2f  d1 a4         cmp ($a4),y
$07:9a31  6b            rtl
$07:9a32  30 e2         bmi $9a16
$07:9a34  d0 2c         bne $9a62
$07:9a36  36 ce         rol $ce,x
$07:9a38  31 b0         and ($b0),y
$07:9a3a  e1 21         sbc ($21,x)
$07:9a3c  01 0f         ora ($0f,x)
$07:9a3e  00 0f         brk #$0f
$07:9a40  d1 bc         cmp ($bc),y
$07:9a42  b4 2e         ldy $2e,x
$07:9a44  11 ef         ora ($ef),y
$07:9a46  00 e0         brk #$e0
$07:9a48  12 b6         ora ($b6)
$07:9a4a  b2 b0         lda ($b0)
$07:9a4c  fe c1 1d      inc $1dc1,x
$07:9a4f  10 e3         bpl $9a34
$07:9a51  21 f4         and ($f4,x)
$07:9a53  02 a4         cop #$a4
$07:9a55  21 21         and ($21,x)
$07:9a57  b4 2d         ldy $2d,x
$07:9a59  00 f7         brk #$f7
$07:9a5b  de f0 b0      dec $b0f0,x
$07:9a5e  13 10         ora ($10,s),y
$07:9a60  20 10 00      jsr $0010
$07:9a63  1d d0 fe      ora $fed0,x
$07:9a66  b4 2e         ldy $2e,x
$07:9a68  00 0e         brk #$0e
$07:9a6a  02 0d         cop #$0d
$07:9a6c  11 0b         ora ($0b),y
$07:9a6e  21 b4         and ($b4,x)
$07:9a70  d4 ff         pei ($ff)
$07:9a72  2f d5 ec 52   and $52ecd5
$07:9a76  c4 0f         cpy $0f
$07:9a78  b4 01         ldy $01,x
$07:9a7a  f3 d0         sbc ($d0,s),y
$07:9a7c  30 e4         bmi $9a62
$07:9a7e  1b            tcs
$07:9a7f  32 d1         and ($d1)
$07:9a81  b4 f1         ldy $f1,x
$07:9a83  2f e6 a1 4d   and $4da1e6
$07:9a87  e4 ec         cpx $ec
$07:9a89  3f b4 12 d1   and $d112b4,x
$07:9a8d  1f 0f c3 2f   ora $2fc30f,x
$07:9a91  f1 1e         sbc ($1e),y
$07:9a93  a4 ec         ldy $ec
$07:9a95  30 ae         bmi $9a45
$07:9a97  51 11         eor ($11),y
$07:9a99  c2 1d         rep #$1d
$07:9a9b  c1 b4         cmp ($b4,x)
$07:9a9d  0f 21 3f 2f   ora $2f3f21
$07:9aa1  fd 4e 01      sbc $014e,x
$07:9aa4  40            rti
$07:9aa5  b4 0f         ldy $0f,x
$07:9aa7  20 fd 10      jsr $10fd
$07:9aaa  10 30         bpl $9adc
$07:9aac  0f 3b a4 f3   ora $f3a43b
$07:9ab0  dd 32 e4      cmp $e432,x
$07:9ab3  e1 2b         sbc ($2b,x)
$07:9ab5  0e fc a4      asl $a4fc
$07:9ab8  5f f6 1c f1   eor $f11cf6,x
$07:9abc  d1 bf         cmp ($bf),y
$07:9abe  11 e4         ora ($e4),y
$07:9ac0  b4 ff         ldy $ff,x
$07:9ac2  2f d1 2a 40   and $402ad1
$07:9ac6  2f 2d 42 b0   and $b0422d
$07:9aca  f2 fc         sbc ($fc)
$07:9acc  f2 f1         sbc ($f1)
$07:9ace  34 34         bit $34,x
$07:9ad0  43 4f         eor $4f,s
$07:9ad2  b0 23         bcs $9af7
$07:9ad4  11 53         ora ($53),y
$07:9ad6  05 11         ora $11
$07:9ad8  1f 20 f0 a0   ora $a0f020,x
$07:9adc  6f 2f 1e 2c   adc $2c1e2f
$07:9ae0  ef c0 1e 11   sbc $111ec0
$07:9ae4  b4 ff         ldy $ff,x
$07:9ae6  3c 00 f0      bit $f000,x
$07:9ae9  1f 1f f1 1b   ora $1bf11f,x
$07:9aed  b0 c0         bcs $9aaf
$07:9aef  c0 de e0      cpy #$e0de
$07:9af2  c1 3f         cmp ($3f,x)
$07:9af4  31 e2         and ($e2),y
$07:9af6  b4 ff         ldy $ff,x
$07:9af8  32 d3         and ($d3)
$07:9afa  ff 4d f1 2e   sbc $2ef14d,x
$07:9afe  01 b0         ora ($b0,x)
$07:9b00  f3 02         sbc ($02,s),y
$07:9b02  2f 12 0f 01   and $010f12
$07:9b06  f2 01         sbc ($01)
$07:9b08  a0 3f c0      ldy #$c03f
$07:9b0b  ff ff e3 fd   sbc $fde3ff,x
$07:9b0f  0e dc b0      asl $b0dc
$07:9b12  df dd be fe   cmp $febedd,x
$07:9b16  0b            phd
$07:9b17  de fc 2e      dec $2efc,x
$07:9b1a  b0 c2         bcs $9ade
$07:9b1c  ed 11 02      sbc $0211
$07:9b1f  f0 01         beq $9b22
$07:9b21  f5 12         sbc $12,x
$07:9b23  b0 33         bcs $9b58
$07:9b25  15 41         ora $41,x
$07:9b27  23 03         and $03,s
$07:9b29  f2 30         sbc ($30)
$07:9b2b  f3 a0         sbc ($a0,s),y
$07:9b2d  2f 31 e1 ee   and $eee131
$07:9b31  e0 f0 1e      cpx #$1ef0
$07:9b34  1f a4 f4 b3   ora $b3f4a4,x
$07:9b38  d2 0d         cmp ($0d)
$07:9b3a  04 cf         tsb $cf
$07:9b3c  00 ff         brk #$ff
$07:9b3e  a4 03         ldy $03
$07:9b40  e2 ec         sep #$ec
$07:9b42  5b            tcd
$07:9b43  5d d3 00      eor $00d3,x
$07:9b46  f5 b0         sbc $b0,x
$07:9b48  e0 2f e4      cpx #$e42f
$07:9b4b  1e 32 f4      asl $f432,x
$07:9b4e  32 24         and ($24)
$07:9b50  b0 23         bcs $9b75
$07:9b52  30 31         bmi $9b85
$07:9b54  02 3f         cop #$3f
$07:9b56  32 f1         and ($f1)
$07:9b58  20 a0 34      jsr $34a0
$07:9b5b  d3 1a         cmp ($1a,s),y
$07:9b5d  f1 d1         sbc ($d1),y
$07:9b5f  4d 03 e0      eor $e003
$07:9b62  a0 0c f1      ldy #$f10c
$07:9b65  b2 1f         lda ($1f)
$07:9b67  e5 cb         sbc $cb
$07:9b69  0a            asl a
$07:9b6a  e0 b4 d4      cpx #$d4b4
$07:9b6d  fe 12 c1      inc $c112,x
$07:9b70  1d 30 e2      ora $e230,x
$07:9b73  1d a0 be      ora $bea0,x
$07:9b76  dc 11 65      jml [$6511]
$07:9b79  c7 1f         cmp [$1f]
$07:9b7b  56 13         lsr $13,x
$07:9b7d  b4 10         ldy $10,x
$07:9b7f  e4 e1         cpx $e1
$07:9b81  ff 21 ff 0f   sbc $0fff21,x
$07:9b85  01 90         ora ($90,x)
$07:9b87  14 ee         trb $ee
$07:9b89  5f de 2e 03   eor $032ede,x
$07:9b8d  ed fb a4      sbc $a4fb
$07:9b90  20 f0 0f      jsr $0ff0
$07:9b93  11 f0         ora ($f0),y
$07:9b95  0f d4 f0 a4   ora $a4f0d4
$07:9b99  f3 de         sbc ($de,s),y
$07:9b9b  1f e3 c1 3f   ora $3fc1e3,x
$07:9b9f  f2 d2         sbc ($d2)
$07:9ba1  b0 fe         bcs $9ba1
$07:9ba3  f0 e0         beq $9b85
$07:9ba5  2e f4 02      rol $02f4
$07:9ba8  41 12         eor ($12,x)
$07:9baa  a4 d0         ldy $d0
$07:9bac  7c 14 c0      jmp ($c014,x)
$07:9baf  4b            phk
$07:9bb0  13 b2         ora ($b2,s),y
$07:9bb2  2c a0 21      bit $21a0
$07:9bb5  01 0f         ora ($0f,x)
$07:9bb7  11 b2         ora ($b2),y
$07:9bb9  ed 11 d0      sbc $d011
$07:9bbc  90 2a         bcc $9be8
$07:9bbe  11 e0         ora ($e0),y
$07:9bc0  3e 02 e0      rol $e002,x
$07:9bc3  30 ef         bmi $9bb4
$07:9bc5  94 fd         sty $fd,x
$07:9bc7  24 dd         bit $dd
$07:9bc9  01 b4         ora ($b4,x)
$07:9bcb  1e b5 bf      asl $bfb5,x
$07:9bce  a4 11         ldy $11
$07:9bd0  e3 d0         sbc $d0,s
$07:9bd2  2f 00 1f 02   and $021f00
$07:9bd6  f4 a4 00      pea $00a4
$07:9bd9  03 b3         ora $b3,s
$07:9bdb  ff 2f 4c 4f   sbc $4f4c2f,x
$07:9bdf  11 90         ora ($90),y
$07:9be1  64 2e         stz $2e
$07:9be3  00 3d         brk #$3d
$07:9be5  3e 1e 1b      rol $1b1e,x
$07:9be8  cd 94 a4      cmp $a494
$07:9beb  3d 5f 4e      and $4e5f,x
$07:9bee  d1 0e         cmp ($0e),y
$07:9bf0  11 5a         ora ($5a),y
$07:9bf2  90 55         bcc $9c49
$07:9bf4  24 2d         bit $2d
$07:9bf6  ec cd de      cpx $decd
$07:9bf9  ce ec 94      dec $94ec
$07:9bfc  1a            inc a
$07:9bfd  11 b2         ora ($b2),y
$07:9bff  32 e0         and ($e0)
$07:9c01  2f b3 f1 a4   and $a4f1b3
$07:9c05  f2 1f         sbc ($1f)
$07:9c07  04 ef         tsb $ef
$07:9c09  01 ff         ora ($ff,x)
$07:9c0b  12 1f         ora ($1f)
$07:9c0d  a0 34 21      ldy #$2134
$07:9c10  03 d2         ora $d2,s
$07:9c12  1f 03 01 10   ora $100103,x
$07:9c16  a0 f1 d1      ldy #$d1f1
$07:9c19  0e 14 00      asl $0014
$07:9c1c  31 e0         and ($e0),y
$07:9c1e  f0 94         beq $9bb4
$07:9c20  24 c4         bit $c4
$07:9c22  0d 3c e2      ora $e23c
$07:9c25  f0 e3         beq $9c0a
$07:9c27  f2 94         sbc ($94)
$07:9c29  e1 ee         sbc ($ee,x)
$07:9c2b  1d e0 4d      ora $4de0,x
$07:9c2e  11 0f         ora ($0f),y
$07:9c30  0f 84 d0 01   ora $01d084
$07:9c34  05 21         ora $21
$07:9c36  df 3d 1c 3e   cmp $3e1c3d,x
$07:9c3a  80 f1         bra $9c2d
$07:9c3c  21 11         and ($11,x)
$07:9c3e  de ff 3c      dec $3cff,x
$07:9c41  fd 2c 94      sbc $942c,x
$07:9c44  5c 11 0e 12   jml $120e11
$07:9c48  f2 11         sbc ($11)
$07:9c4a  e0 4c 94      cpx #$944c
$07:9c4d  03 d2         ora $d2,s
$07:9c4f  20 3c f3      jsr $f33c
$07:9c52  b0 7d         bcs $9cd1
$07:9c54  e1 90         sbc ($90,x)
$07:9c56  0f 10 ff f0   ora $f0ff10
$07:9c5a  e1 d0         sbc ($d0,x)
$07:9c5c  0d c0 74      ora $74c0
$07:9c5f  ba            tsx
$07:9c60  34 a7         bit $a7,x
$07:9c62  5c ac 7a e1   jml $e17aac
$07:9c66  56 94         lsr $94,x
$07:9c68  d1 3c         cmp ($3c),y
$07:9c6a  2e 0e 3e      rol $3e0e
$07:9c6d  1f 10 00 84   ora $840010,x
$07:9c71  e1 1c         sbc ($1c,x)
$07:9c73  f3 3c         sbc ($3c,s),y
$07:9c75  4f 0f 1f e5   eor $e51f0f
$07:9c79  80 31         bra $9cac
$07:9c7b  30 74         bmi $9cf1
$07:9c7d  24 1f         bit $1f
$07:9c7f  33 24         and ($24,s),y
$07:9c81  20 80 42      jsr $4280
$07:9c84  05 3d         ora $3d
$07:9c86  f5 04         sbc $04,x
$07:9c88  31 52         and ($52),y
$07:9c8a  02 94         cop #$94
$07:9c8c  2c 22 d4      bit $d422
$07:9c8f  1d 01 01      ora $0101,x
$07:9c92  e0 30 80      cpx #$8030
$07:9c95  25 3f         and $3f
$07:9c97  42 fe         wdm #$fe
$07:9c99  b2 1c         lda ($1c)
$07:9c9b  33 cb         and ($cb,s),y
$07:9c9d  84 f0         sty $f0
$07:9c9f  2f 0d 4f 02   and $024f0d
$07:9ca3  cf 2c 04 70   cmp $70042c
$07:9ca7  df 0a a5 db   cmp $dba50a,x
$07:9cab  ba            tsx
$07:9cac  90 ef         bcc $9c9d
$07:9cae  42 80         wdm #$80
$07:9cb0  01 1e         ora ($1e,x)
$07:9cb2  00 ce         brk #$ce
$07:9cb4  00 02         brk #$02
$07:9cb6  12 01         ora ($01)
$07:9cb8  74 00         stz $00,x
$07:9cba  f0 f0         beq $9cac
$07:9cbc  51 2c         eor ($2c),y
$07:9cbe  f3 ff         sbc ($ff,s),y
$07:9cc0  f5 84         sbc $84,x
$07:9cc2  f0 02         beq $9cc6
$07:9cc4  f0 3b         beq $9d01
$07:9cc6  e3 0f         sbc $0f,s
$07:9cc8  04 ef         tsb $ef
$07:9cca  80 2d         bra $9cf9
$07:9ccc  f2 0f         sbc ($0f)
$07:9cce  0c f1 ce      tsb $cef1
$07:9cd1  3f ff 80 ef   and $ef80ff,x
$07:9cd5  1d 0f e3      ora $e30f,x
$07:9cd8  2c 21 ee      bit $ee21
$07:9cdb  1f 70 b4 0e   ora $0eb470,x
$07:9cdf  56 40         lsr $40,x
$07:9ce1  f1 5e         sbc ($5e),y
$07:9ce3  f3 12         sbc ($12,s),y
$07:9ce5  70 62         bvs $9d49
$07:9ce7  e4 2e         cpx $2e
$07:9ce9  ff d1 3e 0f   sbc $0f3ed1,x
$07:9ced  fe 70 ec      inc $ec70,x
$07:9cf0  0f bb 4c f2   ora $f24cbb
$07:9cf4  dd 2f ce      cmp $ce2f,x
$07:9cf7  74 0f         stz $0f,x
$07:9cf9  2e 04 c0      rol $c004
$07:9cfc  3b            tsc
$07:9cfd  40            rti
$07:9cfe  ee 34 74      inc $7434
$07:9d01  c5 e1         cmp $e1
$07:9d03  fe 04 d3      inc $d304,x
$07:9d06  d0 05         bne $9d0d
$07:9d08  fd 70 22      sbc $2270,x
$07:9d0b  21 30         and ($30,x)
$07:9d0d  31 10         and ($10),y
$07:9d0f  3f 11 cd 70   and $70cd11,x
$07:9d13  4e 03 13      lsr $1303
$07:9d16  20 1e 11      jsr $111e
$07:9d19  00 11         brk #$11
$07:9d1b  64 ff         stz $ff
$07:9d1d  1d dd 42      ora $42dd,x
$07:9d20  f0 c1         beq $9ce3
$07:9d22  e4 e0         cpx $e0
$07:9d24  74 f0         stz $f0,x
$07:9d26  d2 1e         cmp ($1e)
$07:9d28  5c 04 f0 01   jml $01f004
$07:9d2c  0f 74 1e 20   ora $201e74
$07:9d30  2f f2 1e 11   and $111ef2
$07:9d34  d4 ec         pei ($ec)
$07:9d36  60            rts
$07:9d37  30 4c         bmi $9d85
$07:9d39  bc 24 0f      ldy $0f24,x
$07:9d3c  00 0f         brk #$0f
$07:9d3e  b2 60         lda ($60)
$07:9d40  f1 ff         sbc ($ff),y
$07:9d42  02 cc         cop #$cc
$07:9d44  02 fc         cop #$fc
$07:9d46  00 01         brk #$01
$07:9d48  60            rts
$07:9d49  0c f1 dc      tsb $dcf1
$07:9d4c  e1 0d         sbc ($0d,x)
$07:9d4e  ff 2f ce 60   sbc $60ce2f,x
$07:9d52  be 1e ff      ldx $ff1e,y
$07:9d55  22 fb 2d cf   jsl $cf2dfb
$07:9d59  6d 64 34      adc $3464
$07:9d5c  ef 4b 1b 52   sbc $521b4b
$07:9d60  0e 42 cf      asl $cf42
$07:9d63  64 0f         stz $0f
$07:9d65  0e 21 04      asl $0421
$07:9d68  ff d2 dd 30   sbc $30ddd2,x
$07:9d6c  60            rts
$07:9d6d  fe 32 02      inc $0232,x
$07:9d70  2d de ff      and $ffde
$07:9d73  11 33         ora ($33),y
$07:9d75  50 01         bvc $9d78
$07:9d77  0f cc ed 73   ora $73edcc
$07:9d7b  26 4d         rol $4d
$07:9d7d  09 60         ora #$60
$07:9d7f  01 1f         ora ($1f,x)
$07:9d81  21 11         and ($11,x)
$07:9d83  cc fd d0      cpy $d0fd
$07:9d86  12 60         ora ($60)
$07:9d88  1f 00 fe fe   ora $fefe00,x
$07:9d8c  f3 31         sbc ($31,s),y
$07:9d8e  44 23 40      mvp $40,$23
$07:9d91  22 61 f6 56   jsl $56f661
$07:9d95  4e f4 be      lsr $bef4
$07:9d98  e3 50         sbc $50,s
$07:9d9a  d5 1e         cmp $1e,x
$07:9d9c  2f ee c2 f0   and $f0c2ee
$07:9da0  53 e5         eor ($e5,s),y
$07:9da2  64 ee         stz $ee
$07:9da4  32 d0         and ($d0)
$07:9da6  1f 22 c2 0e   ora $0ec222,x
$07:9daa  2f 50 10 d1   and $d11050
$07:9dae  0d f3 ca      ora $caf3
$07:9db1  fd df da      sbc $dadf,x
$07:9db4  50 0d         bvc $9dc3
$07:9db6  cf df 0e b0   cmp $b00edf
$07:9dba  f1 0f         sbc ($0f),y
$07:9dbc  12 50         ora ($50)
$07:9dbe  d3 1e         cmp ($1e,s),y
$07:9dc0  5f e4 40 15   eor $1540e4,x
$07:9dc4  fe 4f 50      inc $504f,x
$07:9dc7  00 f2         brk #$f2
$07:9dc9  10 10         bpl $9ddb
$07:9dcb  d1 1c         cmp ($1c),y
$07:9dcd  1f e1 50 f1   ora $f150e1,x
$07:9dd1  2f 04 e2 2f   and $2fe204
$07:9dd5  14 23         trb $23
$07:9dd7  22 40 f6 e3   jsl $e3f640
$07:9ddb  30 26         bmi $9e03
$07:9ddd  b1 2f         lda ($2f),y
$07:9ddf  f3 f0         sbc ($f0,s),y
$07:9de1  54 00 e0      mvn $e0,$00
$07:9de4  00 0f         brk #$0f
$07:9de6  3e d4 fc      rol $fcd4,x
$07:9de9  30 40         bmi $9e2b
$07:9deb  dc 2e d0      jml [$d02e]
$07:9dee  ce 2f d2      dec $d22f
$07:9df1  0f 41 30 c5   ora $c53041
$07:9df5  6f f4 36 f6   adc $f636f4
$07:9df9  0c f1 da      tsb $daf1
$07:9dfc  40            rti
$07:9dfd  3f c4 de eb   and $ebdec4,x
$07:9e01  de 1c e2      dec $e21c,x
$07:9e04  ef 50 21 04   sbc $042150
$07:9e08  0e 23 02      asl $0223
$07:9e0b  20 03 11      jsr $1103
$07:9e0e  40            rti
$07:9e0f  55 f5         eor $f5,x
$07:9e11  41 51         eor ($51,x)
$07:9e13  12 32         ora ($32)
$07:9e15  02 10         cop #$10
$07:9e17  40            rti
$07:9e18  f1 0e         sbc ($0e),y
$07:9e1a  0f f1 0c f0   ora $f00cf1
$07:9e1e  b0 0f         bcs $9e2f
$07:9e20  34 03         bit $03,x
$07:9e22  ae f3 e0      ldx $e0f3
$07:9e25  12 c3         ora ($c3)
$07:9e27  0c f5 44      tsb $44f5
$07:9e2a  ef 20 d3 0e   sbc $0ed320
$07:9e2e  04 c1         tsb $c1
$07:9e30  1e 12 34      asl $3412,x
$07:9e33  ac 43 c2      ldy $c243
$07:9e36  1e 22 11      asl $1122,x
$07:9e39  e4 00         cpx $00
$07:9e3b  34 1d         bit $1d,x
$07:9e3d  4c 02 02      jmp $0202
$07:9e40  00 02         brk #$02
$07:9e42  00 f0         brk #$f0
$07:9e44  34 3e         bit $3e,x
$07:9e46  f2 ed         sbc ($ed)
$07:9e48  60            rts
$07:9e49  c4 df         cpy $df
$07:9e4b  2e 4f 30      rol $304f
$07:9e4e  52 33         eor ($33)
$07:9e50  e2 1c         sep #$1c
$07:9e52  0e ce 01      asl $01ce
$07:9e55  0e 34 1f      asl $1f34
$07:9e58  0e 3f 01      asl $013f
$07:9e5b  0e 01 ff      asl $ff01
$07:9e5e  12 34         ora ($34)
$07:9e60  fe 3f f0      inc $f03f,x
$07:9e63  2e f1 0f      rol $0ff1
$07:9e66  2e 3f 24      rol $243f
$07:9e69  0f 21 f0 3c   ora $3cf021
$07:9e6d  2d 2d f2      and $f22d
$07:9e70  1e 20 f6      asl $f620,x
$07:9e73  dd 1d 04      cmp $041d,x
$07:9e76  0c 17 f2      tsb $f217
$07:9e79  41 24         eor ($24,x)
$07:9e7b  f1 d2         sbc ($d2),y
$07:9e7d  10 f4         bpl $9e73
$07:9e7f  f4 b2 4d      pea $4db2
$07:9e82  f0 14         beq $9e98
$07:9e84  02 12         cop #$12
$07:9e86  00 e0         brk #$e0
$07:9e88  db            stp
$07:9e89  6a            ror a
$07:9e8a  16 f6         asl $f6,x
$07:9e8c  24 1f         bit $1f
$07:9e8e  e0 fe         cpx #$fe
$07:9e90  2e 12 0e      rol $0e12
$07:9e93  40            rti
$07:9e94  ef 14 f1 ff   sbc $fff114
$07:9e98  3a            dec a
$07:9e99  5c 3c 00 d6   jml $d6003c
$07:9e9d  ec 10 01      cpx $0110
$07:9ea0  0e 0d 0d      asl $0d0d
$07:9ea3  dc fe dd      jml [$ddfe]
$07:9ea6  2d 10 f1      and $f110
$07:9ea9  fb            xce
$07:9eaa  21 df         and ($df,x)
$07:9eac  11 21         ora ($21),y
$07:9eae  10 20         bpl $9ed0
$07:9eb0  04 41         tsb $41
$07:9eb2  0f 2d 01 1e   ora $1e012d
$07:9eb6  5e 4d 14      lsr $144d,x
$07:9eb9  14 e3         trb $e3
$07:9ebb  10 1f         bpl $9edc
$07:9ebd  10 d2         bpl $9e91
$07:9ebf  00 01         brk #$01
$07:9ec1  0f 00 63 b0   ora $b06300
$07:9ec5  0e e4 0f      asl $0fe4
$07:9ec8  10 03         bpl $9ecd
$07:9eca  0c 10 0f      tsb $0f10
$07:9ecd  d0 00         bne $9ecf
$07:9ecf  10 11         bpl $9ee2
$07:9ed1  10 00         bpl $9ed3
$07:9ed3  10 00         bpl $9ed5
$07:9ed5  00 00         brk #$00
$07:9ed7  3f 00 ef 0f   and $0fef00,x
$07:9edb  00 00         brk #$00
$07:9edd  00 0f         brk #$0f
$07:9edf  ef fe 00 00   sbc $0000fe
$07:9ee3  00 0d         brk #$0d
$07:9ee5  20 00 0f      jsr $0f00
$07:9ee8  12 01         ora ($01)
$07:9eea  0e 00 0e      asl $0e00
$07:9eed  00 00         brk #$00
$07:9eef  00 0f         brk #$0f
$07:9ef1  00 00         brk #$00
$07:9ef3  00 0f         brk #$0f
$07:9ef5  00 f0         brk #$f0
$07:9ef7  01 00         ora ($00,x)
$07:9ef9  20 00 f0      jsr $f000
$07:9efc  00 00         brk #$00
$07:9efe  00 00         brk #$00
$07:9f00  00 00         brk #$00
$07:9f02  00 00         brk #$00
$07:9f04  00 00         brk #$00
$07:9f06  0f 01 00 00   ora $000001
$07:9f0a  00 00         brk #$00
$07:9f0c  00 00         brk #$00
$07:9f0e  00 00         brk #$00
$07:9f10  00 00         brk #$00
$07:9f12  00 00         brk #$00
$07:9f14  00 00         brk #$00
$07:9f16  00 00         brk #$00
$07:9f18  00 00         brk #$00
$07:9f1a  00 00         brk #$00
$07:9f1c  00 00         brk #$00
$07:9f1e  00 00         brk #$00
$07:9f20  00 00         brk #$00
$07:9f22  00 00         brk #$00
$07:9f24  00 00         brk #$00
$07:9f26  00 00         brk #$00
$07:9f28  00 00         brk #$00
$07:9f2a  00 00         brk #$00
$07:9f2c  00 00         brk #$00
$07:9f2e  01 00         ora ($00,x)
$07:9f30  00 00         brk #$00
$07:9f32  00 00         brk #$00
$07:9f34  00 00         brk #$00
$07:9f36  00 e5         brk #$e5
$07:9f38  08            php
$07:9f39  02 00         cop #$00
$07:9f3b  00 00         brk #$00
$07:9f3d  00 00         brk #$00
$07:9f3f  00 00         brk #$00
$07:9f41  00 9a         brk #$9a
$07:9f43  2f d0 03 20   and $2003d0
$07:9f47  cc 55 ee      cpy $ee55
$07:9f4a  ff 96 f0 10   sbc $10f096,x
$07:9f4e  ef 54 bb 34   sbc $34bb54
$07:9f52  ec e2 aa      cpx $aae2
$07:9f55  0c f3 1e      tsb $1ef3
$07:9f58  f2 00         sbc ($00)
$07:9f5a  01 00         ora ($00,x)
$07:9f5c  ef aa 32 cc   sbc $cc32aa
$07:9f60  32 f0         and ($f0)
$07:9f62  20 00 00      jsr $0000
$07:9f65  0f 96 33 db   ora $db3396
$07:9f69  e1 11         sbc ($11,x)
$07:9f6b  10 ff         bpl $9f6c
$07:9f6d  0f cf a6 00   ora $00a6cf
$07:9f71  00 0e         brk #$0e
$07:9f73  e2 1b         sep #$1b
$07:9f75  ae 11 0f      ldx $0f11
$07:9f78  9a            txs
$07:9f79  21 fe         and ($fe,x)
$07:9f7b  32 ce         and ($ce)
$07:9f7d  22 1e 04 eb   jsl $eb041e
$07:9f81  a6 ee         ldx $ee
$07:9f83  44 cc 0f      mvp $0f,$cc
$07:9f86  02 33         cop #$33
$07:9f88  fe 10 96      inc $9610,x
$07:9f8b  b0 20         bcs $9fad
$07:9f8d  eb            xba
$07:9f8e  35 cb         and $cb,x
$07:9f90  dc df eb      jml [$ebdf]
$07:9f93  9a            txs
$07:9f94  24 c2         bit $c2
$07:9f96  49 c0         eor #$c0
$07:9f98  23 f1         and $f1,s
$07:9f9a  1e 60 86      asl $8660,x
$07:9f9d  cf 6f c2 63   cmp $63c26f
$07:9fa1  db            stp
$07:9fa2  bc 21 ce      ldy $ce21,x
$07:9fa5  96 04         stx $04,y
$07:9fa7  50 f0         bvc $9f99
$07:9fa9  d1 1f         cmp ($1f),y
$07:9fab  21 dc         and ($dc,x)
$07:9fad  56 96         lsr $96,x
$07:9faf  fc ce 0d      jsr ($0dce,x)
$07:9fb2  bf 10 00 e0   lda $e00010,x
$07:9fb6  23 ba         and $ba,s
$07:9fb8  fe 13 ef      inc $ef13,x
$07:9fbb  12 2e         ora ($2e)
$07:9fbd  c1 3e         cmp ($3e,x)
$07:9fbf  f2 a6         sbc ($a6)
$07:9fc1  2e 04 1d      rol $1d04
$07:9fc4  e0 f0         cpx #$f0
$07:9fc6  10 00         bpl $9fc8
$07:9fc8  0e a6 ee      asl $eea6
$07:9fcb  ff cf 42 11   sbc $1142cf,x
$07:9fcf  01 2b         ora ($2b,x)
$07:9fd1  f6 a6         inc $a6,x
$07:9fd3  e0 5e         cpx #$5e
$07:9fd5  22 cd 00 fe   jsl $fe00cd
$07:9fd9  ff fe 9a 33   sbc $339afe,x
$07:9fdd  eb            xba
$07:9fde  32 13         and ($13)
$07:9fe0  ed 41 d0      sbc $d041
$07:9fe3  0f 8a 34 ff   ora $ff348a
$07:9fe7  30 ef         bmi $9fd8
$07:9fe9  e1 1d         sbc ($1d,x)
$07:9feb  32 c0         and ($c0)
$07:9fed  86 d0         stx $d0
$07:9fef  03 6f         ora $6f,s
$07:9ff1  cf bd 32 43   cmp $4332bd
$07:9ff5  ee 9a 32      inc $329a
$07:9ff8  fd f2 2d      sbc $2df2,x
$07:9ffb  25 ba         and $ba
$07:9ffd  51 d4         eor ($d4),y
$07:9fff  96 1f         stx $1f,y
$07:a001  db            stp
$07:a002  11 e0         ora ($e0),y
$07:a004  ef 1e 02 fc   sbc $fc021e
$07:a008  96 e4         stx $e4,y
$07:a00a  52 21         eor ($21)
$07:a00c  24 fe         bit $fe
$07:a00e  0f 2f c1 9a   ora $9ac12f
$07:a012  fc 42 ff      jsr ($ff42,x)
$07:a015  03 42         ora $42,s
$07:a017  c9 e0         cmp #$e0
$07:a019  53 9a         eor ($9a,s),y
$07:a01b  f0 cb         beq $9fe8
$07:a01d  46 1f         lsr $1f
$07:a01f  c0 1d         cpy #$1d
$07:a021  12 df         ora ($df)
$07:a023  9a            txs
$07:a024  31 dd         and ($dd),y
$07:a026  14 0f         trb $0f
$07:a028  02 eb         cop #$eb
$07:a02a  55 c0         eor $c0,x
$07:a02c  96 3e         stx $3e,y
$07:a02e  f3 10         sbc ($10,s),y
$07:a030  2f ef ce 12   and $12ceef
$07:a034  2d 96 c1      and $c196
$07:a037  1e cc bf      asl $bfcc,x
$07:a03a  54 33 33      mvn $33,$33
$07:a03d  ff a6 00 0f   sbc $0f00a6,x
$07:a041  ff cd 21 00   sbc $0021cd,x
$07:a045  13 0f         ora ($0f,s),y
$07:a047  a6 db         ldx $db
$07:a049  ce 12 12      dec $1212
$07:a04c  21 21         and ($21,x)
$07:a04e  02 4e         cop #$4e
$07:a050  a2 f1         ldx #$f1
$07:a052  0a            asl a
$07:a053  c1 33         cmp ($33,x)
$07:a055  46 53         lsr $53
$07:a057  34 55         bit $55,x
$07:a059  a6 f1         ldx $f1
$07:a05b  2c e5 4d      bit $4de5
$07:a05e  c2 2f         rep #$2f
$07:a060  de 2f a6      dec $a62f,x
$07:a063  df ff 0d 14   cmp $140dff,x
$07:a067  de 00 21      dec $2100,x
$07:a06a  45 a2         eor $a2
$07:a06c  3e f1 22      rol $22f1,x
$07:a06f  33 33         and ($33,s),y
$07:a071  33 32         and ($32,s),y
$07:a073  12 8a         ora ($8a)
$07:a075  e0 5e         cpx #$5e
$07:a077  91 ed         sta ($ed),y
$07:a079  26 3b         rol $3b
$07:a07b  df 22 96 f0   cmp $f09622,x
$07:a07f  31 cc         and ($cc),y
$07:a081  ef 0f ff 22   sbc $22ff0f
$07:a085  12 aa         ora ($aa)
$07:a087  10 00         bpl $a089
$07:a089  00 fe         brk #$fe
$07:a08b  02 20         cop #$20
$07:a08d  2d b2 86      and $86b2
$07:a090  14 00         trb $00
$07:a092  35 65         and $65,x
$07:a094  55 cc         eor $cc,x
$07:a096  fa            plx
$07:a097  aa            tax
$07:a098  9a            txs
$07:a099  f0 f0         beq $a08b
$07:a09b  40            rti
$07:a09c  ee 14 c0      inc $c014
$07:a09f  2c 12 a6      bit $a612
$07:a0a2  0f 01 10 01   ora $011001
$07:a0a6  2e 06 0c      rol $0c06
$07:a0a9  f1 9a         sbc ($9a),y
$07:a0ab  51 ce         eor ($ce),y
$07:a0ad  4f c2 4d d1   eor $d14dc2
$07:a0b1  20 f0 a6      jsr $a6f0
$07:a0b4  f0 f0         beq $a0a6
$07:a0b6  1d e4 2f      ora $2fe4,x
$07:a0b9  0f e0 dc 96   ora $96dce0
$07:a0bd  2f e2 21 31   and $3121e2
$07:a0c1  ab            plb
$07:a0c2  26 4e         rol $4e
$07:a0c4  f4 a6 32      pea $32a6
$07:a0c7  13 50         ora ($50,s),y
$07:a0c9  de 21 f2      dec $f221,x
$07:a0cc  df 5e a6 cf   cmp $cfa65e,x
$07:a0d0  13 3f         ora ($3f,s),y
$07:a0d2  bf 51 cf 11   lda $11cf51,x
$07:a0d6  0e 96 ed      asl $ed96
$07:a0d9  a0 70         ldy #$70
$07:a0db  9d 56 dd      sta $dd56,x
$07:a0de  20 de a6      jsr $a6de
$07:a0e1  ff ff f0 02   sbc $02f0ff,x
$07:a0e5  1f 34 e0 3f   ora $3fe034,x
$07:a0e9  96 d7         stx $d7,y
$07:a0eb  5f ef 01 00   eor $0001ef,x
$07:a0ef  2e bf 1d      rol $1dbf
$07:a0f2  a6 d0         ldx $d0
$07:a0f4  62 bc f1      per $92b3
$07:a0f7  32 10         and ($10)
$07:a0f9  00 00         brk #$00
$07:a0fb  aa            tax
$07:a0fc  1f 11 d0 2e   ora $2ed011,x
$07:a100  11 fe         ora ($fe),y
$07:a102  11 a3         ora ($a3),y
$07:a104  b6 21         ldx $21,y
$07:a106  f0 0f         beq $a117
$07:a108  ff f0 12 0f   sbc $0f12f0,x
$07:a10c  40            rti
$07:a10d  b6 d2         ldx $d2,y
$07:a10f  3f e3 3f 10   and $103fe3,x
$07:a113  23 ed         and $ed,s
$07:a115  11 b2         ora ($b2),y
$07:a117  1f 02 44 33   ora $334402,x
$07:a11b  43 ed         eor $ed,s
$07:a11d  01 10         ora ($10,x)
$07:a11f  aa            tax
$07:a120  b3 50         lda ($50,s),y
$07:a122  d0 2f         bne $a153
$07:a124  df 10 10 00   cmp $001010,x
$07:a128  8a            txa
$07:a129  4f e0 fe 32   eor $32fee0
$07:a12d  ff e3 4f e0   sbc $e04fe3,x
$07:a131  7a            ply
$07:a132  ff 20 0d e5   sbc $e50d20,x
$07:a136  1c f4 33      trb $33f4
$07:a139  10 8a         bpl $a0c5
$07:a13b  01 00         ora ($00,x)
$07:a13d  ca            dex
$07:a13e  24 00         bit $00
$07:a140  31 20         and ($20),y
$07:a142  2f 96 df 3f   and $3fdf96
$07:a146  cd 0e bc      cmp $bc0e
$07:a149  cc cc e0      cpy $e0cc
$07:a14c  aa            tax
$07:a14d  0f 00 0f 01   ora $010f00
$07:a151  ff 0f 42 bf   sbc $bf420f,x
$07:a155  9a            txs
$07:a156  52 30         eor ($30)
$07:a158  c1 1f         cmp ($1f,x)
$07:a15a  12 e1         ora ($e1)
$07:a15c  1e 05 aa      asl $aa05,x
$07:a15f  fe 32 be      inc $be32,x
$07:a162  43 ed         eor $ed,s
$07:a164  12 1e         ora ($1e)
$07:a166  00 8a         brk #$8a
$07:a168  ce 0f f2      dec $f20f
$07:a16b  20 ef 2d      jsr $2def
$07:a16e  ff a7 86 71   sbc $7186a7,x
$07:a172  f2 55         sbc ($55)
$07:a174  24 6f         bit $6f
$07:a176  e6 5f         inc $5f
$07:a178  d2 8a         cmp ($8a)
$07:a17a  3f 0e 12 21   and $21120e,x
$07:a17e  f0 33         beq $a1b3
$07:a180  c0 1f         cpy #$1f
$07:a182  8a            txa
$07:a183  21 f3         and ($f3,x)
$07:a185  ed ed 13      sbc $13ed
$07:a188  1f 13 0f a6   ora $a60f13,x
$07:a18c  00 0f         brk #$0f
$07:a18e  ff dd 34 ef   sbc $ef34dd,x
$07:a192  00 1f         brk #$1f
$07:a194  8a            txa
$07:a195  b3 f1         lda ($f1,s),y
$07:a197  2d 42 ef      and $ef42
$07:a19a  0f 24 0f 96   ora $960f24
$07:a19e  33 35         and ($35,s),y
$07:a1a0  4f 15 0c ef   eor $ef0c15
$07:a1a4  ef fe 8a 22   sbc $228afe
$07:a1a8  ee 00 fe      inc $fe00
$07:a1ab  12 e0         ora ($e0)
$07:a1ad  41 af         eor ($af,x)
$07:a1af  8a            txa
$07:a1b0  3f e2 fd 33   and $33fde2,x
$07:a1b4  d0 21         bne $a1d7
$07:a1b6  3c b4 a6      bit $a6b4,x
$07:a1b9  10 00         bpl $a1bb
$07:a1bb  f0 ed         beq $a1aa
$07:a1bd  11 cf         ora ($cf),y
$07:a1bf  2f ef 9a 00   and $009aef
$07:a1c3  1f d1 2f e0   ora $e02fd1,x
$07:a1c7  2e f3 f4      rol $f4f3
$07:a1ca  aa            tax
$07:a1cb  4d c1 1e      eor $1ec1
$07:a1ce  13 df         ora ($df,s),y
$07:a1d0  5f d3 3c 96   eor $963cd3,x
$07:a1d4  b0 0d         bcs $a1e3
$07:a1d6  cd dd de      cmp $dedd
$07:a1d9  ff f1 23 96   sbc $9623f1,x
$07:a1dd  10 12         bpl $a1f1
$07:a1df  0e 03 31      asl $3103
$07:a1e2  10 fd         bpl $a1e1
$07:a1e4  d5 a6         cmp $a6,x
$07:a1e6  fb            xce
$07:a1e7  12 ee         ora ($ee)
$07:a1e9  02 34         cop #$34
$07:a1eb  30 ff         bmi $a1ec
$07:a1ed  11 a6         ora ($a6),y
$07:a1ef  01 1d         ora ($1d,x)
$07:a1f1  04 20         tsb $20
$07:a1f3  1f ee ed d0   ora $d0edee,x
$07:a1f7  96 fa         stx $fa,y
$07:a1f9  9c 41 b0      stz $b041
$07:a1fc  22 20 f0 00   jsl $00f020
$07:a200  96 23         stx $23,y
$07:a202  34 33         bit $33,x
$07:a204  20 04 1d      jsr $1d04
$07:a207  13 fe         ora ($fe,s),y
$07:a209  9a            txs
$07:a20a  fe 54 b1      inc $b154,x
$07:a20d  1c 12 ef      trb $ef12
$07:a210  2f e4 a6 0e   and $0ea6e4
$07:a214  45 cb         eor $cb
$07:a216  35 20         and $20,x
$07:a218  20 e2 41      jsr $41e2
$07:a21b  aa            tax
$07:a21c  e3 1e         sbc $1e,s
$07:a21e  1f e2 10 0e   ora $0e10e2,x
$07:a222  04 cb         tsb $cb
$07:a224  a6 c1         ldx $c1
$07:a226  00 11         brk #$11
$07:a228  00 00         brk #$00
$07:a22a  11 11         ora ($11),y
$07:a22c  11 8a         ora ($8a),y
$07:a22e  1f df 31 f1   ora $f131df,x
$07:a232  2f c0 21 c1   and $c121c0
$07:a236  a6 42         ldx $42
$07:a238  dd ff 00      cmp $00ff,x
$07:a23b  00 00         brk #$00
$07:a23d  11 01         ora ($01),y
$07:a23f  96 41         stx $41,y
$07:a241  13 31         ora ($31,s),y
$07:a243  00 12         brk #$12
$07:a245  ec 00 f0      cpx $f000
$07:a248  b6 00         ldx $00,y
$07:a24a  11 10         ora ($10),y
$07:a24c  00 00         brk #$00
$07:a24e  ff fc d2 a6   sbc $a6d2fc,x
$07:a252  3b            tsc
$07:a253  c1 f2         cmp ($f2,x)
$07:a255  2f ee f1 10   and $10f1ee
$07:a259  11 a6         ora ($a6),y
$07:a25b  11 11         ora ($11),y
$07:a25d  22 11 21 24   jsl $242111
$07:a261  1d 12 96      ora $9612,x
$07:a264  be 34 1d      ldx $1d34,y
$07:a267  ef ff ff ef   sbc $efffff
$07:a26b  0f a6 ff ff   ora $ffffa6
$07:a26f  fc e1 ff      jsr ($ffe1,x)
$07:a272  10 12         bpl $a286
$07:a274  ed a6 fe      sbc $fea6
$07:a277  11 d0         ora ($d0),y
$07:a279  4f c2 20 32   eor $3220c2
$07:a27d  13 a6         ora ($a6,s),y
$07:a27f  75 ec         adc $ec,x
$07:a281  12 f0         ora ($f0)
$07:a283  2d d0 13      and $13d0
$07:a286  1c 96 c2      trb $c296
$07:a289  11 da         ora ($da),y
$07:a28b  e2 2d         sep #$2d
$07:a28d  b2 4e         lda ($4e)
$07:a28f  c0 a6         cpy #$a6
$07:a291  31 df         and ($df),y
$07:a293  1f ff 23 fe   ora $fe23ff,x
$07:a297  11 ff         ora ($ff),y
$07:a299  a2 dc         ldx #$dc
$07:a29b  dd bd 0e      cmp $0ebd,x
$07:a29e  f3 43         sbc ($43,s),y
$07:a2a0  db            stp
$07:a2a1  13 a6         ora ($a6,s),y
$07:a2a3  d5 7f         cmp $7f,x
$07:a2a5  03 0f         ora $0f,s
$07:a2a7  ee 00 ff      inc $ff00
$07:a2aa  f0 aa         beq $a256
$07:a2ac  0d 21 d0      ora $d021
$07:a2af  63 bc         adc $bc,s
$07:a2b1  02 1c         cop #$1c
$07:a2b3  e1 a6         sbc ($a6,x)
$07:a2b5  f1 11         sbc ($11),y
$07:a2b7  1f 33 f3 3d   ora $3df333,x
$07:a2bb  f4 1d b6      pea $b61d
$07:a2be  02 21         cop #$21
$07:a2c0  01 f1         ora ($f1,x)
$07:a2c2  1d f2 10      ora $10f2,x
$07:a2c5  fd aa 12      sbc $12aa,x
$07:a2c8  00 02         brk #$02
$07:a2ca  0e 0f 12      asl $120f
$07:a2cd  b1 2e         lda ($2e),y
$07:a2cf  9a            txs
$07:a2d0  40            rti
$07:a2d1  93 2e         sta ($2e,s),y
$07:a2d3  33 d2         and ($d2,s),y
$07:a2d5  29 05         and #$05
$07:a2d7  f0 7a         beq $a353
$07:a2d9  fd 13 34      sbc $3413,x
$07:a2dc  31 ff         and ($ff),y
$07:a2de  f0 3e         beq $a31e
$07:a2e0  d2 96         cmp ($96)
$07:a2e2  fe de 0e      inc $0ede,x
$07:a2e5  cd 37 0e      cmp $0e37
$07:a2e8  fe ef 8a      inc $8aef,x
$07:a2eb  0e 02 10      asl $1002
$07:a2ee  f1 21         sbc ($21),y
$07:a2f0  01 1e         ora ($1e,x)
$07:a2f2  bd 9a 22      lda $229a,x
$07:a2f5  12 10         ora ($10)
$07:a2f7  1e 02 cf      asl $cf02,x
$07:a2fa  40            rti
$07:a2fb  e1 96         sbc ($96,x)
$07:a2fd  ed cb bc      sbc $bccb
$07:a300  bc db 03      ldy $03db,x
$07:a303  ec 14 96      cpx $9614
$07:a306  22 32 32 23   jsl $233232
$07:a30a  22 32 52 b2   jsl $b25232
$07:a30e  96 62         stx $62,y
$07:a310  0f ee df 1c   ora $1cdfee
$07:a314  91 4f         sta ($4f),y
$07:a316  f0 96         beq $a2ae
$07:a318  0f d1 3b 9e   ora $9e3bd1
$07:a31c  0f 12 13 3d   ora $3d1312
$07:a320  aa            tax
$07:a321  34 bd         bit $bd,x
$07:a323  51 d0         eor ($d0),y
$07:a325  01 1f         ora ($1f,x)
$07:a327  10 00         bpl $a329
$07:a329  a6 00         ldx $00
$07:a32b  01 2b         ora ($2b,x)
$07:a32d  a3 19         lda $19,s
$07:a32f  e6 4c         inc $4c
$07:a331  9c a6 02      stz $02a6
$07:a334  1f 0f f1 01   ora $01f10f,x
$07:a338  fe 44 ef      inc $ef44,x
$07:a33b  aa            tax
$07:a33c  4e f1 31      lsr $31f1
$07:a33f  ce 4f e2      dec $e24f
$07:a342  1e e4 92      asl $92e4,x
$07:a345  64 10         stz $10
$07:a347  12 32         ora ($32)
$07:a349  25 1a         and $1a
$07:a34b  de bc aa      dec $aabc,x
$07:a34e  2e 01 cc      rol $cc01
$07:a351  22 01 00 00   jsl $000001  ; -> Sub_00_0001
$07:a355  10 8a         bpl $a2e1
$07:a357  4e b1 ef      lsr $efb1
$07:a35a  1d f2 f2      ora $f2f2,x
$07:a35d  34 cc         bit $cc,x
$07:a35f  96 43         stx $43,y
$07:a361  bf 40 fd c2   lda $c2fd40,x
$07:a365  23 32         and $32,s
$07:a367  3f aa 11 e0   and $e011aa,x
$07:a36b  00 f0         brk #$f0
$07:a36d  1d f4 10      ora $10f4,x
$07:a370  0e b6 ff      asl $ffb6
$07:a373  ff ff 13 fc   sbc $fc13ff,x
$07:a377  f1 24         sbc ($24),y
$07:a379  2e a6 f5      rol $f5a6
$07:a37c  32 21         and ($21)
$07:a37e  00 00         brk #$00
$07:a380  d1 3e         cmp ($3e),y
$07:a382  03 9a         ora $9a,s
$07:a384  da            phx
$07:a385  e5 1e         sbc $1e
$07:a387  03 0b         ora $0b,s
$07:a389  d4 31         pei ($31)
$07:a38b  fd a6 ff      sbc $ffa6,x
$07:a38e  e0 30         cpx #$30
$07:a390  e0 02         cpx #$02
$07:a392  30 f2         bmi $a386
$07:a394  10 96         bpl $a32c
$07:a396  12 11         ora ($11)
$07:a398  45 4e         eor $4e
$07:a39a  e6 29         inc $29
$07:a39c  07 ea         ora [$ea]
$07:a39e  9a            txs
$07:a39f  5f ef f5 09   eor $09f5ef,x
$07:a3a3  27 cc         and [$cc]
$07:a3a5  3e 14 a6      rol $a614,x
$07:a3a8  20 f1 22      jsr $22f1
$07:a3ab  4f c3 42 10   eor $1042c3
$07:a3af  fd 96 b4      sbc $b496,x
$07:a3b2  4d df db      eor $dbdf
$07:a3b5  f1 46         sbc ($46),y
$07:a3b7  1a            inc a
$07:a3b8  e4 a6         cpx $a6
$07:a3ba  ed f0 00      sbc $00f0
$07:a3bd  11 f1         ora ($f1),y
$07:a3bf  10 23         bpl $a3e4
$07:a3c1  00 b6         brk #$b6
$07:a3c3  0e e3 41      asl $41e3
$07:a3c6  f1 10         sbc ($10),y
$07:a3c8  10 ff         bpl $a3c9
$07:a3ca  ee b6 ef      inc $efb6
$07:a3cd  21 ff         and ($ff,x)
$07:a3cf  ed 14 fe      sbc $fe14
$07:a3d2  ef 43 b6 ec   sbc $ecb643
$07:a3d6  e0 02         cpx #$02
$07:a3d8  43 fd         eor $fd,s
$07:a3da  e1 22         sbc ($22,x)
$07:a3dc  11 aa         ora ($aa),y
$07:a3de  ec 15 02      cpx $0215
$07:a3e1  1e df 12      asl $12df,x
$07:a3e4  01 0f         ora ($0f,x)
$07:a3e6  a6 ef         ldx $ef
$07:a3e8  ef 1f d2 4f   sbc $4fd21f
$07:a3ec  be 01 35      ldx $3501,y
$07:a3ef  ba            tsx
$07:a3f0  ed f2 2f      sbc $2ff2
$07:a3f3  02 ff         cop #$ff
$07:a3f5  f0 01         beq $a3f8
$07:a3f7  11 aa         ora ($aa),y
$07:a3f9  ee 01 fe      inc $fe01
$07:a3fc  14 ce         trb $ce
$07:a3fe  52 31         eor ($31)
$07:a400  cc aa e1      cpy $e1aa
$07:a403  10 b3         bpl $a3b8
$07:a405  60            rts
$07:a406  11 bf         ora ($bf),y
$07:a408  4b            phk
$07:a409  e1 aa         sbc ($aa,x)
$07:a40b  13 2a         ora ($2a,s),y
$07:a40d  b7 6c         lda [$6c],y
$07:a40f  f1 b0         sbc ($b0),y
$07:a411  6f d2 a6 1f   adc $1fa6d2
$07:a415  00 ff         brk #$ff
$07:a417  2f d1 33 1f   and $1f33d1
$07:a41b  42 b6         wdm #$b6
$07:a41d  ce 1e e0      dec $e01e
$07:a420  fe 02 20      inc $2002,x
$07:a423  12 01         ora ($01)
$07:a425  a6 21         ldx $21
$07:a427  ee ee df      inc $dfee
$07:a42a  30 c1         bmi $a3ed
$07:a42c  54 20 a6      mvn $a6,$20
$07:a42f  23 ec         and $ec,s
$07:a431  cd dd f1      cmp $f1dd
$07:a434  11 12         ora ($12),y
$07:a436  31 aa         and ($aa),y
$07:a438  d0 00         bne $a43a
$07:a43a  10 15         bpl $a451
$07:a43c  ca            dex
$07:a43d  75 dd         adc $dd,x
$07:a43f  e1 a6         sbc ($a6,x)
$07:a441  0e e1 ec      asl $ece1
$07:a444  04 2e         tsb $2e
$07:a446  de 0f f4      dec $f40f,x
$07:a449  aa            tax
$07:a44a  cb            wai
$07:a44b  22 10 f3 fb   jsl $fbf310
$07:a44f  11 33         ora ($33),y
$07:a451  fd a6 ce      sbc $cea6,x
$07:a454  22 21 01 0f   jsl $0f0121
$07:a458  01 0f         ora ($0f,x)
$07:a45a  df a6 01 ea   cmp $ea01a6,x
$07:a45e  25 a9         and $a9
$07:a460  f2 1e         sbc ($1e)
$07:a462  02 ee         cop #$ee
$07:a464  96 ff         stx $ff,y
$07:a466  01 11         ora ($11,x)
$07:a468  42 07         wdm #$07
$07:a46a  3f 30 04 9a   and $9a0430,x
$07:a46e  e3 2b         sbc $2b,s
$07:a470  d2 01         cmp ($01)
$07:a472  31 f1         and ($f1),y
$07:a474  0e 11 a6      asl $a611
$07:a477  f0 0b         beq $a484
$07:a479  c3 2d         cmp $2d,s
$07:a47b  e3 1a         sbc $1a,s
$07:a47d  a1 5d         lda ($5d,x)
$07:a47f  a6 a1         ldx $a1
$07:a481  31 01         and ($01),y
$07:a483  1f 12 32 11   ora $113212,x
$07:a487  10 9a         bpl $a423
$07:a489  22 ff 21 ef   jsl $ef21ff
$07:a48d  42 bb         wdm #$bb
$07:a48f  54 c3 a6      mvn $a6,$c3
$07:a492  32 0f         and ($0f)
$07:a494  ff fe f0 0f   sbc $0ff0fe,x
$07:a498  dc 24 96      jml [$9624]
$07:a49b  f9 ae 12      sbc $12ae,y
$07:a49e  21 ed         and ($ed,x)
$07:a4a0  33 ec         and ($ec,s),y
$07:a4a2  ed 9a c4      sbc $c49a
$07:a4a5  54 2d ef      mvn $ef,$2d
$07:a4a8  f0 fe         beq $a4a8
$07:a4aa  23 c2         and $c2,s
$07:a4ac  a6 11         ldx $11
$07:a4ae  43 ff         eor $ff,s
$07:a4b0  0e ed ce      asl $ceed
$07:a4b3  01 11         ora ($11,x)
$07:a4b5  96 2f         stx $2f,y
$07:a4b7  02 fa         cop #$fa
$07:a4b9  b2 1c         lda ($1c)
$07:a4bb  03 00         ora $00,s
$07:a4bd  dc a6 13      jml [$13a6]
$07:a4c0  21 12         and ($12,x)
$07:a4c2  10 01         bpl $a4c5
$07:a4c4  10 cc         bpl $a492
$07:a4c6  45 a6         eor $a6
$07:a4c8  fe ff f2      inc $f2ff,x
$07:a4cb  0b            phd
$07:a4cc  ce 11 f2      dec $f211
$07:a4cf  fe b6 01      inc $01b6,x
$07:a4d2  20 f1 22      jsr $22f1
$07:a4d5  fd 00 24      sbc $2400,x
$07:a4d8  ff a6 60 d0   sbc $d060a6,x
$07:a4dc  ff 0e c0 2b   sbc $2bc00e,x
$07:a4e0  14 bc         trb $bc
$07:a4e2  a6 43         ldx $43
$07:a4e4  1f ad 30 df   ora $df30ad,x
$07:a4e8  01 23         ora ($23,x)
$07:a4ea  1f aa f2 2c   ora $2cf2aa,x
$07:a4ee  e4 fd         cpx $fd
$07:a4f0  42 03         wdm #$03
$07:a4f2  fb            xce
$07:a4f3  32 a6         and ($a6)
$07:a4f5  ca            dex
$07:a4f6  ff e1 30 e0   sbc $e030e1,x
$07:a4fa  34 fb         bit $fb,x
$07:a4fc  f0 b2         beq $a4b0
$07:a4fe  ff ff f0 0f   sbc $0ff0ff,x
$07:a502  dd 13 ff      cmp $ff13,x
$07:a505  44 ba c2      mvp $c2,$ba
$07:a508  3f ef 11 10   and $1011ef,x
$07:a50c  0f e2 3e b6   ora $b63ee2
$07:a510  ee f2 11      inc $11f2
$07:a513  41 d2         eor ($d2,x)
$07:a515  30 fe         bmi $a515
$07:a517  00 a6         brk #$a6
$07:a519  ff 04 3d d1   sbc $d13d04,x
$07:a51d  30 20         bmi $a53f
$07:a51f  a1 1b         lda ($1b,x)
$07:a521  a6 cb         ldx $cb
$07:a523  f1 cd         sbc ($cd),y
$07:a525  23 10         and $10,s
$07:a527  23 20         and $20,s
$07:a529  02 aa         cop #$aa
$07:a52b  0e e1 3e      asl $3ee1
$07:a52e  e3 ee         sbc $ee,s
$07:a530  53 0e         eor ($0e,s),y
$07:a532  a2 a6         ldx #$a6
$07:a534  52 c1         eor ($c1)
$07:a536  2f ed f2 2f   and $2ff2ed
$07:a53a  df 0e a6 f2   cmp $f2a60e,x
$07:a53e  0c e1 13      tsb $13e1
$07:a541  ec 13 10      cpx $1013
$07:a544  11 a6         ora ($a6),y
$07:a546  0f 01 fe 00   ora $00fe01
$07:a54a  ff e2 51 be   sbc $be51e2,x
$07:a54e  a6 41         ldx $41
$07:a550  f1 03         sbc ($03),y
$07:a552  30 34         bmi $a588
$07:a554  ef 52 fd b6   sbc $b6fd52
$07:a558  f1 ec         sbc ($ec),y
$07:a55a  10 e3         bpl $a53f
$07:a55c  1c c0 1f      trb $1fc0
$07:a55f  00 a6         brk #$a6
$07:a561  13 fd         ora ($fd,s),y
$07:a563  46 db         lsr $db
$07:a565  fe 17 4e      inc $4e17,x
$07:a568  02 9a         cop #$9a
$07:a56a  5e a3 0b      lsr $0ba3,x
$07:a56d  34 0f         bit $0f,x
$07:a56f  c2 61         rep #$61
$07:a571  dd 9a e1      cmp $e19a,x
$07:a574  60            rts
$07:a575  9c 45 91      stz $9145
$07:a578  6a            ror a
$07:a579  e5 3e         sbc $3e
$07:a57b  9a            txs
$07:a57c  d3 2d         cmp ($2d,s),y
$07:a57e  dc d5 42      jml [$42d5]
$07:a581  1d 10 cf      ora $cf10,x
$07:a584  aa            tax
$07:a585  2f e2 32 dc   and $dc32e2
$07:a589  13 1f         ora ($1f,s),y
$07:a58b  fe f2 aa      inc $aaf2,x
$07:a58e  0f 32 d3 0b   ora $0bd332
$07:a592  20 f4 cb      jsr $cbf4
$07:a595  45 aa         eor $aa
$07:a597  fd f2 5f      sbc $5ff2,x
$07:a59a  bf 20 01 f1   lda $f10120,x
$07:a59e  20 a6 32      jsr $32a6
$07:a5a1  e0 3e         cpx #$3e
$07:a5a3  c0 21         cpy #$21
$07:a5a5  ec 22 ba      cpx $ba22
$07:a5a8  96 9b         stx $9b,y
$07:a5aa  01 de         ora ($de,x)
$07:a5ac  64 be         stz $be
$07:a5ae  1f 02 44 a6   ora $a64402,x
$07:a5b2  11 43         ora ($43),y
$07:a5b4  dd 13 2e      cmp $2e13,x
$07:a5b7  03 ff         ora $ff,s
$07:a5b9  20 8a c2      jsr $c28a
$07:a5bc  34 fe         bit $fe,x
$07:a5be  0c 10 06      tsb $0610
$07:a5c1  de 29 a6      dec $a629,x
$07:a5c4  f1 1f         sbc ($1f),y
$07:a5c6  e2 3e         sep #$3e
$07:a5c8  fe e5 3c      inc $3ce5,x
$07:a5cb  d1 96         cmp ($96),y
$07:a5cd  53 ff         eor ($ff,s),y
$07:a5cf  23 13         and $13,s
$07:a5d1  63 dd         adc $dd,s
$07:a5d3  f2 2a         sbc ($2a)
$07:a5d5  a2 e0         ldx #$e0
$07:a5d7  20 df 0e      jsr $0edf
$07:a5da  fe d0 0f      inc $0fd0,x
$07:a5dd  12 a6         ora ($a6)
$07:a5df  0f ef 20 e0   ora $e020ef
$07:a5e3  00 1e         brk #$1e
$07:a5e5  cf 31 a6 ae   cmp $aea631
$07:a5e9  1d e2 62      ora $62e2,x
$07:a5ec  e1 1e         sbc ($1e,x)
$07:a5ee  e0 2e         cpx #$2e
$07:a5f0  aa            tax
$07:a5f1  06 2b         asl $2b
$07:a5f3  a5 7a         lda $7a
$07:a5f5  e5 3b         sbc $3b
$07:a5f7  c5 3e         cmp $3e
$07:a5f9  96 c3         stx $c3,y
$07:a5fb  69 a3         adc #$a3
$07:a5fd  fa            plx
$07:a5fe  f2 fe         sbc ($fe)
$07:a600  ce fb a6      dec $a6fb
$07:a603  cf 41 f3 2d   cmp $2df341
$07:a607  df fd e1 22   cmp $22e1fd,x
$07:a60b  aa            tax
$07:a60c  ef 32 cd 32   sbc $32cd32
$07:a610  ef 21 1e c1   sbc $c11e21
$07:a614  9a            txs
$07:a615  50 f0         bvc $a607
$07:a617  22 e0 50 bf   jsl $bf50e0
$07:a61b  0f 31 96 ba   ora $ba9631
$07:a61f  04 f9         tsb $f9
$07:a621  c0 22         cpy #$22
$07:a623  fc fe d4      jsr ($d4fe,x)
$07:a626  9a            txs
$07:a627  1a            inc a
$07:a628  32 ff         and ($ff)
$07:a62a  c1 1e         cmp ($1e,x)
$07:a62c  f3 01         sbc ($01,s),y
$07:a62e  f0 aa         beq $a5da
$07:a630  2f c0 22 1c   and $1c22c0
$07:a634  03 ef         ora $ef,s
$07:a636  41 dd         eor ($dd,x)
$07:a638  9a            txs
$07:a639  63 ce         adc $ce,s
$07:a63b  46 eb         lsr $eb
$07:a63d  32 f1         and ($f1)
$07:a63f  df 2b a6 d0   cmp $d0a62b,x
$07:a643  20 bb 33      jsr $33bb
$07:a646  ee 13 1d      inc $1d13
$07:a649  f1 aa         sbc ($aa),y
$07:a64b  d0 01         bne $a64e
$07:a64d  20 d1 4e      jsr $4ed1
$07:a650  b2 4d         lda ($4d)
$07:a652  34 a6         bit $a6,x
$07:a654  fc 01 f0      jsr ($f001,x)
$07:a657  1f d0 44 0c   ora $0c44d0,x
$07:a65b  de aa e0      dec $e0aa,x
$07:a65e  41 c1         eor ($c1,x)
$07:a660  4d f2 e0      eor $e0f2
$07:a663  0f e1 a6 2f   ora $2fa6e1
$07:a667  03 ef         ora $ef,s
$07:a669  2d e2 20      and $20e2
$07:a66c  f3 51         sbc ($51,s),y
$07:a66e  9a            txs
$07:a66f  a1 14         lda ($14,x)
$07:a671  40            rti
$07:a672  c2 2e         rep #$2e
$07:a674  20 c4 3e      jsr $3ec4
$07:a677  9a            txs
$07:a678  4d a6 fa      eor $faa6
$07:a67b  34 35         bit $35,x
$07:a67d  d9 16 cc      cmp $cc16,y
$07:a680  9a            txs
$07:a681  df 51 d6 19   cmp $19d651,x
$07:a685  61 a0         adc ($a0,x)
$07:a687  d0 3d         bne $a6c6
$07:a689  aa            tax
$07:a68a  ef 23 0f f0   sbc $f00f23
$07:a68e  20 c0 42      jsr $42c0
$07:a691  ce a6 32      dec $32a6
$07:a694  cc ff 12      cpy $12ff
$07:a697  0f 22 0f 01   ora $010f22
$07:a69b  aa            tax
$07:a69c  0f 0d f4 3f   ora $3ff40d
$07:a6a0  f0 f0         beq $a692
$07:a6a2  f0 10         beq $a6b4
$07:a6a4  aa            tax
$07:a6a5  00 10         brk #$10
$07:a6a7  0e 13 1f      asl $1f13
$07:a6aa  fe 12 eb      inc $eb12,x
$07:a6ad  aa            tax
$07:a6ae  ff 15 4e e1   sbc $e14e15,x
$07:a6b2  01 fd         ora ($fd,x)
$07:a6b4  22 dd a6 d1   jsl $d1a6dd
$07:a6b8  10 2e         bpl $a6e8
$07:a6ba  d4 20         pei ($20)
$07:a6bc  44 1f cb      mvp $cb,$1f
$07:a6bf  a6 ff         ldx $ff
$07:a6c1  e0 0f         cpx #$0f
$07:a6c3  12 2f         ora ($2f)
$07:a6c5  e2 0c         sep #$0c
$07:a6c7  e3 a6         sbc $a6,s
$07:a6c9  30 fc         bmi $a6c7
$07:a6cb  b3 60         lda ($60,s),y
$07:a6cd  e0 24         cpx #$24
$07:a6cf  20 ff a6      jsr $a6ff
$07:a6d2  de 2f d1      dec $d12f,x
$07:a6d5  0f 55 00 21   ora $210055
$07:a6d9  11 a6         ora ($a6),y
$07:a6db  10 cc         bpl $a6a9
$07:a6dd  0d b1 40      ora $40b1
$07:a6e0  dc f4 51      jml [$51f4]
$07:a6e3  aa            tax
$07:a6e4  c3 5d         cmp $5d,s
$07:a6e6  df f0 2f 20   cmp $202ff0,x
$07:a6ea  c4 4c         cpy $4c
$07:a6ec  aa            tax
$07:a6ed  22 b0 ef 34   jsl $34efb0
$07:a6f1  bd 2f 23      lda $232f,x
$07:a6f4  1f aa ef 42   ora $42efaa,x
$07:a6f8  bf 10 00 01   lda $010010,x
$07:a6fc  01 11         ora ($11,x)
$07:a6fe  9a            txs
$07:a6ff  de 3b d6      dec $d63b,x
$07:a702  20 ff d1      jsr $d1ff
$07:a705  1c 32 a6      trb $a632
$07:a708  cd 1f e1      cmp $e11f
$07:a70b  11 23         ora ($23),y
$07:a70d  43 11         eor $11,s
$07:a70f  0f a6 10 ed   ora $ed10a6
$07:a713  e3 30         sbc $30,s
$07:a715  dd 01 00      cmp $0001,x
$07:a718  34 96         bit $96,x
$07:a71a  0f 3f f3 fe   ora $fef33f
$07:a71e  0c ae f0      tsb $f0ae
$07:a721  fe 9a ff      inc $ff9a,x
$07:a724  13 1e         ora ($1e,s),y
$07:a726  dc 44 cd      jml [$cd44]
$07:a729  21 fd         and ($fd,x)
$07:a72b  aa            tax
$07:a72c  14 2e         trb $2e
$07:a72e  e0 00         cpx #$00
$07:a730  10 ff         bpl $a731
$07:a732  01 1f         ora ($1f,x)
$07:a734  96 be         stx $be,y
$07:a736  31 04         and ($04),y
$07:a738  3c d0 fc      bit $fcd0,x
$07:a73b  d0 fe         bne $a73b
$07:a73d  9a            txs
$07:a73e  0b            phd
$07:a73f  56 ac         lsr $ac,x
$07:a741  34 00         bit $00,x
$07:a743  1c 10 a0      trb $a010
$07:a746  96 13         stx $13,y
$07:a748  2e df 0f      rol $0fdf
$07:a74b  cb            wai
$07:a74c  ef 00 16 96   sbc $961600
$07:a750  50 04         bvc $a756
$07:a752  42 0f         wdm #$0f
$07:a754  13 0b         ora ($0b,s),y
$07:a756  cb            wai
$07:a757  b1 9a         lda ($9a),y
$07:a759  dc 63 b3      jml [$b363]
$07:a75c  5b            tcd
$07:a75d  f0 13         beq $a772
$07:a75f  ef 1f 8a fd   sbc $fd8a1f
$07:a763  e3 41         sbc $41,s
$07:a765  d2 50         cmp ($50)
$07:a767  ce 42 e0      dec $e042
$07:a76a  9a            txs
$07:a76b  ff e0 11 00   sbc $0011e0,x
$07:a76f  ed 05 2a      sbc $2a05
$07:a772  c5 9a         cmp $9a
$07:a774  0c 14 2d      tsb $2d14
$07:a777  d5 3e         cmp $3e,x
$07:a779  01 cc         ora ($cc,x)
$07:a77b  2e aa 01      rol $01aa
$07:a77e  f0 31         beq $a7b1
$07:a780  f2 1d         sbc ($1d)
$07:a782  d1 2f         cmp ($2f),y
$07:a784  d0 a6         bne $a72c
$07:a786  23 eb         and $eb,s
$07:a788  03 0f         ora $0f,s
$07:a78a  ff 0e f5 2f   sbc $2ff50e,x
$07:a78e  a6 33         ldx $33
$07:a790  f1 32         sbc ($32),y
$07:a792  0f f1 22 10   ora $1022f1
$07:a796  ff 96 11 fd   sbc $fd1196,x
$07:a79a  f2 2f         sbc ($2f)
$07:a79c  cf 1e ee dd   cmp $ddee1e
$07:a7a0  86 99         stx $99
$07:a7a2  fe ad 44      inc $44ad,x
$07:a7a5  ec f4 74      cpx $74f4
$07:a7a8  00 9a         brk #$9a
$07:a7aa  02 2d         cop #$2d
$07:a7ac  13 cf         ora ($cf,s),y
$07:a7ae  10 0f         bpl $a7bf
$07:a7b0  00 00         brk #$00
$07:a7b2  86 12         stx $12
$07:a7b4  ff 0a d3 ec   sbc $ecd30a,x
$07:a7b8  26 30         rol $30
$07:a7ba  36 9a         rol $9a,x
$07:a7bc  fd f1 d3      sbc $d3f1,x
$07:a7bf  4e 05 2f      lsr $2f05
$07:a7c2  ee e3 9a      inc $9ae3
$07:a7c5  2f 0e e6 4b   and $4be60e
$07:a7c9  c4 49         cpy $49
$07:a7cb  e3 5f         sbc $5f,s
$07:a7cd  96 df         stx $df,y
$07:a7cf  2f df 34 fd   and $fd34df
$07:a7d3  f0 1f         beq $a7f4
$07:a7d5  02 96         cop #$96
$07:a7d7  0e f0 dd      asl $ddf0
$07:a7da  ff f0 00 34   sbc $3400f0,x
$07:a7de  cd a6 44      cmp $44a6
$07:a7e1  ff 32 ec 01   sbc $01ec32,x
$07:a7e5  01 f0         ora ($f0,x)
$07:a7e7  30 8a         bmi $a773
$07:a7e9  d6 2f         dec $2f,x
$07:a7eb  10 e0         bpl $a7cd
$07:a7ed  0c e4 3e      tsb $3ee4
$07:a7f0  ff a6 e2 5e   sbc $5ee2a6,x
$07:a7f4  bf 11 00 21   lda $210011,x
$07:a7f8  f2 30         sbc ($30)
$07:a7fa  8a            txa
$07:a7fb  04 c2         tsb $c2
$07:a7fd  10 0e         bpl $a80d
$07:a7ff  fe 1f 05      inc $051f,x
$07:a802  cb            wai
$07:a803  9a            txs
$07:a804  31 e3         and ($e3),y
$07:a806  5a            phy
$07:a807  b5 0f         lda $0f,x
$07:a809  20 0e a3      jsr $a30e
$07:a80c  96 41         stx $41,y
$07:a80e  ee e1 33      inc $33e1
$07:a811  fb            xce
$07:a812  05 31         ora $31
$07:a814  0f 97 ff 00   ora $00ff97
$07:a818  ff 54 bb 34   sbc $34bb54,x
$07:a81c  ec e2 a0      cpx $a0e2
$07:a81f  05 02         ora $02
$07:a821  00 00         brk #$00
$07:a823  00 00         brk #$00
$07:a825  00 00         brk #$00
$07:a827  00 00         brk #$00
$07:a829  96 0b         stx $0b,y
$07:a82b  34 00         bit $00,x
$07:a82d  f1 43         sbc ($43),y
$07:a82f  11 11         ora ($11),y
$07:a831  1f 96 23 f0   ora $f02396,x
$07:a835  1f 21 02 ff   ora $ff0221,x
$07:a839  0f 4f 96 e0   ora $e0964f
$07:a83d  f2 fc         sbc ($fc)
$07:a83f  ff 10 a2 40   sbc $40a210,x
$07:a843  0e 86 df      asl $df86
$07:a846  de f2 4e      dec $4ef2,x
$07:a849  ac 03 0c      ldy $0c03
$07:a84c  e0 96         cpx #$96
$07:a84e  11 1f         ora ($1f),y
$07:a850  0f 03 40 de   ora $de4003
$07:a854  ff 3b 92 d6   sbc $d6923b,x
$07:a858  24 11         bit $11
$07:a85a  40            rti
$07:a85b  f2 ed         sbc ($ed)
$07:a85d  e2 0c         sep #$0c
$07:a85f  a6 02         ldx $02
$07:a861  10 ce         bpl $a831
$07:a863  12 ff         ora ($ff)
$07:a865  01 0f         ora ($0f,x)
$07:a867  20 96 df      jsr $df96
$07:a86a  0f 56 fe ec   ora $ecfe56
$07:a86e  3e 34 54      rol $5434,x
$07:a871  96 df         stx $df,y
$07:a873  e2 21         sep #$21
$07:a875  0e df 46      asl $46df
$07:a878  3a            dec a
$07:a879  ab            plb
$07:a87a  aa            tax
$07:a87b  52 a0         eor ($a0)
$07:a87d  00 5e         brk #$5e
$07:a87f  b5 0d         lda $0d,x
$07:a881  f2 a1         sbc ($a1)
$07:a883  b6 40         ldx $40,y
$07:a885  fc 13 e2      jsr ($e213,x)
$07:a888  f1 0e         sbc ($0e),y
$07:a88a  00 21         brk #$21
$07:a88c  9a            txs
$07:a88d  db            stp
$07:a88e  16 fe         asl $fe,x
$07:a890  3f c5 f3 a5   and $a5f3c5,x
$07:a894  40            rti
$07:a895  96 5e         stx $5e,y
$07:a897  df 13 10 1f   cmp $1f1013,x
$07:a89b  11 f2         ora ($f2),y
$07:a89d  12 96         ora ($96)
$07:a89f  2f fd fa 12   and $12fafd
$07:a8a3  1c bc 0f      trb $0fbc
$07:a8a6  be a6 13      ldx $13a6,y
$07:a8a9  4d db c2      eor $c2db
$07:a8ac  12 1e         ora ($1e)
$07:a8ae  e1 01         sbc ($01,x)
$07:a8b0  86 d9         stx $d9
$07:a8b2  20 b3 10      jsr $10b3
$07:a8b5  1c b2 3b      trb $3bb2
$07:a8b8  e7 86         sbc [$86]
$07:a8ba  26 2a         rol $2a
$07:a8bc  23 43         and $43,s
$07:a8be  1f 20 25 23   ora $232520,x
$07:a8c2  86 df         stx $df
$07:a8c4  61 61         adc ($61,x)
$07:a8c6  d1 df         cmp ($df),y
$07:a8c8  00 3b         brk #$3b
$07:a8ca  34 96         bit $96,x
$07:a8cc  e3 00         sbc $00,s
$07:a8ce  5e bf 23      lsr $23bf,x
$07:a8d1  1d e1 0f      ora $0fe1,x
$07:a8d4  b6 0f         ldx $0f,y
$07:a8d6  e0 00         cpx #$00
$07:a8d8  20 fc 04      jsr $04fc
$07:a8db  e2 de         sep #$de
$07:a8dd  96 62         stx $62,y
$07:a8df  0e 4f be      asl $be4f
$07:a8e2  22 2f c2 f5   jsl $f5c22f
$07:a8e6  a6 0e         ldx $0e
$07:a8e8  0f 22 11 0e   ora $0e1122
$07:a8ec  e1 2f         sbc ($2f,x)
$07:a8ee  52 96         eor ($96)
$07:a8f0  e1 d5         sbc ($d5,x)
$07:a8f2  53 f0         eor ($f0,s),y
$07:a8f4  20 f2 21      jsr $21f2
$07:a8f7  2d 96 22      and $2296
$07:a8fa  23 ee         and $ee,s
$07:a8fc  ed 32 f0      sbc $f032
$07:a8ff  c0 f2         cpy #$f2
$07:a901  96 4d         stx $4d,y
$07:a903  d0 02         bne $a907
$07:a905  ed f2 1e      sbc $1ef2
$07:a908  fd 30 a6      sbc $a630,x
$07:a90b  f0 c0         beq $a8cd
$07:a90d  0f 0f cf 31   ora $31cf0f
$07:a911  4d bd a6      eor $a6bd
$07:a914  00 04         brk #$04
$07:a916  3d ed f3      and $f3ed,x
$07:a919  e0 1f         cpx #$1f
$07:a91b  01 86         ora ($86,x)
$07:a91d  03 2c         ora $2c,s
$07:a91f  e1 55         sbc ($55,x)
$07:a921  2f 15 24 40   and $402415
$07:a925  a6 00         ldx $00
$07:a927  01 21         ora ($21,x)
$07:a929  01 fe         ora ($fe,x)
$07:a92b  e1 04         sbc ($04,x)
$07:a92d  3e 96 2d      rol $2d96,x
$07:a930  d2 30         cmp ($30)
$07:a932  fe c5 3f      inc $3fc5,x
$07:a935  cf 01 8a 2d   cmp $2d8a01
$07:a939  fd 31 4d      sbc $4d31,x
$07:a93c  b2 e4         lda ($e4)
$07:a93e  fd e4 96      sbc $96e4,x
$07:a941  43 fb         eor $fb,s
$07:a943  c1 f0         cmp ($f0,x)
$07:a945  40            rti
$07:a946  2e ff 34      rol $34ff
$07:a949  96 d1         stx $d1,y
$07:a94b  b1 30         lda ($30),y
$07:a94d  11 22         ora ($22),y
$07:a94f  ec 03 1f      cpx $1f03
$07:a952  9a            txs
$07:a953  d2 73         cmp ($73)
$07:a955  d9 1f 61      cmp $611f,y
$07:a958  f0 b2         beq $a90c
$07:a95a  4e a6 11      lsr $11a6
$07:a95d  0f 00 e2 3f   ora $3fe200
$07:a961  1e e1 10      asl $10e1,x
$07:a964  96 0f         stx $0f,y
$07:a966  cc 21 1e      cpy $1e21
$07:a969  0f f1 db fd   ora $fddbf1
$07:a96d  aa            tax
$07:a96e  1e e7 de      asl $dee7,x
$07:a971  19 64 af      ora $af64,y
$07:a974  11 00         ora ($00),y
$07:a976  a6 de         ldx $de
$07:a978  13 4f         ora ($4f,s),y
$07:a97a  fd f1 11      sbc $11f1,x
$07:a97d  0f 22 96 fe   ora $fe9622
$07:a981  00 30         brk #$30
$07:a983  22 33 3f e6   jsl $e63f33
$07:a987  52 86         eor ($86)
$07:a989  1d 13 10      ora $1013,x
$07:a98c  2f 46 ff 31   and $31ff46
$07:a990  21 86         and ($86,x)
$07:a992  f2 be         sbc ($be)
$07:a994  10 1d         bpl $a9b3
$07:a996  cd c4 1e      cmp $1ec4
$07:a999  1d 86 1f      ora $1f86,x
$07:a99c  cd ee b2      cmp $b2ee
$07:a99f  a9 4d         lda #$4d
$07:a9a1  7f 9d 96 c0   adc $c0969d,x
$07:a9a5  10 0e         bpl $a9b5
$07:a9a7  e1 3d         sbc ($3d,x)
$07:a9a9  ff e0 40 76   sbc $7640e0,x
$07:a9ad  0e c6 25      asl $25c6
$07:a9b0  ed 05 52      sbc $5205
$07:a9b3  fe 49 96      inc $9649,x
$07:a9b6  e1 12         sbc ($12,x)
$07:a9b8  30 1f         bmi $a9d9
$07:a9ba  21 e0         and ($e0,x)
$07:a9bc  f0 41         beq $a9ff
$07:a9be  96 f1         stx $f1,y
$07:a9c0  cc 60 3f      cpy $3f60
$07:a9c3  01 01         ora ($01,x)
$07:a9c5  00 fe         brk #$fe
$07:a9c7  9a            txs
$07:a9c8  23 fc         and $fc,s
$07:a9ca  02 25         cop #$25
$07:a9cc  bb            tyx
$07:a9cd  f5 21         sbc $21,x
$07:a9cf  cd 96 30      cmp $3096
$07:a9d2  d4 e3         pei ($e3)
$07:a9d4  6e 2e e0      ror $e02e
$07:a9d7  33 f1         and ($f1,s),y
$07:a9d9  a6 ff         ldx $ff
$07:a9db  22 f0 11 3d   jsl $3d11f0
$07:a9df  ad 46 db      lda $db46
$07:a9e2  a2 fe         ldx #$fe
$07:a9e4  db            stp
$07:a9e5  f4 43 de      pea $de43
$07:a9e8  cc 00 23      cpy $2300
$07:a9eb  aa            tax
$07:a9ec  e0 0f         cpx #$0f
$07:a9ee  34 b0         bit $b0,x
$07:a9f0  3f f1 d0 2f   and $2fd0f1,x
$07:a9f4  9a            txs
$07:a9f5  66 fa         ror $fa
$07:a9f7  c3 f2         cmp $f2,s
$07:a9f9  10 16         bpl $aa11
$07:a9fb  b3 ae         lda ($ae,s),y
$07:a9fd  aa            tax
$07:a9fe  3e 21 e2      rol $e221,x
$07:aa01  cf 4e 04 ee   cmp $ee044e
$07:aa05  b2 96         lda ($96)
$07:aa07  43 1c         eor $1c,s
$07:aa09  9d 11 fe      sta $fe11,x
$07:aa0c  cf 90 50 a6   cmp $a65090
$07:aa10  1e f0 f0      asl $f0f0,x
$07:aa13  d0 f1         bne $aa06
$07:aa15  40            rti
$07:aa16  e0 f0         cpx #$f0
$07:aa18  96 ec         stx $ec,y
$07:aa1a  03 7f         ora $7f,s
$07:aa1c  c2 10         rep #$10
$07:aa1e  ff 22 10 96   sbc $961022,x
$07:aa22  42 fa         wdm #$fa
$07:aa24  f7 5e         sbc [$5e],y
$07:aa26  fc d3 43      jsr ($43d3,x)
$07:aa29  2d a6 10      and $10a6
$07:aa2c  12 ef         ora ($ef)
$07:aa2e  31 31         and ($31),y
$07:aa30  e0 00 10      cpx #$1000
$07:aa33  86 24         stx $24
$07:aa35  32 0b         and ($0b)
$07:aa37  31 12         and ($12),y
$07:aa39  62 dc a1      per $4c18
$07:aa3c  96 5e         stx $5e,y
$07:aa3e  de b6 4f      dec $4fb6,x
$07:aa41  ee 24 1d      inc $1d24
$07:aa44  a1 86         lda ($86,x)
$07:aa46  15 2b         ora $2b,x
$07:aa48  bc fe 11      ldy $11fe,x
$07:aa4b  5f 1b e6 96   eor $96e61b,x
$07:aa4f  21 1b         and ($1b,x)
$07:aa51  0e f4 00      asl $00f4
$07:aa54  2d c4 3e      and $3ec4
$07:aa57  96 1c         stx $1c,y
$07:aa59  dd b4 45      cmp $45b4,x
$07:aa5c  dc 2d 11      jml [$112d]
$07:aa5f  90 a6         bcc $aa07
$07:aa61  ef 13 ed fd   sbc $fded13
$07:aa65  52 ed         eor ($ed)
$07:aa67  c1 24         cmp ($24,x)
$07:aa69  a6 0e         ldx $0e
$07:aa6b  de ed 40      dec $40ed,x
$07:aa6e  f0 20         beq $aa90
$07:aa70  03 2d         ora $2d,s
$07:aa72  a2 dd 12      ldx #$12dd
$07:aa75  ee 0f eb      inc $eb0f
$07:aa78  d1 f3         cmp ($f3),y
$07:aa7a  3f b2 00 f1   and $f100b2,x
$07:aa7e  11 01         ora ($01),y
$07:aa80  00 1e         brk #$1e
$07:aa82  ff 05 a6 f0   sbc $f0a605,x
$07:aa86  ba            tsx
$07:aa87  23 56         and $56,s
$07:aa89  f1 df         sbc ($df),y
$07:aa8b  0f 33 aa 1f   ora $1faa33
$07:aa8f  c0 2e 54      cpy #$542e
$07:aa92  b0 d0         bcs $aa64
$07:aa94  61 0f         adc ($0f,x)
$07:aa96  96 ef         stx $ef,y
$07:aa98  ed 34 22      sbc $2234
$07:aa9b  0c 0f bc      tsb $bc0f
$07:aa9e  1f a6 0f ec   ora $ec0fa6,x
$07:aaa2  00 35         brk #$35
$07:aaa4  ef cf 1e ff   sbc $ff1ecf
$07:aaa8  a6 0f         ldx $0f
$07:aaaa  1d fd 01      ora $01fd,x
$07:aaad  33 1e         and ($1e,s),y
$07:aaaf  b1 11         lda ($11),y
$07:aab1  9a            txs
$07:aab2  c0 41 c0      cpy #$c041
$07:aab5  e1 11         sbc ($11,x)
$07:aab7  ff d3 15 9a   sbc $9a15d3,x
$07:aabb  ff ea 21 53   sbc $5321ea,x
$07:aabf  be d1 33      ldx $33d1,y
$07:aac2  04 aa         tsb $aa
$07:aac4  d1 c3         cmp ($c3),y
$07:aac6  03 df         ora $df,s
$07:aac8  ed 35 f2      sbc $f235
$07:aacb  ce a6 eb      dec $eba6
$07:aace  31 20         and ($20),y
$07:aad0  b2 e2         lda ($e2)
$07:aad2  10 30         bpl $ab04
$07:aad4  21 9a         and ($9a,x)
$07:aad6  bd 13 5f      lda $5f13,x
$07:aad9  23 ab         and $ab,s
$07:aadb  02 44         cop #$44
$07:aadd  b6 a6         ldx $a6,y
$07:aadf  4d 4d e0      eor $e04d
$07:aae2  1f 42 10 df   ora $df1042,x
$07:aae6  13 a6         ora ($a6,s),y
$07:aae8  ec c1 54      cpx $54c1
$07:aaeb  3e c2 cd      rol $cdc2,x
$07:aaee  4d e1 a6      eor $a6e1
$07:aaf1  e5 50         sbc $50
$07:aaf3  ed d0 20      sbc $20d0
$07:aaf6  23 21         and $21,s
$07:aaf8  0e 9a 41      asl $419a
$07:aafb  3f fe 07 c0   and $c007fe,x
$07:aaff  30 19         bmi $ab1a
$07:ab01  d5 ba         cmp $ba,x
$07:ab03  f4 f0 ff      pea $fff0
$07:ab06  f0 21         beq $ab29
$07:ab08  ff f0 1d a6   sbc $a61df0,x
$07:ab0c  36 de         rol $de,x
$07:ab0e  90 6f         bcc $ab7f
$07:ab10  ef f1 00 1e   sbc $1e00f1
$07:ab14  96 11         stx $11,y
$07:ab16  f4 1e e1      pea $e11e
$07:ab19  f2 0f         sbc ($0f)
$07:ab1b  3e 21 a6      rol $a621,x
$07:ab1e  f2 0e         sbc ($0e)
$07:ab20  14 e0         trb $e0
$07:ab22  f1 2f         sbc ($2f),y
$07:ab24  52 e0         eor ($e0)
$07:ab26  96 b4         stx $b4,y
$07:ab28  63 21         adc $21,s
$07:ab2a  11 0d         ora ($0d),y
$07:ab2c  01 21         ora ($21,x)
$07:ab2e  d0 96         bne $aac6
$07:ab30  f2 20         sbc ($20)
$07:ab32  32 1d         and ($1d)
$07:ab34  ec 23 31      cpx $3123
$07:ab37  ed a6 e0      sbc $e0a6
$07:ab3a  ec 4d 1f      cpx $1f4d
$07:ab3d  c1 fd         cmp ($fd,x)
$07:ab3f  f3 0d         sbc ($0d,s),y
$07:ab41  a6 fe         ldx $fe
$07:ab43  f1 04         sbc ($04),y
$07:ab45  fd e0 02      sbc $02e0,x
$07:ab48  0e 22 8a      asl $8a22
$07:ab4b  df ef 13 ef   cmp $ef13ef,x
$07:ab4f  51 e1         eor ($e1),y
$07:ab51  1f 33 86 54   ora $548633,x
$07:ab55  40            rti
$07:ab56  40            rti
$07:ab57  12 0e         ora ($0e)
$07:ab59  50 d1         bvc $ab2c
$07:ab5b  d2 96         cmp ($96)
$07:ab5d  dc 12 30      jml [$3012]
$07:ab60  0d df 00      ora $00df
$07:ab63  ed fe 86      sbc $86fe
$07:ab66  b0 4c         bcs $abb4
$07:ab68  b9 e1 e1      lda $e1e1,y
$07:ab6b  cc fc d1      cpy $d1fc
$07:ab6e  86 21         stx $21
$07:ab70  0f af 02 53   ora $5302af
$07:ab74  ae d1 f0      ldx $f0d1
$07:ab77  9a            txs
$07:ab78  1f 3d 11 d1   ora $d1113d,x
$07:ab7c  fc 41 21      jsr ($2141,x)
$07:ab7f  e0 96 2d      cpx #$2d96
$07:ab82  ef 25 22 e1   sbc $e12225
$07:ab86  ff 21 20 9a   sbc $9a2021,x
$07:ab8a  1e f3 4f      asl $4ff3,x
$07:ab8d  fe 02 1d      inc $1d02,x
$07:ab90  21 f2         and ($f2,x)
$07:ab92  96 01         stx $01,y
$07:ab94  0f 0f 11 00   ora $00110f
$07:ab98  c1 3e         cmp ($3e,x)
$07:ab9a  1e 96 d0      asl $d096,x
$07:ab9d  25 2d         and $2d
$07:ab9f  c0 ee db      cpy #$dbee
$07:aba2  cd 33 a6      cmp $a633
$07:aba5  11 df         ora ($df),y
$07:aba7  e0 20 ef      cpx #$ef20
$07:abaa  f2 e2         sbc ($e2)
$07:abac  0e 96 ee      asl $ee96
$07:abaf  53 0f         eor ($0f,s),y
$07:abb1  52 02         eor ($02)
$07:abb3  e0 4d f2      cpx #$f24d
$07:abb6  9a            txs
$07:abb7  04 ec         tsb $ec
$07:abb9  2f 21 0e 30   and $300e21
$07:abbd  d0 02         bne $abc1
$07:abbf  b2 00         lda ($00)
$07:abc1  02 21         cop #$21
$07:abc3  eb            xba
$07:abc4  00 21         brk #$21
$07:abc6  0f cb 96 45   ora $4596cb
$07:abca  cf e0 00 21   cmp $2100e0
$07:abce  cb            wai
$07:abcf  13 1d         ora ($1d,s),y
$07:abd1  9a            txs
$07:abd2  03 6a         ora $6a,s
$07:abd4  c1 2e         cmp ($2e,x)
$07:abd6  50 de         bvc $abb6
$07:abd8  f4 32 96      pea $9632
$07:abdb  42 ff         wdm #$ff
$07:abdd  21 e4         and ($e4,x)
$07:abdf  12 30         ora ($30)
$07:abe1  62 de 9a      per $46c2
$07:abe4  25 ee         and $ee
$07:abe6  01 21         ora ($21,x)
$07:abe8  c0 31 c2      cpy #$c231
$07:abeb  d2 96         cmp ($96)
$07:abed  2d f0 4f      and $4ff0
$07:abf0  ee a1 20      inc $20a1
$07:abf3  0c fe 96      tsb $96fe
$07:abf6  b0 14         bcs $ac0c
$07:abf8  fe fe 20      inc $20fe,x
$07:abfb  0e 10 00      asl $0010
$07:abfe  96 fe         stx $fe,y
$07:ac00  00 35         brk #$35
$07:ac02  0f 21 41 03   ora $034121
$07:ac06  11 86         ora ($86),y
$07:ac08  e1 d0         sbc ($d0,x)
$07:ac0a  32 f4         and ($f4)
$07:ac0c  03 2c         ora $2c,s
$07:ac0e  20 23 96      jsr $9623
$07:ac11  f1 03         sbc ($03),y
$07:ac13  0e 0b 06      asl $060b
$07:ac16  fe 0e 10      inc $100e,x
$07:ac19  86 e2         stx $e2
$07:ac1b  df ee 20 db   cmp $db20ee,x
$07:ac1f  c0 e5 3b      cpy #$3be5
$07:ac22  86 d0         stx $d0
$07:ac24  4e 34 df      lsr $df34
$07:ac27  c1 f5         cmp ($f5,x)
$07:ac29  2f fc 96 10   and $1096fc
$07:ac2d  01 fe         ora ($fe,x)
$07:ac2f  0e 00 03      asl $0300
$07:ac32  31 0d         and ($0d),y
$07:ac34  86 45         stx $45
$07:ac36  be f3 51      ldx $51f3,y
$07:ac39  1d 23 21      ora $2123,x
$07:ac3c  cc 9a 2d      cpy $2d9a
$07:ac3f  10 e2         bpl $ac23
$07:ac41  00 0f         brk #$0f
$07:ac43  5a            phy
$07:ac44  00 b1         brk #$b1
$07:ac46  a6 10         ldx $10
$07:ac48  32 dd         and ($dd)
$07:ac4a  ad 12 ec      lda $ec12
$07:ac4d  51 02         eor ($02),y
$07:ac4f  96 cf         stx $cf,y
$07:ac51  ef ef 03 40   sbc $4003ef
$07:ac55  df 10 ff aa   cmp $aaff10,x
$07:ac59  31 e0         and ($e0),y
$07:ac5b  0f 00 01 20   ora $200100
$07:ac5f  f1 c3         sbc ($c3),y
$07:ac61  aa            tax
$07:ac62  2f 05 dd 20   and $20dd05
$07:ac66  10 00         bpl $ac68
$07:ac68  11 1e         ora ($1e),y
$07:ac6a  86 01         stx $01
$07:ac6c  c1 de         cmp ($de,x)
$07:ac6e  12 1d         ora ($1d)
$07:ac70  dc 37 9b      jml [$9b37]
$07:ac73  96 0f         stx $0f,y
$07:ac75  0f dc f3 0f   ora $0ff3dc
$07:ac79  ec d3 ff      cpx $ffd3
$07:ac7c  9a            txs
$07:ac7d  f1 3a         sbc ($3a),y
$07:ac7f  de 62 ef      dec $ef62,x
$07:ac82  11 b2         ora ($b2),y
$07:ac84  d0 96         bne $ac1c
$07:ac86  33 ef         and ($ef,s),y
$07:ac88  ef 01 33 3e   sbc $3e3301
$07:ac8c  df 23 86 52   cmp $528623,x
$07:ac90  d6 41         dec $41,x
$07:ac92  33 21         and ($21,s),y
$07:ac94  03 33         ora $33,s
$07:ac96  10 86         bpl $ac1e
$07:ac98  13 32         ora ($32,s),y
$07:ac9a  0f d0 10 ed   ora $ed10d0
$07:ac9e  bd 30 9a      lda $9a30,x
$07:aca1  e2 e0         sep #$e0
$07:aca3  f3 e1         sbc ($e1,s),y
$07:aca5  ec 25 3c      cpx $3c25
$07:aca8  cd 8a 23      cmp $238a
$07:acab  3e 0e 02      rol $020e,x
$07:acae  c2 ec         rep #$ec
$07:acb0  2f 21 8a b1   and $b18a21
$07:acb4  0f 2f d3 23   ora $23d32f
$07:acb8  be 21 f1      ldx $f121,y
$07:acbb  8a            txa
$07:acbc  04 0e         tsb $0e
$07:acbe  e1 33         sbc ($33,x)
$07:acc0  c3 e2         cmp $e2,s
$07:acc2  3e 4d 86      rol $864d,x
$07:acc5  fe 03 41      inc $4103,x
$07:acc8  ef 42 f5 0c   sbc $0cf542
$07:accc  fe 86 e1      inc $e186,x
$07:accf  ee ef fc      inc $fcef
$07:acd2  f7 1d         sbc [$1d],y
$07:acd4  bc 0e 96      ldy $960e,x
$07:acd7  00 f0         brk #$f0
$07:acd9  f0 df         beq $acba
$07:acdb  00 2b         brk #$2b
$07:acdd  21 00         and ($00,x)
$07:acdf  a6 ce         ldx $ce
$07:ace1  12 f0         ora ($f0)
$07:ace3  f0 11         beq $acf6
$07:ace5  01 30         ora ($30,x)
$07:ace7  00 aa         brk #$aa
$07:ace9  0e 32 d0      asl $d032
$07:acec  d5 3e         cmp $3e,x
$07:acee  ef f4 0f 86   sbc $860ff4
$07:acf2  1c 65 1a      trb $1a65
$07:acf5  45 b2         eor $b2
$07:acf7  61 3c         adc ($3c,x)
$07:acf9  cd 86 40      cmp $4086
$07:acfc  31 e5         and ($e5),y
$07:acfe  3b            tsc
$07:acff  dc a3 de      jml [$dea3]
$07:ad02  ee a6 f0      inc $f0a6
$07:ad05  ee 31 fe      inc $fe31
$07:ad08  cf 13 1e e0   cmp $e01e13
$07:ad0c  96 1f         stx $1f,y
$07:ad0e  dd 0d 0f      cmp $0f0d,x
$07:ad11  10 b2         bpl $acc5
$07:ad13  10 eb         bpl $ad00
$07:ad15  96 02         stx $02,y
$07:ad17  10 e3         bpl $acfc
$07:ad19  f1 1f         sbc ($1f),y
$07:ad1b  11 e2         ora ($e2),y
$07:ad1d  40            rti
$07:ad1e  a6 1f         ldx $1f
$07:ad20  f1 01         sbc ($01),y
$07:ad22  0f 21 ff 41   ora $41ff21
$07:ad26  f0 96         beq $acbe
$07:ad28  f4 02 1f      pea $1f02
$07:ad2b  30 ef         bmi $ad1c
$07:ad2d  ab            plb
$07:ad2e  30 50         bmi $ad80
$07:ad30  96 d3         stx $d3,y
$07:ad32  ff fc 76 fb   sbc $fb76fc,x
$07:ad36  df f6 fa a6   cmp $a6faf6,x
$07:ad3a  14 1e         trb $1e
$07:ad3c  ef 21 01 02   sbc $020121
$07:ad40  0e 00 96      asl $9600
$07:ad43  0e 56 51      asl $5156
$07:ad46  e0 13 23      cpx #$2313
$07:ad49  10 b3         bpl $acfe
$07:ad4b  9a            txs
$07:ad4c  1d 2c 24      ora $242c,x
$07:ad4f  ff 2f d1 21   sbc $21d12f,x
$07:ad53  5d a6 ef      eor $efa6,x
$07:ad56  00 fd         brk #$fd
$07:ad58  1f e2 0f fe   ora $fe0fe2,x
$07:ad5c  e6 a6         inc $a6
$07:ad5e  2e de 02      rol $02de
$07:ad61  4e cb 05      lsr $05cb
$07:ad64  0e de 9a      asl $9ade
$07:ad67  25 dc         and $dc
$07:ad69  01 2c         ora ($2c,x)
$07:ad6b  b4 6b         ldy $6b,x
$07:ad6d  f0 00         beq $ad6f
$07:ad6f  96 c0         stx $c0,y
$07:ad71  ef 1f f2 0f   sbc $0ff21f
$07:ad75  44 00 f4      mvp $f4,$00
$07:ad78  9a            txs
$07:ad79  b0 f0         bcs $ad6b
$07:ad7b  51 2b         eor ($2b),y
$07:ad7d  01 01         ora ($01,x)
$07:ad7f  1f 21 8a a6   ora $a68a21,x
$07:ad83  4c e3 31      jmp $31e3
$07:ad86  1e e5 21      asl $21e5,x
$07:ad89  1c 9a f2      trb $f29a
$07:ad8c  2e 2f 10      rol $102f
$07:ad8f  2d f0 e4      and $e4f0
$07:ad92  3f 96 df dd   and $dddf96,x
$07:ad96  ed ff fc      sbc $fcff
$07:ad99  cd 02 e5      cmp $e502
$07:ad9c  96 10         stx $10,y
$07:ad9e  eb            xba
$07:ad9f  10 00         bpl $ada1
$07:ada1  10 01         bpl $ada4
$07:ada3  00 00         brk #$00
$07:ada5  9a            txs
$07:ada6  f1 30         sbc ($30),y
$07:ada8  d0 f1         bne $ad9b
$07:adaa  4f f0 f0 2f   eor $2ff0f0
$07:adae  96 22         stx $22,y
$07:adb0  f1 1e         sbc ($1e),y
$07:adb2  22 02 ff ff   jsl $ffff02
$07:adb6  4f 97 e1 02   eor $02e197
$07:adba  fb            xce
$07:adbb  ff 10 b2 40   sbc $40b210,x
$07:adbf  0e 2e 0b      asl $0b2e
$07:adc2  02 00         cop #$00
$07:adc4  00 00         brk #$00
$07:adc6  00 00         brk #$00
$07:adc8  00 00         brk #$00
$07:adca  00 ba         brk #$ba
$07:adcc  e1 02         sbc ($02,x)
$07:adce  31 db         and ($db),y
$07:add0  d6 5e         dec $5e,x
$07:add2  b0 0f         bcs $ade3
$07:add4  ba            tsx
$07:add5  01 14         ora ($14,x)
$07:add7  3e 90 33      rol $3390,x
$07:adda  1f bb 46 a6   ora $a646bb,x
$07:adde  4f ff 04 40   eor $4004ff
$07:ade2  f0 eb         beq $adcf
$07:ade4  aa            tax
$07:ade5  b3 b2         lda ($b2,s),y
$07:ade7  e0 fe db      cpx #$dbfe
$07:adea  c2 50         rep #$50
$07:adec  df ff 25 ba   cmp $ba25ff,x
$07:adf0  ff 01 2f ed   sbc $ed2f01,x
$07:adf4  f0 1f         beq $ae15
$07:adf6  75 b9         adc $b9,x
$07:adf8  ba            tsx
$07:adf9  e6 6c         inc $6c
$07:adfb  a4 02         ldy $02
$07:adfd  2d d0 d0      and $d0d0
$07:ae00  66 b6         ror $b6
$07:ae02  4d d1 1f      eor $1fd1
$07:ae05  ff dc 05 63   sbc $6305dc,x
$07:ae09  f1 b6         sbc ($b6),y
$07:ae0b  2d b1 1f      and $1fb1
$07:ae0e  22 ff f0 11   jsl $11f0ff
$07:ae12  00 a6         brk #$a6
$07:ae14  fd bc dd      sbc $ddbc,x
$07:ae17  e3 3f         sbc $3f,s
$07:ae19  02 10         cop #$10
$07:ae1b  ee ba 4f      inc $4fba
$07:ae1e  b2 51         lda ($51)
$07:ae20  bc 43 10      ldy $1043,x
$07:ae23  fb            xce
$07:ae24  c3 b6         cmp $b6,s
$07:ae26  22 03 2f 0f   jsl $0f2f03
$07:ae2a  e0 fe dd      cpx #$ddfe
$07:ae2d  05 b6         ora $b6
$07:ae2f  40            rti
$07:ae30  0f dd e0 34   ora $34e0dd
$07:ae34  1f 24 0d b6   ora $b60d24,x
$07:ae38  02 21         cop #$21
$07:ae3a  0f f0 0f cd   ora $cd0ff0
$07:ae3e  34 fd         bit $fd,x
$07:ae40  c6 ef         dec $ef
$07:ae42  f0 33         beq $ae77
$07:ae44  0f ee 24 1e   ora $1e24ee
$07:ae48  de b6 f6      dec $f6b6,x
$07:ae4b  5d a1 66      eor $66a1,x
$07:ae4e  2a            rol a
$07:ae4f  90 32         bcc $ae83
$07:ae51  35 c6         and $c6,x
$07:ae53  1d c1 31      ora $31c1,x
$07:ae56  dc 04 2e      jml [$2e04]
$07:ae59  cf 32 c6 e0   cmp $e0c632
$07:ae5d  31 dc         and ($dc),y
$07:ae5f  03 41         ora $41,s
$07:ae61  ef 1d e2 b6   sbc $b6e21d
$07:ae65  5d c3 5e      eor $5ec3,x
$07:ae68  a1 62         lda ($62,x)
$07:ae6a  aa            tax
$07:ae6b  16 74         asl $74,x
$07:ae6d  ca            dex
$07:ae6e  de f3 32      dec $32f3,x
$07:ae71  fd df 23      sbc $23df,x
$07:ae74  10 00         bpl $ae76
$07:ae76  ca            dex
$07:ae77  ee e3 4f      inc $4fe3
$07:ae7a  df f2 41 ec   cmp $ec41f2,x
$07:ae7e  f0 ba         beq $ae3a
$07:ae80  61 f1         adc ($f1,x)
$07:ae82  20 1f db      jsr $db1f
$07:ae85  e5 6e         sbc $6e
$07:ae87  cf ba 10 53   cmp $5310ba
$07:ae8b  bb            tyx
$07:ae8c  f4 3f 01      pea $013f
$07:ae8f  f0 00         beq $ae91
$07:ae91  9a            txs
$07:ae92  de d0 ff      dec $ffd0,x
$07:ae95  12 33         ora ($33)
$07:ae97  0c de bc      tsb $bcde
$07:ae9a  ba            tsx
$07:ae9b  46 1b         lsr $1b
$07:ae9d  9f 12 61 90   sta $906112,x
$07:aea1  5f c2 c6 11   eor $11c6c2,x
$07:aea5  00 01         brk #$01
$07:aea7  10 ed         bpl $ae96
$07:aea9  e2 1e         sep #$1e
$07:aeab  02 a6         cop #$a6
$07:aead  fe fc bf      inc $bffc,x
$07:aeb0  41 d5         eor ($d5,x)
$07:aeb2  3b            tsc
$07:aeb3  32 e1         and ($e1)
$07:aeb5  ca            dex
$07:aeb6  00 10         brk #$10
$07:aeb8  10 ec         bpl $aea6
$07:aeba  14 20         trb $20
$07:aebc  fd d1 ca      sbc $cad1,x
$07:aebf  52 0d         eor ($0d)
$07:aec1  de 34 1d      dec $1d34,x
$07:aec4  df 32 f1 c6   cmp $c6f132,x
$07:aec8  32 fd         and ($fd)
$07:aeca  ce 23 0f      dec $0f23
$07:aecd  00 1f         brk #$1f
$07:aecf  f2 ca         sbc ($ca)
$07:aed1  fd 01 31      sbc $3101,x
$07:aed4  dd 04 3f      cmp $3f04,x
$07:aed7  ce 02 ca      dec $ca02
$07:aeda  32 ec         and ($ec)
$07:aedc  e3 30         sbc $30,s
$07:aede  f1 fd         sbc ($fd),y
$07:aee0  04 1e         tsb $1e
$07:aee2  ca            dex
$07:aee3  ef 00 23 1c   sbc $1c2300
$07:aee7  d1 42         cmp ($42),y
$07:aee9  dd 00 b6      cmp $b600,x
$07:aeec  02 23         cop #$23
$07:aeee  21 21         and ($21,x)
$07:aef0  10 ba         bpl $aeac
$07:aef2  23 f2         and $f2,s
$07:aef4  c6 1f         dec $1f
$07:aef6  ed f3 40      sbc $40f3
$07:aef9  ef 21 ee ef   sbc $efee21
$07:aefd  ca            dex
$07:aefe  12 0f         ora ($0f)
$07:af00  f1 01         sbc ($01),y
$07:af02  0d d1 42      ora $42d1
$07:af05  0f c6 fc e3   ora $e3fcc6
$07:af09  3f dd e2 42   and $42e2dd,x
$07:af0d  ff 0f ca 0f   sbc $0fca0f,x
$07:af11  02 40         cop #$40
$07:af13  dc f1 33      jml [$33f1]
$07:af16  1d cf b6      ora $b6cf,x
$07:af19  f5 63         sbc $63,x
$07:af1b  bb            tyx
$07:af1c  31 af         and ($af),y
$07:af1e  40            rti
$07:af1f  f3 43         sbc ($43,s),y
$07:af21  c6 1e         dec $1e
$07:af23  cd 22 f0      cmp $f022
$07:af26  20 01 fe      jsr $fe01
$07:af29  ef b6 13 0f   sbc $0f13b6
$07:af2d  fe 06 2d      inc $2d06,x
$07:af30  35 dd         and $dd,x
$07:af32  2e b6 d4      rol $d4b6
$07:af35  4e bf 23      lsr $23bf
$07:af38  33 30         and ($30,s),y
$07:af3a  a9 24 b6      lda #$b624
$07:af3d  fa            plx
$07:af3e  b3 5f         lda ($5f,s),y
$07:af40  24 fc         bit $fc
$07:af42  cf 10 12 ca   cmp $ca1210
$07:af46  e0 1f         cpx #$1f
$07:af48  f3 3e         sbc ($3e,s),y
$07:af4a  c0 11         cpy #$11
$07:af4c  2f df b6 f3   and $f3b6df
$07:af50  21 22         and ($22,x)
$07:af52  22 fc f1 ff   jsl $fff1fc
$07:af56  ff b6 01 0f   sbc $0f01b6,x
$07:af5a  00 0f         brk #$0f
$07:af5c  ee e0 44      inc $44e0
$07:af5f  fe ca 0f      inc $0fca,x
$07:af62  13 2e         ora ($2e,s),y
$07:af64  cf 31 e0 20   cmp $20e031
$07:af68  00 9a         brk #$9a
$07:af6a  eb            xba
$07:af6b  13 0e         ora ($0e,s),y
$07:af6d  e1 30         sbc ($30,x)
$07:af6f  ee 01 01      inc $0101
$07:af72  8a            txa
$07:af73  61 f1         adc ($f1,x)
$07:af75  bd 1b f1      lda $f11b,x
$07:af78  f1 00         sbc ($00),y
$07:af7a  d0 ba         bne $af36
$07:af7c  00 10         brk #$10
$07:af7e  00 00         brk #$00
$07:af80  10 ff         bpl $af81
$07:af82  ff 44 ba e9   sbc $e9ba44,x
$07:af86  d6 4f         dec $4f,x
$07:af88  f1 00         sbc ($00),y
$07:af8a  f0 f0         beq $af7c
$07:af8c  00 a6         brk #$a6
$07:af8e  de 01 0f      dec $0f01,x
$07:af91  fe dd df      inc $dfdd,x
$07:af94  34 0d         bit $0d,x
$07:af96  c6 f0         dec $f0
$07:af98  32 ee         and ($ee)
$07:af9a  24 2d         bit $2d
$07:af9c  c0 21         cpy #$21
$07:af9e  0f a6 13 11   ora $1113a6
$07:afa2  20 ff ef      jsr $efff
$07:afa5  01 00         ora ($00,x)
$07:afa7  fd 7a 11      sbc $117a,x
$07:afaa  e1 11         sbc ($11,x)
$07:afac  df 64 e3 13   cmp $13e364,x
$07:afb0  22 ba ff f1   jsl $f1ffba
$07:afb4  22 01 fc a0   jsl $a0fc01
$07:afb8  76 1c         ror $1c,x
$07:afba  b2 1a         lda ($1a)
$07:afbc  b1 2e         lda ($2e),y
$07:afbe  ce f0 33      dec $33f0
$07:afc1  21 11         and ($11,x)
$07:afc3  a6 ba         ldx $ba
$07:afc5  02 42         cop #$42
$07:afc7  ce 12 1f      dec $1f12
$07:afca  0f f0 a6 de   ora $dea6f0
$07:afce  12 52         ora ($52)
$07:afd0  dc e4 51      jml [$51e4]
$07:afd3  33 01         and ($01,s),y
$07:afd5  8a            txa
$07:afd6  4d 2f f0      eor $f02f
$07:afd9  01 1f         ora ($1f,x)
$07:afdb  01 10         ora ($10,x)
$07:afdd  dd 8a 14      cmp $148a,x
$07:afe0  0d 01 ff      ora $ff01
$07:afe3  0f 00 00 0f   ora $0f0000
$07:afe7  a6 00         ldx $00
$07:afe9  00 00         brk #$00
$07:afeb  12 32         ora ($32)
$07:afed  fa            plx
$07:afee  c4 5f         cpy $5f
$07:aff0  96 05         stx $05,y
$07:aff2  f0 30         beq $b024
$07:aff4  12 0f         ora ($0f)
$07:aff6  ff ff 00 86   sbc $8600ff,x
$07:affa  fe ef 0f      inc $0fef,x
$07:affd  ec de ec      cpx $ecde
$07:b000  d1 3c         cmp ($3c),y
$07:b002  ba            tsx
$07:b003  f1 42         sbc ($42),y
$07:b005  bb            tyx
$07:b006  06 1b         asl $1b
$07:b008  d4 61         pei ($61)
$07:b00a  ab            plb
$07:b00b  a6 d1         ldx $d1
$07:b00d  05 72         ora $72
$07:b00f  10 fe         bpl $b00f
$07:b011  f1 32         sbc ($32),y
$07:b013  0f b6 fe de   ora $defeb6
$07:b017  01 fe         ora ($fe,x)
$07:b019  e0 44         cpx #$44
$07:b01b  ec 04 a6      cpx $a604
$07:b01e  5f 34 f1 21   eor $21f134,x
$07:b022  21 fe         and ($fe,x)
$07:b024  ef fe 7a 37   sbc $377afe
$07:b028  ea            nop
$07:b029  03 00         ora $00,s
$07:b02b  e1 20         sbc ($20,x)
$07:b02d  b0 eb         bcs $b01a
$07:b02f  ba            tsx
$07:b030  00 f0         brk #$f0
$07:b032  23 1d         and $1d,s
$07:b034  ce 13 0d      dec $0d13
$07:b037  53 b6         eor ($b6,s),y
$07:b039  12 4e         ora ($4e)
$07:b03b  aa            tax
$07:b03c  f4 54 41      pea $4154
$07:b03f  a9 14 b6      lda #$b614
$07:b042  01 2c         ora ($2c,x)
$07:b044  d4 2d         pei ($2d)
$07:b046  01 df         ora ($df,x)
$07:b048  0f 01 b6 ec   ora $ecb601
$07:b04c  e6 70         inc $70
$07:b04e  bc 13 23      ldy $2313,x
$07:b051  4e a0 b6      lsr $b6a0
$07:b054  33 1b         and ($1b,s),y
$07:b056  a1 53         lda ($53,x)
$07:b058  0c e1 11      tsb $11e1
$07:b05b  2f b6 bd 22   and $22bdb6
$07:b05f  00 ef         brk #$ef
$07:b061  23 22         and $22,s
$07:b063  0e 00 a6      asl $a600
$07:b066  cc 0e ee      cpy $ee0e
$07:b069  f0 12         beq $b07d
$07:b06b  33 22         and ($22,s),y
$07:b06d  21 b6         and ($b6,x)
$07:b06f  00 23         brk #$23
$07:b071  0b            phd
$07:b072  af 45 1b c1   lda $c11b45
$07:b076  12 a6         ora ($a6)
$07:b078  74 bb         stz $bb,x
$07:b07a  11 ee         ora ($ee),y
$07:b07c  ee 03 2e      inc $2e03
$07:b07f  ab            plb
$07:b080  b6 23         ldx $23,y
$07:b082  0f 0f ff 01   ora $01ff0f
$07:b086  1f 0f e3 c6   ora $c6e30f,x
$07:b08a  42 fd         wdm #$fd
$07:b08c  e1 31         sbc ($31,x)
$07:b08e  dd 13 30      cmp $3013,x
$07:b091  cd c6 13      cmp $13c6
$07:b094  30 cc         bmi $b062
$07:b096  13 30         ora ($30,s),y
$07:b098  dc 02 22      jml [$2202]
$07:b09b  ca            dex
$07:b09c  fe f0 f3      inc $f3f0,x
$07:b09f  4f de f0 34   eor $34f0de
$07:b0a3  ed c6 de      sbc $dec6
$07:b0a6  14 2e         trb $2e
$07:b0a8  c0 33         cpy #$33
$07:b0aa  0d e0 f0      ora $f0e0
$07:b0ad  c6 00         dec $00
$07:b0af  12 11         ora ($11)
$07:b0b1  11 fc         ora ($fc),y
$07:b0b3  d1 21         cmp ($21),y
$07:b0b5  10 ba         bpl $b071
$07:b0b7  e1 0e         sbc ($0e,x)
$07:b0b9  f4 4e bf      pea $bf4e
$07:b0bc  34 eb         bit $eb,x
$07:b0be  32 a6         and ($a6)
$07:b0c0  ee bf 64      inc $64bf
$07:b0c3  11 24         ora ($24),y
$07:b0c5  20 12 22      jsr $2212
$07:b0c8  b6 0d         ldx $0d,y
$07:b0ca  df ff 02 1f   cmp $1f02ff,x
$07:b0ce  dd be 56      cmp $56be,x
$07:b0d1  b6 32         ldx $32,y
$07:b0d3  fe ee e0      inc $e0ee,x
$07:b0d6  fe 46 fe      inc $fe46,x
$07:b0d9  0f ca 02 1e   ora $1e02ca
$07:b0dd  f1 ff         sbc ($ff),y
$07:b0df  01 22         ora ($22,x)
$07:b0e1  0e cf ca      asl $cacf
$07:b0e4  42 00         wdm #$00
$07:b0e6  dd 24 1e      cmp $1e24,x
$07:b0e9  df 33 fd b6   cmp $b6fd33,x
$07:b0ed  ab            plb
$07:b0ee  36 fd         rol $fd,x
$07:b0f0  32 bf         and ($bf)
$07:b0f2  64 da         stz $da
$07:b0f4  c3 c6         cmp $c6,s
$07:b0f6  41 dc         eor ($dc,x)
$07:b0f8  03 41         ora $41,s
$07:b0fa  dd 13 1d      cmp $1d13,x
$07:b0fd  d1 ba         cmp ($ba),y
$07:b0ff  3a            dec a
$07:b100  f4 11 fb      pea $fb11
$07:b103  df 16 52 ea   cmp $ea5216,x
$07:b107  ba            tsx
$07:b108  b0 20         bcs $b12a
$07:b10a  63 ae         adc $ae,s
$07:b10c  6e a2 0f      ror $0fa2
$07:b10f  74 b6         stz $b6,x
$07:b111  5f ba e3 2c   eor $2ce3ba,x
$07:b115  06 5e         asl $5e
$07:b117  c0 fb         cpy #$fb
$07:b119  ca            dex
$07:b11a  11 21         ora ($21),y
$07:b11c  0f dd 25 0d   ora $0d25dd
$07:b120  d3 3f         cmp ($3f,s),y
$07:b122  b6 eb         ldx $eb,y
$07:b124  c2 5f         rep #$5f
$07:b126  c2 61         rep #$61
$07:b128  aa            tax
$07:b129  15 42         ora $42,x
$07:b12b  c6 00         dec $00
$07:b12d  1f ce 33 0e   ora $0e33ce,x
$07:b131  de 24 1d      dec $1d24,x
$07:b134  b2 c1         lda ($c1)
$07:b136  3f ed ae 43   and $43aeed,x
$07:b13a  ee 12 35      inc $3512
$07:b13d  a6 fe         ldx $fe
$07:b13f  0f ee de f0   ora $f0deee
$07:b143  12 0f         ora ($0f)
$07:b145  bb            tyx
$07:b146  b2 e3         lda ($e3)
$07:b148  11 32         ora ($32),y
$07:b14a  0e cb ce      asl $cecb
$07:b14d  ee f0 a6      inc $a6f0
$07:b150  00 56         brk #$56
$07:b152  10 2f         bpl $b183
$07:b154  dc b2 3c      jml [$3cb2]
$07:b157  d3 aa         cmp ($aa,s),y
$07:b159  2f ff cf 41   and $41cfff
$07:b15d  e0 00 fd      cpx #$fd00
$07:b160  14 a6         trb $a6
$07:b162  10 45         bpl $b1a9
$07:b164  fd de 12      sbc $12de,x
$07:b167  0f ff 00 aa   ora $aa00ff
$07:b16b  00 11         brk #$11
$07:b16d  00 10         brk #$10
$07:b16f  fc d2 65      jsr ($65d2,x)
$07:b172  ca            dex
$07:b173  aa            tax
$07:b174  14 21         trb $21
$07:b176  0c c3 4f      tsb $4fc3
$07:b179  f0 ee         beq $b169
$07:b17b  32 b6         and ($b6)
$07:b17d  fe 13 0e      inc $0e13,x
$07:b180  cf 44 f0 0f   cmp $0ff044
$07:b184  ee ba f1      inc $f1ba
$07:b187  54 ca e1      mvn $e1,$ca
$07:b18a  45 0a         eor $0a
$07:b18c  a3 53         lda $53,s
$07:b18e  ba            tsx
$07:b18f  1f ab 36 2f   ora $2f36ab,x
$07:b193  b0 30         bcs $b1c5
$07:b195  11 dc         ora ($dc),y
$07:b197  a6 13         ldx $13
$07:b199  ef fe 1d b6   sbc $b61dfe
$07:b19d  7c a1 61      jmp ($61a1,x)
$07:b1a0  ba            tsx
$07:b1a1  df 15 3c be   cmp $be3c15,x
$07:b1a5  27 3a         and [$3a]
$07:b1a7  a5 2f         lda $2f
$07:b1a9  b2 53         lda ($53)
$07:b1ab  de 21 02      dec $0221,x
$07:b1ae  31 01         and ($01),y
$07:b1b0  35 53         and $53,x
$07:b1b2  ba            tsx
$07:b1b3  02 20         cop #$20
$07:b1b5  db            stp
$07:b1b6  25 ff         and $ff
$07:b1b8  30 fe         bmi $b1b8
$07:b1ba  df b6 06 4e   cmp $4e06b6,x
$07:b1be  e0 fe ed      cpx #$edfe
$07:b1c1  06 5e         asl $5e
$07:b1c3  df ba 33 ca   cmp $ca33ba,x
$07:b1c7  16 4f         asl $4f,x
$07:b1c9  ab            plb
$07:b1ca  16 41         asl $41,x
$07:b1cc  da            phx
$07:b1cd  b2 de         lda ($de)
$07:b1cf  21 cc         and ($cc,x)
$07:b1d1  02 33         cop #$33
$07:b1d3  1f 13 21 b6   ora $b62113,x
$07:b1d7  de fe 01      dec $01fe,x
$07:b1da  25 3e         and $3e
$07:b1dc  be 33 0e      ldx $0e33,y
$07:b1df  c6 ef         dec $ef
$07:b1e1  23 1e         and $1e,s
$07:b1e3  df 23 0d e2   cmp $e20d23,x
$07:b1e7  30 b6         bmi $b19f
$07:b1e9  ab            plb
$07:b1ea  27 3d         and [$3d]
$07:b1ec  ac 16 60      ldy $6016
$07:b1ef  aa            tax
$07:b1f0  04 ca         tsb $ca
$07:b1f2  00 fe         brk #$fe
$07:b1f4  e2 31         sep #$31
$07:b1f6  ed f2 31      sbc $31f2
$07:b1f9  ff b6 ea a1   sbc $a1eab6,x
$07:b1fd  65 fa         adc $fa
$07:b1ff  c4 4d         cpy $4d
$07:b201  c3 62         cmp $62,s
$07:b203  ba            tsx
$07:b204  ad 66 1c      lda $1c66
$07:b207  bd 16 41      lda $4116,x
$07:b20a  ed ce b6      sbc $b6ce
$07:b20d  ae 25 3c      ldx $3c25
$07:b210  d3 20         cmp ($20,s),y
$07:b212  3f e2 db ca   and $cadbe2,x
$07:b216  32 0e         and ($0e)
$07:b218  df 33 0c e3   cmp $e30c33,x
$07:b21c  4f de b6 af   eor $afb6de
$07:b220  64 cc         stz $cc
$07:b222  26 5f         rol $5f
$07:b224  9b            txy
$07:b225  36 2c         rol $2c,x
$07:b227  ba            tsx
$07:b228  d4 72         pei ($72)
$07:b22a  cc d4 5b      cpy $5bd4
$07:b22d  a5 62         lda $62
$07:b22f  db            stp
$07:b230  b6 9c         ldx $9c,y
$07:b232  36 2d         rol $2d,x
$07:b234  ad 46 2c      lda $2c46
$07:b237  af 64 ba 9d   lda $9dba64
$07:b23b  66 e9         ror $e9
$07:b23d  d1 73         cmp ($73),y
$07:b23f  1e bc f2      asl $f2bc,x
$07:b242  ba            tsx
$07:b243  45 2c         eor $2c
$07:b245  9e 65 ca      stz $ca65,x
$07:b248  46 fb         lsr $fb
$07:b24a  c0 b6         cpy #$b6
$07:b24c  26 1d         rol $1d
$07:b24e  01 00         ora ($00,x)
$07:b250  dc f5 5f      jml [$5ff5]
$07:b253  be b6 43      ldx $43b6,y
$07:b256  d0 51         bne $b2a9
$07:b258  bb            tyx
$07:b259  03 54         ora $54,s
$07:b25b  0b            phd
$07:b25c  e2 a6         sep #$a6
$07:b25e  30 0f         bmi $b26f
$07:b260  ff 0f ba f0   sbc $f0ba0f,x
$07:b264  36 3a         rol $3a,x
$07:b266  ba            tsx
$07:b267  e5 6f         sbc $6f
$07:b269  ae 10 10      ldx $1010
$07:b26c  f6 1a         inc $1a,x
$07:b26e  b2 ba         lda ($ba)
$07:b270  63 0c         adc $0c,s
$07:b272  bd 55 20      lda $2055,x
$07:b275  ca            dex
$07:b276  f5 50         sbc $50,x
$07:b278  ba            tsx
$07:b279  d0 0b         bne $b286
$07:b27b  44 dc e3      mvp $e3,$dc
$07:b27e  63 ca         adc $ca,s
$07:b280  d6 ba         dec $ba,x
$07:b282  4d c6 2c      eor $2cc6
$07:b285  be 36 3f      ldx $3f36,y
$07:b288  bc 33 b6      ldy $b633,x
$07:b28b  de 42 cc      dec $cc42,x
$07:b28e  05 4e         ora $4e
$07:b290  ae 56 2d      ldx $2d56
$07:b293  ba            tsx
$07:b294  e4 5d         cpx $5d
$07:b296  bf 55 1c cc   lda $cc1c55,x
$07:b29a  04 52         tsb $52
$07:b29c  ba            tsx
$07:b29d  1d ce d1      ora $d1ce,x
$07:b2a0  64 0d         stz $0d
$07:b2a2  b3 3b         lda ($3b,s),y
$07:b2a4  c4 ca         cpy $ca
$07:b2a6  31 fd         and ($fd),y
$07:b2a8  e1 41         sbc ($41,x)
$07:b2aa  ee ff 23      inc $23ff
$07:b2ad  2e b6 fb      rol $fbb6
$07:b2b0  ae 55 ec      ldx $ec55
$07:b2b3  34 ea         bit $ea,x
$07:b2b5  e5 72         sbc $72
$07:b2b7  b6 b9         ldx $b9,y
$07:b2b9  e5 5e         sbc $5e
$07:b2bb  a0 33         ldy #$33
$07:b2bd  41 aa         eor ($aa,x)
$07:b2bf  16 b6         asl $b6,x
$07:b2c1  5f aa 05 50   eor $5005aa,x
$07:b2c5  ba            tsx
$07:b2c6  05 51         ora $51
$07:b2c8  db            stp
$07:b2c9  b6 f2         ldx $f2,y
$07:b2cb  12 2d         ora ($2d)
$07:b2cd  f4 1c bf      pea $bf1c
$07:b2d0  55 0b         eor $0b,x
$07:b2d2  ba            tsx
$07:b2d3  05 41         ora $41
$07:b2d5  db            stp
$07:b2d6  d3 60         cmp ($60,s),y
$07:b2d8  a2 5f         ldx #$5f
$07:b2da  bd b6 af      lda $afb6,x
$07:b2dd  54 01 41      mvn $41,$01
$07:b2e0  ed ad 47      sbc $47ad
$07:b2e3  2c b6 ae      bit $aeb6
$07:b2e6  45 0b         eor $0b
$07:b2e8  e4 51         cpx $51
$07:b2ea  ca            dex
$07:b2eb  f5 61         sbc $61,x
$07:b2ed  ca            dex
$07:b2ee  d0 32         bne $b322
$07:b2f0  fd f2 30      sbc $30f2,x
$07:b2f3  fd e1 32      sbc $32e1,x
$07:b2f6  ba            tsx
$07:b2f7  1e ae 21      asl $21ae,x
$07:b2fa  21 bf         and ($bf,x)
$07:b2fc  74 ca         stz $ca,x
$07:b2fe  d3 ca         cmp ($ca,s),y
$07:b300  31 fd         and ($fd),y
$07:b302  f3 1d         sbc ($1d,s),y
$07:b304  f3 20         sbc ($20,s),y
$07:b306  ee e2 b6      inc $b6e2
$07:b309  37 4f         and [$4f],y
$07:b30b  aa            tax
$07:b30c  16 4d         asl $4d,x
$07:b30e  a0 63         ldy #$63
$07:b310  c9 b6         cmp #$b6
$07:b312  e5 73         sbc $73
$07:b314  da            phx
$07:b315  b2 64         lda ($64)
$07:b317  da            phx
$07:b318  06 3c         asl $3c
$07:b31a  b6 af         ldx $af,y
$07:b31c  55 0b         eor $0b,x
$07:b31e  b0 55         bcs $b375
$07:b320  1b            tcs
$07:b321  b1 64         lda ($64),y
$07:b323  ba            tsx
$07:b324  cc e3 73      cpy $73e3
$07:b327  ca            dex
$07:b328  e2 34         sep #$34
$07:b32a  1d de b6      ora $b6de,x
$07:b32d  b1 53         lda ($53),y
$07:b32f  fb            xce
$07:b330  b1 55         lda ($55),y
$07:b332  0a            asl a
$07:b333  d4 40         pei ($40)
$07:b335  b6 dd         ldx $dd,y
$07:b337  ff 35 0a c3   sbc $c30a35,x
$07:b33b  64 fa         stz $fa
$07:b33d  a1 ba         lda ($ba,x)
$07:b33f  5f ac f7 5e   eor $5ef7ac,x
$07:b343  ad 06 4c      lda $4c06
$07:b346  e4 ba         cpx $ba
$07:b348  dd 00 16      cmp $1600,x
$07:b34b  1b            tcs
$07:b34c  c4 fe         cpy $fe
$07:b34e  5f c5 ba 2b   eor $2bbac5,x
$07:b352  b0 64         bcs $b3b8
$07:b354  2e ba 16      rol $16ba
$07:b357  41 ec         eor ($ec,x)
$07:b359  b6 cc         ldx $cc,y
$07:b35b  db            stp
$07:b35c  14 44         trb $44
$07:b35e  2d ad 34      and $34ad
$07:b361  10 ba         bpl $b31d
$07:b363  e1 3f         sbc ($3f,x)
$07:b365  cf 16 3d ad   cmp $ad3d16
$07:b369  36 0c         rol $0c,x
$07:b36b  ba            tsx
$07:b36c  31 dd         and ($dd),y
$07:b36e  f2 33         sbc ($33)
$07:b370  da            phx
$07:b371  45 1c         eor $1c
$07:b373  af ba 55 1f   lda $1f55ba
$07:b377  cb            wai
$07:b378  f4 5f 01      pea $015f
$07:b37b  ed 32 ba      sbc $ba32
$07:b37e  ec d4 71      cpx $71d4
$07:b381  bb            tyx
$07:b382  e2 64         sep #$64
$07:b384  fc be b6      jsr ($b6be,x)
$07:b387  d4 61         pei ($61)
$07:b389  cb            wai
$07:b38a  15 4f         ora $4f,x
$07:b38c  bc 25 40      ldy $4025,x
$07:b38f  ba            tsx
$07:b390  c0 40         cpy #$40
$07:b392  13 fc         ora ($fc,s),y
$07:b394  c2 34         rep #$34
$07:b396  0d d2 a6      ora $a6d2
$07:b399  20 ed af      jsr $afed
$07:b39c  73 ec         adc ($ec,s),y
$07:b39e  cf 23 1e ba   cmp $ba1e23
$07:b3a2  01 00         ora ($00,x)
$07:b3a4  21 ed         and ($ed,x)
$07:b3a6  f2 51         sbc ($51)
$07:b3a8  ab            plb
$07:b3a9  36 ba         rol $ba,x
$07:b3ab  3f 9b 66 1d   and $1d669b,x
$07:b3af  af 61 c2 1f   lda $1fc261
$07:b3b3  ba            tsx
$07:b3b4  00 e1         brk #$e1
$07:b3b6  1f 02 1e cf   ora $cf1e02,x
$07:b3ba  64 eb         stz $eb
$07:b3bc  b6 ac         ldx $ac,y
$07:b3be  36 31         rol $31,x
$07:b3c0  fc ad 46      jsr ($46ad,x)
$07:b3c3  1c c1 ba      trb $bac1
$07:b3c6  4e af 44      lsr $44af
$07:b3c9  0a            asl a
$07:b3ca  d4 41         pei ($41)
$07:b3cc  0e cd b6      asl $b6cd
$07:b3cf  a0 55 0a      ldy #$0a55
$07:b3d2  c2 54         rep #$54
$07:b3d4  fb            xce
$07:b3d5  13 fe         ora ($fe,s),y
$07:b3d7  ba            tsx
$07:b3d8  e0 62 ff      cpx #$ff62
$07:b3db  bd 15 50      lda $5015,x
$07:b3de  bb            tyx
$07:b3df  f5 b6         sbc $b6,x
$07:b3e1  64 eb         stz $eb
$07:b3e3  e4 50         cpx $50
$07:b3e5  cb            wai
$07:b3e6  e4 4e         cpx $4e
$07:b3e8  f3 ba         sbc ($ba,s),y
$07:b3ea  be 54 0d      ldx $0d54,y
$07:b3ed  ae 34 22      ldx $2234
$07:b3f0  1d 9c b6      ora $b69c,x
$07:b3f3  d4 63         pei ($63)
$07:b3f5  e9 b2 51      sbc #$51b2
$07:b3f8  03 1c         ora $1c,s
$07:b3fa  ac b6 46      ldy $46b6
$07:b3fd  2f ec c1 63   and $63c1ec
$07:b401  ce 55 fb      dec $fb55
$07:b404  ba            tsx
$07:b405  e5 61         sbc $61
$07:b407  bf 4e af 55   lda $55af4e,x
$07:b40b  2e 9c ba      rol $ba9c
$07:b40e  53 13         eor ($13,s),y
$07:b410  ea            nop
$07:b411  c4 72         cpy $72
$07:b413  da            phx
$07:b414  c2 73         rep #$73
$07:b416  b6 63         ldx $63,y
$07:b418  ea            nop
$07:b419  b2 3e         lda ($3e)
$07:b41b  14 31         trb $31
$07:b41d  fe dd b6      inc $b6dd,x
$07:b420  e0 ef 55      cpx #$55ef
$07:b423  ee 01 10      inc $1001
$07:b426  0f e0 ba 4d   ora $4dbae0
$07:b42a  c4 3c         cpy $3c
$07:b42c  a3 63         lda $63,s
$07:b42e  ea            nop
$07:b42f  c5 51         cmp $51
$07:b431  ba            tsx
$07:b432  db            stp
$07:b433  d3 61         cmp ($61,s),y
$07:b435  ef 10 cd 36   sbc $36cd10
$07:b439  0c ba d3      tsb $d3ba
$07:b43c  3d d0 33      and $33d0,x
$07:b43f  1d cf 34      ora $34cf,x
$07:b442  1b            tcs
$07:b443  ba            tsx
$07:b444  c4 30         cpy $30
$07:b446  2f ac 45 10   and $1045ac
$07:b44a  0f ee 9a 65   ora $659aee
$07:b44e  1b            tcs
$07:b44f  cf 23 21 01   cmp $012123
$07:b453  0f df b6 0e   ora $0eb6df
$07:b457  f2 44         sbc ($44)
$07:b459  2d c0 22      and $22c0
$07:b45c  1f f1 aa 2a   ora $2aaaf1,x
$07:b460  ce 46 5e      dec $5e46
$07:b463  ae 22 ee      ldx $ee22
$07:b466  31 ba         and ($ba),y
$07:b468  ef 24 0c c0   sbc $c00c24
$07:b46c  33 20         and ($20,s),y
$07:b46e  ed e1 aa      sbc $aae1
$07:b471  43 3f         eor $3f,s
$07:b473  ca            dex
$07:b474  04 43         tsb $43
$07:b476  fa            plx
$07:b477  d2 22         cmp ($22)
$07:b479  ba            tsx
$07:b47a  20 ee ef      jsr $efee
$07:b47d  36 1b         rol $1b,x
$07:b47f  cf 24 2e ba   cmp $ba2e24
$07:b483  dd 34 1f      cmp $1f34,x
$07:b486  ed d3 50      sbc $50d3
$07:b489  c0 20 ba      cpy #$ba20
$07:b48c  11 fd         ora ($fd),y
$07:b48e  d0 53         bne $b4e3
$07:b490  0e ef f0      asl $f0ef
$07:b493  23 aa         and $aa,s
$07:b495  0d de 0f      ora $0fde
$07:b498  04 7f         tsb $7f
$07:b49a  9b            txy
$07:b49b  f3 63         sbc ($63,s),y
$07:b49d  aa            tax
$07:b49e  fb            xce
$07:b49f  d0 12         bne $b4b3
$07:b4a1  21 1e         and ($1e,x)
$07:b4a3  cc 15 52      cpy $5215
$07:b4a6  ba            tsx
$07:b4a7  ff ed 03 10   sbc $1003ed,x
$07:b4ab  11 0d         ora ($0d),y
$07:b4ad  d0 43         bne $b4f2
$07:b4af  aa            tax
$07:b4b0  fc be 25      jsr ($25be,x)
$07:b4b3  3f bd 36 fb   and $fb36bd,x
$07:b4b7  c1 a2         cmp ($a2,x)
$07:b4b9  d5 70         cmp $70,x
$07:b4bb  cc e1 31      cpy $31e1
$07:b4be  da            phx
$07:b4bf  c0 33 a2      cpy #$a233
$07:b4c2  0c d2 54      tsb $54d2
$07:b4c5  30 cb         bmi $b492
$07:b4c7  bb            tyx
$07:b4c8  f4 1b a2      pea $a21b
$07:b4cb  c2 53         rep #$53
$07:b4cd  fc f4 51      jsr ($51f4,x)
$07:b4d0  f1 20         sbc ($20),y
$07:b4d2  ec b6 03      cpx $03b6
$07:b4d5  3f c1 40 cd   and $cd40c1,x
$07:b4d9  f2 43         sbc ($43)
$07:b4db  0e ba ef      asl $efba
$07:b4de  45 2c         eor $2c
$07:b4e0  be 43 fe      ldx $fe43,y
$07:b4e3  21 dd         and ($dd,x)
$07:b4e5  b6 f4         ldx $f4,y
$07:b4e7  2e e0 fe      rol $fee0
$07:b4ea  f3 43         sbc ($43,s),y
$07:b4ec  1f dd ba 32   ora $32badd,x
$07:b4f0  fe e2 41      inc $41e2,x
$07:b4f3  cd e3 42      cmp $42e3
$07:b4f6  dd b2 ef      cmp $efb2,x
$07:b4f9  23 0c         and $0c,s
$07:b4fb  e3 51         sbc $51,s
$07:b4fd  df 32 ec ba   cmp $baec32,x
$07:b501  43 fb         eor $fb,s
$07:b503  c1 53         cmp ($53,x)
$07:b505  0c d2 1e      tsb $1ed2
$07:b508  23 aa         and $aa,s
$07:b50a  1e ab f6      asl $f6ab,x
$07:b50d  62 ec df      per $94fc
$07:b510  13 1e         ora ($1e,s),y
$07:b512  a6 dd         ldx $dd
$07:b514  04 41         tsb $41
$07:b516  de 56 fa      dec $fa56,x
$07:b519  ad 01 ba      lda $ba01
$07:b51c  12 0d         ora ($0d)
$07:b51e  cf 43 1e de   cmp $de1e43
$07:b522  23 2f         and $2f,s
$07:b524  ba            tsx
$07:b525  cd 25 2e      cmp $2e25
$07:b528  ce 14 2f      dec $2f14
$07:b52b  de f1 ba      dec $baf1,x
$07:b52e  32 00         and ($00)
$07:b530  0e de 13      asl $13de
$07:b533  31 fc         and ($fc),y
$07:b535  f4 ba 0c      pea $0cba
$07:b538  f3 32         sbc ($32,s),y
$07:b53a  eb            xba
$07:b53b  e4 2e         cpx $2e
$07:b53d  f3 10         sbc ($10,s),y
$07:b53f  ba            tsx
$07:b540  dc 05 31      jml [$3105]
$07:b543  ed ee 14      sbc $14ee
$07:b546  30 ef         bmi $b537
$07:b548  ba            tsx
$07:b549  f0 0f         beq $b55a
$07:b54b  f0 32         beq $b57f
$07:b54d  1f ce 23 10   ora $1023ce,x
$07:b551  ba            tsx
$07:b552  fe ee 24      inc $24ee,x
$07:b555  30 ec         bmi $b543
$07:b557  e0 33 1f      cpx #$1f33
$07:b55a  ba            tsx
$07:b55b  de 13 1e      dec $1e13,x
$07:b55e  d1 40         cmp ($40),y
$07:b560  ce 34 1c      dec $1c34
$07:b563  aa            tax
$07:b564  af 74 0b cf   lda $cf0b74
$07:b568  55 2e         eor $2e,x
$07:b56a  bb            tyx
$07:b56b  d3 ba         cmp ($ba,s),y
$07:b56d  43 fc         eor $fc,s
$07:b56f  d3 40         cmp ($40,s),y
$07:b571  de f0 02      dec $02f0,x
$07:b574  42 ba         wdm #$ba
$07:b576  ec d0 43      cpx $43d0
$07:b579  fc e2 51      jsr ($51e2,x)
$07:b57c  dc e4 b6      jml [$b6e4]
$07:b57f  44 fc f2      mvp $f2,$fc
$07:b582  1e f1 22      asl $22f1,x
$07:b585  1e dd b6      asl $b6dd,x
$07:b588  14 30         trb $30
$07:b58a  dc e2 42      jml [$42e2]
$07:b58d  ee 22 db      inc $db22
$07:b590  ba            tsx
$07:b591  44 1f cc      mvp $cc,$1f
$07:b594  24 20         bit $20
$07:b596  dd f2 22      cmp $22f2,x
$07:b599  ba            tsx
$07:b59a  1f de f2 42   ora $42f2de,x
$07:b59e  fc df 44      jsr ($44df,x)
$07:b5a1  1d b6 ec      ora $ecb6,x
$07:b5a4  e2 41         sep #$41
$07:b5a6  ec d1 45      cpx $45d1
$07:b5a9  2e cc ba      rol $bacc
$07:b5ac  33 2f         and ($2f,s),y
$07:b5ae  dd 01 20      cmp $2001,x
$07:b5b1  f3 2f         sbc ($2f,s),y
$07:b5b3  dd ba e1      cmp $e1ba,x
$07:b5b6  53 0d         eor ($0d,s),y
$07:b5b8  de 34 fc      dec $fc34,x
$07:b5bb  e3 41         sbc $41,s
$07:b5bd  b6 2d         ldx $2d,y
$07:b5bf  c0 43 fb      cpy #$fb43
$07:b5c2  c1 53         cmp ($53,x)
$07:b5c4  fc c0 ba      jsr ($bac0,x)
$07:b5c7  40            rti
$07:b5c8  dd e1 43      cmp $43e1,x
$07:b5cb  0c df 43      tsb $43df
$07:b5ce  1c ba c0      trb $c0ba
$07:b5d1  53 0e         eor ($0e,s),y
$07:b5d3  dd 04 40      cmp $4004,x
$07:b5d6  ec f0 ba      cpx $baf0
$07:b5d9  31 12         and ($12),y
$07:b5db  fc d0 43      jsr ($43d0,x)
$07:b5de  1e ce 23      asl $23ce,x
$07:b5e1  ba            tsx
$07:b5e2  11 0f         ora ($0f),y
$07:b5e4  ed e4 42      sbc $42e4
$07:b5e7  ed df 14      sbc $14df
$07:b5ea  ba            tsx
$07:b5eb  21 ff         and ($ff,x)
$07:b5ed  ee ff 25      inc $25ff
$07:b5f0  3e cd f2      rol $f2cd,x
$07:b5f3  ba            tsx
$07:b5f4  42 ed         wdm #$ed
$07:b5f6  e1 42         sbc ($42,x)
$07:b5f8  ec e3 41      cpx $41e3
$07:b5fb  dc b6 c0      jml [$c0b6]
$07:b5fe  44 0c c0      mvp $c0,$0c
$07:b601  33 1d         and ($1d,s),y
$07:b603  c0 43 b6      cpy #$b643
$07:b606  fc e3 41      jsr ($41e3,x)
$07:b609  dc f3 3f      jml [$3ff3]
$07:b60c  dd 14 b2      cmp $b214,x
$07:b60f  55 1e         eor $1e,x
$07:b611  e0 1e d1      cpx #$d11e
$07:b614  42 ed         wdm #$ed
$07:b616  03 ba         ora $ba,s
$07:b618  be 44 0d      ldx $0d44,y
$07:b61b  b0 53         bcs $b670
$07:b61d  fe dd 25      inc $25dd,x
$07:b620  b6 33         ldx $33,y
$07:b622  42 eb         wdm #$eb
$07:b624  ae 45 20      ldx $2045
$07:b627  fd d1 ba      sbc $bad1,x
$07:b62a  1e f0 02      asl $02f0,x
$07:b62d  2d d0 34      and $34d0
$07:b630  0c df b6      tsb $b6df
$07:b633  c0 45 2d      cpy #$2d45
$07:b636  b0 33         bcs $b66b
$07:b638  0d f2 1f      ora $1ff2
$07:b63b  a6 df         ldx $df
$07:b63d  10 ff         bpl $b63e
$07:b63f  01 fb         ora ($fb,x)
$07:b641  c2 67         rep #$67
$07:b643  3c ba e1      bit $e1ba,x
$07:b646  53 cc         eor ($cc,s),y
$07:b648  f4 3e df      pea $df3e
$07:b64b  15 2d         ora $2d,x
$07:b64d  b6 ed         ldx $ed,y
$07:b64f  cf 45 1f fd   cmp $fd1f45
$07:b653  bf 46 3d ba   lda $ba3d46,x
$07:b657  c5 61         cmp $61
$07:b659  ba            tsx
$07:b65a  07 50         ora [$50]
$07:b65c  ba            tsx
$07:b65d  d4 63         pei ($63)
$07:b65f  ba            tsx
$07:b660  fe cd 05      inc $05cd,x
$07:b663  30 ec         bmi $b651
$07:b665  d3 62         cmp ($62,s),y
$07:b667  ec ba cf      cpx $cfba
$07:b66a  33 32         and ($32,s),y
$07:b66c  eb            xba
$07:b66d  b1 75         lda ($75),y
$07:b66f  ea            nop
$07:b670  b3 b6         lda ($b6,s),y
$07:b672  36 2d         rol $2d,x
$07:b674  ad 14 41      lda $4114
$07:b677  de 23 eb      dec $eb23,x
$07:b67a  b6 d3         ldx $d3,y
$07:b67c  53 ec         eor ($ec,s),y
$07:b67e  c0 45 2e      cpy #$2e45
$07:b681  cb            wai
$07:b682  f4 ba 1d      pea $1dba
$07:b685  ce 15 2e      dec $2e15
$07:b688  ef fe 14 40   sbc $4014fe
$07:b68c  ba            tsx
$07:b68d  dc d0 55      jml [$55d0]
$07:b690  fb            xce
$07:b691  c3 52         cmp $52,s
$07:b693  db            stp
$07:b694  e4 b6         cpx $b6
$07:b696  44 0b d2      mvp $d2,$0b
$07:b699  41 db         eor ($db,x)
$07:b69b  f4 42 fc      pea $fc42
$07:b69e  ba            tsx
$07:b69f  04 2e         tsb $2e
$07:b6a1  e2 30         sep #$30
$07:b6a3  dd d3 53      cmp $53d3,x
$07:b6a6  fc ba ce      jsr ($ceba,x)
$07:b6a9  35 3e         and $3e,x
$07:b6ab  cc 05 4f      cpy $4f05
$07:b6ae  ce 33 ba      dec $ba33
$07:b6b1  ec f1 23      cpx $23f1
$07:b6b4  2c e3 1d      bit $1de3
$07:b6b7  df 34 ba 3f   cmp $3fba34,x
$07:b6bb  cb            wai
$07:b6bc  f3 43         sbc ($43,s),y
$07:b6be  1d be 04      ora $04be,x
$07:b6c1  42 b6         wdm #$b6
$07:b6c3  3e bc 14      rol $14bc,x
$07:b6c6  3f cf 43 eb   and $eb43cf,x
$07:b6ca  c1 ba         cmp ($ba,x)
$07:b6cc  30 dd         bmi $b6ab
$07:b6ce  e1 43         sbc ($43,x)
$07:b6d0  0d df f2      ora $f2df
$07:b6d3  43 ba         eor $ba,s
$07:b6d5  ed df 14      sbc $14df
$07:b6d8  30 cd         bmi $b6a7
$07:b6da  f3 41         sbc ($41,s),y
$07:b6dc  dc aa e5      jml [$e5aa]
$07:b6df  52 00         eor ($00)
$07:b6e1  ee dd 06      inc $06dd
$07:b6e4  61 da         adc ($da,x)
$07:b6e6  aa            tax
$07:b6e7  b3 60         lda ($60,s),y
$07:b6e9  e2 2e         sep #$2e
$07:b6eb  bc 36 30      ldy $3036,x
$07:b6ee  ec b6 dd      cpx $ddb6
$07:b6f1  13 0d         ora ($0d,s),y
$07:b6f3  e3 41         sbc $41,s
$07:b6f5  ed f1 20      sbc $20f1
$07:b6f8  ba            tsx
$07:b6f9  f0 1f         beq $b71a
$07:b6fb  03 1e         ora $1e,s
$07:b6fd  f0 ff         beq $b6fe
$07:b6ff  f1 43         sbc ($43),y
$07:b701  ba            tsx
$07:b702  0c ce 44      tsb $44ce
$07:b705  1c c3 5e      trb $5ec3
$07:b708  df 22 aa 2b   cmp $2baa22,x
$07:b70c  cf 43 fe e2   cmp $e2fe43
$07:b710  10 ee         bpl $b700
$07:b712  03 b6         ora $b6,s
$07:b714  23 30         and $30,s
$07:b716  db            stp
$07:b717  d1 45         cmp ($45),y
$07:b719  2c c2 52      bit $52c2
$07:b71c  ba            tsx
$07:b71d  be 05 60      ldx $6005,y
$07:b720  ad 10 13      lda $1310
$07:b723  1e 11 c6      asl $c611,x
$07:b726  0e de 13      asl $13de
$07:b729  2f e0 22 fc   and $fc22e0
$07:b72d  c0 ba         cpy #$ba
$07:b72f  61 ca         adc ($ca,x)
$07:b731  c2 53         rep #$53
$07:b733  1f de fe 25   ora $25fede,x
$07:b737  ba            tsx
$07:b738  1e de 33      asl $33de,x
$07:b73b  fe e0 2f      inc $2fe0,x
$07:b73e  03 10         ora $10,s
$07:b740  ba            tsx
$07:b741  fc c2 64      jsr ($64c2,x)
$07:b744  fc ae 65      jsr ($65ae,x)
$07:b747  2e bb b2      rol $b2bb
$07:b74a  be 34 fb      ldx $fb34,y
$07:b74d  d3 51         cmp ($51,s),y
$07:b74f  df 33 fc ba   cmp $bafc33,x
$07:b753  43 ed         eor $ed,s
$07:b755  ef 25 2d cf   sbc $cf2d25
$07:b759  23 fd         and $fd,s
$07:b75b  ba            tsx
$07:b75c  f3 40         sbc ($40,s),y
$07:b75e  cb            wai
$07:b75f  f4 53 eb      pea $eb53
$07:b762  d0 12         bne $b776
$07:b764  ba            tsx
$07:b765  33 fd         and ($fd,s),y
$07:b767  d0 f0         bne $b759
$07:b769  11 42         ora ($42),y
$07:b76b  fc cf ba      jsr ($bacf,x)
$07:b76e  34 fe         bit $fe,x
$07:b770  03 2e         ora $2e,s
$07:b772  cd 04 42      cmp $4204
$07:b775  fc ba cf      jsr ($cfba,x)
$07:b778  24 30         bit $30
$07:b77a  cc 04 30      cpy $3004
$07:b77d  ed e0 ba      sbc $bae0
$07:b780  43 2e         eor $2e,s
$07:b782  cc 04 41      cpy $4104
$07:b785  ec e0 33      cpx $33e0
$07:b788  ba            tsx
$07:b789  2f de f0 23   and $23f0de
$07:b78d  1e de 23      asl $23de,x
$07:b790  2f aa bc f3   and $f3bcaa
$07:b794  61 bb         adc ($bb,x)
$07:b796  46 1c         lsr $1c
$07:b798  bd 65 b6      lda $b665,x
$07:b79b  2f dd 14 3f   and $3f14dd
$07:b79f  df 32 ec e3   cmp $e3ec32,x
$07:b7a3  ba            tsx
$07:b7a4  1e ce 05      asl $05ce,x
$07:b7a7  3f df 00 0e   and $0e00df,x
$07:b7ab  24 ba         bit $ba
$07:b7ad  1c d0 43      trb $43d0
$07:b7b0  eb            xba
$07:b7b1  e3 41         sbc $41,s
$07:b7b3  1c c0 a6      trb $a6c0
$07:b7b6  14 42         trb $42
$07:b7b8  ff 1f ac 26   sbc $26ac1f,x
$07:b7bc  50 9c         bvc $b75a
$07:b7be  ba            tsx
$07:b7bf  41 ed         eor ($ed,x)
$07:b7c1  e2 42         sep #$42
$07:b7c3  ed d0 44      sbc $44d0
$07:b7c6  0d ba ce      ora $ceba
$07:b7c9  35 1c         and $1c,x
$07:b7cb  d1 30         cmp ($30),y
$07:b7cd  df 43 fc aa   cmp $aafc43,x
$07:b7d1  ce 47 3c      dec $3c47
$07:b7d4  a4 5e         ldy $5e
$07:b7d6  bc f6 60      ldy $60f6,x
$07:b7d9  ba            tsx
$07:b7da  dd 24 1e      cmp $1e24,x
$07:b7dd  de 03 31      dec $3103,x
$07:b7e0  ed e2 ba      sbc $bae2
$07:b7e3  20 01 0e      jsr $0e01
$07:b7e6  ee 13 41      inc $4113
$07:b7e9  ec d0 ba      cpx $bad0
$07:b7ec  32 21         and ($21)
$07:b7ee  ed 01 0e      sbc $0e01
$07:b7f1  e1 54         sbc ($54,x)
$07:b7f3  ec aa bf      cpx $bfaa
$07:b7f6  14 52         trb $52
$07:b7f8  ef ec d1 65   sbc $65d1ec
$07:b7fc  1d aa bb      ora $bbaa,x
$07:b7ff  e6 54         inc $54
$07:b801  1c bd d0      trb $d0bd
$07:b804  66 2e         ror $2e
$07:b806  a6 2e         ldx $2e
$07:b808  d0 ec         bne $b7f6
$07:b80a  25 0b         and $0b
$07:b80c  c3 63         cmp $63,s
$07:b80e  fd aa e4      sbc $e4aa,x
$07:b811  41 fc         eor ($fc,x)
$07:b813  d1 23         cmp ($23),y
$07:b815  3e be e4      rol $e4be,x
$07:b818  ba            tsx
$07:b819  31 fd         and ($fd),y
$07:b81b  ef 43 1e cd   sbc $cd1e43
$07:b81f  25 2e         and $2e
$07:b821  a6 da         ldx $da
$07:b823  ce 16 73      dec $7316
$07:b826  ca            dex
$07:b827  cf 10 f2 ba   cmp $baf210
$07:b82b  20 df 01      jsr $01df
$07:b82e  ff 14 1f ee   sbc $ee1f14,x
$07:b832  d1 ba         cmp ($ba),y
$07:b834  34 1e         bit $1e,x
$07:b836  cc 24 30      cpy $3024
$07:b839  fd 0f f1      sbc $f10f,x
$07:b83c  aa            tax
$07:b83d  21 3f         and ($3f,x)
$07:b83f  22 ba e2 65   jsl $65e2ba
$07:b843  fc d2 aa      jsr ($aad2,x)
$07:b846  2c d4 40      bit $40d4
$07:b849  dd 32 ee      cmp $ee32,x
$07:b84c  f2 62         sbc ($62)
$07:b84e  ba            tsx
$07:b84f  cd 13 30      cmp $3013
$07:b852  dc f4 41      jml [$41f4]
$07:b855  dd e1 ba      cmp $bae1,x
$07:b858  33 1d         and ($1d,s),y
$07:b85a  ce 24 20      dec $2024
$07:b85d  ef ee 04 ba   sbc $ba04ee
$07:b861  40            rti
$07:b862  cd f2 30      cmp $30f2
$07:b865  ef 12 2f ce   sbc $ce2f12
$07:b869  ba            tsx
$07:b86a  f2 43         sbc ($43)
$07:b86c  fd fe f0      sbc $f0fe,x
$07:b86f  23 20         and $20,s
$07:b871  ed ba e0      sbc $e0ba
$07:b874  33 0e         and ($0e,s),y
$07:b876  e1 20         sbc ($20,x)
$07:b878  ed f3 42      sbc $42f3
$07:b87b  ba            tsx
$07:b87c  fd cf 34      sbc $34cf,x
$07:b87f  0d 00 f1      ora $f100
$07:b882  10 00         bpl $b884
$07:b884  9a            txs
$07:b885  fe bd 54      inc $54bd,x
$07:b888  23 ed         and $ed,s
$07:b88a  0e ef f3      asl $f3ef
$07:b88d  aa            tax
$07:b88e  2f f4 2d b0   and $b02df4
$07:b892  32 fd         and ($fd)
$07:b894  e5 50         sbc $50
$07:b896  ba            tsx
$07:b897  ed e3 30      sbc $30e3
$07:b89a  ef 12 0e f1   sbc $f10e12
$07:b89e  0f a6 b1 64   ora $64b1a6
$07:b8a2  fb            xce
$07:b8a3  b0 76         bcs $b91b
$07:b8a5  fb            xce
$07:b8a6  cf 33 ba e0   cmp $e0ba33
$07:b8aa  02 2f         cop #$2f
$07:b8ac  bd 25 30      lda $3025,x
$07:b8af  ed e0 aa      sbc $aae0
$07:b8b2  53 1f         eor ($1f,s),y
$07:b8b4  ef fe e3 62   sbc $62e3fe
$07:b8b8  db            stp
$07:b8b9  e3 aa         sbc $aa,s
$07:b8bb  5e df 14      lsr $14df,x
$07:b8be  3c cf 03      bit $03cf,x
$07:b8c1  30 02         bmi $b8c5
$07:b8c3  aa            tax
$07:b8c4  ec bf 46      cpx $46bf
$07:b8c7  5e ae 22      lsr $22ae,x
$07:b8ca  ee 31 ba      inc $ba31
$07:b8cd  ef 24 0d cf   sbc $cf0d24
$07:b8d1  24 20         bit $20
$07:b8d3  ed e1 aa      sbc $aae1
$07:b8d6  44 3f ba      mvp $ba,$3f
$07:b8d9  05 33         ora $33
$07:b8db  fa            plx
$07:b8dc  d3 12         cmp ($12,s),y
$07:b8de  ba            tsx
$07:b8df  20 ee ff      jsr $ffee
$07:b8e2  25 1d         and $1d
$07:b8e4  ce 15 3e      dec $3e15
$07:b8e7  bb            tyx
$07:b8e8  cd 34 1f      cmp $1f34
$07:b8eb  ed e2 50      sbc $50e2
$07:b8ee  c0 20 87      cpy #$8720
$07:b8f1  00 02         brk #$02
$07:b8f3  00 00         brk #$00
$07:b8f5  00 00         brk #$00
$07:b8f7  00 00         brk #$00
$07:b8f9  00 00         brk #$00
$07:b8fb  c6 c2         dec $c2
$07:b8fd  21 0f         and ($0f,x)
$07:b8ff  01 11         ora ($11,x)
$07:b901  0d ce 03      ora $03ce
$07:b904  ba            tsx
$07:b905  2f ac e3 22   and $22e3ac
$07:b909  1e ee 16      asl $16ee,x
$07:b90c  4e ba da      lsr $daba
$07:b90f  de 65 20      dec $2065,x
$07:b912  fc f0 22      jsr ($22f0,x)
$07:b915  fd ba ed      sbc $edba,x
$07:b918  35 35         and $35,x
$07:b91a  ca            dex
$07:b91b  cf 06 11 ef   cmp $ef1106
$07:b91f  ba            tsx
$07:b920  f2 14         sbc ($14)
$07:b922  de cc 07      dec $07cc,x
$07:b925  43 fc         eor $fc,s
$07:b927  de ba 12      dec $12ba,x
$07:b92a  10 0c         bpl $b938
$07:b92c  01 46         ora ($46,x)
$07:b92e  0c ac f3      tsb $f3ac
$07:b931  ba            tsx
$07:b932  62 0e ee      per $a743
$07:b935  22 10 ea d3   jsl $d3ea10
$07:b939  66 ba         ror $ba
$07:b93b  1e ad f2      asl $f2ad,x
$07:b93e  12 1e         ora ($1e)
$07:b940  ff 05 4f ba   sbc $ba4f05,x
$07:b944  d9 ee 65      cmp $65ee,y
$07:b947  20 ec f1      jsr $f1ec
$07:b94a  22 fd ba ec   jsl $ecbafd
$07:b94e  36 35         rol $35,x
$07:b950  ca            dex
$07:b951  bf 16 10 ff   lda $ff1016,x
$07:b955  ba            tsx
$07:b956  f1 24         sbc ($24),y
$07:b958  dd dc f7      cmp $f7dc,x
$07:b95b  53 ed         eor ($ed,s),y
$07:b95d  de ba 12      dec $12ba,x
$07:b960  1f 0c 11 46   ora $46110c,x
$07:b964  0c 9c 03      tsb $039c
$07:b967  ba            tsx
$07:b968  52 1e         eor ($1e)
$07:b96a  ee 22 1f      inc $1f22
$07:b96d  eb            xba
$07:b96e  e2 56         sep #$56
$07:b970  bb            tyx
$07:b971  1f bc e2 22   ora $22e2bc,x
$07:b975  1e ef 16      asl $16ef,x
$07:b978  3e 85 05      rol $0585,x
$07:b97b  00 00         brk #$00
$07:b97d  00 00         brk #$00
$07:b97f  00 00         brk #$00
$07:b981  00 00         brk #$00
$07:b983  00 a4         brk #$a4
$07:b985  00 ee         brk #$ee
$07:b987  f9 c6 c9      sbc $c9c6,y
$07:b98a  c3 40         cmp $40,s
$07:b98c  04 a4         tsb $a4
$07:b98e  45 3d         eor $3d
$07:b990  13 0d         ora ($0d,s),y
$07:b992  e1 10         sbc ($10,x)
$07:b994  23 11         and $11,s
$07:b996  88            dey
$07:b997  27 1e         and [$1e]
$07:b999  c1 34         cmp ($34,x)
$07:b99b  22 21 0e de   jsl $de0e21
$07:b99f  88            dey
$07:b9a0  e3 42         sbc $42,s
$07:b9a2  01 e3         ora ($e3,x)
$07:b9a4  4e df 2e      lsr $2edf
$07:b9a7  0f 78 ce 3f   ora $3fce78
$07:b9ab  1f ac fe cf   ora $cffeac,x
$07:b9af  4f e0 78 e2   eor $e278e0
$07:b9b3  22 6d be ef   jsl $efbe6d
$07:b9b7  cf ee 04 88   cmp $8804ee
$07:b9bb  11 11         ora ($11),y
$07:b9bd  11 fe         ora ($fe),y
$07:b9bf  2c c6 4c      bit $4cc6
$07:b9c2  e1 78         sbc ($78,x)
$07:b9c4  4d 20 af      eor $af20
$07:b9c7  23 fe         and $fe,s
$07:b9c9  44 ee c0      mvp $c0,$ee
$07:b9cc  78            sei
$07:b9cd  11 fe         ora ($fe),y
$07:b9cf  12 33         ora ($33)
$07:b9d1  00 fd         brk #$fd
$07:b9d3  d0 fe         bne $b9d3
$07:b9d5  78            sei
$07:b9d6  f0 21         beq $b9f9
$07:b9d8  02 2f         cop #$2f
$07:b9da  c0 22         cpy #$22
$07:b9dc  31 fd         and ($fd),y
$07:b9de  78            sei
$07:b9df  ec fd 02      cpx $02fd
$07:b9e2  41 12         eor ($12,x)
$07:b9e4  20 fe e0      jsr $e0fe
$07:b9e7  78            sei
$07:b9e8  c2 3f         rep #$3f
$07:b9ea  1e 01 10      asl $1001,x
$07:b9ed  00 01         brk #$01
$07:b9ef  ee 68 ef      inc $ef68
$07:b9f2  f4 30 ef      pea $ef30
$07:b9f5  3f c3 5d d2   and $d25dc3,x
$07:b9f9  68            pla
$07:b9fa  2e 44 0e      rol $0e44
$07:b9fd  10 01         bpl $ba00
$07:b9ff  d5 6e         cmp $6e,x
$07:ba01  17 78         ora [$78],y
$07:ba03  10 f2         bpl $b9f7
$07:ba05  11 02         ora ($02),y
$07:ba07  0d 1f b2      ora $b21f
$07:ba0a  4d 68 05      eor $0568
$07:ba0d  01 fd         ora ($fd,x)
$07:ba0f  0f bf 1e 2e   ora $2e1ebf
$07:ba13  d0 68         bne $ba7d
$07:ba15  c0 fc fe      cpy #$fefc
$07:ba18  eb            xba
$07:ba19  00 de         brk #$de
$07:ba1b  ff ed 68 eb   sbc $eb68ed,x
$07:ba1f  e2 05         sep #$05
$07:ba21  2d d1 51      and $51d1
$07:ba24  22 42 78 d0   jsl $d07842
$07:ba28  5e df 44      lsr $44df,x
$07:ba2b  f1 42         sbc ($42),y
$07:ba2d  02 0d         cop #$0d
$07:ba2f  68            pla
$07:ba30  12 f9         ora ($f9)
$07:ba32  d2 1e         cmp ($1e)
$07:ba34  20 e0 33      jsr $33e0
$07:ba37  ba            tsx
$07:ba38  68            pla
$07:ba39  0f de ee cf   ora $cfeede
$07:ba3d  0f 06 52 dd   ora $dd5206
$07:ba41  68            pla
$07:ba42  f2 ee         sbc ($ee)
$07:ba44  ff 33 e1 3f   sbc $3fe133,x
$07:ba48  35 0e         and $0e,x
$07:ba4a  58            cli
$07:ba4b  54 f2 33      mvn $33,$f2
$07:ba4e  72 b4         adc ($b4)
$07:ba50  2b            pld
$07:ba51  45 0b         eor $0b
$07:ba53  68            pla
$07:ba54  f1 2f         sbc ($2f),y
$07:ba56  10 a2         bpl $b9fa
$07:ba58  1d ee 10      ora $10ee,x
$07:ba5b  f0 68         beq $bac5
$07:ba5d  4b            phk
$07:ba5e  23 dd         and $dd,s
$07:ba60  2f ae 1d b0   and $b01dae
$07:ba64  34 68         bit $68,x
$07:ba66  0f 42 f4 3b   ora $3bf442
$07:ba6a  d1 5b         cmp ($5b),y
$07:ba6c  cd 20 68      cmp $6820
$07:ba6f  2f e4 50 0f   and $0f50e4
$07:ba73  ff df 00 3e   sbc $3e00df,x
$07:ba77  68            pla
$07:ba78  03 12         ora $12,s
$07:ba7a  f1 41         sbc ($41),y
$07:ba7c  bc 20 0e      ldy $0e20,x
$07:ba7f  23 68         and $68,s
$07:ba81  0e 11 e4      asl $e411
$07:ba84  31 f2         and ($f2),y
$07:ba86  1f dd 21 68   ora $6821dd,x
$07:ba8a  e0 33 1f      cpx #$1f33
$07:ba8d  fe e1 1f      inc $1fe1,x
$07:ba90  22 f0 68 43   jsl $4368f0
$07:ba94  fd e3 ee      sbc $eee3,x
$07:ba97  cd 31 61      cmp $6131
$07:ba9a  d0 c4         bne $ba60
$07:ba9c  00 00         brk #$00
$07:ba9e  00 00         brk #$00
$07:baa0  00 fe         brk #$fe
$07:baa2  ce 56 b4      dec $b456
$07:baa5  2e c0 11      rol $11c0
$07:baa8  ee ff 01      inc $01ff
$07:baab  11 12         ora ($12),y
$07:baad  98            tya
$07:baae  bd 0f 22      lda $220f,x
$07:bab1  51 cd         eor ($cd),y
$07:bab3  01 43         ora ($43,x)
$07:bab5  eb            xba
$07:bab6  98            tya
$07:bab7  10 e0         bpl $ba99
$07:bab9  31 f0         and ($f0),y
$07:babb  20 dd fe      jsr $fedd
$07:babe  12 b8         ora ($b8)
$07:bac0  24 3c         bit $3c
$07:bac2  cd e1 23      cmp $23e1
$07:bac5  00 1f         brk #$1f
$07:bac7  f1 98         sbc ($98),y
$07:bac9  df 6f 0d a1   cmp $a10d6f,x
$07:bacd  3f 02 10 fd   and $fd1002,x
$07:bad1  88            dey
$07:bad2  2f 2f db e2   and $e2db2f
$07:bad6  40            rti
$07:bad7  43 ee         eor $ee,s
$07:bad9  df 98 12 23   cmp $231298,x
$07:badd  0f de ed de   ora $deedde
$07:bae1  14 54         trb $54
$07:bae3  98            tya
$07:bae4  20 00 dc      jsr $dc00
$07:bae7  ef e0 00 12   sbc $1200e0
$07:baeb  21 88         and ($88,x)
$07:baed  1f df ef 23   ora $23efdf,x
$07:baf1  10 fc         bpl $baef
$07:baf3  f2 54         sbc ($54)
$07:baf5  78            sei
$07:baf6  61 cd         adc ($cd,x)
$07:baf8  dd dc cf      cmp $cfdc,x
$07:bafb  00 64         brk #$64
$07:bafd  12 78         ora ($78)
$07:baff  45 22         eor $22
$07:bb01  2e cc b9      rol $b9cc
$07:bb04  fd 22 e2      sbc $e222,x
$07:bb07  88            dey
$07:bb08  23 43         and $43,s
$07:bb0a  12 fd         ora ($fd)
$07:bb0c  bc cf f1      ldy $f1cf,x
$07:bb0f  34 78         bit $78,x
$07:bb11  40            rti
$07:bb12  dc cc db      jml [$dbcc]
$07:bb15  15 65         ora $65,x
$07:bb17  30 ef         bmi $bb08
$07:bb19  78            sei
$07:bb1a  fe e1 35      inc $35e1,x
$07:bb1d  51 fc         eor ($fc),y
$07:bb1f  cb            wai
$07:bb20  ee 23 88      inc $8823
$07:bb23  21 22         and ($22,x)
$07:bb25  31 21         and ($21),y
$07:bb27  dc bd ef      jml [$efbd]
$07:bb2a  f0 78         beq $bba4
$07:bb2c  45 53         eor $53
$07:bb2e  44 20 ee      mvp $ee,$20
$07:bb31  cd f2 22      cmp $22f2
$07:bb34  78            sei
$07:bb35  12 32         ora ($32)
$07:bb37  00 cc         brk #$cc
$07:bb39  ec c0 00      cpx $00c0
$07:bb3c  14 88         trb $88
$07:bb3e  42 0e         wdm #$0e
$07:bb40  f0 32         beq $bb74
$07:bb42  0c ce ed      tsb $edce
$07:bb45  de 88 35      dec $3588,x
$07:bb48  65 00         adc $00
$07:bb4a  01 fc         ora ($fc,x)
$07:bb4c  de e1 ff      dec $ffe1,x
$07:bb4f  78            sei
$07:bb50  3d ef f4      and $f4ef,x
$07:bb53  01 5c         ora ($5c,x)
$07:bb55  bf ef 33 78   lda $7833ef,x
$07:bb59  22 4f 15 2c   jsl $2c154f
$07:bb5d  cf c1 3d d0   cmp $d03dc1
$07:bb61  88            dey
$07:bb62  02 33         cop #$33
$07:bb64  42 10         wdm #$10
$07:bb66  dc ef 11      jml [$11ef]
$07:bb69  fc 78 d0      jsr ($d078,x)
$07:bb6c  10 12         bpl $bb80
$07:bb6e  35 65         and $65,x
$07:bb70  1f 0c bc 78   ora $78bc0c,x
$07:bb74  c1 66         cmp ($66,x)
$07:bb76  32 e9         and ($e9)
$07:bb78  e1 fc         sbc ($fc,x)
$07:bb7a  b0 2d         bcs $bba9
$07:bb7c  88            dey
$07:bb7d  22 23 0f 29   jsl $290f23
$07:bb81  1b            tcs
$07:bb82  c4 20         cpy $20
$07:bb84  f0 78         beq $bbfe
$07:bb86  1d 21 ef      ora $ef21,x
$07:bb89  22 66 42 cb   jsl $cb4266
$07:bb8d  ef 88 dd e0   sbc $e0dd88
$07:bb91  32 10         and ($10)
$07:bb93  1f e0 30 00   ora $0030e0,x
$07:bb97  78            sei
$07:bb98  04 2f         tsb $2f
$07:bb9a  0f 22 1e de   ora $de1e22
$07:bb9e  fe 22 78      inc $7822,x
$07:bba1  11 22         ora ($22),y
$07:bba3  22 22 1f dc   jsl $dc1f22
$07:bba7  d1 ec         cmp ($ec),y
$07:bba9  78            sei
$07:bbaa  ab            plb
$07:bbab  04 1f         tsb $1f
$07:bbad  e1 64         sbc ($64,x)
$07:bbaf  12 0f         ora ($0f)
$07:bbb1  f0 68         beq $bc1b
$07:bbb3  e0 0f e1      cpx #$e10f
$07:bbb6  2f d1 2d bb   and $bb2dd1
$07:bbba  01 78         ora ($78,x)
$07:bbbc  01 32         ora ($32,x)
$07:bbbe  12 20         ora ($20)
$07:bbc0  0d dd fe      ora $fedd
$07:bbc3  dd 78 f0      cmp $f078,x
$07:bbc6  42 01         wdm #$01
$07:bbc8  33 23         and ($23,s),y
$07:bbca  01 12         ora ($12,x)
$07:bbcc  ff 78 ee de   sbc $deee78,x
$07:bbd0  de ff 03      dec $03ff,x
$07:bbd3  42 21         wdm #$21
$07:bbd5  02 78         cop #$78
$07:bbd7  21 de         and ($de,x)
$07:bbd9  f1 22         sbc ($22),y
$07:bbdb  31 ff         and ($ff),y
$07:bbdd  0d cd 78      ora $78cd
$07:bbe0  11 34         ora ($34),y
$07:bbe2  43 22         eor $22,s
$07:bbe4  11 fd         ora ($fd),y
$07:bbe6  cd df 68      cmp $68df
$07:bbe9  ed ed ef      sbc $efed
$07:bbec  fd 15 20      sbc $2015,x
$07:bbef  44 23 68      mvp $68,$23
$07:bbf2  20 01 ff      jsr $ff01
$07:bbf5  01 b1         ora ($b1,x)
$07:bbf7  eb            xba
$07:bbf8  e0 11 68      cpx #$6811
$07:bbfb  00 26         brk #$26
$07:bbfd  52 22         eor ($22)
$07:bbff  fe db bc      inc $bcdb,x
$07:bc02  ba            tsx
$07:bc03  68            pla
$07:bc04  dc 24 31      jml [$3124]
$07:bc07  47 51         eor [$51]
$07:bc09  42 00         wdm #$00
$07:bc0b  ee 88 0f      inc $0f88
$07:bc0e  00 00         brk #$00
$07:bc10  fd e0 10      sbc $10e0,x
$07:bc13  23 2f         and $2f,s
$07:bc15  78            sei
$07:bc16  cf 23 0d 31   cmp $310d23
$07:bc1a  d1 01         cmp ($01),y
$07:bc1c  fe f2 88      inc $88f2,x
$07:bc1f  0f 0f 00 54   ora $54000f
$07:bc23  0d 01 03      ora $0301
$07:bc26  cd 78 3a      cmp $3a78
$07:bc29  c1 dd         cmp ($dd,x)
$07:bc2b  32 0b         and ($0b)
$07:bc2d  d3 03         cmp ($03,s),y
$07:bc2f  44 78 21      mvp $21,$78
$07:bc32  2b            pld
$07:bc33  b1 13         lda ($13),y
$07:bc35  20 cd ee      jsr $eecd
$07:bc38  22 78 10 24   jsl $241078
$07:bc3c  1f 00 11 3e   ora $3e1100,x
$07:bc40  cf ac 78 12   cmp $1278ac
$07:bc44  ef f0 23 31   sbc $3123f0
$07:bc48  22 1f ff 78   jsl $78ff1f
$07:bc4c  ff 31 e0 ea   sbc $eae031,x
$07:bc50  c3 12         cmp $12,s
$07:bc52  0c f0 78      tsb $78f0
$07:bc55  10 31         bpl $bc88
$07:bc57  21 1f         and ($1f,x)
$07:bc59  00 ff         brk #$ff
$07:bc5b  00 ec         brk #$ec
$07:bc5d  78            sei
$07:bc5e  f2 fe         sbc ($fe)
$07:bc60  35 31         and $31,x
$07:bc62  01 21         ora ($21,x)
$07:bc64  0f e2 68 cc   ora $cc68e2
$07:bc68  cd ce dc      cmp $dcce
$07:bc6b  ae 02 5f      ldx $5f02
$07:bc6e  e1 68         sbc ($68,x)
$07:bc70  56 5f         lsr $5f,x
$07:bc72  e0 32 bc      cpx #$bc32
$07:bc75  d3 1e         cmp ($1e,s),y
$07:bc77  d1 78         cmp ($78),y
$07:bc79  21 d0         and ($d0,x)
$07:bc7b  42 12         wdm #$12
$07:bc7d  00 1e         brk #$1e
$07:bc7f  ce 22 78      dec $7822
$07:bc82  fd bf 10      sbc $10bf,x
$07:bc85  f0 44         beq $bccb
$07:bc87  21 fe         and ($fe,x)
$07:bc89  24 68         bit $68
$07:bc8b  3b            tsc
$07:bc8c  c4 fe         cpy $fe
$07:bc8e  fc d0 ee      jsr ($eed0,x)
$07:bc91  00 10         brk #$10
$07:bc93  78            sei
$07:bc94  00 0f         brk #$0f
$07:bc96  32 0f         and ($0f)
$07:bc98  0f 0f 02 ec   ora $ec020f
$07:bc9c  78            sei
$07:bc9d  ff f1 10 13   sbc $1310f1,x
$07:bca1  42 10         wdm #$10
$07:bca3  ff 02 68 dc   sbc $dc6802,x
$07:bca7  0f aa bc 03   ora $03bcaa
$07:bcab  1f f0 e0 68   ora $68e0f0,x
$07:bcaf  51 11         eor ($11),y
$07:bcb1  1f 02 23 0e   ora $0e2302,x
$07:bcb5  e1 2e         sbc ($2e,x)
$07:bcb7  78            sei
$07:bcb8  ff f0 14 31   sbc $3114f0,x
$07:bcbc  02 20         cop #$20
$07:bcbe  fd ff 68      sbc $68ff,x
$07:bcc1  ad ee c1      lda $c1ee
$07:bcc4  21 fe         and ($fe,x)
$07:bcc6  35 25         and $25,x
$07:bcc8  41 68         eor ($68,x)
$07:bcca  01 fd         ora ($fd,x)
$07:bccc  22 de df fe   jsl $fedfde
$07:bcd0  d0 0d         bne $bcdf
$07:bcd2  68            pla
$07:bcd3  14 0f         trb $0f
$07:bcd5  23 30         and $30,s
$07:bcd7  db            stp
$07:bcd8  22 ff 30 68   jsl $6830ff
$07:bcdc  cb            wai
$07:bcdd  e0 01 46      cpx #$4601
$07:bce0  63 2f         adc $2f,s
$07:bce2  f5 21         sbc $21,x
$07:bce4  78            sei
$07:bce5  11 d0         ora ($d0),y
$07:bce7  1f cf 2e ef   ora $ef2ecf,x
$07:bceb  10 00         bpl $bced
$07:bced  68            pla
$07:bcee  df 02 22 41   cmp $412202,x
$07:bcf2  ff 10 10 1f   sbc $1f1010,x
$07:bcf6  78            sei
$07:bcf7  ef e0 21 12   sbc $1221e0
$07:bcfb  23 24         and $24,s
$07:bcfd  0f db 78 a0   ora $a078db
$07:bd01  10 ff         bpl $bd02
$07:bd03  f1 10         sbc ($10),y
$07:bd05  12 20         ora ($20)
$07:bd07  f0 68         beq $bd71
$07:bd09  1f 06 ea f5   ora $f5ea06,x
$07:bd0d  1d de 1d      ora $1dde,x
$07:bd10  03 68         ora $68,s
$07:bd12  00 fe         brk #$fe
$07:bd14  fe 00 56      inc $5600,x
$07:bd17  0a            asl a
$07:bd18  d3 31         cmp ($31,s),y
$07:bd1a  78            sei
$07:bd1b  df 0f f1 01   cmp $01f10f,x
$07:bd1f  33 2f         and ($2f,s),y
$07:bd21  13 32         ora ($32,s),y
$07:bd23  68            pla
$07:bd24  21 ee         and ($ee,x)
$07:bd26  fd fc bb      sbc $bbfc,x
$07:bd29  25 3e         and $3e
$07:bd2b  cd 68 22      cmp $2268
$07:bd2e  2d be 53      and $53be
$07:bd31  3e d0 51      rol $51d0,x
$07:bd34  dc 68 d0      jml [$d068]
$07:bd37  03 20         ora $20,s
$07:bd39  23 64         and $64,s
$07:bd3b  f2 40         sbc ($40)
$07:bd3d  dc 68 e2      jml [$e268]
$07:bd40  ee dc db      inc $dbdc
$07:bd43  e0 66 2d      cpx #$2d66
$07:bd46  e6 68         inc $68
$07:bd48  5f be 35 1e   eor $1e35be,x
$07:bd4c  f0 30         beq $bd7e
$07:bd4e  ed cd 58      sbc $58cd
$07:bd51  33 1c         and ($1c,s),y
$07:bd53  00 4e         brk #$4e
$07:bd55  62 23 1b      per $d87b
$07:bd58  cd 78 ff      cmp $ff78
$07:bd5b  f1 ed         sbc ($ed),y
$07:bd5d  f3 31         sbc ($31,s),y
$07:bd5f  e1 14         sbc ($14,x)
$07:bd61  43 68         eor $68,s
$07:bd63  42 eb         wdm #$eb
$07:bd65  cf df f1 3e   cmp $3ef1df
$07:bd69  e0 2f 68      cpx #$682f
$07:bd6c  0e ff ec      asl $ecff
$07:bd6f  b2 31         lda ($31)
$07:bd71  12 fe         ora ($fe)
$07:bd73  f3 78         sbc ($78,s),y
$07:bd75  2f ce 11 32   and $3211ce
$07:bd79  21 00         and ($00,x)
$07:bd7b  11 10         ora ($10),y
$07:bd7d  78            sei
$07:bd7e  f1 20         sbc ($20),y
$07:bd80  cd ee 01      cmp $01ee
$07:bd83  2f 01 1f 68   and $681f01
$07:bd87  32 f2         and ($f2)
$07:bd89  21 20         and ($20,x)
$07:bd8b  eb            xba
$07:bd8c  e2 31         sep #$31
$07:bd8e  fd 68 f5      sbc $f568,x
$07:bd91  2d c1 61      and $61c1
$07:bd94  ee 25 1e      inc $1e25
$07:bd97  0d 68 ba      ora $ba68
$07:bd9a  f2 1d         sbc ($1d)
$07:bd9c  f1 de         sbc ($de),y
$07:bd9e  03 62         ora $62,s
$07:bda0  36 68         rol $68,x
$07:bda2  4f 46 eb c0   eor $c0eb46
$07:bda6  db            stp
$07:bda7  16 4c         asl $4c,x
$07:bda9  9f 78 10 01   sta $011078,x
$07:bdad  0f 0e c0 43   ora $43c00e
$07:bdb1  fc e1 68      jsr ($68e1,x)
$07:bdb4  1c 1f 01      trb $011f
$07:bdb7  12 26         ora ($26)
$07:bdb9  51 0f         eor ($0f),y
$07:bdbb  14 68         trb $68
$07:bdbd  32 ee         and ($ee)
$07:bdbf  de dc 0d      dec $0ddc,x
$07:bdc2  0e f3 22      asl $22f3
$07:bdc5  78            sei
$07:bdc6  f1 10         sbc ($10),y
$07:bdc8  f0 13         beq $bddd
$07:bdca  10 cd         bpl $bd99
$07:bdcc  c1 45         cmp ($45,x)
$07:bdce  74 61         stz $61,x
$07:bdd0  ef 1f cc de   sbc $decc1f
$07:bdd4  f1 1e         sbc ($1e),y
$07:bdd6  ef 68 2c cb   sbc $cb2c68
$07:bdda  00 1e         brk #$1e
$07:bddc  ae 24 34      ldx $3424
$07:bddf  11 68         ora ($68),y
$07:bde1  52 0f         eor ($0f)
$07:bde3  34 21         bit $21,x
$07:bde5  de 00 bf      dec $bf00,x
$07:bde8  00 68         brk #$68
$07:bdea  22 0f 1d f9   jsl $f91d0f
$07:bdee  f4 2d 01      pea $012d
$07:bdf1  eb            xba
$07:bdf2  78            sei
$07:bdf3  df f1 44 ec   cmp $ec44f1,x
$07:bdf7  d2 21         cmp ($21)
$07:bdf9  15 40         ora $40,x
$07:bdfb  78            sei
$07:bdfc  e0 f1         cpx #$f1
$07:bdfe  30 cd         bmi $bdcd
$07:be00  f0 20         beq $be22
$07:be02  fd f1 68      sbc $68f1,x
$07:be05  71 1f         adc ($1f),y
$07:be07  13 ff         ora ($ff,s),y
$07:be09  ee e2 eb      inc $ebe2
$07:be0c  e2 78         sep #$78
$07:be0e  21 00         and ($00,x)
$07:be10  f0 11         beq $be23
$07:be12  1f de 14 20   ora $2014de,x
$07:be16  78            sei
$07:be17  f1 fc         sbc ($fc),y
$07:be19  cf 00 0f fe   cmp $fe0f00
$07:be1d  00 12         brk #$12
$07:be1f  78            sei
$07:be20  11 21         ora ($21),y
$07:be22  01 11         ora ($11,x)
$07:be24  0f 01 fd c0   ora $c0fd01
$07:be28  68            pla
$07:be29  35 20         and $20,x
$07:be2b  00 42         brk #$42
$07:be2d  0b            phd
$07:be2e  bd fb ae      lda $aefb,x
$07:be31  78            sei
$07:be32  12 20         ora ($20)
$07:be34  fc e1 40      jsr ($40e1,x)
$07:be37  ef 33 21 78   sbc $782133
$07:be3b  1f 03 30 ef   ora $ef3003,x
$07:be3f  e0 11         cpx #$11
$07:be41  ff f1 78 0d   sbc $0d78f1,x
$07:be45  02 52         cop #$52
$07:be47  fe 0f f1      inc $f10f,x
$07:be4a  01 00         ora ($00,x)
$07:be4c  68            pla
$07:be4d  c9 02         cmp #$02
$07:be4f  31 1f         and ($1f),y
$07:be51  ef 46 fb 14   sbc $14fb46
$07:be55  78            sei
$07:be56  3e ff ff      rol $ffff,x
$07:be59  eb            xba
$07:be5a  f1 1e         sbc ($1e),y
$07:be5c  f2 1f         sbc ($1f)
$07:be5e  68            pla
$07:be5f  24 1d         bit $1d
$07:be61  06 53         asl $53
$07:be63  0f c1 e1 32   ora $32e1c1
$07:be67  68            pla
$07:be68  d1 30         cmp ($30),y
$07:be6a  ff 0f 02 41   sbc $41020f,x
$07:be6e  ca            dex
$07:be6f  0f 68 dc fd   ora $fddc68
$07:be73  f3 0d         sbc ($0d,s),y
$07:be75  dd d4 64      cmp $64d4,x
$07:be78  e5 68         sbc $68
$07:be7a  43 f3         eor $f3,s
$07:be7c  00 d1         brk #$d1
$07:be7e  61 ae         adc ($ae,x)
$07:be80  0f d0 78 21   ora $2178d0
$07:be84  1f ff 12 21   ora $2112ff,x
$07:be88  1d cf 44      ora $44cf,x
$07:be8b  78            sei
$07:be8c  fc df f0      jsr ($f0df,x)
$07:be8f  10 13         bpl $bea4
$07:be91  30 f0         bmi $be83
$07:be93  22 78 1f dd   jsl $dd1f78
$07:be97  d0 22         bne $bebb
$07:be99  ec e0 20      cpx $20e0
$07:be9c  0e 78 d0      asl $d078
$07:be9f  23 00         and $00,s
$07:bea1  43 ed         eor $ed,s
$07:bea3  13 0f         ora ($0f,s),y
$07:bea5  df 68 13 54   cmp $541368,x
$07:bea9  30 ff         bmi $beaa
$07:beab  ce 42 f0      dec $f042
$07:beae  14 78         trb $78
$07:beb0  0b            phd
$07:beb1  d0 ee         bne $bea1
$07:beb3  f1 fe         sbc ($fe),y
$07:beb5  02 0f         cop #$0f
$07:beb7  f1 68         sbc ($68),y
$07:beb9  44 62 e3      mvp $e3,$62
$07:bebc  3f d0 20 aa   and $aa20d0,x
$07:bec0  23 78         and $78,s
$07:bec2  0e 04 31      asl $3104
$07:bec5  ff f0 00 ee   sbc $ee00f0,x
$07:bec9  03 78         ora $78,s
$07:becb  10 f0         bpl $bebd
$07:becd  ee e1 1f      inc $1fe1
$07:bed0  f2 42         sbc ($42)
$07:bed2  10 78         bpl $bf4c
$07:bed4  0e df 23      asl $23df
$07:bed7  ff 0f e0 ec   sbc $ece00f,x
$07:bedb  f1 78         sbc ($78),y
$07:bedd  0f 02 21 21   ora $212102
$07:bee1  1f 0e ce 16   ora $16ce0e,x
$07:bee5  78            sei
$07:bee6  41 f0         eor ($f0,x)
$07:bee8  fe f3 30      inc $30f3,x
$07:beeb  ef 21 ff 68   sbc $68ff21
$07:beef  02 eb         cop #$eb
$07:bef1  dc bf 10      jml [$10bf]
$07:bef4  dd 1d d3      cmp $d31d,x
$07:bef7  69 72         adc #$72
$07:bef9  e2 43         sep #$43
$07:befb  c0 01         cpy #$01
$07:befd  02 21         cop #$21
$07:beff  ec 38 0d      cpx $0d38
$07:bf02  00 00         brk #$00
$07:bf04  00 00         brk #$00
$07:bf06  00 00         brk #$00
$07:bf08  00 00         brk #$00
$07:bf0a  00 00         brk #$00
$07:bf0c  00 00         brk #$00
$07:bf0e  00 00         brk #$00
$07:bf10  00 00         brk #$00
$07:bf12  00 00         brk #$00
$07:bf14  b4 00         ldy $00,x
$07:bf16  00 00         brk #$00
$07:bf18  1f 10 7b ff   ora $ff7b10,x
$07:bf1c  3f a0 14 f0   and $f014a0,x
$07:bf20  d0 ff         bne $bf21
$07:bf22  10 0e         bpl $bf32
$07:bf24  f0 00         beq $bf26
$07:bf26  a4 1e         ldy $1e
$07:bf28  00 03         brk #$03
$07:bf2a  eb            xba
$07:bf2b  bd de 1e      lda $1ede,x
$07:bf2e  21 a4         and ($a4,x)
$07:bf30  74 e5         stz $e5,x
$07:bf32  11 21         ora ($21),y
$07:bf34  5e 2f ef      lsr $ef2f,x
$07:bf37  fa            plx
$07:bf38  a4 22         ldy $22
$07:bf3a  32 de         and ($de)
$07:bf3c  02 32         cop #$32
$07:bf3e  43 ee         eor $ee,s
$07:bf40  ef a8 1c 2c   sbc $2c1ca8
$07:bf44  5f 0f 2f 03   eor $032f0f,x
$07:bf48  fe e1 98      inc $98e1,x
$07:bf4b  21 e2         and ($e2,x)
$07:bf4d  1d 25 b1      ora $b125,x
$07:bf50  0c 2f 55      tsb $552f
$07:bf53  98            tya
$07:bf54  0f 1d 1e 2e   ora $2e1e1d
$07:bf58  6d c1 df      adc $dfc1
$07:bf5b  e5 98         sbc $98
$07:bf5d  1a            inc a
$07:bf5e  1c 20 20      trb $2020
$07:bf61  a2 1e         ldx #$1e
$07:bf63  f2 20         sbc ($20)
$07:bf65  98            tya
$07:bf66  fe f3 1e      inc $1ef3,x
$07:bf69  e3 df         sbc $df,s
$07:bf6b  4f 33 02 a8   eor $a80233
$07:bf6f  21 ff         and ($ff,x)
$07:bf71  ff 11 1f 00   sbc $001f11,x
$07:bf75  e3 02         sbc $02,s
$07:bf77  98            tya
$07:bf78  0b            phd
$07:bf79  3e 10 db      rol $db10,x
$07:bf7c  01 2f         ora ($2f,x)
$07:bf7e  0e 20 88      asl $8820
$07:bf81  5c 0e 03 0a   jml $0a030e
$07:bf85  d2 0e         cmp ($0e)
$07:bf87  5e 22 88      lsr $8822,x
$07:bf8a  23 69         and $69,s
$07:bf8c  33 f0         and ($f0,s),y
$07:bf8e  7f 9b cd 34   adc $34cd9b,x
$07:bf92  98            tya
$07:bf93  0f e3 02 00   ora $0002e3
$07:bf97  ff d1 02 d1   sbc $d102d1,x
$07:bf9b  98            tya
$07:bf9c  d0 f6         bne $bf94
$07:bf9e  f3 ed         sbc ($ed,s),y
$07:bfa0  0e 31 22      asl $2231
$07:bfa3  f3 88         sbc ($88,s),y
$07:bfa5  b1 21         lda ($21),y
$07:bfa7  0e 5e 2e      asl $2e5e
$07:bfaa  1e 01 00      asl $0001,x
$07:bfad  98            tya
$07:bfae  00 12         brk #$12
$07:bfb0  e0 0c         cpx #$0c
$07:bfb2  42 f1         wdm #$f1
$07:bfb4  d1 cd         cmp ($cd),y
$07:bfb6  98            tya
$07:bfb7  fd 2e 40      sbc $402e,x
$07:bfba  f2 21         sbc ($21)
$07:bfbc  1f 01 00 88   ora $880001,x
$07:bfc0  ab            plb
$07:bfc1  41 23         eor ($23,x)
$07:bfc3  23 df         and $df,s
$07:bfc5  3b            tsc
$07:bfc6  1f 42 88 f2   ora $f28842,x
$07:bfca  a2 03         ldx #$03
$07:bfcc  2a            rol a
$07:bfcd  de d1 0f      dec $0fd1,x
$07:bfd0  ff 88 13 13   sbc $131388,x
$07:bfd4  f5 de         sbc $de,x
$07:bfd6  3e 3c 50      rol $503c,x
$07:bfd9  f3 88         sbc ($88,s),y
$07:bfdb  cf d1 f2 43   cmp $43f2d1
$07:bfdf  24 2d         bit $2d
$07:bfe1  01 11         ora ($11,x)
$07:bfe3  88            dey
$07:bfe4  ce f1 b2      dec $b2f1
$07:bfe7  11 ff         ora ($ff),y
$07:bfe9  20 f1 f1      jsr $f1f1
$07:bfec  88            dey
$07:bfed  32 ae         and ($ae)
$07:bfef  dd 00 30      cmp $3000,x
$07:bff2  f4 ef 20      pea $20ef
$07:bff5  88            dey
$07:bff6  71 e9         adc ($e9),y
$07:bff8  e0 54         cpx #$54
$07:bffa  f0 e2         beq $bfde
$07:bffc  0f 0f 88 f4   ora $f4880f
$07:c000  d0 ed         bne $bfef
$07:c002  21 1f         and ($1f,x)
$07:c004  1f 00 2d 78   ora $782d00,x
$07:c008  23 0e         and $0e,s
$07:c00a  12 ce         ora ($ce)
$07:c00c  5e 4d 23      lsr $234d,x
$07:c00f  62 78 00      per $c08a
$07:c012  d7 0f         cmp [$0f],y
$07:c014  d0 c2         bne $bfd8
$07:c016  fd 25 76      sbc $7625,x
$07:c019  88            dey
$07:c01a  f2 ff         sbc ($ff)
$07:c01c  ff b1 0c 10   sbc $100cb1,x
$07:c020  31 fd         and ($fd),y
$07:c022  78            sei
$07:c023  22 f0 ea ef   jsl $efeaf0
$07:c027  10 32         bpl $c05b
$07:c029  0e 0d 78      asl $780d
$07:c02c  23 30         and $30,s
$07:c02e  6e 33 fd      ror $fd33
$07:c031  f6 b3         inc $b3,x
$07:c033  1f 78 3e 4d   ora $4d3e78,x
$07:c037  00 1f         brk #$1f
$07:c039  dc d2 10      jml [$10d2]
$07:c03c  e2 78         sep #$78
$07:c03e  05 f1         ora $f1
$07:c040  30 0f         bmi $c051
$07:c042  eb            xba
$07:c043  af 01 64 78   lda $786401
$07:c047  40            rti
$07:c048  46 3d         lsr $3d
$07:c04a  dc ee 32      jml [$32ee]
$07:c04d  4b            phk
$07:c04e  7d 78 f5      adc $f578,x
$07:c051  d2 c3         cmp ($c3)
$07:c053  cd 32 05      cmp $0532
$07:c056  91 ce         sta ($ce),y
$07:c058  78            sei
$07:c059  eb            xba
$07:c05a  41 11         eor ($11,x)
$07:c05c  bd 5f 0f      lda $0f5f,x
$07:c05f  d4 05         pei ($05)
$07:c061  78            sei
$07:c062  11 33         ora ($33),y
$07:c064  01 e2         ora ($e2,x)
$07:c066  1c 03 11      trb $1103
$07:c069  b0 88         bcs $bff3
$07:c06b  f2 14         sbc ($14)
$07:c06d  e2 e1         sep #$e1
$07:c06f  0e 01 ee      asl $ee01
$07:c072  e0 78         cpx #$78
$07:c074  05 ef         ora $ef
$07:c076  d1 2d         cmp ($2d),y
$07:c078  01 00         ora ($00,x)
$07:c07a  30 1c         bmi $c098
$07:c07c  78            sei
$07:c07d  d1 f2         cmp ($f2),y
$07:c07f  30 21         bmi $c0a2
$07:c081  14 c2         trb $c2
$07:c083  d4 2f         pei ($2f)
$07:c085  78            sei
$07:c086  00 04         brk #$04
$07:c088  52 e1         eor ($e1)
$07:c08a  fe f3 d0      inc $d0f3,x
$07:c08d  2e 78 ff      rol $ff78
$07:c090  4c e2 ff      jmp $ffe2
$07:c093  12 3f         ora ($3f)
$07:c095  04 0c         tsb $0c
$07:c097  84 31         sty $31
$07:c099  0f ec 00 32   ora $3200ec
$07:c09d  01 00         ora ($00,x)
$07:c09f  33 78         and ($78,s),y
$07:c0a1  ee a2 11      inc $11a2
$07:c0a4  02 e2         cop #$e2
$07:c0a6  ff 2f 0c 78   sbc $780c2f,x
$07:c0aa  5a            phy
$07:c0ab  f0 ff         beq $c0ac
$07:c0ad  d5 d3         cmp $d3,x
$07:c0af  f3 1f         sbc ($1f,s),y
$07:c0b1  20 78 f2      jsr $f278
$07:c0b4  2f 1f 12 b4   and $b4121f
$07:c0b8  0f 7e 33 68   ora $68337e
$07:c0bc  62 3e f2      per $b2fd
$07:c0bf  b0 d2         bcs $c093
$07:c0c1  01 3c         ora ($3c,x)
$07:c0c3  fe 78 e1      inc $e178,x
$07:c0c6  ff 4d 1f 1f   sbc $1f1f4d,x
$07:c0ca  e0 3b         cpx #$3b
$07:c0cc  c0 78         cpy #$78
$07:c0ce  01 5f         ora ($5f,x)
$07:c0d0  e2 dc         sep #$dc
$07:c0d2  01 13         ora ($13,x)
$07:c0d4  c3 3f         cmp $3f,s
$07:c0d6  78            sei
$07:c0d7  04 31         tsb $31
$07:c0d9  3b            tsc
$07:c0da  0a            asl a
$07:c0db  3f 4d 12 df   and $df124d,x
$07:c0df  78            sei
$07:c0e0  4b            phk
$07:c0e1  22 13 d2 df   jsl $dfd213
$07:c0e5  fd 42 e1      sbc $e142,x
$07:c0e8  78            sei
$07:c0e9  fe 5e 2f      inc $2f5e,x
$07:c0ec  30 0e         bmi $c0fc
$07:c0ee  21 22         and ($22,x)
$07:c0f0  3d 78 2d      and $2d78,x
$07:c0f3  20 31 1d      jsr $1d31
$07:c0f6  0c 31 23      tsb $2331
$07:c0f9  c0 78         cpy #$78
$07:c0fb  d1 f4         cmp ($f4),y
$07:c0fd  e3 fe         sbc $fe,s
$07:c0ff  fe e1 d0      inc $d0e1,x
$07:c102  12 74         ora ($74)
$07:c104  11 0d         ora ($0d),y
$07:c106  f2 f5         sbc ($f5)
$07:c108  32 35         and ($35)
$07:c10a  41 44         eor ($44,x)
$07:c10c  78            sei
$07:c10d  3b            tsc
$07:c10e  00 12         brk #$12
$07:c110  25 0e         and $0e
$07:c112  fd 10 3f      sbc $3f10,x
$07:c115  78            sei
$07:c116  ed f4 e0      sbc $e0f4
$07:c119  52 1f         eor ($1f)
$07:c11b  fd 01 5e      sbc $5e01,x
$07:c11e  78            sei
$07:c11f  fd 3f 1f      sbc $1f3f,x
$07:c122  11 2f         ora ($2f),y
$07:c124  2f 35 d2 68   and $68d235
$07:c128  09 d3         ora #$d3
$07:c12a  4d 4c 14      eor $144c
$07:c12d  21 f2         and ($f2,x)
$07:c12f  fa            plx
$07:c130  78            sei
$07:c131  2d ef f2      and $f2ef
$07:c134  30 ff         bmi $c135
$07:c136  03 eb         ora $eb,s
$07:c138  01 78         ora ($78,x)
$07:c13a  f2 de         sbc ($de)
$07:c13c  f3 01         sbc ($01,s),y
$07:c13e  2f 3f e2 f4   and $f4e23f
$07:c142  78            sei
$07:c143  30 c0         bmi $c105
$07:c145  f0 20         beq $c167
$07:c147  10 d5         bpl $c11e
$07:c149  e2 4e         sep #$4e
$07:c14b  64 0e         stz $0e
$07:c14d  b1 ac         lda ($ac),y
$07:c14f  bd dd cb      lda $cbdd,x
$07:c152  55 46         eor $46,x
$07:c154  78            sei
$07:c155  c3 01         cmp $01,s
$07:c157  01 d1         ora ($d1,x)
$07:c159  10 1f         bpl $c17a
$07:c15b  22 f1 74 f0   jsl $f074f1
$07:c15f  22 f0 fd ee   jsl $eefdf0
$07:c163  0d 0b ff      ora $ff0b
$07:c166  78            sei
$07:c167  00 10         brk #$10
$07:c169  d1 0e         cmp ($0e),y
$07:c16b  1b            tcs
$07:c16c  20 10 2f      jsr $2f10
$07:c16f  68            pla
$07:c170  dc 32 14      jml [$1432]
$07:c173  ca            dex
$07:c174  12 41         ora ($41)
$07:c176  45 02         eor $02
$07:c178  78            sei
$07:c179  f0 f1         beq $c16c
$07:c17b  11 e0         ora ($e0),y
$07:c17d  10 4e         bpl $c1cd
$07:c17f  1f e2 68 43   ora $4368e2,x
$07:c183  3e d1 c2      rol $c2d1,x
$07:c186  f0 11         beq $c199
$07:c188  1e bf 74      asl $74bf,x
$07:c18b  c2 13         rep #$13
$07:c18d  11 03         ora ($03),y
$07:c18f  21 f4         and ($f4,x)
$07:c191  24 32         bit $32
$07:c193  74 30         stz $30,x
$07:c195  ee db 2f      inc $2fdb
$07:c198  f1 04         sbc ($04),y
$07:c19a  3f 1f 78 f5   and $f5781f,x
$07:c19e  de 4c fc      dec $fc4c,x
$07:c1a1  02 4f         cop #$4f
$07:c1a3  01 a3         ora ($a3,x)
$07:c1a5  68            pla
$07:c1a6  f3 ff         sbc ($ff,s),y
$07:c1a8  6e e2 07      ror $07e2
$07:c1ab  10 0f         bpl $c1bc
$07:c1ad  14 78         trb $78
$07:c1af  ef 20 2b 43   sbc $432b20
$07:c1b3  02 e2         cop #$e2
$07:c1b5  e3 11         sbc $11,s
$07:c1b7  78            sei
$07:c1b8  1d 00 ff      ora $ff00,x
$07:c1bb  f0 00         beq $c1bd
$07:c1bd  f3 04         sbc ($04,s),y
$07:c1bf  d0 74         bne $c235
$07:c1c1  02 0f         cop #$0f
$07:c1c3  fe 01 e0      inc $e001,x
$07:c1c6  02 42         cop #$42
$07:c1c8  13 64         ora ($64,s),y
$07:c1ca  42 e2         wdm #$e2
$07:c1cc  43 24         eor $24,s
$07:c1ce  10 15         bpl $c1e5
$07:c1d0  f0 1e         beq $c1f0
$07:c1d2  68            pla
$07:c1d3  34 ed         bit $ed,x
$07:c1d5  d0 03         bne $c1da
$07:c1d7  c2 ff         rep #$ff
$07:c1d9  23 e6         and $e6,s
$07:c1db  78            sei
$07:c1dc  f0 3f         beq $c21d
$07:c1de  05 ff         ora $ff
$07:c1e0  2d 0f f2      and $f20f
$07:c1e3  3f 78 00 2f   and $2f0078,x
$07:c1e7  20 1e 0d      jsr $0d1e
$07:c1ea  02 e3         cop #$e3
$07:c1ec  0f 74 0f 1f   ora $1f0f74
$07:c1f0  10 ff         bpl $c1f1
$07:c1f2  f0 e1         beq $c1d5
$07:c1f4  c0 e0 68      cpy #$68e0
$07:c1f7  32 44         and ($44)
$07:c1f9  d3 ec         cmp ($ec,s),y
$07:c1fb  f3 2c         sbc ($2c,s),y
$07:c1fd  0e 16 68      asl $6816
$07:c200  12 4d         ora ($4d)
$07:c202  6f 13 d7 a1   adc $a1d713
$07:c206  0d 20 68      ora $6820
$07:c209  d2 c0         cmp ($c0)
$07:c20b  d1 3f         cmp ($3f),y
$07:c20d  ee 5d 3e      inc $3e5d
$07:c210  1e 68 e2      asl $e268,x
$07:c213  31 31         and ($31),y
$07:c215  00 e3         brk #$e3
$07:c217  f1 f0         sbc ($f0),y
$07:c219  3c 68 02      bit $0268,x
$07:c21c  65 c6         adc $c6
$07:c21e  d1 e0         cmp ($e0),y
$07:c220  2e de 10      rol $10de
$07:c223  68            pla
$07:c224  c1 3e         cmp ($3e,x)
$07:c226  2d 30 e1      and $e130
$07:c229  e4 e1         cpx $e1
$07:c22b  e2 78         sep #$78
$07:c22d  2b            pld
$07:c22e  2c 32 0f      bit $0f32
$07:c231  01 21         ora ($21,x)
$07:c233  02 e1         cop #$e1
$07:c235  68            pla
$07:c236  7e bf 3e      ror $3ebf,x
$07:c239  71 13         adc ($13),y
$07:c23b  5d 1d 1c      eor $1c1d,x
$07:c23e  78            sei
$07:c23f  1c 1d 12      trb $121d
$07:c242  00 e2         brk #$e2
$07:c244  20 e1 02      jsr $02e1
$07:c247  78            sei
$07:c248  ff dd 12 22   sbc $2212dd,x
$07:c24c  2c 10 11      bit $1110
$07:c24f  f1 64         sbc ($64),y
$07:c251  35 3d         and $3d,x
$07:c253  de db fc      dec $fcdb,x
$07:c256  c2 ef         rep #$ef
$07:c258  ee 68 2a      inc $2a68
$07:c25b  3d f2 21      and $21f2,x
$07:c25e  ae f4 52      ldx $52f4
$07:c261  22 78 0c 4e   jsl $4e0c78
$07:c265  d1 10         cmp ($10),y
$07:c267  00 f1         brk #$f1
$07:c269  04 20         tsb $20
$07:c26b  68            pla
$07:c26c  01 7b         ora ($7b,x)
$07:c26e  3b            tsc
$07:c26f  22 ef ff 4f   jsl $4fffef
$07:c273  2e 78 10      rol $1078
$07:c276  0e 0f e2      asl $e20f
$07:c279  1c 2e 12      trb $122e
$07:c27c  20 78 f0      jsr $f078
$07:c27f  1c 2e 3f      trb $3f2e
$07:c282  f0 01         beq $c285
$07:c284  11 12         ora ($12),y
$07:c286  78            sei
$07:c287  01 1e         ora ($1e,x)
$07:c289  40            rti
$07:c28a  0e ef 02      asl $02ef
$07:c28d  f1 1f         sbc ($1f),y
$07:c28f  78            sei
$07:c290  f2 00         sbc ($00)
$07:c292  3e 1e d3      rol $d31e,x
$07:c295  0f 3c 00 68   ora $68003c
$07:c299  20 60 fa      jsr $fa60
$07:c29c  02 10         cop #$10
$07:c29e  30 f3         bmi $c293
$07:c2a0  3f 68 32 41   and $413268,x
$07:c2a4  ce 2f fd      dec $fd2f
$07:c2a7  32 d1         and ($d1)
$07:c2a9  32 68         and ($68)
$07:c2ab  de 31 1b      dec $1b31,x
$07:c2ae  6c 12 df      jmp ($df12)
$07:c2b1  f3 ac         sbc ($ac,s),y
$07:c2b3  68            pla
$07:c2b4  12 c7         ora ($c7)
$07:c2b6  12 2f         ora ($2f)
$07:c2b8  00 0f         brk #$0f
$07:c2ba  2f 00 64 10   and $106400
$07:c2be  e4 20         cpx $20
$07:c2c0  1e e0 01      asl $01e0,x
$07:c2c3  0e ae 74      asl $74ae
$07:c2c6  dd 0f 21      cmp $210f,x
$07:c2c9  12 00         ora ($00)
$07:c2cb  43 2f         eor $2f,s
$07:c2cd  bc 68 06      ldy $0668,x
$07:c2d0  50 3d         bvc $c30f
$07:c2d2  10 5e         bpl $c332
$07:c2d4  4c 00 15      jmp $1500
$07:c2d7  78            sei
$07:c2d8  e0 00         cpx #$00
$07:c2da  0e 32 00      asl $0032
$07:c2dd  00 ff         brk #$ff
$07:c2df  f0 74         beq $c355
$07:c2e1  ee dc c1      inc $c1dc
$07:c2e4  04 1d         tsb $1d
$07:c2e6  ee 03 21      inc $2103
$07:c2e9  78            sei
$07:c2ea  ef 04 00 ef   sbc $ef0004
$07:c2ee  04 11         tsb $11
$07:c2f0  01 00         ora ($00,x)
$07:c2f2  68            pla
$07:c2f3  1d 01 11      ora $1101,x
$07:c2f6  11 03         ora ($03),y
$07:c2f8  5e 2f d4      lsr $d42f,x
$07:c2fb  68            pla
$07:c2fc  f2 4d         sbc ($4d)
$07:c2fe  3d fd 1d      and $1dfd,x
$07:c301  42 11         wdm #$11
$07:c303  e1 64         sbc ($64,x)
$07:c305  5e 00 e0      lsr $e000,x
$07:c308  20 b1 15      jsr $15b1
$07:c30b  24 14         bit $14
$07:c30d  74 12         stz $12,x
$07:c30f  00 fd         brk #$fd
$07:c311  1f 00 fe f0   ora $f0fe00,x
$07:c315  12 68         ora ($68)
$07:c317  ee 02 6d      inc $6d02
$07:c31a  cd 1f 10      cmp $101f
$07:c31d  43 2c         eor $2c,s
$07:c31f  74 11         stz $11,x
$07:c321  00 04         brk #$04
$07:c323  22 10 d1 00   jsl $00d110
$07:c327  f1 64         sbc ($64),y
$07:c329  05 52         ora $52
$07:c32b  24 1e         bit $1e
$07:c32d  1f 3e 2e dd   ora $dd2e3e,x
$07:c331  54 2b b2      mvn $b2,$2b
$07:c334  f1 52         sbc ($52),y
$07:c336  eb            xba
$07:c337  02 1d         cop #$1d
$07:c339  6d 64 e2      adc $e264
$07:c33c  f0 03         beq $c341
$07:c33e  f4 23 f1      pea $f123
$07:c341  10 2e         bpl $c371
$07:c343  64 1c         stz $1c
$07:c345  00 02         brk #$02
$07:c347  de 0f c0      dec $c00f,x
$07:c34a  02 01         cop #$01
$07:c34c  64 00         stz $00
$07:c34e  11 30         ora ($30),y
$07:c350  21 31         and ($31,x)
$07:c352  43 e6         eor $e6,s
$07:c354  44 68 4b      mvp $4b,$68
$07:c357  4d 04 ee      eor $ee04
$07:c35a  02 06         cop #$06
$07:c35c  f1 03         sbc ($03),y
$07:c35e  64 1f         stz $1f
$07:c360  00 0f         brk #$0f
$07:c362  2d ec 0d      and $0dec
$07:c365  2f 1f 54 1f   and $1f541f
$07:c369  9b            txy
$07:c36a  ad ee e3      lda $e3ee
$07:c36d  27 34         and [$34]
$07:c36f  3c 68 3d      bit $3d68,x
$07:c372  5f f1 c6 d3   eor $d3c6f1,x
$07:c376  ff d4 43 64   sbc $6443d4,x
$07:c37a  13 d0         ora ($d0,s),y
$07:c37c  02 21         cop #$21
$07:c37e  3f 1f b2 10   and $10b21f,x
$07:c382  68            pla
$07:c383  2b            pld
$07:c384  4e 14 4c      lsr $4c14
$07:c387  2f 2c 5d 20   and $205d2c
$07:c38b  68            pla
$07:c38c  d5 d1         cmp $d1,x
$07:c38e  4a            lsr a
$07:c38f  05 f0         ora $f0
$07:c391  0e 22 32      asl $3222
$07:c394  64 53         stz $53
$07:c396  14 0f         trb $0f
$07:c398  ee e1 ad      inc $ade1
$07:c39b  dc e0 64      jml [$64e0]
$07:c39e  15 34         ora $34,x
$07:c3a0  10 5f         bpl $c401
$07:c3a2  ef 02 fd fe   sbc $fefd02
$07:c3a6  58            cli
$07:c3a7  34 fd         bit $fd,x
$07:c3a9  94 15         sty $15,x
$07:c3ab  06 91         asl $91
$07:c3ad  14 6e         trb $6e
$07:c3af  68            pla
$07:c3b0  2f 1e f2 10   and $10f21e
$07:c3b4  5f 1c d3 06   eor $06d31c,x
$07:c3b8  68            pla
$07:c3b9  f5 95         sbc $95,x
$07:c3bb  13 b1         ora ($b1,s),y
$07:c3bd  fc 2d 3f      jsr ($3f2d,x)
$07:c3c0  02 64         cop #$64
$07:c3c2  dd 02 43      cmp $4302,x
$07:c3c5  33 e2         and ($e2,s),y
$07:c3c7  02 01         cop #$01
$07:c3c9  32 58         and ($58)
$07:c3cb  34 e2         bit $e2,x
$07:c3cd  2e f1 21      rol $21f1
$07:c3d0  4b            phk
$07:c3d1  3f d4 68 11   and $1168d4,x
$07:c3d5  60            rts
$07:c3d6  f0 c2         beq $c39a
$07:c3d8  0b            phd
$07:c3d9  6d 31 e0      adc $e031
$07:c3dc  58            cli
$07:c3dd  02 b0         cop #$b0
$07:c3df  11 73         ora ($73),y
$07:c3e1  0d 1c 00      ora $001c
$07:c3e4  c3 64         cmp $64,s
$07:c3e6  ed f1 d2      sbc $d2f1
$07:c3e9  43 46         eor $46,s
$07:c3eb  15 23         ora $23,x
$07:c3ed  fd 64 ff      sbc $ff64,x
$07:c3f0  e3 e3         sbc $e3,s
$07:c3f2  20 0f 24      jsr $240f
$07:c3f5  54 1e 68      mvn $68,$1e
$07:c3f8  3b            tsc
$07:c3f9  4f 13 11 ef   eor $ef1113
$07:c3fd  23 d2         and $d2,s
$07:c3ff  c1 68         cmp ($68,x)
$07:c401  12 1b         ora ($1b)
$07:c403  3f f3 02 3b   and $3b02f3,x
$07:c407  6c 2f 58      jmp ($582f)
$07:c40a  b4 1f         ldy $1f,x
$07:c40c  bd 47 e5      lda $e547,x
$07:c40f  2f ff 04 64   and $6404ff
$07:c413  0d cc 00      ora $00cc
$07:c416  f1 01         sbc ($01),y
$07:c418  04 01         tsb $01
$07:c41a  3e 64 33      rol $3364,x
$07:c41d  34 30         bit $30,x
$07:c41f  ff f2 24 33   sbc $3324f2,x
$07:c423  2e 54 99      rol $9954
$07:c426  e3 01         sbc $01,s
$07:c428  3f 40 56 e6   and $e65640,x
$07:c42c  fe 64 01      inc $0164,x
$07:c42f  00 02         brk #$02
$07:c431  1f 1b 1e 10   ora $101e1b,x
$07:c435  20 68 32      jsr $3268
$07:c438  f0 0f         beq $c449
$07:c43a  20 1f 3c      jsr $3c1f
$07:c43d  33 0d         and ($0d,s),y
$07:c43f  68            pla
$07:c440  10 e2         bpl $c424
$07:c442  4f 0e 10 f0   eor $f0100e
$07:c446  fc 32 64      jsr ($6432,x)
$07:c449  3d 0c de      and $de0c,x
$07:c44c  d1 10         cmp ($10),y
$07:c44e  21 56         and ($56,x)
$07:c450  66 58         ror $58
$07:c452  96 d0         stx $d0,y
$07:c454  54 10 3a      mvn $3a,$10
$07:c457  34 a3         bit $a3,x
$07:c459  5e 68 4c      lsr $4c68,x
$07:c45c  33 e4         and ($e4,s),y
$07:c45e  f3 fe         sbc ($fe,s),y
$07:c460  2e f1 a6      rol $a6f1
$07:c463  68            pla
$07:c464  00 f0         brk #$f0
$07:c466  2f 0d 4f 21   and $214f0d
$07:c46a  c3 e2         cmp $e2,s
$07:c46c  68            pla
$07:c46d  ff 01 03 f1   sbc $f10301,x
$07:c471  3d 3e f1      and $f13e,x
$07:c474  41 68         eor ($68,x)
$07:c476  4e 13 c2      lsr $c213
$07:c479  dd 51 e0      cmp $e051,x
$07:c47c  2e e2 68      rol $68e2
$07:c47f  f1 f0         sbc ($f0),y
$07:c481  fe 02 f1      inc $f102,x
$07:c484  e4 f0         cpx $f0
$07:c486  c2 68         rep #$68
$07:c488  0e 03 f3      asl $f303
$07:c48b  e2 f2         sep #$f2
$07:c48d  e2 11         sep #$11
$07:c48f  13 68         ora ($68,s),y
$07:c491  01 1e         ora ($1e,x)
$07:c493  3e 11 f4      rol $f411,x
$07:c496  11 fe         ora ($fe),y
$07:c498  1e 58 5f      asl $5f58,x
$07:c49b  34 0f         bit $0f,x
$07:c49d  ef e0 30 00   sbc $0030e0
$07:c4a1  f3 68         sbc ($68,s),y
$07:c4a3  e1 1e         sbc ($1e,x)
$07:c4a5  3f e1 01 00   and $0001e1,x
$07:c4a9  30 e3         bmi $c48e
$07:c4ab  68            pla
$07:c4ac  3f 2e 0f 13   and $130f2e,x
$07:c4b0  a2 21         ldx #$21
$07:c4b2  d0 1e         bne $c4d2
$07:c4b4  68            pla
$07:c4b5  02 b4         cop #$b4
$07:c4b7  e3 ef         sbc $ef,s
$07:c4b9  4b            phk
$07:c4ba  21 f4         and ($f4,x)
$07:c4bc  ff 68 d1 c2   sbc $c2d168,x
$07:c4c0  00 42         brk #$42
$07:c4c2  2b            pld
$07:c4c3  4e 33 f2      lsr $f233
$07:c4c6  58            cli
$07:c4c7  1e 7d 1e      asl $1e7d,x
$07:c4ca  54 0b 6d      mvn $6d,$0b
$07:c4cd  62 b1 64      per $2981
$07:c4d0  cc 00 2f      cpy $2f00
$07:c4d3  40            rti
$07:c4d4  0d fd e0      ora $e0fd
$07:c4d7  dd 68 e2      cmp $e268,x
$07:c4da  2e 1f f4      rol $f41f
$07:c4dd  e1 1f         sbc ($1f,x)
$07:c4df  2f 22 64 33   and $336422
$07:c4e3  43 10         eor $10,s
$07:c4e5  1e ff ef      asl $efff,x
$07:c4e8  cc 20 64      cpy $6420
$07:c4eb  4e 3d 1e      lsr $1e3d
$07:c4ee  0f ee dc cd   ora $cddcee
$07:c4f2  01 68         ora ($68,x)
$07:c4f4  d4 e3         pei ($e3)
$07:c4f6  e2 d2         sep #$d2
$07:c4f8  01 f2         ora ($f2,x)
$07:c4fa  f3 e0         sbc ($e0,s),y
$07:c4fc  68            pla
$07:c4fd  0f 30 3f 21   ora $213f30
$07:c501  d2 3d         cmp ($3d)
$07:c503  40            rti
$07:c504  11 68         ora ($68),y
$07:c506  0e 4c 2f      asl $2f4c
$07:c509  00 2d         brk #$2d
$07:c50b  1f 11 11 64   ora $641111,x
$07:c50f  d2 02         cmp ($02)
$07:c511  20 15 00      jsr $0015
$07:c514  cf 24 01 58   cmp $580124
$07:c518  26 fc         rol $fc
$07:c51a  34 ff         bit $ff,x
$07:c51c  b7 b3         lda [$b3],y
$07:c51e  02 fd         cop #$fd
$07:c520  64 02         stz $02
$07:c522  dd ed dc      cmp $dced,x
$07:c525  ee f3 21      inc $21f3
$07:c528  f5 68         sbc $68,x
$07:c52a  e3 e0         sbc $e0,s
$07:c52c  e0 30         cpx #$30
$07:c52e  1f 02 e3 6f   ora $6fe302,x
$07:c532  58            cli
$07:c533  02 b2         cop #$b2
$07:c535  42 f1         wdm #$f1
$07:c537  22 06 b4 d5   jsl $d5b406
$07:c53b  68            pla
$07:c53c  c4 e1         cpy $e1
$07:c53e  2f 0f 01 f1   and $f1010f
$07:c542  e0 ef         cpx #$ef
$07:c544  54 bf 91      mvn $91,$bf
$07:c547  c0 06         cpy #$06
$07:c549  77 22         adc [$22],y
$07:c54b  5e 26 68      lsr $6826,x
$07:c54e  22 0f f0 5c   jsl $5cf00f
$07:c552  6a            ror a
$07:c553  20 00 14      jsr $1400
$07:c556  64 00         stz $00
$07:c558  11 fe         ora ($fe),y
$07:c55a  f2 2d         sbc ($2d)
$07:c55c  dc cd 01      jml [$01cd]
$07:c55f  68            pla
$07:c560  10 d4         bpl $c536
$07:c562  c1 31         cmp ($31,x)
$07:c564  2e e1 e0      rol $e0e1
$07:c567  21 68         and ($68,x)
$07:c569  01 4d         ora ($4d,x)
$07:c56b  30 e6         bmi $c553
$07:c56d  b2 0c         lda ($0c)
$07:c56f  40            rti
$07:c570  f2 64         sbc ($64)
$07:c572  f0 ff         beq $c573
$07:c574  12 d0         ora ($d0)
$07:c576  ec ef cf      cpx $cfef
$07:c579  cf 54 ef 20   cmp $20ef54
$07:c57d  5d 30 04      eor $0430,x
$07:c580  03 63         ora $63,s
$07:c582  56 58         lsr $58,x
$07:c584  43 20         eor $20,s
$07:c586  02 c1         cop #$c1
$07:c588  22 10 50 32   jsl $325010
$07:c58c  68            pla
$07:c58d  1f 3d 3e 2c   ora $2c3e3d,x
$07:c591  1e 2f 20      asl $202f,x
$07:c594  f0 58         beq $c5ee
$07:c596  4e 4e dd      lsr $dd4e
$07:c599  f5 c1         sbc $c1,x
$07:c59b  15 00         ora $00,x
$07:c59d  4d 68 1f      eor $1f68
$07:c5a0  f2 f1         sbc ($f1)
$07:c5a2  d3 14         cmp ($14,s),y
$07:c5a4  e2 10         sep #$10
$07:c5a6  10 68         bpl $c610
$07:c5a8  10 02         bpl $c5ac
$07:c5aa  ff 02 c2 0f   sbc $0fc202,x
$07:c5ae  4f 20 54 00   eor $005420
$07:c5b2  b3 35         lda ($35,s),y
$07:c5b4  11 1e         ora ($1e),y
$07:c5b6  ec 4a bf      cpx $bf4a
$07:c5b9  64 02         stz $02
$07:c5bb  23 23         and $23,s
$07:c5bd  24 33         bit $33
$07:c5bf  24 ff         bit $ff
$07:c5c1  1c 64 21      trb $2164
$07:c5c4  33 3e         and ($3e,s),y
$07:c5c6  1f 0f fb fe   ora $fefb0f,x
$07:c5ca  12 68         ora ($68)
$07:c5cc  f2 ff         sbc ($ff)
$07:c5ce  5f 0f 2e 0e   eor $0e2e0f,x
$07:c5d2  2f 4e 68 1f   and $1f684e
$07:c5d6  13 13         ora ($13,s),y
$07:c5d8  ee 12 c3      inc $c312
$07:c5db  c2 2d         rep #$2d
$07:c5dd  58            cli
$07:c5de  5c 5e 20 41   jml $41205e
$07:c5e2  f0 3e         beq $c622
$07:c5e4  9f f4 64 1d   sta $1d64f4,x
$07:c5e8  02 32         cop #$32
$07:c5ea  12 23         ora ($23)
$07:c5ec  41 00         eor ($00,x)
$07:c5ee  12 68         ora ($68)
$07:c5f0  b4 f1         ldy $f1,x
$07:c5f2  00 16         brk #$16
$07:c5f4  ff 1b 40 03   sbc $03401b,x
$07:c5f8  54 ff cb      mvn $cb,$ff
$07:c5fb  cd ec 53      cmp $53ec
$07:c5fe  1e c0 20      asl $20c0,x
$07:c601  58            cli
$07:c602  01 e3         ora ($e3,x)
$07:c604  24 fb         bit $fb
$07:c606  62 e5 1d      per $e3ee
$07:c609  b3 68         lda ($68,s),y
$07:c60b  f0 22         beq $c62f
$07:c60d  f1 f2         sbc ($f2),y
$07:c60f  14 e0         trb $e0
$07:c611  0f f4 68 ee   ora $ee68f4
$07:c615  ff 3d 3f 04   sbc $043f3d,x
$07:c619  ff 2b 50 68   sbc $68502b,x
$07:c61d  1f 3e dd 10   ora $10dd3e,x
$07:c621  3f 4e 12 10   and $10124e,x
$07:c625  64 0e         stz $0e
$07:c627  42 33         wdm #$33
$07:c629  31 01         and ($01),y
$07:c62b  31 00         and ($00),y
$07:c62d  20 58 4a      jsr $4a58
$07:c630  d6 f0         dec $f0,x
$07:c632  20 f3 b7      jsr $b7f3
$07:c635  c2 10         rep #$10
$07:c637  64 12         stz $12
$07:c639  3f 30 e0 d1   and $d1e030,x
$07:c63d  f4 24 11      pea $1124
$07:c640  68            pla
$07:c641  30 3f         bmi $c682
$07:c643  0f 11 d0 0d   ora $0dd011
$07:c647  33 4e         and ($4e,s),y
$07:c649  68            pla
$07:c64a  01 ff         ora ($ff,x)
$07:c64c  30 fd         bmi $c64b
$07:c64e  30 c3         bmi $c613
$07:c650  f0 21         beq $c673
$07:c652  68            pla
$07:c653  e2 0e         sep #$0e
$07:c655  5d 2d 00      eor $002d,x
$07:c658  00 12         brk #$12
$07:c65a  1e 68 02      asl $0268,x
$07:c65d  4e 21 e2      lsr $e221
$07:c660  0e 01 e2      asl $e201
$07:c663  f5 64         sbc $64,x
$07:c665  30 40         bmi $c6a7
$07:c667  ef 00 fe cd   sbc $cdfe00
$07:c66b  dd ee 54      cmp $54ee,x
$07:c66e  d1 45         cmp ($45),y
$07:c670  66 65         ror $65
$07:c672  51 03         eor ($03),y
$07:c674  b2 d6         lda ($d6)
$07:c676  68            pla
$07:c677  e5 d2         sbc $d2
$07:c679  e2 01         sep #$01
$07:c67b  f2 f0         sbc ($f0)
$07:c67d  c2 03         rep #$03
$07:c67f  54 1d 50      mvn $50,$1d
$07:c682  31 14         and ($14),y
$07:c684  24 43         bit $43
$07:c686  3a            dec a
$07:c687  bd 54 c0      lda $c054,x
$07:c68a  b3 d5         lda ($d5,s),y
$07:c68c  51 1b         eor ($1b),y
$07:c68e  21 33         and ($33,x)
$07:c690  d2 58         cmp ($58)
$07:c692  e3 4e         sbc $4e,s
$07:c694  3d 22 f1      and $f122,x
$07:c697  5c 13 b5 54   jml $54b513
$07:c69b  1f a1 e2 ec   ora $ece2a1,x
$07:c69f  4f 20 e0 d9   eor $d9e020
$07:c6a3  68            pla
$07:c6a4  00 4f         brk #$4f
$07:c6a6  2d 5b 5f      and $5f5b
$07:c6a9  22 c3 fd 58   jsl $58fdc3
$07:c6ad  5a            phy
$07:c6ae  02 44         cop #$44
$07:c6b0  d2 d5         cmp ($d5)
$07:c6b2  12 e2         ora ($e2)
$07:c6b4  20 54 f5      jsr $f554
$07:c6b7  e5 ef         sbc $ef
$07:c6b9  7b            tdc
$07:c6ba  3e 42 22      rol $2242,x
$07:c6bd  e1 54         sbc ($54,x)
$07:c6bf  32 3c         and ($3c)
$07:c6c1  fd dc cb      sbc $cbdc,x
$07:c6c4  de 24 56      dec $5624,x
$07:c6c7  64 01         stz $01
$07:c6c9  42 12         wdm #$12
$07:c6cb  04 12         tsb $12
$07:c6cd  11 03         ora ($03),y
$07:c6cf  02 64         cop #$64
$07:c6d1  11 0f         ora ($0f),y
$07:c6d3  1a            inc a
$07:c6d4  fe ef fe      inc $feef,x
$07:c6d7  2f ff 68 10   and $1068ff
$07:c6db  11 f0         ora ($f0),y
$07:c6dd  10 f2         bpl $c6d1
$07:c6df  4e f0 02      lsr $02f0
$07:c6e2  58            cli
$07:c6e3  01 10         ora ($10,x)
$07:c6e5  b7 c0         lda [$c0],y
$07:c6e7  2f 4a 6c 6c   and $6c6c4a
$07:c6eb  64 41         stz $41
$07:c6ed  40            rti
$07:c6ee  11 22         ora ($22),y
$07:c6f0  13 2f         ora ($2f,s),y
$07:c6f2  0f 11 54 f1   ora $f15411
$07:c6f6  f0 f3         beq $c6eb
$07:c6f8  54 13 e3      mvn $e3,$13
$07:c6fb  fe cd 54      inc $54cd,x
$07:c6fe  dc 2b 6e      jml [$6e2b]
$07:c701  51 32         eor ($32),y
$07:c703  35 23         and $23,x
$07:c705  64 54         stz $54
$07:c707  13 1f         ora ($1f,s),y
$07:c709  ee 0c 21      inc $210c
$07:c70c  30 e0         bmi $c6ee
$07:c70e  ee 58 3f      inc $3f58
$07:c711  f6 2c         inc $2c,x
$07:c713  7e 13 d0      ror $d013,x
$07:c716  e5 b3         sbc $b3
$07:c718  54 3c ac      mvn $ac,$3c
$07:c71b  b1 14         lda ($14),y
$07:c71d  35 d3         and $d3,x
$07:c71f  02 42         cop #$42
$07:c721  58            cli
$07:c722  ce 30 14      dec $1430
$07:c725  4d 00 12      eor $1200
$07:c728  f6 93         inc $93,x
$07:c72a  64 ef         stz $ef
$07:c72c  f1 15         sbc ($15),y
$07:c72e  f2 d0         sbc ($d0)
$07:c730  e0 12 ff      cpx #$ff12
$07:c733  68            pla
$07:c734  2f 1f f2 f0   and $f0f21f
$07:c738  40            rti
$07:c739  1f 2f e1 58   ora $58e12f,x
$07:c73d  f3 f1         sbc ($f1,s),y
$07:c73f  2e 11 d2      rol $d211
$07:c742  02 5e         cop #$5e
$07:c744  6b            rtl
$07:c745  64 60         stz $60
$07:c747  00 f1         brk #$f1
$07:c749  ff fe 00 11   sbc $1100fe,x
$07:c74d  14 68         trb $68
$07:c74f  f1 e0         sbc ($e0),y
$07:c751  d3 e4         cmp ($e4,s),y
$07:c753  00 31         brk #$31
$07:c755  d0 20         bne $c777
$07:c757  58            cli
$07:c758  e2 c4         sep #$c4
$07:c75a  30 1d         bmi $c779
$07:c75c  e2 34         sep #$34
$07:c75e  f0 5e         beq $c7be
$07:c760  58            cli
$07:c761  4e a3 c3      lsr $c3a3
$07:c764  40            rti
$07:c765  d0 20         bne $c787
$07:c767  f2 3e         sbc ($3e)
$07:c769  54 33 31      mvn $31,$33
$07:c76c  2e 1e 01      rol $011e
$07:c76f  32 0e         and ($0e)
$07:c771  44 54 50      mvp $50,$54
$07:c774  50 33         bvc $c7a9
$07:c776  41 30         eor ($30,x)
$07:c778  43 22         eor $22,s
$07:c77a  0f 54 13 0c   ora $0c1354
$07:c77e  ee 11 32      inc $3211
$07:c781  32 00         and ($00)
$07:c783  3d 54 3f      and $3f54,x
$07:c786  02 e1         cop #$e1
$07:c788  11 3d         ora ($3d),y
$07:c78a  6e 01 46      ror $4601
$07:c78d  54 23 c0      mvn $c0,$23
$07:c790  f0 32         beq $c7c4
$07:c792  4f cf f2 60   eor $60f2cf
$07:c796  54 4d 01      mvn $01,$4d
$07:c799  34 42         bit $42,x
$07:c79b  16 90         asl $90,x
$07:c79d  4e 1c 64      lsr $641c
$07:c7a0  f0 ff         beq $c7a1
$07:c7a2  0f e3 f1 f2   ora $f2f1e3
$07:c7a6  02 14         cop #$14
$07:c7a8  54 32 43      mvn $43,$32
$07:c7ab  03 32         ora $32,s
$07:c7ad  42 21         wdm #$21
$07:c7af  20 22 54      jsr $5422
$07:c7b2  62 22 e1      per $a8d7
$07:c7b5  ee bc d0      inc $d0bc
$07:c7b8  21 05         and ($05,x)
$07:c7ba  54 34 3f      mvn $3f,$34
$07:c7bd  ff 31 11 ee   sbc $ee1131,x
$07:c7c1  01 ff         ora ($ff,x)
$07:c7c3  54 13 12      mvn $12,$13
$07:c7c6  e2 2e         sep #$2e
$07:c7c8  2d 00 00      and $0000
$07:c7cb  32 58         and ($58)
$07:c7cd  06 0f         asl $0f
$07:c7cf  02 c2         cop #$c2
$07:c7d1  12 f2         ora ($f2)
$07:c7d3  f5 0c         sbc $0c,x
$07:c7d5  64 0c         stz $0c
$07:c7d7  2f ff ef 1f   and $1fefff
$07:c7db  fe 0f 11      inc $110f,x
$07:c7de  54 53 66      mvn $66,$53
$07:c7e1  43 02         eor $02,s
$07:c7e3  1b            tcs
$07:c7e4  31 11         and ($11),y
$07:c7e6  11 58         ora ($58),y
$07:c7e8  11 2f         ora ($2f),y
$07:c7ea  21 c5         and ($c5,x)
$07:c7ec  fd 31 e3      sbc $e331,x
$07:c7ef  0b            phd
$07:c7f0  64 f0         stz $f0
$07:c7f2  12 01         ora ($01)
$07:c7f4  22 53 12 d1   jsl $d11253
$07:c7f8  e0 54         cpx #$54
$07:c7fa  df c0 bf c3   cmp $c3bfc0,x
$07:c7fe  20 55 52      jsr $5255
$07:c801  34 58         bit $58,x
$07:c803  3f 0f 41 f4   and $f4410f,x
$07:c807  b4 d2         ldy $d2,x
$07:c809  e2 03         sep #$03
$07:c80b  54 0d 3e      mvn $3e,$0d
$07:c80e  12 40         ora ($40)
$07:c810  4d 1c f1      eor $f11c
$07:c813  d1 64         cmp ($64),y
$07:c815  0e 00 f2      asl $f200
$07:c818  f5 23         sbc $23,x
$07:c81a  43 31         eor $31,s
$07:c81c  11 58         ora ($58),y
$07:c81e  a4 f0         ldy $f0
$07:c820  30 e2         bmi $c804
$07:c822  13 e6         ora ($e6,s),y
$07:c824  0c 1f 58      tsb $581f
$07:c827  7b            tdc
$07:c828  7c 00 01      jmp ($0100,x)
$07:c82b  d7 c1         cmp [$c1],y
$07:c82d  01 31         ora ($31,x)
$07:c82f  54 f0 d1      mvn $d1,$f0
$07:c832  01 05         ora ($05,x)
$07:c834  32 4f         and ($4f)
$07:c836  3f 56 54 e3   and $e35456,x
$07:c83a  03 11         ora $11,s
$07:c83c  27 22         and [$22]
$07:c83e  11 13         ora ($13),y
$07:c840  31 58         and ($58),y
$07:c842  c1 20         cmp ($20,x)
$07:c844  4e e3 e2      lsr $e2e3
$07:c847  13 f2         ora ($f2,s),y
$07:c849  0d 54 11      ora $1154
$07:c84c  42 34         wdm #$34
$07:c84e  20 7b 30      jsr $307b
$07:c851  b1 1c         lda ($1c),y
$07:c853  54 03 15      mvn $15,$03
$07:c856  4e 2f 01      lsr $012f
$07:c859  ed ff 35      sbc $35ff
$07:c85c  64 34         stz $34
$07:c85e  f1 0f         sbc ($0f),y
$07:c860  4d 20 00      eor $0020
$07:c863  00 12         brk #$12
$07:c865  68            pla
$07:c866  ff 02 2e 4f   sbc $4f2e02,x
$07:c86a  c3 f0         cmp $f0,s
$07:c86c  13 1e         ora ($1e,s),y
$07:c86e  64 22         stz $22
$07:c870  03 11         ora $11,s
$07:c872  0f d0 d0 f1   ora $f1d0d0
$07:c876  01 54         ora ($54,x)
$07:c878  ef e3 52 1e   sbc $1e52e3
$07:c87c  d1 12         cmp ($12),y
$07:c87e  f4 01 54      pea $5401
$07:c881  12 67         ora ($67)
$07:c883  52 31         eor ($31)
$07:c885  00 cd         brk #$cd
$07:c887  d2 b0         cmp ($b0)
$07:c889  64 00         stz $00
$07:c88b  1f 1d 22 40   ora $40221d,x
$07:c88f  10 20         bpl $c8b1
$07:c891  10 54         bpl $c8e7
$07:c893  3f 20 30 53   and $533020,x
$07:c897  40            rti
$07:c898  10 f3         bpl $c88d
$07:c89a  2f 54 62 4e   and $4e6254
$07:c89e  65 3f         adc $3f
$07:c8a0  0c c0 02      tsb $02c0
$07:c8a3  d2 68         cmp ($68)
$07:c8a5  e0 3d         cpx #$3d
$07:c8a7  40            rti
$07:c8a8  f3 d2         sbc ($d2,s),y
$07:c8aa  ff 2e 3d 58   sbc $583d2e,x
$07:c8ae  f3 11         sbc ($11,s),y
$07:c8b0  5c 5f 41 d0   jml $d0415f
$07:c8b4  2f 00 54 c1   and $c15400
$07:c8b8  ce ae 10      dec $10ae
$07:c8bb  05 13         ora $13
$07:c8bd  06 ef         asl $ef
$07:c8bf  54 1b ed      mvn $ed,$1b
$07:c8c2  d1 e3         cmp ($e3),y
$07:c8c4  61 6e         adc ($6e,x)
$07:c8c6  32 31         and ($31)
$07:c8c8  58            cli
$07:c8c9  42 c5         wdm #$c5
$07:c8cb  df 5e 7c 4d   cmp $4d7c5e,x
$07:c8cf  32 f3         and ($f3)
$07:c8d1  54 5e 1b      mvn $1b,$5e
$07:c8d4  00 d3         brk #$d3
$07:c8d6  00 1d         brk #$1d
$07:c8d8  1f 41 54 12   ora $125441,x
$07:c8dc  df eb fb 2f   cmp $2ffbeb,x
$07:c8e0  f5 05         sbc $05,x
$07:c8e2  f2 58         sbc ($58)
$07:c8e4  e5 0d         sbc $0d
$07:c8e6  3c 10 05      bit $0510,x
$07:c8e9  2e f3 f3      rol $f3f3
$07:c8ec  54 f6 00      mvn $00,$f6
$07:c8ef  d6 05         dec $05,x
$07:c8f1  fd 49 2e      sbc $2e49,x
$07:c8f4  f0 44         beq $c93a
$07:c8f6  44 f1 2b      mvp $2b,$f1
$07:c8f9  20 13 35      jsr $3513
$07:c8fc  0f 2e 54 22   ora $22542e
$07:c900  72 36         adc ($36)
$07:c902  26 f4         rol $f4
$07:c904  20 74 41      jsr $4174
$07:c907  54 14 33      mvn $33,$14
$07:c90a  f3 00         sbc ($00,s),y
$07:c90c  fd ce b2      sbc $b2ce,x
$07:c90f  ff 54 e0 0f   sbc $0fe054,x
$07:c913  1c 0d 01      trb $010d
$07:c916  c2 1e         rep #$1e
$07:c918  00 64         brk #$64
$07:c91a  0f 30 22 10   ora $102230
$07:c91e  11 31         ora ($31),y
$07:c920  42 22         wdm #$22
$07:c922  54 44 10      mvn $10,$44
$07:c925  0d 3f 35      ora $353f
$07:c928  d3 20         cmp ($20,s),y
$07:c92a  c2 44         rep #$44
$07:c92c  05 ef         ora $ef
$07:c92e  dc e9 da      jml [$dae9]
$07:c931  f5 f2         sbc $f2,x
$07:c933  32 64         and ($64)
$07:c935  00 01         brk #$01
$07:c937  21 32         and ($32,x)
$07:c939  24 20         bit $20
$07:c93b  14 03         trb $03
$07:c93d  54 f2 01      mvn $01,$f2
$07:c940  f1 12         sbc ($12),y
$07:c942  03 1f         ora $1f,s
$07:c944  1c df 54      trb $54df
$07:c947  0d d4 c1      ora $c1d4
$07:c94a  9a            txs
$07:c94b  ec 03 d3      cpx $d303
$07:c94e  11 58         ora ($58),y
$07:c950  ff 20 2f 01   sbc $012f20,x
$07:c954  0f 23 d7 c3   ora $c3d723
$07:c958  54 65 12      mvn $12,$65
$07:c95b  f5 23         sbc $23,x
$07:c95d  41 22         eor ($22,x)
$07:c95f  24 f0         bit $f0
$07:c961  54 00 00      mvn $00,$00
$07:c964  bc a0 b1      ldy $b1a0,x
$07:c967  d2 21         cmp ($21)
$07:c969  2d 58 4b      and $4b58
$07:c96c  5d 3f 41      eor $413f,x
$07:c96f  b3 11         lda ($11,s),y
$07:c971  00 15         brk #$15
$07:c973  54 16 23      mvn $23,$16
$07:c976  2e 2f 40      rol $402f
$07:c979  1c f2 b3      trb $b3f2
$07:c97c  54 2e 2e      mvn $2e,$2e
$07:c97f  01 c1         ora ($c1,x)
$07:c981  df ed e2 ee   cmp $eee2ed,x
$07:c985  58            cli
$07:c986  13 e2         ora ($e2,s),y
$07:c988  e2 f3         sep #$f3
$07:c98a  0e 3d 26      asl $263d
$07:c98d  d3 58         cmp ($58,s),y
$07:c98f  e4 1c         cpx $1c
$07:c991  6d 5e 13      adc $135e
$07:c994  e5 ff         sbc $ff
$07:c996  5c 54 31 20   jml $203154
$07:c99a  dd df 0a      cmp $0adf,x
$07:c99d  cd ca fc      cmp $fcca
$07:c9a0  54 0f 04      mvn $04,$0f
$07:c9a3  f5 0f         sbc $0f,x
$07:c9a5  41 04         eor ($04,x)
$07:c9a7  13 20         ora ($20,s),y
$07:c9a9  64 4f         stz $4f
$07:c9ab  31 34         and ($34),y
$07:c9ad  22 10 1f 03   jsl $031f10
$07:c9b1  01 54         ora ($54,x)
$07:c9b3  1c 41 3f      trb $3f41
$07:c9b6  00 0f         brk #$0f
$07:c9b8  fe 0b 12      inc $120b,x
$07:c9bb  44 cd ff      mvp $ff,$cd
$07:c9be  40            rti
$07:c9bf  51 42         eor ($42),y
$07:c9c1  04 05         tsb $05
$07:c9c3  41 58         eor ($58,x)
$07:c9c5  3e 11 60      rol $6011,x
$07:c9c8  f3 ff         sbc ($ff,s),y
$07:c9ca  3e 05 f1      rol $f105,x
$07:c9cd  54 e1 12      mvn $12,$e1
$07:c9d0  f3 13         sbc ($13,s),y
$07:c9d2  f0 cc         beq $c9a0
$07:c9d4  ce fc 58      dec $58fc
$07:c9d7  1b            tcs
$07:c9d8  61 02         adc ($02,x)
$07:c9da  e1 ff         sbc ($ff,x)
$07:c9dc  12 d2         ora ($d2)
$07:c9de  e4 68         cpx $68
$07:c9e0  d2 10         cmp ($10)
$07:c9e2  f0 30         beq $ca14
$07:c9e4  02 c4         cop #$c4
$07:c9e6  f2 ff         sbc ($ff)
$07:c9e8  44 33 1c      mvp $1c,$33
$07:c9eb  c2 a2         rep #$a2
$07:c9ed  11 60         ora ($60),y
$07:c9ef  6e 6f 54      ror $546f
$07:c9f2  31 e2         and ($e2),y
$07:c9f4  b1 fc         lda ($fc),y
$07:c9f6  fd 1f d6      sbc $d61f,x
$07:c9f9  e3 58         sbc $58,s
$07:c9fb  f1 ff         sbc ($ff),y
$07:c9fd  23 ff         and $ff,s
$07:c9ff  21 30         and ($30,x)
$07:ca01  1e 41 54      asl $5441,x
$07:ca04  04 f2         tsb $f2
$07:ca06  e2 fe         sep #$fe
$07:ca08  f0 22         beq $ca2c
$07:ca0a  0f 01 54 f1   ora $f15401
$07:ca0e  ec bd de      cpx $debd
$07:ca11  c2 d3         rep #$d3
$07:ca13  f0 30         beq $ca45
$07:ca15  54 55 03      mvn $03,$55
$07:ca18  e3 43         sbc $43,s
$07:ca1a  41 44         eor ($44,x)
$07:ca1c  12 45         ora ($45)
$07:ca1e  54 24 23      mvn $23,$24
$07:ca21  32 25         and ($25)
$07:ca23  f4 04 e0      pea $e004
$07:ca26  01 54         ora ($54,x)
$07:ca28  1d 1d fe      ora $fe1d,x
$07:ca2b  0e c5 e1      asl $e1c5
$07:ca2e  1d 2e 64      ora $642e,x
$07:ca31  00 f1         brk #$f1
$07:ca33  f2 d1         sbc ($d1)
$07:ca35  22 23 14 22   jsl $221423
$07:ca39  54 13 25      mvn $25,$13
$07:ca3c  10 11         bpl $ca4f
$07:ca3e  d6 e1         dec $e1,x
$07:ca40  e2 13         sep #$13
$07:ca42  54 1e c0      mvn $c0,$1e
$07:ca45  b2 dc         lda ($dc)
$07:ca47  0d 1f f1      ora $f11f
$07:ca4a  00 58         brk #$58
$07:ca4c  d7 d1         cmp [$d1],y
$07:ca4e  01 f2         ora ($f2,x)
$07:ca50  1f 6c 20 ff   ora $ff206c,x
$07:ca54  54 42 14      mvn $14,$42
$07:ca57  13 14         ora ($14,s),y
$07:ca59  e4 2f         cpx $2f
$07:ca5b  41 43         eor ($43,x)
$07:ca5d  54 21 e1      mvn $e1,$21
$07:ca60  cf 0d d9 be   cmp $bed90d
$07:ca64  ec 4d 64      cpx $644d
$07:ca67  20 20 11      jsr $1120
$07:ca6a  10 10         bpl $ca7c
$07:ca6c  f0 1f         beq $ca8d
$07:ca6e  42 64         wdm #$64
$07:ca70  04 05         tsb $05
$07:ca72  12 32         ora ($32)
$07:ca74  11 20         ora ($20),y
$07:ca76  12 11         ora ($11)
$07:ca78  54 0e fd      mvn $fd,$0e
$07:ca7b  c1 be         cmp ($be,x)
$07:ca7d  b0 dd         bcs $ca5c
$07:ca7f  e0 f3         cpx #$f3
$07:ca81  54 33 36      mvn $36,$33
$07:ca84  e6 0f         inc $0f
$07:ca86  1e 3f 4f      asl $4f3f,x
$07:ca89  30 54         bmi $cadf
$07:ca8b  25 25         and $25
$07:ca8d  43 42         eor $42,s
$07:ca8f  54 23 c2      mvn $c2,$23
$07:ca92  f2 54         sbc ($54)
$07:ca94  c5 ef         cmp $ef
$07:ca96  21 02         and ($02,x)
$07:ca98  ef 1b 3c d5   sbc $d53c1b
$07:ca9c  54 a1 23      mvn $23,$a1
$07:ca9f  22 fe fd 03   jsl $03fdfe
$07:caa3  10 0f         bpl $cab4
$07:caa5  64 31         stz $31
$07:caa7  4f 33 21 22   eor $222133
$07:caab  30 20         bmi $cacd
$07:caad  00 54         brk #$54
$07:caaf  02 d1         cop #$d1
$07:cab1  bf ef e5 c3   lda $c3e5ef,x
$07:cab5  e3 15         sbc $15,s
$07:cab7  54 d4 ed      mvn $ed,$d4
$07:caba  3d 11 32      and $3211,x
$07:cabd  02 00         cop #$00
$07:cabf  3f 54 27 44   and $442754,x
$07:cac3  16 13         asl $13,x
$07:cac5  30 22         bmi $cae9
$07:cac7  c5 c1         cmp $c1
$07:cac9  54 2f 3d      mvn $3d,$2f
$07:cacc  40            rti
$07:cacd  3c 2e 1e      bit $1e2e,x
$07:cad0  03 f3         ora $f3,s
$07:cad2  54 00 2e      mvn $2e,$00
$07:cad5  d2 e1         cmp ($e1)
$07:cad7  1f 0d 4d 71   ora $714d0d,x
$07:cadb  58            cli
$07:cadc  23 c7         and $c7,s
$07:cade  dd 6c 21      cmp $216c,x
$07:cae1  39 7e 32      and $327e,y
$07:cae4  54 e6 30      mvn $30,$e6
$07:cae7  1d 13 c0      ora $c013,x
$07:caea  00 02         brk #$02
$07:caec  01 48         ora ($48,x)
$07:caee  e2 01         sep #$01
$07:caf0  0b            phd
$07:caf1  53 4e         eor ($4e,s),y
$07:caf3  02 c3         cop #$c3
$07:caf5  17 54         ora [$54],y
$07:caf7  25 11         and $11
$07:caf9  12 23         ora ($23)
$07:cafb  33 20         and ($20,s),y
$07:cafd  5e 10 54      lsr $5410,x
$07:cb00  2e 32 3f      rol $3f32
$07:cb03  23 f6         and $f6,s
$07:cb05  20 22 e1      jsr $e122
$07:cb08  54 be ef      mvn $ef,$be
$07:cb0b  3d 10 e5      and $e510,x
$07:cb0e  c3 d3         cmp $d3,s
$07:cb10  22 64 20 12   jsl $122064
$07:cb14  00 00         brk #$00
$07:cb16  21 11         and ($11,x)
$07:cb18  01 f5         ora ($f5,x)
$07:cb1a  54 d4 11      mvn $11,$d4
$07:cb1d  f6 a4         inc $a4,x
$07:cb1f  ee 44 1e      inc $1e44
$07:cb22  11 58         ora ($58),y
$07:cb24  0f 10 10 3d   ora $3d1010
$07:cb28  3f 12 02 f1   and $f10212,x
$07:cb2c  58            cli
$07:cb2d  69 1e         adc #$1e
$07:cb2f  30 00         bmi $cb31
$07:cb31  6f e4 c2 02   adc $02c2e4
$07:cb35  54 2f 4f      mvn $4f,$2f
$07:cb38  41 44         eor ($44,x)
$07:cb3a  10 01         bpl $cb3d
$07:cb3c  f1 01         sbc ($01),y
$07:cb3e  44 c0 d3      mvp $d3,$c0
$07:cb41  22 04 ff 37   jsl $37ff04
$07:cb45  3f 50 54 00   and $005450,x
$07:cb49  31 10         and ($10),y
$07:cb4b  3e 10 31      rol $3110,x
$07:cb4e  00 04         brk #$04
$07:cb50  64 20         stz $20
$07:cb52  4f 11 ff 01   eor $01ff11
$07:cb56  00 0f         brk #$0f
$07:cb58  10 54         bpl $cbae
$07:cb5a  40            rti
$07:cb5b  22 5d 5e 1e   jsl $1e5e5d
$07:cb5f  32 23         and ($23)
$07:cb61  22 54 f2 31   jsl $31f254
$07:cb65  23 e4         and $e4,s
$07:cb67  f1 22         sbc ($22),y
$07:cb69  11 f4         ora ($f4),y
$07:cb6b  44 b6 05      mvp $05,$b6
$07:cb6e  07 10         ora [$10]
$07:cb70  4a            lsr a
$07:cb71  6c e2 10      jmp ($10e2)
$07:cb74  44 b1 f6      mvp $f6,$b1
$07:cb77  94 c2         sty $c2,x
$07:cb79  d1 e3         cmp ($e3),y
$07:cb7b  f6 47         inc $47,x
$07:cb7d  54 40 41      mvn $41,$40
$07:cb80  10 11         bpl $cb93
$07:cb82  01 c2         ora ($c2,x)
$07:cb84  22 53 68 03   jsl $036853
$07:cb88  ef 3f 1e 3f   sbc $3f1e3f
$07:cb8c  1f 02 2c 54   ora $542c02,x
$07:cb90  61 2b         adc ($2b,x)
$07:cb92  2f ee 0f 12   and $120fee
$07:cb96  22 12 54 13   jsl $135412
$07:cb9a  d2 c4         cmp ($c4)
$07:cb9c  e1 0f         sbc ($0f,x)
$07:cb9e  13 e7         ora ($e7,s),y
$07:cba0  e4 54         cpx $54
$07:cba2  24 f2         bit $f2
$07:cba4  2e 4e 25      rol $254e
$07:cba7  c2 e0         rep #$e0
$07:cba9  1e 54 f3      asl $f354,x
$07:cbac  01 3f         ora ($3f,x)
$07:cbae  41 14         eor ($14,x)
$07:cbb0  01 22         ora ($22,x)
$07:cbb2  f3 54         sbc ($54,s),y
$07:cbb4  00 3f         brk #$3f
$07:cbb6  20 5e 3f      jsr $3f5e
$07:cbb9  30 32         bmi $cbed
$07:cbbb  2f 64 4f 01   and $014f64
$07:cbbf  e2 f3         sep #$f3
$07:cbc1  01 f0         ora ($f0,x)
$07:cbc3  01 f1         ora ($f1,x)
$07:cbc5  54 1d 50      mvn $50,$1d
$07:cbc8  31 3f         and ($3f),y
$07:cbca  11 02         ora ($02),y
$07:cbcc  23 0e         and $0e,s
$07:cbce  54 3c 4e      mvn $4e,$3c
$07:cbd1  f2 e1         sbc ($e1)
$07:cbd3  11 14         ora ($14),y
$07:cbd5  12 5f         ora ($5f)
$07:cbd7  54 0f 02      mvn $02,$0f
$07:cbda  11 30         ora ($30),y
$07:cbdc  11 3f         ora ($3f),y
$07:cbde  2e 2d 58      rol $582d
$07:cbe1  5f 2f 6a 4c   eor $4c6a2f,x
$07:cbe5  43 d2         eor $d2,s
$07:cbe7  e3 1e         sbc $1e,s
$07:cbe9  54 f1 02      mvn $02,$f1
$07:cbec  03 e6         ora $e6,s
$07:cbee  d6 1f         dec $1f,x
$07:cbf0  f2 04         sbc ($04)
$07:cbf2  54 f3 10      mvn $10,$f3
$07:cbf5  4e 20 0c      lsr $0c20
$07:cbf8  0d 4e 11      ora $114e
$07:cbfb  58            cli
$07:cbfc  3c 30 11      bit $1130,x
$07:cbff  c4 e2         cpy $e2
$07:cc01  03 e5         ora $e5,s
$07:cc03  b1 64         lda ($64),y
$07:cc05  02 01         cop #$01
$07:cc07  05 d1         ora $d1
$07:cc09  00 10         brk #$10
$07:cc0b  03 e2         ora $e2,s
$07:cc0d  54 0f 4e      mvn $4e,$0f
$07:cc10  4e ff 11      lsr $11ff
$07:cc13  ff 1d 13 54   sbc $54131d,x
$07:cc17  33 12         and ($12,s),y
$07:cc19  03 f2         ora $f2,s
$07:cc1b  1e e1 04      asl $04e1,x
$07:cc1e  13 54         ora ($54,s),y
$07:cc20  3f 5f 31 34   and $34315f,x
$07:cc24  03 1f         ora $1f,s
$07:cc26  01 4f         ora ($4f,x)
$07:cc28  64 4e         stz $4e
$07:cc2a  2f 13 0f 1e   and $1e0f13
$07:cc2e  0d 2f 01      ora $012f
$07:cc31  55 f2         eor $f2,x
$07:cc33  01 3f         ora ($3f,x)
$07:cc35  50 32         bvc $cc69
$07:cc37  f0 3f         beq $cc78
$07:cc39  30 b2         bmi $cbed
$07:cc3b  05 02         ora $02
$07:cc3d  00 00         brk #$00
$07:cc3f  00 00         brk #$00
$07:cc41  00 00         brk #$00
$07:cc43  00 00         brk #$00
$07:cc45  b6 04         ldx $04,y
$07:cc47  11 b0         ora ($b0),y
$07:cc49  1e 10 bf      asl $bf10,x
$07:cc4c  f2 e3         sbc ($e3)
$07:cc4e  b2 ff         lda ($ff)
$07:cc50  f0 be         beq $cc10
$07:cc52  d2 04         cmp ($04)
$07:cc54  0f 1d d0 b2   ora $b2d01d
$07:cc58  f1 f2         sbc ($f2),y
$07:cc5a  51 24         eor ($24),y
$07:cc5c  1e 40 f4      asl $f440,x
$07:cc5f  1e b2 1e      asl $1eb2,x
$07:cc62  21 13         and ($13,x)
$07:cc64  dd dd eb      cmp $ebdd,x
$07:cc67  ca            dex
$07:cc68  de b6 2e      dec $2eb6,x
$07:cc6b  24 d1         bit $d1
$07:cc6d  3d e5 f1      and $f1e5,x
$07:cc70  e0 2f         cpx #$2f
$07:cc72  b2 00         lda ($00)
$07:cc74  dd 1d 00      cmp $001d,x
$07:cc77  1d 1d 10      ora $101d,x
$07:cc7a  c1 b2         cmp ($b2,x)
$07:cc7c  2d f5 ef      and $eff5
$07:cc7f  0f dd 20 04   ora $0420dd
$07:cc83  1c b2 13      trb $13b2
$07:cc86  ff 3e dd 2f   sbc $2fdd3e,x
$07:cc8a  f2 20         sbc ($20)
$07:cc8c  02 b2         cop #$b2
$07:cc8e  f1 31         sbc ($31),y
$07:cc90  3f 1f c0 1c   and $1cc01f,x
$07:cc94  ee 10 c2      inc $c210
$07:cc97  f2 d2         sbc ($d2)
$07:cc99  40            rti
$07:cc9a  10 ef         bpl $cc8b
$07:cc9c  f2 12         sbc ($12)
$07:cc9e  20 b2 11      jsr $11b2
$07:cca1  11 3f         ora ($3f),y
$07:cca3  1c 91 ff      trb $ff91
$07:cca6  e3 f2         sbc $f2,s
$07:cca8  b2 33         lda ($33)
$07:ccaa  13 df         ora ($df,s),y
$07:ccac  c2 dd         rep #$dd
$07:ccae  3f 03 f3 c2   and $c2f303,x
$07:ccb2  0e 31 1f      asl $1f31
$07:ccb5  12 df         ora ($df)
$07:ccb7  0d e0 fd      ora $fde0
$07:ccba  c2 03         rep #$03
$07:ccbc  cf 2e df 20   cmp $20df2e
$07:ccc0  e3 3f         sbc $3f,s
$07:ccc2  21 b2         and ($b2,x)
$07:ccc4  5f 11 00 1f   eor $1f0011,x
$07:ccc8  b1 1a         lda ($1a),y
$07:ccca  c5 0f         cmp $0f
$07:cccc  b2 74         lda ($74)
$07:ccce  3f f2 ae cd   and $cdaef2,x
$07:ccd2  aa            tax
$07:ccd3  9c 02 b2      stz $b202
$07:ccd6  f0 10         beq $cce8
$07:ccd8  e6 e3         inc $e3
$07:ccda  f2 56         sbc ($56)
$07:ccdc  31 42         and ($42),y
$07:ccde  c2 f0         rep #$f0
$07:cce0  cf 0f 0f f1   cmp $f10f0f
$07:cce4  11 20         ora ($20),y
$07:cce6  f1 b2         sbc ($b2),y
$07:cce8  f2 03         sbc ($03)
$07:ccea  1e e9 cb      asl $cbe9,x
$07:cced  5c 2c 1a c2   jml $c21a2c
$07:ccf1  10 20         bpl $cd13
$07:ccf3  20 0e 2e      jsr $2e0e
$07:ccf6  e2 ee         sep #$ee
$07:ccf8  d1 b2         cmp ($b2),y
$07:ccfa  15 04         ora $04,x
$07:ccfc  ed 3f 63      sbc $633f
$07:ccff  22 41 0f b6   jsl $b60f41
$07:cd03  e5 da         sbc $da
$07:cd05  40            rti
$07:cd06  ef 5e 1c 5f   sbc $5f1c5e
$07:cd0a  c7 b6         cmp [$b6]
$07:cd0c  3d 4e ee      and $ee4e,x
$07:cd0f  4b            phk
$07:cd10  e3 ff         sbc $ff,s
$07:cd12  a4 2f         ldy $2f
$07:cd14  b2 b2         lda ($b2)
$07:cd16  d0 03         bne $cd1b
$07:cd18  03 51         ora $51,s
$07:cd1a  22 0c d0 c2   jsl $c2d00c
$07:cd1e  fe 2e 10      inc $102e,x
$07:cd21  f0 11         beq $cd34
$07:cd23  17 f2         ora [$f2],y
$07:cd25  10 c2         bpl $cce9
$07:cd27  01 ff         ora ($ff,x)
$07:cd29  f2 cd         sbc ($cd)
$07:cd2b  00 cf         brk #$cf
$07:cd2d  0e 00 b2      asl $b200
$07:cd30  24 14         bit $14
$07:cd32  fd 1d e1      sbc $e11d,x
$07:cd35  e2 a3         sep #$a3
$07:cd37  6f c2 ee 4c   adc $4ceec2
$07:cd3b  f4 ef 23      pea $23ef
$07:cd3e  d0 ec         bne $cd2c
$07:cd40  12 b2         ora ($b2)
$07:cd42  0e 26 e0      asl $e026
$07:cd45  34 12         bit $12,x
$07:cd47  16 ee         asl $ee,x
$07:cd49  21 c2         and ($c2,x)
$07:cd4b  f0 0f         beq $cd5c
$07:cd4d  03 ef         ora $ef,s
$07:cd4f  30 e1         bmi $cd32
$07:cd51  0b            phd
$07:cd52  1c c2 f1      trb $f1c2
$07:cd55  ef c4 0f 11   sbc $110fc4
$07:cd59  e3 0e         sbc $0e,s
$07:cd5b  01 a2         ora ($a2,x)
$07:cd5d  95 fe         sta $fe,x
$07:cd5f  1d 2d e3      ora $e32d,x
$07:cd62  3c 1f 06      bit $061f,x
$07:cd65  b2 ed         lda ($ed)
$07:cd67  01 1c         ora ($1c,x)
$07:cd69  3e 00 10      rol $1000,x
$07:cd6c  0d e1 b2      ora $b2e1
$07:cd6f  c4 d2         cpy $d2
$07:cd71  03 c0         ora $c0,s
$07:cd73  e4 d2         cpx $d2
$07:cd75  5d 01 b2      eor $b201,x
$07:cd78  d0 d1         bne $cd4b
$07:cd7a  fe 12 d3      inc $d312,x
$07:cd7d  01 e3         ora ($e3,x)
$07:cd7f  de a2 d5      dec $d5a2,x
$07:cd82  ad 3e e6      lda $e63e
$07:cd85  1b            tcs
$07:cd86  40            rti
$07:cd87  0c 23 b2      tsb $b223
$07:cd8a  ce 3d 2e      dec $2e3d
$07:cd8d  22 2f 3b 3d   jsl $3d3b2f
$07:cd91  c1 b2         cmp ($b2,x)
$07:cd93  ec 20 01      cpx $0120
$07:cd96  f4 c3 4b      pea $4bc3
$07:cd99  34 fe         bit $fe,x
$07:cd9b  b2 30         lda ($30)
$07:cd9d  d1 5c         cmp ($5c),y
$07:cd9f  e3 dd         sbc $dd,s
$07:cda1  3f d1 0d b2   and $b20dd1,x
$07:cda5  f3 0d         sbc ($0d,s),y
$07:cda7  15 b4         ora $b4,x
$07:cda9  d3 f4         cmp ($f4,s),y
$07:cdab  ef e7 b2 cf   sbc $cfb2e7
$07:cdaf  3f c3 e2 f0   and $f0e2c3,x
$07:cdb3  0d 20 c0      ora $c020
$07:cdb6  b2 3e         lda ($3e)
$07:cdb8  12 10         ora ($10)
$07:cdba  d3 f0         cmp ($f0,s),y
$07:cdbc  4d e3 ee      eor $eee3
$07:cdbf  b2 01         lda ($01)
$07:cdc1  e2 e0         sep #$e0
$07:cdc3  f2 2c         sbc ($2c)
$07:cdc5  30 c3         bmi $cd8a
$07:cdc7  4b            phk
$07:cdc8  b2 5d         lda ($5d)
$07:cdca  3d 12 df      and $df12,x
$07:cdcd  5d f2 e0      eor $e0f2,x
$07:cdd0  f3 a2         sbc ($a2,s),y
$07:cdd2  f4 b2 a4      pea $a4b2
$07:cdd5  a2 c2 1f      ldx #$1fc2
$07:cdd8  d3 cf         cmp ($cf,s),y
$07:cdda  b2 f3         lda ($f3)
$07:cddc  2d 30 3d      and $3d30
$07:cddf  10 01         bpl $cde2
$07:cde1  0e 4c b2      asl $b24c
$07:cde4  02 e6         cop #$e6
$07:cde6  ef fe 2e e5   sbc $e52efe
$07:cdea  d0 0d         bne $cdf9
$07:cdec  b2 1f         lda ($1f)
$07:cdee  2f 20 0f e5   and $e50f20
$07:cdf2  d2 1d         cmp ($1d)
$07:cdf4  1c b2 4d      trb $4db2
$07:cdf7  f2 d2         sbc ($d2)
$07:cdf9  f2 b5         sbc ($b5)
$07:cdfb  f2 12         sbc ($12)
$07:cdfd  0d b2 3e      ora $3eb2
$07:ce00  1b            tcs
$07:ce01  32 b2         and ($b2)
$07:ce03  e1 e4         sbc ($e4,x)
$07:ce05  f2 31         sbc ($31)
$07:ce07  b2 b5         lda ($b5)
$07:ce09  e0 a1 2e      cpx #$2ea1
$07:ce0c  d5 c2         cmp $c2,x
$07:ce0e  11 e1         ora ($e1),y
$07:ce10  b2 1d         lda ($1d)
$07:ce12  e4 fc         cpx $fc
$07:ce14  32 f0         and ($f0)
$07:ce16  20 4d 5d      jsr $5d4d
$07:ce19  b2 1d         lda ($1d)
$07:ce1b  2f 12 c4 0f   and $0fc412
$07:ce1f  d3 a5         cmp ($a5,s),y
$07:ce21  d1 c2         cmp ($c2),y
$07:ce23  00 00         brk #$00
$07:ce25  01 ff         ora ($ff,x)
$07:ce27  01 ff         ora ($ff,x)
$07:ce29  4d 20 b2      eor $b220
$07:ce2c  ed ff 20      sbc $20ff
$07:ce2f  50 b7         bvc $cde8
$07:ce31  ed 33 c1      sbc $c133
$07:ce34  b2 f2         lda ($f2)
$07:ce36  c1 b3         cmp ($b3,x)
$07:ce38  c1 ef         cmp ($ef,x)
$07:ce3a  51 d5         eor ($d5),y
$07:ce3c  0d a2 2c      ora $2ca2
$07:ce3f  e0 ed 7e      cpx #$7eed
$07:ce42  19 3f e0      ora $e03f,y
$07:ce45  0f b2 ff ef   ora $efffb2
$07:ce49  0d 02 0f      ora $0f02
$07:ce4c  50 01         bvc $ce4f
$07:ce4e  f2 c2         sbc ($c2)
$07:ce50  f0 1d         beq $ce6f
$07:ce52  02 fe         cop #$fe
$07:ce54  3e f0 0e      rol $0ef0,x
$07:ce57  01 b2         ora ($b2,x)
$07:ce59  4b            phk
$07:ce5a  22 c1 20 ef   jsl $ef20c1
$07:ce5e  f1 e2         sbc ($e2),y
$07:ce60  cf b2 2e f2   cmp $f22eb2
$07:ce64  2c 32 30      bit $3032
$07:ce67  6b            rtl
$07:ce68  32 cb         and ($cb)
$07:ce6a  b2 03         lda ($03)
$07:ce6c  c2 fe         rep #$fe
$07:ce6e  c1 4c         cmp ($4c,x)
$07:ce70  24 b3         bit $b3
$07:ce72  10 b2         bpl $ce26
$07:ce74  c3 e0         cmp $e0,s
$07:ce76  01 ff         ora ($ff,x)
$07:ce78  5c 3e 00 c2   jml $c2003e
$07:ce7c  b2 d0         lda ($d0)
$07:ce7e  c2 ff         rep #$ff
$07:ce80  00 13         brk #$13
$07:ce82  21 d4         and ($d4,x)
$07:ce84  0a            asl a
$07:ce85  b2 31         lda ($31)
$07:ce87  c1 1f         cmp ($1f,x)
$07:ce89  c3 fd         cmp $fd,s
$07:ce8b  3f 0e 3f b2   and $b23f0e,x
$07:ce8f  d3 fe         cmp ($fe,s),y
$07:ce91  e2 ef         sep #$ef
$07:ce93  e2 d4         sep #$d4
$07:ce95  c1 1d         cmp ($1d,x)
$07:ce97  b2 3d         lda ($3d)
$07:ce99  21 e4         and ($e4,x)
$07:ce9b  d6 fe         dec $fe,x
$07:ce9d  f1 d0         sbc ($d0),y
$07:ce9f  20 b2 ff      jsr $ffb2
$07:cea2  00 d2         brk #$d2
$07:cea4  1d 11 d1      ora $d111,x
$07:cea7  f3 0e         sbc ($0e,s),y
$07:cea9  b2 f0         lda ($f0)
$07:ceab  c4 20         cpy $20
$07:cead  e0 f2         cpx #$f2
$07:ceaf  4a            lsr a
$07:ceb0  6d 0f c2      adc $c20f
$07:ceb3  2f 31 20 0f   and $0f2031
$07:ceb7  e2 00         sep #$00
$07:ceb9  1f 3c c2 00   ora $00c23c,x
$07:cebd  ff 12 d4 f1   sbc $f1d412,x
$07:cec1  02 1d         cop #$1d
$07:cec3  4f c2 12 1e   eor $1e12c2
$07:cec7  2d 30 d1      and $d130
$07:ceca  d1 0f         cmp ($0f),y
$07:cecc  1f b2 e5 d0   ora $d0e5b2,x
$07:ced0  d6 d1         dec $d1,x
$07:ced2  3d 2f 31      and $312f,x
$07:ced5  e2 b2         sep #$b2
$07:ced7  0d 3c 2d      ora $2d3c
$07:ceda  00 0b         brk #$0b
$07:cedc  31 cf         and ($cf),y
$07:cede  4d b2 61      eor $61b2
$07:cee1  00 12         brk #$12
$07:cee3  c2 de         rep #$de
$07:cee5  c1 c1         cmp ($c1,x)
$07:cee7  c7 c2         cmp [$c2]
$07:cee9  d3 fe         cmp ($fe,s),y
$07:ceeb  1f 3f f2 ef   ora $eff23f,x
$07:ceef  00 20         brk #$20
$07:cef1  c2 2e         rep #$2e
$07:cef3  10 f0         bpl $cee5
$07:cef5  11 fc         ora ($fc),y
$07:cef7  02 d5         cop #$d5
$07:cef9  e1 b2         sbc ($b2,x)
$07:cefb  c2 ef         rep #$ef
$07:cefd  0c 1e 50      tsb $501e
$07:cf00  c4 e1         cpy $e1
$07:cf02  3b            tsc
$07:cf03  a2 3f f6      ldx #$f63f
$07:cf06  d1 dd         cmp ($dd),y
$07:cf08  47 de         eor [$de]
$07:cf0a  4b            phk
$07:cf0b  4f b2 ff 2d   eor $2dffb2
$07:cf0f  2d 2d 03      and $032d
$07:cf12  1f b2 03 c2   ora $c203b2,x
$07:cf16  2e f1 0f      rol $0ff1
$07:cf19  1d 2d 03      ora $032d,x
$07:cf1c  b1 3f         lda ($3f),y
$07:cf1e  c6 20         dec $20
$07:cf20  e1 03         sbc ($03,x)
$07:cf22  c0 30 b5      cpy #$b530
$07:cf25  fc 5e b2      jsr ($b25e,x)
$07:cf28  3e 3e d2      rol $d23e,x
$07:cf2b  f1 f4         sbc ($f4),y
$07:cf2d  ee 14 bd      inc $bd14
$07:cf30  b2 5d         lda ($5d)
$07:cf32  11 b4         ora ($b4),y
$07:cf34  c6 b2         dec $b2
$07:cf36  11 e0         ora ($e0),y
$07:cf38  4e b2 04      lsr $04b2
$07:cf3b  a2 0d 0f      ldx #$0f0d
$07:cf3e  4b            phk
$07:cf3f  04 2b         tsb $2b
$07:cf41  30 b2         bmi $cef5
$07:cf43  11 00         ora ($00),y
$07:cf45  c5 d0         cmp $d0
$07:cf47  f2 d2         sbc ($d2)
$07:cf49  0d ff b2      ora $b2ff
$07:cf4c  2e d1 df      rol $dfd1
$07:cf4f  5e 22 20      lsr $2022,x
$07:cf52  14 94         trb $94
$07:cf54  b2 ed         lda ($ed)
$07:cf56  4c 1e 00      jmp $001e
$07:cf59  ce 7e 4e      dec $4e7e
$07:cf5c  6d c2 f2      adc $f2c2
$07:cf5f  0e 3e 0f      asl $0f3e
$07:cf62  5e d2 e1      lsr $e1d2,x
$07:cf65  11 b2         ora ($b2),y
$07:cf67  f2 3e         sbc ($3e)
$07:cf69  0f 19 03 ce   ora $ce0319
$07:cf6d  4d 02 b2      eor $b202
$07:cf70  0e 5f 33      asl $335f
$07:cf73  00 3d         brk #$3d
$07:cf75  30 e3         bmi $cf5a
$07:cf77  b2 b2         lda ($b2)
$07:cf79  cc 5b 0d      cpy $0d5b
$07:cf7c  3f e2 20 30   and $3020e2,x
$07:cf80  e1 b2         sbc ($b2,x)
$07:cf82  10 e4         bpl $cf68
$07:cf84  1b            tcs
$07:cf85  1f c1 f4 2c   ora $2cf4c1,x
$07:cf89  2f b2 2e 4a   and $4a2eb2
$07:cf8d  1f cf 10 5b   ora $5b10cf,x
$07:cf91  5e fd c2      lsr $c2fd,x
$07:cf94  1e e2 02      asl $02e2,x
$07:cf97  c1 0f         cmp ($0f,x)
$07:cf99  f2 20         sbc ($20)
$07:cf9b  40            rti
$07:cf9c  b2 1d         lda ($1d)
$07:cf9e  7b            tdc
$07:cf9f  32 c0         and ($c0)
$07:cfa1  d2 1d         cmp ($1d)
$07:cfa3  3c f2 b2      bit $b2f2,x
$07:cfa6  cc 3b 2f      cpy $2f3b
$07:cfa9  2b            pld
$07:cfaa  02 ef         cop #$ef
$07:cfac  13 ff         ora ($ff,s),y
$07:cfae  b2 20         lda ($20)
$07:cfb0  c3 b4         cmp $b4,s
$07:cfb2  b2 f0         lda ($f0)
$07:cfb4  10 1f         bpl $cfd5
$07:cfb6  15 b2         ora $b2,x
$07:cfb8  cf 13 d2 15   cmp $15d213
$07:cfbc  a3 1f         lda $1f,s
$07:cfbe  12 f5         ora ($f5)
$07:cfc0  c2 f0         rep #$f0
$07:cfc2  e0 d4 c0      cpx #$c0d4
$07:cfc5  1e e3 01      asl $01e3,x
$07:cfc8  f1 c2         sbc ($c2),y
$07:cfca  e0 d0 e0      cpx #$e0d0
$07:cfcd  5c 02 d2 10   jml $10d202
$07:cfd1  1d b2 2b      ora $2bb2,x
$07:cfd4  2e 00 5d      rol $5d00
$07:cfd7  02 02         cop #$02
$07:cfd9  e2 d1         sep #$d1
$07:cfdb  b2 1f         lda ($1f)
$07:cfdd  0f ed 3f 0e   ora $0e3fed
$07:cfe1  34 d5         bit $d5,x
$07:cfe3  f1 b2         sbc ($b2),y
$07:cfe5  3d ff 2e      and $2eff,x
$07:cfe8  d2 3b         cmp ($3b)
$07:cfea  0f 4b 22 b2   ora $b2224b
$07:cfee  df 5b 3c 6c   cmp $6c3c5b,x
$07:cff2  24 ea         bit $ea
$07:cff4  5e 2b b2      lsr $b22b,x
$07:cff7  22 d0 f1 f1   jsl $f1f1d0
$07:cffb  20 ee 1d      jsr $1dee
$07:cffe  6f b2 1d 6b   adc $6b1db2
$07:d002  0e 4b 40      asl $404b
$07:d005  f1 a1         sbc ($a1),y
$07:d007  1f c2 01 f0   ora $f001c2,x
$07:d00b  e4 ff         cpx $ff
$07:d00d  1f ff 10 d3   ora $d310ff,x
$07:d011  b2 c2         lda ($c2)
$07:d013  b6 a4         ldx $a4,y
$07:d015  f5 a3         sbc $a3,x
$07:d017  1c 3e ff      trb $ff3e
$07:d01a  b2 3d         lda ($3d)
$07:d01c  3f 3c e1 ed   and $ede13c,x
$07:d020  51 e1         eor ($e1),y
$07:d022  ff b2 d3 e0   sbc $e0d3b2,x
$07:d026  f0 ef         beq $d017
$07:d028  11 c2         ora ($c2),y
$07:d02a  0b            phd
$07:d02b  1d b2 4d      ora $4db2,x
$07:d02e  12 ff         ora ($ff)
$07:d030  0e 3f 3b      asl $3b3f
$07:d033  22 d3 c2 1c   jsl $1cc2d3
$07:d037  3f 21 f3 ef   and $eff321,x
$07:d03b  4d f0 1d      eor $1df0
$07:d03e  b2 e3         lda ($e3)
$07:d040  b2 24         lda ($24)
$07:d042  d0 3c         bne $d080
$07:d044  02 2c         cop #$2c
$07:d046  10 b2         bpl $cffa
$07:d048  cf 1d 6d 1f   cmp $1f6d1d
$07:d04c  f3 d5         sbc ($d5,s),y
$07:d04e  1c 1d b2      trb $b21d
$07:d051  0f 21 a3 1c   ora $1ca321
$07:d055  f1 3e         sbc ($3e),y
$07:d057  17 9f         ora [$9f],y
$07:d059  b2 3d         lda ($3d)
$07:d05b  1b            tcs
$07:d05c  3e e4 fe      rol $fee4,x
$07:d05f  1f 0e 40 b2   ora $b2400e,x
$07:d063  c3 c4         cmp $c4,s
$07:d065  f0 12         beq $d079
$07:d067  d0 d1         bne $d03a
$07:d069  f0 4f         beq $d0ba
$07:d06b  b2 c0         lda ($c0)
$07:d06d  2e 3f 0e      rol $0e3f
$07:d070  22 a1 21 df   jsl $df21a1
$07:d074  b2 1e         lda ($1e)
$07:d076  e6 b3         inc $b3
$07:d078  df 0f 3c d6   cmp $d63c0f,x
$07:d07c  a1 b2         lda ($b2,x)
$07:d07e  1f 2b 4c f5   ora $f54c2b,x
$07:d082  c4 f4         cpy $f4
$07:d084  2a            rol a
$07:d085  60            rts
$07:d086  b2 b6         lda ($b6)
$07:d088  eb            xba
$07:d089  ff 0d e3 ff   sbc $ffe30d,x
$07:d08d  40            rti
$07:d08e  12 b2         ora ($b2)
$07:d090  23 d5         and $d5,s
$07:d092  fc 5d 11      jsr ($115d,x)
$07:d095  0d ff 2c      ora $2cff
$07:d098  b2 2f         lda ($2f)
$07:d09a  f4 0d 71      pea $710d
$07:d09d  e0 3e         cpx #$3e
$07:d09f  b5 ed         lda $ed,x
$07:d0a1  b2 e1         lda ($e1)
$07:d0a3  ad 3f c4      lda $c43f
$07:d0a6  21 d4         and ($d4,x)
$07:d0a8  1f 04 b2 d3   ora $d3b204,x
$07:d0ac  ef 2c 3d d3   sbc $d33d2c
$07:d0b0  df 5b 3c b2   cmp $b23c5b,x
$07:d0b4  1d e2 f0      ora $f0e2,x
$07:d0b7  4d 03 3e      eor $3e03
$07:d0ba  01 1e         ora ($1e,x)
$07:d0bc  b6 04         ldx $04,y
$07:d0be  de 6a 24      dec $246a,x
$07:d0c1  cd 51 b2      cmp $b251
$07:d0c4  02 b2         cop #$b2
$07:d0c6  b2 1f         lda ($1f)
$07:d0c8  13 03         ora ($03,s),y
$07:d0ca  20 1e 2b      jsr $2b1e
$07:d0cd  d4 b2         pei ($b2)
$07:d0cf  c2 32         rep #$32
$07:d0d1  2b            pld
$07:d0d2  60            rts
$07:d0d3  d6 de         dec $de,x
$07:d0d5  02 de         cop #$de
$07:d0d7  b2 3e         lda ($3e)
$07:d0d9  d0 00         bne $d0db
$07:d0db  ff 2f 1d b5   sbc $b51d2f,x
$07:d0df  f2 b2         sbc ($b2)
$07:d0e1  01 0d         ora ($0d,x)
$07:d0e3  31 d2         and ($d2),y
$07:d0e5  fd 10 0c      sbc $0c10,x
$07:d0e8  31 b2         and ($b2),y
$07:d0ea  de 4e e1      dec $e14e,x
$07:d0ed  2f d4 ed 4e   and $4eedd4
$07:d0f1  c3 b2         cmp $b2,s
$07:d0f3  e1 0f         sbc ($0f,x)
$07:d0f5  4c d3 d0      jmp $d0d3
$07:d0f8  12 11         ora ($11)
$07:d0fa  3d b6 7c      and $7cb6,x
$07:d0fd  e3 d2         sbc $d2,s
$07:d0ff  f2 1d         sbc ($1d)
$07:d101  10 e2         bpl $d0e5
$07:d103  f2 b2         sbc ($b2)
$07:d105  d1 33         cmp ($33),y
$07:d107  02 01         cop #$01
$07:d109  1e 1d 3c      asl $3c1d,x
$07:d10c  0f b2 ed 29   ora $29edb2
$07:d110  4f 0f 21 2d   eor $2d210f
$07:d114  31 f1         and ($f1),y
$07:d116  b2 0c         lda ($0c)
$07:d118  2e 0f 1f      rol $1f0f
$07:d11b  b0 10         bcs $d12d
$07:d11d  f2 11         sbc ($11)
$07:d11f  b2 f2         lda ($f2)
$07:d121  2d 22 2d      and $2d22
$07:d124  2f 03 ef e1   and $e1ef03
$07:d128  b2 2b         lda ($2b)
$07:d12a  20 e1 e2      jsr $e2e1
$07:d12d  fe 11 3f      inc $3f11,x
$07:d130  d3 b2         cmp ($b2,s),y
$07:d132  df f0 e2 ff   cmp $ffe2f0,x
$07:d136  e2 fc         sep #$fc
$07:d138  41 db         eor ($db,x)
$07:d13a  b2 4f         lda ($4f)
$07:d13c  0e 3f 12      asl $123f
$07:d13f  d0 20         bne $d161
$07:d141  f0 0c         beq $d14f
$07:d143  b2 c3         lda ($c3)
$07:d145  ee f2 ee      inc $eef2
$07:d148  2b            pld
$07:d149  f1 cd         sbc ($cd),y
$07:d14b  f1 b2         sbc ($b2),y
$07:d14d  1c 41 c1      trb $c141
$07:d150  20 1f 4b      jsr $4b1f
$07:d153  21 d0         and ($d0,x)
$07:d155  b2 0e         lda ($0e)
$07:d157  0f 01 d2 2d   ora $2dd201
$07:d15b  ff f1 e4 a2   sbc $a2e4f1,x
$07:d15f  0e 4c 00      asl $004c
$07:d162  e0 4b         cpx #$4b
$07:d164  ef df 22 c2   sbc $c222df
$07:d168  f0 ff         beq $d169
$07:d16a  02 0e         cop #$0e
$07:d16c  20 b0 2e      jsr $2eb0
$07:d16f  11 b2         ora ($b2),y
$07:d171  2b            pld
$07:d172  21 bf         and ($bf,x)
$07:d174  6d e6 fc      adc $fce6
$07:d177  23 f0         and $f0,s
$07:d179  b2 3f         lda ($3f)
$07:d17b  e1 1f         sbc ($1f,x)
$07:d17d  02 de         cop #$de
$07:d17f  3f c6 1e b2   and $b21ec6,x
$07:d183  10 00         bpl $d185
$07:d185  0f 2f 1d 10   ora $101d2f
$07:d189  fe 41 b2      inc $b241,x
$07:d18c  d5 e3         cmp $e3,x
$07:d18e  02 2d         cop #$2d
$07:d190  03 e1         ora $e1,s
$07:d192  3b            tsc
$07:d193  f3 b2         sbc ($b2,s),y
$07:d195  ff f2 e0 01   sbc $01e0f2,x
$07:d199  04 2f         tsb $2f
$07:d19b  14 c1         trb $c1
$07:d19d  b2 5d         lda ($5d)
$07:d19f  10 f0         bpl $d191
$07:d1a1  fc 3d 10      jsr ($103d,x)
$07:d1a4  ee 4f b2      inc $b24f
$07:d1a7  c6 f2         dec $f2
$07:d1a9  e3 f1         sbc $f1,s
$07:d1ab  22 c1 1b f5   jsl $f51bc1
$07:d1af  b2 c1         lda ($c1)
$07:d1b1  10 fd         bpl $d1b0
$07:d1b3  2d f1 00      and $00f1
$07:d1b6  2f 0e b2 10   and $10b20e
$07:d1ba  f3 a1         sbc ($a1,s),y
$07:d1bc  1f 02 ef f2   ora $f2ef02,x
$07:d1c0  ef b2 e4 0f   sbc $0fe4b2
$07:d1c4  0e 1f 02      asl $021f
$07:d1c7  2e 0f 03      rol $030f
$07:d1ca  b2 dc         lda ($dc)
$07:d1cc  f0 0c         beq $d1da
$07:d1ce  4f 10 0f 0e   eor $0e0f10
$07:d1d2  f2 b2         sbc ($b2)
$07:d1d4  c4 d2         cpy $d2
$07:d1d6  03 c0         ora $c0,s
$07:d1d8  f5 d1         sbc $d1,x
$07:d1da  4c 02 b2      jmp $b202
$07:d1dd  e0 d1         cpx #$d1
$07:d1df  fe 12 d3      inc $d312,x
$07:d1e2  01 e3         ora ($e3,x)
$07:d1e4  de a3 d5      dec $d5a3,x
$07:d1e7  ad 3e e5      lda $e53e
$07:d1ea  0b            phd
$07:d1eb  51 1c         eor ($1c),y
$07:d1ed  24 9b         bit $9b
$07:d1ef  04 02         tsb $02
$07:d1f1  00 00         brk #$00
$07:d1f3  00 00         brk #$00
$07:d1f5  00 00         brk #$00
$07:d1f7  00 00         brk #$00
$07:d1f9  c6 00         dec $00
$07:d1fb  02 2e         cop #$2e
$07:d1fd  cf ff 52 d3   cmp $d352ff
$07:d201  1d c2 01      ora $01c2,x
$07:d204  dd 00 34      cmp $3400,x
$07:d207  21 ec         and ($ec,x)
$07:d209  0f 06 c2 1e   ora $1ec206
$07:d20d  0c be 0f      tsb $0fbe
$07:d210  15 2e         ora $2e,x
$07:d212  44 c1 c2      mvp $c2,$c1
$07:d215  5f 05 1d ed   eor $ed1d05,x
$07:d219  ce 21 23      dec $2321
$07:d21c  20 c2 df      jsr $dfc2
$07:d21f  ee 1f e1      inc $e11f
$07:d222  1d 31 c2      ora $c231,x
$07:d225  2d c2 22      and $22c2
$07:d228  c1 1c         cmp ($1c,x)
$07:d22a  00 05         brk #$05
$07:d22c  1d 0c a2      ora $a20c,x
$07:d22f  c6 1f         dec $1f
$07:d231  6c c3 bd      jmp ($bdc3)
$07:d234  5f e6 0e 0d   eor $0d0ee6,x
$07:d238  c6 e3         dec $e3
$07:d23a  32 fe         and ($fe)
$07:d23c  ec 24 03      cpx $0324
$07:d23f  3a            dec a
$07:d240  e2 c6         sep #$c6
$07:d242  c0 4e         cpy #$4e
$07:d244  f5 0d         sbc $0d,x
$07:d246  2d d2 13      and $13d2
$07:d249  3d c6 0e      and $0ec6,x
$07:d24c  b5 1e         lda $1e,x
$07:d24e  62 ce 3d      per $101f
$07:d251  a4 4d         ldy $4d
$07:d253  c2 f6         rep #$f6
$07:d255  09 10 b0      ora #$b010
$07:d258  20 34 2f      jsr $2f34
$07:d25b  ed b2 aa      sbc $aab2
$07:d25e  e3 e1         sbc $e1,s
$07:d260  4d 06 1f      eor $1f06
$07:d263  7c a5 c2      jmp ($c2a5,x)
$07:d266  ee 40 f4      inc $f440
$07:d269  00 3f         brk #$3f
$07:d26b  00 ae         brk #$ae
$07:d26d  20 c6 32      jsr $32c6
$07:d270  a0 19 43      ldy #$4319
$07:d273  c5 4c         cmp $4c
$07:d275  02 af         cop #$af
$07:d277  c6 3f         dec $3f
$07:d279  44 cc f1      mvp $f1,$cc
$07:d27c  02 6d         cop #$6d
$07:d27e  b2 dc         lda ($dc)
$07:d280  c2 01         rep #$01
$07:d282  e4 4f         cpx $4f
$07:d284  23 dd         and $dd,s
$07:d286  0d 15 21      ora $2115
$07:d289  c6 dd         dec $dd
$07:d28b  31 35         and ($35),y
$07:d28d  ae 2c d3      ldx $d32c
$07:d290  3d 46 d2      and $d246,x
$07:d293  1f ff d0 40   ora $40d0ff,x
$07:d297  13 ff         ora ($ff,s),y
$07:d299  1f f0 c6 01   ora $01c6f0,x
$07:d29d  10 1f         bpl $d2be
$07:d29f  e1 ef         sbc ($ef,x)
$07:d2a1  4f c1 2d c6   eor $c62dc1
$07:d2a5  53 b3         eor ($b3,s),y
$07:d2a7  0b            phd
$07:d2a8  31 c2         and ($c2),y
$07:d2aa  ee 40 15      inc $1540
$07:d2ad  c6 cd         dec $cd
$07:d2af  1c e6 0f      trb $0fe6
$07:d2b2  6c e5 cd      jmp ($cde5)
$07:d2b5  30 c2         bmi $d279
$07:d2b7  e3 4f         sbc $4f,s
$07:d2b9  0e ae 22      asl $22ae
$07:d2bc  12 1b         ora ($1b)
$07:d2be  e2 d2         sep #$d2
$07:d2c0  f1 3f         sbc ($3f),y
$07:d2c2  f1 de         sbc ($de),y
$07:d2c4  1f f3 20 20   ora $2020f3,x
$07:d2c8  d2 de         cmp ($de)
$07:d2ca  f0 22         beq $d2ee
$07:d2cc  1e 3f 1f      asl $1f3f,x
$07:d2cf  02 1f         cop #$1f
$07:d2d1  d2 0e         cmp ($0e)
$07:d2d3  ce 01 23      dec $2301
$07:d2d6  0c 00 d1      tsb $d100
$07:d2d9  0e c2 23      asl $23c2
$07:d2dc  11 0e         ora ($0e),y
$07:d2de  ed e0 01      sbc $01e0
$07:d2e1  10 14         bpl $d2f7
$07:d2e3  c6 0f         dec $0f
$07:d2e5  2b            pld
$07:d2e6  c4 f0         cpy $f0
$07:d2e8  4e 02 e2      lsr $e202
$07:d2eb  0c c2 ff      tsb $ffc2
$07:d2ee  bf 21 44 f0   lda $f04421,x
$07:d2f2  0b            phd
$07:d2f3  f0 be         beq $d2b3
$07:d2f5  c6 4f         dec $4f
$07:d2f7  01 bf         ora ($bf,x)
$07:d2f9  5f 15 dc 01   eor $01dc15,x
$07:d2fd  e1 d2         sbc ($d2,x)
$07:d2ff  32 02         and ($02)
$07:d301  0d 11 f3      ora $f311
$07:d304  2f 11 ef c6   and $c6ef11
$07:d308  2c 36 fc      bit $fc36
$07:d30b  df 02 36 cc   cmp $cc3602,x
$07:d30f  3d c6 b1      and $b1c6,x
$07:d312  32 52         and ($52)
$07:d314  dd de e3      cmp $e3de,x
$07:d317  7b            tdc
$07:d318  16 c2         asl $c2,x
$07:d31a  e0 6e         cpx #$6e
$07:d31c  df ed 12 11   cmp $1112ed,x
$07:d320  10 f1         bpl $d313
$07:d322  c6 0e         dec $0e
$07:d324  d0 2f         bne $d355
$07:d326  44 e0 fd      mvp $fd,$e0
$07:d329  00 01         brk #$01
$07:d32b  c6 c1         dec $c1
$07:d32d  40            rti
$07:d32e  13 bd         ora ($bd,s),y
$07:d330  2d 14 d0      and $d014
$07:d333  4e c2 f2      lsr $f2c2
$07:d336  1e 00 f4      asl $f400,x
$07:d339  4f 00 be 21   eor $21be00
$07:d33d  c2 01         rep #$01
$07:d33f  1c f2 e1      trb $e1f2
$07:d342  6e e2 9c      ror $9ce2
$07:d345  3e c2 06      rol $06c2,x
$07:d348  30 30         bmi $d37a
$07:d34a  bb            tyx
$07:d34b  03 45         ora $45,s
$07:d34d  21 cd         and ($cd,x)
$07:d34f  c6 4d         dec $4d
$07:d351  53 ee         eor ($ee,s),y
$07:d353  cb            wai
$07:d354  01 25         ora ($25,x)
$07:d356  21 ec         and ($ec,x)
$07:d358  c2 10         rep #$10
$07:d35a  b3 19         lda ($19,s),y
$07:d35c  13 01         ora ($01,s),y
$07:d35e  4f e2 0d c6   eor $c60de2
$07:d362  11 d2         ora ($d2),y
$07:d364  32 2f         and ($2f)
$07:d366  0c d0 02      tsb $02d0
$07:d369  11 c2         ora ($c2),y
$07:d36b  32 14         and ($14)
$07:d36d  1e ff d1      asl $d1ff,x
$07:d370  20 42 e2      jsr $e242
$07:d373  c2 2f         rep #$2f
$07:d375  01 0f         ora ($0f,x)
$07:d377  20 f0 bc      jsr $bcf0
$07:d37a  10 04         bpl $d380
$07:d37c  c2 1e         rep #$1e
$07:d37e  00 ee         brk #$ee
$07:d380  31 e1         and ($e1),y
$07:d382  ea            nop
$07:d383  11 d6         ora ($d6),y
$07:d385  c6 eb         dec $eb
$07:d387  4c b3 20      jmp $20b3
$07:d38a  33 0d         and ($0d,s),y
$07:d38c  ee c3 d2      inc $d2c3
$07:d38f  f1 10         sbc ($10),y
$07:d391  1d df f2      ora $f2df,x
$07:d394  42 11         wdm #$11
$07:d396  ff c2 de ff   sbc $ffdec2,x
$07:d39a  04 ee         tsb $ee
$07:d39c  70 c1         bvs $d35f
$07:d39e  1c 13 c2      trb $c213
$07:d3a1  ce 20 05      dec $0520
$07:d3a4  2f 0d bc 02   and $02bc0d
$07:d3a8  33 c2         and ($c2,s),y
$07:d3aa  01 fc         ora ($fc,x)
$07:d3ac  f0 d0         beq $d37e
$07:d3ae  21 23         and ($23,x)
$07:d3b0  ff 1c c6 13   sbc $13c61c,x
$07:d3b4  d1 1f         cmp ($1f),y
$07:d3b6  f0 1e         beq $d3d6
$07:d3b8  42 e4         wdm #$e4
$07:d3ba  eb            xba
$07:d3bb  c2 ef         rep #$ef
$07:d3bd  cf 20 01 1e   cmp $1e0120
$07:d3c1  02 f0         cop #$f0
$07:d3c3  3e c2 e1      rol $e1c2,x
$07:d3c6  ad 1e 35      lda $351e
$07:d3c9  22 0d bb cd   jsl $cdbb0d
$07:d3cd  d2 14         cmp ($14)
$07:d3cf  31 f0         and ($f0),y
$07:d3d1  0e 33 12      asl $1233
$07:d3d4  fc ee c2      jsr ($c2ee,x)
$07:d3d7  b1 33         lda ($33),y
$07:d3d9  23 2f         and $2f,s
$07:d3db  d1 5c         cmp ($5c),y
$07:d3dd  f3 de         sbc ($de,s),y
$07:d3df  c2 60         rep #$60
$07:d3e1  c4 1d         cpy $1d
$07:d3e3  11 bd         ora ($bd),y
$07:d3e5  1e 15 41      asl $4115,x
$07:d3e8  c6 fc         dec $fc
$07:d3ea  e5 f2         sbc $f2
$07:d3ec  4e 02 ce      lsr $ce02
$07:d3ef  1e 04 c2      asl $c204,x
$07:d3f2  0e 20 e0      asl $e020
$07:d3f5  12 22         ora ($22)
$07:d3f7  32 3f         and ($3f)
$07:d3f9  ce c6 d2      dec $d2c6
$07:d3fc  4f f2 ef 2f   eor $2feff2
$07:d400  00 1e         brk #$1e
$07:d402  02 c2         cop #$c2
$07:d404  0f 22 05 1f   ora $1f0522
$07:d408  1b            tcs
$07:d409  cf ce 34 d2   cmp $d234ce
$07:d40d  22 20 dd 02   jsl $02dd20
$07:d411  00 1c         brk #$1c
$07:d413  e2 f0         sep #$f0
$07:d415  c6 5d         dec $5d
$07:d417  f3 ce         sbc ($ce,s),y
$07:d419  11 e2         ora ($e2),y
$07:d41b  3f eb 60 c2   and $c260eb,x
$07:d41f  c3 29         cmp $29,s
$07:d421  04 c0         tsb $c0
$07:d423  3f e3 30 30   and $3030e3,x
$07:d427  c2 ae         rep #$ae
$07:d429  0e 10 f2      asl $f210
$07:d42c  0f 0f f0 01   ora $01f00f
$07:d430  b6 4c         ldx $4c,y
$07:d432  f2 c0         sbc ($c0)
$07:d434  2d 15 ef      and $ef15
$07:d437  2c d0 b2      bit $b2d0
$07:d43a  f3 23         sbc ($23,s),y
$07:d43c  30 f1         bmi $d42f
$07:d43e  e0 0d         cpx #$0d
$07:d440  0e d0 b2      asl $b2d0
$07:d443  11 42         ora ($42),y
$07:d445  f0 0d         beq $d454
$07:d447  b0 fd         bcs $d446
$07:d449  46 26         lsr $26
$07:d44b  c2 3f         rep #$3f
$07:d44d  ee df 12      inc $12df
$07:d450  31 f1         and ($f1),y
$07:d452  0d 22 b2      ora $b222
$07:d455  d2 1b         cmp ($1b)
$07:d457  e1 cf         sbc ($cf,x)
$07:d459  32 35         and ($35)
$07:d45b  eb            xba
$07:d45c  ed b2 44      sbc $44b2
$07:d45f  04 fc         tsb $fc
$07:d461  2d 91 1e      and $1e91
$07:d464  46 fd         lsr $fd
$07:d466  b2 1b         lda ($1b)
$07:d468  b5 32         lda $32,x
$07:d46a  6f b0 c0 51   adc $51c0b0
$07:d46e  22 b2 dd 1d   jsl $1dddb2
$07:d472  02 d0         cop #$d0
$07:d474  0d 0d cf      ora $cf0d
$07:d477  01 b6         ora ($b6,x)
$07:d479  32 fc         and ($fc)
$07:d47b  c1 f1         cmp ($f1,x)
$07:d47d  42 e0         wdm #$e0
$07:d47f  ef 3e b2 13   sbc $13b23e
$07:d483  1f fb b1 00   ora $00b1fb,x
$07:d487  55 f2         eor $f2,x
$07:d489  3d c2 e0      and $e0c2,x
$07:d48c  dd 21 24      cmp $2421,x
$07:d48f  00 0d         brk #$0d
$07:d491  f1 ee         sbc ($ee),y
$07:d493  b2 3a         lda ($3a)
$07:d495  c7 1d         cmp [$1d]
$07:d497  34 f3         bit $f3,x
$07:d499  1a            inc a
$07:d49a  ee c5 c2      inc $c2c5
$07:d49d  41 2e         eor ($2e,x)
$07:d49f  cf e2 4e 03   cmp $034ee2
$07:d4a3  f1 3e         sbc ($3e),y
$07:d4a5  c2 d1         rep #$d1
$07:d4a7  31 44         and ($44),y
$07:d4a9  cd fc 04      cmp $04fc
$07:d4ac  02 1c         cop #$1c
$07:d4ae  b2 ed         lda ($ed)
$07:d4b0  c5 5d         cmp $5d
$07:d4b2  30 b1         bmi $d465
$07:d4b4  df 51 67 b6   cmp $b66751,x
$07:d4b8  dd cf f1      cmp $f1cf,x
$07:d4bb  55 f0         eor $f0,x
$07:d4bd  db            stp
$07:d4be  f2 13         sbc ($13)
$07:d4c0  c2 20         rep #$20
$07:d4c2  0e df 10      asl $10df
$07:d4c5  33 f0         and ($f0,s),y
$07:d4c7  fc d1 c2      jsr ($c2d1,x)
$07:d4ca  0f 00 f2 3d   ora $3df200
$07:d4ce  0f c2 20 32   ora $3220c2
$07:d4d2  c2 f1         rep #$f1
$07:d4d4  3f 11 bd 1f   and $1fbd11,x
$07:d4d8  e2 00         sep #$00
$07:d4da  41 c2         eor ($c2,x)
$07:d4dc  12 dc         ora ($dc)
$07:d4de  10 14         bpl $d4f4
$07:d4e0  00 ed         brk #$ed
$07:d4e2  20 d0 c2      jsr $c2d0
$07:d4e5  ed 22 0e      sbc $0e22
$07:d4e8  fd c4 30      sbc $30c4,x
$07:d4eb  40            rti
$07:d4ec  af c2 ee 52   lda $52eec2
$07:d4f0  23 dd         and $dd,s
$07:d4f2  2f 14 13 1d   and $1d1314
$07:d4f6  b6 3b         ldx $3b,y
$07:d4f8  f3 46         sbc ($46,s),y
$07:d4fa  00 ea         brk #$ea
$07:d4fc  c2 03         rep #$03
$07:d4fe  61 c2         adc ($c2,x)
$07:d500  21 ec         and ($ec,x)
$07:d502  ee 14 20      inc $2014
$07:d505  1d d1 02      ora $02d1,x
$07:d508  c2 32         rep #$32
$07:d50a  00 0f         brk #$0f
$07:d50c  f0 ee         beq $d4fc
$07:d50e  40            rti
$07:d50f  05 ed         ora $ed
$07:d511  c2 1f         rep #$1f
$07:d513  d0 fc         bne $d511
$07:d515  12 f3         ora ($f3)
$07:d517  3e 01 de      rol $de01,x
$07:d51a  c6 fd         dec $fd
$07:d51c  51 f4         eor ($f4),y
$07:d51e  1b            tcs
$07:d51f  10 b4         bpl $d4d5
$07:d521  21 1d         and ($1d,x)
$07:d523  c2 01         rep #$01
$07:d525  f2 2d         sbc ($2d)
$07:d527  ef 00 13 cc   sbc $cc1300
$07:d52b  1d c2 07      ora $07c2,x
$07:d52e  21 2b         and ($2b,x)
$07:d530  ef d4 3e 1e   sbc $1e3ed4
$07:d534  be c2 de      ldx $dec2,y
$07:d537  22 44 2f cd   jsl $cd2f44
$07:d53b  ef 24 33 c6   sbc $c63324
$07:d53f  ec 01 03      cpx $0301
$07:d542  2e 1e c1      rol $c11e
$07:d545  10 40         bpl $d587
$07:d547  c6 e2         dec $e2
$07:d549  d1 0f         cmp ($0f),y
$07:d54b  10 10         bpl $d55d
$07:d54d  f0 fb         beq $d54a
$07:d54f  43 c2         eor $c2,s
$07:d551  d2 4f         cmp ($4f)
$07:d553  03 10         ora $10,s
$07:d555  40            rti
$07:d556  c0 ed 0e      cpy #$0eed
$07:d559  c2 e2         rep #$e2
$07:d55b  14 61         trb $61
$07:d55d  01 cb         ora ($cb,x)
$07:d55f  0e d4 1f      asl $1fd4
$07:d562  c2 0e         rep #$0e
$07:d564  ff f1 ff 32   sbc $32fff1,x
$07:d568  32 00         and ($00)
$07:d56a  d2 c2         cmp ($c2)
$07:d56c  3f 32 ad fd   and $fdad32,x
$07:d570  52 e2         eor ($e2)
$07:d572  cd 0d c6      cmp $c60d
$07:d575  44 e1 fb      mvp $fb,$e1
$07:d578  f0 01         beq $d57b
$07:d57a  33 f0         and ($f0,s),y
$07:d57c  fc c6 e2      jsr ($e2c6,x)
$07:d57f  12 40         ora ($40)
$07:d581  ef cd 20 33   sbc $3320cd
$07:d585  f0 b2         beq $d539
$07:d587  2e ee b4      rol $b4ee
$07:d58a  31 4d         and ($4d),y
$07:d58c  a9 b1 43      lda #$43b1
$07:d58f  c6 3e         dec $3e
$07:d591  c3 dd         cmp $dd,s
$07:d593  40            rti
$07:d594  d3 3c         cmp ($3c,s),y
$07:d596  33 d1         and ($d1,s),y
$07:d598  c6 0e         dec $0e
$07:d59a  2f e2 dd 30   and $30dde2
$07:d59e  14 0c         trb $0c
$07:d5a0  22 c2 df 10   jsl $10dfc2
$07:d5a4  33 1f         and ($1f,s),y
$07:d5a6  e0 0e 0e      cpx #$0e0e
$07:d5a9  d0 c2         bne $d56d
$07:d5ab  03 1e         ora $1e,s
$07:d5ad  1f f5 30 2c   ora $2c30f5,x
$07:d5b1  e2 f5         sep #$f5
$07:d5b3  c6 0d         dec $0d
$07:d5b5  2c c1 f0      bit $f0c1
$07:d5b8  53 f0         eor ($f0,s),y
$07:d5ba  0d d1 c6      ora $c6d1
$07:d5bd  01 32         ora ($32,x)
$07:d5bf  ff ed 02 12   sbc $1202ed,x
$07:d5c3  2f 0e b2 dd   and $ddb20e
$07:d5c7  af 22 33 cb   lda $cb3322
$07:d5cb  dc 36 55      jml [$5536]
$07:d5ce  b6 ac         ldx $ac,y
$07:d5d0  2d 06 d3      and $d306
$07:d5d3  6b            rtl
$07:d5d4  f6 ba         inc $ba,x
$07:d5d6  6d b6 e4      adc $e4b6
$07:d5d9  c1 1c         cmp ($1c,x)
$07:d5db  13 e6         ora ($e6,s),y
$07:d5dd  4b            phk
$07:d5de  2f 9f b2 0d   and $0db29f
$07:d5e2  b6 30         ldx $30,y
$07:d5e4  3d bc f2      and $f2bc,x
$07:d5e7  12 40         ora ($40)
$07:d5e9  b2 24         lda ($24)
$07:d5eb  e0 cd         cpx #$cd
$07:d5ed  3f 02 be 3e   and $3ebe02,x
$07:d5f1  42 c6         wdm #$c6
$07:d5f3  d2 c0         cmp ($c0)
$07:d5f5  2e 43 f1      rol $f143
$07:d5f8  1c c0 01      trb $01c0
$07:d5fb  c6 43         dec $43
$07:d5fd  ff ee f1 21   sbc $21f1ee,x
$07:d601  21 ee         and ($ee,x)
$07:d603  0e b6 e3      asl $e3b6
$07:d606  41 14         eor ($14,x)
$07:d608  bd 0e 34      lda $340e,x
$07:d60b  20 ea b2      jsr $b2ea
$07:d60e  cc a0 31      cpy $31a0
$07:d611  45 f0         eor $f0
$07:d613  1b            tcs
$07:d614  d0 c0         bne $d5d6
$07:d616  b6 4b         ldx $4b,y
$07:d618  31 b4         and ($b4),y
$07:d61a  ff 3f e1 cc   sbc $cce13f,x
$07:d61e  4f b2 d3 40   eor $40d3b2
$07:d622  34 ce         bit $ce,x
$07:d624  0d 25 51      ora $5125
$07:d627  de b2 dd      dec $ddb2,x
$07:d62a  10 d2         bpl $d5fe
$07:d62c  02 4f         cop #$4f
$07:d62e  11 e0         ora ($e0),y
$07:d630  0d c2 0f      ora $0fc2
$07:d633  f0 03         beq $d638
$07:d635  21 3f         and ($3f,x)
$07:d637  cd cc 03      cmp $03cc
$07:d63a  c2 34         rep #$34
$07:d63c  3f cd f1 12   and $12f1cd,x
$07:d640  3e ef df      rol $dfef,x
$07:d643  b6 7d         ldx $7d,y
$07:d645  05 cc         ora $cc
$07:d647  0e d6 5f      asl $5fd6
$07:d64a  0a            asl a
$07:d64b  f0 b2         beq $d5ff
$07:d64d  af 41 46 fd   lda $fd4641
$07:d651  fc b1 2f      jsr ($2fb1,x)
$07:d654  55 b2         eor $b2,x
$07:d656  f1 fc         sbc ($fc),y
$07:d658  10 f4         bpl $d64e
$07:d65a  fe 0e e0      inc $e00e,x
$07:d65d  f0 b6         beq $d615
$07:d65f  5d 01 c0      eor $c001,x
$07:d662  3d 04 ef      and $ef04,x
$07:d665  2c d0 b2      bit $b2d0
$07:d668  f4 44 3f      pea $3f44
$07:d66b  e0 e0 0d      cpx #$0de0
$07:d66e  0e d0 b2      asl $b2d0
$07:d671  11 42         ora ($42),y
$07:d673  f0 0d         beq $d682
$07:d675  b0 fd         bcs $d674
$07:d677  46 26         lsr $26
$07:d679  c2 3f         rep #$3f
$07:d67b  ee df 12      inc $12df
$07:d67e  31 f0         and ($f0),y
$07:d680  fd 21 b3      sbc $b321,x
$07:d683  b2 2c         lda ($2c)
$07:d685  e0 be 21      cpx #$21be
$07:d688  35 eb         and $eb,x
$07:d68a  ed 24 00      sbc $0024
$07:d68d  02 00         cop #$00
$07:d68f  00 00         brk #$00
$07:d691  00 00         brk #$00
$07:d693  00 00         brk #$00
$07:d695  00 b6         brk #$b6
$07:d697  f5 54         sbc $54,x
$07:d699  20 fd bb      jsr $bbfd
$07:d69c  cc df 24      cpy $24df
$07:d69f  9a            txs
$07:d6a0  3f ff ca aa   and $aacaff,x
$07:d6a4  be 23 46      ldx $4623,y
$07:d6a7  75 9b         adc $9b,x
$07:d6a9  42 fe         wdm #$fe
$07:d6ab  ca            dex
$07:d6ac  9a            txs
$07:d6ad  ce 13 56      dec $5613
$07:d6b0  75 5a         adc $5a,x
$07:d6b2  00 02         brk #$02
$07:d6b4  00 00         brk #$00
$07:d6b6  00 00         brk #$00
$07:d6b8  00 00         brk #$00
$07:d6ba  00 00         brk #$00
$07:d6bc  c2 a0         rep #$a0
$07:d6be  65 55         adc $55
$07:d6c0  45 e9         eor $e9
$07:d6c2  bb            tyx
$07:d6c3  bb            tyx
$07:d6c4  a0 c2 65      ldy #$65c2
$07:d6c7  66 56         ror $56
$07:d6c9  fa            plx
$07:d6ca  bb            tyx
$07:d6cb  bb            tyx
$07:d6cc  a0 64 c6      ldy #$c664
$07:d6cf  10 01         bpl $d6d2
$07:d6d1  ab            plb
$07:d6d2  1f 01 f6 5e   ora $5ef601,x
$07:d6d6  10 c2         bpl $d69a
$07:d6d8  56 0a         lsr $0a,x
$07:d6da  bb            tyx
$07:d6db  bc a0 54      ldy $54a0,x
$07:d6de  55 56         eor $56,x
$07:d6e0  c2 0a         rep #$0a
$07:d6e2  ba            tsx
$07:d6e3  ab            plb
$07:d6e4  a1 65         lda ($65,x)
$07:d6e6  66 55         ror $55
$07:d6e8  fa            plx
$07:d6e9  c6 2f         dec $2f
$07:d6eb  00 e6         brk #$e6
$07:d6ed  5f 11 01 aa   eor $aa0111,x
$07:d6f1  1f c6 00 f6   ora $f600c6,x
$07:d6f5  5f 11 01 9a   eor $9a0111,x
$07:d6f9  2f 00 c2 b1   and $b1c200
$07:d6fd  64 44         stz $44
$07:d6ff  46 0b         lsr $0b
$07:d701  cb            wai
$07:d702  bb            tyx
$07:d703  a0 c3 64      ldy #$64c3
$07:d706  55 56         eor $56,x
$07:d708  fa            plx
$07:d709  cc cc b1      cpy $b1cc
$07:d70c  75 3f         adc $3f,x
$07:d70e  00 02         brk #$02
$07:d710  00 00         brk #$00
$07:d712  00 00         brk #$00
$07:d714  00 00         brk #$00
$07:d716  00 00         brk #$00
$07:d718  c2 00         rep #$00
$07:d71a  00 00         brk #$00
$07:d71c  04 33         tsb $33
$07:d71e  32 0f         and ($0f)
$07:d720  01 aa         ora ($aa,x)
$07:d722  c3 2c         cmp $2c,s
$07:d724  91 4a         sta ($4a),y
$07:d726  43 f5         eor $f5,s
$07:d728  59 d2 ba      eor $bad2,y
$07:d72b  b1 50         lda ($50),y
$07:d72d  e0 21 0e      cpx #$0e21
$07:d730  fe 13 bc      inc $bc13,x
$07:d733  c2 cd         rep #$cd
$07:d735  cc df 34      cpy $34df
$07:d738  33 32         and ($32,s),y
$07:d73a  0f 01 aa b5   ora $b5aa01
$07:d73e  2b            pld
$07:d73f  92 3a         sta ($3a)
$07:d741  43 f5         eor $f5,s
$07:d743  59 e2 bb      eor $bbe2,y
$07:d746  b1 40         lda ($40),y
$07:d748  e1 21         sbc ($21,x)
$07:d74a  0e fd 13      asl $13fd
$07:d74d  cc d3 08      cpy $08d3
$07:d750  00 00         brk #$00
$07:d752  00 00         brk #$00
$07:d754  00 00         brk #$00
$07:d756  00 00         brk #$00
$07:d758  00 84         brk #$84
$07:d75a  0e 3f d5      asl $d53f
$07:d75d  1e 7e d0      asl $d07e,x
$07:d760  45 ad         eor $ad
$07:d762  a4 f2         ldy $f2
$07:d764  1f e2 00 ff   ora $ff00e2,x
$07:d768  d2 30         cmp ($30)
$07:d76a  ef 90 c2 43   sbc $43c290
$07:d76e  ed c1 fd      sbc $fdc1
$07:d771  d1 64         cmp ($64),y
$07:d773  0c 94 25      tsb $2594
$07:d776  fd 0d ee      sbc $ee0d,x
$07:d779  f5 3d         sbc $3d,x
$07:d77b  dd 00 94      cmp $9400,x
$07:d77e  74 1d         stz $1d,x
$07:d780  b1 21         lda ($21),y
$07:d782  d4 5f         pei ($5f)
$07:d784  f1 df         sbc ($df),y
$07:d786  a4 2f         ldy $2f
$07:d788  d0 22         bne $d7ac
$07:d78a  de 00 e2      dec $e200,x
$07:d78d  34 dd         bit $dd,x
$07:d78f  a4 2e         ldy $2e
$07:d791  10 00         bpl $d793
$07:d793  14 0f         trb $0f
$07:d795  e2 40         sep #$40
$07:d797  0f a4 0e de   ora $de0ea4
$07:d79b  0f 01 01 e0   ora $e00101
$07:d79f  3f c1 a4 3e   and $3ea4c1,x
$07:d7a3  01 e2         ora ($e2,x)
$07:d7a5  23 1d         and $1d,s
$07:d7a7  e4 1c         cpx $1c
$07:d7a9  03 a4         ora $a4,s
$07:d7ab  ee 0c d3      inc $d30c
$07:d7ae  31 1f         and ($1f),y
$07:d7b0  10 1e         bpl $d7d0
$07:d7b2  0e a4 f2      asl $f2a4
$07:d7b5  1b            tcs
$07:d7b6  36 3e         rol $3e,x
$07:d7b8  ef 0f d2 10   sbc $10d20f
$07:d7bc  a8            tay
$07:d7bd  e0 e4 3f      cpx #$3fe4
$07:d7c0  c1 f2         cmp ($f2,x)
$07:d7c2  5e be 30      lsr $30be,x
$07:d7c5  a4 e0         ldy $e0
$07:d7c7  15 31         ora $31,x
$07:d7c9  fc df 4e      jsr ($4edf,x)
$07:d7cc  f0 01         beq $d7cf
$07:d7ce  a4 00         ldy $00
$07:d7d0  e0 20 42      cpx #$4220
$07:d7d3  dc c1 31      jml [$31c1]
$07:d7d6  1e a4 b1      asl $b1a4,x
$07:d7d9  04 25         tsb $25
$07:d7db  2c e2 ee      bit $eee2
$07:d7de  c2 2d         rep #$2d
$07:d7e0  a8            tay
$07:d7e1  21 11         and ($11,x)
$07:d7e3  e2 ff         sep #$ff
$07:d7e5  0c 22 10      tsb $1022
$07:d7e8  c2 a0         rep #$a0
$07:d7ea  14 40         trb $40
$07:d7ec  f2 11         sbc ($11)
$07:d7ee  12 2e         ora ($2e)
$07:d7f0  dd ec a4      cmp $a4ec,x
$07:d7f3  d5 40         cmp $40,x
$07:d7f5  20 fc fd      jsr $fdfc
$07:d7f8  35 fb         and $fb,x
$07:d7fa  01 a4         ora ($a4,x)
$07:d7fc  05 31         ora $31
$07:d7fe  a0 ff         ldy #$ff
$07:d800  e3 4a         sbc $4a,s
$07:d802  c3 20         cmp $20,s
$07:d804  a4 34         ldy $34
$07:d806  f0 23         beq $d82b
$07:d808  fa            plx
$07:d809  ae 0d 45      ldx $450d
$07:d80c  1f a4 21 ef   ora $ef21a4,x
$07:d810  f1 ee         sbc ($ee),y
$07:d812  f1 f1         sbc ($f1),y
$07:d814  4f 05 b4 2e   eor $2eb405
$07:d818  02 0e         cop #$0e
$07:d81a  cf 22 e0 0f   cmp $0fe022
$07:d81e  f4 b4 4f      pea $4fb4
$07:d821  00 0d         brk #$0d
$07:d823  d1 1f         cmp ($1f),y
$07:d825  f1 2f         sbc ($2f),y
$07:d827  03 b0         ora $b0,s
$07:d829  22 23 3e cd   jsl $cd3e23
$07:d82d  f0 11         beq $d840
$07:d82f  fe f0 a4      inc $a4f0,x
$07:d832  14 ec         trb $ec
$07:d834  cb            wai
$07:d835  15 1e         ora $1e,x
$07:d837  10 2e         bpl $d867
$07:d839  6f a4 1e 01   adc $011ea4
$07:d83d  cf 12 22 1e   cmp $1e2212
$07:d841  33 bf         and ($bf,s),y
$07:d843  a8            tay
$07:d844  3c c2 21      bit $21c2,x
$07:d847  4f d2 c3 2d   eor $2dc3d2
$07:d84b  40            rti
$07:d84c  a4 1e         ldy $1e
$07:d84e  ea            nop
$07:d84f  a1 37         lda ($37,x)
$07:d851  7b            tdc
$07:d852  bf 10 20 a4   lda $a42010,x
$07:d856  b0 0f         bcs $d867
$07:d858  ff 05 2e 05   sbc $052e05,x
$07:d85c  f0 2f         beq $d88d
$07:d85e  b4 fe         ldy $fe,x
$07:d860  ff f0 42 d0   sbc $d042f0,x
$07:d864  3f e2 0e b4   and $b40ee2,x
$07:d868  f1 ee         sbc ($ee),y
$07:d86a  e2 40         sep #$40
$07:d86c  02 1f         cop #$1f
$07:d86e  02 f0         cop #$f0
$07:d870  b0 20         bcs $d892
$07:d872  0e f1 22      asl $22f1
$07:d875  24 33         bit $33
$07:d877  3d bd a4      and $a4bd,x
$07:d87a  42 db         wdm #$db
$07:d87c  20 f0 10      jsr $10f0
$07:d87f  d3 24         cmp ($24,s),y
$07:d881  0d a4 f0      ora $f0a4
$07:d884  24 10         bit $10
$07:d886  33 01         and ($01,s),y
$07:d888  b9 c2 5d      lda $5dc2,y
$07:d88b  a4 fc         ldy $fc
$07:d88d  14 52         trb $52
$07:d88f  1f 1f ff fd   ora $fdff1f,x
$07:d893  a4 a4         ldy $a4
$07:d895  00 2e         brk #$2e
$07:d897  53 e0         eor ($e0,s),y
$07:d899  0d 9c 05      ora $059c
$07:d89c  4f b0 ef dd   eor $ddefb0
$07:d8a0  23 10         and $10,s
$07:d8a2  0e f0 0f      asl $0ff0
$07:d8a5  01 b4         ora ($b4,x)
$07:d8a7  3e c2 40      rol $40c2,x
$07:d8aa  1f dc 01 12   ora $1201dc,x
$07:d8ae  ff b0 db e4   sbc $e4dbb0,x
$07:d8b2  43 32         eor $32,s
$07:d8b4  f0 22         beq $d8d8
$07:d8b6  3f f2 b4 de   and $deb4f2,x
$07:d8ba  23 f1         and $f1,s
$07:d8bc  fc e1 02      jsr ($02e1,x)
$07:d8bf  20 2e b4      jsr $b42e
$07:d8c2  e0 2f         cpx #$2f
$07:d8c4  02 f1         cop #$f1
$07:d8c6  ff 23 df fc   sbc $fcdf23,x
$07:d8ca  b4 13         ldy $13,x
$07:d8cc  1f 10 e1 0e   ora $0ee110,x
$07:d8d0  2f 13 ee a0   and $a0ee13
$07:d8d4  cf d0 52 00   cmp $0052d0
$07:d8d8  f6 4d         inc $4d,x
$07:d8da  11 df         ora ($df),y
$07:d8dc  a4 5d         ldy $5d
$07:d8de  d1 c0         cmp ($c0),y
$07:d8e0  71 31         adc ($31),y
$07:d8e2  e1 2d         sbc ($2d,x)
$07:d8e4  e1 b4         sbc ($b4,x)
$07:d8e6  ed 11 fe      sbc $fe11
$07:d8e9  f3 50         sbc ($50,s),y
$07:d8eb  f0 ef         beq $d8dc
$07:d8ed  21 a4         and ($a4,x)
$07:d8ef  ba            tsx
$07:d8f0  b0 52         bcs $d944
$07:d8f2  05 f0         ora $f0
$07:d8f4  40            rti
$07:d8f5  d0 1b         bne $d912
$07:d8f7  94 b5         sty $b5,x
$07:d8f9  25 3e         and $3e
$07:d8fb  6b            rtl
$07:d8fc  e6 09         inc $09
$07:d8fe  04 ee         tsb $ee
$07:d900  a4 db         ldy $db
$07:d902  15 e5         ora $e5,x
$07:d904  2f 1f c1 41   and $41c11f
$07:d908  db            stp
$07:d909  b4 f3         ldy $f3,x
$07:d90b  1e f3 ef      asl $eff3,x
$07:d90e  1e f2 1f      asl $1ff2,x
$07:d911  fc b4 04      jsr ($04b4,x)
$07:d914  4f 3f 13 ee   eor $ee133f
$07:d918  00 ef         brk #$ef
$07:d91a  c1 b8         cmp ($b8,x)
$07:d91c  4e cf 01      lsr $01cf
$07:d91f  30 e1         bmi $d902
$07:d921  fd 03 f3      sbc $f303,x
$07:d924  a4 54         ldy $54
$07:d926  de 01 fb      dec $fb01,x
$07:d929  f0 30         beq $d95b
$07:d92b  bc 66 a8      ldy $a866,x
$07:d92e  fd cf 23      sbc $23cf,x
$07:d931  e4 ec         cpx $ec
$07:d933  d1 46         cmp ($46),y
$07:d935  1c b4 11      trb $11b4
$07:d938  f3 1e         sbc ($1e,s),y
$07:d93a  e0 ee         cpx #$ee
$07:d93c  ed 13 31      sbc $3113
$07:d93f  a4 09         ldy $09
$07:d941  24 dd         bit $dd
$07:d943  3d cc d0      and $d0cc,x
$07:d946  62 34 b4      per $8d7d
$07:d949  11 4e         ora ($4e),y
$07:d94b  ce ff 00      dec $00ff
$07:d94e  12 11         ora ($11)
$07:d950  00 b4         brk #$b4
$07:d952  e1 1f         sbc ($1f,x)
$07:d954  02 ec         cop #$ec
$07:d956  df 23 11 10   cmp $101123,x
$07:d95a  b4 12         ldy $12,x
$07:d95c  df fd d0 f4   cmp $f4d0fd,x
$07:d960  40            rti
$07:d961  01 00         ora ($00,x)
$07:d963  b4 1f         ldy $1f,x
$07:d965  f3 1c         sbc ($1c,s),y
$07:d967  cd 24 01      cmp $0124
$07:d96a  12 f1         ora ($f1)
$07:d96c  b4 1d         ldy $1d,x
$07:d96e  10 ec         bpl $d95c
$07:d970  e3 60         sbc $60,s
$07:d972  ef 12 00 a4   sbc $a40012
$07:d976  c3 3b         cmp $3b,s
$07:d978  aa            tax
$07:d979  e5 41         sbc $41
$07:d97b  14 31         trb $31
$07:d97d  30 b4         bmi $d933
$07:d97f  01 de         ora ($de,x)
$07:d981  fc 34 ff      jsr ($ff34,x)
$07:d984  10 0e         bpl $d994
$07:d986  ef b8 3d e2   sbc $e23db8
$07:d98a  e2 5c         sep #$5c
$07:d98c  f0 3e         beq $d9cc
$07:d98e  0d 04 b0      ora $b004
$07:d991  1e ef 05      asl $05ef,x
$07:d994  41 01         eor ($01,x)
$07:d996  23 2f         and $2f,s
$07:d998  12 b4         ora ($b4)
$07:d99a  ce 0f 44      dec $440f
$07:d99d  1f 11 01 d0   ora $d00111,x
$07:d9a1  fc b8 14      jsr ($14b8,x)
$07:d9a4  e2 2d         sep #$2d
$07:d9a6  e3 0f         sbc $0f,s
$07:d9a8  0c 43 cd      tsb $cd43
$07:d9ab  a4 fa         ldy $fa
$07:d9ad  c6 52         dec $52
$07:d9af  52 e1         eor ($e1)
$07:d9b1  ed 5f ad      sbc $ad5f
$07:d9b4  b0 dd         bcs $d993
$07:d9b6  01 0f         ora ($0f,x)
$07:d9b8  01 21         ora ($21,x)
$07:d9ba  cf 20 dd a4   cmp $a4dd20
$07:d9be  d2 34         cmp ($34)
$07:d9c0  13 02         ora ($02,s),y
$07:d9c2  6b            rtl
$07:d9c3  16 ec         asl $ec,x
$07:d9c5  2b            pld
$07:d9c6  b4 f2         ldy $f2,x
$07:d9c8  20 0e e0      jsr $e00e
$07:d9cb  cc 21 f0      cpy $f021
$07:d9ce  ff b4 32 23   sbc $2332b4,x
$07:d9d2  21 10         and ($10,x)
$07:d9d4  bf fe f2 13   lda $13f2fe,x
$07:d9d8  b4 0e         ldy $0e,x
$07:d9da  f1 24         sbc ($24),y
$07:d9dc  2c f3 fd      bit $fdf3
$07:d9df  de 24 a4      dec $a424,x
$07:d9e2  71 eb         adc ($eb),y
$07:d9e4  f3 eb         sbc ($eb,s),y
$07:d9e6  ed d3 ea      sbc $ead3
$07:d9e9  25 a4         and $a4
$07:d9eb  f0 ee         beq $d9db
$07:d9ed  2e e1 4f      rol $4fe1
$07:d9f0  db            stp
$07:d9f1  b2 32         lda ($32)
$07:d9f3  a4 55         ldy $55
$07:d9f5  31 ef         and ($ef),y
$07:d9f7  f4 52 29      pea $2952
$07:d9fa  a0 20         ldy #$20
$07:d9fc  a4 11         ldy $11
$07:d9fe  0c d3 20      tsb $20d3
$07:da01  d0 02         bne $da05
$07:da03  34 c0         bit $c0,x
$07:da05  a4 27         ldy $27
$07:da07  4e 1c 0e      lsr $0e1c
$07:da0a  3f c0 1a de   and $de1ac0,x
$07:da0e  a4 1f         ldy $1f
$07:da10  b3 0e         lda ($0e,s),y
$07:da12  ef 0f f2 32   sbc $32f20f
$07:da16  31 a4         and ($a4),y
$07:da18  1d 14 dd      ora $dd14,x
$07:da1b  e5 f1         sbc $f1
$07:da1d  22 e0 15 b4   jsl $b415e0
$07:da21  00 41         brk #$41
$07:da23  fd f0 12      sbc $12f0,x
$07:da26  2f fe 11 a8   and $a811fe
$07:da2a  d4 db         pei ($db)
$07:da2c  f6 fd         inc $fd,x
$07:da2e  41 e0         eor ($e0,x)
$07:da30  e3 fd         sbc $fd,s
$07:da32  b8            clv
$07:da33  4f dc 23 00   eor $0023dc
$07:da37  f0 20         beq $da59
$07:da39  ff f4 b4 42   sbc $42b4f4,x
$07:da3d  de 0e d0      dec $d00e,x
$07:da40  10 00         bpl $da42
$07:da42  0d f5 b4      ora $b4f5
$07:da45  4e be 01      lsr $01be
$07:da48  21 01         and ($01,x)
$07:da4a  13 00         ora ($00,s),y
$07:da4c  43 b8         eor $b8,s
$07:da4e  ec 21 e2      cpx $e221
$07:da51  3e fe 11      rol $11fe,x
$07:da54  04 0f         tsb $0f
$07:da56  b4 be         ldy $be,x
$07:da58  00 10         brk #$10
$07:da5a  f2 12         sbc ($12)
$07:da5c  fe 13 2e      inc $2e13,x
$07:da5f  b4 d0         ldy $d0,x
$07:da61  fe 01 1f      inc $1f01,x
$07:da64  00 02         brk #$02
$07:da66  45 1c         eor $1c
$07:da68  b4 df         ldy $df,x
$07:da6a  02 11         cop #$11
$07:da6c  ff 0e f3 31   sbc $31f30e,x
$07:da70  bc b8 3e      ldy $3eb8,x
$07:da73  12 1f         ora ($1f)
$07:da75  d1 f2         cmp ($f2),y
$07:da77  20 0c d2      jsr $d20c
$07:da7a  b4 dd         ldy $dd,x
$07:da7c  f1 32         sbc ($32),y
$07:da7e  30 f1         bmi $da71
$07:da80  34 1c         bit $1c,x
$07:da82  ff a8 c3 54   sbc $54c3a8,x
$07:da86  b0 cf         bcs $da57
$07:da88  63 1c         adc $1c,s
$07:da8a  ad 70 a8      lda $a870
$07:da8d  02 00         cop #$00
$07:da8f  03 a4         ora $a4,s
$07:da91  42 ab         wdm #$ab
$07:da93  c5 12         cmp $12
$07:da95  a8            tay
$07:da96  4e d9 31      lsr $31d9
$07:da99  55 cd         eor $cd,x
$07:da9b  0e e2 e2      asl $e2e2
$07:da9e  a8            tay
$07:da9f  34 c2         bit $c2,x
$07:daa1  c9 63         cmp #$63
$07:daa3  4b            phk
$07:daa4  dc 10 37      jml [$3710]
$07:daa7  a8            tay
$07:daa8  2c b2 e7      bit $e7b2
$07:daab  6a            ror a
$07:daac  d1 a0         cmp ($a0),y
$07:daae  2e 53 a8      rol $a853
$07:dab1  2b            pld
$07:dab2  2f 05 29 ee   and $ee2905
$07:dab6  f4 c3 60      pea $60c3
$07:dab9  b4 ee         ldy $ee,x
$07:dabb  10 24         bpl $dae1
$07:dabd  20 fc dc      jsr $dcfc
$07:dac0  ef 32 b4 12   sbc $12b432
$07:dac4  00 33         brk #$33
$07:dac6  02 0f         cop #$0f
$07:dac8  da            phx
$07:dac9  03 3f         ora $3f,s
$07:dacb  b4 0f         ldy $0f,x
$07:dacd  f1 2f         sbc ($2f),y
$07:dacf  1f d0 de 24   ora $24ded0,x
$07:dad3  0f a4 42 35   ora $3542a4
$07:dad7  c0 0c         cpy #$0c
$07:dad9  2c a3 3d      bit $3da3
$07:dadc  a4 b8         ldy $b8
$07:dade  e0 1f         cpx #$1f
$07:dae0  02 d0         cop #$d0
$07:dae2  0c 34 1c      tsb $1c34
$07:dae5  10 a4         bpl $da8b
$07:dae7  e0 fc         cpx #$fc
$07:dae9  21 12         and ($12,x)
$07:daeb  9e 65 f1      stz $f165,x
$07:daee  62 b8 02      per $dda9
$07:daf1  d3 fe         cmp ($fe,s),y
$07:daf3  0e f5 2e      asl $2ef5
$07:daf6  d5 0e         cmp $0e,x
$07:daf8  b4 0e         ldy $0e,x
$07:dafa  f1 f0         sbc ($f0),y
$07:dafc  0d f0 0e      ora $0ef0
$07:daff  31 00         and ($00),y
$07:db01  b8            clv
$07:db02  0f 4b f2 d2   ora $d2f24b
$07:db06  14 df         trb $df
$07:db08  2f e0 a4 d4   and $d4a4e0
$07:db0c  41 0c         eor ($0c,x)
$07:db0e  90 24         bcc $db34
$07:db10  16 0f         asl $0f,x
$07:db12  ec a8 44      cpx $44a8
$07:db15  df fa 54 2b   cmp $2b54fa,x
$07:db19  51 dd         eor ($dd),y
$07:db1b  0e a4 2f      asl $2fa4
$07:db1e  f1 ca         sbc ($ca),y
$07:db20  af 11 44 1f   lda $1f4411
$07:db24  f5 b4         sbc $b4,x
$07:db26  10 fe         bpl $db26
$07:db28  cf 34 f0 0f   cmp $0ff034
$07:db2c  fe 02 a4      inc $a402,x
$07:db2f  3e 0e 1f      rol $1f0e,x
$07:db32  63 34         adc $34,s
$07:db34  3f 00 52 a4   and $a45200,x
$07:db38  fc bc d2      jsr ($d2bc,x)
$07:db3b  2f 22 ff e2   and $e2ff22
$07:db3f  02 a4         cop #$a4
$07:db41  00 ba         brk #$ba
$07:db43  d5 f2         cmp $f2,x
$07:db45  20 cd 12      jsr $12cd
$07:db48  2d b8 e1      and $e1b8
$07:db4b  21 3d         and ($3d,x)
$07:db4d  fe 20 00      inc $0020,x
$07:db50  2e f0 a4      rol $a4f0
$07:db53  0e c4 32      asl $32c4
$07:db56  22 cd e2 24   jsl $24e2cd
$07:db5a  ed a8 01      sbc $01a8
$07:db5d  33 c1         and ($c1,s),y
$07:db5f  f0 0f         beq $db70
$07:db61  01 0e         ora ($0e,x)
$07:db63  00 a4         brk #$a4
$07:db65  db            stp
$07:db66  3f 34 4f 01   and $014f34,x
$07:db6a  23 fa         and $fa,s
$07:db6c  c0 a8         cpy #$a8
$07:db6e  05 be         ora $be
$07:db70  d1 23         cmp ($23),y
$07:db72  e2 0f         sep #$0f
$07:db74  d2 f1         cmp ($f1)
$07:db76  a8            tay
$07:db77  22 e2 d0 f1   jsl $f1d0e2
$07:db7b  22 1a d2 3f   jsl $3fd21a
$07:db7f  a4 3f         ldy $3f
$07:db81  1f 22 1f 02   ora $021f22,x
$07:db85  1e ed c1      asl $c1ed,x
$07:db88  a8            tay
$07:db89  e3 e1         sbc $e1,s
$07:db8b  ff f1 0f b5   sbc $b50ff1,x
$07:db8f  11 00         ora ($00),y
$07:db91  94 2c         sty $2c,x
$07:db93  d6 73         dec $73,x
$07:db95  51 1c         eor ($1c),y
$07:db97  ad dc 54      lda $54dc
$07:db9a  a4 3d         ldy $3d
$07:db9c  1f f1 33 0b   ora $0b33f1,x
$07:dba0  f0 01         beq $dba3
$07:dba2  f1 a4         sbc ($a4),y
$07:dba4  c0 20         cpy #$20
$07:dba6  f0 ff         beq $dba7
$07:dba8  be 0e 02      ldx $020e,y
$07:dbab  5f a8 15 cf   eor $cf15a8,x
$07:dbaf  1f 0e 02 01   ora $01020e,x
$07:dbb3  f0 ec         beq $dba1
$07:dbb5  a4 22         ldy $22
$07:dbb7  23 1f         and $1f,s
$07:dbb9  fe 12 14      inc $1412,x
$07:dbbc  23 c1         and $c1,s
$07:dbbe  a4 30         ldy $30
$07:dbc0  02 0f         cop #$0f
$07:dbc2  cc 00 10      cpy $1000
$07:dbc5  4f f4 a4 11   eor $11a4f4
$07:dbc9  11 0d         ora ($0d),y
$07:dbcb  bf e2 20 fc   lda $fc20e2,x
$07:dbcf  23 a4         and $a4,s
$07:dbd1  0e ff ed      asl $edff
$07:dbd4  f2 41         sbc ($41)
$07:dbd6  f1 c1         sbc ($c1),y
$07:dbd8  44 a4 10      mvp $10,$a4
$07:dbdb  e0 dc         cpx #$dc
$07:dbdd  01 50         ora ($50,x)
$07:dbdf  1c e3 42      trb $42e3
$07:dbe2  94 23         sty $23,x
$07:dbe4  2d 9d f2      and $f29d
$07:dbe7  e1 29         sbc ($29,x)
$07:dbe9  d0 20         bne $dc0b
$07:dbeb  a8            tay
$07:dbec  e0 0e         cpx #$0e
$07:dbee  11 31         ora ($31),y
$07:dbf0  e0 c2         cpx #$c2
$07:dbf2  3f d1 a4 11   and $11a4d1,x
$07:dbf6  ec e2 1d      cpx $1de2
$07:dbf9  ee 02 43      inc $4302
$07:dbfc  0e a8 20      asl $20a8
$07:dbff  e1 33         sbc ($33,x)
$07:dc01  ee ef 32      inc $32ef
$07:dc04  0d 01 98      ora $9801
$07:dc07  1d d4 51      ora $51d4,x
$07:dc0a  1f a2 17 ed   ora $ed17a2,x
$07:dc0e  b2 a4         lda ($a4)
$07:dc10  dc e2 40      jml [$40e2]
$07:dc13  fd f0 21      sbc $21f0,x
$07:dc16  fe 01 94      inc $9401,x
$07:dc19  fd 33 f1      sbc $f133,x
$07:dc1c  f1 23         sbc ($23),y
$07:dc1e  51 fe         eor ($fe),y
$07:dc20  fa            plx
$07:dc21  a4 c0         ldy $c0
$07:dc23  22 1f e1 24   jsl $24e11f
$07:dc27  11 f1         ora ($f1),y
$07:dc29  1f 98 95 71   ora $719598,x
$07:dc2d  da            phx
$07:dc2e  10 3f         bpl $dc6f
$07:dc30  2d 0e 0c      and $0c0e
$07:dc33  94 37         sty $37,x
$07:dc35  62 cc 11      per $ee04
$07:dc38  30 00         bmi $dc3a
$07:dc3a  22 dc 94 ee   jsl $ee94dc
$07:dc3e  f0 12         beq $dc52
$07:dc40  23 d3         and $d3,s
$07:dc42  22 0f c4 a4   jsl $a4c40f
$07:dc46  33 0e         and ($0e,s),y
$07:dc48  e0 1f         cpx #$1f
$07:dc4a  0f 12 2c d1   ora $d12c12
$07:dc4e  98            tya
$07:dc4f  4e df 11      lsr $11df
$07:dc52  00 2c         brk #$2c
$07:dc54  e4 c1         cpx $c1
$07:dc56  50 94         bvc $dbec
$07:dc58  01 0f         ora ($0f,x)
$07:dc5a  f1 b0         sbc ($b0),y
$07:dc5c  34 41         bit $41,x
$07:dc5e  ab            plb
$07:dc5f  d0 a4         bne $dc05
$07:dc61  22 11 0c f1   jsl $f10c11
$07:dc65  10 fd         bpl $dc64
$07:dc67  f2 20         sbc ($20)
$07:dc69  a8            tay
$07:dc6a  1f 10 0f 11   ora $110f10,x
$07:dc6e  00 cf         brk #$cf
$07:dc70  31 01         and ($01),y
$07:dc72  98            tya
$07:dc73  dd f2 f3      cmp $f3f2,x
$07:dc76  0f fe f3 3d   ora $3df3fe
$07:dc7a  1f 98 d1 3d   ora $3dd198,x
$07:dc7e  f3 2e         sbc ($2e,s),y
$07:dc80  fc c3 25      jsr ($25c3,x)
$07:dc83  1e 94 20      asl $2094,x
$07:dc86  ce 25 21      dec $2125
$07:dc89  fe 33 02      inc $0233,x
$07:dc8c  ed 98 14      sbc $1498
$07:dc8f  ef 34 eb d3   sbc $d3eb34
$07:dc93  4e 40 fc      lsr $fc40
$07:dc96  84 df         sty $df
$07:dc98  ff 40 c9 c6   sbc $c6c940,x
$07:dc9c  c2 41         rep #$41
$07:dc9e  bd 98 12      lda $1298,x
$07:dca1  e4 1e         cpx $1e
$07:dca3  cc 21 52      cpy $5221
$07:dca6  0e be 84      asl $84be
$07:dca9  ec 35 09      cpx $0935
$07:dcac  a3 4d         lda $4d,s
$07:dcae  44 3e 35      mvp $35,$3e
$07:dcb1  94 10         sty $10,x
$07:dcb3  53 cb         eor ($cb,s),y
$07:dcb5  d0 d1         bne $dc88
$07:dcb7  f1 dd         sbc ($dd),y
$07:dcb9  e2 94         sep #$94
$07:dcbb  d2 1e         cmp ($1e)
$07:dcbd  e1 3f         sbc ($3f,x)
$07:dcbf  00 3f         brk #$3f
$07:dcc1  e0 4e         cpx #$4e
$07:dcc3  94 14         sty $14,x
$07:dcc5  1d cd e1      ora $e1cd,x
$07:dcc8  32 2e         and ($2e)
$07:dcca  e1 ff         sbc ($ff,x)
$07:dccc  94 42         sty $42,x
$07:dcce  ef 21 f0 f2   sbc $f2f021
$07:dcd2  f0 02         beq $dcd6
$07:dcd4  f5 84         sbc $84,x
$07:dcd6  7d cf 0d      adc $0dcf,x
$07:dcd9  31 3e         and ($3e),y
$07:dcdb  cf 6b f1 94   cmp $94f16b
$07:dcdf  ed 13 10      sbc $1013
$07:dce2  e0 1e         cpx #$1e
$07:dce4  04 20         tsb $20
$07:dce6  30 84         bmi $dc6c
$07:dce8  ab            plb
$07:dce9  ee 33 12      inc $1233
$07:dcec  ba            tsx
$07:dced  00 b2         brk #$b2
$07:dcef  3b            tsc
$07:dcf0  94 e3         sty $e3,x
$07:dcf2  31 fd         and ($fd),y
$07:dcf4  11 12         ora ($12),y
$07:dcf6  41 11         eor ($11,x)
$07:dcf8  cc 84 f3      cpy $f384
$07:dcfb  f2 bc         sbc ($bc)
$07:dcfd  bd d4 ec      lda $ecd4,x
$07:dd00  1f c3 84 74   ora $7484c3,x
$07:dd04  1b            tcs
$07:dd05  e1 ff         sbc ($ff,x)
$07:dd07  64 f1         stz $f1
$07:dd09  ea            nop
$07:dd0a  d2 84         cmp ($84)
$07:dd0c  14 0c         trb $0c
$07:dd0e  0f e2 2d d3   ora $d32de2
$07:dd12  fe 46 84      inc $8446,x
$07:dd15  2f b0 20 04   and $0420b0
$07:dd19  44 5c a0      mvp $a0,$5c
$07:dd1c  52 98         eor ($98)
$07:dd1e  1c 01 2f      trb $2f01
$07:dd21  2f e0 00 23   and $2300e0
$07:dd25  0c 84 bd      tsb $bd84
$07:dd28  00 16         brk #$16
$07:dd2a  33 0e         and ($0e,s),y
$07:dd2c  bc 45 30      ldy $3045,x
$07:dd2f  84 ad         sty $ad
$07:dd31  ff ff 0e fd   sbc $fd0eff,x
$07:dd35  05 72         ora $72
$07:dd37  da            phx
$07:dd38  98            tya
$07:dd39  21 20         and ($20,x)
$07:dd3b  0f 0f d0 33   ora $33d00f
$07:dd3f  0f ce 88 44   ora $4488ce
$07:dd43  f1 f1         sbc ($f1),y
$07:dd45  fd f5 20      sbc $20f5,x
$07:dd48  bf f0 84 03   lda $0384f0,x
$07:dd4c  30 00         bmi $dd4e
$07:dd4e  eb            xba
$07:dd4f  f1 44         sbc ($44),y
$07:dd51  3d bf 88      and $88bf,x
$07:dd54  00 00         brk #$00
$07:dd56  2d d4 31      and $31d4
$07:dd59  fd ef 23      sbc $23ef,x
$07:dd5c  84 42         sty $42
$07:dd5e  13 2c         ora ($2c,s),y
$07:dd60  d0 04         bne $dd66
$07:dd62  60            rts
$07:dd63  ac ff 84      ldy $84ff
$07:dd66  20 f1 cc      jsr $ccf1
$07:dd69  23 43         and $43,s
$07:dd6b  0e cf 26      asl $26cf
$07:dd6e  88            dey
$07:dd6f  cc 3f d3      cpy $d33f
$07:dd72  12 2f         ora ($2f)
$07:dd74  cd 30 1e      cmp $1e30
$07:dd77  84 e1         sty $e1
$07:dd79  2d f2 33      and $33f2
$07:dd7c  fe e1 34      inc $34e1,x
$07:dd7f  20 88 02      jsr $0288
$07:dd82  a0 32         ldy #$32
$07:dd84  41 cb         eor ($cb,x)
$07:dd86  e2 12         sep #$12
$07:dd88  0e 74 51      asl $5174
$07:dd8b  d1 12         cmp ($12),y
$07:dd8d  32 2b         and ($2b)
$07:dd8f  f1 40         sbc ($40),y
$07:dd91  b0 84         bcs $dd17
$07:dd93  1d e0 23      ora $23e0,x
$07:dd96  42 dd         wdm #$dd
$07:dd98  ee ef 13      inc $13ef
$07:dd9b  74 cb         stz $cb,x
$07:dd9d  26 63         rol $63
$07:dd9f  1d 15 20      ora $2015,x
$07:dda2  21 4e         and ($4e,x)
$07:dda4  78            sei
$07:dda5  e1 34         sbc ($34,x)
$07:dda7  4e ad 21      lsr $21ad
$07:ddaa  10 e4         bpl $dd90
$07:ddac  0d 74 f2      ora $f274
$07:ddaf  45 1f         eor $1f
$07:ddb1  e2 21         sep #$21
$07:ddb3  0e 22 cd      asl $cd22
$07:ddb6  78            sei
$07:ddb7  32 01         and ($01)
$07:ddb9  1d ee 00      ora $00ee,x
$07:ddbc  23 2d         and $2d,s
$07:ddbe  d1 78         cmp ($78),y
$07:ddc0  13 ed         ora ($ed,s),y
$07:ddc2  15 1d         ora $1d,x
$07:ddc4  e2 d2         sep #$d2
$07:ddc6  ed 06 78      sbc $7806
$07:ddc9  5e de c0      lsr $c0de,x
$07:ddcc  11 1e         ora ($1e),y
$07:ddce  51 eb         eor ($eb),y
$07:ddd0  02 74         cop #$74
$07:ddd2  43 00         eor $00,s
$07:ddd4  11 fe         ora ($fe),y
$07:ddd6  d1 0c         cmp ($0c),y
$07:ddd8  b1 46         lda ($46),y
$07:ddda  78            sei
$07:dddb  b0 1d         bcs $ddfa
$07:dddd  ef f2 41 de   sbc $de41f2
$07:dde1  12 3e         ora ($3e)
$07:dde3  74 00         stz $00,x
$07:dde5  43 1f         eor $1f,s
$07:dde7  1f 30 cb 14   ora $14cb30,x
$07:ddeb  43 74         eor $74,s
$07:dded  00 ef         brk #$ef
$07:ddef  ec b1 21      cpx $21b1
$07:ddf2  00 f3         brk #$f3
$07:ddf4  31 74         and ($74),y
$07:ddf6  22 ff e0 33   jsl $33e0ff
$07:ddfa  cc f2 30      cpy $30f2
$07:ddfd  12 78         ora ($78)
$07:ddff  1d fc 15      ora $15fc,x
$07:de02  2d f0 12      and $12f0
$07:de05  ee 25 74      inc $7425
$07:de08  31 00         and ($00),y
$07:de0a  f2 fb         sbc ($fb)
$07:de0c  b1 44         lda ($44),y
$07:de0e  fd e0 74      sbc $74e0,x
$07:de11  ff bc 33 10   sbc $1033bc,x
$07:de15  ef 32 11 1e   sbc $1e1132
$07:de19  78            sei
$07:de1a  1f 11 fd 12   ora $12fd11,x
$07:de1e  40            rti
$07:de1f  df f1 e0 74   cmp $74e0f1,x
$07:de23  cc 13 0f      cpy $0f13
$07:de26  f1 31         sbc ($31),y
$07:de28  12 31         ora ($31)
$07:de2a  10 74         bpl $dea0
$07:de2c  e0 30         cpx #$30
$07:de2e  cd f4 42      cmp $42f4
$07:de31  0f f0 0c 74   ora $740cf0
$07:de35  c1 10         cmp ($10,x)
$07:de37  00 02         brk #$02
$07:de39  13 20         ora ($20,s),y
$07:de3b  df 00 68 5c   cmp $5c6800,x
$07:de3f  b1 31         lda ($31),y
$07:de41  2e 3f 0f      rol $0f3f
$07:de44  fb            xce
$07:de45  e6 64         inc $64
$07:de47  4f df f2 01   eor $01f2df
$07:de4b  53 01         eor ($01,s),y
$07:de4d  3f f4 64 eb   and $eb64f4,x
$07:de51  e0 13         cpx #$13
$07:de53  e0 ef         cpx #$ef
$07:de55  01 ba         ora ($ba,x)
$07:de57  42 68         wdm #$68
$07:de59  c1 1e         cmp ($1e,x)
$07:de5b  3f 3f cc 42   and $42cc3f,x
$07:de5f  d2 ed         cmp ($ed)
$07:de61  68            pla
$07:de62  43 e0         eor $e0,s
$07:de64  f2 fc         sbc ($fc)
$07:de66  02 0b         cop #$0b
$07:de68  43 d0         eor $d0,s
$07:de6a  68            pla
$07:de6b  2f 0f 23 dd   and $dd230f
$07:de6f  22 d0 3c f2   jsl $f23cd0
$07:de73  64 14         stz $14
$07:de75  51 2f         eor ($2f),y
$07:de77  d1 2c         cmp ($2c),y
$07:de79  a0 0f         ldy #$0f
$07:de7b  11 64         ora ($64),y
$07:de7d  01 25         ora ($25,x)
$07:de7f  4d b0 20      eor $20b0
$07:de82  0f e0 10 58   ora $5810e0
$07:de86  0f 53 ae 3d   ora $3dae53
$07:de8a  c4 2c         cpy $2c
$07:de8c  31 f2         and ($f2),y
$07:de8e  58            cli
$07:de8f  f0 4c         beq $dedd
$07:de91  d5 2d         cmp $2d,x
$07:de93  e1 d1         sbc ($d1,x)
$07:de95  02 3e         cop #$3e
$07:de97  54 bf 1c      mvn $1c,$bf
$07:de9a  22 fc 1f f1   jsl $f11ffc
$07:de9e  11 10         ora ($10),y
$07:dea0  54 13 db      mvn $db,$13
$07:dea3  12 ee         ora ($ee)
$07:dea5  dc 23 22      jml [$2223]
$07:dea8  fe 58 3e      inc $3e58,x
$07:deab  e3 e0         sbc $e0,s
$07:dead  0f f3 3f ff   ora $ff3ff3
$07:deb1  f1 54         sbc ($54),y
$07:deb3  2f 01 20 fd   and $fd2001
$07:deb7  e0 25         cpx #$25
$07:deb9  6f d0 48 0e   adc $0e48d0
$07:debd  20 0f c2      jsr $c20f
$07:dec0  54 f3 dd      mvn $dd,$f3
$07:dec3  ff 50 11 11   sbc $111150,x
$07:dec7  20 de 12      jsr $12de
$07:deca  33 11         and ($11,s),y
$07:decc  33 48         and ($48,s),y
$07:dece  df 51 ad 45   cmp $45ad51,x
$07:ded2  1e 2e d1      asl $d12e,x
$07:ded5  1e 44 24      asl $2444,x
$07:ded8  30 bc         bmi $de96
$07:deda  e2 23         sep #$23
$07:dedc  b9 d3 00      lda $00d3,y
$07:dedf  44 23 1c      mvp $1c,$23
$07:dee2  df 42 01 0f   cmp $0f0142,x
$07:dee6  fd ef 48      sbc $48ef,x
$07:dee9  03 ce         ora $ce,s
$07:deeb  14 2e         trb $2e
$07:deed  fb            xce
$07:deee  e3 3f         sbc $3f,s
$07:def0  f1 48         sbc ($48),y
$07:def2  1d e1 52      ora $52e1,x
$07:def5  c0 ff         cpy #$ff
$07:def7  01 f1         ora ($f1,x)
$07:def9  20 48 0d      jsr $0d48
$07:defc  f1 52         sbc ($52),y
$07:defe  fc c2 20      jsr ($20c2,x)
$07:df01  01 00         ora ($00,x)
$07:df03  44 ee f3      mvp $f3,$ee
$07:df06  42 21         wdm #$21
$07:df08  fe ee f0      inc $f0ee,x
$07:df0b  20 38 ef      jsr $ef38
$07:df0e  64 c0         stz $c0
$07:df10  dc 23 f0      jml [$f023]
$07:df13  12 fb         ora ($fb)
$07:df15  34 af         bit $af,x
$07:df17  73 21         adc ($21,s),y
$07:df19  1e fe 12      asl $12fe,x
$07:df1c  22 0c 34 b0   jsl $b0340c
$07:df20  41 ec         eor ($ec,x)
$07:df22  cf 02 22 20   cmp $202202
$07:df26  ed 28 67      sbc $6728
$07:df29  90 0f         bcc $df3a
$07:df2b  f0 95         beq $dec2
$07:df2d  33 fd         and ($fd,s),y
$07:df2f  c3 28         cmp $28,s
$07:df31  7d dd df      adc $dfdd,x
$07:df34  30 4f         bmi $df85
$07:df36  1e f0 14      asl $14f0,x
$07:df39  38            sec
$07:df3a  0c 01 10      tsb $1001
$07:df3d  e0 21         cpx #$21
$07:df3f  00 ff         brk #$ff
$07:df41  23 28         and $28,s
$07:df43  cd cf 12      cmp $12cf
$07:df46  23 ef         and $ef,s
$07:df48  f0 12         beq $df5c
$07:df4a  4f 18 cc 0e   eor $0ecc18
$07:df4e  0c 52 10      tsb $1052
$07:df51  0e 21 00      asl $0021
$07:df54  24 1f         bit $1f
$07:df56  ef e0 11 00   sbc $0011e0
$07:df5a  f0 13         beq $df6f
$07:df5c  00 14         brk #$14
$07:df5e  01 0e         ora ($0e,x)
$07:df60  c0 01         cpy #$01
$07:df62  2f fe 30 0c   and $0c30fe
$07:df66  14 ce         trb $ce
$07:df68  21 3f         and ($3f,x)
$07:df6a  11 0f         ora ($0f),y
$07:df6c  00 00         brk #$00
$07:df6e  00 18         brk #$18
$07:df70  0f e0 20 20   ora $2020e0
$07:df74  00 ef         brk #$ef
$07:df76  11 d0         ora ($d0),y
$07:df78  04 cf         tsb $cf
$07:df7a  f3 f2         sbc ($f2,s),y
$07:df7c  30 13         bmi $df91
$07:df7e  3f 00 10 04   and $041000,x
$07:df82  fe 00 03      inc $0300,x
$07:df85  30 01         bmi $df88
$07:df87  30 ec         bmi $df75
$07:df89  ff 10 00 00   sbc $000010,x
$07:df8d  10 01         bpl $df90
$07:df8f  24 43         bit $43
$07:df91  22 21 00 0f   jsl $0f0021
$07:df95  de 02 10      dec $1002,x
$07:df98  00 22         brk #$22
$07:df9a  ff f0 00 00   sbc $0000f0,x
$07:df9e  00 00         brk #$00
$07:dfa0  11 00         ora ($00),y
$07:dfa2  00 11         brk #$11
$07:dfa4  0f 00 00 00   ora $000000
$07:dfa8  00 00         brk #$00
$07:dfaa  f0 00         beq $dfac
$07:dfac  00 00         brk #$00
$07:dfae  00 00         brk #$00
$07:dfb0  00 00         brk #$00
$07:dfb2  00 0f         brk #$0f
$07:dfb4  01 0f         ora ($0f,x)
$07:dfb6  00 00         brk #$00
$07:dfb8  00 00         brk #$00
$07:dfba  0f 00 00 00   ora $000000
$07:dfbe  00 00         brk #$00
$07:dfc0  00 00         brk #$00
$07:dfc2  00 00         brk #$00
$07:dfc4  00 00         brk #$00
$07:dfc6  00 00         brk #$00
$07:dfc8  00 00         brk #$00
$07:dfca  00 00         brk #$00
$07:dfcc  0f 00 00 00   ora $000000
$07:dfd0  00 00         brk #$00
$07:dfd2  00 00         brk #$00
$07:dfd4  00 00         brk #$00
$07:dfd6  00 00         brk #$00
$07:dfd8  00 00         brk #$00
$07:dfda  00 00         brk #$00
$07:dfdc  00 00         brk #$00
$07:dfde  00 00         brk #$00
$07:dfe0  00 00         brk #$00
$07:dfe2  00 00         brk #$00
$07:dfe4  00 00         brk #$00
$07:dfe6  00 00         brk #$00
$07:dfe8  00 00         brk #$00
$07:dfea  00 00         brk #$00
$07:dfec  00 00         brk #$00
$07:dfee  00 00         brk #$00
$07:dff0  00 00         brk #$00
$07:dff2  00 00         brk #$00
$07:dff4  00 00         brk #$00
$07:dff6  00 00         brk #$00
$07:dff8  00 00         brk #$00
$07:dffa  00 00         brk #$00
$07:dffc  00 00         brk #$00
$07:dffe  00 00         brk #$00
$07:e000  00 00         brk #$00
$07:e002  00 00         brk #$00
$07:e004  00 00         brk #$00
$07:e006  00 00         brk #$00
$07:e008  00 00         brk #$00
$07:e00a  00 00         brk #$00
$07:e00c  00 00         brk #$00
$07:e00e  00 00         brk #$00
$07:e010  00 00         brk #$00
$07:e012  00 00         brk #$00
$07:e014  00 00         brk #$00
$07:e016  00 00         brk #$00
$07:e018  00 00         brk #$00
$07:e01a  01 00         ora ($00,x)
$07:e01c  00 00         brk #$00
$07:e01e  00 00         brk #$00
$07:e020  00 00         brk #$00
$07:e022  00 db         brk #$db
$07:e024  06 02         asl $02
$07:e026  00 00         brk #$00
$07:e028  00 00         brk #$00
$07:e02a  00 00         brk #$00
$07:e02c  00 00         brk #$00
$07:e02e  02 00         cop #$00
$07:e030  00 00         brk #$00
$07:e032  00 00         brk #$00
$07:e034  00 00         brk #$00
$07:e036  00 02         brk #$02
$07:e038  00 00         brk #$00
$07:e03a  00 00         brk #$00
$07:e03c  00 00         brk #$00
$07:e03e  00 00         brk #$00
$07:e040  02 00         cop #$00
$07:e042  11 11         ora ($11),y
$07:e044  11 12         ora ($12),y
$07:e046  33 45         and ($45,s),y
$07:e048  66 06         ror $06
$07:e04a  10 10         bpl $e05c
$07:e04c  01 10         ora ($10,x)
$07:e04e  00 f0         brk #$f0
$07:e050  12 21         ora ($21)
$07:e052  06 0f         asl $0f
$07:e054  ff 00 00 00   sbc $000000,x
$07:e058  11 00         ora ($00),y
$07:e05a  fe 06 de      inc $de06,x
$07:e05d  f0 f0         beq $e04f
$07:e05f  0f ee f0 00   ora $00f0ee
$07:e063  db            stp
$07:e064  06 cf         asl $cf
$07:e066  21 eb         and ($eb,x)
$07:e068  ce 22 0c      dec $0c22
$07:e06b  bb            tyx
$07:e06c  ef 1a 00 00   sbc $00001a
$07:e070  0d e0 23      ora $23e0
$07:e073  0d ce 03      ora $03ce
$07:e076  1a            inc a
$07:e077  10 df         bpl $e058
$07:e079  12 1e         ora ($1e)
$07:e07b  cd 02 11      cmp $1102
$07:e07e  ff 1a 13 0e   sbc $0e131a,x
$07:e082  ef 01 00 00   sbc $000001
$07:e086  23 0f         and $0f,s
$07:e088  46 00         lsr $00
$07:e08a  11 0f         ora ($0f),y
$07:e08c  f0 00         beq $e08e
$07:e08e  11 11         ora ($11),y
$07:e090  1c 7a da      trb $da7a
$07:e093  bc cb bb      ldy $bbcb,x
$07:e096  bc de ba      ldy $bade,x
$07:e099  aa            tax
$07:e09a  8a            txa
$07:e09b  cd cc de      cmp $decc
$07:e09e  cb            wai
$07:e09f  dc cc cc      jml [$cccc]
$07:e0a2  cd 96 cc      cmp $cc96
$07:e0a5  cc cc cc      cpy $cccc
$07:e0a8  cc cd ff      cpy $ffcd
$07:e0ab  cf aa 2e c0   cmp $c02eaa
$07:e0af  31 ef         and ($ef),y
$07:e0b1  21 de         and ($de,x)
$07:e0b3  11 f1         ora ($f1),y
$07:e0b5  a6 33         ldx $33
$07:e0b7  13 55         ora ($55,s),y
$07:e0b9  1f 02 34 2d   ora $2d3402,x
$07:e0bd  c2 aa         rep #$aa
$07:e0bf  6f ad 36 3e   adc $3e36ad
$07:e0c3  ce 15 50      dec $5015
$07:e0c6  cd aa 14      cmp $14aa
$07:e0c9  10 11         bpl $e0dc
$07:e0cb  ef f2 43 fd   sbc $fd43f2
$07:e0cf  c0 aa         cpy #$aa
$07:e0d1  66 fa         ror $fa
$07:e0d3  c1 45         cmp ($45,x)
$07:e0d5  3f ab 25 31   and $3125ab,x
$07:e0d9  96 71         stx $71,y
$07:e0db  99 06 63      sta $6306,y
$07:e0de  0f e0 45 2f   ora $2f45e0
$07:e0e2  8a            txa
$07:e0e3  36 34         rol $34,x
$07:e0e5  3d b0 37      and $37b0,x
$07:e0e8  73 0e         adc ($0e,s),y
$07:e0ea  be 9a 23      ldx $239a,y
$07:e0ed  20 01 31      jsr $3101
$07:e0f0  fd ce 23      sbc $23ce,x
$07:e0f3  0f 9a ef 11   ora $11ef9a
$07:e0f7  ed ee f0      sbc $f0ee
$07:e0fa  f0 fe         beq $e0fa
$07:e0fc  ef 8a cd 20   sbc $20cd8a
$07:e100  da            phx
$07:e101  b0 41         bcs $e144
$07:e103  db            stp
$07:e104  cc f3 9a      cpy $9af3
$07:e107  0e f1 f1      asl $f1f1
$07:e10a  2e be 21      rol $21be
$07:e10d  dd 24 aa      cmp $aa24,x
$07:e110  1f ed d0 43   ora $43d0ed,x
$07:e114  ec f3 1e      cpx $1ef3
$07:e117  e0 9a         cpx #$9a
$07:e119  e0 32         cpx #$32
$07:e11b  dd 04 0b      cmp $0b04,x
$07:e11e  f5 40         sbc $40,x
$07:e120  ed aa f1      sbc $f1aa
$07:e123  31 ee         and ($ee),y
$07:e125  24 1e         bit $1e
$07:e127  f1 11         sbc ($11),y
$07:e129  00 aa         brk #$aa
$07:e12b  11 21         ora ($21),y
$07:e12d  fd 14 4f      sbc $4f14,x
$07:e130  de 13 2f      dec $2f13,x
$07:e133  a6 f0         ldx $f0
$07:e135  23 2e         and $2e,s
$07:e137  df 22 0d d1   cmp $d10d22,x
$07:e13b  43 aa         eor $aa,s
$07:e13d  ce 14 1f      dec $1f14
$07:e140  ef 23 fc 03   sbc $03fc23
$07:e144  21 aa         and ($aa,x)
$07:e146  ed e1 32      sbc $32e1
$07:e149  fd 03 1f      sbc $1f03,x
$07:e14c  ef f1 9a 22   sbc $229af1
$07:e150  ff 21 dc 03   sbc $03dc21,x
$07:e154  4f bb 14 9a   eor $9a14bb
$07:e158  40            rti
$07:e159  fe ef 01      inc $01ef,x
$07:e15c  0f f0 02 21   ora $2102f0
$07:e160  96 3f         stx $3f,y
$07:e162  cd f1 33      cmp $33f1
$07:e165  1f 02 20 f1   ora $f12002,x
$07:e169  9a            txs
$07:e16a  10 0e         bpl $e17a
$07:e16c  ce 13 41      dec $4113
$07:e16f  ed dd 03      sbc $03dd
$07:e172  9a            txs
$07:e173  0b            phd
$07:e174  d0 12         bne $e188
$07:e176  4f 9b 10 df   eor $df109b
$07:e17a  ee 9a 03      inc $039a
$07:e17d  21 dc         and ($dc,x)
$07:e17f  ef ed f1 23   sbc $23f1ed
$07:e183  30 9a         bmi $e11f
$07:e185  cc f1 20      cpy $20f1
$07:e188  ee 14 51      inc $5114
$07:e18b  ef 01 9a 20   sbc $209a01
$07:e18f  de 25 43      dec $4325,x
$07:e192  21 fe         and ($fe,x)
$07:e194  e2 42         sep #$42
$07:e196  aa            tax
$07:e197  01 01         ora ($01,x)
$07:e199  33 ec         and ($ec,s),y
$07:e19b  f3 42         sbc ($42,s),y
$07:e19d  0e e0 aa      asl $aae0
$07:e1a0  33 0f         and ($0f,s),y
$07:e1a2  01 0d         ora ($0d,x)
$07:e1a4  f4 2f f0      pea $f02f
$07:e1a7  f1 aa         sbc ($aa),y
$07:e1a9  31 ca         and ($ca),y
$07:e1ab  16 4e         asl $4e,x
$07:e1ad  bd 13 20      lda $2013,x
$07:e1b0  dd 96 b2      cmp $b296,x
$07:e1b3  4f bd 24 2e   eor $2e24bd
$07:e1b7  ce 35 1b      dec $1b35
$07:e1ba  9a            txs
$07:e1bb  06 5e         asl $5e
$07:e1bd  ab            plb
$07:e1be  05 51         ora $51
$07:e1c0  dd e2 2f      cmp $2fe2,x
$07:e1c3  9a            txs
$07:e1c4  df 12 20 01   cmp $012012,x
$07:e1c8  0d c0 34      ora $34c0
$07:e1cb  1f 8a ac 24   ora $24ac8a,x
$07:e1cf  31 0e         and ($0e),y
$07:e1d1  cd 13 33      cmp $3313
$07:e1d4  0d 8a d1      ora $d18a
$07:e1d7  43 ea         eor $ea,s
$07:e1d9  b2 53         lda ($53)
$07:e1db  32 db         and ($db)
$07:e1dd  f3 8a         sbc ($8a,s),y
$07:e1df  0e 23 ef      asl $ef23
$07:e1e2  30 c0         bmi $e1a4
$07:e1e4  11 2f         ora ($2f),y
$07:e1e6  bb            tyx
$07:e1e7  9a            txs
$07:e1e8  e0 34         cpx #$34
$07:e1ea  1c af 11      trb $11af
$07:e1ed  1f cd 01 9a   ora $9a01cd,x
$07:e1f1  2f cd 23 1e   and $1e23cd
$07:e1f5  bb            tyx
$07:e1f6  e2 33         sep #$33
$07:e1f8  fe 8a 03      inc $038a,x
$07:e1fb  0e bc e2      asl $e2bc
$07:e1fe  66 10         ror $10
$07:e200  42 cb         wdm #$cb
$07:e202  9a            txs
$07:e203  14 2f         trb $2f
$07:e205  e0 12         cpx #$12
$07:e207  54 0e 11      mvn $11,$0e
$07:e20a  fe 9a f2      inc $f29a,x
$07:e20d  43 11         eor $11,s
$07:e20f  02 30         cop #$30
$07:e211  bb            tyx
$07:e212  06 72         asl $72
$07:e214  9a            txs
$07:e215  dd f2 31      cmp $31f2,x
$07:e218  ff 00 fe 15   sbc $15fe00,x
$07:e21c  4f aa ee 02   eor $02eeaa
$07:e220  2f dd 24 2e   and $2e24dd
$07:e224  df 01 96 ff   cmp $ff9601,x
$07:e228  dd f0 eb      cmp $ebf0,x
$07:e22b  b0 54         bcs $e281
$07:e22d  ea            nop
$07:e22e  bf 9a 3f bd   lda $bd3f9a,x
$07:e232  24 20         bit $20
$07:e234  cb            wai
$07:e235  f3 30         sbc ($30,s),y
$07:e237  f0 8a         beq $e1c3
$07:e239  0f f0 12 1f   ora $1f12f0
$07:e23d  03 40         ora $40,s
$07:e23f  db            stp
$07:e240  e3 8a         sbc $8a,s
$07:e242  75 10         adc $10,x
$07:e244  ff 01 00 24   sbc $240001,x
$07:e248  1e 04 7a      asl $7a04,x
$07:e24b  61 0c         adc ($0c,x)
$07:e24d  a1 74         lda ($74,x)
$07:e24f  ff 02 55 0d   sbc $0d5502,x
$07:e253  7a            ply
$07:e254  bb            tyx
$07:e255  e2 32         sep #$32
$07:e257  23 fc         and $fc,s
$07:e259  f2 fa         sbc ($fa)
$07:e25b  d5 9a         cmp $9a,x
$07:e25d  1f 11 ec f1   ora $f1ec11,x
$07:e261  21 fd         and ($fd,x)
$07:e263  f0 22         beq $e287
$07:e265  9a            txs
$07:e266  fa            plx
$07:e267  b0 42         bcs $e2ab
$07:e269  fe 00 fd      inc $fd00,x
$07:e26c  dd 03 86      cmp $8603,x
$07:e26f  67 2e         adc [$2e]
$07:e271  16 5e         asl $5e,x
$07:e273  ab            plb
$07:e274  f4 65 34      pea $3465
$07:e277  8a            txa
$07:e278  44 da f5      mvp $f5,$da
$07:e27b  3f e2 33 23   and $2333e2,x
$07:e27f  1f 9a 01 fe   ora $fe019a,x
$07:e283  15 40         ora $40,x
$07:e285  e0 21         cpx #$21
$07:e287  0f ef 9a 25   ora $259aef
$07:e28b  40            rti
$07:e28c  de 11 10      dec $1011,x
$07:e28f  21 0d         and ($0d,x)
$07:e291  df 9a 37 3e   cmp $3e379a,x
$07:e295  ad 24 0d      lda $0d24
$07:e298  d0 46         bne $e2e0
$07:e29a  2c 96 ec      bit $ec96
$07:e29d  de dd e1      dec $e1dd,x
$07:e2a0  31 dc         and ($dc),y
$07:e2a2  f2 30         sbc ($30)
$07:e2a4  9a            txs
$07:e2a5  ad 36 2d      lda $2d36
$07:e2a8  ad 25 2e      lda $2e25
$07:e2ab  cd f1 8a      cmp $8af1
$07:e2ae  22 10 fd e2   jsl $e2fd10
$07:e2b2  30 cd         bmi $e281
$07:e2b4  e1 46         sbc ($46,x)
$07:e2b6  8a            txa
$07:e2b7  2d d0 22      and $22d0
$07:e2ba  21 0f         and ($0f,x)
$07:e2bc  ff 34 42 8a   sbc $8a4234,x
$07:e2c0  0d e3 64      ora $64e3
$07:e2c3  fd df 26      sbc $26df,x
$07:e2c6  62 0f 8a      per $6cd8
$07:e2c9  fe 01 00      inc $0001,x
$07:e2cc  02 22         cop #$22
$07:e2ce  12 1e         ora ($1e)
$07:e2d0  bc 8a 13      ldy $138a,x
$07:e2d3  00 21         brk #$21
$07:e2d5  01 db         ora ($db,x)
$07:e2d7  f3 41         sbc ($41,s),y
$07:e2d9  ec 8a df      cpx $df8a
$07:e2dc  30 cb         bmi $e2a9
$07:e2de  03 42         ora $42,s
$07:e2e0  ec bd ed      cpx $edbd
$07:e2e3  9a            txs
$07:e2e4  e1 33         sbc ($33,x)
$07:e2e6  fb            xce
$07:e2e7  cf 22 1d be   cmp $be1d22
$07:e2eb  33 8a         and ($8a,s),y
$07:e2ed  1d cc f3      ora $f3cc,x
$07:e2f0  2d bd 22      and $22bd
$07:e2f3  32 2f         and ($2f)
$07:e2f5  8a            txa
$07:e2f6  ee 12 0e      inc $0e12
$07:e2f9  f0 26         beq $e321
$07:e2fb  51 dd         eor ($dd),y
$07:e2fd  f3 86         sbc ($86,s),y
$07:e2ff  22 23 45 40   jsl $404523
$07:e303  e1 54         sbc ($54,x)
$07:e305  eb            xba
$07:e306  f5 9a         sbc $9a,x
$07:e308  1e ef 24      asl $24ef,x
$07:e30b  3e df 22      rol $22df,x
$07:e30e  fd e4 9a      sbc $9ae4,x
$07:e311  53 ec         eor ($ec,s),y
$07:e313  d0 20         bne $e335
$07:e315  e0 34         cpx #$34
$07:e317  1f cd 9a 14   ora $149acd,x
$07:e31b  0d c0 34      ora $34c0
$07:e31e  1e cf 22      asl $22cf,x
$07:e321  fd 8a 9e      sbc $9e8a,x
$07:e324  45 2e         eor $2e
$07:e326  cc 01 1f      cpy $1f01
$07:e329  ed de 8a      sbc $8ade
$07:e32c  f2 22         sbc ($22)
$07:e32e  1f ef fe e0   ora $e0feef,x
$07:e332  0f 14 8a 54   ora $548a14
$07:e336  1e bb f4      asl $f4bb,x
$07:e339  63 1f         adc $1f,s
$07:e33b  02 33         cop #$33
$07:e33d  8a            txa
$07:e33e  1f e1 34 2f   ora $2f34e1,x
$07:e342  ef 24 64 2e   sbc $2e6424
$07:e346  8a            txa
$07:e347  cc f2 43      cpy $43f2
$07:e34a  10 02         bpl $e34e
$07:e34c  42 ca         wdm #$ca
$07:e34e  d1 8a         cmp ($8a),y
$07:e350  33 1f         and ($1f,s),y
$07:e352  e0 11         cpx #$11
$07:e354  ee 13 1d      inc $1d13
$07:e357  cc 9a f1      cpy $f19a
$07:e35a  20 de 34      jsr $34de
$07:e35d  0c cd 01      tsb $01cd
$07:e360  20 8a dd      jsr $dd8a
$07:e363  13 eb         ora ($eb,s),y
$07:e365  af 02 00 ec   lda $ec0002
$07:e369  d1 7a         cmp ($7a),y
$07:e36b  51 db         eor ($db),y
$07:e36d  ae 12 ed      ldx $ed12
$07:e370  d1 66         cmp ($66),y
$07:e372  1b            tcs
$07:e373  8a            txa
$07:e374  e0 10         cpx #$10
$07:e376  f0 24         beq $e39c
$07:e378  3f ce 35 3e   and $3e35ce,x
$07:e37c  9a            txs
$07:e37d  e1 34         sbc ($34,x)
$07:e37f  0d cf 34      ora $34cf
$07:e382  30 ef         bmi $e373
$07:e384  10 96         bpl $e31c
$07:e386  ff 01 32 fd   sbc $fd3201,x
$07:e38a  e1 31         sbc ($31,x)
$07:e38c  db            stp
$07:e38d  e3 9a         sbc $9a,s
$07:e38f  3e bd 13      rol $13bd,x
$07:e392  3f ce 23 31   and $3123ce,x
$07:e396  ed 8a d0      sbc $d08a
$07:e399  0e e1 43      asl $43e1
$07:e39c  0d ef 10      ora $10ef
$07:e39f  d9 9a e0      cmp $e09a,y
$07:e3a2  33 0d         and ($0d,s),y
$07:e3a4  cf 13 1e ce   cmp $ce1e13
$07:e3a8  00 8a         brk #$8a
$07:e3aa  01 01         ora ($01,x)
$07:e3ac  22 ff db bf   jsl $bfdbff
$07:e3b0  24 45         bit $45
$07:e3b2  8a            txa
$07:e3b3  41 ec         eor ($ec,x)
$07:e3b5  ce 23 43      dec $4323
$07:e3b8  21 22         and ($22,x)
$07:e3ba  21 8a         and ($8a,x)
$07:e3bc  0e 03 53      asl $5303
$07:e3bf  1f 00 14 65   ora $651400,x
$07:e3c3  2e 8a ab      rol $ab8a
$07:e3c6  05 64         ora $64
$07:e3c8  0e f2 32      asl $32f2
$07:e3cb  ec e1 9a      cpx $9ae1
$07:e3ce  00 01         brk #$01
$07:e3d0  11 fe         ora ($fe),y
$07:e3d2  f1 12         sbc ($12),y
$07:e3d4  fd cf 8a      sbc $8acf,x
$07:e3d7  26 40         rol $40
$07:e3d9  bb            tyx
$07:e3da  e2 20         sep #$20
$07:e3dc  db            stp
$07:e3dd  be 24 8a      ldx $8a24,y
$07:e3e0  2f dc ce f0   and $f0cedc
$07:e3e4  01 1f         ora ($1f,x)
$07:e3e6  cb            wai
$07:e3e7  e2 8a         sep #$8a
$07:e3e9  30 cc         bmi $e3b7
$07:e3eb  03 2e         ora $2e,s
$07:e3ed  bd 24 3e      lda $3e24,x
$07:e3f0  bc 8a 37      ldy $378a,x
$07:e3f3  3c bf 45      bit $45bf,x
$07:e3f6  1c b0 57      trb $57b0
$07:e3f9  3e 8a d0      rol $d08a,x
$07:e3fc  42 fc         wdm #$fc
$07:e3fe  e2 44         sep #$44
$07:e400  21 01         and ($01,x)
$07:e402  0e 9a f1      asl $f19a
$07:e405  22 0d d0 45   jsl $45d00d
$07:e409  3d ad 24      and $24ad,x
$07:e40c  9a            txs
$07:e40d  41 dc         eor ($dc,x)
$07:e40f  f1 31         sbc ($31),y
$07:e411  ed 03 31      sbc $3103
$07:e414  fe 9a ff      inc $ff9a,x
$07:e417  fe f1 33      inc $33f1,x
$07:e41a  0d d0 21      ora $21d0
$07:e41d  ec 9a c0      cpx $c09a
$07:e420  45 0c         eor $0c
$07:e422  be 23 2e      ldx $2e23,y
$07:e425  cc f1 8a      cpy $8af1
$07:e428  22 12 00 ee   jsl $ee0012
$07:e42c  dd df 12      cmp $12df,x
$07:e42f  46 8a         lsr $8a
$07:e431  62 da be      per $a30e
$07:e434  26 52         rol $52
$07:e436  12 32         ora ($32)
$07:e438  20 9a 0f      jsr $0f9a
$07:e43b  02 32         cop #$32
$07:e43d  00 00         brk #$00
$07:e43f  02 43         cop #$43
$07:e441  0e 8a ce      asl $ce8a
$07:e444  15 41         ora $41,x
$07:e446  e0 34         cpx #$34
$07:e448  20 ed ef      jsr $efed
$07:e44b  7a            ply
$07:e44c  00 23         brk #$23
$07:e44e  43 1e         eor $1e,s
$07:e450  bb            tyx
$07:e451  d0 0e         bne $e461
$07:e453  aa            tax
$07:e454  8a            txa
$07:e455  03 41         ora $41,s
$07:e457  ca            dex
$07:e458  c0 23         cpy #$23
$07:e45a  fb            xce
$07:e45b  be 22 9a      ldx $9a22,y
$07:e45e  0f f0 fe d0   ora $d0fef0
$07:e462  23 0d         and $0d,s
$07:e464  ce 12 9a      dec $9a12
$07:e467  1e df 23      asl $23df,x
$07:e46a  1e cd 13      asl $13cd,x
$07:e46d  1e e0 8a      asl $8ae0,x
$07:e470  55 2c         eor $2c,x
$07:e472  be 22 0f      ldx $0f22,y
$07:e475  02 33         cop #$33
$07:e477  0e 8a f3      asl $f38a
$07:e47a  31 ed         and ($ed),y
$07:e47c  d1 45         cmp ($45),y
$07:e47e  31 01         and ($01),y
$07:e480  0e 9a f0      asl $f09a
$07:e483  11 1f         ora ($1f),y
$07:e485  f0 34         beq $e4bb
$07:e487  1d bd 25      ora $25bd,x
$07:e48a  9a            txs
$07:e48b  40            rti
$07:e48c  dd f2 20      cmp $20f2,x
$07:e48f  ce 15 30      dec $3015
$07:e492  de 9a 00      dec $009a,x
$07:e495  fd e1 43      sbc $43e1,x
$07:e498  0d df 22      ora $22df
$07:e49b  fb            xce
$07:e49c  9a            txs
$07:e49d  b0 45         bcs $e4e4
$07:e49f  0c be 24      tsb $24be
$07:e4a2  1d cd f1      ora $f1cd,x
$07:e4a5  9a            txs
$07:e4a6  10 01         bpl $e4a9
$07:e4a8  20 fe ee      jsr $eefe
$07:e4ab  f0 01         beq $e4ae
$07:e4ad  24 9a         bit $9a
$07:e4af  41 dc         eor ($dc,x)
$07:e4b1  e0 12         cpx #$12
$07:e4b3  32 11         and ($11)
$07:e4b5  11 10         ora ($10),y
$07:e4b7  9a            txs
$07:e4b8  00 01         brk #$01
$07:e4ba  33 20         and ($20,s),y
$07:e4bc  ee 13 53      inc $5313
$07:e4bf  1e 8a bc      asl $bc8a,x
$07:e4c2  15 42         ora $42,x
$07:e4c4  00 13         brk #$13
$07:e4c6  42 eb         wdm #$eb
$07:e4c8  be 8a 13      ldx $138a,y
$07:e4cb  42 0f         wdm #$0f
$07:e4cd  fe ee 01      inc $01ee,x
$07:e4d0  0e cd 8a      asl $8acd
$07:e4d3  14 3e         trb $3e
$07:e4d5  aa            tax
$07:e4d6  f4 4f bb      pea $bb4f
$07:e4d9  d0 20         bne $e4fb
$07:e4db  9a            txs
$07:e4dc  ff 10 fd d0   sbc $d0fd10,x
$07:e4e0  33 fd         and ($fd,s),y
$07:e4e2  ce 03 9a      dec $9a03
$07:e4e5  1f df 23 0d   ora $0d23df,x
$07:e4e9  ce 12 10      dec $1012
$07:e4ec  ff 8a 34 0c   sbc $0c348a,x
$07:e4f0  cf 23 0e f1   cmp $f10e23
$07:e4f4  44 0d 8a      mvp $8a,$0d
$07:e4f7  e3 42         sbc $42,s
$07:e4f9  eb            xba
$07:e4fa  b0 67         bcs $e563
$07:e4fc  51 ff         eor ($ff),y
$07:e4fe  fd 9a e1      sbc $e19a,x
$07:e501  22 0f e1 44   jsl $44e10f
$07:e505  0c bd 26      tsb $26bd
$07:e508  9a            txs
$07:e509  50 cc         bvc $e4d7
$07:e50b  f3 3f         sbc ($3f,s),y
$07:e50d  cd 15 50      cmp $5015
$07:e510  dd 9a f0      cmp $f09a,x
$07:e513  0d e1 43      ora $43e1
$07:e516  0d c0 32      ora $32c0
$07:e519  da            phx
$07:e51a  9a            txs
$07:e51b  b1 65         lda ($65),y
$07:e51d  0b            phd
$07:e51e  ad 35 1d      lda $1d35
$07:e521  bd f1 9a      lda $9af1,x
$07:e524  10 01         bpl $e527
$07:e526  20 fe ef      jsr $effe
$07:e529  ff f1 35 9a   sbc $9a35f1,x
$07:e52d  31 ec         and ($ec),y
$07:e52f  df 23 32 11   cmp $113223,x
$07:e533  01 12         ora ($12,x)
$07:e535  9a            txs
$07:e536  0f 02 33 2f   ora $2f3302
$07:e53a  ef 13 54 1e   sbc $1e5413
$07:e53e  8a            txa
$07:e53f  ac 04 54      ldy $5404
$07:e542  10 03         bpl $e547
$07:e544  32 ec         and ($ec)
$07:e546  be 8a 23      ldx $238a,y
$07:e549  21 10         and ($10,x)
$07:e54b  fd de 13      sbc $13de,x
$07:e54e  1c ac 9a      trb $9aac
$07:e551  13 2e         ora ($2e,s),y
$07:e553  cd 03 2f      cmp $2f03
$07:e556  de ff 01      dec $01ff,x
$07:e559  9a            txs
$07:e55a  0f 00 fd e0   ora $e0fd00
$07:e55e  32 0c         and ($0c)
$07:e560  ce 12 9a      dec $9a12
$07:e563  1f e0 12 0d   ora $0d12e0,x
$07:e567  ce 12 20      dec $2012
$07:e56a  ef 8a 34 0c   sbc $0c348a
$07:e56e  ce 23 1e      dec $1e23
$07:e571  e1 44         sbc ($44,x)
$07:e573  0e 8a e1      asl $e18a
$07:e576  33 eb         and ($eb,s),y
$07:e578  c1 56         cmp ($56,x)
$07:e57a  51 0f         eor ($0f),y
$07:e57c  ec 9a f0      cpx $f09a
$07:e57f  23 1e         and $1e,s
$07:e581  e0 35         cpx #$35
$07:e583  2c 9d 36      bit $369d
$07:e586  9a            txs
$07:e587  50 cc         bvc $e555
$07:e589  f2 30         sbc ($30)
$07:e58b  cc 25 50      cpy $5025
$07:e58e  dd 9a f0      cmp $f09a,x
$07:e591  fd e1 54      sbc $54e1,x
$07:e594  0b            phd
$07:e595  c0 42         cpy #$42
$07:e597  d9 9a b1      cmp $b19a,y
$07:e59a  66 0a         ror $0a
$07:e59c  9e 44 1d      stz $1d44,x
$07:e59f  cc f1 9a      cpy $9af1
$07:e5a2  10 01         bpl $e5a5
$07:e5a4  20 fe fe      jsr $fefe
$07:e5a7  ef 01 35 9a   sbc $9a3501
$07:e5ab  40            rti
$07:e5ac  ec df 23      cpx $23df
$07:e5af  33 10         and ($10,s),y
$07:e5b1  02 11         cop #$11
$07:e5b3  9a            txs
$07:e5b4  00 01         brk #$01
$07:e5b6  34 2f         bit $2f,x
$07:e5b8  ef 13 54 1e   sbc $1e5413
$07:e5bc  8a            txa
$07:e5bd  ac 05 53      ldy $5305
$07:e5c0  10 03         bpl $e5c5
$07:e5c2  42 ec         wdm #$ec
$07:e5c4  be 8a 13      ldx $138a,y
$07:e5c7  21 11         and ($11,x)
$07:e5c9  fc cf 23      jsr ($23cf,x)
$07:e5cc  0c ac 9a      tsb $9aac
$07:e5cf  03 2f         ora $2f,s
$07:e5d1  dd f2 20      cmp $20f2,x
$07:e5d4  ed ef 11      sbc $11ef
$07:e5d7  9a            txs
$07:e5d8  0f 00 fd e0   ora $e0fd00
$07:e5dc  22 1d bd 13   jsl $13bd1d
$07:e5e0  9a            txs
$07:e5e1  2f df 12 0e   and $0e12df
$07:e5e5  ce 12 10      dec $1012
$07:e5e8  ff 8a 14 1d   sbc $1d148a,x
$07:e5ec  ae 24 1e      ldx $1e24
$07:e5ef  d1 44         cmp ($44),y
$07:e5f1  0e 8a e1      asl $e18a
$07:e5f4  42 eb         wdm #$eb
$07:e5f6  c0 67         cpy #$67
$07:e5f8  41 0f         eor ($0f,x)
$07:e5fa  dd 9a f0      cmp $f09a,x
$07:e5fd  23 1e         and $1e,s
$07:e5ff  e0 45         cpx #$45
$07:e601  1c 9d 27      trb $279d
$07:e604  9a            txs
$07:e605  61 bb         adc ($bb,x)
$07:e607  f2 30         sbc ($30)
$07:e609  cd 16 50      cmp $5016
$07:e60c  cd 9a 00      cmp $009a
$07:e60f  fc e1 54      jsr ($54e1,x)
$07:e612  0c c0 32      tsb $32c0
$07:e615  e9 9a         sbc #$9a
$07:e617  a0 76         ldy #$76
$07:e619  0a            asl a
$07:e61a  ae 34 2d      ldx $2d34
$07:e61d  bc f0 9a      ldy $9af0,x
$07:e620  11 11         ora ($11),y
$07:e622  10 fe         bpl $e622
$07:e624  ef fe f2 44   sbc $44f2fe
$07:e628  9a            txs
$07:e629  31 ed         and ($ed),y
$07:e62b  df 13 32 11   cmp $113213,x
$07:e62f  12 11         ora ($11)
$07:e631  9a            txs
$07:e632  0f 02 33 20   ora $203302
$07:e636  ef 04 55 0e   sbc $0e5504
$07:e63a  8a            txa
$07:e63b  9d 05 54      sta $5405,x
$07:e63e  0f 14 41 ec   ora $ec4114
$07:e642  cd 8a 12      cmp $128a
$07:e645  32 10         and ($10)
$07:e647  ed df 12      sbc $12df
$07:e64a  1c ac 9a      trb $9aac
$07:e64d  12 2f         ora ($2f)
$07:e64f  dd f2 20      cmp $20f2,x
$07:e652  ed ef 11      sbc $11ef
$07:e655  9a            txs
$07:e656  0f 01 ed d1   ora $d1ed01
$07:e65a  23 0d         and $0d,s
$07:e65c  bd 13 9a      lda $9a13,x
$07:e65f  2f df 12 0e   and $0e12df
$07:e663  ce 12 10      dec $1012
$07:e666  ef 8a 35 0c   sbc $0c358a
$07:e66a  be 23 1e      ldx $1e23,y
$07:e66d  e0 44         cpx #$44
$07:e66f  1d 8a e2      ora $e28a,x
$07:e672  42 db         wdm #$db
$07:e674  c1 56         cmp ($56,x)
$07:e676  52 ff         eor ($ff)
$07:e678  ed aa f0      sbc $f0aa
$07:e67b  21 0f         and ($0f,x)
$07:e67d  f0 23         beq $e6a2
$07:e67f  1e ce 14      asl $14ce,x
$07:e682  9a            txs
$07:e683  60            rts
$07:e684  bb            tyx
$07:e685  f3 4f         sbc ($4f,s),y
$07:e687  bd 26 40      lda $4026,x
$07:e68a  dd 9a f1      cmp $f19a,x
$07:e68d  fc d2 54      jsr ($54d2,x)
$07:e690  fc c1 32      jsr ($32c1,x)
$07:e693  da            phx
$07:e694  9a            txs
$07:e695  a0 67         ldy #$67
$07:e697  0a            asl a
$07:e698  9e 35 2d      stz $2d35,x
$07:e69b  ac f1 9a      ldy $9af1
$07:e69e  10 12         bpl $e6b2
$07:e6a0  1f ff ee ef   ora $efeeff,x
$07:e6a4  02 34         cop #$34
$07:e6a6  9a            txs
$07:e6a7  41 ec         eor ($ec,x)
$07:e6a9  de 23 42      dec $4223,x
$07:e6ac  10 12         bpl $e6c0
$07:e6ae  21 9a         and ($9a,x)
$07:e6b0  ff 02 43 2f   sbc $2f4302,x
$07:e6b4  fe 13 64      inc $6413,x
$07:e6b7  1d 8a ad      ora $ad8a,x
$07:e6ba  14 54         trb $54
$07:e6bc  00 13         brk #$13
$07:e6be  42 eb         wdm #$eb
$07:e6c0  ce 8a 02      dec $028a
$07:e6c3  32 10         and ($10)
$07:e6c5  fd de 13      sbc $13de,x
$07:e6c8  0c ac 9a      tsb $9aac
$07:e6cb  13 2e         ora ($2e,s),y
$07:e6cd  cd 12 2f      cmp $2f12
$07:e6d0  ed e0 10      sbc $10e0
$07:e6d3  9a            txs
$07:e6d4  f0 10         beq $e6e6
$07:e6d6  ed e0 33      sbc $33e0
$07:e6d9  fc ce 13      jsr ($13ce,x)
$07:e6dc  9a            txs
$07:e6dd  2e df 22      rol $22df
$07:e6e0  0d ce 13      ora $13ce
$07:e6e3  2f df 8a 46   and $468adf
$07:e6e7  0b            phd
$07:e6e8  af 24 0e e1   lda $e10e24
$07:e6ec  44 0c 8a      mvp $8a,$0c
$07:e6ef  e3 42         sbc $42,s
$07:e6f1  eb            xba
$07:e6f2  b0 67         bcs $e75b
$07:e6f4  41 0f         eor ($0f,x)
$07:e6f6  ed ab f0      sbc $f0ab
$07:e6f9  21 0f         and ($0f,x)
$07:e6fb  f0 23         beq $e720
$07:e6fd  1e ce 14      asl $14ce,x
$07:e700  fc 12 02      jsr ($0212,x)
$07:e703  00 00         brk #$00
$07:e705  00 00         brk #$00
$07:e707  00 00         brk #$00
$07:e709  00 00         brk #$00
$07:e70b  7a            ply
$07:e70c  4d 20 f0      eor $f020
$07:e70f  10 f0         bpl $e701
$07:e711  0f 0f ff 6a   ora $6aff0f
$07:e715  dc f1 34      jml [$34f1]
$07:e718  54 20 ef      mvn $ef,$20
$07:e71b  dd ef 5a      cmp $5aef,x
$07:e71e  ee ec 02      inc $02ec
$07:e721  34 0f         bit $0f,x
$07:e723  23 30         and $30,s
$07:e725  dd 5a f0      cmp $f05a,x
$07:e728  43 10         eor $10,s
$07:e72a  dd f1 11      cmp $11f1,x
$07:e72d  0f f0 5a 21   ora $215af0
$07:e731  10 00         bpl $e733
$07:e733  02 42         cop #$42
$07:e735  00 1f         brk #$1f
$07:e737  f0 5a         beq $e793
$07:e739  11 22         ora ($22),y
$07:e73b  1e e0 23      asl $23e0,x
$07:e73e  0d db de      ora $dedb
$07:e741  7a            ply
$07:e742  fd df 34      sbc $34df,x
$07:e745  43 1f         eor $1f,s
$07:e747  de ef f1      dec $f1ef,x
$07:e74a  4a            lsr a
$07:e74b  1e 11 f0      asl $f011,x
$07:e74e  fe 13 f0      inc $f013,x
$07:e751  32 25         and ($25)
$07:e753  4a            lsr a
$07:e754  4f 00 cf 20   eor $20cf00
$07:e758  00 c1         brk #$c1
$07:e75a  33 10         and ($10,s),y
$07:e75c  5a            phy
$07:e75d  23 20         and $20,s
$07:e75f  10 01         bpl $e762
$07:e761  11 31         ora ($31),y
$07:e763  0e de 7a      asl $7ade
$07:e766  0f ee ed e2   ora $e2edee
$07:e76a  56 41         lsr $41,x
$07:e76c  fd ed 56      sbc $56ed,x
$07:e76f  ea            nop
$07:e770  bb            tyx
$07:e771  bb            tyx
$07:e772  bc ef 00      ldy $00ef,x
$07:e775  12 1f         ora ($1f)
$07:e777  4a            lsr a
$07:e778  f3 3d         sbc ($3d,s),y
$07:e77a  b0 2f         bcs $e7ab
$07:e77c  02 23         cop #$23
$07:e77e  2f 00 5a 21   and $215a00
$07:e782  f1 42         sbc ($42),y
$07:e784  ff 01 31 01   sbc $013101,x
$07:e788  1e 9a 00      asl $009a,x
$07:e78b  f0 0f         beq $e79c
$07:e78d  ef 02 42 0f   sbc $0f4202
$07:e791  fe 6a bf      inc $bf6a,x
$07:e794  13 00         ora ($00,s),y
$07:e796  0f f0 10 02   ora $0210f0
$07:e79a  21 5a         and ($5a,x)
$07:e79c  db            stp
$07:e79d  e6 21         inc $21
$07:e79f  41 00         eor ($00,x)
$07:e7a1  ff e1 5d 6a   sbc $6a5de1,x
$07:e7a5  f0 02         beq $e7a9
$07:e7a7  31 00         and ($00),y
$07:e7a9  fe ff fd      inc $fdff,x
$07:e7ac  da            phx
$07:e7ad  8a            txa
$07:e7ae  ed 15 72      sbc $7215
$07:e7b1  fe ed f0      inc $f0ed,x
$07:e7b4  01 00         ora ($00,x)
$07:e7b6  5a            phy
$07:e7b7  f3 ef         sbc ($ef,s),y
$07:e7b9  1f d1 67 3f   ora $3f67d1,x
$07:e7bd  dc 03 5a      jml [$5a03]
$07:e7c0  21 00         and ($00,x)
$07:e7c2  0e e1 44      asl $44e1
$07:e7c5  ac 53 10      ldy $1053
$07:e7c8  aa            tax
$07:e7c9  00 00         brk #$00
$07:e7cb  0f 00 fd 04   ora $04fd00
$07:e7cf  5e e1 86      lsr $86e1,x
$07:e7d2  62 2f f1      per $d904
$07:e7d5  10 ff         bpl $e7d6
$07:e7d7  ff f0 01 5a   sbc $5a01f0,x
$07:e7db  f0 c3         beq $e7a0
$07:e7dd  1f 14 3f 13   ora $133f14,x
$07:e7e1  1e f0 6a      asl $6af0,x
$07:e7e4  00 fe         brk #$fe
$07:e7e6  e2 40         sep #$40
$07:e7e8  f1 01         sbc ($01),y
$07:e7ea  00 1c         brk #$1c
$07:e7ec  b6 00         ldx $00,y
$07:e7ee  0f ec c2 42   ora $42c2ec
$07:e7f2  21 01         and ($01,x)
$07:e7f4  0f 76 04 71   ora $710476
$07:e7f8  bb            tyx
$07:e7f9  cd f0 12      cmp $12f0
$07:e7fc  20 00 7a      jsr $7a00
$07:e7ff  11 10         ora ($10),y
$07:e801  10 00         bpl $e803
$07:e803  00 ff         brk #$ff
$07:e805  01 ec         ora ($ec,x)
$07:e807  7a            ply
$07:e808  05 30         ora $30
$07:e80a  01 11         ora ($11,x)
$07:e80c  0e ee ee      asl $eeee
$07:e80f  1f b6 fe cd   ora $cdfeb6,x
$07:e813  24 21         bit $21
$07:e815  11 00         ora ($00),y
$07:e817  00 00         brk #$00
$07:e819  6a            ror a
$07:e81a  6a            ror a
$07:e81b  1a            inc a
$07:e81c  02 45         cop #$45
$07:e81e  22 00 12 00   jsl $001200
$07:e822  7a            ply
$07:e823  00 0f         brk #$0f
$07:e825  f0 0f         beq $e836
$07:e827  f1 0f         sbc ($0f),y
$07:e829  e2 44         sep #$44
$07:e82b  7a            ply
$07:e82c  ff 01 ff f0   sbc $f0ff01,x
$07:e830  ff 00 fe eb   sbc $ebfe00,x
$07:e834  a6 db         ldx $db
$07:e836  b1 54         lda ($54),y
$07:e838  33 21         and ($21,s),y
$07:e83a  00 00         brk #$00
$07:e83c  0f 7a 03 4e   ora $4e037a
$07:e840  01 22         ora ($22,x)
$07:e842  11 10         ora ($10),y
$07:e844  f0 f0         beq $e836
$07:e846  6a            ror a
$07:e847  fe db c5      inc $c5db,x
$07:e84a  71 df         adc ($df),y
$07:e84c  21 24         and ($24,x)
$07:e84e  4f 9a 00 0f   eor $0f009a
$07:e852  00 00         brk #$00
$07:e854  00 0f         brk #$0f
$07:e856  0e db a6      asl $a6db
$07:e859  c3 64         cmp $64,s
$07:e85b  32 00         and ($00)
$07:e85d  00 00         brk #$00
$07:e85f  00 ff         brk #$ff
$07:e861  7a            ply
$07:e862  16 f0         asl $f0,x
$07:e864  22 10 00 fe   jsl $fe0010
$07:e868  00 fe         brk #$fe
$07:e86a  6a            ror a
$07:e86b  cd 26 40      cmp $4026
$07:e86e  ff 10 16 4f   sbc $4f1610,x
$07:e872  d0 b6         bne $e82a
$07:e874  00 00         brk #$00
$07:e876  00 00         brk #$00
$07:e878  0f da d4 52   ora $52d4da
$07:e87c  a6 24         ldx $24
$07:e87e  00 1f         brk #$1f
$07:e880  f0 10         beq $e892
$07:e882  ff 00 ff 7a   sbc $7aff00,x
$07:e886  65 e0         adc $e0
$07:e888  0e f1 10      asl $10f1
$07:e88b  0f ff fe 7a   ora $7afeff
$07:e88f  01 11         ora ($11,x)
$07:e891  fd 17 4d      sbc $4d17,x
$07:e894  e1 00         sbc ($00,x)
$07:e896  0f b6 00 00   ora $0000b6
$07:e89a  0f fd bb 46   ora $46bbfd
$07:e89e  12 3f         ora ($3f)
$07:e8a0  96 32         stx $32,y
$07:e8a2  df 01 1e ef   cmp $ef1e01,x
$07:e8a6  ff ff f0 6a   sbc $6af0ff,x
$07:e8aa  3e f2 20      rol $20f2,x
$07:e8ad  0e e0 fb      asl $fbe0
$07:e8b0  df 24 8a 0f   cmp $0f8a24,x
$07:e8b4  f0 42         beq $e8f8
$07:e8b6  ff 10 0f f0   sbc $f00f10,x
$07:e8ba  fe b6 ff      inc $ffb6,x
$07:e8bd  0f bb 15 31   ora $3115bb
$07:e8c1  21 01         and ($01,x)
$07:e8c3  0f 86 d6 2d   ora $2dd686
$07:e8c7  de de ed      dec $edde,x
$07:e8ca  e1 21         sbc ($21,x)
$07:e8cc  00 7a         brk #$7a
$07:e8ce  22 2e c0 3f   jsl $3fc02e
$07:e8d2  be 03 3f      ldx $3f03,y
$07:e8d5  be 8a 34      ldx $348a,y
$07:e8d8  0e 10 00      asl $0010
$07:e8db  0f 00 de 2f   ora $2fde00
$07:e8df  b6 fd         ldx $fd,y
$07:e8e1  9d 64 12      sta $1264,x
$07:e8e4  12 1f         ora ($1f)
$07:e8e6  f0 01         beq $e8e9
$07:e8e8  8a            txa
$07:e8e9  ad d2 11      lda $11d2
$07:e8ec  02 10         cop #$10
$07:e8ee  00 01         brk #$01
$07:e8f0  10 8a         bpl $e87c
$07:e8f2  e0 00         cpx #$00
$07:e8f4  f0 ff         beq $e8f5
$07:e8f6  11 0f         ora ($0f),y
$07:e8f8  e2 41         sep #$41
$07:e8fa  aa            tax
$07:e8fb  00 00         brk #$00
$07:e8fd  00 f0         brk #$f0
$07:e8ff  01 f0         ora ($f0,x)
$07:e901  0f db ba 05   ora $05badb
$07:e905  4d f2 d0      eor $d0f2
$07:e908  00 00         brk #$00
$07:e90a  01 f0         ora ($f0,x)
$07:e90c  7a            ply
$07:e90d  e3 d7         sbc $d7,s
$07:e90f  22 2f 02 10   jsl $10022f
$07:e913  fd 0f 8a      sbc $8a0f,x
$07:e916  ff f0 12 0f   sbc $0f12f0,x
$07:e91a  ff 14 2e f1   sbc $f12e14,x
$07:e91e  b6 00         ldx $00,y
$07:e920  00 00         brk #$00
$07:e922  00 00         brk #$00
$07:e924  fe cb 26      inc $26cb,x
$07:e927  a6 43         ldx $43
$07:e929  3f 10 f0 00   and $00f010,x
$07:e92d  0f ff 00 7a   ora $7a00ff
$07:e931  df 62 f1 0f   cmp $0ff162,x
$07:e935  02 fe         cop #$fe
$07:e937  e0 0e         cpx #$0e
$07:e939  8a            txa
$07:e93a  e0 21         cpx #$21
$07:e93c  ff f1 43 ef   sbc $ef43f1,x
$07:e940  00 00         brk #$00
$07:e942  b6 00         ldx $00,y
$07:e944  00 00         brk #$00
$07:e946  00 fe         brk #$fe
$07:e948  bb            tyx
$07:e949  26 22         rol $22
$07:e94b  96 5c         stx $5c,y
$07:e94d  21 f1         and ($f1,x)
$07:e94f  f0 0f         beq $e960
$07:e951  ef ff f0 7a   sbc $7af0ff
$07:e955  31 00         and ($00),y
$07:e957  0f f0 00 0e   ora $0e00f0
$07:e95b  dc e4 8a      jml [$8ae4]
$07:e95e  30 ef         bmi $e94f
$07:e960  02 42         cop #$42
$07:e962  ee f1 10      inc $10f1
$07:e965  ef b6 00 00   sbc $0000b6
$07:e969  ff eb c4 52   sbc $52c4eb,x
$07:e96d  20 f1 8a      jsr $8af1
$07:e970  af c3 5e e1   lda $e15ec3
$07:e974  00 00         brk #$00
$07:e976  22 0f 7a 02   jsl $027a0f
$07:e97a  f0 2e         beq $e9aa
$07:e97c  f2 dc         sbc ($dc)
$07:e97e  de 34 2e      dec $2e34,x
$07:e981  8a            txa
$07:e982  ff 23 2f ff   sbc $ff2f23,x
$07:e986  00 0f         brk #$0f
$07:e988  f0 0f         beq $e999
$07:e98a  b6 00         ldx $00,y
$07:e98c  fe bc 26      inc $26bc,x
$07:e98f  20 20 01      jsr $0120
$07:e992  0f 86 12 fc   ora $fc1286
$07:e996  ee de ff      inc $ffde
$07:e999  13 32         ora ($32,s),y
$07:e99b  11 6a         ora ($6a),y
$07:e99d  45 db         eor $db
$07:e99f  e0 db         cpx #$db
$07:e9a1  c0 54         cpy #$54
$07:e9a3  fc d2 8a      jsr ($8ad2,x)
$07:e9a6  43 fe         eor $fe,s
$07:e9a8  0f 01 fe 00   ora $00fe01
$07:e9ac  00 0e         brk #$0e
$07:e9ae  b6 eb         ldx $eb,y
$07:e9b0  b2 72         lda ($72)
$07:e9b2  12 f1         ora ($f1)
$07:e9b4  1f f0 00 7a   ora $7a00f0,x
$07:e9b8  c2 d1         rep #$d1
$07:e9ba  30 13         bmi $e9cf
$07:e9bc  20 f0 12      jsr $12f0
$07:e9bf  fe 8a ff      inc $ff8a,x
$07:e9c2  11 ee         ora ($ee),y
$07:e9c4  12 1f         ora ($1f)
$07:e9c6  ee 15 4e      inc $4e15
$07:e9c9  aa            tax
$07:e9ca  0f 00 1f 0f   ora $0f1f00
$07:e9ce  01 1f         ora ($1f,x)
$07:e9d0  ec c5 b6      cpx $b6c5
$07:e9d3  55 12         eor $12,x
$07:e9d5  1f 10 ff 00   ora $00ff10,x
$07:e9d9  0f 00 7a f9   ora $f97a00
$07:e9dd  64 20         stz $20
$07:e9df  0f f1 32 cb   ora $cb32f1
$07:e9e3  12 8a         ora ($8a)
$07:e9e5  ff 00 01 0f   sbc $0f0100,x
$07:e9e9  e2 51         sep #$51
$07:e9eb  e0 ff         cpx #$ff
$07:e9ed  b6 00         ldx $00,y
$07:e9ef  00 00         brk #$00
$07:e9f1  00 0f         brk #$0f
$07:e9f3  da            phx
$07:e9f4  d5 52         cmp $52,x
$07:e9f6  9a            txs
$07:e9f7  0a            asl a
$07:e9f8  e3 e0         sbc $e0,s
$07:e9fa  01 1f         ora ($1f,x)
$07:e9fc  f1 00         sbc ($00),y
$07:e9fe  01 7a         ora ($7a,x)
$07:ea00  23 0f         and $0f,s
$07:ea02  00 02         brk #$02
$07:ea04  2d c0 1e      and $1ec0
$07:ea07  df 8a 02 1e   cmp $1e028a,x
$07:ea0b  f0 34         beq $ea41
$07:ea0d  1e e0 00      asl $00e0,x
$07:ea10  ff b6 00 00   sbc $0000b6,x
$07:ea14  0f fe ce 34   ora $34cefe
$07:ea18  21 10         and ($10,x)
$07:ea1a  86 12         stx $12
$07:ea1c  dc f1 ec      jml [$ecf1]
$07:ea1f  de de f0      dec $f0de,x
$07:ea22  23 7a         and $7a,s
$07:ea24  0e e3 30      asl $30e3
$07:ea27  db            stp
$07:ea28  f2 fe         sbc ($fe)
$07:ea2a  e0 52         cpx #$52
$07:ea2c  8a            txa
$07:ea2d  ee 03 41      inc $4103
$07:ea30  ef 0f 00 ff   sbc $ff000f
$07:ea34  00 b6         brk #$b6
$07:ea36  00 0f         brk #$0f
$07:ea38  db            stp
$07:ea39  d3 51         cmp ($51,s),y
$07:ea3b  22 01 1f 8a   jsl $8a1f01
$07:ea3f  24 3f         bit $3f
$07:ea41  e1 20         sbc ($20,x)
$07:ea43  f1 22         sbc ($22),y
$07:ea45  0f 01 7a ff   ora $ff7a01
$07:ea49  31 bb         and ($bb),y
$07:ea4b  12 ee         ora ($ee)
$07:ea4d  02 2f         cop #$2f
$07:ea4f  df 8a 24 2f   cmp $2f248a,x
$07:ea53  ff f0 0f ef   sbc $ef0ff0,x
$07:ea57  11 0f         ora ($0f),y
$07:ea59  b6 fd         ldx $fd,y
$07:ea5b  bd 55 12      lda $1255,x
$07:ea5e  10 10         bpl $ea70
$07:ea60  00 f0         brk #$f0
$07:ea62  8a            txa
$07:ea63  1b            tcs
$07:ea64  f4 0f 12      pea $120f
$07:ea67  20 00 00      jsr $0000
$07:ea6a  00 8a         brk #$8a
$07:ea6c  0f f0 fe 11   ora $11fef0
$07:ea70  20 ee 03      jsr $03ee
$07:ea73  41 aa         eor ($aa,x)
$07:ea75  00 f0         brk #$f0
$07:ea77  00 00         brk #$00
$07:ea79  f0 10         beq $ea8b
$07:ea7b  fd b0 ba      sbc $bab0,x
$07:ea7e  54 df 1d      mvn $1d,$df
$07:ea81  11 f0         ora ($f0),y
$07:ea83  00 00         brk #$00
$07:ea85  00 7a         brk #$7a
$07:ea87  d4 30         pei ($30)
$07:ea89  52 f0         eor ($f0)
$07:ea8b  00 f1         brk #$f1
$07:ea8d  20 ce 8a      jsr $8ace
$07:ea90  1f e0 03 1e   ora $1e03e0,x
$07:ea94  d0 44         bne $eada
$07:ea96  ff 10 b6 00   sbc $00b610,x
$07:ea9a  00 00         brk #$00
$07:ea9c  00 ff         brk #$ff
$07:ea9e  db            stp
$07:ea9f  c4 61         cpy $61
$07:eaa1  a6 44         ldx $44
$07:eaa3  f2 1e         sbc ($1e)
$07:eaa5  ff 00 0f ff   sbc $ff0f00,x
$07:eaa9  0f 7a 17 7d   ora $7d177a
$07:eaad  f0 0f         beq $eabe
$07:eaaf  13 0b         ora ($0b,s),y
$07:eab1  d0 f0         bne $eaa3
$07:eab3  8a            txa
$07:eab4  01 2f         ora ($2f,x)
$07:eab6  dd 26 3f      cmp $3f26,x
$07:eab9  f0 ff         beq $eaba
$07:eabb  0e ba 00      asl $00ba
$07:eabe  00 00         brk #$00
$07:eac0  fd f5 5e      sbc $5ef5,x
$07:eac3  d2 ef         cmp ($ef)
$07:eac5  86 31         stx $31
$07:eac7  de ef fe      dec $feef,x
$07:eaca  cc cd e0      cpy $e0cd
$07:eacd  23 7a         and $7a,s
$07:eacf  ef 20 e0 4f   sbc $4fe020
$07:ead3  b0 0d         bcs $eae2
$07:ead5  f0 34         beq $eb0b
$07:ead7  8a            txa
$07:ead8  fc e4 51      jsr ($51e4,x)
$07:eadb  ff 00 0e e0   sbc $e00e00,x
$07:eadf  0f b6 00 fd   ora $fd00b6
$07:eae3  bd 36 21      lda $2136,x
$07:eae6  20 11 ff      jsr $ff11
$07:eae9  8a            txa
$07:eaea  73 fe         adc ($fe,s),y
$07:eaec  1f e2 11 12   ora $1211e2,x
$07:eaf0  10 f0         bpl $eae2
$07:eaf2  7a            ply
$07:eaf3  0f 02 0d cf   ora $cf0d02
$07:eaf7  f0 24         beq $eb1d
$07:eaf9  1b            tcs
$07:eafa  be 8a 55      ldx $558a,y
$07:eafd  cf 1f 00 01   cmp $01001f
$07:eb01  ed e1 f1      sbc $f1e1
$07:eb04  a6 00         ldx $00
$07:eb06  fe cd 56      inc $56cd,x
$07:eb09  22 11 10 ff   jsl $ff1011
$07:eb0d  8a            txa
$07:eb0e  05 0e         ora $0e
$07:eb10  10 00         bpl $eb12
$07:eb12  11 10         ora ($10),y
$07:eb14  00 0f         brk #$0f
$07:eb16  7a            ply
$07:eb17  e0 10         cpx #$10
$07:eb19  01 db         ora ($db,x)
$07:eb1b  e2 43         sep #$43
$07:eb1d  1f e0 7a 21   ora $217ae0,x
$07:eb21  f0 f0         beq $eb13
$07:eb23  fd ce ff      sbc $ffce,x
$07:eb26  22 ec a6 ec   jsl $eca6ec
$07:eb2a  f6 53         inc $53,x
$07:eb2c  21 10         and ($10,x)
$07:eb2e  f0 0f         beq $eb3f
$07:eb30  ff 7a 52 ef   sbc $ef527a,x
$07:eb34  32 11         and ($11)
$07:eb36  1f f0 1e e0   ora $e01ef0,x
$07:eb3a  7a            ply
$07:eb3b  12 0b         ora ($0b)
$07:eb3d  c0 13         cpy #$13
$07:eb3f  41 df         eor ($df,x)
$07:eb41  11 00         ora ($00),y
$07:eb43  a6 00         ldx $00
$07:eb45  01 0f         ora ($0f,x)
$07:eb47  ff ff 0f ec   sbc $ec0fff,x
$07:eb4b  c3 aa         cmp $aa,s
$07:eb4d  4c 0f e1      jmp $e10f
$07:eb50  f0 10         beq $eb62
$07:eb52  00 f1         brk #$f1
$07:eb54  00 7a         brk #$7a
$07:eb56  f4 02 30      pea $3002
$07:eb59  d0 10         bne $eb6b
$07:eb5b  d0 00         bne $eb5d
$07:eb5d  41 8a         eor ($8a,x)
$07:eb5f  ce 01 21      dec $2101
$07:eb62  0f f1 10 01   ora $0110f1
$07:eb66  0f a6 00 ff   ora $ff00a6
$07:eb6a  ff ff fd be   sbc $befdff,x
$07:eb6e  76 23         ror $23,x
$07:eb70  86 31         stx $31
$07:eb72  5e ef df      lsr $dfef,x
$07:eb75  ed dd df      sbc $dfdd
$07:eb78  01 7a         ora ($7a,x)
$07:eb7a  12 ff         ora ($ff)
$07:eb7c  e1 1c         sbc ($1c,x)
$07:eb7e  f2 22         sbc ($22)
$07:eb80  ea            nop
$07:eb81  df 7a 24 3f   cmp $3f247a,x
$07:eb85  e0 21         cpx #$21
$07:eb87  00 1f         brk #$1f
$07:eb89  fd df a6      sbc $a6df,x
$07:eb8c  ff ff ff ea   sbc $eaffff,x
$07:eb90  e6 63         inc $63
$07:eb92  31 00         and ($00),y
$07:eb94  7a            ply
$07:eb95  4f b2 30 f1   eor $f130b2
$07:eb99  0f 13 22 2f   ora $2f2213
$07:eb9d  7a            ply
$07:eb9e  e0 2e         cpx #$2e
$07:eba0  c1 21         cmp ($21,x)
$07:eba2  1e ac 13      asl $13ac,x
$07:eba5  32 6a         and ($6a)
$07:eba7  0c 05 3d      tsb $3d05
$07:ebaa  e3 3b         sbc $3b,s
$07:ebac  ab            plb
$07:ebad  d0 aa         bne $eb59
$07:ebaf  a6 ff         ldx $ff
$07:ebb1  fd bf 66      sbc $66bf,x
$07:ebb4  22 20 00 f0   jsl $f00020
$07:ebb8  7a            ply
$07:ebb9  1d d3 1f      ora $1fd3,x
$07:ebbc  e3 42         sbc $42,s
$07:ebbe  21 de         and ($de,x)
$07:ebc0  21 7a         and ($7a,x)
$07:ebc2  dd 23 0f      cmp $0f23,x
$07:ebc5  da            phx
$07:ebc6  f3 11         sbc ($11,s),y
$07:ebc8  31 ef         and ($ef),y
$07:ebca  7a            ply
$07:ebcb  21 f0         and ($f0,x)
$07:ebcd  30 dd         bmi $ebac
$07:ebcf  d0 1a         bne $ebeb
$07:ebd1  d2 fb         cmp ($fb)
$07:ebd3  aa            tax
$07:ebd4  df 56 fd 0f   cmp $0ffd56,x
$07:ebd8  f0 00         beq $ebda
$07:ebda  00 00         brk #$00
$07:ebdc  7a            ply
$07:ebdd  f3 ff         sbc ($ff,s),y
$07:ebdf  34 21         bit $21,x
$07:ebe1  ef 21 ee e1   sbc $e1ee21
$07:ebe5  7a            ply
$07:ebe6  31 eb         and ($eb),y
$07:ebe8  c0 11         cpy #$11
$07:ebea  32 1e         and ($1e)
$07:ebec  02 0f         cop #$0f
$07:ebee  a6 11         ldx $11
$07:ebf0  00 00         brk #$00
$07:ebf2  00 fe         brk #$fe
$07:ebf4  ef eb b3 aa   sbc $aab3eb
$07:ebf8  5c d2 ef 1f   jml $1fefd2
$07:ebfc  00 10         brk #$10
$07:ebfe  0f 00 76 d0   ora $d07600
$07:ec02  23 53         and $53,s
$07:ec04  24 41         bit $41
$07:ec06  fe 12 0e      inc $0e12,x
$07:ec09  6a            ror a
$07:ec0a  bc ef 34      ldy $34ef,x
$07:ec0d  41 e0         eor ($e0,x)
$07:ec0f  21 23         and ($23,x)
$07:ec11  ec b6 00      cpx $00b6
$07:ec14  00 0f         brk #$0f
$07:ec16  ff 0f dd 24   sbc $24dd0f,x
$07:ec1a  12 a6         ora ($a6)
$07:ec1c  50 01         bvc $ec1f
$07:ec1e  0f ff 0f ff   ora $ff0fff
$07:ec22  00 00         brk #$00
$07:ec24  6a            ror a
$07:ec25  22 d4 4d dd   jsl $dd4dd4
$07:ec29  06 1a         asl $1a
$07:ec2b  de cd 7a      dec $7acd,x
$07:ec2e  11 11         ora ($11),y
$07:ec30  10 10         bpl $ec42
$07:ec32  f2 1f         sbc ($1f)
$07:ec34  0f cf a6 0f   ora $0fa6cf
$07:ec38  ee ff da      inc $daff
$07:ec3b  d6 72         dec $72,x
$07:ec3d  42 01         wdm #$01
$07:ec3f  86 0e         stx $0e
$07:ec41  fd ff cb      sbc $cbff,x
$07:ec44  de ef 12      dec $12ef,x
$07:ec47  21 6a         and ($6a,x)
$07:ec49  21 ff         and ($ff,x)
$07:ec4b  e2 3d         sep #$3d
$07:ec4d  be fd b1      ldx $b1fd,y
$07:ec50  63 7a         adc $7a,s
$07:ec52  0f 12 00 2f   ora $2f0012
$07:ec56  f0 fd         beq $ec55
$07:ec58  0e be a6      asl $a6be
$07:ec5b  ff ec af 75   sbc $75afec,x
$07:ec5f  34 11         bit $11,x
$07:ec61  10 0f         bpl $ec72
$07:ec63  86 af         stx $af
$07:ec65  fc cd de      jsr ($decd,x)
$07:ec68  f1 22         sbc ($22),y
$07:ec6a  13 21         ora ($21,s),y
$07:ec6c  6a            ror a
$07:ec6d  e1 2f         sbc ($2f,x)
$07:ec6f  ed de de      sbc $dede
$07:ec72  34 21         bit $21,x
$07:ec74  c1 7a         cmp ($7a,x)
$07:ec76  31 1f         and ($1f),y
$07:ec78  e1 1e         sbc ($1e,x)
$07:ec7a  d0 cc         bne $ec48
$07:ec7c  00 ee         brk #$ee
$07:ec7e  a6 c9         ldx $c9
$07:ec80  f7 64         sbc [$64],y
$07:ec82  32 10         and ($10)
$07:ec84  00 ff         brk #$ff
$07:ec86  00 86         brk #$86
$07:ec88  ba            tsx
$07:ec89  ce ef 12      dec $12ef
$07:ec8c  12 31         ora ($31)
$07:ec8e  11 11         ora ($11),y
$07:ec90  7a            ply
$07:ec91  fd e0 1e      sbc $1ee0,x
$07:ec94  f2 20         sbc ($20)
$07:ec96  fd 15 30      sbc $3015,x
$07:ec99  9a            txs
$07:ec9a  f0 00         beq $ec9c
$07:ec9c  00 ff         brk #$ff
$07:ec9e  f0 01         beq $eca1
$07:eca0  fb            xce
$07:eca1  96 b6         stx $b6,y
$07:eca3  34 12         bit $12,x
$07:eca5  20 00 00      jsr $0000
$07:eca8  0f ff 00 7a   ora $7a00ff
$07:ecac  fb            xce
$07:ecad  24 2e         bit $2e
$07:ecaf  20 f1 e0      jsr $e0f1
$07:ecb2  1f ef 7a 0f   ora $0f7aef,x
$07:ecb6  ee 24 fd      inc $fd24
$07:ecb9  e1 64         sbc ($64,x)
$07:ecbb  fe 0f a6      inc $a60f,x
$07:ecbe  00 00         brk #$00
$07:ecc0  ff ff ff d9   sbc $d9ffff,x
$07:ecc4  c7 73         cmp [$73]
$07:ecc6  9a            txs
$07:ecc7  2c c4 ef      bit $efc4
$07:ecca  01 1f         ora ($1f,x)
$07:eccc  f1 10         sbc ($10),y
$07:ecce  f0 7a         beq $ed4a
$07:ecd0  62 01 f1      per $ddd4
$07:ecd3  0e 10 df      asl $df10
$07:ecd6  1f ee 7a e5   ora $e57aee,x
$07:ecda  4c df 16      jmp $16df
$07:ecdd  3f f0 fe e2   and $e2fef0,x
$07:ece1  b6 00         ldx $00,y
$07:ece3  ff 00 fd cf   sbc $cffd00,x
$07:ece7  43 22         eor $22,s
$07:ece9  10 7a         bpl $ed65
$07:eceb  3e 7a 13      rol $137a,x
$07:ecee  df 22 00 22   cmp $220022,x
$07:ecf2  f3 7a         sbc ($7a,s),y
$07:ecf4  1f 00 11 dc   ora $dc1100,x
$07:ecf8  12 fd         ora ($fd)
$07:ecfa  d0 71         bne $ed6d
$07:ecfc  86 ed         stx $ed
$07:ecfe  df 34 43 32   cmp $324334,x
$07:ed02  11 1f         ora ($1f),y
$07:ed04  cb            wai
$07:ed05  b6 00         ldx $00,y
$07:ed07  fe dd 14      inc $14dd,x
$07:ed0a  22 21 00 00   jsl $000021
$07:ed0e  86 ae         stx $ae
$07:ed10  fc cd ee      jsr ($eecd,x)
$07:ed13  ef 00 22 22   sbc $222200
$07:ed17  7a            ply
$07:ed18  01 fd         ora ($fd,x)
$07:ed1a  f0 10         beq $ed2c
$07:ed1c  cd 34 fc      cmp $fc34
$07:ed1f  e1 7a         sbc ($7a,x)
$07:ed21  35 3f         and $3f,x
$07:ed23  e0 0e         cpx #$0e
$07:ed25  e0 db         cpx #$db
$07:ed27  f4 1b a6      pea $a61b
$07:ed2a  d9 a3 74      cmp $74a3,y
$07:ed2d  34 20         bit $20,x
$07:ed2f  00 f0         brk #$f0
$07:ed31  10 8a         bpl $ecbd
$07:ed33  a0 33         ldy #$33
$07:ed35  ff 20 12 ff   sbc $ff1220,x
$07:ed39  11 0e         ora ($0e),y
$07:ed3b  7a            ply
$07:ed3c  e1 01         sbc ($01,x)
$07:ed3e  fa            plx
$07:ed3f  04 2d         tsb $2d
$07:ed41  ee 04 63      inc $6304
$07:ed44  9a            txs
$07:ed45  0f 00 0f f0   ora $f00f00
$07:ed49  0f 01 0c ad   ora $ad0c01
$07:ed4d  ba            tsx
$07:ed4e  33 ff         and ($ff,s),y
$07:ed50  1e 01 f0      asl $f001,x
$07:ed53  00 00         brk #$00
$07:ed55  00 7a         brk #$7a
$07:ed57  4d 31 f4      eor $f431
$07:ed5a  20 00 10      jsr $1000
$07:ed5d  c0 0f         cpy #$0f
$07:ed5f  7a            ply
$07:ed60  2d b1 41      and $41b1
$07:ed63  ee d0 46      inc $46d0
$07:ed66  20 00 a6      jsr $a600
$07:ed69  10 00         bpl $ed6b
$07:ed6b  0f ff 0f eb   ora $eb0fff
$07:ed6f  9f 76 9a bf   sta $bf9a76,x
$07:ed73  c0 00         cpy #$00
$07:ed75  00 00         brk #$00
$07:ed77  f0 10         beq $ed89
$07:ed79  01 6a         ora ($6a,x)
$07:ed7b  0c 53 12      tsb $1253
$07:ed7e  14 da         trb $da
$07:ed80  4b            phk
$07:ed81  b2 cb         lda ($cb)
$07:ed83  7a            ply
$07:ed84  12 10         ora ($10)
$07:ed86  db            stp
$07:ed87  15 53         ora $53,x
$07:ed89  1f fe fe aa   ora $aafefe,x
$07:ed8d  00 0f         brk #$0f
$07:ed8f  00 0f         brk #$0f
$07:ed91  de 66 fe      dec $fe66,x
$07:ed94  0f 86 e0 10   ora $10e086
$07:ed98  fe dc cd      inc $cddc,x
$07:ed9b  ee ee 01      inc $01ee
$07:ed9e  7a            ply
$07:ed9f  e2 21         sep #$21
$07:eda1  2c f2 be      bit $bef2
$07:eda4  10 0e         bpl $edb4
$07:eda6  02 8a         cop #$8a
$07:eda8  1d e1 23      ora $23e1,x
$07:edab  20 0f ff      jsr $ff0f
$07:edae  fe 01 aa      inc $aa01,x
$07:edb1  00 0f         brk #$0f
$07:edb3  ed 06 6f      sbc $6f06
$07:edb6  d0 ee         bne $eda6
$07:edb8  20 7a e0      jsr $e07a
$07:edbb  0f e0 22 1f   ora $1f22e0
$07:edbf  01 11         ora ($11,x)
$07:edc1  30 7a         bmi $ee3d
$07:edc3  32 b0         and ($b0)
$07:edc5  0c e1 1f      tsb $1fe1
$07:edc8  d0 31         bne $edfb
$07:edca  ae 8a 02      ldx $028a
$07:edcd  51 e1         eor ($e1),y
$07:edcf  0e f0 ff      asl $fff0
$07:edd2  0f 00 b6 ff   ora $ffb600
$07:edd6  ed f3 32      sbc $32f3
$07:edd9  20 01 00      jsr $0001
$07:eddc  00 7a         brk #$7a
$07:edde  9e 24 20      stz $2024,x
$07:ede1  01 f1         ora ($f1,x)
$07:ede3  32 13         and ($13)
$07:ede5  fd 86 22      sbc $2286,x
$07:ede8  0e de ec      asl $ecde
$07:edeb  cf fd cc f5   cmp $f5ccfd
$07:edef  9a            txs
$07:edf0  0f 10 ff 0f   ora $0fff10
$07:edf4  10 f0         bpl $ede6
$07:edf6  ff fb a6 9e   sbc $9ea6fb,x
$07:edfa  67 42         adc [$42]
$07:edfc  10 11         bpl $ee0f
$07:edfe  0f 00 fe 86   ora $86fe00
$07:ee02  cf ff ee f1   cmp $f1eeff
$07:ee06  13 54         ora ($54,s),y
$07:ee08  22 20 8a e0   jsl $e08a20
$07:ee0c  1f f1 1f ff   ora $ff1ff1,x
$07:ee10  f3 41         sbc ($41,s),y
$07:ee12  f1 a6         sbc ($a6),y
$07:ee14  11 10         ora ($10),y
$07:ee16  f0 0f         beq $ee27
$07:ee18  ff fe ca d4   sbc $d4cafe,x
$07:ee1c  9a            txs
$07:ee1d  59 ff d1      eor $d1ff,y
$07:ee20  0e 00 10      asl $1000
$07:ee23  00 00         brk #$00
$07:ee25  7a            ply
$07:ee26  00 04         brk #$04
$07:ee28  20 32 ef      jsr $ef32
$07:ee2b  3e 9e 30      rol $309e,x
$07:ee2e  7a            ply
$07:ee2f  ee 22 fd      inc $fd22
$07:ee32  d0 67         bne $ee9b
$07:ee34  1f 2e df a6   ora $a6df2e,x
$07:ee38  00 00         brk #$00
$07:ee3a  0f ee ed bc   ora $bcedee
$07:ee3e  36 43         rol $43,x
$07:ee40  8a            txa
$07:ee41  fb            xce
$07:ee42  d0 ff         bne $ee43
$07:ee44  21 0f         and ($0f,x)
$07:ee46  f1 00         sbc ($00),y
$07:ee48  00 8a         brk #$8a
$07:ee4a  21 02         and ($02,x)
$07:ee4c  1e 02 fc      asl $fc02,x
$07:ee4f  f1 0f         sbc ($0f),y
$07:ee51  00 7a         brk #$7a
$07:ee53  21 dc         and ($dc,x)
$07:ee55  f6 73         inc $73,x
$07:ee57  00 ed         brk #$ed
$07:ee59  ef 00 aa 00   sbc $00aa00
$07:ee5d  0f f0 fe 15   ora $15fef0
$07:ee61  4e e0 ff      lsr $ffe0
$07:ee64  7a            ply
$07:ee65  5a            phy
$07:ee66  03 31         ora $31,s
$07:ee68  bf 2f 10 f4   lda $f4102f,x
$07:ee6c  31 8a         and ($8a),y
$07:ee6e  20 e1 2e      jsr $2ee1
$07:ee71  c0 10         cpy #$10
$07:ee73  f0 f1         beq $ee66
$07:ee75  1f 7a c0 45   ora $45c07a,x
$07:ee79  51 fe         eor ($fe),y
$07:ee7b  cf 11 fc e1   cmp $e1fc11
$07:ee7f  aa            tax
$07:ee80  0f 0f ef 55   ora $55ef0f
$07:ee84  fe 0e 00      inc $000e,x
$07:ee87  f0 7a         beq $ef03
$07:ee89  57 fb         eor [$fb],y
$07:ee8b  d1 11         cmp ($11),y
$07:ee8d  d2 60         cmp ($60)
$07:ee8f  14 0d         trb $0d
$07:ee91  8a            txa
$07:ee92  21 ce         and ($ce,x)
$07:ee94  10 f0         bpl $ee86
$07:ee96  0f 01 0e 01   ora $010e01
$07:ee9a  7a            ply
$07:ee9b  75 1e         adc $1e,x
$07:ee9d  ed f1 1e      sbc $1ef1
$07:eea0  bf 0e ef aa   lda $aaef0e,x
$07:eea4  ff f2 42 ff   sbc $ff42f2,x
$07:eea8  ff f0 01 00   sbc $0001f0,x
$07:eeac  7a            ply
$07:eead  dc 13 e0      jml [$e013]
$07:eeb0  33 12         and ($12,s),y
$07:eeb2  4f d6 09 7a   eor $7a09d6
$07:eeb6  e1 ed         sbc ($ed,x)
$07:eeb8  10 e1         bpl $ee9b
$07:eeba  3e e1 23      rol $23e1,x
$07:eebd  43 9a         eor $9a,s
$07:eebf  0f f0 10 ff   ora $ff10f0
$07:eec3  00 f0         brk #$f0
$07:eec5  0f dd aa 05   ora $05aadd
$07:eec9  3f f0 ff f0   and $f0fff0,x
$07:eecd  00 10         brk #$10
$07:eecf  f0 7a         beq $ef4b
$07:eed1  40            rti
$07:eed2  03 1f         ora $1f,s
$07:eed4  34 e0         bit $e0,x
$07:eed6  5e bf 0d      lsr $0dbf,x
$07:eed9  7a            ply
$07:eeda  f0 ef         beq $eecb
$07:eedc  33 ed         and ($ed,s),y
$07:eede  f3 44         sbc ($44,s),y
$07:eee0  10 fb         bpl $eedd
$07:eee2  aa            tax
$07:eee3  00 00         brk #$00
$07:eee5  00 0f         brk #$0f
$07:eee7  f1 0e         sbc ($0e),y
$07:eee9  e1 43         sbc ($43,x)
$07:eeeb  8a            txa
$07:eeec  1b            tcs
$07:eeed  eb            xba
$07:eeee  af 1f 24 ed   lda $ed241f
$07:eef2  00 f2         brk #$f2
$07:eef4  7a            ply
$07:eef5  50 e5         bvc $eedc
$07:eef7  3f 21 ce 0f   and $0fce21,x
$07:eefb  ed 00 7a      sbc $7a00
$07:eefe  f3 1f         sbc ($1f,s),y
$07:ef00  ee 26 4f      inc $4f26
$07:ef03  0e d2 3d      asl $3dd2
$07:ef06  aa            tax
$07:ef07  f0 10         beq $ef19
$07:ef09  ff 10 ee 04   sbc $04ee10,x
$07:ef0d  40            rti
$07:ef0e  f0 86         beq $ee96
$07:ef10  7e ee cf      ror $cfee,x
$07:ef13  2f cb bc f0   and $f0bccb
$07:ef17  f0 7a         beq $ef93
$07:ef19  61 e3         adc ($e3,x)
$07:ef1b  0d 00 cd      ora $cd00
$07:ef1e  0f f1 12 7a   ora $7a12f1
$07:ef22  0d d3 73      ora $73d3
$07:ef25  f0 fd         beq $ef24
$07:ef27  12 dc         ora ($dc)
$07:ef29  12 aa         ora ($aa)
$07:ef2b  f0 01         beq $ef2e
$07:ef2d  ff ef 25 2f   sbc $2f25ef,x
$07:ef31  ff ef 8a 12   sbc $128aef,x
$07:ef35  31 ef         and ($ef),y
$07:ef37  f0 02         beq $ef3b
$07:ef39  10 12         bpl $ef4d
$07:ef3b  00 7a         brk #$7a
$07:ef3d  2f 00 eb ef   and $efeb00
$07:ef41  01 f1         ora ($f1,x)
$07:ef43  3f d0 7a 33   and $337ad0,x
$07:ef47  01 4f         ora ($4f,x)
$07:ef49  d0 1b         bne $ef66
$07:ef4b  f2 ee         sbc ($ee)
$07:ef4d  e1 aa         sbc ($aa,x)
$07:ef4f  00 fe         brk #$fe
$07:ef51  e2 53         sep #$53
$07:ef53  ef 0f ff 01   sbc $01ff0f
$07:ef57  7a            ply
$07:ef58  1e dc 32      asl $32dc,x
$07:ef5b  22 f4 5d 12   jsl $125df4
$07:ef5f  f1 7a         sbc ($7a),y
$07:ef61  0d be 00      ora $00be
$07:ef64  00 12         brk #$12
$07:ef66  fc 25 ff      jsr ($ff25,x)
$07:ef69  8a            txa
$07:ef6a  13 0e         ora ($0e,s),y
$07:ef6c  f0 e2         beq $ef50
$07:ef6e  fe 00 11      inc $1100,x
$07:ef71  cc aa fe      cpy $feaa
$07:ef74  14 4f         trb $4f
$07:ef76  ff 0e f1 1f   sbc $1ff10e,x
$07:ef7a  00 7a         brk #$7a
$07:ef7c  ef 23 10 62   sbc $621023
$07:ef80  e2 01         sep #$01
$07:ef82  1f dc 7a d0   ora $d07adc,x
$07:ef86  01 11         ora ($11,x)
$07:ef88  1e d2 4f      asl $4fd2,x
$07:ef8b  e4 5f         cpx $5f
$07:ef8d  9a            txs
$07:ef8e  f0 f0         beq $ef80
$07:ef90  10 f0         bpl $ef82
$07:ef92  f1 0e         sbc ($0e),y
$07:ef94  fd c1 aa      sbc $aac1,x
$07:ef97  44 0f ff      mvp $ff,$0f
$07:ef9a  f0 f0         beq $ef8c
$07:ef9c  10 f0         bpl $ef8e
$07:ef9e  10 8a         bpl $ef2a
$07:efa0  fe 25 0f      inc $0f25,x
$07:efa3  00 11         brk #$11
$07:efa5  ff ef f0 8a   sbc $8af0ef,x
$07:efa9  11 00         ora ($00),y
$07:efab  ff 12 e0 42   sbc $42e012,x
$07:efaf  ef ff aa 00   sbc $00aaff
$07:efb3  00 00         brk #$00
$07:efb5  0f 00 ee 04   ora $04ee00
$07:efb9  50 9a         bvc $ef55
$07:efbb  cf ee f0 f1   cmp $f1f0ee
$07:efbf  00 00         brk #$00
$07:efc1  00 01         brk #$01
$07:efc3  7a            ply
$07:efc4  70 f0         bvs $efb6
$07:efc6  10 20         bpl $efe8
$07:efc8  dc df 22      jml [$22df]
$07:efcb  0f 8a 00 f0   ora $f0008a
$07:efcf  1f 14 2d f0   ora $f02d14,x
$07:efd3  01 fe         ora ($fe,x)
$07:efd5  aa            tax
$07:efd6  00 00         brk #$00
$07:efd8  00 fe         brk #$fe
$07:efda  ff 35 1f f0   sbc $f01f35,x
$07:efde  86 41         stx $41
$07:efe0  da            phx
$07:efe1  cd de dc      cmp $dcde
$07:efe4  cd 14 20      cmp $2014
$07:efe7  7a            ply
$07:efe8  44 01 fd      mvp $fd,$01
$07:efeb  de e0 21      dec $21e0,x
$07:efee  1f e0 8a 1f   ora $1f8ae0,x
$07:eff2  f1 42         sbc ($42),y
$07:eff4  e0 f0         cpx #$f0
$07:eff6  0f fe f4 aa   ora $aaf4fe
$07:effa  00 0f         brk #$0f
$07:effc  ee f2 62      inc $62f2
$07:efff  ff 0e ff 8a   sbc $8aff0e,x
$07:f003  f2 23         sbc ($23)
$07:f005  fd 00 24      sbc $2400,x
$07:f008  1d 03 0f      ora $0f03,x
$07:f00b  6a            ror a
$07:f00c  32 cc         and ($cc)
$07:f00e  b9 13 13      lda $1313,y
$07:f011  ec 03 0c      cpx $0c03
$07:f014  86 04         stx $04
$07:f016  43 31         eor $31,s
$07:f018  22 0f de 21   jsl $21de0f
$07:f01c  ec aa ff      cpx $ffaa
$07:f01f  ff 14 30 f0   sbc $f03014,x
$07:f023  fe ff 02      inc $02ff,x
$07:f026  8a            txa
$07:f027  4b            phk
$07:f028  c2 12         rep #$12
$07:f02a  30 e1         bmi $f00d
$07:f02c  20 00 00      jsr $0000
$07:f02f  7a            ply
$07:f030  eb            xba
$07:f031  c2 13         rep #$13
$07:f033  3d df 20      and $20df,x
$07:f036  e2 61         sep #$61
$07:f038  8a            txa
$07:f039  0f f1 0f ef   ora $ef0ff1
$07:f03d  23 fc         and $fc,s
$07:f03f  ff bb aa f0   sbc $f0aabb,x
$07:f043  44 0f 0f      mvp $0f,$0f
$07:f046  ef f0 21 ff   sbc $ff21f0
$07:f04a  7a            ply
$07:f04b  20 66 1d      jsr $1d66
$07:f04e  13 f0         ora ($f0,s),y
$07:f050  30 de         bmi $f030
$07:f052  cd 7a 24      cmp $247a
$07:f055  30 dd         bmi $f034
$07:f057  f1 fe         sbc ($fe),y
$07:f059  56 1d         lsr $1d,x
$07:f05b  d2 9a         cmp ($9a)
$07:f05d  10 ef         bpl $f04e
$07:f05f  01 10         ora ($10,x)
$07:f061  f0 ed         beq $f050
$07:f063  ee 06 aa      inc $aa06
$07:f066  42 ff         wdm #$ff
$07:f068  fe e0 11      inc $11e0,x
$07:f06b  0f 00 11 7a   ora $7a1100
$07:f06f  db            stp
$07:f070  15 1f         ora $1f,x
$07:f072  12 ef         ora ($ef)
$07:f074  fb            xce
$07:f075  e3 41         sbc $41,s
$07:f077  8a            txa
$07:f078  0f ff 0f 02   ora $020fff
$07:f07c  4f e0 32 da   eor $da32e0
$07:f080  aa            tax
$07:f081  01 00         ora ($00,x)
$07:f083  00 ff         brk #$ff
$07:f085  f0 e0         beq $f067
$07:f087  34 10         bit $10,x
$07:f089  9a            txs
$07:f08a  fe bd e3      inc $e3bd,x
$07:f08d  3e f2 0f      rol $0ff2,x
$07:f090  01 10         ora ($10,x)
$07:f092  7a            ply
$07:f093  11 01         ora ($01),y
$07:f095  2e ff bf      rol $bfff
$07:f098  52 f2         eor ($f2)
$07:f09a  db            stp
$07:f09b  8a            txa
$07:f09c  f1 00         sbc ($00),y
$07:f09e  32 ee         and ($ee)
$07:f0a0  33 0c         and ($0c,s),y
$07:f0a2  cf 43 aa 0f   cmp $0faa43
$07:f0a6  00 0e         brk #$0e
$07:f0a8  ff f2 43 00   sbc $0043f2,x
$07:f0ac  ee 8a ad      inc $ad8a
$07:f0af  34 e0         bit $e0,x
$07:f0b1  10 01         bpl $f0b4
$07:f0b3  21 00         and ($00,x)
$07:f0b5  10 7a         bpl $f131
$07:f0b7  e2 ff         sep #$ff
$07:f0b9  2a            rol a
$07:f0ba  d7 20         cmp [$20],y
$07:f0bc  2d 9d 21      and $219d
$07:f0bf  8a            txa
$07:f0c0  13 0d         ora ($0d,s),y
$07:f0c2  04 2f         tsb $2f
$07:f0c4  ec 04 2d      cpx $2d04
$07:f0c7  df aa 1f ef   cmp $ef1faa,x
$07:f0cb  0f 13 32 0e   ora $0e3213
$07:f0cf  df f1 7a 10   cmp $107af1,x
$07:f0d3  02 11         cop #$11
$07:f0d5  11 10         ora ($10),y
$07:f0d7  14 1f         trb $1f
$07:f0d9  fb            xce
$07:f0da  8a            txa
$07:f0db  13 de         ora ($de,s),y
$07:f0dd  32 f0         and ($f0)
$07:f0df  ec 02 02      cpx $0202
$07:f0e2  2f 8a d0 34   and $34d08a
$07:f0e6  0b            phd
$07:f0e7  d2 30         cmp ($30)
$07:f0e9  0c f3 ea      tsb $eaf3
$07:f0ec  aa            tax
$07:f0ed  ff f0 34 2f   sbc $2f34f0,x
$07:f0f1  ff ef 00 00   sbc $0000ef,x
$07:f0f5  76 dd         ror $dd,x
$07:f0f7  ed dc f3      sbc $f3dc
$07:f0fa  33 43         and ($43,s),y
$07:f0fc  00 31         brk #$31
$07:f0fe  8a            txa
$07:f0ff  f2 1e         sbc ($1e)
$07:f101  1d d1 20      ora $20d1,x
$07:f104  10 fe         bpl $f104
$07:f106  13 8a         ora ($8a,s),y
$07:f108  5f be 20 01   eor $0120be,x
$07:f10c  ef 2e cc cc   sbc $cccc2e
$07:f110  aa            tax
$07:f111  02 32         cop #$32
$07:f113  00 fe         brk #$fe
$07:f115  f0 f0         beq $f107
$07:f117  11 f1         ora ($f1),y
$07:f119  86 1e         stx $1e
$07:f11b  c0 21         cpy #$21
$07:f11d  11 00         ora ($00),y
$07:f11f  12 10         ora ($10)
$07:f121  11 8a         ora ($8a),y
$07:f123  0f cf 21 f1   ora $f121cf
$07:f127  1f d1 53 ed   ora $ed53d1,x
$07:f12b  aa            tax
$07:f12c  00 00         brk #$00
$07:f12e  00 00         brk #$00
$07:f130  ff f0 ff 14   sbc $14fff0,x
$07:f134  9a            txs
$07:f135  7f ee ee ee   adc $eeeeee,x
$07:f139  03 10         ora $10,s
$07:f13b  1f f0 7a 62   ora $627af0,x
$07:f13f  1f 0f 13 1e   ora $1e130f,x
$07:f143  01 00         ora ($00,x)
$07:f145  ea            nop
$07:f146  8a            txa
$07:f147  f1 10         sbc ($10),y
$07:f149  10 ee         bpl $f139
$07:f14b  16 3e         asl $3e,x
$07:f14d  ef e0 9a 01   sbc $019ae0
$07:f151  00 0f         brk #$0f
$07:f153  df ef f0 67   cmp $67f0ef,x
$07:f157  1f 9a ff ec   ora $ecff9a,x
$07:f15b  d1 30         cmp ($30),y
$07:f15d  11 ef         ora ($ef),y
$07:f15f  12 0f         ora ($0f)
$07:f161  7a            ply
$07:f162  13 f1         ora ($f1,s),y
$07:f164  20 00 11      jsr $1100
$07:f167  fc bf 42      jsr ($42bf,x)
$07:f16a  86 ff         stx $ff
$07:f16c  db            stp
$07:f16d  bf 44 23 53   lda $532344,x
$07:f171  fe 22 aa      inc $aa22,x
$07:f174  00 ff         brk #$ff
$07:f176  0f ff f3 42   ora $42f3ff
$07:f17a  0f fe 96 fc   ora $fc96fe
$07:f17e  de 01 1f      dec $1f01,x
$07:f181  dd 02 10      cmp $1002,x
$07:f184  00 8a         brk #$8a
$07:f186  20 01 00      jsr $0001
$07:f189  1f de 11 11   ora $1111de,x
$07:f18d  fd 8a e0      sbc $e08a,x
$07:f190  54 ee 31      mvn $31,$ee
$07:f193  ec 03 00      cpx $0003
$07:f196  0e aa ff      asl $ffaa
$07:f199  00 ef         brk #$ef
$07:f19b  24 20         bit $20
$07:f19d  00 ed         brk #$ed
$07:f19f  f0 8a         beq $f12b
$07:f1a1  55 2e         eor $2e,x
$07:f1a3  ff f3 1f 01   sbc $011ff3,x
$07:f1a7  10 01         bpl $f1aa
$07:f1a9  8a            txa
$07:f1aa  2f 00 ed 01   and $01ed00
$07:f1ae  11 0d         ora ($0d),y
$07:f1b0  e0 05         cpx #$05
$07:f1b2  8a            txa
$07:f1b3  2d 23 fd      and $fd23
$07:f1b6  d0 32         bne $f1ea
$07:f1b8  d1 0a         cmp ($0a),y
$07:f1ba  d2 aa         cmp ($aa)
$07:f1bc  0e e1 42      asl $42e1
$07:f1bf  10 0e         bpl $f1cf
$07:f1c1  ff f0 11 7a   sbc $7a11f0,x
$07:f1c5  ec b4 50      cpx $50b4
$07:f1c8  c1 52         cmp ($52,x)
$07:f1ca  10 04         bpl $f1d0
$07:f1cc  fe 8a 0e      inc $0e8a,x
$07:f1cf  e0 02         cpx #$02
$07:f1d1  2f dd f2 5f   and $5ff2dd
$07:f1d5  e3 9a         sbc $9a,s
$07:f1d7  10 fe         bpl $f1d7
$07:f1d9  02 0f         cop #$0f
$07:f1db  1f d0 1f cd   ora $cd1fd0,x
$07:f1df  9a            txs
$07:f1e0  15 54         ora $54,x
$07:f1e2  10 dc         bpl $f1c0
$07:f1e4  df 11 00 10   cmp $100011,x
$07:f1e8  7a            ply
$07:f1e9  10 de         bpl $f1c9
$07:f1eb  46 2f         lsr $2f
$07:f1ed  f3 4d         sbc ($4d,s),y
$07:f1ef  ef cf 8a f0   sbc $f08acf
$07:f1f3  31 ee         and ($ee),y
$07:f1f5  ee 44 df      inc $df44
$07:f1f8  42 fe         wdm #$fe
$07:f1fa  9a            txs
$07:f1fb  e0 21         cpx #$21
$07:f1fd  f0 fe         beq $f1fd
$07:f1ff  01 ec         ora ($ec,x)
$07:f201  d0 57         bne $f25a
$07:f203  9a            txs
$07:f204  41 fd         eor ($fd,x)
$07:f206  ce f0 1f      dec $1ff0
$07:f209  12 1f         ora ($1f)
$07:f20b  ff 7a 23 42   sbc $42237a,x
$07:f20f  20 23 fc      jsr $fc23
$07:f212  ee de 35      inc $35de
$07:f215  8a            txa
$07:f216  0e fe e4      asl $e4fe
$07:f219  2d 04 30      and $3004
$07:f21c  cd 03 9a      cmp $9a03
$07:f21f  1f 00 fe 00   ora $00fe00,x
$07:f223  ec e2 65      cpx $65e2
$07:f226  30 9a         bmi $f1c2
$07:f228  ee ec 01      inc $01ec
$07:f22b  f1 21         sbc ($21),y
$07:f22d  ef 01 01 7a   sbc $7a0101
$07:f231  40            rti
$07:f232  f4 2d ed      pea $ed2d
$07:f235  0e d6 5c      asl $5cd6
$07:f238  d0 8a         bne $f1c4
$07:f23a  ee 21 f1      inc $f121
$07:f23d  32 0e         and ($0e)
$07:f23f  c0 32         cpy #$32
$07:f241  fe 9a 00      inc $009a,x
$07:f244  ff fe de 15   sbc $15defe,x
$07:f248  54 1f ec      mvn $ec,$1f
$07:f24b  86 dc         stx $dc
$07:f24d  aa            tax
$07:f24e  f3 1e         sbc ($1e,s),y
$07:f250  cb            wai
$07:f251  bd 14 33      lda $3314,x
$07:f254  8a            txa
$07:f255  20 fe ff      jsr $fffe
$07:f258  01 30         ora ($30,x)
$07:f25a  d0 1c         bne $f278
$07:f25c  e3 7a         sbc $7a,s
$07:f25e  2e 34 22      rol $2234
$07:f261  c9 26         cmp #$26
$07:f263  3e a2 2b      rol $2ba2,x
$07:f266  9a            txs
$07:f267  ff fe df 45   sbc $45dffe,x
$07:f26b  42 0f         wdm #$0f
$07:f26d  cd ff 8a      cmp $8aff
$07:f270  f4 5f ef      pea $ef5f
$07:f273  e1 03         sbc ($03,x)
$07:f275  41 ef         eor ($ef,x)
$07:f277  11 8a         ora ($8a),y
$07:f279  fe f0 22      inc $22f0,x
$07:f27c  fe 1f cf      inc $cf1f,x
$07:f27f  20 13 7a      jsr $7a13
$07:f282  0e 5e b0      asl $b05e
$07:f285  24 fc         bit $fc
$07:f287  33 da         and ($da,s),y
$07:f289  bd 9a ed      lda $ed9a,x
$07:f28c  f1 45         sbc ($45),y
$07:f28e  41 fd         eor ($fd,x)
$07:f290  de e0 22      dec $22e0,x
$07:f293  8a            txa
$07:f294  0f cf 20 34   ora $3420cf
$07:f298  1e e1 2f      asl $2fe1,x
$07:f29b  df 7a 45 1d   cmp $1d457a,x
$07:f29f  f1 ca         sbc ($ca),y
$07:f2a1  f2 03         sbc ($03)
$07:f2a3  5c 05 8a f0   jml $f08a05
$07:f2a7  00 1f         brk #$1f
$07:f2a9  f3 0e         sbc ($0e,s),y
$07:f2ab  ef ed cb 9a   sbc $9acbed
$07:f2af  f3 55         sbc ($55,s),y
$07:f2b1  2f ed ee 01   and $01eeed
$07:f2b5  21 ee         and ($ee,x)
$07:f2b7  7a            ply
$07:f2b8  f4 27 61      pea $6127
$07:f2bb  dd 04 fa      cmp $fa04,x
$07:f2be  f6 4e         inc $4e,x
$07:f2c0  7a            ply
$07:f2c1  f0 ed         beq $f2b0
$07:f2c3  de f0 64      dec $64f0,x
$07:f2c6  92 3f         sta ($3f)
$07:f2c8  31 9a         and ($9a),y
$07:f2ca  0f f2 2f ef   ora $ef2ff2
$07:f2ce  ff 0f de 24   sbc $24de0f,x
$07:f2d2  9a            txs
$07:f2d3  53 0e         eor ($0e,s),y
$07:f2d5  ee df 22      inc $22df
$07:f2d8  0f ff 10 8a   ora $8a10ff
$07:f2dc  14 2f         trb $2f
$07:f2de  ff 10 e1 30   sbc $30e110,x
$07:f2e2  f0 1f         beq $f303
$07:f2e4  8a            txa
$07:f2e5  ee ff 14      inc $14ff
$07:f2e8  fd 01 32      sbc $3201,x
$07:f2eb  00 de         brk #$de
$07:f2ed  9a            txs
$07:f2ee  31 ef         and ($ef),y
$07:f2f0  0f f0 fc d3   ora $d3fcf0
$07:f2f4  44 31 8a      mvp $8a,$31
$07:f2f7  ec cb e2      cpx $e2cb
$07:f2fa  1f 1e e3 12   ora $12e31e,x
$07:f2fe  2f 7a 11 df   and $df117a
$07:f302  f0 35         beq $f339
$07:f304  fe 02 1d      inc $1d02,x
$07:f307  9b            txy
$07:f308  8a            txa
$07:f309  02 20         cop #$20
$07:f30b  ee 24 10      inc $1024
$07:f30e  0d f5 1c      ora $1cf5
$07:f311  9a            txs
$07:f312  f1 0e         sbc ($0e),y
$07:f314  0f ce 12 45   ora $4512ce
$07:f318  1f 0e 86 20   ora $20860e,x
$07:f31c  0d ce dc      ora $dcce
$07:f31f  cd f2 22      cmp $22f2
$07:f322  32 7a         and ($7a)
$07:f324  d1 01         cmp ($01),y
$07:f326  51 ef         eor ($ef),y
$07:f328  01 eb         ora ($eb,x)
$07:f32a  ce 23 8a      dec $8a23
$07:f32d  0f e2 42 fe   ora $fe42e2
$07:f331  e2 40         sep #$40
$07:f333  cf 1f 9a f0   cmp $f09a1f
$07:f337  fc f0 13      jsr ($13f0,x)
$07:f33a  52 ff         eor ($ff)
$07:f33c  ff ff 86 dd   sbc $dd86ff,x
$07:f340  fe cd ee      inc $eecd,x
$07:f343  02 33         cop #$33
$07:f345  1f f0 7a 44   ora $447af0,x
$07:f349  1f ef 0f db   ora $db0fef,x
$07:f34d  e3 2e         sbc $2e,s
$07:f34f  cf 8a 23 20   cmp $20238a
$07:f353  ee 35 eb      inc $eb35
$07:f356  f1 00         sbc ($00),y
$07:f358  0c 8a ab      tsb $ab8a
$07:f35b  f3 67         sbc ($67,s),y
$07:f35d  61 ed         adc ($ed,x)
$07:f35f  ff eb f2 7a   sbc $7af2eb,x
$07:f363  1d 32 03      ora $0332,x
$07:f366  33 fa         and ($fa,s),y
$07:f368  d2 44         cmp ($44)
$07:f36a  3f 8a f0 00   and $00f08a,x
$07:f36e  ff ef 12 ed   sbc $ed12ef,x
$07:f372  01 43         ora ($43,x)
$07:f374  8a            txa
$07:f375  fe 02 3d      inc $3d02,x
$07:f378  ef f1 1f da   sbc $da1ff1
$07:f37c  d0 8a         bne $f308
$07:f37e  12 56         ora ($56)
$07:f380  4f e1 fd cd   eor $cdfde1
$07:f384  10 f0         bpl $f376
$07:f386  8a            txa
$07:f387  11 23         ora ($23),y
$07:f389  2e cf 13      rol $13cf
$07:f38c  21 0f         and ($0f,x)
$07:f38e  f1 7a         sbc ($7a),y
$07:f390  ee fb f3      inc $f3fb
$07:f393  0a            asl a
$07:f394  01 16         ora ($16,x)
$07:f396  5f ef 8a 21   eor $218aef,x
$07:f39a  ef f0 10 0c   sbc $0c10f0
$07:f39e  ae 10 12      ldx $1210
$07:f3a1  8a            txa
$07:f3a2  65 10         adc $10
$07:f3a4  0e dc d0      asl $d0dc
$07:f3a7  10 01         bpl $f3aa
$07:f3a9  01 8a         ora ($8a,x)
$07:f3ab  31 ed         and ($ed),y
$07:f3ad  02 31         cop #$31
$07:f3af  00 e0         brk #$e0
$07:f3b1  2f 0f 8a ef   and $ef8a0f
$07:f3b5  0f f0 f1 43   ora $43f1f0
$07:f3b9  ff 01 0f 8a   sbc $8a0f01,x
$07:f3bd  f0 01         beq $f3c0
$07:f3bf  0f cc ff f0   ora $f0ffcc
$07:f3c3  26 52         rol $52
$07:f3c5  8a            txa
$07:f3c6  11 dc         ora ($dc),y
$07:f3c8  ed e1 10      sbc $10e1
$07:f3cb  00 23         brk #$23
$07:f3cd  1d 7a b0      ora $b07a,x
$07:f3d0  54 21 fe      mvn $fe,$21
$07:f3d3  31 df         and ($df),y
$07:f3d5  2b            pld
$07:f3d6  b2 7a         lda ($7a)
$07:f3d8  dd 2f 07      cmp $072f,x
$07:f3db  61 e0         adc ($e0,x)
$07:f3dd  00 0f         brk #$0f
$07:f3df  df 8a 21 ec   cmp $ec218a,x
$07:f3e3  ee ff 00      inc $00ff
$07:f3e6  45 43         eor $43
$07:f3e8  2d 8a bd      and $bd8a
$07:f3eb  ef 00 0f 12   sbc $120f00
$07:f3ef  40            rti
$07:f3f0  de 11 7a      dec $7a11,x
$07:f3f3  24 5c         bit $5c
$07:f3f5  c3 2c         cmp $2c,s
$07:f3f7  23 9c         and $9c,s
$07:f3f9  1c e1 7a      trb $7ae1
$07:f3fc  f2 65         sbc ($65)
$07:f3fe  2f ff 00 ee   and $ee00ff
$07:f402  14 3b         trb $3b
$07:f404  8a            txa
$07:f405  ce fe ff      dec $fffe
$07:f408  03 54         ora $54,s
$07:f40a  42 dd         wdm #$dd
$07:f40c  ed 8a d0      sbc $d08a
$07:f40f  1f f1 42 ee   ora $ee42f1,x
$07:f413  01 11         ora ($11,x)
$07:f415  21 8a         and ($8a,x)
$07:f417  d0 2f         bne $f448
$07:f419  f3 0c         sbc ($0c,s),y
$07:f41b  e1 ef         sbc ($ef,x)
$07:f41d  00 03         brk #$03
$07:f41f  8a            txa
$07:f420  32 0f         and ($0f)
$07:f422  ef 11 e0 30   sbc $30e011
$07:f426  dd ff 8a      cmp $8aff,x
$07:f429  ef ff 15 55   sbc $5515ff
$07:f42d  2e ed cd      rol $cded
$07:f430  01 8a         ora ($8a,x)
$07:f432  fe 05 3f      inc $3f05,x
$07:f435  df 13 11 fe   cmp $fe1113,x
$07:f439  12 8a         ora ($8a)
$07:f43b  f0 2e         beq $f46b
$07:f43d  d0 0e         bne $f44d
$07:f43f  e1 10         sbc ($10,x)
$07:f441  23 10         and $10,s
$07:f443  8a            txa
$07:f444  0d 01 0e      ora $0e01
$07:f447  23 ed         and $ed,s
$07:f449  f1 dd         sbc ($dd),y
$07:f44b  ff 8a e1 56   sbc $56e18a,x
$07:f44f  32 0f         and ($0f)
$07:f451  cb            wai
$07:f452  f1 fe         sbc ($fe),y
$07:f454  f1 8a         sbc ($8a),y
$07:f456  32 0e         and ($0e)
$07:f458  f2 20         sbc ($20)
$07:f45a  11 fe         ora ($fe),y
$07:f45c  02 1f         cop #$1f
$07:f45e  7a            ply
$07:f45f  0e ed dd      asl $dded
$07:f462  f1 26         sbc ($26),y
$07:f464  70 0d         bvs $f473
$07:f466  c0 8a         cpy #$8a
$07:f468  1f f3 4e b0   ora $b04ef3,x
$07:f46c  0d ee ef      ora $efee
$07:f46f  24 8a         bit $8a
$07:f471  43 41         eor $41,s
$07:f473  ec df 0e      cpx $0edf
$07:f476  df 23 2f 7a   cmp $7a2f23,x
$07:f47a  c1 43         cmp ($43,x)
$07:f47c  21 1e         and ($1e,x)
$07:f47e  c1 31         cmp ($31,x)
$07:f480  0f ee 7a ec   ora $ec7aee
$07:f484  c1 31         cmp ($31,x)
$07:f486  64 10         stz $10
$07:f488  bd 31 ee      lda $ee31,x
$07:f48b  8a            txa
$07:f48c  33 dc         and ($dc,s),y
$07:f48e  10 ed         bpl $f47d
$07:f490  fe f0 34      inc $34f0,x
$07:f493  44 8a 1e      mvp $1e,$8a
$07:f496  de ff ed      dec $edff,x
$07:f499  f2 20         sbc ($20)
$07:f49b  f1 11         sbc ($11),y
$07:f49d  8a            txa
$07:f49e  21 01         and ($01,x)
$07:f4a0  fe d1 50      inc $50d1,x
$07:f4a3  f0 df         beq $f484
$07:f4a5  fd 7a 23      sbc $237a,x
$07:f4a8  24 31         bit $31
$07:f4aa  0e 00 e0      asl $e000
$07:f4ad  14 2c         trb $2c
$07:f4af  8a            txa
$07:f4b0  d0 0f         bne $f4c1
$07:f4b2  ee e0 f0      inc $f0e0
$07:f4b5  35 51         and $51,x
$07:f4b7  e0 8a         cpx #$8a
$07:f4b9  fe ec d1      inc $d1ec,x
$07:f4bc  20 00 11      jsr $1100
$07:f4bf  21 00         and ($00,x)
$07:f4c1  8a            txa
$07:f4c2  10 ed         bpl $f4b1
$07:f4c4  24 00         bit $00
$07:f4c6  fd 0e d1      sbc $d10e,x
$07:f4c9  22 7a 22 00   jsl $00227a
$07:f4cd  f0 ff         beq $f4ce
$07:f4cf  02 51         cop #$51
$07:f4d1  cb            wai
$07:f4d2  f0 8a         beq $f45e
$07:f4d4  fe ef 0e      inc $0eef,x
$07:f4d7  f2 55         sbc ($55)
$07:f4d9  10 0f         bpl $f4ea
$07:f4db  fe 8a cc      inc $cc8a,x
$07:f4de  01 10         ora ($10,x)
$07:f4e0  11 12         ora ($12),y
$07:f4e2  2f f0 1e 8a   and $8a1ef0
$07:f4e6  d2 61         cmp ($61)
$07:f4e8  df fe ef 00   cmp $00effe,x
$07:f4ec  33 1f         and ($1f,s),y
$07:f4ee  7a            ply
$07:f4ef  d0 0e         bne $f4ff
$07:f4f1  f1 56         sbc ($56),y
$07:f4f3  f9 c0 0f      sbc $0fc0,y
$07:f4f6  cb            wai
$07:f4f7  8a            txa
$07:f4f8  0f e0 13 43   ora $4313e0
$07:f4fc  11 fe         ora ($fe),y
$07:f4fe  dd d0 86      cmp $86d0,x
$07:f501  cb            wai
$07:f502  bd f1 44      lda $44f1,x
$07:f505  21 34         and ($34,x)
$07:f507  0b            phd
$07:f508  e7 8a         sbc [$8a]
$07:f50a  0c ff ef      tsb $efff
$07:f50d  ef 14 20 f0   sbc $f02014
$07:f511  f0 7a         beq $f58d
$07:f513  ff 16 4e bb   sbc $bb4e16,x
$07:f517  03 dc         ora $dc,s
$07:f519  ee ed 8a      inc $8aed
$07:f51c  df 46 42 1f   cmp $1f4246,x
$07:f520  ed cc 00      sbc $00cc
$07:f523  00 8a         brk #$8a
$07:f525  22 12 1f f2   jsl $f21f12
$07:f529  0b            phd
$07:f52a  e5 5f         sbc $5f
$07:f52c  ff 7a dd dc   sbc $dcdd7a,x
$07:f530  13 52         ora ($52,s),y
$07:f532  d1 1e         cmp ($1e),y
$07:f534  f0 f2         beq $f528
$07:f536  8a            txa
$07:f537  32 fd         and ($fd)
$07:f539  d1 1e         cmp ($1e),y
$07:f53b  00 ef         brk #$ef
$07:f53d  ed e2 8a      sbc $8ae2
$07:f540  55 32         eor $32,x
$07:f542  1e cb df      asl $dfcb,x
$07:f545  01 01         ora ($01,x)
$07:f547  13 86         ora ($86,s),y
$07:f549  34 32         bit $32,x
$07:f54b  33 ec         and ($ec,s),y
$07:f54d  15 44         ora $44,x
$07:f54f  20 eb 7a      jsr $7aeb
$07:f552  d2 54         cmp ($54)
$07:f554  0d 21 de      ora $de21
$07:f557  01 45         ora ($45,x)
$07:f559  2e 8a de      rol $de8a
$07:f55c  10 e1         bpl $f53f
$07:f55e  fe 00 bc      inc $bc00,x
$07:f561  14 66         trb $66
$07:f563  8a            txa
$07:f564  21 fb         and ($fb,x)
$07:f566  ad 00 00      lda $0000
$07:f569  12 22         ora ($22)
$07:f56b  0f 8a 01 fd   ora $fd018a
$07:f56f  f4 40 e0      pea $e040
$07:f572  fe e0 12      inc $12e0,x
$07:f575  7a            ply
$07:f576  0e 02 0d      asl $0d02
$07:f579  f1 05         sbc ($05),y
$07:f57b  60            rts
$07:f57c  dc e0 9a      jml [$9ae0]
$07:f57f  0f 00 0f fe   ora $fe0f00
$07:f583  e0 24         cpx #$24
$07:f585  31 00         and ($00),y
$07:f587  8a            txa
$07:f588  ba            tsx
$07:f589  ef f0 11 12   sbc $1211f0
$07:f58d  3f 00 0f 9a   and $9a0f00,x
$07:f591  ef 34 fe 1f   sbc $1ffe34
$07:f595  e0 01         cpx #$01
$07:f597  00 00         brk #$00
$07:f599  7a            ply
$07:f59a  0e f1 1f      asl $1ff1
$07:f59d  45 20         eor $20
$07:f59f  ca            dex
$07:f5a0  e1 f1         sbc ($f1,x)
$07:f5a2  9a            txs
$07:f5a3  1f ff ee f1   ora $f1eeff,x
$07:f5a7  44 20 0d      mvp $0d,$20
$07:f5aa  ee 86 ed      inc $ed86
$07:f5ad  cc dd 03      cpy $03dd
$07:f5b0  33 21         and ($21,s),y
$07:f5b2  0d b2 8a      ora $8ab2
$07:f5b5  7c e2 df      jmp ($dfe2,x)
$07:f5b8  ff 11 0f 01   sbc $010f11,x
$07:f5bc  fd 7a 53      sbc $537a,x
$07:f5bf  f2 61         sbc ($61)
$07:f5c1  ef bf fd 36   sbc $36fdbf
$07:f5c5  ea            nop
$07:f5c6  9a            txs
$07:f5c7  ee ef 14      inc $14ef
$07:f5ca  41 00         eor ($00,x)
$07:f5cc  0e df 00      asl $00df
$07:f5cf  9a            txs
$07:f5d0  00 02         brk #$02
$07:f5d2  10 0f         bpl $f5e3
$07:f5d4  ff 01 41 e1   sbc $e14101,x
$07:f5d8  8a            txa
$07:f5d9  fb            xce
$07:f5da  1f e2 30 d0   ora $d030e2,x
$07:f5de  1d f3 00      ora $00f3,x
$07:f5e1  8a            txa
$07:f5e2  22 1f ff ff   jsl $ffff1f
$07:f5e6  f2 2f         sbc ($2f)
$07:f5e8  ed ab 9a      sbc $9aab
$07:f5eb  f2 34         sbc ($34)
$07:f5ed  11 0f         ora ($0f),y
$07:f5ef  ee 00 ff      inc $ff00
$07:f5f2  01 9a         ora ($9a,x)
$07:f5f4  21 0f         and ($0f,x)
$07:f5f6  f0 ff         beq $f5f7
$07:f5f8  25 ff         and $ff
$07:f5fa  1e f1 8a      asl $8af1,x
$07:f5fd  ef 12 0f 0f   sbc $0f0f12
$07:f601  c1 3f         cmp ($3f,x)
$07:f603  13 1f         ora ($1f,s),y
$07:f605  8a            txa
$07:f606  10 ee         bpl $f5f6
$07:f608  f1 12         sbc ($12),y
$07:f60a  fe ca cf      inc $cfca,x
$07:f60d  35 8a         and $8a,x
$07:f60f  64 30         stz $30
$07:f611  dc ee 0f      jml [$0fee]
$07:f614  ef 23 2f 8a   sbc $8a2f23
$07:f618  ff fe 26 4d   sbc $4d26fe,x
$07:f61c  00 d0         brk #$d0
$07:f61e  0e 03 8a      asl $8a03
$07:f621  1e 0f df      asl $df0f,x
$07:f624  31 f1         and ($f1),y
$07:f626  40            rti
$07:f627  f0 0f         beq $f638
$07:f629  8a            txa
$07:f62a  ef 12 10 db   sbc $db1012
$07:f62e  bd e3 54      lda $54e3,x
$07:f631  44 7a 0c      mvp $0c,$7a
$07:f634  cb            wai
$07:f635  9f 0d e4 40   sta $40e40d,x
$07:f639  e0 eb         cpx #$eb
$07:f63b  96 d0         stx $d0,y
$07:f63d  44 23 20      mvp $20,$23
$07:f640  00 ff         brk #$ff
$07:f642  00 ff         brk #$ff
$07:f644  8a            txa
$07:f645  fc 03 1e      jsr ($1e03,x)
$07:f648  24 f0         bit $f0
$07:f64a  1f ef 01 8a   ora $8a01ef,x
$07:f64e  21 fc         and ($fc,x)
$07:f650  cd dd 33      cmp $33dd
$07:f653  35 40         and $40,x
$07:f655  f0 96         beq $f5ed
$07:f657  31 00         and ($00),y
$07:f659  ff 00 ff 00   sbc $00ff00,x
$07:f65d  ec f5 8a      cpx $8af5
$07:f660  ec 1e f1      cpx $f11e
$07:f663  0e 02 1f      asl $1f02
$07:f666  fe e0 7a      inc $7ae0,x
$07:f669  40            rti
$07:f66a  f5 4e         sbc $4e,x
$07:f66c  21 ff         and ($ff,x)
$07:f66e  dd 25 2d      cmp $2d25,x
$07:f671  8a            txa
$07:f672  dc dd f2      jml [$f2dd]
$07:f675  02 54         cop #$54
$07:f677  02 1c         cop #$1c
$07:f679  c0 9a         cpy #$9a
$07:f67b  0f f1 00 00   ora $0000f1
$07:f67f  ff 04 3e 00   sbc $003e04,x
$07:f683  7a            ply
$07:f684  b0 1f         bcs $f6a5
$07:f686  e1 30         sbc ($30,x)
$07:f688  de fd f3      dec $f3fd,x
$07:f68b  f0 7a         beq $f707
$07:f68d  63 f1         adc $f1,s
$07:f68f  1e ff d2      asl $d2ff,x
$07:f692  30 fb         bmi $f68f
$07:f694  aa            tax
$07:f695  8a            txa
$07:f696  ef 1f 14 42   sbc $42141f
$07:f69a  31 db         and ($db),y
$07:f69c  f1 ee         sbc ($ee),y
$07:f69e  96 ff         stx $ff,y
$07:f6a0  ff fe cd 35   sbc $35cdfe,x
$07:f6a4  32 11         and ($11)
$07:f6a6  10 7a         bpl $f722
$07:f6a8  11 13         ora ($13),y
$07:f6aa  eb            xba
$07:f6ab  0f d0 3e 16   ora $163ed0
$07:f6af  1e 7a 03      asl $037a,x
$07:f6b2  1f ef 00 00   ora $0000ef,x
$07:f6b6  ca            dex
$07:f6b7  ad 01 8a      lda $8a01
$07:f6ba  f0 35         beq $f6f1
$07:f6bc  41 fe         eor ($fe,x)
$07:f6be  df 0f e0 01   cmp $01e00f,x
$07:f6c2  96 fe         stx $fe,y
$07:f6c4  db            stp
$07:f6c5  e4 43         cpx $43
$07:f6c7  31 11         and ($11),y
$07:f6c9  01 00         ora ($00,x)
$07:f6cb  7a            ply
$07:f6cc  4e af f0      lsr $f0af
$07:f6cf  20 d3 60      jsr $60d3
$07:f6d2  c1 31         cmp ($31,x)
$07:f6d4  7a            ply
$07:f6d5  1f df 20 ed   ora $ed20df,x
$07:f6d9  bb            tyx
$07:f6da  ef fd 05 8a   sbc $8a05fd
$07:f6de  54 20 ed      mvn $ed,$20
$07:f6e1  e0 ff         cpx #$ff
$07:f6e3  e0 10         cpx #$10
$07:f6e5  dd 96 c2      cmp $c296,x
$07:f6e8  62 32 02      per $f91d
$07:f6eb  10 10         bpl $f6fd
$07:f6ed  00 0e         brk #$0e
$07:f6ef  7a            ply
$07:f6f0  00 3f         brk #$3f
$07:f6f2  fe 25 1c      inc $1c25,x
$07:f6f5  14 2f         trb $2f
$07:f6f7  ee 8a 01      inc $018a
$07:f6fa  0f ee ff ff   ora $ffffee
$07:f6fe  e0 24         cpx #$24
$07:f700  33 96         and ($96,s),y
$07:f702  54 33 31      mvn $31,$33
$07:f705  fe ef fd      inc $fdef,x
$07:f708  ac 55 86      ldy $8655
$07:f70b  36 31         rol $31,x
$07:f70d  31 11         and ($11),y
$07:f70f  02 1f         cop #$1f
$07:f711  dc cd 7a      jml [$7acd]
$07:f714  0d e5 5e      ora $5ee5
$07:f717  b2 51         lda ($51)
$07:f719  01 ef         ora ($ef,x)
$07:f71b  0e 8a ff      asl $ff8a
$07:f71e  ff ef fe f2   sbc $f2feef,x
$07:f722  44 31 ff      mvp $ff,$31
$07:f725  96 42         stx $42,y
$07:f727  0f fe ee da   ora $daeefe
$07:f72b  f6 41         inc $41,x
$07:f72d  21 7a         and ($7a,x)
$07:f72f  2f e2 11 0f   and $0f11e2
$07:f733  de 02 1f      dec $1f02,x
$07:f736  cf 7a 45 fb   cmp $fb457a
$07:f73a  14 02         trb $02
$07:f73c  2f ee df 0f   and $0fdfee
$07:f740  8a            txa
$07:f741  ef fe e1 12   sbc $12e1fe
$07:f745  34 10         bit $10,x
$07:f747  0f ed 9a ff   ora $ff9aed
$07:f74b  00 1d         brk #$1d
$07:f74d  e5 6e         sbc $6e
$07:f74f  f0 ff         beq $f750
$07:f751  01 7a         ora ($7a,x)
$07:f753  f2 01         sbc ($01)
$07:f755  fd d1 31      sbc $31d1,x
$07:f758  dd 03 3f      cmp $3f03,x
$07:f75b  7a            ply
$07:f75c  c0 54         cpy #$54
$07:f75e  00 0d         brk #$0d
$07:f760  dd 00 ee      cmp $ee00,x
$07:f763  fe 7a bd      inc $bd7a,x
$07:f766  13 35         ora ($35,s),y
$07:f768  64 1f         stz $1f
$07:f76a  ed 9b ff      sbc $ff9b
$07:f76d  96 ff         stx $ff,y
$07:f76f  ba            tsx
$07:f770  05 31         ora $31
$07:f772  32 00         and ($00)
$07:f774  10 00         bpl $f776
$07:f776  7a            ply
$07:f777  30 ec         bmi $f765
$07:f779  13 0c         ora ($0c,s),y
$07:f77b  e0 22         cpx #$22
$07:f77d  0d 04 7a      ora $7a04
$07:f780  31 20         and ($20),y
$07:f782  cc d1 0f      cpy $0fd1
$07:f785  ff ba d2 8a   sbc $8ad2ba,x
$07:f789  12 23         ora ($23)
$07:f78b  32 ef         and ($ef)
$07:f78d  ed ef f0      sbc $f0ef
$07:f790  da            phx
$07:f791  96 e5         stx $e5,y
$07:f793  31 21         and ($21),y
$07:f795  11 11         ora ($11),y
$07:f797  00 11         brk #$11
$07:f799  0f 7a e2 31   ora $31e27a
$07:f79d  dd f2 20      cmp $20f2,x
$07:f7a0  d1 32         cmp ($32),y
$07:f7a2  13 7a         ora ($7a,s),y
$07:f7a4  0c cd f1      tsb $f1cd
$07:f7a7  30 ca         bmi $f773
$07:f7a9  ce 11 02      dec $0211
$07:f7ac  96 14         stx $14,y
$07:f7ae  55 43         eor $43,x
$07:f7b0  10 fe         bpl $f7b0
$07:f7b2  da            phx
$07:f7b3  a3 61         lda $61,s
$07:f7b5  7a            ply
$07:f7b6  3f c7 cf 2f   and $2fcfc7,x
$07:f7ba  21 0f         and ($0f,x)
$07:f7bc  df 23 7a fe   cmp $fe7a23,x
$07:f7c0  df 31 ef 12   cmp $12ef31,x
$07:f7c4  32 2f         and ($2f)
$07:f7c6  cd 8a ff      cmp $ff8a
$07:f7c9  11 0e         ora ($0e),y
$07:f7cb  df f0 00 04   cmp $0400f0,x
$07:f7cf  43 96         eor $96,s
$07:f7d1  55 31         eor $31,x
$07:f7d3  ff ec 9d 64   sbc $649dec,x
$07:f7d7  13 10         ora ($10,s),y
$07:f7d9  7a            ply
$07:f7da  4e 3e 03      lsr $033e
$07:f7dd  1f ff f2 2f   ora $2ff2ff,x
$07:f7e1  ed 7a f3      sbc $f37a
$07:f7e4  1d 01 13      ora $1301,x
$07:f7e7  31 0d         and ($0d),y
$07:f7e9  ad 22 8a      lda $8a22
$07:f7ec  00 fe         brk #$fe
$07:f7ee  df 01 f1 34   cmp $34f101,x
$07:f7f2  21 fe         and ($fe,x)
$07:f7f4  9a            txs
$07:f7f5  ef ff ee 76   sbc $76eeff
$07:f7f9  cf 0e 10 01   cmp $01100e
$07:f7fd  7a            ply
$07:f7fe  e0 2f         cpx #$2f
$07:f800  11 fe         ora ($fe),y
$07:f802  21 fe         and ($fe,x)
$07:f804  e0 2f         cpx #$2f
$07:f806  7a            ply
$07:f807  ef 13 32 10   sbc $103213
$07:f80b  da            phx
$07:f80c  e3 10         sbc $10,s
$07:f80e  1c 8a df      trb $df8a
$07:f811  00 ff         brk #$ff
$07:f813  13 42         ora ($42,s),y
$07:f815  1f ed ee 96   ora $96eeed,x
$07:f819  ec af 54      cpx $54af
$07:f81c  02 2f         cop #$2f
$07:f81e  01 00         ora ($00,x)
$07:f820  10 6a         bpl $f88c
$07:f822  d6 6b         dec $6b,x
$07:f824  03 0b         ora $0b,s
$07:f826  be 33 ea      ldx $ea33,y
$07:f829  02 7a         cop #$7a
$07:f82b  23 11         and $11,s
$07:f82d  1d bf 10      ora $10bf,x
$07:f830  12 d9         ora ($d9)
$07:f832  ef 8a f1 0f   sbc $0ff18a
$07:f836  25 20         and $20
$07:f838  0e de fe      asl $fede
$07:f83b  90 92         bcc $f7cf
$07:f83d  a1 43         lda ($43,x)
$07:f83f  55 45         eor $45,x
$07:f841  65 55         adc $55
$07:f843  43 33         eor $33,s
$07:f845  6a            ror a
$07:f846  31 ef         and ($ef),y
$07:f848  ca            dex
$07:f849  04 1b         tsb $1b
$07:f84b  b4 32         ldy $32,x
$07:f84d  42 7a         wdm #$7a
$07:f84f  01 fb         ora ($fb,x)
$07:f851  e1 21         sbc ($21,x)
$07:f853  0b            phd
$07:f854  c0 ed         cpy #$ed
$07:f856  10 a6         bpl $f7fe
$07:f858  f0 12         beq $f86c
$07:f85a  22 10 ff ed   jsl $edff10
$07:f85e  14 11         trb $11
$07:f860  86 4e         stx $4e
$07:f862  ee 03 11      inc $1103
$07:f865  1e f1 11      asl $11f1,x
$07:f868  00 7a         brk #$7a
$07:f86a  fe f1 1f      inc $1ff1,x
$07:f86d  df 11 22 01   cmp $012211,x
$07:f871  3e 7a 9d      rol $9d7a,x
$07:f874  32 00         and ($00)
$07:f876  ed ed e1      sbc $e1ed
$07:f879  ff 57 a6 11   sbc $11a657,x
$07:f87d  11 10         ora ($10),y
$07:f87f  fd e3 30      sbc $30e3,x
$07:f882  20 f0 86      jsr $86f0
$07:f885  e1 42         sbc ($42,x)
$07:f887  1f ef 01 10   ora $1001ef,x
$07:f88b  00 fe         brk #$fe
$07:f88d  7a            ply
$07:f88e  10 ed         bpl $f87d
$07:f890  12 01         ora ($01)
$07:f892  1f 24 da f2   ora $f2da24,x
$07:f896  7a            ply
$07:f897  20 0f cc      jsr $cc0f
$07:f89a  fe 1f e6      inc $e61f,x
$07:f89d  40            rti
$07:f89e  21 aa         and ($aa,x)
$07:f8a0  0f ef 23 1d   ora $1d23ef
$07:f8a4  01 e1         ora ($e1,x)
$07:f8a6  0f 11 7a 0a   ora $0a7a11
$07:f8aa  d0 41         bne $f8ed
$07:f8ac  21 0f         and ($0f,x)
$07:f8ae  ef 10 fe 7a   sbc $7afe10
$07:f8b2  e1 11         sbc ($11,x)
$07:f8b4  2f f3 3c c0   and $c03cf3
$07:f8b8  2f 02 96 1f   and $1f9602
$07:f8bc  ee ef ee      inc $eeef
$07:f8bf  f1 12         sbc ($12),y
$07:f8c1  22 0c a6 d0   jsl $d0a60c
$07:f8c5  43 02         eor $02,s
$07:f8c7  1f 00 f0 11   ora $11f000,x
$07:f8cb  0f 7a 32 34   ora $34327a
$07:f8cf  10 ed         bpl $f8be
$07:f8d1  11 0f         ora ($0f),y
$07:f8d3  de 10 76      dec $7610,x
$07:f8d6  df ff 13 32   cmp $3213ff,x
$07:f8da  22 10 44 fc   jsl $fc4410
$07:f8de  a6 ff         ldx $ff
$07:f8e0  ff f0 00 01   sbc $0100f0,x
$07:f8e4  10 de         bpl $f8c4
$07:f8e6  24 96         bit $96
$07:f8e8  42 30         wdm #$30
$07:f8ea  f0 ee         beq $f8da
$07:f8ec  02 10         cop #$10
$07:f8ee  ff f0 7a 30   sbc $307af0,x
$07:f8f2  0d f3 0f      ora $0ff3
$07:f8f5  ee f0 11      inc $11f0
$07:f8f8  0f 7a 02 10   ora $10027a
$07:f8fc  ff 0f 12 fd   sbc $fd120f,x
$07:f900  dc e0 a6      jml [$a6e0]
$07:f903  ff 00 00 10   sbc $100000,x
$07:f907  dd 35 12      cmp $1235,x
$07:f90a  20 76 f9      jsr $f976
$07:f90d  cb            wai
$07:f90e  a2 50         ldx #$50
$07:f910  cd ef 03      cmp $03ef
$07:f913  53 7a         eor ($7a,s),y
$07:f915  c1 1f         cmp ($1f,x)
$07:f917  ff ff 00 20   sbc $2000ff,x
$07:f91b  e0 20         cpx #$20
$07:f91d  6a            ror a
$07:f91e  2f d0 3f e0   and $e03fd0
$07:f922  da            phx
$07:f923  9a            txs
$07:f924  d3 20         cmp ($20,s),y
$07:f926  a6 00         ldx $00
$07:f928  00 0d         brk #$0d
$07:f92a  f5 41         sbc $41,x
$07:f92c  20 01 ff      jsr $ff01
$07:f92f  76 9f         ror $9f,x
$07:f931  31 dd         and ($dd),y
$07:f933  de f1 35      dec $35f1,x
$07:f936  40            rti
$07:f937  00 6a         brk #$6a
$07:f939  fe 0d df      inc $df0d,x
$07:f93c  13 dc         ora ($dc,s),y
$07:f93e  53 02         eor ($02,s),y
$07:f940  fc 6a 03      jsr ($036a,x)
$07:f943  2f ee aa ac   and $acaaee
$07:f947  4f d6 5e aa   eor $aa5ed6
$07:f94b  fe 05 3c      inc $3c05,x
$07:f94e  00 e2         brk #$e2
$07:f950  fe 11 00      inc $0011,x
$07:f953  6a            ror a
$07:f954  04 fe         tsb $fe
$07:f956  43 12         eor $12,s
$07:f958  4e b0 2d      lsr $2db0
$07:f95b  f1 6a         sbc ($6a),y
$07:f95d  bd 32 cb      lda $cb32,x
$07:f960  34 12         bit $12,x
$07:f962  2c e3 2f      bit $2fe3
$07:f965  9a            txs
$07:f966  00 ff         brk #$ff
$07:f968  00 f0         brk #$f0
$07:f96a  f1 10         sbc ($10),y
$07:f96c  ed d6 aa      sbc $aad6
$07:f96f  6f c2 ef 1f   adc $1fefc2
$07:f973  f1 11         sbc ($11),y
$07:f975  ff 11 76 1c   sbc $1c7611,x
$07:f979  f1 24         sbc ($24),y
$07:f97b  31 0f         and ($0f),y
$07:f97d  ef eb be 6a   sbc $6abeeb
$07:f981  e9 d4         sbc #$d4
$07:f983  61 11         adc ($11,x)
$07:f985  de 33 fd      dec $fd33,x
$07:f988  fe aa 00      inc $00aa,x
$07:f98b  f0 00         beq $f98d
$07:f98d  00 0f         brk #$0f
$07:f98f  e0 54         cpx #$54
$07:f991  de 9a 1d      dec $1d9a,x
$07:f994  11 d0         ora ($d0),y
$07:f996  11 00         ora ($00),y
$07:f998  00 00         brk #$00
$07:f99a  10 7a         bpl $fa16
$07:f99c  03 2e         ora $2e,s
$07:f99e  ff f0 0f e2   sbc $e20ff0,x
$07:f9a2  1c c1 7a      trb $7ac1
$07:f9a5  33 10         and ($10,s),y
$07:f9a7  ff 12 ff 00   sbc $00ff12,x
$07:f9ab  ef cb aa 00   sbc $00aacb
$07:f9af  00 10         brk #$10
$07:f9b1  ed 17 2c      sbc $2c17
$07:f9b4  00 d2         brk #$d2
$07:f9b6  8a            txa
$07:f9b7  ed 11 10      sbc $1011
$07:f9ba  01 00         ora ($00,x)
$07:f9bc  10 01         bpl $f9bf
$07:f9be  10 7a         bpl $fa3a
$07:f9c0  0f e0 00 e0   ora $e000e0
$07:f9c4  2f cd 13 21   and $2113cd
$07:f9c8  7a            ply
$07:f9c9  1e 02 1f      asl $1f02,x
$07:f9cc  ff 01 da d1   sbc $d1da01,x
$07:f9d0  f1 a6         sbc ($a6),y
$07:f9d2  00 fe         brk #$fe
$07:f9d4  cd 56 22      cmp $2256
$07:f9d7  11 10         ora ($10),y
$07:f9d9  ff 8a 05 0e   sbc $0e058a,x
$07:f9dd  10 00         bpl $f9df
$07:f9df  11 10         ora ($10),y
$07:f9e1  00 0f         brk #$0f
$07:f9e3  7a            ply
$07:f9e4  e0 10         cpx #$10
$07:f9e6  01 db         ora ($db,x)
$07:f9e8  e2 43         sep #$43
$07:f9ea  1f e0 7a 21   ora $217ae0,x
$07:f9ee  f0 f0         beq $f9e0
$07:f9f0  0c bf 0f      tsb $0fbf
$07:f9f3  12 ec         ora ($ec)
$07:f9f5  a7 eb         lda [$eb]
$07:f9f7  f6 52         inc $52,x
$07:f9f9  32 10         and ($10)
$07:f9fb  ff f0 0f a8   sbc $a80ff0,x
$07:f9ff  03 02         ora $02,s
$07:fa01  00 00         brk #$00
$07:fa03  00 00         brk #$00
$07:fa05  00 00         brk #$00
$07:fa07  00 00         brk #$00
$07:fa09  b2 cc         lda ($cc)
$07:fa0b  cc dd dd      cpy $dddd
$07:fa0e  ef 01 12 34   sbc $341201
$07:fa12  9a            txs
$07:fa13  ff 4f 20 01   sbc $01204f,x
$07:fa17  11 f1         ora ($f1),y
$07:fa19  00 1f         brk #$1f
$07:fa1b  8a            txa
$07:fa1c  3f e1 10 ff   and $ff10e1,x
$07:fa20  2f b4 ee 12   and $12eeb4
$07:fa24  86 bd         stx $bd
$07:fa26  10 e1         bpl $fa09
$07:fa28  fe fe fe      inc $fefe,x
$07:fa2b  0d 12 8a      ora $8a12
$07:fa2e  e1 2e         sbc ($2e,x)
$07:fa30  41 1e         eor ($1e,x)
$07:fa32  40            rti
$07:fa33  10 24         bpl $fa59
$07:fa35  f0 8a         beq $f9c1
$07:fa37  3f 4e 3e 2e   and $2e3e4e,x
$07:fa3b  11 f2         ora ($f2),y
$07:fa3d  e0 03         cpx #$03
$07:fa3f  8a            txa
$07:fa40  a0 31         ldy #$31
$07:fa42  93 d2         sta ($d2,s),y
$07:fa44  d3 cf         cmp ($cf,s),y
$07:fa46  ef 1b 8a f5   sbc $f58a1b
$07:fa4a  bb            tyx
$07:fa4b  3e 2e 02      rol $022e,x
$07:fa4e  01 12         ora ($12,x)
$07:fa50  02 9a         cop #$9a
$07:fa52  1e 4f 2e      asl $2e4f,x
$07:fa55  20 2e 22      jsr $222e
$07:fa58  fe 2f 9a      inc $9a2f,x
$07:fa5b  3c 5c 10      bit $105c,x
$07:fa5e  01 e0         ora ($e0,x)
$07:fa60  1e 1e f2      asl $f21e,x
$07:fa63  86 1a         stx $1a
$07:fa65  1d ff fd      ora $fdff,x
$07:fa68  dd 1b f2      cmp $f21b,x
$07:fa6b  01 8a         ora ($8a,x)
$07:fa6d  5b            tcd
$07:fa6e  07 d4         ora [$d4]
$07:fa70  e6 d1         inc $d1
$07:fa72  23 f1         and $f1,s
$07:fa74  23 8a         and $8a,s
$07:fa76  ff 41 e2 1f   sbc $1fe241,x
$07:fa7a  f3 fe         sbc ($fe,s),y
$07:fa7c  4d f2 9a      eor $9af2
$07:fa7f  f0 e0         beq $fa61
$07:fa81  10 ef         bpl $fa72
$07:fa83  10 d1         bpl $fa56
$07:fa85  e1 c2         sbc ($c2,x)
$07:fa87  8a            txa
$07:fa88  ed 2d e3      sbc $e32d
$07:fa8b  1c 30 03      trb $0330
$07:fa8e  10 3e         bpl $face
$07:fa90  8a            txa
$07:fa91  60            rts
$07:fa92  f3 00         sbc ($00,s),y
$07:fa94  31 21         and ($21),y
$07:fa96  00 11         brk #$11
$07:fa98  1d 8a 22      ora $228a,x
$07:fa9b  1b            tcs
$07:fa9c  3e 3b 11      rol $113b,x
$07:fa9f  0a            asl a
$07:faa0  1f 0d 8a 02   ora $028a0d,x
$07:faa4  dc e0 0b      jml [$0be0]
$07:faa7  3c 2b 3e      bit $3e2b,x
$07:faaa  12 8a         ora ($8a)
$07:faac  f0 21         beq $facf
$07:faae  30 2d         bmi $fadd
$07:fab0  7d 50 5a      adc $5a50,x
$07:fab3  52 8a         eor ($8a)
$07:fab5  f4 e2 f6      pea $f6e2
$07:fab8  b2 0e         lda ($0e)
$07:faba  2e 2f f1      rol $f12f
$07:fabd  8a            txa
$07:fabe  c2 d1         rep #$d1
$07:fac0  c1 fe         cmp ($fe,x)
$07:fac2  1c e0 c2      trb $c2e0
$07:fac5  de 8a e2      dec $e28a,x
$07:fac8  c3 b2         cmp $b2,s
$07:faca  04 b6         tsb $b6
$07:facc  0f 07 b3 8a   ora $8ab307
$07:fad0  41 02         eor ($02,x)
$07:fad2  f5 e4         sbc $e4,x
$07:fad4  12 d4         ora ($d4)
$07:fad6  c6 fd         dec $fd
$07:fad8  9a            txs
$07:fad9  2e 2e 1f      rol $1f2e
$07:fadc  00 f0         brk #$f0
$07:fade  0d 2e 2c      ora $2c2e
$07:fae1  86 cc         stx $cc
$07:fae3  2c e0 d2      bit $d2e0
$07:fae6  e3 e6         sbc $e6,s
$07:fae8  f3 57         sbc ($57,s),y
$07:faea  8a            txa
$07:faeb  c6 0d         dec $0d
$07:faed  70 e3         bvs $fad2
$07:faef  05 03         ora $03
$07:faf1  f4 f2 8a      pea $8af2
$07:faf4  05 b4         ora $b4
$07:faf6  2e 11 f2      rol $f211
$07:faf9  b3 1d         lda ($1d,s),y
$07:fafb  1d 8a f2      ora $f28a,x
$07:fafe  de 1e f0      dec $f01e,x
$07:fb01  d0 c4         bne $fac7
$07:fb03  92 b4         sta ($b4)
$07:fb05  8a            txa
$07:fb06  a1 0f         lda ($0f,x)
$07:fb08  f1 1e         sbc ($1e),y
$07:fb0a  3e 40 01      rol $0140,x
$07:fb0d  40            rti
$07:fb0e  9a            txs
$07:fb0f  11 f3         ora ($f3),y
$07:fb11  f1 03         sbc ($03),y
$07:fb13  1e 12 c4      asl $c412,x
$07:fb16  ff 8a 4b 4e   sbc $4e4b8a,x
$07:fb1a  f0 f1         beq $fb0d
$07:fb1c  c3 b2         cmp $b2,s
$07:fb1e  c2 fb         rep #$fb
$07:fb20  86 ff         stx $ff
$07:fb22  0d e2 2d      ora $2de2
$07:fb25  20 f4 05      jsr $05f4
$07:fb28  26 8a         rol $8a
$07:fb2a  d5 c5         cmp $c5,x
$07:fb2c  5b            tcd
$07:fb2d  07 f0         ora [$f0]
$07:fb2f  5d 6f 3f      eor $3f6f,x
$07:fb32  8a            txa
$07:fb33  15 d3         ora $d3,x
$07:fb35  d2 02         cmp ($02)
$07:fb37  e0 1c 11      cpx #$111c
$07:fb3a  1d 8a d1      ora $d18a,x
$07:fb3d  0c 4b 3b      tsb $3b4b
$07:fb40  2b            pld
$07:fb41  f1 d0         sbc ($d0),y
$07:fb43  ed 9a 01      sbc $019a
$07:fb46  fe 2f 00      inc $002f,x
$07:fb49  2e 12 02      rol $0212
$07:fb4c  e4 9a         cpx $9a
$07:fb4e  e3 0f         sbc $0f,s
$07:fb50  30 01         bmi $fb53
$07:fb52  2e 4d f4      rol $f44d
$07:fb55  d1 8a         cmp ($8a),y
$07:fb57  01 ee         ora ($ee,x)
$07:fb59  11 0b         ora ($0b),y
$07:fb5b  2e 2a 5b      rol $5b2a
$07:fb5e  1e 86 fd      asl $fd86,x
$07:fb61  e2 e2         sep #$e2
$07:fb63  e0 10 01      cpx #$0110
$07:fb66  33 44         and ($44,s),y
$07:fb68  9a            txs
$07:fb69  11 00         ora ($00),y
$07:fb6b  21 e4         and ($e4,x)
$07:fb6d  00 20         brk #$20
$07:fb6f  1f 3f 8a 23   ora $238a3f,x
$07:fb73  d2 10         cmp ($10)
$07:fb75  fe 4d 3a      inc $3a4d,x
$07:fb78  4d 1c 8a      eor $8a1c
$07:fb7b  2e 00 0e      rol $0e00
$07:fb7e  c2 b0         rep #$b0
$07:fb80  1c e1 c2      trb $c2e1
$07:fb83  8a            txa
$07:fb84  b3 fd         lda ($fd,s),y
$07:fb86  03 f2         ora $f2,s
$07:fb88  e4 01         cpx $01
$07:fb8a  14 21         trb $21
$07:fb8c  8a            txa
$07:fb8d  02 40         cop #$40
$07:fb8f  f3 2f         sbc ($2f,s),y
$07:fb91  22 e4 ef 2f   jsl $2fefe4
$07:fb95  8a            txa
$07:fb96  e0 2b 7a      cpx #$7a2b
$07:fb99  1e ff 0e      asl $0eff,x
$07:fb9c  00 df         brk #$df
$07:fb9e  8a            txa
$07:fb9f  e1 a0         sbc ($a0,x)
$07:fba1  1b            tcs
$07:fba2  2c 1e 1d      bit $1d1e
$07:fba5  3c 51 8a      bit $8a51,x
$07:fba8  0f 32 30 16   ora $163032
$07:fbac  d4 12         pei ($12)
$07:fbae  01 14         ora ($14,x)
$07:fbb0  9a            txs
$07:fbb1  e2 0f         sep #$0f
$07:fbb3  2f 2e 0f 01   and $010f2e
$07:fbb7  0d 3c 8a      ora $8a3c
$07:fbba  3e e1 0b      rol $0be1,x
$07:fbbd  1f fb f2 b0   ora $b0f2fb,x
$07:fbc1  f0 8a         beq $fb4d
$07:fbc3  e0 c4 f3      cpx #$f3c4
$07:fbc6  d2 23         cmp ($23)
$07:fbc8  e4 03         cpx $03
$07:fbca  3f 9a 21 0f   and $0f219a,x
$07:fbce  4f 02 e3 0e   eor $0ee302
$07:fbd2  2f 0f 8a 5a   and $5a8a0f
$07:fbd6  11 e1         ora ($e1),y
$07:fbd8  ed 3d ef      sbc $ef3d
$07:fbdb  0e ff 9a      asl $9aff
$07:fbde  e0 e1 0d      cpx #$0de1
$07:fbe1  00 f1         brk #$f1
$07:fbe3  00 0e         brk #$0e
$07:fbe5  4b            phk
$07:fbe6  9a            txs
$07:fbe7  6e 3f 2f      ror $2f3f
$07:fbea  32 ff         and ($ff)
$07:fbec  31 1f         and ($1f),y
$07:fbee  01 8a         ora ($8a,x)
$07:fbf0  2f 4d 00 2f   and $2f004d
$07:fbf4  d4 ed         pei ($ed)
$07:fbf6  1f d4 8a a1   ora $a18ad4,x
$07:fbfa  d2 ee         cmp ($ee)
$07:fbfc  e0 b3 a0      cpx #$a0b3
$07:fbff  0e f0 8a      asl $8af0
$07:fc02  e2 d0         sep #$d0
$07:fc04  04 f0         tsb $f0
$07:fc06  12 22         ora ($22)
$07:fc08  04 f5         tsb $f5
$07:fc0a  8a            txa
$07:fc0b  03 f3         ora $f3,s
$07:fc0d  f6 fe         inc $fe,x
$07:fc0f  10 4e         bpl $fc5f
$07:fc11  f3 d0         sbc ($d0,s),y
$07:fc13  9a            txs
$07:fc14  02 c2         cop #$c2
$07:fc16  0c 4c 2f      tsb $2f4c
$07:fc19  ff 0e 1e 8a   sbc $8a1e0e,x
$07:fc1d  3a            dec a
$07:fc1e  f1 ec         sbc ($ec),y
$07:fc20  2d 4a 5b      and $5b4a
$07:fc23  5e 02 8a      lsr $8a02,x
$07:fc26  f3 22         sbc ($22,s),y
$07:fc28  f3 33         sbc ($33,s),y
$07:fc2a  f6 c4         inc $c4,x
$07:fc2c  12 00         ora ($00)
$07:fc2e  8a            txa
$07:fc2f  10 12         bpl $fc43
$07:fc31  e0 f1         cpx #$f1
$07:fc33  0f e3 b2 0d   ora $0db2e3
$07:fc37  8a            txa
$07:fc38  d4 ce         pei ($ce)
$07:fc3a  1f d1 ea 3f   ora $3fead1,x
$07:fc3e  fb            xce
$07:fc3f  02 8a         cop #$8a
$07:fc41  e0 f0         cpx #$f0
$07:fc43  f1 5b         sbc ($5b),y
$07:fc45  14 21         trb $21
$07:fc47  f5 23         sbc $23,x
$07:fc49  8a            txa
$07:fc4a  04 e2         tsb $e2
$07:fc4c  20 1f 4f      jsr $4f1f
$07:fc4f  1e 20 e0      asl $e020,x
$07:fc52  9a            txs
$07:fc53  1f 00 e1 0f   ora $0fe100,x
$07:fc57  d3 ff         cmp ($ff,s),y
$07:fc59  1c 2f 86      trb $862f
$07:fc5c  e0 fe         cpx #$fe
$07:fc5e  4d 11 11      eor $1111
$07:fc61  06 26         asl $26
$07:fc63  34 8a         bit $8a,x
$07:fc65  51 e4         eor ($e4),y
$07:fc67  f5 16         sbc $16,x
$07:fc69  d5 0e         cmp $0e,x
$07:fc6b  7c 4e 8a      jmp ($8a4e,x)
$07:fc6e  4d 12 e0      eor $e012
$07:fc71  1f c7 a3 d0   ora $d0a3c7,x
$07:fc75  e2 8a         sep #$8a
$07:fc77  c0 29         cpy #$29
$07:fc79  3e fe e1      rol $e1fe,x
$07:fc7c  dc 01 ed      jml [$ed01]
$07:fc7f  8a            txa
$07:fc80  4b            phk
$07:fc81  2e 14 c2      rol $c214
$07:fc84  12 22         ora ($22)
$07:fc86  13 13         ora ($13,s),y
$07:fc88  8a            txa
$07:fc89  30 12         bmi $fc9d
$07:fc8b  01 21         ora ($21,x)
$07:fc8d  e2 03         sep #$03
$07:fc8f  ee 1f 8a      inc $8a1f
$07:fc92  f1 00         sbc ($00),y
$07:fc94  d2 c0         cmp ($c0)
$07:fc96  0f e1 e1 a1   ora $a1e1e1
$07:fc9a  8a            txa
$07:fc9b  ff ed ff 0c   sbc $0cffed,x
$07:fc9f  4e 0d 13      lsr $130d
$07:fca2  f2 8a         sbc ($8a)
$07:fca4  13 e5         ora ($e5,s),y
$07:fca6  12 41         ora ($41)
$07:fca8  13 01         ora ($01,s),y
$07:fcaa  2d 6e 8a      and $8a6e
$07:fcad  0f 3e 4b f4   ora $f44b3e
$07:fcb1  fe e3 ee      inc $eee3,x
$07:fcb4  0e 7a f1      asl $f17a
$07:fcb7  a4 ae         ldy $ae
$07:fcb9  ad d0 d9      lda $d9d0
$07:fcbc  fc 3a 9a      jsr ($9a3a,x)
$07:fcbf  1e 2e 11      asl $112e,x
$07:fcc2  f2 01         sbc ($01)
$07:fcc4  04 f1         tsb $f1
$07:fcc6  13 8a         ora ($8a,s),y
$07:fcc8  f0 12         beq $fcdc
$07:fcca  0f 6a 6e 10   ora $106e6a
$07:fcce  02 b1         cop #$b1
$07:fcd0  9a            txs
$07:fcd1  00 00         brk #$00
$07:fcd3  fe 11 d1      inc $d111,x
$07:fcd6  f0 e2         beq $fcba
$07:fcd8  c1 96         cmp ($96,x)
$07:fcda  01 ef         ora ($ef,x)
$07:fcdc  10 2f         bpl $fd0d
$07:fcde  01 03         ora ($03,x)
$07:fce0  f6 34         inc $34,x
$07:fce2  8a            txa
$07:fce3  03 f5         ora $f5,s
$07:fce5  32 07         and ($07)
$07:fce7  ff f5 f1 2d   sbc $2df1f5,x
$07:fceb  9a            txs
$07:fcec  12 e1         ora ($e1)
$07:fcee  f0 02         beq $fcf2
$07:fcf0  c2 ff         rep #$ff
$07:fcf2  1f f0 86 bc   ora $bc86f0,x
$07:fcf6  2b            pld
$07:fcf7  0f 01 e1 f0   ora $f0e101
$07:fcfb  2f 11 8a f1   and $f18a11
$07:fcff  e2 1c         sep #$1c
$07:fd01  7d 24 12      adc $1224,x
$07:fd04  16 f6         asl $f6,x
$07:fd06  8a            txa
$07:fd07  d3 21         cmp ($21,s),y
$07:fd09  c4 3d         cpy $3d
$07:fd0b  11 0f         ora ($0f),y
$07:fd0d  0f 4a 8a 4f   ora $4f8a4a
$07:fd11  fe 01 a4      inc $a401,x
$07:fd14  d2 cf         cmp ($cf)
$07:fd16  e2 92         sep #$92
$07:fd18  8a            txa
$07:fd19  c2 dc         rep #$dc
$07:fd1b  2c 59 3f      bit $3f59
$07:fd1e  1e 20 3f      asl $3f20,x
$07:fd21  8a            txa
$07:fd22  13 31         ora ($31,s),y
$07:fd24  33 4d         and ($4d,s),y
$07:fd26  42 01         wdm #$01
$07:fd28  f3 f0         sbc ($f0,s),y
$07:fd2a  8a            txa
$07:fd2b  20 01 e0      jsr $e001
$07:fd2e  11 fd         ora ($fd),y
$07:fd30  3c 00 d1      bit $d100,x
$07:fd33  8a            txa
$07:fd34  1a            inc a
$07:fd35  3c 2c d2      bit $d22c,x
$07:fd38  de b5 fb      dec $fbb5,x
$07:fd3b  10 9a         bpl $fcd7
$07:fd3d  0e 2f 03      asl $032f
$07:fd40  e1 11         sbc ($11,x)
$07:fd42  21 13         and ($13,x)
$07:fd44  f0 8a         beq $fcd0
$07:fd46  6c 5d 3f      jmp ($3f5d)
$07:fd49  3e 21 d2      rol $d221,x
$07:fd4c  f0 f3         beq $fd41
$07:fd4e  8a            txa
$07:fd4f  b4 c1         ldy $c1,x
$07:fd51  ee f4 af      inc $aff4
$07:fd54  2e de ff      rol $ffde
$07:fd57  8a            txa
$07:fd58  ed 2d fe      sbc $fe2d
$07:fd5b  10 d4         bpl $fd31
$07:fd5d  c2 d5         rep #$d5
$07:fd5f  1f 9a 12 11   ora $11129a,x
$07:fd63  20 3e 3f      jsr $3f3e
$07:fd66  10 02         bpl $fd6a
$07:fd68  f1 9a         sbc ($9a),y
$07:fd6a  f0 00         beq $fd6c
$07:fd6c  2d 12 c2      and $c212
$07:fd6f  f0 0c         beq $fd7d
$07:fd71  3e 86 df      rol $df86,x
$07:fd74  df 01 e0 2f   cmp $2fe001,x
$07:fd78  1e 21 1e      asl $1e21,x
$07:fd7b  9a            txs
$07:fd7c  3e 01 00      rol $0001,x
$07:fd7f  02 01         cop #$01
$07:fd81  21 13         and ($13,x)
$07:fd83  f0 8a         beq $fd0f
$07:fd85  6c 5e 3e      jmp ($3e5e)
$07:fd88  3e 21 d2      rol $d221,x
$07:fd8b  f1 f2         sbc ($f2),y
$07:fd8d  8a            txa
$07:fd8e  a5 d0         lda $d0
$07:fd90  ef f3 af 2e   sbc $2eaff3
$07:fd94  de 0f 8a      dec $8a0f,x
$07:fd97  ec 2d ff      cpx $ff2d
$07:fd9a  1f c5 d2 d4   ora $d4d2c5,x
$07:fd9e  1f 9b 21 11   ora $11219b,x
$07:fda2  30 2d         bmi $fdd1
$07:fda4  40            rti
$07:fda5  10 01         bpl $fda8
$07:fda7  e1 5b         sbc ($5b,x)
$07:fda9  02 02         cop #$02
$07:fdab  00 00         brk #$00
$07:fdad  00 00         brk #$00
$07:fdaf  00 00         brk #$00
$07:fdb1  00 00         brk #$00
$07:fdb3  6a            ror a
$07:fdb4  00 00         brk #$00
$07:fdb6  00 00         brk #$00
$07:fdb8  00 00         brk #$00
$07:fdba  00 c1         brk #$c1
$07:fdbc  4a            lsr a
$07:fdbd  3f 0c 00 ff   and $ff000c,x
$07:fdc1  fe ee ee      inc $eeee,x
$07:fdc4  ee 4a fc      inc $fc4a
$07:fdc7  dd dd ce      cmp $cedd,x
$07:fdca  ec dc db      cpx $dbdc
$07:fdcd  de 4a dd      dec $dd4a,x
$07:fdd0  dc cd c9      jml [$c9cd]
$07:fdd3  bd cb bc      lda $bccb,x
$07:fdd6  bb            tyx
$07:fdd7  4a            lsr a
$07:fdd8  cb            wai
$07:fdd9  bc dc ed      ldy $eddc,x
$07:fddc  bb            tyx
$07:fddd  dc cb bc      jml [$bccb]
$07:fde0  4a            lsr a
$07:fde1  cd cc dd      cmp $ddcc
$07:fde4  ec de ed      cpx $edde
$07:fde7  bd fc 7a      lda $7afc,x
$07:fdea  02 2f         cop #$2f
$07:fdec  ef fe 04 51   sbc $5104fe
$07:fdf0  dc e0 7a      jml [$7ae0]
$07:fdf3  24 3e         bit $3e
$07:fdf5  be 24 33      ldx $3324,y
$07:fdf8  2d bd f2      and $f2bd
$07:fdfb  9a            txs
$07:fdfc  22 0e e0 11   jsl $11e00e
$07:fe00  ff 11 ec d1   sbc $d1ec11,x
$07:fe04  8a            txa
$07:fe05  43 02         eor $02,s
$07:fe07  fa            plx
$07:fe08  b1 31         lda ($31),y
$07:fe0a  f0 fe         beq $fe0a
$07:fe0c  ce 8a 03      dec $038a
$07:fe0f  53 0e         eor ($0e,s),y
$07:fe11  fe 25 71      inc $7125,x
$07:fe14  ca            dex
$07:fe15  e2 9a         sep #$9a
$07:fe17  24 42         bit $42
$07:fe19  dc f3 41      jml [$41f3]
$07:fe1c  01 22         ora ($22,x)
$07:fe1e  20 8a df      jsr $df8a
$07:fe21  47 64         eor [$64]
$07:fe23  0f ef f1 46   ora $46f1ef
$07:fe27  3f 8a f2 33   and $33f28a,x
$07:fe2b  32 10         and ($10)
$07:fe2d  ec f4 52      cpx $52f4
$07:fe30  dd 8a 26      cmp $268a,x
$07:fe33  5f ba cf 01   eor $01cfba,x
$07:fe37  36 1b         rol $1b,x
$07:fe39  9f 9a 21 ec   sta $ec219a,x
$07:fe3d  de 02 32      dec $3202,x
$07:fe40  fb            xce
$07:fe41  be ff 9a      ldx $9aff,y
$07:fe44  11 0d         ora ($0d),y
$07:fe46  de 0f 01      dec $010f,x
$07:fe49  0e cd 01      asl $01cd
$07:fe4c  8a            txa
$07:fe4d  ff 22 da b1   sbc $b1da22,x
$07:fe51  44 0e ff      mvp $ff,$0e
$07:fe54  01 9a         ora ($9a,x)
$07:fe56  10 0f         bpl $fe67
$07:fe58  ff ff 14 32   sbc $3214ff,x
$07:fe5c  00 ff         brk #$ff
$07:fe5e  8a            txa
$07:fe5f  e1 45         sbc ($45,x)
$07:fe61  53 1f         eor ($1f,s),y
$07:fe63  f0 22         beq $fe87
$07:fe65  20 ff 9a      jsr $9aff
$07:fe68  14 41         trb $41
$07:fe6a  ef 12 1f f0   sbc $f01f12
$07:fe6e  10 00         bpl $fe70
$07:fe70  8a            txa
$07:fe71  43 0c         eor $0c,s
$07:fe73  ef ff 10 ec   sbc $ec10ff
$07:fe77  e3 51         sbc $51,s
$07:fe79  8a            txa
$07:fe7a  ca            dex
$07:fe7b  9a            txs
$07:fe7c  c2 64         rep #$64
$07:fe7e  fc cc cf      jsr ($cfcc,x)
$07:fe81  33 8a         and ($8a,s),y
$07:fe83  ea            nop
$07:fe84  ce ee 13      dec $13ee
$07:fe87  30 ca         bmi $fe53
$07:fe89  be 25 8a      ldx $8a25,y
$07:fe8c  3f ce f1 01   and $01f1ce,x
$07:fe90  34 1d         bit $1d,x
$07:fe92  ce 25 8a      dec $8a25
$07:fe95  64 0c         stz $0c
$07:fe97  99 e3 55      sta $55e3,y
$07:fe9a  52 ed         eor ($ed)
$07:fe9c  f1 9a         sbc ($9a),y
$07:fe9e  12 31         ora ($31)
$07:fea0  ed 14 40      sbc $4014
$07:fea3  ee 01 11      inc $1101
$07:fea6  8a            txa
$07:fea7  32 ff         and ($ff)
$07:fea9  37 62         and [$62],y
$07:feab  fc bc 05      jsr ($05bc,x)
$07:feae  63 8a         adc $8a,s
$07:feb0  fe f1 12      inc $12f1,x
$07:feb3  2f aa d0 35   and $35d0aa
$07:feb7  62 9a eb      per $ea54
$07:feba  be 02 10      ldx $1002,y
$07:febd  ff ef f1 11   sbc $11f1ef,x
$07:fec1  9a            txs
$07:fec2  fd bd 01      sbc $01bd,x
$07:fec5  11 0f         ora ($0f),y
$07:fec7  ee ef 02      inc $02ef
$07:feca  8a            txa
$07:fecb  2f dd e1 33   and $33e1dd
$07:fecf  31 dc         and ($dc),y
$07:fed1  d1 56         cmp ($56),y
$07:fed3  9a            txs
$07:fed4  21 10         and ($10,x)
$07:fed6  dc f2 43      jml [$43f2]
$07:fed9  0f 01 10 7a   ora $7a1001
$07:fedd  35 61         and $61,x
$07:fedf  25 64         and $64
$07:fee1  24 41         bit $41
$07:fee3  14 4f         trb $4f
$07:fee5  8a            txa
$07:fee6  e0 25         cpx #$25
$07:fee8  66 31         ror $31
$07:feea  ee f2 10      inc $10f2
$07:feed  01 8a         ora ($8a,x)
$07:feef  21 24         and ($24,x)
$07:fef1  40            rti
$07:fef2  ec dd f0      cpx $f0dd
$07:fef5  12 21         ora ($21)
$07:fef7  9a            txs
$07:fef8  fe cd f2      inc $f2cd,x
$07:fefb  1e de ff      asl $ffde,x
$07:fefe  01 0f         ora ($0f,x)
$07:ff00  8a            txa
$07:ff01  bb            tyx
$07:ff02  9b            txy
$07:ff03  d1 1f         cmp ($1f),y
$07:ff05  dc cd e0      jml [$e0cd]
$07:ff08  10 8a         bpl $fe94
$07:ff0a  cb            wai
$07:ff0b  e3 51         sbc $51,s
$07:ff0d  e0 2f         cpx #$2f
$07:ff0f  cd 26 74      cmp $7426
$07:ff12  8a            txa
$07:ff13  21 00         and ($00,x)
$07:ff15  11 fe         ora ($fe),y
$07:ff17  03 44         ora $44,s
$07:ff19  22 00 8a 01   jsl $018a00
$07:ff1d  34 31         bit $31,x
$07:ff1f  00 02         brk #$02
$07:ff21  44 2f dc      mvp $dc,$2f
$07:ff24  8a            txa
$07:ff25  f1 44         sbc ($44),y
$07:ff27  41 10         eor ($10,x)
$07:ff29  11 10         ora ($10),y
$07:ff2b  ee d1 8a      inc $8ad1
$07:ff2e  45 21         eor $21
$07:ff30  21 fc         and ($fc,x)
$07:ff32  de 13 31      dec $3113,x
$07:ff35  ee 8a e0      inc $e08a
$07:ff38  0f ee dc cf   ora $cfdcee
$07:ff3c  12 1e         ora ($1e)
$07:ff3e  ed 8a db      sbc $db8a
$07:ff41  cf 2f ba f0   cmp $f0ba2f
$07:ff45  fe ff fd      inc $fdff,x
$07:ff48  8a            txa
$07:ff49  cc f2 55      cpy $55f2
$07:ff4c  1c ac 03      trb $03ac
$07:ff4f  44 42 8a      mvp $8a,$42
$07:ff52  11 33         ora ($33),y
$07:ff54  20 fe f1      jsr $f1fe
$07:ff57  44 31 0f      mvp $0f,$31
$07:ff5a  8a            txa
$07:ff5b  13 32         ora ($32,s),y
$07:ff5d  0f 02 34 32   ora $323402
$07:ff61  fe ce 7a      inc $7ace,x
$07:ff64  27 4f         and [$4f]
$07:ff66  e2 77         sep #$77
$07:ff68  41 0d         eor ($0d,x)
$07:ff6a  aa            tax
$07:ff6b  ce 8a 37      dec $378a
$07:ff6e  72 dc         adc ($dc)
$07:ff70  e0 02         cpx #$02
$07:ff72  32 dc         and ($dc)
$07:ff74  e2 8a         sep #$8a
$07:ff76  32 00         and ($00)
$07:ff78  ec 9b e3      cpx $e39b
$07:ff7b  31 ed         and ($ed),y
$07:ff7d  dd 8a ee      cmp $ee8a,x
$07:ff80  ee ed cb      inc $cbed
$07:ff83  cf 11 ec ba   cmp $baec11
$07:ff87  8a            txa
$07:ff88  bd 12 32      lda $3212,x
$07:ff8b  fc bc d0      jsr ($d0bc,x)
$07:ff8e  23 32         and $32,s
$07:ff90  7a            ply
$07:ff91  34 52         bit $52,x
$07:ff93  1f f0 32 ee   ora $ee32f0,x
$07:ff97  26 56         rol $56
$07:ff99  8a            txa
$07:ff9a  43 0d         eor $0d,s
$07:ff9c  e0 35         cpx #$35
$07:ff9e  63 0f         adc $0f,s
$07:ffa0  12 1f         ora ($1f)
$07:ffa2  8a            txa
$07:ffa3  e0 21         cpx #$21
$07:ffa5  e0 47         cpx #$47
$07:ffa7  62 ec cc      per $cc96
$07:ffaa  f3 8a         sbc ($8a,s),y
$07:ffac  75 2e         adc $2e,x
$07:ffae  f0 ff         beq $ffaf
$07:ffb0  14 3f         trb $3f
$07:ffb2  cc f1 9a      cpy $9af1
$07:ffb5  35 dd         and $dd,x
$07:ffb7  ee f0 00      inc $00f0
$07:ffba  10 fe         bpl $ffba
$07:ffbc  ff 8a 00 ed   sbc $ed008a,x
$07:ffc0  bc e0 00      ldy $00e0,x
$07:ffc3  0e cb be      asl $becb
$07:ffc6  8a            txa
$07:ffc7  f0 12         beq $ffdb
$07:ffc9  0f 00 ec c0   ora $c0ec00
$07:ffcd  34 54         bit $54,x
$07:ffcf  8a            txa
$07:ffd0  20 01 24      jsr $2401
$07:ffd3  42 ec         wdm #$ec
$07:ffd5  e2 67         sep #$67
$07:ffd7  51 8a         eor ($8a),y
$07:ffd9  f0 10         beq $ffeb
$07:ffdb  13 54         ora ($54,s),y
$07:ffdd  21 12         and ($12,x)
$07:ffdf  21 10         and ($10,x)
$07:ffe1  8a            txa
$07:ffe2  0e e0 45      asl $45e0
$07:ffe5  43 1f         eor $1f,s
$07:ffe7  ee ef 14      inc $14ef
$07:ffea  7a            ply
$07:ffeb  62 ff 01      per $01ed
$07:ffee  32 1f         and ($1f)
$07:fff0  fd cd 35      sbc $35cd,x
$07:fff3  8a            txa
$07:fff4  34 eb         bit $eb,x
$07:fff6  cc de 12      cpy $12de
$07:fff9  10 dc         bpl $ffd7
$07:fffb  d0 8b         bne $ff88
$07:fffd  00 ed         brk #$ed
$07:ffff  bc d0 10      ldy $10d0,x
