; Soul Blazer (SNES) - Bank $18
; Disassembled from ROM
; File offset: $0c0000-$0c7fff
; CPU address: $18:$8000-$18:$ffff
;===========================================================

.bank $18
.org $8000

$18:8000  30 00		 bmi $8002
$18:8002  4e 2e 0d	  lsr $0d2e
$18:8005  ff e8 b8 03   sbc $03b8e8,x
$18:8009  d0 0e		 bne $8019
$18:800b  ff ef b8 0e   sbc $0eb8ef,x
$18:800f  00 0f		 brk #$0f
$18:8011  ff f1 b8 07   sbc $07b8f1,x
$18:8015  00 10		 brk #$10
$18:8017  ff e0 b8 01   sbc $01b8e0,x
$18:801b  80 11		 bra $802e
$18:801d  ff e0 b8 03   sbc $03b8e0,x
$18:8021  c0 12		 cpy #$12
$18:8023  ff e0 b8 03   sbc $03b8e0,x
$18:8027  80 13		 bra $803c
$18:8029  ff e0 b8 06   sbc $06b8e0,x
$18:802d  15 14		 ora $14,x
$18:802f  ff e0 b8 07   sbc $07b8e0,x
$18:8033  a8			tay
$18:8034  18			clc
$18:8035  00 00		 brk #$00
$18:8037  2f 32 65 7f   and $7f6532
$18:803b  98			tya
$18:803c  b2 cb		 lda ($cb)
$18:803e  e5 fc		 sbc $fc
$18:8040  19 32 4c	  ora $4c32,y
$18:8043  65 72		 adc $72
$18:8045  7f 8c 98 a5   adc $a5988c,x
$18:8049  b2 bf		 lda ($bf)
$18:804b  cb			wai
$18:804c  d8			cld
$18:804d  e5 f2		 sbc $f2
$18:804f  fc 1e 0e	  jsr ($0e1e,x)
$18:8052  00 10		 brk #$10
$18:8054  02 10		 cop #$10
$18:8056  0a			asl a
$18:8057  10 ff		 bpl $8058
$18:8059  00 02		 brk #$02
$18:805b  10 00		 bpl $805d
$18:805d  00 1a		 brk #$1a
$18:805f  10 96		 bpl $7ff7
$18:8061  11 2b		 ora ($2b),y
$18:8063  13 b6		 ora ($b6,s),y
$18:8065  14 63		 trb $63
$18:8067  15 58		 ora $58,x
$18:8069  17 23		 ora [$23],y
$18:806b  1b			tcs
$18:806c  8e 1c fa	  stx $fa1c
$18:806f  06 ea		 asl $ea
$18:8071  00 e0		 brk #$e0
$18:8073  00 e7		 brk #$e7
$18:8075  1c ed de	  trb $deed
$18:8078  e5 fa		 sbc $fa
$18:807a  e1 0a		 sbc ($0a,x)
$18:807c  f5 80		 sbc $80,x
$18:807e  7f 7f f7 03   adc $03f77f,x
$18:8082  aa			tax
$18:8083  00 e3		 brk #$e3
$18:8085  30 46		 bmi $80cd
$18:8087  40			rti
$18:8088  48			pha
$18:8089  5d a4 0c	  eor $0ca4,x
$18:808c  a9 ab		 lda #$ab
$18:808e  3c ac 0c	  bit $0cac,x
$18:8091  ab			plb
$18:8092  a9 a4		 lda #$a4
$18:8094  60			rts
$18:8095  a0 48		 ldy #$48
$18:8097  78			sei
$18:8098  c8			iny
$18:8099  18			clc
$18:809a  c9 48		 cmp #$48
$18:809c  5d a4 0c	  eor $0ca4,x
$18:809f  a9 ab		 lda #$ab
$18:80a1  3c ae 0c	  bit $0cae,x
$18:80a4  ac ab a9	  ldy $a9ab
$18:80a7  60			rts
$18:80a8  a4 48		 ldy $48
$18:80aa  78			sei
$18:80ab  c8			iny
$18:80ac  18			clc
$18:80ad  c9 48		 cmp #$48
$18:80af  5d a4 0c	  eor $0ca4,x
$18:80b2  a9 ab		 lda #$ab
$18:80b4  3c ac 0c	  bit $0cac,x
$18:80b7  ab			plb
$18:80b8  a9 a4		 lda #$a4
$18:80ba  60			rts
$18:80bb  a0 48		 ldy #$48
$18:80bd  78			sei
$18:80be  c8			iny
$18:80bf  18			clc
$18:80c0  c9 48		 cmp #$48
$18:80c2  5d a4 0c	  eor $0ca4,x
$18:80c5  a9 ab		 lda #$ab
$18:80c7  3c ae 0c	  bit $0cae,x
$18:80ca  ac ab a9	  ldy $a9ab
$18:80cd  60			rts
$18:80ce  5b			tcd
$18:80cf  b0 48		 bcs $8119
$18:80d1  78			sei
$18:80d2  c8			iny
$18:80d3  18			clc
$18:80d4  c9 ea		 cmp #$ea
$18:80d6  f4 e1 0c	  pea $0ce1
$18:80d9  ed 8c e0	  sbc $e08c
$18:80dc  02 06		 cop #$06
$18:80de  5d aa ae	  eor $aeaa,x
$18:80e1  b1 b6		 lda ($b6),y
$18:80e3  0c ba 06	  tsb $06ba
$18:80e6  b8			clv
$18:80e7  12 5b		 ora ($5b)
$18:80e9  ba			tsx
$18:80ea  24 c9		 bit $c9
$18:80ec  06 5d		 asl $5d
$18:80ee  ac b0 b3	  ldy $b3b0
$18:80f1  b8			clv
$18:80f2  0c bc 06	  tsb $06bc
$18:80f5  ba			tsx
$18:80f6  12 5b		 ora ($5b)
$18:80f8  bc 24 c9	  ldy $c924,x
$18:80fb  06 5d		 asl $5d
$18:80fd  ae b1 b6	  ldx $b6b1
$18:8100  ba			tsx
$18:8101  0c bd 06	  tsb $06bd
$18:8104  bc 12 5b	  ldy $5b12,x
$18:8107  bd 24 c9	  lda $c924,x
$18:810a  e1 0a		 sbc ($0a,x)
$18:810c  ea			nop
$18:810d  00 ed		 brk #$ed
$18:810f  8c e0 03	  sty $03e0
$18:8112  06 3d		 asl $3d
$18:8114  a9 ab		 lda #$ab
$18:8116  ac ab b0	  ldy $b0ab
$18:8119  ae b1 b0	  ldx $b0b1
$18:811c  ae ac ab	  ldx $abac
$18:811f  ac ae ac	  ldy $acae
$18:8122  ab			plb
$18:8123  a9 e1		 lda #$e1
$18:8125  0b			phd
$18:8126  a5 a9		 lda $a9
$18:8128  ab			plb
$18:8129  a9 ae		 lda #$ae
$18:812b  ac b0 ae	  ldy $aeb0
$18:812e  b1 b0		 lda ($b0),y
$18:8130  ae ac ab	  ldx $abac
$18:8133  ac ae b0	  ldy $b0ae
$18:8136  e1 0a		 sbc ($0a,x)
$18:8138  a9 ab		 lda #$ab
$18:813a  ac ab b0	  ldy $b0ab
$18:813d  ae b1 b0	  ldx $b0b1
$18:8140  ae ac ab	  ldx $abac
$18:8143  ac ae ac	  ldy $acae
$18:8146  ab			plb
$18:8147  a9 e1		 lda #$e1
$18:8149  09 a5		 ora #$a5
$18:814b  a9 ab		 lda #$ab
$18:814d  a9 ae		 lda #$ae
$18:814f  ac b0 ae	  ldy $aeb0
$18:8152  b1 b0		 lda ($b0),y
$18:8154  ae ac ab	  ldx $abac
$18:8157  ac ae b0	  ldy $b0ae
$18:815a  e1 0a		 sbc ($0a,x)
$18:815c  a9 ab		 lda #$ab
$18:815e  ac ab b0	  ldy $b0ab
$18:8161  ae b1 b0	  ldx $b0b1
$18:8164  ae ac ab	  ldx $abac
$18:8167  ac ae ac	  ldy $acae
$18:816a  ab			plb
$18:816b  a9 e1		 lda #$e1
$18:816d  0b			phd
$18:816e  a5 a9		 lda $a9
$18:8170  ab			plb
$18:8171  a9 ae		 lda #$ae
$18:8173  ac b0 ae	  ldy $aeb0
$18:8176  b1 b0		 lda ($b0),y
$18:8178  ae ac ab	  ldx $abac
$18:817b  ac ae b0	  ldy $b0ae
$18:817e  e1 0a		 sbc ($0a,x)
$18:8180  a9 ab		 lda #$ab
$18:8182  ac ab b0	  ldy $b0ab
$18:8185  ae b1 b0	  ldx $b0b1
$18:8188  ae ac ab	  ldx $abac
$18:818b  ac ae ac	  ldy $acae
$18:818e  ab			plb
$18:818f  a9 e1		 lda #$e1
$18:8191  09 a5		 ora #$a5
$18:8193  a9 ab		 lda #$ab
$18:8195  a9 ae		 lda #$ae
$18:8197  ac b0 ae	  ldy $aeb0
$18:819a  b1 b0		 lda ($b0),y
$18:819c  ae ac ab	  ldx $abac
$18:819f  ac ae b0	  ldy $b0ae
$18:81a2  ed aa e0	  sbc $e0aa
$18:81a5  00 0c		 brk #$0c
$18:81a7  5f a9 0c 5d   eor $5d0ca9,x
$18:81ab  a9 a9		 lda #$a9
$18:81ad  a9 0c		 lda #$0c
$18:81af  5f a7 0c 5d   eor $5d0ca7,x
$18:81b3  a7 a7		 lda [$a7]
$18:81b5  a7 0c		 lda [$0c]
$18:81b7  5f ab 0c 5d   eor $5d0cab,x
$18:81bb  ab			plb
$18:81bc  ab			plb
$18:81bd  ab			plb
$18:81be  0c 5f ab	  tsb $ab5f
$18:81c1  0c 5d ab	  tsb $ab5d
$18:81c4  ab			plb
$18:81c5  ab			plb
$18:81c6  0c 5f ac	  tsb $ac5f
$18:81c9  0c 5d ac	  tsb $ac5d
$18:81cc  ac ac 0c	  ldy $0cac
$18:81cf  5f ac 0c 5d   eor $5d0cac,x
$18:81d3  ac ac ac	  ldy $acac
$18:81d6  0c 5f ab	  tsb $ab5f
$18:81d9  0c 5d ab	  tsb $ab5d
$18:81dc  ab			plb
$18:81dd  ab			plb
$18:81de  0c 5f b0	  tsb $b05f
$18:81e1  0c 5d b0	  tsb $b05d
$18:81e4  b0 b0		 bcs $8196
$18:81e6  60			rts
$18:81e7  c9 c9		 cmp #$c9
$18:81e9  00 ea		 brk #$ea
$18:81eb  00 e0		 brk #$e0
$18:81ed  04 ed		 tsb $ed
$18:81ef  87 e1		 sta [$e1]
$18:81f1  0b			phd
$18:81f2  e3 30		 sbc $30,s
$18:81f4  1e 1e 0c	  asl $0c1e,x
$18:81f7  5d ac a9	  eor $a9ac,x
$18:81fa  c9 ac		 cmp #$ac
$18:81fc  a9 06		 lda #$06
$18:81fe  c9 06		 cmp #$06
$18:8200  5b			tcd
$18:8201  a7 0c		 lda [$0c]
$18:8203  5d a9 06	  eor $06a9,x
$18:8206  4d ac a9	  eor $a9ac
$18:8209  0c 5d ac	  tsb $ac5d
$18:820c  0c 5b a9	  tsb $a95b
$18:820f  c9 0c		 cmp #$0c
$18:8211  5d ac a9	  eor $a9ac,x
$18:8214  24 c9		 bit $c9
$18:8216  0c ac a9	  tsb $a9ac
$18:8219  c9 ac		 cmp #$ac
$18:821b  a9 06		 lda #$06
$18:821d  c9 06		 cmp #$06
$18:821f  5b			tcd
$18:8220  a7 0c		 lda [$0c]
$18:8222  5d a9 06	  eor $06a9,x
$18:8225  4d ac a9	  eor $a9ac
$18:8228  0c 5d ac	  tsb $ac5d
$18:822b  0c 5b a9	  tsb $a95b
$18:822e  c9 0c		 cmp #$0c
$18:8230  5d b0 ac	  eor $acb0,x
$18:8233  24 c9		 bit $c9
$18:8235  0c ac a9	  tsb $a9ac
$18:8238  c9 ac		 cmp #$ac
$18:823a  a9 06		 lda #$06
$18:823c  c9 06		 cmp #$06
$18:823e  5b			tcd
$18:823f  a7 0c		 lda [$0c]
$18:8241  5d a9 06	  eor $06a9,x
$18:8244  4d ac a9	  eor $a9ac
$18:8247  0c 5d ac	  tsb $ac5d
$18:824a  0c 5b a9	  tsb $a95b
$18:824d  c9 0c		 cmp #$0c
$18:824f  5d ac a9	  eor $a9ac,x
$18:8252  24 c9		 bit $c9
$18:8254  0c ac a9	  tsb $a9ac
$18:8257  c9 ac		 cmp #$ac
$18:8259  a9 06		 lda #$06
$18:825b  c9 06		 cmp #$06
$18:825d  5b			tcd
$18:825e  a7 0c		 lda [$0c]
$18:8260  5d a9 06	  eor $06a9,x
$18:8263  4d ac a9	  eor $a9ac
$18:8266  0c 5d ac	  tsb $ac5d
$18:8269  0c 5b a9	  tsb $a95b
$18:826c  c9 0c		 cmp #$0c
$18:826e  5d b0 ac	  eor $acb0,x
$18:8271  24 c9		 bit $c9
$18:8273  0c ac a9	  tsb $a9ac
$18:8276  c9 ac		 cmp #$ac
$18:8278  a9 06		 lda #$06
$18:827a  c9 06		 cmp #$06
$18:827c  5b			tcd
$18:827d  a7 0c		 lda [$0c]
$18:827f  5d a9 06	  eor $06a9,x
$18:8282  4d ac a9	  eor $a9ac
$18:8285  0c 5d ac	  tsb $ac5d
$18:8288  0c 5b a9	  tsb $a95b
$18:828b  c9 0c		 cmp #$0c
$18:828d  5d ac a9	  eor $a9ac,x
$18:8290  24 c9		 bit $c9
$18:8292  0c ac a9	  tsb $a9ac
$18:8295  c9 ac		 cmp #$ac
$18:8297  a9 06		 lda #$06
$18:8299  c9 06		 cmp #$06
$18:829b  5b			tcd
$18:829c  a7 0c		 lda [$0c]
$18:829e  5d a9 06	  eor $06a9,x
$18:82a1  4d ac a9	  eor $a9ac
$18:82a4  0c 5d ac	  tsb $ac5d
$18:82a7  0c 5b a9	  tsb $a95b
$18:82aa  c9 0c		 cmp #$0c
$18:82ac  5d b0 ac	  eor $acb0,x
$18:82af  24 c9		 bit $c9
$18:82b1  0c ac a9	  tsb $a9ac
$18:82b4  c9 ac		 cmp #$ac
$18:82b6  a9 06		 lda #$06
$18:82b8  c9 06		 cmp #$06
$18:82ba  5b			tcd
$18:82bb  a7 0c		 lda [$0c]
$18:82bd  5d a9 06	  eor $06a9,x
$18:82c0  4d ac a9	  eor $a9ac
$18:82c3  0c 5d ac	  tsb $ac5d
$18:82c6  0c 5b a9	  tsb $a95b
$18:82c9  c9 0c		 cmp #$0c
$18:82cb  5d ac a9	  eor $a9ac,x
$18:82ce  24 c9		 bit $c9
$18:82d0  0c ac a9	  tsb $a9ac
$18:82d3  c9 ac		 cmp #$ac
$18:82d5  a9 06		 lda #$06
$18:82d7  c9 06		 cmp #$06
$18:82d9  5b			tcd
$18:82da  a7 0c		 lda [$0c]
$18:82dc  5d a9 06	  eor $06a9,x
$18:82df  4d ac a9	  eor $a9ac
$18:82e2  0c 5d ac	  tsb $ac5d
$18:82e5  0c 5b a9	  tsb $a95b
$18:82e8  c9 0c		 cmp #$0c
$18:82ea  5d b0 ac	  eor $acb0,x
$18:82ed  24 c9		 bit $c9
$18:82ef  ed 84 06	  sbc $0684
$18:82f2  aa			tax
$18:82f3  ae b1 b6	  ldx $b6b1
$18:82f6  0c ba 06	  tsb $06ba
$18:82f9  b8			clv
$18:82fa  12 5b		 ora ($5b)
$18:82fc  ba			tsx
$18:82fd  24 c9		 bit $c9
$18:82ff  06 5d		 asl $5d
$18:8301  ac b0 b3	  ldy $b3b0
$18:8304  b8			clv
$18:8305  0c bc 06	  tsb $06bc
$18:8308  ba			tsx
$18:8309  12 5b		 ora ($5b)
$18:830b  bc 24 c9	  ldy $c924,x
$18:830e  06 5d		 asl $5d
$18:8310  ae b1 b6	  ldx $b6b1
$18:8313  ba			tsx
$18:8314  0c bd 06	  tsb $06bd
$18:8317  5c bc 12 5a   jml $5a12bc
$18:831b  bd 24 c9	  lda $c924,x
$18:831e  60			rts
$18:831f  c9 c9		 cmp #$c9
$18:8321  c9 c9		 cmp #$c9
$18:8323  ed aa 06	  sbc $06aa
$18:8326  5d a9 ab	  eor $aba9,x
$18:8329  ac ab b0	  ldy $b0ab
$18:832c  ae b1 b0	  ldx $b0b1
$18:832f  ae ac ab	  ldx $abac
$18:8332  ac ae ac	  ldy $acae
$18:8335  ab			plb
$18:8336  a9 a5		 lda #$a5
$18:8338  a9 ab		 lda #$ab
$18:833a  a9 ae		 lda #$ae
$18:833c  ac b0 ae	  ldy $aeb0
$18:833f  b1 b0		 lda ($b0),y
$18:8341  ae ac ab	  ldx $abac
$18:8344  ac ae b0	  ldy $b0ae
$18:8347  a9 ab		 lda #$ab
$18:8349  ac ab b0	  ldy $b0ab
$18:834c  ae b1 b0	  ldx $b0b1
$18:834f  ae ac ab	  ldx $abac
$18:8352  ac ae ac	  ldy $acae
$18:8355  ab			plb
$18:8356  a9 a5		 lda #$a5
$18:8358  a9 ab		 lda #$ab
$18:835a  a9 ae		 lda #$ae
$18:835c  ac b0 ae	  ldy $aeb0
$18:835f  b1 b0		 lda ($b0),y
$18:8361  ae ac ab	  ldx $abac
$18:8364  ac ae b0	  ldy $b0ae
$18:8367  30 b1		 bmi $831a
$18:8369  18			clc
$18:836a  b0 b1		 bcs $831d
$18:836c  30 b3		 bmi $8321
$18:836e  18			clc
$18:836f  b0 b3		 bcs $8324
$18:8371  30 b5		 bmi $8328
$18:8373  18			clc
$18:8374  b1 b5		 lda ($b5),y
$18:8376  30 b7		 bmi $832f
$18:8378  30 69		 bmi $83e3
$18:837a  bc 60 c9	  ldy $c960,x
$18:837d  c9 00		 cmp #$00
$18:837f  ea			nop
$18:8380  00 e0		 brk #$e0
$18:8382  03 ed		 ora $ed,s
$18:8384  7f e1 0a e3   adc $e30ae1,x
$18:8388  12 46		 ora ($46)
$18:838a  46 24		 lsr $24
$18:838c  5e 91 0c	  lsr $0c91,x
$18:838f  5d 91 24	  eor $2491,x
$18:8392  5e 8f 0c	  lsr $0c8f,x
$18:8395  5d 8f 24	  eor $248f,x
$18:8398  5e 99 0c	  lsr $0c99,x
$18:839b  5d 99 24	  eor $2499,x
$18:839e  5e 98 0c	  lsr $0c98,x
$18:83a1  5d 98 24	  eor $2498,x
$18:83a4  5e 91 0c	  lsr $0c91,x
$18:83a7  5d 91 24	  eor $2491,x
$18:83aa  5e 8f 0c	  lsr $0c8f,x
$18:83ad  5d 8f 24	  eor $248f,x
$18:83b0  5e 99 0c	  lsr $0c99,x
$18:83b3  5d 99 24	  eor $2499,x
$18:83b6  5e 98 0c	  lsr $0c98,x
$18:83b9  5d 98 24	  eor $2498,x
$18:83bc  5e 91 0c	  lsr $0c91,x
$18:83bf  5d 91 24	  eor $2491,x
$18:83c2  5e 8f 0c	  lsr $0c8f,x
$18:83c5  5d 8f 24	  eor $248f,x
$18:83c8  5e 99 0c	  lsr $0c99,x
$18:83cb  5d 99 24	  eor $2499,x
$18:83ce  5e 98 0c	  lsr $0c98,x
$18:83d1  5d 98 24	  eor $2498,x
$18:83d4  5e 91 0c	  lsr $0c91,x
$18:83d7  5d 91 24	  eor $2491,x
$18:83da  5e 8f 0c	  lsr $0c8f,x
$18:83dd  5d 8f 24	  eor $248f,x
$18:83e0  5e 99 0c	  lsr $0c99,x
$18:83e3  5d 99 24	  eor $2499,x
$18:83e6  5e 98 0c	  lsr $0c98,x
$18:83e9  5d 98 24	  eor $2498,x
$18:83ec  5e 91 0c	  lsr $0c91,x
$18:83ef  5d 91 24	  eor $2491,x
$18:83f2  5e 8f 0c	  lsr $0c8f,x
$18:83f5  5d 8f 24	  eor $248f,x
$18:83f8  5e 99 0c	  lsr $0c99,x
$18:83fb  5d 99 24	  eor $2499,x
$18:83fe  5e 98 0c	  lsr $0c98,x
$18:8401  5d 98 24	  eor $2498,x
$18:8404  5e 91 0c	  lsr $0c91,x
$18:8407  5d 91 24	  eor $2491,x
$18:840a  5e 8f 0c	  lsr $0c8f,x
$18:840d  5d 8f 24	  eor $248f,x
$18:8410  5e 99 0c	  lsr $0c99,x
$18:8413  5d 99 24	  eor $2499,x
$18:8416  5e 98 0c	  lsr $0c98,x
$18:8419  5d 98 24	  eor $2498,x
$18:841c  5e 91 0c	  lsr $0c91,x
$18:841f  5d 91 24	  eor $2491,x
$18:8422  5e 8f 0c	  lsr $0c8f,x
$18:8425  5d 8f 24	  eor $248f,x
$18:8428  5e 99 0c	  lsr $0c99,x
$18:842b  5d 99 24	  eor $2499,x
$18:842e  5e 98 0c	  lsr $0c98,x
$18:8431  5d 98 24	  eor $2498,x
$18:8434  5e 91 0c	  lsr $0c91,x
$18:8437  5d 91 24	  eor $2491,x
$18:843a  5e 8f 0c	  lsr $0c8f,x
$18:843d  5d 8f 24	  eor $248f,x
$18:8440  5e 99 0c	  lsr $0c99,x
$18:8443  5d 99 24	  eor $2499,x
$18:8446  5e 98 0c	  lsr $0c98,x
$18:8449  5d 98 ed	  eor $ed98,x
$18:844c  87 48		 sta [$48]
$18:844e  92 0c		 sta ($0c)
$18:8450  c9 0c		 cmp #$0c
$18:8452  4d 92 48	  eor $4892
$18:8455  5d 94 0c	  eor $0c94,x
$18:8458  c9 0c		 cmp #$0c
$18:845a  4d 94 48	  eor $4894
$18:845d  5d 92 0c	  eor $0c92,x
$18:8460  c9 0c		 cmp #$0c
$18:8462  4d 92 18	  eor $1892
$18:8465  5f 91 0c 59   eor $590c91,x
$18:8469  9d 24 5d	  sta $5d24,x
$18:846c  91 18		 sta ($18),y
$18:846e  c9 0c		 cmp #$0c
$18:8470  5f 91 0c 5d   eor $5d0c91,x
$18:8474  91 0c		 sta ($0c),y
$18:8476  59 9d 24	  eor $249d,y
$18:8479  5d 91 18	  eor $1891,x
$18:847c  c9 ed		 cmp #$ed
$18:847e  8c 0c 5f	  sty $5f0c
$18:8481  91 0c		 sta ($0c),y
$18:8483  5d 91 0c	  eor $0c91,x
$18:8486  59 9d 24	  eor $249d,y
$18:8489  5d 91 18	  eor $1891,x
$18:848c  c9 0c		 cmp #$0c
$18:848e  5f 91 0c 5d   eor $5d0c91,x
$18:8492  91 0c		 sta ($0c),y
$18:8494  59 9d 24	  eor $249d,y
$18:8497  5d 91 18	  eor $1891,x
$18:849a  c9 18		 cmp #$18
$18:849c  5f 91 0c 59   eor $590c91,x
$18:84a0  9d 24 5d	  sta $5d24,x
$18:84a3  91 18		 sta ($18),y
$18:84a5  c9 0c		 cmp #$0c
$18:84a7  5f 91 0c 5d   eor $5d0c91,x
$18:84ab  91 0c		 sta ($0c),y
$18:84ad  59 9d 24	  eor $249d,y
$18:84b0  5d 91 18	  eor $1891,x
$18:84b3  c9 0c		 cmp #$0c
$18:84b5  5f 91 0c 5d   eor $5d0c91,x
$18:84b9  91 0c		 sta ($0c),y
$18:84bb  59 9d 24	  eor $249d,y
$18:84be  5d 91 18	  eor $1891,x
$18:84c1  c9 0c		 cmp #$0c
$18:84c3  5f 91 0c 5d   eor $5d0c91,x
$18:84c7  91 0c		 sta ($0c),y
$18:84c9  59 9d 24	  eor $249d,y
$18:84cc  5d 91 18	  eor $1891,x
$18:84cf  c9 ed		 cmp #$ed
$18:84d1  87 0c		 sta [$0c]
$18:84d3  96 96		 stx $96,y
$18:84d5  91 24		 sta ($24),y
$18:84d7  96 0c		 stx $0c,y
$18:84d9  c9 0c		 cmp #$0c
$18:84db  5c 96 0c 5d   jml $5d0c96
$18:84df  98			tya
$18:84e0  98			tya
$18:84e1  93 24		 sta ($24,s),y
$18:84e3  98			tya
$18:84e4  18			clc
$18:84e5  c9 0c		 cmp #$0c
$18:84e7  99 99 94	  sta $9499,y
$18:84ea  24 99		 bit $99
$18:84ec  0c c9 0c	  tsb $0cc9
$18:84ef  5d 99 0c	  eor $0c99,x
$18:84f2  5e 98 0c	  lsr $0c98,x
$18:84f5  5d 98 93	  eor $9398,x
$18:84f8  18			clc
$18:84f9  5d 8c 0c	  eor $0c8c,x
$18:84fc  8c 0c 5d	  sty $5d0c
$18:84ff  98			tya
$18:8500  0c 5b 8c	  tsb $8c5b
$18:8503  18			clc
$18:8504  c8			iny
$18:8505  48			pha
$18:8506  c9 60		 cmp #$60
$18:8508  c9 00		 cmp #$00
$18:850a  e0 05		 cpx #$05
$18:850c  ea			nop
$18:850d  f4 ed 91	  pea $91ed
$18:8510  e1 0a		 sbc ($0a,x)
$18:8512  e3 3c		 sbc $3c,s
$18:8514  1e 32 60	  asl $6032,x
$18:8517  c9 c9		 cmp #$c9
$18:8519  18			clc
$18:851a  c9 18		 cmp #$18
$18:851c  5d a8 0c	  eor $0ca8,x
$18:851f  5b			tcd
$18:8520  a9 18		 lda #$18
$18:8522  c9 0c		 cmp #$0c
$18:8524  5d af c8	  eor $c8af,x
$18:8527  0c 5a b0	  tsb $b05a
$18:852a  48			pha
$18:852b  c9 60		 cmp #$60
$18:852d  c9 c9		 cmp #$c9
$18:852f  18			clc
$18:8530  c9 18		 cmp #$18
$18:8532  5d a8 0c	  eor $0ca8,x
$18:8535  5b			tcd
$18:8536  a9 18		 lda #$18
$18:8538  c9 0c		 cmp #$0c
$18:853a  5d af c8	  eor $c8af,x
$18:853d  0c 5a b0	  tsb $b05a
$18:8540  48			pha
$18:8541  c9 60		 cmp #$60
$18:8543  c9 c9		 cmp #$c9
$18:8545  18			clc
$18:8546  c9 18		 cmp #$18
$18:8548  5d a8 0c	  eor $0ca8,x
$18:854b  5b			tcd
$18:854c  a9 18		 lda #$18
$18:854e  c9 0c		 cmp #$0c
$18:8550  5d af c8	  eor $c8af,x
$18:8553  0c 5a b0	  tsb $b05a
$18:8556  48			pha
$18:8557  c9 60		 cmp #$60
$18:8559  c9 c9		 cmp #$c9
$18:855b  18			clc
$18:855c  c9 18		 cmp #$18
$18:855e  5d a8 0c	  eor $0ca8,x
$18:8561  5b			tcd
$18:8562  a9 18		 lda #$18
$18:8564  c9 0c		 cmp #$0c
$18:8566  5d af c8	  eor $c8af,x
$18:8569  0c 5a b0	  tsb $b05a
$18:856c  48			pha
$18:856d  c9 ed		 cmp #$ed
$18:856f  91 c9		 sta ($c9),y
$18:8571  0c 5d a9	  tsb $a95d
$18:8574  aa			tax
$18:8575  18			clc
$18:8576  ac 30 c9	  ldy $c930
$18:8579  0c 5b aa	  tsb $aa5b
$18:857c  ac 18 5d	  ldy $5d18
$18:857f  ae 30 c9	  ldx $c930
$18:8582  0c ac 0c	  tsb $0cac
$18:8585  5a			phy
$18:8586  ae 18 c8	  ldx $c818
$18:8589  48			pha
$18:858a  c9 60		 cmp #$60
$18:858c  c9 c9		 cmp #$c9
$18:858e  c9 c9		 cmp #$c9
$18:8590  c9 c9		 cmp #$c9
$18:8592  c9 ea		 cmp #$ea
$18:8594  00 ed		 brk #$ed
$18:8596  78			sei
$18:8597  30 5d		 bmi $85f6
$18:8599  a5 18		 lda $18
$18:859b  a4 a5		 ldy $a5
$18:859d  30 a7		 bmi $8546
$18:859f  18			clc
$18:85a0  a4 a7		 ldy $a7
$18:85a2  30 a9		 bmi $854d
$18:85a4  18			clc
$18:85a5  a5 a9		 lda $a9
$18:85a7  30 5c		 bmi $8605
$18:85a9  ab			plb
$18:85aa  30 59		 bmi $8605
$18:85ac  b0 18		 bcs $85c6
$18:85ae  18			clc
$18:85af  c8			iny
$18:85b0  48			pha
$18:85b1  c9 ea		 cmp #$ea
$18:85b3  00 60		 brk #$60
$18:85b5  c9 00		 cmp #$00
$18:85b7  ed be e1	  sbc $e1be
$18:85ba  0a			asl a
$18:85bb  18			clc
$18:85bc  5b			tcd
$18:85bd  ca			dex
$18:85be  0c 53 cb	  tsb $cb53
$18:85c1  0c 5b ca	  tsb $ca5b
$18:85c4  18			clc
$18:85c5  ca			dex
$18:85c6  0c 53 cb	  tsb $cb53
$18:85c9  0c 5b ca	  tsb $ca5b
$18:85cc  18			clc
$18:85cd  ca			dex
$18:85ce  0c 53 cb	  tsb $cb53
$18:85d1  0c 5b ca	  tsb $ca5b
$18:85d4  18			clc
$18:85d5  ca			dex
$18:85d6  0c 53 cb	  tsb $cb53
$18:85d9  0c 5b ca	  tsb $ca5b
$18:85dc  18			clc
$18:85dd  ca			dex
$18:85de  0c 53 cb	  tsb $cb53
$18:85e1  0c 5b ca	  tsb $ca5b
$18:85e4  18			clc
$18:85e5  ca			dex
$18:85e6  0c 53 cb	  tsb $cb53
$18:85e9  0c 5b ca	  tsb $ca5b
$18:85ec  18			clc
$18:85ed  ca			dex
$18:85ee  0c 53 cb	  tsb $cb53
$18:85f1  0c 5b ca	  tsb $ca5b
$18:85f4  18			clc
$18:85f5  ca			dex
$18:85f6  0c 53 cb	  tsb $cb53
$18:85f9  0c 5b ca	  tsb $ca5b
$18:85fc  18			clc
$18:85fd  ca			dex
$18:85fe  0c 53 cb	  tsb $cb53
$18:8601  0c 5b ca	  tsb $ca5b
$18:8604  18			clc
$18:8605  ca			dex
$18:8606  0c 53 cb	  tsb $cb53
$18:8609  0c 5b ca	  tsb $ca5b
$18:860c  18			clc
$18:860d  ca			dex
$18:860e  0c 53 cb	  tsb $cb53
$18:8611  0c 5b ca	  tsb $ca5b
$18:8614  18			clc
$18:8615  ca			dex
$18:8616  0c 53 cb	  tsb $cb53
$18:8619  0c 5b ca	  tsb $ca5b
$18:861c  18			clc
$18:861d  ca			dex
$18:861e  0c 53 cb	  tsb $cb53
$18:8621  0c 5b ca	  tsb $ca5b
$18:8624  18			clc
$18:8625  ca			dex
$18:8626  0c 53 cb	  tsb $cb53
$18:8629  0c 5b ca	  tsb $ca5b
$18:862c  18			clc
$18:862d  ca			dex
$18:862e  0c 53 cb	  tsb $cb53
$18:8631  0c 5b ca	  tsb $ca5b
$18:8634  18			clc
$18:8635  ca			dex
$18:8636  0c 53 cb	  tsb $cb53
$18:8639  0c 5b ca	  tsb $ca5b
$18:863c  18			clc
$18:863d  ca			dex
$18:863e  0c 53 cb	  tsb $cb53
$18:8641  0c 5b ca	  tsb $ca5b
$18:8644  18			clc
$18:8645  ca			dex
$18:8646  0c 53 cb	  tsb $cb53
$18:8649  0c 5b ca	  tsb $ca5b
$18:864c  18			clc
$18:864d  ca			dex
$18:864e  0c 53 cb	  tsb $cb53
$18:8651  0c 5b ca	  tsb $ca5b
$18:8654  18			clc
$18:8655  ca			dex
$18:8656  0c 53 cb	  tsb $cb53
$18:8659  0c 5b ca	  tsb $ca5b
$18:865c  18			clc
$18:865d  ca			dex
$18:865e  0c 53 cb	  tsb $cb53
$18:8661  0c 5b ca	  tsb $ca5b
$18:8664  18			clc
$18:8665  ca			dex
$18:8666  0c 53 cb	  tsb $cb53
$18:8669  0c 5b ca	  tsb $ca5b
$18:866c  18			clc
$18:866d  ca			dex
$18:866e  0c 53 cb	  tsb $cb53
$18:8671  0c 5b ca	  tsb $ca5b
$18:8674  18			clc
$18:8675  ca			dex
$18:8676  0c 53 cb	  tsb $cb53
$18:8679  0c 5b ca	  tsb $ca5b
$18:867c  18			clc
$18:867d  ca			dex
$18:867e  0c 53 cb	  tsb $cb53
$18:8681  0c 5b ca	  tsb $ca5b
$18:8684  18			clc
$18:8685  ca			dex
$18:8686  0c 53 cb	  tsb $cb53
$18:8689  0c 5b ca	  tsb $ca5b
$18:868c  18			clc
$18:868d  ca			dex
$18:868e  0c 53 cb	  tsb $cb53
$18:8691  0c 5b ca	  tsb $ca5b
$18:8694  18			clc
$18:8695  ca			dex
$18:8696  0c 53 cb	  tsb $cb53
$18:8699  0c 5b ca	  tsb $ca5b
$18:869c  18			clc
$18:869d  ca			dex
$18:869e  0c 53 cb	  tsb $cb53
$18:86a1  0c 5b ca	  tsb $ca5b
$18:86a4  18			clc
$18:86a5  ca			dex
$18:86a6  0c 53 cb	  tsb $cb53
$18:86a9  0c 5b ca	  tsb $ca5b
$18:86ac  18			clc
$18:86ad  ca			dex
$18:86ae  0c 53 cb	  tsb $cb53
$18:86b1  0c 5b ca	  tsb $ca5b
$18:86b4  18			clc
$18:86b5  ca			dex
$18:86b6  0c 53 cb	  tsb $cb53
$18:86b9  0c 5b ca	  tsb $ca5b
$18:86bc  18			clc
$18:86bd  ca			dex
$18:86be  0c 53 cb	  tsb $cb53
$18:86c1  0c 5b ca	  tsb $ca5b
$18:86c4  18			clc
$18:86c5  ca			dex
$18:86c6  0c 53 cb	  tsb $cb53
$18:86c9  0c 5b ca	  tsb $ca5b
$18:86cc  18			clc
$18:86cd  ca			dex
$18:86ce  0c 53 cb	  tsb $cb53
$18:86d1  0c 5b ca	  tsb $ca5b
$18:86d4  18			clc
$18:86d5  ca			dex
$18:86d6  0c 53 cb	  tsb $cb53
$18:86d9  0c 5b ca	  tsb $ca5b
$18:86dc  18			clc
$18:86dd  ca			dex
$18:86de  0c 53 cb	  tsb $cb53
$18:86e1  0c 5b ca	  tsb $ca5b
$18:86e4  18			clc
$18:86e5  ca			dex
$18:86e6  0c 53 cb	  tsb $cb53
$18:86e9  0c 5b ca	  tsb $ca5b
$18:86ec  18			clc
$18:86ed  ca			dex
$18:86ee  0c 53 cb	  tsb $cb53
$18:86f1  0c 5b ca	  tsb $ca5b
$18:86f4  18			clc
$18:86f5  ca			dex
$18:86f6  0c 53 cb	  tsb $cb53
$18:86f9  0c 5b ca	  tsb $ca5b
$18:86fc  18			clc
$18:86fd  ca			dex
$18:86fe  0c 53 cb	  tsb $cb53
$18:8701  0c 5b ca	  tsb $ca5b
$18:8704  18			clc
$18:8705  ca			dex
$18:8706  0c 53 cb	  tsb $cb53
$18:8709  0c 5b ca	  tsb $ca5b
$18:870c  18			clc
$18:870d  ca			dex
$18:870e  0c 53 cb	  tsb $cb53
$18:8711  0c 5b ca	  tsb $ca5b
$18:8714  18			clc
$18:8715  ca			dex
$18:8716  0c 53 cb	  tsb $cb53
$18:8719  0c 5b ca	  tsb $ca5b
$18:871c  18			clc
$18:871d  ca			dex
$18:871e  0c 53 cb	  tsb $cb53
$18:8721  0c 5b ca	  tsb $ca5b
$18:8724  18			clc
$18:8725  ca			dex
$18:8726  0c 53 cb	  tsb $cb53
$18:8729  0c 5b ca	  tsb $ca5b
$18:872c  18			clc
$18:872d  ca			dex
$18:872e  0c 53 cb	  tsb $cb53
$18:8731  0c 5b ca	  tsb $ca5b
$18:8734  18			clc
$18:8735  ca			dex
$18:8736  0c 53 cb	  tsb $cb53
$18:8739  0c 5b ca	  tsb $ca5b
$18:873c  18			clc
$18:873d  ca			dex
$18:873e  0c 53 cb	  tsb $cb53
$18:8741  0c 5b ca	  tsb $ca5b
$18:8744  18			clc
$18:8745  ca			dex
$18:8746  0c 53 cb	  tsb $cb53
$18:8749  0c 5b ca	  tsb $ca5b
$18:874c  18			clc
$18:874d  ca			dex
$18:874e  0c 53 cb	  tsb $cb53
$18:8751  0c 5b ca	  tsb $ca5b
$18:8754  18			clc
$18:8755  ca			dex
$18:8756  0c 53 cb	  tsb $cb53
$18:8759  0c 5b ca	  tsb $ca5b
$18:875c  18			clc
$18:875d  ca			dex
$18:875e  0c 53 cb	  tsb $cb53
$18:8761  0c 5b ca	  tsb $ca5b
$18:8764  18			clc
$18:8765  ca			dex
$18:8766  0c 53 cb	  tsb $cb53
$18:8769  0c 5b ca	  tsb $ca5b
$18:876c  18			clc
$18:876d  ca			dex
$18:876e  18			clc
$18:876f  55 cb		 eor $cb,x
$18:8771  12 5b		 ora ($5b)
$18:8773  ca			dex
$18:8774  06 ca		 asl $ca
$18:8776  18			clc
$18:8777  55 cb		 eor $cb,x
$18:8779  18			clc
$18:877a  5b			tcd
$18:877b  ca			dex
$18:877c  0c 55 cb	  tsb $cb55
$18:877f  18			clc
$18:8780  5b			tcd
$18:8781  ca			dex
$18:8782  0c ca 12	  tsb $12ca
$18:8785  55 cb		 eor $cb,x
$18:8787  06 5b		 asl $5b
$18:8789  ca			dex
$18:878a  18			clc
$18:878b  ca			dex
$18:878c  18			clc
$18:878d  55 cb		 eor $cb,x
$18:878f  12 5b		 ora ($5b)
$18:8791  ca			dex
$18:8792  06 ca		 asl $ca
$18:8794  18			clc
$18:8795  55 cb		 eor $cb,x
$18:8797  18			clc
$18:8798  5b			tcd
$18:8799  ca			dex
$18:879a  0c 55 cb	  tsb $cb55
$18:879d  1e 5b ca	  asl $ca5b,x
$18:87a0  06 ca		 asl $ca
$18:87a2  0c 55 cb	  tsb $cb55
$18:87a5  0c 5b ca	  tsb $ca5b
$18:87a8  60			rts
$18:87a9  c9 c9		 cmp #$c9
$18:87ab  00 ea		 brk #$ea
$18:87ad  03 ed		 ora $ed,s
$18:87af  82 0c 5f	  brl $e6be
$18:87b2  cb			wai
$18:87b3  06 5d		 asl $5d
$18:87b5  cb			wai
$18:87b6  cb			wai
$18:87b7  0c 5f cb	  tsb $cb5f
$18:87ba  06 5d		 asl $5d
$18:87bc  cb			wai
$18:87bd  cb			wai
$18:87be  0c 5f cb	  tsb $cb5f
$18:87c1  06 5d		 asl $5d
$18:87c3  cb			wai
$18:87c4  cb			wai
$18:87c5  06 5f		 asl $5f
$18:87c7  cb			wai
$18:87c8  06 5d		 asl $5d
$18:87ca  cb			wai
$18:87cb  cb			wai
$18:87cc  cb			wai
$18:87cd  0c 5f cb	  tsb $cb5f
$18:87d0  06 5d		 asl $5d
$18:87d2  cb			wai
$18:87d3  cb			wai
$18:87d4  0c 5f cb	  tsb $cb5f
$18:87d7  06 5d		 asl $5d
$18:87d9  cb			wai
$18:87da  cb			wai
$18:87db  06 5f		 asl $5f
$18:87dd  cb			wai
$18:87de  06 5d		 asl $5d
$18:87e0  cb			wai
$18:87e1  0c cb 06	  tsb $06cb
$18:87e4  5f cb 06 5d   eor $5d06cb,x
$18:87e8  cb			wai
$18:87e9  cb			wai
$18:87ea  cb			wai
$18:87eb  0c 5f cb	  tsb $cb5f
$18:87ee  06 5d		 asl $5d
$18:87f0  cb			wai
$18:87f1  cb			wai
$18:87f2  0c 5f cb	  tsb $cb5f
$18:87f5  06 5d		 asl $5d
$18:87f7  cb			wai
$18:87f8  cb			wai
$18:87f9  0c 5f cb	  tsb $cb5f
$18:87fc  06 5d		 asl $5d
$18:87fe  cb			wai
$18:87ff  cb			wai
$18:8800  06 5f		 asl $5f
$18:8802  cb			wai
$18:8803  06 5d		 asl $5d
$18:8805  cb			wai
$18:8806  cb			wai
$18:8807  cb			wai
$18:8808  0c 5f cb	  tsb $cb5f
$18:880b  06 5d		 asl $5d
$18:880d  cb			wai
$18:880e  cb			wai
$18:880f  0c 5f cb	  tsb $cb5f
$18:8812  06 5d		 asl $5d
$18:8814  cb			wai
$18:8815  cb			wai
$18:8816  06 5f		 asl $5f
$18:8818  cb			wai
$18:8819  06 5d		 asl $5d
$18:881b  cb			wai
$18:881c  cb			wai
$18:881d  cb			wai
$18:881e  0c 5f cb	  tsb $cb5f
$18:8821  06 5d		 asl $5d
$18:8823  cb			wai
$18:8824  cb			wai
$18:8825  0c 5f cb	  tsb $cb5f
$18:8828  06 5d		 asl $5d
$18:882a  cb			wai
$18:882b  cb			wai
$18:882c  0c 5f cb	  tsb $cb5f
$18:882f  06 5d		 asl $5d
$18:8831  cb			wai
$18:8832  cb			wai
$18:8833  0c 5f cb	  tsb $cb5f
$18:8836  06 5d		 asl $5d
$18:8838  cb			wai
$18:8839  cb			wai
$18:883a  06 5f		 asl $5f
$18:883c  cb			wai
$18:883d  06 5d		 asl $5d
$18:883f  cb			wai
$18:8840  cb			wai
$18:8841  cb			wai
$18:8842  0c 5f cb	  tsb $cb5f
$18:8845  06 5d		 asl $5d
$18:8847  cb			wai
$18:8848  cb			wai
$18:8849  0c 5f cb	  tsb $cb5f
$18:884c  06 5d		 asl $5d
$18:884e  cb			wai
$18:884f  cb			wai
$18:8850  06 5f		 asl $5f
$18:8852  cb			wai
$18:8853  06 5d		 asl $5d
$18:8855  cb			wai
$18:8856  0c cb 06	  tsb $06cb
$18:8859  5f cb 06 5d   eor $5d06cb,x
$18:885d  cb			wai
$18:885e  cb			wai
$18:885f  cb			wai
$18:8860  0c 5f cb	  tsb $cb5f
$18:8863  06 5d		 asl $5d
$18:8865  cb			wai
$18:8866  cb			wai
$18:8867  0c 5f cb	  tsb $cb5f
$18:886a  06 5d		 asl $5d
$18:886c  cb			wai
$18:886d  cb			wai
$18:886e  0c 5f cb	  tsb $cb5f
$18:8871  06 5d		 asl $5d
$18:8873  cb			wai
$18:8874  cb			wai
$18:8875  06 5f		 asl $5f
$18:8877  cb			wai
$18:8878  06 5d		 asl $5d
$18:887a  cb			wai
$18:887b  cb			wai
$18:887c  cb			wai
$18:887d  0c 5f cb	  tsb $cb5f
$18:8880  06 5d		 asl $5d
$18:8882  cb			wai
$18:8883  cb			wai
$18:8884  0c 5f cb	  tsb $cb5f
$18:8887  06 5d		 asl $5d
$18:8889  cb			wai
$18:888a  cb			wai
$18:888b  06 5f		 asl $5f
$18:888d  cb			wai
$18:888e  06 5d		 asl $5d
$18:8890  cb			wai
$18:8891  cb			wai
$18:8892  cb			wai
$18:8893  0c 5f cb	  tsb $cb5f
$18:8896  06 5d		 asl $5d
$18:8898  cb			wai
$18:8899  cb			wai
$18:889a  0c 5f cb	  tsb $cb5f
$18:889d  06 5d		 asl $5d
$18:889f  cb			wai
$18:88a0  cb			wai
$18:88a1  0c 5f cb	  tsb $cb5f
$18:88a4  06 5d		 asl $5d
$18:88a6  cb			wai
$18:88a7  cb			wai
$18:88a8  0c 5f cb	  tsb $cb5f
$18:88ab  06 5d		 asl $5d
$18:88ad  cb			wai
$18:88ae  cb			wai
$18:88af  06 5f		 asl $5f
$18:88b1  cb			wai
$18:88b2  06 5d		 asl $5d
$18:88b4  cb			wai
$18:88b5  cb			wai
$18:88b6  cb			wai
$18:88b7  0c 5f cb	  tsb $cb5f
$18:88ba  06 5d		 asl $5d
$18:88bc  cb			wai
$18:88bd  cb			wai
$18:88be  0c 5f cb	  tsb $cb5f
$18:88c1  06 5d		 asl $5d
$18:88c3  cb			wai
$18:88c4  cb			wai
$18:88c5  06 5f		 asl $5f
$18:88c7  cb			wai
$18:88c8  06 5d		 asl $5d
$18:88ca  cb			wai
$18:88cb  0c cb 06	  tsb $06cb
$18:88ce  5f cb 06 5d   eor $5d06cb,x
$18:88d2  cb			wai
$18:88d3  cb			wai
$18:88d4  cb			wai
$18:88d5  0c 5f cb	  tsb $cb5f
$18:88d8  06 5d		 asl $5d
$18:88da  cb			wai
$18:88db  cb			wai
$18:88dc  0c 5f cb	  tsb $cb5f
$18:88df  06 5d		 asl $5d
$18:88e1  cb			wai
$18:88e2  cb			wai
$18:88e3  0c 5f cb	  tsb $cb5f
$18:88e6  06 5d		 asl $5d
$18:88e8  cb			wai
$18:88e9  cb			wai
$18:88ea  06 5f		 asl $5f
$18:88ec  cb			wai
$18:88ed  06 5d		 asl $5d
$18:88ef  cb			wai
$18:88f0  cb			wai
$18:88f1  cb			wai
$18:88f2  0c 5f cb	  tsb $cb5f
$18:88f5  06 5d		 asl $5d
$18:88f7  cb			wai
$18:88f8  cb			wai
$18:88f9  0c 5f cb	  tsb $cb5f
$18:88fc  06 5d		 asl $5d
$18:88fe  cb			wai
$18:88ff  cb			wai
$18:8900  06 5f		 asl $5f
$18:8902  cb			wai
$18:8903  06 5d		 asl $5d
$18:8905  cb			wai
$18:8906  cb			wai
$18:8907  cb			wai
$18:8908  0c 5f cb	  tsb $cb5f
$18:890b  06 5d		 asl $5d
$18:890d  cb			wai
$18:890e  cb			wai
$18:890f  0c 5f cb	  tsb $cb5f
$18:8912  06 5d		 asl $5d
$18:8914  cb			wai
$18:8915  cb			wai
$18:8916  0c 5f cb	  tsb $cb5f
$18:8919  06 5d		 asl $5d
$18:891b  cb			wai
$18:891c  cb			wai
$18:891d  0c 5f cb	  tsb $cb5f
$18:8920  06 5d		 asl $5d
$18:8922  cb			wai
$18:8923  cb			wai
$18:8924  06 5f		 asl $5f
$18:8926  cb			wai
$18:8927  06 5d		 asl $5d
$18:8929  cb			wai
$18:892a  cb			wai
$18:892b  cb			wai
$18:892c  0c 5f cb	  tsb $cb5f
$18:892f  06 5d		 asl $5d
$18:8931  cb			wai
$18:8932  cb			wai
$18:8933  0c 5f cb	  tsb $cb5f
$18:8936  06 5d		 asl $5d
$18:8938  cb			wai
$18:8939  cb			wai
$18:893a  06 5f		 asl $5f
$18:893c  cb			wai
$18:893d  06 5d		 asl $5d
$18:893f  cb			wai
$18:8940  0c cb 06	  tsb $06cb
$18:8943  5f cb 06 5d   eor $5d06cb,x
$18:8947  cb			wai
$18:8948  cb			wai
$18:8949  cb			wai
$18:894a  0c 5f cb	  tsb $cb5f
$18:894d  06 5d		 asl $5d
$18:894f  cb			wai
$18:8950  cb			wai
$18:8951  0c 5f cb	  tsb $cb5f
$18:8954  06 5d		 asl $5d
$18:8956  cb			wai
$18:8957  cb			wai
$18:8958  0c 5f cb	  tsb $cb5f
$18:895b  06 5d		 asl $5d
$18:895d  cb			wai
$18:895e  cb			wai
$18:895f  06 5f		 asl $5f
$18:8961  cb			wai
$18:8962  06 5d		 asl $5d
$18:8964  cb			wai
$18:8965  cb			wai
$18:8966  cb			wai
$18:8967  0c 5f cb	  tsb $cb5f
$18:896a  06 5d		 asl $5d
$18:896c  cb			wai
$18:896d  cb			wai
$18:896e  0c 5f cb	  tsb $cb5f
$18:8971  06 5d		 asl $5d
$18:8973  cb			wai
$18:8974  cb			wai
$18:8975  06 5f		 asl $5f
$18:8977  cb			wai
$18:8978  06 5d		 asl $5d
$18:897a  cb			wai
$18:897b  cb			wai
$18:897c  cb			wai
$18:897d  0c 5f cb	  tsb $cb5f
$18:8980  06 5d		 asl $5d
$18:8982  cb			wai
$18:8983  cb			wai
$18:8984  0c 5f cb	  tsb $cb5f
$18:8987  06 5d		 asl $5d
$18:8989  cb			wai
$18:898a  cb			wai
$18:898b  0c 5f cb	  tsb $cb5f
$18:898e  06 5d		 asl $5d
$18:8990  cb			wai
$18:8991  cb			wai
$18:8992  0c 5f cb	  tsb $cb5f
$18:8995  06 5d		 asl $5d
$18:8997  cb			wai
$18:8998  cb			wai
$18:8999  06 5f		 asl $5f
$18:899b  cb			wai
$18:899c  06 5d		 asl $5d
$18:899e  cb			wai
$18:899f  cb			wai
$18:89a0  cb			wai
$18:89a1  0c 5f cb	  tsb $cb5f
$18:89a4  06 5d		 asl $5d
$18:89a6  cb			wai
$18:89a7  cb			wai
$18:89a8  0c 5f cb	  tsb $cb5f
$18:89ab  06 5d		 asl $5d
$18:89ad  cb			wai
$18:89ae  cb			wai
$18:89af  06 5f		 asl $5f
$18:89b1  cb			wai
$18:89b2  06 5d		 asl $5d
$18:89b4  cb			wai
$18:89b5  0c cb 06	  tsb $06cb
$18:89b8  5f cb 06 5d   eor $5d06cb,x
$18:89bc  cb			wai
$18:89bd  cb			wai
$18:89be  cb			wai
$18:89bf  0c 5f cb	  tsb $cb5f
$18:89c2  06 5d		 asl $5d
$18:89c4  cb			wai
$18:89c5  cb			wai
$18:89c6  0c 5f cb	  tsb $cb5f
$18:89c9  06 5d		 asl $5d
$18:89cb  cb			wai
$18:89cc  cb			wai
$18:89cd  0c 5f cb	  tsb $cb5f
$18:89d0  06 5d		 asl $5d
$18:89d2  cb			wai
$18:89d3  cb			wai
$18:89d4  06 5f		 asl $5f
$18:89d6  cb			wai
$18:89d7  06 5d		 asl $5d
$18:89d9  cb			wai
$18:89da  cb			wai
$18:89db  cb			wai
$18:89dc  0c 5f cb	  tsb $cb5f
$18:89df  06 5d		 asl $5d
$18:89e1  cb			wai
$18:89e2  cb			wai
$18:89e3  0c 5f cb	  tsb $cb5f
$18:89e6  06 5d		 asl $5d
$18:89e8  cb			wai
$18:89e9  cb			wai
$18:89ea  06 5f		 asl $5f
$18:89ec  cb			wai
$18:89ed  06 5d		 asl $5d
$18:89ef  cb			wai
$18:89f0  cb			wai
$18:89f1  cb			wai
$18:89f2  0c 5f cb	  tsb $cb5f
$18:89f5  06 5d		 asl $5d
$18:89f7  cb			wai
$18:89f8  cb			wai
$18:89f9  0c 5f cb	  tsb $cb5f
$18:89fc  06 5d		 asl $5d
$18:89fe  cb			wai
$18:89ff  cb			wai
$18:8a00  0c 5f cb	  tsb $cb5f
$18:8a03  06 5d		 asl $5d
$18:8a05  cb			wai
$18:8a06  cb			wai
$18:8a07  0c 5f cb	  tsb $cb5f
$18:8a0a  06 5d		 asl $5d
$18:8a0c  cb			wai
$18:8a0d  cb			wai
$18:8a0e  06 5f		 asl $5f
$18:8a10  cb			wai
$18:8a11  06 5d		 asl $5d
$18:8a13  cb			wai
$18:8a14  cb			wai
$18:8a15  cb			wai
$18:8a16  0c 5f cb	  tsb $cb5f
$18:8a19  06 5d		 asl $5d
$18:8a1b  cb			wai
$18:8a1c  cb			wai
$18:8a1d  0c 5f cb	  tsb $cb5f
$18:8a20  06 5d		 asl $5d
$18:8a22  cb			wai
$18:8a23  cb			wai
$18:8a24  06 5f		 asl $5f
$18:8a26  cb			wai
$18:8a27  06 5d		 asl $5d
$18:8a29  cb			wai
$18:8a2a  0c cb 06	  tsb $06cb
$18:8a2d  5f cb 06 5d   eor $5d06cb,x
$18:8a31  cb			wai
$18:8a32  cb			wai
$18:8a33  cb			wai
$18:8a34  0c 5f cb	  tsb $cb5f
$18:8a37  06 5d		 asl $5d
$18:8a39  cb			wai
$18:8a3a  cb			wai
$18:8a3b  0c 5f cb	  tsb $cb5f
$18:8a3e  06 5d		 asl $5d
$18:8a40  cb			wai
$18:8a41  cb			wai
$18:8a42  0c 5f cb	  tsb $cb5f
$18:8a45  06 5d		 asl $5d
$18:8a47  cb			wai
$18:8a48  cb			wai
$18:8a49  06 5f		 asl $5f
$18:8a4b  cb			wai
$18:8a4c  06 5d		 asl $5d
$18:8a4e  cb			wai
$18:8a4f  cb			wai
$18:8a50  cb			wai
$18:8a51  0c 5f cb	  tsb $cb5f
$18:8a54  06 5d		 asl $5d
$18:8a56  cb			wai
$18:8a57  cb			wai
$18:8a58  0c 5f cb	  tsb $cb5f
$18:8a5b  06 5d		 asl $5d
$18:8a5d  cb			wai
$18:8a5e  cb			wai
$18:8a5f  06 5f		 asl $5f
$18:8a61  cb			wai
$18:8a62  06 5d		 asl $5d
$18:8a64  cb			wai
$18:8a65  cb			wai
$18:8a66  cb			wai
$18:8a67  0c 5f cb	  tsb $cb5f
$18:8a6a  06 5d		 asl $5d
$18:8a6c  cb			wai
$18:8a6d  cb			wai
$18:8a6e  0c 5f cb	  tsb $cb5f
$18:8a71  06 5d		 asl $5d
$18:8a73  cb			wai
$18:8a74  cb			wai
$18:8a75  0c 5f cb	  tsb $cb5f
$18:8a78  06 5d		 asl $5d
$18:8a7a  cb			wai
$18:8a7b  cb			wai
$18:8a7c  0c 5f cb	  tsb $cb5f
$18:8a7f  06 5d		 asl $5d
$18:8a81  cb			wai
$18:8a82  cb			wai
$18:8a83  06 5f		 asl $5f
$18:8a85  cb			wai
$18:8a86  06 5d		 asl $5d
$18:8a88  cb			wai
$18:8a89  cb			wai
$18:8a8a  cb			wai
$18:8a8b  0c 5f cb	  tsb $cb5f
$18:8a8e  06 5d		 asl $5d
$18:8a90  cb			wai
$18:8a91  cb			wai
$18:8a92  0c 5f cb	  tsb $cb5f
$18:8a95  06 5d		 asl $5d
$18:8a97  cb			wai
$18:8a98  cb			wai
$18:8a99  06 5f		 asl $5f
$18:8a9b  cb			wai
$18:8a9c  06 5d		 asl $5d
$18:8a9e  cb			wai
$18:8a9f  0c cb 06	  tsb $06cb
$18:8aa2  5f cb 06 5d   eor $5d06cb,x
$18:8aa6  cb			wai
$18:8aa7  cb			wai
$18:8aa8  cb			wai
$18:8aa9  0c 5f cb	  tsb $cb5f
$18:8aac  06 5d		 asl $5d
$18:8aae  cb			wai
$18:8aaf  cb			wai
$18:8ab0  0c 5f cb	  tsb $cb5f
$18:8ab3  06 5d		 asl $5d
$18:8ab5  cb			wai
$18:8ab6  cb			wai
$18:8ab7  0c 5f cb	  tsb $cb5f
$18:8aba  06 5d		 asl $5d
$18:8abc  cb			wai
$18:8abd  cb			wai
$18:8abe  06 5f		 asl $5f
$18:8ac0  cb			wai
$18:8ac1  06 5d		 asl $5d
$18:8ac3  cb			wai
$18:8ac4  cb			wai
$18:8ac5  cb			wai
$18:8ac6  0c 5f cb	  tsb $cb5f
$18:8ac9  06 5d		 asl $5d
$18:8acb  cb			wai
$18:8acc  cb			wai
$18:8acd  0c 5f cb	  tsb $cb5f
$18:8ad0  06 5d		 asl $5d
$18:8ad2  cb			wai
$18:8ad3  cb			wai
$18:8ad4  06 5f		 asl $5f
$18:8ad6  cb			wai
$18:8ad7  06 5d		 asl $5d
$18:8ad9  cb			wai
$18:8ada  cb			wai
$18:8adb  cb			wai
$18:8adc  0c 5f cb	  tsb $cb5f
$18:8adf  06 5d		 asl $5d
$18:8ae1  cb			wai
$18:8ae2  cb			wai
$18:8ae3  0c 5f cb	  tsb $cb5f
$18:8ae6  06 5d		 asl $5d
$18:8ae8  cb			wai
$18:8ae9  cb			wai
$18:8aea  0c 5f cb	  tsb $cb5f
$18:8aed  06 5d		 asl $5d
$18:8aef  cb			wai
$18:8af0  cb			wai
$18:8af1  0c 5f cb	  tsb $cb5f
$18:8af4  06 5d		 asl $5d
$18:8af6  cb			wai
$18:8af7  cb			wai
$18:8af8  06 5f		 asl $5f
$18:8afa  cb			wai
$18:8afb  06 5d		 asl $5d
$18:8afd  cb			wai
$18:8afe  cb			wai
$18:8aff  cb			wai
$18:8b00  0c 5f cb	  tsb $cb5f
$18:8b03  06 5d		 asl $5d
$18:8b05  cb			wai
$18:8b06  cb			wai
$18:8b07  0c 5f cb	  tsb $cb5f
$18:8b0a  06 5d		 asl $5d
$18:8b0c  cb			wai
$18:8b0d  cb			wai
$18:8b0e  06 5f		 asl $5f
$18:8b10  cb			wai
$18:8b11  06 5d		 asl $5d
$18:8b13  cb			wai
$18:8b14  0c cb 06	  tsb $06cb
$18:8b17  5f cb 06 5d   eor $5d06cb,x
$18:8b1b  cb			wai
$18:8b1c  cb			wai
$18:8b1d  cb			wai
$18:8b1e  0c 5f cb	  tsb $cb5f
$18:8b21  06 5d		 asl $5d
$18:8b23  cb			wai
$18:8b24  cb			wai
$18:8b25  0c 5f cb	  tsb $cb5f
$18:8b28  06 5d		 asl $5d
$18:8b2a  cb			wai
$18:8b2b  cb			wai
$18:8b2c  0c 5f cb	  tsb $cb5f
$18:8b2f  06 5d		 asl $5d
$18:8b31  cb			wai
$18:8b32  cb			wai
$18:8b33  06 5f		 asl $5f
$18:8b35  cb			wai
$18:8b36  06 5d		 asl $5d
$18:8b38  cb			wai
$18:8b39  cb			wai
$18:8b3a  cb			wai
$18:8b3b  0c 5f cb	  tsb $cb5f
$18:8b3e  06 5d		 asl $5d
$18:8b40  cb			wai
$18:8b41  cb			wai
$18:8b42  0c 5f cb	  tsb $cb5f
$18:8b45  06 5d		 asl $5d
$18:8b47  cb			wai
$18:8b48  cb			wai
$18:8b49  06 5f		 asl $5f
$18:8b4b  cb			wai
$18:8b4c  06 5d		 asl $5d
$18:8b4e  cb			wai
$18:8b4f  cb			wai
$18:8b50  cb			wai
$18:8b51  0c 5f cb	  tsb $cb5f
$18:8b54  06 5d		 asl $5d
$18:8b56  cb			wai
$18:8b57  cb			wai
$18:8b58  0c 5f cb	  tsb $cb5f
$18:8b5b  06 5d		 asl $5d
$18:8b5d  cb			wai
$18:8b5e  cb			wai
$18:8b5f  0c 5f cb	  tsb $cb5f
$18:8b62  06 5d		 asl $5d
$18:8b64  cb			wai
$18:8b65  cb			wai
$18:8b66  06 5f		 asl $5f
$18:8b68  cb			wai
$18:8b69  06 5d		 asl $5d
$18:8b6b  cb			wai
$18:8b6c  cb			wai
$18:8b6d  cb			wai
$18:8b6e  06 5f		 asl $5f
$18:8b70  cb			wai
$18:8b71  06 5d		 asl $5d
$18:8b73  cb			wai
$18:8b74  cb			wai
$18:8b75  cb			wai
$18:8b76  00 ea		 brk #$ea
$18:8b78  00 e0		 brk #$e0
$18:8b7a  00 ed		 brk #$ed
$18:8b7c  82 e1 0a	  brl $9660
$18:8b7f  e3 30		 sbc $30,s
$18:8b81  46 40		 lsr $40
$18:8b83  06 c9		 asl $c9
$18:8b85  48			pha
$18:8b86  5d a4 0c	  eor $0ca4,x
$18:8b89  a9 ab		 lda #$ab
$18:8b8b  3c ac 0c	  bit $0cac,x
$18:8b8e  ab			plb
$18:8b8f  a9 a4		 lda #$a4
$18:8b91  60			rts
$18:8b92  a0 48		 ldy #$48
$18:8b94  78			sei
$18:8b95  c8			iny
$18:8b96  18			clc
$18:8b97  c9 48		 cmp #$48
$18:8b99  5d a4 0c	  eor $0ca4,x
$18:8b9c  a9 ab		 lda #$ab
$18:8b9e  3c ae 0c	  bit $0cae,x
$18:8ba1  ac ab a9	  ldy $a9ab
$18:8ba4  60			rts
$18:8ba5  a4 48		 ldy $48
$18:8ba7  78			sei
$18:8ba8  c8			iny
$18:8ba9  18			clc
$18:8baa  c9 48		 cmp #$48
$18:8bac  5d a4 0c	  eor $0ca4,x
$18:8baf  a9 ab		 lda #$ab
$18:8bb1  3c ac 0c	  bit $0cac,x
$18:8bb4  ab			plb
$18:8bb5  a9 a4		 lda #$a4
$18:8bb7  60			rts
$18:8bb8  a0 48		 ldy #$48
$18:8bba  78			sei
$18:8bbb  c8			iny
$18:8bbc  18			clc
$18:8bbd  c9 48		 cmp #$48
$18:8bbf  5d a4 0c	  eor $0ca4,x
$18:8bc2  a9 ab		 lda #$ab
$18:8bc4  3c ae 0c	  bit $0cae,x
$18:8bc7  ac ab a9	  ldy $a9ab
$18:8bca  60			rts
$18:8bcb  b0 48		 bcs $8c15
$18:8bcd  78			sei
$18:8bce  c8			iny
$18:8bcf  18			clc
$18:8bd0  c9 ea		 cmp #$ea
$18:8bd2  f4 e1 0a	  pea $0ae1
$18:8bd5  ed 5a e0	  sbc $e05a
$18:8bd8  02 06		 cop #$06
$18:8bda  5d aa ae	  eor $aeaa,x
$18:8bdd  b1 b6		 lda ($b6),y
$18:8bdf  0c ba 06	  tsb $06ba
$18:8be2  b8			clv
$18:8be3  12 ba		 ora ($ba)
$18:8be5  24 c9		 bit $c9
$18:8be7  06 ac		 asl $ac
$18:8be9  b0 b3		 bcs $8b9e
$18:8beb  b8			clv
$18:8bec  0c bc 06	  tsb $06bc
$18:8bef  ba			tsx
$18:8bf0  12 bc		 ora ($bc)
$18:8bf2  24 c9		 bit $c9
$18:8bf4  06 ae		 asl $ae
$18:8bf6  b1 b6		 lda ($b6),y
$18:8bf8  ba			tsx
$18:8bf9  0c bd 06	  tsb $06bd
$18:8bfc  bc 12 bd	  ldy $bd12,x
$18:8bff  24 c9		 bit $c9
$18:8c01  e1 0a		 sbc ($0a,x)
$18:8c03  ea			nop
$18:8c04  00 ed		 brk #$ed
$18:8c06  50 e0		 bvc $8be8
$18:8c08  03 06		 ora $06,s
$18:8c0a  3d a9 ab	  and $aba9,x
$18:8c0d  ac ab b0	  ldy $b0ab
$18:8c10  ae b1 b0	  ldx $b0b1
$18:8c13  ae ac ab	  ldx $abac
$18:8c16  ac ae ac	  ldy $acae
$18:8c19  ab			plb
$18:8c1a  a9 e1		 lda #$e1
$18:8c1c  0b			phd
$18:8c1d  a5 a9		 lda $a9
$18:8c1f  ab			plb
$18:8c20  a9 ae		 lda #$ae
$18:8c22  ac b0 ae	  ldy $aeb0
$18:8c25  b1 b0		 lda ($b0),y
$18:8c27  ae ac ab	  ldx $abac
$18:8c2a  ac ae b0	  ldy $b0ae
$18:8c2d  e1 0a		 sbc ($0a,x)
$18:8c2f  a9 ab		 lda #$ab
$18:8c31  ac ab b0	  ldy $b0ab
$18:8c34  ae b1 b0	  ldx $b0b1
$18:8c37  ae ac ab	  ldx $abac
$18:8c3a  ac ae ac	  ldy $acae
$18:8c3d  ab			plb
$18:8c3e  a9 e1		 lda #$e1
$18:8c40  09 a5		 ora #$a5
$18:8c42  a9 ab		 lda #$ab
$18:8c44  a9 ae		 lda #$ae
$18:8c46  ac b0 ae	  ldy $aeb0
$18:8c49  b1 b0		 lda ($b0),y
$18:8c4b  ae ac ab	  ldx $abac
$18:8c4e  ac ae b0	  ldy $b0ae
$18:8c51  e1 0a		 sbc ($0a,x)
$18:8c53  a9 ab		 lda #$ab
$18:8c55  ac ab b0	  ldy $b0ab
$18:8c58  ae b1 b0	  ldx $b0b1
$18:8c5b  ae ac ab	  ldx $abac
$18:8c5e  ac ae ac	  ldy $acae
$18:8c61  ab			plb
$18:8c62  a9 e1		 lda #$e1
$18:8c64  0b			phd
$18:8c65  a5 a9		 lda $a9
$18:8c67  ab			plb
$18:8c68  a9 ae		 lda #$ae
$18:8c6a  ac b0 ae	  ldy $aeb0
$18:8c6d  b1 b0		 lda ($b0),y
$18:8c6f  ae ac ab	  ldx $abac
$18:8c72  ac ae b0	  ldy $b0ae
$18:8c75  e1 0a		 sbc ($0a,x)
$18:8c77  a9 ab		 lda #$ab
$18:8c79  ac ab b0	  ldy $b0ab
$18:8c7c  ae b1 b0	  ldx $b0b1
$18:8c7f  ae ac ab	  ldx $abac
$18:8c82  ac ae ac	  ldy $acae
$18:8c85  ab			plb
$18:8c86  a9 e1		 lda #$e1
$18:8c88  09 a5		 ora #$a5
$18:8c8a  a9 ab		 lda #$ab
$18:8c8c  a9 ae		 lda #$ae
$18:8c8e  ac b0 ae	  ldy $aeb0
$18:8c91  b1 b0		 lda ($b0),y
$18:8c93  ae ac ab	  ldx $abac
$18:8c96  ac ae b0	  ldy $b0ae
$18:8c99  ed 64 e0	  sbc $e064
$18:8c9c  00 0c		 brk #$0c
$18:8c9e  5f a9 0c 5d   eor $5d0ca9,x
$18:8ca2  a9 a9		 lda #$a9
$18:8ca4  a9 0c		 lda #$0c
$18:8ca6  5f a7 0c 5d   eor $5d0ca7,x
$18:8caa  a7 a7		 lda [$a7]
$18:8cac  a7 0c		 lda [$0c]
$18:8cae  5f ab 0c 5d   eor $5d0cab,x
$18:8cb2  ab			plb
$18:8cb3  ab			plb
$18:8cb4  ab			plb
$18:8cb5  0c 5f ab	  tsb $ab5f
$18:8cb8  0c 5d ab	  tsb $ab5d
$18:8cbb  ab			plb
$18:8cbc  ab			plb
$18:8cbd  0c 5f ac	  tsb $ac5f
$18:8cc0  0c 5d ac	  tsb $ac5d
$18:8cc3  ac ac 0c	  ldy $0cac
$18:8cc6  5f ac 0c 5d   eor $5d0cac,x
$18:8cca  ac ac ac	  ldy $acac
$18:8ccd  0c 5f ab	  tsb $ab5f
$18:8cd0  0c 5d ab	  tsb $ab5d
$18:8cd3  ab			plb
$18:8cd4  ab			plb
$18:8cd5  0c 5f b0	  tsb $b05f
$18:8cd8  0c 5d b0	  tsb $b05d
$18:8cdb  b0 b0		 bcs $8c8d
$18:8cdd  60			rts
$18:8cde  c9 5a		 cmp #$5a
$18:8ce0  c9 00		 cmp #$00
$18:8ce2  ea			nop
$18:8ce3  00 e0		 brk #$e0
$18:8ce5  04 ed		 tsb $ed
$18:8ce7  46 e1		 lsr $e1
$18:8ce9  0a			asl a
$18:8cea  e3 30		 sbc $30,s
$18:8cec  1e 1e 06	  asl $061e,x
$18:8cef  c9 0c		 cmp #$0c
$18:8cf1  5d ac a9	  eor $a9ac,x
$18:8cf4  c9 ac		 cmp #$ac
$18:8cf6  a9 06		 lda #$06
$18:8cf8  c9 06		 cmp #$06
$18:8cfa  5b			tcd
$18:8cfb  a7 0c		 lda [$0c]
$18:8cfd  5d a9 06	  eor $06a9,x
$18:8d00  4d ac a9	  eor $a9ac
$18:8d03  0c 5d ac	  tsb $ac5d
$18:8d06  0c 5b a9	  tsb $a95b
$18:8d09  c9 0c		 cmp #$0c
$18:8d0b  5d ac a9	  eor $a9ac,x
$18:8d0e  24 c9		 bit $c9
$18:8d10  0c ac a9	  tsb $a9ac
$18:8d13  c9 ac		 cmp #$ac
$18:8d15  a9 06		 lda #$06
$18:8d17  c9 06		 cmp #$06
$18:8d19  5b			tcd
$18:8d1a  a7 0c		 lda [$0c]
$18:8d1c  5d a9 06	  eor $06a9,x
$18:8d1f  4d ac a9	  eor $a9ac
$18:8d22  0c 5d ac	  tsb $ac5d
$18:8d25  0c 5b a9	  tsb $a95b
$18:8d28  c9 0c		 cmp #$0c
$18:8d2a  5d b0 ac	  eor $acb0,x
$18:8d2d  24 c9		 bit $c9
$18:8d2f  0c ac a9	  tsb $a9ac
$18:8d32  c9 ac		 cmp #$ac
$18:8d34  a9 06		 lda #$06
$18:8d36  c9 06		 cmp #$06
$18:8d38  5b			tcd
$18:8d39  a7 0c		 lda [$0c]
$18:8d3b  5d a9 06	  eor $06a9,x
$18:8d3e  4d ac a9	  eor $a9ac
$18:8d41  0c 5d ac	  tsb $ac5d
$18:8d44  0c 5b a9	  tsb $a95b
$18:8d47  c9 0c		 cmp #$0c
$18:8d49  5d ac a9	  eor $a9ac,x
$18:8d4c  24 c9		 bit $c9
$18:8d4e  0c ac a9	  tsb $a9ac
$18:8d51  c9 ac		 cmp #$ac
$18:8d53  a9 06		 lda #$06
$18:8d55  c9 06		 cmp #$06
$18:8d57  5b			tcd
$18:8d58  a7 0c		 lda [$0c]
$18:8d5a  5d a9 06	  eor $06a9,x
$18:8d5d  4d ac a9	  eor $a9ac
$18:8d60  0c 5d ac	  tsb $ac5d
$18:8d63  0c 5b a9	  tsb $a95b
$18:8d66  c9 0c		 cmp #$0c
$18:8d68  5d b0 ac	  eor $acb0,x
$18:8d6b  24 c9		 bit $c9
$18:8d6d  0c ac a9	  tsb $a9ac
$18:8d70  c9 ac		 cmp #$ac
$18:8d72  a9 06		 lda #$06
$18:8d74  c9 06		 cmp #$06
$18:8d76  5b			tcd
$18:8d77  a7 0c		 lda [$0c]
$18:8d79  5d a9 06	  eor $06a9,x
$18:8d7c  4d ac a9	  eor $a9ac
$18:8d7f  0c 5d ac	  tsb $ac5d
$18:8d82  0c 5b a9	  tsb $a95b
$18:8d85  c9 0c		 cmp #$0c
$18:8d87  5d ac a9	  eor $a9ac,x
$18:8d8a  24 c9		 bit $c9
$18:8d8c  0c ac a9	  tsb $a9ac
$18:8d8f  c9 ac		 cmp #$ac
$18:8d91  a9 06		 lda #$06
$18:8d93  c9 06		 cmp #$06
$18:8d95  5b			tcd
$18:8d96  a7 0c		 lda [$0c]
$18:8d98  5d a9 06	  eor $06a9,x
$18:8d9b  4d ac a9	  eor $a9ac
$18:8d9e  0c 5d ac	  tsb $ac5d
$18:8da1  0c 5b a9	  tsb $a95b
$18:8da4  c9 0c		 cmp #$0c
$18:8da6  5d b0 ac	  eor $acb0,x
$18:8da9  24 c9		 bit $c9
$18:8dab  0c ac a9	  tsb $a9ac
$18:8dae  c9 ac		 cmp #$ac
$18:8db0  a9 06		 lda #$06
$18:8db2  c9 06		 cmp #$06
$18:8db4  5b			tcd
$18:8db5  a7 0c		 lda [$0c]
$18:8db7  5d a9 06	  eor $06a9,x
$18:8dba  4d ac a9	  eor $a9ac
$18:8dbd  0c 5d ac	  tsb $ac5d
$18:8dc0  0c 5b a9	  tsb $a95b
$18:8dc3  c9 0c		 cmp #$0c
$18:8dc5  5d ac a9	  eor $a9ac,x
$18:8dc8  24 c9		 bit $c9
$18:8dca  0c ac a9	  tsb $a9ac
$18:8dcd  c9 ac		 cmp #$ac
$18:8dcf  a9 06		 lda #$06
$18:8dd1  c9 06		 cmp #$06
$18:8dd3  5b			tcd
$18:8dd4  a7 0c		 lda [$0c]
$18:8dd6  5d a9 06	  eor $06a9,x
$18:8dd9  4d ac a9	  eor $a9ac
$18:8ddc  0c 5d ac	  tsb $ac5d
$18:8ddf  0c 5b a9	  tsb $a95b
$18:8de2  c9 0c		 cmp #$0c
$18:8de4  5d b0 ac	  eor $acb0,x
$18:8de7  24 c9		 bit $c9
$18:8de9  06 aa		 asl $aa
$18:8deb  ae b1 b6	  ldx $b6b1
$18:8dee  0c ba 06	  tsb $06ba
$18:8df1  b8			clv
$18:8df2  12 ba		 ora ($ba)
$18:8df4  24 c9		 bit $c9
$18:8df6  06 ac		 asl $ac
$18:8df8  b0 b3		 bcs $8dad
$18:8dfa  b8			clv
$18:8dfb  0c bc 06	  tsb $06bc
$18:8dfe  ba			tsx
$18:8dff  12 bc		 ora ($bc)
$18:8e01  24 c9		 bit $c9
$18:8e03  06 ae		 asl $ae
$18:8e05  b1 b6		 lda ($b6),y
$18:8e07  ba			tsx
$18:8e08  0c bd 06	  tsb $06bd
$18:8e0b  bc 12 bd	  ldy $bd12,x
$18:8e0e  24 c9		 bit $c9
$18:8e10  60			rts
$18:8e11  c9 c9		 cmp #$c9
$18:8e13  c9 c9		 cmp #$c9
$18:8e15  06 3d		 asl $3d
$18:8e17  a9 ab		 lda #$ab
$18:8e19  ac ab b0	  ldy $b0ab
$18:8e1c  ae b1 b0	  ldx $b0b1
$18:8e1f  ae ac ab	  ldx $abac
$18:8e22  ac ae ac	  ldy $acae
$18:8e25  ab			plb
$18:8e26  a9 a5		 lda #$a5
$18:8e28  a9 ab		 lda #$ab
$18:8e2a  a9 ae		 lda #$ae
$18:8e2c  ac b0 ae	  ldy $aeb0
$18:8e2f  b1 b0		 lda ($b0),y
$18:8e31  ae ac ab	  ldx $abac
$18:8e34  ac ae b0	  ldy $b0ae
$18:8e37  a9 ab		 lda #$ab
$18:8e39  ac ab b0	  ldy $b0ab
$18:8e3c  ae b1 b0	  ldx $b0b1
$18:8e3f  ae ac ab	  ldx $abac
$18:8e42  ac ae ac	  ldy $acae
$18:8e45  ab			plb
$18:8e46  a9 a5		 lda #$a5
$18:8e48  a9 ab		 lda #$ab
$18:8e4a  a9 ae		 lda #$ae
$18:8e4c  ac b0 ae	  ldy $aeb0
$18:8e4f  b1 b0		 lda ($b0),y
$18:8e51  ae ac ab	  ldx $abac
$18:8e54  ac ae b0	  ldy $b0ae
$18:8e57  30 5d		 bmi $8eb6
$18:8e59  b1 18		 lda ($18),y
$18:8e5b  b0 b1		 bcs $8e0e
$18:8e5d  30 b3		 bmi $8e12
$18:8e5f  18			clc
$18:8e60  b0 b3		 bcs $8e15
$18:8e62  30 b5		 bmi $8e19
$18:8e64  18			clc
$18:8e65  b1 b5		 lda ($b5),y
$18:8e67  30 b7		 bmi $8e20
$18:8e69  30 69		 bmi $8ed4
$18:8e6b  bc 60 c9	  ldy $c960,x
$18:8e6e  5a			phy
$18:8e6f  c9 00		 cmp #$00
$18:8e71  00 20		 brk #$20
$18:8e73  00 34		 brk #$34
$18:8e75  2c 53 73	  bit $7353
$18:8e78  82 77 4f	  brl $ddf2
$18:8e7b  86 ac		 stx $ac
$18:8e7d  8c 2a 8d	  sty $8d2a
$18:8e80  6b			rtl
$18:8e81  91 aa		 sta ($aa),y
$18:8e83  91 e0		 sta ($e0),y
$18:8e85  91 fb		 sta ($fb),y
$18:8e87  91 16		 sta ($16),y
$18:8e89  92 0f		 sta ($0f)
$18:8e8b  a8			tay
$18:8e8c  78			sei
$18:8e8d  ab			plb
$18:8e8e  b7 ab		 lda [$ab],y
$18:8e90  b7 ab		 lda [$ab],y
$18:8e92  1c b0 1c	  trb $1cb0
$18:8e95  b0 02		 bcs $8e99
$18:8e97  00 fd		 brk #$fd
$18:8e99  0f 06 ba 00   ora $00ba06
$18:8e9d  00 08		 brk #$08
$18:8e9f  11 10		 ora ($10),y
$18:8ea1  1d 14 1f	  ora $1f14,x
$18:8ea4  12 18		 ora ($18)
$18:8ea6  19 08 04	  ora $0408,y
$18:8ea9  00 20		 brk #$20
$18:8eab  a0 d2		 ldy #$d2
$18:8ead  5d e1 4b	  eor $4be1,x
$18:8eb0  ad d0 de	  lda $ded0
$18:8eb3  02 f7		 cop #$f7
$18:8eb5  47 b1		 eor [$b1]
$18:8eb7  3c c5 ee	  bit $eec5,x
$18:8eba  d4 17		 pei ($17)
$18:8ebc  7f 80 3c 23   adc $233c80,x
$18:8ec0  e2 2f		 sep #$2f
$18:8ec2  19 f5 0a	  ora $0af5,y
$18:8ec5  b7 40		 lda [$40],y
$18:8ec7  23 5d		 and $5d,s
$18:8ec9  0a			asl a
$18:8eca  65 40		 adc $40
$18:8ecc  1b			tcs
$18:8ecd  55 13		 eor $13,x
$18:8ecf  73 32		 adc ($32,s),y
$18:8ed1  dc 51 48	  jml [$4851]
$18:8ed4  f3 42		 sbc ($42,s),y
$18:8ed6  e0 61		 cpx #$61
$18:8ed8  78			sei
$18:8ed9  26 57		 rol $57
$18:8edb  38			sec
$18:8edc  16 63		 asl $63,x
$18:8ede  33 9a		 and ($9a,s),y
$18:8ee0  3a			dec a
$18:8ee1  b9 80 94	  lda $9480,y
$18:8ee4  64 97		 stz $97
$18:8ee6  f5 47		 sbc $47,x
$18:8ee8  ae 7c 94	  ldx $947c
$18:8eeb  f4 1c e9	  pea $e91c
$18:8eee  19 db c4	  ora $c4db,y
$18:8ef1  4f 0c ab 7c   eor $7cab0c
$18:8ef5  68			pla
$18:8ef6  94 ea		 sty $ea,x
$18:8ef8  7d 3a 8a	  adc $8a3a,x
$18:8efb  ed 4a 24	  sbc $244a
$18:8efe  48			pha
$18:8eff  18			clc
$18:8f00  14 4a		 trb $4a
$18:8f02  55 1a		 eor $1a,x
$18:8f04  03 6e		 ora $6e,s
$18:8f06  a4 03		 ldy $03
$18:8f08  01 ce		 ora ($ce,x)
$18:8f0a  54 cf bd	  mvn $bd,$cf
$18:8f0d  34 2e		 bit $2e,x
$18:8f0f  13 e8		 ora ($e8,s),y
$18:8f11  08			php
$18:8f12  a4 21		 ldy $21
$18:8f14  26 50		 rol $50
$18:8f16  11 00		 ora ($00),y
$18:8f18  28			plp
$18:8f19  04 e1		 tsb $e1
$18:8f1b  48			pha
$18:8f1c  a5 40		 lda $40
$18:8f1e  66 1a		 ror $1a
$18:8f20  59 80 a4	  eor $a480,y
$18:8f23  29 14		 and #$14
$18:8f25  ea			nop
$18:8f26  65 2a		 adc $2a
$18:8f28  de 29 11	  dec $1129,x
$18:8f2b  48			pha
$18:8f2c  cc 09 07	  cpy $0709
$18:8f2f  3e a2 4e	  rol $4ea2,x
$18:8f32  a2 04		 ldx #$04
$18:8f34  24 9f		 bit $9f
$18:8f36  cf 8b 22 48   cmp $48228b
$18:8f3a  0a			asl a
$18:8f3b  4c ee 75	  jmp $75ee
$18:8f3e  08			php
$18:8f3f  84 44		 sty $44
$18:8f41  2d c4 43	  and $43c4
$18:8f44  1b			tcs
$18:8f45  81 64		 sta ($64,x)
$18:8f47  04 41		 tsb $41
$18:8f49  3b			tsc
$18:8f4a  9c ce 4c	  stz $4cce
$18:8f4d  22 75 32 88   jsl $883275
$18:8f51  87 cc		 sta [$cc]
$18:8f53  e2 28		 sep #$28
$18:8f55  53 9d		 eor ($9d,s),y
$18:8f57  18			clc
$18:8f58  82 82 7f	  brl $0edd
$18:8f5b  44 aa a1	  mvp $a1,$aa
$18:8f5e  41 ec		 eor ($ec,x)
$18:8f60  e9 15		 sbc #$15
$18:8f62  50 4b		 bvc $8faf
$18:8f64  ea			nop
$18:8f65  14 12		 trb $12
$18:8f67  af f6 07 b4   lda $b407f6
$18:8f6b  7d 1e 54	  adc $541e,x
$18:8f6e  4a			lsr a
$18:8f6f  70 c4		 bvs $8f35
$18:8f71  03 a0		 ora $a0,s
$18:8f73  ec 71 30	  cpx $3071
$18:8f76  10 46		 bpl $8fbe
$18:8f78  90 0a		 bcc $8f84
$18:8f7a  27 3a		 and [$3a]
$18:8f7c  50 88		 bvc $8f06
$18:8f7e  47 48		 eor [$48]
$18:8f80  a7 d3		 lda [$d3]
$18:8f82  68			pla
$18:8f83  20 a3 a6	  jsr $a6a3
$18:8f86  52 85		 eor ($85)
$18:8f88  20 36 28	  jsr $2836
$18:8f8b  4d 02 92	  eor $9202
$18:8f8e  1a			inc a
$18:8f8f  3a			dec a
$18:8f90  14 f8		 trb $f8
$18:8f92  6c d4 11	  jmp ($11d4)
$18:8f95  51 89		 eor ($89),y
$18:8f97  52 03		 eor ($03)
$18:8f99  02 9c		 cop #$9c
$18:8f9b  02 80		 cop #$80
$18:8f9d  6c 34 8a	  jmp ($8a34)
$18:8fa0  70 d6		 bvs $8f78
$18:8fa2  09 c0		 ora #$c0
$18:8fa4  6f a1 58 53   adc $5358a1
$18:8fa8  a1 07		 lda ($07,x)
$18:8faa  f2 88		 sbc ($88)
$18:8fac  0d 92 8e	  ora $8e92
$18:8faf  3b			tsc
$18:8fb0  0e 44 e5	  asl $e544
$18:8fb3  1e 53 a1	  asl $a153,x
$18:8fb6  b1 d1		 lda ($d1),y
$18:8fb8  a7 d4		 lda [$d4]
$18:8fba  78			sei
$18:8fbb  4d e2 76	  eor $76e2
$18:8fbe  9f 1a 68 94   sta $94681a,x
$18:8fc2  e7 d3		 sbc [$d3]
$18:8fc4  09 84		 ora #$84
$18:8fc6  f9 3a 02	  sbc $023a,y
$18:8fc9  04 a3		 tsb $a3
$18:8fcb  91 46		 sta ($46),y
$18:8fcd  61 62		 adc ($62,x)
$18:8fcf  55 8e		 eor $8e,x
$18:8fd1  01 f4		 ora ($f4,x)
$18:8fd3  74 b4		 stz $b4,x
$18:8fd5  a0 db		 ldy #$db
$18:8fd7  95 40		 sta $40,x
$18:8fd9  ab			plb
$18:8fda  1c 43 e5	  trb $e543
$18:8fdd  28			plp
$18:8fde  56 2b		 lsr $2b,x
$18:8fe0  5c 06 7e ab   jml $ab7e06
$18:8fe4  01 b0		 ora ($b0,x)
$18:8fe6  87 d6		 sta [$d6]
$18:8fe8  c7 60		 cmp [$60]
$18:8fea  b0 b9		 bcs $8fa5
$18:8fec  c2 c4		 rep #$c4
$18:8fee  36 16		 rol $16,x
$18:8ff0  01 d6		 ora ($d6,x)
$18:8ff2  e8			inx
$18:8ff3  61 f4		 adc ($f4,x)
$18:8ff5  a4 e5		 ldy $e5
$18:8ff7  73 a1		 adc ($a1,s),y
$18:8ff9  02 79		 cop #$79
$18:8ffb  8b			phb
$18:8ffc  3d 28 39	  and $3928,x
$18:8fff  dc ab bf	  jml [$bfab]
$18:9002  d6 25		 dec $25,x
$18:9004  5b			tcd
$18:9005  26 85		 rol $85
$18:9007  26 89		 rol $89
$18:9009  4e 3e 84	  lsr $843e
$18:900c  92 4b		 sta ($4b)
$18:900e  12 67		 ora ($67)
$18:9010  8d 33 73	  sta $7333
$18:9013  34 dc		 bit $dc,x
$18:9015  14 86		 trb $86
$18:9017  2f 1f 8b cb   and $cb8b1f
$18:901b  25 b8		 and $b8
$18:901d  61 81		 adc ($81,x)
$18:901f  72 30		 adc ($30)
$18:9021  bc 97 a8	  ldy $a897,x
$18:9024  50 a3		 bvc $8fc9
$18:9026  f2 28		 sbc ($28)
$18:9028  1c 9a 4f	  trb $4f9a
$18:902b  17 18		 ora [$18],y
$18:902d  8e 96 f1	  stx $f196
$18:9030  79 bd 6e	  adc $6ebd,y
$18:9033  29 fb		 and #$fb
$18:9035  98			tya
$18:9036  bc 0e 36	  ldy $360e,x
$18:9039  4c 12 80	  jmp $8012
$18:903c  f2 2f		 sbc ($2f)
$18:903e  77 9b		 adc [$9b],y
$18:9040  e7 27		 sbc [$27]
$18:9042  4b			phk
$18:9043  a5 86		 lda $86
$18:9045  c1 e0		 cmp ($e0,x)
$18:9047  d2 e9		 cmp ($e9)
$18:9049  7c 70 84	  jmp ($8470,x)
$18:904c  17 1b		 ora [$1b],y
$18:904e  dd ce f3	  cmp $f3ce,x
$18:9051  73 32		 adc ($32,s),y
$18:9053  8c 50 f2	  sty $f250
$18:9056  13 69		 ora ($69,s),y
$18:9058  bc 70 e2	  ldy $e270,x
$18:905b  68			pla
$18:905c  21 32		 and ($32,x)
$18:905e  84 5e		 sty $5e
$18:9060  37 03		 and [$03],y
$18:9062  45 89		 eor $89
$18:9064  cc 37 c8	  cpy $c837
$18:9067  23 b9		 and $b9,s
$18:9069  de a3 f2	  dec $f2a3,x
$18:906c  14 58		 trb $58
$18:906e  48			pha
$18:906f  e4 28		 cpx $28
$18:9071  14 b9		 trb $b9
$18:9073  ef 92 e0 39   sbc $39e092
$18:9077  11 d0		 ora ($d0),y
$18:9079  40			rti
$18:907a  f0 38		 beq $90b4
$18:907c  1c 1a 08	  trb $081a
$18:907f  52 22		 eor ($22)
$18:9081  98			tya
$18:9082  08			php
$18:9083  5c 1e 07 1f   jml $1f071e
$18:9087  81 e2		 sta ($e2,x)
$18:9089  71 38		 adc ($38),y
$18:908b  b4 10		 ldy $10,x
$18:908d  e1 15		 sbc ($15,x)
$18:908f  e1 82		 sbc ($82,x)
$18:9091  8b			phb
$18:9092  c4 e2		 cpy $e2
$18:9094  8a			txa
$18:9095  a1 b5		 lda ($b5,x)
$18:9097  c2 4a		 rep #$4a
$18:9099  60			rts
$18:909a  a5 0c		 lda $0c
$18:909c  62 fc 31	  per $c29b
$18:909f  44 91 8f	  mvp $8f,$91
$18:90a2  f5 ba		 sbc $ba,x
$18:90a4  f0 16		 beq $90bc
$18:90a6  81 15		 sta ($15,x)
$18:90a8  00 72		 brk #$72
$18:90aa  0a			asl a
$18:90ab  c1 85		 cmp ($85,x)
$18:90ad  c5 ed		 cmp $ed
$18:90af  16 90		 asl $90,x
$18:90b1  e8			inx
$18:90b2  01 94		 ora ($94,x)
$18:90b4  2c b9 dc	  bit $dcb9
$18:90b7  a8			tay
$18:90b8  59 45 04	  eor $0445,y
$18:90bb  0a			asl a
$18:90bc  17 7b		 ora [$7b],y
$18:90be  51 29		 eor ($29),y
$18:90c0  50 18		 bvc $90da
$18:90c2  0c fe 61	  tsb $61fe
$18:90c5  30 b7		 bmi $907e
$18:90c7  44 a4 92	  mvp $92,$a4
$18:90ca  50 48		 bvc $9114
$18:90cc  d3 42		 cmp ($42,s),y
$18:90ce  e1 62		 sbc ($62,x)
$18:90d0  0c 80 68	  tsb $6880
$18:90d3  2d f3 fc	  and $fcf3
$18:90d6  34 b2		 bit $b2,x
$18:90d8  5a			phy
$18:90d9  a9 1a		 lda #$1a
$18:90db  45 2a		 eor $2a
$18:90dd  c1 61		 cmp ($61,x)
$18:90df  b7 8a		 lda [$8a],y
$18:90e1  44 32 11	  mvp $11,$32
$18:90e4  72 e0		 adc ($e0)
$18:90e6  45 57		 eor $57
$18:90e8  81 62		 sta ($62,x)
$18:90ea  b1 3b		 lda ($3b),y
$18:90ec  40			rti
$18:90ed  74 73		 stz $73,x
$18:90ef  e1 f8		 sbc ($f8,x)
$18:90f1  c0 e4		 cpy #$e4
$18:90f3  31 71		 and ($71),y
$18:90f5  b8			clv
$18:90f6  0d c0 74	  ora $74c0
$18:90f9  70 18		 bvs $9113
$18:90fb  ec ba 5f	  cpx $5fba
$18:90fe  0c 82 c3	  tsb $c382
$18:9101  ed 1d fe	  sbc $fe1d
$18:9104  f1 20		 sbc ($20),y
$18:9106  95 23		 sta $23,x
$18:9108  1d 9b 4d	  ora $4d9b,x
$18:910b  e2 87		 sep #$87
$18:910d  20 b0 75	  jsr $75b0
$18:9110  fa			plx
$18:9111  d6 1b		 dec $1b,x
$18:9113  60			rts
$18:9114  64 17		 stz $17
$18:9116  a1 03		 lda ($03,x)
$18:9118  6d 04 0e	  adc $0e04
$18:911b  57 22		 eor [$22],y
$18:911d  76 0b		 ror $0b,x
$18:911f  b4 2c		 ldy $2c,x
$18:9121  53 01		 eor ($01,s),y
$18:9123  f0 42		 beq $9167
$18:9125  e0 d0		 cpx #$d0
$18:9127  38			sec
$18:9128  9c 56 30	  stz $3056
$18:912b  bc 08 0d	  ldy $0d08,x
$18:912e  90 aa		 bcc $90da
$18:9130  71 f6		 adc ($f6),y
$18:9132  50 40		 bvc $9174
$18:9134  cd 82 cc	  cmp $cc82
$18:9137  08			php
$18:9138  09 18		 ora #$18
$18:913a  0c c3 6c	  tsb $6cc3
$18:913d  36 0c		 rol $0c,x
$18:913f  85 b8		 sta $b8
$18:9141  27 70		 and [$70]
$18:9143  2a			rol a
$18:9144  8a			txa
$18:9145  c8			iny
$18:9146  ed 93 f5	  sbc $f593
$18:9149  08			php
$18:914a  77 8c		 adc [$8c],y
$18:914c  c0 c2		 cpy #$c2
$18:914e  2b			pld
$18:914f  4a			lsr a
$18:9150  14 83		 trb $83
$18:9152  20 b1 16	  jsr $16b1
$18:9155  82 58 6c	  brl $fdb0
$18:9158  56 41		 lsr $41,x
$18:915a  d1 21		 cmp ($21),y
$18:915c  49 be		 eor #$be
$18:915e  90 1a		 bcc $917a
$18:9160  35 19		 and $19,x
$18:9162  d2 13		 cmp ($13)
$18:9164  fa			plx
$18:9165  0d 32 8a	  ora $8a32
$18:9168  03 30		 ora $30,s
$18:916a  a8			tay
$18:916b  d3 9e		 cmp ($9e,s),y
$18:916d  25 4e		 and $4e
$18:916f  a5 52		 lda $52
$18:9171  1e 27 4c	  asl $4c27,x
$18:9174  a7 89		 lda [$89]
$18:9176  c0 02		 cpy #$02
$18:9178  42 a0		 wdm #$a0
$18:917a  b7 52		 lda [$52],y
$18:917c  29 f4		 and #$f4
$18:917e  d7 98		 cmp [$98],y
$18:9180  50 96		 bvc $9118
$18:9182  63 d7		 adc $d7,s
$18:9184  a0 3e		 ldy #$3e
$18:9186  40			rti
$18:9187  96 36		 stx $36,y
$18:9189  e9 f5		 sbc #$f5
$18:918b  22 9c 08 03   jsl $03089c
$18:918f  29 52		 and #$52
$18:9191  29 45		 and #$45
$18:9193  94 b7		 sty $b7,x
$18:9195  4c 27 d3	  jmp $d327
$18:9198  e3 a9		 sbc $a9,s
$18:919a  4f 8d 28 a3   eor $a3288d
$18:919e  15 28		 ora $28,x
$18:91a0  b2 8e		 lda ($8e)
$18:91a2  03 3e		 ora $3e,s
$18:91a4  3e 0a 4c	  rol $4c0a,x
$18:91a7  4f 40 99 11   eor $119940
$18:91ab  71 28		 adc ($28),y
$18:91ad  42 07		 wdm #$07
$18:91af  18			clc
$18:91b0  95 c5		 sta $c5,x
$18:91b2  cf 22 e7 15   cmp $15e722
$18:91b6  10 c5		 bpl $917d
$18:91b8  e5 70		 sbc $70
$18:91ba  38			sec
$18:91bb  da			phx
$18:91bc  40			rti
$18:91bd  0a			asl a
$18:91be  8b			phb
$18:91bf  1f 83 41 20   ora $204183,x
$18:91c3  b2 19		 lda ($19)
$18:91c5  14 2e		 trb $2e
$18:91c7  0f fd 52 05   ora $0552fd
$18:91cb  b4 ce		 ldy $ce,x
$18:91cd  71 44		 adc ($44),y
$18:91cf  60			rts
$18:91d0  14 82		 trb $82
$18:91d2  27 14		 and [$14]
$18:91d4  91 95		 sta ($95),y
$18:91d6  0a			asl a
$18:91d7  c4 5d		 cpy $5d
$18:91d9  19 14 0d	  ora $0d14,y
$18:91dc  26 04		 rol $04
$18:91de  05 17		 ora $17
$18:91e0  11 08		 ora ($08),y
$18:91e2  24 12		 bit $12
$18:91e4  29 80		 and #$80
$18:91e6  d4 05		 pei ($05)
$18:91e8  c8			iny
$18:91e9  1f 28 bc 8a   ora $8abc28,x
$18:91ed  35 3f		 and $3f,x
$18:91ef  b7 c0		 lda [$c0],y
$18:91f1  60			rts
$18:91f2  50 86		 bvc $917a
$18:91f4  19 44 09	  ora $0944,y
$18:91f7  a5 1b		 lda $1b
$18:91f9  8c 8f 82	  sty $828f
$18:91fc  05 70		 ora $70
$18:91fe  b8			clv
$18:91ff  b4 ca		 ldy $ca,x
$18:9201  e4 3d		 cpx $3d
$18:9203  23 68		 and $68,s
$18:9205  51 a8		 eor ($a8),y
$18:9207  f0 9b		 beq $91a4
$18:9209  c5 e6		 cmp $e6
$18:920b  e6 e3		 inc $e3
$18:920d  1b			tcs
$18:920e  d0 b8		 bne $91c8
$18:9210  ad f3 f0	  lda $f0f3
$18:9213  20 bc 1b	  jsr $1bbc
$18:9216  3a			dec a
$18:9217  f3 2a		 sbc ($2a,s),y
$18:9219  65 3c		 adc $3c
$18:921b  4a			lsr a
$18:921c  02 50		 cop #$50
$18:921e  a6 d0		 ldx $d0
$18:9220  5e 83 95	  lsr $9583,x
$18:9223  7a			ply
$18:9224  10 b4		 bpl $91da
$18:9226  06 83		 asl $83
$18:9228  6e a4 01	  ror $01a4
$18:922b  46 89		 lsr $89
$18:922d  12 a2		 ora ($a2)
$18:922f  bd 02 98	  lda $9802,x
$18:9232  b5 5a		 lda $5a,x
$18:9234  45 3a		 eor $3a
$18:9236  8b			phb
$18:9237  4c fb 81	  jmp $81fb
$18:923a  46 84		 lsr $84
$18:923c  b5 33		 lda $33,x
$18:923e  c0 58		 cpy #$58
$18:9240  3a			dec a
$18:9241  f4 8a 54	  pea $548a
$18:9244  f8			sed
$18:9245  2a			rol a
$18:9246  22 e3 b2 1a   jsl $1ab2e3
$18:924a  00 d0		 brk #$d0
$18:924c  2c 10 85	  bit $8510
$18:924f  6e 29 db	  ror $db29
$18:9252  95 a9		 sta $a9,x
$18:9254  a6 05		 ldx $05
$18:9256  9e ca 36	  stz $36ca,x
$18:9259  61 04		 adc ($04,x)
$18:925b  29 c4		 and #$c4
$18:925d  2e 40 83	  rol $8340
$18:9260  a5 05		 lda $05
$18:9262  84 4d		 sty $4d
$18:9264  21 bd		 and ($bd,x)
$18:9266  9a			txs
$18:9267  ca			dex
$18:9268  29 17		 and #$17
$18:926a  9f 34 4c f4   sta $f44c34,x
$18:926e  37 93		 and [$93],y
$18:9270  58			cli
$18:9271  fa			plx
$18:9272  a4 47		 ldy $47
$18:9274  00 70		 brk #$70
$18:9276  97 ae		 sta [$ae],y
$18:9278  a4 88		 ldy $88
$18:927a  2f 5d 42 a2   and $a2425d
$18:927e  5f 17 08 a7   eor $a70817,x
$18:9282  05 c6		 ora $c6
$18:9284  1e 94 e8	  asl $e894,x
$18:9287  56 2b		 lsr $2b,x
$18:9289  31 7b		 and ($7b),y
$18:928b  7a			ply
$18:928c  44 7d 55	  mvp $55,$7d
$18:928f  25 68		 and $68
$18:9291  2a			rol a
$18:9292  05 5a		 ora $5a
$18:9294  09 d1		 ora #$d1
$18:9296  6d 03 84	  adc $8403
$18:9299  15 42		 ora $42,x
$18:929b  e4 15		 cpx $15
$18:929d  52 30		 eor ($30)
$18:929f  0d 5a 0c	  ora $0c5a
$18:92a2  72 5d		 adc ($5d)
$18:92a4  91 58		 sta ($58),y
$18:92a6  52 44		 eor ($44)
$18:92a8  e4 3f		 cpx $3f
$18:92aa  9a			txs
$18:92ab  d4 42		 pei ($42)
$18:92ad  e2 03		 sep #$03
$18:92af  07 93		 ora [$93]
$18:92b1  86 c0		 stx $c0
$18:92b3  38			sec
$18:92b4  14 2e		 trb $2e
$18:92b6  41 6c		 eor ($6c,x)
$18:92b8  80 67		 bra $9321
$18:92ba  c9 a0		 cmp #$a0
$18:92bc  50 5e		 bvc $931c
$18:92be  61 b9		 adc ($b9,x)
$18:92c0  bc 39 51	  ldy $5139,x
$18:92c3  8e 37 aa	  stx $aa37
$18:92c6  05 24		 ora $24
$18:92c8  04 37		 tsb $37
$18:92ca  b7 29		 lda [$29],y
$18:92cc  ef 83 27 41   sbc $412783
$18:92d0  71 9f		 adc ($9f),y
$18:92d2  ab			plb
$18:92d3  7c e4 2c	  jmp ($2ce4,x)
$18:92d6  26 07		 rol $07
$18:92d8  04 1d		 tsb $1d
$18:92da  03 50		 ora $50,s
$18:92dc  ef bd 64 21   sbc $2164bd
$18:92e0  63 8e		 adc $8e,s
$18:92e2  33 13		 and ($13,s),y
$18:92e4  8a			txa
$18:92e5  06 82		 asl $82
$18:92e7  1c 7d 5b	  trb $5b7d
$18:92ea  5d be f8	  eor $f8be,x
$18:92ed  50 7b		 bvc $936a
$18:92ef  09 cb		 ora #$cb
$18:92f1  f4 0f a1	  pea $a10f
$18:92f4  eb			xba
$18:92f5  da			phx
$18:92f6  f3 77		 sbc ($77,s),y
$18:92f8  e3 a0		 sbc $a0,s
$18:92fa  33 09		 and ($09,s),y
$18:92fc  30 5f		 bmi $935d
$18:92fe  e0 e9		 cpx #$e9
$18:9300  0d f6 f7	  ora $f7f6
$18:9303  9d c7 25	  sta $25c7,x
$18:9306  01 d8		 ora ($d8,x)
$18:9308  31 5b		 and ($5b),y
$18:930a  07 e8		 ora [$e8]
$18:930c  3b			tsc
$18:930d  c1 8a		 cmp ($8a,x)
$18:930f  3c 5e 39	  bit $395e,x
$18:9312  64 90		 stz $90
$18:9314  e0 7b		 cpx #$7b
$18:9316  2a			rol a
$18:9317  0b			phd
$18:9318  54 f0 83	  mvn $83,$f0
$18:931b  c0 36		 cpy #$36
$18:931d  0a			asl a
$18:931e  60			rts
$18:931f  d8			cld
$18:9320  a7 8c		 lda [$8c]
$18:9322  26 02		 rol $02
$18:9324  61 51		 adc ($51,x)
$18:9326  c8			iny
$18:9327  5a			phy
$18:9328  0a			asl a
$18:9329  6a			ror a
$18:932a  5e c5 82	  lsr $82c5,x
$18:932d  a7 c5		 lda [$c5]
$18:932f  33 af		 and ($af,s),y
$18:9331  bc d8 34	  ldy $34d8,x
$18:9334  2c c6 67	  bit $67c6
$18:9337  34 6b		 bit $6b,x
$18:9339  2a			rol a
$18:933a  60			rts
$18:933b  3c 01 e0	  bit $e001,x
$18:933e  7c 17 91	  jmp ($9117,x)
$18:9341  be 07 73	  ldx $7307,y
$18:9344  33 99		 and ($99,s),y
$18:9346  02 c1		 cop #$c1
$18:9348  de bb 87	  dec $87bb,x
$18:934b  d8			cld
$18:934c  6e 66 93	  ror $9366
$18:934f  10 d0		 bpl $9321
$18:9351  81 c9		 sta ($c9,x)
$18:9353  e6 19		 inc $19
$18:9355  ce 0c c8	  dec $c80c
$18:9358  18			clc
$18:9359  20 b3 04	  jsr $04b3
$18:935c  87 03		 sta [$03]
$18:935e  37 99		 and [$99],y
$18:9360  c7 89		 cmp [$89]
$18:9362  40			rti
$18:9363  34 33		 bit $33,x
$18:9365  c0 e1		 cpy #$e1
$18:9367  50 86		 bvc $92ef
$18:9369  41 8f		 eor ($8f,x)
$18:936b  1a			inc a
$18:936c  00 90		 brk #$90
$18:936e  32 39		 and ($39)
$18:9370  1c 29 20	  trb $2029
$18:9373  09 00		 ora #$00
$18:9375  f1 22		 sbc ($22),y
$18:9377  19 14 d8	  ora $d814,y
$18:937a  02 45		 cop #$45
$18:937c  3a			dec a
$18:937d  27 cf		 and [$cf]
$18:937f  f4 b7 e6	  pea $e6b7
$18:9382  cc 2d 2e	  cpy $2e2d
$18:9385  83 42		 sta $42,s
$18:9387  a2 a7		 ldx #$a7
$18:9389  88			dey
$18:938a  6a			ror a
$18:938b  35 2b		 and $2b,x
$18:938d  2a			rol a
$18:938e  04 a6		 tsb $a6
$18:9390  94 50		 sty $50,x
$18:9392  a0 b0		 ldy #$b0
$18:9394  a1 4d		 lda ($4d,x)
$18:9396  27 a1		 and [$a1]
$18:9398  a3 69		 lda $69,s
$18:939a  b5 09		 lda $09,x
$18:939c  8c e2 94	  sty $94e2
$18:939f  0b			phd
$18:93a0  85 14		 sta $14
$18:93a2  3e 0f 29	  rol $290f,x
$18:93a5  74 86		 stz $86,x
$18:93a7  e1 e3		 sbc ($e3,x)
$18:93a9  6d 11 a0	  adc $a011
$18:93ac  3c f2 67	  bit $67f2,x
$18:93af  b8			clv
$18:93b0  a6 84		 ldx $84
$18:93b2  e5 b6		 sbc $b6
$18:93b4  54 07 94	  mvn $94,$07
$18:93b7  e4 78		 cpx $78
$18:93b9  2f f1 77 81   and $8177f1
$18:93bd  10 9e		 bpl $935d
$18:93bf  27 8f		 and [$8f]
$18:93c1  cd 36 cb	  cmp $cb36
$18:93c4  81 91		 sta ($91,x)
$18:93c6  2b			pld
$18:93c7  07 04		 ora [$04]
$18:93c9  86 2f		 stx $2f
$18:93cb  10 27		 bpl $93f4
$18:93cd  83 14		 sta $14,s
$18:93cf  92 25		 sta ($25)
$18:93d1  9c 2b 95	  stz $952b
$18:93d4  14 be		 trb $be
$18:93d6  0d 12 48	  ora $4812
$18:93d9  ae 70 b2	  ldx $b270
$18:93dc  05 f0		 ora $f0
$18:93de  74 91		 stz $91,x
$18:93e0  d5 4d		 cmp $4d,x
$18:93e2  01 c1		 ora ($c1,x)
$18:93e4  27 93		 and [$93]
$18:93e6  44 10 ac	  mvp $ac,$10
$18:93e9  5f 0d 0e 89   eor $890e0d,x
$18:93ed  02 da		 cop #$da
$18:93ef  4d 0e 86	  eor $860e
$18:93f2  fa			plx
$18:93f3  9f 0d 4e a9   sta $a94e0d,x
$18:93f7  b6 46		 ldx $46,y
$18:93f9  52 d6		 eor ($d6)
$18:93fb  6a			ror a
$18:93fc  75 37		 adc $37,x
$18:93fe  d5 78		 cmp $78,x
$18:9400  3a			dec a
$18:9401  50 ca		 bvc $93cd
$18:9403  59 a9 f4	  eor $f4a9,y
$18:9406  c3 75		 cmp $75,s
$18:9408  30 b7		 bmi $93c1
$18:940a  8b			phb
$18:940b  cb			wai
$18:940c  fa			plx
$18:940d  74 3c		 stz $3c,x
$18:940f  d5 1e		 cmp $1e,x
$18:9411  dd 30 9f	  cmp $9f30,x
$18:9414  40			rti
$18:9415  57 f3		 eor [$f3],y
$18:9417  01 b7		 ora ($b7,x)
$18:9419  c0 5d		 cpy #$5d
$18:941b  80 13		 bra $9430
$18:941d  4a			lsr a
$18:941e  14 42		 trb $42
$18:9420  d1 69		 cmp ($69),y
$18:9422  7b			tdc
$18:9423  83 b0		 sta $b0,s
$18:9425  60			rts
$18:9426  21 44		 and ($44,x)
$18:9428  a6 4e		 ldx $4e
$18:942a  ad 70 1b	  lda $1b70
$18:942d  05 85		 ora $85
$18:942f  f6 42		 inc $42,x
$18:9431  45 a1		 eor $a1
$18:9433  40			rti
$18:9434  67 ef		 adc [$ef]
$18:9436  93 9f		 sta ($9f,s),y
$18:9438  0d 16 84	  ora $8416
$18:943b  ca			dex
$18:943c  00 49		 brk #$49
$18:943e  d8			cld
$18:943f  01 f5		 ora ($f5,x)
$18:9441  62 fe c0	  per $5542
$18:9444  6d 01 f6	  adc $f601
$18:9447  7d 90 ae	  adc $ae90,x
$18:944a  a2 04		 ldx #$04
$18:944c  74 1f		 stz $1f,x
$18:944e  35 12		 and $12,x
$18:9450  75 08		 adc $08,x
$18:9452  84 15		 sty $15
$18:9454  ce 8a 5f	  dec $5f8a
$18:9457  69 cc		 adc #$cc
$18:9459  e6 74		 inc $74
$18:945b  fb			xce
$18:945c  2a			rol a
$18:945d  00 3d		 brk #$3d
$18:945f  48			pha
$18:9460  6d 40 40	  adc $4040
$18:9463  b8			clv
$18:9464  54 5d 83	  mvn $83,$5d
$18:9467  b8			clv
$18:9468  a7 d3		 lda [$d3]
$18:946a  50 4f		 bvc $94bb
$18:946c  47 76		 eor [$76]
$18:946e  0d be dd	  ora $ddbe
$18:9471  48			pha
$18:9472  50 b0		 bvc $9424
$18:9474  98			tya
$18:9475  08			php
$18:9476  e7 09		 sbc [$09]
$18:9478  47 b1		 eor [$b1]
$18:947a  18			clc
$18:947b  f4 ec 01	  pea $01ec
$18:947e  49 d2		 eor #$d2
$18:9480  fe 95 63	  inc $6395,x
$18:9483  6e 60 06	  ror $0660
$18:9486  03 03		 ora $03,s
$18:9488  7d c0 e0	  adc $e0c0,x
$18:948b  a3 f0		 lda $f0,s
$18:948d  37 b8		 and [$b8],y
$18:948f  48			pha
$18:9490  e2 30		 sep #$30
$18:9492  68			pla
$18:9493  fc 7e c1	  jsr ($c17e,x)
$18:9496  d7 c4		 cmp [$c4],y
$18:9498  62 6f b8	  per $4d0a
$18:949b  9c 54 5e	  stz $5e54
$18:949e  17 06		 ora [$06],y
$18:94a0  83 c1		 sta $c1,s
$18:94a2  20 f0 f8	  jsr $f8f0
$18:94a5  24 0f		 bit $0f
$18:94a7  bd df 46	  lda $46df,x
$18:94aa  0c fa 2f	  tsb $2ffa
$18:94ad  19 89 c5	  ora $c589,y
$18:94b0  03 07		 ora $07,s
$18:94b2  03 eb		 ora $eb,s
$18:94b4  f5 ac		 sbc $ac,x
$18:94b6  23 70		 and $70,s
$18:94b8  98			tya
$18:94b9  3d 82 33	  and $3382,x
$18:94bc  03 8d		 ora $8d,s
$18:94be  48			pha
$18:94bf  9e e1 21	  stz $21e1,x
$18:94c2  81 f7		 sta ($f7,x)
$18:94c4  c1 e1		 cmp ($e1,x)
$18:94c6  62 76 83	  per $183f
$18:94c9  d8			cld
$18:94ca  a3 70		 lda $70,s
$18:94cc  39 10 b4	  and $b410,y
$18:94cf  03 c2		 ora $c2,s
$18:94d1  1f 1b 74 5e   ora $5e741b,x
$18:94d5  3e 45 6b	  rol $6b45,x
$18:94d8  4d a0 9e	  eor $9ea0
$18:94db  22 20 9f db   jsl $db9f20
$18:94df  a6 05		 ldx $05
$18:94e1  60			rts
$18:94e2  9f 40 a1 10   sta $10a140,x
$18:94e6  89 f5		 bit #$f5
$18:94e8  82 c3 64	  brl $f9ae
$18:94eb  77 02		 adc [$02],y
$18:94ed  30 28		 bmi $9517
$18:94ef  c6 00		 dec $00
$18:94f1  30 05		 bmi $94f8
$18:94f3  c2 e3		 rep #$e3
$18:94f5  71 80		 adc ($80),y
$18:94f7  94 02		 sty $02,x
$18:94f9  c5 3f		 cmp $3f
$18:94fb  80 d8		 bra $94d5
$18:94fd  ac 66 f0	  ldy $f066
$18:9500  17 8d		 ora [$8d],y
$18:9502  e2 f3		 sep #$f3
$18:9504  73 80		 adc ($80,s),y
$18:9506  9a			txs
$18:9507  09 00		 ora #$00
$18:9509  63 f1		 adc $f1,s
$18:950b  3e 11 40	  rol $4011,x
$18:950e  8f 05 de 49   sta $49de05
$18:9512  89 f0		 bit #$f0
$18:9514  a0 36		 ldy #$36
$18:9516  cb			wai
$18:9517  75 89		 adc $89,x
$18:9519  10 42		 bpl $955d
$18:951b  00 b1		 brk #$b1
$18:951d  3c 07 02	  bit $0207,x
$18:9520  dd 29 fa	  cmp $fa29,x
$18:9523  40			rti
$18:9524  ed 33 f8	  sbc $f833
$18:9527  48			pha
$18:9528  04 31		 tsb $31
$18:952a  2d b4 9f	  and $9fb4
$18:952d  d1 ad		 cmp ($ad),y
$18:952f  66 00		 ror $00
$18:9531  61 1c		 adc ($1c,x)
$18:9533  c2 8e		 rep #$8e
$18:9535  eb			xba
$18:9536  16 01		 asl $01,x
$18:9538  14 85		 trb $85
$18:953a  60			rts
$18:953b  53 09		 eor ($09,s),y
$18:953d  81 90		 sta ($90,x)
$18:953f  9a			txs
$18:9540  21 3e		 and ($3e,x)
$18:9542  60			rts
$18:9543  1d 88 28	  ora $2888,x
$18:9546  16 d3		 asl $d3,x
$18:9548  b0 40		 bcs $958a
$18:954a  6d 63 20	  adc $2063
$18:954d  08			php
$18:954e  94 c2		 sty $c2,x
$18:9550  de 13 08	  dec $0813,x
$18:9553  fb			xce
$18:9554  3c 18 a0	  bit $a018,x
$18:9557  d1 1b		 cmp ($1b),y
$18:9559  60			rts
$18:955a  cc 1f 63	  cpy $631f
$18:955d  6c 23 23	  jmp ($2323)
$18:9560  45 2d		 eor $2d
$18:9562  f4 68 0c	  pea $0c68
$18:9565  7e 0f 03	  ror $030f,x
$18:9568  95 ff		 sta $ff,x
$18:956a  63 51		 adc $51,s
$18:956c  f7 e0		 sbc [$e0],y
$18:956e  17 04		 ora [$04],y
$18:9570  4e 51 f8	  lsr $f851
$18:9573  a4 4e		 ldy $4e
$18:9575  2b			pld
$18:9576  03 81		 ora $81,s
$18:9578  c7 cb		 cmp [$cb]
$18:957a  60			rts
$18:957b  6c 11 b9	  jmp ($b911)
$18:957e  72 41		 adc ($41)
$18:9580  c9 01		 cmp #$01
$18:9582  84 9f		 sty $9f
$18:9584  04 8e		 tsb $8e
$18:9586  57 a9		 eor [$a9],y
$18:9588  80 9d		 bra $9527
$18:958a  21 44		 and ($44,x)
$18:958c  66 9f		 ror $9f
$18:958e  0e c0 be	  asl $bec0
$18:9591  77 b2		 adc [$b2],y
$18:9593  39 6f 89	  and $896f,y
$18:9596  81 10		 sta ($10,x)
$18:9598  b9 92 0c	  lda $0c92,y
$18:959b  8e 3e bd	  stx $bd3e
$18:959e  ae dd 1a	  ldx $1add
$18:95a1  17 cb		 ora [$cb],y
$18:95a3  91 bd		 sta ($bd),y
$18:95a5  f7 db		 sbc [$db],y
$18:95a7  dd f9 1c	  cmp $1cf9,x
$18:95aa  6f 57 3b 99   adc $993b57
$18:95ae  a4 2f		 ldy $2f
$18:95b0  3f d4 88 dc   and $dc88d4,x
$18:95b4  f8			sed
$18:95b5  bc 73 58	  ldy $5873,x
$18:95b8  23 42		 and $42,s
$18:95ba  fb			xce
$18:95bb  81 c0		 sta ($c0,x)
$18:95bd  e0 d0		 cpx #$d0
$18:95bf  e0 95		 cpx #$95
$18:95c1  2b			pld
$18:95c2  c9 e4		 cmp #$e4
$18:95c4  14 80		 trb $80
$18:95c6  9e 0c 4e	  stz $4e0c,x
$18:95c9  27 16		 and [$16]
$18:95cb  69 23		 adc #$23
$18:95cd  48			pha
$18:95ce  7a			ply
$18:95cf  93 20		 sta ($20,s),y
$18:95d1  9c 19 f9	  stz $f919
$18:95d4  11 f7		 ora ($f7),y
$18:95d6  ca			dex
$18:95d7  42 2e		 wdm #$2e
$18:95d9  81 11		 sta ($11,x)
$18:95db  94 88		 sty $88,x
$18:95dd  4d 0b 61	  eor $610b
$18:95e0  15 9b		 ora $9b,x
$18:95e2  2b			pld
$18:95e3  47 22		 eor [$22]
$18:95e5  8e d7 6c	  stx $6cd7
$18:95e8  9c 1b 60	  stz $601b
$18:95eb  5c 6c 81 c0   jml $c0816c
$18:95ef  22 12 64 51   jsl $516412
$18:95f3  a1 08		 lda ($08,x)
$18:95f5  88			dey
$18:95f6  58			cli
$18:95f7  2c 36 28	  bit $2836
$18:95fa  0c 16 3e	  tsb $3e16
$18:95fd  45 2d		 eor $2d
$18:95ff  f7 1e		 sbc [$1e],y
$18:9601  f3 7c		 sbc ($7c,s),y
$18:9603  b8			clv
$18:9604  dc bb dd	  jml [$ddbb]
$18:9607  f0 58		 beq $9661
$18:9609  45 23		 eor $23
$18:960b  e5 56		 sbc $56
$18:960d  46 87		 lsr $87
$18:960f  5b			tcd
$18:9610  ae 1b 08	  ldx $081b
$18:9613  ff 20 ca c8   sbc $c8ca20,x
$18:9617  d0 0d		 bne $9626
$18:9619  80 c0		 bra $95db
$18:961b  1a			inc a
$18:961c  32 2a		 and ($2a)
$18:961e  11 10		 ora ($10),y
$18:9620  38			sec
$18:9621  64 74		 stz $74
$18:9623  24 dc		 bit $dc
$18:9625  25 9e		 and $9e
$18:9627  01 42		 ora ($42,x)
$18:9629  38			sec
$18:962a  45 00		 eor $00
$18:962c  a3 04		 lda $04,s
$18:962e  b6 78		 ldx $78,y
$18:9630  8c 4e 37	  sty $374e
$18:9633  03 8e		 ora $8e,s
$18:9635  58			cli
$18:9636  09 21		 ora #$21
$18:9638  5f 40 7f 1c   eor $1c7f40,x
$18:963c  55 b5		 eor $b5,x
$18:963e  c2 0f		 rep #$0f
$18:9640  61 b4		 adc ($b4,x)
$18:9642  77 ce		 adc [$ce],y
$18:9644  00 fa		 brk #$fa
$18:9646  17 e0		 ora [$e0],y
$18:9648  b0 05		 bcs $964f
$18:964a  ec 29 02	  cpx $0229
$18:964d  4f 93 e8 54   eor $54e893
$18:9651  c9 01		 cmp #$01
$18:9653  9f 4f ec 94   sta $94ec4f,x
$18:9657  67 78		 adc [$78]
$18:9659  51 d4		 eor ($d4),y
$18:965b  8b			phb
$18:965c  08			php
$18:965d  04 84		 tsb $84
$18:965f  fe 7d 30	  inc $307d,x
$18:9662  68			pla
$18:9663  02 cd		 cop #$cd
$18:9665  43 00		 eor $00,s
$18:9667  19 08 0c	  ora $0c08,y
$18:966a  c2 c4		 rep #$c4
$18:966c  d0 09		 bne $9677
$18:966e  f2 91		 sbc ($91)
$18:9670  08			php
$18:9671  43 7a		 eor $7a,s
$18:9673  06 84		 asl $84
$18:9675  06 05		 asl $05
$18:9677  70 19		 bvs $9692
$18:9679  1b			tcs
$18:967a  d1 3d		 cmp ($3d),y
$18:967c  2e 47 7c	  rol $7c47
$18:967f  4d 48 6a	  eor $6a48
$18:9682  1e aa 85	  asl $85aa,x
$18:9685  45 f2		 eor $f2
$18:9687  8c b0 85	  sty $85b0
$18:968a  5e 02 e0	  lsr $e002,x
$18:968d  17 0a		 ora [$0a],y
$18:968f  c5 64		 cmp $64
$18:9691  46 5f		 lsr $5f
$18:9693  df 4b 6c 2e   cmp $2e6c4b,x
$18:9697  37 b1		 and [$b1],y
$18:9699  38			sec
$18:969a  09 c3		 ora #$c3
$18:969c  e7 52		 sbc [$52]
$18:969e  19 93 f4	  ora $f493,y
$18:96a1  00 73		 brk #$73
$18:96a3  79 1b 80	  adc $801b,y
$18:96a6  f6 37		 inc $37,x
$18:96a8  cf 43 f5 93   cmp $93f543
$18:96ac  00 a8		 brk #$a8
$18:96ae  7e bd f0	  ror $f0bd,x
$18:96b1  64 c2		 stz $c2
$18:96b3  cd ea da	  cmp $daea
$18:96b6  ed b6 e1	  sbc $e1b6
$18:96b9  a3 1d		 lda $1d,s
$18:96bb  88			dey
$18:96bc  68			pla
$18:96bd  b6 bc		 ldx $bc,y
$18:96bf  de 77 1c	  dec $1c77,x
$18:96c2  34 55		 bit $55,x
$18:96c4  20 b8 5f	  jsr $5fb8
$18:96c7  70 38		 bvs $9701
$18:96c9  37 58		 and [$58],y
$18:96cb  71 78		 adc ($78),y
$18:96cd  dc 72 a9	  jml [$a972]
$18:96d0  9f 06 fb 89   sta $89fb06,x
$18:96d4  c5 95		 cmp $95
$18:96d6  84 ae		 sty $ae
$18:96d8  8f d0 0b 84   sta $840bd0
$18:96dc  c1 8c		 cmp ($8c,x)
$18:96de  0f 49 13 85   ora $851349
$18:96e2  be 13 80	  ldx $8013,y
$18:96e5  48			pha
$18:96e6  10 59		 bpl $9741
$18:96e8  15 82		 ora $82,x
$18:96ea  e5 0c		 sbc $0c
$18:96ec  42 80		 wdm #$80
$18:96ee  4b			phk
$18:96ef  a0 7d		 ldy #$7d
$18:96f1  33 e0		 and ($e0,s),y
$18:96f3  c0 6c		 cpy #$6c
$18:96f5  16 15		 asl $15,x
$18:96f7  80 fc		 bra $96f5
$18:96f9  42 e0		 wdm #$e0
$18:96fb  a8			tay
$18:96fc  53 e9		 eor ($e9,s),y
$18:96fe  de a8 14	  dec $14a8,x
$18:9701  9a			txs
$18:9702  0b			phd
$18:9703  d9 42 e6	  cmp $e642,y
$18:9706  f4 07 bb	  pea $bb07
$18:9709  50 4f		 bvc $975a
$18:970b  a5 84		 lda $84
$18:970d  c1 3d		 cmp ($3d,x)
$18:970f  73 19		 adc ($19,s),y
$18:9711  8a			txa
$18:9712  02 e5		 cop #$e5
$18:9714  eb			xba
$18:9715  61 45		 adc ($45,x)
$18:9717  7b			tdc
$18:9718  5b			tcd
$18:9719  d2 45		 cmp ($45)
$18:971b  c9 b8		 cmp #$b8
$18:971d  a7 d3		 lda [$d3]
$18:971f  5e f5 7c	  lsr $7cf5,x
$18:9722  b8			clv
$18:9723  f2 77		 sbc ($77)
$18:9725  14 ea		 trb $ea
$18:9727  79 9d 1a	  adc $1a9d,y
$18:972a  e6 62		 inc $62
$18:972c  13 b2		 ora ($b2,s),y
$18:972e  7e ab 8c	  ror $8cab,x
$18:9731  73 5a		 adc ($5a,s),y
$18:9733  3f a3 e0 6f   and $6fe0a3,x
$18:9737  4c 26 05	  jmp $0526
$18:973a  2c 9f 8f	  bit $8f9f
$18:973d  c3 1c		 cmp $1c,s
$18:973f  92 a1		 sta ($a1)
$18:9741  8e c4 a9	  stx $a9c4
$18:9744  98			tya
$18:9745  1e 58 cc	  asl $cc58,x
$18:9748  4e 2b 61	  lsr $612b
$18:974b  39 5b a9	  and $a95b,y
$18:974e  7d 8a cc	  adc $cc8a,x
$18:9751  6f 5e 4b d5   adc $d54b5e
$18:9755  8f ea 53 01   sta $0153ea
$18:9759  aa			tax
$18:975a  ee 66 93	  inc $9366
$18:975d  17 83		 ora [$83],y
$18:975f  69 5e		 adc #$5e
$18:9761  25 c0		 and $c0
$18:9763  c8			iny
$18:9764  e4 70		 cpx $70
$18:9766  a0 00		 ldy #$00
$18:9768  e0 cc		 cpx #$cc
$18:976a  a6 73		 ldx $73
$18:976c  2d 28 18	  and $1828
$18:976f  66 7c		 ror $7c
$18:9771  0c c6 67	  tsb $67c6
$18:9774  1e 10 1c	  asl $1c10,x
$18:9777  d3 c0		 cmp ($c0,s),y
$18:9779  e7 af		 sbc [$af]
$18:977b  00 cc		 brk #$cc
$18:977d  03 d4		 ora $d4,s
$18:977f  14 40		 trb $40
$18:9781  a2 0f		 ldx #$0f
$18:9783  30 68		 bmi $97ed
$18:9785  9e 04 1e	  stz $1e04,x
$18:9788  f0 7b		 beq $9805
$18:978a  65 b2		 adc $b2
$18:978c  e3 9c		 sbc $9c,s
$18:978e  cf 67 c5 38   cmp $38c567
$18:9792  19 39 a4	  ora $a439,y
$18:9795  f0 7d		 beq $9814
$18:9797  e0 f4		 cpx #$f4
$18:9799  ce 00 01	  dec $0100
$18:979c  2c 99 bd	  bit $bd99
$18:979f  06 8c		 asl $8c
$18:97a1  22 4a 18 d4   jsl $d4184a
$18:97a5  6a			ror a
$18:97a6  d4 39		 pei ($39)
$18:97a8  b1 cc		 lda ($cc),y
$18:97aa  28			plp
$18:97ab  72 84		 adc ($84)
$18:97ad  9f 00 81 e9   sta $e98100,x
$18:97b1  34 2d		 bit $2d,x
$18:97b3  84 a1		 sty $a1
$18:97b5  6a			ror a
$18:97b6  32 6d		 and ($6d)
$18:97b8  83 ca		 sta $ca,s
$18:97ba  6a			ror a
$18:97bb  5d 08 59	  eor $5908,x
$18:97be  29 e4		 and #$e4
$18:97c0  d0 1e		 bne $97e0
$18:97c2  59 aa 3e	  eor $3eaa,y
$18:97c5  ba			tsx
$18:97c6  03 01		 ora $01,s
$18:97c8  d2 a6		 cmp ($a6)
$18:97ca  14 c4		 trb $c4
$18:97cc  56 f7		 lsr $f7,x
$18:97ce  e8			inx
$18:97cf  3f 01 43 0f   and $0f4301,x
$18:97d3  90 a3		 bcc $9778
$18:97d5  3f 00 1d 53   and $531d00,x
$18:97d9  0a			asl a
$18:97da  3b			tsc
$18:97db  f0 35		 beq $9812
$18:97dd  ea			nop
$18:97de  17 d2		 ora [$d2],y
$18:97e0  68			pla
$18:97e1  a6 01		 ldx $01
$18:97e3  c1 07		 cmp ($07,x)
$18:97e5  46 b3		 lsr $b3
$18:97e7  54 0a 07	  mvn $07,$0a
$18:97ea  e0 51		 cpx #$51
$18:97ec  94 2f		 sty $2f,x
$18:97ee  9a			txs
$18:97ef  9f 3f 03 4d   sta $4d033f,x
$18:97f3  46 98		 lsr $98
$18:97f5  13 e2		 ora ($e2,s),y
$18:97f7  11 08		 ora ($08),y
$18:97f9  88			dey
$18:97fa  40			rti
$18:97fb  66 05		 ror $05
$18:97fd  e2 fe		 sep #$fe
$18:97ff  a8			tay
$18:9800  4d 2a 39	  eor $392a
$18:9803  28			plp
$18:9804  0c fa de	  tsb $defa
$18:9807  a1 ac		 lda ($ac,x)
$18:9809  d0 72		 bne $987d
$18:980b  d1 3e		 cmp ($3e),y
$18:980d  9a			txs
$18:980e  18			clc
$18:980f  14 21		 trb $21
$18:9811  1f 70 29 c4   ora $c42970,x
$18:9815  e5 1f		 sbc $1f
$18:9817  73 8a		 adc ($8a,s),y
$18:9819  6d 07 46	  adc $4607
$18:981c  30 7d		 bmi $989b
$18:981e  0e 87 45	  asl $4587
$18:9821  40			rti
$18:9822  a0 d2		 ldy #$d2
$18:9824  72 6d		 adc ($6d)
$18:9826  90 70		 bcc $9898
$18:9828  26 53		 rol $53
$18:982a  53 a9		 eor ($a9,s),y
$18:982c  d5 50		 cmp $50,x
$18:982e  29 34		 and #$34
$18:9830  15 60		 ora $60,x
$18:9832  33 05		 and ($05,s),y
$18:9834  da			phx
$18:9835  0f 42 a1 12   ora $12a142
$18:9839  89 e1		 bit #$e1
$18:983b  14 9a		 trb $9a
$18:983d  10 ec		 bpl $982b
$18:983f  a1 2d		 lda ($2d,x)
$18:9841  c1 79		 cmp ($79,x)
$18:9843  a5 12		 lda $12
$18:9845  94 0b		 sty $0b,x
$18:9847  40			rti
$18:9848  1a			inc a
$18:9849  be 40 b2	  ldx $b240,y
$18:984c  20 da 05	  jsr $05da
$18:984f  18			clc
$18:9850  7a			ply
$18:9851  93 83		 sta ($83,s),y
$18:9853  17 8f		 ora [$8f],y
$18:9855  8b			phb
$18:9856  e5 f6		 sbc $f6
$18:9858  31 f8		 and ($f8),y
$18:985a  c0 ff		 cpy #$ff
$18:985c  61 62		 adc ($62,x)
$18:985e  fb			xce
$18:985f  b1 c7		 lda ($c7),y
$18:9861  e2 36		 sep #$36
$18:9863  ea			nop
$18:9864  45 3a		 eor $3a
$18:9866  9e f2 30	  stz $30f2,x
$18:9869  c9 c5		 cmp #$c5
$18:986b  e2 67		 sep #$67
$18:986d  a0 3d		 ldy #$3d
$18:986f  02 00		 cop #$00
$18:9871  50 20		 bvc $9893
$18:9873  1a			inc a
$18:9874  38			sec
$18:9875  fc 0e 10	  jsr ($100e,x)
$18:9878  9f 18 82 3c   sta $3c8218,x
$18:987c  94 86		 sty $86,x
$18:987e  4d 09 ca	  eor $ca09
$18:9881  bc 67 4a	  ldy $4a67,x
$18:9884  05 b1		 ora $b1
$18:9886  23 c5		 and $c5,s
$18:9888  da			phx
$18:9889  14 c9		 trb $c9
$18:988b  dc ed 60	  jml [$60ed]
$18:988e  a9 f2		 lda #$f2
$18:9890  79 9b 04	  adc $049b,y
$18:9893  58			cli
$18:9894  64 af		 stz $af
$18:9896  21 0b		 and ($0b,x)
$18:9898  35 09		 and $09,x
$18:989a  d0 53		 bne $98ef
$18:989c  f9 80 a8	  sbc $a880,y
$18:989f  de 40 f1	  dec $f140,x
$18:98a2  57 91		 eor [$91],y
$18:98a4  45 e3		 eor $e3
$18:98a6  e0 35		 cpx #$35
$18:98a8  7c ac 7e	  jmp ($7eac,x)
$18:98ab  07 03		 ora [$03]
$18:98ad  8c c6 21	  sty $21c6
$18:98b0  70 78		 bvs $992a
$18:98b2  1c 7c 00	  trb $007c
$18:98b5  90 58		 bcc $990f
$18:98b7  24 ae		 bit $ae
$18:98b9  30 14		 bmi $98cf
$18:98bb  08			php
$18:98bc  8c 36 06	  sty $0636
$18:98bf  0b			phd
$18:98c0  20 98 44	  jsr $4498
$18:98c3  e2 91		 sep #$91
$18:98c5  40			rti
$18:98c6  a0 48		 ldy #$48
$18:98c8  64 03		 stz $03
$18:98ca  10 0d		 bpl $98d9
$18:98cc  24 68		 bit $68
$18:98ce  28			plp
$18:98cf  00 3a		 brk #$3a
$18:98d1  0a			asl a
$18:98d2  08			php
$18:98d3  68			pla
$18:98d4  24 50		 bit $50
$18:98d6  b8			clv
$18:98d7  30 d0		 bmi $98a9
$18:98d9  43 47		 eor $47,s
$18:98db  07 8d		 ora [$8d]
$18:98dd  c8			iny
$18:98de  e4 51		 cpx $51
$18:98e0  71 80		 adc ($80),y
$18:98e2  c2 e0		 rep #$e0
$18:98e4  84 13		 sty $13
$18:98e6  80 c3		 bra $98ab
$18:98e8  a2 71		 ldx #$71
$18:98ea  52 90		 eor ($90)
$18:98ec  85 00		 sta $00
$18:98ee  ca			dex
$18:98ef  25 f0		 and $f0
$18:98f1  0d 05 1c	  ora $1c05
$18:98f4  66 22		 ror $22
$18:98f6  a0 40		 ldy #$40
$18:98f8  0c ac 60	  tsb $60ac
$18:98fb  30 38		 bmi $9935
$18:98fd  d4 5e		 pei ($5e)
$18:98ff  7c 74 03	  jmp ($0374,x)
$18:9902  d8			cld
$18:9903  96 05		 stx $05,y
$18:9905  16 10		 asl $10,x
$18:9907  33 88		 and ($88,s),y
$18:9909  48			pha
$18:990a  63 f6		 adc $f6,s
$18:990c  f0 1b		 beq $9929
$18:990e  81 9e		 sta ($9e,x)
$18:9910  d6 f2		 dec $f2,x
$18:9912  38			sec
$18:9913  14 21		 trb $21
$18:9915  71 93		 adc ($93),y
$18:9917  86 ca		 stx $ca
$18:9919  32 5d		 and ($5d)
$18:991b  d0 ad		 bne $98ca
$18:991d  77 a6		 adc [$a6],y
$18:991f  d0 69		 bne $998a
$18:9921  2e 83 80	  rol $8083
$18:9924  db			stp
$18:9925  e1 37		 sbc ($37,x)
$18:9927  8b			phb
$18:9928  cd cd e6	  cmp $e6cd
$18:992b  f7 a5		 sbc [$a5],y
$18:992d  90 42		 bcc $9971
$18:992f  70 18		 bvs $9949
$18:9931  10 1a		 bpl $994d
$18:9933  df 40 61 82   cmp $826140,x
$18:9937  7f 8e 23 12   adc $12238e,x
$18:993b  13 5b		 ora ($5b,s),y
$18:993d  e8			inx
$18:993e  4c 31 4a	  jmp $4a31
$18:9941  f2 b6		 sbc ($b6)
$18:9943  40			rti
$18:9944  67 f6		 adc [$f6]
$18:9946  0b			phd
$18:9947  0c 06 dd	  tsb $dd06
$18:994a  30 98		 bmi $98e4
$18:994c  4f d6 46 24   eor $2446d6
$18:9950  0a			asl a
$18:9951  3c 06 d1	  bit $d106,x
$18:9954  69 1a 05	  adc #$051a
$18:9957  be 8d 30	  ldx $308d,y
$18:995a  b7 8b		 lda [$8b],y
$18:995c  ce 60 b2	  dec $b260
$18:995f  01 30		 ora ($30,x)
$18:9961  09 86 03	  ora #$0386
$18:9964  3e 59 14	  rol $1459,x
$18:9967  fa			plx
$18:9968  60			rts
$18:9969  4c 09 f5	  jmp $f509
$18:996c  a3 bf		 lda $bf,s
$18:996e  de b4 c0	  dec $c0b4,x
$18:9971  6c 62 d5	  jmp ($d562)
$18:9974  59 0d 83	  eor $830d,y
$18:9977  af d6 24 89   lda $8924d6
$18:997b  aa			tax
$18:997c  0a			asl a
$18:997d  c6 4a		 dec $4a
$18:997f  11 61		 ora ($61),y
$18:9981  db			stp
$18:9982  88			dey
$18:9983  c2 67		 rep #$67
$18:9985  12 61		 ora ($61)
$18:9987  10 c6		 bpl $994f
$18:9989  03 62		 ora $62,s
$18:998b  3a			dec a
$18:998c  91 5c		 sta ($5c),y
$18:998e  44 60 24	  mvp $24,$60
$18:9991  03 f2		 ora $f2,s
$18:9993  99 c0 ce	  sta $cec0,y
$18:9996  24 82		 bit $82
$18:9998  80 b0		 bra $994a
$18:999a  0d 2c 2b	  ora $2b2c
$18:999d  53 57		 eor ($57,s),y
$18:999f  8b			phb
$18:99a0  41 57		 eor ($57,x)
$18:99a2  ee e0 56	  inc $56e0
$18:99a5  ab			plb
$18:99a6  d2 68		 cmp ($68)
$18:99a8  2d fc 15	  and $15fc
$18:99ab  01 48		 ora ($48,x)
$18:99ad  41 e3		 eor ($e3,x)
$18:99af  78			sei
$18:99b0  b9 de 5f	  lda $5fde,y
$18:99b3  03 7a		 ora $7a,s
$18:99b5  20 89 30	  jsr $3089
$18:99b8  de cd 64	  dec $64cd,x
$18:99bb  35 2b		 and $2b,x
$18:99bd  d9 c1 ed	  cmp $edc1,y
$18:99c0  80 c0		 bra $9982
$18:99c2  8a			txa
$18:99c3  02 fb		 cop #$fb
$18:99c5  81 c1		 sta ($c1,x)
$18:99c7  07 9f		 ora [$9f]
$18:99c9  11 89		 ora ($89),y
$18:99cb  1c 05 f7	  trb $f705
$18:99ce  13 8a		 ora ($8a,s),y
$18:99d0  38			sec
$18:99d1  0c 5e 3f	  tsb $3f5e
$18:99d4  17 38		 ora [$38],y
$18:99d6  24 fa		 bit $fa
$18:99d8  61 47		 adc ($47,x)
$18:99da  38			sec
$18:99db  0c 0a 1b	  tsb $1b0a
$18:99de  0e 86 1c	  asl $1c86
$18:99e1  11 fe		 ora ($fe),y
$18:99e3  76 28		 ror $28,x
$18:99e5  4c 50 c2	  jmp $c250
$18:99e8  09 e3 25	  ora #$25e3
$18:99eb  00 04		 brk #$04
$18:99ed  c8			iny
$18:99ee  10 9e		 bpl $998e
$18:99f0  08			php
$18:99f1  14 32		 trb $32
$18:99f3  1c 9e 17	  trb $179e
$18:99f6  90 4f		 bcc $9a47
$18:99f8  c9 84 f3	  cmp #$f384
$18:99fb  23 08		 and $08,s
$18:99fd  4f ad 85 82   eor $8285ad
$18:9a01  37 11		 and [$11],y
$18:9a03  d9 0c cc	  cmp $cc0c,y
$18:9a06  7c 02 a2	  jmp ($a202,x)
$18:9a09  42 22		 wdm #$22
$18:9a0b  09 b4 30	  ora #$30b4
$18:9a0e  01 ad		 ora ($ad,x)
$18:9a10  27 33		 and [$33]
$18:9a12  a8			tay
$18:9a13  43 06		 eor $06,s
$18:9a15  e7 73		 sbc [$73]
$18:9a17  b9 cb 46	  lda $46cb,y
$18:9a1a  e9 8c f0	  sbc #$f08c
$18:9a1d  70 5c		 bvs $9a7b
$18:9a1f  06 d1		 asl $d1
$18:9a21  69 0b 05	  adc #$050b
$18:9a24  e7 e3		 sbc [$e3]
$18:9a26  58			cli
$18:9a27  ac 86 4b	  ldy $4b86
$18:9a2a  d2 f6		 cmp ($f6)
$18:9a2c  00 99		 brk #$99
$18:9a2e  86 48		 stx $48
$18:9a30  32 1b		 and ($1b)
$18:9a32  5d bd e7	  eor $e7bd,x
$18:9a35  e7 52		 sbc [$52]
$18:9a37  7f cf 17 8f   adc $8f17cf,x
$18:9a3b  be 7d 82	  ldx $827d,y
$18:9a3e  d0 b0		 bne $99f0
$18:9a40  18			clc
$18:9a41  11 21		 ora ($21),y
$18:9a43  60			rts
$18:9a44  ef 3b e0 e0   sbc $e0e03b
$18:9a48  5e 56 85	  lsr $8556,x
$18:9a4b  88			dey
$18:9a4c  c4 8d		 cpy $8d
$18:9a4e  0b			phd
$18:9a4f  16 14		 asl $14,x
$18:9a51  32 aa		 and ($aa)
$18:9a53  9a			txs
$18:9a54  80 04		 bra $9a5a
$18:9a56  5e aa 85	  lsr $85aa,x
$18:9a59  44 e8 29	  mvp $29,$e8
$18:9a5c  03 23		 ora $23,s
$18:9a5e  9b			txy
$18:9a5f  f1 10		 sbc ($10),y
$18:9a61  ca			dex
$18:9a62  23 01		 and $01,s
$18:9a64  48			pha
$18:9a65  0b			phd
$18:9a66  4e c4 a1	  lsr $a1c4
$18:9a69  0a			asl a
$18:9a6a  38			sec
$18:9a6b  c0 c7		 cpy #$c7
$18:9a6d  24 b9		 bit $b9
$18:9a6f  0b			phd
$18:9a70  19 88 66	  ora $6688,y
$18:9a73  14 73		 trb $73
$18:9a75  a9 08 c8	  lda #$c808
$18:9a78  c4 76		 cpy $76
$18:9a7a  e2 28		 sep #$28
$18:9a7c  0b			phd
$18:9a7d  d8			cld
$18:9a7e  c4 85		 cpy $85
$18:9a80  51 31		 eor ($31),y
$18:9a82  11 fc		 ora ($fc),y
$18:9a84  27 e5		 and [$e5]
$18:9a86  f7 31		 sbc [$31],y
$18:9a88  14 0a		 trb $0a
$18:9a8a  10 bd		 bpl $9a49
$18:9a8c  c9 c4		 cmp #$c4
$18:9a8e  e5 9b		 sbc $9b
$18:9a90  8e d0 6e	  stx $6ed0
$18:9a93  65 16		 adc $16
$18:9a95  93 41		 sta ($41,s),y
$18:9a97  2e 85 48	  rol $4885
$18:9a9a  28			plp
$18:9a9b  57 ce		 eor [$ce],y
$18:9a9d  4e e1 d8	  lsr $d8e1
$18:9aa0  2f a1 26 81   and $8126a1
$18:9aa4  34 2a		 bit $2a,x
$18:9aa6  44 c1 7b	  mvp $7b,$c1
$18:9aa9  0d 3e 9c	  ora $9c3e
$18:9aac  ec 32 e8	  cpx $e832
$18:9aaf  13 40		 ora ($40,s),y
$18:9ab1  ba			tsx
$18:9ab2  0f 50 b8 dc   ora $dcb850
$18:9ab6  79 34 07	  adc $0734,y
$18:9ab9  d8			cld
$18:9aba  0e c4 b8	  asl $b8c4
$18:9abd  2f 13 bc de   and $debc13
$18:9ac1  a8			tay
$18:9ac2  0e d0 13	  asl $13d0
$18:9ac5  90 bc		 bcc $9a83
$18:9ac7  f7 c2		 sbc [$c2],y
$18:9ac9  92 0e		 sta ($0e)
$18:9acb  97 af		 sta [$af],y
$18:9acd  6b			rtl
$18:9ace  b6 db		 ldx $db,y
$18:9ad0  8d c8 52	  sta $52c8
$18:9ad3  3b			tsc
$18:9ad4  8a			txa
$18:9ad5  6d 05 e2	  adc $e205
$18:9ad8  1b			tcs
$18:9ad9  ed ef 13	  sbc $13ef
$18:9adc  99 b7 7a	  sta $7ab7,y
$18:9adf  07 f4		 ora [$f4]
$18:9ae1  fa			plx
$18:9ae2  00 70		 brk #$70
$18:9ae4  9d 87 87	  sta $8787,x
$18:9ae7  e7 c5		 sbc [$c5]
$18:9ae9  e3 71		 sbc $71,s
$18:9aeb  b8			clv
$18:9aec  e3 04		 sbc $04,s
$18:9aee  1d 88 9c	  ora $9c88,x
$18:9af1  b7 cf		 lda [$cf],y
$18:9af3  21 c2		 and ($c2,x)
$18:9af5  60			rts
$18:9af6  4f 03 82 16   eor $168203
$18:9afa  06 04		 asl $04
$18:9afc  fe b8 e4	  inc $e4b8,x
$18:9aff  e0 e2		 cpx #$e2
$18:9b01  71 41		 adc ($41),y
$18:9b03  c0 44		 cpy #$44
$18:9b05  12 20		 ora ($20)
$18:9b07  e7 cc		 sbc [$cc]
$18:9b09  c2 06		 rep #$06
$18:9b0b  02 d8		 cop #$d8
$18:9b0d  27 f0		 and [$f0]
$18:9b0f  1b			tcs
$18:9b10  74 fa		 stz $fa,x
$18:9b12  7c b7 08	  jmp ($08b7,x)
$18:9b15  4d 01 b8	  eor $b801
$18:9b18  2e d0 61	  rol $61d0
$18:9b1b  c3 e5		 cmp $e5,s
$18:9b1d  1a			inc a
$18:9b1e  0e f9 4a	  asl $4af9
$18:9b21  0b			phd
$18:9b22  92 5f		 sta ($5f)
$18:9b24  46 d8		 lsr $d8
$18:9b26  57 03		 eor [$03],y
$18:9b28  e1 60		 sbc ($60,x)
$18:9b2a  0f 0c fe bc   ora $bcfe0c
$18:9b2e  34 1d		 bit $1d,x
$18:9b30  e1 ff		 sbc ($ff,x)
$18:9b32  18			clc
$18:9b33  79 07 ca	  adc $ca07,y
$18:9b36  5e 63 f3	  lsr $f363,x
$18:9b39  a7 a1		 lda [$a1]
$18:9b3b  7d 2d ea	  adc $ea2d,x
$18:9b3e  7f 5c 7b 27   adc $277b5c,x
$18:9b42  db			stp
$18:9b43  5e e8 bc	  lsr $bce8,x
$18:9b46  c6 67		 dec $67
$18:9b48  1f 99 d2 68   ora $68d299,x
$18:9b4c  5d 11 a0	  eor $a011,x
$18:9b4f  d0 82		 bne $9ad3
$18:9b51  83 29		 sta $29,s
$18:9b53  a9 74		 lda #$74
$18:9b55  46 a3		 lsr $a3
$18:9b57  52 1a		 eor ($1a)
$18:9b59  0d 54 f9	  ora $f954
$18:9b5c  d1 13		 cmp ($13),y
$18:9b5e  39 54 c2	  and $c254,y
$18:9b61  8f 01 a3 ba   sta $baa301
$18:9b65  23 21		 and $21,s
$18:9b67  91 1d		 sta ($1d),y
$18:9b69  06 4a		 asl $4a
$18:9b6b  02 ef		 cop #$ef
$18:9b6d  cc d0 ba	  cpy $bad0
$18:9b70  4b			phk
$18:9b71  1e 69 f3	  asl $f369,x
$18:9b74  d7 a2		 cmp [$a2],y
$18:9b76  fd 39 ea	  sbc $ea39,x
$18:9b79  df 5f 7b 3f   cmp $3f7b5f,x
$18:9b7d  dc 1e f1	  jml [$f11e]
$18:9b80  f0 17		 beq $9b99
$18:9b82  84 fc		 sty $fc
$18:9b84  49 e3		 eor #$e3
$18:9b86  5f 23 79 5f   eor $5f7923,x
$18:9b8a  cd 1e 79	  cmp $791e
$18:9b8d  f4 57 a6	  pea $a657
$18:9b90  fd 59 eb	  sbc $eb59,x
$18:9b93  df 67 7b 7b   cmp $7b7b67,x
$18:9b97  60			rts
$18:9b98  2e f2 9f	  rol $9ff2
$18:9b9b  b9 76 02	  lda $0276,y
$18:9b9e  f5 f0		 sbc $f0,x
$18:9ba0  37 89		 and [$89],y
$18:9ba2  bc 6f e4	  ldy $e46f,x
$18:9ba5  8f 2c f9 ab   sta $abf92c
$18:9ba9  cf 7e 8c f4   cmp $f48c7e
$18:9bad  ef ab bd 7f   sbc $7fbdab
$18:9bb1  ed 0f 6f	  sbc $6f0f
$18:9bb4  5d ba 7d	  eor $7dba,x
$18:9bb7  02 07		 cop #$07
$18:9bb9  9c 0a 11	  stz $110a
$18:9bbc  1f 80 cf a7   ora $a7cf80,x
$18:9bc0  f6 ab		 inc $ab,x
$18:9bc2  05 82		 ora $82
$18:9bc4  c2 1f		 rep #$1f
$18:9bc6  0b			phd
$18:9bc7  6c fe 8f	  jmp ($8ffe)
$18:9bca  02 b8		 cop #$b8
$18:9bcc  61 62		 adc ($62,x)
$18:9bce  f0 1b		 beq $9beb
$18:9bd0  1c fe 61	  trb $61fe
$18:9bd3  68			pla
$18:9bd4  ef 5a 44 40   sbc $40445a
$18:9bd8  0c 08 0c	  tsb $0c08
$18:9bdb  26 f1		 rol $f1
$18:9bdd  79 00 04	  adc $0400,y
$18:9be0  fa			plx
$18:9be1  61 3e		 adc ($3e,x)
$18:9be3  b0 75		 bcs $9c5a
$18:9be5  83 26		 sta $26,s
$18:9be7  15 2b		 ora $2b,x
$18:9be9  4d b5 f6	  eor $f6b5
$18:9bec  16 4b		 asl $4b,x
$18:9bee  45 a0		 eor $a0
$18:9bf0  20 4f 20	  jsr $204f
$18:9bf3  0b			phd
$18:9bf4  0b			phd
$18:9bf5  79 2c 4f	  adc $4f2c,y
$18:9bf8  23 1a		 and $1a,s
$18:9bfa  c0 cc 6d	  cpy #$6dcc
$18:9bfd  76 c1		 ror $c1,x
$18:9bff  a4 bc		 ldy $bc
$18:9c01  86 7f		 stx $7f
$18:9c03  46 19		 lsr $19
$18:9c05  81 5a		 sta ($5a,x)
$18:9c07  82 40 24	  brl $c04a
$18:9c0a  32 cb		 and ($cb)
$18:9c0c  d8			cld
$18:9c0d  83 61		 sta $61,s
$18:9c0f  6c 1b 3a	  jmp ($3a1b)
$18:9c12  3b			tsc
$18:9c13  d3 fe		 cmp ($fe,s),y
$18:9c15  b0 f6		 bcs $9c0d
$18:9c17  0f b4 bd c7   ora $c7bdb4
$18:9c1b  ef 4f 02 f8   sbc $f8024f
$18:9c1f  5b			tcd
$18:9c20  c4 fe		 cpy $fe
$18:9c22  38			sec
$18:9c23  f2 4f		 sbc ($4f)
$18:9c25  94 9a		 sty $9a,x
$18:9c27  3f 17 84 44   and $448417,x
$18:9c2b  0a			asl a
$18:9c2c  55 02		 eor $02,x
$18:9c2e  b8			clv
$18:9c2f  61 6e		 adc ($6e,x)
$18:9c31  45 2a		 eor $2a
$18:9c33  85 5e		 sta $5e
$18:9c35  2f 37 a2 95   and $95a237
$18:9c39  5c 6f 77 9b   jml $9b776f
$18:9c3d  e1 4b		 sbc ($4b,x)
$18:9c3f  d4 fe		 pei ($fe)
$18:9c41  b8			clv
$18:9c42  f6 4f		 inc $4f,x
$18:9c44  b6 bd		 ldx $bd,y
$18:9c46  d7 ef		 cmp [$ef],y
$18:9c48  cf 06 f8 7b   cmp $7bf806
$18:9c4c  c5 fe		 cmp $fe
$18:9c4e  40			rti
$18:9c4f  f2 8f		 sbc ($8f)
$18:9c51  98			tya
$18:9c52  bc e7 e8	  ldy $e8e7,x
$18:9c55  4f 4a fa 9b   eor $9bfa4a
$18:9c59  d6 fe		 dec $fe,x
$18:9c5b  c8			iny
$18:9c5c  f6 cf		 inc $cf,x
$18:9c5e  ba			tsx
$18:9c5f  bd f7 e0	  lda $e0f7,x
$18:9c62  cf 0e f8 bb   cmp $bbf80e
$18:9c66  c7 fe		 cmp [$fe]
$18:9c68  50 f3		 bvc $9c5d
$18:9c6a  0f 9c bd 07   ora $07bd9c
$18:9c6e  e9 4f		 sbc #$4f
$18:9c70  52 fa		 eor ($fa)
$18:9c72  db			stp
$18:9c73  d8			cld
$18:9c74  fe d8 f7	  inc $f7d8,x
$18:9c77  49 80		 eor #$80
$18:9c79  a3 1c		 lda $1c,s
$18:9c7b  a0 4e 29	  ldy #$294e
$18:9c7e  53 8c		 eor ($8c,s),y
$18:9c80  64 e3		 stz $e3
$18:9c82  3d 38 d8	  and $d838,x
$18:9c85  4e 3e 53	  lsr $533e
$18:9c88  89 64		 bit #$64
$18:9c8a  e6 cd		 inc $cd
$18:9c8c  39 d0 4e	  and $4ed0,y
$18:9c8f  7b			tdc
$18:9c90  53 98		 eor ($98,s),y
$18:9c92  a4 ea		 ldy $ea
$18:9c94  9d 3a c4	  sta $c43a,x
$18:9c97  4e b5 53	  lsr $53b5
$18:9c9a  ae e4 ea	  ldx $eae4
$18:9c9d  1d 3b 8c	  ora $8c3b,x
$18:9ca0  4e e4 53	  lsr $53e4
$18:9ca3  b9 64 ee	  lda $ee64,y
$18:9ca6  cd 3b c8	  cmp $c83b
$18:9ca9  4e f7 53	  lsr $53f7
$18:9cac  bf 64 ee 1d   lda $1dee64,x
$18:9cb0  3c 98 4f	  bit $4f98,x
$18:9cb3  2a			rol a
$18:9cb4  53 ce		 eor ($ce,s),y
$18:9cb6  24 f3		 bit $f3
$18:9cb8  ed 3c b4	  sbc $b43c
$18:9cbb  4f 70 53 dc   eor $dc5370
$18:9cbf  64 f7		 stz $f7
$18:9cc1  2d 3d 80	  and $803d
$18:9cc4  0b			phd
$18:9cc5  cf f1 3d ff   cmp $ff3df1
$18:9cc9  ff e0 22 f3   sbc $f322e0,x
$18:9ccd  91 d0		 sta ($d0),y
$18:9ccf  c7 29		 cmp [$29]
$18:9cd1  c1 a1		 cmp ($a1,x)
$18:9cd3  0e 52 32	  asl $3252
$18:9cd6  48			pha
$18:9cd7  5b			tcd
$18:9cd8  fd 04 72	  sbc $7204,x
$18:9cdb  9e 5a 00	  stz $005a,x
$18:9cde  e5 25		 sbc $25
$18:9ce0  e6 05		 inc $05
$18:9ce2  ca			dex
$18:9ce3  cf e0 82 f3   cmp $f382e0
$18:9ce7  e8			inx
$18:9ce8  cf 86 e1 03   cmp $03e186
$18:9cec  39 29 ed	  and $ed29,y
$18:9cef  21 a7		 and ($a7,x)
$18:9cf1  87 44		 sta [$44]
$18:9cf3  81 ed		 sta ($ed,x)
$18:9cf5  86 e0		 stx $e0
$18:9cf7  71 63		 adc ($63),y
$18:9cf9  4b			phk
$18:9cfa  18			clc
$18:9cfb  70 be		 bvs $9cbb
$18:9cfd  c5 76		 cmp $76
$18:9cff  27 b1		 and [$b1]
$18:9d01  1d 87 e0	  ora $e087,x
$18:9d04  37 01		 and [$01],y
$18:9d06  78			sei
$18:9d07  7f 9c 03 bd   adc $bd039c,x
$18:9d0b  a1 b8		 lda ($b8,x)
$18:9d0d  48			pha
$18:9d0e  72 1e		 adc ($1e)
$18:9d10  72 00		 adc ($00)
$18:9d12  ba			tsx
$18:9d13  ca			dex
$18:9d14  23 44		 and $44,s
$18:9d16  78			sei
$18:9d17  94 0a		 sty $0a,x
$18:9d19  01 3b		 ora ($3b,x)
$18:9d1b  a2 38 49	  ldx #$4938
$18:9d1e  fa			plx
$18:9d1f  0f 70 17 80   ora $801770
$18:9d23  dc 1f a0	  jml [$a01f]
$18:9d26  ef 00 4a 39   sbc $394a00
$18:9d2a  c1 be		 cmp ($be,x)
$18:9d2c  42 f0		 wdm #$f0
$18:9d2e  0a			asl a
$18:9d2f  90 27		 bcc $9d58
$18:9d31  1e f8 f5	  asl $f5f8,x
$18:9d34  27 4b		 and [$4b]
$18:9d36  38			sec
$18:9d37  58			cli
$18:9d38  32 87		 and ($87)
$18:9d3a  10 b2		 bpl $9cee
$18:9d3c  82 0d 1a	  brl $b74c
$18:9d3f  18			clc
$18:9d40  f2 e2		 sbc ($e2)
$18:9d42  ee 5f 0b	  inc $0b5f
$18:9d45  e3 00		 sbc $00,s
$18:9d47  0f f5 d8 26   ora $26d8f5
$18:9d4b  b0 3a		 bcs $9d87
$18:9d4d  a1 8c		 lda ($8c,x)
$18:9d4f  bf 8e 01 2d   lda $2d018e,x
$18:9d53  81 4e		 sta ($4e,x)
$18:9d55  8a			txa
$18:9d56  e4 63		 cpx $63
$18:9d58  22 b9 1a c8   jsl $c81ab9
$18:9d5c  ae 47 32	  ldx $3247
$18:9d5f  50 a2		 bvc $9d03
$18:9d61  5f 11 6c 1f   eor $1f6c11,x
$18:9d65  40			rti
$18:9d66  e9 03		 sbc #$03
$18:9d68  c8			iny
$18:9d69  3a			dec a
$18:9d6a  4f 72 0e 93   eor $930e72
$18:9d6e  fc 9b 68	  jsr ($689b,x)
$18:9d71  d1 c0		 cmp ($c0),y
$18:9d73  ba			tsx
$18:9d74  13 50		 ora ($50,s),y
$18:9d76  96 84		 stx $84,y
$18:9d78  96 18		 stx $18,y
$18:9d7a  a1 94		 lda ($94,x)
$18:9d7c  07 28		 ora [$28]
$18:9d7e  17 20		 ora [$20],y
$18:9d80  5e 3f d1	  lsr $d13f,x
$18:9d83  0e 88 54	  asl $5488
$18:9d86  41 b1		 eor ($b1,x)
$18:9d88  ac 90 e4	  ldy $e490
$18:9d8b  73 22		 adc ($22,s),y
$18:9d8d  7a			ply
$18:9d8e  11 71		 ora ($71),y
$18:9d90  16 4a		 asl $4a,x
$18:9d92  72 09		 adc ($09)
$18:9d94  84 fa		 sty $fa
$18:9d96  8a			txa
$18:9d97  77 4a		 adc [$4a],y
$18:9d99  99 f9 65	  sta $65f9,y
$18:9d9c  27 e7		 and [$e7]
$18:9d9e  00 83		 brk #$83
$18:9da0  74 15		 stz $15,x
$18:9da2  e5 8b		 sbc $8b
$18:9da4  a2 c0 cf	  ldx #$cfc0
$18:9da7  07 68		 ora [$68]
$18:9da9  a2 a6 53	  ldx #$53a6
$18:9dac  4e a0 de	  lsr $dea0
$18:9daf  1a			inc a
$18:9db0  81 c0		 sta ($c0,x)
$18:9db2  20 b1 44	  jsr $44b1
$18:9db5  f8			sed
$18:9db6  26 53		 rol $53
$18:9db8  be a0 55	  ldx $55a0,y
$18:9dbb  78			sei
$18:9dbc  34 f1		 bit $f1,x
$18:9dbe  7e 0d 36	  ror $360d,x
$18:9dc1  1d 92 a8	  ora $a892,x
$18:9dc4  a6 74		 ldx $74
$18:9dc6  d1 d8		 cmp ($d8),y
$18:9dc8  7f 95 47 73   adc $734795,x
$18:9dcc  a9 01		 lda #$01
$18:9dce  5a			phy
$18:9dcf  92 0e		 sta ($0e)
$18:9dd1  13 fa		 ora ($fa,s),y
$18:9dd3  46 a8		 lsr $a8
$18:9dd5  e7 f4		 sbc [$f4]
$18:9dd7  f9 d1 e0	  sbc $e0d1,y
$18:9dda  aa			tax
$18:9ddb  a3 e6		 lda $e6,s
$18:9ddd  52 04		 eor ($04)
$18:9ddf  6c 1b ca	  jmp ($ca1b)
$18:9de2  d5 31		 cmp $31,x
$18:9de4  d6 9f		 dec $9f,x
$18:9de6  b4 b0		 ldy $b0,x
$18:9de8  c6 c9		 dec $c9
$18:9dea  8a			txa
$18:9deb  eb			xba
$18:9dec  20 28 12	  jsr $1228
$18:9def  42 12		 wdm #$12
$18:9df1  44 53 f9	  mvp $f9,$53
$18:9df4  34 c0		 bit $c0,x
$18:9df6  b6 0f		 ldx $0f,y
$18:9df8  d4 28		 pei ($28)
$18:9dfa  94 11		 sty $11,x
$18:9dfc  fc a7 f4	  jsr ($f4a7,x)
$18:9dff  ab			plb
$18:9e00  d2 e1		 cmp ($e1)
$18:9e02  ea			nop
$18:9e03  a3 bf		 lda $bf,s
$18:9e05  52 85		 eor ($85)
$18:9e07  69 a5		 adc #$a5
$18:9e09  a4 8a		 ldy $8a
$18:9e0b  d0 92		 bne $9d9f
$18:9e0d  00 50		 brk #$50
$18:9e0f  32 a1		 and ($a1)
$18:9e11  6c 0f e8	  jmp ($e80f)
$18:9e14  49 03		 eor #$03
$18:9e16  fa			plx
$18:9e17  27 41		 and [$41]
$18:9e19  1f 88 d0 15   ora $15d088,x
$18:9e1d  a0 0c 8c	  ldy #$8c0c
$18:9e20  a9 21		 lda #$21
$18:9e22  a7 19		 lda [$19]
$18:9e24  52 88		 eor ($88)
$18:9e26  e2 5b		 sep #$5b
$18:9e28  ab			plb
$18:9e29  89 73		 bit #$73
$18:9e2b  f4 e0 78	  pea $78e0
$18:9e2e  12 d3		 ora ($d3)
$18:9e30  93 4e		 sta ($4e,s),y
$18:9e32  25 a7		 and $a7
$18:9e34  e8			inx
$18:9e35  08			php
$18:9e36  b1 da		 lda ($da),y
$18:9e38  79 2d 28	  adc $282d,y
$18:9e3b  14 f3		 trb $f3
$18:9e3d  08			php
$18:9e3e  1c 41 ea	  trb $ea41
$18:9e41  81 f4		 sta ($f4,x)
$18:9e43  78			sei
$18:9e44  80 7d		 bra $9ec3
$18:9e46  1d 20 1f	  ora $1f20,x
$18:9e49  47 08		 eor [$08]
$18:9e4b  07 5b		 ora [$5b]
$18:9e4d  57 52		 eor [$52],y
$18:9e4f  3a			dec a
$18:9e50  a7 e2		 lda [$e2]
$18:9e52  7a			ply
$18:9e53  41 4f		 eor ($4f,x)
$18:9e55  89 23		 bit #$23
$18:9e57  65 35		 adc $35
$18:9e59  32 ce		 and ($ce)
$18:9e5b  5b			tcd
$18:9e5c  cd 1b 99	  cmp $991b
$18:9e5f  34 6f		 bit $6f,x
$18:9e61  ec d1 b4	  cpx $b4d1
$18:9e64  fa			plx
$18:9e65  a1 65		 lda ($65,x)
$18:9e67  9b			txy
$18:9e68  21 01		 and ($01,x)
$18:9e6a  10 1c		 bpl $9e88
$18:9e6c  7e a4 41	  ror $41a4,x
$18:9e6f  4e 5d 44	  lsr $445d
$18:9e72  82 95 b6	  brl $550a
$18:9e75  11 ac		 ora ($ac),y
$18:9e77  c2 e3		 rep #$e3
$18:9e79  4f 20 91 04   eor $049120
$18:9e7d  3f ad 23 82   and $8223ad,x
$18:9e81  40			rti
$18:9e82  2f 75 05 8f   and $8f0575
$18:9e86  b0 bd		 bcs $9e45
$18:9e88  a6 8d		 ldx $8d
$18:9e8a  12 1f		 ora ($1f)
$18:9e8c  93 64		 sta ($64,s),y
$18:9e8e  bf df f8 1b   lda $1bf8df,x
$18:9e92  60			rts
$18:9e93  ff a1 81 70   sbc $7081a1,x
$18:9e97  81 04		 sta ($04,x)
$18:9e99  3f 7f f6 f9   and $f9f67f,x
$18:9e9d  07 48		 ora [$48]
$18:9e9f  52 81		 eor ($81)
$18:9ea1  70 82		 bvs $9e25
$18:9ea3  c0 38		 cpy #$38
$18:9ea5  22 41 07 84   jsl $840741
$18:9ea9  1a			inc a
$18:9eaa  01 b0		 ora ($b0,x)
$18:9eac  6d 19 04	  adc $0419
$18:9eaf  24 e2		 bit $e2
$18:9eb1  41 23		 eor ($23,x)
$18:9eb3  90 ec		 bcc $9ea1
$18:9eb5  01 e4		 ora ($e4,x)
$18:9eb7  47 22		 eor [$22]
$18:9eb9  1f b8 86 0e   ora $0e86b8,x
$18:9ebd  16 17		 asl $17,x
$18:9ebf  a8			tay
$18:9ec0  45 6a		 eor $6a
$18:9ec2  26 f4		 rol $f4
$18:9ec4  0b			phd
$18:9ec5  84 e0		 sty $e0
$18:9ec7  f0 2f		 beq $9ef8
$18:9ec9  62 72 84	  per $233e
$18:9ecc  36 8a		 rol $8a,x
$18:9ece  19 07 b1	  ora $b107,y
$18:9ed1  22 c1 0b e9   jsl $e90bc1
$18:9ed5  65 38		 adc $38
$18:9ed7  82 3e 01	  brl $a018
$18:9eda  e0 9b		 cpx #$9b
$18:9edc  c5 cf		 cmp $cf
$18:9ede  b2 85		 lda ($85)
$18:9ee0  5a			phy
$18:9ee1  c8			iny
$18:9ee2  32 84		 and ($84)
$18:9ee4  3a			dec a
$18:9ee5  05 3c		 ora $3c
$18:9ee7  11 08		 ora ($08),y
$18:9ee9  04 81		 tsb $81
$18:9eeb  50 29		 bvc $9f16
$18:9eed  e3 f3		 sbc $f3,s
$18:9eef  c1 1d		 cmp ($1d,x)
$18:9ef1  21 18		 and ($18,x)
$18:9ef3  80 4f		 bra $9f44
$18:9ef5  d3 40		 cmp ($40,s),y
$18:9ef7  ee 38 d2	  inc $d238
$18:9efa  78			sei
$18:9efb  22 90 48 94   jsl $944890
$18:9eff  ca			dex
$18:9f00  ea			nop
$18:9f01  29 00 58	  and #$5800
$18:9f04  46 a5		 lsr $a5
$18:9f06  58			cli
$18:9f07  51 48		 eor ($48),y
$18:9f09  41 62		 eor ($62,x)
$18:9f0b  61 41		 adc ($41,x)
$18:9f0d  a2 3a		 ldx #$3a
$18:9f0f  01 de		 ora ($de,x)
$18:9f11  14 49		 trb $49
$18:9f13  c0 f4		 cpy #$f4
$18:9f15  22 0e 90 11   jsl $11900e
$18:9f19  85 08		 sta $08
$18:9f1b  3e 30 89	  rol $8930,x
$18:9f1e  e5 20		 sbc $20
$18:9f20  4a			lsr a
$18:9f21  43 01		 eor $01,s
$18:9f23  16 14		 asl $14,x
$18:9f25  a2 39		 ldx #$39
$18:9f27  88			dey
$18:9f28  12 90		 ora ($90)
$18:9f2a  f8			sed
$18:9f2b  45 85		 eor $85
$18:9f2d  30 8a		 bmi $9eb9
$18:9f2f  66 04		 ror $04
$18:9f31  a4 4c		 ldy $4c
$18:9f33  11 61		 ora ($61),y
$18:9f35  4e 21 9a	  lsr $9a21
$18:9f38  81 29		 sta ($29,x)
$18:9f3a  16 84		 asl $84,x
$18:9f3c  58			cli
$18:9f3d  53 c8		 eor ($c8,s),y
$18:9f3f  44 ac ba	  mvp $ba,$ac
$18:9f42  46 81		 lsr $81
$18:9f44  16 10		 asl $10,x
$18:9f46  78			sei
$18:9f47  25 78		 and $78
$18:9f49  21 30		 and ($30,x)
$18:9f4b  9d 87 84	  sta $8487,x
$18:9f4e  18			clc
$18:9f4f  10 68		 bpl $9fb9
$18:9f51  87 82		 sta [$82]
$18:9f53  19 0c 8d	  ora $8d0c,y
$18:9f56  ca			dex
$18:9f57  61 81		 adc ($81,x)
$18:9f59  00 44		 brk #$44
$18:9f5b  84 4e		 sty $4e
$18:9f5d  63 32		 adc $32,s
$18:9f5f  82 2a 42	  brl $e18c
$18:9f62  21 10		 and ($10,x)
$18:9f64  96 55		 stx $55,y
$18:9f66  e0 50		 cpx #$50
$18:9f68  17 78		 ora [$78],y
$18:9f6a  26 44		 rol $44
$18:9f6c  58			cli
$18:9f6d  0f d0 90 49   ora $4990d0
$18:9f71  2e e5 d0	  rol $d0e5
$18:9f74  7f 02 9c 45   adc $459c02,x
$18:9f78  84 a7		 sty $a7
$18:9f7a  0b			phd
$18:9f7b  c1 74		 cmp ($74,x)
$18:9f7d  96 a3		 stx $a3,y
$18:9f7f  42 7e		 wdm #$7e
$18:9f81  6a			ror a
$18:9f82  40			rti
$18:9f83  ae 88 e2	  ldx $e288
$18:9f86  45 86		 eor $86
$18:9f88  10 20		 bpl $9faa
$18:9f8a  49 20 07	  eor #$0720
$18:9f8d  88			dey
$18:9f8e  64 1b		 stz $1b
$18:9f90  e2 1e		 sep #$1e
$18:9f92  00 90		 brk #$90
$18:9f94  22 c0 2c 6e   jsl $6e2cc0
$18:9f98  d1 0f		 cmp ($0f),y
$18:9f9a  78			sei
$18:9f9b  be 92 c3	  ldx $c392,y
$18:9f9e  18			clc
$18:9f9f  92 59		 sta ($59)
$18:9fa1  d3 84		 cmp ($84,s),y
$18:9fa3  17 15		 ora [$15],y
$18:9fa5  19 44 26	  ora $2644,y
$18:9fa8  89 b0 60	  bit #$60b0
$18:9fab  88			dey
$18:9fac  94 56		 sty $56,x
$18:9fae  24 25		 bit $25
$18:9fb0  0a			asl a
$18:9fb1  c1 74		 cmp ($74,x)
$18:9fb3  86 62		 stx $62
$18:9fb5  b1 29		 lda ($29),y
$18:9fb7  44 73 10	  mvp $10,$73
$18:9fba  5d 22 08	  eor $0822,x
$18:9fbd  ac 4a 61	  ldy $614a
$18:9fc0  14 cc		 trb $cc
$18:9fc2  11 08		 ora ($08),y
$18:9fc4  9e 2b 12	  stz $122b,x
$18:9fc7  9c 43 35	  stz $3543
$18:9fca  04 42		 tsb $42
$18:9fcc  2e 8a c4	  rol $c48a
$18:9fcf  a7 90		 lda [$90]
$18:9fd1  89 59 10	  bit #$1059
$18:9fd4  8d 62 b1	  sta $b162
$18:9fd7  27 b8		 and [$b8]
$18:9fd9  4a			lsr a
$18:9fda  f0 4f		 beq $a02b
$18:9fdc  f1 3c		 sbc ($3c),y
$18:9fde  8f 09 81 51   sta $518109
$18:9fe2  46 68		 lsr $68
$18:9fe4  3e 4d 9a	  rol $9a4d,x
$18:9fe7  00 03		 brk #$03
$18:9fe9  a0 01		 ldy #$01
$18:9feb  91 30		 sta ($30),y
$18:9fed  40			rti
$18:9fee  91 a0		 sta ($a0),y
$18:9ff0  05 12		 ora $12
$18:9ff2  00 1b		 brk #$1b
$18:9ff4  44 f8 08	  mvp $08,$f8
$18:9ff7  cc 44 22	  cpy $2244
$18:9ffa  b2 4f		 lda ($4f)
$18:9ffc  90 e8		 bcc $9fe6
$18:9ffe  53 04		 eor ($04,s),y
$18:a000  3a			dec a
$18:a001  14 f9		 trb $f9
$18:a003  12 05		 ora ($05)
$18:a005  30 44		 bmi $a04b
$18:a007  81 4f		 sta ($4f,x)
$18:a009  91 58		 sta ($58),y
$18:a00b  53 04		 eor ($04,s),y
$18:a00d  56 14		 lsr $14,x
$18:a00f  f9 17 45	  sbc $4517,y
$18:a012  30 45		 bmi $a059
$18:a014  d1 4f		 cmp ($4f),y
$18:a016  91 af		 sta ($af),y
$18:a018  cf 9e 8d 14   cmp $148d9e
$18:a01c  30 40		 bmi $a05e
$18:a01e  21 30		 and ($30,x)
$18:a020  f0 29		 beq $a04b
$18:a022  c3 e1		 cmp $e1,s
$18:a024  20 c3 16	  jsr $16c3
$18:a027  80 4c		 bra $a075
$18:a029  c6 80		 dec $80
$18:a02b  80 24		 bra $a051
$18:a02d  91 ce		 sta ($ce),y
$18:a02f  52 24		 eor ($24)
$18:a031  a3 0a		 lda $0a,s
$18:a033  4a			lsr a
$18:a034  44 9a 81	  mvp $81,$9a
$18:a037  59 48 94	  eor $9448,y
$18:a03a  62 59 69	  per $0996
$18:a03d  48			pha
$18:a03e  94 82		 sty $82,x
$18:a040  49 79 48	  eor #$4879
$18:a043  93 88		 sta ($88,s),y
$18:a045  31 29		 and ($29),y
$18:a047  12 78		 ora ($78)
$18:a049  06 65		 asl $65
$18:a04b  22 4f 70 d4   jsl $d4704f
$18:a04f  a4 41		 ldy $41
$18:a051  7a			ply
$18:a052  55 63		 eor $63,x
$18:a054  f9 18 02	  sbc $0218,y
$18:a057  cc a6 22	  cpy $22a6
$18:a05a  58			cli
$18:a05b  ae c1 50	  ldx $50c1
$18:a05e  54 94 a1	  mvn $a1,$94
$18:a061  16 45		 asl $45,x
$18:a063  28			plp
$18:a064  46 01		 lsr $01
$18:a066  4a			lsr a
$18:a067  11 9c		 ora ($9c),y
$18:a069  52 84		 eor ($84)
$18:a06b  6e 14 a1	  ror $a114
$18:a06e  1d 45 28	  ora $2845,x
$18:a071  47 c1		 eor [$c1]
$18:a073  6b			rtl
$18:a074  80 a8		 bra $a01e
$18:a076  10 62		 bpl $a0da
$18:a078  c5 24		 cmp $24
$18:a07a  50 b9		 bvc $a035
$18:a07c  40			rti
$18:a07d  4a			lsr a
$18:a07e  22 26 8a 1f   jsl $1f8a26
$18:a082  c2 05		 rep #$05
$18:a084  06 02		 asl $02
$18:a086  9c 1a 04	  stz $041a
$18:a089  36 37		 rol $37,x
$18:a08b  18			clc
$18:a08c  04 cd		 tsb $cd
$18:a08e  d4 04		 pei ($04)
$18:a090  43 27		 eor $27,s
$18:a092  81 2c		 sta ($2c,x)
$18:a094  27 47		 and [$47]
$18:a096  f1 4b		 sbc ($4b),y
$18:a098  8d 28 08	  sta $0828
$18:a09b  49 f0 ad	  eor #$adf0
$18:a09e  01 09		 ora ($09,x)
$18:a0a0  4c 16 a0	  jmp $a016
$18:a0a3  21 19		 and ($19,x)
$18:a0a5  c2 f4		 rep #$f4
$18:a0a7  04 23		 tsb $23
$18:a0a9  70 62		 bvs $a10d
$18:a0ab  80 84		 bra $a031
$18:a0ad  75 0c		 adc $0c,x
$18:a0af  d0 10		 bne $a0c1
$18:a0b1  8f 81 aa 7f   sta $7faa81
$18:a0b5  10 04		 bpl $a0bb
$18:a0b7  5a			phy
$18:a0b8  60			rts
$18:a0b9  90 00		 bcc $a0bb
$18:a0bb  40			rti
$18:a0bc  8f 08 1e 23   sta $231e08
$18:a0c0  c2 0b		 rep #$0b
$18:a0c2  08			php
$18:a0c3  f0 83		 beq $a048
$18:a0c5  a2 3c 21	  ldx #$213c
$18:a0c8  20 8f 08	  jsr $088f
$18:a0cb  56 23		 lsr $23,x
$18:a0cd  c2 19		 rep #$19
$18:a0cf  0b			phd
$18:a0d0  4d 61 8d	  eor $8d61
$18:a0d3  b8			clv
$18:a0d4  9e c1 9c	  stz $9cc1,x
$18:a0d7  e6 7f		 inc $7f
$18:a0d9  17 79		 ora [$79],y
$18:a0db  50 de		 bvc $a0bb
$18:a0dd  88			dey
$18:a0de  8d 17 e9	  sta $e917
$18:a0e1  d0 e7		 bne $a0ca
$18:a0e3  60			rts
$18:a0e4  43 9d		 eor $9d,s
$18:a0e6  d2 c1		 cmp ($c1)
$18:a0e8  67 33		 adc [$33]
$18:a0ea  ad 84 8e	  lda $8e84
$18:a0ed  57 6b		 eor [$6b],y
$18:a0ef  0c 9c 8e	  tsb $8e9c
$18:a0f2  f6 20		 inc $20,x
$18:a0f4  38			sec
$18:a0f5  de 2c 4e	  dec $4e2c,x
$18:a0f8  71 36		 adc ($36),y
$18:a0fa  01 ce		 ora ($ce,x)
$18:a0fc  21 79		 and ($79,x)
$18:a0fe  b1 a9		 lda ($a9),y
$18:a100  a7 00		 lda [$00]
$18:a102  78			sei
$18:a103  6a			ror a
$18:a104  30 21		 bmi $a127
$18:a106  9a			txs
$18:a107  a8			tay
$18:a108  09 47 2b	  ora #$2b47
$18:a10b  b5 94		 lda $94,x
$18:a10d  4d 70 05	  eor $0570
$18:a110  83 5f		 sta $5f,s
$18:a112  81 7c		 sta ($7c,x)
$18:a114  d8			cld
$18:a115  c0 66 36	  cpy #$3666
$18:a118  68			pla
$18:a119  50 20		 bvc $a13b
$18:a11b  f0 08		 beq $a125
$18:a11d  bc 02 75	  ldy $7502,x
$18:a120  00 fa		 brk #$fa
$18:a122  7f ce c5 16   adc $16c5ce,x
$18:a126  17 04		 ora [$04],y
$18:a128  1e 1f 00	  asl $001f,x
$18:a12b  93 27		 sta ($27,s),y
$18:a12d  44 2e 10	  mvp $10,$2e
$18:a130  69 02 90	  adc #$9002
$18:a133  42 e1		 wdm #$e1
$18:a135  0d 8c aa	  ora $aa8c
$18:a138  c4 2e		 cpy $2e
$18:a13a  11 28		 ora ($28),y
$18:a13c  a2 c8 42	  ldx #$42c8
$18:a13f  e1 17		 sbc ($17,x)
$18:a141  87 ae		 sta [$ae]
$18:a143  46 1e		 lsr $1e
$18:a145  08			php
$18:a146  00 d0		 brk #$d0
$18:a148  1b			tcs
$18:a149  40			rti
$18:a14a  74 02		 stz $02,x
$18:a14c  01 1f		 ora ($1f,x)
$18:a14e  90 9c		 bcc $a0ec
$18:a150  47 e4		 eor [$e4]
$18:a152  2e 11 f9	  rol $f911
$18:a155  46 21		 lsr $21
$18:a157  cf 11 0b 84   cmp $840b11
$18:a15b  9a			txs
$18:a15c  01 3b		 ora ($3b,x)
$18:a15e  c0 0e 44	  cpy #$440e
$18:a161  be 3c 00	  ldx $003c,y
$18:a164  b0 c7		 bcs $a12d
$18:a166  a1 14		 lda ($14,x)
$18:a168  b3 11		 lda ($11,s),y
$18:a16a  1b			tcs
$18:a16b  44 d2 50	  mvp $50,$d2
$18:a16e  78			sei
$18:a16f  fc dd 90	  jsr ($90dd,x)
$18:a172  31 68		 and ($68),y
$18:a174  74 62		 stz $62,x
$18:a176  8c 7e 28	  sty $287e
$18:a179  b4 42		 ldy $42,x
$18:a17b  8c 62 00	  sty $0062
$18:a17e  a0 22 44	  ldy #$4422
$18:a181  d2 01		 cmp ($01)
$18:a183  40			rti
$18:a184  41 09		 eor ($09,x)
$18:a186  6c a3 b0	  jmp ($b0a3)
$18:a189  99 b9 88	  sta $88b9,y
$18:a18c  93 c2		 sta ($c2,s),y
$18:a18e  69 08 84	  adc #$8408
$18:a191  18			clc
$18:a192  f6 34		 inc $34,x
$18:a194  07 30		 ora [$30]
$18:a196  c0 26 90	  cpy #$9026
$18:a199  0f 60 3c e1   ora $e13c60
$18:a19d  8c f1 08	  sty $08f1
$18:a1a0  04 60		 tsb $60
$18:a1a2  fa			plx
$18:a1a3  51 85		 eor ($85),y
$18:a1a5  f8			sed
$18:a1a6  51 98		 eor ($98),y
$18:a1a8  85 10		 sta $10
$18:a1aa  84 22		 sty $22
$18:a1ac  c5 64		 cmp $64
$18:a1ae  0c f1 34	  tsb $34f1
$18:a1b1  82 c8 19	  brl $bb7c
$18:a1b4  02 00		 cop #$00
$18:a1b6  18			clc
$18:a1b7  82 c8 14	  brl $b682
$18:a1ba  02 cf		 cop #$cf
$18:a1bc  07 20		 ora [$20]
$18:a1be  aa			tax
$18:a1bf  05 60		 ora $60
$18:a1c1  2a			rol a
$18:a1c2  e0 5f 0b	  cpx #$0b5f
$18:a1c5  20 28 eb	  jsr $eb28
$18:a1c8  d2 67		 cmp ($67)
$18:a1ca  85 1d		 sta $1d
$18:a1cc  ce 40 01	  dec $0140
$18:a1cf  77 13		 adc [$13],y
$18:a1d1  e4 68		 cpx $68
$18:a1d3  0b			phd
$18:a1d4  82 9d c0	  brl $6274
$18:a1d7  3e ab 73	  rol $73ab,x
$18:a1da  8a			txa
$18:a1db  0e 01 c6	  asl $c601
$18:a1de  32 8b		 and ($8b)
$18:a1e0  fb			xce
$18:a1e1  30 84		 bmi $a167
$18:a1e3  62 e0 15	  per $b7c6
$18:a1e6  d0 4a		 bne $a232
$18:a1e8  2f cf c0 90   and $90c0cf
$18:a1ec  3c 40 64	  bit $6440,x
$18:a1ef  05 b0		 ora $b0
$18:a1f1  11 80		 ora ($80),y
$18:a1f3  bc 31 a3	  ldy $a331,x
$18:a1f6  c1 17		 cmp ($17,x)
$18:a1f8  0e 34 76	  asl $7634
$18:a1fb  4e 30 ce	  lsr $ce30
$18:a1fe  90 88		 bcc $a188
$18:a200  9a			txs
$18:a201  23 b2		 and $b2,s
$18:a203  67 06		 adc [$06]
$18:a205  74 e0		 stz $e0,x
$18:a207  04 40		 tsb $40
$18:a209  2d 89 dc	  and $dc89
$18:a20c  04 60		 tsb $60
$18:a20e  36 0c		 rol $0c,x
$18:a210  6e 18 86	  ror $8618
$18:a213  26 91		 rol $91
$18:a215  32 80		 and ($80)
$18:a217  bc 08 81	  ldy $8108,x
$18:a21a  7e 50 80	  ror $8050,x
$18:a21d  d8			cld
$18:a21e  0e e2 a8	  asl $a8e2
$18:a221  18			clc
$18:a222  c1 10		 cmp ($10,x)
$18:a224  2f ed 21 88   and $8821ed
$18:a228  21 44		 and ($44,x)
$18:a22a  e6 42		 inc $42
$18:a22c  f0 c7		 beq $a1f5
$18:a22e  3f 06 40 36   and $364006,x
$18:a232  0c 71 e8	  tsb $e871
$18:a235  92 62		 sta ($62)
$18:a237  2d 04 90	  and $9004
$18:a23a  a6 c0		 ldx $c0
$18:a23c  ca			dex
$18:a23d  2c 00 57	  bit $5700
$18:a240  02 b1		 cop #$b1
$18:a242  20 8c b1	  jsr $b18c
$18:a245  78			sei
$18:a246  84 23		 sty $23
$18:a248  e6 ba		 inc $ba
$18:a24a  25 e8		 and $e8
$18:a24c  95 c5		 sta $c5,x
$18:a24e  40			rti
$18:a24f  10 0f		 bpl $a260
$18:a251  9b			txy
$18:a252  9c 17 82	  stz $8217
$18:a255  cc 05 5f	  cpy $5f05
$18:a258  b4 07		 ldy $07,x
$18:a25a  e4 c0		 cpx $c0
$18:a25c  4f 90 b4 57   eor $57b490
$18:a260  63 f2		 adc $f2,s
$18:a262  32 8b		 and ($8b)
$18:a264  28			plp
$18:a265  7e 4c e0	  ror $e04c,x
$18:a268  6b			rtl
$18:a269  fc 23 e2	  jsr ($e223,x)
$18:a26c  b9 26 80	  lda $8026,y
$18:a26f  7c 59 c9	  jmp ($c959,x)
$18:a272  f1 39		 sbc ($39),y
$18:a274  8b			phb
$18:a275  20 7e 25	  jsr $257e
$18:a278  71 01		 adc ($01),y
$18:a27a  7f c0 28 9f   adc $9f28c0,x
$18:a27e  06 72		 asl $72
$18:a280  7c 04 49	  jmp ($4904,x)
$18:a283  f0 14		 beq $a299
$18:a285  fb			xce
$18:a286  40			rti
$18:a287  7e ec 04	  ror $04ec,x
$18:a28a  fb			xce
$18:a28b  bc 53 ee	  ldy $ee53,x
$18:a28e  f8			sed
$18:a28f  4f bb ff da   eor $daffbb
$18:a293  03 f6		 ora $f6,s
$18:a295  60			rts
$18:a296  27 d9		 and [$d9]
$18:a298  e2 9f		 sep #$9f
$18:a29a  67 c2		 adc [$c2]
$18:a29c  7d 8f be	  adc $be8f,x
$18:a29f  d0 1f		 bne $a2c0
$18:a2a1  ab			plb
$18:a2a2  a9 3e a5	  lda #$a53e
$18:a2a5  31 3c		 and ($3c),y
$18:a2a7  8f d4 36 9f   sta $9f36d4
$18:a2ab  53 b0		 eor ($b0,s),y
$18:a2ad  aa			tax
$18:a2ae  bf e8 68 4f   lda $4f68e8,x
$18:a2b2  a3 0d		 lda $0d,s
$18:a2b4  3e 81 b4	  rol $b481,x
$18:a2b7  fa			plx
$18:a2b8  70 20		 bvs $a2da
$18:a2ba  70 08		 bvs $a2c4
$18:a2bc  a4 02		 ldy $02
$18:a2be  53 00		 eor ($00,s),y
$18:a2c0  f3 ff		 sbc ($ff,s),y
$18:a2c2  c6 41		 dec $41
$18:a2c4  30 80		 bmi $a246
$18:a2c6  40			rti
$18:a2c7  a0 10		 ldy #$10
$18:a2c9  18			clc
$18:a2ca  38			sec
$18:a2cb  bc 6e 90	  ldy $906e,x
$18:a2ce  48			pha
$18:a2cf  0c 00 16	  tsb $1600
$18:a2d2  37 4a		 and [$4a],y
$18:a2d4  27 f3		 and [$f3]
$18:a2d6  ff 0c 80 06   sbc $06800c,x
$18:a2da  80 30		 bra $a30c
$18:a2dc  03 22		 ora $22,s
$18:a2de  08			php
$18:a2df  80 94		 bra $a275
$18:a2e1  ec 50 40	  cpx $4050
$18:a2e4  c7 98		 cmp [$98]
$18:a2e6  82 c6 2c	  brl $cfaf
$18:a2e9  f4 58 d4	  pea $d458
$18:a2ec  d1 42		 cmp ($42),y
$18:a2ee  20 24 70	  jsr $7024
$18:a2f1  08			php
$18:a2f2  09 f8 02	  ora #$02f8
$18:a2f5  42 84		 wdm #$84
$18:a2f7  71 11		 adc ($11),y
$18:a2f9  40			rti
$18:a2fa  5d 28 72	  eor $7228,x
$18:a2fd  28			plp
$18:a2fe  61 02		 adc ($02,x)
$18:a300  00 da		 brk #$da
$18:a302  95 ac		 sta $ac,x
$18:a304  10 2b		 bpl $a331
$18:a306  52 82		 eor ($82)
$18:a308  04 05		 tsb $05
$18:a30a  96 31		 stx $31,y
$18:a30c  43 cf		 eor $cf,s
$18:a30e  b8			clv
$18:a30f  06 04		 asl $04
$18:a311  8e 48 92	  stx $9248
$18:a314  57 dc		 eor [$dc],y
$18:a316  03 06		 ora $06,s
$18:a318  47 24		 eor [$24]
$18:a31a  59 63 e6	  eor $e663,y
$18:a31d  71 46		 adc ($46),y
$18:a31f  02 3c		 cop #$3c
$18:a321  e3 10		 sbc $10,s
$18:a323  48			pha
$18:a324  c4 02		 cpy $02
$18:a326  70 eb		 bvs $a313
$18:a328  12 e8		 ora ($e8)
$18:a32a  48			pha
$18:a32b  1e 23 27	  asl $2723,x
$18:a32e  04 84		 tsb $84
$18:a330  22 71 08 94   jsl $940871
$18:a334  4d 02 00	  eor $0002
$18:a337  fa			plx
$18:a338  07 d8		 ora [$d8]
$18:a33a  d1 18		 cmp ($18),y
$18:a33c  61 40		 adc ($40,x)
$18:a33e  8c 48 2a	  sty $2a48
$18:a341  85 60		 sta $60
$18:a343  a0 42		 ldy #$42
$18:a345  01 22		 ora ($22,x)
$18:a347  05 29		 ora $29
$18:a349  04 62		 tsb $62
$18:a34b  c8			iny
$18:a34c  0c 20 b8	  tsb $b820
$18:a34f  81 42		 sta ($42,x)
$18:a351  21 38		 and ($38,x)
$18:a353  0b			phd
$18:a354  85 94		 sta $94
$18:a356  ac 13 88	  ldy $8813
$18:a359  80 94		 bra $a2ef
$18:a35b  68			pla
$18:a35c  8f 83 8e 40   sta $408e83
$18:a360  9f e7 1c a1   sta $a11ce7,x
$18:a364  3e 04 56	  rol $5604,x
$18:a367  12 c1		 ora ($c1)
$18:a369  b1 10		 lda ($10),y
$18:a36b  46 84		 lsr $84
$18:a36d  67 0a		 adc [$0a]
$18:a36f  44 42 51	  mvp $51,$42
$18:a372  0b			phd
$18:a373  6d 05 21	  adc $2105
$18:a376  aa			tax
$18:a377  05 00		 ora $00
$18:a379  25 90		 and $90
$18:a37b  24 23		 bit $23
$18:a37d  65 22		 adc $22
$18:a37f  2e 89 2c	  rol $2c89
$18:a382  04 60		 tsb $60
$18:a384  eb			xba
$18:a385  08			php
$18:a386  6b			rtl
$18:a387  68			pla
$18:a388  05 40		 ora $40
$18:a38a  6b			rtl
$18:a38b  11 e8		 ora ($e8),y
$18:a38d  46 25		 lsr $25
$18:a38f  0f b0 8f 0d   ora $0d8fb0
$18:a393  82 51 18	  brl $bbe7
$18:a396  3c 89 d4	  bit $d489,x
$18:a399  a3 11		 lda $11,s
$18:a39b  89 f1 f0	  bit #$f0f1
$18:a39e  90 e2		 bcc $a382
$18:a3a0  4b			phk
$18:a3a1  09 24 90	  ora #$9024
$18:a3a4  12 15		 ora ($15)
$18:a3a6  26 e8		 rol $e8
$18:a3a8  47 e5		 eor [$e5]
$18:a3aa  21 70		 and ($70,x)
$18:a3ac  99 b7 42	  sta $42b7,y
$18:a3af  53 1f		 eor ($1f,s),y
$18:a3b1  4e 0d 00	  lsr $000d
$18:a3b4  44 70 f3	  mvp $f3,$70
$18:a3b7  71 2a		 adc ($2a),y
$18:a3b9  84 96		 sty $96
$18:a3bb  11 89		 ora ($89),y
$18:a3bd  84 a2		 sty $a2
$18:a3bf  21 8c		 and ($8c,x)
$18:a3c1  6d 04 c0	  adc $c004
$18:a3c4  ee 0b 90	  inc $900b
$18:a3c7  25 84		 and $84
$18:a3c9  82 50 b8	  brl $5c1c
$18:a3cc  0c e3 68	  tsb $68e3
$18:a3cf  25 0c		 and $0c
$18:a3d1  40			rti
$18:a3d2  63 82		 adc $82,s
$18:a3d4  d0 a6		 bne $a37c
$18:a3d6  10 8b		 bpl $a363
$18:a3d8  92 ec		 sta ($ec)
$18:a3da  9a			txs
$18:a3db  82 c2 26	  brl $caa0
$18:a3de  a0 5c		 ldy #$5c
$18:a3e0  d9 24 e2	  cmp $e224,y
$18:a3e3  16 11		 asl $11,x
$18:a3e5  1a			inc a
$18:a3e6  83 3e		 sta $3e,s
$18:a3e8  c9 27 80	  cmp #$8027
$18:a3eb  ad 08 d4	  lda $d408
$18:a3ee  19 e5 d9	  ora $d9e5,y
$18:a3f1  3f 86 85 18   and $188586,x
$18:a3f5  14 80		 trb $80
$18:a3f7  28			plp
$18:a3f8  4b			phk
$18:a3f9  41 20		 eor ($20,x)
$18:a3fb  08			php
$18:a3fc  0c 76 00	  tsb $0076
$18:a3ff  30 29		 bmi $a42a
$18:a401  04 d2		 tsb $d2
$18:a403  08			php
$18:a404  37 20		 and [$20],y
$18:a406  d8			cld
$18:a407  51 20		 eor ($20),y
$18:a409  10 8a		 bpl $a395
$18:a40b  02 1c		 cop #$1c
$18:a40d  2a			rol a
$18:a40e  90 48		 bcc $a458
$18:a410  05 02		 ora $02
$18:a412  10 28		 bpl $a43c
$18:a414  11 21		 ora ($21),y
$18:a416  48			pha
$18:a417  22 16 41 59   jsl $594116
$18:a41b  0d 84 48	  ora $4884
$18:a41e  11 05		 ora ($05),y
$18:a420  48			pha
$18:a421  44 2c a2	  mvp $a2,$2c
$18:a424  b0 57		 bcs $a47d
$18:a426  89 14 28	  bit #$2814
$18:a429  81 73		 sta ($73,x)
$18:a42b  8e 22 80	  stx $8022
$18:a42e  3e 51 c4	  rol $c451,x
$18:a431  18			clc
$18:a432  06 02		 asl $02
$18:a434  21 18		 and ($18,x)
$18:a436  96 15		 stx $15,y
$18:a438  48			pha
$18:a439  c0 29		 cpy #$29
$18:a43b  10 80		 bpl $a3bd
$18:a43d  52 09		 eor ($09)
$18:a43f  41 0b		 eor ($0b,x)
$18:a441  56 85		 lsr $85,x
$18:a443  21 4e		 and ($4e,x)
$18:a445  06 f0		 asl $f0
$18:a447  35 10		 and $10,x
$18:a449  bc 23 67	  ldy $6723,x
$18:a44c  12 3e		 ora ($3e)
$18:a44e  0b			phd
$18:a44f  b0 08		 bcs $a459
$18:a451  40			rti
$18:a452  d8			cld
$18:a453  08			php
$18:a454  6a			ror a
$18:a455  b4 91		 ldy $91,x
$18:a457  42 5c		 wdm #$5c
$18:a459  05 f0		 ora $f0
$18:a45b  08			php
$18:a45c  42 3c		 wdm #$3c
$18:a45e  55 09		 eor $09,x
$18:a460  44 61 30	  mvp $30,$61
$18:a463  29 42 94	  and #$9442
$18:a466  40			rti
$18:a467  2b			pld
$18:a468  c9 b2 53	  cmp #$53b2
$18:a46b  0a			asl a
$18:a46c  18			clc
$18:a46d  89 61 0f	  bit #$0f61
$18:a470  46 92		 lsr $92
$18:a472  d0 52		 bne $a4c6
$18:a474  85 18		 sta $18
$18:a476  88			dey
$18:a477  4f 93 64 c2   eor $c26493
$18:a47b  17 60		 ora [$60],y
$18:a47d  49 24 82	  eor #$8224
$18:a480  f0 ca		 beq $a44c
$18:a482  03 c2		 ora $c2,s
$18:a484  3f 29 25 84   and $842529,x
$18:a488  cc 1e 12	  cpy $121e
$18:a48b  98			tya
$18:a48c  fb			xce
$18:a48d  5c 44 e0 0a   jml $0ae044
$18:a491  f0 df		 beq $a472
$18:a493  8b			phb
$18:a494  3c 7b e4	  bit $e47b,x
$18:a497  ef 2f f9 c3   sbc $c3f92f
$18:a49b  d0 3e		 bne $a4db
$18:a49d  92 f5		 sta ($f5)
$18:a49f  1f ad 3d 8a   ora $8a3dad,x
$18:a4a3  ed 50 90	  sbc $9050
$18:a4a6  c3 db		 cmp $db,s
$18:a4a8  26 a9		 rol $a9
$18:a4aa  1a			inc a
$18:a4ab  03 34		 ora $34,s
$18:a4ad  f2 a5		 sbc ($a5)
$18:a4af  b0 71		 bcs $a522
$18:a4b1  fb			xce
$18:a4b2  d3 c0		 cmp ($c0,s),y
$18:a4b4  be 16 f1	  ldx $f116,y
$18:a4b7  3f 8e 3c 93   and $933c8e,x
$18:a4bb  e5 af		 sbc $af
$18:a4bd  35 f9		 and $f9,x
$18:a4bf  f3 d1		 sbc ($d1,s),y
$18:a4c1  be 9e 99	  ldx $999e,y
$18:a4c4  14 39		 trb $39
$18:a4c6  56 68		 lsr $68,x
$18:a4c8  21 59		 and ($59,x)
$18:a4ca  a6 91		 ldx $91
$18:a4cc  75 ec		 adc $ec,x
$18:a4ce  bf 6e 7b b7   lda $b77b6e,x
$18:a4d2  df de 0f f1   cmp $f10fde,x
$18:a4d6  07 8c		 ora [$8c]
$18:a4d8  7c 85 e5	  jmp ($e585,x)
$18:a4db  3f 32 79 d6   and $d67932,x
$18:a4df  e3 f1		 sbc $f1,s
$18:a4e1  14 21		 trb $21
$18:a4e3  96 c5		 stx $c5,y
$18:a4e5  18			clc
$18:a4e6  9b			txy
$18:a4e7  44 9f a9	  mvp $a9,$9f
$18:a4ea  3d 6b ec	  and $ec6b,x
$18:a4ed  6f 6b fb a3   adc $a3fb6b
$18:a4f1  df 3e 0a f0   cmp $f00a3e,x
$18:a4f5  df 8b 3c 7b   cmp $7b3c8b,x
$18:a4f9  e4 ef		 cpx $ef
$18:a4fb  2f d6 94 d9   and $d994d6
$18:a4ff  72 33		 adc ($33)
$18:a501  d7 a2		 cmp [$a2],y
$18:a503  fd 39 ea	  sbc $ea39,x
$18:a506  df 5f 7b 3f   cmp $3f7b5f,x
$18:a50a  dc 1e f1	  jml [$f11e]
$18:a50d  f0 17		 beq $a526
$18:a50f  84 f8		 sty $f8
$18:a511  9a			txs
$18:a512  02 b1		 cop #$b1
$18:a514  b6 ab		 ldx $ab,y
$18:a516  82 51 20	  brl $c56a
$18:a519  7f 8b ec 91   adc $91ec8b,x
$18:a51d  01 5d		 ora ($5d,x)
$18:a51f  01 10		 ora ($10,x)
$18:a521  34 5d		 bit $5d,x
$18:a523  a1 18		 lda ($18,x)
$18:a525  98			tya
$18:a526  22 02 f8 ae   jsl $aef802
$18:a52a  09 84 60	  ora #$6084
$18:a52d  36 2e		 rol $2e,x
$18:a52f  d0 20		 bne $a551
$18:a531  24 02		 bit $02
$18:a533  53 1f		 eor ($1f,s),y
$18:a535  8f 44 a6 74   sta $74a644
$18:a539  00 c0		 brk #$c0
$18:a53b  9b			txy
$18:a53c  02 7c		 cop #$7c
$18:a53e  1e 21 b8	  asl $b821,x
$18:a541  d0 a0		 bne $a4e3
$18:a543  11 f9		 ora ($f9),y
$18:a545  48			pha
$18:a546  c0 57		 cpy #$57
$18:a548  e0 85		 cpx #$85
$18:a54a  02 50		 cop #$50
$18:a54c  ad 82 40	  lda $4082
$18:a54f  50 18		 bvc $a569
$18:a551  ec 01 18	  cpx $1801
$18:a554  73 48		 adc ($48,s),y
$18:a556  22 4c e6 94   jsl $94e64c
$18:a55a  48			pha
$18:a55b  04 22		 tsb $22
$18:a55d  80 3e		 bra $a59d
$18:a55f  0a			asl a
$18:a560  a2 10		 ldx #$10
$18:a562  28			plp
$18:a563  10 83		 bpl $a4e8
$18:a565  40			rti
$18:a566  99 09 10	  sta $1009,y
$18:a569  16 43		 asl $43,x
$18:a56b  59 1d 84	  eor $841d,y
$18:a56e  c8			iny
$18:a56f  0e f2 b2	  asl $b2f2
$18:a572  9a			txs
$18:a573  c2 70		 rep #$70
$18:a575  f7 1b		 sbc [$1b],y
$18:a577  2d 10 ae	  and $ae10
$18:a57a  71 c7		 adc ($c7),y
$18:a57c  30 17		 bmi $a595
$18:a57e  ca			dex
$18:a57f  39 42 2b	  and $2b42,y
$18:a582  8c 42 31	  sty $3142
$18:a585  2c 4a 92	  bit $924a
$18:a588  80 48		 bra $a5d2
$18:a58a  20 bd 07	  jsr $07bd
$18:a58d  b8			clv
$18:a58e  42 de		 wdm #$de
$18:a590  81 48		 sta ($48,x)
$18:a592  77 02		 adc [$02],y
$18:a594  bc 15 44	  ldy $4415,x
$18:a597  29 08 da	  and #$da08
$18:a59a  c4 97		 cpy $97
$18:a59c  82 41 07	  brl $ace0
$18:a59f  78			sei
$18:a5a0  07 c2		 ora [$c2]
$18:a5a2  1a			inc a
$18:a5a3  f4 26 50	  pea $5026
$18:a5a6  a7 01		 lda [$01]
$18:a5a8  d2 06		 cmp ($06)
$18:a5aa  10 8f		 bpl $a53b
$18:a5ac  25 42		 and $42
$18:a5ae  51 18		 eor ($18),y
$18:a5b0  6c 0b 50	  jmp ($500b)
$18:a5b3  a3 11		 lda $11,s
$18:a5b5  09 f3 6c	  ora #$6cf3
$18:a5b8  9c c2 d4	  stz $d4c2
$18:a5bb  29 44 02	  and #$0244
$18:a5be  bc db 27	  ldy $27db,x
$18:a5c1  a0 90 40	  ldy #$4090
$18:a5c4  4e 55 21	  lsr $2155
$18:a5c7  60			rts
$18:a5c8  10 c0		 bpl $a58a
$18:a5ca  ec 04 70	  cpx $7004
$18:a5cd  16 88		 asl $88,x
$18:a5cf  24 68		 bit $68
$18:a5d1  08			php
$18:a5d2  13 87		 ora ($87,s),y
$18:a5d4  b3 4a		 lda ($4a,s),y
$18:a5d6  41 10		 eor ($10,x)
$18:a5d8  87 d0		 sta [$d0]
$18:a5da  a3 01		 lda $01,s
$18:a5dc  b0 11		 bcs $a5ef
$18:a5de  88			dey
$18:a5df  9c 24 02	  stz $0224
$18:a5e2  93 80		 sta ($80,s),y
$18:a5e4  c2 0b		 rep #$0b
$18:a5e6  3e 6a f3	  rol $f36a,x
$18:a5e9  df 97 81 1d   cmp $1d8197,x
$18:a5ed  e9 ff 85	  sbc #$85ff
$18:a5f0  c0 90 a0	  cpy #$a090
$18:a5f3  5a			phy
$18:a5f4  04 40		 tsb $40
$18:a5f6  2e 3d 93	  rol $933d
$18:a5f9  f1 e3		 sbc ($e3),y
$18:a5fb  70 37		 bvs $a634
$18:a5fd  5d e9 52	  eor $52e9,x
$18:a600  07 58		 ora [$58]
$18:a602  d3 51		 cmp ($51,s),y
$18:a604  41 28		 eor ($28,x)
$18:a606  90 33		 bcc $a63b
$18:a608  45 92		 eor $92
$18:a60a  41 e0		 eor ($e0,x)
$18:a60c  be b4 09	  ldx $09b4,y
$18:a60f  b6 29		 ldx $29,y
$18:a611  f0 8c		 beq $a59f
$18:a613  4c 03 c1	  jmp $c103
$18:a616  7c 45 04	  jmp ($0445,x)
$18:a619  c2 30		 rep #$30
$18:a61b  e9 17 29	  sbc #$2917
$18:a61e  10 42		 bpl $a662
$18:a620  7c ec 27	  jmp ($27ec,x)
$18:a623  b8			clv
$18:a624  a7 c8		 lda [$c8]
$18:a626  3c 2a 62	  bit $622a,x
$18:a629  0f 10 9c 15   ora $159c10
$18:a62d  21 14		 and ($14,x)
$18:a62f  13 8a		 ora ($8a,s),y
$18:a631  a4 15		 ldy $15
$18:a633  21 03		 and ($03,x)
$18:a635  17 80		 ora [$80],y
$18:a637  54 60 9a	  mvn $9a,$60
$18:a63a  e2 20		 sep #$20
$18:a63c  0f 82 19 00   ora $001982
$18:a640  ff 14 82 11   sbc $118214,x
$18:a644  00 14		 brk #$14
$18:a646  09 2c		 ora #$2c
$18:a648  02 23		 cop #$23
$18:a64a  1b			tcs
$18:a64b  0a			asl a
$18:a64c  ac 14 4a	  ldy $4a14
$18:a64f  25 a0		 and $a0
$18:a651  81 fa		 sta ($fa,x)
$18:a653  45 65		 eor $65
$18:a655  13 80		 ora ($80,s),y
$18:a657  7f c4 84 4b   adc $4b84c4,x
$18:a65b  01 50		 ora ($50,x)
$18:a65d  89 80		 bit #$80
$18:a65f  88			dey
$18:a660  1e a8 20	  asl $20a8,x
$18:a663  78			sei
$18:a664  a1 7b		 lda ($7b,x)
$18:a666  81 20		 sta ($20,x)
$18:a668  aa			tax
$18:a669  42 40		 wdm #$40
$18:a66b  15 51		 ora $51,x
$18:a66d  20 89 82	  jsr $8289
$18:a670  31 00		 and ($00),y
$18:a672  fe 11 c8	  inc $c811,x
$18:a675  ea			nop
$18:a676  1f d2 e1 42   ora $42e1d2,x
$18:a67a  21 1b		 and ($1b,x)
$18:a67c  e2 e1		 sep #$e1
$18:a67e  c4 04		 cpy $04
$18:a680  64 a9		 stz $a9
$18:a682  06 30		 asl $30
$18:a684  1a			inc a
$18:a685  98			tya
$18:a686  3c 51 83	  bit $8351,x
$18:a689  10 07		 bpl $a692
$18:a68b  86 21		 stx $21
$18:a68d  08			php
$18:a68e  ec 09 08	  cpx $0809
$18:a691  d0 02		 bne $a695
$18:a693  a3 34		 lda $34,s
$18:a695  01 34		 ora ($34,x)
$18:a697  92 01		 sta ($01)
$18:a699  30 1c		 bmi $a6b7
$18:a69b  40			rti
$18:a69c  98			tya
$18:a69d  12 40		 ora ($40)
$18:a69f  77 34		 adc [$34],y
$18:a6a1  90 1f		 bcc $a6c2
$18:a6a3  8e 31 08	  stx $0831
$18:a6a6  2d 99 d0	  and $d099
$18:a6a9  39 45 c3	  and $c345,y
$18:a6ac  90 6e		 bcc $a71c
$18:a6ae  96 f6		 stx $f6,y
$18:a6b0  1c 33 40	  trb $4033
$18:a6b3  7b			tdc
$18:a6b4  14 47		 trb $47
$18:a6b6  10 e6		 bpl $a69e
$18:a6b8  38			sec
$18:a6b9  53 58		 eor ($58,s),y
$18:a6bb  e8			inx
$18:a6bc  f3 38		 sbc ($38,s),y
$18:a6be  fb			xce
$18:a6bf  9f a9 ce 70   sta $70cea9,x
$18:a6c3  a2 31 17	  ldx #$1731
$18:a6c6  9e cd af	  stz $afcd,x
$18:a6c9  43 69		 eor $69,s
$18:a6cb  39 0e 14	  and $140e,y
$18:a6ce  dc 23 4e	  jml [$4e23]
$18:a6d1  3e f4 11	  rol $11f4,x
$18:a6d4  89 41		 bit #$41
$18:a6d6  c7 85		 cmp [$85]
$18:a6d8  0f 85 f1 99   ora $99f185
$18:a6dc  84 71		 sty $71
$18:a6de  0e 3b 84	  asl $843b
$18:a6e1  e2 59		 sep #$59
$18:a6e3  25 49		 and $49
$18:a6e5  46 a0		 lsr $a0
$18:a6e7  12 a5		 ora ($a5)
$18:a6e9  49 44		 eor #$44
$18:a6eb  a1 1d		 lda ($1d,x)
$18:a6ed  26 61		 rol $61
$18:a6ef  21 86		 and ($86,x)
$18:a6f1  88			dey
$18:a6f2  cd 14 68	  cmp $6814
$18:a6f5  74 c5		 stz $c5,x
$18:a6f7  c7 3d		 cmp [$3d]
$18:a6f9  32 ac		 and ($ac)
$18:a6fb  24 78		 bit $78
$18:a6fd  53 84		 eor ($84,s),y
$18:a6ff  39 33 81	  and $8133,y
$18:a702  60			rts
$18:a703  29 70		 and #$70
$18:a705  66 84		 ror $84
$18:a707  c1 0a		 cmp ($0a,x)
$18:a709  04 32		 tsb $32
$18:a70b  5f 0a e8 a5   eor $a5e80a,x
$18:a70f  11 08		 ora ($08),y
$18:a711  51 0c		 eor ($0c),y
$18:a713  d9 a1 44	  cmp $44a1,y
$18:a716  25 94		 and $94
$18:a718  60			rts
$18:a719  e6 05		 inc $05
$18:a71b  22 94 69 8b   jsl $8b6994
$18:a71f  07 30		 ora [$30]
$18:a721  cb			wai
$18:a722  0b			phd
$18:a723  8e 48 65	  stx $6548
$18:a726  51 70		 eor ($70),y
$18:a728  91 00		 sta ($00),y
$18:a72a  c8			iny
$18:a72b  0b			phd
$18:a72c  23 7e		 and $7e,s
$18:a72e  8b			phb
$18:a72f  58			cli
$18:a730  a1 f0		 lda ($f0,x)
$18:a732  86 e1		 stx $e1
$18:a734  c0 22		 cpy #$22
$18:a736  f9 01 71	  sbc $7101,y
$18:a739  d0 8c		 bne $a6c7
$18:a73b  ab			plb
$18:a73c  0a			asl a
$18:a73d  1e 12 8c	  asl $8c12,x
$18:a740  16 46		 asl $46,x
$18:a742  27 15		 and [$15]
$18:a744  d1 4d		 cmp ($4d),y
$18:a746  57 e8		 eor [$e8],y
$18:a748  35 15		 and $15,x
$18:a74a  d1 4b		 cmp ($4b),y
$18:a74c  59 a8 43	  eor $43a8,y
$18:a74f  16 b1		 asl $b1,x
$18:a751  47 63		 eor [$63]
$18:a753  1c 26 e9	  trb $e926
$18:a756  43 65		 eor $65,s
$18:a758  1a			inc a
$18:a759  26 e9		 rol $e9
$18:a75b  41 66		 eor ($66,x)
$18:a75d  08			php
$18:a75e  11 81		 ora ($81),y
$18:a760  c1 54		 cmp ($54,x)
$18:a762  41 80		 eor ($80,x)
$18:a764  75 9c		 adc $9c,x
$18:a766  bd e2 a0	  lda $a0e2,x
$18:a769  20 6f 8c	  jsr $8c6f
$18:a76c  a9 62		 lda #$62
$18:a76e  87 b1		 sta [$b1]
$18:a770  5d 14 8e	  eor $8e14,x
$18:a773  0e c0 39	  asl $39c0
$18:a776  24 19		 bit $19
$18:a778  8e 71 c8	  stx $c871
$18:a77b  73 38		 adc ($38,s),y
$18:a77d  e3 b0		 sbc $b0,s
$18:a77f  d2 61		 cmp ($61)
$18:a781  c4 22		 cpy $22
$18:a783  5c 00 71 c8   jml $c87100
$18:a787  9d 49 47	  sta $4749,x
$18:a78a  0d d0 68	  ora $68d0
$18:a78d  0f a6 c1 11   ora $11c1a6
$18:a791  89 4e		 bit #$4e
$18:a793  86 c8		 stx $c8
$18:a795  cf 11 89 4c   cmp $4c8911
$18:a799  88			dey
$18:a79a  88			dey
$18:a79b  dd 15 09	  cmp $0915,x
$18:a79e  48			pha
$18:a79f  a3 0a		 lda $0a,s
$18:a7a1  73 89		 adc ($89,s),y
$18:a7a3  4a			lsr a
$18:a7a4  34 05		 bit $05,x
$18:a7a6  b2 85		 lda ($85)
$18:a7a8  4c 02 82	  jmp $8202
$18:a7ab  64 1a		 stz $1a
$18:a7ad  11 a1		 ora ($a1),y
$18:a7af  0d 80 04	  ora $0480
$18:a7b2  43 80		 eor $80,s
$18:a7b4  21 84		 and ($84,x)
$18:a7b6  58			cli
$18:a7b7  18			clc
$18:a7b8  24 d1		 bit $d1
$18:a7ba  26 c0		 rol $c0
$18:a7bc  2e 6d 40	  rol $406d
$18:a7bf  c1 80		 cmp ($80,x)
$18:a7c1  f8			sed
$18:a7c2  42 58		 wdm #$58
$18:a7c4  26 c9		 rol $c9
$18:a7c6  07 05		 ora [$05]
$18:a7c8  b2 42		 lda ($42)
$18:a7ca  31 a2		 and ($a2),y
$18:a7cc  35 02		 and $02,x
$18:a7ce  30 4b		 bmi $a81b
$18:a7d0  16 a0		 asl $a0,x
$18:a7d2  01 8a		 ora ($8a,x)
$18:a7d4  1c bd 18	  trb $18bd
$18:a7d7  c4 42		 cpy $42
$18:a7d9  11 86		 ora ($86),y
$18:a7db  4d 0c 40	  eor $400c
$18:a7de  b6 18		 ldx $18,y
$18:a7e0  74 d0		 stz $d0,x
$18:a7e2  16 c0		 asl $c0,x
$18:a7e4  c4 2d		 cpy $2d
$18:a7e6  90 26		 bcc $a80e
$18:a7e8  01 6c		 ora ($6c,x)
$18:a7ea  5b			tcd
$18:a7eb  20 68 18	  jsr $1868
$18:a7ee  85 d8		 sta $d8
$18:a7f0  ca			dex
$18:a7f1  47 71		 eor [$71]
$18:a7f3  6c 8c 60	  jmp ($608c)
$18:a7f6  c0 15		 cpy #$15
$18:a7f8  54 d0 13	  mvn $13,$d0
$18:a7fb  85 0c		 sta $0c
$18:a7fd  07 32		 ora [$32]
$18:a7ff  2c 85 0c	  bit $0c85
$18:a802  ca			dex
$18:a803  49 31		 eor #$31
$18:a805  40			rti
$18:a806  91 64		 sta ($64),y
$18:a808  28			plp
$18:a809  48			pha
$18:a80a  82 50 89	  brl $315d
$18:a80d  cc 89 81	  cpy $8189
$18:a810  36 32		 rol $32,x
$18:a812  92 bc		 sta ($bc)
$18:a814  49 2a		 eor #$2a
$18:a816  2d 48 53	  and $5348
$18:a819  dc 61 c5	  jml [$c561]
$18:a81c  20 58 8c	  jsr $8c58
$18:a81f  3a			dec a
$18:a820  14 cb		 trb $cb
$18:a822  12 10		 ora ($10)
$18:a824  40			rti
$18:a825  a2 c1		 ldx #$c1
$18:a827  40			rti
$18:a828  2e 8b 24	  rol $248b
$18:a82b  02 80		 cop #$80
$18:a82d  64 16		 stz $16
$18:a82f  80 38		 bra $a869
$18:a831  04 84		 tsb $84
$18:a833  11 68		 ora ($68),y
$18:a835  13 64		 ora ($64,s),y
$18:a837  51 e7		 eor ($e7),y
$18:a839  10 4a		 bpl $a885
$18:a83b  a3 d8		 lda $d8,s
$18:a83d  13 a7		 ora ($a7,s),y
$18:a83f  10 51		 bpl $a892
$18:a841  a0 10		 ldy #$10
$18:a843  28			plp
$18:a844  9f ff fc 3c   sta $3cfcff,x
$18:a848  96 3f		 stx $3f,y
$18:a84a  8f f9 48 91   sta $9148f9
$18:a84e  00 c7		 brk #$c7
$18:a850  08			php
$18:a851  32 64		 and ($64)
$18:a853  16 23		 asl $23,x
$18:a855  06 27		 asl $27
$18:a857  8b			phb
$18:a858  50 44		 bvc $a89e
$18:a85a  64 95		 stz $95
$18:a85c  11 20		 ora ($20),y
$18:a85e  0b			phd
$18:a85f  44 52 25	  mvp $25,$52
$18:a862  20 9c 13	  jsr $139c
$18:a865  ce 60 19	  dec $1960
$18:a868  18			clc
$18:a869  0a			asl a
$18:a86a  fc 48 40	  jsr ($4048,x)
$18:a86d  45 28		 eor $28
$18:a86f  84 82		 sty $82
$18:a871  40			rti
$18:a872  45 29		 eor $29
$18:a874  04 42		 tsb $42
$18:a876  80 45		 bra $a8bd
$18:a878  22 10 58 17   jsl $175810
$18:a87c  e6 3c		 inc $3c
$18:a87e  61 20		 adc ($20,x)
$18:a880  11 bc		 ora ($bc),y
$18:a882  ae 42 51	  ldx $5142
$18:a885  1e 06 ad	  asl $ad06,x
$18:a888  7e 30 81	  ror $8130,x
$18:a88b  e0 5b		 cpx #$5b
$18:a88d  11 65		 ora ($65),y
$18:a88f  30 84		 bmi $a815
$18:a891  57 1a		 eor [$1a],y
$18:a893  c1 00		 cmp ($00,x)
$18:a895  91 0f		 sta ($0f),y
$18:a897  4d 84 4b	  eor $4b84
$18:a89a  a0 80		 ldy #$80
$18:a89c  43 22		 eor $22,s
$18:a89e  0c 20 f0	  tsb $f020
$18:a8a1  be 05 52	  ldx $5205,y
$18:a8a4  0a			asl a
$18:a8a5  c0 14		 cpy #$14
$18:a8a7  84 12		 sty $12
$18:a8a9  31 0d		 and ($0d),y
$18:a8ab  81 f9		 sta ($f9,x)
$18:a8ad  00 c3		 brk #$c3
$18:a8af  04 5c		 tsb $5c
$18:a8b1  88			dey
$18:a8b2  a4 63		 ldy $63
$18:a8b4  90 48		 bcc $a8fe
$18:a8b6  67 94		 adc [$94]
$18:a8b8  0c 11 c0	  tsb $c011
$18:a8bb  c8			iny
$18:a8bc  32 00		 and ($00)
$18:a8be  52 10		 eor ($10)
$18:a8c0  f8			sed
$18:a8c1  69 8c		 adc #$8c
$18:a8c3  15 a3		 ora $a3,x
$18:a8c5  0d 08 03	  ora $0308
$18:a8c8  58			cli
$18:a8c9  01 a3		 ora ($a3,x)
$18:a8cb  1f 80 41 55   ora $554180,x
$18:a8cf  00 a1		 brk #$a1
$18:a8d1  31 90		 and ($90),y
$18:a8d3  c2 a1		 rep #$a1
$18:a8d5  90 95		 bcc $a86c
$18:a8d7  61 43		 adc ($43,x)
$18:a8d9  21 4f		 and ($4f,x)
$18:a8db  11 5a		 ora ($5a),y
$18:a8dd  8c 4a 11	  sty $114a
$18:a8e0  01 5d		 ora ($5d,x)
$18:a8e2  8c 4a 08	  sty $084a
$18:a8e5  ff 11 48 c5   sbc $c54811,x
$18:a8e9  a0 10		 ldy #$10
$18:a8eb  96 48		 stx $48,y
$18:a8ed  83 00		 sta $00,s
$18:a8ef  1a			inc a
$18:a8f0  34 4f		 bit $4f,x
$18:a8f2  df fe 37 00   cmp $0037fe,x
$18:a8f6  81 c0		 sta ($c0,x)
$18:a8f8  21 6a		 and ($6a,x)
$18:a8fa  16 83		 asl $83,x
$18:a8fc  42 0d		 wdm #$0d
$18:a8fe  c0 ad		 cpy #$ad
$18:a900  11 40		 ora ($40),y
$18:a902  0a			asl a
$18:a903  45 86		 eor $86
$18:a905  30 e8		 bmi $a8ef
$18:a907  24 09		 bit $09
$18:a909  76 30		 ror $30,x
$18:a90b  e5 b0		 sbc $b0
$18:a90d  0e 00 66	  asl $6600
$18:a910  46 d0		 lsr $d0
$18:a912  64 88		 stz $88
$18:a914  f0 08		 beq $a91e
$18:a916  a2 d1		 ldx #$d1
$18:a918  01 38		 ora ($38,x)
$18:a91a  0d c0 56	  ora $56c0
$18:a91d  65 31		 adc $31
$18:a91f  a2 7e		 ldx #$7e
$18:a921  7f f1 85 b0   adc $b085f1,x
$18:a925  40			rti
$18:a926  20 e9 f3	  jsr $f3e9
$18:a929  57 00		 eor [$00],y
$18:a92b  4c 43 81	  jmp $8143
$18:a92e  e0 57		 cpx #$57
$18:a930  03 c4		 ora $c4,s
$18:a932  0d e2 d1	  ora $d1e2
$18:a935  08			php
$18:a936  0a			asl a
$18:a937  78			sei
$18:a938  20 7e 21	  jsr $217e
$18:a93b  60			rts
$18:a93c  c0 4f		 cpy #$4f
$18:a93e  a3 44		 lda $44,s
$18:a940  6a			ror a
$18:a941  04 b9		 tsb $b9
$18:a943  c6 31		 dec $31
$18:a945  e5 09		 sbc $09
$18:a947  b9 80 16	  lda $1680,y
$18:a94a  11 d8		 ora ($d8),y
$18:a94c  1c 60 e2	  trb $e260
$18:a94f  31 c8		 and ($c8),y
$18:a951  ba			tsx
$18:a952  64 5a		 stz $5a
$18:a954  21 17		 and ($17,x)
$18:a956  66 04		 ror $04
$18:a958  6c fe 31	  jmp ($31fe)
$18:a95b  b3 00		 lda ($00,s),y
$18:a95d  2a			rol a
$18:a95e  01 a2		 ora ($a2,x)
$18:a960  10 c9		 bpl $a92b
$18:a962  3c 5a 0b	  bit $0b5a,x
$18:a965  e3 1d		 sbc $1d,s
$18:a967  04 9a		 tsb $9a
$18:a969  1a			inc a
$18:a96a  b5 39		 lda $39,x
$18:a96c  6c 1a 1d	  jmp ($1d1a)
$18:a96f  0d 5b 8c	  ora $8c5b
$18:a972  16 5c		 asl $5c,x
$18:a974  c3 38		 cmp $38,s
$18:a976  04 ce		 tsb $ce
$18:a978  0b			phd
$18:a979  16 5b		 asl $5b,x
$18:a97b  8c cd 16	  sty $16cd
$18:a97e  0d 22 8a	  ora $8a22
$18:a981  c7 83		 cmp [$83]
$18:a983  40			rti
$18:a984  b7 18		 lda [$18],y
$18:a986  f4 55 be	  pea $be55
$18:a989  46 40		 lsr $40
$18:a98b  93 93		 sta ($93,s),y
$18:a98d  02 00		 cop #$00
$18:a98f  ad 01 01	  lda $0101
$18:a992  42 84		 wdm #$84
$18:a994  a1 12		 lda ($12,x)
$18:a996  8a			txa
$18:a997  04 40		 tsb $40
$18:a999  fe 31 48	  inc $4831,x
$18:a99c  93 ec		 sta ($ec,s),y
$18:a99e  56 21		 lsr $21,x
$18:a9a0  11 8a		 ora ($8a),y
$18:a9a2  c0 e2		 cpy #$e2
$18:a9a4  67 11		 adc [$11]
$18:a9a6  8a			txa
$18:a9a7  c4 41		 cpy $41
$18:a9a9  22 b1 09 31   jsl $3109b1
$18:a9ad  30 22		 bmi $a9d1
$18:a9af  04 e1		 tsb $e1
$18:a9b1  5c 80 5c 58   jml $585c80
$18:a9b5  c3 21		 cmp $21,s
$18:a9b7  88			dey
$18:a9b8  41 87		 eor ($87,x)
$18:a9ba  23 21		 and $21,s
$18:a9bc  82 c4 60	  brl $0a83
$18:a9bf  a4 01		 ldy $01
$18:a9c1  87 c5		 sta [$c5]
$18:a9c3  e2 d0		 sep #$d0
$18:a9c5  02 a8		 cop #$a8
$18:a9c7  c5 e1		 cmp $e1
$18:a9c9  e3 31		 sbc $31,s
$18:a9cb  a2 1c		 ldx #$1c
$18:a9cd  82 48 ed	  brl $9718
$18:a9d0  18			clc
$18:a9d1  ab			plb
$18:a9d2  c5 a1		 cmp $a1
$18:a9d4  b1 38		 lda ($38),y
$18:a9d6  98			tya
$18:a9d7  d0 a2		 bne $a97b
$18:a9d9  64 d0		 stz $d0
$18:a9db  1d 89 ac	  ora $ac89,x
$18:a9de  24 10		 bit $10
$18:a9e0  58			cli
$18:a9e1  70 80		 bvs $a963
$18:a9e3  64 0c		 stz $0c
$18:a9e5  70 2f		 bvs $aa16
$18:a9e7  02 c4		 cop #$c4
$18:a9e9  20 91 c8	  jsr $c891
$18:a9ec  7c 10 4e	  jmp ($4e10,x)
$18:a9ef  31 c8		 and ($c8),y
$18:a9f1  21 ac		 and ($ac,x)
$18:a9f3  56 21		 lsr $21,x
$18:a9f5  10 48		 bpl $aa3f
$18:a9f7  04 4d		 tsb $4d
$18:a9f9  52 31		 eor ($31)
$18:a9fb  18			clc
$18:a9fc  79 e4 56	  adc $56e4,y
$18:a9ff  21 0e		 and ($0e,x)
$18:aa01  89 40 62	  bit #$6240
$18:aa04  4a			lsr a
$18:aa05  91 2a		 sta ($2a),y
$18:aa07  02 1c		 cop #$1c
$18:aa09  68			pla
$18:aa0a  80 04		 bra $aa10
$18:aa0c  06 00		 asl $00
$18:aa0e  18			clc
$18:aa0f  80 3b		 bra $aa4c
$18:aa11  fd ff b2	  sbc $b2ff,x
$18:aa14  19 14 8c	  ora $8c14,y
$18:aa17  24 12		 bit $12
$18:aa19  49 28 3d	  eor #$3d28
$18:aa1c  02 41		 cop #$41
$18:aa1e  00 93		 brk #$93
$18:aa20  5c 69 d4 f1   jml $f1d469
$18:aa24  10 4b		 bpl $aa71
$18:aa26  64 72		 stz $72
$18:aa28  89 55 22	  bit #$2255
$18:aa2b  93 83		 sta ($83,s),y
$18:aa2d  c1 c0		 cmp ($c0,x)
$18:aa2f  43 e1		 eor $e1,s
$18:aa31  70 ab		 bvs $a9de
$18:aa33  55 c6		 eor $c6,x
$18:aa35  41 83		 eor ($83,x)
$18:aa37  15 05		 ora $05,x
$18:aa39  f6 99		 inc $99,x
$18:aa3b  4d b0 d2	  eor $d2b0
$18:aa3e  69 21 f0	  adc #$f021
$18:aa41  84 57		 sty $57
$18:aa43  ab			plb
$18:aa44  f5 ea		 sbc $ea,x
$18:aa46  ed 86 f8	  sbc $f886
$18:aa49  3a			dec a
$18:aa4a  0b			phd
$18:aa4b  b5 dc		 lda $dc,x
$18:aa4d  74 14		 stz $14,x
$18:aa4f  c8			iny
$18:aa50  04 c2		 tsb $c2
$18:aa52  5d 70 a0	  eor $a070,x
$18:aa55  d2 2a		 cmp ($2a)
$18:aa57  35 1a		 and $1a,x
$18:aa59  d9 28 2b	  cmp $2b28,y
$18:aa5c  95 d2		 sta $d2,x
$18:aa5e  50 5d		 bvc $aabd
$18:aa60  9f e1 26 82   sta $8226e1,x
$18:aa64  e1 6f		 sbc ($6f,x)
$18:aa66  24 c1		 bit $c1
$18:aa68  b6 d7		 ldx $d7,y
$18:aa6a  6c 75 92	  jmp ($9275)
$18:aa6d  d0 57		 bne $aac6
$18:aa6f  01 e1		 ora ($e1,x)
$18:aa71  29 95 60	  and #$6095
$18:aa74  af 35 4a a9   lda $a94a35
$18:aa78  28			plp
$18:aa79  2c 75 ac	  bit $ac75
$18:aa7c  2c ce 69	  bit $69ce
$18:aa7f  34 30		 bit $30,x
$18:aa81  0e 0a 90	  asl $900a
$18:aa84  47 12		 eor [$12]
$18:aa86  d0 54		 bne $aadc
$18:aa88  a0 30		 ldy #$30
$18:aa8a  99 7c c6	  sta $c67c,y
$18:aa8d  62 60 1a	  per $c4f0
$18:aa90  81 58		 sta ($58,x)
$18:aa92  0e a0 6a	  asl $6aa0
$18:aa95  0c 2a 2c	  tsb $2c2a
$18:aa98  26 4f		 rol $4f
$18:aa9a  f1 30		 sbc ($30),y
$18:aa9c  86 12		 stx $12
$18:aa9e  c5 78		 cmp $78
$18:aaa0  1d 0e 0e	  ora $0e0e,x
$18:aaa3  08			php
$18:aaa4  9b			txy
$18:aaa5  00 80		 brk #$80
$18:aaa7  9c 0a c0	  stz $c00a
$18:aaaa  57 1b		 eor [$1b],y
$18:aaac  1e 16 09	  asl $0916,x
$18:aaaf  27 30		 and [$30]
$18:aab1  0c 04 80	  tsb $8004
$18:aab4  14 ba		 trb $ba
$18:aab6  82 90 0d	  brl $b849
$18:aab9  01 61		 ora ($61,x)
$18:aabb  a5 4d		 lda $4d
$18:aabd  64 e7		 stz $e7
$18:aabf  01 85		 ora ($85,x)
$18:aac1  14 01		 trb $01
$18:aac3  22 05 71 2a   jsl $2a7105
$18:aac7  85 49		 sta $49
$18:aac9  72 06		 adc ($06)
$18:aacb  10 9e		 bpl $aa6b
$18:aacd  7f 4c 03 58   adc $58034c,x
$18:aad1  a8			tay
$18:aad2  d7 2d		 cmp [$2d],y
$18:aad4  94 d3		 sty $d3,x
$18:aad6  c8			iny
$18:aad7  36 46		 rol $46,x
$18:aad9  11 03		 ora ($03),y
$18:aadb  9f 80 39 ea   sta $ea3980,x
$18:aadf  a1 85		 lda ($85,x)
$18:aae1  92 c0		 sta ($c0)
$18:aae3  01 06		 ora ($06,x)
$18:aae5  08			php
$18:aae6  01 40		 ora ($40,x)
$18:aae8  50 29		 bvc $ab13
$18:aaea  d4 f8		 pei ($f8)
$18:aaec  0a			asl a
$18:aaed  e4 60		 cpx $60
$18:aaef  38			sec
$18:aaf0  2a			rol a
$18:aaf1  4e 0f 0b	  lsr $0b0f
$18:aaf4  82 80 c3	  brl $6e77
$18:aaf7  a8			tay
$18:aaf8  37 c2		 and [$c2],y
$18:aafa  50 60		 bvc $ab5c
$18:aafc  e5 72		 sbc $72
$18:aafe  c9 2d 26	  cmp #$262d
$18:ab01  c1 51		 cmp ($51,x)
$18:ab03  b0 d2		 bcs $aad7
$18:ab05  46 62		 lsr $62
$18:ab07  b3 04		 lda ($04,s),y
$18:ab09  38			sec
$18:ab0a  d2 d7		 cmp ($d7)
$18:ab0c  20 66 01	  jsr $0166
$18:ab0f  fa			plx
$18:ab10  a4 c2		 ldy $c2
$18:ab12  ff 52 5c 0d   sbc $0d5c52,x
$18:ab16  dc 52 05	  jml [$0552]
$18:ab19  04 6b		 tsb $6b
$18:ab1b  01 24		 ora ($24,x)
$18:ab1d  29 2c 90	  and #$902c
$18:ab20  ae 8e 40	  ldx $408e
$18:ab23  c0 6e		 cpy #$6e
$18:ab25  50 6b		 bvc $ab92
$18:ab27  02 90		 cop #$90
$18:ab29  64 f3		 stz $f3
$18:ab2b  49 9d 65	  eor #$659d
$18:ab2e  30 15		 bmi $ab45
$18:ab30  9b			txy
$18:ab31  15 44		 ora $44,x
$18:ab33  ac 69 50	  ldy $5069
$18:ab36  93 cc		 sta ($cc,s),y
$18:ab38  65 ce		 adc $ce
$18:ab3a  c0 81		 cpy #$81
$18:ab3c  e1 1c		 sbc ($1c,x)
$18:ab3e  46 6a		 lsr $6a
$18:ab40  38			sec
$18:ab41  04 c2		 tsb $c2
$18:ab43  62 7f 06	  per $b1c5
$18:ab46  88			dey
$18:ab47  1e 88 f4	  asl $f488,x
$18:ab4a  72 39		 adc ($39)
$18:ab4c  20 34 1c	  jsr $1c34
$18:ab4f  01 84		 ora ($84,x)
$18:ab51  b1 1a		 lda ($1a),y
$18:ab53  c4 d4		 cpy $d4
$18:ab55  61 b2		 adc ($b2,x)
$18:ab57  70 06		 bvs $ab5f
$18:ab59  08			php
$18:ab5a  6e 0d 41	  ror $410d
$18:ab5d  69 8c 9e	  adc #$9e8c
$18:ab60  78			sei
$18:ab61  b0 43		 bcs $aba6
$18:ab63  58			cli
$18:ab64  5b			tcd
$18:ab65  6b			rtl
$18:ab66  a6 90		 ldx $90
$18:ab68  1c 84 9e	  trb $9e84
$18:ab6b  7a			ply
$18:ab6c  c0 3a		 cpy #$3a
$18:ab6e  82 5c aa	  brl $55cd
$18:ab71  36 33		 rol $33,x
$18:ab73  88			dey
$18:ab74  49 f0 44	  eor #$44f0
$18:ab77  d0 90		 bne $ab09
$18:ab79  ca			dex
$18:ab7a  65 55		 adc $55
$18:ab7c  05 39		 ora $39
$18:ab7e  58			cli
$18:ab7f  eb			xba
$18:ab80  50 12		 bvc $ab94
$18:ab82  e8			inx
$18:ab83  00 11		 brk #$11
$18:ab85  e4 b2		 cpx $b2
$18:ab87  19 14 91	  ora $9114,y
$18:ab8a  ee b2 30	  inc $30b2
$18:ab8d  31 ca		 and ($ca),y
$18:ab8f  29 d4 f7	  and #$f7d4
$18:ab92  c1 ca		 cmp ($ca,x)
$18:ab94  41 a0		 eor ($a0,x)
$18:ab96  15 4b		 ora $4b,x
$18:ab98  75 bd		 adc $bd,x
$18:ab9a  f4 52 8c	  pea $8c52
$18:ab9d  39 f0 04	  and $04f0,y
$18:aba0  a9 66 b3	  lda #$b366
$18:aba3  bc 81 46	  ldy $4681,x
$18:aba6  10 1b		 bpl $abc3
$18:aba8  c9 18 06	  cmp #$0618
$18:abab  a9 56 ab	  lda #$ab56
$18:abae  8b			phb
$18:abaf  cb			wai
$18:abb0  05 7c		 ora $7c
$18:abb2  3e 05 da	  rol $da05,x
$18:abb5  ae 3d 01	  ldx $013d
$18:abb8  e8			inx
$18:abb9  57 ab		 eor [$ab],y
$18:abbb  e2 11		 sep #$11
$18:abbd  95 0d		 sta $0d,x
$18:abbf  0a			asl a
$18:abc0  db			stp
$18:abc1  5f 26 81 34   eor $348126,x
$18:abc5  20 38 25	  jsr $2538
$18:abc8  18			clc
$18:abc9  4f 67 f7 95   eor $95f767
$18:abcd  c0 11		 cpy #$11
$18:abcf  c3 07		 cmp $07,s
$18:abd1  82 a4 9a	  brl $4678
$18:abd4  02 03		 cop #$03
$18:abd6  01 51		 ora ($51,x)
$18:abd8  84 fa		 sty $fa
$18:abda  97 50		 sta [$50],y
$18:abdc  43 83		 eor $83,s
$18:abde  20 2c 36	  jsr $362c
$18:abe1  0a			asl a
$18:abe2  8d 86 94	  sta $9486
$18:abe5  69 05 18	  adc #$1805
$18:abe8  52 d6		 eor ($d6)
$18:abea  a2 9c		 ldx #$9c
$18:abec  05 40		 ora $40
$18:abee  ff 55 44 a3   sbc $a34455,x
$18:abf2  0a			asl a
$18:abf3  41 e4		 eor ($e4,x)
$18:abf5  15 62		 ora $62,x
$18:abf7  d7 25		 cmp [$25],y
$18:abf9  d0 11		 bne $ac0c
$18:abfb  40			rti
$18:abfc  82 15 8b	  brl $3714
$18:abff  12 6c		 ora ($6c)
$18:ac01  86 ac		 stx $ac
$18:ac03  31 15		 and ($15),y
$18:ac05  08			php
$18:ac06  23 04		 and $04,s
$18:ac08  92 43		 sta ($43)
$18:ac0a  d0 b7		 bne $abc3
$18:ac0c  27 82		 and [$82]
$18:ac0e  11 84		 ora ($84),y
$18:ac10  41 11		 eor ($11,x)
$18:ac12  30 4b		 bmi $ac5f
$18:ac14  23 86		 and $86,s
$18:ac16  a7 53		 lda [$53]
$18:ac18  66 12		 ror $12
$18:ac1a  e8			inx
$18:ac1b  2d 41 34	  and $3441
$18:ac1e  15 ca		 ora $ca,x
$18:ac20  fd 2e 07	  sbc $072e,x
$18:ac23  03 99		 ora $99,s
$18:ac25  e1 61		 sbc ($61,x)
$18:ac27  cb			wai
$18:ac28  d0 20		 bne $ac4a
$18:ac2a  0a			asl a
$18:ac2b  c8			iny
$18:ac2c  2c 75 ac	  bit $ac75
$18:ac2f  2c 12 5f	  bit $5f12
$18:ac32  31 97		 and ($97),y
$18:ac34  4d ac 8c	  eor $8cac
$18:ac37  d0 92		 bne $abcb
$18:ac39  83 c9		 sta $c9,s
$18:ac3b  e1 32		 sbc ($32,x)
$18:ac3d  d9 1c 8d	  cmp $8d1c,y
$18:ac40  df 70 ea 0d   cmp $0dea70,x
$18:ac44  05 fe		 ora $fe
$18:ac46  21 34		 and ($34,x)
$18:ac48  92 3b		 sta ($3b)
$18:ac4a  c6 81		 dec $81
$18:ac4c  01 80		 ora ($80,x)
$18:ac4e  cf a7 f8 2a   cmp $2af8a7
$18:ac52  5e 16 03	  lsr $0316,x
$18:ac55  3d 9f 4f	  and $4f9f,x
$18:ac58  20 92 77	  jsr $7792
$18:ac5b  d8			cld
$18:ac5c  40			rti
$18:ac5d  5d 81 4f	  eor $4f81,x
$18:ac60  18			clc
$18:ac61  b4 ae		 ldy $ae,x
$18:ac63  58			cli
$18:ac64  ef 08 0b 70   sbc $700b08
$18:ac68  52 e0		 eor ($e0)
$18:ac6a  64 1b		 stz $1b
$18:ac6c  ba			tsx
$18:ac6d  5c 30 62 b1   jml $b16230
$18:ac71  80 df		 bra $ac52
$18:ac73  54 e5 5c	  mvn $5c,$e5
$18:ac76  ae d7 30	  ldx $30d7
$18:ac79  2a			rol a
$18:ac7a  70 a9		 bvs $ac25
$18:ac7c  0a			asl a
$18:ac7d  c6 91		 dec $91
$18:ac7f  5b			tcd
$18:ac80  22 92 65 0b   jsl $0b6592
$18:ac84  64 50		 stz $50
$18:ac86  0b			phd
$18:ac87  69 58 2b	  adc #$2b58
$18:ac8a  bb			tyx
$18:ac8b  fe b6 fa	  inc $fab6,x
$18:ac8e  f6 59		 inc $59,x
$18:ac90  45 20		 eor $20
$18:ac92  a6 47		 ldx $47
$18:ac94  77 d7		 adc [$d7],y
$18:ac96  dd 29 06	  cmp $0629,x
$18:ac99  c2 3b		 rep #$3b
$18:ac9b  15 39		 ora $39,x
$18:ac9d  54 77 fb	  mvn $fb,$77
$18:aca0  79 06 e8	  adc $e806,y
$18:aca3  f0 36		 beq $acdb
$18:aca5  12 58		 ora ($58)
$18:aca7  90 c1		 bcc $ac6a
$18:aca9  00 3b		 brk #$3b
$18:acab  b9 06 c3	  lda $c306,y
$18:acae  73 7c		 adc ($7c,s),y
$18:acb0  40			rti
$18:acb1  09 ac 51	  ora #$51ac
$18:acb4  e6 a4		 inc $a4
$18:acb6  0d d5 46	  ora $46d5
$18:acb9  a6 91		 ldx $91
$18:acbb  13 58		 ora ($58,s),y
$18:acbd  a7 ca		 lda [$ca]
$18:acbf  c7 bd		 cmp [$bd]
$18:acc1  d9 6e 0c	  cmp $0c6e,y
$18:acc4  e4 ab		 cpx $ab
$18:acc6  6b			rtl
$18:acc7  0d 26 92	  ora $9226
$18:acca  50 3b		 bvc $ad07
$18:accc  1e 16 12	  asl $1216,x
$18:accf  9e 34 88	  stz $8834,x
$18:acd2  a2 06 a9	  ldx #$a906
$18:acd5  57 c2		 eor [$c2],y
$18:acd7  c1 25		 cmp ($25,x)
$18:acd9  f3 28		 sbc ($28,s),y
$18:acdb  04 9a		 tsb $9a
$18:acdd  0b			phd
$18:acde  84 b1		 sty $b1
$18:ace0  54 cd 23	  mvn $23,$cd
$18:ace3  01 5e		 ora ($5e,x)
$18:ace5  84 c2		 sty $c2
$18:ace7  63 2e		 adc $2e,s
$18:ace9  82 bb c6	  brl $73a7
$18:acec  91 60		 sta ($60),y
$18:acee  ad 9e 44	  lda $449e
$18:acf1  96 4e		 stx $4e,y
$18:acf3  f0 84		 beq $ac79
$18:acf5  48			pha
$18:acf6  65 32		 adc $32
$18:acf8  aa			tax
$18:acf9  81 9c		 sta ($9c,x)
$18:acfb  e0 32 b9	  cpx #$b932
$18:acfe  6c 92 4a	  jmp ($4a92)
$18:ad01  fb			xce
$18:ad02  07 80		 ora [$80]
$18:ad04  40			rti
$18:ad05  6b			rtl
$18:ad06  16 20		 asl $20,x
$18:ad08  21 59		 and ($59,x)
$18:ad0a  29 d4 f0	  and #$f0d4
$18:ad0d  49 c1 69	  eor #$69c1
$18:ad10  78			sei
$18:ad11  20 18 1a	  jsr $1a18
$18:ad14  46 1d		 lsr $1d
$18:ad16  56 ab		 lsr $ab,x
$18:ad18  86 42		 stx $42
$18:ad1a  47 23		 eor [$23]
$18:ad1c  06 84		 asl $84
$18:ad1e  04 24		 tsb $24
$18:ad20  27 91		 and [$91]
$18:ad22  a5 d7		 lda $d7
$18:ad24  ab			plb
$18:ad25  f0 19		 beq $ad40
$18:ad27  e6 12		 inc $12
$18:ad29  97 30		 sta [$30],y
$18:ad2b  7e 83 c8	  ror $c883,x
$18:ad2e  2b			pld
$18:ad2f  77 6b		 adc [$6b],y
$18:ad31  b8			clv
$18:ad32  5c 30 70 1a   jml $1a7030
$18:ad36  5e 0e 79	  lsr $790e,x
$18:ad39  01 77		 ora ($77,x)
$18:ad3b  89 04 6b	  bit #$6b04
$18:ad3e  96 cb		 stx $cb,y
$18:ad40  38			sec
$18:ad41  a4 0b		 ldy $0b
$18:ad43  23 3e		 and $3e,s
$18:ad45  fe 8b 8b	  inc $8b8b,x
$18:ad48  09 59 bd	  ora #$bd59
$18:ad4b  ba			tsx
$18:ad4c  40			rti
$18:ad4d  72 02		 adc ($02)
$18:ad4f  90 80		 bcc $acd1
$18:ad51  c0 e0 6e	  cpy #$6ee0
$18:ad54  f2 80		 sbc ($80)
$18:ad56  90 42		 bcc $ad9a
$18:ad58  b9 5f af	  lda $af5f,y
$18:ad5b  61 87		 adc ($87,x)
$18:ad5d  20 ec 09	  jsr $09ec
$18:ad60  88			dey
$18:ad61  30 50		 bmi $adb3
$18:ad63  61 83		 adc ($83,x)
$18:ad65  c2 61		 rep #$61
$18:ad67  52 81		 eor ($81)
$18:ad69  01 24		 ora ($24,x)
$18:ad6b  80 24		 bra $ad91
$18:ad6d  89 e3 4b	  bit #$4be3
$18:ad70  a5 a0		 lda $a0
$18:ad72  c0 b4 22	  cpy #$22b4
$18:ad75  81 05		 sta ($05,x)
$18:ad77  08			php
$18:ad78  30 49		 bmi $adc3
$18:ad7a  a1 83		 lda ($83,x)
$18:ad7c  3e 81 f4	  rol $f481,x
$18:ad7f  07 02		 ora [$02]
$18:ad81  ad 22 79	  lda $7922
$18:ad84  23 05		 and $05,s
$18:ad86  f8			sed
$18:ad87  10 8a		 bpl $ad13
$18:ad89  f4 dd 5a	  pea $5add
$18:ad8c  48			pha
$18:ad8d  f2 4e		 sbc ($4e)
$18:ad8f  24 22		 bit $22
$18:ad91  12 cd		 ora ($cd)
$18:ad93  32 78		 and ($78)
$18:ad95  82 49 3e	  brl $ebe1
$18:ad98  0c 70 99	  tsb $9970
$18:ad9b  40			rti
$18:ad9c  29 6d 50	  and #$506d
$18:ad9f  40			rti
$18:ada0  00 c8		 brk #$c8
$18:ada2  ea			nop
$18:ada3  25 70		 and $70
$18:ada5  80 b7		 bra $ad5e
$18:ada7  02 06		 cop #$06
$18:ada9  dc 04 00	  jml [$0004]
$18:adac  18			clc
$18:adad  c2 f0		 rep #$f0
$18:adaf  25 07		 and $07
$18:adb1  c8			iny
$18:adb2  61 58		 adc ($58,x)
$18:adb4  a1 32		 lda ($32,x)
$18:adb6  75 8a		 adc $8a,x
$18:adb8  00 4a		 brk #$4a
$18:adba  65 63		 adc $63
$18:adbc  ad 35 0e	  lda $0e35
$18:adbf  01 21		 ora ($21,x)
$18:adc1  94 ca		 sty $ca,x
$18:adc3  a9 17 da	  lda #$da17
$18:adc6  65 b6		 adc $b6
$18:adc8  bb			tyx
$18:adc9  61 2c		 adc ($2c,x)
$18:adcb  84 ae		 sty $ae
$18:adcd  59 25 92	  eor $9225,y
$18:add0  49 5e 4c	  eor #$4c5e
$18:add3  f9 0c 13	  sbc $130c,y
$18:add6  50 5e		 bvc $ae36
$18:add8  05 7c		 ora $7c
$18:adda  03 80		 ora $80,s
$18:addc  1c 5f 22	  trb $225f
$18:addf  ef 17 81 5e   sbc $5e8117
$18:ade3  c2 e0		 rep #$e0
$18:ade5  17 0a		 ora [$0a],y
$18:ade7  88			dey
$18:ade8  64 45		 stz $45
$18:adea  61 2d		 adc ($2d,x)
$18:adec  78			sei
$18:aded  12 14		 ora ($14)
$18:adef  2b			pld
$18:adf0  a6 40		 ldx $40
$18:adf2  0c 8e 0a	  tsb $0a8e
$18:adf5  92 2a		 sta ($2a)
$18:adf7  00 01		 brk #$01
$18:adf9  61 2b		 adc ($2b,x)
$18:adfb  36 22		 rol $22,x
$18:adfd  c1 9c		 cmp ($9c,x)
$18:adff  c0 34 01	  cpy #$0134
$18:ae02  02 3c		 cop #$3c
$18:ae04  99 ac 29	  sta $29ac,y
$18:ae07  50 15		 bvc $ae1e
$18:ae09  b0 4d		 bcs $ae58
$18:ae0b  04 04		 tsb $04
$18:ae0d  6b			rtl
$18:ae0e  11 d8		 ora ($d8),y
$18:ae10  54 03 20	  mvn $20,$03
$18:ae13  c5 26		 cmp $26
$18:ae15  88			dey
$18:ae16  20 80 08	  jsr $0880
$18:ae19  1f da 5d 2f   ora $2f5dda,x
$18:ae1d  08			php
$18:ae1e  1a			inc a
$18:ae1f  54 08 9e	  mvn $9e,$08
$18:ae22  c9 16 2f	  cmp #$2f16
$18:ae25  f1 67		 sbc ($67),y
$18:ae27  9a			txs
$18:ae28  e0 57 22	  cpx #$2257
$18:ae2b  9c 17 60	  stz $6017
$18:ae2e  ba			tsx
$18:ae2f  0d a2 6c	  ora $6ca2
$18:ae32  c2 6d		 rep #$6d
$18:ae34  fa			plx
$18:ae35  b4 f0		 ldy $f0,x
$18:ae37  58			cli
$18:ae38  4c 2a e4	  jmp $e42a
$18:ae3b  d8			cld
$18:ae3c  01 0e		 ora ($0e,x)
$18:ae3e  ab			plb
$18:ae3f  5d d7 e4	  eor $e4d7,x
$18:ae42  4c 04 e0	  jmp $e004
$18:ae45  b3 02		 lda ($02,s),y
$18:ae47  61 2e		 adc ($2e,x)
$18:ae49  82 d7 b0	  brl $5f23
$18:ae4c  cc f1 05	  cpy $05f1
$18:ae4f  81 74		 sta ($74,x)
$18:ae51  24 ae		 bit $ae
$18:ae53  c3 9b		 cmp $9b,s
$18:ae55  52 f0		 eor ($f0)
$18:ae57  aa			tax
$18:ae58  d4 55		 pei ($55)
$18:ae5a  9a			txs
$18:ae5b  fc 66 90	  jsr ($9066,x)
$18:ae5e  35 e9		 and $e9,x
$18:ae60  cf 0b a1 23   cmp $23a10b
$18:ae64  91 c9		 sta ($c9),y
$18:ae66  24 ad		 bit $ad
$18:ae68  02 66		 cop #$66
$18:ae6a  90 2c		 bcc $ae98
$18:ae6c  2c 94 ea	  bit $ea94
$18:ae6f  79 18 04	  adc $0418,y
$18:ae72  c6 38		 dec $38
$18:ae74  15 78		 ora $78,x
$18:ae76  11 82		 ora ($82),y
$18:ae78  ad 57 2b	  lda $2b57
$18:ae7b  04 9e		 tsb $9e
$18:ae7d  43 22		 eor $22,s
$18:ae7f  1b			tcs
$18:ae80  84 04		 sty $04
$18:ae82  6a			ror a
$18:ae83  32 82		 and ($82)
$18:ae85  b0 57		 bcs $aede
$18:ae87  ab			plb
$18:ae88  e6 60		 inc $60
$18:ae8a  96 ca		 stx $ca,y
$18:ae8c  25 50		 and $50
$18:ae8e  1c 12 d8	  trb $d812
$18:ae91  20 34 b8	  jsr $b834
$18:ae94  71 98		 adc ($98),y
$18:ae96  29 74 8a	  and #$8a74
$18:ae99  49 e0 70	  eor #$70e0
$18:ae9c  67 70		 adc [$70]
$18:ae9e  5c 0c ce 97   jml $97ce0c
$18:aea2  82 c1 52	  brl $0166
$18:aea5  6f b4 ca 6a   adc $6acab4
$18:aea9  20 2c 36	  jsr $362c
$18:aeac  0a			asl a
$18:aead  8b			phb
$18:aeae  24 48		 bit $48
$18:aeb0  61 4b		 adc ($4b,x)
$18:aeb2  43 8d		 eor $8d,s
$18:aeb4  da			phx
$18:aeb5  ee 98 0a	  inc $0a98
$18:aeb8  8a			txa
$18:aeb9  70 1d		 bvs $aed8
$18:aebb  a9 5b 4c	  lda #$4c5b
$18:aebe  05 72		 ora $72
$18:aec0  bb			tyx
$18:aec1  5c b6 53 53   jml $5353b6
$18:aec5  a5 21		 lda $21
$18:aec7  94 ca		 sty $ca,x
$18:aec9  90 e1		 bcc $aeac
$18:aecb  6d ae a7	  adc $a7ae
$18:aece  02 b7		 cop #$b7
$18:aed0  54 aa a7	  mvn $a7,$aa
$18:aed3  49 e0 14	  eor #$14e0
$18:aed6  bb			tyx
$18:aed7  da			phx
$18:aed8  ec bf b7	  cpx $b7bf
$18:aedb  84 40		 sty $40
$18:aedd  2f 53 04 87   and $870453
$18:aee1  14 e0		 trb $e0
$18:aee3  ae 86 b7	  ldx $b786
$18:aee6  7f 50 2a f0   adc $f02a50,x
$18:aeea  6a			ror a
$18:aeeb  2c a3 44	  bit $44a3
$18:aeee  12 ec		 ora ($ec)
$18:aef0  11 05		 ora ($05),y
$18:aef2  5c af e0 84   jml $84e0af
$18:aef6  a2 56 2b	  ldx #$2b56
$18:aef9  35 9c		 and $9c,x
$18:aefb  ac 58 53	  ldy $5358
$18:aefe  88			dey
$18:aeff  09 44 cc	  ora #$cc44
$18:af02  38			sec
$18:af03  63 22		 adc $22,s
$18:af05  60			rts
$18:af06  a9 78 58	  lda #$5878
$18:af09  49 28 20	  eor #$2028
$18:af0c  67 10		 adc [$10]
$18:af0e  c1 99		 cmp ($99,x)
$18:af10  82 02 7f	  brl $2e15
$18:af13  14 08		 trb $08
$18:af15  42 65		 wdm #$65
$18:af17  f3 28		 sbc ($28,s),y
$18:af19  04 ba		 tsb $ba
$18:af1b  11 33		 ora ($33),y
$18:af1d  3f 88 ac 11   and $11ac88,x
$18:af21  e2 8f		 sep #$8f
$18:af23  01 68		 ora ($68,x)
$18:af25  40			rti
$18:af26  26 03		 rol $03
$18:af28  73 1d		 adc ($1d,s),y
$18:af2a  89 6c 64	  bit #$646c
$18:af2d  92 56		 sta ($56)
$18:af2f  78			sei
$18:af30  12 c8		 ora ($c8)
$18:af32  a2 72 68	  ldx #$6872
$18:af35  bf a0 18 30   lda $3018a0,x
$18:af39  09 5c b6	  ora #$b65c
$18:af3c  46 4a		 lsr $4a
$18:af3e  36 80		 rol $80,x
$18:af40  5c 3e 05 b2   jml $b2053e
$18:af44  a5 02		 lda $02
$18:af46  81 f6		 sta ($f6,x)
$18:af48  4c f2 9f	  jmp $9ff2
$18:af4b  96 ca		 stx $ca,y
$18:af4d  c3 4a		 cmp $4a,s
$18:af4f  c2 40		 rep #$40
$18:af51  4b			phk
$18:af52  64 b1		 stz $b1
$18:af54  19 e9 6c	  ora $6ce9,y
$18:af57  aa			tax
$18:af58  36 1a		 rol $1a,x
$18:af5a  4e 0c be	  lsr $be0c
$18:af5d  52 89		 eor ($89)
$18:af5f  54 f2 96	  mvn $96,$f2
$18:af62  8b			phb
$18:af63  37 68		 and [$68],y
$18:af65  24 01		 bit $01
$18:af67  46 38		 lsr $38
$18:af69  3c 15 2d	  bit $2d15,x
$18:af6c  04 6e		 tsb $6e
$18:af6e  71 74		 adc ($74),y
$18:af70  19 fc 20	  ora $20fc,y
$18:af73  38			sec
$18:af74  59 5c b0	  eor $b05c,y
$18:af77  98			tya
$18:af78  0a			asl a
$18:af79  f3 6d		 sbc ($6d,s),y
$18:af7b  0a			asl a
$18:af7c  3c 0d e0	  bit $e00d,x
$18:af7f  82 25 79	  brl $28a7
$18:af82  7f 5d 46 7f   adc $7f465d,x
$18:af86  07 d9		 ora [$d9]
$18:af88  2f dd a2 15   and $15a2dd
$18:af8c  24 11		 bit $11
$18:af8e  9d 4d d8	  sta $d84d,x
$18:af91  a5 13		 lda $13
$18:af93  24 02		 bit $02
$18:af95  5c 0b e4 61   jml $61e40b
$18:af99  54 38 e1	  mvn $e1,$38
$18:af9c  29 76 4a	  and #$4a76
$18:af9f  75 3c		 adc $3c,x
$18:afa1  2c 46 01	  bit $0146
$18:afa4  3b			tsc
$18:afa5  85 c4		 sta $c4
$18:afa7  2c 18 58	  bit $5818
$18:afaa  75 5a		 adc $5a,x
$18:afac  ae 26 2a	  ldx $2a26
$18:afaf  0e 0e 78	  asl $780e
$18:afb2  67 1b		 adc [$1b]
$18:afb4  75 be		 adc $be,x
$18:afb6  7f 01 af 57   adc $57af01,x
$18:afba  c6 c4		 dec $c4
$18:afbc  81 08		 sta ($08,x)
$18:afbe  08			php
$18:afbf  40			rti
$18:afc0  2c b6 6b	  bit $6bb6
$18:afc3  3b			tsc
$18:afc4  28			plp
$18:afc5  19 41 3e	  ora $3e41,y
$18:afc8  65 06		 adc $06
$18:afca  0c 88 27	  tsb $2788
$18:afcd  80 12		 bra $afe1
$18:afcf  89 c0 30	  bit #$30c0
$18:afd2  ac a0 9e	  ldy $9ea0
$18:afd5  60			rts
$18:afd6  a0 21 51	  ldy #$5121
$18:afd9  10 0d		 bpl $afe8
$18:afdb  d4 76		 pei ($76)
$18:afdd  18			clc
$18:afde  25 18		 and $18
$18:afe0  32 42		 and ($42)
$18:afe2  97 01		 sta [$01],y
$18:afe4  12 88		 ora ($88)
$18:afe6  c0 99 41	  cpy #$4199
$18:afe9  50 6b		 bvc $b056
$18:afeb  89 2c 2c	  bit #$2c2c
$18:afee  96 63		 stx $63,y
$18:aff0  10 08		 bpl $affa
$18:aff2  00 84		 brk #$84
$18:aff4  10 ea		 bpl $afe0
$18:aff6  09 d4 3f	  ora #$3fd4
$18:aff9  ae 91 87	  ldx $8791
$18:affc  0c 82 83	  tsb $8382
$18:afff  26 a2		 rol $a2
$18:b001  d5 8e		 cmp $8e,x
$18:b003  41 85		 eor ($85,x)
$18:b005  c2 58		 rep #$58
$18:b007  9d 04 7b	  sta $7b04,x
$18:b00a  0b			phd
$18:b00b  3d 3a 61	  and $613a,x
$18:b00e  2e c0 5d	  rol $5dc0
$18:b011  29 e1 30	  and #$30e1
$18:b014  c2 56		 rep #$56
$18:b016  6c 56 31	  jmp ($3156)
$18:b019  20 0c 82	  jsr $820c
$18:b01c  dc f2 0a	  jml [$0af2]
$18:b01f  10 c8		 bpl $afe9
$18:b021  09 65 84	  ora #$8465
$18:b024  2b			pld
$18:b025  02 6c		 cop #$6c
$18:b027  6c c2 f1	  jmp ($f1c2)
$18:b02a  4e 0a 8c	  lsr $8c0a
$18:b02d  49 62 ab	  eor #$ab62
$18:b030  34 f8		 bit $f8,x
$18:b032  09 88 2c	  ora #$2c88
$18:b035  8b			phb
$18:b036  c2 0f		 rep #$0f
$18:b038  86 00		 stx $00
$18:b03a  6e 18 61	  ror $6118
$18:b03d  30 5b		 bmi $b09a
$18:b03f  ae f7 67	  ldx $67f7
$18:b042  49 03 45	  eor #$4503
$18:b045  de b2 19	  dec $19b2,x
$18:b048  14 92		 trb $92
$18:b04a  4a			lsr a
$18:b04b  ef a9 41 74   sbc $7441a9
$18:b04f  25 8f		 and $8f
$18:b051  c0 91 83	  cpy #$8391
$18:b054  c1 f6		 cmp ($f6,x)
$18:b056  64 f1		 stz $f1
$18:b058  b7 55		 lda [$55],y
$18:b05a  e0 92 78	  cpx #$7892
$18:b05d  04 fe		 tsb $fe
$18:b05f  79 01 95	  adc $9501,y
$18:b062  cb			wai
$18:b063  41 e3		 eor ($e3,x)
$18:b065  28			plp
$18:b066  c3 d0		 cmp $d0,s
$18:b068  6b			rtl
$18:b069  d7 4a		 cmp [$4a],y
$18:b06b  68			pla
$18:b06c  74 27		 stz $27,x
$18:b06e  b3 f2		 lda ($f2,s),y
$18:b070  28			plp
$18:b071  17 06		 ora [$06],y
$18:b073  1d 40 b5	  ora $b540,x
$18:b076  b2 86		 lda ($86)
$18:b078  aa			tax
$18:b079  1d 02 d0	  ora $d002,x
$18:b07c  1a			inc a
$18:b07d  84 e2		 sty $e2
$18:b07f  0b			phd
$18:b080  42 3d		 wdm #$3d
$18:b082  85 34		 sta $34
$18:b084  18			clc
$18:b085  06 90		 asl $90
$18:b087  3c 95 9c	  bit $9c95,x
$18:b08a  d4 1f		 pei ($1f)
$18:b08c  d9 f9 b0	  cmp $b0f9,y
$18:b08f  43 80		 eor $80,s
$18:b091  b5 02		 lda $02,x
$18:b093  09 c0 67	  ora #$67c0
$18:b096  c2 00		 rep #$00
$18:b098  80 d7		 bra $b071
$18:b09a  ab			plb
$18:b09b  f3 52		 sbc ($52,s),y
$18:b09d  f0 61		 beq $b100
$18:b09f  09 05 67	  ora #$6705
$18:b0a2  80 cf		 bra $b073
$18:b0a4  03 e3		 ora $e3,s
$18:b0a6  84 c1		 sty $c1
$18:b0a8  07 01		 ora [$01]
$18:b0aa  72 0c		 adc ($0c)
$18:b0ac  93 80		 sta ($80,s),y
$18:b0ae  cf 50 05 41   cmp $410550
$18:b0b2  0e 05 3c	  asl $3c05
$18:b0b5  8e 76 75	  stx $7576
$18:b0b8  a1 60		 lda ($60,x)
$18:b0ba  a9 73 f0	  lda #$f073
$18:b0bd  e0 19 41	  cpx #$4119
$18:b0c0  92 74		 sta ($74)
$18:b0c2  14 b8		 trb $b8
$18:b0c4  94 02		 sty $02,x
$18:b0c6  7a			ply
$18:b0c7  1c 04 a8	  trb $a804
$18:b0ca  e0 ce 64	  cpx #$64ce
$18:b0cd  4f 29 f4 05   eor $05f429
$18:b0d1  3a			dec a
$18:b0d2  54 bc 11	  mvn $11,$bc
$18:b0d5  8c a0 27	  sty $27a0
$18:b0d8  f0 28		 beq $b102
$18:b0da  0c 25 5c	  tsb $5c25
$18:b0dd  18			clc
$18:b0de  2c 15 82	  bit $8215
$18:b0e1  f1 4c		 sbc ($4c),y
$18:b0e3  2a			rol a
$18:b0e4  82 58 4e	  brl $ff3f
$18:b0e7  01 04		 ora ($04,x)
$18:b0e9  97 cc		 sta [$cc],y
$18:b0eb  ae f4 9b	  ldx $9bf4
$18:b0ee  05 46		 ora $46
$18:b0f0  b7 76		 lda [$76],y
$18:b0f2  bb			tyx
$18:b0f3  8d 01 30	  sta $3001
$18:b0f6  41 c1		 eor ($c1,x)
$18:b0f8  03 04		 ora $04,s
$18:b0fa  a6 55		 ldx $55
$18:b0fc  79 a6 5b	  adc $5ba6,y
$18:b0ff  6b			rtl
$18:b100  b5 17		 lda $17,x
$18:b102  b8			clv
$18:b103  56 ea		 lsr $ea,x
$18:b105  95 5a		 sta $5a,x
$18:b107  65 34		 adc $34
$18:b109  2c 38 27	  bit $2738
$18:b10c  18			clc
$18:b10d  bd c1 a6	  lda $a6c1,x
$18:b110  14 d7		 trb $d7
$18:b112  e8			inx
$18:b113  39 02 00	  and $0002,y
$18:b116  00 0b		 brk #$0b
$18:b118  eb			xba
$18:b119  d0 df		 bne $b0fa
$18:b11b  42 e4		 wdm #$e4
$18:b11d  0a			asl a
$18:b11e  e5 74		 sbc $74
$18:b120  1e 37 b7	  asl $b737,x
$18:b123  d8			cld
$18:b124  3d c4 10	  and $10c4,x
$18:b127  21 d0		 and ($d0,x)
$18:b129  7b			tdc
$18:b12a  80 3c		 bra $b168
$18:b12c  26 c1		 rol $c1
$18:b12e  20 a6 bd	  jsr $bda6
$18:b131  c8			iny
$18:b132  08			php
$18:b133  55 bb		 eor $bb,x
$18:b135  f8			sed
$18:b136  3c 28 02	  bit $0228,x
$18:b139  24 a8		 bit $a8
$18:b13b  8a			txa
$18:b13c  c6 c7		 dec $c7
$18:b13e  fd 17 0f	  sbc $0f17,x
$18:b141  f4 64 8f	  pea $8f64
$18:b144  71 b1		 adc ($b1),y
$18:b146  d6 b0		 dec $b0,x
$18:b148  96 20		 stx $20,y
$18:b14a  fb			xce
$18:b14b  bd c6 a4	  lda $a4c6,x
$18:b14e  b1 0c		 lda ($0c),y
$18:b150  20 bd 0e	  jsr $0ebd
$18:b153  69 52 87	  adc #$8752
$18:b156  50 20		 bvc $b178
$18:b158  20 f0 84	  jsr $84f0
$18:b15b  5e dc 80	  lsr $80dc,x
$18:b15e  83 20		 sta $20,s
$18:b160  c8			iny
$18:b161  58			cli
$18:b162  69 4d 90	  adc #$904d
$18:b165  80 4c		 bra $b1b3
$18:b167  25 d3		 and $d3
$18:b169  60			rts
$18:b16a  e8			inx
$18:b16b  24 c7		 bit $c7
$18:b16d  02 33		 cop #$33
$18:b16f  2b			pld
$18:b170  0d 26 00	  ora $0026
$18:b173  0f 1b 11 14   ora $14111b
$18:b177  af 04 34 4f   lda $4f3404
$18:b17b  96 11		 stx $11,y
$18:b17d  46 55		 lsr $55
$18:b17f  b2 9a		 lda ($9a)
$18:b181  27 cb		 and [$cb]
$18:b183  04 e1		 tsb $e1
$18:b185  05 35		 ora $35
$18:b187  d4 05		 pei ($05)
$18:b189  02 b7		 cop #$b7
$18:b18b  21 99		 and ($99,x)
$18:b18d  40			rti
$18:b18e  24 32		 bit $32
$18:b190  99 55 40	  sta $4055,y
$18:b193  06 20		 asl $20
$18:b195  b0 0c		 bcs $b1a3
$18:b197  92 d4		 sta ($d4)
$18:b199  0e 6c 33	  asl $336c
$18:b19c  13 58		 ora ($58,s),y
$18:b19e  41 24		 eor ($24,x)
$18:b1a0  f0 04		 beq $b1a6
$18:b1a2  39 21 51	  and $5121,y
$18:b1a5  38			sec
$18:b1a6  14 a7		 trb $a7
$18:b1a8  e0 a5 c9	  cpx #$c9a5
$18:b1ab  2a			rol a
$18:b1ac  d5 27		 cmp $27,x
$18:b1ae  e0 ad c0	  cpx #$c0ad
$18:b1b1  86 62		 stx $62
$18:b1b3  03 0d		 ora $0d,s
$18:b1b5  9b			txy
$18:b1b6  50 94		 bvc $b14c
$18:b1b8  c2 17		 rep #$17
$18:b1ba  f3 20		 sbc ($20,s),y
$18:b1bc  58			cli
$18:b1bd  f0 a2		 beq $b161
$18:b1bf  cc a9 52	  cpy $52a9
$18:b1c2  df 83 62 10   cmp $106283,x
$18:b1c6  43 e8		 eor $e8,s
$18:b1c8  da			phx
$18:b1c9  66 34		 ror $34
$18:b1cb  32 50		 and ($50)
$18:b1cd  40			rti
$18:b1ce  61 26		 adc ($26,x)
$18:b1d0  d1 10		 cmp ($10),y
$18:b1d2  28			plp
$18:b1d3  0c 2a 58	  tsb $582a
$18:b1d6  28			plp
$18:b1d7  24 be		 bit $be
$18:b1d9  65 00		 adc $00
$18:b1db  b0 0c		 bcs $b1e9
$18:b1dd  12 a2		 ora ($a2)
$18:b1df  13 07		 ora ($07,s),y
$18:b1e1  d1 87		 cmp ($87),y
$18:b1e3  99 26 36	  sta $3626,y
$18:b1e6  1c 1a 6c	  trb $6c1a
$18:b1e9  ca			dex
$18:b1ea  13 2b		 ora ($2b,s),y
$18:b1ec  96 49		 stx $49,y
$18:b1ee  43 d5		 eor $d5,s
$18:b1f0  61 a4		 adc ($a4,x)
$18:b1f2  d2 45		 cmp ($45)
$18:b1f4  aa			tax
$18:b1f5  56 16		 lsr $16,x
$18:b1f7  8a			txa
$18:b1f8  07 48		 ora [$48]
$18:b1fa  06 08		 asl $08
$18:b1fc  52 01		 eor ($01)
$18:b1fe  83 44		 sta $44,s
$18:b200  2a			rol a
$18:b201  d5 74		 cmp $74,x
$18:b203  e0 c0 24	  cpx #$24c0
$18:b206  d0 69		 bne $b271
$18:b208  e4 fa		 cpx $fa
$18:b20a  97 5e		 sta [$5e],y
$18:b20c  af d7 ad 96   lda $96add7
$18:b210  d0 a0		 bne $b1b2
$18:b212  05 02		 ora $02
$18:b214  01 21		 ora ($21,x)
$18:b216  94 ca		 sty $ca,x
$18:b218  a7 b4		 lda [$b4]
$18:b21a  b8			clv
$18:b21b  0d 22 93	  ora $9322
$18:b21e  7c 10 95	  jmp ($9510,x)
$18:b221  8e b2 f0	  stx $f0b2
$18:b224  08			php
$18:b225  2c 43 d0	  bit $d043
$18:b228  12 0a		 ora ($0a)
$18:b22a  c5 8a		 cmp $8a
$18:b22c  a6 d1		 ldx $d1
$18:b22e  12 50		 ora ($50)
$18:b230  61 00		 adc ($00,x)
$18:b232  03 0e		 ora $0e,s
$18:b234  f8			sed
$18:b235  08			php
$18:b236  82 7f 58	  brl $0ab8
$18:b239  bd 99 ce	  lda $ce99,x
$18:b23c  03 26		 ora $26,s
$18:b23e  b8			clv
$18:b23f  fa			plx
$18:b240  27 f6		 and [$f6]
$18:b242  ab			plb
$18:b243  4d ac 24	  eor $24ac
$18:b246  17 92		 ora [$92],y
$18:b248  b9 2a 82	  lda $822a,y
$18:b24b  4d 70 f8	  eor $f870
$18:b24e  4f ad 1f 9b   eor $9b1fad
$18:b252  40			rti
$18:b253  88			dey
$18:b254  2f 2c 70 a9   and $a9702c
$18:b258  df ea 43 e0   cmp $e043ea,x
$18:b25c  82 cf 20	  brl $d32e
$18:b25f  37 2b		 and [$2b],y
$18:b261  4d ce 03	  eor $03ce
$18:b264  3d 1c 15	  and $151c,x
$18:b267  8e b4 4e	  stx $4eb4
$18:b26a  10 90		 bpl $b1fc
$18:b26c  4f 27 e1 20   eor $20e127
$18:b270  a5 92		 lda $92
$18:b272  05 72		 ora $72
$18:b274  18			clc
$18:b275  59 58 40	  eor $4058,y
$18:b278  04 41		 tsb $41
$18:b27a  3d b5 08	  and $08b5,x
$18:b27d  82 1b 7a	  brl $2c9b
$18:b280  5b			tcd
$18:b281  90 10		 bcc $b293
$18:b283  02 01		 cop #$01
$18:b285  3e 16 81	  rol $8116,x
$18:b288  44 27 f8	  mvp $f8,$27
$18:b28b  28			plp
$18:b28c  73 ac		 adc ($ac,s),y
$18:b28e  2b			pld
$18:b28f  36 2b		 rol $2b,x
$18:b291  0d 2a 4d	  ora $4d2a
$18:b294  08			php
$18:b295  80 da		 bra $b271
$18:b297  90 41		 bcc $b2da
$18:b299  3e 9e c0	  rol $c09e,x
$18:b29c  70 4f		 bvs $b2ed
$18:b29e  60			rts
$18:b29f  c1 56		 cmp ($56,x)
$18:b2a1  2b			pld
$18:b2a2  35 a9		 and $a9,x
$18:b2a4  84 ba		 sty $ba
$18:b2a6  0b			phd
$18:b2a7  40			rti
$18:b2a8  41 02		 eor ($02,x)
$18:b2aa  8c 69 73	  sty $7369
$18:b2ad  dc 12 8c	  jml [$8c12]
$18:b2b0  69 0f 00	  adc #$000f
$18:b2b3  84 40		 sty $40
$18:b2b5  e0 65 60	  cpx #$6065
$18:b2b8  49 0a c8	  eor #$c80a
$18:b2bb  16 61		 asl $61,x
$18:b2bd  4b			phk
$18:b2be  c2 40		 rep #$40
$18:b2c0  26 13		 rol $13
$18:b2c2  19 8c b9	  ora $b98c,y
$18:b2c5  62 30 38	  per $eaf8
$18:b2c8  4c bd 84	  jmp $84bd
$18:b2cb  6e e1 5f	  ror $5fe1
$18:b2ce  93 50		 sta ($50,s),y
$18:b2d0  66 4d		 ror $4d
$18:b2d2  23 67		 and $67,s
$18:b2d4  93 7e		 sta ($7e,s),y
$18:b2d6  ab			plb
$18:b2d7  a0 c1 b1	  ldy #$b1c1
$18:b2da  57 30		 eor [$30],y
$18:b2dc  35 4b		 and $4b,x
$18:b2de  7a			ply
$18:b2df  8c a0 92	  sty $92a0
$18:b2e2  78			sei
$18:b2e3  01 6c		 ora ($6c,x)
$18:b2e5  70 55		 bvs $b33c
$18:b2e7  0a			asl a
$18:b2e8  88			dey
$18:b2e9  60			rts
$18:b2ea  2c ea a2	  bit $a2ea
$18:b2ed  7e 0d 67	  ror $670d,x
$18:b2f0  0b			phd
$18:b2f1  83 80		 sta $80,s
$18:b2f3  d6 2c		 dec $2c,x
$18:b2f5  55 37		 eor $37,x
$18:b2f7  b0 52		 bcs $b34b
$18:b2f9  c2 21		 rep #$21
$18:b2fb  01 95		 ora ($95,x)
$18:b2fd  cb			wai
$18:b2fe  24 ab		 bit $ab
$18:b300  91 59		 sta ($59),y
$18:b302  06 12		 asl $12
$18:b304  f6 06		 inc $06,x
$18:b306  05 19		 ora $19
$18:b308  bf 01 92 0c   lda $0c9201,x
$18:b30c  11 9b		 ora ($9b),y
$18:b30e  12 02		 ora ($02)
$18:b310  ae 28 50	  ldx $5028
$18:b313  68			pla
$18:b314  34 01		 bit $01,x
$18:b316  60			rts
$18:b317  16 6b		 asl $6b,x
$18:b319  6d 7f 06	  adc $067f
$18:b31c  18			clc
$18:b31d  21 ea		 and ($ea,x)
$18:b31f  27 c0		 and [$c0]
$18:b321  d2 16		 cmp ($16)
$18:b323  0b			phd
$18:b324  0e 0d 54	  asl $540d
$18:b327  2f c0 0e 81   and $810ec0
$18:b32b  00 8f		 brk #$8f
$18:b32d  20 79 0a	  jsr $0a79
$18:b330  93 e4		 sta ($e4,s),y
$18:b332  df 82 41 12   cmp $124182,x
$18:b336  a8			tay
$18:b337  15 40		 ora $40,x
$18:b339  d2 18		 cmp ($18)
$18:b33b  2a			rol a
$18:b33c  58			cli
$18:b33d  b4 25		 ldy $25,x
$18:b33f  72 d9		 adc ($d9)
$18:b341  19 80 0c	  ora $0c80,y
$18:b344  85 67		 sta $67
$18:b346  c2 be		 rep #$be
$18:b348  4e 7d 3d	  lsr $3d7d
$18:b34b  7e 09 d0	  ror $d009,x
$18:b34e  ad e8 94	  lda $94e8
$18:b351  08			php
$18:b352  84 d5		 sty $d5
$18:b354  24 28		 bit $28
$18:b356  52 14		 eor ($14)
$18:b358  a5 6a		 lda $6a
$18:b35a  03 09		 ora $09,s
$18:b35c  49 0d 5a	  eor #$5a0d
$18:b35f  ae b5 08	  ldx $08b5
$18:b362  0d 0f 11	  ora $110f
$18:b365  44 58 84	  mvp $84,$58
$18:b368  0e 13 2f	  asl $2f13
$18:b36b  6c 84 9b	  jmp ($9b84)
$18:b36e  01 5f		 ora ($5f,x)
$18:b370  af 57 e0 7e   lda $7ee057
$18:b374  5e ff 9d	  lsr $9dff,x
$18:b377  82 03 00	  brl $b37d
$18:b37a  61 01		 adc ($01,x)
$18:b37c  08			php
$18:b37d  43 e0		 eor $e0,s
$18:b37f  c0 09 77	  cpy #$7709
$18:b382  99 82 2d	  sta $2d82,y
$18:b385  e3 98		 sbc $98,s
$18:b387  0c 05 a0	  tsb $a005
$18:b38a  12 6f		 ora ($6f)
$18:b38c  30 fc		 bmi $b38a
$18:b38e  e0 b8 2a	  cpx #$2ab8
$18:b391  85 46		 sta $46
$18:b393  b9 81 bb	  lda $bb81,y
$18:b396  5d cc a1	  eor $a1cc,x
$18:b399  5c ae d4 6a   jml $6ad4ae
$18:b39d  2e f1 79	  rol $79f1
$18:b3a0  80 0c		 bra $b3ae
$18:b3a2  5e a0 55	  lsr $55a0,x
$18:b3a5  00 19		 brk #$19
$18:b3a7  3f da a3 78   and $78a3da,x
$18:b3ab  32 80		 and ($80)
$18:b3ad  2e eb 60	  rol $60eb
$18:b3b0  97 c2		 sta [$c2],y
$18:b3b2  58			cli
$18:b3b3  82 8b 5b	  brl $0f41
$18:b3b6  bf bf 4e 02   lda $024ebf,x
$18:b3ba  02 31		 cop #$31
$18:b3bc  42 c8		 wdm #$c8
$18:b3be  65 32		 adc $32
$18:b3c0  a2 12 06	  ldx #$0612
$18:b3c3  04 b2		 tsb $b2
$18:b3c5  4f 00 a5 90   eor $90a500
$18:b3c9  84 76		 sty $76
$18:b3cb  35 b7		 and $b7,x
$18:b3cd  b8			clv
$18:b3ce  1a			inc a
$18:b3cf  48			pha
$18:b3d0  80 34		 bra $b406
$18:b3d2  b0 92		 bcs $b366
$18:b3d4  3e c0 f2	  rol $f2c0,x
$18:b3d7  44 01 80	  mvp $80,$01
$18:b3da  8c 91 0a	  sty $0a91
$18:b3dd  8d 40 54	  sta $5440
$18:b3e0  8d 62 b3	  sta $b362
$18:b3e3  59 42 34	  eor $3442,y
$18:b3e6  c2 5c		 rep #$5c
$18:b3e8  41 0c		 eor ($0c,x)
$18:b3ea  22 88 52 80   jsl $805288
$18:b3ee  33 2b		 and ($2b,s),y
$18:b3f0  1d 64 7e	  ora $7e64,x
$18:b3f3  48			pha
$18:b3f4  20 a5 a8	  jsr $a8a5
$18:b3f7  c3 07		 cmp $07,s
$18:b3f9  84 4a		 sty $4a
$18:b3fb  85 67		 sta $67
$18:b3fd  0b			phd
$18:b3fe  01 69		 ora ($69,x)
$18:b400  92 44		 sta ($44)
$18:b402  4e 20 c3	  lsr $c320
$18:b405  28			plp
$18:b406  1b			tcs
$18:b407  30 1c		 bmi $b425
$18:b409  63 2e		 adc $2e,s
$18:b40b  60			rts
$18:b40c  83 51		 sta $51,s
$18:b40e  21 32		 and ($32,x)
$18:b410  f9 8c c6	  sbc $c68c,y
$18:b413  00 df		 brk #$df
$18:b415  06 80		 asl $80
$18:b417  38			sec
$18:b418  da			phx
$18:b419  64 df		 stz $df
$18:b41b  00 28		 brk #$28
$18:b41d  db			stp
$18:b41e  0b			phd
$18:b41f  41 6d		 eor ($6d,x)
$18:b421  3d 06 06	  and $0606,x
$18:b424  a9 57 af	  lda #$af57
$18:b427  4d e4 ee	  eor $eee4
$18:b42a  e1 34		 sbc ($34,x)
$18:b42c  19 d8 ab	  ora $abd8,y
$18:b42f  f0 18		 beq $b449
$18:b431  23 f4		 and $f4,s
$18:b433  8f 06 ab 1a   sta $1aab06
$18:b437  d1 c4		 cmp ($c4),y
$18:b439  01 88		 ora ($88,x)
$18:b43b  75 25		 adc $25,x
$18:b43d  68			pla
$18:b43e  06 41		 asl $41
$18:b440  22 12 b9 64   jsl $64b912
$18:b444  95 0a		 sta $0a,x
$18:b446  b5 26		 lda $26,x
$18:b448  28			plp
$18:b449  af 40 16 22   lda $221640
$18:b44d  f6 1d		 inc $1d,x
$18:b44f  0a			asl a
$18:b450  44 41 81	  mvp $81,$41
$18:b453  4c 79 81	  jmp $8179
$18:b456  40			rti
$18:b457  ac f4 ea	  ldy $eaf4
$18:b45a  7a			ply
$18:b45b  44 21 d4	  mvp $d4,$21
$18:b45e  01 e8		 ora ($e8,x)
$18:b460  00 88		 brk #$88
$18:b462  04 35		 tsb $35
$18:b464  7a			ply
$18:b465  b5 5d		 lda $5d,x
$18:b467  22 17 20 58   jsl $582017
$18:b46b  84 88		 sty $88
$18:b46d  24 35		 bit $35
$18:b46f  fa			plx
$18:b470  f0 28		 beq $b49a
$18:b472  27 d0		 and [$d0]
$18:b474  19 e0 f5	  ora $f5e0,y
$18:b477  04 c8		 tsb $c8
$18:b479  c4 03		 cpy $03
$18:b47b  d0 42		 bne $b4bf
$18:b47d  64 ea		 stz $ea
$18:b47f  d0 5d		 bne $b4de
$18:b481  93 10		 sta ($10,s),y
$18:b483  70 4c		 bvs $b4d1
$18:b485  70 9f		 bvs $b426
$18:b487  c1 25		 cmp ($25,x)
$18:b489  f3 2c		 sbc ($2c,s),y
$18:b48b  2b			pld
$18:b48c  1c d3 40	  trb $40d3
$18:b48f  48			pha
$18:b490  58			cli
$18:b491  03 10		 ora $10,s
$18:b493  07 43		 ora [$43]
$18:b495  82 87 50	  brl $051f
$18:b498  54 c2 d9	  mvn $d9,$c2
$18:b49b  17 e8		 ora [$e8],y
$18:b49d  35 08		 and $08,x
$18:b49f  70 07		 bvs $b4a8
$18:b4a1  91 05		 sta ($05),y
$18:b4a3  83 70		 sta $70,s
$18:b4a5  5d 80 e3	  eor $e380,x
$18:b4a8  19 74 21	  ora $2174,y
$18:b4ab  7e 4b b2	  ror $b24b,x
$18:b4ae  6d a4 c1	  adc $c1a4
$18:b4b1  9e 2e 32	  stz $322e,x
$18:b4b4  66 83		 ror $83
$18:b4b6  af de 8d 26   lda $268dde
$18:b4ba  82 a6 83	  brl $3863
$18:b4bd  04 3d		 tsb $3d
$18:b4bf  09 0c a5	  ora #$a50c
$18:b4c2  fc d0 81	  jsr ($81d0,x)
$18:b4c5  b8			clv
$18:b4c6  ca			dex
$18:b4c7  e5 b2		 sbc $b2
$18:b4c9  89 53 6d	  bit #$6d53
$18:b4cc  a5 d0		 lda $d0
$18:b4ce  59 f4 f1	  eor $f1f4,y
$18:b4d1  44 4d b5	  mvp $b5,$4d
$18:b4d4  91 87		 sta ($87),y
$18:b4d6  00 f2		 brk #$f2
$18:b4d8  0c 61 16	  tsb $1661
$18:b4db  b2 20		 lda ($20)
$18:b4dd  d8			cld
$18:b4de  22 3d 96 40   jsl $40963d
$18:b4e2  89 83 04	  bit #$0483
$18:b4e5  f4 f3 77	  pea $77f3
$18:b4e8  9f fd 21 ea   sta $ea21fd,x
$18:b4ec  1f 59 7b 0f   ora $0f7b59,x
$18:b4f0  da			phx
$18:b4f1  9e e5 f7	  stz $f7e5,x
$18:b4f4  b7 81		 lda [$81],y
$18:b4f6  fc 31 e2	  jsr ($e231,x)
$18:b4f9  9f 1d 79 2f   sta $2f791d,x
$18:b4fd  c9 c1 04	  cmp #$04c1
$18:b500  93 c9		 sta ($c9,s),y
$18:b502  a1 10		 lda ($10,x)
$18:b504  19 fe 08	  ora $08fe,y
$18:b507  be 12 19	  ldx $1912,y
$18:b50a  4c a8 b6	  jmp $b6a8
$18:b50d  93 09		 sta ($09,s),y
$18:b50f  74 16		 stz $16,x
$18:b511  03 4b		 ora $4b,s
$18:b513  2f 8c 17 04   and $04178c
$18:b517  5b			tcd
$18:b518  48			pha
$18:b519  01 e0		 ora ($e0,x)
$18:b51b  27 93		 and [$93]
$18:b51d  d8			cld
$18:b51e  49 dc 6a	  eor #$6adc
$18:b521  04 e2		 tsb $e2
$18:b523  95 cb		 sta $cb,x
$18:b525  64 72		 stz $72
$18:b527  89 54 fe	  bit #$fe54
$18:b52a  09 2f 99	  ora #$992f
$18:b52d  1e 03 08	  asl $0803,x
$18:b530  4e 2a 75	  lsr $752a
$18:b533  3f 05 52 9f   and $9f5205,x
$18:b537  4f 4c c7 48   eor $48c74c
$18:b53b  27 15		 and [$15]
$18:b53d  5a			phy
$18:b53e  af 01 c2 cf   lda $cfc201
$18:b542  e7 c7		 sbc [$c7]
$18:b544  63 b0		 adc $b0,s
$18:b546  13 8a		 ora ($8a,s),y
$18:b548  bd 5f 80	  lda $805f,x
$18:b54b  cf 30 87 53   cmp $538730
$18:b54f  be 53 09	  ldx $0953,y
$18:b552  de db f7	  dec $f7db,x
$18:b555  67 bc		 adc [$bc]
$18:b557  d2 43		 cmp ($43)
$18:b559  22 91 81 8d   jsl $8d8191
$18:b55d  24 12		 bit $12
$18:b55f  b0 01		 bcs $b562
$18:b561  aa			tax
$18:b562  07 07		 ora [$07]
$18:b564  01 0c		 ora ($0c,x)
$18:b566  23 cc		 and $cc,s
$18:b568  92 41		 sta ($41)
$18:b56a  48			pha
$18:b56b  b0 54		 bcs $b5c1
$18:b56d  b0 74		 bcs $b5e3
$18:b56f  b0 c1		 bcs $b532
$18:b571  43 9e		 eor $9e,s
$18:b573  65 01		 adc $01
$18:b575  12 85		 ora ($85)
$18:b577  46 a3		 lsr $a3
$18:b579  52 c1		 eor ($c1)
$18:b57b  0a			asl a
$18:b57c  4d e6 58	  eor $58e6
$18:b57f  2a			rol a
$18:b580  4d 46 c7	  eor $c746
$18:b583  5a			phy
$18:b584  c2 86		 rep #$86
$18:b586  62 a0 45	  per $fb29
$18:b589  83 d1		 sta $d1,s
$18:b58b  94 c6		 sty $c6,x
$18:b58d  a5 01		 lda $01
$18:b58f  c1 90		 cmp ($90,x)
$18:b591  c0 d0 04	  cpy #$04d0
$18:b594  d6 b0		 dec $b0,x
$18:b596  d2 a9		 cmp ($a9)
$18:b598  36 11		 rol $11,x
$18:b59a  a8			tay
$18:b59b  1d 40 86	  ora $8640,x
$18:b59e  0f 32 1a 89   ora $891a32
$18:b5a2  14 2b		 trb $2b
$18:b5a4  36 2f		 rol $2f,x
$18:b5a6  f9 d0 06	  sbc $06d0,y
$18:b5a9  a0 f3 24	  ldy #$24f3
$18:b5ac  20 8d c3	  jsr $c38d
$18:b5af  06 53		 asl $53
$18:b5b1  04 99		 tsb $99
$18:b5b3  23 de		 and $de,s
$18:b5b5  03 58		 ora $58,s
$18:b5b7  ac a2 01	  ldy $01a2
$18:b5ba  3a			dec a
$18:b5bb  8a			txa
$18:b5bc  c0 43 81	  cpy #$8143
$18:b5bf  98			tya
$18:b5c0  17 03		 ora [$03],y
$18:b5c2  58			cli
$18:b5c3  56 01		 lsr $01,x
$18:b5c5  fd 08 c0	  sbc $c008,x
$18:b5c8  67 05		 adc [$05]
$18:b5ca  c2 23		 rep #$23
$18:b5cc  d1 2e		 cmp ($2e),y
$18:b5ce  14 b8		 trb $b8
$18:b5d0  1c 0e 66	  trb $660e
$18:b5d3  48			pha
$18:b5d4  1a			inc a
$18:b5d5  c2 bc		 rep #$bc
$18:b5d7  c8			iny
$18:b5d8  c3 04		 cmp $04,s
$18:b5da  97 cc		 sta [$cc],y
$18:b5dc  65 d3		 adc $d3
$18:b5de  65 c0		 adc $c0
$18:b5e0  8f c9 df 52   sta $52dfc9
$18:b5e4  d9 1c 8e	  cmp $8e1c,y
$18:b5e7  4a			lsr a
$18:b5e8  ef a8 75 06   sbc $0675a8
$18:b5ec  82 ff 10	  brl $c6ee
$18:b5ef  9a			txs
$18:b5f0  0f ca 80 b8   ora $b880ca
$18:b5f4  09 f4 fc	  ora #$fcf4
$18:b5f7  72 04		 adc ($04)
$18:b5f9  80 9e		 bra $b599
$18:b5fb  cf a7 83 f2   cmp $f283a7
$18:b5ff  5c 0c fe 7f   jml $7ffe0c
$18:b603  48			pha
$18:b604  64 04		 stz $04
$18:b606  f2 7c		 sbc ($7c)
$18:b608  22 00 d9 40   jsl $40d900
$18:b60c  70 54		 bvs $b662
$18:b60e  8a			txa
$18:b60f  4d 26 c0	  eor $c026
$18:b612  66 02		 ror $02
$18:b614  08			php
$18:b615  52 87		 eor ($87)
$18:b617  49 48 41	  eor #$4148
$18:b61a  95 84		 sta $84,x
$18:b61c  86 05		 stx $05
$18:b61e  41 0d		 eor ($0d,x)
$18:b620  91 40		 sta ($40),y
$18:b622  cc 2a 7f	  cpy $7f2a
$18:b625  64 20		 stz $20
$18:b627  6f fa db e4   adc $e4dbfa
$18:b62b  99 2d 41	  sta $412d,y
$18:b62e  58			cli
$18:b62f  29 32 dd	  and #$dd32
$18:b632  f5 f7		 sbc $f7,x
$18:b634  4a			lsr a
$18:b635  34 a8		 bit $a8,x
$18:b637  1f cf 7f b7   ora $b77fcf,x
$18:b63b  90 6e		 bcc $b6ab
$18:b63d  95 82		 sta $82,x
$18:b63f  c5 1a		 cmp $1a
$18:b641  c1 48		 cmp ($48,x)
$18:b643  7f a8 40 90   adc $9040a8,x
$18:b647  6c 37 25	  jmp ($2537)
$18:b64a  11 46		 ora ($46),y
$18:b64c  04 06		 tsb $06
$18:b64e  90 7f		 bcc $b6cf
$18:b650  35 20		 and $20,x
$18:b652  21 d3		 and ($d3,x)
$18:b654  fa			plx
$18:b655  8d 4b 1e	  sta $1e4b
$18:b658  f7 65		 sbc [$65],y
$18:b65a  b8			clv
$18:b65b  3f 92 70 20   and $207092,x
$18:b65f  36 03		 rol $03,x
$18:b661  f1 15		 sbc ($15),y
$18:b663  40			rti
$18:b664  ac 27 b1	  ldy $b127
$18:b667  0d 92 38	  ora $3892
$18:b66a  6c 69 82	  jmp ($8269)
$18:b66d  3e 85 4b	  rol $4b85,x
$18:b670  04 1b		 tsb $1b
$18:b672  27 77		 and [$77]
$18:b674  bf fc 21 e2   lda $e221fc,x
$18:b678  1f 19 79 0f   ora $0f7919,x
$18:b67c  ca			dex
$18:b67d  9e 65 f3	  stz $f365,x
$18:b680  b7 a1		 lda [$a1],y
$18:b682  fd 31 ea	  sbc $ea31,x
$18:b685  9f 5d 7b 2f   sta $2f7b5d,x
$18:b689  db			stp
$18:b68a  9e ed f7	  stz $f7ed,x
$18:b68d  f7 83		 sbc [$83],y
$18:b68f  fc 41 e3	  jsr ($e341,x)
$18:b692  1f 21 79 3e   ora $3e7921,x
$18:b696  a4 d0		 ldy $d0
$18:b698  88			dey
$18:b699  0c 06 06	  tsb $0606
$18:b69c  4f 99 84 ba   eor $ba8499
$18:b6a0  0b			phd
$18:b6a1  04 97		 tsb $97
$18:b6a3  95 2c		 sta $2c,x
$18:b6a5  e4 12		 cpx $12
$18:b6a7  73 af		 adc ($af,s),y
$18:b6a9  a1 bc		 lda ($bc,x)
$18:b6ab  9e f2 39	  stz $39f2,x
$18:b6ae  44 a9 27	  mvp $27,$a9
$18:b6b1  73 c3		 adc ($c3,s),y
$18:b6b3  10 4a		 bpl $b6ff
$18:b6b5  e5 a4		 sbc $a4
$18:b6b7  f9 9f 98	  sbc $989f,y
$18:b6ba  82 c9 4e	  brl $0586
$18:b6bd  27 fb		 and [$fb]
$18:b6bf  8a			txa
$18:b6c0  f0 98		 beq $b65a
$18:b6c2  58			cli
$18:b6c3  1c 0e 12	  trb $120e
$18:b6c6  94 03		 sty $03,x
$18:b6c8  01 40		 ora ($40,x)
$18:b6ca  5c 43 fd a5   jml $a5fd43
$18:b6ce  9c c2 63	  stz $63c2
$18:b6d1  31 99		 and ($99),y
$18:b6d3  1b			tcs
$18:b6d4  c9 fa 77	  cmp #$77fa
$18:b6d7  d8			cld
$18:b6d8  2b			pld
$18:b6d9  0c 24 a5	  tsb $a524
$18:b6dc  c3 9b		 cmp $9b,s
$18:b6de  52 f0		 eor ($f0)
$18:b6e0  ae 21 bd	  ldx $bd21
$18:b6e3  83 01		 sta $01,s
$18:b6e5  26 86		 rol $86
$18:b6e7  00 9a		 brk #$9a
$18:b6e9  19 0a fa	  ora $fa0a,y
$18:b6ec  e2 db		 sep #$db
$18:b6ee  dc 02 11	  jml [$1102]
$18:b6f1  3c 61 84	  bit $8461,x
$18:b6f4  8e 47 24	  stx $2447
$18:b6f7  71 28		 adc ($28),y
$18:b6f9  c8			iny
$18:b6fa  01 63		 ora ($63,x)
$18:b6fc  3e 9f e0	  rol $e09f,x
$18:b6ff  e0 83		 cpx #$83
$18:b701  b7 0d		 lda [$0d],y
$18:b703  84 f2		 sty $f2
$18:b705  7d 3d 9f	  adc $9f3d,x
$18:b708  16 98		 asl $98,x
$18:b70a  64 0b		 stz $0b
$18:b70c  10 c2		 bpl $b6d0
$18:b70e  4f 60 33 d9   eor $d93360
$18:b712  58			cli
$18:b713  ed df 83	  sbc $83df
$18:b716  01 a4		 ora ($a4,x)
$18:b718  52 69		 eor ($69)
$18:b71a  2e 25 fe	  rol $fe25
$18:b71d  c0 29		 cpy #$29
$18:b71f  78			sei
$18:b720  2c 15 26	  bit $2615
$18:b723  fb			xce
$18:b724  4c a6 b8	  jmp $b8a6
$18:b727  bd 57 eb	  lda $eb57,x
$18:b72a  cf 66 fb 7b   cmp $7bfb66
$18:b72e  ab			plb
$18:b72f  16 2b		 asl $2b,x
$18:b731  1d 6a a1	  ora $a16a,x
$18:b734  51 78		 eor ($78),y
$18:b736  84 07		 sty $07
$18:b738  08			php
$18:b739  f6 06		 inc $06,x
$18:b73b  f1 40		 sbc ($40),y
$18:b73d  6b			rtl
$18:b73e  18			clc
$18:b73f  57 b8		 eor [$b8],y
$18:b741  56 70		 lsr $70,x
$18:b743  b8			clv
$18:b744  34 30		 bit $30,x
$18:b746  00 41		 brk #$41
$18:b748  f6 60		 inc $60,x
$18:b74a  f7 c1		 sbc [$c1],y
$18:b74c  52 db		 eor ($db)
$18:b74e  c5 03		 cmp $03
$18:b750  80 d2		 bra $b724
$18:b752  f0 78		 beq $b7cc
$18:b754  44 30 40	  mvp $40,$30
$18:b757  c4 c3		 cpy $c3
$18:b759  33 6f		 and ($6f,s),y
$18:b75b  3d 6f f6	  and $f66f,x
$18:b75e  de 17 a0	  dec $a017,x
$18:b761  56 47		 lsr $47,x
$18:b763  61 62		 adc ($62,x)
$18:b765  6f 45 46 a5   adc $a54645
$18:b769  3e 80 cf	  rol $cf80,x
$18:b76c  ea			nop
$18:b76d  0d e8 78	  ora $78e8
$18:b770  84 f6		 sty $f6
$18:b772  79 01 27	  adc $2701,y
$18:b775  49 28 61	  eor #$6128
$18:b778  b3 c2		 lda ($c2,s),y
$18:b77a  f5 40		 sbc $40,x
$18:b77c  61 93		 adc ($93,x)
$18:b77e  f9 ed 80	  sbc $80ed,y
$18:b781  bf 33 cf ec   lda $eccf33,x
$18:b785  fa			plx
$18:b786  91 51		 sta ($51),y
$18:b788  37 d4		 and [$d4],y
$18:b78a  f8			sed
$18:b78b  da			phx
$18:b78c  08			php
$18:b78d  e9 54 7a	  sbc #$7a54
$18:b790  e7 d9		 sbc [$d9]
$18:b792  5e db f7	  lsr $f7db,x
$18:b795  60			rts
$18:b796  00 bc		 brk #$bc
$18:b798  1d d1 4e	  ora $4ed1,x
$18:b79b  35 93		 and $93,x
$18:b79d  8d b4 e3	  sta $e3b4
$18:b7a0  81 38		 sta ($38,x)
$18:b7a2  e5 4e		 sbc $4e
$18:b7a4  3a			dec a
$18:b7a5  93 8e		 sta ($8e,s),y
$18:b7a7  f4 e2 01	  pea $01e2
$18:b7aa  39 91 4e	  and $4e91,y
$18:b7ad  68			pla
$18:b7ae  93 9b		 sta ($9b,s),y
$18:b7b0  34 e7		 bit $e7,x
$18:b7b2  11 39		 ora ($39),y
$18:b7b4  d5 4e		 cmp $4e,x
$18:b7b6  7a			ply
$18:b7b7  93 9f		 sta ($9f,s),y
$18:b7b9  f4 e6 51	  pea $51e6
$18:b7bc  3a			dec a
$18:b7bd  99 4e a8	  sta $a84e,y
$18:b7c0  93 aa		 sta ($aa,s),y
$18:b7c2  74 ea		 stz $ea,x
$18:b7c4  c1 3a		 cmp ($3a,x)
$18:b7c6  b5 4e		 lda $4e,x
$18:b7c8  af 81 20 9d   lda $9d2081
$18:b7cc  c8			iny
$18:b7cd  27 9f		 and [$9f]
$18:b7cf  29 e7 12	  and #$12e7
$18:b7d2  7b			tdc
$18:b7d3  0e 9f 56	  asl $569f
$18:b7d6  27 da		 and [$da]
$18:b7d8  29 f7 12	  and #$12f7
$18:b7db  7d 2e 9f	  adc $9f2e,x
$18:b7de  e6 27		 inc $27
$18:b7e0  f0 2a		 beq $b80c
$18:b7e2  04 52		 tsb $52
$18:b7e4  81 26		 sta ($26,x)
$18:b7e6  a0 4e		 ldy #$4e
$18:b7e8  28			plp
$18:b7e9  14 aa		 trb $aa
$18:b7eb  05 72		 ora $72
$18:b7ed  81 66		 sta ($66,x)
$18:b7ef  a0 5c		 ldy #$5c
$18:b7f1  28			plp
$18:b7f2  17 aa		 ora [$aa],y
$18:b7f4  06 12		 asl $12
$18:b7f6  81 d6		 sta ($d6,x)
$18:b7f8  a0 7a		 ldy #$7a
$18:b7fa  28			plp
$18:b7fb  1f aa 04 32   ora $3204aa,x
$18:b7ff  83 16		 sta $16,s
$18:b801  a0 e2		 ldy #$e2
$18:b803  28			plp
$18:b804  3b			tsc
$18:b805  aa			tax
$18:b806  0f b2 83 f6   ora $f683b2
$18:b80a  a0 c0		 ldy #$c0
$18:b80c  28			plp
$18:b80d  50 aa		 bvc $b7b9
$18:b80f  14 52		 trb $52
$18:b811  85 1e		 sta $1e
$18:b813  a1 4a		 lda ($4a,x)
$18:b815  28			plp
$18:b816  53 2a		 eor ($2a,s),y
$18:b818  14 f2		 trb $f2
$18:b81a  85 46		 sta $46
$18:b81c  a1 54		 lda ($54,x)
$18:b81e  28			plp
$18:b81f  55 aa		 eor $aa,x
$18:b821  15 92		 ora $92,x
$18:b823  85 6e		 sta $6e
$18:b825  a1 5e		 lda ($5e,x)
$18:b827  28			plp
$18:b828  58			cli
$18:b829  2a			rol a
$18:b82a  17 12		 ora [$12],y
$18:b82c  85 06		 sta $06
$18:b82e  a1 d2		 lda ($d2,x)
$18:b830  28			plp
$18:b831  78			sei
$18:b832  aa			tax
$18:b833  1f 32 87 0e   ora $0e8732,x
$18:b837  a2 48		 ldx #$48
$18:b839  28			plp
$18:b83a  92 aa		 sta ($aa)
$18:b83c  24 f2		 bit $f2
$18:b83e  89 4e a2	  bit #$a24e
$18:b841  56 28		 lsr $28,x
$18:b843  96 aa		 stx $aa,y
$18:b845  25 f2		 and $f2
$18:b847  89 86 a2	  bit #$a286
$18:b84a  66 28		 ror $28
$18:b84c  9a			txs
$18:b84d  2a			rol a
$18:b84e  24 1e		 bit $1e
$18:b850  00 92		 brk #$92
$18:b852  2d 65 13	  and $1365
$18:b855  ff ff 48 a4   sbc $a448ff,x
$18:b859  aa			tax
$18:b85a  8a			txa
$18:b85b  99 69 4d	  sta $4d69,y
$18:b85e  1d 32 da	  ora $da32,x
$18:b861  05 63		 ora $63
$18:b863  e7 e9		 sbc [$e9]
$18:b865  29 96 95	  and #$9596
$18:b868  d2 93		 cmp ($93)
$18:b86a  29 01 4b	  and #$4b01
$18:b86d  0b			phd
$18:b86e  35 3a		 and $3a,x
$18:b870  cd 45 69	  cmp $6945
$18:b873  b4 01		 ldy $01,x
$18:b875  44 ad 10	  mvp $10,$ad
$18:b878  50 83		 bvc $b7fd
$18:b87a  35 2a		 and $2a,x
$18:b87c  8f 65 7a b5   sta $b57a65
$18:b880  f9 44 a9	  sbc $a944,y
$18:b883  90 55		 bcc $b8da
$18:b885  80 45		 bra $b8cc
$18:b887  29 81 85	  and #$8581
$18:b88a  0b			phd
$18:b88b  b5 bd		 lda $bd,x
$18:b88d  58			cli
$18:b88e  a9 90 5a	  lda #$5a90
$18:b891  80 45		 bra $b8d8
$18:b893  39 41 85	  and $8541,y
$18:b896  1c b7 d1	  trb $d1b7
$18:b899  58			cli
$18:b89a  69 90 5e	  adc #$5e90
$18:b89d  91 55		 sta ($55),y
$18:b89f  39 25 c5	  and $c525,y
$18:b8a2  2d b7 cd	  and $cdb7
$18:b8a5  80 65		 bra $b90c
$18:b8a7  72 64		 adc ($64)
$18:b8a9  81 55		 sta ($55,x)
$18:b8ab  2a			rol a
$18:b8ac  a7 e5		 lda [$e5]
$18:b8ae  3e b5 fd	  rol $fdb5,x
$18:b8b1  94 ab		 sty $ab,x
$18:b8b3  00 d4		 brk #$d4
$18:b8b5  51 5d		 eor ($5d),y
$18:b8b7  22 ba 1f 3a   jsl $3a1fba
$18:b8bb  81 65		 sta ($65,x)
$18:b8bd  b4 65		 ldy $65,x
$18:b8bf  0a			asl a
$18:b8c0  5c e8 c9 94   jml $94c9e8
$18:b8c4  dc d1 92	  jml [$92d1]
$18:b8c7  ed 25 a4	  sbc $a425
$18:b8ca  00 c1		 brk #$c1
$18:b8cc  46 55		 lsr $55
$18:b8ce  d6 52		 dec $52,x
$18:b8d0  e8			inx
$18:b8d1  d9 4b e9	  cmp $e94b,y
$18:b8d4  a4 26		 ldy $26
$18:b8d6  52 5e		 eor ($5e)
$18:b8d8  74 35		 stz $35,x
$18:b8da  19 6d e9	  ora $e96d,y
$18:b8dd  4a			lsr a
$18:b8de  94 f7		 sty $f7,x
$18:b8e0  bd 16 6b	  lda $6b16,x
$18:b8e3  4b			phk
$18:b8e4  54 a5 ee	  mvn $ee,$a5
$18:b8e7  96 c3		 stx $c3,y
$18:b8e9  4e 0d 2d	  lsr $2d0d
$18:b8ec  2f 03 10 99   and $991003
$18:b8f0  a8			tay
$18:b8f1  8f f0 b8 50   sta $50b8f0
$18:b8f5  e9 30 d8	  sbc #$d830
$18:b8f8  3e d6 e2	  rol $e2d6,x
$18:b8fb  e0 8d		 cpx #$8d
$18:b8fd  59 da c1	  eor $c1da,y
$18:b900  f6 fc		 inc $fc,x
$18:b902  83 14		 sta $14,s
$18:b904  aa			tax
$18:b905  4a			lsr a
$18:b906  92 82		 sta ($82)
$18:b908  40			rti
$18:b909  25 54		 and $54
$18:b90b  c3 5a		 cmp $5a,s
$18:b90d  55 0e		 eor $0e,x
$18:b90f  4b			phk
$18:b910  77 39		 adc [$39],y
$18:b912  2e 84 e4	  rol $e484
$18:b915  23 b0		 and $b0,s
$18:b917  3b			tsc
$18:b918  87 11		 sta [$11]
$18:b91a  14 be		 trb $be
$18:b91c  e3 90		 sbc $90,s
$18:b91e  ff 7f f0 38   sbc $38f07f,x
$18:b922  04 46		 tsb $46
$18:b924  9a			txs
$18:b925  9b			txy
$18:b926  49 da 88	  eor #$88da
$18:b929  7f 86 a1 38   adc $38a186,x
$18:b92d  92 b4		 sta ($b4)
$18:b92f  8f 24 ad 01   sta $01ad24
$18:b933  d8			cld
$18:b934  20 49 7a	  jsr $7a49
$18:b937  48			pha
$18:b938  92 4e		 sta ($4e)
$18:b93a  82 74 12	  brl $cbb1
$18:b93d  24 cd		 bit $cd
$18:b93f  24 c9		 bit $c9
$18:b941  0e c1 5a	  asl $5ac1
$18:b944  0a			asl a
$18:b945  12 6e		 ora ($6e)
$18:b947  92 a4		 sta ($a4)
$18:b949  95 64		 sta $64,x
$18:b94b  71 25		 adc ($25),y
$18:b94d  59 1e 49	  eor $491e,y
$18:b950  3e 09 d0	  rol $d009,x
$18:b953  40			rti
$18:b954  93 f4		 sta ($f4,s),y
$18:b956  91 24		 sta ($24),y
$18:b958  77 01		 adc [$01],y
$18:b95a  d8			cld
$18:b95b  24 48		 bit $48
$18:b95d  1a			inc a
$18:b95e  49 92 3b	  eor #$3b92
$18:b961  81 44		 sta ($44,x)
$18:b963  14 24		 trb $24
$18:b965  1d 27 49	  ora $4927,x
$18:b968  07 48		 ora [$48]
$18:b96a  e2 41		 sep #$41
$18:b96c  d2 7c		 cmp ($7c)
$18:b96e  81 a4		 sta ($a4,x)
$18:b970  95 a0		 sta $a0,x
$18:b972  2f 41 f9 2e   and $2ef941
$18:b976  50 c6		 bvc $b93e
$18:b978  0c 14 13	  tsb $1314
$18:b97b  00 24		 brk #$24
$18:b97d  95 a4		 sta $a4,x
$18:b97f  91 25		 sta ($25),y
$18:b981  69 26 7d	  adc #$7d26
$18:b984  c4 63		 cpy $63
$18:b986  50 58		 bvc $b9e0
$18:b988  91 fc		 sta ($fc),y
$18:b98a  9f 24 0b 22   sta $220b24,x
$18:b98e  99 02 c8	  sta $c802,y
$18:b991  12 47		 ora ($47)
$18:b993  90 3c		 bcc $b9d1
$18:b995  83 44		 sta $44,s
$18:b997  93 e4		 sta ($e4,s),y
$18:b999  19 47 18	  ora $1847,y
$18:b99c  08			php
$18:b99d  51 c6		 eor ($c6),y
$18:b99f  02 94		 cop #$94
$18:b9a1  1d 80 c5	  ora $c580,x
$18:b9a4  07 60		 ora [$60]
$18:b9a6  f9 f7 92	  sbc $92f7,y
$18:b9a9  98			tya
$18:b9aa  c8			iny
$18:b9ab  ca			dex
$18:b9ac  41 92		 eor ($92,x)
$18:b9ae  13 01		 ora ($01,s),y
$18:b9b0  9c 04 24	  stz $2404
$18:b9b3  ef 21 49 3b   sbc $3b4921
$18:b9b7  c8			iny
$18:b9b8  86 4e		 stx $4e
$18:b9ba  f2 1c		 sbc ($1c)
$18:b9bc  f9 2b cb	  sbc $cb2b,y
$18:b9bf  68			pla
$18:b9c0  0d 03 1a	  ora $1a03
$18:b9c3  03 40		 ora $40,s
$18:b9c5  d6 8d		 dec $8d,x
$18:b9c7  90 39		 bcc $ba02
$18:b9c9  a3 64		 lda $64,s
$18:b9cb  0f 68 01 42   ora $420168
$18:b9cf  89 22 d0	  bit #$d022
$18:b9d2  52 09		 eor ($09)
$18:b9d4  34 14		 bit $14,x
$18:b9d6  82 6d 1b	  brl $d546
$18:b9d9  20 a3 46	  jsr $46a3
$18:b9dc  c8			iny
$18:b9dd  2a			rol a
$18:b9de  d0 1a		 bne $b9fa
$18:b9e0  0b			phd
$18:b9e1  34 06		 bit $06,x
$18:b9e3  82 ed 08	  brl $c2d3
$18:b9e6  e0 c3		 cpx #$c3
$18:b9e8  42 38		 wdm #$38
$18:b9ea  32 d0		 and ($d0)
$18:b9ec  f2 0d		 sbc ($0d)
$18:b9ee  34 3c		 bit $3c,x
$18:b9f0  83 6d		 sta $6d,s
$18:b9f2  18			clc
$18:b9f3  e0 e3		 cpx #$e3
$18:b9f5  44 08 3a	  mvp $3a,$08
$18:b9f8  d1 02		 cmp ($02),y
$18:b9fa  0f 34 40 83   ora $834034
$18:b9fe  ed 10 20	  sbc $2010
$18:ba01  03 44		 ora $44,s
$18:ba03  08			php
$18:ba04  02 d1		 cop #$d1
$18:ba06  ff 8e 14 12   sbc $12148e,x
$18:ba0a  93 8c		 sta ($8c,s),y
$18:ba0c  8d a4 51	  sta $51a4
$18:ba0f  21 a9		 and ($a9,x)
$18:ba11  14 48		 trb $48
$18:ba13  7b			tdc
$18:ba14  e8			inx
$18:ba15  e1 1c		 sbc ($1c,x)
$18:ba17  91 54		 sta ($54),y
$18:ba19  84 64		 sty $64
$18:ba1b  5d 20 68	  eor $6820,x
$18:ba1e  11 c0		 ora ($c0),y
$18:ba20  ca			dex
$18:ba21  43 32		 eor $32,s
$18:ba23  36 90		 rol $90,x
$18:ba25  74 0f		 stz $0f,x
$18:ba27  20 75 22	  jsr $2275
$18:ba2a  19 03 c8	  ora $c803,y
$18:ba2d  16 0c		 asl $0c,x
$18:ba2f  34 29		 bit $29,x
$18:ba31  90 7c		 bcc $baaf
$18:ba33  91 e4		 sta ($e4),y
$18:ba35  27 24		 and [$24]
$18:ba37  79 27 7d	  adc $7d27,y
$18:ba3a  2c ab 52	  bit $52ab
$18:ba3d  41 90		 eor ($90,x)
$18:ba3f  3c 97 60	  bit $6097,x
$18:ba42  e2 00		 sep #$00
$18:ba44  b9 24 c8	  lda $c824,y
$18:ba47  3e 49 32	  rol $3249,x
$18:ba4a  13 92		 ora ($92,s),y
$18:ba4c  4c 9b a5	  jmp $a59b
$18:ba4f  07 71		 ora [$71]
$18:ba51  0b			phd
$18:ba52  88			dey
$18:ba53  2b			pld
$18:ba54  d4 d7		 pei ($d7)
$18:ba56  10 44		 bpl $ba9c
$18:ba58  16 ca		 asl $ca,x
$18:ba5a  bb			tyx
$18:ba5b  25 c9		 and $c9
$18:ba5d  7d 3f eb	  adc $eb3f,x
$18:ba60  74 66		 stz $66,x
$18:ba62  b7 e1		 lda [$e1],y
$18:ba64  9c ad b2	  stz $b2ad
$18:ba67  70 c4		 bvs $ba2d
$18:ba69  19 68 ab	  ora $ab68,y
$18:ba6c  1a			inc a
$18:ba6d  f8			sed
$18:ba6e  37 9c		 and [$9c],y
$18:ba70  0e 0b 92	  asl $920b
$18:ba73  86 2d		 stx $2d
$18:ba75  94 2e		 sty $2e,x
$18:ba77  d0 85		 bne $b9fe
$18:ba79  f3 89		 sbc ($89,s),y
$18:ba7b  c0 57		 cpy #$57
$18:ba7d  0f 3f 61 48   ora $48613f
$18:ba81  1e 19 a0	  asl $a019,x
$18:ba84  5d c7 3a	  eor $3ac7,x
$18:ba87  09 d8 4e	  ora #$4ed8
$18:ba8a  83 d8		 sta $d8,s
$18:ba8c  82 ad 0e	  brl $c93c
$18:ba8f  f5 4d		 sbc $4d,x
$18:ba91  48			pha
$18:ba92  a6 3d		 ldx $3d
$18:ba94  30 ba		 bmi $ba50
$18:ba96  44 c2 f0	  mvp $f0,$c2
$18:ba99  1f 43 01 24   ora $240143,x
$18:ba9d  1f 72 9a b3   ora $b39a72,x
$18:baa1  4e 8d 39	  lsr $398d
$18:baa4  67 ec		 adc [$ec]
$18:baa6  4f 6a fb 9b   eor $9bfb6a
$18:baaa  c3 21		 cmp $21,s
$18:baac  f1 7d		 sbc ($7d),y
$18:baae  7a			ply
$18:baaf  c5 a2		 cmp $a2
$18:bab1  8f 25 78 b0   sta $b07825
$18:bab5  8f c6 9e 45   sta $459ec6
$18:bab9  f2 b5		 sbc ($b5)
$18:babb  ca			dex
$18:babc  4c 9e 1b	  jmp $1b9e
$18:babf  6a			ror a
$18:bac0  29 53 51	  and #$5153
$18:bac3  be 9e f5	  ldx $f59e,y
$18:bac6  7f 95 ae b4   adc $b4ae95,x
$18:baca  ce f0 db	  dec $dbf0
$18:bacd  5f 4d 8b a7   eor $a78b4d,x
$18:bad1  42 28		 wdm #$28
$18:bad3  6c 1e e8	  jmp ($e81e)
$18:bad6  01 07		 ora ($07,x)
$18:bad8  fa			plx
$18:bad9  00 41		 brk #$41
$18:badb  ea			nop
$18:badc  81 72		 sta ($72,x)
$18:bade  08			php
$18:badf  b3 1c		 lda ($1c,s),y
$18:bae1  03 68		 ora $68,s
$18:bae3  c7 00		 cmp [$00]
$18:bae5  8b			phb
$18:bae6  01 d0		 ora ($d0,x)
$18:bae8  76 4f		 ror $4f,x
$18:baea  f2 82		 sbc ($82)
$18:baec  be 8f da	  ldx $da8f,y
$18:baef  84 18		 sty $18
$18:baf1  79 c0 58	  adc $58c0,y
$18:baf4  e0 51		 cpx #$51
$18:baf6  60			rts
$18:baf7  08			php
$18:baf8  14 50		 trb $50
$18:bafa  2e 45 12	  rol $1245
$18:bafd  83 bc		 sta $bc,s
$18:baff  ca			dex
$18:bb00  01 17		 ora ($17,x)
$18:bb02  a7 c0		 lda [$c0]
$18:bb04  8e 87 41	  stx $4187
$18:bb07  a7 92		 lda [$92]
$18:bb09  d2 e5		 cmp ($e5)
$18:bb0b  4f 81 9d 36   eor $369d81
$18:bb0f  22 84 53 9a   jsl $9a5384
$18:bb13  68			pla
$18:bb14  d4 4a		 pei ($4a)
$18:bb16  a1 6e		 lda ($6e,x)
$18:bb18  a5 3e		 lda $3e
$18:bb1a  3e 84 50	  rol $5084,x
$18:bb1d  08			php
$18:bb1e  22 c8 f6 10   jsl $10f6c8
$18:bb22  5a			phy
$18:bb23  83 15		 sta $15,s
$18:bb25  29 75 06	  and #$0675
$18:bb28  1a			inc a
$18:bb29  7f bf f9 16   adc $16f9bf,x
$18:bb2d  61 b6		 adc ($b6,x)
$18:bb2f  c3 84		 cmp $84,s
$18:bb31  d4 36		 pei ($36)
$18:bb33  d8			cld
$18:bb34  15 c3		 ora $c3,x
$18:bb36  f4 cc 17	  pea $17cc
$18:bb39  59 45 aa	  eor $aa45,y
$18:bb3c  27 16		 and [$16]
$18:bb3e  99 3e 1e	  sta $1e3e,y
$18:bb41  f1 51		 sbc ($51),y
$18:bb43  39 a6 8a	  and $8aa6,y
$18:bb46  a2 55		 ldx #$55
$18:bb48  27 f9		 and [$f9]
$18:bb4a  05 50		 ora $50
$18:bb4c  16 01		 asl $01,x
$18:bb4e  5f 7e 28 35   eor $35287e,x
$18:bb52  80 ac		 bra $bb00
$18:bb54  25 c0		 and $c0
$18:bb56  9f 04 e1 86   sta $86e104,x
$18:bb5a  40			rti
$18:bb5b  30 6d		 bmi $bbca
$18:bb5d  80 2c		 bra $bb8b
$18:bb5f  0e e4 09	  asl $09e4
$18:bb62  83 ea		 sta $ea,s
$18:bb64  1e fc 94	  asl $94fc,x
$18:bb67  27 54		 and [$54]
$18:bb69  2c 92 3c	  bit $3c92
$18:bb6c  99 20 43	  sta $4320,y
$18:bb6f  65 7a		 adc $7a
$18:bb71  2b			pld
$18:bb72  7c b4 20	  jmp ($20b4,x)
$18:bb75  36 e6		 rol $e6,x
$18:bb77  3e 1e 25	  rol $251e,x
$18:bb7a  52 01		 eor ($01)
$18:bb7c  a4 06		 ldy $06
$18:bb7e  01 35		 ora ($35,x)
$18:bb80  76 2b		 ror $2b,x
$18:bb82  8c 34 ae	  sty $ae34
$18:bb85  c3 40		 cmp $40,s
$18:bb87  95 b4		 sta $b4,x
$18:bb89  00 af		 brk #$af
$18:bb8b  30 a8		 bmi $bb35
$18:bb8d  80 15		 bra $bba4
$18:bb8f  c6 18		 dec $18
$18:bb91  97 63		 sta [$63],y
$18:bb93  f0 5e		 beq $bbf3
$18:bb95  cf 31 a9 80   cmp $80a931
$18:bb99  5b			tcd
$18:bb9a  f2 0a		 sbc ($0a)
$18:bb9c  7e e8 51	  ror $51e8,x
$18:bb9f  e2 a3		 sep #$a3
$18:bba1  23 33		 and $33,s
$18:bba3  95 34		 sta $34,x
$18:bba5  a0 f8		 ldy #$f8
$18:bba7  52 83		 eor ($83)
$18:bba9  ef 46 42 f3   sbc $f34246
$18:bbad  07 18		 ora [$18]
$18:bbaf  7e bf e5	  ror $e5bf,x
$18:bbb2  90 38		 bcc $bbec
$18:bbb4  97 f0		 sta [$f0],y
$18:bbb6  ec bf e3	  cpx $e3bf
$18:bbb9  f2 95		 sbc ($95)
$18:bbbb  c8			iny
$18:bbbc  e2 50		 sep #$50
$18:bbbe  44 72 c1	  mvp $c1,$72
$18:bbc1  91 cb		 sta ($cb),y
$18:bbc3  08			php
$18:bbc4  47 2c		 eor [$2c]
$18:bbc6  28			plp
$18:bbc7  b0 6f		 bcs $bc38
$18:bbc9  30 79		 bmi $bc44
$18:bbcb  81 d5		 sta ($d5,x)
$18:bbcd  02 20		 cop #$20
$18:bbcf  7d 40 88	  adc $8840,x
$18:bbd2  21 50		 and ($50,x)
$18:bbd4  22 08 d4 08   jsl $08d408
$18:bbd8  82 55 02	  brl $be30
$18:bbdb  20 9d 40	  jsr $409d
$18:bbde  88			dey
$18:bbdf  29 50		 and #$50
$18:bbe1  22 0a d6 32   jsl $32d60a
$18:bbe5  87 db		 sta [$db]
$18:bbe7  fe 63 03	  inc $0363,x
$18:bbea  89 7e		 bit #$7e
$18:bbec  1f 4a 75 07   ora $07754a,x
$18:bbf0  da			phx
$18:bbf1  1f 40 16 86   ora $861640,x
$18:bbf5  12 38		 ora ($38)
$18:bbf7  94 08		 sty $08,x
$18:bbf9  34 a9		 bit $a9,x
$18:bbfb  50 05		 bvc $bc02
$18:bbfd  a2 74		 ldx #$74
$18:bbff  0c 64 b3	  tsb $b364
$18:bc02  27 ca		 and [$ca]
$18:bc04  3b			tsc
$18:bc05  40			rti
$18:bc06  02 8b		 cop #$8b
$18:bc08  52 1e		 eor ($1e)
$18:bc0a  a0 45		 ldy #$45
$18:bc0c  19 a4 55	  ora $55a4,y
$18:bc0f  41 0a		 eor ($0a,x)
$18:bc11  35 48		 and $48,x
$18:bc13  aa			tax
$18:bc14  83 16		 sta $16,s
$18:bc16  63 87		 adc $87,s
$18:bc18  e7 ff		 sbc [$ff]
$18:bc1a  bd 02 0b	  lda $0b02,x
$18:bc1d  1c 3f 67	  trb $673f
$18:bc20  e5 fe		 sbc $fe
$18:bc22  9f 95 56 07   sta $075695,x
$18:bc26  f4 81 c0	  pea $c081
$18:bc29  0f e9 05 4f   ora $4f05e9
$18:bc2d  2c 1d 3c	  bit $3c1d
$18:bc30  b0 94		 bcs $bbc6
$18:bc32  f0 9d		 beq $bbd1
$18:bc34  d3 ee		 cmp ($ee,s),y
$18:bc36  7e 53 ef	  ror $ef53,x
$18:bc39  b2 14		 lda ($14)
$18:bc3b  e2 09		 sep #$09
$18:bc3d  7f 54 38 bc   adc $bc3854,x
$18:bc41  15 a0		 ora $a0,x
$18:bc43  fe 2b 4d	  inc $4d2b,x
$18:bc46  4d ce 0f	  eor $0fce
$18:bc49  e2 fe		 sep #$fe
$18:bc4b  0d 06 1e	  ora $1e06
$18:bc4e  5a			phy
$18:bc4f  12 d0		 ora ($d0)
$18:bc51  4b			phk
$18:bc52  6a			ror a
$18:bc53  82 f0 02	  brl $bf46
$18:bc56  b3 f5		 lda ($f5,s),y
$18:bc58  9f 6d a1 02   sta $02a16d,x
$18:bc5c  2d e8 2c	  and $2ce8
$18:bc5f  20 f4 d5	  jsr $d5f4
$18:bc62  85 9c		 sta $9c
$18:bc64  72 02		 adc ($02)
$18:bc66  b6 7d		 ldx $7d,y
$18:bc68  b7 64		 lda [$64],y
$18:bc6a  08			php
$18:bc6b  bf 81 d3 cc   lda $ccd381,x
$18:bc6f  2a			rol a
$18:bc70  ab			plb
$18:bc71  92 31		 sta ($31)
$18:bc73  a1 65		 lda ($65,x)
$18:bc75  81 ad		 sta ($ad,x)
$18:bc77  84 39		 sty $39
$18:bc79  08			php
$18:bc7a  3d 34 07	  and $0734,x
$18:bc7d  21 1b		 and ($1b,x)
$18:bc7f  04 42		 tsb $42
$18:bc81  01 18		 ora ($18,x)
$18:bc83  1b			tcs
$18:bc84  0a			asl a
$18:bc85  74 13		 stz $13,x
$18:bc87  a1 04		 lda ($04,x)
$18:bc89  1b			tcs
$18:bc8a  04 22		 tsb $22
$18:bc8c  01 06		 ora ($06,x)
$18:bc8e  85 42		 sta $42
$18:bc90  95 05		 sta $05,x
$18:bc92  0e 81 46	  asl $4681
$18:bc95  a0 07		 ldy #$07
$18:bc97  52 55		 eor ($55)
$18:bc99  02 d8		 cop #$d8
$18:bc9b  95 40		 sta $40,x
$18:bc9d  9d 04 de	  sta $de04,x
$18:bca0  c1 e0		 cmp ($e0,x)
$18:bca2  30 88		 bmi $bc2c
$18:bca4  42 b8		 wdm #$b8
$18:bca6  5a			phy
$18:bca7  80 9d		 bra $bc46
$18:bca9  05 aa		 ora $aa
$18:bcab  c0 97		 cpy #$97
$18:bcad  a9 12		 lda #$12
$18:bcaf  62 72 a8	  per $6524
$18:bcb2  1a			inc a
$18:bcb3  c1 0b		 cmp ($0b,x)
$18:bcb5  5f a4 6d 6c   eor $6c6da4,x
$18:bcb9  8a			txa
$18:bcba  70 5f		 bvs $bd1b
$18:bcbc  1c 51 dd	  trb $dd51
$18:bcbf  f0 08		 beq $bcc9
$18:bcc1  14 3a		 trb $3a
$18:bcc3  54 a8 28	  mvn $28,$a8
$18:bcc6  54 1a 56	  mvn $56,$1a
$18:bcc9  b6 f4		 ldx $f4,y
$18:bccb  ee c1 21	  inc $21c1
$18:bcce  82 c3 86	  brl $4394
$18:bcd1  41 06		 eor ($06,x)
$18:bcd3  6a			ror a
$18:bcd4  e6 f5		 inc $f5
$18:bcd6  1b			tcs
$18:bcd7  c0 61		 cpy #$61
$18:bcd9  e2 c3		 sep #$c3
$18:bcdb  84 c1		 sty $c1
$18:bcdd  cb			wai
$18:bcde  aa			tax
$18:bcdf  10 b9		 bpl $bc9a
$18:bce1  01 21		 ora ($21,x)
$18:bce3  60			rts
$18:bce4  e6 c0		 inc $c0
$18:bce6  83 40		 sta $40,s
$18:bce8  a2 10		 ldx #$10
$18:bcea  89 43		 bit #$43
$18:bcec  f0 e2		 beq $bcd0
$18:bcee  12 91		 ora ($91)
$18:bcf0  b9 c6 23	  lda $23c6,y
$18:bcf3  23 d3		 and $d3,s
$18:bcf5  84 17		 sty $17
$18:bcf7  41 58		 eor ($58,x)
$18:bcf9  62 c0 1a	  per $d7bc
$18:bcfc  8c 1e 13	  sty $131e
$18:bcff  06 1a		 asl $1a
$18:bd01  11 14		 ora ($14),y
$18:bd03  22 c6 c1 4d   jsl $4dc1c6
$18:bd07  81 1c		 sta ($1c,x)
$18:bd09  09 64		 ora #$64
$18:bd0b  45 01		 eor $01
$18:bd0d  c8			iny
$18:bd0e  ab			plb
$18:bd0f  c2 03		 rep #$03
$18:bd11  1f 16 14 42   ora $421416,x
$18:bd15  13 17		 ora ($17,s),y
$18:bd17  2e 91 14	  rol $1491
$18:bd1a  59 a4 a8	  eor $a8a4,y
$18:bd1d  08			php
$18:bd1e  83 50		 sta $50,s
$18:bd20  5b			tcd
$18:bd21  43 10		 eor $10,s
$18:bd23  87 3f		 sta [$3f]
$18:bd25  ca			dex
$18:bd26  31 08		 and ($08),y
$18:bd28  8f 3f c9 36   sta $36c93f
$18:bd2c  12 e3		 ora ($e3)
$18:bd2e  68			pla
$18:bd2f  c2 13		 rep #$13
$18:bd31  61 2d		 adc ($2d,x)
$18:bd33  28			plp
$18:bd34  88			dey
$18:bd35  20 5b 70	  jsr $705b
$18:bd38  a8			tay
$18:bd39  07 39		 ora [$39]
$18:bd3b  aa			tax
$18:bd3c  01 dc		 ora ($dc,x)
$18:bd3e  70 80		 bvs $bcc0
$18:bd40  e0 b3 44	  cpx #$44b3
$18:bd43  72 0f		 adc ($0f)
$18:bd45  c5 0c		 cmp $0c
$18:bd47  10 54		 bpl $bd9d
$18:bd49  e5 8e		 sbc $8e
$18:bd4b  32 28		 and ($28)
$18:bd4d  0d 01 6a	  ora $6a01
$18:bd50  21 81		 and ($81,x)
$18:bd52  a0 1d 49	  ldy #$491d
$18:bd55  b5 2d		 lda $2d,x
$18:bd57  a0 16 9b	  ldy #$9b16
$18:bd5a  68			pla
$18:bd5b  06 86		 asl $86
$18:bd5d  d2 07		 cmp ($07)
$18:bd5f  a9 89		 lda #$89
$18:bd61  85 fa		 sta $fa
$18:bd63  45 52		 eor $52
$18:bd65  30 01		 bmi $bd68
$18:bd67  6c e5 c5	  jmp ($c5e5)
$18:bd6a  a2 05 09	  ldx #$0905
$18:bd6d  68			pla
$18:bd6e  80 62		 bra $bdd2
$18:bd70  61 56		 adc ($56,x)
$18:bd72  81 34		 sta ($34,x)
$18:bd74  82 0e d0	  brl $8d85
$18:bd77  08			php
$18:bd78  6c 2c 72	  jmp ($722c)
$18:bd7b  0a			asl a
$18:bd7c  c1 46		 cmp ($46,x)
$18:bd7e  84 3a		 sty $3a
$18:bd80  05 09		 ora $09
$18:bd82  6a			ror a
$18:bd83  8c 61 80	  sty $8061
$18:bd86  06 e3		 asl $e3
$18:bd88  84 c1		 sty $c1
$18:bd8a  de 00 70	  dec $7000,x
$18:bd8d  28			plp
$18:bd8e  79 d4 0f	  adc $0fd4,y
$18:bd91  c5 08		 cmp $08
$18:bd93  41 a4		 eor ($a4,x)
$18:bd95  01 fc		 ora ($fc,x)
$18:bd97  10 35		 bpl $bdce
$18:bd99  4c c1 58	  jmp $58c1
$18:bd9c  62 b8 48	  per $0657
$18:bd9f  5b			tcd
$18:bda0  35 1f		 and $1f,x
$18:bda2  a0 d5 37	  ldy #$37d5
$18:bda5  38			sec
$18:bda6  37 0d		 and [$0d],y
$18:bda8  ce 0e 32	  dec $320e
$18:bdab  57 12		 eor [$12],y
$18:bdad  b1 9c		 lda ($9c),y
$18:bdaf  e1 01		 sbc ($01,x)
$18:bdb1  61 8c		 adc ($8c,x)
$18:bdb3  22 60 25 23   jsl $232560
$18:bdb7  70 16		 bvs $bdcf
$18:bdb9  85 18		 sta $18
$18:bdbb  10 38		 bpl $bdf5
$18:bdbd  6c e0 2f	  jmp ($2fe0)
$18:bdc0  eb			xba
$18:bdc1  c1 99		 cmp ($99,x)
$18:bdc3  0b			phd
$18:bdc4  12 84		 ora ($84)
$18:bdc6  ae 08 0c	  ldx $0c08
$18:bdc9  1c 6f cf	  trb $cf6f
$18:bdcc  30 13		 bmi $bde1
$18:bdce  1c d0 58	  trb $58d0
$18:bdd1  94 41		 sty $41,x
$18:bdd3  39 35 42	  and $4235,y
$18:bdd6  72 27		 adc ($27)
$18:bdd8  26 70		 rol $70
$18:bdda  52 45		 eor ($45)
$18:bddc  c4 af		 cpy $af
$18:bdde  09 b0		 ora #$b0
$18:bde0  ea			nop
$18:bde1  e0 82 72	  cpx #$7282
$18:bde4  83 42		 sta $42,s
$18:bde6  a9 02		 lda #$02
$18:bde8  72 60		 adc ($60)
$18:bdea  05 60		 ora $60
$18:bdec  4b			phk
$18:bded  e9 1d		 sbc #$1d
$18:bdef  82 c2 d4	  brl $92b4
$18:bdf2  47 0d		 eor [$0d]
$18:bdf4  81 aa		 sta ($aa,x)
$18:bdf6  54 9d 05	  mvn $05,$9d
$18:bdf9  fb			xce
$18:bdfa  52 0b		 eor ($0b)
$18:bdfc  cc 14 46	  cpy $4614
$18:bdff  66 05		 ror $05
$18:be01  4a			lsr a
$18:be02  9c 61 12	  stz $1261
$18:be05  90 a3		 bcc $bdaa
$18:be07  28			plp
$18:be08  c5 ce		 cmp $ce
$18:be0a  42 66		 wdm #$66
$18:be0c  28			plp
$18:be0d  31 90		 and ($90),y
$18:be0f  21 4f		 and ($4f,x)
$18:be11  34 11		 bit $11,x
$18:be13  83 ec		 sta $ec,s
$18:be15  c2 80		 rep #$80
$18:be17  6f 30 a0 41   adc $41a030
$18:be1b  e0 20 b2	  cpx #$b220
$18:be1e  85 1f		 sta $1f
$18:be20  42 6e		 wdm #$6e
$18:be22  5d 18 94	  eor $9418,x
$18:be25  1e 13 46	  asl $4613,x
$18:be28  32 9c		 and ($9c)
$18:be2a  80 c6		 bra $bdf2
$18:be2c  a8			tay
$18:be2d  92 7d		 sta ($7d)
$18:be2f  03 d4		 ora $d4,s
$18:be31  8b			phb
$18:be32  60			rts
$18:be33  e7 05		 sbc [$05]
$18:be35  48			pha
$18:be36  95 84		 sta $84,x
$18:be38  06 4e		 asl $4e
$18:be3a  b2 05		 lda ($05)
$18:be3c  8b			phb
$18:be3d  98			tya
$18:be3e  0b			phd
$18:be3f  61 0e		 adc ($0e,x)
$18:be41  e0 1d 85	  cpx #$851d
$18:be44  f4 11 e3	  pea $e311
$18:be47  e1 39		 sbc ($39,x)
$18:be49  82 5c 7c	  brl $3aa8
$18:be4c  07 d0		 ora [$d0]
$18:be4e  c6 25		 dec $25
$18:be50  bc 02 c0	  ldy $c002,x
$18:be53  39 c0 a1	  and $a1c0,y
$18:be56  2f a0 2e 9b   and $9b2ea0
$18:be5a  e8			inx
$18:be5b  0c 86 f3	  tsb $f386
$18:be5e  10 19		 bpl $be79
$18:be60  09 40		 ora #$40
$18:be62  e4 a8		 cpx $a8
$18:be64  e2 45		 sep #$45
$18:be66  9c b0 f8	  stz $f8b0
$18:be69  05 d0		 ora $d0
$18:be6b  63 0e		 adc $0e,s
$18:be6d  01 cc		 ora ($cc,x)
$18:be6f  48			pha
$18:be70  f0 68		 beq $beda
$18:be72  01 3c		 ora ($3c,x)
$18:be74  4a			lsr a
$18:be75  12 77		 ora ($77)
$18:be77  22 f8 9d c0   jsl $c09df8
$18:be7b  c8			iny
$18:be7c  66 11		 ror $11
$18:be7e  36 11		 rol $11,x
$18:be80  54 0e 46	  mvn $46,$0e
$18:be83  cb			wai
$18:be84  26 b0		 rol $b0
$18:be86  99 00 f2	  sta $f200,y
$18:be89  2d 02 40	  and $4002
$18:be8c  0b			phd
$18:be8d  41 25		 eor ($25,x)
$18:be8f  cd 73 69	  cmp $6973
$18:be92  09 2c		 ora #$2c
$18:be94  e0 e7 52	  cpx #$52e7
$18:be97  35 83		 and $83,x
$18:be99  ac cd 20	  ldy $20cd
$18:be9c  f2 30		 sbc ($30)
$18:be9e  90 3e		 bcc $bede
$18:bea0  4c b0 00	  jmp $00b0
$18:bea3  03 81		 ora $81,s
$18:bea5  43 a8		 eor $a8,s
$18:bea7  e6 02		 inc $02
$18:bea9  83 c2		 sta $c2,s
$18:beab  6a			ror a
$18:beac  c8			iny
$18:bead  42 29		 wdm #$29
$18:beaf  05 5d		 ora $5d
$18:beb1  76 89		 ror $89,x
$18:beb3  75 82		 adc $82,x
$18:beb5  a5 c8		 lda $c8
$18:beb7  5e 8f d1	  lsr $d18f,x
$18:beba  79 12 78	  adc $7812,y
$18:bebd  1f 06 b1 07   ora $07b106,x
$18:bec1  f9 c0 09	  sbc $09c0,y
$18:bec4  66 e1		 ror $e1
$18:bec6  11 13		 ora ($13),y
$18:bec8  41 1d		 eor ($1d,x)
$18:beca  81 01		 sta ($01,x)
$18:becc  83 ac		 sta $ac,s
$18:bece  42 dc		 wdm #$dc
$18:bed0  9b			txy
$18:bed1  27 10		 and [$10]
$18:bed3  5f 9e 62 ec   eor $ec629e,x
$18:bed7  08			php
$18:bed8  44 e9 52	  mvp $52,$e9
$18:bedb  4e 40 a5	  lsr $a540
$18:bede  23 79		 and $79,s
$18:bee0  02 2a		 cop #$2a
$18:bee2  02 09		 cop #$09
$18:bee4  0a			asl a
$18:bee5  9d a7 8b	  sta $8ba7,x
$18:bee8  04 a6		 tsb $a6
$18:beea  23 6e		 and $6e,s
$18:beec  0c 9b 4b	  tsb $4b9b
$18:beef  7a			ply
$18:bef0  89 2f		 bit #$2f
$18:bef2  ea			nop
$18:bef3  94 9f		 sty $9f,x
$18:bef5  2c 12 9c	  bit $9c12
$18:bef8  ab			plb
$18:bef9  23 60		 and $60,s
$18:befb  47 d8		 eor [$d8]
$18:befd  a9 2f		 lda #$2f
$18:beff  44 82 e7	  mvp $e7,$82
$18:bf02  61 50		 adc ($50,x)
$18:bf04  c8			iny
$18:bf05  25 b1		 and $b1
$18:bf07  58			cli
$18:bf08  30 21		 bmi $bf2b
$18:bf0a  58			cli
$18:bf0b  5b			tcd
$18:bf0c  54 60 1a	  mvn $1a,$60
$18:bf0f  05 69		 ora $69
$18:bf11  86 81		 stx $81
$18:bf13  68			pla
$18:bf14  50 34		 bvc $bf4a
$18:bf16  7e 42 20	  ror $2042,x
$18:bf19  63 22		 adc $22,s
$18:bf1b  38			sec
$18:bf1c  84 2c		 sty $2c
$18:bf1e  56 50		 lsr $50,x
$18:bf20  12 20		 ora ($20)
$18:bf22  35 cc		 and $cc,x
$18:bf24  88			dey
$18:bf25  0d ef 55	  ora $55ef
$18:bf28  94 36		 sty $36,x
$18:bf2a  06 2d		 asl $2d
$18:bf2c  28			plp
$18:bf2d  01 fc		 ora ($fc,x)
$18:bf2f  06 82		 asl $82
$18:bf31  ff f0 84 38   sbc $3884f0,x
$18:bf35  8a			txa
$18:bf36  32 73		 and ($73)
$18:bf38  a8			tay
$18:bf39  44 26 18	  mvp $18,$26
$18:bf3c  0c 28 54	  tsb $5428
$18:bf3f  1e 38 7b	  asl $7b38,x
$18:bf42  28			plp
$18:bf43  72 01		 adc ($01)
$18:bf45  18			clc
$18:bf46  a0 88 48	  ldy #$4888
$18:bf49  4a			lsr a
$18:bf4a  3c e1 29	  bit $29e1,x
$18:bf4d  51 3b		 eor ($3b),y
$18:bf4f  11 c8		 ora ($c8),y
$18:bf51  0e c4 fa	  asl $fac4
$18:bf54  00 70		 brk #$70
$18:bf56  1b			tcs
$18:bf57  c0 fc 11	  cpy #$11fc
$18:bf5a  31 68		 and ($68),y
$18:bf5c  9c 81 de	  stz $de81
$18:bf5f  03 41		 ora $41,s
$18:bf61  54 01 c4	  mvn $c4,$01
$18:bf64  11 e2		 ora ($e2),y
$18:bf66  e8			inx
$18:bf67  18			clc
$18:bf68  82 58 a3	  brl $62c3
$18:bf6b  11 88		 ora ($88),y
$18:bf6d  45 ac		 eor $ac
$18:bf6f  0e 52 08	  asl $0852
$18:bf72  05 ec		 ora $ec
$18:bf74  f8			sed
$18:bf75  31 00		 and ($00),y
$18:bf77  90 5f		 bcc $bfd8
$18:bf79  1d 64 12	  ora $1264,x
$18:bf7c  0b			phd
$18:bf7d  eb			xba
$18:bf7e  75 53		 adc $53,x
$18:bf80  42 e7		 wdm #$e7
$18:bf82  78			sei
$18:bf83  5b			tcd
$18:bf84  c5 21		 cmp $21
$18:bf86  6f 84 88 3f   adc $3f8884
$18:bf8a  d2 10		 cmp ($10)
$18:bf8c  06 48		 asl $48
$18:bf8e  00 34		 brk #$34
$18:bf90  dd a1 59	  cmp $59a1,x
$18:bf93  03 90		 ora $90,s
$18:bf95  10 2b		 bpl $bfc2
$18:bf97  38			sec
$18:bf98  07 91		 ora [$91]
$18:bf9a  46 2d		 lsr $2d
$18:bf9c  78			sei
$18:bf9d  05 71		 ora $71
$18:bf9f  04 81		 tsb $81
$18:bfa1  58			cli
$18:bfa2  8e a3 8a	  stx $8aa3
$18:bfa5  b1 89		 lda ($89),y
$18:bfa7  c4 07		 cpy $07
$18:bfa9  b0 7c		 bcs $c027
$18:bfab  1a			inc a
$18:bfac  88			dey
$18:bfad  1f e6 a8 00   ora $00a8e6,x
$18:bfb1  31 81		 and ($81),y
$18:bfb3  00 d0		 brk #$d0
$18:bfb5  06 33		 asl $33
$18:bfb7  bd 98 80	  lda $8098,x
$18:bfba  08			php
$18:bfbb  0e 10 be	  asl $be10
$18:bfbe  18			clc
$18:bfbf  80 b0		 bra $bf71
$18:bfc1  0e 10 be	  asl $be10
$18:bfc4  98			tya
$18:bfc5  84 d9		 sty $d9
$18:bfc7  10 66		 bpl $c02f
$18:bfc9  88			dey
$18:bfca  9e 90 54	  stz $5490,x
$18:bfcd  08			php
$18:bfce  23 5f		 and $5f,s
$18:bfd0  0a			asl a
$18:bfd1  28			plp
$18:bfd2  8e 04 06	  stx $0604
$18:bfd5  18			clc
$18:bfd6  34 09		 bit $09,x
$18:bfd8  e6 10		 inc $10
$18:bfda  d6 c9		 dec $c9,x
$18:bfdc  01 02		 ora ($02,x)
$18:bfde  3b			tsc
$18:bfdf  00 82		 brk #$82
$18:bfe1  09 4c		 ora #$4c
$18:bfe3  e0 90 55	  cpx #$5590
$18:bfe6  e8			inx
$18:bfe7  41 06		 eor ($06,x)
$18:bfe9  80 7c		 bra $c067
$18:bfeb  28			plp
$18:bfec  60			rts
$18:bfed  ec 10 64	  cpx $6410
$18:bff0  e8			inx
$18:bff1  02 48		 cop #$48
$18:bff3  11 45		 ora ($45),y
$18:bff5  d0 02		 bne $bff9
$18:bff7  a0 26 14	  ldy #$1426
$18:bffa  32 0f		 and ($0f)
$18:bffc  09 87		 ora #$87
$18:bffe  8a			txa
$18:bfff  44 74 07	  mvp $07,$74
$18:c002  61 38		 adc ($38,x)
$18:c004  98			tya
$18:c005  14 55		 trb $55
$18:c007  43 00		 eor $00,s
$18:c009  b4 a8		 ldy $a8,x
$18:c00b  4c 56 1c	  jmp $1c56
$18:c00e  07 59		 ora [$59]
$18:c010  da			phx
$18:c011  8c 46 39	  sty $3946
$18:c014  01 a0		 ora ($a0,x)
$18:c016  1c 4c e0	  trb $e04c
$18:c019  90 35		 bcc $c050
$18:c01b  e9 22		 sbc #$22
$18:c01d  02 d0		 cop #$d0
$18:c01f  bd 23 b0	  lda $b023,x
$18:c022  5e 0a 27	  lsr $270a,x
$18:c025  00 bc		 brk #$bc
$18:c027  94 0c		 sty $0c,x
$18:c029  36 42		 rol $42,x
$18:c02b  15 5f		 ora $5f,x
$18:c02d  0c 42 f5	  tsb $f542
$18:c030  40			rti
$18:c031  5a			phy
$18:c032  94 22		 sty $22,x
$18:c034  f4 42 14	  pea $1442
$18:c037  d8			cld
$18:c038  da			phx
$18:c039  8f 44 1b 0b   sta $0b1b44
$18:c03d  51 0b		 eor ($0b),y
$18:c03f  ca			dex
$18:c040  63 78		 adc $78,s
$18:c042  16 8a		 asl $8a,x
$18:c044  f8			sed
$18:c045  6f 23 b1 2d   adc $2db123
$18:c049  0d a3 00	  ora $00a3
$18:c04c  68			pla
$18:c04d  27 50		 and [$50]
$18:c04f  7e 3f e2	  ror $e23f,x
$18:c052  1a			inc a
$18:c053  3a			dec a
$18:c054  90 a8		 bcc $bffe
$18:c056  4f 40 36 34   eor $343640
$18:c05a  49 a3		 eor #$a3
$18:c05c  40			rti
$18:c05d  f4 29 2b	  pea $2b29
$18:c060  53 15		 eor ($15,s),y
$18:c062  e0 68 06	  cpx #$0668
$18:c065  02 b4		 cop #$b4
$18:c067  23 c4		 and $c4,s
$18:c069  a6 37		 ldx $37
$18:c06b  9e 02 e4	  stz $e402,x
$18:c06e  8d 5c 73	  sta $735c
$18:c071  23 f0		 and $f0,s
$18:c073  8e c5 08	  stx $08c5
$18:c076  48			pha
$18:c077  23 1c		 and $1c,s
$18:c079  9b			txy
$18:c07a  7f 4b 62 ce   adc $ce624b,x
$18:c07e  05 31		 ora $31
$18:c080  5a			phy
$18:c081  0f 42 5a 1b   ora $1b5a42
$18:c085  cb			wai
$18:c086  72 e0		 adc ($e0)
$18:c088  49 d4		 eor #$d4
$18:c08a  b1 16		 lda ($16),y
$18:c08c  40			rti
$18:c08d  72 46		 adc ($46)
$18:c08f  00 fe		 brk #$fe
$18:c091  7f e1 90 08   adc $0890e1,x
$18:c095  94 03		 sty $03,x
$18:c097  ec ba 38	  cpx $38ba
$18:c09a  08			php
$18:c09b  70 81		 bvs $c01e
$18:c09d  c1 60		 cmp ($60,x)
$18:c09f  82 1a 7c	  brl $3cbc
$18:c0a2  1c 17 03	  trb $0317
$18:c0a5  e9 c6		 sbc #$c6
$18:c0a7  8d ca 59	  sta $59ca
$18:c0aa  20 78 d8	  jsr $d878
$18:c0ad  41 84		 eor ($84,x)
$18:c0af  49 0b		 eor #$0b
$18:c0b1  8a			txa
$18:c0b2  4b			phk
$18:c0b3  c1 e3		 cmp ($e3,x)
$18:c0b5  80 53		 bra $c10a
$18:c0b7  a6 40		 ldx $40
$18:c0b9  fa			plx
$18:c0ba  70 a8		 bvs $c064
$18:c0bc  07 f8		 ora [$f8]
$18:c0be  e1 57		 sbc ($57,x)
$18:c0c0  25 38		 and $38
$18:c0c2  82 02 1c	  brl $dcc7
$18:c0c5  58			cli
$18:c0c6  11 92		 ora ($92),y
$18:c0c8  c1 14		 cmp ($14,x)
$18:c0ca  e1 08		 sbc ($08,x)
$18:c0cc  b1 a9		 lda ($a9),y
$18:c0ce  c4 90		 cpy $90
$18:c0d0  37 37		 and [$37],y
$18:c0d2  80 8e		 bra $c062
$18:c0d4  86 e7		 stx $e7
$18:c0d6  44 3f 14	  mvp $14,$3f
$18:c0d9  3e 01 f9	  rol $f901,x
$18:c0dc  38			sec
$18:c0dd  55 91		 eor $91,x
$18:c0df  be 71 18	  ldx $1871,y
$18:c0e2  07 dd		 ora [$dd]
$18:c0e4  34 e4		 bit $e4,x
$18:c0e6  01 ba		 ora ($ba,x)
$18:c0e8  3e c8 52	  rol $52c8,x
$18:c0eb  34 4f		 bit $4f,x
$18:c0ed  ff fe 12 e3   sbc $e312fe,x
$18:c0f1  1f d1 c2 ae   ora $aec2d1,x
$18:c0f5  b0 41		 bcs $c138
$18:c0f7  b0 41		 bcs $c13a
$18:c0f9  dc e2 e0	  jml [$e0e2]
$18:c0fc  27 51		 and [$51]
$18:c0fe  8b			phb
$18:c0ff  86 11		 stx $11
$18:c101  66 7d		 ror $7d
$18:c103  a5 d9		 lda $d9
$18:c105  e8			inx
$18:c106  4f 10 b2 b7   eor $b7b210
$18:c10a  cc 9a ca	  cpy $ca9a
$18:c10d  74 84		 stz $84,x
$18:c10f  59 c5 86	  eor $86c5,y
$18:c112  7e 0a 23	  ror $230a,x
$18:c115  f0 ec		 beq $c103
$18:c117  fc 47 a9	  jsr ($a947,x)
$18:c11a  d9 f0 86	  cmp $86f0,y
$18:c11d  cf 78 85 dd   cmp $dd8578
$18:c121  00 97		 brk #$97
$18:c123  74 3a		 stz $3a,x
$18:c125  5d d1 c9	  eor $c9d1,x
$18:c128  77 4a		 adc [$4a],y
$18:c12a  d8			cld
$18:c12b  91 21		 sta ($21),y
$18:c12d  16 27		 asl $27,x
$18:c12f  da			phx
$18:c130  34 c5		 bit $c5,x
$18:c132  2f f0 8c 08   and $088cf0
$18:c136  90 0b		 bcc $c143
$18:c138  05 81		 ora $81
$18:c13a  a1 23		 lda ($23,x)
$18:c13c  cf 22 f0 27   cmp $27f022
$18:c140  d8			cld
$18:c141  bd c5 bd	  lda $bdc5,x
$18:c144  f8			sed
$18:c145  27 82		 and [$82]
$18:c147  60			rts
$18:c148  9e e9 92	  stz $92e9,x
$18:c14b  7f 26 48 0b   adc $0b4826,x
$18:c14f  70 53		 bvs $c1a4
$18:c151  c8			iny
$18:c152  41 20		 eor ($20,x)
$18:c154  88			dey
$18:c155  b0 c1		 bcs $c118
$18:c157  b3 04		 lda ($04,s),y
$18:c159  2d e2 7f	  and $7fe2
$18:c15c  1c 4e 4c	  trb $4c4e
$18:c15f  88			dey
$18:c160  45 6b		 eor $6b
$18:c162  23 e1		 and $e1,s
$18:c164  8e e0 50	  stx $50e0
$18:c167  63 97		 adc $97,s
$18:c169  a0 fc c7	  ldy #$c7fc
$18:c16c  70 68		 bvs $c1d6
$18:c16e  11 6c		 ora ($6c),y
$18:c170  14 be		 trb $be
$18:c172  b6 f8		 ldx $f8,y
$18:c174  b4 03		 ldy $03,x
$18:c176  ff ff 31 92   sbc $9231ff,x
$18:c17a  f4 4b 43	  pea $434b
$18:c17d  0d c2 3b	  ora $3bc2
$18:c180  0c 0c 05	  tsb $050c
$18:c183  23 82		 and $82,s
$18:c185  e5 0b		 sbc $0b
$18:c187  26 14		 rol $14
$18:c189  07 29		 ora [$29]
$18:c18b  41 61		 eor ($61,x)
$18:c18d  18			clc
$18:c18e  52 c9		 eor ($c9)
$18:c190  08			php
$18:c191  45 ca		 eor $ca
$18:c193  50 d8		 bvc $c16d
$18:c195  06 54		 asl $54
$18:c197  b2 42		 lda ($42)
$18:c199  f1 30		 sbc ($30),y
$18:c19b  1c 61 2e	  trb $2e61
$18:c19e  a0 04 88	  ldy #$8804
$18:c1a1  01 d0		 ora ($d0,x)
$18:c1a3  98			tya
$18:c1a4  00 f3		 brk #$f3
$18:c1a6  84 05		 sty $05
$18:c1a8  50 b4		 bvc $c15e
$18:c1aa  05 54		 ora $54
$18:c1ac  11 99		 ora ($99),y
$18:c1ae  9c 5c a4	  stz $a45c
$18:c1b1  94 01		 sty $01,x
$18:c1b3  89 9d		 bit #$9d
$18:c1b5  44 73 69	  mvp $69,$73
$18:c1b8  e1 82		 sbc ($82,x)
$18:c1ba  41 18		 eor ($18,x)
$18:c1bc  81 87		 sta ($87,x)
$18:c1be  6b			rtl
$18:c1bf  9c 23 10	  stz $1023
$18:c1c2  5c 4c 41 c5   jml $c5414c
$18:c1c6  33 07		 and ($07,s),y
$18:c1c8  84 cc		 sty $cc
$18:c1ca  0e 6e 0c	  asl $0c6e
$18:c1cd  47 4c		 eor [$4c]
$18:c1cf  31 39		 and ($39),y
$18:c1d1  30 c5		 bmi $c198
$18:c1d3  54 cb 17	  mvn $17,$cb
$18:c1d6  13 2c		 ora ($2c,s),y
$18:c1d8  71 4c		 adc ($4c),y
$18:c1da  ba			tsx
$18:c1db  a5 32		 lda $32
$18:c1dd  e3 9b		 sbc $9b,s
$18:c1df  12 04		 ora ($04)
$18:c1e1  05 dc		 ora $dc
$18:c1e3  30 8d		 bmi $c172
$18:c1e5  04 09		 tsb $09
$18:c1e7  ee 2d 50	  inc $502d
$18:c1ea  d8			cld
$18:c1eb  25 05		 and $05
$18:c1ed  d7 fd		 cmp [$fd],y
$18:c1ef  07 ea		 ora [$ea]
$18:c1f1  78			sei
$18:c1f2  00 96		 brk #$96
$18:c1f4  46 14		 lsr $14
$18:c1f6  79 6a 18	  adc $186a,y
$18:c1f9  a0 8f 03	  ldy #$038f
$18:c1fc  00 6e		 brk #$6e
$18:c1fe  12 85		 ora ($85)
$18:c200  01 87		 ora ($87,x)
$18:c202  e2 58		 sep #$58
$18:c204  a1 07		 lda ($07,x)
$18:c206  80 90		 bra $c198
$18:c208  04 e2		 tsb $e2
$18:c20a  50 98		 bvc $c1a4
$18:c20c  3e 64 86	  rol $8664,x
$18:c20f  44 e1 a1	  mvp $a1,$e1
$18:c212  3d cf 7c	  and $7ccf,x
$18:c215  fd 4e 74	  sbc $744e,x
$18:c218  09 20		 ora #$20
$18:c21a  11 45		 ora ($45),y
$18:c21c  a3 a4		 lda $a4,s
$18:c21e  01 ee		 ora ($ee,x)
$18:c220  0d 51 c6	  ora $c651
$18:c223  bf 40 5a 30   lda $305a40,x
$18:c227  8c 73 f4	  sty $f473
$18:c22a  53 e1		 eor ($e1,s),y
$18:c22c  00 ce		 brk #$ce
$18:c22e  9e c9 aa	  stz $aac9,x
$18:c231  19 e8 14	  ora $14e8,y
$18:c234  16 01		 asl $01,x
$18:c236  13 35		 ora ($35,s),y
$18:c238  51 f4		 eor ($f4),y
$18:c23a  b1 a5		 lda ($a5),y
$18:c23c  80 45		 bra $c283
$18:c23e  96 74		 stx $74,y
$18:c240  b0 2d		 bcs $c26f
$18:c242  51 c7		 eor ($c7),y
$18:c244  2b			pld
$18:c245  09 1a		 ora #$1a
$18:c247  34 28		 bit $28,x
$18:c249  4a			lsr a
$18:c24a  50 44		 bvc $c290
$18:c24c  b3 0d		 lda ($0d,s),y
$18:c24e  86 0c		 stx $0c
$18:c250  8d 94 03	  sta $0394
$18:c253  94 8c		 sty $8c,x
$18:c255  c1 21		 cmp ($21,x)
$18:c257  99 c2 88	  sta $88c2,y
$18:c25a  46 45		 lsr $45
$18:c25c  e0 db		 cpx #$db
$18:c25e  02 50		 cop #$50
$18:c260  42 22		 wdm #$22
$18:c262  2d a0 c6	  and $c6a0
$18:c265  14 42		 trb $42
$18:c267  23 08		 and $08,s
$18:c269  74 09		 stz $09,x
$18:c26b  60			rts
$18:c26c  21 28		 and ($28,x)
$18:c26e  b1 2f		 lda ($2f),y
$18:c270  0b			phd
$18:c271  d0 0c		 bne $c27f
$18:c273  64 21		 stz $21
$18:c275  a8			tay
$18:c276  18			clc
$18:c277  b8			clv
$18:c278  87 24		 sta [$24]
$18:c27a  59 cf e7	  eor $e7cf,y
$18:c27d  fd 96 2c	  sbc $2c96,x
$18:c280  05 6b		 ora $6b
$18:c282  09 68		 ora #$68
$18:c284  99 c2 61	  sta $61c2,y
$18:c287  26 a8		 rol $a8
$18:c289  09 3d		 ora #$3d
$18:c28b  5c 1a 91 c2   jml $c2911a
$18:c28f  6e 47 fe	  ror $fe47
$18:c292  1e 1d 50	  asl $501d,x
$18:c295  e1 37		 sbc ($37,x)
$18:c297  45 bf		 eor $bf
$18:c299  0f 0e ac 70   ora $70ac0e
$18:c29d  9b			txy
$18:c29e  b3 bf		 lda ($bf,s),y
$18:c2a0  87 87		 sta [$87]
$18:c2a2  58			cli
$18:c2a3  38			sec
$18:c2a4  4d e2 4f	  eor $4fe2
$18:c2a7  c3 c3		 cmp $c3,s
$18:c2a9  8a			txa
$18:c2aa  1c 26 6a	  trb $6a26
$18:c2ad  05 fd		 ora $fd
$18:c2af  ff c3 60 0c   sbc $0c60c3,x
$18:c2b3  e0 06		 cpx #$06
$18:c2b5  80 b1		 bra $c268
$18:c2b7  40			rti
$18:c2b8  03 08		 ora $08,s
$18:c2ba  c5 b6		 cmp $b6
$18:c2bc  09 ea		 ora #$ea
$18:c2be  19 b0 01	  ora $01b0,y
$18:c2c1  ac 81 60	  ldy $6081
$18:c2c4  02 c6		 cop #$c6
$18:c2c6  10 04		 bpl $c2cc
$18:c2c8  03 38		 ora $38,s
$18:c2ca  e7 07		 sbc [$07]
$18:c2cc  c0 c0		 cpy #$c0
$18:c2ce  31 8c		 and ($8c),y
$18:c2d0  b3 89		 lda ($89,s),y
$18:c2d2  40			rti
$18:c2d3  3f ce f7 7e   and $7ef7ce,x
$18:c2d7  0e 6f 04	  asl $046f
$18:c2da  13 28		 ora ($28,s),y
$18:c2dc  06 2f		 asl $2f
$18:c2de  04 b0		 tsb $b0
$18:c2e0  f5 58		 sbc $58,x
$18:c2e2  66 83		 ror $83
$18:c2e4  00 aa		 brk #$aa
$18:c2e6  2c 50 d0	  bit $d050
$18:c2e9  5a			phy
$18:c2ea  c1 18		 cmp ($18,x)
$18:c2ec  4c bc 05	  jmp $05bc
$18:c2ef  46 5a		 lsr $5a
$18:c2f1  28			plp
$18:c2f2  21 28		 and ($28,x)
$18:c2f4  55 81		 eor $81,x
$18:c2f6  b2 82		 lda ($82)
$18:c2f8  0f 3d 56 1a   ora $1a563d
$18:c2fc  42 82		 wdm #$82
$18:c2fe  6d 0a fe	  adc $fe0a
$18:c301  aa			tax
$18:c302  1e 91 41	  asl $4191,x
$18:c305  3c 47 3f	  bit $3f47,x
$18:c308  37 0f		 and [$0f],y
$18:c30a  50 a0		 bvc $c2ac
$18:c30c  9e 44 7f	  stz $7f44,x
$18:c30f  9b			txy
$18:c310  87 4c		 sta [$4c]
$18:c312  a4 4d		 ldy $4d
$18:c314  b2 90		 lda ($90)
$18:c316  55 d1		 eor $d1,x
$18:c318  03 33		 ora $33,s
$18:c31a  8c 26 11	  sty $1126
$18:c31d  08			php
$18:c31e  e4 29		 cpx $29
$18:c320  01 12		 ora ($12,x)
$18:c322  5d 66 e1	  eor $e166,x
$18:c325  1c 03 cd	  trb $cd03
$18:c328  04 82		 tsb $82
$18:c32a  c0 22		 cpy #$22
$18:c32c  a3 f1		 lda $f1,s
$18:c32e  55 80		 eor $80,x
$18:c330  a0 9d		 ldy #$9d
$18:c332  60			rts
$18:c333  d7 08		 cmp [$08],y
$18:c335  4c 52 01	  jmp $0152
$18:c338  d9 08 0c	  cmp $0c08,y
$18:c33b  4a			lsr a
$18:c33c  19 08 f4	  ora $f408,y
$18:c33f  0b			phd
$18:c340  02 25		 cop #$25
$18:c342  00 01		 brk #$01
$18:c344  8d 0a 03	  sta $030a
$18:c347  05 75		 ora $75
$18:c349  84 30		 sty $30
$18:c34b  d6 20		 dec $20,x
$18:c34d  f0 84		 beq $c2d3
$18:c34f  41 0e		 eor ($0e,x)
$18:c351  41 0d		 eor ($0d,x)
$18:c353  80 47		 bra $c39c
$18:c355  60			rts
$18:c356  11 b8		 ora ($b8),y
$18:c358  04 2c		 tsb $2c
$18:c35a  86 70		 stx $70
$18:c35c  93 70		 sta ($70,s),y
$18:c35e  44 62 31	  mvp $31,$62
$18:c361  68			pla
$18:c362  47 25		 eor [$25]
$18:c364  38			sec
$18:c365  02 b0		 cop #$b0
$18:c367  8f 3f 4a 11   sta $114a3f
$18:c36b  1a			inc a
$18:c36c  87 c3		 sta [$c3]
$18:c36e  fd 29 c0	  sbc $c029,x
$18:c371  8d 42 07	  sta $0742
$18:c374  63 42		 adc $42,s
$18:c376  37 04		 and [$04],y
$18:c378  88			dey
$18:c379  76 00		 ror $00,x
$18:c37b  51 91		 eor ($91),y
$18:c37d  40			rti
$18:c37e  09 22		 ora #$22
$18:c380  0d 08 6c	  ora $6c08
$18:c383  36 07		 rol $07,x
$18:c385  13 35		 ora ($35,s),y
$18:c387  89 54		 bit #$54
$18:c389  21 70		 and ($70,x)
$18:c38b  b3 90		 lda ($90,s),y
$18:c38d  8a			txa
$18:c38e  c2 01		 rep #$01
$18:c390  1e ec e0	  asl $e0ec,x
$18:c393  9d 7e fc	  sta $fc7e,x
$18:c396  f0 6a		 beq $c402
$18:c398  28			plp
$18:c399  c4 2c		 cpy $2c
$18:c39b  4a			lsr a
$18:c39c  a0 0e		 ldy #$0e
$18:c39e  78			sei
$18:c39f  b6 88		 ldx $88,y
$18:c3a1  f6 38		 inc $38,x
$18:c3a3  c2 a1		 rep #$a1
$18:c3a5  a4 44		 ldy $44
$18:c3a7  b8			clv
$18:c3a8  49 80 31	  eor #$3180
$18:c3ab  29 84 0d	  and #$0d84
$18:c3ae  71 06		 adc ($06),y
$18:c3b0  3b			tsc
$18:c3b1  04 20		 tsb $20
$18:c3b3  f2 b1		 sbc ($b1)
$18:c3b5  14 09		 trb $09
$18:c3b7  99 01 10	  sta $1001,y
$18:c3ba  70 44		 bvs $c400
$18:c3bc  70 f5		 bvs $c3b3
$18:c3be  9b			txy
$18:c3bf  00 0b		 brk #$0b
$18:c3c1  04 b0		 tsb $b0
$18:c3c3  79 8c 21	  adc $218c,y
$18:c3c6  03 87		 ora $87,s
$18:c3c8  42 21		 wdm #$21
$18:c3ca  9c 88 24	  stz $2488
$18:c3cd  31 37		 and ($37),y
$18:c3cf  30 a3		 bmi $c374
$18:c3d1  b0 44		 bcs $c417
$18:c3d3  15 48		 ora $48,x
$18:c3d5  2e 05 91	  rol $9105
$18:c3d8  40			rti
$18:c3d9  61 85		 adc ($85,x)
$18:c3db  61 07		 adc ($07,x)
$18:c3dd  82 7c 22	  brl $e65c
$18:c3e0  d0 b8		 bne $c39a
$18:c3e2  98			tya
$18:c3e3  74 0e		 stz $0e,x
$18:c3e5  c1 21		 cmp ($21,x)
$18:c3e7  5c 9c 22 32   jml $32229c
$18:c3eb  c7 38		 cmp [$38]
$18:c3ed  cb			wai
$18:c3ee  34 c9		 bit $c9,x
$18:c3f0  40			rti
$18:c3f1  bf 31 d8 b7   lda $b7d831,x
$18:c3f5  00 2c		 brk #$2c
$18:c3f7  22 e0 71 90   jsl $9071e0
$18:c3fb  b0 60		 bcs $c45d
$18:c3fd  13 07		 ora ($07,s),y
$18:c3ff  a0 1d		 ldy #$1d
$18:c401  0d f6 2f	  ora $2ff6
$18:c404  50 80		 bvc $c386
$18:c406  4a			lsr a
$18:c407  2c 4d f0	  bit $f04d
$18:c40a  41 8c		 eor ($8c,x)
$18:c40c  01 0c		 ora ($0c,x)
$18:c40e  27 61		 and [$61]
$18:c410  77 82		 adc [$82],y
$18:c412  3d 0f e4	  and $e40f,x
$18:c415  8b			phb
$18:c416  08			php
$18:c417  42 18		 wdm #$18
$18:c419  53 e2		 eor ($e2,s),y
$18:c41b  8c 10 a1	  sty $a110
$18:c41e  15 c1		 ora $c1,x
$18:c420  4e 34 93	  lsr $9334
$18:c423  8e 34 e3	  stx $e334
$18:c426  d1 38		 cmp ($38),y
$18:c428  85 4e		 sta $4e
$18:c42a  63 93		 adc $93,s
$18:c42c  99 74 e6	  sta $e674,y
$18:c42f  81 39		 sta ($39,x)
$18:c431  a9 4e 6c	  lda #$6c4e
$18:c434  93 9b		 sta ($9b,s),y
$18:c436  b4 e7		 ldy $e7,x
$18:c438  11 39		 ora ($39),y
$18:c43a  cd 4e 75	  cmp $754e
$18:c43d  93 9d		 sta ($9d,s),y
$18:c43f  f4 e7 a1	  pea $a1e7
$18:c442  39 f1 4e	  and $4ef1,y
$18:c445  7d 93 9f	  adc $9f93,x
$18:c448  b4 e6		 ldy $e6,x
$18:c44a  01 3a		 ora ($3a,x)
$18:c44c  85 4e		 sta $4e
$18:c44e  a2 93		 ldx #$93
$18:c450  a8			tay
$18:c451  f4 ea 51	  pea $51ea
$18:c454  3a			dec a
$18:c455  99 4e a7	  sta $a74e,y
$18:c458  93 aa		 sta ($aa,s),y
$18:c45a  34 ea		 bit $ea,x
$18:c45c  a1 3a		 lda ($3a,x)
$18:c45e  ad 4e ac	  lda $ac4e
$18:c461  93 ab		 sta ($ab,s),y
$18:c463  74 ea		 stz $ea,x
$18:c465  f1 3a		 sbc ($3a),y
$18:c467  c1 4e		 cmp ($4e,x)
$18:c469  b1 93		 lda ($93),y
$18:c46b  ac b4 eb	  ldy $ebb4
$18:c46e  61 3a		 adc ($3a,x)
$18:c470  dd 4e b9	  cmp $b94e,x
$18:c473  93 ae		 sta ($ae,s),y
$18:c475  b4 eb		 ldy $eb,x
$18:c477  f1 3a		 sbc ($3a),y
$18:c479  8d 4e eb	  sta $eb4e
$18:c47c  93 bd		 sta ($bd,s),y
$18:c47e  34 ef		 bit $ef,x
$18:c480  81 3b		 sta ($3b,x)
$18:c482  ed 4e fe	  sbc $fe4e
$18:c485  93 b8		 sta ($b8,s),y
$18:c487  74 f2		 stz $f2,x
$18:c489  51 3c		 eor ($3c),y
$18:c48b  a1 4f		 lda ($4f,x)
$18:c48d  2b			pld
$18:c48e  93 cb		 sta ($cb,s),y
$18:c490  b4 f3		 ldy $f3,x
$18:c492  21 3c		 and ($3c,x)
$18:c494  d5 4f		 cmp $4f,x
$18:c496  38			sec
$18:c497  93 ce		 sta ($ce,s),y
$18:c499  f4 f3 f1	  pea $f1f3
$18:c49c  3c 89 4f	  bit $4f89,x
$18:c49f  65 93		 adc $93
$18:c4a1  da			phx
$18:c4a2  34 f6		 bit $f6,x
$18:c4a4  c1 3d		 cmp ($3d,x)
$18:c4a6  bd 4f 73	  lda $734f,x
$18:c4a9  93 dd		 sta ($dd,s),y
$18:c4ab  b4 f7		 ldy $f7,x
$18:c4ad  a1 3d		 lda ($3d,x)
$18:c4af  f1 4f		 sbc ($4f),y
$18:c4b1  60			rts
$18:c4b2  30 03		 bmi $c4b7
$18:c4b4  91 61		 sta ($61),y
$18:c4b6  e8			inx
$18:c4b7  47 14		 eor [$14]
$18:c4b9  98			tya
$18:c4ba  50 4e		 bvc $c50a
$18:c4bc  29 26 a0	  and #$a026
$18:c4bf  1c 53 9f	  trb $9f53
$18:c4c2  3e ff ff	  rol $ffff,x
$18:c4c5  ce 29 04	  dec $0429
$18:c4c8  9f 1c 52 39   sta $39521c,x
$18:c4cc  3f 38 a5 95   and $95a538,x
$18:c4d0  10 b7		 bpl $c489
$18:c4d2  da			phx
$18:c4d3  0a			asl a
$18:c4d4  45 bb		 eor $bb
$18:c4d6  e8			inx
$18:c4d7  05 d5		 ora $d5
$18:c4d9  a2 16		 ldx #$16
$18:c4db  fc a2 5a	  jsr ($5aa2,x)
$18:c4de  52 41		 eor ($41)
$18:c4e0  f1 29		 sbc ($29),y
$18:c4e2  a5 e2		 lda $e2
$18:c4e4  28			plp
$18:c4e5  97 d4		 sta [$d4],y
$18:c4e7  88			dey
$18:c4e8  59 2d 09	  eor $092d,y
$18:c4eb  22 10 53 91   jsl $915310
$18:c4ef  f1 a8		 sbc ($a8),y
$18:c4f1  4f 94 ff 3d   eor $3dff94
$18:c4f5  9e 6d 43	  stz $436d,x
$18:c4f8  00 a5		 brk #$a5
$18:c4fa  d6 86		 dec $86,x
$18:c4fc  09 e0 3c	  ora #$3ce0
$18:c4ff  3f db 5a 1a   and $1a5adb,x
$18:c503  18			clc
$18:c504  19 c8 e1	  ora $e1c8,y
$18:c507  f4 42 0a	  pea $0a42
$18:c50a  61 a8		 adc ($a8,x)
$18:c50c  83 f6		 sta $f6,s
$18:c50e  f4 12 16	  pea $1612
$18:c511  6b			rtl
$18:c512  45 1f		 eor $1f
$18:c514  f6 94		 inc $94,x
$18:c516  c4 e5		 cpy $e5
$18:c518  96 27		 stx $27,y
$18:c51a  90 05		 bcc $c521
$18:c51c  3f 34 50 0a   and $0a5034,x
$18:c520  51 a8		 eor ($a8),y
$18:c522  cf 76 c6 51   cmp $51c676
$18:c526  80 29		 bra $c551
$18:c528  e7 4c		 sbc [$4c]
$18:c52a  3a			dec a
$18:c52b  3d a5 b4	  and $b4a5,x
$18:c52e  74 cf		 stz $cf,x
$18:c530  25 c8		 and $c8
$18:c532  fe 50 45	  inc $4550,x
$18:c535  d1 9f		 cmp ($9f),y
$18:c537  cb			wai
$18:c538  f9 ff 54	  sbc $54ff,y
$18:c53b  91 fc		 sta ($fc),y
$18:c53d  1b			tcs
$18:c53e  e0 95		 cpx #$95
$18:c540  42 51		 wdm #$51
$18:c542  c0 17		 cpy #$17
$18:c544  64 ef		 stz $ef
$18:c546  45 49		 eor $49
$18:c548  3b			tsc
$18:c549  d1 9b		 cmp ($9b),y
$18:c54b  03 d4		 ora $d4,s
$18:c54d  73 97		 adc ($97,s),y
$18:c54f  fa			plx
$18:c550  84 d9		 sty $d9
$18:c552  6b			rtl
$18:c553  a8			tay
$18:c554  f8			sed
$18:c555  51 28		 eor ($28),y
$18:c557  13 24		 ora ($24,s),y
$18:c559  4a			lsr a
$18:c55a  07 49		 ora [$49]
$18:c55c  12 82		 ora ($82)
$18:c55e  72 72		 adc ($72)
$18:c560  a2 14		 ldx #$14
$18:c562  9b			txy
$18:c563  69 35 3a	  adc #$3a35
$18:c566  2b			pld
$18:c567  54 34 a5	  mvn $a5,$34
$18:c56a  a1 49		 lda ($49,x)
$18:c56c  1c 03 0c	  trb $0c03
$18:c56f  86 13		 stx $13
$18:c571  3a			dec a
$18:c572  16 48		 asl $48,x
$18:c574  ce 86 32	  dec $3286
$18:c577  1f a6 76 8e   ora $8e76a6,x
$18:c57b  3f 4e 3a 31   and $313a4e,x
$18:c57f  62 94 81	  per $4716
$18:c582  48			pha
$18:c583  48			pha
$18:c584  00 87		 brk #$87
$18:c586  92 4e		 sta ($4e)
$18:c588  0c 1d cc	  tsb $cc1d
$18:c58b  7b			tdc
$18:c58c  ca			dex
$18:c58d  43 94		 eor $94,s
$18:c58f  a0 2a		 ldy #$2a
$18:c591  e1 14		 sbc ($14,x)
$18:c593  84 2c		 sty $2c
$18:c595  1c 7d 84	  trb $847d
$18:c598  e0 af		 cpx #$af
$18:c59a  c0 08		 cpy #$08
$18:c59c  5f 4a 43 15   eor $15434a,x
$18:c5a0  22 14 96 2a   jsl $2a9614
$18:c5a4  4b			phk
$18:c5a5  1a			inc a
$18:c5a6  8b			phb
$18:c5a7  48			pha
$18:c5a8  a4 8a		 ldy $8a
$18:c5aa  42 04		 wdm #$04
$18:c5ac  04 3c		 tsb $3c
$18:c5ae  3d 25 ce	  and $ce25,x
$18:c5b1  99 c7 72	  sta $72c7,y
$18:c5b4  ec 5d cb	  cpx $cb5d
$18:c5b7  e9 72 3c	  sbc #$3c72
$18:c5ba  16 94		 asl $94,x
$18:c5bc  ff 49 e8 41   sbc $41e849,x
$18:c5c0  64 21		 stz $21
$18:c5c2  05 e6		 ora $e6
$18:c5c4  bd b5 ea	  lda $eab5,x
$18:c5c7  ce d6 ae	  dec $aed6
$18:c5ca  b9 05 6a	  lda $6a05,y
$18:c5cd  07 22		 ora [$22]
$18:c5cf  d6 d2		 dec $d2,x
$18:c5d1  89 69 83	  bit #$8369
$18:c5d4  29 29 45	  and #$4529
$18:c5d7  ab			plb
$18:c5d8  25 27		 and $27
$18:c5da  84 19		 sty $19
$18:c5dc  2c a2 dd	  bit $dda2
$18:c5df  72 92		 adc ($92)
$18:c5e1  c0 69		 cpy #$69
$18:c5e3  6c 30 58	  jmp ($5830)
$18:c5e6  83 0c		 sta $0c,s
$18:c5e8  08			php
$18:c5e9  a1 86		 lda ($86,x)
$18:c5eb  a2 2d		 ldx #$2d
$18:c5ed  43 fc		 eor $fc,s
$18:c5ef  98			tya
$18:c5f0  5f e2 60 c9   eor $c960e2,x
$18:c5f4  24 a7		 bit $a7
$18:c5f6  44 eb 25	  mvp $25,$eb
$18:c5f9  59 26 44	  eor $4426,y
$18:c5fc  50 49		 bvc $c647
$18:c5fe  84 d6		 sty $d6
$18:c600  8a			txa
$18:c601  4b			phk
$18:c602  24 f8		 bit $f8
$18:c604  33 d1		 and ($d1,s),y
$18:c606  4e 0c f0	  lsr $f00c
$18:c609  24 a3		 bit $a3
$18:c60b  74 9a		 stz $9a,x
$18:c60d  2c c9 66	  bit $66c9
$18:c610  3a			dec a
$18:c611  12 c3		 ora ($c3)
$18:c613  4a			lsr a
$18:c614  d0 32		 bne $c648
$18:c616  08			php
$18:c617  00 d2		 brk #$d2
$18:c619  08			php
$18:c61a  02 12		 cop #$12
$18:c61c  4a			lsr a
$18:c61d  04 48		 tsb $48
$18:c61f  0a			asl a
$18:c620  cf d6 24 92   cmp $9224d6
$18:c624  5c bf d4 24   jml $24d4bf
$18:c628  ea			nop
$18:c629  0d c1 92	  ora $92c1
$18:c62c  0a			asl a
$18:c62d  72 1b		 adc ($1b)
$18:c62f  82 4c 88	  brl $4e7e
$18:c632  68			pla
$18:c633  39 61 8b	  and $8b61,y
$18:c636  38			sec
$18:c637  51 26		 eor ($26),y
$18:c639  17 5a		 ora [$5a],y
$18:c63b  1b			tcs
$18:c63c  ad 0d 60	  lda $600d
$18:c63f  c9 25 38	  cmp #$3825
$18:c642  1a			inc a
$18:c643  c1 8e		 cmp ($8e,x)
$18:c645  87 92		 sta [$92]
$18:c647  36 b1		 rol $b1,x
$18:c649  95 9c		 sta $9c,x
$18:c64b  28			plp
$18:c64c  eb			xba
$18:c64d  0d 69 b0	  ora $b069
$18:c650  c4 60		 cpy $60
$18:c652  9f 06 49 06   sta $064906,x
$18:c656  c1 3e		 cmp ($3e,x)
$18:c658  0c 74 56	  tsb $5674
$18:c65b  92 85		 sta ($85)
$18:c65d  93 2c		 sta ($2c,s),y
$18:c65f  2f 6a 35 18   and $18356a
$18:c663  72 8d		 adc ($8d)
$18:c665  30 25		 bmi $c68c
$18:c667  a3 4c		 lda $4c,s
$18:c669  09 2c d3	  ora #$d32c
$18:c66c  86 6b		 stx $6b
$18:c66e  18			clc
$18:c66f  db			stp
$18:c670  ce d4 13	  dec $13d4
$18:c673  79 01 c0	  adc $c001,y
$18:c676  fe 80 70	  inc $7080,x
$18:c679  3e b0 1e	  rol $1eb0,x
$18:c67c  00 2c		 brk #$2c
$18:c67e  2f 04 ca 4b   and $4bca04
$18:c682  68			pla
$18:c683  ea			nop
$18:c684  14 1d		 trb $1d
$18:c686  82 cd 07	  brl $ce56
$18:c689  60			rts
$18:c68a  2f 02 2b 0f   and $0f2b02
$18:c68e  58			cli
$18:c68f  6a			ror a
$18:c690  c3 34		 cmp $34,s
$18:c692  51 87		 eor ($87),y
$18:c694  32 96		 and ($96)
$18:c696  69 4b 6d	  adc #$6d4b
$18:c699  30 d2		 bmi $c66d
$18:c69b  97 8a		 sta [$8a],y
$18:c69d  5a			phy
$18:c69e  cc 94 61	  cpy $6194
$18:c6a1  2b			pld
$18:c6a2  a5 8c		 lda $8c
$18:c6a4  cb			wai
$18:c6a5  fb			xce
$18:c6a6  ff 51 84 3a   sbc $3a8451,x
$18:c6aa  9a			txs
$18:c6ab  a5 06		 lda $06
$18:c6ad  b9 24 42	  lda $4224,y
$18:c6b0  10 ce		 bpl $c680
$18:c6b2  3f 25 30 66   and $663025,x
$18:c6b6  8e 70 48	  stx $4870
$18:c6b9  90 fc		 bcc $c6b7
$18:c6bb  93 24		 sta ($24,s),y
$18:c6bd  37 25		 and [$25],y
$18:c6bf  09 1a 8e	  ora #$8e1a
$18:c6c2  01 92		 ora ($92,x)
$18:c6c4  a4 2f		 ldy $2f
$18:c6c6  d3 3a		 cmp ($3a,s),y
$18:c6c8  4c 18 33	  jmp $3318
$18:c6cb  01 60		 ora ($60,x)
$18:c6cd  e6 a3		 inc $a3
$18:c6cf  bb			tyx
$18:c6d0  d3 5a		 cmp ($5a,s),y
$18:c6d2  29 4d a6	  and #$a64d
$18:c6d5  b6 52		 ldx $52,y
$18:c6d7  47 4d		 eor [$4d]
$18:c6d9  4e 94 42	  lsr $4294
$18:c6dc  01 50		 ora ($50,x)
$18:c6de  05 0b		 ora $0b
$18:c6e0  d4 96		 pei ($96)
$18:c6e2  a5 08		 lda $08
$18:c6e4  90 4a		 bcc $c730
$18:c6e6  31 fc		 and ($fc),y
$18:c6e8  80 08		 bra $c6f2
$18:c6ea  ca			dex
$18:c6eb  24 18		 bit $18
$18:c6ed  f6 30		 inc $30,x
$18:c6ef  26 c0		 rol $c0
$18:c6f1  16 29		 asl $29,x
$18:c6f3  b0 4d		 bcs $c742
$18:c6f5  80 10		 bra $c707
$18:c6f7  71 03		 adc ($03),y
$18:c6f9  51 98		 eor ($98),y
$18:c6fb  44 25 d4	  mvp $d4,$25
$18:c6fe  81 a8		 sta ($a8,x)
$18:c700  c4 26		 cpy $26
$18:c702  12 ee		 ora ($ee)
$18:c704  41 7c		 eor ($7c,x)
$18:c706  68			pla
$18:c707  10 0b		 bpl $c714
$18:c709  70 8c		 bvs $c697
$18:c70b  85 a1		 sta $a1
$18:c70d  6e e4 7e	  ror $7ee4
$18:c710  3f f4 a8 04   and $04a8f4,x
$18:c714  45 50		 eor $50
$18:c716  22 e0 7a 83   jsl $837ae0
$18:c71a  64 0b		 stz $0b
$18:c71c  e1 32		 sbc ($32,x)
$18:c71e  80 c0		 bra $c6e0
$18:c720  e1 d0		 sbc ($d0,x)
$18:c722  88			dey
$18:c723  0c 42 44	  tsb $4442
$18:c726  4a			lsr a
$18:c727  11 50		 ora ($50),y
$18:c729  48			pha
$18:c72a  22 44 a2 80   jsl $80a244
$18:c72e  4d 60 b0	  eor $b060
$18:c731  08			php
$18:c732  67 d9		 adc [$d9]
$18:c734  36 13		 rol $13,x
$18:c736  a8			tay
$18:c737  04 1a		 tsb $1a
$18:c739  0d e6 4d	  ora $4de6
$18:c73c  84 d2		 sty $d2
$18:c73e  0d 0c 80	  ora $800c
$18:c741  55 89		 eor $89,x
$18:c743  a1 30		 lda ($30,x)
$18:c745  81 1c		 sta ($1c,x)
$18:c747  c0 a6		 cpy #$a6
$18:c749  0b			phd
$18:c74a  70 7e		 bvs $c7ca
$18:c74c  83 d4		 sta $d4,s
$18:c74e  0f 08 b5 10   ora $10b508
$18:c752  20 26 c3	  jsr $c326
$18:c755  3e 89 00	  rol $0089,x
$18:c758  58			cli
$18:c759  22 44 46 02   jsl $024644
$18:c75d  70 5b		 bvs $c7ba
$18:c75f  81 30		 sta ($30,x)
$18:c761  44 00 97	  mvp $97,$00
$18:c764  11 18		 ora ($18),y
$18:c766  8b			phb
$18:c767  82 01 4e	  brl $156b
$18:c76a  26 82		 rol $82
$18:c76c  90 54		 bcc $c7c2
$18:c76e  c0 c6		 cpy #$c6
$18:c770  00 20		 brk #$20
$18:c772  3f 83 3f 88   and $883f83,x
$18:c776  08			php
$18:c777  8a			txa
$18:c778  cc 40 e2	  cpy $e240
$18:c77b  3d 0a ac	  and $ac0a,x
$18:c77e  00 72		 brk #$72
$18:c780  0f 52 84 91   ora $918452
$18:c784  86 03		 stx $03
$18:c786  1d 90 4b	  ora $4b90,x
$18:c789  89 a0 46	  bit #$46a0
$18:c78c  09 68 84	  ora #$8468
$18:c78f  05 43		 ora $43
$18:c791  01 86		 ora ($86,x)
$18:c793  8a			txa
$18:c794  0e 03 3d	  asl $3d03
$18:c797  80 34		 bra $c7cd
$18:c799  42 01		 wdm #$01
$18:c79b  05 82		 ora $82
$18:c79d  40			rti
$18:c79e  28			plp
$18:c79f  a6 81		 ldx $81
$18:c7a1  64 84		 stz $84
$18:c7a3  1e 7c 61	  asl $617c,x
$18:c7a6  16 50		 asl $50,x
$18:c7a8  3c 80 de	  bit $de80,x
$18:c7ab  0e f1 82	  asl $82f1
$18:c7ae  d0 27		 bne $c7d7
$18:c7b0  c1 51		 cmp ($51,x)
$18:c7b2  80 80		 bra $c734
$18:c7b4  02 7e		 cop #$7e
$18:c7b6  84 16		 sty $16
$18:c7b8  31 02		 and ($02),y
$18:c7ba  d0 da		 bne $c796
$18:c7bc  03 30		 ora $30,s
$18:c7be  84 21		 sty $21
$18:c7c0  c3 1c		 cmp $1c,s
$18:c7c2  77 04		 adc [$04],y
$18:c7c4  48			pha
$18:c7c5  07 05		 ora [$05]
$18:c7c7  6c 08 c2	  jmp ($c208)
$18:c7ca  c7 21		 cmp [$21]
$18:c7cc  06 10		 asl $10
$18:c7ce  2a			rol a
$18:c7cf  15 08		 ora $08,x
$18:c7d1  c0 23		 cpy #$23
$18:c7d3  12 86		 ora ($86)
$18:c7d5  89 23 42	  bit #$4223
$18:c7d8  31 2e		 and ($2e),y
$18:c7da  13 14		 ora ($14,s),y
$18:c7dc  42 71		 wdm #$71
$18:c7de  2e 57 82	  rol $8257
$18:c7e1  24 27		 bit $27
$18:c7e3  0d 70 57	  ora $5770
$18:c7e6  82 e8 08	  brl $d0d1
$18:c7e9  c1 2f		 cmp ($2f,x)
$18:c7eb  28			plp
$18:c7ec  11 34		 ora ($34),y
$18:c7ee  0a			asl a
$18:c7ef  c0 35		 cpy #$35
$18:c7f1  15 20		 ora $20,x
$18:c7f3  5b			tcd
$18:c7f4  87 64		 sta [$64]
$18:c7f6  a3 0b		 lda $0b,s
$18:c7f8  76 23		 ror $23,x
$18:c7fa  e1 ff		 sbc ($ff,x)
$18:c7fc  a5 af		 lda $af
$18:c7fe  c6 06		 dec $06
$18:c800  a3 14		 lda $14,s
$18:c802  e8			inx
$18:c803  12 c1		 ora ($c1)
$18:c805  c2 12		 rep #$12
$18:c807  b8			clv
$18:c808  0c 0d 40	  tsb $400d
$18:c80b  31 08		 and ($08),y
$18:c80d  d9 f8 71	  cmp $71f8,y
$18:c810  10 19		 bpl $c82b
$18:c812  04 2c		 tsb $2c
$18:c814  fc 24 b0	  jsr ($b024,x)
$18:c817  97 c1		 sta [$c1],y
$18:c819  02 e0		 cop #$e0
$18:c81b  f4 19 8c	  pea $8c19
$18:c81e  08			php
$18:c81f  2c 0e d1	  bit $d10e
$18:c822  99 c0 20	  sta $20c0,y
$18:c825  d0 67		 bne $c88e
$18:c827  d8			cld
$18:c828  cc 20 70	  cpy $7020
$18:c82b  94 30		 sty $30,x
$18:c82d  a9 46 03	  lda #$0346
$18:c830  0b			phd
$18:c831  8f 09 80 28   sta $288009
$18:c835  21 30		 and ($30,x)
$18:c837  59 a0 5c	  eor $5ca0,y
$18:c83a  1c 20 62	  trb $6220
$18:c83d  08			php
$18:c83e  05 39		 ora $39
$18:c840  10 0c		 bpl $c84e
$18:c842  31 62		 and ($62),y
$18:c844  83 80		 sta $80,s
$18:c846  0b			phd
$18:c847  40			rti
$18:c848  67 04		 adc [$04]
$18:c84a  70 40		 bvs $c88c
$18:c84c  67 04		 adc [$04]
$18:c84e  b0 69		 bcs $c8b9
$18:c850  81 24		 sta ($24,x)
$18:c852  03 80		 ora $80,s
$18:c854  4b			phk
$18:c855  0c f0 a0	  tsb $a0f0
$18:c858  9c 02 49	  stz $4902
$18:c85b  08			php
$18:c85c  c4 c0		 cpy $c0
$18:c85e  a4 0b		 ldy $0b
$18:c860  11 98		 ora ($98),y
$18:c862  46 1d		 lsr $1d
$18:c864  c2 1f		 rep #$1f
$18:c866  00 e0		 brk #$e0
$18:c868  14 83		 trb $83
$18:c86a  3c 26 01	  bit $0126,x
$18:c86d  88			dey
$18:c86e  3f 04 3e 0e   and $0e3e04,x
$18:c872  c0 25 84	  cpy #$8425
$18:c875  3c 3e 0f	  bit $0f3e,x
$18:c878  30 05		 bmi $c87f
$18:c87a  0a			asl a
$18:c87b  c8			iny
$18:c87c  4e 21 53	  lsr $5321
$18:c87f  80 1b		 bra $c89c
$18:c881  41 7a		 eor ($7a,x)
$18:c883  0b			phd
$18:c884  b0 83		 bcs $c809
$18:c886  b0 06		 bcs $c88e
$18:c888  03 13		 ora $13,s
$18:c88a  90 10		 bcc $c89c
$18:c88c  40			rti
$18:c88d  46 32		 lsr $32
$18:c88f  32 70		 and ($70)
$18:c891  88			dey
$18:c892  c5 3e		 cmp $3e
$18:c894  02 80		 cop #$80
$18:c896  33 84		 and ($84,s),y
$18:c898  26 09		 rol $09
$18:c89a  37 4e		 and [$4e],y
$18:c89c  0c 25 40	  tsb $4025
$18:c89f  13 54		 ora ($54,s),y
$18:c8a1  a8			tay
$18:c8a2  c1 20		 cmp ($20,x)
$18:c8a4  b0 09		 bcs $c8af
$18:c8a6  da			phx
$18:c8a7  8c 04 63	  sty $6304
$18:c8aa  03 98		 ora $98,s
$18:c8ac  4b			phk
$18:c8ad  9f 00 bc 15   sta $15bc00,x
$18:c8b1  d8			cld
$18:c8b2  15 11		 ora $11,x
$18:c8b4  b0 27		 bcs $c8dd
$18:c8b6  80 6f		 bra $c927
$18:c8b8  06 3d		 asl $3d
$18:c8ba  f0 09		 beq $c8c5
$18:c8bc  d0 32		 bne $c8f0
$18:c8be  8a			txa
$18:c8bf  c8			iny
$18:c8c0  61 0e		 adc ($0e,x)
$18:c8c2  50 c7		 bvc $c88b
$18:c8c4  b7 01		 lda [$01],y
$18:c8c6  c6 58		 dec $58
$18:c8c8  f2 60		 sbc ($60)
$18:c8ca  96 c0		 stx $c0,y
$18:c8cc  a2 07 d2	  ldx #$d207
$18:c8cf  98			tya
$18:c8d0  0b			phd
$18:c8d1  80 52		 bra $c925
$18:c8d3  21 50		 and ($50,x)
$18:c8d5  a0 5b 8f	  ldy #$8f5b
$18:c8d8  a4 c3		 ldy $c3
$18:c8da  0b			phd
$18:c8db  76 23		 ror $23,x
$18:c8dd  f1 ff		 sbc ($ff),y
$18:c8df  a4 96		 ldy $96
$18:c8e1  c5 82		 cmp $82
$18:c8e3  4b			phk
$18:c8e4  d0 10		 bne $c8f6
$18:c8e6  8c 42 42	  sty $4242
$18:c8e9  c0 08 73	  cpy #$7308
$18:c8ec  54 24 01	  mvn $01,$24
$18:c8ef  70 56		 bvs $c947
$18:c8f1  03 e0		 ora $e0,s
$18:c8f3  27 24		 and [$24]
$18:c8f5  61 22		 adc ($22,x)
$18:c8f7  0c ca 0e	  tsb $0eca
$18:c8fa  40			rti
$18:c8fb  01 e8		 ora ($e8,x)
$18:c8fd  af 80 72 04   lda $047280
$18:c901  b1 98		 lda ($98),y
$18:c903  0c 45 5a	  tsb $5a45
$18:c906  30 09		 bmi $c911
$18:c908  8a			txa
$18:c909  c8			iny
$18:c90a  cb			wai
$18:c90b  a2 a4 06	  ldx #$06a4
$18:c90e  ca			dex
$18:c90f  18			clc
$18:c910  05 f4		 ora $f4
$18:c912  07 80		 ora [$80]
$18:c914  cf 9e 09 d4   cmp $d4099e
$18:c918  23 01		 and $01,s
$18:c91a  4b			phk
$18:c91b  04 02		 tsb $02
$18:c91d  9d c8 80	  sta $80c8,x
$18:c920  bd c5 f2	  lda $f2c5,x
$18:c923  02 90		 cop #$90
$18:c925  40			rti
$18:c926  81 fc		 sta ($fc,x)
$18:c928  1a			inc a
$18:c929  e0 cb 06	  cpx #$06cb
$18:c92c  e8			inx
$18:c92d  c3 86		 cmp $86,s
$18:c92f  e0 65 02	  cpx #$0265
$18:c932  f8			sed
$18:c933  67 c6		 adc [$c6]
$18:c935  e0 ef 00	  cpx #$00ef
$18:c938  a0 be c0	  ldy #$c0be
$18:c93b  b6 35		 ldx $35,y
$18:c93d  68			pla
$18:c93e  02 68		 cop #$68
$18:c940  0a			asl a
$18:c941  c4 40		 cpy $40
$18:c943  08			php
$18:c944  0b			phd
$18:c945  34 23		 bit $23,x
$18:c947  d2 02		 cmp ($02)
$18:c949  90 0b		 bcc $c956
$18:c94b  46 5c		 lsr $5c
$18:c94d  89 06 50	  bit #$5006
$18:c950  33 42		 and ($42,s),y
$18:c952  1c 82 26	  trb $2682
$18:c955  68			pla
$18:c956  4f 86 c0 76   eor $76c086
$18:c95a  08			php
$18:c95b  2c 12 01	  bit $0112
$18:c95e  46 5d		 lsr $5d
$18:c960  8b			phb
$18:c961  28			plp
$18:c962  20 f3 f6	  jsr $f6f3
$18:c965  10 8a		 bpl $c8f1
$18:c967  82 09 42	  brl $0b73
$18:c96a  64 80		 stz $80
$18:c96c  a8			tay
$18:c96d  60			rts
$18:c96e  d4 01		 pei ($01)
$18:c970  90 29		 bcc $c99b
$18:c972  c2 10		 rep #$10
$18:c974  61 09		 adc ($09,x)
$18:c976  7b			tdc
$18:c977  60			rts
$18:c978  44 e4 6c	  mvp $6c,$e4
$18:c97b  48			pha
$18:c97c  61 b0		 adc ($b0,x)
$18:c97e  1d a5 8e	  ora $8ea5,x
$18:c981  27 8b		 and [$8b]
$18:c983  9c 71 c1	  stz $c171
$18:c986  00 0d		 brk #$0d
$18:c988  82 10 5b	  brl $249b
$18:c98b  03 08		 ora $08,s
$18:c98d  3e 8b d0	  rol $d08b,x
$18:c990  5d c1 18	  eor $18c1,x
$18:c993  19 09 b0	  ora $b009,y
$18:c996  23 12		 and $12,s
$18:c998  82 38 25	  brl $eed3
$18:c99b  85 ec		 sta $ec
$18:c99d  16 e4		 asl $e4,x
$18:c99f  a9 3d c2	  lda #$c23d
$18:c9a2  dc 8e 29	  jml [$298e]
$18:c9a5  c4 42		 cpy $42
$18:c9a7  7c 10 02	  jmp ($0210,x)
$18:c9aa  e8			inx
$18:c9ab  2d 42 7e	  and $7e42
$18:c9ae  b8			clv
$18:c9af  28			plp
$18:c9b0  84 e2		 sty $e2
$18:c9b2  7e e5 18	  ror $18e5,x
$18:c9b5  43 0c		 eor $0c,s
$18:c9b7  27 d0		 and [$d0]
$18:c9b9  8f 87 fe 96   sta $96fe87
$18:c9bd  20 18 13	  jsr $1318
$18:c9c0  d8			cld
$18:c9c1  41 80		 eor ($80,x)
$18:c9c3  5d 05 58	  eor $5805,x
$18:c9c6  4a			lsr a
$18:c9c7  da			phx
$18:c9c8  61 0e		 adc ($0e,x)
$18:c9ca  01 0c		 ora ($0c,x)
$18:c9cc  6d be 2a	  adc $2abe
$18:c9cf  a0 90 42	  ldy #$4290
$18:c9d2  db			stp
$18:c9d3  e5 00		 sbc $00
$18:c9d5  98			tya
$18:c9d6  c0 a0 30	  cpy #$30a0
$18:c9d9  92 70		 sta ($70)
$18:c9db  cb			wai
$18:c9dc  20 f0 a1	  jsr $a1f0
$18:c9df  10 17		 bpl $c9f8
$18:c9e1  42 66		 wdm #$66
$18:c9e3  2a			rol a
$18:c9e4  08			php
$18:c9e5  09 54 66	  ora #$6654
$18:c9e8  10 38		 bpl $ca22
$18:c9ea  04 2a		 tsb $2a
$18:c9ec  1c 05 28	  trb $2805
$18:c9ef  44 0a 3c	  mvp $3c,$0a
$18:c9f2  56 13		 lsr $13,x
$18:c9f4  b0 1d		 bcs $ca13
$18:c9f6  00 28		 brk #$28
$18:c9f8  87 80		 sta [$80]
$18:c9fa  55 82		 eor $82,x
$18:c9fc  b8			clv
$18:c9fd  20 14 e5	  jsr $e514
$18:ca00  50 09		 bvc $ca0b
$18:ca02  04 4c		 tsb $4c
$18:ca04  05 10		 ora $10
$18:ca06  5a			phy
$18:ca07  01 b0		 ora ($b0,x)
$18:ca09  21 c9		 and ($c9,x)
$18:ca0b  c0 9c 15	  cpy #$159c
$18:ca0e  85 de		 sta $de
$18:ca10  28			plp
$18:ca11  b0 2e		 bcs $ca41
$18:ca13  86 78		 stx $78
$18:ca15  f6 44		 inc $44,x
$18:ca17  11 a4		 ora ($a4),y
$18:ca19  20 c5 66	  jsr $66c5
$18:ca1c  19 e5 c0	  ora $c0e5,y
$18:ca1f  24 80		 bit $80
$18:ca21  9e 26 b0	  stz $b026,x
$18:ca24  8c 4c 16	  sty $164c
$18:ca27  61 0f		 adc ($0f,x)
$18:ca29  25 84		 and $84
$18:ca2b  c2 30		 rep #$30
$18:ca2d  5d 14 00	  eor $0014,x
$18:ca30  16 c1		 asl $c1,x
$18:ca32  00 11		 brk #$11
$18:ca34  f3 01		 sbc ($01,s),y
$18:ca36  1a			inc a
$18:ca37  c4 5e		 cpy $5e
$18:ca39  01 d1		 ora ($d1,x)
$18:ca3b  a9 c0 19	  lda #$19c0
$18:ca3e  c0 d2 00	  cpy #$00d2
$18:ca41  e0 41 c4	  cpx #$c441
$18:ca44  20 ab 08	  jsr $08ab
$18:ca47  9c 81 44	  stz $4481
$18:ca4a  2a			rol a
$18:ca4b  b0 91		 bcs $c9de
$18:ca4d  c4 25		 cpy $25
$18:ca4f  ce 20 55	  dec $5520
$18:ca52  80 00		 bra $ca54
$18:ca54  11 20		 ora ($20),y
$18:ca56  33 08		 and ($08,s),y
$18:ca58  4c 0a 72	  jmp $720a
$18:ca5b  f6 13		 inc $13,x
$18:ca5d  a8			tay
$18:ca5e  ce c0 82	  dec $82c0
$18:ca61  2f 08 4c c9   and $c94c08
$18:ca65  fa			plx
$18:ca66  08			php
$18:ca67  41 81		 eor ($81,x)
$18:ca69  cc 25 c7	  cpy $c725
$18:ca6c  51 8f		 eor ($8f),y
$18:ca6e  81 80		 sta ($80,x)
$18:ca70  32 25		 and ($25)
$18:ca72  50 2a		 bvc $ca9e
$18:ca74  84 18		 sty $18
$18:ca76  42 21		 wdm #$21
$18:ca78  80 90		 bra $ca0a
$18:ca7a  6b			rtl
$18:ca7b  20 87 61	  jsr $6187
$18:ca7e  66 07		 ror $07
$18:ca80  31 92		 and ($92),y
$18:ca82  45 50		 eor $50
$18:ca84  f6 32		 inc $32,x
$18:ca86  41 8a		 eor ($8a,x)
$18:ca88  30 0f		 bmi $ca99
$18:ca8a  73 5c		 adc ($5c,s),y
$18:ca8c  99 81 ce	  sta $ce81,y
$18:ca8f  6b			rtl
$18:ca90  90 f8		 bcc $ca8a
$18:ca92  35 cc		 and $cc,x
$18:ca94  91 5b		 sta ($5b),y
$18:ca96  fc 01 92	  jsr ($9201,x)
$18:ca99  92 06		 sta ($06)
$18:ca9b  82 50 1c	  brl $e6ee
$18:ca9e  a9 02 6f	  lda #$6f02
$18:caa1  24 89		 bit $89
$18:caa3  ae 94 27	  ldx $2794
$18:caa6  61 ce		 adc ($ce,x)
$18:caa8  1e 4a 82	  asl $824a,x
$18:caab  13 b8		 ora ($b8,s),y
$18:caad  42 24		 wdm #$24
$18:caaf  1a			inc a
$18:cab0  86 49		 stx $49
$18:cab2  46 22		 lsr $22
$18:cab4  1c 86 49	  trb $4986
$18:cab7  4a			lsr a
$18:cab8  20 1e 86	  jsr $861e
$18:cabb  b9 0d 83	  lda $830d,y
$18:cabe  54 d7 21	  mvn $21,$d7
$18:cac1  e8			inx
$18:cac2  72 9a		 adc ($9a)
$18:cac4  e4 44		 cpx $44
$18:cac6  0f 54 10 68   ora $681054
$18:caca  2f 00 ca 17   and $17ca00
$18:cace  01 78		 ora ($78,x)
$18:cad0  2f 1d 82 39   and $39821d
$18:cad4  52 09		 eor ($09)
$18:cad6  44 65 1c	  mvp $1c,$65
$18:cad9  91 bc		 sta ($bc),y
$18:cadb  92 43		 sta ($43)
$18:cadd  f9 0b c2	  sbc $c20b,y
$18:cae0  88			dey
$18:cae1  d7 4a		 cmp [$4a],y
$18:cae3  25 10		 and $10
$18:cae5  c9 50 c7	  cmp #$c750
$18:cae8  d2 41		 cmp ($41)
$18:caea  9c a9 06	  stz $06a9
$18:caed  3f a4 99 bc   and $bc99a4,x
$18:caf1  92 64		 sta ($64)
$18:caf3  d8			cld
$18:caf4  c6 24		 dec $24
$18:caf6  10 8a		 bpl $ca82
$18:caf8  31 70		 and ($70),y
$18:cafa  23 07		 and $07,s
$18:cafc  c0 65 02	  cpy #$0265
$18:caff  6c 21 00	  jmp ($0021)
$18:cb02  60			rts
$18:cb03  84 51		 sty $51
$18:cb05  cb			wai
$18:cb06  84 d7		 sty $d7
$18:cb08  16 99		 asl $99,x
$18:cb0a  16 42		 asl $42,x
$18:cb0c  ae 5c 27	  ldx $275c
$18:cb0f  28			plp
$18:cb10  b1 48		 lda ($48),y
$18:cb12  b2 13		 lda ($13)
$18:cb14  d6 61		 dec $61,x
$18:cb16  3c c4 fe	  bit $fec4,x
$18:cb19  22 70 34 34   jsl $343470
$18:cb1d  3c e2 99	  bit $99e2,x
$18:cb20  51 50		 eor ($50),y
$18:cb22  17 86		 ora [$86],y
$18:cb24  51 97		 eor ($97),y
$18:cb26  09 11 2c	  ora #$2c11
$18:cb29  34 e6		 bit $e6,x
$18:cb2b  91 29		 sta ($29),y
$18:cb2d  04 63		 tsb $63
$18:cb2f  6a			ror a
$18:cb30  69 06 a8	  adc #$a806
$18:cb33  0f 03 6c 12   ora $126c03
$18:cb37  21 58		 and ($58,x)
$18:cb39  6d d5 25	  adc $25d5
$18:cb3c  18			clc
$18:cb3d  84 77		 sty $77
$18:cb3f  15 24		 ora $24,x
$18:cb41  98			tya
$18:cb42  0f 62 a4 0a   ora $0aa462
$18:cb46  e0 39 0e	  cpx #$0e39
$18:cb49  f1 0c		 sbc ($0c),y
$18:cb4b  93 01		 sta ($01,s),y
$18:cb4d  ee 63 0b	  inc $0b63
$18:cb50  88			dey
$18:cb51  24 17		 bit $17
$18:cb53  72 89		 adc ($89)
$18:cb55  0a			asl a
$18:cb56  c3 0e		 cmp $0e,s
$18:cb58  51 27		 eor ($27),y
$18:cb5a  c8			iny
$18:cb5b  6b			rtl
$18:cb5c  cb			wai
$18:cb5d  09 cf 7b	  ora #$7bcf
$18:cb60  10 74		 bpl $cbd6
$18:cb62  37 ef		 and [$ef],y
$18:cb64  60			rts
$18:cb65  4e f2 60	  lsr $60f2
$18:cb68  28			plp
$18:cb69  04 a4		 tsb $a4
$18:cb6b  a1 0d		 lda ($0d,x)
$18:cb6d  50 04		 bvc $cb73
$18:cb6f  22 92 cd 0b   jsl $0bcd92
$18:cb73  93 36		 sta ($36,s),y
$18:cb75  43 49		 eor $49,s
$18:cb77  91 61		 sta ($61),y
$18:cb79  24 61		 bit $61
$18:cb7b  94 b3		 sty $b3,x
$18:cb7d  88			dey
$18:cb7e  11 0c		 ora ($0c),y
$18:cb80  00 c3		 brk #$c3
$18:cb82  c6 04		 dec $04
$18:cb84  92 04		 sta ($04)
$18:cb86  4a			lsr a
$18:cb87  23 b0		 and $b0,s
$18:cb89  33 80		 and ($80,s),y
$18:cb8b  ea			nop
$18:cb8c  53 80		 eor ($80,s),y
$18:cb8e  1a			inc a
$18:cb8f  c2 41		 rep #$41
$18:cb91  64 1d		 stz $1d
$18:cb93  0b			phd
$18:cb94  c0 9c 80	  cpy #$809c
$18:cb97  21 69		 and ($69,x)
$18:cb99  05 90		 ora $90
$18:cb9b  ac 31 00	  ldy $0031
$18:cb9e  b2 94		 lda ($94)
$18:cba0  40			rti
$18:cba1  3d 03 c3	  and $c303,x
$18:cba4  84 76		 sty $76
$18:cba6  09 44 1d	  ora #$1d44
$18:cba9  0d 51 0c	  ora $0c51
$18:cbac  e2 1c		 sep #$1c
$18:cbae  a2 51		 ldx #$51
$18:cbb0  3f 43 d4 ba   and $bad443,x
$18:cbb4  23 c0		 and $c0,s
$18:cbb6  71 5a		 adc ($5a),y
$18:cbb8  d7 0e		 cmp [$0e],y
$18:cbba  5d 14 22	  eor $2214,x
$18:cbbd  51 e7		 eor ($e7),y
$18:cbbf  5d 1c 83	  eor $831c,x
$18:cbc2  ee 51 31	  inc $3151
$18:cbc5  b0 22		 bcs $cbe9
$18:cbc7  00 d0		 brk #$d0
$18:cbc9  23 d0		 and $d0,s
$18:cbcb  44 02 84	  mvp $84,$02
$18:cbce  06 a1		 asl $a1
$18:cbd0  05 59		 ora $59
$18:cbd2  99 48 09	  sta $0948,y
$18:cbd5  a4 85		 ldy $85
$18:cbd7  08			php
$18:cbd8  aa			tax
$18:cbd9  78			sei
$18:cbda  cc 01 40	  cpy $4001
$18:cbdd  48			pha
$18:cbde  94 42		 sty $42,x
$18:cbe0  48			pha
$18:cbe1  0e 49 21	  asl $2149
$18:cbe4  a4 9f		 ldy $9f
$18:cbe6  a1 44		 lda ($44,x)
$18:cbe8  0a			asl a
$18:cbe9  a5 10		 lda $10
$18:cbeb  9a			txs
$18:cbec  42 00		 wdm #$00
$18:cbee  ea			nop
$18:cbef  32 0d		 and ($0d)
$18:cbf1  14 04		 trb $04
$18:cbf3  60			rts
$18:cbf4  15 8c		 ora $8c,x
$18:cbf6  c1 b8		 cmp ($b8,x)
$18:cbf8  b0 a6		 bcs $cba0
$18:cbfa  0a			asl a
$18:cbfb  5a			phy
$18:cbfc  99 e9 6a	  sta $6ae9,y
$18:cbff  3b			tsc
$18:cc00  94 22		 sty $22,x
$18:cc02  31 7a		 and ($7a),y
$18:cc04  03 9a		 ora $9a,s
$18:cc06  d0 0d		 bne $cc15
$18:cc08  27 08		 and [$08]
$18:cc0a  9b			txy
$18:cc0b  03 8d		 ora $8d,s
$18:cc0d  84 04		 sty $04
$18:cc0f  d2 41		 cmp ($41)
$18:cc11  05 5d		 ora $5d
$18:cc13  18			clc
$18:cc14  4c f1 49	  jmp $49f1
$18:cc17  8c 61 04	  sty $0461
$18:cc1a  13 d1		 ora ($d1,s),y
$18:cc1c  f9 37 44	  sbc $4437,y
$18:cc1f  ee 31 f4	  inc $f431
$18:cc22  80 0a		 bra $cc2e
$18:cc24  56 12		 lsr $12,x
$18:cc26  2a			rol a
$18:cc27  04 38		 tsb $38
$18:cc29  ca			dex
$18:cc2a  32 d0		 and ($d0)
$18:cc2c  22 71 48 34   jsl $344871
$18:cc30  cf c0 70 96   cmp $9670c0
$18:cc34  b0 06		 bcs $cc3c
$18:cc36  40			rti
$18:cc37  00 de		 brk #$de
$18:cc39  40			rti
$18:cc3a  95 27		 sta $27,x
$18:cc3c  ae 08 81	  ldx $8108
$18:cc3f  ac 0b c1	  ldy $c10b
$18:cc42  cc 08 91	  cpy $9108
$18:cc45  78			sei
$18:cc46  39 c1 82	  and $82c1,y
$18:cc49  4b			phk
$18:cc4a  07 b0		 ora [$b0]
$18:cc4c  22 49 60 f7   jsl $f76049
$18:cc50  00 c5		 brk #$c5
$18:cc52  2c 13 84	  bit $8413
$18:cc55  ca			dex
$18:cc56  a3 c1		 lda $c1,s
$18:cc58  fa			plx
$18:cc59  52 8e		 eor ($8e)
$18:cc5b  bb			tyx
$18:cc5c  f0 92		 beq $cbf0
$18:cc5e  01 c7		 ora ($c7,x)
$18:cc60  0c 10 38	  tsb $3810
$18:cc63  20 01 82	  jsr $8201
$18:cc66  3a			dec a
$18:cc67  04 80		 tsb $80
$18:cc69  30 4d		 bmi $ccb8
$18:cc6b  60			rts
$18:cc6c  a0 0b		 ldy #$0b
$18:cc6e  48			pha
$18:cc6f  1c 10 21	  trb $2110
$18:cc72  69 16 c2	  adc #$c216
$18:cc75  44 2d 26	  mvp $26,$2d
$18:cc78  b0 50		 bcs $ccca
$18:cc7a  86 97		 stx $97
$18:cc7c  0b			phd
$18:cc7d  21 25		 and ($25,x)
$18:cc7f  e4 92		 cpx $92
$18:cc81  96 92		 stx $92,y
$18:cc83  82 6a 0a	  brl $d6f0
$18:cc86  e9 c8 2f	  sbc #$2fc8
$18:cc89  27 a0		 and [$a0]
$18:cc8b  ca			dex
$18:cc8c  9a			txs
$18:cc8d  a3 62		 lda $62,s
$18:cc8f  72 8e		 adc ($8e)
$18:cc91  69 ea 7e	  adc #$7eea
$18:cc94  03 50		 ora $50,s
$18:cc96  09 a1 94	  ora #$94a1
$18:cc99  01 9c		 ora ($9c,x)
$18:cc9b  c3 8a		 cmp $8a,s
$18:cc9d  0a			asl a
$18:cc9e  39 47 55	  and $5547,y
$18:cca1  da			phx
$18:cca2  63 98		 adc $98,s
$18:cca4  28			plp
$18:cca5  9c 10 ca	  stz $ca10
$18:cca8  90 4a		 bcc $ccf4
$18:ccaa  11 60		 ora ($60),y
$18:ccac  e4 86		 cpx $86
$18:ccae  c4 92		 cpy $92
$18:ccb0  3c 48 ee	  bit $ee48,x
$18:ccb3  14 43		 trb $43
$18:ccb5  9a			txs
$18:ccb6  51 28		 eor ($28),y
$18:ccb8  44 a3 ea	  mvp $ea,$a3
$18:ccbb  30 13		 bmi $ccd0
$18:ccbd  a8			tay
$18:ccbe  0d 04 10	  ora $1004
$18:ccc1  cc 1b 6b	  cpy $6b1b
$18:ccc4  0e 21 12	  asl $1221
$18:ccc7  f0 38		 beq $cd01
$18:ccc9  cc 03 17	  cpy $1703
$18:cccc  00 34		 brk #$34
$18:ccce  95 e1		 sta $e1,x
$18:ccd0  d6 60		 dec $60,x
$18:ccd2  10 ec		 bpl $ccc0
$18:ccd4  5e 24 82	  lsr $8224,x
$18:ccd7  08			php
$18:ccd8  33 e0		 and ($e0,s),y
$18:ccda  89 22 f1	  bit #$f122
$18:ccdd  22 b0 49 9f   jsl $9f49b0
$18:cce1  04 57		 tsb $57
$18:cce3  17 89		 ora [$89],y
$18:cce5  c2 26		 rep #$26
$18:cce7  cf 83 33 00   cmp $003383
$18:cceb  34 97		 bit $97,x
$18:cced  a1 57		 lda ($57,x)
$18:ccef  60			rts
$18:ccf0  11 cc		 ora ($cc),y
$18:ccf2  43 63		 eor $63,s
$18:ccf4  18			clc
$18:ccf5  5e 84 f5	  lsr $f584,x
$18:ccf8  9c 0c a0	  stz $a00c
$18:ccfb  40			rti
$18:ccfc  8d 0b f1	  sta $f10b
$18:ccff  ff 65 03 28   sbc $280365,x
$18:cd03  11 80		 ora ($80),y
$18:cd05  de 28 23	  dec $2328,x
$18:cd08  6c 58 61	  jmp ($6158)
$18:cd0b  08			php
$18:cd0c  d0 30		 bne $cd3e
$18:cd0e  c0 54		 cpy #$54
$18:cd10  0c 30 d8	  tsb $d830
$18:cd13  27 05		 and [$05]
$18:cd15  c2 3b		 rep #$3b
$18:cd17  0a			asl a
$18:cd18  43 84		 eor $84,s
$18:cd1a  53 a3		 eor ($a3,s),y
$18:cd1c  48			pha
$18:cd1d  fd ff e3	  sbc $e3ff,x
$18:cd20  70 08		 bvs $cd2a
$18:cd22  e4 03		 cpx $03
$18:cd24  f8			sed
$18:cd25  93 38		 sta ($38,s),y
$18:cd27  4b			phk
$18:cd28  70 20		 bvs $cd4a
$18:cd2a  f0 72		 beq $cd9e
$18:cd2c  08			php
$18:cd2d  5c 71 10 08   jml $081071
$18:cd31  14 32		 trb $32
$18:cd33  1d 02 53	  ora $5302,x
$18:cd36  0c 32 04	  tsb $0432
$18:cd39  ce 15 70	  dec $7015
$18:cd3c  c1 81		 cmp ($81,x)
$18:cd3e  01 c2		 ora ($c2,x)
$18:cd40  50 0c		 bvc $cd4e
$18:cd42  38			sec
$18:cd43  82 1b 31	  brl $fe61
$18:cd46  98			tya
$18:cd47  0a			asl a
$18:cd48  01 c6		 ora ($c6,x)
$18:cd4a  2a			rol a
$18:cd4b  e0 62 84	  cpx #$8462
$18:cd4e  06 1f		 asl $1f
$18:cd50  a3 6f		 lda $6f,s
$18:cd52  91 8c		 sta ($8c),y
$18:cd54  36 4e		 rol $4e,x
$18:cd56  62 7c 0d	  per $dad5
$18:cd59  23 fd		 and $fd,s
$18:cd5b  ff 8f 89 44   sbc $44898f,x
$18:cd5f  44 84 e1	  mvp $e1,$84
$18:cd62  84 43		 sty $43
$18:cd64  50 c1		 bvc $cd27
$18:cd66  93 19		 sta ($19,s),y
$18:cd68  84 36		 sty $36
$18:cd6a  10 14		 bpl $cd80
$18:cd6c  15 70		 ora $70,x
$18:cd6e  40			rti
$18:cd6f  22 a8 60 c9   jsl $c960a8
$18:cd73  39 82 2a	  and $2a82,y
$18:cd76  85 1c		 sta $1c
$18:cd78  90 78		 bcc $cdf2
$18:cd7a  8f 01 82 73   sta $738201
$18:cd7e  04 50		 tsb $50
$18:cd80  d2 03		 cmp ($03)
$18:cd82  10 0f		 bpl $cd93
$18:cd84  11 c4		 ora ($c4),y
$18:cd86  2e 43 32	  rol $3243
$18:cd89  1f 08 78 90   ora $907808,x
$18:cd8d  a1 62		 lda ($62,x)
$18:cd8f  12 91		 ora ($91)
$18:cd91  30 55		 bmi $cde8
$18:cd93  c3 0d		 cmp $0d,s
$18:cd95  42 86		 wdm #$86
$18:cd97  88			dey
$18:cd98  2e 45 a1	  rol $a145
$18:cd9b  2b			pld
$18:cd9c  10 f8		 bpl $cd96
$18:cd9e  2e 29 c1	  rol $c129
$18:cda1  86 8d		 stx $8d
$18:cda3  c3 02		 cmp $02,s
$18:cda5  64 03		 stz $03
$18:cda7  38			sec
$18:cda8  9c 00 2e	  stz $2e00
$18:cdab  46 81		 lsr $81
$18:cdad  0f 0a 50 90   ora $90500a
$18:cdb1  29 04 80	  and #$8004
$18:cdb4  40			rti
$18:cdb5  60			rts
$18:cdb6  00 f0		 brk #$f0
$18:cdb8  88			dey
$18:cdb9  58			cli
$18:cdba  21 08		 and ($08,x)
$18:cdbc  f1 07		 sbc ($07),y
$18:cdbe  86 01		 stx $01
$18:cdc0  2a			rol a
$18:cdc1  09 11 4d	  ora #$4d11
$18:cdc4  05 21		 ora $21
$18:cdc6  3a			dec a
$18:cdc7  29 21 0f	  and #$0f21
$18:cdca  08			php
$18:cdcb  3c 20 d0	  bit $d020,x
$18:cdce  08			php
$18:cdcf  11 5c		 ora ($5c),y
$18:cdd1  16 42		 asl $42,x
$18:cdd3  b1 02		 lda ($02),y
$18:cdd5  90 37		 bcc $ce0e
$18:cdd7  c6 76		 dec $76
$18:cdd9  64 14		 stz $14
$18:cddb  30 ce		 bmi $cdab
$18:cddd  83 c2		 sta $c2,s
$18:cddf  e6 00		 inc $00
$18:cde1  78			sei
$18:cde2  ac 9d 64	  ldy $649d
$18:cde5  3c 46 09	  bit $0946,x
$18:cde8  15 c3		 ora $c3,x
$18:cdea  69 08 fc	  adc #$fc08
$18:cded  7f c3 61 16   adc $1661c3,x
$18:cdf1  80 7c		 bra $ce6f
$18:cdf3  bf eb 39 c1   lda $c139eb,x
$18:cdf7  ac c8 a4	  ldy $a4c8
$18:cdfa  18			clc
$18:cdfb  48			pha
$18:cdfc  47 df		 eor [$df]
$18:cdfe  ff 19 13 0f   sbc $0f1319,x
$18:ce02  cd d5 54	  cmp $54d5
$18:ce05  c7 ba		 cmp [$ba]
$18:ce07  53 61		 eor ($61,s),y
$18:ce09  1f 4f fc 52   ora $52fc4f,x
$18:ce0d  01 1a		 ora ($1a,x)
$18:ce0f  80 7d		 bra $ce8e
$18:ce11  9d 4e b9	  sta $b94e,x
$18:ce14  1d 0b 04	  ora $040b,x
$18:ce17  8f 21 b1 0d   sta $0db121
$18:ce1b  18			clc
$18:ce1c  0d 92 c0	  ora $c092
$18:ce1f  28			plp
$18:ce20  3c 33 04	  bit $0433,x
$18:ce23  62 30 08	  per $d656
$18:ce26  6a			ror a
$18:ce27  18			clc
$18:ce28  53 c4		 eor ($c4,s),y
$18:ce2a  8d 01 20	  sta $2001
$18:ce2d  40			rti
$18:ce2e  60			rts
$18:ce2f  b0 0f		 bcs $ce40
$18:ce31  ab			plb
$18:ce32  04 61		 tsb $61
$18:ce34  25 d0		 and $d0
$18:ce36  fa			plx
$18:ce37  1e 42 12	  asl $1242,x
$18:ce3a  8e 08 27	  stx $2708
$18:ce3d  91 00		 sta ($00),y
$18:ce3f  26 90		 rol $90
$18:ce41  82 f8 d5	  brl $a43c
$18:ce44  46 a0		 lsr $a0
$18:ce46  02 92		 cop #$92
$18:ce48  25 80		 and $80
$18:ce4a  86 7e		 stx $7e
$18:ce4c  46 08		 lsr $08
$18:ce4e  9e 3f c4	  stz $c43f,x
$18:ce51  8a			txa
$18:ce52  37 28		 and [$28],y
$18:ce54  14 91		 trb $91
$18:ce56  de 04 32	  dec $3204,x
$18:ce59  84 74		 sty $74
$18:ce5b  0b			phd
$18:ce5c  60			rts
$18:ce5d  d6 2f		 dec $2f,x
$18:ce5f  02 7f		 cop #$7f
$18:ce61  d6 05		 dec $05,x
$18:ce63  48			pha
$18:ce64  5a			phy
$18:ce65  a1 d4		 lda ($d4,x)
$18:ce67  d8			cld
$18:ce68  16 67		 asl $67,x
$18:ce6a  08			php
$18:ce6b  e2 d0		 sep #$d0
$18:ce6d  84 81		 sty $81
$18:ce6f  0c 5d f8	  tsb $f85d
$18:ce72  90 63		 bcc $ced7
$18:ce74  4d 02 12	  eor $1202
$18:ce77  04 29		 tsb $29
$18:ce79  af e0 42 76   lda $7642e0
$18:ce7d  24 29		 bit $29
$18:ce7f  e7 ee		 sbc [$ee]
$18:ce81  f2 68		 sbc ($68)
$18:ce83  24 70		 bit $70
$18:ce85  eb			xba
$18:ce86  70 47		 bvs $cecf
$18:ce88  71 0a		 adc ($0a),y
$18:ce8a  c2 d0		 rep #$d0
$18:ce8c  2b			pld
$18:ce8d  11 58		 ora ($58),y
$18:ce8f  42 2d		 wdm #$2d
$18:ce91  18			clc
$18:ce92  86 98		 stx $98
$18:ce94  98			tya
$18:ce95  07 90		 ora [$90]
$18:ce97  5e 22 d0	  lsr $d022,x
$18:ce9a  11 fc		 ora ($fc),y
$18:ce9c  b0 3a		 bcs $ced8
$18:ce9e  42 e2		 wdm #$e2
$18:cea0  69 0c 69	  adc #$690c
$18:cea3  a4 35		 ldy $35
$18:cea5  26 90		 rol $90
$18:cea7  e3 e5		 sbc $e5,s
$18:cea9  f1 e1		 sbc ($e1),y
$18:ceab  98			tya
$18:ceac  c0 ae 5c	  cpy #$5cae
$18:ceaf  33 61		 and ($61,s),y
$18:ceb1  2d 04 1e	  and $1e04
$18:ceb4  05 c2		 ora $c2
$18:ceb6  e1 a5		 sbc ($a5,x)
$18:ceb8  00 e7		 brk #$e7
$18:ceba  f0 0a		 beq $cec6
$18:cebc  51 71		 eor ($71),y
$18:cebe  29 46 32	  and #$3246
$18:cec1  6b			rtl
$18:cec2  8a			txa
$18:cec3  f9 29 4c	  sbc $4c29,y
$18:cec6  5f 2c 0c f0   eor $f00c2c,x
$18:ceca  b8			clv
$18:cecb  93 c7		 sta ($c7,s),y
$18:cecd  0a			asl a
$18:cece  4f 17 c9 3c   eor $3cc917
$18:ced2  e4 10		 cpx $10
$18:ced4  42 29		 wdm #$29
$18:ced6  00 8b		 brk #$8b
$18:ced8  14 c4		 trb $c4
$18:ceda  f4 50 93	  pea $9350
$18:cedd  f8			sed
$18:cede  c3 61		 cmp $61,s
$18:cee0  f0 3a		 beq $cf1c
$18:cee2  d1 b8		 cmp ($b8),y
$18:cee4  21 25		 and ($25,x)
$18:cee6  40			rti
$18:cee7  89 56 c5	  bit #$c556
$18:ceea  c5 12		 cmp $12
$18:ceec  80 57		 bra $cf45
$18:ceee  0d c1 0d	  ora $0dc1
$18:cef1  80 41		 bra $cf34
$18:cef3  e1 75		 sbc ($75,x)
$18:cef5  d3 70		 cmp ($70,s),y
$18:cef7  40			rti
$18:cef8  61 90		 adc ($90,x)
$18:cefa  38			sec
$18:cefb  78			sei
$18:cefc  b4 48		 ldy $48,x
$18:cefe  a1 06		 lda ($06,x)
$18:cf00  86 61		 stx $61
$18:cf02  45 c4		 eor $c4
$18:cf04  4e 15 f0	  lsr $f015
$18:cf07  11 42		 ora ($42),y
$18:cf09  1d 04 c2	  ora $c204,x
$18:cf0c  ac 00 60	  ldy $6000
$18:cf0f  05 c1		 ora $c1
$18:cf11  e4 40		 cpx $40
$18:cf13  a0 11 10	  ldy #$1011
$18:cf16  d8			cld
$18:cf17  88			dey
$18:cf18  12 14		 ora ($14)
$18:cf1a  d3 08		 cmp ($08,s),y
$18:cf1c  10 c0		 bpl $cede
$18:cf1e  21 9d		 and ($9d,x)
$18:cf20  37 28		 and [$28],y
$18:cf22  42 a0		 wdm #$a0
$18:cf24  27 81		 and [$81]
$18:cf26  5f 01 d8 21   eor $21d801,x
$18:cf2a  90 4e		 bcc $cf7a
$18:cf2c  9a			txs
$18:cf2d  c0 0f a0	  cpy #$a00f
$18:cf30  86 17		 stx $17
$18:cf32  78			sei
$18:cf33  40			rti
$18:cf34  61 50		 adc ($50,x)
$18:cf36  38			sec
$18:cf37  69 08 61	  adc #$6108
$18:cf3a  62 90 16	  per $e5cd
$18:cf3d  12 60		 ora ($60)
$18:cf3f  21 d0		 and ($d0,x)
$18:cf41  21 68		 and ($68,x)
$18:cf43  9f 42 0b 0b   sta $0b0b42,x
$18:cf47  ad b5 06	  lda $06b5
$18:cf4a  06 cd		 asl $cd
$18:cf4c  01 d8		 ora ($d8,x)
$18:cf4e  c1 20		 cmp ($20,x)
$18:cf50  ed 00 1d	  sbc $1d00
$18:cf53  82 64 23	  brl $f2ba
$18:cf56  10 08		 bpl $cf60
$18:cf58  d0 94		 bne $ceee
$18:cf5a  5f 05 15 7e   eor $7e1505,x
$18:cf5e  84 0e		 sty $0e
$18:cf60  31 02		 and ($02),y
$18:cf62  8c f0 1c	  sty $1cf0
$18:cf65  a1 1b		 lda ($1b,x)
$18:cf67  41 83		 eor ($83,x)
$18:cf69  34 1d		 bit $1d,x
$18:cf6b  00 d1		 brk #$d1
$18:cf6d  08			php
$18:cf6e  d4 07		 pei ($07)
$18:cf70  80 ef		 bra $cf61
$18:cf72  06 50		 asl $50
$18:cf74  36 84		 rol $84,x
$18:cf76  be 10 b8	  ldx $b810,y
$18:cf79  83 30		 sta $30,s
$18:cf7b  38			sec
$18:cf7c  20 f0 89	  jsr $89f0
$18:cf7f  c2 1d		 rep #$1d
$18:cf81  02 82		 cop #$82
$18:cf83  07 30		 ora [$30]
$18:cf85  36 83		 rol $83,x
$18:cf87  82 5f 07	  brl $d6e9
$18:cf8a  68			pla
$18:cf8b  3d 85 ba	  and $ba85,x
$18:cf8e  50 a8		 bvc $cf38
$18:cf90  8f 49 9e 0c   sta $0c9e49
$18:cf94  a0 89 42	  ldy #$4289
$18:cf97  7a			ply
$18:cf98  45 f0		 eor $f0
$18:cf9a  6c 00 10	  jmp ($1000)
$18:cf9d  5a			phy
$18:cf9e  c4 0b		 cpy $0b
$18:cfa0  14 80		 trb $80
$18:cfa2  33 02		 and ($02,s),y
$18:cfa4  09 17 ae	  ora #$ae17
$18:cfa7  20 82 2d	  jsr $2d82
$18:cfaa  05 68		 ora $68
$18:cfac  05 70		 ora $70
$18:cfae  be 10 68	  ldx $6810,y
$18:cfb1  ab			plb
$18:cfb2  60			rts
$18:cfb3  16 42		 asl $42,x
$18:cfb5  da			phx
$18:cfb6  06 d0		 asl $d0
$18:cfb8  57 12		 eor [$12],y
$18:cfba  00 2c		 brk #$2c
$18:cfbc  08			php
$18:cfbd  6c 38 52	  jmp ($5238)
$18:cfc0  22 70 0c 85   jsl $850c70
$18:cfc4  71 2e		 adc ($2e),y
$18:cfc6  27 10		 and [$10]
$18:cfc8  14 03		 trb $03
$18:cfca  ac 84 a0	  ldy $a084
$18:cfcd  4c 38 44	  jmp $4438
$18:cfd0  4c 8a 10	  jmp $108a
$18:cfd3  78			sei
$18:cfd4  04 5c		 tsb $5c
$18:cfd6  ba			tsx
$18:cfd7  2c 14 87	  bit $8714
$18:cfda  ab			plb
$18:cfdb  05 44		 ora $44
$18:cfdd  11 67		 ora ($67),y
$18:cfdf  50 c0		 bvc $cfa1
$18:cfe1  a2 90 88	  ldx #$8890
$18:cfe4  87 49		 sta [$49]
$18:cfe6  9e 11 65	  stz $6511,x
$18:cfe9  68			pla
$18:cfea  1d 41 ac	  ora $ac41,x
$18:cfed  11 08		 ora ($08),y
$18:cfef  31 b4		 and ($b4),y
$18:cff1  5a			phy
$18:cff2  c0 6b 08	  cpy #$086b
$18:cff5  b4 09		 ldy $09,x
$18:cff7  f0 28		 beq $d021
$18:cff9  00 44		 brk #$44
$18:cffb  88			dey
$18:cffc  70 62		 bvs $d060
$18:cffe  91 08		 sta ($08),y
$18:d000  47 48		 eor [$48]
$18:d002  54 07 90	  mvn $90,$07
$18:d005  4b			phk
$18:d006  88			dey
$18:d007  e0 10 00	  cpx #$0010
$18:d00a  bd 02 28	  lda $2802,x
$18:d00d  a0 02 01	  ldy #$0102
$18:d010  18			clc
$18:d011  ad 33 c0	  lda $c033
$18:d014  48			pha
$18:d015  09 70 ad	  ora #$ad70
$18:d018  ab			plb
$18:d019  c8			iny
$18:d01a  e8			inx
$18:d01b  04 51		 tsb $51
$18:d01d  35 81		 and $81,x
$18:d01f  d0 2b		 bne $d04c
$18:d021  ab			plb
$18:d022  d2 52		 cmp ($52)
$18:d024  82 d4 62	  brl $32fb
$18:d027  50 43		 bvc $d06c
$18:d029  a0 2b 88	  ldy #$882b
$18:d02c  c8			iny
$18:d02d  4d 34 82	  eor $8234
$18:d030  36 05		 rol $05,x
$18:d032  7a			ply
$18:d033  2a			rol a
$18:d034  e1 57		 sbc ($57,x)
$18:d036  8a			txa
$18:d037  d0 ca		 bne $d003
$18:d039  e0 2f 27	  cpx #$272f
$18:d03c  39 30 c3	  and $c330,y
$18:d03f  f9 ff 86	  sbc $86ff,y
$18:d042  11 c2		 ora ($c2),y
$18:d044  01 fd		 ora ($fd,x)
$18:d046  ff c4 0c 63   sbc $630cc4,x
$18:d04a  01 6c		 ora ($6c,x)
$18:d04c  0b			phd
$18:d04d  60			rts
$18:d04e  69 6a f1	  adc #$f16a
$18:d051  90 04		 bcc $d057
$18:d053  c4 24		 cpy $24
$18:d055  8d f0 04	  sta $04f0
$18:d058  80 14		 bra $d06e
$18:d05a  4a			lsr a
$18:d05b  e1 01		 sbc ($01,x)
$18:d05d  02 82		 cop #$82
$18:d05f  74 69		 stz $69,x
$18:d061  02 01		 cop #$01
$18:d063  02 84		 cop #$84
$18:d065  a0 4c 43	  ldy #$434c
$18:d068  11 3f		 ora ($3f),y
$18:d06a  00 4f		 brk #$4f
$18:d06c  e2 14		 sep #$14
$18:d06e  81 32		 sta ($32,x)
$18:d070  52 05		 eor ($05)
$18:d072  a9 65 1a	  lda #$1a65
$18:d075  25 94		 and $94
$18:d077  77 ed		 adc [$ed],y
$18:d079  b1 b1		 lda ($b1),y
$18:d07b  89 92 c6	  bit #$c692
$18:d07e  2d 4b 60	  and $604b
$18:d081  d1 2d		 cmp ($2d),y
$18:d083  94 80		 sty $80,x
$18:d085  00 20		 brk #$20
$18:d087  80 3b		 bra $d0c4
$18:d089  fd fd 9f	  sbc $9ffd,x
$18:d08c  f8			sed
$18:d08d  7f d2 27 eb   adc $eb27d2,x
$18:d091  92 7a		 sta ($7a)
$18:d093  a4 9e		 ldy $9e
$18:d095  8b			phb
$18:d096  27 b2		 and [$b2]
$18:d098  41 e9		 eor ($e9,x)
$18:d09a  b2 86		 lda ($86)
$18:d09c  c1 fc		 cmp ($fc,x)
$18:d09e  10 f8		 bpl $d098
$18:d0a0  04 7c		 tsb $7c
$18:d0a2  44 b1 e1	  mvp $e1,$b1
$18:d0a5  50 ff		 bvc $d0a6
$18:d0a7  fe 13 7e	  inc $7e13,x
$18:d0aa  27 8e		 and [$8e]
$18:d0ac  35 27		 and $27,x
$18:d0ae  8d 75 79	  sta $7975
$18:d0b1  1e fb 17	  asl $17fb,x
$18:d0b4  a7 49		 lda [$49]
$18:d0b6  e9 f2 3f	  sbc #$3ff2
$18:d0b9  83 f1		 sta $f1,s
$18:d0bb  00 fe		 brk #$fe
$18:d0bd  10 86		 bpl $d045
$18:d0bf  7d 00 8e	  adc $8e00,x
$18:d0c2  0a			asl a
$18:d0c3  90 9c		 bcc $d061
$18:d0c5  32 79		 and ($79)
$18:d0c7  36 7f		 rol $7f,x
$18:d0c9  33 ec		 and ($ec,s),y
$18:d0cb  f0 6e		 beq $d13b
$18:d0cd  b4 1f		 ldy $1f,x
$18:d0cf  9a			txs
$18:d0d0  47 ce		 eor [$ce]
$18:d0d2  22 fe 29 37   jsl $3729fe
$18:d0d6  63 31		 adc $31,s
$18:d0d8  60			rts
$18:d0d9  f1 c4		 sbc ($c4),y
$18:d0db  34 f4		 bit $f4,x
$18:d0dd  0a			asl a
$18:d0de  34 02		 bit $02,x
$18:d0e0  18			clc
$18:d0e1  4e 1f 94	  lsr $941f
$18:d0e4  03 91		 ora $91,s
$18:d0e6  47 92		 eor [$92]
$18:d0e8  c6 39		 dec $39
$18:d0ea  f0 0b		 beq $d0f7
$18:d0ec  91 c8		 sta ($c8),y
$18:d0ee  c3 e5		 cmp $e5,s
$18:d0f0  3f 27 0f c2   and $c20f27,x
$18:d0f4  01 8f		 ora ($8f,x)
$18:d0f6  41 1a		 eor ($1a,x)
$18:d0f8  3b			tsc
$18:d0f9  d3 fe		 cmp ($fe,s),y
$18:d0fb  b0 f6		 bcs $d0f3
$18:d0fd  0f b4 bd c7   ora $c7bdb4
$18:d101  ef 4f 02 f8   sbc $f8024f
$18:d105  5b			tcd
$18:d106  c4 fe		 cpy $fe
$18:d108  38			sec
$18:d109  f2 4f		 sbc ($4f)
$18:d10b  96 bc		 stx $bc,y
$18:d10d  d7 e7		 cmp [$e7],y
$18:d10f  cf 46 fa 7b   cmp $7bfa46
$18:d113  d4 21		 pei ($21)
$18:d115  04 81		 tsb $81
$18:d117  c0 e3		 cpy #$e3
$18:d119  b1 db		 lda ($db),y
$18:d11b  45 a3		 eor $a3
$18:d11d  a7 d0		 lda [$d0]
$18:d11f  89 c3 33	  bit #$33c3
$18:d122  94 0c		 sty $0c,x
$18:d124  06 03		 asl $03
$18:d126  07 83		 ora [$83]
$18:d128  cf e7 3f be   cmp $be3fe7
$18:d12c  2f 46 5f a1   and $a15f46
$18:d130  2f 80 7f d9   and $d97f80
$18:d134  63 c0		 adc $c0,s
$18:d136  94 ca		 sty $ca,x
$18:d138  6f f7 f5 08   adc $08f5f7
$18:d13c  52 e0		 eor ($e0)
$18:d13e  12 0e		 ora ($0e)
$18:d140  fb			xce
$18:d141  30 24		 bmi $d167
$18:d143  d2 69		 cmp ($69)
$18:d145  fc ff ff	  jsr ($ffff,x)
$18:d148  d6 ff		 dec $ff,x
$18:d14a  e0 19		 cpx #$19
$18:d14c  66 cc		 ror $cc
$18:d14e  19 37 65	  ora $6537,y
$18:d151  c8			iny
$18:d152  1a			inc a
$18:d153  6a			ror a
$18:d154  cb			wai
$18:d155  30 1c		 bmi $d173
$18:d157  83 7f		 sta $7f,s
$18:d159  66 0b		 ror $0b
$18:d15b  e0 5a		 cpx #$5a
$18:d15d  80 ff		 bra $d15e
$18:d15f  45 0b		 eor $0b
$18:d161  7a			ply
$18:d162  ac 9e 4a	  ldy $4a9e
$18:d165  1f c2 e1 ff   ora $ffe1c2,x
$18:d169  af ff e9 ff   lda $ffe9ff
$18:d16d  f9 87 fe	  sbc $fe87,y
$18:d170  3e cc 08	  rol $08cc,x
$18:d173  f8			sed
$18:d174  78			sei
$18:d175  61 ea		 adc ($ea,x)
$18:d177  19 ea f2	  ora $f2ea,y
$18:d17a  29 bb 0e	  and #$0ebb
$18:d17d  9c 0a 1f	  stz $1f0a
$18:d180  0a			asl a
$18:d181  ff fe bf f0   sbc $f0bffe,x
$18:d185  4f ff e1 98   eor $98e1ff
$18:d189  13 e8		 ora ($e8,s),y
$18:d18b  07 fa		 ora [$fa]
$18:d18d  01 fc		 ora ($fc,x)
$18:d18f  80 7c		 bra $d20d
$18:d191  14 2f		 trb $2f
$18:d193  f4 a8 7e	  pea $7ea8
$18:d196  a6 1f		 ldx $1f
$18:d198  99 47 ce	  sta $ce47,y
$18:d19b  22 4f 68 5c   jsl $5c684f
$18:d19f  02 0f		 cop #$0f
$18:d1a1  00 83		 brk #$83
$18:d1a3  40			rti
$18:d1a4  21 90		 and ($90,x)
$18:d1a6  02 fb		 cop #$fb
$18:d1a8  73 e0		 adc ($e0,s),y
$18:d1aa  17 28		 ora [$28],y
$18:d1ac  07 22		 ora [$22]
$18:d1ae  8f 25 8c 1b   sta $1b8c25
$18:d1b2  d8			cld
$18:d1b3  8a			txa
$18:d1b4  18			clc
$18:d1b5  f8			sed
$18:d1b6  04 fd		 tsb $fd
$18:d1b8  96 27		 stx $27,y
$18:d1ba  f6 47		 inc $47,x
$18:d1bc  7a			ply
$18:d1bd  7f d6 1e be   adc $be1ed6,x
$18:d1c1  be ef 31	  ldx $31ef,y
$18:d1c4  9f 13 34 20   sta $203413,x
$18:d1c8  7b			tdc
$18:d1c9  a4 50		 ldy $50
$18:d1cb  06 fc		 asl $fc
$18:d1cd  7b			tdc
$18:d1ce  97 c3		 sta [$c3],y
$18:d1d0  73 80		 adc ($80,s),y
$18:d1d2  66 73		 ror $73
$18:d1d4  3e 39 04	  rol $0439,x
$18:d1d7  72 01		 adc ($01)
$18:d1d9  e7 f3		 sbc [$f3]
$18:d1db  ce e1 16	  dec $16e1
$18:d1de  6b			rtl
$18:d1df  32 34		 and ($34)
$18:d1e1  7f f9 9b 34   adc $349bf9,x
$18:d1e5  83 be		 sta $be,s
$18:d1e7  84 0f		 sty $0f
$18:d1e9  3c 62 11	  bit $1162,x
$18:d1ec  f7 b3		 sbc [$b3],y
$18:d1ee  66 57		 ror $57
$18:d1f0  c1 2e		 cmp ($2e,x)
$18:d1f2  81 3c		 sta ($3c,x)
$18:d1f4  41 f6		 eor ($f6,x)
$18:d1f6  1d 08 86	  ora $8608,x
$18:d1f9  db			stp
$18:d1fa  61 5f		 adc ($5f,x)
$18:d1fc  a3 ec		 lda $ec,s
$18:d1fe  36 08		 rol $08,x
$18:d200  50 81		 bvc $d183
$18:d202  77 42		 adc [$42],y
$18:d204  43 99		 eor $99,s
$18:d206  88			dey
$18:d207  7b			tdc
$18:d208  f6 14		 inc $14,x
$18:d20a  fa			plx
$18:d20b  3e e0 4e	  rol $4ee0,x
$18:d20e  0e d5 a0	  asl $a0d5
$18:d211  47 21		 eor [$21]
$18:d213  0f 7a a0 6f   ora $6fa07a
$18:d217  c1 20		 cmp ($20,x)
$18:d219  07 62		 ora [$62]
$18:d21b  77 97		 adc [$97],y
$18:d21d  b7 95		 lda [$95],y
$18:d21f  02 fb		 cop #$fb
$18:d221  c9 f2 50	  cmp #$50f2
$18:d224  2d 6c 33	  and $336c
$18:d227  d5 08		 cmp $08,x
$18:d229  d1 c0		 cmp ($c0),y
$18:d22b  7a			ply
$18:d22c  b1 13		 lda ($13),y
$18:d22e  78			sei
$18:d22f  7f bf bf fe   adc $febfbf,x
$18:d233  c7 ed		 cmp [$ed]
$18:d235  00 1f		 brk #$1f
$18:d237  3f ff df ff   and $ffdfff,x
$18:d23b  fe 6e 81	  inc $816e,x
$18:d23e  fc 35 58	  jsr ($5835,x)
$18:d241  8a			txa
$18:d242  94 43		 sty $43,x
$18:d244  53 21		 eor ($21,s),y
$18:d246  b2 d9		 lda ($d9)
$18:d248  76 d9		 ror $d9,x
$18:d24a  6c ee 77	  jmp ($77ee)
$18:d24d  67 b3		 adc [$b3]
$18:d24f  e6 73		 inc $73
$18:d251  3f 17 7f 87   and $877f17,x
$18:d255  bf c3 de f2   lda $f2dec3,x
$18:d259  e6 b2		 inc $b2
$18:d25b  f6 9c		 inc $9c,x
$18:d25d  fd 8b 7f	  sbc $7f8b,x
$18:d260  4c fe 4c	  jmp $4cfe
$18:d263  f8			sed
$18:d264  b0 59		 bcs $d2bf
$18:d266  64 b2		 stz $b2
$18:d268  c7 63		 cmp [$63]
$18:d26a  4c 85 a2	  jmp $a285
$18:d26d  d1 d3		 cmp ($d3),y
$18:d26f  e8			inx
$18:d270  44 e1 99	  mvp $99,$e1
$18:d273  ca			dex
$18:d274  04 17		 tsb $17
$18:d276  f5 2f		 sbc $2f,x
$18:d278  e9 df f3	  sbc #$f3df
$18:d27b  9f db 17 a3   sta $a317db,x
$18:d27f  2f d0 97 b7   and $b797d0
$18:d283  00 0a		 brk #$0a
$18:d285  14 0a		 trb $0a
$18:d287  04 a6		 tsb $a6
$18:d289  53 7f		 eor ($7f,s),y
$18:d28b  bf 97 82 97   lda $978297,x
$18:d28f  00 01		 brk #$01
$18:d291  80 74		 bra $d307
$18:d293  24 d2		 bit $d2
$18:d295  6b			rtl
$18:d296  fe ff ff	  inc $ffff,x
$18:d299  d6 ff		 dec $ff,x
$18:d29b  e0 19		 cpx #$19
$18:d29d  64 cb		 stz $cb
$18:d29f  29 37 66	  and #$6637
$18:d2a2  05 00		 ora $00
$18:d2a4  98			tya
$18:d2a5  73 47		 adc ($47,s),y
$18:d2a7  a2 3f		 ldx #$3f
$18:d2a9  0f ef f5 ec   ora $ecf5ef
$18:d2ad  21 d0		 and ($d0,x)
$18:d2af  7c 8b f8	  jmp ($f88b,x)
$18:d2b2  cb			wai
$18:d2b3  c0 ef		 cpy #$ef
$18:d2b5  02 f2		 cop #$f2
$18:d2b7  71 27		 adc ($27),y
$18:d2b9  6f 33 0b 80   adc $800b33
$18:d2bd  59 1c aa	  eor $aa1c,y
$18:d2c0  26 f1		 rol $f1
$18:d2c2  bf 8f 93 e3   lda $e3938f,x
$18:d2c6  00 a7		 brk #$a7
$18:d2c8  40			rti
$18:d2c9  22 7e 2d 24   jsl $242d7e
$18:d2cd  63 e7		 adc $e7,s
$18:d2cf  00 a7		 brk #$a7
$18:d2d1  c0 e3		 cpy #$e3
$18:d2d3  9e 4d 7c	  stz $7c4d,x
$18:d2d6  42 1e		 wdm #$1e
$18:d2d8  4e 1f e3	  lsr $e31f
$18:d2db  2c 61 90	  bit $9061
$18:d2de  0f 84 00 ae   ora $ae0084
$18:d2e2  1f 78 06 b6   ora $b60678,x
$18:d2e6  15 1f		 ora $1f,x
$18:d2e8  86 6f		 stx $6f
$18:d2ea  e2 b7		 sep #$b7
$18:d2ec  f8			sed
$18:d2ed  5f e2 e1 ca   eor $cae1e2,x
$18:d2f1  a0 77		 ldy #$77
$18:d2f3  d9 63 d0	  cmp $d063,y
$18:d2f6  80 78		 bra $d370
$18:d2f8  20 16 08	  jsr $0816
$18:d2fb  03 90		 ora $90,s
$18:d2fd  20 f0 09	  jsr $09f0
$18:d300  bc 02 ee	  ldy $ee02,x
$18:d303  8a			txa
$18:d304  16 60		 asl $60,x
$18:d306  c8			iny
$18:d307  bf f7 7e ed   lda $ed7ef7,x
$18:d30b  57 11		 eor [$11],y
$18:d30d  00 d5		 brk #$d5
$18:d30f  08			php
$18:d310  a6 44		 ldx $44
$18:d312  8a			txa
$18:d313  34 59		 bit $59,x
$18:d315  68			pla
$18:d316  f4 13 49	  pea $4913
$18:d319  a7 1b		 lda [$1b]
$18:d31b  8d b9 dc	  sta $dcb9
$18:d31e  c5 a2		 cmp $a2
$18:d320  dc 58 2f	  jml [$2f58]
$18:d323  46 41		 lsr $41
$18:d325  2b			pld
$18:d326  85 e8		 sta $e8
$18:d328  2b			pld
$18:d329  ff 4e 5f fa   sbc $fa5f4e,x
$18:d32d  73 bf		 adc ($bf,s),y
$18:d32f  a3 45		 lda $45,s
$18:d331  fd 30 7f	  sbc $7f30,x
$18:d334  d4 0f		 pei ($0f)
$18:d336  ff 0f fa 55   sbc $55fa0f,x
$18:d33a  62 34 a8	  per $7b71
$18:d33d  46 57		 lsr $57
$18:d33f  09 a6		 ora #$a6
$18:d341  d3 5b		 cmp ($5b,s),y
$18:d343  6d 2b 50	  adc $502b
$18:d346  e5 72		 sbc $72
$18:d348  25 32		 and $32
$18:d34a  08			php
$18:d34b  ff ba 1f f7   sbc $f71fba,x
$18:d34f  c3 de		 cmp $de,s
$18:d351  f4 f5 9f	  pea $9ff5
$18:d354  4e 5b f3	  lsr $f35b
$18:d357  46 ff		 lsr $ff
$18:d359  cd e7 fd	  cmp $fde7
$18:d35c  fa			plx
$18:d35d  9d 03 df	  sta $df03,x
$18:d360  e4 a5		 cpx $a5
$18:d362  d0 37		 bne $d39b
$18:d364  b3 0b		 lda ($0b,s),y
$18:d366  dc 03 cb	  jml [$cb03]
$18:d369  04 ec		 tsb $ec
$18:d36b  c6 35		 dec $35
$18:d36d  b0 cb		 bcs $d33a
$18:d36f  fe ff ff	  inc $ffff,x
$18:d372  1b			tcs
$18:d373  ef 80 03 9f   sbc $9f0380
$18:d377  ff 03 87 ef   sbc $ef8703,x
$18:d37b  ff e7 ff fc   sbc $fcffe7,x
$18:d37f  e7 90		 sbc [$90]
$18:d381  0b			phd
$18:d382  f4 03 cf	  pea $cf03
$18:d385  00 ed		 brk #$ed
$18:d387  c0 30		 cpy #$30
$18:d389  30 0d		 bmi $d398
$18:d38b  2c 91 f6	  bit $f691
$18:d38e  32 c9		 and ($c9)
$18:d390  e4 f2		 cpx $f2
$18:d392  fd 7e 03	  sbc $037e,x
$18:d395  88			dey
$18:d396  8c bb 60	  sty $60bb
$18:d399  b1 e9		 lda ($e9),y
$18:d39b  90 34		 bcc $d3d1
$18:d39d  7b			tdc
$18:d39e  e4 ef		 cpx $ef
$18:d3a0  2f f9 c3 d0   and $d0c3f9
$18:d3a4  1b			tcs
$18:d3a5  80 48		 bra $d3ef
$18:d3a7  0a			asl a
$18:d3a8  52 30		 eor ($30)
$18:d3aa  09 fd		 ora #$fd
$18:d3ac  e2 c1		 sep #$c1
$18:d3ae  65 92		 adc $92
$18:d3b0  cb			wai
$18:d3b1  05 81		 ora $81
$18:d3b3  3e 09 94	  rol $9409,x
$18:d3b6  47 84		 eor [$84]
$18:d3b8  17 f5		 ora [$f5],y
$18:d3ba  2f e9 df 33   and $33dfe9
$18:d3be  9e 05 a0	  stz $a005,x
$18:d3c1  a7 d2		 lda [$d2]
$18:d3c3  81 40		 sta ($40,x)
$18:d3c5  5b			tcd
$18:d3c6  b2 65		 lda ($65)
$18:d3c8  1f e1 c0 e0   ora $e0c0e1,x
$18:d3cc  34 6b		 bit $6b,x
$18:d3ce  40			rti
$18:d3cf  90 0a		 bcc $d3db
$18:d3d1  ff fd 20 3f   sbc $3f20fd,x
$18:d3d5  fa			plx
$18:d3d6  ff 7d ec 2f   sbc $2fec7d,x
$18:d3da  30 af		 bmi $d38b
$18:d3dc  b7 82		 lda [$82],y
$18:d3de  00 ff		 brk #$ff
$18:d3e0  24 78		 bit $78
$18:d3e2  48			pha
$18:d3e3  13 27		 ora ($27,s),y
$18:d3e5  e7 92		 sbc [$92]
$18:d3e7  7f 6f 9d 3a   adc $3a9d6f,x
$18:d3eb  57 fe		 eor [$fe],y
$18:d3ed  f5 fb		 sbc $fb,x
$18:d3ef  ad 7e c2	  lda $c27e
$18:d3f2  81 3c		 sta ($3c,x)
$18:d3f4  ff c0 23 10   sbc $1023c0,x
$18:d3f8  08			php
$18:d3f9  14 02		 trb $02
$18:d3fb  79 00 82	  adc $8200,y
$18:d3fe  09 0c		 ora #$0c
$18:d400  55 e3		 eor $e3,x
$18:d402  bf 47 80 74   lda $748047,x
$18:d406  29 50		 and #$50
$18:d408  08			php
$18:d409  ef 83 d1 10   sbc $10d183
$18:d40d  fd 40 a9	  sbc $a940,x
$18:d410  05 20		 ora $20
$18:d412  f2 fb		 sbc ($fb)
$18:d414  e2 f0		 sep #$f0
$18:d416  78			sei
$18:d417  07 dc		 ora [$dc]
$18:d419  c0 70		 cpy #$70
$18:d41b  53 00		 eor ($00,s),y
$18:d41d  fc a0 1f	  jsr ($1fa0,x)
$18:d420  02 70		 cop #$70
$18:d422  ea			nop
$18:d423  a0 1d		 ldy #$1d
$18:d425  d8			cld
$18:d426  06 20		 asl $20
$18:d428  e0 12		 cpx #$12
$18:d42a  23 a8		 and $a8,s
$18:d42c  77 6a		 adc [$6a],y
$18:d42e  a7 70		 lda [$70]
$18:d430  bb			tyx
$18:d431  c0 0f		 cpy #$0f
$18:d433  e9 55		 sbc #$55
$18:d435  40			rti
$18:d436  0c 89 0c	  tsb $0c89
$18:d439  26 ff		 rol $ff
$18:d43b  40			rti
$18:d43c  6e a7 53	  ror $53a7
$18:d43f  25 90		 and $90
$18:d441  e6 60		 inc $60
$18:d443  3a			dec a
$18:d444  dc 8c d6	  jml [$d68c]
$18:d447  13 ef		 ora ($ef,s),y
$18:d449  88			dey
$18:d44a  cd e1 36	  cmp $36e1
$18:d44d  7a			ply
$18:d44e  ce e6 ad	  dec $ade6
$18:d451  e1 ef		 sbc ($ef,x)
$18:d453  60			rts
$18:d454  7f d8 1b f4   adc $f41bd8,x
$18:d458  07 fc		 ora [$fc]
$18:d45a  c7 2a		 cmp [$2a]
$18:d45c  0e fa fb	  asl $fbfa
$18:d45f  5c 93 c9 bf   jml $bfc993
$18:d463  3b			tsc
$18:d464  8e 15 0b	  stx $0b15
$18:d467  4b			phk
$18:d468  24 ed		 bit $ed
$18:d46a  50 b8		 bvc $d424
$18:d46c  74 35		 stz $35,x
$18:d46e  98			tya
$18:d46f  5f f4 76 7e   eor $7e76f4,x
$18:d473  cf fe 8f c3   cmp $c38ffe
$18:d477  de f9 fb	  dec $fbf9,x
$18:d47a  6e 50 e1	  ror $e150
$18:d47d  ef 18 61 bd   sbc $bd6118
$18:d481  9e 79 ec	  stz $ec79,x
$18:d484  df 9b c3 56   cmp $56c39b,x
$18:d488  3f fc 3f 3e   and $3e3ffc,x
$18:d48c  67 ff		 adc [$ff]
$18:d48e  87 72		 sta [$72]
$18:d490  c6 e6		 dec $e6
$18:d492  71 99		 adc ($99),y
$18:d494  8c 60 60	  sty $6060
$18:d497  19 b8 c6	  ora $c6b8,y
$18:d49a  0e 01 c9	  asl $c901
$18:d49d  84 70		 sty $70
$18:d49f  e0 1c		 cpx #$1c
$18:d4a1  74 70		 stz $70,x
$18:d4a3  71 ff		 adc ($ff),y
$18:d4a5  fe 7f f8	  inc $f87f,x
$18:d4a8  8c 04 45	  sty $4504
$18:d4ab  f7 11		 sbc [$11],y
$18:d4ad  8a			txa
$18:d4ae  3c 3f f0	  bit $f03f,x
$18:d4b1  ef 8c c3 9f   sbc $9fc38c
$18:d4b5  2e e8 d7	  rol $d7e8
$18:d4b8  b4 35		 ldy $35,x
$18:d4ba  8d 3d 4b	  sta $4b3d
$18:d4bd  5a			phy
$18:d4be  8e 18 04	  stx $0418
$18:d4c1  3a			dec a
$18:d4c2  01 30		 ora ($30,x)
$18:d4c4  80 4b		 bra $d511
$18:d4c6  a0 15		 ldy #$15
$18:d4c8  e2 31		 sep #$31
$18:d4ca  93 07		 sta ($07,s),y
$18:d4cc  ff 70 c7 c3   sbc $c3c770,x
$18:d4d0  3e 77 cc	  rol $cc77,x
$18:d4d3  1d cb 1b	  ora $1bcb,x
$18:d4d6  22 ee 8e d2   jsl $d28eee
$18:d4da  e1 00		 sbc ($00,x)
$18:d4dc  86 40		 stx $40
$18:d4de  2f 90 0b f1   and $f10b90
$18:d4e2  98			tya
$18:d4e3  49 69		 eor #$69
$18:d4e5  5a			phy
$18:d4e6  d2 9b		 cmp ($9b)
$18:d4e8  c8			iny
$18:d4e9  ea			nop
$18:d4ea  c3 f0		 cmp $f0,s
$18:d4ec  25 91		 and $91
$18:d4ee  1d 09 26	  ora $2609,x
$18:d4f1  2d 14 79	  and $7914
$18:d4f4  24 51		 bit $51
$18:d4f6  2c 68 e0	  bit $e068
$18:d4f9  4b			phk
$18:d4fa  0a			asl a
$18:d4fb  95 14		 sta $14,x
$18:d4fd  45 fa		 eor $fa
$18:d4ff  82 ab c9	  brl $9ead
$18:d502  62 89 62	  per $378e
$18:d505  fd 28 85	  sbc $8528,x
$18:d508  82 0c 54	  brl $2917
$18:d50b  47 06		 eor [$06]
$18:d50d  82 bf 18	  brl $edcf
$18:d510  f3 cb		 sbc ($cb,s),y
$18:d512  3a			dec a
$18:d513  71 df		 adc ($df),y
$18:d515  14 b7		 trb $b7
$18:d517  a4 d1		 ldy $d1
$18:d519  06 78		 asl $78
$18:d51b  23 c3		 and $c3,s
$18:d51d  c1 00		 cmp ($00,x)
$18:d51f  bc 19 06	  ldy $0619,x
$18:d522  fa			plx
$18:d523  e4 17		 cpx $17
$18:d525  08			php
$18:d526  37 c1		 and [$c1],y
$18:d528  d9 ef df	  cmp $dfef,y
$18:d52b  07 78		 ora [$78]
$18:d52d  7b			tdc
$18:d52e  7d 36 41	  adc $4136,x
$18:d531  7e 47 a0	  ror $a047,x
$18:d534  03 fc		 ora $fc,s
$18:d536  ff c1 e9 f0   sbc $f0e9c1,x
$18:d53a  98			tya
$18:d53b  bf 9b cb 19   lda $19cb9b,x
$18:d53f  f8			sed
$18:d540  c0 69		 cpy #$69
$18:d542  d0 08		 bne $d54c
$18:d544  9f 8b cb 18   sta $18cb8b,x
$18:d548  0f 07 c2 01   ora $01c207
$18:d54c  f8			sed
$18:d54d  80 7f		 bra $d5ce
$18:d54f  a0 10		 ldy #$10
$18:d551  e8			inx
$18:d552  07 c6		 ora [$c6]
$18:d554  01 fc		 ora ($fc,x)
$18:d556  52 15		 eor ($15)
$18:d558  df bb 55 37   cmp $3755bb,x
$18:d55c  81 cc		 sta ($cc,x)
$18:d55e  4e 41 22	  lsr $2241
$18:d561  54 a4 88	  mvn $88,$a4
$18:d564  3d 66 ff	  and $ff66,x
$18:d567  40			rti
$18:d568  6f 1f b3 65   adc $65b31f
$18:d56c  ac f9 fb	  ldy $fbf9
$18:d56f  3a			dec a
$18:d570  dc 8d 56	  jml [$568d]
$18:d573  53 ad		 eor ($ad,s),y
$18:d575  88			dey
$18:d576  d6 e4		 dec $e4,x
$18:d578  7b			tdc
$18:d579  bc 1f 06	  ldy $061f,x
$18:d57c  7d c1 df	  adc $dfc1,x
$18:d57f  2f c3 03 7e   and $7e03c3
$18:d583  80 ff		 bra $d584
$18:d585  98			tya
$18:d586  e1 03		 sbc ($03,x)
$18:d588  fe 60 ef	  inc $ef60,x
$18:d58b  99 18 4e	  sta $4e18,y
$18:d58e  96 03		 stx $03,y
$18:d590  99 80 ef	  sta $ef80,y
$18:d593  60			rts
$18:d594  3a			dec a
$18:d595  58			cli
$18:d596  cf fe 03 f7   cmp $f703fe
$18:d59a  84 f9		 sty $f9
$18:d59c  e3 38		 sbc $38,s
$18:d59e  1f f3 7f 3a   ora $3a7ff3,x
$18:d5a2  74 bf		 stz $bf,x
$18:d5a4  f5 9b		 sbc $9b,x
$18:d5a6  85 42		 sta $42
$18:d5a8  ed d0 fc	  sbc $fcd0
$18:d5ab  d6 6f		 dec $6f,x
$18:d5ad  55 8b		 eor $8b,x
$18:d5af  af 56 f3 d9   lda $d9f356
$18:d5b3  b8			clv
$18:d5b4  7b			tdc
$18:d5b5  cf 3e 67 87   cmp $87673e
$18:d5b9  bd 7f 97	  lda $977f,x
$18:d5bc  8f 3b d7 d4   sta $d4d73b
$18:d5c0  80 43		 bra $d605
$18:d5c2  b7 00		 lda [$00],y
$18:d5c4  f3 c0		 sbc ($c0,s),y
$18:d5c6  3c 70 00	  bit $0070,x
$18:d5c9  79 03 c3	  adc $c303,y
$18:d5cc  ee 6c 20	  inc $206c
$18:d5cf  fe 9b 02	  inc $029b,x
$18:d5d2  b5 a5		 lda $a5,x
$18:d5d4  af 68 46 21   lda $214668
$18:d5d8  28			plp
$18:d5d9  eb			xba
$18:d5da  8d c2 1c	  sta $1cc2
$18:d5dd  69 04		 adc #$04
$18:d5df  e8			inx
$18:d5e0  d7 88		 cmp [$88],y
$18:d5e2  07 2e		 ora [$2e]
$18:d5e4  23 09		 and $09,s
$18:d5e6  9c 11 84	  stz $8411
$18:d5e9  31 01		 and ($01),y
$18:d5eb  88			dey
$18:d5ec  4e b8 b6	  lsr $b6b8
$18:d5ef  4c dc 13	  jmp $13dc
$18:d5f2  f7 70		 sbc [$70],y
$18:d5f4  c7 8f		 cmp [$8f]
$18:d5f6  5a			phy
$18:d5f7  7d 00 be	  adc $be00,x
$18:d5fa  19 86 e0	  ora $e086,y
$18:d5fd  82 12 89	  brl $5f12
$18:d600  1b			tcs
$18:d601  e8			inx
$18:d602  82 87 f8	  brl $ce8c
$18:d605  88			dey
$18:d606  7b			tdc
$18:d607  e4 9d		 cpx $9d
$18:d609  ba			tsx
$18:d60a  16 f5		 asl $f5,x
$18:d60c  8a			txa
$18:d60d  49 30		 eor #$30
$18:d60f  48			pha
$18:d610  84 63		 sty $63
$18:d612  cf 18 80 49   cmp $498018
$18:d616  20 14 28	  jsr $2814
$18:d619  06 05		 asl $05
$18:d61b  48			pha
$18:d61c  2a			rol a
$18:d61d  30 50		 bmi $d66f
$18:d61f  82 7c 05	  brl $db9e
$18:d622  e1 aa		 sbc ($aa,x)
$18:d624  aa			tax
$18:d625  ab			plb
$18:d626  c9 62		 cmp #$62
$18:d628  83 d2		 sta $d2,s
$18:d62a  d5 13		 cmp $13,x
$18:d62c  05 82		 ora $82
$18:d62e  0c 54 1f	  tsb $1f54
$18:d631  82 3c 05	  brl $db70
$18:d634  e1 38		 sbc ($38,x)
$18:d636  e3 df		 sbc $df,s
$18:d638  30 75		 bmi $d6af
$18:d63a  4d 5a c4	  eor $c45a
$18:d63d  9a			txs
$18:d63e  60			rts
$18:d63f  ad 18 04	  lda $0418
$18:d642  e0 cc		 cpx #$cc
$18:d644  7f e7 41 d0   adc $d041e7,x
$18:d648  b7 f8		 lda [$f8],y
$18:d64a  1b			tcs
$18:d64b  fc 63 ff	  jsr ($ff63,x)
$18:d64e  24 fd		 bit $fd
$18:d650  bd 41 3a	  lda $3a41,x
$18:d653  18			clc
$18:d654  1f fb bc 09   ora $09bcfb,x
$18:d658  84 ff		 sty $ff
$18:d65a  a5 e0		 lda $e0
$18:d65c  75 65		 adc $65,x
$18:d65e  42 e0		 wdm #$e0
$18:d660  59 10 b8	  eor $b810,y
$18:d663  43 02		 eor $02,s
$18:d665  c5 81		 cmp $81
$18:d667  47 8e		 eor [$8e]
$18:d669  7c 95 e5	  jmp ($e595,x)
$18:d66c  bf 57 0e 02   lda $020e57,x
$18:d670  ff 40 ff d8   sbc $d8ff40,x
$18:d674  2f f3 0d fc   and $fc0df3
$18:d678  42 3f		 wdm #$3f
$18:d67a  08			php
$18:d67b  3b			tsc
$18:d67c  87 3f		 sta [$3f]
$18:d67e  10 0d		 bpl $d68d
$18:d680  0c 03 08	  tsb $0803
$18:d683  50 21		 bvc $d6a6
$18:d685  c0 80		 cpy #$80
$18:d687  78			sei
$18:d688  20 16 08	  jsr $0816
$18:d68b  04 c1		 tsb $c1
$18:d68d  7a			ply
$18:d68e  3d d9 16	  and $16d9,x
$18:d691  aa			tax
$18:d692  ef dd bb a4   sbc $a4bbdd
$18:d696  c3 10		 cmp $10,s
$18:d698  94 09		 sty $09,x
$18:d69a  12 f8		 ora ($f8)
$18:d69c  5f fb 42 a1   eor $a142fb,x
$18:d6a0  5d 26 9d	  eor $9d26,x
$18:d6a3  4e 26 f7	  lsr $f726
$18:d6a6  71 16		 adc ($16),y
$18:d6a8  8b			phb
$18:d6a9  72 e1		 adc ($e1)
$18:d6ab  7c 89 84	  jmp ($8489,x)
$18:d6ae  e6 05		 inc $05
$18:d6b0  c3 de		 cmp $de,s
$18:d6b2  fd 79 7f	  sbc $7f79,x
$18:d6b5  f9 de fe	  sbc $fede,y
$18:d6b8  8f 17 f4 c2   sta $c2f417
$18:d6bc  fe 88 e1	  inc $e188,x
$18:d6bf  ff f9 e3 3a   sbc $3ae3f9,x
$18:d6c3  58			cli
$18:d6c4  cb			wai
$18:d6c5  3c 35 b1	  bit $b135,x
$18:d6c8  1d ac 25	  ora $25ac,x
$18:d6cb  aa			tax
$18:d6cc  15 ba		 ora $ba,x
$18:d6ce  1f 0a 85 81   ora $81850a,x
$18:d6d2  ff 60 5c 0f   sbc $0f5c60,x
$18:d6d6  c3 de		 cmp $de,s
$18:d6d8  2f c3 cf 66   and $66cfc3
$18:d6dc  e9 d4		 sbc #$d4
$18:d6de  9d e1 b9	  sta $b9e1,x
$18:d6e1  9c 79 6c	  stz $6c79
$18:d6e4  9b			txy
$18:d6e5  f9 f3 d4	  sbc $d4f3,y
$18:d6e8  33 b1		 and ($b1,s),y
$18:d6ea  cf 3e 67 a7   cmp $a7673e
$18:d6ee  ad 7f 87	  lda $877f
$18:d6f1  ff 8f e7 cd   sbc $cde78f,x
$18:d6f5  ff f8 20 50   sbc $5020f8,x
$18:d6f9  ff f8 fc f0   sbc $f0fcf8,x
$18:d6fd  0a			asl a
$18:d6fe  f4 02 ed	  pea $ed02
$18:d701  00 9e		 brk #$9e
$18:d703  1f c0 2c bf   ora $bf2cc0,x
$18:d707  ff fd f8 42   sbc $42f8fd,x
$18:d70b  33 c0		 and ($c0,s),y
$18:d70d  ab			plb
$18:d70e  c7 3c		 cmp [$3c]
$18:d710  75 ad		 adc $ad,x
$18:d712  2a			rol a
$18:d713  38			sec
$18:d714  06 20		 asl $20
$18:d716  35 68		 and $68,x
$18:d718  e0 40		 cpx #$40
$18:d71a  4f e0 11 02   eor $0211e0
$18:d71e  2b			pld
$18:d71f  32 c8		 and ($c8)
$18:d721  9f 65 ff 38   sta $38ff65,x
$18:d725  7a			ply
$18:d726  07 d2		 ora [$d2]
$18:d728  5e a3 f5	  lsr $f5a3,x
$18:d72b  a7 b1		 lda [$b1]
$18:d72d  7d ad ed	  adc $edad,x
$18:d730  e5 d5		 sbc $d5
$18:d732  6a			ror a
$18:d733  b0 18		 bcs $d74d
$18:d735  09 24		 ora #$24
$18:d737  93 33		 sta ($33,s),y
$18:d739  99 f3 f9	  sta $f9f3,y
$18:d73c  f7 ba		 sbc [$ba],y
$18:d73e  9f fd 57 fe   sta $fe57fd,x
$18:d742  ee 0a ae	  inc $ae0a
$18:d745  02 ff		 cop #$ff
$18:d747  24 ed		 bit $ed
$18:d749  e6 6c		 inc $6c
$18:d74b  de 78 c6	  dec $c678,x
$18:d74e  a6 85		 ldx $85
$18:d750  55 6f		 eor $6f,x
$18:d752  78			sei
$18:d753  73 c5		 adc ($c5,s),y
$18:d755  be 3e f2	  ldx $f23e,y
$18:d758  7f 97 b0 16   adc $16b097,x
$18:d75c  1d 59 53	  ora $5359,x
$18:d75f  f4 2f b0	  pea $b02f
$18:d762  0f fe 6b ef   ora $ef6bfe
$18:d766  30 f1		 bmi $d759
$18:d768  c8			iny
$18:d769  3d b6 0d	  and $0db6,x
$18:d76c  53 b8		 eor ($b8,s),y
$18:d76e  10 03		 bpl $d773
$18:d770  82 2f 0c	  brl $e3a2
$18:d773  22 01 1c 80   jsl $801c01
$18:d777  47 a0		 eor [$a0]
$18:d779  1e f9 07	  asl $07f9,x
$18:d77c  fe 81 ff	  inc $ff81,x
$18:d77f  00 84		 brk #$84
$18:d781  03 7f		 ora $7f,s
$18:d783  81 e4		 sta ($e4,x)
$18:d785  d1 3e		 cmp ($3e),y
$18:d787  77 2f		 adc [$2f],y
$18:d789  4d 91 16	  eor $1691
$18:d78c  10 28		 bpl $d7b6
$18:d78e  04 06		 tsb $06
$18:d790  01 81		 ora ($81,x)
$18:d792  80 50		 bra $d7e4
$18:d794  a0 13		 ldy #$13
$18:d796  e8			inx
$18:d797  04 31		 tsb $31
$18:d799  18			clc
$18:d79a  2a			rol a
$18:d79b  ef 5f 6f 4e   sbc $4e6f5f
$18:d79f  97 7e		 sta [$7e],y
$18:d7a1  b3 70		 lda ($70,s),y
$18:d7a3  a8			tay
$18:d7a4  5d ba 1f	  eor $1fba,x
$18:d7a7  9a			txs
$18:d7a8  cd 6a b1	  cmp $b16a
$18:d7ab  7d f6 d5	  adc $d5f6,x
$18:d7ae  fa			plx
$18:d7af  f7 0f		 sbc [$0f],y
$18:d7b1  79 e7 cc	  adc $cce7,y
$18:d7b4  f0 f7		 beq $d7ad
$18:d7b6  ad f2 f1	  lda $f1f2
$18:d7b9  e7 7e		 sbc [$7e]
$18:d7bb  f4 9b fe	  pea $fe9b
$18:d7be  87 73		 sta [$73]
$18:d7c0  38			sec
$18:d7c1  cc c6 14	  cpy $14c6
$18:d7c4  a0 f1		 ldy #$f1
$18:d7c6  0a			asl a
$18:d7c7  0c 03 93	  tsb $9303
$18:d7ca  88			dey
$18:d7cb  d0 e0		 bne $d7ad
$18:d7cd  2a			rol a
$18:d7ce  29 20		 and #$20
$18:d7d0  e3 ff		 sbc $ff,s
$18:d7d2  fc ff f0	  jsr ($f0ff,x)
$18:d7d5  18			clc
$18:d7d6  00 8a		 brk #$8a
$18:d7d8  ef ff bf df   sbc $dfbfff
$18:d7dc  f7 eb		 sbc [$eb],y
$18:d7de  ef 0f f8 c3   sbc $c3f80f
$18:d7e2  c8			iny
$18:d7e3  3e 52 f3	  rol $f352,x
$18:d7e6  1f 9d 3d 0b   ora $0b3d9d,x
$18:d7ea  e9 6f		 sbc #$6f
$18:d7ec  53 fa		 eor ($fa,s),y
$18:d7ee  e3 d9		 sbc $d9,s
$18:d7f0  3e da f6	  rol $f6da,x
$18:d7f3  f0 ec		 beq $d7e1
$18:d7f5  f6 5f		 inc $5f,x
$18:d7f7  7d 97 36	  adc $3697,x
$18:d7fa  9b			txy
$18:d7fb  dc a6 3b	  jml [$3ba6]
$18:d7fe  da			phx
$18:d7ff  99 00 7f	  sta $7f00,y
$18:d802  84 ca		 sty $ca
$18:d804  01 33		 ora ($33,x)
$18:d806  00 08		 brk #$08
$18:d808  05 01		 ora $01
$18:d80a  de 1f f1	  dec $f11f,x
$18:d80d  87 8f		 sta [$8f]
$18:d80f  ae 67 33	  ldx $3367
$18:d812  bb			tyx
$18:d813  cc f9 9c	  cpy $9cf9
$18:d816  ce ef 30	  dec $30ef
$18:d819  9e dc c8	  stz $c8dc,x
$18:d81c  01 7c		 ora ($7c,x)
$18:d81e  00 a0		 brk #$a0
$18:d820  05 02		 ora $02
$18:d822  fb			xce
$18:d823  7f cd c1 66   adc $66c1cd,x
$18:d827  fd d6 8e	  sbc $8ed6,x
$18:d82a  61 e7		 adc ($e7,x)
$18:d82c  a1 6f		 lda ($6f,x)
$18:d82e  67 9c		 adc [$9c]
$18:d830  3a			dec a
$18:d831  07 fe		 ora [$fe]
$18:d833  78			sei
$18:d834  3e 28 22	  rol $2228,x
$18:d837  08			php
$18:d838  63 90		 adc $90,s
$18:d83a  0a			asl a
$18:d83b  14 02		 trb $02
$18:d83d  7c 3e 1f	  jmp ($1f3e,x)
$18:d840  4d 91 1e	  eor $1e91
$18:d843  de db 05	  dec $05db,x
$18:d846  ca			dex
$18:d847  60			rts
$18:d848  7e 08 f2	  ror $f208,x
$18:d84b  7a			ply
$18:d84c  71 b8		 adc ($b8),y
$18:d84e  1e 1f 0c	  asl $0c1f,x
$18:d851  7d eb ed	  adc $edeb,x
$18:d854  a9 c4		 lda #$c4
$18:d856  ad f2 ec	  lda $ecf2
$18:d859  4e 23 6f	  lsr $6f23
$18:d85c  b6 b2		 ldx $b2,y
$18:d85e  59 37 7b	  eor $7b37,y
$18:d861  ae 7f 2a	  ldx $2a7f
$18:d864  6d 34 99	  adc $9934
$18:d867  fb			xce
$18:d868  67 fd		 adc [$fd]
$18:d86a  1c dd df	  trb $dfdd
$18:d86d  7f 49 f6 e6   adc $e6f649,x
$18:d871  ff f4 5f fc   sbc $fc5ff4,x
$18:d875  d6 7f		 dec $7f,x
$18:d877  cb			wai
$18:d878  a9 d0		 lda #$d0
$18:d87a  3d fe 4a	  and $4afe,x
$18:d87d  4d 03 6b	  eor $6b03
$18:d880  30 ab		 bmi $d82d
$18:d882  c4 38		 cpy $38
$18:d884  b8			clv
$18:d885  0d 5e 21	  ora $215e
$18:d888  de 17 fd	  dec $fd17,x
$18:d88b  ff fe 37 df   sbc $df37fe,x
$18:d88f  00 07		 brk #$07
$18:d891  3f ff ef ff   and $ffefff,x
$18:d895  df ff f7 77   cmp $77f7ff,x
$18:d899  f8			sed
$18:d89a  2f bc 3f e3   and $e33fbc
$18:d89e  0f 20 f9 4b   ora $4bf920
$18:d8a2  cc 7e 74	  cpy $747e
$18:d8a5  f4 2f a5	  pea $a52f
$18:d8a8  bd 4f eb	  lda $eb4f,x
$18:d8ab  8f 64 fb 6b   sta $6bfb64
$18:d8af  db			stp
$18:d8b0  c3 ff		 cmp $ff,s
$18:d8b2  77 6b		 adc [$6b],y
$18:d8b4  fb			xce
$18:d8b5  b6 7b		 ldx $7b,y
$18:d8b7  3f be cf 99   and $99cfbe,x
$18:d8bb  4c ee d3	  jmp $d3ee
$18:d8be  01 ed		 ora ($ed,x)
$18:d8c0  4c 80 07	  jmp $0780
$18:d8c3  c2 66		 rep #$66
$18:d8c5  22 10 fb 4c   jsl $4cfb10
$18:d8c9  e6 57		 inc $57
$18:d8cb  79 97 37	  adc $3797,y
$18:d8ce  9b			txy
$18:d8cf  dc e6 0b	  jml [$0be6]
$18:d8d2  db			stp
$18:d8d3  99 00 1f	  sta $1f00,y
$18:d8d6  84 c8		 sty $c8
$18:d8d8  44 23 f6	  mvp $f6,$23
$18:d8db  f4 d9 09	  pea $09d9
$18:d8de  e0 ef		 cpx #$ef
$18:d8e0  0c 09 50	  tsb $5009
$18:d8e3  7f f7 ef fd   adc $fdeff7,x
$18:d8e7  09 de 11	  ora #$11de
$18:d8ea  e2 f0		 sep #$f0
$18:d8ec  bf 82 fc 64   lda $64fc82,x
$18:d8f0  17 4a		 ora [$4a],y
$18:d8f2  c4 3f		 cpy $3f
$18:d8f4  70 6f		 bvs $d965
$18:d8f6  9c 3f ef	  stz $ef3f
$18:d8f9  09 77		 ora #$77
$18:d8fb  87 da		 sta [$da]
$18:d8fd  21 f7		 and ($f7,x)
$18:d8ff  88			dey
$18:d900  1b			tcs
$18:d901  c2 21		 rep #$21
$18:d903  00 83		 brk #$83
$18:d905  41 a1		 eor ($a1,x)
$18:d907  e8			inx
$18:d908  31 40		 and ($40),y
$18:d90a  84 42		 sty $42
$18:d90c  13 10		 ora ($10,s),y
$18:d90e  87 44		 sta [$44]
$18:d910  21 1f		 and ($1f,x)
$18:d912  f8			sed
$18:d913  46 fe		 lsr $fe
$18:d915  c1 3f		 cmp ($3f,x)
$18:d917  f8			sed
$18:d918  5f f2 0e f0   eor $f00ef2,x
$18:d91c  b7 c2		 lda [$c2],y
$18:d91e  3d e8 e1	  and $e1e8,x
$18:d921  84 40		 sty $40
$18:d923  2c 16 0f	  bit $0f16
$18:d926  82 8c 54	  brl $2db5
$18:d929  21 08		 and ($08,x)
$18:d92b  c8			iny
$18:d92c  42 2e		 wdm #$2e
$18:d92e  10 83		 bpl $d8b3
$18:d930  f8			sed
$18:d931  2b			pld
$18:d932  fd 7d 95	  sbc $957d,x
$18:d935  58			cli
$18:d936  85 2a		 sta $2a
$18:d938  11 95		 ora ($95),y
$18:d93a  c2 69		 rep #$69
$18:d93c  b4 d6		 ldy $d6,x
$18:d93e  db			stp
$18:d93f  4e e7 72	  lsr $72e7
$18:d942  33 09		 and ($09,s),y
$18:d944  9c ce 3f	  stz $3fce
$18:d947  ef 3a 06 1e   sbc $1e063a
$18:d94b  f7 a7		 sbc [$a7],y
$18:d94d  ac fa 72	  ldy $72fa
$18:d950  df 9a 37 f6   cmp $f6379a,x
$18:d954  65 3f		 adc $3f
$18:d956  1f 83 bf c0   ora $c0bf83,x
$18:d95a  1e 11 f1	  asl $f111,x
$18:d95d  17 8c		 ora [$8c],y
$18:d95f  fc 89 e5	  jsr ($e589,x)
$18:d962  5f 33 79 df   eor $df7933,x
$18:d966  d1 1e		 cmp ($1e),y
$18:d968  99 f5 57	  sta $57f5,y
$18:d96b  ae fd 99	  ldx $99fd
$18:d96e  ed df fb	  sbc $fbdf
$18:d971  c5 3e		 cmp $3e
$18:d973  11 37		 ora ($37),y
$18:d975  88			dey
$18:d976  3b			tsc
$18:d977  c3 eb		 cmp $eb,s
$18:d979  15 fa		 ora $fa,x
$18:d97b  44 df 21	  mvp $21,$df
$18:d97e  f5 8a		 sbc $8a,x
$18:d980  44 e1 11	  mvp $11,$e1
$18:d983  70 00		 bvs $d985
$18:d985  bf c2 24 00   lda $0024c2,x
$18:d989  59 7c a3	  eor $a37c,y
$18:d98c  df 28 87 f2   cmp $f28728,x
$18:d990  25 fc		 and $fc
$18:d992  8e 7c a3	  stx $a37c
$18:d995  1f a8 0a 80   ora $800aa8,x
$18:d999  54 39 11	  mvn $11,$39
$18:d99c  00 f8		 brk #$f8
$18:d99e  7a			ply
$18:d99f  04 47		 tsb $47
$18:d9a1  68			pla
$18:d9a2  11 1e		 ora ($1e),y
$18:d9a4  cf 65 f7 fb   cmp $fbf765
$18:d9a8  73 69		 adc ($69,s),y
$18:d9aa  bd ca e0	  lda $e0ca,x
$18:d9ad  bd b6 54	  lda $54b6,x
$18:d9b0  c1 f8		 cmp ($f8,x)
$18:d9b2  53 66		 eor ($66,s),y
$18:d9b4  54 c9 98	  mvn $98,$c9
$18:d9b7  fd bf f0	  sbc $f0bf,x
$18:d9ba  0c 09 40	  tsb $4009
$18:d9bd  7f f7 ef fd   adc $fdeff7,x
$18:d9c1  0b			phd
$18:d9c2  df 20 f4 d9   cmp $d9f420,x
$18:d9c6  0b			phd
$18:d9c7  60			rts
$18:d9c8  de 0b f1	  dec $f10b,x
$18:d9cb  80 5b		 bra $da28
$18:d9cd  c5 1c		 cmp $1c
$18:d9cf  80 47		 bra $da18
$18:d9d1  8d 42 5b	  sta $5b42
$18:d9d4  0f cd 93 db   ora $db93cd
$18:d9d8  20 fc d1	  jsr $d1fc
$18:d9db  3d 67 40	  and $4067,x
$18:d9de  39 09 6c	  and $6c09,y
$18:d9e1  0d 61 0e	  ora $0e61
$18:d9e4  80 46		 bra $da2c
$18:d9e6  a0 10		 ldy #$10
$18:d9e8  63 40		 adc $40,s
$18:d9ea  a0 48		 ldy #$48
$18:d9ec  d6 08		 dec $08,x
$18:d9ee  ef 4f fa c3   sbc $c3fa4f
$18:d9f2  d8			cld
$18:d9f3  3e d2 f7	  rol $f7d2,x
$18:d9f6  1f bd 3c 0b   ora $0b3cbd,x
$18:d9fa  e1 6f		 sbc ($6f,x)
$18:d9fc  13 f8		 ora ($f8,s),y
$18:d9fe  e3 c9		 sbc $c9,s
$18:da00  3e 5a f3	  rol $f35a,x
$18:da03  5f 9f 3d 1b   eor $1b3d9f,x
$18:da07  e9 ef 57	  sbc #$57ef
$18:da0a  fb			xce
$18:da0b  03 da		 ora $da,s
$18:da0d  3e de af	  rol $afde,x
$18:da10  b4 43		 ldy $43,x
$18:da12  e3 17		 sbc $17,s
$18:da14  f8			sed
$18:da15  45 be		 eor $be
$18:da17  71 37		 adc ($37),y
$18:da19  89 7c a2	  bit #$a27c
$18:da1c  1f 48 bc 5e   ora $5ebc48,x
$18:da20  11 16		 ora ($16),y
$18:da22  84 3f		 sty $3f
$18:da24  c2 28		 rep #$28
$18:da26  00 37		 brk #$37
$18:da28  f8			sed
$18:da29  44 e1 1c	  mvp $1c,$e1
$18:da2c  f8			sed
$18:da2d  46 bf		 lsr $bf
$18:da2f  51 8f		 eor ($8f),y
$18:da31  b4 04		 ldy $04,x
$18:da33  c2 df		 rep #$df
$18:da35  08			php
$18:da36  87 f2		 sta [$f2]
$18:da38  25 fc		 and $fc
$18:da3a  8d 7c a3	  sta $a37c
$18:da3d  d1 10		 cmp ($10),y
$18:da3f  a4 44		 ldy $44
$18:da41  03 e0		 ora $e0,s
$18:da43  23 6e		 and $6e,s
$18:da45  44 41 bd	  mvp $bd,$41
$18:da48  e3 ff		 sbc $ff,s
$18:da4a  28			plp
$18:da4b  79 87 ce	  adc $ce87,y
$18:da4e  5e 83 f4	  lsr $f483,x
$18:da51  a7 a9		 lda [$a9]
$18:da53  7d 6d ec	  adc $ec6d,x
$18:da56  7f 6c 7b a7   adc $a77b6c,x
$18:da5a  df 5e 0b f0   cmp $f00b5e,x
$18:da5e  e7 8b		 sbc [$8b]
$18:da60  7c 7d e4	  jmp ($e47d,x)
$18:da63  ff 30 79 c7   sbc $c77930,x
$18:da67  d0 5e		 bne $dac7
$18:da69  93 f5		 sta ($f5,s),y
$18:da6b  27 ad		 and [$ad]
$18:da6d  7d 8d ed	  adc $ed8d,x
$18:da70  7f 6f 27 fe   adc $fe276f,x
$18:da74  01 e0		 ora ($e0,x)
$18:da76  9f f7 e7 ff   sta $ffe7f7,x
$18:da7a  f9 07 82	  sbc $8207,y
$18:da7d  40			rti
$18:da7e  f3 0e		 sbc ($0e,s),y
$18:da80  ac fd e2	  ldy $e2fd
$18:da83  0d e0 90	  ora $90e0
$18:da86  37 86		 and [$86],y
$18:da88  41 1f		 eor ($1f,x)
$18:da8a  02 83		 cop #$83
$18:da8c  78			sei
$18:da8d  80 20		 bra $daaf
$18:da8f  ef 07 70 04   sbc $047007
$18:da93  85 d8		 sta $d8
$18:da95  5f fa ab bc   eor $bcabfa,x
$18:da99  02 a4		 cop #$a4
$18:da9b  eb			xba
$18:da9c  40			rti
$18:da9d  f2 bb		 sbc ($bb)
$18:da9f  c2 0f		 rep #$0f
$18:daa1  fc fd ff	  jsr ($fffd,x)
$18:daa4  3f f0 48 3c   and $3c48f0,x
$18:daa8  10 66		 bpl $db10
$18:daaa  15 3f		 ora $3f,x
$18:daac  e0 c4 1b	  cpx #$1bc4
$18:daaf  c1 04		 cmp ($04,x)
$18:dab1  6f 0c 13 f0   adc $f0130c
$18:dab5  45 06		 eor $06
$18:dab7  f1 10		 sbc ($10),y
$18:dab9  40			rti
$18:daba  34 21		 bit $21,x
$18:dabc  e3 09		 sbc $09,s
$18:dabe  90 4d		 bcc $db0d
$18:dac0  04 92		 tsb $92
$18:dac2  de 1f 9d	  dec $9d1f,x
$18:dac5  cb			wai
$18:dac6  c7 62		 cmp [$62]
$18:dac8  37 b7		 and [$b7],y
$18:daca  fe ad f3	  inc $f3ad,x
$18:dacd  98			tya
$18:dace  43 20		 eor $20,s
$18:dad0  11 c8		 ora ($c8),y
$18:dad2  01 fd		 ora ($fd,x)
$18:dad4  9b			txy
$18:dad5  c0 7f 04	  cpy #$047f
$18:dad8  77 a7		 adc [$a7],y
$18:dada  fd 61 ec	  sbc $ec61,x
$18:dadd  1f 69 7b 8f   ora $8f7b69,x
$18:dae1  de 9e 05	  dec $059e,x
$18:dae4  f0 b7		 beq $da9d
$18:dae6  89 fc 71	  bit #$71fc
$18:dae9  e4 9f		 cpx $9f
$18:daeb  2d 79 af	  and $af79
$18:daee  cf 9e 8d f4   cmp $f48d9e
$18:daf2  f7 ab		 sbc [$ab],y
$18:daf4  fd 81 ed	  sbc $ed81,x
$18:daf7  1f 6f 57 fd   ora $fd576f,x
$18:dafb  dc 17 ed	  jml [$ed17]
$18:dafe  ae 97 33	  ldx $3397
$18:db01  99 ca e0	  sta $e0ca,y
$18:db04  7b			tdc
$18:db05  7d b7 b9	  adc $b9b7,x
$18:db08  37 82		 and [$82],y
$18:db0a  fd 00 e1	  sbc $e100,x
$18:db0d  c6 3b		 dec $3b
$18:db0f  72 4e		 adc ($4e)
$18:db11  1c f3 32	  trb $32f3
$18:db14  06 36		 asl $36
$18:db16  f7 87		 sbc [$87],y
$18:db18  fc 61 e3	  jsr ($e361,x)
$18:db1b  eb			xba
$18:db1c  f3 c9		 sbc ($c9,s),y
$18:db1e  3f b7 ce 9d   and $9dceb7,x
$18:db22  2b			pld
$18:db23  ff 7a fd d6   sbc $d6fd7a,x
$18:db27  bf 65 40 9e   lda $9e4065,x
$18:db2b  3b			tsc
$18:db2c  c2 31		 rep #$31
$18:db2e  00 81		 brk #$81
$18:db30  40			rti
$18:db31  27 90		 and [$90]
$18:db33  08			php
$18:db34  21 90		 and ($90,x)
$18:db36  c7 c5		 cmp [$c5]
$18:db38  fd a0 78	  sbc $78a0,x
$18:db3b  e4 1f		 cpx $1f
$18:db3d  da			phx
$18:db3e  a7 ce		 lda [$ce]
$18:db40  65 e3		 adc $e3
$18:db42  b1 7c		 lda ($7c),y
$18:db44  ee 47 72	  inc $7247
$18:db47  30 84		 bmi $dacd
$18:db49  70 c0		 bvs $db0b
$18:db4b  30 c4		 bmi $db11
$18:db4d  00 a1		 brk #$a1
$18:db4f  51 1d		 eor ($1d),y
$18:db51  e9 ff 58	  sbc #$58ff
$18:db54  7b			tdc
$18:db55  07 da		 ora [$da]
$18:db57  5e e3 f7	  lsr $f7e3,x
$18:db5a  a7 81		 lda [$81]
$18:db5c  7c 2d e2	  jmp ($e22d,x)
$18:db5f  7f 1c 79 27   adc $27791c,x
$18:db63  cb			wai
$18:db64  5e 6b f3	  lsr $f36b,x
$18:db67  e7 a3		 sbc [$a3]
$18:db69  7d 3d ea	  adc $ea3d,x
$18:db6c  ff 60 7b 47   sbc $477b60,x
$18:db70  db			stp
$18:db71  d5 d7		 cmp $d7,x
$18:db73  e1 e6		 sbc ($e6,x)
$18:db75  73 39		 adc ($39,s),y
$18:db77  7c 1e 6f	  jmp ($6f1e,x)
$18:db7a  37 95		 and [$95],y
$18:db7c  c0 f6 7b	  cpy #$7bf6
$18:db7f  2f 30 ed f6   and $f6ed30
$18:db83  f0 33		 beq $dbb8
$18:db85  ce dc 93	  dec $93dc
$18:db88  83 3c		 sta $3c,s
$18:db8a  ec c9 38	  cpx $38c9
$18:db8d  73 cc		 adc ($cc,s),y
$18:db8f  d8			cld
$18:db90  08			php
$18:db91  73 32		 adc ($32,s),y
$18:db93  46 f7		 lsr $f7
$18:db95  87 fc		 sta [$fc]
$18:db97  61 e3		 adc ($e3,x)
$18:db99  eb			xba
$18:db9a  ff c3 7f f1   sbc $f17fc3,x
$18:db9e  ff 84 c3 c9   sbc $c9c384,x
$18:dba2  24 f1		 bit $f1
$18:dba4  d8			cld
$18:dba5  fc 72 32	  jsr ($3272,x)
$18:dba8  b8			clv
$18:dba9  d8			cld
$18:dbaa  c7 c5		 cmp [$c5]
$18:dbac  0f 80 46 e0   ora $e04680
$18:dbb0  11 c3		 ora ($c3),y
$18:dbb2  32 ff		 and ($ff)
$18:dbb4  ea			nop
$18:dbb5  1f ff e4 3e   ora $3ee4ff,x
$18:dbb9  1d 27 93	  ora $9327,x
$18:dbbc  70 f8		 bvs $dbb6
$18:dbbe  5e 7b 37	  lsr $377b,x
$18:dbc1  8f 45 e7 f3   sta $f3e745
$18:dbc5  0f 8b e1 00   ora $00e18b
$18:dbc9  ec 40 27	  cpx $2740
$18:dbcc  90 08		 bcc $dbd6
$18:dbce  c1 98		 cmp ($98,x)
$18:dbd0  51 21		 eor ($21),y
$18:dbd2  ff d5 23 c2   sbc $c223d5,x
$18:dbd6  ab			plb
$18:dbd7  00 49		 brk #$49
$18:dbd9  82 3c 52	  brl $2e18
$18:dbdc  c6 3e		 dec $3e
$18:dbde  2d 52 88	  and $8852
$18:dbe1  54 de b7	  mvn $b7,$de
$18:dbe4  f6 47		 inc $47,x
$18:dbe6  b6 7d		 ldx $7d,y
$18:dbe8  d5 ef		 cmp $ef,x
$18:dbea  bf 06 78 77   lda $777806,x
$18:dbee  c5 de		 cmp $de
$18:dbf0  3f f2 87 98   and $9887f2,x
$18:dbf4  7c e5 e8	  jmp ($e8e5,x)
$18:dbf7  3f 4a 7a 97   and $977a4a,x
$18:dbfb  d6 de		 dec $de,x
$18:dbfd  c7 f6		 cmp [$f6]
$18:dbff  c7 b7		 cmp [$b7]
$18:dc01  8f af c3 cc   sta $ccc3af
$18:dc05  e6 5d		 inc $5d
$18:dc07  e5 95		 sbc $95
$18:dc09  c0 f9 fc	  cpy #$fcf9
$18:dc0c  ff fb f7 fe   sbc $fef7fb,x
$18:dc10  01 81		 ora ($81,x)
$18:dc12  9e 76 e4	  stz $e476,x
$18:dc15  8f f2 e1 cf   sta $cfe1f2
$18:dc19  30 31		 bmi $dc4c
$18:dc1b  8b			phb
$18:dc1c  f3 7b		 sbc ($7b,s),y
$18:dc1e  c3 9e		 cmp $9e,s
$18:dc20  2d f1 f7	  and $f7f1
$18:dc23  79 ec fe	  adc $feec,y
$18:dc26  3a			dec a
$18:dc27  1f c2 e1 f8   ora $f8e1c2,x
$18:dc2b  ac 7f e9	  ldy $e97f
$18:dc2e  ff f9 87 fe   sbc $fe87f9,x
$18:dc32  3e fd 08	  rol $08fd,x
$18:dc35  c4 02		 cpy $02
$18:dc37  39 00 87	  and $8700,y
$18:dc3a  c0 20 e3	  cpy #$e320
$18:dc3d  e7 f9		 sbc [$f9]
$18:dc3f  fc bc 7e	  jsr ($7ebc,x)
$18:dc42  28			plp
$18:dc43  3c 1a 3f	  bit $3f1a,x
$18:dc46  1a			inc a
$18:dc47  ff fe bf f0   sbc $f0bffe,x
$18:dc4b  4f ff e1 fa   eor $fae1ff
$18:dc4f  10 c3		 bpl $dc14
$18:dc51  00 fe		 brk #$fe
$18:dc53  20 1e 01	  jsr $011e
$18:dc56  f3 ff		 sbc ($ff,s),y
$18:dc58  e8			inx
$18:dc59  df 32 d0 24   cmp $24d032,x
$18:dc5d  24 7c		 bit $7c
$18:dc5f  07 f0		 ora [$f0]
$18:dc61  4f d7 fe ab   eor $abfed7
$18:dc65  fd fe c0	  sbc $c0fe,x
$18:dc68  91 84		 sta ($84),y
$18:dc6a  b1 05		 lda ($05),y
$18:dc6c  b0 bf		 bcs $dc2d
$18:dc6e  40			rti
$18:dc6f  7c 0b 30	  jmp ($300b,x)
$18:dc72  5c 8a f8 d9   jml $d9f88a
$18:dc76  5e db f7	  lsr $f7db,x
$18:dc79  67 bf		 adc [$bf]
$18:dc7b  7c 1d e1	  jmp ($e11d,x)
$18:dc7e  ff 18 79 07   sbc $077918,x
$18:dc82  ca			dex
$18:dc83  5e 63 f3	  lsr $f363,x
$18:dc86  a7 a1		 lda [$a1]
$18:dc88  7d 2d ea	  adc $ea2d,x
$18:dc8b  7f 5c 7b 27   adc $277b5c,x
$18:dc8f  db			stp
$18:dc90  5e eb f7	  lsr $f7eb,x
$18:dc93  e7 83		 sbc [$83]
$18:dc95  7c 3d e2	  jmp ($e23d,x)
$18:dc98  ff 20 79 47   sbc $477920,x
$18:dc9c  cc 5e 73	  cpy $735e
$18:dc9f  f4 27 a5	  pea $a527
$18:dca2  7d 4d eb	  adc $eb4d,x
$18:dca5  7f 64 7b 67   adc $677b64,x
$18:dca9  dd 5e fb	  cmp $fb5e,x
$18:dcac  f0 67		 beq $dd15
$18:dcae  87 7c		 sta [$7c]
$18:dcb0  5d e3 ff	  eor $ffe3,x
$18:dcb3  28			plp
$18:dcb4  79 87 ce	  adc $ce87,y
$18:dcb7  5e 83 f4	  lsr $f483,x
$18:dcba  a7 a9		 lda [$a9]
$18:dcbc  7d 6d ec	  adc $ec6d,x
$18:dcbf  7f 6c 7b a4   adc $a47b6c,x
$18:dcc3  c0 04 1a	  cpy #$1a04
$18:dcc6  b5 4e		 lda $4e,x
$18:dcc8  2e 93 8b	  rol $8b93
$18:dccb  f4 e3 11	  pea $11e3
$18:dcce  38			sec
$18:dccf  d5 4e		 cmp $4e,x
$18:dcd1  39 93 8f	  and $8f93,y
$18:dcd4  74 e2		 stz $e2,x
$18:dcd6  21 39		 and ($39,x)
$18:dcd8  91 4e		 sta ($4e),y
$18:dcda  67 93		 adc [$93]
$18:dcdc  9a			txs
$18:dcdd  34 e6		 bit $e6,x
$18:dcdf  c1 39		 cmp ($39,x)
$18:dce1  b5 4e		 lda $4e,x
$18:dce3  71 93		 adc ($93),y
$18:dce5  9c f4 e7	  stz $e7f4
$18:dce8  71 39		 adc ($39),y
$18:dcea  e1 4e		 sbc ($4e,x)
$18:dcec  7c 93 9f	  jmp ($9f93,x)
$18:dcef  b4 e6		 ldy $e6,x
$18:dcf1  01 3a		 ora ($3a,x)
$18:dcf3  85 4e		 sta $4e
$18:dcf5  a2 93 aa	  ldx #$aa93
$18:dcf8  34 ea		 bit $ea,x
$18:dcfa  f1 3a		 sbc ($3a),y
$18:dcfc  d5 4e		 cmp $4e,x
$18:dcfe  bb			tyx
$18:dcff  93 a8		 sta ($a8,s),y
$18:dd01  74 ee		 stz $ee,x
$18:dd03  81 3b		 sta ($3b,x)
$18:dd05  b9 4e f2	  lda $f24e,y
$18:dd08  93 be		 sta ($be,s),y
$18:dd0a  34 ef		 bit $ef,x
$18:dd0c  f1 3b		 sbc ($3b),y
$18:dd0e  8d 4f 29	  sta $294f
$18:dd11  93 cb		 sta ($cb,s),y
$18:dd13  f4 f3 41	  pea $41f3
$18:dd16  3c e9 4f	  bit $4fe9,x
$18:dd19  20 93 d9	  jsr $d993
$18:dd1c  34 f6		 bit $f6,x
$18:dd1e  b1 3d		 lda ($3d),y
$18:dd20  c5 4f		 cmp $4f
$18:dd22  75 83		 adc $83,x
$18:dd24  a0 9f 5a	  ldy #$5a9f
$18:dd27  27 d9		 and [$d9]
$18:dd29  a9 f7 32	  lda #$32f7
$18:dd2c  7d ee 9f	  adc $9fee,x
$18:dd2f  40			rti
$18:dd30  27 f1		 and [$f1]
$18:dd32  a9 fc 92	  lda #$92fc
$18:dd35  7f 3e 9f d2   adc $d29f3e,x
$18:dd39  27 f6		 and [$f6]
$18:dd3b  29 fc 1e	  and #$1efc
$18:dd3e  00 5a		 brk #$5a
$18:dd40  2b			pld
$18:dd41  64 ff		 stz $ff
$18:dd43  ff ff 2c a7   sbc $a72cff,x
$18:dd47  70 c0		 bvs $dd09
$18:dd49  f5 aa		 sbc $aa,x
$18:dd4b  01 85		 ora ($85,x)
$18:dd4d  20 25 e1	  jsr $e125
$18:dd50  3b			tsc
$18:dd51  a6 90		 ldx $90
$18:dd53  fc a7 d6	  jsr ($d6a7,x)
$18:dd56  e0 18 14	  cpx #$1418
$18:dd59  c2 06		 rep #$06
$18:dd5b  90 4c		 bcc $dda9
$18:dd5d  a4 52		 ldy $52
$18:dd5f  80 99		 bra $dcfa
$18:dd61  c9 b9 d0	  cmp #$d0b9
$18:dd64  cc 20 71	  cpy $7120
$18:dd67  25 da		 and $da
$18:dd69  5d 98 4a	  eor $4a98,x
$18:dd6c  c1 6c		 cmp ($6c,x)
$18:dd6e  91 d0		 sta ($d0),y
$18:dd70  61 e5		 adc ($e5,x)
$18:dd72  a3 ab		 lda $ab,s
$18:dd74  50 4b		 bvc $ddc1
$18:dd76  41 f0		 eor ($f0,x)
$18:dd78  5f 0c 79 c8   eor $c8790c,x
$18:dd7c  25 a2		 and $a2
$18:dd7e  75 81		 adc $81,x
$18:dd80  ec 0b 45	  cpx $450b
$18:dd83  d8			cld
$18:dd84  3a			dec a
$18:dd85  09 68 22	  ora #$2268
$18:dd88  05 a1		 ora $a1
$18:dd8a  d7 50		 cmp [$50],y
$18:dd8c  21 c5		 and ($c5,x)
$18:dd8e  a3 02		 lda $02,s
$18:dd90  83 6d		 sta $6d,s
$18:dd92  a3 54		 lda $54,s
$18:dd94  27 aa		 and [$aa]
$18:dd96  78			sei
$18:dd97  9e 8b 9c	  stz $9c8b,x
$18:dd9a  a0 b6 da	  ldy #$dab6
$18:dd9d  e4 28		 cpx $28
$18:dd9f  7f 28 61 74   adc $746128,x
$18:dda3  c1 85		 cmp ($85,x)
$18:dda5  b0 50		 bcs $ddf7
$18:dda7  9b			txy
$18:dda8  6d 36 26	  adc $2636
$18:ddab  3e de 86	  rol $86de,x
$18:ddae  e5 4b		 sbc $4b
$18:ddb0  c1 80		 cmp ($80,x)
$18:ddb2  48			pha
$18:ddb3  c4 67		 cpy $67
$18:ddb5  01 ea		 ora ($ea,x)
$18:ddb7  4c a8 6f	  jmp $6fa8
$18:ddba  d6 84		 dec $84,x
$18:ddbc  50 c0		 bvc $dd7e
$18:ddbe  e8			inx
$18:ddbf  81 06		 sta ($06,x)
$18:ddc1  db			stp
$18:ddc2  5d 28 81	  eor $8128,x
$18:ddc5  94 9e		 sty $9e,x
$18:ddc7  25 17		 and $17
$18:ddc9  fa			plx
$18:ddca  8a			txa
$18:ddcb  7e d2 29	  ror $29d2,x
$18:ddce  e7 f4		 sbc [$f4]
$18:ddd0  52 31		 eor ($31)
$18:ddd2  1f 42 0e b8   ora $b80e42,x
$18:ddd6  32 30		 and ($30)
$18:ddd8  2f c1 3a 9c   and $9c3ac1
$18:dddc  1a			inc a
$18:dddd  21 e4		 and ($e4,x)
$18:dddf  8c 25 97	  sty $9725
$18:dde2  a2 01 d1	  ldx #$d101
$18:dde5  b2 07		 lda ($07)
$18:dde7  90 83		 bcc $dd6c
$18:dde9  91 86		 sta ($86),y
$18:ddeb  05 00		 ora $00
$18:dded  b1 51		 lda ($51),y
$18:ddef  5c 69 fe ff   jml $fffe69
$18:ddf3  e3 1d		 sbc $1d,s
$18:ddf5  86 f3		 stx $f3
$18:ddf7  02 30		 cop #$30
$18:ddf9  6d 9d 82	  adc $829d
$18:ddfc  c1 4f		 cmp ($4f,x)
$18:ddfe  03 21		 ora $21,s
$18:de00  63 14		 adc $14,s
$18:de02  62 31 1e	  per $fc36
$18:de05  42 a0		 wdm #$a0
$18:de07  12 30		 ora ($30)
$18:de09  3f 27 40 32   and $324027,x
$18:de0d  00 16		 brk #$16
$18:de0f  dc d1 93	  jml [$93d1]
$18:de12  a9 f8 09	  lda #$09f8
$18:de15  2c de 8e	  bit $8ede
$18:de18  35 f1		 and $f1,x
$18:de1a  61 92		 adc ($92,x)
$18:de1c  c0 02 da	  cpy #$da02
$18:de1f  ea			nop
$18:de20  3a			dec a
$18:de21  75 3d		 adc $3d,x
$18:de23  a4 c3		 ldy $c3
$18:de25  00 84		 brk #$84
$18:de27  b2 90		 lda ($90)
$18:de29  67 f1		 adc [$f1]
$18:de2b  61 9f		 adc ($9f,x)
$18:de2d  40			rti
$18:de2e  02 da		 cop #$da
$18:de30  3a			dec a
$18:de31  41 55		 eor ($55,x)
$18:de33  3c 47 e3	  bit $e347,x
$18:de36  00 84		 brk #$84
$18:de38  6a			ror a
$18:de39  92 99		 sta ($99)
$18:de3b  f1 61		 sbc ($61),y
$18:de3d  ab			plb
$18:de3e  c0 02 d8	  cpy #$d802
$18:de41  aa			tax
$18:de42  49 55 39	  eor #$3955
$18:de45  2b			pld
$18:de46  03 00		 ora $00,s
$18:de48  84 06		 sty $06
$18:de4a  94 cb		 sty $cb,x
$18:de4c  f1 61		 sbc ($61),y
$18:de4e  b8			clv
$18:de4f  40			rti
$18:de50  66 90		 ror $90
$18:de52  21 02		 and ($02,x)
$18:de54  80 40		 bra $de96
$18:de56  53 0f		 eor ($0f,s),y
$18:de58  df 26 8c 0c   cmp $0c8c26,x
$18:de5c  24 2f		 bit $2f
$18:de5e  be c4 03	  ldx $03c4,y
$18:de61  3c 6f 42	  bit $426f,x
$18:de64  94 04		 sty $04,x
$18:de66  80 1c		 bra $de84
$18:de68  b4 83		 ldy $83,x
$18:de6a  e5 33		 sbc $33
$18:de6c  81 86		 sta ($86,x)
$18:de6e  85 20		 sta $20
$18:de70  6f 04 ba 7f   adc $7fba04
$18:de74  bf fb 9a 32   lda $329afb,x
$18:de78  e4 90		 cpx $90
$18:de7a  e1 f8		 sbc ($f8,x)
$18:de7c  12 1f		 ora ($1f)
$18:de7e  f7 ff		 sbc [$ff],y
$18:de80  37 a3		 and [$a3],y
$18:de82  a0 fd b8	  ldy #$b8fd
$18:de85  69 90 40	  adc #$4090
$18:de88  f5 d9		 sbc $d9,x
$18:de8a  34 69		 bit $69,x
$18:de8c  7f 61 2a bd   adc $bd2a61,x
$18:de90  0c 24 87	  tsb $8724
$18:de93  0c cb 11	  tsb $11cb
$18:de96  5d a0 e7	  eor $e7a0,x
$18:de99  a5 98		 lda $98
$18:de9b  3b			tsc
$18:de9c  41 66		 eor ($66,x)
$18:de9e  48			pha
$18:de9f  70 3d		 bvs $dede
$18:dea1  86 ba		 stx $ba
$18:dea3  8e 43 00	  stx $0043
$18:dea6  59 7b 5b	  eor $5b7b,y
$18:dea9  82 87 05	  brl $e433
$18:deac  98			tya
$18:dead  4b			phk
$18:deae  29 00 9f	  and #$9f00
$18:deb1  53 09		 eor ($09,s),y
$18:deb3  3c 03 e0	  bit $e003,x
$18:deb6  07 eb		 ora [$eb]
$18:deb8  20 80 c3	  jsr $c380
$18:debb  be 48 51	  ldx $5148,y
$18:debe  aa			tax
$18:debf  3d c0 46	  and $46c0,x
$18:dec2  58			cli
$18:dec3  e2 52		 sep #$52
$18:dec5  9c c0 db	  stz $dbc0
$18:dec8  4d 50 39	  eor $3950
$18:decb  80 1d		 bra $deea
$18:decd  1e e1 a3	  asl $a3e1,x
$18:ded0  a4 16		 ldy $16
$18:ded2  c9 ee 1e	  cmp #$1eee
$18:ded5  23 12		 and $12,s
$18:ded7  c6 a9		 dec $a9
$18:ded9  28			plp
$18:deda  ff 6c 0c 0d   sbc $0d0c6c,x
$18:dede  48			pha
$18:dedf  28			plp
$18:dee0  de a9 29	  dec $29a9,x
$18:dee3  8d 47 ec	  sta $ec47
$18:dee6  e5 5d		 sbc $5d
$18:dee8  a1 f4		 lda ($f4,x)
$18:deea  8f a1 75 68   sta $6875a1
$18:deee  2b			pld
$18:deef  e4 1e		 cpx $1e
$18:def1  74 bb		 stz $bb,x
$18:def3  07 c8		 ora [$c8]
$18:def5  23 50		 and $50,s
$18:def7  fe 18 aa	  inc $aa18,x
$18:defa  4a			lsr a
$18:defb  bc 8f e1	  ldy $e18f,x
$18:defe  c9 53 1f	  cmp #$1f53
$18:df01  f5 a8		 sbc $a8,x
$18:df03  14 a0		 trb $a0
$18:df05  af 9d 8c 56   lda $568c9d
$18:df09  01 3e		 ora ($3e,x)
$18:df0b  9c 8b 0c	  stz $0c8b
$18:df0e  53 e5		 eor ($e5,s),y
$18:df10  45 20		 eor $20
$18:df12  a3 cc		 lda $cc,s
$18:df14  87 e1		 sta [$e1]
$18:df16  5c 2b 29 fc   jml $fc292b
$18:df1a  0f 34 45 03   ora $034534
$18:df1e  f8			sed
$18:df1f  10 45		 bpl $df66
$18:df21  d2 09		 cmp ($09)
$18:df23  c1 fd		 cmp ($fd,x)
$18:df25  d3 93		 cmp ($93,s),y
$18:df27  69 17 a7	  adc #$a717
$18:df2a  a6 d2		 ldx $d2
$18:df2c  66 aa		 ror $aa
$18:df2e  5a			phy
$18:df2f  42 a9		 wdm #$a9
$18:df31  6b			rtl
$18:df32  aa			tax
$18:df33  a5 b9		 lda $b9
$18:df35  2a			rol a
$18:df36  97 1c		 sta [$1c],y
$18:df38  aa			tax
$18:df39  5d 53 2b	  eor $2b53,x
$18:df3c  59 2c c1	  eor $c12c,y
$18:df3f  65 cb		 adc $cb
$18:df41  2c 59 52	  bit $5259
$18:df44  ca			dex
$18:df45  10 22		 bpl $df69
$18:df47  84 0d		 sty $0d
$18:df49  38			sec
$18:df4a  26 70		 rol $70
$18:df4c  b8			clv
$18:df4d  d2 82		 cmp ($82)
$18:df4f  a9 c5 0e	  lda #$0ec5
$18:df52  2c 66 96	  bit $9666
$18:df55  15 4a		 ora $4a,x
$18:df57  88			dey
$18:df58  b1 6d		 lda ($6d),y
$18:df5a  a2 c5		 ldx #$c5
$18:df5c  d2 8b		 cmp ($8b)
$18:df5e  16 47		 asl $47,x
$18:df60  4c 0a a6	  jmp $a60a
$18:df63  32 98		 and ($98)
$18:df65  99 48 24	  sta $2448,y
$18:df68  03 cf		 ora $cf,s
$18:df6a  4c 2b a4	  jmp $a42b
$18:df6d  46 9a		 lsr $9a
$18:df6f  57 49		 eor [$49],y
$18:df71  d9 99 6c	  cmp $6c99,y
$18:df74  a6 65		 ldx $65
$18:df76  c7 99		 cmp [$99]
$18:df78  97 73		 sta [$73],y
$18:df7a  4d 09 81	  eor $8109
$18:df7d  6c 13 85	  jmp ($8513)
$18:df80  e3 a6		 sbc $a6,s
$18:df82  a2 53		 ldx #$53
$18:df84  ff 4d 0a 90   sbc $900a4d,x
$18:df88  3c 23 74	  bit $7423,x
$18:df8b  e4 ca		 cpx $ca
$18:df8d  4d e9 d0	  eor $d0e9
$18:df90  20 61 d4	  jsr $d461
$18:df93  d5 0b		 cmp $0b,x
$18:df95  6f 09 0a a5   adc $a50a09
$18:df99  31 6a		 and ($6a),y
$18:df9b  85 d3		 sta $d3
$18:df9d  aa			tax
$18:df9e  17 86		 ora [$86],y
$18:dfa0  a8			tay
$18:dfa1  5e f8 48	  lsr $48f8,x
$18:dfa4  5e 68 7d	  lsr $7d68,x
$18:dfa7  40			rti
$18:dfa8  78			sei
$18:dfa9  21 4a		 and ($4a,x)
$18:dfab  1e 0c 3e	  asl $3e0c,x
$18:dfae  30 29		 bmi $dfd9
$18:dfb0  7e 0f 65	  ror $650f,x
$18:dfb3  94 54		 sty $54,x
$18:dfb5  1d ad 60	  ora $60ad,x
$18:dfb8  03 3d		 ora $3d,s
$18:dfba  f2 a0		 sbc ($a0)
$18:dfbc  f7 4d		 sbc [$4d],y
$18:dfbe  30 69		 bmi $e029
$18:dfc0  7c a0 67	  jmp ($67a0,x)
$18:dfc3  92 54		 sta ($54)
$18:dfc5  5d ad 47	  eor $47ad,x
$18:dfc8  a8			tay
$18:dfc9  bd d2 d4	  lda $d4d2,x
$18:dfcc  3e 5d 10	  rol $105d,x
$18:dfcf  d1 fc		 cmp ($fc),y
$18:dfd1  23 41		 and $41,s
$18:dfd3  7d 80 b4	  adc $b480,x
$18:dfd6  23 0f		 and $0f,s
$18:dfd8  81 88		 sta ($88,x)
$18:dfda  18			clc
$18:dfdb  86 0c		 stx $0c
$18:dfdd  f8			sed
$18:dfde  18			clc
$18:dfdf  39 88 2a	  and $2a88,y
$18:dfe2  06 92		 asl $92
$18:dfe4  36 0d		 rol $0d,x
$18:dfe6  00 d2		 brk #$d2
$18:dfe8  30 88		 bmi $df72
$18:dfea  45 80		 eor $80
$18:dfec  d2 47		 cmp ($47)
$18:dfee  a1 3b		 lda ($3b,x)
$18:dff0  11 8c		 ora ($8c),y
$18:dff2  2e 06 93	  rol $9306
$18:dff5  44 81 d8	  mvp $d8,$81
$18:dff8  4c 60 5f	  jmp $5f60
$18:dffb  66 58		 ror $58
$18:dffd  37 4a		 and [$4a],y
$18:dfff  11 51		 ora ($51),y
$18:e001  50 14		 bvc $e017
$18:e003  22 01 61 50   jsl $506101
$18:e007  09 76 13	  ora #$1376
$18:e00a  ed 40 54	  sbc $5440
$18:e00d  21 d8		 and ($d8,x)
$18:e00f  4b			phk
$18:e010  bf 53 37 a5   lda $a53753,x
$18:e014  4c ec 96	  jmp $96ec
$18:e017  33 ea		 and ($ea,s),y
$18:e019  58			cli
$18:e01a  d0 89		 bne $dfa5
$18:e01c  73 45		 adc ($45,s),y
$18:e01e  a5 cd		 lda $cd
$18:e020  24 71		 bit $71
$18:e022  73 02		 adc ($02,s),y
$18:e024  c0 d4		 cpy #$d4
$18:e026  44 cc 0a	  mvp $0a,$cc
$18:e029  a2 a4		 ldx #$a4
$18:e02b  99 81 55	  sta $5581,y
$18:e02e  50 11		 bvc $e041
$18:e030  ac 2c 8a	  ldy $8a2c
$18:e033  e3 03		 sbc $03,s
$18:e035  c8			iny
$18:e036  64 aa		 stz $aa
$18:e038  87 61		 sta [$61]
$18:e03a  09 8d 55	  ora #$558d
$18:e03d  86 42		 stx $42
$18:e03f  21 49		 and ($49,x)
$18:e041  7a			ply
$18:e042  8c 6a ca	  sty $ca6a
$18:e045  74 b3		 stz $b3,x
$18:e047  34 0c		 bit $0c,x
$18:e049  9b			txy
$18:e04a  b5 85		 lda $85,x
$18:e04c  3a			dec a
$18:e04d  5a			phy
$18:e04e  0c 9e a3	  tsb $a39e
$18:e051  1a			inc a
$18:e052  d2 9d		 cmp ($9d)
$18:e054  2d 42 d3	  and $d342
$18:e057  26 b4		 rol $b4
$18:e059  10 4a		 bpl $e0a5
$18:e05b  02 e0		 cop #$e0
$18:e05d  30 06		 bmi $e065
$18:e05f  01 54		 ora ($54,x)
$18:e061  46 10		 lsr $10
$18:e063  c8			iny
$18:e064  1e c4 5c	  asl $5cc4,x
$18:e067  3e 16 80	  rol $8016,x
$18:e06a  93 42		 sta ($42,s),y
$18:e06c  21 e0		 and ($e0,x)
$18:e06e  51 0c		 eor ($0c),y
$18:e070  81 40		 sta ($40,x)
$18:e072  6c 90 59	  jmp ($5990)
$18:e075  92 af		 sta ($af)
$18:e077  d7 96		 cmp [$96],y
$18:e079  c2 1a		 rep #$1a
$18:e07b  6a			ror a
$18:e07c  fc a1 10	  jsr ($10a1,x)
$18:e07f  8a			txa
$18:e080  62 fc 85	  per $667f
$18:e083  c1 5c		 cmp ($5c,x)
$18:e085  71 10		 adc ($10),y
$18:e087  b8			clv
$18:e088  2b			pld
$18:e089  ac 6b 83	  ldy $836b
$18:e08c  35 18		 and $18,x
$18:e08e  0c e0 14	  tsb $14e0
$18:e091  61 08		 adc ($08,x)
$18:e093  0c 09 01	  tsb $0109
$18:e096  10 5d		 bpl $e0f5
$18:e098  0d 76 80	  ora $8076
$18:e09b  dc 64 17	  jml [$1764]
$18:e09e  c2 36		 rep #$36
$18:e0a0  09 54 e0	  ora #$e054
$18:e0a3  25 46		 and $46
$18:e0a5  3e a0 a6	  rol $a6a0,x
$18:e0a8  81 60		 sta ($60,x)
$18:e0aa  07 a0		 ora [$a0]
$18:e0ac  37 17		 and [$17],y
$18:e0ae  00 0d		 brk #$0d
$18:e0b0  89 78 23	  bit #$2378
$18:e0b3  60			rts
$18:e0b4  50 8b		 bvc $e041
$18:e0b6  10 0e		 bpl $e0c6
$18:e0b8  a2 c9 b8	  ldx #$b8c9
$18:e0bb  04 44		 tsb $44
$18:e0bd  e4 91		 cpx $91
$18:e0bf  13 ca		 ora ($ca,s),y
$18:e0c1  42 50		 wdm #$50
$18:e0c3  08			php
$18:e0c4  6f 14 48 40   adc $404814
$18:e0c8  23 24		 and $24,s
$18:e0ca  51 a6		 eor ($a6),y
$18:e0cc  ad 09 f6	  lda $f609
$18:e0cf  2b			pld
$18:e0d0  42 19		 wdm #$19
$18:e0d2  9a			txs
$18:e0d3  88			dey
$18:e0d4  07 46		 ora [$46]
$18:e0d6  0e c4 d2	  asl $d2c4
$18:e0d9  32 95		 and ($95)
$18:e0db  86 d0		 stx $d0
$18:e0dd  90 42		 bcc $e121
$18:e0df  40			rti
$18:e0e0  45 66		 eor $66
$18:e0e2  a0 52 98	  ldy #$9852
$18:e0e5  43 c9		 eor $c9,s
$18:e0e7  1e 75 15	  asl $1575,x
$18:e0ea  f0 17		 beq $e103
$18:e0ec  80 6c		 bra $e15a
$18:e0ee  06 41		 asl $41
$18:e0f0  8b			phb
$18:e0f1  19 9c 8a	  ora $8a9c,y
$18:e0f4  50 ea		 bvc $e0e0
$18:e0f6  a1 6c		 lda ($6c,x)
$18:e0f8  52 e1		 eor ($e1)
$18:e0fa  0e aa 98	  asl $98aa
$18:e0fd  06 10		 asl $10
$18:e0ff  dd 0c 11	  cmp $110c,x
$18:e102  9c 88 61	  stz $6188
$18:e105  c2 48		 rep #$48
$18:e107  1a			inc a
$18:e108  3e 04 a3	  rol $a304,x
$18:e10b  02 1b		 cop #$1b
$18:e10d  9c 40 c0	  stz $c040
$18:e110  03 f2		 ora $f2,s
$18:e112  3f 09 18 a1   and $a11809,x
$18:e116  10 a2		 bpl $e0ba
$18:e118  61 03		 adc ($03,x)
$18:e11a  40			rti
$18:e11b  92 14		 sta ($14)
$18:e11d  de 00 30	  dec $3000,x
$18:e120  57 e2		 eor [$e2],y
$18:e122  7f 22 40 57   adc $574022,x
$18:e126  0f e0 6d 18   ora $186de0
$18:e12a  85 74		 sta $74
$18:e12c  fe 05 09	  inc $0905,x
$18:e12f  83 97		 sta $97,s
$18:e131  3c da 88	  bit $88da,x
$18:e134  8c 74 0a	  sty $0a74
$18:e137  48			pha
$18:e138  30 07		 bmi $e141
$18:e13a  83 ae		 sta $ae,s
$18:e13c  60			rts
$18:e13d  0d 62 0c	  ora $0c62
$18:e140  78			sei
$18:e141  18			clc
$18:e142  a8			tay
$18:e143  61 24		 adc ($24,x)
$18:e145  80 aa		 bra $e0f1
$18:e147  89 02 10	  bit #$1002
$18:e14a  6b			rtl
$18:e14b  1a			inc a
$18:e14c  a0 20 08	  ldy #$0820
$18:e14f  23 00		 and $00,s
$18:e151  d1 38		 cmp ($38),y
$18:e153  c4 16		 cpy $16
$18:e155  02 99		 cop #$99
$18:e157  24 80		 bit $80
$18:e159  d8			cld
$18:e15a  5d 02 3c	  eor $3c02,x
$18:e15d  27 78		 and [$78]
$18:e15f  16 c0		 asl $c0,x
$18:e161  88			dey
$18:e162  20 b0 39	  jsr $39b0
$18:e165  09 30 03	  ora #$0330
$18:e168  23 1f		 and $1f,s
$18:e16a  29 54 5e	  and #$5e54
$18:e16d  00 a6		 brk #$a6
$18:e16f  10 58		 bpl $e1c9
$18:e171  43 e1		 eor $e1,s
$18:e173  06 71		 asl $71
$18:e175  77 83		 adc [$83],y
$18:e177  e4 16		 cpx $16
$18:e179  82 0b 08	  brl $e987
$18:e17c  3c 40 ea	  bit $ea40,x
$18:e17f  21 91		 and ($91,x)
$18:e181  8b			phb
$18:e182  9f 05 98 31   sta $319805,x
$18:e186  74 18		 stz $18,x
$18:e188  94 49		 sty $49,x
$18:e18a  a0 4e 90	  ldy #$904e
$18:e18d  7c 83 28	  jmp ($2883,x)
$18:e190  d2 f7		 cmp ($f7)
$18:e192  17 80		 ora [$80],y
$18:e194  8c 92 12	  sty $1292
$18:e197  39 40 98	  and $9840,y
$18:e19a  86 09		 stx $09
$18:e19c  9e 6c 66	  stz $666c,x
$18:e19f  60			rts
$18:e1a0  2a			rol a
$18:e1a1  e5 1a		 sbc $1a
$18:e1a3  9a			txs
$18:e1a4  13 17		 ora ($17,s),y
$18:e1a6  68			pla
$18:e1a7  38			sec
$18:e1a8  89 ca 2b	  bit #$2bca
$18:e1ab  40			rti
$18:e1ac  5a			phy
$18:e1ad  16 88		 asl $88,x
$18:e1af  32 42		 and ($42)
$18:e1b1  81 56		 sta ($56,x)
$18:e1b3  33 ac		 and ($ac,s),y
$18:e1b5  01 83		 ora ($83,x)
$18:e1b7  d2 6b		 cmp ($6b)
$18:e1b9  10 ac		 bpl $e167
$18:e1bb  3c 4d 81	  bit $814d,x
$18:e1be  45 0f		 eor $0f
$18:e1c0  0c 58 2c	  tsb $2c58
$18:e1c3  b6 14		 ldx $14,y
$18:e1c5  81 cc		 sta ($cc,x)
$18:e1c7  02 62		 cop #$62
$18:e1c9  da			phx
$18:e1ca  37 61		 and [$61],y
$18:e1cc  38			sec
$18:e1cd  c4 56		 cpy $56
$18:e1cf  0e 82 04	  asl $0482
$18:e1d2  1d 7d b0	  ora $b07d,x
$18:e1d5  48			pha
$18:e1d6  b0 a7		 bcs $e17f
$18:e1d8  b3 8e		 lda ($8e,s),y
$18:e1da  31 4e		 and ($4e),y
$18:e1dc  67 12		 adc [$12]
$18:e1de  48			pha
$18:e1df  2b			pld
$18:e1e0  c3 f1		 cmp $f1,s
$18:e1e2  77 44		 adc [$44],y
$18:e1e4  19 f3 c1	  ora $c1f3,y
$18:e1e7  eb			xba
$18:e1e8  6f 8a 30 29   adc $29308a
$18:e1ec  c9 00 4d	  cmp #$4d00
$18:e1ef  82 64 2b	  brl $0d56
$18:e1f2  c5 b2		 cmp $b2
$18:e1f4  54 d0 a8	  mvn $a8,$d0
$18:e1f7  21 d0		 and ($d0,x)
$18:e1f9  2f a3 58 85   and $8558a3
$18:e1fd  41 58		 eor ($58,x)
$18:e1ff  6b			rtl
$18:e200  1c 02 d0	  trb $d002
$18:e203  1c 48 04	  trb $0448
$18:e206  11 a0		 ora ($a0),y
$18:e208  68			pla
$18:e209  c0 15 0c	  cpy #$0c15
$18:e20c  32 11		 and ($11)
$18:e20e  d5 72		 cmp $72,x
$18:e210  14 52		 trb $52
$18:e212  01 e5		 ora ($e5,x)
$18:e214  3b			tsc
$18:e215  9c 33 08	  stz $0833
$18:e218  d6 38		 dec $38,x
$18:e21a  26 50		 rol $50
$18:e21c  54 72 87	  mvn $87,$72
$18:e21f  8a			txa
$18:e220  86 01		 stx $01
$18:e222  a4 30		 ldy $30
$18:e224  c8			iny
$18:e225  a2 64 5e	  ldx #$5e64
$18:e228  81 14		 sta ($14,x)
$18:e22a  86 28		 stx $28
$18:e22c  05 78		 ora $78
$18:e22e  31 85		 and ($85),y
$18:e230  38			sec
$18:e231  be c6 20	  ldx $20c6,y
$18:e234  ae 07 99	  ldx $9907
$18:e237  d7 cb		 cmp [$cb],y
$18:e239  60			rts
$18:e23a  17 07		 ora [$07],y
$18:e23c  b0 53		 bcs $e291
$18:e23e  cb			wai
$18:e23f  64 35		 stz $35
$18:e241  02 d1		 cop #$d1
$18:e243  c6 0c		 dec $0c
$18:e245  02 b0		 cop #$b0
$18:e247  a1 b9		 lda ($b9,x)
$18:e249  b3 e9		 lda ($e9,s),y
$18:e24b  d3 65		 cmp ($65,s),y
$18:e24d  c2 29		 rep #$29
$18:e24f  24 20		 bit $20
$18:e251  96 86		 stx $86,y
$18:e253  6c 2b 05	  jmp ($052b)
$18:e256  69 00 42	  adc #$4200
$18:e259  10 ad		 bpl $e208
$18:e25b  9f 93 68 26   sta $266893,x
$18:e25f  10 00		 bpl $e261
$18:e261  43 20		 eor $20,s
$18:e263  1f cf f8 00   ora $00f8cf,x
$18:e267  12 06		 ora ($06)
$18:e269  31 2f		 and ($2f),y
$18:e26b  81 e8		 sta ($e8,x)
$18:e26d  5f c1 00 f8   eor $f800c1,x
$18:e271  89 c8 d2	  bit #$d2c8
$18:e274  34 01		 bit $01,x
$18:e276  89 fc 0e	  bit #$0efc
$18:e279  60			rts
$18:e27a  52 f3		 eor ($f3)
$18:e27c  18			clc
$18:e27d  38			sec
$18:e27e  00 ea		 brk #$ea
$18:e280  7c 03 32	  jmp ($3203,x)
$18:e283  38			sec
$18:e284  00 dc		 brk #$dc
$18:e286  7c 02 b8	  jmp ($b802,x)
$18:e289  15 40		 ora $40,x
$18:e28b  00 0f		 brk #$0f
$18:e28d  c4 2e		 cpy $2e
$18:e28f  93 38		 sta ($38,s),y
$18:e291  7a			ply
$18:e292  8b			phb
$18:e293  33 80		 and ($80,s),y
$18:e295  75 1c		 adc $1c,x
$18:e297  e2 66		 sep #$66
$18:e299  1f 22 c8 85   ora $85c822,x
$18:e29d  21 e4		 and ($e4,x)
$18:e29f  c0 00 82	  cpy #$8200
$18:e2a2  2c 37 11	  bit $1137
$18:e2a5  a2 00 80	  ldx #$8000
$18:e2a8  ca			dex
$18:e2a9  11 42		 ora ($42),y
$18:e2ab  18			clc
$18:e2ac  62 0b a0	  per $82ba
$18:e2af  df 07 00 d1   cmp $d10007,x
$18:e2b3  08			php
$18:e2b4  60			rts
$18:e2b5  a7 08		 lda [$08]
$18:e2b7  46 24		 lsr $24
$18:e2b9  ba			tsx
$18:e2ba  10 c0		 bpl $e27c
$18:e2bc  60			rts
$18:e2bd  e2 68		 sep #$68
$18:e2bf  90 18		 bcc $e2d9
$18:e2c1  0c 2c ca	  tsb $ca2c
$18:e2c4  18			clc
$18:e2c5  68			pla
$18:e2c6  23 e8		 and $e8,s
$18:e2c8  09 43		 ora #$43
$18:e2ca  86 a2		 stx $a2
$18:e2cc  41 60		 eor ($60,x)
$18:e2ce  11 58		 ora ($58),y
$18:e2d0  04 49		 tsb $49
$18:e2d2  a9 20		 lda #$20
$18:e2d4  b0 85		 bcs $e25b
$18:e2d6  66 0b		 ror $0b
$18:e2d8  a0 0b 10	  ldy #$100b
$18:e2db  c8			iny
$18:e2dc  3a			dec a
$18:e2dd  86 14		 stx $14
$18:e2df  18			clc
$18:e2e0  0c c9 74	  tsb $74c9
$18:e2e3  21 43		 and ($43,x)
$18:e2e5  e0 13 83	  cpx #$8313
$18:e2e8  e0 03 01	  cpx #$0103
$18:e2eb  02 7e		 cop #$7e
$18:e2ed  90 94		 bcc $e283
$18:e2ef  06 82		 asl $82
$18:e2f1  06 34		 asl $34
$18:e2f3  89 35		 bit #$35
$18:e2f5  d6 0b		 dec $0b,x
$18:e2f7  0d 84 42	  ora $4284
$18:e2fa  33 4b		 and ($4b,s),y
$18:e2fc  10 86		 bpl $e284
$18:e2fe  c1 4a		 cmp ($4a,x)
$18:e300  02 ea		 cop #$ea
$18:e302  08			php
$18:e303  13 5c		 ora ($5c,s),y
$18:e305  71 4b		 adc ($4b),y
$18:e307  10 88		 bpl $e291
$18:e309  0d 00 be	  ora $be00
$18:e30c  03 02		 ora $02,s
$18:e30e  16 00		 asl $00,x
$18:e310  d8			cld
$18:e311  cd 82 06	  cmp $0682
$18:e314  36 9b		 rol $9b,x
$18:e316  0d 00 62	  ora $6200
$18:e319  20 31 42	  jsr $4231
$18:e31c  02 1c		 cop #$1c
$18:e31e  40			rti
$18:e31f  81 40		 sta ($40,x)
$18:e321  52 90		 eor ($90)
$18:e323  b0 1a		 bcs $e33f
$18:e325  a8			tay
$18:e326  02 15		 cop #$15
$18:e328  01 62		 ora ($62,x)
$18:e32a  e0 8c f2	  cpx #$f28c
$18:e32d  21 b4		 and ($b4,x)
$18:e32f  1d b8 50	  ora $50b8,x
$18:e332  68			pla
$18:e333  53 88		 eor ($88,s),y
$18:e335  d7 22		 cmp [$22],y
$18:e337  ea			nop
$18:e338  25 c8		 and $c8
$18:e33a  3c 0d 8e	  bit $8e0d,x
$18:e33d  2f 82 16 06   and $061682
$18:e341  99 fe 4d	  sta $4dfe,y
$18:e344  51 11		 eor ($11),y
$18:e346  04 28		 tsb $28
$18:e348  4a			lsr a
$18:e349  11 0d		 ora ($0d),y
$18:e34b  44 10 7f	  mvp $7f,$10
$18:e34e  4b			phk
$18:e34f  41 15		 eor ($15,x)
$18:e351  84 12		 sty $12
$18:e353  18			clc
$18:e354  2f 06 20 42   and $422006
$18:e358  9f 02 1b 00   sta $001b02,x
$18:e35c  b0 3e		 bcs $e39c
$18:e35e  00 34		 brk #$34
$18:e360  60			rts
$18:e361  61 34		 adc ($34,x)
$18:e363  23 5c		 and $5c,s
$18:e365  4e 24 de	  lsr $de24
$18:e368  18			clc
$18:e369  4c 25 c6	  jmp $c625
$18:e36c  d1 a5		 cmp ($a5),y
$18:e36e  6c 13 86	  jmp ($8613)
$18:e371  14 52		 trb $52
$18:e373  41 c0		 eor ($c0,x)
$18:e375  16 8e		 asl $8e,x
$18:e377  24 60		 bit $60
$18:e379  42 30		 wdm #$30
$18:e37b  1a			inc a
$18:e37c  08			php
$18:e37d  e2 01		 sep #$01
$18:e37f  63 29		 adc $29,s
$18:e381  88			dey
$18:e382  78			sei
$18:e383  88			dey
$18:e384  60			rts
$18:e385  e5 c8		 sbc $c8
$18:e387  1a			inc a
$18:e388  10 9a		 bpl $e324
$18:e38a  a2 8b 26	  ldx #$268b
$18:e38d  a8			tay
$18:e38e  d0 03		 bne $e393
$18:e390  e9 00		 sbc #$00
$18:e392  fe 7f e1	  inc $e17f,x
$18:e395  8a			txa
$18:e396  91 f9		 sta ($f9),y
$18:e398  7f d6 04 11   adc $1104d6,x
$18:e39c  04 a9		 tsb $a9
$18:e39e  ee 00 42	  inc $4200
$18:e3a1  69 01		 adc #$01
$18:e3a3  50 1c		 bvc $e3c1
$18:e3a5  41 de		 eor ($de,x)
$18:e3a7  b0 86		 bcs $e32f
$18:e3a9  e0 45 6d	  cpx #$6d45
$18:e3ac  e3 a0		 sbc $a0,s
$18:e3ae  56 04		 lsr $04,x
$18:e3b0  22 1b 7f 58   jsl $587f1b
$18:e3b4  94 42		 sty $42,x
$18:e3b6  0b			phd
$18:e3b7  8f 6c 02 ac   sta $ac026c
$18:e3bb  60			rts
$18:e3bc  b6 c6		 ldx $c6,y
$18:e3be  c0 37 01	  cpy #$0137
$18:e3c1  86 16		 stx $16
$18:e3c3  d0 10		 bne $e3d5
$18:e3c5  c4 1d		 cpy $1d
$18:e3c7  21 8c		 and ($8c,x)
$18:e3c9  58			cli
$18:e3ca  93 a4		 sta ($a4,s),y
$18:e3cc  31 a9		 and ($a9),y
$18:e3ce  cf 56 8e 6d   cmp $6d8e56
$18:e3d2  62 99 c5	  per $a96e
$18:e3d5  c2 67		 rep #$67
$18:e3d7  57 fe		 eor [$fe],y
$18:e3d9  d0 e8		 bne $e3c3
$18:e3db  cb			wai
$18:e3dc  85 60		 sta $60
$18:e3de  ca			dex
$18:e3df  a2 84 43	  ldx #$4384
$18:e3e2  33 ed		 and ($ed,s),y
$18:e3e4  42 80		 wdm #$80
$18:e3e6  45 33		 eor $33
$18:e3e8  cf e2 83 80   cmp $8083e2
$18:e3ec  d0 74		 bne $e462
$18:e3ee  00 b3		 brk #$b3
$18:e3f0  8a			txa
$18:e3f1  34 90		 bit $90,x
$18:e3f3  90 0d		 bcc $e402
$18:e3f5  a4 89		 ldy $89
$18:e3f7  38			sec
$18:e3f8  55 a8		 eor $a8,x
$18:e3fa  0f f1 80 41   ora $4180f1
$18:e3fe  6d 86 00	  adc $0086
$18:e401  3e 81 90	  rol $9081,x
$18:e404  2d a9 51	  and $51a9
$18:e407  88			dey
$18:e408  43 5a		 eor $5a,s
$18:e40a  40			rti
$18:e40b  28			plp
$18:e40c  23 90		 and $90,s
$18:e40e  63 52		 adc $52,s
$18:e410  a2 ad 05	  ldx #$05ad
$18:e413  38			sec
$18:e414  7e 3f ee	  ror $ee3f,x
$18:e417  42 7f		 wdm #$7f
$18:e419  82 28 f1	  brl $d544
$18:e41c  d0 48		 bne $e466
$18:e41e  14 02		 trb $02
$18:e420  2d 00 8d	  and $8d00
$18:e423  98			tya
$18:e424  05 c8		 ora $c8
$18:e426  b0 48		 bcs $e470
$18:e428  64 1a		 stz $1a
$18:e42a  1d 9a 6a	  ora $6a9a,x
$18:e42d  04 2e		 tsb $2e
$18:e42f  0b			phd
$18:e430  0d 83 e6	  ora $e683
$18:e433  b8			clv
$18:e434  8e 10 3c	  stx $3c10
$18:e437  84 53		 sty $53
$18:e439  14 d4		 trb $d4
$18:e43b  08			php
$18:e43c  64 12		 stz $12
$18:e43e  25 02		 and $02
$18:e440  c5 71		 cmp $71
$18:e442  1f e5 04 e3   ora $e304e5,x
$18:e446  01 4e		 ora ($4e,x)
$18:e448  09 c7 5a	  ora #$5ac7
$18:e44b  11 20		 ora ($20),y
$18:e44d  39 29 13	  and $1329,y
$18:e450  8d 25 d4	  sta $d425
$18:e453  4e 30 58	  lsr $5830
$18:e456  5c 02 27 eb   jml $eb2702
$18:e45a  6f 14 22 17   adc $172214
$18:e45e  fb			xce
$18:e45f  09 84 36	  ora #$3684
$18:e462  07 09		 ora [$09]
$18:e464  85 7a		 sta $7a
$18:e466  86 c6		 stx $c6
$18:e468  c0 47 b8	  cpy #$b847
$18:e46b  32 0e		 and ($0e)
$18:e46d  26 ce		 rol $ce
$18:e46f  54 b3 09	  mvn $09,$b3
$18:e472  c6 0d		 dec $0d
$18:e474  0a			asl a
$18:e475  19 87 a4	  ora $a487,y
$18:e478  2c 50 88	  bit $8850
$18:e47b  67 e4		 adc [$e4]
$18:e47d  96 10		 stx $10,y
$18:e47f  e8			inx
$18:e480  10 84		 bpl $e406
$18:e482  3f 4f 32 5f   and $5f324f,x
$18:e486  fa			plx
$18:e487  44 c0 a0	  mvp $a0,$c0
$18:e48a  98			tya
$18:e48b  48			pha
$18:e48c  19 80 c6	  ora $c680,y
$18:e48f  00 67		 brk #$67
$18:e491  36 38		 rol $38,x
$18:e493  1f 41 6c 10   ora $106c41,x
$18:e497  c6 70		 dec $70
$18:e499  40			rti
$18:e49a  3f ff f8 4a   and $4af8ff,x
$18:e49e  d4 20		 pei ($20)
$18:e4a0  1f c4 25 76   ora $7625c4,x
$18:e4a4  52 27		 eor ($27)
$18:e4a6  18			clc
$18:e4a7  26 0a		 rol $0a
$18:e4a9  69 55 e1	  adc #$e155
$18:e4ac  10 81		 bpl $e42f
$18:e4ae  e2 b0		 sep #$b0
$18:e4b0  8b			phb
$18:e4b1  51 71		 eor ($71),y
$18:e4b3  06 2a		 asl $2a
$18:e4b5  88			dey
$18:e4b6  59 08 63	  eor $6308,y
$18:e4b9  a0 33		 ldy #$33
$18:e4bb  48			pha
$18:e4bc  d0 85		 bne $e443
$18:e4be  c1 60		 cmp ($60,x)
$18:e4c0  b0 ec		 bcs $e4ae
$18:e4c2  d5 11		 cmp $11,x
$18:e4c4  e8			inx
$18:e4c5  7e 67 d2	  ror $d267,x
$18:e4c8  79 d9 20	  adc $20d9,y
$18:e4cb  5f 00 28 d1   eor $d12800,x
$18:e4cf  0f 34 15 18   ora $181534
$18:e4d3  14 39		 trb $39
$18:e4d5  d2 1e		 cmp ($1e)
$18:e4d7  a4 a0		 ldy $a0
$18:e4d9  42 82		 wdm #$82
$18:e4db  a0 e3		 ldy #$e3
$18:e4dd  0a			asl a
$18:e4de  03 34		 ora $34,s
$18:e4e0  5d 22 a2	  eor $a222,x
$18:e4e3  f5 9b		 sbc $9b,x
$18:e4e5  c6 57		 dec $57
$18:e4e7  b1 09		 lda ($09),y
$18:e4e9  42 80		 wdm #$80
$18:e4eb  6c 1a 60	  jmp ($601a)
$18:e4ee  ff 08 3c 37   sbc $373c08,x
$18:e4f2  f2 94		 sbc ($94)
$18:e4f4  08			php
$18:e4f5  0c 3c 10	  tsb $103c
$18:e4f8  1f a6 d1 0d   ora $0dd1a6,x
$18:e4fc  81 c0		 sta ($c0,x)
$18:e4fe  63 60		 adc $60,s
$18:e500  73 98		 adc ($98,s),y
$18:e502  f4 56 e7	  pea $e756
$18:e505  11 3f		 ora ($3f),y
$18:e507  29 35		 and #$35
$18:e509  7c c5 54	  jmp ($54c5,x)
$18:e50c  f3 96		 sbc ($96,s),y
$18:e50e  06 18		 asl $18
$18:e510  60			rts
$18:e511  1a			inc a
$18:e512  07 fb		 ora [$fb]
$18:e514  ff 0a 15 8f   sbc $8f150a,x
$18:e518  dc d7 5f	  jml [$5fd7]
$18:e51b  54 80 40	  mvn $40,$80
$18:e51e  24 06		 bit $06
$18:e520  11 30		 ora ($30),y
$18:e522  21 34		 and ($34,x)
$18:e524  1b			tcs
$18:e525  61 10		 adc ($10,x)
$18:e527  61 04		 adc ($04,x)
$18:e529  82 04 6e	  brl $5330
$18:e52c  15 f8		 ora $f8,x
$18:e52e  bc 02 20	  ldy $2002,x
$18:e531  e3 08		 sbc $08,s
$18:e533  c4 09		 cpy $09
$18:e535  e0 0b		 cpx #$0b
$18:e537  c0 5d		 cpy #$5d
$18:e539  84 0d		 sty $0d
$18:e53b  04 50		 tsb $50
$18:e53d  88			dey
$18:e53e  84 4d		 sty $4d
$18:e540  04 47		 tsb $47
$18:e542  d0 91		 bne $e4d5
$18:e544  a0 89		 ldy #$89
$18:e546  78			sei
$18:e547  13 33		 ora ($33,s),y
$18:e549  d9 2f 02	  cmp $022f,y
$18:e54c  62 7b 23	  per $08ca
$18:e54f  e8			inx
$18:e550  48			pha
$18:e551  4f 64 8d 08   eor $088d64
$18:e555  8b			phb
$18:e556  c0 0c		 cpy #$0c
$18:e558  23 1d		 and $1d,s
$18:e55a  80 7f		 bra $e5db
$18:e55c  7f e6 87 35   adc $3587e6,x
$18:e560  84 10		 sty $10
$18:e562  e8			inx
$18:e563  03 20		 ora $20,s
$18:e565  35 84		 and $84,x
$18:e567  19 66 31	  ora $3166,y
$18:e56a  88			dey
$18:e56b  52 34		 eor ($34)
$18:e56d  1e 00 8d	  asl $8d00,x
$18:e570  06 98		 asl $98
$18:e572  2c 84 fa	  bit $fa84
$18:e575  0d a3 42	  ora $42a3
$18:e578  03 4c		 ora $4c,s
$18:e57a  11 e2		 ora ($e2),y
$18:e57c  d1 08		 cmp ($08),y
$18:e57e  94 02		 sty $02,x
$18:e580  60			rts
$18:e581  d6 27		 dec $27,x
$18:e583  78			sei
$18:e584  29 05		 and #$05
$18:e586  08			php
$18:e587  0e f0 4e	  asl $4ef0
$18:e58a  9b			txy
$18:e58b  d8			cld
$18:e58c  cc 23 1a	  cpy $1a23
$18:e58f  80 7e		 bra $e60f
$18:e591  97 67		 sta [$67],y
$18:e593  06 60		 asl $60
$18:e595  9c 12 10	  stz $1012
$18:e598  c8			iny
$18:e599  38			sec
$18:e59a  24 29		 bit $29
$18:e59c  9e 44 70	  stz $7044,x
$18:e59f  94 35		 sty $35,x
$18:e5a1  88			dey
$18:e5a2  8e 12 a4	  stx $a412
$18:e5a5  f1 0b		 sbc ($0b),y
$18:e5a7  8d 08 03	  sta $0308
$18:e5aa  50 95		 bvc $e541
$18:e5ac  ac cd 08	  ldy $08cd
$18:e5af  1f 85 d9 a7   ora $a7d985,x
$18:e5b3  80 ea		 bra $e59f
$18:e5b5  43 b0		 eor $b0,s
$18:e5b7  64 1c		 stz $1c
$18:e5b9  02 1c		 cop #$1c
$18:e5bb  07 f8		 ora [$f8]
$18:e5bd  84 12		 sty $12
$18:e5bf  01 2c		 ora ($2c,x)
$18:e5c1  64 11		 stz $11
$18:e5c3  b4 25		 ldy $25,x
$18:e5c5  cc f2 1d	  cpy $1df2
$18:e5c8  84 a3		 sty $a3
$18:e5ca  04 d7		 tsb $d7
$18:e5cc  11 d8		 ora ($d8),y
$18:e5ce  4a			lsr a
$18:e5cf  8f c0 a9 04   sta $04a9c0
$18:e5d3  11 91		 ora ($91),y
$18:e5d5  00 76		 brk #$76
$18:e5d7  12 b3		 ora ($b3)
$18:e5d9  f0 2d		 beq $e608
$18:e5db  46 3d		 lsr $3d
$18:e5dd  00 fe		 brk #$fe
$18:e5df  2e cc ac	  rol $accc
$18:e5e2  51 88		 eor ($88),y
$18:e5e4  74 12		 stz $12,x
$18:e5e6  70 f2		 bvs $e5da
$18:e5e8  25 28		 and $28
$18:e5ea  4e 40 04	  lsr $0440
$18:e5ed  a5 09		 lda $09
$18:e5ef  d3 e4		 cmp ($e4,s),y
$18:e5f1  94 a1		 sty $a1,x
$18:e5f3  3b			tsc
$18:e5f4  75 a4		 adc $a4,x
$18:e5f6  49 e4		 eor #$e4
$18:e5f8  92 20		 sta ($20)
$18:e5fa  02 4c		 cop #$4c
$18:e5fc  9f 29 29 3b   sta $3b2929,x
$18:e600  9c 4a 60	  stz $604a
$18:e603  7e 38 94	  ror $9438,x
$18:e606  c5 0a		 cmp $0a
$18:e608  6e 52 47	  ror $4752
$18:e60b  0c 4a 66	  tsb $664a
$18:e60e  93 18		 sta ($18,s),y
$18:e610  c4 22		 cpy $22
$18:e612  15 10		 ora $10,x
$18:e614  3f 13 e4 22   and $22e413,x
$18:e618  28			plp
$18:e619  52 00		 eor ($00)
$18:e61b  19 10 1f	  ora $1f10,y
$18:e61e  21 13		 and ($13,x)
$18:e620  49 99		 eor #$99
$18:e622  78			sei
$18:e623  02 49		 cop #$49
$18:e625  0d 50 91	  ora $9150
$18:e628  10 24		 bpl $e64e
$18:e62a  8c 42 22	  sty $2242
$18:e62d  04 95		 tsb $95
$18:e62f  5e 44 40	  lsr $4044,x
$18:e632  93 34		 sta ($34,s),y
$18:e634  89 a8		 bit #$a8
$18:e636  12 73		 ora ($73)
$18:e638  b9 33 41	  lda $4133,y
$18:e63b  f6 6c		 inc $6c,x
$18:e63d  d0 01		 bne $e640
$18:e63f  19 18 da	  ora $da18,y
$18:e642  80 cd		 bra $e611
$18:e644  00 80		 brk #$80
$18:e646  a1 c6		 lda ($c6,x)
$18:e648  30 ed		 bmi $e637
$18:e64a  48			pha
$18:e64b  c3 d0		 cmp $d0,s
$18:e64d  41 83		 eor ($83,x)
$18:e64f  10 91		 bpl $e5e2
$18:e651  ab			plb
$18:e652  c9 8c		 cmp #$8c
$18:e654  12 18		 ora ($18)
$18:e656  14 05		 trb $05
$18:e658  3e 31 09	  rol $0931,x
$18:e65b  00 46		 brk #$46
$18:e65d  e1 6d		 sbc ($6d,x)
$18:e65f  a2 6a		 ldx #$6a
$18:e661  04 cc		 tsb $cc
$18:e663  e6 91		 inc $91
$18:e665  03 99		 ora $99,s
$18:e667  38			sec
$18:e668  c2 40		 rep #$40
$18:e66a  2d 49 88	  and $8849
$18:e66d  d1 24		 cmp ($24),y
$18:e66f  70 42		 bvs $e6b3
$18:e671  f9 c4 cd	  sbc $cdc4,y
$18:e674  84 d3		 sty $d3
$18:e676  08			php
$18:e677  89 b0		 bit #$b0
$18:e679  93 e0		 sta ($e0,s),y
$18:e67b  72 03		 adc ($03)
$18:e67d  6a			ror a
$18:e67e  99 98 a4	  sta $a498,y
$18:e681  46 b1		 lsr $b1
$18:e683  3a			dec a
$18:e684  90 5c		 bcc $e6e2
$18:e686  5b			tcd
$18:e687  04 ab		 tsb $ab
$18:e689  00 c0		 brk #$c0
$18:e68b  16 82		 asl $82,x
$18:e68d  11 34		 ora ($34),y
$18:e68f  72 13		 adc ($13)
$18:e691  9c 68 0e	  stz $0e68
$18:e694  41 2d		 eor ($2d,x)
$18:e696  04 d3		 tsb $d3
$18:e698  00 e5		 brk #$e5
$18:e69a  27 b0		 and [$b0]
$18:e69c  70 1a		 bvs $e6b8
$18:e69e  de 43 09	  dec $0943,x
$18:e6a1  bb			tyx
$18:e6a2  a9 26		 lda #$26
$18:e6a4  ef 14 9b be   sbc $be9b14
$18:e6a8  12 6e		 ora ($6e)
$18:e6aa  ff f7 30 cd   sbc $cd30f7,x
$18:e6ae  5d 49 35	  eor $3549,x
$18:e6b1  78			sei
$18:e6b2  a4 d5		 ldy $d5
$18:e6b4  f0 93		 beq $e649
$18:e6b6  51 4f		 eor ($4f),y
$18:e6b8  b9 85 e2	  lda $e285,y
$18:e6bb  4e 41 a0	  lsr $a041
$18:e6be  3c 52 80	  bit $8052,x
$18:e6c1  f8			sed
$18:e6c2  4a			lsr a
$18:e6c3  01 4f		 ora ($4f,x)
$18:e6c5  dc c3 36	  jml [$36c3]
$18:e6c8  75 24		 adc $24,x
$18:e6ca  d9 e2 93	  cmp $93e2,y
$18:e6cd  67 c2		 adc [$c2]
$18:e6cf  4d 8f be	  eor $be8f
$18:e6d2  64 1a		 stz $1a
$18:e6d4  0b			phd
$18:e6d5  a9 28		 lda #$28
$18:e6d7  2f 14 a0 be   and $bea014
$18:e6db  12 83		 ora ($83)
$18:e6dd  c0 ff		 cpy #$ff
$18:e6df  7f e1 f0 08   adc $08f0e1,x
$18:e6e3  5c 03 fb ff   jml $fffb03
$18:e6e7  58			cli
$18:e6e8  14 08		 trb $08
$18:e6ea  b2 30		 lda ($30)
$18:e6ec  52 d0		 eor ($d0)
$18:e6ee  50 9c		 bvc $e68c
$18:e6f0  06 e4		 asl $e4
$18:e6f2  16 97		 asl $97,x
$18:e6f4  96 82		 stx $82,y
$18:e6f6  86 e6		 stx $e6
$18:e6f8  40			rti
$18:e6f9  08			php
$18:e6fa  3b			tsc
$18:e6fb  bc b4 14	  ldy $14b4,x
$18:e6fe  67 32		 adc [$32]
$18:e700  07 40		 ora [$40]
$18:e702  15 e5		 ora $e5,x
$18:e704  a0 a2		 ldy #$a2
$18:e706  39 90 72	  and $7290,y
$18:e709  02 6f		 cop #$6f
$18:e70b  42 05		 wdm #$05
$18:e70d  15 cc		 ora $cc,x
$18:e70f  85 50		 sta $50
$18:e711  21 7a		 and ($7a,x)
$18:e713  10 28		 bpl $e73d
$18:e715  ee 64 38	  inc $3864
$18:e718  8a			txa
$18:e719  bc 57 c2	  ldy $c257,x
$18:e71c  af 33 51 2f   lda $2f5133
$18:e720  86 92		 stx $92
$18:e722  bc 34 60	  ldy $6034,x
$18:e725  30 c4		 bmi $e6eb
$18:e727  f9 f4 a4	  sbc $a4f4,y
$18:e72a  72 52		 adc ($52)
$18:e72c  92 be		 sta ($be)
$18:e72e  a6 1a		 ldx $1a
$18:e730  5a			phy
$18:e731  a9 29		 lda #$29
$18:e733  6b			rtl
$18:e734  13 83		 ora ($83,s),y
$18:e736  c0 20		 cpy #$20
$18:e738  29 da		 and #$da
$18:e73a  a4 2a		 ldy $2a
$18:e73c  92 91		 sta ($91)
$18:e73e  40			rti
$18:e73f  fe 7f e1	  inc $e17f,x
$18:e742  89 d1		 bit #$d1
$18:e744  4e 42 a8	  lsr $a842
$18:e747  75 30		 adc $30,x
$18:e749  45 19		 eor $19
$18:e74b  ee 60 8e	  inc $8e60
$18:e74e  af 53 06 b5   lda $b50653
$18:e752  fc 4a 50	  jsr ($504a,x)
$18:e755  d6 3f		 dec $3f,x
$18:e757  85 3c		 sta $3c
$18:e759  49 c4		 eor #$c4
$18:e75b  6a			ror a
$18:e75c  03 50		 ora $50,s
$18:e75e  14 63		 trb $63
$18:e760  aa			tax
$18:e761  10 fa		 bpl $e75d
$18:e763  8c 79 43	  sty $4379
$18:e766  6f 51 8e f0   adc $f08e51
$18:e76a  96 71		 stx $71,y
$18:e76c  84 db		 sty $db
$18:e76e  8c 0a 11	  sty $110a
$18:e771  dc 82 0c	  jml [$0c82]
$18:e774  05 4c		 ora $4c
$18:e776  1e c3 07	  asl $07c3,x
$18:e779  aa			tax
$18:e77a  87 5c		 sta [$5c]
$18:e77c  75 4d		 adc $4d,x
$18:e77e  f1 f3		 sbc ($f3),y
$18:e780  dc 43 de	  jml [$de43]
$18:e783  3a			dec a
$18:e784  a7 ba		 lda [$ba]
$18:e786  08			php
$18:e787  d6 23		 dec $23,x
$18:e789  2b			pld
$18:e78a  26 02		 rol $02
$18:e78c  02 ee		 cop #$ee
$18:e78e  18			clc
$18:e78f  46 01		 lsr $01
$18:e791  84 4d		 sty $4d
$18:e793  e0 c8		 cpx #$c8
$18:e795  3f c4 ca 11   and $11cac4,x
$18:e799  0f 02 bc 41   ora $41bc02
$18:e79d  c3 e1		 cmp $e1,s
$18:e79f  06 99		 asl $99
$18:e7a1  95 a0		 sta $a0,x
$18:e7a3  cc 2f 69	  cpy $692f
$18:e7a6  8d 35 a0	  sta $a035
$18:e7a9  50 88		 bvc $e733
$18:e7ab  45 31		 eor $31
$18:e7ad  a0 43		 ldy #$43
$18:e7af  f0 ae		 beq $e75f
$18:e7b1  35 c8		 and $c8,x
$18:e7b3  7e 15 d6	  ror $d615,x
$18:e7b6  f6 82		 inc $82,x
$18:e7b8  70 a6		 bvs $e760
$18:e7ba  0d 91 ae	  ora $ae91
$18:e7bd  d0 1a		 bne $e7d9
$18:e7bf  44 0d 0a	  mvp $0a,$0d
$18:e7c2  03 b4		 ora $b4,s
$18:e7c4  f6 0f		 inc $0f,x
$18:e7c6  34 e0		 bit $e0,x
$18:e7c8  19 8c cb	  ora $cb8c,y
$18:e7cb  a4 61		 ldy $61
$18:e7cd  57 91		 eor [$91],y
$18:e7cf  34 9a		 bit $9a,x
$18:e7d1  61 16		 adc ($16,x)
$18:e7d3  5d 39 3c	  eor $3c39,x
$18:e7d6  a1 d5		 lda ($d5,x)
$18:e7d8  45 78		 eor $78
$18:e7da  ac 42 1d	  ldy $1d42
$18:e7dd  55 53		 eor $53,x
$18:e7df  0c 21 d6	  tsb $d621
$18:e7e2  18			clc
$18:e7e3  22 79 22 43   jsl $432279
$18:e7e7  84 a8		 sty $a8
$18:e7e9  19 01 49	  ora $4901,y
$18:e7ec  e0 ed		 cpx #$ed
$18:e7ee  02 81		 cop #$81
$18:e7f0  1f 4e 20 a6   ora $a6204e,x
$18:e7f4  04 29		 tsb $29
$18:e7f6  0d 01 16	  ora $1601
$18:e7f9  43 b2		 eor $b2,s
$18:e7fb  a6 93		 ldx $93
$18:e7fd  41 a6		 eor ($a6,x)
$18:e7ff  00 51		 brk #$51
$18:e801  5f 13 a0 2b   eor $2ba013,x
$18:e805  84 d0		 sty $d0
$18:e807  59 8c 42	  eor $428c,y
$18:e80a  bb			tyx
$18:e80b  c0 32		 cpy #$32
$18:e80d  02 5e		 cop #$5e
$18:e80f  e3 2c		 sbc $2c,s
$18:e811  84 88		 sty $88
$18:e813  99 c1 a2	  sta $a2c1,y
$18:e816  44 10 33	  mvp $33,$10
$18:e819  86 88		 stx $88
$18:e81b  ca			dex
$18:e81c  31 11		 and ($11),y
$18:e81e  00 55		 brk #$55
$18:e820  07 20		 ora [$20]
$18:e822  e2 18		 sep #$18
$18:e824  85 54		 sta $54
$18:e826  72 10		 adc ($10)
$18:e828  92 b8		 sta ($b8)
$18:e82a  d7 70		 cmp [$70],y
$18:e82c  0b			phd
$18:e82d  00 1d		 brk #$1d
$18:e82f  8d 73 00	  sta $0073
$18:e832  b1 12		 lda ($12),y
$18:e834  93 c0		 sta ($c0,s),y
$18:e836  d6 00		 dec $00,x
$18:e838  87 17		 sta [$17]
$18:e83a  a1 ac		 lda ($ac,x)
$18:e83c  45 f8		 eor $f8
$18:e83e  50 90		 bvc $e7d0
$18:e840  09 9d		 ora #$9d
$18:e842  05 2e		 ora $2e
$18:e844  01 97		 ora ($97,x)
$18:e846  3f 97 48 b8   and $b84897,x
$18:e84a  47 b0		 eor [$b0]
$18:e84c  f1 19		 sbc ($19),y
$18:e84e  49 7e		 eor #$7e
$18:e850  1c 31 18	  trb $1831
$18:e853  8e 21 14	  stx $1421
$18:e856  10 17		 bpl $e86f
$18:e858  98			tya
$18:e859  11 cc		 ora ($cc),y
$18:e85b  b2 45		 lda ($45)
$18:e85d  01 47		 ora ($47,x)
$18:e85f  82 fc 2b	  brl $145e
$18:e862  e4 52		 cpx $52
$18:e864  5f 85 3d b2   eor $b23d85,x
$18:e868  71 8a		 adc ($8a),y
$18:e86a  73 64		 adc ($64,s),y
$18:e86c  95 61		 sta $61,x
$18:e86e  5e 2c 5b	  lsr $5b2c,x
$18:e871  80 58		 bra $e8cb
$18:e873  41 16		 eor ($16,x)
$18:e875  81 7d		 sta ($7d,x)
$18:e877  0c c9 58	  tsb $58c9
$18:e87a  36 a5		 rol $a5,x
$18:e87c  a1 12		 lda ($12,x)
$18:e87e  cd a1 79	  cmp $79a1
$18:e881  05 78		 ora $78
$18:e883  16 08		 asl $08,x
$18:e885  47 0b		 eor [$0b]
$18:e887  85 39		 sta $39
$18:e889  82 81 87	  brl $700d
$18:e88c  3d 8c 39	  and $398c,x
$18:e88f  46 4d		 lsr $4d
$18:e891  d2 55		 cmp ($55)
$18:e893  89 44		 bit #$44
$18:e895  96 40		 stx $40,y
$18:e897  06 00		 asl $00
$18:e899  4e 2e 0d	  lsr $0d2e
$18:e89c  ff e0 b8 03   sbc $03b8e0,x
$18:e8a0  00 18		 brk #$18
$18:e8a2  00 00		 brk #$00
$18:e8a4  2f 32 65 7f   and $7f6532
$18:e8a8  98			tya
$18:e8a9  b2 cb		 lda ($cb)
$18:e8ab  e5 fc		 sbc $fc
$18:e8ad  19 32 4c	  ora $4c32,y
$18:e8b0  65 72		 adc $72
$18:e8b2  7f 8c 98 a5   adc $a5988c,x
$18:e8b6  b2 bf		 lda ($bf)
$18:e8b8  cb			wai
$18:e8b9  d8			cld
$18:e8ba  e5 f2		 sbc $f2
$18:e8bc  fc 25 0b	  jsr ($0b25,x)
$18:e8bf  00 10		 brk #$10
$18:e8c1  02 10		 cop #$10
$18:e8c3  0c 10 1c	  tsb $1c10
$18:e8c6  10 ff		 bpl $e8c7
$18:e8c8  00 04		 brk #$04
$18:e8ca  10 00		 bpl $e8cc
$18:e8cc  00 2c		 brk #$2c
$18:e8ce  10 69		 bpl $e939
$18:e8d0  10 d7		 bpl $e8a9
$18:e8d2  10 e8		 bpl $e8bc
$18:e8d4  10 16		 bpl $e8ec
$18:e8d6  11 47		 ora ($47),y
$18:e8d8  11 b5		 ora ($b5),y
$18:e8da  11 00		 ora ($00),y
$18:e8dc  00 e6		 brk #$e6
$18:e8de  11 ae		 ora ($ae),y
$18:e8e0  13 b3		 ora ($b3,s),y
$18:e8e2  14 c6		 trb $c6
$18:e8e4  14 8d		 trb $8d
$18:e8e6  16 56		 asl $56,x
$18:e8e8  18			clc
$18:e8e9  5b			tcd
$18:e8ea  19 00 00	  ora $0000,y
$18:e8ed  fa			plx
$18:e8ee  01 e1		 ora ($e1,x)
$18:e8f0  0a			asl a
$18:e8f1  e7 11		 sbc [$11]
$18:e8f3  e5 f0		 sbc $f0
$18:e8f5  ed 96 e0	  sbc $e096
$18:e8f8  00 f5		 brk #$f5
$18:e8fa  3e 30 30	  rol $3030,x
$18:e8fd  f7 07		 sbc [$07],y
$18:e8ff  b0 02		 bcs $e903
$18:e901  05 7f		 ora $7f
$18:e903  a6 a9		 ldx $a9
$18:e905  ab			plb
$18:e906  ad 04 ab	  lda $ab04
$18:e909  30 ad		 bmi $e8b8
$18:e90b  18			clc
$18:e90c  c9 ad		 cmp #$ad
$18:e90e  0f c8 05 ab   ora $ab05c8
$18:e912  04 a9		 tsb $a9
$18:e914  06 a8		 asl $a8
$18:e916  ab			plb
$18:e917  06 6f		 asl $6f
$18:e919  a9 06		 lda #$06
$18:e91b  4f a8 18 7f   eor $7f18a8
$18:e91f  a8			tay
$18:e920  30 c8		 bmi $e8ea
$18:e922  c9 60		 cmp #$60
$18:e924  c9 c9		 cmp #$c9
$18:e926  c9 c9		 cmp #$c9
$18:e928  00 00		 brk #$00
$18:e92a  e1 0a		 sbc ($0a,x)
$18:e92c  ed 91 e0	  sbc $e091
$18:e92f  00 05		 brk #$05
$18:e931  7f 9a 9d 9f   adc $9f9d9a,x
$18:e935  a1 04		 lda ($04,x)
$18:e937  9f 30 a1 18   sta $18a130,x
$18:e93b  c9 a1		 cmp #$a1
$18:e93d  0f c8 05 9f   ora $9f05c8
$18:e941  04 9d		 tsb $9d
$18:e943  06 9c		 asl $9c
$18:e945  9f 06 5f 9d   sta $9d5f06,x
$18:e949  06 4f		 asl $4f
$18:e94b  9c 18 7f	  stz $7f18
$18:e94e  9c 30 c8	  stz $c830
$18:e951  c9 ed		 cmp #$ed
$18:e953  82 e1 0b	  brl $f537
$18:e956  06 8e		 asl $8e
$18:e958  90 91		 bcc $e8eb
$18:e95a  8e 90 91	  stx $9190
$18:e95d  8e 90 8e	  stx $8e90
$18:e960  90 91		 bcc $e8f3
$18:e962  8e 90 91	  stx $9190
$18:e965  8e 90 8e	  stx $8e90
$18:e968  90 91		 bcc $e8fb
$18:e96a  8e 90 91	  stx $9190
$18:e96d  8e 90 8e	  stx $8e90
$18:e970  90 91		 bcc $e903
$18:e972  8e 90 91	  stx $9190
$18:e975  93 95		 sta ($95,s),y
$18:e977  8e 90 91	  stx $9190
$18:e97a  8e 90 91	  stx $9190
$18:e97d  8e 90 8e	  stx $8e90
$18:e980  90 91		 bcc $e913
$18:e982  8e 90 91	  stx $9190
$18:e985  8e 90 8e	  stx $8e90
$18:e988  90 91		 bcc $e91b
$18:e98a  8e 90 91	  stx $9190
$18:e98d  8e 90 8e	  stx $8e90
$18:e990  90 91		 bcc $e923
$18:e992  8e 90 91	  stx $9190
$18:e995  93 95		 sta ($95,s),y
$18:e997  00 e1		 brk #$e1
$18:e999  0a			asl a
$18:e99a  ed b4 e0	  sbc $e0b4
$18:e99d  00 60		 brk #$60
$18:e99f  c9 c9		 cmp #$c9
$18:e9a1  c9 60		 cmp #$60
$18:e9a3  7f 8e c8 89   adc $89c88e,x
$18:e9a7  c8			iny
$18:e9a8  00 e1		 brk #$e1
$18:e9aa  09 ed		 ora #$ed
$18:e9ac  82 e0 00	  brl $ea8f
$18:e9af  05 7f		 ora $7f
$18:e9b1  9a			txs
$18:e9b2  9d 9f a1	  sta $a19f,x
$18:e9b5  04 9f		 tsb $9f
$18:e9b7  30 a1		 bmi $e95a
$18:e9b9  18			clc
$18:e9ba  c9 a1		 cmp #$a1
$18:e9bc  0f c8 05 9f   ora $9f05c8
$18:e9c0  04 9d		 tsb $9d
$18:e9c2  06 9c		 asl $9c
$18:e9c4  9f 06 6f 9d   sta $9d6f06,x
$18:e9c8  06 4f		 asl $4f
$18:e9ca  9c 18 7f	  stz $7f18
$18:e9cd  9c 30 c8	  stz $c830
$18:e9d0  c9 60		 cmp #$60
$18:e9d2  c9 c9		 cmp #$c9
$18:e9d4  c9 c9		 cmp #$c9
$18:e9d6  00 e1		 brk #$e1
$18:e9d8  09 ed		 ora #$ed
$18:e9da  5a			phy
$18:e9db  e0 00		 cpx #$00
$18:e9dd  01 c9		 ora ($c9,x)
$18:e9df  05 7f		 ora $7f
$18:e9e1  a6 a9		 ldx $a9
$18:e9e3  ab			plb
$18:e9e4  ad 04 ab	  lda $ab04
$18:e9e7  30 ad		 bmi $e996
$18:e9e9  18			clc
$18:e9ea  c9 ad		 cmp #$ad
$18:e9ec  0f c8 05 ab   ora $ab05c8
$18:e9f0  04 a9		 tsb $a9
$18:e9f2  06 a8		 asl $a8
$18:e9f4  ab			plb
$18:e9f5  06 6f		 asl $6f
$18:e9f7  a9 06		 lda #$06
$18:e9f9  4f a8 18 7f   eor $7f18a8
$18:e9fd  a8			tay
$18:e9fe  30 c8		 bmi $e9c8
$18:ea00  c9 60		 cmp #$60
$18:ea02  c9 c9		 cmp #$c9
$18:ea04  c9 5f		 cmp #$5f
$18:ea06  c9 00		 cmp #$00
$18:ea08  e1 0a		 sbc ($0a,x)
$18:ea0a  ed 5a e0	  sbc $e05a
$18:ea0d  00 05		 brk #$05
$18:ea0f  7f 9a 9d 9f   adc $9f9d9a,x
$18:ea13  a1 04		 lda ($04,x)
$18:ea15  9f 30 a1 18   sta $18a130,x
$18:ea19  c9 a1		 cmp #$a1
$18:ea1b  0f c8 05 9f   ora $9f05c8
$18:ea1f  04 9d		 tsb $9d
$18:ea21  06 9c		 asl $9c
$18:ea23  9f 06 5f 9d   sta $9d5f06,x
$18:ea27  06 4f		 asl $4f
$18:ea29  9c 18 7f	  stz $7f18
$18:ea2c  9c 30 c8	  stz $c830
$18:ea2f  c9 ed		 cmp #$ed
$18:ea31  78			sei
$18:ea32  e1 0c		 sbc ($0c,x)
$18:ea34  06 9a		 asl $9a
$18:ea36  9c 9d 9a	  stz $9a9d
$18:ea39  9c 9d 9a	  stz $9a9d
$18:ea3c  9c 9a 9c	  stz $9c9a
$18:ea3f  9d 9a 9c	  sta $9c9a,x
$18:ea42  9d 9a 9c	  sta $9c9a,x
$18:ea45  9a			txs
$18:ea46  9c 9d 9a	  stz $9a9d
$18:ea49  9c 9d 9a	  stz $9a9d
$18:ea4c  9c 9a 9c	  stz $9c9a
$18:ea4f  9d 9a 9c	  sta $9c9a,x
$18:ea52  9d 9f a1	  sta $a19f,x
$18:ea55  9a			txs
$18:ea56  9c 9d 9a	  stz $9a9d
$18:ea59  9c 9d 9a	  stz $9a9d
$18:ea5c  9c 9a 9c	  stz $9c9a
$18:ea5f  9d 9a 9c	  sta $9c9a,x
$18:ea62  9d 9a 9c	  sta $9c9a,x
$18:ea65  9a			txs
$18:ea66  9c 9d 9a	  stz $9a9d
$18:ea69  9c 9d 9a	  stz $9a9d
$18:ea6c  9c 9a 9c	  stz $9c9a
$18:ea6f  9d 9a 9c	  sta $9c9a,x
$18:ea72  9d 9f a1	  sta $a19f,x
$18:ea75  00 e1		 brk #$e1
$18:ea77  07 ed		 ora [$ed]
$18:ea79  32 e0		 and ($e0)
$18:ea7b  00 02		 brk #$02
$18:ea7d  c9 05		 cmp #$05
$18:ea7f  7f a6 a9 ab   adc $aba9a6,x
$18:ea83  ad 04 ab	  lda $ab04
$18:ea86  30 ad		 bmi $ea35
$18:ea88  18			clc
$18:ea89  c9 ad		 cmp #$ad
$18:ea8b  0f c8 05 ab   ora $ab05c8
$18:ea8f  04 a9		 tsb $a9
$18:ea91  06 a8		 asl $a8
$18:ea93  ab			plb
$18:ea94  06 6f		 asl $6f
$18:ea96  a9 06		 lda #$06
$18:ea98  4f a8 18 7f   eor $7f18a8
$18:ea9c  a8			tay
$18:ea9d  30 c8		 bmi $ea67
$18:ea9f  c9 60		 cmp #$60
$18:eaa1  c9 c9		 cmp #$c9
$18:eaa3  c9 5e		 cmp #$5e
$18:eaa5  c9 00		 cmp #$00
$18:eaa7  60			rts
$18:eaa8  7f a6 04 6f   adc $6f04a6,x
$18:eaac  a6 14		 ldx $14
$18:eaae  7f a1 30 c8   adc $c830a1,x
$18:eab2  0f a1 05 9d   ora $9d05a1
$18:eab6  04 9c		 tsb $9c
$18:eab8  04 6f		 tsb $6f
$18:eaba  9f 04 5d 9d   sta $9d5d04,x
$18:eabe  04 5b		 tsb $5b
$18:eac0  9c 04 6f	  stz $6f04
$18:eac3  9d 04 5d	  sta $5d04,x
$18:eac6  9c 04 5b	  stz $5b04
$18:eac9  9a			txs
$18:eaca  48			pha
$18:eacb  7f 9a 36 c8   adc $c8369a,x
$18:eacf  06 6f		 asl $6f
$18:ead1  9c 06 5f	  stz $5f06
$18:ead4  9d 9f 06	  sta $069f,x
$18:ead7  7f a1 06 5d   adc $5d06a1,x
$18:eadb  a3 06		 lda $06,s
$18:eadd  5f a5 06 5b   eor $5b06a5,x
$18:eae1  a6 30		 ldx $30
$18:eae3  7f a6 20 ad   adc $ad20a6,x
$18:eae7  08			php
$18:eae8  7d b2 08	  adc $08b2,x
$18:eaeb  7b			tdc
$18:eaec  b4 50		 ldy $50,x
$18:eaee  77 b5		 adc [$b5],y
$18:eaf0  08			php
$18:eaf1  7d b2 08	  adc $08b2,x
$18:eaf4  79 ad 60	  adc $60ad,y
$18:eaf7  7f ab 30 c8   adc $c830ab,x
$18:eafb  24 4b		 bit $4b
$18:eafd  ad 0c c9	  lda $c90c
$18:eb00  05 6f		 ora $6f
$18:eb02  ad 1f 7f	  lda $7f1f
$18:eb05  a6 06		 ldx $06
$18:eb07  a9 06		 lda #$06
$18:eb09  7b			tdc
$18:eb0a  ab			plb
$18:eb0b  06 7f		 asl $7f
$18:eb0d  ad 06 7d	  lda $7d06
$18:eb10  ab			plb
$18:eb11  06 7f		 asl $7f
$18:eb13  a9 06		 lda #$06
$18:eb15  7b			tdc
$18:eb16  a8			tay
$18:eb17  0c 7f a9	  tsb $a97f
$18:eb1a  0c 7d ab	  tsb $ab7d
$18:eb1d  06 5f		 asl $5f
$18:eb1f  ad 06 5d	  lda $5d06
$18:eb22  a6 06		 ldx $06
$18:eb24  5f a5 06 5b   eor $5b06a5,x
$18:eb28  a6 06		 ldx $06
$18:eb2a  5f a8 06 5d   eor $5d06a8,x
$18:eb2e  a9 06		 lda #$06
$18:eb30  5f ab 06 5b   eor $5b06ab,x
$18:eb34  ad 06 5f	  lda $5f06
$18:eb37  ae 06 5d	  ldx $5d06
$18:eb3a  ad 06 5f	  lda $5f06
$18:eb3d  ab			plb
$18:eb3e  06 5b		 asl $5b
$18:eb40  a9 06		 lda #$06
$18:eb42  5f a8 06 5d   eor $5d06a8,x
$18:eb46  a9 06		 lda #$06
$18:eb48  5f ab 06 5b   eor $5b06ab,x
$18:eb4c  ad 06 5f	  lda $5f06
$18:eb4f  ad 06 5d	  lda $5d06
$18:eb52  ab			plb
$18:eb53  06 5f		 asl $5f
$18:eb55  ab			plb
$18:eb56  06 5b		 asl $5b
$18:eb58  a9 06		 lda #$06
$18:eb5a  5f a9 06 5d   eor $5d06a9,x
$18:eb5e  a8			tay
$18:eb5f  06 5f		 asl $5f
$18:eb61  a9 06		 lda #$06
$18:eb63  5b			tcd
$18:eb64  ab			plb
$18:eb65  06 5f		 asl $5f
$18:eb67  ad 06 5d	  lda $5d06
$18:eb6a  ab			plb
$18:eb6b  06 5f		 asl $5f
$18:eb6d  ab			plb
$18:eb6e  06 5b		 asl $5b
$18:eb70  a9 06		 lda #$06
$18:eb72  5f a9 06 5d   eor $5d06a9,x
$18:eb76  a8			tay
$18:eb77  06 5f		 asl $5f
$18:eb79  a9 06		 lda #$06
$18:eb7b  5b			tcd
$18:eb7c  ab			plb
$18:eb7d  06 5f		 asl $5f
$18:eb7f  ad 06 5d	  lda $5d06
$18:eb82  ab			plb
$18:eb83  06 5f		 asl $5f
$18:eb85  ae 06 5b	  ldx $5b06
$18:eb88  ad 06 5f	  lda $5f06
$18:eb8b  ab			plb
$18:eb8c  06 5d		 asl $5d
$18:eb8e  a9 06		 lda #$06
$18:eb90  5f a8 06 5b   eor $5b06a8,x
$18:eb94  a9 06		 lda #$06
$18:eb96  5f ab 06 5d   eor $5d06ab,x
$18:eb9a  a9 06		 lda #$06
$18:eb9c  5f ad 06 5b   eor $5b06ad,x
$18:eba0  ab			plb
$18:eba1  06 5f		 asl $5f
$18:eba3  a9 06		 lda #$06
$18:eba5  5d a8 06	  eor $06a8,x
$18:eba8  5f a6 06 5b   eor $5b06a6,x
$18:ebac  a8			tay
$18:ebad  06 5f		 asl $5f
$18:ebaf  ab			plb
$18:ebb0  06 5d		 asl $5d
$18:ebb2  a9 06		 lda #$06
$18:ebb4  5f a8 06 5b   eor $5b06a8,x
$18:ebb8  a9 06		 lda #$06
$18:ebba  5f ab 06 5d   eor $5d06ab,x
$18:ebbe  ad 06 5f	  lda $5f06
$18:ebc1  ae 06 5b	  ldx $5b06
$18:ebc4  b1 06		 lda ($06),y
$18:ebc6  5f b2 06 5d   eor $5d06b2,x
$18:ebca  b4 06		 ldy $06,x
$18:ebcc  5f b7 06 5b   eor $5b06b7,x
$18:ebd0  b5 06		 lda $06,x
$18:ebd2  5f b4 06 5d   eor $5d06b4,x
$18:ebd6  b2 06		 lda ($06)
$18:ebd8  5f ad 06 5b   eor $5b06ad,x
$18:ebdc  a9 06		 lda #$06
$18:ebde  5f ab 06 5d   eor $5d06ab,x
$18:ebe2  a9 06		 lda #$06
$18:ebe4  5f a8 06 5b   eor $5b06a8,x
$18:ebe8  a6 06		 ldx $06
$18:ebea  5f a8 06 5d   eor $5d06a8,x
$18:ebee  a9 06		 lda #$06
$18:ebf0  5f ab 06 5b   eor $5b06ab,x
$18:ebf4  ad 06 5f	  lda $5f06
$18:ebf7  ae 06 5d	  ldx $5d06
$18:ebfa  ad 06 5f	  lda $5f06
$18:ebfd  b1 06		 lda ($06),y
$18:ebff  5b			tcd
$18:ec00  ad 06 5f	  lda $5f06
$18:ec03  b2 06		 lda ($06)
$18:ec05  5d ad 06	  eor $06ad,x
$18:ec08  5f b4 06 5b   eor $5b06b4,x
$18:ec0c  ad 06 5f	  lda $5f06
$18:ec0f  b5 06		 lda $06,x
$18:ec11  5d b7 06	  eor $06b7,x
$18:ec14  5f b5 06 5b   eor $5b06b5,x
$18:ec18  b4 06		 ldy $06,x
$18:ec1a  5f b7 06 5d   eor $5d06b7,x
$18:ec1e  b5 06		 lda $06,x
$18:ec20  5f b4 06 5b   eor $5b06b4,x
$18:ec24  b5 06		 lda $06,x
$18:ec26  5f b7 06 5d   eor $5d06b7,x
$18:ec2a  b5 06		 lda $06,x
$18:ec2c  5f b4 06 5b   eor $5b06b4,x
$18:ec30  b2 06		 lda ($06)
$18:ec32  5f b5 06 5d   eor $5d06b5,x
$18:ec36  b4 06		 ldy $06,x
$18:ec38  5f b2 06 5b   eor $5b06b2,x
$18:ec3c  b4 06		 ldy $06,x
$18:ec3e  5f b5 06 5d   eor $5d06b5,x
$18:ec42  b4 06		 ldy $06,x
$18:ec44  5f b2 06 5b   eor $5b06b2,x
$18:ec48  b1 06		 lda ($06),y
$18:ec4a  5f b4 06 5d   eor $5d06b4,x
$18:ec4e  b2 06		 lda ($06)
$18:ec50  5f b1 06 5b   eor $5b06b1,x
$18:ec54  b2 06		 lda ($06)
$18:ec56  5f b4 06 5d   eor $5d06b4,x
$18:ec5a  b2 06		 lda ($06)
$18:ec5c  5f b1 06 5b   eor $5b06b1,x
$18:ec60  b2 06		 lda ($06)
$18:ec62  5f b4 06 5d   eor $5d06b4,x
$18:ec66  b2 06		 lda ($06)
$18:ec68  5f ad 06 5b   eor $5b06ad,x
$18:ec6c  a9 00		 lda #$00
$18:ec6e  00 e1		 brk #$e1
$18:ec70  0b			phd
$18:ec71  06 7f		 asl $7f
$18:ec73  8e 90 91	  stx $9190
$18:ec76  8e 90 91	  stx $9190
$18:ec79  8e 90 8e	  stx $8e90
$18:ec7c  90 91		 bcc $ec0f
$18:ec7e  8e 90 91	  stx $9190
$18:ec81  8e 90 8e	  stx $8e90
$18:ec84  90 91		 bcc $ec17
$18:ec86  8e 90 91	  stx $9190
$18:ec89  8e 90 8e	  stx $8e90
$18:ec8c  90 91		 bcc $ec1f
$18:ec8e  8e 90 91	  stx $9190
$18:ec91  93 95		 sta ($95,s),y
$18:ec93  8e 90 91	  stx $9190
$18:ec96  8e 90 91	  stx $9190
$18:ec99  8e 90 8e	  stx $8e90
$18:ec9c  90 91		 bcc $ec2f
$18:ec9e  8e 90 91	  stx $9190
$18:eca1  8e 90 8e	  stx $8e90
$18:eca4  90 91		 bcc $ec37
$18:eca6  8e 90 91	  stx $9190
$18:eca9  8e 90 8e	  stx $8e90
$18:ecac  90 91		 bcc $ec3f
$18:ecae  8e 90 91	  stx $9190
$18:ecb1  93 95		 sta ($95,s),y
$18:ecb3  8e 90 91	  stx $9190
$18:ecb6  8e 90 91	  stx $9190
$18:ecb9  8e 90 8e	  stx $8e90
$18:ecbc  90 91		 bcc $ec4f
$18:ecbe  8e 90 91	  stx $9190
$18:ecc1  8e 90 8e	  stx $8e90
$18:ecc4  90 91		 bcc $ec57
$18:ecc6  8e 90 91	  stx $9190
$18:ecc9  8e 90 8e	  stx $8e90
$18:eccc  90 91		 bcc $ec5f
$18:ecce  8e 90 91	  stx $9190
$18:ecd1  93 95		 sta ($95,s),y
$18:ecd3  90 91		 bcc $ec66
$18:ecd5  93 90		 sta ($90,s),y
$18:ecd7  91 93		 sta ($93),y
$18:ecd9  90 91		 bcc $ec6c
$18:ecdb  90 91		 bcc $ec6e
$18:ecdd  93 90		 sta ($90,s),y
$18:ecdf  91 93		 sta ($93),y
$18:ece1  90 91		 bcc $ec74
$18:ece3  90 91		 bcc $ec76
$18:ece5  93 90		 sta ($90,s),y
$18:ece7  91 93		 sta ($93),y
$18:ece9  90 91		 bcc $ec7c
$18:eceb  90 91		 bcc $ec7e
$18:eced  93 90		 sta ($90,s),y
$18:ecef  91 93		 sta ($93),y
$18:ecf1  95 96		 sta $96,x
$18:ecf3  8e 90 91	  stx $9190
$18:ecf6  8e 90 91	  stx $9190
$18:ecf9  8e 90 8e	  stx $8e90
$18:ecfc  90 91		 bcc $ec8f
$18:ecfe  8e 90 91	  stx $9190
$18:ed01  8e 90 8e	  stx $8e90
$18:ed04  90 91		 bcc $ec97
$18:ed06  8e 90 91	  stx $9190
$18:ed09  8e 90 8e	  stx $8e90
$18:ed0c  90 91		 bcc $ec9f
$18:ed0e  8e 90 91	  stx $9190
$18:ed11  93 95		 sta ($95,s),y
$18:ed13  8e 90 91	  stx $9190
$18:ed16  8e 90 91	  stx $9190
$18:ed19  8e 90 8e	  stx $8e90
$18:ed1c  90 91		 bcc $ecaf
$18:ed1e  8e 90 91	  stx $9190
$18:ed21  8e 90 8e	  stx $8e90
$18:ed24  90 91		 bcc $ecb7
$18:ed26  8e 90 91	  stx $9190
$18:ed29  8e 90 8e	  stx $8e90
$18:ed2c  90 91		 bcc $ecbf
$18:ed2e  8e 90 91	  stx $9190
$18:ed31  93 95		 sta ($95,s),y
$18:ed33  8e 90 91	  stx $9190
$18:ed36  8e 90 91	  stx $9190
$18:ed39  8e 90 8e	  stx $8e90
$18:ed3c  90 91		 bcc $eccf
$18:ed3e  8e 90 91	  stx $9190
$18:ed41  8e 90 8e	  stx $8e90
$18:ed44  90 91		 bcc $ecd7
$18:ed46  8e 90 91	  stx $9190
$18:ed49  8e 90 8e	  stx $8e90
$18:ed4c  90 91		 bcc $ecdf
$18:ed4e  8e 90 91	  stx $9190
$18:ed51  93 95		 sta ($95,s),y
$18:ed53  8e 90 91	  stx $9190
$18:ed56  8e 90 91	  stx $9190
$18:ed59  8e 90 8e	  stx $8e90
$18:ed5c  90 91		 bcc $ecef
$18:ed5e  8e 90 91	  stx $9190
$18:ed61  8e 90 8e	  stx $8e90
$18:ed64  90 91		 bcc $ecf7
$18:ed66  8e 90 91	  stx $9190
$18:ed69  8e 90 8e	  stx $8e90
$18:ed6c  90 91		 bcc $ecff
$18:ed6e  8e 90 91	  stx $9190
$18:ed71  93 95		 sta ($95,s),y
$18:ed73  00 60		 brk #$60
$18:ed75  7f 8e c8 c8   adc $c8c88e,x
$18:ed79  c8			iny
$18:ed7a  c8			iny
$18:ed7b  c8			iny
$18:ed7c  90 c8		 bcc $ed46
$18:ed7e  8e c8 c8	  stx $c8c8
$18:ed81  c8			iny
$18:ed82  c8			iny
$18:ed83  c8			iny
$18:ed84  c8			iny
$18:ed85  c8			iny
$18:ed86  00 60		 brk #$60
$18:ed88  7f 9a 04 6f   adc $6f049a,x
$18:ed8c  9a			txs
$18:ed8d  14 7f		 trb $7f
$18:ed8f  95 30		 sta $30,x
$18:ed91  c8			iny
$18:ed92  0f 95 05 91   ora $910595
$18:ed96  04 90		 tsb $90
$18:ed98  04 6f		 tsb $6f
$18:ed9a  93 04		 sta ($04,s),y
$18:ed9c  5d 91 04	  eor $0491,x
$18:ed9f  5b			tcd
$18:eda0  90 04		 bcc $eda6
$18:eda2  6f 91 04 5d   adc $5d0491
$18:eda6  90 04		 bcc $edac
$18:eda8  5b			tcd
$18:eda9  8e 48 7f	  stx $7f48
$18:edac  8e 36 c8	  stx $c836
$18:edaf  06 6f		 asl $6f
$18:edb1  90 06		 bcc $edb9
$18:edb3  5f 91 93 06   eor $069391,x
$18:edb7  7f 95 06 5d   adc $5d0695,x
$18:edbb  97 06		 sta [$06],y
$18:edbd  5f 99 06 5b   eor $5b0699,x
$18:edc1  9a			txs
$18:edc2  30 7f		 bmi $ee43
$18:edc4  9a			txs
$18:edc5  20 a1 08	  jsr $08a1
$18:edc8  7d a6 08	  adc $08a6,x
$18:edcb  7b			tdc
$18:edcc  a8			tay
$18:edcd  50 77		 bvc $ee46
$18:edcf  a9 08		 lda #$08
$18:edd1  7d a6 08	  adc $08a6,x
$18:edd4  79 a1 60	  adc $60a1,y
$18:edd7  7f 9f 30 c8   adc $c8309f,x
$18:eddb  24 59		 bit $59
$18:eddd  a1 0c		 lda ($0c,x)
$18:eddf  c9 04		 cmp #$04
$18:ede1  6f a1 20 7f   adc $7f20a1
$18:ede5  9a			txs
$18:ede6  06 9d		 asl $9d
$18:ede8  06 7b		 asl $7b
$18:edea  9f 06 7f a1   sta $a17f06,x
$18:edee  06 7d		 asl $7d
$18:edf0  9f 06 7f 9d   sta $9d7f06,x
$18:edf4  06 7b		 asl $7b
$18:edf6  9c 0c 7f	  stz $7f0c
$18:edf9  9d 0c 7d	  sta $7d0c,x
$18:edfc  9f 06 5f a1   sta $a15f06,x
$18:ee00  06 5d		 asl $5d
$18:ee02  9a			txs
$18:ee03  06 5f		 asl $5f
$18:ee05  99 06 5b	  sta $5b06,y
$18:ee08  9a			txs
$18:ee09  06 5f		 asl $5f
$18:ee0b  9c 06 5d	  stz $5d06
$18:ee0e  9d 06 5f	  sta $5f06,x
$18:ee11  9f 06 5b a1   sta $a15b06,x
$18:ee15  06 5f		 asl $5f
$18:ee17  a2 06		 ldx #$06
$18:ee19  5d a1 06	  eor $06a1,x
$18:ee1c  5f 9f 06 5b   eor $5b069f,x
$18:ee20  9d 06 5f	  sta $5f06,x
$18:ee23  9c 06 5d	  stz $5d06
$18:ee26  9d 06 5f	  sta $5f06,x
$18:ee29  9f 06 5b a1   sta $a15b06,x
$18:ee2d  06 5f		 asl $5f
$18:ee2f  a1 06		 lda ($06,x)
$18:ee31  5d 9f 06	  eor $069f,x
$18:ee34  5f 9f 06 5b   eor $5b069f,x
$18:ee38  9d 06 5f	  sta $5f06,x
$18:ee3b  9d 06 5d	  sta $5d06,x
$18:ee3e  9c 06 5f	  stz $5f06
$18:ee41  9d 06 5b	  sta $5b06,x
$18:ee44  9f 06 5f a1   sta $a15f06,x
$18:ee48  06 5d		 asl $5d
$18:ee4a  9f 06 5f 9f   sta $9f5f06,x
$18:ee4e  06 5b		 asl $5b
$18:ee50  9d 06 5f	  sta $5f06,x
$18:ee53  9d 06 5d	  sta $5d06,x
$18:ee56  9c 06 5f	  stz $5f06
$18:ee59  9d 06 5b	  sta $5b06,x
$18:ee5c  9f 06 5f a1   sta $a15f06,x
$18:ee60  06 5d		 asl $5d
$18:ee62  9f 06 5f a2   sta $a25f06,x
$18:ee66  06 5b		 asl $5b
$18:ee68  a1 06		 lda ($06,x)
$18:ee6a  5f 9f 06 5d   eor $5d069f,x
$18:ee6e  9d 06 5f	  sta $5f06,x
$18:ee71  9c 06 5b	  stz $5b06
$18:ee74  9d 06 5f	  sta $5f06,x
$18:ee77  9f 06 5d 9d   sta $9d5d06,x
$18:ee7b  06 5f		 asl $5f
$18:ee7d  a1 06		 lda ($06,x)
$18:ee7f  5b			tcd
$18:ee80  9f 06 5f 9d   sta $9d5f06,x
$18:ee84  06 5d		 asl $5d
$18:ee86  9c 06 5f	  stz $5f06
$18:ee89  9a			txs
$18:ee8a  06 5b		 asl $5b
$18:ee8c  9c 06 5f	  stz $5f06
$18:ee8f  9f 06 5d 9d   sta $9d5d06,x
$18:ee93  06 5f		 asl $5f
$18:ee95  9c 06 5b	  stz $5b06
$18:ee98  9d 06 5f	  sta $5f06,x
$18:ee9b  9f 06 5d a1   sta $a15d06,x
$18:ee9f  06 5f		 asl $5f
$18:eea1  a2 06		 ldx #$06
$18:eea3  5b			tcd
$18:eea4  a5 06		 lda $06
$18:eea6  5f a6 06 5d   eor $5d06a6,x
$18:eeaa  a8			tay
$18:eeab  06 5f		 asl $5f
$18:eead  ab			plb
$18:eeae  06 5b		 asl $5b
$18:eeb0  a9 06		 lda #$06
$18:eeb2  5f a8 06 5d   eor $5d06a8,x
$18:eeb6  a6 06		 ldx $06
$18:eeb8  5f a1 06 5b   eor $5b06a1,x
$18:eebc  9d 06 5f	  sta $5f06,x
$18:eebf  9f 06 5d 9d   sta $9d5d06,x
$18:eec3  06 5f		 asl $5f
$18:eec5  9c 06 5b	  stz $5b06
$18:eec8  9a			txs
$18:eec9  06 5f		 asl $5f
$18:eecb  9c 06 5d	  stz $5d06
$18:eece  9d 06 5f	  sta $5f06,x
$18:eed1  9f 06 5b a1   sta $a15b06,x
$18:eed5  06 5f		 asl $5f
$18:eed7  a2 06		 ldx #$06
$18:eed9  5d a1 06	  eor $06a1,x
$18:eedc  5f a5 06 5b   eor $5b06a5,x
$18:eee0  a1 06		 lda ($06,x)
$18:eee2  5f a6 06 5d   eor $5d06a6,x
$18:eee6  a1 06		 lda ($06,x)
$18:eee8  5f a8 06 5b   eor $5b06a8,x
$18:eeec  a1 06		 lda ($06,x)
$18:eeee  5f a9 06 5d   eor $5d06a9,x
$18:eef2  ab			plb
$18:eef3  06 5f		 asl $5f
$18:eef5  a9 06		 lda #$06
$18:eef7  5b			tcd
$18:eef8  a8			tay
$18:eef9  06 5f		 asl $5f
$18:eefb  ab			plb
$18:eefc  06 5d		 asl $5d
$18:eefe  a9 06		 lda #$06
$18:ef00  5f a8 06 5b   eor $5b06a8,x
$18:ef04  a9 06		 lda #$06
$18:ef06  5f ab 06 5d   eor $5d06ab,x
$18:ef0a  a9 06		 lda #$06
$18:ef0c  5f a8 06 5b   eor $5b06a8,x
$18:ef10  a6 06		 ldx $06
$18:ef12  5f a9 06 5d   eor $5d06a9,x
$18:ef16  a8			tay
$18:ef17  06 5f		 asl $5f
$18:ef19  a6 06		 ldx $06
$18:ef1b  5b			tcd
$18:ef1c  a8			tay
$18:ef1d  06 5f		 asl $5f
$18:ef1f  a9 06		 lda #$06
$18:ef21  5d a8 06	  eor $06a8,x
$18:ef24  5f a6 06 5b   eor $5b06a6,x
$18:ef28  a5 06		 lda $06
$18:ef2a  5f a8 06 5d   eor $5d06a8,x
$18:ef2e  a6 06		 ldx $06
$18:ef30  5f a5 06 5b   eor $5b06a5,x
$18:ef34  a6 06		 ldx $06
$18:ef36  5f a8 06 5d   eor $5d06a8,x
$18:ef3a  a6 06		 ldx $06
$18:ef3c  5f a5 06 5b   eor $5b06a5,x
$18:ef40  a6 06		 ldx $06
$18:ef42  5f a8 06 5d   eor $5d06a8,x
$18:ef46  a6 06		 ldx $06
$18:ef48  5f a1 06 5b   eor $5b06a1,x
$18:ef4c  9d 00 02	  sta $0200,x
$18:ef4f  c9 60		 cmp #$60
$18:ef51  7f a6 04 6f   adc $6f04a6,x
$18:ef55  a6 14		 ldx $14
$18:ef57  7f a1 30 c8   adc $c830a1,x
$18:ef5b  0f a1 05 9d   ora $9d05a1
$18:ef5f  04 9c		 tsb $9c
$18:ef61  04 6f		 tsb $6f
$18:ef63  9f 04 5d 9d   sta $9d5d04,x
$18:ef67  04 5b		 tsb $5b
$18:ef69  9c 04 6f	  stz $6f04
$18:ef6c  9d 04 5d	  sta $5d04,x
$18:ef6f  9c 04 5b	  stz $5b04
$18:ef72  9a			txs
$18:ef73  48			pha
$18:ef74  7f 9a 36 c8   adc $c8369a,x
$18:ef78  06 6f		 asl $6f
$18:ef7a  9c 06 5f	  stz $5f06
$18:ef7d  9d 9f 06	  sta $069f,x
$18:ef80  7f a1 06 5d   adc $5d06a1,x
$18:ef84  a3 06		 lda $06,s
$18:ef86  5f a5 06 5b   eor $5b06a5,x
$18:ef8a  a6 30		 ldx $30
$18:ef8c  7f a6 20 ad   adc $ad20a6,x
$18:ef90  08			php
$18:ef91  7d b2 08	  adc $08b2,x
$18:ef94  7b			tdc
$18:ef95  b4 50		 ldy $50,x
$18:ef97  77 b5		 adc [$b5],y
$18:ef99  08			php
$18:ef9a  7d b2 08	  adc $08b2,x
$18:ef9d  79 ad 60	  adc $60ad,y
$18:efa0  7f ab 30 c8   adc $c830ab,x
$18:efa4  24 4b		 bit $4b
$18:efa6  ad 0c c9	  lda $c90c
$18:efa9  05 6f		 ora $6f
$18:efab  ad 1f 7f	  lda $7f1f
$18:efae  a6 06		 ldx $06
$18:efb0  a9 06		 lda #$06
$18:efb2  7b			tdc
$18:efb3  ab			plb
$18:efb4  06 7f		 asl $7f
$18:efb6  ad 06 7d	  lda $7d06
$18:efb9  ab			plb
$18:efba  06 7f		 asl $7f
$18:efbc  a9 06		 lda #$06
$18:efbe  7b			tdc
$18:efbf  a8			tay
$18:efc0  0c 7f a9	  tsb $a97f
$18:efc3  0c 7d ab	  tsb $ab7d
$18:efc6  06 5f		 asl $5f
$18:efc8  ad 06 5d	  lda $5d06
$18:efcb  a6 06		 ldx $06
$18:efcd  5f a5 06 5b   eor $5b06a5,x
$18:efd1  a6 06		 ldx $06
$18:efd3  5f a8 06 5d   eor $5d06a8,x
$18:efd7  a9 06		 lda #$06
$18:efd9  5f ab 06 5b   eor $5b06ab,x
$18:efdd  ad 06 5f	  lda $5f06
$18:efe0  ae 06 5d	  ldx $5d06
$18:efe3  ad 06 5f	  lda $5f06
$18:efe6  ab			plb
$18:efe7  06 5b		 asl $5b
$18:efe9  a9 06		 lda #$06
$18:efeb  5f a8 06 5d   eor $5d06a8,x
$18:efef  a9 06		 lda #$06
$18:eff1  5f ab 06 5b   eor $5b06ab,x
$18:eff5  ad 06 5f	  lda $5f06
$18:eff8  ad 06 5d	  lda $5d06
$18:effb  ab			plb
$18:effc  06 5f		 asl $5f
$18:effe  ab			plb
$18:efff  06 5b		 asl $5b
$18:f001  a9 06		 lda #$06
$18:f003  5f a9 06 5d   eor $5d06a9,x
$18:f007  a8			tay
$18:f008  06 5f		 asl $5f
$18:f00a  a9 06		 lda #$06
$18:f00c  5b			tcd
$18:f00d  ab			plb
$18:f00e  06 5f		 asl $5f
$18:f010  ad 06 5d	  lda $5d06
$18:f013  ab			plb
$18:f014  06 5f		 asl $5f
$18:f016  ab			plb
$18:f017  06 5b		 asl $5b
$18:f019  a9 06		 lda #$06
$18:f01b  5f a9 06 5d   eor $5d06a9,x
$18:f01f  a8			tay
$18:f020  06 5f		 asl $5f
$18:f022  a9 06		 lda #$06
$18:f024  5b			tcd
$18:f025  ab			plb
$18:f026  06 5f		 asl $5f
$18:f028  ad 06 5d	  lda $5d06
$18:f02b  ab			plb
$18:f02c  06 5f		 asl $5f
$18:f02e  ae 06 5b	  ldx $5b06
$18:f031  ad 06 5f	  lda $5f06
$18:f034  ab			plb
$18:f035  06 5d		 asl $5d
$18:f037  a9 06		 lda #$06
$18:f039  5f a8 06 5b   eor $5b06a8,x
$18:f03d  a9 06		 lda #$06
$18:f03f  5f ab 06 5d   eor $5d06ab,x
$18:f043  a9 06		 lda #$06
$18:f045  5f ad 06 5b   eor $5b06ad,x
$18:f049  ab			plb
$18:f04a  06 5f		 asl $5f
$18:f04c  a9 06		 lda #$06
$18:f04e  5d a8 06	  eor $06a8,x
$18:f051  5f a6 06 5b   eor $5b06a6,x
$18:f055  a8			tay
$18:f056  06 5f		 asl $5f
$18:f058  ab			plb
$18:f059  06 5d		 asl $5d
$18:f05b  a9 06		 lda #$06
$18:f05d  5f a8 06 5b   eor $5b06a8,x
$18:f061  a9 06		 lda #$06
$18:f063  5f ab 06 5d   eor $5d06ab,x
$18:f067  ad 06 5f	  lda $5f06
$18:f06a  ae 06 5b	  ldx $5b06
$18:f06d  b1 06		 lda ($06),y
$18:f06f  5f b2 06 5d   eor $5d06b2,x
$18:f073  b4 06		 ldy $06,x
$18:f075  5f b7 06 5b   eor $5b06b7,x
$18:f079  b5 06		 lda $06,x
$18:f07b  5f b4 06 5d   eor $5d06b4,x
$18:f07f  b2 06		 lda ($06)
$18:f081  5f ad 06 5b   eor $5b06ad,x
$18:f085  a9 06		 lda #$06
$18:f087  5f ab 06 5d   eor $5d06ab,x
$18:f08b  a9 06		 lda #$06
$18:f08d  5f a8 06 5b   eor $5b06a8,x
$18:f091  a6 06		 ldx $06
$18:f093  5f a8 06 5d   eor $5d06a8,x
$18:f097  a9 06		 lda #$06
$18:f099  5f ab 06 5b   eor $5b06ab,x
$18:f09d  ad 06 5f	  lda $5f06
$18:f0a0  ae 06 5d	  ldx $5d06
$18:f0a3  ad 06 5f	  lda $5f06
$18:f0a6  b1 06		 lda ($06),y
$18:f0a8  5b			tcd
$18:f0a9  ad 06 5f	  lda $5f06
$18:f0ac  b2 06		 lda ($06)
$18:f0ae  5d ad 06	  eor $06ad,x
$18:f0b1  5f b4 06 5b   eor $5b06b4,x
$18:f0b5  ad 06 5f	  lda $5f06
$18:f0b8  b5 06		 lda $06,x
$18:f0ba  5d b7 06	  eor $06b7,x
$18:f0bd  5f b5 06 5b   eor $5b06b5,x
$18:f0c1  b4 06		 ldy $06,x
$18:f0c3  5f b7 06 5d   eor $5d06b7,x
$18:f0c7  b5 06		 lda $06,x
$18:f0c9  5f b4 06 5b   eor $5b06b4,x
$18:f0cd  b5 06		 lda $06,x
$18:f0cf  5f b7 06 5d   eor $5d06b7,x
$18:f0d3  b5 06		 lda $06,x
$18:f0d5  5f b4 06 5b   eor $5b06b4,x
$18:f0d9  b2 06		 lda ($06)
$18:f0db  5f b5 06 5d   eor $5d06b5,x
$18:f0df  b4 06		 ldy $06,x
$18:f0e1  5f b2 06 5b   eor $5b06b2,x
$18:f0e5  b4 06		 ldy $06,x
$18:f0e7  5f b5 06 5d   eor $5d06b5,x
$18:f0eb  b4 06		 ldy $06,x
$18:f0ed  5f b2 06 5b   eor $5b06b2,x
$18:f0f1  b1 06		 lda ($06),y
$18:f0f3  5f b4 06 5d   eor $5d06b4,x
$18:f0f7  b2 06		 lda ($06)
$18:f0f9  5f b1 06 5b   eor $5b06b1,x
$18:f0fd  b2 06		 lda ($06)
$18:f0ff  5f b4 06 5d   eor $5d06b4,x
$18:f103  b2 06		 lda ($06)
$18:f105  5f b1 06 5b   eor $5b06b1,x
$18:f109  b2 06		 lda ($06)
$18:f10b  5f b4 06 5d   eor $5d06b4,x
$18:f10f  b2 06		 lda ($06)
$18:f111  5f ad 04 5b   eor $5b04ad,x
$18:f115  a9 00		 lda #$00
$18:f117  e1 0c		 sbc ($0c,x)
$18:f119  06 7f		 asl $7f
$18:f11b  9a			txs
$18:f11c  9c 9d 9a	  stz $9a9d
$18:f11f  9c 9d 9a	  stz $9a9d
$18:f122  9c 9a 9c	  stz $9c9a
$18:f125  9d 9a 9c	  sta $9c9a,x
$18:f128  9d 9a 9c	  sta $9c9a,x
$18:f12b  9a			txs
$18:f12c  9c 9d 9a	  stz $9a9d
$18:f12f  9c 9d 9a	  stz $9a9d
$18:f132  9c 9a 9c	  stz $9c9a
$18:f135  9d 9a 9c	  sta $9c9a,x
$18:f138  9d 9f a1	  sta $a19f,x
$18:f13b  9a			txs
$18:f13c  9c 9d 9a	  stz $9a9d
$18:f13f  9c 9d 9a	  stz $9a9d
$18:f142  9c 9a 9c	  stz $9c9a
$18:f145  9d 9a 9c	  sta $9c9a,x
$18:f148  9d 9a 9c	  sta $9c9a,x
$18:f14b  9a			txs
$18:f14c  9c 9d 9a	  stz $9a9d
$18:f14f  9c 9d 9a	  stz $9a9d
$18:f152  9c 9a 9c	  stz $9c9a
$18:f155  9d 9a 9c	  sta $9c9a,x
$18:f158  9d 9f a1	  sta $a19f,x
$18:f15b  9a			txs
$18:f15c  9c 9d 9a	  stz $9a9d
$18:f15f  9c 9d 9a	  stz $9a9d
$18:f162  9c 9a 9c	  stz $9c9a
$18:f165  9d 9a 9c	  sta $9c9a,x
$18:f168  9d 9a 9c	  sta $9c9a,x
$18:f16b  9a			txs
$18:f16c  9c 9d 9a	  stz $9a9d
$18:f16f  9c 9d 9a	  stz $9a9d
$18:f172  9c 9a 9c	  stz $9c9a
$18:f175  9d 9a 9c	  sta $9c9a,x
$18:f178  9d 9f a1	  sta $a19f,x
$18:f17b  9c 9d 9f	  stz $9f9d
$18:f17e  9c 9d 9f	  stz $9f9d
$18:f181  9c 9d 9c	  stz $9c9d
$18:f184  9d 9f 9c	  sta $9c9f,x
$18:f187  9d 9f 9c	  sta $9c9f,x
$18:f18a  9d 9c 9d	  sta $9d9c,x
$18:f18d  9f 9c 9d 9f   sta $9f9d9c,x
$18:f191  9c 9d 9c	  stz $9c9d
$18:f194  9d 9f 9c	  sta $9c9f,x
$18:f197  9d 9f a1	  sta $a19f,x
$18:f19a  a2 9a		 ldx #$9a
$18:f19c  9c 9d 9a	  stz $9a9d
$18:f19f  9c 9d 9a	  stz $9a9d
$18:f1a2  9c 9a 9c	  stz $9c9a
$18:f1a5  9d 9a 9c	  sta $9c9a,x
$18:f1a8  9d 9a 9c	  sta $9c9a,x
$18:f1ab  9a			txs
$18:f1ac  9c 9d 9a	  stz $9a9d
$18:f1af  9c 9d 9a	  stz $9a9d
$18:f1b2  9c 9a 9c	  stz $9c9a
$18:f1b5  9d 9a 9c	  sta $9c9a,x
$18:f1b8  9d 9f a1	  sta $a19f,x
$18:f1bb  9a			txs
$18:f1bc  9c 9d 9a	  stz $9a9d
$18:f1bf  9c 9d 9a	  stz $9a9d
$18:f1c2  9c 9a 9c	  stz $9c9a
$18:f1c5  9d 9a 9c	  sta $9c9a,x
$18:f1c8  9d 9a 9c	  sta $9c9a,x
$18:f1cb  9a			txs
$18:f1cc  9c 9d 9a	  stz $9a9d
$18:f1cf  9c 9d 9a	  stz $9a9d
$18:f1d2  9c 9a 9c	  stz $9c9a
$18:f1d5  9d 9a 9c	  sta $9c9a,x
$18:f1d8  9d 9f a1	  sta $a19f,x
$18:f1db  9a			txs
$18:f1dc  9c 9d 9a	  stz $9a9d
$18:f1df  9c 9d 9a	  stz $9a9d
$18:f1e2  9c 9a 9c	  stz $9c9a
$18:f1e5  9d 9a 9c	  sta $9c9a,x
$18:f1e8  9d 9a 9c	  sta $9c9a,x
$18:f1eb  9a			txs
$18:f1ec  9c 9d 9a	  stz $9a9d
$18:f1ef  9c 9d 9a	  stz $9a9d
$18:f1f2  9c 9a 9c	  stz $9c9a
$18:f1f5  9d 9a 9c	  sta $9c9a,x
$18:f1f8  9d 9f a1	  sta $a19f,x
$18:f1fb  9a			txs
$18:f1fc  9c 9d 9a	  stz $9a9d
$18:f1ff  9c 9d 9a	  stz $9a9d
$18:f202  9c 9a 9c	  stz $9c9a
$18:f205  9d 9a 9c	  sta $9c9a,x
$18:f208  9d 9a 9c	  sta $9c9a,x
$18:f20b  9a			txs
$18:f20c  9c 9d 9a	  stz $9a9d
$18:f20f  9c 9d 9a	  stz $9a9d
$18:f212  9c 9a 9c	  stz $9c9a
$18:f215  9d 9a 9c	  sta $9c9a,x
$18:f218  9d 9f a1	  sta $a19f,x
$18:f21b  00 04		 brk #$04
$18:f21d  c9 60		 cmp #$60
$18:f21f  7f a6 04 6f   adc $6f04a6,x
$18:f223  a6 14		 ldx $14
$18:f225  7f a1 30 c8   adc $c830a1,x
$18:f229  0f a1 05 9d   ora $9d05a1
$18:f22d  04 9c		 tsb $9c
$18:f22f  04 6f		 tsb $6f
$18:f231  9f 04 5d 9d   sta $9d5d04,x
$18:f235  04 5b		 tsb $5b
$18:f237  9c 04 6f	  stz $6f04
$18:f23a  9d 04 5d	  sta $5d04,x
$18:f23d  9c 04 5b	  stz $5b04
$18:f240  9a			txs
$18:f241  48			pha
$18:f242  7f 9a 36 c8   adc $c8369a,x
$18:f246  06 6f		 asl $6f
$18:f248  9c 06 5f	  stz $5f06
$18:f24b  9d 9f 06	  sta $069f,x
$18:f24e  7f a1 06 5d   adc $5d06a1,x
$18:f252  a3 06		 lda $06,s
$18:f254  5f a5 06 5b   eor $5b06a5,x
$18:f258  a6 30		 ldx $30
$18:f25a  7f a6 20 ad   adc $ad20a6,x
$18:f25e  08			php
$18:f25f  7d b2 08	  adc $08b2,x
$18:f262  7b			tdc
$18:f263  b4 50		 ldy $50,x
$18:f265  77 b5		 adc [$b5],y
$18:f267  08			php
$18:f268  7d b2 08	  adc $08b2,x
$18:f26b  79 ad 60	  adc $60ad,y
$18:f26e  7f ab 30 c8   adc $c830ab,x
$18:f272  24 4b		 bit $4b
$18:f274  ad 0c c9	  lda $c90c
$18:f277  05 6f		 ora $6f
$18:f279  ad 1f 7f	  lda $7f1f
$18:f27c  a6 06		 ldx $06
$18:f27e  a9 06		 lda #$06
$18:f280  7b			tdc
$18:f281  ab			plb
$18:f282  06 7f		 asl $7f
$18:f284  ad 06 7d	  lda $7d06
$18:f287  ab			plb
$18:f288  06 7f		 asl $7f
$18:f28a  a9 06		 lda #$06
$18:f28c  7b			tdc
$18:f28d  a8			tay
$18:f28e  0c 7f a9	  tsb $a97f
$18:f291  0c 7d ab	  tsb $ab7d
$18:f294  06 5f		 asl $5f
$18:f296  ad 06 5d	  lda $5d06
$18:f299  a6 06		 ldx $06
$18:f29b  5f a5 06 5b   eor $5b06a5,x
$18:f29f  a6 06		 ldx $06
$18:f2a1  5f a8 06 5d   eor $5d06a8,x
$18:f2a5  a9 06		 lda #$06
$18:f2a7  5f ab 06 5b   eor $5b06ab,x
$18:f2ab  ad 06 5f	  lda $5f06
$18:f2ae  ae 06 5d	  ldx $5d06
$18:f2b1  ad 06 5f	  lda $5f06
$18:f2b4  ab			plb
$18:f2b5  06 5b		 asl $5b
$18:f2b7  a9 06		 lda #$06
$18:f2b9  5f a8 06 5d   eor $5d06a8,x
$18:f2bd  a9 06		 lda #$06
$18:f2bf  5f ab 06 5b   eor $5b06ab,x
$18:f2c3  ad 06 5f	  lda $5f06
$18:f2c6  ad 06 5d	  lda $5d06
$18:f2c9  ab			plb
$18:f2ca  06 5f		 asl $5f
$18:f2cc  ab			plb
$18:f2cd  06 5b		 asl $5b
$18:f2cf  a9 06		 lda #$06
$18:f2d1  5f a9 06 5d   eor $5d06a9,x
$18:f2d5  a8			tay
$18:f2d6  06 5f		 asl $5f
$18:f2d8  a9 06		 lda #$06
$18:f2da  5b			tcd
$18:f2db  ab			plb
$18:f2dc  06 5f		 asl $5f
$18:f2de  ad 06 5d	  lda $5d06
$18:f2e1  ab			plb
$18:f2e2  06 5f		 asl $5f
$18:f2e4  ab			plb
$18:f2e5  06 5b		 asl $5b
$18:f2e7  a9 06		 lda #$06
$18:f2e9  5f a9 06 5d   eor $5d06a9,x
$18:f2ed  a8			tay
$18:f2ee  06 5f		 asl $5f
$18:f2f0  a9 06		 lda #$06
$18:f2f2  5b			tcd
$18:f2f3  ab			plb
$18:f2f4  06 5f		 asl $5f
$18:f2f6  ad 06 5d	  lda $5d06
$18:f2f9  ab			plb
$18:f2fa  06 5f		 asl $5f
$18:f2fc  ae 06 5b	  ldx $5b06
$18:f2ff  ad 06 5f	  lda $5f06
$18:f302  ab			plb
$18:f303  06 5d		 asl $5d
$18:f305  a9 06		 lda #$06
$18:f307  5f a8 06 5b   eor $5b06a8,x
$18:f30b  a9 06		 lda #$06
$18:f30d  5f ab 06 5d   eor $5d06ab,x
$18:f311  a9 06		 lda #$06
$18:f313  5f ad 06 5b   eor $5b06ad,x
$18:f317  ab			plb
$18:f318  06 5f		 asl $5f
$18:f31a  a9 06		 lda #$06
$18:f31c  5d a8 06	  eor $06a8,x
$18:f31f  5f a6 06 5b   eor $5b06a6,x
$18:f323  a8			tay
$18:f324  06 5f		 asl $5f
$18:f326  ab			plb
$18:f327  06 5d		 asl $5d
$18:f329  a9 06		 lda #$06
$18:f32b  5f a8 06 5b   eor $5b06a8,x
$18:f32f  a9 06		 lda #$06
$18:f331  5f ab 06 5d   eor $5d06ab,x
$18:f335  ad 06 5f	  lda $5f06
$18:f338  ae 06 5b	  ldx $5b06
$18:f33b  b1 06		 lda ($06),y
$18:f33d  5f b2 06 5d   eor $5d06b2,x
$18:f341  b4 06		 ldy $06,x
$18:f343  5f b7 06 5b   eor $5b06b7,x
$18:f347  b5 06		 lda $06,x
$18:f349  5f b4 06 5d   eor $5d06b4,x
$18:f34d  b2 06		 lda ($06)
$18:f34f  5f ad 06 5b   eor $5b06ad,x
$18:f353  a9 06		 lda #$06
$18:f355  5f ab 06 5d   eor $5d06ab,x
$18:f359  a9 06		 lda #$06
$18:f35b  5f a8 06 5b   eor $5b06a8,x
$18:f35f  a6 06		 ldx $06
$18:f361  5f a8 06 5d   eor $5d06a8,x
$18:f365  a9 06		 lda #$06
$18:f367  5f ab 06 5b   eor $5b06ab,x
$18:f36b  ad 06 5f	  lda $5f06
$18:f36e  ae 06 5d	  ldx $5d06
$18:f371  ad 06 5f	  lda $5f06
$18:f374  b1 06		 lda ($06),y
$18:f376  5b			tcd
$18:f377  ad 06 5f	  lda $5f06
$18:f37a  b2 06		 lda ($06)
$18:f37c  5d ad 06	  eor $06ad,x
$18:f37f  5f b4 06 5b   eor $5b06b4,x
$18:f383  ad 06 5f	  lda $5f06
$18:f386  b5 06		 lda $06,x
$18:f388  5d b7 06	  eor $06b7,x
$18:f38b  5f b5 06 5b   eor $5b06b5,x
$18:f38f  b4 06		 ldy $06,x
$18:f391  5f b7 06 5d   eor $5d06b7,x
$18:f395  b5 06		 lda $06,x
$18:f397  5f b4 06 5b   eor $5b06b4,x
$18:f39b  b5 06		 lda $06,x
$18:f39d  5f b7 06 5d   eor $5d06b7,x
$18:f3a1  b5 06		 lda $06,x
$18:f3a3  5f b4 06 5b   eor $5b06b4,x
$18:f3a7  b2 06		 lda ($06)
$18:f3a9  5f b5 06 5d   eor $5d06b5,x
$18:f3ad  b4 06		 ldy $06,x
$18:f3af  5f b2 06 5b   eor $5b06b2,x
$18:f3b3  b4 06		 ldy $06,x
$18:f3b5  5f b5 06 5d   eor $5d06b5,x
$18:f3b9  b4 06		 ldy $06,x
$18:f3bb  5f b2 06 5b   eor $5b06b2,x
$18:f3bf  b1 06		 lda ($06),y
$18:f3c1  5f b4 06 5d   eor $5d06b4,x
$18:f3c5  b2 06		 lda ($06)
$18:f3c7  5f b1 06 5b   eor $5b06b1,x
$18:f3cb  b2 06		 lda ($06)
$18:f3cd  5f b4 06 5d   eor $5d06b4,x
$18:f3d1  b2 06		 lda ($06)
$18:f3d3  5f b1 06 5b   eor $5b06b1,x
$18:f3d7  b2 06		 lda ($06)
$18:f3d9  5f b4 06 5d   eor $5d06b4,x
$18:f3dd  b2 06		 lda ($06)
$18:f3df  5f ad 02 5b   eor $5b02ad,x
$18:f3e3  a9 00		 lda #$00
$18:f3e5  00 04		 brk #$04
$18:f3e7  00 34		 brk #$34
$18:f3e9  2c 53 73	  bit $7353
$18:f3ec  89 73		 bit #$73
$18:f3ee  02 00		 cop #$00
$18:f3f0  fd 0f a4	  sbc $a40f,x
$18:f3f3  73 00		 adc ($00,s),y
$18:f3f5  00 01		 brk #$01
$18:f3f7  20 2a 00	  jsr $002a
$18:f3fa  4e 2e 0d	  lsr $0d2e
$18:f3fd  ff e0 b8 01   sbc $01b8e0,x
$18:f401  80 0e		 bra $f411
$18:f403  ff ef b8 0e   sbc $0eb8ef,x
$18:f407  00 0f		 brk #$0f
$18:f409  ff e0 b8 07   sbc $07b8e0,x
$18:f40d  00 10		 brk #$10
$18:f40f  ff e0 b8 00   sbc $00b8e0,x
$18:f413  f0 11		 beq $f426
$18:f415  ff e0 b8 03   sbc $03b8e0,x
$18:f419  00 12		 brk #$12
$18:f41b  ff e0 b8 06   sbc $06b8e0,x
$18:f41f  15 13		 ora $13,x
$18:f421  ff e0 b8 07   sbc $07b8e0,x
$18:f425  a8			tay
$18:f426  18			clc
$18:f427  00 00		 brk #$00
$18:f429  2f 32 65 7f   and $7f6532
$18:f42d  98			tya
$18:f42e  b2 cb		 lda ($cb)
$18:f430  e5 fc		 sbc $fc
$18:f432  19 32 4c	  ora $4c32,y
$18:f435  65 72		 adc $72
$18:f437  7f 8c 98 a5   adc $a5988c,x
$18:f43b  b2 bf		 lda ($bf)
$18:f43d  cb			wai
$18:f43e  d8			cld
$18:f43f  e5 f2		 sbc $f2
$18:f441  fc 6a 0a	  jsr ($0a6a,x)
$18:f444  00 10		 brk #$10
$18:f446  02 10		 cop #$10
$18:f448  0a			asl a
$18:f449  10 ff		 bpl $f44a
$18:f44b  00 02		 brk #$02
$18:f44d  10 00		 bpl $f44f
$18:f44f  00 1a		 brk #$1a
$18:f451  10 0a		 bpl $f45d
$18:f453  11 b9		 ora ($b9),y
$18:f455  12 a6		 ora ($a6)
$18:f457  14 97		 trb $97
$18:f459  15 88		 ora $88,x
$18:f45b  16 de		 asl $de,x
$18:f45d  17 bd		 ora [$bd],y
$18:f45f  18			clc
$18:f460  fa			plx
$18:f461  05 ea		 ora $ea
$18:f463  00 e0		 brk #$e0
$18:f465  00 e7		 brk #$e7
$18:f467  18			clc
$18:f468  ed 87 e5	  sbc $e587
$18:f46b  fa			plx
$18:f46c  e1 0a		 sbc ($0a,x)
$18:f46e  f5 80		 sbc $80,x
$18:f470  7f 7f f7 03   adc $03f77f,x
$18:f474  aa			tax
$18:f475  00 e3		 brk #$e3
$18:f477  30 46		 bmi $f4bf
$18:f479  40			rti
$18:f47a  60			rts
$18:f47b  c9 c9		 cmp #$c9
$18:f47d  c9 c9		 cmp #$c9
$18:f47f  c9 c9		 cmp #$c9
$18:f481  c9 c9		 cmp #$c9
$18:f483  30 5d		 bmi $f4e2
$18:f485  ae 0c c8	  ldx $c80c
$18:f488  06 ad		 asl $ad
$18:f48a  a9 ab		 lda #$ab
$18:f48c  ae ad a9	  ldx $a9ad
$18:f48f  ab			plb
$18:f490  ae ad a9	  ldx $a9ad
$18:f493  48			pha
$18:f494  78			sei
$18:f495  c8			iny
$18:f496  30 5d		 bmi $f4f5
$18:f498  ae 0c c8	  ldx $c80c
$18:f49b  06 ad		 asl $ad
$18:f49d  a9 ab		 lda #$ab
$18:f49f  ae ad a9	  ldx $a9ad
$18:f4a2  ab			plb
$18:f4a3  ae ad a9	  ldx $a9ad
$18:f4a6  48			pha
$18:f4a7  78			sei
$18:f4a8  c8			iny
$18:f4a9  ea			nop
$18:f4aa  0c 30 5d	  tsb $5d30
$18:f4ad  ae 0c c8	  ldx $c80c
$18:f4b0  06 ad		 asl $ad
$18:f4b2  a9 ab		 lda #$ab
$18:f4b4  ae ad a9	  ldx $a9ad
$18:f4b7  ab			plb
$18:f4b8  ae ad a9	  ldx $a9ad
$18:f4bb  48			pha
$18:f4bc  78			sei
$18:f4bd  c8			iny
$18:f4be  30 5d		 bmi $f51d
$18:f4c0  ae 0c c8	  ldx $c80c
$18:f4c3  06 ad		 asl $ad
$18:f4c5  a9 ab		 lda #$ab
$18:f4c7  ae ad a9	  ldx $a9ad
$18:f4ca  ab			plb
$18:f4cb  ae ad a9	  ldx $a9ad
$18:f4ce  48			pha
$18:f4cf  78			sei
$18:f4d0  c8			iny
$18:f4d1  ea			nop
$18:f4d2  00 60		 brk #$60
$18:f4d4  c9 c9		 cmp #$c9
$18:f4d6  c9 c9		 cmp #$c9
$18:f4d8  0c 5d ab	  tsb $ab5d
$18:f4db  b5 b7		 lda $b7,x
$18:f4dd  ab			plb
$18:f4de  12 b5		 ora ($b5)
$18:f4e0  b7 0c		 lda [$0c],y
$18:f4e2  ab			plb
$18:f4e3  06 c8		 asl $c8
$18:f4e5  12 b5		 ora ($b5)
$18:f4e7  0c b7 ab	  tsb $abb7
$18:f4ea  12 b5		 ora ($b5)
$18:f4ec  b7 0c		 lda [$0c],y
$18:f4ee  ab			plb
$18:f4ef  ab			plb
$18:f4f0  b5 b7		 lda $b7,x
$18:f4f2  ab			plb
$18:f4f3  12 b5		 ora ($b5)
$18:f4f5  b7 0c		 lda [$0c],y
$18:f4f7  ab			plb
$18:f4f8  06 c8		 asl $c8
$18:f4fa  12 b5		 ora ($b5)
$18:f4fc  0c b7 ab	  tsb $abb7
$18:f4ff  12 b5		 ora ($b5)
$18:f501  b7 0c		 lda [$0c],y
$18:f503  c9 ed		 cmp #$ed
$18:f505  96 e0		 stx $e0,y
$18:f507  04 30		 tsb $30
$18:f509  ae 0c 6d	  ldx $6d0c
$18:f50c  c8			iny
$18:f50d  0c 5d ab	  tsb $ab5d
$18:f510  b0 ae		 bcs $f4c0
$18:f512  b2 b0		 lda ($b0)
$18:f514  b5 3c		 lda $3c,x
$18:f516  b2 30		 lda ($30)
$18:f518  b7 0c		 lda [$0c],y
$18:f51a  6d c8 0c	  adc $0cc8
$18:f51d  5d b2 ba	  eor $bab2,x
$18:f520  b7 0c		 lda [$0c],y
$18:f522  5b			tcd
$18:f523  be ba 0c	  ldx $0cba,y
$18:f526  59 c3 3c	  eor $3cc3,y
$18:f529  57 be		 eor [$be],y
$18:f52b  30 5d		 bmi $f58a
$18:f52d  ae 0c 6d	  ldx $6d0c
$18:f530  c8			iny
$18:f531  0c 5d ab	  tsb $ab5d
$18:f534  b0 ae		 bcs $f4e4
$18:f536  b2 b0		 lda ($b0)
$18:f538  b5 3c		 lda $3c,x
$18:f53a  b2 30		 lda ($30)
$18:f53c  b7 0c		 lda [$0c],y
$18:f53e  6d c8 0c	  adc $0cc8
$18:f541  5d b2 ba	  eor $bab2,x
$18:f544  b7 0c		 lda [$0c],y
$18:f546  5b			tcd
$18:f547  be ba 0c	  ldx $0cba,y
$18:f54a  59 c3 3c	  eor $3cc3,y
$18:f54d  57 b7		 eor [$b7],y
$18:f54f  00 ea		 brk #$ea
$18:f551  e8			inx
$18:f552  e0 02		 cpx #$02
$18:f554  ed 6e e1	  sbc $e16e
$18:f557  0a			asl a
$18:f558  e3 01		 sbc $01,s
$18:f55a  05 05		 ora $05
$18:f55c  60			rts
$18:f55d  c9 c9		 cmp #$c9
$18:f55f  c9 c9		 cmp #$c9
$18:f561  0c c9 06	  tsb $06c9
$18:f564  5d ae 06	  eor $06ae,x
$18:f567  5b			tcd
$18:f568  a9 0c		 lda #$0c
$18:f56a  c9 06		 cmp #$06
$18:f56c  5d b0 06	  eor $06b0,x
$18:f56f  59 ab 30	  eor $30ab,y
$18:f572  c9 0c		 cmp #$0c
$18:f574  c9 06		 cmp #$06
$18:f576  5d ae 06	  eor $06ae,x
$18:f579  5b			tcd
$18:f57a  a9 06		 lda #$06
$18:f57c  5d b0 06	  eor $06b0,x
$18:f57f  59 ab 3c	  eor $3cab,y
$18:f582  c9 0c		 cmp #$0c
$18:f584  c9 06		 cmp #$06
$18:f586  5d ae 06	  eor $06ae,x
$18:f589  5b			tcd
$18:f58a  a9 0c		 lda #$0c
$18:f58c  c9 06		 cmp #$06
$18:f58e  5d b0 06	  eor $06b0,x
$18:f591  59 ab 30	  eor $30ab,y
$18:f594  c9 0c		 cmp #$0c
$18:f596  c9 06		 cmp #$06
$18:f598  5d ae 06	  eor $06ae,x
$18:f59b  5b			tcd
$18:f59c  a9 06		 lda #$06
$18:f59e  5d b0 06	  eor $06b0,x
$18:f5a1  59 ab 3c	  eor $3cab,y
$18:f5a4  c9 0c		 cmp #$0c
$18:f5a6  c9 06		 cmp #$06
$18:f5a8  5d ae 06	  eor $06ae,x
$18:f5ab  5b			tcd
$18:f5ac  a9 0c		 lda #$0c
$18:f5ae  c9 06		 cmp #$06
$18:f5b0  5d b0 06	  eor $06b0,x
$18:f5b3  59 ab 30	  eor $30ab,y
$18:f5b6  c9 0c		 cmp #$0c
$18:f5b8  c9 06		 cmp #$06
$18:f5ba  5d ae 06	  eor $06ae,x
$18:f5bd  5b			tcd
$18:f5be  a9 06		 lda #$06
$18:f5c0  5d b0 06	  eor $06b0,x
$18:f5c3  59 ab 3c	  eor $3cab,y
$18:f5c6  c9 0c		 cmp #$0c
$18:f5c8  c9 06		 cmp #$06
$18:f5ca  5d ae 06	  eor $06ae,x
$18:f5cd  5b			tcd
$18:f5ce  a9 0c		 lda #$0c
$18:f5d0  c9 06		 cmp #$06
$18:f5d2  5d b0 06	  eor $06b0,x
$18:f5d5  59 ab 30	  eor $30ab,y
$18:f5d8  c9 0c		 cmp #$0c
$18:f5da  c9 06		 cmp #$06
$18:f5dc  5d ae 06	  eor $06ae,x
$18:f5df  5b			tcd
$18:f5e0  a9 06		 lda #$06
$18:f5e2  5d b0 06	  eor $06b0,x
$18:f5e5  59 ab 3c	  eor $3cab,y
$18:f5e8  c9 0c		 cmp #$0c
$18:f5ea  c9 06		 cmp #$06
$18:f5ec  5d ae 06	  eor $06ae,x
$18:f5ef  5b			tcd
$18:f5f0  a9 0c		 lda #$0c
$18:f5f2  c9 06		 cmp #$06
$18:f5f4  5d b0 06	  eor $06b0,x
$18:f5f7  59 ab 30	  eor $30ab,y
$18:f5fa  c9 0c		 cmp #$0c
$18:f5fc  c9 06		 cmp #$06
$18:f5fe  5d ae 06	  eor $06ae,x
$18:f601  5b			tcd
$18:f602  a9 06		 lda #$06
$18:f604  5d b0 06	  eor $06b0,x
$18:f607  59 ab 3c	  eor $3cab,y
$18:f60a  c9 0c		 cmp #$0c
$18:f60c  c9 06		 cmp #$06
$18:f60e  5d ae 06	  eor $06ae,x
$18:f611  5b			tcd
$18:f612  a9 0c		 lda #$0c
$18:f614  c9 06		 cmp #$06
$18:f616  5d b0 06	  eor $06b0,x
$18:f619  59 ab 30	  eor $30ab,y
$18:f61c  c9 0c		 cmp #$0c
$18:f61e  c9 06		 cmp #$06
$18:f620  5d ae 06	  eor $06ae,x
$18:f623  5b			tcd
$18:f624  a9 06		 lda #$06
$18:f626  5d b0 06	  eor $06b0,x
$18:f629  59 ab 3c	  eor $3cab,y
$18:f62c  c9 60		 cmp #$60
$18:f62e  c9 c9		 cmp #$c9
$18:f630  c9 c9		 cmp #$c9
$18:f632  0c c9 06	  tsb $06c9
$18:f635  5d ae 06	  eor $06ae,x
$18:f638  5b			tcd
$18:f639  a9 0c		 lda #$0c
$18:f63b  c9 06		 cmp #$06
$18:f63d  5d b0 06	  eor $06b0,x
$18:f640  59 ab 30	  eor $30ab,y
$18:f643  c9 0c		 cmp #$0c
$18:f645  c9 06		 cmp #$06
$18:f647  5d ae 06	  eor $06ae,x
$18:f64a  5b			tcd
$18:f64b  a9 06		 lda #$06
$18:f64d  5d b0 06	  eor $06b0,x
$18:f650  59 ab 3c	  eor $3cab,y
$18:f653  c9 0c		 cmp #$0c
$18:f655  c9 06		 cmp #$06
$18:f657  5d ae 06	  eor $06ae,x
$18:f65a  5b			tcd
$18:f65b  a9 0c		 lda #$0c
$18:f65d  c9 06		 cmp #$06
$18:f65f  5d b0 06	  eor $06b0,x
$18:f662  59 ab 30	  eor $30ab,y
$18:f665  c9 0c		 cmp #$0c
$18:f667  c9 06		 cmp #$06
$18:f669  5d ae 06	  eor $06ae,x
$18:f66c  5b			tcd
$18:f66d  a9 06		 lda #$06
$18:f66f  5d b0 06	  eor $06b0,x
$18:f672  59 ab 3c	  eor $3cab,y
$18:f675  c9 0c		 cmp #$0c
$18:f677  c9 06		 cmp #$06
$18:f679  5d ae 06	  eor $06ae,x
$18:f67c  5b			tcd
$18:f67d  a9 0c		 lda #$0c
$18:f67f  c9 06		 cmp #$06
$18:f681  5d b0 06	  eor $06b0,x
$18:f684  59 ab 30	  eor $30ab,y
$18:f687  c9 0c		 cmp #$0c
$18:f689  c9 06		 cmp #$06
$18:f68b  5d ae 06	  eor $06ae,x
$18:f68e  5b			tcd
$18:f68f  a9 06		 lda #$06
$18:f691  5d b0 06	  eor $06b0,x
$18:f694  59 ab 3c	  eor $3cab,y
$18:f697  c9 0c		 cmp #$0c
$18:f699  c9 06		 cmp #$06
$18:f69b  5d ae 06	  eor $06ae,x
$18:f69e  5b			tcd
$18:f69f  a9 0c		 lda #$0c
$18:f6a1  c9 06		 cmp #$06
$18:f6a3  5d b0 06	  eor $06b0,x
$18:f6a6  59 ab 30	  eor $30ab,y
$18:f6a9  c9 0c		 cmp #$0c
$18:f6ab  c9 06		 cmp #$06
$18:f6ad  5d ae 06	  eor $06ae,x
$18:f6b0  5b			tcd
$18:f6b1  a9 06		 lda #$06
$18:f6b3  5d b0 06	  eor $06b0,x
$18:f6b6  59 ab 3c	  eor $3cab,y
$18:f6b9  c9 0c		 cmp #$0c
$18:f6bb  c9 06		 cmp #$06
$18:f6bd  5d ae 06	  eor $06ae,x
$18:f6c0  5b			tcd
$18:f6c1  a9 0c		 lda #$0c
$18:f6c3  c9 06		 cmp #$06
$18:f6c5  5d b0 06	  eor $06b0,x
$18:f6c8  59 ab 30	  eor $30ab,y
$18:f6cb  c9 0c		 cmp #$0c
$18:f6cd  c9 06		 cmp #$06
$18:f6cf  5d ae 06	  eor $06ae,x
$18:f6d2  5b			tcd
$18:f6d3  a9 06		 lda #$06
$18:f6d5  5d b0 06	  eor $06b0,x
$18:f6d8  59 ab 3c	  eor $3cab,y
$18:f6db  c9 0c		 cmp #$0c
$18:f6dd  c9 06		 cmp #$06
$18:f6df  5d ae 06	  eor $06ae,x
$18:f6e2  5b			tcd
$18:f6e3  a9 0c		 lda #$0c
$18:f6e5  c9 06		 cmp #$06
$18:f6e7  5d b0 06	  eor $06b0,x
$18:f6ea  59 ab 30	  eor $30ab,y
$18:f6ed  c9 0c		 cmp #$0c
$18:f6ef  c9 06		 cmp #$06
$18:f6f1  5d ae 06	  eor $06ae,x
$18:f6f4  5b			tcd
$18:f6f5  a9 06		 lda #$06
$18:f6f7  5d b0 06	  eor $06b0,x
$18:f6fa  59 ab 3c	  eor $3cab,y
$18:f6fd  c9 00		 cmp #$00
$18:f6ff  ea			nop
$18:f700  f4 e0 01	  pea $01e0
$18:f703  ed a5 e1	  sbc $e1a5
$18:f706  0a			asl a
$18:f707  e3 18		 sbc $18,s
$18:f709  46 7f		 lsr $7f
$18:f70b  0c 5e 93	  tsb $935e
$18:f70e  0c 5d 9d	  tsb $9d5d
$18:f711  9f 93 12 9d   sta $9d1293,x
$18:f715  9f 0c 5e 93   sta $935e0c,x
$18:f719  06 c8		 asl $c8
$18:f71b  12 5d		 ora ($5d)
$18:f71d  9d 0c 9f	  sta $9f0c,x
$18:f720  93 12		 sta ($12,s),y
$18:f722  5e 9d 12	  lsr $129d,x
$18:f725  5d 9f 0c	  eor $0c9f,x
$18:f728  93 0c		 sta ($0c,s),y
$18:f72a  5e 93 0c	  lsr $0c93,x
$18:f72d  5d 9d 9f	  eor $9f9d,x
$18:f730  93 12		 sta ($12,s),y
$18:f732  9d 9f 0c	  sta $0c9f,x
$18:f735  5e 93 06	  lsr $0693,x
$18:f738  c8			iny
$18:f739  12 5d		 ora ($5d)
$18:f73b  9d 0c 9f	  sta $9f0c,x
$18:f73e  93 12		 sta ($12,s),y
$18:f740  5e 9d 12	  lsr $129d,x
$18:f743  5d 9f 0c	  eor $0c9f,x
$18:f746  93 0c		 sta ($0c,s),y
$18:f748  5e 93 0c	  lsr $0c93,x
$18:f74b  5d 9d 9f	  eor $9f9d,x
$18:f74e  93 12		 sta ($12,s),y
$18:f750  9d 9f 0c	  sta $0c9f,x
$18:f753  5e 93 06	  lsr $0693,x
$18:f756  c8			iny
$18:f757  12 5d		 ora ($5d)
$18:f759  9d 0c 9f	  sta $9f0c,x
$18:f75c  93 12		 sta ($12,s),y
$18:f75e  5e 9d 12	  lsr $129d,x
$18:f761  5d 9f 0c	  eor $0c9f,x
$18:f764  93 0c		 sta ($0c,s),y
$18:f766  5e 93 0c	  lsr $0c93,x
$18:f769  5d 9d 9f	  eor $9f9d,x
$18:f76c  93 12		 sta ($12,s),y
$18:f76e  9d 9f 0c	  sta $0c9f,x
$18:f771  5e 93 06	  lsr $0693,x
$18:f774  c8			iny
$18:f775  12 5d		 ora ($5d)
$18:f777  9d 0c 9f	  sta $9f0c,x
$18:f77a  93 12		 sta ($12,s),y
$18:f77c  5e 9d 12	  lsr $129d,x
$18:f77f  5d 9f 0c	  eor $0c9f,x
$18:f782  93 0c		 sta ($0c,s),y
$18:f784  5e 93 0c	  lsr $0c93,x
$18:f787  5d 9d 9f	  eor $9f9d,x
$18:f78a  93 12		 sta ($12,s),y
$18:f78c  9d 9f 0c	  sta $0c9f,x
$18:f78f  5e 93 06	  lsr $0693,x
$18:f792  c8			iny
$18:f793  12 5d		 ora ($5d)
$18:f795  9d 0c 9f	  sta $9f0c,x
$18:f798  93 12		 sta ($12,s),y
$18:f79a  5e 9d 12	  lsr $129d,x
$18:f79d  5d 9f 0c	  eor $0c9f,x
$18:f7a0  93 0c		 sta ($0c,s),y
$18:f7a2  5e 93 0c	  lsr $0c93,x
$18:f7a5  5d 9d 9f	  eor $9f9d,x
$18:f7a8  93 12		 sta ($12,s),y
$18:f7aa  9d 9f 0c	  sta $0c9f,x
$18:f7ad  5e 93 06	  lsr $0693,x
$18:f7b0  c8			iny
$18:f7b1  12 5d		 ora ($5d)
$18:f7b3  9d 0c 9f	  sta $9f0c,x
$18:f7b6  93 12		 sta ($12,s),y
$18:f7b8  5e 9d 12	  lsr $129d,x
$18:f7bb  5d 9f 0c	  eor $0c9f,x
$18:f7be  93 0c		 sta ($0c,s),y
$18:f7c0  5e 93 0c	  lsr $0c93,x
$18:f7c3  5d 9d 9f	  eor $9f9d,x
$18:f7c6  93 12		 sta ($12,s),y
$18:f7c8  9d 9f 0c	  sta $0c9f,x
$18:f7cb  5e 93 06	  lsr $0693,x
$18:f7ce  c8			iny
$18:f7cf  12 5d		 ora ($5d)
$18:f7d1  9d 0c 9f	  sta $9f0c,x
$18:f7d4  93 12		 sta ($12,s),y
$18:f7d6  5e 9d 12	  lsr $129d,x
$18:f7d9  5d 9f 0c	  eor $0c9f,x
$18:f7dc  93 0c		 sta ($0c,s),y
$18:f7de  5e 93 0c	  lsr $0c93,x
$18:f7e1  5d 9d 9f	  eor $9f9d,x
$18:f7e4  93 12		 sta ($12,s),y
$18:f7e6  9d 9f 0c	  sta $0c9f,x
$18:f7e9  5e 93 06	  lsr $0693,x
$18:f7ec  c8			iny
$18:f7ed  12 5d		 ora ($5d)
$18:f7ef  9d 0c 9f	  sta $9f0c,x
$18:f7f2  93 12		 sta ($12,s),y
$18:f7f4  5e 9d 12	  lsr $129d,x
$18:f7f7  5d 9f 0c	  eor $0c9f,x
$18:f7fa  93 0c		 sta ($0c,s),y
$18:f7fc  5e 93 0c	  lsr $0c93,x
$18:f7ff  5d 9d 9f	  eor $9f9d,x
$18:f802  93 12		 sta ($12,s),y
$18:f804  9d 9f 0c	  sta $0c9f,x
$18:f807  5e 93 06	  lsr $0693,x
$18:f80a  c8			iny
$18:f80b  12 5d		 ora ($5d)
$18:f80d  9d 0c 9f	  sta $9f0c,x
$18:f810  93 12		 sta ($12,s),y
$18:f812  5e 9d 12	  lsr $129d,x
$18:f815  5d 9f 0c	  eor $0c9f,x
$18:f818  93 0c		 sta ($0c,s),y
$18:f81a  5e 93 0c	  lsr $0c93,x
$18:f81d  5d 9d 9f	  eor $9f9d,x
$18:f820  93 12		 sta ($12,s),y
$18:f822  9d 9f 0c	  sta $0c9f,x
$18:f825  5e 93 06	  lsr $0693,x
$18:f828  c8			iny
$18:f829  12 5d		 ora ($5d)
$18:f82b  9d 0c 9f	  sta $9f0c,x
$18:f82e  93 12		 sta ($12,s),y
$18:f830  5e 9d 12	  lsr $129d,x
$18:f833  5d 9f 0c	  eor $0c9f,x
$18:f836  93 0c		 sta ($0c,s),y
$18:f838  5e 93 0c	  lsr $0c93,x
$18:f83b  5d 9d 9f	  eor $9f9d,x
$18:f83e  93 12		 sta ($12,s),y
$18:f840  9d 9f 0c	  sta $0c9f,x
$18:f843  5e 93 06	  lsr $0693,x
$18:f846  c8			iny
$18:f847  12 5d		 ora ($5d)
$18:f849  9d 0c 9f	  sta $9f0c,x
$18:f84c  93 12		 sta ($12,s),y
$18:f84e  5e 9d 12	  lsr $129d,x
$18:f851  5d 9f 0c	  eor $0c9f,x
$18:f854  93 0c		 sta ($0c,s),y
$18:f856  5e 93 0c	  lsr $0c93,x
$18:f859  5d 9d 9f	  eor $9f9d,x
$18:f85c  93 12		 sta ($12,s),y
$18:f85e  9d 9f 0c	  sta $0c9f,x
$18:f861  5e 93 06	  lsr $0693,x
$18:f864  c8			iny
$18:f865  12 5d		 ora ($5d)
$18:f867  9d 0c 9f	  sta $9f0c,x
$18:f86a  93 12		 sta ($12,s),y
$18:f86c  5e 9d 12	  lsr $129d,x
$18:f86f  5d 9f 0c	  eor $0c9f,x
$18:f872  93 0c		 sta ($0c,s),y
$18:f874  5e 93 0c	  lsr $0c93,x
$18:f877  5d 9d 9f	  eor $9f9d,x
$18:f87a  93 12		 sta ($12,s),y
$18:f87c  9d 9f 0c	  sta $0c9f,x
$18:f87f  5e 93 06	  lsr $0693,x
$18:f882  c8			iny
$18:f883  12 5d		 ora ($5d)
$18:f885  9d 0c 9f	  sta $9f0c,x
$18:f888  93 12		 sta ($12,s),y
$18:f88a  5e 9d 12	  lsr $129d,x
$18:f88d  5d 9f 0c	  eor $0c9f,x
$18:f890  93 0c		 sta ($0c,s),y
$18:f892  5e 93 0c	  lsr $0c93,x
$18:f895  5d 9d 9f	  eor $9f9d,x
$18:f898  93 12		 sta ($12,s),y
$18:f89a  9d 9f 0c	  sta $0c9f,x
$18:f89d  5e 93 06	  lsr $0693,x
$18:f8a0  c8			iny
$18:f8a1  12 5d		 ora ($5d)
$18:f8a3  9d 0c 9f	  sta $9f0c,x
$18:f8a6  93 12		 sta ($12,s),y
$18:f8a8  5e 9d 12	  lsr $129d,x
$18:f8ab  5d 9f 0c	  eor $0c9f,x
$18:f8ae  93 0c		 sta ($0c,s),y
$18:f8b0  5e 93 0c	  lsr $0c93,x
$18:f8b3  5d 9d 9f	  eor $9f9d,x
$18:f8b6  93 12		 sta ($12,s),y
$18:f8b8  9d 9f 0c	  sta $0c9f,x
$18:f8bb  5e 93 06	  lsr $0693,x
$18:f8be  c8			iny
$18:f8bf  12 5d		 ora ($5d)
$18:f8c1  9d 0c 9f	  sta $9f0c,x
$18:f8c4  93 12		 sta ($12,s),y
$18:f8c6  5e 9d 12	  lsr $129d,x
$18:f8c9  5d 9f 0c	  eor $0c9f,x
$18:f8cc  93 0c		 sta ($0c,s),y
$18:f8ce  5e 93 0c	  lsr $0c93,x
$18:f8d1  5d 9d 9f	  eor $9f9d,x
$18:f8d4  93 12		 sta ($12,s),y
$18:f8d6  9d 9f 0c	  sta $0c9f,x
$18:f8d9  5e 93 06	  lsr $0693,x
$18:f8dc  c8			iny
$18:f8dd  12 5d		 ora ($5d)
$18:f8df  9d 0c 9f	  sta $9f0c,x
$18:f8e2  93 12		 sta ($12,s),y
$18:f8e4  5e 9d 12	  lsr $129d,x
$18:f8e7  5d 9f 0c	  eor $0c9f,x
$18:f8ea  93 00		 sta ($00,s),y
$18:f8ec  e0 03		 cpx #$03
$18:f8ee  ea			nop
$18:f8ef  00 ed		 brk #$ed
$18:f8f1  aa			tax
$18:f8f2  e1 0b		 sbc ($0b,x)
$18:f8f4  e3 03		 sbc $03,s
$18:f8f6  1e 1e 60	  asl $601e,x
$18:f8f9  c9 c9		 cmp #$c9
$18:f8fb  c9 c9		 cmp #$c9
$18:f8fd  c9 48		 cmp #$48
$18:f8ff  c9 06		 cmp #$06
$18:f901  3d ae ae	  and $aeae,x
$18:f904  c9 06		 cmp #$06
$18:f906  3b			tsc
$18:f907  b0 60		 bcs $f969
$18:f909  c9 30		 cmp #$30
$18:f90b  c9 06		 cmp #$06
$18:f90d  3d ae ae	  and $aeae,x
$18:f910  c9 06		 cmp #$06
$18:f912  3b			tsc
$18:f913  b0 c9		 bcs $f8de
$18:f915  06 3d		 asl $3d
$18:f917  ae c9 06	  ldx $06c9
$18:f91a  3b			tsc
$18:f91b  b0 60		 bcs $f97d
$18:f91d  c9 48		 cmp #$48
$18:f91f  c9 06		 cmp #$06
$18:f921  3d ae ae	  and $aeae,x
$18:f924  c9 06		 cmp #$06
$18:f926  3b			tsc
$18:f927  b0 60		 bcs $f989
$18:f929  c9 30		 cmp #$30
$18:f92b  c9 06		 cmp #$06
$18:f92d  3d ae ae	  and $aeae,x
$18:f930  c9 06		 cmp #$06
$18:f932  3b			tsc
$18:f933  b0 c9		 bcs $f8fe
$18:f935  06 3d		 asl $3d
$18:f937  ae c9 06	  ldx $06c9
$18:f93a  3b			tsc
$18:f93b  b0 60		 bcs $f99d
$18:f93d  c9 48		 cmp #$48
$18:f93f  c9 06		 cmp #$06
$18:f941  3d ae ae	  and $aeae,x
$18:f944  c9 06		 cmp #$06
$18:f946  3b			tsc
$18:f947  b0 60		 bcs $f9a9
$18:f949  c9 30		 cmp #$30
$18:f94b  c9 06		 cmp #$06
$18:f94d  3d ae ae	  and $aeae,x
$18:f950  c9 06		 cmp #$06
$18:f952  3b			tsc
$18:f953  b0 c9		 bcs $f91e
$18:f955  06 3d		 asl $3d
$18:f957  ae c9 06	  ldx $06c9
$18:f95a  3b			tsc
$18:f95b  b0 60		 bcs $f9bd
$18:f95d  c9 48		 cmp #$48
$18:f95f  c9 06		 cmp #$06
$18:f961  3d ae ae	  and $aeae,x
$18:f964  c9 06		 cmp #$06
$18:f966  3b			tsc
$18:f967  b0 60		 bcs $f9c9
$18:f969  c9 30		 cmp #$30
$18:f96b  c9 06		 cmp #$06
$18:f96d  3d ae ae	  and $aeae,x
$18:f970  c9 06		 cmp #$06
$18:f972  3b			tsc
$18:f973  b0 c9		 bcs $f93e
$18:f975  06 3d		 asl $3d
$18:f977  ae c9 06	  ldx $06c9
$18:f97a  3b			tsc
$18:f97b  b0 60		 bcs $f9dd
$18:f97d  c9 48		 cmp #$48
$18:f97f  c9 06		 cmp #$06
$18:f981  3d ae ae	  and $aeae,x
$18:f984  c9 06		 cmp #$06
$18:f986  3b			tsc
$18:f987  b0 60		 bcs $f9e9
$18:f989  c9 30		 cmp #$30
$18:f98b  c9 06		 cmp #$06
$18:f98d  3d ae ae	  and $aeae,x
$18:f990  c9 06		 cmp #$06
$18:f992  3b			tsc
$18:f993  b0 c9		 bcs $f95e
$18:f995  06 3d		 asl $3d
$18:f997  ae c9 06	  ldx $06c9
$18:f99a  3b			tsc
$18:f99b  b0 60		 bcs $f9fd
$18:f99d  c9 48		 cmp #$48
$18:f99f  c9 06		 cmp #$06
$18:f9a1  3d ae ae	  and $aeae,x
$18:f9a4  c9 06		 cmp #$06
$18:f9a6  3b			tsc
$18:f9a7  b0 60		 bcs $fa09
$18:f9a9  c9 30		 cmp #$30
$18:f9ab  c9 06		 cmp #$06
$18:f9ad  3d ae ae	  and $aeae,x
$18:f9b0  c9 06		 cmp #$06
$18:f9b2  3b			tsc
$18:f9b3  b0 c9		 bcs $f97e
$18:f9b5  06 3d		 asl $3d
$18:f9b7  ae c9 06	  ldx $06c9
$18:f9ba  3b			tsc
$18:f9bb  b0 60		 bcs $fa1d
$18:f9bd  c9 48		 cmp #$48
$18:f9bf  c9 06		 cmp #$06
$18:f9c1  3d ae ae	  and $aeae,x
$18:f9c4  c9 06		 cmp #$06
$18:f9c6  3b			tsc
$18:f9c7  b0 60		 bcs $fa29
$18:f9c9  c9 30		 cmp #$30
$18:f9cb  c9 06		 cmp #$06
$18:f9cd  3d ae ae	  and $aeae,x
$18:f9d0  c9 06		 cmp #$06
$18:f9d2  3b			tsc
$18:f9d3  b0 c9		 bcs $f99e
$18:f9d5  06 3d		 asl $3d
$18:f9d7  ae c9 06	  ldx $06c9
$18:f9da  3b			tsc
$18:f9db  b0 00		 bcs $f9dd
$18:f9dd  e0 03		 cpx #$03
$18:f9df  ea			nop
$18:f9e0  00 ed		 brk #$ed
$18:f9e2  8c e1 0b	  sty $0be1
$18:f9e5  e3 03		 sbc $03,s
$18:f9e7  1e 1e 60	  asl $601e,x
$18:f9ea  c9 c9		 cmp #$c9
$18:f9ec  c9 c9		 cmp #$c9
$18:f9ee  c9 48		 cmp #$48
$18:f9f0  c9 06		 cmp #$06
$18:f9f2  3d a9 a9	  and $a9a9,x
$18:f9f5  c9 06		 cmp #$06
$18:f9f7  3b			tsc
$18:f9f8  ab			plb
$18:f9f9  60			rts
$18:f9fa  c9 30		 cmp #$30
$18:f9fc  c9 06		 cmp #$06
$18:f9fe  3d a9 a9	  and $a9a9,x
$18:fa01  c9 06		 cmp #$06
$18:fa03  3b			tsc
$18:fa04  ab			plb
$18:fa05  c9 06		 cmp #$06
$18:fa07  3d a9 c9	  and $c9a9,x
$18:fa0a  06 3b		 asl $3b
$18:fa0c  ab			plb
$18:fa0d  60			rts
$18:fa0e  c9 48		 cmp #$48
$18:fa10  c9 06		 cmp #$06
$18:fa12  3d a9 a9	  and $a9a9,x
$18:fa15  c9 06		 cmp #$06
$18:fa17  3b			tsc
$18:fa18  ab			plb
$18:fa19  60			rts
$18:fa1a  c9 30		 cmp #$30
$18:fa1c  c9 06		 cmp #$06
$18:fa1e  3d a9 a9	  and $a9a9,x
$18:fa21  c9 06		 cmp #$06
$18:fa23  3b			tsc
$18:fa24  ab			plb
$18:fa25  c9 06		 cmp #$06
$18:fa27  3d a9 c9	  and $c9a9,x
$18:fa2a  06 3b		 asl $3b
$18:fa2c  ab			plb
$18:fa2d  60			rts
$18:fa2e  c9 48		 cmp #$48
$18:fa30  c9 06		 cmp #$06
$18:fa32  3d a9 a9	  and $a9a9,x
$18:fa35  c9 06		 cmp #$06
$18:fa37  3b			tsc
$18:fa38  ab			plb
$18:fa39  60			rts
$18:fa3a  c9 30		 cmp #$30
$18:fa3c  c9 06		 cmp #$06
$18:fa3e  3d a9 a9	  and $a9a9,x
$18:fa41  c9 06		 cmp #$06
$18:fa43  3b			tsc
$18:fa44  ab			plb
$18:fa45  c9 06		 cmp #$06
$18:fa47  3d a9 c9	  and $c9a9,x
$18:fa4a  06 3b		 asl $3b
$18:fa4c  ab			plb
$18:fa4d  60			rts
$18:fa4e  c9 48		 cmp #$48
$18:fa50  c9 06		 cmp #$06
$18:fa52  3d a9 a9	  and $a9a9,x
$18:fa55  c9 06		 cmp #$06
$18:fa57  3b			tsc
$18:fa58  ab			plb
$18:fa59  60			rts
$18:fa5a  c9 30		 cmp #$30
$18:fa5c  c9 06		 cmp #$06
$18:fa5e  3d a9 a9	  and $a9a9,x
$18:fa61  c9 06		 cmp #$06
$18:fa63  3b			tsc
$18:fa64  ab			plb
$18:fa65  c9 06		 cmp #$06
$18:fa67  3d a9 c9	  and $c9a9,x
$18:fa6a  06 3b		 asl $3b
$18:fa6c  ab			plb
$18:fa6d  60			rts
$18:fa6e  c9 48		 cmp #$48
$18:fa70  c9 06		 cmp #$06
$18:fa72  3d a9 a9	  and $a9a9,x
$18:fa75  c9 06		 cmp #$06
$18:fa77  3b			tsc
$18:fa78  ab			plb
$18:fa79  60			rts
$18:fa7a  c9 30		 cmp #$30
$18:fa7c  c9 06		 cmp #$06
$18:fa7e  3d a9 a9	  and $a9a9,x
$18:fa81  c9 06		 cmp #$06
$18:fa83  3b			tsc
$18:fa84  ab			plb
$18:fa85  c9 06		 cmp #$06
$18:fa87  3d a9 c9	  and $c9a9,x
$18:fa8a  06 3b		 asl $3b
$18:fa8c  ab			plb
$18:fa8d  60			rts
$18:fa8e  c9 48		 cmp #$48
$18:fa90  c9 06		 cmp #$06
$18:fa92  3d a9 a9	  and $a9a9,x
$18:fa95  c9 06		 cmp #$06
$18:fa97  3b			tsc
$18:fa98  ab			plb
$18:fa99  60			rts
$18:fa9a  c9 30		 cmp #$30
$18:fa9c  c9 06		 cmp #$06
$18:fa9e  3d a9 a9	  and $a9a9,x
$18:faa1  c9 06		 cmp #$06
$18:faa3  3b			tsc
$18:faa4  ab			plb
$18:faa5  c9 06		 cmp #$06
$18:faa7  3d a9 c9	  and $c9a9,x
$18:faaa  06 3b		 asl $3b
$18:faac  ab			plb
$18:faad  60			rts
$18:faae  c9 48		 cmp #$48
$18:fab0  c9 06		 cmp #$06
$18:fab2  3d a9 a9	  and $a9a9,x
$18:fab5  c9 06		 cmp #$06
$18:fab7  3b			tsc
$18:fab8  ab			plb
$18:fab9  60			rts
$18:faba  c9 30		 cmp #$30
$18:fabc  c9 06		 cmp #$06
$18:fabe  3d a9 a9	  and $a9a9,x
$18:fac1  c9 06		 cmp #$06
$18:fac3  3b			tsc
$18:fac4  ab			plb
$18:fac5  c9 06		 cmp #$06
$18:fac7  3d a9 c9	  and $c9a9,x
$18:faca  06 3b		 asl $3b
$18:facc  ab			plb
$18:facd  00 ea		 brk #$ea
$18:facf  00 ed		 brk #$ed
$18:fad1  c3 18		 cmp $18,s
$18:fad3  5d ca cb	  eor $cbca,x
$18:fad6  ca			dex
$18:fad7  12 cb		 ora ($cb)
$18:fad9  06 cb		 asl $cb
$18:fadb  c9 12		 cmp #$12
$18:fadd  ca			dex
$18:fade  0c cb ca	  tsb $cacb
$18:fae1  12 ca		 ora ($ca)
$18:fae3  06 cb		 asl $cb
$18:fae5  0c c9 ca	  tsb $cac9
$18:fae8  18			clc
$18:fae9  ca			dex
$18:faea  cb			wai
$18:faeb  ca			dex
$18:faec  12 cb		 ora ($cb)
$18:faee  06 cb		 asl $cb
$18:faf0  c9 12		 cmp #$12
$18:faf2  ca			dex
$18:faf3  0c cb ca	  tsb $cacb
$18:faf6  12 ca		 ora ($ca)
$18:faf8  06 cb		 asl $cb
$18:fafa  0c c9 ca	  tsb $cac9
$18:fafd  18			clc
$18:fafe  ca			dex
$18:faff  cb			wai
$18:fb00  ca			dex
$18:fb01  12 cb		 ora ($cb)
$18:fb03  06 cb		 asl $cb
$18:fb05  c9 12		 cmp #$12
$18:fb07  ca			dex
$18:fb08  0c cb ca	  tsb $cacb
$18:fb0b  12 ca		 ora ($ca)
$18:fb0d  06 cb		 asl $cb
$18:fb0f  0c c9 ca	  tsb $cac9
$18:fb12  18			clc
$18:fb13  ca			dex
$18:fb14  cb			wai
$18:fb15  ca			dex
$18:fb16  12 cb		 ora ($cb)
$18:fb18  06 cb		 asl $cb
$18:fb1a  c9 12		 cmp #$12
$18:fb1c  ca			dex
$18:fb1d  0c cb ca	  tsb $cacb
$18:fb20  12 ca		 ora ($ca)
$18:fb22  06 cb		 asl $cb
$18:fb24  0c c9 ca	  tsb $cac9
$18:fb27  18			clc
$18:fb28  ca			dex
$18:fb29  cb			wai
$18:fb2a  ca			dex
$18:fb2b  12 cb		 ora ($cb)
$18:fb2d  06 cb		 asl $cb
$18:fb2f  c9 12		 cmp #$12
$18:fb31  ca			dex
$18:fb32  0c cb ca	  tsb $cacb
$18:fb35  12 ca		 ora ($ca)
$18:fb37  06 cb		 asl $cb
$18:fb39  0c c9 ca	  tsb $cac9
$18:fb3c  18			clc
$18:fb3d  ca			dex
$18:fb3e  cb			wai
$18:fb3f  ca			dex
$18:fb40  12 cb		 ora ($cb)
$18:fb42  06 cb		 asl $cb
$18:fb44  c9 12		 cmp #$12
$18:fb46  ca			dex
$18:fb47  0c cb ca	  tsb $cacb
$18:fb4a  12 ca		 ora ($ca)
$18:fb4c  06 cb		 asl $cb
$18:fb4e  0c c9 ca	  tsb $cac9
$18:fb51  18			clc
$18:fb52  ca			dex
$18:fb53  cb			wai
$18:fb54  ca			dex
$18:fb55  12 cb		 ora ($cb)
$18:fb57  06 cb		 asl $cb
$18:fb59  c9 12		 cmp #$12
$18:fb5b  ca			dex
$18:fb5c  0c cb ca	  tsb $cacb
$18:fb5f  12 ca		 ora ($ca)
$18:fb61  06 cb		 asl $cb
$18:fb63  0c c9 ca	  tsb $cac9
$18:fb66  18			clc
$18:fb67  ca			dex
$18:fb68  cb			wai
$18:fb69  ca			dex
$18:fb6a  12 cb		 ora ($cb)
$18:fb6c  06 cb		 asl $cb
$18:fb6e  c9 12		 cmp #$12
$18:fb70  ca			dex
$18:fb71  0c cb ca	  tsb $cacb
$18:fb74  12 ca		 ora ($ca)
$18:fb76  06 cb		 asl $cb
$18:fb78  0c c9 ca	  tsb $cac9
$18:fb7b  18			clc
$18:fb7c  ca			dex
$18:fb7d  cb			wai
$18:fb7e  ca			dex
$18:fb7f  12 cb		 ora ($cb)
$18:fb81  06 cb		 asl $cb
$18:fb83  c9 12		 cmp #$12
$18:fb85  ca			dex
$18:fb86  0c cb ca	  tsb $cacb
$18:fb89  12 ca		 ora ($ca)
$18:fb8b  06 cb		 asl $cb
$18:fb8d  0c c9 ca	  tsb $cac9
$18:fb90  18			clc
$18:fb91  ca			dex
$18:fb92  cb			wai
$18:fb93  ca			dex
$18:fb94  12 cb		 ora ($cb)
$18:fb96  06 cb		 asl $cb
$18:fb98  c9 12		 cmp #$12
$18:fb9a  ca			dex
$18:fb9b  0c cb ca	  tsb $cacb
$18:fb9e  12 ca		 ora ($ca)
$18:fba0  06 cb		 asl $cb
$18:fba2  0c c9 ca	  tsb $cac9
$18:fba5  18			clc
$18:fba6  ca			dex
$18:fba7  cb			wai
$18:fba8  ca			dex
$18:fba9  12 cb		 ora ($cb)
$18:fbab  06 cb		 asl $cb
$18:fbad  c9 12		 cmp #$12
$18:fbaf  ca			dex
$18:fbb0  0c cb ca	  tsb $cacb
$18:fbb3  12 ca		 ora ($ca)
$18:fbb5  06 cb		 asl $cb
$18:fbb7  0c c9 ca	  tsb $cac9
$18:fbba  18			clc
$18:fbbb  ca			dex
$18:fbbc  cb			wai
$18:fbbd  ca			dex
$18:fbbe  12 cb		 ora ($cb)
$18:fbc0  06 cb		 asl $cb
$18:fbc2  c9 12		 cmp #$12
$18:fbc4  ca			dex
$18:fbc5  0c cb ca	  tsb $cacb
$18:fbc8  12 ca		 ora ($ca)
$18:fbca  06 cb		 asl $cb
$18:fbcc  0c c9 ca	  tsb $cac9
$18:fbcf  18			clc
$18:fbd0  ca			dex
$18:fbd1  cb			wai
$18:fbd2  ca			dex
$18:fbd3  12 cb		 ora ($cb)
$18:fbd5  06 cb		 asl $cb
$18:fbd7  c9 12		 cmp #$12
$18:fbd9  ca			dex
$18:fbda  0c cb ca	  tsb $cacb
$18:fbdd  12 ca		 ora ($ca)
$18:fbdf  06 cb		 asl $cb
$18:fbe1  0c c9 ca	  tsb $cac9
$18:fbe4  18			clc
$18:fbe5  ca			dex
$18:fbe6  cb			wai
$18:fbe7  ca			dex
$18:fbe8  12 cb		 ora ($cb)
$18:fbea  06 cb		 asl $cb
$18:fbec  c9 12		 cmp #$12
$18:fbee  ca			dex
$18:fbef  0c cb ca	  tsb $cacb
$18:fbf2  12 ca		 ora ($ca)
$18:fbf4  06 cb		 asl $cb
$18:fbf6  0c c9 ca	  tsb $cac9
$18:fbf9  18			clc
$18:fbfa  ca			dex
$18:fbfb  cb			wai
$18:fbfc  ca			dex
$18:fbfd  12 cb		 ora ($cb)
$18:fbff  06 cb		 asl $cb
$18:fc01  c9 12		 cmp #$12
$18:fc03  ca			dex
$18:fc04  0c cb ca	  tsb $cacb
$18:fc07  12 ca		 ora ($ca)
$18:fc09  06 cb		 asl $cb
$18:fc0b  0c c9 ca	  tsb $cac9
$18:fc0e  18			clc
$18:fc0f  ca			dex
$18:fc10  cb			wai
$18:fc11  ca			dex
$18:fc12  12 cb		 ora ($cb)
$18:fc14  06 cb		 asl $cb
$18:fc16  c9 12		 cmp #$12
$18:fc18  ca			dex
$18:fc19  0c cb ca	  tsb $cacb
$18:fc1c  12 ca		 ora ($ca)
$18:fc1e  06 cb		 asl $cb
$18:fc20  0c c9 ca	  tsb $cac9
$18:fc23  00 ea		 brk #$ea
$18:fc25  00 e0		 brk #$e0
$18:fc27  00 ed		 brk #$ed
$18:fc29  50 e1		 bvc $fc0c
$18:fc2b  08			php
$18:fc2c  66 c9		 ror $c9
$18:fc2e  60			rts
$18:fc2f  c9 c9		 cmp #$c9
$18:fc31  c9 c9		 cmp #$c9
$18:fc33  c9 c9		 cmp #$c9
$18:fc35  c9 30		 cmp #$30
$18:fc37  5d ae 0c	  eor $0cae,x
$18:fc3a  c8			iny
$18:fc3b  06 ad		 asl $ad
$18:fc3d  a9 ab		 lda #$ab
$18:fc3f  ae ad a9	  ldx $a9ad
$18:fc42  ab			plb
$18:fc43  ae ad a9	  ldx $a9ad
$18:fc46  48			pha
$18:fc47  78			sei
$18:fc48  c8			iny
$18:fc49  30 5d		 bmi $fca8
$18:fc4b  ae 0c c8	  ldx $c80c
$18:fc4e  06 ad		 asl $ad
$18:fc50  a9 ab		 lda #$ab
$18:fc52  ae ad a9	  ldx $a9ad
$18:fc55  ab			plb
$18:fc56  ae ad a9	  ldx $a9ad
$18:fc59  48			pha
$18:fc5a  78			sei
$18:fc5b  c8			iny
$18:fc5c  ea			nop
$18:fc5d  0c 30 5d	  tsb $5d30
$18:fc60  ae 0c c8	  ldx $c80c
$18:fc63  06 ad		 asl $ad
$18:fc65  a9 ab		 lda #$ab
$18:fc67  ae ad a9	  ldx $a9ad
$18:fc6a  ab			plb
$18:fc6b  ae ad a9	  ldx $a9ad
$18:fc6e  48			pha
$18:fc6f  78			sei
$18:fc70  c8			iny
$18:fc71  30 5d		 bmi $fcd0
$18:fc73  ae 0c c8	  ldx $c80c
$18:fc76  06 ad		 asl $ad
$18:fc78  a9 ab		 lda #$ab
$18:fc7a  ae ad a9	  ldx $a9ad
$18:fc7d  ab			plb
$18:fc7e  ae ad a9	  ldx $a9ad
$18:fc81  48			pha
$18:fc82  78			sei
$18:fc83  c8			iny
$18:fc84  ea			nop
$18:fc85  00 60		 brk #$60
$18:fc87  c9 c9		 cmp #$c9
$18:fc89  c9 c9		 cmp #$c9
$18:fc8b  0c 5d ab	  tsb $ab5d
$18:fc8e  b5 b7		 lda $b7,x
$18:fc90  ab			plb
$18:fc91  12 b5		 ora ($b5)
$18:fc93  b7 0c		 lda [$0c],y
$18:fc95  ab			plb
$18:fc96  06 c8		 asl $c8
$18:fc98  12 b5		 ora ($b5)
$18:fc9a  0c b7 ab	  tsb $abb7
$18:fc9d  12 b5		 ora ($b5)
$18:fc9f  b7 0c		 lda [$0c],y
$18:fca1  ab			plb
$18:fca2  ab			plb
$18:fca3  b5 b7		 lda $b7,x
$18:fca5  ab			plb
$18:fca6  12 b5		 ora ($b5)
$18:fca8  b7 0c		 lda [$0c],y
$18:fcaa  ab			plb
$18:fcab  06 c8		 asl $c8
$18:fcad  12 b5		 ora ($b5)
$18:fcaf  0c b7 ab	  tsb $abb7
$18:fcb2  12 b5		 ora ($b5)
$18:fcb4  b7 0c		 lda [$0c],y
$18:fcb6  c9 ed		 cmp #$ed
$18:fcb8  6e e0 04	  ror $04e0
$18:fcbb  30 ae		 bmi $fc6b
$18:fcbd  0c 6d c8	  tsb $c86d
$18:fcc0  0c 5d ab	  tsb $ab5d
$18:fcc3  b0 ae		 bcs $fc73
$18:fcc5  b2 b0		 lda ($b0)
$18:fcc7  b5 3c		 lda $3c,x
$18:fcc9  b2 30		 lda ($30)
$18:fccb  b7 0c		 lda [$0c],y
$18:fccd  6d c8 0c	  adc $0cc8
$18:fcd0  5d b2 ba	  eor $bab2,x
$18:fcd3  b7 0c		 lda [$0c],y
$18:fcd5  5b			tcd
$18:fcd6  be ba 0c	  ldx $0cba,y
$18:fcd9  59 c3 3c	  eor $3cc3,y
$18:fcdc  57 be		 eor [$be],y
$18:fcde  30 5d		 bmi $fd3d
$18:fce0  ae 0c 6d	  ldx $6d0c
$18:fce3  c8			iny
$18:fce4  0c 5d ab	  tsb $ab5d
$18:fce7  b0 ae		 bcs $fc97
$18:fce9  b2 b0		 lda ($b0)
$18:fceb  b5 3c		 lda $3c,x
$18:fced  b2 30		 lda ($30)
$18:fcef  b7 0c		 lda [$0c],y
$18:fcf1  6d c8 0c	  adc $0cc8
$18:fcf4  5d b2 ba	  eor $bab2,x
$18:fcf7  b7 0c		 lda [$0c],y
$18:fcf9  5b			tcd
$18:fcfa  be ba 0c	  ldx $0cba,y
$18:fcfd  59 c3 36	  eor $36c3,y
$18:fd00  57 b7		 eor [$b7],y
$18:fd02  00 ea		 brk #$ea
$18:fd04  e8			inx
$18:fd05  e0 02		 cpx #$02
$18:fd07  ed 46 e1	  sbc $e146
$18:fd0a  07 66		 ora [$66]
$18:fd0c  c9 60		 cmp #$60
$18:fd0e  c9 c9		 cmp #$c9
$18:fd10  c9 0c		 cmp #$0c
$18:fd12  c9 06		 cmp #$06
$18:fd14  5d ae 06	  eor $06ae,x
$18:fd17  5b			tcd
$18:fd18  a9 0c		 lda #$0c
$18:fd1a  c9 06		 cmp #$06
$18:fd1c  5d b0 06	  eor $06b0,x
$18:fd1f  59 ab 30	  eor $30ab,y
$18:fd22  c9 0c		 cmp #$0c
$18:fd24  c9 06		 cmp #$06
$18:fd26  5d ae 06	  eor $06ae,x
$18:fd29  5b			tcd
$18:fd2a  a9 06		 lda #$06
$18:fd2c  5d b0 06	  eor $06b0,x
$18:fd2f  59 ab 3c	  eor $3cab,y
$18:fd32  c9 0c		 cmp #$0c
$18:fd34  c9 06		 cmp #$06
$18:fd36  5d ae 06	  eor $06ae,x
$18:fd39  5b			tcd
$18:fd3a  a9 0c		 lda #$0c
$18:fd3c  c9 06		 cmp #$06
$18:fd3e  5d b0 06	  eor $06b0,x
$18:fd41  59 ab 30	  eor $30ab,y
$18:fd44  c9 0c		 cmp #$0c
$18:fd46  c9 06		 cmp #$06
$18:fd48  5d ae 06	  eor $06ae,x
$18:fd4b  5b			tcd
$18:fd4c  a9 06		 lda #$06
$18:fd4e  5d b0 06	  eor $06b0,x
$18:fd51  59 ab 3c	  eor $3cab,y
$18:fd54  c9 0c		 cmp #$0c
$18:fd56  c9 06		 cmp #$06
$18:fd58  5d ae 06	  eor $06ae,x
$18:fd5b  5b			tcd
$18:fd5c  a9 0c		 lda #$0c
$18:fd5e  c9 06		 cmp #$06
$18:fd60  5d b0 06	  eor $06b0,x
$18:fd63  59 ab 30	  eor $30ab,y
$18:fd66  c9 0c		 cmp #$0c
$18:fd68  c9 06		 cmp #$06
$18:fd6a  5d ae 06	  eor $06ae,x
$18:fd6d  5b			tcd
$18:fd6e  a9 06		 lda #$06
$18:fd70  5d b0 06	  eor $06b0,x
$18:fd73  59 ab 3c	  eor $3cab,y
$18:fd76  c9 0c		 cmp #$0c
$18:fd78  c9 06		 cmp #$06
$18:fd7a  5d ae 06	  eor $06ae,x
$18:fd7d  5b			tcd
$18:fd7e  a9 0c		 lda #$0c
$18:fd80  c9 06		 cmp #$06
$18:fd82  5d b0 06	  eor $06b0,x
$18:fd85  59 ab 30	  eor $30ab,y
$18:fd88  c9 0c		 cmp #$0c
$18:fd8a  c9 06		 cmp #$06
$18:fd8c  5d ae 06	  eor $06ae,x
$18:fd8f  5b			tcd
$18:fd90  a9 06		 lda #$06
$18:fd92  5d b0 06	  eor $06b0,x
$18:fd95  59 ab 3c	  eor $3cab,y
$18:fd98  c9 0c		 cmp #$0c
$18:fd9a  c9 06		 cmp #$06
$18:fd9c  5d ae 06	  eor $06ae,x
$18:fd9f  5b			tcd
$18:fda0  a9 0c		 lda #$0c
$18:fda2  c9 06		 cmp #$06
$18:fda4  5d b0 06	  eor $06b0,x
$18:fda7  59 ab 30	  eor $30ab,y
$18:fdaa  c9 0c		 cmp #$0c
$18:fdac  c9 06		 cmp #$06
$18:fdae  5d ae 06	  eor $06ae,x
$18:fdb1  5b			tcd
$18:fdb2  a9 06		 lda #$06
$18:fdb4  5d b0 06	  eor $06b0,x
$18:fdb7  59 ab 3c	  eor $3cab,y
$18:fdba  c9 0c		 cmp #$0c
$18:fdbc  c9 06		 cmp #$06
$18:fdbe  5d ae 06	  eor $06ae,x
$18:fdc1  5b			tcd
$18:fdc2  a9 0c		 lda #$0c
$18:fdc4  c9 06		 cmp #$06
$18:fdc6  5d b0 06	  eor $06b0,x
$18:fdc9  59 ab 30	  eor $30ab,y
$18:fdcc  c9 0c		 cmp #$0c
$18:fdce  c9 06		 cmp #$06
$18:fdd0  5d ae 06	  eor $06ae,x
$18:fdd3  5b			tcd
$18:fdd4  a9 06		 lda #$06
$18:fdd6  5d b0 06	  eor $06b0,x
$18:fdd9  59 ab 3c	  eor $3cab,y
$18:fddc  c9 60		 cmp #$60
$18:fdde  c9 c9		 cmp #$c9
$18:fde0  c9 c9		 cmp #$c9
$18:fde2  0c c9 06	  tsb $06c9
$18:fde5  5d ae 06	  eor $06ae,x
$18:fde8  5b			tcd
$18:fde9  a9 0c		 lda #$0c
$18:fdeb  c9 06		 cmp #$06
$18:fded  5d b0 06	  eor $06b0,x
$18:fdf0  59 ab 30	  eor $30ab,y
$18:fdf3  c9 0c		 cmp #$0c
$18:fdf5  c9 06		 cmp #$06
$18:fdf7  5d ae 06	  eor $06ae,x
$18:fdfa  5b			tcd
$18:fdfb  a9 06		 lda #$06
$18:fdfd  5d b0 06	  eor $06b0,x
$18:fe00  59 ab 3c	  eor $3cab,y
$18:fe03  c9 0c		 cmp #$0c
$18:fe05  c9 06		 cmp #$06
$18:fe07  5d ae 06	  eor $06ae,x
$18:fe0a  5b			tcd
$18:fe0b  a9 0c		 lda #$0c
$18:fe0d  c9 06		 cmp #$06
$18:fe0f  5d b0 06	  eor $06b0,x
$18:fe12  59 ab 30	  eor $30ab,y
$18:fe15  c9 0c		 cmp #$0c
$18:fe17  c9 06		 cmp #$06
$18:fe19  5d ae 06	  eor $06ae,x
$18:fe1c  5b			tcd
$18:fe1d  a9 06		 lda #$06
$18:fe1f  5d b0 06	  eor $06b0,x
$18:fe22  59 ab 3c	  eor $3cab,y
$18:fe25  c9 0c		 cmp #$0c
$18:fe27  c9 06		 cmp #$06
$18:fe29  5d ae 06	  eor $06ae,x
$18:fe2c  5b			tcd
$18:fe2d  a9 0c		 lda #$0c
$18:fe2f  c9 06		 cmp #$06
$18:fe31  5d b0 06	  eor $06b0,x
$18:fe34  59 ab 30	  eor $30ab,y
$18:fe37  c9 0c		 cmp #$0c
$18:fe39  c9 06		 cmp #$06
$18:fe3b  5d ae 06	  eor $06ae,x
$18:fe3e  5b			tcd
$18:fe3f  a9 06		 lda #$06
$18:fe41  5d b0 06	  eor $06b0,x
$18:fe44  59 ab 3c	  eor $3cab,y
$18:fe47  c9 0c		 cmp #$0c
$18:fe49  c9 06		 cmp #$06
$18:fe4b  5d ae 06	  eor $06ae,x
$18:fe4e  5b			tcd
$18:fe4f  a9 0c		 lda #$0c
$18:fe51  c9 06		 cmp #$06
$18:fe53  5d b0 06	  eor $06b0,x
$18:fe56  59 ab 30	  eor $30ab,y
$18:fe59  c9 0c		 cmp #$0c
$18:fe5b  c9 06		 cmp #$06
$18:fe5d  5d ae 06	  eor $06ae,x
$18:fe60  5b			tcd
$18:fe61  a9 06		 lda #$06
$18:fe63  5d b0 06	  eor $06b0,x
$18:fe66  59 ab 3c	  eor $3cab,y
$18:fe69  c9 0c		 cmp #$0c
$18:fe6b  c9 06		 cmp #$06
$18:fe6d  5d ae 06	  eor $06ae,x
$18:fe70  5b			tcd
$18:fe71  a9 0c		 lda #$0c
$18:fe73  c9 06		 cmp #$06
$18:fe75  5d b0 06	  eor $06b0,x
$18:fe78  59 ab 30	  eor $30ab,y
$18:fe7b  c9 0c		 cmp #$0c
$18:fe7d  c9 06		 cmp #$06
$18:fe7f  5d ae 06	  eor $06ae,x
$18:fe82  5b			tcd
$18:fe83  a9 06		 lda #$06
$18:fe85  5d b0 06	  eor $06b0,x
$18:fe88  59 ab 3c	  eor $3cab,y
$18:fe8b  c9 0c		 cmp #$0c
$18:fe8d  c9 06		 cmp #$06
$18:fe8f  5d ae 06	  eor $06ae,x
$18:fe92  5b			tcd
$18:fe93  a9 0c		 lda #$0c
$18:fe95  c9 06		 cmp #$06
$18:fe97  5d b0 06	  eor $06b0,x
$18:fe9a  59 ab 30	  eor $30ab,y
$18:fe9d  c9 0c		 cmp #$0c
$18:fe9f  c9 06		 cmp #$06
$18:fea1  5d ae 06	  eor $06ae,x
$18:fea4  5b			tcd
$18:fea5  a9 06		 lda #$06
$18:fea7  5d b0 06	  eor $06b0,x
$18:feaa  59 ab 36	  eor $36ab,y
$18:fead  c9 00		 cmp #$00
$18:feaf  00 1c		 brk #$1c
$18:feb1  00 34		 brk #$34
$18:feb3  2c 53 73	  bit $7353
$18:feb6  89 73		 bit #$73
$18:feb8  a4 73		 ldy $73
$18:feba  01 7a		 ora ($7a,x)
$18:febc  7f 7a 9a 7a   adc $7a9a7a,x
$18:fec0  d9 7a 3d	  cmp $3d7a,y
$18:fec3  7d 86 7f	  adc $7f86,x
$18:fec6  01 83		 ora ($83,x)
$18:fec8  1c 83 1c	  trb $1c83
$18:fecb  83 81		 sta $81,s
$18:fecd  87 81		 sta [$81]
$18:fecf  87 02		 sta [$02]
$18:fed1  00 fd		 brk #$fd
$18:fed3  0f 6b 91 00   ora $00916b
$18:fed7  00 07		 brk #$07
$18:fed9  14 10		 trb $10
$18:fedb  0d 1e 1b	  ora $1b1e
$18:fede  18			clc
$18:fedf  19 c0 54	  ora $54c0,y
$18:fee2  00 00		 brk #$00
$18:fee4  4a			lsr a
$18:fee5  00 12		 brk #$12
$18:fee7  00 18		 brk #$18
$18:fee9  00 1e		 brk #$1e
$18:feeb  00 0c		 brk #$0c
$18:feed  01 70		 ora ($70,x)
$18:feef  01 be		 ora ($be,x)
$18:fef1  02 86		 cop #$86
$18:fef3  30 4c		 bmi $ff41
$18:fef5  61 90		 adc ($90,x)
$18:fef7  5a			phy
$18:fef8  56 73		 lsr $73,x
$18:fefa  4e 21 56	  lsr $5621
$18:fefd  42 21		 wdm #$21
$18:feff  08			php
$18:ff00  20 25 c6	  jsr $c625
$18:ff03  7d 48 7e	  adc $7e48,x
$18:ff06  ac 7e 0f	  ldy $0f7e
$18:ff09  7f 93 7f fa   adc $fa7f93,x
$18:ff0d  7f 00 10 ff   adc $ff1000,x
$18:ff11  7f ff 7f ff   adc $ff7fff,x
$18:ff15  7f ff 7f ff   adc $ff7fff,x
$18:ff19  7f ff 7f ff   adc $ff7fff,x
$18:ff1d  7f ff 7f 20   adc $207fff,x
$18:ff21  25 00		 and $00
$18:ff23  28			plp
$18:ff24  80 3c		 bra $ff62
$18:ff26  c4 54		 cpy $54
$18:ff28  47 61		 eor [$61]
$18:ff2a  ca			dex
$18:ff2b  65 2e		 adc $2e
$18:ff2d  6a			ror a
$18:ff2e  92 7e		 sta ($7e)
$18:ff30  57 7f		 eor [$7f],y
$18:ff32  00 28		 brk #$28
$18:ff34  45 24		 eor $24
$18:ff36  87 28		 sta [$28]
$18:ff38  c8			iny
$18:ff39  30 c3		 bmi $fefe
$18:ff3b  14 04		 trb $04
$18:ff3d  19 41 0c	  ora $0c41,y
$18:ff40  8d 1d 04	  sta $041d
$18:ff43  00 07		 brk #$07
$18:ff45  00 0a		 brk #$0a
$18:ff47  00 0e		 brk #$0e
$18:ff49  00 52		 brk #$52
$18:ff4b  28			plp
$18:ff4c  d6 34		 dec $34,x
$18:ff4e  00 00		 brk #$00
$18:ff50  79 45 10	  adc $1045,y
$18:ff53  56 c4		 lsr $c4,x
$18:ff55  1c 07 31	  trb $3107
$18:ff58  6b			rtl
$18:ff59  45 e9		 eor $e9
$18:ff5b  00 8e		 brk #$8e
$18:ff5d  0d 41 0c	  ora $0c41
$18:ff60  aa			tax
$18:ff61  39 00 38	  and $3800,y
$18:ff64  80 40		 bra $ffa6
$18:ff66  c4 54		 cpy $54
$18:ff68  47 61		 eor [$61]
$18:ff6a  ca			dex
$18:ff6b  65 2e		 adc $2e
$18:ff6d  6a			ror a
$18:ff6e  92 7e		 sta ($7e)
$18:ff70  57 7f		 eor [$7f],y
$18:ff72  41 20		 eor ($20,x)
$18:ff74  cc 45 4f	  cpy $4f45
$18:ff77  5a			phy
$18:ff78  d2 6a		 cmp ($6a)
$18:ff7a  41 0c		 eor ($0c,x)
$18:ff7c  41 0c		 eor ($0c,x)
$18:ff7e  21 18		 and ($18,x)
$18:ff80  b2 52		 lda ($52)
$18:ff82  a7 00		 lda [$00]
$18:ff84  4b			phk
$18:ff85  11 f1		 ora ($f1),y
$18:ff87  15 00		 ora $00,x
$18:ff89  20 27 35	  jsr $3527
$18:ff8c  c9 49		 cmp #$49
$18:ff8e  16 7f		 asl $7f,x
$18:ff90  66 19		 ror $19
$18:ff92  cc 14 77	  cpy $7714
$18:ff95  25 e3		 and $e3
$18:ff97  1d 64 26	  ora $2664,x
$18:ff9a  00 00		 brk #$00
$18:ff9c  00 00		 brk #$00
$18:ff9e  00 00		 brk #$00
$18:ffa0  40			rti
$18:ffa1  61 63		 adc ($63,x)
$18:ffa3  04 a7		 tsb $a7
$18:ffa5  00 2c		 brk #$2c
$18:ffa7  11 f3		 ora ($f3),y
$18:ffa9  15 02		 ora $02,x
$18:ffab  10 02		 bpl $ffaf
$18:ffad  20 45 2c	  jsr $2c45
$18:ffb0  87 34		 sta [$34]
$18:ffb2  00 38		 brk #$38
$18:ffb4  80 40		 bra $fff6
$18:ffb6  07 25		 ora [$25]
$18:ffb8  6a			ror a
$18:ffb9  31 44		 and ($44),y
$18:ffbb  2c 00 18	  bit $1800
$18:ffbe  41 0c		 eor ($0c,x)
$18:ffc0  00 50		 brk #$50
$18:ffc2  c0 3c		 cpy #$3c
$18:ffc4  00 5d		 brk #$5d
$18:ffc6  44 02 b2	  mvp $b2,$02
$18:ffc9  11 02		 ora ($02),y
$18:ffcb  10 66		 bpl $0033
$18:ffcd  00 c9		 brk #$c9
$18:ffcf  10 4e		 bpl $001f
$18:ffd1  15 02		 ora $02,x
$18:ffd3  20 45 2c	  jsr $2c45
$18:ffd6  87 34		 sta [$34]
$18:ffd8  00 01		 brk #$01
$18:ffda  63 19		 adc $19,s
$18:ffdc  e4 1d		 cpx $1d
$18:ffde  00 00		 brk #$00
$18:ffe0  00 00		 brk #$00
$18:ffe2  00 50		 brk #$50
$18:ffe4  15 7f		 ora $7f,x
$18:ffe6  ff 7f 4a 29   sbc $294a7f,x
$18:ffea  00 00		 brk #$00
$18:ffec  00 00		 brk #$00
$18:ffee  00 00		 brk #$00
$18:fff0  00 00		 brk #$00
$18:fff2  00 00		 brk #$00
$18:fff4  00 00		 brk #$00
$18:fff6  00 00		 brk #$00
$18:fff8  00 00		 brk #$00
$18:fffa  00 00		 brk #$00
$18:fffc  00 00		 brk #$00
$18:fffe  00 00		 brk #$00
