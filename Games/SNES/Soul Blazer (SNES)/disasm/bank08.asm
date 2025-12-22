; Soul Blazer (SNES) - Bank $08
; Disassembled from ROM
; File offset: $040000-$047fff
; CPU address: $08:$8000-$08:$ffff
;===========================================================

.bank $08
.org $8000

$08:8000  d0 10         bne $8012
$08:8002  fe da cd      inc $cdda,x
$08:8005  51 00         eor ($00),y
$08:8007  02 00         cop #$00
$08:8009  00 00         brk #$00
$08:800b  00 00         brk #$00
$08:800d  00 00         brk #$00
$08:800f  00 ba         brk #$ba
$08:8011  0f 20 4f 0f   ora $0f4f20
$08:8015  1a            inc a
$08:8016  69 1f         adc #$1f
$08:8018  3c d2 43      bit $43d2,x
$08:801b  cd 12 cd      cmp $cd12
$08:801e  cc dd dd      cpy $dddd
$08:8021  f0 b6         beq $7fd9
$08:8023  02 26         cop #$26
$08:8025  00 44         brk #$44
$08:8027  fd 3f ec      sbc $ec3f,x
$08:802a  d1 ba         cmp ($ba),y
$08:802c  e0 20         cpx #$20
$08:802e  40            rti
$08:802f  fe 1b 79      inc $791b,x
$08:8032  0f 3c d2 43   ora $43d23c
$08:8036  cd 12 cd      cmp $cd12
$08:8039  cc dd dd      cpy $dddd
$08:803c  f0 b6         beq $7ff4
$08:803e  02 26         cop #$26
$08:8040  00 33         brk #$33
$08:8042  fe 4f ec      inc $ec4f,x
$08:8045  d1 ba         cmp ($ba),y
$08:8047  e0 20         cpx #$20
$08:8049  40            rti
$08:804a  fe 1b 79      inc $791b,x
$08:804d  0f 3c d3 43   ora $43d33c
$08:8051  cd 12 cd      cmp $cd12
$08:8054  cc dd dd      cpy $dddd
$08:8057  f0 51         beq $80aa
$08:8059  00 02         brk #$02
$08:805b  00 00         brk #$00
$08:805d  00 00         brk #$00
$08:805f  00 00         brk #$00
$08:8061  00 00         brk #$00
$08:8063  a6 05         ldx $05
$08:8065  54 44 43      mvn $43,$44
$08:8068  33 33         and ($33,s),y
$08:806a  32 11         and ($11)
$08:806c  9a            txs
$08:806d  11 00         ora ($00),y
$08:806f  11 0f         ora ($0f),y
$08:8071  ee 00 23      inc $2300
$08:8074  43 aa         eor $aa,s
$08:8076  ea            nop
$08:8077  ce 7f e0      dec $e07f
$08:807a  ff f0 4f 01   sbc $014ff0,x
$08:807e  8a            txa
$08:807f  20 ce f3      jsr $f3ce
$08:8082  21 24         and ($24,x)
$08:8084  31 31         and ($31),y
$08:8086  24 9a         bit $9a
$08:8088  10 01         bpl $808b
$08:808a  10 f0         bpl $807c
$08:808c  fe f1 23      inc $23f1,x
$08:808f  33 aa         and ($aa,s),y
$08:8091  ea            nop
$08:8092  de 50 ff      dec $ff50,x
$08:8095  0f fe 40 20   ora $2040fe
$08:8099  8a            txa
$08:809a  ef fe f2 31   sbc $31f2fe
$08:809e  14 41         trb $41
$08:80a0  31 23         and ($23),y
$08:80a2  9b            txy
$08:80a3  10 01         bpl $80a6
$08:80a5  10 00         bpl $80a7
$08:80a7  ee 00 23      inc $2300
$08:80aa  43 38         eor $38,s
$08:80ac  0d 00 00      ora $0000
$08:80af  00 00         brk #$00
$08:80b1  00 00         brk #$00
$08:80b3  00 00         brk #$00
$08:80b5  00 84         brk #$84
$08:80b7  0c 00 00      tsb $0000
$08:80ba  f0 22         beq $80de
$08:80bc  0f 01 11 68   ora $681101
$08:80c0  00 0d         brk #$0d
$08:80c2  d6 5c         dec $5c,x
$08:80c4  f3 11         sbc ($11,s),y
$08:80c6  16 6f         asl $6f,x
$08:80c8  68            pla
$08:80c9  cc 05 53      cpy $5305
$08:80cc  f2 dc         sbc ($dc)
$08:80ce  12 12         ora ($12)
$08:80d0  72 74         adc ($74)
$08:80d2  db            stp
$08:80d3  ee ee 03      inc $03ee
$08:80d6  4c ac ba      jmp $baac
$08:80d9  e2 74         sep #$74
$08:80db  3d bb cd      and $cdbb,x
$08:80de  0f de 01 fc   ora $fc01de
$08:80e2  bd 78 1f      lda $1f78,x
$08:80e5  1e df 32      asl $32df,x
$08:80e8  11 bc         ora ($bc),y
$08:80ea  13 f0         ora ($f0,s),y
$08:80ec  78            sei
$08:80ed  33 0d         and ($0d,s),y
$08:80ef  c3 41         cmp $41,s
$08:80f1  ff 34 ec 15   sbc $15ec34,x
$08:80f5  78            sei
$08:80f6  3e c2 51      rol $51c2,x
$08:80f9  ff f1 55 0d   sbc $0d55f1,x
$08:80fd  e1 88         sbc ($88,x)
$08:80ff  00 0f         brk #$0f
$08:8101  02 40         cop #$40
$08:8103  ed 01 10      sbc $1001
$08:8106  01 78         ora ($78,x)
$08:8108  fd e3 64      sbc $64e3,x
$08:810b  eb            xba
$08:810c  02 42         cop #$42
$08:810e  e0 32         cpx #$32
$08:8110  78            sei
$08:8111  dc 03 20      jml [$2003]
$08:8114  43 fe         eor $fe,s
$08:8116  23 0d         and $0d,s
$08:8118  df 78 43 fd   cmp $fd4378,x
$08:811c  f3 24         sbc ($24,s),y
$08:811e  fe db be      inc $bedb,x
$08:8121  0f 78 f1 32   ora $32f178
$08:8125  b9 d0 fd      lda $fdd0,y
$08:8128  ec ac 13      cpx $13ac
$08:812b  74 13         stz $13,x
$08:812d  4d cd fe      eor $fecd
$08:8130  f0 35         beq $8167
$08:8132  41 14         eor ($14,x)
$08:8134  78            sei
$08:8135  22 fe 02 0e   jsl $0e02fe
$08:8139  fe e0 44      inc $44e0,x
$08:813c  2f 78 e0 10   and $10e078
$08:8140  23 0d         and $0d,s
$08:8142  ed 10 02      sbc $0210
$08:8145  43 78         eor $78,s
$08:8147  ee f0 ff      inc $fff0
$08:814a  cc 01 13      cpy $1301
$08:814d  44 1d 78      mvp $78,$1d
$08:8150  bb            tyx
$08:8151  00 04         brk #$04
$08:8153  43 ff         eor $ff,s
$08:8155  01 12         ora ($12,x)
$08:8157  12 78         ora ($78)
$08:8159  f0 44         beq $819f
$08:815b  0e f2 34      asl $34f2
$08:815e  20 ee 02      jsr $02ee
$08:8161  68            pla
$08:8162  34 1f         bit $1f,x
$08:8164  be 12 ec      ldx $ec12,y
$08:8167  12 0b         ora ($0b)
$08:8169  cc 68 df      cpy $df68
$08:816c  f1 10         sbc ($10),y
$08:816e  ff 10 fa 9d   sbc $9dfa10,x
$08:8172  c9 78         cmp #$78
$08:8174  05 55         ora $55
$08:8176  0d e1 01      ora $01e1
$08:8179  21 02         and ($02,x)
$08:817b  24 78         bit $78
$08:817d  61 e4         adc ($e4,x)
$08:817f  45 01         eor $01
$08:8181  f0 24         beq $81a7
$08:8183  65 43         adc $43
$08:8185  68            pla
$08:8186  10 c4         bpl $814c
$08:8188  20 37 34      jsr $3437
$08:818b  43 35         eor $35,s
$08:818d  21 78         and ($78,x)
$08:818f  11 26         ora ($26),y
$08:8191  40            rti
$08:8192  dc ef ff      jml [$ffef]
$08:8195  02 53         cop #$53
$08:8197  78            sei
$08:8198  45 0f         eor $0f
$08:819a  d0 01         bne $819d
$08:819c  00 ff         brk #$ff
$08:819e  21 13         and ($13,x)
$08:81a0  68            pla
$08:81a1  01 0e         ora ($0e,x)
$08:81a3  bf ff f0 da   lda $daf0ff,x
$08:81a7  eb            xba
$08:81a8  ac 88 ed      ldy $ed88
$08:81ab  ee ff fe      inc $feff
$08:81ae  ee fe ed      inc $edfe
$08:81b1  de 88 ee      dec $ee88,x
$08:81b4  dd de dd      cmp $ddde,x
$08:81b7  dd e0 10      cmp $10e0,x
$08:81ba  ed 78 bb      sbc $bb78
$08:81bd  ce ff de      dec $deff
$08:81c0  01 f0         ora ($f0,x)
$08:81c2  ee ff 78      inc $78ff
$08:81c5  f0 f0         beq $81b7
$08:81c7  12 22         ora ($22)
$08:81c9  32 01         and ($01)
$08:81cb  ea            nop
$08:81cc  c1 78         cmp ($78,x)
$08:81ce  35 52         and $52,x
$08:81d0  12 22         ora ($22)
$08:81d2  f0 04         beq $81d8
$08:81d4  65 0e         adc $0e
$08:81d6  78            sei
$08:81d7  e1 22         sbc ($22,x)
$08:81d9  0f 14 56 43   ora $435614
$08:81dd  21 02         and ($02,x)
$08:81df  84 32         sty $32
$08:81e1  0e ef 23      asl $23ef
$08:81e4  43 32         eor $32,s
$08:81e6  23 42         and $42,s
$08:81e8  78            sei
$08:81e9  df 24 53 0e   cmp $0e5324,x
$08:81ed  ef ed e0 24   sbc $24e0ed
$08:81f1  74 f2         stz $f2,x
$08:81f3  44 31 2e      mvp $2e,$31
$08:81f6  cd 12 0e      cmp $0e12
$08:81f9  03 78         ora $78,s
$08:81fb  da            phx
$08:81fc  ef 13 2f fe   sbc $fe2f13
$08:8200  10 ff         bpl $8201
$08:8202  ff 68 21 23   sbc $232168,x
$08:8206  31 f5         and ($f5),y
$08:8208  40            rti
$08:8209  c5 55         cmp $55
$08:820b  56 78         lsr $78,x
$08:820d  10 f0         bpl $81ff
$08:820f  04 12         tsb $12
$08:8211  ff 36 55 40   sbc $405536,x
$08:8215  78            sei
$08:8216  dd f4 66      cmp $66f4,x
$08:8219  33 01         and ($01,s),y
$08:821b  22 11 ff 78   jsl $78ff11
$08:821f  11 14         ora ($14),y
$08:8221  43 11         eor $11,s
$08:8223  ff dd cd 02   sbc $02cddd,x
$08:8227  78            sei
$08:8228  10 21         bpl $824b
$08:822a  22 1f de eb   jsl $ebde1f
$08:822e  b9 d1 78      lda $78d1,y
$08:8231  0d bc cc      ora $ccbc
$08:8234  e0 ee         cpx #$ee
$08:8236  ec bb cb      cpx $cbbb
$08:8239  88            dey
$08:823a  ff de ff 00   sbc $00ffde,x
$08:823e  dc dd ef      jml [$efdd]
$08:8241  ef 78 fe de   sbc $defe78
$08:8245  dd cd de      cmp $decd,x
$08:8248  ed ff 00      sbc $00ff
$08:824b  68            pla
$08:824c  51 eb         eor ($eb),y
$08:824e  ff 0e 03 77   sbc $77030e,x
$08:8252  ea            nop
$08:8253  c1 78         cmp ($78,x)
$08:8255  12 20         ora ($20)
$08:8257  33 43         and ($43,s),y
$08:8259  33 54         and ($54,s),y
$08:825b  22 12 88 22   jsl $228812
$08:825f  33 22         and ($22,s),y
$08:8261  01 21         ora ($21,x)
$08:8263  02 32         cop #$32
$08:8265  11 74         ora ($74),y
$08:8267  03 42         ora $42,s
$08:8269  ec cf 35      cpx $35cf
$08:826c  53 22         eor ($22,s),y
$08:826e  23 78         and $78,s
$08:8270  45 1e         eor $1e
$08:8272  d2 30         cmp ($30)
$08:8274  ec df 00      cpx $00df
$08:8277  0f 78 10 0f   ora $0f1078
$08:827b  f0 e0         beq $825d
$08:827d  dd ee df      cmp $dfee,x
$08:8280  35 78         and $78,x
$08:8282  0c cd fe      tsb $fecd
$08:8285  0f fd de 22   ora $22defd
$08:8289  0f 78 de 20   ora $20de78
$08:828d  0d ff ff      ora $ffff
$08:8290  13 30         ora ($30,s),y
$08:8292  cc 68 d5      cpy $d568
$08:8295  65 fb         adc $fb
$08:8297  f3 1f         sbc ($1f,s),y
$08:8299  f5 52         sbc $52,x
$08:829b  fd 78 01      sbc $0178,x
$08:829e  23 33         and $33,s
$08:82a0  1f 02 66 31   ora $316602,x
$08:82a4  13 78         ora ($78,s),y
$08:82a6  55 21         eor $21,x
$08:82a8  f0 12         beq $82bc
$08:82aa  32 11         and ($11)
$08:82ac  10 12         bpl $82c0
$08:82ae  68            pla
$08:82af  31 0e         and ($0e),y
$08:82b1  02 56         cop #$56
$08:82b3  62 fd 01      per $84b3
$08:82b6  d9 78 cf      cmp $cf78,y
$08:82b9  fe dc dd      inc $dddc,x
$08:82bc  fe cc dd      inc $ddcc,x
$08:82bf  dc 88 ff      jml [$ff88]
$08:82c2  ed ef 0f      sbc $0fef
$08:82c5  ec df 10      cpx $10df
$08:82c8  ee 78 ca      inc $ca78
$08:82cb  9a            txs
$08:82cc  ef ed ee ce   sbc $ceeeed
$08:82d0  dc dd 68      jml [$68dd]
$08:82d3  aa            tax
$08:82d4  df fd d1 e0   cmp $e0d1fd,x
$08:82d8  fe 06 62      inc $6206,x
$08:82db  78            sei
$08:82dc  de f2 12      dec $12f2,x
$08:82df  11 f1         ora ($f1),y
$08:82e1  02 46         cop #$46
$08:82e3  43 78         eor $78,s
$08:82e5  35 32         and $32,x
$08:82e7  12 47         ora ($47)
$08:82e9  75 33         adc $33,x
$08:82eb  21 01         and ($01,x)
$08:82ed  74 e0         stz $e0,x
$08:82ef  fe de ff      inc $ffde,x
$08:82f2  ee ff fe      inc $feff
$08:82f5  04 78         tsb $78
$08:82f7  34 34         bit $34,x
$08:82f9  23 33         and $33,s
$08:82fb  12 21         ora ($21)
$08:82fd  00 12         brk #$12
$08:82ff  68            pla
$08:8300  76 44         ror $44,x
$08:8302  3d be 17      and $17be,x
$08:8305  61 02         adc ($02,x)
$08:8307  2d 78 ef      and $ef78
$08:830a  00 33         brk #$33
$08:830c  2f db aa d0   and $d0aadb
$08:8310  1f 78 ff fe   ora $feff78,x
$08:8314  cf dc cc de   cmp $deccdc
$08:8318  fe ef 58      inc $58ef,x
$08:831b  d1 57         cmp ($57),y
$08:831d  01 0d         ora ($0d,x)
$08:831f  bc e3 36      ldy $36e3,x
$08:8322  44 68 fd      mvp $fd,$68
$08:8325  d1 46         cmp ($46),y
$08:8327  66 56         ror $56
$08:8329  3f f2 44 78   and $7844f2,x
$08:832d  44 32 0f      mvp $0f,$32
$08:8330  ee dd e0      inc $e0dd
$08:8333  10 ff         bpl $8334
$08:8335  68            pla
$08:8336  11 db         ora ($db),y
$08:8338  e0 21         cpx #$21
$08:833a  ff 0f 13 65   sbc $65130f,x
$08:833e  68            pla
$08:833f  2e ce 00      rol $00ce
$08:8342  e0 01         cpx #$01
$08:8344  0f ec df 78   ora $78dfec
$08:8348  01 0f         ora ($0f,x)
$08:834a  0d fe ec      ora $ecfe
$08:834d  e0 2f         cpx #$2f
$08:834f  dc 78 db      jml [$db78]
$08:8352  b9 bb cb      lda $cbbb,y
$08:8355  cd dd db      cmp $dbdd
$08:8358  bb            tyx
$08:8359  78            sei
$08:835a  cc bc cb      cpy $cbbc
$08:835d  cb            wai
$08:835e  cf 0f fe fe   cmp $fefe0f
$08:8362  68            pla
$08:8363  c1 2c         cmp ($2c,x)
$08:8365  ff df f0 13   sbc $13f0df,x
$08:8369  36 54         rol $54,x
$08:836b  78            sei
$08:836c  23 33         and $33,s
$08:836e  12 35         ora ($35)
$08:8370  57 42         eor [$42],y
$08:8372  24 10         bit $10
$08:8374  78            sei
$08:8375  11 02         ora ($02),y
$08:8377  21 34         and ($34,x)
$08:8379  31 22         and ($22),y
$08:837b  11 21         ora ($21),y
$08:837d  78            sei
$08:837e  13 21         ora ($21,s),y
$08:8380  23 46         and $46,s
$08:8382  42 21         wdm #$21
$08:8384  02 44         cop #$44
$08:8386  78            sei
$08:8387  21 12         and ($12,x)
$08:8389  22 34 32 22   jsl $223234
$08:838d  23 33         and $33,s
$08:838f  78            sei
$08:8390  11 14         ora ($14),y
$08:8392  43 21         eor $21,s
$08:8394  0f ed f1 1f   ora $1ff1ed
$08:8398  68            pla
$08:8399  dc ef fd      jml [$fdef]
$08:839c  cd de ec      cmp $ecde
$08:839f  aa            tax
$08:83a0  bc 78 de      ldy $de78,x
$08:83a3  f0 13         beq $83b8
$08:83a5  cf c0 02 00   cmp $0002c0
$08:83a9  ef 68 c0 46   sbc $46c068
$08:83ad  f0 ef         beq $839e
$08:83af  f2 4f         sbc ($4f)
$08:83b1  1e e6 78      asl $78e6,x
$08:83b4  34 23         bit $23,x
$08:83b6  1f ed ee ed   ora $edeeed,x
$08:83ba  ef 01 68 12   sbc $126801
$08:83be  fb            xce
$08:83bf  ac dc de      ldy $dedc
$08:83c2  01 42         ora ($42,x)
$08:83c4  44 68 34      mvp $34,$68
$08:83c7  f9 9d 02      sbc $029d,y
$08:83ca  3c fd d1      bit $d1fd,x
$08:83cd  31 68         and ($68),y
$08:83cf  e9 bb         sbc #$bb
$08:83d1  03 5c         ora $5c,s
$08:83d3  0a            asl a
$08:83d4  cd fe dd      cmp $ddfe
$08:83d7  88            dey
$08:83d8  fe de ed      inc $edde,x
$08:83db  ee ee ff      inc $ffee
$08:83de  fe dc 78      inc $78dc,x
$08:83e1  bc ed fd      ldy $fded,x
$08:83e4  dc cc ce      jml [$cecc]
$08:83e7  ff dc 68 ad   sbc $ad68dc,x
$08:83eb  dd dd ef      cmp $efdd,x
$08:83ee  ef 23 fd bd   sbc $bdfd23
$08:83f2  68            pla
$08:83f3  f3 43         sbc ($43,s),y
$08:83f5  22 12 23 57   jsl $572312
$08:83f9  63 21         adc $21,s
$08:83fb  68            pla
$08:83fc  f1 23         sbc ($23),y
$08:83fe  45 25         eor $25
$08:8400  42 00         wdm #$00
$08:8402  24 56         bit $56
$08:8404  78            sei
$08:8405  35 53         and $53,x
$08:8407  33 44         and ($44,s),y
$08:8409  43 33         eor $33,s
$08:840b  11 33         ora ($33),y
$08:840d  74 44         stz $44,x
$08:840f  44 43 32      mvp $32,$43
$08:8412  10 fe         bpl $8412
$08:8414  02 33         cop #$33
$08:8416  78            sei
$08:8417  67 24         adc [$24]
$08:8419  24 22         bit $22
$08:841b  12 11         ora ($11)
$08:841d  10 24         bpl $8443
$08:841f  68            pla
$08:8420  25 45         and $45
$08:8422  22 2f de 12   jsl $12de2f
$08:8426  34 31         bit $31,x
$08:8428  68            pla
$08:8429  fe ff 00      inc $00ff,x
$08:842c  0f dc ce 00   ora $00cedc
$08:8430  11 68         ora ($68),y
$08:8432  00 0f         brk #$0f
$08:8434  cb            wai
$08:8435  bd ee dd      lda $ddee,x
$08:8438  de 0e 68      dec $680e,x
$08:843b  de ed ff      dec $ffed,x
$08:843e  dc 99 bd      jml [$bd99]
$08:8441  cd de 68      cmp $68de
$08:8444  ce f9 dc      dec $dcf9
$08:8447  ca            dex
$08:8448  02 1f         cop #$1f
$08:844a  ff e1 68 2c   sbc $2c68e1,x
$08:844e  1d ff 0f      ora $0fff,x
$08:8451  ed de 0e      sbc $0ede
$08:8454  dc 68 b9      jml [$b968]
$08:8457  dd 1e 1f      cmp $1f1e,x
$08:845a  fc ef dc      jsr ($dcef,x)
$08:845d  ca            dex
$08:845e  78            sei
$08:845f  ee ed dd      inc $dded
$08:8462  ed de cc      sbc $ccde
$08:8465  cb            wai
$08:8466  bc 78 dd      ldy $dd78,x
$08:8469  dd fe ec      cmp $ecfe,x
$08:846c  dd ed de      cmp $deed,x
$08:846f  ed 68 ab      sbc $ab68
$08:8472  a9 ef         lda #$ef
$08:8474  ee de dc      inc $dcde
$08:8477  bb            tyx
$08:8478  bb            tyx
$08:8479  58            cli
$08:847a  be ed ac      ldx $aced,y
$08:847d  df d2 11 f2   cmp $f211d2,x
$08:8481  bf 68 2e ff   lda $ff2e68,x
$08:8485  23 44         and $44,s
$08:8487  20 ea 03      jsr $03ea
$08:848a  25 78         and $78
$08:848c  23 33         and $33,s
$08:848e  22 35 55 44   jsl $445535
$08:8492  23 33         and $33,s
$08:8494  78            sei
$08:8495  33 44         and ($44,s),y
$08:8497  44 44 43      mvp $43,$44
$08:849a  12 35         ora ($35)
$08:849c  43 78         eor $78,s
$08:849e  53 34         eor ($34,s),y
$08:84a0  43 34         eor $34,s
$08:84a2  43 34         eor $34,s
$08:84a4  43 34         eor $34,s
$08:84a6  78            sei
$08:84a7  33 33         and ($33,s),y
$08:84a9  11 01         ora ($01),y
$08:84ab  12 45         ora ($45)
$08:84ad  41 24         eor ($24,x)
$08:84af  78            sei
$08:84b0  43 23         eor $23,s
$08:84b2  43 32         eor $32,s
$08:84b4  12 f1         ora ($f1)
$08:84b6  34 33         bit $33,x
$08:84b8  68            pla
$08:84b9  52 f0         eor ($f0)
$08:84bb  11 11         ora ($11),y
$08:84bd  22 33 2f dd   jsl $dd2f33
$08:84c1  68            pla
$08:84c2  00 f1         brk #$f1
$08:84c4  01 f1         ora ($f1,x)
$08:84c6  92 ed         sta ($ed)
$08:84c8  ce dc 68      dec $68dc
$08:84cb  bb            tyx
$08:84cc  a9 9a         lda #$9a
$08:84ce  fe fd ed      inc $edfd,x
$08:84d1  ca            dex
$08:84d2  df 68 12 2f   cmp $2f1268,x
$08:84d6  db            stp
$08:84d7  ba            tsx
$08:84d8  aa            tax
$08:84d9  ee ec ca      inc $caec
$08:84dc  78            sei
$08:84dd  ee dc ee      inc $eedc
$08:84e0  ef fe cd de   sbc $decdfe
$08:84e4  de 78 de      dec $de78,x
$08:84e7  cc dd cb      cpy $cbdd
$08:84ea  ed da ba      sbc $bada
$08:84ed  aa            tax
$08:84ee  78            sei
$08:84ef  bc de ed      ldy $edde,x
$08:84f2  cc bd ee      cpy $eebd
$08:84f5  ff ff 68 aa   sbc $aa68ff,x
$08:84f9  bc ce a2      ldy $a2ce,x
$08:84fc  ef bb b0 f0   sbc $f0b0bb
$08:8500  58            cli
$08:8501  ca            dex
$08:8502  df ed ec ad   cmp $adeced,x
$08:8506  00 42         brk #$42
$08:8508  0f 68 ed f3   ora $f3ed68
$08:850c  23 ff         and $ff,s
$08:850e  de df 02      dec $02df,x
$08:8511  25 78         and $78
$08:8513  2f 1e 00 21   and $21001e
$08:8517  44 32 41      mvp $41,$32
$08:851a  01 78         ora ($78,x)
$08:851c  03 34         ora $34,s
$08:851e  34 22         bit $22,x
$08:8520  02 33         cop #$33
$08:8522  23 33         and $33,s
$08:8524  78            sei
$08:8525  24 42         bit $42
$08:8527  22 12 44 32   jsl $324412
$08:852b  22 24 78 45   jsl $457824
$08:852f  31 13         and ($13),y
$08:8531  10 23         bpl $8556
$08:8533  54 33 32      mvn $32,$33
$08:8536  78            sei
$08:8537  23 34         and $34,s
$08:8539  65 77         adc $77
$08:853b  54 44 34      mvn $34,$44
$08:853e  45 78         eor $78
$08:8540  45 34         eor $34
$08:8542  44 34 54      mvp $54,$34
$08:8545  21 23         and ($23,x)
$08:8547  33 68         and ($68,s),y
$08:8549  63 33         adc $33,s
$08:854b  53 31         eor ($31,s),y
$08:854d  10 fe         bpl $854d
$08:854f  f1 0f         sbc ($0f),y
$08:8551  68            pla
$08:8552  ed bc df      sbc $dfbc
$08:8555  ff ec cb cd   sbc $cdcbec,x
$08:8559  ef 68 24 21   sbc $212468
$08:855d  ec cd de      cpx $decd
$08:8560  11 0e         ora ($0e),y
$08:8562  ca            dex
$08:8563  78            sei
$08:8564  ee ff fe      inc $feff
$08:8567  0d fd ed      ora $edfd
$08:856a  ec dc 88      cpx $88dc
$08:856d  ff fd ed ed   sbc $ededfd,x
$08:8571  fe fe ec      inc $ecfe,x
$08:8574  dc 78 9c      jml [$9c78]
$08:8577  cd bb aa      cmp $aabb
$08:857a  bc ac ee      ldy $eeac,x
$08:857d  00 68         brk #$68
$08:857f  dc bb ae      jml [$aebb]
$08:8582  de bb ab      dec $abbb,x
$08:8585  bd f0 78      lda $78f0,x
$08:8588  0f fe ee ff   ora $ffeefe
$08:858c  c1 ef         cmp ($ef,x)
$08:858e  ff ff 78 ee   sbc $ee78ff,x
$08:8592  ec e2 c0      cpx $c0e2
$08:8595  fe ce ef      inc $efce,x
$08:8598  f0 68         beq $8602
$08:859a  da            phx
$08:859b  cf fe 01 11   cmp $1101fe
$08:859f  32 12         and ($12)
$08:85a1  33 78         and ($78,s),y
$08:85a3  24 43         bit $43
$08:85a5  32 11         and ($11)
$08:85a7  23 33         and $33,s
$08:85a9  45 32         eor $32
$08:85ab  78            sei
$08:85ac  33 33         and ($33,s),y
$08:85ae  33 33         and ($33,s),y
$08:85b0  43 32         eor $32,s
$08:85b2  33 33         and ($33,s),y
$08:85b4  78            sei
$08:85b5  33 44         and ($44,s),y
$08:85b7  42 23         wdm #$23
$08:85b9  33 33         and ($33,s),y
$08:85bb  33 12         and ($12,s),y
$08:85bd  78            sei
$08:85be  23 35         and $35,s
$08:85c0  55 56         eor $56,x
$08:85c2  76 54         ror $54,x
$08:85c4  57 66         eor [$66],y
$08:85c6  78            sei
$08:85c7  44 33 34      mvp $34,$33
$08:85ca  44 45 43      mvp $43,$45
$08:85cd  33 22         and ($22,s),y
$08:85cf  68            pla
$08:85d0  44 55 44      mvp $44,$55
$08:85d3  46 20         lsr $20
$08:85d5  f0 0f         beq $85e6
$08:85d7  00 68         brk #$68
$08:85d9  ee ee ef      inc $efee
$08:85dc  dd dc cb      cmp $cbdc,x
$08:85df  dd fe 58      cmp $58fe,x
$08:85e2  fe 02 1e      inc $1e02,x
$08:85e5  01 44         ora ($44,x)
$08:85e7  e5 1e         sbc $1e
$08:85e9  db            stp
$08:85ea  68            pla
$08:85eb  d0 10         bne $85fd
$08:85ed  11 2e         ora ($2e),y
$08:85ef  4c ed ef      jmp $efed
$08:85f2  fc 78 ef      jsr ($ef78,x)
$08:85f5  fd dd ed      sbc $eddd,x
$08:85f8  dd ed cb      cmp $cbed,x
$08:85fb  dc 78 cb      jml [$cb78]
$08:85fe  cb            wai
$08:85ff  a9 aa         lda #$aa
$08:8601  bb            tyx
$08:8602  bb            tyx
$08:8603  dd eb 78      cmp $78eb,x
$08:8606  ef de de dd   sbc $dddede
$08:860a  de cc cd      dec $cdcc,x
$08:860d  de 78 dd      dec $dd78,x
$08:8610  fe db ec      inc $ecdb,x
$08:8613  ce ed de      dec $deed
$08:8616  fe 78 ec      inc $ec78,x
$08:8619  cc cd dc      cpy $dccd
$08:861c  cc de fe      cpy $fede
$08:861f  dd 78 dc      cmp $dc78,x
$08:8622  dd ee ff      cmp $ffee,x
$08:8625  ff 00 11 21   sbc $211100,x
$08:8629  78            sei
$08:862a  12 23         ora ($23)
$08:862c  22 22 14 34   jsl $341422
$08:8630  34 44         bit $44,x
$08:8632  78            sei
$08:8633  24 54         bit $54
$08:8635  53 34         eor ($34,s),y
$08:8637  54 55 54      mvn $54,$55
$08:863a  34 78         bit $78,x
$08:863c  55 54         eor $54,x
$08:863e  34 45         bit $45,x
$08:8640  55 54         eor $54,x
$08:8642  33 33         and ($33,s),y
$08:8644  78            sei
$08:8645  33 35         and ($35,s),y
$08:8647  54 56 45      mvn $45,$56
$08:864a  75 46         adc $46,x
$08:864c  55 78         eor $78,x
$08:864e  34 44         bit $44,x
$08:8650  33 24         and ($24,s),y
$08:8652  33 22         and ($22,s),y
$08:8654  12 21         ora ($21)
$08:8656  68            pla
$08:8657  02 22         cop #$22
$08:8659  34 33         bit $33,x
$08:865b  20 ec be      jsr $beec
$08:865e  cd 68 dc      cmp $dc68
$08:8661  dd ee dc      cmp $dcee,x
$08:8664  ba            tsx
$08:8665  ba            tsx
$08:8666  cc bf 68      cpy $68bf
$08:8669  ca            dex
$08:866a  1d 00 0f      ora $0f00,x
$08:866d  10 1f         bpl $868e
$08:866f  d3 2f         cmp ($2f,s),y
$08:8671  68            pla
$08:8672  2f 11 33 23   and $233311
$08:8676  11 06         ora ($06),y
$08:8678  cf 2e 68 20   cmp $20682e
$08:867c  21 2e         and ($2e,x)
$08:867e  fd 1f ed      sbc $ed1f,x
$08:8681  db            stp
$08:8682  cc 78 fe      cpy $fe78
$08:8685  ee ed cc      inc $cced
$08:8688  cc cd dc      cpy $dccd
$08:868b  de 78 ed      dec $ed78,x
$08:868e  fd b0 ce      sbc $ceb0,x
$08:8691  de cd ee      dec $eecd,x
$08:8694  cc 78 cd      cpy $cd78
$08:8697  cc cc bb      cpy $bbcc
$08:869a  bc cb cd      ldy $cdcb,x
$08:869d  dc 78 cc      jml [$cc78]
$08:86a0  ca            dex
$08:86a1  ab            plb
$08:86a2  ca            dex
$08:86a3  aa            tax
$08:86a4  bb            tyx
$08:86a5  f9 cf 78      sbc $78cf,y
$08:86a8  9b            txy
$08:86a9  bd cc cd      lda $cdcc,x
$08:86ac  dd ef ff      cmp $ffef,x
$08:86af  00 78         brk #$78
$08:86b1  00 10         brk #$10
$08:86b3  ff 12 33 32   sbc $323312,x
$08:86b7  32 34         and ($34)
$08:86b9  78            sei
$08:86ba  33 22         and ($22,s),y
$08:86bc  34 33         bit $33,x
$08:86be  54 55 55      mvn $55,$55
$08:86c1  55 78         eor $78,x
$08:86c3  55 54         eor $54,x
$08:86c5  34 56         bit $56,x
$08:86c7  57 76         eor [$76],y
$08:86c9  45 55         eor $55
$08:86cb  78            sei
$08:86cc  46 56         lsr $56
$08:86ce  45 67         eor $67
$08:86d0  66 66         ror $66
$08:86d2  65 75         adc $75
$08:86d4  88            dey
$08:86d5  24 22         bit $22
$08:86d7  24 32         bit $32
$08:86d9  12 22         ora ($22)
$08:86db  11 11         ora ($11),y
$08:86dd  68            pla
$08:86de  32 24         and ($24)
$08:86e0  44 23 32      mvp $32,$23
$08:86e3  11 0e         ora ($0e),y
$08:86e5  ef 68 dc dd   sbc $dddc68
$08:86e9  fe ec db      inc $dbec,x
$08:86ec  cd cb dc      cmp $dccb
$08:86ef  68            pla
$08:86f0  cb            wai
$08:86f1  cd ff ee      cmp $eeff
$08:86f4  fe ee ed      inc $edee,x
$08:86f7  ef 68 f0 34   sbc $34f068
$08:86fb  13 f1         ora ($f1,s),y
$08:86fd  00 0f         brk #$0f
$08:86ff  ee f0 78      inc $78f0
$08:8702  01 00         ora ($00,x)
$08:8704  11 10         ora ($10),y
$08:8706  0e ef ce      asl $ceef
$08:8709  fe 78 ff      inc $ff78,x
$08:870c  0e ee dd      asl $ddee
$08:870f  dc dd eb      jml [$ebdd]
$08:8712  dc 78 dd      jml [$dd78]
$08:8715  ee ee da      inc $daee
$08:8718  dd dd dd      cmp $dddd,x
$08:871b  dd 78 dc      cmp $dc78,x
$08:871e  cc cb cb      cpy $cbcb
$08:8721  aa            tax
$08:8722  bb            tyx
$08:8723  cc cb 78      cpy $78cb
$08:8726  bb            tyx
$08:8727  cc b9 ab      cpy $abb9
$08:872a  b9 a9 bc      lda $bca9,y
$08:872d  cb            wai
$08:872e  78            sei
$08:872f  bb            tyx
$08:8730  bc cc dc      ldy $dccc,x
$08:8733  dc dc d0      jml [$d0dc]
$08:8736  fe 78 0f      inc $0f78,x
$08:8739  0f ef 01 02   ora $0201ef
$08:873d  25 12         and $12
$08:873f  32 78         and ($78)
$08:8741  22 23 22 33   jsl $332223
$08:8745  34 55         bit $55,x
$08:8747  65 65         adc $65
$08:8749  88            dey
$08:874a  22 33 13 21   jsl $211333
$08:874e  44 34 33      mvp $33,$34
$08:8751  23 88         and $88,s
$08:8753  33 34         and ($34,s),y
$08:8755  33 23         and ($23,s),y
$08:8757  34 34         bit $34,x
$08:8759  33 33         and ($33,s),y
$08:875b  78            sei
$08:875c  65 46         adc $46
$08:875e  76 55         ror $55,x
$08:8760  54 34 34      mvn $34,$34
$08:8763  22 78 23 22   jsl $222378
$08:8767  21 12         and ($12,x)
$08:8769  21 10         and ($10,x)
$08:876b  4e f1 68      lsr $68f1
$08:876e  b3 de         lda ($de,s),y
$08:8770  e0 e0         cpx #$e0
$08:8772  fe ed ff      inc $ffed,x
$08:8775  0f 58 aa bc   ora $bcaa58
$08:8779  fe f1 11      inc $11f1,x
$08:877c  d9 cb cd      cmp $cdcb,y
$08:877f  68            pla
$08:8780  11 14         ora ($14),y
$08:8782  1c 5e 1e      trb $1e5e
$08:8785  0e 0e 0e      asl $0e0e
$08:8788  68            pla
$08:8789  f0 10         beq $879b
$08:878b  21 0e         and ($0e,x)
$08:878d  fe dc db      inc $dbdc,x
$08:8790  bd 78 fd      lda $fd78,x
$08:8793  1f fe ed ed   ora $ededfe,x
$08:8797  ed ee bc      sbc $bcee
$08:879a  78            sei
$08:879b  0c ed ed      tsb $eded
$08:879e  dc cc cc      jml [$cccc]
$08:87a1  be fc 78      ldx $78fc,y
$08:87a4  cb            wai
$08:87a5  cc bb bc      cpy $bcbb
$08:87a8  ba            tsx
$08:87a9  bb            tyx
$08:87aa  ba            tsx
$08:87ab  ab            plb
$08:87ac  78            sei
$08:87ad  bb            tyx
$08:87ae  bb            tyx
$08:87af  a9 9a         lda #$9a
$08:87b1  aa            tax
$08:87b2  9a            txs
$08:87b3  aa            tax
$08:87b4  bb            tyx
$08:87b5  78            sei
$08:87b6  ab            plb
$08:87b7  cb            wai
$08:87b8  cc bc db      cpy $dbbc
$08:87bb  cd de ff      cmp $ffde
$08:87be  68            pla
$08:87bf  fe db dd      inc $dddb,x
$08:87c2  f0 13         beq $87d7
$08:87c4  34 43         bit $43,x
$08:87c6  06 78         asl $78
$08:87c8  21 32         and ($32,x)
$08:87ca  33 43         and ($43,s),y
$08:87cc  33 44         and ($44,s),y
$08:87ce  55 44         eor $44,x
$08:87d0  78            sei
$08:87d1  45 44         eor $44
$08:87d3  45 55         eor $55
$08:87d5  45 57         eor $57
$08:87d7  56 67         lsr $67,x
$08:87d9  78            sei
$08:87da  65 55         adc $55
$08:87dc  64 66         stz $66
$08:87de  65 77         adc $77
$08:87e0  66 56         ror $56
$08:87e2  78            sei
$08:87e3  55 56         eor $56,x
$08:87e5  66 65         ror $65
$08:87e7  55 54         eor $54,x
$08:87e9  43 54         eor $54,s
$08:87eb  78            sei
$08:87ec  33 34         and ($34,s),y
$08:87ee  31 33         and ($33),y
$08:87f0  22 22 00 11   jsl $110022
$08:87f4  68            pla
$08:87f5  f1 01         sbc ($01),y
$08:87f7  e1 f0         sbc ($f0,x)
$08:87f9  f0 e0         beq $87db
$08:87fb  2b            pld
$08:87fc  d0 68         bne $8866
$08:87fe  cf dd bf 01   cmp $01bfdd
$08:8802  0f ec cc df   ora $dfccec
$08:8806  58            cli
$08:8807  0f 00 ee dc   ora $dcee00
$08:880b  ea            nop
$08:880c  ec 0f 0d      cpx $0d0f
$08:880f  68            pla
$08:8810  ee 0d fe      inc $fe0d
$08:8813  0e ed cd      asl $cded
$08:8816  dd dc 78      cmp $78dc,x
$08:8819  ee ee ed      inc $edee
$08:881c  ef fd dd ed   sbc $edddfd
$08:8820  db            stp
$08:8821  78            sei
$08:8822  cd ed dc      cmp $dced
$08:8825  dd cb bd      cmp $bdcb,x
$08:8828  dc dd 78      jml [$78dd]
$08:882b  cc cb bb      cpy $bbcb
$08:882e  cc dc cb      cpy $cbdc
$08:8831  bb            tyx
$08:8832  ab            plb
$08:8833  78            sei
$08:8834  cd bb ba      cmp $babb
$08:8837  aa            tax
$08:8838  bb            tyx
$08:8839  ba            tsx
$08:883a  bb            tyx
$08:883b  bb            tyx
$08:883c  78            sei
$08:883d  bc bc cc      ldy $ccbc,x
$08:8840  cd ae bb      cmp $bbae
$08:8843  ce ee 68      dec $68ee
$08:8846  ed cc bc      sbc $bccc
$08:8849  de 00 11      dec $1100,x
$08:884c  01 13         ora ($13,x)
$08:884e  78            sei
$08:884f  10 31         bpl $8882
$08:8851  32 32         and ($32)
$08:8853  32 34         and ($34)
$08:8855  44 33 88      mvp $88,$33
$08:8858  22 12 32 22   jsl $223212
$08:885c  32 22         and ($22)
$08:885e  34 12         bit $12,x
$08:8860  88            dey
$08:8861  52 32         eor ($32)
$08:8863  33 32         and ($32,s),y
$08:8865  33 33         and ($33,s),y
$08:8867  33 33         and ($33,s),y
$08:8869  78            sei
$08:886a  67 56         adc [$56]
$08:886c  57 67         eor [$67],y
$08:886e  55 55         eor $55,x
$08:8870  45 65         eor $65
$08:8872  78            sei
$08:8873  44 45 43      mvp $43,$45
$08:8876  24 34         bit $34
$08:8878  22 12 11 58   jsl $581112
$08:887c  24 11         bit $11
$08:887e  0f fd e0 fd   ora $fde0fd
$08:8882  cc 9c 78      cpy $789c
$08:8885  fe ee fe      inc $feee,x
$08:8888  fe 0e ee      inc $ee0e,x
$08:888b  ee ec 78      inc $78ec
$08:888e  e0 ef         cpx #$ef
$08:8890  ff ef ee ef   sbc $efeeef,x
$08:8894  0c f0 68      tsb $68f0
$08:8897  be bd ce      ldx $cebd,y
$08:889a  dd cc cb      cmp $cbcc,x
$08:889d  bc cc 68      ldy $68cc,x
$08:88a0  ac cb d9      ldy $d9cb
$08:88a3  cb            wai
$08:88a4  d9 cb da      cmp $dacb,y
$08:88a7  ba            tsx
$08:88a8  78            sei
$08:88a9  dd de da      cmp $dade,x
$08:88ac  0b            phd
$08:88ad  ec ec dc      cpx $dcec
$08:88b0  ed 78 ed      sbc $ed78
$08:88b3  ed cc dd      sbc $ddcc
$08:88b6  dd dd dd      cmp $dddd,x
$08:88b9  db            stp
$08:88ba  78            sei
$08:88bb  cd cc bd      cmp $bdcc
$08:88be  cc cc cb      cpy $cbcc
$08:88c1  cb            wai
$08:88c2  bc 78 cc      ldy $cc78,x
$08:88c5  cc cc cc      cpy $cccc
$08:88c8  dd cc fd      cmp $fdcc,x
$08:88cb  cf 68 cc ad   cmp $adcc68
$08:88cf  bd ce de      lda $dece,x
$08:88d2  00 13         brk #$13
$08:88d4  21 68         and ($68,x)
$08:88d6  22 32 33 45   jsl $453332
$08:88da  55 56         eor $56,x
$08:88dc  65 66         adc $66
$08:88de  78            sei
$08:88df  43 43         eor $43,s
$08:88e1  46 16         lsr $16
$08:88e3  35 46         and $46,x
$08:88e5  35 66         and $66,x
$08:88e7  88            dey
$08:88e8  23 33         and $33,s
$08:88ea  23 33         and $33,s
$08:88ec  34 33         bit $33,x
$08:88ee  33 33         and ($33,s),y
$08:88f0  88            dey
$08:88f1  33 43         and ($43,s),y
$08:88f3  33 33         and ($33,s),y
$08:88f5  44 33 33      mvp $33,$33
$08:88f8  33 78         and ($78,s),y
$08:88fa  56 55         lsr $55,x
$08:88fc  55 44         eor $44,x
$08:88fe  32 53         and ($53)
$08:8900  13 32         ora ($32,s),y
$08:8902  68            pla
$08:8903  33 31         and ($31,s),y
$08:8905  10 fe         bpl $8905
$08:8907  2b            pld
$08:8908  1e ed ed      asl $eded,x
$08:890b  78            sei
$08:890c  ee ee ee      inc $eeee
$08:890f  2a            rol a
$08:8910  0d fc ed      ora $edfc
$08:8913  dc 68 bb      jml [$bb68]
$08:8916  cb            wai
$08:8917  cd dc dc      cmp $dcdc
$08:891a  ab            plb
$08:891b  cd ba 68      cmp $68ba
$08:891e  eb            xba
$08:891f  9c ba bb      stz $bbba
$08:8922  c9 ca         cmp #$ca
$08:8924  da            phx
$08:8925  bb            tyx
$08:8926  68            pla
$08:8927  cb            wai
$08:8928  ca            dex
$08:8929  cb            wai
$08:892a  cc cb cb      cpy $cbcb
$08:892d  bc cd 78      ldy $78cd,x
$08:8930  ee fe fd      inc $fdfe
$08:8933  ee fb df      inc $dffb
$08:8936  ed ee 68      sbc $68ee
$08:8939  ed db ca      sbc $cadb
$08:893c  fa            plx
$08:893d  cb            wai
$08:893e  db            stp
$08:893f  ba            tsx
$08:8940  ba            tsx
$08:8941  78            sei
$08:8942  dc dd c9      jml [$c9dd]
$08:8945  fc ec dc      jsr ($dcec,x)
$08:8948  db            stp
$08:8949  db            stp
$08:894a  78            sei
$08:894b  bc cc cc      ldy $cccc,x
$08:894e  cc dd cc      cpy $ccdd
$08:8951  dd ee 68      cmp $68ee,x
$08:8954  bb            tyx
$08:8955  cc bc cb      cpy $cbbc
$08:8958  cc 0e f0      cpy $f00e
$08:895b  11 68         ora ($68),y
$08:895d  11 22         ora ($22),y
$08:895f  33 33         and ($33,s),y
$08:8961  32 34         and ($34)
$08:8963  44 35 78      mvp $78,$35
$08:8966  33 23         and ($23,s),y
$08:8968  43 34         eor $34,s
$08:896a  53 43         eor ($43,s),y
$08:896c  44 56 88      mvp $88,$56
$08:896f  23 22         and $22,s
$08:8971  24 32         bit $32
$08:8973  33 43         and ($43,s),y
$08:8975  33 44         and ($44,s),y
$08:8977  88            dey
$08:8978  23 43         and $43,s
$08:897a  25 33         and $33
$08:897c  34 44         bit $44,x
$08:897e  34 34         bit $34,x
$08:8980  88            dey
$08:8981  43 24         eor $24,s
$08:8983  33 23         and ($23,s),y
$08:8985  22 23 21 12   jsl $122123
$08:8989  78            sei
$08:898a  43 32         eor $32,s
$08:898c  22 01 01 f1   jsl $f10101
$08:8990  f0 ff         beq $8991
$08:8992  68            pla
$08:8993  ee ee ee      inc $eeee
$08:8996  ed fd dd      sbc $ddfd
$08:8999  cc cb 68      cpy $68cb
$08:899c  bb            tyx
$08:899d  bb            tyx
$08:899e  cc eb dc      cpy $dceb
$08:89a1  dd db db      cmp $dbdb,x
$08:89a4  78            sei
$08:89a5  ed cc ec      sbc $eccc
$08:89a8  dd ec dd      cmp $ddec,x
$08:89ab  dd dc 78      cmp $78dc,x
$08:89ae  cd dd ed      cmp $eddd
$08:89b1  dd dd ec      cmp $ecdd,x
$08:89b4  dd ec 68      cmp $68ec,x
$08:89b7  bd db dd      lda $dddb,x
$08:89ba  ce bc da      dec $dabc
$08:89bd  bb            tyx
$08:89be  cb            wai
$08:89bf  78            sei
$08:89c0  ee ee f0      inc $f0ee
$08:89c3  ff ee 1d de   sbc $de1dee,x
$08:89c7  de 78 ed      dec $ed78,x
$08:89ca  dc ec dd      jml [$ddec]
$08:89cd  ec dd dc      cpx $dcdd
$08:89d0  dd 78 dc      cmp $dc78,x
$08:89d3  cc bd 09      cpy $09bd
$08:89d6  dc dc ee      jml [$eedc]
$08:89d9  ed 78 ef      sbc $ef78
$08:89dc  dc 2d fd      jml [$fd2d]
$08:89df  fd ee ff      sbc $ffee,x
$08:89e2  00 68         brk #$68
$08:89e4  cf 4f 30 31   cmp $31304f
$08:89e8  21 2f         and ($2f,x)
$08:89ea  20 12 68      jsr $6812
$08:89ed  33 33         and ($33,s),y
$08:89ef  53 43         eor ($43,s),y
$08:89f1  44 56 66      mvp $66,$56
$08:89f4  77 78         adc [$78],y
$08:89f6  34 34         bit $34,x
$08:89f8  34 45         bit $45,x
$08:89fa  35 45         and $45,x
$08:89fc  57 66         eor [$66],y
$08:89fe  88            dey
$08:89ff  33 23         and ($23,s),y
$08:8a01  42 25         wdm #$25
$08:8a03  22 34 34 34   jsl $343434
$08:8a07  88            dey
$08:8a08  44 33 33      mvp $33,$33
$08:8a0b  33 32         and ($32,s),y
$08:8a0d  22 32 22 74   jsl $742232
$08:8a11  ef fc dc bb   sbc $bbdcfc
$08:8a15  bb            tyx
$08:8a16  bc cb bb      ldy $bbcb,x
$08:8a19  48            pha
$08:8a1a  fe ee 0c      inc $0cee,x
$08:8a1d  0f f1 00 0e   ora $0e00f1
$08:8a21  ec 78 ff      cpx $ff78
$08:8a24  ee ff fe      inc $feff
$08:8a27  ff 3b 10 ff   sbc $ff103b,x
$08:8a2b  68            pla
$08:8a2c  de cb cb      dec $cbcb,x
$08:8a2f  ba            tsx
$08:8a30  bb            tyx
$08:8a31  cb            wai
$08:8a32  bc ba 78      ldy $78ba,x
$08:8a35  dd dd ed      cmp $eddd,x
$08:8a38  a1 de         lda ($de,x)
$08:8a3a  de ed ce      dec $ceed,x
$08:8a3d  74 ec         stz $ec,x
$08:8a3f  de cd de      dec $decd,x
$08:8a42  ee f0 fe      inc $fef0
$08:8a45  dd 68 a9      cmp $a968,x
$08:8a48  cc cb ee      cpy $eecb
$08:8a4b  dd ec cc      cmp $ccec,x
$08:8a4e  bb            tyx
$08:8a4f  78            sei
$08:8a50  dd dd dc      cmp $dcdd,x
$08:8a53  cd ed cd      cmp $cded
$08:8a56  dc cd 78      jml [$78cd]
$08:8a59  dd dc dd      cmp $dddc,x
$08:8a5c  dc df ad      jml [$addf]
$08:8a5f  dd de 64      cmp $64de,x
$08:8a62  dd d0 12      cmp $12d0,x
$08:8a65  23 32         and $32,s
$08:8a67  1f ed db 68   ora $68dbed,x
$08:8a6b  ef f1 ea 6d   sbc $6deaf1
$08:8a6f  2d 2d 0e      and $0e2d
$08:8a72  0e 68 21      asl $2168
$08:8a75  f0 40         beq $8ab7
$08:8a77  31 31         and ($31),y
$08:8a79  31 22         and ($22),y
$08:8a7b  45 78         eor $78
$08:8a7d  32 43         and ($43)
$08:8a7f  32 33         and ($33)
$08:8a81  23 43         and $43,s
$08:8a83  34 45         bit $45,x
$08:8a85  78            sei
$08:8a86  55 45         eor $45,x
$08:8a88  55 45         eor $45,x
$08:8a8a  55 45         eor $45,x
$08:8a8c  55 56         eor $56,x
$08:8a8e  78            sei
$08:8a8f  56 66         lsr $66,x
$08:8a91  66 55         ror $55
$08:8a93  36 34         rol $34,x
$08:8a95  34 45         bit $45,x
$08:8a97  64 10         stz $10
$08:8a99  ff f0 fe dd   sbc $ddfef0,x
$08:8a9d  dd ce 1f      cmp $1fce,x
$08:8aa0  68            pla
$08:8aa1  26 04         rol $04
$08:8aa3  02 12         cop #$12
$08:8aa5  14 23         trb $23
$08:8aa7  23 34         and $34,s
$08:8aa9  68            pla
$08:8aaa  f1 5f         sbc ($5f),y
$08:8aac  20 21 22      jsr $2221
$08:8aaf  22 3d 62 78   jsl $78623d
$08:8ab3  f2 f0         sbc ($f0)
$08:8ab5  0f fe f0 1b   ora $1bf0fe
$08:8ab9  1f fe 78 ee   ora $ee78fe,x
$08:8abd  fd ed ed      sbc $eded,x
$08:8ac0  fe 0c fe      inc $fe0c,x
$08:8ac3  fd 68 da      sbc $da68,x
$08:8ac6  ab            plb
$08:8ac7  c9 b1         cmp #$b1
$08:8ac9  9e dd cc      stz $ccdd,x
$08:8acc  bc 78 ee      ldy $ee78,x
$08:8acf  de de de      dec $dede,x
$08:8ad2  de ee de      dec $deee,x
$08:8ad5  ec 78 dc      cpx $dc78
$08:8ad8  cc bb cc      cpy $ccbb
$08:8adb  cc cc bb      cpy $bbcc
$08:8ade  cb            wai
$08:8adf  88            dey
$08:8ae0  ed dd ee      sbc $eedd
$08:8ae3  ee ee ef      inc $efee
$08:8ae6  cf ed 64 cb   cmp $cb64ed
$08:8aea  ed ef 00      sbc $00ef
$08:8aed  14 e2         trb $e2
$08:8aef  10 01         bpl $8af2
$08:8af1  58            cli
$08:8af2  be ee c1      ldx $c1ee,y
$08:8af5  a1 e1         lda ($e1,x)
$08:8af7  e1 ef         sbc ($ef,x)
$08:8af9  0d 58 e3      ora $e358
$08:8afc  31 62         and ($62),y
$08:8afe  63 71         adc $71,s
$08:8b00  54 43 45      mvn $45,$43
$08:8b03  78            sei
$08:8b04  20 44 05      jsr $0544
$08:8b07  24 13         bit $13
$08:8b09  24 23         bit $23
$08:8b0b  24 78         bit $78
$08:8b0d  44 44 45      mvp $45,$44
$08:8b10  44 55 45      mvp $45,$55
$08:8b13  45 45         eor $45
$08:8b15  78            sei
$08:8b16  55 45         eor $45,x
$08:8b18  66 55         ror $55
$08:8b1a  44 54 15      mvp $15,$54
$08:8b1d  43 74         eor $74,s
$08:8b1f  33 21         and ($21,s),y
$08:8b21  22 1f fe dc   jsl $dcfe1f
$08:8b25  cd dd 68      cmp $68dd
$08:8b28  34 43         bit $43,x
$08:8b2a  15 3c         ora $3c,x
$08:8b2c  41 22         eor ($22,x)
$08:8b2e  13 22         ora ($22,s),y
$08:8b30  78            sei
$08:8b31  12 21         ora ($21)
$08:8b33  f4 f3 22      pea $22f3
$08:8b36  22 21 22 68   jsl $682221
$08:8b3a  54 10 51      mvn $51,$10
$08:8b3d  30 41         bmi $8b80
$08:8b3f  2f 21 4d 68   and $684d21
$08:8b43  02 e0         cop #$e0
$08:8b45  fd ed ec      sbc $eced,x
$08:8b48  fd fe fd      sbc $fdfe,x
$08:8b4b  78            sei
$08:8b4c  fe fe fe      inc $fefe,x
$08:8b4f  fd ed 3c      sbc $3ced,x
$08:8b52  fe ee 68      inc $68ee,x
$08:8b55  ec bc dd      cpx $ddbc
$08:8b58  ca            dex
$08:8b59  cb            wai
$08:8b5a  cb            wai
$08:8b5b  cb            wai
$08:8b5c  ba            tsx
$08:8b5d  88            dey
$08:8b5e  ef ed e0 cf   sbc $cfe0ed
$08:8b62  df de ee de   cmp $deeede,x
$08:8b66  88            dey
$08:8b67  ec ee b0      cpx $b0ee
$08:8b6a  ce de ee      dec $eede
$08:8b6d  ee ee 64      inc $64ee
$08:8b70  cb            wai
$08:8b71  ab            plb
$08:8b72  ab            plb
$08:8b73  bb            tyx
$08:8b74  cd db bc      cmp $bcdb
$08:8b77  cd 78 ef      cmp $ef78
$08:8b7a  ff fe f0 0f   sbc $0ff0fe,x
$08:8b7e  0c 10 00      tsb $0010
$08:8b81  58            cli
$08:8b82  de 10 23      dec $2310,x
$08:8b85  43 54         eor $54,s
$08:8b87  44 54 34      mvp $34,$54
$08:8b8a  78            sei
$08:8b8b  11 22         ora ($22),y
$08:8b8d  22 23 33 22   jsl $223323
$08:8b91  34 35         bit $35,x
$08:8b93  78            sei
$08:8b94  03 60         ora $60,s
$08:8b96  66 25         ror $25
$08:8b98  44 34 45      mvp $45,$34
$08:8b9b  55 78         eor $78,x
$08:8b9d  45 45         eor $45
$08:8b9f  45 54         eor $54
$08:8ba1  44 54 34      mvp $34,$54
$08:8ba4  44 78 34      mvp $34,$78
$08:8ba7  34 33         bit $33,x
$08:8ba9  34 12         bit $12,x
$08:8bab  32 e3         and ($e3)
$08:8bad  21 74         and ($74,x)
$08:8baf  cc de ff      cpy $ffde
$08:8bb2  01 22         ora ($22,x)
$08:8bb4  e3 22         sbc $22,s
$08:8bb6  33 78         and ($78,s),y
$08:8bb8  01 11         ora ($11,x)
$08:8bba  12 21         ora ($21)
$08:8bbc  03 13         ora $13,s
$08:8bbe  12 23         ora ($23)
$08:8bc0  68            pla
$08:8bc1  35 35         and $35,x
$08:8bc3  33 33         and ($33,s),y
$08:8bc5  24 33         bit $33
$08:8bc7  23 41         and $41,s
$08:8bc9  58            cli
$08:8bca  57 33         eor [$33],y
$08:8bcc  40            rti
$08:8bcd  1e 1d fd      asl $fd1d,x
$08:8bd0  fe fe 68      inc $68fe,x
$08:8bd3  0f 0e 0d 0d   ora $0d0d0e
$08:8bd7  0e ff fb      asl $fbff
$08:8bda  3e 68 af      rol $af68,x
$08:8bdd  ce cf de      dec $decf
$08:8be0  ee dc dd      inc $dddc
$08:8be3  da            phx
$08:8be4  78            sei
$08:8be5  de dc cd      dec $cddc,x
$08:8be8  ec cc eb      cpx $ebcc
$08:8beb  cc cb 78      cpy $78cb
$08:8bee  bb            tyx
$08:8bef  bb            tyx
$08:8bf0  ba            tsx
$08:8bf1  ba            tsx
$08:8bf2  bb            tyx
$08:8bf3  ca            dex
$08:8bf4  bc cb 74      ldy $74cb,x
$08:8bf7  ab            plb
$08:8bf8  bc db dd      ldy $dddb,x
$08:8bfb  dd dc cd      cmp $cddc,x
$08:8bfe  ee 68 9a      inc $9a68
$08:8c01  bc ec cd      ldy $cdec,x
$08:8c04  ed df fc      sbc $fcdf
$08:8c07  ed 68 0e      sbc $0e68
$08:8c0a  fe 00 01      inc $0100,x
$08:8c0d  12 12         ora ($12)
$08:8c0f  4e 31 78      lsr $7831
$08:8c12  01 11         ora ($11,x)
$08:8c14  21 12         and ($12,x)
$08:8c16  11 51         ora ($51),y
$08:8c18  23 33         and $33,s
$08:8c1a  78            sei
$08:8c1b  32 33         and ($33)
$08:8c1d  54 24 24      mvn $24,$24
$08:8c20  33 35         and ($35,s),y
$08:8c22  35 78         and $78,x
$08:8c24  35 45         and $45,x
$08:8c26  34 45         bit $45,x
$08:8c28  33 24         and ($24,s),y
$08:8c2a  44 34 74      mvp $74,$34
$08:8c2d  44 54 15      mvp $15,$54
$08:8c30  33 12         and ($12,s),y
$08:8c32  00 ff         brk #$ff
$08:8c34  ed 68 34      sbc $3468
$08:8c37  22 34 14 13   jsl $131434
$08:8c3b  03 14         ora $14,s
$08:8c3d  11 68         ora ($68),y
$08:8c3f  23 03         and $03,s
$08:8c41  13 23         ora ($23,s),y
$08:8c43  24 6e         bit $6e
$08:8c45  64 44         stz $44
$08:8c47  68            pla
$08:8c48  64 55         stz $55
$08:8c4a  45 34         eor $34
$08:8c4c  54 33 44      mvn $44,$33
$08:8c4f  54 68 43      mvn $43,$68
$08:8c52  46 13         lsr $13
$08:8c54  11 12         ora ($12),y
$08:8c56  01 11         ora ($11,x)
$08:8c58  10 48         bpl $8ca2
$08:8c5a  2d ef ef      and $efef
$08:8c5d  3f 4e 4f 2e   and $2e4f4e,x
$08:8c61  da            phx
$08:8c62  68            pla
$08:8c63  00 cc         brk #$cc
$08:8c65  2b            pld
$08:8c66  1d 0d 0d      ora $0d0d,x
$08:8c69  fd dc 78      sbc $78dc,x
$08:8c6c  ee dd ed      inc $eddd
$08:8c6f  ec dc dd      cpx $dddc
$08:8c72  dc cb 78      jml [$78cb]
$08:8c75  bb            tyx
$08:8c76  cb            wai
$08:8c77  bb            tyx
$08:8c78  ba            tsx
$08:8c79  bb            tyx
$08:8c7a  ba            tsx
$08:8c7b  ca            dex
$08:8c7c  bb            tyx
$08:8c7d  78            sei
$08:8c7e  cb            wai
$08:8c7f  ab            plb
$08:8c80  cb            wai
$08:8c81  cb            wai
$08:8c82  cb            wai
$08:8c83  dc cc dc      jml [$dccc]
$08:8c86  64 aa         stz $aa
$08:8c88  ce fd 00      dec $00fd
$08:8c8b  11 35         ora ($35),y
$08:8c8d  56 66         lsr $66,x
$08:8c8f  58            cli
$08:8c90  cc ce ee      cpy $eece
$08:8c93  30 32         bmi $8cc7
$08:8c95  34 03         bit $03,x
$08:8c97  21 68         and ($68,x)
$08:8c99  31 32         and ($32),y
$08:8c9b  42 33         wdm #$33
$08:8c9d  33 44         and ($44,s),y
$08:8c9f  45 55         eor $55
$08:8ca1  78            sei
$08:8ca2  34 34         bit $34,x
$08:8ca4  33 43         and ($43,s),y
$08:8ca6  43 50         eor $50,s
$08:8ca8  53 34         eor ($34,s),y
$08:8caa  78            sei
$08:8cab  34 54         bit $54,x
$08:8cad  43 43         eor $43,s
$08:8caf  33 61         and ($61,s),y
$08:8cb1  33 34         and ($34,s),y
$08:8cb3  68            pla
$08:8cb4  65 66         adc $66
$08:8cb6  57 33         eor [$33],y
$08:8cb8  65 33         adc $33
$08:8cba  14 23         trb $23
$08:8cbc  64 cd         stz $cd
$08:8cbe  ee de ce      inc $cede
$08:8cc1  de ef e0      dec $e0ef,x
$08:8cc4  12 68         ora ($68)
$08:8cc6  03 11         ora $11,s
$08:8cc8  22 02 13 12   jsl $121302
$08:8ccc  25 3f         and $3f
$08:8cce  78            sei
$08:8ccf  13 12         ora ($12,s),y
$08:8cd1  12 22         ora ($22)
$08:8cd3  12 22         ora ($22)
$08:8cd5  e4 21         cpx $21
$08:8cd7  68            pla
$08:8cd8  62 32 43      per $d00d
$08:8cdb  12 11         ora ($11)
$08:8cdd  22 01 00 48   jsl $480001
$08:8ce1  5f 1c 0c e3   eor $e30c1c,x
$08:8ce5  ff 5f 07 fd   sbc $fd075f,x
$08:8ce9  58            cli
$08:8cea  1f de fe fd   ora $fdfede,x
$08:8cee  00 fd         brk #$fd
$08:8cf0  fc cd 68      jsr ($68cd,x)
$08:8cf3  dc dd dc      jml [$dcdd]
$08:8cf6  db            stp
$08:8cf7  cb            wai
$08:8cf8  ab            plb
$08:8cf9  ba            tsx
$08:8cfa  aa            tax
$08:8cfb  78            sei
$08:8cfc  cd cc bb      cmp $bbcc
$08:8cff  bc cb cc      ldy $cccb,x
$08:8d02  bb            tyx
$08:8d03  bb            tyx
$08:8d04  78            sei
$08:8d05  bb            tyx
$08:8d06  bc ba cb      ldy $cbba,x
$08:8d09  cb            wai
$08:8d0a  bc cc cc      ldy $cccc,x
$08:8d0d  74 bc         stz $bc,x
$08:8d0f  dd cd ee      cmp $eecd,x
$08:8d12  d0 ef         bne $8d03
$08:8d14  01 01         ora ($01,x)
$08:8d16  68            pla
$08:8d17  dd cf df      cmp $dfcf,x
$08:8d1a  e0 ff         cpx #$ff
$08:8d1c  10 10         bpl $8d2e
$08:8d1e  30 68         bmi $8d88
$08:8d20  01 f2         ora ($f2,x)
$08:8d22  6e 32 42      ror $4232
$08:8d25  42 43         wdm #$43
$08:8d27  45 78         eor $78
$08:8d29  31 33         and ($33),y
$08:8d2b  34 33         bit $33,x
$08:8d2d  33 25         and ($25,s),y
$08:8d2f  42 34         wdm #$34
$08:8d31  78            sei
$08:8d32  44 44 33      mvp $33,$44
$08:8d35  34 36         bit $36,x
$08:8d37  04 34         tsb $34
$08:8d39  33 78         and ($78,s),y
$08:8d3b  34 33         bit $33,x
$08:8d3d  33 24         and ($24,s),y
$08:8d3f  22 12 22 12   jsl $122212
$08:8d43  44 bf ad      mvp $ad,$bf
$08:8d46  cc c1 c1      cpy $c1c1
$08:8d49  cd be e1      cmp $e1be
$08:8d4c  68            pla
$08:8d4d  12 21         ora ($21)
$08:8d4f  33 d7         and ($d7,s),y
$08:8d51  f4 04 04      pea $0404
$08:8d54  13 68         ora ($68,s),y
$08:8d56  23 14         and $14,s
$08:8d58  33 34         and ($34,s),y
$08:8d5a  32 53         and ($53)
$08:8d5c  34 43         bit $43,x
$08:8d5e  68            pla
$08:8d5f  44 34 43      mvp $43,$34
$08:8d62  33 12         and ($12,s),y
$08:8d64  11 30         ora ($30),y
$08:8d66  10 58         bpl $8dc0
$08:8d68  50 4d         bvc $8db7
$08:8d6a  42 0e         wdm #$0e
$08:8d6c  2b            pld
$08:8d6d  01 1c         ora ($1c,x)
$08:8d6f  3d 58 0e      and $0e58,x
$08:8d72  fd f0 f0      sbc $f0f0,x
$08:8d75  ef 0e ec bc   sbc $bcec0e
$08:8d79  68            pla
$08:8d7a  ec dd dc      cpx $dcdd
$08:8d7d  ec dc e9      cpx $e9dc
$08:8d80  ec a9 78      cpx $78a9
$08:8d83  dd dc db      cmp $dbdc,x
$08:8d86  cd cc cc      cmp $cccc
$08:8d89  cb            wai
$08:8d8a  cc 88 fc      cpy $fc88
$08:8d8d  ef cf de de   sbc $dedecf
$08:8d91  de ee ee      dec $eeee,x
$08:8d94  78            sei
$08:8d95  cb            wai
$08:8d96  bc dd bd      ldy $bddd,x
$08:8d99  cd dc b0      cmp $b0dc
$08:8d9c  dd 68 bb      cmp $bb68,x
$08:8d9f  bc ec ec      ldy $ecec,x
$08:8da2  ff f0 ff 2f   sbc $2ffff0,x
$08:8da6  68            pla
$08:8da7  f0 20         beq $8dc9
$08:8da9  10 12         bpl $8dbd
$08:8dab  31 34         and ($34),y
$08:8dad  33 44         and ($44,s),y
$08:8daf  78            sei
$08:8db0  22 22 32 32   jsl $323222
$08:8db4  32 43         and ($43)
$08:8db6  42 34         wdm #$34
$08:8db8  78            sei
$08:8db9  43 44         eor $44,s
$08:8dbb  33 44         and ($44,s),y
$08:8dbd  23 33         and $33,s
$08:8dbf  33 33         and ($33,s),y
$08:8dc1  74 24         stz $24,x
$08:8dc3  53 44         eor ($44,s),y
$08:8dc5  53 44         eor ($44,s),y
$08:8dc7  44 43 33      mvp $33,$43
$08:8dca  68            pla
$08:8dcb  53 35         eor ($35,s),y
$08:8dcd  45 25         eor $25
$08:8dcf  34 14         bit $14,x
$08:8dd1  23 24         and $24,s
$08:8dd3  68            pla
$08:8dd4  23 13         and $13,s
$08:8dd6  32 23         and ($23)
$08:8dd8  04 23         tsb $23
$08:8dda  23 22         and $22,s
$08:8ddc  69 22         adc #$22
$08:8dde  33 23         and ($23,s),y
$08:8de0  42 32         wdm #$32
$08:8de2  41 33         eor ($33,x)
$08:8de4  44 cb 13      mvp $13,$cb
$08:8de7  00 00         brk #$00
$08:8de9  00 00         brk #$00
$08:8deb  00 00         brk #$00
$08:8ded  00 00         brk #$00
$08:8def  00 94         brk #$94
$08:8df1  0d ff 75      ora $75ff
$08:8df4  96 41         stx $41,y
$08:8df6  23 12         and $12,s
$08:8df8  32 98         and ($98)
$08:8dfa  11 21         ora ($21),y
$08:8dfc  03 f1         ora $f1,s
$08:8dfe  5f 6b 3f 22   eor $223f6b,x
$08:8e02  b4 10         ldy $10,x
$08:8e04  ce 20 ed      dec $ed20
$08:8e07  12 de         ora ($de)
$08:8e09  0e ec b4      asl $b4ec
$08:8e0c  f2 ff         sbc ($ff)
$08:8e0e  fe 10 e1      inc $e110,x
$08:8e11  2d c1 dd      and $ddc1
$08:8e14  94 fd         sty $fd,x
$08:8e16  fa            plx
$08:8e17  cd cd 42      cmp $42cd
$08:8e1a  06 f2         asl $f2
$08:8e1c  00 a8         brk #$a8
$08:8e1e  0c e5 00      tsb $00e5
$08:8e21  ee 2f f1      inc $f12f
$08:8e24  d5 cf         cmp $cf,x
$08:8e26  a4 0b         ldy $0b
$08:8e28  df e0 30 f0   cmp $f030e0,x
$08:8e2c  de 04 3d      dec $3d04,x
$08:8e2f  a4 52         ldy $52
$08:8e31  f6 5c         inc $5c,x
$08:8e33  d0 f2         bne $8e27
$08:8e35  31 24         and ($24),y
$08:8e37  21 a4         and ($a4,x)
$08:8e39  14 6e         trb $6e
$08:8e3b  e3 23         sbc $23,s
$08:8e3d  42 36         wdm #$36
$08:8e3f  40            rti
$08:8e40  24 94         bit $94
$08:8e42  23 33         and $33,s
$08:8e44  33 33         and ($33,s),y
$08:8e46  33 34         and ($34,s),y
$08:8e48  32 23         and ($23)
$08:8e4a  a4 22         ldy $22
$08:8e4c  11 12         ora ($12),y
$08:8e4e  21 cf         and ($cf,x)
$08:8e50  0b            phd
$08:8e51  02 f2         cop #$f2
$08:8e53  a4 ec         ldy $ec
$08:8e55  1f ef ce fc   ora $fcceef,x
$08:8e59  e0 fa         cpx #$fa
$08:8e5b  cd a4 e2      cmp $e2a4
$08:8e5e  ec df e0      cpx $e0df
$08:8e61  0e 0e cd      asl $cd0e
$08:8e64  ff a4 d1 fb   sbc $fbd1a4,x
$08:8e68  f1 fd         sbc ($fd),y
$08:8e6a  cd f1 0d      cmp $0df1
$08:8e6d  ef 94 dd de   sbc $dedd94
$08:8e71  ef 45 de 41   sbc $41de45
$08:8e75  d5 2e         cmp $2e,x
$08:8e77  98            tya
$08:8e78  42 af         wdm #$af
$08:8e7a  3f 32 fd 06   and $06fd32,x
$08:8e7e  1e c0 98      asl $98c0,x
$08:8e81  55 10         eor $10,x
$08:8e83  f2 11         sbc ($11)
$08:8e85  23 f1         and $f1,s
$08:8e87  32 f0         and ($f0)
$08:8e89  94 31         sty $31,x
$08:8e8b  74 d1         stz $d1,x
$08:8e8d  57 44         eor [$44],y
$08:8e8f  54 43 33      mvn $33,$43
$08:8e92  94 33         sty $33,x
$08:8e94  33 22         and ($22,s),y
$08:8e96  fc 23 1f      jsr ($1f23,x)
$08:8e99  f1 ff         sbc ($ff),y
$08:8e9b  98            tya
$08:8e9c  02 10         cop #$10
$08:8e9e  10 d1         bpl $8e71
$08:8ea0  30 bb         bmi $8e5d
$08:8ea2  7f 04 94 dd   adc $dd9404,x
$08:8ea6  db            stp
$08:8ea7  1e ce 1b      asl $1bce,x
$08:8eaa  af ef cf 98   lda $98cfef
$08:8eae  db            stp
$08:8eaf  3f f0 b1 fe   and $feb1f0,x
$08:8eb3  10 d9         bpl $8e8e
$08:8eb5  35 a8         and $a8,x
$08:8eb7  df 2f d0 1f   cmp $1fd02f,x
$08:8ebb  de 4f d0      dec $d04f,x
$08:8ebe  e0 94         cpx #$94
$08:8ec0  43 f0         eor $f0,s
$08:8ec2  f3 4e         sbc ($4e,s),y
$08:8ec4  a0 32         ldy #$32
$08:8ec6  20 00 98      jsr $9800
$08:8ec9  ff 10 04 1d   sbc $1d0410,x
$08:8ecd  1f f1 34 be   ora $be34f1,x
$08:8ed1  98            tya
$08:8ed2  60            rts
$08:8ed3  d4 00         pei ($00)
$08:8ed5  7f d2 4f e2   adc $e24fd2,x
$08:8ed9  33 98         and ($98,s),y
$08:8edb  12 11         ora ($11)
$08:8edd  1f 34 01 4f   ora $4f0134,x
$08:8ee1  e3 31         sbc $31,s
$08:8ee3  98            tya
$08:8ee4  21 31         and ($31,x)
$08:8ee6  fe 45 3f      inc $3f45,x
$08:8ee9  e0 e5         cpx #$e5
$08:8eeb  3d 88 30      and $3088,x
$08:8eee  03 f2         ora $f2,s
$08:8ef0  c3 cf         cmp $cf,s
$08:8ef2  5e f6 a9      lsr $a9f6,x
$08:8ef5  98            tya
$08:8ef6  3f c2 fc 13   and $13fcc2,x
$08:8efa  dd 01 e0      cmp $e001,x
$08:8efd  ff 98 ec 2f   sbc $2fec98,x
$08:8f01  0f df 1f ed   ora $ed1fdf
$08:8f05  ff 10 94 fd   sbc $fd9410,x
$08:8f09  bd ed df      lda $dfed,x
$08:8f0c  2e ce 12      rol $12ce
$08:8f0f  fb            xce
$08:8f10  94 00         sty $00,x
$08:8f12  ed f0 ec      sbc $ecf0
$08:8f15  14 32         trb $32
$08:8f17  02 43         cop #$43
$08:8f19  88            dey
$08:8f1a  90 3e         bcc $8f5a
$08:8f1c  40            rti
$08:8f1d  e5 1a         sbc $1a
$08:8f1f  06 f1         asl $f1
$08:8f21  e2 98         sep #$98
$08:8f23  4f f1 11 f2   eor $f211f1
$08:8f27  1f 24 ff 11   ora $11ff24,x
$08:8f2b  88            dey
$08:8f2c  5d 25 10      eor $1025,x
$08:8f2f  63 e3         adc $e3,s
$08:8f31  06 01         asl $01
$08:8f33  53 98         eor ($98,s),y
$08:8f35  31 c0         and ($c0),y
$08:8f37  44 00 12      mvp $12,$00
$08:8f3a  00 20         brk #$20
$08:8f3c  e4 84         cpx $84
$08:8f3e  42 f0         wdm #$f0
$08:8f40  fc cf ff      jsr ($ffcf,x)
$08:8f43  eb            xba
$08:8f44  0f cd 88 e2   ora $e288cd
$08:8f48  ef fe 3c d3   sbc $d33cfe
$08:8f4c  1d ff a1      ora $a1ff,x
$08:8f4f  88            dey
$08:8f50  0e ff cf      asl $cfff
$08:8f53  fc e3 da      jsr ($dae3,x)
$08:8f56  f2 eb         sbc ($eb)
$08:8f58  98            tya
$08:8f59  ff ff ff fe   sbc $feffff,x
$08:8f5d  e2 1b         sep #$1b
$08:8f5f  ff f1 88 c9   sbc $c988f1,x
$08:8f63  2f c1 ec 00   and $00ecc1
$08:8f67  0e ec 40      asl $40ec
$08:8f6a  84 ff         sty $ff
$08:8f6c  13 54         ora ($54,s),y
$08:8f6e  04 76         tsb $76
$08:8f70  43 00         eor $00,s
$08:8f72  44 88 00      mvp $00,$88
$08:8f75  01 33         ora ($33,x)
$08:8f77  f0 4d         beq $8fc6
$08:8f79  f2 53         sbc ($53)
$08:8f7b  d0 88         bne $8f05
$08:8f7d  41 01         eor ($01,x)
$08:8f7f  33 2e         and ($2e,s),y
$08:8f81  01 42         ora ($42,x)
$08:8f83  f4 30 94      pea $9430
$08:8f86  22 33 10 23   jsl $231033
$08:8f8a  20 f3 40      jsr $40f3
$08:8f8d  12 88         ora ($88)
$08:8f8f  1f 23 20 01   ora $012023,x
$08:8f93  22 03 f0 11   jsl $11f003
$08:8f97  74 d1         stz $d1,x
$08:8f99  12 eb         ora ($eb)
$08:8f9b  e0 4f         cpx #$4f
$08:8f9d  f3 d9         sbc ($d9,s),y
$08:8f9f  1d 88 c1      ora $c188,x
$08:8fa2  10 fe         bpl $8fa2
$08:8fa4  00 ff         brk #$ff
$08:8fa6  ef fe 00 88   sbc $8800fe
$08:8faa  cd 0e ef      cmp $ef0e
$08:8fad  ee ef fd      inc $fdef
$08:8fb0  cd ef 88      cmp $88ef
$08:8fb3  fc 0e dd      jsr ($dd0e,x)
$08:8fb6  cf 1e cf da   cmp $dacf1e
$08:8fba  32 84         and ($84)
$08:8fbc  eb            xba
$08:8fbd  d0 54         bne $9013
$08:8fbf  00 ff         brk #$ff
$08:8fc1  22 22 30 88   jsl $883022
$08:8fc5  f3 1f         sbc ($1f,s),y
$08:8fc7  0e d3 60      asl $60d3
$08:8fca  c0 23         cpy #$23
$08:8fcc  e0 88         cpx #$88
$08:8fce  21 00         and ($00,x)
$08:8fd0  24 f0         bit $f0
$08:8fd2  43 fe         eor $fe,s
$08:8fd4  12 33         ora ($33)
$08:8fd6  88            dey
$08:8fd7  03 11         ora $11,s
$08:8fd9  32 d1         and ($d1)
$08:8fdb  51 23         eor ($23),y
$08:8fdd  ff 43 78 51   sbc $517843,x
$08:8fe1  e3 45         sbc $45,s
$08:8fe3  62 22 05      per $9508
$08:8fe6  41 f6         eor ($f6,x)
$08:8fe8  84 3f         sty $3f
$08:8fea  e0 ec         cpx #$ec
$08:8fec  11 ff         ora ($ff),y
$08:8fee  14 40         trb $40
$08:8ff0  ee 88 11      inc $1188
$08:8ff3  2f b2 20 11   and $1120b2
$08:8ff7  ce 32 3a      dec $3a32
$08:8ffa  78            sei
$08:8ffb  b4 ce         ldy $ce,x
$08:8ffd  dd 3f ce      cmp $ce3f,x
$08:9000  ed 00 ad      sbc $ad00
$08:9003  88            dey
$08:9004  00 dc         brk #$dc
$08:9006  f0 fd         beq $9005
$08:9008  ce 00 ef      dec $ef00
$08:900b  0c 88 be      tsb $be88
$08:900e  20 dd df      jsr $dfdd
$08:9011  ee ff ef      inc $efff
$08:9014  0e 78 dc      asl $dc78
$08:9017  ae 2e ae      ldx $ae2e
$08:901a  1d bb 54      ora $54bb,x
$08:901d  cc 78 02      cpy $0278
$08:9020  3d d1 00      and $00d1,x
$08:9023  22 0f 11 05   jsl $05110f
$08:9027  78            sei
$08:9028  5f 04 23 21   eor $212304,x
$08:902c  62 e4 23      per $b413
$08:902f  52 88         eor ($88)
$08:9031  01 32         ora ($32,x)
$08:9033  11 20         ora ($20),y
$08:9035  23 21         and $21,s
$08:9037  01 22         ora ($22,x)
$08:9039  88            dey
$08:903a  01 34         ora ($34,x)
$08:903c  0f 22 12 12   ora $121222
$08:9040  00 21         brk #$21
$08:9042  74 0f         stz $0f,x
$08:9044  f2 33         sbc ($33)
$08:9046  54 23 21      mvn $21,$23
$08:9049  ec f0 68      cpx $68f0
$08:904c  3f 96 1f 29   and $291f96,x
$08:9050  a4 6d         ldy $6d
$08:9052  cd ad 78      cmp $78ad
$08:9055  1f be d1 fb   ora $fbd1be,x
$08:9059  fe be fd      inc $fdbe,x
$08:905c  cb            wai
$08:905d  78            sei
$08:905e  be 1a dd      ldx $dd1a,y
$08:9061  ee cc dc      inc $dccc
$08:9064  ff ba 78 f0   sbc $f078ba,x
$08:9068  ec 9e 2c      cpx $2c9e
$08:906b  dd ad 31      cmp $31ad,x
$08:906e  cb            wai
$08:906f  78            sei
$08:9070  2f cd ce 30   and $30cecd
$08:9074  ff cb 33 1c   sbc $1c33cb,x
$08:9078  78            sei
$08:9079  bf 53 dc f2   lda $f2dc53,x
$08:907d  20 11 f0      jsr $f011
$08:9080  e0 78         cpx #$78
$08:9082  54 f0 10      mvn $10,$f0
$08:9085  22 32 00 23   jsl $230032
$08:9089  12 78         ora ($78)
$08:908b  32 45         and ($45)
$08:908d  0f 24 23 43   ora $432324
$08:9091  33 12         and ($12,s),y
$08:9093  78            sei
$08:9094  22 14 43 43   jsl $434314
$08:9098  32 04         and ($04)
$08:909a  43 32         eor $32,s
$08:909c  78            sei
$08:909d  32 34         and ($34)
$08:909f  11 31         ora ($31),y
$08:90a1  14 40         trb $40
$08:90a3  e2 62         sep #$62
$08:90a5  68            pla
$08:90a6  b1 51         lda ($51),y
$08:90a8  c0 20         cpy #$20
$08:90aa  dc 74 bd      jml [$bd74]
$08:90ad  ed 78 0e      sbc $0e78
$08:90b0  e0 da         cpx #$da
$08:90b2  e1 0e         sbc ($0e,x)
$08:90b4  ec dd ce      cpx $cedd
$08:90b7  78            sei
$08:90b8  1e ce fc      asl $fcce,x
$08:90bb  cc ef dc      cpy $dcef
$08:90be  ce 0d 78      dec $780d
$08:90c1  dc ed ee      jml [$eeed]
$08:90c4  bc fd d0      ldy $d0fd,x
$08:90c7  eb            xba
$08:90c8  ef 78 0e fc   sbc $fc0e78
$08:90cc  cc f2 fd      cpy $fdf2
$08:90cf  fe ed d0      inc $d0ed,x
$08:90d2  78            sei
$08:90d3  10 00         bpl $90d5
$08:90d5  00 ef         brk #$ef
$08:90d7  20 c1 4e      jsr $4ec1
$08:90da  f4 68 71      pea $7168
$08:90dd  f0 02         beq $90e1
$08:90df  34 61         bit $61,x
$08:90e1  15 53         ora $53,x
$08:90e3  54 78 13      mvn $13,$78
$08:90e6  01 43         ora ($43,x)
$08:90e8  04 40         tsb $40
$08:90ea  23 32         and $32,s
$08:90ec  10 78         bpl $9166
$08:90ee  22 24 42 23   jsl $234224
$08:90f2  21 23         and ($23,x)
$08:90f4  02 41         cop #$41
$08:90f6  78            sei
$08:90f7  23 34         and $34,s
$08:90f9  01 21         ora ($21,x)
$08:90fb  12 23         ora ($23)
$08:90fd  01 53         ora ($53,x)
$08:90ff  68            pla
$08:9100  22 11 0f 22   jsl $220f11
$08:9104  53 2f         eor ($2f,s),y
$08:9106  10 00         bpl $9108
$08:9108  78            sei
$08:9109  00 f0         brk #$f0
$08:910b  00 ed         brk #$ed
$08:910d  00 0e         brk #$0e
$08:910f  e1 fd         sbc ($fd,x)
$08:9111  78            sei
$08:9112  ed ee fe      sbc $feee
$08:9115  fd ed cd      sbc $cded,x
$08:9118  ef 0e 78 bb   sbc $bb780e
$08:911c  ee dd cd      inc $cddd
$08:911f  fe dc ce      inc $cedc,x
$08:9122  ec 78 ed      cpx $ed78
$08:9125  dd ee ed      cmp $edee,x
$08:9128  ef ee cd f0   sbc $f0cdee
$08:912c  68            pla
$08:912d  fd d0 ef      sbc $efd0,x
$08:9130  ee 0f 01      inc $010f
$08:9133  e4 2e         cpx $2e
$08:9135  68            pla
$08:9136  11 f3         ora ($f3),y
$08:9138  42 31         wdm #$31
$08:913a  12 15         ora ($15)
$08:913c  64 23         stz $23
$08:913e  68            pla
$08:913f  22 14 32 64   jsl $643214
$08:9143  24 34         bit $34
$08:9145  64 32         stz $32
$08:9147  78            sei
$08:9148  24 30         bit $30
$08:914a  02 34         cop #$34
$08:914c  30 13         bmi $9161
$08:914e  22 34 68 45   jsl $456834
$08:9152  63 03         adc $03,s
$08:9154  25 76         and $76
$08:9156  44 12 63      mvp $63,$12
$08:9159  68            pla
$08:915a  26 41         rol $41
$08:915c  02 45         cop #$45
$08:915e  2f 21 f3 1f   and $1ff321
$08:9162  68            pla
$08:9163  02 00         cop #$00
$08:9165  30 ee         bmi $9155
$08:9167  fb            xce
$08:9168  f1 ed         sbc ($ed),y
$08:916a  ef 68 ed 0e   sbc $0eed68
$08:916e  fe b9 ee      inc $eeb9,x
$08:9171  ba            tsx
$08:9172  d0 db         bne $914f
$08:9174  68            pla
$08:9175  ec eb bd      cpx $bdeb
$08:9178  da            phx
$08:9179  bc ad da      ldy $daad,x
$08:917c  aa            tax
$08:917d  68            pla
$08:917e  ce 0a 9b      dec $9b0a
$08:9181  ac ec bb      ldy $bbec
$08:9184  ab            plb
$08:9185  fd 68 ba      sbc $ba68,x
$08:9188  dd cb c0      cmp $c0cb,x
$08:918b  da            phx
$08:918c  f1 dc         sbc ($dc),y
$08:918e  de 58 0d      dec $0d58,x
$08:9191  d0 00         bne $9193
$08:9193  ca            dex
$08:9194  12 2f         ora ($2f)
$08:9196  16 45         asl $45,x
$08:9198  68            pla
$08:9199  42 21         wdm #$21
$08:919b  f1 55         sbc ($55),y
$08:919d  32 44         and ($44)
$08:919f  33 25         and ($25,s),y
$08:91a1  78            sei
$08:91a2  21 13         and ($13,x)
$08:91a4  23 22         and $22,s
$08:91a6  23 24         and $24,s
$08:91a8  22 10 74 34   jsl $347410
$08:91ac  56 55         lsr $55,x
$08:91ae  44 34 56      mvp $56,$34
$08:91b1  43 45         eor $45,s
$08:91b3  68            pla
$08:91b4  43 34         eor $34,s
$08:91b6  53 22         eor ($22,s),y
$08:91b8  32 33         and ($33)
$08:91ba  22 44 58 12   jsl $125844
$08:91be  33 47         and ($47,s),y
$08:91c0  1d ff 00      ora $00ff,x
$08:91c3  fd f1 68      sbc $68f1,x
$08:91c6  0e ef 1d      asl $1def
$08:91c9  dd fc de      cmp $defc,x
$08:91cc  fd cb 68      sbc $68cb,x
$08:91cf  de db dc      dec $dcdb,x
$08:91d2  bb            tyx
$08:91d3  cc fc aa      cpy $aafc
$08:91d6  ce 68 fa      dec $fa68
$08:91d9  ac cb cc      ldy $cccb
$08:91dc  dc ec ba      jml [$baec]
$08:91df  be 68 fc      ldx $fc68,y
$08:91e2  bd df eb      lda $ebdf,x
$08:91e5  cc cd ff      cpy $ffcd
$08:91e8  ee 64 db      inc $db64
$08:91eb  cf f2 44 41   cmp $4144f2
$08:91ef  13 20         ora ($20,s),y
$08:91f1  12 58         ora ($58)
$08:91f3  10 0e         bpl $9203
$08:91f5  f3 00         sbc ($00,s),y
$08:91f7  53 14         eor ($14,s),y
$08:91f9  63 30         adc $30,s
$08:91fb  68            pla
$08:91fc  12 32         ora ($32)
$08:91fe  33 43         and ($43,s),y
$08:9200  34 32         bit $32,x
$08:9202  25 43         and $43
$08:9204  68            pla
$08:9205  44 55 33      mvp $33,$55
$08:9208  43 55         eor $55,s
$08:920a  33 56         and ($56,s),y
$08:920c  64 68         stz $68
$08:920e  24 63         bit $63
$08:9210  25 43         and $43
$08:9212  46 44         lsr $44
$08:9214  44 35 68      mvp $68,$35
$08:9217  41 23         eor ($23,x)
$08:9219  33 33         and ($33,s),y
$08:921b  43 10         eor $10,s
$08:921d  13 0f         ora ($0f,s),y
$08:921f  58            cli
$08:9220  33 31         and ($31,s),y
$08:9222  f1 2e         sbc ($2e),y
$08:9224  0d ce ed      ora $edce
$08:9227  ee 68 fd      inc $fd68
$08:922a  ed cd ed      sbc $edcd
$08:922d  ee cd ed      inc $edcd
$08:9230  bb            tyx
$08:9231  68            pla
$08:9232  dd dd dc      cmp $dcdd,x
$08:9235  cc dd cb      cpy $cbdd
$08:9238  bb            tyx
$08:9239  dd 68 db      cmp $db68,x
$08:923c  de cb cb      dec $cbcb,x
$08:923f  cc dd ed      cpy $eddd
$08:9242  bb            tyx
$08:9243  68            pla
$08:9244  0f dc cc cd   ora $cdccdc
$08:9248  ee de fe      inc $fede
$08:924b  e0 58         cpx #$58
$08:924d  fa            plx
$08:924e  de cd 01      dec $01cd,x
$08:9251  01 0f         ora ($0f,x)
$08:9253  f0 01         beq $9256
$08:9255  68            pla
$08:9256  10 13         bpl $926b
$08:9258  32 11         and ($11)
$08:925a  21 13         and ($13,x)
$08:925c  34 22         bit $22,x
$08:925e  68            pla
$08:925f  45 21         eor $21
$08:9261  14 33         trb $33
$08:9263  34 44         bit $44,x
$08:9265  33 43         and ($43,s),y
$08:9267  68            pla
$08:9268  44 32 34      mvp $34,$32
$08:926b  34 43         bit $43,x
$08:926d  23 46         and $46,s
$08:926f  43 68         eor $68,s
$08:9271  23 24         and $24,s
$08:9273  44 43 24      mvp $24,$43
$08:9276  54 12 13      mvn $13,$12
$08:9279  68            pla
$08:927a  44 34 31      mvp $31,$34
$08:927d  11 22         ora ($22),y
$08:927f  20 11 11      jsr $1111
$08:9282  58            cli
$08:9283  63 cb         adc $cb,s
$08:9285  0f ef 0f ed   ora $ed0fef
$08:9289  dc cc 68      jml [$68cc]
$08:928c  ec ee de      cpx $deee
$08:928f  ed db ce      sbc $cedb
$08:9292  dc dd 68      jml [$68dd]
$08:9295  dc cc dc      jml [$dccc]
$08:9298  dd da cc      cmp $ccda,x
$08:929b  cc dd 68      cpy $68dd
$08:929e  dc cc cd      jml [$cdcc]
$08:92a1  dc bc dd      jml [$ddbc]
$08:92a4  cc de 68      cpy $68de
$08:92a7  ec bc de      cpx $debc
$08:92aa  ff fe ed df   sbc $dfedfe,x
$08:92ae  ee 58 f0      inc $f058
$08:92b1  0f 00 fe f2   ora $f2fe00
$08:92b5  41 12         eor ($12,x)
$08:92b7  33 68         and ($68,s),y
$08:92b9  23 33         and $33,s
$08:92bb  11 22         ora ($22),y
$08:92bd  34 32         bit $32,x
$08:92bf  22 34 68 44   jsl $446834
$08:92c3  33 33         and ($33,s),y
$08:92c5  33 24         and ($24,s),y
$08:92c7  44 35 44      mvp $44,$35
$08:92ca  68            pla
$08:92cb  33 34         and ($34,s),y
$08:92cd  34 33         bit $33,x
$08:92cf  34 33         bit $33,x
$08:92d1  25 43         and $43
$08:92d3  68            pla
$08:92d4  34 33         bit $33,x
$08:92d6  33 23         and ($23,s),y
$08:92d8  23 23         and $23,s
$08:92da  11 33         ora ($33),y
$08:92dc  58            cli
$08:92dd  42 33         wdm #$33
$08:92df  20 25 20      jsr $2025
$08:92e2  00 01         brk #$01
$08:92e4  0d 68 0f      ora $0f68
$08:92e7  f0 1f         beq $9308
$08:92e9  ee fe ed      inc $edfe
$08:92ec  ef ec 68 ef   sbc $ef68ec
$08:92f0  ed de ed      sbc $edde
$08:92f3  bd ed dc      lda $dced,x
$08:92f6  de 68 dd      dec $dd68,x
$08:92f9  dd dd cc      cmp $ccdd,x
$08:92fc  cc ed dd      cpy $dded
$08:92ff  db            stp
$08:9300  68            pla
$08:9301  cc ec dc      cpy $dcec
$08:9304  de ec dc      dec $dcec,x
$08:9307  cd ed 58      cmp $58ed
$08:930a  ba            tsx
$08:930b  aa            tax
$08:930c  dd dd db      cmp $dbdd,x
$08:930f  df 0f cc 58   cmp $58cc0f,x
$08:9313  f1 1f         sbc ($1f),y
$08:9315  03 10         ora $10,s
$08:9317  02 23         cop #$23
$08:9319  35 11         and $11,x
$08:931b  58            cli
$08:931c  26 44         rol $44
$08:931e  26 55         rol $55
$08:9320  46 47         lsr $47
$08:9322  66 64         ror $64
$08:9324  68            pla
$08:9325  33 32         and ($32,s),y
$08:9327  34 43         bit $43,x
$08:9329  33 34         and ($34,s),y
$08:932b  33 33         and ($33,s),y
$08:932d  68            pla
$08:932e  44 34 53      mvp $53,$34
$08:9331  22 34 34 44   jsl $443434
$08:9335  23 58         and $58,s
$08:9337  77 54         adc [$54],y
$08:9339  45 45         eor $45
$08:933b  56 33         lsr $33,x
$08:933d  43 55         eor $55,s
$08:933f  48            pha
$08:9340  66 42         ror $42
$08:9342  02 21         cop #$21
$08:9344  1f 02 2d de   ora $de2d02,x
$08:9348  58            cli
$08:9349  fe ec ee      inc $eeec,x
$08:934c  dd ed cb      cmp $cbed,x
$08:934f  cc bc 68      cpy $68bc
$08:9352  ee dc de      inc $dedc
$08:9355  ed cc ed      sbc $edcc
$08:9358  dd dd 68      cmp $68dd,x
$08:935b  dc dd dc      jml [$dcdd]
$08:935e  cc dd dd      cpy $dddd
$08:9361  dc dd 68      jml [$68dd]
$08:9364  ed dd cd      sbc $cddd
$08:9367  de de ee      dec $eede,x
$08:936a  ed dd 58      sbc $58dd
$08:936d  cc cd ee      cpy $eecd
$08:9370  dd dd ee      cmp $eedd,x
$08:9373  ee ef 58      inc $58ef
$08:9376  11 01         ora ($01),y
$08:9378  22 00 01 23   jsl $230100
$08:937c  03 54         ora $54,s
$08:937e  58            cli
$08:937f  24 44         bit $44
$08:9381  24 45         bit $45
$08:9383  66 45         ror $45
$08:9385  65 56         adc $56
$08:9387  68            pla
$08:9388  33 34         and ($34,s),y
$08:938a  33 33         and ($33,s),y
$08:938c  33 43         and ($43,s),y
$08:938e  33 44         and ($44,s),y
$08:9390  68            pla
$08:9391  33 34         and ($34,s),y
$08:9393  33 34         and ($34,s),y
$08:9395  33 24         and ($24,s),y
$08:9397  34 23         bit $23,x
$08:9399  58            cli
$08:939a  64 36         stz $36
$08:939c  65 44         adc $44
$08:939e  34 43         bit $43,x
$08:93a0  43 22         eor $22,s
$08:93a2  58            cli
$08:93a3  12 42         ora ($42)
$08:93a5  12 20         ora ($20)
$08:93a7  10 0e         bpl $93b7
$08:93a9  ee 01 58      inc $5801
$08:93ac  ed de cd      sbc $cdde
$08:93af  de dc dc      dec $dcdc,x
$08:93b2  ba            tsx
$08:93b3  ca            dex
$08:93b4  68            pla
$08:93b5  ed ec dd      sbc $ddec
$08:93b8  dd dd cd      cmp $cddd,x
$08:93bb  dd cc 68      cmp $68cc,x
$08:93be  dd dc cd      cmp $cddc,x
$08:93c1  dd cd dd      cmp $ddcd,x
$08:93c4  dd dc 58      cmp $58dc,x
$08:93c7  a9 bb         lda #$bb
$08:93c9  bc ca ac      ldy $acca,x
$08:93cc  cb            wai
$08:93cd  bc cc 58      ldy $58cc,x
$08:93d0  dd fd cc      cmp $ccfd,x
$08:93d3  fe fe f0      inc $f0fe,x
$08:93d6  10 ff         bpl $93d7
$08:93d8  58            cli
$08:93d9  f2 11         sbc ($11)
$08:93db  02 23         cop #$23
$08:93dd  22 23 34 34   jsl $343423
$08:93e1  58            cli
$08:93e2  24 65         bit $65
$08:93e4  45 55         eor $55
$08:93e6  44 56 55      mvp $55,$56
$08:93e9  55 58         eor $58,x
$08:93eb  56 66         lsr $66,x
$08:93ed  56 66         lsr $66,x
$08:93ef  67 55         adc [$55]
$08:93f1  67 56         adc [$56]
$08:93f3  58            cli
$08:93f4  65 45         adc $45
$08:93f6  57 57         eor [$57],y
$08:93f8  56 56         lsr $56,x
$08:93fa  66 43         ror $43
$08:93fc  58            cli
$08:93fd  46 55         lsr $55
$08:93ff  56 45         lsr $45,x
$08:9401  43 33         eor $33,s
$08:9403  43 23         eor $23,s
$08:9405  48            pha
$08:9406  65 0e         adc $0e
$08:9408  24 51         bit $51
$08:940a  1f 00 fd dc   ora $dcfd00,x
$08:940e  58            cli
$08:940f  ed dc ed      sbc $eddc
$08:9412  dc dc ca      jml [$cadc]
$08:9415  bc cb 58      ldy $58cb,x
$08:9418  ca            dex
$08:9419  a9 bb         lda #$bb
$08:941b  bb            tyx
$08:941c  9a            txs
$08:941d  aa            tax
$08:941e  aa            tax
$08:941f  a9 68         lda #$68
$08:9421  dd dc dd      cmp $dddc,x
$08:9424  dc ed dc      jml [$dced]
$08:9427  dd dd 68      cmp $68dd,x
$08:942a  de dc de      dec $dedc,x
$08:942d  dd ee ee      cmp $eeee,x
$08:9430  dd ef 58      cmp $58ef,x
$08:9433  ec cc ec      cpx $eccc
$08:9436  df fe f0 f0   cmp $f0f0fe,x
$08:943a  00 58         brk #$58
$08:943c  01 11         ora ($11,x)
$08:943e  22 23 33 24   jsl $243323
$08:9442  34 45         bit $45,x
$08:9444  58            cli
$08:9445  54 46 65      mvn $65,$46
$08:9448  45 65         eor $65
$08:944a  56 65         lsr $65,x
$08:944c  66 58         ror $58
$08:944e  67 65         adc [$65]
$08:9450  46 66         lsr $66
$08:9452  67 56         adc [$56]
$08:9454  66 46         ror $46
$08:9456  58            cli
$08:9457  55 56         eor $56,x
$08:9459  54 56 65      mvn $65,$56
$08:945c  56 64         lsr $64,x
$08:945e  44 58 34      mvp $34,$58
$08:9461  45 44         eor $44
$08:9463  34 32         bit $32,x
$08:9465  22 23 33 48   jsl $483323
$08:9469  31 11         and ($11),y
$08:946b  20 11 fb      jsr $fb11
$08:946e  ed 0d dc      sbc $dc0d
$08:9471  58            cli
$08:9472  ed dd dc      sbc $dcdd
$08:9475  cc de db      cpy $dbde
$08:9478  bc cb 58      ldy $58cb,x
$08:947b  bb            tyx
$08:947c  cb            wai
$08:947d  a9 bb         lda #$bb
$08:947f  ba            tsx
$08:9480  bb            tyx
$08:9481  aa            tax
$08:9482  aa            tax
$08:9483  58            cli
$08:9484  ba            tsx
$08:9485  ba            tsx
$08:9486  ba            tsx
$08:9487  aa            tax
$08:9488  a9 ba         lda #$ba
$08:948a  ba            tsx
$08:948b  ba            tsx
$08:948c  58            cli
$08:948d  ba            tsx
$08:948e  ba            tsx
$08:948f  aa            tax
$08:9490  cc cb bc      cpy $bccb
$08:9493  cc ed 48      cpy $48ed
$08:9496  a9 bb         lda #$bb
$08:9498  bb            tyx
$08:9499  cd df ef      cmp $efdf
$08:949c  d0 00         bne $949e
$08:949e  58            cli
$08:949f  11 11         ora ($11),y
$08:94a1  11 32         ora ($32),y
$08:94a3  22 43 33 32   jsl $323343
$08:94a7  58            cli
$08:94a8  34 34         bit $34,x
$08:94aa  45 36         eor $36
$08:94ac  46 44         lsr $44
$08:94ae  45 45         eor $45
$08:94b0  58            cli
$08:94b1  56 55         lsr $55,x
$08:94b3  67 55         adc [$55]
$08:94b5  65 57         adc $57
$08:94b7  66 77         ror $77
$08:94b9  68            pla
$08:94ba  33 33         and ($33,s),y
$08:94bc  23 33         and $33,s
$08:94be  33 33         and ($33,s),y
$08:94c0  33 23         and ($23,s),y
$08:94c2  58            cli
$08:94c3  45 45         eor $45
$08:94c5  54 33 33      mvn $33,$33
$08:94c8  23 33         and $33,s
$08:94ca  22 48 14 3f   jsl $3f1448
$08:94ce  e0 ff         cpx #$ff
$08:94d0  ee dd dc      inc $dcdd
$08:94d3  db            stp
$08:94d4  58            cli
$08:94d5  dc dd dc      jml [$dcdd]
$08:94d8  bb            tyx
$08:94d9  cc cb cb      cpy $cbcb
$08:94dc  b9 58 bc      lda $bc58,y
$08:94df  ba            tsx
$08:94e0  bb            tyx
$08:94e1  ba            tsx
$08:94e2  ba            tsx
$08:94e3  aa            tax
$08:94e4  ba            tsx
$08:94e5  bb            tyx
$08:94e6  58            cli
$08:94e7  ba            tsx
$08:94e8  ab            plb
$08:94e9  ba            tsx
$08:94ea  ab            plb
$08:94eb  aa            tax
$08:94ec  bb            tyx
$08:94ed  ba            tsx
$08:94ee  bb            tyx
$08:94ef  58            cli
$08:94f0  cb            wai
$08:94f1  cb            wai
$08:94f2  cc bb dc      cpy $dcbb
$08:94f5  bb            tyx
$08:94f6  cd de 48      cmp $48de
$08:94f9  9a            txs
$08:94fa  bd dd cd      lda $cddd,x
$08:94fd  fd ef 0e      sbc $0eef,x
$08:9500  e0 58         cpx #$58
$08:9502  11 12         ora ($12),y
$08:9504  12 12         ora ($12)
$08:9506  13 23         ora ($23,s),y
$08:9508  23 24         and $24,s
$08:950a  58            cli
$08:950b  44 34 44      mvp $44,$34
$08:950e  45 45         eor $45
$08:9510  45 45         eor $45
$08:9512  46 58         lsr $58
$08:9514  55 45         eor $45,x
$08:9516  55 56         eor $56,x
$08:9518  66 66         ror $66
$08:951a  55 56         eor $56,x
$08:951c  58            cli
$08:951d  55 57         eor $57,x
$08:951f  65 56         adc $56
$08:9521  55 55         eor $55,x
$08:9523  44 45 54      mvp $54,$45
$08:9526  43 23         eor $23,s
$08:9528  33 22         and ($22,s),y
$08:952a  23 32         and $32,s
$08:952c  11 0f         ora ($0f),y
$08:952e  48            pha
$08:952f  24 21         bit $21
$08:9531  22 12 00 ff   jsl $ff0012
$08:9535  dd ec 58      cmp $58ec,x
$08:9538  ee ed ed      inc $eded
$08:953b  cd dc cc      cmp $ccdc
$08:953e  cb            wai
$08:953f  ca            dex
$08:9540  58            cli
$08:9541  ca            dex
$08:9542  ba            tsx
$08:9543  bb            tyx
$08:9544  ba            tsx
$08:9545  aa            tax
$08:9546  a9 aa         lda #$aa
$08:9548  a9 68         lda #$68
$08:954a  dd dc dd      cmp $dddc,x
$08:954d  ed dd dd      sbc $dddd
$08:9550  de dd 58      dec $58dd,x
$08:9553  9b            txy
$08:9554  bb            tyx
$08:9555  cb            wai
$08:9556  cc cb dd      cpy $ddcb
$08:9559  dd fd 48      cmp $48fd,x
$08:955c  ab            plb
$08:955d  fb            xce
$08:955e  bd ef ff      lda $ffef,x
$08:9561  e0 10         cpx #$10
$08:9563  12 48         ora ($48)
$08:9565  12 23         ora ($23)
$08:9567  24 36         bit $36
$08:9569  56 46         lsr $46,x
$08:956b  66 45         ror $45
$08:956d  58            cli
$08:956e  34 43         bit $43,x
$08:9570  34 44         bit $44,x
$08:9572  45 45         eor $45
$08:9574  45 65         eor $65
$08:9576  58            cli
$08:9577  44 55 55      mvp $55,$55
$08:957a  44 55 55      mvp $55,$55
$08:957d  55 55         eor $55,x
$08:957f  58            cli
$08:9580  56 54         lsr $54,x
$08:9582  55 55         eor $55,x
$08:9584  45 55         eor $55
$08:9586  44 54 58      mvp $58,$54
$08:9589  44 53 33      mvp $33,$53
$08:958c  43 22         eor $22,s
$08:958e  33 32         and ($32,s),y
$08:9590  22 48 33 32   jsl $323348
$08:9594  11 10         ora ($10),y
$08:9596  f0 ff         beq $9597
$08:9598  ee dc 58      inc $58dc
$08:959b  ee fe ee      inc $eefe
$08:959e  dc dc dc      jml [$dcdc]
$08:95a1  cc dc 58      cpy $58dc
$08:95a4  bc cb ba      ldy $bacb,x
$08:95a7  db            stp
$08:95a8  ba            tsx
$08:95a9  cb            wai
$08:95aa  ca            dex
$08:95ab  ba            tsx
$08:95ac  58            cli
$08:95ad  b9 ba ba      lda $baba,y
$08:95b0  bb            tyx
$08:95b1  bb            tyx
$08:95b2  ba            tsx
$08:95b3  ba            tsx
$08:95b4  ba            tsx
$08:95b5  58            cli
$08:95b6  cb            wai
$08:95b7  ba            tsx
$08:95b8  cb            wai
$08:95b9  bc bb cc      ldy $ccbb,x
$08:95bc  bc cd 48      ldy $48cd,x
$08:95bf  aa            tax
$08:95c0  aa            tax
$08:95c1  ab            plb
$08:95c2  cb            wai
$08:95c3  de dc ef      dec $efdc,x
$08:95c6  e0 58         cpx #$58
$08:95c8  01 01         ora ($01,x)
$08:95ca  01 12         ora ($12,x)
$08:95cc  22 32 22 44   jsl $442232
$08:95d0  58            cli
$08:95d1  33 45         and ($45,s),y
$08:95d3  44 45 45      mvp $45,$45
$08:95d6  46 65         lsr $65
$08:95d8  45 58         eor $58
$08:95da  65 56         adc $56
$08:95dc  65 45         adc $45
$08:95de  66 56         ror $56
$08:95e0  55 56         eor $56,x
$08:95e2  58            cli
$08:95e3  55 45         eor $45,x
$08:95e5  55 45         eor $45,x
$08:95e7  55 45         eor $45,x
$08:95e9  45 34         eor $34
$08:95eb  58            cli
$08:95ec  35 34         and $34,x
$08:95ee  34 33         bit $33,x
$08:95f0  23 32         and $32,s
$08:95f2  22 21 38 64   jsl $643821
$08:95f6  52 13         eor ($13)
$08:95f8  10 ee         bpl $95e8
$08:95fa  ec ab a9      cpx $a9ab
$08:95fd  58            cli
$08:95fe  fd ee ed      sbc $edee,x
$08:9601  dd dd cc      cmp $ccdd,x
$08:9604  cc cc 58      cpy $58cc
$08:9607  cb            wai
$08:9608  db            stp
$08:9609  bb            tyx
$08:960a  cb            wai
$08:960b  cb            wai
$08:960c  cb            wai
$08:960d  ca            dex
$08:960e  cb            wai
$08:960f  58            cli
$08:9610  ca            dex
$08:9611  bc ca bb      ldy $bbca,x
$08:9614  cb            wai
$08:9615  bb            tyx
$08:9616  cb            wai
$08:9617  bc 58 cb      ldy $cb58,x
$08:961a  cc cb cc      cpy $cccb
$08:961d  cd cc cc      cmp $cccc
$08:9620  dd 54 cc      cmp $cc54,x
$08:9623  dd dd de      cmp $dedd,x
$08:9626  f1 22         sbc ($22),y
$08:9628  23 44         and $44,s
$08:962a  48            pha
$08:962b  df 00 01 22   cmp $220100,x
$08:962f  33 33         and ($33,s),y
$08:9631  33 45         and ($45,s),y
$08:9633  58            cli
$08:9634  23 24         and $24,s
$08:9636  34 34         bit $34,x
$08:9638  44 34 54      mvp $54,$34
$08:963b  44 58 54      mvp $54,$58
$08:963e  45 56         eor $56
$08:9640  45 56         eor $56
$08:9642  45 46         eor $46
$08:9644  55 58         eor $58,x
$08:9646  56 55         lsr $55,x
$08:9648  55 56         eor $56,x
$08:964a  45 55         eor $55
$08:964c  35 55         and $55,x
$08:964e  58            cli
$08:964f  55 35         eor $35,x
$08:9651  44 45 33      mvp $33,$45
$08:9654  23 33         and $33,s
$08:9656  22 48 55 33   jsl $335548
$08:965a  12 22         ora ($22)
$08:965c  00 00         brk #$00
$08:965e  fd de 58      sbc $58de,x
$08:9661  fe ee ed      inc $edee,x
$08:9664  dc dd dd      jml [$dddd]
$08:9667  dd cb 58      cmp $58cb,x
$08:966a  cc cb bb      cpy $bbcb
$08:966d  cb            wai
$08:966e  bb            tyx
$08:966f  ca            dex
$08:9670  bc ba 58      ldy $58ba,x
$08:9673  bb            tyx
$08:9674  ba            tsx
$08:9675  bb            tyx
$08:9676  cb            wai
$08:9677  bb            tyx
$08:9678  bb            tyx
$08:9679  bb            tyx
$08:967a  cb            wai
$08:967b  58            cli
$08:967c  bc cb bc      ldy $bccb,x
$08:967f  cc bd cd      cpy $cdbd
$08:9682  db            stp
$08:9683  cd 48 bb      cmp $bb48
$08:9686  bb            tyx
$08:9687  bb            tyx
$08:9688  db            stp
$08:9689  dd ed fe      cmp $feed,x
$08:968c  ef 48 00 ff   sbc $ff0048
$08:9690  01 22         ora ($22,x)
$08:9692  24 33         bit $33
$08:9694  34 44         bit $44,x
$08:9696  58            cli
$08:9697  23 32         and $32,s
$08:9699  23 43         and $43,s
$08:969b  33 34         and ($34,s),y
$08:969d  34 44         bit $44,x
$08:969f  58            cli
$08:96a0  44 34 44      mvp $44,$34
$08:96a3  44 55 44      mvp $44,$55
$08:96a6  55 44         eor $44,x
$08:96a8  58            cli
$08:96a9  45 54         eor $54
$08:96ab  34 55         bit $55,x
$08:96ad  54 54 45      mvn $45,$54
$08:96b0  44 58 44      mvp $44,$58
$08:96b3  34 54         bit $54,x
$08:96b5  34 44         bit $44,x
$08:96b7  43 33         eor $33,s
$08:96b9  32 48         and ($48)
$08:96bb  65 42         adc $42
$08:96bd  44 42 32      mvp $32,$42
$08:96c0  22 00 10 58   jsl $581000
$08:96c4  ff 0f fd ef   sbc $effd0f,x
$08:96c8  fd de ec      sbc $ecde,x
$08:96cb  cc 58 ed      cpy $ed58
$08:96ce  cb            wai
$08:96cf  dc bb db      jml [$dbbb]
$08:96d2  ba            tsx
$08:96d3  cc ca 58      cpy $58ca
$08:96d6  bb            tyx
$08:96d7  ba            tsx
$08:96d8  bb            tyx
$08:96d9  ba            tsx
$08:96da  ba            tsx
$08:96db  bb            tyx
$08:96dc  cb            wai
$08:96dd  bb            tyx
$08:96de  58            cli
$08:96df  cb            wai
$08:96e0  ab            plb
$08:96e1  cb            wai
$08:96e2  ab            plb
$08:96e3  dc cc cc      jml [$cccc]
$08:96e6  dc 58 cc      jml [$cc58]
$08:96e9  dd ec de      cmp $deec,x
$08:96ec  ee ee ef      inc $efee
$08:96ef  ff 48 ff 00   sbc $00ff48,x
$08:96f3  00 00         brk #$00
$08:96f5  21 22         and ($22,x)
$08:96f7  33 44         and ($44,s),y
$08:96f9  58            cli
$08:96fa  22 23 32 33   jsl $333223
$08:96fe  44 33 34      mvp $34,$33
$08:9701  44 58 44      mvp $44,$58
$08:9704  44 44 55      mvp $55,$44
$08:9707  44 55 54      mvp $54,$55
$08:970a  45 58         eor $58
$08:970c  54 46 54      mvn $54,$46
$08:970f  45 54         eor $54
$08:9711  44 44 35      mvp $35,$44
$08:9714  58            cli
$08:9715  44 34 43      mvp $43,$34
$08:9718  24 33         bit $33
$08:971a  23 23         and $23,s
$08:971c  33 48         and ($48,s),y
$08:971e  43 42         eor $42,s
$08:9720  32 32         and ($32)
$08:9722  23 02         and $02,s
$08:9724  01 00         ora ($00,x)
$08:9726  48            pha
$08:9727  f0 f0         beq $9719
$08:9729  ef ee dd cd   sbc $cdddee
$08:972d  cb            wai
$08:972e  bc 58 de      ldy $de58,x
$08:9731  de dd dd      dec $dddd,x
$08:9734  dc db dd      jml [$dddb]
$08:9737  cb            wai
$08:9738  58            cli
$08:9739  cb            wai
$08:973a  cb            wai
$08:973b  cc cb cc      cpy $cccb
$08:973e  ba            tsx
$08:973f  cb            wai
$08:9740  ca            dex
$08:9741  58            cli
$08:9742  cb            wai
$08:9743  bb            tyx
$08:9744  cb            wai
$08:9745  bc bc bb      ldy $bbbc,x
$08:9748  bc cc 58      ldy $58cc,x
$08:974b  cc cc cc      cpy $cccc
$08:974e  ec dd ed      cpx $eddd
$08:9751  ed fe 48      sbc $48fe
$08:9754  cb            wai
$08:9755  ed ee e0      sbc $e0ee
$08:9758  01 01         ora ($01,x)
$08:975a  22 22 58 12   jsl $125822
$08:975e  22 22 32 33   jsl $333222
$08:9762  33 34         and ($34,s),y
$08:9764  33 58         and ($58,s),y
$08:9766  44 45 44      mvp $44,$45
$08:9769  44 45 54      mvp $54,$45
$08:976c  45 55         eor $55
$08:976e  58            cli
$08:976f  45 55         eor $55
$08:9771  34 55         bit $55,x
$08:9773  55 44         eor $44,x
$08:9775  45 55         eor $55
$08:9777  58            cli
$08:9778  34 54         bit $54,x
$08:977a  45 43         eor $43
$08:977c  34 33         bit $33,x
$08:977e  34 32         bit $32,x
$08:9780  48            pha
$08:9781  67 45         adc [$45]
$08:9783  54 32 23      mvn $23,$32
$08:9786  32 22         and ($22)
$08:9788  20 48 01      jsr $0148
$08:978b  0e ee fd      asl $fdee
$08:978e  dc dc db      jml [$dbdc]
$08:9791  bb            tyx
$08:9792  58            cli
$08:9793  ed dc dd      sbc $dddc
$08:9796  ed cc cc      sbc $cccc
$08:9799  cb            wai
$08:979a  cc 58 cb      cpy $cb58
$08:979d  cc cb cb      cpy $cbcb
$08:97a0  cb            wai
$08:97a1  cc cb bb      cpy $bbcb
$08:97a4  58            cli
$08:97a5  cc cc cc      cpy $cccc
$08:97a8  cc cd dc      cpy $dccd
$08:97ab  cc dd 58      cpy $58dd
$08:97ae  dc dd ed      jml [$eddd]
$08:97b1  dd ed ee      cmp $eeed,x
$08:97b4  ed ee 48      sbc $48ee
$08:97b7  cd ed ce      cmp $ceed
$08:97ba  dd fe fe      cmp $fefe,x
$08:97bd  01 00         ora ($00,x)
$08:97bf  48            pha
$08:97c0  01 21         ora ($21,x)
$08:97c2  11 32         ora ($32),y
$08:97c4  32 45         and ($45)
$08:97c6  45 55         eor $55
$08:97c8  58            cli
$08:97c9  33 23         and ($23,s),y
$08:97cb  34 34         bit $34,x
$08:97cd  34 34         bit $34,x
$08:97cf  35 45         and $45,x
$08:97d1  58            cli
$08:97d2  35 44         and $44,x
$08:97d4  45 44         eor $44
$08:97d6  45 55         eor $55
$08:97d8  55 44         eor $44,x
$08:97da  58            cli
$08:97db  45 45         eor $45
$08:97dd  44 44 44      mvp $44,$44
$08:97e0  44 44 33      mvp $33,$44
$08:97e3  58            cli
$08:97e4  44 32 33      mvp $33,$32
$08:97e7  33 32         and ($32,s),y
$08:97e9  11 22         ora ($22),y
$08:97eb  11 38         ora ($38),y
$08:97ed  55 22         eor $22,x
$08:97ef  10 0f         bpl $9800
$08:97f1  cc cb ba      cpy $bacb
$08:97f4  ba            tsx
$08:97f5  58            cli
$08:97f6  ee ee dd      inc $ddee
$08:97f9  dd dc dc      cmp $dcdc,x
$08:97fc  db            stp
$08:97fd  dd 58 cb      cmp $cb58,x
$08:9800  dc cb cb      jml [$cbcb]
$08:9803  cc cb bb      cpy $bbcb
$08:9806  cc 58 cb      cpy $cb58
$08:9809  bc cc bb      ldy $bbcc,x
$08:980c  bc cc cb      ldy $cbcc,x
$08:980f  cc 58 cb      cpy $cb58
$08:9812  dd dc cd      cmp $cddc,x
$08:9815  dc ee dd      jml [$ddee]
$08:9818  dd 48 ce      cmp $ce48,x
$08:981b  cc cd ff      cpy $ffcd
$08:981e  de 0f ff      dec $ff0f,x
$08:9821  01 48         ora ($48,x)
$08:9823  11 13         ora ($13),y
$08:9825  33 23         and ($23,s),y
$08:9827  34 44         bit $44,x
$08:9829  45 55         eor $55
$08:982b  58            cli
$08:982c  33 33         and ($33,s),y
$08:982e  33 34         and ($34,s),y
$08:9830  43 34         eor $34,s
$08:9832  43 43         eor $43,s
$08:9834  58            cli
$08:9835  34 44         bit $44,x
$08:9837  34 44         bit $44,x
$08:9839  34 43         bit $43,x
$08:983b  34 44         bit $44,x
$08:983d  58            cli
$08:983e  34 44         bit $44,x
$08:9840  34 34         bit $34,x
$08:9842  33 34         and ($34,s),y
$08:9844  43 33         eor $33,s
$08:9846  48            pha
$08:9847  67 75         adc [$75]
$08:9849  66 55         ror $55
$08:984b  55 64         eor $64,x
$08:984d  45 34         eor $34
$08:984f  48            pha
$08:9850  24 24         bit $24
$08:9852  13 11         ora ($11,s),y
$08:9854  00 11         brk #$11
$08:9856  ff fe 58 ff   sbc $ff58fe,x
$08:985a  ff fe ee de   sbc $deeefe,x
$08:985e  ed de eb      sbc $ebde
$08:9861  58            cli
$08:9862  dd dc cd      cmp $cddc,x
$08:9865  cc cd cc      cpy $cccd
$08:9868  cb            wai
$08:9869  cc 58 cb      cpy $cb58
$08:986c  dc cb bc      jml [$bccb]
$08:986f  dc bb cc      jml [$ccbb]
$08:9872  cc 58 cb      cpy $cb58
$08:9875  cc dc cb      cpy $cbdc
$08:9878  dc dc dc      jml [$dcdc]
$08:987b  dd 48 ca      cmp $ca48,x
$08:987e  ab            plb
$08:987f  cb            wai
$08:9880  cc dd dd      cpy $dddd
$08:9883  de ef 48      dec $48ef,x
$08:9886  f0 f0         beq $9878
$08:9888  10 11         bpl $989b
$08:988a  23 33         and $33,s
$08:988c  33 35         and ($35,s),y
$08:988e  58            cli
$08:988f  22 23 23 33   jsl $332323
$08:9893  33 33         and ($33,s),y
$08:9895  45 34         eor $34
$08:9897  58            cli
$08:9898  34 44         bit $44,x
$08:989a  44 44 44      mvp $44,$44
$08:989d  44 45 44      mvp $44,$45
$08:98a0  58            cli
$08:98a1  35 44         and $44,x
$08:98a3  44 43 44      mvp $44,$43
$08:98a6  43 34         eor $34,s
$08:98a8  44 58 24      mvp $24,$58
$08:98ab  24 33         bit $33
$08:98ad  14 23         trb $23
$08:98af  22 22 21 48   jsl $482122
$08:98b3  43 32         eor $32,s
$08:98b5  22 22 01 10   jsl $100122
$08:98b9  f0 ff         beq $98ba
$08:98bb  48            pha
$08:98bc  ff fe ed ec   sbc $ecedfe,x
$08:98c0  dc cc bc      jml [$bccc]
$08:98c3  bb            tyx
$08:98c4  58            cli
$08:98c5  de dd cd      dec $cddd,x
$08:98c8  dd dc dc      cmp $dcdc,x
$08:98cb  dc dc 58      jml [$58dc]
$08:98ce  cc cd cc      cpy $cccd
$08:98d1  cd cc cc      cmp $cccc
$08:98d4  dc dc 58      jml [$58dc]
$08:98d7  cc dd cc      cpy $ccdd
$08:98da  cd dd dc      cmp $dcdd
$08:98dd  dd dc 48      cmp $48dc,x
$08:98e0  bb            tyx
$08:98e1  ba            tsx
$08:98e2  bb            tyx
$08:98e3  ac cb ec      ldy $eccb
$08:98e6  db            stp
$08:98e7  dd 38 da      cmp $da38,x
$08:98ea  dc de e0      jml [$e0de]
$08:98ed  ff 11 22 44   sbc $442211,x
$08:98f1  48            pha
$08:98f2  13 24         ora ($24,s),y
$08:98f4  14 43         trb $43
$08:98f6  45 55         eor $55
$08:98f8  46 57         lsr $57
$08:98fa  58            cli
$08:98fb  34 23         bit $23,x
$08:98fd  34 43         bit $43,x
$08:98ff  34 44         bit $44,x
$08:9901  44 44 58      mvp $58,$44
$08:9904  44 53 44      mvp $44,$53
$08:9907  54 44 44      mvn $44,$44
$08:990a  44 44 58      mvp $58,$44
$08:990d  43 44         eor $44,s
$08:990f  43 33         eor $33,s
$08:9911  34 33         bit $33,x
$08:9913  23 32         and $32,s
$08:9915  48            pha
$08:9916  54 53 52      mvn $52,$53
$08:9919  33 31         and ($31,s),y
$08:991b  12 21         ora ($21)
$08:991d  00 48         brk #$48
$08:991f  00 fe         brk #$fe
$08:9921  ff ed ed ec   sbc $eceded,x
$08:9925  db            stp
$08:9926  cc 58 de      cpy $de58
$08:9929  de dd dd      dec $dddd,x
$08:992c  dc dd cc      jml [$ccdd]
$08:992f  dc 58 cc      jml [$cc58]
$08:9932  dc cc dc      jml [$dccc]
$08:9935  cc cc cd      cpy $cdcc
$08:9938  cc 58 dc      cpy $dc58
$08:993b  cd dc cd      cmp $cddc
$08:993e  dc cd ed      jml [$edcd]
$08:9941  dc 48 bb      jml [$bb48]
$08:9944  ba            tsx
$08:9945  bb            tyx
$08:9946  bb            tyx
$08:9947  cd cc cc      cmp $cccc
$08:994a  dc 38 ac      jml [$ac38]
$08:994d  9a            txs
$08:994e  dd ec f0      cmp $f0ec,x
$08:9951  0f f1 13 48   ora $4813f1
$08:9955  02 22         cop #$22
$08:9957  22 42 33 34   jsl $343342
$08:995b  54 45 58      mvn $58,$45
$08:995e  23 33         and $33,s
$08:9960  23 33         and $33,s
$08:9962  33 33         and ($33,s),y
$08:9964  44 23 58      mvp $58,$23
$08:9967  34 33         bit $33,x
$08:9969  34 43         bit $43,x
$08:996b  34 43         bit $43,x
$08:996d  33 33         and ($33,s),y
$08:996f  54 66 66      mvn $66,$66
$08:9972  66 66         ror $66
$08:9974  55 55         eor $55,x
$08:9976  55 55         eor $55,x
$08:9978  48            pha
$08:9979  55 55         eor $55,x
$08:997b  55 44         eor $44,x
$08:997d  64 35         stz $35
$08:997f  34 23         bit $23,x
$08:9981  38            sec
$08:9982  44 43 32      mvp $32,$43
$08:9985  21 1f         and ($1f,x)
$08:9987  f0 d0         beq $9959
$08:9989  cb            wai
$08:998a  48            pha
$08:998b  ed ec dc      sbc $dcec
$08:998e  cb            wai
$08:998f  bb            tyx
$08:9990  ca            dex
$08:9991  9a            txs
$08:9992  ab            plb
$08:9993  58            cli
$08:9994  cd cc cd      cmp $cdcc
$08:9997  cc cc cc      cpy $cccc
$08:999a  bc cc 58      ldy $58cc,x
$08:999d  cc cb cc      cpy $cccb
$08:99a0  cc cc cd      cpy $cdcc
$08:99a3  cc dc 48      cpy $48dc
$08:99a6  99 b9 a9      sta $a9b9,y
$08:99a9  ba            tsx
$08:99aa  bb            tyx
$08:99ab  bc ac cd      ldy $cdac,x
$08:99ae  48            pha
$08:99af  dc ec ed      jml [$edec]
$08:99b2  ed ff fe      sbc $feff
$08:99b5  0f 1f 48 10   ora $10481f
$08:99b9  10 21         bpl $99dc
$08:99bb  32 31         and ($31)
$08:99bd  43 43         eor $43,s
$08:99bf  44 58 23      mvp $23,$58
$08:99c2  22 33 22 34   jsl $342233
$08:99c6  32 34         and ($34)
$08:99c8  33 58         and ($58,s),y
$08:99ca  33 44         and ($44,s),y
$08:99cc  32 44         and ($44)
$08:99ce  33 34         and ($34,s),y
$08:99d0  33 34         and ($34,s),y
$08:99d2  48            pha
$08:99d3  76 66         ror $66,x
$08:99d5  67 66         adc [$66]
$08:99d7  47 57         eor [$57]
$08:99d9  56 56         lsr $56,x
$08:99db  48            pha
$08:99dc  55 55         eor $55,x
$08:99de  45 45         eor $45
$08:99e0  34 44         bit $44,x
$08:99e2  33 24         and ($24,s),y
$08:99e4  38            sec
$08:99e5  55 52         eor $52,x
$08:99e7  41 31         eor ($31,x)
$08:99e9  30 01         bmi $99ec
$08:99eb  0e ff 48      asl $48ff
$08:99ee  ef ed ee dd   sbc $ddeeed
$08:99f2  dc dc cb      jml [$cbdc]
$08:99f5  cb            wai
$08:99f6  48            pha
$08:99f7  cc bb aa      cpy $aabb
$08:99fa  bb            tyx
$08:99fb  ba            tsx
$08:99fc  a9 aa         lda #$aa
$08:99fe  aa            tax
$08:99ff  58            cli
$08:9a00  dd dc dd      cmp $dddc,x
$08:9a03  dd dc cd      cmp $cddc,x
$08:9a06  dc dd 58      jml [$58dd]
$08:9a09  dc dd dc      jml [$dcdd]
$08:9a0c  dc dd dd      jml [$dddd]
$08:9a0f  dc de 48      jml [$48de]
$08:9a12  a9 ab         lda #$ab
$08:9a14  cb            wai
$08:9a15  bb            tyx
$08:9a16  cc db dd      cpy $dddb
$08:9a19  ee 38 cd      inc $cd38
$08:9a1c  bf ff e0 02   lda $02e0ff,x
$08:9a20  23 33         and $33,s
$08:9a22  56 58         lsr $58,x
$08:9a24  12 22         ora ($22)
$08:9a26  13 23         ora ($23,s),y
$08:9a28  23 24         and $24,s
$08:9a2a  23 34         and $34,s
$08:9a2c  58            cli
$08:9a2d  23 44         and $44,s
$08:9a2f  33 34         and ($34,s),y
$08:9a31  44 34 43      mvp $43,$34
$08:9a34  34 58         bit $58,x
$08:9a36  43 34         eor $34,s
$08:9a38  43 33         eor $33,s
$08:9a3a  44 32 34      mvp $34,$32
$08:9a3d  32 48         and ($48)
$08:9a3f  67 55         adc [$55]
$08:9a41  65 65         adc $65
$08:9a43  44 54 35      mvp $35,$54
$08:9a46  34 38         bit $38,x
$08:9a48  66 67         ror $67
$08:9a4a  46 24         lsr $24
$08:9a4c  43 21         eor $21,s
$08:9a4e  20 0f 48      jsr $480f
$08:9a51  0f ff e0 de   ora $dee0ff
$08:9a55  de cd dd      dec $ddcd,x
$08:9a58  cc 48 bc      cpy $bc48
$08:9a5b  bc c9 bb      ldy $bbc9,x
$08:9a5e  aa            tax
$08:9a5f  ba            tsx
$08:9a60  a9 aa         lda #$aa
$08:9a62  48            pha
$08:9a63  b9 a9 a9      lda $a9a9,y
$08:9a66  b9 a9 aa      lda $aaa9,y
$08:9a69  a9 aa         lda #$aa
$08:9a6b  48            pha
$08:9a6c  aa            tax
$08:9a6d  aa            tax
$08:9a6e  9a            txs
$08:9a6f  ba            tsx
$08:9a70  aa            tax
$08:9a71  bb            tyx
$08:9a72  ba            tsx
$08:9a73  ba            tsx
$08:9a74  48            pha
$08:9a75  da            phx
$08:9a76  ca            dex
$08:9a77  db            stp
$08:9a78  cb            wai
$08:9a79  dc cc ed      jml [$edcc]
$08:9a7c  cd 38 cb      cmp $cb38
$08:9a7f  cb            wai
$08:9a80  ee ee ef      inc $efee
$08:9a83  f0 e1         beq $9a66
$08:9a85  02 48         cop #$48
$08:9a87  01 21         ora ($21,x)
$08:9a89  21 33         and ($33,x)
$08:9a8b  13 25         ora ($25,s),y
$08:9a8d  33 43         and ($43,s),y
$08:9a8f  48            pha
$08:9a90  36 45         rol $45,x
$08:9a92  45 55         eor $55
$08:9a94  56 55         lsr $55,x
$08:9a96  57 66         eor [$66],y
$08:9a98  58            cli
$08:9a99  33 34         and ($34,s),y
$08:9a9b  33 34         and ($34,s),y
$08:9a9d  33 34         and ($34,s),y
$08:9a9f  43 33         eor $33,s
$08:9aa1  48            pha
$08:9aa2  76 77         ror $77,x
$08:9aa4  75 76         adc $76,x
$08:9aa6  76 66         ror $66,x
$08:9aa8  56 56         lsr $56,x
$08:9aaa  48            pha
$08:9aab  45 55         eor $55
$08:9aad  45 34         eor $34
$08:9aaf  43 33         eor $33,s
$08:9ab1  31 22         and ($22),y
$08:9ab3  48            pha
$08:9ab4  20 11 1f      jsr $1f11
$08:9ab7  0f fe ff ed   ora $edfffe
$08:9abb  dd 48 ec      cmp $ec48,x
$08:9abe  cc cc cb      cpy $cbcc
$08:9ac1  ab            plb
$08:9ac2  ca            dex
$08:9ac3  aa            tax
$08:9ac4  b9 58 dd      lda $dd58,y
$08:9ac7  dc ec dc      jml [$dcec]
$08:9aca  dd dc dd      cmp $dddc,x
$08:9acd  dc 58 cd      jml [$cd58]
$08:9ad0  dd dc cd      cmp $cddc,x
$08:9ad3  ed dd dd      sbc $dddd
$08:9ad6  de 48 ab      dec $ab48,x
$08:9ad9  ac ab cc      ldy $ccab
$08:9adc  bb            tyx
$08:9add  bd cd cd      lda $cdcd,x
$08:9ae0  48            pha
$08:9ae1  ce ce de      dec $dece
$08:9ae4  fd ef ff      sbc $ffef,x
$08:9ae7  f0 f1         beq $9ada
$08:9ae9  48            pha
$08:9aea  00 02         brk #$02
$08:9aec  02 12         cop #$12
$08:9aee  13 23         ora ($23,s),y
$08:9af0  23 43         and $43,s
$08:9af2  48            pha
$08:9af3  44 44 36      mvp $36,$44
$08:9af6  45 45         eor $45
$08:9af8  55 46         eor $46,x
$08:9afa  55 48         eor $48,x
$08:9afc  56 65         lsr $65,x
$08:9afe  65 66         adc $66
$08:9b00  66 64         ror $64
$08:9b02  66 65         ror $65
$08:9b04  48            pha
$08:9b05  56 56         lsr $56,x
$08:9b07  56 56         lsr $56,x
$08:9b09  55 55         eor $55,x
$08:9b0b  55 55         eor $55,x
$08:9b0d  48            pha
$08:9b0e  45 54         eor $54
$08:9b10  45 44         eor $44
$08:9b12  44 33 33      mvp $33,$33
$08:9b15  34 38         bit $38,x
$08:9b17  55 54         eor $54,x
$08:9b19  45 33         eor $33
$08:9b1b  22 14 e2 ef   jsl $efe214
$08:9b1f  48            pha
$08:9b20  f0 e0         beq $9b02
$08:9b22  ee ed de      inc $deed
$08:9b25  eb            xba
$08:9b26  dc db 48      jml [$48db]
$08:9b29  cc cb ab      cpy $abcb
$08:9b2c  c9 bb         cmp #$bb
$08:9b2e  a9 ab         lda #$ab
$08:9b30  9a            txs
$08:9b31  58            cli
$08:9b32  dc dd dc      jml [$dcdd]
$08:9b35  dc dd dc      jml [$dcdd]
$08:9b38  dd dc 48      cmp $48dc,x
$08:9b3b  9a            txs
$08:9b3c  ba            tsx
$08:9b3d  9a            txs
$08:9b3e  ba            tsx
$08:9b3f  ab            plb
$08:9b40  ba            tsx
$08:9b41  ab            plb
$08:9b42  bc 48 bc      ldy $bc48,x
$08:9b45  bc cd cc      ldy $cccd,x
$08:9b48  dd ed df      cmp $dfed,x
$08:9b4b  ef 38 de e0   sbc $e0de38
$08:9b4f  f0 00         beq $9b51
$08:9b51  22 32 43 54   jsl $544332
$08:9b55  48            pha
$08:9b56  32 43         and ($43)
$08:9b58  43 45         eor $45,s
$08:9b5a  45 36         eor $36
$08:9b5c  55 46         eor $46,x
$08:9b5e  48            pha
$08:9b5f  55 56         eor $56,x
$08:9b61  66 56         ror $56
$08:9b63  66 56         ror $56
$08:9b65  67 56         adc [$56]
$08:9b67  48            pha
$08:9b68  56 66         lsr $66,x
$08:9b6a  56 56         lsr $56,x
$08:9b6c  56 55         lsr $55,x
$08:9b6e  56 54         lsr $54,x
$08:9b70  48            pha
$08:9b71  55 54         eor $54,x
$08:9b73  45 54         eor $54
$08:9b75  44 33 45      mvp $45,$33
$08:9b78  23 38         and $38,s
$08:9b7a  57 45         eor [$45],y
$08:9b7c  52 44         eor ($44)
$08:9b7e  23 14         and $14,s
$08:9b80  02 20         cop #$20
$08:9b82  48            pha
$08:9b83  00 f0         brk #$f0
$08:9b85  ff ff ee ee   sbc $eeeeff,x
$08:9b89  ed ec 48      sbc $48ec
$08:9b8c  ec dc cd      cpx $cddc
$08:9b8f  cb            wai
$08:9b90  cc cb bb      cpy $bbcb
$08:9b93  ca            dex
$08:9b94  48            pha
$08:9b95  bb            tyx
$08:9b96  ba            tsx
$08:9b97  ca            dex
$08:9b98  ba            tsx
$08:9b99  ab            plb
$08:9b9a  ba            tsx
$08:9b9b  aa            tax
$08:9b9c  ba            tsx
$08:9b9d  48            pha
$08:9b9e  ba            tsx
$08:9b9f  ba            tsx
$08:9ba0  bb            tyx
$08:9ba1  ba            tsx
$08:9ba2  ab            plb
$08:9ba3  ba            tsx
$08:9ba4  bb            tyx
$08:9ba5  cb            wai
$08:9ba6  48            pha
$08:9ba7  ca            dex
$08:9ba8  cb            wai
$08:9ba9  db            stp
$08:9baa  cb            wai
$08:9bab  dc db dc      jml [$dcdb]
$08:9bae  ec 38 ca      cpx $ca38
$08:9bb1  b9 ed ce      lda $ceed,y
$08:9bb4  cf ee 0f 0f   cmp $0f0fee
$08:9bb8  48            pha
$08:9bb9  01 20         ora ($20,x)
$08:9bbb  11 31         ora ($31),y
$08:9bbd  32 42         and ($42)
$08:9bbf  33 53         and ($53,s),y
$08:9bc1  48            pha
$08:9bc2  34 45         bit $45,x
$08:9bc4  45 55         eor $55
$08:9bc6  45 56         eor $56
$08:9bc8  64 56         stz $56
$08:9bca  48            pha
$08:9bcb  66 56         ror $56
$08:9bcd  66 56         ror $56
$08:9bcf  65 66         adc $66
$08:9bd1  65 56         adc $56
$08:9bd3  48            pha
$08:9bd4  65 65         adc $65
$08:9bd6  55 65         eor $65,x
$08:9bd8  46 64         lsr $64
$08:9bda  45 54         eor $54
$08:9bdc  48            pha
$08:9bdd  44 43 33      mvp $33,$43
$08:9be0  53 23         eor ($23,s),y
$08:9be2  22 22 31 38   jsl $383122
$08:9be6  21 30         and ($30,x)
$08:9be8  10 00         bpl $9bea
$08:9bea  ee ed ec      inc $eced
$08:9bed  cb            wai
$08:9bee  48            pha
$08:9bef  ed de dc      sbc $dcde
$08:9bf2  bd cd bb      lda $bbcd,x
$08:9bf5  cc bb 48      cpy $48bb
$08:9bf8  ba            tsx
$08:9bf9  bb            tyx
$08:9bfa  ba            tsx
$08:9bfb  bb            tyx
$08:9bfc  ba            tsx
$08:9bfd  aa            tax
$08:9bfe  ba            tsx
$08:9bff  ba            tsx
$08:9c00  48            pha
$08:9c01  bb            tyx
$08:9c02  ba            tsx
$08:9c03  bb            tyx
$08:9c04  ca            dex
$08:9c05  bb            tyx
$08:9c06  ca            dex
$08:9c07  bb            tyx
$08:9c08  cc 48 cb      cpy $cb48
$08:9c0b  cc cd cc      cpy $cccd
$08:9c0e  cd dc dd      cmp $dddc
$08:9c11  de 34 cb      dec $cb34,x
$08:9c14  cd ee e0      cmp $e0ee
$08:9c17  00 01         brk #$01
$08:9c19  23 44         and $44,s
$08:9c1b  38            sec
$08:9c1c  00 0f         brk #$0f
$08:9c1e  03 01         ora $01,s
$08:9c20  21 31         and ($31,x)
$08:9c22  35 34         and $34,x
$08:9c24  48            pha
$08:9c25  22 33 33 23   jsl $233333
$08:9c29  43 35         eor $35,s
$08:9c2b  43 44         eor $44,s
$08:9c2d  48            pha
$08:9c2e  54 44 65      mvn $65,$44
$08:9c31  44 55 55      mvp $55,$55
$08:9c34  45 65         eor $65
$08:9c36  48            pha
$08:9c37  45 55         eor $55
$08:9c39  54 55 64      mvn $64,$55
$08:9c3c  35 55         and $55,x
$08:9c3e  35 48         and $48,x
$08:9c40  54 44 43      mvn $43,$44
$08:9c43  44 43 33      mvp $33,$43
$08:9c46  33 33         and ($33,s),y
$08:9c48  38            sec
$08:9c49  44 54 24      mvp $24,$54
$08:9c4c  33 20         and ($20,s),y
$08:9c4e  31 10         and ($10),y
$08:9c50  00 38         brk #$38
$08:9c52  f0 df         beq $9c33
$08:9c54  ec ec da      cpx $daec
$08:9c57  db            stp
$08:9c58  bc 99 48      ldy $4899,x
$08:9c5b  dd dc bd      cmp $bddc,x
$08:9c5e  db            stp
$08:9c5f  bc cb bc      ldy $bccb,x
$08:9c62  bb            tyx
$08:9c63  48            pha
$08:9c64  ca            dex
$08:9c65  bb            tyx
$08:9c66  ba            tsx
$08:9c67  bb            tyx
$08:9c68  ab            plb
$08:9c69  ba            tsx
$08:9c6a  aa            tax
$08:9c6b  cb            wai
$08:9c6c  48            pha
$08:9c6d  ba            tsx
$08:9c6e  bb            tyx
$08:9c6f  bb            tyx
$08:9c70  bb            tyx
$08:9c71  bc bb cc      ldy $ccbb,x
$08:9c74  cb            wai
$08:9c75  48            pha
$08:9c76  cc cd ec      cpy $eccd
$08:9c79  dd dd fd      cmp $fddd,x
$08:9c7c  fe fe 28      inc $28fe,x
$08:9c7f  dc dd 00      jml [$00dd]
$08:9c82  e2 12         sep #$12
$08:9c84  23 46         and $46,s
$08:9c86  75 48         adc $48,x
$08:9c88  22 23 22 33   jsl $332223
$08:9c8c  42 33         wdm #$33
$08:9c8e  44 34 48      mvp $48,$34
$08:9c91  44 34 44      mvp $44,$34
$08:9c94  44 45 34      mvp $34,$45
$08:9c97  45 44         eor $44
$08:9c99  48            pha
$08:9c9a  45 44         eor $44
$08:9c9c  45 43         eor $43
$08:9c9e  45 43         eor $43
$08:9ca0  45 33         eor $33
$08:9ca2  48            pha
$08:9ca3  44 34 43      mvp $43,$34
$08:9ca6  33 43         and ($43,s),y
$08:9ca8  42 33         wdm #$33
$08:9caa  32 38         and ($38)
$08:9cac  66 44         ror $44
$08:9cae  45 24         eor $24
$08:9cb0  43 22         eor $22,s
$08:9cb2  32 21         and ($21)
$08:9cb4  38            sec
$08:9cb5  11 2f         ora ($2f),y
$08:9cb7  00 ff         brk #$ff
$08:9cb9  fd 0d ed      sbc $ed0d,x
$08:9cbc  cd 48 ee      cmp $ee48
$08:9cbf  ee ed ce      inc $ceed
$08:9cc2  ec ce dc      cpx $dcce
$08:9cc5  cc 48 dc      cpy $dc48
$08:9cc8  cc dc bb      cpy $bbdc
$08:9ccb  dc cb cc      jml [$cccb]
$08:9cce  cc 48 bc      cpy $bc48
$08:9cd1  cc cc cb      cpy $cbcc
$08:9cd4  cc dc cc      cpy $ccdc
$08:9cd7  cc 48 cd      cpy $cd48
$08:9cda  dc cd cd      jml [$cdcd]
$08:9cdd  dd dc de      cmp $dedc,x
$08:9ce0  ed 38 9d      sbc $9d38
$08:9ce3  bb            tyx
$08:9ce4  bd dd cd      lda $cddd,x
$08:9ce7  de 0d e0      dec $e00d,x
$08:9cea  38            sec
$08:9ceb  f0 01         beq $9cee
$08:9ced  11 21         ora ($21),y
$08:9cef  41 43         eor ($43,x)
$08:9cf1  43 55         eor $55,s
$08:9cf3  48            pha
$08:9cf4  32 33         and ($33)
$08:9cf6  33 33         and ($33,s),y
$08:9cf8  44 43 44      mvp $44,$43
$08:9cfb  44 48 44      mvp $44,$48
$08:9cfe  55 34         eor $34,x
$08:9d00  46 44         lsr $44
$08:9d02  45 44         eor $44
$08:9d04  44 48 45      mvp $45,$48
$08:9d07  44 44 34      mvp $34,$44
$08:9d0a  44 24 33      mvp $33,$24
$08:9d0d  34 34         bit $34,x
$08:9d0f  66 33         ror $33
$08:9d11  33 22         and ($22,s),y
$08:9d13  21 f0         and ($f0,x)
$08:9d15  ff ee 28 16   sbc $1628ee,x
$08:9d19  32 04         and ($04)
$08:9d1b  01 00         ora ($00,x)
$08:9d1d  cf fc dc 38   cmp $38dcfc
$08:9d21  ed dd eb      sbc $ebdd
$08:9d24  dc cb ca      jml [$cacb]
$08:9d27  cb            wai
$08:9d28  9b            txy
$08:9d29  48            pha
$08:9d2a  ec cd ed      cpx $edcd
$08:9d2d  cc dd cc      cpy $ccdd
$08:9d30  dc dc 48      jml [$48dc]
$08:9d33  cc dd cc      cpy $ccdd
$08:9d36  cd dc dd      cmp $dddc
$08:9d39  cc dd 38      cpy $38dd
$08:9d3c  aa            tax
$08:9d3d  99 ab a9      sta $a9ab,y
$08:9d40  aa            tax
$08:9d41  bc ab bc      ldy $bcab,x
$08:9d44  38            sec
$08:9d45  ad bb cc      lda $ccbb
$08:9d48  dc dd dd      jml [$dddd]
$08:9d4b  ed ef 28      sbc $28ef
$08:9d4e  bc ef f0      ldy $f0ef,x
$08:9d51  e0 02         cpx #$02
$08:9d53  14 04         trb $04
$08:9d55  43 38         eor $38,s
$08:9d57  23 23         and $23,s
$08:9d59  33 43         and ($43,s),y
$08:9d5b  44 54 45      mvp $45,$54
$08:9d5e  65 38         adc $38
$08:9d60  46 56         lsr $56
$08:9d62  56 56         lsr $56,x
$08:9d64  66 66         ror $66
$08:9d66  76 67         ror $67,x
$08:9d68  48            pha
$08:9d69  33 34         and ($34,s),y
$08:9d6b  33 34         and ($34,s),y
$08:9d6d  33 33         and ($33,s),y
$08:9d6f  34 33         bit $33,x
$08:9d71  38            sec
$08:9d72  77 66         adc [$66],y
$08:9d74  57 56         eor [$56],y
$08:9d76  56 46         lsr $46,x
$08:9d78  56 44         lsr $44,x
$08:9d7a  38            sec
$08:9d7b  45 43         eor $43
$08:9d7d  43 22         eor $22,s
$08:9d7f  42 21         wdm #$21
$08:9d81  11 11         ora ($11),y
$08:9d83  38            sec
$08:9d84  00 0f         brk #$0f
$08:9d86  0d fd fe      ora $fefd
$08:9d89  de cd cc      dec $cccd,x
$08:9d8c  48            pha
$08:9d8d  ee ed de      inc $deed
$08:9d90  ed dd dc      sbc $dcdd
$08:9d93  dd ec 48      cmp $48ec,x
$08:9d96  cd dd cd      cmp $cddd
$08:9d99  cd cd dd      cmp $ddcd
$08:9d9c  cc dd 38      cpy $38dd
$08:9d9f  ba            tsx
$08:9da0  a9 b9         lda #$b9
$08:9da2  aa            tax
$08:9da3  bb            tyx
$08:9da4  ab            plb
$08:9da5  ab            plb
$08:9da6  c9 38         cmp #$38
$08:9da8  cb            wai
$08:9da9  cb            wai
$08:9daa  bc dc cc      ldy $ccdc,x
$08:9dad  dd ec de      cmp $deec,x
$08:9db0  28            plp
$08:9db1  cb            wai
$08:9db2  ce cd ef      dec $efcd
$08:9db5  c2 e0         rep #$e0
$08:9db7  10 11         bpl $9dca
$08:9db9  38            sec
$08:9dba  20 21 23      jsr $2321
$08:9dbd  22 24 24 34   jsl $342424
$08:9dc1  35 38         and $38,x
$08:9dc3  34 54         bit $54,x
$08:9dc5  45 54         eor $54
$08:9dc7  45 65         eor $65
$08:9dc9  55 54         eor $54,x
$08:9dcb  38            sec
$08:9dcc  64 56         stz $56
$08:9dce  54 56 45      mvn $45,$56
$08:9dd1  55 55         eor $55,x
$08:9dd3  45 38         eor $38
$08:9dd5  54 45 53      mvn $53,$45
$08:9dd8  45 54         eor $54
$08:9dda  35 44         and $44,x
$08:9ddc  35 38         and $38,x
$08:9dde  34 34         bit $34,x
$08:9de0  42 33         wdm #$33
$08:9de2  34 22         bit $22,x
$08:9de4  23 12         and $12,s
$08:9de6  28            plp
$08:9de7  64 12         stz $12
$08:9de9  32 10         and ($10)
$08:9deb  2f 00 f0 de   and $def000
$08:9def  38            sec
$08:9df0  fe ef fc      inc $fcef,x
$08:9df3  ed ec cd      sbc $cdec
$08:9df6  dc cc 38      jml [$38cc]
$08:9df9  bc cb cb      ldy $cbcb,x
$08:9dfc  ba            tsx
$08:9dfd  cb            wai
$08:9dfe  aa            tax
$08:9dff  bb            tyx
$08:9e00  ab            plb
$08:9e01  38            sec
$08:9e02  ba            tsx
$08:9e03  aa            tax
$08:9e04  bb            tyx
$08:9e05  b9 bb ba      lda $babb,y
$08:9e08  bb            tyx
$08:9e09  bb            tyx
$08:9e0a  38            sec
$08:9e0b  bb            tyx
$08:9e0c  ac cc bb      ldy $bbcc
$08:9e0f  bd cc cc      lda $cccc,x
$08:9e12  cd 38 ec      cmp $ec38
$08:9e15  dc fd ec      jml [$ecfd]
$08:9e18  ef ee ff e1   sbc $e1ffee
$08:9e1c  28            plp
$08:9e1d  ee 0f 02      inc $020f
$08:9e20  02 12         cop #$12
$08:9e22  32 35         and ($35)
$08:9e24  33 38         and ($38,s),y
$08:9e26  33 22         and ($22,s),y
$08:9e28  33 43         and ($43,s),y
$08:9e2a  43 44         eor $44,s
$08:9e2c  44 44 38      mvp $38,$44
$08:9e2f  45 54         eor $54
$08:9e31  45 55         eor $55
$08:9e33  44 55 54      mvp $54,$55
$08:9e36  55 38         eor $38,x
$08:9e38  35 55         and $55,x
$08:9e3a  43 54         eor $54,s
$08:9e3c  44 44 44      mvp $44,$44
$08:9e3f  34 38         bit $38,x
$08:9e41  34 32         bit $32,x
$08:9e43  43 32         eor $32,s
$08:9e45  32 32         and ($32)
$08:9e47  23 21         and $21,s
$08:9e49  28            plp
$08:9e4a  24 42         bit $42
$08:9e4c  24 10         bit $10
$08:9e4e  13 f1         ora ($f1,s),y
$08:9e50  f1 0e         sbc ($0e),y
$08:9e52  28            plp
$08:9e53  0e fe ec      asl $ecfe
$08:9e56  df cb eb bb   cmp $bbebcb,x
$08:9e5a  ea            nop
$08:9e5b  38            sec
$08:9e5c  dd ee cd      cmp $cdee,x
$08:9e5f  ce dd cc      dec $ccdd
$08:9e62  cd dc 38      cmp $38dc
$08:9e65  cc cd dc      cpy $dccd
$08:9e68  cc dc cc      cpy $ccdc
$08:9e6b  dc cc 38      jml [$38cc]
$08:9e6e  dc cc dd      jml [$ddcc]
$08:9e71  cc cd dc      cpy $dccd
$08:9e74  dc dd 38      jml [$38dd]
$08:9e77  dc dd ed      jml [$eddd]
$08:9e7a  dd de de      cmp $dede,x
$08:9e7d  ee ed 28      inc $28ed
$08:9e80  dc ed df      jml [$dfed]
$08:9e83  ee e0 e0      inc $e0e0
$08:9e86  00 1f         brk #$1f
$08:9e88  28            plp
$08:9e89  21 12         and ($12,x)
$08:9e8b  31 33         and ($33),y
$08:9e8d  26 33         rol $33
$08:9e8f  46 55         lsr $55
$08:9e91  38            sec
$08:9e92  23 33         and $33,s
$08:9e94  33 34         and ($34,s),y
$08:9e96  24 34         bit $34
$08:9e98  34 34         bit $34,x
$08:9e9a  38            sec
$08:9e9b  43 35         eor $35,s
$08:9e9d  34 34         bit $34,x
$08:9e9f  34 34         bit $34,x
$08:9ea1  34 34         bit $34,x
$08:9ea3  28            plp
$08:9ea4  67 57         adc [$57]
$08:9ea6  57 56         eor [$56],y
$08:9ea8  56 65         lsr $65,x
$08:9eaa  64 55         stz $55
$08:9eac  28            plp
$08:9ead  55 34         eor $34,x
$08:9eaf  44 34 23      mvp $23,$34
$08:9eb2  32 31         and ($31)
$08:9eb4  31 18         and ($18),y
$08:9eb6  42 04         wdm #$04
$08:9eb8  00 00         brk #$00
$08:9eba  e0 ec         cpx #$ec
$08:9ebc  ce ab 28      dec $28ab
$08:9ebf  ec dc cd      cpx $cddc
$08:9ec2  bb            tyx
$08:9ec3  ba            tsx
$08:9ec4  da            phx
$08:9ec5  a9 bb 38      lda #$38bb
$08:9ec8  dc dc dd      jml [$dddc]
$08:9ecb  dc dd cc      jml [$ccdd]
$08:9ece  dd dc 38      cmp $38dc,x
$08:9ed1  dd dc dd      cmp $dddc,x
$08:9ed4  dd de dc      cmp $dcde,x
$08:9ed7  ee dd 28      inc $28dd
$08:9eda  bb            tyx
$08:9edb  cc cb cc      cpy $cccb
$08:9ede  bd dd be      lda $bedd,x
$08:9ee1  dd 18 9b      cmp $9b18,x
$08:9ee4  bc da dc      ldy $dcda,x
$08:9ee7  dd de ec      cmp $ecde,x
$08:9eea  10 18         bpl $9f04
$08:9eec  e0 f0         cpx #$f0
$08:9eee  01 13         ora ($13,x)
$08:9ef0  12 23         ora ($23)
$08:9ef2  34 25         bit $25,x
$08:9ef4  28            plp
$08:9ef5  33 13         and ($13,s),y
$08:9ef7  34 34         bit $34,x
$08:9ef9  24 53         bit $53
$08:9efb  53 45         eor ($45,s),y
$08:9efd  28            plp
$08:9efe  53 55         eor ($55,s),y
$08:9f00  45 55         eor $55
$08:9f02  46 45         lsr $45
$08:9f04  54 56 28      mvn $28,$56
$08:9f07  45 45         eor $45
$08:9f09  55 54         eor $54,x
$08:9f0b  45 54         eor $54
$08:9f0d  45 44         eor $44
$08:9f0f  28            plp
$08:9f10  44 34 34      mvp $34,$34
$08:9f13  43 34         eor $34,s
$08:9f15  23 33         and $33,s
$08:9f17  23 18         and $18,s
$08:9f19  34 54         bit $54,x
$08:9f1b  14 31         trb $31
$08:9f1d  32 03         and ($03)
$08:9f1f  00 2f         brk #$2f
$08:9f21  18            clc
$08:9f22  ff 1c fd 0c   sbc $0cfd1c,x
$08:9f26  bd ba db      lda $dbba,x
$08:9f29  aa            tax
$08:9f2a  28            plp
$08:9f2b  dc dd cb      jml [$cbdd]
$08:9f2e  dd cb cb      cmp $cbcb,x
$08:9f31  cb            wai
$08:9f32  cb            wai
$08:9f33  28            plp
$08:9f34  cb            wai
$08:9f35  bb            tyx
$08:9f36  ba            tsx
$08:9f37  db            stp
$08:9f38  bb            tyx
$08:9f39  bb            tyx
$08:9f3a  bc bc 28      ldy $28bc,x
$08:9f3d  ca            dex
$08:9f3e  bc cc cc      ldy $cccc,x
$08:9f41  bc db cd      ldy $cddb,x
$08:9f44  dc 28 dc      jml [$dc28]
$08:9f47  cd ed dd      cmp $dded
$08:9f4a  de ee fe      dec $feee,x
$08:9f4d  ee 18 fc      inc $fc18
$08:9f50  e0 fe         cpx #$fe
$08:9f52  0f f1 00 02   ora $0200f1
$08:9f56  12 28         ora ($28)
$08:9f58  21 02         and ($02,x)
$08:9f5a  23 12         and $12,s
$08:9f5c  23 23         and $23,s
$08:9f5e  33 23         and ($23,s),y
$08:9f60  28            plp
$08:9f61  34 42         bit $42,x
$08:9f63  35 33         and $33,x
$08:9f65  44 33 44      mvp $44,$33
$08:9f68  43 28         eor $28,s
$08:9f6a  34 44         bit $44,x
$08:9f6c  24 34         bit $34
$08:9f6e  33 34         and ($34,s),y
$08:9f70  33 33         and ($33,s),y
$08:9f72  28            plp
$08:9f73  33 23         and ($23,s),y
$08:9f75  24 22         bit $22
$08:9f77  32 23         and ($23)
$08:9f79  21 23         and ($23,x)
$08:9f7b  14 52         trb $52
$08:9f7d  22 31 00 00   jsl $000031
$08:9f81  00 ee         brk #$ee
$08:9f83  de 18 01      dec $0118,x
$08:9f86  00 1f         brk #$1f
$08:9f88  00 0f         brk #$0f
$08:9f8a  df e0 ce 18   cmp $18cee0,x
$08:9f8e  de dd cd      dec $cddd,x
$08:9f91  ad cc bb      lda $bbcc
$08:9f94  bb            tyx
$08:9f95  bb            tyx
$08:9f96  28            plp
$08:9f97  dd ed dc      cmp $dced,x
$08:9f9a  ec ec ec      cpx $ecec
$08:9f9d  ed cd 28      sbc $28cd
$08:9fa0  dd ce dd      cmp $ddce,x
$08:9fa3  dd ec dd      cmp $ddec,x
$08:9fa6  fc ee 18      jsr ($18ee,x)
$08:9fa9  ab            plb
$08:9faa  ad ac cc      lda $ccac
$08:9fad  bd cc cc      lda $cccc,x
$08:9fb0  dc 14 cd      jml [$cd14]
$08:9fb3  ed ee ef      sbc $efee
$08:9fb6  00 00         brk #$00
$08:9fb8  12 32         ora ($32)
$08:9fba  18            clc
$08:9fbb  01 00         ora ($00,x)
$08:9fbd  f0 01         beq $9fc0
$08:9fbf  10 12         bpl $9fd3
$08:9fc1  23 03         and $03,s
$08:9fc3  18            clc
$08:9fc4  22 43 33 44   jsl $443343
$08:9fc8  34 36         bit $36,x
$08:9fca  44 45 18      mvp $18,$45
$08:9fcd  46 54         lsr $54
$08:9fcf  65 56         adc $56
$08:9fd1  45 57         eor $57
$08:9fd3  54 55 18      mvn $18,$55
$08:9fd6  54 56 45      mvn $45,$56
$08:9fd9  44 55 34      mvp $34,$55
$08:9fdc  44 44 18      mvp $18,$44
$08:9fdf  35 24         and $24,x
$08:9fe1  14 33         trb $33
$08:9fe3  13 32         ora ($32,s),y
$08:9fe5  22 11 08 33   jsl $330811
$08:9fe9  40            rti
$08:9fea  21 30         and ($30,x)
$08:9fec  01 0f         ora ($0f,x)
$08:9fee  0f 0e 18 ff   ora $ff180e
$08:9ff2  fe fe df      inc $dffe,x
$08:9ff5  fe dc ed      inc $eddc,x
$08:9ff8  fc 18 cd      jsr ($cd18,x)
$08:9ffb  de cc bd      dec $bdcc,x
$08:9ffe  cd cd db      cmp $dbcd
$08:a001  db            stp
$08:a002  18            clc
$08:a003  ce cc cd      dec $cdcc
$08:a006  bc dc cc      ldy $ccdc,x
$08:a009  dd cc 18      cmp $18cc,x
$08:a00c  ec dc dd      cpx $dddc
$08:a00f  dd ed de      cmp $deed,x
$08:a012  de ce 04      dec $04ce,x
$08:a015  cc cd cd      cpy $cdcd
$08:a018  cd de ee      cmp $eede
$08:a01b  f0 e0         beq $9ffd
$08:a01d  08            php
$08:a01e  d0 ff         bne $a01f
$08:a020  e0 0f         cpx #$0f
$08:a022  ff 00 00 02   sbc $020000,x
$08:a026  08            php
$08:a027  10 32         bpl $a05b
$08:a029  20 52 23      jsr $2352
$08:a02c  25 33         and $33
$08:a02e  42 08         wdm #$08
$08:a030  44 65 44      mvp $44,$65
$08:a033  54 55 54      mvn $54,$55
$08:a036  64 55         stz $55
$08:a038  08            php
$08:a039  46 36         lsr $36
$08:a03b  45 46         eor $46
$08:a03d  54 53 65      mvn $65,$53
$08:a040  45 08         eor $08
$08:a042  55 42         eor $42,x
$08:a044  54 53 52      mvn $52,$53
$08:a047  45 44         eor $44
$08:a049  22 04 43 43   jsl $434304
$08:a04d  23 12         and $12,s
$08:a04f  00 10         brk #$10
$08:a051  00 ee         brk #$ee
$08:a053  08            php
$08:a054  00 01         brk #$01
$08:a056  02 00         cop #$00
$08:a058  e0 ee         cpx #$ee
$08:a05a  0e ee 08      asl $08ee
$08:a05d  fe df bd      inc $bddf,x
$08:a060  ee bc dd      inc $ddbc
$08:a063  cb            wai
$08:a064  da            phx
$08:a065  18            clc
$08:a066  ee ee de      inc $deee
$08:a069  de ee dd      dec $ddee,x
$08:a06c  fe dc 08      inc $08dc,x
$08:a06f  ec cc cc      cpx $cccc
$08:a072  cc db dc      cpy $dcdb
$08:a075  be ce 04      ldx $04ce,y
$08:a078  bd bd dd      lda $ddbd,x
$08:a07b  ed dd df      sbc $dfdd
$08:a07e  ee ff 04      inc $04ff
$08:a081  00 00         brk #$00
$08:a083  00 00         brk #$00
$08:a085  11 13         ora ($13),y
$08:a087  33 34         and ($34,s),y
$08:a089  08            php
$08:a08a  00 01         brk #$01
$08:a08c  01 00         ora ($00,x)
$08:a08e  01 21         ora ($21,x)
$08:a090  12 02         ora ($02)
$08:a092  08            php
$08:a093  22 22 12 22   jsl $221222
$08:a097  23 32         and $32,s
$08:a099  32 32         and ($32)
$08:a09b  14 34         trb $34
$08:a09d  34 23         bit $23,x
$08:a09f  23 23         and $23,s
$08:a0a1  22 23 22 04   jsl $042223
$08:a0a5  32 33         and ($33)
$08:a0a7  33 32         and ($32,s),y
$08:a0a9  22 22 22 21   jsl $212222
$08:a0ad  04 11         tsb $11
$08:a0af  21 12         and ($12,x)
$08:a0b1  11 00         ora ($00),y
$08:a0b3  10 01         bpl $a0b6
$08:a0b5  00 04         brk #$04
$08:a0b7  00 00         brk #$00
$08:a0b9  00 00         brk #$00
$08:a0bb  0f fe ff fd   ora $fdfffe
$08:a0bf  04 ed         tsb $ed
$08:a0c1  dd dc cc      cmp $ccdc,x
$08:a0c4  cc cb bc      cpy $bccb
$08:a0c7  cc 04 bb      cpy $bb04
$08:a0ca  bb            tyx
$08:a0cb  bb            tyx
$08:a0cc  cb            wai
$08:a0cd  cb            wai
$08:a0ce  bb            tyx
$08:a0cf  bb            tyx
$08:a0d0  cc 04 bc      cpy $bc04
$08:a0d3  cc cc dc      cpy $dccc
$08:a0d6  cd dc dd      cmp $dddc
$08:a0d9  cd 04 dd      cmp $dd04
$08:a0dc  ed ee ee      sbc $eeee
$08:a0df  df ee ee fe   cmp $feeeee,x
$08:a0e3  04 ef         tsb $ef
$08:a0e5  ff 00 f0 0f   sbc $0ff000,x
$08:a0e9  00 00         brk #$00
$08:a0eb  00 04         brk #$04
$08:a0ed  00 00         brk #$00
$08:a0ef  00 21         brk #$21
$08:a0f1  11 11         ora ($11),y
$08:a0f3  22 23 04 22   jsl $220423
$08:a0f7  23 33         and $33,s
$08:a0f9  33 23         and ($23,s),y
$08:a0fb  23 33         and $33,s
$08:a0fd  33 04         and ($04,s),y
$08:a0ff  23 32         and $32,s
$08:a101  32 23         and ($23)
$08:a103  22 22 21 22   jsl $222122
$08:a107  04 12         tsb $12
$08:a109  12 12         ora ($12)
$08:a10b  12 12         ora ($12)
$08:a10d  11 21         ora ($21),y
$08:a10f  10 04         bpl $a115
$08:a111  00 10         brk #$10
$08:a113  01 00         ora ($00,x)
$08:a115  10 00         bpl $a117
$08:a117  01 00         ora ($00,x)
$08:a119  04 00         tsb $00
$08:a11b  00 00         brk #$00
$08:a11d  00 00         brk #$00
$08:a11f  00 00         brk #$00
$08:a121  00 04         brk #$04
$08:a123  00 00         brk #$00
$08:a125  00 ef         brk #$ef
$08:a127  ff ff ff f0   sbc $f0ffff,x
$08:a12b  04 ff         tsb $ff
$08:a12d  ff fe ef ef   sbc $efeffe,x
$08:a131  ef ef ff 04   sbc $04ffef
$08:a135  ff ff ff ff   sbc $ffffff,x
$08:a139  0f f0 ff 0f   ora $0ffff0
$08:a13d  04 f0         tsb $f0
$08:a13f  f0 f0         beq $a131
$08:a141  00 00         brk #$00
$08:a143  00 00         brk #$00
$08:a145  00 04         brk #$04
$08:a147  00 00         brk #$00
$08:a149  00 00         brk #$00
$08:a14b  00 00         brk #$00
$08:a14d  00 00         brk #$00
$08:a14f  10 de         bpl $a12f
$08:a151  ee ef ff      inc $ffef
$08:a154  ff f0 00 00   sbc $0000f0,x
$08:a158  00 00         brk #$00
$08:a15a  01 00         ora ($00,x)
$08:a15c  00 00         brk #$00
$08:a15e  11 01         ora ($01),y
$08:a160  11 00         ora ($00),y
$08:a162  22 22 33 33   jsl $333322
$08:a166  34 44         bit $44,x
$08:a168  44 44 00      mvp $00,$44
$08:a16b  44 44 44      mvp $44,$44
$08:a16e  44 44 44      mvp $44,$44
$08:a171  33 33         and ($33,s),y
$08:a173  00 33         brk #$33
$08:a175  32 22         and ($22)
$08:a177  22 21 11 11   jsl $111121
$08:a17b  11 00         ora ($00),y
$08:a17d  00 00         brk #$00
$08:a17f  00 00         brk #$00
$08:a181  00 00         brk #$00
$08:a183  00 00         brk #$00
$08:a185  00 00         brk #$00
$08:a187  00 00         brk #$00
$08:a189  00 00         brk #$00
$08:a18b  00 00         brk #$00
$08:a18d  00 00         brk #$00
$08:a18f  00 00         brk #$00
$08:a191  00 00         brk #$00
$08:a193  00 00         brk #$00
$08:a195  00 00         brk #$00
$08:a197  00 00         brk #$00
$08:a199  00 00         brk #$00
$08:a19b  00 00         brk #$00
$08:a19d  00 00         brk #$00
$08:a19f  00 00         brk #$00
$08:a1a1  00 00         brk #$00
$08:a1a3  00 00         brk #$00
$08:a1a5  00 00         brk #$00
$08:a1a7  00 00         brk #$00
$08:a1a9  01 00         ora ($00,x)
$08:a1ab  00 00         brk #$00
$08:a1ad  00 00         brk #$00
$08:a1af  00 00         brk #$00
$08:a1b1  00 65         brk #$65
$08:a1b3  04 00         tsb $00
$08:a1b5  00 00         brk #$00
$08:a1b7  00 00         brk #$00
$08:a1b9  00 00         brk #$00
$08:a1bb  00 00         brk #$00
$08:a1bd  88            dey
$08:a1be  01 1f         ora ($1f,x)
$08:a1c0  1d 32 f0      ora $f032,x
$08:a1c3  f2 e4         sbc ($e4)
$08:a1c5  5e 98 f2      lsr $f298,x
$08:a1c8  f5 ee         sbc $ee,x
$08:a1ca  30 f1         bmi $a1bd
$08:a1cc  31 0f         and ($0f),y
$08:a1ce  10 a4         bpl $a174
$08:a1d0  22 10 01 03   jsl $030110
$08:a1d4  e6 d1         inc $d1
$08:a1d6  5c 15 b8 d1   jml $d1b815
$08:a1da  1f 01 12 fe   ora $fe1201,x
$08:a1de  e1 53         sbc ($53,x)
$08:a1e0  fd a8 9d      sbc $9da8,x
$08:a1e3  64 10         stz $10
$08:a1e5  10 fe         bpl $a1e5
$08:a1e7  12 e1         ora ($e1)
$08:a1e9  1f 98 d2 01   ora $01d298,x
$08:a1ed  0f de 11 1e   ora $1e11de
$08:a1f1  c2 1c         rep #$1c
$08:a1f3  a4 df         ldy $df
$08:a1f5  ea            nop
$08:a1f6  01 dd         ora ($dd,x)
$08:a1f8  e0 0c cc      cpx #$cc0c
$08:a1fb  d0 a4         bne $a1a1
$08:a1fd  1e cc de      asl $decc,x
$08:a200  ee ee ee      inc $eeee
$08:a203  ee ee 88      inc $88ee
$08:a206  dc cc cc      jml [$cccc]
$08:a209  cd cc cc      cmp $cccc
$08:a20c  cc dc 88      cpy $88dc
$08:a20f  cc dc cc      cpy $ccdc
$08:a212  cc cd cc      cpy $cccd
$08:a215  cd cc 88      cmp $88cc
$08:a218  cc cd dc      cpy $dccd
$08:a21b  bc dc cc      ldy $ccdc,x
$08:a21e  dc dc 94      jml [$94dc]
$08:a221  cc 02 ec      cpy $ec02
$08:a224  cf 00 fd ef   cmp $effd00
$08:a228  e0 88 41      cpx #$4188
$08:a22b  a9 cc 23      lda #$23cc
$08:a22e  f0 f0         beq $a220
$08:a230  20 ec 88      jsr $88ec
$08:a233  01 40         ora ($40,x)
$08:a235  a1 52         lda ($52,x)
$08:a237  30 e2         bmi $a21b
$08:a239  12 61         ora ($61)
$08:a23b  88            dey
$08:a23c  f1 03         sbc ($03),y
$08:a23e  42 13         wdm #$13
$08:a240  43 32         eor $32,s
$08:a242  22 24 88 33   jsl $338824
$08:a246  34 51         bit $51,x
$08:a248  15 52         ora $52,x
$08:a24a  35 44         and $44,x
$08:a24c  33 88         and ($88,s),y
$08:a24e  14 64         trb $64
$08:a250  34 25         bit $25,x
$08:a252  34 44         bit $44,x
$08:a254  34 44         bit $44,x
$08:a256  88            dey
$08:a257  34 44         bit $44,x
$08:a259  34 43         bit $43,x
$08:a25b  44 43 44      mvp $44,$43
$08:a25e  43 88         eor $88,s
$08:a260  44 33 45      mvp $45,$33
$08:a263  43 34         eor $34,s
$08:a265  43 44         eor $44,s
$08:a267  43 88         eor $88,s
$08:a269  43 44         eor $44,s
$08:a26b  43 34         eor $34,s
$08:a26d  44 34 43      mvp $43,$34
$08:a270  34 88         bit $88,x
$08:a272  44 34 33      mvp $33,$34
$08:a275  44 23 53      mvp $53,$23
$08:a278  33 24         and ($24,s),y
$08:a27a  88            dey
$08:a27b  42 34         wdm #$34
$08:a27d  33 13         and ($13,s),y
$08:a27f  53 11         eor ($11,s),y
$08:a281  34 33         bit $33,x
$08:a283  78            sei
$08:a284  61 36         adc ($36,x)
$08:a286  55 44         eor $44,x
$08:a288  33 44         and ($44,s),y
$08:a28a  75 22         adc $22,x
$08:a28c  74 23         stz $23,x
$08:a28e  33 42         and ($42,s),y
$08:a290  25 24         and $24
$08:a292  30 00         bmi $a294
$08:a294  10 74         bpl $a30a
$08:a296  e0 21 fd      cpx #$fd21
$08:a299  d1 2f         cmp ($2f),y
$08:a29b  dc ee cf      jml [$cfee]
$08:a29e  68            pla
$08:a29f  39 d1 24      and $24d1,y
$08:a2a2  de aa f1      dec $f1aa,x
$08:a2a5  21 ea         and ($ea,x)
$08:a2a7  78            sei
$08:a2a8  e0 cd 2d      cpx #$2dcd
$08:a2ab  ad 12 fd      lda $fd12
$08:a2ae  fa            plx
$08:a2af  df 78 cc dd   cmp $ddcc78,x
$08:a2b3  fe db df      inc $dfdb,x
$08:a2b6  db            stp
$08:a2b7  cd dd 78      cmp $78dd
$08:a2ba  dd cd bb      cmp $bbcd,x
$08:a2bd  be eb cc      ldx $cceb,y
$08:a2c0  bc cc 78      ldy $78cc,x
$08:a2c3  ca            dex
$08:a2c4  be db bc      ldx $bcdb,y
$08:a2c7  cb            wai
$08:a2c8  bc cb bc      ldy $bccb,x
$08:a2cb  78            sei
$08:a2cc  cb            wai
$08:a2cd  aa            tax
$08:a2ce  cc ed 9b      cpy $9bed
$08:a2d1  ca            dex
$08:a2d2  bc 9a 78      ldy $789a,x
$08:a2d5  dd bb cc      cmp $ccbb,x
$08:a2d8  aa            tax
$08:a2d9  bc cb bb      ldy $bbcb,x
$08:a2dc  bc 78 aa      ldy $aa78,x
$08:a2df  cc cb cc      cpy $cccb
$08:a2e2  ab            plb
$08:a2e3  cc bb bc      cpy $bcbb
$08:a2e6  78            sei
$08:a2e7  bc cb bb      ldy $bbcb,x
$08:a2ea  cc db bb      cpy $bbdb
$08:a2ed  db            stp
$08:a2ee  db            stp
$08:a2ef  78            sei
$08:a2f0  ad db bc      lda $bcdb
$08:a2f3  cc cb bc      cpy $bccb
$08:a2f6  dc cc 78      jml [$78cc]
$08:a2f9  cc cb cd      cpy $cdcb
$08:a2fc  db            stp
$08:a2fd  ac dc dd      ldy $dddc
$08:a300  cc 78 dc      cpy $dc78
$08:a303  cb            wai
$08:a304  cc dd cd      cpy $cddd
$08:a307  dc cc de      jml [$decc]
$08:a30a  78            sei
$08:a30b  db            stp
$08:a30c  ce dc ed      dec $eddc
$08:a30f  cd dd dd      cmp $dddd
$08:a312  ce 68 bb      dec $bb68
$08:a315  ba            tsx
$08:a316  ab            plb
$08:a317  ba            tsx
$08:a318  ab            plb
$08:a319  bc cc cb      ldy $cbcc,x
$08:a31c  68            pla
$08:a31d  9c dc cc      stz $ccdc
$08:a320  bc dc cb      ldy $cbdc,x
$08:a323  de dd 54      dec $54dd,x
$08:a326  ab            plb
$08:a327  a9 aa bb      lda #$bbaa
$08:a32a  a9 be ee      lda #$eebe
$08:a32d  fe 54 f1      inc $f154,x
$08:a330  ff 0f ee f2   sbc $f2ee0f,x
$08:a334  30 01         bmi $a337
$08:a336  34 48         bit $48,x
$08:a338  ed e2 11      sbc $11e2
$08:a33b  1e 05 30      asl $3005,x
$08:a33e  13 44         ora ($44,s),y
$08:a340  58            cli
$08:a341  22 21 33 32   jsl $323321
$08:a345  52 23         eor ($23)
$08:a347  35 54         and $54,x
$08:a349  68            pla
$08:a34a  22 23 22 12   jsl $122223
$08:a34e  32 34         and ($34)
$08:a350  22 32 68 34   jsl $346832
$08:a354  23 33         and $33,s
$08:a356  32 33         and ($33)
$08:a358  33 33         and ($33,s),y
$08:a35a  43 68         eor $68,s
$08:a35c  33 43         and ($43,s),y
$08:a35e  33 53         and ($53,s),y
$08:a360  34 33         bit $33,x
$08:a362  44 34 68      mvp $68,$34
$08:a365  43 44         eor $44,s
$08:a367  43 34         eor $34,s
$08:a369  44 44 44      mvp $44,$44
$08:a36c  34 68         bit $68,x
$08:a36e  44 34 55      mvp $55,$34
$08:a371  33 44         and ($44,s),y
$08:a373  44 44 54      mvp $54,$44
$08:a376  68            pla
$08:a377  34 54         bit $54,x
$08:a379  44 54 44      mvp $44,$54
$08:a37c  54 44 45      mvn $45,$44
$08:a37f  68            pla
$08:a380  45 44         eor $44
$08:a382  55 44         eor $44,x
$08:a384  55 44         eor $44,x
$08:a386  55 44         eor $44,x
$08:a388  68            pla
$08:a389  45 55         eor $55
$08:a38b  45 45         eor $45
$08:a38d  45 45         eor $45
$08:a38f  45 45         eor $45
$08:a391  68            pla
$08:a392  55 44         eor $44,x
$08:a394  54 54 54      mvn $54,$54
$08:a397  45 54         eor $54
$08:a399  45 68         eor $68
$08:a39b  44 54 45      mvp $45,$54
$08:a39e  53 44         eor ($44,s),y
$08:a3a0  54 54 44      mvn $44,$54
$08:a3a3  68            pla
$08:a3a4  43 44         eor $44,s
$08:a3a6  44 54 34      mvp $34,$54
$08:a3a9  43 44         eor $44,s
$08:a3ab  43 68         eor $68,s
$08:a3ad  44 43 34      mvp $34,$43
$08:a3b0  42 44         wdm #$44
$08:a3b2  42 43         wdm #$43
$08:a3b4  33 68         and ($68,s),y
$08:a3b6  42 34         wdm #$34
$08:a3b8  33 33         and ($33,s),y
$08:a3ba  33 32         and ($32,s),y
$08:a3bc  33 32         and ($32,s),y
$08:a3be  58            cli
$08:a3bf  56 56         lsr $56,x
$08:a3c1  46 54         lsr $54
$08:a3c3  46 54         lsr $54
$08:a3c5  45 54         eor $54
$08:a3c7  58            cli
$08:a3c8  44 44 53      mvp $53,$44
$08:a3cb  34 43         bit $43,x
$08:a3cd  34 34         bit $34,x
$08:a3cf  43 58         eor $58,s
$08:a3d1  32 33         and ($33)
$08:a3d3  33 23         and ($23,s),y
$08:a3d5  32 23         and ($23)
$08:a3d7  31 22         and ($22),y
$08:a3d9  44 43 33      mvp $33,$43
$08:a3dc  22 12 42 21   jsl $214212
$08:a3e0  12 21         ora ($21)
$08:a3e2  38            sec
$08:a3e3  46 40         lsr $40
$08:a3e5  61 13         adc ($13,x)
$08:a3e7  03 2f         ora $2f,s
$08:a3e9  12 02         ora ($02)
$08:a3eb  38            sec
$08:a3ec  10 fe         bpl $a3ec
$08:a3ee  f0 e0         beq $a3d0
$08:a3f0  fc ea be      jsr ($beea,x)
$08:a3f3  ff 48 de fd   sbc $fdde48,x
$08:a3f7  cf ed ce ed   cmp $edceed
$08:a3fb  de cc 48      dec $48cc,x
$08:a3fe  db            stp
$08:a3ff  bc ce dc      ldy $dcce,x
$08:a402  cb            wai
$08:a403  bb            tyx
$08:a404  cc cc 48      cpy $48cc
$08:a407  ca            dex
$08:a408  bc ca bc      ldy $bcca,x
$08:a40b  bb            tyx
$08:a40c  ab            plb
$08:a40d  bb            tyx
$08:a40e  ba            tsx
$08:a40f  48            pha
$08:a410  bb            tyx
$08:a411  ca            dex
$08:a412  bb            tyx
$08:a413  ab            plb
$08:a414  ab            plb
$08:a415  ca            dex
$08:a416  ab            plb
$08:a417  ba            tsx
$08:a418  48            pha
$08:a419  9b            txy
$08:a41a  cb            wai
$08:a41b  ba            tsx
$08:a41c  9b            txy
$08:a41d  ba            tsx
$08:a41e  ba            tsx
$08:a41f  ac aa 48      ldy $48aa
$08:a422  bb            tyx
$08:a423  ab            plb
$08:a424  b9 bc aa      lda $aabc,y
$08:a427  bb            tyx
$08:a428  ba            tsx
$08:a429  ab            plb
$08:a42a  48            pha
$08:a42b  ab            plb
$08:a42c  bb            tyx
$08:a42d  aa            tax
$08:a42e  ab            plb
$08:a42f  ba            tsx
$08:a430  bb            tyx
$08:a431  bb            tyx
$08:a432  aa            tax
$08:a433  48            pha
$08:a434  bb            tyx
$08:a435  aa            tax
$08:a436  bb            tyx
$08:a437  ba            tsx
$08:a438  aa            tax
$08:a439  bb            tyx
$08:a43a  ba            tsx
$08:a43b  aa            tax
$08:a43c  48            pha
$08:a43d  bb            tyx
$08:a43e  bb            tyx
$08:a43f  aa            tax
$08:a440  ba            tsx
$08:a441  ab            plb
$08:a442  bb            tyx
$08:a443  aa            tax
$08:a444  ba            tsx
$08:a445  48            pha
$08:a446  bb            tyx
$08:a447  ab            plb
$08:a448  aa            tax
$08:a449  9b            txy
$08:a44a  cb            wai
$08:a44b  a9 ba ab      lda #$abba
$08:a44e  48            pha
$08:a44f  bb            tyx
$08:a450  aa            tax
$08:a451  ac ba aa      ldy $aaba
$08:a454  aa            tax
$08:a455  ba            tsx
$08:a456  bb            tyx
$08:a457  48            pha
$08:a458  ba            tsx
$08:a459  ab            plb
$08:a45a  ab            plb
$08:a45b  bb            tyx
$08:a45c  aa            tax
$08:a45d  bc aa bc      ldy $bcaa,x
$08:a460  48            pha
$08:a461  ab            plb
$08:a462  ba            tsx
$08:a463  ac bc bb      ldy $bbbc
$08:a466  bb            tyx
$08:a467  ab            plb
$08:a468  cb            wai
$08:a469  48            pha
$08:a46a  bc bb cc      ldy $ccbb,x
$08:a46d  ba            tsx
$08:a46e  cc cb bb      cpy $bbcb
$08:a471  cd 48 bb      cmp $bb48
$08:a474  cc cc cc      cpy $cccc
$08:a477  cb            wai
$08:a478  cc cc dc      cpy $dccc
$08:a47b  48            pha
$08:a47c  cc cc dd      cpy $ddcc
$08:a47f  cc cc dd      cpy $ddcc
$08:a482  dc dc 48      jml [$48dc]
$08:a485  dd dc dd      cmp $dddc,x
$08:a488  dd dd de      cmp $dedd,x
$08:a48b  dc df 48      jml [$48df]
$08:a48e  dc de ee      jml [$eede]
$08:a491  de dd de      dec $dedd,x
$08:a494  fe dd 38      inc $38dd,x
$08:a497  de bc cb      dec $cbbc,x
$08:a49a  dd cc dd      cmp $ddcc,x
$08:a49d  dc dc 38      jml [$38dc]
$08:a4a0  df dc e0 ed   cmp $ede0dc,x
$08:a4a4  dd ee 0f      cmp $0fee,x
$08:a4a7  ed 24 cf      sbc $cf24
$08:a4aa  f0 02         beq $a4ae
$08:a4ac  31 22         and ($22),y
$08:a4ae  22 43 13 18   jsl $181343
$08:a4b2  01 0b         ora ($0b,x)
$08:a4b4  1e 14 21      asl $2114,x
$08:a4b7  31 14         and ($14),y
$08:a4b9  60            rts
$08:a4ba  28            plp
$08:a4bb  02 21         cop #$21
$08:a4bd  23 31         and $31,s
$08:a4bf  25 41         and $41
$08:a4c1  04 42         tsb $42
$08:a4c3  28            plp
$08:a4c4  33 45         and ($45,s),y
$08:a4c6  34 32         bit $32,x
$08:a4c8  53 34         eor ($34,s),y
$08:a4ca  54 43 28      mvn $28,$43
$08:a4cd  53 46         eor ($46,s),y
$08:a4cf  54 43 46      mvn $46,$43
$08:a4d2  45 56         eor $56
$08:a4d4  34 28         bit $28,x
$08:a4d6  65 55         adc $55
$08:a4d8  54 55 57      mvn $57,$55
$08:a4db  44 56 55      mvp $55,$56
$08:a4de  28            plp
$08:a4df  54 56 46      mvn $46,$56
$08:a4e2  55 55         eor $55,x
$08:a4e4  55 56         eor $56,x
$08:a4e6  46 28         lsr $28
$08:a4e8  54 56 65      mvn $65,$56
$08:a4eb  44 65 65      mvp $65,$65
$08:a4ee  44 65 28      mvp $28,$65
$08:a4f1  55 55         eor $55,x
$08:a4f3  64 56         stz $56
$08:a4f5  44 65 55      mvp $55,$65
$08:a4f8  56 28         lsr $28,x
$08:a4fa  55 35         eor $35,x
$08:a4fc  66 44         ror $44
$08:a4fe  55 55         eor $55,x
$08:a500  54 55 28      mvn $28,$55
$08:a503  36 56         rol $56,x
$08:a505  44 45 54      mvp $54,$45
$08:a508  55 53         eor $53,x
$08:a50a  65 28         adc $28
$08:a50c  43 55         eor $55,s
$08:a50e  54 44 65      mvn $65,$44
$08:a511  34 45         bit $45,x
$08:a513  55 28         eor $28,x
$08:a515  54 34 55      mvn $55,$34
$08:a518  44 44 55      mvp $55,$44
$08:a51b  34 44         bit $44,x
$08:a51d  28            plp
$08:a51e  54 34 44      mvn $44,$34
$08:a521  45 43         eor $43
$08:a523  44 43 44      mvp $44,$43
$08:a526  28            plp
$08:a527  34 44         bit $44,x
$08:a529  33 34         and ($34,s),y
$08:a52b  43 34         eor $34,s
$08:a52d  33 33         and ($33,s),y
$08:a52f  28            plp
$08:a530  34 33         bit $33,x
$08:a532  23 43         and $43,s
$08:a534  31 34         and ($34),y
$08:a536  32 32         and ($32)
$08:a538  18            clc
$08:a539  57 44         eor [$44],y
$08:a53b  65 54         adc $54
$08:a53d  54 54 45      mvn $45,$54
$08:a540  34 18         bit $18,x
$08:a542  53 44         eor ($44,s),y
$08:a544  42 54         wdm #$54
$08:a546  23 44         and $44,s
$08:a548  23 33         and $33,s
$08:a54a  18            clc
$08:a54b  43 23         eor $23,s
$08:a54d  23 22         and $22,s
$08:a54f  24 31         bit $31
$08:a551  13 21         ora ($21,s),y
$08:a553  04 33         tsb $33
$08:a555  34 44         bit $44,x
$08:a557  43 32         eor $32,s
$08:a559  23 32         and $32,s
$08:a55b  11 04         ora ($04),y
$08:a55d  22 11 01 10   jsl $100111
$08:a561  10 01         bpl $a564
$08:a563  00 00         brk #$00
$08:a565  04 00         tsb $00
$08:a567  00 00         brk #$00
$08:a569  00 00         brk #$00
$08:a56b  f0 ff         beq $a56c
$08:a56d  ff 04 0f 00   sbc $000f04,x
$08:a571  0e ff f0      asl $f0ff
$08:a574  ff ff 0f 04   sbc $040fff,x
$08:a578  ff ff fe fe   sbc $fefeff,x
$08:a57c  ff ef ef ef   sbc $efefef,x
$08:a580  04 ff         tsb $ff
$08:a582  fe fe ff      inc $fffe,x
$08:a585  ff ff ff ff   sbc $ffffff,x
$08:a589  04 ff         tsb $ff
$08:a58b  0f ff f0 ff   ora $fff0ff
$08:a58f  f0 f0         beq $a581
$08:a591  ff 04 f0 ff   sbc $fff004,x
$08:a595  0f f0 ff 00   ora $00fff0
$08:a599  00 00         brk #$00
$08:a59b  04 00         tsb $00
$08:a59d  00 00         brk #$00
$08:a59f  00 00         brk #$00
$08:a5a1  00 00         brk #$00
$08:a5a3  00 04         brk #$04
$08:a5a5  00 00         brk #$00
$08:a5a7  00 00         brk #$00
$08:a5a9  00 00         brk #$00
$08:a5ab  00 00         brk #$00
$08:a5ad  10 de         bpl $a58d
$08:a5af  ee ee ee      inc $eeee
$08:a5b2  ee ff ff      inc $ffff
$08:a5b5  ff 00 ee dc   sbc $dcee00,x
$08:a5b9  cd ed de      cmp $deed
$08:a5bc  ed de ed      sbc $edde
$08:a5bf  00 de         brk #$de
$08:a5c1  ed de fe      sbc $fede
$08:a5c4  ef fe ef fe   sbc $feeffe
$08:a5c8  00 ef         brk #$ef
$08:a5ca  fe ef ff      inc $ffef,x
$08:a5cd  f0 0f         beq $a5de
$08:a5cf  f0 0f         beq $a5e0
$08:a5d1  00 f0         brk #$f0
$08:a5d3  0f f0 0f f0   ora $f00ff0
$08:a5d7  0f f0 00 00   ora $0000f0
$08:a5db  00 00         brk #$00
$08:a5dd  00 00         brk #$00
$08:a5df  00 00         brk #$00
$08:a5e1  00 00         brk #$00
$08:a5e3  00 00         brk #$00
$08:a5e5  00 00         brk #$00
$08:a5e7  00 00         brk #$00
$08:a5e9  00 00         brk #$00
$08:a5eb  00 00         brk #$00
$08:a5ed  00 00         brk #$00
$08:a5ef  00 00         brk #$00
$08:a5f1  00 00         brk #$00
$08:a5f3  00 00         brk #$00
$08:a5f5  00 00         brk #$00
$08:a5f7  00 00         brk #$00
$08:a5f9  00 00         brk #$00
$08:a5fb  00 00         brk #$00
$08:a5fd  00 00         brk #$00
$08:a5ff  00 00         brk #$00
$08:a601  00 00         brk #$00
$08:a603  00 00         brk #$00
$08:a605  00 00         brk #$00
$08:a607  00 00         brk #$00
$08:a609  00 00         brk #$00
$08:a60b  00 00         brk #$00
$08:a60d  00 00         brk #$00
$08:a60f  00 01         brk #$01
$08:a611  00 00         brk #$00
$08:a613  00 00         brk #$00
$08:a615  00 00         brk #$00
$08:a617  00 00         brk #$00
$08:a619  ea            nop
$08:a61a  09 00 00      ora #$0000
$08:a61d  00 00         brk #$00
$08:a61f  00 00         brk #$00
$08:a621  00 00         brk #$00
$08:a623  00 90         brk #$90
$08:a625  0f 02 31 0f   ora $0f3102
$08:a629  0f 47 62 e6   ora $e66247
$08:a62d  b4 1f         ldy $1f,x
$08:a62f  df 0f f2 20   cmp $20f20f,x
$08:a633  20 bd fe      jsr $febd
$08:a636  b4 f1         ldy $f1,x
$08:a638  bc 0f f1      ldy $f10f,x
$08:a63b  ee 0f f0      inc $f00f
$08:a63e  ff 94 cf fc   sbc $fccf94,x
$08:a642  ce dc dd      dec $dddc
$08:a645  de ef 1d      dec $1def,x
$08:a648  a4 c0         ldy $c0
$08:a64a  03 da         ora $da,s
$08:a64c  1f ef ff 00   ora $00ffef,x
$08:a650  03 c0         ora $c0,s
$08:a652  01 0e         ora ($0e,x)
$08:a654  cc dd f0      cpy $f0dd
$08:a657  ec f5 5f      cpx $5ff5
$08:a65a  b8            clv
$08:a65b  66 33         ror $33
$08:a65d  ed 0e 03      sbc $030e
$08:a660  11 00         ora ($00),y
$08:a662  fe b4 01      inc $01b4,x
$08:a665  32 11         and ($11)
$08:a667  11 1c         ora ($1c),y
$08:a669  d5 50         cmp $50,x
$08:a66b  21 a4         and ($a4,x)
$08:a66d  f4 31 12      pea $1231
$08:a670  22 22 22 22   jsl $222222
$08:a674  21 b4         and ($b4,x)
$08:a676  01 fb         ora ($fb,x)
$08:a678  f6 41         inc $41,x
$08:a67a  11 11         ora ($11),y
$08:a67c  11 11         ora ($11),y
$08:a67e  94 33         sty $33,x
$08:a680  31 15         and ($15),y
$08:a682  41 43         eor ($43,x)
$08:a684  32 22         and ($22)
$08:a686  20 a8 13      jsr $13a8
$08:a689  f0 1f         beq $a6aa
$08:a68b  14 0f         trb $0f
$08:a68d  01 ed         ora ($ed,x)
$08:a68f  12 a8         ora ($a8)
$08:a691  23 0c         and $0c,s
$08:a693  d1 33         cmp ($33),y
$08:a695  de 32 fa      dec $fa32,x
$08:a698  a2 a8 61      ldx #$61a8
$08:a69b  1f 9a 26 ef   ora $ef269a,x
$08:a69f  ff ff ff 88   sbc $88ffff,x
$08:a6a3  fd ca cd      sbc $cdca,x
$08:a6a6  dc cc cc      jml [$cccc]
$08:a6a9  dc cc 88      jml [$88cc]
$08:a6ac  dc dc cc      jml [$ccdc]
$08:a6af  dc cc dc      jml [$dccc]
$08:a6b2  cc dc 88      cpy $88dc
$08:a6b5  cc dc dc      cpy $dcdc
$08:a6b8  cc dc cc      cpy $ccdc
$08:a6bb  dc dd a4      jml [$a4dd]
$08:a6be  ff fe ef ff   sbc $ffeffe,x
$08:a6c2  ff 11 cc 1e   sbc $1ecc11,x
$08:a6c6  a8            tay
$08:a6c7  1f 13 ed 11   ora $11ed13,x
$08:a6cb  00 13         brk #$13
$08:a6cd  fb            xce
$08:a6ce  f1 a8         sbc ($a8),y
$08:a6d0  01 51         ora ($51,x)
$08:a6d2  02 1d         cop #$1d
$08:a6d4  e3 11         sbc $11,s
$08:a6d6  20 01 88      jsr $8801
$08:a6d9  64 34         stz $34
$08:a6db  42 25         wdm #$25
$08:a6dd  44 34 34      mvp $34,$34
$08:a6e0  44 88 34      mvp $34,$88
$08:a6e3  44 34 44      mvp $44,$34
$08:a6e6  34 44         bit $44,x
$08:a6e8  34 44         bit $44,x
$08:a6ea  88            dey
$08:a6eb  34 34         bit $34,x
$08:a6ed  44 34 44      mvp $44,$34
$08:a6f0  33 34         and ($34,s),y
$08:a6f2  34 94         bit $94,x
$08:a6f4  33 22         and ($22,s),y
$08:a6f6  22 0a d5 52   jsl $52d50a
$08:a6fa  0e db 98      asl $98db
$08:a6fd  10 14         bpl $a713
$08:a6ff  2f df 3b c3   and $c33bdf
$08:a703  0a            asl a
$08:a704  04 98         tsb $98
$08:a706  ee a1 5c      inc $5ca1
$08:a709  b2 cd         lda ($cd)
$08:a70b  ff fe ee 88   sbc $88eefe,x
$08:a70f  cc cd dc      cpy $dccd
$08:a712  cc dc cc      cpy $ccdc
$08:a715  dc cc 88      jml [$88cc]
$08:a718  dc dc cc      jml [$ccdc]
$08:a71b  dc cc dc      jml [$dccc]
$08:a71e  cd ec a8      cmp $a8ec
$08:a721  ff ff 0f ff   sbc $ff0fff,x
$08:a725  1f c0 4f d5   ora $d54fc0,x
$08:a729  b8            clv
$08:a72a  fa            plx
$08:a72b  12 02         ora ($02)
$08:a72d  30 cd         bmi $a6fc
$08:a72f  f1 01         sbc ($01),y
$08:a731  61 c4         adc ($c4,x)
$08:a733  f1 10         sbc ($10),y
$08:a735  11 f2         ora ($f2),y
$08:a737  0e ce 45      asl $45ce
$08:a73a  11 a4         ora ($a4),y
$08:a73c  3d 35 e0      and $e035,x
$08:a73f  31 e2         and ($e2),y
$08:a741  45 42         eor $42
$08:a743  22 a4 22 11   jsl $1122a4
$08:a747  21 f5         and ($f5,x)
$08:a749  32 22         and ($22)
$08:a74b  22 22 94 33   jsl $339422
$08:a74f  34 44         bit $44,x
$08:a751  33 42         and ($42,s),y
$08:a753  25 51         and $51
$08:a755  f0 b4         beq $a70b
$08:a757  1f f3 31 01   ora $0131f3,x
$08:a75b  01 10         ora ($10,x)
$08:a75d  de 34 b4      dec $b434,x
$08:a760  00 0f         brk #$0f
$08:a762  e0 22 f0      cpx #$f022
$08:a765  0d c0 23      ora $23c0
$08:a768  b8            clv
$08:a769  fb            xce
$08:a76a  e3 40         sbc $40,s
$08:a76c  d0 11         bne $a77f
$08:a76e  d0 10         bne $a780
$08:a770  0f b8 e0 23   ora $23e0b8
$08:a774  cd 3f d3      cmp $d33f
$08:a777  1d 12 db      ora $db12,x
$08:a77a  a4 de         ldy $de
$08:a77c  d0 0e         bne $a78c
$08:a77e  ec ee ee      cpx $eeee
$08:a781  ee ee 88      inc $88ee
$08:a784  ed cb db      sbc $dbcb
$08:a787  dd cc dc      cmp $dccc,x
$08:a78a  cd dc 88      cmp $88dc
$08:a78d  cc dd cc      cpy $ccdd
$08:a790  dc cd dc      jml [$dccd]
$08:a793  cd dc a4      cmp $a4dc
$08:a796  ef e1 2c c1   sbc $c12ce1
$08:a79a  2e bf 1e      rol $1ebf
$08:a79d  1f b4 f2 0e   ora $0ef2b4,x
$08:a7a1  12 10         ora ($10)
$08:a7a3  bf 00 32 f5   lda $f53200,x
$08:a7a7  b4 1b         ldy $1b,x
$08:a7a9  02 f2         cop #$f2
$08:a7ab  3f 00 00 13   and $130000,x
$08:a7af  3f a4 03 21   and $2103a4,x
$08:a7b3  14 4e         trb $4e
$08:a7b5  13 21         ora ($21,s),y
$08:a7b7  55 d3         eor $d3,x
$08:a7b9  a8            tay
$08:a7ba  3c 23 f0      bit $f023,x
$08:a7bd  05 f0         ora $f0
$08:a7bf  11 11         ora ($11),y
$08:a7c1  11 88         ora ($88),y
$08:a7c3  33 43         and ($43,s),y
$08:a7c5  43 44         eor $44,s
$08:a7c7  33 44         and ($44,s),y
$08:a7c9  43 34         eor $34,s
$08:a7cb  94 44         sty $44,x
$08:a7cd  33 34         and ($34,s),y
$08:a7cf  44 20 66      mvp $66,$20
$08:a7d2  24 43         bit $43
$08:a7d4  b4 1e         ldy $1e,x
$08:a7d6  f1 01         sbc ($01),y
$08:a7d8  5e f2 ff      lsr $fff2,x
$08:a7db  1e d2 b4      asl $b4d2,x
$08:a7de  20 e0 20      jsr $20e0
$08:a7e1  f0 d0         beq $a7b3
$08:a7e3  0f 0e e4 c4   ora $c4e40e
$08:a7e7  3e cf 0e      rol $0ecf,x
$08:a7ea  01 31         ora ($31,x)
$08:a7ec  fe ef ff      inc $ffef,x
$08:a7ef  b8            clv
$08:a7f0  00 24         brk #$24
$08:a7f2  fc ae 41      jsr ($41ae,x)
$08:a7f5  03 fa         ora $fa,s
$08:a7f7  3f c4 00 ff   and $ff00c4,x
$08:a7fb  f0 10         beq $a80d
$08:a7fd  ef 00 02 2d   sbc $2d0200
$08:a801  b8            clv
$08:a802  13 f0         ora ($f0,s),y
$08:a804  2e e2 3b      rol $3be2
$08:a807  d3 fe         cmp ($fe,s),y
$08:a809  5c b4 f4 0a   jml $0af4b4
$08:a80d  d0 00         bne $a80f
$08:a80f  34 ef         bit $ef,x
$08:a811  19 e2 c0      ora $c0e2,y
$08:a814  c0 2f cc      cpy #$cc2f
$08:a817  f1 ed         sbc ($ed),y
$08:a819  ef 25 1c c4   sbc $c41c25
$08:a81d  02 22         cop #$22
$08:a81f  1f f1 23 0c   ora $0c23f1,x
$08:a823  d0 13         bne $a838
$08:a825  b4 60         ldy $60,x
$08:a827  10 c0         bpl $a7e9
$08:a829  44 c0 30      mvp $30,$c0
$08:a82c  01 be         ora ($be,x)
$08:a82e  b4 66         ldy $66,x
$08:a830  21 0d         and ($0d,x)
$08:a832  0f 21 33 ff   ora $ff3321
$08:a836  4f b8 22 e0   eor $e022b8
$08:a83a  3f d1 42 ff   and $ff42d1,x
$08:a83e  ec 53 b4      cpx $b453
$08:a841  55 fc         eor $fc,x
$08:a843  f0 02         beq $a847
$08:a845  42 1c         wdm #$1c
$08:a847  9f 73 b4 30   sta $30b473,x
$08:a84b  ba            tsx
$08:a84c  05 4f         ora $4f
$08:a84e  21 9d         and ($9d,x)
$08:a850  4d 01 b4      eor $b401
$08:a853  f1 32         sbc ($32),y
$08:a855  0e 1d cf      asl $cf1d
$08:a858  02 40         cop #$40
$08:a85a  eb            xba
$08:a85b  b4 e1         ldy $e1,x
$08:a85d  36 2a         rol $2a,x
$08:a85f  ed d3 2f      sbc $2fd3
$08:a862  2f c2 b4 1f   and $1fb4c2
$08:a866  fc c2 41      jsr ($41c2,x)
$08:a869  df f0 0b 44   cmp $440bf0,x
$08:a86d  b4 cd         ldy $cd,x
$08:a86f  10 ee         bpl $a85f
$08:a871  00 02         brk #$02
$08:a873  2d c0 ee      and $eec0
$08:a876  b4 0f         ldy $0f,x
$08:a878  22 ee f1 0d   jsl $0df1ee
$08:a87c  44 99 11      mvp $11,$99
$08:a87f  b4 21         ldy $21,x
$08:a881  00 fd         brk #$fd
$08:a883  d5 2e         cmp $2e,x
$08:a885  02 ca         cop #$ca
$08:a887  3f b4 f1 13   and $13f1b4,x
$08:a88b  2a            rol a
$08:a88c  f2 2d         sbc ($2d)
$08:a88e  12 c1         ora ($c1)
$08:a890  6f b0 b9 9b   adc $9bb9b0
$08:a894  26 fd         rol $fd
$08:a896  12 fd         ora ($fd)
$08:a898  ef e0 b4 22   sbc $22b4e0
$08:a89c  1f ef e5 60   ora $60e5ef,x
$08:a8a0  de ee 36      dec $36ee,x
$08:a8a3  a4 4f         ldy $4f
$08:a8a5  ce 21 35      dec $3521
$08:a8a8  22 cb 45 1e   jsl $1e45cb
$08:a8ac  b4 00         ldy $00,x
$08:a8ae  23 1f         and $1f,s
$08:a8b0  df 14 30 fe   cmp $fe3014,x
$08:a8b4  f3 b4         sbc ($b4,s),y
$08:a8b6  11 2d         ora ($2d),y
$08:a8b8  e5 21         sbc $21
$08:a8ba  1e de f4      asl $f4de,x
$08:a8bd  61 a4         adc ($a4,x)
$08:a8bf  be 45 1d      ldx $1d45,y
$08:a8c2  d3 1a         cmp ($1a,s),y
$08:a8c4  d6 5f         dec $5f,x
$08:a8c6  0c b4 45      tsb $45b4
$08:a8c9  0d d0 4f      ora $4fd0
$08:a8cc  e2 ed         sep #$ed
$08:a8ce  42 00         wdm #$00
$08:a8d0  b4 e0         ldy $e0,x
$08:a8d2  40            rti
$08:a8d3  e3 0a         sbc $0a,s
$08:a8d5  b0 36         bcs $a90d
$08:a8d7  6e ac b4      ror $b4ac
$08:a8da  22 de 31 30   jsl $3031de
$08:a8de  cd f1 31      cmp $31f1
$08:a8e1  bd c4 1f      lda $1fc4,x
$08:a8e4  14 ed         trb $ed
$08:a8e6  0d f2 2f      ora $2ff2
$08:a8e9  e0 f1 b4      cpx #$b4f1
$08:a8ec  40            rti
$08:a8ed  aa            tax
$08:a8ee  04 49         tsb $49
$08:a8f0  c0 04 4b      cpy #$4b04
$08:a8f3  b1 b4         lda ($b4),y
$08:a8f5  ef 2e e4 ae   sbc $aee42e
$08:a8f9  43 fc         eor $fc,s
$08:a8fb  cf 02 c4 31   cmp $31c402
$08:a8ff  ed e0 01      sbc $01e0
$08:a902  1e 03 fc      asl $fc03,x
$08:a905  f2 c4         sbc ($c4)
$08:a907  2f ef f1 1e   and $1ef1ef
$08:a90b  20 d2 40      jsr $40d2
$08:a90e  ff a8 21 e2   sbc $e221a8,x
$08:a912  2a            rol a
$08:a913  07 0f         ora [$0f]
$08:a915  2d a4 dc      and $dca4
$08:a918  b4 f1         ldy $f1,x
$08:a91a  56 fd         lsr $fd,x
$08:a91c  f2 2f         sbc ($2f)
$08:a91e  00 e5         brk #$e5
$08:a920  4a            lsr a
$08:a921  b8            clv
$08:a922  54 f2 db      mvn $db,$f2
$08:a925  25 31         and $31
$08:a927  ca            dex
$08:a928  06 25         asl $25
$08:a92a  c8            iny
$08:a92b  ce 13 3d      dec $3d13
$08:a92e  e0 00 23      cpx #$2300
$08:a931  fc 2d b4      jsr ($b42d,x)
$08:a934  e7 2e         sbc [$2e]
$08:a936  3f 20 12 fc   and $fc1220,x
$08:a93a  16 eb         asl $eb,x
$08:a93c  b4 01         ldy $01,x
$08:a93e  25 0d         and $0d
$08:a940  40            rti
$08:a941  df 02 4e dc   cmp $dc4e02,x
$08:a945  b4 22         ldy $22,x
$08:a947  13 0d         ora ($0d,s),y
$08:a949  13 bd         ora ($bd,s),y
$08:a94b  43 f1         eor $f1,s
$08:a94d  fc b4 c0      jsr ($c0b4,x)
$08:a950  57 2b         eor [$2b],y
$08:a952  fd e1 0f      sbc $0fe1,x
$08:a955  11 0f         ora ($0f),y
$08:a957  b8            clv
$08:a958  21 fe         and ($fe,x)
$08:a95a  c1 42         cmp ($42,x)
$08:a95c  00 fc         brk #$fc
$08:a95e  e2 22         sep #$22
$08:a960  b4 2f         ldy $2f,x
$08:a962  cf 4f f2 fd   cmp $fdf24f
$08:a966  ee 26 fc      inc $fc26
$08:a969  b4 cd         ldy $cd,x
$08:a96b  14 31         trb $31
$08:a96d  db            stp
$08:a96e  c1 53         cmp ($53,x)
$08:a970  db            stp
$08:a971  f2 b4         sbc ($b4)
$08:a973  10 21         bpl $a996
$08:a975  ed dd 44      sbc $44dd
$08:a978  0f cf fe c4   ora $c4fecf
$08:a97c  01 11         ora ($11,x)
$08:a97e  1f fe e1 20   ora $20e1fe,x
$08:a982  21 de         and ($de,x)
$08:a984  b4 11         ldy $11,x
$08:a986  01 2f         ora ($2f,x)
$08:a988  13 db         ora ($db,s),y
$08:a98a  e1 13         sbc ($13,x)
$08:a98c  6e b4 bf      ror $bfb4
$08:a98f  01 3d         ora ($3d,x)
$08:a991  f2 02         sbc ($02)
$08:a993  3f e0 ce b8   and $b8cee0,x
$08:a997  24 2a         bit $2a
$08:a999  d3 f2         cmp ($f2,s),y
$08:a99b  10 ed         bpl $a98a
$08:a99d  51 de         eor ($de),y
$08:a99f  b4 33         ldy $33,x
$08:a9a1  e0 3c e2      cpx #$e23c
$08:a9a4  21 1f         and ($1f,x)
$08:a9a6  d1 4e         cmp ($4e),y
$08:a9a8  b4 f3         ldy $f3,x
$08:a9aa  fd 44 e0      sbc $e044,x
$08:a9ad  ee 0f 26      inc $260f
$08:a9b0  1e b4 00      asl $00b4,x
$08:a9b3  f0 10         beq $a9c5
$08:a9b5  2f d0 43 cb   and $cb43d0
$08:a9b9  f5 b8         sbc $b8,x
$08:a9bb  ff 0c b5 31   sbc $31b50c,x
$08:a9bf  01 dd         ora ($dd,x)
$08:a9c1  34 df         bit $df,x
$08:a9c3  b8            clv
$08:a9c4  12 fe         ora ($fe)
$08:a9c6  1f 04 2d b0   ora $b02d04,x
$08:a9ca  33 01         and ($01,s),y
$08:a9cc  b4 2d         ldy $2d,x
$08:a9ce  d2 52         cmp ($52)
$08:a9d0  dc c2 4f      jml [$4fc2]
$08:a9d3  23 dc         and $dc,s
$08:a9d5  b0 d0         bcs $a9a7
$08:a9d7  42 f0         wdm #$f0
$08:a9d9  1f f2 44 1c   ora $1c44f2,x
$08:a9dd  bf b8 ce 30   lda $30ceb8,x
$08:a9e1  e0 3d 14      cpx #$143d
$08:a9e4  bb            tyx
$08:a9e5  6f e3 b4 42   adc $42b4e3
$08:a9e9  db            stp
$08:a9ea  f1 31         sbc ($31),y
$08:a9ec  0d d1 12      ora $12d1
$08:a9ef  db            stp
$08:a9f0  b8            clv
$08:a9f1  52 f0         eor ($f0)
$08:a9f3  cf 0e 35 1d   cmp $1d350e
$08:a9f7  be 03 b4      ldx $b403,y
$08:a9fa  ef 44 ef f0   sbc $f0ef44
$08:a9fe  10 ec         bpl $a9ec
$08:aa00  d2 41         cmp ($41)
$08:aa02  a4 00         ldy $00
$08:aa04  ab            plb
$08:aa05  51 10         eor ($10),y
$08:aa07  a2 7c ef      ldx #$ef7c
$08:aa0a  d1 a4         cmp ($a4),y
$08:aa0c  22 0d 30 fb   jsl $fb300d
$08:aa10  24 f2         bit $f2
$08:aa12  30 cd         bmi $a9e1
$08:aa14  b8            clv
$08:aa15  31 e0         and ($e0),y
$08:aa17  0e 04 00      asl $0004
$08:aa1a  ed 01 54      sbc $5401
$08:aa1d  b4 2f         ldy $2f,x
$08:aa1f  fe 21 cf      inc $cf21,x
$08:aa22  43 02         eor $02,s
$08:aa24  2d c1 b4      and $b4c1
$08:aa27  23 41         and $41,s
$08:aa29  da            phx
$08:aa2a  03 11         ora $11,s
$08:aa2c  20 02 1d      jsr $1d02
$08:aa2f  a4 e4         ldy $e4
$08:aa31  64 cf         stz $cf
$08:aa33  3d f6 1b      and $1bf6,x
$08:aa36  5a            phy
$08:aa37  06 a8         asl $a8
$08:aa39  df 2f 0d 2f   cmp $2f0d2f,x
$08:aa3d  22 e2 7a b5   jsl $b57ae2
$08:aa41  a8            tay
$08:aa42  3d 01 f2      and $f201,x
$08:aa45  fc 65 dd      jsr ($dd65,x)
$08:aa48  c2 41         rep #$41
$08:aa4a  b4 13         ldy $13,x
$08:aa4c  1c 0f 00      trb $000f
$08:aa4f  f1 2f         sbc ($2f),y
$08:aa51  22 db b8 34   jsl $34b8db
$08:aa55  1f 2a c3 11   ora $11c32a,x
$08:aa59  50 be         bvc $aa19
$08:aa5b  01 a8         ora ($a8,x)
$08:aa5d  44 cb 4e      mvp $4e,$cb
$08:aa60  b2 30         lda ($30)
$08:aa62  44 a9 d3      mvp $d3,$a9
$08:aa65  b4 10         ldy $10,x
$08:aa67  f3 fd         sbc ($fd,s),y
$08:aa69  d1 22         cmp ($22),y
$08:aa6b  2e de 10      rol $10de
$08:aa6e  a4 f3         ldy $f3
$08:aa70  2b            pld
$08:aa71  eb            xba
$08:aa72  14 ef         trb $ef
$08:aa74  4f d0 df b4   eor $b4dfd0
$08:aa78  21 ee         and ($ee,x)
$08:aa7a  e1 33         sbc ($33,x)
$08:aa7c  fd de 23      sbc $23de,x
$08:aa7f  11 b4         ora ($b4),y
$08:aa81  fd e0 24      sbc $24e0,x
$08:aa84  0e df 32      asl $32df
$08:aa87  e2 0f         sep #$0f
$08:aa89  a4 2f         ldy $2f
$08:aa8b  d1 ed         cmp ($ed),y
$08:aa8d  43 12         eor $12,s
$08:aa8f  0d d4 5c      ora $5cd4
$08:aa92  a4 c1         ldy $c1
$08:aa94  00 42         brk #$42
$08:aa96  e1 2f         sbc ($2f,x)
$08:aa98  24 ce         bit $ce
$08:aa9a  4d b4 e1      eor $e1b4
$08:aa9d  31 00         and ($00),y
$08:aa9f  fe f3 4f      inc $4ff3,x
$08:aaa2  c0 f0 a4      cpy #$a4f0
$08:aaa5  66 fe         ror $fe
$08:aaa7  1d f3 e1      ora $e1f3,x
$08:aaaa  7e ef c6      ror $c6ef,x
$08:aaad  b4 2d         ldy $2d,x
$08:aaaf  f1 3f         sbc ($3f),y
$08:aab1  11 e0         ora ($e0),y
$08:aab3  2d f2 1f      and $1ff2
$08:aab6  a8            tay
$08:aab7  22 f1 d0 41   jsl $41d0f1
$08:aabb  fc c5 30      jsr ($30c5,x)
$08:aabe  01 a8         ora ($a8,x)
$08:aac0  0f cf 27 1a   ora $1a27cf
$08:aac4  b3 31         lda ($31,s),y
$08:aac6  6a            ror a
$08:aac7  bf b0 e0 21   lda $21e0b0,x
$08:aacb  11 24         ora ($24),y
$08:aacd  3f df 23 1f   and $1f23df,x
$08:aad1  a4 33         ldy $33
$08:aad3  03 db         ora $db,s
$08:aad5  df 66 c9 f3   cmp $f3c966,x
$08:aad9  32 b4         and ($b4)
$08:aadb  0f 01 ec 13   ora $13ec01
$08:aadf  00 0e         brk #$0e
$08:aae1  04 ec         tsb $ec
$08:aae3  b8            clv
$08:aae4  40            rti
$08:aae5  02 dc         cop #$dc
$08:aae7  33 0f         and ($0f,s),y
$08:aae9  ff 2d 02 a8   sbc $a8022d,x
$08:aaed  2d d1 3d      and $3dd1
$08:aaf0  10 20         bpl $ab12
$08:aaf2  9d 72 11      sta $1172,x
$08:aaf5  b8            clv
$08:aaf6  fd f1 1e      sbc $1ef1,x
$08:aaf9  14 1d         trb $1d
$08:aafb  ef 00 2f a4   sbc $a42f00
$08:aaff  f2 22         sbc ($22)
$08:ab01  10 fd         bpl $ab00
$08:ab03  0f c4 ff 0f   ora $0fffc4
$08:ab07  a4 45         ldy $45
$08:ab09  e1 3d         sbc ($3d,x)
$08:ab0b  cc f6 5d      cpy $5df6
$08:ab0e  fc 17 a4      jsr ($a417,x)
$08:ab11  4c c2 e0      jmp $e0c2
$08:ab14  4f 14 db c4   eor $c4db14
$08:ab18  65 c4         adc $c4
$08:ab1a  0f 00 10 ff   ora $ff1000
$08:ab1e  e0 42 00      cpx #$0042
$08:ab21  fd b4 e3      sbc $e3b4,x
$08:ab24  13 4d         ora ($4d,s),y
$08:ab26  d0 13         bne $ab3b
$08:ab28  3f ef 00 a4   and $a400ef,x
$08:ab2c  f1 1e         sbc ($1e),y
$08:ab2e  46 0d         lsr $0d
$08:ab30  ff d2 10 31   sbc $3110d2,x
$08:ab34  a4 f1         ldy $f1
$08:ab36  20 0c e3      jsr $e30c
$08:ab39  63 bb         adc $bb,s
$08:ab3b  f0 03         beq $ab40
$08:ab3d  b4 32         ldy $32,x
$08:ab3f  fe f0 ff      inc $fff0,x
$08:ab42  01 01         ora ($01,x)
$08:ab44  43 cb         eor $cb,s
$08:ab46  b4 f1         ldy $f1,x
$08:ab48  23 1e         and $1e,s
$08:ab4a  ff e0 22 2d   sbc $2d22e0,x
$08:ab4e  c1 a4         cmp ($a4,x)
$08:ab50  3e 00 be      rol $be00,x
$08:ab53  46 51         lsr $51
$08:ab55  aa            tax
$08:ab56  ed 13 a4      sbc $a413
$08:ab59  00 1e         brk #$1e
$08:ab5b  01 d0         ora ($d0,x)
$08:ab5d  30 fe         bmi $ab5d
$08:ab5f  f0 ee         beq $ab4f
$08:ab61  b4 01         ldy $01,x
$08:ab63  0f 0f 02 0f   ora $0f020f
$08:ab67  2f c1 30 a4   and $a430c1
$08:ab6b  bc 10 f3      ldy $f310,x
$08:ab6e  0f 0e d2 4e   ora $4ed20e
$08:ab72  fe a4 e3      inc $e3a4,x
$08:ab75  3c c3 f1      bit $f1c3,x
$08:ab78  60            rts
$08:ab79  a1 ff         lda ($ff,x)
$08:ab7b  02 a4         cop #$a4
$08:ab7d  30 bc         bmi $ab3b
$08:ab7f  4e 34 ce      lsr $ce34
$08:ab82  62 ee cd      per $7973
$08:ab85  b4 23         ldy $23,x
$08:ab87  10 f0         bpl $ab79
$08:ab89  0f f1 01 41   ora $4101f1
$08:ab8d  be a4 52      ldx $52a4,y
$08:ab90  11 0f         ora ($0f),y
$08:ab92  ff 25 2f c1   sbc $c12f25,x
$08:ab96  30 a4         bmi $ab3c
$08:ab98  f1 13         sbc ($13),y
$08:ab9a  1c d4 0b      trb $0bd4
$08:ab9d  44 1d e2      mvp $e2,$1d
$08:aba0  a4 22         ldy $22
$08:aba2  2d e2 10      and $10e2
$08:aba5  10 f1         bpl $ab98
$08:aba7  2c e5 a4      bit $a4e5
$08:abaa  2f 3b d3 1f   and $1fd33b
$08:abae  33 ee         and ($ee,s),y
$08:abb0  ae 30 a4      ldx $a430
$08:abb3  26 0b         rol $0b
$08:abb5  d3 00         cmp ($00,s),y
$08:abb7  1e f1 fd      asl $fdf1,x
$08:abba  22 a4 f1 0d   jsl $0df1a4
$08:abbe  20 f0 ce      jsr $cef0
$08:abc1  61 d0         adc ($d0,x)
$08:abc3  1e a8 11      asl $11a8,x
$08:abc6  e1 3d         sbc ($3d,x)
$08:abc8  03 cb         ora $cb,s
$08:abca  33 e4         and ($e4,s),y
$08:abcc  3b            tsc
$08:abcd  a4 bd         ldy $bd
$08:abcf  fe 42 ee      inc $ee42,x
$08:abd2  00 f2         brk #$f2
$08:abd4  fe f1 a8      inc $a8f1,x
$08:abd7  2e b0 41      rol $41b0
$08:abda  02 ca         cop #$ca
$08:abdc  51 d4         eor ($d4),y
$08:abde  0e a8 0f      asl $0fa8
$08:abe1  3f 1d e1 00   and $00e11d,x
$08:abe5  4f f2 dc a4   eor $a4dcf2
$08:abe9  e0 e6 0f      cpx #$0fe6
$08:abec  0d 06 ff      ora $ff06
$08:abef  1f ae a4 32   ora $32a4ae,x
$08:abf3  03 0d         ora $0d,s
$08:abf5  f2 10         sbc ($10)
$08:abf7  fc 33 fd      jsr ($fd33,x)
$08:abfa  94 15         sty $15,x
$08:abfc  fb            xce
$08:abfd  2d f7 3c      and $3cf7
$08:ac00  16 ae         asl $ae,x
$08:ac02  ef a4 54 cf   sbc $cf54a4
$08:ac06  0f f2 20 fd   ora $fd20f2
$08:ac0a  e2 34         sep #$34
$08:ac0c  a4 3e         ldy $3e
$08:ac0e  be ff 34      ldx $34ff,y
$08:ac11  20 d2 10      jsr $10d2
$08:ac14  1c a4 b2      trb $b2a4
$08:ac17  42 3f         wdm #$3f
$08:ac19  d0 32         bne $ac4d
$08:ac1b  ed 20 ee      sbc $ee20
$08:ac1e  a4 f3         ldy $f3
$08:ac20  42 ef         wdm #$ef
$08:ac22  ef 32 f0 b0   sbc $b0f032
$08:ac26  21 a4         and ($a4,x)
$08:ac28  32 f0         and ($f0)
$08:ac2a  ed 13 10      sbc $1013
$08:ac2d  0e b1 21      asl $21b1
$08:ac30  a0 23         ldy #$23
$08:ac32  30 03         bmi $ac37
$08:ac34  33 3e         and ($3e,s),y
$08:ac36  dc df 03      jml [$03df]
$08:ac39  a4 2e         ldy $2e
$08:ac3b  1f ff cf 20   ora $20cfff,x
$08:ac3f  22 11 0e 94   jsl $940e11
$08:ac43  be f4 1d      ldx $1df4,y
$08:ac46  12 01         ora ($01)
$08:ac48  ec 22 ed      cpx $ed22
$08:ac4b  a4 e0         ldy $e0
$08:ac4d  42 00         wdm #$00
$08:ac4f  ef 10 fe c3   sbc $c3fe10
$08:ac53  5f a8 c3 22   eor $22c3a8,x
$08:ac57  f0 fd         beq $ac56
$08:ac59  01 01         ora ($01,x)
$08:ac5b  1f 1e 98 a6   ora $a6981e,x
$08:ac5f  7b            tdc
$08:ac60  2a            rol a
$08:ac61  b1 24         lda ($24),y
$08:ac63  10 fd         bpl $ac62
$08:ac65  c4 a8         cpy $a8
$08:ac67  4d c3 d0      eor $d0c3
$08:ac6a  4f d2 10 1f   eor $1f10d2
$08:ac6e  ae a4 04      ldx $04a4
$08:ac71  1f 01 0e f2   ora $f20e01,x
$08:ac75  10 1d         bpl $ac94
$08:ac77  e1 94         sbc ($94,x)
$08:ac79  0f 11 13 cb   ora $cb1311
$08:ac7d  35 1b         and $1b,x
$08:ac7f  12 cf         ora ($cf)
$08:ac81  94 2e         sty $2e,x
$08:ac83  75 ec         adc $ec,x
$08:ac85  d1 63         cmp ($63),y
$08:ac87  cc ff 25      cpy $25ff
$08:ac8a  a4 21         ldy $21
$08:ac8c  fe 12 ef      inc $ef12,x
$08:ac8f  32 df         and ($df)
$08:ac91  01 31         ora ($31,x)
$08:ac93  94 e5         sty $e5,x
$08:ac95  09 23         ora #$23
$08:ac97  d0 72         bne $ad0b
$08:ac99  a4 5e         ldy $5e
$08:ac9b  45 a4         eor $a4
$08:ac9d  dd 1f 41      cmp $411f,x
$08:aca0  f0 00         beq $aca2
$08:aca2  13 1f         ora ($1f,s),y
$08:aca4  00 98         brk #$98
$08:aca6  d2 e2         cmp ($e2)
$08:aca8  64 db         stz $db
$08:acaa  e2 3e         sep #$3e
$08:acac  f4 0e a8      pea $a80e
$08:acaf  10 e3         bpl $ac94
$08:acb1  01 ff         ora ($ff,x)
$08:acb3  fe 14 01      inc $0114,x
$08:acb6  fd a0 24      sbc $24a0,x
$08:acb9  3e 02 1f      rol $1f02,x
$08:acbc  cc 02 21      cpy $2102
$08:acbf  10 a4         bpl $ac65
$08:acc1  ff c0 41 f0   sbc $f041c0,x
$08:acc5  ec 22 fe      cpx $fe22
$08:acc8  12 98         ora ($98)
$08:acca  ea            nop
$08:accb  f1 12         sbc ($12),y
$08:accd  1e f3 a1      asl $a1f3,x
$08:acd0  01 21         ora ($21,x)
$08:acd2  a4 0e         ldy $0e
$08:acd4  fd e4 3d      sbc $3de4,x
$08:acd7  de 04 2e      dec $2e04,x
$08:acda  00 a4         brk #$a4
$08:acdc  be 30 e1      ldx $e130,y
$08:acdf  11 1e         ora ($1e),y
$08:ace1  00 c0         brk #$c0
$08:ace3  10 98         bpl $ac7d
$08:ace5  4c df 32      jmp $32df
$08:ace8  1b            tcs
$08:ace9  94 71         sty $71,x
$08:aceb  ee fa 94      inc $94fa
$08:acee  a5 32         lda $32
$08:acf0  1d e0 03      ora $03e0,x
$08:acf3  21 ed         and ($ed,x)
$08:acf5  e5 a4         sbc $a4
$08:acf7  4e dd 03      lsr $03dd
$08:acfa  30 01         bmi $acfd
$08:acfc  ee 20 13      inc $1320
$08:acff  a8            tay
$08:ad00  cf 13 ff 10   cmp $10ff13
$08:ad04  e2 3e         sep #$3e
$08:ad06  ff f3 a4 20   sbc $20a4f3,x
$08:ad0a  ff e1 41 e2   sbc $e241e1,x
$08:ad0e  00 21         brk #$21
$08:ad10  cd 94 46      cmp $4694
$08:ad13  32 9d         and ($9d)
$08:ad15  32 21         and ($21)
$08:ad17  f1 00         sbc ($00),y
$08:ad19  12 94         ora ($94)
$08:ad1b  fc e3 03      jsr ($03e3,x)
$08:ad1e  42 1b         wdm #$1b
$08:ad20  d1 1f         cmp ($1f),y
$08:ad22  11 94         ora ($94),y
$08:ad24  ef 3f 13 20   sbc $20133f
$08:ad28  ca            dex
$08:ad29  30 ef         bmi $ad1a
$08:ad2b  03 94         ora $94,s
$08:ad2d  62 fc bd      per $6b2c
$08:ad30  06 4a         asl $4a
$08:ad32  04 ed         tsb $ed
$08:ad34  11 94         ora ($94),y
$08:ad36  df 2d 15 10   cmp $10152d,x
$08:ad3a  09 c0         ora #$c0
$08:ad3c  23 00         and $00,s
$08:ad3e  98            tya
$08:ad3f  3f dd 1e 56   and $561edd,x
$08:ad43  bd 1c 33      lda $331c,x
$08:ad46  ee 94 01      inc $0194
$08:ad49  0e 12 fd      asl $fd12
$08:ad4c  d2 40         cmp ($40)
$08:ad4e  0d c1 94      ora $94c1
$08:ad51  20 00 e0      jsr $e000
$08:ad54  31 e0         and ($e0),y
$08:ad56  dd 34 0d      cmp $0d34,x
$08:ad59  94 e0         sty $e0,x
$08:ad5b  1e 43 ce      asl $ce43,x
$08:ad5e  3f b0 30 e0   and $e030b0,x
$08:ad62  94 02         sty $02,x
$08:ad64  4f bf 0f 1f   eor $1f0fbf
$08:ad68  06 1f         asl $1f
$08:ad6a  ea            nop
$08:ad6b  94 d3         sty $d3,x
$08:ad6d  24 2f         bit $2f
$08:ad6f  ee f0 f1      inc $f1f0
$08:ad72  ff 11 a0 fe   sbc $fea011,x
$08:ad76  f0 fe         beq $ad76
$08:ad78  13 0f         ora ($0f,s),y
$08:ad7a  dc 02 0f      jml [$0f02]
$08:ad7d  98            tya
$08:ad7e  02 2f         cop #$2f
$08:ad80  1e d1 20      asl $20d1,x
$08:ad83  2f 1c d3 94   and $94d31c
$08:ad87  11 37         ora ($37),y
$08:ad89  0a            asl a
$08:ad8a  c0 44         cpy #$44
$08:ad8c  c0 1e         cpy #$1e
$08:ad8e  02 94         cop #$94
$08:ad90  02 11         cop #$11
$08:ad92  11 01         ora ($01),y
$08:ad94  1d d0 20      ora $20d0,x
$08:ad97  01 94         ora ($94,x)
$08:ad99  01 3f         ora ($3f,x)
$08:ad9b  e6 3a         inc $3a
$08:ad9d  e3 01         sbc $01,s
$08:ad9f  fc 15 94      jsr ($9415,x)
$08:ada2  13 3d         ora ($3d,s),y
$08:ada4  dd 05 3e      cmp $3e05,x
$08:ada7  fd f1 12      sbc $12f1,x
$08:adaa  98            tya
$08:adab  1d 03 dc      ora $dc03,x
$08:adae  25 1f         and $1f
$08:adb0  3a            dec a
$08:adb1  05 ca         ora $ca
$08:adb3  94 f5         sty $f5,x
$08:adb5  1c f1 35      trb $35f1
$08:adb8  0b            phd
$08:adb9  b3 1e         lda ($1e,s),y
$08:adbb  31 98         and ($98),y
$08:adbd  a5 11         lda $11
$08:adbf  0f bf 40 30   ora $3040bf
$08:adc3  f2 b9         sbc ($b9)
$08:adc5  94 d1         sty $d1,x
$08:adc7  d5 7e         cmp $7e,x
$08:adc9  c0 ef         cpy #$ef
$08:adcb  5e ff ce      lsr $ceff,x
$08:adce  98            tya
$08:adcf  3f 3e ee d1   and $d1ee3e,x
$08:add3  41 e1         eor ($e1,x)
$08:add5  0e 02 94      asl $9402
$08:add8  dc f2 ff      jml [$fff2]
$08:addb  1e f6 3a      asl $3af6,x
$08:adde  b1 10         lda ($10),y
$08:ade0  84 4b         sty $4b
$08:ade2  c2 22         rep #$22
$08:ade4  dc 4d b1      jml [$b14d]
$08:ade7  31 e1         and ($e1),y
$08:ade9  94 30         sty $30,x
$08:adeb  fe df 42      inc $42df,x
$08:adee  e1 ee         sbc ($ee,x)
$08:adf0  13 1f         ora ($1f,s),y
$08:adf2  88            dey
$08:adf3  2f d4 21 0c   and $0c21d4
$08:adf7  e1 f2         sbc ($f2,x)
$08:adf9  53 db         eor ($db,s),y
$08:adfb  94 ef         sty $ef,x
$08:adfd  3d 04 fc      and $fc04,x
$08:ae00  25 1d         and $1d
$08:ae02  02 10         cop #$10
$08:ae04  94 ee         sty $ee,x
$08:ae06  42 01         wdm #$01
$08:ae08  10 fd         bpl $ae07
$08:ae0a  04 41         tsb $41
$08:ae0c  ed 94 f5      sbc $f594
$08:ae0f  30 0f         bmi $ae20
$08:ae11  cf 54 00 dd   cmp $dd0054
$08:ae15  02 94         cop #$94
$08:ae17  3e 23 01      rol $0123,x
$08:ae1a  fc 20 12      jsr ($1220,x)
$08:ae1d  1f ef 94 02   ora $0294ef,x
$08:ae21  40            rti
$08:ae22  cf 1f f0 42   cmp $42f01f
$08:ae26  00 dd         brk #$dd
$08:ae28  94 20         sty $20,x
$08:ae2a  e1 0f         sbc ($0f,x)
$08:ae2c  22 00 ec f2   jsl $f2ec00
$08:ae30  22 84 fc bd   jsl $bdfc84
$08:ae34  44 ab 41      mvp $41,$ab
$08:ae37  20 cc 24      jsr $24cc
$08:ae3a  98            tya
$08:ae3b  c1 3c         cmp ($3c,x)
$08:ae3d  02 ff         cop #$ff
$08:ae3f  10 02         bpl $ae43
$08:ae41  cd 42 94      cmp $9442
$08:ae44  03 2c         ora $2c,s
$08:ae46  bf 22 ff f0   lda $f0ff22,x
$08:ae4a  e0 31         cpx #$31
$08:ae4c  84 cc         sty $cc
$08:ae4e  e3 30         sbc $30,s
$08:ae50  cc 20 e1      cpy $e120
$08:ae53  51 de         eor ($de),y
$08:ae55  94 ed         sty $ed,x
$08:ae57  31 e1         and ($e1),y
$08:ae59  1f 01 10 0f   ora $0f1001,x
$08:ae5d  ef 98 2f f2   sbc $f22f98
$08:ae61  ff 0f 33 ce   sbc $ce330f,x
$08:ae65  1f f0 98 43   ora $4398f0,x
$08:ae69  ef df 22 f0   sbc $f022df
$08:ae6d  10 c0         bpl $ae2f
$08:ae6f  41 84         eor ($84,x)
$08:ae71  24 3d         bit $3d
$08:ae73  f1 db         sbc ($db),y
$08:ae75  03 53         ora $53,s
$08:ae77  3e cf 84      rol $84cf,x
$08:ae7a  d4 22         pei ($22)
$08:ae7c  10 20         bpl $ae9e
$08:ae7e  bc 15 1d      ldy $1d15,x
$08:ae81  f2 88         sbc ($88)
$08:ae83  3c e0 21      bit $21e0,x
$08:ae86  ff 2f e4 5b   sbc $5be42f,x
$08:ae8a  b4 88         ldy $88,x
$08:ae8c  1d 13 1f      ora $1f13,x
$08:ae8f  e0 23         cpx #$23
$08:ae91  de ff 22      dec $22ff,x
$08:ae94  84 10         sty $10
$08:ae96  34 22         bit $22,x
$08:ae98  fc ed 35      jsr ($35ed,x)
$08:ae9b  cc 43 84      cpy $8443
$08:ae9e  fe 11 ee      inc $ee11,x
$08:aea1  02 2e         cop #$2e
$08:aea3  d2 10         cmp ($10)
$08:aea5  42 88         wdm #$88
$08:aea7  b2 0e         lda ($0e)
$08:aea9  32 10         and ($10)
$08:aeab  dc 32 ff      jml [$ff32]
$08:aeae  12 84         ora ($84)
$08:aeb0  32 dd         and ($dd)
$08:aeb2  0f 04 fc 04   ora $04fc04
$08:aeb6  3f df 84 2e   and $2e84df,x
$08:aeba  e2 fd         sep #$fd
$08:aebc  16 4e         asl $4e,x
$08:aebe  cf 0f e0 84   cmp $84e00f
$08:aec2  10 f1         bpl $aeb5
$08:aec4  23 1e         and $1e,s
$08:aec6  fd c2 31      sbc $31c2,x
$08:aec9  0f 78 11 30   ora $301178
$08:aecd  ac 44 f2      ldy $f244
$08:aed0  ff dd 25 74   sbc $7425dd,x
$08:aed4  04 30         tsb $30
$08:aed6  0d b0 14      ora $14b0
$08:aed9  1c f0 df      trb $dff0
$08:aedc  78            sei
$08:aedd  2d 36 dc      and $dc36
$08:aee0  ba            tsx
$08:aee1  66 0d         ror $0d
$08:aee3  05 1b         ora $1b
$08:aee5  68            pla
$08:aee6  dc e6 e2      jml [$e2e6]
$08:aee9  6a            ror a
$08:aeea  14 af         trb $af
$08:aeec  02 4c         cop #$4c
$08:aeee  78            sei
$08:aeef  fe 03 f2      inc $f203,x
$08:aef2  4d ec e5      eor $e5ec
$08:aef5  1e 23 74      asl $7423,x
$08:aef8  2e d0 24      rol $24d0
$08:aefb  4f cf df 33   eor $33dfcf
$08:aeff  11 74         ora ($74),y
$08:af01  f0 1f         beq $af22
$08:af03  ee 03 33      inc $3303
$08:af06  0d d3 60      ora $60d3
$08:af09  78            sei
$08:af0a  d2 11         cmp ($11)
$08:af0c  21 ee         and ($ee,x)
$08:af0e  1c 34 f0      trb $f034
$08:af11  30 64         bmi $af77
$08:af13  ff 9b 23 00   sbc $00239b,x
$08:af17  42 de         wdm #$de
$08:af19  54 d1 64      mvn $64,$d1
$08:af1c  2d c3 41      and $41c3
$08:af1f  0f ee 21 02   ora $0221ee
$08:af23  10 64         bpl $af89
$08:af25  12 1b         ora ($1b)
$08:af27  b3 4f         lda ($4f,s),y
$08:af29  35 cd         and $cd,x
$08:af2b  dc 12 64      jml [$6412]
$08:af2e  03 1f         ora $1f,s
$08:af30  d0 2e         bne $af60
$08:af32  01 dc         ora ($dc,x)
$08:af34  02 22         cop #$22
$08:af36  64 0e         stz $0e
$08:af38  ef 22 ec d0   sbc $d0ec22
$08:af3c  ef 42 f1 64   sbc $64f142
$08:af40  00 fd         brk #$fd
$08:af42  bd 21 e3      lda $e321,x
$08:af45  00 3f         brk #$3f
$08:af47  b1 54         lda ($54),y
$08:af49  ce ed 43      dec $43ed
$08:af4c  be 00 04      ldx $0400,y
$08:af4f  ea            nop
$08:af50  fc 54 a6      jsr ($a654,x)
$08:af53  63 bc         adc $bc,s
$08:af55  6e c2 fc      ror $fcc2
$08:af58  df 34 64 1e   cmp $1e6434,x
$08:af5c  e2 21         sep #$21
$08:af5e  1e b0 4e      asl $4eb0,x
$08:af61  f4 ff 60      pea $60ff
$08:af64  13 11         ora ($11,s),y
$08:af66  0c b0 12      tsb $12b0
$08:af69  20 01 23      jsr $2301
$08:af6c  54 4d ce      mvn $ce,$4d
$08:af6f  12 23         ora ($23)
$08:af71  2f ee 24 0e   and $0e24ee
$08:af75  58            cli
$08:af76  4e 03 ff      lsr $ff03
$08:af79  1f 12 11 cd   ora $cd1112,x
$08:af7d  33 54         and ($54,s),y
$08:af7f  00 f2         brk #$f2
$08:af81  20 24 df      jsr $df24
$08:af84  00 10         brk #$10
$08:af86  00 58         brk #$58
$08:af88  ff 43 ff ed   sbc $edff43,x
$08:af8c  12 11         ora ($11)
$08:af8e  f1 1f         sbc ($1f),y
$08:af90  44 20 d3      mvp $d3,$20
$08:af93  0a            asl a
$08:af94  02 f2         cop #$f2
$08:af96  4e e1 0f      lsr $0fe1
$08:af99  44 df 42      mvp $42,$df
$08:af9c  fd c3 41      sbc $41c3,x
$08:af9f  1f bd 20 34   ora $3420bd,x
$08:afa3  4e e2 fd      lsr $fde2
$08:afa6  0e f6 4a      asl $4af6
$08:afa9  af e4 34 01   lda $0134e4
$08:afad  00 ca         brk #$ca
$08:afaf  14 4e         trb $4e
$08:afb1  df fd f2 44   cmp $44f2fd,x
$08:afb5  30 df         bmi $af96
$08:afb7  f0 2f         beq $afe8
$08:afb9  02 1c         cop #$1c
$08:afbb  d2 11         cmp ($11)
$08:afbd  34 5e         bit $5e,x
$08:afbf  ee e1 10      inc $10e1
$08:afc2  0d 22 ff      ora $ff22
$08:afc5  ff 38 10 01   sbc $011038,x
$08:afc9  1e e0 d4      asl $d4e0,x
$08:afcc  10 2f         bpl $affd
$08:afce  d0 24         bne $aff4
$08:afd0  dd 04 0f      cmp $0f04,x
$08:afd3  40            rti
$08:afd4  e0 0f         cpx #$0f
$08:afd6  f1 30         sbc ($30),y
$08:afd8  20 0e 25      jsr $250e
$08:afdb  20 fd f4      jsr $f4fd
$08:afde  52 0f         eor ($0f)
$08:afe0  02 14         cop #$14
$08:afe2  1f ef 02 31   ora $3102ef,x
$08:afe6  f0 0d         beq $aff5
$08:afe8  e3 5f         sbc $5f,s
$08:afea  00 11         brk #$11
$08:afec  00 00         brk #$00
$08:afee  f1 10         sbc ($10),y
$08:aff0  11 00         ora ($00),y
$08:aff2  01 00         ora ($00,x)
$08:aff4  01 0f         ora ($0f,x)
$08:aff6  01 f0         ora ($f0,x)
$08:aff8  0f 00 01 0f   ora $0f0100
$08:affc  01 00         ora ($00,x)
$08:affe  00 00         brk #$00
$08:b000  00 00         brk #$00
$08:b002  00 00         brk #$00
$08:b004  00 e2         brk #$e2
$08:b006  02 00         cop #$00
$08:b008  00 00         brk #$00
$08:b00a  00 00         brk #$00
$08:b00c  00 00         brk #$00
$08:b00e  00 00         brk #$00
$08:b010  00 00         brk #$00
$08:b012  00 00         brk #$00
$08:b014  00 00         brk #$00
$08:b016  00 00         brk #$00
$08:b018  00 b0         brk #$b0
$08:b01a  00 00         brk #$00
$08:b01c  00 0f         brk #$0f
$08:b01e  b3 7b         lda ($7b,s),y
$08:b020  f4 f0 b0      pea $b0f0
$08:b023  0e 41 cf      asl $cf41
$08:b026  11 0e         ora ($0e),y
$08:b028  e0 11         cpx #$11
$08:b02a  ef b0 3e 01   sbc $013eb0
$08:b02e  c4 0d         cpy $0d
$08:b030  5c 00 e7 fb   jml $fbe700
$08:b034  b0 53         bcs $b089
$08:b036  93 00         sta ($00,s),y
$08:b038  f2 2e         sbc ($2e)
$08:b03a  11 01         ora ($01),y
$08:b03c  2e a0 d2      rol $d2a0
$08:b03f  2f 01 11 1e   and $1e1101
$08:b043  f1 13         sbc ($13),y
$08:b045  cd b0 5f      cmp $5fb0
$08:b048  d6 09         dec $09,x
$08:b04a  51 e1         eor ($e1),y
$08:b04c  10 13         bpl $b061
$08:b04e  e0 b0         cpx #$b0
$08:b050  22 eb 23 ce   jsl $ce23eb
$08:b054  3f d2 3e f1   and $f13ed2,x
$08:b058  b0 dd         bcs $b037
$08:b05a  44 cf 5f      mvp $5f,$cf
$08:b05d  01 e3         ora ($e3,x)
$08:b05f  0f 00 b0 22   ora $22b000
$08:b063  ee 4f f2      inc $f24f
$08:b066  2f d1 20 ff   and $ff20d1
$08:b06a  b0 00         bcs $b06c
$08:b06c  f2 0e         sbc ($0e)
$08:b06e  22 cf 20 ff   jsl $ff20cf
$08:b072  11 b0         ora ($b0),y
$08:b074  f2 f1         sbc ($f1)
$08:b076  1e 20 d0      asl $d020,x
$08:b079  3f 22 c4 a0   and $a0c422,x
$08:b07d  2c 42 d4      bit $d442
$08:b080  5b            tcd
$08:b081  d7 3f         cmp [$3f],y
$08:b083  fe 5f b4      inc $b45f,x
$08:b086  d3 10         cmp ($10,s),y
$08:b088  0d 04 fd      ora $fd04
$08:b08b  24 af         bit $af
$08:b08d  6d b0 f0      adc $f0b0
$08:b090  d2 2b         cmp ($2b)
$08:b092  2f 0e c4 1f   and $1fc40e
$08:b096  1f b0 f4 ef   ora $eff4b0,x
$08:b09a  3f 22 fe 30   and $30fe22,x
$08:b09e  c2 3e         rep #$3e
$08:b0a0  b0 02         bcs $b0a4
$08:b0a2  00 0f         brk #$0f
$08:b0a4  3e d3 02      rol $02d3,x
$08:b0a7  e1 30         sbc ($30,x)
$08:b0a9  b0 ef         bcs $b09a
$08:b0ab  2f 0f e3 2e   and $2ee30f
$08:b0af  0f 10 c1 b0   ora $b0c110
$08:b0b3  5f d0 10 f0   eor $f010d0,x
$08:b0b7  21 00         and ($00,x)
$08:b0b9  df 4f b0 c1   cmp $c1b04f,x
$08:b0bd  3d c5 1d      and $1dc5,x
$08:b0c0  0e 4f 01      asl $014f
$08:b0c3  b4 b0         ldy $b0,x
$08:b0c5  1b            tcs
$08:b0c6  13 de         ora ($de,s),y
$08:b0c8  13 0b         ora ($0b,s),y
$08:b0ca  36 de         rol $de,x
$08:b0cc  4e b0 d6      lsr $d6b0
$08:b0cf  4b            phk
$08:b0d0  f4 fc 03      pea $03fc
$08:b0d3  1f 2f e0 b0   ora $b0e02f,x
$08:b0d7  3d e3 d0      and $d0e3,x
$08:b0da  f0 01         beq $b0dd
$08:b0dc  2f 00 00 b0   and $b00000
$08:b0e0  01 f0         ora ($f0,x)
$08:b0e2  31 0e         and ($0e),y
$08:b0e4  e3 1c         sbc $1c,s
$08:b0e6  03 ee         ora $ee,s
$08:b0e8  b0 01         bcs $b0eb
$08:b0ea  2f f2 02 0d   and $0d02f2
$08:b0ee  43 e0         eor $e0,s
$08:b0f0  02 b0         cop #$b0
$08:b0f2  0e 0f 01      asl $010f
$08:b0f5  0c 25 b0      tsb $b025
$08:b0f8  32 e0         and ($e0)
$08:b0fa  a0 6b 2e      ldy #$2e6b
$08:b0fd  25 ad         and $ad
$08:b0ff  5f 01 c2 5f   eor $5fc201,x
$08:b103  b0 f1         bcs $b0f6
$08:b105  20 f2 10      jsr $10f2
$08:b108  2d 12 d2      and $d212
$08:b10b  4f b0 03 fe   eor $fe03b0
$08:b10f  13 d1         ora ($d1,s),y
$08:b111  1f 0e 21 c0   ora $c0210e,x
$08:b115  b0 4c         bcs $b163
$08:b117  d4 1d         pei ($1d)
$08:b119  01 f1         ora ($f1,x)
$08:b11b  4c c5 1d      jmp $1dc5
$08:b11e  a0 16 fb      ldy #$fb16
$08:b121  02 4d         cop #$4d
$08:b123  f3 a4         sbc ($a4,s),y
$08:b125  5b            tcd
$08:b126  04 b0         tsb $b0
$08:b128  2d 05 ff      and $ff05
$08:b12b  12 2f         ora ($2f)
$08:b12d  22 e0 1d a0   jsl $a01de0
$08:b131  e6 0e         inc $0e
$08:b133  2e 23 c1      rol $c123
$08:b136  0f 3d d4 b0   ora $b0d43d
$08:b13a  e0 30 e1      cpx #$e130
$08:b13d  f1 3f         sbc ($3f),y
$08:b13f  f5 1e         sbc $1e,x
$08:b141  f0 a0         beq $b0e3
$08:b143  20 ee 50      jsr $50ee
$08:b146  b2 4f         lda ($4f)
$08:b148  c1 6e         cmp ($6e,x)
$08:b14a  a3 a0         lda $a0,s
$08:b14c  01 29         ora ($29,x)
$08:b14e  40            rti
$08:b14f  c6 cd         dec $cd
$08:b151  22 b3 3a a0   jsl $a03ab3
$08:b155  40            rti
$08:b156  01 cf         ora ($cf,x)
$08:b158  20 cf 6e      jsr $6ecf
$08:b15b  f0 b2         beq $b10f
$08:b15d  a0 4f de      ldy #$de4f
$08:b160  00 f1         brk #$f1
$08:b162  0f 12 30 c3   ora $c33012
$08:b166  a0 2a 43      ldy #$432a
$08:b169  c1 4b         cmp ($4b,x)
$08:b16b  f3 12         sbc ($12,s),y
$08:b16d  0e ef b0      asl $b0ef
$08:b170  13 ff         ora ($ff,s),y
$08:b172  4f d3 fd 11   eor $11fdd3
$08:b176  e0 20 a0      cpx #$a020
$08:b179  d2 2c         cmp ($2c)
$08:b17b  05 0c         ora $0c
$08:b17d  e2 2e         sep #$2e
$08:b17f  ff 05 a0 0d   sbc $0da005,x
$08:b183  f2 1e         sbc ($1e)
$08:b185  f5 bf         sbc $bf,x
$08:b187  71 0e         adc ($0e),y
$08:b189  03 90         ora $90,s
$08:b18b  f0 2a         beq $b1b7
$08:b18d  44 9d 64      mvp $64,$9d
$08:b190  fb            xce
$08:b191  f7 2e         sbc [$2e],y
$08:b193  a0 2f e2      ldy #$e22f
$08:b196  2f f1 ed 41   and $41edf1
$08:b19a  b2 0f         lda ($0f)
$08:b19c  a0 fd 5c      ldy #$5cfd
$08:b19f  04 be         tsb $be
$08:b1a1  31 b0         and ($b0),y
$08:b1a3  31 ee         and ($ee),y
$08:b1a5  a0 00 f0      ldy #$f000
$08:b1a8  0f 0e f2 f1   ora $f1f20e
$08:b1ac  fd 40 a0      sbc $a040,x
$08:b1af  f1 10         sbc ($10),y
$08:b1b1  21 b3         and ($b3,x)
$08:b1b3  31 e0         and ($e0),y
$08:b1b5  30 3e         bmi $b1f5
$08:b1b7  90 00         bcc $b1b9
$08:b1b9  d0 3d         bne $b1f8
$08:b1bb  d2 02         cmp ($02)
$08:b1bd  2f ee 41 90   and $9041ee
$08:b1c1  90 2d         bcc $b1f0
$08:b1c3  45 be         eor $be
$08:b1c5  70 0d         bvs $b1d4
$08:b1c7  15 d1         ora $d1,x
$08:b1c9  a0 2f 32      ldy #$322f
$08:b1cc  fc 25 c2      jsr ($c225,x)
$08:b1cf  0d 5f d0      ora $d05f
$08:b1d2  90 f0         bcc $b1c4
$08:b1d4  bf 2f fe 9d   lda $9dfe2f,x
$08:b1d8  51 c2         eor ($c2),y
$08:b1da  2a            rol a
$08:b1db  90 c3         bcc $b1a0
$08:b1dd  f0 e0         beq $b1bf
$08:b1df  3f 03 3d 06   and $063d03,x
$08:b1e3  f0 90         beq $b175
$08:b1e5  5d f3 6b      eor $6bf3,x
$08:b1e8  25 d2         and $d2
$08:b1ea  50 d5         bvc $b1c1
$08:b1ec  3b            tsc
$08:b1ed  a0 04 2c      ldy #$2c04
$08:b1f0  f4 0e 32      pea $320e
$08:b1f3  d0 4f         bne $b244
$08:b1f5  d2 a0         cmp ($a0)
$08:b1f7  2d f3 bd      and $bdf3
$08:b1fa  5f ed 31 02   eor $0231ed,x
$08:b1fe  e0 90 15      cpx #$1590
$08:b201  fa            plx
$08:b202  34 b0         bit $b0,x
$08:b204  6d d3 fe      adc $fed3
$08:b207  f0 90         beq $b199
$08:b209  10 20         bpl $b22b
$08:b20b  b0 3f         bcs $b24c
$08:b20d  b3 fe         lda ($fe,s),y
$08:b20f  4c 05 90      jmp $9005
$08:b212  bf 4b 3f d4   lda $d43f4b,x
$08:b216  1e f0 01      asl $01f0,x
$08:b219  2e 90 e3      rol $e390
$08:b21c  fd 11 13      sbc $1311,x
$08:b21f  fb            xce
$08:b220  26 ec         rol $ec
$08:b222  20 90 f3      jsr $f390
$08:b225  1b            tcs
$08:b226  13 d2         ora ($d2,s),y
$08:b228  3c 02 e0      bit $e002,x
$08:b22b  de 90 44      dec $4490,x
$08:b22e  de 4e f3      dec $f34e,x
$08:b231  0e 22 df      asl $df22
$08:b234  52 90         eor ($90)
$08:b236  b2 4a         lda ($4a)
$08:b238  e6 1d         inc $1d
$08:b23a  d0 20         bne $b25c
$08:b23c  1b            tcs
$08:b23d  c4 90         cpy $90
$08:b23f  1b            tcs
$08:b240  e6 ee         inc $ee
$08:b242  4c 14 df      jmp $df14
$08:b245  ef 3f 90 c0   sbc $c0903f
$08:b249  1c e5 19      trb $19e5
$08:b24c  06 ed         asl $ed
$08:b24e  42 bf         wdm #$bf
$08:b250  90 3f         bcc $b291
$08:b252  f1 01         sbc ($01),y
$08:b254  ff 31 e1 0f   sbc $0fe131,x
$08:b258  40            rti
$08:b259  80 32         bra $b28d
$08:b25b  c2 24         rep #$24
$08:b25d  c0 1c 4d      cpy #$4d1c
$08:b260  f2 12         sbc ($12)
$08:b262  90 fe         bcc $b262
$08:b264  f3 2d         sbc ($2d,s),y
$08:b266  04 fd         tsb $fd
$08:b268  21 d1         and ($d1,x)
$08:b26a  4e 80 b3      lsr $b380
$08:b26d  f0 4f         beq $b2be
$08:b26f  d3 e4         cmp ($e4,s),y
$08:b271  fc 5b 41      jsr ($415b,x)
$08:b274  90 d1         bcc $b247
$08:b276  30 c3         bmi $b23b
$08:b278  1e 01 d1      asl $d101,x
$08:b27b  2d 03 80      and $8003
$08:b27e  ea            nop
$08:b27f  55 bb         eor $bb,x
$08:b281  34 ee         bit $ee,x
$08:b283  2e d1 3c      rol $3cd1
$08:b286  90 e2         bcc $b26a
$08:b288  ff 22 a0 4f   sbc $4fa022,x
$08:b28c  0d 42 c3      ora $c342
$08:b28f  90 3c         bcc $b2cd
$08:b291  12 d2         ora ($d2)
$08:b293  1e f3 1c      asl $1cf3,x
$08:b296  14 0e         trb $0e
$08:b298  80 05         bra $b29f
$08:b29a  3c e1 e1      bit $e1e1,x
$08:b29d  3b            tsc
$08:b29e  f4 2b f6      pea $f62b
$08:b2a1  80 d0         bra $b273
$08:b2a3  35 ce         and $ce,x
$08:b2a5  20 6a 00      jsr $006a
$08:b2a8  15 ce         ora $ce,x
$08:b2aa  80 24         bra $b2d0
$08:b2ac  fe 11 10      inc $1011,x
$08:b2af  ff ff 53 af   sbc $af53ff,x
$08:b2b3  80 2f         bra $b2e4
$08:b2b5  5f cf 02 0e   eor $0e02cf,x
$08:b2b9  e2 2e         sep #$2e
$08:b2bb  fc 90 f2      jsr ($f290,x)
$08:b2be  fc d5 fa      jsr ($fad5,x)
$08:b2c1  0f ff 21 d0   ora $d021ff
$08:b2c5  80 3f         bra $b306
$08:b2c7  3f b2 3e d0   and $d03eb2,x
$08:b2cb  40            rti
$08:b2cc  ed 44 90      sbc $9044
$08:b2cf  f1 1e         sbc ($1e),y
$08:b2d1  f4 20 f3      pea $f320
$08:b2d4  01 5f         ora ($5f,x)
$08:b2d6  e1 84         sbc ($84,x)
$08:b2d8  3c b5 2f      bit $2fb5,x
$08:b2db  ef 20 1f 0f   sbc $0f1f20
$08:b2df  f3 91         sbc ($91,s),y
$08:b2e1  10 10         bpl $b2f3
$08:b2e3  f2 3d         sbc ($3d)
$08:b2e5  f4 fe 30      pea $30fe
$08:b2e8  d3 96         cmp ($96,s),y
$08:b2ea  03 02         ora $02,s
$08:b2ec  00 00         brk #$00
$08:b2ee  00 00         brk #$00
$08:b2f0  00 00         brk #$00
$08:b2f2  00 00         brk #$00
$08:b2f4  92 ad         sta ($ad)
$08:b2f6  03 44         ora $44,s
$08:b2f8  43 21         eor $21,s
$08:b2fa  00 ff         brk #$ff
$08:b2fc  f0 7a         beq $b378
$08:b2fe  04 de         tsb $de
$08:b300  32 e2         and ($e2)
$08:b302  0d 41 04      ora $0441
$08:b305  0e 8a 2f      asl $2f8a
$08:b308  d0 0e         bne $b318
$08:b30a  de 10 40      dec $4010,x
$08:b30d  03 1e         ora $1e,s
$08:b30f  7a            ply
$08:b310  13 ce         ora ($ce,s),y
$08:b312  dc f0 d1      jml [$d1f0]
$08:b315  03 2f         ora $2f,s
$08:b317  22 6a 04 22   jsl $22046a
$08:b31b  1d e1 05      ora $05e1,x
$08:b31e  e5 40         sbc $40
$08:b320  70 7a         bvs $b39c
$08:b322  ff ce cb fc   sbc $fccbce,x
$08:b326  f4 36 33      pea $3336
$08:b329  fd 7a 5c      sbc $5c7a,x
$08:b32c  fe ea de      inc $deea,x
$08:b32f  2d 23 20      and $2023
$08:b332  33 7a         and ($7a,s),y
$08:b334  f1 21         sbc ($21),y
$08:b336  e3 ed         sbc $ed,s
$08:b338  40            rti
$08:b339  d6 2f         dec $2f,x
$08:b33b  4f 8a f1 fe   eor $fef18a
$08:b33f  bf fd 03 33   lda $3303fd,x
$08:b343  20 01 8a      jsr $8a01
$08:b346  fe 1e df      inc $df1e,x
$08:b349  ef 00 21 02   sbc $022100
$08:b34d  11 7a         ora ($7a),y
$08:b34f  f2 00         sbc ($00)
$08:b351  00 10         brk #$10
$08:b353  d4 30         pei ($30)
$08:b355  12 12         ora ($12)
$08:b357  8a            txa
$08:b358  e0 ef dd      cpx #$ddef
$08:b35b  fe 13 24      inc $2413,x
$08:b35e  2f 1f 8a 00   and $008a1f
$08:b362  ef cf fe 01   sbc $01fecf
$08:b366  03 20         ora $20,s
$08:b368  20 7a 02      jsr $027a
$08:b36b  e6 dd         inc $dd
$08:b36d  2e 06 1e      rol $1e06
$08:b370  44 e1 8a      mvp $8a,$e1
$08:b373  0d 1c c0      ora $c01c
$08:b376  ec 23 26      cpx $2623
$08:b379  3e 10 8a      rol $8a10,x
$08:b37c  e1 df         sbc ($df,x)
$08:b37e  dc fe 13      jml [$13fe]
$08:b381  02 11         cop #$11
$08:b383  21 6a         and ($6a,x)
$08:b385  3f c0 f2 f2   and $f2f2c0,x
$08:b389  15 45         ora $45,x
$08:b38b  06 2b         asl $2b
$08:b38d  8a            txa
$08:b38e  0f ed de ee   ora $eedeed
$08:b392  32 36         and ($36)
$08:b394  10 0e         bpl $b3a4
$08:b396  8a            txa
$08:b397  01 dd         ora ($dd,x)
$08:b399  dc 00 02      jml [$0200]
$08:b39c  11 13         ora ($13),y
$08:b39e  10 7a         bpl $b41a
$08:b3a0  2f f4 dd 22   and $22ddf4
$08:b3a4  f1 60         sbc ($60),y
$08:b3a6  12 2f         ora ($2f)
$08:b3a8  8a            txa
$08:b3a9  0e dc fd      asl $fddc
$08:b3ac  d0 14         bne $b3c2
$08:b3ae  54 3e 0f      mvn $0f,$3e
$08:b3b1  7a            ply
$08:b3b2  ff ac 9b a0   sbc $a09bac,x
$08:b3b6  22 43 65 01   jsl $016543
$08:b3ba  7a            ply
$08:b3bb  3d 11 de      and $de11,x
$08:b3be  20 23 12      jsr $1223
$08:b3c1  31 20         and ($20),y
$08:b3c3  8a            txa
$08:b3c4  fe dc dd      inc $dddc,x
$08:b3c7  f0 24         beq $b3ed
$08:b3c9  63 2f         adc $2f,s
$08:b3cb  ff 8a e0 fd   sbc $fde08a,x
$08:b3cf  dc ef 12      jml [$12ef]
$08:b3d2  33 11         and ($11,s),y
$08:b3d4  10 7a         bpl $b450
$08:b3d6  11 1e         ora ($1e),y
$08:b3d8  f1 d4         sbc ($d4),y
$08:b3da  2e 55 e4      rol $e455
$08:b3dd  0f 8a 0c dd   ora $dd0c8a
$08:b3e1  ce f0 45      dec $45f0
$08:b3e4  43 10         eor $10,s
$08:b3e6  c2 8a         rep #$8a
$08:b3e8  0e ed ca      asl $caed
$08:b3eb  00 13         brk #$13
$08:b3ed  22 31 11 7a   jsl $7a1131
$08:b3f1  00 e0         brk #$e0
$08:b3f3  0e 00 23      asl $2300
$08:b3f6  34 13         bit $13,x
$08:b3f8  0e 8a fd      asl $fd8a
$08:b3fb  dd bd 1f      cmp $1fbd,x
$08:b3fe  72 63         adc ($63)
$08:b400  ff 01 8a 0e   sbc $0e8a01,x
$08:b404  da            phx
$08:b405  de ef 12      dec $12ef,x
$08:b408  53 21         eor ($21,s),y
$08:b40a  f0 7a         beq $b486
$08:b40c  22 e0 0f e2   jsl $e20fe0
$08:b410  25 21         and $21
$08:b412  41 0f         eor ($0f,x)
$08:b414  8a            txa
$08:b415  de dc ce      dec $cedc,x
$08:b418  02 35         cop #$35
$08:b41a  52 0f         eor ($0f)
$08:b41c  10 8a         bpl $b3a8
$08:b41e  0d bd cc      ora $ccbd
$08:b421  f0 33         beq $b456
$08:b423  32 11         and ($11)
$08:b425  11 7a         ora ($7a),y
$08:b427  0f e5 ec f3   ora $f3ece5
$08:b42b  21 36         and ($36,x)
$08:b42d  20 4c 8a      jsr $8a4c
$08:b430  de cd cd      dec $cdcd,x
$08:b433  f2 46         sbc ($46)
$08:b435  62 0f 0f      per $c347
$08:b438  8a            txa
$08:b439  fe ea bd      inc $bdea,x
$08:b43c  f1 24         sbc ($24),y
$08:b43e  32 10         and ($10)
$08:b440  21 7a         and ($7a,x)
$08:b442  f1 e1         sbc ($e1),y
$08:b444  ef 2f 24 25   sbc $25242f
$08:b448  30 1d         bmi $b467
$08:b44a  8a            txa
$08:b44b  dd dd ce      cmp $cedd,x
$08:b44e  f0 57         beq $b4a7
$08:b450  53 0e         eor ($0e,s),y
$08:b452  1f 8a fe bb   ora $bbfe8a,x
$08:b456  cd f2 23      cmp $23f2
$08:b459  14 21         trb $21
$08:b45b  01 7a         ora ($7a,x)
$08:b45d  e3 0f         sbc $0f,s
$08:b45f  ed 02 43      sbc $4302
$08:b462  33 40         and ($40,s),y
$08:b464  e4 8a         cpx $8a
$08:b466  be cc dd      ldx $ddcc,y
$08:b469  f2 37         sbc ($37)
$08:b46b  72 1e         adc ($1e)
$08:b46d  00 8a         brk #$8a
$08:b46f  ee bb cc      inc $ccbb
$08:b472  f1 35         sbc ($35),y
$08:b474  21 40         and ($40,x)
$08:b476  10 7a         bpl $b4f2
$08:b478  00 d2         brk #$d2
$08:b47a  fd 31 05      sbc $0531,x
$08:b47d  33 30         and ($30,s),y
$08:b47f  2e 9a ee      rol $ee9a
$08:b482  ff df 01 23   sbc $2301df,x
$08:b486  31 00         and ($00),y
$08:b488  f0 8a         beq $b414
$08:b48a  1c bb cb      trb $cbbb
$08:b48d  02 33         cop #$33
$08:b48f  41 21         eor ($21,x)
$08:b491  01 7a         ora ($7a,x)
$08:b493  3f c0 fe 24   and $24fec0,x
$08:b497  12 34         ora ($34)
$08:b499  22 1b 8a ec   jsl $ec8a1b
$08:b49d  cd ed e2      cmp $e2ed
$08:b4a0  47 72         eor [$72]
$08:b4a2  0f f0 8a fe   ora $fe8af0
$08:b4a6  ab            plb
$08:b4a7  bd d3 43      lda $43d3,x
$08:b4aa  33 12         and ($12,s),y
$08:b4ac  00 7a         brk #$7a
$08:b4ae  02 fe         cop #$fe
$08:b4b0  fd 23 05      sbc $0523,x
$08:b4b3  40            rti
$08:b4b4  51 1d         eor ($1d),y
$08:b4b6  8a            txa
$08:b4b7  cd dd cd      cmp $cddd
$08:b4ba  12 36         ora ($36)
$08:b4bc  63 0e         adc $0e,s
$08:b4be  11 8a         ora ($8a),y
$08:b4c0  dd ac cc      cmp $ccac,x
$08:b4c3  01 24         ora ($24,x)
$08:b4c5  33 20         and ($20,s),y
$08:b4c7  10 7a         bpl $b543
$08:b4c9  22 dd d2 30   jsl $30d2dd
$08:b4cd  33 23         and ($23,s),y
$08:b4cf  23 1c         and $1c,s
$08:b4d1  9a            txs
$08:b4d2  fe ee e0      inc $e0ee,x
$08:b4d5  00 23         brk #$23
$08:b4d7  32 0f         and ($0f)
$08:b4d9  10 8a         bpl $b465
$08:b4db  eb            xba
$08:b4dc  ad bc f1      lda $f1bc
$08:b4df  44 23 21      mvp $21,$23
$08:b4e2  1f 7a 23 df   ora $df237a,x
$08:b4e6  ee 20 33      inc $3320
$08:b4e9  44 12 1c      mvp $1c,$12
$08:b4ec  8a            txa
$08:b4ed  ec dd be      cpx $bedd
$08:b4f0  11 26         ora ($26),y
$08:b4f2  74 1f         stz $1f,x
$08:b4f4  f0 8a         beq $b480
$08:b4f6  de bb cb      dec $cbbb,x
$08:b4f9  00 44         brk #$44
$08:b4fb  22 22 20 7a   jsl $7a2022
$08:b4ff  00 c0         brk #$c0
$08:b501  ef 50 31 34   sbc $343150
$08:b505  21 3c         and ($3c,x)
$08:b507  9a            txs
$08:b508  fe ef ef      inc $efef,x
$08:b50b  0f 24 31 10   ora $103124
$08:b50f  00 8a         brk #$8a
$08:b511  fb            xce
$08:b512  ba            tsx
$08:b513  be e1 33      ldx $33e1,y
$08:b516  43 21         eor $21,s
$08:b518  10 7a         bpl $b594
$08:b51a  01 cf         ora ($cf,x)
$08:b51c  00 31         brk #$31
$08:b51e  22 24 21 1d   jsl $1d2124
$08:b522  8a            txa
$08:b523  ed db ee      sbc $eedb
$08:b526  ff 47 54 20   sbc $205447,x
$08:b52a  0e 8a fc      asl $fc8a
$08:b52d  da            phx
$08:b52e  ad e0 53      lda $53e0
$08:b531  42 12         wdm #$12
$08:b533  02 7a         cop #$7a
$08:b535  2c d2 c0      bit $c0d2
$08:b538  36 e1         rol $e1,x
$08:b53a  50 42         bvc $b57e
$08:b53c  2d 9a 0d      and $0d9a
$08:b53f  ee ff f0      inc $f0ff
$08:b542  23 32         and $32,s
$08:b544  2f f0 8a fe   and $fe8af0
$08:b548  ba            tsx
$08:b549  ac 00 34      ldy $3400
$08:b54c  33 21         and ($21,s),y
$08:b54e  10 7a         bpl $b5ca
$08:b550  f1 f0         sbc ($f0),y
$08:b552  ef 31 05 5f   sbc $5f0531
$08:b556  31 2e         and ($2e),y
$08:b558  8a            txa
$08:b559  de cd ce      dec $cecd,x
$08:b55c  e2 35         sep #$35
$08:b55e  63 12         adc $12,s
$08:b560  f0 8a         beq $b4ec
$08:b562  fc cc ac      jsr ($accc,x)
$08:b565  d1 24         cmp ($24),y
$08:b567  42 22         wdm #$22
$08:b569  2f 6a 22 db   and $db226a
$08:b56d  c2 31         rep #$31
$08:b56f  76 26         ror $26,x
$08:b571  45 2d         eor $2d
$08:b573  8a            txa
$08:b574  ec cd ee      cpx $eecd
$08:b577  e0 45 44      cpx #$4445
$08:b57a  40            rti
$08:b57b  f0 8a         beq $b507
$08:b57d  df ca bb e1   cmp $e1bbca,x
$08:b581  24 43         bit $43
$08:b583  20 11 7a      jsr $7a11
$08:b586  2e 0e e2      rol $e20e
$08:b589  03 21         ora $21,s
$08:b58b  25 f4         and $f4
$08:b58d  1e 8a ed      asl $ed8a,x
$08:b590  dd cf ef      cmp $efcf,x
$08:b593  26 55         rol $55
$08:b595  40            rti
$08:b596  0e 8a ee      asl $ee8a
$08:b599  cb            wai
$08:b59a  ad ff 23      lda $23ff
$08:b59d  23 41         and $41,s
$08:b59f  20 7a 01      jsr $017a
$08:b5a2  ee ff 24      inc $24ff
$08:b5a5  01 51         ora ($51,x)
$08:b5a7  13 1f         ora ($1f,s),y
$08:b5a9  8a            txa
$08:b5aa  fc dd de      jsr ($dedd,x)
$08:b5ad  ef 25 55 50   sbc $505525
$08:b5b1  fe 8a ff      inc $ff8a,x
$08:b5b4  ba            tsx
$08:b5b5  cb            wai
$08:b5b6  e0 33 32      cpx #$3233
$08:b5b9  21 30         and ($30,x)
$08:b5bb  7a            ply
$08:b5bc  11 d0         ora ($d0),y
$08:b5be  e0 3f 32      cpx #$323f
$08:b5c1  f5 13         sbc $13,x
$08:b5c3  4f 8a ee bd   eor $bdee8a
$08:b5c7  de ef 33      dec $33ef,x
$08:b5ca  56 40         lsr $40,x
$08:b5cc  0f 8a fe bd   ora $bdfe8a
$08:b5d0  ba            tsx
$08:b5d1  d0 23         bne $b5f6
$08:b5d3  33 22         and ($22,s),y
$08:b5d5  20 6a 11      jsr $116a
$08:b5d8  00 ce         brk #$ce
$08:b5da  f1 64         sbc ($64),y
$08:b5dc  65 35         adc $35
$08:b5de  5e 9a 0e      lsr $0e9a,x
$08:b5e1  ef ee 1f 01   sbc $011fee
$08:b5e5  35 10         and $10,x
$08:b5e7  0f 8a ff cb   ora $cbff8a
$08:b5eb  bc de 33      ldy $33de,x
$08:b5ee  32 23         and ($23)
$08:b5f0  10 7a         bpl $b66c
$08:b5f2  32 c1         and ($c1)
$08:b5f4  d0 03         bne $b5f9
$08:b5f6  f3 41         sbc ($41,s),y
$08:b5f8  32 11         and ($11)
$08:b5fa  8a            txa
$08:b5fb  fe dc de      inc $dedc,x
$08:b5fe  d0 02         bne $b602
$08:b600  56 43         lsr $43,x
$08:b602  2e 8a ee      rol $ee8a
$08:b605  da            phx
$08:b606  cc cf 12      cpy $12cf
$08:b609  43 22         eor $22,s
$08:b60b  13 7a         ora ($7a,s),y
$08:b60d  1c 11 cf      trb $cf11
$08:b610  1f 35 12 4e   ora $4e1235,x
$08:b614  33 8a         and ($8a,s),y
$08:b616  ef cd dd ff   sbc $ffddcd
$08:b61a  e3 55         sbc $55,s
$08:b61c  63 1e         adc $1e,s
$08:b61e  8a            txa
$08:b61f  d0 cb         bne $b5ec
$08:b621  cb            wai
$08:b622  c0 02 43      cpy #$4302
$08:b625  22 21 7a 11   jsl $117a21
$08:b629  ed f2 f2      sbc $f2f2
$08:b62c  21 24         and ($24,x)
$08:b62e  02 20         cop #$20
$08:b630  9a            txs
$08:b631  00 ee         brk #$ee
$08:b633  fe ff 10      inc $10ff,x
$08:b636  23 40         and $40,s
$08:b638  40            rti
$08:b639  9a            txs
$08:b63a  b0 ed         bcs $b629
$08:b63c  de e0 12      dec $12e0,x
$08:b63f  22 10 11 7a   jsl $7a1110
$08:b643  3b            tsc
$08:b644  e1 df         sbc ($df,x)
$08:b646  33 07         and ($07,s),y
$08:b648  0f 51 13 9a   ora $9a1351
$08:b64c  fe ef fe      inc $feef,x
$08:b64f  e0 12 42      cpx #$4212
$08:b652  22 ff 8a ed   jsl $ed8aff
$08:b656  da            phx
$08:b657  bc c0 23      ldy $23c0,x
$08:b65a  34 32         bit $32,x
$08:b65c  10 7a         bpl $b6d8
$08:b65e  4e ff ce      lsr $ceff
$08:b661  44 06 0f      mvp $0f,$06
$08:b664  60            rts
$08:b665  13 9a         ora ($9a,s),y
$08:b667  fe fe ee      inc $eefe,x
$08:b66a  00 01         brk #$01
$08:b66c  53 21         eor ($21,s),y
$08:b66e  e0 8a ed      cpx #$ed8a
$08:b671  db            stp
$08:b672  ac df 23      ldy $23df
$08:b675  34 42         bit $42,x
$08:b677  10 7b         bpl $b6f4
$08:b679  2c 01 de      bit $de01
$08:b67c  33 07         and ($07,s),y
$08:b67e  0f 61 02 51   ora $510261
$08:b682  00 02         brk #$02
$08:b684  00 00         brk #$00
$08:b686  00 00         brk #$00
$08:b688  00 00         brk #$00
$08:b68a  00 00         brk #$00
$08:b68c  ca            dex
$08:b68d  0f 30 0f 0e   ora $0e0f30
$08:b691  ef 43 0f 00   sbc $000f43
$08:b695  8a            txa
$08:b696  eb            xba
$08:b697  20 01 10      jsr $1001
$08:b69a  26 5d         rol $5d
$08:b69c  ba            tsx
$08:b69d  d2 8a         cmp ($8a)
$08:b69f  4f fe de ee   eor $eedefe
$08:b6a3  ed f3 1e      sbc $1ef3
$08:b6a6  f4 ca 01      pea $01ca
$08:b6a9  00 00         brk #$00
$08:b6ab  fe ef 34      inc $34ef,x
$08:b6ae  0f 00 8a 0c   ora $0c8a00
$08:b6b2  4a            lsr a
$08:b6b3  01 01         ora ($01,x)
$08:b6b5  26 5e         rol $5e
$08:b6b7  aa            tax
$08:b6b8  d2 8a         cmp ($8a)
$08:b6ba  4f fe de ee   eor $eedefe
$08:b6be  ed f3 1e      sbc $1ef3
$08:b6c1  04 ca         tsb $ca
$08:b6c3  01 00         ora ($00,x)
$08:b6c5  00 fe         brk #$fe
$08:b6c7  ef 34 0f 00   sbc $000f34
$08:b6cb  8b            phb
$08:b6cc  0c 4b 01      tsb $014b
$08:b6cf  00 27         brk #$27
$08:b6d1  5d aa d3      eor $d3aa,x
$08:b6d4  80 04         bra $b6da
$08:b6d6  02 00         cop #$00
$08:b6d8  00 00         brk #$00
$08:b6da  00 00         brk #$00
$08:b6dc  00 00         brk #$00
$08:b6de  00 96         brk #$96
$08:b6e0  9f ff f0 11   sta $11f0ff,x
$08:b6e4  00 00         brk #$00
$08:b6e6  00 00         brk #$00
$08:b6e8  6a            ror a
$08:b6e9  3f 00 fc ff   and $fffc00,x
$08:b6ed  00 ff         brk #$ff
$08:b6ef  02 0c         cop #$0c
$08:b6f1  6a            ror a
$08:b6f2  04 41         tsb $41
$08:b6f4  01 22         ora ($22,x)
$08:b6f6  00 03         brk #$03
$08:b6f8  56 53         lsr $53,x
$08:b6fa  7a            ply
$08:b6fb  11 0f         ora ($0f),y
$08:b6fd  f1 34         sbc ($34),y
$08:b6ff  33 22         and ($22,s),y
$08:b701  11 12         ora ($12),y
$08:b703  6a            ror a
$08:b704  56 63         lsr $63,x
$08:b706  02 31         cop #$31
$08:b708  f0 24         beq $b72e
$08:b70a  3f f4 7a 31   and $317af4,x
$08:b70e  f1 0f         sbc ($0f),y
$08:b710  dc df 0f      jml [$0fdf]
$08:b713  fe ef 7a      inc $7aef,x
$08:b716  fe bb bb      inc $bbbb,x
$08:b719  bc f2 31      ldy $31f2,x
$08:b71c  ec cc 76      cpx $76cc
$08:b71f  fc bd ef      jsr ($efbd,x)
$08:b722  f0 00         beq $b724
$08:b724  ed df f0      sbc $f0df
$08:b727  6a            ror a
$08:b728  02 0e         cop #$0e
$08:b72a  ee ff 0f      inc $0fff
$08:b72d  01 36         ora ($36,x)
$08:b72f  66 7a         ror $7a
$08:b731  23 44         and $44,s
$08:b733  22 33 33 55   jsl $553333
$08:b737  77 51         adc [$51],y
$08:b739  7a            ply
$08:b73a  00 02         brk #$02
$08:b73c  34 67         bit $67,x
$08:b73e  64 32         stz $32
$08:b740  21 12         and ($12,x)
$08:b742  6a            ror a
$08:b743  54 34 53      mvn $53,$34
$08:b746  10 0f         bpl $b757
$08:b748  00 01         brk #$01
$08:b74a  22 7a 0f ed   jsl $ed0f7a
$08:b74e  dd cd de      cmp $decd,x
$08:b751  dd cc cc      cmp $cccc,x
$08:b754  8a            txa
$08:b755  dc cd ee      jml [$eecd]
$08:b758  f0 10         beq $b76a
$08:b75a  ed dd de      sbc $dedd
$08:b75d  66 dc         ror $dc
$08:b75f  e2 46         sep #$46
$08:b761  77 65         adc [$65],y
$08:b763  44 44 30      mvp $30,$44
$08:b766  6a            ror a
$08:b767  ac 00 ed      ldy $ed00
$08:b76a  f0 fe         beq $b76a
$08:b76c  f0 34         beq $b7a2
$08:b76e  42 7a         wdm #$7a
$08:b770  22 20 11 24   jsl $241120
$08:b774  76 54         ror $54,x
$08:b776  31 ff         and ($ff),y
$08:b778  7a            ply
$08:b779  12 35         ora ($35)
$08:b77b  76 64         ror $64,x
$08:b77d  33 32         and ($32,s),y
$08:b77f  12 21         ora ($21)
$08:b781  7a            ply
$08:b782  23 32         and $32,s
$08:b784  34 21         bit $21,x
$08:b786  12 32         ora ($32)
$08:b788  23 32         and $32,s
$08:b78a  7a            ply
$08:b78b  00 02         brk #$02
$08:b78d  10 f1         bpl $b780
$08:b78f  21 00         and ($00,x)
$08:b791  fe cb 7a      inc $7acb,x
$08:b794  cd 01 22      cmp $2201
$08:b797  31 fd         and ($fd),y
$08:b799  cc cd de      cpy $decd
$08:b79c  7a            ply
$08:b79d  e0 0f ef      cpx #$ef0f
$08:b7a0  ff ff dc cd   sbc $cddcff,x
$08:b7a4  dd 7a de      cmp $de7a,x
$08:b7a7  fe dc cd      inc $cddc,x
$08:b7aa  dd df ff      cmp $ffdf,x
$08:b7ad  ee 7a dc      inc $dc7a
$08:b7b0  df 02 34 2f   cmp $2f3402,x
$08:b7b4  ed cc e0      sbc $e0cc
$08:b7b7  7a            ply
$08:b7b8  13 34         ora ($34,s),y
$08:b7ba  33 21         and ($21,s),y
$08:b7bc  00 10         brk #$10
$08:b7be  ff 23 6a 64   sbc $646a23,x
$08:b7c2  53 32         eor ($32,s),y
$08:b7c4  23 66         and $66,s
$08:b7c6  54 44 42      mvn $42,$44
$08:b7c9  6a            ror a
$08:b7ca  22 32 34 46   jsl $463432
$08:b7ce  42 ec         wdm #$ec
$08:b7d0  cd df 7a      cmp $7adf
$08:b7d3  23 44         and $44,s
$08:b7d5  43 20         eor $20,s
$08:b7d7  0f ff 02 22   ora $2202ff
$08:b7db  6a            ror a
$08:b7dc  44 45 54      mvp $54,$45
$08:b7df  21 1e         and ($1e,x)
$08:b7e1  df 21 01 7a   cmp $7a0121,x
$08:b7e5  00 ff         brk #$ff
$08:b7e7  ed de f0      sbc $f0de
$08:b7ea  00 ed         brk #$ed
$08:b7ec  cc 7a ce      cpy $ce7a
$08:b7ef  12 21         ora ($21)
$08:b7f1  0d bb bb      ora $bbbb
$08:b7f4  cd f0 7a      cmp $7af0
$08:b7f7  10 00         bpl $b7f9
$08:b7f9  fe ed cc      inc $cced,x
$08:b7fc  ed ff 0f      sbc $0fff
$08:b7ff  5a            phy
$08:b800  da            phx
$08:b801  ab            plb
$08:b802  bd de ef      lda $efde,x
$08:b805  01 21         ora ($21,x)
$08:b807  0e 7a 00      asl $007a
$08:b80a  12 22         ora ($22)
$08:b80c  20 ff ee      jsr $eeff
$08:b80f  f2 34         sbc ($34)
$08:b811  7a            ply
$08:b812  55 53         eor $53,x
$08:b814  32 11         and ($11)
$08:b816  22 13 34 44   jsl $443413
$08:b81a  7a            ply
$08:b81b  55 43         eor $43,x
$08:b81d  32 22         and ($22)
$08:b81f  12 22         ora ($22)
$08:b821  22 22 7a 0f   jsl $0f7a22
$08:b825  ee ef 00      inc $00ef
$08:b828  0f dc bc df   ora $dfbcdc
$08:b82c  7a            ply
$08:b82d  01 00         ora ($00,x)
$08:b82f  ec a9 ab      cpx $aba9
$08:b832  cc ef ff      cpy $ffef
$08:b835  7a            ply
$08:b836  ff ed dc cc   sbc $ccdced,x
$08:b83a  dd ff fe      cmp $feff,x
$08:b83d  fe 5a dd      inc $dd5a,x
$08:b840  d9 bc e3      cmp $e3bc,y
$08:b843  54 10 12      mvn $12,$10
$08:b846  35 7a         and $7a,x
$08:b848  23 33         and $33,s
$08:b84a  20 ff 00      jsr $00ff
$08:b84d  02 46         cop #$46
$08:b84f  55 7a         eor $7a,x
$08:b851  45 42         eor $42
$08:b853  12 22         ora ($22)
$08:b855  23 34         and $34,s
$08:b857  45 43         eor $43
$08:b859  7a            ply
$08:b85a  33 32         and ($32,s),y
$08:b85c  11 00         ora ($00),y
$08:b85e  12 21         ora ($21)
$08:b860  10 fe         bpl $b860
$08:b862  7a            ply
$08:b863  dd df f0      cmp $f0df,x
$08:b866  ed cb bc      sbc $bccb
$08:b869  df 11 7a fe   cmp $fe7a11,x
$08:b86d  dc ba bb      jml [$bbba]
$08:b870  cc ef 10      cpy $10ef
$08:b873  0f 6a fd ba   ora $bafd6a
$08:b877  bb            tyx
$08:b878  e0 e0 11      cpx #$11e0
$08:b87b  12 21         ora ($21)
$08:b87d  7a            ply
$08:b87e  00 01         brk #$01
$08:b880  21 23         and ($23,x)
$08:b882  20 01 34      jsr $3401
$08:b885  42 7a         wdm #$7a
$08:b887  33 20         and ($20,s),y
$08:b889  0e ff 02      asl $02ff
$08:b88c  44 34 43      mvp $43,$34
$08:b88f  6a            ror a
$08:b890  42 21         wdm #$21
$08:b892  0f 11 44 56   ora $564411
$08:b896  54 43 6a      mvn $6a,$43
$08:b899  1f fe ee 11   ora $11eefe,x
$08:b89d  21 fc         and ($fc,x)
$08:b89f  b9 9b 7a      lda $7a9b,y
$08:b8a2  ee fe db      inc $dbfe
$08:b8a5  ba            tsx
$08:b8a6  bc e0 00      ldy $00e0,x
$08:b8a9  ff 7a dd cb   sbc $cbdd7a,x
$08:b8ad  ab            plb
$08:b8ae  df f0 12 11   cmp $1112f0,x
$08:b8b2  00 6a         brk #$6a
$08:b8b4  ed e0 01      sbc $01e0
$08:b8b7  12 55         ora ($55)
$08:b8b9  54 53 23      mvn $23,$53
$08:b8bc  7a            ply
$08:b8bd  23 33         and $33,s
$08:b8bf  33 21         and ($21,s),y
$08:b8c1  33 44         and ($44,s),y
$08:b8c3  65 44         adc $44
$08:b8c5  7a            ply
$08:b8c6  21 f0         and ($f0,x)
$08:b8c8  01 13         ora ($13,x)
$08:b8ca  34 35         bit $35,x
$08:b8cc  33 32         and ($32,s),y
$08:b8ce  6a            ror a
$08:b8cf  fe ef f0      inc $f0ef,x
$08:b8d2  13 23         ora ($23,s),y
$08:b8d4  33 1f         and ($1f,s),y
$08:b8d6  eb            xba
$08:b8d7  7a            ply
$08:b8d8  dd ee ff      cmp $ffee,x
$08:b8db  fe db bb      inc $bbdb,x
$08:b8de  cc cc 8a      cpy $8acc
$08:b8e1  ee dc dc      inc $dcdc
$08:b8e4  dd ee ff      cmp $ffee,x
$08:b8e7  ff ed 7a aa   sbc $aa7aed,x
$08:b8eb  aa            tax
$08:b8ec  bd f0 11      lda $11f0,x
$08:b8ef  00 10         brk #$10
$08:b8f1  f0 7a         beq $b96d
$08:b8f3  00 11         brk #$11
$08:b8f5  23 44         and $44,s
$08:b8f7  43 33         eor $33,s
$08:b8f9  44 45 8a      mvp $8a,$45
$08:b8fc  33 22         and ($22,s),y
$08:b8fe  22 23 43 34   jsl $344323
$08:b902  42 21         wdm #$21
$08:b904  7a            ply
$08:b905  32 21         and ($21)
$08:b907  44 45 55      mvp $55,$45
$08:b90a  55 31         eor $31,x
$08:b90c  11 7a         ora ($7a),y
$08:b90e  0f f0 11 11   ora $1111f0
$08:b912  11 1e         ora ($1e),y
$08:b914  dd dd 7a      cmp $7add,x
$08:b917  dd ef ed      cmp $edef,x
$08:b91a  bb            tyx
$08:b91b  9b            txy
$08:b91c  bc cc aa      ldy $aacc,x
$08:b91f  8a            txa
$08:b920  dc cc dd      jml [$ddcc]
$08:b923  ee ff ee      inc $eeff
$08:b926  fe cc 8a      inc $8acc,x
$08:b929  de ee f0      dec $f0ee,x
$08:b92c  01 00         ora ($00,x)
$08:b92e  01 0f         ora ($0f,x)
$08:b930  00 7a         brk #$7a
$08:b932  21 33         and ($33,x)
$08:b934  33 43         and ($43,s),y
$08:b936  33 45         and ($45,s),y
$08:b938  44 55 8a      mvp $8a,$55
$08:b93b  22 22 22 34   jsl $342222
$08:b93f  43 32         eor $32,s
$08:b941  11 21         ora ($21),y
$08:b943  7a            ply
$08:b944  01 33         ora ($33,x)
$08:b946  45 54         eor $54
$08:b948  43 32         eor $32,s
$08:b94a  10 0f         bpl $b95b
$08:b94c  6a            ror a
$08:b94d  ef 01 33 31   sbc $313301
$08:b951  fd ca ab      sbc $abca,x
$08:b954  de 7a fe      dec $fe7a,x
$08:b957  dd cc bd      cmp $bdcc,x
$08:b95a  cd cd bb      cmp $bbcd
$08:b95d  a9 7a 9a      lda #$9a7a
$08:b960  bc cd ee      ldy $eecd,x
$08:b963  ee db ba      inc $badb
$08:b966  aa            tax
$08:b967  7a            ply
$08:b968  ce 00 f1      dec $f100
$08:b96b  10 01         bpl $b96e
$08:b96d  0f 00 11 7a   ora $7a1100
$08:b971  33 22         and ($22,s),y
$08:b973  33 33         and ($33,s),y
$08:b975  33 44         and ($44,s),y
$08:b977  54 33 7a      mvn $7a,$33
$08:b97a  33 45         and ($45,s),y
$08:b97c  67 65         adc [$65]
$08:b97e  54 31 21      mvn $21,$31
$08:b981  22 7a 22 45   jsl $45227a
$08:b985  44 44 22      mvp $22,$44
$08:b988  11 ff         ora ($ff),y
$08:b98a  f0 6a         beq $b9f6
$08:b98c  12 33         ora ($33)
$08:b98e  30 ed         bmi $b97d
$08:b990  bb            tyx
$08:b991  bd de dd      lda $ddde,x
$08:b994  7a            ply
$08:b995  dc cc cc      jml [$cccc]
$08:b998  dd dc aa      cmp $aadc,x
$08:b99b  ba            tsx
$08:b99c  99 7a bb      sta $bb7a,y
$08:b99f  cd ee ed      cmp $edee
$08:b9a2  cb            wai
$08:b9a3  aa            tax
$08:b9a4  ab            plb
$08:b9a5  ce 6a be      dec $be6a
$08:b9a8  f1 11         sbc ($11),y
$08:b9aa  ff ef 01 13   sbc $1301ef,x
$08:b9ae  54 7a 23      mvn $23,$7a
$08:b9b1  22 33 34 54   jsl $543433
$08:b9b5  44 33 34      mvp $34,$33
$08:b9b8  7a            ply
$08:b9b9  56 66         lsr $66,x
$08:b9bb  66 54         ror $54
$08:b9bd  43 21         eor $21,s
$08:b9bf  22 34 7a 44   jsl $447a34
$08:b9c3  55 43         eor $43,x
$08:b9c5  33 31         and ($31,s),y
$08:b9c7  ff 00 12 6a   sbc $6a1200,x
$08:b9cb  43 31         eor $31,s
$08:b9cd  ec bd ee      cpx $eebd
$08:b9d0  ee ec a9      inc $a9ec
$08:b9d3  7a            ply
$08:b9d4  cd dd dc      cmp $dcdd
$08:b9d7  dc ca aa      jml [$aaca]
$08:b9da  aa            tax
$08:b9db  ac 7a ce      ldy $ce7a
$08:b9de  ee dc cc      inc $ccdc
$08:b9e1  aa            tax
$08:b9e2  ab            plb
$08:b9e3  cd df 5a      cmp $5adf
$08:b9e6  d0 ee         bne $b9d6
$08:b9e8  bd bc f0      lda $f0bc,x
$08:b9eb  33 46         and ($46,s),y
$08:b9ed  65 7a         adc $7a
$08:b9ef  22 22 34 43   jsl $433422
$08:b9f3  32 33         and ($33)
$08:b9f5  23 56         and $56,s
$08:b9f7  7a            ply
$08:b9f8  56 55         lsr $55,x
$08:b9fa  54 32 21      mvn $21,$32
$08:b9fd  22 34 44 7a   jsl $7a4434
$08:ba01  34 55         bit $55,x
$08:ba03  33 11         and ($11,s),y
$08:ba05  10 01         bpl $ba08
$08:ba07  22 32 6a 20   jsl $206a32
$08:ba0b  ff ef f0 0f   sbc $0ff0ef,x
$08:ba0f  ed bc bb      sbc $bbbc
$08:ba12  7a            ply
$08:ba13  ee ed dd      inc $dded
$08:ba16  cc ba ab      cpy $abba
$08:ba19  cd de 7a      cmp $7ade
$08:ba1c  ef ed cc ba   sbc $bacced
$08:ba20  bc cd e0      ldy $e0cd,x
$08:ba23  ff 5a dd da   sbc $dadd5a,x
$08:ba27  ad ef 12      lda $12ef
$08:ba2a  33 32         and ($32,s),y
$08:ba2c  55 7a         eor $7a,x
$08:ba2e  22 33 22 22   jsl $222233
$08:ba32  12 33         ora ($33)
$08:ba34  35 55         and $55,x
$08:ba36  7a            ply
$08:ba37  55 32         eor $32,x
$08:ba39  32 11         and ($11)
$08:ba3b  12 23         ora ($23)
$08:ba3d  24 44         bit $44
$08:ba3f  7a            ply
$08:ba40  44 32 10      mvp $10,$32
$08:ba43  00 02         brk #$02
$08:ba45  22 32 1f 6a   jsl $6a1f32
$08:ba49  fe f0 10      inc $10f0,x
$08:ba4c  ff ed db cc   sbc $ccdbed,x
$08:ba50  db            stp
$08:ba51  7a            ply
$08:ba52  ee ed cb      inc $cbed
$08:ba55  bb            tyx
$08:ba56  ab            plb
$08:ba57  ce df ef      dec $efdf
$08:ba5a  76 f1         ror $f1,x
$08:ba5c  22 0e cb bc   jsl $bccb0e
$08:ba60  de 03 55      dec $5503,x
$08:ba63  6a            ror a
$08:ba64  ce ee f0      dec $f0ee
$08:ba67  01 11         ora ($11,x)
$08:ba69  12 23         ora ($23)
$08:ba6b  54 7a 23      mvn $23,$7a
$08:ba6e  22 22 22 33   jsl $332222
$08:ba72  44 56 64      mvp $64,$56
$08:ba75  7a            ply
$08:ba76  43 22         eor $22,s
$08:ba78  22 12 33 44   jsl $443312
$08:ba7c  44 54 6a      mvp $6a,$54
$08:ba7f  63 22         adc $22,s
$08:ba81  11 35         ora ($35),y
$08:ba83  66 42         ror $42
$08:ba85  21 1f         and ($1f,x)
$08:ba87  6a            ror a
$08:ba88  01 00         ora ($00,x)
$08:ba8a  0f ed ee cb   ora $cbeeed
$08:ba8e  dc db 7a      jml [$7adb]
$08:ba91  ec cb aa      cpx $aacb
$08:ba94  cb            wai
$08:ba95  cc ee ed      cpy $edee
$08:ba98  dd 7a cb      cmp $cb7a,x
$08:ba9b  aa            tax
$08:ba9c  bb            tyx
$08:ba9d  cd fe ef      cmp $effe
$08:baa0  ee ee 6a      inc $6aee
$08:baa3  ce ef ff      dec $ffef
$08:baa6  ff 11 23 33   sbc $332311,x
$08:baaa  43 7a         eor $7a,s
$08:baac  22 11 23 23   jsl $232311
$08:bab0  44 55 64      mvp $64,$55
$08:bab3  43 7a         eor $7a,s
$08:bab5  32 22         and ($22)
$08:bab7  23 23         and $23,s
$08:bab9  45 45         eor $45
$08:babb  54 32 6a      mvn $6a,$32
$08:babe  23 34         and $34,s
$08:bac0  56 66         lsr $66,x
$08:bac2  54 22 22      mvn $22,$22
$08:bac5  12 6a         ora ($6a)
$08:bac7  11 21         ora ($21),y
$08:bac9  0f ed df ee   ora $eedfed
$08:bacd  ee ca 7a      inc $7aca
$08:bad0  cc bb bc      cpy $bcbb
$08:bad3  cd ef fe      cmp $feef
$08:bad6  dc cc 7a      jml [$7acc]
$08:bad9  ba            tsx
$08:bada  ac de ee      ldy $eede
$08:badd  ee ee ee      inc $eeee
$08:bae0  ee 6a f0      inc $f06a
$08:bae3  ee d0 e0      inc $e0d0
$08:bae6  62 34 44      per $ff1d
$08:bae9  55 7a         eor $7a,x
$08:baeb  33 33         and ($33,s),y
$08:baed  34 33         bit $33,x
$08:baef  44 24 55      mvp $55,$24
$08:baf2  43 7a         eor $7a,s
$08:baf4  44 43 33      mvp $33,$43
$08:baf7  22 33 12 21   jsl $211233
$08:bafb  22 6a 43 33   jsl $33436a
$08:baff  21 11         and ($11,x)
$08:bb01  1f 00 fe fe   ora $fefe00,x
$08:bb05  6a            ror a
$08:bb06  ed ee bb      sbc $bbee
$08:bb09  cb            wai
$08:bb0a  ab            plb
$08:bb0b  ba            tsx
$08:bb0c  cb            wai
$08:bb0d  b9 7a ed      lda $ed7a,y
$08:bb10  cd cc cd      cmp $cdcc
$08:bb13  cc de dc      cpy $dcde
$08:bb16  de 56 cd      dec $cd56,x
$08:bb19  e2 34         sep #$34
$08:bb1b  55 42         eor $42,x
$08:bb1d  11 fe         ora ($fe),y
$08:bb1f  f0 6a         beq $bb8b
$08:bb21  fe 00 00      inc $0000,x
$08:bb24  22 22 24 44   jsl $442422
$08:bb28  65 7a         adc $7a
$08:bb2a  33 33         and ($33,s),y
$08:bb2c  33 33         and ($33,s),y
$08:bb2e  54 33 54      mvn $54,$33
$08:bb31  44 7a 44      mvp $44,$7a
$08:bb34  43 32         eor $32,s
$08:bb36  32 32         and ($32)
$08:bb38  22 12 22 6a   jsl $6a2212
$08:bb3c  34 23         bit $23,x
$08:bb3e  22 11 0f 01   jsl $010f11
$08:bb42  fd fe 6a      sbc $6afe,x
$08:bb45  fd dd cc      sbc $ccdd,x
$08:bb48  bc ab 9b      ldy $9bab,x
$08:bb4b  cc aa 7b      cpy $7baa
$08:bb4e  ed cc cd      sbc $cdcc
$08:bb51  cc dd cd      cpy $cddd
$08:bb54  dd de ad      cmp $adde,x
$08:bb57  04 02         tsb $02
$08:bb59  00 00         brk #$00
$08:bb5b  00 00         brk #$00
$08:bb5d  00 00         brk #$00
$08:bb5f  00 00         brk #$00
$08:bb61  aa            tax
$08:bb62  3c c5 02      bit $02c5,x
$08:bb65  d0 2f         bne $bb96
$08:bb67  f2 21         sbc ($21)
$08:bb69  db            stp
$08:bb6a  a6 da         ldx $da
$08:bb6c  0f 50 10 ff   ora $ff1050
$08:bb70  05 43         ora $43
$08:bb72  bc b6 c0      ldy $c0b6,x
$08:bb75  03 21         ora $21,s
$08:bb77  ff 0f 22 2d   sbc $2d220f,x
$08:bb7b  ec b6 ff      cpx $ffb6
$08:bb7e  43 1f         eor $1f,s
$08:bb80  ff f2 33 ee   sbc $ee33f2,x
$08:bb84  cf a6 d5 65   cmp $65d5a6
$08:bb88  de d1 14      dec $14d1,x
$08:bb8b  30 da         bmi $bb67
$08:bb8d  bc a6 47      ldy $47a6,x
$08:bb90  60            rts
$08:bb91  ed f0 24      sbc $24f0
$08:bb94  fe 9c d3      inc $d39c,x
$08:bb97  a6 74         ldx $74
$08:bb99  2f 0e 00 4d   and $4d000e
$08:bb9d  ec fb 15      cpx $15fb
$08:bba0  aa            tax
$08:bba1  2a            rol a
$08:bba2  e0 2f         cpx #$2f
$08:bba4  12 b1         ora ($b1)
$08:bba6  e2 f2         sep #$f2
$08:bba8  42 aa         wdm #$aa
$08:bbaa  cd 20 1d      cmp $1d20
$08:bbad  2c 3f 1c      bit $1c3f
$08:bbb0  44 3a aa      mvp $aa,$3a
$08:bbb3  c6 0f         dec $0f
$08:bbb5  c1 f2         cmp ($f2,x)
$08:bbb7  0f f1 34 db   ora $db34f1
$08:bbbb  a6 03         ldx $03
$08:bbbd  5f cc d0 e0   eor $e0d0cc,x
$08:bbc1  f1 45         sbc ($45),y
$08:bbc3  0e a6 14      asl $14a6
$08:bbc6  3c 9d 01      bit $019d,x
$08:bbc9  ee 15 60      inc $6015
$08:bbcc  e0 b6         cpx #$b6
$08:bbce  21 fd         and ($fd,x)
$08:bbd0  ef 0f f1 23   sbc $23f10f
$08:bbd4  00 e2         brk #$e2
$08:bbd6  a6 50         ldx $50
$08:bbd8  a9 f0         lda #$f0
$08:bbda  fe 06 72      inc $7206,x
$08:bbdd  ec 36 ba      cpx $ba36
$08:bbe0  ec f4 00      cpx $00f4
$08:bbe3  f1 30         sbc ($30),y
$08:bbe5  ed 03 3c      sbc $3c03
$08:bbe8  ba            tsx
$08:bbe9  fd 4f 1e      sbc $1e4f,x
$08:bbec  22 2f cd 44   jsl $44cd2f
$08:bbf0  dd ba e4      cmp $e4ba,x
$08:bbf3  00 e1         brk #$e1
$08:bbf5  32 ee         and ($ee)
$08:bbf7  d3 10         cmp ($10,s),y
$08:bbf9  0b            phd
$08:bbfa  ba            tsx
$08:bbfb  30 1f         bmi $bc1c
$08:bbfd  03 2f         ora $2f,s
$08:bbff  dd 13 1f      cmp $1f13,x
$08:bc02  c2 ba         rep #$ba
$08:bc04  01 e0         ora ($e0,x)
$08:bc06  52 fb         eor ($fb)
$08:bc08  e1 31         sbc ($31,x)
$08:bc0a  0d 0f ba      ora $ba0f
$08:bc0d  01 04         ora ($04,x)
$08:bc0f  11 cc         ora ($cc),y
$08:bc11  f4 22 b0      pea $b022
$08:bc14  e3 ba         sbc $ba,s
$08:bc16  ff 42 2b df   sbc $df2b42,x
$08:bc1a  22 2c 1e 2e   jsl $2e1e2c
$08:bc1e  b6 d2         ldx $d2,y
$08:bc20  55 2e         eor $2e,x
$08:bc22  dd 13 01      cmp $0113,x
$08:bc25  ce df ba      dec $badf
$08:bc28  23 2b         and $2b,s
$08:bc2a  c0 13 1e      cpy #$1e13
$08:bc2d  1b            tcs
$08:bc2e  3e 22 ba      rol $ba22,x
$08:bc31  32 bc         and ($bc)
$08:bc33  f2 31         sbc ($31)
$08:bc35  ff d1 f3 12   sbc $12f3d1,x
$08:bc39  ba            tsx
$08:bc3a  2d cd 42      and $42cd
$08:bc3d  1e 0d 1f      asl $1f0d,x
$08:bc40  31 22         and ($22),y
$08:bc42  ba            tsx
$08:bc43  cf c3 03 f0   cmp $f003c3
$08:bc47  c0 f4 22      cpy #$22f4
$08:bc4a  0d b6 0b      ora $0bb6
$08:bc4d  f0 3f         beq $bc8e
$08:bc4f  0d ed 02      ora $02ed
$08:bc52  44 10 ba      mvp $ba,$10
$08:bc55  d2 11         cmp ($11)
$08:bc57  1e ef f5      asl $f5ef,x
$08:bc5a  21 ee         and ($ee,x)
$08:bc5c  0e ba 11      asl $11ba
$08:bc5f  2f ef 0f 33   and $330fef
$08:bc63  1f df f1 ba   ora $baf1df,x
$08:bc67  21 fe         and ($fe,x)
$08:bc69  fe 13 50      inc $5013,x
$08:bc6c  ec e1 22      cpx $22e1
$08:bc6f  ba            tsx
$08:bc70  0f fe e1 25   ora $25e1fe
$08:bc74  2d dd 11      and $11dd
$08:bc77  31 ba         and ($ba),y
$08:bc79  df ff 11 42   cmp $4211ff,x
$08:bc7d  fc d1 13      jsr ($13d1,x)
$08:bc80  f0 ba         beq $bc3c
$08:bc82  ee 01 13      inc $1301
$08:bc85  4e db 03      lsr $03db
$08:bc88  4e fe ba      lsr $bafe
$08:bc8b  0f 11 24 0c   ora $0c2411
$08:bc8f  a1 43         lda ($43,x)
$08:bc91  ef d0 b6 ef   sbc $efb6d0
$08:bc95  01 45         ora ($45,x)
$08:bc97  3e bf 23      rol $23bf,x
$08:bc9a  0d de b6      ora $b6de
$08:bc9d  f0 13         beq $bcb2
$08:bc9f  54 eb e3      mvn $e3,$eb
$08:bca2  2f cc f1 b6   and $b6f1cc
$08:bca6  11 15         ora ($15),y
$08:bca8  4f bc 24 1d   eor $1d24bc
$08:bcac  bd 13 ba      lda $ba13,x
$08:bcaf  fe 22 db      inc $db22,x
$08:bcb2  14 3d         trb $3d
$08:bcb4  cf 24 10 ba   cmp $ba1024
$08:bcb8  d1 2e         cmp ($2e),y
$08:bcba  c0 34 ec      cpy #$ec34
$08:bcbd  c4 42         cpy $42
$08:bcbf  fe ba 00      inc $00ba,x
$08:bcc2  0d 01 5f      ora $5f01
$08:bcc5  bc 25 40      ldy $4025,x
$08:bcc8  dd ba 12      cmp $12ba,x
$08:bccb  ee 04 1c      inc $1c04
$08:bcce  b2 55         lda ($55)
$08:bcd0  0c d0 ba      tsb $bad0
$08:bcd3  10 f1         bpl $bcc6
$08:bcd5  03 cd         ora $cd,s
$08:bcd7  f5 52         sbc $52,x
$08:bcd9  cc e4 ba      cpy $bae4
$08:bcdc  0e 01 2f      asl $2f01
$08:bcdf  bf 46 3c bd   lda $bd3c46,x
$08:bce3  41 ba         eor ($ba,x)
$08:bce5  0d 21 1b      ora $1b21
$08:bce8  f2 64         sbc ($64)
$08:bcea  db            stp
$08:bceb  c3 12         cmp $12,s
$08:bced  ba            tsx
$08:bcee  d0 12         bne $bd02
$08:bcf0  ec 15 6e      cpx $6e15
$08:bcf3  ca            dex
$08:bcf4  13 3c         ora ($3c,s),y
$08:bcf6  b6 fd         ldx $fd,y
$08:bcf8  10 ed         bpl $bce7
$08:bcfa  16 63         asl $63,x
$08:bcfc  dc e2 0e      jml [$0ee2]
$08:bcff  b6 bf         ldx $bf,y
$08:bd01  22 ff 35 4e   jsl $4e35ff
$08:bd05  ce 11 ec      dec $ec11
$08:bd08  ba            tsx
$08:bd09  14 1e         trb $1e
$08:bd0b  f2 21         sbc ($21)
$08:bd0d  cb            wai
$08:bd0e  24 1c         bit $1c
$08:bd10  d0 ba         bne $bccc
$08:bd12  63 ed         adc $ed,s
$08:bd14  f3 3d         sbc ($3d,s),y
$08:bd16  b0 43         bcs $bd5b
$08:bd18  cb            wai
$08:bd19  05 ba         ora $ba
$08:bd1b  6f dc 14 0d   adc $0d14dc
$08:bd1f  d2 4e         cmp ($4e)
$08:bd21  cc 66 ca      cpy $ca66
$08:bd24  1e ef 21      asl $21ef,x
$08:bd27  fe 12 fe      inc $fe12,x
$08:bd2a  e2 33         sep #$33
$08:bd2c  ca            dex
$08:bd2d  fb            xce
$08:bd2e  f1 4f         sbc ($4f),y
$08:bd30  ef 21 de 13   sbc $13de21
$08:bd34  41 c6         eor ($c6,x)
$08:bd36  fd d2 11      sbc $11d2,x
$08:bd39  f0 0f         beq $bd4a
$08:bd3b  cd 05 61      cmp $6105
$08:bd3e  ca            dex
$08:bd3f  c0 32         cpy #$32
$08:bd41  0e 00 0d      asl $0d00
$08:bd44  02 52         cop #$52
$08:bd46  cc ca f2      cpy $f2ca
$08:bd49  21 ff         and ($ff,x)
$08:bd4b  f1 e0         sbc ($e0),y
$08:bd4d  05 3e         ora $3e
$08:bd4f  bd ca 14      lda $14ca,x
$08:bd52  2e e0 1f      rol $1fe0
$08:bd55  f1 33         sbc ($33),y
$08:bd57  fc c1 c6      jsr ($c6c1,x)
$08:bd5a  f3 20         sbc ($20,s),y
$08:bd5c  ef fe e2 54   sbc $54e2fe
$08:bd60  1c cf c6      trb $c6cf
$08:bd63  32 0f         and ($0f)
$08:bd65  ef ff 03 42   sbc $4203ff
$08:bd69  dd f2 b6      cmp $b6f2,x
$08:bd6c  41 dc         eor ($dc,x)
$08:bd6e  ef e0 47 5d   sbc $5d47e0
$08:bd72  9b            txy
$08:bd73  25 b6         and $b6
$08:bd75  3d bf 1f      and $1fbf,x
$08:bd78  f3 64         sbc ($64,s),y
$08:bd7a  ec b0 44      cpx $44b0
$08:bd7d  b6 eb         ldx $eb,y
$08:bd7f  d2 10         cmp ($10)
$08:bd81  13 41         ora ($41,s),y
$08:bd83  db            stp
$08:bd84  f4 4f b6      pea $b64f
$08:bd87  ab            plb
$08:bd88  23 1f         and $1f,s
$08:bd8a  24 1e         bit $1e
$08:bd8c  cf 23 fc ba   cmp $bafc23
$08:bd90  f5 3f         sbc $3f,x
$08:bd92  e0 10         cpx #$10
$08:bd94  ee 22 2d      inc $2d22
$08:bd97  cf ba 35 1c   cmp $1c35ba
$08:bd9b  f0 3d         beq $bdda
$08:bd9d  00 12         brk #$12
$08:bd9f  ed e2 b2      sbc $b2e2
$08:bda2  d2 42         cmp ($42)
$08:bda4  00 11         brk #$11
$08:bda6  00 00         brk #$00
$08:bda8  02 33         cop #$33
$08:bdaa  aa            tax
$08:bdab  c2 d5         rep #$d5
$08:bdad  11 c0         ora ($c0),y
$08:bdaf  3f e2 31 db   and $db31e2,x
$08:bdb3  a6 da         ldx $da
$08:bdb5  0f 50 00 ff   ora $ff0050
$08:bdb9  f5 44         sbc $44,x
$08:bdbb  bc b6 c0      ldy $c0b6,x
$08:bdbe  03 21         ora $21,s
$08:bdc0  ff ff 23 2d   sbc $2d23ff,x
$08:bdc4  ed b6 0f      sbc $0fb6
$08:bdc7  32 1f         and ($1f)
$08:bdc9  ff f2 33 ee   sbc $ee33f2,x
$08:bdcd  cf a6 d4 65   cmp $65d4a6
$08:bdd1  ee d0 14      inc $14d0
$08:bdd4  30 da         bmi $bdb0
$08:bdd6  bc a6 47      ldy $47a6,x
$08:bdd9  60            rts
$08:bdda  ed f0 24      sbc $24f0
$08:bddd  fe 9c d3      inc $d39c,x
$08:bde0  a6 74         ldx $74
$08:bde2  2f 0e 00 4d   and $4d000e
$08:bde6  ec fb 15      cpx $15fb
$08:bde9  aa            tax
$08:bdea  2a            rol a
$08:bdeb  e0 2f 12      cpx #$122f
$08:bdee  b1 e2         lda ($e2),y
$08:bdf0  f2 42         sbc ($42)
$08:bdf2  aa            tax
$08:bdf3  cd 20 1d      cmp $1d20
$08:bdf6  2c 3f 1c      bit $1c3f
$08:bdf9  44 3a aa      mvp $aa,$3a
$08:bdfc  c6 0f         dec $0f
$08:bdfe  c1 f2         cmp ($f2,x)
$08:be00  0f f1 34 db   ora $db34f1
$08:be04  a6 03         ldx $03
$08:be06  5f cc d0 e0   eor $e0d0cc,x
$08:be0a  f1 45         sbc ($45),y
$08:be0c  0e a6 14      asl $14a6
$08:be0f  3c 9d 01      bit $019d,x
$08:be12  ee 15 60      inc $6015
$08:be15  e0 b6 21      cpx #$21b6
$08:be18  fd ef 0f      sbc $0fef,x
$08:be1b  f1 23         sbc ($23),y
$08:be1d  00 e2         brk #$e2
$08:be1f  a6 50         ldx $50
$08:be21  a9 f0         lda #$f0
$08:be23  fe 06 72      inc $7206,x
$08:be26  ec 36 ba      cpx $ba36
$08:be29  ec f4 00      cpx $00f4
$08:be2c  f1 30         sbc ($30),y
$08:be2e  ed 03 3c      sbc $3c03
$08:be31  ba            tsx
$08:be32  fd 4f 1e      sbc $1e4f,x
$08:be35  22 2f cd 44   jsl $44cd2f
$08:be39  dd ba e4      cmp $e4ba,x
$08:be3c  00 e1         brk #$e1
$08:be3e  32 ee         and ($ee)
$08:be40  d3 10         cmp ($10,s),y
$08:be42  0b            phd
$08:be43  ba            tsx
$08:be44  30 1f         bmi $be65
$08:be46  03 2f         ora $2f,s
$08:be48  dd 13 1f      cmp $1f13,x
$08:be4b  c2 ba         rep #$ba
$08:be4d  01 e0         ora ($e0,x)
$08:be4f  52 fb         eor ($fb)
$08:be51  e1 31         sbc ($31,x)
$08:be53  0d 0f ba      ora $ba0f
$08:be56  01 04         ora ($04,x)
$08:be58  11 cc         ora ($cc),y
$08:be5a  f4 22 b0      pea $b022
$08:be5d  e3 ba         sbc $ba,s
$08:be5f  ff 42 2b df   sbc $df2b42,x
$08:be63  22 2c 1e 2e   jsl $2e1e2c
$08:be67  b6 d2         ldx $d2,y
$08:be69  55 2e         eor $2e,x
$08:be6b  dd 13 01      cmp $0113,x
$08:be6e  ce df ba      dec $badf
$08:be71  23 2b         and $2b,s
$08:be73  c0 13 1e      cpy #$1e13
$08:be76  1b            tcs
$08:be77  3e 22 ba      rol $ba22,x
$08:be7a  32 bc         and ($bc)
$08:be7c  f2 31         sbc ($31)
$08:be7e  ff d1 f3 12   sbc $12f3d1,x
$08:be82  ba            tsx
$08:be83  2d cd 42      and $42cd
$08:be86  1e 0d 1f      asl $1f0d,x
$08:be89  31 22         and ($22),y
$08:be8b  ba            tsx
$08:be8c  cf c3 03 f0   cmp $f003c3
$08:be90  c0 f4 22      cpy #$22f4
$08:be93  0d b6 0b      ora $0bb6
$08:be96  f0 3f         beq $bed7
$08:be98  0d ed 02      ora $02ed
$08:be9b  44 10 ba      mvp $ba,$10
$08:be9e  d2 11         cmp ($11)
$08:bea0  1e ef f5      asl $f5ef,x
$08:bea3  21 ee         and ($ee,x)
$08:bea5  0e ba 11      asl $11ba
$08:bea8  2f ef 0f 33   and $330fef
$08:beac  1f df f1 ba   ora $baf1df,x
$08:beb0  21 fe         and ($fe,x)
$08:beb2  fe 13 50      inc $5013,x
$08:beb5  ec e1 22      cpx $22e1
$08:beb8  ba            tsx
$08:beb9  0f fe e1 25   ora $25e1fe
$08:bebd  2d dd 11      and $11dd
$08:bec0  31 ba         and ($ba),y
$08:bec2  df ff 11 42   cmp $4211ff,x
$08:bec6  fc d1 13      jsr ($13d1,x)
$08:bec9  f0 ba         beq $be85
$08:becb  ee 01 13      inc $1301
$08:bece  4e db 03      lsr $03db
$08:bed1  4e fe ba      lsr $bafe
$08:bed4  0f 11 24 0c   ora $0c2411
$08:bed8  a1 43         lda ($43,x)
$08:beda  ef d0 b6 ef   sbc $efb6d0
$08:bede  01 45         ora ($45,x)
$08:bee0  3e bf 23      rol $23bf,x
$08:bee3  0d de b6      ora $b6de
$08:bee6  f0 13         beq $befb
$08:bee8  54 eb e3      mvn $e3,$eb
$08:beeb  2f cc f1 b6   and $b6f1cc
$08:beef  11 15         ora ($15),y
$08:bef1  4f bc 24 1d   eor $1d24bc
$08:bef5  bd 13 ba      lda $ba13,x
$08:bef8  fe 22 db      inc $db22,x
$08:befb  14 3d         trb $3d
$08:befd  cf 24 10 ba   cmp $ba1024
$08:bf01  d1 2e         cmp ($2e),y
$08:bf03  c0 34 ec      cpy #$ec34
$08:bf06  c4 42         cpy $42
$08:bf08  fe ba 00      inc $00ba,x
$08:bf0b  0d 01 5f      ora $5f01
$08:bf0e  bc 25 40      ldy $4025,x
$08:bf11  dd ba 12      cmp $12ba,x
$08:bf14  ee 04 1c      inc $1c04
$08:bf17  b2 55         lda ($55)
$08:bf19  0c d0 ba      tsb $bad0
$08:bf1c  10 f1         bpl $bf0f
$08:bf1e  03 cd         ora $cd,s
$08:bf20  f5 52         sbc $52,x
$08:bf22  cc e4 ba      cpy $bae4
$08:bf25  0e 01 2f      asl $2f01
$08:bf28  bf 46 3c bd   lda $bd3c46,x
$08:bf2c  41 ba         eor ($ba,x)
$08:bf2e  0d 21 1b      ora $1b21
$08:bf31  f2 64         sbc ($64)
$08:bf33  db            stp
$08:bf34  c3 12         cmp $12,s
$08:bf36  ba            tsx
$08:bf37  d0 12         bne $bf4b
$08:bf39  ec 15 6e      cpx $6e15
$08:bf3c  ca            dex
$08:bf3d  13 3c         ora ($3c,s),y
$08:bf3f  b6 fd         ldx $fd,y
$08:bf41  10 ed         bpl $bf30
$08:bf43  16 63         asl $63,x
$08:bf45  dc e2 0e      jml [$0ee2]
$08:bf48  b6 bf         ldx $bf,y
$08:bf4a  22 ff 35 4e   jsl $4e35ff
$08:bf4e  ce 11 ec      dec $ec11
$08:bf51  ba            tsx
$08:bf52  14 1e         trb $1e
$08:bf54  f2 21         sbc ($21)
$08:bf56  cb            wai
$08:bf57  24 1c         bit $1c
$08:bf59  d0 ba         bne $bf15
$08:bf5b  63 ed         adc $ed,s
$08:bf5d  f3 3d         sbc ($3d,s),y
$08:bf5f  b0 43         bcs $bfa4
$08:bf61  cb            wai
$08:bf62  05 ba         ora $ba
$08:bf64  6f dc 14 0d   adc $0d14dc
$08:bf68  d2 4e         cmp ($4e)
$08:bf6a  cc 66 ca      cpy $ca66
$08:bf6d  1e ef 21      asl $21ef,x
$08:bf70  fe 12 fe      inc $fe12,x
$08:bf73  e2 33         sep #$33
$08:bf75  ca            dex
$08:bf76  fb            xce
$08:bf77  f1 4f         sbc ($4f),y
$08:bf79  ef 21 de 13   sbc $13de21
$08:bf7d  41 c6         eor ($c6,x)
$08:bf7f  fd d2 11      sbc $11d2,x
$08:bf82  f0 0f         beq $bf93
$08:bf84  cd 05 61      cmp $6105
$08:bf87  ca            dex
$08:bf88  c0 32         cpy #$32
$08:bf8a  0e 00 0d      asl $0d00
$08:bf8d  02 52         cop #$52
$08:bf8f  cc ca f2      cpy $f2ca
$08:bf92  21 ff         and ($ff,x)
$08:bf94  f1 e0         sbc ($e0),y
$08:bf96  05 3e         ora $3e
$08:bf98  bd ca 14      lda $14ca,x
$08:bf9b  2e e0 1f      rol $1fe0
$08:bf9e  f1 33         sbc ($33),y
$08:bfa0  fc c1 c6      jsr ($c6c1,x)
$08:bfa3  f3 20         sbc ($20,s),y
$08:bfa5  ef fe e2 54   sbc $54e2fe
$08:bfa9  1c cf c6      trb $c6cf
$08:bfac  32 0f         and ($0f)
$08:bfae  ef ff 03 42   sbc $4203ff
$08:bfb2  dd f2 b6      cmp $b6f2,x
$08:bfb5  41 dc         eor ($dc,x)
$08:bfb7  ef e0 47 5d   sbc $5d47e0
$08:bfbb  9b            txy
$08:bfbc  25 b6         and $b6
$08:bfbe  3d bf 1f      and $1fbf,x
$08:bfc1  f3 64         sbc ($64,s),y
$08:bfc3  ec b0 44      cpx $44b0
$08:bfc6  b6 eb         ldx $eb,y
$08:bfc8  d2 10         cmp ($10)
$08:bfca  13 41         ora ($41,s),y
$08:bfcc  db            stp
$08:bfcd  f4 4f b6      pea $b64f
$08:bfd0  ab            plb
$08:bfd1  23 1f         and $1f,s
$08:bfd3  24 1e         bit $1e
$08:bfd5  cf 23 fc ba   cmp $bafc23
$08:bfd9  f5 3f         sbc $3f,x
$08:bfdb  e0 10         cpx #$10
$08:bfdd  ee 22 2d      inc $2d22
$08:bfe0  cf ba 35 1c   cmp $1c35ba
$08:bfe4  f0 3d         beq $c023
$08:bfe6  00 12         brk #$12
$08:bfe8  ed e2 b2      sbc $b2e2
$08:bfeb  d2 42         cmp ($42)
$08:bfed  00 11         brk #$11
$08:bfef  00 00         brk #$00
$08:bff1  02 33         cop #$33
$08:bff3  aa            tax
$08:bff4  c2 d5         rep #$d5
$08:bff6  11 c0         ora ($c0),y
$08:bff8  3f e2 31 db   and $db31e2,x
$08:bffc  a7 da         lda [$da]
$08:bffe  0f 50 00 ff   ora $ff0050
$08:c002  f5 44         sbc $44,x
$08:c004  bc 14 16      ldy $1614,x
$08:c007  02 00         cop #$00
$08:c009  00 00         brk #$00
$08:c00b  00 00         brk #$00
$08:c00d  00 00         brk #$00
$08:c00f  00 9a         brk #$9a
$08:c011  c6 10         dec $10
$08:c013  ff dd e1 34   sbc $34e1dd,x
$08:c017  33 3f         and ($3f,s),y
$08:c019  9a            txs
$08:c01a  ec bb 03      cpx $03bb
$08:c01d  44 20 01      mvp $01,$20
$08:c020  fe f1 8a      inc $8af1,x
$08:c023  3d af 3d      and $3daf,x
$08:c026  c2 43         rep #$43
$08:c028  33 fd         and ($fd,s),y
$08:c02a  df 9a 01 2e   cmp $2e019a,x
$08:c02e  cf 1e 04 2f   cmp $2f041e
$08:c032  00 f0         brk #$f0
$08:c034  9a            txs
$08:c035  2f cd 00 13   and $1300cd
$08:c039  32 22         and ($22)
$08:c03b  0e bc 8a      asl $8abc
$08:c03e  d2 34         cmp ($34)
$08:c040  34 42         bit $42,x
$08:c042  0e bf 51      asl $51bf
$08:c045  be 8a 0e      ldx $0e8a,y
$08:c048  d0 33         bne $c07d
$08:c04a  21 31         and ($31,x)
$08:c04c  cc 01 31      cpy $3101
$08:c04f  9a            txs
$08:c050  dd f0 14      cmp $14f0,x
$08:c053  1f f1 ff 11   ora $11fff1,x
$08:c057  dd 8a e0      cmp $e08a,x
$08:c05a  15 43         ora $43,x
$08:c05c  54 0e bb      mvn $bb,$0e
$08:c05f  00 ce         brk #$ce
$08:c061  8a            txa
$08:c062  03 75         ora $75,s
$08:c064  31 da         and ($da),y
$08:c066  14 ed         trb $ed
$08:c068  1e b1 8a      asl $8ab1,x
$08:c06b  30 23         bmi $c090
$08:c06d  10 0d         bpl $c07c
$08:c06f  f2 1e         sbc ($1e)
$08:c071  dc de 9a      jml [$9ade]
$08:c074  13 40         ora ($40,s),y
$08:c076  ef 0e 02 fc   sbc $fc020e
$08:c07a  f0 02         beq $c07e
$08:c07c  9a            txs
$08:c07d  31 02         and ($02),y
$08:c07f  10 ef         bpl $c070
$08:c081  11 ee         ora ($ee),y
$08:c083  de 24 96      dec $9624,x
$08:c086  25 52         and $52
$08:c088  00 ff         brk #$ff
$08:c08a  00 db         brk #$db
$08:c08c  d0 00         bne $c08e
$08:c08e  9a            txs
$08:c08f  00 f0         brk #$f0
$08:c091  11 0f         ora ($0f),y
$08:c093  ee ff 02      inc $02ff
$08:c096  42 8a         wdm #$8a
$08:c098  eb            xba
$08:c099  ff f1 0a c0   sbc $c00af1,x
$08:c09d  02 55         cop #$55
$08:c09f  00 9a         brk #$9a
$08:c0a1  11 ff         ora ($ff),y
$08:c0a3  12 0e         ora ($0e)
$08:c0a5  cc f3 54      cpy $54f3
$08:c0a8  2f 8a bd 10   and $10bd8a
$08:c0ac  f0 de         beq $c08c
$08:c0ae  25 40         and $40
$08:c0b0  ab            plb
$08:c0b1  12 9a         ora ($9a)
$08:c0b3  11 1f         ora ($1f),y
$08:c0b5  ef 0d e2 32   sbc $32e20d
$08:c0b9  1f d1 8a 30   ora $308ad1,x
$08:c0bd  da            phx
$08:c0be  90 21         bcc $c0e1
$08:c0c0  35 21         and $21,x
$08:c0c2  00 2f         brk #$2f
$08:c0c4  9a            txs
$08:c0c5  f2 2e         sbc ($2e)
$08:c0c7  ce f0 14      dec $14f0
$08:c0ca  31 f0         and ($f0),y
$08:c0cc  0f 9a f0 ef   ora $eff09a
$08:c0d0  24 10         bit $10
$08:c0d2  fc e0 31      jsr ($31e0,x)
$08:c0d5  00 9a         brk #$9a
$08:c0d7  ff 10 cd 44   sbc $44cd10,x
$08:c0db  0e e0 32      asl $32e0
$08:c0de  fc 8a ac      jsr ($ac8a,x)
$08:c0e1  22 21 33 10   jsl $103321
$08:c0e5  20 e0 50      jsr $50e0
$08:c0e8  8a            txa
$08:c0e9  9a            txs
$08:c0ea  d1 43         cmp ($43),y
$08:c0ec  31 13         and ($13),y
$08:c0ee  3e ce dc      rol $dcce,x
$08:c0f1  9a            txs
$08:c0f2  15 40         ora $40,x
$08:c0f4  ed de 22      sbc $22de
$08:c0f7  00 0f         brk #$0f
$08:c0f9  13 9a         ora ($9a,s),y
$08:c0fb  ea            nop
$08:c0fc  04 1d         tsb $1d
$08:c0fe  f0 24         beq $c124
$08:c100  2d bd f1      and $f1bd
$08:c103  8a            txa
$08:c104  52 f0         eor ($f0)
$08:c106  34 3f         bit $3f,x
$08:c108  e0 30 b9      cpx #$b930
$08:c10b  e3 9a         sbc $9a,s
$08:c10d  21 00         and ($00,x)
$08:c10f  01 21         ora ($21,x)
$08:c111  0d ef 02      ora $02ef
$08:c114  64 9a         stz $9a
$08:c116  db            stp
$08:c117  ef 00 00 11   sbc $110000
$08:c11b  12 0c         ora ($0c)
$08:c11d  d2 9a         cmp ($9a)
$08:c11f  1d e1 12      ora $12e1,x
$08:c122  41 dc         eor ($dc,x)
$08:c124  df 22 0f 8a   cmp $8a0f22,x
$08:c128  24 31         bit $31
$08:c12a  ff 21 ca c2   sbc $c2ca21,x
$08:c12e  42 31         wdm #$31
$08:c130  9a            txs
$08:c131  ff 23 1d cf   sbc $cf1d23,x
$08:c135  22 43 fc f0   jsl $f0fc43
$08:c139  8a            txa
$08:c13a  fe dd 15      inc $15dd,x
$08:c13d  52 1f         eor ($1f)
$08:c13f  bc 0d bf      ldy $bf0d,x
$08:c142  9a            txs
$08:c143  12 42         ora ($42)
$08:c145  ed fe f1      sbc $f1fe
$08:c148  10 12         bpl $c15c
$08:c14a  1f 9a 00 01   ora $01009a,x
$08:c14e  1c c1 30      trb $30c1
$08:c151  13 0d         ora ($0d,s),y
$08:c153  03 9a         ora $9a,s
$08:c155  2e dd 23      rol $23dd
$08:c158  42 fc         wdm #$fc
$08:c15a  f1 1f         sbc ($1f),y
$08:c15c  ec 9a f4      cpx $f49a
$08:c15f  50 f1         bvc $c152
$08:c161  0d ef ee      ora $eeef
$08:c164  03 22         ora $22,s
$08:c166  8a            txa
$08:c167  30 aa         bmi $c113
$08:c169  e0 21 15      cpx #$1521
$08:c16c  4d df e2      eor $e2df
$08:c16f  9a            txs
$08:c170  30 be         bmi $c130
$08:c172  12 22         ora ($22)
$08:c174  0e f2 30      asl $30f2
$08:c177  cd 9a 04      cmp $049a
$08:c17a  33 0d         and ($0d,s),y
$08:c17c  d1 10         cmp ($10),y
$08:c17e  fd c2 62      sbc $62c2,x
$08:c181  8a            txa
$08:c182  e0 2c ad      cpx #$ad2c
$08:c185  ec e2 44      cpx $44e2
$08:c188  32 eb         and ($eb)
$08:c18a  9a            txs
$08:c18b  e0 01 03      cpx #$0301
$08:c18e  20 ee ef      jsr $efee
$08:c191  43 eb         eor $eb,s
$08:c193  8a            txa
$08:c194  f4 44 4c      pea $4c44
$08:c197  b3 61         lda ($61,s),y
$08:c199  ca            dex
$08:c19a  e6 63         inc $63
$08:c19c  9a            txs
$08:c19d  0f e1 1f e0   ora $e01fe1
$08:c1a1  ef 24 00 10   sbc $100024
$08:c1a5  9a            txs
$08:c1a6  cd 1f ef      cmp $ef1f
$08:c1a9  21 12         and ($12,x)
$08:c1ab  1e df 11      asl $11df,x
$08:c1ae  9a            txs
$08:c1af  11 22         ora ($22),y
$08:c1b1  dd e0 14      cmp $14e0,x
$08:c1b4  1c c1 32      trb $32c1
$08:c1b7  8a            txa
$08:c1b8  50 bf         bvc $c179
$08:c1ba  42 fc         wdm #$fc
$08:c1bc  d4 70         pei ($70)
$08:c1be  ef 01 9a 10   sbc $109a01
$08:c1c2  ef 0f 02 20   sbc $20020f
$08:c1c6  11 cc         ora ($cc),y
$08:c1c8  11 8a         ora ($8a),y
$08:c1ca  bb            tyx
$08:c1cb  43 11         eor $11,s
$08:c1cd  2f bc 13 63   and $6313bc
$08:c1d1  11 9a         ora ($9a),y
$08:c1d3  fc d1 12      jsr ($12d1,x)
$08:c1d6  2e cf 43      rol $43cf
$08:c1d9  1f ff 8a 22   ora $228aff,x
$08:c1dd  1e e4 6f      asl $6fe4,x
$08:c1e0  b0 f0         bcs $c1d2
$08:c1e2  54 ba 9a      mvn $9a,$ba
$08:c1e5  02 0f         cop #$0f
$08:c1e7  21 01         and ($01,x)
$08:c1e9  fb            xce
$08:c1ea  e3 0d         sbc $0d,s
$08:c1ec  02 9a         cop #$9a
$08:c1ee  00 00         brk #$00
$08:c1f0  ff e1 44 0f   sbc $0f44e1,x
$08:c1f4  0d bf 9a      ora $9abf
$08:c1f7  31 21         and ($21),y
$08:c1f9  cd 23 21      cmp $2123
$08:c1fc  ff 00 00 9a   sbc $9a0000,x
$08:c200  01 31         ora ($31,x)
$08:c202  ef fe 04 1e   sbc $1e04fe
$08:c206  f2 0e         sbc ($0e)
$08:c208  8a            txa
$08:c209  15 0d         ora $0d,x
$08:c20b  0d a1 4d      ora $4da1
$08:c20e  c1 2f         cmp ($2f,x)
$08:c210  00 9a         brk #$9a
$08:c212  0f e0 34 20   ora $2034e0
$08:c216  fe cb 14      inc $14cb,x
$08:c219  30 8a         bmi $c1a5
$08:c21b  e9 f5         sbc #$f5
$08:c21d  61 fe         adc ($fe,x)
$08:c21f  e0 13 00      cpx #$0013
$08:c222  44 8a ee      mvp $ee,$8a
$08:c225  fb            xce
$08:c226  b4 71         ldy $71,x
$08:c228  f2 1d         sbc ($1d)
$08:c22a  f4 0b 8a      pea $8a0b
$08:c22d  d3 fa         cmp ($fa,s),y
$08:c22f  04 fe         tsb $fe
$08:c231  10 df         bpl $c212
$08:c233  00 ee         brk #$ee
$08:c235  9a            txs
$08:c236  14 41         trb $41
$08:c238  ed ec e3      sbc $e3ec
$08:c23b  40            rti
$08:c23c  f0 f0         beq $c22e
$08:c23e  8a            txa
$08:c23f  32 ff         and ($ff)
$08:c241  1f 01 30 14   ora $143001,x
$08:c245  30 fa         bmi $c241
$08:c247  9a            txs
$08:c248  b0 42         bcs $c28c
$08:c24a  02 0f         cop #$0f
$08:c24c  02 0e         cop #$0e
$08:c24e  cf 30 8a b0   cmp $b08a30
$08:c252  2e 13 db      rol $db13
$08:c255  02 0d         cop #$0d
$08:c257  05 65         ora $65
$08:c259  9a            txs
$08:c25a  0d ce f1      ora $f1ce
$08:c25d  30 f0         bmi $c24f
$08:c25f  20 00 ff      jsr $ff00
$08:c262  9a            txs
$08:c263  02 00         cop #$00
$08:c265  11 f0         ora ($f0),y
$08:c267  32 0e         and ($0e)
$08:c269  cd 13 9a      cmp $9a13
$08:c26c  02 3f         cop #$3f
$08:c26e  f3 1c         sbc ($1c,s),y
$08:c270  cf 12 0e f0   cmp $f00e12
$08:c274  8a            txa
$08:c275  14 0c         trb $0c
$08:c277  b1 41         lda ($41),y
$08:c279  d0 44         bne $c2bf
$08:c27b  2f aa 8a d2   and $d28aaa
$08:c27f  52 ce         eor ($ce)
$08:c281  46 1e         lsr $1e
$08:c283  bc f5 51      ldy $51f5,x
$08:c286  9a            txs
$08:c287  f0 00         beq $c289
$08:c289  24 1d         bit $1d
$08:c28b  dd f1 21      cmp $21f1,x
$08:c28e  31 9a         and ($9a),y
$08:c290  f1 3e         sbc ($3e),y
$08:c292  be 00 10      ldx $1000,y
$08:c295  f0 10         beq $c2a7
$08:c297  0f 8a de 33   ora $33de8a
$08:c29b  ff 22 00 ea   sbc $ea0022,x
$08:c29f  b2 62         lda ($62)
$08:c2a1  8a            txa
$08:c2a2  dd 25 5f      cmp $5f25,x
$08:c2a5  ba            tsx
$08:c2a6  d3 63         cmp ($63,s),y
$08:c2a8  1f ed 9a 25   ora $259aed,x
$08:c2ac  2d de f1      and $f1de
$08:c2af  1f 04 30 10   ora $103004,x
$08:c2b3  9a            txs
$08:c2b4  cc 00 02      cpy $0200
$08:c2b7  fd 12 0f      sbc $0f12,x
$08:c2ba  0f 01 8a 3f   ora $3f8a01
$08:c2be  00 fe         brk #$fe
$08:c2c0  fd d1 61      sbc $61d1,x
$08:c2c3  cf 23 9a 31   cmp $319a23
$08:c2c7  ec d0 42      cpx $42d0
$08:c2ca  11 fd         ora ($fd),y
$08:c2cc  06 3e         asl $3e
$08:c2ce  9a            txs
$08:c2cf  df f0 0f f2   cmp $f20ff0,x
$08:c2d3  53 0e         eor ($0e,s),y
$08:c2d5  ec f2 7a      cpx $7af2
$08:c2d8  2a            rol a
$08:c2d9  ef a4 7d 9d   sbc $9d7da4
$08:c2dd  47 53         eor [$53]
$08:c2df  1d 9a ee      ora $ee9a,x
$08:c2e2  ff f0 33 fd   sbc $fd33f0,x
$08:c2e6  02 22         cop #$22
$08:c2e8  0c 9a cf      tsb $cf9a
$08:c2eb  33 00         and ($00,s),y
$08:c2ed  10 e2         bpl $c2d1
$08:c2ef  40            rti
$08:c2f0  ef 0f 9a ff   sbc $ff9a0f
$08:c2f4  e1 56         sbc ($56,x)
$08:c2f6  1d dd d0      ora $d0dd,x
$08:c2f9  42 ed         wdm #$ed
$08:c2fb  9a            txs
$08:c2fc  f0 12         beq $c310
$08:c2fe  fd f3 41      sbc $41f3,x
$08:c301  0f 0c ce 9a   ora $9ace0c
$08:c305  00 34         brk #$34
$08:c307  2e e1 11      rol $11e1
$08:c30a  1f bd 32 8a   ora $8a32bd,x
$08:c30e  31 30         and ($30),y
$08:c310  f0 31         beq $c343
$08:c312  f0 3e         beq $c352
$08:c314  bc e0 9a      ldy $9ae0,x
$08:c317  35 40         and $40,x
$08:c319  cc d0 24      cpy $24d0
$08:c31c  0c d1 11      tsb $11d1
$08:c31f  9a            txs
$08:c320  0d d2 45      ora $45d2
$08:c323  2e ef ba      rol $baef
$08:c326  f2 22         sbc ($22)
$08:c328  8a            txa
$08:c329  74 ee         stz $ee,x
$08:c32b  21 ee         and ($ee,x)
$08:c32d  da            phx
$08:c32e  f5 31         sbc $31,x
$08:c330  32 9a         and ($9a)
$08:c332  01 0e         ora ($0e,x)
$08:c334  02 2f         cop #$2f
$08:c336  ef ee 15 52   sbc $5215ee
$08:c33a  9a            txs
$08:c33b  eb            xba
$08:c33c  cf 33 1e ce   cmp $ce1e33
$08:c340  23 fd         and $fd,s
$08:c342  d0 aa         bne $c2ee
$08:c344  13 30         ora ($30,s),y
$08:c346  ff ec e1 11   sbc $11e1ec,x
$08:c34a  12 10         ora ($10)
$08:c34c  8a            txa
$08:c34d  ff eb cf 22   sbc $22cfeb,x
$08:c351  ff 35 32 3b   sbc $3b3235,x
$08:c355  9a            txs
$08:c356  c1 51         cmp ($51,x)
$08:c358  df fe f4 41   cmp $41f4fe,x
$08:c35c  0f cc aa 12   ora $12aacc
$08:c360  1f 0f f0 1e   ora $1ef00f,x
$08:c364  f0 11         beq $c377
$08:c366  32 9a         and ($9a)
$08:c368  1f c9 9d 23   ora $239dc9,x
$08:c36c  23 53         and $53,s
$08:c36e  0e dd 8a      asl $8add
$08:c371  be 43 10      ldx $1043,y
$08:c374  13 32         ora ($32,s),y
$08:c376  01 bc         ora ($bc,x)
$08:c378  46 9a         lsr $9a
$08:c37a  0e 0f e1      asl $e10f
$08:c37d  41 f0         eor ($f0,x)
$08:c37f  fd f2 31      sbc $31f2,x
$08:c382  9a            txs
$08:c383  00 dc         brk #$dc
$08:c385  01 dd         ora ($dd,x)
$08:c387  14 65         trb $65
$08:c389  30 c9         bmi $c354
$08:c38b  9a            txs
$08:c38c  9d f0 14      sta $14f0,x
$08:c38f  55 30         eor $30,x
$08:c391  cc de f2      cpy $f2de
$08:c394  8a            txa
$08:c395  42 23         wdm #$23
$08:c397  20 01 fe      jsr $fe01
$08:c39a  e2 11         sep #$11
$08:c39c  30 96         bmi $c334
$08:c39e  ec f0 fd      cpx $fdf0
$08:c3a1  de ee f1      dec $f1ee,x
$08:c3a4  24 40         bit $40
$08:c3a6  9a            txs
$08:c3a7  be 0e 03      ldx $030e,y
$08:c3aa  54 52 ea      mvn $ea,$52
$08:c3ad  ac ee 9a      ldy $9aee
$08:c3b0  e1 67         sbc ($67,x)
$08:c3b2  52 ea         eor ($ea)
$08:c3b4  bf 0f 03 22   lda $22030f,x
$08:c3b8  8a            txa
$08:c3b9  21 c0         and ($c0,x)
$08:c3bb  20 f0 df      jsr $dff0
$08:c3be  45 fd         eor $fd
$08:c3c0  00 9a         brk #$9a
$08:c3c2  fe f2 30      inc $30f2,x
$08:c3c5  f1 21         sbc ($21),y
$08:c3c7  0f cb c0 9a   ora $9ac0cb
$08:c3cb  23 43         and $43,s
$08:c3cd  23 2c         and $2c,s
$08:c3cf  ac 0d ce      ldy $ce0d
$08:c3d2  37 9a         and [$9a],y
$08:c3d4  63 0d         adc $0d,s
$08:c3d6  ce 0d e1      dec $e10d
$08:c3d9  43 20         eor $20,s
$08:c3db  ef 8a 42 d0   sbc $d0428a
$08:c3df  fb            xce
$08:c3e0  17 30         ora [$30],y
$08:c3e2  fe cd b1      inc $b1cd,x
$08:c3e5  9a            txs
$08:c3e6  42 f0         wdm #$f0
$08:c3e8  32 0e         and ($0e)
$08:c3ea  cc de 05      cpy $05de
$08:c3ed  42 9a         wdm #$9a
$08:c3ef  12 10         ora ($10)
$08:c3f1  dc ff bc      jml [$bcff]
$08:c3f4  15 54         ora $54,x
$08:c3f6  0f 9a f0 fd   ora $fdf09a
$08:c3fa  ce 34 30      dec $3034
$08:c3fd  ff 12 1e 8a   sbc $8a1e12,x
$08:c401  de e1 64      dec $64e1,x
$08:c404  1d cc cf      ora $cfcc,x
$08:c407  43 23         eor $23,s
$08:c409  9a            txs
$08:c40a  32 0e         and ($0e)
$08:c40c  cc df 01      cpy $01df
$08:c40f  54 1f 0f      mvn $0f,$1f
$08:c412  9a            txs
$08:c413  00 0e         brk #$0e
$08:c415  cb            wai
$08:c416  f3 52         sbc ($52,s),y
$08:c418  0e 03 2e      asl $2e03
$08:c41b  9a            txs
$08:c41c  cc 03 32      cpy $3203
$08:c41f  fd 03 30      sbc $3003,x
$08:c422  fd f0 9a      sbc $9af0,x
$08:c425  02 20         cop #$20
$08:c427  fe ef 10      inc $10ef,x
$08:c42a  02 44         cop #$44
$08:c42c  1d 9a cc      ora $cc9a,x
$08:c42f  df 11 24 3f   cmp $3f2411,x
$08:c433  d0 00         bne $c435
$08:c435  11 9a         ora ($9a),y
$08:c437  db            stp
$08:c438  f2 20         sbc ($20)
$08:c43a  ff 03 32 fc   sbc $fc3203,x
$08:c43e  d0 9a         bne $c3da
$08:c440  21 0e         and ($0e,x)
$08:c442  f2 43         sbc ($43)
$08:c444  0e cf 12      asl $12cf
$08:c447  ff 9a 02 ff   sbc $ff029a,x
$08:c44b  0f e2 44 2f   ora $2f44e2
$08:c44f  cc de 9a      cpy $9ade
$08:c452  03 31         ora $31,s
$08:c454  22 ec f0 13   jsl $13f0ec
$08:c458  0c e3 9a      tsb $9ae3
$08:c45b  2e dd f3      rol $f3dd
$08:c45e  42 11         wdm #$11
$08:c460  ee f0 fe      inc $fef0
$08:c463  9a            txs
$08:c464  e2 54         sep #$54
$08:c466  0f ee f1 0e   ora $0ef1ee
$08:c46a  f1 21         sbc ($21),y
$08:c46c  9a            txs
$08:c46d  0f ef 34 20   ora $2034ef
$08:c471  de de f2      dec $f2de,x
$08:c474  23 9a         and $9a,s
$08:c476  41 cc         eor ($cc,x)
$08:c478  f0 01         beq $c47b
$08:c47a  2f f2 31 ba   and $ba31f2
$08:c47e  9a            txs
$08:c47f  c2 43         rep #$43
$08:c481  22 10 fe dd   jsl $ddfe10
$08:c485  f0 35         beq $c4bc
$08:c487  8a            txa
$08:c488  40            rti
$08:c489  fd d0 0b      sbc $0bd0,x
$08:c48c  bf 45 30 ee   lda $ee3045,x
$08:c490  9a            txs
$08:c491  12 2f         ora ($2f)
$08:c493  ef 0e e1 21   sbc $21e10e
$08:c497  34 fa         bit $fa,x
$08:c499  9a            txs
$08:c49a  e0 fe         cpx #$fe
$08:c49c  31 02         and ($02),y
$08:c49e  41 da         eor ($da,x)
$08:c4a0  af 32 9a 23   lda $239a32
$08:c4a4  31 20         and ($20),y
$08:c4a6  c9 c1         cmp #$c1
$08:c4a8  43 22         eor $22,s
$08:c4aa  0e 8a 02      asl $028a
$08:c4ad  f9 cd f3      sbc $f3cd,y
$08:c4b0  63 11         adc $11,s
$08:c4b2  21 0d         and ($0d,x)
$08:c4b4  9a            txs
$08:c4b5  ee 11 00      inc $0011
$08:c4b8  1f 24 1d de   ora $de1d24,x
$08:c4bc  fe 9a 02      inc $029a,x
$08:c4bf  21 24         and ($24,x)
$08:c4c1  0c ad f1      tsb $f1ad
$08:c4c4  12 33         ora ($33)
$08:c4c6  aa            tax
$08:c4c7  21 fd         and ($fd,x)
$08:c4c9  de 23 1f      dec $1f23,x
$08:c4cc  00 01         brk #$01
$08:c4ce  0f 9a df f1   ora $f1df9a
$08:c4d2  01 22         ora ($22,x)
$08:c4d4  22 0c ce 12   jsl $12ce0c
$08:c4d8  9a            txs
$08:c4d9  21 10         and ($10,x)
$08:c4db  01 2e         ora ($2e,x)
$08:c4dd  e0 fc         cpx #$fc
$08:c4df  e1 23         sbc ($23,x)
$08:c4e1  9a            txs
$08:c4e2  32 1e         and ($1e)
$08:c4e4  cd fe f0      cmp $f0fe
$08:c4e7  34 53         bit $53,x
$08:c4e9  0c 96 0b      tsb $0b96
$08:c4ec  b0 32         bcs $c520
$08:c4ee  0f e0 32 db   ora $db32e0
$08:c4f2  ce 9a fe      dec $fe9a
$08:c4f5  02 45         cop #$45
$08:c4f7  1c ad 02      trb $02ad
$08:c4fa  23 30         and $30,s
$08:c4fc  9a            txs
$08:c4fd  f0 00         beq $c4ff
$08:c4ff  ff 0e bf 43   sbc $43bf0e,x
$08:c503  13 1e         ora ($1e,s),y
$08:c505  9a            txs
$08:c506  ef ef fe f3   sbc $f3feef
$08:c50a  64 0d         stz $0d
$08:c50c  dd f3 8a      cmp $8af3,x
$08:c50f  5e cf f1      lsr $f1cf,x
$08:c512  4e e0 f1      lsr $f1e0
$08:c515  1d df 9a      ora $9adf,x
$08:c518  26 4e         rol $4e
$08:c51a  bd df 34      lda $34df,x
$08:c51d  22 20 fe 8a   jsl $8afe20
$08:c521  d0 0c         bne $c52f
$08:c523  9e 25 64      stz $6425,x
$08:c526  ff 0e df 9a   sbc $9adf0e,x
$08:c52a  fe f1 34      inc $34f1,x
$08:c52d  2d cf 12      and $12cf
$08:c530  30 dd         bmi $c50f
$08:c532  8a            txa
$08:c533  f0 23         beq $c558
$08:c535  cb            wai
$08:c536  37 1d         and [$1d],y
$08:c538  cf 24 63 8a   cmp $8a6324
$08:c53c  ca            dex
$08:c53d  cc f6 66      cpy $66f6
$08:c540  52 ed         eor ($ed)
$08:c542  de 0f 9a      dec $9a0f,x
$08:c545  cd 23 12      cmp $1223
$08:c548  2e f2 fd      rol $fdf2
$08:c54b  f0 e1         beq $c52e
$08:c54d  9a            txs
$08:c54e  43 fe         eor $fe,s
$08:c550  de 14 31      dec $3114,x
$08:c553  ed ee f2      sbc $f2ee
$08:c556  9a            txs
$08:c557  1c f4 30      trb $30f4
$08:c55a  0f e1 30 ef   ora $ef30e1
$08:c55e  ff 9a 02 01   sbc $01029a,x
$08:c562  44 ff 0e      mvp $0e,$ff
$08:c565  ff cc 25 9a   sbc $9a25cc,x
$08:c569  2f 01 10 ff   and $ff1001
$08:c56d  ee f1 34      inc $34f1
$08:c570  1c 9a d0      trb $d09a
$08:c573  00 24         brk #$24
$08:c575  1e ee df      asl $dfee,x
$08:c578  2e e2 96      rol $96e2
$08:c57b  ff 13 22 44   sbc $442213,x
$08:c57f  1f ff f1 32   ora $32f1ff,x
$08:c583  9a            txs
$08:c584  14 2f         trb $2f
$08:c586  00 ff         brk #$ff
$08:c588  ca            dex
$08:c589  05 30         ora $30
$08:c58b  11 8a         ora ($8a),y
$08:c58d  03 09         ora $09,s
$08:c58f  af e0 67 2e   lda $2e67e0
$08:c593  dc ef 8a      jml [$8aef]
$08:c596  13 41         ora ($41,s),y
$08:c598  fe cd fc      inc $fccd,x
$08:c59b  c2 51         rep #$51
$08:c59d  03 8a         ora $8a,s
$08:c59f  30 42         bmi $c5e3
$08:c5a1  b9 ed f6      lda $f6ed,y
$08:c5a4  41 46         eor ($46,x)
$08:c5a6  fe 9a 22      inc $229a,x
$08:c5a9  fe db d3      inc $d3db,x
$08:c5ac  32 01         and ($01)
$08:c5ae  12 0e         ora ($0e)
$08:c5b0  9a            txs
$08:c5b1  ed e0 13      sbc $13e0
$08:c5b4  21 e2         and ($e2,x)
$08:c5b6  1d b1 30      ora $30b1,x
$08:c5b9  9a            txs
$08:c5ba  f1 00         sbc ($00),y
$08:c5bc  0d cf 31      ora $31cf
$08:c5bf  01 10         ora ($10,x)
$08:c5c1  23 9a         and $9a,s
$08:c5c3  fc e0 ff      jsr ($ffe0,x)
$08:c5c6  13 23         ora ($23,s),y
$08:c5c8  2e f3 3d      rol $3df3
$08:c5cb  9a            txs
$08:c5cc  dc d1 30      jml [$30d1]
$08:c5cf  f2 33         sbc ($33)
$08:c5d1  2e ae 1e      rol $1eae
$08:c5d4  9a            txs
$08:c5d5  f2 2f         sbc ($2f)
$08:c5d7  32 2f         and ($2f)
$08:c5d9  cb            wai
$08:c5da  13 ff         ora ($ff,s),y
$08:c5dc  f0 9a         beq $c578
$08:c5de  31 dd         and ($dd),y
$08:c5e0  00 02         brk #$02
$08:c5e2  1f 02 20 ef   ora $ef2002,x
$08:c5e6  9a            txs
$08:c5e7  ff f0 14 42   sbc $4214f0,x
$08:c5eb  f0 01         beq $c5ee
$08:c5ed  ec b1 9a      cpx $9ab1
$08:c5f0  32 ff         and ($ff)
$08:c5f2  15 4f         ora $4f,x
$08:c5f4  cc e0 1f      cpy $1fe0
$08:c5f7  f0 9a         beq $c593
$08:c5f9  24 60         bit $60
$08:c5fb  ac 00 ff      ldy $ff00
$08:c5fe  ff 23 0f 8a   sbc $8a0f23,x
$08:c602  fd a0 72      sbc $72a0,x
$08:c605  df 21 24 1c   cmp $1c2421,x
$08:c609  9c 9a 02      stz $029a
$08:c60c  34 12         bit $12,x
$08:c60e  20 dc ce      jsr $cedc
$08:c611  23 1f         and $1f,s
$08:c613  9a            txs
$08:c614  12 32         ora ($32)
$08:c616  fc df f1      jsr ($f1df,x)
$08:c619  0d 05 63      ora $6305
$08:c61c  9a            txs
$08:c61d  e9 d3         sbc #$d3
$08:c61f  0e ee 02      asl $02ee
$08:c622  10 20         bpl $c644
$08:c624  de 9a 23      dec $239a,x
$08:c627  0d e1 11      ora $11e1
$08:c62a  32 dc         and ($dc)
$08:c62c  f1 01         sbc ($01),y
$08:c62e  9a            txs
$08:c62f  44 31 fc      mvp $fc,$31
$08:c632  bc 03 2f      ldy $2f03,x
$08:c635  23 21         and $21,s
$08:c637  aa            tax
$08:c638  0f ff ff 00   ora $00ffff
$08:c63c  10 23         bpl $c661
$08:c63e  1c d1 9a      trb $9ad1
$08:c641  30 fe         bmi $c641
$08:c643  bf 31 01 10   lda $100131,x
$08:c647  02 0d         cop #$0d
$08:c649  9a            txs
$08:c64a  c0 21 22      cpy #$2221
$08:c64d  0e ef 01      asl $01ef
$08:c650  03 54         ora $54,s
$08:c652  9a            txs
$08:c653  fe db d1      inc $d1db,x
$08:c656  2f 25 40 fd   and $fd4025
$08:c65a  d0 9a         bne $c5f6
$08:c65c  0d f0 02      ora $02f0
$08:c65f  55 1c         eor $1c,x
$08:c661  9c 33 20      stz $2033
$08:c664  9a            txs
$08:c665  cb            wai
$08:c666  f2 21         sbc ($21)
$08:c668  e0 44 0e      cpx #$0e44
$08:c66b  bd 22 8a      lda $8a22,x
$08:c66e  02 2c         cop #$2c
$08:c670  03 ee         ora $ee,s
$08:c672  25 65         and $65
$08:c674  1e ed 9a      asl $9aed,x
$08:c677  ed ef 25      sbc $25ef
$08:c67a  62 1e ab      per $719b
$08:c67d  21 ee         and ($ee,x)
$08:c67f  aa            tax
$08:c680  10 13         bpl $c695
$08:c682  3f cc f2 31   and $31f2cc,x
$08:c686  fe e0 9a      inc $9ae0,x
$08:c689  11 ef         ora ($ef),y
$08:c68b  15 51         ora $51,x
$08:c68d  bc f1 01      ldy $01f1,x
$08:c690  1f 9a df 32   ora $32df9a,x
$08:c694  01 42         ora ($42,x)
$08:c696  fe 00 ff      inc $ff00,x
$08:c699  fc aa f2      jsr ($f2aa,x)
$08:c69c  32 10         and ($10)
$08:c69e  fd e0 10      sbc $10e0,x
$08:c6a1  f0 23         beq $c6c6
$08:c6a3  aa            tax
$08:c6a4  20 dc e1      jsr $e1dc
$08:c6a7  22 1d e0 2f   jsl $2fe01d
$08:c6ab  ff 9a 12 44   sbc $44129a,x
$08:c6af  0c e1 0f      tsb $0fe1
$08:c6b2  1f ce 12 9a   ora $9a12ce,x
$08:c6b6  24 33         bit $33
$08:c6b8  0d d0 00      ora $00d0
$08:c6bb  0f cf 56 9a   ora $9a56cf
$08:c6bf  31 fc         and ($fc),y
$08:c6c1  cf fe 03 32   cmp $3203fe
$08:c6c5  53 d9         eor ($d9,s),y
$08:c6c7  9a            txs
$08:c6c8  ad 35 2e      lda $2e35
$08:c6cb  cf 22 dc 14   cmp $14dc22
$08:c6cf  11 9a         ora ($9a),y
$08:c6d1  10 e1         bpl $c6b4
$08:c6d3  2f ff eb e1   and $e1ebff
$08:c6d7  33 65         and ($65,s),y
$08:c6d9  9a            txs
$08:c6da  0c e0 fd      tsb $fde0
$08:c6dd  11 ed         ora ($ed),y
$08:c6df  36 30         rol $30,x
$08:c6e1  ff aa ff ff   sbc $ffffaa,x
$08:c6e5  f1 12         sbc ($12),y
$08:c6e7  22 0e ce 02   jsl $02ce0e
$08:c6eb  9a            txs
$08:c6ec  20 be 32      jsr $32be
$08:c6ef  ee 12 10      inc $1012
$08:c6f2  00 e0         brk #$e0
$08:c6f4  9a            txs
$08:c6f5  44 fd dc      mvp $dc,$fd
$08:c6f8  cf 23 55 30   cmp $305523
$08:c6fc  df 9a 1e cf   cmp $cf1e9a,x
$08:c700  0f 26 4f ef   ora $ef4f26
$08:c704  ff 0e aa ff   sbc $ffaa0e,x
$08:c708  12 22         ora ($22)
$08:c70a  1f dc f3 2f   ora $2ff3dc,x
$08:c70e  ee 9a f4      inc $f49a
$08:c711  3c f5 3e      bit $3ef5,x
$08:c714  f0 ec         beq $c702
$08:c716  16 50         asl $50,x
$08:c718  9a            txs
$08:c719  db            stp
$08:c71a  ae 20 25      ldx $2520
$08:c71d  41 10         eor ($10,x)
$08:c71f  00 ec         brk #$ec
$08:c721  9a            txs
$08:c722  ce 16 63      dec $6316
$08:c725  ec e0 1f      cpx $1fe0
$08:c728  ee 12 9a      inc $9a12
$08:c72b  34 30         bit $30,x
$08:c72d  eb            xba
$08:c72e  bf 33 ea d2   lda $d2ea33,x
$08:c732  3f 9a 02 51   and $51029a,x
$08:c736  ff eb e3 54   sbc $54e3eb,x
$08:c73a  1d ac 9a      ora $9aac,x
$08:c73d  f1 12         sbc ($12),y
$08:c73f  23 11         and $11,s
$08:c741  23 0c         and $0c,s
$08:c743  bc d1 a6      ldy $a6d1,x
$08:c746  03 31         ora $31,s
$08:c748  0f ff ed e0   ora $e0edff
$08:c74c  11 24         ora ($24),y
$08:c74e  9a            txs
$08:c74f  0d bd 12      ora $12bd
$08:c752  1e bb 13      asl $13bb,x
$08:c755  02 63         cop #$63
$08:c757  9a            txs
$08:c758  f0 0b         beq $c765
$08:c75a  af 33 43 ea   lda $ea4333
$08:c75e  df 11 9a 20   cmp $209a11,x
$08:c762  22 11 41 ca   jsl $ca4111
$08:c766  de 16 60      dec $6016,x
$08:c769  9a            txs
$08:c76a  ff ee fd f4   sbc $f4fdee,x
$08:c76e  51 01         eor ($01),y
$08:c770  1f ee 9a e0   ora $e09aee,x
$08:c774  2f dc c0 31   and $31c0dc
$08:c778  27 3e         and [$3e]
$08:c77a  01 96         ora ($96,x)
$08:c77c  4d cf 13      eor $13cf
$08:c77f  55 1e         eor $1e,x
$08:c781  ef ed df 9a   sbc $9adfed
$08:c785  12 33         ora ($33)
$08:c787  1c bd e1      trb $e1bd
$08:c78a  44 21 fd      mvp $fd,$21
$08:c78d  9a            txs
$08:c78e  ed d2 53      sbc $53d2
$08:c791  11 10         ora ($10),y
$08:c793  fd df 22      sbc $22df,x
$08:c796  9a            txs
$08:c797  0a            asl a
$08:c798  af 20 24 52   lda $522420
$08:c79c  1f ec be 8a   ora $8abeec,x
$08:c7a0  44 33 fe      mvp $fe,$33
$08:c7a3  22 ec df 54   jsl $54dfec
$08:c7a7  45 9a         eor $9a
$08:c7a9  2e ee dd      rol $ddee
$08:c7ac  24 12         bit $12
$08:c7ae  3e df ed      rol $eddf,x
$08:c7b1  9a            txs
$08:c7b2  14 32         trb $32
$08:c7b4  22 0d bd 13   jsl $13bd0d
$08:c7b8  2f 99 9a 25   and $259a99
$08:c7bc  e0 64 f3      cpx #$f364
$08:c7bf  1c bd f1      trb $f1bd
$08:c7c2  20 9a f0      jsr $f09a
$08:c7c5  23 1e         and $1e,s
$08:c7c7  ee f2 32      inc $32f2
$08:c7ca  20 ce 9a      jsr $9ace
$08:c7cd  1e e3 3f      asl $3fe3,x
$08:c7d0  02 0d         cop #$0d
$08:c7d2  f0 ef         beq $c7c3
$08:c7d4  34 9a         bit $9a,x
$08:c7d6  31 11         and ($11),y
$08:c7d8  da            phx
$08:c7d9  d2 21         cmp ($21)
$08:c7db  eb            xba
$08:c7dc  c2 30         rep #$30
$08:c7de  9a            txs
$08:c7df  13 20         ora ($20,s),y
$08:c7e1  32 ca         and ($ca)
$08:c7e3  e1 11         sbc ($11,x)
$08:c7e5  fd f4 9a      sbc $9af4,x
$08:c7e8  52 fe         eor ($fe)
$08:c7ea  de 13 43      dec $4313,x
$08:c7ed  d9 e2 11      cmp $11e2,y
$08:c7f0  8a            txa
$08:c7f1  72 cd         adc ($cd)
$08:c7f3  ff 21 cd 43   sbc $43cd21,x
$08:c7f7  24 44         bit $44
$08:c7f9  9a            txs
$08:c7fa  1d ae 11      ora $11ae,x
$08:c7fd  0c d0 22      tsb $22d0
$08:c800  21 00         and ($00,x)
$08:c802  9a            txs
$08:c803  01 2e         ora ($2e,x)
$08:c805  cf 30 ed e0   cmp $e0ed30
$08:c809  44 21 aa      mvp $aa,$21
$08:c80c  0e f1 11      asl $11f1
$08:c80f  1f ce 12 32   ora $3212ce,x
$08:c813  fe 8a dc      inc $dc8a,x
$08:c816  d6 3c         dec $3c,x
$08:c818  26 fd         rol $fd
$08:c81a  36 50         rol $50,x
$08:c81c  b9 9a ff      lda $ff9a,y
$08:c81f  ef ef 32 f2   sbc $f232ef
$08:c823  3e d2 1f      rol $1fd2,x
$08:c826  9a            txs
$08:c827  f0 02         beq $c82b
$08:c829  0c cf 13      tsb $13cf
$08:c82c  33 20         and ($20,s),y
$08:c82e  de 9a 12      dec $129a,x
$08:c831  20 b9 f3      jsr $f3b9
$08:c834  55 2d         eor $2d,x
$08:c836  ef dd 9a 24   sbc $249add
$08:c83a  02 20         cop #$20
$08:c83c  df 34 fd ff   cmp $fffd34,x
$08:c840  fe 9a dd      inc $dd9a,x
$08:c843  15 3f         ora $3f,x
$08:c845  13 eb         ora ($eb,s),y
$08:c847  11 d0         ora ($d0),y
$08:c849  43 9a         eor $9a,s
$08:c84b  fe dc e2      inc $e2dc,x
$08:c84e  22 34 1f e0   jsl $e01f34
$08:c852  11 9a         ora ($9a),y
$08:c854  da            phx
$08:c855  d0 24         bne $c87b
$08:c857  52 fe         eor ($fe)
$08:c859  fc c0 53      jsr ($53c0,x)
$08:c85c  9a            txs
$08:c85d  22 0d e2 20   jsl $20e20d
$08:c861  ef 00 db e2   sbc $e2db00
$08:c865  9a            txs
$08:c866  54 00 1e      mvn $1e,$00
$08:c869  cf 1e 05 3f   cmp $3f051e
$08:c86d  ef 9a cc 03   sbc $03cc9a
$08:c871  23 52         and $52,s
$08:c873  e0 1f ed      cpx #$ed1f
$08:c876  ae 9a 32      ldx $329a
$08:c879  13 31         ora ($31,s),y
$08:c87b  0d bd 13      ora $13bd
$08:c87e  44 1e 9a      mvp $9a,$1e
$08:c881  df 21 ef 11   cmp $11ef21,x
$08:c885  fd be 24      sbc $24be,x
$08:c888  43 9a         eor $9a,s
$08:c88a  0e ee ee      asl $eeee
$08:c88d  e2 63         sep #$63
$08:c88f  ff fc bf 9a   sbc $9abffc,x
$08:c893  22 55 1e 22   jsl $221e55
$08:c897  fc aa 06      jsr ($06aa,x)
$08:c89a  2e 8a 47      rol $478a
$08:c89d  3e ca c1      rol $c1ca,x
$08:c8a0  46 63         lsr $63
$08:c8a2  ec f1 9a      cpx $9af1
$08:c8a5  fe 02 1e      inc $1e02,x
$08:c8a8  dd e1 45      cmp $45e1,x
$08:c8ab  3f ef 9a eb   and $eb9aef,x
$08:c8af  d0 35         bne $c8e6
$08:c8b1  40            rti
$08:c8b2  fe db e0      inc $e0db,x
$08:c8b5  45 aa         eor $aa
$08:c8b7  20 01 20      jsr $2001
$08:c8ba  db            stp
$08:c8bb  e1 30         sbc ($30,x)
$08:c8bd  00 11         brk #$11
$08:c8bf  9a            txs
$08:c8c0  1f ef e1 33   ora $33e1ef,x
$08:c8c4  2f e1 1c c2   and $c21ce1
$08:c8c8  9a            txs
$08:c8c9  32 dc         and ($dc)
$08:c8cb  e1 11         sbc ($11,x)
$08:c8cd  33 2f         and ($2f,s),y
$08:c8cf  fc ac 9a      jsr ($9aac,x)
$08:c8d2  24 44         bit $44
$08:c8d4  00 ed         brk #$ed
$08:c8d6  cd 03 41      cmp $4103
$08:c8d9  25 aa         and $aa
$08:c8db  20 fd ce      jsr $cefd
$08:c8de  11 11         ora ($11),y
$08:c8e0  00 11         brk #$11
$08:c8e2  0f 9a fe 03   ora $03fe9a
$08:c8e6  31 f0         and ($f0),y
$08:c8e8  2f ac 34 1e   and $1e34ac
$08:c8ec  9a            txs
$08:c8ed  ee 01 10      inc $1001
$08:c8f0  34 0d         bit $0d,x
$08:c8f2  da            phx
$08:c8f3  c2 53         rep #$53
$08:c8f5  9a            txs
$08:c8f6  22 1e cd ee   jsl $eecd1e
$08:c8fa  13 33         ora ($33,s),y
$08:c8fc  63 0e         adc $0e,s
$08:c8fe  9a            txs
$08:c8ff  b9 b0 32      lda $32b0,y
$08:c902  01 22         ora ($22,x)
$08:c904  10 ee         bpl $c8f4
$08:c906  f1 9a         sbc ($9a),y
$08:c908  33 0f         and ($0f,s),y
$08:c90a  12 ea         ora ($ea)
$08:c90c  c2 41         rep #$41
$08:c90e  f0 fe         beq $c90e
$08:c910  9a            txs
$08:c911  11 f1         ora ($f1),y
$08:c913  61 cb         adc ($cb,x)
$08:c915  dd 14 42      cmp $4214,x
$08:c918  21 9a         and ($9a,x)
$08:c91a  ec dd e1      cpx $e1dd
$08:c91d  23 56         and $56,s
$08:c91f  3f db ac 9a   and $9aacdb,x
$08:c923  f2 11         sbc ($11)
$08:c925  24 2f         bit $2f
$08:c927  ef f0 f2 41   sbc $41f2f0
$08:c92b  9a            txs
$08:c92c  f0 2e         beq $c95c
$08:c92e  bc 13 11      ldy $1113,x
$08:c931  2f cf 30 9a   and $9a30cf
$08:c935  03 2b         ora $2b,s
$08:c937  cf 0f 34 30   cmp $30340f
$08:c93b  0f ec 9a ce   ora $ce9aec
$08:c93f  03 55         ora $55,s
$08:c941  43 fd         eor $fd,s
$08:c943  ca            dex
$08:c944  cf 01 9a 34   cmp $349a01
$08:c948  32 fd         and ($fd)
$08:c94a  d0 00         bne $c94c
$08:c94c  24 2f         bit $2f
$08:c94e  00 9a         brk #$9a
$08:c950  ec df 13      cpx $13df
$08:c953  43 eb         eor $eb,s
$08:c955  f2 fe         sbc ($fe)
$08:c957  51 9a         eor ($9a),y
$08:c959  bd 3f f2      lda $f23f,x
$08:c95c  52 ff         eor ($ff)
$08:c95e  0e bd f0      asl $f0bd
$08:c961  aa            tax
$08:c962  13 22         ora ($22,s),y
$08:c964  10 fe         bpl $c964
$08:c966  ce 00 03      dec $0300
$08:c969  21 9a         and ($9a,x)
$08:c96b  20 bc 00      jsr $00bc
$08:c96e  04 41         tsb $41
$08:c970  00 ed         brk #$ed
$08:c972  ed aa f1      sbc $f1aa
$08:c975  12 30         ora ($30)
$08:c977  cf 1e f3 1d   cmp $1df31e
$08:c97b  01 9a         ora ($9a,x)
$08:c97d  0f 42 10 ff   ora $ff1042
$08:c981  dc d0 03      jml [$03d0]
$08:c984  44 9a 34      mvp $34,$9a
$08:c987  0d a9 e0      ora $e0a9
$08:c98a  f1 73         sbc ($73),y
$08:c98c  23 f9         and $f9,s
$08:c98e  9a            txs
$08:c98f  c1 00         cmp ($00,x)
$08:c991  45 10         eor $10
$08:c993  fe ed cf      inc $cfed,x
$08:c996  23 aa         and $aa,s
$08:c998  33 fc         and ($fc,s),y
$08:c99a  f0 ef         beq $c98b
$08:c99c  30 e0         bmi $c97e
$08:c99e  30 01         bmi $c9a1
$08:c9a0  9a            txs
$08:c9a1  10 ff         bpl $c9a2
$08:c9a3  fe be 01      inc $01be,x
$08:c9a6  34 34         bit $34,x
$08:c9a8  2f 9a db be   and $bedb9a
$08:c9ac  0f 25 33 3e   ora $3e3325
$08:c9b0  9d 10 aa      sta $aa10,x
$08:c9b3  02 20         cop #$20
$08:c9b5  00 0f         brk #$0f
$08:c9b7  ed 01 24      sbc $2401
$08:c9ba  3f aa ce ee   and $eeceaa,x
$08:c9be  13 fe         ora ($fe,s),y
$08:c9c0  13 11         ora ($11,s),y
$08:c9c2  0f 00 9a ee   ora $ee9a00
$08:c9c6  fd e0 12      sbc $12e0,x
$08:c9c9  43 31         eor $31,s
$08:c9cb  ee ec 9a      inc $9aec
$08:c9ce  df f2 53 32   cmp $3253f2,x
$08:c9d2  fa            plx
$08:c9d3  df 11 32 aa   cmp $aa3211,x
$08:c9d7  1f 01 0c d0   ora $d00c01,x
$08:c9db  23 52         and $52,s
$08:c9dd  eb            xba
$08:c9de  df 9a f0 30   cmp $30f09a,x
$08:c9e2  d3 74         cmp ($74,s),y
$08:c9e4  00 ee         brk #$ee
$08:c9e6  ef ff 9a ef   sbc $ef9aff
$08:c9ea  00 13         brk #$13
$08:c9ec  33 2e         and ($2e,s),y
$08:c9ee  ef ec df 9a   sbc $9adfec
$08:c9f2  25 43         and $43
$08:c9f4  1f cd f0 21   ora $21f0cd,x
$08:c9f8  11 00         ora ($00),y
$08:c9fa  aa            tax
$08:c9fb  20 cc 03      jsr $03cc
$08:c9fe  44 1e cc      mvp $cc,$1e
$08:ca01  e0 11 9a      cpx #$9a11
$08:ca04  0f 37 40 fe   ora $fe4037
$08:ca08  de ff 0f      dec $0fff,x
$08:ca0b  0f 9a ff 35   ora $35ff9a
$08:ca0f  30 f0         bmi $ca01
$08:ca11  0d bc 02      ora $02bc
$08:ca14  44 9a 42      mvp $42,$9a
$08:ca17  fd de 02      sbc $02de,x
$08:ca1a  1e f1 33      asl $33f1,x
$08:ca1d  19 aa d0      ora $d0aa,y
$08:ca20  24 41         bit $41
$08:ca22  cc d0 0f      cpy $0fd0
$08:ca25  01 11         ora ($11,x)
$08:ca27  9a            txs
$08:ca28  64 1e         stz $1e
$08:ca2a  ee ce 21      inc $21ce
$08:ca2d  fe ee 04      inc $04ee,x
$08:ca30  9a            txs
$08:ca31  43 10         eor $10,s
$08:ca33  f0 ea         beq $ca1f
$08:ca35  c0 23 45      cpy #$4523
$08:ca38  10 9a         bpl $c9d4
$08:ca3a  fe de 00      inc $00de,x
$08:ca3d  f1 21         sbc ($21),y
$08:ca3f  21 cb         and ($cb,x)
$08:ca41  f4 aa 43      pea $43aa
$08:ca44  0d ce f0      ora $f0ce
$08:ca47  00 01         brk #$01
$08:ca49  22 21 9a fe   jsl $fe9a21
$08:ca4d  db            stp
$08:ca4e  f3 2e         sbc ($2e,s),y
$08:ca50  dd d0 55      cmp $55d0,x
$08:ca53  31 9a         and ($9a),y
$08:ca55  1f fe ba 04   ora $04bafe,x
$08:ca59  23 53         and $53,s
$08:ca5b  00 ed         brk #$ed
$08:ca5d  a6 0e         ldx $0e
$08:ca5f  dd ef 00      cmp $00ef,x
$08:ca62  0f ee 03 54   ora $5403ee
$08:ca66  9a            txs
$08:ca67  bc cd e1      ldy $e1cd,x
$08:ca6a  01 52         ora ($52,x)
$08:ca6c  04 4f         tsb $4f
$08:ca6e  de 9a d0      dec $d09a,x
$08:ca71  21 ec         and ($ec,x)
$08:ca73  ae 26 53      ldx $5326
$08:ca76  11 ef         ora ($ef),y
$08:ca78  aa            tax
$08:ca79  0d c0 22      ora $22c0
$08:ca7c  22 01 2f ed   jsl $ed2f01
$08:ca80  ee 9a 55      inc $559a
$08:ca83  1f 00 f0 03   ora $03f000,x
$08:ca87  51 de         eor ($de),y
$08:ca89  ea            nop
$08:ca8a  9a            txs
$08:ca8b  b1 2f         lda ($2f),y
$08:ca8d  25 0d         and $0d
$08:ca8f  55 0d         eor $0d,x
$08:ca91  ff 00 aa 0e   sbc $0eaa00,x
$08:ca95  de 01 33      dec $3301,x
$08:ca98  10 10         bpl $caaa
$08:ca9a  fe dc aa      inc $aadc,x
$08:ca9d  13 21         ora ($21,s),y
$08:ca9f  20 12 1d      jsr $1d12
$08:caa2  cc 03 20      cpy $2003
$08:caa5  aa            tax
$08:caa6  00 f0         brk #$f0
$08:caa8  11 12         ora ($12),y
$08:caaa  fe 01 cc      inc $cc01,x
$08:caad  13 aa         ora ($aa,s),y
$08:caaf  00 10         brk #$10
$08:cab1  f2 20         sbc ($20)
$08:cab3  f1 00         sbc ($00),y
$08:cab5  0f dc 9a d1   ora $d19adc
$08:cab9  56 61         lsr $61,x
$08:cabb  f1 1e         sbc ($1e),y
$08:cabd  ca            dex
$08:cabe  a0 64 aa      ldy #$aa64
$08:cac1  21 02         and ($02,x)
$08:cac3  30 bc         bmi $ca81
$08:cac5  e0 22 1f      cpx #$1f22
$08:cac8  f0 9a         beq $ca64
$08:caca  22 12 2f ff   jsl $ff2f12
$08:cace  e9 b2         sbc #$b2
$08:cad0  41 12         eor ($12,x)
$08:cad2  9a            txs
$08:cad3  ef 32 11 12   sbc $121132
$08:cad7  1d ab bc      ora $bcab,x
$08:cada  16 aa         asl $aa,x
$08:cadc  43 0f         eor $0f,s
$08:cade  00 fe         brk #$fe
$08:cae0  ee 02 21      inc $2102
$08:cae3  12 aa         ora ($aa)
$08:cae5  22 fc cf 11   jsl $11cffc
$08:cae9  01 0f         ora ($0f,x)
$08:caeb  f2 11         sbc ($11)
$08:caed  9a            txs
$08:caee  31 ee         and ($ee),y
$08:caf0  0c bd 33      tsb $33bd
$08:caf3  10 ff         bpl $caf4
$08:caf5  11 aa         ora ($aa),y
$08:caf7  01 21         ora ($21,x)
$08:caf9  10 ec         bpl $cae7
$08:cafb  ee d0 55      inc $55d0
$08:cafe  10 9a         bpl $ca9a
$08:cb00  f0 fd         beq $caff
$08:cb02  bd 00 24      lda $2400,x
$08:cb05  22 44 1c 9a   jsl $9a1c44
$08:cb09  bc ff 01      ldy $01ff,x
$08:cb0c  20 df 44      jsr $44df
$08:cb0f  23 0c         and $0c,s
$08:cb11  9a            txs
$08:cb12  d1 dc         cmp ($dc),y
$08:cb14  f3 21         sbc ($21,s),y
$08:cb16  ed 12 00      sbc $0012
$08:cb19  34 aa         bit $aa,x
$08:cb1b  21 fd         and ($fd,x)
$08:cb1d  dd df 24      cmp $24df,x
$08:cb20  42 0e         wdm #$0e
$08:cb22  f0 9a         beq $cabe
$08:cb24  eb            xba
$08:cb25  11 e0         ora ($e0),y
$08:cb27  43 24         eor $24,s
$08:cb29  1f ee fe 9a   ora $9afeee,x
$08:cb2d  d0 21         bne $cb50
$08:cb2f  ec 04 55      cpx $5504
$08:cb32  3c bf 0d      bit $0dbf,x
$08:cb35  9a            txs
$08:cb36  f1 01         sbc ($01),y
$08:cb38  1d d2 3f      ora $3fd2,x
$08:cb3b  03 54         ora $54,s
$08:cb3d  0c aa ee      tsb $eeaa
$08:cb40  cd 03 42      cmp $4203
$08:cb43  11 fe         ora ($fe),y
$08:cb45  f0 f0         beq $cb37
$08:cb47  8a            txa
$08:cb48  2e 04 64      rol $6404
$08:cb4b  32 0e         and ($0e)
$08:cb4d  0f aa 04 9a   ora $9a04aa
$08:cb51  0d d0 36      ora $36d0
$08:cb54  71 bb         adc ($bb),y
$08:cb56  0f f2 1e 9a   ora $9a1ef2
$08:cb5a  e1 de         sbc ($de,x)
$08:cb5c  23 f1         and $f1,s
$08:cb5e  55 2e         eor $2e,x
$08:cb60  bb            tyx
$08:cb61  cb            wai
$08:cb62  9a            txs
$08:cb63  c1 56         cmp ($56,x)
$08:cb65  52 0d         eor ($0d)
$08:cb67  df 10 ff 00   cmp $00ff10,x
$08:cb6b  9a            txs
$08:cb6c  32 f0         and ($f0)
$08:cb6e  31 01         and ($01),y
$08:cb70  0c d1 2e      tsb $2ed1
$08:cb73  bf 9a 22 56   lda $56229a,x
$08:cb77  1c cd 02      trb $02cd
$08:cb7a  30 ec         bmi $cb68
$08:cb7c  f0 9a         beq $cb18
$08:cb7e  ff 22 25 50   sbc $502522,x
$08:cb82  cb            wai
$08:cb83  bc d0 23      ldy $23d0,x
$08:cb86  9a            txs
$08:cb87  34 2f         bit $2f,x
$08:cb89  ee 01 0f      inc $0f01
$08:cb8c  10 f1         bpl $cb7f
$08:cb8e  2e 9a f3      rol $f39a
$08:cb91  30 11         bmi $cba4
$08:cb93  de 1f be      dec $be1f,x
$08:cb96  11 23         ora ($23),y
$08:cb98  9a            txs
$08:cb99  43 fa         eor $fa,s
$08:cb9b  c2 41         rep #$41
$08:cb9d  ff cd 10 d1   sbc $d110cd,x
$08:cba1  9a            txs
$08:cba2  54 44 e9      mvn $e9,$44
$08:cba5  ad 00 10      lda $1000
$08:cba8  01 42         ora ($42,x)
$08:cbaa  8a            txa
$08:cbab  ec 03 4f      cpx $4f03
$08:cbae  d0 30         bne $cbe0
$08:cbb0  cc e3 45      cpy $45e3
$08:cbb3  9a            txs
$08:cbb4  32 0e         and ($0e)
$08:cbb6  ff cd 10 02   sbc $0210cd,x
$08:cbba  13 40         ora ($40,s),y
$08:cbbc  aa            tax
$08:cbbd  df 12 00 fd   cmp $fd0012,x
$08:cbc1  f2 fd         sbc ($fd)
$08:cbc3  24 21         bit $21
$08:cbc5  aa            tax
$08:cbc6  1d ce 11      ora $11ce,x
$08:cbc9  00 f0         brk #$f0
$08:cbcb  02 00         cop #$00
$08:cbcd  f1 9a         sbc ($9a),y
$08:cbcf  32 ff         and ($ff)
$08:cbd1  10 eb         bpl $cbbe
$08:cbd3  e2 21         sep #$21
$08:cbd5  34 21         bit $21,x
$08:cbd7  9a            txs
$08:cbd8  0e ab 04      asl $04ab
$08:cbdb  0e 01 34      asl $3401
$08:cbde  0c 02 9a      tsb $9a02
$08:cbe1  00 1e         brk #$1e
$08:cbe3  bf 1e f3 53   lda $53f31e,x
$08:cbe7  1e cb 9a      asl $9acb,x
$08:cbea  e2 41         sep #$41
$08:cbec  ec e0 22      cpx $22e0
$08:cbef  10 33         bpl $cc24
$08:cbf1  00 9a         brk #$9a
$08:cbf3  1f de de 01   ora $01dede,x
$08:cbf7  34 44         bit $44,x
$08:cbf9  2e bb 8a      rol $8abb
$08:cbfc  91 50         sta ($50),y
$08:cbfe  e0 13 63      cpx #$6313
$08:cc01  ff de 44 96   sbc $9644de,x
$08:cc05  20 fc ce      jsr $cefc
$08:cc08  f1 54         sbc ($54),y
$08:cc0a  fc cc f4      jsr ($f4cc,x)
$08:cc0d  9a            txs
$08:cc0e  1b            tcs
$08:cc0f  be f0 33      ldx $33f0,y
$08:cc12  13 51         ora ($51,s),y
$08:cc14  0f db 9a e0   ora $e09adb
$08:cc18  ed 35 34      sbc $3435
$08:cc1b  62 b9 c1      per $8dd7
$08:cc1e  0f 8a 23 c1   ora $c1238a
$08:cc22  41 16         eor ($16,x)
$08:cc24  1b            tcs
$08:cc25  f1 f0         sbc ($f0),y
$08:cc27  0b            phd
$08:cc28  aa            tax
$08:cc29  f1 00         sbc ($00),y
$08:cc2b  01 ee         ora ($ee,x)
$08:cc2d  f2 22         sbc ($22)
$08:cc2f  10 dc         bpl $cc0d
$08:cc31  9a            txs
$08:cc32  c1 22         cmp ($22,x)
$08:cc34  34 34         bit $34,x
$08:cc36  30 bb         bmi $cbf3
$08:cc38  d0 fc         bne $cc36
$08:cc3a  aa            tax
$08:cc3b  e2 43         sep #$43
$08:cc3d  21 0e         and ($0e,x)
$08:cc3f  df 0f f2 1f   cmp $1ff20f,x
$08:cc43  9a            txs
$08:cc44  f1 02         sbc ($02),y
$08:cc46  30 ef         bmi $cc37
$08:cc48  00 10         brk #$10
$08:cc4a  0f ef aa 00   ora $00aaef
$08:cc4e  ef f1 23 21   sbc $2123f1
$08:cc52  fc cd 02      jsr ($02cd,x)
$08:cc55  aa            tax
$08:cc56  22 22 21 fd   jsl $fd2122
$08:cc5a  ee 0f ff      inc $ff0f
$08:cc5d  34 9a         bit $9a,x
$08:cc5f  60            rts
$08:cc60  f1 eb         sbc ($eb),y
$08:cc62  d0 f0         bne $cc54
$08:cc64  12 1e         ora ($1e)
$08:cc66  e0 9a 33      cpx #$339a
$08:cc69  2e df 22      rol $22df
$08:cc6c  10 fc         bpl $cc6a
$08:cc6e  e0 dc aa      cpx #$aadc
$08:cc71  01 02         ora ($02,x)
$08:cc73  43 1d         eor $1d,s
$08:cc75  bb            tyx
$08:cc76  e1 22         sbc ($22,x)
$08:cc78  24 9a         bit $9a
$08:cc7a  40            rti
$08:cc7b  ff bb ff cf   sbc $cfffbb,x
$08:cc7f  46 53         lsr $53
$08:cc81  ff 9a 1f cd   sbc $cd1f9a,x
$08:cc85  01 01         ora ($01,x)
$08:cc87  20 bd 34      jsr $34bd
$08:cc8a  12 9a         ora ($9a)
$08:cc8c  0c e4 41      tsb $41e4
$08:cc8f  fe ab 00      inc $00ab,x
$08:cc92  cd 35 aa      cmp $aa35
$08:cc95  24 40         bit $40
$08:cc97  bb            tyx
$08:cc98  cd 04 42      cmp $4204
$08:cc9b  21 00         and ($00,x)
$08:cc9d  9a            txs
$08:cc9e  fa            plx
$08:cc9f  b0 fd         bcs $cc9e
$08:cca1  25 42         and $42
$08:cca3  30 ee         bmi $cc93
$08:cca5  0e 9a e0      asl $e09a
$08:cca8  31 0f         and ($0f),y
$08:ccaa  ec f3 32      cpx $32f3
$08:ccad  2f d1 9a 42   and $429ad1
$08:ccb1  0e db be      asl $bedb
$08:ccb4  1d e3 66      ora $66e3,x
$08:ccb7  75 aa         adc $aa,x
$08:ccb9  0c ab f1      tsb $f1ab
$08:ccbc  34 31         bit $31,x
$08:ccbe  0f 00 ee 9a   ora $9aee00
$08:ccc2  e0 14 31      cpx #$3114
$08:ccc5  12 1d         ora ($1d)
$08:ccc7  c0 10 14      cpy #$1410
$08:ccca  9a            txs
$08:cccb  2e bd ef      rol $efbd
$08:ccce  25 4f         and $4f
$08:ccd0  e2 20         sep #$20
$08:ccd2  11 aa         ora ($aa),y
$08:ccd4  ed ff ff      sbc $ffff
$08:ccd7  ff 24 41 10   sbc $104124,x
$08:ccdb  db            stp
$08:ccdc  aa            tax
$08:ccdd  ce 14 42      dec $4214
$08:cce0  0f 00 fe ff   ora $fffe00
$08:cce4  12 96         ora ($96)
$08:cce6  34 44         bit $44,x
$08:cce8  41 ca         eor ($ca,x)
$08:ccea  bc e2 57      ldy $57e2,x
$08:cced  3c 9a a0      bit $a09a,x
$08:ccf0  03 53         ora $53,s
$08:ccf2  e1 40         sbc ($40,x)
$08:ccf4  f0 ec         beq $cce2
$08:ccf6  ff aa ee ff   sbc $ffeeaa,x
$08:ccfa  02 54         cop #$54
$08:ccfc  1f fe cd f2   ora $f2cdfe,x
$08:cd00  9a            txs
$08:cd01  54 30 ef      mvn $ef,$30
$08:cd04  ff 00 f2 42   sbc $42f200,x
$08:cd08  f2 aa         sbc ($aa)
$08:cd0a  1e df 10      asl $10df,x
$08:cd0d  13 20         ora ($20,s),y
$08:cd0f  0f cd 01 9a   ora $9a01cd
$08:cd13  24 30         bit $30
$08:cd15  14 0e         trb $0e
$08:cd17  ed e0 ed      sbc $ede0
$08:cd1a  bc aa 02      ldy $02aa,x
$08:cd1d  33 30         and ($30,s),y
$08:cd1f  fe fe ef      inc $effe,x
$08:cd22  12 21         ora ($21)
$08:cd24  9a            txs
$08:cd25  ee ef 13      inc $13ef
$08:cd28  1f 03 31 1e   ora $1e3103,x
$08:cd2c  bb            tyx
$08:cd2d  9a            txs
$08:cd2e  01 13         ora ($13,x)
$08:cd30  54 1f db      mvn $db,$1f
$08:cd33  bc 15 41      ldy $4115,x
$08:cd36  aa            tax
$08:cd37  01 11         ora ($11,x)
$08:cd39  fe f0 ff      inc $fff0,x
$08:cd3c  ee e0 34      inc $34e0
$08:cd3f  9a            txs
$08:cd40  41 1f         eor ($1f,x)
$08:cd42  de ec e1      dec $e1ec,x
$08:cd45  54 0c ce      mvn $ce,$0c
$08:cd48  9a            txs
$08:cd49  25 2f         and $2f
$08:cd4b  11 23         ora ($23),y
$08:cd4d  0e ee cd      asl $cdee
$08:cd50  15 9a         ora $9a,x
$08:cd52  42 32         wdm #$32
$08:cd54  dd fc a1      cmp $a1fc,x
$08:cd57  52 03         eor ($03)
$08:cd59  10 aa         bpl $cd05
$08:cd5b  10 ff         bpl $cd5c
$08:cd5d  ff fe df 13   sbc $13dffe,x
$08:cd61  41 01         eor ($01,x)
$08:cd63  9a            txs
$08:cd64  fd de d1      sbc $d1de,x
$08:cd67  33 1d         and ($1d,s),y
$08:cd69  bd 15 30      lda $3015,x
$08:cd6c  9a            txs
$08:cd6d  12 11         ora ($11)
$08:cd6f  20 ed ee      jsr $eeed
$08:cd72  d0 54         bne $cdc8
$08:cd74  23 9a         and $9a,s
$08:cd76  1d f0 cc      ora $ccf0,x
$08:cd79  00 13         brk #$13
$08:cd7b  2f 05 3e 9a   and $9a3e05
$08:cd7f  bd dd ce      lda $cedd,x
$08:cd82  f3 56         sbc ($56,s),y
$08:cd84  20 00 dc      jsr $dc00
$08:cd87  9a            txs
$08:cd88  e1 22         sbc ($22,x)
$08:cd8a  10 cb         bpl $cd57
$08:cd8c  e4 42         cpx $42
$08:cd8e  01 23         ora ($23,x)
$08:cd90  9a            txs
$08:cd91  f0 1e         beq $cdb1
$08:cd93  d1 0a         cmp ($0a),y
$08:cd95  e5 51         sbc $51
$08:cd97  12 1f         ora ($1f)
$08:cd99  9a            txs
$08:cd9a  ef ec c1 31   sbc $31c1ec
$08:cd9e  14 41         trb $41
$08:cda0  fd ba 9a      sbc $9aba,x
$08:cda3  ce 01 44      dec $4401
$08:cda6  42 0e         wdm #$0e
$08:cda8  ed d0 43      sbc $43d0
$08:cdab  8a            txa
$08:cdac  1c bb c1      trb $c1bb
$08:cdaf  52 14         eor ($14)
$08:cdb1  54 f0 21      mvn $21,$f0
$08:cdb4  9a            txs
$08:cdb5  e0 2e bd      cpx #$bd2e
$08:cdb8  25 21         and $21
$08:cdba  24 0e         bit $0e
$08:cdbc  ee aa cd      inc $cdaa
$08:cdbf  13 11         ora ($11,s),y
$08:cdc1  11 11         ora ($11),y
$08:cdc3  ed ce f1      sbc $f1ce
$08:cdc6  9a            txs
$08:cdc7  35 43         and $43,x
$08:cdc9  2e bb f1      rol $f1bb
$08:cdcc  32 20         and ($20)
$08:cdce  de 8a 01      dec $018a,x
$08:cdd1  ce 26 62      dec $6226
$08:cdd4  e0 43 f2      cpx #$f243
$08:cdd7  2d aa ff      and $ffaa
$08:cdda  ef 22 02 31   sbc $310222
$08:cdde  ef ec c1 aa   sbc $aac1ec
$08:cde2  33 10         and ($10,s),y
$08:cde4  01 1f         ora ($1f,x)
$08:cde6  ec cf 23      cpx $23cf
$08:cde9  32 9a         and ($9a)
$08:cdeb  1f b9 d3 42   ora $42d3b9,x
$08:cdef  00 f1         brk #$f1
$08:cdf1  0f fe 9a e1   ora $e19afe
$08:cdf5  41 01         eor ($01,x)
$08:cdf7  01 22         ora ($22,x)
$08:cdf9  2f ee db 9a   and $9adbee
$08:cdfd  15 11         ora $11,x
$08:cdff  57 0d         eor [$0d],y
$08:ce01  aa            tax
$08:ce02  ad 15 62      lda $6215
$08:ce05  aa            tax
$08:ce06  00 01         brk #$01
$08:ce08  0d cd 02      ora $02cd
$08:ce0b  43 1f         eor $1f,s
$08:ce0d  de 9a c0      dec $c09a,x
$08:ce10  34 00         bit $00,x
$08:ce12  11 00         ora ($00),y
$08:ce14  00 dc         brk #$dc
$08:ce16  04 8a         tsb $8a
$08:ce18  5e f3 66      lsr $66f3,x
$08:ce1b  50 ca         bvc $cde7
$08:ce1d  bd 00 15      lda $1500,x
$08:ce20  aa            tax
$08:ce21  22 11 ec d0   jsl $d0ec11
$08:ce25  f0 23         beq $ce4a
$08:ce27  00 f0         brk #$f0
$08:ce29  aa            tax
$08:ce2a  11 eb         ora ($eb),y
$08:ce2c  d1 43         cmp ($43),y
$08:ce2e  20 de ff      jsr $ffde
$08:ce31  f1 9a         sbc ($9a),y
$08:ce33  32 11         and ($11)
$08:ce35  10 01         bpl $ce38
$08:ce37  0c a0 52      tsb $52a0
$08:ce3a  e0 9a 43      cpx #$439a
$08:ce3d  32 fc         and ($fc)
$08:ce3f  df 11 f0 34   cmp $34f011,x
$08:ce43  01 aa         ora ($aa,x)
$08:ce45  1f ce 00 02   ora $0200ce,x
$08:ce49  20 ef 11      jsr $11ef
$08:ce4c  0e 9a be      asl $be9a
$08:ce4f  45 30         eor $30
$08:ce51  dc d0 fe      jml [$fed0]
$08:ce54  03 43         ora $43,s
$08:ce56  9a            txs
$08:ce57  0f f2 10 bc   ora $bc10f2
$08:ce5b  f3 10         sbc ($10,s),y
$08:ce5d  23 24         and $24,s
$08:ce5f  9a            txs
$08:ce60  2d bf 12      and $12bf
$08:ce63  10 f2         bpl $ce57
$08:ce65  1f f2 dd 8a   ora $8addf2,x
$08:ce69  f3 00         sbc ($00,s),y
$08:ce6b  00 1e         brk #$1e
$08:ce6d  cf 11 ff 34   cmp $34ff11
$08:ce71  9a            txs
$08:ce72  0f fe ef ff   ora $ffeffe
$08:ce76  f0 35         beq $cead
$08:ce78  2f e0 9a 21   and $219ae0
$08:ce7c  ee fd f3      inc $f3fd
$08:ce7f  20 24 3f      jsr $3f24
$08:ce82  ee 9a f1      inc $f19a
$08:ce85  43 ed         eor $ed,s
$08:ce87  01 ee         ora ($ee,x)
$08:ce89  00 12         brk #$12
$08:ce8b  10 9a         bpl $ce27
$08:ce8d  fd e1 0e      sbc $0ee1,x
$08:ce90  e0 14 52      cpx #$5214
$08:ce93  ca            dex
$08:ce94  e1 9a         sbc ($9a,x)
$08:ce96  0f ff f0 13   ora $13f0ff
$08:ce9a  31 ff         and ($ff),y
$08:ce9c  00 11         brk #$11
$08:ce9e  9a            txs
$08:ce9f  0e cf 32      asl $32cf
$08:cea2  f1 41         sbc ($41),y
$08:cea4  11 dd         ora ($dd),y
$08:cea6  46 9a         lsr $9a
$08:cea8  1d ee dd      ora $ddee,x
$08:ceab  11 13         ora ($13),y
$08:cead  30 0e         bmi $cebd
$08:ceaf  cd aa 00      cmp $00aa
$08:ceb2  0f f1 43 0c   ora $0c43f1
$08:ceb6  df 10 0f 8a   cmp $8a0f10,x
$08:ceba  e4 3e         cpx $3e
$08:cebc  25 2e         and $2e
$08:cebe  dc 26 41      jml [$4126]
$08:cec1  fb            xce
$08:cec2  9a            txs
$08:cec3  d1 1f         cmp ($1f),y
$08:cec5  f2 34         sbc ($34)
$08:cec7  2e f3 3f      rol $3ff3
$08:ceca  ef 9a da f3   sbc $f3da9a
$08:cece  11 43         ora ($43),y
$08:ced0  1f cc ef 00   ora $00efcc,x
$08:ced4  aa            tax
$08:ced5  ff 34 2e de   sbc $de2e34,x
$08:ced9  ff 01 00 11   sbc $110001,x
$08:cedd  9a            txs
$08:cede  ff 11 ed 02   sbc $02ed11,x
$08:cee2  33 30         and ($30,s),y
$08:cee4  cc 01 9a      cpy $9a01
$08:cee7  de 36 43      dec $4336,x
$08:ceea  0e f2 0e      asl $0ef2
$08:ceed  ed df 9a      sbc $9adf
$08:cef0  02 44         cop #$44
$08:cef2  11 fc         ora ($fc),y
$08:cef4  ce f0 0e      dec $0ef0
$08:cef7  f5 9a         sbc $9a,x
$08:cef9  64 fc         stz $fc
$08:cefb  bb            tyx
$08:cefc  d1 31         cmp ($31),y
$08:cefe  22 ff 0f 9a   jsl $9a0fff
$08:cf02  f0 0f         beq $cf13
$08:cf04  03 65         ora $65,s
$08:cf06  ec ce ff      cpx $ffce
$08:cf09  f1 9a         sbc ($9a),y
$08:cf0b  67 40         adc [$40]
$08:cf0d  de f0 f0      dec $f0f0,x
$08:cf10  ec e1 24      cpx $24e1
$08:cf13  9a            txs
$08:cf14  41 ff         eor ($ff,x)
$08:cf16  dd ff 0f      cmp $0fff,x
$08:cf19  de 47 50      dec $5047,x
$08:cf1c  9a            txs
$08:cf1d  ca            dex
$08:cf1e  be 22 f1      ldx $f122,y
$08:cf21  43 fc         eor $fc,s
$08:cf23  b0 30         bcs $cf55
$08:cf25  aa            tax
$08:cf26  f0 24         beq $cf4c
$08:cf28  2f ee ef 10   and $10efee
$08:cf2c  02 43         cop #$43
$08:cf2e  9a            txs
$08:cf2f  fb            xce
$08:cf30  c0 11 fe      cpy #$fe11
$08:cf33  df 02 43 ff   cmp $ff4302,x
$08:cf37  aa            tax
$08:cf38  0f f0 1f ed   ora $ed1ff0
$08:cf3c  02 42         cop #$42
$08:cf3e  0e ee 9a      asl $9aee
$08:cf41  f1 0f         sbc ($0f),y
$08:cf43  24 2e         bit $2e
$08:cf45  bd 12 0f      lda $0f12,x
$08:cf48  04 aa         tsb $aa
$08:cf4a  42 ee         wdm #$ee
$08:cf4c  ef f0 12 12   sbc $1212f0
$08:cf50  20 ee 9a      jsr $9aee
$08:cf53  02 2f         cop #$2f
$08:cf55  ee ff 13      inc $13ff
$08:cf58  2e 02 10      rol $1002
$08:cf5b  aa            tax
$08:cf5c  1f dc e1 43   ora $43e1dc,x
$08:cf60  10 ff         bpl $cf61
$08:cf62  fe f0 9a      inc $9af0,x
$08:cf65  13 40         ora ($40,s),y
$08:cf67  ce e0 11      dec $11e0
$08:cf6a  f2 45         sbc ($45)
$08:cf6c  2f 9a cd ef   and $efcd9a
$08:cf70  12 11         ora ($11)
$08:cf72  32 fe         and ($fe)
$08:cf74  01 11         ora ($11,x)
$08:cf76  a6 0f         ldx $0f
$08:cf78  ee cc ef      inc $efcc
$08:cf7b  ef 13 44 1d   sbc $1d4413
$08:cf7f  aa            tax
$08:cf80  cf 33 21 10   cmp $102133
$08:cf84  fe df 11      inc $11df,x
$08:cf87  10 8a         bpl $cf13
$08:cf89  0f 0a d4 30   ora $30d40a
$08:cf8d  25 53         and $53
$08:cf8f  2e cc 8a      rol $8acc
$08:cf92  f1 1f         sbc ($1f),y
$08:cf94  03 3f         ora $3f,s
$08:cf96  14 21         trb $21
$08:cf98  31 bc         and ($bc),y
$08:cf9a  aa            tax
$08:cf9b  fe 01 0f      inc $0f01,x
$08:cf9e  23 30         and $30,s
$08:cfa0  dc de f1      jml [$f1de]
$08:cfa3  aa            tax
$08:cfa4  23 32         and $32,s
$08:cfa6  0d cf 10      ora $10cf
$08:cfa9  f0 11         beq $cfbc
$08:cfab  00 9a         brk #$9a
$08:cfad  ee 13 0e      inc $0e13
$08:cfb0  03 43         ora $43,s
$08:cfb2  0e f0 ee      asl $eef0
$08:cfb5  9a            txs
$08:cfb6  ff 02 32 11   sbc $113202,x
$08:cfba  22 fe dd cf   jsl $cfddfe
$08:cfbe  9a            txs
$08:cfbf  11 25         ora ($25),y
$08:cfc1  63 d9         adc $d9,s
$08:cfc3  ad cd 25      lda $25cd
$08:cfc6  65 9a         adc $9a
$08:cfc8  4f a9 f1 fe   eor $fef1a9
$08:cfcc  11 11         ora ($11),y
$08:cfce  1f f1 9a 1f   ora $1f9af1,x
$08:cfd2  df 46 41 fe   cmp $fe4146,x
$08:cfd6  ed de e1      sbc $e1de
$08:cfd9  9a            txs
$08:cfda  45 21         eor $21
$08:cfdc  12 2f         ora ($2f)
$08:cfde  cd cd f2      cmp $f2cd
$08:cfe1  14 aa         trb $aa
$08:cfe3  32 fe         and ($fe)
$08:cfe5  ef ee e1 34   sbc $34e1ee
$08:cfe9  21 fd         and ($fd,x)
$08:cfeb  96 fd         stx $fd,y
$08:cfed  dc ce ef      jml [$efce]
$08:cff0  24 21         bit $21
$08:cff2  10 ec         bpl $cfe0
$08:cff4  aa            tax
$08:cff5  02 43         cop #$43
$08:cff7  1e ef ee      asl $eeef,x
$08:cffa  f0 03         beq $cfff
$08:cffc  31 9a         and ($9a),y
$08:cffe  01 21         ora ($21,x)
$08:d000  fd cc df      sbc $dfcc,x
$08:d003  24 52         bit $52
$08:d005  1f aa fe fe   ora $fefeaa,x
$08:d009  ee 24 31      inc $3124
$08:d00c  0f ee e0 aa   ora $aae0ee
$08:d010  00 01         brk #$01
$08:d012  11 1f         ora ($1f),y
$08:d014  ff 0f f0 45   sbc $45f00f,x
$08:d018  aa            tax
$08:d019  2f ef ed e0   and $e0edef
$08:d01d  01 34         ora ($34,x)
$08:d01f  1f f1 9a 30   ora $309af1,x
$08:d023  cb            wai
$08:d024  dd 13 22      cmp $2213,x
$08:d027  21 ff         and ($ff,x)
$08:d029  dd 9a cd      cmp $cd9a,x
$08:d02c  04 54         tsb $54
$08:d02e  20 ec ae      jsr $aeec
$08:d031  11 f3         ora ($f3),y
$08:d033  aa            tax
$08:d034  10 01         bpl $d037
$08:d036  ff f0 ff 25   sbc $25fff0,x
$08:d03a  40            rti
$08:d03b  ef aa fe df   sbc $dffeaa
$08:d03f  00 13         brk #$13
$08:d041  31 00         and ($00),y
$08:d043  01 0e         ora ($0e,x)
$08:d045  9a            txs
$08:d046  be 00 00      ldx $0000,y
$08:d049  24 2f         bit $2f
$08:d04b  dd ef f0      cmp $f0ef,x
$08:d04e  9a            txs
$08:d04f  13 32         ora ($32,s),y
$08:d051  0e cc e1      asl $e1cc
$08:d054  10 33         bpl $d089
$08:d056  fe 9a 1f      inc $1f9a,x
$08:d059  cf 10 15 73   cmp $731510
$08:d05d  0d dd dc      ora $dcdd
$08:d060  9a            txs
$08:d061  f0 03         beq $d066
$08:d063  65 1f         adc $1f
$08:d065  00 11         brk #$11
$08:d067  ec e0 9a      cpx $9ae0
$08:d06a  dd 14 42      cmp $4214,x
$08:d06d  fd e0 ff      sbc $ffe0,x
$08:d070  ff 24 9a 1f   sbc $1f9a24,x
$08:d074  0e bd 22      asl $22bd
$08:d077  14 2c         trb $2c
$08:d079  c1 0e         cmp ($0e,x)
$08:d07b  9a            txs
$08:d07c  f2 22         sbc ($22)
$08:d07e  34 2f         bit $2f,x
$08:d080  ee ee ce      inc $ceee
$08:d083  11 9a         ora ($9a),y
$08:d085  25 41         and $41
$08:d087  00 01         brk #$01
$08:d089  1e ee db      asl $dbee,x
$08:d08c  e3 96         sbc $96,s
$08:d08e  c0 10 f0      cpy #$f010
$08:d091  10 ed         bpl $d080
$08:d093  d0 22         bne $d0b7
$08:d095  35 9a         and $9a,x
$08:d097  eb            xba
$08:d098  e2 22         sep #$22
$08:d09a  20 ce 2f      jsr $2fce
$08:d09d  d0 43         bne $d0e2
$08:d09f  9a            txs
$08:d0a0  11 21         ora ($21),y
$08:d0a2  ff 01 db d1   sbc $d1db01,x
$08:d0a6  23 32         and $32,s
$08:d0a8  9a            txs
$08:d0a9  11 22         ora ($22),y
$08:d0ab  00 fc         brk #$fc
$08:d0ad  cd c0 43      cmp $43c0
$08:d0b0  01 9a         ora ($9a,x)
$08:d0b2  11 1f         ora ($1f),y
$08:d0b4  dd ff 11      cmp $11ff,x
$08:d0b7  11 1e         ora ($1e),y
$08:d0b9  df 8a 35 1f   cmp $1f358a,x
$08:d0bd  0c b3 1c      tsb $1cb3
$08:d0c0  17 3f         ora [$3f],y
$08:d0c2  23 9a         and $9a,s
$08:d0c4  1f 12 0b be   ora $be0b12,x
$08:d0c8  12 23         ora ($23)
$08:d0ca  31 04         and ($04),y
$08:d0cc  9a            txs
$08:d0cd  20 0e 9a      jsr $9a0e
$08:d0d0  00 01         brk #$01
$08:d0d2  21 13         and ($13,x)
$08:d0d4  40            rti
$08:d0d5  96 3f         stx $3f,y
$08:d0d7  dc cc d0      jml [$d0cc]
$08:d0da  34 32         bit $32,x
$08:d0dc  12 33         ora ($33)
$08:d0de  8a            txa
$08:d0df  ef de 32 e1   sbc $e132de
$08:d0e3  30 02         bmi $d0e7
$08:d0e5  11 45         ora ($45),y
$08:d0e7  9a            txs
$08:d0e8  2e bb e0      rol $e0bb
$08:d0eb  33 31         and ($31,s),y
$08:d0ed  13 41         ora ($41,s),y
$08:d0ef  ff aa ec e2   sbc $e2ecaa,x
$08:d0f3  1e f2 11      asl $11f2,x
$08:d0f6  22 ed f0 8a   jsl $8af0ed
$08:d0fa  dd 0f 16      cmp $160f,x
$08:d0fd  60            rts
$08:d0fe  dd f1 1e      cmp $1ef1,x
$08:d101  de 9a 02      dec $029a,x
$08:d104  2f f0 f0 12   and $12f0f0
$08:d108  13 31         ora ($31,s),y
$08:d10a  db            stp
$08:d10b  9a            txs
$08:d10c  cd 04 41      cmp $4104
$08:d10f  13 34         ora ($34,s),y
$08:d111  1c bd df      trb $dfbd
$08:d114  8a            txa
$08:d115  31 9e         and ($9e),y
$08:d117  66 37         ror $37
$08:d119  49 9e         eor #$9e
$08:d11b  ca            dex
$08:d11c  f0 8a         beq $d0a8
$08:d11e  e2 77         sep #$77
$08:d120  0d ee f2      ora $f2ee
$08:d123  0b            phd
$08:d124  e4 4f         cpx $4f
$08:d126  9a            txs
$08:d127  ff e0 22 02   sbc $0222e0,x
$08:d12b  33 1c         and ($1c,s),y
$08:d12d  ac f1 9a      ldy $9af1
$08:d130  33 22         and ($22,s),y
$08:d132  34 2e         bit $2e,x
$08:d134  ac f0 f0      ldy $f0f0
$08:d137  0f 8a e4 33   ora $33e48a
$08:d13b  54 db ab      mvn $ab,$db
$08:d13e  ed d0 46      sbc $46d0
$08:d141  8a            txa
$08:d142  71 cf         adc ($cf),y
$08:d144  fd 31 be      sbc $be31,x
$08:d147  51 df         eor ($df),y
$08:d149  ec 9a 02      cpx $029a
$08:d14c  31 13         and ($13),y
$08:d14e  30 ca         bmi $d11a
$08:d150  d0 12         bne $d164
$08:d152  42 9a         wdm #$9a
$08:d154  14 4f         trb $4f
$08:d156  bc e0 00      ldy $00e0,x
$08:d159  e0 20         cpx #$20
$08:d15b  f0 9a         beq $d0f7
$08:d15d  21 31         and ($31,x)
$08:d15f  cc ff df      cpy $dfff
$08:d162  21 23         and ($23,x)
$08:d164  0f 8a 10 e3   ora $e3108a
$08:d168  1a            inc a
$08:d169  f2 dd         sbc ($dd)
$08:d16b  1e d4 52      asl $52d4,x
$08:d16e  9a            txs
$08:d16f  12 22         ora ($22)
$08:d171  fc cf 00      jsr ($00cf,x)
$08:d174  24 31         bit $31
$08:d176  32 9a         and ($9a)
$08:d178  db            stp
$08:d179  e0 f0         cpx #$f0
$08:d17b  1f 03 fc 04   ora $04fc03,x
$08:d17f  10 8a         bpl $d10b
$08:d181  1e ac dd      asl $ddac,x
$08:d184  12 01         ora ($01)
$08:d186  32 23         and ($23)
$08:d188  00 8a         brk #$8a
$08:d18a  1e c0 ea      asl $eac0,x
$08:d18d  e2 f1         sep #$f1
$08:d18f  63 05         adc $05,s
$08:d191  4f 8a 0f da   eor $da0f8a
$08:d195  b1 65         lda ($65),y
$08:d197  33 33         and ($33,s),y
$08:d199  1a            inc a
$08:d19a  cd 9a df      cmp $df9a
$08:d19d  23 00         and $00,s
$08:d19f  0f c0 31 f2   ora $f231c0
$08:d1a3  0c 8a b1      tsb $b18a
$08:d1a6  0e 0f f2      asl $f20f
$08:d1a9  44 52 0f      mvp $0f,$52
$08:d1ac  dd 9a fc      cmp $fc9a,x
$08:d1af  d1 20         cmp ($20),y
$08:d1b1  22 01 31 ee   jsl $ee3101
$08:d1b5  01 9a         ora ($9a,x)
$08:d1b7  ee 24 00      inc $0024
$08:d1ba  12 10         ora ($10)
$08:d1bc  ee ce 13      inc $13ce
$08:d1bf  8a            txa
$08:d1c0  35 1a         and $1a,x
$08:d1c2  bf 10 00 0f   lda $0f0010,x
$08:d1c6  0f ff 9a ff   ora $ff9aff
$08:d1ca  ff 02 53 10   sbc $105302,x
$08:d1ce  fd fd be      sbc $befd,x
$08:d1d1  9a            txs
$08:d1d2  42 01         wdm #$01
$08:d1d4  21 12         and ($12,x)
$08:d1d6  1d c0 20      ora $20c0,x
$08:d1d9  13 8a         ora ($8a,s),y
$08:d1db  4e c0 45      lsr $45c0
$08:d1de  0c 99 e6      tsb $e699
$08:d1e1  42 43         wdm #$43
$08:d1e3  9a            txs
$08:d1e4  de 1f c0      dec $c01f,x
$08:d1e7  2f 03 0e 00   and $000e03
$08:d1eb  de 9a f0      dec $f09a,x
$08:d1ee  35 42         and $42,x
$08:d1f0  0d ed cc      ora $cced
$08:d1f3  f3 42         sbc ($42,s),y
$08:d1f5  9a            txs
$08:d1f6  00 22         brk #$22
$08:d1f8  1f cd 02 14   ora $1402cd,x
$08:d1fc  31 dd         and ($dd),y
$08:d1fe  8a            txa
$08:d1ff  07 5d         ora [$5d]
$08:d201  aa            tax
$08:d202  b1 53         lda ($53),y
$08:d204  16 3c         asl $3c,x
$08:d206  c0 9a         cpy #$9a
$08:d208  ec f1 02      cpx $02f1
$08:d20b  30 e0         bmi $d1ed
$08:d20d  0e de 04      asl $04de
$08:d210  9a            txs
$08:d211  45 2f         eor $2f
$08:d213  ee c9 e2      inc $e2c9
$08:d216  43 2e         eor $2e,s
$08:d218  f3 9a         sbc ($9a,s),y
$08:d21a  40            rti
$08:d21b  dc e0 23      jml [$23e0]
$08:d21e  42 0e         wdm #$0e
$08:d220  e0 20         cpx #$20
$08:d222  9a            txs
$08:d223  fe ed 12      inc $12ed,x
$08:d226  22 20 00 db   jsl $db0020
$08:d22a  ef 9a 02 31   sbc $31029a
$08:d22e  00 00         brk #$00
$08:d230  fc c0 46      jsr ($46c0,x)
$08:d233  41 9a         eor ($9a,x)
$08:d235  ff eb ae 44   sbc $44aeeb,x
$08:d239  20 ff 44      jsr $44ff
$08:d23c  fb            xce
$08:d23d  9a            txs
$08:d23e  df 02 43 21   cmp $214302,x
$08:d242  ef 0f e0 0e   sbc $0ee00f
$08:d246  9a            txs
$08:d247  f0 02         beq $d24b
$08:d249  42 01         wdm #$01
$08:d24b  eb            xba
$08:d24c  c0 e0         cpy #$e0
$08:d24e  33 9a         and ($9a,s),y
$08:d250  ff 23 0d bd   sbc $bd0d23,x
$08:d254  05 52         ora $52
$08:d256  01 fc         ora ($fc,x)
$08:d258  9a            txs
$08:d259  bd 04 40      lda $4004,x
$08:d25c  df 34 2d be   cmp $be2d34,x
$08:d260  11 9a         ora ($9a),y
$08:d262  11 34         ora ($34),y
$08:d264  2e 0f cd      rol $cd0f
$08:d267  10 f0         bpl $d259
$08:d269  00 9a         brk #$9a
$08:d26b  24 21         bit $21
$08:d26d  ed ce f0      sbc $f0ce
$08:d270  01 10         ora ($10,x)
$08:d272  14 9a         trb $9a
$08:d274  3d bd f0      and $f0bd,x
$08:d277  44 10 1e      mvp $1e,$10
$08:d27a  ce 10 9a      dec $9a10
$08:d27d  22 ec 25 1f   jsl $1f25ec
$08:d281  fe e0 21      inc $21e0,x
$08:d284  03 9a         ora $9a,s
$08:d286  41 00         eor ($00,x)
$08:d288  ec df 02      cpx $02df
$08:d28b  0f 04 32 9a   ora $9a3204
$08:d28f  fd cf ff      sbc $ffcf,x
$08:d292  00 f0         brk #$f0
$08:d294  33 10         and ($10,s),y
$08:d296  ee 8a ce      inc $ce8a
$08:d299  05 52         ora $52
$08:d29b  0d af 44      ora $44af
$08:d29e  1f bb 8a 16   ora $168abb,x
$08:d2a2  5f cf 1e f2   eor $f21ecf,x
$08:d2a6  12 67         ora ($67)
$08:d2a8  20 8a db      jsr $db8a
$08:d2ab  ca            dex
$08:d2ac  c2 30         rep #$30
$08:d2ae  03 65         ora $65,s
$08:d2b0  fa            plx
$08:d2b1  bd 8a 01      lda $018a,x
$08:d2b4  0b            phd
$08:d2b5  d2 24         cmp ($24)
$08:d2b7  50 cf         bvc $d288
$08:d2b9  0d d2 9a      ora $9ad2
$08:d2bc  21 1e         and ($1e,x)
$08:d2be  ce 35 30      dec $3035
$08:d2c1  cb            wai
$08:d2c2  f4 2f 8a      pea $8a2f
$08:d2c5  d0 02         bne $d2c9
$08:d2c7  1e f3 55      asl $55f3,x
$08:d2ca  31 dc         and ($dc),y
$08:d2cc  ff 9a de 11   sbc $11de9a,x
$08:d2d0  01 22         ora ($22,x)
$08:d2d2  1e cf 11      asl $11cf,x
$08:d2d5  0f 9a df 23   ora $23df9a
$08:d2d9  1f ef 12 ff   ora $ff12ef,x
$08:d2dd  11 ff         ora ($ff),y
$08:d2df  9a            txs
$08:d2e0  ec 06 62      cpx $6206
$08:d2e3  fb            xce
$08:d2e4  c1 3e         cmp ($3e,x)
$08:d2e6  e0 10 8a      cpx #$8a10
$08:d2e9  34 ee         bit $ee,x
$08:d2eb  46 31         lsr $31
$08:d2ed  fa            plx
$08:d2ee  c1 1e         cmp ($1e,x)
$08:d2f0  e0 8a d0      cpx #$d08a
$08:d2f3  67 1b         adc [$1b]
$08:d2f5  ad 03 5e      lda $5e03
$08:d2f8  9d 23 9a      sta $9a23,x
$08:d2fb  31 cd         and ($cd),y
$08:d2fd  22 00 1f 00   jsl $001f00
$08:d301  dc 04 9a      jml [$9a04]
$08:d304  43 1f         eor $1f,s
$08:d306  df 1f cf 21   cmp $21cf1f,x
$08:d30a  01 10         ora ($10,x)
$08:d30c  9a            txs
$08:d30d  12 22         ora ($22)
$08:d30f  fd cf 21      sbc $21cf,x
$08:d312  01 fd         ora ($fd,x)
$08:d314  04 8a         tsb $8a
$08:d316  4d be ff      eor $ffbe
$08:d319  23 eb         and $eb,s
$08:d31b  15 30         ora $30,x
$08:d31d  ba            tsx
$08:d31e  96 e1         stx $e1,y
$08:d320  32 23         and ($23)
$08:d322  20 0d ad      jsr $ad0d
$08:d325  35 33         and $33,x
$08:d327  9a            txs
$08:d328  01 1f         ora ($1f,x)
$08:d32a  ce 00 11      dec $1100
$08:d32d  00 32         brk #$32
$08:d32f  12 9a         ora ($9a)
$08:d331  1d ce 00      ora $00ce,x
$08:d334  12 2f         ora ($2f)
$08:d336  ef 21 ef 9a   sbc $9aef21
$08:d33a  00 f1         brk #$f1
$08:d33c  0e 03 21      asl $2103
$08:d33f  ec e3 2e      cpx $2ee3
$08:d342  9a            txs
$08:d343  12 fd         ora ($fd)
$08:d345  ef 04 41 ee   sbc $ee4104
$08:d349  01 21         ora ($21,x)
$08:d34b  9a            txs
$08:d34c  fd e0 00      sbc $00e0,x
$08:d34f  00 23         brk #$23
$08:d351  32 1d         and ($1d)
$08:d353  be 8a 21      ldx $218a,y
$08:d356  d0 42         bne $d39a
$08:d358  32 db         and ($db)
$08:d35a  f1 0f         sbc ($0f),y
$08:d35c  0f 9a ff 02   ora $02ff9a
$08:d360  32 fd         and ($fd)
$08:d362  d0 21         bne $d385
$08:d364  f1 0d         sbc ($0d),y
$08:d366  9a            txs
$08:d367  df 14 61 ce   cmp $ce6114,x
$08:d36b  1f f2 2f ff   ora $ff2ff2,x
$08:d36f  9a            txs
$08:d370  0f ff 22 33   ora $3322ff
$08:d374  1e dd 01      asl $01dd,x
$08:d377  fe 8a 12      inc $128a,x
$08:d37a  36 2d         rol $2d,x
$08:d37c  ad 11 ff      lda $ff11
$08:d37f  0e f2 9a      asl $9af2
$08:d382  32 0f         and ($0f)
$08:d384  df 00 13 0c   cmp $0c1300,x
$08:d388  cd 05 aa      cmp $aa05
$08:d38b  42 ee         wdm #$ee
$08:d38d  00 f0         brk #$f0
$08:d38f  10 f1         bpl $d382
$08:d391  10 ff         bpl $d392
$08:d393  9a            txs
$08:d394  e2 53         sep #$53
$08:d396  ff ee 01 ff   sbc $ff01ee,x
$08:d39a  0f f3 8a 6f   ora $6f8af3
$08:d39e  df ef 0e f0   cmp $f00eef,x
$08:d3a2  ff 56 2e 9a   sbc $9a2e56,x
$08:d3a6  ff 0e 02 2e   sbc $2e020e,x
$08:d3aa  cc e3 66      cpy $66e3
$08:d3ad  2d 8a af      and $af8a
$08:d3b0  0e 0e e0      asl $e00e
$08:d3b3  44 2c c2      mvp $c2,$2c
$08:d3b6  64 8a         stz $8a
$08:d3b8  1d bd 02      ora $02bd,x
$08:d3bb  1e e0 02      asl $02e0,x
$08:d3be  0e 11 8a      asl $8a11
$08:d3c1  11 fc         ora ($fc),y
$08:d3c3  e0 e0         cpx #$e0
$08:d3c5  33 52         and ($52,s),y
$08:d3c7  cb            wai
$08:d3c8  23 9a         and $9a,s
$08:d3ca  ff 00 ee df   sbc $dfee00,x
$08:d3ce  47 4e         eor [$4e]
$08:d3d0  df 10 8a 0c   cmp $0c8a10,x
$08:d3d4  de 23 10      dec $1023,x
$08:d3d7  25 50         and $50
$08:d3d9  dd dd 8a      cmp $8add,x
$08:d3dc  f1 ff         sbc ($ff),y
$08:d3de  22 13 fa c1   jsl $c1fa13
$08:d3e2  13 30         ora ($30,s),y
$08:d3e4  8a            txa
$08:d3e5  ce 00 11      dec $1100
$08:d3e8  23 0c         and $0c,s
$08:d3ea  f2 21         sbc ($21)
$08:d3ec  ec 9a fe      cpx $fe9a
$08:d3ef  e0 23         cpx #$23
$08:d3f1  41 ee         eor ($ee,x)
$08:d3f3  02 1f         cop #$1f
$08:d3f5  ef 9a f0 f0   sbc $f0f09a
$08:d3f9  14 53         trb $53
$08:d3fb  ec ee f0      cpx $f0ee
$08:d3fe  ff 9a 02 33   sbc $33029a,x
$08:d402  0c df 00      tsb $00df
$08:d405  21 00         and ($00,x)
$08:d407  00 8a         brk #$8a
$08:d409  00 01         brk #$01
$08:d40b  ff 1f 15 2c   sbc $2c151f,x
$08:d40f  bb            tyx
$08:d410  be 9a 25      ldx $259a,y
$08:d413  30 ef         bmi $d404
$08:d415  01 11         ora ($11,x)
$08:d417  ff 0e df 9a   sbc $9adf0e,x
$08:d41b  13 65         ora ($65,s),y
$08:d41d  0e ed df      asl $dfed
$08:d420  fe e1 56      inc $56e1,x
$08:d423  9a            txs
$08:d424  1d ce 00      ora $00ce,x
$08:d427  ff 02 33 0e   sbc $0e3302,x
$08:d42b  ff 9a ff 10   sbc $10ff9a,x
$08:d42f  03 3e         ora $3e,s
$08:d431  df ed 05 40   cmp $4005ed,x
$08:d435  9a            txs
$08:d436  ef 01 20 f0   sbc $f02001
$08:d43a  10 cc         bpl $d408
$08:d43c  05 43         ora $43
$08:d43e  9a            txs
$08:d43f  11 ff         ora ($ff),y
$08:d441  ee cd f0      inc $f0cd
$08:d444  36 4e         rol $4e,x
$08:d446  de 9a f0      dec $f09a,x
$08:d449  fd d2 54      sbc $54d2,x
$08:d44c  20 0e dc      jsr $dc0e
$08:d44f  f1 8a         sbc ($8a),y
$08:d451  55 50         eor $50,x
$08:d453  ed aa 06      sbc $06aa
$08:d456  51 fe         eor ($fe),y
$08:d458  04 9a         tsb $9a
$08:d45a  10 e0         bpl $d43c
$08:d45c  11 ec         ora ($ec),y
$08:d45e  e4 62         cpx $62
$08:d460  0f 00 9a 10   ora $109a00
$08:d464  ca            dex
$08:d465  d1 24         cmp ($24),y
$08:d467  42 dd         wdm #$dd
$08:d469  f1 0e         sbc ($0e),y
$08:d46b  9a            txs
$08:d46c  ce 25 53      dec $5325
$08:d46f  0f dc de f4   ora $f4dedc
$08:d473  62 9a ff      per $d410
$08:d476  ed e2 2f      sbc $2fe2
$08:d479  f1 10         sbc ($10),y
$08:d47b  42 dd         wdm #$dd
$08:d47d  9a            txs
$08:d47e  00 fe         brk #$fe
$08:d480  f3 62         sbc ($62,s),y
$08:d482  00 ee         brk #$ee
$08:d484  12 ec         ora ($ec)
$08:d486  9a            txs
$08:d487  de 14 41      dec $4114,x
$08:d48a  fe e0 0e      inc $0ee0,x
$08:d48d  ef 02 9a 54   sbc $549a02
$08:d491  00 1d         brk #$1d
$08:d493  bd d0 55      lda $55d0,x
$08:d496  21 fd         and ($fd,x)
$08:d498  9a            txs
$08:d499  e0 fe         cpx #$fe
$08:d49b  02 11         cop #$11
$08:d49d  33 0e         and ($0e,s),y
$08:d49f  ce ef 9a      dec $9aef
$08:d4a2  04 53         tsb $53
$08:d4a4  20 dd f1      jsr $f1dd
$08:d4a7  fe ef 12      inc $12ef,x
$08:d4aa  8a            txa
$08:d4ab  53 fd         eor ($fd,s),y
$08:d4ad  ee eb a0      inc $a0eb
$08:d4b0  65 45         adc $45
$08:d4b2  2f 9a 10 db   and $db109a
$08:d4b6  df 23 43 1f   cmp $1f4323,x
$08:d4ba  ee ed 9a      inc $9aed
$08:d4bd  f2 21         sbc ($21)
$08:d4bf  24 2f         bit $2f
$08:d4c1  ec bd 23      cpx $23bd
$08:d4c4  55 9a         eor $9a,x
$08:d4c6  3f fe ce 0f   and $0fcefe,x
$08:d4ca  f0 11         beq $d4dd
$08:d4cc  32 fe         and ($fe)
$08:d4ce  9a            txs
$08:d4cf  0f fd cd 36   ora $36cdfd
$08:d4d3  41 f0         eor ($f0,x)
$08:d4d5  01 fc         ora ($fc,x)
$08:d4d7  9a            txs
$08:d4d8  ce 13 12      dec $1213
$08:d4db  32 0f         and ($0f)
$08:d4dd  cb            wai
$08:d4de  f1 12         sbc ($12),y
$08:d4e0  9a            txs
$08:d4e1  32 21         and ($21)
$08:d4e3  1c 9c 03      trb $039c
$08:d4e6  47 30         eor [$30]
$08:d4e8  0f 9a db ef   ora $efdb9a
$08:d4ec  10 11         bpl $d4ff
$08:d4ee  13 2f         ora ($2f,s),y
$08:d4f0  e0 ed         cpx #$ed
$08:d4f2  9a            txs
$08:d4f3  dc f4 74      jml [$74f4]
$08:d4f6  1e 01 fc      asl $fc01,x
$08:d4f9  de f2 9a      dec $9af2,x
$08:d4fc  31 22         and ($22),y
$08:d4fe  20 db d1      jsr $d1db
$08:d501  21 12         and ($12,x)
$08:d503  22 9a 1f ba   jsl $ba1f9a
$08:d507  e2 44         sep #$44
$08:d509  42 1f         wdm #$1f
$08:d50b  ec de 9a      cpx $9ade
$08:d50e  f1 21         sbc ($21),y
$08:d510  01 20         ora ($20,x)
$08:d512  11 fb         ora ($fb),y
$08:d514  cd f0 9a      cmp $9af0
$08:d517  55 30         eor $30,x
$08:d519  0f fe ee f1   ora $f1eefe
$08:d51d  01 33         ora ($33,x)
$08:d51f  96 44         stx $44,y
$08:d521  3f cc de ff   and $ffdecc,x
$08:d525  01 45         ora ($45,x)
$08:d527  1b            tcs
$08:d528  9a            txs
$08:d529  e1 24         sbc ($24,x)
$08:d52b  42 1f         wdm #$1f
$08:d52d  ee dd f1      inc $f1dd
$08:d530  12 9a         ora ($9a)
$08:d532  10 00         bpl $d534
$08:d534  12 0e         ora ($0e)
$08:d536  dc d0 12      jml [$12d0]
$08:d539  33 9a         and ($9a,s),y
$08:d53b  21 ee         and ($ee,x)
$08:d53d  ff ef f0 34   sbc $34f0ef,x
$08:d541  10 ed         bpl $d530
$08:d543  8a            txa
$08:d544  d3 52         cmp ($52,s),y
$08:d546  ff ff 23 fd   sbc $fd23ff,x
$08:d54a  df 24 8a 56   cmp $568a24,x
$08:d54e  4c cf ca      jmp $cacf
$08:d551  d1 22         cmp ($22),y
$08:d553  24 1d         bit $1d
$08:d555  9a            txs
$08:d556  f2 2f         sbc ($2f)
$08:d558  ef ed e0 23   sbc $23e0ed
$08:d55c  41 ee         eor ($ee,x)
$08:d55e  9a            txs
$08:d55f  10 0f         bpl $d570
$08:d561  dd 24 20      cmp $2024,x
$08:d564  ee f1 22      inc $22f1
$08:d567  8a            txa
$08:d568  30 cc         bmi $d536
$08:d56a  ef e0 56 0f   sbc $0f56e0
$08:d56e  13 30         ora ($30,s),y
$08:d570  8a            txa
$08:d571  dd ee ee      cmp $eeee,x
$08:d574  e0 36         cpx #$36
$08:d576  3e e1 00      rol $00e1,x
$08:d579  8a            txa
$08:d57a  01 fb         ora ($fb,x)
$08:d57c  ad f1 77      lda $77f1
$08:d57f  eb            xba
$08:d580  23 22         and $22,s
$08:d582  9a            txs
$08:d583  eb            xba
$08:d584  f3 2f         sbc ($2f,s),y
$08:d586  ff 02 30 11   sbc $113002,x
$08:d58a  0e 9a dd      asl $dd9a
$08:d58d  e0 26         cpx #$26
$08:d58f  50 df         bvc $d570
$08:d591  10 0f         bpl $d5a2
$08:d593  ef 8a 1f df   sbc $df1f8a
$08:d597  03 63         ora $63,s
$08:d599  fd fe 13      sbc $13fe,x
$08:d59c  2e 8a bb      rol $bb8a
$08:d59f  de 25 1d      dec $1d25,x
$08:d5a2  25 02         and $02
$08:d5a4  3c 9f 9a      bit $9a9f,x
$08:d5a7  1e e0 23      asl $23e0,x
$08:d5aa  32 00         and ($00)
$08:d5ac  0f dc df 9a   ora $9adfdc
$08:d5b0  16 73         asl $73,x
$08:d5b2  ee e0 1f      inc $1fe0
$08:d5b5  e0 0f         cpx #$0f
$08:d5b7  ff 8a 01 43   sbc $43018a,x
$08:d5bb  41 bc         eor ($bc,x)
$08:d5bd  14 0f         trb $0f
$08:d5bf  fe bd 8a      inc $8abd,x
$08:d5c2  1f d1 64 20   ora $2064d1,x
$08:d5c6  f1 1d         sbc ($1d),y
$08:d5c8  cb            wai
$08:d5c9  ad 9a 14      lda $149a
$08:d5cc  44 20 ef      mvp $ef,$20
$08:d5cf  ec be 15      cpx $15be
$08:d5d2  65 8a         adc $8a
$08:d5d4  2d ad 01      and $01ad
$08:d5d7  ee 0f df      inc $df0f
$08:d5da  0f 15 8a 50   ora $508a15
$08:d5de  fd d3 3e      sbc $3ed3,x
$08:d5e1  f1 da         sbc ($da),y
$08:d5e3  10 9c         bpl $d581
$08:d5e5  9a            txs
$08:d5e6  44 1f 01      mvp $01,$1f
$08:d5e9  00 fe         brk #$fe
$08:d5eb  bd 03 45      lda $4503,x
$08:d5ee  9a            txs
$08:d5ef  41 ff         eor ($ff,x)
$08:d5f1  dc bd 14      jml [$14bd]
$08:d5f4  54 2f ff      mvn $ff,$2f
$08:d5f7  8a            txa
$08:d5f8  ff 00 fc e1   sbc $e1fc00,x
$08:d5fc  ee 03 44      inc $4403
$08:d5ff  1f 9a ff 00   ora $00ff9a,x
$08:d603  01 0d         ora ($0d,x)
$08:d605  e1 ed         sbc ($ed,x)
$08:d607  24 20         bit $20
$08:d609  9a            txs
$08:d60a  f0 10         beq $d61c
$08:d60c  ff dc f1 33   sbc $33f1dc,x
$08:d610  44 2f 9b      mvp $9b,$2f
$08:d613  dd bc f3      cmp $f3bc,x
$08:d616  34 31         bit $31,x
$08:d618  0f ff 00 51   ora $5100ff
$08:d61c  00 02         brk #$02
$08:d61e  00 00         brk #$00
$08:d620  00 00         brk #$00
$08:d622  00 00         brk #$00
$08:d624  00 00         brk #$00
$08:d626  b2 0a         lda ($0a)
$08:d628  cc cb bd      cpy $bdcb
$08:d62b  ed f0 ee      sbc $eef0
$08:d62e  fd ba 12      sbc $12ba,x
$08:d631  e0 12         cpx #$12
$08:d633  2b            pld
$08:d634  a4 6f         ldy $6f
$08:d636  ef 02 b6 0e   sbc $0eb602
$08:d63a  11 e1         ora ($e1),y
$08:d63c  30 03         bmi $d641
$08:d63e  21 12         and ($12,x)
$08:d640  4e b2 0a      lsr $0ab2
$08:d643  cc bb bd      cpy $bdbb
$08:d646  ed ef ef      sbc $efef
$08:d649  0e ba 11      asl $11ba
$08:d64c  f0 12         beq $d660
$08:d64e  3a            dec a
$08:d64f  94 7f         sty $7f,x
$08:d651  e0 01         cpx #$01
$08:d653  b6 0e         ldx $0e,y
$08:d655  01 f1         ora ($f1,x)
$08:d657  20 13 11      jsr $1113
$08:d65a  12 4f         ora ($4f)
$08:d65c  b2 1a         lda ($1a)
$08:d65e  cd cb bd      cmp $bdcb
$08:d661  dc e0 ee      jml [$eee0]
$08:d664  fd bb 12      sbc $12bb,x
$08:d667  ff 12 2b a4   sbc $a42b12,x
$08:d66b  6f e0 01 00   adc $0001e0
$08:d66f  00 00         brk #$00
$08:d671  00 00         brk #$00
$08:d673  00 00         brk #$00
$08:d675  00 00         brk #$00
$08:d677  00 00         brk #$00
$08:d679  00 00         brk #$00
$08:d67b  00 00         brk #$00
$08:d67d  00 00         brk #$00
$08:d67f  00 00         brk #$00
$08:d681  00 00         brk #$00
$08:d683  00 00         brk #$00
$08:d685  00 00         brk #$00
$08:d687  00 00         brk #$00
$08:d689  00 00         brk #$00
$08:d68b  00 00         brk #$00
$08:d68d  00 30         brk #$30
$08:d68f  8e 01 df      stx $df01
$08:d692  20 df 00      jsr $00df
$08:d695  ff 80 ff 00   sbc $00ff80,x
$08:d699  ff 02 ff 0a   sbc $0aff02,x
$08:d69d  ff ff 00 ea   sbc $ea00ff,x
$08:d6a1  00 55         brk #$55
$08:d6a3  00 5b         brk #$5b
$08:d6a5  00 65         brk #$65
$08:d6a7  00 52         brk #$52
$08:d6a9  00 80         brk #$80
$08:d6ab  00 01         brk #$01
$08:d6ad  00 8a         brk #$8a
$08:d6af  fa            plx
$08:d6b0  4d 7c 65      eor $657c
$08:d6b3  3f d5 8e 20   and $208ed5,x
$08:d6b7  9d 62 de      sta $de62,x
$08:d6ba  39 f7 1a      and $1af7,y
$08:d6bd  f7 35         sbc [$35],y
$08:d6bf  00 93         brk #$93
$08:d6c1  00 d0         brk #$d0
$08:d6c3  00 68         brk #$68
$08:d6c5  00 ea         brk #$ea
$08:d6c7  00 a9         brk #$a9
$08:d6c9  00 c4         brk #$c4
$08:d6cb  00 44         brk #$44
$08:d6cd  00 84         brk #$84
$08:d6cf  7f 11 ee 0e   adc $0eee11,x
$08:d6d3  f1 91         sbc ($91),y
$08:d6d5  ee a5 fa      inc $faa5
$08:d6d8  9a            txs
$08:d6d9  dd 2b e3      cmp $e32b,x
$08:d6dc  15 fc         ora $fc,x
$08:d6de  40            rti
$08:d6df  00 e0         brk #$e0
$08:d6e1  00 71         brk #$71
$08:d6e3  00 4e         brk #$4e
$08:d6e5  00 40         brk #$40
$08:d6e7  00 60         brk #$60
$08:d6e9  00 dc         brk #$dc
$08:d6eb  00 43         brk #$43
$08:d6ed  00 15         brk #$15
$08:d6ef  fa            plx
$08:d6f0  5a            phy
$08:d6f1  bd 51 b7      lda $b751,x
$08:d6f4  c2 3e         rep #$3e
$08:d6f6  64 9c         stz $9c
$08:d6f8  ab            plb
$08:d6f9  59 54 b1      eor $b154,y
$08:d6fc  6b            rtl
$08:d6fd  62 c2 00      per $d7c2
$08:d700  84 00         sty $00
$08:d702  8c 00 39      sty $3900
$08:d705  00 13         brk #$13
$08:d707  00 06         brk #$06
$08:d709  00 0e         brk #$0e
$08:d70b  00 9c         brk #$9c
$08:d70d  00 75         brk #$75
$08:d70f  f5 6a         sbc $6a,x
$08:d711  c1 1c         cmp ($1c,x)
$08:d713  c3 60         cmp $60,s
$08:d715  a7 30         lda [$30]
$08:d717  df 03 ff 46   cmp $46ff03,x
$08:d71b  ff 4d ff 8a   sbc $8aff4d,x
$08:d71f  00 be         brk #$be
$08:d721  00 bd         brk #$bd
$08:d723  00 9a         brk #$9a
$08:d725  00 c4         brk #$c4
$08:d727  00 a8         brk #$a8
$08:d729  00 b0         brk #$b0
$08:d72b  00 90         brk #$90
$08:d72d  00 50         brk #$50
$08:d72f  d3 2e         cmp ($2e,s),y
$08:d731  e3 20         sbc $20,s
$08:d733  d3 96         cmp ($96,s),y
$08:d735  6d 0a f5      adc $f50a
$08:d738  94 6b         sty $6b,x
$08:d73a  ea            nop
$08:d73b  95 15         sta $15,x
$08:d73d  ea            nop
$08:d73e  ad 00 9d      lda $9d00
$08:d741  00 cd         brk #$cd
$08:d743  00 41         brk #$41
$08:d745  00 61         brk #$61
$08:d747  00 23         brk #$23
$08:d749  00 15         brk #$15
$08:d74b  00 0a         brk #$0a
$08:d74d  00 80         brk #$80
$08:d74f  3f 31 4e 28   and $284e31,x
$08:d753  d7 11         cmp [$11],y
$08:d755  ef 2c fb 15   sbc $15fb2c
$08:d759  ff 2c fd 56   sbc $56fd2c,x
$08:d75d  d1 f3         cmp ($f3),y
$08:d75f  00 ca         brk #$ca
$08:d761  00 46         brk #$46
$08:d763  00 c6         brk #$c6
$08:d765  00 c2         brk #$c2
$08:d767  00 42         brk #$42
$08:d769  00 43         brk #$43
$08:d76b  00 ad         brk #$ad
$08:d76d  00 a3         brk #$a3
$08:d76f  58            cli
$08:d770  59 af 82      eor $82af,y
$08:d773  7f 50 7f 88   adc $887f50,x
$08:d777  bf 4e 37 46   lda $46374e,x
$08:d77b  f8            sed
$08:d77c  90 6c         bcc $d7ea
$08:d77e  17 00         ora [$00],y
$08:d780  a0 00 68      ldy #$6800
$08:d783  00 a4         brk #$a4
$08:d785  00 73         brk #$73
$08:d787  00 e8         brk #$e8
$08:d789  00 37         brk #$37
$08:d78b  00 2b         brk #$2b
$08:d78d  00 00         brk #$00
$08:d78f  ff 11 ee 5a   sbc $5aee11,x
$08:d793  bf 35 f7 6b   lda $6bf735,x
$08:d797  cb            wai
$08:d798  2a            rol a
$08:d799  e3 19         sbc $19,s
$08:d79b  fe 67 99      inc $9967,x
$08:d79e  9f 00 e0 00   sta $00e000,x
$08:d7a2  80 00         bra $d7a4
$08:d7a4  88            dey
$08:d7a5  00 b4         brk #$b4
$08:d7a7  00 9d         brk #$9d
$08:d7a9  00 82         brk #$82
$08:d7ab  00 80         brk #$80
$08:d7ad  00 45         brk #$45
$08:d7af  ee 9a db      inc $db9a
$08:d7b2  a9 f9 c5      lda #$c5f9
$08:d7b5  bd fa ff      lda $fffa,x
$08:d7b8  8e 75 2b      stx $2b75
$08:d7bb  fe 77 75      inc $7577,x
$08:d7be  10 00         bpl $d7c0
$08:d7c0  a4 80         ldy $80
$08:d7c2  86 80         stx $80
$08:d7c4  82 80 f8      brl $d047
$08:d7c7  f8            sed
$08:d7c8  04 04         tsb $04
$08:d7ca  02 02         cop #$02
$08:d7cc  89 01 f5      bit #$f501
$08:d7cf  72 b5         adc ($b5)
$08:d7d1  a9 aa c9      lda #$c9aa
$08:d7d4  ca            dex
$08:d7d5  c7 2d         cmp [$2d]
$08:d7d7  1e d8 c7      asl $c7d8,x
$08:d7da  bc 3c 55      ldy $553c,x
$08:d7dd  93 70         sta ($70,s),y
$08:d7df  8f a1 5e 08   sta $085ea1
$08:d7e3  f7 c0         sbc [$c0],y
$08:d7e5  3f 00 ff c0   and $c0ff00,x
$08:d7e9  3f 3c c3 10   and $10c33c,x
$08:d7ed  ef 26 1f 6d   sbc $6d1f26
$08:d7f1  01 d2         ora ($d2,x)
$08:d7f3  e1 9c         sbc ($9c,x)
$08:d7f5  1c 6a 64      trb $646a
$08:d7f8  d9 e1 da      cmp $dae1,y
$08:d7fb  3c 92 e1      bit $e192,x
$08:d7fe  00 ff         brk #$ff
$08:d800  01 fe         ora ($fe,x)
$08:d802  00 ff         brk #$ff
$08:d804  1c e3 60      trb $60e3
$08:d807  9f 01 fe 00   sta $00fe01,x
$08:d80b  ff 00 ff 00   sbc $00ff00,x
$08:d80f  ff be 67 7b   sbc $7b67be,x
$08:d813  c9 d6 90      cmp #$90d6
$08:d816  ae a0 97      ldx $97a0
$08:d819  68            pla
$08:d81a  71 fe         adc ($fe),y
$08:d81c  00 ff         brk #$ff
$08:d81e  ff 00 18 00   sbc $001800,x
$08:d822  36 00         rol $00,x
$08:d824  6f 00 5f 00   adc $005f00
$08:d828  00 00         brk #$00
$08:d82a  00 00         brk #$00
$08:d82c  ff 00 5f d0   sbc $d05f00,x
$08:d830  ac f3 41      ldy $41f3
$08:d833  fe ba e4      inc $e4ba,x
$08:d836  5f ef b1 4f   eor $4fb1ef,x
$08:d83a  e6 19         inc $19
$08:d83c  ce 39 21      dec $2139
$08:d83f  01 03         ora ($03,x)
$08:d841  00 0c         brk #$0c
$08:d843  03 00         ora $00,s
$08:d845  0f 0f 00 0f   ora $0f000f
$08:d849  00 01         brk #$01
$08:d84b  00 03         brk #$03
$08:d84d  03 d9         ora $d9,s
$08:d84f  c6 92         dec $92
$08:d851  93 2d         sta ($2d,s),y
$08:d853  cc 63 7f      cpy $7f63
$08:d856  95 f1         sta $f1,x
$08:d858  26 c7         rol $c7
$08:d85a  25 19         and $19
$08:d85c  6d 8c c0      adc $c08c
$08:d85f  3f 93 6c 0c   and $0c6c93,x
$08:d863  f3 7f         sbc ($7f,s),y
$08:d865  80 f1         bra $d858
$08:d867  0e 07 f8      asl $f807
$08:d86a  01 fe         ora ($fe,x)
$08:d86c  0c f3 00      tsb $00f3
$08:d86f  ff 9a 82 a6   sbc $a6829a,x
$08:d873  10 5d         bpl $d8d2
$08:d875  1c 6c 63      trb $636c
$08:d878  55 a5         eor $a5,x
$08:d87a  5a            phy
$08:d87b  3c b5 40      bit $40b5,x
$08:d87e  ff 00 82 7d   sbc $7d8200,x
$08:d882  00 ff         brk #$ff
$08:d884  1c e3 60      trb $60e3
$08:d887  9f 05 fa 00   sta $00fa05,x
$08:d88b  ff 00 ff 54   sbc $54ff00,x
$08:d88f  ff a4 f7 a8   sbc $a8f7a4,x
$08:d893  af 4c 47 b9   lda $b9474c
$08:d897  8f 62 0e 45   sta $450e62
$08:d89b  1a            inc a
$08:d89c  89 3f 02      bit #$023f
$08:d89f  00 08         brk #$08
$08:d8a1  00 53         brk #$53
$08:d8a3  00 ba         brk #$ba
$08:d8a5  00 74         brk #$74
$08:d8a7  00 fd         brk #$fd
$08:d8a9  00 f3         brk #$f3
$08:d8ab  00 e2         brk #$e2
$08:d8ad  00 30         brk #$30
$08:d8af  df 4c fb 58   cmp $58fb4c,x
$08:d8b3  ef a4 bf 6e   sbc $6ebfa4
$08:d8b7  35 80         and $80,x
$08:d8b9  3f d6 7b 28   and $287bd6,x
$08:d8bd  67 c4         adc [$c4]
$08:d8bf  00 22         brk #$22
$08:d8c1  00 22         brk #$22
$08:d8c3  00 52         brk #$52
$08:d8c5  00 d1         brk #$d1
$08:d8c7  00 c9         brk #$c9
$08:d8c9  00 89         brk #$89
$08:d8cb  00 95         brk #$95
$08:d8cd  00 8a         brk #$8a
$08:d8cf  fe 43 7f      inc $7f43,x
$08:d8d2  a2 bf 51      ldx #$51bf
$08:d8d5  5f 98 8f 52   eor $528f98,x
$08:d8d9  c5 aa         cmp $aa
$08:d8db  8f 98 9e 21   sta $219e98
$08:d8df  00 90         brk #$90
$08:d8e1  00 48         brk #$48
$08:d8e3  00 a4         brk #$a4
$08:d8e5  00 76         brk #$76
$08:d8e7  00 3d         brk #$3d
$08:d8e9  00 74         brk #$74
$08:d8eb  00 65         brk #$65
$08:d8ed  00 75         brk #$75
$08:d8ef  06 3b         asl $3b
$08:d8f1  ac dd ca      ldy $cadd
$08:d8f4  43 cc         eor $cc,s
$08:d8f6  34 eb         bit $eb,x
$08:d8f8  19 df 22      ora $22df,y
$08:d8fb  ee 14 fc      inc $fc14
$08:d8fe  f8            sed
$08:d8ff  00 50         brk #$50
$08:d901  00 30         brk #$30
$08:d903  00 30         brk #$30
$08:d905  00 11         brk #$11
$08:d907  00 22         brk #$22
$08:d909  00 95         brk #$95
$08:d90b  00 4b         brk #$4b
$08:d90d  00 22         brk #$22
$08:d90f  bb            tyx
$08:d910  67 bd         adc [$bd]
$08:d912  43 de         eor $de,s
$08:d914  31 df         and ($df),y
$08:d916  82 cd 39      brl $12e6
$08:d919  6e 85 a6      ror $a685
$08:d91c  58            cli
$08:d91d  37 c4         and [$c4],y
$08:d91f  00 ca         brk #$ca
$08:d921  00 a1         brk #$a1
$08:d923  00 a4         brk #$a4
$08:d925  00 74         brk #$74
$08:d927  00 d2         brk #$d2
$08:d929  00 5a         brk #$5a
$08:d92b  00 eb         brk #$eb
$08:d92d  00 a8         brk #$a8
$08:d92f  d7 53         cmp [$53],y
$08:d931  f5 f1         sbc $f1,x
$08:d933  ef 6a 07 82   sbc $82076a
$08:d937  9e 75 ef      stz $ef75,x
$08:d93a  42 fa         wdm #$fa
$08:d93c  a5 50         lda $50
$08:d93e  06 00         asl $00
$08:d940  0c 00 14      tsb $1400
$08:d943  00 f4         brk #$f4
$08:d945  00 69         brk #$69
$08:d947  00 08         brk #$08
$08:d949  00 15         brk #$15
$08:d94b  00 1f         brk #$1f
$08:d94d  00 2c         brk #$2c
$08:d94f  a3 70         lda $70,s
$08:d951  8f 29 f7 2b   sta $2bf729
$08:d955  d7 52         cmp [$52],y
$08:d957  ee 63 fe      inc $fe63
$08:d95a  50 df         bvc $d93b
$08:d95c  a8            tay
$08:d95d  8b            phb
$08:d95e  da            phx
$08:d95f  00 f6         brk #$f6
$08:d961  00 84         brk #$84
$08:d963  00 c4         brk #$c4
$08:d965  00 e9         brk #$e9
$08:d967  00 f9         brk #$f9
$08:d969  00 dc         brk #$dc
$08:d96b  20 8b 74      jsr $748b
$08:d96e  59 a7 2d      eor $2da7,y
$08:d971  da            phx
$08:d972  9a            txs
$08:d973  f9 26 61      sbc $6126,y
$08:d976  98            tya
$08:d977  67 20         adc [$20]
$08:d979  d7 00         cmp [$00],y
$08:d97b  ff 00 3d a4   sbc $a43d00,x
$08:d97f  00 c2         brk #$c2
$08:d981  00 45         brk #$45
$08:d983  00 dd         brk #$dd
$08:d985  00 bb         brk #$bb
$08:d987  00 4e         brk #$4e
$08:d989  00 d6         brk #$d6
$08:d98b  00 2d         brk #$2d
$08:d98d  c2 19         rep #$19
$08:d98f  e7 c1         sbc [$c1]
$08:d991  ff 52 5d 30   sbc $305d52,x
$08:d995  1f e2 3d 8d   ora $8d3de2,x
$08:d999  fe 5a bf      inc $bf5a,x
$08:d99c  ed 1e 64      sbc $641e
$08:d99f  00 1c         brk #$1c
$08:d9a1  00 a4         brk #$a4
$08:d9a3  00 ee         brk #$ee
$08:d9a5  00 d1         brk #$d1
$08:d9a7  00 20         brk #$20
$08:d9a9  00 00         brk #$00
$08:d9ab  00 00         brk #$00
$08:d9ad  00 58         brk #$58
$08:d9af  df dc ff b9   cmp $b9ffdc,x
$08:d9b3  bb            tyx
$08:d9b4  6d 07 50      adc $5007
$08:d9b7  fe 07 f9      inc $f907,x
$08:d9ba  48            pha
$08:d9bb  b7 34         lda [$34],y
$08:d9bd  ff 22 00 02   sbc $020022,x
$08:d9c1  00 46         brk #$46
$08:d9c3  00 fa         brk #$fa
$08:d9c5  00 05         brk #$05
$08:d9c7  00 f8         brk #$f8
$08:d9c9  00 86         brk #$86
$08:d9cb  00 81         brk #$81
$08:d9cd  00 95         brk #$95
$08:d9cf  e4 6e         cpx $6e
$08:d9d1  88            dey
$08:d9d2  69 67 ac      adc #$ac67
$08:d9d5  9f 6d f1 b6   sta $b6f16d,x
$08:d9d9  31 db         and ($db),y
$08:d9db  db            stp
$08:d9dc  b4 44         ldy $44,x
$08:d9de  04 fb         tsb $fb
$08:d9e0  08            php
$08:d9e1  f7 60         sbc [$60],y
$08:d9e3  9f 80 7f 01   sta $017f80,x
$08:d9e7  fe 30 cf      inc $cf30,x
$08:d9ea  db            stp
$08:d9eb  24 04         bit $04
$08:d9ed  fb            xce
$08:d9ee  b3 0f         lda ($0f,s),y
$08:d9f0  56 11         lsr $11,x
$08:d9f2  95 e4         sta $e4,x
$08:d9f4  9b            txy
$08:d9f5  1b            tcs
$08:d9f6  b6 81         ldx $81,y
$08:d9f8  5d 9c 6f      eor $6f9c,x
$08:d9fb  0f fd f2 00   ora $00f2fd
$08:d9ff  ff 10 ef 04   sbc $04ef10,x
$08:da03  fb            xce
$08:da04  1b            tcs
$08:da05  e4 80         cpx $80
$08:da07  7f 1c e3 0f   adc $0fe31c,x
$08:da0b  f0 f0         beq $d9fd
$08:da0d  0f 00 00 00   ora $000000
$08:da11  00 00         brk #$00
$08:da13  00 00         brk #$00
$08:da15  00 00         brk #$00
$08:da17  00 00         brk #$00
$08:da19  00 00         brk #$00
$08:da1b  00 00         brk #$00
$08:da1d  00 00         brk #$00
$08:da1f  00 00         brk #$00
$08:da21  00 00         brk #$00
$08:da23  00 00         brk #$00
$08:da25  00 00         brk #$00
$08:da27  00 00         brk #$00
$08:da29  00 00         brk #$00
$08:da2b  00 00         brk #$00
$08:da2d  00 00         brk #$00
$08:da2f  00 00         brk #$00
$08:da31  00 00         brk #$00
$08:da33  00 00         brk #$00
$08:da35  00 00         brk #$00
$08:da37  00 00         brk #$00
$08:da39  00 00         brk #$00
$08:da3b  00 00         brk #$00
$08:da3d  00 00         brk #$00
$08:da3f  00 00         brk #$00
$08:da41  00 00         brk #$00
$08:da43  00 00         brk #$00
$08:da45  00 00         brk #$00
$08:da47  00 00         brk #$00
$08:da49  00 00         brk #$00
$08:da4b  00 00         brk #$00
$08:da4d  00 4c         brk #$4c
$08:da4f  43 a9         eor $a9,s
$08:da51  b8            clv
$08:da52  6a            ror a
$08:da53  8e 64 7f      stx $7f64
$08:da56  49 c8 a2      eor #$a2c8
$08:da59  3e 90 9f      rol $9f90,x
$08:da5c  02 f1         cop #$f1
$08:da5e  40            rti
$08:da5f  bf b8 47 0e   lda $0e47b8,x
$08:da63  f1 7f         sbc ($7f),y
$08:da65  80 c8         bra $da2f
$08:da67  37 3e         and [$3e],y
$08:da69  c1 9f         cmp ($9f,x)
$08:da6b  60            rts
$08:da6c  f0 0f         beq $da7d
$08:da6e  00 ff         brk #$ff
$08:da70  06 ff         asl $ff
$08:da72  14 f5         trb $f5
$08:da74  69 e9 95      adc #$95e9
$08:da77  f1 fb         sbc ($fb),y
$08:da79  69 5c d5      adc #$d55c
$08:da7c  7e 83 c3      ror $c383,x
$08:da7f  00 81         brk #$81
$08:da81  00 0a         brk #$0a
$08:da83  00 96         brk #$96
$08:da85  00 4e         brk #$4e
$08:da87  00 06         brk #$06
$08:da89  00 22         brk #$22
$08:da8b  00 81         brk #$81
$08:da8d  00 44         brk #$44
$08:da8f  ca            dex
$08:da90  ba            tsx
$08:da91  87 24         sta [$24]
$08:da93  ed 1b f6      sbc $f61b
$08:da96  81 fe         sta ($fe,x)
$08:da98  2a            rol a
$08:da99  d5 54         cmp $54,x
$08:da9b  aa            tax
$08:da9c  29 d4 3a      and #$3ad4
$08:da9f  01 71         ora ($71,x)
$08:daa1  00 9a         brk #$9a
$08:daa3  00 40         brk #$40
$08:daa5  00 28         brk #$28
$08:daa7  00 51         brk #$51
$08:daa9  00 aa         brk #$aa
$08:daab  01 d4         ora ($d4,x)
$08:daad  03 db         ora $db,s
$08:daaf  fd e6 5f      sbc $5fe6,x
$08:dab2  78            sei
$08:dab3  bf f5 ad 2a   lda $2aadf5,x
$08:dab7  fb            xce
$08:dab8  fb            xce
$08:dab9  bd d6 7f      lda $7fd6,x
$08:dabc  ad ef c1      lda $c1ef
$08:dabf  c1 46         cmp ($46,x)
$08:dac1  46 38         lsr $38
$08:dac3  38            sec
$08:dac4  22 20 24 20   jsl $202420
$08:dac8  39 39 46      and $4639,y
$08:dacb  46 94         lsr $94
$08:dacd  84 bf         sty $bf
$08:dacf  7f de f3 ad   adc $adf3de,x
$08:dad3  77 8a         adc [$8a],y
$08:dad5  7f fc 0b ff   adc $ff0bfc,x
$08:dad9  f8            sed
$08:dada  57 fc         eor [$fc],y
$08:dadc  ab            plb
$08:dadd  af 3f 3f c2   lda $c23f3f
$08:dae1  c2 04         rep #$04
$08:dae3  04 08         tsb $08
$08:dae5  08            php
$08:dae6  08            php
$08:dae7  08            php
$08:dae8  f8            sed
$08:dae9  f8            sed
$08:daea  04 04         tsb $04
$08:daec  53 03         eor ($03,s),y
$08:daee  2d e1 4a      and $4ae1
$08:daf1  ba            tsx
$08:daf2  b4 6f         ldy $6f,x
$08:daf4  4b            phk
$08:daf5  b4 0a         ldy $0a,x
$08:daf7  f5 f1         sbc $f1,x
$08:daf9  0e a6 59      asl $59a6
$08:dafc  54 af e1      mvn $e1,$af
$08:daff  1e 3a 05      asl $053a,x
$08:db02  0f 00 04 00   ora $000400
$08:db06  f4 00 0e      pea $0e00
$08:db09  00 01         brk #$01
$08:db0b  00 01         brk #$01
$08:db0d  00 2a         brk #$2a
$08:db0f  11 6d         ora ($6d),y
$08:db11  09 53 c0      ora #$c053
$08:db14  9c 5c 8a      stz $8a5c
$08:db17  e0 09 e9      cpx #$e909
$08:db1a  a6 54         ldx $54
$08:db1c  71 ba         adc ($ba),y
$08:db1e  00 ff         brk #$ff
$08:db20  09 f6 c0      ora #$c0f6
$08:db23  3f 5c 23 20   and $20235c,x
$08:db27  1f e9 16 14   ora $1416e9,x
$08:db2b  0b            phd
$08:db2c  08            php
$08:db2d  07 20         ora [$20]
$08:db2f  df 41 bf 82   cmp $82bf41,x
$08:db33  7f 05 ff 2e   adc $2eff05,x
$08:db37  ff 0b db 45   sbc $45db0b,x
$08:db3b  d5 22         cmp $22,x
$08:db3d  e8            inx
$08:db3e  9e 00 b8      stz $b800,x
$08:db41  00 70         brk #$70
$08:db43  80 d0         bra $db15
$08:db45  00 90         brk #$90
$08:db47  00 b4         brk #$b4
$08:db49  00 ba         brk #$ba
$08:db4b  00 9f         brk #$9f
$08:db4d  00 08         brk #$08
$08:db4f  f6 54         inc $54,x
$08:db51  eb            xba
$08:db52  62 dd 0d      per $e932
$08:db55  f2 2a         sbc ($2a)
$08:db57  d5 54         cmp $54,x
$08:db59  af 2b dd 46   lda $46dd2b
$08:db5d  aa            tax
$08:db5e  a1 00         lda ($00,x)
$08:db60  80 00         bra $db62
$08:db62  9c 00 b2      stz $b200
$08:db65  00 c1         brk #$c1
$08:db67  00 81         brk #$81
$08:db69  00 80         brk #$80
$08:db6b  00 91         brk #$91
$08:db6d  00 ff         brk #$ff
$08:db6f  ff a5 ff ea   sbc $eaffa5,x
$08:db73  ca            dex
$08:db74  95 c0         sta $c0,x
$08:db76  da            phx
$08:db77  d2 aa         cmp ($aa)
$08:db79  e8            inx
$08:db7a  b5 ff         lda $ff,x
$08:db7c  c4 c0         cpy $c0
$08:db7e  ff ff 80 80   sbc $8080ff,x
$08:db82  b5 80         lda $80,x
$08:db84  bf 80 ad 80   lda $80ad80,x
$08:db88  97 80         sta [$80],y
$08:db8a  80 80         bra $db0c
$08:db8c  bf 80 ff ff   lda $ffff80,x
$08:db90  9c fe 5b      stz $5bfe
$08:db93  52 98         eor ($98)
$08:db95  8a            txa
$08:db96  13 36         ora ($36,s),y
$08:db98  6a            ror a
$08:db99  ca            dex
$08:db9a  b2 b6         lda ($b6)
$08:db9c  ad 00 ff      lda $ff00
$08:db9f  ff 01 00 ad   sbc $ad0001,x
$08:dba3  00 75         brk #$75
$08:dba5  00 c9         brk #$c9
$08:dba7  00 35         brk #$35
$08:dba9  00 49         brk #$49
$08:dbab  00 ff         brk #$ff
$08:dbad  00 df         brk #$df
$08:dbaf  a0 b2 cd      ldy #$cdb2
$08:dbb2  ff ff ff ff   sbc $ffffff,x
$08:dbb6  ff ff 9c fe   sbc $fe9cff,x
$08:dbba  5b            tcd
$08:dbbb  52 98         eor ($98)
$08:dbbd  8a            txa
$08:dbbe  80 80         bra $db40
$08:dbc0  80 80         bra $db42
$08:dbc2  ff ff ff ff   sbc $ffffff,x
$08:dbc6  ff ff 01 00   sbc $0001ff,x
$08:dbca  ad 00 75      lda $7500
$08:dbcd  00 5b         brk #$5b
$08:dbcf  a5 a7         lda $a7
$08:dbd1  59 ff ff      eor $ffff,y
$08:dbd4  ff ff ff ff   sbc $ffffff,x
$08:dbd8  a4 ff         ldy $ff
$08:dbda  db            stp
$08:dbdb  ed bf f7      sbc $f7bf
$08:dbde  01 01         ora ($01,x)
$08:dbe0  01 01         ora ($01,x)
$08:dbe2  ff ff ff ff   sbc $ffffff,x
$08:dbe6  ff ff 80 80   sbc $8080ff,x
$08:dbea  80 80         bra $db6c
$08:dbec  80 80         bra $db6e
$08:dbee  ff ff da a5   sbc $a5daff,x
$08:dbf2  95 df         sta $df,x
$08:dbf4  ea            nop
$08:dbf5  aa            tax
$08:dbf6  a5 f7         lda $f7
$08:dbf8  d5 bd         cmp $bd,x
$08:dbfa  ca            dex
$08:dbfb  b5 bb         lda $bb,x
$08:dbfd  fb            xce
$08:dbfe  ff ff 80 80   sbc $8080ff,x
$08:dc02  a0 80 95      ldy #$9580
$08:dc05  80 88         bra $db8f
$08:dc07  80 82         bra $db8b
$08:dc09  80 80         bra $db8b
$08:dc0b  80 84         bra $db91
$08:dc0d  80 ff         bra $dc0e
$08:dc0f  ff 63 9d a4   sbc $a49d63,x
$08:dc13  f6 67         inc $67,x
$08:dc15  ed ec da      sbc $daec
$08:dc18  95 5f         sta $5f,x
$08:dc1a  4d fb 52      eor $52fb
$08:dc1d  52 ff         eor ($ff)
$08:dc1f  ff 00 00 09   sbc $090000,x
$08:dc23  00 10         brk #$10
$08:dc25  00 01         brk #$01
$08:dc27  00 20         brk #$20
$08:dc29  00 00         brk #$00
$08:dc2b  00 ad         brk #$ad
$08:dc2d  00 f3         brk #$f3
$08:dc2f  70 af         bvs $dbe0
$08:dc31  a0 5d 85      ldy #$855d
$08:dc34  ff c8 75 41   sbc $4175c8,x
$08:dc38  f5 c1         sbc $c1,x
$08:dc3a  ff 48 dd 45   sbc $45dd48,x
$08:dc3e  77 88         adc [$88],y
$08:dc40  bf 40 3a c0   lda $c03a40,x
$08:dc44  f7 00         sbc [$00],y
$08:dc46  7e 80 fe      ror $fe80,x
$08:dc49  00 77         brk #$77
$08:dc4b  80 7a         bra $dcc7
$08:dc4d  80 c6         bra $dc15
$08:dc4f  0f f5 05 ba   ora $ba05f5
$08:dc53  a1 fe         lda ($fe,x)
$08:dc55  12 ae         ora ($ae)
$08:dc57  82 af 83      brl $6009
$08:dc5a  fe 12 ba      inc $ba12,x
$08:dc5d  a3 e0         lda $e0,s
$08:dc5f  1f fd 02 5c   ora $5c02fd,x
$08:dc63  03 ee         ora $ee,s
$08:dc65  01 7e         ora ($7e,x)
$08:dc67  01 7f         ora ($7f,x)
$08:dc69  00 ee         brk #$ee
$08:dc6b  01 5e         ora ($5e,x)
$08:dc6d  01 10         ora ($10,x)
$08:dc6f  ef aa f3 51   sbc $51f3aa
$08:dc73  e1 eb         sbc ($eb,x)
$08:dc75  c0 86 c3      cpy #$c386
$08:dc78  3a            dec a
$08:dc79  8d 29 36      sta $3629
$08:dc7c  a6 d9         ldx $d9
$08:dc7e  0f 00 04 00   ora $000400
$08:dc82  0e 00 1f      asl $1f00
$08:dc85  00 3c         brk #$3c
$08:dc87  00 70         brk #$70
$08:dc89  00 c0         brk #$c0
$08:dc8b  00 01         brk #$01
$08:dc8d  00 01         brk #$01
$08:dc8f  fc 00 fe      jsr ($fe00,x)
$08:dc92  30 ff         bmi $dc93
$08:dc94  8e cf 36      stx $36cf
$08:dc97  e7 1a         sbc [$1a]
$08:dc99  f3 0c         sbc ($0c,s),y
$08:dc9b  f9 a0 ff      sbc $ffa0,y
$08:dc9e  1c 03 86      trb $8603
$08:dca1  01 41         ora ($41,x)
$08:dca3  00 31         brk #$31
$08:dca5  00 d9         brk #$d9
$08:dca7  00 8d         brk #$8d
$08:dca9  00 07         brk #$07
$08:dcab  00 03         brk #$03
$08:dcad  00 b8         brk #$b8
$08:dcaf  b8            clv
$08:dcb0  6f d7 fd ab   adc $abfdd7
$08:dcb4  be d9 7f      ldx $7fd9,y
$08:dcb7  bd d7 73      lda $73d7,x
$08:dcba  aa            tax
$08:dcbb  ff d7 af ff   sbc $ffafd7,x
$08:dcbf  ff 47 47 28   sbc $284747,x
$08:dcc3  28            plp
$08:dcc4  18            clc
$08:dcc5  18            clc
$08:dcc6  3d 3d 4b      and $4b3d,x
$08:dcc9  43 82         eor $82,s
$08:dccb  82 84 84      brl $6152
$08:dcce  ff ff cf b4   sbc $b4cfff,x
$08:dcd2  7e db 6e      ror $6edb,x
$08:dcd5  bd ff 6a      lda $6aff,x
$08:dcd8  ff fd 57 fe   sbc $fe57fd,x
$08:dcdc  ab            plb
$08:dcdd  ae ff ff      ldx $ffff
$08:dce0  84 84         sty $84
$08:dce2  4a            lsr a
$08:dce3  4a            lsr a
$08:dce4  2c 2c 6a      bit $6a2c
$08:dce7  6a            ror a
$08:dce8  fd fd 06      sbc $06fd,x
$08:dceb  06 52         asl $52
$08:dced  02 54         cop #$54
$08:dcef  fe a9 fc      inc $fca9,x
$08:dcf2  55 fd         eor $fd,x
$08:dcf4  aa            tax
$08:dcf5  ff 54 7f ad   sbc $ad7f54,x
$08:dcf9  ff 77 ab e5   sbc $e5ab77,x
$08:dcfd  ff fe 05 fc   sbc $fc05fe,x
$08:dd01  8b            phb
$08:dd02  fd 52 ff      sbc $ff52,x
$08:dd05  20 7f 90      jsr $907f
$08:dd08  ff 2d a3 23   sbc $23a32d,x
$08:dd0c  e1 e1         sbc ($e1,x)
$08:dd0e  aa            tax
$08:dd0f  3d 57 7e      and $7e57,x
$08:dd12  ad fc 5b      lda $5bfc
$08:dd15  fe f9 fe      inc $fef9,x
$08:dd18  ff e5 e7 de   sbc $dee7e5,x
$08:dd1c  ce bd 3d      dec $3dbd
$08:dd1f  c9 7c 94      cmp #$947c
$08:dd22  fa            plx
$08:dd23  28            plp
$08:dd24  f8            sed
$08:dd25  58            cli
$08:dd26  f8            sed
$08:dd27  f8            sed
$08:dd28  e5 e5         sbc $e5
$08:dd2a  c7 c7         cmp [$c7]
$08:dd2c  87 87         sta [$87]
$08:dd2e  a4 dd         ldy $dd
$08:dd30  53 ae         eor ($ae,s),y
$08:dd32  68            pla
$08:dd33  77 a5         adc [$a5],y
$08:dd35  9a            txs
$08:dd36  69 f6 b6      adc #$b6f6
$08:dd39  31 db         and ($db),y
$08:dd3b  db            stp
$08:dd3c  b4 c4         ldy $c4,x
$08:dd3e  4a            lsr a
$08:dd3f  80 24         bra $dd65
$08:dd41  c0 72 80      cpy #$8072
$08:dd44  8a            txa
$08:dd45  70 06         bvs $dd4d
$08:dd47  f8            sed
$08:dd48  31 ce         and ($ce),y
$08:dd4a  db            stp
$08:dd4b  24 04         bit $04
$08:dd4d  fb            xce
$08:dd4e  9c 54 bb      stz $bb54
$08:dd51  a9 f6 a3      lda #$a3f6
$08:dd54  45 de         eor $de
$08:dd56  a2 7f 94      ldx #$947f
$08:dd59  7b            tdc
$08:dd5a  6b            rtl
$08:dd5b  9c 94 f7      stz $f794
$08:dd5e  23 00         and $00,s
$08:dd60  46 00         lsr $00
$08:dd62  4c 00 30      jmp $3000
$08:dd65  00 08         brk #$08
$08:dd67  00 08         brk #$08
$08:dd69  00 9c         brk #$9c
$08:dd6b  00 f7         brk #$f7
$08:dd6d  08            php
$08:dd6e  da            phx
$08:dd6f  a5 a6         lda $a6
$08:dd71  d9 ff ff      cmp $ffff,y
$08:dd74  ff ff ff ff   sbc $ffffff,x
$08:dd78  9c fe db      stz $dbfe
$08:dd7b  d2 98         cmp ($98)
$08:dd7d  8a            txa
$08:dd7e  80 80         bra $dd00
$08:dd80  80 80         bra $dd02
$08:dd82  ff ff ff ff   sbc $ffffff,x
$08:dd86  ff ff 81 80   sbc $8081ff,x
$08:dd8a  ad 80 f5      lda $f580
$08:dd8d  80 f7         bra $dd86
$08:dd8f  07 c8         ora [$c8]
$08:dd91  1d 4e fe      ora $fe4e,x
$08:dd94  5d ed f6      eor $f6ed,x
$08:dd97  27 77         and [$77]
$08:dd99  16 df         asl $df,x
$08:dd9b  c3 2d         cmp $2d,s
$08:dd9d  22 fa 01 e0   jsl $e001fa
$08:dda1  03 06         ora $06,s
$08:dda3  01 0d         ora ($0d,x)
$08:dda5  02 1a         cop #$1a
$08:dda7  01 0a         ora ($0a,x)
$08:dda9  81 c3         sta ($c3,x)
$08:ddab  20 20 df      jsr $df20
$08:ddae  10 00         bpl $ddb0
$08:ddb0  02 00         cop #$00
$08:ddb2  40            rti
$08:ddb3  00 08         brk #$08
$08:ddb5  00 02         brk #$02
$08:ddb7  00 20         brk #$20
$08:ddb9  00 84         brk #$84
$08:ddbb  00 00         brk #$00
$08:ddbd  00 ff         brk #$ff
$08:ddbf  ff ff ff ff   sbc $ffffff,x
$08:ddc3  ff ff ff ff   sbc $ffffff,x
$08:ddc7  ff ff ff ff   sbc $ffffff,x
$08:ddcb  ff ff ff 26   sbc $26ffff,x
$08:ddcf  1f 2c 81 c2   ora $c2812c,x
$08:ddd3  3c fd 01      bit $01fd,x
$08:ddd6  a1 5e         lda ($5e,x)
$08:ddd8  00 ff         brk #$ff
$08:ddda  5a            phy
$08:dddb  bd 92 e1      lda $e192,x
$08:ddde  00 ff         brk #$ff
$08:dde0  81 7e         sta ($7e,x)
$08:dde2  ff 00 fe 00   sbc $00fe00,x
$08:dde6  00 00         brk #$00
$08:dde8  7e 00 81      ror $8100,x
$08:ddeb  7e 00 ff      ror $ff00,x
$08:ddee  34 fb         bit $fb,x
$08:ddf0  28            plp
$08:ddf1  76 95         ror $95,x
$08:ddf3  ef 2c 5e 99   sbc $995e2c
$08:ddf7  7e b5 7a      ror $7ab5,x
$08:ddfa  28            plp
$08:ddfb  f7 18         sbc [$18],y
$08:ddfd  ef c3 00 c3   sbc $c300c3
$08:de01  00 42         brk #$42
$08:de03  00 c3         brk #$c3
$08:de05  00 42         brk #$42
$08:de07  00 42         brk #$42
$08:de09  00 42         brk #$42
$08:de0b  00 c3         brk #$c3
$08:de0d  00 52         brk #$52
$08:de0f  ad 36 cb      lda $cb36
$08:de12  66 93         ror $93
$08:de14  4a            lsr a
$08:de15  a5 36         lda $36
$08:de17  e9 24 d1      sbc #$d124
$08:de1a  4c a7 2a      jmp $2aa7
$08:de1d  ed 83 00      sbc $0083
$08:de20  85 00         sta $00
$08:de22  89 00 93      bit #$9300
$08:de25  00 87         brk #$87
$08:de27  00 8f         brk #$8f
$08:de29  00 99         brk #$99
$08:de2b  00 91         brk #$91
$08:de2d  00 6a         brk #$6a
$08:de2f  8e 91 19      stx $1991
$08:de32  96 f1         stx $f1,y
$08:de34  53 cc         eor ($cc,s),y
$08:de36  92 63         sta ($63)
$08:de38  49 78 24      eor #$2478
$08:de3b  ff 4b 8f 0e   sbc $0e8f4b,x
$08:de3f  f1 19         sbc ($19),y
$08:de41  e6 f0         inc $f0
$08:de43  0f c0 3f 03   ora $033fc0
$08:de47  fc 78 87      jsr ($8778,x)
$08:de4a  ff 00 0f f0   sbc $f00f00,x
$08:de4e  0a            asl a
$08:de4f  78            sei
$08:de50  4a            lsr a
$08:de51  e3 55         sbc $55,s
$08:de53  9c 35 f2      stz $f235
$08:de56  d2 cc         cmp ($cc)
$08:de58  27 e0         and [$e0]
$08:de5a  43 7f         eor $7f,s
$08:de5c  aa            tax
$08:de5d  39 78 87      and $8778,y
$08:de60  e3 1c         sbc $1c,s
$08:de62  1c e3 f0      trb $f0e3
$08:de65  0f c0 3f e0   ora $e03fc0
$08:de69  1f 7f 80 38   ora $38807f,x
$08:de6d  c7 00         cmp [$00]
$08:de6f  00 00         brk #$00
$08:de71  00 00         brk #$00
$08:de73  00 00         brk #$00
$08:de75  00 00         brk #$00
$08:de77  00 00         brk #$00
$08:de79  00 00         brk #$00
$08:de7b  00 00         brk #$00
$08:de7d  00 00         brk #$00
$08:de7f  00 00         brk #$00
$08:de81  00 00         brk #$00
$08:de83  00 00         brk #$00
$08:de85  00 00         brk #$00
$08:de87  00 00         brk #$00
$08:de89  00 00         brk #$00
$08:de8b  00 00         brk #$00
$08:de8d  00 c3         brk #$c3
$08:de8f  ff 21 3d a3   sbc $a33d21,x
$08:de93  02 77         cop #$77
$08:de95  04 af         tsb $af
$08:de97  00 45         brk #$45
$08:de99  00 ab         brk #$ab
$08:de9b  08            php
$08:de9c  87 08         sta [$08]
$08:de9e  ff 00 3d c2   sbc $c23d00,x
$08:dea2  02 fd         cop #$fd
$08:dea4  04 fb         tsb $fb
$08:dea6  00 ff         brk #$ff
$08:dea8  00 ff         brk #$ff
$08:deaa  08            php
$08:deab  f7 00         sbc [$00],y
$08:dead  ff a0 5f 02   sbc $025fa0,x
$08:deb1  ff 32 b2 2d   sbc $2db232,x
$08:deb5  85 52         sta $52
$08:deb7  d0 57         bne $df10
$08:deb9  e1 29         sbc ($29,x)
$08:debb  a0 53 ca      ldy #$ca53
$08:debe  43 00         eor $00,s
$08:dec0  ff 00 b2 4d   sbc $4db200,x
$08:dec4  85 7a         sta $7a
$08:dec6  d0 2f         bne $def7
$08:dec8  e1 1e         sbc ($1e,x)
$08:deca  a0 5f c2      ldy #$c25f
$08:decd  3d 57 c8      and $c857,x
$08:ded0  2b            pld
$08:ded1  e4 17         cpx $17
$08:ded3  f0 4b         beq $df20
$08:ded5  f8            sed
$08:ded6  15 fc         ora $fc,x
$08:ded8  02 fe         cop #$fe
$08:deda  55 ff         eor $ff,x
$08:dedc  08            php
$08:dedd  ff c0 3f e0   sbc $e03fc0,x
$08:dee1  1f f0 0f f8   ora $f80ff0,x
$08:dee5  07 fc         ora [$fc]
$08:dee7  03 fe         ora $fe,s
$08:dee9  01 ff         ora ($ff,x)
$08:deeb  00 ff         brk #$ff
$08:deed  00 ff         brk #$ff
$08:deef  00 93         brk #$93
$08:def1  48            pha
$08:def2  ce 00 6b      dec $6b00
$08:def5  90 be         bcc $deb5
$08:def7  01 f3         ora ($f3,x)
$08:def9  0c 59 00      tsb $0059
$08:defc  80 a6         bra $dea4
$08:defe  00 ff         brk #$ff
$08:df00  00 ff         brk #$ff
$08:df02  00 ff         brk #$ff
$08:df04  00 ff         brk #$ff
$08:df06  00 ff         brk #$ff
$08:df08  00 ff         brk #$ff
$08:df0a  00 ff         brk #$ff
$08:df0c  a6 59         ldx $59
$08:df0e  52 be         eor ($be)
$08:df10  89 35 93      bit #$9335
$08:df13  ee 40 fc      inc $fc40
$08:df16  8a            txa
$08:df17  77 59         adc [$59],y
$08:df19  64 00         stz $00
$08:df1b  ff b4 c4 26   sbc $26c4b4,x
$08:df1f  c1 25         cmp ($25,x)
$08:df21  c2 e6         rep #$e6
$08:df23  01 e4         ora ($e4,x)
$08:df25  03 27         ora $27,s
$08:df27  c0 64 83      cpy #$8364
$08:df2a  ff 00 04 fb   sbc $fb0400,x
$08:df2e  3e 81 44      rol $4481,x
$08:df31  b9 0a b5      lda $b50a,y
$08:df34  50 ad         bvc $dee3
$08:df36  62 9d 7e      per $5dd6
$08:df39  81 54         sta ($54,x)
$08:df3b  af 22 df ff   lda $ffdf22
$08:df3f  00 c3         brk #$c3
$08:df41  00 c7         brk #$c7
$08:df43  00 cf         brk #$cf
$08:df45  00 df         brk #$df
$08:df47  00 ff         brk #$ff
$08:df49  00 a1         brk #$a1
$08:df4b  00 c1         brk #$c1
$08:df4d  00 08         brk #$08
$08:df4f  78            sei
$08:df50  42 e3         wdm #$e3
$08:df52  14 1c         trb $1c
$08:df54  32 f0         and ($f0)
$08:df56  cc c0 20      cpy $20c0
$08:df59  e0 43 7f      cpx #$7f43
$08:df5c  29 38 7a      and #$7a38
$08:df5f  85 eb         sta $eb
$08:df61  14 5d         trb $5d
$08:df63  a2 f7 08      ldx #$08f7
$08:df66  de 21 e7      dec $e721,x
$08:df69  18            clc
$08:df6a  7f 80 3b c4   adc $c43b80,x
$08:df6e  cb            wai
$08:df6f  c3 92         cmp $92,s
$08:df71  93 cc         sta ($cc,s),y
$08:df73  0c 63 7f      tsb $7f63
$08:df76  91 f1         sta ($f1),y
$08:df78  c6 07         dec $07
$08:df7a  19 01 8c      ora $8c01,y
$08:df7d  0c dd 20      tsb $20dd
$08:df80  93 6c         sta ($6c,s),y
$08:df82  ec 13 7f      cpx $7f13
$08:df85  80 f5         bra $df7c
$08:df87  0a            asl a
$08:df88  e7 18         sbc [$18]
$08:df8a  3d c2 ec      and $ecc2,x
$08:df8d  13 08         ora ($08,s),y
$08:df8f  78            sei
$08:df90  42 e3         wdm #$e3
$08:df92  14 1c         trb $1c
$08:df94  32 f0         and ($f0)
$08:df96  cc c0 20      cpy $20c0
$08:df99  e0 43 7f      cpx #$7f43
$08:df9c  29 39 7a      and #$7a39
$08:df9f  85 eb         sta $eb
$08:dfa1  14 5d         trb $5d
$08:dfa3  a2 f7 08      ldx #$08f7
$08:dfa6  de 21 e7      dec $e721,x
$08:dfa9  18            clc
$08:dfaa  7f 80 39 c6   adc $c63980,x
$08:dfae  cb            wai
$08:dfaf  c3 92         cmp $92,s
$08:dfb1  93 cc         sta ($cc,s),y
$08:dfb3  0c 63 7f      tsb $7f63
$08:dfb6  91 f1         sta ($f1),y
$08:dfb8  c6 07         dec $07
$08:dfba  19 01 ec      ora $ec01,y
$08:dfbd  ec dd 20      cpx $20dd
$08:dfc0  93 6c         sta ($6c,s),y
$08:dfc2  ec 13 7f      cpx $7f13
$08:dfc5  80 f5         bra $dfbc
$08:dfc7  0a            asl a
$08:dfc8  e7 18         sbc [$18]
$08:dfca  3d c2 ec      and $ecc2,x
$08:dfcd  13 df         ora ($df,s),y
$08:dfcf  f8            sed
$08:dfd0  eb            xba
$08:dfd1  57 7d         eor [$7d],y
$08:dfd3  b4 f4         ldy $f4,x
$08:dfd5  ab            plb
$08:dfd6  2b            pld
$08:dfd7  f8            sed
$08:dfd8  fb            xce
$08:dfd9  bd d6 7f      lda $7fd6,x
$08:dfdc  bd ff c0      lda $c0ff,x
$08:dfdf  c7 40         cmp [$40]
$08:dfe1  4f 33 3f 20   eor $203f33
$08:dfe5  27 24         and [$24]
$08:dfe7  23 39         and $39,s
$08:dfe9  39 46 46      and $4646,y
$08:dfec  84 84         sty $84
$08:dfee  ff 1f de e3   sbc $e3de1f,x
$08:dff2  bd 27 2a      lda $2a27,x
$08:dff5  df dc 1b ff   cmp $ff1bdc,x
$08:dff9  f8            sed
$08:dffa  57 fc         eor [$fc],y
$08:dffc  fb            xce
$08:dffd  ff 1f ff 02   sbc $02ff1f,x
$08:e001  f2 c4         sbc ($c4)
$08:e003  f4 08 e8      pea $e808
$08:e006  28            plp
$08:e007  c8            iny
$08:e008  f8            sed
$08:e009  f8            sed
$08:e00a  04 04         tsb $04
$08:e00c  03 03         ora $03,s
$08:e00e  56 fe         lsr $fe,x
$08:e010  bf af 4d 8c   lda $8c4daf,x
$08:e014  bb            tyx
$08:e015  ec dd f2      cpx $f2dd
$08:e018  bb            tyx
$08:e019  dd cd 4e      cmp $4ecd,x
$08:e01c  d5 a6         cmp $a6,x
$08:e01e  06 07         asl $07
$08:e020  55 05         eor $05,x
$08:e022  fa            plx
$08:e023  08            php
$08:e024  4a            lsr a
$08:e025  08            php
$08:e026  30 1c         bmi $e044
$08:e028  01 3f         ora ($3f,x)
$08:e02a  70 7f         bvs $e0ab
$08:e02c  f8            sed
$08:e02d  bf ab ff 92   lda $92ffab,x
$08:e031  ff cd ff fa   sbc $faffcd,x
$08:e035  bf f5 df a9   lda $a9dff5,x
$08:e039  fc f3 fc      jsr ($fcf3,x)
$08:e03c  dc f3 80      jml [$80f3]
$08:e03f  80 80         bra $dfc1
$08:e041  80 81         bra $dfc4
$08:e043  81 82         sta ($82,x)
$08:e045  82 c4 c4      brl $a50c
$08:e048  ab            plb
$08:e049  a8            tay
$08:e04a  b0 b3         bcs $dfff
$08:e04c  90 9f         bcc $dfed
$08:e04e  d7 ff         cmp [$ff],y
$08:e050  ab            plb
$08:e051  ff ed df d3   sbc $d3dfed,x
$08:e055  6d 6b f5      adc $f56b
$08:e058  b7 bb         lda [$bb],y
$08:e05a  cf 35 3f ca   cmp $ca3f35
$08:e05e  81 81         sta ($81,x)
$08:e060  81 81         sta ($81,x)
$08:e062  c1 c1         cmp ($c1,x)
$08:e064  41 41         eor ($41,x)
$08:e066  21 21         and ($21,x)
$08:e068  53 13         eor ($13,s),y
$08:e06a  05 c5         ora $c5
$08:e06c  0a            asl a
$08:e06d  fa            plx
$08:e06e  97 10         sta [$10],y
$08:e070  49 90 c3      eor #$c390
$08:e073  02 8b         cop #$8b
$08:e075  12 b3         ora ($b3)
$08:e077  24 7e         bit $7e
$08:e079  81 ab         sta ($ab,x)
$08:e07b  10 f1         bpl $e06e
$08:e07d  02 10         cop #$10
$08:e07f  ef 00 ff 02   sbc $02ff00
$08:e083  fd 02 fd      sbc $fd02,x
$08:e086  20 df 00      jsr $00df
$08:e089  ff 00 ff 00   sbc $00ff00,x
$08:e08d  ff 77 00 39   sbc $390077,x
$08:e091  c4 5d         cpy $5d
$08:e093  80 bf         bra $e054
$08:e095  20 ef 10      jsr $10ef
$08:e098  fb            xce
$08:e099  00 b2         brk #$b2
$08:e09b  41 ff         eor ($ff,x)
$08:e09d  00 00         brk #$00
$08:e09f  ff 00 ff 00   sbc $00ff00,x
$08:e0a3  ff 20 df 00   sbc $00df20,x
$08:e0a7  ff 00 ff 00   sbc $00ff00,x
$08:e0ab  ff 00 ff 1b   sbc $1bff00,x
$08:e0af  84 2f         sty $2f
$08:e0b1  80 59         bra $e10c
$08:e0b3  c4 2f         cpy $2f
$08:e0b5  80 5d         bra $e114
$08:e0b7  c2 7e         rep #$7e
$08:e0b9  c0 13 88      cpy #$8813
$08:e0bc  7c c2 80      jmp ($80c2,x)
$08:e0bf  7f 80 7f c0   adc $c07f80,x
$08:e0c3  3f 80 7f c0   and $c07f80,x
$08:e0c7  3f c0 3f 80   and $803fc0,x
$08:e0cb  7f c0 3f 80   adc $803fc0,x
$08:e0cf  7f 4a 7f a1   adc $a17f4a,x
$08:e0d3  df ca cf 2d   cmp $2dcfca,x
$08:e0d7  1f d9 c7 bc   ora $bcc7d9,x
$08:e0db  3d 55 93      and $9355,x
$08:e0de  7f 80 7f 80   adc $807f80,x
$08:e0e2  1f e0 cf 30   ora $30cfe0,x
$08:e0e6  07 f8         ora [$f8]
$08:e0e8  c3 3c         cmp $3c,s
$08:e0ea  3d c2 10      and $10c2,x
$08:e0ed  ef 64 ff 80   sbc $80ff64
$08:e0f1  df 2a ff 9d   cmp $9dff2a,x
$08:e0f5  dd 77 e7      cmp $e777,x
$08:e0f8  ba            tsx
$08:e0f9  bb            tyx
$08:e0fa  55 dd         eor $dd,x
$08:e0fc  00 ff         brk #$ff
$08:e0fe  ff 00 df 20   sbc $20df00,x
$08:e102  ff 00 dd 22   sbc $22dd00,x
$08:e106  e7 18         sbc [$18]
$08:e108  bb            tyx
$08:e109  44 dd 22      mvp $22,$dd
$08:e10c  ff 00 f5 72   sbc $72f500,x
$08:e110  b7 ab         lda [$ab],y
$08:e112  ae ce cd      ldx $cdce
$08:e115  cc 3b 18      cpy $183b
$08:e118  f7 f0         sbc [$f0],y
$08:e11a  eb            xba
$08:e11b  64 d7         stz $d7
$08:e11d  c8            iny
$08:e11e  70 8f         bvs $e0af
$08:e120  a3 5c         lda $5c,s
$08:e122  0e f1 cc      asl $ccf1
$08:e125  33 18         and ($18,s),y
$08:e127  e7 f0         sbc [$f0]
$08:e129  0f 60 9f c0   ora $c09f60
$08:e12d  3f 00 00 00   and $000000,x
$08:e131  00 00         brk #$00
$08:e133  00 00         brk #$00
$08:e135  00 00         brk #$00
$08:e137  00 00         brk #$00
$08:e139  00 00         brk #$00
$08:e13b  00 00         brk #$00
$08:e13d  00 00         brk #$00
$08:e13f  00 00         brk #$00
$08:e141  00 00         brk #$00
$08:e143  00 00         brk #$00
$08:e145  00 00         brk #$00
$08:e147  00 00         brk #$00
$08:e149  00 00         brk #$00
$08:e14b  00 00         brk #$00
$08:e14d  00 4a         brk #$4a
$08:e14f  0e 31 39      asl $3931
$08:e152  91 f0         sta ($f0),y
$08:e154  4c c0 62      jmp $62c0
$08:e157  03 48         ora $48,s
$08:e159  78            sei
$08:e15a  24 ff         bit $ff
$08:e15c  4b            phk
$08:e15d  0f ee 11 39   ora $3911ee
$08:e161  c6 f7         dec $f7
$08:e163  08            php
$08:e164  df 20 f3 0c   cmp $0cf320,x
$08:e168  7d 82 ff      adc $ff82,x
$08:e16b  00 cf         brk #$cf
$08:e16d  30 44         bmi $e1b3
$08:e16f  40            rti
$08:e170  a8            tay
$08:e171  b8            clv
$08:e172  8a            txa
$08:e173  0a            asl a
$08:e174  64 7f         stz $7f
$08:e176  48            pha
$08:e177  c8            iny
$08:e178  a2 3e 88      ldx #$883e
$08:e17b  83 00         sta $00,s
$08:e17d  fc 4e b1      jsr ($b14e,x)
$08:e180  b8            clv
$08:e181  47 ee         eor [$ee]
$08:e183  11 7f         ora ($7f),y
$08:e185  80 c8         bra $e14f
$08:e187  37 fe         and [$fe],y
$08:e189  01 bf         ora ($bf,x)
$08:e18b  40            rti
$08:e18c  fc 03 ea      jsr ($ea03,x)
$08:e18f  7e d5 fd      ror $fdd5,x
$08:e192  2e fb cf      rol $cffb
$08:e195  f7 87         sbc [$87],y
$08:e197  ee 2d f9      inc $f92d
$08:e19a  4c ef 00      jmp $00ef
$08:e19d  bf fe e9 fd   lda $fde9fe,x
$08:e1a1  d2 fb         cmp ($fb)
$08:e1a3  24 f7         bit $f7
$08:e1a5  ca            dex
$08:e1a6  ee 91 f9      inc $f991
$08:e1a9  06 ef         asl $ef
$08:e1ab  10 bf         bpl $e16c
$08:e1ad  40            rti
$08:e1ae  7f ff ea ef   adc $efeaff,x
$08:e1b2  17 9f         ora [$9f],y
$08:e1b4  6e 3f 0d      ror $0d3f
$08:e1b7  bf 2b 7f 94   lda $947f2b,x
$08:e1bb  bd 5b cb      lda $cb5b,x
$08:e1be  ff 62 ef d2   sbc $d2ef62,x
$08:e1c2  9f 67 3f ce   sta $ce3f67,x
$08:e1c6  3f cc 3f c8   and $c83fcc,x
$08:e1ca  9d 62 cb      sta $cb62,x
$08:e1cd  35 4d         and $4d,x
$08:e1cf  ff 5e 7f 7a   sbc $7a7f5e,x
$08:e1d3  ff 6a 7c 51   sbc $517c6a,x
$08:e1d7  fe 20 3f      inc $3f20,x
$08:e1da  fc 7f c1      jsr ($c17f,x)
$08:e1dd  41 ff         eor ($ff,x)
$08:e1df  c8            iny
$08:e1e0  ff d0 ff e2   sbc $e2ffd0,x
$08:e1e4  fc cb f0      jsr ($f0cb,x)
$08:e1e7  df bf c0 ff   cmp $ffc0bf,x
$08:e1eb  c0 c1 fe      cpy #$fec1
$08:e1ee  ac ff b4      ldy $b4ff
$08:e1f1  ff 5a 5f ac   sbc $ac5f5a,x
$08:e1f5  2f 56 17 51   and $511756
$08:e1f9  ff ab ff 97   sbc $97ffab,x
$08:e1fd  ff ff 2c ff   sbc $ff2cff,x
$08:e201  84 5f         sty $5f
$08:e203  a2 2f d0      ldx #$d02f
$08:e206  17 e8         ora [$e8],y
$08:e208  ff 51 ff ab   sbc $abff51,x
$08:e20c  ff 17 95 a6   sbc $a69517,x
$08:e210  4d ce 7a      eor $7ace
$08:e213  dd 7d f2      cmp $f27d,x
$08:e216  9e 89 f9      stz $f989,x
$08:e219  fe 6f c9      inc $c96f,x
$08:e21c  79 ff f8      adc $f8ff,y
$08:e21f  bf 70 7f 40   lda $407f70,x
$08:e223  7f 30 3f f8   adc $f83f30,x
$08:e227  8f 88 8f 39   sta $398f88
$08:e22b  0f 09 09 a3   ora $a30909
$08:e22f  bf f4 ac c9   lda $c9acf4,x
$08:e233  d8            cld
$08:e234  ab            plb
$08:e235  d8            cld
$08:e236  ca            dex
$08:e237  d9 73 6f      cmp $6f73,y
$08:e23a  98            tya
$08:e23b  bf 74 23 c0   lda $c02374,x
$08:e23f  8f c3 9f a7   sta $a79fc3
$08:e243  9f a7 9f 67   sta $679fa7,x
$08:e247  5f c0 5f 40   eor $405fc0,x
$08:e24b  0f ef 3f c6   ora $c63fef
$08:e24f  ff 2f 35 95   sbc $95352f,x
$08:e253  1f d6 1f 52   ora $521fd6,x
$08:e257  9e cd f7      stz $f7cd,x
$08:e25a  1a            inc a
$08:e25b  fa            plx
$08:e25c  2d c0 06      and $06c0
$08:e25f  f6 c4         inc $c4,x
$08:e261  fc e4 fc      jsr ($fce4,x)
$08:e264  e4 fc         cpx $fc
$08:e266  e1 f8         sbc ($f8,x)
$08:e268  00 f8         brk #$f8
$08:e26a  05 f0         ora $f0
$08:e26c  f7 f8         sbc [$f8],y
$08:e26e  b6 fd         ldx $fd,y
$08:e270  9b            txy
$08:e271  fe 8d ff      inc $ff8d,x
$08:e274  86 ff         stx $ff
$08:e276  f3 ff         sbc ($ff,s),y
$08:e278  cb            wai
$08:e279  ff fc fe a7   sbc $a7fefc,x
$08:e27d  bf fc b3 fe   lda $feb3fc,x
$08:e281  99 ff 8c      sta $8cff,y
$08:e284  ff 86 ff d3   sbc $d3ff86,x
$08:e288  ff c9 fe 6d   sbc $6dfec9,x
$08:e28c  bf e6 d7 4f   lda $4fd7e6,x
$08:e290  1c fd f9      trb $f9fd
$08:e293  79 f3 b1      adc $b1f3,y
$08:e296  65 c1         adc $c1
$08:e298  27 e3         and [$e3]
$08:e29a  8d e5 49      sta $49e5
$08:e29d  69 43 bc      adc #$bc43
$08:e2a0  05 fa         ora $fa
$08:e2a2  09 f6 91      ora #$91f6
$08:e2a5  6e c1 3e      ror $3ec1
$08:e2a8  e3 1c         sbc $1c,s
$08:e2aa  e5 9a         sbc $9a
$08:e2ac  69 d6 00      adc #$00d6
$08:e2af  00 00         brk #$00
$08:e2b1  00 00         brk #$00
$08:e2b3  00 00         brk #$00
$08:e2b5  00 00         brk #$00
$08:e2b7  00 00         brk #$00
$08:e2b9  00 00         brk #$00
$08:e2bb  00 00         brk #$00
$08:e2bd  00 00         brk #$00
$08:e2bf  00 00         brk #$00
$08:e2c1  00 00         brk #$00
$08:e2c3  00 00         brk #$00
$08:e2c5  00 00         brk #$00
$08:e2c7  00 00         brk #$00
$08:e2c9  00 00         brk #$00
$08:e2cb  00 00         brk #$00
$08:e2cd  00 bb         brk #$bb
$08:e2cf  f9 d7 f5      sbc $f5d7,y
$08:e2d2  a8            tay
$08:e2d3  fd f6 7f      sbc $7ff6,x
$08:e2d6  6b            rtl
$08:e2d7  ff b5 7f f9   sbc $f97fb5,x
$08:e2db  9f 1d ee f9   sta $f9ee1d,x
$08:e2df  86 f5         stx $f5
$08:e2e1  ca            dex
$08:e2e2  fd a2 7f      sbc $7fa2,x
$08:e2e5  50 7f         bvc $e366
$08:e2e7  69 3f 31      adc #$313f
$08:e2ea  1f 19 0e 0c   ora $0c0e19,x
$08:e2ee  e5 dd         sbc $dd
$08:e2f0  fe e6 bc      inc $bce6,x
$08:e2f3  fe f6 ff      inc $fff6,x
$08:e2f6  5f ff ab ff   eor $ffabff,x
$08:e2fa  2b            pld
$08:e2fb  7b            tdc
$08:e2fc  4c 7a c6      jmp $c67a
$08:e2ff  c4 e5         cpy $e5
$08:e301  e4 fd         cpx $fd
$08:e303  bc fe f6      ldy $f6fe,x
$08:e306  ff 5f ff 23   sbc $23ff5f,x
$08:e30a  7b            tdc
$08:e30b  85 78         sta $78
$08:e30d  87 5b         sta [$5b]
$08:e30f  df dd ff bb   cmp $bbffdd,x
$08:e313  bb            tyx
$08:e314  6d 07 56      adc $5607
$08:e317  ff bd 5f f9   sbc $f95fbd,x
$08:e31b  bb            tyx
$08:e31c  d7 d3         cmp [$d3],y
$08:e31e  21 01         and ($01,x)
$08:e320  01 01         ora ($01,x)
$08:e322  45 01         eor $01
$08:e324  f9 01 07      sbc $0701,y
$08:e327  06 1f         asl $1f
$08:e329  19 bb a5      ora $a5bb,y
$08:e32c  d3 ac         cmp ($ac,s),y
$08:e32e  e5 fd         sbc $fd
$08:e330  be fe 2c      ldx $2cfe,y
$08:e333  fe 9e bf      inc $bf9e,x
$08:e336  f3 7d         sbc ($7d,s),y
$08:e338  2d 7e d6      and $d67e
$08:e33b  ff 6d 9e e6   sbc $e69e6d,x
$08:e33f  e4 fd         cpx $fd
$08:e341  bc fd 0c      ldy $0cfd,x
$08:e344  be 5e 71      ldx $715e,y
$08:e347  b1 60         lda ($60),y
$08:e349  a0 c0 40      ldy #$40c0
$08:e34c  80 00         bra $e34e
$08:e34e  b7 37         lda [$37],y
$08:e350  d9 c0 64      cmp $64c0,y
$08:e353  04 5b         tsb $5b
$08:e355  5b            tcd
$08:e356  a4 ef         ldy $ef
$08:e358  c5 fd         cmp $fd
$08:e35a  52 fe         eor ($fe)
$08:e35c  29 ff 37      and #$37ff
$08:e35f  c8            iny
$08:e360  c0 3f 04      cpy #$043f
$08:e363  fb            xce
$08:e364  5b            tcd
$08:e365  a4 ef         ldy $ef
$08:e367  10 fd         bpl $e366
$08:e369  02 fe         cop #$fe
$08:e36b  01 ff         ora ($ff,x)
$08:e36d  00 5b         brk #$5b
$08:e36f  58            cli
$08:e370  6d 21 b6      adc $b621
$08:e373  b6 59         ldx $59,y
$08:e375  59 26 e7      eor $e726,y
$08:e378  8c ff 6b      sty $6bff
$08:e37b  6b            rtl
$08:e37c  95 ff         sta $ff,x
$08:e37e  58            cli
$08:e37f  a7 21         lda [$21]
$08:e381  de b6 49      dec $49b6,x
$08:e384  59 a6 e7      eor $e7a6,y
$08:e387  18            clc
$08:e388  ff 00 6b 94   sbc $946b00,x
$08:e38c  ff 00 00 ff   sbc $ff0000,x
$08:e390  aa            tax
$08:e391  ff 7f ff 4b   sbc $4bff7f,x
$08:e395  ff 95 df cb   sbc $cbdf95,x
$08:e399  ef af ff b6   sbc $b6ffaf
$08:e39d  ff ff 00 ff   sbc $ff00ff,x
$08:e3a1  aa            tax
$08:e3a2  ff 7f ff 0b   sbc $0bff7f,x
$08:e3a6  df a5 ef d3   cmp $d3efa5,x
$08:e3aa  ff a2 ff b4   sbc $b4ffa2,x
$08:e3ae  67 e7         adc [$e7]
$08:e3b0  bf ff 57 ff   lda $ff57ff,x
$08:e3b4  ef ff b3 ff   sbc $ffb3ff
$08:e3b8  6d ff 52      adc $52ff
$08:e3bb  ff 25 ff e7   sbc $e7ff25,x
$08:e3bf  5b            tcd
$08:e3c0  ff a7 ff 53   sbc $53ffa7,x
$08:e3c4  ff e9 ff b0   sbc $b0ffe9,x
$08:e3c8  ff 68 ff 50   sbc $50ff68,x
$08:e3cc  ff 24 7c e0   sbc $e07c24,x
$08:e3d0  73 fc         adc ($fc,s),y
$08:e3d2  7c 7f 2e      jmp ($2e7f,x)
$08:e3d5  3f 31 fd 38   and $38fd31,x
$08:e3d9  9e 5d 2f      stz $2f5d,x
$08:e3dc  ae 57 e0      ldx $e057
$08:e3df  df f0 ef f8   cmp $f8eff0,x
$08:e3e3  f7 fc         sbc [$fc],y
$08:e3e5  eb            xba
$08:e3e6  fc f3 fe      jsr ($fef3,x)
$08:e3e9  f9 ff fc      sbc $fcff,y
$08:e3ec  ff fe 39 3f   sbc $3f39fe,x
$08:e3f0  9a            txs
$08:e3f1  0f d3 3f 27   ora $273fd3
$08:e3f5  ff 6e ff fd   sbc $fdff6e,x
$08:e3f9  ff fd f1 f3   sbc $f3f1fd,x
$08:e3fd  cd 3f c1      cmp $c13f
$08:e400  0f f2 1f e3   ora $e31ff2
$08:e404  3f c7 7f 8e   and $8e7fc7,x
$08:e408  ff 1d ff 3e   sbc $3eff1d,x
$08:e40c  ff 7f 40 23   sbc $23407f,x
$08:e410  a0 98 55      ldy #$5598
$08:e413  43 ac         eor $ac,s
$08:e415  e0 18 19      cpx #$1918
$08:e418  66 60         ror $60
$08:e41a  75 fc         adc $fc,x
$08:e41c  55 74         eor $74,x
$08:e41e  e3 3f         sbc $3f,s
$08:e420  7c 1f bf      jmp ($bf1f,x)
$08:e423  06 1f         asl $1f
$08:e425  03 e6         ora $e6,s
$08:e427  01 9f         ora ($9f,x)
$08:e429  00 03         brk #$03
$08:e42b  00 8b         brk #$8b
$08:e42d  00 4e         brk #$4e
$08:e42f  0f 75 71 d2   ora $d27175
$08:e433  1e 55 74      asl $7455,x
$08:e436  d4 c3         pei ($c3)
$08:e438  a3 8c         lda $8c,s
$08:e43a  5e 1d b2      lsr $b21d,x
$08:e43d  91 f0         sta ($f0),y
$08:e43f  00 8e         brk #$8e
$08:e441  00 e1         brk #$e1
$08:e443  00 8b         brk #$8b
$08:e445  00 3e         brk #$3e
$08:e447  01 78         ora ($78,x)
$08:e449  07 f3         ora [$f3]
$08:e44b  0f 70 0f 6d   ora $6d0f70
$08:e44f  ed b2 87      sbc $87b2
$08:e452  32 4a         and ($4a)
$08:e454  4d 81 f2      eor $f281
$08:e457  f2 79         sbc ($79)
$08:e459  b5 9e         lda $9e,x
$08:e45b  7c 70 32      jmp ($3270,x)
$08:e45e  12 00         ora ($00)
$08:e460  78            sei
$08:e461  00 dd         brk #$dd
$08:e463  30 06         bmi $e46b
$08:e465  f8            sed
$08:e466  ed 18 ce      sbc $ce18
$08:e469  f8            sed
$08:e46a  93 ec         sta ($ec,s),y
$08:e46c  33 cc         and ($cc,s),y
$08:e46e  db            stp
$08:e46f  df a0 ef 5d   cmp $5defa0,x
$08:e473  cf 8a bf 1e   cmp $1ebf8a
$08:e477  6f 2d cf 5d   adc $5dcf2d
$08:e47b  97 a6         sta [$a6],y
$08:e47d  37 df         and [$df],y
$08:e47f  f3 ef         sbc ($ef,s),y
$08:e481  90 cf         bcc $e452
$08:e483  38            sec
$08:e484  8f 78 0f fc   sta $fc0f78
$08:e488  0f f4 17 ec   ora $ec17f4
$08:e48c  37 ce         and [$ce],y
$08:e48e  b3 b1         lda ($b1,s),y
$08:e490  d5 d3         cmp $d3,x
$08:e492  59 c7 23      eor $23c7,y
$08:e495  6f 16 bf 4d   adc $4dbf16
$08:e499  df bd ef ca   cmp $caefbd,x
$08:e49d  e7 b1         sbc [$b1]
$08:e49f  6e d1 be      ror $bed1
$08:e4a2  c1 7e         cmp ($7e,x)
$08:e4a4  63 bd         adc $bd,s
$08:e4a6  b7 5a         lda [$5a],y
$08:e4a8  df 24 ef 98   cmp $98ef24,x
$08:e4ac  e7 5a         sbc [$5a]
$08:e4ae  a2 bb ef      ldx #$efbb
$08:e4b1  fd 83 de      sbc $de83,x
$08:e4b4  b5 df         lda $df,x
$08:e4b6  c6 ed         dec $ed
$08:e4b8  6b            rtl
$08:e4b9  fe b7 fe      inc $feb7,x
$08:e4bc  1f ff c4 80   ora $80c4ff,x
$08:e4c0  8a            txa
$08:e4c1  88            dey
$08:e4c2  a1 80         lda ($80,x)
$08:e4c4  a4 84         ldy $84
$08:e4c6  d4 44         pei ($44)
$08:e4c8  e2 22         sep #$22
$08:e4ca  f6 16         inc $16,x
$08:e4cc  ff 0f ae d7   sbc $d7ae0f,x
$08:e4d0  56 f5         lsr $f5,x
$08:e4d2  f6 ef         inc $ef,x
$08:e4d4  6e 07 8d      ror $8d07
$08:e4d7  9f 7a ee 5c   sta $5cee7a,x
$08:e4db  fd b4 5d      sbc $5db4,x
$08:e4de  07 06         ora [$06]
$08:e4e0  0d 04 17      ora $1704
$08:e4e3  06 f7         asl $f7
$08:e4e5  06 6f         asl $6f
$08:e4e7  0c 0e 09      tsb $090e
$08:e4ea  1c 13 1c      trb $1c13
$08:e4ed  13 00         ora ($00,s),y
$08:e4ef  e3 00         sbc $00,s
$08:e4f1  b8            clv
$08:e4f2  75 0b         adc $0b,x
$08:e4f4  52 80         eor ($80)
$08:e4f6  ac cd 53      ldy $53cd
$08:e4f9  fe ab f5      inc $f5ab,x
$08:e4fc  16 fe         asl $fe,x
$08:e4fe  e3 ff         sbc $ff,s
$08:e500  3c ff 1f      bit $1fff,x
$08:e503  f2 1f         sbc ($1f)
$08:e505  e1 f3         sbc ($f3,x)
$08:e507  00 81         brk #$81
$08:e509  00 00         brk #$00
$08:e50b  00 01         brk #$01
$08:e50d  00 aa         brk #$aa
$08:e50f  eb            xba
$08:e510  d5 f7         cmp $f7,x
$08:e512  aa            tax
$08:e513  fb            xce
$08:e514  d7 fd         cmp [$fd],y
$08:e516  fb            xce
$08:e517  fe 04 fe      inc $fe04,x
$08:e51a  aa            tax
$08:e51b  ff 75 77 eb   sbc $eb7775,x
$08:e51f  96 f7         stx $f7,y
$08:e521  c9 fb         cmp #$fb
$08:e523  a4 fd         ldy $fd
$08:e525  d2 fe         cmp ($fe)
$08:e527  f9 06 05      sbc $0506,y
$08:e52a  03 02         ora $02,s
$08:e52c  89 01         bit #$01
$08:e52e  00 e3         brk #$e3
$08:e530  00 b8         brk #$b8
$08:e532  7d 03 48      adc $4803,x
$08:e535  84 f6         sty $f6
$08:e537  f8            sed
$08:e538  55 a5         eor $a5,x
$08:e53a  d4 1a         pei ($1a)
$08:e53c  ff ff e3 ff   sbc $ffe3ff,x
$08:e540  3c ff 1f      bit $1fff,x
$08:e543  fe 03 ff      inc $ff03,x
$08:e546  ef 10 fa c0   sbc $c0fa10
$08:e54a  e1 00         sbc ($00,x)
$08:e54c  00 00         brk #$00
$08:e54e  00 e3         brk #$e3
$08:e550  00 b8         brk #$b8
$08:e552  7d 03 48      adc $4803,x
$08:e555  84 30         sty $30
$08:e557  53 a2         eor ($a2,s),y
$08:e559  ad 12 f3      lda $f312
$08:e55c  a7 bf         lda [$bf]
$08:e55e  e3 ff         sbc $ff,s
$08:e560  3c ff 1f      bit $1fff,x
$08:e563  fe 03 ff      inc $ff03,x
$08:e566  ec 1f 5f      cpx $5f1f
$08:e569  00 0c         brk #$0c
$08:e56b  00 40         brk #$40
$08:e56d  00 1b         brk #$1b
$08:e56f  db            stp
$08:e570  06 be         asl $be
$08:e572  7a            ply
$08:e573  0e 42 8b      asl $8b42
$08:e576  f8            sed
$08:e577  fe 7f b3      inc $b37f,x
$08:e57a  99 7c 75      sta $757c,y
$08:e57d  31 e4         and ($e4),y
$08:e57f  c0 31 e0      cpy #$e031
$08:e582  11 e0         ora ($e0),y
$08:e584  0c f0 e1      tsb $e1f0
$08:e587  10 cc         bpl $e555
$08:e589  f8            sed
$08:e58a  97 e8         sta [$e8],y
$08:e58c  36 c8         rol $c8,x
$08:e58e  01 e5         ora ($e5,x)
$08:e590  06 b8         asl $b8
$08:e592  7d 04 52      adc $5204,x
$08:e595  82 ed fd      brl $e385
$08:e598  7a            ply
$08:e599  aa            tax
$08:e59a  b4 5c         ldy $5c,x
$08:e59c  6a            ror a
$08:e59d  0e e6 f8      asl $f8e6
$08:e5a0  3f f8 1b f0   and $f01bf8,x
$08:e5a4  1d e0 f2      ora $f2e0,x
$08:e5a7  00 d5         brk #$d5
$08:e5a9  e0 a3 c0      cpx #$c0a3
$08:e5ac  31 c0         and ($c0),y
$08:e5ae  01 e3         ora ($e3,x)
$08:e5b0  00 b8         brk #$b8
$08:e5b2  7b            tdc
$08:e5b3  02 42         cop #$42
$08:e5b5  86 f5         stx $f5
$08:e5b7  ff 79 bc 9a   sbc $9abc79,x
$08:e5bb  7a            ply
$08:e5bc  75 37         adc $37,x
$08:e5be  e2 fc         sep #$fc
$08:e5c0  3f fc 1d f8   and $f81dfc,x
$08:e5c4  09 f0         ora #$f0
$08:e5c6  e8            inx
$08:e5c7  10 c3         bpl $e58c
$08:e5c9  f0 95         beq $e560
$08:e5cb  e8            inx
$08:e5cc  30 c8         bmi $e596
$08:e5ce  00 e3         brk #$e3
$08:e5d0  00 b8         brk #$b8
$08:e5d2  7d 03 54      adc $5403,x
$08:e5d5  88            dey
$08:e5d6  c2 e1         rep #$e1
$08:e5d8  58            cli
$08:e5d9  99 32 3e      sta $3e32,y
$08:e5dc  00 70         brk #$70
$08:e5de  e3 ff         sbc $ff,s
$08:e5e0  3c ff 1f      bit $1fff,x
$08:e5e3  fe 1f e3      inc $e31f,x
$08:e5e6  fe 01 e7      inc $e701,x
$08:e5e9  00 c1         brk #$c1
$08:e5eb  00 8f         brk #$8f
$08:e5ed  00 00         brk #$00
$08:e5ef  e3 00         sbc $00,s
$08:e5f1  b8            clv
$08:e5f2  7d 03 48      adc $4803,x
$08:e5f5  84 f0         sty $f0
$08:e5f7  f3 79         sbc ($79,s),y
$08:e5f9  b6 9a         ldx $9a,y
$08:e5fb  7e 74 31      ror $3174,x
$08:e5fe  e3 ff         sbc $ff,s
$08:e600  3c ff 1f      bit $1fff,x
$08:e603  fe 03 ff      inc $ff03,x
$08:e606  ec 1f cb      cpx $cb1f
$08:e609  fc 95 e8      jsr ($e895,x)
$08:e60c  36 c8         rol $c8,x
$08:e60e  2a            rol a
$08:e60f  38            sec
$08:e610  54 b0 53      mvn $53,$b0
$08:e613  71 b4         adc ($b4),y
$08:e615  f2 58         sbc ($58)
$08:e617  c3 53         cmp $53,s
$08:e619  14 2e         trb $2e
$08:e61b  e5 a2         sbc $a2
$08:e61d  91 c7         sta ($c7),y
$08:e61f  00 0e         brk #$0e
$08:e621  01 8f         ora ($8f,x)
$08:e623  00 0f         brk #$0f
$08:e625  01 3c         ora ($3c,x)
$08:e627  03 ec         ora $ec,s
$08:e629  03 1b         ora $1b,s
$08:e62b  07 70         ora [$70]
$08:e62d  0f b0 a3 50   ora $50a3b0
$08:e631  d8            cld
$08:e632  9d 83 e0      sta $e083,x
$08:e635  ac 54 73      ldy $7354
$08:e638  a2 e9         ldx #$e9
$08:e63a  d6 ee         dec $ee,x
$08:e63c  2c 7c 53      bit $537c
$08:e63f  0f 2c 0f 7f   ora $7f0f2c
$08:e643  0e 1b 07      asl $071b
$08:e646  8c 03 17      sty $1703
$08:e649  00 01         brk #$01
$08:e64b  00 83         brk #$83
$08:e64d  00 05         brk #$05
$08:e64f  e9 14 a4      sbc #$a414
$08:e652  5a            phy
$08:e653  1a            inc a
$08:e654  2d 8c a6      and $a68c
$08:e657  30 ca         bmi $e623
$08:e659  d6 74         dec $74,x
$08:e65b  00 b5         brk #$b5
$08:e65d  2c ee f0      bit $f0ee
$08:e660  3b            tsc
$08:e661  c0 65         cpy #$65
$08:e663  80 f3         bra $e658
$08:e665  00 cf         brk #$cf
$08:e667  00 21         brk #$21
$08:e669  00 ff         brk #$ff
$08:e66b  00 c3         brk #$c3
$08:e66d  00 5a         brk #$5a
$08:e66f  7f b5 ff be   adc $beffb5,x
$08:e673  df 37 e7 b7   cmp $b7e737,x
$08:e677  fb            xce
$08:e678  5b            tcd
$08:e679  7c cf df      jmp ($dfcf,x)
$08:e67c  f5 ff         sbc $ff,x
$08:e67e  7f 92 ff 11   adc $11ff92,x
$08:e682  df 24 e7 1a   cmp $1ae724,x
$08:e686  f3 2d         sbc ($2d,s),y
$08:e688  78            sei
$08:e689  9f df aa ff   sta $ffaadf,x
$08:e68d  e4 98         cpx $98
$08:e68f  f7 4d         sbc [$4d],y
$08:e691  e7 7a         sbc [$7a]
$08:e693  e7 55         sbc [$55]
$08:e695  cf ed dd 92   cmp $92dded
$08:e699  ae 6d 9f      ldx $9f6d
$08:e69c  d0 ff         bne $e69d
$08:e69e  f7 08         sbc [$08],y
$08:e6a0  e7 1d         sbc [$1d]
$08:e6a2  e7 1a         sbc [$1a]
$08:e6a4  c7 39         cmp [$39]
$08:e6a6  c5 3b         cmp $3b
$08:e6a8  86 79         stx $79
$08:e6aa  07 fc         ora [$fc]
$08:e6ac  87 78         sta [$78]
$08:e6ae  af ff 4f ee   lda $ee4fff
$08:e6b2  9e df 37      stz $37df,x
$08:e6b5  bf 6e 7b 57   lda $577b6e,x
$08:e6b9  ff ed fd d7   sbc $d7fded,x
$08:e6bd  d1 ff         cmp ($ff),y
$08:e6bf  87 ee         sta [$ee]
$08:e6c1  56 de         lsr $de,x
$08:e6c3  2e b6 56      rol $56b6
$08:e6c6  62 a2 c2      per $a96b
$08:e6c9  42 c3         wdm #$c3
$08:e6cb  c1 ad         cmp ($ad,x)
$08:e6cd  81 b2         sta ($b2,x)
$08:e6cf  5e fd bf      lsr $bffd,x
$08:e6d2  ea            nop
$08:e6d3  7b            tdc
$08:e6d4  75 7d         adc $7d,x
$08:e6d6  bb            tyx
$08:e6d7  bf 6d 37 76   lda $76376d,x
$08:e6db  fb            xce
$08:e6dc  b9 6d 1e      lda $1e6d,y
$08:e6df  01 bf         ora ($bf,x)
$08:e6e1  b4 6b         ldy $6b,x
$08:e6e3  6e a5 27      ror $27a5
$08:e6e6  73 32         adc ($32,s),y
$08:e6e8  e9 21 34      sbc #$3421
$08:e6eb  30 2a         bmi $e717
$08:e6ed  28            plp
$08:e6ee  a4 33         ldy $33
$08:e6f0  74 53         stz $53,x
$08:e6f2  68            pla
$08:e6f3  db            stp
$08:e6f4  d3 ef         cmp ($ef,s),y
$08:e6f6  f8            sed
$08:e6f7  f7 52         sbc [$52],y
$08:e6f9  e9 73 f8      sbc #$f873
$08:e6fc  d1 d8         cmp ($d8),y
$08:e6fe  ef 3f cf 5f   sbc $5fcf3f
$08:e702  47 5f         eor [$5f]
$08:e704  c0 df         cpy #$df
$08:e706  c0 cf         cpy #$cf
$08:e708  47 5f         eor [$5f]
$08:e70a  47 5f         eor [$5f]
$08:e70c  a7 9f         lda [$9f]
$08:e70e  23 c8         and $c8,s
$08:e710  29 cf 12      and #$12cf
$08:e713  df cc f7 1b   cmp $1bf7cc,x
$08:e717  ef 4e 97 ce   sbc $ce974e
$08:e71b  18            clc
$08:e71c  89 1d f7      bit #$f71d
$08:e71f  f8            sed
$08:e720  f0 f8         beq $e71a
$08:e722  e0 f8         cpx #$f8
$08:e724  04 fc         tsb $fc
$08:e726  03 f3         ora $f3,s
$08:e728  e0 f8         cpx #$f8
$08:e72a  e7 f8         sbc [$f8]
$08:e72c  e2 f8         sep #$f8
$08:e72e  a8            tay
$08:e72f  bc f3 8f      ldy $8ff3,x
$08:e732  ac fb eb      ldy $ebfb
$08:e735  d4 fd         pei ($fd)
$08:e737  eb            xba
$08:e738  bb            tyx
$08:e739  fe dc df      inc $dfdc,x
$08:e73c  ab            plb
$08:e73d  ab            plb
$08:e73e  c3 9f         cmp $9f,s
$08:e740  e0 9f         cpx #$9f
$08:e742  80 87         bra $e6cb
$08:e744  c0 cf         cpy #$cf
$08:e746  e0 a7         cpx #$a7
$08:e748  f8            sed
$08:e749  99 dc ac      sta $acdc,y
$08:e74c  ab            plb
$08:e74d  57 15         eor [$15],y
$08:e74f  3f cf f2 3b   and $3bf2cf,x
$08:e753  d9 d7 21      cmp $21d7,y
$08:e756  bb            tyx
$08:e757  df e6 5f d6   cmp $d65fe6,x
$08:e75b  fe 2d 3d      inc $3d2d,x
$08:e75e  c4 fc         cpy $fc
$08:e760  02 fa         cop #$fa
$08:e762  05 e1         ora $e1
$08:e764  0d f1 03      ora $03f1
$08:e767  e3 07         sbc $07,s
$08:e769  86 d6         stx $d6
$08:e76b  d7 2d         cmp [$2d],y
$08:e76d  ef 6f ff 55   sbc $55ff6f
$08:e771  dd 22 88      cmp $8822,x
$08:e774  22 88 55 dd   jsl $dd5588
$08:e778  22 ff 00 ff   jsl $ff00ff
$08:e77c  55 55         eor $55,x
$08:e77e  99 00 aa      sta $aa00,y
$08:e781  00 ff         brk #$ff
$08:e783  00 ff         brk #$ff
$08:e785  00 aa         brk #$aa
$08:e787  00 88         brk #$88
$08:e789  00 88         brk #$88
$08:e78b  00 aa         brk #$aa
$08:e78d  00 ff         brk #$ff
$08:e78f  00 ea         brk #$ea
$08:e791  1b            tcs
$08:e792  ef 30 db 20   sbc $20db30
$08:e796  de 26 db      dec $db26,x
$08:e799  2a            rol a
$08:e79a  df 25 f7 18   cmp $18f725,x
$08:e79e  70 70         bvs $e810
$08:e7a0  c4 c0         cpy $c0
$08:e7a2  82 82 8b      brl $7327
$08:e7a5  8f 9e 99 9b   sta $9b999e
$08:e7a9  95 8f         sta $8f,x
$08:e7ab  8a            txa
$08:e7ac  c7 c7         cmp [$c7]
$08:e7ae  ff 00 bf 40   sbc $40bf00,x
$08:e7b2  f7 08         sbc [$08],y
$08:e7b4  ab            plb
$08:e7b5  84 fb         sty $fb
$08:e7b7  34 bb         bit $bb,x
$08:e7b9  a4 ff         ldy $ff
$08:e7bb  4c d3 34      jmp $34d3
$08:e7be  0e 0e 03      asl $030e
$08:e7c1  03 b1         ora $b1,s
$08:e7c3  b1 a9         lda ($a9),y
$08:e7c5  79 f9 c9      adc $c9f9,y
$08:e7c8  b9 59 f1      lda $f159,y
$08:e7cb  b1 cb         lda ($cb),y
$08:e7cd  c3 d1         cmp $d1,s
$08:e7cf  ff eb ff 6e   sbc $6effeb,x
$08:e7d3  fc bd f5      jsr ($f5bd,x)
$08:e7d6  17 f7         ora [$f7],y
$08:e7d8  6a            ror a
$08:e7d9  eb            xba
$08:e7da  f5 f1         sbc $f1,x
$08:e7dc  aa            tax
$08:e7dd  eb            xba
$08:e7de  05 01         ora $01
$08:e7e0  28            plp
$08:e7e1  28            plp
$08:e7e2  33 20         and ($20,s),y
$08:e7e4  2a            rol a
$08:e7e5  20 48 01      jsr $0148
$08:e7e8  54 41 ce      mvn $ce,$41
$08:e7eb  c0 94         cpy #$94
$08:e7ed  80 00         bra $e7ef
$08:e7ef  00 00         brk #$00
$08:e7f1  00 00         brk #$00
$08:e7f3  00 00         brk #$00
$08:e7f5  00 00         brk #$00
$08:e7f7  00 00         brk #$00
$08:e7f9  00 00         brk #$00
$08:e7fb  00 00         brk #$00
$08:e7fd  00 00         brk #$00
$08:e7ff  00 00         brk #$00
$08:e801  00 00         brk #$00
$08:e803  00 00         brk #$00
$08:e805  00 00         brk #$00
$08:e807  00 00         brk #$00
$08:e809  00 00         brk #$00
$08:e80b  00 00         brk #$00
$08:e80d  00 6a         brk #$6a
$08:e80f  6e 75 51      ror $5175
$08:e812  b4 ef         ldy $ef,x
$08:e814  ab            plb
$08:e815  ff dd ff 9e   sbc $9effdd,x
$08:e819  f9 9a f8      sbc $f89a,y
$08:e81c  b2 f7         lda ($f7)
$08:e81e  ee 71 d1      inc $d171
$08:e821  4e ef a0      lsr $a0ef
$08:e824  ef a0 f7 d5   sbc $d5f7a0
$08:e828  f8            sed
$08:e829  98            tya
$08:e82a  f8            sed
$08:e82b  97 f7         sta [$f7],y
$08:e82d  a8            tay
$08:e82e  52 76         eor ($76)
$08:e830  2a            rol a
$08:e831  ee c1 fb      inc $fbc1
$08:e834  15 ff         ora $ff,x
$08:e836  4b            phk
$08:e837  f7 95         sbc [$95],y
$08:e839  8f db 1f ad   sta $ad1fdb
$08:e83d  ef 75 88 ef   sbc $ef8875
$08:e841  12 ff         ora ($ff)
$08:e843  05 ff         ora $ff
$08:e845  05 ff         ora $ff
$08:e847  4b            phk
$08:e848  7f 7d 1f eb   adc $eb1f7d,x
$08:e84c  ef 15 00 e6   sbc $e60015
$08:e850  03 bb         ora $bb,s
$08:e852  4a            lsr a
$08:e853  3e 56 96      rol $9656,x
$08:e856  cc fc 63      cpy $63fc
$08:e859  af 84 74 72   lda $727484
$08:e85d  37 e9         and [$e9],y
$08:e85f  f0 34         beq $e895
$08:e861  e0 21         cpx #$21
$08:e863  c0 29         cpy #$29
$08:e865  c0 e3         cpy #$e3
$08:e867  00 d0         brk #$d0
$08:e869  e0 9b         cpx #$9b
$08:e86b  e0 34         cpx #$34
$08:e86d  c8            iny
$08:e86e  fb            xce
$08:e86f  ff 7d ff 7f   sbc $7fff7d,x
$08:e873  ff a7 ff db   sbc $dbffa7,x
$08:e877  ff 5f 7f 4b   sbc $4b7f5f,x
$08:e87b  cf 45 7d ff   cmp $ff7d45
$08:e87f  f2 ff         sbc ($ff)
$08:e881  78            sei
$08:e882  ff 7c ff a7   sbc $a7ff7c,x
$08:e886  ff c3 7f 9f   sbc $9f7fc3,x
$08:e88a  cf 31 7d 82   cmp $827d31
$08:e88e  3f bf 1a 9f   and $9f1abf,x
$08:e892  4f 4f f5 ff   eor $fff54f
$08:e896  db            stp
$08:e897  ff 5f 7f 4b   sbc $4b7f5f,x
$08:e89b  cf 45 7d 87   cmp $877d45
$08:e89f  7e 87 7a      ror $7a87,x
$08:e8a2  47 bf         eor [$bf]
$08:e8a4  ff f5 ff c3   sbc $c3fff5,x
$08:e8a8  7f 9f cf 31   adc $31cf9f,x
$08:e8ac  7d 82 fd      adc $fd82,x
$08:e8af  a7 ef         lda [$ef]
$08:e8b1  da            phx
$08:e8b2  db            stp
$08:e8b3  f9 67 61      sbc $6167,y
$08:e8b6  bb            tyx
$08:e8b7  67 66         adc [$66]
$08:e8b9  d7 d4         cmp [$d4],y
$08:e8bb  ff ed fd a4   sbc $a4fded,x
$08:e8bf  a4 c2         ldy $c2
$08:e8c1  c2 45         rep #$45
$08:e8c3  41 dd         eor ($dd,x)
$08:e8c5  41 bb         eor ($bb,x)
$08:e8c7  23 4f         and $4f,s
$08:e8c9  46 d7         lsr $d7
$08:e8cb  d4 ef         pei ($ef)
$08:e8cd  ef 00 00 00   sbc $000000
$08:e8d1  00 00         brk #$00
$08:e8d3  00 00         brk #$00
$08:e8d5  00 00         brk #$00
$08:e8d7  00 00         brk #$00
$08:e8d9  00 00         brk #$00
$08:e8db  00 00         brk #$00
$08:e8dd  00 00         brk #$00
$08:e8df  00 00         brk #$00
$08:e8e1  00 00         brk #$00
$08:e8e3  00 00         brk #$00
$08:e8e5  00 00         brk #$00
$08:e8e7  00 00         brk #$00
$08:e8e9  00 00         brk #$00
$08:e8eb  00 00         brk #$00
$08:e8ed  00 2c         brk #$2c
$08:e8ef  a3 70         lda $70,s
$08:e8f1  8f 29 f7 2b   sta $2bf729
$08:e8f5  d7 52         cmp [$52],y
$08:e8f7  ee 63 fe      inc $fe63
$08:e8fa  50 df         bvc $e8db
$08:e8fc  a8            tay
$08:e8fd  8b            phb
$08:e8fe  da            phx
$08:e8ff  00 f6         brk #$f6
$08:e901  00 84         brk #$84
$08:e903  00 c4         brk #$c4
$08:e905  00 e9         brk #$e9
$08:e907  00 f9         brk #$f9
$08:e909  00 fc         brk #$fc
$08:e90b  20 ff 74      jsr $74ff
$08:e90e  59 a7 2d      eor $2da7,y
$08:e911  da            phx
$08:e912  9a            txs
$08:e913  f9 26 61      sbc $6126,y
$08:e916  98            tya
$08:e917  67 20         adc [$20]
$08:e919  d7 00         cmp [$00],y
$08:e91b  ff 00 3d a4   sbc $a43d00,x
$08:e91f  00 c2         brk #$c2
$08:e921  00 45         brk #$45
$08:e923  00 dd         brk #$dd
$08:e925  00 bb         brk #$bb
$08:e927  00 4e         brk #$4e
$08:e929  00 d6         brk #$d6
$08:e92b  00 6d         brk #$6d
$08:e92d  c2 58         rep #$58
$08:e92f  d6 aa         dec $aa,x
$08:e931  f7 45         sbc [$45],y
$08:e933  fc b3 ee      jsr ($eeb3,x)
$08:e936  41 fe         eor ($fe,x)
$08:e938  9a            txs
$08:e939  65 a0         adc $a0
$08:e93b  5e 49 bc      lsr $bc49,x
$08:e93e  26 01         rol $01
$08:e940  05 00         ora $00
$08:e942  0a            asl a
$08:e943  00 08         brk #$08
$08:e945  00 18         brk #$18
$08:e947  00 25         brk #$25
$08:e949  00 47         brk #$47
$08:e94b  01 87         ora ($87,x)
$08:e94d  03 58         ora $58,s
$08:e94f  c2 a7         rep #$a7
$08:e951  a3 7c         lda $7c,s
$08:e953  fe 2d d3      inc $d32d,x
$08:e956  58            cli
$08:e957  c2 a7         rep #$a7
$08:e959  a3 7c         lda $7c,s
$08:e95b  fe 2d d3      inc $d32d,x
$08:e95e  3d 00 5c      and $5c00,x
$08:e961  00 01         brk #$01
$08:e963  00 d2         brk #$d2
$08:e965  00 3d         brk #$3d
$08:e967  00 5c         brk #$5c
$08:e969  00 01         brk #$01
$08:e96b  00 d2         brk #$d2
$08:e96d  00 ae         brk #$ae
$08:e96f  67 2f         adc [$2f]
$08:e971  f3 09         sbc ($09,s),y
$08:e973  e2 96         sep #$96
$08:e975  42 cf         wdm #$cf
$08:e977  4b            phk
$08:e978  38            sec
$08:e979  f7 13         sbc [$13],y
$08:e97b  ec 00 ff      cpx $ff00
$08:e97e  11 00         ora ($00),y
$08:e980  8c 00 dc      sty $dc00
$08:e983  00 39         brk #$39
$08:e985  00 30         brk #$30
$08:e987  00 84         brk #$84
$08:e989  00 8c         brk #$8c
$08:e98b  00 ff         brk #$ff
$08:e98d  00 f9         brk #$f9
$08:e98f  07 fe         ora [$fe]
$08:e991  01 f7         ora ($f7,x)
$08:e993  08            php
$08:e994  e8            inx
$08:e995  17 f0         ora [$f0],y
$08:e997  0f ea 15 bf   ora $bf15ea
$08:e99b  40            rti
$08:e99c  ff 00 a0 a0   sbc $a0a000,x
$08:e9a0  98            tya
$08:e9a1  98            tya
$08:e9a2  87 87         sta [$87]
$08:e9a4  80 80         bra $e926
$08:e9a6  c0 c0         cpy #$c0
$08:e9a8  40            rti
$08:e9a9  40            rti
$08:e9aa  b0 b0         bcs $e95c
$08:e9ac  5f 5f 97 98   eor $98975f,x
$08:e9b0  bb            tyx
$08:e9b1  44 eb 0c      mvp $0c,$eb
$08:e9b4  4b            phk
$08:e9b5  cc b3 fc      cpy $fcb3
$08:e9b8  47 b8         eor [$b8]
$08:e9ba  fd 02 ff      sbc $ff02,x
$08:e9bd  00 65         brk #$65
$08:e9bf  05 19         ora $19
$08:e9c1  19 d1 c1      ora $c1d1,y
$08:e9c4  31 01         and ($01),y
$08:e9c6  03 03         ora $03,s
$08:e9c8  02 02         cop #$02
$08:e9ca  0d 0d fa      ora $fa0d
$08:e9cd  fa            plx
$08:e9ce  a7 ff         lda [$ff]
$08:e9d0  6a            ror a
$08:e9d1  ff 3c ff 6c   sbc $6cff3c,x
$08:e9d5  ff 30 ff 88   sbc $88ff30,x
$08:e9d9  ff 20 ff 00   sbc $00ff20,x
$08:e9dd  ff ff 00 ff   sbc $ff00ff,x
$08:e9e1  00 ff         brk #$ff
$08:e9e3  00 ff         brk #$ff
$08:e9e5  00 ff         brk #$ff
$08:e9e7  00 ff         brk #$ff
$08:e9e9  00 ff         brk #$ff
$08:e9eb  00 ff         brk #$ff
$08:e9ed  00 00         brk #$00
$08:e9ef  00 00         brk #$00
$08:e9f1  00 00         brk #$00
$08:e9f3  00 00         brk #$00
$08:e9f5  00 00         brk #$00
$08:e9f7  00 00         brk #$00
$08:e9f9  00 00         brk #$00
$08:e9fb  00 00         brk #$00
$08:e9fd  00 00         brk #$00
$08:e9ff  00 00         brk #$00
$08:ea01  00 00         brk #$00
$08:ea03  00 00         brk #$00
$08:ea05  00 00         brk #$00
$08:ea07  00 00         brk #$00
$08:ea09  00 00         brk #$00
$08:ea0b  00 00         brk #$00
$08:ea0d  00 e5         brk #$e5
$08:ea0f  ff 68 ff 55   sbc $55ff68,x
$08:ea13  5f bf 9f f3   eor $f39fbf,x
$08:ea17  3d 6d 7e      and $7e6d,x
$08:ea1a  da            phx
$08:ea1b  bf ad 7e ff   lda $ff7ead,x
$08:ea1f  e0 0f         cpx #$0f
$08:ea21  08            php
$08:ea22  a7 04         lda [$04]
$08:ea24  6f 0e d1 11   adc $11d10e
$08:ea28  a0 20         ldy #$20
$08:ea2a  00 00         brk #$00
$08:ea2c  00 00         brk #$00
$08:ea2e  53 df         eor ($df,s),y
$08:ea30  a6 bf         ldx $bf
$08:ea32  4b            phk
$08:ea33  7d 95 ff      adc $ff95,x
$08:ea36  24 fe         bit $fe
$08:ea38  ff f9 b6 ff   sbc $ffb6f9,x
$08:ea3c  d5 d7         cmp $d7,x
$08:ea3e  df 23 be 42   cmp $42be23,x
$08:ea42  7c 80 fc      jmp ($fc80,x)
$08:ea45  04 fd         tsb $fd
$08:ea47  04 f8         tsb $f8
$08:ea49  f8            sed
$08:ea4a  86 86         stx $86
$08:ea4c  a9 81 08      lda #$0881
$08:ea4f  f7 01         sbc [$01],y
$08:ea51  fb            xce
$08:ea52  42 b7         wdm #$b7
$08:ea54  06 ff         asl $ff
$08:ea56  40            rti
$08:ea57  b5 85         lda $85,x
$08:ea59  7f 42 b7 87   adc $87b742,x
$08:ea5d  7f f7 00 ff   adc $ff00f7,x
$08:ea61  07 bf         ora [$bf]
$08:ea63  0f ff 0f 9f   ora $9f0fff
$08:ea67  0f 7f 0f 9f   ora $9f0f7f
$08:ea6b  0f 7f 0f 0c   ora $0c0f7f
$08:ea6f  fc 3f fc      jsr ($fc3f,x)
$08:ea72  f0 00         beq $ea74
$08:ea74  1f 01 07 ff   ora $ff0701,x
$08:ea78  e1 e0         sbc ($e0,x)
$08:ea7a  38            sec
$08:ea7b  07 ff         ora [$ff]
$08:ea7d  0f 03 ff ff   ora $ffff03
$08:ea81  c3 70         cmp $70,s
$08:ea83  ff e1 fe 00   sbc $00fee1,x
$08:ea87  ff fe 1f 38   sbc $381ffe,x
$08:ea8b  ff 0f f0 70   sbc $70f00f,x
$08:ea8f  03 8e         ora $8e,s
$08:ea91  7f 31 fe f0   adc $f0fe31,x
$08:ea95  f3 80         sbc ($80,s),y
$08:ea97  80 ff         bra $ea98
$08:ea99  01 0c         ora ($0c,x)
$08:ea9b  f0 00         beq $ea9d
$08:ea9d  e3 03         sbc $03,s
$08:ea9f  ff 81 ff c0   sbc $c0ff81,x
$08:eaa3  ff fc 0f 07   sbc $070ffc,x
$08:eaa7  ff 1f fe 7c   sbc $7cfe1f,x
$08:eaab  ff e3 ff 80   sbc $80ffe3,x
$08:eaaf  ff 1f c0 20   sbc $20c01f,x
$08:eab3  9f 5c be 1a   sta $1abe5c,x
$08:eab7  bb            tyx
$08:eab8  5d bc 43      eor $43bc,x
$08:eabb  b8            clv
$08:eabc  06 a9         asl $a9
$08:eabe  ff 80 c0 3f   sbc $3fc080,x
$08:eac2  80 7f         bra $eb43
$08:eac4  80 7f         bra $eb45
$08:eac6  83 7c         sta $7c,s
$08:eac8  8c 73 88      sty $8873
$08:eacb  77 88         adc [$88],y
$08:eacd  77 01         adc [$01],y
$08:eacf  ff 98 03 24   sbc $240398,x
$08:ead3  19 5a 3d      ora $3d5a,y
$08:ead6  ca            dex
$08:ead7  dd ba 5d      cmp $5dba,x
$08:eada  7a            ply
$08:eadb  9d ca 3d      sta $3dca,x
$08:eade  ff 01 03 fc   sbc $fc0301,x
$08:eae2  01 fe         ora ($fe,x)
$08:eae4  01 fe         ora ($fe,x)
$08:eae6  c1 3e         cmp ($3e,x)
$08:eae8  11 ee         ora ($ee),y
$08:eaea  11 ee         ora ($ee),y
$08:eaec  11 ee         ora ($ee),y
$08:eaee  28            plp
$08:eaef  5f 52 6d a9   eor $a96d52,x
$08:eaf3  b7 f5         lda [$f5],y
$08:eaf5  7b            tdc
$08:eaf6  68            pla
$08:eaf7  2f de 9f bf   and $bf9fde
$08:eafb  2f 3c 18 c5   and $c5183c
$08:eaff  80 e5         bra $eae6
$08:eb01  80 f2         bra $eaf5
$08:eb03  40            rti
$08:eb04  fa            plx
$08:eb05  80 fe         bra $eb05
$08:eb07  d0 ff         bne $eb08
$08:eb09  60            rts
$08:eb0a  ff d0 fe e7   sbc $e7fed0,x
$08:eb0e  70 95         bvs $eaa5
$08:eb10  10 fe         bpl $eb10
$08:eb12  24 db         bit $db
$08:eb14  04 ff         tsb $ff
$08:eb16  22 fb 22 fb   jsl $fb22fb
$08:eb1a  64 ff         stz $ff
$08:eb1c  52 dd         eor ($dd)
$08:eb1e  8f 03 47 01   sta $014703
$08:eb22  4b            phk
$08:eb23  00 71         brk #$71
$08:eb25  00 8d         brk #$8d
$08:eb27  00 8d         brk #$8d
$08:eb29  00 09         brk #$09
$08:eb2b  00 29         brk #$29
$08:eb2d  00 40         brk #$40
$08:eb2f  bf 17 e8 39   lda $39e817,x
$08:eb33  c6 5a         dec $5a
$08:eb35  af 36 df 2c   lda $2cdf36
$08:eb39  df 51 ae 25   cmp $25ae51,x
$08:eb3d  da            phx
$08:eb3e  9f 00 e8 00   sta $00e800,x
$08:eb42  c0 00         cpy #$00
$08:eb44  a0 00         ldy #$00
$08:eb46  c0 00         cpy #$00
$08:eb48  c1 00         cmp ($00,x)
$08:eb4a  a2 00         ldx #$00
$08:eb4c  da            phx
$08:eb4d  00 9d         brk #$9d
$08:eb4f  7f d3 bf ad   adc $adbfd3,x
$08:eb53  ff d6 bf f9   sbc $f9bfd6,x
$08:eb57  ff fe 55 d7   sbc $d755fe,x
$08:eb5b  aa            tax
$08:eb5c  e9 17 01      sbc #$0117
$08:eb5f  01 83         ora ($83,x)
$08:eb61  83 8d         sta $8d,s
$08:eb63  8d 90 90      sta $9090
$08:eb66  f8            sed
$08:eb67  f8            sed
$08:eb68  54 54 82      mvn $82,$54
$08:eb6b  82 01 01      brl $ec6f
$08:eb6e  54 17 4a      mvn $4a,$17
$08:eb71  a3 92         lda $92,s
$08:eb73  03 34         ora $34,s
$08:eb75  d5 ae         cmp $ae,x
$08:eb77  07 53         ora [$53]
$08:eb79  a3 95         lda $95,s
$08:eb7b  79 55 01      adc $0155,y
$08:eb7e  17 e8         ora [$e8],y
$08:eb80  03 fc         ora $fc,s
$08:eb82  03 fc         ora $fc,s
$08:eb84  15 ea         ora $ea,x
$08:eb86  07 f8         ora [$f8]
$08:eb88  03 fc         ora $fc,s
$08:eb8a  01 fe         ora ($fe,x)
$08:eb8c  01 fe         ora ($fe,x)
$08:eb8e  ab            plb
$08:eb8f  ef 4b ff ae   sbc $aeff4b
$08:eb93  fc 7d f5      jsr ($f57d,x)
$08:eb96  97 f7         sta [$f7],y
$08:eb98  6a            ror a
$08:eb99  eb            xba
$08:eb9a  f5 f1         sbc $f1,x
$08:eb9c  aa            tax
$08:eb9d  eb            xba
$08:eb9e  ef 93 f8 08   sbc $08f893
$08:eba2  f3 20         sbc ($20,s),y
$08:eba4  ea            nop
$08:eba5  60            rts
$08:eba6  c8            iny
$08:eba7  01 d4         ora ($d4,x)
$08:eba9  41 ce         eor ($ce,x)
$08:ebab  c0 94         cpy #$94
$08:ebad  80 7e         bra $ec2d
$08:ebaf  e5 b0         sbc $b0
$08:ebb1  ff c0 ff c0   sbc $c0ffc0,x
$08:ebb5  7f c0 ff 31   adc $31ffc0,x
$08:ebb9  ff 4e b5 ea   sbc $eab54e,x
$08:ebbd  a4 04         ldy $04
$08:ebbf  1b            tcs
$08:ebc0  1f 60 7f 80   ora $807f60,x
$08:ebc4  7f 80 7f 80   adc $807f80,x
$08:ebc8  3f 80 04 7b   and $7b0480,x
$08:ebcc  11 7b         ora ($7b),y
$08:ebce  23 e3         and $e3,s
$08:ebd0  4f b6 9e ed   eor $ed9eb6
$08:ebd4  3c 5a 69      bit $695a,x
$08:ebd7  25 d1         and $d1
$08:ebd9  cc 23 99      cpy $9923
$08:ebdc  47 b3         eor [$b3]
$08:ebde  e3 1c         sbc $1c,s
$08:ebe0  86 79         stx $79
$08:ebe2  8c 73 18      sty $1873
$08:ebe5  e7 21         sbc [$21]
$08:ebe7  de c0 3f      dec $3fc0,x
$08:ebea  81 7e         sta ($7e,x)
$08:ebec  83 7c         sta $7c,s
$08:ebee  68            pla
$08:ebef  3f 0a ab 55   and $55ab0a,x
$08:ebf3  57 ab         eor [$ab],y
$08:ebf5  ad c5 4b      lda $4bc5
$08:ebf8  89 97 b1      bit #$b197
$08:ebfb  8f 60 1f 3f   sta $3f1f60
$08:ebff  c0 2b         cpy #$2b
$08:ec01  d4 55         pei ($55)
$08:ec03  aa            tax
$08:ec04  a9 56 41      lda #$4156
$08:ec07  be 81 7e      ldx $7e81,y
$08:ec0a  81 7e         sta ($7e,x)
$08:ec0c  01 fe         ora ($fe,x)
$08:ec0e  f4 77 b6      pea $b677
$08:ec11  af 54 9f 3a   lda $3a9f54
$08:ec15  ff de cb 06   sbc $06cbde,x
$08:ec19  db            stp
$08:ec1a  6e 73 95      ror $9573
$08:ec1d  1b            tcs
$08:ec1e  74 88         stz $88,x
$08:ec20  a4 58         ldy $58
$08:ec22  1c e0 f8      trb $f8e0
$08:ec25  00 c8         brk #$c8
$08:ec27  30 c0         bmi $ebe9
$08:ec29  20 60 80      jsr $8060
$08:ec2c  01 e0         ora ($e0,x)
$08:ec2e  26 df         rol $df
$08:ec30  ed e1 a2      sbc $a2e1
$08:ec33  b9 ec fc      lda $fcec,y
$08:ec36  9e b8 ad      stz $adb8,x
$08:ec39  b9 de fa      lda $fade,y
$08:ec3c  f4 31 00      pea $0031
$08:ec3f  3f 21 1e 60   and $601e21,x
$08:ec43  07 24         ora [$24]
$08:ec45  03 40         ora $40,s
$08:ec47  03 61         ora $61,s
$08:ec49  02 02         cop #$02
$08:ec4b  01 e8         ora ($e8,x)
$08:ec4d  03 ad         ora $ad,s
$08:ec4f  52 b2         eor ($b2)
$08:ec51  4e bd 63      lsr $63bd
$08:ec54  66 29         ror $29
$08:ec56  f1 10         sbc ($10),y
$08:ec58  95 af         sta $af,x
$08:ec5a  4f 00 52 ad   eor $ad5200
$08:ec5e  02 00         cop #$00
$08:ec60  01 00         ora ($00,x)
$08:ec62  00 00         brk #$00
$08:ec64  10 80         bpl $ebe6
$08:ec66  0f c0 80 60   ora $6080c0
$08:ec6a  00 f0         brk #$f0
$08:ec6c  00 ff         brk #$ff
$08:ec6e  0e c0 71      asl $71c0
$08:ec71  fe 8c 7f      inc $7f8c,x
$08:ec74  0f cf 01 01   ora $0101cf
$08:ec78  ff 80 30 0f   sbc $0f3080,x
$08:ec7c  00 c7         brk #$c7
$08:ec7e  c0 ff         cpy #$ff
$08:ec80  81 ff         sta ($ff,x)
$08:ec82  03 ff         ora $ff,s
$08:ec84  3f f0 e0 ff   and $ffe0f0,x
$08:ec88  f8            sed
$08:ec89  7f 3e ff c7   adc $c7ff3e,x
$08:ec8d  ff 30 3f fc   sbc $fc3f30,x
$08:ec91  3f 0f 00 fc   and $fc000f,x
$08:ec95  80 e0         bra $ec77
$08:ec97  ff 87 07 1c   sbc $1c0787,x
$08:ec9b  e0 ff         cpx #$ff
$08:ec9d  f0 c0         beq $ec5f
$08:ec9f  ff ff c3 0e   sbc $0ec3ff,x
$08:eca3  ff 83 7f 00   sbc $007f83,x
$08:eca7  ff 7f f8 1c   sbc $1cf87f,x
$08:ecab  ff f0 0f 4d   sbc $4d0ff0,x
$08:ecaf  8a            txa
$08:ecb0  1f 8c 22 96   ora $96228c,x
$08:ecb4  54 b8 1b      mvn $1b,$b8
$08:ecb7  bc 26 98      ldy $9826,x
$08:ecba  5a            phy
$08:ecbb  db            stp
$08:ecbc  85 c5         sta $c5
$08:ecbe  88            dey
$08:ecbf  77 88         adc [$88],y
$08:ecc1  77 86         adc [$86],y
$08:ecc3  79 80 7f      adc $7f80,y
$08:ecc6  80 7f         bra $ed47
$08:ecc8  80 7f         bra $ed49
$08:ecca  db            stp
$08:eccb  24 c5         bit $c5
$08:eccd  ba            tsx
$08:ecce  c8            iny
$08:eccf  7d ba dd      adc $ddba,x
$08:ecd2  48            pha
$08:ecd3  6d 28 1d      adc $1d28
$08:ecd6  da            phx
$08:ecd7  3d 64 19      and $1964,x
$08:ecda  63 ff         adc $ff,s
$08:ecdc  bd bf 11      lda $11bf,x
$08:ecdf  ee 11 ee      inc $ee11
$08:ece2  61 9e         adc ($9e,x)
$08:ece4  01 fe         ora ($fe,x)
$08:ece6  01 fe         ora ($fe,x)
$08:ece8  01 fe         ora ($fe,x)
$08:ecea  ff 01 bf 41   sbc $41bf01,x
$08:ecee  22 40 7d e8   jsl $e87d40
$08:ecf2  05 ed         ora $ed
$08:ecf4  80 f7         bra $eced
$08:ecf6  53 ff         eor ($ff,s),y
$08:ecf8  83 ff         sta $ff,s
$08:ecfa  da            phx
$08:ecfb  ff aa ff c0   sbc $c0ffaa,x
$08:ecff  bf a0 1f e5   lda $e51fa0,x
$08:ed03  3a            dec a
$08:ed04  e7 88         sbc [$88]
$08:ed06  f7 53         sbc [$53],y
$08:ed08  f7 83         sbc [$83],y
$08:ed0a  ff d2 ff a2   sbc $a2ffd2,x
$08:ed0e  b5 0d         lda $0d,x
$08:ed10  6d 9b 56      adc $569b
$08:ed13  4b            phk
$08:ed14  aa            tax
$08:ed15  a3 6c         lda $6c,s
$08:ed17  f7 32         sbc [$32],y
$08:ed19  d7 54         cmp [$54],y
$08:ed1b  b7 2a         lda [$2a],y
$08:ed1d  7f 00 fe 01   adc $01fe00,x
$08:ed21  fc 43 b8      jsr ($b843,x)
$08:ed24  a3 5c         lda $5c,s
$08:ed26  f7 18         sbc [$18],y
$08:ed28  f7 28         sbc [$28],y
$08:ed2a  f7 48         sbc [$48],y
$08:ed2c  ff a0 1a e5   sbc $e51aa0,x
$08:ed30  e3 9c         sbc $9c,s
$08:ed32  52 ad         eor ($ad)
$08:ed34  b1 ce         lda ($ce),y
$08:ed36  4e f1 91      lsr $91f1
$08:ed39  ee 2d d6      inc $d62d
$08:ed3c  da            phx
$08:ed3d  3f 64 00 1c   and $1c0064,x
$08:ed41  00 0c         brk #$0c
$08:ed43  00 0e         brk #$0e
$08:ed45  00 11         brk #$11
$08:ed47  00 20         brk #$20
$08:ed49  00 40         brk #$40
$08:ed4b  00 00         brk #$00
$08:ed4d  00 a8         brk #$a8
$08:ed4f  7f 14 ff dd   adc $ddff14,x
$08:ed53  7f 29 ff d1   adc $d1ff29,x
$08:ed57  2f 07 f9 28   and $28f907
$08:ed5b  d7 6a         cmp [$6a],y
$08:ed5d  bd 02 00      lda $0002,x
$08:ed60  02 00         cop #$00
$08:ed62  02 00         cop #$00
$08:ed64  02 00         cop #$00
$08:ed66  04 00         tsb $00
$08:ed68  f8            sed
$08:ed69  00 c6         brk #$c6
$08:ed6b  00 81         brk #$81
$08:ed6d  00 b2         brk #$b2
$08:ed6f  0b            phd
$08:ed70  55 11         eor $11,x
$08:ed72  a5 55         lda $55
$08:ed74  5a            phy
$08:ed75  5b            tcd
$08:ed76  a5 81         lda $81
$08:ed78  57 57         eor [$57],y
$08:ed7a  aa            tax
$08:ed7b  ab            plb
$08:ed7c  54 f7 03      mvn $03,$f7
$08:ed7f  fc 11 ee      jsr ($ee11,x)
$08:ed82  05 fa         ora $fa
$08:ed84  5b            tcd
$08:ed85  a4 81         ldy $81
$08:ed87  7e 57 a8      ror $a857,x
$08:ed8a  ab            plb
$08:ed8b  54 f7 08      mvn $08,$f7
$08:ed8e  95 f5         sta $f5,x
$08:ed90  ab            plb
$08:ed91  e8            inx
$08:ed92  95 f5         sta $f5,x
$08:ed94  e3 b2         sbc $b2,s
$08:ed96  bd dd ca      lda $cadd,x
$08:ed99  bf e5 9f d4   lda $d49fe5,x
$08:ed9d  eb            xba
$08:ed9e  8a            txa
$08:ed9f  80 97         bra $ed38
$08:eda1  80 8a         bra $ed2d
$08:eda3  80 8d         bra $ed32
$08:eda5  80 82         bra $ed29
$08:eda7  80 80         bra $ed29
$08:eda9  80 80         bra $ed2b
$08:edab  80 c0         bra $ed6d
$08:edad  c0 5b         cpy #$5b
$08:edaf  4e b6 94      lsr $94b6
$08:edb2  79 6c a6      adc $a66c,y
$08:edb5  8e bf ff      stx $ffbf
$08:edb8  7a            ply
$08:edb9  fa            plx
$08:edba  70 ff         bvs $edbb
$08:edbc  c0 ff         cpy #$ff
$08:edbe  b1 00         lda ($00),y
$08:edc0  6b            rtl
$08:edc1  00 93         brk #$93
$08:edc3  00 71         brk #$71
$08:edc5  00 0f         brk #$0f
$08:edc7  0f 3a 35 7f   ora $7f353a
$08:edcb  40            rti
$08:edcc  ff 80 8e e6   sbc $e68e80,x
$08:edd0  9c cd 3b      stz $3bcd
$08:edd3  98            tya
$08:edd4  f3 b4         sbc ($b4,s),y
$08:edd6  66 e8         ror $e8
$08:edd8  5c c0 ab ff   jml $ffabc0
$08:eddc  ff ff 86 79   sbc $7986ff,x
$08:ede0  8c 73 98      sty $9873
$08:ede3  67 b0         adc [$b0]
$08:ede5  4f e0 1f c0   eor $c01fe0
$08:ede9  3f ff ab ff   and $ffabff,x
$08:eded  ff e3 1f c5   sbc $c51fe3,x
$08:edf1  1d 9a 79      ora $799a,x
$08:edf4  15 71         ora $71,x
$08:edf6  69 63 d0      adc #$d063
$08:edf9  c7 c9         cmp [$c9]
$08:edfb  ff ff ff 03   sbc $03ffff,x
$08:edff  fc 05 fa      jsr ($fa05,x)
$08:ee02  19 e6 11      ora $11e6,y
$08:ee05  ee 61 9e      inc $9e61
$08:ee08  c1 3e         cmp ($3e,x)
$08:ee0a  ff c9 ff ff   sbc $ffffc9,x
$08:ee0e  f6 b8         inc $b8,x
$08:ee10  ba            tsx
$08:ee11  34 ae         bit $ae,x
$08:ee13  f7 7f         sbc [$7f],y
$08:ee15  f0 ae         beq $edc5
$08:ee17  71 70         adc ($70),y
$08:ee19  64 34         stz $34
$08:ee1b  e4 54         cpx $54
$08:ee1d  84 23         sty $23
$08:ee1f  c0 23         cpy #$23
$08:ee21  c0 e0         cpy #$e0
$08:ee23  00 e6         brk #$e6
$08:ee25  00 26         brk #$26
$08:ee27  c0 7b         cpy #$7b
$08:ee29  80 ff         bra $ee2a
$08:ee2b  00 04         brk #$04
$08:ee2d  fb            xce
$08:ee2e  df 39 5c f9   cmp $f95c39,x
$08:ee32  1f 22 9d 21   ora $219d22,x
$08:ee36  d6 33         dec $33,x
$08:ee38  9f 12 ef 8f   sta $8fef12,x
$08:ee3c  fd f3 c0      sbc $c0f3,x
$08:ee3f  03 00         ora $00,s
$08:ee41  03 da         ora $da,s
$08:ee43  01 d9         ora ($d9,x)
$08:ee45  02 1e         cop #$1e
$08:ee47  01 7e         ora ($7e,x)
$08:ee49  01 ef         ora ($ef,x)
$08:ee4b  10 f0         bpl $ee3d
$08:ee4d  0f 2b d2 d7   ora $d7d22b
$08:ee51  1a            inc a
$08:ee52  2b            pld
$08:ee53  3a            dec a
$08:ee54  8e 65 6d      stx $6d65
$08:ee57  08            php
$08:ee58  7d f2 fa      adc $faf2,x
$08:ee5b  0a            asl a
$08:ee5c  3b            tsc
$08:ee5d  84 84         sty $84
$08:ee5f  00 e4         brk #$e4
$08:ee61  00 c4         brk #$c4
$08:ee63  00 18         brk #$18
$08:ee65  01 f0         ora ($f0,x)
$08:ee67  03 00         ora $00,s
$08:ee69  07 0a         ora [$0a]
$08:ee6b  05 80         ora $80
$08:ee6d  7f 3d ff 7f   adc $7fff3d,x
$08:ee71  bf 20 df 3f   lda $3fdf20,x
$08:ee75  c0 01         cpy #$01
$08:ee77  bf 50 ef 0f   lda $0fef50,x
$08:ee7b  d0 28         bne $eea5
$08:ee7d  b7 80         lda [$80],y
$08:ee7f  00 80         brk #$80
$08:ee81  00 df         brk #$df
$08:ee83  00 c0         brk #$c0
$08:ee85  00 a0         brk #$a0
$08:ee87  40            rti
$08:ee88  e0 00         cpx #$00
$08:ee8a  d0 20         bne $eeac
$08:ee8c  b7 40         lda [$40],y
$08:ee8e  02 fd         cop #$fd
$08:ee90  c2 fd         rep #$fd
$08:ee92  05 fb         ora $fb
$08:ee94  fc 03 73      jsr ($7303,x)
$08:ee97  fd ba f5      sbc $f5ba,x
$08:ee9a  f2 09         sbc ($09)
$08:ee9c  15 ef         ora $ef,x
$08:ee9e  01 00         ora ($00,x)
$08:eea0  01 00         ora ($00,x)
$08:eea2  fa            plx
$08:eea3  01 02         ora ($02,x)
$08:eea5  01 04         ora ($04,x)
$08:eea7  03 04         ora $04,s
$08:eea9  03 08         ora $08,s
$08:eeab  07 e8         ora [$e8]
$08:eead  07 03         ora [$03]
$08:eeaf  ff 87 5f 60   sbc $605f87,x
$08:eeb3  17 c0         ora [$c0],y
$08:eeb5  d7 00         cmp [$00],y
$08:eeb7  30 50         bmi $ef09
$08:eeb9  1f 90 ab e0   ora $e0ab90,x
$08:eebd  08            php
$08:eebe  ff 0f 1f ef   sbc $ef1f0f,x
$08:eec2  1f ef df 2f   ora $2fdfef,x
$08:eec6  1f ef 1f e0   ora $e01fef,x
$08:eeca  8f 76 0f f7   sta $f70f76
$08:eece  00 00         brk #$00
$08:eed0  00 00         brk #$00
$08:eed2  00 00         brk #$00
$08:eed4  00 00         brk #$00
$08:eed6  00 00         brk #$00
$08:eed8  00 00         brk #$00
$08:eeda  00 00         brk #$00
$08:eedc  00 00         brk #$00
$08:eede  00 00         brk #$00
$08:eee0  00 00         brk #$00
$08:eee2  00 00         brk #$00
$08:eee4  00 00         brk #$00
$08:eee6  00 00         brk #$00
$08:eee8  00 00         brk #$00
$08:eeea  00 00         brk #$00
$08:eeec  00 00         brk #$00
$08:eeee  d9 ff a2      cmp $a2ff,y
$08:eef1  ff dd ff e1   sbc $e1ffdd,x
$08:eef5  ff c2 ff e3   sbc $e3ffc2,x
$08:eef9  df d5 ff e3   cmp $e3ffd5,x
$08:eefd  7f fe d0 fd   adc $fdd0fe,x
$08:ef01  a0 fb d1      ldy #$d1fb
$08:ef04  f7 e1         sbc [$e1],y
$08:ef06  ef c2 df c3   sbc $c3dfc2
$08:ef0a  ff d5 7f 63   sbc $637fd5,x
$08:ef0e  ca            dex
$08:ef0f  ff a0 f7 5a   sbc $5af7a0,x
$08:ef13  f7 e0         sbc [$e0],y
$08:ef15  f7 c8         sbc [$c8],y
$08:ef17  ff d2 ff ec   sbc $ecffd2,x
$08:ef1b  ff c6 f7 ff   sbc $fff7c6,x
$08:ef1f  c0 f7 a8      cpy #$a8f7
$08:ef22  f7 58         sbc [$58],y
$08:ef24  f7 e8         sbc [$e8],y
$08:ef26  ff c0 f7 d0   sbc $d0f7c0,x
$08:ef2a  f7 e4         sbc [$e4],y
$08:ef2c  ff ce d4 ff   sbc $ffd4ce,x
$08:ef30  da            phx
$08:ef31  ff b6 ff be   sbc $beffb6,x
$08:ef35  ff 6e fc 7b   sbc $7bfc6e,x
$08:ef39  fd f6 fa      sbc $faf6,x
$08:ef3c  f3 fb         sbc ($fb,s),y
$08:ef3e  ff d4 ff da   sbc $daffd4,x
$08:ef42  ff b6 ff bf   sbc $bfffb6,x
$08:ef46  fe 6f fd      inc $fd6f,x
$08:ef49  7e fa f5      ror $f5fa,x
$08:ef4c  fb            xce
$08:ef4d  f4 00 00      pea $0000
$08:ef50  00 00         brk #$00
$08:ef52  00 00         brk #$00
$08:ef54  00 00         brk #$00
$08:ef56  00 00         brk #$00
$08:ef58  00 00         brk #$00
$08:ef5a  00 00         brk #$00
$08:ef5c  00 00         brk #$00
$08:ef5e  00 00         brk #$00
$08:ef60  00 00         brk #$00
$08:ef62  00 00         brk #$00
$08:ef64  00 00         brk #$00
$08:ef66  00 00         brk #$00
$08:ef68  00 00         brk #$00
$08:ef6a  00 00         brk #$00
$08:ef6c  00 00         brk #$00
$08:ef6e  00 00         brk #$00
$08:ef70  00 00         brk #$00
$08:ef72  00 00         brk #$00
$08:ef74  00 00         brk #$00
$08:ef76  00 00         brk #$00
$08:ef78  00 00         brk #$00
$08:ef7a  00 00         brk #$00
$08:ef7c  00 00         brk #$00
$08:ef7e  00 00         brk #$00
$08:ef80  00 00         brk #$00
$08:ef82  00 00         brk #$00
$08:ef84  00 00         brk #$00
$08:ef86  00 00         brk #$00
$08:ef88  00 00         brk #$00
$08:ef8a  00 00         brk #$00
$08:ef8c  00 00         brk #$00
$08:ef8e  b9 d6 af      lda $afd6,y
$08:ef91  e5 f5         sbc $f5
$08:ef93  f1 af         sbc ($af),y
$08:ef95  df af f5 d5   cmp $d5f5af,x
$08:ef99  b1 cf         lda ($cf),y
$08:ef9b  ff b5 ff 90   sbc $90ffb5,x
$08:ef9f  90 95         bcc $ef36
$08:efa1  85 ce         sta $ce
$08:efa3  c0 80 80      cpy #$8080
$08:efa6  85 85         sta $85
$08:efa8  8e 80 c0      stx $c080
$08:efab  c0 b5 b5      cpy #$b5b5
$08:efae  80 fe         bra $efae
$08:efb0  d1 f6         cmp ($f6),y
$08:efb2  89 e6 88      bit #$88e6
$08:efb5  e6 91         inc $91
$08:efb7  f6 58         inc $58,x
$08:efb9  e7 60         sbc [$60]
$08:efbb  ff ff ff ff   sbc $ffffff,x
$08:efbf  81 ef         sta ($ef,x)
$08:efc1  99 ff 99      sta $99ff,y
$08:efc4  ff 99 ee 99   sbc $99ee99,x
$08:efc8  67 58         adc [$58]
$08:efca  7f 60 ff ff   adc $ffff60,x
$08:efce  76 a7         ror $a7,x
$08:efd0  9b            txy
$08:efd1  d3 c5         cmp ($c5,s),y
$08:efd3  e9 aa f4      sbc #$f4aa
$08:efd6  51 fa         eor ($fa),y
$08:efd8  a8            tay
$08:efd9  fc 55 ff      jsr ($ff55,x)
$08:efdc  78            sei
$08:efdd  ff 87 7a c3   sbc $c37a87,x
$08:efe1  3d e1 9e      and $9ee1,x
$08:efe4  f0 8f         beq $ef75
$08:efe6  f8            sed
$08:efe7  47 fc         eor [$fc]
$08:efe9  23 ff         and $ff,s
$08:efeb  10 ff         bpl $efec
$08:efed  78            sei
$08:efee  f9 fe 5a      sbc $5afe,y
$08:eff1  dc 28 fe      jml [$fe28]
$08:eff4  bb            tyx
$08:eff5  fd 61 7a      sbc $7a61,x
$08:eff8  2a            rol a
$08:eff9  3e 5d 5f      rol $5f5d,x
$08:effc  1e ff fc      asl $fcff,x
$08:efff  d3 dc         cmp ($dc,s),y
$08:f001  73 fc         adc ($fc,s),y
$08:f003  03 fd         ora $fd,s
$08:f005  12 7a         ora ($7a)
$08:f007  85 3e         sta $3e
$08:f009  c1 5f         cmp ($5f,x)
$08:f00b  ac ff 1e      ldy $1eff
$08:f00e  00 9f         brk #$9f
$08:f010  20 7c 20      jsr $207c
$08:f013  7b            tdc
$08:f014  07 ef         ora [$ef]
$08:f016  08            php
$08:f017  ff 30 fc 00   sbc $00fc30,x
$08:f01b  b3 00         lda ($00,s),y
$08:f01d  8c ff 60      sty $60ff
$08:f020  ff f3 ff f7   sbc $f7fff3,x
$08:f024  ff 77 ff 0f   sbc $0fff77,x
$08:f028  ff 7f ff 7c   sbc $7cff7f,x
$08:f02c  ff 73 5f 1f   sbc $1f5f73,x
$08:f030  aa            tax
$08:f031  bf e5 ff 52   lda $52ffe5,x
$08:f035  df 39 ff 55   cmp $55ff39,x
$08:f039  f7 6d         sbc [$6d],y
$08:f03b  f8            sed
$08:f03c  68            pla
$08:f03d  fa            plx
$08:f03e  1f ef bf 4a   ora $4abfef,x
$08:f042  ff 05 df 22   sbc $22df05,x
$08:f046  ff 01 f7 48   sbc $48f701,x
$08:f04a  f8            sed
$08:f04b  67 f8         adc [$f8]
$08:f04d  67 ba         adc [$ba]
$08:f04f  e4 55         cpx $55
$08:f051  c9 9b c3      cmp #$c39b
$08:f054  25 87         and $87
$08:f056  d9 9f f3      cmp $f39f,y
$08:f059  7f f3 ff d7   adc $d7fff3,x
$08:f05d  ff e0 1f c1   sbc $c11fe0,x
$08:f061  3e c3 3c      rol $3cc3,x
$08:f064  87 78         sta [$78]
$08:f066  9f 60 7f 81   sta $817f60,x
$08:f06a  ff 01 ff 03   sbc $03ff01,x
$08:f06e  03 fc         ora $fc,s
$08:f070  54 7b aa      mvn $aa,$7b
$08:f073  2d 13 1c      and $1c13
$08:f076  e5 26         sbc $26
$08:f078  96 a3         stx $a3,y
$08:f07a  4d 04 52      eor $5204
$08:f07d  ad fc 00      lda $00fc
$08:f080  78            sei
$08:f081  80 2c         bra $f0af
$08:f083  d0 1c         bne $f0a1
$08:f085  e0 26 d8      cpx #$d826
$08:f088  83 7c         sta $7c,s
$08:f08a  04 fb         tsb $fb
$08:f08c  00 ff         brk #$ff
$08:f08e  c0 3f a5      cpy #$a53f
$08:f091  d0 4a         bne $f0dd
$08:f093  b5 d5         lda $d5,x
$08:f095  3f 9a 6d 2a   and $2a6d9a,x
$08:f099  97 35         sta [$35],y
$08:f09b  80 44         bra $f0e1
$08:f09d  bf 3f 00 10   lda $10003f,x
$08:f0a1  0f 20 1f 20   ora $201f20
$08:f0a5  1f 40 3f 80   ora $803f40,x
$08:f0a9  7f 80 7f 80   adc $807f80,x
$08:f0ad  7f 00 06 02   adc $020600,x
$08:f0b1  e6 20         inc $20
$08:f0b3  f8            sed
$08:f0b4  00 3c         brk #$3c
$08:f0b6  04 0c         tsb $0c
$08:f0b8  00 e6         brk #$e6
$08:f0ba  c2 e6         rep #$e6
$08:f0bc  02 06         cop #$06
$08:f0be  ff ff ff ff   sbc $ffffff,x
$08:f0c2  ff ff ff ff   sbc $ffffff,x
$08:f0c6  ff ff ff ff   sbc $ffffff,x
$08:f0ca  ff ff ff ff   sbc $ffffff,x
$08:f0ce  ff ff ff ff   sbc $ffffff,x
$08:f0d2  ff ff ff ff   sbc $ffffff,x
$08:f0d6  ff ff ff ff   sbc $ffffff,x
$08:f0da  ff ff ff ff   sbc $ffffff,x
$08:f0de  ff ff ff ff   sbc $ffffff,x
$08:f0e2  ff ff ff ff   sbc $ffffff,x
$08:f0e6  ff ff ff ff   sbc $ffffff,x
$08:f0ea  ff ff ff ff   sbc $ffffff,x
$08:f0ee  f3 ff         sbc ($ff,s),y
$08:f0f0  f7 f7         sbc [$f7],y
$08:f0f2  f7 ff         sbc [$ff],y
$08:f0f4  fb            xce
$08:f0f5  f7 ff         sbc [$ff],y
$08:f0f7  f7 f7         sbc [$f7],y
$08:f0f9  ff f7 ff f7   sbc $f7fff7,x
$08:f0fd  ff ff f3 ff   sbc $fff3ff,x
$08:f101  ff ff ff f7   sbc $f7ffff,x
$08:f105  f3 f7         sbc ($f7,s),y
$08:f107  f7 ff         sbc [$ff],y
$08:f109  f7 f7         sbc [$f7],y
$08:f10b  f7 ff         sbc [$ff],y
$08:f10d  f7 ee         sbc [$ee],y
$08:f10f  f7 c6         sbc [$c6],y
$08:f111  ff e7 ff c6   sbc $c6ffe7,x
$08:f115  ff ef f7 e7   sbc $e7f7ef,x
$08:f119  f7 ff         sbc [$ff],y
$08:f11b  ff f7 ff f7   sbc $f7fff7,x
$08:f11f  e6 ff         inc $ff
$08:f121  c6 ff         dec $ff
$08:f123  ef ff ce ff   sbc $ffceff
$08:f127  ef ff ef f7   sbc $f7efff
$08:f12b  f7 f7         sbc [$f7],y
$08:f12d  f7 c8         sbc [$c8],y
$08:f12f  ff a8 ff 50   sbc $50ffa8,x
$08:f133  ff e8 ff ca   sbc $caffe8,x
$08:f137  fe d3 fd      inc $fdd3,x
$08:f13a  f6 fa         inc $fa,x
$08:f13c  d3 fb         cmp ($fb,s),y
$08:f13e  ff c0 ff a0   sbc $a0ffc0,x
$08:f142  ff 50 ff e0   sbc $e0ff50,x
$08:f146  fe c3 fd      inc $fdc3,x
$08:f149  d2 fa         cmp ($fa)
$08:f14b  f5 fb         sbc $fb,x
$08:f14d  d4 e6         pei ($e6)
$08:f14f  fb            xce
$08:f150  e2 fb         sep #$fb
$08:f152  d6 fb         dec $fb,x
$08:f154  f5 d9         sbc $d9,x
$08:f156  b2 f8         lda ($f8)
$08:f158  fd bc e2      sbc $e2bc,x
$08:f15b  7e 7b 7f      ror $7f7b,x
$08:f15e  fb            xce
$08:f15f  e4 fb         cpx $fb
$08:f161  f4 fb d4      pea $d4fb
$08:f164  f9 f6 f8      sbc $f8f6,y
$08:f167  b7 fc         lda [$fc],y
$08:f169  f3 fe         sbc ($fe,s),y
$08:f16b  e1 ff         sbc ($ff,x)
$08:f16d  e8            inx
$08:f16e  dd cf 4f      cmp $4fcf,x
$08:f171  1f 9b 3f 9f   ora $9f3f9b,x
$08:f175  3f bf 77 37   and $3777bf,x
$08:f179  7f 6f ff 6f   adc $6fff6f,x
$08:f17d  ff ef cd ff   sbc $ffcdef,x
$08:f181  0f ff 1b ff   ora $ff1bff
$08:f185  1f f7 77 ff   ora $ff77f7,x
$08:f189  37 ef         and [$ef],y
$08:f18b  ef ff 6f 35   sbc $356fff
$08:f18f  e1 1a         sbc ($1a,x)
$08:f191  fb            xce
$08:f192  0a            asl a
$08:f193  ff 80 7f 91   sbc $917f80,x
$08:f197  ca            dex
$08:f198  6a            ror a
$08:f199  35 b2         and $b2,x
$08:f19b  49 ad         eor #$ad
$08:f19d  ff 9e 00 84   sbc $84009e,x
$08:f1a1  00 41         brk #$41
$08:f1a3  80 3f         bra $f1e4
$08:f1a5  c0 00         cpy #$00
$08:f1a7  ff 00 ff 00   sbc $00ff00,x
$08:f1ab  ff 00 ff 80   sbc $80ff00,x
$08:f1af  ff b2 b6 00   sbc $00b6b2,x
$08:f1b3  ff 00 ff 13   sbc $13ff00,x
$08:f1b7  c9 6a         cmp #$6a
$08:f1b9  35 b2         and $b2,x
$08:f1bb  49 ad         eor #$ad
$08:f1bd  ff 2a 00 49   sbc $49002a,x
$08:f1c1  00 04         brk #$04
$08:f1c3  00 ff         brk #$ff
$08:f1c5  00 00         brk #$00
$08:f1c7  ff 00 ff 00   sbc $00ff00,x
$08:f1cb  ff 00 ff 2d   sbc $2dff00,x
$08:f1cf  ff cb ff 17   sbc $17ffcb,x
$08:f1d3  ff ae ff 9d   sbc $9dffae,x
$08:f1d7  ff b4 ff d3   sbc $d3ffb4,x
$08:f1db  ff 7f ff ff   sbc $ffff7f,x
$08:f1df  01 ff         ora ($ff,x)
$08:f1e1  83 ff         sta $ff,s
$08:f1e3  07 ff         ora [$ff]
$08:f1e5  8e ff 9c      stx $9cff
$08:f1e8  ff b0 ff c3   sbc $c3ffb0,x
$08:f1ec  ff 3e a5 e7   sbc $e7a53e,x
$08:f1f0  e8            inx
$08:f1f1  ef 55 d7 b3   sbc $b3d755
$08:f1f5  8f 56 cf cc   sta $cccf56
$08:f1f9  de 9c bd      dec $bd9c,x
$08:f1fc  3b            tsc
$08:f1fd  7b            tdc
$08:f1fe  e7 99         sbc [$99]
$08:f200  ef 90 d7 29   sbc $29d790
$08:f204  87 7b         sta [$7b]
$08:f206  cf 36 de ad   cmp $adde36
$08:f20a  bd 5e 7b      lda $7b5e,x
$08:f20d  bf 07 f0 bf   lda $bff007,x
$08:f211  c0 3c         cpy #$3c
$08:f213  c0 1a         cpy #$1a
$08:f215  80 1c         bra $f233
$08:f217  c0 1a         cpy #$1a
$08:f219  80 1c         bra $f237
$08:f21b  80 00         bra $f21d
$08:f21d  c3 ff         cmp $ff,s
$08:f21f  0f ff bf ff   ora $ffbfff
$08:f223  bf ff 7f ff   lda $ff7fff,x
$08:f227  3f ff 7f ff   and $ff7fff,x
$08:f22b  7f ff 3c 2b   adc $2b3cff,x
$08:f22f  f9 75 fd      sbc $fd75,y
$08:f232  35 fd         and $fd,x
$08:f234  3b            tsc
$08:f235  ff 59 fd 7f   sbc $7ffd59,x
$08:f239  ff 1a ff 9d   sbc $9dff1a,x
$08:f23d  ff f9 26 fd   sbc $fd26f9,x
$08:f241  72 fd         adc ($fd)
$08:f243  32 ff         and ($ff)
$08:f245  38            sec
$08:f246  fd 1a ff      sbc $ff1a,x
$08:f249  3c ff 18      bit $18ff,x
$08:f24c  ff 9c 6d ff   sbc $ff6d9c,x
$08:f250  96 df         stx $df,y
$08:f252  19 ff 44      ora $44ff,y
$08:f255  f7 92         sbc [$92],y
$08:f257  fb            xce
$08:f258  38            sec
$08:f259  fd 5c fe      sbc $fe5c,x
$08:f25c  36 7e         rol $7e,x
$08:f25e  ff 05 df 22   sbc $22df05,x
$08:f262  ff 01 f7 08   sbc $08f701,x
$08:f266  fb            xce
$08:f267  14 fc         trb $fc
$08:f269  3b            tsc
$08:f26a  fe 1d 7e      inc $7e1d,x
$08:f26d  b1 ff         lda ($ff),y
$08:f26f  ff ff ff ff   sbc $ffffff,x
$08:f273  ff ff bf ff   sbc $ffbfff,x
$08:f277  f7 ff         sbc [$ff],y
$08:f279  a9 fa         lda #$fa
$08:f27b  85 ff         sta $ff
$08:f27d  ff ff ff ff   sbc $ffffff,x
$08:f281  ff ff ff ff   sbc $ffffff,x
$08:f285  ff ff ff ff   sbc $ffffff,x
$08:f289  ff ff ff ff   sbc $ffffff,x
$08:f28d  ff ff ff ff   sbc $ffffff,x
$08:f291  fd ff f7      sbc $f7ff,x
$08:f294  ff 69 ff d5   sbc $d5ff69,x
$08:f298  f5 6b         sbc $6b,x
$08:f29a  c9 37         cmp #$37
$08:f29c  ff ff ff ff   sbc $ffffff,x
$08:f2a0  ff ff ff ff   sbc $ffffff,x
$08:f2a4  ff ff ff ff   sbc $ffffff,x
$08:f2a8  ff ff ff ff   sbc $ffffff,x
$08:f2ac  ff ff ec bf   sbc $bfecff,x
$08:f2b0  79 ff bb      adc $bbff,y
$08:f2b3  ff 56 ff 3e   sbc $3eff56,x
$08:f2b7  ff 6b ff 56   sbc $56ff6b,x
$08:f2bb  ff a3 bf ff   sbc $ffbfa3,x
$08:f2bf  ec ff 79      cpx $79ff
$08:f2c2  ff bb ff 56   sbc $56ffbb,x
$08:f2c6  ff 2e ff 23   sbc $23ff2e,x
$08:f2ca  ff 12 bf 41   sbc $41bf12,x
$08:f2ce  c4 f7         cpy $f7
$08:f2d0  99 ff 26      sta $26ff,y
$08:f2d3  ff 19 ff 62   sbc $62ff19,x
$08:f2d7  ff 8d ff 1e   sbc $1eff8d,x
$08:f2db  ff 3d ff f7   sbc $f7ff3d,x
$08:f2df  c8            iny
$08:f2e0  ff 81 ff 06   sbc $06ff81,x
$08:f2e4  ff 18 ff 60   sbc $60ff18,x
$08:f2e8  ff 81 ff 02   sbc $02ff81,x
$08:f2ec  ff 05 b7 ff   sbc $ffb705,x
$08:f2f0  ff f7 ff ff   sbc $fffff7,x
$08:f2f4  a9 ff         lda #$ff
$08:f2f6  fe f7 99      inc $99f7,x
$08:f2f9  ff 2b 3f cb   sbc $cb3f2b,x
$08:f2fd  0f f7 b7 ff   ora $ffb7f7
$08:f301  ff ff ff ff   sbc $ffffff,x
$08:f305  a9 f7         lda #$f7
$08:f307  f7 ff         sbc [$ff],y
$08:f309  98            tya
$08:f30a  ff 23 ff 08   sbc $08ff23,x
$08:f30e  ff f7 f7 ff   sbc $fff7f7,x
$08:f312  bf f7 f7 ff   lda $fff7f7,x
$08:f316  af cf 7f ff   lda $ff7fcf
$08:f31a  b4 fc         ldy $fc,x
$08:f31c  73 f0         adc ($f0,s),y
$08:f31e  f7 f7         sbc [$f7],y
$08:f320  ff f7 f7 b7   sbc $b7f7f7,x
$08:f324  f7 f7         sbc [$f7],y
$08:f326  f7 f7         sbc [$f7],y
$08:f328  ff 7f ff 94   sbc $94ff7f,x
$08:f32c  ff 70 bf ff   sbc $ffbf70,x
$08:f330  ff ff fd ff   sbc $fffdff,x
$08:f334  ad ff ff      lda $ffff
$08:f337  fb            xce
$08:f338  9f fb 3e 37   sta $373efb,x
$08:f33c  d7 1f         cmp [$1f],y
$08:f33e  fe be fe      inc $febe,x
$08:f341  fe fd fd      inc $fdfd,x
$08:f344  fd ad fb      sbc $fbad,x
$08:f347  fb            xce
$08:f348  fb            xce
$08:f349  9b            txy
$08:f34a  f7 36         sbc [$36],y
$08:f34c  ff 17 00 00   sbc $000017,x
$08:f350  00 00         brk #$00
$08:f352  00 00         brk #$00
$08:f354  00 00         brk #$00
$08:f356  00 00         brk #$00
$08:f358  00 00         brk #$00
$08:f35a  00 00         brk #$00
$08:f35c  00 00         brk #$00
$08:f35e  00 00         brk #$00
$08:f360  00 00         brk #$00
$08:f362  00 00         brk #$00
$08:f364  00 00         brk #$00
$08:f366  00 00         brk #$00
$08:f368  00 00         brk #$00
$08:f36a  00 00         brk #$00
$08:f36c  00 00         brk #$00
$08:f36e  5e ff 5e      lsr $5eff,x
$08:f371  ff 3d ff 3d   sbc $3dff3d,x
$08:f375  ff 7b ff bb   sbc $bbff7b,x
$08:f379  ff 56 7f d5   sbc $d57f56,x
$08:f37d  5f ff 5e ff   eor $ff5eff,x
$08:f381  5e ff 3d      lsr $3dff,x
$08:f384  ff 3d ff 7b   sbc $7bff3d,x
$08:f388  ff bb ff d6   sbc $d6ffbb,x
$08:f38c  ff f4 35 e1   sbc $e135f4,x
$08:f390  1a            inc a
$08:f391  fb            xce
$08:f392  8a            txa
$08:f393  7f c0 ff 2d   adc $2dffc0,x
$08:f397  1e d8 c7      asl $c7d8,x
$08:f39a  bc 3c 55      ldy $553c,x
$08:f39d  93 9e         sta ($9e,s),y
$08:f39f  00 84         brk #$84
$08:f3a1  00 41         brk #$41
$08:f3a3  80 ff         bra $f3a4
$08:f3a5  00 00         brk #$00
$08:f3a7  ff c0 3f 3c   sbc $3c3fc0,x
$08:f3ab  c3 10         cmp $10,s
$08:f3ad  ef 80 ff b2   sbc $b2ff80
$08:f3b1  b6 00         ldx $00,y
$08:f3b3  ff 00 ff 6a   sbc $6aff00,x
$08:f3b7  64 d9         stz $d9
$08:f3b9  e1 da         sbc ($da,x)
$08:f3bb  3c 92 e1      bit $e192,x
$08:f3be  2a            rol a
$08:f3bf  00 49         brk #$49
$08:f3c1  00 04         brk #$04
$08:f3c3  00 ff         brk #$ff
$08:f3c5  00 60         brk #$60
$08:f3c7  9f 01 fe 00   sta $00fe01,x
$08:f3cb  ff 00 ff 5b   sbc $5bff00,x
$08:f3cf  ff 28 bf 2d   sbc $2dbf28,x
$08:f3d3  bf d6 df 57   lda $57dfd6,x
$08:f3d7  df 2b ef f5   cmp $f5ef2b,x
$08:f3db  f7 5e         sbc [$5e],y
$08:f3dd  ff ff 19 bf   sbc $bf19ff,x
$08:f3e1  48            pha
$08:f3e2  bf 4d df a6   lda $a6df4d,x
$08:f3e6  df 27 ef 13   cmp $13ef27,x
$08:f3ea  f7 88         sbc [$88],y
$08:f3ec  ff 00 75 ff   sbc $ff7500,x
$08:f3f0  f6 fe         inc $fe,x
$08:f3f2  e5 ff         sbc $ff
$08:f3f4  d8            cld
$08:f3f5  ff ad ff f0   sbc $f0ffad,x
$08:f3f9  f7 d5         sbc [$d5],y
$08:f3fb  f7 e0         sbc [$e0],y
$08:f3fd  e7 ff         sbc [$ff]
$08:f3ff  70 fe         bvs $f3ff
$08:f401  f3 ff         sbc ($ff,s),y
$08:f403  e0 ff         cpx #$ff
$08:f405  d0 ff         bne $f406
$08:f407  a1 f7         lda ($f7,x)
$08:f409  68            pla
$08:f40a  f7 c9         sbc [$c9],y
$08:f40c  e7 d8         sbc [$d8]
$08:f40e  00 fc         brk #$fc
$08:f410  00 80         brk #$80
$08:f412  00 80         brk #$80
$08:f414  00 80         brk #$80
$08:f416  00 80         brk #$80
$08:f418  7f 00 7f 00   adc $007f00,x
$08:f41c  00 80         brk #$80
$08:f41e  ff 03 ff 7f   sbc $7fff03,x
$08:f422  ff 7f ff 7f   sbc $7fff7f,x
$08:f426  ff 7f ff ff   sbc $ffff7f,x
$08:f42a  ff ff ff 7f   sbc $7fffff,x
$08:f42e  00 ff         brk #$ff
$08:f430  d6 ff         dec $ff,x
$08:f432  09 db         ora #$db
$08:f434  00 f5         brk #$f5
$08:f436  c0 ee         cpy #$ee
$08:f438  c0 df         cpy #$df
$08:f43a  00 ff         brk #$ff
$08:f43c  00 ff         brk #$ff
$08:f43e  ff 00 ff ff   sbc $ffff00,x
$08:f442  ff ff ff 0b   sbc $0bffff,x
$08:f446  ff f1 ff e0   sbc $e0fff1,x
$08:f44a  ff c0 ff 00   sbc $00ffc0,x
$08:f44e  00 ff         brk #$ff
$08:f450  58            cli
$08:f451  dd 10 a6      cmp $a610,x
$08:f454  68            pla
$08:f455  d7 20         cmp [$20],y
$08:f457  8d 50 c5      sta $c550
$08:f45a  48            pha
$08:f45b  ce 38 87      dec $8738
$08:f45e  ff 00 df 23   sbc $23df00,x
$08:f462  87 79         sta [$79]
$08:f464  c7 38         cmp [$38]
$08:f466  87 7b         sta [$7b]
$08:f468  c7 3b         cmp [$3b]
$08:f46a  cf 31 87 78   cmp $788731
$08:f46e  00 00         brk #$00
$08:f470  00 00         brk #$00
$08:f472  00 00         brk #$00
$08:f474  00 00         brk #$00
$08:f476  00 00         brk #$00
$08:f478  00 00         brk #$00
$08:f47a  00 00         brk #$00
$08:f47c  00 00         brk #$00
$08:f47e  00 00         brk #$00
$08:f480  00 00         brk #$00
$08:f482  00 00         brk #$00
$08:f484  00 00         brk #$00
$08:f486  00 00         brk #$00
$08:f488  00 00         brk #$00
$08:f48a  00 00         brk #$00
$08:f48c  00 00         brk #$00
$08:f48e  00 00         brk #$00
$08:f490  00 00         brk #$00
$08:f492  00 00         brk #$00
$08:f494  00 00         brk #$00
$08:f496  00 00         brk #$00
$08:f498  00 00         brk #$00
$08:f49a  00 00         brk #$00
$08:f49c  00 00         brk #$00
$08:f49e  00 00         brk #$00
$08:f4a0  00 00         brk #$00
$08:f4a2  00 00         brk #$00
$08:f4a4  00 00         brk #$00
$08:f4a6  00 00         brk #$00
$08:f4a8  00 00         brk #$00
$08:f4aa  00 00         brk #$00
$08:f4ac  00 00         brk #$00
$08:f4ae  00 00         brk #$00
$08:f4b0  00 00         brk #$00
$08:f4b2  00 00         brk #$00
$08:f4b4  00 00         brk #$00
$08:f4b6  00 00         brk #$00
$08:f4b8  00 00         brk #$00
$08:f4ba  00 00         brk #$00
$08:f4bc  00 00         brk #$00
$08:f4be  00 00         brk #$00
$08:f4c0  00 00         brk #$00
$08:f4c2  00 00         brk #$00
$08:f4c4  00 00         brk #$00
$08:f4c6  00 00         brk #$00
$08:f4c8  00 00         brk #$00
$08:f4ca  00 00         brk #$00
$08:f4cc  00 00         brk #$00
$08:f4ce  00 00         brk #$00
$08:f4d0  00 00         brk #$00
$08:f4d2  00 00         brk #$00
$08:f4d4  00 00         brk #$00
$08:f4d6  00 00         brk #$00
$08:f4d8  00 00         brk #$00
$08:f4da  00 00         brk #$00
$08:f4dc  00 00         brk #$00
$08:f4de  00 00         brk #$00
$08:f4e0  00 00         brk #$00
$08:f4e2  00 00         brk #$00
$08:f4e4  00 00         brk #$00
$08:f4e6  00 00         brk #$00
$08:f4e8  00 00         brk #$00
$08:f4ea  00 00         brk #$00
$08:f4ec  00 00         brk #$00
$08:f4ee  00 00         brk #$00
$08:f4f0  00 00         brk #$00
$08:f4f2  00 00         brk #$00
$08:f4f4  00 00         brk #$00
$08:f4f6  00 00         brk #$00
$08:f4f8  00 00         brk #$00
$08:f4fa  00 00         brk #$00
$08:f4fc  00 00         brk #$00
$08:f4fe  00 00         brk #$00
$08:f500  00 00         brk #$00
$08:f502  00 00         brk #$00
$08:f504  00 00         brk #$00
$08:f506  00 00         brk #$00
$08:f508  00 00         brk #$00
$08:f50a  00 00         brk #$00
$08:f50c  00 00         brk #$00
$08:f50e  00 00         brk #$00
$08:f510  00 00         brk #$00
$08:f512  00 00         brk #$00
$08:f514  00 00         brk #$00
$08:f516  00 00         brk #$00
$08:f518  00 00         brk #$00
$08:f51a  00 00         brk #$00
$08:f51c  00 00         brk #$00
$08:f51e  00 00         brk #$00
$08:f520  00 00         brk #$00
$08:f522  00 00         brk #$00
$08:f524  00 00         brk #$00
$08:f526  00 00         brk #$00
$08:f528  00 00         brk #$00
$08:f52a  00 00         brk #$00
$08:f52c  00 00         brk #$00
$08:f52e  00 00         brk #$00
$08:f530  00 00         brk #$00
$08:f532  00 00         brk #$00
$08:f534  00 00         brk #$00
$08:f536  00 00         brk #$00
$08:f538  00 00         brk #$00
$08:f53a  00 00         brk #$00
$08:f53c  00 00         brk #$00
$08:f53e  00 00         brk #$00
$08:f540  00 00         brk #$00
$08:f542  00 00         brk #$00
$08:f544  00 00         brk #$00
$08:f546  00 00         brk #$00
$08:f548  00 00         brk #$00
$08:f54a  00 00         brk #$00
$08:f54c  00 00         brk #$00
$08:f54e  ff 00 c0 3f   sbc $3fc000,x
$08:f552  b7 77         lda [$77],y
$08:f554  c1 7f         cmp ($7f,x)
$08:f556  9e 3e 9e      stz $9e3e,x
$08:f559  3e 80 3e      rol $3e80,x
$08:f55c  c1 7f         cmp ($7f,x)
$08:f55e  7f 7f c0 ff   adc $ffc07f,x
$08:f562  88            dey
$08:f563  ff be ff ff   sbc $ffffbe,x
$08:f567  ff ff ff ff   sbc $ffffff,x
$08:f56b  ff be ff c0   sbc $c0ffbe,x
$08:f56f  7f e5 65 fc   adc $fc65e5,x
$08:f573  02 b9         cop #$b9
$08:f575  3b            tsc
$08:f576  c2 7f         rep #$7f
$08:f578  c0 7f 92      cpy #$927f
$08:f57b  7f ff 00 80   adc $8000ff,x
$08:f57f  ff 9a ff fd   sbc $fdff9a,x
$08:f583  ff c4 ff bc   sbc $bcffc4,x
$08:f587  ff bf ff 80   sbc $80ffbf,x
$08:f58b  ff 7f 7f ff   sbc $ff7f7f,x
$08:f58f  00 80         brk #$80
$08:f591  7f dd 7f 81   adc $817fdd,x
$08:f595  01 bc         ora ($bc,x)
$08:f597  42 d7         wdm #$d7
$08:f599  28            plp
$08:f59a  bf 40 bf 40   lda $40bf40,x
$08:f59e  7f 7f be ff   adc $ffbe7f,x
$08:f5a2  be ff fe      ldx $feff,y
$08:f5a5  ff bd ff d7   sbc $d7ffbd,x
$08:f5a9  ff bf ff bf   sbc $bfffbf,x
$08:f5ad  ff fb 44 f4   sbc $f444fb,x
$08:f5b1  4b            phk
$08:f5b2  e0 5f a9      cpx #$a95f
$08:f5b5  2b            pld
$08:f5b6  ca            dex
$08:f5b7  7e c0 7f      ror $7fc0,x
$08:f5ba  92 7f         sta ($7f)
$08:f5bc  ff 00 bf ff   sbc $ffbf00,x
$08:f5c0  bf ff bf ff   lda $ffbfff,x
$08:f5c4  d4 ff         pei ($ff)
$08:f5c6  bd ff bf      lda $bfff,x
$08:f5c9  ff 80 ff 7f   sbc $7fff80,x
$08:f5cd  7f 7e 81 c1   adc $c1817e,x
$08:f5d1  7e 92 73      ror $7392,x
$08:f5d4  a1 7f         lda ($7f,x)
$08:f5d6  8d 53 8c      sta $8c53
$08:f5d9  52 a1         eor ($a1)
$08:f5db  7f 5a ba 7e   adc $7eba5a,x
$08:f5df  ff 81 ff 8c   sbc $8cff81,x
$08:f5e3  ff 80 ff ac   sbc $acff80,x
$08:f5e7  ff ad ff 80   sbc $80ffad,x
$08:f5eb  ff 45 ff 6f   sbc $6fff45,x
$08:f5ef  b0 b3         bcs $f5a4
$08:f5f1  4e cc bd      lsr $bdcc
$08:f5f4  53 b2         eor ($b2,s),y
$08:f5f6  a9 6f a6      lda #$a66f
$08:f5f9  6e d5 5c      ror $5cd5
$08:f5fc  db            stp
$08:f5fd  28            plp
$08:f5fe  4f ff b1 ff   eor $ffb1ff
$08:f602  42 ff         wdm #$ff
$08:f604  4d ff 91      eor $91ff
$08:f607  fe 96 f9      inc $f996,x
$08:f60a  a4 fb         ldy $fb
$08:f60c  d8            cld
$08:f60d  f7 81         sbc [$81],y
$08:f60f  7e 53 f3      ror $f353,x
$08:f612  1c e2 6e      trb $6ee2
$08:f615  df 39 99 32   cmp $329939,x
$08:f619  96 55         stx $55,y
$08:f61b  f5 ca         sbc $ca,x
$08:f61d  5b            tcd
$08:f61e  c3 ff         cmp $ff,s
$08:f620  8c ff 3f      sty $3fff
$08:f623  ff 20 ff 66   sbc $66ff20,x
$08:f627  ff 69 ff aa   sbc $aaff69,x
$08:f62b  ff a4 ff ff   sbc $ffffa4,x
$08:f62f  fc ca 82      jsr ($82ca,x)
$08:f632  a5 94         lda $94
$08:f634  aa            tax
$08:f635  a9 d5 93      lda #$93d5
$08:f638  ab            plb
$08:f639  a6 d6         ldx $d6
$08:f63b  4c ac 19      jmp $19ac
$08:f63e  fc 00 82      jsr ($8200,x)
$08:f641  7d 84 7b      adc $7b84,x
$08:f644  88            dey
$08:f645  77 90         adc [$90],y
$08:f647  6f a0 5f 40   adc $405fa0
$08:f64b  3f 00 7f 00   and $007f00,x
$08:f64f  00 00         brk #$00
$08:f651  00 00         brk #$00
$08:f653  00 00         brk #$00
$08:f655  00 00         brk #$00
$08:f657  00 00         brk #$00
$08:f659  00 00         brk #$00
$08:f65b  00 00         brk #$00
$08:f65d  00 00         brk #$00
$08:f65f  00 00         brk #$00
$08:f661  00 00         brk #$00
$08:f663  00 00         brk #$00
$08:f665  00 00         brk #$00
$08:f667  00 00         brk #$00
$08:f669  00 00         brk #$00
$08:f66b  00 00         brk #$00
$08:f66d  00 01         brk #$01
$08:f66f  10 00         bpl $f671
$08:f671  10 80         bpl $f5f3
$08:f673  3b            tsc
$08:f674  f3 db         sbc ($db,s),y
$08:f676  e9 f5 7b      sbc #$7bf5
$08:f679  7d de 87      adc $87de,x
$08:f67c  c2 80         rep #$80
$08:f67e  83 cb         sta $cb,s
$08:f680  c4 ce         cpy $ce
$08:f682  03 cb         ora $cb,s
$08:f684  c6 ef         dec $ef
$08:f686  2f 7f 37 95   and $95377f
$08:f68a  cf e4 73 38   cmp $3873e4
$08:f68e  fc ee 40      jsr ($40ee,x)
$08:f691  68            pla
$08:f692  3d 6e f1      and $f16e,x
$08:f695  f3 73         sbc ($73,s),y
$08:f697  f3 b9         sbc ($b9,s),y
$08:f699  dd 6e ab      cmp $ab6e,x
$08:f69c  5f ae d4 0a   eor $0ad4ae,x
$08:f6a0  83 3b         sta $3b,s
$08:f6a2  c1 7f         cmp ($7f,x)
$08:f6a4  84 03         sty $03
$08:f6a6  f9 d7 ce      sbc $ced7,y
$08:f6a9  e9 33 c3      sbc #$c333
$08:f6ac  c2 d0         rep #$d0
$08:f6ae  8b            phb
$08:f6af  03 96         ora $96,s
$08:f6b1  0f 00 60 e7   ora $e76000
$08:f6b5  75 83         adc $83,x
$08:f6b7  c3 1e         cmp $1e,s
$08:f6b9  0e 8f 87      asl $878f
$08:f6bc  c6 e3         dec $e3
$08:f6be  f2 b9         sbc ($b9)
$08:f6c0  9a            txs
$08:f6c1  f2 63         sbc ($63)
$08:f6c3  67 b7         adc [$b7]
$08:f6c5  7c be 60      jmp ($60be,x)
$08:f6c8  a8            tay
$08:f6c9  34 c3         bit $c3,x
$08:f6cb  c2 d8         rep #$d8
$08:f6cd  8f 0f 53 aa   sta $aa530f
$08:f6d1  16 08         asl $08,x
$08:f6d3  f0 b6         beq $f68b
$08:f6d5  79 d2 db      adc $dbd2,y
$08:f6d8  8f 07 45 b8   sta $b84507
$08:f6dc  dc 9f 8b      jml [$8b9f]
$08:f6df  45 b7         eor $b7
$08:f6e1  26 2e         rol $2e
$08:f6e3  af 3b d1 e9   lda $e9d13b
$08:f6e7  26 0f         rol $0f
$08:f6e9  6b            rtl
$08:f6ea  b6 d8         ldx $d8,y
$08:f6ec  6d 33 db      adc $db33
$08:f6ef  0d ae cb      ora $cbae
$08:f6f2  a7 f1         lda [$f1]
$08:f6f4  f9 1e 8c      sbc $8c1e,y
$08:f6f7  54 3a e5      mvn $e5,$3a
$08:f6fa  91 76         sta ($76),y
$08:f6fc  fd 1e f3      sbc $f31e,x
$08:f6ff  09 0b 01      ora #$010b
$08:f702  46 08         lsr $08
$08:f704  c0 d7 9d      cpy #$9dd7
$08:f707  00 42         brk #$42
$08:f709  1c e3 68      trb $68e3
$08:f70c  6c 87 62      jmp ($6287)
$08:f70f  30 2d         bmi $f73e
$08:f711  f1 48         sbc ($48),y
$08:f713  73 ba         adc ($ba,s),y
$08:f715  fd 86 77      sbc $7786,x
$08:f718  3a            dec a
$08:f719  4b            phk
$08:f71a  26 e0         rol $e0
$08:f71c  38            sec
$08:f71d  01 4e         ora ($4e,x)
$08:f71f  1a            inc a
$08:f720  b2 d0         lda ($d0)
$08:f722  39 c5 26      and $26c5,y
$08:f725  49 b0 70      eor #$70b0
$08:f728  06 f1         asl $f1
$08:f72a  c6 39         dec $39
$08:f72c  ed 3e bb      sbc $bb3e
$08:f72f  53 ae         eor ($ae,s),y
$08:f731  71 8b         adc ($8b),y
$08:f733  7c 3a 1d      jmp ($1d3a,x)
$08:f736  47 89         eor [$89]
$08:f738  83 0d         sta $0d,s
$08:f73a  a0 19 de      ldy #$de19
$08:f73d  9e 73 b8      stz $b873,x
$08:f740  e0 05 20      cpx #$2005
$08:f743  38            sec
$08:f744  c7 7e         cmp [$7e]
$08:f746  a5 07         lda $07
$08:f748  38            sec
$08:f749  f6 fe         inc $fe,x
$08:f74b  7f 4e bf 47   adc $47bf4e,x
$08:f74f  ac e9 11      ldy $11e9
$08:f752  19 67 53      ora $5367,y
$08:f755  a1 9c         lda ($9c,x)
$08:f757  fd ff 33      sbc $33ff,x
$08:f75a  83 a0         sta $a0,s
$08:f75c  ea            nop
$08:f75d  6f 1b e0 9d   adc $9de01b
$08:f761  0e bf 43      asl $43bf
$08:f764  38            sec
$08:f765  ad 08 04      lda $0408
$08:f768  03 eb         ora $eb,s
$08:f76a  f6 0c         inc $0c,x
$08:f76c  10 5c         bpl $f7ca
$08:f76e  07 43         ora [$43]
$08:f770  f0 24         beq $f796
$08:f772  01 58         ora ($58,x)
$08:f774  be f9 ce      ldx $cef9,y
$08:f777  a8            tay
$08:f778  98            tya
$08:f779  3f 3f 72 30   and $30723f,x
$08:f77d  fb            xce
$08:f77e  7d de 93      adc $93de,x
$08:f781  38            sec
$08:f782  7a            ply
$08:f783  a0 1f 4c      ldy #$4c1f
$08:f786  e0 d8 4a      cpx #$4ad8
$08:f789  c3 ef         cmp $ef,s
$08:f78b  66 83         ror $83
$08:f78d  30 79         bmi $f808
$08:f78f  1e 8f 67      asl $678f,x
$08:f792  34 8c         bit $8c,x
$08:f794  46 60         lsr $60
$08:f796  e7 ad         sbc [$ad]
$08:f798  80 02         bra $f79c
$08:f79a  0c a1 42      tsb $42a1
$08:f79d  81 58         sta ($58,x)
$08:f79f  7c 99 ce      jmp ($ce99,x)
$08:f7a2  7b            tdc
$08:f7a3  b4 01         ldy $01,x
$08:f7a5  86 01         stx $01
$08:f7a7  12 b0         ora ($b0)
$08:f7a9  fb            xce
$08:f7aa  38            sec
$08:f7ab  ba            tsx
$08:f7ac  60            rts
$08:f7ad  91 6d         sta ($6d),y
$08:f7af  d4 e5         pei ($e5)
$08:f7b1  b6 39         ldx $39,y
$08:f7b3  8a            txa
$08:f7b4  50 b6         bvc $f76c
$08:f7b6  03 50         ora $50,s
$08:f7b8  ea            nop
$08:f7b9  f5 ba         sbc $ba,x
$08:f7bb  0b            phd
$08:f7bc  91 2d         sta ($2d),y
$08:f7be  0f 5c 38 1b   ora $1b385c
$08:f7c2  0e 9f cc      asl $cc9f
$08:f7c5  94 1f         sty $1f,x
$08:f7c7  02 50         cop #$50
$08:f7c9  11 88         ora ($88),y
$08:f7cb  92 1f         sta ($1f)
$08:f7cd  e5 c8         sbc $c8
$08:f7cf  76 ce         ror $ce,x
$08:f7d1  24 d8         bit $d8
$08:f7d3  73 11         adc ($11,s),y
$08:f7d5  39 fc ac      and $acfc,y
$08:f7d8  5e 6f 3b      lsr $3b6f,x
$08:f7db  b3 3d         lda ($3d,s),y
$08:f7dd  9c ff 1b      stz $1bff
$08:f7e0  62 50 63      per $5b33
$08:f7e3  af f5 99 83   lda $8399f5
$08:f7e7  c4 d8         cpy $d8
$08:f7e9  6f a7 3d 48   adc $483da7
$08:f7ed  1c 93 b8      trb $b893
$08:f7f0  67 0d         adc [$0d]
$08:f7f2  41 e5         eor ($e5,x)
$08:f7f4  35 08         and $08,x
$08:f7f6  a4 3f         ldy $3f
$08:f7f8  8c 21 d7      sty $d721
$08:f7fb  68            pla
$08:f7fc  73 a2         adc ($a2,s),y
$08:f7fe  f0 17         beq $f817
$08:f800  90 3c         bcc $f83e
$08:f802  98            tya
$08:f803  21 d1         and ($d1,x)
$08:f805  4d 12 28      eor $2812
$08:f808  33 bd         and ($bd,s),y
$08:f80a  03 81         ora $81,s
$08:f80c  b4 43         ldy $43,x
$08:f80e  ec 97 3d      cpx $3d97
$08:f811  9f 4d ca e9   sta $e9ca4d,x
$08:f815  73 dd         adc ($dd,s),y
$08:f817  f6 f3         inc $f3,x
$08:f819  9e 80 aa      stz $aa80,x
$08:f81c  a9 45 88      lda #$8845
$08:f81f  04 11         tsb $11
$08:f821  e1 83         sbc ($83,x)
$08:f823  cf df c4 5a   cmp $5ac4df
$08:f827  86 77         stx $77
$08:f829  3b            tsc
$08:f82a  ad d7 6a      lda $6ad7
$08:f82d  33 bc         and ($bc,s),y
$08:f82f  bf 5f bf d0   lda $d0bf5f,x
$08:f833  20 0c e7      jsr $e70c
$08:f836  33 66         and ($66,s),y
$08:f838  b7 0e         lda [$0e],y
$08:f83a  be dc 9e      ldx $9edc,y
$08:f83d  3a            dec a
$08:f83e  a4 28         ldy $28
$08:f840  e7 39         sbc [$39]
$08:f842  bc ed 7e      ldy $7eed,x
$08:f845  ef 87 f3 fa   sbc $faf387
$08:f849  75 07         adc $07,x
$08:f84b  a0 6f 04      ldy #$046f
$08:f84e  a8            tay
$08:f84f  f3 f3         sbc ($f3,s),y
$08:f851  ba            tsx
$08:f852  fc f6 75      jsr ($75f6,x)
$08:f855  ac 1f ce      ldy $ce1f
$08:f858  e2 f0         sep #$f0
$08:f85a  54 84 93      mvn $93,$84
$08:f85d  03 78         ora $78,s
$08:f85f  74 3e         stz $3e,x
$08:f861  01 b1         ora ($b1,x)
$08:f863  d2 1b         cmp ($1b)
$08:f865  cc de 7f      cpy $7fde
$08:f868  0f 22 b0 35   ora $35b022
$08:f86c  ba            tsx
$08:f86d  53 10         eor ($10,s),y
$08:f86f  ef 9a a8 0c   sbc $0ca89a
$08:f873  0e eb 14      asl $14eb
$08:f876  8e 61 9d      stx $9d61
$08:f879  51 8b         eor ($8b),y
$08:f87b  b0 be         bcs $f83b
$08:f87d  fd c5 18      sbc $18c5,x
$08:f880  ec 76 5d      cpx $5d76
$08:f883  0e be 77      asl $77be
$08:f886  6b            rtl
$08:f887  b2 da         lda ($da)
$08:f889  ed 1d c0      sbc $c01d
$08:f88c  2a            rol a
$08:f88d  05 10         ora $10
$08:f88f  6c 14 01      jmp ($0114)
$08:f892  f1 fb         sbc ($fb),y
$08:f894  75 fa         adc $fa,x
$08:f896  1d 5e b6      ora $b65e,x
$08:f899  f3 62         sbc ($62,s),y
$08:f89b  39 1c e0      and $e01c,y
$08:f89e  64 0c         stz $0c
$08:f8a0  c5 f7         cmp $f7
$08:f8a2  33 00         and ($00,s),y
$08:f8a4  44 3a 1e      mvp $1e,$3a
$08:f8a7  a2 d9         ldx #$d9
$08:f8a9  7c 0d 0b      jmp ($0b0d,x)
$08:f8ac  fc 33 07      jsr ($0733,x)
$08:f8af  20 ee a4      jsr $a4ee
$08:f8b2  16 d0         asl $d0,x
$08:f8b4  a1 d0         lda ($d0,x)
$08:f8b6  82 fb 34      brl $2db4
$08:f8b9  b8            clv
$08:f8ba  10 6f         bpl $f92b
$08:f8bc  76 cf         ror $cf,x
$08:f8be  04 51         tsb $51
$08:f8c0  26 87         rol $87
$08:f8c2  d2 2f         cmp ($2f)
$08:f8c4  18            clc
$08:f8c5  07 90         ora [$90]
$08:f8c7  e0 6e         cpx #$6e
$08:f8c9  00 e5         brk #$e5
$08:f8cb  73 f9         adc ($f9,s),y
$08:f8cd  19 cc e7      ora $e7cc,y
$08:f8d0  a7 dd         lda [$dd]
$08:f8d2  e8            inx
$08:f8d3  f6 7c         inc $7c,x
$08:f8d5  cb            wai
$08:f8d6  25 ec         and $ec
$08:f8d8  ea            nop
$08:f8d9  67 75         adc [$75]
$08:f8db  ba            tsx
$08:f8dc  ae 4f 3b      ldx $3b4f
$08:f8df  93 ca         sta ($ca,s),y
$08:f8e1  70 87         bvs $f86a
$08:f8e3  ec e8 08      cpx $08e8
$08:f8e6  b0 ce         bcs $f8b6
$08:f8e8  73 18         adc ($18,s),y
$08:f8ea  a3 a9         lda $a9,s
$08:f8ec  d7 32         cmp [$32],y
$08:f8ee  43 5f         eor $5f,s
$08:f8f0  a9 f4         lda #$f4
$08:f8f2  7b            tdc
$08:f8f3  dc 20 99      jml [$9920]
$08:f8f6  0c e8 34      tsb $34e8
$08:f8f9  00 62         brk #$62
$08:f8fb  0d 0d 8e      ora $8e0d
$08:f8fe  d9 32 1a      cmp $1a32,y
$08:f901  45 48         eor $48
$08:f903  68            pla
$08:f904  75 ba         adc $ba,x
$08:f906  ed 98 4c      sbc $4c98
$08:f909  33 bb         and ($bb,s),y
$08:f90b  c0 a0         cpy #$a0
$08:f90d  75 95         adc $95,x
$08:f90f  41 ae         eor ($ae,x)
$08:f911  74 9e         stz $9e,x
$08:f913  ef a7 d6 ed   sbc $edd6a7
$08:f917  75 7a         adc $7a,x
$08:f919  48            pha
$08:f91a  90 cf         bcc $f8eb
$08:f91c  6c 36 bb      jmp ($bb36)
$08:f91f  65 e8         adc $e8
$08:f921  01 43         ora ($43,x)
$08:f923  3b            tsc
$08:f924  db            stp
$08:f925  12 80         ora ($80)
$08:f927  a4 7e         ldy $7e
$08:f929  bb            tyx
$08:f92a  0e 98 6c      asl $6c98
$08:f92d  19 a0 da      ora $daa0,y
$08:f930  14 79         trb $79
$08:f932  9b            txy
$08:f933  41 ce         eor ($ce,x)
$08:f935  23 30         and $30,s
$08:f937  14 8f         trb $8f
$08:f939  dd 3e 05      cmp $053e,x
$08:f93c  93 e9         sta ($e9,s),y
$08:f93e  0d 18 6a      ora $6a18
$08:f941  a1 0d         lda ($0d,x)
$08:f943  16 fc         asl $fc,x
$08:f945  00 ee         brk #$ee
$08:f947  5e d2 18      lsr $18d2,x
$08:f94a  10 4c         bpl $f998
$08:f94c  e4 5c         cpx $5c
$08:f94e  54 c8 72      mvn $72,$c8
$08:f951  13 a0         ora ($a0,s),y
$08:f953  53 1e         eor ($1e,s),y
$08:f955  1a            inc a
$08:f956  24 3c         bit $3c
$08:f958  6f d0 e7 b1   adc $b1e7d0
$08:f95c  41 56         eor ($56,x)
$08:f95e  4a            lsr a
$08:f95f  c0 d4         cpy #$d4
$08:f961  72 f9         adc ($f9)
$08:f963  fc 2f 5b      jsr ($5b2f,x)
$08:f966  f4 3a db      pea $db3a
$08:f969  76 91         ror $91,x
$08:f96b  b4 87         ldy $87,x
$08:f96d  4f a0 d4 72   eor $72d4a0
$08:f971  09 01         ora #$01
$08:f973  f7 eb         sbc [$eb],y
$08:f975  b8            clv
$08:f976  43 60         eor $60,s
$08:f978  b6 26         ldx $26,y
$08:f97a  91 68         sta ($68),y
$08:f97c  79 3c a8      adc $a83c,y
$08:f97f  07 d1         ora [$d1]
$08:f981  e2 3b         sep #$3b
$08:f983  c3 8b         cmp $8b,s
$08:f985  6a            ror a
$08:f986  35 b0         and $b0,x
$08:f988  0f e0 04 33   ora $3304e0
$08:f98c  9d d7 08      sta $08d7,x
$08:f98f  1c 59 f2      trb $f259
$08:f992  5f 7e e7 47   eor $47e77e,x
$08:f996  ba            tsx
$08:f997  c8            iny
$08:f998  03 82         ora $82,s
$08:f99a  3e 4f ef      rol $ef4f,x
$08:f99d  9c ef 77      stz $77ef
$08:f9a0  fa            plx
$08:f9a1  d9 dd ae      cmp $aedd,y
$08:f9a4  cb            wai
$08:f9a5  6e e5 07      ror $07e5
$08:f9a8  ca            dex
$08:f9a9  7d 5d a1      adc $a15d,x
$08:f9ac  f6 78         inc $78,x
$08:f9ae  87 41         sta [$41]
$08:f9b0  e2 1d         sep #$1d
$08:f9b2  a0 94         ldy #$94
$08:f9b4  01 05         ora ($05,x)
$08:f9b6  ae 1f 11      ldx $111f
$08:f9b9  7f bf fc 7c   adc $7cfcbf,x
$08:f9bd  24 b2         bit $b2
$08:f9bf  19 c7 bc      ora $bcc7,y
$08:f9c2  b4 04         ldy $04,x
$08:f9c4  80 03         bra $f9c9
$08:f9c6  37 a0         and [$a0],y
$08:f9c8  8c 05 42      sty $4205
$08:f9cb  e5 7a         sbc $7a
$08:f9cd  01 8b         ora ($8b,x)
$08:f9cf  ca            dex
$08:f9d0  2a            rol a
$08:f9d1  01 80         ora ($80,x)
$08:f9d3  b3 bc         lda ($bc,s),y
$08:f9d5  81 ba         sta ($ba,x)
$08:f9d7  e8            inx
$08:f9d8  f3 ba         sbc ($ba,s),y
$08:f9da  f4 c1 68      pea $68c1
$08:f9dd  fa            plx
$08:f9de  7f 30 6a 6a   adc $6a6a30,x
$08:f9e2  f5 c9         sbc $c9,x
$08:f9e4  83 dd         sta $dd,s
$08:f9e6  f6 ff         inc $ff,x
$08:f9e8  60            rts
$08:f9e9  d4 42         pei ($42)
$08:f9eb  a6 c3         ldx $c3
$08:f9ed  a1 f0         lda ($f0,x)
$08:f9ef  06 2a         asl $2a
$08:f9f1  60            rts
$08:f9f2  99 a1 da      sta $daa1,y
$08:f9f5  2c 29 b4      bit $b429
$08:f9f8  f6 79         inc $79,x
$08:f9fa  de 86 70      dec $7086,x
$08:f9fd  d0 a3         bne $f9a2
$08:f9ff  00 31         brk #$31
$08:fa01  97 69         sta [$69],y
$08:fa03  d4 00         pei ($00)
$08:fa05  d4 f2         pei ($f2)
$08:fa07  67 39         adc [$39]
$08:fa09  ec c1 2b      cpx $2bc1
$08:fa0c  a8            tay
$08:fa0d  c0 3d         cpy #$3d
$08:fa0f  1e ce 7e      asl $7ece,x
$08:fa12  75 ba         adc $ba,x
$08:fa14  1d 73 3a      ora $3a73,x
$08:fa17  2b            pld
$08:fa18  07 93         ora [$93]
$08:fa1a  ce 28 03      dec $0328
$08:fa1d  a8            tay
$08:fa1e  3e e7 74      rol $74e7,x
$08:fa21  5e 01 08      lsr $0801,x
$08:fa24  35 05         and $05,x
$08:fa26  10 0d         bpl $fa35
$08:fa28  3f 14 a2 6d   and $6da214,x
$08:fa2c  e6 f2         inc $f2
$08:fa2e  2f 43 6e ea   and $ea6e43
$08:fa32  af 67 5f a3   lda $a35f67
$08:fa36  d6 da         dec $da,x
$08:fa38  ed b6 00      sbc $00b6
$08:fa3b  a0 14         ldy #$14
$08:fa3d  2f d7 ed f0   and $f0edd7
$08:fa41  fb            xce
$08:fa42  f5 f3         sbc $f3,x
$08:fa44  bd 1e 97      lda $971e,x
$08:fa47  55 be         eor $be,x
$08:fa49  cb            wai
$08:fa4a  41 fb         eor ($fb,x)
$08:fa4c  fe 3e 41      inc $413e,x
$08:fa4f  60            rts
$08:fa50  0f c8 e7 d6   ora $d6e7c8
$08:fa54  a7 ea         lda [$ea]
$08:fa56  1f 67 3f 87   ora $873f67,x
$08:fa5a  e2 1f         sep #$1f
$08:fa5c  5e ab 97      lsr $97ab,x
$08:fa5f  9c f4 fa      stz $faf4
$08:fa62  89 e1         bit #$e1
$08:fa64  ef 39 03 c1   sbc $c10339
$08:fa68  33 da         and ($da,s),y
$08:fa6a  86 58         stx $58
$08:fa6c  72 39         adc ($39)
$08:fa6e  fc 8e 2f      jsr ($2f8e,x)
$08:fa71  27 94         and [$94]
$08:fa73  61 47         adc ($47,x)
$08:fa75  e8            inx
$08:fa76  6a            ror a
$08:fa77  75 4d         adc $4d,x
$08:fa79  a0 d4         ldy #$d4
$08:fa7b  a5 03         lda $03
$08:fa7d  55 c8         eor $c8,x
$08:fa7f  f4 22 d1      pea $d122
$08:fa82  3e da 8e      rol $8eda,x
$08:fa85  47 8d         eor [$8d]
$08:fa87  39 7b 3e      and $3e7b,y
$08:fa8a  9f ad 39 7b   sta $7b39ad,x
$08:fa8e  be df c0      ldx $c0df,y
$08:fa91  f8            sed
$08:fa92  40            rti
$08:fa93  c1 d8         cmp ($d8,x)
$08:fa95  ec 9a 25      cpx $259a
$08:fa98  da            phx
$08:fa99  f9 92 8b      sbc $8b92,y
$08:fa9c  60            rts
$08:fa9d  1b            tcs
$08:fa9e  0e b0 70      asl $70b0
$08:faa1  5c 43 9c fd   jml $fd9c43
$08:faa5  92 8b         sta ($8b)
$08:faa7  a6 e8         ldx $e8
$08:faa9  0f ff db e3   ora $e3dbff
$08:faad  f2 fb         sbc ($fb)
$08:faaf  fc 3e bf      jsr ($bf3e,x)
$08:fab2  22 51 f6 f3   jsl $f3f651
$08:fab6  8c b2 0f      sty $0fb2
$08:fab9  bf bf 39 9c   lda $9c39bf,x
$08:fabd  f4 7b 7d      pea $7d7b
$08:fac0  de 12 3b      dec $3b12,x
$08:fac3  79 39 fc      adc $fc39,y
$08:fac6  d4 10         pei ($10)
$08:fac8  f0 fd         beq $fac7
$08:faca  61 20         adc ($20,x)
$08:facc  55 80         eor $80,x
$08:face  48            pha
$08:facf  0e 41 ec      asl $ec41
$08:fad2  ea            nop
$08:fad3  69 35         adc #$35
$08:fad5  1a            inc a
$08:fad6  d3 78         cmp ($78,s),y
$08:fad8  07 c7         ora [$c7]
$08:fada  d7 ef         cmp [$ef],y
$08:fadc  e2 20         sep #$20
$08:fade  41 0e         eor ($0e,x)
$08:fae0  1c cd 62      trb $62cd
$08:fae3  98            tya
$08:fae4  92 61         sta ($61)
$08:fae6  a3 1e         lda $1e,s
$08:fae8  0e 77 5e      asl $5e77
$08:faeb  91 0d         sta ($0d),y
$08:faed  7a            ply
$08:faee  7d 75 7a      adc $7a75,x
$08:faf1  f2 18         sbc ($18)
$08:faf3  a7 e1         lda [$e1]
$08:faf5  3f 1b 16 b0   and $b0161b,x
$08:faf9  ed cb d3      sbc $d3cb
$08:fafc  9d ce f4      sta $f4ce,x
$08:faff  1c a0 d5      trb $d5a0
$08:fb02  06 29         asl $29
$08:fb04  34 05         bit $05,x
$08:fb06  a0 0e         ldy #$0e
$08:fb08  71 e6         adc ($e6),y
$08:fb0a  f2 ba         sbc ($ba)
$08:fb0c  f9 dd a1      sbc $a1dd,y
$08:fb0f  b8            clv
$08:fb10  36 48         rol $48,x
$08:fb12  02 e8         cop #$e8
$08:fb14  a4 43         ldy $43
$08:fb16  9c 57 0e      stz $0e57
$08:fb19  1f 5f 79 b0   ora $b0795f,x
$08:fb1d  40            rti
$08:fb1e  87 49         sta [$49]
$08:fb20  ee 1f 6c      inc $6c1f
$08:fb23  e7 3c         sbc [$3c]
$08:fb25  b2 3b         lda ($3b)
$08:fb27  3e 5f 3d      rol $3d5f,x
$08:fb2a  c6 0f         dec $0f
$08:fb2c  74 fb         stz $fb,x
$08:fb2e  e9 0d         sbc #$0d
$08:fb30  65 a8         adc $a8
$08:fb32  ce f2 33      dec $33f2
$08:fb35  82 70 0c      brl $07a8
$08:fb38  18            clc
$08:fb39  fc 8d 60      jsr ($608d,x)
$08:fb3c  4c 01 b0      jmp $b001
$08:fb3f  7b            tdc
$08:fb40  7d 41 82      adc $8241,x
$08:fb43  32 36         and ($36)
$08:fb45  a0 78         ldy #$78
$08:fb47  1f 36 dd 6c   ora $6cdd36,x
$08:fb4b  d3 41         cmp ($41,s),y
$08:fb4d  fb            xce
$08:fb4e  0c 12 28      tsb $2812
$08:fb51  50 e5         bvc $fb38
$08:fb53  b7 dd         lda [$dd],y
$08:fb55  f4 3e 0c      pea $0c3e
$08:fb58  a3 47         lda $47,s
$08:fb5a  87 5f         sta [$5f]
$08:fb5c  6e 98 05      ror $0598
$08:fb5f  41 32         eor ($32,x)
$08:fb61  8b            phb
$08:fb62  db            stp
$08:fb63  ee f9 2b      inc $2bf9
$08:fb66  01 52         ora ($52,x)
$08:fb68  1f 80 f8 2e   ora $2ef880,x
$08:fb6c  85 b2         sta $b2
$08:fb6e  1e f5 00      asl $00f5,x
$08:fb71  2e c8 12      rol $12c8
$08:fb74  9e 4e 27      stz $274e,x
$08:fb77  0b            phd
$08:fb78  9f 9d d2 32   sta $32d29d,x
$08:fb7c  50 50         bvc $fbce
$08:fb7e  5e ce 62      lsr $62ce,x
$08:fb81  c0 35         cpy #$35
$08:fb83  1a            inc a
$08:fb84  c1 fa         cmp ($fa,x)
$08:fb86  8b            phb
$08:fb87  03 95         ora $95,s
$08:fb89  cf d7 a1 88   cmp $88a1d7
$08:fb8d  a0 bc         ldy #$bc
$08:fb8f  4c ea c0      jmp $c0ea
$08:fb92  4b            phk
$08:fb93  71 f4         adc ($f4),y
$08:fb95  e6 67         inc $67
$08:fb97  76 ed         ror $ed,x
$08:fb99  f4 64 a7      pea $a764
$08:fb9c  f3 af         sbc ($af,s),y
$08:fb9e  d1 eb         cmp ($eb),y
$08:fba0  1e 10 7e      asl $7e10,x
$08:fba3  aa            tax
$08:fba4  c0 ee         cpy #$ee
$08:fba6  67 76         adc [$76]
$08:fba8  8d 12 0e      sta $0e12
$08:fbab  83 21         sta $21,s
$08:fbad  7e fd 7d      ror $7dfd,x
$08:fbb0  e3 44         sbc $44,s
$08:fbb2  b8            clv
$08:fbb3  fc af 58      jsr ($58af,x)
$08:fbb6  fd 7e 81      sbc $817e,x
$08:fbb9  12 db         ora ($db)
$08:fbbb  e8            inx
$08:fbbc  f3 bc         sbc ($bc,s),y
$08:fbbe  3f 4f bb d2   and $d2bb4f,x
$08:fbc2  da            phx
$08:fbc3  2f e1 98 35   and $3598e1
$08:fbc7  fa            plx
$08:fbc8  9d 56 af      sta $af56,x
$08:fbcb  3b            tsc
$08:fbcc  cb            wai
$08:fbcd  e2 ba         sep #$ba
$08:fbcf  03 38         ora $38,s
$08:fbd1  c4 00         cpy $00
$08:fbd3  e8            inx
$08:fbd4  73 34         adc ($34,s),y
$08:fbd6  cf 60 3c 06   cmp $063c60
$08:fbda  a0 96         ldy #$96
$08:fbdc  39 de 4f      and $4fde,y
$08:fbdf  39 a6 05      and $05a6,y
$08:fbe2  92 dd         sta ($dd)
$08:fbe4  e7 51         sbc [$51]
$08:fbe6  47 a9         eor [$a9]
$08:fbe8  d7 33         cmp [$33],y
$08:fbea  40            rti
$08:fbeb  d0 21         bne $fc0e
$08:fbed  30 ce         bmi $fbbd
$08:fbef  f4 0f 28      pea $280f
$08:fbf2  8a            txa
$08:fbf3  3d 9f 4c      and $4c9f,x
$08:fbf6  44 19 c7      mvp $c7,$19
$08:fbf9  fc ee fb      jsr ($fbee,x)
$08:fbfc  7f 0f af c9   adc $c9af0f,x
$08:fc00  1a            inc a
$08:fc01  1a            inc a
$08:fc02  25 d9         and $d9
$08:fc04  37 03         and [$03],y
$08:fc06  6b            rtl
$08:fc07  b2 ed         lda ($ed)
$08:fc09  7c d0 23      jmp ($23d0,x)
$08:fc0c  b5 db         lda $db,x
$08:fc0e  3b            tsc
$08:fc0f  43 a1         eor $a1,s
$08:fc11  d5 44         cmp $44,x
$08:fc13  00 c4         brk #$c4
$08:fc15  73 9f         adc ($9f,s),y
$08:fc17  b4 08         ldy $08,x
$08:fc19  f4 86 80      pea $8086
$08:fc1c  2a            rol a
$08:fc1d  04 b0         tsb $b0
$08:fc1f  21 80         and ($80,x)
$08:fc21  1a            inc a
$08:fc22  1f 04 09 7c   ora $7c0904,x
$08:fc26  7e 49 60      ror $6049,x
$08:fc29  1d 8f dc      ora $dc8f,x
$08:fc2c  38            sec
$08:fc2d  28            plp
$08:fc2e  f5 30         sbc $30,x
$08:fc30  79 c7 d0      adc $d0c7,y
$08:fc33  5e 93 f2      lsr $f293,x
$08:fc36  58            cli
$08:fc37  7b            tdc
$08:fc38  d8            cld
$08:fc39  4a            lsr a
$08:fc3a  a1 46         lda ($46,x)
$08:fc3c  c0 73         cpy #$73
$08:fc3e  79 dc 2e      adc $2edc,y
$08:fc41  6f 29 ac 2a   adc $2aac29
$08:fc45  24 5b         bit $5b
$08:fc47  83 84         sta $84,s
$08:fc49  1e c0 e4      asl $e4c0,x
$08:fc4c  07 40         ora [$40]
$08:fc4e  12 cb         ora ($cb)
$08:fc50  cb            wai
$08:fc51  c4 7c         cpy $7c
$08:fc53  0b            phd
$08:fc54  c5 49         cmp $49
$08:fc56  65 f4         adc $f4
$08:fc58  ee 09 40      inc $4009
$08:fc5b  46 41         lsr $41
$08:fc5d  52 25         eor ($25)
$08:fc5f  97 f3         sta [$f3],y
$08:fc61  39 d5 dd      and $ddd5,y
$08:fc64  74 7a         stz $7a,x
$08:fc66  d9 d1 78      cmp $78d1,y
$08:fc69  08            php
$08:fc6a  c5 44         cmp $44
$08:fc6c  64 40         stz $40
$08:fc6e  27 87         and [$87]
$08:fc70  dc 80 04      jml [$0480]
$08:fc73  70 23         bvs $fc98
$08:fc75  02 5a         cop #$5a
$08:fc77  3f 80 61 03   and $036180,x
$08:fc7b  02 5b         cop #$5b
$08:fc7d  95 43         sta $43,x
$08:fc7f  e4 54         cpx $54
$08:fc81  07 89         ora [$89]
$08:fc83  6a            ror a
$08:fc84  0a            asl a
$08:fc85  a5 66         lda $66
$08:fc87  07 a3         ora [$a3]
$08:fc89  d8            cld
$08:fc8a  b7 06         lda [$06],y
$08:fc8c  60            rts
$08:fc8d  2e 83 38      rol $3883
$08:fc90  a8            tay
$08:fc91  0f 42 8c 35   ora $358c42
$08:fc95  da            phx
$08:fc96  8e 4f 3b      stx $3b4f
$08:fc99  48            pha
$08:fc9a  db            stp
$08:fc9b  0d 46 75      ora $7546
$08:fc9e  96 04         stx $04,y
$08:fca0  41 f1         eor ($f1,x)
$08:fca2  c0 1b         cpy #$1b
$08:fca4  23 aa         and $aa,s
$08:fca6  d6 36         dec $36,x
$08:fca8  17 3b         ora [$3b],y
$08:fcaa  d3 f5         cmp ($f5,s),y
$08:fcac  97 84         sta [$84],y
$08:fcae  de fb 3c      dec $3cfb,x
$08:fcb1  ef 67 e6 6e   sbc $6ee667
$08:fcb5  ad df 43      lda $43df
$08:fcb8  39 fb 80      and $80fb,y
$08:fcbb  39 d3 60      and $60d3,y
$08:fcbe  fa            plx
$08:fcbf  2e 80 74      rol $7480
$08:fcc2  ba            tsx
$08:fcc3  40            rti
$08:fcc4  90 7d         bcc $fd43
$08:fcc6  06 c3         asl $c3
$08:fcc8  a0 0d         ldy #$0d
$08:fcca  0e 97 03      asl $0397
$08:fccd  e0 c0         cpx #$c0
$08:fccf  20 30 a9      jsr $a930
$08:fcd2  87 38         sta [$38]
$08:fcd4  06 0f         asl $0f
$08:fcd6  a8            tay
$08:fcd7  79 c3 81      adc $81c3,y
$08:fcda  f6 55         inc $55,x
$08:fcdc  1b            tcs
$08:fcdd  27 c4         and [$c4]
$08:fcdf  12 36         ora ($36)
$08:fce1  71 4a         adc ($4a),y
$08:fce3  7b            tdc
$08:fce4  c8            iny
$08:fce5  61 c8         adc ($c8,x)
$08:fce7  24 83         bit $83
$08:fce9  a5 fc         lda $fc
$08:fceb  9c 4d 69      stz $694d
$08:fcee  3c 49 03      bit $0349,x
$08:fcf1  ea            nop
$08:fcf2  f6 8a         inc $8a,x
$08:fcf4  8f d9 cc da   sta $daccd9
$08:fcf8  19 40 ac      ora $ac40,y
$08:fcfb  05 10         ora $10
$08:fcfd  e4 73         cpx $73
$08:fcff  de 27 cf      dec $cf27,x
$08:fd02  03 01         ora $01,s
$08:fd04  91 09         sta ($09),y
$08:fd06  e0 00         cpx #$00
$08:fd08  2f a7 50 2c   and $2c50a7
$08:fd0c  26 f5         rol $f5
$08:fd0e  00 17         brk #$17
$08:fd10  f3 b9         sbc ($b9,s),y
$08:fd12  bc d8 ed      ldy $edd8,x
$08:fd15  90 a4         bcc $fcbb
$08:fd17  98            tya
$08:fd18  0d aa f5      ora $f5aa
$08:fd1b  3a            dec a
$08:fd1c  f9 dc ea      sbc $eadc,y
$08:fd1f  44 76 7d      mvp $7d,$76
$08:fd22  35 00         and $00,x
$08:fd24  3f 93 e9 d5   and $d5e993,x
$08:fd28  e9 75         sbc #$75
$08:fd2a  14 41         trb $41
$08:fd2c  bb            tyx
$08:fd2d  ed fc 3e      sbc $3efc
$08:fd30  af e4 fe 71   lda $71fee4
$08:fd34  39 1d cc      and $cc1d,y
$08:fd37  ea            nop
$08:fd38  9c 18 af      stz $af18
$08:fd3b  e4 3c         cpx $3c
$08:fd3d  07 27         ora [$27]
$08:fd3f  c1 9c         cmp ($9c,x)
$08:fd41  fd 36 1f      sbc $1f36,x
$08:fd44  d9 c4 d2      cmp $d2c4,y
$08:fd47  6a            ror a
$08:fd48  75 5c         adc $5c,x
$08:fd4a  8f 1b 81 7d   sta $7d811b
$08:fd4e  5e fc e7      lsr $e7fc,x
$08:fd51  33 58         and ($58,s),y
$08:fd53  5a            phy
$08:fd54  1f 5b fd 79   ora $79fd5b,x
$08:fd58  0f 60 ce 85   ora $85ce60
$08:fd5c  83 57         sta $57,s
$08:fd5e  cb            wai
$08:fd5f  f9 83 d4      sbc $d483,y
$08:fd62  0c 02 c0      tsb $c002
$08:fd65  2c 92 ac      bit $ac92
$08:fd68  bd 5e 5e      lda $5e5e,x
$08:fd6b  7e 90 72      ror $7290,x
$08:fd6e  86 b1         stx $b1
$08:fd70  00 0a         brk #$0a
$08:fd72  d0 54         bne $fdc8
$08:fd74  e0 39         cpx #$39
$08:fd76  2d 9f 41      and $419f
$08:fd79  76 7a         ror $7a,x
$08:fd7b  f6 29         inc $29,x
$08:fd7d  0e 4b 57      asl $574b
$08:fd80  c3 fd         cmp $fd,s
$08:fd82  ba            tsx
$08:fd83  c8            iny
$08:fd84  6c c4 c0      jmp ($c0c4)
$08:fd87  ed a6 cd      sbc $cda6
$08:fd8a  c8            iny
$08:fd8b  66 90         ror $90
$08:fd8d  d8            cld
$08:fd8e  67 7a         adc [$7a]
$08:fd90  19 c7 d1      ora $d1c7,y
$08:fd93  79 1a a7      adc $a71a,y
$08:fd96  d3 eb         cmp ($eb,s),y
$08:fd98  9e 83 38      stz $3883,x
$08:fd9b  7c 3f 63      jmp ($633f,x)
$08:fd9e  4c 93 01      jmp $0193
$08:fda1  c9 e5         cmp #$e5
$08:fda3  7c 7e 4e      jmp ($4e7e,x)
$08:fda6  b2 f7         lda ($f7)
$08:fda8  f1 1a         sbc ($1a),y
$08:fdaa  69 a8         adc #$a8
$08:fdac  e9 a6         sbc #$a6
$08:fdae  cf fa a5 06   cmp $06a5fa
$08:fdb2  9a            txs
$08:fdb3  6c f9 6a      jmp ($6af9)
$08:fdb6  b0 f6         bcs $fdae
$08:fdb8  fb            xce
$08:fdb9  bd 3e ee      lda $ee3e,x
$08:fdbc  7e bd 6e      ror $6ebd,x
$08:fdbf  01 f4         ora ($f4,x)
$08:fdc1  f9 f9 39      sbc $39f9,y
$08:fdc4  e3 50         sbc $50,s
$08:fdc6  2e 86 7b      rol $7b86
$08:fdc9  78            sei
$08:fdca  04 3c         tsb $3c
$08:fdcc  ef 6f f7 ec   sbc $ecf76f
$08:fdd0  ea            nop
$08:fdd1  3b            tsc
$08:fdd2  cf 3a 14 24   cmp $24143a
$08:fdd6  18            clc
$08:fdd7  70 cb         bvs $fda4
$08:fdd9  80 d2         bra $fdad
$08:fddb  4e af 58      lsr $58af
$08:fdde  4c 02 50      jmp $5002
$08:fde1  ea            nop
$08:fde2  72 cd         adc ($cd)
$08:fde4  82 d3 3f      brl $3dba
$08:fde7  af db e0 9f   lda $9fe0db
$08:fdeb  02 68         cop #$68
$08:fded  67 5a         adc [$5a]
$08:fdef  4b            phk
$08:fdf0  9e 75 89      stz $8975,x
$08:fdf3  64 0b         stz $0b
$08:fdf5  a1 a8         lda ($a8,x)
$08:fdf7  71 22         adc ($22),y
$08:fdf9  b4 bd         ldy $bd,x
$08:fdfb  ed f0 4c      sbc $4cf0
$08:fdfe  29 88         and #$88
$08:fe00  36 1b         rol $1b,x
$08:fe02  57 58         eor [$58],y
$08:fe04  7d 3a 99      adc $993a,x
$08:fe07  d2 fa         cmp ($fa)
$08:fe09  33 40         and ($40,s),y
$08:fe0b  e8            inx
$08:fe0c  19 d0 58      ora $58d0,y
$08:fe0f  7f 3b 99 d3   adc $d3993b,x
$08:fe13  7a            ply
$08:fe14  09 81         ora #$81
$08:fe16  1e 1d 00      asl $001d,x
$08:fe19  58            cli
$08:fe1a  fd d1 e0      sbc $e0d1,x
$08:fe1d  14 35         trb $35
$08:fe1f  08            php
$08:fe20  8d d3 ef      sta $efd3
$08:fe23  9c e0 23      stz $23e0
$08:fe26  c3 b4         cmp $b4,s
$08:fe28  29 35         and #$35
$08:fe2a  80 fa         bra $fe26
$08:fe2c  8b            phb
$08:fe2d  21 c4         and ($c4,x)
$08:fe2f  e4 67         cpx $67
$08:fe31  06 e8         asl $e8
$08:fe33  49 0f         eor #$0f
$08:fe35  27 13         and [$13]
$08:fe37  93 ce         sta ($ce,s),y
$08:fe39  e4 29         cpx $29
$08:fe3b  43 86         eor $86,s
$08:fe3d  47 32         eor [$32]
$08:fe3f  c0 fb         cpy #$fb
$08:fe41  39 9a dd      and $dd9a,y
$08:fe44  71 ec         adc ($ec),y
$08:fe46  35 05         and $05,x
$08:fe48  60            rts
$08:fe49  2c 8f ab      bit $ab8f
$08:fe4c  df 9c e7 a5   cmp $a5e79c,x
$08:fe50  d7 50         cmp [$50],y
$08:fe52  21 03         and ($03,x)
$08:fe54  50 88         bvc $fdde
$08:fe56  43 48         eor $48,s
$08:fe58  d3 52         cmp ($52,s),y
$08:fe5a  28            plp
$08:fe5b  6b            rtl
$08:fe5c  f4 79 d3      pea $d379
$08:fe5f  d0 6a         bne $fecb
$08:fe61  b5 85         lda $85,x
$08:fe63  d0 62         bne $fec7
$08:fe65  b6 ad         ldx $ad,y
$08:fe67  88            dey
$08:fe68  e7 2f         sbc [$2f]
$08:fe6a  3e 3e c3      rol $c33e,x
$08:fe6d  6e e5 1d      ror $1de5
$08:fe70  9b            txy
$08:fe71  d4 18         pei ($18)
$08:fe73  ab            plb
$08:fe74  b3 e8         lda ($e8,s),y
$08:fe76  75 f6         adc $f6,x
$08:fe78  2e 50 dd      rol $dd50
$08:fe7b  f4 3a 9b      pea $9b3a
$08:fe7e  7d 83 50      adc $5083,x
$08:fe81  f7 7d         sbc [$7d],y
$08:fe83  8c e6 a3      sty $a3e6
$08:fe86  7d b0 e9      adc $e9b0,x
$08:fe89  e7 1c         sbc [$1c]
$08:fe8b  40            rti
$08:fe8c  e3 07         sbc $07,s
$08:fe8e  40            rti
$08:fe8f  36 c3         rol $c3,x
$08:fe91  a7 f3         lda [$f3]
$08:fe93  fb            xce
$08:fe94  bd c3 3b      lda $3bc3,x
$08:fe97  db            stp
$08:fe98  f8            sed
$08:fe99  7d 3a bd      adc $bd3a,x
$08:fe9c  2e bb a8      rol $a8bb
$08:fe9f  bb            tyx
$08:fea0  7f b8 07 4d   adc $4d07b8,x
$08:fea4  8a            txa
$08:fea5  1f 38 07 f3   ora $f30738,x
$08:fea9  38            sec
$08:feaa  16 1f         asl $1f,x
$08:feac  bf c7 ec 09   lda $09ecc7,x
$08:feb0  1e db 68      asl $68db,x
$08:feb3  19 a1 00      ora $00a1,y
$08:feb6  fa            plx
$08:feb7  86 14         stx $14
$08:feb9  00 00         brk #$00
$08:febb  95 7a         sta $7a,x
$08:febd  fb            xce
$08:febe  fd c7 05      sbc $05c7,x
$08:fec1  ed f5 3f      sbc $3ff5
$08:fec4  df df cd 24   cmp $24cddf,x
$08:fec8  0f 37 95 e9   ora $e99537
$08:fecc  f7 78         sbc [$78],y
$08:fece  dc e9 ce      jml [$cee9]
$08:fed1  2d 16 9b      and $9b16
$08:fed4  51 c8         eor ($c8),y
$08:fed6  ce 7a c2      dec $c27a
$08:fed9  89 a9         bit #$a9
$08:fedb  d7 14         cmp [$14],y
$08:fedd  90 44         bcc $ff23
$08:fedf  5e 87 60      lsr $6087,x
$08:fee2  98            tya
$08:fee3  58            cli
$08:fee4  64 1a         stz $1a
$08:fee6  dd 57 20      cmp $2057,x
$08:fee9  24 04         bit $04
$08:feeb  e7 28         sbc [$28]
$08:feed  96 8c         stx $8c,y
$08:feef  6c 1e 3d      jmp ($3d1e)
$08:fef2  b6 c5         ldx $c5,y
$08:fef4  28            plp
$08:fef5  c8            iny
$08:fef6  a0 d5         ldy #$d5
$08:fef8  e7 79         sbc [$79]
$08:fefa  1e b6 40      asl $40b6,x
$08:fefd  29 01         and #$01
$08:feff  70 0a         bvs $ff0b
$08:ff01  73 cf         adc ($cf,s),y
$08:ff03  6c 19 01      jmp ($0119)
$08:ff06  f0 f8         beq $ff00
$08:ff08  7d fb 8c      adc $8cfb,x
$08:ff0b  80 eb         bra $fef8
$08:ff0d  ef 0c c9 c3   sbc $c3c90c
$08:ff11  77 97         adc [$97],y
$08:ff13  f1 ae         sbc ($ae),y
$08:ff15  1f 4e a6 d4   ora $d4a64e,x
$08:ff19  de 5a be      dec $be5a,x
$08:ff1c  5f a3 da ea   eor $eadaa3,x
$08:ff20  3f e7 73 3b   and $3b73e7,x
$08:ff24  9d e8 75      sta $75e8,x
$08:ff27  36 9b         rol $9b,x
$08:ff29  3c ef 27      bit $27ef,x
$08:ff2c  9c e7 4f      stz $4fe7
$08:ff2f  bf 57 a5 9c   lda $9ca557,x
$08:ff33  ee 6f 35      inc $356f
$08:ff36  65 90         adc $90
$08:ff38  d7 b9         cmp [$b9],y
$08:ff3a  d7 eb         cmp [$eb],y
$08:ff3c  f6 47         inc $47,x
$08:ff3e  82 04 0f      brl $0e45
$08:ff41  02 ff         cop #$ff
$08:ff43  8f 37 33 48   sta $483337
$08:ff47  dc bf e7      jml [$e7bf]
$08:ff4a  53 58         eor ($58,s),y
$08:ff4c  dc 8f 6f      jml [$6f8f]
$08:ff4f  b8            clv
$08:ff50  4c 1d c4      jmp $c41d
$08:ff53  29 38         and #$38
$08:ff55  53 ca         eor ($ca,s),y
$08:ff57  49 0e         eor #$0e
$08:ff59  7a            ply
$08:ff5a  f4 12 a4      pea $a412
$08:ff5d  01 3f         ora ($3f,x)
$08:ff5f  7f 3f 3b ad   adc $ad3b3f,x
$08:ff63  d7 6a         cmp [$6a],y
$08:ff65  04 e0         tsb $e0
$08:ff67  dc 40 30      jml [$3040]
$08:ff6a  73 c5         adc ($c5,s),y
$08:ff6c  46 89         lsr $89
$08:ff6e  15 30         ora $30,x
$08:ff70  08            php
$08:ff71  87 9b         sta [$9b]
$08:ff73  ce 75 96      dec $9675
$08:ff76  7b            tdc
$08:ff77  67 b7         adc [$b7]
$08:ff79  d8            cld
$08:ff7a  74 d2         stz $d2,x
$08:ff7c  61 e3         adc ($e3,x)
$08:ff7e  f2 71         sbc ($71)
$08:ff80  04 c2         tsb $c2
$08:ff82  74 2d         stz $2d,x
$08:ff84  df 4f ad db   cmp $dbad4f,x
$08:ff88  ce 67 3d      dec $3d67
$08:ff8b  7e c7 51      ror $51c7,x
$08:ff8e  9e 07 53      stz $5307,x
$08:ff91  aa            tax
$08:ff92  e4 f2         cpx $f2
$08:ff94  88            dey
$08:ff95  40            rti
$08:ff96  bd 0c eb      lda $eb0c,x
$08:ff99  ec 8c 8b      cpx $8b8c
$08:ff9c  af d4 8a 4f   lda $4f8ad4
$08:ffa0  66 a6         ror $a6
$08:ffa2  1d 93 6c      ora $6c93,x
$08:ffa5  8e 6a 59      stx $596a
$08:ffa8  0e bf 47      asl $47bf
$08:ffab  a4 b9         ldy $b9
$08:ffad  03 9b         ora $9b,s
$08:ffaf  6c 33 bd      jmp ($bd33)
$08:ffb2  b6 b8         ldx $b8,y
$08:ffb4  7d 19 20      adc $2019,x
$08:ffb7  87 01         sta [$01]
$08:ffb9  e8            inx
$08:ffba  0e 4b ad      asl $ad4b
$08:ffbd  d0 fc         bne $ffbb
$08:ffbf  bd c7 39      lda $39c7,x
$08:ffc2  d5 eb         cmp $eb,x
$08:ffc4  25 c3         and $c3
$08:ffc6  ae 3d 02      ldx $023d
$08:ffc9  58            cli
$08:ffca  67 3e         adc [$3e]
$08:ffcc  df b0 18 fd   cmp $fd18b0,x
$08:ffd0  7e 4c 91      ror $914c,x
$08:ffd3  fb            xce
$08:ffd4  74 97         stz $97,x
$08:ffd6  41 db         eor ($db,x)
$08:ffd8  f8            sed
$08:ffd9  3b            tsc
$08:ffda  e2 01         sep #$01
$08:ffdc  f1 65         sbc ($65),y
$08:ffde  0b            phd
$08:ffdf  52 60         eor ($60)
$08:ffe1  00 0e         brk #$0e
$08:ffe3  e0 45         cpx #$45
$08:ffe5  43 1f         eor $1f,s
$08:ffe7  ee ef 14      inc $14ef
$08:ffea  7a            ply
$08:ffeb  62 ff 01      per $01ed
$08:ffee  32 1f         and ($1f)
$08:fff0  fd cd 35      sbc $35cd,x
$08:fff3  8a            txa
$08:fff4  34 eb         bit $eb,x
$08:fff6  cc de 12      cpy $12de
$08:fff9  10 dc         bpl $ffd7
$08:fffb  d0 8b         bne $ff88
$08:fffd  00 ed         brk #$ed
$08:ffff  bc ff 00      ldy $00ff,x
