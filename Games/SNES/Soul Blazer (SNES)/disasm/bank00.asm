; Soul Blazer (SNES) - Bank $00
; Disassembled from ROM
; File offset: $000000-$007fff
; CPU address: $00:$8000-$00:$ffff
;===========================================================

.bank $00
.org $8000

Reset:
$00:8000  78            sei                      ; Reset vector entry point
$00:8001  d8            cld
$00:8002  18            clc
$00:8003  fb            xce
$00:8004  c2 30         rep #$30
$00:8006  a9 00 00      lda #$0000
$00:8009  5b            tcd
$00:800a  a9 ff 1f      lda #$1fff
$00:800d  1b            tcs
$00:800e  e2 20         sep #$20
$00:8010  a9 01         lda #$01
$00:8012  48            pha
$00:8013  ab            plb
$00:8014  22 ac b9 02   jsl $02b9ac  ; -> InitHardware
$00:8018  22 da ba 02   jsl $02bada  ; -> InitRAM
$00:801c  22 12 f9 04   jsl $04f912  ; -> InitSprites
$00:8020  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:8024  a2 0c 00      ldx #$000c
$00:8027  8e 18 03      stx $0318
$00:802a  22 a2 b1 02   jsl $02b1a2  ; -> WaitVBlank
$00:802e  22 81 f7 04   jsl $04f781  ; -> UpdatePalette
$00:8032  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$00:8036  22 81 f7 04   jsl $04f781  ; -> UpdatePalette
$00:803a  ad 6a 1c      lda $1c6a
$00:803d  38            sec
$00:803e  e9 10         sbc #$10
$00:8040  c9 03         cmp #$03
$00:8042  90 4b         bcc $808f
$00:8044  ad fb 03      lda $03fb
$00:8047  d0 61         bne $80aa
$00:8049  22 fc 98 02   jsl $0298fc  ; -> UpdateMap
$00:804d  22 72 f5 04   jsl $04f572  ; -> LoadGraphics
$00:8051  22 ae b1 02   jsl $02b1ae  ; -> EnableNMI
$00:8055  22 d6 89 02   jsl $0289d6  ; -> LoadMap
$00:8059  22 5e 98 02   jsl $02985e  ; -> ProcessEvents
$00:805d  22 a6 85 00   jsl $0085a6  ; -> ReadJoypad
$00:8061  22 c4 85 00   jsl $0085c4  ; -> ProcessInput
$00:8065  22 34 8a 00   jsl $008a34  ; -> UpdatePlayer
$00:8069  22 f4 8d 00   jsl $008df4  ; -> UpdateEntities
$00:806d  22 05 b0 00   jsl $00b005  ; -> UpdateCollision
$00:8071  22 69 80 02   jsl $028069  ; -> GameLoop_Update
$00:8075  22 0b 81 02   jsl $02810b  ; -> GameLoop_Render
$00:8079  22 ee 86 00   jsl $0086ee  ; -> UpdateSprites
$00:807d  22 59 a6 02   jsl $02a659  ; -> UpdateCamera
$00:8081  22 95 96 02   jsl $029695  ; -> UpdateNPCs
$00:8085  22 23 f2 04   jsl $04f223  ; -> UpdateAudio
$00:8089  22 a2 b1 02   jsl $02b1a2  ; -> WaitVBlank
$00:808d  80 a3         bra $8032
$00:808f  22 ae b1 02   jsl $02b1ae  ; -> EnableNMI
$00:8093  22 5e 98 02   jsl $02985e  ; -> ProcessEvents
$00:8097  22 a6 85 00   jsl $0085a6  ; -> ReadJoypad
$00:809b  22 c4 85 00   jsl $0085c4  ; -> ProcessInput
$00:809f  22 ee 86 00   jsl $0086ee  ; -> UpdateSprites
$00:80a3  22 a2 b1 02   jsl $02b1a2  ; -> WaitVBlank
$00:80a7  82 88 ff      brl $8032
$00:80aa  22 ae b1 02   jsl $02b1ae  ; -> EnableNMI
$00:80ae  22 a9 8e 02   jsl $028ea9
$00:80b2  22 5e 98 02   jsl $02985e  ; -> ProcessEvents
$00:80b6  9c 23 03      stz $0323
$00:80b9  22 a6 85 00   jsl $0085a6  ; -> ReadJoypad
$00:80bd  22 c4 85 00   jsl $0085c4  ; -> ProcessInput
$00:80c1  22 ee 86 00   jsl $0086ee  ; -> UpdateSprites
$00:80c5  22 59 a6 02   jsl $02a659  ; -> UpdateCamera
$00:80c9  22 95 96 02   jsl $029695  ; -> UpdateNPCs
$00:80cd  22 23 f2 04   jsl $04f223  ; -> UpdateAudio
$00:80d1  22 a2 b1 02   jsl $02b1a2  ; -> WaitVBlank
$00:80d5  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$00:80d9  22 ae b1 02   jsl $02b1ae  ; -> EnableNMI
$00:80dd  22 be 81 00   jsl $0081be
$00:80e1  ae fb 03      ldx $03fb
$00:80e4  30 f7         bmi $80dd
$00:80e6  9c fb 03      stz $03fb
$00:80e9  9c fc 03      stz $03fc
$00:80ec  ad 8a 1b      lda $1b8a
$00:80ef  4a            lsr a
$00:80f0  4a            lsr a
$00:80f1  4a            lsr a
$00:80f2  18            clc
$00:80f3  6d 3b 04      adc $043b
$00:80f6  8d 3b 04      sta $043b
$00:80f9  a9 78         lda #$78
$00:80fb  22 40 b1 02   jsl $02b140  ; -> DelayFrames
$00:80ff  a9 80         lda #$80
$00:8101  8d e3 03      sta $03e3
$00:8104  ad fd 03      lda $03fd
$00:8107  8d 19 03      sta $0319
$00:810a  ad ff 03      lda $03ff
$00:810d  8d 18 03      sta $0318
$00:8110  c2 20         rep #$20
$00:8112  ad 01 04      lda $0401
$00:8115  8d 7c 03      sta $037c
$00:8118  ad 03 04      lda $0403
$00:811b  8d 7e 03      sta $037e
$00:811e  e2 20         sep #$20
$00:8120  22 a2 b1 02   jsl $02b1a2  ; -> WaitVBlank
$00:8124  82 0b ff      brl $8032
Sub_00_8127:
$00:8127  8b            phb
$00:8128  48            pha
$00:8129  eb            xba
$00:812a  48            pha
$00:812b  da            phx
$00:812c  5a            phy
$00:812d  22 ae b1 02   jsl $02b1ae  ; -> EnableNMI
$00:8131  ee a6 03      inc $03a6
$00:8134  22 5e 98 02   jsl $02985e  ; -> ProcessEvents
$00:8138  22 a6 85 00   jsl $0085a6  ; -> ReadJoypad
$00:813c  22 c4 85 00   jsl $0085c4  ; -> ProcessInput
$00:8140  22 00 80 02   jsl $028000  ; -> GameLoop_Main
$00:8144  22 69 80 02   jsl $028069  ; -> GameLoop_Update
$00:8148  22 0b 81 02   jsl $02810b  ; -> GameLoop_Render
$00:814c  22 ee 86 00   jsl $0086ee  ; -> UpdateSprites
$00:8150  ad 62 04      lda $0462
$00:8153  d0 08         bne $815d
$00:8155  22 59 a6 02   jsl $02a659  ; -> UpdateCamera
$00:8159  22 95 96 02   jsl $029695  ; -> UpdateNPCs
$00:815d  22 23 f2 04   jsl $04f223  ; -> UpdateAudio
$00:8161  9c a6 03      stz $03a6
$00:8164  22 a2 b1 02   jsl $02b1a2  ; -> WaitVBlank
$00:8168  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$00:816c  7a            ply
$00:816d  fa            plx
$00:816e  68            pla
$00:816f  eb            xba
$00:8170  68            pla
$00:8171  ab            plb
$00:8172  6b            rtl
Sub_00_8173:
$00:8173  8b            phb
$00:8174  48            pha
$00:8175  eb            xba
$00:8176  48            pha
$00:8177  da            phx
$00:8178  5a            phy
$00:8179  a9 01         lda #$01
$00:817b  48            pha
$00:817c  ab            plb
$00:817d  ee a6 03      inc $03a6
$00:8180  22 5e 98 02   jsl $02985e  ; -> ProcessEvents
$00:8184  22 a6 85 00   jsl $0085a6  ; -> ReadJoypad
$00:8188  22 c4 85 00   jsl $0085c4  ; -> ProcessInput
$00:818c  22 69 80 02   jsl $028069  ; -> GameLoop_Update
$00:8190  22 0b 81 02   jsl $02810b  ; -> GameLoop_Render
$00:8194  22 ee 86 00   jsl $0086ee  ; -> UpdateSprites
$00:8198  22 59 a6 02   jsl $02a659  ; -> UpdateCamera
$00:819c  22 95 96 02   jsl $029695  ; -> UpdateNPCs
$00:81a0  22 23 f2 04   jsl $04f223  ; -> UpdateAudio
$00:81a4  22 ea 8e 02   jsl $028eea
$00:81a8  22 a2 b1 02   jsl $02b1a2  ; -> WaitVBlank
$00:81ac  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$00:81b0  22 ae b1 02   jsl $02b1ae  ; -> EnableNMI
$00:81b4  9c a6 03      stz $03a6
$00:81b7  7a            ply
$00:81b8  fa            plx
$00:81b9  68            pla
$00:81ba  eb            xba
$00:81bb  68            pla
$00:81bc  ab            plb
$00:81bd  6b            rtl
$00:81be  8b            phb
$00:81bf  48            pha
$00:81c0  eb            xba
$00:81c1  48            pha
$00:81c2  da            phx
$00:81c3  5a            phy
$00:81c4  a9 01         lda #$01
$00:81c6  48            pha
$00:81c7  ab            plb
$00:81c8  ee a6 03      inc $03a6
$00:81cb  22 5e 98 02   jsl $02985e  ; -> ProcessEvents
$00:81cf  22 a6 85 00   jsl $0085a6  ; -> ReadJoypad
$00:81d3  22 c4 85 00   jsl $0085c4  ; -> ProcessInput
$00:81d7  22 69 80 02   jsl $028069  ; -> GameLoop_Update
$00:81db  22 0b 81 02   jsl $02810b  ; -> GameLoop_Render
$00:81df  22 ee 86 00   jsl $0086ee  ; -> UpdateSprites
$00:81e3  22 59 a6 02   jsl $02a659  ; -> UpdateCamera
$00:81e7  22 95 96 02   jsl $029695  ; -> UpdateNPCs
$00:81eb  22 23 f2 04   jsl $04f223  ; -> UpdateAudio
$00:81ef  22 a2 b1 02   jsl $02b1a2  ; -> WaitVBlank
$00:81f3  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$00:81f7  22 ae b1 02   jsl $02b1ae  ; -> EnableNMI
$00:81fb  9c a6 03      stz $03a6
$00:81fe  7a            ply
$00:81ff  fa            plx
$00:8200  68            pla
$00:8201  eb            xba
Sub_00_8202:
$00:8202  68            pla
$00:8203  ab            plb
$00:8204  6b            rtl
$00:8205  ad 1b 42      lda $421b
$00:8208  89 20         bit #$20
$00:820a  f0 04         beq $8210
$00:820c  20 2b 82      jsr $822b
$00:820f  60            rts
$00:8210  ad 1b 42      lda $421b
$00:8213  89 80         bit #$80
$00:8215  f0 0c         beq $8223
$00:8217  a9 1e         lda #$1e
$00:8219  48            pha
$00:821a  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$00:821e  68            pla
$00:821f  3a            dec a
$00:8220  d0 f7         bne $8219
$00:8222  60            rts
$00:8223  89 40         bit #$40
$00:8225  f0 03         beq $822a
$00:8227  20 71 82      jsr $8271
$00:822a  60            rts
$00:822b  a9 00         lda #$00
$00:822d  20 40 82      jsr $8240
$00:8230  a9 03         lda #$03
$00:8232  20 40 82      jsr $8240
$00:8235  a9 04         lda #$04
$00:8237  20 40 82      jsr $8240
$00:823a  a9 1f         lda #$1f
$00:823c  20 40 82      jsr $8240
$00:823f  60            rts
$00:8240  8b            phb
$00:8241  48            pha
$00:8242  ab            plb
$00:8243  a2 00 80      ldx #$8000
$00:8246  bd 00 00      lda $0000,x
$00:8249  c9 02         cmp #$02
$00:824b  d0 1f         bne $826c
$00:824d  bd 01 00      lda $0001,x
$00:8250  c9 01         cmp #$01
$00:8252  d0 18         bne $826c
$00:8254  bd 02 00      lda $0002,x
$00:8257  c9 aa         cmp #$aa
$00:8259  d0 11         bne $826c
$00:825b  bc 03 00      ldy $0003,x
$00:825e  10 0c         bpl $826c
$00:8260  da            phx
$00:8261  a2 0a 04      ldx #$040a
$00:8264  8e f3 03      stx $03f3
$00:8267  22 27 ac 02   jsl $02ac27
$00:826b  fa            plx
$00:826c  e8            inx
$00:826d  d0 d7         bne $8246
$00:826f  ab            plb
$00:8270  60            rts
$00:8271  ad 14 03      lda $0314
$00:8274  20 fc 82      jsr $82fc  ; -> Sub_00_82fc
$00:8277  8d 06 1f      sta $1f06
$00:827a  ad 14 03      lda $0314
$00:827d  20 00 83      jsr $8300  ; -> Sub_00_8300
$00:8280  8d 07 1f      sta $1f07
$00:8283  ad 16 03      lda $0316
$00:8286  20 fc 82      jsr $82fc  ; -> Sub_00_82fc
$00:8289  8d 09 1f      sta $1f09
$00:828c  ad 16 03      lda $0316
$00:828f  20 00 83      jsr $8300  ; -> Sub_00_8300
$00:8292  8d 0a 1f      sta $1f0a
$00:8295  ad 6a 1c      lda $1c6a
$00:8298  20 fc 82      jsr $82fc  ; -> Sub_00_82fc
$00:829b  8d 0c 1f      sta $1f0c
$00:829e  ad 6a 1c      lda $1c6a
$00:82a1  20 00 83      jsr $8300  ; -> Sub_00_8300
$00:82a4  8d 0d 1f      sta $1f0d
$00:82a7  ad 78 03      lda $0378
$00:82aa  20 fc 82      jsr $82fc  ; -> Sub_00_82fc
$00:82ad  8d 0f 1f      sta $1f0f
$00:82b0  ad 78 03      lda $0378
$00:82b3  20 00 83      jsr $8300  ; -> Sub_00_8300
$00:82b6  8d 10 1f      sta $1f10
$00:82b9  ad 74 03      lda $0374
$00:82bc  20 00 83      jsr $8300  ; -> Sub_00_8300
$00:82bf  8d 12 1f      sta $1f12
$00:82c2  ad 7a 03      lda $037a
$00:82c5  20 fc 82      jsr $82fc  ; -> Sub_00_82fc
$00:82c8  8d 14 1f      sta $1f14
$00:82cb  ad 7a 03      lda $037a
$00:82ce  20 00 83      jsr $8300  ; -> Sub_00_8300
$00:82d1  8d 15 1f      sta $1f15
$00:82d4  ad 76 03      lda $0376
$00:82d7  20 00 83      jsr $8300  ; -> Sub_00_8300
$00:82da  8d 17 1f      sta $1f17
$00:82dd  ad 00 1f      lda $1f00
$00:82e0  20 fc 82      jsr $82fc  ; -> Sub_00_82fc
$00:82e3  8d 19 1f      sta $1f19
$00:82e6  ad 00 1f      lda $1f00
$00:82e9  20 00 83      jsr $8300  ; -> Sub_00_8300
$00:82ec  8d 1a 1f      sta $1f1a
$00:82ef  a0 02 1f      ldy #$1f02
$00:82f2  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:82f6  a9 01         lda #$01
$00:82f8  8d b8 03      sta $03b8
$00:82fb  60            rts
Sub_00_82fc:
$00:82fc  4a            lsr a
$00:82fd  4a            lsr a
$00:82fe  4a            lsr a
$00:82ff  4a            lsr a
Sub_00_8300:
$00:8300  c2 20         rep #$20
$00:8302  29 0f 00      and #$000f
$00:8305  aa            tax
$00:8306  bf 0d 83 00   lda $00830d,x
$00:830a  e2 20         sep #$20
$00:830c  60            rts
$00:830d  30 31         bmi $8340
$00:830f  32 33         and ($33)
$00:8311  34 35         bit $35,x
$00:8313  36 37         rol $37,x
$00:8315  38            sec
$00:8316  39 41 42      and $4241,y
$00:8319  43 44         eor $44,s
$00:831b  45 46         eor $46
$00:831d  ad 84 04      lda $0484
$00:8320  d0 01         bne $8323
$00:8322  60            rts
$00:8323  29 f0         and #$f0
$00:8325  4a            lsr a
$00:8326  4a            lsr a
$00:8327  4a            lsr a
$00:8328  4a            lsr a
$00:8329  eb            xba
$00:832a  a9 0a         lda #$0a
$00:832c  22 d1 b1 02   jsl $02b1d1  ; -> Sub_02_b1d1
$00:8330  48            pha
$00:8331  ad 84 04      lda $0484
$00:8334  29 0f         and #$0f
$00:8336  18            clc
$00:8337  63 01         adc $01,s
$00:8339  22 f9 a0 02   jsl $02a0f9
$00:833d  68            pla
$00:833e  9c 84 04      stz $0484
$00:8341  60            rts
NMI_Handler:
$00:8342  08            php                      ; Non-Maskable Interrupt handler
$00:8343  8b            phb
$00:8344  c2 30         rep #$30
$00:8346  48            pha
$00:8347  da            phx
$00:8348  5a            phy
$00:8349  e2 20         sep #$20
$00:834b  c2 10         rep #$10
$00:834d  d8            cld
$00:834e  a9 01         lda #$01
$00:8350  48            pha
$00:8351  ab            plb
$00:8352  9c 0c 42      stz $420c
$00:8355  20 c5 83      jsr $83c5
$00:8358  20 ea 83      jsr $83ea
$00:835b  20 21 84      jsr $8421
$00:835e  20 6e 84      jsr $846e
$00:8361  20 c8 84      jsr $84c8
$00:8364  20 e5 84      jsr $84e5
$00:8367  20 43 85      jsr $8543
$00:836a  20 8b 85      jsr $858b
$00:836d  22 7f eb 00   jsl $00eb7f
$00:8371  ad 12 42      lda $4212
$00:8374  6a            ror a
$00:8375  b0 fa         bcs $8371
$00:8377  a5 42         lda $42
$00:8379  8d 0c 42      sta $420c
$00:837c  c2 30         rep #$30
$00:837e  ee 12 03      inc $0312
$00:8381  ad 68 04      lda $0468
$00:8384  d0 24         bne $83aa
$00:8386  ad 18 42      lda $4218
$00:8389  eb            xba
$00:838a  4a            lsr a
$00:838b  29 00 20      and #$2000
$00:838e  0d 18 42      ora $4218
$00:8391  48            pha
$00:8392  ad 26 03      lda $0326
$00:8395  49 ff ff      eor #$ffff
$00:8398  23 01         and $01,s
$00:839a  8d 22 03      sta $0322
$00:839d  68            pla
$00:839e  49 ff ff      eor #$ffff
$00:83a1  0d 2a 03      ora $032a
$00:83a4  8d 2a 03      sta $032a
$00:83a7  2d 22 03      and $0322
$00:83aa  8d 22 03      sta $0322
$00:83ad  ad 12 03      lda $0312
$00:83b0  4a            lsr a
$00:83b1  a9 00 00      lda #$0000
$00:83b4  b0 06         bcs $83bc
$00:83b6  ad 98 03      lda $0398
$00:83b9  9c 98 03      stz $0398
$00:83bc  8d 42 21      sta $2142
$00:83bf  7a            ply
$00:83c0  fa            plx
$00:83c1  68            pla
$00:83c2  ab            plb
$00:83c3  28            plp
$00:83c4  40            rti
$00:83c5  a2 00 00      ldx #$0000
$00:83c8  8e 02 21      stx $2102
$00:83cb  9c 00 43      stz $4300
$00:83ce  a9 04 8d      lda #$8d04
$00:83d1  01 43         ora ($43,x)
$00:83d3  a2 86 04      ldx #$0486
$00:83d6  8e 02 43      stx $4302
$00:83d9  a9 00 8d      lda #$8d00
$00:83dc  04 43         tsb $43
$00:83de  a2 20 02      ldx #$0220
$00:83e1  8e 05 43      stx $4305
$00:83e4  a9 01 8d      lda #$8d01
$00:83e7  0b            phd
$00:83e8  42 60         wdm #$60
$00:83ea  9c 21 21      stz $2121
$00:83ed  9c 10 43      stz $4310
$00:83f0  a9 22 8d      lda #$8d22
$00:83f3  11 43         ora ($43),y
$00:83f5  a2 00 00      ldx #$0000
$00:83f8  8e 12 43      stx $4312
$00:83fb  a9 7f 8d      lda #$8d7f
$00:83fe  14 43         trb $43
$00:8400  a2 00 02      ldx #$0200
$00:8403  8e 15 43      stx $4315
$00:8406  a9 02 8d      lda #$8d02
$00:8409  0b            phd
$00:840a  42 af         wdm #$af
$00:840c  00 02         brk #$02
$00:840e  7f 8d 32 21   adc $21328d,x
$00:8412  af 01 02 7f   lda $7f0201
$00:8416  8d 32 21      sta $2132
$00:8419  af 02 02 7f   lda $7f0202
$00:841d  8d 32 21      sta $2132
$00:8420  60            rts
$00:8421  ad 7c 1c      lda $1c7c
$00:8424  f0 01         beq $8427
$00:8426  60            rts
$00:8427  ad b8 03      lda $03b8
$00:842a  d0 01         bne $842d
$00:842c  60            rts
$00:842d  89 02 d0      bit #$d002
$00:8430  11 a2         ora ($a2),y
$00:8432  00 58         brk #$58
$00:8434  8e 16 21      stx $2116
$00:8437  a2 00 70      ldx #$7000
$00:843a  8e 22 43      stx $4322
$00:843d  9c b8 03      stz $03b8
$00:8440  80 11         bra $8453
$00:8442  a2 00 5c      ldx #$5c00
$00:8445  8e 16 21      stx $2116
$00:8448  a2 00 78      ldx #$7800
$00:844b  8e 22 43      stx $4322
$00:844e  a9 02 1c      lda #$1c02
$00:8451  b8            clv
$00:8452  03 a9         ora $a9,s
$00:8454  01 8d         ora ($8d,x)
$00:8456  20 43 a9      jsr $a943
$00:8459  18            clc
$00:845a  8d 21 43      sta $4321
$00:845d  a9 7f 8d      lda #$8d7f
$00:8460  24 43         bit $43
$00:8462  a2 00 08      ldx #$0800
$00:8465  8e 25 43      stx $4325
$00:8468  a9 04 8d      lda #$8d04
$00:846b  0b            phd
$00:846c  42 60         wdm #$60
$00:846e  ad 86 03      lda $0386
$00:8471  8d 11 21      sta $2111
$00:8474  9c 11 21      stz $2111
$00:8477  ad 88 03      lda $0388
$00:847a  8d 12 21      sta $2112
$00:847d  9c 12 21      stz $2112
$00:8480  ad db 03      lda $03db
$00:8483  d0 13         bne $8498
$00:8485  a2 00 00      ldx #$0000
$00:8488  a0 00 00      ldy #$0000
$00:848b  20 ab 84      jsr $84ab
$00:848e  a2 04 00      ldx #$0004
$00:8491  a0 02 00      ldy #$0002
$00:8494  20 ab 84      jsr $84ab
$00:8497  60            rts
$00:8498  a2 04 00      ldx #$0004
$00:849b  a0 00 00      ldy #$0000
$00:849e  20 ab 84      jsr $84ab
$00:84a1  a2 00 00      ldx #$0000
$00:84a4  a0 02 00      ldy #$0002
$00:84a7  20 ab 84      jsr $84ab
$00:84aa  60            rts
$00:84ab  bd 3a 03      lda $033a,x
$00:84ae  99 0d 21      sta $210d,y
$00:84b1  bd 3b 03      lda $033b,x
$00:84b4  29 03 99      and #$9903
$00:84b7  0d 21 bd      ora $bd21
$00:84ba  3c 03 99      bit $9903,x
$00:84bd  0e 21 bd      asl $bd21
$00:84c0  3d 03 29      and $2903,x
$00:84c3  03 99         ora $99,s
$00:84c5  0e 21 60      asl $6021
$00:84c8  a2 00 30      ldx #$3000
$00:84cb  86 32         stx $32
$00:84cd  a2 02 31      ldx #$3102
$00:84d0  86 35         stx $35
$00:84d2  22 7d 85 02   jsl $02857d
$00:84d6  a2 04 32      ldx #$3204
$00:84d9  86 32         stx $32
$00:84db  a2 06 33      ldx #$3306
$00:84de  86 35         stx $35
$00:84e0  22 7d 85 02   jsl $02857d
$00:84e4  60            rts
$00:84e5  ad b6 03      lda $03b6
$00:84e8  d0 01         bne $84eb
$00:84ea  60            rts
$00:84eb  a9 18 8d      lda #$8d18
$00:84ee  21 43         and ($43,x)
$00:84f0  a9 01 8d      lda #$8d01
$00:84f3  20 43 a0      jsr $a043
$00:84f6  00 00         brk #$00
$00:84f8  a2 00 20      ldx #$2000
$00:84fb  8e 16 21      stx $2116
$00:84fe  20 24 85      jsr $8524
$00:8501  a2 00 00      ldx #$0000
$00:8504  bc 06 1a      ldy $1a06,x
$00:8507  f0 0b         beq $8514
$00:8509  fe 07 1a      inc $1a07,x
$00:850c  fe 07 1a      inc $1a07,x
$00:850f  e8            inx
$00:8510  e8            inx
$00:8511  e8            inx
$00:8512  80 f0         bra $8504
$00:8514  a0 00 00      ldy #$0000
$00:8517  a2 00 21      ldx #$2100
$00:851a  8e 16 21      stx $2116
$00:851d  20 24 85      jsr $8524
$00:8520  9c b6 03      stz $03b6
$00:8523  60            rts
$00:8524  be 06 1a      ldx $1a06,y
$00:8527  f0 19         beq $8542
$00:8529  8e 22 43      stx $4322
$00:852c  b9 08 1a      lda $1a08,y
$00:852f  8d 24 43      sta $4324
$00:8532  a2 40 00      ldx #$0040
$00:8535  8e 25 43      stx $4325
$00:8538  a9 04 8d      lda #$8d04
$00:853b  0b            phd
$00:853c  42 c8         wdm #$c8
$00:853e  c8            iny
$00:853f  c8            iny
$00:8540  80 e2         bra $8524
$00:8542  60            rts
$00:8543  ad e1 03      lda $03e1
$00:8546  d0 01         bne $8549
$00:8548  60            rts
$00:8549  a9 01 8d      lda #$8d01
$00:854c  20 43 a9      jsr $a943
$00:854f  18            clc
$00:8550  8d 21 43      sta $4321
$00:8553  ae dd 03      ldx $03dd
$00:8556  8e 22 43      stx $4322
$00:8559  a9 7f 8d      lda #$8d7f
$00:855c  24 43         bit $43
$00:855e  a2 40 00      ldx #$0040
$00:8561  8e 25 43      stx $4325
$00:8564  ae df 03      ldx $03df
$00:8567  8e 16 21      stx $2116
$00:856a  a9 04 8d      lda #$8d04
$00:856d  0b            phd
$00:856e  42 a2         wdm #$a2
$00:8570  40            rti
$00:8571  00 8e         brk #$8e
$00:8573  25 43         and $43
$00:8575  ad df 03      lda $03df
$00:8578  8d 16 21      sta $2116
$00:857b  ad e0 03      lda $03e0
$00:857e  1a            inc a
$00:857f  8d 17 21      sta $2117
$00:8582  a9 04 8d      lda #$8d04
$00:8585  0b            phd
$00:8586  42 9c         wdm #$9c
$00:8588  e1 03         sbc ($03,x)
$00:858a  60            rts
$00:858b  c2 20         rep #$20
$00:858d  ba            tsx
$00:858e  a9 7a 1c      lda #$1c7a
$00:8591  1b            tcs
$00:8592  68            pla
$00:8593  f0 09         beq $859e
$00:8595  8d 16 21      sta $2116
$00:8598  68            pla
$00:8599  8d 18 21      sta $2118
$00:859c  80 f4         bra $8592
$00:859e  9a            txs
$00:859f  9c 7b 1c      stz $1c7b
$00:85a2  e2 20         sep #$20
$00:85a4  60            rts
IRQ_Handler:
$00:85a5  40            rti                      ; Interrupt Request handler
ReadJoypad:
$00:85a6  08            php
$00:85a7  8b            phb
$00:85a8  d4 38         pei ($38)
$00:85aa  d4 39         pei ($39)
$00:85ac  c2 20         rep #$20
$00:85ae  9c 00 1f      stz $1f00
$00:85b1  ad a6 06      lda $06a6
$00:85b4  f4 ba 85      pea $85ba
$00:85b7  f4 be 89      pea $89be
$00:85ba  60            rts
$00:85bb  fa            plx
$00:85bc  86 39         stx $39
$00:85be  fa            plx
$00:85bf  86 38         stx $38
$00:85c1  ab            plb
$00:85c2  28            plp
$00:85c3  6b            rtl
ProcessInput:
$00:85c4  08            php
$00:85c5  c2 20         rep #$20
$00:85c7  ad a8 06      lda $06a8
$00:85ca  a0 00 00      ldy #$0000
$00:85cd  aa            tax
$00:85ce  d0 03         bne $85d3
$00:85d0  82 a7 00      brl $867a
$00:85d3  bd 00 00      lda $0000,x
$00:85d6  38            sec
$00:85d7  fd 08 00      sbc $0008,x
$00:85da  38            sec
$00:85db  ed 3a 03      sbc $033a
$00:85de  c9 00 01      cmp #$0100
$00:85e1  90 15         bcc $85f8
$00:85e3  30 03         bmi $85e8
$00:85e5  82 83 00      brl $866b
$00:85e8  bd 00 00      lda $0000,x
$00:85eb  18            clc
$00:85ec  7d 0c 00      adc $000c,x
$00:85ef  38            sec
$00:85f0  ed 3a 03      sbc $033a
$00:85f3  c9 00 01      cmp #$0100
$00:85f6  b0 73         bcs $866b
$00:85f8  bd 02 00      lda $0002,x
$00:85fb  38            sec
$00:85fc  fd 0a 00      sbc $000a,x
$00:85ff  38            sec
$00:8600  ed 3c 03      sbc $033c
$00:8603  c9 e0 00      cmp #$00e0
$00:8606  90 12         bcc $861a
$00:8608  10 61         bpl $866b
$00:860a  bd 02 00      lda $0002,x
$00:860d  18            clc
$00:860e  7d 0e 00      adc $000e,x
$00:8611  38            sec
$00:8612  ed 3c 03      sbc $033c
$00:8615  c9 e0 00      cmp #$00e0
$00:8618  b0 51         bcs $866b
$00:861a  bd 16 00      lda $0016,x
$00:861d  89 00 20      bit #$2000
$00:8620  d0 3a         bne $865c
$00:8622  bd 1a 00      lda $001a,x
$00:8625  89 80 00      bit #$0080
$00:8628  d0 32         bne $865c
$00:862a  89 00 60      bit #$6000
$00:862d  f0 0a         beq $8639
$00:862f  89 00 40      bit #$4000
$00:8632  d0 11         bne $8645
$00:8634  a9 fe 01      lda #$01fe
$00:8637  80 13         bra $864c
$00:8639  bd 02 00      lda $0002,x
$00:863c  38            sec
$00:863d  ed 3c 03      sbc $033c
Sub_00_8640:
$00:8640  c9 00 01      cmp #$0100
$00:8643  90 03         bcc $8648
$00:8645  a9 ff 00      lda #$00ff
$00:8648  49 ff 00      eor #$00ff
$00:864b  0a            asl a
$00:864c  c9 00 02      cmp #$0200
$00:864f  b0 fb         bcs $864c
$00:8651  99 00 19      sta $1900,y
$00:8654  8a            txa
$00:8655  99 02 19      sta $1902,y
$00:8658  c8            iny
$00:8659  c8            iny
$00:865a  c8            iny
$00:865b  c8            iny
$00:865c  bd 16 00      lda $0016,x
$00:865f  29 ff 7f      and #$7fff
$00:8662  9d 16 00      sta $0016,x
$00:8665  bd 3c 00      lda $003c,x
$00:8668  82 62 ff      brl $85cd
$00:866b  bd 16 00      lda $0016,x
$00:866e  09 00 80      ora #$8000
$00:8671  9d 16 00      sta $0016,x
$00:8674  bd 3c 00      lda $003c,x
$00:8677  82 53 ff      brl $85cd
$00:867a  a9 ff ff      lda #$ffff
$00:867d  99 00 19      sta $1900,y
$00:8680  a9 86 04      lda #$0486
$00:8683  85 02         sta $02
$00:8685  3b            tsc
$00:8686  85 00         sta $00
$00:8688  a9 ff 18      lda #$18ff
$00:868b  1b            tcs
$00:868c  fa            plx
$00:868d  30 37         bmi $86c6
$00:868f  bc 00 01      ldy $0100,x
$00:8692  d0 1a         bne $86ae
$00:8694  a5 02         lda $02
$00:8696  9d 00 01      sta $0100,x
$00:8699  a8            tay
$00:869a  68            pla
$00:869b  99 00 00      sta $0000,y
$00:869e  a9 00 00      lda #$0000
$00:86a1  99 02 00      sta $0002,y
$00:86a4  a5 02         lda $02
$00:86a6  18            clc
$00:86a7  69 04 00      adc #$0004
$00:86aa  85 02         sta $02
$00:86ac  80 de         bra $868c
$00:86ae  a5 02         lda $02
$00:86b0  9d 00 01      sta $0100,x
$00:86b3  aa            tax
$00:86b4  68            pla
$00:86b5  9d 00 00      sta $0000,x
$00:86b8  98            tya
$00:86b9  9d 02 00      sta $0002,x
$00:86bc  a5 02         lda $02
$00:86be  18            clc
$00:86bf  69 04 00      adc #$0004
$00:86c2  85 02         sta $02
$00:86c4  80 c6         bra $868c
$00:86c6  a9 ff 00      lda #$00ff
$00:86c9  1b            tcs
$00:86ca  a2 00 00      ldx #$0000
$00:86cd  80 02         bra $86d1
$00:86cf  48            pha
$00:86d0  68            pla
$00:86d1  7a            ply
$00:86d2  f0 fd         beq $86d1
$00:86d4  30 10         bmi $86e6
$00:86d6  b9 00 00      lda $0000,y
$00:86d9  9d 00 19      sta $1900,x
$00:86dc  e8            inx
$00:86dd  e8            inx
$00:86de  b9 02 00      lda $0002,y
$00:86e1  f0 ec         beq $86cf
$00:86e3  a8            tay
$00:86e4  80 f0         bra $86d6
$00:86e6  9e 00 19      stz $1900,x
$00:86e9  a5 00         lda $00
$00:86eb  1b            tcs
$00:86ec  28            plp
$00:86ed  6b            rtl
UpdateSprites:
$00:86ee  8b            phb
$00:86ef  08            php
$00:86f0  e2 20         sep #$20
$00:86f2  c2 30         rep #$30
$00:86f4  a9 06 1a      lda #$1a06
$00:86f7  85 04         sta $04
$00:86f9  9c 06 1a      stz $1a06
$00:86fc  64 02         stz $02
$00:86fe  ad 3a 03      lda $033a
$00:8701  38            sec
$00:8702  e9 10 00      sbc #$0010
$00:8705  85 52         sta $52
$00:8707  ad 3c 03      lda $033c
$00:870a  38            sec
$00:870b  e9 10 00      sbc #$0010
$00:870e  85 54         sta $54
$00:8710  a9 86 06      lda #$0686
$00:8713  85 4c         sta $4c
$00:8715  a9 04 00      lda #$0004
$00:8718  85 4e         sta $4e
$00:871a  3b            tsc
$00:871b  85 00         sta $00
$00:871d  a9 85 06      lda #$0685
$00:8720  1b            tcs
$00:8721  a2 10 00      ldx #$0010
$00:8724  a9 80 e0      lda #$e080
$00:8727  48            pha
$00:8728  48            pha
$00:8729  48            pha
$00:872a  48            pha
$00:872b  48            pha
$00:872c  48            pha
$00:872d  48            pha
$00:872e  48            pha
$00:872f  48            pha
$00:8730  48            pha
$00:8731  48            pha
$00:8732  48            pha
$00:8733  48            pha
$00:8734  48            pha
$00:8735  48            pha
$00:8736  48            pha
$00:8737  ca            dex
$00:8738  d0 ed         bne $8727
$00:873a  a5 00         lda $00
$00:873c  1b            tcs
$00:873d  a2 00 00      ldx #$0000
$00:8740  9b            txy
$00:8741  bd 00 19      lda $1900,x
$00:8744  f0 0c         beq $8752
$00:8746  e8            inx
$00:8747  e8            inx
$00:8748  da            phx
$00:8749  aa            tax
$00:874a  20 61 87      jsr $8761
$00:874d  fa            plx
$00:874e  b0 0e         bcs $875e
$00:8750  80 ef         bra $8741
$00:8752  e2 20         sep #$20
$00:8754  a5 00         lda $00
$00:8756  4a            lsr a
$00:8757  4a            lsr a
$00:8758  c6 4e         dec $4e
$00:875a  d0 fa         bne $8756
$00:875c  92 4c         sta ($4c)
$00:875e  28            plp
$00:875f  ab            plb
$00:8760  6b            rtl
$00:8761  8b            phb
$00:8762  da            phx
$00:8763  e2 20         sep #$20
$00:8765  bd 24 00      lda $0024,x
$00:8768  48            pha
$00:8769  ab            plb
$00:876a  c2 20         rep #$20
$00:876c  bd 00 00      lda $0000,x
$00:876f  38            sec
$00:8770  fd 08 00      sbc $0008,x
$00:8773  38            sec
$00:8774  e5 52         sbc $52
$00:8776  85 16         sta $16
$00:8778  bd 02 00      lda $0002,x
$00:877b  38            sec
$00:877c  fd 0a 00      sbc $000a,x
$00:877f  38            sec
$00:8780  e5 54         sbc $54
$00:8782  85 18         sta $18
$00:8784  bd 1c 00      lda $001c,x
$00:8787  85 50         sta $50
$00:8789  64 06         stz $06
$00:878b  bd 16 00      lda $0016,x
$00:878e  89 00 08      bit #$0800
$00:8791  f0 13         beq $87a6
$00:8793  bd 26 00      lda $0026,x
$00:8796  30 06         bmi $879e
$00:8798  4a            lsr a
$00:8799  b0 0b         bcs $87a6
$00:879b  82 89 00      brl $8827
$00:879e  4a            lsr a
$00:879f  b0 05         bcs $87a6
$00:87a1  a9 00 0e      lda #$0e00
$00:87a4  85 06         sta $06
$00:87a6  bd 1a 00      lda $001a,x
$00:87a9  10 03         bpl $87ae
$00:87ab  82 84 00      brl $8832
$00:87ae  bd 28 00      lda $0028,x
$00:87b1  aa            tax
$00:87b2  bd 00 00      lda $0000,x
$00:87b5  e8            inx
$00:87b6  e8            inx
$00:87b7  85 0c         sta $0c
$00:87b9  a5 50         lda $50
$00:87bb  0a            asl a
$00:87bc  bd 03 00      lda $0003,x
$00:87bf  90 01         bcc $87c2
$00:87c1  eb            xba
$00:87c2  29 ff 00      and #$00ff
$00:87c5  18            clc
$00:87c6  65 18         adc $18
$00:87c8  c9 f0 00      cmp #$00f0
$00:87cb  b0 5d         bcs $882a
$00:87cd  e9 10 00      sbc #$0010
$00:87d0  99 87 04      sta $0487,y
$00:87d3  bd 05 00      lda $0005,x
$00:87d6  45 50         eor $50
$00:87d8  05 06         ora $06
$00:87da  99 88 04      sta $0488,y
$00:87dd  a5 50         lda $50
$00:87df  0a            asl a
$00:87e0  0a            asl a
$00:87e1  bd 01 00      lda $0001,x
$00:87e4  90 01         bcc $87e7
$00:87e6  eb            xba
$00:87e7  29 ff 00      and #$00ff
$00:87ea  18            clc
$00:87eb  65 16         adc $16
$00:87ed  c9 10 01      cmp #$0110
$00:87f0  b0 38         bcs $882a
$00:87f2  e9 0f 00      sbc #$000f
$00:87f5  e2 20         sep #$20
$00:87f7  99 86 04      sta $0486,y
$00:87fa  eb            xba
$00:87fb  4a            lsr a
$00:87fc  66 00         ror $00
$00:87fe  bd 00 00      lda $0000,x
$00:8801  4a            lsr a
$00:8802  66 00         ror $00
$00:8804  c6 4e         dec $4e
$00:8806  d0 0a         bne $8812
$00:8808  a5 00         lda $00
$00:880a  92 4c         sta ($4c)
$00:880c  e6 4c         inc $4c
$00:880e  a9 04         lda #$04
Sub_00_8810:
$00:8810  85 4e         sta $4e
Sub_00_8812:
$00:8812  c2 20         rep #$20
$00:8814  c8            iny
$00:8815  c8            iny
$00:8816  c8            iny
$00:8817  c8            iny
$00:8818  c0 00 02      cpy #$0200
$00:881b  f0 0a         beq $8827
$00:881d  8a            txa
$00:881e  18            clc
Sub_00_881f:
$00:881f  69 07 00      adc #$0007
$00:8822  aa            tax
$00:8823  c6 0c         dec $0c
$00:8825  d0 92         bne $87b9
$00:8827  fa            plx
$00:8828  ab            plb
$00:8829  60            rts
$00:882a  a9 80 e0      lda #$e080
$00:882d  99 86 04      sta $0486,y
$00:8830  80 eb         bra $881d
$00:8832  bd 34 00      lda $0034,x
$00:8835  8d 02 1a      sta $1a02
$00:8838  bd 2c 00      lda $002c,x
$00:883b  8d 04 1a      sta $1a04
$00:883e  bd 28 00      lda $0028,x
$00:8841  aa            tax
$00:8842  bd 00 00      lda $0000,x
$00:8845  e8            inx
$00:8846  e8            inx
$00:8847  85 0c         sta $0c
$00:8849  ee b6 03      inc $03b6
$00:884c  a5 50         lda $50
$00:884e  0a            asl a
$00:884f  bd 03 00      lda $0003,x
$00:8852  90 01         bcc $8855
$00:8854  eb            xba
$00:8855  29 ff 00      and #$00ff
$00:8858  18            clc
$00:8859  65 18         adc $18
$00:885b  c9 f0 00      cmp #$00f0
$00:885e  90 03         bcc $8863
$00:8860  82 88 00      brl $88eb
$00:8863  e9 10 00      sbc #$0010
$00:8866  99 87 04      sta $0487,y
$00:8869  bd 05 00      lda $0005,x
$00:886c  45 50         eor $50
$00:886e  05 06         ora $06
$00:8870  48            pha
$00:8871  29 ff 01      and #$01ff
$00:8874  0a            asl a
$00:8875  0a            asl a
$00:8876  0a            asl a
$00:8877  0a            asl a
$00:8878  0a            asl a
$00:8879  6d 02 1a      adc $1a02
$00:887c  92 04         sta ($04)
$00:887e  e6 04         inc $04
$00:8880  e6 04         inc $04
$00:8882  ad 04 1a      lda $1a04
$00:8885  92 04         sta ($04)
$00:8887  e6 04         inc $04
$00:8889  68            pla
$00:888a  29 00 fe      and #$fe00
$00:888d  05 02         ora $02
$00:888f  e6 02         inc $02
$00:8891  e6 02         inc $02
$00:8893  99 88 04      sta $0488,y
$00:8896  a5 50         lda $50
$00:8898  0a            asl a
$00:8899  0a            asl a
$00:889a  bd 01 00      lda $0001,x
$00:889d  90 01         bcc $88a0
$00:889f  eb            xba
$00:88a0  29 ff 00      and #$00ff
$00:88a3  18            clc
$00:88a4  65 16         adc $16
$00:88a6  c9 10 01      cmp #$0110
$00:88a9  b0 40         bcs $88eb
$00:88ab  e9 0f 00      sbc #$000f
$00:88ae  e2 20         sep #$20
$00:88b0  99 86 04      sta $0486,y
$00:88b3  eb            xba
$00:88b4  4a            lsr a
$00:88b5  66 00         ror $00
$00:88b7  bd 00 00      lda $0000,x
$00:88ba  4a            lsr a
$00:88bb  66 00         ror $00
$00:88bd  c6 4e         dec $4e
$00:88bf  d0 0a         bne $88cb
$00:88c1  a5 00         lda $00
$00:88c3  92 4c         sta ($4c)
$00:88c5  e6 4c         inc $4c
$00:88c7  a9 04         lda #$04
$00:88c9  85 4e         sta $4e
$00:88cb  c2 20         rep #$20
$00:88cd  c8            iny
$00:88ce  c8            iny
$00:88cf  c8            iny
$00:88d0  c8            iny
$00:88d1  c0 00 02      cpy #$0200
$00:88d4  f0 0d         beq $88e3
$00:88d6  8a            txa
$00:88d7  18            clc
$00:88d8  69 07 00      adc #$0007
$00:88db  aa            tax
$00:88dc  c6 0c         dec $0c
$00:88de  f0 03         beq $88e3
$00:88e0  82 69 ff      brl $884c
$00:88e3  a9 00 00      lda #$0000
$00:88e6  92 04         sta ($04)
$00:88e8  fa            plx
$00:88e9  ab            plb
$00:88ea  60            rts
$00:88eb  a9 80 e0      lda #$e080
$00:88ee  99 86 04      sta $0486,y
$00:88f1  80 e3         bra $88d6
Sub_00_88f3:
$00:88f3  8b            phb
$00:88f4  e2 20         sep #$20
$00:88f6  bd 24 00      lda $0024,x
$00:88f9  48            pha
$00:88fa  ab            plb
$00:88fb  c2 20         rep #$20
$00:88fd  bd 1e 00      lda $001e,x
$00:8900  0a            asl a
$00:8901  18            clc
$00:8902  7d 22 00      adc $0022,x
$00:8905  a8            tay
$00:8906  bd 20 00      lda $0020,x
$00:8909  0a            asl a
$00:890a  0a            asl a
$00:890b  0a            asl a
$00:890c  18            clc
$00:890d  79 00 00      adc $0000,y
$00:8910  a8            tay
Sub_00_8911:
$00:8911  b9 00 00      lda $0000,y
$00:8914  10 03         bpl $8919
$00:8916  82 97 00      brl $89b0
$00:8919  9d 14 00      sta $0014,x
$00:891c  bd 1c 00      lda $001c,x
$00:891f  2a            rol a
$00:8920  10 09         bpl $892b
$00:8922  a9 00 00      lda #$0000
$00:8925  38            sec
$00:8926  f9 02 00      sbc $0002,y
$00:8929  80 03         bra $892e
$00:892b  b9 02 00      lda $0002,y
$00:892e  9d 04 00      sta $0004,x
$00:8931  bd 1c 00      lda $001c,x
$00:8934  10 09         bpl $893f
$00:8936  a9 00 00      lda #$0000
$00:8939  38            sec
$00:893a  f9 04 00      sbc $0004,y
$00:893d  80 03         bra $8942
$00:893f  b9 04 00      lda $0004,y
$00:8942  9d 06 00      sta $0006,x
$00:8945  b9 06 00      lda $0006,y
$00:8948  a8            tay
$00:8949  18            clc
$00:894a  69 0c 00      adc #$000c
$00:894d  9d 28 00      sta $0028,x
$00:8950  bd 1c 00      lda $001c,x
$00:8953  2a            rol a
$00:8954  08            php
$00:8955  10 16         bpl $896d
$00:8957  b9 02 00      lda $0002,y
$00:895a  38            sec
$00:895b  f9 08 00      sbc $0008,y
$00:895e  9d 08 00      sta $0008,x
$00:8961  b9 00 00      lda $0000,y
$00:8964  18            clc
$00:8965  79 08 00      adc $0008,y
$00:8968  9d 0c 00      sta $000c,x
$00:896b  80 0c         bra $8979
$00:896d  b9 00 00      lda $0000,y
$00:8970  9d 08 00      sta $0008,x
$00:8973  b9 02 00      lda $0002,y
$00:8976  9d 0c 00      sta $000c,x
$00:8979  28            plp
$00:897a  90 16         bcc $8992
$00:897c  b9 06 00      lda $0006,y
$00:897f  18            clc
$00:8980  79 0a 00      adc $000a,y
$00:8983  9d 0a 00      sta $000a,x
$00:8986  b9 04 00      lda $0004,y
$00:8989  38            sec
$00:898a  f9 0a 00      sbc $000a,y
$00:898d  9d 0e 00      sta $000e,x
$00:8990  80 0c         bra $899e
$00:8992  b9 04 00      lda $0004,y
$00:8995  9d 0a 00      sta $000a,x
$00:8998  b9 06 00      lda $0006,y
$00:899b  9d 0e 00      sta $000e,x
$00:899e  b9 08 00      lda $0008,y
$00:89a1  9d 10 00      sta $0010,x
$00:89a4  b9 0a 00      lda $000a,y
$00:89a7  9d 12 00      sta $0012,x
$00:89aa  fe 20 00      inc $0020,x
$00:89ad  18            clc
$00:89ae  ab            plb
$00:89af  6b            rtl
$00:89b0  9e 20 00      stz $0020,x
$00:89b3  9e 04 00      stz $0004,x
$00:89b6  9e 06 00      stz $0006,x
$00:89b9  38            sec
$00:89ba  ab            plb
$00:89bb  6b            rtl
$00:89bc  bd 3e 00      lda $003e,x
$00:89bf  aa            tax
$00:89c0  f0 71         beq $8a33
$00:89c2  ee 00 1f      inc $1f00
$00:89c5  bd 16 00      lda $0016,x
$00:89c8  89 00 08      bit #$0800
$00:89cb  f0 2c         beq $89f9
$00:89cd  bd 26 00      lda $0026,x
$00:89d0  10 0f         bpl $89e1
$00:89d2  fe 26 00      inc $0026,x
$00:89d5  10 19         bpl $89f0
$00:89d7  bd 1a 00      lda $001a,x
$00:89da  89 40 00      bit #$0040
$00:89dd  f0 1a         beq $89f9
$00:89df  80 db         bra $89bc
$00:89e1  de 26 00      dec $0026,x
$00:89e4  f0 0a         beq $89f0
$00:89e6  bd 1a 00      lda $001a,x
$00:89e9  89 40 00      bit #$0040
$00:89ec  f0 0b         beq $89f9
$00:89ee  80 cc         bra $89bc
$00:89f0  bd 16 00      lda $0016,x
$00:89f3  29 ff f7      and #$f7ff
$00:89f6  9d 16 00      sta $0016,x
$00:89f9  ad a6 03      lda $03a6
$00:89fc  f0 08         beq $8a06
$00:89fe  bd 16 00      lda $0016,x
$00:8a01  89 10 00      bit #$0010
$00:8a04  f0 b6         beq $89bc
$00:8a06  de 14 00      dec $0014,x
$00:8a09  10 17         bpl $8a22
$00:8a0b  9e 14 00      stz $0014,x
$00:8a0e  e2 20         sep #$20
$00:8a10  a9 00         lda #$00
$00:8a12  48            pha
$00:8a13  f4 21 8a      pea $8a21
$00:8a16  bd 36 00      lda $0036,x
$00:8a19  48            pha
$00:8a1a  c2 20         rep #$20
$00:8a1c  bd 18 00      lda $0018,x
$00:8a1f  3a            dec a
$00:8a20  48            pha
$00:8a21  6b            rtl
$00:8a22  bd 16 00      lda $0016,x
$00:8a25  89 00 10      bit #$1000
$00:8a28  f0 04         beq $8a2e
$00:8a2a  22 28 8f 00   jsl $008f28
$00:8a2e  20 9a 92      jsr $929a
$00:8a31  80 89         bra $89bc
$00:8a33  60            rts
UpdatePlayer:
$00:8a34  08            php
$00:8a35  8b            phb
$00:8a36  c2 20         rep #$20
$00:8a38  ae 9c 03      ldx $039c
$00:8a3b  bd 16 00      lda $0016,x
$00:8a3e  89 00 04      bit #$0400
$00:8a41  f0 03         beq $8a46
$00:8a43  82 a9 00      brl $8aef
$00:8a46  a2 00 00      ldx #$0000
$00:8a49  bc 00 19      ldy $1900,x
$00:8a4c  d0 03         bne $8a51
$00:8a4e  82 9e 00      brl $8aef
$00:8a51  e8            inx
$00:8a52  e8            inx
$00:8a53  b9 16 00      lda $0016,y
$00:8a56  89 80 00      bit #$0080
$00:8a59  f0 ee         beq $8a49
$00:8a5b  89 00 0d      bit #$0d00
$00:8a5e  d0 e9         bne $8a49
$00:8a60  da            phx
$00:8a61  e2 20         sep #$20
$00:8a63  b9 24 00      lda $0024,y
$00:8a66  48            pha
$00:8a67  ab            plb
$00:8a68  c2 20         rep #$20
$00:8a6a  a2 00 00      ldx #$0000
$00:8a6d  84 3e         sty $3e
$00:8a6f  a4 3e         ldy $3e
$00:8a71  b9 02 00      lda $0002,y
$00:8a74  38            sec
$00:8a75  f9 0a 00      sbc $000a,y
$00:8a78  85 00         sta $00
$00:8a7a  b9 02 00      lda $0002,y
$00:8a7d  18            clc
$00:8a7e  79 0e 00      adc $000e,y
$00:8a81  85 02         sta $02
$00:8a83  b9 00 00      lda $0000,y
$00:8a86  38            sec
$00:8a87  f9 08 00      sbc $0008,y
$00:8a8a  85 04         sta $04
$00:8a8c  b9 00 00      lda $0000,y
$00:8a8f  18            clc
$00:8a90  79 0c 00      adc $000c,y
$00:8a93  85 06         sta $06
$00:8a95  bc 00 19      ldy $1900,x
$00:8a98  f0 51         beq $8aeb
$00:8a9a  e8            inx
$00:8a9b  e8            inx
$00:8a9c  b9 16 00      lda $0016,y
$00:8a9f  89 c0 ee      bit #$eec0
$00:8aa2  d0 f1         bne $8a95
$00:8aa4  b9 00 00      lda $0000,y
$00:8aa7  38            sec
$00:8aa8  f9 08 00      sbc $0008,y
$00:8aab  c5 06         cmp $06
$00:8aad  b0 e6         bcs $8a95
$00:8aaf  b9 00 00      lda $0000,y
$00:8ab2  18            clc
$00:8ab3  79 0c 00      adc $000c,y
$00:8ab6  c5 04         cmp $04
$00:8ab8  90 db         bcc $8a95
$00:8aba  b9 02 00      lda $0002,y
$00:8abd  38            sec
$00:8abe  f9 0a 00      sbc $000a,y
$00:8ac1  c5 02         cmp $02
$00:8ac3  b0 d0         bcs $8a95
$00:8ac5  b9 02 00      lda $0002,y
$00:8ac8  18            clc
$00:8ac9  79 0e 00      adc $000e,y
$00:8acc  c5 00         cmp $00
$00:8ace  90 c5         bcc $8a95
$00:8ad0  20 55 8d      jsr $8d55
$00:8ad3  90 9a         bcc $8a6f
$00:8ad5  da            phx
$00:8ad6  a6 3e         ldx $3e
$00:8ad8  bd 16 00      lda $0016,x
$00:8adb  89 20 00      bit #$0020
$00:8ade  d0 05         bne $8ae5
$00:8ae0  20 f2 8a      jsr $8af2
$00:8ae3  80 03         bra $8ae8
$00:8ae5  20 67 8c      jsr $8c67
$00:8ae8  fa            plx
$00:8ae9  80 84         bra $8a6f
$00:8aeb  fa            plx
$00:8aec  82 5a ff      brl $8a49
$00:8aef  ab            plb
$00:8af0  28            plp
$00:8af1  6b            rtl
$00:8af2  ae 9c 03      ldx $039c
$00:8af5  bd 1e 00      lda $001e,x
$00:8af8  c9 24 00      cmp #$0024
$00:8afb  90 01         bcc $8afe
$00:8afd  60            rts
$00:8afe  b9 16 00      lda $0016,y
$00:8b01  89 02 00      bit #$0002
$00:8b04  f0 03         beq $8b09
$00:8b06  00 4c         brk #$4c
$00:8b08  60            rts
$00:8b09  ad 5e 1b      lda $1b5e
$00:8b0c  c9 08 00      cmp #$0008
$00:8b0f  f0 51         beq $8b62
$00:8b11  ad 5e 1b      lda $1b5e
$00:8b14  c9 02 00      cmp #$0002
$00:8b17  d0 25         bne $8b3e
$00:8b19  cc 9a 03      cpy $039a
$00:8b1c  f0 20         beq $8b3e
$00:8b1e  b9 1a 00      lda $001a,y
$00:8b21  89 00 0e      bit #$0e00
$00:8b24  f0 3c         beq $8b62
$00:8b26  b9 1a 00      lda $001a,y
$00:8b29  09 40 00      ora #$0040
$00:8b2c  99 1a 00      sta $001a,y
$00:8b2f  b9 16 00      lda $0016,y
$00:8b32  09 00 08      ora #$0800
$00:8b35  99 16 00      sta $0016,y
$00:8b38  a9 b4 00      lda #$00b4
$00:8b3b  99 26 00      sta $0026,y
$00:8b3e  b9 1a 00      lda $001a,y
$00:8b41  89 00 08      bit #$0800
$00:8b44  d0 0b         bne $8b51
$00:8b46  89 00 04      bit #$0400
$00:8b49  d0 0f         bne $8b5a
$00:8b4b  89 00 02      bit #$0200
$00:8b4e  f0 12         beq $8b62
$00:8b50  60            rts
$00:8b51  ad 5e 1b      lda $1b5e
$00:8b54  c9 06 00      cmp #$0006
$00:8b57  f0 09         beq $8b62
$00:8b59  60            rts
$00:8b5a  ad 5e 1b      lda $1b5e
$00:8b5d  c9 05 00      cmp #$0005
$00:8b60  d0 a4         bne $8b06
$00:8b62  ad 5e 1b      lda $1b5e
$00:8b65  c9 03 00      cmp #$0003
$00:8b68  d0 0d         bne $8b77
$00:8b6a  cc 9a 03      cpy $039a
$00:8b6d  f0 08         beq $8b77
$00:8b6f  ad 12 03      lda $0312
$00:8b72  29 0f 00      and #$000f
$00:8b75  f0 70         beq $8be7
$00:8b77  e2 20         sep #$20
$00:8b79  be 38 00      ldx $0038,y
$00:8b7c  bf 01 80 01   lda $018001,x
$00:8b80  85 00         sta $00
$00:8b82  ad 8c 1b      lda $1b8c
$00:8b85  38            sec
$00:8b86  e5 00         sbc $00
$00:8b88  f0 02         beq $8b8c
$00:8b8a  b0 02         bcs $8b8e
$00:8b8c  a9 01         lda #$01
$00:8b8e  85 00         sta $00
$00:8b90  ad 64 1b      lda $1b64
$00:8b93  c9 37         cmp #$37
$00:8b95  f0 04         beq $8b9b
$00:8b97  c9 35         cmp #$35
$00:8b99  d0 02         bne $8b9d
$00:8b9b  06 00         asl $00
$00:8b9d  b9 25 00      lda $0025,y
$00:8ba0  38            sec
$00:8ba1  e5 00         sbc $00
$00:8ba3  90 42         bcc $8be7
$00:8ba5  f0 40         beq $8be7
$00:8ba7  99 25 00      sta $0025,y
$00:8baa  c2 20         rep #$20
$00:8bac  cc 9a 03      cpy $039a
$00:8baf  f0 0f         beq $8bc0
$00:8bb1  ae 9c 03      ldx $039c
$00:8bb4  bd 1e 00      lda $001e,x
$00:8bb7  38            sec
$00:8bb8  e9 20 00      sbc #$0020
$00:8bbb  c9 04 00      cmp #$0004
$00:8bbe  90 0b         bcc $8bcb
$00:8bc0  b9 1a 00      lda $001a,y
$00:8bc3  29 bf ff      and #$ffbf
$00:8bc6  99 1a 00      sta $001a,y
$00:8bc9  80 09         bra $8bd4
$00:8bcb  b9 1a 00      lda $001a,y
$00:8bce  09 40 00      ora #$0040
$00:8bd1  99 1a 00      sta $001a,y
$00:8bd4  a9 f8 ff      lda #$fff8
$00:8bd7  99 26 00      sta $0026,y
$00:8bda  b9 16 00      lda $0016,y
$00:8bdd  09 00 08      ora #$0800
$00:8be0  99 16 00      sta $0016,y
$00:8be3  00 42         brk #$42
$00:8be5  80 5d         bra $8c44
$00:8be7  c2 20         rep #$20
$00:8be9  b9 1a 00      lda $001a,y
$00:8bec  89 00 01      bit #$0100
$00:8bef  e2 20         sep #$20
$00:8bf1  f0 04         beq $8bf7
$00:8bf3  a9 01         lda #$01
$00:8bf5  80 b0         bra $8ba7
$00:8bf7  a9 00         lda #$00
$00:8bf9  99 36 00      sta $0036,y
$00:8bfc  a9 00         lda #$00
$00:8bfe  99 25 00      sta $0025,y
$00:8c01  c2 20         rep #$20
$00:8c03  a9 10 aa      lda #$aa10
$00:8c06  99 18 00      sta $0018,y
$00:8c09  a9 00 00      lda #$0000
$00:8c0c  99 14 00      sta $0014,y
$00:8c0f  b9 16 00      lda $0016,y
$00:8c12  09 00 04      ora #$0400
$00:8c15  99 16 00      sta $0016,y
$00:8c18  be 38 00      ldx $0038,y
$00:8c1b  bf 03 80 01   lda $018003,x
$00:8c1f  22 87 f6 04   jsl $04f687
$00:8c23  a9 02 00      lda #$0002
$00:8c26  0c 32 03      tsb $0332
$00:8c29  ad 5e 1b      lda $1b5e
$00:8c2c  c9 07 00      cmp #$0007
$00:8c2f  d0 11         bne $8c42
$00:8c31  ad 88 1b      lda $1b88
$00:8c34  cd 8a 1b      cmp $1b8a
$00:8c37  f0 09         beq $8c42
$00:8c39  ee 88 1b      inc $1b88
$00:8c3c  a9 04 00      lda #$0004
$00:8c3f  0c 32 03      tsb $0332
$00:8c42  00 43         brk #$43
$00:8c44  b9 16 00      lda $0016,y
$00:8c47  89 01 00      bit #$0001
$00:8c4a  f0 01         beq $8c4d
$00:8c4c  60            rts
$00:8c4d  e2 20         sep #$20
$00:8c4f  b9 25 00      lda $0025,y
$00:8c52  8d 36 03      sta $0336
$00:8c55  be 38 00      ldx $0038,y
$00:8c58  bf 02 80 01   lda $018002,x
$00:8c5c  8d 38 03      sta $0338
$00:8c5f  a9 80         lda #$80
$00:8c61  8d 30 03      sta $0330
$00:8c64  c2 20         rep #$20
$00:8c66  60            rts
$00:8c67  b9 16 00      lda $0016,y
$00:8c6a  89 02 00      bit #$0002
$00:8c6d  f0 03         beq $8c72
$00:8c6f  00 4c         brk #$4c
$00:8c71  60            rts
$00:8c72  bd 30 00      lda $0030,x
$00:8c75  c9 ff 00      cmp #$00ff
$00:8c78  f0 1b         beq $8c95
$00:8c7a  ad 62 1b      lda $1b62
$00:8c7d  c9 18 00      cmp #$0018
$00:8c80  f0 22         beq $8ca4
$00:8c82  cc 9a 03      cpy $039a
$00:8c85  f0 e8         beq $8c6f
$00:8c87  b9 1a 00      lda $001a,y
$00:8c8a  89 00 0a      bit #$0a00
$00:8c8d  f0 01         beq $8c90
$00:8c8f  60            rts
$00:8c90  89 00 04      bit #$0400
$00:8c93  d0 da         bne $8c6f
$00:8c95  e2 20         sep #$20
$00:8c97  b9 25 00      lda $0025,y
$00:8c9a  38            sec
$00:8c9b  fd 30 00      sbc $0030,x
$00:8c9e  90 4c         bcc $8cec
$00:8ca0  f0 4a         beq $8cec
$00:8ca2  80 27         bra $8ccb
$00:8ca4  e2 20         sep #$20
$00:8ca6  be 38 00      ldx $0038,y
$00:8ca9  bf 01 80 01   lda $018001,x
$00:8cad  85 00         sta $00
$00:8caf  ad 70 1b      lda $1b70
$00:8cb2  18            clc
$00:8cb3  6d 72 1b      adc $1b72
$00:8cb6  38            sec
$00:8cb7  e5 00         sbc $00
$00:8cb9  f0 02         beq $8cbd
$00:8cbb  b0 02         bcs $8cbf
$00:8cbd  a9 01         lda #$01
$00:8cbf  85 00         sta $00
$00:8cc1  b9 25 00      lda $0025,y
$00:8cc4  38            sec
$00:8cc5  e5 00         sbc $00
$00:8cc7  90 23         bcc $8cec
$00:8cc9  f0 21         beq $8cec
$00:8ccb  99 25 00      sta $0025,y
$00:8cce  c2 20         rep #$20
$00:8cd0  a9 f8 ff      lda #$fff8
$00:8cd3  99 26 00      sta $0026,y
$00:8cd6  b9 16 00      lda $0016,y
$00:8cd9  09 00 08      ora #$0800
$00:8cdc  99 16 00      sta $0016,y
$00:8cdf  b9 1a 00      lda $001a,y
$00:8ce2  29 bf ff      and #$ffbf
$00:8ce5  99 1a 00      sta $001a,y
$00:8ce8  00 42         brk #$42
$00:8cea  80 46         bra $8d32
$00:8cec  c2 20         rep #$20
$00:8cee  b9 1a 00      lda $001a,y
$00:8cf1  89 00 01      bit #$0100
$00:8cf4  e2 20         sep #$20
$00:8cf6  f0 04         beq $8cfc
$00:8cf8  a9 01         lda #$01
$00:8cfa  80 cf         bra $8ccb
$00:8cfc  e2 20         sep #$20
$00:8cfe  a9 00         lda #$00
$00:8d00  99 36 00      sta $0036,y
$00:8d03  a9 00         lda #$00
$00:8d05  99 25 00      sta $0025,y
$00:8d08  c2 20         rep #$20
$00:8d0a  a9 10 aa      lda #$aa10
$00:8d0d  99 18 00      sta $0018,y
$00:8d10  a9 00 00      lda #$0000
$00:8d13  99 14 00      sta $0014,y
$00:8d16  b9 16 00      lda $0016,y
$00:8d19  09 00 04      ora #$0400
$00:8d1c  99 16 00      sta $0016,y
$00:8d1f  be 38 00      ldx $0038,y
$00:8d22  bf 03 80 01   lda $018003,x
$00:8d26  22 87 f6 04   jsl $04f687
$00:8d2a  a9 02 00      lda #$0002
$00:8d2d  0c 32 03      tsb $0332
$00:8d30  00 43         brk #$43
$00:8d32  b9 16 00      lda $0016,y
$00:8d35  89 01 00      bit #$0001
$00:8d38  f0 01         beq $8d3b
$00:8d3a  60            rts
$00:8d3b  e2 20         sep #$20
$00:8d3d  b9 25 00      lda $0025,y
$00:8d40  8d 36 03      sta $0336
$00:8d43  be 38 00      ldx $0038,y
$00:8d46  bf 02 80 01   lda $018002,x
$00:8d4a  8d 38 03      sta $0338
$00:8d4d  a9 80         lda #$80
$00:8d4f  8d 30 03      sta $0330
$00:8d52  c2 20         rep #$20
$00:8d54  60            rts
$00:8d55  da            phx
$00:8d56  5a            phy
$00:8d57  bb            tyx
$00:8d58  a4 3e         ldy $3e
$00:8d5a  bd 02 00      lda $0002,x
$00:8d5d  38            sec
$00:8d5e  fd 0a 00      sbc $000a,x
$00:8d61  85 00         sta $00
$00:8d63  bd 02 00      lda $0002,x
$00:8d66  18            clc
$00:8d67  7d 0e 00      adc $000e,x
$00:8d6a  85 02         sta $02
$00:8d6c  bd 00 00      lda $0000,x
$00:8d6f  38            sec
$00:8d70  fd 08 00      sbc $0008,x
$00:8d73  85 04         sta $04
$00:8d75  bd 00 00      lda $0000,x
$00:8d78  18            clc
$00:8d79  7d 0c 00      adc $000c,x
$00:8d7c  85 06         sta $06
$00:8d7e  b9 00 00      lda $0000,y
$00:8d81  38            sec
$00:8d82  f9 08 00      sbc $0008,y
$00:8d85  85 08         sta $08
$00:8d87  b9 02 00      lda $0002,y
$00:8d8a  38            sec
$00:8d8b  f9 0a 00      sbc $000a,y
$00:8d8e  85 0a         sta $0a
$00:8d90  be 28 00      ldx $0028,y
$00:8d93  bd 00 00      lda $0000,x
$00:8d96  85 0c         sta $0c
$00:8d98  e8            inx
$00:8d99  e8            inx
$00:8d9a  bd 00 00      lda $0000,x
$00:8d9d  4a            lsr a
$00:8d9e  90 05         bcc $8da5
$00:8da0  a9 0f 00      lda #$000f
$00:8da3  80 03         bra $8da8
$00:8da5  a9 07 00      lda #$0007
$00:8da8  48            pha
$00:8da9  b9 1c 00      lda $001c,y
$00:8dac  0a            asl a
$00:8dad  0a            asl a
$00:8dae  bd 01 00      lda $0001,x
$00:8db1  90 01         bcc $8db4
$00:8db3  eb            xba
$00:8db4  29 ff 00      and #$00ff
$00:8db7  18            clc
$00:8db8  65 08         adc $08
$00:8dba  c5 06         cmp $06
$00:8dbc  b0 27         bcs $8de5
$00:8dbe  18            clc
$00:8dbf  63 01         adc $01,s
$00:8dc1  c5 04         cmp $04
$00:8dc3  90 20         bcc $8de5
$00:8dc5  b9 1c 00      lda $001c,y
$00:8dc8  0a            asl a
$00:8dc9  bd 03 00      lda $0003,x
$00:8dcc  90 01         bcc $8dcf
$00:8dce  eb            xba
$00:8dcf  29 ff 00      and #$00ff
$00:8dd2  18            clc
$00:8dd3  65 0a         adc $0a
$00:8dd5  c5 02         cmp $02
$00:8dd7  b0 0c         bcs $8de5
$00:8dd9  18            clc
$00:8dda  63 01         adc $01,s
$00:8ddc  c5 00         cmp $00
$00:8dde  90 05         bcc $8de5
$00:8de0  68            pla
$00:8de1  7a            ply
$00:8de2  fa            plx
$00:8de3  38            sec
$00:8de4  60            rts
$00:8de5  68            pla
$00:8de6  8a            txa
$00:8de7  18            clc
$00:8de8  69 07 00      adc #$0007
$00:8deb  aa            tax
$00:8dec  c6 0c         dec $0c
$00:8dee  d0 aa         bne $8d9a
$00:8df0  7a            ply
$00:8df1  fa            plx
$00:8df2  18            clc
$00:8df3  60            rts
UpdateEntities:
$00:8df4  08            php
$00:8df5  c2 30         rep #$30
$00:8df7  ad 2d 04      lda $042d
$00:8dfa  d0 63         bne $8e5f
$00:8dfc  ac 9c 03      ldy $039c
$00:8dff  b9 00 00      lda $0000,y
$00:8e02  18            clc
$00:8e03  69 05 00      adc #$0005
$00:8e06  85 16         sta $16
$00:8e08  18            clc
$00:8e09  69 07 00      adc #$0007
$00:8e0c  85 1a         sta $1a
$00:8e0e  b9 02 00      lda $0002,y
$00:8e11  38            sec
$00:8e12  e9 04 00      sbc #$0004
$00:8e15  85 1c         sta $1c
$00:8e17  38            sec
$00:8e18  e9 08 00      sbc #$0008
$00:8e1b  85 18         sta $18
$00:8e1d  b9 16 00      lda $0016,y
$00:8e20  89 00 04      bit #$0400
$00:8e23  d0 3a         bne $8e5f
$00:8e25  89 00 08      bit #$0800
$00:8e28  d0 37         bne $8e61
$00:8e2a  a0 00 00      ldy #$0000
$00:8e2d  be 00 19      ldx $1900,y
$00:8e30  f0 2d         beq $8e5f
$00:8e32  c8            iny
$00:8e33  c8            iny
$00:8e34  bd 16 00      lda $0016,x
$00:8e37  89 c0 25      bit #$25c0
$00:8e3a  d0 f1         bne $8e2d
$00:8e3c  bd 00 00      lda $0000,x
$00:8e3f  c5 1a         cmp $1a
$00:8e41  b0 ea         bcs $8e2d
$00:8e43  18            clc
$00:8e44  7d 10 00      adc $0010,x
$00:8e47  c5 16         cmp $16
$00:8e49  90 e2         bcc $8e2d
$00:8e4b  bd 02 00      lda $0002,x
$00:8e4e  c5 18         cmp $18
$00:8e50  90 db         bcc $8e2d
$00:8e52  38            sec
$00:8e53  fd 12 00      sbc $0012,x
$00:8e56  c5 1c         cmp $1c
$00:8e58  b0 d3         bcs $8e2d
$00:8e5a  20 9d 8e      jsr $8e9d
$00:8e5d  b0 ce         bcs $8e2d
$00:8e5f  28            plp
$00:8e60  6b            rtl
$00:8e61  a0 00 00      ldy #$0000
$00:8e64  be 00 19      ldx $1900,y
$00:8e67  f0 32         beq $8e9b
$00:8e69  c8            iny
$00:8e6a  c8            iny
$00:8e6b  bd 16 00      lda $0016,x
$00:8e6e  89 c0 25      bit #$25c0
$00:8e71  d0 f1         bne $8e64
$00:8e73  89 00 40      bit #$4000
$00:8e76  f0 ec         beq $8e64
$00:8e78  bd 00 00      lda $0000,x
$00:8e7b  c5 1a         cmp $1a
$00:8e7d  b0 e5         bcs $8e64
$00:8e7f  18            clc
$00:8e80  7d 10 00      adc $0010,x
$00:8e83  c5 16         cmp $16
$00:8e85  90 dd         bcc $8e64
$00:8e87  bd 02 00      lda $0002,x
$00:8e8a  c5 18         cmp $18
$00:8e8c  90 d6         bcc $8e64
$00:8e8e  38            sec
$00:8e8f  fd 12 00      sbc $0012,x
$00:8e92  c5 1c         cmp $1c
$00:8e94  b0 ce         bcs $8e64
$00:8e96  20 9d 8e      jsr $8e9d
$00:8e99  b0 c9         bcs $8e64
$00:8e9b  28            plp
$00:8e9c  6b            rtl
$00:8e9d  bd 16 00      lda $0016,x
$00:8ea0  89 00 40      bit #$4000
$00:8ea3  d0 7d         bne $8f22
$00:8ea5  ad 60 1b      lda $1b60
$00:8ea8  c9 0e 00      cmp #$000e
$00:8eab  d0 16         bne $8ec3
$00:8ead  e2 20         sep #$20
$00:8eaf  bc 38 00      ldy $0038,x
$00:8eb2  b9 00 80      lda $8000,y
$00:8eb5  4a            lsr a
$00:8eb6  18            clc
$00:8eb7  79 00 80      adc $8000,y
$00:8eba  cd 8e 1b      cmp $1b8e
$00:8ebd  b0 04         bcs $8ec3
$00:8ebf  00 0c         brk #$0c
$00:8ec1  80 5d         bra $8f20
$00:8ec3  e2 20         sep #$20
$00:8ec5  bc 38 00      ldy $0038,x
$00:8ec8  b9 00 80      lda $8000,y
$00:8ecb  3a            dec a
$00:8ecc  38            sec
$00:8ecd  ed 8e 1b      sbc $1b8e
$00:8ed0  b0 02         bcs $8ed4
$00:8ed2  a9 00         lda #$00
$00:8ed4  85 00         sta $00
$00:8ed6  ad 64 1b      lda $1b64
$00:8ed9  c9 37         cmp #$37
$00:8edb  f0 04         beq $8ee1
$00:8edd  c9 36         cmp #$36
$00:8edf  d0 02         bne $8ee3
$00:8ee1  46 00         lsr $00
$00:8ee3  a5 00         lda $00
$00:8ee5  d0 01         bne $8ee8
$00:8ee7  1a            inc a
$00:8ee8  48            pha
$00:8ee9  ad 88 1b      lda $1b88
$00:8eec  38            sec
$00:8eed  e3 01         sbc $01,s
$00:8eef  10 02         bpl $8ef3
$00:8ef1  a9 00         lda #$00
$00:8ef3  8d 88 1b      sta $1b88
$00:8ef6  68            pla
$00:8ef7  c2 20         rep #$20
$00:8ef9  a9 04 00      lda #$0004
$00:8efc  0c 32 03      tsb $0332
$00:8eff  ae 9c 03      ldx $039c
$00:8f02  ad 60 1b      lda $1b60
$00:8f05  c9 0d 00      cmp #$000d
$00:8f08  d0 05         bne $8f0f
$00:8f0a  a9 c0 ff      lda #$ffc0
$00:8f0d  80 03         bra $8f12
$00:8f0f  a9 e0 ff      lda #$ffe0
$00:8f12  9d 26 00      sta $0026,x
$00:8f15  00 04         brk #$04
$00:8f17  bd 16 00      lda $0016,x
$00:8f1a  09 00 08      ora #$0800
$00:8f1d  9d 16 00      sta $0016,x
$00:8f20  18            clc
$00:8f21  60            rts
$00:8f22  22 0a af 00   jsl $00af0a
$00:8f26  38            sec
$00:8f27  60            rts
$00:8f28  bd 10 00      lda $0010,x
$00:8f2b  1d 12 00      ora $0012,x
$00:8f2e  29 08 00      and #$0008
$00:8f31  d0 1f         bne $8f52
$00:8f33  bd 04 00      lda $0004,x
$00:8f36  f0 0a         beq $8f42
$00:8f38  30 05         bmi $8f3f
$00:8f3a  20 56 8f      jsr $8f56
$00:8f3d  80 03         bra $8f42
$00:8f3f  20 ff 8f      jsr $8fff
$00:8f42  bd 06 00      lda $0006,x
$00:8f45  f0 0a         beq $8f51
$00:8f47  30 05         bmi $8f4e
$00:8f49  20 af 90      jsr $90af
$00:8f4c  80 03         bra $8f51
$00:8f4e  20 54 91      jsr $9154
$00:8f51  6b            rtl
$00:8f52  20 08 92      jsr $9208
$00:8f55  6b            rtl
$00:8f56  08            php
$00:8f57  bd 00 00      lda $0000,x
$00:8f5a  18            clc
$00:8f5b  7d 10 00      adc $0010,x
$00:8f5e  38            sec
$00:8f5f  e9 10 00      sbc #$0010
$00:8f62  4a            lsr a
$00:8f63  4a            lsr a
$00:8f64  4a            lsr a
$00:8f65  4a            lsr a
$00:8f66  85 16         sta $16
$00:8f68  bd 02 00      lda $0002,x
$00:8f6b  38            sec
$00:8f6c  fd 12 00      sbc $0012,x
$00:8f6f  4a            lsr a
$00:8f70  4a            lsr a
$00:8f71  4a            lsr a
$00:8f72  4a            lsr a
$00:8f73  85 18         sta $18
$00:8f75  85 1c         sta $1c
$00:8f77  bd 02 00      lda $0002,x
$00:8f7a  3a            dec a
$00:8f7b  4a            lsr a
$00:8f7c  4a            lsr a
$00:8f7d  4a            lsr a
$00:8f7e  4a            lsr a
$00:8f7f  85 00         sta $00
$00:8f81  bd 12 00      lda $0012,x
$00:8f84  4a            lsr a
$00:8f85  4a            lsr a
$00:8f86  4a            lsr a
$00:8f87  4a            lsr a
$00:8f88  85 0c         sta $0c
$00:8f8a  85 0e         sta $0e
$00:8f8c  e2 20         sep #$20
$00:8f8e  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:8f91  c9 0a         cmp #$0a
$00:8f93  f0 4f         beq $8fe4
$00:8f95  e6 18         inc $18
$00:8f97  c6 0c         dec $0c
$00:8f99  d0 f3         bne $8f8e
$00:8f9b  a5 00         lda $00
$00:8f9d  85 18         sta $18
$00:8f9f  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:8fa2  c9 0a         cmp #$0a
$00:8fa4  f0 3e         beq $8fe4
$00:8fa6  a5 1c         lda $1c
$00:8fa8  85 18         sta $18
$00:8faa  e6 16         inc $16
$00:8fac  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:8faf  b0 4b         bcs $8ffc
$00:8fb1  c9 0f         cmp #$0f
$00:8fb3  f0 2f         beq $8fe4
$00:8fb5  c9 05         cmp #$05
$00:8fb7  f0 2b         beq $8fe4
$00:8fb9  c9 06         cmp #$06
$00:8fbb  f0 27         beq $8fe4
$00:8fbd  e6 18         inc $18
$00:8fbf  c6 0e         dec $0e
$00:8fc1  d0 e9         bne $8fac
$00:8fc3  a5 00         lda $00
$00:8fc5  85 18         sta $18
$00:8fc7  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:8fca  b0 30         bcs $8ffc
$00:8fcc  c9 0f         cmp #$0f
$00:8fce  f0 14         beq $8fe4
$00:8fd0  c9 05         cmp #$05
$00:8fd2  f0 10         beq $8fe4
$00:8fd4  c9 06         cmp #$06
$00:8fd6  f0 0c         beq $8fe4
$00:8fd8  28            plp
$00:8fd9  bd 16 00      lda $0016,x
$00:8fdc  29 fb         and #$fb
$00:8fde  ff 9d 16 00   sbc $00169d,x
$00:8fe2  18            clc
$00:8fe3  60            rts
$00:8fe4  28            plp
$00:8fe5  bd 16 00      lda $0016,x
$00:8fe8  09 04         ora #$04
$00:8fea  00 9d         brk #$9d
$00:8fec  16 00         asl $00,x
$00:8fee  bd 00 00      lda $0000,x
$00:8ff1  29 f0         and #$f0
$00:8ff3  ff 9d 00 00   sbc $00009d,x
$00:8ff7  9e 04 00      stz $0004,x
$00:8ffa  38            sec
$00:8ffb  60            rts
$00:8ffc  28            plp
$00:8ffd  80 ef         bra $8fee
$00:8fff  08            php
$00:9000  bd 04 00      lda $0004,x
$00:9003  18            clc
$00:9004  7d 00 00      adc $0000,x
$00:9007  5d 00 00      eor $0000,x
$00:900a  29 f0         and #$f0
$00:900c  ff f0 79 bd   sbc $bd79f0,x
$00:9010  00 00         brk #$00
$00:9012  4a            lsr a
$00:9013  4a            lsr a
$00:9014  4a            lsr a
$00:9015  4a            lsr a
$00:9016  85 16         sta $16
$00:9018  bd 02 00      lda $0002,x
$00:901b  38            sec
$00:901c  fd 12 00      sbc $0012,x
$00:901f  4a            lsr a
$00:9020  4a            lsr a
$00:9021  4a            lsr a
$00:9022  4a            lsr a
$00:9023  85 18         sta $18
$00:9025  85 1c         sta $1c
$00:9027  bd 02 00      lda $0002,x
$00:902a  3a            dec a
$00:902b  4a            lsr a
$00:902c  4a            lsr a
$00:902d  4a            lsr a
$00:902e  4a            lsr a
$00:902f  85 00         sta $00
$00:9031  bd 12 00      lda $0012,x
$00:9034  4a            lsr a
$00:9035  4a            lsr a
$00:9036  4a            lsr a
$00:9037  4a            lsr a
$00:9038  85 0c         sta $0c
$00:903a  85 0e         sta $0e
$00:903c  e2 20         sep #$20
$00:903e  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:9041  c9 05         cmp #$05
$00:9043  f0 4f         beq $9094
$00:9045  e6 18         inc $18
$00:9047  c6 0c         dec $0c
$00:9049  d0 f3         bne $903e
$00:904b  a5 00         lda $00
$00:904d  85 18         sta $18
$00:904f  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:9052  c9 05         cmp #$05
$00:9054  f0 3e         beq $9094
$00:9056  a5 1c         lda $1c
$00:9058  85 18         sta $18
$00:905a  c6 16         dec $16
$00:905c  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:905f  b0 4b         bcs $90ac
$00:9061  c9 0f         cmp #$0f
$00:9063  f0 2f         beq $9094
$00:9065  c9 0a         cmp #$0a
$00:9067  f0 2b         beq $9094
$00:9069  c9 06         cmp #$06
$00:906b  f0 27         beq $9094
$00:906d  e6 18         inc $18
$00:906f  c6 0e         dec $0e
$00:9071  d0 e9         bne $905c
$00:9073  a5 00         lda $00
$00:9075  85 18         sta $18
$00:9077  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:907a  b0 30         bcs $90ac
$00:907c  c9 0f         cmp #$0f
$00:907e  f0 14         beq $9094
$00:9080  c9 0a         cmp #$0a
$00:9082  f0 10         beq $9094
$00:9084  c9 06         cmp #$06
$00:9086  f0 0c         beq $9094
$00:9088  28            plp
$00:9089  bd 16 00      lda $0016,x
$00:908c  29 fb         and #$fb
$00:908e  ff 9d 16 00   sbc $00169d,x
$00:9092  18            clc
$00:9093  60            rts
$00:9094  28            plp
$00:9095  bd 16 00      lda $0016,x
$00:9098  09 04         ora #$04
$00:909a  00 9d         brk #$9d
$00:909c  16 00         asl $00,x
$00:909e  bd 00 00      lda $0000,x
$00:90a1  29 f0         and #$f0
$00:90a3  ff 9d 00 00   sbc $00009d,x
$00:90a7  9e 04 00      stz $0004,x
$00:90aa  38            sec
$00:90ab  60            rts
$00:90ac  28            plp
$00:90ad  80 ef         bra $909e
$00:90af  08            php
$00:90b0  bd 02 00      lda $0002,x
$00:90b3  38            sec
$00:90b4  e9 10         sbc #$10
$00:90b6  00 4a         brk #$4a
$00:90b8  4a            lsr a
$00:90b9  4a            lsr a
$00:90ba  4a            lsr a
$00:90bb  85 18         sta $18
$00:90bd  bd 00 00      lda $0000,x
$00:90c0  4a            lsr a
$00:90c1  4a            lsr a
$00:90c2  4a            lsr a
$00:90c3  4a            lsr a
$00:90c4  85 16         sta $16
$00:90c6  85 1a         sta $1a
$00:90c8  bd 00 00      lda $0000,x
$00:90cb  18            clc
$00:90cc  7d 10 00      adc $0010,x
$00:90cf  3a            dec a
$00:90d0  4a            lsr a
$00:90d1  4a            lsr a
$00:90d2  4a            lsr a
$00:90d3  4a            lsr a
$00:90d4  85 00         sta $00
$00:90d6  bd 10 00      lda $0010,x
$00:90d9  4a            lsr a
$00:90da  4a            lsr a
$00:90db  4a            lsr a
$00:90dc  4a            lsr a
$00:90dd  85 0c         sta $0c
$00:90df  85 0e         sta $0e
$00:90e1  e2 20         sep #$20
$00:90e3  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:90e6  c9 0c         cmp #$0c
$00:90e8  f0 4f         beq $9139
$00:90ea  e6 16         inc $16
$00:90ec  c6 0c         dec $0c
$00:90ee  d0 f3         bne $90e3
$00:90f0  a5 00         lda $00
$00:90f2  85 16         sta $16
$00:90f4  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:90f7  c9 0c         cmp #$0c
$00:90f9  f0 3e         beq $9139
$00:90fb  a5 1a         lda $1a
$00:90fd  85 16         sta $16
$00:90ff  e6 18         inc $18
$00:9101  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:9104  b0 4b         bcs $9151
$00:9106  c9 0f         cmp #$0f
$00:9108  f0 2f         beq $9139
$00:910a  c9 03         cmp #$03
$00:910c  f0 2b         beq $9139
$00:910e  c9 06         cmp #$06
$00:9110  f0 27         beq $9139
$00:9112  e6 16         inc $16
$00:9114  c6 0e         dec $0e
$00:9116  d0 e9         bne $9101
$00:9118  a5 00         lda $00
$00:911a  85 16         sta $16
$00:911c  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:911f  b0 30         bcs $9151
$00:9121  c9 0f         cmp #$0f
$00:9123  f0 14         beq $9139
$00:9125  c9 03         cmp #$03
$00:9127  f0 10         beq $9139
$00:9129  c9 06         cmp #$06
$00:912b  f0 0c         beq $9139
$00:912d  28            plp
$00:912e  bd 16 00      lda $0016,x
$00:9131  29 fb         and #$fb
$00:9133  ff 9d 16 00   sbc $00169d,x
$00:9137  18            clc
$00:9138  60            rts
$00:9139  28            plp
$00:913a  bd 16 00      lda $0016,x
$00:913d  09 04         ora #$04
$00:913f  00 9d         brk #$9d
$00:9141  16 00         asl $00,x
$00:9143  bd 02 00      lda $0002,x
$00:9146  29 f0         and #$f0
$00:9148  ff 9d 02 00   sbc $00029d,x
$00:914c  9e 06 00      stz $0006,x
$00:914f  38            sec
$00:9150  60            rts
$00:9151  28            plp
$00:9152  80 ef         bra $9143
$00:9154  08            php
$00:9155  bd 06 00      lda $0006,x
$00:9158  18            clc
$00:9159  7d 02 00      adc $0002,x
$00:915c  5d 02 00      eor $0002,x
$00:915f  29 f0         and #$f0
$00:9161  ff f0 7d bd   sbc $bd7df0,x
$00:9165  02 00         cop #$00
$00:9167  38            sec
$00:9168  fd 12 00      sbc $0012,x
$00:916b  4a            lsr a
$00:916c  4a            lsr a
$00:916d  4a            lsr a
$00:916e  4a            lsr a
$00:916f  85 18         sta $18
$00:9171  bd 00 00      lda $0000,x
$00:9174  4a            lsr a
$00:9175  4a            lsr a
$00:9176  4a            lsr a
$00:9177  4a            lsr a
$00:9178  85 16         sta $16
$00:917a  85 1a         sta $1a
$00:917c  bd 00 00      lda $0000,x
$00:917f  18            clc
$00:9180  7d 10 00      adc $0010,x
$00:9183  3a            dec a
$00:9184  4a            lsr a
$00:9185  4a            lsr a
$00:9186  4a            lsr a
$00:9187  4a            lsr a
$00:9188  85 00         sta $00
$00:918a  bd 10 00      lda $0010,x
$00:918d  4a            lsr a
$00:918e  4a            lsr a
$00:918f  4a            lsr a
$00:9190  4a            lsr a
$00:9191  85 0c         sta $0c
$00:9193  85 0e         sta $0e
$00:9195  e2 20         sep #$20
$00:9197  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:919a  c9 03         cmp #$03
$00:919c  f0 4f         beq $91ed
$00:919e  e6 16         inc $16
$00:91a0  c6 0c         dec $0c
$00:91a2  d0 f3         bne $9197
$00:91a4  a5 00         lda $00
$00:91a6  85 16         sta $16
$00:91a8  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:91ab  c9 03         cmp #$03
$00:91ad  f0 3e         beq $91ed
$00:91af  a5 1a         lda $1a
$00:91b1  85 16         sta $16
$00:91b3  c6 18         dec $18
$00:91b5  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:91b8  b0 4b         bcs $9205
$00:91ba  c9 0f         cmp #$0f
$00:91bc  f0 2f         beq $91ed
$00:91be  c9 0c         cmp #$0c
$00:91c0  f0 2b         beq $91ed
$00:91c2  c9 06         cmp #$06
$00:91c4  f0 27         beq $91ed
$00:91c6  e6 16         inc $16
$00:91c8  c6 0e         dec $0e
$00:91ca  d0 e9         bne $91b5
$00:91cc  a5 00         lda $00
$00:91ce  85 16         sta $16
$00:91d0  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:91d3  b0 30         bcs $9205
$00:91d5  c9 0f         cmp #$0f
$00:91d7  f0 14         beq $91ed
$00:91d9  c9 0c         cmp #$0c
$00:91db  f0 10         beq $91ed
$00:91dd  c9 06         cmp #$06
$00:91df  f0 0c         beq $91ed
$00:91e1  28            plp
$00:91e2  bd 16 00      lda $0016,x
$00:91e5  29 fb         and #$fb
$00:91e7  ff 9d 16 00   sbc $00169d,x
$00:91eb  18            clc
$00:91ec  60            rts
$00:91ed  28            plp
$00:91ee  bd 16 00      lda $0016,x
$00:91f1  09 04         ora #$04
$00:91f3  00 9d         brk #$9d
$00:91f5  16 00         asl $00,x
$00:91f7  bd 02 00      lda $0002,x
$00:91fa  29 f0         and #$f0
$00:91fc  ff 9d 02 00   sbc $00029d,x
$00:9200  9e 06 00      stz $0006,x
$00:9203  38            sec
$00:9204  60            rts
$00:9205  28            plp
$00:9206  80 ef         bra $91f7
$00:9208  bd 04 00      lda $0004,x
$00:920b  1d 04 00      ora $0004,x
$00:920e  f0 33         beq $9243
$00:9210  bd 00 00      lda $0000,x
$00:9213  18            clc
$00:9214  7d 04 00      adc $0004,x
$00:9217  38            sec
$00:9218  e9 04         sbc #$04
$00:921a  00 4a         brk #$4a
$00:921c  4a            lsr a
$00:921d  4a            lsr a
$00:921e  4a            lsr a
$00:921f  85 16         sta $16
$00:9221  bd 02 00      lda $0002,x
$00:9224  18            clc
$00:9225  7d 06 00      adc $0006,x
$00:9228  38            sec
$00:9229  e9 04         sbc #$04
$00:922b  00 4a         brk #$4a
$00:922d  4a            lsr a
$00:922e  4a            lsr a
$00:922f  4a            lsr a
$00:9230  85 18         sta $18
$00:9232  20 56 92      jsr $9256  ; -> Sub_00_9256
$00:9235  c9 0f         cmp #$0f
$00:9237  00 f0         brk #$f0
$00:9239  0b            phd
$00:923a  bd 16 00      lda $0016,x
$00:923d  29 fb         and #$fb
$00:923f  ff 9d 16 00   sbc $00169d,x
$00:9243  18            clc
$00:9244  60            rts
$00:9245  9e 04 00      stz $0004,x
$00:9248  9e 06 00      stz $0006,x
$00:924b  bd 16 00      lda $0016,x
$00:924e  09 04         ora #$04
$00:9250  00 9d         brk #$9d
$00:9252  16 00         asl $00,x
$00:9254  38            sec
$00:9255  60            rts
Sub_00_9256:
$00:9256  08            php
$00:9257  da            phx
$00:9258  c2 20         rep #$20
$00:925a  a5 18         lda $18
$00:925c  0a            asl a
$00:925d  0a            asl a
$00:925e  0a            asl a
$00:925f  0a            asl a
$00:9260  48            pha
$00:9261  e2 20         sep #$20
$00:9263  ad 43 03      lda $0343
$00:9266  22 d1 b1 02   jsl $02b1d1  ; -> Sub_02_b1d1
$00:926a  83 02         sta $02,s
$00:926c  a5 16         lda $16
$00:926e  29 0f         and #$0f
$00:9270  18            clc
$00:9271  63 01         adc $01,s
$00:9273  83 01         sta $01,s
$00:9275  a5 16         lda $16
$00:9277  4a            lsr a
$00:9278  4a            lsr a
$00:9279  4a            lsr a
$00:927a  4a            lsr a
$00:927b  18            clc
$00:927c  63 02         adc $02,s
$00:927e  83 02         sta $02,s
$00:9280  fa            plx
$00:9281  e0 00 40      cpx #$4000
$00:9284  b0 0e         bcs $9294
$00:9286  bf 00 80 7f   lda $7f8000,x
$00:928a  89 f0         bit #$f0
$00:928c  d0 06         bne $9294
$00:928e  29 0f         and #$0f
$00:9290  fa            plx
$00:9291  28            plp
$00:9292  18            clc
$00:9293  60            rts
$00:9294  a9 0f         lda #$0f
$00:9296  fa            plx
$00:9297  28            plp
$00:9298  38            sec
$00:9299  60            rts
$00:929a  bd 00 00      lda $0000,x
$00:929d  18            clc
$00:929e  7d 04 00      adc $0004,x
$00:92a1  9d 00 00      sta $0000,x
$00:92a4  bd 02 00      lda $0002,x
$00:92a7  18            clc
$00:92a8  7d 06 00      adc $0006,x
$00:92ab  9d 02 00      sta $0002,x
$00:92ae  60            rts
$00:92af  08            php
$00:92b0  c2 20         rep #$20
$00:92b2  a2 00 18      ldx #$1800
$00:92b5  86 4a         stx $4a
$00:92b7  a9 00 08      lda #$0800
$00:92ba  9d 00 00      sta $0000,x
$00:92bd  e8            inx
$00:92be  e8            inx
$00:92bf  18            clc
$00:92c0  69 40 00      adc #$0040
$00:92c3  e0 80 18      cpx #$1880
$00:92c6  d0 f2         bne $92ba
$00:92c8  a2 00 08      ldx #$0800
$00:92cb  8e a6 06      stx $06a6
$00:92ce  a9 00 00      lda #$0000
$00:92d1  aa            tax
$00:92d2  9d 00 08      sta $0800,x
$00:92d5  e8            inx
$00:92d6  e8            inx
$00:92d7  e0 00 10      cpx #$1000
$00:92da  d0 f6         bne $92d2
$00:92dc  28            plp
$00:92dd  6b            rtl
$00:92de  08            php
$00:92df  c2 20         rep #$20
$00:92e1  ad ba 03      lda $03ba
$00:92e4  0a            asl a
$00:92e5  aa            tax
$00:92e6  bd 00 80      lda $8000,x
$00:92e9  38            sec
$00:92ea  e9 00 80      sbc #$8000
$00:92ed  8d b0 03      sta $03b0
$00:92f0  e2 20         sep #$20
$00:92f2  a2 00 00      ldx #$0000
$00:92f5  bd b4 99      lda $99b4,x
$00:92f8  30 18         bmi $9312
$00:92fa  cd 14 03      cmp $0314
$00:92fd  d0 0d         bne $930c
$00:92ff  bd b5 99      lda $99b5,x
$00:9302  cd 16 03      cmp $0316
$00:9305  d0 05         bne $930c
$00:9307  20 14 93      jsr $9314
$00:930a  80 06         bra $9312
$00:930c  e8            inx
$00:930d  e8            inx
$00:930e  e8            inx
$00:930f  e8            inx
$00:9310  80 e3         bra $92f5
$00:9312  28            plp
$00:9313  6b            rtl
$00:9314  a9 01         lda #$01
$00:9316  85 2b         sta $2b
$00:9318  c2 20         rep #$20
$00:931a  bd b6 99      lda $99b6,x
$00:931d  85 29         sta $29
$00:931f  22 8a e6 00   jsl $00e68a
$00:9323  80 17         bra $933c
$00:9325  a7 29         lda [$29]
$00:9327  29 ff 00      and #$00ff
$00:932a  c9 ff 00      cmp #$00ff
$00:932d  d0 01         bne $9330
$00:932f  60            rts
$00:9330  22 8a e6 00   jsl $00e68a
$00:9334  98            tya
$00:9335  9d 3e 00      sta $003e,x
$00:9338  8a            txa
$00:9339  99 3c 00      sta $003c,y
$00:933c  8c a8 06      sty $06a8
$00:933f  bb            tyx
$00:9340  a5 29         lda $29
$00:9342  9d 3a 00      sta $003a,x
$00:9345  18            clc
$00:9346  69 04 00      adc #$0004
$00:9349  85 29         sta $29
$00:934b  22 ab 93 00   jsl $0093ab
$00:934f  bd 16 00      lda $0016,x
$00:9352  89 80 00      bit #$0080
$00:9355  f0 ce         beq $9325
$00:9357  ad 7c 03      lda $037c
$00:935a  0d 7e 03      ora $037e
$00:935d  f0 3a         beq $9399
$00:935f  ad 7c 03      lda $037c
$00:9362  9d 00 00      sta $0000,x
$00:9365  ad 7e 03      lda $037e
$00:9368  18            clc
$00:9369  69 10 00      adc #$0010
$00:936c  9d 02 00      sta $0002,x
$00:936f  ad 80 03      lda $0380
$00:9372  9d 1e 00      sta $001e,x
$00:9375  9e 20 00      stz $0020,x
$00:9378  22 f3 88 00   jsl $0088f3  ; -> Sub_00_88f3
$00:937c  9e 14 00      stz $0014,x
$00:937f  ad 7c 03      lda $037c
$00:9382  9c 7c 03      stz $037c
$00:9385  4a            lsr a
$00:9386  4a            lsr a
$00:9387  4a            lsr a
$00:9388  4a            lsr a
$00:9389  8d 78 03      sta $0378
$00:938c  ad 7e 03      lda $037e
$00:938f  9c 7e 03      stz $037e
$00:9392  4a            lsr a
$00:9393  4a            lsr a
$00:9394  4a            lsr a
$00:9395  4a            lsr a
$00:9396  8d 7a 03      sta $037a
$00:9399  bd 00 00      lda $0000,x
$00:939c  8d 74 03      sta $0374
$00:939f  bd 02 00      lda $0002,x
$00:93a2  8d 76 03      sta $0376
$00:93a5  8e 9c 03      stx $039c
$00:93a8  82 7a ff      brl $9325
$00:93ab  9b            txy
$00:93ac  be 3a 00      ldx $003a,y
$00:93af  bf 00 00 01   lda $010000,x
$00:93b3  29 ff 00      and #$00ff
$00:93b6  0a            asl a
$00:93b7  0a            asl a
$00:93b8  0a            asl a
$00:93b9  0a            asl a
$00:93ba  99 00 00      sta $0000,y
$00:93bd  bf 01 00 01   lda $010001,x
$00:93c1  48            pha
$00:93c2  29 ff 00      and #$00ff
$00:93c5  0a            asl a
$00:93c6  0a            asl a
$00:93c7  0a            asl a
$00:93c8  0a            asl a
$00:93c9  18            clc
$00:93ca  69 10 00      adc #$0010
$00:93cd  99 02 00      sta $0002,y
$00:93d0  68            pla
$00:93d1  29 00 c1      and #$c100
$00:93d4  0d 72 03      ora $0372
$00:93d7  99 1c 00      sta $001c,y
$00:93da  e2 20         sep #$20
$00:93dc  bf 03 00 01   lda $010003,x
$00:93e0  eb            xba
$00:93e1  a9 0e         lda #$0e
$00:93e3  22 d1 b1 02   jsl $02b1d1  ; -> Sub_02_b1d1
$00:93e7  c2 20         rep #$20
$00:93e9  18            clc
$00:93ea  6d b0 03      adc $03b0
$00:93ed  aa            tax
$00:93ee  99 38 00      sta $0038,y
$00:93f1  e2 20         sep #$20
$00:93f3  bd 02 80      lda $8002,x
$00:93f6  99 25 00      sta $0025,y
$00:93f9  bd 05 80      lda $8005,x
$00:93fc  99 1e 00      sta $001e,y
$00:93ff  bd 0a 80      lda $800a,x
$00:9402  99 24 00      sta $0024,y
$00:9405  bd 0d 80      lda $800d,x
$00:9408  99 36 00      sta $0036,y
$00:940b  c2 20         rep #$20
$00:940d  bd 06 80      lda $8006,x
$00:9410  09 00 80      ora #$8000
$00:9413  99 16 00      sta $0016,y
$00:9416  bd 08 80      lda $8008,x
$00:9419  99 22 00      sta $0022,y
$00:941c  bd 0b 80      lda $800b,x
$00:941f  99 18 00      sta $0018,y
$00:9422  bb            tyx
$00:9423  bd 16 00      lda $0016,x
$00:9426  89 40 00      bit #$0040
$00:9429  d0 16         bne $9441
$00:942b  89 00 20      bit #$2000
$00:942e  f0 11         beq $9441
$00:9430  a9 10 00      lda #$0010
$00:9433  9d 0c 00      sta $000c,x
$00:9436  9d 0a 00      sta $000a,x
$00:9439  9e 08 00      stz $0008,x
$00:943c  9e 0e 00      stz $000e,x
$00:943f  80 04         bra $9445
$00:9441  22 f3 88 00   jsl $0088f3  ; -> Sub_00_88f3
$00:9445  9e 14 00      stz $0014,x
$00:9448  9e 04 00      stz $0004,x
$00:944b  9e 06 00      stz $0006,x
$00:944e  6b            rtl
$00:944f  08            php
$00:9450  da            phx
$00:9451  5a            phy
$00:9452  c2 20         rep #$20
$00:9454  da            phx
$00:9455  bf 03 02 7f   lda $7f0203,x
$00:9459  85 00         sta $00
$00:945b  b9 19 ba      lda $ba19,y
$00:945e  29 ff 00      and #$00ff
$00:9461  0a            asl a
$00:9462  0a            asl a
$00:9463  0a            asl a
$00:9464  0a            asl a
$00:9465  85 16         sta $16
$00:9467  b9 1a ba      lda $ba1a,y
$00:946a  29 ff 00      and #$00ff
$00:946d  1a            inc a
$00:946e  0a            asl a
$00:946f  0a            asl a
$00:9470  0a            asl a
$00:9471  0a            asl a
$00:9472  85 18         sta $18
$00:9474  bb            tyx
$00:9475  da            phx
$00:9476  ae a8 06      ldx $06a8
$00:9479  20 62 e6      jsr $e662  ; -> Sub_00_e662
$00:947c  fa            plx
$00:947d  a9 00 a0      lda #$a000
$00:9480  99 16 00      sta $0016,y
$00:9483  68            pla
$00:9484  99 34 00      sta $0034,y
$00:9487  a5 16         lda $16
$00:9489  99 00 00      sta $0000,y
$00:948c  a5 18         lda $18
$00:948e  99 02 00      sta $0002,y
$00:9491  bd 23 ba      lda $ba23,x
$00:9494  09 00 01      ora #$0100
$00:9497  0d 72 03      ora $0372
$00:949a  99 1c 00      sta $001c,y
$00:949d  99 30 00      sta $0030,y
$00:94a0  bd 1d ba      lda $ba1d,x
$00:94a3  99 18 00      sta $0018,y
$00:94a6  e2 20         sep #$20
$00:94a8  bd 1f ba      lda $ba1f,x
$00:94ab  99 36 00      sta $0036,y
$00:94ae  a5 00         lda $00
$00:94b0  99 2e 00      sta $002e,y
$00:94b3  99 2f 00      sta $002f,y
$00:94b6  c2 20         rep #$20
$00:94b8  bd 21 ba      lda $ba21,x
$00:94bb  29 ff 00      and #$00ff
$00:94be  99 26 00      sta $0026,y
$00:94c1  e2 20         sep #$20
$00:94c3  bd 22 ba      lda $ba22,x
$00:94c6  eb            xba
$00:94c7  a9 0e         lda #$0e
$00:94c9  22 d1 b1 02   jsl $02b1d1  ; -> Sub_02_b1d1
$00:94cd  c2 20         rep #$20
$00:94cf  18            clc
$00:94d0  6d b0 03      adc $03b0
$00:94d3  99 38 00      sta $0038,y
$00:94d6  aa            tax
$00:94d7  e2 20         sep #$20
$00:94d9  bd 02 80      lda $8002,x
$00:94dc  99 25 00      sta $0025,y
$00:94df  bd 05 80      lda $8005,x
$00:94e2  99 1e 00      sta $001e,y
$00:94e5  bd 0a 80      lda $800a,x
$00:94e8  99 24 00      sta $0024,y
$00:94eb  c2 20         rep #$20
$00:94ed  bd 08 80      lda $8008,x
$00:94f0  99 22 00      sta $0022,y
$00:94f3  a9 10 00      lda #$0010
$00:94f6  99 10 00      sta $0010,y
$00:94f9  99 12 00      sta $0012,y
$00:94fc  99 0c 00      sta $000c,y
$00:94ff  99 0a 00      sta $000a,y
$00:9502  a9 00 00      lda #$0000
$00:9505  99 08 00      sta $0008,y
$00:9508  99 0e 00      sta $000e,y
$00:950b  99 32 00      sta $0032,y
$00:950e  7a            ply
$00:950f  fa            plx
$00:9510  28            plp
Sub_00_9511:
$00:9511  6b            rtl
$00:9512  ad 64 04      lda $0464
$00:9515  f0 03         beq $951a
$00:9517  9c 22 03      stz $0322
$00:951a  ad 39 04      lda $0439
$00:951d  d0 05         bne $9524
$00:951f  ad 5e 1b      lda $1b5e
$00:9522  d0 0b         bne $952f
$00:9524  ac 9c 03      ldy $039c
$00:9527  a9 00 c0      lda #$c000
$00:952a  1c 22 03      trb $0322
$00:952d  80 30         bra $955f
$00:952f  20 a1 98      jsr $98a1
$00:9532  da            phx
$00:9533  3a            dec a
$00:9534  0a            asl a
$00:9535  aa            tax
$00:9536  bf ce e1 02   lda $02e1ce,x
$00:953a  cd 6a 1b      cmp $1b6a
$00:953d  f0 08         beq $9547
$00:953f  90 06         bcc $9547
$00:9541  a9 00 80      lda #$8000
$00:9544  1c 22 03      trb $0322
$00:9547  fa            plx
$00:9548  ac 9c 03      ldy $039c
$00:954b  b9 1e 00      lda $001e,y
$00:954e  38            sec
$00:954f  e9 14 00      sbc #$0014
$00:9552  c9 10 00      cmp #$0010
$00:9555  90 20         bcc $9577
$00:9557  ad 22 03      lda $0322
$00:955a  29 00 80      and #$8000
$00:955d  d0 19         bne $9578
$00:955f  b9 16 00      lda $0016,y
$00:9562  89 00 04      bit #$0400
$00:9565  d0 18         bne $957f
$00:9567  da            phx
$00:9568  b9 1e 00      lda $001e,y
$00:956b  0a            asl a
$00:956c  aa            tax
$00:956d  bf 88 95 00   lda $009588,x
$00:9571  fa            plx
$00:9572  2d 22 03      and $0322
$00:9575  f0 01         beq $9578
$00:9577  6b            rtl
$00:9578  a9 65 9a      lda #$9a65
$00:957b  99 18 00      sta $0018,y
$00:957e  6b            rtl
$00:957f  a9 65 9a      lda #$9a65
$00:9582  99 18 00      sta $0018,y
$00:9585  02 91         cop #$91
$00:9587  6b            rtl
$00:9588  00 04         brk #$04
$00:958a  00 08         brk #$08
$00:958c  00 02         brk #$02
$00:958e  00 01         brk #$01
$00:9590  00 04         brk #$04
$00:9592  00 08         brk #$08
$00:9594  00 08         brk #$08
$00:9596  00 04         brk #$04
$00:9598  00 02         brk #$02
$00:959a  00 01         brk #$01
$00:959c  00 01         brk #$01
$00:959e  00 02         brk #$02
$00:95a0  00 01         brk #$01
$00:95a2  00 02         brk #$02
$00:95a4  00 02         brk #$02
$00:95a6  00 01         brk #$01
$00:95a8  00 04         brk #$04
$00:95aa  00 08         brk #$08
$00:95ac  00 08         brk #$08
$00:95ae  00 04         brk #$04
$00:95b0  00 00         brk #$00
$00:95b2  00 00         brk #$00
$00:95b4  00 00         brk #$00
$00:95b6  00 00         brk #$00
$00:95b8  00 00         brk #$00
$00:95ba  00 00         brk #$00
$00:95bc  00 00         brk #$00
$00:95be  00 00         brk #$00
$00:95c0  00 00         brk #$00
$00:95c2  00 00         brk #$00
$00:95c4  00 00         brk #$00
$00:95c6  00 00         brk #$00
$00:95c8  00 00         brk #$00
$00:95ca  00 00         brk #$00
$00:95cc  00 00         brk #$00
$00:95ce  00 00         brk #$00
$00:95d0  00 01         brk #$01
$00:95d2  00 01         brk #$01
$00:95d4  00 02         brk #$02
$00:95d6  00 02         brk #$02
$00:95d8  00 04         brk #$04
$00:95da  00 04         brk #$04
$00:95dc  00 08         brk #$08
$00:95de  00 08         brk #$08
$00:95e0  bd 16 00      lda $0016,x
$00:95e3  09 10 00      ora #$0010
$00:95e6  9d 16 00      sta $0016,x
$00:95e9  02 91         cop #$91
$00:95eb  da            phx
$00:95ec  ae 9c 03      ldx $039c
$00:95ef  20 9c 96      jsr $969c
$00:95f2  90 3c         bcc $9630
$00:95f4  bd 04 00      lda $0004,x
$00:95f7  48            pha
$00:95f8  bd 06 00      lda $0006,x
$00:95fb  48            pha
$00:95fc  ad d4 03      lda $03d4
$00:95ff  9d 04 00      sta $0004,x
$00:9602  ad d6 03      lda $03d6
$00:9605  9d 06 00      sta $0006,x
$00:9608  22 28 8f 00   jsl $008f28
$00:960c  bd 04 00      lda $0004,x
$00:960f  8d d4 03      sta $03d4
$00:9612  18            clc
$00:9613  7d 00 00      adc $0000,x
$00:9616  9d 00 00      sta $0000,x
$00:9619  bd 06 00      lda $0006,x
$00:961c  8d d6 03      sta $03d6
$00:961f  18            clc
$00:9620  7d 02 00      adc $0002,x
$00:9623  9d 02 00      sta $0002,x
$00:9626  68            pla
$00:9627  9d 06 00      sta $0006,x
$00:962a  68            pla
$00:962b  9d 04 00      sta $0004,x
$00:962e  80 03         bra $9633
$00:9630  20 33 97      jsr $9733
$00:9633  ad 26 03      lda $0326
$00:9636  89 00 0f      bit #$0f00
$00:9639  d0 1c         bne $9657
$00:963b  ad d4 03      lda $03d4
$00:963e  d0 09         bne $9649
$00:9640  bd 00 00      lda $0000,x
$00:9643  29 fe ff      and #$fffe
$00:9646  9d 00 00      sta $0000,x
$00:9649  ad d6 03      lda $03d6
$00:964c  d0 09         bne $9657
$00:964e  bd 02 00      lda $0002,x
$00:9651  29 fe ff      and #$fffe
$00:9654  9d 02 00      sta $0002,x
$00:9657  9c d4 03      stz $03d4
$00:965a  9c d6 03      stz $03d6
$00:965d  bd 00 00      lda $0000,x
$00:9660  8d 74 03      sta $0374
$00:9663  4a            lsr a
$00:9664  4a            lsr a
$00:9665  4a            lsr a
$00:9666  4a            lsr a
$00:9667  8d 78 03      sta $0378
$00:966a  bd 02 00      lda $0002,x
$00:966d  8d 76 03      sta $0376
$00:9670  4a            lsr a
$00:9671  4a            lsr a
$00:9672  4a            lsr a
$00:9673  4a            lsr a
$00:9674  3a            dec a
$00:9675  8d 7a 03      sta $037a
$00:9678  ac 9e 03      ldy $039e
$00:967b  bd 00 00      lda $0000,x
$00:967e  99 00 00      sta $0000,y
$00:9681  bd 02 00      lda $0002,x
$00:9684  99 02 00      sta $0002,y
$00:9687  bd 1e 00      lda $001e,x
$00:968a  0a            asl a
$00:968b  aa            tax
$00:968c  bd d7 fa      lda $fad7,x
$00:968f  18            clc
$00:9690  79 02 00      adc $0002,y
$00:9693  99 02 00      sta $0002,y
$00:9696  22 00 80 02   jsl $028000  ; -> GameLoop_Main
$00:969a  fa            plx
$00:969b  6b            rtl
$00:969c  bd 00 00      lda $0000,x
$00:969f  8d 74 03      sta $0374
$00:96a2  4a            lsr a
$00:96a3  4a            lsr a
$00:96a4  4a            lsr a
$00:96a5  4a            lsr a
$00:96a6  8d 78 03      sta $0378
$00:96a9  bd 02 00      lda $0002,x
$00:96ac  8d 76 03      sta $0376
$00:96af  4a            lsr a
$00:96b0  4a            lsr a
$00:96b1  4a            lsr a
$00:96b2  4a            lsr a
$00:96b3  3a            dec a
$00:96b4  8d 7a 03      sta $037a
$00:96b7  18            clc
$00:96b8  ac d8 03      ldy $03d8
$00:96bb  d0 01         bne $96be
$00:96bd  60            rts
$00:96be  ad a6 03      lda $03a6
$00:96c1  f0 01         beq $96c4
$00:96c3  60            rts
$00:96c4  bd 00 00      lda $0000,x
$00:96c7  18            clc
$00:96c8  69 0f 00      adc #$000f
$00:96cb  4a            lsr a
$00:96cc  4a            lsr a
$00:96cd  4a            lsr a
$00:96ce  4a            lsr a
$00:96cf  85 16         sta $16
$00:96d1  bd 02 00      lda $0002,x
$00:96d4  3a            dec a
$00:96d5  4a            lsr a
$00:96d6  4a            lsr a
$00:96d7  4a            lsr a
$00:96d8  4a            lsr a
$00:96d9  85 18         sta $18
$00:96db  e2 20         sep #$20
$00:96dd  8b            phb
$00:96de  ad da 03      lda $03da
$00:96e1  48            pha
$00:96e2  ab            plb
$00:96e3  b9 00 00      lda $0000,y
$00:96e6  1a            inc a
$00:96e7  f0 3c         beq $9725
$00:96e9  a5 16         lda $16
$00:96eb  d9 00 00      cmp $0000,y
$00:96ee  90 29         bcc $9719
$00:96f0  ad 78 03      lda $0378
$00:96f3  d9 01 00      cmp $0001,y
$00:96f6  b0 21         bcs $9719
$00:96f8  a5 18         lda $18
$00:96fa  d9 02 00      cmp $0002,y
$00:96fd  90 1a         bcc $9719
$00:96ff  ad 7a 03      lda $037a
$00:9702  d9 03 00      cmp $0003,y
$00:9705  b0 12         bcs $9719
$00:9707  c2 20         rep #$20
$00:9709  b9 04 00      lda $0004,y
$00:970c  f0 03         beq $9711
$00:970e  8d d4 03      sta $03d4
$00:9711  b9 06 00      lda $0006,y
$00:9714  f0 03         beq $9719
$00:9716  8d d6 03      sta $03d6
$00:9719  c2 20         rep #$20
$00:971b  98            tya
$00:971c  18            clc
$00:971d  69 08 00      adc #$0008
$00:9720  a8            tay
$00:9721  e2 20         sep #$20
$00:9723  80 be         bra $96e3
$00:9725  c2 20         rep #$20
$00:9727  ab            plb
$00:9728  38            sec
$00:9729  ad d4 03      lda $03d4
$00:972c  0d d6 03      ora $03d6
$00:972f  d0 01         bne $9732
$00:9731  18            clc
$00:9732  60            rts
$00:9733  bd 16 00      lda $0016,x
$00:9736  89 04 00      bit #$0004
$00:9739  d0 01         bne $973c
$00:973b  60            rts
$00:973c  20 92 98      jsr $9892
$00:973f  90 01         bcc $9742
$00:9741  60            rts
$00:9742  29 ff 00      and #$00ff
$00:9745  f0 0d         beq $9754
$00:9747  3a            dec a
$00:9748  f0 57         beq $97a1
$00:974a  3a            dec a
$00:974b  d0 03         bne $9750
$00:974d  82 9a 00      brl $97ea
$00:9750  82 eb 00      brl $983e
$00:9753  60            rts
$00:9754  ad 22 03      lda $0322
$00:9757  89 00 08      bit #$0800
$00:975a  d0 01         bne $975d
$00:975c  60            rts
$00:975d  9b            txy
$00:975e  bd 00 00      lda $0000,x
$00:9761  29 0f 00      and #$000f
$00:9764  f0 28         beq $978e
$00:9766  bd 00 00      lda $0000,x
$00:9769  85 16         sta $16
$00:976b  bd 02 00      lda $0002,x
$00:976e  38            sec
$00:976f  e9 20 00      sbc #$0020
$00:9772  85 18         sta $18
$00:9774  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:9778  bf 00 80 7f   lda $7f8000,x
$00:977c  29 fc 00      and #$00fc
$00:977f  f0 0f         beq $9790
$00:9781  22 1a f3 04   jsl $04f31a  ; -> Sub_04_f31a
$00:9785  bf 00 80 7f   lda $7f8000,x
$00:9789  29 fc 00      and #$00fc
$00:978c  f0 07         beq $9795
$00:978e  bb            tyx
$00:978f  60            rts
$00:9790  a9 fe ff      lda #$fffe
$00:9793  80 03         bra $9798
$00:9795  a9 02 00      lda #$0002
$00:9798  bb            tyx
$00:9799  18            clc
$00:979a  7d 00 00      adc $0000,x
$00:979d  9d 00 00      sta $0000,x
$00:97a0  60            rts
$00:97a1  ad 22 03      lda $0322
$00:97a4  89 00 04      bit #$0400
$00:97a7  d0 01         bne $97aa
$00:97a9  60            rts
$00:97aa  9b            txy
$00:97ab  bd 00 00      lda $0000,x
$00:97ae  29 0f 00      and #$000f
$00:97b1  f0 24         beq $97d7
$00:97b3  bd 00 00      lda $0000,x
$00:97b6  85 16         sta $16
$00:97b8  bd 02 00      lda $0002,x
$00:97bb  85 18         sta $18
$00:97bd  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:97c1  bf 00 80 7f   lda $7f8000,x
$00:97c5  29 f3 00      and #$00f3
$00:97c8  f0 0f         beq $97d9
$00:97ca  22 1a f3 04   jsl $04f31a  ; -> Sub_04_f31a
$00:97ce  bf 00 80 7f   lda $7f8000,x
$00:97d2  29 f3 00      and #$00f3
$00:97d5  f0 07         beq $97de
$00:97d7  bb            tyx
$00:97d8  60            rts
$00:97d9  a9 fe ff      lda #$fffe
$00:97dc  80 03         bra $97e1
$00:97de  a9 02 00      lda #$0002
$00:97e1  bb            tyx
$00:97e2  18            clc
$00:97e3  7d 00 00      adc $0000,x
$00:97e6  9d 00 00      sta $0000,x
$00:97e9  60            rts
$00:97ea  ad 22 03      lda $0322
$00:97ed  89 00 01      bit #$0100
$00:97f0  d0 01         bne $97f3
$00:97f2  60            rts
$00:97f3  9b            txy
$00:97f4  bd 02 00      lda $0002,x
$00:97f7  29 0f 00      and #$000f
$00:97fa  f0 2f         beq $982b
$00:97fc  bd 00 00      lda $0000,x
$00:97ff  18            clc
$00:9800  69 10 00      adc #$0010
$00:9803  85 16         sta $16
$00:9805  bd 02 00      lda $0002,x
$00:9808  29 f0 ff      and #$fff0
$00:980b  38            sec
$00:980c  e9 10 00      sbc #$0010
$00:980f  85 18         sta $18
$00:9811  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:9815  bf 00 80 7f   lda $7f8000,x
$00:9819  29 f5 00      and #$00f5
$00:981c  f0 0f         beq $982d
$00:981e  22 31 f3 04   jsl $04f331  ; -> Sub_04_f331
$00:9822  bf 00 80 7f   lda $7f8000,x
$00:9826  29 f5 00      and #$00f5
$00:9829  f0 07         beq $9832
$00:982b  bb            tyx
$00:982c  60            rts
$00:982d  a9 fe ff      lda #$fffe
$00:9830  80 03         bra $9835
$00:9832  a9 02 00      lda #$0002
$00:9835  bb            tyx
$00:9836  18            clc
$00:9837  7d 02 00      adc $0002,x
$00:983a  9d 02 00      sta $0002,x
$00:983d  60            rts
$00:983e  ad 22 03      lda $0322
$00:9841  89 00 02      bit #$0200
$00:9844  d0 01         bne $9847
$00:9846  60            rts
$00:9847  9b            txy
$00:9848  bd 02 00      lda $0002,x
$00:984b  29 0f 00      and #$000f
$00:984e  f0 2f         beq $987f
$00:9850  bd 00 00      lda $0000,x
$00:9853  38            sec
$00:9854  e9 10 00      sbc #$0010
$00:9857  85 16         sta $16
$00:9859  bd 02 00      lda $0002,x
$00:985c  29 f0 ff      and #$fff0
$00:985f  38            sec
$00:9860  e9 10 00      sbc #$0010
$00:9863  85 18         sta $18
$00:9865  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:9869  bf 00 80 7f   lda $7f8000,x
$00:986d  29 fa 00      and #$00fa
$00:9870  f0 0f         beq $9881
$00:9872  22 31 f3 04   jsl $04f331  ; -> Sub_04_f331
$00:9876  bf 00 80 7f   lda $7f8000,x
$00:987a  29 fa 00      and #$00fa
$00:987d  f0 07         beq $9886
$00:987f  bb            tyx
$00:9880  60            rts
$00:9881  a9 fe ff      lda #$fffe
$00:9884  80 03         bra $9889
$00:9886  a9 02 00      lda #$0002
$00:9889  bb            tyx
$00:988a  18            clc
$00:988b  7d 02 00      adc $0002,x
$00:988e  9d 02 00      sta $0002,x
$00:9891  60            rts
$00:9892  bc 1e 00      ldy $001e,x
$00:9895  c0 2c 00      cpy #$002c
$00:9898  b0 05         bcs $989f
$00:989a  b9 ab fa      lda $faab,y
$00:989d  18            clc
$00:989e  60            rts
$00:989f  38            sec
$00:98a0  60            rts
$00:98a1  da            phx
$00:98a2  48            pha
$00:98a3  ac 9c 03      ldy $039c
$00:98a6  b9 1e 00      lda $001e,y
$00:98a9  c9 04 00      cmp #$0004
$00:98ac  b0 3a         bcs $98e8
$00:98ae  85 00         sta $00
$00:98b0  b9 00 00      lda $0000,y
$00:98b3  18            clc
$00:98b4  69 08 00      adc #$0008
$00:98b7  85 16         sta $16
$00:98b9  b9 02 00      lda $0002,y
$00:98bc  18            clc
$00:98bd  69 08 00      adc #$0008
$00:98c0  85 18         sta $18
$00:98c2  ad a6 06      lda $06a6
$00:98c5  80 03         bra $98ca
$00:98c7  bd 3e 00      lda $003e,x
$00:98ca  aa            tax
$00:98cb  f0 1b         beq $98e8
$00:98cd  bd 16 00      lda $0016,x
$00:98d0  30 f5         bmi $98c7
$00:98d2  89 00 40      bit #$4000
$00:98d5  f0 f0         beq $98c7
$00:98d7  bd 1e 00      lda $001e,x
$00:98da  38            sec
$00:98db  e9 04 00      sbc #$0004
$00:98de  c9 03 00      cmp #$0003
$00:98e1  b0 e4         bcs $98c7
$00:98e3  20 eb 98      jsr $98eb
$00:98e6  80 df         bra $98c7
$00:98e8  68            pla
$00:98e9  fa            plx
$00:98ea  60            rts
$00:98eb  a5 00         lda $00
$00:98ed  f0 34         beq $9923
$00:98ef  3a            dec a
$00:98f0  f0 06         beq $98f8
$00:98f2  3a            dec a
$00:98f3  f0 59         beq $994e
$00:98f5  82 81 00      brl $9979
$00:98f8  bd 02 00      lda $0002,x
$00:98fb  c5 18         cmp $18
$00:98fd  90 01         bcc $9900
$00:98ff  60            rts
$00:9900  a5 16         lda $16
$00:9902  38            sec
$00:9903  fd 00 00      sbc $0000,x
$00:9906  c9 11 00      cmp #$0011
$00:9909  90 01         bcc $990c
$00:990b  60            rts
$00:990c  bd 1e 00      lda $001e,x
$00:990f  c9 06 00      cmp #$0006
$00:9912  f0 0b         beq $991f
$00:9914  c9 05 00      cmp #$0005
$00:9917  f0 03         beq $991c
$00:9919  fe 02 00      inc $0002,x
$00:991c  fe 02 00      inc $0002,x
$00:991f  fe 02 00      inc $0002,x
$00:9922  60            rts
$00:9923  bd 02 00      lda $0002,x
$00:9926  c5 18         cmp $18
$00:9928  b0 01         bcs $992b
$00:992a  60            rts
$00:992b  a5 16         lda $16
$00:992d  38            sec
$00:992e  fd 00 00      sbc $0000,x
$00:9931  c9 11 00      cmp #$0011
$00:9934  90 01         bcc $9937
$00:9936  60            rts
$00:9937  bd 1e 00      lda $001e,x
$00:993a  c9 06 00      cmp #$0006
$00:993d  f0 0b         beq $994a
$00:993f  c9 05 00      cmp #$0005
$00:9942  f0 03         beq $9947
$00:9944  de 02 00      dec $0002,x
$00:9947  de 02 00      dec $0002,x
$00:994a  de 02 00      dec $0002,x
$00:994d  60            rts
$00:994e  bd 00 00      lda $0000,x
$00:9951  c5 16         cmp $16
$00:9953  90 01         bcc $9956
$00:9955  60            rts
$00:9956  a5 18         lda $18
$00:9958  38            sec
$00:9959  fd 02 00      sbc $0002,x
$00:995c  c9 11 00      cmp #$0011
$00:995f  90 01         bcc $9962
$00:9961  60            rts
$00:9962  bd 1e 00      lda $001e,x
$00:9965  c9 06 00      cmp #$0006
$00:9968  f0 0b         beq $9975
$00:996a  c9 05 00      cmp #$0005
$00:996d  f0 03         beq $9972
$00:996f  fe 00 00      inc $0000,x
$00:9972  fe 00 00      inc $0000,x
$00:9975  fe 00 00      inc $0000,x
$00:9978  60            rts
$00:9979  bd 00 00      lda $0000,x
$00:997c  c5 16         cmp $16
$00:997e  b0 01         bcs $9981
$00:9980  60            rts
$00:9981  a5 18         lda $18
$00:9983  38            sec
$00:9984  fd 02 00      sbc $0002,x
$00:9987  c9 11 00      cmp #$0011
$00:998a  90 01         bcc $998d
$00:998c  60            rts
$00:998d  bd 1e 00      lda $001e,x
$00:9990  c9 06 00      cmp #$0006
$00:9993  f0 0b         beq $99a0
$00:9995  c9 05 00      cmp #$0005
$00:9998  f0 03         beq $999d
$00:999a  de 00 00      dec $0000,x
$00:999d  de 00 00      dec $0000,x
$00:99a0  de 00 00      dec $0000,x
$00:99a3  60            rts
$00:99a4  02 91         cop #$91
$00:99a6  ad 80 03      lda $0380
$00:99a9  f0 01         beq $99ac
$00:99ab  6b            rtl
$00:99ac  da            phx
$00:99ad  ad 05 04      lda $0405
$00:99b0  0a            asl a
$00:99b1  aa            tax
$00:99b2  bf 83 04 7f   lda $7f0483,x
$00:99b6  fa            plx
$00:99b7  a8            tay
$00:99b8  d0 01         bne $99bb
$00:99ba  6b            rtl
$00:99bb  bd 00 00      lda $0000,x
$00:99be  38            sec
$00:99bf  f9 00 00      sbc $0000,y
$00:99c2  30 1f         bmi $99e3
$00:99c4  85 16         sta $16
$00:99c6  bd 02 00      lda $0002,x
$00:99c9  38            sec
$00:99ca  f9 02 00      sbc $0002,y
$00:99cd  30 08         bmi $99d7
$00:99cf  85 18         sta $18
$00:99d1  c5 16         cmp $16
$00:99d3  b0 3b         bcs $9a10
$00:99d5  80 34         bra $9a0b
$00:99d7  49 ff ff      eor #$ffff
$00:99da  1a            inc a
$00:99db  85 18         sta $18
$00:99dd  c5 16         cmp $16
$00:99df  b0 25         bcs $9a06
$00:99e1  80 28         bra $9a0b
$00:99e3  49 ff ff      eor #$ffff
$00:99e6  1a            inc a
$00:99e7  85 16         sta $16
$00:99e9  bd 02 00      lda $0002,x
$00:99ec  38            sec
$00:99ed  f9 02 00      sbc $0002,y
$00:99f0  30 08         bmi $99fa
$00:99f2  85 18         sta $18
$00:99f4  c5 16         cmp $16
$00:99f6  b0 18         bcs $9a10
$00:99f8  80 1b         bra $9a15
$00:99fa  49 ff ff      eor #$ffff
$00:99fd  1a            inc a
$00:99fe  85 18         sta $18
$00:9a00  c5 16         cmp $16
$00:9a02  b0 02         bcs $9a06
$00:9a04  80 0f         bra $9a15
$00:9a06  a9 00 00      lda #$0000
$00:9a09  80 0d         bra $9a18
$00:9a0b  a9 02 00      lda #$0002
$00:9a0e  80 08         bra $9a18
$00:9a10  a9 01 00      lda #$0001
$00:9a13  80 03         bra $9a18
$00:9a15  a9 03 00      lda #$0003
$00:9a18  9d 1e 00      sta $001e,x
$00:9a1b  9e 20 00      stz $0020,x
$00:9a1e  22 f3 88 00   jsl $0088f3  ; -> Sub_00_88f3
$00:9a22  9e 14 00      stz $0014,x
$00:9a25  02 91         cop #$91
$00:9a27  6b            rtl
$00:9a28  8e 9c 03      stx $039c
$00:9a2b  02 a9         cop #$a9
$00:9a2d  00 30         brk #$30
$00:9a2f  7f 02 84 56   adc $568402,x
$00:9a33  af 00 ad fb   lda $fbad00
$00:9a37  03 f0         ora $f0,s
$00:9a39  03 82         ora $82,s
$00:9a3b  67 ff         adc [$ff]
$00:9a3d  02 84         cop #$84
$00:9a3f  e0 9f 00      cpx #$009f
$00:9a42  b9 16 00      lda $0016,y
$00:9a45  29 7f cf      and #$cf7f
$00:9a48  09 10 03      ora #$0310
$00:9a4b  99 16 00      sta $0016,y
$00:9a4e  8c a0 03      sty $03a0
$00:9a51  02 84         cop #$84
$00:9a53  12 95         ora ($95)
$00:9a55  00 02         brk #$02
$00:9a57  85 e0         sta $e0
$00:9a59  95 00         sta $00,x
$00:9a5b  02 85         cop #$85
$00:9a5d  cf 9f 00 8c   cmp $8c009f
$00:9a61  9e 03 02      stz $0203,x
$00:9a64  91 bd         sta ($bd),y
$00:9a66  16 00         asl $00,x
$00:9a68  89 00 04      bit #$0400
$00:9a6b  f0 03         beq $9a70
$00:9a6d  82 63 04      brl $9ed3
$00:9a70  ad 39 04      lda $0439
$00:9a73  d0 05         bne $9a7a
$00:9a75  ad 5e 1b      lda $1b5e
$00:9a78  d0 53         bne $9acd
$00:9a7a  ad 22 03      lda $0322
$00:9a7d  89 30 00      bit #$0030
$00:9a80  d0 1c         bne $9a9e
$00:9a82  49 ff ff      eor #$ffff
$00:9a85  eb            xba
$00:9a86  4a            lsr a
$00:9a87  b0 03         bcs $9a8c
$00:9a89  82 81 03      brl $9e0d
$00:9a8c  4a            lsr a
$00:9a8d  b0 03         bcs $9a92
$00:9a8f  82 5d 03      brl $9def
$00:9a92  4a            lsr a
$00:9a93  b0 03         bcs $9a98
$00:9a95  82 39 03      brl $9dd1
$00:9a98  4a            lsr a
$00:9a99  b0 03         bcs $9a9e
$00:9a9b  82 15 03      brl $9db3
$00:9a9e  da            phx
$00:9a9f  bd 1e 00      lda $001e,x
$00:9aa2  0a            asl a
$00:9aa3  18            clc
$00:9aa4  7d 1e 00      adc $001e,x
$00:9aa7  0a            asl a
$00:9aa8  0a            asl a
$00:9aa9  aa            tax
$00:9aaa  ad 22 03      lda $0322
$00:9aad  e8            inx
$00:9aae  e8            inx
$00:9aaf  eb            xba
$00:9ab0  4a            lsr a
$00:9ab1  b0 11         bcs $9ac4
$00:9ab3  e8            inx
$00:9ab4  e8            inx
$00:9ab5  4a            lsr a
$00:9ab6  b0 0c         bcs $9ac4
$00:9ab8  e8            inx
$00:9ab9  e8            inx
$00:9aba  4a            lsr a
$00:9abb  b0 07         bcs $9ac4
$00:9abd  e8            inx
$00:9abe  e8            inx
$00:9abf  4a            lsr a
$00:9ac0  b0 02         bcs $9ac4
$00:9ac2  e8            inx
$00:9ac3  e8            inx
Sub_00_9ac4:
$00:9ac4  bf 2b 9b 00   lda $009b2b,x
$00:9ac8  fa            plx
$00:9ac9  3a            dec a
$00:9aca  48            pha
$00:9acb  18            clc
$00:9acc  60            rts
$00:9acd  ad 22 03      lda $0322
$00:9ad0  89 30 80      bit #$8030
$00:9ad3  d0 19         bne $9aee
$00:9ad5  eb            xba
$00:9ad6  4a            lsr a
$00:9ad7  90 03         bcc $9adc
$00:9ad9  82 31 03      brl $9e0d
$00:9adc  4a            lsr a
$00:9add  90 03         bcc $9ae2
$00:9adf  82 0d 03      brl $9def
$00:9ae2  4a            lsr a
$00:9ae3  90 03         bcc $9ae8
$00:9ae5  82 e9 02      brl $9dd1
$00:9ae8  4a            lsr a
$00:9ae9  90 03         bcc $9aee
$00:9aeb  82 c5 02      brl $9db3
$00:9aee  da            phx
$00:9aef  bd 1e 00      lda $001e,x
$00:9af2  0a            asl a
$00:9af3  18            clc
$00:9af4  7d 1e 00      adc $001e,x
$00:9af7  0a            asl a
$00:9af8  0a            asl a
$00:9af9  aa            tax
$00:9afa  ad 22 03      lda $0322
$00:9afd  89 00 80      bit #$8000
$00:9b00  d0 17         bne $9b19
$00:9b02  e8            inx
$00:9b03  e8            inx
$00:9b04  eb            xba
$00:9b05  4a            lsr a
$00:9b06  b0 11         bcs $9b19
$00:9b08  e8            inx
$00:9b09  e8            inx
$00:9b0a  4a            lsr a
$00:9b0b  b0 0c         bcs $9b19
$00:9b0d  e8            inx
$00:9b0e  e8            inx
$00:9b0f  4a            lsr a
$00:9b10  b0 07         bcs $9b19
$00:9b12  e8            inx
$00:9b13  e8            inx
$00:9b14  4a            lsr a
$00:9b15  b0 02         bcs $9b19
$00:9b17  e8            inx
$00:9b18  e8            inx
$00:9b19  18            clc
$00:9b1a  ad 22 03      lda $0322
$00:9b1d  89 30 00      bit #$0030
$00:9b20  d0 01         bne $9b23
$00:9b22  38            sec
$00:9b23  bf 2b 9b 00   lda $009b2b,x
$00:9b27  fa            plx
$00:9b28  3a            dec a
$00:9b29  48            pha
$00:9b2a  60            rts
$00:9b2b  1b            tcs
$00:9b2c  9f b7 9e 8d   sta $8d9eb7,x
$00:9b30  9e d1 9d      stz $9dd1,x
$00:9b33  2b            pld
$00:9b34  9e 59 9d      stz $9d59,x
$00:9b37  fb            xce
$00:9b38  9e a9 9e      stz $9ea9,x
$00:9b3b  7f 9e 55 9e   adc $9e559e,x
$00:9b3f  b3 9d         lda ($9d,s),y
$00:9b41  3b            tsc
$00:9b42  9d 3b 9f      sta $9f3b,x
$00:9b45  c5 9e         cmp $9e
$00:9b47  ef 9d 63 9e   sbc $9e639d
$00:9b4b  39 9e 77      and $779e,y
$00:9b4e  9d 5b 9f      sta $9f5b,x
$00:9b51  0d 9e 9b      ora $9b9e
$00:9b54  9e 71 9e      stz $9e71,x
$00:9b57  47 9e         eor [$9e]
$00:9b59  95 9d         sta $9d,x
$00:9b5b  1b            tcs
$00:9b5c  9f b7 9e 8d   sta $8d9eb7,x
$00:9b60  9e d1 9d      stz $9dd1,x
$00:9b63  2b            pld
$00:9b64  9e 59 9d      stz $9d59,x
$00:9b67  1b            tcs
$00:9b68  9f b7 9e 8d   sta $8d9eb7,x
$00:9b6c  9e d1 9d      stz $9dd1,x
$00:9b6f  2b            pld
$00:9b70  9e 59 9d      stz $9d59,x
$00:9b73  fb            xce
$00:9b74  9e a9 9e      stz $9ea9,x
$00:9b77  7f 9e 55 9e   adc $9e559e,x
$00:9b7b  b3 9d         lda ($9d,s),y
$00:9b7d  3b            tsc
$00:9b7e  9d fb 9e      sta $9efb,x
$00:9b81  a9 9e 7f      lda #$7f9e
$00:9b84  9e 55 9e      stz $9e55,x
$00:9b87  b3 9d         lda ($9d,s),y
$00:9b89  3b            tsc
$00:9b8a  9d 3b 9f      sta $9f3b,x
$00:9b8d  c5 9e         cmp $9e
$00:9b8f  ef 9d 63 9e   sbc $9e639d
$00:9b93  39 9e 77      and $779e,y
$00:9b96  9d 3b 9f      sta $9f3b,x
$00:9b99  c5 9e         cmp $9e
$00:9b9b  ef 9d 63 9e   sbc $9e639d
$00:9b9f  39 9e 77      and $779e,y
$00:9ba2  9d 5b 9f      sta $9f5b,x
$00:9ba5  0d 9e 9b      ora $9b9e
$00:9ba8  9e 71 9e      stz $9e71,x
$00:9bab  47 9e         eor [$9e]
$00:9bad  95 9d         sta $9d,x
$00:9baf  5b            tcd
$00:9bb0  9f 0d 9e 9b   sta $9b9e0d,x
$00:9bb4  9e 71 9e      stz $9e71,x
$00:9bb7  47 9e         eor [$9e]
$00:9bb9  95 9d         sta $9d,x
$00:9bbb  1b            tcs
$00:9bbc  9f b7 9e 8d   sta $8d9eb7,x
$00:9bc0  9e d1 9d      stz $9dd1,x
$00:9bc3  2b            pld
$00:9bc4  9e 59 9d      stz $9d59,x
$00:9bc7  1b            tcs
$00:9bc8  9f b7 9e 8d   sta $8d9eb7,x
$00:9bcc  9e d1 9d      stz $9dd1,x
$00:9bcf  2b            pld
$00:9bd0  9e 59 9d      stz $9d59,x
$00:9bd3  fb            xce
$00:9bd4  9e a9 9e      stz $9ea9,x
$00:9bd7  7f 9e 55 9e   adc $9e559e,x
$00:9bdb  b3 9d         lda ($9d,s),y
$00:9bdd  3b            tsc
$00:9bde  9d fb 9e      sta $9efb,x
$00:9be1  a9 9e 7f      lda #$7f9e
$00:9be4  9e 55 9e      stz $9e55,x
$00:9be7  b3 9d         lda ($9d,s),y
$00:9be9  3b            tsc
$00:9bea  9d 3b 9f      sta $9f3b,x
$00:9bed  c5 9e         cmp $9e
$00:9bef  ef 9d 63 9e   sbc $9e639d
$00:9bf3  39 9e 77      and $779e,y
$00:9bf6  9d 3b 9f      sta $9f3b,x
$00:9bf9  c5 9e         cmp $9e
$00:9bfb  ef 9d 63 9e   sbc $9e639d
$00:9bff  39 9e 77      and $779e,y
$00:9c02  9d 5b 9f      sta $9f5b,x
$00:9c05  0d 9e 9b      ora $9b9e
$00:9c08  9e 71 9e      stz $9e71,x
$00:9c0b  47 9e         eor [$9e]
$00:9c0d  95 9d         sta $9d,x
$00:9c0f  5b            tcd
$00:9c10  9f 0d 9e 9b   sta $9b9e0d,x
$00:9c14  9e 71 9e      stz $9e71,x
$00:9c17  47 9e         eor [$9e]
$00:9c19  95 9d         sta $9d,x
$00:9c1b  3b            tsc
$00:9c1c  9d 3b 9d      sta $9d3b,x
$00:9c1f  3b            tsc
$00:9c20  9d 3b 9d      sta $9d3b,x
$00:9c23  3b            tsc
$00:9c24  9d 3b 9d      sta $9d3b,x
$00:9c27  3b            tsc
$00:9c28  9d 3b 9d      sta $9d3b,x
$00:9c2b  3b            tsc
$00:9c2c  9d 3b 9d      sta $9d3b,x
$00:9c2f  3b            tsc
$00:9c30  9d 3b 9d      sta $9d3b,x
$00:9c33  3b            tsc
$00:9c34  9d 3b 9d      sta $9d3b,x
$00:9c37  3b            tsc
$00:9c38  9d 3b 9d      sta $9d3b,x
$00:9c3b  3b            tsc
$00:9c3c  9d 3b 9d      sta $9d3b,x
$00:9c3f  3b            tsc
$00:9c40  9d 3b 9d      sta $9d3b,x
$00:9c43  3b            tsc
$00:9c44  9d 3b 9d      sta $9d3b,x
$00:9c47  3b            tsc
$00:9c48  9d 3b 9d      sta $9d3b,x
$00:9c4b  3b            tsc
$00:9c4c  9d 3b 9d      sta $9d3b,x
$00:9c4f  3b            tsc
$00:9c50  9d 3b 9d      sta $9d3b,x
$00:9c53  3b            tsc
$00:9c54  9d 3b 9d      sta $9d3b,x
$00:9c57  3b            tsc
$00:9c58  9d 3b 9d      sta $9d3b,x
$00:9c5b  3b            tsc
$00:9c5c  9d 3b 9d      sta $9d3b,x
$00:9c5f  3b            tsc
$00:9c60  9d 3b 9d      sta $9d3b,x
$00:9c63  3b            tsc
$00:9c64  9d 3b 9d      sta $9d3b,x
$00:9c67  3b            tsc
$00:9c68  9d 3b 9d      sta $9d3b,x
$00:9c6b  3b            tsc
$00:9c6c  9d 3b 9d      sta $9d3b,x
$00:9c6f  3b            tsc
$00:9c70  9d 3b 9d      sta $9d3b,x
$00:9c73  3b            tsc
$00:9c74  9d 3b 9d      sta $9d3b,x
$00:9c77  3b            tsc
$00:9c78  9d 3b 9d      sta $9d3b,x
$00:9c7b  3b            tsc
$00:9c7c  9d 3b 9d      sta $9d3b,x
$00:9c7f  3b            tsc
$00:9c80  9d 3b 9d      sta $9d3b,x
$00:9c83  3b            tsc
$00:9c84  9d 3b 9d      sta $9d3b,x
$00:9c87  3b            tsc
$00:9c88  9d 3b 9d      sta $9d3b,x
$00:9c8b  3b            tsc
$00:9c8c  9d 3b 9d      sta $9d3b,x
$00:9c8f  3b            tsc
$00:9c90  9d 3b 9d      sta $9d3b,x
$00:9c93  3b            tsc
$00:9c94  9d 3b 9d      sta $9d3b,x
$00:9c97  3b            tsc
$00:9c98  9d 3b 9d      sta $9d3b,x
$00:9c9b  3b            tsc
$00:9c9c  9d 3b 9d      sta $9d3b,x
$00:9c9f  3b            tsc
$00:9ca0  9d 3b 9d      sta $9d3b,x
$00:9ca3  3b            tsc
$00:9ca4  9d 3b 9d      sta $9d3b,x
$00:9ca7  3b            tsc
$00:9ca8  9d 3b 9d      sta $9d3b,x
$00:9cab  1b            tcs
$00:9cac  9f b7 9e 8d   sta $8d9eb7,x
$00:9cb0  9e d1 9d      stz $9dd1,x
$00:9cb3  2b            pld
$00:9cb4  9e 59 9d      stz $9d59,x
$00:9cb7  fb            xce
$00:9cb8  9e a9 9e      stz $9ea9,x
$00:9cbb  7f 9e 55 9e   adc $9e559e,x
$00:9cbf  b3 9d         lda ($9d,s),y
$00:9cc1  3b            tsc
$00:9cc2  9d 3b 9f      sta $9f3b,x
$00:9cc5  c5 9e         cmp $9e
$00:9cc7  ef 9d 63 9e   sbc $9e639d
$00:9ccb  39 9e 77      and $779e,y
$00:9cce  9d 5b 9f      sta $9f5b,x
$00:9cd1  0d 9e 9b      ora $9b9e
$00:9cd4  9e 71 9e      stz $9e71,x
$00:9cd7  47 9e         eor [$9e]
$00:9cd9  95 9d         sta $9d,x
$00:9cdb  5b            tcd
$00:9cdc  9f 0d 9e 9b   sta $9b9e0d,x
$00:9ce0  9e 71 9e      stz $9e71,x
$00:9ce3  47 9e         eor [$9e]
$00:9ce5  95 9d         sta $9d,x
$00:9ce7  5b            tcd
$00:9ce8  9f 0d 9e 9b   sta $9b9e0d,x
$00:9cec  9e 71 9e      stz $9e71,x
$00:9cef  47 9e         eor [$9e]
$00:9cf1  95 9d         sta $9d,x
$00:9cf3  3b            tsc
$00:9cf4  9f c5 9e ef   sta $ef9ec5,x
$00:9cf8  9d 63 9e      sta $9e63,x
$00:9cfb  39 9e 77      and $779e,y
$00:9cfe  9d 3b 9f      sta $9f3b,x
$00:9d01  c5 9e         cmp $9e
$00:9d03  ef 9d 63 9e   sbc $9e639d
$00:9d07  39 9e 77      and $779e,y
$00:9d0a  9d 1b 9f      sta $9f1b,x
$00:9d0d  b7 9e         lda [$9e],y
$00:9d0f  8d 9e d1      sta $d19e
$00:9d12  9d 2b 9e      sta $9e2b,x
$00:9d15  59 9d 1b      eor $1b9d,y
$00:9d18  9f b7 9e 8d   sta $8d9eb7,x
$00:9d1c  9e d1 9d      stz $9dd1,x
$00:9d1f  2b            pld
$00:9d20  9e 59 9d      stz $9d59,x
$00:9d23  fb            xce
$00:9d24  9e a9 9e      stz $9ea9,x
$00:9d27  7f 9e 55 9e   adc $9e559e,x
$00:9d2b  b3 9d         lda ($9d,s),y
$00:9d2d  3b            tsc
$00:9d2e  9d fb 9e      sta $9efb,x
$00:9d31  a9 9e 7f      lda #$7f9e
$00:9d34  9e 55 9e      stz $9e55,x
$00:9d37  b3 9d         lda ($9d,s),y
$00:9d39  3b            tsc
$00:9d3a  9d b0 0e      sta $0eb0,x
$00:9d3d  a9 01 00      lda #$0001
$00:9d40  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9d43  02 80         cop #$80
$00:9d45  01 02         ora ($02,x)
$00:9d47  82 82 1a      brl $b7cc
$00:9d4a  fd a9 2b      sbc $2ba9,x
$00:9d4d  00 20         brk #$20
$00:9d4f  9d 9f 02      sta $029f,x
$00:9d52  80 2b         bra $9d7f
$00:9d54  02 82         cop #$82
$00:9d56  82 0c fd      brl $9a65
$00:9d59  b0 0e         bcs $9d69
$00:9d5b  a9 00 00      lda #$0000
$00:9d5e  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9d61  02 80         cop #$80
$00:9d63  00 02         brk #$02
$00:9d65  82 82 fc      brl $99ea
$00:9d68  fc a9 29      jsr ($29a9,x)
$00:9d6b  00 20         brk #$20
$00:9d6d  9d 9f 02      sta $029f,x
$00:9d70  80 29         bra $9d9b
$00:9d72  02 82         cop #$82
$00:9d74  82 ee fc      brl $9a65
$00:9d77  b0 0e         bcs $9d87
$00:9d79  a9 02 00      lda #$0002
$00:9d7c  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9d7f  02 80         cop #$80
$00:9d81  02 02         cop #$02
$00:9d83  82 82 de      brl $7c08
$00:9d86  fc a9 27      jsr ($27a9,x)
$00:9d89  00 20         brk #$20
$00:9d8b  9d 9f 02      sta $029f,x
$00:9d8e  80 27         bra $9db7
$00:9d90  02 82         cop #$82
$00:9d92  82 d0 fc      brl $9a65
$00:9d95  b0 0e         bcs $9da5
$00:9d97  a9 03 00      lda #$0003
$00:9d9a  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9d9d  02 80         cop #$80
$00:9d9f  03 02         ora $02,s
$00:9da1  82 82 c0      brl $5e26
$00:9da4  fc a9 24      jsr ($24a9,x)
$00:9da7  00 20         brk #$20
$00:9da9  9d 9f 02      sta $029f,x
$00:9dac  80 24         bra $9dd2
$00:9dae  02 82         cop #$82
$00:9db0  82 b2 fc      brl $9a65
$00:9db3  b0 0e         bcs $9dc3
$00:9db5  a9 06 00      lda #$0006
$00:9db8  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9dbb  02 80         cop #$80
$00:9dbd  06 02         asl $02
$00:9dbf  82 82 a2      brl $4044
$00:9dc2  fc a9 2a      jsr ($2aa9,x)
$00:9dc5  00 20         brk #$20
$00:9dc7  9d 9f 02      sta $029f,x
$00:9dca  80 2a         bra $9df6
$00:9dcc  02 82         cop #$82
$00:9dce  82 94 fc      brl $9a65
$00:9dd1  b0 0e         bcs $9de1
$00:9dd3  a9 04 00      lda #$0004
$00:9dd6  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9dd9  02 80         cop #$80
$00:9ddb  04 02         tsb $02
$00:9ddd  82 82 84      brl $2262
$00:9de0  fc a9 28      jsr ($28a9,x)
$00:9de3  00 20         brk #$20
$00:9de5  9d 9f 02      sta $029f,x
$00:9de8  80 28         bra $9e12
$00:9dea  02 82         cop #$82
$00:9dec  82 76 fc      brl $9a65
$00:9def  b0 0e         bcs $9dff
$00:9df1  a9 08 00      lda #$0008
$00:9df4  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9df7  02 80         cop #$80
$00:9df9  08            php
$00:9dfa  02 82         cop #$82
$00:9dfc  82 66 fc      brl $9a65
$00:9dff  a9 26 00      lda #$0026
$00:9e02  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9e05  02 80         cop #$80
$00:9e07  26 02         rol $02
$00:9e09  82 82 58      brl $f68e
$00:9e0c  fc b0 0e      jsr ($0eb0,x)
$00:9e0f  a9 0a 00      lda #$000a
$00:9e12  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9e15  02 80         cop #$80
$00:9e17  0a            asl a
$00:9e18  02 82         cop #$82
$00:9e1a  82 48 fc      brl $9a65
$00:9e1d  a9 25 00      lda #$0025
$00:9e20  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9e23  02 80         cop #$80
$00:9e25  25 02         and $02
$00:9e27  82 82 3a      brl $d8ac
$00:9e2a  fc a9 05      jsr ($05a9,x)
$00:9e2d  00 20         brk #$20
$00:9e2f  9d 9f 02      sta $029f,x
$00:9e32  80 05         bra $9e39
$00:9e34  02 82         cop #$82
$00:9e36  82 2c fc      brl $9a65
$00:9e39  a9 11 00      lda #$0011
$00:9e3c  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9e3f  02 80         cop #$80
$00:9e41  11 02         ora ($02),y
$00:9e43  82 82 1e      brl $bcc8
$00:9e46  fc a9 12      jsr ($12a9,x)
$00:9e49  00 20         brk #$20
$00:9e4b  9d 9f 02      sta $029f,x
$00:9e4e  80 12         bra $9e62
$00:9e50  02 82         cop #$82
$00:9e52  82 10 fc      brl $9a65
$00:9e55  a9 07 00      lda #$0007
$00:9e58  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9e5b  02 80         cop #$80
$00:9e5d  07 02         ora [$02]
$00:9e5f  82 82 02      brl $a0e4
$00:9e62  fc a9 10      jsr ($10a9,x)
$00:9e65  00 20         brk #$20
$00:9e67  9d 9f 02      sta $029f,x
$00:9e6a  80 10         bra $9e7c
$00:9e6c  02 82         cop #$82
$00:9e6e  82 f4 fb      brl $9a65
$00:9e71  a9 13 00      lda #$0013
$00:9e74  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9e77  02 80         cop #$80
$00:9e79  13 02         ora ($02,s),y
$00:9e7b  82 82 e6      brl $8500
$00:9e7e  fb            xce
$00:9e7f  a9 0e 00      lda #$000e
$00:9e82  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9e85  02 80         cop #$80
$00:9e87  0e 02 82      asl $8202
$00:9e8a  82 d8 fb      brl $9a65
$00:9e8d  a9 0d 00      lda #$000d
$00:9e90  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9e93  02 80         cop #$80
$00:9e95  0d 02 82      ora $8202
$00:9e98  82 ca fb      brl $9a65
$00:9e9b  a9 0b 00      lda #$000b
$00:9e9e  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9ea1  02 80         cop #$80
$00:9ea3  0b            phd
$00:9ea4  02 82         cop #$82
$00:9ea6  82 bc fb      brl $9a65
$00:9ea9  a9 0f 00      lda #$000f
$00:9eac  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9eaf  02 80         cop #$80
$00:9eb1  0f 02 82 82   ora $828202
$00:9eb5  ae fb a9      ldx $a9fb
$00:9eb8  0c 00 20      tsb $2000
$00:9ebb  9d 9f 02      sta $029f,x
$00:9ebe  80 0c         bra $9ecc
$00:9ec0  02 82         cop #$82
$00:9ec2  82 a0 fb      brl $9a65
$00:9ec5  a9 09 00      lda #$0009
$00:9ec8  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9ecb  02 80         cop #$80
$00:9ecd  09 02 82      ora #$8202
$00:9ed0  82 92 fb      brl $9a65
$00:9ed3  e2 20         sep #$20
$00:9ed5  a9 0b         lda #$0b
$00:9ed7  9d 24 00      sta $0024,x
$00:9eda  ac 9e 03      ldy $039e
$00:9edd  a9 0c         lda #$0c
$00:9edf  99 24 00      sta $0024,y
$00:9ee2  c2 20         rep #$20
$00:9ee4  00 84         brk #$84
$00:9ee6  a9 1c 00      lda #$001c
$00:9ee9  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9eec  02 80         cop #$80
$00:9eee  1c 02 82      trb $8202
$00:9ef1  ad ba 03      lda $03ba
$00:9ef4  1a            inc a
$00:9ef5  8d 18 03      sta $0318
$00:9ef8  02 91         cop #$91
$00:9efa  6b            rtl
$00:9efb  00 01         brk #$01
$00:9efd  20 7b 9f      jsr $9f7b
$00:9f00  b0 05         bcs $9f07
$00:9f02  02 84         cop #$84
$00:9f04  78            sei
$00:9f05  a6 00         ldx $00
$00:9f07  a9 00 80      lda #$8000
$00:9f0a  1c 2a 03      trb $032a
$00:9f0d  a9 21 00      lda #$0021
$00:9f10  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9f13  02 80         cop #$80
$00:9f15  21 02         and ($02,x)
$00:9f17  82 82 4a      brl $e99c
$00:9f1a  fb            xce
$00:9f1b  00 01         brk #$01
$00:9f1d  20 7b 9f      jsr $9f7b
$00:9f20  b0 05         bcs $9f27
$00:9f22  02 84         cop #$84
$00:9f24  8d a6 00      sta $00a6
$00:9f27  a9 00 80      lda #$8000
$00:9f2a  1c 2a 03      trb $032a
$00:9f2d  a9 20 00      lda #$0020
$00:9f30  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9f33  02 80         cop #$80
$00:9f35  20 02 82      jsr $8202  ; -> Sub_00_8202
$00:9f38  82 2a fb      brl $9a65
$00:9f3b  00 01         brk #$01
$00:9f3d  20 7b 9f      jsr $9f7b
$00:9f40  b0 05         bcs $9f47
$00:9f42  02 84         cop #$84
$00:9f44  a4 a6         ldy $a6
$00:9f46  00 a9         brk #$a9
$00:9f48  00 80         brk #$80
$00:9f4a  1c 2a 03      trb $032a
$00:9f4d  a9 22 00      lda #$0022
$00:9f50  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9f53  02 80         cop #$80
$00:9f55  22 02 82 82   jsl $828202
$00:9f59  0a            asl a
$00:9f5a  fb            xce
$00:9f5b  00 01         brk #$01
$00:9f5d  20 7b 9f      jsr $9f7b
$00:9f60  b0 05         bcs $9f67
$00:9f62  02 84         cop #$84
$00:9f64  b9 a6 00      lda $00a6,y
$00:9f67  a9 00 80      lda #$8000
$00:9f6a  1c 2a 03      trb $032a
$00:9f6d  a9 23 00      lda #$0023
$00:9f70  20 9d 9f      jsr $9f9d  ; -> Sub_00_9f9d
$00:9f73  02 80         cop #$80
$00:9f75  23 02         and $02,s
$00:9f77  82 82 ea      brl $89fc
$00:9f7a  fa            plx
$00:9f7b  ad 5e 1b      lda $1b5e
$00:9f7e  c9 08 00      cmp #$0008
$00:9f81  d0 18         bne $9f9b
$00:9f83  ad 60 1b      lda $1b60
$00:9f86  c9 10 00      cmp #$0010
$00:9f89  d0 10         bne $9f9b
$00:9f8b  ad 62 1b      lda $1b62
$00:9f8e  c9 18 00      cmp #$0018
$00:9f91  d0 08         bne $9f9b
$00:9f93  02 26         cop #$26
$00:9f95  02 00         cop #$00
$00:9f97  9b            txy
$00:9f98  9f 18 60 38   sta $386018,x
$00:9f9c  60            rts
Sub_00_9f9d:
$00:9f9d  bc 3e 00      ldy $003e,x
$00:9fa0  99 1e 00      sta $001e,y
$00:9fa3  38            sec
$00:9fa4  e9 20 00      sbc #$0020
$00:9fa7  c9 04 00      cmp #$0004
$00:9faa  b0 09         bcs $9fb5
$00:9fac  ad 70 1b      lda $1b70
$00:9faf  18            clc
$00:9fb0  6d 72 1b      adc $1b72
$00:9fb3  80 03         bra $9fb8
$00:9fb5  ad 70 1b      lda $1b70
$00:9fb8  8d 8c 1b      sta $1b8c
$00:9fbb  ad 74 1b      lda $1b74
$00:9fbe  18            clc
$00:9fbf  6d 76 1b      adc $1b76
$00:9fc2  8d 8e 1b      sta $1b8e
$00:9fc5  a9 00 00      lda #$0000
$00:9fc8  99 20 00      sta $0020,y
$00:9fcb  99 14 00      sta $0014,y
$00:9fce  60            rts
$00:9fcf  bd 16 00      lda $0016,x
$00:9fd2  29 ff ce      and #$ceff
$00:9fd5  9d 16 00      sta $0016,x
$00:9fd8  fe 24 00      inc $0024,x
$00:9fdb  02 91         cop #$91
$00:9fdd  02 82         cop #$82
$00:9fdf  6b            rtl
$00:9fe0  bd 16 00      lda $0016,x
$00:9fe3  09 00 20      ora #$2000
$00:9fe6  9d 16 00      sta $0016,x
$00:9fe9  ad fb 03      lda $03fb
$00:9fec  d0 25         bne $a013
$00:9fee  ad 82 1b      lda $1b82
$00:9ff1  f0 23         beq $a016
$00:9ff3  bd 16 00      lda $0016,x
$00:9ff6  29 ff df      and #$dfff
$00:9ff9  9d 16 00      sta $0016,x
$00:9ffc  02 85         cop #$85
$00:9ffe  26 a0         rol $a0
$00:a000  00 02         brk #$02
$00:a002  a8            tay
$00:a003  00 80         brk #$80
$00:a005  0e 02 a3      asl $a302
$00:a008  02 a2         cop #$a2
$00:a00a  30 02         bmi $a00e
$00:a00c  81 08         sta ($08,x)
$00:a00e  10 02         bpl $a012
$00:a010  83 80         sta $80,s
$00:a012  f8            sed
$00:a013  02 91         cop #$91
$00:a015  6b            rtl
$00:a016  02 91         cop #$91
$00:a018  ad 82 1b      lda $1b82
$00:a01b  d0 01         bne $a01e
$00:a01d  6b            rtl
$00:a01e  9e 00 00      stz $0000,x
$00:a021  9e 02 00      stz $0002,x
$00:a024  80 cd         bra $9ff3
$00:a026  bd 16 00      lda $0016,x
$00:a029  09 10 00      ora #$0010
$00:a02c  9d 16 00      sta $0016,x
$00:a02f  02 91         cop #$91
$00:a031  da            phx
$00:a032  20 0a a1      jsr $a10a
$00:a035  90 03         bcc $a03a
$00:a037  82 ce 00      brl $a108
$00:a03a  ad 22 03      lda $0322
$00:a03d  a0 02 00      ldy #$0002
$00:a040  89 00 01      bit #$0100
$00:a043  d0 0b         bne $a050
$00:a045  a0 fe ff      ldy #$fffe
$00:a048  89 00 02      bit #$0200
$00:a04b  d0 03         bne $a050
$00:a04d  a0 00 00      ldy #$0000
$00:a050  84 16         sty $16
$00:a052  a0 02 00      ldy #$0002
$00:a055  89 00 04      bit #$0400
$00:a058  d0 0b         bne $a065
$00:a05a  a0 fe ff      ldy #$fffe
$00:a05d  89 00 08      bit #$0800
$00:a060  d0 03         bne $a065
$00:a062  a0 00 00      ldy #$0000
$00:a065  84 18         sty $18
$00:a067  ad 74 03      lda $0374
$00:a06a  38            sec
$00:a06b  fd 00 00      sbc $0000,x
$00:a06e  f0 1a         beq $a08a
$00:a070  10 0f         bpl $a081
$00:a072  49 ff ff      eor #$ffff
$00:a075  1a            inc a
$00:a076  c6 16         dec $16
$00:a078  c9 60 00      cmp #$0060
$00:a07b  90 0d         bcc $a08a
$00:a07d  c6 16         dec $16
$00:a07f  80 09         bra $a08a
$00:a081  e6 16         inc $16
$00:a083  c9 50 00      cmp #$0050
$00:a086  90 02         bcc $a08a
$00:a088  e6 16         inc $16
$00:a08a  bd 00 00      lda $0000,x
$00:a08d  18            clc
$00:a08e  65 16         adc $16
$00:a090  9d 00 00      sta $0000,x
$00:a093  85 16         sta $16
$00:a095  ad 76 03      lda $0376
$00:a098  38            sec
$00:a099  fd 02 00      sbc $0002,x
$00:a09c  f0 1a         beq $a0b8
$00:a09e  10 0f         bpl $a0af
$00:a0a0  49 ff ff      eor #$ffff
$00:a0a3  1a            inc a
$00:a0a4  c6 18         dec $18
$00:a0a6  c9 40 00      cmp #$0040
$00:a0a9  90 0d         bcc $a0b8
$00:a0ab  c6 18         dec $18
$00:a0ad  80 09         bra $a0b8
$00:a0af  e6 18         inc $18
$00:a0b1  c9 50 00      cmp #$0050
$00:a0b4  90 02         bcc $a0b8
$00:a0b6  e6 18         inc $18
$00:a0b8  bd 02 00      lda $0002,x
$00:a0bb  18            clc
$00:a0bc  65 18         adc $18
$00:a0be  9d 02 00      sta $0002,x
$00:a0c1  85 18         sta $18
$00:a0c3  bc 3c 00      ldy $003c,x
$00:a0c6  ad 31 04      lda $0431
$00:a0c9  0a            asl a
$00:a0ca  29 ff 00      and #$00ff
$00:a0cd  aa            tax
$00:a0ce  e2 20         sep #$20
$00:a0d0  a9 00         lda #$00
$00:a0d2  eb            xba
$00:a0d3  bd 84 fc      lda $fc84,x
$00:a0d6  10 09         bpl $a0e1
$00:a0d8  eb            xba
$00:a0d9  3a            dec a
$00:a0da  eb            xba
$00:a0db  38            sec
$00:a0dc  6a            ror a
$00:a0dd  38            sec
$00:a0de  6a            ror a
$00:a0df  80 02         bra $a0e3
$00:a0e1  4a            lsr a
$00:a0e2  4a            lsr a
$00:a0e3  c2 20         rep #$20
$00:a0e5  18            clc
$00:a0e6  65 16         adc $16
$00:a0e8  99 00 00      sta $0000,y
$00:a0eb  e2 20         sep #$20
$00:a0ed  a9 00         lda #$00
$00:a0ef  eb            xba
$00:a0f0  bd c4 fc      lda $fcc4,x
$00:a0f3  10 09         bpl $a0fe
$00:a0f5  eb            xba
$00:a0f6  3a            dec a
$00:a0f7  eb            xba
$00:a0f8  38            sec
$00:a0f9  6a            ror a
$00:a0fa  38            sec
$00:a0fb  6a            ror a
$00:a0fc  80 02         bra $a100
$00:a0fe  4a            lsr a
$00:a0ff  4a            lsr a
$00:a100  c2 20         rep #$20
$00:a102  18            clc
$00:a103  65 18         adc $18
$00:a105  99 02 00      sta $0002,y
$00:a108  fa            plx
$00:a109  6b            rtl
$00:a10a  ad 39 04      lda $0439
$00:a10d  d0 54         bne $a163
$00:a10f  ad a6 03      lda $03a6
$00:a112  d0 4f         bne $a163
$00:a114  ad 62 1b      lda $1b62
$00:a117  f0 4a         beq $a163
$00:a119  b2 4a         lda ($4a)
$00:a11b  f0 46         beq $a163
$00:a11d  ad 33 04      lda $0433
$00:a120  f0 1e         beq $a140
$00:a122  ad 62 1b      lda $1b62
$00:a125  38            sec
$00:a126  e9 11 00      sbc #$0011
$00:a129  f0 4b         beq $a176
$00:a12b  3a            dec a
$00:a12c  f0 58         beq $a186
$00:a12e  3a            dec a
$00:a12f  f0 32         beq $a163
$00:a131  3a            dec a
$00:a132  f0 6c         beq $a1a0
$00:a134  3a            dec a
$00:a135  f0 2c         beq $a163
$00:a137  3a            dec a
$00:a138  f0 29         beq $a163
$00:a13a  3a            dec a
$00:a13b  f0 26         beq $a163
$00:a13d  82 23 00      brl $a163
$00:a140  ad 22 03      lda $0322
$00:a143  89 00 40      bit #$4000
$00:a146  f0 1b         beq $a163
$00:a148  ad 62 1b      lda $1b62
$00:a14b  38            sec
$00:a14c  e9 11 00      sbc #$0011
$00:a14f  f0 17         beq $a168
$00:a151  3a            dec a
$00:a152  f0 24         beq $a178
$00:a154  3a            dec a
$00:a155  f0 31         beq $a188
$00:a157  3a            dec a
$00:a158  f0 3e         beq $a198
$00:a15a  3a            dec a
$00:a15b  f0 48         beq $a1a5
$00:a15d  3a            dec a
$00:a15e  f0 55         beq $a1b5
$00:a160  3a            dec a
$00:a161  f0 62         beq $a1c5
$00:a163  ee 31 04      inc $0431
$00:a166  18            clc
$00:a167  60            rts
$00:a168  02 26         cop #$26
$00:a16a  04 00         tsb $00
$00:a16c  63 a1         adc $a1,s
$00:a16e  ee 33 04      inc $0433
$00:a171  02 85         cop #$85
$00:a173  d5 a1         cmp $a1,x
$00:a175  00 38         brk #$38
$00:a177  60            rts
$00:a178  02 26         cop #$26
$00:a17a  08            php
$00:a17b  00 63         brk #$63
$00:a17d  a1 ee         lda ($ee,x)
$00:a17f  33 04         and ($04,s),y
$00:a181  02 85         cop #$85
$00:a183  46 a2         lsr $a2
$00:a185  00 38         brk #$38
$00:a187  60            rts
$00:a188  02 26         cop #$26
$00:a18a  08            php
$00:a18b  00 63         brk #$63
$00:a18d  a1 ee         lda ($ee,x)
$00:a18f  33 04         and ($04,s),y
$00:a191  02 85         cop #$85
$00:a193  f1 a2         sbc ($a2),y
$00:a195  00 80         brk #$80
$00:a197  cb            wai
$00:a198  ee 33 04      inc $0433
$00:a19b  02 85         cop #$85
$00:a19d  dd a3 00      cmp $00a3,x
$00:a1a0  ee 31 04      inc $0431
$00:a1a3  80 be         bra $a163
$00:a1a5  02 26         cop #$26
$00:a1a7  08            php
$00:a1a8  00 63         brk #$63
$00:a1aa  a1 ee         lda ($ee,x)
$00:a1ac  33 04         and ($04,s),y
$00:a1ae  02 85         cop #$85
$00:a1b0  39 a4 00      and $00a4,y
$00:a1b3  80 ae         bra $a163
$00:a1b5  02 26         cop #$26
$00:a1b7  20 00 63      jsr $6300
$00:a1ba  a1 ee         lda ($ee,x)
$00:a1bc  33 04         and ($04,s),y
$00:a1be  02 85         cop #$85
$00:a1c0  9d a4 00      sta $00a4,x
$00:a1c3  80 9e         bra $a163
$00:a1c5  02 26         cop #$26
$00:a1c7  08            php
$00:a1c8  00 63         brk #$63
$00:a1ca  a1 ee         lda ($ee,x)
$00:a1cc  33 04         and ($04,s),y
$00:a1ce  02 85         cop #$85
$00:a1d0  f8            sed
$00:a1d1  a4 00         ldy $00
$00:a1d3  80 8e         bra $a163
$00:a1d5  a9 a0 03      lda #$03a0
$00:a1d8  9d 16 00      sta $0016,x
$00:a1db  a9 05 00      lda #$0005
$00:a1de  9d 30 00      sta $0030,x
$00:a1e1  ac a0 03      ldy $03a0
$00:a1e4  b9 00 00      lda $0000,y
$00:a1e7  9d 00 00      sta $0000,x
$00:a1ea  b9 02 00      lda $0002,y
$00:a1ed  9d 02 00      sta $0002,x
$00:a1f0  02 a3         cop #$a3
$00:a1f2  02 a2         cop #$a2
$00:a1f4  30 02         bmi $a1f8
$00:a1f6  a8            tay
$00:a1f7  00 80         brk #$80
$00:a1f9  0f 02 80 00   ora $008002
$00:a1fd  02 82         cop #$82
$00:a1ff  00 1b         brk #$1b
$00:a201  a9 a0 02      lda #$02a0
$00:a204  9d 16 00      sta $0016,x
$00:a207  ac 9c 03      ldy $039c
$00:a20a  b9 1e 00      lda $001e,y
$00:a20d  a8            tay
$00:a20e  b9 7f fa      lda $fa7f,y
$00:a211  29 ff 00      and #$00ff
$00:a214  f0 08         beq $a21e
$00:a216  3a            dec a
$00:a217  f0 07         beq $a220
$00:a219  3a            dec a
$00:a21a  f0 09         beq $a225
$00:a21c  80 09         bra $a227
$00:a21e  02 98         cop #$98
$00:a220  a9 02 00      lda #$0002
$00:a223  80 05         bra $a22a
$00:a225  02 96         cop #$96
$00:a227  a9 01 00      lda #$0001
$00:a22a  9d 1e 00      sta $001e,x
$00:a22d  9e 20 00      stz $0020,x
$00:a230  a9 08 00      lda #$0008
$00:a233  9d 2a 00      sta $002a,x
$00:a236  a9 00 40      lda #$4000
$00:a239  1c 2a 03      trb $032a
$00:a23c  9c 33 04      stz $0433
$00:a23f  02 91         cop #$91
$00:a241  02 83         cop #$83
$00:a243  02 86         cop #$86
$00:a245  6b            rtl
$00:a246  a9 a0 03      lda #$03a0
$00:a249  9d 16 00      sta $0016,x
$00:a24c  ac a0 03      ldy $03a0
$00:a24f  b9 00 00      lda $0000,y
$00:a252  9d 00 00      sta $0000,x
$00:a255  b9 02 00      lda $0002,y
$00:a258  9d 02 00      sta $0002,x
$00:a25b  02 a3         cop #$a3
$00:a25d  02 a2         cop #$a2
$00:a25f  30 02         bmi $a263
$00:a261  a8            tay
$00:a262  00 80         brk #$80
$00:a264  0f 02 80 03   ora $038002
$00:a268  02 82         cop #$82
$00:a26a  00 12         brk #$12
$00:a26c  02 b2         cop #$b2
$00:a26e  a0 a2 00      ldy #$00a2
$00:a271  00 00         brk #$00
$00:a273  f8            sed
$00:a274  ff a0 02 02   sbc $0202a0,x
$00:a278  b2 b5         lda ($b5)
$00:a27a  a2 00 00      ldx #$0000
$00:a27d  00 08         brk #$08
$00:a27f  00 a0         brk #$a0
$00:a281  02 02         cop #$02
$00:a283  b2 c8         lda ($c8)
$00:a285  a2 00 f8      ldx #$f800
$00:a288  ff 00 00 a0   sbc $a00000,x
$00:a28c  02 02         cop #$02
$00:a28e  b2 db         lda ($db)
$00:a290  a2 00 08      ldx #$0800
$00:a293  00 00         brk #$00
$00:a295  00 a0         brk #$a0
$00:a297  02 02         cop #$02
$00:a299  80 04         bra $a29f
$00:a29b  02 82         cop #$82
$00:a29d  82 47 04      brl $a6e7
$00:a2a0  a9 0a 00      lda #$000a
$00:a2a3  9d 30 00      sta $0030,x
$00:a2a6  02 98         cop #$98
$00:a2a8  02 80         cop #$80
$00:a2aa  07 02         ora [$02]
$00:a2ac  82 02 81      brl $23b1
$00:a2af  08            php
$00:a2b0  08            php
$00:a2b1  02 83         cop #$83
$00:a2b3  80 39         bra $a2ee
$00:a2b5  a9 0a 00      lda #$000a
$00:a2b8  9d 30 00      sta $0030,x
$00:a2bb  02 80         cop #$80
$00:a2bd  07 02         ora [$02]
$00:a2bf  82 02 81      brl $23c4
$00:a2c2  08            php
$00:a2c3  08            php
$00:a2c4  02 83         cop #$83
$00:a2c6  80 26         bra $a2ee
$00:a2c8  a9 0a 00      lda #$000a
$00:a2cb  9d 30 00      sta $0030,x
$00:a2ce  02 80         cop #$80
$00:a2d0  05 02         ora $02
$00:a2d2  82 02 81      brl $23d7
$00:a2d5  06 08         asl $08
$00:a2d7  02 83         cop #$83
$00:a2d9  80 13         bra $a2ee
$00:a2db  a9 0a 00      lda #$000a
$00:a2de  9d 30 00      sta $0030,x
$00:a2e1  02 96         cop #$96
$00:a2e3  02 80         cop #$80
$00:a2e5  05 02         ora $02
$00:a2e7  82 02 81      brl $23ec
$00:a2ea  06 08         asl $08
$00:a2ec  02 83         cop #$83
$00:a2ee  02 86         cop #$86
$00:a2f0  6b            rtl
$00:a2f1  a9 a0 03      lda #$03a0
$00:a2f4  9d 16 00      sta $0016,x
$00:a2f7  a9 14 00      lda #$0014
$00:a2fa  9d 30 00      sta $0030,x
$00:a2fd  02 85         cop #$85
$00:a2ff  b1 a3         lda ($a3),y
$00:a301  00 02         brk #$02
$00:a303  a3 02         lda $02,s
$00:a305  a2 30 02      ldx #$0230
$00:a308  a8            tay
$00:a309  00 80         brk #$80
$00:a30b  0f 02 03 05   ora $050302
$00:a30f  02 80         cop #$80
$00:a311  09 02 82      ora #$8202
$00:a314  ad 22 03      lda $0322
$00:a317  89 00 40      bit #$4000
$00:a31a  f0 35         beq $a351
$00:a31c  02 04         cop #$04
$00:a31e  02 03         cop #$03
$00:a320  05 02         ora $02
$00:a322  80 0a         bra $a32e
$00:a324  02 82         cop #$82
$00:a326  ad 22 03      lda $0322
$00:a329  89 00 40      bit #$4000
$00:a32c  f0 3b         beq $a369
$00:a32e  02 04         cop #$04
$00:a330  02 03         cop #$03
$00:a332  05 02         ora $02
$00:a334  80 0b         bra $a341
$00:a336  02 82         cop #$82
$00:a338  ad 22 03      lda $0322
$00:a33b  89 00 40      bit #$4000
$00:a33e  f0 41         beq $a381
$00:a340  02 04         cop #$04
$00:a342  02 80         cop #$80
$00:a344  0c 02 82      tsb $8202
$00:a347  ad 22 03      lda $0322
$00:a34a  89 00 40      bit #$4000
$00:a34d  f0 4a         beq $a399
$00:a34f  80 f1         bra $a342
$00:a351  a9 a0 02      lda #$02a0
$00:a354  9d 16 00      sta $0016,x
$00:a357  02 a3         cop #$a3
$00:a359  02 81         cop #$81
$00:a35b  0d 03 02      ora $0203
$00:a35e  83 00         sta $00,s
$00:a360  21 02         and ($02,x)
$00:a362  80 10         bra $a374
$00:a364  02 82         cop #$82
$00:a366  82 7e 03      brl $a6e7
$00:a369  a9 a0 02      lda #$02a0
$00:a36c  9d 16 00      sta $0016,x
$00:a36f  02 a3         cop #$a3
$00:a371  02 81         cop #$81
$00:a373  0e 03 02      asl $0203
$00:a376  83 00         sta $00,s
$00:a378  21 02         and ($02,x)
$00:a37a  80 11         bra $a38d
$00:a37c  02 82         cop #$82
$00:a37e  82 66 03      brl $a6e7
$00:a381  a9 a0 02      lda #$02a0
$00:a384  9d 16 00      sta $0016,x
$00:a387  02 a3         cop #$a3
$00:a389  02 81         cop #$81
$00:a38b  0e 03 02      asl $0203
$00:a38e  83 00         sta $00,s
$00:a390  21 02         and ($02,x)
$00:a392  80 12         bra $a3a6
$00:a394  02 82         cop #$82
$00:a396  82 4e 03      brl $a6e7
$00:a399  a9 a0 02      lda #$02a0
$00:a39c  9d 16 00      sta $0016,x
$00:a39f  02 a3         cop #$a3
$00:a3a1  02 81         cop #$81
$00:a3a3  0e 03 02      asl $0203
$00:a3a6  83 00         sta $00,s
$00:a3a8  21 02         and ($02,x)
$00:a3aa  80 13         bra $a3bf
$00:a3ac  02 82         cop #$82
$00:a3ae  82 36 03      brl $a6e7
$00:a3b1  bd 16 00      lda $0016,x
$00:a3b4  09 10 00      ora #$0010
$00:a3b7  9d 16 00      sta $0016,x
$00:a3ba  02 91         cop #$91
$00:a3bc  ad 22 03      lda $0322
$00:a3bf  89 00 40      bit #$4000
$00:a3c2  f0 16         beq $a3da
$00:a3c4  da            phx
$00:a3c5  ac a0 03      ldy $03a0
$00:a3c8  bd 3c 00      lda $003c,x
$00:a3cb  aa            tax
$00:a3cc  b9 00 00      lda $0000,y
$00:a3cf  9d 00 00      sta $0000,x
$00:a3d2  b9 02 00      lda $0002,y
$00:a3d5  9d 02 00      sta $0002,x
$00:a3d8  fa            plx
$00:a3d9  6b            rtl
$00:a3da  02 86         cop #$86
$00:a3dc  6b            rtl
$00:a3dd  a9 20 20      lda #$2020
$00:a3e0  9d 16 00      sta $0016,x
$00:a3e3  ad 22 03      lda $0322
$00:a3e6  89 00 40      bit #$4000
$00:a3e9  d0 03         bne $a3ee
$00:a3eb  82 f9 02      brl $a6e7
$00:a3ee  02 26         cop #$26
$00:a3f0  01 00         ora ($00,x)
$00:a3f2  e7 a6         sbc [$a6]
$00:a3f4  02 b0         cop #$b0
$00:a3f6  01 a4         ora ($a4,x)
$00:a3f8  00 b0         brk #$b0
$00:a3fa  02 02         cop #$02
$00:a3fc  1b            tcs
$00:a3fd  e3 a3         sbc $a3,s
$00:a3ff  04 00         tsb $00
$00:a401  ac a0 03      ldy $03a0
$00:a404  b9 00 00      lda $0000,y
$00:a407  9d 00 00      sta $0000,x
$00:a40a  b9 02 00      lda $0002,y
$00:a40d  9d 02 00      sta $0002,x
$00:a410  a9 05 00      lda #$0005
$00:a413  9d 30 00      sta $0030,x
$00:a416  02 a3         cop #$a3
$00:a418  02 a2         cop #$a2
$00:a41a  30 02         bmi $a41e
$00:a41c  a8            tay
$00:a41d  00 80         brk #$80
$00:a41f  0f 00 24 02   ora $022400
$00:a423  80 14         bra $a439
$00:a425  02 82         cop #$82
$00:a427  02 80         cop #$80
$00:a429  15 02         ora $02,x
$00:a42b  82 02 80      brl $2430
$00:a42e  16 02         asl $02,x
$00:a430  82 02 80      brl $2435
$00:a433  17 02         ora [$02],y
$00:a435  82 02 86      brl $2a3a
$00:a438  6b            rtl
$00:a439  a9 20 20      lda #$2020
$00:a43c  9d 16 00      sta $0016,x
$00:a43f  9c 33 04      stz $0433
$00:a442  02 03         cop #$03
$00:a444  04 02         tsb $02
$00:a446  b0 57         bcs $a49f
$00:a448  a4 00         ldy $00
$00:a44a  a0 03 02      ldy #$0203
$00:a44d  1b            tcs
$00:a44e  52 a4         eor ($a4)
$00:a450  10 00         bpl $a452
$00:a452  02 04         cop #$04
$00:a454  02 86         cop #$86
$00:a456  6b            rtl
$00:a457  ee 33 04      inc $0433
$00:a45a  a9 1e 00      lda #$001e
$00:a45d  9d 30 00      sta $0030,x
$00:a460  ac a0 03      ldy $03a0
$00:a463  b9 00 00      lda $0000,y
$00:a466  9d 00 00      sta $0000,x
$00:a469  b9 02 00      lda $0002,y
$00:a46c  9d 02 00      sta $0002,x
$00:a46f  02 a4         cop #$a4
$00:a471  02 a8         cop #$a8
$00:a473  00 80         brk #$80
$00:a475  0f 02 81 18   ora $188102
$00:a479  04 02         tsb $02
$00:a47b  83 02         sta $02,s
$00:a47d  81 19         sta ($19,x)
$00:a47f  04 02         tsb $02
$00:a481  83 a9         sta $a9,s
$00:a483  a0 02 9d      ldy #$9d02
$00:a486  16 00         asl $00,x
$00:a488  00 21         brk #$21
$00:a48a  02 80         cop #$80
$00:a48c  1a            inc a
$00:a48d  02 82         cop #$82
$00:a48f  ce 33 04      dec $0433
$00:a492  d0 06         bne $a49a
$00:a494  a9 00 40      lda #$4000
$00:a497  1c 2a 03      trb $032a
$00:a49a  02 86         cop #$86
$00:a49c  6b            rtl
$00:a49d  a9 20 20      lda #$2020
$00:a4a0  9d 16 00      sta $0016,x
$00:a4a3  9c 33 04      stz $0433
$00:a4a6  02 03         cop #$03
$00:a4a8  04 02         tsb $02
$00:a4aa  b0 bb         bcs $a467
$00:a4ac  a4 00         ldy $00
$00:a4ae  a0 02 02      ldy #$0202
$00:a4b1  1b            tcs
$00:a4b2  b6 a4         ldx $a4,y
$00:a4b4  10 00         bpl $a4b6
$00:a4b6  02 04         cop #$04
$00:a4b8  02 86         cop #$86
$00:a4ba  6b            rtl
$00:a4bb  ee 33 04      inc $0433
$00:a4be  a9 06 00      lda #$0006
$00:a4c1  9d 30 00      sta $0030,x
$00:a4c4  ac a0 03      ldy $03a0
$00:a4c7  b9 00 00      lda $0000,y
$00:a4ca  9d 00 00      sta $0000,x
$00:a4cd  b9 02 00      lda $0002,y
$00:a4d0  9d 02 00      sta $0002,x
$00:a4d3  02 a8         cop #$a8
$00:a4d5  00 80         brk #$80
$00:a4d7  0f 00 0b 02   ora $020b00
$00:a4db  80 1c         bra $a4f9
$00:a4dd  02 82         cop #$82
$00:a4df  02 81         cop #$81
$00:a4e1  1b            tcs
$00:a4e2  14 02         trb $02
$00:a4e4  83 02         sta $02,s
$00:a4e6  80 1d         bra $a505
$00:a4e8  02 82         cop #$82
$00:a4ea  ce 33 04      dec $0433
$00:a4ed  d0 06         bne $a4f5
$00:a4ef  a9 00 40      lda #$4000
$00:a4f2  1c 2a 03      trb $032a
$00:a4f5  02 86         cop #$86
$00:a4f7  6b            rtl
$00:a4f8  a9 a0 02      lda #$02a0
$00:a4fb  9d 16 00      sta $0016,x
$00:a4fe  02 85         cop #$85
$00:a500  66 a6         ror $a6
$00:a502  00 ac         brk #$ac
$00:a504  a0 03 b9      ldy #$b903
$00:a507  00 00         brk #$00
$00:a509  9d 00 00      sta $0000,x
$00:a50c  b9 02 00      lda $0002,y
$00:a50f  38            sec
$00:a510  e9 10 00      sbc #$0010
$00:a513  9d 02 00      sta $0002,x
$00:a516  02 a8         cop #$a8
$00:a518  00 80         brk #$80
$00:a51a  0f 02 a2 30   ora $30a202
$00:a51e  02 81         cop #$81
$00:a520  24 04         bit $04
$00:a522  02 83         cop #$83
$00:a524  00 16         brk #$16
$00:a526  02 80         cop #$80
$00:a528  25 02         and $02
$00:a52a  82 a9 0f      brl $b4d6
$00:a52d  00 9d         brk #$9d
$00:a52f  30 00         bmi $a531
$00:a531  02 03         cop #$03
$00:a533  3c 02 80      bit $8002,x
$00:a536  27 02         and [$02]
$00:a538  82 02 1f      brl $c43d
$00:a53b  a9 02 03      lda #$0302
$00:a53e  29 03 00      and #$0003
$00:a541  d0 03         bne $a546
$00:a543  82 67 00      brl $a5ad
$00:a546  3a            dec a
$00:a547  d0 03         bne $a54c
$00:a549  82 8d 00      brl $a5d9
$00:a54c  3a            dec a
$00:a54d  d0 03         bne $a552
$00:a54f  82 b0 00      brl $a602
$00:a552  82 d6 00      brl $a62b
$00:a555  02 80         cop #$80
$00:a557  28            plp
$00:a558  02 82         cop #$82
$00:a55a  80 51         bra $a5ad
$00:a55c  02 80         cop #$80
$00:a55e  1f 02 82 82   ora $828202,x
$00:a562  c7 00         cmp [$00]
$00:a564  02 80         cop #$80
$00:a566  1e 02 82      asl $8202,x
$00:a569  82 96 00      brl $a602
$00:a56c  02 80         cop #$80
$00:a56e  29 02 82      and #$8202
$00:a571  80 66         bra $a5d9
$00:a573  02 80         cop #$80
$00:a575  2b            pld
$00:a576  02 82         cop #$82
$00:a578  80 33         bra $a5ad
$00:a57a  02 80         cop #$80
$00:a57c  2d 02 82      and $8202
$00:a57f  82 a9 00      brl $a62b
$00:a582  02 80         cop #$80
$00:a584  20 02 82      jsr $8202  ; -> Sub_00_8202
$00:a587  80 79         bra $a602
$00:a589  02 80         cop #$80
$00:a58b  22 02 82 80   jsl $808202
$00:a58f  49 02 80      eor #$8002
$00:a592  21 02         and ($02,x)
$00:a594  82 82 93      brl $3919
$00:a597  00 02         brk #$02
$00:a599  80 23         bra $a5be
$00:a59b  02 82         cop #$82
$00:a59d  80 0e         bra $a5ad
$00:a59f  02 80         cop #$80
$00:a5a1  2a            rol a
$00:a5a2  02 82         cop #$82
$00:a5a4  80 33         bra $a5d9
$00:a5a6  02 80         cop #$80
$00:a5a8  2c 02 82      bit $8202
$00:a5ab  80 55         bra $a602
$00:a5ad  de 2e 00      dec $002e,x
$00:a5b0  d0 03         bne $a5b5
$00:a5b2  82 9f 00      brl $a654
$00:a5b5  bd 16 00      lda $0016,x
$00:a5b8  89 00 80      bit #$8000
$00:a5bb  f0 03         beq $a5c0
$00:a5bd  82 94 00      brl $a654
$00:a5c0  02 1f         cop #$1f
$00:a5c2  ad 02 03      lda $0302
$00:a5c5  29 03 00      and #$0003
$00:a5c8  f0 8b         beq $a555
$00:a5ca  3a            dec a
$00:a5cb  d0 03         bne $a5d0
$00:a5cd  82 aa ff      brl $a57a
$00:a5d0  3a            dec a
$00:a5d1  d0 03         bne $a5d6
$00:a5d3  82 c9 ff      brl $a59f
$00:a5d6  82 5b ff      brl $a534
$00:a5d9  de 2e 00      dec $002e,x
$00:a5dc  f0 76         beq $a654
$00:a5de  bd 16 00      lda $0016,x
$00:a5e1  89 00 80      bit #$8000
$00:a5e4  d0 6e         bne $a654
$00:a5e6  02 1f         cop #$1f
$00:a5e8  ad 02 03      lda $0302
$00:a5eb  29 03 00      and #$0003
$00:a5ee  d0 03         bne $a5f3
$00:a5f0  82 79 ff      brl $a56c
$00:a5f3  3a            dec a
$00:a5f4  d0 03         bne $a5f9
$00:a5f6  82 7a ff      brl $a573
$00:a5f9  3a            dec a
$00:a5fa  d0 03         bne $a5ff
$00:a5fc  82 a7 ff      brl $a5a6
$00:a5ff  82 32 ff      brl $a534
$00:a602  de 2e 00      dec $002e,x
$00:a605  f0 4d         beq $a654
$00:a607  bd 16 00      lda $0016,x
$00:a60a  89 00 80      bit #$8000
$00:a60d  d0 45         bne $a654
$00:a60f  02 1f         cop #$1f
$00:a611  ad 02 03      lda $0302
$00:a614  29 03 00      and #$0003
$00:a617  d0 03         bne $a61c
$00:a619  82 48 ff      brl $a564
$00:a61c  3a            dec a
$00:a61d  d0 03         bne $a622
$00:a61f  82 67 ff      brl $a589
$00:a622  3a            dec a
$00:a623  d0 03         bne $a628
$00:a625  82 68 ff      brl $a590
$00:a628  82 09 ff      brl $a534
$00:a62b  de 2e 00      dec $002e,x
$00:a62e  f0 24         beq $a654
$00:a630  bd 16 00      lda $0016,x
$00:a633  89 00 80      bit #$8000
$00:a636  d0 1c         bne $a654
$00:a638  02 1f         cop #$1f
$00:a63a  ad 02 03      lda $0302
$00:a63d  29 03 00      and #$0003
$00:a640  d0 03         bne $a645
$00:a642  82 17 ff      brl $a55c
$00:a645  3a            dec a
$00:a646  d0 03         bne $a64b
$00:a648  82 37 ff      brl $a582
$00:a64b  3a            dec a
$00:a64c  d0 03         bne $a651
$00:a64e  82 47 ff      brl $a598
$00:a651  82 e0 fe      brl $a534
$00:a654  02 81         cop #$81
$00:a656  26 02         rol $02
$00:a658  02 83         cop #$83
$00:a65a  a9 00 40      lda #$4000
$00:a65d  1c 2a 03      trb $032a
$00:a660  9c 33 04      stz $0433
$00:a663  02 86         cop #$86
$00:a665  6b            rtl
$00:a666  02 a8         cop #$a8
$00:a668  00 80         brk #$80
$00:a66a  0d 02 92      ora $9202
$00:a66d  42 02         wdm #$02
$00:a66f  94 ad         sty $ad,x
$00:a671  33 04         and ($04,s),y
$00:a673  d0 f6         bne $a66b
$00:a675  02 86         cop #$86
$00:a677  6b            rtl
$00:a678  20 d0 a6      jsr $a6d0
$00:a67b  02 a0         cop #$a0
$00:a67d  f0 ff         beq $a67e
$00:a67f  02 80         cop #$80
$00:a681  30 02         bmi $a685
$00:a683  82 02 81      brl $2788
$00:a686  31 08         and ($08),y
$00:a688  02 83         cop #$83
$00:a68a  02 86         cop #$86
$00:a68c  6b            rtl
$00:a68d  20 d0 a6      jsr $a6d0
$00:a690  02 a0         cop #$a0
$00:a692  10 00         bpl $a694
$00:a694  02 98         cop #$98
$00:a696  02 80         cop #$80
$00:a698  30 02         bmi $a69c
$00:a69a  82 02 81      brl $279f
$00:a69d  31 08         and ($08),y
$00:a69f  02 83         cop #$83
$00:a6a1  02 86         cop #$86
$00:a6a3  6b            rtl
$00:a6a4  20 d0 a6      jsr $a6d0
$00:a6a7  02 a0         cop #$a0
$00:a6a9  f0 ff         beq $a6aa
$00:a6ab  02 80         cop #$80
$00:a6ad  2e 02 82      rol $8202
$00:a6b0  02 81         cop #$81
$00:a6b2  2f 08 02 83   and $830208
$00:a6b6  02 86         cop #$86
$00:a6b8  6b            rtl
$00:a6b9  20 d0 a6      jsr $a6d0
$00:a6bc  02 96         cop #$96
$00:a6be  02 a0         cop #$a0
$00:a6c0  f0 ff         beq $a6c1
$00:a6c2  02 80         cop #$80
$00:a6c4  2e 02 82      rol $8202
$00:a6c7  02 81         cop #$81
$00:a6c9  2f 08 02 83   and $830208
$00:a6cd  02 86         cop #$86
$00:a6cf  6b            rtl
$00:a6d0  a9 a0 02      lda #$02a0
$00:a6d3  9d 16 00      sta $0016,x
$00:a6d6  a9 14 00      lda #$0014
$00:a6d9  9d 30 00      sta $0030,x
$00:a6dc  02 a3         cop #$a3
$00:a6de  02 a2         cop #$a2
$00:a6e0  30 02         bmi $a6e4
$00:a6e2  a8            tay
$00:a6e3  00 80         brk #$80
$00:a6e5  0f 60 a9 00   ora $00a960
$00:a6e9  40            rti
$00:a6ea  1c 2a 03      trb $032a
$00:a6ed  9c 33 04      stz $0433
$00:a6f0  02 86         cop #$86
$00:a6f2  6b            rtl
$00:a6f3  20 42 a8      jsr $a842  ; -> Sub_00_a842
$00:a6f6  02 91         cop #$91
$00:a6f8  bd 16 00      lda $0016,x
$00:a6fb  89 00 80      bit #$8000
$00:a6fe  f0 01         beq $a701
$00:a700  6b            rtl
$00:a701  b2 4a         lda ($4a)
$00:a703  d0 04         bne $a709
$00:a705  02 27         cop #$27
$00:a707  f8            sed
$00:a708  a6 00         ldx $00
$00:a70a  53 20         eor ($20,s),y
$00:a70c  ed a8 20      sbc $20a8
$00:a70f  13 a9         ora ($a9,s),y
$00:a711  02 91         cop #$91
$00:a713  20 c6 a8      jsr $a8c6  ; -> Sub_00_a8c6
$00:a716  90 de         bcc $a6f6
$00:a718  4c 71 a8      jmp $a871
$00:a71b  20 42 a8      jsr $a842  ; -> Sub_00_a842
$00:a71e  bd 2e 00      lda $002e,x
$00:a721  29 ff 00      and #$00ff
$00:a724  9d 2c 00      sta $002c,x
$00:a727  02 91         cop #$91
$00:a729  bd 16 00      lda $0016,x
$00:a72c  89 00 80      bit #$8000
$00:a72f  f0 01         beq $a732
$00:a731  6b            rtl
$00:a732  b2 4a         lda ($4a)
$00:a734  d0 04         bne $a73a
$00:a736  02 27         cop #$27
$00:a738  29 a7 00      and #$00a7
$00:a73b  53 20         eor ($20,s),y
$00:a73d  ed a8 20      sbc $20a8
$00:a740  13 a9         ora ($a9,s),y
$00:a742  de 2c 00      dec $002c,x
$00:a745  d0 e0         bne $a727
$00:a747  02 91         cop #$91
$00:a749  20 c6 a8      jsr $a8c6  ; -> Sub_00_a8c6
$00:a74c  b0 01         bcs $a74f
$00:a74e  6b            rtl
$00:a74f  4c 71 a8      jmp $a871
$00:a752  20 42 a8      jsr $a842  ; -> Sub_00_a842
$00:a755  bd 2e 00      lda $002e,x
$00:a758  29 ff 00      and #$00ff
$00:a75b  85 0c         sta $0c
$00:a75d  bd 26 00      lda $0026,x
$00:a760  0a            asl a
$00:a761  a8            tay
$00:a762  b9 8e ee      lda $ee8e,y
$00:a765  85 00         sta $00
$00:a767  20 ed a8      jsr $a8ed
$00:a76a  a9 5e a9      lda #$a95e
$00:a76d  99 18 00      sta $0018,y
$00:a770  b2 00         lda ($00)
$00:a772  e6 00         inc $00
$00:a774  e6 00         inc $00
$00:a776  99 00 00      sta $0000,y
$00:a779  b2 00         lda ($00)
$00:a77b  e6 00         inc $00
$00:a77d  e6 00         inc $00
$00:a77f  99 02 00      sta $0002,y
$00:a782  b9 1c 00      lda $001c,y
$00:a785  29 ff 3f      and #$3fff
$00:a788  12 00         ora ($00)
$00:a78a  e6 00         inc $00
$00:a78c  e6 00         inc $00
$00:a78e  99 1c 00      sta $001c,y
$00:a791  c6 0c         dec $0c
$00:a793  d0 d2         bne $a767
$00:a795  02 91         cop #$91
$00:a797  20 c6 a8      jsr $a8c6  ; -> Sub_00_a8c6
$00:a79a  b0 01         bcs $a79d
$00:a79c  6b            rtl
$00:a79d  4c 71 a8      jmp $a871
$00:a7a0  20 42 a8      jsr $a842  ; -> Sub_00_a842
$00:a7a3  02 91         cop #$91
$00:a7a5  bd 16 00      lda $0016,x
$00:a7a8  89 00 80      bit #$8000
$00:a7ab  f0 01         beq $a7ae
$00:a7ad  6b            rtl
$00:a7ae  b2 4a         lda ($4a)
$00:a7b0  d0 04         bne $a7b6
$00:a7b2  02 27         cop #$27
$00:a7b4  a5 a7         lda $a7
$00:a7b6  00 53         brk #$53
$00:a7b8  20 ed a8      jsr $a8ed
$00:a7bb  bd 1c 00      lda $001c,x
$00:a7be  18            clc
$00:a7bf  69 00 40      adc #$4000
$00:a7c2  9d 1c 00      sta $001c,x
$00:a7c5  20 13 a9      jsr $a913
$00:a7c8  02 91         cop #$91
$00:a7ca  20 c6 a8      jsr $a8c6  ; -> Sub_00_a8c6
$00:a7cd  90 d4         bcc $a7a3
$00:a7cf  4c 71 a8      jmp $a871
$00:a7d2  20 42 a8      jsr $a842  ; -> Sub_00_a842
$00:a7d5  bd 2e 00      lda $002e,x
$00:a7d8  29 ff 00      and #$00ff
$00:a7db  9d 2c 00      sta $002c,x
$00:a7de  02 91         cop #$91
$00:a7e0  bd 16 00      lda $0016,x
$00:a7e3  89 00 80      bit #$8000
$00:a7e6  f0 01         beq $a7e9
$00:a7e8  6b            rtl
$00:a7e9  b2 4a         lda ($4a)
$00:a7eb  d0 04         bne $a7f1
$00:a7ed  02 27         cop #$27
$00:a7ef  e0 a7 00      cpx #$00a7
$00:a7f2  53 20         eor ($20,s),y
$00:a7f4  ed a8 bd      sbc $bda8
$00:a7f7  1c 00 18      trb $1800
$00:a7fa  69 00 40      adc #$4000
$00:a7fd  9d 1c 00      sta $001c,x
$00:a800  20 13 a9      jsr $a913
$00:a803  de 2c 00      dec $002c,x
$00:a806  d0 d6         bne $a7de
$00:a808  02 91         cop #$91
$00:a80a  20 c6 a8      jsr $a8c6  ; -> Sub_00_a8c6
$00:a80d  b0 01         bcs $a810
$00:a80f  6b            rtl
$00:a810  4c 71 a8      jmp $a871
$00:a813  20 42 a8      jsr $a842  ; -> Sub_00_a842
$00:a816  02 91         cop #$91
$00:a818  bd 16 00      lda $0016,x
$00:a81b  89 00 80      bit #$8000
$00:a81e  f0 01         beq $a821
$00:a820  6b            rtl
$00:a821  02 0c         cop #$0c
$00:a823  00 02         brk #$02
$00:a825  28            plp
$00:a826  a8            tay
$00:a827  6b            rtl
$00:a828  b2 4a         lda ($4a)
$00:a82a  d0 04         bne $a830
$00:a82c  02 27         cop #$27
$00:a82e  18            clc
$00:a82f  a8            tay
$00:a830  00 53         brk #$53
$00:a832  20 ed a8      jsr $a8ed
$00:a835  20 13 a9      jsr $a913
$00:a838  02 91         cop #$91
$00:a83a  20 c6 a8      jsr $a8c6  ; -> Sub_00_a8c6
$00:a83d  90 d7         bcc $a816
$00:a83f  4c 71 a8      jmp $a871
Sub_00_a842:
$00:a842  9b            txy
$00:a843  bd 2c 00      lda $002c,x
$00:a846  d0 16         bne $a85e
$00:a848  bd 00 00      lda $0000,x
$00:a84b  85 16         sta $16
$00:a84d  bd 02 00      lda $0002,x
$00:a850  38            sec
$00:a851  e9 10 00      sbc #$0010
$00:a854  85 18         sta $18
$00:a856  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:a85a  8a            txa
$00:a85b  99 2c 00      sta $002c,y
$00:a85e  be 2c 00      ldx $002c,y
$00:a861  bf 00 80 7e   lda $7e8000,x
$00:a865  bb            tyx
$00:a866  29 ff 00      and #$00ff
$00:a869  c9 fd 00      cmp #$00fd
$00:a86c  f0 02         beq $a870
$00:a86e  68            pla
$00:a86f  6b            rtl
$00:a870  60            rts
$00:a871  02 91         cop #$91
$00:a873  ad 7b 1c      lda $1c7b
$00:a876  f0 01         beq $a879
$00:a878  6b            rtl
$00:a879  da            phx
$00:a87a  bd 00 00      lda $0000,x
$00:a87d  85 16         sta $16
$00:a87f  bd 02 00      lda $0002,x
$00:a882  38            sec
$00:a883  e9 10 00      sbc #$0010
$00:a886  85 18         sta $18
$00:a888  bd 34 00      lda $0034,x
$00:a88b  0a            asl a
$00:a88c  0a            asl a
$00:a88d  0a            asl a
$00:a88e  0a            asl a
$00:a88f  0a            asl a
$00:a890  aa            tax
$00:a891  e2 20         sep #$20
$00:a893  bd 15 ba      lda $ba15,x
$00:a896  f0 08         beq $a8a0
$00:a898  a9 fe         lda #$fe
$00:a89a  22 ac 87 02   jsl $0287ac
$00:a89e  80 06         bra $a8a6
$00:a8a0  a9 fe         lda #$fe
$00:a8a2  22 f1 86 02   jsl $0286f1
$00:a8a6  fa            plx
$00:a8a7  c2 20         rep #$20
$00:a8a9  02 a8         cop #$a8
$00:a8ab  00 80         brk #$80
$00:a8ad  0e a9 10      asl $10a9
$00:a8b0  03 9d         ora $9d,s
$00:a8b2  16 00         asl $00,x
$00:a8b4  9e 1c 00      stz $001c,x
$00:a8b7  02 a3         cop #$a3
$00:a8b9  02 a2         cop #$a2
$00:a8bb  30 00         bmi $a8bd
$00:a8bd  83 02         sta $02,s
$00:a8bf  80 01         bra $a8c2
$00:a8c1  02 82         cop #$82
$00:a8c3  02 86         cop #$86
$00:a8c5  6b            rtl
Sub_00_a8c6:
$00:a8c6  e2 20         sep #$20
$00:a8c8  bd 2e 00      lda $002e,x
$00:a8cb  dd 2f 00      cmp $002f,x
$00:a8ce  c2 20         rep #$20
$00:a8d0  d0 02         bne $a8d4
$00:a8d2  68            pla
$00:a8d3  6b            rtl
$00:a8d4  9b            txy
$00:a8d5  bd 34 00      lda $0034,x
$00:a8d8  aa            tax
$00:a8d9  e2 20         sep #$20
$00:a8db  b9 2e 00      lda $002e,y
$00:a8de  99 2f 00      sta $002f,y
$00:a8e1  18            clc
$00:a8e2  d0 05         bne $a8e9
$00:a8e4  38            sec
$00:a8e5  9f 03 02 7f   sta $7f0203,x
$00:a8e9  c2 20         rep #$20
$00:a8eb  bb            tyx
$00:a8ec  60            rts
$00:a8ed  da            phx
$00:a8ee  20 62 e6      jsr $e662  ; -> Sub_00_e662
$00:a8f1  bd 38 00      lda $0038,x
$00:a8f4  aa            tax
$00:a8f5  bd 06 80      lda $8006,x
$00:a8f8  09 00 80      ora #$8000
$00:a8fb  99 16 00      sta $0016,y
$00:a8fe  a9 28 a9      lda #$a928
$00:a901  99 18 00      sta $0018,y
$00:a904  e2 20         sep #$20
$00:a906  a9 00         lda #$00
$00:a908  99 36 00      sta $0036,y
$00:a90b  c2 20         rep #$20
$00:a90d  fa            plx
$00:a90e  8a            txa
$00:a90f  99 32 00      sta $0032,y
$00:a912  60            rts
$00:a913  bd 26 00      lda $0026,x
$00:a916  f0 0f         beq $a927
$00:a918  0a            asl a
$00:a919  18            clc
$00:a91a  7d 26 00      adc $0026,x
$00:a91d  3a            dec a
$00:a91e  9d 14 00      sta $0014,x
$00:a921  68            pla
$00:a922  1a            inc a
$00:a923  9d 18 00      sta $0018,x
$00:a926  6b            rtl
$00:a927  60            rts
$00:a928  02 a8         cop #$a8
$00:a92a  00 80         brk #$80
$00:a92c  0e a9 00      asl $00a9
$00:a92f  03 9d         ora $9d,s
$00:a931  16 00         asl $00,x
$00:a933  bd 1c 00      lda $001c,x
$00:a936  9d 30 00      sta $0030,x
$00:a939  ad 72 03      lda $0372
$00:a93c  9d 1c 00      sta $001c,x
$00:a93f  02 80         cop #$80
$00:a941  00 02         brk #$02
$00:a943  82 bd 30      brl $da03
$00:a946  00 9d         brk #$9d
$00:a948  1c 00 a9      trb $a900
$00:a94b  3c 00 9d      bit $9d00,x
$00:a94e  26 00         rol $00
$00:a950  bc 38 00      ldy $0038,x
$00:a953  b9 06 80      lda $8006,y
$00:a956  09 00 88      ora #$8800
$00:a959  9d 16 00      sta $0016,x
$00:a95c  80 0c         bra $a96a
$00:a95e  bc 38 00      ldy $0038,x
$00:a961  b9 06 80      lda $8006,y
$00:a964  09 00 80      ora #$8000
$00:a967  9d 16 00      sta $0016,x
$00:a96a  e2 20         sep #$20
$00:a96c  b9 0a 80      lda $800a,y
$00:a96f  9d 24 00      sta $0024,x
$00:a972  b9 0d 80      lda $800d,y
$00:a975  9d 36 00      sta $0036,x
$00:a978  48            pha
$00:a979  c2 20         rep #$20
$00:a97b  b9 05 80      lda $8005,y
$00:a97e  9d 1e 00      sta $001e,x
$00:a981  9e 20 00      stz $0020,x
$00:a984  b9 08 80      lda $8008,y
$00:a987  9d 22 00      sta $0022,x
$00:a98a  b9 0b 80      lda $800b,y
$00:a98d  9d 18 00      sta $0018,x
$00:a990  3a            dec a
$00:a991  48            pha
$00:a992  22 f3 88 00   jsl $0088f3  ; -> Sub_00_88f3
$00:a996  9e 04 00      stz $0004,x
$00:a999  9e 06 00      stz $0006,x
$00:a99c  6b            rtl
$00:a99d  ad 2e 03      lda $032e
$00:a9a0  f0 43         beq $a9e5
$00:a9a2  02 a8         cop #$a8
$00:a9a4  00 80         brk #$80
$00:a9a6  0e bd 16      asl $16bd
$00:a9a9  00 29         brk #$29
$00:a9ab  ff df 09 10   sbc $1009df,x
$00:a9af  00 9d         brk #$9d
$00:a9b1  16 00         asl $00,x
$00:a9b3  ad 72 03      lda $0372
$00:a9b6  9d 1c 00      sta $001c,x
$00:a9b9  02 a3         cop #$a3
$00:a9bb  02 a2         cop #$a2
$00:a9bd  30 bd         bmi $a97c
$00:a9bf  10 00         bpl $a9c1
$00:a9c1  38            sec
$00:a9c2  e9 10 00      sbc #$0010
$00:a9c5  4a            lsr a
$00:a9c6  18            clc
$00:a9c7  7d 00 00      adc $0000,x
$00:a9ca  9d 00 00      sta $0000,x
$00:a9cd  bd 12 00      lda $0012,x
$00:a9d0  38            sec
$00:a9d1  e9 10 00      sbc #$0010
$00:a9d4  4a            lsr a
$00:a9d5  49 ff ff      eor #$ffff
$00:a9d8  1a            inc a
$00:a9d9  18            clc
$00:a9da  7d 02 00      adc $0002,x
$00:a9dd  9d 02 00      sta $0002,x
$00:a9e0  02 80         cop #$80
$00:a9e2  02 02         cop #$02
$00:a9e4  82 02 86      brl $2fe9
$00:a9e7  6b            rtl
$00:a9e8  02 94         cop #$94
$00:a9ea  80 fc         bra $a9e8
$00:a9ec  e2 20         sep #$20
$00:a9ee  a9 00         lda #$00
$00:a9f0  9d 36 00      sta $0036,x
$00:a9f3  c2 20         rep #$20
$00:a9f5  a9 00 03      lda #$0300
$00:a9f8  9d 16 00      sta $0016,x
$00:a9fb  02 a3         cop #$a3
$00:a9fd  ad 72 03      lda $0372
$00:aa00  9d 1c 00      sta $001c,x
$00:aa03  02 a8         cop #$a8
$00:aa05  00 80         brk #$80
$00:aa07  0e 02 80      asl $8002
$00:aa0a  10 02         bpl $aa0e
$00:aa0c  82 02 86      brl $3011
$00:aa0f  6b            rtl
$00:aa10  ec 9a 03      cpx $039a
$00:aa13  d0 03         bne $aa18
$00:aa15  82 7e 01      brl $ab96
$00:aa18  02 a8         cop #$a8
$00:aa1a  00 80         brk #$80
$00:aa1c  0e a9 00      asl $00a9
$00:aa1f  03 9d         ora $9d,s
$00:aa21  16 00         asl $00,x
$00:aa23  9e 1a 00      stz $001a,x
$00:aa26  ad 72 03      lda $0372
$00:aa29  9d 1c 00      sta $001c,x
$00:aa2c  bd 10 00      lda $0010,x
$00:aa2f  38            sec
$00:aa30  e9 10 00      sbc #$0010
$00:aa33  4a            lsr a
$00:aa34  18            clc
$00:aa35  7d 00 00      adc $0000,x
$00:aa38  9d 00 00      sta $0000,x
$00:aa3b  bd 12 00      lda $0012,x
$00:aa3e  38            sec
$00:aa3f  e9 10 00      sbc #$0010
$00:aa42  4a            lsr a
$00:aa43  49 ff ff      eor #$ffff
$00:aa46  1a            inc a
$00:aa47  18            clc
$00:aa48  7d 02 00      adc $0002,x
$00:aa4b  9d 02 00      sta $0002,x
$00:aa4e  ad ba 03      lda $03ba
$00:aa51  c9 06 00      cmp #$0006
$00:aa54  d0 03         bne $aa59
$00:aa56  a9 19 00      lda #$0019
$00:aa59  0a            asl a
$00:aa5a  48            pha
$00:aa5b  1a            inc a
$00:aa5c  85 16         sta $16
$00:aa5e  68            pla
$00:aa5f  0a            asl a
$00:aa60  18            clc
$00:aa61  69 04 00      adc #$0004
$00:aa64  85 18         sta $18
$00:aa66  ad 5e 1b      lda $1b5e
$00:aa69  c9 04 00      cmp #$0004
$00:aa6c  d0 04         bne $aa72
$00:aa6e  06 16         asl $16
$00:aa70  06 18         asl $18
$00:aa72  02 1f         cop #$1f
$00:aa74  02 35         cop #$35
$00:aa76  64 ad         stz $ad
$00:aa78  37 04         and [$04],y
$00:aa7a  c5 18         cmp $18
$00:aa7c  b0 16         bcs $aa94
$00:aa7e  c5 16         cmp $16
$00:aa80  b0 09         bcs $aa8b
$00:aa82  02 b0         cop #$b0
$00:aa84  fa            plx
$00:aa85  ae 00 00      ldx $0000
$00:aa88  40            rti
$00:aa89  80 10         bra $aa9b
$00:aa8b  02 b0         cop #$b0
$00:aa8d  ea            nop
$00:aa8e  ae 00 00      ldx $0000
$00:aa91  40            rti
$00:aa92  80 07         bra $aa9b
$00:aa94  02 b0         cop #$b0
$00:aa96  da            phx
$00:aa97  ae 00 00      ldx $0000
$00:aa9a  40            rti
$00:aa9b  02 80         cop #$80
$00:aa9d  03 02         ora $02,s
$00:aa9f  82 02 a3      brl $4da4
$00:aaa2  02 a2         cop #$a2
$00:aaa4  30 02         bmi $aaa8
$00:aaa6  a8            tay
$00:aaa7  00 f0         brk #$f0
$00:aaa9  7e 02 a0      ror $a002,x
$00:aaac  f0 ff         beq $aaad
$00:aaae  da            phx
$00:aaaf  bc 38 00      ldy $0038,x
$00:aab2  b9 03 80      lda $8003,y
$00:aab5  85 00         sta $00
$00:aab7  9b            txy
$00:aab8  8a            txa
$00:aab9  38            sec
$00:aaba  e9 00 08      sbc #$0800
$00:aabd  4a            lsr a
$00:aabe  4a            lsr a
$00:aabf  4a            lsr a
$00:aac0  4a            lsr a
$00:aac1  4a            lsr a
$00:aac2  4a            lsr a
$00:aac3  9d 1e 00      sta $001e,x
$00:aac6  9e 20 00      stz $0020,x
$00:aac9  0a            asl a
$00:aaca  aa            tax
$00:aacb  bf 00 f0 7e   lda $7ef000,x
$00:aacf  aa            tax
$00:aad0  bf 06 00 7e   lda $7e0006,x
$00:aad4  18            clc
$00:aad5  69 0e 00      adc #$000e
$00:aad8  38            sec
$00:aad9  e9 00 f0      sbc #$f000
$00:aadc  aa            tax
$00:aadd  a5 00         lda $00
$00:aadf  c9 00 10      cmp #$1000
$00:aae2  b0 43         bcs $ab27
$00:aae4  c9 00 01      cmp #$0100
$00:aae7  b0 2b         bcs $ab14
$00:aae9  c9 10 00      cmp #$0010
$00:aaec  b0 13         bcs $ab01
$00:aaee  a9 01 00      lda #$0001
$00:aaf1  9f fe ef 7e   sta $7eeffe,x
$00:aaf5  b9 00 00      lda $0000,y
$00:aaf8  18            clc
$00:aaf9  69 05 00      adc #$0005
$00:aafc  99 00 00      sta $0000,y
$00:aaff  80 46         bra $ab47
$00:ab01  a9 02 00      lda #$0002
$00:ab04  9f fe ef 7e   sta $7eeffe,x
$00:ab08  b9 00 00      lda $0000,y
$00:ab0b  18            clc
$00:ab0c  69 03 00      adc #$0003
$00:ab0f  99 00 00      sta $0000,y
$00:ab12  80 2e         bra $ab42
$00:ab14  a9 03 00      lda #$0003
$00:ab17  9f fe ef 7e   sta $7eeffe,x
$00:ab1b  b9 00 00      lda $0000,y
$00:ab1e  18            clc
$00:ab1f  69 01 00      adc #$0001
$00:ab22  99 00 00      sta $0000,y
$00:ab25  80 16         bra $ab3d
$00:ab27  a9 04 00      lda #$0004
$00:ab2a  9f fe ef 7e   sta $7eeffe,x
$00:ab2e  b9 00 00      lda $0000,y
$00:ab31  18            clc
$00:ab32  69 ff ff      adc #$ffff
$00:ab35  99 00 00      sta $0000,y
$00:ab38  a5 01         lda $01
$00:ab3a  20 57 ab      jsr $ab57
$00:ab3d  a5 01         lda $01
$00:ab3f  20 5b ab      jsr $ab5b
$00:ab42  a5 00         lda $00
$00:ab44  20 57 ab      jsr $ab57
$00:ab47  a5 00         lda $00
$00:ab49  20 5b ab      jsr $ab5b
$00:ab4c  fa            plx
$00:ab4d  02 91         cop #$91
$00:ab4f  02 82         cop #$82
$00:ab51  02 1b         cop #$1b
$00:ab53  7e ab 10      ror $10ab,x
$00:ab56  00 4a         brk #$4a
$00:ab58  4a            lsr a
$00:ab59  4a            lsr a
$00:ab5a  4a            lsr a
$00:ab5b  29 0f 00      and #$000f
$00:ab5e  da            phx
$00:ab5f  aa            tax
$00:ab60  bf 74 ab 00   lda $00ab74,x
$00:ab64  fa            plx
$00:ab65  e2 20         sep #$20
$00:ab67  9f 05 f0 7e   sta $7ef005,x
$00:ab6b  c2 20         rep #$20
$00:ab6d  8a            txa
$00:ab6e  18            clc
$00:ab6f  69 07 00      adc #$0007
$00:ab72  aa            tax
$00:ab73  60            rts
$00:ab74  b7 c8         lda [$c8],y
$00:ab76  c9 d8 d9      cmp #$d9d8
$00:ab79  ce cf de      dec $decf
$00:ab7c  df a7 bc 32   cmp $32bca7,x
$00:ab80  00 d0         brk #$d0
$00:ab82  03 82         ora $82,s
$00:ab84  ba            tsx
$00:ab85  01 e2         ora ($e2,x)
$00:ab87  20 b9 2e      jsr $2eb9
$00:ab8a  00 f0         brk #$f0
$00:ab8c  04 3a         tsb $3a
$00:ab8e  99 2e 00      sta $002e,y
$00:ab91  c2 20         rep #$20
$00:ab93  02 86         cop #$86
$00:ab95  6b            rtl
$00:ab96  a9 00 07      lda #$0700
$00:ab99  9d 16 00      sta $0016,x
$00:ab9c  9e 04 00      stz $0004,x
$00:ab9f  9e 06 00      stz $0006,x
$00:aba2  ee 2d 04      inc $042d
$00:aba5  bd 00 00      lda $0000,x
$00:aba8  38            sec
$00:aba9  fd 08 00      sbc $0008,x
$00:abac  8d 25 04      sta $0425
$00:abaf  bd 02 00      lda $0002,x
$00:abb2  38            sec
$00:abb3  fd 0a 00      sbc $000a,x
$00:abb6  8d 27 04      sta $0427
$00:abb9  bd 08 00      lda $0008,x
$00:abbc  18            clc
$00:abbd  7d 0c 00      adc $000c,x
$00:abc0  8d 29 04      sta $0429
$00:abc3  bd 0a 00      lda $000a,x
$00:abc6  18            clc
$00:abc7  7d 0e 00      adc $000e,x
$00:abca  8d 2b 04      sta $042b
$00:abcd  02 03         cop #$03
$00:abcf  20 02 84      jsr $8402
$00:abd2  fe ab 00      inc $00ab,x
$00:abd5  a9 03 00      lda #$0003
$00:abd8  9d 14 00      sta $0014,x
$00:abdb  02 04         cop #$04
$00:abdd  ec 9a 03      cpx $039a
$00:abe0  d0 9c         bne $ab7e
$00:abe2  20 63 ac      jsr $ac63
$00:abe5  ad 6a 1c      lda $1c6a
$00:abe8  c9 7d 00      cmp #$007d
$00:abeb  d0 0c         bne $abf9
$00:abed  e2 20         sep #$20
$00:abef  a9 00         lda #$00
$00:abf1  48            pha
$00:abf2  c2 20         rep #$20
$00:abf4  a9 53 d3      lda #$d353
$00:abf7  48            pha
$00:abf8  6b            rtl
$00:abf9  02 31         cop #$31
$00:abfb  02 80         cop #$80
$00:abfd  80 02         bra $ac01
$00:abff  a8            tay
$00:ac00  00 80         brk #$80
$00:ac02  0e 02 a3      asl $a302
$00:ac05  ad 72 03      lda $0372
$00:ac08  9d 1c 00      sta $001c,x
$00:ac0b  bd 16 00      lda $0016,x
$00:ac0e  29 ff df      and #$dfff
$00:ac11  9d 16 00      sta $0016,x
$00:ac14  02 1f         cop #$1f
$00:ac16  e2 20         sep #$20
$00:ac18  ad 02 03      lda $0302
$00:ac1b  29 7f         and #$7f
$00:ac1d  38            sec
$00:ac1e  ed 29 04      sbc $0429
$00:ac21  10 fa         bpl $ac1d
$00:ac23  18            clc
$00:ac24  6d 29 04      adc $0429
$00:ac27  c2 20         rep #$20
$00:ac29  29 ff 00      and #$00ff
$00:ac2c  18            clc
$00:ac2d  6d 25 04      adc $0425
$00:ac30  9d 00 00      sta $0000,x
$00:ac33  02 1f         cop #$1f
$00:ac35  e2 20         sep #$20
$00:ac37  ad 02 03      lda $0302
$00:ac3a  29 7f         and #$7f
$00:ac3c  38            sec
$00:ac3d  ed 2b 04      sbc $042b
$00:ac40  10 fa         bpl $ac3c
$00:ac42  18            clc
$00:ac43  6d 2b 04      adc $042b
$00:ac46  c2 20         rep #$20
$00:ac48  48            pha
$00:ac49  29 ff 00      and #$00ff
$00:ac4c  18            clc
$00:ac4d  6d 27 04      adc $0427
$00:ac50  9d 02 00      sta $0002,x
$00:ac53  68            pla
$00:ac54  29 01 00      and #$0001
$00:ac57  d0 02         bne $ac5b
$00:ac59  00 85         brk #$85
$00:ac5b  02 80         cop #$80
$00:ac5d  00 02         brk #$02
$00:ac5f  82 02 86      brl $3264
$00:ac62  6b            rtl
$00:ac63  da            phx
$00:ac64  ad a6 06      lda $06a6
$00:ac67  80 03         bra $ac6c
$00:ac69  bd 3e 00      lda $003e,x
$00:ac6c  aa            tax
$00:ac6d  f0 0c         beq $ac7b
$00:ac6f  bd 16 00      lda $0016,x
$00:ac72  89 d0 24      bit #$24d0
$00:ac75  d0 f2         bne $ac69
$00:ac77  02 86         cop #$86
$00:ac79  80 ee         bra $ac69
$00:ac7b  fa            plx
$00:ac7c  60            rts
$00:ac7d  08            php
$00:ac7e  da            phx
$00:ac7f  c2 20         rep #$20
$00:ac81  ad a6 06      lda $06a6
$00:ac84  80 03         bra $ac89
$00:ac86  bd 3e 00      lda $003e,x
$00:ac89  aa            tax
$00:ac8a  f0 0c         beq $ac98
$00:ac8c  bd 16 00      lda $0016,x
$00:ac8f  89 20 00      bit #$0020
$00:ac92  f0 f2         beq $ac86
$00:ac94  02 86         cop #$86
$00:ac96  80 ee         bra $ac86
$00:ac98  fa            plx
$00:ac99  28            plp
$00:ac9a  6b            rtl
$00:ac9b  e2 20         sep #$20
$00:ac9d  a9 f1         lda #$f1
$00:ac9f  8d 40 21      sta $2140
$00:aca2  c2 20         rep #$20
$00:aca4  02 27         cop #$27
$00:aca6  a8            tay
$00:aca7  ac ad 40      ldy $40ad
$00:acaa  21 29         and ($29,x)
$00:acac  ff 00 c9 f1   sbc $f1c900,x
$00:acb0  00 f0         brk #$f0
$00:acb2  01 6b         ora ($6b,x)
$00:acb4  e2 20         sep #$20
$00:acb6  a9 01         lda #$01
$00:acb8  8d 40 21      sta $2140
$00:acbb  c2 20         rep #$20
$00:acbd  02 27         cop #$27
$00:acbf  c1 ac         cmp ($ac,x)
$00:acc1  e2 20         sep #$20
$00:acc3  ad 40 21      lda $2140
$00:acc6  c2 20         rep #$20
$00:acc8  f0 01         beq $accb
$00:acca  6b            rtl
$00:accb  e2 20         sep #$20
$00:accd  a9 f0         lda #$f0
$00:accf  8d 40 21      sta $2140
$00:acd2  c2 20         rep #$20
$00:acd4  02 27         cop #$27
$00:acd6  d8            cld
$00:acd7  ac e2 20      ldy $20e2
$00:acda  ad 40 21      lda $2140
$00:acdd  c2 20         rep #$20
$00:acdf  f0 01         beq $ace2
$00:ace1  6b            rtl
$00:ace2  02 1b         cop #$1b
$00:ace4  e8            inx
$00:ace5  ac 02 00      ldy $0002
$00:ace8  e2 20         sep #$20
$00:acea  a9 ff         lda #$ff
$00:acec  8d 40 21      sta $2140
$00:acef  c2 20         rep #$20
$00:acf1  bd 30 00      lda $0030,x
$00:acf4  0a            asl a
$00:acf5  18            clc
$00:acf6  7d 30 00      adc $0030,x
$00:acf9  a8            tay
$00:acfa  9e 30 00      stz $0030,x
$00:acfd  b9 49 fb      lda $fb49,y
$00:ad00  85 29         sta $29
$00:ad02  8d 22 04      sta $0422
$00:ad05  e2 20         sep #$20
$00:ad07  b9 4b fb      lda $fb4b,y
$00:ad0a  85 2b         sta $2b
$00:ad0c  8d 24 04      sta $0424
$00:ad0f  c2 20         rep #$20
$00:ad11  da            phx
$00:ad12  e2 20         sep #$20
$00:ad14  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$00:ad18  22 ae b1 02   jsl $02b1ae  ; -> EnableNMI
$00:ad1c  22 f5 ef 1f   jsl $1feff5
$00:ad20  22 b7 b1 02   jsl $02b1b7  ; -> DisableNMI
$00:ad24  22 a2 b1 02   jsl $02b1a2  ; -> WaitVBlank
$00:ad28  c2 20         rep #$20
$00:ad2a  fa            plx
$00:ad2b  02 1b         cop #$1b
$00:ad2d  31 ad         and ($ad),y
$00:ad2f  02 00         cop #$00
$00:ad31  e2 20         sep #$20
$00:ad33  a9 01         lda #$01
$00:ad35  8d 40 21      sta $2140
$00:ad38  c2 20         rep #$20
$00:ad3a  9c 58 04      stz $0458
$00:ad3d  02 86         cop #$86
$00:ad3f  6b            rtl
$00:ad40  bd 1a 00      lda $001a,x
$00:ad43  89 00 10      bit #$1000
$00:ad46  f0 1c         beq $ad64
$00:ad48  a9 58 02      lda #$0258
$00:ad4b  9d 26 00      sta $0026,x
$00:ad4e  02 91         cop #$91
$00:ad50  bd 16 00      lda $0016,x
$00:ad53  89 00 80      bit #$8000
$00:ad56  d0 01         bne $ad59
$00:ad58  6b            rtl
$00:ad59  de 26 00      dec $0026,x
$00:ad5c  30 01         bmi $ad5f
$00:ad5e  6b            rtl
$00:ad5f  22 ab 93 00   jsl $0093ab
$00:ad63  6b            rtl
$00:ad64  02 86         cop #$86
$00:ad66  6b            rtl
$00:ad67  98            tya
$00:ad68  9d 1e 00      sta $001e,x
$00:ad6b  9e 20 00      stz $0020,x
$00:ad6e  02 85         cop #$85
$00:ad70  96 ad         stx $ad,y
$00:ad72  00 c0         brk #$c0
$00:ad74  aa            tax
$00:ad75  06 f0         asl $f0
$00:ad77  1b            tcs
$00:ad78  e2 20         sep #$20
$00:ad7a  a9 00         lda #$00
$00:ad7c  9d 36 00      sta $0036,x
$00:ad7f  c2 20         rep #$20
$00:ad81  02 91         cop #$91
$00:ad83  02 82         cop #$82
$00:ad85  bd 16 00      lda $0016,x
$00:ad88  89 00 80      bit #$8000
$00:ad8b  f0 f6         beq $ad83
$00:ad8d  bc 3e 00      ldy $003e,x
$00:ad90  99 30 00      sta $0030,y
$00:ad93  02 86         cop #$86
$00:ad95  6b            rtl
$00:ad96  bd 3c 00      lda $003c,x
$00:ad99  9d 30 00      sta $0030,x
$00:ad9c  ad 74 03      lda $0374
$00:ad9f  38            sec
$00:ada0  fd 00 00      sbc $0000,x
$00:ada3  30 1f         bmi $adc4
$00:ada5  85 16         sta $16
$00:ada7  ad 76 03      lda $0376
$00:adaa  38            sec
$00:adab  fd 02 00      sbc $0002,x
$00:adae  30 08         bmi $adb8
$00:adb0  85 18         sta $18
$00:adb2  c5 16         cmp $16
$00:adb4  b0 6d         bcs $ae23
$00:adb6  80 59         bra $ae11
$00:adb8  49 ff ff      eor #$ffff
$00:adbb  1a            inc a
$00:adbc  85 18         sta $18
$00:adbe  c5 16         cmp $16
$00:adc0  b0 28         bcs $adea
$00:adc2  80 3b         bra $adff
$00:adc4  49 ff ff      eor #$ffff
$00:adc7  1a            inc a
$00:adc8  85 16         sta $16
$00:adca  ad 76 03      lda $0376
$00:adcd  38            sec
$00:adce  fd 02 00      sbc $0002,x
$00:add1  30 08         bmi $addb
$00:add3  85 18         sta $18
$00:add5  c5 16         cmp $16
$00:add7  b0 5c         bcs $ae35
$00:add9  80 6c         bra $ae47
$00:addb  49 ff ff      eor #$ffff
$00:adde  1a            inc a
$00:addf  85 18         sta $18
$00:ade1  c5 16         cmp $16
$00:ade3  90 03         bcc $ade8
$00:ade5  82 83 00      brl $ae6b
$00:ade8  80 6f         bra $ae59
$00:adea  20 9c ae      jsr $ae9c
$00:aded  02 91         cop #$91
$00:adef  de 02 00      dec $0002,x
$00:adf2  de 10 00      dec $0010,x
$00:adf5  f0 03         beq $adfa
$00:adf7  82 89 00      brl $ae83
$00:adfa  fe 00 00      inc $0000,x
$00:adfd  80 7e         bra $ae7d
$00:adff  20 a4 ae      jsr $aea4
$00:ae02  02 91         cop #$91
$00:ae04  fe 00 00      inc $0000,x
$00:ae07  de 10 00      dec $0010,x
$00:ae0a  d0 77         bne $ae83
$00:ae0c  de 02 00      dec $0002,x
$00:ae0f  80 6c         bra $ae7d
$00:ae11  20 a4 ae      jsr $aea4
$00:ae14  02 91         cop #$91
$00:ae16  fe 00 00      inc $0000,x
$00:ae19  de 10 00      dec $0010,x
$00:ae1c  d0 65         bne $ae83
$00:ae1e  fe 02 00      inc $0002,x
$00:ae21  80 5a         bra $ae7d
$00:ae23  20 9c ae      jsr $ae9c
$00:ae26  02 91         cop #$91
$00:ae28  fe 02 00      inc $0002,x
$00:ae2b  de 10 00      dec $0010,x
$00:ae2e  d0 53         bne $ae83
$00:ae30  fe 00 00      inc $0000,x
$00:ae33  80 48         bra $ae7d
$00:ae35  20 9c ae      jsr $ae9c
$00:ae38  02 91         cop #$91
$00:ae3a  fe 02 00      inc $0002,x
$00:ae3d  de 10 00      dec $0010,x
$00:ae40  d0 41         bne $ae83
$00:ae42  de 00 00      dec $0000,x
$00:ae45  80 36         bra $ae7d
$00:ae47  20 a4 ae      jsr $aea4
$00:ae4a  02 91         cop #$91
$00:ae4c  de 00 00      dec $0000,x
$00:ae4f  de 10 00      dec $0010,x
$00:ae52  d0 2f         bne $ae83
$00:ae54  fe 02 00      inc $0002,x
$00:ae57  80 24         bra $ae7d
$00:ae59  20 a4 ae      jsr $aea4
$00:ae5c  02 91         cop #$91
$00:ae5e  de 00 00      dec $0000,x
$00:ae61  de 10 00      dec $0010,x
$00:ae64  d0 1d         bne $ae83
$00:ae66  de 02 00      dec $0002,x
$00:ae69  80 12         bra $ae7d
$00:ae6b  20 9c ae      jsr $ae9c
$00:ae6e  02 91         cop #$91
$00:ae70  de 02 00      dec $0002,x
$00:ae73  de 10 00      dec $0010,x
$00:ae76  d0 0b         bne $ae83
$00:ae78  de 00 00      dec $0000,x
$00:ae7b  80 00         bra $ae7d
$00:ae7d  bd 12 00      lda $0012,x
$00:ae80  9d 10 00      sta $0010,x
$00:ae83  bd 3c 00      lda $003c,x
$00:ae86  dd 30 00      cmp $0030,x
$00:ae89  d0 0e         bne $ae99
$00:ae8b  a8            tay
$00:ae8c  bd 00 00      lda $0000,x
$00:ae8f  99 00 00      sta $0000,y
$00:ae92  bd 02 00      lda $0002,x
$00:ae95  99 02 00      sta $0002,y
$00:ae98  6b            rtl
$00:ae99  02 86         cop #$86
$00:ae9b  6b            rtl
$00:ae9c  e2 20         sep #$20
$00:ae9e  a4 18         ldy $18
$00:aea0  a5 16         lda $16
$00:aea2  80 06         bra $aeaa
$00:aea4  e2 20         sep #$20
$00:aea6  a4 16         ldy $16
$00:aea8  a5 18         lda $18
$00:aeaa  d0 01         bne $aead
$00:aeac  1a            inc a
$00:aead  22 e8 b1 02   jsl $02b1e8
$00:aeb1  c2 20         rep #$20
$00:aeb3  29 ff 00      and #$00ff
$00:aeb6  d0 01         bne $aeb9
$00:aeb8  1a            inc a
$00:aeb9  9d 10 00      sta $0010,x
$00:aebc  9d 12 00      sta $0012,x
$00:aebf  60            rts
$00:aec0  02 a8         cop #$a8
$00:aec2  00 80         brk #$80
$00:aec4  0e a9 00      asl $00a9
$00:aec7  40            rti
$00:aec8  9d 16 00      sta $0016,x
$00:aecb  02 a4         cop #$a4
$00:aecd  ad 72 03      lda $0372
$00:aed0  9d 1c 00      sta $001c,x
$00:aed3  02 80         cop #$80
$00:aed5  07 02         ora [$02]
$00:aed7  82 80 f9      brl $a85a
$00:aeda  02 a4         cop #$a4
$00:aedc  02 80         cop #$80
$00:aede  04 02         tsb $02
$00:aee0  82 02 81      brl $2fe5
$00:aee3  09 04 02      ora #$0204
$00:aee6  83 02         sta $02,s
$00:aee8  86 6b         stx $6b
$00:aeea  02 a4         cop #$a4
$00:aeec  02 80         cop #$80
$00:aeee  05 02         ora $02
$00:aef0  82 02 81      brl $2ff5
$00:aef3  0a            asl a
$00:aef4  04 02         tsb $02
$00:aef6  83 02         sta $02,s
$00:aef8  86 6b         stx $6b
$00:aefa  02 a4         cop #$a4
$00:aefc  02 80         cop #$80
$00:aefe  06 02         asl $02
$00:af00  82 02 81      brl $3005
$00:af03  0b            phd
$00:af04  04 02         tsb $02
$00:af06  83 02         sta $02,s
$00:af08  86 6b         stx $6b
$00:af0a  08            php
$00:af0b  5a            phy
$00:af0c  c2 20         rep #$20
$00:af0e  00 4d         brk #$4d
$00:af10  bd 1e 00      lda $001e,x
$00:af13  c9 06 00      cmp #$0006
$00:af16  f0 19         beq $af31
$00:af18  c9 05 00      cmp #$0005
$00:af1b  f0 19         beq $af36
$00:af1d  c9 04 00      cmp #$0004
$00:af20  f0 19         beq $af3b
$00:af22  c9 0b 00      cmp #$000b
$00:af25  f0 0a         beq $af31
$00:af27  c9 0a 00      cmp #$000a
$00:af2a  f0 0a         beq $af36
$00:af2c  c9 09 00      cmp #$0009
$00:af2f  f0 0a         beq $af3b
$00:af31  a9 10 00      lda #$0010
$00:af34  80 08         bra $af3e
$00:af36  a9 05 00      lda #$0005
$00:af39  80 03         bra $af3e
$00:af3b  a9 01 00      lda #$0001
$00:af3e  22 a5 f6 04   jsl $04f6a5
$00:af42  a9 10 00      lda #$0010
$00:af45  0c 32 03      tsb $0332
$00:af48  bd 16 00      lda $0016,x
$00:af4b  09 00 20      ora #$2000
$00:af4e  9d 16 00      sta $0016,x
$00:af51  02 86         cop #$86
$00:af53  7a            ply
$00:af54  28            plp
$00:af55  6b            rtl
$00:af56  ad 86 1b      lda $1b86
$00:af59  c9 32 00      cmp #$0032
$00:af5c  90 03         bcc $af61
$00:af5e  82 a1 00      brl $b002
$00:af61  0a            asl a
$00:af62  0a            asl a
$00:af63  a8            tay
$00:af64  b9 b8 fb      lda $fbb8,y
$00:af67  8d 7e 1b      sta $1b7e
$00:af6a  b9 ba fb      lda $fbba,y
$00:af6d  8d 7c 1b      sta $1b7c
$00:af70  02 91         cop #$91
$00:af72  ad 78 1b      lda $1b78
$00:af75  38            sec
$00:af76  ed 7c 1b      sbc $1b7c
$00:af79  ad 7a 1b      lda $1b7a
$00:af7c  ed 7e 1b      sbc $1b7e
$00:af7f  b0 01         bcs $af82
$00:af81  6b            rtl
$00:af82  ad 8a 1b      lda $1b8a
$00:af85  18            clc
$00:af86  69 02 00      adc #$0002
$00:af89  c9 65 00      cmp #$0065
$00:af8c  90 03         bcc $af91
$00:af8e  a9 64 00      lda #$0064
$00:af91  8d 8a 1b      sta $1b8a
$00:af94  ad 88 1b      lda $1b88
$00:af97  18            clc
$00:af98  69 02 00      adc #$0002
$00:af9b  c9 65 00      cmp #$0065
$00:af9e  90 03         bcc $afa3
$00:afa0  a9 64 00      lda #$0064
$00:afa3  8d 88 1b      sta $1b88
$00:afa6  02 37         cop #$37
$00:afa8  ee 86 1b      inc $1b86
$00:afab  f8            sed
$00:afac  ad 6a 1b      lda $1b6a
$00:afaf  18            clc
$00:afb0  69 01 00      adc #$0001
$00:afb3  8d 6a 1b      sta $1b6a
$00:afb6  d8            cld
$00:afb7  4a            lsr a
$00:afb8  b0 05         bcs $afbf
$00:afba  ee 72 1b      inc $1b72
$00:afbd  80 03         bra $afc2
$00:afbf  ee 76 1b      inc $1b76
$00:afc2  a9 1f 00      lda #$001f
$00:afc5  0c 32 03      tsb $0332
$00:afc8  ad 86 1b      lda $1b86
$00:afcb  0a            asl a
$00:afcc  0a            asl a
$00:afcd  a8            tay
$00:afce  b9 b8 fb      lda $fbb8,y
$00:afd1  8d 7e 1b      sta $1b7e
$00:afd4  b9 ba fb      lda $fbba,y
$00:afd7  8d 7c 1b      sta $1b7c
$00:afda  00 97         brk #$97
$00:afdc  02 03         cop #$03
$00:afde  03 da         ora $da,s
$00:afe0  a0 16 c5      ldy #$c516
$00:afe3  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:afe7  fa            plx
$00:afe8  02 1b         cop #$1b
$00:afea  ee af 14      inc $14af
$00:afed  00 da         brk #$da
$00:afef  a0 27 c5      ldy #$c527
$00:aff2  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:aff6  fa            plx
$00:aff7  02 1b         cop #$1b
$00:aff9  fd af 0a      sbc $0aaf,x
$00:affc  00 02         brk #$02
$00:affe  04 82         tsb $82
$00:b000  54 ff 02      mvn $02,$ff
$00:b003  86 6b         stx $6b
UpdateCollision:
$00:b005  08            php
$00:b006  c2 20         rep #$20
$00:b008  ae 9c 03      ldx $039c
$00:b00b  bd 16 00      lda $0016,x
$00:b00e  89 00 04      bit #$0400
$00:b011  d0 4a         bne $b05d
$00:b013  ad 88 1b      lda $1b88
$00:b016  0d 3b 04      ora $043b
$00:b019  d0 42         bne $b05d
$00:b01b  02 19         cop #$19
$00:b01d  38            sec
$00:b01e  2b            pld
$00:b01f  b0 ad         bcs $afce
$00:b021  8a            txa
$00:b022  1b            tcs
$00:b023  8d 3b 04      sta $043b
$00:b026  02 0b         cop #$0b
$00:b028  38            sec
$00:b029  80 32         bra $b05d
$00:b02b  02 19         cop #$19
$00:b02d  39 35 b0      and $b035,y
$00:b030  02 0b         cop #$0b
$00:b032  39 80 0d      and $0d80,y
$00:b035  02 19         cop #$19
$00:b037  40            rti
$00:b038  3c b0 80      bit $80b0,x
$00:b03b  06 9c         asl $9c
$00:b03d  66 1b         ror $1b
$00:b03f  9c 68 1b      stz $1b68
$00:b042  bd 16 00      lda $0016,x
$00:b045  29 ff f7      and #$f7ff
$00:b048  9d 16 00      sta $0016,x
$00:b04b  bd 16 00      lda $0016,x
$00:b04e  09 00 04      ora #$0400
$00:b051  9d 16 00      sta $0016,x
$00:b054  a9 80 20      lda #$2080
$00:b057  8d 26 03      sta $0326
$00:b05a  ee 3f 04      inc $043f
$00:b05d  28            plp
$00:b05e  6b            rtl
$00:b05f  e2 20         sep #$20
$00:b061  a9 00         lda #$00
$00:b063  9d 36 00      sta $0036,x
$00:b066  c2 20         rep #$20
$00:b068  bd 16 00      lda $0016,x
$00:b06b  29 f7 df      and #$dff7
$00:b06e  9d 16 00      sta $0016,x
$00:b071  02 a8         cop #$a8
$00:b073  00 80         brk #$80
$00:b075  0e bd 1c      asl $1cbd
$00:b078  00 9d         brk #$9d
$00:b07a  32 00         and ($00)
$00:b07c  29 ff fe      and #$feff
$00:b07f  9d 1c 00      sta $001c,x
$00:b082  02 15         cop #$15
$00:b084  02 80         cop #$80
$00:b086  0d 02 82      ora $8202
$00:b089  bd 34 00      lda $0034,x
$00:b08c  0a            asl a
$00:b08d  0a            asl a
$00:b08e  0a            asl a
$00:b08f  0a            asl a
$00:b090  0a            asl a
$00:b091  a8            tay
$00:b092  b9 2b ba      lda $ba2b,y
$00:b095  a0 de 1a      ldy #$1ade
$00:b098  22 a2 f3 04   jsl $04f3a2  ; -> Sub_04_f3a2
$00:b09c  90 e6         bcc $b084
$00:b09e  02 16         cop #$16
$00:b0a0  bd 34 00      lda $0034,x
$00:b0a3  a0 9e 1a      ldy #$1a9e
$00:b0a6  22 48 f3 04   jsl $04f348  ; -> Sub_04_f348
$00:b0aa  a0 de 1a      ldy #$1ade
$00:b0ad  22 48 f3 04   jsl $04f348  ; -> Sub_04_f348
$00:b0b1  da            phx
$00:b0b2  aa            tax
$00:b0b3  bf 03 02 7f   lda $7f0203,x
$00:b0b7  29 bf ff      and #$ffbf
$00:b0ba  9f 03 02 7f   sta $7f0203,x
$00:b0be  fa            plx
$00:b0bf  02 a8         cop #$a8
$00:b0c1  00 38         brk #$38
$00:b0c3  7e bd 32      ror $32bd,x
$00:b0c6  00 9d         brk #$9d
$00:b0c8  1c 00 bc      trb $bc00
$00:b0cb  38            sec
$00:b0cc  00 e2         brk #$e2
$00:b0ce  20 b9 05      jsr $05b9
$00:b0d1  80 9d         bra $b070
$00:b0d3  1e 00 b9      asl $b900,x
$00:b0d6  0a            asl a
$00:b0d7  80 9d         bra $b076
$00:b0d9  24 00         bit $00
$00:b0db  b9 0d 80      lda $800d,y
$00:b0de  9d 36 00      sta $0036,x
$00:b0e1  c2 20         rep #$20
$00:b0e3  b9 06 80      lda $8006,y
$00:b0e6  09 00 80      ora #$8000
$00:b0e9  29 ff df      and #$dfff
$00:b0ec  9d 16 00      sta $0016,x
$00:b0ef  b9 08 80      lda $8008,y
$00:b0f2  9d 22 00      sta $0022,x
$00:b0f5  b9 0b 80      lda $800b,y
$00:b0f8  9d 18 00      sta $0018,x
$00:b0fb  9e 30 00      stz $0030,x
$00:b0fe  9e 20 00      stz $0020,x
$00:b101  22 f3 88 00   jsl $0088f3  ; -> Sub_00_88f3
$00:b105  9e 14 00      stz $0014,x
$00:b108  9e 04 00      stz $0004,x
$00:b10b  9e 06 00      stz $0006,x
$00:b10e  6b            rtl
$00:b10f  da            phx
$00:b110  ae a0 03      ldx $03a0
$00:b113  bd 00 00      lda $0000,x
$00:b116  38            sec
$00:b117  e9 30 00      sbc #$0030
$00:b11a  10 03         bpl $b11f
$00:b11c  a9 00 00      lda #$0000
$00:b11f  85 16         sta $16
$00:b121  bd 00 00      lda $0000,x
$00:b124  18            clc
$00:b125  69 30 00      adc #$0030
$00:b128  38            sec
$00:b129  e5 16         sbc $16
$00:b12b  85 1a         sta $1a
$00:b12d  30 57         bmi $b186
$00:b12f  bd 02 00      lda $0002,x
$00:b132  38            sec
$00:b133  e9 30 00      sbc #$0030
$00:b136  10 03         bpl $b13b
$00:b138  a9 00 00      lda #$0000
$00:b13b  85 18         sta $18
$00:b13d  bd 02 00      lda $0002,x
$00:b140  18            clc
$00:b141  69 30 00      adc #$0030
$00:b144  38            sec
$00:b145  e5 18         sbc $18
$00:b147  85 1c         sta $1c
$00:b149  30 3b         bmi $b186
$00:b14b  ad a6 06      lda $06a6
$00:b14e  80 03         bra $b153
$00:b150  bd 3e 00      lda $003e,x
$00:b153  aa            tax
$00:b154  f0 30         beq $b186
$00:b156  bd 16 00      lda $0016,x
$00:b159  c9 01 03      cmp #$0301
$00:b15c  d0 f2         bne $b150
$00:b15e  bd 00 00      lda $0000,x
$00:b161  38            sec
$00:b162  e5 16         sbc $16
$00:b164  c5 1a         cmp $1a
$00:b166  b0 e8         bcs $b150
$00:b168  bd 02 00      lda $0002,x
$00:b16b  38            sec
$00:b16c  e5 18         sbc $18
$00:b16e  c5 1c         cmp $1c
$00:b170  b0 de         bcs $b150
$00:b172  e2 20         sep #$20
$00:b174  a9 00         lda #$00
$00:b176  9d 36 00      sta $0036,x
$00:b179  c2 20         rep #$20
$00:b17b  a9 ec a9      lda #$a9ec
$00:b17e  9d 18 00      sta $0018,x
$00:b181  9e 14 00      stz $0014,x
$00:b184  80 ca         bra $b150
$00:b186  fa            plx
$00:b187  6b            rtl
$00:b188  a9 ff ff      lda #$ffff
$00:b18b  8d 26 03      sta $0326
$00:b18e  02 1b         cop #$1b
$00:b190  94 b1         sty $b1,x
$00:b192  01 00         ora ($00,x)
$00:b194  ad 7b 1c      lda $1c7b
$00:b197  f0 01         beq $b19a
$00:b199  6b            rtl
$00:b19a  00 83         brk #$83
$00:b19c  bd 30 00      lda $0030,x
$00:b19f  22 bb 88 02   jsl $0288bb
$00:b1a3  02 27         cop #$27
$00:b1a5  a7 b1         lda [$b1]
$00:b1a7  9c 26 03      stz $0326
$00:b1aa  02 86         cop #$86
$00:b1ac  6b            rtl
$00:b1ad  9c b2 03      stz $03b2
$00:b1b0  ee 58 04      inc $0458
$00:b1b3  8e 9a 03      stx $039a
$00:b1b6  02 85         cop #$85
$00:b1b8  88            dey
$00:b1b9  b1 00         lda ($00),y
$00:b1bb  a9 00 00      lda #$0000
$00:b1be  99 30 00      sta $0030,y
$00:b1c1  02 80         cop #$80
$00:b1c3  00 02         brk #$02
$00:b1c5  82 ad 76      brl $2875
$00:b1c8  03 c9         ora $c9,s
$00:b1ca  70 00         bvs $b1cc
$00:b1cc  b0 03         bcs $b1d1
$00:b1ce  82 e1 00      brl $b2b2
$00:b1d1  02 9f         cop #$9f
$00:b1d3  10 00         bpl $b1d5
$00:b1d5  02 9a         cop #$9a
$00:b1d7  10 00         bpl $b1d9
$00:b1d9  10 b2         bpl $b18d
$00:b1db  df b1 10 b2   cmp $b210b1,x
$00:b1df  02 9f         cop #$9f
$00:b1e1  f0 ff         beq $b1e2
$00:b1e3  02 80         cop #$80
$00:b1e5  0e 02 82      asl $8202
$00:b1e8  02 b2         cop #$b2
$00:b1ea  48            pha
$00:b1eb  b3 00         lda ($00,s),y
$00:b1ed  08            php
$00:b1ee  00 e8         brk #$e8
$00:b1f0  ff 00 02 02   sbc $020200,x
$00:b1f4  b2 59         lda ($59)
$00:b1f6  b3 00         lda ($00,s),y
$00:b1f8  08            php
$00:b1f9  00 e8         brk #$e8
$00:b1fb  ff 00 02 02   sbc $020200,x
$00:b1ff  b2 67         lda ($67)
$00:b201  b3 00         lda ($00,s),y
$00:b203  08            php
$00:b204  00 e8         brk #$e8
$00:b206  ff 00 02 02   sbc $020200,x
$00:b20a  80 16         bra $b222
$00:b20c  02 82         cop #$82
$00:b20e  80 b1         bra $b1c1
$00:b210  02 9a         cop #$9a
$00:b212  50 00         bvc $b214
$00:b214  1a            inc a
$00:b215  b2 90         lda ($90)
$00:b217  b2 1a         lda ($1a)
$00:b219  b2 02         lda ($02)
$00:b21b  9a            txs
$00:b21c  70 00         bvs $b21e
$00:b21e  90 b2         bcc $b1d2
$00:b220  24 b2         bit $b2
$00:b222  90 b2         bcc $b1d6
$00:b224  02 9a         cop #$9a
$00:b226  00 00         brk #$00
$00:b228  2e b2 5f      rol $5fb2
$00:b22b  b2 5f         lda ($5f)
$00:b22d  b2 02         lda ($02)
$00:b22f  9f f0 ff 02   sta $02fff0,x
$00:b233  80 0d         bra $b242
$00:b235  02 82         cop #$82
$00:b237  02 b2         cop #$b2
$00:b239  7f b3 00 fc   adc $fc00b3,x
$00:b23d  ff e6 ff 00   sbc $00ffe6,x
$00:b241  02 02         cop #$02
$00:b243  80 17         bra $b25c
$00:b245  02 82         cop #$82
$00:b247  02 80         cop #$80
$00:b249  0d 02 82      ora $8202
$00:b24c  02 b2         cop #$b2
$00:b24e  7f b3 00 fc   adc $fc00b3,x
$00:b252  ff e6 ff 00   sbc $00ffe6,x
$00:b256  02 02         cop #$02
$00:b258  80 17         bra $b271
$00:b25a  02 82         cop #$82
$00:b25c  82 67 ff      brl $b1c6
$00:b25f  02 9f         cop #$9f
$00:b261  f0 ff         beq $b262
$00:b263  02 80         cop #$80
$00:b265  0f 02 82 02   ora $028202
$00:b269  b2 94         lda ($94)
$00:b26b  b3 00         lda ($00,s),y
$00:b26d  14 00         trb $00
$00:b26f  e6 ff         inc $ff
$00:b271  00 02         brk #$02
$00:b273  02 80         cop #$80
$00:b275  18            clc
$00:b276  02 82         cop #$82
$00:b278  02 80         cop #$80
$00:b27a  0f 02 82 02   ora $028202
$00:b27e  b2 94         lda ($94)
$00:b280  b3 00         lda ($00,s),y
$00:b282  14 00         trb $00
$00:b284  e6 ff         inc $ff
$00:b286  00 02         brk #$02
$00:b288  02 80         cop #$80
$00:b28a  18            clc
$00:b28b  02 82         cop #$82
$00:b28d  82 36 ff      brl $b1c6
$00:b290  02 9a         cop #$9a
$00:b292  00 00         brk #$00
$00:b294  9a            txs
$00:b295  b2 a6         lda ($a6)
$00:b297  b2 a6         lda ($a6)
$00:b299  b2 02         lda ($02)
$00:b29b  9f f0 ff 02   sta $02fff0,x
$00:b29f  80 07         bra $b2a8
$00:b2a1  02 82         cop #$82
$00:b2a3  82 20 ff      brl $b1c6
$00:b2a6  02 9f         cop #$9f
$00:b2a8  f0 ff         beq $b2a9
$00:b2aa  02 80         cop #$80
$00:b2ac  05 02         ora $02
$00:b2ae  82 82 14      brl $c733
$00:b2b1  ff 02 9f 10   sbc $109f02,x
$00:b2b5  00 02         brk #$02
$00:b2b7  9a            txs
$00:b2b8  40            rti
$00:b2b9  00 30         brk #$30
$00:b2bb  b3 c0         lda ($c0,s),y
$00:b2bd  b2 3c         lda ($3c)
$00:b2bf  b3 02         lda ($02,s),y
$00:b2c1  9a            txs
$00:b2c2  00 00         brk #$00
$00:b2c4  ca            dex
$00:b2c5  b2 fd         lda ($fd)
$00:b2c7  b2 fd         lda ($fd)
$00:b2c9  b2 02         lda ($02)
$00:b2cb  9f f0 ff bd   sta $bdfff0,x
$00:b2cf  16 00         asl $00,x
$00:b2d1  09 02 00      ora #$0002
$00:b2d4  9d 16 00      sta $0016,x
$00:b2d7  02 85         cop #$85
$00:b2d9  b9 b3 00      lda $00b3,y
$00:b2dc  02 80         cop #$80
$00:b2de  09 02 82      ora #$8202
$00:b2e1  02 b2         cop #$b2
$00:b2e3  a9 b3 00      lda #$00b3
$00:b2e6  d8            cld
$00:b2e7  ff e8 ff 00   sbc $00ffe8,x
$00:b2eb  02 02         cop #$02
$00:b2ed  80 0a         bra $b2f9
$00:b2ef  02 82         cop #$82
$00:b2f1  bd 16 00      lda $0016,x
$00:b2f4  29 fd ff      and #$fffd
$00:b2f7  9d 16 00      sta $0016,x
$00:b2fa  82 c9 fe      brl $b1c6
$00:b2fd  02 9f         cop #$9f
$00:b2ff  f0 ff         beq $b300
$00:b301  bd 16 00      lda $0016,x
$00:b304  09 02 00      ora #$0002
$00:b307  9d 16 00      sta $0016,x
$00:b30a  02 85         cop #$85
$00:b30c  b9 b3 00      lda $00b3,y
$00:b30f  02 80         cop #$80
$00:b311  0b            phd
$00:b312  02 82         cop #$82
$00:b314  02 b2         cop #$b2
$00:b316  b1 b3         lda ($b3),y
$00:b318  00 28         brk #$28
$00:b31a  00 e8         brk #$e8
$00:b31c  ff 00 02 02   sbc $020200,x
$00:b320  80 0c         bra $b32e
$00:b322  02 82         cop #$82
$00:b324  bd 16 00      lda $0016,x
$00:b327  29 fd ff      and #$fffd
$00:b32a  9d 16 00      sta $0016,x
$00:b32d  82 96 fe      brl $b1c6
$00:b330  02 9f         cop #$9f
$00:b332  f0 ff         beq $b333
$00:b334  02 80         cop #$80
$00:b336  08            php
$00:b337  02 82         cop #$82
$00:b339  82 8a fe      brl $b1c6
$00:b33c  02 9f         cop #$9f
$00:b33e  f0 ff         beq $b33f
$00:b340  02 80         cop #$80
$00:b342  06 02         asl $02
$00:b344  82 82 7e      brl $31c9
$00:b347  fe 02 a3      inc $a302,x
$00:b34a  02 a2         cop #$a2
$00:b34c  30 02         bmi $b350
$00:b34e  80 10         bra $b360
$00:b350  02 82         cop #$82
$00:b352  02 80         cop #$80
$00:b354  1b            tcs
$00:b355  02 82         cop #$82
$00:b357  80 1d         bra $b376
$00:b359  02 a3         cop #$a3
$00:b35b  02 a2         cop #$a2
$00:b35d  30 00         bmi $b35f
$00:b35f  61 02         adc ($02,x)
$00:b361  80 10         bra $b373
$00:b363  02 82         cop #$82
$00:b365  80 0f         bra $b376
$00:b367  02 a3         cop #$a3
$00:b369  02 a2         cop #$a2
$00:b36b  30 02         bmi $b36f
$00:b36d  80 10         bra $b37f
$00:b36f  02 82         cop #$82
$00:b371  02 80         cop #$80
$00:b373  1c 02 82      trb $8202
$00:b376  02 81         cop #$81
$00:b378  13 0c         ora ($0c,s),y
$00:b37a  02 83         cop #$83
$00:b37c  02 86         cop #$86
$00:b37e  6b            rtl
$00:b37f  02 a3         cop #$a3
$00:b381  02 a2         cop #$a2
$00:b383  30 00         bmi $b385
$00:b385  61 02         adc ($02,x)
$00:b387  80 11         bra $b39a
$00:b389  02 82         cop #$82
$00:b38b  02 81         cop #$81
$00:b38d  14 0c         trb $0c
$00:b38f  02 83         cop #$83
$00:b391  02 86         cop #$86
$00:b393  6b            rtl
$00:b394  02 a3         cop #$a3
$00:b396  02 a2         cop #$a2
$00:b398  30 00         bmi $b39a
$00:b39a  61 02         adc ($02,x)
$00:b39c  80 12         bra $b3b0
$00:b39e  02 82         cop #$82
$00:b3a0  02 81         cop #$81
$00:b3a2  15 0c         ora $0c,x
$00:b3a4  02 83         cop #$83
$00:b3a6  02 86         cop #$86
$00:b3a8  6b            rtl
$00:b3a9  02 80         cop #$80
$00:b3ab  19 02 82      ora $8202,y
$00:b3ae  02 86         cop #$86
$00:b3b0  6b            rtl
$00:b3b1  02 80         cop #$80
$00:b3b3  1a            inc a
$00:b3b4  02 82         cop #$82
$00:b3b6  02 86         cop #$86
$00:b3b8  6b            rtl
$00:b3b9  02 a8         cop #$a8
$00:b3bb  00 80         brk #$80
$00:b3bd  0d 02 92      ora $9202
$00:b3c0  4e 02 94      lsr $9402
$00:b3c3  02 86         cop #$86
$00:b3c5  6b            rtl
$00:b3c6  9c b2 03      stz $03b2
$00:b3c9  ee 58 04      inc $0458
$00:b3cc  bd 16 00      lda $0016,x
$00:b3cf  09 00 02      ora #$0200
$00:b3d2  9d 16 00      sta $0016,x
$00:b3d5  02 85         cop #$85
$00:b3d7  88            dey
$00:b3d8  b1 00         lda ($00),y
$00:b3da  a9 01 00      lda #$0001
$00:b3dd  99 30 00      sta $0030,y
$00:b3e0  02 a5         cop #$a5
$00:b3e2  ea            nop
$00:b3e3  b3 32         lda ($32,s),y
$00:b3e5  b7 3d         lda [$3d],y
$00:b3e7  ba            tsx
$00:b3e8  3d ba 02      and $02ba,x
$00:b3eb  80 21         bra $b40e
$00:b3ed  02 82         cop #$82
$00:b3ef  02 91         cop #$91
$00:b3f1  8a            txa
$00:b3f2  18            clc
$00:b3f3  69 80 00      adc #$0080
$00:b3f6  cd 9a 03      cmp $039a
$00:b3f9  f0 01         beq $b3fc
$00:b3fb  6b            rtl
$00:b3fc  02 91         cop #$91
$00:b3fe  ac 9a 03      ldy $039a
$00:b401  b9 16 00      lda $0016,y
$00:b404  89 00 04      bit #$0400
$00:b407  d0 01         bne $b40a
$00:b409  6b            rtl
$00:b40a  02 1b         cop #$1b
$00:b40c  10 b4         bpl $b3c2
$00:b40e  08            php
$00:b40f  00 8e         brk #$8e
$00:b411  9a            txs
$00:b412  03 02         ora $02,s
$00:b414  91 02         sta ($02),y
$00:b416  0c 00 04      tsb $0400
$00:b419  1c b4 6b      trb $6bb4
$00:b41c  02 85         cop #$85
$00:b41e  1c be 00      trb $00be
$00:b421  02 09         cop #$09
$00:b423  05 19         ora $19
$00:b425  e2 20         sep #$20
$00:b427  9c 5e 1a      stz $1a5e
$00:b42a  c2 20         rep #$20
$00:b42c  bd 16 00      lda $0016,x
$00:b42f  29 ff fc      and #$fcff
$00:b432  9d 16 00      sta $0016,x
$00:b435  9c 2d 04      stz $042d
$00:b438  02 1b         cop #$1b
$00:b43a  7f b4 3c 00   adc $003cb4,x
$00:b43e  02 9b         cop #$9b
$00:b440  60            rts
$00:b441  00 48         brk #$48
$00:b443  b4 48         ldy $48,x
$00:b445  b4 f4         ldy $f4,x
$00:b447  b5 02         lda $02,x
$00:b449  9a            txs
$00:b44a  20 00 ea      jsr $ea00
$00:b44d  b5 c0         lda $c0,x
$00:b44f  b4 01         ldy $01,x
$00:b451  b5 02         lda $02,x
$00:b453  07 05         ora [$05]
$00:b455  99 6b b4      sta $b46b,y
$00:b458  02 24         cop #$24
$00:b45a  6b            rtl
$00:b45b  b4 02         ldy $02,x
$00:b45d  09 05 99      ora #$9905
$00:b460  02 85         cop #$85
$00:b462  61 b6         adc ($b6,x)
$00:b464  00 02         brk #$02
$00:b466  1b            tcs
$00:b467  6b            rtl
$00:b468  b4 28         ldy $28,x
$00:b46a  00 02         brk #$02
$00:b46c  9a            txs
$00:b46d  60            rts
$00:b46e  00 21         brk #$21
$00:b470  b6 75         ldx $75,y
$00:b472  b4 75         ldy $75,x
$00:b474  b4 02         ldy $02,x
$00:b476  9b            txy
$00:b477  10 00         bpl $b479
$00:b479  0b            phd
$00:b47a  b5 15         lda $15,x
$00:b47c  b5 53         lda $53,x
$00:b47e  b5 02         lda $02,x
$00:b480  9b            txy
$00:b481  60            rts
$00:b482  00 03         brk #$03
$00:b484  b6 89         ldx $89,y
$00:b486  b4 89         ldy $89,x
$00:b488  b4 02         ldy $02,x
$00:b48a  9a            txs
$00:b48b  20 00 b2      jsr $b200
$00:b48e  b5 67         lda $67,x
$00:b490  b5 5d         lda $5d,x
$00:b492  b5 02         lda $02,x
$00:b494  07 05         ora [$05]
$00:b496  99 ac b4      sta $b4ac,y
$00:b499  02 23         cop #$23
$00:b49b  ac b4 02      ldy $02b4
$00:b49e  09 05 99      ora #$9905
$00:b4a1  02 85         cop #$85
$00:b4a3  bf b6 00 02   lda $0200b6,x
$00:b4a7  1b            tcs
$00:b4a8  ac b4 28      ldy $28b4
$00:b4ab  00 02         brk #$02
$00:b4ad  9a            txs
$00:b4ae  60            rts
$00:b4af  00 b6         brk #$b6
$00:b4b1  b4 b6         ldy $b6,x
$00:b4b3  b4 12         ldy $12,x
$00:b4b5  b6 02         ldx $02,y
$00:b4b7  9b            txy
$00:b4b8  10 00         bpl $b4ba
$00:b4ba  e0 b5 bc      cpx #$bcb5
$00:b4bd  b5 a8         lda $a8,x
$00:b4bf  b5 02         lda $02,x
$00:b4c1  97 02         sta [$02],y
$00:b4c3  80 2c         bra $b4f1
$00:b4c5  02 82         cop #$82
$00:b4c7  02 9b         cop #$9b
$00:b4c9  00 00         brk #$00
$00:b4cb  d1 b4         cmp ($b4),y
$00:b4cd  da            phx
$00:b4ce  b4 da         ldy $da,x
$00:b4d0  b4 02         ldy $02,x
$00:b4d2  9d 1d 02      sta $021d,x
$00:b4d5  9e e4 b4      stz $b4e4,x
$00:b4d8  80 ed         bra $b4c7
$00:b4da  02 9d         cop #$9d
$00:b4dc  2d 02 9e      and $9e02
$00:b4df  e4 b4         cpx $b4
$00:b4e1  82 5a ff      brl $b43e
$00:b4e4  02 9a         cop #$9a
$00:b4e6  00 00         brk #$00
$00:b4e8  ee b4 ee      inc $eeb4
$00:b4eb  b4 f8         ldy $f8,x
$00:b4ed  b4 02         ldy $02,x
$00:b4ef  97 02         sta [$02],y
$00:b4f1  80 0b         bra $b4fe
$00:b4f3  02 82         cop #$82
$00:b4f5  82 c4 00      brl $b5bc
$00:b4f8  02 96         cop #$96
$00:b4fa  02 80         cop #$80
$00:b4fc  0b            phd
$00:b4fd  02 82         cop #$82
$00:b4ff  80 14         bra $b515
$00:b501  02 96         cop #$96
$00:b503  02 80         cop #$80
$00:b505  0b            phd
$00:b506  02 82         cop #$82
$00:b508  82 0a 00      brl $b515
$00:b50b  02 96         cop #$96
$00:b50d  02 80         cop #$80
$00:b50f  09 02 82      ora #$8202
$00:b512  82 ab ff      brl $b4c0
$00:b515  02 96         cop #$96
$00:b517  02 80         cop #$80
$00:b519  2a            rol a
$00:b51a  02 82         cop #$82
$00:b51c  02 9a         cop #$9a
$00:b51e  00 00         brk #$00
$00:b520  30 b5         bmi $b4d7
$00:b522  30 b5         bmi $b4d9
$00:b524  26 b5         rol $b5
$00:b526  02 9d         cop #$9d
$00:b528  1c 02 9e      trb $9e02
$00:b52b  3a            dec a
$00:b52c  b5 82         lda $82,x
$00:b52e  ec ff 02      cpx $02ff
$00:b531  9d 2b 02      sta $022b,x
$00:b534  9e 3a b5      stz $b53a,x
$00:b537  82 18 ff      brl $b452
$00:b53a  02 9b         cop #$9b
$00:b53c  00 00         brk #$00
$00:b53e  44 b5 44      mvp $44,$b5
$00:b541  b5 4c         lda $4c,x
$00:b543  b5 02         lda $02,x
$00:b545  80 09         bra $b550
$00:b547  02 82         cop #$82
$00:b549  82 74 ff      brl $b4c0
$00:b54c  02 80         cop #$80
$00:b54e  0a            asl a
$00:b54f  02 82         cop #$82
$00:b551  80 14         bra $b567
$00:b553  02 96         cop #$96
$00:b555  02 80         cop #$80
$00:b557  0a            asl a
$00:b558  02 82         cop #$82
$00:b55a  82 0a 00      brl $b567
$00:b55d  02 96         cop #$96
$00:b55f  02 80         cop #$80
$00:b561  08            php
$00:b562  02 82         cop #$82
$00:b564  82 ae ff      brl $b515
$00:b567  02 97         cop #$97
$00:b569  02 80         cop #$80
$00:b56b  2e 02 82      rol $8202
$00:b56e  02 9b         cop #$9b
$00:b570  00 00         brk #$00
$00:b572  81 b5         sta ($b5,x)
$00:b574  81 b5         sta ($b5,x)
$00:b576  78            sei
$00:b577  b5 02         lda $02,x
$00:b579  9d 1e 02      sta $021e,x
$00:b57c  9e 8b b5      stz $b58b,x
$00:b57f  80 ed         bra $b56e
$00:b581  02 9d         cop #$9d
$00:b583  2f 02 9e 8b   and $8b9e02
$00:b587  b5 82         lda $82,x
$00:b589  f4 fe 02      pea $02fe
$00:b58c  9a            txs
$00:b58d  00 00         brk #$00
$00:b58f  95 b5         sta $b5,x
$00:b591  95 b5         sta $b5,x
$00:b593  9e b5 02      stz $02b5,x
$00:b596  97 02         sta [$02],y
$00:b598  80 08         bra $b5a2
$00:b59a  02 82         cop #$82
$00:b59c  80 1e         bra $b5bc
$00:b59e  02 96         cop #$96
$00:b5a0  02 80         cop #$80
$00:b5a2  08            php
$00:b5a3  02 82         cop #$82
$00:b5a5  82 6d ff      brl $b515
$00:b5a8  02 97         cop #$97
$00:b5aa  02 80         cop #$80
$00:b5ac  0a            asl a
$00:b5ad  02 82         cop #$82
$00:b5af  82 b5 ff      brl $b567
$00:b5b2  02 97         cop #$97
$00:b5b4  02 80         cop #$80
$00:b5b6  08            php
$00:b5b7  02 82         cop #$82
$00:b5b9  82 00 00      brl $b5bc
$00:b5bc  02 97         cop #$97
$00:b5be  02 80         cop #$80
$00:b5c0  2a            rol a
$00:b5c1  02 82         cop #$82
$00:b5c3  02 9a         cop #$9a
$00:b5c5  00 00         brk #$00
$00:b5c7  cd b5 d6      cmp $d6b5
$00:b5ca  b5 d6         lda $d6,x
$00:b5cc  b5 02         lda $02,x
$00:b5ce  9d 1c 02      sta $021c,x
$00:b5d1  9e 3a b5      stz $b53a,x
$00:b5d4  80 ed         bra $b5c3
$00:b5d6  02 9d         cop #$9d
$00:b5d8  2b            pld
$00:b5d9  02 9e         cop #$9e
$00:b5db  3a            dec a
$00:b5dc  b5 82         lda $82,x
$00:b5de  b3 fe         lda ($fe,s),y
$00:b5e0  02 97         cop #$97
$00:b5e2  02 80         cop #$80
$00:b5e4  09 02 82      ora #$8202
$00:b5e7  82 d6 fe      brl $b4c0
$00:b5ea  02 97         cop #$97
$00:b5ec  02 80         cop #$80
$00:b5ee  0b            phd
$00:b5ef  02 82         cop #$82
$00:b5f1  82 c8 ff      brl $b5bc
$00:b5f4  02 97         cop #$97
$00:b5f6  02 80         cop #$80
$00:b5f8  0b            phd
$00:b5f9  02 82         cop #$82
$00:b5fb  02 80         cop #$80
$00:b5fd  0a            asl a
$00:b5fe  02 82         cop #$82
$00:b600  82 64 ff      brl $b567
$00:b603  02 97         cop #$97
$00:b605  02 80         cop #$80
$00:b607  08            php
$00:b608  02 82         cop #$82
$00:b60a  02 80         cop #$80
$00:b60c  09 02 82      ora #$8202
$00:b60f  82 ae fe      brl $b4c0
$00:b612  02 80         cop #$80
$00:b614  09 02 82      ora #$8202
$00:b617  02 96         cop #$96
$00:b619  02 80         cop #$80
$00:b61b  0b            phd
$00:b61c  02 82         cop #$82
$00:b61e  82 f4 fe      brl $b515
$00:b621  02 80         cop #$80
$00:b623  09 02 82      ora #$8202
$00:b626  02 97         cop #$97
$00:b628  02 80         cop #$80
$00:b62a  0b            phd
$00:b62b  02 82         cop #$82
$00:b62d  82 8c ff      brl $b5bc
$00:b630  20 2b b7      jsr $b72b  ; -> Sub_00_b72b
$00:b633  02 a0         cop #$a0
$00:b635  f0 ff         beq $b636
$00:b637  02 80         cop #$80
$00:b639  27 02         and [$02]
$00:b63b  82 ad 5e      brl $14eb
$00:b63e  1a            inc a
$00:b63f  29 ff 00      and #$00ff
$00:b642  c9 04 00      cmp #$0004
$00:b645  90 03         bcc $b64a
$00:b647  82 b5 00      brl $b6ff
$00:b64a  02 9c         cop #$9c
$00:b64c  50 b6         bvc $b604
$00:b64e  ff b6 e2 20   sbc $20e2b6,x
$00:b652  ee 5e 1a      inc $1a5e
$00:b655  c2 20         rep #$20
$00:b657  02 9a         cop #$9a
$00:b659  00 00         brk #$00
$00:b65b  20 b7 20      jsr $20b7
$00:b65e  b7 0a         lda [$0a],y
$00:b660  b7 20         lda [$20],y
$00:b662  2b            pld
$00:b663  b7 02         lda [$02],y
$00:b665  9f 20 00 00   sta $000020,x
$00:b669  5d 02 80      eor $8002,x
$00:b66c  29 02 82      and #$8202
$00:b66f  80 07         bra $b678
$00:b671  20 2b b7      jsr $b72b  ; -> Sub_00_b72b
$00:b674  02 9f         cop #$9f
$00:b676  10 00         bpl $b678
$00:b678  02 80         cop #$80
$00:b67a  27 02         and [$02]
$00:b67c  82 ad 5e      brl $152c
$00:b67f  1a            inc a
$00:b680  29 ff 00      and #$00ff
$00:b683  c9 04 00      cmp #$0004
$00:b686  90 03         bcc $b68b
$00:b688  82 7f 00      brl $b70a
$00:b68b  02 9c         cop #$9c
$00:b68d  0a            asl a
$00:b68e  b7 91         lda [$91],y
$00:b690  b6 e2         ldx $e2,y
$00:b692  20 ee 5e      jsr $5eee
$00:b695  1a            inc a
$00:b696  c2 20         rep #$20
$00:b698  02 9b         cop #$9b
$00:b69a  00 00         brk #$00
$00:b69c  ff b6 ff b6   sbc $b6ffb6,x
$00:b6a0  15 b7         ora $b7,x
$00:b6a2  20 2b b7      jsr $b72b  ; -> Sub_00_b72b
$00:b6a5  02 a0         cop #$a0
$00:b6a7  10 00         bpl $b6a9
$00:b6a9  02 80         cop #$80
$00:b6ab  27 02         and [$02]
$00:b6ad  82 ad 5e      brl $155d
$00:b6b0  1a            inc a
$00:b6b1  29 ff 00      and #$00ff
$00:b6b4  c9 04 00      cmp #$0004
$00:b6b7  b0 5c         bcs $b715
$00:b6b9  02 9c         cop #$9c
$00:b6bb  50 b6         bvc $b673
$00:b6bd  15 b7         ora $b7,x
$00:b6bf  20 2b b7      jsr $b72b  ; -> Sub_00_b72b
$00:b6c2  02 9f         cop #$9f
$00:b6c4  f0 ff         beq $b6c5
$00:b6c6  00 5d         brk #$5d
$00:b6c8  02 80         cop #$80
$00:b6ca  29 02 82      and #$8202
$00:b6cd  80 07         bra $b6d6
$00:b6cf  20 2b b7      jsr $b72b  ; -> Sub_00_b72b
$00:b6d2  02 9f         cop #$9f
$00:b6d4  f0 ff         beq $b6d5
$00:b6d6  02 80         cop #$80
$00:b6d8  27 02         and [$02]
$00:b6da  82 ad 5e      brl $158a
$00:b6dd  1a            inc a
$00:b6de  29 ff 00      and #$00ff
$00:b6e1  c9 04 00      cmp #$0004
$00:b6e4  b0 3a         bcs $b720
$00:b6e6  02 9c         cop #$9c
$00:b6e8  20 b7 91      jsr $91b7
$00:b6eb  b6 02         ldx $02,y
$00:b6ed  09 05 19      ora #$1905
$00:b6f0  e2 20         sep #$20
$00:b6f2  9c 5e 1a      stz $1a5e
$00:b6f5  c2 20         rep #$20
$00:b6f7  02 80         cop #$80
$00:b6f9  28            plp
$00:b6fa  02 82         cop #$82
$00:b6fc  02 86         cop #$86
$00:b6fe  6b            rtl
$00:b6ff  02 21         cop #$21
$00:b701  ec b6 02      cpx $02b6
$00:b704  85 30         sta $30
$00:b706  b6 00         ldx $00,y
$00:b708  80 ed         bra $b6f7
$00:b70a  02 24         cop #$24
$00:b70c  ec b6 02      cpx $02b6
$00:b70f  85 71         sta $71
$00:b711  b6 00         ldx $00,y
$00:b713  80 e2         bra $b6f7
$00:b715  02 22         cop #$22
$00:b717  ec b6 02      cpx $02b6
$00:b71a  85 a2         sta $a2
$00:b71c  b6 00         ldx $00,y
$00:b71e  80 d7         bra $b6f7
$00:b720  02 23         cop #$23
$00:b722  ec b6 02      cpx $02b6
$00:b725  85 cf         sta $cf
$00:b727  b6 00         ldx $00,y
$00:b729  80 cc         bra $b6f7
Sub_00_b72b:
$00:b72b  a9 00 02      lda #$0200
$00:b72e  9d 16 00      sta $0016,x
Sub_00_b731:
$00:b731  60            rts
$00:b732  8e 9a 03      stx $039a
$00:b735  02 80         cop #$80
$00:b737  19 02 82      ora $8202,y
$00:b73a  02 91         cop #$91
$00:b73c  02 0c         cop #$0c
$00:b73e  00 04         brk #$04
$00:b740  43 b7         eor $b7,s
$00:b742  6b            rtl
$00:b743  02 85         cop #$85
$00:b745  29 be 00      and #$00be
$00:b748  bd 16 00      lda $0016,x
$00:b74b  29 ff fc      and #$fcff
$00:b74e  9d 16 00      sta $0016,x
$00:b751  9c 2d 04      stz $042d
$00:b754  02 1b         cop #$1b
$00:b756  a3 b7         lda $b7,s
$00:b758  3c 00 02      bit $0200,x
$00:b75b  0c 00 04      tsb $0400
$00:b75e  74 b7         stz $b7,x
$00:b760  02 9b         cop #$9b
$00:b762  60            rts
$00:b763  00 6a         brk #$6a
$00:b765  b7 6a         lda [$6a],y
$00:b767  b7 72         lda [$72],y
$00:b769  b9 02 9a      lda $9a02,y
$00:b76c  20 00 68      jsr $6800
$00:b76f  b9 36 b8      lda $b836,y
$00:b772  79 b8 02      adc $02b8,y
$00:b775  97 02         sta [$02],y
$00:b777  80 06         bra $b77f
$00:b779  02 82         cop #$82
$00:b77b  02 80         cop #$80
$00:b77d  07 02         ora [$02]
$00:b77f  82 80 55      brl $0d02
$00:b782  02 0c         cop #$0c
$00:b784  00 04         brk #$04
$00:b786  9c b7 02      stz $02b7
$00:b789  9a            txs
$00:b78a  60            rts
$00:b78b  00 9f         brk #$9f
$00:b78d  b9 92 b7      lda $b792,y
$00:b790  92 b7         sta ($b7)
$00:b792  02 9b         cop #$9b
$00:b794  20 00 83      jsr $8300  ; -> Sub_00_8300
$00:b797  b8            clv
$00:b798  8d b8 cd      sta $cdb8
$00:b79b  b8            clv
$00:b79c  02 80         cop #$80
$00:b79e  07 02         ora [$02]
$00:b7a0  82 80 34      brl $ec23
$00:b7a3  02 0c         cop #$0c
$00:b7a5  00 04         brk #$04
$00:b7a7  d7 b7         cmp [$b7],y
$00:b7a9  02 9b         cop #$9b
$00:b7ab  60            rts
$00:b7ac  00 81         brk #$81
$00:b7ae  b9 b3 b7      lda $b7b3,y
$00:b7b1  b3 b7         lda ($b7,s),y
$00:b7b3  02 9a         cop #$9a
$00:b7b5  20 00 2e      jsr $2e00
$00:b7b8  b9 e1 b8      lda $b8e1,y
$00:b7bb  d7 b8         cmp [$b8],y
$00:b7bd  02 0c         cop #$0c
$00:b7bf  00 04         brk #$04
$00:b7c1  9c b7 02      stz $02b7
$00:b7c4  9a            txs
$00:b7c5  60            rts
$00:b7c6  00 cd         brk #$cd
$00:b7c8  b7 cd         lda [$cd],y
$00:b7ca  b7 90         lda [$90],y
$00:b7cc  b9 02 9b      lda $9b02,y
$00:b7cf  20 00 5e      jsr $5e00
$00:b7d2  b9 38 b9      lda $b938,y
$00:b7d5  24 b9         bit $b9
$00:b7d7  02 81         cop #$81
$00:b7d9  19 02 02      ora $0202,y
$00:b7dc  83 02         sta $02,s
$00:b7de  85 ae         sta $ae
$00:b7e0  b9 00 02      lda $0200,y
$00:b7e3  85 bd         sta $bd
$00:b7e5  b9 00 02      lda $0200,y
$00:b7e8  80 19         bra $b803
$00:b7ea  02 82         cop #$82
$00:b7ec  02 97         cop #$97
$00:b7ee  02 80         cop #$80
$00:b7f0  04 02         tsb $02
$00:b7f2  82 02 85      brl $3cf7
$00:b7f5  ca            dex
$00:b7f6  b9 00 02      lda $0200,y
$00:b7f9  85 d9         sta $d9
$00:b7fb  b9 00 02      lda $0200,y
$00:b7fe  80 1a         bra $b81a
$00:b800  02 82         cop #$82
$00:b802  02 80         cop #$80
$00:b804  05 02         ora $02
$00:b806  82 02 85      brl $3d0b
$00:b809  e6 b9         inc $b9
$00:b80b  00 02         brk #$02
$00:b80d  85 f5         sta $f5
$00:b80f  b9 00 02      lda $0200,y
$00:b812  80 1b         bra $b82f
$00:b814  02 82         cop #$82
$00:b816  02 96         cop #$96
$00:b818  02 80         cop #$80
$00:b81a  06 02         asl $02
$00:b81c  82 02 85      brl $3d21
$00:b81f  04 ba         tsb $ba
$00:b821  00 02         brk #$02
$00:b823  85 15         sta $15
$00:b825  ba            tsx
$00:b826  00 02         brk #$02
$00:b828  81 1a         sta ($1a,x)
$00:b82a  05 02         ora $02
$00:b82c  83 02         sta $02,s
$00:b82e  80 07         bra $b837
$00:b830  02 82         cop #$82
$00:b832  02 27         cop #$27
$00:b834  a9 b7 02      lda #$02b7
$00:b837  97 02         sta [$02],y
$00:b839  80 32         bra $b86d
$00:b83b  02 82         cop #$82
$00:b83d  02 9b         cop #$9b
$00:b83f  00 00         brk #$00
$00:b841  47 b8         eor [$b8]
$00:b843  50 b8         bvc $b7fd
$00:b845  50 b8         bvc $b7ff
$00:b847  02 9d         cop #$9d
$00:b849  18            clc
$00:b84a  02 9e         cop #$9e
$00:b84c  5c b8 80 ed   jml $ed80b8
$00:b850  02 21         cop #$21
$00:b852  5c b8 02 80   jml $8002b8
$00:b856  33 02         and ($02,s),y
$00:b858  82 82 fe      brl $b6dd
$00:b85b  fe 02 9a      inc $9a02,x
$00:b85e  00 00         brk #$00
$00:b860  66 b8         ror $b8
$00:b862  66 b8         ror $b8
$00:b864  70 b8         bvs $b81e
$00:b866  02 97         cop #$97
$00:b868  02 80         cop #$80
$00:b86a  06 02         asl $02
$00:b86c  82 82 c8      brl $80f1
$00:b86f  00 02         brk #$02
$00:b871  96 02         stx $02,y
$00:b873  80 06         bra $b87b
$00:b875  02 82         cop #$82
$00:b877  80 14         bra $b88d
$00:b879  02 96         cop #$96
$00:b87b  02 80         cop #$80
$00:b87d  06 02         asl $02
$00:b87f  82 82 0a      brl $c304
$00:b882  00 02         brk #$02
$00:b884  96 02         stx $02,y
$00:b886  80 05         bra $b88d
$00:b888  02 82         cop #$82
$00:b88a  82 a9 ff      brl $b836
$00:b88d  02 96         cop #$96
$00:b88f  02 80         cop #$80
$00:b891  30 02         bmi $b895
$00:b893  82 02 9a      brl $5298
$00:b896  00 00         brk #$00
$00:b898  a8            tay
$00:b899  b8            clv
$00:b89a  a8            tay
$00:b89b  b8            clv
$00:b89c  9e b8 02      stz $02b8,x
$00:b89f  9d 17 02      sta $0217,x
$00:b8a2  9e b4 b8      stz $b8b4,x
$00:b8a5  82 ec ff      brl $b894
$00:b8a8  02 24         cop #$24
$00:b8aa  b4 b8         ldy $b8,x
$00:b8ac  02 80         cop #$80
$00:b8ae  31 02         and ($02),y
$00:b8b0  82 82 ce      brl $8735
$00:b8b3  fe 02 9b      inc $9b02,x
$00:b8b6  00 00         brk #$00
$00:b8b8  be b8 be      ldx $beb8,y
$00:b8bb  b8            clv
$00:b8bc  c6 b8         dec $b8
$00:b8be  02 80         cop #$80
$00:b8c0  05 02         ora $02
$00:b8c2  82 82 70      brl $2947
$00:b8c5  ff 02 80 07   sbc $078002,x
$00:b8c9  02 82         cop #$82
$00:b8cb  80 14         bra $b8e1
$00:b8cd  02 96         cop #$96
$00:b8cf  02 80         cop #$80
$00:b8d1  07 02         ora [$02]
$00:b8d3  82 82 0a      brl $c358
$00:b8d6  00 02         brk #$02
$00:b8d8  96 02         stx $02,y
$00:b8da  80 04         bra $b8e0
$00:b8dc  02 82         cop #$82
$00:b8de  82 ac ff      brl $b88d
$00:b8e1  02 97         cop #$97
$00:b8e3  02 80         cop #$80
$00:b8e5  34 02         bit $02,x
$00:b8e7  82 02 9b      brl $53ec
$00:b8ea  00 00         brk #$00
$00:b8ec  fb            xce
$00:b8ed  b8            clv
$00:b8ee  fb            xce
$00:b8ef  b8            clv
$00:b8f0  f2 b8         sbc ($b8)
$00:b8f2  02 9d         cop #$9d
$00:b8f4  16 02         asl $02,x
$00:b8f6  9e 07 b9      stz $b907,x
$00:b8f9  80 ed         bra $b8e8
$00:b8fb  02 22         cop #$22
$00:b8fd  07 b9         ora [$b9]
$00:b8ff  02 80         cop #$80
$00:b901  35 02         and $02,x
$00:b903  82 82 9c      brl $5588
$00:b906  fe 02 9a      inc $9a02,x
$00:b909  00 00         brk #$00
$00:b90b  11 b9         ora ($b9),y
$00:b90d  11 b9         ora ($b9),y
$00:b90f  1a            inc a
$00:b910  b9 02 97      lda $9702,y
$00:b913  02 80         cop #$80
$00:b915  04 02         tsb $02
$00:b917  82 80 1e      brl $d79a
$00:b91a  02 96         cop #$96
$00:b91c  02 80         cop #$80
$00:b91e  04 02         tsb $02
$00:b920  82 82 69      brl $22a5
$00:b923  ff 02 97 02   sbc $029702,x
$00:b927  80 07         bra $b930
$00:b929  02 82         cop #$82
$00:b92b  82 b3 ff      brl $b8e1
$00:b92e  02 97         cop #$97
$00:b930  02 80         cop #$80
$00:b932  04 02         tsb $02
$00:b934  82 82 00      brl $b9b9
$00:b937  00 02         brk #$02
$00:b939  97 02         sta [$02],y
$00:b93b  80 30         bra $b96d
$00:b93d  02 82         cop #$82
Sub_00_b93f:
$00:b93f  02 9a         cop #$9a
$00:b941  00 00         brk #$00
$00:b943  49 b9 52      eor #$52b9
$00:b946  b9 52 b9      lda $b952,y
$00:b949  02 9d         cop #$9d
$00:b94b  17 02         ora [$02],y
$00:b94d  9e b4 b8      stz $b8b4,x
$00:b950  80 ed         bra $b93f
$00:b952  02 23         cop #$23
$00:b954  b4 b8         ldy $b8,x
$00:b956  02 80         cop #$80
$00:b958  31 02         and ($02),y
$00:b95a  82 82 5f      brl $18df
$00:b95d  fe 02 97      inc $9702,x
$00:b960  02 80         cop #$80
$00:b962  05 02         ora $02
$00:b964  82 82 ce      brl $87e9
$00:b967  fe 02 97      inc $9702,x
$00:b96a  02 80         cop #$80
$00:b96c  06 02         asl $02
$00:b96e  82 82 c6      brl $7ff3
$00:b971  ff 02 97 02   sbc $029702,x
$00:b975  80 06         bra $b97d
$00:b977  02 82         cop #$82
$00:b979  02 80         cop #$80
$00:b97b  07 02         ora [$02]
$00:b97d  82 82 60      brl $1a02
$00:b980  ff 02 97 02   sbc $029702,x
$00:b984  80 04         bra $b98a
$00:b986  02 82         cop #$82
$00:b988  02 80         cop #$80
$00:b98a  05 02         ora $02
$00:b98c  82 82 a6      brl $6011
$00:b98f  fe 02 80      inc $8002,x
$00:b992  05 02         ora $02
$00:b994  82 02 96      brl $4f99
$00:b997  02 80         cop #$80
$00:b999  06 02         asl $02
$00:b99b  82 82 ee      brl $a820
$00:b99e  fe 02 80      inc $8002,x
$00:b9a1  05 02         ora $02
$00:b9a3  82 02 97      brl $50a8
$00:b9a6  02 80         cop #$80
$00:b9a8  06 02         asl $02
$00:b9aa  82 82 8a      brl $442f
$00:b9ad  ff 00 5a 02   sbc $025a00,x
$00:b9b1  a3 02         lda $02,s
$00:b9b3  a1 08         lda ($08,x)
$00:b9b5  00 48         brk #$48
$00:b9b7  00 a9         brk #$a9
$00:b9b9  00 00         brk #$00
$00:b9bb  80 67         bra $ba24
$00:b9bd  02 a3         cop #$a3
$00:b9bf  02 a1         cop #$a1
$00:b9c1  e8            inx
$00:b9c2  ff 48 00 a9   sbc $a90048,x
$00:b9c6  03 00         ora $00,s
$00:b9c8  80 5a         bra $ba24
$00:b9ca  00 5a         brk #$5a
$00:b9cc  02 a3         cop #$a3
$00:b9ce  02 a1         cop #$a1
$00:b9d0  c0 ff f8      cpy #$f8ff
$00:b9d3  ff a9 02 00   sbc $0002a9,x
$00:b9d7  80 4b         bra $ba24
$00:b9d9  02 a3         cop #$a3
$00:b9db  02 a1         cop #$a1
$00:b9dd  c8            iny
$00:b9de  ff 18 00 a9   sbc $a90018,x
$00:b9e2  01 00         ora ($00,x)
$00:b9e4  80 3e         bra $ba24
$00:b9e6  00 5a         brk #$5a
$00:b9e8  02 a1         cop #$a1
$00:b9ea  08            php
$00:b9eb  00 e8         brk #$e8
$00:b9ed  ff 02 88 a9   sbc $a98802,x
$00:b9f1  00 00         brk #$00
$00:b9f3  80 2f         bra $ba24
$00:b9f5  02 a3         cop #$a3
$00:b9f7  02 a1         cop #$a1
$00:b9f9  e8            inx
$00:b9fa  ff b0 ff 02   sbc $02ffb0,x
$00:b9fe  88            dey
$00:b9ff  a9 03 00      lda #$0003
$00:ba02  80 20         bra $ba24
$00:ba04  00 5a         brk #$5a
$00:ba06  02 a3         cop #$a3
$00:ba08  02 a1         cop #$a1
$00:ba0a  20 00 f8      jsr $f800
$00:ba0d  ff 02 96 a9   sbc $a99602,x
$00:ba11  02 00         cop #$00
$00:ba13  80 0f         bra $ba24
$00:ba15  02 a3         cop #$a3
$00:ba17  02 a1         cop #$a1
$00:ba19  50 00         bvc $ba1b
$00:ba1b  18            clc
$00:ba1c  00 02         brk #$02
$00:ba1e  96 a9         stx $a9,y
$00:ba20  01 00         ora ($00,x)
$00:ba22  80 00         bra $ba24
$00:ba24  9d 1e 00      sta $001e,x
$00:ba27  9e 20 00      stz $0020,x
$00:ba2a  a9 00 02      lda #$0200
$00:ba2d  9d 16 00      sta $0016,x
$00:ba30  a9 04 00      lda #$0004
$00:ba33  9d 2a 00      sta $002a,x
$00:ba36  02 91         cop #$91
$00:ba38  02 83         cop #$83
$00:ba3a  02 86         cop #$86
$00:ba3c  6b            rtl
$00:ba3d  02 80         cop #$80
$00:ba3f  13 02         ora ($02,s),y
$00:ba41  82 02 91      brl $4b46
$00:ba44  ac 9a 03      ldy $039a
$00:ba47  b9 16 00      lda $0016,y
$00:ba4a  89 00 04      bit #$0400
$00:ba4d  d0 01         bne $ba50
$00:ba4f  6b            rtl
$00:ba50  02 1b         cop #$1b
$00:ba52  56 ba         lsr $ba,x
$00:ba54  08            php
$00:ba55  00 8e         brk #$8e
$00:ba57  9a            txs
$00:ba58  03 02         ora $02,s
$00:ba5a  91 02         sta ($02),y
$00:ba5c  0c 00 04      tsb $0400
$00:ba5f  62 ba 6b      per $261c
$00:ba62  02 85         cop #$85
$00:ba64  36 be         rol $be,x
$00:ba66  00 bd         brk #$bd
$00:ba68  16 00         asl $00,x
$00:ba6a  29 ff fc      and #$fcff
$00:ba6d  9d 16 00      sta $0016,x
$00:ba70  9c 2d 04      stz $042d
$00:ba73  02 1b         cop #$1b
$00:ba75  0b            phd
$00:ba76  bb            tyx
$00:ba77  3c 00 02      bit $0200,x
$00:ba7a  0c 00 04      tsb $0400
$00:ba7d  93 ba         sta ($ba,s),y
$00:ba7f  02 9b         cop #$9b
$00:ba81  60            rts
$00:ba82  00 89         brk #$89
$00:ba84  ba            tsx
$00:ba85  89 ba d1      bit #$d1ba
$00:ba88  bc 02 9a      ldy $9a02,x
$00:ba8b  10 00         bpl $ba8d
$00:ba8d  c7 bc         cmp [$bc]
$00:ba8f  9d bb de      sta $debb,x
$00:ba92  bb            tyx
$00:ba93  02 21         cop #$21
$00:ba95  7f ba 02 ae   adc $ae02ba,x
$00:ba99  00 00         brk #$00
$00:ba9b  c0 ff 7f      cpy #$7fff
$00:ba9e  ba            tsx
$00:ba9f  02 ae         cop #$ae
$00:baa1  00 00         brk #$00
$00:baa3  b0 ff         bcs $baa4
$00:baa5  7f ba 02 ae   adc $ae02ba,x
$00:baa9  10 00         bpl $baab
$00:baab  c0 ff 7f      cpy #$7fff
$00:baae  ba            tsx
$00:baaf  02 ae         cop #$ae
$00:bab1  10 00         bpl $bab3
$00:bab3  b0 ff         bcs $bab4
$00:bab5  7f ba 02 85   adc $8502ba,x
$00:bab9  3c bd 00      bit $00bd,x
$00:babc  02 1b         cop #$1b
$00:babe  7f ba 1e 00   adc $001eba,x
$00:bac2  02 0c         cop #$0c
$00:bac4  00 04         brk #$04
$00:bac6  dc ba 02      jml [$02ba]
$00:bac9  9a            txs
$00:baca  60            rts
$00:bacb  00 fe         brk #$fe
$00:bacd  bc d2 ba      ldy $bad2,x
$00:bad0  d2 ba         cmp ($ba)
$00:bad2  02 9b         cop #$9b
$00:bad4  10 00         bpl $bad6
$00:bad6  e8            inx
$00:bad7  bb            tyx
$00:bad8  f2 bb         sbc ($bb)
$00:bada  30 bc         bmi $ba98
$00:badc  02 24         cop #$24
$00:bade  c8            iny
$00:badf  ba            tsx
$00:bae0  02 ae         cop #$ae
$00:bae2  50 00         bvc $bae4
$00:bae4  00 00         brk #$00
$00:bae6  c8            iny
$00:bae7  ba            tsx
$00:bae8  02 ae         cop #$ae
$00:baea  50 00         bvc $baec
$00:baec  f0 ff         beq $baed
$00:baee  c8            iny
$00:baef  ba            tsx
$00:baf0  02 ae         cop #$ae
$00:baf2  60            rts
$00:baf3  00 00         brk #$00
$00:baf5  00 c8         brk #$c8
$00:baf7  ba            tsx
$00:baf8  02 ae         cop #$ae
$00:bafa  60            rts
$00:bafb  00 f0         brk #$f0
$00:bafd  ff c8 ba 02   sbc $02bac8,x
$00:bb01  85 a1         sta $a1
$00:bb03  bd 00 02      lda $0200,x
$00:bb06  1b            tcs
$00:bb07  c8            iny
$00:bb08  ba            tsx
$00:bb09  1e 00 02      asl $0200,x
$00:bb0c  0c 00 04      tsb $0400
$00:bb0f  25 bb         and $bb
$00:bb11  02 9b         cop #$9b
$00:bb13  60            rts
$00:bb14  00 e0         brk #$e0
$00:bb16  bc 1b bb      ldy $bb1b,x
$00:bb19  1b            tcs
$00:bb1a  bb            tyx
$00:bb1b  02 9a         cop #$9a
$00:bb1d  10 00         bpl $bb1f
$00:bb1f  8f bc 44 bc   sta $bc44bc
$00:bb23  3a            dec a
$00:bb24  bc 02 22      ldy $2202,x
$00:bb27  11 bb         ora ($bb),y
$00:bb29  02 ae         cop #$ae
$00:bb2b  00 00         brk #$00
$00:bb2d  30 00         bmi $bb2f
$00:bb2f  11 bb         ora ($bb),y
$00:bb31  02 ae         cop #$ae
$00:bb33  00 00         brk #$00
$00:bb35  40            rti
$00:bb36  00 11         brk #$11
$00:bb38  bb            tyx
$00:bb39  02 ae         cop #$ae
$00:bb3b  10 00         bpl $bb3d
$00:bb3d  30 00         bmi $bb3f
$00:bb3f  11 bb         ora ($bb),y
$00:bb41  02 ae         cop #$ae
$00:bb43  10 00         bpl $bb45
$00:bb45  40            rti
$00:bb46  00 11         brk #$11
$00:bb48  bb            tyx
$00:bb49  02 85         cop #$85
$00:bb4b  0d bd 00      ora $00bd
$00:bb4e  02 1b         cop #$1b
$00:bb50  11 bb         ora ($bb),y
$00:bb52  1e 00 02      asl $0200,x
$00:bb55  0c 00 04      tsb $0400
$00:bb58  6e bb 02      ror $02bb
$00:bb5b  9a            txs
$00:bb5c  60            rts
$00:bb5d  00 64         brk #$64
$00:bb5f  bb            tyx
$00:bb60  64 bb         stz $bb
$00:bb62  ef bc 02 9b   sbc $9b02bc
$00:bb66  10 00         bpl $bb68
$00:bb68  bd bc 99      lda $99bc,x
$00:bb6b  bc 85 bc      ldy $bc85,x
$00:bb6e  02 23         cop #$23
$00:bb70  5a            phy
$00:bb71  bb            tyx
$00:bb72  02 ae         cop #$ae
$00:bb74  c0 ff 00      cpy #$00ff
$00:bb77  00 5a         brk #$5a
$00:bb79  bb            tyx
$00:bb7a  02 ae         cop #$ae
$00:bb7c  c0 ff f0      cpy #$f0ff
$00:bb7f  ff 5a bb 02   sbc $02bb5a,x
$00:bb83  ae b0 ff      ldx $ffb0
$00:bb86  00 00         brk #$00
$00:bb88  5a            phy
$00:bb89  bb            tyx
$00:bb8a  02 ae         cop #$ae
$00:bb8c  b0 ff         bcs $bb8d
$00:bb8e  f0 ff         beq $bb8f
$00:bb90  5a            phy
$00:bb91  bb            tyx
$00:bb92  02 85         cop #$85
$00:bb94  6f bd 00 02   adc $0200bd
$00:bb98  1b            tcs
$00:bb99  5a            phy
$00:bb9a  bb            tyx
$00:bb9b  1e 00 02      asl $0200,x
$00:bb9e  97 02         sta [$02],y
$00:bba0  80 38         bra $bbda
$00:bba2  02 82         cop #$82
$00:bba4  02 9b         cop #$9b
$00:bba6  00 00         brk #$00
$00:bba8  ae bb b7      ldx $b7bb
$00:bbab  bb            tyx
$00:bbac  b7 bb         lda [$bb],y
$00:bbae  02 9d         cop #$9d
$00:bbb0  11 02         ora ($02),y
$00:bbb2  9e c1 bb      stz $bbc1,x
$00:bbb5  80 ed         bra $bba4
$00:bbb7  02 9d         cop #$9d
$00:bbb9  39 02 9e      and $9e02,y
$00:bbbc  c1 bb         cmp ($bb,x)
$00:bbbe  82 b8 fe      brl $ba79
$00:bbc1  02 9a         cop #$9a
$00:bbc3  00 00         brk #$00
$00:bbc5  cb            wai
$00:bbc6  bb            tyx
$00:bbc7  cb            wai
$00:bbc8  bb            tyx
$00:bbc9  d5 bb         cmp $bb,x
$00:bbcb  02 97         cop #$97
$00:bbcd  02 80         cop #$80
$00:bbcf  0f 02 82 82   ora $828202
$00:bbd3  c4 00         cpy $00
$00:bbd5  02 96         cop #$96
$00:bbd7  02 80         cop #$80
$00:bbd9  0f 02 82 80   ora $808202
$00:bbdd  14 02         trb $02
$00:bbdf  96 02         stx $02,y
$00:bbe1  80 0f         bra $bbf2
$00:bbe3  02 82         cop #$82
$00:bbe5  82 0a 00      brl $bbf2
$00:bbe8  02 96         cop #$96
$00:bbea  02 80         cop #$80
$00:bbec  0d 02 82      ora $8202
$00:bbef  82 ab ff      brl $bb9d
$00:bbf2  02 96         cop #$96
$00:bbf4  02 80         cop #$80
$00:bbf6  36 02         rol $02,x
$00:bbf8  82 02 9a      brl $55fd
$00:bbfb  00 00         brk #$00
$00:bbfd  0d bc 0d      ora $0dbc
$00:bc00  bc 03 bc      ldy $bc03,x
$00:bc03  02 9d         cop #$9d
$00:bc05  12 02         ora ($02)
$00:bc07  9e 17 bc      stz $bc17,x
$00:bc0a  82 ec ff      brl $bbf9
$00:bc0d  02 9d         cop #$9d
$00:bc0f  37 02         and [$02],y
$00:bc11  9e 17 bc      stz $bc17,x
$00:bc14  82 ab fe      brl $bac2
$00:bc17  02 9b         cop #$9b
$00:bc19  00 00         brk #$00
$00:bc1b  21 bc         and ($bc,x)
$00:bc1d  21 bc         and ($bc,x)
$00:bc1f  29 bc 02      and #$02bc
$00:bc22  80 0d         bra $bc31
$00:bc24  02 82         cop #$82
$00:bc26  82 74 ff      brl $bb9d
$00:bc29  02 80         cop #$80
$00:bc2b  0e 02 82      asl $8202
$00:bc2e  80 14         bra $bc44
$00:bc30  02 96         cop #$96
$00:bc32  02 80         cop #$80
$00:bc34  0e 02 82      asl $8202
$00:bc37  82 0a 00      brl $bc44
$00:bc3a  02 96         cop #$96
$00:bc3c  02 80         cop #$80
$00:bc3e  0c 02 82      tsb $8202
$00:bc41  82 ae ff      brl $bbf2
$00:bc44  02 97         cop #$97
$00:bc46  02 80         cop #$80
$00:bc48  3a            dec a
$00:bc49  02 82         cop #$82
$00:bc4b  02 9b         cop #$9b
$00:bc4d  00 00         brk #$00
$00:bc4f  5e bc 5e      lsr $5ebc,x
$00:bc52  bc 55 bc      ldy $bc55,x
$00:bc55  02 9d         cop #$9d
$00:bc57  10 02         bpl $bc5b
$00:bc59  9e 68 bc      stz $bc68,x
$00:bc5c  80 ed         bra $bc4b
$00:bc5e  02 9d         cop #$9d
$00:bc60  3b            tsc
$00:bc61  02 9e         cop #$9e
$00:bc63  68            pla
$00:bc64  bc 82 a3      ldy $a382,x
$00:bc67  fe 02 9a      inc $9a02,x
$00:bc6a  00 00         brk #$00
$00:bc6c  72 bc         adc ($bc)
$00:bc6e  72 bc         adc ($bc)
$00:bc70  7b            tdc
$00:bc71  bc 02 97      ldy $9702,x
$00:bc74  02 80         cop #$80
$00:bc76  0c 02 82      tsb $8202
$00:bc79  80 1e         bra $bc99
$00:bc7b  02 96         cop #$96
$00:bc7d  02 80         cop #$80
$00:bc7f  0c 02 82      tsb $8202
$00:bc82  82 6d ff      brl $bbf2
$00:bc85  02 97         cop #$97
$00:bc87  02 80         cop #$80
$00:bc89  0e 02 82      asl $8202
$00:bc8c  82 b5 ff      brl $bc44
$00:bc8f  02 97         cop #$97
$00:bc91  02 80         cop #$80
$00:bc93  0c 02 82      tsb $8202
$00:bc96  82 00 00      brl $bc99
$00:bc99  02 97         cop #$97
$00:bc9b  02 80         cop #$80
$00:bc9d  36 02         rol $02,x
$00:bc9f  82 02 9a      brl $56a4
$00:bca2  00 00         brk #$00
$00:bca4  aa            tax
$00:bca5  bc b3 bc      ldy $bcb3,x
$00:bca8  b3 bc         lda ($bc,s),y
$00:bcaa  02 9d         cop #$9d
$00:bcac  12 02         ora ($02)
$00:bcae  9e 17 bc      stz $bc17,x
$00:bcb1  80 ed         bra $bca0
$00:bcb3  02 9d         cop #$9d
$00:bcb5  37 02         and [$02],y
$00:bcb7  9e 17 bc      stz $bc17,x
$00:bcba  82 97 fe      brl $bb54
$00:bcbd  02 97         cop #$97
$00:bcbf  02 80         cop #$80
$00:bcc1  0d 02 82      ora $8202
$00:bcc4  82 d6 fe      brl $bb9d
$00:bcc7  02 97         cop #$97
$00:bcc9  02 80         cop #$80
$00:bccb  0f 02 82 82   ora $828202
$00:bccf  c8            iny
$00:bcd0  ff 02 97 02   sbc $029702,x
$00:bcd4  80 0f         bra $bce5
$00:bcd6  02 82         cop #$82
$00:bcd8  02 80         cop #$80
$00:bcda  0e 02 82      asl $8202
$00:bcdd  82 64 ff      brl $bc44
$00:bce0  02 97         cop #$97
$00:bce2  02 80         cop #$80
$00:bce4  0c 02 82      tsb $8202
$00:bce7  02 80         cop #$80
$00:bce9  0d 02 82      ora $8202
$00:bcec  82 ae fe      brl $bb9d
$00:bcef  02 80         cop #$80
$00:bcf1  0d 02 82      ora $8202
$00:bcf4  02 96         cop #$96
$00:bcf6  02 80         cop #$80
$00:bcf8  0f 02 82 82   ora $828202
$00:bcfc  f4 fe 02      pea $02fe
$00:bcff  80 0d         bra $bd0e
$00:bd01  02 82         cop #$82
$00:bd03  02 97         cop #$97
$00:bd05  02 80         cop #$80
$00:bd07  0f 02 82 82   ora $828202
$00:bd0b  8c ff 20      sty $20ff
$00:bd0e  02 be         cop #$be
$00:bd10  02 9f         cop #$9f
$00:bd12  08            php
$00:bd13  00 02         brk #$02
$00:bd15  80 3c         bra $bd53
$00:bd17  02 82         cop #$82
$00:bd19  02 85         cop #$85
$00:bd1b  2c bd 00      bit $00bd
$00:bd1e  02 80         cop #$80
$00:bd20  25 02         and $02
$00:bd22  82 02 a1      brl $5e27
$00:bd25  f8            sed
$00:bd26  ff 10 00 82   sbc $820010,x
$00:bd2a  e1 00         sbc ($00,x)
$00:bd2c  a9 00 02      lda #$0200
$00:bd2f  9d 16 00      sta $0016,x
$00:bd32  02 a3         cop #$a3
$00:bd34  02 80         cop #$80
$00:bd36  3e 02 82      rol $8202,x
$00:bd39  02 86         cop #$86
$00:bd3b  6b            rtl
$00:bd3c  a9 00 02      lda #$0200
$00:bd3f  9d 16 00      sta $0016,x
$00:bd42  02 a1         cop #$a1
$00:bd44  08            php
$00:bd45  00 e8         brk #$e8
$00:bd47  ff 02 98 02   sbc $029802,x
$00:bd4b  80 3c         bra $bd89
$00:bd4d  02 82         cop #$82
$00:bd4f  00 5b         brk #$5b
$00:bd51  02 80         cop #$80
$00:bd53  25 02         and $02
$00:bd55  82 02 a1      brl $5e5a
$00:bd58  f8            sed
$00:bd59  ff f8 ff 02   sbc $02fff8,x
$00:bd5d  85 e4         sta $e4
$00:bd5f  bd 00 02      lda $0200,x
$00:bd62  a0 e0 ff      ldy #$ffe0
$00:bd65  02 a4         cop #$a4
$00:bd67  02 80         cop #$80
$00:bd69  26 02         rol $02
$00:bd6b  82 02 86      brl $4370
$00:bd6e  6b            rtl
$00:bd6f  20 02 be      jsr $be02
$00:bd72  02 a1         cop #$a1
$00:bd74  f8            sed
$00:bd75  ff f4 ff 02   sbc $02fff4,x
$00:bd79  80 3c         bra $bdb7
$00:bd7b  02 82         cop #$82
$00:bd7d  02 85         cop #$85
$00:bd7f  8f bd 00 02   sta $0200bd
$00:bd83  80 24         bra $bda9
$00:bd85  02 82         cop #$82
$00:bd87  02 a1         cop #$a1
$00:bd89  f0 ff         beq $bd8a
$00:bd8b  08            php
$00:bd8c  00 80         brk #$80
$00:bd8e  7e a9 00      ror $00a9,x
$00:bd91  02 9d         cop #$9d
$00:bd93  16 00         asl $00,x
$00:bd95  02 a3         cop #$a3
$00:bd97  02 97         cop #$97
$00:bd99  02 80         cop #$80
$00:bd9b  3d 02 82      and $8202,x
$00:bd9e  02 86         cop #$86
$00:bda0  6b            rtl
$00:bda1  20 02 be      jsr $be02
$00:bda4  02 a1         cop #$a1
$00:bda6  20 00 f4      jsr $f400
$00:bda9  ff 02 80 3c   sbc $3c8002,x
$00:bdad  02 82         cop #$82
$00:bdaf  02 85         cop #$85
$00:bdb1  d2 bd         cmp ($bd)
$00:bdb3  00 02         brk #$02
$00:bdb5  96 02         stx $02,y
$00:bdb7  80 24         bra $bddd
$00:bdb9  02 82         cop #$82
$00:bdbb  02 a0         cop #$a0
$00:bdbd  08            php
$00:bdbe  00 02         brk #$02
$00:bdc0  85 e4         sta $e4
$00:bdc2  bd 00 02      lda $0200,x
$00:bdc5  9f 18 00 02   sta $020018,x
$00:bdc9  a4 02         ldy $02
$00:bdcb  80 26         bra $bdf3
$00:bdcd  02 82         cop #$82
$00:bdcf  02 86         cop #$86
$00:bdd1  6b            rtl
$00:bdd2  a9 00 02      lda #$0200
$00:bdd5  9d 16 00      sta $0016,x
$00:bdd8  02 a3         cop #$a3
$00:bdda  02 96         cop #$96
$00:bddc  02 80         cop #$80
$00:bdde  3d 02 82      and $8202,x
$00:bde1  02 86         cop #$86
$00:bde3  6b            rtl
$00:bde4  a9 00 02      lda #$0200
$00:bde7  9d 16 00      sta $0016,x
$00:bdea  02 a4         cop #$a4
$00:bdec  02 99         cop #$99
$00:bdee  02 80         cop #$80
$00:bdf0  22 02 82 02   jsl $028202  ; -> Sub_02_8202
$00:bdf4  81 40         sta ($40,x)
$00:bdf6  14 02         trb $02
$00:bdf8  83 02         sta $02,s
$00:bdfa  81 3f         sta ($3f,x)
$00:bdfc  14 02         trb $02
$00:bdfe  83 02         sta $02,s
$00:be00  86 6b         stx $6b
$00:be02  a9 00 02      lda #$0200
$00:be05  9d 16 00      sta $0016,x
$00:be08  02 a3         cop #$a3
$00:be0a  00 5b         brk #$5b
$00:be0c  60            rts
$00:be0d  02 85         cop #$85
$00:be0f  e4 bd         cpx $bd
$00:be11  00 02         brk #$02
$00:be13  a4 02         ldy $02
$00:be15  80 26         bra $be3d
$00:be17  02 82         cop #$82
$00:be19  02 86         cop #$86
$00:be1b  6b            rtl
$00:be1c  02 a8         cop #$a8
$00:be1e  00 80         brk #$80
$00:be20  0d 02 92      ora $9202
$00:be23  3a            dec a
$00:be24  02 94         cop #$94
$00:be26  02 86         cop #$86
$00:be28  6b            rtl
$00:be29  02 a8         cop #$a8
$00:be2b  00 80         brk #$80
$00:be2d  0d 02 92      ora $9202
$00:be30  3c 02 94      bit $9402,x
$00:be33  02 86         cop #$86
$00:be35  6b            rtl
$00:be36  02 a8         cop #$a8
$00:be38  00 80         brk #$80
$00:be3a  0d 02 92      ora $9202
$00:be3d  3e 02 94      rol $9402,x
$00:be40  02 86         cop #$86
$00:be42  6b            rtl
$00:be43  ee 58 04      inc $0458
$00:be46  8e 9a 03      stx $039a
$00:be49  02 a3         cop #$a3
$00:be4b  02 ad         cop #$ad
$00:be4d  08            php
$00:be4e  02 0c         cop #$0c
$00:be50  00 04         brk #$04
$00:be52  5a            phy
$00:be53  be 02 1b      ldx $1b02,y
$00:be56  49 be 08      eor #$08be
$00:be59  00 02         brk #$02
$00:be5b  80 00         bra $be5d
$00:be5d  02 82         cop #$82
$00:be5f  02 85         cop #$85
$00:be61  9b            txy
$00:be62  c0 00 02      cpy #$0200
$00:be65  b0 c0         bcs $be27
$00:be67  be 00 00      ldx $0000,y
$00:be6a  02 02         cop #$02
$00:be6c  af 3f bf 00   lda $00bf3f
$00:be70  01 02         ora ($02,x)
$00:be72  02 af         cop #$af
$00:be74  ec bf 00      cpx $00bf
$00:be77  01 02         ora ($02,x)
$00:be79  02 03         cop #$03
$00:be7b  04 02         tsb $02
$00:be7d  97 02         sta [$02],y
$00:be7f  80 01         bra $be82
$00:be81  02 82         cop #$82
$00:be83  02 96         cop #$96
$00:be85  02 80         cop #$80
$00:be87  01 02         ora ($02,x)
$00:be89  82 02 04      brl $c28e
$00:be8c  02 80         cop #$80
$00:be8e  20 02 82      jsr $8202  ; -> Sub_00_8202
$00:be91  02 80         cop #$80
$00:be93  1e 02 82      asl $8202,x
$00:be96  02 09         cop #$09
$00:be98  00 80         brk #$80
$00:be9a  02 05         cop #$05
$00:be9c  00 80         brk #$80
$00:be9e  02 80         cop #$80
$00:bea0  1f 02 82 ac   ora $ac8202,x
$00:bea4  9c 03 b9      stz $b903
$00:bea7  00 00         brk #$00
$00:bea9  c9 80 00      cmp #$0080
$00:beac  b0 09         bcs $beb7
$00:beae  02 97         cop #$97
$00:beb0  02 80         cop #$80
$00:beb2  21 02         and ($02,x)
$00:beb4  82 80 c2      brl $8137
$00:beb7  02 96         cop #$96
$00:beb9  02 80         cop #$80
$00:bebb  21 02         and ($02,x)
$00:bebd  82 80 b9      brl $7840
$00:bec0  02 a3         cop #$a3
$00:bec2  02 80         cop #$80
$00:bec4  22 02 82 02   jsl $028202  ; -> Sub_02_8202
$00:bec8  05 00         ora $00
$00:beca  00 02         brk #$02
$00:becc  80 03         bra $bed1
$00:bece  02 82         cop #$82
$00:bed0  02 af         cop #$af
$00:bed2  e8            inx
$00:bed3  be 00 00      ldx $0000,y
$00:bed6  02 02         cop #$02
$00:bed8  1b            tcs
$00:bed9  dd be 18      cmp $18be,x
$00:bedc  00 02         brk #$02
$00:bede  80 04         bra $bee4
$00:bee0  02 82         cop #$82
$00:bee2  02 09         cop #$09
$00:bee4  00 00         brk #$00
$00:bee6  80 da         bra $bec2
$00:bee8  02 a3         cop #$a3
$00:beea  02 a1         cop #$a1
$00:beec  08            php
$00:beed  00 fc         brk #$fc
$00:beef  ff 02 80 18   sbc $188002,x
$00:bef3  02 82         cop #$82
$00:bef5  00 51         brk #$51
$00:bef7  02 b0         cop #$b0
$00:bef9  14 bf         trb $bf
$00:befb  00 00         brk #$00
$00:befd  02 02         cop #$02
$00:beff  b0 1d         bcs $bf1e
$00:bf01  bf 00 00 02   lda $020000,x
$00:bf05  02 b0         cop #$b0
$00:bf07  26 bf         rol $bf
$00:bf09  00 00         brk #$00
$00:bf0b  02 02         cop #$02
$00:bf0d  80 17         bra $bf26
$00:bf0f  02 82         cop #$82
$00:bf11  02 86         cop #$86
$00:bf13  6b            rtl
$00:bf14  02 a3         cop #$a3
$00:bf16  02 80         cop #$80
$00:bf18  16 02         asl $02,x
$00:bf1a  82 80 12      brl $d19d
$00:bf1d  02 a3         cop #$a3
$00:bf1f  02 80         cop #$80
$00:bf21  15 02         ora $02,x
$00:bf23  82 80 09      brl $c8a6
$00:bf26  02 a3         cop #$a3
$00:bf28  02 96         cop #$96
$00:bf2a  02 80         cop #$80
$00:bf2c  15 02         ora $02,x
$00:bf2e  82 02 80      brl $3f33
$00:bf31  14 02         trb $02
$00:bf33  82 02 1c      brl $db38
$00:bf36  00 80         brk #$80
$00:bf38  3c bf 80      bit $80bf,x
$00:bf3b  f3 02         sbc ($02,s),y
$00:bf3d  86 6b         stx $6b
$00:bf3f  02 a3         cop #$a3
$00:bf41  bd 1a 00      lda $001a,x
$00:bf44  09 00 01      ora #$0100
$00:bf47  9d 1a 00      sta $001a,x
$00:bf4a  02 99         cop #$99
$00:bf4c  02 97         cop #$97
$00:bf4e  a9 30 00      lda #$0030
$00:bf51  9d 00 00      sta $0000,x
$00:bf54  a9 70 00      lda #$0070
$00:bf57  9d 02 00      sta $0002,x
$00:bf5a  02 81         cop #$81
$00:bf5c  25 14         and $14
$00:bf5e  02 83         cop #$83
$00:bf60  e2 20         sep #$20
$00:bf62  a9 63         lda #$63
$00:bf64  9d 25 00      sta $0025,x
$00:bf67  c2 20         rep #$20
$00:bf69  bd 16 00      lda $0016,x
$00:bf6c  29 ff fc      and #$fcff
$00:bf6f  9d 16 00      sta $0016,x
$00:bf72  bd 25 00      lda $0025,x
$00:bf75  29 ff 00      and #$00ff
$00:bf78  c9 5a 00      cmp #$005a
$00:bf7b  90 5a         bcc $bfd7
$00:bf7d  02 9c         cop #$9c
$00:bf7f  83 bf         sta $bf,s
$00:bf81  ad bf 02      lda $02bf
$00:bf84  9a            txs
$00:bf85  00 00         brk #$00
$00:bf87  8d bf 9d      sta $9dbf
$00:bf8a  bf 9d bf 02   lda $02bf9d,x
$00:bf8e  97 02         sta [$02],y
$00:bf90  99 02 80      sta $8002,y
$00:bf93  27 02         and [$02]
$00:bf95  82 02 80      brl $3f9a
$00:bf98  29 02 82      and #$8202
$00:bf9b  80 d5         bra $bf72
$00:bf9d  02 96         cop #$96
$00:bf9f  02 99         cop #$99
$00:bfa1  02 80         cop #$80
$00:bfa3  10 02         bpl $bfa7
$00:bfa5  82 02 80      brl $3faa
$00:bfa8  12 02         ora ($02)
$00:bfaa  82 80 c5      brl $852d
$00:bfad  02 9b         cop #$9b
$00:bfaf  00 00         brk #$00
$00:bfb1  b7 bf         lda [$bf],y
$00:bfb3  c7 bf         cmp [$bf]
$00:bfb5  c7 bf         cmp [$bf]
$00:bfb7  02 97         cop #$97
$00:bfb9  02 98         cop #$98
$00:bfbb  02 80         cop #$80
$00:bfbd  0f 02 82 02   ora $028202
$00:bfc1  80 11         bra $bfd4
$00:bfc3  02 82         cop #$82
$00:bfc5  80 ab         bra $bf72
$00:bfc7  02 97         cop #$97
$00:bfc9  02 99         cop #$99
$00:bfcb  02 80         cop #$80
$00:bfcd  26 02         rol $02
$00:bfcf  82 02 80      brl $3fd4
$00:bfd2  28            plp
$00:bfd3  02 82         cop #$82
$00:bfd5  80 9b         bra $bf72
$00:bfd7  bd 16 00      lda $0016,x
$00:bfda  09 00 03      ora #$0300
$00:bfdd  9d 16 00      sta $0016,x
$00:bfe0  02 81         cop #$81
$00:bfe2  25 14         and $14
$00:bfe4  02 83         cop #$83
$00:bfe6  02 1b         cop #$1b
$00:bfe8  4a            lsr a
$00:bfe9  bf 2c 01 02   lda $02012c,x
$00:bfed  a3 02         lda $02,s
$00:bfef  96 bd         stx $bd,y
$00:bff1  1a            inc a
$00:bff2  00 09         brk #$09
$00:bff4  00 01         brk #$01
$00:bff6  9d 1a 00      sta $001a,x
$00:bff9  02 99         cop #$99
$00:bffb  02 97         cop #$97
$00:bffd  a9 b0 00      lda #$00b0
$00:c000  9d 00 00      sta $0000,x
$00:c003  a9 70 00      lda #$0070
$00:c006  9d 02 00      sta $0002,x
$00:c009  02 81         cop #$81
$00:c00b  0e 14 02      asl $0214
$00:c00e  83 e2         sta $e2,s
$00:c010  20 a9 63      jsr $63a9
$00:c013  9d 25 00      sta $0025,x
$00:c016  c2 20         rep #$20
$00:c018  bd 16 00      lda $0016,x
$00:c01b  29 ff fc      and #$fcff
$00:c01e  9d 16 00      sta $0016,x
$00:c021  bd 25 00      lda $0025,x
$00:c024  29 ff 00      and #$00ff
$00:c027  c9 5a 00      cmp #$005a
$00:c02a  90 5a         bcc $c086
$00:c02c  02 9c         cop #$9c
$00:c02e  32 c0         and ($c0)
$00:c030  5c c0 02 9a   jml $9a02c0
$00:c034  00 00         brk #$00
$00:c036  3c c0 4c      bit $4cc0,x
$00:c039  c0 4c c0      cpy #$c04c
$00:c03c  02 97         cop #$97
$00:c03e  02 99         cop #$99
$00:c040  02 80         cop #$80
$00:c042  10 02         bpl $c046
$00:c044  82 02 80      brl $4049
$00:c047  12 02         ora ($02)
$00:c049  82 80 d5      brl $95cc
$00:c04c  02 96         cop #$96
$00:c04e  02 99         cop #$99
$00:c050  02 80         cop #$80
$00:c052  27 02         and [$02]
$00:c054  82 02 80      brl $4059
$00:c057  29 02 82      and #$8202
$00:c05a  80 c5         bra $c021
$00:c05c  02 9b         cop #$9b
$00:c05e  00 00         brk #$00
$00:c060  66 c0         ror $c0
$00:c062  76 c0         ror $c0,x
$00:c064  76 c0         ror $c0,x
$00:c066  02 97         cop #$97
$00:c068  02 98         cop #$98
$00:c06a  02 80         cop #$80
$00:c06c  26 02         rol $02
$00:c06e  82 02 80      brl $4073
$00:c071  28            plp
$00:c072  02 82         cop #$82
$00:c074  80 ab         bra $c021
$00:c076  02 97         cop #$97
$00:c078  02 99         cop #$99
$00:c07a  02 80         cop #$80
$00:c07c  0f 02 82 02   ora $028202
$00:c080  80 11         bra $c093
$00:c082  02 82         cop #$82
$00:c084  80 9b         bra $c021
$00:c086  bd 16 00      lda $0016,x
$00:c089  09 00 03      ora #$0300
$00:c08c  9d 16 00      sta $0016,x
$00:c08f  02 81         cop #$81
$00:c091  0e 14 02      asl $0214
$00:c094  83 02         sta $02,s
$00:c096  1b            tcs
$00:c097  f9 bf 2c      sbc $2cbf,y
$00:c09a  01 bd         ora ($bd,x)
$00:c09c  3c 00 9d      bit $9d00,x
$00:c09f  02 00         cop #$00
$00:c0a1  a8            tay
$00:c0a2  b9 3c 00      lda $003c,y
$00:c0a5  9d 00 00      sta $0000,x
$00:c0a8  02 91         cop #$91
$00:c0aa  da            phx
$00:c0ab  02 07         cop #$07
$00:c0ad  00 80         brk #$80
$00:c0af  c4 c0         cpy $c0
$00:c0b1  bd 00 00      lda $0000,x
$00:c0b4  bc 02 00      ldy $0002,x
$00:c0b7  aa            tax
$00:c0b8  bd 00 00      lda $0000,x
$00:c0bb  99 00 00      sta $0000,y
$00:c0be  bd 02 00      lda $0002,x
$00:c0c1  99 02 00      sta $0002,y
$00:c0c4  fa            plx
$00:c0c5  da            phx
$00:c0c6  bd 00 00      lda $0000,x
$00:c0c9  bc 02 00      ldy $0002,x
$00:c0cc  aa            tax
$00:c0cd  bd 26 00      lda $0026,x
$00:c0d0  99 26 00      sta $0026,y
$00:c0d3  bd 16 00      lda $0016,x
$00:c0d6  89 00 04      bit #$0400
$00:c0d9  d0 12         bne $c0ed
$00:c0db  29 00 08      and #$0800
$00:c0de  48            pha
$00:c0df  b9 16 00      lda $0016,y
$00:c0e2  29 ff f7      and #$f7ff
$00:c0e5  03 01         ora $01,s
$00:c0e7  99 16 00      sta $0016,y
$00:c0ea  68            pla
$00:c0eb  fa            plx
$00:c0ec  6b            rtl
$00:c0ed  bb            tyx
$00:c0ee  a9 fb c0      lda #$c0fb
$00:c0f1  9d 18 00      sta $0018,x
$00:c0f4  9e 14 00      stz $0014,x
$00:c0f7  fa            plx
$00:c0f8  02 86         cop #$86
$00:c0fa  6b            rtl
$00:c0fb  9e 04 00      stz $0004,x
$00:c0fe  9e 06 00      stz $0006,x
$00:c101  6b            rtl
$00:c102  02 14         cop #$14
$00:c104  b6 00         ldx $00,y
$00:c106  9d c1 02      sta $02c1,x
$00:c109  ad 08 02      lda $0208
$00:c10c  0c 00 03      tsb $0300
$00:c10f  18            clc
$00:c110  c1 02         cmp ($02,x)
$00:c112  80 1a         bra $c12e
$00:c114  02 82         cop #$82
$00:c116  80 f0         bra $c108
$00:c118  00 a1         brk #$a1
$00:c11a  02 b0         cop #$b0
$00:c11c  81 c2         sta ($c2,x)
$00:c11e  00 00         brk #$00
$00:c120  02 02         cop #$02
$00:c122  b0 89         bcs $c0ad
$00:c124  c2 00         rep #$00
$00:c126  00 02         brk #$02
$00:c128  02 b0         cop #$b0
$00:c12a  91 c2         sta ($c2),y
$00:c12c  00 00         brk #$00
$00:c12e  02 9e         cop #$9e
$00:c130  16 00         asl $00,x
$00:c132  02 80         cop #$80
$00:c134  0b            phd
$00:c135  02 82         cop #$82
$00:c137  02 ad         cop #$ad
$00:c139  08            php
$00:c13a  02 0c         cop #$0c
$00:c13c  00 04         brk #$04
$00:c13e  47 c1         eor [$c1]
$00:c140  02 80         cop #$80
$00:c142  2a            rol a
$00:c143  02 82         cop #$82
$00:c145  80 f0         bra $c137
$00:c147  02 9c         cop #$9c
$00:c149  4d c1 75      eor $75c1
$00:c14c  c1 02         cmp ($02,x)
$00:c14e  9a            txs
$00:c14f  10 00         bpl $c151
$00:c151  57 c1         eor [$c1],y
$00:c153  66 c1         ror $c1
$00:c155  66 c1         ror $c1
$00:c157  02 23         cop #$23
$00:c159  40            rti
$00:c15a  c1 02         cmp ($02,x)
$00:c15c  97 02         sta [$02],y
$00:c15e  99 02 80      sta $8002,y
$00:c161  0d 02 82      ora $8202
$00:c164  80 da         bra $c140
$00:c166  02 24         cop #$24
$00:c168  40            rti
$00:c169  c1 02         cmp ($02,x)
$00:c16b  96 02         stx $02,y
$00:c16d  99 02 80      sta $8002,y
$00:c170  0d 02 82      ora $8202
$00:c173  80 cb         bra $c140
$00:c175  02 9b         cop #$9b
$00:c177  10 00         bpl $c179
$00:c179  7f c1 8e c1   adc $c18ec1,x
$00:c17d  8e c1 02      stx $02c1
$00:c180  21 40         and ($40,x)
$00:c182  c1 02         cmp ($02,x)
$00:c184  97 02         sta [$02],y
$00:c186  98            tya
$00:c187  02 80         cop #$80
$00:c189  0c 02 82      tsb $8202
$00:c18c  80 b2         bra $c140
$00:c18e  02 22         cop #$22
$00:c190  40            rti
$00:c191  c1 02         cmp ($02,x)
$00:c193  97 02         sta [$02],y
$00:c195  99 02 80      sta $8002,y
$00:c198  0c 02 82      tsb $8202
$00:c19b  80 a3         bra $c140
$00:c19d  02 86         cop #$86
$00:c19f  6b            rtl
$00:c1a0  02 14         cop #$14
$00:c1a2  b6 00         ldx $00,y
$00:c1a4  45 c2         eor $c2
$00:c1a6  02 a0         cop #$a0
$00:c1a8  f8            sed
$00:c1a9  ff bd 1a 00   sbc $001abd,x
$00:c1ad  09 00 01      ora #$0100
$00:c1b0  9d 1a 00      sta $001a,x
$00:c1b3  02 ad         cop #$ad
$00:c1b5  08            php
$00:c1b6  02 9b         cop #$9b
$00:c1b8  40            rti
$00:c1b9  00 c0         brk #$c0
$00:c1bb  c1 c7         cmp ($c7,x)
$00:c1bd  c1 c0         cmp ($c0,x)
$00:c1bf  c1 02         cmp ($02,x)
$00:c1c1  80 23         bra $c1e6
$00:c1c3  02 82         cop #$82
$00:c1c5  80 ec         bra $c1b3
$00:c1c7  02 ad         cop #$ad
$00:c1c9  08            php
$00:c1ca  02 80         cop #$80
$00:c1cc  05 02         ora $02
$00:c1ce  82 e2 20      brl $e2b3
$00:c1d1  a9 63 9d      lda #$9d63
$00:c1d4  25 00         and $00
$00:c1d6  c2 20         rep #$20
$00:c1d8  bd 16 00      lda $0016,x
$00:c1db  29 ff fd      and #$fdff
$00:c1de  9d 16 00      sta $0016,x
$00:c1e1  02 03         cop #$03
$00:c1e3  0f bd 25 00   ora $0025bd
$00:c1e7  29 ff 00      and #$00ff
$00:c1ea  c9 63 00      cmp #$0063
$00:c1ed  90 29         bcc $c218
$00:c1ef  02 9b         cop #$9b
$00:c1f1  10 00         bpl $c1f3
$00:c1f3  f9 c1 00      sbc $00c1,y
$00:c1f6  c2 f9         rep #$f9
$00:c1f8  c1 02         cmp ($02,x)
$00:c1fa  80 06         bra $c202
$00:c1fc  02 82         cop #$82
$00:c1fe  02 04         cop #$04
$00:c200  02 80         cop #$80
$00:c202  07 02         ora [$02]
$00:c204  82 02 b0      brl $7209
$00:c207  31 c2         and ($c2),y
$00:c209  00 00         brk #$00
$00:c20b  02 02         cop #$02
$00:c20d  80 08         bra $c217
$00:c20f  02 82         cop #$82
$00:c211  02 80         cop #$80
$00:c213  06 02         asl $02
$00:c215  82 80 c9      brl $8b98
$00:c218  bd 16 00      lda $0016,x
$00:c21b  09 00 02      ora #$0200
$00:c21e  9d 16 00      sta $0016,x
$00:c221  02 80         cop #$80
$00:c223  09 02 82      ora #$8202
$00:c226  02 80         cop #$80
$00:c228  23 02         and $02,s
$00:c22a  82 02 1b      brl $dd2f
$00:c22d  c7 c1         cmp [$c1]
$00:c22f  2c 01 02      bit $0201
$00:c232  8f 00 5b 02   sta $025b00
$00:c236  80 13         bra $c24b
$00:c238  02 82         cop #$82
$00:c23a  02 1c         cop #$1c
$00:c23c  00 80         brk #$80
$00:c23e  42 c2         wdm #$c2
$00:c240  80 f3         bra $c235
$00:c242  02 86         cop #$86
$00:c244  6b            rtl
$00:c245  02 86         cop #$86
$00:c247  6b            rtl
$00:c248  02 a4         cop #$a4
$00:c24a  02 16         cop #$16
$00:c24c  02 14         cop #$14
$00:c24e  b6 00         ldx $00,y
$00:c250  7e c2 02      ror $02c2,x
$00:c253  9b            txy
$00:c254  30 00         bmi $c256
$00:c256  62 c2 5c      per $1f1b
$00:c259  c2 5c         rep #$5c
$00:c25b  c2 02         rep #$02
$00:c25d  1b            tcs
$00:c25e  52 c2         eor ($c2)
$00:c260  08            php
$00:c261  00 00         brk #$00
$00:c263  a1 02         lda ($02,x)
$00:c265  b0 81         bcs $c1e8
$00:c267  c2 00         rep #$00
$00:c269  00 02         brk #$02
$00:c26b  02 b0         cop #$b0
$00:c26d  89 c2 00      bit #$00c2
$00:c270  00 02         brk #$02
$00:c272  02 b0         cop #$b0
$00:c274  91 c2         sta ($c2),y
$00:c276  00 00         brk #$00
$00:c278  02 02         cop #$02
$00:c27a  15 02         ora $02,x
$00:c27c  86 6b         stx $6b
$00:c27e  02 91         cop #$91
$00:c280  6b            rtl
$00:c281  02 80         cop #$80
$00:c283  1b            tcs
$00:c284  02 82         cop #$82
$00:c286  02 86         cop #$86
$00:c288  6b            rtl
$00:c289  02 80         cop #$80
$00:c28b  1c 02 82      trb $8202
$00:c28e  02 86         cop #$86
$00:c290  6b            rtl
$00:c291  02 80         cop #$80
$00:c293  1d 02 82      ora $8202,x
$00:c296  02 86         cop #$86
$00:c298  6b            rtl
$00:c299  9c b2 03      stz $03b2
$00:c29c  ee 58 04      inc $0458
$00:c29f  8e 9a 03      stx $039a
$00:c2a2  02 9f         cop #$9f
$00:c2a4  08            php
$00:c2a5  00 02         brk #$02
$00:c2a7  85 88         sta $88
$00:c2a9  b1 00         lda ($00),y
$00:c2ab  a9 02 00      lda #$0002
$00:c2ae  99 30 00      sta $0030,y
$00:c2b1  a9 02 00      lda #$0002
$00:c2b4  9d 30 00      sta $0030,x
$00:c2b7  02 97         cop #$97
$00:c2b9  bd 16 00      lda $0016,x
$00:c2bc  09 00 03      ora #$0300
$00:c2bf  9d 16 00      sta $0016,x
$00:c2c2  02 b2         cop #$b2
$00:c2c4  28            plp
$00:c2c5  c5 00         cmp $00
$00:c2c7  10 00         bpl $c2c9
$00:c2c9  f0 ff         beq $c2ca
$00:c2cb  00 03         brk #$03
$00:c2cd  02 03         cop #$03
$00:c2cf  15 02         ora $02,x
$00:c2d1  04 02         tsb $02
$00:c2d3  b2 28         lda ($28)
$00:c2d5  c5 00         cmp $00
$00:c2d7  08            php
$00:c2d8  00 fa         brk #$fa
$00:c2da  ff 00 03 02   sbc $020300,x
$00:c2de  03 15         ora $15,s
$00:c2e0  02 04         cop #$04
$00:c2e2  02 b2         cop #$b2
$00:c2e4  28            plp
$00:c2e5  c5 00         cmp $00
$00:c2e7  14 00         trb $00
$00:c2e9  f6 ff         inc $ff,x
$00:c2eb  00 03         brk #$03
$00:c2ed  02 03         cop #$03
$00:c2ef  15 02         ora $02,x
$00:c2f1  04 02         tsb $02
$00:c2f3  85 f5         sta $f5
$00:c2f5  c5 00         cmp $00
$00:c2f7  02 80         cop #$80
$00:c2f9  0a            asl a
$00:c2fa  02 82         cop #$82
$00:c2fc  bd 16 00      lda $0016,x
$00:c2ff  29 ff fc      and #$fcff
$00:c302  9d 16 00      sta $0016,x
$00:c305  02 1f         cop #$1f
$00:c307  ad 02 03      lda $0302
$00:c30a  30 31         bmi $c33d
$00:c30c  02 80         cop #$80
$00:c30e  01 02         ora ($02,x)
$00:c310  82 02 b2      brl $7515
$00:c313  97 c4         sta [$c4],y
$00:c315  00 ea         brk #$ea
$00:c317  ff 0d 00 00   sbc $00000d,x
$00:c31b  02 02         cop #$02
$00:c31d  03 1f         ora $1f,s
$00:c31f  02 04         cop #$04
$00:c321  02 80         cop #$80
$00:c323  0d 02 82      ora $8202
$00:c326  02 80         cop #$80
$00:c328  05 02         ora $02
$00:c32a  82 02 b2      brl $752f
$00:c32d  87 c4         sta [$c4]
$00:c32f  00 ed         brk #$ed
$00:c331  ff 10 00 00   sbc $000010,x
$00:c335  02 02         cop #$02
$00:c337  80 06         bra $c33f
$00:c339  02 82         cop #$82
$00:c33b  80 2f         bra $c36c
$00:c33d  02 80         cop #$80
$00:c33f  00 02         brk #$02
$00:c341  82 02 b2      brl $7546
$00:c344  97 c4         sta [$c4],y
$00:c346  00 15         brk #$15
$00:c348  00 0f         brk #$0f
$00:c34a  00 00         brk #$00
$00:c34c  03 02         ora $02,s
$00:c34e  03 1f         ora $1f,s
$00:c350  02 04         cop #$04
$00:c352  02 80         cop #$80
$00:c354  0b            phd
$00:c355  02 82         cop #$82
$00:c357  02 80         cop #$80
$00:c359  02 02         cop #$02
$00:c35b  82 02 b2      brl $7560
$00:c35e  8f c4 00 12   sta $1200c4
$00:c362  00 10         brk #$10
$00:c364  00 00         brk #$00
$00:c366  02 02         cop #$02
$00:c368  80 03         bra $c36d
$00:c36a  02 82         cop #$82
$00:c36c  02 1f         cop #$1f
$00:c36e  ad 02 03      lda $0302
$00:c371  30 53         bmi $c3c6
$00:c373  02 80         cop #$80
$00:c375  05 02         ora $02
$00:c377  82 02 b2      brl $757c
$00:c37a  87 c4         sta [$c4]
$00:c37c  00 ed         brk #$ed
$00:c37e  ff 10 00 00   sbc $000010,x
$00:c382  02 02         cop #$02
$00:c384  80 06         bra $c38c
$00:c386  02 82         cop #$82
$00:c388  02 80         cop #$80
$00:c38a  0e 02 82      asl $8202
$00:c38d  bd 16 00      lda $0016,x
$00:c390  09 00 02      ora #$0200
$00:c393  9d 16 00      sta $0016,x
$00:c396  02 b2         cop #$b2
$00:c398  32 c5         and ($c5)
$00:c39a  00 e4         brk #$e4
$00:c39c  ff cd ff 00   sbc $00ffcd,x
$00:c3a0  02 02         cop #$02
$00:c3a2  b2 46         lda ($46)
$00:c3a4  c5 00         cmp $00
$00:c3a6  e4 ff         cpx $ff
$00:c3a8  cd ff 00      cmp $00ff
$00:c3ab  02 02         cop #$02
$00:c3ad  03 29         ora $29,s
$00:c3af  02 04         cop #$04
$00:c3b1  bd 16 00      lda $0016,x
$00:c3b4  09 00 03      ora #$0300
$00:c3b7  9d 16 00      sta $0016,x
$00:c3ba  02 85         cop #$85
$00:c3bc  f5 c5         sbc $c5,x
$00:c3be  00 02         brk #$02
$00:c3c0  80 08         bra $c3ca
$00:c3c2  02 82         cop #$82
$00:c3c4  80 51         bra $c417
$00:c3c6  02 80         cop #$80
$00:c3c8  02 02         cop #$02
$00:c3ca  82 02 b2      brl $75cf
$00:c3cd  8f c4 00 12   sta $1200c4
$00:c3d1  00 10         brk #$10
$00:c3d3  00 00         brk #$00
$00:c3d5  02 02         cop #$02
$00:c3d7  80 03         bra $c3dc
$00:c3d9  02 82         cop #$82
$00:c3db  02 80         cop #$80
$00:c3dd  0c 02 82      tsb $8202
$00:c3e0  bd 16 00      lda $0016,x
$00:c3e3  09 00 02      ora #$0200
$00:c3e6  9d 16 00      sta $0016,x
$00:c3e9  02 b2         cop #$b2
$00:c3eb  32 c5         and ($c5)
$00:c3ed  00 1b         brk #$1b
$00:c3ef  00 cd         brk #$cd
$00:c3f1  ff 00 02 02   sbc $020200,x
$00:c3f5  b2 46         lda ($46)
$00:c3f7  c5 00         cmp $00
$00:c3f9  1b            tcs
$00:c3fa  00 cd         brk #$cd
$00:c3fc  ff 00 02 02   sbc $020200,x
$00:c400  03 29         ora $29,s
$00:c402  02 04         cop #$04
$00:c404  bd 16 00      lda $0016,x
$00:c407  09 00 03      ora #$0300
$00:c40a  9d 16 00      sta $0016,x
$00:c40d  02 85         cop #$85
$00:c40f  f5 c5         sbc $c5,x
$00:c411  00 02         brk #$02
$00:c413  80 09         bra $c41e
$00:c415  02 82         cop #$82
$00:c417  bd 30 00      lda $0030,x
$00:c41a  c9 01 00      cmp #$0001
$00:c41d  f0 36         beq $c455
$00:c41f  02 1f         cop #$1f
$00:c421  ad 02 03      lda $0302
$00:c424  30 04         bmi $c42a
$00:c426  02 97         cop #$97
$00:c428  80 02         bra $c42c
$00:c42a  02 96         cop #$96
$00:c42c  02 af         cop #$af
$00:c42e  d3 c4         cmp ($c4,s),y
$00:c430  00 00         brk #$00
$00:c432  03 02         ora $02,s
$00:c434  af d3 c4 00   lda $00c4d3
$00:c438  00 03         brk #$03
$00:c43a  02 af         cop #$af
$00:c43c  d3 c4         cmp ($c4,s),y
$00:c43e  00 00         brk #$00
$00:c440  03 02         ora $02,s
$00:c442  af ff c4 00   lda $00c4ff
$00:c446  00 03         brk #$03
$00:c448  02 80         cop #$80
$00:c44a  14 02         trb $02
$00:c44c  82 de 30      brl $f52d
$00:c44f  00 f0         brk #$f0
$00:c451  03 82         ora $82,s
$00:c453  62 fe bd      per $8254
$00:c456  00 00         brk #$00
$00:c458  c9 f0 00      cmp #$00f0
$00:c45b  b0 04         bcs $c461
$00:c45d  02 97         cop #$97
$00:c45f  80 02         bra $c463
$00:c461  02 96         cop #$96
$00:c463  02 af         cop #$af
$00:c465  d3 c4         cmp ($c4,s),y
$00:c467  00 00         brk #$00
$00:c469  03 02         ora $02,s
$00:c46b  af d3 c4 00   lda $00c4d3
$00:c46f  00 03         brk #$03
$00:c471  02 af         cop #$af
$00:c473  d3 c4         cmp ($c4,s),y
$00:c475  00 00         brk #$00
$00:c477  03 02         ora $02,s
$00:c479  af ff c4 00   lda $00c4ff
$00:c47d  00 03         brk #$03
$00:c47f  02 80         cop #$80
$00:c481  15 02         ora $02,x
$00:c483  82 82 2a      brl $ef08
$00:c486  fe 02 80      inc $8002,x
$00:c489  07 02         ora [$02]
$00:c48b  82 02 86      brl $4a90
$00:c48e  6b            rtl
$00:c48f  02 80         cop #$80
$00:c491  04 02         tsb $02
$00:c493  82 02 86      brl $4a98
$00:c496  6b            rtl
$00:c497  02 a3         cop #$a3
$00:c499  02 81         cop #$81
$00:c49b  16 06         asl $06,x
$00:c49d  02 83         cop #$83
$00:c49f  00 4b         brk #$4b
$00:c4a1  02 b0         cop #$b0
$00:c4a3  bf c4 00 00   lda $0000c4,x
$00:c4a7  02 02         cop #$02
$00:c4a9  b0 c1         bcs $c46c
$00:c4ab  c4 00         cpy $00
$00:c4ad  00 02         brk #$02
$00:c4af  02 80         cop #$80
$00:c4b1  12 02         ora ($02)
$00:c4b3  82 bd 16      brl $db73
$00:c4b6  00 89         brk #$89
$00:c4b8  00 80         brk #$80
$00:c4ba  f0 f3         beq $c4af
$00:c4bc  02 86         cop #$86
$00:c4be  6b            rtl
$00:c4bf  02 96         cop #$96
$00:c4c1  02 a3         cop #$a3
$00:c4c3  02 80         cop #$80
$00:c4c5  13 02         ora ($02,s),y
$00:c4c7  82 bd 16      brl $db87
$00:c4ca  00 89         brk #$89
$00:c4cc  00 80         brk #$80
$00:c4ce  f0 f3         beq $c4c3
$00:c4d0  02 86         cop #$86
$00:c4d2  6b            rtl
$00:c4d3  02 a4         cop #$a4
$00:c4d5  02 80         cop #$80
$00:c4d7  1d 02 82      ora $8202,x
$00:c4da  02 91         cop #$91
$00:c4dc  ac 9a 03      ldy $039a
$00:c4df  b9 1e 00      lda $001e,y
$00:c4e2  c9 14 00      cmp #$0014
$00:c4e5  f0 05         beq $c4ec
$00:c4e7  c9 15 00      cmp #$0015
$00:c4ea  d0 10         bne $c4fc
$00:c4ec  bc 3e 00      ldy $003e,x
$00:c4ef  b9 00 00      lda $0000,y
$00:c4f2  9d 00 00      sta $0000,x
$00:c4f5  b9 02 00      lda $0002,y
$00:c4f8  9d 02 00      sta $0002,x
$00:c4fb  6b            rtl
$00:c4fc  02 86         cop #$86
$00:c4fe  6b            rtl
$00:c4ff  02 a4         cop #$a4
$00:c501  02 80         cop #$80
$00:c503  1d 02 82      ora $8202,x
$00:c506  02 91         cop #$91
$00:c508  ac 9a 03      ldy $039a
$00:c50b  b9 1e 00      lda $001e,y
$00:c50e  c9 14 00      cmp #$0014
$00:c511  f0 05         beq $c518
$00:c513  c9 15 00      cmp #$0015
$00:c516  d0 0d         bne $c525
$00:c518  b9 00 00      lda $0000,y
$00:c51b  9d 00 00      sta $0000,x
$00:c51e  b9 02 00      lda $0002,y
$00:c521  9d 02 00      sta $0002,x
$00:c524  6b            rtl
$00:c525  02 86         cop #$86
$00:c527  6b            rtl
$00:c528  02 a3         cop #$a3
$00:c52a  02 80         cop #$80
$00:c52c  0f 02 82 02   ora $028202
$00:c530  86 6b         stx $6b
$00:c532  02 a3         cop #$a3
$00:c534  02 81         cop #$81
$00:c536  16 06         asl $06,x
$00:c538  02 83         cop #$83
$00:c53a  00 4b         brk #$4b
$00:c53c  02 97         cop #$97
$00:c53e  02 81         cop #$81
$00:c540  19 02 02      ora $0202,y
$00:c543  83 80         sta $80,s
$00:c545  15 02         ora $02,x
$00:c547  a3 02         lda $02,s
$00:c549  81 16         sta ($16,x)
$00:c54b  06 02         asl $02
$00:c54d  83 00         sta $00,s
$00:c54f  4b            phk
$00:c550  02 96         cop #$96
$00:c552  02 81         cop #$81
$00:c554  19 02 02      ora $0202,y
$00:c557  83 82         sta $82,s
$00:c559  4d 00 02      eor $0200
$00:c55c  97 02         sta [$02],y
$00:c55e  9b            txy
$00:c55f  20 00 88      jsr $8800
$00:c562  c5 67         cmp $67
$00:c564  c5 88         cmp $88
$00:c566  c5 02         cmp $02
$00:c568  9a            txs
$00:c569  00 00         brk #$00
$00:c56b  71 c5         adc ($c5),y
$00:c56d  78            sei
$00:c56e  c5 78         cmp $78
$00:c570  c5 02         cmp $02
$00:c572  80 1b         bra $c58f
$00:c574  02 82         cop #$82
$00:c576  80 07         bra $c57f
$00:c578  02 80         cop #$80
$00:c57a  1c 02 82      trb $8202
$00:c57d  02 96         cop #$96
$00:c57f  02 81         cop #$81
$00:c581  17 2a         ora [$2a],y
$00:c583  02 83         cop #$83
$00:c585  02 86         cop #$86
$00:c587  6b            rtl
$00:c588  02 9a         cop #$9a
$00:c58a  18            clc
$00:c58b  00 a0         brk #$a0
$00:c58d  c5 92         cmp $92
$00:c58f  c5 a0         cmp $a0
$00:c591  c5 02         cmp $02
$00:c593  80 1a         bra $c5af
$00:c595  02 82         cop #$82
$00:c597  02 81         cop #$81
$00:c599  18            clc
$00:c59a  0a            asl a
$00:c59b  02 83         cop #$83
$00:c59d  02 86         cop #$86
$00:c59f  6b            rtl
$00:c5a0  02 80         cop #$80
$00:c5a2  19 02 82      ora $8202,y
$00:c5a5  82 b5 ff      brl $c55d
$00:c5a8  02 96         cop #$96
$00:c5aa  02 9b         cop #$9b
$00:c5ac  20 00 d5      jsr $d500
$00:c5af  c5 b4         cmp $b4
$00:c5b1  c5 d5         cmp $d5
$00:c5b3  c5 02         cmp $02
$00:c5b5  9a            txs
$00:c5b6  00 00         brk #$00
$00:c5b8  be c5 c7      ldx $c7c5,y
$00:c5bb  c5 c7         cmp $c7
$00:c5bd  c5 02         cmp $02
$00:c5bf  80 1c         bra $c5dd
$00:c5c1  02 82         cop #$82
$00:c5c3  02 97         cop #$97
$00:c5c5  80 05         bra $c5cc
$00:c5c7  02 80         cop #$80
$00:c5c9  1b            tcs
$00:c5ca  02 82         cop #$82
$00:c5cc  02 81         cop #$81
$00:c5ce  17 2a         ora [$2a],y
$00:c5d0  02 83         cop #$83
$00:c5d2  02 86         cop #$86
$00:c5d4  6b            rtl
$00:c5d5  02 9a         cop #$9a
$00:c5d7  18            clc
$00:c5d8  00 ed         brk #$ed
$00:c5da  c5 df         cmp $df
$00:c5dc  c5 ed         cmp $ed
$00:c5de  c5 02         cmp $02
$00:c5e0  80 1a         bra $c5fc
$00:c5e2  02 82         cop #$82
$00:c5e4  02 81         cop #$81
$00:c5e6  18            clc
$00:c5e7  0a            asl a
$00:c5e8  02 83         cop #$83
$00:c5ea  02 86         cop #$86
$00:c5ec  6b            rtl
$00:c5ed  02 80         cop #$80
$00:c5ef  19 02 82      ora $8202,y
$00:c5f2  82 b5 ff      brl $c5aa
$00:c5f5  02 03         cop #$03
$00:c5f7  10 02         bpl $c5fb
$00:c5f9  b0 17         bcs $c612
$00:c5fb  c6 00         dec $00
$00:c5fd  00 03         brk #$03
$00:c5ff  02 1b         cop #$1b
$00:c601  05 c6         ora $c6
$00:c603  02 00         cop #$00
$00:c605  02 b0         cop #$b0
$00:c607  22 c6 00 00   jsl $0000c6
$00:c60b  03 02         ora $02,s
$00:c60d  1b            tcs
$00:c60e  12 c6         ora ($c6)
$00:c610  02 00         cop #$00
$00:c612  02 04         cop #$04
$00:c614  02 86         cop #$86
$00:c616  6b            rtl
$00:c617  20 2d c6      jsr $c62d
$00:c61a  02 80         cop #$80
$00:c61c  10 02         bpl $c620
$00:c61e  82 02 86      brl $4c23
$00:c621  6b            rtl
$00:c622  20 2d c6      jsr $c62d
$00:c625  02 80         cop #$80
$00:c627  11 02         ora ($02),y
$00:c629  82 02 86      brl $4c2e
$00:c62c  6b            rtl
$00:c62d  ac 9a 03      ldy $039a
$00:c630  02 1f         cop #$1f
$00:c632  02 35         cop #$35
$00:c634  20 ad 37      jsr $37ad
$00:c637  04 38         tsb $38
$00:c639  e9 08 00      sbc #$0008
$00:c63c  18            clc
$00:c63d  79 00 00      adc $0000,y
$00:c640  9d 00 00      sta $0000,x
$00:c643  02 1f         cop #$1f
$00:c645  02 35         cop #$35
$00:c647  10 ad         bpl $c5f6
$00:c649  37 04         and [$04],y
$00:c64b  38            sec
$00:c64c  e9 0c 00      sbc #$000c
$00:c64f  18            clc
$00:c650  79 02 00      adc $0002,y
$00:c653  9d 02 00      sta $0002,x
$00:c656  02 a3         cop #$a3
$00:c658  60            rts
$00:c659  9c b2 03      stz $03b2
$00:c65c  ee 58 04      inc $0458
$00:c65f  8e 9a 03      stx $039a
$00:c662  bd 1a 00      lda $001a,x
$00:c665  09 00 04      ora #$0400
$00:c668  9d 1a 00      sta $001a,x
$00:c66b  02 85         cop #$85
$00:c66d  88            dey
$00:c66e  b1 00         lda ($00),y
$00:c670  a9 03 00      lda #$0003
$00:c673  99 30 00      sta $0030,y
$00:c676  82 04 01      brl $c77d
$00:c679  bd 25 00      lda $0025,x
$00:c67c  29 ff 00      and #$00ff
$00:c67f  dd 30 00      cmp $0030,x
$00:c682  f0 04         beq $c688
$00:c684  02 09         cop #$09
$00:c686  00 80         brk #$80
$00:c688  02 0c         cop #$0c
$00:c68a  00 02         brk #$02
$00:c68c  a8            tay
$00:c68d  c6 02         dec $02
$00:c68f  9a            txs
$00:c690  28            plp
$00:c691  00 98         brk #$98
$00:c693  c6 7d         dec $7d
$00:c695  c7 a0         cmp [$a0]
$00:c697  c6 02         dec $02
$00:c699  80 10         bra $c6ab
$00:c69b  02 82         cop #$82
$00:c69d  82 6b 01      brl $c80b
$00:c6a0  02 80         cop #$80
$00:c6a2  0d 02 82      ora $8202
$00:c6a5  82 9a 01      brl $c842
$00:c6a8  02 07         cop #$07
$00:c6aa  01 80         ora ($80,x)
$00:c6ac  79 c8 02      adc $02c8,y
$00:c6af  80 10         bra $c6c1
$00:c6b1  02 82         cop #$82
$00:c6b3  02 80         cop #$80
$00:c6b5  11 02         ora ($02),y
$00:c6b7  82 02 09      brl $cfbc
$00:c6ba  01 80         ora ($80,x)
$00:c6bc  82 42 03      brl $ca01
$00:c6bf  bd 25 00      lda $0025,x
$00:c6c2  29 ff 00      and #$00ff
$00:c6c5  dd 30 00      cmp $0030,x
$00:c6c8  f0 04         beq $c6ce
$00:c6ca  02 09         cop #$09
$00:c6cc  00 80         brk #$80
$00:c6ce  02 0c         cop #$0c
$00:c6d0  00 02         brk #$02
$00:c6d2  ee c6 02      inc $02c6
$00:c6d5  9b            txy
$00:c6d6  28            plp
$00:c6d7  00 de         brk #$de
$00:c6d9  c6 0b         dec $0b
$00:c6db  c8            iny
$00:c6dc  e6 c6         inc $c6
$00:c6de  02 80         cop #$80
$00:c6e0  0c 02 82      tsb $8202
$00:c6e3  82 97 00      brl $c77d
$00:c6e6  02 80         cop #$80
$00:c6e8  11 02         ora ($02),y
$00:c6ea  82 82 d6      brl $9d6f
$00:c6ed  00 02         brk #$02
$00:c6ef  07 01         ora [$01]
$00:c6f1  80 db         bra $c6ce
$00:c6f3  c8            iny
$00:c6f4  02 80         cop #$80
$00:c6f6  11 02         ora ($02),y
$00:c6f8  82 02 09      brl $cffd
$00:c6fb  01 80         ora ($80,x)
$00:c6fd  82 01 03      brl $ca01
$00:c700  bd 25 00      lda $0025,x
$00:c703  29 ff 00      and #$00ff
$00:c706  dd 30 00      cmp $0030,x
$00:c709  f0 04         beq $c70f
$00:c70b  02 09         cop #$09
$00:c70d  00 80         brk #$80
$00:c70f  02 0c         cop #$0c
$00:c711  00 02         brk #$02
$00:c713  2f c7 02 9b   and $9b02c7
$00:c717  28            plp
$00:c718  00 1f         brk #$1f
$00:c71a  c7 42         cmp [$42]
$00:c71c  c8            iny
$00:c71d  27 c7         and [$c7]
$00:c71f  02 80         cop #$80
$00:c721  0f 02 82 82   ora $828202
$00:c725  56 00         lsr $00,x
$00:c727  02 80         cop #$80
$00:c729  12 02         ora ($02)
$00:c72b  82 82 95      brl $5cb0
$00:c72e  00 02         brk #$02
$00:c730  07 01         ora [$01]
$00:c732  80 3d         bra $c771
$00:c734  c9 02 80      cmp #$8002
$00:c737  12 02         ora ($02)
$00:c739  82 02 09      brl $d03e
$00:c73c  01 80         ora ($80,x)
$00:c73e  82 c0 02      brl $ca01
$00:c741  bd 25 00      lda $0025,x
$00:c744  29 ff 00      and #$00ff
$00:c747  dd 30 00      cmp $0030,x
$00:c74a  f0 04         beq $c750
$00:c74c  02 09         cop #$09
$00:c74e  00 80         brk #$80
$00:c750  02 0c         cop #$0c
$00:c752  00 02         brk #$02
$00:c754  70 c7         bvs $c71d
$00:c756  02 9a         cop #$9a
$00:c758  28            plp
$00:c759  00 60         brk #$60
$00:c75b  c7 c4         cmp [$c4]
$00:c75d  c7 68         cmp [$68]
$00:c75f  c7 02         cmp [$02]
$00:c761  80 13         bra $c776
$00:c763  02 82         cop #$82
$00:c765  82 a3 00      brl $c80b
$00:c768  02 80         cop #$80
$00:c76a  0e 02 82      asl $8202
$00:c76d  82 d2 00      brl $c842
$00:c770  02 07         cop #$07
$00:c772  01 80         ora ($80,x)
$00:c774  9f c9 02 09   sta $0902c9,x
$00:c778  01 80         ora ($80,x)
$00:c77a  82 84 02      brl $ca01
$00:c77d  bd 02 00      lda $0002,x
$00:c780  c9 a0 00      cmp #$00a0
$00:c783  f0 18         beq $c79d
$00:c785  02 07         cop #$07
$00:c787  00 80         brk #$80
$00:c789  94 c7         sty $c7,x
$00:c78b  02 81         cop #$81
$00:c78d  0a            asl a
$00:c78e  04 02         tsb $02
$00:c790  83 82         sta $82,s
$00:c792  e5 fe         sbc $fe
$00:c794  02 81         cop #$81
$00:c796  0b            phd
$00:c797  04 02         tsb $02
$00:c799  83 82         sta $82,s
$00:c79b  dc fe 02      jml [$02fe]
$00:c79e  9a            txs
$00:c79f  20 00 a7      jsr $a700
$00:c7a2  c7 af         cmp [$af]
$00:c7a4  c7 bc         cmp [$bc]
$00:c7a6  c7 02         cmp [$02]
$00:c7a8  80 10         bra $c7ba
$00:c7aa  02 82         cop #$82
$00:c7ac  82 10 ff      brl $c6bf
$00:c7af  02 80         cop #$80
$00:c7b1  10 02         bpl $c7b5
$00:c7b3  82 02 80      brl $47b8
$00:c7b6  11 02         ora ($02),y
$00:c7b8  82 82 85      brl $4d3d
$00:c7bb  ff 02 80 0d   sbc $0d8002,x
$00:c7bf  02 82         cop #$82
$00:c7c1  82 3c ff      brl $c700
$00:c7c4  bd 02 00      lda $0002,x
$00:c7c7  c9 a0 01      cmp #$01a0
$00:c7ca  f0 18         beq $c7e4
$00:c7cc  02 07         cop #$07
$00:c7ce  00 80         brk #$80
$00:c7d0  db            stp
$00:c7d1  c7 02         cmp [$02]
$00:c7d3  81 08         sta ($08,x)
$00:c7d5  04 02         tsb $02
$00:c7d7  83 82         sta $82,s
$00:c7d9  66 ff         ror $ff
$00:c7db  02 81         cop #$81
$00:c7dd  09 04 02      ora #$0204
$00:c7e0  83 82         sta $82,s
$00:c7e2  5d ff 02      eor $02ff,x
$00:c7e5  9a            txs
$00:c7e6  20 00 ee      jsr $ee00
$00:c7e9  c7 f6         cmp [$f6]
$00:c7eb  c7 03         cmp [$03]
$00:c7ed  c8            iny
$00:c7ee  02 80         cop #$80
$00:c7f0  13 02         ora ($02,s),y
$00:c7f2  82 82 c9      brl $9177
$00:c7f5  fe 02 80      inc $8002,x
$00:c7f8  0e 02 82      asl $8202
$00:c7fb  02 80         cop #$80
$00:c7fd  0f 02 82 82   ora $828202
$00:c801  76 fe         ror $fe,x
$00:c803  02 80         cop #$80
$00:c805  0e 02 82      asl $8202
$00:c808  82 f5 fe      brl $c700
$00:c80b  02 07         cop #$07
$00:c80d  00 80         brk #$80
$00:c80f  21 c8         and ($c8,x)
$00:c811  bd 00 00      lda $0000,x
$00:c814  c9 70 00      cmp #$0070
$00:c817  f0 17         beq $c830
$00:c819  02 80         cop #$80
$00:c81b  06 02         asl $02
$00:c81d  82 82 9e      brl $66a2
$00:c820  fe bd 00      inc $00bd,x
$00:c823  00 c9         brk #$c9
$00:c825  70 00         bvs $c827
$00:c827  f0 07         beq $c830
$00:c829  02 80         cop #$80
$00:c82b  07 02         ora [$02]
$00:c82d  82 80 f1      brl $b9b0
$00:c830  bd 16 00      lda $0016,x
$00:c833  09 00 03      ora #$0300
$00:c836  9d 16 00      sta $0016,x
$00:c839  02 81         cop #$81
$00:c83b  07 04         ora [$04]
$00:c83d  02 83         cop #$83
$00:c83f  82 ef 01      brl $ca31
$00:c842  02 07         cop #$07
$00:c844  00 80         brk #$80
$00:c846  58            cli
$00:c847  c8            iny
$00:c848  bd 00 00      lda $0000,x
$00:c84b  c9 60 01      cmp #$0160
$00:c84e  f0 17         beq $c867
$00:c850  02 80         cop #$80
$00:c852  04 02         tsb $02
$00:c854  82 82 a8      brl $70d9
$00:c857  fe bd 00      inc $00bd,x
$00:c85a  00 c9         brk #$c9
$00:c85c  60            rts
$00:c85d  01 f0         ora ($f0,x)
$00:c85f  07 02         ora [$02]
$00:c861  80 05         bra $c868
$00:c863  02 82         cop #$82
$00:c865  80 f1         bra $c858
$00:c867  bd 16 00      lda $0016,x
$00:c86a  09 00 03      ora #$0300
$00:c86d  9d 16 00      sta $0016,x
$00:c870  02 81         cop #$81
$00:c872  05 04         ora $04
$00:c874  02 83         cop #$83
$00:c876  82 d3 01      brl $ca4c
$00:c879  02 80         cop #$80
$00:c87b  1a            inc a
$00:c87c  02 82         cop #$82
$00:c87e  02 b2         cop #$b2
$00:c880  ab            plb
$00:c881  cb            wai
$00:c882  00 08         brk #$08
$00:c884  00 e0         brk #$e0
$00:c886  ff 00 02 02   sbc $020200,x
$00:c88a  03 11         ora $11,s
$00:c88c  02 04         cop #$04
$00:c88e  02 9a         cop #$9a
$00:c890  20 00 98      jsr $9800
$00:c893  c8            iny
$00:c894  b0 c8         bcs $c85e
$00:c896  c3 c8         cmp $c8,s
$00:c898  02 80         cop #$80
$00:c89a  10 02         bpl $c89e
$00:c89c  82 02 80      brl $48a1
$00:c89f  19 02 82      ora $8202,y
$00:c8a2  02 b2         cop #$b2
$00:c8a4  c1 cb         cmp ($cb,x)
$00:c8a6  00 fe         brk #$fe
$00:c8a8  ff e0 ff 00   sbc $00ffe0,x
$00:c8ac  02 82         cop #$82
$00:c8ae  5b            tcd
$00:c8af  ff 02 80 1a   sbc $1a8002,x
$00:c8b3  02 82         cop #$82
$00:c8b5  02 b2         cop #$b2
$00:c8b7  ab            plb
$00:c8b8  cb            wai
$00:c8b9  00 08         brk #$08
$00:c8bb  00 e0         brk #$e0
$00:c8bd  ff 00 02 82   sbc $820200,x
$00:c8c1  ba            tsx
$00:c8c2  fe 02 80      inc $8002,x
$00:c8c5  0d 02 82      ora $8202
$00:c8c8  02 80         cop #$80
$00:c8ca  18            clc
$00:c8cb  02 82         cop #$82
$00:c8cd  02 b2         cop #$b2
$00:c8cf  b6 cb         ldx $cb,y
$00:c8d1  00 12         brk #$12
$00:c8d3  00 e0         brk #$e0
$00:c8d5  ff 00 02 82   sbc $820200,x
$00:c8d9  67 ff         adc [$ff]
$00:c8db  02 80         cop #$80
$00:c8dd  19 02 82      ora $8202,y
$00:c8e0  02 b2         cop #$b2
$00:c8e2  c1 cb         cmp ($cb,x)
$00:c8e4  00 fe         brk #$fe
$00:c8e6  ff e0 ff 00   sbc $00ffe0,x
$00:c8ea  02 02         cop #$02
$00:c8ec  03 11         ora $11,s
$00:c8ee  02 04         cop #$04
$00:c8f0  02 9b         cop #$9b
$00:c8f2  20 00 fa      jsr $fa00
$00:c8f5  c8            iny
$00:c8f6  12 c9         ora ($c9)
$00:c8f8  25 c9         and $c9
$00:c8fa  02 80         cop #$80
$00:c8fc  0c 02 82      tsb $8202
$00:c8ff  02 80         cop #$80
$00:c901  1a            inc a
$00:c902  02 82         cop #$82
$00:c904  02 b2         cop #$b2
$00:c906  ab            plb
$00:c907  cb            wai
$00:c908  00 08         brk #$08
$00:c90a  00 e0         brk #$e0
$00:c90c  ff 00 02 82   sbc $820200,x
$00:c910  6b            rtl
$00:c911  fe 02 80      inc $8002,x
$00:c914  19 02 82      ora $8202,y
$00:c917  02 b2         cop #$b2
$00:c919  c1 cb         cmp ($cb,x)
$00:c91b  00 fe         brk #$fe
$00:c91d  ff e0 ff 00   sbc $00ffe0,x
$00:c921  02 82         cop #$82
$00:c923  e6 fe         inc $fe
$00:c925  02 80         cop #$80
$00:c927  12 02         ora ($02)
$00:c929  82 02 80      brl $492e
$00:c92c  1b            tcs
$00:c92d  02 82         cop #$82
$00:c92f  02 b2         cop #$b2
$00:c931  cc cb 00      cpy $00cb
$00:c934  08            php
$00:c935  00 e2         brk #$e2
$00:c937  ff 00 02 82   sbc $820200,x
$00:c93b  87 fe         sta [$fe]
$00:c93d  02 80         cop #$80
$00:c93f  18            clc
$00:c940  02 82         cop #$82
$00:c942  02 b2         cop #$b2
$00:c944  b6 cb         ldx $cb,y
$00:c946  00 12         brk #$12
$00:c948  00 e0         brk #$e0
$00:c94a  ff 00 02 02   sbc $020200,x
$00:c94e  03 11         ora $11,s
$00:c950  02 04         cop #$04
$00:c952  02 9b         cop #$9b
$00:c954  20 00 5c      jsr $5c00
$00:c957  c9 74 c9      cmp #$c974
$00:c95a  87 c9         sta [$c9]
$00:c95c  02 80         cop #$80
$00:c95e  0f 02 82 02   ora $028202
$00:c962  80 1a         bra $c97e
$00:c964  02 82         cop #$82
$00:c966  02 b2         cop #$b2
$00:c968  ab            plb
$00:c969  cb            wai
$00:c96a  00 08         brk #$08
$00:c96c  00 e0         brk #$e0
$00:c96e  ff 00 02 82   sbc $820200,x
$00:c972  09 fe 02      ora #$02fe
$00:c975  80 18         bra $c98f
$00:c977  02 82         cop #$82
$00:c979  02 b2         cop #$b2
$00:c97b  b6 cb         ldx $cb,y
$00:c97d  00 12         brk #$12
$00:c97f  00 e0         brk #$e0
$00:c981  ff 00 02 82   sbc $820200,x
$00:c985  bb            tyx
$00:c986  fe 02 80      inc $8002,x
$00:c989  12 02         ora ($02)
$00:c98b  82 02 80      brl $4990
$00:c98e  1b            tcs
$00:c98f  02 82         cop #$82
$00:c991  02 b2         cop #$b2
$00:c993  cc cb 00      cpy $00cb
$00:c996  08            php
$00:c997  00 e2         brk #$e2
$00:c999  ff 00 02 82   sbc $820200,x
$00:c99d  25 fe         and $fe
$00:c99f  02 80         cop #$80
$00:c9a1  1b            tcs
$00:c9a2  02 82         cop #$82
$00:c9a4  02 b2         cop #$b2
$00:c9a6  cc cb 00      cpy $00cb
$00:c9a9  08            php
$00:c9aa  00 e2         brk #$e2
$00:c9ac  ff 00 02 02   sbc $020200,x
$00:c9b0  03 11         ora $11,s
$00:c9b2  02 04         cop #$04
$00:c9b4  02 9a         cop #$9a
$00:c9b6  20 00 be      jsr $be00
$00:c9b9  c9 d6 c9      cmp #$c9d6
$00:c9bc  e9 c9 02      sbc #$02c9
$00:c9bf  80 13         bra $c9d4
$00:c9c1  02 82         cop #$82
$00:c9c3  02 80         cop #$80
$00:c9c5  19 02 82      ora $8202,y
$00:c9c8  02 b2         cop #$b2
$00:c9ca  c1 cb         cmp ($cb,x)
$00:c9cc  00 fe         brk #$fe
$00:c9ce  ff e0 ff 00   sbc $00ffe0,x
$00:c9d2  02 82         cop #$82
$00:c9d4  35 fe         and $fe,x
$00:c9d6  02 80         cop #$80
$00:c9d8  1b            tcs
$00:c9d9  02 82         cop #$82
$00:c9db  02 b2         cop #$b2
$00:c9dd  cc cb 00      cpy $00cb
$00:c9e0  08            php
$00:c9e1  00 e2         brk #$e2
$00:c9e3  ff 00 02 82   sbc $820200,x
$00:c9e7  db            stp
$00:c9e8  fd 02 80      sbc $8002,x
$00:c9eb  0e 02 82      asl $8202
$00:c9ee  02 80         cop #$80
$00:c9f0  18            clc
$00:c9f1  02 82         cop #$82
$00:c9f3  02 b2         cop #$b2
$00:c9f5  b6 cb         ldx $cb,y
$00:c9f7  00 12         brk #$12
$00:c9f9  00 e0         brk #$e0
$00:c9fb  ff 00 02 82   sbc $820200,x
$00:c9ff  41 fe         eor ($fe,x)
$00:ca01  bd 16 00      lda $0016,x
$00:ca04  09 00 02      ora #$0200
$00:ca07  9d 16 00      sta $0016,x
$00:ca0a  02 80         cop #$80
$00:ca0c  16 02         asl $02,x
$00:ca0e  82 02 b2      brl $7c13
$00:ca11  1c cb 00      trb $00cb
$00:ca14  00 00         brk #$00
$00:ca16  f0 ff         beq $ca17
$00:ca18  00 02         brk #$02
$00:ca1a  02 80         cop #$80
$00:ca1c  17 02         ora [$02],y
$00:ca1e  82 02 81      brl $4b23
$00:ca21  14 02         trb $02
$00:ca23  02 83         cop #$83
$00:ca25  bd 16 00      lda $0016,x
$00:ca28  29 ff fd      and #$fdff
$00:ca2b  9d 16 00      sta $0016,x
$00:ca2e  82 10 fd      brl $c741
$00:ca31  02 80         cop #$80
$00:ca33  11 02         ora ($02),y
$00:ca35  82 00 5f      brl $2938
$00:ca38  02 81         cop #$81
$00:ca3a  22 10 02 83   jsl $830210
$00:ca3e  02 81         cop #$81
$00:ca40  23 08         and $08,s
$00:ca42  02 83         cop #$83
$00:ca44  02 03         cop #$03
$00:ca46  3d 02 04      and $0402,x
$00:ca49  82 1b 00      brl $ca67
$00:ca4c  02 80         cop #$80
$00:ca4e  12 02         ora ($02)
$00:ca50  82 00 5f      brl $2953
$00:ca53  02 81         cop #$81
$00:ca55  22 10 02 83   jsl $830210
$00:ca59  02 81         cop #$81
$00:ca5b  23 08         and $08,s
$00:ca5d  02 83         cop #$83
$00:ca5f  02 03         cop #$03
$00:ca61  3d 02 04      and $0402,x
$00:ca64  82 42 00      brl $caa9
$00:ca67  20 eb ca      jsr $caeb
$00:ca6a  9d 02 00      sta $0002,x
$00:ca6d  a9 30 00      lda #$0030
$00:ca70  9d 00 00      sta $0000,x
$00:ca73  00 5f         brk #$5f
$00:ca75  02 81         cop #$81
$00:ca77  23 08         and $08,s
$00:ca79  02 83         cop #$83
$00:ca7b  02 81         cop #$81
$00:ca7d  22 10 02 83   jsl $830210
$00:ca81  bd 25 00      lda $0025,x
$00:ca84  29 ff 00      and #$00ff
$00:ca87  9d 30 00      sta $0030,x
$00:ca8a  02 09         cop #$09
$00:ca8c  00 00         brk #$00
$00:ca8e  02 09         cop #$09
$00:ca90  01 00         ora ($00,x)
$00:ca92  bd 16 00      lda $0016,x
$00:ca95  29 ff fc      and #$fcff
$00:ca98  9d 16 00      sta $0016,x
$00:ca9b  02 80         cop #$80
$00:ca9d  0e 02 82      asl $8202
$00:caa0  02 81         cop #$81
$00:caa2  04 04         tsb $04
$00:caa4  02 83         cop #$83
$00:caa6  82 57 fc      brl $c700
$00:caa9  20 eb ca      jsr $caeb
$00:caac  9d 02 00      sta $0002,x
$00:caaf  a9 a0 01      lda #$01a0
$00:cab2  9d 00 00      sta $0000,x
$00:cab5  00 5f         brk #$5f
$00:cab7  02 81         cop #$81
$00:cab9  23 08         and $08,s
$00:cabb  02 83         cop #$83
$00:cabd  02 81         cop #$81
$00:cabf  22 10 02 83   jsl $830210
$00:cac3  bd 25 00      lda $0025,x
$00:cac6  29 ff 00      and #$00ff
$00:cac9  9d 30 00      sta $0030,x
$00:cacc  02 09         cop #$09
$00:cace  00 00         brk #$00
$00:cad0  02 09         cop #$09
$00:cad2  01 00         ora ($00,x)
$00:cad4  bd 16 00      lda $0016,x
$00:cad7  29 ff fc      and #$fcff
$00:cada  9d 16 00      sta $0016,x
$00:cadd  02 80         cop #$80
$00:cadf  13 02         ora ($02,s),y
$00:cae1  82 02 81      brl $4be6
$00:cae4  06 04         asl $04
$00:cae6  02 83         cop #$83
$00:cae8  82 d4 fb      brl $c6bf
$00:caeb  02 1f         cop #$1f
$00:caed  ad 02 03      lda $0302
$00:caf0  29 ff 00      and #$00ff
$00:caf3  a0 a0 00      ldy #$00a0
$00:caf6  38            sec
$00:caf7  e9 33 00      sbc #$0033
$00:cafa  30 1e         bmi $cb1a
$00:cafc  a0 e0 00      ldy #$00e0
$00:caff  38            sec
$00:cb00  e9 33 00      sbc #$0033
$00:cb03  30 15         bmi $cb1a
$00:cb05  a0 20 01      ldy #$0120
$00:cb08  38            sec
$00:cb09  e9 33 00      sbc #$0033
$00:cb0c  30 0c         bmi $cb1a
$00:cb0e  a0 60 01      ldy #$0160
$00:cb11  38            sec
$00:cb12  e9 33 00      sbc #$0033
$00:cb15  30 03         bmi $cb1a
$00:cb17  a0 a0 01      ldy #$01a0
$00:cb1a  98            tya
$00:cb1b  60            rts
$00:cb1c  02 a3         cop #$a3
$00:cb1e  02 80         cop #$80
$00:cb20  20 02 82      jsr $8202  ; -> Sub_00_8202
$00:cb23  02 b2         cop #$b2
$00:cb25  36 cb         rol $cb,x
$00:cb27  00 08         brk #$08
$00:cb29  00 f8         brk #$f8
$00:cb2b  ff 00 03 02   sbc $020300,x
$00:cb2f  80 21         bra $cb52
$00:cb31  02 82         cop #$82
$00:cb33  02 86         cop #$86
$00:cb35  6b            rtl
$00:cb36  00 61         brk #$61
$00:cb38  02 80         cop #$80
$00:cb3a  1c 02 82      trb $8202
$00:cb3d  02 80         cop #$80
$00:cb3f  1d 02 82      ora $8202,x
$00:cb42  bd 02 00      lda $0002,x
$00:cb45  10 f6         bpl $cb3d
$00:cb47  02 80         cop #$80
$00:cb49  1d 02 82      ora $8202,x
$00:cb4c  02 03         cop #$03
$00:cb4e  0c 00 52      tsb $5200
$00:cb51  02 b0         cop #$b0
$00:cb53  63 cb         adc $cb,s
$00:cb55  00 00         brk #$00
$00:cb57  03 02         ora $02,s
$00:cb59  1b            tcs
$00:cb5a  5e cb 0c      lsr $0ccb,x
$00:cb5d  00 02         brk #$02
$00:cb5f  04 02         tsb $02
$00:cb61  86 6b         stx $6b
$00:cb63  02 1f         cop #$1f
$00:cb65  ad 02 03      lda $0302
$00:cb68  29 7f 00      and #$007f
$00:cb6b  38            sec
$00:cb6c  e9 40 00      sbc #$0040
$00:cb6f  18            clc
$00:cb70  6d 74 03      adc $0374
$00:cb73  9d 00 00      sta $0000,x
$00:cb76  02 1f         cop #$1f
$00:cb78  ad 02 03      lda $0302
$00:cb7b  29 7f 00      and #$007f
$00:cb7e  38            sec
$00:cb7f  e9 40 00      sbc #$0040
$00:cb82  18            clc
$00:cb83  6d 76 03      adc $0376
$00:cb86  38            sec
$00:cb87  e9 ff 00      sbc #$00ff
$00:cb8a  9d 02 00      sta $0002,x
$00:cb8d  02 81         cop #$81
$00:cb8f  1e 10 02      asl $0210,x
$00:cb92  83 a9         sta $a9,s
$00:cb94  00 02         brk #$02
$00:cb96  9d 16 00      sta $0016,x
$00:cb99  00 5a         brk #$5a
$00:cb9b  02 a4         cop #$a4
$00:cb9d  02 a1         cop #$a1
$00:cb9f  f8            sed
$00:cba0  ff f8 ff 02   sbc $02fff8,x
$00:cba4  80 1f         bra $cbc5
$00:cba6  02 82         cop #$82
$00:cba8  02 86         cop #$86
$00:cbaa  6b            rtl
$00:cbab  00 5d         brk #$5d
$00:cbad  02 97         cop #$97
$00:cbaf  02 80         cop #$80
$00:cbb1  02 02         cop #$02
$00:cbb3  82 80 21      brl $ed36
$00:cbb6  00 5d         brk #$5d
$00:cbb8  02 96         cop #$96
$00:cbba  02 80         cop #$80
$00:cbbc  00 02         brk #$02
$00:cbbe  82 80 16      brl $e241
$00:cbc1  00 5d         brk #$5d
$00:cbc3  02 97         cop #$97
$00:cbc5  02 80         cop #$80
$00:cbc7  00 02         brk #$02
$00:cbc9  82 80 0b      brl $d74c
$00:cbcc  00 5d         brk #$5d
$00:cbce  02 a3         cop #$a3
$00:cbd0  02 97         cop #$97
$00:cbd2  02 80         cop #$80
$00:cbd4  01 02         ora ($02,x)
$00:cbd6  82 02 a3      brl $6edb
$00:cbd9  02 81         cop #$81
$00:cbdb  03 03         ora $03,s
$00:cbdd  02 83         cop #$83
$00:cbdf  a0 03 00      ldy #$0003
$00:cbe2  e2 20         sep #$20
$00:cbe4  a9 00         lda #$00
$00:cbe6  48            pha
$00:cbe7  c2 20         rep #$20
$00:cbe9  a9 66 ad      lda #$ad66
$00:cbec  48            pha
$00:cbed  6b            rtl
$00:cbee  ee 58 04      inc $0458
$00:cbf1  8e 9a 03      stx $039a
$00:cbf4  02 85         cop #$85
$00:cbf6  09 cd 00      ora #$00cd
$00:cbf9  02 80         cop #$80
$00:cbfb  08            php
$00:cbfc  02 82         cop #$82
$00:cbfe  02 9b         cop #$9b
$00:cc00  70 00         bvs $cc02
$00:cc02  08            php
$00:cc03  cc 08 cc      cpy $cc08
$00:cc06  0f cc 02 80   ora $8002cc
$00:cc0a  09 02 82      ora #$8202
$00:cc0d  80 ef         bra $cbfe
$00:cc0f  02 80         cop #$80
$00:cc11  0a            asl a
$00:cc12  02 82         cop #$82
$00:cc14  02 87         cop #$87
$00:cc16  02 80         cop #$80
$00:cc18  03 02         ora $02,s
$00:cc1a  82 02 80      brl $4c1f
$00:cc1d  04 02         tsb $02
$00:cc1f  82 02 81      brl $4d24
$00:cc22  00 02         brk #$02
$00:cc24  02 83         cop #$83
$00:cc26  02 1f         cop #$1f
$00:cc28  ad 02 03      lda $0302
$00:cc2b  29 07 00      and #$0007
$00:cc2e  c9 05 00      cmp #$0005
$00:cc31  b0 1a         bcs $cc4d
$00:cc33  02 80         cop #$80
$00:cc35  0e 02 82      asl $8202
$00:cc38  00 56         brk #$56
$00:cc3a  02 81         cop #$81
$00:cc3c  0f 0d 02 83   ora $83020d
$00:cc40  02 80         cop #$80
$00:cc42  10 02         bpl $cc46
$00:cc44  82 02 80      brl $4c49
$00:cc47  02 02         cop #$02
$00:cc49  82 82 ac      brl $78ce
$00:cc4c  ff 02 80 01   sbc $018002,x
$00:cc50  02 82         cop #$82
$00:cc52  02 80         cop #$80
$00:cc54  1b            tcs
$00:cc55  02 82         cop #$82
$00:cc57  bd 00 00      lda $0000,x
$00:cc5a  c9 f0 00      cmp #$00f0
$00:cc5d  f0 41         beq $cca0
$00:cc5f  c9 e0 01      cmp #$01e0
$00:cc62  f0 3c         beq $cca0
$00:cc64  02 9a         cop #$9a
$00:cc66  18            clc
$00:cc67  00 6e         brk #$6e
$00:cc69  cc 75 cc      cpy $cc75
$00:cc6c  6e cc 02      ror $02cc
$00:cc6f  80 1b         bra $cc8c
$00:cc71  02 82         cop #$82
$00:cc73  80 e2         bra $cc57
$00:cc75  02 80         cop #$80
$00:cc77  04 02         tsb $02
$00:cc79  82 02 b2      brl $7e7e
$00:cc7c  aa            tax
$00:cc7d  cc 00 08      cpy $0800
$00:cc80  00 08         brk #$08
$00:cc82  00 00         brk #$00
$00:cc84  02 02         cop #$02
$00:cc86  80 00         bra $cc88
$00:cc88  02 82         cop #$82
$00:cc8a  80 e2         bra $cc6e
$00:cc8c  bd 00 00      lda $0000,x
$00:cc8f  c9 f0 00      cmp #$00f0
$00:cc92  f0 0c         beq $cca0
$00:cc94  c9 e0 01      cmp #$01e0
$00:cc97  f0 07         beq $cca0
$00:cc99  02 80         cop #$80
$00:cc9b  1b            tcs
$00:cc9c  02 82         cop #$82
$00:cc9e  80 ec         bra $cc8c
$00:cca0  02 80         cop #$80
$00:cca2  04 02         tsb $02
$00:cca4  82 02 87      brl $53a9
$00:cca7  82 76 ff      brl $cc20
$00:ccaa  02 80         cop #$80
$00:ccac  18            clc
$00:ccad  02 82         cop #$82
$00:ccaf  02 80         cop #$80
$00:ccb1  19 02 82      ora $8202,y
$00:ccb4  02 80         cop #$80
$00:ccb6  1a            inc a
$00:ccb7  02 82         cop #$82
$00:ccb9  00 65         brk #$65
$00:ccbb  02 b0         cop #$b0
$00:ccbd  cf cc 00 00   cmp $0000cc
$00:ccc1  02 02         cop #$02
$00:ccc3  80 19         bra $ccde
$00:ccc5  02 82         cop #$82
$00:ccc7  02 80         cop #$80
$00:ccc9  18            clc
$00:ccca  02 82         cop #$82
$00:cccc  02 86         cop #$86
$00:ccce  6b            rtl
$00:cccf  02 81         cop #$81
$00:ccd1  17 02         ora [$02],y
$00:ccd3  02 83         cop #$83
$00:ccd5  02 b0         cop #$b0
$00:ccd7  df cc 00 00   cmp $0000cc,x
$00:ccdb  02 02         cop #$02
$00:ccdd  86 6b         stx $6b
$00:ccdf  02 80         cop #$80
$00:cce1  16 02         asl $02,x
$00:cce3  82 02 9b      brl $67e8
$00:cce6  00 00         brk #$00
$00:cce8  ee cc f6      inc $f6cc
$00:cceb  cc f6 cc      cpy $ccf6
$00:ccee  bd 16 00      lda $0016,x
$00:ccf1  89 00 80      bit #$8000
$00:ccf4  d0 10         bne $cd06
$00:ccf6  02 b2         cop #$b2
$00:ccf8  df cc 00 00   cmp $0000cc,x
$00:ccfc  00 10         brk #$10
$00:ccfe  00 00         brk #$00
$00:cd00  02 02         cop #$02
$00:cd02  80 1c         bra $cd20
$00:cd04  02 82         cop #$82
$00:cd06  02 86         cop #$86
$00:cd08  6b            rtl
$00:cd09  ac 9a 03      ldy $039a
$00:cd0c  b9 25 00      lda $0025,y
$00:cd0f  29 ff 00      and #$00ff
$00:cd12  9d 30 00      sta $0030,x
$00:cd15  02 91         cop #$91
$00:cd17  ac 9a 03      ldy $039a
$00:cd1a  b9 16 00      lda $0016,y
$00:cd1d  89 00 04      bit #$0400
$00:cd20  d0 3a         bne $cd5c
$00:cd22  b9 25 00      lda $0025,y
$00:cd25  29 ff 00      and #$00ff
$00:cd28  dd 30 00      cmp $0030,x
$00:cd2b  d0 01         bne $cd2e
$00:cd2d  6b            rtl
$00:cd2e  b9 00 00      lda $0000,y
$00:cd31  9d 00 00      sta $0000,x
$00:cd34  b9 02 00      lda $0002,y
$00:cd37  38            sec
$00:cd38  e9 08 00      sbc #$0008
$00:cd3b  9d 02 00      sta $0002,x
$00:cd3e  02 b0         cop #$b0
$00:cd40  5f cd 00 00   eor $0000cd,x
$00:cd44  03 02         ora $02,s
$00:cd46  b0 5f         bcs $cda7
$00:cd48  cd 00 00      cmp $0000
$00:cd4b  03 02         ora $02,s
$00:cd4d  b0 6b         bcs $cdba
$00:cd4f  cd 00 00      cmp $0000
$00:cd52  03 02         ora $02,s
$00:cd54  b0 6b         bcs $cdc1
$00:cd56  cd 00 00      cmp $0000
$00:cd59  03 80         ora $80,s
$00:cd5b  ad 02 86      lda $8602
$00:cd5e  6b            rtl
$00:cd5f  20 77 cd      jsr $cd77
$00:cd62  02 81         cop #$81
$00:cd64  14 04         trb $04
$00:cd66  02 83         cop #$83
$00:cd68  02 86         cop #$86
$00:cd6a  6b            rtl
$00:cd6b  20 77 cd      jsr $cd77
$00:cd6e  02 81         cop #$81
$00:cd70  15 04         ora $04,x
$00:cd72  02 83         cop #$83
$00:cd74  02 86         cop #$86
$00:cd76  6b            rtl
$00:cd77  02 1f         cop #$1f
$00:cd79  02 35         cop #$35
$00:cd7b  30 ad         bmi $cd2a
$00:cd7d  37 04         and [$04],y
$00:cd7f  38            sec
$00:cd80  e9 10 00      sbc #$0010
$00:cd83  18            clc
$00:cd84  6d 00 00      adc $0000
$00:cd87  9d 00 00      sta $0000,x
$00:cd8a  60            rts
$00:cd8b  8e 9a 03      stx $039a
$00:cd8e  bd 1a 00      lda $001a,x
$00:cd91  09 00 02      ora #$0200
$00:cd94  9d 1a 00      sta $001a,x
$00:cd97  02 9f         cop #$9f
$00:cd99  08            php
$00:cd9a  00 02         brk #$02
$00:cd9c  91 ac         sta ($ac),y
$00:cd9e  9c 03 b9      stz $b903
$00:cda1  02 00         cop #$00
$00:cda3  c9 80 00      cmp #$0080
$00:cda6  90 01         bcc $cda9
$00:cda8  6b            rtl
$00:cda9  02 85         cop #$85
$00:cdab  88            dey
$00:cdac  b1 00         lda ($00),y
$00:cdae  a9 04 00      lda #$0004
$00:cdb1  99 30 00      sta $0030,y
$00:cdb4  02 1b         cop #$1b
$00:cdb6  ba            tsx
$00:cdb7  cd 04 00      cmp $0004
$00:cdba  a9 c0 2f      lda #$2fc0
$00:cdbd  0c 26 03      tsb $0326
$00:cdc0  00 a0         brk #$a0
$00:cdc2  02 80         cop #$80
$00:cdc4  01 02         ora ($02,x)
$00:cdc6  82 a9 00      brl $ce72
$00:cdc9  01 8d         ora ($8d,x)
$00:cdcb  44 03 02      mvp $02,$03
$00:cdce  01 f8         ora ($f8,x)
$00:cdd0  ce a9 c0      dec $c0a9
$00:cdd3  2f 1c 26 03   and $03261c
$00:cdd7  bd 16 00      lda $0016,x
$00:cdda  29 ff fd      and #$fdff
$00:cddd  9d 16 00      sta $0016,x
$00:cde0  02 32         cop #$32
$00:cde2  0d 80 5f      ora $5f80
$00:cde5  02 1f         cop #$1f
$00:cde7  02 35         cop #$35
$00:cde9  a0 ad 37      ldy #$37ad
$00:cdec  04 18         tsb $18
$00:cdee  69 28 00      adc #$0028
$00:cdf1  9d 00 00      sta $0000,x
$00:cdf4  a9 60 00      lda #$0060
$00:cdf7  9d 02 00      sta $0002,x
$00:cdfa  02 80         cop #$80
$00:cdfc  01 02         ora ($02,x)
$00:cdfe  82 bd 16      brl $e4be
$00:ce01  00 29         brk #$29
$00:ce03  ff fd 9d 16   sbc $169dfd,x
$00:ce07  00 02         brk #$02
$00:ce09  80 02         bra $ce0d
$00:ce0b  02 82         cop #$82
$00:ce0d  00 4b         brk #$4b
$00:ce0f  02 b2         cop #$b2
$00:ce11  4b            phk
$00:ce12  ce 00 00      dec $0000
$00:ce15  00 ee         brk #$ee
$00:ce17  ff 00 02 02   sbc $020200,x
$00:ce1b  b2 8a         lda ($8a)
$00:ce1d  ce 00 00      dec $0000
$00:ce20  00 ee         brk #$ee
$00:ce22  ff 00 02 02   sbc $020200,x
$00:ce26  b2 c9         lda ($c9)
$00:ce28  ce 00 00      dec $0000
$00:ce2b  00 ee         brk #$ee
$00:ce2d  ff 00 02 02   sbc $020200,x
$00:ce31  80 03         bra $ce36
$00:ce33  02 82         cop #$82
$00:ce35  02 1b         cop #$1b
$00:ce37  3b            tsc
$00:ce38  ce 50 00      dec $0050
$00:ce3b  bd 16 00      lda $0016,x
$00:ce3e  09 00 02      ora #$0200
$00:ce41  9d 16 00      sta $0016,x
$00:ce44  02 80         cop #$80
$00:ce46  04 02         tsb $02
$00:ce48  82 80 9a      brl $68cb
$00:ce4b  02 a3         cop #$a3
$00:ce4d  02 97         cop #$97
$00:ce4f  02 90         cop #$90
$00:ce51  02 88         cop #$88
$00:ce53  02 9a         cop #$9a
$00:ce55  20 00 5d      jsr $5d00
$00:ce58  ce 64 ce      dec $ce64
$00:ce5b  64 ce         stz $ce
$00:ce5d  02 80         cop #$80
$00:ce5f  0a            asl a
$00:ce60  02 82         cop #$82
$00:ce62  80 ef         bra $ce53
$00:ce64  02 80         cop #$80
$00:ce66  05 02         ora $02
$00:ce68  82 02 9b      brl $696d
$00:ce6b  20 00 73      jsr $7300
$00:ce6e  ce 7a ce      dec $ce7a
$00:ce71  73 ce         adc ($ce,s),y
$00:ce73  02 80         cop #$80
$00:ce75  09 02 82      ora #$8202
$00:ce78  80 ef         bra $ce69
$00:ce7a  02 96         cop #$96
$00:ce7c  02 80         cop #$80
$00:ce7e  06 02         asl $02
$00:ce80  82 02 81      brl $4f85
$00:ce83  0a            asl a
$00:ce84  10 02         bpl $ce88
$00:ce86  83 02         sta $02,s
$00:ce88  86 6b         stx $6b
$00:ce8a  02 a3         cop #$a3
$00:ce8c  02 96         cop #$96
$00:ce8e  02 90         cop #$90
$00:ce90  02 88         cop #$88
$00:ce92  02 9a         cop #$9a
$00:ce94  20 00 a3      jsr $a300
$00:ce97  ce a3 ce      dec $cea3
$00:ce9a  9c ce 02      stz $02ce
$00:ce9d  80 0a         bra $cea9
$00:ce9f  02 82         cop #$82
$00:cea1  80 ef         bra $ce92
$00:cea3  02 80         cop #$80
$00:cea5  05 02         ora $02
$00:cea7  82 02 9b      brl $69ac
$00:ceaa  20 00 b2      jsr $b200
$00:cead  ce b9 ce      dec $ceb9
$00:ceb0  b2 ce         lda ($ce)
$00:ceb2  02 80         cop #$80
$00:ceb4  09 02 82      ora #$8202
$00:ceb7  80 ef         bra $cea8
$00:ceb9  02 97         cop #$97
$00:cebb  02 80         cop #$80
$00:cebd  06 02         asl $02
$00:cebf  82 02 81      brl $4fc4
$00:cec2  0a            asl a
$00:cec3  10 02         bpl $cec7
$00:cec5  83 02         sta $02,s
$00:cec7  86 6b         stx $6b
$00:cec9  02 a3         cop #$a3
$00:cecb  02 97         cop #$97
$00:cecd  02 9b         cop #$9b
$00:cecf  20 00 de      jsr $de00
$00:ced2  ce de ce      dec $cede
$00:ced5  d7 ce         cmp [$ce],y
$00:ced7  02 80         cop #$80
$00:ced9  08            php
$00:ceda  02 82         cop #$82
$00:cedc  80 ef         bra $cecd
$00:cede  02 9a         cop #$9a
$00:cee0  00 00         brk #$00
$00:cee2  ea            nop
$00:cee3  ce ea ce      dec $ceea
$00:cee6  e8            inx
$00:cee7  ce 02 96      dec $9602
$00:ceea  02 80         cop #$80
$00:ceec  07 02         ora [$02]
$00:ceee  82 02 81      brl $4ff3
$00:cef1  0b            phd
$00:cef2  08            php
$00:cef3  02 83         cop #$83
$00:cef5  02 86         cop #$86
$00:cef7  6b            rtl
$00:cef8  10 91         bpl $ce8b
$00:cefa  70 6f         bvs $cf6b
$00:cefc  6f 72 20 63   adc $632072
$00:cf00  72 65         adc ($65)
$00:cf02  61 74         adc ($74,x)
$00:cf04  75 72         adc $72,x
$00:cf06  65 20         adc $20
$00:cf08  74 68         stz $68,x
$00:cf0a  61 74         adc ($74,x)
$00:cf0c  0d 72 65      ora $6572
$00:cf0f  70 65         bvs $cf76
$00:cf11  61 74         adc ($74,x)
$00:cf13  73 20         adc ($20,s),y
$00:cf15  74 72         stz $72,x
$00:cf17  61 6e         adc ($6e,x)
$00:cf19  73 6d         adc ($6d,s),y
$00:cf1b  69 67 72      adc #$7267
$00:cf1e  61 74         adc ($74,x)
$00:cf20  69 6f 6e      adc #$6e6f
$00:cf23  0d cb e1      ora $e1cb
$00:cf26  dd 96 63      cmp $6396,x
$00:cf29  61 6e         adc ($6e,x)
$00:cf2b  6e 6f 74      ror $746f
$00:cf2e  0d 64 69      ora $6964
$00:cf31  65 2e         adc $2e
$00:cf33  20 11 88      jsr $8811  ; -> Sub_00_8811
$00:cf36  f1 d0         sbc ($d0),y
$00:cf38  fe bb 0d      inc $0dbb,x
$00:cf3b  97 64         sta [$64],y
$00:cf3d  65 65         adc $65
$00:cf3f  70 20         bvs $cf61
$00:cf41  73 6c         adc ($6c,s),y
$00:cf43  65 65         adc $65
$00:cf45  70 2e         bvs $cf75
$00:cf47  20 12 08      jsr $0812
$00:cf4a  08            php
$00:cf4b  04 0c         tsb $0c
$00:cf4d  ac 9a 03      ldy $039a
$00:cf50  b9 16 00      lda $0016,y
$00:cf53  89 00 04      bit #$0400
$00:cf56  d0 01         bne $cf59
$00:cf58  6b            rtl
$00:cf59  8e 9a 03      stx $039a
$00:cf5c  b9 00 00      lda $0000,y
$00:cf5f  9d 00 00      sta $0000,x
$00:cf62  b9 02 00      lda $0002,y
$00:cf65  9d 02 00      sta $0002,x
$00:cf68  02 1b         cop #$1b
$00:cf6a  6e cf b4      ror $b4cf
$00:cf6d  00 bd         brk #$bd
$00:cf6f  16 00         asl $00,x
$00:cf71  29 ff df      and #$dfff
$00:cf74  9d 16 00      sta $0016,x
$00:cf77  02 85         cop #$85
$00:cf79  9e cf 00      stz $00cf,x
$00:cf7c  02 80         cop #$80
$00:cf7e  1f 02 82 02   ora $028202,x
$00:cf82  08            php
$00:cf83  00 80         brk #$80
$00:cf85  7c cf 02      jmp ($02cf,x)
$00:cf88  85 a9         sta $a9
$00:cf8a  cf 00 02 81   cmp $810200
$00:cf8e  1f 03 02 83   ora $830203,x
$00:cf92  02 10         cop #$10
$00:cf94  15 02         ora $02,x
$00:cf96  01 78         ora ($78,x)
$00:cf98  00 c8         brk #$c8
$00:cf9a  00 02         brk #$02
$00:cf9c  91 6b         sta ($6b),y
$00:cf9e  02 01         cop #$01
$00:cfa0  b6 cf         ldx $cf,y
$00:cfa2  02 09         cop #$09
$00:cfa4  00 80         brk #$80
$00:cfa6  02 86         cop #$86
$00:cfa8  6b            rtl
$00:cfa9  02 a8         cop #$a8
$00:cfab  00 80         brk #$80
$00:cfad  0d 02 92      ora $9202
$00:cfb0  48            pha
$00:cfb1  02 94         cop #$94
$00:cfb3  02 86         cop #$86
$00:cfb5  6b            rtl
$00:cfb6  10 53         bpl $d00b
$00:cfb8  6f 6d 65 20   adc $20656d
$00:cfbc  cf a5 0d 62   cmp $620da5
$00:cfc0  65 69         adc $69
$00:cfc2  6e 67 20      ror $2067
$00:cfc5  63 6f         adc $6f,s
$00:cfc7  6e 73 74      ror $7473
$00:cfca  61 6e         adc ($6e,x)
$00:cfcc  74 6c         stz $6c,x
$00:cfce  79 20 0d      adc $0d20,y
$00:cfd1  72 65         adc ($65)
$00:cfd3  69 6e 63      adc #$636e
$00:cfd6  61 72         adc ($72,x)
$00:cfd8  6e 61 74      ror $7461
$00:cfdb  65 64         adc $64
$00:cfdd  20 6d 65      jsr $656d  ; -> Sub_00_656d
$00:cfe0  61 6e         adc ($6e,x)
$00:cfe2  73 20         adc ($20,s),y
$00:cfe4  0d 65 76      ora $7665
$00:cfe7  65 72         adc $72
$00:cfe9  6c 61 73      jmp ($7361)
$00:cfec  74 69         stz $69,x
$00:cfee  6e 67 20      ror $2067
$00:cff1  73 75         adc ($75,s),y
$00:cff3  66 66         ror $66
$00:cff5  65 72         adc $72
$00:cff7  69 6e 67      adc #$676e
$00:cffa  2e 11 42      rol $4211
$00:cffd  65 69         adc $69
$00:cfff  6e 67 20      ror $2067
$00:d002  61 6c         adc ($6c,x)
$00:d004  69 76 65      adc #$6576
$00:d007  20 ba 0d      jsr $0dba  ; -> Sub_00_0dba
$00:d00a  73 75         adc ($75,s),y
$00:d00c  66 66         ror $66
$00:d00e  65 72         adc $72
$00:d010  69 6e 67      adc #$676e
$00:d013  20 ae 73      jsr $73ae
$00:d016  6f 6d 65 20   adc $20656d
$00:d01a  0d 63 72      ora $7263
$00:d01d  65 61         adc $61
$00:d01f  74 75         stz $75,x
$00:d021  72 65         adc ($65)
$00:d023  73 2e         adc ($2e,s),y
$00:d025  20 11 95      jsr $9511  ; -> Sub_00_9511
$00:d028  f1 66         sbc ($66),y
$00:d02a  69 6e 64      adc #$646e
$00:d02d  20 6f 75      jsr $756f  ; -> Sub_00_756f
$00:d030  74 20         stz $20,x
$00:d032  77 68         adc [$68],y
$00:d034  61 74         adc ($74,x)
$00:d036  0d 88 6d      ora $6d88
$00:d039  65 61         adc $61
$00:d03b  6e 2e 20      ror $202e
$00:d03e  12 08         ora ($08)
$00:d040  08            php
$00:d041  04 0c         tsb $0c
$00:d043  8e 9a 03      stx $039a
$00:d046  bd 1a 00      lda $001a,x
$00:d049  09 00 02      ora #$0200
$00:d04c  9d 1a 00      sta $001a,x
$00:d04f  9c 66 04      stz $0466
$00:d052  02 85         cop #$85
$00:d054  c6 d5         dec $d5
$00:d056  00 02         brk #$02
$00:d058  ac 44 d3      ldy $d344
$00:d05b  00 38         brk #$38
$00:d05d  00 70         brk #$70
$00:d05f  00 00         brk #$00
$00:d061  02 02         cop #$02
$00:d063  ac 4c d3      ldy $d34c
$00:d066  00 b8         brk #$b8
$00:d068  00 70         brk #$70
$00:d06a  00 00         brk #$00
$00:d06c  02 02         cop #$02
$00:d06e  ac c4 d1      ldy $d1c4
$00:d071  00 38         brk #$38
$00:d073  00 40         brk #$40
$00:d075  00 00         brk #$00
$00:d077  02 02         cop #$02
$00:d079  ac f2 d1      ldy $d1f2
$00:d07c  00 b8         brk #$b8
$00:d07e  00 40         brk #$40
$00:d080  00 00         brk #$00
$00:d082  02 02         cop #$02
$00:d084  03 3d         ora $3d,s
$00:d086  02 04         cop #$04
$00:d088  80 63         bra $d0ed
$00:d08a  02 91         cop #$91
$00:d08c  ad 5e 1a      lda $1a5e
$00:d08f  29 ff 00      and #$00ff
$00:d092  c9 04 00      cmp #$0004
$00:d095  f0 01         beq $d098
$00:d097  6b            rtl
$00:d098  e2 20         sep #$20
$00:d09a  9c 5e 1a      stz $1a5e
$00:d09d  c2 20         rep #$20
$00:d09f  02 80         cop #$80
$00:d0a1  14 02         trb $02
$00:d0a3  82 bd 16      brl $e763
$00:d0a6  00 29         brk #$29
$00:d0a8  ff fd 9d 16   sbc $169dfd,x
$00:d0ac  00 02         brk #$02
$00:d0ae  80 12         bra $d0c2
$00:d0b0  02 82         cop #$82
$00:d0b2  02 b0         cop #$b0
$00:d0b4  b6 d1         ldx $d1,y
$00:d0b6  00 00         brk #$00
$00:d0b8  03 02         ora $02,s
$00:d0ba  80 13         bra $d0cf
$00:d0bc  02 82         cop #$82
$00:d0be  02 b2         cop #$b2
$00:d0c0  94 d1         sty $d1,x
$00:d0c2  00 08         brk #$08
$00:d0c4  00 10         brk #$10
$00:d0c6  00 00         brk #$00
$00:d0c8  02 02         cop #$02
$00:d0ca  b2 a4         lda ($a4)
$00:d0cc  d1 00         cmp ($00),y
$00:d0ce  08            php
$00:d0cf  00 10         brk #$10
$00:d0d1  00 00         brk #$00
$00:d0d3  02 02         cop #$02
$00:d0d5  b2 b2         lda ($b2)
$00:d0d7  d1 00         cmp ($00),y
$00:d0d9  08            php
$00:d0da  00 10         brk #$10
$00:d0dc  00 00         brk #$00
$00:d0de  02 bd         cop #$bd
$00:d0e0  16 00         asl $00,x
$00:d0e2  09 00 02      ora #$0200
$00:d0e5  9d 16 00      sta $0016,x
$00:d0e8  02 80         cop #$80
$00:d0ea  15 02         ora $02,x
$00:d0ec  82 02 03      brl $d3f1
$00:d0ef  04 02         tsb $02
$00:d0f1  b0 01         bcs $d0f4
$00:d0f3  d1 00         cmp ($00),y
$00:d0f5  01 03         ora ($03,x)
$00:d0f7  02 1b         cop #$1b
$00:d0f9  fd d0 28      sbc $28d0,x
$00:d0fc  00 02         brk #$02
$00:d0fe  04 80         tsb $80
$00:d100  89 bd 1a      bit #$1abd
$00:d103  00 09         brk #$09
$00:d105  00 01         brk #$01
$00:d107  9d 1a 00      sta $001a,x
$00:d10a  02 1f         cop #$1f
$00:d10c  02 35         cop #$35
$00:d10e  a0 ad 37      ldy #$37ad
$00:d111  04 18         tsb $18
$00:d113  69 20 00      adc #$0020
$00:d116  9d 00 00      sta $0000,x
$00:d119  02 1f         cop #$1f
$00:d11b  02 35         cop #$35
$00:d11d  1e ad 37      asl $37ad,x
$00:d120  04 18         tsb $18
$00:d122  69 b0 00      adc #$00b0
$00:d125  9d 02 00      sta $0002,x
$00:d128  e2 20         sep #$20
$00:d12a  a9 ff         lda #$ff
$00:d12c  9d 25 00      sta $0025,x
$00:d12f  c2 20         rep #$20
$00:d131  02 80         cop #$80
$00:d133  16 02         asl $02,x
$00:d135  82 bd 16      brl $e7f5
$00:d138  00 29         brk #$29
$00:d13a  ff fc 9d 16   sbc $169dfc,x
$00:d13e  00 bd         brk #$bd
$00:d140  25 00         and $00
$00:d142  29 ff 00      and #$00ff
$00:d145  c9 fc 00      cmp #$00fc
$00:d148  90 07         bcc $d151
$00:d14a  02 80         cop #$80
$00:d14c  17 02         ora [$02],y
$00:d14e  82 80 ee      brl $bfd1
$00:d151  bd 16 00      lda $0016,x
$00:d154  09 00 03      ora #$0300
$00:d157  9d 16 00      sta $0016,x
$00:d15a  02 80         cop #$80
$00:d15c  18            clc
$00:d15d  02 82         cop #$82
$00:d15f  e2 20         sep #$20
$00:d161  ee 5e 1a      inc $1a5e
$00:d164  c2 20         rep #$20
$00:d166  02 b0         cop #$b0
$00:d168  70 d1         bvs $d13b
$00:d16a  00 00         brk #$00
$00:d16c  40            rti
$00:d16d  02 86         cop #$86
$00:d16f  6b            rtl
$00:d170  02 a8         cop #$a8
$00:d172  00 80         brk #$80
$00:d174  0e ad 05      asl $05ad
$00:d177  00 9d         brk #$9d
$00:d179  1e 00 9e      asl $9e00,x
$00:d17c  20 00 ad      jsr $ad00
$00:d17f  72 03         adc ($03)
$00:d181  9d 1c 00      sta $001c,x
$00:d184  02 a4         cop #$a4
$00:d186  02 80         cop #$80
$00:d188  05 02         ora $02
$00:d18a  82 02 81      brl $528f
$00:d18d  0a            asl a
$00:d18e  04 02         tsb $02
$00:d190  83 02         sta $02,s
$00:d192  86 6b         stx $6b
$00:d194  00 51         brk #$51
$00:d196  02 80         cop #$80
$00:d198  1a            inc a
$00:d199  02 82         cop #$82
$00:d19b  02 81         cop #$81
$00:d19d  1c 08 02      trb $0208
$00:d1a0  83 02         sta $02,s
$00:d1a2  86 6b         stx $6b
$00:d1a4  02 80         cop #$80
$00:d1a6  1b            tcs
$00:d1a7  02 82         cop #$82
$00:d1a9  02 81         cop #$81
$00:d1ab  1c 08 02      trb $0208
$00:d1ae  83 02         sta $02,s
$00:d1b0  86 6b         stx $6b
$00:d1b2  02 96         cop #$96
$00:d1b4  80 ee         bra $d1a4
$00:d1b6  02 a3         cop #$a3
$00:d1b8  02 a0         cop #$a0
$00:d1ba  fe ff 02      inc $02ff,x
$00:d1bd  80 19         bra $d1d8
$00:d1bf  02 82         cop #$82
$00:d1c1  02 86         cop #$86
$00:d1c3  6b            rtl
$00:d1c4  02 81         cop #$81
$00:d1c6  0e 0e 02      asl $020e
$00:d1c9  83 02         sta $02,s
$00:d1cb  80 0d         bra $d1da
$00:d1cd  02 82         cop #$82
$00:d1cf  00 4b         brk #$4b
$00:d1d1  02 b0         cop #$b0
$00:d1d3  20 d2 00      jsr $00d2
$00:d1d6  00 02         brk #$02
$00:d1d8  02 1b         cop #$1b
$00:d1da  de d1 02      dec $02d1,x
$00:d1dd  00 02         brk #$02
$00:d1df  03 03         ora $03,s
$00:d1e1  02 b0         cop #$b0
$00:d1e3  6f d2 00 00   adc $0000d2
$00:d1e7  02 02         cop #$02
$00:d1e9  1b            tcs
$00:d1ea  ee d1 03      inc $03d1
$00:d1ed  00 02         brk #$02
$00:d1ef  04 80         tsb $80
$00:d1f1  d2 02         cmp ($02)
$00:d1f3  81 0e         sta ($0e,x)
$00:d1f5  0e 02 83      asl $8302
$00:d1f8  02 80         cop #$80
$00:d1fa  0d 02 82      ora $8202
$00:d1fd  00 4b         brk #$4b
$00:d1ff  02 b0         cop #$b0
$00:d201  b2 d2         lda ($d2)
$00:d203  00 00         brk #$00
$00:d205  02 02         cop #$02
$00:d207  1b            tcs
$00:d208  0c d2 02      tsb $02d2
$00:d20b  00 02         brk #$02
$00:d20d  03 03         ora $03,s
$00:d20f  02 b0         cop #$b0
$00:d211  01 d3         ora ($d3,x)
$00:d213  00 00         brk #$00
$00:d215  02 02         cop #$02
$00:d217  1b            tcs
$00:d218  1c d2 03      trb $03d2
$00:d21b  00 02         brk #$02
$00:d21d  04 80         tsb $80
$00:d21f  d2 bd         cmp ($bd)
$00:d221  16 00         asl $00,x
$00:d223  89 00 80      bit #$8000
$00:d226  d0 44         bne $d26c
$00:d228  02 81         cop #$81
$00:d22a  0c 02 02      tsb $0202
$00:d22d  83 02         sta $02,s
$00:d22f  9a            txs
$00:d230  00 00         brk #$00
$00:d232  38            sec
$00:d233  d2 52         cmp ($52)
$00:d235  d2 52         cmp ($52)
$00:d237  d2 02         cmp ($02)
$00:d239  09 06 99      ora #$9906
$00:d23c  02 a1         cop #$a1
$00:d23e  f8            sed
$00:d23f  ff 08 00 02   sbc $020008,x
$00:d243  97 02         sta [$02],y
$00:d245  81 1d         sta ($1d,x)
$00:d247  02 02         cop #$02
$00:d249  83 02         sta $02,s
$00:d24b  a1 f8         lda ($f8,x)
$00:d24d  ff 08 00 80   sbc $800008,x
$00:d251  ce 02 09      dec $0902
$00:d254  06 19         asl $19
$00:d256  02 a1         cop #$a1
$00:d258  08            php
$00:d259  00 08         brk #$08
$00:d25b  00 02         brk #$02
$00:d25d  96 02         stx $02,y
$00:d25f  81 1d         sta ($1d,x)
$00:d261  02 02         cop #$02
$00:d263  83 02         sta $02,s
$00:d265  a1 08         lda ($08,x)
$00:d267  00 08         brk #$08
$00:d269  00 80         brk #$80
$00:d26b  b4 02         ldy $02,x
$00:d26d  86 6b         stx $6b
$00:d26f  bd 16 00      lda $0016,x
$00:d272  89 00 80      bit #$8000
$00:d275  d0 38         bne $d2af
$00:d277  02 81         cop #$81
$00:d279  0c 02 02      tsb $0202
$00:d27c  83 02         sta $02,s
$00:d27e  07 06         ora [$06]
$00:d280  19 99 d2      ora $d299,y
$00:d283  02 a1         cop #$a1
$00:d285  f8            sed
$00:d286  ff 08 00 02   sbc $020008,x
$00:d28a  97 02         sta [$02],y
$00:d28c  81 1d         sta ($1d,x)
$00:d28e  02 02         cop #$02
$00:d290  83 02         sta $02,s
$00:d292  a1 f8         lda ($f8,x)
$00:d294  ff 08 00 80   sbc $800008,x
$00:d298  d6 02         dec $02,x
$00:d29a  a1 08         lda ($08,x)
$00:d29c  00 08         brk #$08
$00:d29e  00 02         brk #$02
$00:d2a0  96 02         stx $02,y
$00:d2a2  81 1d         sta ($1d,x)
$00:d2a4  02 02         cop #$02
$00:d2a6  83 02         sta $02,s
$00:d2a8  a1 08         lda ($08,x)
$00:d2aa  00 08         brk #$08
$00:d2ac  00 80         brk #$80
$00:d2ae  c0 02 86      cpy #$8602
$00:d2b1  6b            rtl
$00:d2b2  bd 16 00      lda $0016,x
$00:d2b5  89 00 80      bit #$8000
$00:d2b8  d0 44         bne $d2fe
$00:d2ba  02 81         cop #$81
$00:d2bc  0c 02 02      tsb $0202
$00:d2bf  83 02         sta $02,s
$00:d2c1  9a            txs
$00:d2c2  00 00         brk #$00
$00:d2c4  ca            dex
$00:d2c5  d2 e4         cmp ($e4)
$00:d2c7  d2 e4         cmp ($e4)
$00:d2c9  d2 02         cmp ($02)
$00:d2cb  09 07 99      ora #$9907
$00:d2ce  02 a1         cop #$a1
$00:d2d0  f8            sed
$00:d2d1  ff 08 00 02   sbc $020008,x
$00:d2d5  97 02         sta [$02],y
$00:d2d7  81 1d         sta ($1d,x)
$00:d2d9  02 02         cop #$02
$00:d2db  83 02         sta $02,s
$00:d2dd  a1 f8         lda ($f8,x)
$00:d2df  ff 08 00 80   sbc $800008,x
$00:d2e3  ce 02 09      dec $0902
$00:d2e6  07 19         ora [$19]
$00:d2e8  02 a1         cop #$a1
$00:d2ea  08            php
$00:d2eb  00 08         brk #$08
$00:d2ed  00 02         brk #$02
$00:d2ef  96 02         stx $02,y
$00:d2f1  81 1d         sta ($1d,x)
$00:d2f3  02 02         cop #$02
$00:d2f5  83 02         sta $02,s
$00:d2f7  a1 08         lda ($08,x)
$00:d2f9  00 08         brk #$08
$00:d2fb  00 80         brk #$80
$00:d2fd  b4 02         ldy $02,x
$00:d2ff  86 6b         stx $6b
$00:d301  bd 16 00      lda $0016,x
$00:d304  89 00 80      bit #$8000
$00:d307  d0 38         bne $d341
$00:d309  02 81         cop #$81
$00:d30b  0c 02 02      tsb $0202
$00:d30e  83 02         sta $02,s
$00:d310  07 07         ora [$07]
$00:d312  19 2b d3      ora $d32b,y
$00:d315  02 a1         cop #$a1
$00:d317  f8            sed
$00:d318  ff 08 00 02   sbc $020008,x
$00:d31c  97 02         sta [$02],y
$00:d31e  81 1d         sta ($1d,x)
$00:d320  02 02         cop #$02
$00:d322  83 02         sta $02,s
$00:d324  a1 f8         lda ($f8,x)
$00:d326  ff 08 00 80   sbc $800008,x
$00:d32a  d6 02         dec $02,x
$00:d32c  a1 08         lda ($08,x)
$00:d32e  00 08         brk #$08
$00:d330  00 02         brk #$02
$00:d332  96 02         stx $02,y
$00:d334  81 1d         sta ($1d,x)
$00:d336  02 02         cop #$02
$00:d338  83 02         sta $02,s
$00:d33a  a1 08         lda ($08,x)
$00:d33c  00 08         brk #$08
$00:d33e  00 80         brk #$80
$00:d340  c0 02 86      cpy #$8602
$00:d343  6b            rtl
$00:d344  02 80         cop #$80
$00:d346  11 02         ora ($02),y
$00:d348  82 02 91      brl $644d
$00:d34b  6b            rtl
$00:d34c  02 80         cop #$80
$00:d34e  10 02         bpl $d352
$00:d350  82 02 91      brl $6455
$00:d353  6b            rtl
$00:d354  e2 20         sep #$20
$00:d356  a9 00         lda #$00
$00:d358  9d 36 00      sta $0036,x
$00:d35b  c2 20         rep #$20
$00:d35d  a9 10 20      lda #$2010
$00:d360  9d 16 00      sta $0016,x
$00:d363  ee 66 04      inc $0466
$00:d366  02 37         cop #$37
$00:d368  02 31         cop #$31
$00:d36a  00 02         brk #$02
$00:d36c  03 f1         ora $f1,s
$00:d36e  02 04         cop #$04
$00:d370  bd 16 00      lda $0016,x
$00:d373  29 ef ff      and #$ffef
$00:d376  9d 16 00      sta $0016,x
$00:d379  02 01         cop #$01
$00:d37b  c6 d3         dec $d3
$00:d37d  ad 82 1b      lda $1b82
$00:d380  29 1f 00      and #$001f
$00:d383  3a            dec a
$00:d384  f0 06         beq $d38c
$00:d386  02 01         cop #$01
$00:d388  3b            tsc
$00:d389  d4 80         pei ($80)
$00:d38b  04 02         tsb $02
$00:d38d  01 0b         ora ($0b,x)
$00:d38f  d4 e2         pei ($e2)
$00:d391  20 9c 82      jsr $829c
$00:d394  1b            tcs
$00:d395  c2 20         rep #$20
$00:d397  02 03         cop #$03
$00:d399  3d 02 04      and $0402,x
$00:d39c  02 01         cop #$01
$00:d39e  93 d5         sta ($d5,s),y
$00:d3a0  02 85         cop #$85
$00:d3a2  b9 d5 00      lda $00d5,y
$00:d3a5  02 03         cop #$03
$00:d3a7  f1 02         sbc ($02),y
$00:d3a9  04 02         tsb $02
$00:d3ab  09 02 9f      ora #$9f02
$00:d3ae  a9 06 00      lda #$0006
$00:d3b1  8d 84 1b      sta $1b84
$00:d3b4  a9 01 00      lda #$0001
$00:d3b7  8d 1e 03      sta $031e
$00:d3ba  02 10         cop #$10
$00:d3bc  00 07         brk #$07
$00:d3be  01 70         ora ($70,x)
$00:d3c0  00 60         brk #$60
$00:d3c2  00 02         brk #$02
$00:d3c4  91 6b         sta ($6b),y
$00:d3c6  10 46         bpl $d40e
$00:d3c8  69 6e 61      adc #$616e
$00:d3cb  6c 6c 79      jmp ($796c)
$00:d3ce  2c 20 02      bit $0220
$00:d3d1  02 20         cop #$20
$00:d3d3  0d 64 65      ora $6564
$00:d3d6  66 65         ror $65
$00:d3d8  61 74         adc ($74,x)
$00:d3da  65 64         adc $64
$00:d3dc  20 44 65      jsr $6544  ; -> Sub_00_6544
$00:d3df  61 74         adc ($74,x)
$00:d3e1  68            pla
$00:d3e2  74 6f         stz $6f,x
$00:d3e4  6c 6c 21      jmp ($216c)
$00:d3e7  20 11 53      jsr $5311  ; -> Sub_00_5311
$00:d3ea  75 64         adc $64,x
$00:d3ec  64 65         stz $65
$00:d3ee  6e 6c 79      ror $796c
$00:d3f1  20 02 02      jsr $0202  ; -> Sub_00_0202
$00:d3f4  0d 68 65      ora $6568
$00:d3f7  61 72         adc ($72,x)
$00:d3f9  64 20         stz $20
$00:d3fb  97 73         sta [$73],y
$00:d3fd  6d 61 6c      adc $6c61
$00:d400  6c 20 76      jmp ($7620)
$00:d403  6f 69 63 65   adc $656369
$00:d407  2e 20 11      rol $1120
$00:d40a  0c 10 02      tsb $0210
$00:d40d  02 2c         cop #$2c
$00:d40f  88            dey
$00:d410  64 65         stz $65
$00:d412  63 69         adc $69,s
$00:d414  64 65         stz $65
$00:d416  64 20         stz $20
$00:d418  e2 0d         sep #$0d
$00:d41a  73 74         adc ($74,s),y
$00:d41c  61 79         adc ($79,x)
$00:d41e  20 b9 96      jsr $96b9
$00:d421  73 65         adc ($65,s),y
$00:d423  61 6c         adc ($6c,x)
$00:d425  20 74 68      jsr $6874  ; -> Sub_00_6874
$00:d428  65 0d         adc $0d
$00:d42a  57 6f         eor [$6f],y
$00:d42c  72 6c         adc ($6c)
$00:d42e  64 20         stz $20
$00:d430  cb            wai
$00:d431  45 76         eor $76
$00:d433  69 6c 2e      adc #$2e6c
$00:d436  20 11 13      jsr $1311  ; -> Sub_00_1311
$00:d439  6c d4 10      jmp ($10d4)
$00:d43c  02 02         cop #$02
$00:d43e  2c 20 77      bit $7720
$00:d441  65 20         adc $20
$00:d443  64 65         stz $65
$00:d445  63 69         adc $69,s
$00:d447  64 65         stz $65
$00:d449  64 20         stz $20
$00:d44b  0d e2 73      ora $73e2
$00:d44e  74 61         stz $61,x
$00:d450  79 20 b9      adc $b920,y
$00:d453  96 73         stx $73,y
$00:d455  65 61         adc $61
$00:d457  6c 20 0d      jmp ($0d20)
$00:d45a  e1 57         sbc ($57,x)
$00:d45c  6f 72 6c 64   adc $646c72
$00:d460  20 cb 45      jsr $45cb  ; -> Sub_00_45cb
$00:d463  76 69         ror $69,x
$00:d465  6c 2e 2e      jmp ($2e2e)
$00:d468  2e 2e 2e      rol $2e2e
$00:d46b  11 91         ora ($91),y
$00:d46d  57 6f         eor [$6f],y
$00:d46f  72 6c         adc ($6c)
$00:d471  64 20         stz $20
$00:d473  cb            wai
$00:d474  45 76         eor $76
$00:d476  69 6c 20      adc #$206c
$00:d479  ba            tsx
$00:d47a  0d 97 64      ora $6497
$00:d47d  61 72         adc ($72,x)
$00:d47f  6b            rtl
$00:d480  20 f6 e3      jsr $e3f6
$00:d483  0d 65 78      ora $7865
$00:d486  69 73 74      adc #$7473
$00:d489  73 20         adc ($20,s),y
$00:d48b  bb            tyx
$00:d48c  e1 a0         sbc ($a0,x)
$00:d48e  cb            wai
$00:d48f  0d 63 72      ora $7263
$00:d492  65 61         adc $61
$00:d494  74 75         stz $75,x
$00:d496  72 65         adc ($65)
$00:d498  73 60         adc ($60,s),y
$00:d49a  20 6d 69      jsr $696d  ; -> Sub_00_696d
$00:d49d  6e 64 73      ror $7364
$00:d4a0  2e 20 11      rol $1120
$00:d4a3  41 73         eor ($73,x)
$00:d4a5  20 6c 6f      jsr $6f6c
$00:d4a8  6e 67 20      ror $2067
$00:d4ab  61 73         adc ($73,x)
$00:d4ad  20 e9 98      jsr $98e9
$00:d4b0  0d 69 6e      ora $6e69
$00:d4b3  76 65         ror $65,x
$00:d4b5  6e 74 69      ror $6974
$00:d4b8  6f 6e 73 20   adc $20736e
$00:d4bc  bb            tyx
$00:d4bd  e4 0d         cpx $0d
$00:d4bf  f6 e1         inc $e1,x
$00:d4c1  73 61         adc ($61,s),y
$00:d4c3  6d 65 20      adc $2065
$00:d4c6  74 68         stz $68,x
$00:d4c8  69 6e 67      adc #$676e
$00:d4cb  20 0d f1      jsr $f10d  ; -> Sub_00_f10d
$00:d4ce  68            pla
$00:d4cf  61 70         adc ($70,x)
$00:d4d1  70 65         bvs $d538
$00:d4d3  6e 2e 20      ror $202e
$00:d4d6  11 88         ora ($88),y
$00:d4d8  f1 73         sbc ($73),y
$00:d4da  74 61         stz $61,x
$00:d4dc  79 20 96      adc $9620,y
$00:d4df  74 72         stz $72,x
$00:d4e1  79 20 74      adc $7420,y
$00:d4e4  6f 0d 73 74   adc $74730d
$00:d4e8  6f 70 20 61   adc $612070
$00:d4ec  73 20         adc ($20,s),y
$00:d4ee  6d 75 63      adc $6375
$00:d4f1  68            pla
$00:d4f2  20 61 73      jsr $7361  ; -> Sub_00_7361
$00:d4f5  20 0d 70      jsr $700d  ; -> Sub_00_700d
$00:d4f8  6f 73 73 69   adc $697373
$00:d4fc  62 6c 65      per $3a6b
$00:d4ff  2e 20 11      rol $1120
$00:d502  95 98         sta $98,x
$00:d504  73 74         adc ($74,s),y
$00:d506  69 6c 6c      adc #$6c6c
$00:d509  20 79 6f      jsr $6f79  ; -> Sub_00_6f79
$00:d50c  75 6e         adc $6e,x
$00:d50e  67 2c         adc [$2c]
$00:d510  20 0d fe      jsr $fe0d  ; -> Sub_00_fe0d
$00:d513  dc 65 78      jml [$7865]
$00:d516  70 65         bvs $d57d
$00:d518  72 69         adc ($69)
$00:d51a  65 6e         adc $6e
$00:d51c  63 65         adc $65,s
$00:d51e  20 0d 6d      jsr $6d0d  ; -> Sub_00_6d0d
$00:d521  6f 72 65 2e   adc $2e6572
$00:d525  20 11 82      jsr $8211
$00:d528  69 66 20      adc #$2066
$00:d52b  fe 66 69      inc $6966,x
$00:d52e  67 75         adc [$75]
$00:d530  72 65         adc ($65)
$00:d532  20 6f 75      jsr $756f  ; -> Sub_00_756f
$00:d535  74 20         stz $20,x
$00:d537  0d 72 65      ora $6572
$00:d53a  61 73         adc ($73,x)
$00:d53c  6f 6e 73 20   adc $20736e
$00:d540  66 6f         ror $6f
$00:d542  72 2c         adc ($2c)
$00:d544  20 0d 9a      jsr $9a0d
$00:d547  66 65         ror $65
$00:d549  65 6c         adc $6c
$00:d54b  69 6e 67      adc #$676e
$00:d54e  73 2c         adc ($2c,s),y
$00:d550  20 11 9a      jsr $9a11
$00:d553  63 6f         adc $6f,s
$00:d555  6e 6e 65      ror $656e
$00:d558  63 74         adc $74,s
$00:d55a  69 6f 6e      adc #$6e6f
$00:d55d  73 20         adc ($20,s),y
$00:d55f  11 96         ora ($96),y
$00:d561  65 78         adc $78
$00:d563  69 73 74      adc #$7473
$00:d566  65 6e         adc $6e
$00:d568  63 65         adc $65,s
$00:d56a  73 2c         adc ($2c,s),y
$00:d56c  20 0d fe      jsr $fe0d  ; -> Sub_00_fe0d
$00:d56f  f1 a1         sbc ($a1),y
$00:d571  77 69         adc [$69],y
$00:d573  73 65         adc ($65,s),y
$00:d575  20 be 0d      jsr $0dbe
$00:d578  e1 4d         sbc ($4d,x)
$00:d57a  61 73         adc ($73,x)
$00:d57c  74 65         stz $65,x
$00:d57e  72 2e         adc ($2e)
$00:d580  20 11 02      jsr $0211  ; -> Sub_00_0211
$00:d583  02 2c         cop #$2c
$00:d585  20 b4 67      jsr $67b4
$00:d588  6f 69 6e 67   adc $676e69
$00:d58c  2e 20 12      rol $1220
$00:d58f  08            php
$00:d590  08            php
$00:d591  04 0c         tsb $0c
$00:d593  10 91         bpl $d526
$00:d595  57 6f         eor [$6f],y
$00:d597  72 6c         adc ($6c)
$00:d599  64 20         stz $20
$00:d59b  cb            wai
$00:d59c  45 76         eor $76
$00:d59e  69 6c 20      adc #$206c
$00:d5a1  0d 62 65      ora $6562
$00:d5a4  67 61         adc [$61]
$00:d5a6  6e 20 e2      ror $e220
$00:d5a9  64 69         stz $69
$00:d5ab  73 61         adc ($61,s),y
$00:d5ad  70 70         bvs $d61f
$00:d5af  65 61         adc $61
$00:d5b1  72 2e         adc ($2e)
$00:d5b3  20 12 08      jsr $0812
$00:d5b6  08            php
$00:d5b7  04 0c         tsb $0c
$00:d5b9  02 a8         cop #$a8
$00:d5bb  00 80         brk #$80
$00:d5bd  0d 02 92      ora $9202
$00:d5c0  4d 02 94      eor $9402
$00:d5c3  02 86         cop #$86
$00:d5c5  6b            rtl
$00:d5c6  bd 16 00      lda $0016,x
$00:d5c9  09 10 00      ora #$0010
$00:d5cc  9d 16 00      sta $0016,x
$00:d5cf  02 91         cop #$91
$00:d5d1  e2 20         sep #$20
$00:d5d3  ad 66 04      lda $0466
$00:d5d6  d0 0e         bne $d5e6
$00:d5d8  a9 2c         lda #$2c
$00:d5da  eb            xba
$00:d5db  a9 00         lda #$00
$00:d5dd  a0 f9 d5      ldy #$d5f9
$00:d5e0  22 8a 98 02   jsl $02988a  ; -> Sub_02_988a
$00:d5e4  80 0c         bra $d5f2
$00:d5e6  a9 2c         lda #$2c
$00:d5e8  eb            xba
$00:d5e9  a9 00         lda #$00
$00:d5eb  a0 f5 d5      ldy #$d5f5
$00:d5ee  22 8a 98 02   jsl $02988a  ; -> Sub_02_988a
$00:d5f2  c2 20         rep #$20
$00:d5f4  6b            rtl
$00:d5f5  7f 16 10 16   adc $161016,x
$00:d5f9  01 17         ora ($17,x)
$00:d5fb  00 c2         brk #$c2
$00:d5fd  20 48 a3      jsr $a348
$00:d600  04 3a         tsb $3a
$00:d602  85 3b         sta $3b
$00:d604  e2 20         sep #$20
$00:d606  a3 06         lda $06,s
$00:d608  85 3d         sta $3d
$00:d60a  a7 3b         lda [$3b]
$00:d60c  89 40         bit #$40
$00:d60e  d0 05         bne $d615
$00:d610  8d 98 03      sta $0398
$00:d613  80 05         bra $d61a
$00:d615  29 bf         and #$bf
$00:d617  8d 99 03      sta $0399
$00:d61a  c2 20         rep #$20
$00:d61c  68            pla
$00:d61d  40            rti
$00:d61e  e2 20         sep #$20
$00:d620  9b            txy
$00:d621  a3 04         lda $04,s
$00:d623  85 3a         sta $3a
$00:d625  c2 20         rep #$20
$00:d627  a3 02         lda $02,s
$00:d629  3a            dec a
$00:d62a  85 38         sta $38
$00:d62c  a7 38         lda [$38]
$00:d62e  e6 38         inc $38
$00:d630  29 ff 00      and #$00ff
$00:d633  0a            asl a
$00:d634  aa            tax
$00:d635  7c 38 d6      jmp ($d638,x)
$00:d638  9e d7 a2      stz $a2d7,x
$00:d63b  d7 bd         cmp [$bd],y
$00:d63d  d7 f5         cmp [$f5],y
$00:d63f  d7 0b         cmp [$0b],y
$00:d641  d8            cld
$00:d642  1d d8 38      ora $38d8,x
$00:d645  d8            cld
$00:d646  3e d8 43      rol $43d8,x
$00:d649  d8            cld
$00:d64a  67 d8         adc [$d8]
$00:d64c  74 d8         stz $d8,x
$00:d64e  88            dey
$00:d64f  d8            cld
$00:d650  a9 d8 0d      lda #$0dd8
$00:d653  d9 00 00      cmp $0000,y
$00:d656  00 00         brk #$00
$00:d658  46 d9         lsr $d9
$00:d65a  70 d9         bvs $d635
$00:d65c  9e d9 b5      stz $b5d9,x
$00:d65f  d9 cc d9      cmp $d9cc,y
$00:d662  f4 d9 fb      pea $fbd9
$00:d665  d9 02 da      cmp $da02,y
$00:d668  0f da 28 da   ora $da28da
$00:d66c  43 da         eor $da,s
$00:d66e  88            dey
$00:d66f  da            phx
$00:d670  9e da b6      stz $b6da,x
$00:d673  da            phx
$00:d674  c6 da         dec $da
$00:d676  d6 da         dec $da,x
$00:d678  fd da 15      sbc $15da,x
$00:d67b  db            stp
$00:d67c  2b            pld
$00:d67d  db            stp
$00:d67e  39 db 4f      and $4fdb,y
$00:d681  db            stp
$00:d682  65 db         adc $db
$00:d684  79 db b1      adc $b1db,y
$00:d687  db            stp
$00:d688  c1 db         cmp ($db,x)
$00:d68a  eb            xba
$00:d68b  db            stp
$00:d68c  1f dc 50 dc   ora $dc50dc,x
$00:d690  00 00         brk #$00
$00:d692  00 00         brk #$00
$00:d694  81 dc         sta ($dc,x)
$00:d696  97 dc         sta [$dc],y
$00:d698  d6 dc         dec $dc,x
$00:d69a  f0 dc         beq $d678
$00:d69c  10 dd         bpl $d67b
$00:d69e  30 dd         bmi $d67d
$00:d6a0  53 dd         eor ($dd,s),y
$00:d6a2  76 dd         ror $dd,x
$00:d6a4  94 dd         sty $dd,x
$00:d6a6  b0 dd         bcs $d685
$00:d6a8  be dd cb      ldx $cbdd,y
$00:d6ab  dd 05 de      cmp $de05,x
$00:d6ae  0d de 6c      ora $6cde
$00:d6b1  de 00 00      dec $0000,x
$00:d6b4  00 00         brk #$00
$00:d6b6  00 00         brk #$00
$00:d6b8  00 00         brk #$00
$00:d6ba  00 00         brk #$00
$00:d6bc  00 00         brk #$00
$00:d6be  00 00         brk #$00
$00:d6c0  ff ff ff ff   sbc $ffffff,x
$00:d6c4  ff ff ff ff   sbc $ffffff,x
$00:d6c8  ff ff ff ff   sbc $ffffff,x
$00:d6cc  ff ff ff ff   sbc $ffffff,x
$00:d6d0  ff ff ff ff   sbc $ffffff,x
$00:d6d4  ff ff ff ff   sbc $ffffff,x
$00:d6d8  ff ff ff ff   sbc $ffffff,x
$00:d6dc  ff ff ff ff   sbc $ffffff,x
$00:d6e0  00 00         brk #$00
$00:d6e2  00 00         brk #$00
$00:d6e4  00 00         brk #$00
$00:d6e6  00 00         brk #$00
$00:d6e8  00 00         brk #$00
$00:d6ea  00 00         brk #$00
$00:d6ec  00 00         brk #$00
$00:d6ee  00 00         brk #$00
$00:d6f0  00 00         brk #$00
$00:d6f2  00 00         brk #$00
$00:d6f4  00 00         brk #$00
$00:d6f6  00 00         brk #$00
$00:d6f8  00 00         brk #$00
$00:d6fa  00 00         brk #$00
$00:d6fc  00 00         brk #$00
$00:d6fe  20 00 ff      jsr $ff00
$00:d701  ff ff ff ff   sbc $ffffff,x
$00:d705  ff ff ff ff   sbc $ffffff,x
$00:d709  ff ff ff ff   sbc $ffffff,x
$00:d70d  ff ff ff ff   sbc $ffffff,x
$00:d711  ff ff ff ff   sbc $ffffff,x
$00:d715  ff ff ff ff   sbc $ffffff,x
$00:d719  ff ff ff ff   sbc $ffffff,x
$00:d71d  ff ff ff 00   sbc $00ffff,x
$00:d721  00 00         brk #$00
$00:d723  00 00         brk #$00
$00:d725  00 00         brk #$00
$00:d727  00 00         brk #$00
$00:d729  00 00         brk #$00
$00:d72b  00 00         brk #$00
$00:d72d  00 00         brk #$00
$00:d72f  00 00         brk #$00
$00:d731  00 00         brk #$00
$00:d733  00 00         brk #$00
$00:d735  00 00         brk #$00
$00:d737  00 7a         brk #$7a
$00:d739  de 90 de      dec $de90,x
$00:d73c  b0 de         bcs $d71c
$00:d73e  bd de cf      lda $cfde,x
$00:d741  de ee de      dec $deee,x
$00:d744  0d df 45      ora $45df
$00:d747  df 52 df 5f   cmp $5fdf52,x
$00:d74b  df 85 df ab   cmp $abdf85,x
$00:d74f  df d1 df f7   cmp $f7dfd1,x
$00:d753  df 0c e0 21   cmp $21e00c,x
$00:d757  e0 42 e0      cpx #$e042
$00:d75a  63 e0         adc $e0,s
$00:d75c  75 e0         adc $e0,x
$00:d75e  8e e0 b1      stx $b1e0
$00:d761  e0 cd e0      cpx #$e0cd
$00:d764  ee e0 00      inc $00e0
$00:d767  e1 12         sbc ($12,x)
$00:d769  e1 24         sbc ($24,x)
$00:d76b  e1 36         sbc ($36,x)
$00:d76d  e1 5d         sbc ($5d,x)
$00:d76f  e1 84         sbc ($84,x)
$00:d771  e1 b2         sbc ($b2,x)
$00:d773  e1 d1         sbc ($d1,x)
$00:d775  e1 ef         sbc ($ef,x)
$00:d777  e1 00         sbc ($00,x)
$00:d779  e2 11         sep #$11
$00:d77b  e2 2f         sep #$2f
$00:d77d  e2 48         sep #$48
$00:d77f  e2 55         sep #$55
$00:d781  e2 62         sep #$62
$00:d783  e2 8b         sep #$8b
$00:d785  e2 98         sep #$98
$00:d787  e2 a5         sep #$a5
$00:d789  e2 c1         sep #$c1
$00:d78b  e2 e6         sep #$e6
$00:d78d  e2 ff         sep #$ff
$00:d78f  e2 39         sep #$39
$00:d791  e3 73         sbc $73,s
$00:d793  e3 a9         sbc $a9,s
$00:d795  e3 e1         sbc $e1,s
$00:d797  e3 09         sbc $09,s
$00:d799  e4 31         cpx $31
$00:d79b  e4 73         cpx $73
$00:d79d  e4 bb         cpx $bb
$00:d79f  82 27 0d      brl $e4c9
$00:d7a2  bb            tyx
$00:d7a3  a7 38         lda [$38]
$00:d7a5  e6 38         inc $38
$00:d7a7  e6 38         inc $38
$00:d7a9  a8            tay
$00:d7aa  e2 20         sep #$20
$00:d7ac  da            phx
$00:d7ad  8b            phb
$00:d7ae  a5 3a         lda $3a
$00:d7b0  48            pha
$00:d7b1  ab            plb
$00:d7b2  22 27 ac 02   jsl $02ac27
$00:d7b6  ab            plb
$00:d7b7  fa            plx
$00:d7b8  c2 20         rep #$20
$00:d7ba  82 02 0d      brl $e4bf
$00:d7bd  bb            tyx
$00:d7be  da            phx
$00:d7bf  a0 02         ldy #$02
$00:d7c1  cf 22 69 a7   cmp $a76922
$00:d7c5  02 e2         cop #$e2
$00:d7c7  20 a9 00      jsr $00a9  ; -> Sub_00_00a9
$00:d7ca  eb            xba
$00:d7cb  a9 02 22      lda #$2202
$00:d7ce  81 a2         sta ($a2,x)
$00:d7d0  02 08         cop #$08
$00:d7d2  ae f7 03      ldx $03f7
$00:d7d5  22 da ab 02   jsl $02abda
$00:d7d9  a9 01 8d      lda #$8d01
$00:d7dc  b8            clv
$00:d7dd  03 28         ora $28,s
$00:d7df  c2 20         rep #$20
$00:d7e1  fa            plx
$00:d7e2  b0 08         bcs $d7ec
$00:d7e4  29 ff 00      and #$00ff
$00:d7e7  d0 03         bne $d7ec
$00:d7e9  82 cf 0c      brl $e4bb
$00:d7ec  a7 38         lda [$38]
$00:d7ee  e6 38         inc $38
$00:d7f0  e6 38         inc $38
$00:d7f2  82 cc 0c      brl $e4c1
$00:d7f5  bb            tyx
$00:d7f6  a7 38         lda [$38]
$00:d7f8  e6 38         inc $38
$00:d7fa  29 ff 00      and #$00ff
$00:d7fd  9d 2e 00      sta $002e,x
$00:d800  a5 38         lda $38
$00:d802  9d 2c 00      sta $002c,x
$00:d805  9d 18 00      sta $0018,x
$00:d808  82 b6 0c      brl $e4c1
$00:d80b  bb            tyx
$00:d80c  de 2e 00      dec $002e,x
$00:d80f  d0 03         bne $d814
$00:d811  82 ab 0c      brl $e4bf
$00:d814  bd 2c 00      lda $002c,x
$00:d817  9d 18 00      sta $0018,x
$00:d81a  82 ac 0c      brl $e4c9
$00:d81d  bb            tyx
$00:d81e  a7 38         lda [$38]
$00:d820  30 07         bmi $d829
$00:d822  20 f8 e4      jsr $e4f8
$00:d825  90 07         bcc $d82e
$00:d827  80 0c         bra $d835
$00:d829  20 f8 e4      jsr $e4f8
$00:d82c  90 07         bcc $d835
$00:d82e  c6 38         dec $38
$00:d830  c6 38         dec $38
$00:d832  82 8f 0c      brl $e4c4
$00:d835  82 83 0c      brl $e4bb
$00:d838  bb            tyx
$00:d839  a7 38         lda [$38]
$00:d83b  82 83 0c      brl $e4c1
$00:d83e  bb            tyx
$00:d83f  a7 38         lda [$38]
$00:d841  80 06         bra $d849
$00:d843  bb            tyx
$00:d844  a7 38         lda [$38]
$00:d846  49 00 80      eor #$8000
$00:d849  30 07         bmi $d852
$00:d84b  20 f8 e4      jsr $e4f8
$00:d84e  b0 07         bcs $d857
$00:d850  80 08         bra $d85a
$00:d852  20 f8 e4      jsr $e4f8
$00:d855  b0 03         bcs $d85a
$00:d857  82 5d 0c      brl $e4b7
$00:d85a  e6 38         inc $38
$00:d85c  e6 38         inc $38
$00:d85e  a7 38         lda [$38]
$00:d860  e6 38         inc $38
$00:d862  e6 38         inc $38
$00:d864  82 5a 0c      brl $e4c1
$00:d867  bb            tyx
$00:d868  a7 38         lda [$38]
$00:d86a  e6 38         inc $38
$00:d86c  e6 38         inc $38
$00:d86e  20 cc e4      jsr $e4cc
$00:d871  82 4b 0c      brl $e4bf
$00:d874  bb            tyx
$00:d875  a7 38         lda [$38]
$00:d877  e6 38         inc $38
$00:d879  29 ff 00      and #$00ff
$00:d87c  20 1e e5      jsr $e51e
$00:d87f  90 04         bcc $d885
$00:d881  22 f9 a0 02   jsl $02a0f9
$00:d885  82 37 0c      brl $e4bf
$00:d888  bb            tyx
$00:d889  a7 38         lda [$38]
$00:d88b  e6 38         inc $38
$00:d88d  29 ff 00      and #$00ff
$00:d890  20 1e e5      jsr $e51e
$00:d893  b0 11         bcs $d8a6
$00:d895  e2 20         sep #$20
$00:d897  10 05         bpl $d89e
$00:d899  29 7f         and #$7f
$00:d89b  9c 64 1b      stz $1b64
$00:d89e  59 1e 1b      eor $1b1e,y
$00:d8a1  99 1e 1b      sta $1b1e,y
$00:d8a4  c2 20         rep #$20
$00:d8a6  82 16 0c      brl $e4bf
$00:d8a9  bb            tyx
$00:d8aa  a7 38         lda [$38]
$00:d8ac  e6 38         inc $38
$00:d8ae  29 ff 00      and #$00ff
$00:d8b1  20 17 e6      jsr $e617  ; -> Sub_00_e617
$00:d8b4  a7 38         lda [$38]
$00:d8b6  e6 38         inc $38
$00:d8b8  29 ff 00      and #$00ff
$00:d8bb  20 28 e6      jsr $e628  ; -> Sub_00_e628
$00:d8be  85 00         sta $00
$00:d8c0  bd 00 00      lda $0000,x
$00:d8c3  38            sec
$00:d8c4  e5 00         sbc $00
$00:d8c6  85 16         sta $16
$00:d8c8  a5 00         lda $00
$00:d8ca  0a            asl a
$00:d8cb  18            clc
$00:d8cc  7d 10 00      adc $0010,x
$00:d8cf  38            sec
$00:d8d0  e9 0f 00      sbc #$000f
$00:d8d3  85 18         sta $18
$00:d8d5  b9 00 00      lda $0000,y
$00:d8d8  38            sec
$00:d8d9  e5 16         sbc $16
$00:d8db  c5 18         cmp $18
$00:d8dd  90 03         bcc $d8e2
$00:d8df  82 d9 0b      brl $e4bb
$00:d8e2  bd 02 00      lda $0002,x
$00:d8e5  18            clc
$00:d8e6  65 00         adc $00
$00:d8e8  85 16         sta $16
$00:d8ea  a5 00         lda $00
$00:d8ec  0a            asl a
$00:d8ed  18            clc
$00:d8ee  7d 12 00      adc $0012,x
$00:d8f1  38            sec
$00:d8f2  e9 0f 00      sbc #$000f
$00:d8f5  85 18         sta $18
$00:d8f7  a5 16         lda $16
$00:d8f9  38            sec
$00:d8fa  f9 02 00      sbc $0002,y
$00:d8fd  c5 18         cmp $18
$00:d8ff  90 03         bcc $d904
$00:d901  82 b7 0b      brl $e4bb
$00:d904  a7 38         lda [$38]
$00:d906  e6 38         inc $38
$00:d908  e6 38         inc $38
$00:d90a  82 b4 0b      brl $e4c1
$00:d90d  bb            tyx
$00:d90e  a7 38         lda [$38]
$00:d910  e6 38         inc $38
$00:d912  29 ff 00      and #$00ff
$00:d915  20 17 e6      jsr $e617  ; -> Sub_00_e617
$00:d918  a7 38         lda [$38]
$00:d91a  e6 38         inc $38
$00:d91c  29 ff 00      and #$00ff
$00:d91f  20 28 e6      jsr $e628  ; -> Sub_00_e628
$00:d922  d9 00 00      cmp $0000,y
$00:d925  f0 03         beq $d92a
$00:d927  82 8f 0b      brl $e4b9
$00:d92a  a7 38         lda [$38]
$00:d92c  e6 38         inc $38
$00:d92e  29 ff 00      and #$00ff
$00:d931  1a            inc a
$00:d932  20 28 e6      jsr $e628  ; -> Sub_00_e628
$00:d935  d9 02 00      cmp $0002,y
$00:d938  f0 03         beq $d93d
$00:d93a  82 7e 0b      brl $e4bb
$00:d93d  a7 38         lda [$38]
$00:d93f  e6 38         inc $38
$00:d941  e6 38         inc $38
$00:d943  82 7b 0b      brl $e4c1
$00:d946  bb            tyx
$00:d947  a7 38         lda [$38]
$00:d949  e6 38         inc $38
$00:d94b  e6 38         inc $38
$00:d94d  eb            xba
$00:d94e  8d 18 03      sta $0318
$00:d951  a7 38         lda [$38]
$00:d953  e6 38         inc $38
$00:d955  29 ff 00      and #$00ff
$00:d958  8d 80 03      sta $0380
$00:d95b  a7 38         lda [$38]
$00:d95d  e6 38         inc $38
$00:d95f  e6 38         inc $38
$00:d961  8d 7c 03      sta $037c
$00:d964  a7 38         lda [$38]
$00:d966  e6 38         inc $38
$00:d968  e6 38         inc $38
$00:d96a  8d 7e 03      sta $037e
$00:d96d  82 4f 0b      brl $e4bf
$00:d970  bb            tyx
$00:d971  a7 38         lda [$38]
$00:d973  e6 38         inc $38
$00:d975  29 ff 00      and #$00ff
$00:d978  20 17 e6      jsr $e617  ; -> Sub_00_e617
$00:d97b  a7 38         lda [$38]
$00:d97d  e6 38         inc $38
$00:d97f  29 ff 00      and #$00ff
$00:d982  20 28 e6      jsr $e628  ; -> Sub_00_e628
$00:d985  99 00 00      sta $0000,y
$00:d988  a7 38         lda [$38]
$00:d98a  e6 38         inc $38
$00:d98c  29 ff 00      and #$00ff
$00:d98f  20 28 e6      jsr $e628  ; -> Sub_00_e628
$00:d992  99 02 00      sta $0002,y
$00:d995  da            phx
$00:d996  bb            tyx
$00:d997  20 a7 e5      jsr $e5a7
$00:d99a  fa            plx
$00:d99b  82 21 0b      brl $e4bf
$00:d99e  bb            tyx
$00:d99f  a7 38         lda [$38]
$00:d9a1  e6 38         inc $38
$00:d9a3  29 ff 00      and #$00ff
$00:d9a6  20 17 e6      jsr $e617  ; -> Sub_00_e617
$00:d9a9  a7 38         lda [$38]
$00:d9ab  e6 38         inc $38
$00:d9ad  e6 38         inc $38
$00:d9af  99 18 00      sta $0018,y
$00:d9b2  82 0a 0b      brl $e4bf
$00:d9b5  bb            tyx
$00:d9b6  a7 38         lda [$38]
$00:d9b8  e6 38         inc $38
$00:d9ba  29 ff 00      and #$00ff
$00:d9bd  20 17 e6      jsr $e617  ; -> Sub_00_e617
$00:d9c0  a7 38         lda [$38]
$00:d9c2  e6 38         inc $38
$00:d9c4  e6 38         inc $38
$00:d9c6  99 30 00      sta $0030,y
$00:d9c9  82 f3 0a      brl $e4bf
$00:d9cc  bb            tyx
$00:d9cd  a7 38         lda [$38]
$00:d9cf  e6 38         inc $38
$00:d9d1  e6 38         inc $38
$00:d9d3  20 2d e6      jsr $e62d
$00:d9d6  a0 de         ldy #$de
$00:d9d8  1a            inc a
$00:d9d9  22 a2 f3 04   jsl $04f3a2  ; -> Sub_04_f3a2
$00:d9dd  90 12         bcc $d9f1
$00:d9df  bd 16 00      lda $0016,x
$00:d9e2  29 ff df      and #$dfff
$00:d9e5  9d 16 00      sta $0016,x
$00:d9e8  a7 38         lda [$38]
$00:d9ea  e6 38         inc $38
$00:d9ec  e6 38         inc $38
$00:d9ee  82 d0 0a      brl $e4c1
$00:d9f1  82 c7 0a      brl $e4bb
$00:d9f4  bb            tyx
$00:d9f5  20 37 e5      jsr $e537
$00:d9f8  82 c4 0a      brl $e4bf
$00:d9fb  bb            tyx
$00:d9fc  20 a7 e5      jsr $e5a7
$00:d9ff  82 bd 0a      brl $e4bf
$00:da02  bb            tyx
$00:da03  a7 38         lda [$38]
$00:da05  e6 38         inc $38
$00:da07  e6 38         inc $38
$00:da09  9d 30 00      sta $0030,x
$00:da0c  82 b0 0a      brl $e4bf
$00:da0f  bb            tyx
$00:da10  a7 38         lda [$38]
$00:da12  e6 38         inc $38
$00:da14  29 ff 00      and #$00ff
$00:da17  20 1e e5      jsr $e51e
$00:da1a  b0 03         bcs $da1f
$00:da1c  82 9c 0a      brl $e4bb
$00:da1f  a7 38         lda [$38]
$00:da21  e6 38         inc $38
$00:da23  e6 38         inc $38
$00:da25  82 99 0a      brl $e4c1
$00:da28  bb            tyx
$00:da29  a7 38         lda [$38]
$00:da2b  e6 38         inc $38
$00:da2d  29 ff 00      and #$00ff
$00:da30  20 1e e5      jsr $e51e
$00:da33  b0 05         bcs $da3a
$00:da35  10 03         bpl $da3a
$00:da37  82 81 0a      brl $e4bb
$00:da3a  a7 38         lda [$38]
$00:da3c  e6 38         inc $38
$00:da3e  e6 38         inc $38
$00:da40  82 7e 0a      brl $e4c1
$00:da43  bb            tyx
$00:da44  da            phx
$00:da45  a7 38         lda [$38]
$00:da47  e6 38         inc $38
$00:da49  e6 38         inc $38
$00:da4b  a8            tay
$00:da4c  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:da50  e2 20         sep #$20
$00:da52  a9 00         lda #$00
$00:da54  eb            xba
$00:da55  a7 38         lda [$38]
$00:da57  e6 38         inc $38
$00:da59  d0 02         bne $da5d
$00:da5b  e6 39         inc $39
$00:da5d  22 81 a2 02   jsl $02a281
$00:da61  48            pha
$00:da62  08            php
$00:da63  ae f7 03      ldx $03f7
$00:da66  22 da ab 02   jsl $02abda
$00:da6a  a9 01         lda #$01
$00:da6c  8d b8 03      sta $03b8
$00:da6f  28            plp
$00:da70  68            pla
$00:da71  c2 20         rep #$20
$00:da73  fa            plx
$00:da74  b0 09         bcs $da7f
$00:da76  29 ff 00      and #$00ff
$00:da79  8d d0 03      sta $03d0
$00:da7c  82 3c 0a      brl $e4bb
$00:da7f  a7 38         lda [$38]
$00:da81  e6 38         inc $38
$00:da83  e6 38         inc $38
$00:da85  82 39 0a      brl $e4c1
$00:da88  bb            tyx
$00:da89  a7 38         lda [$38]
$00:da8b  e6 38         inc $38
$00:da8d  e6 38         inc $38
$00:da8f  9d 18 00      sta $0018,x
$00:da92  a7 38         lda [$38]
$00:da94  e6 38         inc $38
$00:da96  e6 38         inc $38
$00:da98  9d 14 00      sta $0014,x
$00:da9b  82 2b 0a      brl $e4c9
$00:da9e  bb            tyx
$00:da9f  a7 38         lda [$38]
$00:daa1  e6 38         inc $38
$00:daa3  e6 38         inc $38
$00:daa5  3d 16 00      and $0016,x
$00:daa8  d0 03         bne $daad
$00:daaa  82 0e 0a      brl $e4bb
$00:daad  a7 38         lda [$38]
$00:daaf  e6 38         inc $38
$00:dab1  e6 38         inc $38
$00:dab3  82 0b 0a      brl $e4c1
$00:dab6  bb            tyx
$00:dab7  a7 38         lda [$38]
$00:dab9  e6 38         inc $38
$00:dabb  e6 38         inc $38
$00:dabd  1d 16 00      ora $0016,x
$00:dac0  9d 16 00      sta $0016,x
$00:dac3  82 f9 09      brl $e4bf
$00:dac6  bb            tyx
$00:dac7  a7 38         lda [$38]
$00:dac9  e6 38         inc $38
$00:dacb  e6 38         inc $38
$00:dacd  3d 16 00      and $0016,x
$00:dad0  9d 16 00      sta $0016,x
$00:dad3  82 e9 09      brl $e4bf
$00:dad6  5a            phy
$00:dad7  e2 20         sep #$20
$00:dad9  a2 0f         ldx #$0f
$00:dadb  00 a9         brk #$a9
$00:dadd  00 eb         brk #$eb
$00:dadf  18            clc
$00:dae0  bd 02 03      lda $0302,x
$00:dae3  7d 01 03      adc $0301,x
$00:dae6  9d 01 03      sta $0301,x
$00:dae9  ca            dex
$00:daea  d0 f4         bne $dae0
$00:daec  a2 10         ldx #$10
$00:daee  00 fe         brk #$fe
$00:daf0  01 03         ora ($03,x)
$00:daf2  d0 03         bne $daf7
$00:daf4  ca            dex
$00:daf5  d0 f8         bne $daef
$00:daf7  c2 20         rep #$20
$00:daf9  fa            plx
$00:dafa  82 c2 09      brl $e4bf
$00:dafd  bb            tyx
$00:dafe  ad 74 03      lda $0374
$00:db01  0d 76 03      ora $0376
$00:db04  29 0f 00      and #$000f
$00:db07  f0 09         beq $db12
$00:db09  a7 38         lda [$38]
$00:db0b  e6 38         inc $38
$00:db0d  e6 38         inc $38
$00:db0f  82 af 09      brl $e4c1
$00:db12  82 a6 09      brl $e4bb
$00:db15  bb            tyx
$00:db16  bd 00 00      lda $0000,x
$00:db19  85 16         sta $16
$00:db1b  bd 02 00      lda $0002,x
$00:db1e  38            sec
$00:db1f  e9 10 00      sbc #$0010
$00:db22  38            sec
$00:db23  fd 12 00      sbc $0012,x
$00:db26  85 18         sta $18
$00:db28  82 a5 00      brl $dbd0
$00:db2b  bb            tyx
$00:db2c  bd 00 00      lda $0000,x
$00:db2f  85 16         sta $16
$00:db31  bd 02 00      lda $0002,x
$00:db34  85 18         sta $18
$00:db36  82 97 00      brl $dbd0
$00:db39  bb            tyx
$00:db3a  bd 00 00      lda $0000,x
$00:db3d  38            sec
$00:db3e  e9 10 00      sbc #$0010
$00:db41  85 16         sta $16
$00:db43  bd 02 00      lda $0002,x
$00:db46  38            sec
$00:db47  e9 10 00      sbc #$0010
$00:db4a  85 18         sta $18
$00:db4c  82 81 00      brl $dbd0
$00:db4f  bb            tyx
$00:db50  bd 00 00      lda $0000,x
$00:db53  18            clc
$00:db54  7d 10 00      adc $0010,x
$00:db57  85 16         sta $16
$00:db59  bd 02 00      lda $0002,x
$00:db5c  38            sec
$00:db5d  e9 10 00      sbc #$0010
$00:db60  85 18         sta $18
$00:db62  82 6b 00      brl $dbd0
$00:db65  bb            tyx
$00:db66  a7 38         lda [$38]
$00:db68  e6 38         inc $38
$00:db6a  e6 38         inc $38
$00:db6c  22 a5 f6 04   jsl $04f6a5
$00:db70  a9 10 00      lda #$0010
$00:db73  0c 32 03      tsb $0332
$00:db76  82 46 09      brl $e4bf
$00:db79  bb            tyx
$00:db7a  a7 38         lda [$38]
$00:db7c  e6 38         inc $38
$00:db7e  e6 38         inc $38
$00:db80  ac 64 1b      ldy $1b64
$00:db83  c0 40         cpy #$40
$00:db85  00 d0         brk #$d0
$00:db87  05 a9         ora $a9
$00:db89  00 00         brk #$00
$00:db8b  80 0c         bra $db99
$00:db8d  ac 60 1b      ldy $1b60
$00:db90  c0 0c         cpy #$0c
$00:db92  00 d0         brk #$d0
$00:db94  04 4a         tsb $4a
$00:db96  d0 01         bne $db99
$00:db98  1a            inc a
$00:db99  22 c9 f6 04   jsl $04f6c9
$00:db9d  b0 09         bcs $dba8
$00:db9f  a9 10 00      lda #$0010
$00:dba2  0c 32 03      tsb $0332
$00:dba5  82 13 09      brl $e4bb
$00:dba8  a7 38         lda [$38]
$00:dbaa  e6 38         inc $38
$00:dbac  e6 38         inc $38
$00:dbae  82 10 09      brl $e4c1
$00:dbb1  bb            tyx
$00:dbb2  a7 38         lda [$38]
$00:dbb4  e6 38         inc $38
$00:dbb6  e6 38         inc $38
$00:dbb8  9d 18 00      sta $0018,x
$00:dbbb  9e 14 00      stz $0014,x
$00:dbbe  82 08 09      brl $e4c9
$00:dbc1  bb            tyx
$00:dbc2  bd 00 00      lda $0000,x
$00:dbc5  85 16         sta $16
$00:dbc7  bd 02 00      lda $0002,x
$00:dbca  38            sec
$00:dbcb  e9 10 00      sbc #$0010
$00:dbce  85 18         sta $18
$00:dbd0  da            phx
$00:dbd1  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:dbd5  bf 00 80 7f   lda $7f8000,x
$00:dbd9  fa            plx
$00:dbda  29 ff 00      and #$00ff
$00:dbdd  d0 03         bne $dbe2
$00:dbdf  82 d9 08      brl $e4bb
$00:dbe2  a7 38         lda [$38]
$00:dbe4  e6 38         inc $38
$00:dbe6  e6 38         inc $38
$00:dbe8  82 d6 08      brl $e4c1
$00:dbeb  bb            tyx
$00:dbec  bd 00 00      lda $0000,x
$00:dbef  85 16         sta $16
$00:dbf1  bd 02 00      lda $0002,x
$00:dbf4  38            sec
$00:dbf5  e9 10 00      sbc #$0010
$00:dbf8  85 18         sta $18
$00:dbfa  da            phx
$00:dbfb  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:dbff  e2 20         sep #$20
$00:dc01  a7 38         lda [$38]
$00:dc03  e6 38         inc $38
$00:dc05  d0 02         bne $dc09
$00:dc07  e6 39         inc $39
$00:dc09  df 00 80 7e   cmp $7e8000,x
$00:dc0d  c2 20         rep #$20
$00:dc0f  d0 04         bne $dc15
$00:dc11  fa            plx
$00:dc12  82 a6 08      brl $e4bb
$00:dc15  fa            plx
$00:dc16  a7 38         lda [$38]
$00:dc18  e6 38         inc $38
$00:dc1a  e6 38         inc $38
$00:dc1c  82 a2 08      brl $e4c1
$00:dc1f  bb            tyx
$00:dc20  da            phx
$00:dc21  a7 38         lda [$38]
$00:dc23  e6 38         inc $38
$00:dc25  e6 38         inc $38
$00:dc27  18            clc
$00:dc28  7d 00 00      adc $0000,x
$00:dc2b  85 16         sta $16
$00:dc2d  a7 38         lda [$38]
$00:dc2f  e6 38         inc $38
$00:dc31  e6 38         inc $38
$00:dc33  18            clc
$00:dc34  7d 02 00      adc $0002,x
$00:dc37  38            sec
$00:dc38  e9 10 00      sbc #$0010
$00:dc3b  85 18         sta $18
$00:dc3d  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:dc41  bf 00 80 7f   lda $7f8000,x
$00:dc45  09 f0 00      ora #$00f0
$00:dc48  9f 00 80 7f   sta $7f8000,x
$00:dc4c  fa            plx
$00:dc4d  82 6f 08      brl $e4bf
$00:dc50  bb            tyx
$00:dc51  da            phx
$00:dc52  a7 38         lda [$38]
$00:dc54  e6 38         inc $38
$00:dc56  e6 38         inc $38
$00:dc58  18            clc
$00:dc59  7d 00 00      adc $0000,x
$00:dc5c  85 16         sta $16
$00:dc5e  a7 38         lda [$38]
$00:dc60  e6 38         inc $38
$00:dc62  e6 38         inc $38
$00:dc64  18            clc
$00:dc65  7d 02 00      adc $0002,x
$00:dc68  38            sec
$00:dc69  e9 10 00      sbc #$0010
$00:dc6c  85 18         sta $18
$00:dc6e  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:dc72  bf 00 80 7f   lda $7f8000,x
$00:dc76  29 00 ff      and #$ff00
$00:dc79  9f 00 80 7f   sta $7f8000,x
$00:dc7d  fa            plx
$00:dc7e  82 3e 08      brl $e4bf
$00:dc81  bb            tyx
$00:dc82  a7 38         lda [$38]
$00:dc84  e6 38         inc $38
$00:dc86  29 ff 00      and #$00ff
$00:dc89  20 17 e6      jsr $e617  ; -> Sub_00_e617
$00:dc8c  a7 38         lda [$38]
$00:dc8e  e6 38         inc $38
$00:dc90  e6 38         inc $38
$00:dc92  85 00         sta $00
$00:dc94  82 29 fc      brl $d8c0
$00:dc97  bb            tyx
$00:dc98  a7 38         lda [$38]
$00:dc9a  e6 38         inc $38
$00:dc9c  e6 38         inc $38
$00:dc9e  85 16         sta $16
$00:dca0  a7 38         lda [$38]
$00:dca2  e6 38         inc $38
$00:dca4  e6 38         inc $38
$00:dca6  85 18         sta $18
$00:dca8  ac 9c 03      ldy $039c
$00:dcab  b9 00 00      lda $0000,y
$00:dcae  18            clc
$00:dcaf  65 16         adc $16
$00:dcb1  99 00 00      sta $0000,y
$00:dcb4  b9 02 00      lda $0002,y
$00:dcb7  18            clc
$00:dcb8  65 18         adc $18
$00:dcba  99 02 00      sta $0002,y
$00:dcbd  b9 3e 00      lda $003e,y
$00:dcc0  a8            tay
$00:dcc1  b9 00 00      lda $0000,y
$00:dcc4  18            clc
$00:dcc5  65 16         adc $16
$00:dcc7  99 00 00      sta $0000,y
$00:dcca  b9 02 00      lda $0002,y
$00:dccd  18            clc
$00:dcce  65 18         adc $18
$00:dcd0  99 02 00      sta $0002,y
$00:dcd3  82 e9 07      brl $e4bf
$00:dcd6  bb            tyx
$00:dcd7  ad fb 03      lda $03fb
$00:dcda  d0 03         bne $dcdf
$00:dcdc  82 d6 07      brl $e4b5
$00:dcdf  a7 38         lda [$38]
$00:dce1  e6 38         inc $38
$00:dce3  e6 38         inc $38
$00:dce5  cd 05 04      cmp $0405
$00:dce8  f0 03         beq $dced
$00:dcea  82 cc 07      brl $e4b9
$00:dced  82 fe 01      brl $deee
$00:dcf0  bb            tyx
$00:dcf1  20 62 e6      jsr $e662  ; -> Sub_00_e662
$00:dcf4  a9 9b ac      lda #$ac9b
$00:dcf7  99 18 00      sta $0018,y
$00:dcfa  e2 20         sep #$20
$00:dcfc  a9 00         lda #$00
$00:dcfe  99 36 00      sta $0036,y
$00:dd01  c2 20         rep #$20
$00:dd03  a7 38         lda [$38]
$00:dd05  e6 38         inc $38
$00:dd07  29 ff 00      and #$00ff
$00:dd0a  99 30 00      sta $0030,y
$00:dd0d  82 af 07      brl $e4bf
$00:dd10  bb            tyx
$00:dd11  20 62 e6      jsr $e662  ; -> Sub_00_e662
$00:dd14  a9 cb ac      lda #$accb
$00:dd17  99 18 00      sta $0018,y
$00:dd1a  e2 20         sep #$20
$00:dd1c  a9 00         lda #$00
$00:dd1e  99 36 00      sta $0036,y
$00:dd21  c2 20         rep #$20
$00:dd23  a7 38         lda [$38]
$00:dd25  e6 38         inc $38
$00:dd27  29 ff 00      and #$00ff
$00:dd2a  99 30 00      sta $0030,y
$00:dd2d  82 8f 07      brl $e4bf
$00:dd30  bb            tyx
$00:dd31  ac 9c 03      ldy $039c
$00:dd34  20 49 dd      jsr $dd49
$00:dd37  ac 9e 03      ldy $039e
$00:dd3a  20 49 dd      jsr $dd49
$00:dd3d  ac a0 03      ldy $03a0
$00:dd40  20 49 dd      jsr $dd49
$00:dd43  9c 64 04      stz $0464
$00:dd46  82 76 07      brl $e4bf
$00:dd49  b9 1a 00      lda $001a,y
$00:dd4c  29 7f ff      and #$ff7f
$00:dd4f  99 1a 00      sta $001a,y
$00:dd52  60            rts
$00:dd53  bb            tyx
$00:dd54  ac 9c 03      ldy $039c
$00:dd57  20 6c dd      jsr $dd6c
$00:dd5a  ac 9e 03      ldy $039e
$00:dd5d  20 6c dd      jsr $dd6c
$00:dd60  ac a0 03      ldy $03a0
$00:dd63  20 6c dd      jsr $dd6c
$00:dd66  ee 64 04      inc $0464
$00:dd69  82 53 07      brl $e4bf
$00:dd6c  b9 1a 00      lda $001a,y
$00:dd6f  09 80 00      ora #$0080
$00:dd72  99 1a 00      sta $001a,y
$00:dd75  60            rts
$00:dd76  bb            tyx
$00:dd77  a7 38         lda [$38]
$00:dd79  e6 38         inc $38
$00:dd7b  29 ff 00      and #$00ff
$00:dd7e  85 00         sta $00
$00:dd80  ad 02 03      lda $0302
$00:dd83  29 ff 00      and #$00ff
$00:dd86  38            sec
$00:dd87  e5 00         sbc $00
$00:dd89  10 fb         bpl $dd86
$00:dd8b  18            clc
$00:dd8c  65 00         adc $00
$00:dd8e  8d 37 04      sta $0437
$00:dd91  82 2b 07      brl $e4bf
$00:dd94  bb            tyx
$00:dd95  a7 38         lda [$38]
$00:dd97  e6 38         inc $38
$00:dd99  e6 38         inc $38
$00:dd9b  f8            sed
$00:dd9c  18            clc
$00:dd9d  6d 78 1b      adc $1b78
$00:dda0  8d 78 1b      sta $1b78
$00:dda3  ad 7a 1b      lda $1b7a
$00:dda6  69 00 00      adc #$0000
$00:dda9  8d 7a 1b      sta $1b7a
$00:ddac  d8            cld
$00:ddad  82 0f 07      brl $e4bf
$00:ddb0  bb            tyx
$00:ddb1  ad 8a 1b      lda $1b8a
$00:ddb4  38            sec
$00:ddb5  ed 88 1b      sbc $1b88
$00:ddb8  8d 3b 04      sta $043b
$00:ddbb  82 01 07      brl $e4bf
$00:ddbe  bb            tyx
$00:ddbf  a7 38         lda [$38]
$00:ddc1  e6 38         inc $38
$00:ddc3  e6 38         inc $38
$00:ddc5  8d 3d 04      sta $043d
$00:ddc8  82 f4 06      brl $e4bf
$00:ddcb  bb            tyx
$00:ddcc  da            phx
$00:ddcd  a7 38         lda [$38]
$00:ddcf  e6 38         inc $38
$00:ddd1  29 ff 00      and #$00ff
$00:ddd4  e2 20         sep #$20
$00:ddd6  48            pha
$00:ddd7  ad 88 1b      lda $1b88
$00:ddda  38            sec
$00:dddb  e3 01         sbc $01,s
$00:dddd  10 02         bpl $dde1
$00:dddf  a9 00         lda #$00
$00:dde1  8d 88 1b      sta $1b88
$00:dde4  68            pla
$00:dde5  c2 20         rep #$20
$00:dde7  a9 04 00      lda #$0004
$00:ddea  0c 32 03      tsb $0332
$00:dded  ae 9c 03      ldx $039c
$00:ddf0  a9 e0 ff      lda #$ffe0
$00:ddf3  9d 26 00      sta $0026,x
$00:ddf6  00 04         brk #$04
$00:ddf8  bd 16 00      lda $0016,x
$00:ddfb  09 00 08      ora #$0800
$00:ddfe  9d 16 00      sta $0016,x
$00:de01  fa            plx
$00:de02  82 ba 06      brl $e4bf
$00:de05  bb            tyx
$00:de06  22 ee a4 02   jsl $02a4ee
$00:de0a  82 b2 06      brl $e4bf
$00:de0d  bb            tyx
$00:de0e  a7 38         lda [$38]
$00:de10  20 2d e6      jsr $e62d
$00:de13  0a            asl a
$00:de14  0a            asl a
$00:de15  0a            asl a
$00:de16  0a            asl a
$00:de17  0a            asl a
$00:de18  a8            tay
$00:de19  b9 2b ba      lda $ba2b,y
$00:de1c  f0 09         beq $de27
$00:de1e  a0 de         ldy #$de
$00:de20  1a            inc a
$00:de21  22 a2 f3 04   jsl $04f3a2  ; -> Sub_04_f3a2
$00:de25  90 24         bcc $de4b
$00:de27  a7 38         lda [$38]
$00:de29  e6 38         inc $38
$00:de2b  e6 38         inc $38
$00:de2d  a0 de         ldy #$de
$00:de2f  1a            inc a
$00:de30  22 a2 f3 04   jsl $04f3a2  ; -> Sub_04_f3a2
$00:de34  90 12         bcc $de48
$00:de36  bd 16 00      lda $0016,x
$00:de39  29 ff df      and #$dfff
$00:de3c  9d 16 00      sta $0016,x
$00:de3f  a7 38         lda [$38]
$00:de41  e6 38         inc $38
$00:de43  e6 38         inc $38
$00:de45  82 79 06      brl $e4c1
$00:de48  82 7e 06      brl $e4c9
$00:de4b  a7 38         lda [$38]
$00:de4d  e6 38         inc $38
$00:de4f  e6 38         inc $38
$00:de51  9d 34 00      sta $0034,x
$00:de54  da            phx
$00:de55  aa            tax
$00:de56  bf 03 02 7f   lda $7f0203,x
$00:de5a  fa            plx
$00:de5b  89 40 00      bit #$0040
$00:de5e  f0 e8         beq $de48
$00:de60  bd 16 00      lda $0016,x
$00:de63  09 10 00      ora #$0010
$00:de66  9d 16 00      sta $0016,x
$00:de69  82 4f 06      brl $e4bb
$00:de6c  bb            tyx
$00:de6d  a7 38         lda [$38]
$00:de6f  e6 38         inc $38
$00:de71  29 ff 00      and #$00ff
$00:de74  8d e3 03      sta $03e3
$00:de77  82 45 06      brl $e4bf
$00:de7a  bb            tyx
$00:de7b  a7 38         lda [$38]
$00:de7d  e6 38         inc $38
$00:de7f  29 ff 00      and #$00ff
$00:de82  9d 1e 00      sta $001e,x
$00:de85  9e 20 00      stz $0020,x
$00:de88  a5 38         lda $38
$00:de8a  9d 18 00      sta $0018,x
$00:de8d  82 2f 06      brl $e4bf
$00:de90  bb            tyx
$00:de91  a7 38         lda [$38]
$00:de93  e6 38         inc $38
$00:de95  29 ff 00      and #$00ff
$00:de98  9d 1e 00      sta $001e,x
$00:de9b  9e 20 00      stz $0020,x
$00:de9e  a7 38         lda [$38]
$00:dea0  e6 38         inc $38
$00:dea2  29 ff 00      and #$00ff
$00:dea5  9d 2a 00      sta $002a,x
$00:dea8  a5 38         lda $38
$00:deaa  9d 18 00      sta $0018,x
$00:dead  82 0f 06      brl $e4bf
$00:deb0  bb            tyx
$00:deb1  22 f3 88 00   jsl $0088f3  ; -> Sub_00_88f3
$00:deb5  90 03         bcc $deba
$00:deb7  82 05 06      brl $e4bf
$00:deba  82 0c 06      brl $e4c9
$00:debd  bb            tyx
$00:debe  22 f3 88 00   jsl $0088f3  ; -> Sub_00_88f3
$00:dec2  90 08         bcc $decc
$00:dec4  de 2a 00      dec $002a,x
$00:dec7  d0 f5         bne $debe
$00:dec9  82 f3 05      brl $e4bf
$00:decc  82 fa 05      brl $e4c9
$00:decf  bb            tyx
$00:ded0  20 3a e6      jsr $e63a
$00:ded3  a7 38         lda [$38]
$00:ded5  e6 38         inc $38
$00:ded7  e6 38         inc $38
$00:ded9  99 18 00      sta $0018,y
$00:dedc  8a            txa
$00:dedd  a7 38         lda [$38]
$00:dedf  e6 38         inc $38
$00:dee1  29 ff 00      and #$00ff
$00:dee4  e2 20         sep #$20
$00:dee6  99 36 00      sta $0036,y
$00:dee9  c2 20         rep #$20
$00:deeb  82 d1 05      brl $e4bf
$00:deee  bb            tyx
$00:deef  20 62 e6      jsr $e662  ; -> Sub_00_e662
$00:def2  a7 38         lda [$38]
$00:def4  e6 38         inc $38
$00:def6  e6 38         inc $38
$00:def8  99 18 00      sta $0018,y
$00:defb  8a            txa
$00:defc  a7 38         lda [$38]
$00:defe  e6 38         inc $38
$00:df00  29 ff 00      and #$00ff
$00:df03  e2 20         sep #$20
$00:df05  99 36 00      sta $0036,y
$00:df08  c2 20         rep #$20
$00:df0a  82 b2 05      brl $e4bf
$00:df0d  bb            tyx
$00:df0e  bc 3c 00      ldy $003c,x
$00:df11  d0 10         bne $df23
Sub_00_df13:
$00:df13  bc 3e 00      ldy $003e,x
$00:df16  8c a6 06      sty $06a6
$00:df19  f0 1c         beq $df37
$00:df1b  a9 00 00      lda #$0000
$00:df1e  99 3c 00      sta $003c,y
$00:df21  80 14         bra $df37
$00:df23  bd 3e 00      lda $003e,x
$00:df26  99 3e 00      sta $003e,y
$00:df29  d0 05         bne $df30
$00:df2b  8c a8 06      sty $06a8
$00:df2e  80 07         bra $df37
$00:df30  a8            tay
$00:df31  bd 3c 00      lda $003c,x
$00:df34  99 3c 00      sta $003c,y
$00:df37  e2 20         sep #$20
$00:df39  c6 4a         dec $4a
$00:df3b  c6 4a         dec $4a
$00:df3d  c2 20         rep #$20
$00:df3f  8a            txa
$00:df40  92 4a         sta ($4a)
$00:df42  82 7a 05      brl $e4bf
$00:df45  bb            tyx
$00:df46  bd 1c 00      lda $001c,x
$00:df49  49 00 40      eor #$4000
$00:df4c  9d 1c 00      sta $001c,x
$00:df4f  82 6d 05      brl $e4bf
$00:df52  bb            tyx
$00:df53  bd 1c 00      lda $001c,x
$00:df56  49 00 80      eor #$8000
$00:df59  9d 1c 00      sta $001c,x
$00:df5c  82 60 05      brl $e4bf
$00:df5f  bb            tyx
$00:df60  ad 74 03      lda $0374
$00:df63  38            sec
$00:df64  fd 00 00      sbc $0000,x
$00:df67  10 04         bpl $df6d
$00:df69  49 ff ff      eor #$ffff
$00:df6c  1a            inc a
$00:df6d  85 00         sta $00
$00:df6f  a7 38         lda [$38]
$00:df71  e6 38         inc $38
$00:df73  e6 38         inc $38
$00:df75  c5 00         cmp $00
$00:df77  b0 03         bcs $df7c
$00:df79  82 3f 05      brl $e4bb
$00:df7c  a7 38         lda [$38]
$00:df7e  e6 38         inc $38
$00:df80  e6 38         inc $38
$00:df82  82 3c 05      brl $e4c1
$00:df85  bb            tyx
$00:df86  ad 76 03      lda $0376
$00:df89  38            sec
$00:df8a  fd 02 00      sbc $0002,x
$00:df8d  10 04         bpl $df93
$00:df8f  49 ff ff      eor #$ffff
$00:df92  1a            inc a
$00:df93  85 00         sta $00
$00:df95  a7 38         lda [$38]
$00:df97  e6 38         inc $38
$00:df99  e6 38         inc $38
$00:df9b  c5 00         cmp $00
$00:df9d  b0 03         bcs $dfa2
$00:df9f  82 19 05      brl $e4bb
$00:dfa2  a7 38         lda [$38]
$00:dfa4  e6 38         inc $38
$00:dfa6  e6 38         inc $38
$00:dfa8  82 16 05      brl $e4c1
$00:dfab  bb            tyx
$00:dfac  ad 74 03      lda $0374
$00:dfaf  38            sec
$00:dfb0  fd 00 00      sbc $0000,x
$00:dfb3  10 04         bpl $dfb9
$00:dfb5  49 ff ff      eor #$ffff
$00:dfb8  1a            inc a
$00:dfb9  85 00         sta $00
$00:dfbb  a7 38         lda [$38]
$00:dfbd  e6 38         inc $38
$00:dfbf  e6 38         inc $38
$00:dfc1  c5 00         cmp $00
$00:dfc3  90 03         bcc $dfc8
$00:dfc5  82 f3 04      brl $e4bb
$00:dfc8  a7 38         lda [$38]
$00:dfca  e6 38         inc $38
$00:dfcc  e6 38         inc $38
$00:dfce  82 f0 04      brl $e4c1
$00:dfd1  bb            tyx
$00:dfd2  ad 76 03      lda $0376
$00:dfd5  38            sec
$00:dfd6  fd 02 00      sbc $0002,x
$00:dfd9  10 04         bpl $dfdf
$00:dfdb  49 ff ff      eor #$ffff
$00:dfde  1a            inc a
$00:dfdf  85 00         sta $00
$00:dfe1  a7 38         lda [$38]
$00:dfe3  e6 38         inc $38
$00:dfe5  e6 38         inc $38
$00:dfe7  c5 00         cmp $00
$00:dfe9  90 03         bcc $dfee
$00:dfeb  82 cd 04      brl $e4bb
$00:dfee  a7 38         lda [$38]
$00:dff0  e6 38         inc $38
$00:dff2  e6 38         inc $38
$00:dff4  82 ca 04      brl $e4c1
$00:dff7  bb            tyx
$00:dff8  bd 16 00      lda $0016,x
$00:dffb  89 00 80      bit #$8000
$00:dffe  f0 03         beq $e003
$00:e000  82 bc 04      brl $e4bf
$00:e003  a7 38         lda [$38]
$00:e005  e6 38         inc $38
$00:e007  e6 38         inc $38
$00:e009  82 b5 04      brl $e4c1
$00:e00c  bb            tyx
$00:e00d  bd 16 00      lda $0016,x
$00:e010  89 00 80      bit #$8000
$00:e013  d0 03         bne $e018
$00:e015  82 a7 04      brl $e4bf
$00:e018  a7 38         lda [$38]
$00:e01a  e6 38         inc $38
$00:e01c  e6 38         inc $38
$00:e01e  82 a0 04      brl $e4c1
$00:e021  bb            tyx
$00:e022  ad 74 03      lda $0374
$00:e025  dd 00 00      cmp $0000,x
$00:e028  90 0c         bcc $e036
$00:e02a  bd 1c 00      lda $001c,x
$00:e02d  09 00 40      ora #$4000
$00:e030  9d 1c 00      sta $001c,x
$00:e033  82 89 04      brl $e4bf
$00:e036  bd 1c 00      lda $001c,x
$00:e039  29 ff bf      and #$bfff
$00:e03c  9d 1c 00      sta $001c,x
$00:e03f  82 7d 04      brl $e4bf
$00:e042  bb            tyx
$00:e043  ad 76 03      lda $0376
$00:e046  dd 02 00      cmp $0002,x
$00:e049  90 0c         bcc $e057
$00:e04b  bd 1c 00      lda $001c,x
$00:e04e  09 00 80      ora #$8000
$00:e051  9d 1c 00      sta $001c,x
$00:e054  82 68 04      brl $e4bf
$00:e057  bd 1c 00      lda $001c,x
$00:e05a  29 ff 7f      and #$7fff
$00:e05d  9d 1c 00      sta $001c,x
$00:e060  82 5c 04      brl $e4bf
$00:e063  bb            tyx
$00:e064  e2 20         sep #$20
$00:e066  a5 3a         lda $3a
$00:e068  9d 36 00      sta $0036,x
$00:e06b  c2 20         rep #$20
$00:e06d  a5 38         lda $38
$00:e06f  9d 18 00      sta $0018,x
$00:e072  82 4c 04      brl $e4c1
$00:e075  bb            tyx
$00:e076  a7 38         lda [$38]
$00:e078  e6 38         inc $38
$00:e07a  29 ff 00      and #$00ff
$00:e07d  9d 1e 00      sta $001e,x
$00:e080  9e 20 00      stz $0020,x
$00:e083  22 5b 86 02   jsl $02865b
$00:e087  22 cd 86 02   jsl $0286cd
$00:e08b  82 36 04      brl $e4c4
$00:e08e  bb            tyx
$00:e08f  a7 38         lda [$38]
$00:e091  e6 38         inc $38
$00:e093  29 ff 00      and #$00ff
$00:e096  9d 1e 00      sta $001e,x
$00:e099  9e 20 00      stz $0020,x
$00:e09c  a7 38         lda [$38]
$00:e09e  e6 38         inc $38
$00:e0a0  29 ff 00      and #$00ff
$00:e0a3  9d 2a 00      sta $002a,x
$00:e0a6  22 5b 86 02   jsl $02865b
$00:e0aa  22 cd 86 02   jsl $0286cd
$00:e0ae  82 13 04      brl $e4c4
$00:e0b1  bb            tyx
$00:e0b2  de 26 00      dec $0026,x
$00:e0b5  10 09         bpl $e0c0
$00:e0b7  22 5b 86 02   jsl $02865b
$00:e0bb  90 09         bcc $e0c6
$00:e0bd  82 ff 03      brl $e4bf
$00:e0c0  bd 0e 00      lda $000e,x
$00:e0c3  9d 14 00      sta $0014,x
$00:e0c6  22 cd 86 02   jsl $0286cd
$00:e0ca  82 fc 03      brl $e4c9
$00:e0cd  bb            tyx
$00:e0ce  de 26 00      dec $0026,x
$00:e0d1  10 0e         bpl $e0e1
$00:e0d3  22 5b 86 02   jsl $02865b
$00:e0d7  90 0e         bcc $e0e7
$00:e0d9  de 2a 00      dec $002a,x
$00:e0dc  d0 f5         bne $e0d3
$00:e0de  82 de 03      brl $e4bf
$00:e0e1  bd 0e 00      lda $000e,x
$00:e0e4  9d 14 00      sta $0014,x
$00:e0e7  22 cd 86 02   jsl $0286cd
$00:e0eb  82 db 03      brl $e4c9
$00:e0ee  bb            tyx
$00:e0ef  bd 1c 00      lda $001c,x
$00:e0f2  89 00 40      bit #$4000
$00:e0f5  d0 06         bne $e0fd
$00:e0f7  09 00 40      ora #$4000
$00:e0fa  9d 1c 00      sta $001c,x
$00:e0fd  82 bf 03      brl $e4bf
$00:e100  bb            tyx
$00:e101  bd 1c 00      lda $001c,x
$00:e104  89 00 40      bit #$4000
$00:e107  f0 06         beq $e10f
$00:e109  29 ff bf      and #$bfff
$00:e10c  9d 1c 00      sta $001c,x
$00:e10f  82 ad 03      brl $e4bf
$00:e112  bb            tyx
$00:e113  bd 1c 00      lda $001c,x
$00:e116  89 00 80      bit #$8000
$00:e119  d0 06         bne $e121
$00:e11b  09 00 80      ora #$8000
$00:e11e  9d 1c 00      sta $001c,x
$00:e121  82 9b 03      brl $e4bf
$00:e124  bb            tyx
$00:e125  bd 1c 00      lda $001c,x
$00:e128  89 00 80      bit #$8000
$00:e12b  f0 06         beq $e133
$00:e12d  29 ff 7f      and #$7fff
$00:e130  9d 1c 00      sta $001c,x
$00:e133  82 89 03      brl $e4bf
$00:e136  bb            tyx
$00:e137  a0 04         ldy #$04
$00:e139  00 ad         brk #$ad
$00:e13b  74 03         stz $03,x
$00:e13d  38            sec
$00:e13e  fd 00 00      sbc $0000,x
$00:e141  f0 15         beq $e158
$00:e143  10 0c         bpl $e151
$00:e145  49 ff ff      eor #$ffff
$00:e148  c7 38         cmp [$38]
$00:e14a  90 0c         bcc $e158
$00:e14c  a0 02         ldy #$02
$00:e14e  00 80         brk #$80
$00:e150  07 c7         ora [$c7]
$00:e152  38            sec
$00:e153  90 03         bcc $e158
$00:e155  a0 06         ldy #$06
$00:e157  00 b7         brk #$b7
$00:e159  38            sec
$00:e15a  82 64 03      brl $e4c1
$00:e15d  bb            tyx
$00:e15e  a0 04         ldy #$04
$00:e160  00 ad         brk #$ad
$00:e162  76 03         ror $03,x
$00:e164  38            sec
$00:e165  fd 02 00      sbc $0002,x
$00:e168  f0 15         beq $e17f
$00:e16a  10 0c         bpl $e178
$00:e16c  49 ff ff      eor #$ffff
$00:e16f  c7 38         cmp [$38]
$00:e171  90 0c         bcc $e17f
$00:e173  a0 02         ldy #$02
$00:e175  00 80         brk #$80
$00:e177  07 c7         ora [$c7]
$00:e179  38            sec
$00:e17a  90 03         bcc $e17f
$00:e17c  a0 06         ldy #$06
$00:e17e  00 b7         brk #$b7
$00:e180  38            sec
$00:e181  82 3d 03      brl $e4c1
$00:e184  bb            tyx
$00:e185  a0 00         ldy #$00
$00:e187  00 ad         brk #$ad
$00:e189  74 03         stz $03,x
$00:e18b  38            sec
$00:e18c  fd 00 00      sbc $0000,x
$00:e18f  10 04         bpl $e195
$00:e191  49 ff ff      eor #$ffff
$00:e194  1a            inc a
$00:e195  48            pha
$00:e196  ad 76 03      lda $0376
$00:e199  38            sec
$00:e19a  fd 02 00      sbc $0002,x
$00:e19d  10 04         bpl $e1a3
$00:e19f  49 ff ff      eor #$ffff
$00:e1a2  1a            inc a
$00:e1a3  c3 01         cmp $01,s
$00:e1a5  90 05         bcc $e1ac
$00:e1a7  a0 02         ldy #$02
$00:e1a9  00 80         brk #$80
$00:e1ab  00 68         brk #$68
$00:e1ad  b7 38         lda [$38],y
$00:e1af  82 0f 03      brl $e4c1
$00:e1b2  bb            tyx
$00:e1b3  a7 38         lda [$38]
$00:e1b5  e6 38         inc $38
$00:e1b7  29 ff 00      and #$00ff
$00:e1ba  9d 1e 00      sta $001e,x
$00:e1bd  9e 20 00      stz $0020,x
$00:e1c0  a5 38         lda $38
$00:e1c2  9d 18 00      sta $0018,x
$00:e1c5  bd 16 00      lda $0016,x
$00:e1c8  29 fb ff      and #$fffb
Sub_00_e1cb:
$00:e1cb  9d 16 00      sta $0016,x
$00:e1ce  82 ee 02      brl $e4bf
$00:e1d1  bb            tyx
$00:e1d2  bd 16 00      lda $0016,x
$00:e1d5  89 04 00      bit #$0004
$00:e1d8  d0 0c         bne $e1e6
$00:e1da  22 f3 88 00   jsl $0088f3  ; -> Sub_00_88f3
$00:e1de  90 03         bcc $e1e3
$00:e1e0  82 d8 02      brl $e4bb
$00:e1e3  82 e3 02      brl $e4c9
$00:e1e6  a7 38         lda [$38]
$00:e1e8  e6 38         inc $38
$00:e1ea  e6 38         inc $38
$00:e1ec  82 d2 02      brl $e4c1
$00:e1ef  bb            tyx
$00:e1f0  a7 38         lda [$38]
$00:e1f2  e6 38         inc $38
$00:e1f4  e6 38         inc $38
$00:e1f6  18            clc
$00:e1f7  7d 00 00      adc $0000,x
$00:e1fa  9d 00 00      sta $0000,x
$00:e1fd  82 bf 02      brl $e4bf
$00:e200  bb            tyx
$00:e201  a7 38         lda [$38]
$00:e203  e6 38         inc $38
$00:e205  e6 38         inc $38
$00:e207  18            clc
$00:e208  7d 02 00      adc $0002,x
$00:e20b  9d 02 00      sta $0002,x
$00:e20e  82 ae 02      brl $e4bf
$00:e211  bb            tyx
$00:e212  a7 38         lda [$38]
$00:e214  e6 38         inc $38
$00:e216  e6 38         inc $38
$00:e218  18            clc
$00:e219  7d 00 00      adc $0000,x
$00:e21c  9d 00 00      sta $0000,x
$00:e21f  a7 38         lda [$38]
$00:e221  e6 38         inc $38
$00:e223  e6 38         inc $38
$00:e225  18            clc
$00:e226  7d 02 00      adc $0002,x
$00:e229  9d 02 00      sta $0002,x
$00:e22c  82 90 02      brl $e4bf
$00:e22f  bb            tyx
$00:e230  bd 1c 00      lda $001c,x
$00:e233  29 ff cf      and #$cfff
$00:e236  48            pha
$00:e237  a7 38         lda [$38]
$00:e239  e6 38         inc $38
$00:e23b  29 ff 00      and #$00ff
$00:e23e  eb            xba
$00:e23f  03 01         ora $01,s
$00:e241  9d 1c 00      sta $001c,x
$00:e244  68            pla
$00:e245  82 77 02      brl $e4bf
$00:e248  bb            tyx
$00:e249  bd 1a 00      lda $001a,x
$00:e24c  09 00 40      ora #$4000
$00:e24f  9d 1a 00      sta $001a,x
$00:e252  82 6a 02      brl $e4bf
$00:e255  bb            tyx
$00:e256  bd 1a 00      lda $001a,x
$00:e259  09 00 20      ora #$2000
$00:e25c  9d 1a 00      sta $001a,x
$00:e25f  82 5d 02      brl $e4bf
$00:e262  bb            tyx
$00:e263  bd 1c 00      lda $001c,x
$00:e266  48            pha
$00:e267  29 ff 3f      and #$3fff
$00:e26a  9d 1c 00      sta $001c,x
$00:e26d  68            pla
$00:e26e  a0 00         ldy #$00
$00:e270  00 29         brk #$29
$00:e272  00 c0         brk #$c0
$00:e274  f0 10         beq $e286
$00:e276  c8            iny
$00:e277  c8            iny
$00:e278  c9 00 40      cmp #$4000
$00:e27b  f0 09         beq $e286
$00:e27d  c8            iny
$00:e27e  c8            iny
$00:e27f  c9 00 80      cmp #$8000
$00:e282  f0 02         beq $e286
$00:e284  c8            iny
$00:e285  c8            iny
$00:e286  b7 38         lda [$38],y
$00:e288  82 36 02      brl $e4c1
$00:e28b  bb            tyx
$00:e28c  bd 1a 00      lda $001a,x
$00:e28f  29 ff bf      and #$bfff
$00:e292  9d 1a 00      sta $001a,x
$00:e295  82 27 02      brl $e4bf
$00:e298  bb            tyx
$00:e299  bd 1a 00      lda $001a,x
$00:e29c  29 ff df      and #$dfff
$00:e29f  9d 1a 00      sta $001a,x
$00:e2a2  82 1a 02      brl $e4bf
$00:e2a5  bb            tyx
$00:e2a6  a7 38         lda [$38]
$00:e2a8  e6 38         inc $38
$00:e2aa  e6 38         inc $38
$00:e2ac  9d 22 00      sta $0022,x
$00:e2af  e2 20         sep #$20
$00:e2b1  a7 38         lda [$38]
$00:e2b3  e6 38         inc $38
$00:e2b5  d0 02         bne $e2b9
$00:e2b7  e6 39         inc $39
$00:e2b9  9d 24 00      sta $0024,x
$00:e2bc  c2 20         rep #$20
$00:e2be  82 fe 01      brl $e4bf
$00:e2c1  bb            tyx
$00:e2c2  a7 38         lda [$38]
$00:e2c4  e6 38         inc $38
$00:e2c6  e6 38         inc $38
$00:e2c8  9d 34 00      sta $0034,x
$00:e2cb  e2 20         sep #$20
$00:e2cd  a7 38         lda [$38]
$00:e2cf  e6 38         inc $38
$00:e2d1  d0 02         bne $e2d5
$00:e2d3  e6 39         inc $39
$00:e2d5  9d 2c 00      sta $002c,x
$00:e2d8  c2 20         rep #$20
$00:e2da  bd 1a 00      lda $001a,x
$00:e2dd  09 00 80      ora #$8000
$00:e2e0  9d 1a 00      sta $001a,x
$00:e2e3  82 d9 01      brl $e4bf
$00:e2e6  bb            tyx
$00:e2e7  bd 1c 00      lda $001c,x
$00:e2ea  29 ff f1      and #$f1ff
$00:e2ed  48            pha
$00:e2ee  a7 38         lda [$38]
$00:e2f0  e6 38         inc $38
$00:e2f2  29 ff 00      and #$00ff
$00:e2f5  eb            xba
$00:e2f6  03 01         ora $01,s
$00:e2f8  9d 1c 00      sta $001c,x
$00:e2fb  68            pla
$00:e2fc  82 c0 01      brl $e4bf
$00:e2ff  bb            tyx
$00:e300  20 3a e6      jsr $e63a
$00:e303  a7 38         lda [$38]
$00:e305  e6 38         inc $38
$00:e307  e6 38         inc $38
$00:e309  99 18 00      sta $0018,y
$00:e30c  8a            txa
$00:e30d  a7 38         lda [$38]
$00:e30f  e6 38         inc $38
$00:e311  29 ff 00      and #$00ff
$00:e314  e2 20         sep #$20
$00:e316  99 36 00      sta $0036,y
$00:e319  c2 20         rep #$20
$00:e31b  a7 38         lda [$38]
$00:e31d  e6 38         inc $38
$00:e31f  e6 38         inc $38
$00:e321  99 00 00      sta $0000,y
$00:e324  a7 38         lda [$38]
$00:e326  e6 38         inc $38
$00:e328  e6 38         inc $38
$00:e32a  99 02 00      sta $0002,y
$00:e32d  a7 38         lda [$38]
$00:e32f  e6 38         inc $38
$00:e331  e6 38         inc $38
$00:e333  99 16 00      sta $0016,y
$00:e336  82 86 01      brl $e4bf
$00:e339  bb            tyx
$00:e33a  20 62 e6      jsr $e662  ; -> Sub_00_e662
$00:e33d  a7 38         lda [$38]
$00:e33f  e6 38         inc $38
$00:e341  e6 38         inc $38
$00:e343  99 18 00      sta $0018,y
$00:e346  8a            txa
$00:e347  a7 38         lda [$38]
$00:e349  e6 38         inc $38
$00:e34b  29 ff 00      and #$00ff
$00:e34e  e2 20         sep #$20
$00:e350  99 36 00      sta $0036,y
$00:e353  c2 20         rep #$20
$00:e355  a7 38         lda [$38]
$00:e357  e6 38         inc $38
$00:e359  e6 38         inc $38
$00:e35b  99 00 00      sta $0000,y
$00:e35e  a7 38         lda [$38]
$00:e360  e6 38         inc $38
$00:e362  e6 38         inc $38
$00:e364  99 02 00      sta $0002,y
$00:e367  a7 38         lda [$38]
$00:e369  e6 38         inc $38
$00:e36b  e6 38         inc $38
$00:e36d  99 16 00      sta $0016,y
$00:e370  82 4c 01      brl $e4bf
$00:e373  bb            tyx
$00:e374  bd 16 00      lda $0016,x
$00:e377  89 00 80      bit #$8000
$00:e37a  d0 03         bne $e37f
$00:e37c  82 3e 01      brl $e4bd
$00:e37f  bd 00 00      lda $0000,x
$00:e382  cd 42 03      cmp $0342
$00:e385  90 03         bcc $e38a
$00:e387  82 33 01      brl $e4bd
$00:e38a  bd 02 00      lda $0002,x
$00:e38d  cd 44 03      cmp $0344
$00:e390  90 03         bcc $e395
$00:e392  82 28 01      brl $e4bd
$00:e395  a5 38         lda $38
$00:e397  3a            dec a
$00:e398  3a            dec a
$00:e399  9d 18 00      sta $0018,x
$00:e39c  a7 38         lda [$38]
$00:e39e  e6 38         inc $38
$00:e3a0  29 ff 00      and #$00ff
$00:e3a3  9d 14 00      sta $0014,x
$00:e3a6  82 20 01      brl $e4c9
$00:e3a9  bb            tyx
$00:e3aa  da            phx
$00:e3ab  a7 38         lda [$38]
$00:e3ad  e6 38         inc $38
$00:e3af  e6 38         inc $38
$00:e3b1  18            clc
$00:e3b2  7d 00 00      adc $0000,x
$00:e3b5  85 16         sta $16
$00:e3b7  a7 38         lda [$38]
$00:e3b9  e6 38         inc $38
$00:e3bb  e6 38         inc $38
$00:e3bd  18            clc
$00:e3be  7d 02 00      adc $0002,x
$00:e3c1  38            sec
$00:e3c2  e9 10 00      sbc #$0010
$00:e3c5  85 18         sta $18
$00:e3c7  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:e3cb  bf 00 80 7f   lda $7f8000,x
$00:e3cf  fa            plx
$00:e3d0  29 0f 00      and #$000f
$00:e3d3  f0 09         beq $e3de
$00:e3d5  a7 38         lda [$38]
$00:e3d7  e6 38         inc $38
$00:e3d9  e6 38         inc $38
$00:e3db  82 e3 00      brl $e4c1
$00:e3de  82 da 00      brl $e4bb
$00:e3e1  bb            tyx
$00:e3e2  20 3a e6      jsr $e63a
$00:e3e5  a7 38         lda [$38]
$00:e3e7  e6 38         inc $38
$00:e3e9  e6 38         inc $38
$00:e3eb  99 18 00      sta $0018,y
$00:e3ee  8a            txa
$00:e3ef  a7 38         lda [$38]
$00:e3f1  e6 38         inc $38
$00:e3f3  29 ff 00      and #$00ff
$00:e3f6  e2 20         sep #$20
$00:e3f8  99 36 00      sta $0036,y
$00:e3fb  c2 20         rep #$20
$00:e3fd  a7 38         lda [$38]
$00:e3ff  e6 38         inc $38
$00:e401  e6 38         inc $38
$00:e403  99 16 00      sta $0016,y
$00:e406  82 b6 00      brl $e4bf
$00:e409  bb            tyx
$00:e40a  20 62 e6      jsr $e662  ; -> Sub_00_e662
$00:e40d  a7 38         lda [$38]
$00:e40f  e6 38         inc $38
$00:e411  e6 38         inc $38
$00:e413  99 18 00      sta $0018,y
$00:e416  8a            txa
$00:e417  a7 38         lda [$38]
$00:e419  e6 38         inc $38
$00:e41b  29 ff 00      and #$00ff
$00:e41e  e2 20         sep #$20
$00:e420  99 36 00      sta $0036,y
$00:e423  c2 20         rep #$20
$00:e425  a7 38         lda [$38]
$00:e427  e6 38         inc $38
$00:e429  e6 38         inc $38
$00:e42b  99 16 00      sta $0016,y
$00:e42e  82 8e 00      brl $e4bf
$00:e431  bb            tyx
$00:e432  20 3a e6      jsr $e63a
$00:e435  a7 38         lda [$38]
$00:e437  e6 38         inc $38
$00:e439  e6 38         inc $38
$00:e43b  99 18 00      sta $0018,y
$00:e43e  8a            txa
$00:e43f  a7 38         lda [$38]
$00:e441  e6 38         inc $38
$00:e443  29 ff 00      and #$00ff
$00:e446  e2 20         sep #$20
$00:e448  99 36 00      sta $0036,y
$00:e44b  c2 20         rep #$20
$00:e44d  a7 38         lda [$38]
$00:e44f  e6 38         inc $38
$00:e451  e6 38         inc $38
$00:e453  18            clc
$00:e454  7d 00 00      adc $0000,x
$00:e457  99 00 00      sta $0000,y
$00:e45a  a7 38         lda [$38]
$00:e45c  e6 38         inc $38
$00:e45e  e6 38         inc $38
$00:e460  18            clc
$00:e461  7d 02 00      adc $0002,x
$00:e464  99 02 00      sta $0002,y
$00:e467  a7 38         lda [$38]
$00:e469  e6 38         inc $38
$00:e46b  e6 38         inc $38
$00:e46d  99 16 00      sta $0016,y
$00:e470  82 4c 00      brl $e4bf
$00:e473  bb            tyx
$00:e474  20 62 e6      jsr $e662  ; -> Sub_00_e662
$00:e477  a7 38         lda [$38]
$00:e479  e6 38         inc $38
$00:e47b  e6 38         inc $38
$00:e47d  99 18 00      sta $0018,y
$00:e480  8a            txa
$00:e481  a7 38         lda [$38]
$00:e483  e6 38         inc $38
$00:e485  29 ff 00      and #$00ff
$00:e488  e2 20         sep #$20
$00:e48a  99 36 00      sta $0036,y
$00:e48d  c2 20         rep #$20
$00:e48f  a7 38         lda [$38]
$00:e491  e6 38         inc $38
$00:e493  e6 38         inc $38
$00:e495  18            clc
$00:e496  7d 00 00      adc $0000,x
$00:e499  99 00 00      sta $0000,y
$00:e49c  a7 38         lda [$38]
$00:e49e  e6 38         inc $38
$00:e4a0  e6 38         inc $38
$00:e4a2  18            clc
$00:e4a3  7d 02 00      adc $0002,x
$00:e4a6  99 02 00      sta $0002,y
$00:e4a9  a7 38         lda [$38]
$00:e4ab  e6 38         inc $38
$00:e4ad  e6 38         inc $38
$00:e4af  99 16 00      sta $0016,y
$00:e4b2  82 0a 00      brl $e4bf
$00:e4b5  e6 38         inc $38
$00:e4b7  e6 38         inc $38
$00:e4b9  e6 38         inc $38
$00:e4bb  e6 38         inc $38
$00:e4bd  e6 38         inc $38
$00:e4bf  a5 38         lda $38
$00:e4c1  83 02         sta $02,s
$00:e4c3  40            rti
$00:e4c4  a5 38         lda $38
$00:e4c6  9d 18 00      sta $0018,x
$00:e4c9  68            pla
$00:e4ca  68            pla
$00:e4cb  6b            rtl
$00:e4cc  da            phx
$00:e4cd  85 00         sta $00
$00:e4cf  29 ff 00      and #$00ff
$00:e4d2  aa            tax
$00:e4d3  a5 01         lda $01
$00:e4d5  29 7f 00      and #$007f
$00:e4d8  a8            tay
$00:e4d9  e2 20         sep #$20
$00:e4db  a5 01         lda $01
$00:e4dd  10 09         bpl $e4e8
$00:e4df  bf 16 e5 00   lda $00e516,x
$00:e4e3  19 5e 1a      ora $1a5e,y
$00:e4e6  80 09         bra $e4f1
$00:e4e8  bf 16 e5 00   lda $00e516,x
$00:e4ec  49 ff         eor #$ff
$00:e4ee  39 5e 1a      and $1a5e,y
$00:e4f1  99 5e 1a      sta $1a5e,y
$00:e4f4  fa            plx
$00:e4f5  c2 20         rep #$20
$00:e4f7  60            rts
$00:e4f8  da            phx
$00:e4f9  85 00         sta $00
$00:e4fb  29 ff 00      and #$00ff
$00:e4fe  aa            tax
$00:e4ff  a5 01         lda $01
$00:e501  29 7f 00      and #$007f
$00:e504  a8            tay
$00:e505  e2 20         sep #$20
$00:e507  bf 16 e5 00   lda $00e516,x
$00:e50b  39 5e 1a      and $1a5e,y
$00:e50e  38            sec
$00:e50f  d0 01         bne $e512
$00:e511  18            clc
$00:e512  fa            plx
$00:e513  c2 20         rep #$20
$00:e515  60            rts
$00:e516  01 02         ora ($02,x)
$00:e518  04 08         tsb $08
$00:e51a  10 20         bpl $e53c
$00:e51c  40            rti
$00:e51d  80 e2         bra $e501
$00:e51f  20 48 a8      jsr $a848
$00:e522  88            dey
$00:e523  b9 1e 1b      lda $1b1e,y
$00:e526  29 7f d0      and #$d07f
$00:e529  05 68         ora $68
$00:e52b  c2 20         rep #$20
$00:e52d  38            sec
$00:e52e  60            rts
$00:e52f  68            pla
$00:e530  b9 1e 1b      lda $1b1e,y
$00:e533  c2 20         rep #$20
$00:e535  18            clc
$00:e536  60            rts
$00:e537  bd 10 00      lda $0010,x
$00:e53a  18            clc
$00:e53b  7d 12 00      adc $0012,x
$00:e53e  c9 21 00      cmp #$0021
$00:e541  b0 20         bcs $e563
$00:e543  da            phx
$00:e544  bd 00 00      lda $0000,x
$00:e547  85 16         sta $16
$00:e549  bd 02 00      lda $0002,x
$00:e54c  38            sec
$00:e54d  e9 10 00      sbc #$0010
$00:e550  85 18         sta $18
$00:e552  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:e556  bf 00 80 7f   lda $7f8000,x
$00:e55a  09 f0 00      ora #$00f0
$00:e55d  9f 00 80 7f   sta $7f8000,x
$00:e561  fa            plx
$00:e562  60            rts
$00:e563  9b            txy
$00:e564  b9 12 00      lda $0012,y
$00:e567  4a            lsr a
$00:e568  4a            lsr a
$00:e569  4a            lsr a
$00:e56a  4a            lsr a
$00:e56b  85 0c         sta $0c
$00:e56d  bd 00 00      lda $0000,x
$00:e570  85 16         sta $16
$00:e572  bd 02 00      lda $0002,x
$00:e575  38            sec
$00:e576  fd 12 00      sbc $0012,x
$00:e579  85 18         sta $18
$00:e57b  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:e57f  b9 10 00      lda $0010,y
$00:e582  4a            lsr a
$00:e583  4a            lsr a
$00:e584  4a            lsr a
$00:e585  4a            lsr a
$00:e586  85 0e         sta $0e
$00:e588  bf 00 80 7f   lda $7f8000,x
$00:e58c  09 f0 00      ora #$00f0
$00:e58f  9f 00 80 7f   sta $7f8000,x
$00:e593  22 1a f3 04   jsl $04f31a  ; -> Sub_04_f31a
$00:e597  c6 0e         dec $0e
$00:e599  d0 ed         bne $e588
$00:e59b  a5 18         lda $18
$00:e59d  18            clc
$00:e59e  69 10 00      adc #$0010
$00:e5a1  c6 0c         dec $0c
$00:e5a3  d0 d4         bne $e579
$00:e5a5  bb            tyx
$00:e5a6  60            rts
$00:e5a7  bd 10 00      lda $0010,x
$00:e5aa  18            clc
$00:e5ab  7d 12 00      adc $0012,x
$00:e5ae  c9 21 00      cmp #$0021
$00:e5b1  b0 20         bcs $e5d3
$00:e5b3  da            phx
$00:e5b4  bd 00 00      lda $0000,x
$00:e5b7  85 16         sta $16
$00:e5b9  bd 02 00      lda $0002,x
$00:e5bc  38            sec
$00:e5bd  e9 10 00      sbc #$0010
$00:e5c0  85 18         sta $18
$00:e5c2  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:e5c6  bf 00 80 7f   lda $7f8000,x
$00:e5ca  29 00 ff      and #$ff00
$00:e5cd  9f 00 80 7f   sta $7f8000,x
$00:e5d1  fa            plx
$00:e5d2  60            rts
$00:e5d3  9b            txy
$00:e5d4  b9 12 00      lda $0012,y
$00:e5d7  4a            lsr a
$00:e5d8  4a            lsr a
$00:e5d9  4a            lsr a
$00:e5da  4a            lsr a
$00:e5db  85 0c         sta $0c
$00:e5dd  bd 00 00      lda $0000,x
$00:e5e0  85 16         sta $16
$00:e5e2  bd 02 00      lda $0002,x
$00:e5e5  38            sec
$00:e5e6  fd 12 00      sbc $0012,x
$00:e5e9  85 18         sta $18
$00:e5eb  22 b8 f2 04   jsl $04f2b8  ; -> Sub_04_f2b8
$00:e5ef  b9 10 00      lda $0010,y
$00:e5f2  4a            lsr a
$00:e5f3  4a            lsr a
$00:e5f4  4a            lsr a
$00:e5f5  4a            lsr a
$00:e5f6  85 0e         sta $0e
$00:e5f8  bf 00 80 7f   lda $7f8000,x
$00:e5fc  29 00 ff      and #$ff00
$00:e5ff  9f 00 80 7f   sta $7f8000,x
$00:e603  22 1a f3 04   jsl $04f31a  ; -> Sub_04_f31a
$00:e607  c6 0e         dec $0e
$00:e609  d0 ed         bne $e5f8
$00:e60b  a5 18         lda $18
$00:e60d  18            clc
$00:e60e  69 10 00      adc #$0010
$00:e611  c6 0c         dec $0c
$00:e613  d0 d4         bne $e5e9
$00:e615  bb            tyx
$00:e616  60            rts
Sub_00_e617:
$00:e617  e2 20         sep #$20
$00:e619  eb            xba
$00:e61a  a9 40         lda #$40
$00:e61c  22 d1 b1 02   jsl $02b1d1  ; -> Sub_02_b1d1
$00:e620  c2 20         rep #$20
$00:e622  18            clc
$00:e623  69 00 08      adc #$0800
$00:e626  a8            tay
$00:e627  60            rts
Sub_00_e628:
$00:e628  0a            asl a
$00:e629  0a            asl a
$00:e62a  0a            asl a
$00:e62b  0a            asl a
$00:e62c  60            rts
$00:e62d  48            pha
$00:e62e  da            phx
$00:e62f  0a            asl a
$00:e630  aa            tax
$00:e631  a3 01         lda $01,s
$00:e633  9f 83 04 7f   sta $7f0483,x
$00:e637  fa            plx
$00:e638  68            pla
$00:e639  60            rts
$00:e63a  22 8a e6 00   jsl $00e68a
$00:e63e  b0 21         bcs $e661
$00:e640  8a            txa
$00:e641  99 3e 00      sta $003e,y
$00:e644  bd 3c 00      lda $003c,x
$00:e647  99 3c 00      sta $003c,y
$00:e64a  98            tya
$00:e64b  9d 3c 00      sta $003c,x
$00:e64e  da            phx
$00:e64f  be 3c 00      ldx $003c,y
$00:e652  d0 05         bne $e659
$00:e654  8c a6 06      sty $06a6
$00:e657  80 04         bra $e65d
$00:e659  98            tya
$00:e65a  9d 3e 00      sta $003e,x
$00:e65d  fa            plx
$00:e65e  20 a3 e6      jsr $e6a3
$00:e661  60            rts
Sub_00_e662:
$00:e662  22 8a e6 00   jsl $00e68a
$00:e666  b0 21         bcs $e689
$00:e668  8a            txa
$00:e669  99 3c 00      sta $003c,y
$00:e66c  bd 3e 00      lda $003e,x
$00:e66f  99 3e 00      sta $003e,y
$00:e672  98            tya
$00:e673  9d 3e 00      sta $003e,x
$00:e676  da            phx
$00:e677  be 3e 00      ldx $003e,y
$00:e67a  f0 06         beq $e682
$00:e67c  98            tya
$00:e67d  9d 3c 00      sta $003c,x
$00:e680  80 03         bra $e685
$00:e682  8c a8 06      sty $06a8
$00:e685  fa            plx
$00:e686  20 a3 e6      jsr $e6a3
$00:e689  60            rts
$00:e68a  b2 4a         lda ($4a)
$00:e68c  f0 10         beq $e69e
$00:e68e  a8            tay
$00:e68f  a9 00 00      lda #$0000
$00:e692  92 4a         sta ($4a)
$00:e694  e2 20         sep #$20
$00:e696  e6 4a         inc $4a
$00:e698  e6 4a         inc $4a
$00:e69a  c2 20         rep #$20
$00:e69c  18            clc
$00:e69d  6b            rtl
$00:e69e  38            sec
$00:e69f  a0 aa         ldy #$aa
$00:e6a1  06 6b         asl $6b
$00:e6a3  da            phx
$00:e6a4  5a            phy
$00:e6a5  a9 3b 00      lda #$003b
$00:e6a8  54 01 01      mvn $01,$01
$00:e6ab  7a            ply
$00:e6ac  fa            plx
$00:e6ad  b9 16 00      lda $0016,y
$00:e6b0  09 00 20      ora #$2000
$00:e6b3  29 ef ff      and #$ffef
$00:e6b6  99 16 00      sta $0016,y
$00:e6b9  a9 00 00      lda #$0000
$00:e6bc  99 1a 00      sta $001a,y
$00:e6bf  99 30 00      sta $0030,y
$00:e6c2  99 14 00      sta $0014,y
$00:e6c5  60            rts
$00:e6c6  a9 80 30      lda #$3080
$00:e6c9  0c 26 03      tsb $0326
$00:e6cc  8e 9c 03      stx $039c
$00:e6cf  da            phx
$00:e6d0  a0 76         ldy #$76
$00:e6d2  c1 22         cmp ($22,x)
$00:e6d4  69 a7 02      adc #$02a7
$00:e6d7  fa            plx
$00:e6d8  02 1b         cop #$1b
$00:e6da  de e6 01      dec $01e6,x
$00:e6dd  00 e2         brk #$e2
$00:e6df  20 da 22      jsr $22da
$00:e6e2  bc ef 1f      ldy $1fef,x
$00:e6e5  22 63 a4 02   jsl $02a463
$00:e6e9  22 9f f1 04   jsl $04f19f
$00:e6ed  fa            plx
$00:e6ee  c2 20         rep #$20
$00:e6f0  02 10         cop #$10
$00:e6f2  00 0a         brk #$0a
$00:e6f4  01 00         ora ($00,x)
$00:e6f6  00 00         brk #$00
$00:e6f8  00 02         brk #$02
$00:e6fa  91 6b         sta ($6b),y
$00:e6fc  a9 00 30      lda #$3000
$00:e6ff  0c 26 03      tsb $0326
$00:e702  9c 22 03      stz $0322
$00:e705  8e 9c 03      stx $039c
$00:e708  ad 45 04      lda $0445
$00:e70b  f0 03         beq $e710
$00:e70d  82 b1 05      brl $ecc1
$00:e710  02 85         cop #$85
$00:e712  61 eb         adc ($eb,x)
$00:e714  00 9c         brk #$9c
$00:e716  82 04 e2      brl $c91d
$00:e719  20 a9 e0      jsr $e0a9
$00:e71c  8f 00 02 7f   sta $7f0200
$00:e720  a9 0f 8d      lda #$8d0f
$00:e723  05 21         ora $21
$00:e725  a9 11 8d      lda #$8d11
$00:e728  2c 21 c2      bit $c221
$00:e72b  20 a9 c8      jsr $c8a9
$00:e72e  ff 8d 6a 04   sbc $046a8d,x
$00:e732  a9 3e 00      lda #$003e
$00:e735  8d 6c 04      sta $046c
$00:e738  a9 83 00      lda #$0083
$00:e73b  8d 80 04      sta $0480
$00:e73e  02 91         cop #$91
$00:e740  ee 6a 04      inc $046a
$00:e743  ad 6a 04      lda $046a
$00:e746  c9 3e 01      cmp #$013e
$00:e749  f0 01         beq $e74c
$00:e74b  6b            rtl
$00:e74c  a9 02 00      lda #$0002
$00:e74f  8d 80 04      sta $0480
$00:e752  02 03         cop #$03
$00:e754  1f 02 04 a9   ora $a90402,x
$00:e758  80 00         bra $e75a
$00:e75a  8d 6a 04      sta $046a
$00:e75d  02 91         cop #$91
$00:e75f  ad 80 04      lda $0480
$00:e762  18            clc
$00:e763  69 04 00      adc #$0004
$00:e766  8d 80 04      sta $0480
$00:e769  c9 06 02      cmp #$0206
$00:e76c  f0 01         beq $e76f
$00:e76e  6b            rtl
$00:e76f  02 03         cop #$03
$00:e771  1f 02 04 da   ora $da0402,x
$00:e775  a0 36         ldy #$36
$00:e777  bb            tyx
$00:e778  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:e77c  fa            plx
$00:e77d  02 85         cop #$85
$00:e77f  5e ea 00      lsr $00ea,x
$00:e782  02 03         cop #$03
$00:e784  1f 02 04 02   ora $020402,x
$00:e788  ac 51 eb      ldy $eb51
$00:e78b  00 50         brk #$50
$00:e78d  ff 80 00 00   sbc $000080,x
$00:e791  23 02         and $02,s
$00:e793  ac 29 eb      ldy $eb29
$00:e796  00 98         brk #$98
$00:e798  01 78         ora ($78,x)
$00:e79a  00 00         brk #$00
$00:e79c  03 02         ora $02,s
$00:e79e  ac 01 eb      ldy $eb01
$00:e7a1  00 98         brk #$98
$00:e7a3  01 78         ora ($78,x)
$00:e7a5  00 00         brk #$00
$00:e7a7  03 02         ora $02,s
$00:e7a9  85 90         sta $90
$00:e7ab  ea            nop
$00:e7ac  00 02         brk #$02
$00:e7ae  03 f1         ora $f1,s
$00:e7b0  02 04         cop #$04
$00:e7b2  da            phx
$00:e7b3  a0 27         ldy #$27
$00:e7b5  bb            tyx
$00:e7b6  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:e7ba  fa            plx
$00:e7bb  a9 00 30      lda #$3000
$00:e7be  1c 26 03      trb $0326
$00:e7c1  02 03         cop #$03
$00:e7c3  f1 02         sbc ($02),y
$00:e7c5  04 02         tsb $02
$00:e7c7  03 79         ora $79,s
$00:e7c9  02 04         cop #$04
$00:e7cb  02 85         cop #$85
$00:e7cd  25 ea         and $ea
$00:e7cf  00 02         brk #$02
$00:e7d1  03 3d         ora $3d,s
$00:e7d3  02 04         cop #$04
$00:e7d5  ee 82 04      inc $0482
$00:e7d8  02 03         cop #$03
$00:e7da  79 02 04      adc $0402,y
$00:e7dd  da            phx
$00:e7de  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e7e2  a0 85         ldy #$85
$00:e7e4  bb            tyx
$00:e7e5  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:e7e9  fa            plx
$00:e7ea  02 85         cop #$85
$00:e7ec  40            rti
$00:e7ed  ea            nop
$00:e7ee  00 02         brk #$02
$00:e7f0  03 f1         ora $f1,s
$00:e7f2  02 04         cop #$04
$00:e7f4  02 03         cop #$03
$00:e7f6  f1 02         sbc ($02),y
$00:e7f8  04 02         tsb $02
$00:e7fa  85 25         sta $25
$00:e7fc  ea            nop
$00:e7fd  00 02         brk #$02
$00:e7ff  03 21         ora $21,s
$00:e801  02 04         cop #$04
$00:e803  da            phx
$00:e804  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e808  a0 e1         ldy #$e1
$00:e80a  bb            tyx
$00:e80b  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:e80f  fa            plx
$00:e810  02 85         cop #$85
$00:e812  40            rti
$00:e813  ea            nop
$00:e814  00 02         brk #$02
$00:e816  03 f1         ora $f1,s
$00:e818  02 04         cop #$04
$00:e81a  02 03         cop #$03
$00:e81c  f1 02         sbc ($02),y
$00:e81e  04 02         tsb $02
$00:e820  85 25         sta $25
$00:e822  ea            nop
$00:e823  00 02         brk #$02
$00:e825  03 21         ora $21,s
$00:e827  02 04         cop #$04
$00:e829  da            phx
$00:e82a  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e82e  a0 3d         ldy #$3d
$00:e830  bc 22 69      ldy $6922,x
$00:e833  a7 02         lda [$02]
$00:e835  fa            plx
$00:e836  02 85         cop #$85
$00:e838  40            rti
$00:e839  ea            nop
$00:e83a  00 02         brk #$02
$00:e83c  03 f1         ora $f1,s
$00:e83e  02 04         cop #$04
$00:e840  02 03         cop #$03
$00:e842  f1 02         sbc ($02),y
$00:e844  04 02         tsb $02
$00:e846  85 25         sta $25
$00:e848  ea            nop
$00:e849  00 02         brk #$02
$00:e84b  03 21         ora $21,s
$00:e84d  02 04         cop #$04
$00:e84f  da            phx
$00:e850  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e854  a0 b6         ldy #$b6
$00:e856  bc 22 69      ldy $6922,x
$00:e859  a7 02         lda [$02]
$00:e85b  fa            plx
$00:e85c  02 85         cop #$85
$00:e85e  40            rti
$00:e85f  ea            nop
$00:e860  00 02         brk #$02
$00:e862  03 f1         ora $f1,s
$00:e864  02 04         cop #$04
$00:e866  02 03         cop #$03
$00:e868  f1 02         sbc ($02),y
$00:e86a  04 02         tsb $02
$00:e86c  85 25         sta $25
$00:e86e  ea            nop
$00:e86f  00 02         brk #$02
$00:e871  03 21         ora $21,s
$00:e873  02 04         cop #$04
$00:e875  da            phx
$00:e876  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e87a  a0 4d         ldy #$4d
$00:e87c  bd 22 69      lda $6922,x
$00:e87f  a7 02         lda [$02]
$00:e881  fa            plx
$00:e882  02 85         cop #$85
$00:e884  40            rti
$00:e885  ea            nop
$00:e886  00 02         brk #$02
$00:e888  03 f1         ora $f1,s
$00:e88a  02 04         cop #$04
$00:e88c  02 03         cop #$03
$00:e88e  f1 02         sbc ($02),y
$00:e890  04 02         tsb $02
$00:e892  85 25         sta $25
$00:e894  ea            nop
$00:e895  00 02         brk #$02
$00:e897  03 21         ora $21,s
$00:e899  02 04         cop #$04
$00:e89b  da            phx
$00:e89c  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e8a0  a0 ba         ldy #$ba
$00:e8a2  bd 22 69      lda $6922,x
$00:e8a5  a7 02         lda [$02]
$00:e8a7  fa            plx
$00:e8a8  02 85         cop #$85
$00:e8aa  40            rti
$00:e8ab  ea            nop
$00:e8ac  00 02         brk #$02
$00:e8ae  03 f1         ora $f1,s
$00:e8b0  02 04         cop #$04
$00:e8b2  02 03         cop #$03
$00:e8b4  f1 02         sbc ($02),y
$00:e8b6  04 02         tsb $02
$00:e8b8  85 25         sta $25
$00:e8ba  ea            nop
$00:e8bb  00 02         brk #$02
$00:e8bd  03 21         ora $21,s
$00:e8bf  02 04         cop #$04
$00:e8c1  da            phx
$00:e8c2  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e8c6  a0 2a         ldy #$2a
$00:e8c8  be 22 69      ldx $6922,y
$00:e8cb  a7 02         lda [$02]
$00:e8cd  fa            plx
$00:e8ce  02 85         cop #$85
$00:e8d0  40            rti
$00:e8d1  ea            nop
$00:e8d2  00 02         brk #$02
$00:e8d4  03 f1         ora $f1,s
$00:e8d6  02 04         cop #$04
$00:e8d8  02 03         cop #$03
$00:e8da  f1 02         sbc ($02),y
$00:e8dc  04 02         tsb $02
$00:e8de  85 25         sta $25
$00:e8e0  ea            nop
$00:e8e1  00 02         brk #$02
$00:e8e3  03 21         ora $21,s
$00:e8e5  02 04         cop #$04
$00:e8e7  da            phx
$00:e8e8  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e8ec  a0 51         ldy #$51
$00:e8ee  be 22 69      ldx $6922,y
$00:e8f1  a7 02         lda [$02]
$00:e8f3  fa            plx
$00:e8f4  02 85         cop #$85
$00:e8f6  40            rti
$00:e8f7  ea            nop
$00:e8f8  00 02         brk #$02
$00:e8fa  03 f1         ora $f1,s
$00:e8fc  02 04         cop #$04
$00:e8fe  02 03         cop #$03
$00:e900  f1 02         sbc ($02),y
$00:e902  04 02         tsb $02
$00:e904  85 25         sta $25
$00:e906  ea            nop
$00:e907  00 02         brk #$02
$00:e909  03 21         ora $21,s
$00:e90b  02 04         cop #$04
$00:e90d  da            phx
$00:e90e  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e912  a0 bf         ldy #$bf
$00:e914  be 22 69      ldx $6922,y
$00:e917  a7 02         lda [$02]
$00:e919  fa            plx
$00:e91a  02 85         cop #$85
$00:e91c  40            rti
$00:e91d  ea            nop
$00:e91e  00 02         brk #$02
$00:e920  03 f1         ora $f1,s
$00:e922  02 04         cop #$04
$00:e924  02 03         cop #$03
$00:e926  f1 02         sbc ($02),y
$00:e928  04 02         tsb $02
$00:e92a  85 25         sta $25
$00:e92c  ea            nop
$00:e92d  00 02         brk #$02
$00:e92f  03 21         ora $21,s
$00:e931  02 04         cop #$04
$00:e933  da            phx
$00:e934  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e938  a0 35         ldy #$35
$00:e93a  bf 22 69 a7   lda $a76922,x
$00:e93e  02 fa         cop #$fa
$00:e940  02 85         cop #$85
$00:e942  40            rti
$00:e943  ea            nop
$00:e944  00 02         brk #$02
$00:e946  03 f1         ora $f1,s
$00:e948  02 04         cop #$04
$00:e94a  02 03         cop #$03
$00:e94c  f1 02         sbc ($02),y
$00:e94e  04 02         tsb $02
$00:e950  85 25         sta $25
$00:e952  ea            nop
$00:e953  00 02         brk #$02
$00:e955  03 21         ora $21,s
$00:e957  02 04         cop #$04
$00:e959  da            phx
$00:e95a  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e95e  a0 cd         ldy #$cd
$00:e960  bf 22 69 a7   lda $a76922,x
$00:e964  02 fa         cop #$fa
$00:e966  02 85         cop #$85
$00:e968  40            rti
$00:e969  ea            nop
$00:e96a  00 02         brk #$02
$00:e96c  03 f1         ora $f1,s
$00:e96e  02 04         cop #$04
$00:e970  02 03         cop #$03
$00:e972  f1 02         sbc ($02),y
$00:e974  04 02         tsb $02
$00:e976  85 25         sta $25
$00:e978  ea            nop
$00:e979  00 02         brk #$02
$00:e97b  03 21         ora $21,s
$00:e97d  02 04         cop #$04
$00:e97f  da            phx
$00:e980  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e984  a0 23         ldy #$23
$00:e986  c0 22         cpy #$22
$00:e988  69 a7 02      adc #$02a7
$00:e98b  fa            plx
$00:e98c  02 85         cop #$85
$00:e98e  40            rti
$00:e98f  ea            nop
$00:e990  00 02         brk #$02
$00:e992  03 f1         ora $f1,s
$00:e994  02 04         cop #$04
$00:e996  02 03         cop #$03
$00:e998  f1 02         sbc ($02),y
$00:e99a  04 02         tsb $02
$00:e99c  85 25         sta $25
$00:e99e  ea            nop
$00:e99f  00 02         brk #$02
$00:e9a1  03 21         ora $21,s
$00:e9a3  02 04         cop #$04
$00:e9a5  da            phx
$00:e9a6  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e9aa  a0 6a         ldy #$6a
$00:e9ac  c0 22         cpy #$22
$00:e9ae  69 a7 02      adc #$02a7
$00:e9b1  fa            plx
$00:e9b2  02 85         cop #$85
$00:e9b4  40            rti
$00:e9b5  ea            nop
$00:e9b6  00 02         brk #$02
$00:e9b8  03 f1         ora $f1,s
$00:e9ba  02 04         cop #$04
$00:e9bc  02 03         cop #$03
$00:e9be  f1 02         sbc ($02),y
$00:e9c0  04 02         tsb $02
$00:e9c2  85 25         sta $25
$00:e9c4  ea            nop
$00:e9c5  00 02         brk #$02
$00:e9c7  03 21         ora $21,s
$00:e9c9  02 04         cop #$04
$00:e9cb  da            phx
$00:e9cc  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e9d0  a0 fa         ldy #$fa
$00:e9d2  c0 22         cpy #$22
$00:e9d4  69 a7 02      adc #$02a7
$00:e9d7  fa            plx
$00:e9d8  02 85         cop #$85
$00:e9da  40            rti
$00:e9db  ea            nop
$00:e9dc  00 02         brk #$02
$00:e9de  03 f1         ora $f1,s
$00:e9e0  02 04         cop #$04
$00:e9e2  02 03         cop #$03
$00:e9e4  f1 02         sbc ($02),y
$00:e9e6  04 02         tsb $02
$00:e9e8  03 f1         ora $f1,s
$00:e9ea  02 04         cop #$04
$00:e9ec  02 85         cop #$85
$00:e9ee  25 ea         and $ea
$00:e9f0  00 02         brk #$02
$00:e9f2  03 21         ora $21,s
$00:e9f4  02 04         cop #$04
$00:e9f6  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:e9fa  02 03         cop #$03
$00:e9fc  1f 02 04 9c   ora $9c0402,x
$00:ea00  82 04 02      brl $ec07
$00:ea03  03 81         ora $81,s
$00:ea05  02 04         cop #$04
$00:ea07  a9 ff ff      lda #$ffff
$00:ea0a  8d 82 04      sta $0482
$00:ea0d  a9 c8 ff      lda #$ffc8
$00:ea10  8d 6a 04      sta $046a
$00:ea13  a9 3e 00      lda #$003e
$00:ea16  8d 6c 04      sta $046c
$00:ea19  a9 83 00      lda #$0083
$00:ea1c  8d 80 04      sta $0480
$00:ea1f  02 1b         cop #$1b
$00:ea21  15 e7         ora $e7,x
$00:ea23  01 00         ora ($00,x)
$00:ea25  9e 30 00      stz $0030,x
$00:ea28  02 03         cop #$03
$00:ea2a  20 e2 20      jsr $20e2
$00:ea2d  bd 30 00      lda $0030,x
$00:ea30  09 e0 8f      ora #$8fe0
$00:ea33  00 02         brk #$02
$00:ea35  7f c2 20 fe   adc $fe20c2,x
$00:ea39  30 00         bmi $ea3b
$00:ea3b  02 04         cop #$04
$00:ea3d  02 86         cop #$86
$00:ea3f  6b            rtl
$00:ea40  a9 1f 00      lda #$001f
$00:ea43  9d 30 00      sta $0030,x
$00:ea46  02 03         cop #$03
$00:ea48  20 e2 20      jsr $20e2
$00:ea4b  bd 30 00      lda $0030,x
$00:ea4e  09 e0 8f      ora #$8fe0
$00:ea51  00 02         brk #$02
$00:ea53  7f c2 20 de   adc $de20c2,x
$00:ea57  30 00         bmi $ea59
$00:ea59  02 04         cop #$04
$00:ea5b  02 86         cop #$86
$00:ea5d  6b            rtl
$00:ea5e  e2 20         sep #$20
$00:ea60  a9 05         lda #$05
$00:ea62  eb            xba
$00:ea63  a9 00         lda #$00
$00:ea65  a0 86         ldy #$86
$00:ea67  ea            nop
$00:ea68  22 8a 98 02   jsl $02988a  ; -> Sub_02_988a
$00:ea6c  a9 2c         lda #$2c
$00:ea6e  eb            xba
$00:ea6f  a9 00         lda #$00
$00:ea71  a0 8b         ldy #$8b
$00:ea73  ea            nop
$00:ea74  22 8a 98 02   jsl $02988a  ; -> Sub_02_988a
$00:ea78  c2 20         rep #$20
$00:ea7a  ad 82 04      lda $0482
$00:ea7d  d0 01         bne $ea80
$00:ea7f  6b            rtl
$00:ea80  9c 42 00      stz $0042
$00:ea83  02 86         cop #$86
$00:ea85  6b            rtl
$00:ea86  7f 0f 60 09   adc $09600f,x
$00:ea8a  00 7f         brk #$7f
$00:ea8c  11 60         ora ($60),y
$00:ea8e  14 00         trb $00
$00:ea90  02 03         cop #$03
$00:ea92  80 bc         bra $ea50
$00:ea94  3e 00 b9      rol $b900,x
$00:ea97  00 00         brk #$00
$00:ea99  3a            dec a
$00:ea9a  3a            dec a
$00:ea9b  99 00 00      sta $0000,y
$00:ea9e  b9 3e 00      lda $003e,y
$00:eaa1  a8            tay
$00:eaa2  b9 00 00      lda $0000,y
$00:eaa5  3a            dec a
$00:eaa6  3a            dec a
$00:eaa7  99 00 00      sta $0000,y
$00:eaaa  b9 3e 00      lda $003e,y
$00:eaad  a8            tay
$00:eaae  b9 00 00      lda $0000,y
$00:eab1  1a            inc a
$00:eab2  1a            inc a
$00:eab3  99 00 00      sta $0000,y
$00:eab6  02 04         cop #$04
$00:eab8  02 91         cop #$91
$00:eaba  ad 82 04      lda $0482
$00:eabd  d0 01         bne $eac0
$00:eabf  6b            rtl
$00:eac0  02 03         cop #$03
$00:eac2  40            rti
$00:eac3  bc 3e 00      ldy $003e,x
$00:eac6  b9 02 00      lda $0002,y
$00:eac9  3a            dec a
$00:eaca  99 02 00      sta $0002,y
$00:eacd  b9 3e 00      lda $003e,y
$00:ead0  a8            tay
$00:ead1  b9 02 00      lda $0002,y
$00:ead4  3a            dec a
$00:ead5  99 02 00      sta $0002,y
$00:ead8  02 04         cop #$04
$00:eada  02 91         cop #$91
$00:eadc  ad 82 04      lda $0482
$00:eadf  f0 01         beq $eae2
$00:eae1  6b            rtl
$00:eae2  02 03         cop #$03
$00:eae4  80 bc         bra $eaa2
$00:eae6  3e 00 b9      rol $b900,x
$00:eae9  00 00         brk #$00
$00:eaeb  3a            dec a
$00:eaec  3a            dec a
$00:eaed  99 00 00      sta $0000,y
$00:eaf0  b9 3e 00      lda $003e,y
$00:eaf3  a8            tay
$00:eaf4  b9 00 00      lda $0000,y
$00:eaf7  3a            dec a
$00:eaf8  3a            dec a
$00:eaf9  99 00 00      sta $0000,y
$00:eafc  02 04         cop #$04
$00:eafe  02 86         cop #$86
$00:eb00  6b            rtl
$00:eb01  02 80         cop #$80
$00:eb03  00 02         brk #$02
$00:eb05  82 02 91      brl $7c0a
$00:eb08  ad 82 04      lda $0482
$00:eb0b  30 19         bmi $eb26
$00:eb0d  bd 00 00      lda $0000,x
$00:eb10  c9 98 00      cmp #$0098
$00:eb13  f0 01         beq $eb16
$00:eb15  6b            rtl
$00:eb16  02 80         cop #$80
$00:eb18  03 02         ora $02,s
$00:eb1a  82 02 80      brl $6b1f
$00:eb1d  00 02         brk #$02
$00:eb1f  82 02 1b      brl $0624
$00:eb22  01 eb         ora ($eb,x)
$00:eb24  2c 01 02      bit $0201
$00:eb27  86 6b         stx $6b
$00:eb29  02 80         cop #$80
$00:eb2b  01 02         ora ($02,x)
$00:eb2d  82 02 91      brl $7c32
$00:eb30  ad 82 04      lda $0482
$00:eb33  30 19         bmi $eb4e
$00:eb35  bd 00 00      lda $0000,x
$00:eb38  c9 98 00      cmp #$0098
$00:eb3b  f0 01         beq $eb3e
$00:eb3d  6b            rtl
$00:eb3e  02 80         cop #$80
$00:eb40  04 02         tsb $02
$00:eb42  82 02 80      brl $6b47
$00:eb45  01 02         ora ($02,x)
$00:eb47  82 02 1b      brl $064c
$00:eb4a  29 eb 2c      and #$2ceb
$00:eb4d  01 02         ora ($02,x)
$00:eb4f  86 6b         stx $6b
$00:eb51  02 80         cop #$80
$00:eb53  02 02         cop #$02
$00:eb55  82 02 91      brl $7c5a
$00:eb58  ad 82 04      lda $0482
$00:eb5b  d0 01         bne $eb5e
$00:eb5d  6b            rtl
$00:eb5e  02 86         cop #$86
$00:eb60  6b            rtl
$00:eb61  ad 22 03      lda $0322
$00:eb64  89 00 10      bit #$1000
$00:eb67  d0 01         bne $eb6a
$00:eb69  6b            rtl
$00:eb6a  02 10         cop #$10
$00:eb6c  00 0a         brk #$0a
$00:eb6e  01 00         ora ($00,x)
$00:eb70  00 00         brk #$00
$00:eb72  00 a9         brk #$a9
$00:eb74  01 00         ora ($00,x)
$00:eb76  8d 1e 03      sta $031e
$00:eb79  8d 45 04      sta $0445
$00:eb7c  02 86         cop #$86
$00:eb7e  6b            rtl
$00:eb7f  ad 6a 1c      lda $1c6a
$00:eb82  c9 10 d0      cmp #$d010
$00:eb85  1e 20 f1      asl $f120,x
$00:eb88  eb            xba
$00:eb89  20 a8 eb      jsr $eba8
$00:eb8c  ae 76 04      ldx $0476
$00:eb8f  8e 6e 04      stx $046e
$00:eb92  ae 78 04      ldx $0478
$00:eb95  8e 70 04      stx $0470
$00:eb98  ae 7a 04      ldx $047a
$00:eb9b  8e 72 04      stx $0472
$00:eb9e  ae 7c 04      ldx $047c
$00:eba1  8e 74 04      stx $0474
$00:eba4  6b            rtl
$00:eba5  20 50 ec      jsr $ec50
$00:eba8  ad 6e 04      lda $046e
$00:ebab  8d 1b 21      sta $211b
$00:ebae  ad 6f 04      lda $046f
$00:ebb1  8d 1b 21      sta $211b
$00:ebb4  ad 70 04      lda $0470
$00:ebb7  8d 1c 21      sta $211c
$00:ebba  ad 71 04      lda $0471
$00:ebbd  8d 1c 21      sta $211c
$00:ebc0  ad 72 04      lda $0472
$00:ebc3  8d 1d 21      sta $211d
$00:ebc6  ad 73 04      lda $0473
$00:ebc9  8d 1d 21      sta $211d
$00:ebcc  ad 74 04      lda $0474
$00:ebcf  8d 1e 21      sta $211e
$00:ebd2  ad 75 04      lda $0475
$00:ebd5  8d 1e 21      sta $211e
$00:ebd8  ad 6a 04      lda $046a
$00:ebdb  8d 1f 21      sta $211f
$00:ebde  ad 6b 04      lda $046b
$00:ebe1  8d 1f 21      sta $211f
$00:ebe4  ad 6c 04      lda $046c
$00:ebe7  8d 20 21      sta $2120
$00:ebea  ad 6d 04      lda $046d
$00:ebed  8d 20 21      sta $2120
$00:ebf0  60            rts
$00:ebf1  e2 10         sep #$10
$00:ebf3  ae 7e 04      ldx $047e
$00:ebf6  c2 10         rep #$10
$00:ebf8  ac 80 04      ldy $0480
$00:ebfb  84 00         sty $00
$00:ebfd  eb            xba
$00:ebfe  bf c4 fc 01   lda $01fcc4,x
$00:ec02  85 02         sta $02
$00:ec04  20 a0 ec      jsr $eca0
$00:ec07  ac 35 21      ldy $2135
$00:ec0a  8c 76 04      sty $0476
$00:ec0d  ac 80 04      ldy $0480
$00:ec10  84 00         sty $00
$00:ec12  eb            xba
$00:ec13  bf 84 fc 01   lda $01fc84,x
$00:ec17  85 02         sta $02
$00:ec19  20 a0 ec      jsr $eca0
$00:ec1c  ac 35 21      ldy $2135
$00:ec1f  8c 78 04      sty $0478
$00:ec22  ac 80 04      ldy $0480
$00:ec25  84 00         sty $00
$00:ec27  eb            xba
$00:ec28  bf 84 fc 01   lda $01fc84,x
$00:ec2c  49 ff 1a      eor #$1aff
$00:ec2f  85 02         sta $02
$00:ec31  20 a0 ec      jsr $eca0
$00:ec34  ac 35 21      ldy $2135
$00:ec37  8c 7a 04      sty $047a
$00:ec3a  ac 80 04      ldy $0480
$00:ec3d  84 00         sty $00
$00:ec3f  eb            xba
$00:ec40  bf c4 fc 01   lda $01fcc4,x
$00:ec44  85 02         sta $02
$00:ec46  20 a0 ec      jsr $eca0
$00:ec49  ac 35 21      ldy $2135
$00:ec4c  8c 7c 04      sty $047c
$00:ec4f  60            rts
$00:ec50  c2 20         rep #$20
$00:ec52  8a            txa
$00:ec53  eb            xba
$00:ec54  4a            lsr a
$00:ec55  4a            lsr a
$00:ec56  18            clc
$00:ec57  69 41 00      adc #$0041
$00:ec5a  0a            asl a
$00:ec5b  48            pha
$00:ec5c  e2 20         sep #$20
$00:ec5e  8d 1b 21      sta $211b
$00:ec61  eb            xba
$00:ec62  8d 1b 21      sta $211b
$00:ec65  bf c4 fc 01   lda $01fcc4,x
$00:ec69  8d 1c 21      sta $211c
$00:ec6c  8d 1c 21      sta $211c
$00:ec6f  c2 20         rep #$20
$00:ec71  ad 35 21      lda $2135
$00:ec74  8d 6e 04      sta $046e
$00:ec77  8d 74 04      sta $0474
$00:ec7a  68            pla
$00:ec7b  e2 20         sep #$20
$00:ec7d  8d 1b 21      sta $211b
$00:ec80  eb            xba
$00:ec81  8d 1b 21      sta $211b
$00:ec84  bf 84 fc 01   lda $01fc84,x
$00:ec88  8d 1c 21      sta $211c
$00:ec8b  8d 1c 21      sta $211c
$00:ec8e  c2 20         rep #$20
$00:ec90  ad 35 21      lda $2135
$00:ec93  8d 70 04      sta $0470
$00:ec96  49 ff ff      eor #$ffff
$00:ec99  1a            inc a
$00:ec9a  8d 72 04      sta $0472
$00:ec9d  e2 20         sep #$20
$00:ec9f  60            rts
$00:eca0  08            php
$00:eca1  e2 20         sep #$20
$00:eca3  a5 00         lda $00
$00:eca5  8d 1b 21      sta $211b
$00:eca8  a5 01         lda $01
$00:ecaa  8d 1b 21      sta $211b
$00:ecad  a5 02         lda $02
$00:ecaf  8d 1c 21      sta $211c
$00:ecb2  8d 1c 21      sta $211c
$00:ecb5  ad 34 21      lda $2134
$00:ecb8  85 00         sta $00
$00:ecba  ad 35 21      lda $2135
$00:ecbd  85 01         sta $01
$00:ecbf  28            plp
$00:ecc0  60            rts
$00:ecc1  da            phx
$00:ecc2  22 2b a3 02   jsl $02a32b
$00:ecc6  20 4e ed      jsr $ed4e
$00:ecc9  fa            plx
$00:ecca  02 1b         cop #$1b
$00:eccc  d0 ec         bne $ecba
$00:ecce  01 00         ora ($00,x)
$00:ecd0  da            phx
$00:ecd1  af fe 1f 70   lda $701ffe
$00:ecd5  c9 04         cmp #$04
$00:ecd7  00 90         brk #$90
$00:ecd9  03 a9         ora $a9,s
$00:ecdb  00 00         brk #$00
$00:ecdd  eb            xba
$00:ecde  18            clc
$00:ecdf  69 05         adc #$05
$00:ece1  00 80         brk #$80
$00:ece3  03 a9         ora $a9,s
$00:ece5  05 00         ora $00
$00:ece7  22 e8 a1 02   jsl $02a1e8
$00:eceb  b0 f7         bcs $ece4
$00:eced  29 ff         and #$ff
$00:ecef  00 c9         brk #$c9
$00:ecf1  04 00         tsb $00
$00:ecf3  d0 2b         bne $ed20
$00:ecf5  a9 ff         lda #$ff
$00:ecf7  03 8f         ora $8f,s
$00:ecf9  06 00         asl $00
$00:ecfb  7f a9 04 00   adc $0004a9,x
$00:ecff  22 e8 a1 02   jsl $02a1e8
$00:ed03  b0 0f         bcs $ed14
$00:ed05  29 ff         and #$ff
$00:ed07  00 eb         brk #$eb
$00:ed09  0a            asl a
$00:ed0a  0a            asl a
$00:ed0b  aa            tax
$00:ed0c  9f 00 00 70   sta $700000,x
$00:ed10  9f 00 10 70   sta $701000,x
$00:ed14  a9 ff         lda #$ff
$00:ed16  7f 8f 06 00   adc $00068f,x
$00:ed1a  7f 20 4e ed   adc $ed4e20,x
$00:ed1e  80 c4         bra $ece4
$00:ed20  8d a4 03      sta $03a4
$00:ed23  22 32 f1 04   jsl $04f132
$00:ed27  fa            plx
$00:ed28  a9 01         lda #$01
$00:ed2a  00 b0         brk #$b0
$00:ed2c  03 ad         ora $ad,s
$00:ed2e  90 1b         bcc $ed4b
$00:ed30  8d 18 03      sta $0318
$00:ed33  a9 01         lda #$01
$00:ed35  00 8d         brk #$8d
$00:ed37  80 03         bra $ed3c
$00:ed39  a9 70         lda #$70
$00:ed3b  00 8d         brk #$8d
$00:ed3d  7c 03 a9      jmp ($a903,x)
$00:ed40  60            rts
$00:ed41  00 8d         brk #$8d
$00:ed43  7e 03 9c      ror $9c03,x
$00:ed46  45 04         eor $04
$00:ed48  ee 54 04      inc $0454
$00:ed4b  02 91         cop #$91
$00:ed4d  6b            rtl
$00:ed4e  a0 b0 c3      ldy #$c3b0
$00:ed51  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:ed55  9c a4 03      stz $03a4
$00:ed58  a2 00 00      ldx #$0000
$00:ed5b  a0 0d c4      ldy #$c40d
$00:ed5e  a9 00         lda #$00
$00:ed60  00 48         brk #$48
$00:ed62  22 6e f1 04   jsl $04f16e
$00:ed66  a5 16         lda $16
$00:ed68  df fa 03 70   cmp $7003fa,x
$00:ed6c  d0 1d         bne $ed8b
$00:ed6e  a5 18         lda $18
$00:ed70  df fc 03 70   cmp $7003fc,x
$00:ed74  d0 15         bne $ed8b
$00:ed76  da            phx
$00:ed77  5a            phy
$00:ed78  8b            phb
$00:ed79  9b            txy
$00:ed7a  98            tya
$00:ed7b  18            clc
$00:ed7c  69 00         adc #$00
$00:ed7e  10 a8         bpl $ed28
$00:ed80  a9 fd         lda #$fd
$00:ed82  03 54         ora $54,s
$00:ed84  70 70         bvs $edf6
$00:ed86  ab            plb
$00:ed87  7a            ply
$00:ed88  fa            plx
$00:ed89  80 27         bra $edb2
$00:ed8b  da            phx
$00:ed8c  5a            phy
$00:ed8d  8b            phb
$00:ed8e  9b            txy
$00:ed8f  8a            txa
$00:ed90  18            clc
$00:ed91  69 00         adc #$00
$00:ed93  10 aa         bpl $ed3f
$00:ed95  a9 fd         lda #$fd
$00:ed97  03 54         ora $54,s
$00:ed99  70 70         bvs $ee0b
$00:ed9b  ab            plb
$00:ed9c  7a            ply
$00:ed9d  fa            plx
$00:ed9e  22 6e f1 04   jsl $04f16e
$00:eda2  a5 16         lda $16
$00:eda4  df fa 03 70   cmp $7003fa,x
$00:eda8  d0 5c         bne $ee06
$00:edaa  a5 18         lda $18
$00:edac  df fc 03 70   cmp $7003fc,x
$00:edb0  d0 54         bne $ee06
$00:edb2  5a            phy
$00:edb3  da            phx
$00:edb4  8a            txa
$00:edb5  38            sec
$00:edb6  e9 5e         sbc #$5e
$00:edb8  1a            inc a
$00:edb9  48            pha
$00:edba  18            clc
$00:edbb  69 92         adc #$92
$00:edbd  1b            tcs
$00:edbe  aa            tax
$00:edbf  bf 00 02 70   lda $700200,x
$00:edc3  8d 47 04      sta $0447
$00:edc6  bf 02 02 70   lda $700202,x
$00:edca  8d 49 04      sta $0449
$00:edcd  bf 04 02 70   lda $700204,x
$00:edd1  8d 4b 04      sta $044b
$00:edd4  bf 06 02 70   lda $700206,x
$00:edd8  8d 4d 04      sta $044d
$00:eddb  bf 07 02 70   lda $700207,x
$00:eddf  8d 4e 04      sta $044e
$00:ede2  a3 01         lda $01,s
$00:ede4  18            clc
$00:ede5  69 6a         adc #$6a
$00:ede7  1b            tcs
$00:ede8  aa            tax
$00:ede9  bf 00 02 70   lda $700200,x
$00:eded  8d 50 04      sta $0450
$00:edf0  68            pla
$00:edf1  18            clc
$00:edf2  69 90         adc #$90
$00:edf4  1b            tcs
$00:edf5  aa            tax
$00:edf6  bf 00 02 70   lda $700200,x
$00:edfa  8d 52 04      sta $0452
$00:edfd  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:ee01  fa            plx
$00:ee02  7a            ply
$00:ee03  68            pla
$00:ee04  1a            inc a
$00:ee05  48            pha
$00:ee06  ee a4 03      inc $03a4
$00:ee09  8a            txa
$00:ee0a  18            clc
$00:ee0b  69 00         adc #$00
$00:ee0d  04 aa         tsb $aa
$00:ee0f  98            tya
$00:ee10  18            clc
$00:ee11  69 14         adc #$14
$00:ee13  00 a8         brk #$a8
$00:ee15  e0 00 10      cpx #$1000
$00:ee18  f0 03         beq $ee1d
$00:ee1a  82 45 ff      brl $ed62
$00:ee1d  9c a4 03      stz $03a4
$00:ee20  68            pla
$00:ee21  d0 04         bne $ee27
$00:ee23  8f fe 1f 70   sta $701ffe
$00:ee27  60            rts
$00:ee28  02 07         cop #$07
$00:ee2a  05 9f         ora $9f
$00:ee2c  34 ee         bit $ee,x
$00:ee2e  02 07         cop #$07
$00:ee30  04 9f         tsb $9f
$00:ee32  64 f2         stz $f2
$00:ee34  ee 54 04      inc $0454
$00:ee37  02 85         cop #$85
$00:ee39  41 f1         eor ($f1,x)
$00:ee3b  00 a9         brk #$a9
$00:ee3d  80 30         bra $ee6f
$00:ee3f  0c 26 03      tsb $0326
$00:ee42  02 a3         cop #$a3
$00:ee44  8e 9c 03      stx $039c
$00:ee47  9c 0d 04      stz $040d
$00:ee4a  9c 10 04      stz $0410
$00:ee4d  02 85         cop #$85
$00:ee4f  8e f0 00      stx $00f0
$00:ee52  bd 00 00      lda $0000,x
$00:ee55  c9 70         cmp #$70
$00:ee57  00 f0         brk #$f0
$00:ee59  46 c9         lsr $c9
$00:ee5b  30 00         bmi $ee5d
$00:ee5d  d0 03         bne $ee62
$00:ee5f  82 7c 00      brl $eede
$00:ee62  c9 b0         cmp #$b0
$00:ee64  01 d0         ora ($d0,x)
$00:ee66  03 82         ora $82,s
$00:ee68  6a            ror a
$00:ee69  01 c9         ora ($c9,x)
$00:ee6b  70 01         bvs $ee6e
$00:ee6d  d0 03         bne $ee72
$00:ee6f  82 b4 01      brl $f026
$00:ee72  bd 02 00      lda $0002,x
$00:ee75  c9 70         cmp #$70
$00:ee77  01 d0         ora ($d0,x)
$00:ee79  03 82         ora $82,s
$00:ee7b  b3 00         lda ($00,s),y
$00:ee7d  c9 70         cmp #$70
$00:ee7f  00 d0         brk #$d0
$00:ee81  03 82         ora $82,s
$00:ee83  fd 00 82      sbc $8200,x
$00:ee86  eb            xba
$00:ee87  01 ad         ora ($ad,x)
$00:ee89  22 03 89 00   jsl $008903
$00:ee8d  04 d0         tsb $d0
$00:ee8f  17 89         ora [$89],y
$00:ee91  00 80         brk #$80
$00:ee93  f0 0b         beq $eea0
$00:ee95  00 98         brk #$98
$00:ee97  02 10         cop #$10
$00:ee99  00 01         brk #$01
$00:ee9b  00 70         brk #$70
$00:ee9d  00 50         brk #$50
$00:ee9f  00 02         brk #$02
$00:eea1  80 10         bra $eeb3
$00:eea3  02 82         cop #$82
$00:eea5  80 e1         bra $ee88
$00:eea7  02 08         cop #$08
$00:eea9  00 9b         brk #$9b
$00:eeab  a0 ee 02      ldy #$02ee
$00:eeae  80 01         bra $eeb1
$00:eeb0  02 82         cop #$82
$00:eeb2  00 96         brk #$96
$00:eeb4  02 80         cop #$80
$00:eeb6  24 02         bit $02
$00:eeb8  82 02 80      brl $6ebd
$00:eebb  2f 02 82 82   and $828202
$00:eebf  1d 00 ad      ora $ad00,x
$00:eec2  22 03 89 00   jsl $008903
$00:eec6  08            php
$00:eec7  d0 1c         bne $eee5
$00:eec9  89 00         bit #$00
$00:eecb  01 d0         ora ($d0,x)
$00:eecd  2b            pld
$00:eece  89 00         bit #$00
$00:eed0  80 f0         bra $eec2
$00:eed2  0b            phd
$00:eed3  00 98         brk #$98
$00:eed5  02 10         cop #$10
$00:eed7  00 02         brk #$02
$00:eed9  00 70         brk #$70
$00:eedb  00 50         brk #$50
$00:eedd  00 02         brk #$02
$00:eedf  80 02         bra $eee3
$00:eee1  02 82         cop #$82
$00:eee3  80 dc         bra $eec1
$00:eee5  02 80         cop #$80
$00:eee7  03 02         ora $02,s
$00:eee9  82 00 96      brl $84ec
$00:eeec  02 80         cop #$80
$00:eeee  25 02         and $02
$00:eef0  82 02 80      brl $6ef5
$00:eef3  2e 02 82      rol $8202
$00:eef6  82 a7 ff      brl $eea0
$00:eef9  02 08         cop #$08
$00:eefb  01 9b         ora ($9b,x)
$00:eefd  de ee 02      dec $02ee,x
$00:ef00  80 03         bra $ef05
$00:ef02  02 82         cop #$82
$00:ef04  00 96         brk #$96
$00:ef06  02 80         cop #$80
$00:ef08  26 02         rol $02
$00:ef0a  82 02 80      brl $6f0f
$00:ef0d  2f 02 82 82   and $828202
$00:ef11  1d 00 ad      ora $ad00,x
$00:ef14  22 03 89 00   jsl $008903
$00:ef18  02 d0         cop #$d0
$00:ef1a  1c 89 00      trb $0089
$00:ef1d  08            php
$00:ef1e  d0 2b         bne $ef4b
$00:ef20  89 00         bit #$00
$00:ef22  80 f0         bra $ef14
$00:ef24  0b            phd
$00:ef25  00 98         brk #$98
$00:ef27  02 10         cop #$10
$00:ef29  00 03         brk #$03
$00:ef2b  00 70         brk #$70
$00:ef2d  00 50         brk #$50
$00:ef2f  00 02         brk #$02
$00:ef31  80 02         bra $ef35
$00:ef33  02 82         cop #$82
$00:ef35  80 dc         bra $ef13
$00:ef37  02 80         cop #$80
$00:ef39  03 02         ora $02,s
$00:ef3b  82 00 96      brl $853e
$00:ef3e  02 80         cop #$80
$00:ef40  27 02         and [$02]
$00:ef42  82 02 80      brl $6f47
$00:ef45  2f 02 82 82   and $828202
$00:ef49  76 ff         ror $ff,x
$00:ef4b  02 08         cop #$08
$00:ef4d  02 9b         cop #$9b
$00:ef4f  30 ef         bmi $ef40
$00:ef51  02 80         cop #$80
$00:ef53  03 02         ora $02,s
$00:ef55  82 00 96      brl $8558
$00:ef58  02 80         cop #$80
$00:ef5a  29 02         and #$02
$00:ef5c  82 02 80      brl $6f61
$00:ef5f  2e 02 82      rol $8202
$00:ef62  82 00 00      brl $ef65
$00:ef65  ad 22 03      lda $0322
$00:ef68  89 00         bit #$00
$00:ef6a  04 d0         tsb $d0
$00:ef6c  1c 89 00      trb $0089
$00:ef6f  01 d0         ora ($d0,x)
$00:ef71  2b            pld
$00:ef72  89 00         bit #$00
$00:ef74  80 f0         bra $ef66
$00:ef76  0b            phd
$00:ef77  00 98         brk #$98
$00:ef79  02 10         cop #$10
$00:ef7b  00 04         brk #$04
$00:ef7d  00 70         brk #$70
$00:ef7f  00 50         brk #$50
$00:ef81  00 02         brk #$02
$00:ef83  80 10         bra $ef95
$00:ef85  02 82         cop #$82
$00:ef87  80 dc         bra $ef65
$00:ef89  02 80         cop #$80
$00:ef8b  01 02         ora ($02,x)
$00:ef8d  82 00 96      brl $8590
$00:ef90  02 80         cop #$80
$00:ef92  28            plp
$00:ef93  02 82         cop #$82
$00:ef95  02 80         cop #$80
$00:ef97  2f 02 82 82   and $828202
$00:ef9b  76 ff         ror $ff,x
$00:ef9d  02 08         cop #$08
$00:ef9f  03 9b         ora $9b,s
$00:efa1  82 ef 02      brl $f293
$00:efa4  80 01         bra $efa7
$00:efa6  02 82         cop #$82
$00:efa8  00 96         brk #$96
$00:efaa  02 80         cop #$80
$00:efac  2a            rol a
$00:efad  02 82         cop #$82
$00:efaf  02 80         cop #$80
$00:efb1  2f 02 82 82   and $828202
$00:efb5  00 00         brk #$00
$00:efb7  ad 22 03      lda $0322
$00:efba  89 00         bit #$00
$00:efbc  02 d0         cop #$d0
$00:efbe  1c 89 00      trb $0089
$00:efc1  08            php
$00:efc2  d0 2b         bne $efef
$00:efc4  89 00         bit #$00
$00:efc6  80 f0         bra $efb8
$00:efc8  0b            phd
$00:efc9  00 98         brk #$98
$00:efcb  02 10         cop #$10
$00:efcd  00 05         brk #$05
$00:efcf  00 70         brk #$70
$00:efd1  00 50         brk #$50
$00:efd3  00 02         brk #$02
$00:efd5  80 02         bra $efd9
$00:efd7  02 82         cop #$82
$00:efd9  80 dc         bra $efb7
$00:efdb  02 80         cop #$80
$00:efdd  03 02         ora $02,s
$00:efdf  82 00 96      brl $85e2
$00:efe2  02 80         cop #$80
$00:efe4  2b            pld
$00:efe5  02 82         cop #$82
$00:efe7  02 80         cop #$80
$00:efe9  2e 02 82      rol $8202
$00:efec  82 76 ff      brl $ef65
$00:efef  02 08         cop #$08
$00:eff1  04 9b         tsb $9b
$00:eff3  d4 ef         pei ($ef)
$00:eff5  02 80         cop #$80
$00:eff7  03 02         ora $02,s
$00:eff9  82 00 96      brl $85fc
$00:effc  02 80         cop #$80
$00:effe  2c 02 82      bit $8202
$00:f001  02 80         cop #$80
$00:f003  2e 02 82      rol $8202
$00:f006  82 00 00      brl $f009
$00:f009  ad 22 03      lda $0322
$00:f00c  89 00         bit #$00
$00:f00e  04 d0         tsb $d0
$00:f010  1c 89 00      trb $0089
$00:f013  08            php
$00:f014  d0 2b         bne $f041
$00:f016  89 00         bit #$00
$00:f018  80 f0         bra $f00a
$00:f01a  0b            phd
$00:f01b  00 98         brk #$98
$00:f01d  02 10         cop #$10
$00:f01f  00 06         brk #$06
$00:f021  00 70         brk #$70
$00:f023  00 50         brk #$50
$00:f025  00 02         brk #$02
$00:f027  80 10         bra $f039
$00:f029  02 82         cop #$82
$00:f02b  80 dc         bra $f009
$00:f02d  02 80         cop #$80
$00:f02f  01 02         ora ($02,x)
$00:f031  82 00 96      brl $8634
$00:f034  02 80         cop #$80
$00:f036  2d 02 82      and $8202
$00:f039  02 80         cop #$80
$00:f03b  2f 02 82 82   and $828202
$00:f03f  76 ff         ror $ff,x
$00:f041  02 08         cop #$08
$00:f043  05 9b         ora $9b
$00:f045  26 f0         rol $f0
$00:f047  02 80         cop #$80
$00:f049  01 02         ora ($02,x)
$00:f04b  82 00 96      brl $864e
$00:f04e  02 80         cop #$80
$00:f050  1f 02 82 02   ora $028202,x
$00:f054  80 2e         bra $f084
$00:f056  02 82         cop #$82
$00:f058  82 00 00      brl $f05b
$00:f05b  ad 22 03      lda $0322
$00:f05e  89 00         bit #$00
$00:f060  01 d0         ora ($d0,x)
$00:f062  17 89         ora [$89],y
$00:f064  00 80         brk #$80
$00:f066  f0 0b         beq $f073
$00:f068  00 98         brk #$98
$00:f06a  02 10         cop #$10
$00:f06c  00 07         brk #$07
$00:f06e  00 70         brk #$70
$00:f070  00 50         brk #$50
$00:f072  00 02         brk #$02
$00:f074  80 10         bra $f086
$00:f076  02 82         cop #$82
$00:f078  80 e1         bra $f05b
$00:f07a  02 80         cop #$80
$00:f07c  01 02         ora ($02,x)
$00:f07e  82 00 96      brl $8681
$00:f081  02 80         cop #$80
$00:f083  1e 02 82      asl $8202,x
$00:f086  02 80         cop #$80
$00:f088  2e 02 82      rol $8202
$00:f08b  82 7b ff      brl $f009
$00:f08e  ac 9c 03      ldy $039c
$00:f091  b9 00 00      lda $0000,y
$00:f094  8d 74 03      sta $0374
$00:f097  4a            lsr a
$00:f098  4a            lsr a
$00:f099  4a            lsr a
$00:f09a  4a            lsr a
$00:f09b  8d 78 03      sta $0378
$00:f09e  b9 02 00      lda $0002,y
$00:f0a1  8d 76 03      sta $0376
$00:f0a4  4a            lsr a
$00:f0a5  4a            lsr a
$00:f0a6  4a            lsr a
$00:f0a7  4a            lsr a
$00:f0a8  3a            dec a
$00:f0a9  8d 7a 03      sta $037a
$00:f0ac  da            phx
$00:f0ad  22 00 80 02   jsl $028000  ; -> GameLoop_Main
$00:f0b1  fa            plx
$00:f0b2  6b            rtl
$00:f0b3  02 07         cop #$07
$00:f0b5  05 9f         ora $9f
$00:f0b7  bf f0 02 07   lda $0702f0,x
$00:f0bb  04 9f         tsb $9f
$00:f0bd  c2 f0         rep #$f0
$00:f0bf  02 91         cop #$91
$00:f0c1  6b            rtl
$00:f0c2  02 86         cop #$86
$00:f0c4  6b            rtl
$00:f0c5  6b            rtl
$00:f0c6  02 a3         cop #$a3
$00:f0c8  6b            rtl
$00:f0c9  80 e8         bra $f0b3
$00:f0cb  6b            rtl
$00:f0cc  6b            rtl
$00:f0cd  80 e4         bra $f0b3
$00:f0cf  02 80         cop #$80
$00:f0d1  04 02         tsb $02
$00:f0d3  82 6b 02      brl $f341
$00:f0d6  80 05         bra $f0dd
$00:f0d8  02 82         cop #$82
$00:f0da  6b            rtl
$00:f0db  02 80         cop #$80
$00:f0dd  30 02         bmi $f0e1
$00:f0df  82 6b 6b      brl $5c4d
$00:f0e2  6b            rtl
$00:f0e3  02 14         cop #$14
$00:f0e5  b6 00         ldx $00,y
$00:f0e7  ec f0 02      cpx $02f0
$00:f0ea  91 6b         sta ($6b),y
$00:f0ec  02 80         cop #$80
$00:f0ee  18            clc
$00:f0ef  02 82         cop #$82
$00:f0f1  02 91         cop #$91
$00:f0f3  6b            rtl
$00:f0f4  02 14         cop #$14
$00:f0f6  09 00 fb      ora #$fb00
$00:f0f9  f0 6b         beq $f166
$00:f0fb  02 80         cop #$80
$00:f0fd  14 02         trb $02
$00:f0ff  82 02 91      brl $8204
$00:f102  6b            rtl
$00:f103  6b            rtl
$00:f104  02 14         cop #$14
$00:f106  2f 01 0d f1   and $f10d01
$00:f10a  02 91         cop #$91
$00:f10c  6b            rtl
Sub_00_f10d:
$00:f10d  02 80         cop #$80
$00:f10f  12 02         ora ($02)
$00:f111  82 02 91      brl $8216
$00:f114  6b            rtl
$00:f115  02 80         cop #$80
$00:f117  31 02         and ($02),y
$00:f119  82 6b 02      brl $f387
$00:f11c  80 32         bra $f150
$00:f11e  02 82         cop #$82
$00:f120  6b            rtl
$00:f121  02 80         cop #$80
$00:f123  33 02         and ($02,s),y
$00:f125  82 6b 02      brl $f393
$00:f128  07 05         ora [$05]
$00:f12a  9f 33 f1 02   sta $02f133,x
$00:f12e  07 04         ora [$04]
$00:f130  9f 3a f1 02   sta $02f13a,x
$00:f134  92 2d         sta ($2d)
$00:f136  02 94         cop #$94
$00:f138  80 f9         bra $f133
$00:f13a  02 92         cop #$92
$00:f13c  4b            phk
$00:f13d  02 94         cop #$94
$00:f13f  80 f9         bra $f13a
$00:f141  02 07         cop #$07
$00:f143  00 9b         brk #$9b
$00:f145  49 f1 80      eor #$80f1
$00:f148  26 02         rol $02
$00:f14a  ac 61 f1      ldy $f161
$00:f14d  00 70         brk #$70
$00:f14f  00 d0         brk #$d0
$00:f151  00 40         brk #$40
$00:f153  00 02         brk #$02
$00:f155  ac 69 f1      ldy $f169
$00:f158  00 30         brk #$30
$00:f15a  00 50         brk #$50
$00:f15c  01 40         ora ($40,x)
$00:f15e  00 80         brk #$80
$00:f160  0e 02 96      asl $9602
$00:f163  a9 0e 00      lda #$000e
$00:f166  82 eb 00      brl $f254
$00:f169  a9 0b 00      lda #$000b
$00:f16c  82 e5 00      brl $f254
$00:f16f  02 07         cop #$07
$00:f171  01 9b         ora ($9b,x)
$00:f173  77 f1         adc [$f1],y
$00:f175  80 26         bra $f19d
$00:f177  02 ac         cop #$ac
$00:f179  8f f1 00 40   sta $4000f1
$00:f17d  00 60         brk #$60
$00:f17f  01 40         ora ($40,x)
$00:f181  00 02         brk #$02
$00:f183  ac 95 f1      ldy $f195
$00:f186  00 e0         brk #$e0
Sub_00_f188:
$00:f188  00 60         brk #$60
$00:f18a  01 40         ora ($40,x)
$00:f18c  00 80         brk #$80
$00:f18e  0e a9 08      asl $08a9
$00:f191  00 82         brk #$82
$00:f193  bf 00 02 96   lda $960200,x
$00:f197  a9 08 00      lda #$0008
$00:f19a  82 b7 00      brl $f254
$00:f19d  02 07         cop #$07
$00:f19f  02 9b         cop #$9b
$00:f1a1  a5 f1         lda $f1
$00:f1a3  80 26         bra $f1cb
$00:f1a5  02 ac         cop #$ac
$00:f1a7  bd f1 00      lda $00f1,x
$00:f1aa  f0 00         beq $f1ac
$00:f1ac  50 01         bvc $f1af
$00:f1ae  40            rti
$00:f1af  00 02         brk #$02
$00:f1b1  ac c3 f1      ldy $f1c3
$00:f1b4  00 f0         brk #$f0
$00:f1b6  00 80         brk #$80
$00:f1b8  00 40         brk #$40
$00:f1ba  00 80         brk #$80
$00:f1bc  0e a9 07      asl $07a9
$00:f1bf  00 82         brk #$82
$00:f1c1  91 00         sta ($00),y
$00:f1c3  02 98         cop #$98
$00:f1c5  a9 07 00      lda #$0007
$00:f1c8  82 89 00      brl $f254
$00:f1cb  02 07         cop #$07
$00:f1cd  03 9b         ora $9b,s
$00:f1cf  d3 f1         cmp ($f1,s),y
$00:f1d1  80 24         bra $f1f7
$00:f1d3  02 ac         cop #$ac
$00:f1d5  eb            xba
$00:f1d6  f1 00         sbc ($00),y
$00:f1d8  00 01         brk #$01
$00:f1da  70 00         bvs $f1dc
$00:f1dc  40            rti
$00:f1dd  00 02         brk #$02
$00:f1df  ac f1 f1      ldy $f1f1
$00:f1e2  00 a0         brk #$a0
$00:f1e4  01 40         ora ($40,x)
$00:f1e6  01 40         ora ($40,x)
$00:f1e8  00 80         brk #$80
$00:f1ea  0c a9 0c      tsb $0ca9
$00:f1ed  00 82         brk #$82
$00:f1ef  63 00         adc $00,s
$00:f1f1  a9 0f 00      lda #$000f
$00:f1f4  82 5d 00      brl $f254
$00:f1f7  02 07         cop #$07
$00:f1f9  04 9b         tsb $9b
$00:f1fb  ff f1 80 26   sbc $2680f1,x
$00:f1ff  02 ac         cop #$ac
$00:f201  17 f2         ora [$f2],y
$00:f203  00 b0         brk #$b0
$00:f205  01 30         ora ($30,x)
$00:f207  01 40         ora ($40,x)
$00:f209  00 02         brk #$02
$00:f20b  ac 1f f2      ldy $f21f
$00:f20e  00 70         brk #$70
$00:f210  01 90         ora ($90,x)
$00:f212  00 40         brk #$40
$00:f214  00 80         brk #$80
$00:f216  0e 02 96      asl $9602
$00:f219  a9 0b 00      lda #$000b
$00:f21c  82 35 00      brl $f254
$00:f21f  a9 0e 00      lda #$000e
$00:f222  82 2f 00      brl $f254
$00:f225  02 07         cop #$07
$00:f227  05 9b         ora $9b
$00:f229  2d f2 80      and $80f2
$00:f22c  16 02         asl $02,x
$00:f22e  ac 46 f2      ldy $f246
$00:f231  00 70         brk #$70
$00:f233  01 50         ora ($50,x)
$00:f235  00 40         brk #$40
$00:f237  00 02         brk #$02
$00:f239  ac 4e f2      ldy $f24e
$00:f23c  00 00         brk #$00
$00:f23e  01 30         ora ($30,x)
$00:f240  00 40         brk #$40
$00:f242  00 02         brk #$02
$00:f244  86 6b         stx $6b
$00:f246  02 96         cop #$96
$00:f248  a9 0a 00      lda #$000a
$00:f24b  82 06 00      brl $f254
$00:f24e  a9 09 00      lda #$0009
$00:f251  82 00 00      brl $f254
$00:f254  9d 1e 00      sta $001e,x
$00:f257  9e 20 00      stz $0020,x
$00:f25a  02 91         cop #$91
$00:f25c  02 82         cop #$82
$00:f25e  02 1b         cop #$1b
$00:f260  5e f2 ff      lsr $fff2,x
$00:f263  00 a9         brk #$a9
$00:f265  80 bf         bra $f226
$00:f267  0c 26 03      tsb $0326
$00:f26a  02 85         cop #$85
$00:f26c  90 f2         bcc $f260
$00:f26e  00 02         brk #$02
$00:f270  34 00         bit $00,x
$00:f272  86 02         stx $02
$00:f274  1b            tcs
$00:f275  79 f2 a4      adc $a4f2,y
$00:f278  01 ee         ora ($ee,x)
$00:f27a  54 04 9c      mvn $9c,$04
$00:f27d  0d 04 9c      ora $9c04
$00:f280  10 04         bpl $f286
$00:f282  02 09         cop #$09
$00:f284  05 9f         ora $9f
$00:f286  02 10         cop #$10
$00:f288  00 07         brk #$07
$00:f28a  00 70         brk #$70
$00:f28c  00 60         brk #$60
$00:f28e  00 6b         brk #$6b
$00:f290  02 a8         cop #$a8
$00:f292  00 80         brk #$80
$00:f294  0d 02 92      ora $9202
$00:f297  44 02 94      mvp $94,$02
$00:f29a  02 86         cop #$86
$00:f29c  6b            rtl
$00:f29d  bd 16 00      lda $0016,x
$00:f2a0  09 10 20      ora #$2010
$00:f2a3  9d 16 00      sta $0016,x
$00:f2a6  8e 9c 03      stx $039c
$00:f2a9  9c 86 03      stz $0386
$00:f2ac  a9 ff 00      lda #$00ff
$00:f2af  8d 88 03      sta $0388
$00:f2b2  9c 6a 04      stz $046a
$00:f2b5  9c 66 04      stz $0466
$00:f2b8  9c 82 04      stz $0482
$00:f2bb  e2 20         sep #$20
$00:f2bd  a9 93         lda #$93
$00:f2bf  8d 31 21      sta $2131
$00:f2c2  a9 ff         lda #$ff
$00:f2c4  8f 00 02 7f   sta $7f0200
$00:f2c8  c2 20         rep #$20
$00:f2ca  a9 ff ff      lda #$ffff
$00:f2cd  0c 26 03      tsb $0326
$00:f2d0  02 85         cop #$85
$00:f2d2  8c f5 00      sty $00f5
$00:f2d5  02 85         cop #$85
$00:f2d7  e8            inx
$00:f2d8  f4 00 02      pea $0200
$00:f2db  1b            tcs
$00:f2dc  e0 f2 02      cpx #$02f2
$00:f2df  00 a9         brk #$a9
$00:f2e1  1f 00 9d 30   ora $309d00,x
$00:f2e5  00 02         brk #$02
$00:f2e7  03 20         ora $20,s
$00:f2e9  e2 20         sep #$20
$00:f2eb  bd 30 00      lda $0030,x
$00:f2ee  09 e0         ora #$e0
$00:f2f0  8f 00 02 7f   sta $7f0200
$00:f2f4  c2 20         rep #$20
$00:f2f6  de 30 00      dec $0030,x
$00:f2f9  02 1b         cop #$1b
$00:f2fb  ff f2 04 00   sbc $0004f2,x
$00:f2ff  02 04         cop #$04
$00:f301  02 1b         cop #$1b
$00:f303  07 f3         ora [$f3]
$00:f305  78            sei
$00:f306  00 da         brk #$da
$00:f308  a0 92 c1      ldy #$c192
$00:f30b  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:f30f  fa            plx
$00:f310  ee 66 04      inc $0466
$00:f313  02 1b         cop #$1b
$00:f315  19 f3 d0      ora $d0f3,y
$00:f318  02 9c         cop #$9c
$00:f31a  66 04         ror $04
$00:f31c  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:f320  02 1b         cop #$1b
$00:f322  26 f3         rol $f3
$00:f324  70 00         bvs $f326
$00:f326  da            phx
$00:f327  a0 f1 c1      ldy #$c1f1
$00:f32a  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:f32e  fa            plx
$00:f32f  ee 66 04      inc $0466
$00:f332  02 1b         cop #$1b
$00:f334  38            sec
$00:f335  f3 d0         sbc ($d0,s),y
$00:f337  02 9c         cop #$9c
$00:f339  66 04         ror $04
$00:f33b  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:f33f  02 1b         cop #$1b
$00:f341  45 f3         eor $f3
$00:f343  70 00         bvs $f345
$00:f345  da            phx
$00:f346  a0 28 c2      ldy #$c228
$00:f349  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:f34d  fa            plx
$00:f34e  ee 66 04      inc $0466
$00:f351  02 1b         cop #$1b
$00:f353  57 f3         eor [$f3],y
$00:f355  d0 02         bne $f359
$00:f357  9c 66 04      stz $0466
$00:f35a  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:f35e  02 1b         cop #$1b
$00:f360  64 f3         stz $f3
$00:f362  70 00         bvs $f364
$00:f364  da            phx
$00:f365  a0 6f c2      ldy #$c26f
$00:f368  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:f36c  fa            plx
$00:f36d  ee 66 04      inc $0466
$00:f370  02 1b         cop #$1b
$00:f372  76 f3         ror $f3,x
$00:f374  d0 02         bne $f378
$00:f376  9c 66 04      stz $0466
$00:f379  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:f37d  02 1b         cop #$1b
$00:f37f  83 f3         sta $f3,s
$00:f381  70 00         bvs $f383
$00:f383  02 1b         cop #$1b
$00:f385  89 f3 78      bit #$78f3
$00:f388  00 02         brk #$02
$00:f38a  b0 d3         bcs $f35f
$00:f38c  f4 00 10      pea $1000
$00:f38f  20 02 ac      jsr $ac02
$00:f392  8f f4 00 90   sta $9000f4
$00:f396  01 80         ora ($80,x)
$00:f398  00 50         brk #$50
$00:f39a  00 02         brk #$02
$00:f39c  ac 60 f4      ldy $f460
$00:f39f  00 90         brk #$90
$00:f3a1  01 70         ora ($70,x)
$00:f3a3  00 50         brk #$50
$00:f3a5  00 02         brk #$02
$00:f3a7  91 ad         sta ($ad),y
$00:f3a9  82 04 d0      brl $c3b0
$00:f3ac  01 6b         ora ($6b,x)
$00:f3ae  02 1b         cop #$1b
$00:f3b0  b4 f3         ldy $f3,x
$00:f3b2  78            sei
$00:f3b3  00 da         brk #$da
$00:f3b5  a0 bb c2      ldy #$c2bb
$00:f3b8  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:f3bc  fa            plx
$00:f3bd  ee 66 04      inc $0466
$00:f3c0  02 1b         cop #$1b
$00:f3c2  c6 f3         dec $f3
$00:f3c4  38            sec
$00:f3c5  04 9c         tsb $9c
$00:f3c7  66 04         ror $04
$00:f3c9  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:f3cd  02 1b         cop #$1b
$00:f3cf  d3 f3         cmp ($f3,s),y
$00:f3d1  70 00         bvs $f3d3
$00:f3d3  da            phx
$00:f3d4  a0 e1 c2      ldy #$c2e1
$00:f3d7  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:f3db  fa            plx
$00:f3dc  ee 66 04      inc $0466
$00:f3df  02 1b         cop #$1b
$00:f3e1  e5 f3         sbc $f3
$00:f3e3  38            sec
$00:f3e4  04 9c         tsb $9c
$00:f3e6  66 04         ror $04
$00:f3e8  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:f3ec  02 1b         cop #$1b
$00:f3ee  f2 f3         sbc ($f3)
$00:f3f0  70 00         bvs $f3f2
$00:f3f2  da            phx
$00:f3f3  a0 39 c3      ldy #$c339
$00:f3f6  22 69 a7 02   jsl $02a769  ; -> Sub_02_a769
$00:f3fa  fa            plx
$00:f3fb  ee 66 04      inc $0466
$00:f3fe  02 1b         cop #$1b
$00:f400  04 f4         tsb $f4
$00:f402  38            sec
$00:f403  04 9c         tsb $9c
$00:f405  66 04         ror $04
$00:f407  22 ee f6 04   jsl $04f6ee  ; -> InitGraphics
$00:f40b  02 1b         cop #$1b
$00:f40d  11 f4         ora ($f4),y
$00:f40f  70 00         bvs $f411
$00:f411  a9 01 00      lda #$0001
$00:f414  0c b8 03      tsb $03b8
$00:f417  02 1b         cop #$1b
$00:f419  1d f4 78      ora $78f4,x
$00:f41c  00 ee         brk #$ee
$00:f41e  82 04 02      brl $f625
$00:f421  91 ad         sta ($ad),y
$00:f423  82 04 c9      brl $bd2a
$00:f426  04 00         tsb $00
$00:f428  f0 01         beq $f42b
$00:f42a  6b            rtl
$00:f42b  02 1b         cop #$1b
$00:f42d  31 f4         and ($f4),y
$00:f42f  78            sei
$00:f430  00 ce         brk #$ce
$00:f432  66 04         ror $04
$00:f434  02 85         cop #$85
$00:f436  38            sec
$00:f437  f6 00         inc $00,x
$00:f439  02 1b         cop #$1b
$00:f43b  3f f4 f0 00   and $00f0f4,x
$00:f43f  9e 30 00      stz $0030,x
$00:f442  02 03         cop #$03
$00:f444  20 e2 20      jsr $20e2
$00:f447  bd 30 00      lda $0030,x
$00:f44a  09 e0 8f      ora #$8fe0
$00:f44d  00 02         brk #$02
$00:f44f  7f c2 20 fe   adc $fe20c2,x
$00:f453  30 00         bmi $f455
$00:f455  02 1b         cop #$1b
$00:f457  5b            tcd
$00:f458  f4 10 00      pea $0010
$00:f45b  02 04         cop #$04
$00:f45d  02 91         cop #$91
$00:f45f  6b            rtl
$00:f460  02 80         cop #$80
$00:f462  00 02         brk #$02
$00:f464  82 ad 82      brl $7714
$00:f467  04 c9         tsb $c9
$00:f469  01 00         ora ($00,x)
$00:f46b  d0 f3         bne $f460
$00:f46d  02 80         cop #$80
$00:f46f  02 02         cop #$02
$00:f471  82 ad 82      brl $7721
$00:f474  04 c9         tsb $c9
$00:f476  02 00         cop #$00
$00:f478  d0 e6         bne $f460
$00:f47a  02 80         cop #$80
$00:f47c  00 02         brk #$02
$00:f47e  82 02 80      brl $7483
$00:f481  03 02         ora $02,s
$00:f483  82 02 80      brl $7488
$00:f486  01 02         ora ($02,x)
$00:f488  82 ee 82      brl $7779
$00:f48b  04 02         tsb $02
$00:f48d  91 6b         sta ($6b),y
$00:f48f  02 80         cop #$80
$00:f491  04 02         tsb $02
$00:f493  82 ad 82      brl $7743
$00:f496  04 c9         tsb $c9
$00:f498  03 00         ora $00,s
$00:f49a  d0 f3         bne $f48f
$00:f49c  02 80         cop #$80
$00:f49e  04 02         tsb $02
$00:f4a0  82 02 80      brl $74a5
$00:f4a3  06 02         asl $02
$00:f4a5  82 02 80      brl $74aa
$00:f4a8  05 02         ora $02
$00:f4aa  82 ee 82      brl $779b
$00:f4ad  04 02         tsb $02
$00:f4af  91 6b         sta ($6b),y
$00:f4b1  02 80         cop #$80
$00:f4b3  07 02         ora [$02]
$00:f4b5  82 ad 82      brl $7765
$00:f4b8  04 c9         tsb $c9
$00:f4ba  04 00         tsb $00
$00:f4bc  d0 f3         bne $f4b1
$00:f4be  02 80         cop #$80
$00:f4c0  07 02         ora [$02]
$00:f4c2  82 02 80      brl $74c7
$00:f4c5  08            php
$00:f4c6  02 82         cop #$82
$00:f4c8  02 80         cop #$80
$00:f4ca  09 02 82      ora #$8202
$00:f4cd  ee 82 04      inc $0482
$00:f4d0  02 91         cop #$91
$00:f4d2  6b            rtl
$00:f4d3  ee 6a 04      inc $046a
$00:f4d6  ad 6a 04      lda $046a
$00:f4d9  8d 3a 03      sta $033a
$00:f4dc  c9 00 01      cmp #$0100
$00:f4df  f0 01         beq $f4e2
$00:f4e1  6b            rtl
$00:f4e2  ee 82 04      inc $0482
$00:f4e5  02 91         cop #$91
$00:f4e7  6b            rtl
$00:f4e8  bd 16 00      lda $0016,x
$00:f4eb  09 10 00      ora #$0010
$00:f4ee  9d 16 00      sta $0016,x
$00:f4f1  9e 30 00      stz $0030,x
$00:f4f4  da            phx
$00:f4f5  a2 00 00      ldx #$0000
$00:f4f8  a9 70 00      lda #$0070
$00:f4fb  9f 00 78 7e   sta $7e7800,x
$00:f4ff  a9 30 00      lda #$0030
$00:f502  9f 03 78 7e   sta $7e7803,x
$00:f506  a9 10 00      lda #$0010
$00:f509  9f 06 78 7e   sta $7e7806,x
$00:f50d  a9 10 00      lda #$0010
$00:f510  9f 09 78 7e   sta $7e7809,x
$00:f514  a9 10 00      lda #$0010
$00:f517  9f 0c 78 7e   sta $7e780c,x
$00:f51b  a9 08 00      lda #$0008
$00:f51e  9f 0f 78 7e   sta $7e780f,x
$00:f522  a9 01 00      lda #$0001
$00:f525  9f 12 78 7e   sta $7e7812,x
$00:f529  a9 00 00      lda #$0000
$00:f52c  9f 15 78 7e   sta $7e7815,x
$00:f530  9f 01 78 7e   sta $7e7801,x
$00:f534  fa            plx
$00:f535  02 91         cop #$91
$00:f537  da            phx
$00:f538  9b            txy
$00:f539  a2 00 00      ldx #$0000
$00:f53c  ad 6a 04      lda $046a
$00:f53f  4a            lsr a
$00:f540  85 16         sta $16
$00:f542  9f 0a 78 7e   sta $7e780a,x
$00:f546  b9 30 00      lda $0030,y
$00:f549  4a            lsr a
$00:f54a  48            pha
$00:f54b  4a            lsr a
$00:f54c  18            clc
$00:f54d  63 01         adc $01,s
$00:f54f  4a            lsr a
$00:f550  18            clc
$00:f551  65 16         adc $16
$00:f553  9f 10 78 7e   sta $7e7810,x
$00:f557  68            pla
$00:f558  b9 30 00      lda $0030,y
$00:f55b  4a            lsr a
$00:f55c  18            clc
$00:f55d  65 16         adc $16
$00:f55f  9f 04 78 7e   sta $7e7804,x
$00:f563  9f 13 78 7e   sta $7e7813,x
$00:f567  b9 30 00      lda $0030,y
$00:f56a  4a            lsr a
$00:f56b  4a            lsr a
$00:f56c  18            clc
$00:f56d  65 16         adc $16
$00:f56f  9f 07 78 7e   sta $7e7807,x
$00:f573  9f 0d 78 7e   sta $7e780d,x
$00:f577  e2 20         sep #$20
$00:f579  a9 0f         lda #$0f
$00:f57b  eb            xba
$00:f57c  a9 7e         lda #$7e
$00:f57e  a0 00 78      ldy #$7800
$00:f581  22 8a 98 02   jsl $02988a  ; -> Sub_02_988a
$00:f585  c2 20         rep #$20
$00:f587  fa            plx
$00:f588  fe 30 00      inc $0030,x
$00:f58b  6b            rtl
$00:f58c  bd 16 00      lda $0016,x
$00:f58f  09 10 00      ora #$0010
$00:f592  9d 16 00      sta $0016,x
$00:f595  02 91         cop #$91
$00:f597  ad 66 04      lda $0466
$00:f59a  30 42         bmi $f5de
$00:f59c  d0 04         bne $f5a2
$00:f59e  20 e7 f5      jsr $f5e7  ; -> Sub_00_f5e7
$00:f5a1  6b            rtl
$00:f5a2  9e 30 00      stz $0030,x
$00:f5a5  02 03         cop #$03
$00:f5a7  e0 bd 30      cpx #$30bd
$00:f5aa  00 20         brk #$20
$00:f5ac  e7 f5         sbc [$f5]
$00:f5ae  02 27         cop #$27
$00:f5b0  b2 f5         lda ($f5)
$00:f5b2  bd 30 00      lda $0030,x
$00:f5b5  20 e7 f5      jsr $f5e7  ; -> Sub_00_f5e7
$00:f5b8  fe 30 00      inc $0030,x
$00:f5bb  02 04         cop #$04
$00:f5bd  02 91         cop #$91
$00:f5bf  ad 66 04      lda $0466
$00:f5c2  f0 07         beq $f5cb
$00:f5c4  a9 e0 00      lda #$00e0
$00:f5c7  20 e7 f5      jsr $f5e7  ; -> Sub_00_f5e7
$00:f5ca  6b            rtl
$00:f5cb  02 03         cop #$03
$00:f5cd  70 bd         bvs $f58c
$00:f5cf  30 00         bmi $f5d1
$00:f5d1  20 e7 f5      jsr $f5e7  ; -> Sub_00_f5e7
$00:f5d4  de 30 00      dec $0030,x
$00:f5d7  de 30 00      dec $0030,x
$00:f5da  02 04         cop #$04
$00:f5dc  80 b7         bra $f595
$00:f5de  02 91         cop #$91
$00:f5e0  a9 e0 00      lda #$00e0
$00:f5e3  20 e7 f5      jsr $f5e7  ; -> Sub_00_f5e7
$00:f5e6  6b            rtl
Sub_00_f5e7:
$00:f5e7  da            phx
$00:f5e8  e2 20         sep #$20
$00:f5ea  a2 00 00      ldx #$0000
$00:f5ed  c9 00         cmp #$00
$00:f5ef  f0 23         beq $f614
$00:f5f1  c9 80         cmp #$80
$00:f5f3  90 13         bcc $f608
$00:f5f5  38            sec
$00:f5f6  e9 7f         sbc #$7f
$00:f5f8  48            pha
$00:f5f9  a9 7f         lda #$7f
$00:f5fb  9f 00 70 7e   sta $7e7000,x
$00:f5ff  a9 17         lda #$17
$00:f601  9f 01 70 7e   sta $7e7001,x
$00:f605  e8            inx
$00:f606  e8            inx
$00:f607  68            pla
$00:f608  9f 00 70 7e   sta $7e7000,x
$00:f60c  a9 17         lda #$17
$00:f60e  9f 01 70 7e   sta $7e7001,x
$00:f612  e8            inx
$00:f613  e8            inx
$00:f614  a9 01         lda #$01
$00:f616  9f 00 70 7e   sta $7e7000,x
$00:f61a  a9 13         lda #$13
$00:f61c  9f 01 70 7e   sta $7e7001,x
$00:f620  e8            inx
$00:f621  e8            inx
$00:f622  a9 00         lda #$00
$00:f624  9f 00 70 7e   sta $7e7000,x
$00:f628  a9 2c         lda #$2c
$00:f62a  eb            xba
$00:f62b  a9 7e         lda #$7e
$00:f62d  a0 00 70      ldy #$7000
$00:f630  22 8a 98 02   jsl $02988a  ; -> Sub_02_988a
$00:f634  c2 20         rep #$20
$00:f636  fa            plx
$00:f637  60            rts
$00:f638  da            phx
$00:f639  a0 64 e2      ldy #$e264
$00:f63c  22 cf a6 02   jsl $02a6cf
$00:f640  fa            plx
$00:f641  02 1b         cop #$1b
$00:f643  47 f6         eor [$f6]
$00:f645  f0 00         beq $f647
$00:f647  02 31         cop #$31
$00:f649  00 02         brk #$02
$00:f64b  1b            tcs
$00:f64c  50 f6         bvc $f644
$00:f64e  f0 00         beq $f650
$00:f650  02 10         cop #$10
$00:f652  00 0d         brk #$0d
$00:f654  02 00         cop #$00
$00:f656  00 00         brk #$00
$00:f658  00 e2         brk #$e2
$00:f65a  20 9c 82      jsr $829c
$00:f65d  1b            tcs
$00:f65e  c2 20         rep #$20
$00:f660  a9 20 00      lda #$0020
$00:f663  8d b4 03      sta $03b4
$00:f666  ee 54 04      inc $0454
$00:f669  02 91         cop #$91
$00:f66b  6b            rtl
$00:f66c  02 37         cop #$37
$00:f66e  02 91         cop #$91
$00:f670  02 0d         cop #$0d
$00:f672  00 07         brk #$07
$00:f674  04 7f         tsb $7f
$00:f676  f6 02         inc $02,x
$00:f678  0d 00 07      ora $0700
$00:f67b  06 65         asl $65
$00:f67d  f7 6b         sbc [$6b],y
$00:f67f  02 01         cop #$01
$00:f681  b0 f7         bcs $f67a
$00:f683  02 07         cop #$07
$00:f685  00 9b         brk #$9b
$00:f687  9c f6 02      stz $02f6
$00:f68a  1a            inc a
$00:f68b  43 cf         eor $cf,s
$00:f68d  02 54         cop #$54
$00:f68f  f7 af         sbc [$af],y
$00:f691  d0 03         bne $f696
$00:f693  00 d0         brk #$d0
$00:f695  03 82         ora $82,s
$00:f697  56 00         lsr $00,x
$00:f699  82 b8 00      brl $f754
$00:f69c  02 1a         cop #$1a
$00:f69e  23 cf         and $cf,s
$00:f6a0  03 54         ora $54,s
$00:f6a2  f7 af         sbc [$af],y
$00:f6a4  d0 03         bne $f6a9
$00:f6a6  00 d0         brk #$d0
$00:f6a8  03 82         ora $82,s
$00:f6aa  43 00         eor $00,s
$00:f6ac  3a            dec a
$00:f6ad  f0 03         beq $f6b2
$00:f6af  82 a2 00      brl $f754
$00:f6b2  02 01         cop #$01
$00:f6b4  66 f8         ror $f8
$00:f6b6  da            phx
$00:f6b7  a9 09 00      lda #$0009
$00:f6ba  8d 18 03      sta $0318
$00:f6bd  ad ba 03      lda $03ba
$00:f6c0  0a            asl a
$00:f6c1  0a            asl a
$00:f6c2  aa            tax
$00:f6c3  bf d3 f6 00   lda $00f6d3,x
$00:f6c7  8d 7c 03      sta $037c
$00:f6ca  bf d5 f6 00   lda $00f6d5,x
$00:f6ce  8d 7e 03      sta $037e
$00:f6d1  fa            plx
$00:f6d2  6b            rtl
$00:f6d3  70 00         bvs $f6d5
$00:f6d5  a0 00 30      ldy #$3000
$00:f6d8  00 60         brk #$60
$00:f6da  01 f0         ora ($f0,x)
$00:f6dc  00 60         brk #$60
$00:f6de  01 f0         ora ($f0,x)
$00:f6e0  00 60         brk #$60
$00:f6e2  00 b0         brk #$b0
$00:f6e4  01 40         ora ($40,x)
$00:f6e6  01 70         ora ($70,x)
$00:f6e8  01 60         ora ($60,x)
$00:f6ea  00 f0         brk #$f0
$00:f6ec  00 20         brk #$20
$00:f6ee  00 02         brk #$02
$00:f6f0  01 d4         ora ($d4,x)
$00:f6f2  f7 02         sbc [$02],y
$00:f6f4  1a            inc a
$00:f6f5  02 cf         cop #$cf
$00:f6f7  02 54         cop #$54
$00:f6f9  f7 af         sbc [$af],y
$00:f6fb  d0 03         bne $f700
$00:f6fd  00 3a         brk #$3a
$00:f6ff  f0 53         beq $f754
$00:f701  00 66         brk #$66
$00:f703  da            phx
$00:f704  22 e4 f0 04   jsl $04f0e4
$00:f708  fa            plx
$00:f709  a9 c0 7f      lda #$7fc0
$00:f70c  0c 26 03      tsb $0326
$00:f70f  02 03         cop #$03
$00:f711  3d 02 04      and $0402,x
$00:f714  a9 c0 7f      lda #$7fc0
$00:f717  1c 26 03      trb $0326
$00:f71a  02 01         cop #$01
$00:f71c  fa            plx
$00:f71d  f7 02         sbc [$02],y
$00:f71f  1a            inc a
$00:f720  02 cf         cop #$cf
$00:f722  02 54         cop #$54
$00:f724  f7 af         sbc [$af],y
$00:f726  d0 03         bne $f72b
$00:f728  00 f0         brk #$f0
$00:f72a  29 02 01      and #$0102
$00:f72d  25 f8         and $f8
$00:f72f  a9 80 7f      lda #$7f80
$00:f732  0c 26 03      tsb $0326
$00:f735  02 03         cop #$03
$00:f737  1f 02 04 00   ora $000402,x
$00:f73b  8e 02 ac      stx $ac02
$00:f73e  98            tya
$00:f73f  f7 00         sbc [$00],y
$00:f741  70 00         bvs $f743
$00:f743  50 00         bvc $f745
$00:f745  50 00         bvc $f747
$00:f747  02 34         cop #$34
$00:f749  02 03         cop #$03
$00:f74b  3d 02 04      and $0402,x
$00:f74e  02 31         cop #$31
$00:f750  13 02         ora ($02,s),y
$00:f752  91 6b         sta ($6b),y
$00:f754  02 01         cop #$01
$00:f756  48            pha
$00:f757  f8            sed
$00:f758  02 91         cop #$91
$00:f75a  02 0d         cop #$0d
$00:f75c  00 07         brk #$07
$00:f75e  04 64         tsb $64
$00:f760  f7 82         sbc [$82],y
$00:f762  0a            asl a
$00:f763  ff 6b ad 3f   sbc $3fad6b,x
$00:f767  04 f0         tsb $f0
$00:f769  11 9c         ora ($9c),y
$00:f76b  3f 04 02 1b   and $1b0204,x
$00:f76f  73 f7         adc ($f7,s),y
$00:f771  02 00         cop #$00
$00:f773  02 01         cop #$01
$00:f775  6a            ror a
$00:f776  f8            sed
$00:f777  02 27         cop #$27
$00:f779  6e f6 02      ror $02f6
$00:f77c  07 02         ora [$02]
$00:f77e  86 94         stx $94
$00:f780  f7 02         sbc [$02],y
$00:f782  07 00         ora [$00]
$00:f784  1b            tcs
$00:f785  94 f7         sty $f7,x
$00:f787  02 03         cop #$03
$00:f789  03 02         ora $02,s
$00:f78b  04 02         tsb $02
$00:f78d  09 02 86      ora #$8602
$00:f790  02 01         cop #$01
$00:f792  bb            tyx
$00:f793  f8            sed
$00:f794  02 27         cop #$27
$00:f796  6e f6 02      ror $02f6
$00:f799  a8            tay
$00:f79a  00 80         brk #$80
$00:f79c  0e ad 72      asl $72ad
$00:f79f  03 9d         ora $9d,s
$00:f7a1  1c 00 02      trb $0200
$00:f7a4  a3 02         lda $02,s
$00:f7a6  a2 30 02      ldx #$0230
$00:f7a9  80 02         bra $f7ad
$00:f7ab  02 82         cop #$82
$00:f7ad  02 86         cop #$86
$00:f7af  6b            rtl
$00:f7b0  10 81         bpl $f733
$00:f7b2  f0 a9         beq $f75d
$00:f7b4  ad 0d 61      lda $610d
$00:f7b7  62 6f 76      per $6e29
$00:f7ba  65 2e         adc $2e
$00:f7bc  20 11 13      jsr $1311  ; -> Sub_00_1311
$00:f7bf  c2 f7         rep #$f7
$00:f7c1  10 02         bpl $f7c5
$00:f7c3  02 2c         cop #$2c
$00:f7c5  20 0d 68      jsr $680d  ; -> Sub_00_680d
$00:f7c8  6f 77 20 a7   adc $a72077
$00:f7cc  88            dey
$00:f7cd  b7 79         lda [$79],y
$00:f7cf  6f 75 3f 20   adc $203f75
$00:f7d3  0c 88 f1      tsb $f188
$00:f7d6  72 65         adc ($65)
$00:f7d8  63 6f         adc $6f,s
$00:f7da  72 64         adc ($64)
$00:f7dc  20 9a 0d      jsr $0d9a
$00:f7df  fe b5 61      inc $61b5,x
$00:f7e2  63 63         adc $63,s
$00:f7e4  6f 6d 70 6c   adc $6c706d
$00:f7e8  69 73 68      adc #$6873
$00:f7eb  65 64         adc $64
$00:f7ed  2e 0d 49      rol $490d
$00:f7f0  73 20         adc ($20,s),y
$00:f7f2  e4 6f         cpx $6f
$00:f7f4  6b            rtl
$00:f7f5  61 79         adc ($79,x)
$00:f7f7  3f 20 0c 46   and $460c20,x
$00:f7fb  69 6e 69      adc #$696e
$00:f7fe  73 68         adc ($68,s),y
$00:f800  65 64         adc $64
$00:f802  20 72 65      jsr $6572  ; -> Sub_00_6572
$00:f805  63 6f         adc $6f,s
$00:f807  72 64         adc ($64)
$00:f809  69 6e 67      adc #$676e
$00:f80c  2e 20 11      rol $1120
$00:f80f  44 6f 20      mvp $20,$6f
$00:f812  fe 77 69      inc $6977,x
$00:f815  73 68         adc ($68,s),y
$00:f817  20 e2 0d      jsr $0de2  ; -> Sub_00_0de2
$00:f81a  63 6f         adc $6f,s
$00:f81c  6e 74 69      ror $6974
$00:f81f  6e 75 65      ror $6575
$00:f822  3f 20 0c 52   and $520c20,x
$00:f826  65 73         adc $73
$00:f828  74 20         stz $20,x
$00:f82a  77 65         adc [$65],y
$00:f82c  6c 6c 2c      jmp ($2c6c)
$00:f82f  20 e9 ba      jsr $bae9
$00:f832  0d 73 74      ora $7473
$00:f835  69 6c 6c      adc #$6c6c
$00:f838  20 6d 75      jsr $756d  ; -> Sub_00_756d
$00:f83b  63 68         adc $68,s
$00:f83d  20 e2 a1      jsr $a1e2
$00:f840  64 6f         stz $6f
$00:f842  6e 65 2e      ror $2e65
$00:f845  13 52         ora ($52,s),y
$00:f847  fa            plx
$00:f848  02 02         cop #$02
$00:f84a  0d fe 98      ora $98fe
$00:f84d  64 6f         stz $6f
$00:f84f  69 6e 67      adc #$676e
$00:f852  20 77 65      jsr $6577  ; -> Sub_00_6577
$00:f855  6c 6c 2e      jmp ($2e6c)
$00:f858  20 0d 44      jsr $440d  ; -> Sub_00_440d
$00:f85b  6f 20 ca b0   adc $b0ca20
$00:f85f  75 70         adc $70,x
$00:f861  2e 20 13      rol $1320
$00:f864  52 fa         eor ($fa)
$00:f866  08            php
$00:f867  48            pha
$00:f868  04 0c         tsb $0c
$00:f86a  10 81         bpl $f7ed
$00:f86c  f0 a9         beq $f817
$00:f86e  ad 0d 61      lda $610d
$00:f871  62 6f 76      per $6ee3
$00:f874  65 2e         adc $2e
$00:f876  20 11 3c      jsr $3c11
$00:f879  44 6f 20      mvp $20,$6f
$00:f87c  ca            dex
$00:f87d  72 75         adc ($75)
$00:f87f  73 68         adc ($68,s),y
$00:f881  2c 20 a2      bit $a220
$00:f884  a1 0d         lda ($0d,x)
$00:f886  70 61         bvs $f8e9
$00:f888  74 69         stz $69,x
$00:f88a  65 6e         adc $6e
$00:f88c  74 2e         stz $2e,x
$00:f88e  20 95 6d      jsr $6d95
$00:f891  75 73         adc $73,x
$00:f893  74 20         stz $20,x
$00:f895  0d 63 6f      ora $6f63
$00:f898  6e 74 69      ror $6974
$00:f89b  6e 75 65      ror $6575
$00:f89e  20 6d 61      jsr $616d  ; -> Sub_00_616d
$00:f8a1  6b            rtl
$00:f8a2  69 6e 67      adc #$676e
$00:f8a5  20 73 74      jsr $7473
$00:f8a8  65 61         adc $61
$00:f8aa  64 79         stz $79
$00:f8ac  0d 70 72      ora $7270
$00:f8af  6f 67 72 65   adc $657267
$00:f8b3  73 73         adc ($73,s),y
$00:f8b5  2e 3e 20      rol $203e
$00:f8b8  13 52         ora ($52,s),y
$00:f8ba  fa            plx
$00:f8bb  10 81         bpl $f83e
$00:f8bd  f0 a9         beq $f868
$00:f8bf  ad 0d 61      lda $610d
$00:f8c2  62 6f 76      per $6f34
$00:f8c5  65 2e         adc $2e
$00:f8c7  20 11 3c      jsr $3c11
$00:f8ca  91 42         sta ($42),y
$00:f8cc  72 6f         adc ($6f)
$00:f8ce  77 6e         adc [$6e],y
$00:f8d0  20 90 fe      jsr $fe90
$00:f8d3  0d d4 ba      ora $bad4
$00:f8d6  cc cb 36      cpy $36cb
$00:f8d9  20 0d 73      jsr $730d  ; -> Sub_00_730d
$00:f8dc  74 6f         stz $6f,x
$00:f8de  6e 65 73      ror $7365
$00:f8e1  20 bb e4      jsr $e4bb
$00:f8e4  77 6f         adc [$6f],y
$00:f8e6  72 6c         adc ($6c)
$00:f8e8  64 2e         stz $2e
$00:f8ea  20 11 57      jsr $5711  ; -> Sub_00_5711
$00:f8ed  68            pla
$00:f8ee  65 6e         adc $6e
$00:f8f0  20 9a 73      jsr $739a
$00:f8f3  69 78 20      adc #$2078
$00:f8f6  cb            wai
$00:f8f7  74 68         stz $68,x
$00:f8f9  65 73         adc $73
$00:f8fb  65 20         adc $20
$00:f8fd  0d 73 74      ora $7473
$00:f900  6f 6e 65 73   adc $73656e
$00:f904  20 98 67      jsr $6798
$00:f907  61 74         adc ($74,x)
$00:f909  68            pla
$00:f90a  65 72         adc $72
$00:f90c  65 64         adc $64
$00:f90e  2c 20 11      bit $1120
$00:f911  e1 67         sbc ($67,x)
$00:f913  61 74         adc ($74,x)
$00:f915  65 20         adc $20
$00:f917  6c 65 61      jmp ($6165)
$00:f91a  64 69         stz $69
$00:f91c  6e 67 20      ror $2067
$00:f91f  e2 0d         sep #$0d
$00:f921  e1 57         sbc ($57,x)
$00:f923  6f 72 6c 64   adc $646c72
$00:f927  20 cb 45      jsr $45cb  ; -> Sub_00_45cb
$00:f92a  76 69         ror $69,x
$00:f92c  6c 20 0d      jmp ($0d20)
$00:f92f  73 68         adc ($68,s),y
$00:f931  61 6c         adc ($6c,x)
$00:f933  6c 20 a1      jmp ($a120)
$00:f936  6f 70 65 6e   adc $6e6570
$00:f93a  65 64         adc $64
$00:f93c  2e 20 11      rol $1120
$00:f93f  4e 6f 77      lsr $776f
$00:f942  2c 20 fe      bit $fe20
$00:f945  6d 75 73      adc $7375
$00:f948  74 20         stz $20,x
$00:f94a  b3 e2         lda ($e2,s),y
$00:f94c  0d 47 72      ora $7247
$00:f94f  65 65         adc $65
$00:f951  6e 57 6f      ror $6f57
$00:f954  6f 64 20 77   adc $772064
$00:f958  68            pla
$00:f959  65 72         adc $72
$00:f95b  65 20         adc $20
$00:f95d  e1 0d         sbc ($0d,x)
$00:f95f  6e 65 78      ror $7865
$00:f962  74 20         stz $20,x
$00:f964  73 74         adc ($74,s),y
$00:f966  6f 6e 65 20   adc $20656e
$00:f96a  61 77         adc ($77,x)
$00:f96c  61 69         adc ($69,x)
$00:f96e  74 73         stz $73,x
$00:f970  20 0d 79      jsr $790d
$00:f973  6f 75 2e 3e   adc $3e2e75
$00:f977  20 13 52      jsr $5213
$00:f97a  fa            plx
$00:f97b  02 07         cop #$07
$00:f97d  06 9f         asl $9f
$00:f97f  95 f9         sta $f9,x
$00:f981  02 09         cop #$09
$00:f983  06 9f         asl $9f
$00:f985  02 1b         cop #$1b
$00:f987  8b            phb
$00:f988  f9 02 00      sbc $0002,y
$00:f98b  02 01         cop #$01
$00:f98d  98            tya
$00:f98e  f9 02 3a      sbc $3a02,y
$00:f991  02 01         cop #$01
$00:f993  06 fa         asl $fa
$00:f995  02 86         cop #$86
$00:f997  6b            rtl
$00:f998  10 81         bpl $f91b
$00:f99a  f0 a9         beq $f945
$00:f99c  ad 0d 61      lda $610d
$00:f99f  62 6f 76      per $7011
$00:f9a2  65 2e         adc $2e
$00:f9a4  20 11 3c      jsr $3c11
$00:f9a7  4d 79 20      eor $2079
$00:f9aa  66 6f         ror $6f
$00:f9ac  6c 6c 6f      jmp ($6f6c)
$00:f9af  77 65         adc [$65],y
$00:f9b1  72 2c         adc ($2c)
$00:f9b3  20 73 69      jsr $6973
$00:f9b6  6e 63 65      ror $6563
$00:f9b9  20 0d fe      jsr $fe0d  ; -> Sub_00_fe0d
$00:f9bc  f1 a1         sbc ($a1),y
$00:f9be  61 62         adc ($62,x)
$00:f9c0  6c 65 20      jmp ($2065)
$00:f9c3  e2 0d         sep #$0d
$00:f9c5  73 70         adc ($70,s),y
$00:f9c7  65 61         adc $61
$00:f9c9  6b            rtl
$00:f9ca  20 f2 9a      jsr $9af2
$00:f9cd  6c 69 76      jmp ($7669)
$00:f9d0  69 6e 67      adc #$676e
$00:f9d3  20 0d 74      jsr $740d  ; -> Sub_00_740d
$00:f9d6  68            pla
$00:f9d7  69 6e 67      adc #$676e
$00:f9da  73 2c         adc ($2c,s),y
$00:f9dc  20 11 fe      jsr $fe11
$00:f9df  dc b5 97      jml [$97b5]
$00:f9e2  0d 6e 61      ora $616e
$00:f9e5  6d 65 2e      adc $2e65
$00:f9e8  20 8f 63      jsr $638f
$00:f9eb  68            pla
$00:f9ec  6f 6f 73 65   adc $65736f
$00:f9f0  20 97 0d      jsr $0d97  ; -> Sub_00_0d97
$00:f9f3  6e 61 6d      ror $6d61
$00:f9f6  65 20         adc $20
$00:f9f8  ae 79 6f      ldx $6f79
$00:f9fb  75 72         adc $72,x
$00:f9fd  73 65         adc ($65,s),y
$00:f9ff  6c 66 2e      jmp ($2e66)
$00:fa02  20 13 52      jsr $5213
$00:fa05  fa            plx
$00:fa06  10 02         bpl $fa0a
$00:fa08  02 2c         cop #$2c
$00:fa0a  2e 2e 2e      rol $2e2e
$00:fa0d  2e 2e 2e      rol $2e2e
$00:fa10  2e 20 0d      rol $0d20
$00:fa13  57 68         eor [$68],y
$00:fa15  61 74         adc ($74,x)
$00:fa17  20 9c 69      jsr $699c
$00:fa1a  6e 74 65      ror $6574
$00:fa1d  72 65         adc ($65)
$00:fa1f  73 74         adc ($74,s),y
$00:fa21  69 6e 67      adc #$676e
$00:fa24  20 0d 6e      jsr $6e0d
$00:fa27  61 6d         adc ($6d,x)
$00:fa29  65 2e         adc $2e
$00:fa2b  20 11 41      jsr $4111  ; -> Sub_00_4111
$00:fa2e  6c 6c 72      jmp ($726c)
$00:fa31  69 67 68      adc #$6867
$00:fa34  74 2c         stz $2c,x
$00:fa36  20 b3 96      jsr $96b3
$00:fa39  73 61         adc ($61,s),y
$00:fa3b  76 65         ror $65,x
$00:fa3d  20 0d e1      jsr $e10d  ; -> Sub_00_e10d
$00:fa40  f6 ae         inc $ae,x
$00:fa42  9a            txs
$00:fa43  0d 63 72      ora $7263
$00:fa46  65 61         adc $61
$00:fa48  74 75         stz $75,x
$00:fa4a  72 65         adc ($65)
$00:fa4c  73 2e         adc ($2e,s),y
$00:fa4e  20 13 52      jsr $5213
$00:fa51  fa            plx
$00:fa52  12 08         ora ($08)
$00:fa54  08            php
$00:fa55  04 0c         tsb $0c
$00:fa57  ff ff ff ff   sbc $ffffff,x
$00:fa5b  ff ff ff ff   sbc $ffffff,x
$00:fa5f  ff 80 00 00   sbc $000080,x
$00:fa63  00 00         brk #$00
$00:fa65  00 00         brk #$00
$00:fa67  00 20         brk #$20
$00:fa69  00 00         brk #$00
$00:fa6b  00 00         brk #$00
$00:fa6d  00 00         brk #$00
$00:fa6f  00 00         brk #$00
$00:fa71  00 00         brk #$00
$00:fa73  00 00         brk #$00
$00:fa75  00 00         brk #$00
$00:fa77  00 00         brk #$00
$00:fa79  00 00         brk #$00
$00:fa7b  00 08         brk #$08
$00:fa7d  00 00         brk #$00
$00:fa7f  00 ff         brk #$ff
$00:fa81  ff ff ff ff   sbc $ffffff,x
$00:fa85  ff ff ff ff   sbc $ffffff,x
$00:fa89  ff ff ff ff   sbc $ffffff,x
$00:fa8d  ff ff ff ff   sbc $ffffff,x
$00:fa91  ff ff ff ff   sbc $ffffff,x
$00:fa95  ff ff ff ff   sbc $ffffff,x
$00:fa99  ff ff ff ff   sbc $ffffff,x
$00:fa9d  ff ff ff 00   sbc $00ffff,x
$00:faa1  20 00 00      jsr $0000  ; -> Sub_00_0000
$00:faa4  00 00         brk #$00
$00:faa6  00 00         brk #$00
$00:faa8  10 00         bpl $faaa
$00:faaa  00 00         brk #$00
$00:faac  00 00         brk #$00
$00:faae  00 00         brk #$00
$00:fab0  00 00         brk #$00
$00:fab2  00 00         brk #$00
$00:fab4  00 00         brk #$00
$00:fab6  00 00         brk #$00
$00:fab8  00 00         brk #$00
$00:faba  00 00         brk #$00
$00:fabc  00 00         brk #$00
$00:fabe  00 00         brk #$00
$00:fac0  ff ff ff ff   sbc $ffffff,x
$00:fac4  ff ff ff ff   sbc $ffffff,x
$00:fac8  ff ff ff ff   sbc $ffffff,x
$00:facc  ff ff ff ff   sbc $ffffff,x
$00:fad0  ff ff ff ff   sbc $ffffff,x
$00:fad4  ff ff ff ff   sbc $ffffff,x
$00:fad8  ff ff ff ff   sbc $ffffff,x
$00:fadc  ff ff ff ff   sbc $ffffff,x
$00:fae0  00 00         brk #$00
$00:fae2  00 00         brk #$00
$00:fae4  00 00         brk #$00
$00:fae6  00 00         brk #$00
$00:fae8  00 00         brk #$00
$00:faea  00 00         brk #$00
$00:faec  00 00         brk #$00
$00:faee  00 00         brk #$00
$00:faf0  00 00         brk #$00
$00:faf2  00 00         brk #$00
$00:faf4  00 00         brk #$00
$00:faf6  00 00         brk #$00
$00:faf8  00 00         brk #$00
$00:fafa  00 00         brk #$00
$00:fafc  00 00         brk #$00
$00:fafe  00 00         brk #$00
$00:fb00  ff ff ff ff   sbc $ffffff,x
$00:fb04  ff ff ff ff   sbc $ffffff,x
$00:fb08  ff ff ff ff   sbc $ffffff,x
$00:fb0c  ff ff ff ff   sbc $ffffff,x
$00:fb10  ff ff ff ff   sbc $ffffff,x
$00:fb14  ff ff ff ff   sbc $ffffff,x
$00:fb18  ff ff ff ff   sbc $ffffff,x
$00:fb1c  ff ff ff ff   sbc $ffffff,x
$00:fb20  00 00         brk #$00
$00:fb22  00 00         brk #$00
$00:fb24  00 00         brk #$00
$00:fb26  00 00         brk #$00
$00:fb28  00 00         brk #$00
$00:fb2a  00 00         brk #$00
$00:fb2c  00 00         brk #$00
$00:fb2e  00 00         brk #$00
$00:fb30  00 00         brk #$00
$00:fb32  00 00         brk #$00
$00:fb34  00 00         brk #$00
$00:fb36  00 00         brk #$00
$00:fb38  00 00         brk #$00
$00:fb3a  00 00         brk #$00
$00:fb3c  00 00         brk #$00
$00:fb3e  00 00         brk #$00
$00:fb40  ff ff ff ff   sbc $ffffff,x
$00:fb44  ff ff ff ff   sbc $ffffff,x
$00:fb48  ff ff ff ff   sbc $ffffff,x
$00:fb4c  ff ff ff ff   sbc $ffffff,x
$00:fb50  ff ff ff ff   sbc $ffffff,x
$00:fb54  ff ff ff ff   sbc $ffffff,x
$00:fb58  ff ff ff ff   sbc $ffffff,x
$00:fb5c  ff ff ff ff   sbc $ffffff,x
$00:fb60  00 00         brk #$00
$00:fb62  00 00         brk #$00
$00:fb64  00 00         brk #$00
$00:fb66  00 00         brk #$00
$00:fb68  00 00         brk #$00
$00:fb6a  00 00         brk #$00
$00:fb6c  00 00         brk #$00
$00:fb6e  00 00         brk #$00
$00:fb70  00 00         brk #$00
$00:fb72  00 00         brk #$00
$00:fb74  00 00         brk #$00
$00:fb76  00 00         brk #$00
$00:fb78  00 00         brk #$00
$00:fb7a  00 00         brk #$00
$00:fb7c  00 00         brk #$00
$00:fb7e  00 00         brk #$00
$00:fb80  ff ff ff ff   sbc $ffffff,x
$00:fb84  ff ff ff ff   sbc $ffffff,x
$00:fb88  ff ff ff ff   sbc $ffffff,x
$00:fb8c  ff ff ff ff   sbc $ffffff,x
$00:fb90  ff ff ff ff   sbc $ffffff,x
$00:fb94  ff ff ff ff   sbc $ffffff,x
$00:fb98  ff ff ff ff   sbc $ffffff,x
$00:fb9c  ff ff ff ff   sbc $ffffff,x
$00:fba0  00 00         brk #$00
$00:fba2  00 00         brk #$00
$00:fba4  00 00         brk #$00
$00:fba6  00 00         brk #$00
$00:fba8  00 00         brk #$00
$00:fbaa  00 00         brk #$00
$00:fbac  00 00         brk #$00
$00:fbae  00 00         brk #$00
$00:fbb0  00 00         brk #$00
$00:fbb2  00 00         brk #$00
$00:fbb4  00 00         brk #$00
$00:fbb6  00 00         brk #$00
$00:fbb8  00 00         brk #$00
$00:fbba  00 00         brk #$00
$00:fbbc  00 00         brk #$00
$00:fbbe  00 00         brk #$00
$00:fbc0  ff ff ff ff   sbc $ffffff,x
$00:fbc4  ff ff ff ff   sbc $ffffff,x
$00:fbc8  ff ff ff ff   sbc $ffffff,x
$00:fbcc  ff ff ff ff   sbc $ffffff,x
$00:fbd0  ff ff ff ff   sbc $ffffff,x
$00:fbd4  ff ff ff ff   sbc $ffffff,x
$00:fbd8  ff ff ff ff   sbc $ffffff,x
$00:fbdc  ff ff ff ff   sbc $ffffff,x
$00:fbe0  00 00         brk #$00
$00:fbe2  00 00         brk #$00
$00:fbe4  00 00         brk #$00
$00:fbe6  00 00         brk #$00
$00:fbe8  00 00         brk #$00
$00:fbea  00 00         brk #$00
$00:fbec  00 00         brk #$00
$00:fbee  00 00         brk #$00
$00:fbf0  00 00         brk #$00
$00:fbf2  00 00         brk #$00
$00:fbf4  00 00         brk #$00
$00:fbf6  00 00         brk #$00
$00:fbf8  00 00         brk #$00
$00:fbfa  00 00         brk #$00
$00:fbfc  00 00         brk #$00
$00:fbfe  00 00         brk #$00
$00:fc00  ff ff ff ff   sbc $ffffff,x
$00:fc04  ff ff ff ff   sbc $ffffff,x
$00:fc08  ff ff ff ff   sbc $ffffff,x
$00:fc0c  ff ff ff ff   sbc $ffffff,x
$00:fc10  ff ff ff ff   sbc $ffffff,x
$00:fc14  ff ff ff ff   sbc $ffffff,x
$00:fc18  ff ff ff ff   sbc $ffffff,x
$00:fc1c  ff ff ff ff   sbc $ffffff,x
$00:fc20  00 00         brk #$00
$00:fc22  00 00         brk #$00
$00:fc24  00 00         brk #$00
$00:fc26  00 00         brk #$00
$00:fc28  00 00         brk #$00
$00:fc2a  00 00         brk #$00
$00:fc2c  00 00         brk #$00
$00:fc2e  00 00         brk #$00
$00:fc30  00 00         brk #$00
$00:fc32  00 00         brk #$00
$00:fc34  00 00         brk #$00
$00:fc36  00 00         brk #$00
$00:fc38  00 00         brk #$00
$00:fc3a  00 00         brk #$00
$00:fc3c  00 00         brk #$00
$00:fc3e  00 00         brk #$00
$00:fc40  ff ff ff ff   sbc $ffffff,x
$00:fc44  ff ff ff ff   sbc $ffffff,x
$00:fc48  ff ff ff ff   sbc $ffffff,x
$00:fc4c  ff ff ff ff   sbc $ffffff,x
$00:fc50  ff ff ff ff   sbc $ffffff,x
$00:fc54  ff ff ff ff   sbc $ffffff,x
$00:fc58  ff ff ff ff   sbc $ffffff,x
$00:fc5c  ff ff ff ff   sbc $ffffff,x
$00:fc60  00 00         brk #$00
$00:fc62  00 00         brk #$00
$00:fc64  00 00         brk #$00
$00:fc66  00 00         brk #$00
$00:fc68  00 00         brk #$00
$00:fc6a  00 00         brk #$00
$00:fc6c  00 00         brk #$00
$00:fc6e  00 00         brk #$00
$00:fc70  00 00         brk #$00
$00:fc72  00 00         brk #$00
$00:fc74  00 00         brk #$00
$00:fc76  00 00         brk #$00
$00:fc78  00 00         brk #$00
$00:fc7a  00 00         brk #$00
$00:fc7c  00 00         brk #$00
$00:fc7e  00 00         brk #$00
$00:fc80  ff ff ff ff   sbc $ffffff,x
$00:fc84  ff ff ff ff   sbc $ffffff,x
$00:fc88  ff ff ff ff   sbc $ffffff,x
$00:fc8c  ff ff ff ff   sbc $ffffff,x
$00:fc90  ff ff ff ff   sbc $ffffff,x
$00:fc94  ff ff ff ff   sbc $ffffff,x
$00:fc98  ff ff ff ff   sbc $ffffff,x
$00:fc9c  ff ff ff ff   sbc $ffffff,x
$00:fca0  00 00         brk #$00
$00:fca2  00 00         brk #$00
$00:fca4  00 00         brk #$00
$00:fca6  00 00         brk #$00
$00:fca8  00 00         brk #$00
$00:fcaa  00 00         brk #$00
$00:fcac  00 00         brk #$00
$00:fcae  00 00         brk #$00
$00:fcb0  00 00         brk #$00
$00:fcb2  00 00         brk #$00
$00:fcb4  00 00         brk #$00
$00:fcb6  00 00         brk #$00
$00:fcb8  00 00         brk #$00
$00:fcba  00 00         brk #$00
$00:fcbc  00 00         brk #$00
$00:fcbe  00 00         brk #$00
$00:fcc0  ff ff ff ff   sbc $ffffff,x
$00:fcc4  ff ff ff ff   sbc $ffffff,x
$00:fcc8  ff ff ff ff   sbc $ffffff,x
$00:fccc  ff ff ff ff   sbc $ffffff,x
$00:fcd0  ff ff ff ff   sbc $ffffff,x
$00:fcd4  ff ff ff ff   sbc $ffffff,x
$00:fcd8  ff ff ff ff   sbc $ffffff,x
$00:fcdc  ff ff ff ff   sbc $ffffff,x
$00:fce0  00 00         brk #$00
$00:fce2  00 00         brk #$00
$00:fce4  00 00         brk #$00
$00:fce6  00 00         brk #$00
$00:fce8  00 00         brk #$00
$00:fcea  00 00         brk #$00
$00:fcec  00 00         brk #$00
$00:fcee  00 00         brk #$00
$00:fcf0  00 00         brk #$00
$00:fcf2  00 00         brk #$00
$00:fcf4  00 00         brk #$00
$00:fcf6  00 00         brk #$00
$00:fcf8  00 00         brk #$00
$00:fcfa  00 08         brk #$08
$00:fcfc  00 00         brk #$00
$00:fcfe  00 00         brk #$00
$00:fd00  ff ff ff ff   sbc $ffffff,x
$00:fd04  ff ff ff ff   sbc $ffffff,x
$00:fd08  ff ff ff ff   sbc $ffffff,x
$00:fd0c  ff ff ff ff   sbc $ffffff,x
$00:fd10  ff ff ff ff   sbc $ffffff,x
$00:fd14  ff ff ff ff   sbc $ffffff,x
$00:fd18  ff ff ff ff   sbc $ffffff,x
$00:fd1c  ff ff ff ff   sbc $ffffff,x
$00:fd20  00 00         brk #$00
$00:fd22  00 00         brk #$00
$00:fd24  00 00         brk #$00
$00:fd26  00 00         brk #$00
$00:fd28  00 00         brk #$00
$00:fd2a  00 00         brk #$00
$00:fd2c  00 00         brk #$00
$00:fd2e  00 00         brk #$00
$00:fd30  00 00         brk #$00
$00:fd32  00 00         brk #$00
$00:fd34  00 00         brk #$00
$00:fd36  00 00         brk #$00
$00:fd38  00 00         brk #$00
$00:fd3a  00 00         brk #$00
$00:fd3c  00 00         brk #$00
$00:fd3e  08            php
$00:fd3f  00 ff         brk #$ff
$00:fd41  ff ff ff ff   sbc $ffffff,x
$00:fd45  ff ff ff ff   sbc $ffffff,x
$00:fd49  ff ff ff ff   sbc $ffffff,x
$00:fd4d  ff ff ff ff   sbc $ffffff,x
$00:fd51  ff ff ff ff   sbc $ffffff,x
$00:fd55  ff ff ff ff   sbc $ffffff,x
$00:fd59  ff ff ff ff   sbc $ffffff,x
$00:fd5d  ff ff ff 00   sbc $00ffff,x
$00:fd61  00 00         brk #$00
$00:fd63  00 00         brk #$00
$00:fd65  00 00         brk #$00
$00:fd67  00 00         brk #$00
$00:fd69  00 00         brk #$00
$00:fd6b  00 00         brk #$00
$00:fd6d  00 00         brk #$00
$00:fd6f  00 00         brk #$00
$00:fd71  00 00         brk #$00
$00:fd73  00 00         brk #$00
$00:fd75  00 00         brk #$00
$00:fd77  00 08         brk #$08
$00:fd79  00 00         brk #$00
$00:fd7b  00 00         brk #$00
$00:fd7d  00 00         brk #$00
$00:fd7f  00 ff         brk #$ff
$00:fd81  ff ff ff ff   sbc $ffffff,x
$00:fd85  ff ff ff ff   sbc $ffffff,x
$00:fd89  ff ff ff ff   sbc $ffffff,x
$00:fd8d  ff ff ff ff   sbc $ffffff,x
$00:fd91  ff ff ff ff   sbc $ffffff,x
$00:fd95  ff ff ff ff   sbc $ffffff,x
$00:fd99  ff ff ff ff   sbc $ffffff,x
$00:fd9d  ff ff ff 00   sbc $00ffff,x
$00:fda1  00 00         brk #$00
$00:fda3  00 00         brk #$00
$00:fda5  00 00         brk #$00
$00:fda7  00 00         brk #$00
$00:fda9  00 00         brk #$00
$00:fdab  00 00         brk #$00
$00:fdad  00 00         brk #$00
$00:fdaf  00 00         brk #$00
$00:fdb1  00 00         brk #$00
$00:fdb3  00 00         brk #$00
$00:fdb5  00 00         brk #$00
$00:fdb7  00 00         brk #$00
$00:fdb9  00 00         brk #$00
$00:fdbb  00 00         brk #$00
$00:fdbd  00 00         brk #$00
$00:fdbf  00 ff         brk #$ff
$00:fdc1  ff ff ff ff   sbc $ffffff,x
$00:fdc5  ff ff ff ff   sbc $ffffff,x
$00:fdc9  ff ff ff ff   sbc $ffffff,x
$00:fdcd  ff ff ff ff   sbc $ffffff,x
$00:fdd1  ff ff ff ff   sbc $ffffff,x
$00:fdd5  ff ff ff ff   sbc $ffffff,x
$00:fdd9  ff ff ff ff   sbc $ffffff,x
$00:fddd  ff ff ff 00   sbc $00ffff,x
$00:fde1  00 00         brk #$00
$00:fde3  00 00         brk #$00
$00:fde5  00 00         brk #$00
$00:fde7  00 00         brk #$00
$00:fde9  00 00         brk #$00
$00:fdeb  00 00         brk #$00
$00:fded  00 00         brk #$00
$00:fdef  00 00         brk #$00
$00:fdf1  00 00         brk #$00
$00:fdf3  00 00         brk #$00
$00:fdf5  00 00         brk #$00
$00:fdf7  00 00         brk #$00
$00:fdf9  00 00         brk #$00
$00:fdfb  00 00         brk #$00
$00:fdfd  00 40         brk #$40
$00:fdff  00 ff         brk #$ff
$00:fe01  ff ff ff ff   sbc $ffffff,x
$00:fe05  ff ff ff ff   sbc $ffffff,x
$00:fe09  ff ff ff ff   sbc $ffffff,x
Sub_00_fe0d:
$00:fe0d  ff ff ff ff   sbc $ffffff,x
$00:fe11  ff ff ff ff   sbc $ffffff,x
$00:fe15  ff ff ff ff   sbc $ffffff,x
$00:fe19  ff ff ff ff   sbc $ffffff,x
$00:fe1d  ff ff ff 00   sbc $00ffff,x
$00:fe21  00 00         brk #$00
$00:fe23  00 00         brk #$00
$00:fe25  00 00         brk #$00
$00:fe27  00 00         brk #$00
$00:fe29  00 00         brk #$00
$00:fe2b  00 00         brk #$00
$00:fe2d  00 00         brk #$00
$00:fe2f  00 00         brk #$00
$00:fe31  00 00         brk #$00
$00:fe33  00 00         brk #$00
$00:fe35  00 00         brk #$00
$00:fe37  00 00         brk #$00
$00:fe39  00 00         brk #$00
$00:fe3b  00 00         brk #$00
$00:fe3d  00 00         brk #$00
$00:fe3f  00 ff         brk #$ff
$00:fe41  ff ff ff ff   sbc $ffffff,x
$00:fe45  ff ff ff ff   sbc $ffffff,x
$00:fe49  ff ff ff ff   sbc $ffffff,x
$00:fe4d  ff ff ff ff   sbc $ffffff,x
$00:fe51  ff ff ff ff   sbc $ffffff,x
$00:fe55  ff ff ff ff   sbc $ffffff,x
$00:fe59  ff ff ff ff   sbc $ffffff,x
$00:fe5d  ff ff ff 00   sbc $00ffff,x
$00:fe61  00 00         brk #$00
$00:fe63  00 00         brk #$00
$00:fe65  00 00         brk #$00
$00:fe67  00 00         brk #$00
$00:fe69  00 00         brk #$00
$00:fe6b  00 00         brk #$00
$00:fe6d  00 00         brk #$00
$00:fe6f  00 00         brk #$00
$00:fe71  00 00         brk #$00
$00:fe73  00 00         brk #$00
$00:fe75  00 00         brk #$00
$00:fe77  00 00         brk #$00
$00:fe79  00 00         brk #$00
$00:fe7b  00 00         brk #$00
$00:fe7d  00 00         brk #$00
$00:fe7f  00 ff         brk #$ff
$00:fe81  ff ff ff ff   sbc $ffffff,x
$00:fe85  ff ff ff ff   sbc $ffffff,x
$00:fe89  ff ff ff ff   sbc $ffffff,x
$00:fe8d  ff ff ff ff   sbc $ffffff,x
$00:fe91  ff ff ff ff   sbc $ffffff,x
$00:fe95  ff ff ff ff   sbc $ffffff,x
$00:fe99  ff ff ff ff   sbc $ffffff,x
$00:fe9d  ff ff ff 00   sbc $00ffff,x
$00:fea1  00 00         brk #$00
$00:fea3  00 00         brk #$00
$00:fea5  00 00         brk #$00
$00:fea7  00 00         brk #$00
$00:fea9  00 00         brk #$00
$00:feab  00 00         brk #$00
$00:fead  00 00         brk #$00
$00:feaf  00 00         brk #$00
$00:feb1  00 00         brk #$00
$00:feb3  00 00         brk #$00
$00:feb5  00 00         brk #$00
$00:feb7  00 00         brk #$00
$00:feb9  00 00         brk #$00
$00:febb  00 00         brk #$00
$00:febd  00 00         brk #$00
$00:febf  00 ff         brk #$ff
$00:fec1  ff ff ff ff   sbc $ffffff,x
$00:fec5  ff ff ff ff   sbc $ffffff,x
$00:fec9  ff ff ff ff   sbc $ffffff,x
$00:fecd  ff ff ff ff   sbc $ffffff,x
$00:fed1  ff ff ff ff   sbc $ffffff,x
$00:fed5  ff ff ff ff   sbc $ffffff,x
$00:fed9  ff ff ff ff   sbc $ffffff,x
$00:fedd  ff ff ff 00   sbc $00ffff,x
$00:fee1  00 00         brk #$00
$00:fee3  00 00         brk #$00
$00:fee5  00 00         brk #$00
$00:fee7  00 00         brk #$00
$00:fee9  00 00         brk #$00
$00:feeb  00 00         brk #$00
$00:feed  00 00         brk #$00
$00:feef  00 00         brk #$00
$00:fef1  00 00         brk #$00
$00:fef3  00 00         brk #$00
$00:fef5  00 00         brk #$00
$00:fef7  00 00         brk #$00
$00:fef9  00 00         brk #$00
$00:fefb  00 00         brk #$00
$00:fefd  00 00         brk #$00
$00:feff  00 ff         brk #$ff
$00:ff01  ff ff ff ff   sbc $ffffff,x
$00:ff05  ff ff ff ff   sbc $ffffff,x
$00:ff09  ff ff ff ff   sbc $ffffff,x
$00:ff0d  ff ff ff ff   sbc $ffffff,x
$00:ff11  ff ff ff ff   sbc $ffffff,x
$00:ff15  ff ff ff ff   sbc $ffffff,x
$00:ff19  ff ff ff ff   sbc $ffffff,x
$00:ff1d  ff ff ff 00   sbc $00ffff,x
$00:ff21  00 00         brk #$00
$00:ff23  00 00         brk #$00
$00:ff25  00 00         brk #$00
$00:ff27  00 00         brk #$00
$00:ff29  00 00         brk #$00
$00:ff2b  00 00         brk #$00
$00:ff2d  00 00         brk #$00
$00:ff2f  00 00         brk #$00
$00:ff31  00 00         brk #$00
$00:ff33  00 00         brk #$00
$00:ff35  00 00         brk #$00
$00:ff37  08            php
$00:ff38  00 00         brk #$00
$00:ff3a  00 00         brk #$00
$00:ff3c  00 00         brk #$00
$00:ff3e  00 00         brk #$00
$00:ff40  ff ff ff ff   sbc $ffffff,x
$00:ff44  ff ff ff ff   sbc $ffffff,x
$00:ff48  ff ff ff ff   sbc $ffffff,x
$00:ff4c  ff ff ff ff   sbc $ffffff,x
$00:ff50  ff ff ff ff   sbc $ffffff,x
$00:ff54  ff ff ff ff   sbc $ffffff,x
$00:ff58  ff ff ff ff   sbc $ffffff,x
$00:ff5c  ff ff ff ff   sbc $ffffff,x
$00:ff60  00 00         brk #$00
$00:ff62  00 00         brk #$00
$00:ff64  00 00         brk #$00
$00:ff66  00 00         brk #$00
$00:ff68  00 00         brk #$00
$00:ff6a  00 00         brk #$00
$00:ff6c  00 00         brk #$00
$00:ff6e  00 00         brk #$00
$00:ff70  00 00         brk #$00
$00:ff72  00 00         brk #$00
$00:ff74  00 00         brk #$00
$00:ff76  00 00         brk #$00
$00:ff78  00 00         brk #$00
$00:ff7a  00 00         brk #$00
$00:ff7c  00 00         brk #$00
$00:ff7e  00 00         brk #$00
$00:ff80  ff ff ff ff   sbc $ffffff,x
$00:ff84  ff ff ff ff   sbc $ffffff,x
$00:ff88  ff ff ff ff   sbc $ffffff,x
$00:ff8c  ff ff ff ff   sbc $ffffff,x
$00:ff90  ff ff ff ff   sbc $ffffff,x
$00:ff94  ff ff ff ff   sbc $ffffff,x
$00:ff98  ff ff ff ff   sbc $ffffff,x
$00:ff9c  ff ff ff ff   sbc $ffffff,x
$00:ffa0  00 00         brk #$00
$00:ffa2  00 00         brk #$00
$00:ffa4  00 00         brk #$00
$00:ffa6  00 00         brk #$00
$00:ffa8  00 00         brk #$00
$00:ffaa  00 00         brk #$00
$00:ffac  00 00         brk #$00
$00:ffae  00 00         brk #$00
$00:ffb0  00 00         brk #$00
$00:ffb2  00 00         brk #$00
$00:ffb4  00 00         brk #$00
$00:ffb6  00 00         brk #$00
$00:ffb8  00 00         brk #$00
$00:ffba  00 00         brk #$00
$00:ffbc  00 00         brk #$00
$00:ffbe  00 00         brk #$00
$00:ffc0  53 4f         eor ($4f,s),y
$00:ffc2  55 4c         eor $4c,x
$00:ffc4  42 4c         wdm #$4c
$00:ffc6  41 5a         eor ($5a,x)
$00:ffc8  45 52         eor $52
$00:ffca  20 2d 20      jsr $202d
$00:ffcd  31 20         and ($20),y
$00:ffcf  55 53         eor $53,x
$00:ffd1  41 20         eor ($20,x)
$00:ffd3  20 20 20      jsr $2020
$00:ffd6  02 0a         cop #$0a
$00:ffd8  03 01         ora $01,s
$00:ffda  b4 00         ldy $00,x
$00:ffdc  a6 9f         ldx $9f
$00:ffde  59 60 00      eor $0060,y
$00:ffe1  00 80         brk #$80
$00:ffe3  00 1e         brk #$1e
$00:ffe5  d6 fc         dec $fc,x
$00:ffe7  d5 00         cmp $00,x
$00:ffe9  00 42         brk #$42
$00:ffeb  83 00         sta $00,s
$00:ffed  00 a5         brk #$a5
$00:ffef  85 00         sta $00
$00:fff1  00 00         brk #$00
$00:fff3  00 00         brk #$00
$00:fff5  00 00         brk #$00
$00:fff7  89 00 00      bit #$0000
$00:fffa  15 00         ora $00,x
$00:fffc  00 80         brk #$80
$00:fffe  11 d0         ora ($d0),y
