; Soul Blazer (SNES) - Bank $0d
; Disassembled from ROM
; File offset: $068000-$06ffff
; CPU address: $0d:$8000-$0d:$ffff
;===========================================================

.bank $0d
.org $8000

$0d:8000  a0 80 55	  ldy #$5580
$0d:8003  81 46		 sta ($46,x)
$0d:8005  82 f7 82	  brl $02ff
$0d:8008  f4 83 a5	  pea $a583
$0d:800b  84 56		 sty $56
$0d:800d  85 07		 sta $07
$0d:800f  86 b8		 stx $b8
$0d:8011  86 f1		 stx $f1
$0d:8013  86 be		 stx $be
$0d:8015  87 df		 sta [$df]
$0d:8017  88			dey
$0d:8018  2a			rol a
$0d:8019  8a			txa
$0d:801a  f7 8a		 sbc [$8a],y
$0d:801c  88			dey
$0d:801d  8b			phb
$0d:801e  77 8c		 adc [$8c],y
$0d:8020  66 8d		 ror $8d
$0d:8022  9f 8d 02 8e   sta $8e028d,x
$0d:8026  b3 8e		 lda ($8e,s),y
$0d:8028  5c 8f f9 8f   jml $8ff98f
$0d:802c  ba			tsx
$0d:802d  90 01		 bcc $8030
$0d:802f  91 02		 sta ($02),y
$0d:8031  92 7b		 sta ($7b)
$0d:8033  92 7c		 sta ($7c)
$0d:8035  93 7d		 sta ($7d,s),y
$0d:8037  94 f6		 sty $f6,x
$0d:8039  94 6f		 sty $6f,x
$0d:803b  95 e8		 sta $e8,x
$0d:803d  95 61		 sta $61,x
$0d:803f  96 16		 stx $16,y
$0d:8041  97 7b		 sta [$7b],y
$0d:8043  97 42		 sta [$42],y
$0d:8045  98			tya
$0d:8046  dd 98 54	  cmp $5498,x
$0d:8049  99 cb 99	  sta $99cb,y
$0d:804c  ec 9a e9	  cpx $e99a
$0d:804f  9b			txy
$0d:8050  e6 9c		 inc $9c
$0d:8052  e3 9d		 sbc $9d,s
$0d:8054  bc 9e 4d	  ldy $4d9e,x
$0d:8057  9f a2 9f 13   sta $139fa2,x
$0d:805b  a0 a4 a0	  ldy #$a0a4
$0d:805e  25 a1		 and $a1
$0d:8060  06 a2		 asl $a2
$0d:8062  87 a2		 sta [$a2]
$0d:8064  08			php
$0d:8065  a3 cf		 lda $cf,s
$0d:8067  a3 60		 lda $60,s
$0d:8069  a4 fd		 ldy $fd
$0d:806b  a4 76		 ldy $76
$0d:806d  a5 f7		 lda $f7
$0d:806f  a5 a8		 lda $a8
$0d:8071  a6 33		 ldx $33
$0d:8073  a7 fc		 lda [$fc]
$0d:8075  a9 2f ab	  lda #$ab2f
$0d:8078  50 ac		 bvc $8026
$0d:807a  83 ad		 sta $ad,s
$0d:807c  a4 ae		 ldy $ae
$0d:807e  d7 af		 cmp [$af],y
$0d:8080  c8			iny
$0d:8081  b0 55		 bcs $80d8
$0d:8083  b1 c2		 lda ($c2),y
$0d:8085  b1 77		 lda ($77),y
$0d:8087  b2 b0		 lda ($b0)
$0d:8089  b2 6d		 lda ($6d)
$0d:808b  b3 b6		 lda ($b6,s),y
$0d:808d  b3 ff		 lda ($ff,s),y
$0d:808f  b3 c0		 lda ($c0,s),y
$0d:8091  b4 f7		 ldy $f7,x
$0d:8093  b4 82		 ldy $82,x
$0d:8095  b5 b9		 lda $b9,x
$0d:8097  b5 4a		 lda $4a,x
$0d:8099  b6 d2		 ldx $d2,y
$0d:809b  b6 5a		 ldx $5a,y
$0d:809d  b7 7b		 lda [$7b],y
$0d:809f  b7 01		 lda [$01],y
$0d:80a1  c5 80		 cmp $80
$0d:80a3  71 17		 adc ($17),y
$0d:80a5  01 01		 ora ($01,x)
$0d:80a7  dd 80 71	  cmp $7180,x
$0d:80aa  17 01		 ora [$01],y
$0d:80ac  01 f5		 ora ($f5,x)
$0d:80ae  80 71		 bra $8121
$0d:80b0  17 01		 ora [$01],y
$0d:80b2  01 0d		 ora ($0d,x)
$0d:80b4  81 71		 sta ($71,x)
$0d:80b6  17 01		 ora [$01],y
$0d:80b8  01 25		 ora ($25,x)
$0d:80ba  81 71		 sta ($71,x)
$0d:80bc  17 01		 ora [$01],y
$0d:80be  01 3d		 ora ($3d,x)
$0d:80c0  81 71		 sta ($71,x)
$0d:80c2  17 01		 ora [$01],y
$0d:80c4  00 e7		 brk #$e7
$0d:80c6  49 2b 52	  eor #$522b
$0d:80c9  8f 5e 32 73   sta $73325e
$0d:80cd  8f 5e 2b 52   sta $522b5e
$0d:80d1  a5 3d		 lda $3d
$0d:80d3  c6 41		 dec $41
$0d:80d5  0a			asl a
$0d:80d6  4a			lsr a
$0d:80d7  6b			rtl
$0d:80d8  52 0a		 eor ($0a)
$0d:80da  4a			lsr a
$0d:80db  c6 41		 dec $41
$0d:80dd  2b			pld
$0d:80de  52 e7		 eor ($e7)
$0d:80e0  49 2b 52	  eor #$522b
$0d:80e3  8f 5e 32 73   sta $73325e
$0d:80e7  8f 5e c6 41   sta $41c65e
$0d:80eb  a5 3d		 lda $3d
$0d:80ed  c6 41		 dec $41
$0d:80ef  0a			asl a
$0d:80f0  4a			lsr a
$0d:80f1  6b			rtl
$0d:80f2  52 0a		 eor ($0a)
$0d:80f4  4a			lsr a
$0d:80f5  8f 5e 2b 52   sta $522b5e
$0d:80f9  e7 49		 sbc [$49]
$0d:80fb  2b			pld
$0d:80fc  52 8f		 eor ($8f)
$0d:80fe  5e 32 73	  lsr $7332,x
$0d:8101  0a			asl a
$0d:8102  4a			lsr a
$0d:8103  c6 41		 dec $41
$0d:8105  a5 3d		 lda $3d
$0d:8107  c6 41		 dec $41
$0d:8109  0a			asl a
$0d:810a  4a			lsr a
$0d:810b  6b			rtl
$0d:810c  52 32		 eor ($32)
$0d:810e  73 8f		 adc ($8f,s),y
$0d:8110  5e 2b 52	  lsr $522b,x
$0d:8113  e7 49		 sbc [$49]
$0d:8115  2b			pld
$0d:8116  52 8f		 eor ($8f)
$0d:8118  5e 6b 52	  lsr $526b,x
$0d:811b  0a			asl a
$0d:811c  4a			lsr a
$0d:811d  c6 41		 dec $41
$0d:811f  a5 3d		 lda $3d
$0d:8121  c6 41		 dec $41
$0d:8123  0a			asl a
$0d:8124  4a			lsr a
$0d:8125  8f 5e 32 73   sta $73325e
$0d:8129  8f 5e 2b 52   sta $522b5e
$0d:812d  e7 49		 sbc [$49]
$0d:812f  2b			pld
$0d:8130  52 0a		 eor ($0a)
$0d:8132  4a			lsr a
$0d:8133  6b			rtl
$0d:8134  52 0a		 eor ($0a)
$0d:8136  4a			lsr a
$0d:8137  c6 41		 dec $41
$0d:8139  a5 3d		 lda $3d
$0d:813b  c6 41		 dec $41
$0d:813d  2b			pld
$0d:813e  52 8f		 eor ($8f)
$0d:8140  5e 32 73	  lsr $7332,x
$0d:8143  8f 5e 2b 52   sta $522b5e
$0d:8147  e7 49		 sbc [$49]
$0d:8149  c6 41		 dec $41
$0d:814b  0a			asl a
$0d:814c  4a			lsr a
$0d:814d  6b			rtl
$0d:814e  52 0a		 eor ($0a)
$0d:8150  4a			lsr a
$0d:8151  c6 41		 dec $41
$0d:8153  a5 3d		 lda $3d
$0d:8155  01 86		 ora ($86,x)
$0d:8157  81 71		 sta ($71,x)
$0d:8159  17 01		 ora [$01],y
$0d:815b  01 9e		 ora ($9e,x)
$0d:815d  81 71		 sta ($71,x)
$0d:815f  17 01		 ora [$01],y
$0d:8161  01 b6		 ora ($b6,x)
$0d:8163  81 71		 sta ($71,x)
$0d:8165  17 01		 ora [$01],y
$0d:8167  01 ce		 ora ($ce,x)
$0d:8169  81 71		 sta ($71,x)
$0d:816b  17 01		 ora [$01],y
$0d:816d  01 e6		 ora ($e6,x)
$0d:816f  81 71		 sta ($71,x)
$0d:8171  17 01		 ora [$01],y
$0d:8173  01 fe		 ora ($fe,x)
$0d:8175  81 71		 sta ($71,x)
$0d:8177  17 01		 ora [$01],y
$0d:8179  01 16		 ora ($16,x)
$0d:817b  82 71 17	  brl $98ef
$0d:817e  01 01		 ora ($01,x)
$0d:8180  2e 82 71	  rol $7182
$0d:8183  17 01		 ora [$01],y
$0d:8185  00 62		 brk #$62
$0d:8187  28			plp
$0d:8188  c3 3c		 cmp $3c,s
$0d:818a  46 4d		 lsr $4d
$0d:818c  e9 5d ad	  sbc #$ad5d
$0d:818f  72 e9		 adc ($e9)
$0d:8191  5d 46 4d	  eor $4d46,x
$0d:8194  c3 3c		 cmp $3c,s
$0d:8196  ef 4d 73 5e   sbc $5e734d
$0d:819a  f7 6a		 sbc [$6a],y
$0d:819c  73 5e		 adc ($5e,s),y
$0d:819e  c3 3c		 cmp $3c,s
$0d:81a0  62 28 c3	  per $44cb
$0d:81a3  3c 46 4d	  bit $4d46,x
$0d:81a6  e9 5d ad	  sbc #$ad5d
$0d:81a9  72 e9		 adc ($e9)
$0d:81ab  5d 46 4d	  eor $4d46,x
$0d:81ae  73 5e		 adc ($5e,s),y
$0d:81b0  ef 4d 73 5e   sbc $5e734d
$0d:81b4  f7 6a		 sbc [$6a],y
$0d:81b6  46 4d		 lsr $4d
$0d:81b8  c3 3c		 cmp $3c,s
$0d:81ba  62 28 c3	  per $44e5
$0d:81bd  3c 46 4d	  bit $4d46,x
$0d:81c0  e9 5d ad	  sbc #$ad5d
$0d:81c3  72 e9		 adc ($e9)
$0d:81c5  5d f7 6a	  eor $6af7,x
$0d:81c8  73 5e		 adc ($5e,s),y
$0d:81ca  ef 4d 73 5e   sbc $5e734d
$0d:81ce  e9 5d 46	  sbc #$465d
$0d:81d1  4d c3 3c	  eor $3cc3
$0d:81d4  62 28 c3	  per $44ff
$0d:81d7  3c 46 4d	  bit $4d46,x
$0d:81da  e9 5d ad	  sbc #$ad5d
$0d:81dd  72 73		 adc ($73)
$0d:81df  5e f7 6a	  lsr $6af7,x
$0d:81e2  73 5e		 adc ($5e,s),y
$0d:81e4  ef 4d ad 72   sbc $72ad4d
$0d:81e8  e9 5d 46	  sbc #$465d
$0d:81eb  4d c3 3c	  eor $3cc3
$0d:81ee  62 28 c3	  per $4519
$0d:81f1  3c 46 4d	  bit $4d46,x
$0d:81f4  e9 5d ef	  sbc #$ef5d
$0d:81f7  4d 73 5e	  eor $5e73
$0d:81fa  f7 6a		 sbc [$6a],y
$0d:81fc  73 5e		 adc ($5e,s),y
$0d:81fe  e9 5d ad	  sbc #$ad5d
$0d:8201  72 e9		 adc ($e9)
$0d:8203  5d 46 4d	  eor $4d46,x
$0d:8206  c3 3c		 cmp $3c,s
$0d:8208  62 28 c3	  per $4533
$0d:820b  3c 46 4d	  bit $4d46,x
$0d:820e  73 5e		 adc ($5e,s),y
$0d:8210  ef 4d 73 5e   sbc $5e734d
$0d:8214  f7 6a		 sbc [$6a],y
$0d:8216  46 4d		 lsr $4d
$0d:8218  e9 5d ad	  sbc #$ad5d
$0d:821b  72 e9		 adc ($e9)
$0d:821d  5d 46 4d	  eor $4d46,x
$0d:8220  c3 3c		 cmp $3c,s
$0d:8222  62 28 c3	  per $454d
$0d:8225  3c f7 6a	  bit $6af7,x
$0d:8228  73 5e		 adc ($5e,s),y
$0d:822a  ef 4d 73 5e   sbc $5e734d
$0d:822e  c3 3c		 cmp $3c,s
$0d:8230  46 4d		 lsr $4d
$0d:8232  e9 5d ad	  sbc #$ad5d
$0d:8235  72 e9		 adc ($e9)
$0d:8237  5d 46 4d	  eor $4d46,x
$0d:823a  c3 3c		 cmp $3c,s
$0d:823c  62 28 73	  per $f567
$0d:823f  5e f7 6a	  lsr $6af7,x
$0d:8242  73 5e		 adc ($5e,s),y
$0d:8244  ef 4d 01 77   sbc $77014d
$0d:8248  82 68 0f	  brl $91b3
$0d:824b  00 01		 brk #$01
$0d:824d  87 82		 sta [$82]
$0d:824f  68			pla
$0d:8250  0f 00 01 97   ora $970100
$0d:8254  82 68 0f	  brl $91bf
$0d:8257  00 01		 brk #$01
$0d:8259  a7 82		 lda [$82]
$0d:825b  68			pla
$0d:825c  0f 00 01 b7   ora $b70100
$0d:8260  82 68 0f	  brl $91cb
$0d:8263  00 01		 brk #$01
$0d:8265  c7 82		 cmp [$82]
$0d:8267  68			pla
$0d:8268  0f 00 01 d7   ora $d70100
$0d:826c  82 68 0f	  brl $91d7
$0d:826f  00 01		 brk #$01
$0d:8271  e7 82		 sbc [$82]
$0d:8273  68			pla
$0d:8274  0f 00 00 8c   ora $8c0000
$0d:8278  08			php
$0d:8279  d0 0c		 bne $8287
$0d:827b  98			tya
$0d:827c  01 98		 ora ($98,x)
$0d:827e  01 98		 ora ($98,x)
$0d:8280  01 fb		 ora ($fb,x)
$0d:8282  19 d0 0c	  ora $0cd0,y
$0d:8285  62 08 62	  per $e490
$0d:8288  08			php
$0d:8289  8c 08 d0	  sty $d008
$0d:828c  0c 98 01	  tsb $0198
$0d:828f  98			tya
$0d:8290  01 98		 ora ($98,x)
$0d:8292  01 fb		 ora ($fb,x)
$0d:8294  19 d0 0c	  ora $0cd0,y
$0d:8297  d0 0c		 bne $82a5
$0d:8299  62 08 8c	  per $0ea4
$0d:829c  08			php
$0d:829d  d0 0c		 bne $82ab
$0d:829f  98			tya
$0d:82a0  01 98		 ora ($98,x)
$0d:82a2  01 98		 ora ($98,x)
$0d:82a4  01 fb		 ora ($fb,x)
$0d:82a6  19 fb 19	  ora $19fb,y
$0d:82a9  d0 0c		 bne $82b7
$0d:82ab  62 08 8c	  per $0eb6
$0d:82ae  08			php
$0d:82af  d0 0c		 bne $82bd
$0d:82b1  98			tya
$0d:82b2  01 98		 ora ($98,x)
$0d:82b4  01 98		 ora ($98,x)
$0d:82b6  01 98		 ora ($98,x)
$0d:82b8  01 fb		 ora ($fb,x)
$0d:82ba  19 d0 0c	  ora $0cd0,y
$0d:82bd  62 08 8c	  per $0ec8
$0d:82c0  08			php
$0d:82c1  d0 0c		 bne $82cf
$0d:82c3  98			tya
$0d:82c4  01 98		 ora ($98,x)
$0d:82c6  01 98		 ora ($98,x)
$0d:82c8  01 98		 ora ($98,x)
$0d:82ca  01 fb		 ora ($fb,x)
$0d:82cc  19 d0 0c	  ora $0cd0,y
$0d:82cf  62 08 8c	  per $0eda
$0d:82d2  08			php
$0d:82d3  d0 0c		 bne $82e1
$0d:82d5  98			tya
$0d:82d6  01 98		 ora ($98,x)
$0d:82d8  01 98		 ora ($98,x)
$0d:82da  01 98		 ora ($98,x)
$0d:82dc  01 fb		 ora ($fb,x)
$0d:82de  19 d0 0c	  ora $0cd0,y
$0d:82e1  62 08 8c	  per $0eec
$0d:82e4  08			php
$0d:82e5  d0 0c		 bne $82f3
$0d:82e7  d0 0c		 bne $82f5
$0d:82e9  98			tya
$0d:82ea  01 98		 ora ($98,x)
$0d:82ec  01 98		 ora ($98,x)
$0d:82ee  01 fb		 ora ($fb,x)
$0d:82f0  19 d0 0c	  ora $0cd0,y
$0d:82f3  62 08 8c	  per $0efe
$0d:82f6  08			php
$0d:82f7  02 1c		 cop #$1c
$0d:82f9  83 11		 sta $11,s
$0d:82fb  11 02		 ora ($02),y
$0d:82fd  02 40		 cop #$40
$0d:82ff  83 11		 sta $11,s
$0d:8301  11 01		 ora ($01),y
$0d:8303  02 64		 cop #$64
$0d:8305  83 11		 sta $11,s
$0d:8307  11 00		 ora ($00),y
$0d:8309  02 88		 cop #$88
$0d:830b  83 11		 sta $11,s
$0d:830d  11 00		 ora ($00),y
$0d:830f  02 ac		 cop #$ac
$0d:8311  83 11		 sta $11,s
$0d:8313  11 01		 ora ($01),y
$0d:8315  02 d0		 cop #$d0
$0d:8317  83 11		 sta $11,s
$0d:8319  11 02		 ora ($02),y
$0d:831b  00 0c		 brk #$0c
$0d:831d  00 92		 brk #$92
$0d:831f  10 38		 bpl $8359
$0d:8321  25 fc		 and $fc
$0d:8323  3d 9e 52	  and $529e,x
$0d:8326  1f 63 80 00   ora $008063,x
$0d:832a  c1 04		 cmp ($04,x)
$0d:832c  c2 08		 rep #$08
$0d:832e  1f 63 0c 00   ora $000c63,x
$0d:8332  92 10		 sta ($10)
$0d:8334  38			sec
$0d:8335  25 fc		 and $fc
$0d:8337  3d 9e 52	  and $529e,x
$0d:833a  e1 04		 sbc ($04,x)
$0d:833c  02 09		 cop #$09
$0d:833e  65 11		 adc $11
$0d:8340  9e 52 1f	  stz $1f52,x
$0d:8343  63 0c		 adc $0c,s
$0d:8345  00 92		 brk #$92
$0d:8347  10 38		 bpl $8381
$0d:8349  25 fc		 and $fc
$0d:834b  3d 02 09	  and $0902,x
$0d:834e  44 0d c8	  mvp $c8,$0d
$0d:8351  19 fc 3d	  ora $3dfc,y
$0d:8354  9e 52 1f	  stz $1f52,x
$0d:8357  63 0c		 adc $0c,s
$0d:8359  00 92		 brk #$92
$0d:835b  10 38		 bpl $8395
$0d:835d  25 44		 and $44
$0d:835f  0d a7 15	  ora $15a7
$0d:8362  2b			pld
$0d:8363  26 38		 rol $38
$0d:8365  25 fc		 and $fc
$0d:8367  3d 9e 52	  and $529e,x
$0d:836a  1f 63 0c 00   ora $000c63,x
$0d:836e  92 10		 sta ($10)
$0d:8370  65 11		 adc $11
$0d:8372  09 1e 8e	  ora #$8e1e
$0d:8375  2e 92 10	  rol $1092
$0d:8378  38			sec
$0d:8379  25 fc		 and $fc
$0d:837b  3d 9e 52	  and $529e,x
$0d:837e  1f 63 0c 00   ora $000c63,x
$0d:8382  a7 15		 lda [$15]
$0d:8384  8e 32 12	  stx $1232
$0d:8387  3b			tsc
$0d:8388  0c 00 92	  tsb $9200
$0d:838b  10 38		 bpl $83c5
$0d:838d  25 fc		 and $fc
$0d:838f  3d 9e 52	  and $529e,x
$0d:8392  1f 63 c8 19   ora $19c863,x
$0d:8396  12 33		 ora ($33)
$0d:8398  b8			clv
$0d:8399  57 92		 eor [$92],y
$0d:839b  10 38		 bpl $83d5
$0d:839d  25 fc		 and $fc
$0d:839f  3d 9e 52	  and $529e,x
$0d:83a2  1f 63 0c 00   ora $000c63,x
$0d:83a6  a7 15		 lda [$15]
$0d:83a8  6c 2a f0	  jmp ($f02a)
$0d:83ab  36 38		 rol $38,x
$0d:83ad  25 fc		 and $fc
$0d:83af  3d 9e 52	  and $529e,x
$0d:83b2  1f 63 0c 00   ora $000c63,x
$0d:83b6  92 10		 sta ($10)
$0d:83b8  65 11		 adc $11
$0d:83ba  09 1e 8e	  ora #$8e1e
$0d:83bd  2e fc 3d	  rol $3dfc
$0d:83c0  9e 52 1f	  stz $1f52,x
$0d:83c3  63 0c		 adc $0c,s
$0d:83c5  00 92		 brk #$92
$0d:83c7  10 38		 bpl $8401
$0d:83c9  25 44		 and $44
$0d:83cb  0d a7 15	  ora $15a7
$0d:83ce  2b			pld
$0d:83cf  26 9e		 rol $9e
$0d:83d1  52 1f		 eor ($1f)
$0d:83d3  63 0c		 adc $0c,s
$0d:83d5  00 92		 brk #$92
$0d:83d7  10 38		 bpl $8411
$0d:83d9  25 fc		 and $fc
$0d:83db  3d 02 09	  and $0902,x
$0d:83de  44 0d c8	  mvp $c8,$0d
$0d:83e1  19 1f 63	  ora $631f,y
$0d:83e4  0c 00 92	  tsb $9200
$0d:83e7  10 38		 bpl $8421
$0d:83e9  25 fc		 and $fc
$0d:83eb  3d 9e 52	  and $529e,x
$0d:83ee  e1 04		 sbc ($04,x)
$0d:83f0  02 09		 cop #$09
$0d:83f2  65 11		 adc $11
$0d:83f4  01 25		 ora ($25,x)
$0d:83f6  84 21		 sty $21
$0d:83f8  0f 02 01 35   ora $350102
$0d:83fc  84 21		 sty $21
$0d:83fe  0f 02 01 45   ora $450102
$0d:8402  84 21		 sty $21
$0d:8404  0f 02 01 55   ora $550102
$0d:8408  84 21		 sty $21
$0d:840a  0f 02 01 65   ora $650102
$0d:840e  84 21		 sty $21
$0d:8410  0f 02 01 75   ora $750102
$0d:8414  84 21		 sty $21
$0d:8416  0f 02 01 85   ora $850102
$0d:841a  84 21		 sty $21
$0d:841c  0f 02 01 95   ora $950102
$0d:8420  84 21		 sty $21
$0d:8422  0f 02 00 87   ora $870002
$0d:8426  3d 05 31	  and $3105,x
$0d:8429  a3 28		 lda $28,s
$0d:842b  80 20		 bra $844d
$0d:842d  60			rts
$0d:842e  1c a0 24	  trb $24a0
$0d:8431  e3 2c		 sbc $2c,s
$0d:8433  26 35		 rol $35
$0d:8435  26 35		 rol $35
$0d:8437  87 3d		 sta [$3d]
$0d:8439  05 31		 ora $31
$0d:843b  a3 28		 lda $28,s
$0d:843d  80 20		 bra $845f
$0d:843f  60			rts
$0d:8440  1c a0 24	  trb $24a0
$0d:8443  e3 2c		 sbc $2c,s
$0d:8445  e3 2c		 sbc $2c,s
$0d:8447  26 35		 rol $35
$0d:8449  87 3d		 sta [$3d]
$0d:844b  05 31		 ora $31
$0d:844d  a3 28		 lda $28,s
$0d:844f  80 20		 bra $8471
$0d:8451  60			rts
$0d:8452  1c a0 24	  trb $24a0
$0d:8455  a0 24 e3	  ldy #$e324
$0d:8458  2c 26 35	  bit $3526
$0d:845b  87 3d		 sta [$3d]
$0d:845d  05 31		 ora $31
$0d:845f  a3 28		 lda $28,s
$0d:8461  80 20		 bra $8483
$0d:8463  60			rts
$0d:8464  1c 60 1c	  trb $1c60
$0d:8467  a0 24 e3	  ldy #$e324
$0d:846a  2c 26 35	  bit $3526
$0d:846d  87 3d		 sta [$3d]
$0d:846f  05 31		 ora $31
$0d:8471  a3 28		 lda $28,s
$0d:8473  80 20		 bra $8495
$0d:8475  80 20		 bra $8497
$0d:8477  60			rts
$0d:8478  1c a0 24	  trb $24a0
$0d:847b  e3 2c		 sbc $2c,s
$0d:847d  26 35		 rol $35
$0d:847f  87 3d		 sta [$3d]
$0d:8481  05 31		 ora $31
$0d:8483  a3 28		 lda $28,s
$0d:8485  a3 28		 lda $28,s
$0d:8487  80 20		 bra $84a9
$0d:8489  60			rts
$0d:848a  1c a0 24	  trb $24a0
$0d:848d  e3 2c		 sbc $2c,s
$0d:848f  26 35		 rol $35
$0d:8491  87 3d		 sta [$3d]
$0d:8493  05 31		 ora $31
$0d:8495  05 31		 ora $31
$0d:8497  a3 28		 lda $28,s
$0d:8499  80 20		 bra $84bb
$0d:849b  60			rts
$0d:849c  1c a0 24	  trb $24a0
$0d:849f  e3 2c		 sbc $2c,s
$0d:84a1  26 35		 rol $35
$0d:84a3  87 3d		 sta [$3d]
$0d:84a5  01 d6		 ora ($d6,x)
$0d:84a7  84 71		 sty $71
$0d:84a9  0f 00 01 e6   ora $e60100
$0d:84ad  84 71		 sty $71
$0d:84af  0f 00 01 f6   ora $f60100
$0d:84b3  84 71		 sty $71
$0d:84b5  0f 00 01 06   ora $060100
$0d:84b9  85 71		 sta $71
$0d:84bb  0f 00 01 16   ora $160100
$0d:84bf  85 71		 sta $71
$0d:84c1  0f 00 01 26   ora $260100
$0d:84c5  85 71		 sta $71
$0d:84c7  0f 00 01 36   ora $360100
$0d:84cb  85 71		 sta $71
$0d:84cd  0f 00 01 46   ora $460100
$0d:84d1  85 71		 sta $71
$0d:84d3  0f 00 00 12   ora $120000
$0d:84d7  05 96		 ora $96
$0d:84d9  09 dd 12	  ora #$12dd
$0d:84dc  be 3b de	  ldx $de3b,y
$0d:84df  5b			tcd
$0d:84e0  dd 12 96	  cmp $9612,x
$0d:84e3  09 6c 04	  ora #$046c
$0d:84e6  6c 04 12	  jmp ($1204)
$0d:84e9  05 96		 ora $96
$0d:84eb  09 dd 12	  ora #$12dd
$0d:84ee  be 3b de	  ldx $de3b,y
$0d:84f1  5b			tcd
$0d:84f2  dd 12 96	  cmp $9612,x
$0d:84f5  09 96 09	  ora #$0996
$0d:84f8  6c 04 12	  jmp ($1204)
$0d:84fb  05 96		 ora $96
$0d:84fd  09 dd 12	  ora #$12dd
$0d:8500  be 3b de	  ldx $de3b,y
$0d:8503  5b			tcd
$0d:8504  dd 12 dd	  cmp $dd12,x
$0d:8507  12 96		 ora ($96)
$0d:8509  09 6c 04	  ora #$046c
$0d:850c  12 05		 ora ($05)
$0d:850e  96 09		 stx $09,y
$0d:8510  dd 12 be	  cmp $be12,x
$0d:8513  3b			tsc
$0d:8514  de 5b de	  dec $de5b,x
$0d:8517  5b			tcd
$0d:8518  dd 12 96	  cmp $9612,x
$0d:851b  09 6c 04	  ora #$046c
$0d:851e  12 05		 ora ($05)
$0d:8520  96 09		 stx $09,y
$0d:8522  dd 12 be	  cmp $be12,x
$0d:8525  3b			tsc
$0d:8526  be 3b de	  ldx $de3b,y
$0d:8529  5b			tcd
$0d:852a  dd 12 96	  cmp $9612,x
$0d:852d  09 6c 04	  ora #$046c
$0d:8530  12 05		 ora ($05)
$0d:8532  96 09		 stx $09,y
$0d:8534  dd 12 dd	  cmp $dd12,x
$0d:8537  12 be		 ora ($be)
$0d:8539  3b			tsc
$0d:853a  de 5b dd	  dec $dd5b,x
$0d:853d  12 96		 ora ($96)
$0d:853f  09 6c 04	  ora #$046c
$0d:8542  12 05		 ora ($05)
$0d:8544  96 09		 stx $09,y
$0d:8546  96 09		 stx $09,y
$0d:8548  dd 12 be	  cmp $be12,x
$0d:854b  3b			tsc
$0d:854c  de 5b dd	  dec $dd5b,x
$0d:854f  12 96		 ora ($96)
$0d:8551  09 6c 04	  ora #$046c
$0d:8554  12 05		 ora ($05)
$0d:8556  01 87		 ora ($87,x)
$0d:8558  85 71		 sta $71
$0d:855a  0f 00 01 97   ora $970100
$0d:855e  85 71		 sta $71
$0d:8560  0f 00 01 a7   ora $a70100
$0d:8564  85 71		 sta $71
$0d:8566  0f 00 01 b7   ora $b70100
$0d:856a  85 71		 sta $71
$0d:856c  0f 00 01 c7   ora $c70100
$0d:8570  85 71		 sta $71
$0d:8572  0f 00 01 d7   ora $d70100
$0d:8576  85 71		 sta $71
$0d:8578  0f 00 01 e7   ora $e70100
$0d:857c  85 71		 sta $71
$0d:857e  0f 00 01 f7   ora $f70100
$0d:8582  85 71		 sta $71
$0d:8584  0f 00 00 6c   ora $6c0000
$0d:8588  04 96		 tsb $96
$0d:858a  09 dd 12	  ora #$12dd
$0d:858d  de 5b be	  dec $be5b,x
$0d:8590  3b			tsc
$0d:8591  dd 12 96	  cmp $9612,x
$0d:8594  09 12 05	  ora #$0512
$0d:8597  96 09		 stx $09,y
$0d:8599  dd 12 de	  cmp $de12,x
$0d:859c  5b			tcd
$0d:859d  be 3b dd	  ldx $dd3b,y
$0d:85a0  12 96		 ora ($96)
$0d:85a2  09 12 05	  ora #$0512
$0d:85a5  6c 04 dd	  jmp ($dd04)
$0d:85a8  12 de		 ora ($de)
$0d:85aa  5b			tcd
$0d:85ab  be 3b dd	  ldx $dd3b,y
$0d:85ae  12 96		 ora ($96)
$0d:85b0  09 12 05	  ora #$0512
$0d:85b3  6c 04 96	  jmp ($9604)
$0d:85b6  09 de 5b	  ora #$5bde
$0d:85b9  be 3b dd	  ldx $dd3b,y
$0d:85bc  12 96		 ora ($96)
$0d:85be  09 12 05	  ora #$0512
$0d:85c1  6c 04 96	  jmp ($9604)
$0d:85c4  09 dd 12	  ora #$12dd
$0d:85c7  be 3b dd	  ldx $dd3b,y
$0d:85ca  12 96		 ora ($96)
$0d:85cc  09 12 05	  ora #$0512
$0d:85cf  6c 04 96	  jmp ($9604)
$0d:85d2  09 dd 12	  ora #$12dd
$0d:85d5  de 5b dd	  dec $dd5b,x
$0d:85d8  12 96		 ora ($96)
$0d:85da  09 12 05	  ora #$0512
$0d:85dd  6c 04 96	  jmp ($9604)
$0d:85e0  09 dd 12	  ora #$12dd
$0d:85e3  de 5b be	  dec $be5b,x
$0d:85e6  3b			tsc
$0d:85e7  96 09		 stx $09,y
$0d:85e9  12 05		 ora ($05)
$0d:85eb  6c 04 96	  jmp ($9604)
$0d:85ee  09 dd 12	  ora #$12dd
$0d:85f1  de 5b be	  dec $be5b,x
$0d:85f4  3b			tsc
$0d:85f5  dd 12 12	  cmp $1212,x
$0d:85f8  05 6c		 ora $6c
$0d:85fa  04 96		 tsb $96
$0d:85fc  09 dd 12	  ora #$12dd
$0d:85ff  de 5b be	  dec $be5b,x
$0d:8602  3b			tsc
$0d:8603  dd 12 96	  cmp $9612,x
$0d:8606  09 01 38	  ora #$3801
$0d:8609  86 78		 stx $78
$0d:860b  0f 06 01 48   ora $480106
$0d:860f  86 78		 stx $78
$0d:8611  0f 04 01 58   ora $580104
$0d:8615  86 78		 stx $78
$0d:8617  0f 03 01 68   ora $680103
$0d:861b  86 78		 stx $78
$0d:861d  0f 04 01 78   ora $780104
$0d:8621  86 78		 stx $78
$0d:8623  0f 06 01 88   ora $880106
$0d:8627  86 78		 stx $78
$0d:8629  0f 04 01 98   ora $980104
$0d:862d  86 78		 stx $78
$0d:862f  0f 03 01 a8   ora $a80103
$0d:8633  86 78		 stx $78
$0d:8635  0f 04 00 a1   ora $a10004
$0d:8639  20 a1 20	  jsr $20a1
$0d:863c  e3 28		 sbc $28,s
$0d:863e  25 31		 and $31
$0d:8640  86 3d		 stx $3d
$0d:8642  e3 28		 sbc $28,s
$0d:8644  25 31		 and $31
$0d:8646  86 3d		 stx $3d
$0d:8648  81 1c		 sta ($1c,x)
$0d:864a  c1 24		 cmp ($24,x)
$0d:864c  03 2d		 ora $2d,s
$0d:864e  45 35		 eor $35
$0d:8650  a6 41		 ldx $41
$0d:8652  c3 24		 cmp $24,s
$0d:8654  04 2d		 tsb $2d
$0d:8656  66 39		 ror $39
$0d:8658  80 1c		 bra $8676
$0d:865a  c1 28		 cmp ($28,x)
$0d:865c  03 31		 ora $31,s
$0d:865e  45 39		 eor $39
$0d:8660  66 35		 ror $35
$0d:8662  a1 20		 lda ($20,x)
$0d:8664  e3 28		 sbc $28,s
$0d:8666  46 35		 lsr $35
$0d:8668  81 1c		 sta ($1c,x)
$0d:866a  c1 24		 cmp ($24,x)
$0d:866c  03 2d		 ora $2d,s
$0d:866e  45 35		 eor $35
$0d:8670  a6 41		 ldx $41
$0d:8672  c3 24		 cmp $24,s
$0d:8674  04 2d		 tsb $2d
$0d:8676  66 39		 ror $39
$0d:8678  a1 20		 lda ($20,x)
$0d:867a  a1 20		 lda ($20,x)
$0d:867c  e3 28		 sbc $28,s
$0d:867e  25 31		 and $31
$0d:8680  86 3d		 stx $3d
$0d:8682  e3 28		 sbc $28,s
$0d:8684  25 31		 and $31
$0d:8686  86 3d		 stx $3d
$0d:8688  c1 24		 cmp ($24,x)
$0d:868a  81 1c		 sta ($1c,x)
$0d:868c  c3 24		 cmp $24,s
$0d:868e  04 2d		 tsb $2d
$0d:8690  66 39		 ror $39
$0d:8692  03 2d		 ora $2d,s
$0d:8694  45 35		 eor $35
$0d:8696  a6 41		 ldx $41
$0d:8698  c1 28		 cmp ($28,x)
$0d:869a  80 1c		 bra $86b8
$0d:869c  a1 20		 lda ($20,x)
$0d:869e  e3 28		 sbc $28,s
$0d:86a0  46 35		 lsr $35
$0d:86a2  03 31		 ora $31,s
$0d:86a4  45 39		 eor $39
$0d:86a6  66 35		 ror $35
$0d:86a8  c1 24		 cmp ($24,x)
$0d:86aa  81 1c		 sta ($1c,x)
$0d:86ac  c3 24		 cmp $24,s
$0d:86ae  04 2d		 tsb $2d
$0d:86b0  66 39		 ror $39
$0d:86b2  03 2d		 ora $2d,s
$0d:86b4  45 35		 eor $35
$0d:86b6  a6 41		 ldx $41
$0d:86b8  01 d1		 ora ($d1,x)
$0d:86ba  86 71		 stx $71
$0d:86bc  07 08		 ora [$08]
$0d:86be  01 d9		 ora ($d9,x)
$0d:86c0  86 71		 stx $71
$0d:86c2  07 07		 ora [$07]
$0d:86c4  01 e1		 ora ($e1,x)
$0d:86c6  86 71		 stx $71
$0d:86c8  07 06		 ora [$06]
$0d:86ca  01 e9		 ora ($e9,x)
$0d:86cc  86 71		 stx $71
$0d:86ce  07 07		 ora [$07]
$0d:86d0  00 42		 brk #$42
$0d:86d2  19 c6 29	  ora $29c6,y
$0d:86d5  8a			txa
$0d:86d6  42 50		 wdm #$50
$0d:86d8  5b			tcd
$0d:86d9  50 5b		 bvc $8736
$0d:86db  42 19		 wdm #$19
$0d:86dd  c6 29		 dec $29
$0d:86df  8a			txa
$0d:86e0  42 8a		 wdm #$8a
$0d:86e2  42 50		 wdm #$50
$0d:86e4  5b			tcd
$0d:86e5  42 19		 wdm #$19
$0d:86e7  c6 29		 dec $29
$0d:86e9  c6 29		 dec $29
$0d:86eb  8a			txa
$0d:86ec  42 50		 wdm #$50
$0d:86ee  5b			tcd
$0d:86ef  42 19		 wdm #$19
$0d:86f1  01 16		 ora ($16,x)
$0d:86f3  87 31		 sta [$31]
$0d:86f5  1b			tcs
$0d:86f6  02 01		 cop #$01
$0d:86f8  32 87		 and ($87)
$0d:86fa  31 1b		 and ($1b),y
$0d:86fc  02 01		 cop #$01
$0d:86fe  4e 87 31	  lsr $3187
$0d:8701  1b			tcs
$0d:8702  02 01		 cop #$01
$0d:8704  6a			ror a
$0d:8705  87 31		 sta [$31]
$0d:8707  1b			tcs
$0d:8708  02 01		 cop #$01
$0d:870a  86 87		 stx $87
$0d:870c  31 1b		 and ($1b),y
$0d:870e  02 01		 cop #$01
$0d:8710  a2 87 31	  ldx #$3187
$0d:8713  1b			tcs
$0d:8714  02 00		 cop #$00
$0d:8716  88			dey
$0d:8717  28			plp
$0d:8718  88			dey
$0d:8719  28			plp
$0d:871a  ca			dex
$0d:871b  30 06		 bmi $8723
$0d:871d  19 69 25	  ora $2569,y
$0d:8720  ca			dex
$0d:8721  30 06		 bmi $8729
$0d:8723  19 69 25	  ora $2569,y
$0d:8726  47 25		 eor [$25]
$0d:8728  88			dey
$0d:8729  29 ca 31	  and #$31ca
$0d:872c  0d 3e c9	  ora $c93e
$0d:872f  31 87		 and ($87),y
$0d:8731  29 68 24	  and #$2468
$0d:8734  a8			tay
$0d:8735  2c ea 34	  bit $34ea
$0d:8738  27 1d		 and [$1d]
$0d:873a  8a			txa
$0d:873b  29 aa 2c	  and #$2caa
$0d:873e  e5 14		 sbc $14
$0d:8740  48			pha
$0d:8741  21 87		 and ($87,x)
$0d:8743  29 47 25	  and #$2547
$0d:8746  88			dey
$0d:8747  29 ca 31	  and #$31ca
$0d:874a  0d 3e c9	  ora $c93e
$0d:874d  31 67		 and ($67),y
$0d:874f  24 a8		 bit $a8
$0d:8751  30 ea		 bmi $873d
$0d:8753  38			sec
$0d:8754  27 1d		 and [$1d]
$0d:8756  48			pha
$0d:8757  21 88		 and ($88,x)
$0d:8759  28			plp
$0d:875a  c4 10		 cpy $10
$0d:875c  27 1d		 and [$1d]
$0d:875e  c9 31 87	  cmp #$8731
$0d:8761  29 47 25	  and #$2547
$0d:8764  88			dey
$0d:8765  29 ca 31	  and #$31ca
$0d:8768  0d 3e 68	  ora $683e
$0d:876b  24 a8		 bit $a8
$0d:876d  2c ea 34	  bit $34ea
$0d:8770  27 1d		 and [$1d]
$0d:8772  8a			txa
$0d:8773  29 aa 2c	  and #$2caa
$0d:8776  e5 14		 sbc $14
$0d:8778  48			pha
$0d:8779  21 0d		 and ($0d,x)
$0d:877b  3e c9 31	  rol $31c9,x
$0d:877e  87 29		 sta [$29]
$0d:8780  47 25		 eor [$25]
$0d:8782  88			dey
$0d:8783  29 ca 31	  and #$31ca
$0d:8786  88			dey
$0d:8787  28			plp
$0d:8788  88			dey
$0d:8789  28			plp
$0d:878a  ca			dex
$0d:878b  30 06		 bmi $8793
$0d:878d  19 69 25	  ora $2569,y
$0d:8790  ca			dex
$0d:8791  30 06		 bmi $8799
$0d:8793  19 69 25	  ora $2569,y
$0d:8796  ca			dex
$0d:8797  31 0d		 and ($0d),y
$0d:8799  3e c9 31	  rol $31c9,x
$0d:879c  87 29		 sta [$29]
$0d:879e  47 25		 eor [$25]
$0d:87a0  88			dey
$0d:87a1  29 a8 2c	  and #$2ca8
$0d:87a4  68			pla
$0d:87a5  24 aa		 bit $aa
$0d:87a7  2c e5 14	  bit $14e5
$0d:87aa  48			pha
$0d:87ab  21 ea		 and ($ea,x)
$0d:87ad  34 27		 bit $27,x
$0d:87af  1d 8a 29	  ora $298a,x
$0d:87b2  88			dey
$0d:87b3  29 ca 31	  and #$31ca
$0d:87b6  0d 3e c9	  ora $c93e
$0d:87b9  31 87		 and ($87),y
$0d:87bb  29 47 25	  and #$2547
$0d:87be  01 ef		 ora ($ef,x)
$0d:87c0  87 31		 sta [$31]
$0d:87c2  1d 00 01	  ora $0100,x
$0d:87c5  0d 88 31	  ora $3188
$0d:87c8  1d 01 01	  ora $0101,x
$0d:87cb  2b			pld
$0d:87cc  88			dey
$0d:87cd  31 1d		 and ($1d),y
$0d:87cf  01 01		 ora ($01,x)
$0d:87d1  49 88 31	  eor #$3188
$0d:87d4  1d 01 01	  ora $0101,x
$0d:87d7  67 88		 adc [$88]
$0d:87d9  31 1d		 and ($1d),y
$0d:87db  01 01		 ora ($01,x)
$0d:87dd  85 88		 sta $88
$0d:87df  31 1d		 and ($1d),y
$0d:87e1  01 01		 ora ($01,x)
$0d:87e3  a3 88		 lda $88,s
$0d:87e5  31 1d		 and ($1d),y
$0d:87e7  01 01		 ora ($01,x)
$0d:87e9  c1 88		 cmp ($88,x)
$0d:87eb  31 1d		 and ($1d),y
$0d:87ed  00 00		 brk #$00
$0d:87ef  21 0c		 and ($0c,x)
$0d:87f1  63 18		 adc $18,s
$0d:87f3  c5 24		 cmp $24
$0d:87f5  48			pha
$0d:87f6  35 eb		 and $eb,x
$0d:87f8  49 6e 5a	  eor #$5a6e
$0d:87fb  d1 6a		 cmp ($6a),y
$0d:87fd  63 18		 adc $18,s
$0d:87ff  c6 20		 dec $20
$0d:8801  4a			lsr a
$0d:8802  29 ce 31	  and #$31ce
$0d:8805  52 46		 eor ($46)
$0d:8807  d6 56		 dec $56,x
$0d:8809  42 08		 wdm #$08
$0d:880b  bd 77 a7	  lda $a777,x
$0d:880e  1c c8 24	  trb $24c8
$0d:8811  2a			rol a
$0d:8812  31 ad		 and ($ad),y
$0d:8814  3d 30 4e	  and $4e30,x
$0d:8817  91 5a		 sta ($5a),y
$0d:8819  f6 6a		 inc $6a,x
$0d:881b  6c 14 ee	  jmp ($ee14)
$0d:881e  20 95 29	  jsr $2995
$0d:8821  f3 31		 sbc ($31,s),y
$0d:8823  97 42		 sta [$42],y
$0d:8825  19 57 4c	  ora $4c57,y
$0d:8828  08			php
$0d:8829  bd 77 0c	  lda $0c77,x
$0d:882c  29 2c 2d	  and #$2d2c
$0d:882f  8e 39 f2	  stx $f239
$0d:8832  49 54 52	  eor #$5254
$0d:8835  b7 62		 lda [$62],y
$0d:8837  1a			inc a
$0d:8838  6f 95 10 38   adc $381095
$0d:883c  1d dc 29	  ora $29dc,x
$0d:883f  5b			tcd
$0d:8840  32 db		 and ($db)
$0d:8842  3e 5c 53	  rol $535c,x
$0d:8845  54 08 de	  mvn $de,$08
$0d:8848  7b			tdc
$0d:8849  4e 31 90	  lsr $9031
$0d:884c  39 d1 41	  and $41d1,y
$0d:884f  56 52		 lsr $52,x
$0d:8851  98			tya
$0d:8852  5a			phy
$0d:8853  fb			xce
$0d:8854  66 5e		 ror $5e
$0d:8856  73 bf		 adc ($bf,s),y
$0d:8858  0c 7f 19	  tsb $197f
$0d:885b  ff 25 7f 2e   sbc $2e7f25,x
$0d:885f  1f 37 bf 4f   ora $4fbf37,x
$0d:8863  59 08 ff	  eor $ff08,y
$0d:8866  7f 0b 29 4d   adc $4d290b,x
$0d:886a  31 b0		 and ($b0),y
$0d:886c  3d 13 4a	  and $4a13,x
$0d:886f  75 56		 adc $56,x
$0d:8871  d8			cld
$0d:8872  62 3b 6f	  per $f7b0
$0d:8875  99 10 5a	  sta $5a10,y
$0d:8878  1d da 29	  ora $29da,x
$0d:887b  5b			tcd
$0d:887c  32 dc		 and ($dc)
$0d:887e  3a			dec a
$0d:887f  9d 53 55	  sta $5553,x
$0d:8882  08			php
$0d:8883  de 7b a7	  dec $a77b,x
$0d:8886  1c 0a 29	  trb $290a
$0d:8889  4c 35 cf	  jmp $cf35
$0d:888c  41 31		 eor ($31,x)
$0d:888e  4e b4 5e	  lsr $5eb4
$0d:8891  17 6f		 ora [$6f],y
$0d:8893  93 14		 sta ($14,s),y
$0d:8895  35 1d		 and $1d,x
$0d:8897  95 29		 sta $29,x
$0d:8899  17 32		 ora [$32],y
$0d:889b  b8			clv
$0d:889c  3e 3a 53	  rol $533a,x
$0d:889f  4e 08 bd	  lsr $bd08
$0d:88a2  77 85		 adc [$85],y
$0d:88a4  18			clc
$0d:88a5  c8			iny
$0d:88a6  24 09		 bit $09
$0d:88a8  2d 8b 39	  and $398b
$0d:88ab  0d 4a 91	  ora $914a
$0d:88ae  5a			phy
$0d:88af  f5 6a		 sbc $6a,x
$0d:88b1  6c 14 ee	  jmp ($ee14)
$0d:88b4  20 71 29	  jsr $2971
$0d:88b7  f2 31		 sbc ($31)
$0d:88b9  96 42		 stx $42,y
$0d:88bb  19 57 4b	  ora $4b57,y
$0d:88be  08			php
$0d:88bf  bd 77 21	  lda $2177,x
$0d:88c2  0c 63 18	  tsb $1863
$0d:88c5  c5 24		 cmp $24
$0d:88c7  48			pha
$0d:88c8  35 eb		 and $eb,x
$0d:88ca  49 6e 5a	  eor #$5a6e
$0d:88cd  d1 6a		 cmp ($6a),y
$0d:88cf  63 18		 adc $18,s
$0d:88d1  c6 20		 dec $20
$0d:88d3  4a			lsr a
$0d:88d4  29 ce 31	  and #$31ce
$0d:88d7  52 46		 eor ($46)
$0d:88d9  d6 56		 dec $56,x
$0d:88db  42 08		 wdm #$08
$0d:88dd  bd 77 01	  lda $0177,x
$0d:88e0  3a			dec a
$0d:88e1  89 31 1d	  bit #$1d31
$0d:88e4  0f 01 58 89   ora $895801
$0d:88e8  31 1d		 and ($1d),y
$0d:88ea  06 01		 asl $01
$0d:88ec  76 89		 ror $89,x
$0d:88ee  31 1d		 and ($1d),y
$0d:88f0  07 01		 ora [$01]
$0d:88f2  94 89		 sty $89,x
$0d:88f4  31 1d		 and ($1d),y
$0d:88f6  08			php
$0d:88f7  01 b2		 ora ($b2,x)
$0d:88f9  89 31 1d	  bit #$1d31
$0d:88fc  08			php
$0d:88fd  01 d0		 ora ($d0,x)
$0d:88ff  89 31 1d	  bit #$1d31
$0d:8902  09 01 ee	  ora #$ee01
$0d:8905  89 31 1d	  bit #$1d31
$0d:8908  09 01 0c	  ora #$0c01
$0d:890b  8a			txa
$0d:890c  31 1d		 and ($1d),y
$0d:890e  1f 01 ee 89   ora $89ee01,x
$0d:8912  31 1d		 and ($1d),y
$0d:8914  09 01 d0	  ora #$d001
$0d:8917  89 31 1d	  bit #$1d31
$0d:891a  09 01 b2	  ora #$b201
$0d:891d  89 31 1d	  bit #$1d31
$0d:8920  08			php
$0d:8921  01 94		 ora ($94,x)
$0d:8923  89 31 1d	  bit #$1d31
$0d:8926  08			php
$0d:8927  01 76		 ora ($76,x)
$0d:8929  89 31 1d	  bit #$1d31
$0d:892c  07 01		 ora [$01]
$0d:892e  58			cli
$0d:892f  89 31 1d	  bit #$1d31
$0d:8932  06 01		 asl $01
$0d:8934  3a			dec a
$0d:8935  89 31 1d	  bit #$1d31
$0d:8938  0f 00 25 00   ora $002500
$0d:893c  48			pha
$0d:893d  00 8a		 brk #$8a
$0d:893f  04 ce		 tsb $ce
$0d:8941  08			php
$0d:8942  31 0d		 and ($0d),y
$0d:8944  74 11		 stz $11,x
$0d:8946  d8			cld
$0d:8947  15 66		 ora $66,x
$0d:8949  18			clc
$0d:894a  c6 20		 dec $20
$0d:894c  29 29 8c	  and #$8c29
$0d:894f  35 11		 and $11,x
$0d:8951  46 52		 lsr $52
$0d:8953  4e 42 08	  lsr $0842
$0d:8956  bd 77 26	  lda $2677,x
$0d:8959  00 49		 brk #$49
$0d:895b  00 8b		 brk #$8b
$0d:895d  04 cf		 tsb $cf
$0d:895f  08			php
$0d:8960  32 0d		 and ($0d)
$0d:8962  75 11		 adc $11,x
$0d:8964  d9 15 67	  cmp $6715,y
$0d:8967  18			clc
$0d:8968  c7 20		 cmp [$20]
$0d:896a  2a			rol a
$0d:896b  29 8d 35	  and #$358d
$0d:896e  11 46		 ora ($46),y
$0d:8970  53 4e		 eor ($4e,s),y
$0d:8972  43 08		 eor $08,s
$0d:8974  bd 77 27	  lda $2777,x
$0d:8977  00 4a		 brk #$4a
$0d:8979  00 8c		 brk #$8c
$0d:897b  04 d0		 tsb $d0
$0d:897d  08			php
$0d:897e  33 0d		 and ($0d,s),y
$0d:8980  96 11		 stx $11,y
$0d:8982  fa			plx
$0d:8983  15 68		 ora $68,x
$0d:8985  14 ca		 trb $ca
$0d:8987  1c 2d 25	  trb $252d
$0d:898a  b0 31		 bcs $89bd
$0d:898c  13 3e		 ora ($3e,s),y
$0d:898e  76 46		 ror $46,x
$0d:8990  44 08 de	  mvp $de,$08
$0d:8993  7b			tdc
$0d:8994  28			plp
$0d:8995  00 4b		 brk #$4b
$0d:8997  00 8e		 brk #$8e
$0d:8999  04 f3		 tsb $f3
$0d:899b  08			php
$0d:899c  54 0d 97	  mvn $97,$0d
$0d:899f  11 1b		 ora ($1b),y
$0d:89a1  16 69		 asl $69,x
$0d:89a3  14 cb		 trb $cb
$0d:89a5  1c 2f 25	  trb $252f
$0d:89a8  b1 2d		 lda ($2d),y
$0d:89aa  14 3a		 trb $3a
$0d:89ac  97 42		 sta [$42],y
$0d:89ae  46 08		 lsr $08
$0d:89b0  ff 7f 29 00   sbc $00297f,x
$0d:89b4  4c 00 8f	  jmp $8f00
$0d:89b7  04 f4		 tsb $f4
$0d:89b9  04 55		 tsb $55
$0d:89bb  0d b8 0d	  ora $0db8
$0d:89be  1c 16 8b	  trb $8b16
$0d:89c1  14 cb		 trb $cb
$0d:89c3  1c 4f 21	  trb $214f
$0d:89c6  d4 29		 pei ($29)
$0d:89c8  35 3a		 and $3a,x
$0d:89ca  98			tya
$0d:89cb  3e 48 08	  rol $0848,x
$0d:89ce  de 7b 2a	  dec $2a7b,x
$0d:89d1  00 4d		 brk #$4d
$0d:89d3  00 91		 brk #$91
$0d:89d5  04 14		 tsb $14
$0d:89d7  05 77		 ora $77
$0d:89d9  09 b9 0d	  ora #$0db9
$0d:89dc  3c 16 8c	  bit $8c16,x
$0d:89df  14 f0		 trb $f0
$0d:89e1  18			clc
$0d:89e2  52 21		 eor ($21)
$0d:89e4  d5 25		 cmp $25,x
$0d:89e6  36 36		 rol $36,x
$0d:89e8  99 3a 4a	  sta $4a3a,y
$0d:89eb  08			php
$0d:89ec  bd 77 2b	  lda $2b77,x
$0d:89ef  00 4e		 brk #$4e
$0d:89f1  00 93		 brk #$93
$0d:89f3  04 16		 tsb $16
$0d:89f5  05 78		 ora $78
$0d:89f7  09 da 0d	  ora #$0dda
$0d:89fa  3d 16 90	  and $9016,x
$0d:89fd  10 f2		 bpl $89f1
$0d:89ff  14 54		 trb $54
$0d:8a01  1d d7 25	  ora $25d7,x
$0d:8a04  38			sec
$0d:8a05  32 ba		 and ($ba)
$0d:8a07  36 4c		 rol $4c,x
$0d:8a09  08			php
$0d:8a0a  bd 77 2c	  lda $2c77,x
$0d:8a0d  00 50		 brk #$50
$0d:8a0f  00 94		 brk #$94
$0d:8a11  04 18		 tsb $18
$0d:8a13  05 7a		 ora $7a
$0d:8a15  09 dc 0d	  ora #$0ddc
$0d:8a18  3e 12 92	  rol $9212,x
$0d:8a1b  0c f4 10	  tsb $10f4
$0d:8a1e  56 19		 lsr $19,x
$0d:8a20  d8			cld
$0d:8a21  21 3a		 and ($3a,x)
$0d:8a23  2a			rol a
$0d:8a24  bc 32 4e	  ldy $4e32,x
$0d:8a27  08			php
$0d:8a28  bd 77 01	  lda $0177,x
$0d:8a2b  4f 8a 21 1b   eor $1b218a
$0d:8a2f  0f 01 6b 8a   ora $8a6b01
$0d:8a33  21 1b		 and ($1b,x)
$0d:8a35  0f 01 87 8a   ora $8a8701
$0d:8a39  21 1b		 and ($1b,x)
$0d:8a3b  0f 01 a3 8a   ora $8aa301
$0d:8a3f  21 1b		 and ($1b,x)
$0d:8a41  0f 01 bf 8a   ora $8abf01
$0d:8a45  21 1b		 and ($1b,x)
$0d:8a47  0f 01 db 8a   ora $8adb01
$0d:8a4b  21 1b		 and ($1b,x)
$0d:8a4d  0f 00 10 00   ora $001000
$0d:8a51  12 00		 ora ($00)
$0d:8a53  14 00		 trb $00
$0d:8a55  96 00		 stx $00,y
$0d:8a57  de 7b de	  dec $de7b,x
$0d:8a5a  7b			tdc
$0d:8a5b  10 00		 bpl $8a5d
$0d:8a5d  11 00		 ora ($00),y
$0d:8a5f  14 00		 trb $00
$0d:8a61  36 00		 rol $00,x
$0d:8a63  de 7b de	  dec $de7b,x
$0d:8a66  7b			tdc
$0d:8a67  de 7b de	  dec $de7b,x
$0d:8a6a  7b			tdc
$0d:8a6b  12 00		 ora ($00)
$0d:8a6d  35 00		 and $00,x
$0d:8a6f  78			sei
$0d:8a70  00 34		 brk #$34
$0d:8a72  00 de		 brk #$de
$0d:8a74  7b			tdc
$0d:8a75  de 7b 12	  dec $127b,x
$0d:8a78  00 10		 brk #$10
$0d:8a7a  00 11		 brk #$11
$0d:8a7c  00 34		 brk #$34
$0d:8a7e  00 de		 brk #$de
$0d:8a80  7b			tdc
$0d:8a81  de 7b de	  dec $de7b,x
$0d:8a84  7b			tdc
$0d:8a85  de 7b 53	  dec $537b,x
$0d:8a88  00 98		 brk #$98
$0d:8a8a  00 34		 brk #$34
$0d:8a8c  00 11		 brk #$11
$0d:8a8e  00 de		 brk #$de
$0d:8a90  7b			tdc
$0d:8a91  de 7b 32	  dec $327b,x
$0d:8a94  00 12		 brk #$12
$0d:8a96  00 10		 brk #$10
$0d:8a98  00 11		 brk #$11
$0d:8a9a  00 de		 brk #$de
$0d:8a9c  7b			tdc
$0d:8a9d  de 7b de	  dec $de7b,x
$0d:8aa0  7b			tdc
$0d:8aa1  de 7b 36	  dec $367b,x
$0d:8aa4  00 14		 brk #$14
$0d:8aa6  00 11		 brk #$11
$0d:8aa8  00 10		 brk #$10
$0d:8aaa  00 de		 brk #$de
$0d:8aac  7b			tdc
$0d:8aad  de 7b 96	  dec $967b,x
$0d:8ab0  00 14		 brk #$14
$0d:8ab2  00 12		 brk #$12
$0d:8ab4  00 10		 brk #$10
$0d:8ab6  00 de		 brk #$de
$0d:8ab8  7b			tdc
$0d:8ab9  de 7b de	  dec $de7b,x
$0d:8abc  7b			tdc
$0d:8abd  de 7b 34	  dec $347b,x
$0d:8ac0  00 11		 brk #$11
$0d:8ac2  00 10		 brk #$10
$0d:8ac4  00 12		 brk #$12
$0d:8ac6  00 de		 brk #$de
$0d:8ac8  7b			tdc
$0d:8ac9  de 7b 34	  dec $347b,x
$0d:8acc  00 98		 brk #$98
$0d:8ace  00 35		 brk #$35
$0d:8ad0  00 12		 brk #$12
$0d:8ad2  00 de		 brk #$de
$0d:8ad4  7b			tdc
$0d:8ad5  de 7b de	  dec $de7b,x
$0d:8ad8  7b			tdc
$0d:8ad9  de 7b 11	  dec $117b,x
$0d:8adc  00 10		 brk #$10
$0d:8ade  00 12		 brk #$12
$0d:8ae0  00 52		 brk #$52
$0d:8ae2  00 de		 brk #$de
$0d:8ae4  7b			tdc
$0d:8ae5  de 7b 11	  dec $117b,x
$0d:8ae8  00 34		 brk #$34
$0d:8aea  00 98		 brk #$98
$0d:8aec  00 33		 brk #$33
$0d:8aee  00 de		 brk #$de
$0d:8af0  7b			tdc
$0d:8af1  de 7b de	  dec $de7b,x
$0d:8af4  7b			tdc
$0d:8af5  de 7b 01	  dec $017b,x
$0d:8af8  10 8b		 bpl $8a85
$0d:8afa  21 1d		 and ($1d,x)
$0d:8afc  01 01		 ora ($01,x)
$0d:8afe  2e 8b 21	  rol $218b
$0d:8b01  1d 01 01	  ora $0101,x
$0d:8b04  4c 8b 21	  jmp $218b
$0d:8b07  1d 01 01	  ora $0101,x
$0d:8b0a  6a			ror a
$0d:8b0b  8b			phb
$0d:8b0c  21 1d		 and ($1d,x)
$0d:8b0e  01 00		 ora ($00,x)
$0d:8b10  de 7b 5a	  dec $5a7b,x
$0d:8b13  6b			rtl
$0d:8b14  b5 56		 lda $56,x
$0d:8b16  31 46		 and ($46),y
$0d:8b18  ad 35 29	  lda $2935
$0d:8b1b  25 c6		 and $c6
$0d:8b1d  18			clc
$0d:8b1e  63 0c		 adc $0c,s
$0d:8b20  21 18		 and ($18,x)
$0d:8b22  81 28		 sta ($28,x)
$0d:8b24  00 39		 brk #$39
$0d:8b26  80 59		 bra $8b81
$0d:8b28  00 72		 brk #$72
$0d:8b2a  c0 7a 00	  cpy #$007a
$0d:8b2d  00 de		 brk #$de
$0d:8b2f  7b			tdc
$0d:8b30  7b			tdc
$0d:8b31  6f f7 5e 73   adc $735ef7
$0d:8b35  4e ef 3d	  lsr $3def
$0d:8b38  6b			rtl
$0d:8b39  2d e7 1c	  and $1ce7
$0d:8b3c  84 10		 sty $10
$0d:8b3e  21 18		 and ($18,x)
$0d:8b40  81 28		 sta ($28,x)
$0d:8b42  00 39		 brk #$39
$0d:8b44  80 59		 bra $8b9f
$0d:8b46  00 72		 brk #$72
$0d:8b48  c0 7a 21	  cpy #$217a
$0d:8b4b  04 de		 tsb $de
$0d:8b4d  7b			tdc
$0d:8b4e  9c 73 39	  stz $3973
$0d:8b51  67 b5		 adc [$b5]
$0d:8b53  56 31		 lsr $31,x
$0d:8b55  46 ad		 lsr $ad
$0d:8b57  35 29		 and $29,x
$0d:8b59  25 c6		 and $c6
$0d:8b5b  18			clc
$0d:8b5c  21 18		 and ($18,x)
$0d:8b5e  81 28		 sta ($28,x)
$0d:8b60  00 39		 brk #$39
$0d:8b62  80 59		 bra $8bbd
$0d:8b64  00 72		 brk #$72
$0d:8b66  c0 7a 63	  cpy #$637a
$0d:8b69  0c de 7b	  tsb $7bde
$0d:8b6c  7b			tdc
$0d:8b6d  6f f7 5e 73   adc $735ef7
$0d:8b71  4e ef 3d	  lsr $3def
$0d:8b74  8c 31 08	  sty $0831
$0d:8b77  21 a5		 and ($a5,x)
$0d:8b79  14 21		 trb $21
$0d:8b7b  18			clc
$0d:8b7c  81 28		 sta ($28,x)
$0d:8b7e  00 39		 brk #$39
$0d:8b80  80 59		 bra $8bdb
$0d:8b82  00 72		 brk #$72
$0d:8b84  c0 7a 42	  cpy #$427a
$0d:8b87  08			php
$0d:8b88  01 5b		 ora ($5b,x)
$0d:8b8a  8c 21 1b	  sty $1b21
$0d:8b8d  06 01		 asl $01
$0d:8b8f  3f 8c 21 1b   and $1b218c,x
$0d:8b93  06 01		 asl $01
$0d:8b95  23 8c		 and $8c,s
$0d:8b97  21 1b		 and ($1b,x)
$0d:8b99  06 01		 asl $01
$0d:8b9b  07 8c		 ora [$8c]
$0d:8b9d  21 1b		 and ($1b,x)
$0d:8b9f  06 01		 asl $01
$0d:8ba1  eb			xba
$0d:8ba2  8b			phb
$0d:8ba3  21 1b		 and ($1b,x)
$0d:8ba5  06 01		 asl $01
$0d:8ba7  cf 8b 21 1b   cmp $1b218b
$0d:8bab  06 01		 asl $01
$0d:8bad  b3 8b		 lda ($8b,s),y
$0d:8baf  21 1b		 and ($1b,x)
$0d:8bb1  06 00		 asl $00
$0d:8bb3  e3 14		 sbc $14,s
$0d:8bb5  04 19		 tsb $19
$0d:8bb7  46 21		 lsr $21
$0d:8bb9  88			dey
$0d:8bba  29 46 21	  and #$2146
$0d:8bbd  04 19		 tsb $19
$0d:8bbf  e3 14		 sbc $14,s
$0d:8bc1  46 21		 lsr $21
$0d:8bc3  04 19		 tsb $19
$0d:8bc5  e3 14		 sbc $14,s
$0d:8bc7  e3 14		 sbc $14,s
$0d:8bc9  04 19		 tsb $19
$0d:8bcb  46 21		 lsr $21
$0d:8bcd  88			dey
$0d:8bce  29 e3 14	  and #$14e3
$0d:8bd1  e3 14		 sbc $14,s
$0d:8bd3  04 19		 tsb $19
$0d:8bd5  46 21		 lsr $21
$0d:8bd7  88			dey
$0d:8bd8  29 46 21	  and #$2146
$0d:8bdb  04 19		 tsb $19
$0d:8bdd  88			dey
$0d:8bde  29 46 21	  and #$2146
$0d:8be1  04 19		 tsb $19
$0d:8be3  e3 14		 sbc $14,s
$0d:8be5  e3 14		 sbc $14,s
$0d:8be7  04 19		 tsb $19
$0d:8be9  46 21		 lsr $21
$0d:8beb  04 19		 tsb $19
$0d:8bed  e3 14		 sbc $14,s
$0d:8bef  e3 14		 sbc $14,s
$0d:8bf1  04 19		 tsb $19
$0d:8bf3  46 21		 lsr $21
$0d:8bf5  88			dey
$0d:8bf6  29 46 21	  and #$2146
$0d:8bf9  46 21		 lsr $21
$0d:8bfb  88			dey
$0d:8bfc  29 46 21	  and #$2146
$0d:8bff  04 19		 tsb $19
$0d:8c01  e3 14		 sbc $14,s
$0d:8c03  e3 14		 sbc $14,s
$0d:8c05  04 19		 tsb $19
$0d:8c07  46 21		 lsr $21
$0d:8c09  04 19		 tsb $19
$0d:8c0b  e3 14		 sbc $14,s
$0d:8c0d  e3 14		 sbc $14,s
$0d:8c0f  04 19		 tsb $19
$0d:8c11  46 21		 lsr $21
$0d:8c13  88			dey
$0d:8c14  29 04 19	  and #$1904
$0d:8c17  46 21		 lsr $21
$0d:8c19  88			dey
$0d:8c1a  29 46 21	  and #$2146
$0d:8c1d  04 19		 tsb $19
$0d:8c1f  e3 14		 sbc $14,s
$0d:8c21  e3 14		 sbc $14,s
$0d:8c23  88			dey
$0d:8c24  29 46 21	  and #$2146
$0d:8c27  04 19		 tsb $19
$0d:8c29  e3 14		 sbc $14,s
$0d:8c2b  e3 14		 sbc $14,s
$0d:8c2d  04 19		 tsb $19
$0d:8c2f  46 21		 lsr $21
$0d:8c31  e3 14		 sbc $14,s
$0d:8c33  04 19		 tsb $19
$0d:8c35  46 21		 lsr $21
$0d:8c37  88			dey
$0d:8c38  29 46 21	  and #$2146
$0d:8c3b  04 19		 tsb $19
$0d:8c3d  e3 14		 sbc $14,s
$0d:8c3f  46 21		 lsr $21
$0d:8c41  88			dey
$0d:8c42  29 46 21	  and #$2146
$0d:8c45  04 19		 tsb $19
$0d:8c47  e3 14		 sbc $14,s
$0d:8c49  e3 14		 sbc $14,s
$0d:8c4b  04 19		 tsb $19
$0d:8c4d  e3 14		 sbc $14,s
$0d:8c4f  e3 14		 sbc $14,s
$0d:8c51  04 19		 tsb $19
$0d:8c53  46 21		 lsr $21
$0d:8c55  88			dey
$0d:8c56  29 46 21	  and #$2146
$0d:8c59  04 19		 tsb $19
$0d:8c5b  04 19		 tsb $19
$0d:8c5d  46 21		 lsr $21
$0d:8c5f  88			dey
$0d:8c60  29 46 21	  and #$2146
$0d:8c63  04 19		 tsb $19
$0d:8c65  e3 14		 sbc $14,s
$0d:8c67  e3 14		 sbc $14,s
$0d:8c69  04 19		 tsb $19
$0d:8c6b  e3 14		 sbc $14,s
$0d:8c6d  e3 14		 sbc $14,s
$0d:8c6f  04 19		 tsb $19
$0d:8c71  46 21		 lsr $21
$0d:8c73  88			dey
$0d:8c74  29 46 21	  and #$2146
$0d:8c77  01 a2		 ora ($a2,x)
$0d:8c79  8c 21 1b	  sty $1b21
$0d:8c7c  07 01		 ora [$01]
$0d:8c7e  be 8c 21	  ldx $218c,y
$0d:8c81  1b			tcs
$0d:8c82  07 01		 ora [$01]
$0d:8c84  da			phx
$0d:8c85  8c 21 1b	  sty $1b21
$0d:8c88  07 01		 ora [$01]
$0d:8c8a  f6 8c		 inc $8c,x
$0d:8c8c  21 1b		 and ($1b,x)
$0d:8c8e  07 01		 ora [$01]
$0d:8c90  12 8d		 ora ($8d)
$0d:8c92  21 1b		 and ($1b,x)
$0d:8c94  07 01		 ora [$01]
$0d:8c96  2e 8d 21	  rol $218d
$0d:8c99  1b			tcs
$0d:8c9a  07 01		 ora [$01]
$0d:8c9c  4a			lsr a
$0d:8c9d  8d 21 1b	  sta $1b21
$0d:8ca0  07 00		 ora [$00]
$0d:8ca2  e3 0c		 sbc $0c,s
$0d:8ca4  04 11		 tsb $11
$0d:8ca6  46 19		 lsr $19
$0d:8ca8  88			dey
$0d:8ca9  25 46		 and $46
$0d:8cab  19 04 11	  ora $1104,y
$0d:8cae  e3 0c		 sbc $0c,s
$0d:8cb0  46 19		 lsr $19
$0d:8cb2  04 11		 tsb $11
$0d:8cb4  e3 0c		 sbc $0c,s
$0d:8cb6  e3 0c		 sbc $0c,s
$0d:8cb8  04 11		 tsb $11
$0d:8cba  46 19		 lsr $19
$0d:8cbc  88			dey
$0d:8cbd  25 e3		 and $e3
$0d:8cbf  0c e3 0c	  tsb $0ce3
$0d:8cc2  04 11		 tsb $11
$0d:8cc4  46 19		 lsr $19
$0d:8cc6  88			dey
$0d:8cc7  25 46		 and $46
$0d:8cc9  19 04 11	  ora $1104,y
$0d:8ccc  88			dey
$0d:8ccd  25 46		 and $46
$0d:8ccf  19 04 11	  ora $1104,y
$0d:8cd2  e3 0c		 sbc $0c,s
$0d:8cd4  e3 0c		 sbc $0c,s
$0d:8cd6  04 11		 tsb $11
$0d:8cd8  46 19		 lsr $19
$0d:8cda  04 11		 tsb $11
$0d:8cdc  e3 0c		 sbc $0c,s
$0d:8cde  e3 0c		 sbc $0c,s
$0d:8ce0  04 11		 tsb $11
$0d:8ce2  46 19		 lsr $19
$0d:8ce4  88			dey
$0d:8ce5  25 46		 and $46
$0d:8ce7  19 46 19	  ora $1946,y
$0d:8cea  88			dey
$0d:8ceb  25 46		 and $46
$0d:8ced  19 04 11	  ora $1104,y
$0d:8cf0  e3 0c		 sbc $0c,s
$0d:8cf2  e3 0c		 sbc $0c,s
$0d:8cf4  04 11		 tsb $11
$0d:8cf6  46 19		 lsr $19
$0d:8cf8  04 11		 tsb $11
$0d:8cfa  e3 0c		 sbc $0c,s
$0d:8cfc  e3 0c		 sbc $0c,s
$0d:8cfe  04 11		 tsb $11
$0d:8d00  46 19		 lsr $19
$0d:8d02  88			dey
$0d:8d03  25 04		 and $04
$0d:8d05  11 46		 ora ($46),y
$0d:8d07  19 88 25	  ora $2588,y
$0d:8d0a  46 19		 lsr $19
$0d:8d0c  04 11		 tsb $11
$0d:8d0e  e3 0c		 sbc $0c,s
$0d:8d10  e3 0c		 sbc $0c,s
$0d:8d12  88			dey
$0d:8d13  25 46		 and $46
$0d:8d15  19 04 11	  ora $1104,y
$0d:8d18  e3 0c		 sbc $0c,s
$0d:8d1a  e3 0c		 sbc $0c,s
$0d:8d1c  04 11		 tsb $11
$0d:8d1e  46 19		 lsr $19
$0d:8d20  e3 0c		 sbc $0c,s
$0d:8d22  04 11		 tsb $11
$0d:8d24  46 19		 lsr $19
$0d:8d26  88			dey
$0d:8d27  25 46		 and $46
$0d:8d29  19 04 11	  ora $1104,y
$0d:8d2c  e3 0c		 sbc $0c,s
$0d:8d2e  46 19		 lsr $19
$0d:8d30  88			dey
$0d:8d31  25 46		 and $46
$0d:8d33  19 04 11	  ora $1104,y
$0d:8d36  e3 0c		 sbc $0c,s
$0d:8d38  e3 0c		 sbc $0c,s
$0d:8d3a  04 11		 tsb $11
$0d:8d3c  e3 0c		 sbc $0c,s
$0d:8d3e  e3 0c		 sbc $0c,s
$0d:8d40  04 11		 tsb $11
$0d:8d42  46 19		 lsr $19
$0d:8d44  88			dey
$0d:8d45  25 46		 and $46
$0d:8d47  19 04 11	  ora $1104,y
$0d:8d4a  04 11		 tsb $11
$0d:8d4c  46 19		 lsr $19
$0d:8d4e  88			dey
$0d:8d4f  25 46		 and $46
$0d:8d51  19 04 11	  ora $1104,y
$0d:8d54  e3 0c		 sbc $0c,s
$0d:8d56  e3 0c		 sbc $0c,s
$0d:8d58  04 11		 tsb $11
$0d:8d5a  e3 0c		 sbc $0c,s
$0d:8d5c  e3 0c		 sbc $0c,s
$0d:8d5e  04 11		 tsb $11
$0d:8d60  46 19		 lsr $19
$0d:8d62  88			dey
$0d:8d63  25 46		 and $46
$0d:8d65  19 01 7f	  ora $7f01,y
$0d:8d68  8d 71 07	  sta $0771
$0d:8d6b  08			php
$0d:8d6c  01 87		 ora ($87,x)
$0d:8d6e  8d 71 07	  sta $0771
$0d:8d71  07 01		 ora [$01]
$0d:8d73  8f 8d 71 07   sta $07718d
$0d:8d77  06 01		 asl $01
$0d:8d79  97 8d		 sta [$8d],y
$0d:8d7b  71 07		 adc ($07),y
$0d:8d7d  07 00		 ora [$00]
$0d:8d7f  a6 2d		 ldx $2d
$0d:8d81  0a			asl a
$0d:8d82  3a			dec a
$0d:8d83  8e 46 ec	  stx $ec46
$0d:8d86  35 ec		 and $ec,x
$0d:8d88  35 a6		 and $a6,x
$0d:8d8a  2d 0a 3a	  and $3a0a
$0d:8d8d  8e 4a 8e	  stx $8e4a
$0d:8d90  4a			lsr a
$0d:8d91  ec 35 a6	  cpx $a635
$0d:8d94  2d 0a 3a	  and $3a0a
$0d:8d97  0a			asl a
$0d:8d98  3a			dec a
$0d:8d99  8e 4a ec	  stx $ec4a
$0d:8d9c  35 a6		 and $a6,x
$0d:8d9e  2d 01 d0	  and $d001
$0d:8da1  8d 7a 09	  sta $097a
$0d:8da4  0b			phd
$0d:8da5  01 da		 ora ($da,x)
$0d:8da7  8d 7a 09	  sta $097a
$0d:8daa  0b			phd
$0d:8dab  01 e4		 ora ($e4,x)
$0d:8dad  8d 7a 09	  sta $097a
$0d:8db0  0b			phd
$0d:8db1  01 ee		 ora ($ee,x)
$0d:8db3  8d 7a 09	  sta $097a
$0d:8db6  0b			phd
$0d:8db7  01 f8		 ora ($f8,x)
$0d:8db9  8d 7a 09	  sta $097a
$0d:8dbc  0b			phd
$0d:8dbd  01 ee		 ora ($ee,x)
$0d:8dbf  8d 7a 09	  sta $097a
$0d:8dc2  0b			phd
$0d:8dc3  01 e4		 ora ($e4,x)
$0d:8dc5  8d 7a 09	  sta $097a
$0d:8dc8  0b			phd
$0d:8dc9  01 da		 ora ($da,x)
$0d:8dcb  8d 7a 09	  sta $097a
$0d:8dce  0b			phd
$0d:8dcf  00 4b		 brk #$4b
$0d:8dd1  52 0a		 eor ($0a)
$0d:8dd3  46 86		 lsr $86
$0d:8dd5  35 04		 and $04,x
$0d:8dd7  25 86		 and $86
$0d:8dd9  35 0a		 and $0a,x
$0d:8ddb  46 4b		 lsr $4b
$0d:8ddd  52 0a		 eor ($0a)
$0d:8ddf  46 86		 lsr $86
$0d:8de1  35 04		 and $04,x
$0d:8de3  25 86		 and $86
$0d:8de5  35 0a		 and $0a,x
$0d:8de7  46 4b		 lsr $4b
$0d:8de9  52 0a		 eor ($0a)
$0d:8deb  46 86		 lsr $86
$0d:8ded  35 04		 and $04,x
$0d:8def  25 86		 and $86
$0d:8df1  35 0a		 and $0a,x
$0d:8df3  46 4b		 lsr $4b
$0d:8df5  52 0a		 eor ($0a)
$0d:8df7  46 86		 lsr $86
$0d:8df9  35 04		 and $04,x
$0d:8dfb  25 86		 and $86
$0d:8dfd  35 0a		 and $0a,x
$0d:8dff  46 4b		 lsr $4b
$0d:8e01  52 01		 eor ($01)
$0d:8e03  a3 8e		 lda $8e,s
$0d:8e05  21 0f		 and ($0f,x)
$0d:8e07  01 01		 ora ($01,x)
$0d:8e09  93 8e		 sta ($8e,s),y
$0d:8e0b  21 0f		 and ($0f,x)
$0d:8e0d  01 01		 ora ($01,x)
$0d:8e0f  83 8e		 sta $8e,s
$0d:8e11  21 0f		 and ($0f,x)
$0d:8e13  01 01		 ora ($01,x)
$0d:8e15  73 8e		 adc ($8e,s),y
$0d:8e17  21 0f		 and ($0f,x)
$0d:8e19  01 01		 ora ($01,x)
$0d:8e1b  63 8e		 adc $8e,s
$0d:8e1d  21 0f		 and ($0f,x)
$0d:8e1f  01 01		 ora ($01,x)
$0d:8e21  53 8e		 eor ($8e,s),y
$0d:8e23  21 0f		 and ($0f,x)
$0d:8e25  01 01		 ora ($01,x)
$0d:8e27  43 8e		 eor $8e,s
$0d:8e29  21 0f		 and ($0f,x)
$0d:8e2b  01 01		 ora ($01,x)
$0d:8e2d  33 8e		 and ($8e,s),y
$0d:8e2f  21 0f		 and ($0f,x)
$0d:8e31  01 00		 ora ($00,x)
$0d:8e33  62 14 c3	  per $514a
$0d:8e36  20 46 2d	  jsr $2d46
$0d:8e39  e9 45 8d	  sbc #$8d45
$0d:8e3c  5a			phy
$0d:8e3d  e9 45 46	  sbc #$4645
$0d:8e40  31 c3		 and ($c3),y
$0d:8e42  1c c3 1c	  trb $1cc3
$0d:8e45  62 14 c3	  per $515c
$0d:8e48  20 46 2d	  jsr $2d46
$0d:8e4b  e9 45 8d	  sbc #$8d45
$0d:8e4e  5a			phy
$0d:8e4f  e9 45 46	  sbc #$4645
$0d:8e52  31 46		 and ($46),y
$0d:8e54  31 c3		 and ($c3),y
$0d:8e56  1c 62 14	  trb $1462
$0d:8e59  c3 20		 cmp $20,s
$0d:8e5b  46 2d		 lsr $2d
$0d:8e5d  e9 45 8d	  sbc #$8d45
$0d:8e60  5a			phy
$0d:8e61  e9 45 e9	  sbc #$e945
$0d:8e64  45 46		 eor $46
$0d:8e66  31 c3		 and ($c3),y
$0d:8e68  1c 62 14	  trb $1462
$0d:8e6b  c3 20		 cmp $20,s
$0d:8e6d  46 2d		 lsr $2d
$0d:8e6f  e9 45 8d	  sbc #$8d45
$0d:8e72  5a			phy
$0d:8e73  8d 5a e9	  sta $e95a
$0d:8e76  45 46		 eor $46
$0d:8e78  31 c3		 and ($c3),y
$0d:8e7a  1c 62 14	  trb $1462
$0d:8e7d  c3 20		 cmp $20,s
$0d:8e7f  46 2d		 lsr $2d
$0d:8e81  e9 45 e9	  sbc #$e945
$0d:8e84  45 8d		 eor $8d
$0d:8e86  5a			phy
$0d:8e87  e9 45 46	  sbc #$4645
$0d:8e8a  31 c3		 and ($c3),y
$0d:8e8c  1c 62 14	  trb $1462
$0d:8e8f  c3 20		 cmp $20,s
$0d:8e91  46 2d		 lsr $2d
$0d:8e93  46 2d		 lsr $2d
$0d:8e95  e9 45 8d	  sbc #$8d45
$0d:8e98  5a			phy
$0d:8e99  e9 45 46	  sbc #$4645
$0d:8e9c  31 c3		 and ($c3),y
$0d:8e9e  1c 62 14	  trb $1462
$0d:8ea1  c3 20		 cmp $20,s
$0d:8ea3  c3 20		 cmp $20,s
$0d:8ea5  46 2d		 lsr $2d
$0d:8ea7  e9 45 8d	  sbc #$8d45
$0d:8eaa  5a			phy
$0d:8eab  e9 45 46	  sbc #$4645
$0d:8eae  31 c3		 and ($c3),y
$0d:8eb0  1c 62 14	  trb $1462
$0d:8eb3  01 d8		 ora ($d8,x)
$0d:8eb5  8e 74 15	  stx $1574
$0d:8eb8  03 01		 ora $01,s
$0d:8eba  ee 8e 74	  inc $748e
$0d:8ebd  15 03		 ora $03,x
$0d:8ebf  01 04		 ora ($04,x)
$0d:8ec1  8f 74 15 03   sta $031574
$0d:8ec5  01 1a		 ora ($1a,x)
$0d:8ec7  8f 74 15 03   sta $031574
$0d:8ecb  01 30		 ora ($30,x)
$0d:8ecd  8f 74 15 03   sta $031574
$0d:8ed1  01 46		 ora ($46,x)
$0d:8ed3  8f 74 15 03   sta $031574
$0d:8ed7  00 4d		 brk #$4d
$0d:8ed9  19 0b 19	  ora $190b,y
$0d:8edc  63 04		 adc $04,s
$0d:8ede  a5 0c		 lda $0c
$0d:8ee0  e7 18		 sbc [$18]
$0d:8ee2  ad 0c d1	  lda $d10c
$0d:8ee5  00 fa		 brk #$fa
$0d:8ee7  11 7d		 ora ($7d),y
$0d:8ee9  1a			inc a
$0d:8eea  7f 3f 7f 3f   adc $3f7f3f,x
$0d:8eee  0b			phd
$0d:8eef  19 4d 19	  ora $194d,y
$0d:8ef2  63 04		 adc $04,s
$0d:8ef4  a5 0c		 lda $0c
$0d:8ef6  e7 18		 sbc [$18]
$0d:8ef8  8a			txa
$0d:8ef9  08			php
$0d:8efa  ae 00 98	  ldx $9800
$0d:8efd  11 1a		 ora ($1a),y
$0d:8eff  12 1e		 ora ($1e)
$0d:8f01  27 7f		 and [$7f]
$0d:8f03  3f 4d 19 0b   and $0b194d,x
$0d:8f07  19 63 04	  ora $0463,y
$0d:8f0a  a5 0c		 lda $0c
$0d:8f0c  e7 18		 sbc [$18]
$0d:8f0e  ad 0c 8a	  lda $8a0c
$0d:8f11  08			php
$0d:8f12  14 11		 trb $11
$0d:8f14  98			tya
$0d:8f15  11 bd		 ora ($bd),y
$0d:8f17  1a			inc a
$0d:8f18  fe 26 0b	  inc $0b26,x
$0d:8f1b  19 4d 19	  ora $194d,y
$0d:8f1e  63 04		 adc $04,s
$0d:8f20  a5 0c		 lda $0c
$0d:8f22  e7 18		 sbc [$18]
$0d:8f24  8a			txa
$0d:8f25  08			php
$0d:8f26  8a			txa
$0d:8f27  08			php
$0d:8f28  14 11		 trb $11
$0d:8f2a  98			tya
$0d:8f2b  11 1e		 ora ($1e),y
$0d:8f2d  27 7f		 and [$7f]
$0d:8f2f  3f 4d 19 0b   and $0b194d,x
$0d:8f33  19 63 04	  ora $0463,y
$0d:8f36  a5 0c		 lda $0c
$0d:8f38  e7 18		 sbc [$18]
$0d:8f3a  ad 0c ae	  lda $ae0c
$0d:8f3d  00 98		 brk #$98
$0d:8f3f  11 1a		 ora ($1a),y
$0d:8f41  12 bd		 ora ($bd)
$0d:8f43  1a			inc a
$0d:8f44  fe 26 0b	  inc $0b26,x
$0d:8f47  19 4d 19	  ora $194d,y
$0d:8f4a  63 04		 adc $04,s
$0d:8f4c  a5 0c		 lda $0c
$0d:8f4e  e7 18		 sbc [$18]
$0d:8f50  8a			txa
$0d:8f51  08			php
$0d:8f52  d1 00		 cmp ($00),y
$0d:8f54  fa			plx
$0d:8f55  11 7d		 ora ($7d),y
$0d:8f57  1a			inc a
$0d:8f58  1e 27 7f	  asl $7f27,x
$0d:8f5b  3f 01 ab 8f   and $8fab01,x
$0d:8f5f  61 05		 adc ($05,x)
$0d:8f61  04 01		 tsb $01
$0d:8f63  b7 8f		 lda [$8f],y
$0d:8f65  61 05		 adc ($05,x)
$0d:8f67  04 01		 tsb $01
$0d:8f69  c3 8f		 cmp $8f,s
$0d:8f6b  61 05		 adc ($05,x)
$0d:8f6d  04 01		 tsb $01
$0d:8f6f  cf 8f 61 05   cmp $05618f
$0d:8f73  04 01		 tsb $01
$0d:8f75  db			stp
$0d:8f76  8f 61 05 04   sta $040561
$0d:8f7a  01 e7		 ora ($e7,x)
$0d:8f7c  8f 61 05 04   sta $040561
$0d:8f80  01 b1		 ora ($b1,x)
$0d:8f82  8f 6c 05 04   sta $04056c
$0d:8f86  01 bd		 ora ($bd,x)
$0d:8f88  8f 6c 05 04   sta $04056c
$0d:8f8c  01 c9		 ora ($c9,x)
$0d:8f8e  8f 6c 05 04   sta $04056c
$0d:8f92  01 d5		 ora ($d5,x)
$0d:8f94  8f 6c 05 04   sta $04056c
$0d:8f98  01 e1		 ora ($e1,x)
$0d:8f9a  8f 6c 05 04   sta $04056c
$0d:8f9e  01 ed		 ora ($ed,x)
$0d:8fa0  8f 6c 05 04   sta $04056c
$0d:8fa4  01 f3		 ora ($f3,x)
$0d:8fa6  8f 6c 05 4f   sta $4f056c
$0d:8faa  00 a3		 brk #$a3
$0d:8fac  2c 40 1c	  bit $1c40
$0d:8faf  41 00		 eor ($00,x)
$0d:8fb1  e5 34		 sbc $34
$0d:8fb3  e5 34		 sbc $34
$0d:8fb5  a3 2c		 lda $2c,s
$0d:8fb7  e5 34		 sbc $34
$0d:8fb9  a3 2c		 lda $2c,s
$0d:8fbb  40			rti
$0d:8fbc  1c a3 2c	  trb $2ca3
$0d:8fbf  e5 34		 sbc $34
$0d:8fc1  e5 34		 sbc $34
$0d:8fc3  e5 34		 sbc $34
$0d:8fc5  e5 34		 sbc $34
$0d:8fc7  a3 2c		 lda $2c,s
$0d:8fc9  a3 2c		 lda $2c,s
$0d:8fcb  a3 2c		 lda $2c,s
$0d:8fcd  e5 34		 sbc $34
$0d:8fcf  a3 2c		 lda $2c,s
$0d:8fd1  e5 34		 sbc $34
$0d:8fd3  e5 34		 sbc $34
$0d:8fd5  a3 2c		 lda $2c,s
$0d:8fd7  a3 2c		 lda $2c,s
$0d:8fd9  a3 2c		 lda $2c,s
$0d:8fdb  40			rti
$0d:8fdc  1c a3 2c	  trb $2ca3
$0d:8fdf  e5 34		 sbc $34
$0d:8fe1  a3 2c		 lda $2c,s
$0d:8fe3  a3 2c		 lda $2c,s
$0d:8fe5  a3 2c		 lda $2c,s
$0d:8fe7  40			rti
$0d:8fe8  1c 40 1c	  trb $1c40
$0d:8feb  40			rti
$0d:8fec  1c 40 1c	  trb $1c40
$0d:8fef  40			rti
$0d:8ff0  1c 40 1c	  trb $1c40
$0d:8ff3  40			rti
$0d:8ff4  1c 40 1c	  trb $1c40
$0d:8ff7  40			rti
$0d:8ff8  1c 01 2a	  trb $2a01
$0d:8ffb  90 56		 bcc $9053
$0d:8ffd  11 06		 ora ($06),y
$0d:8fff  01 3c		 ora ($3c,x)
$0d:9001  90 56		 bcc $9059
$0d:9003  11 08		 ora ($08),y
$0d:9005  01 4e		 ora ($4e,x)
$0d:9007  90 56		 bcc $905f
$0d:9009  11 08		 ora ($08),y
$0d:900b  01 60		 ora ($60,x)
$0d:900d  90 56		 bcc $9065
$0d:900f  11 08		 ora ($08),y
$0d:9011  01 72		 ora ($72,x)
$0d:9013  90 56		 bcc $906b
$0d:9015  11 08		 ora ($08),y
$0d:9017  01 84		 ora ($84,x)
$0d:9019  90 56		 bcc $9071
$0d:901b  11 08		 ora ($08),y
$0d:901d  01 96		 ora ($96,x)
$0d:901f  90 56		 bcc $9077
$0d:9021  11 08		 ora ($08),y
$0d:9023  01 a8		 ora ($a8,x)
$0d:9025  90 56		 bcc $907d
$0d:9027  11 08		 ora ($08),y
$0d:9029  00 29		 brk #$29
$0d:902b  21 83		 and ($83,x)
$0d:902d  34 62		 bit $62,x
$0d:902f  2c 62 20	  bit $2062
$0d:9032  a3 3c		 lda $3c,s
$0d:9034  83 34		 sta $34,s
$0d:9036  62 1c 62	  per $f255
$0d:9039  2c a3 3c	  bit $3ca3
$0d:903c  4a			lsr a
$0d:903d  25 62		 and $62
$0d:903f  2c 62 20	  bit $2062
$0d:9042  a3 3c		 lda $3c,s
$0d:9044  83 34		 sta $34,s
$0d:9046  62 2c 62	  per $f275
$0d:9049  1c a4 34	  trb $34a4
$0d:904c  a3 3c		 lda $3c,s
$0d:904e  29 21 62	  and #$6221
$0d:9051  20 a3 3c	  jsr $3ca3
$0d:9054  83 34		 sta $34,s
$0d:9056  62 2c 62	  per $f285
$0d:9059  1c 62 2c	  trb $2c62
$0d:905c  a3 3c		 lda $3c,s
$0d:905e  83 34		 sta $34,s
$0d:9060  4a			lsr a
$0d:9061  25 a3		 and $a3
$0d:9063  3c 83 34	  bit $3483,x
$0d:9066  62 2c 62	  per $f295
$0d:9069  20 62 1c	  jsr $1c62
$0d:906c  a4 34		 ldy $34
$0d:906e  a3 3c		 lda $3c,s
$0d:9070  62 2c 29	  per $b99f
$0d:9073  21 83		 and ($83,x)
$0d:9075  34 62		 bit $62,x
$0d:9077  2c 62 20	  bit $2062
$0d:907a  a3 3c		 lda $3c,s
$0d:907c  62 2c a3	  per $33ab
$0d:907f  3c 83 34	  bit $3483,x
$0d:9082  62 1c 4a	  per $daa1
$0d:9085  25 62		 and $62
$0d:9087  2c 62 20	  bit $2062
$0d:908a  a3 3c		 lda $3c,s
$0d:908c  83 34		 sta $34,s
$0d:908e  a4 34		 ldy $34
$0d:9090  a3 3c		 lda $3c,s
$0d:9092  62 2c 62	  per $f2c1
$0d:9095  1c 29 21	  trb $2129
$0d:9098  62 20 a3	  per $33bb
$0d:909b  3c 83 34	  bit $3483,x
$0d:909e  62 2c a3	  per $33cd
$0d:90a1  3c 83 34	  bit $3483,x
$0d:90a4  62 1c 62	  per $f2c3
$0d:90a7  2c 4a 25	  bit $254a
$0d:90aa  a3 3c		 lda $3c,s
$0d:90ac  83 34		 sta $34,s
$0d:90ae  62 2c 62	  per $f2dd
$0d:90b1  20 a3 3c	  jsr $3ca3
$0d:90b4  62 2c 62	  per $f2e3
$0d:90b7  1c a4 34	  trb $34a4
$0d:90ba  20 c1 90	  jsr $90c1
$0d:90bd  48			pha
$0d:90be  01 02		 ora ($02,x)
$0d:90c0  00 27		 brk #$27
$0d:90c2  00 28		 brk #$28
$0d:90c4  00 49		 brk #$49
$0d:90c6  00 6b		 brk #$6b
$0d:90c8  00 6c		 brk #$6c
$0d:90ca  00 8e		 brk #$8e
$0d:90cc  00 af		 brk #$af
$0d:90ce  00 b0		 brk #$b0
$0d:90d0  00 d2		 brk #$d2
$0d:90d2  00 f3		 brk #$f3
$0d:90d4  00 f5		 brk #$f5
$0d:90d6  00 16		 brk #$16
$0d:90d8  01 37		 ora ($37,x)
$0d:90da  01 39		 ora ($39,x)
$0d:90dc  01 5a		 ora ($5a,x)
$0d:90de  01 7c		 ora ($7c,x)
$0d:90e0  01 7c		 ora ($7c,x)
$0d:90e2  01 7b		 ora ($7b,x)
$0d:90e4  01 5a		 ora ($5a,x)
$0d:90e6  01 38		 ora ($38,x)
$0d:90e8  01 37		 ora ($37,x)
$0d:90ea  01 15		 ora ($15,x)
$0d:90ec  01 f4		 ora ($f4,x)
$0d:90ee  00 f3		 brk #$f3
$0d:90f0  00 d1		 brk #$d1
$0d:90f2  00 b0		 brk #$b0
$0d:90f4  00 ae		 brk #$ae
$0d:90f6  00 8d		 brk #$8d
$0d:90f8  00 6c		 brk #$6c
$0d:90fa  00 6a		 brk #$6a
$0d:90fc  00 49		 brk #$49
$0d:90fe  00 27		 brk #$27
$0d:9100  00 01		 brk #$01
$0d:9102  32 91		 and ($91)
$0d:9104  70 19		 bvs $911f
$0d:9106  0b			phd
$0d:9107  01 4c		 ora ($4c,x)
$0d:9109  91 70		 sta ($70),y
$0d:910b  19 0a 01	  ora $010a,y
$0d:910e  66 91		 ror $91
$0d:9110  70 19		 bvs $912b
$0d:9112  09 01 80	  ora #$8001
$0d:9115  91 70		 sta ($70),y
$0d:9117  19 0a 01	  ora $010a,y
$0d:911a  9a			txs
$0d:911b  91 70		 sta ($70),y
$0d:911d  19 0b 01	  ora $010b,y
$0d:9120  b4 91		 ldy $91,x
$0d:9122  70 19		 bvs $913d
$0d:9124  0a			asl a
$0d:9125  01 ce		 ora ($ce,x)
$0d:9127  91 70		 sta ($70),y
$0d:9129  19 09 01	  ora $0109,y
$0d:912c  e8			inx
$0d:912d  91 70		 sta ($70),y
$0d:912f  19 0a 00	  ora $000a,y
$0d:9132  00 00		 brk #$00
$0d:9134  88			dey
$0d:9135  5a			phy
$0d:9136  04 3a		 tsb $3a
$0d:9138  48			pha
$0d:9139  42 8a		 wdm #$8a
$0d:913b  4a			lsr a
$0d:913c  ce 5a 4a	  dec $4a5a
$0d:913f  4a			lsr a
$0d:9140  08			php
$0d:9141  42 c4		 wdm #$c4
$0d:9143  39 94 52	  and $5294,y
$0d:9146  18			clc
$0d:9147  63 9c		 adc $9c,s
$0d:9149  73 18		 adc ($18,s),y
$0d:914b  63 00		 adc $00,s
$0d:914d  00 4a		 brk #$4a
$0d:914f  4a			lsr a
$0d:9150  ce 5a 04	  dec $045a
$0d:9153  3a			dec a
$0d:9154  48			pha
$0d:9155  42 8a		 wdm #$8a
$0d:9157  4a			lsr a
$0d:9158  08			php
$0d:9159  42 c4		 wdm #$c4
$0d:915b  39 68 5a	  and $5a68,y
$0d:915e  18			clc
$0d:915f  63 94		 adc $94,s
$0d:9161  52 18		 eor ($18)
$0d:9163  63 9c		 adc $9c,s
$0d:9165  73 00		 adc ($00,s),y
$0d:9167  00 08		 brk #$08
$0d:9169  42 8a		 wdm #$8a
$0d:916b  4a			lsr a
$0d:916c  ce 5a 04	  dec $045a
$0d:916f  3a			dec a
$0d:9170  48			pha
$0d:9171  42 c4		 wdm #$c4
$0d:9173  39 88 5a	  and $5a88,y
$0d:9176  4a			lsr a
$0d:9177  4a			lsr a
$0d:9178  9c 73 18	  stz $1873
$0d:917b  63 94		 adc $94,s
$0d:917d  52 18		 eor ($18)
$0d:917f  63 00		 adc $00,s
$0d:9181  00 c4		 brk #$c4
$0d:9183  39 48 42	  and $4248,y
$0d:9186  8a			txa
$0d:9187  4a			lsr a
$0d:9188  ce 5a 04	  dec $045a
$0d:918b  3a			dec a
$0d:918c  88			dey
$0d:918d  5a			phy
$0d:918e  4a			lsr a
$0d:918f  4a			lsr a
$0d:9190  08			php
$0d:9191  42 18		 wdm #$18
$0d:9193  63 9c		 adc $9c,s
$0d:9195  73 18		 adc ($18,s),y
$0d:9197  63 94		 adc $94,s
$0d:9199  52 00		 eor ($00)
$0d:919b  00 88		 brk #$88
$0d:919d  5a			phy
$0d:919e  04 3a		 tsb $3a
$0d:91a0  48			pha
$0d:91a1  42 8a		 wdm #$8a
$0d:91a3  4a			lsr a
$0d:91a4  c8			iny
$0d:91a5  5a			phy
$0d:91a6  4a			lsr a
$0d:91a7  4a			lsr a
$0d:91a8  08			php
$0d:91a9  42 c4		 wdm #$c4
$0d:91ab  39 94 52	  and $5294,y
$0d:91ae  18			clc
$0d:91af  63 9c		 adc $9c,s
$0d:91b1  73 18		 adc ($18,s),y
$0d:91b3  63 00		 adc $00,s
$0d:91b5  00 4a		 brk #$4a
$0d:91b7  4a			lsr a
$0d:91b8  ce 5a 04	  dec $045a
$0d:91bb  3a			dec a
$0d:91bc  48			pha
$0d:91bd  42 8a		 wdm #$8a
$0d:91bf  4a			lsr a
$0d:91c0  08			php
$0d:91c1  42 c4		 wdm #$c4
$0d:91c3  39 88 5a	  and $5a88,y
$0d:91c6  18			clc
$0d:91c7  63 94		 adc $94,s
$0d:91c9  52 18		 eor ($18)
$0d:91cb  63 9c		 adc $9c,s
$0d:91cd  73 00		 adc ($00,s),y
$0d:91cf  00 08		 brk #$08
$0d:91d1  42 8a		 wdm #$8a
$0d:91d3  4a			lsr a
$0d:91d4  ce 5a 04	  dec $045a
$0d:91d7  3a			dec a
$0d:91d8  48			pha
$0d:91d9  42 c4		 wdm #$c4
$0d:91db  39 88 5a	  and $5a88,y
$0d:91de  4a			lsr a
$0d:91df  4a			lsr a
$0d:91e0  9c 73 18	  stz $1873
$0d:91e3  63 94		 adc $94,s
$0d:91e5  52 18		 eor ($18)
$0d:91e7  63 00		 adc $00,s
$0d:91e9  00 c4		 brk #$c4
$0d:91eb  39 48 42	  and $4248,y
$0d:91ee  8a			txa
$0d:91ef  4a			lsr a
$0d:91f0  ce 5a 04	  dec $045a
$0d:91f3  3a			dec a
$0d:91f4  88			dey
$0d:91f5  5a			phy
$0d:91f6  4a			lsr a
$0d:91f7  4a			lsr a
$0d:91f8  08			php
$0d:91f9  42 18		 wdm #$18
$0d:91fb  63 9c		 adc $9c,s
$0d:91fd  73 18		 adc ($18,s),y
$0d:91ff  63 94		 adc $94,s
$0d:9201  52 01		 eor ($01)
$0d:9203  4b			phk
$0d:9204  92 21		 sta ($21)
$0d:9206  19 07 01	  ora $0107,y
$0d:9209  4d 92 21	  eor $2192
$0d:920c  19 06 01	  ora $0106,y
$0d:920f  4f 92 21 19   eor $192192
$0d:9213  05 01		 ora $01
$0d:9215  51 92		 eor ($92),y
$0d:9217  21 19		 and ($19,x)
$0d:9219  05 01		 ora $01
$0d:921b  53 92		 eor ($92,s),y
$0d:921d  21 19		 and ($19,x)
$0d:921f  06 01		 asl $01
$0d:9221  55 92		 eor $92,x
$0d:9223  21 19		 and ($19,x)
$0d:9225  07 01		 ora [$01]
$0d:9227  57 92		 eor [$92],y
$0d:9229  21 19		 and ($19,x)
$0d:922b  07 01		 ora [$01]
$0d:922d  59 92 21	  eor $2192,y
$0d:9230  19 06 01	  ora $0106,y
$0d:9233  5b			tcd
$0d:9234  92 21		 sta ($21)
$0d:9236  19 05 01	  ora $0105,y
$0d:9239  5d 92 21	  eor $2192,x
$0d:923c  19 05 01	  ora $0105,y
$0d:923f  5f 92 21 19   eor $192192,x
$0d:9243  06 01		 asl $01
$0d:9245  61 92		 adc ($92,x)
$0d:9247  21 19		 and ($19,x)
$0d:9249  07 00		 ora [$00]
$0d:924b  24 2d		 bit $2d
$0d:924d  02 25		 cop #$25
$0d:924f  e2 24		 sep #$24
$0d:9251  22 35 84 3d   jsl $3d8435
$0d:9255  48			pha
$0d:9256  52 10		 eor ($10)
$0d:9258  63 48		 adc $48,s
$0d:925a  52 84		 eor ($84)
$0d:925c  3d 22 35	  and $3522,x
$0d:925f  e2 24		 sep #$24
$0d:9261  02 25		 cop #$25
$0d:9263  24 2d		 bit $2d
$0d:9265  02 25		 cop #$25
$0d:9267  e2 24		 sep #$24
$0d:9269  22 35 84 3d   jsl $3d8435
$0d:926d  48			pha
$0d:926e  52 10		 eor ($10)
$0d:9270  63 48		 adc $48,s
$0d:9272  52 84		 eor ($84)
$0d:9274  3d 22 35	  and $3522,x
$0d:9277  e2 24		 sep #$24
$0d:9279  02 25		 cop #$25
$0d:927b  01 ac		 ora ($ac,x)
$0d:927d  92 51		 sta ($51)
$0d:927f  19 0b 01	  ora $010b,y
$0d:9282  c6 92		 dec $92
$0d:9284  51 19		 eor ($19),y
$0d:9286  0a			asl a
$0d:9287  01 e0		 ora ($e0,x)
$0d:9289  92 51		 sta ($51)
$0d:928b  19 09 01	  ora $0109,y
$0d:928e  fa			plx
$0d:928f  92 51		 sta ($51)
$0d:9291  19 08 01	  ora $0108,y
$0d:9294  14 93		 trb $93
$0d:9296  51 19		 eor ($19),y
$0d:9298  08			php
$0d:9299  01 2e		 ora ($2e,x)
$0d:929b  93 51		 sta ($51,s),y
$0d:929d  19 09 01	  ora $0109,y
$0d:92a0  48			pha
$0d:92a1  93 51		 sta ($51,s),y
$0d:92a3  19 0a 01	  ora $010a,y
$0d:92a6  62 93 51	  per $e43c
$0d:92a9  19 0b 00	  ora $000b,y
$0d:92ac  4a			lsr a
$0d:92ad  00 74		 brk #$74
$0d:92af  00 d6		 brk #$d6
$0d:92b1  00 58		 brk #$58
$0d:92b3  01 da		 ora ($da,x)
$0d:92b5  0d dc 1a	  ora $1adc
$0d:92b8  6c 00 cc	  jmp ($cc00)
$0d:92bb  10 2c		 bpl $92e9
$0d:92bd  29 6d		 and #$6d
$0d:92bf  41 2e		 eor ($2e,x)
$0d:92c1  4e d4 00	  lsr $00d4
$0d:92c4  58			cli
$0d:92c5  01 6c		 ora ($6c,x)
$0d:92c7  00 b5		 brk #$b5
$0d:92c9  00 36		 brk #$36
$0d:92cb  05 98		 ora $98
$0d:92cd  09 1a		 ora #$1a
$0d:92cf  12 1c		 ora ($1c)
$0d:92d1  27 6e		 and [$6e]
$0d:92d3  00 cc		 brk #$cc
$0d:92d5  10 2c		 bpl $9303
$0d:92d7  29 6d		 and #$6d
$0d:92d9  41 2e		 eor ($2e,x)
$0d:92db  4e d4 00	  lsr $00d4
$0d:92de  58			cli
$0d:92df  01 ae		 ora ($ae,x)
$0d:92e1  00 f6		 brk #$f6
$0d:92e3  04 77		 tsb $77
$0d:92e5  09 d9		 ora #$d9
$0d:92e7  11 5a		 ora ($5a),y
$0d:92e9  1a			inc a
$0d:92ea  5c 37 70 00   jml $007037
$0d:92ee  cc 10 2c	  cpy $2c10
$0d:92f1  29 6d		 and #$6d
$0d:92f3  41 2e		 eor ($2e,x)
$0d:92f5  4e d4 00	  lsr $00d4
$0d:92f8  58			cli
$0d:92f9  01 d0		 ora ($d0,x)
$0d:92fb  00 38		 brk #$38
$0d:92fd  09 b8		 ora #$b8
$0d:92ff  11 1a		 ora ($1a),y
$0d:9301  1a			inc a
$0d:9302  da			phx
$0d:9303  22 9c 43 72   jsl $72439c
$0d:9307  00 cc		 brk #$cc
$0d:9309  10 2c		 bpl $9337
$0d:930b  29 6d		 and #$6d
$0d:930d  41 2e		 eor ($2e,x)
$0d:930f  4e d4 00	  lsr $00d4
$0d:9312  58			cli
$0d:9313  01 af		 ora ($af,x)
$0d:9315  00 17		 brk #$17
$0d:9317  05 97		 ora $97
$0d:9319  0d f9 15	  ora $15f9
$0d:931c  9a			txs
$0d:931d  1e 7c 3b	  asl $3b7c,x
$0d:9320  71 00		 adc ($00),y
$0d:9322  cc 10 2c	  cpy $2c10
$0d:9325  29 6d		 and #$6d
$0d:9327  41 2e		 eor ($2e,x)
$0d:9329  4e d4 00	  lsr $00d4
$0d:932c  58			cli
$0d:932d  01 8d		 ora ($8d,x)
$0d:932f  00 d6		 brk #$d6
$0d:9331  04 57		 tsb $57
$0d:9333  09 b9		 ora #$b9
$0d:9335  0d 5a 16	  ora $165a
$0d:9338  3c 33 6f	  bit $6f33,x
$0d:933b  00 cc		 brk #$cc
$0d:933d  10 2c		 bpl $936b
$0d:933f  29 6d		 and #$6d
$0d:9341  41 2e		 eor ($2e,x)
$0d:9343  4e d4 00	  lsr $00d4
$0d:9346  58			cli
$0d:9347  01 6b		 ora ($6b,x)
$0d:9349  00 b5		 brk #$b5
$0d:934b  00 16		 brk #$16
$0d:934d  05 98		 ora $98
$0d:934f  09 1a		 ora #$1a
$0d:9351  12 fc		 ora ($fc)
$0d:9353  26 6d		 rol $6d
$0d:9355  00 cc		 brk #$cc
$0d:9357  10 2c		 bpl $9385
$0d:9359  29 6d		 and #$6d
$0d:935b  41 2e		 eor ($2e,x)
$0d:935d  4e d4 00	  lsr $00d4
$0d:9360  58			cli
$0d:9361  01 4a		 ora ($4a,x)
$0d:9363  00 74		 brk #$74
$0d:9365  00 d6		 brk #$d6
$0d:9367  00 58		 brk #$58
$0d:9369  01 da		 ora ($da,x)
$0d:936b  0d dc 1a	  ora $1adc
$0d:936e  6c 00 cc	  jmp ($cc00)
$0d:9371  10 2c		 bpl $939f
$0d:9373  29 6d		 and #$6d
$0d:9375  41 2e		 eor ($2e,x)
$0d:9377  4e d4 00	  lsr $00d4
$0d:937a  58			cli
$0d:937b  01 01		 ora ($01,x)
$0d:937d  ad 93 70	  lda $7093
$0d:9380  19 0b 01	  ora $010b,y
$0d:9383  c7 93		 cmp [$93]
$0d:9385  70 19		 bvs $93a0
$0d:9387  0a			asl a
$0d:9388  01 e1		 ora ($e1,x)
$0d:938a  93 70		 sta ($70,s),y
$0d:938c  19 09 01	  ora $0109,y
$0d:938f  fb			xce
$0d:9390  93 70		 sta ($70,s),y
$0d:9392  19 0a 01	  ora $010a,y
$0d:9395  15 94		 ora $94,x
$0d:9397  70 19		 bvs $93b2
$0d:9399  0b			phd
$0d:939a  01 2f		 ora ($2f,x)
$0d:939c  94 70		 sty $70,x
$0d:939e  19 0a 01	  ora $010a,y
$0d:93a1  49 94		 eor #$94
$0d:93a3  70 19		 bvs $93be
$0d:93a5  09 01		 ora #$01
$0d:93a7  63 94		 adc $94,s
$0d:93a9  70 19		 bvs $93c4
$0d:93ab  0a			asl a
$0d:93ac  00 00		 brk #$00
$0d:93ae  00 28		 brk #$28
$0d:93b0  46 04		 lsr $04
$0d:93b2  29 68		 and #$68
$0d:93b4  35 ca		 and $ca,x
$0d:93b6  41 4e		 eor ($4e,x)
$0d:93b8  4e ea 3d	  lsr $3dea
$0d:93bb  88			dey
$0d:93bc  31 44		 and ($44),y
$0d:93be  29 10		 and #$10
$0d:93c0  42 73		 wdm #$73
$0d:93c2  4e 18 63	  lsr $6318
$0d:93c5  b5 56		 lda $56,x
$0d:93c7  00 00		 brk #$00
$0d:93c9  ea			nop
$0d:93ca  3d 4e 4e	  and $4e4e,x
$0d:93cd  04 29		 tsb $29
$0d:93cf  68			pla
$0d:93d0  35 ca		 and $ca,x
$0d:93d2  41 88		 eor ($88,x)
$0d:93d4  31 44		 and ($44),y
$0d:93d6  29 28		 and #$28
$0d:93d8  46 b5		 lsr $b5
$0d:93da  56 10		 lsr $10,x
$0d:93dc  42 73		 wdm #$73
$0d:93de  4e 18 63	  lsr $6318
$0d:93e1  00 00		 brk #$00
$0d:93e3  88			dey
$0d:93e4  31 ca		 and ($ca),y
$0d:93e6  41 4e		 eor ($4e,x)
$0d:93e8  4e 04 29	  lsr $2904
$0d:93eb  68			pla
$0d:93ec  35 44		 and $44,x
$0d:93ee  29 28		 and #$28
$0d:93f0  46 ea		 lsr $ea
$0d:93f2  3d 18 63	  and $6318,x
$0d:93f5  b5 56		 lda $56,x
$0d:93f7  10 42		 bpl $943b
$0d:93f9  73 4e		 adc ($4e,s),y
$0d:93fb  00 00		 brk #$00
$0d:93fd  44 29 68	  mvp $68,$29
$0d:9400  35 ca		 and $ca,x
$0d:9402  41 4e		 eor ($4e,x)
$0d:9404  4e 04 29	  lsr $2904
$0d:9407  28			plp
$0d:9408  46 ea		 lsr $ea
$0d:940a  3d 88 31	  and $3188,x
$0d:940d  73 4e		 adc ($4e,s),y
$0d:940f  18			clc
$0d:9410  63 b5		 adc $b5,s
$0d:9412  56 10		 lsr $10,x
$0d:9414  42 00		 wdm #$00
$0d:9416  00 28		 brk #$28
$0d:9418  46 04		 lsr $04
$0d:941a  29 68		 and #$68
$0d:941c  35 ca		 and $ca,x
$0d:941e  41 4e		 eor ($4e,x)
$0d:9420  4e ea 3d	  lsr $3dea
$0d:9423  88			dey
$0d:9424  31 44		 and ($44),y
$0d:9426  29 10		 and #$10
$0d:9428  42 73		 wdm #$73
$0d:942a  4e 18 63	  lsr $6318
$0d:942d  b5 56		 lda $56,x
$0d:942f  00 00		 brk #$00
$0d:9431  ea			nop
$0d:9432  3d 4e 4e	  and $4e4e,x
$0d:9435  04 29		 tsb $29
$0d:9437  68			pla
$0d:9438  35 ca		 and $ca,x
$0d:943a  41 88		 eor ($88,x)
$0d:943c  31 44		 and ($44),y
$0d:943e  29 28		 and #$28
$0d:9440  46 b5		 lsr $b5
$0d:9442  56 10		 lsr $10,x
$0d:9444  42 73		 wdm #$73
$0d:9446  4e 18 63	  lsr $6318
$0d:9449  00 00		 brk #$00
$0d:944b  88			dey
$0d:944c  31 ca		 and ($ca),y
$0d:944e  41 4e		 eor ($4e,x)
$0d:9450  4e 04 29	  lsr $2904
$0d:9453  68			pla
$0d:9454  35 44		 and $44,x
$0d:9456  29 28		 and #$28
$0d:9458  46 ea		 lsr $ea
$0d:945a  3d 18 63	  and $6318,x
$0d:945d  b5 56		 lda $56,x
$0d:945f  10 42		 bpl $94a3
$0d:9461  73 4e		 adc ($4e,s),y
$0d:9463  00 00		 brk #$00
$0d:9465  44 29 68	  mvp $68,$29
$0d:9468  35 ca		 and $ca,x
$0d:946a  41 4e		 eor ($4e,x)
$0d:946c  4e 04 29	  lsr $2904
$0d:946f  28			plp
$0d:9470  46 ea		 lsr $ea
$0d:9472  3d 88 31	  and $3188,x
$0d:9475  73 4e		 adc ($4e,s),y
$0d:9477  18			clc
$0d:9478  63 b5		 adc $b5,s
$0d:947a  56 10		 lsr $10,x
$0d:947c  42 01		 wdm #$01
$0d:947e  c6 94		 dec $94
$0d:9480  21 19		 and ($19,x)
$0d:9482  07 01		 ora [$01]
$0d:9484  c8			iny
$0d:9485  94 21		 sty $21,x
$0d:9487  19 06 01	  ora $0106,y
$0d:948a  ca			dex
$0d:948b  94 21		 sty $21,x
$0d:948d  19 05 01	  ora $0105,y
$0d:9490  cc 94 21	  cpy $2194
$0d:9493  19 05 01	  ora $0105,y
$0d:9496  ce 94 21	  dec $2194
$0d:9499  19 06 01	  ora $0106,y
$0d:949c  d0 94		 bne $9432
$0d:949e  21 19		 and ($19,x)
$0d:94a0  07 01		 ora [$01]
$0d:94a2  d2 94		 cmp ($94)
$0d:94a4  21 19		 and ($19,x)
$0d:94a6  07 01		 ora [$01]
$0d:94a8  d4 94		 pei ($94)
$0d:94aa  21 19		 and ($19,x)
$0d:94ac  06 01		 asl $01
$0d:94ae  d6 94		 dec $94,x
$0d:94b0  21 19		 and ($19,x)
$0d:94b2  05 01		 ora $01
$0d:94b4  d8			cld
$0d:94b5  94 21		 sty $21,x
$0d:94b7  19 05 01	  ora $0105,y
$0d:94ba  da			phx
$0d:94bb  94 21		 sty $21,x
$0d:94bd  19 06 01	  ora $0106,y
$0d:94c0  dc 94 21	  jml [$2194]
$0d:94c3  19 07 00	  ora $0007,y
$0d:94c6  64 35		 stz $35
$0d:94c8  62 31 62	  per $f6fc
$0d:94cb  2d a2 35	  and $35a2
$0d:94ce  04 42		 tsb $42
$0d:94d0  88			dey
$0d:94d1  52 10		 eor ($10)
$0d:94d3  63 88		 adc $88,s
$0d:94d5  52 04		 eor ($04)
$0d:94d7  42 a2		 wdm #$a2
$0d:94d9  35 62		 and $62,x
$0d:94db  2d 62 31	  and $3162
$0d:94de  64 35		 stz $35
$0d:94e0  62 31 62	  per $f714
$0d:94e3  2d a2 35	  and $35a2
$0d:94e6  04 42		 tsb $42
$0d:94e8  88			dey
$0d:94e9  52 10		 eor ($10)
$0d:94eb  63 88		 adc $88,s
$0d:94ed  52 04		 eor ($04)
$0d:94ef  42 a2		 wdm #$a2
$0d:94f1  35 62		 and $62,x
$0d:94f3  2d 62 31	  and $3162
$0d:94f6  01 3f		 ora ($3f,x)
$0d:94f8  95 21		 sta $21,x
$0d:94fa  19 07 01	  ora $0107,y
$0d:94fd  41 95		 eor ($95,x)
$0d:94ff  21 19		 and ($19,x)
$0d:9501  06 01		 asl $01
$0d:9503  43 95		 eor $95,s
$0d:9505  21 19		 and ($19,x)
$0d:9507  05 01		 ora $01
$0d:9509  45 95		 eor $95
$0d:950b  21 19		 and ($19,x)
$0d:950d  05 01		 ora $01
$0d:950f  47 95		 eor [$95]
$0d:9511  21 19		 and ($19,x)
$0d:9513  06 01		 asl $01
$0d:9515  49 95		 eor #$95
$0d:9517  21 19		 and ($19,x)
$0d:9519  07 01		 ora [$01]
$0d:951b  4b			phk
$0d:951c  95 21		 sta $21,x
$0d:951e  19 07 01	  ora $0107,y
$0d:9521  4d 95 21	  eor $2195
$0d:9524  19 06 01	  ora $0106,y
$0d:9527  4f 95 21 19   eor $192195
$0d:952b  05 01		 ora $01
$0d:952d  51 95		 eor ($95),y
$0d:952f  21 19		 and ($19,x)
$0d:9531  05 01		 ora $01
$0d:9533  53 95		 eor ($95,s),y
$0d:9535  21 19		 and ($19,x)
$0d:9537  06 01		 asl $01
$0d:9539  55 95		 eor $95,x
$0d:953b  21 19		 and ($19,x)
$0d:953d  07 00		 ora [$00]
$0d:953f  e4 24		 cpx $24
$0d:9541  e2 20		 sep #$20
$0d:9543  e2 1c		 sep #$1c
$0d:9545  42 2d		 wdm #$2d
$0d:9547  a4 3d		 ldy $3d
$0d:9549  08			php
$0d:954a  4a			lsr a
$0d:954b  90 5a		 bcc $95a7
$0d:954d  08			php
$0d:954e  4a			lsr a
$0d:954f  a4 3d		 ldy $3d
$0d:9551  42 2d		 wdm #$2d
$0d:9553  e2 1c		 sep #$1c
$0d:9555  e2 20		 sep #$20
$0d:9557  e4 24		 cpx $24
$0d:9559  e2 20		 sep #$20
$0d:955b  e2 1c		 sep #$1c
$0d:955d  42 2d		 wdm #$2d
$0d:955f  a4 3d		 ldy $3d
$0d:9561  08			php
$0d:9562  4a			lsr a
$0d:9563  90 5a		 bcc $95bf
$0d:9565  08			php
$0d:9566  4a			lsr a
$0d:9567  a4 3d		 ldy $3d
$0d:9569  42 2d		 wdm #$2d
$0d:956b  e2 1c		 sep #$1c
$0d:956d  e2 20		 sep #$20
$0d:956f  01 b8		 ora ($b8,x)
$0d:9571  95 21		 sta $21,x
$0d:9573  19 07 01	  ora $0107,y
$0d:9576  ba			tsx
$0d:9577  95 21		 sta $21,x
$0d:9579  19 06 01	  ora $0106,y
$0d:957c  bc 95 21	  ldy $2195,x
$0d:957f  19 05 01	  ora $0105,y
$0d:9582  be 95 21	  ldx $2195,y
$0d:9585  19 05 01	  ora $0105,y
$0d:9588  c0 95		 cpy #$95
$0d:958a  21 19		 and ($19,x)
$0d:958c  06 01		 asl $01
$0d:958e  c2 95		 rep #$95
$0d:9590  21 19		 and ($19,x)
$0d:9592  07 01		 ora [$01]
$0d:9594  c4 95		 cpy $95
$0d:9596  21 19		 and ($19,x)
$0d:9598  07 01		 ora [$01]
$0d:959a  c6 95		 dec $95
$0d:959c  21 19		 and ($19,x)
$0d:959e  06 01		 asl $01
$0d:95a0  c8			iny
$0d:95a1  95 21		 sta $21,x
$0d:95a3  19 05 01	  ora $0105,y
$0d:95a6  ca			dex
$0d:95a7  95 21		 sta $21,x
$0d:95a9  19 05 01	  ora $0105,y
$0d:95ac  cc 95 21	  cpy $2195
$0d:95af  19 06 01	  ora $0106,y
$0d:95b2  ce 95 21	  dec $2195
$0d:95b5  19 07 00	  ora $0007,y
$0d:95b8  04 2d		 tsb $2d
$0d:95ba  c2 24		 rep #$24
$0d:95bc  82 28 e2	  brl $77e7
$0d:95bf  34 44		 bit $44,x
$0d:95c1  3d 08 52	  and $5208,x
$0d:95c4  d0 62		 bne $9628
$0d:95c6  08			php
$0d:95c7  52 44		 eor ($44)
$0d:95c9  3d e2 34	  and $34e2,x
$0d:95cc  82 28 c2	  brl $57f7
$0d:95cf  24 04		 bit $04
$0d:95d1  2d c2 24	  and $24c2
$0d:95d4  82 28 e2	  brl $77ff
$0d:95d7  34 44		 bit $44,x
$0d:95d9  3d 08 52	  and $5208,x
$0d:95dc  d0 62		 bne $9640
$0d:95de  08			php
$0d:95df  52 44		 eor ($44)
$0d:95e1  3d e2 34	  and $34e2,x
$0d:95e4  82 28 c2	  brl $580f
$0d:95e7  24 01		 bit $01
$0d:95e9  47 96		 eor [$96]
$0d:95eb  21 19		 and ($19,x)
$0d:95ed  00 01		 brk #$01
$0d:95ef  45 96		 eor $96
$0d:95f1  21 19		 and ($19,x)
$0d:95f3  00 01		 brk #$01
$0d:95f5  43 96		 eor $96,s
$0d:95f7  21 19		 and ($19,x)
$0d:95f9  00 01		 brk #$01
$0d:95fb  41 96		 eor ($96,x)
$0d:95fd  21 19		 and ($19,x)
$0d:95ff  00 01		 brk #$01
$0d:9601  3f 96 21 19   and $192196,x
$0d:9605  00 01		 brk #$01
$0d:9607  3d 96 21	  and $2196,x
$0d:960a  19 00 01	  ora $0100,y
$0d:960d  3b			tsc
$0d:960e  96 21		 stx $21,y
$0d:9610  19 00 01	  ora $0100,y
$0d:9613  39 96 21	  and $2196,y
$0d:9616  19 00 01	  ora $0100,y
$0d:9619  37 96		 and [$96],y
$0d:961b  21 19		 and ($19,x)
$0d:961d  00 01		 brk #$01
$0d:961f  35 96		 and $96,x
$0d:9621  21 19		 and ($19,x)
$0d:9623  00 01		 brk #$01
$0d:9625  33 96		 and ($96,s),y
$0d:9627  21 19		 and ($19,x)
$0d:9629  00 01		 brk #$01
$0d:962b  31 96		 and ($96),y
$0d:962d  21 19		 and ($19,x)
$0d:962f  00 00		 brk #$00
$0d:9631  ef 3d 31 46   sbc $46313d
$0d:9635  73 4e		 adc ($4e,s),y
$0d:9637  b5 56		 lda $56,x
$0d:9639  18			clc
$0d:963a  63 7b		 adc $7b,s
$0d:963c  6f de 7b 7b   adc $7b7bde
$0d:9640  6f 18 63 b5   adc $b56318
$0d:9644  56 73		 lsr $73,x
$0d:9646  4e 31 46	  lsr $4631
$0d:9649  ef 3d 31 46   sbc $46313d
$0d:964d  73 4e		 adc ($4e,s),y
$0d:964f  b5 56		 lda $56,x
$0d:9651  18			clc
$0d:9652  63 7b		 adc $7b,s
$0d:9654  6f de 7b 7b   adc $7b7bde
$0d:9658  6f 18 63 b5   adc $b56318
$0d:965c  56 73		 lsr $73,x
$0d:965e  4e 31 46	  lsr $4631
$0d:9661  01 86		 ora ($86,x)
$0d:9663  96 71		 stx $71,y
$0d:9665  17 02		 ora [$02],y
$0d:9667  01 9e		 ora ($9e,x)
$0d:9669  96 71		 stx $71,y
$0d:966b  17 02		 ora [$02],y
$0d:966d  01 b6		 ora ($b6,x)
$0d:966f  96 71		 stx $71,y
$0d:9671  17 02		 ora [$02],y
$0d:9673  01 ce		 ora ($ce,x)
$0d:9675  96 71		 stx $71,y
$0d:9677  17 02		 ora [$02],y
$0d:9679  01 e6		 ora ($e6,x)
$0d:967b  96 71		 stx $71,y
$0d:967d  17 02		 ora [$02],y
$0d:967f  01 fe		 ora ($fe,x)
$0d:9681  96 71		 stx $71,y
$0d:9683  17 02		 ora [$02],y
$0d:9685  00 43		 brk #$43
$0d:9687  49 87 51	  eor #$5187
$0d:968a  eb			xba
$0d:968b  5d 6e 62	  eor $626e,x
$0d:968e  e5 5d		 sbc $5d
$0d:9690  83 51		 sta $51,s
$0d:9692  05 3d		 ora $3d
$0d:9694  46 41		 lsr $41
$0d:9696  8a			txa
$0d:9697  49 eb 51	  eor #$51eb
$0d:969a  8a			txa
$0d:969b  49 46 41	  eor #$4146
$0d:969e  83 51		 sta $51,s
$0d:96a0  43 49		 eor $49,s
$0d:96a2  87 51		 sta [$51]
$0d:96a4  eb			xba
$0d:96a5  5d 6e 62	  eor $626e,x
$0d:96a8  e5 5d		 sbc $5d
$0d:96aa  46 41		 lsr $41
$0d:96ac  05 3d		 ora $3d
$0d:96ae  46 41		 lsr $41
$0d:96b0  8a			txa
$0d:96b1  49 eb 51	  eor #$51eb
$0d:96b4  8a			txa
$0d:96b5  49 e5 5d	  eor #$5de5
$0d:96b8  83 51		 sta $51,s
$0d:96ba  43 49		 eor $49,s
$0d:96bc  87 51		 sta [$51]
$0d:96be  eb			xba
$0d:96bf  5d 6e 62	  eor $626e,x
$0d:96c2  8a			txa
$0d:96c3  49 46 41	  eor #$4146
$0d:96c6  05 3d		 ora $3d
$0d:96c8  46 41		 lsr $41
$0d:96ca  8a			txa
$0d:96cb  49 eb 51	  eor #$51eb
$0d:96ce  6e 62 e5	  ror $e562
$0d:96d1  5d 83 51	  eor $5183,x
$0d:96d4  43 49		 eor $49,s
$0d:96d6  87 51		 sta [$51]
$0d:96d8  eb			xba
$0d:96d9  5d eb 51	  eor $51eb,x
$0d:96dc  8a			txa
$0d:96dd  49 46 41	  eor #$4146
$0d:96e0  05 3d		 ora $3d
$0d:96e2  46 41		 lsr $41
$0d:96e4  8a			txa
$0d:96e5  49 eb 5d	  eor #$5deb
$0d:96e8  6e 62 e5	  ror $e562
$0d:96eb  5d 83 51	  eor $5183,x
$0d:96ee  43 49		 eor $49,s
$0d:96f0  87 51		 sta [$51]
$0d:96f2  8a			txa
$0d:96f3  49 eb 51	  eor #$51eb
$0d:96f6  8a			txa
$0d:96f7  49 46 41	  eor #$4146
$0d:96fa  05 3d		 ora $3d
$0d:96fc  46 41		 lsr $41
$0d:96fe  87 51		 sta [$51]
$0d:9700  eb			xba
$0d:9701  5d 6e 62	  eor $626e,x
$0d:9704  e5 5d		 sbc $5d
$0d:9706  83 51		 sta $51,s
$0d:9708  43 49		 eor $49,s
$0d:970a  46 41		 lsr $41
$0d:970c  8a			txa
$0d:970d  49 eb 51	  eor #$51eb
$0d:9710  8a			txa
$0d:9711  49 46 41	  eor #$4146
$0d:9714  05 3d		 ora $3d
$0d:9716  01 35		 ora ($35,x)
$0d:9718  97 51		 sta [$51],y
$0d:971a  0d 2a 01	  ora $012a
$0d:971d  43 97		 eor $97,s
$0d:971f  51 0d		 eor ($0d),y
$0d:9721  01 01		 ora ($01,x)
$0d:9723  51 97		 eor ($97),y
$0d:9725  51 0d		 eor ($0d),y
$0d:9727  02 01		 cop #$01
$0d:9729  5f 97 51 0d   eor $0d5197,x
$0d:972d  02 01		 cop #$01
$0d:972f  6d 97 51	  adc $5197
$0d:9732  0d 02 00	  ora $0002
$0d:9735  98			tya
$0d:9736  73 98		 adc ($98,s),y
$0d:9738  73 4a		 adc ($4a,s),y
$0d:973a  5a			phy
$0d:973b  8e 62 d2	  stx $d262
$0d:973e  6a			ror a
$0d:973f  34 73		 bit $73,x
$0d:9741  98			tya
$0d:9742  73 98		 adc ($98,s),y
$0d:9744  73 98		 adc ($98,s),y
$0d:9746  73 4a		 adc ($4a,s),y
$0d:9748  5a			phy
$0d:9749  8e 62 d2	  stx $d262
$0d:974c  6a			ror a
$0d:974d  34 73		 bit $73,x
$0d:974f  ff 7f 98 73   sbc $73987f,x
$0d:9753  ff 7f 4a 5a   sbc $5a4a7f,x
$0d:9757  8e 62 d2	  stx $d262
$0d:975a  6a			ror a
$0d:975b  34 73		 bit $73,x
$0d:975d  dc 7b ff	  jml [$ff7b]
$0d:9760  7f dc 7b 4a   adc $4a7bdc,x
$0d:9764  5a			phy
$0d:9765  8e 62 d2	  stx $d262
$0d:9768  6a			ror a
$0d:9769  34 73		 bit $73,x
$0d:976b  98			tya
$0d:976c  73 dc		 adc ($dc,s),y
$0d:976e  7b			tdc
$0d:976f  98			tya
$0d:9770  73 4a		 adc ($4a,s),y
$0d:9772  5a			phy
$0d:9773  8e 62 d2	  stx $d262
$0d:9776  6a			ror a
$0d:9777  34 73		 bit $73,x
$0d:9779  98			tya
$0d:977a  73 0c		 adc ($0c,s),y
$0d:977c  82 97 38	  brl $d016
$0d:977f  0f 07 00 04   ora $040007
$0d:9783  3d c2 38	  and $38c2,x
$0d:9786  c2 38		 rep #$38
$0d:9788  c2 38		 rep #$38
$0d:978a  46 41		 lsr $41
$0d:978c  88			dey
$0d:978d  4d 0c 5a	  eor $5a0c
$0d:9790  88			dey
$0d:9791  4d 46 41	  eor $4146
$0d:9794  04 3d		 tsb $3d
$0d:9796  c2 38		 rep #$38
$0d:9798  c2 38		 rep #$38
$0d:979a  04 3d		 tsb $3d
$0d:979c  88			dey
$0d:979d  4d cc 51	  eor $51cc
$0d:97a0  46 41		 lsr $41
$0d:97a2  04 3d		 tsb $3d
$0d:97a4  46 41		 lsr $41
$0d:97a6  04 3d		 tsb $3d
$0d:97a8  c2 38		 rep #$38
$0d:97aa  04 3d		 tsb $3d
$0d:97ac  46 41		 lsr $41
$0d:97ae  88			dey
$0d:97af  4d 04 3d	  eor $3d04
$0d:97b2  04 3d		 tsb $3d
$0d:97b4  88			dey
$0d:97b5  4d 46 41	  eor $4146
$0d:97b8  c2 38		 rep #$38
$0d:97ba  c2 38		 rep #$38
$0d:97bc  04 3d		 tsb $3d
$0d:97be  46 41		 lsr $41
$0d:97c0  04 3d		 tsb $3d
$0d:97c2  46 41		 lsr $41
$0d:97c4  cc 51 88	  cpy $8851
$0d:97c7  4d 04 3d	  eor $3d04
$0d:97ca  c2 38		 rep #$38
$0d:97cc  c2 38		 rep #$38
$0d:97ce  04 3d		 tsb $3d
$0d:97d0  46 41		 lsr $41
$0d:97d2  88			dey
$0d:97d3  4d 0c 5a	  eor $5a0c
$0d:97d6  88			dey
$0d:97d7  4d 46 41	  eor $4146
$0d:97da  c2 38		 rep #$38
$0d:97dc  c2 38		 rep #$38
$0d:97de  c2 38		 rep #$38
$0d:97e0  04 3d		 tsb $3d
$0d:97e2  46 41		 lsr $41
$0d:97e4  88			dey
$0d:97e5  4d 0c 5a	  eor $5a0c
$0d:97e8  88			dey
$0d:97e9  4d 04 3d	  eor $3d04
$0d:97ec  c2 38		 rep #$38
$0d:97ee  c2 38		 rep #$38
$0d:97f0  c2 38		 rep #$38
$0d:97f2  04 3d		 tsb $3d
$0d:97f4  88			dey
$0d:97f5  4d cc 51	  eor $51cc
$0d:97f8  46 41		 lsr $41
$0d:97fa  46 41		 lsr $41
$0d:97fc  04 3d		 tsb $3d
$0d:97fe  c2 38		 rep #$38
$0d:9800  c2 38		 rep #$38
$0d:9802  04 3d		 tsb $3d
$0d:9804  46 41		 lsr $41
$0d:9806  88			dey
$0d:9807  4d 04 3d	  eor $3d04
$0d:980a  04 3d		 tsb $3d
$0d:980c  46 41		 lsr $41
$0d:980e  04 3d		 tsb $3d
$0d:9810  c2 38		 rep #$38
$0d:9812  c2 38		 rep #$38
$0d:9814  04 3d		 tsb $3d
$0d:9816  46 41		 lsr $41
$0d:9818  04 3d		 tsb $3d
$0d:981a  04 3d		 tsb $3d
$0d:981c  88			dey
$0d:981d  4d 46 41	  eor $4146
$0d:9820  c2 38		 rep #$38
$0d:9822  c2 38		 rep #$38
$0d:9824  c2 38		 rep #$38
$0d:9826  04 3d		 tsb $3d
$0d:9828  46 41		 lsr $41
$0d:982a  46 41		 lsr $41
$0d:982c  cc 51 88	  cpy $8851
$0d:982f  4d 04 3d	  eor $3d04
$0d:9832  c2 38		 rep #$38
$0d:9834  c2 38		 rep #$38
$0d:9836  c2 38		 rep #$38
$0d:9838  04 3d		 tsb $3d
$0d:983a  88			dey
$0d:983b  4d 0c 5a	  eor $5a0c
$0d:983e  88			dey
$0d:983f  4d 46 41	  eor $4146
$0d:9842  01 cd		 ora ($cd,x)
$0d:9844  98			tya
$0d:9845  21 0f		 and ($0f,x)
$0d:9847  09 01 bd	  ora #$bd01
$0d:984a  98			tya
$0d:984b  21 0f		 and ($0f,x)
$0d:984d  09 01 ad	  ora #$ad01
$0d:9850  98			tya
$0d:9851  21 0f		 and ($0f,x)
$0d:9853  09 01 9d	  ora #$9d01
$0d:9856  98			tya
$0d:9857  21 0f		 and ($0f,x)
$0d:9859  09 01 8d	  ora #$8d01
$0d:985c  98			tya
$0d:985d  21 0f		 and ($0f,x)
$0d:985f  09 01 7d	  ora #$7d01
$0d:9862  98			tya
$0d:9863  21 0f		 and ($0f,x)
$0d:9865  09 01 6d	  ora #$6d01
$0d:9868  98			tya
$0d:9869  21 0f		 and ($0f,x)
$0d:986b  09 00 c2	  ora #$c200
$0d:986e  10 e2		 bpl $9852
$0d:9870  14 03		 trb $03
$0d:9872  19 45 21	  ora $2145,y
$0d:9875  03 19		 ora $19,s
$0d:9877  e2 14		 sep #$14
$0d:9879  c2 10		 rep #$10
$0d:987b  00 00		 brk #$00
$0d:987d  c2 10		 rep #$10
$0d:987f  c2 10		 rep #$10
$0d:9881  e2 14		 sep #$14
$0d:9883  03 19		 ora $19,s
$0d:9885  45 21		 eor $21
$0d:9887  03 19		 ora $19,s
$0d:9889  e2 14		 sep #$14
$0d:988b  00 00		 brk #$00
$0d:988d  e2 14		 sep #$14
$0d:988f  c2 10		 rep #$10
$0d:9891  c2 10		 rep #$10
$0d:9893  e2 14		 sep #$14
$0d:9895  03 19		 ora $19,s
$0d:9897  45 21		 eor $21
$0d:9899  03 19		 ora $19,s
$0d:989b  00 00		 brk #$00
$0d:989d  03 19		 ora $19,s
$0d:989f  e2 14		 sep #$14
$0d:98a1  c2 10		 rep #$10
$0d:98a3  c2 10		 rep #$10
$0d:98a5  e2 14		 sep #$14
$0d:98a7  03 19		 ora $19,s
$0d:98a9  45 21		 eor $21
$0d:98ab  00 00		 brk #$00
$0d:98ad  45 21		 eor $21
$0d:98af  03 19		 ora $19,s
$0d:98b1  e2 14		 sep #$14
$0d:98b3  c2 10		 rep #$10
$0d:98b5  c2 10		 rep #$10
$0d:98b7  e2 14		 sep #$14
$0d:98b9  03 19		 ora $19,s
$0d:98bb  00 00		 brk #$00
$0d:98bd  03 19		 ora $19,s
$0d:98bf  45 21		 eor $21
$0d:98c1  03 19		 ora $19,s
$0d:98c3  e2 14		 sep #$14
$0d:98c5  c2 10		 rep #$10
$0d:98c7  c2 10		 rep #$10
$0d:98c9  e2 14		 sep #$14
$0d:98cb  00 00		 brk #$00
$0d:98cd  e2 14		 sep #$14
$0d:98cf  03 19		 ora $19,s
$0d:98d1  45 21		 eor $21
$0d:98d3  03 19		 ora $19,s
$0d:98d5  e2 14		 sep #$14
$0d:98d7  c2 10		 rep #$10
$0d:98d9  c2 10		 rep #$10
$0d:98db  00 00		 brk #$00
$0d:98dd  01 26		 ora ($26,x)
$0d:98df  99 21 17	  sta $1721,y
$0d:98e2  07 01		 ora [$01]
$0d:98e4  28			plp
$0d:98e5  99 21 17	  sta $1721,y
$0d:98e8  06 01		 asl $01
$0d:98ea  2a			rol a
$0d:98eb  99 21 17	  sta $1721,y
$0d:98ee  05 01		 ora $01
$0d:98f0  2c 99 21	  bit $2199
$0d:98f3  17 05		 ora [$05],y
$0d:98f5  01 2e		 ora ($2e,x)
$0d:98f7  99 21 17	  sta $1721,y
$0d:98fa  06 01		 asl $01
$0d:98fc  30 99		 bmi $9897
$0d:98fe  21 17		 and ($17,x)
$0d:9900  07 01		 ora [$01]
$0d:9902  32 99		 and ($99)
$0d:9904  21 17		 and ($17,x)
$0d:9906  07 01		 ora [$01]
$0d:9908  34 99		 bit $99,x
$0d:990a  21 17		 and ($17,x)
$0d:990c  06 01		 asl $01
$0d:990e  36 99		 rol $99,x
$0d:9910  21 17		 and ($17,x)
$0d:9912  05 01		 ora $01
$0d:9914  38			sec
$0d:9915  99 21 17	  sta $1721,y
$0d:9918  05 01		 ora $01
$0d:991a  3a			dec a
$0d:991b  99 21 17	  sta $1721,y
$0d:991e  06 01		 asl $01
$0d:9920  3c 99 21	  bit $2199,x
$0d:9923  17 07		 ora [$07],y
$0d:9925  00 c0		 brk #$c0
$0d:9927  2c a0 24	  bit $24a0
$0d:992a  80 28		 bra $9954
$0d:992c  c0 34 00	  cpy #$0034
$0d:992f  3d 60 51	  and $5160,x
$0d:9932  00 62		 brk #$62
$0d:9934  60			rts
$0d:9935  51 00		 eor ($00),y
$0d:9937  3d c0 34	  and $34c0,x
$0d:993a  80 28		 bra $9964
$0d:993c  a1 24		 lda ($24,x)
$0d:993e  c0 2c a2	  cpy #$a22c
$0d:9941  24 80		 bit $80
$0d:9943  28			plp
$0d:9944  c0 34 00	  cpy #$0034
$0d:9947  3d 60 51	  and $5160,x
$0d:994a  00 62		 brk #$62
$0d:994c  60			rts
$0d:994d  51 00		 eor ($00),y
$0d:994f  3d c0 34	  and $34c0,x
$0d:9952  80 28		 bra $997c
$0d:9954  01 9d		 ora ($9d,x)
$0d:9956  99 21 17	  sta $1721,y
$0d:9959  04 01		 tsb $01
$0d:995b  9f 99 21 17   sta $172199,x
$0d:995f  03 01		 ora $01,s
$0d:9961  a1 99		 lda ($99,x)
$0d:9963  21 17		 and ($17,x)
$0d:9965  02 01		 cop #$01
$0d:9967  a3 99		 lda $99,s
$0d:9969  21 17		 and ($17,x)
$0d:996b  02 01		 cop #$01
$0d:996d  a5 99		 lda $99
$0d:996f  21 17		 and ($17,x)
$0d:9971  03 01		 ora $01,s
$0d:9973  a7 99		 lda [$99]
$0d:9975  21 17		 and ($17,x)
$0d:9977  04 01		 tsb $01
$0d:9979  a9 99 21	  lda #$2199
$0d:997c  17 04		 ora [$04],y
$0d:997e  01 ab		 ora ($ab,x)
$0d:9980  99 21 17	  sta $1721,y
$0d:9983  03 01		 ora $01,s
$0d:9985  ad 99 21	  lda $2199
$0d:9988  17 02		 ora [$02],y
$0d:998a  01 af		 ora ($af,x)
$0d:998c  99 21 17	  sta $1721,y
$0d:998f  02 01		 cop #$01
$0d:9991  b1 99		 lda ($99),y
$0d:9993  21 17		 and ($17,x)
$0d:9995  03 01		 ora $01,s
$0d:9997  b3 99		 lda ($99,s),y
$0d:9999  21 17		 and ($17,x)
$0d:999b  04 00		 tsb $00
$0d:999d  a0 24 a0	  ldy #$a024
$0d:99a0  24 a0		 bit $a0
$0d:99a2  24 c0		 bit $c0
$0d:99a4  28			plp
$0d:99a5  e0 34 20	  cpx #$2034
$0d:99a8  3d 64 41	  and $4164,x
$0d:99ab  20 3d e0	  jsr $e03d
$0d:99ae  34 c0		 bit $c0,x
$0d:99b0  28			plp
$0d:99b1  a0 24 a0	  ldy #$a024
$0d:99b4  24 a0		 bit $a0
$0d:99b6  24 a0		 bit $a0
$0d:99b8  24 a0		 bit $a0
$0d:99ba  24 c0		 bit $c0
$0d:99bc  28			plp
$0d:99bd  e0 34 20	  cpx #$2034
$0d:99c0  3d 64 41	  and $4164,x
$0d:99c3  20 3d e0	  jsr $e03d
$0d:99c6  34 c0		 bit $c0,x
$0d:99c8  28			plp
$0d:99c9  a0 24 01	  ldy #$0124
$0d:99cc  fc 99 21	  jsr ($2199,x)
$0d:99cf  1d 01 01	  ora $0101,x
$0d:99d2  1a			inc a
$0d:99d3  9a			txs
$0d:99d4  21 1d		 and ($1d,x)
$0d:99d6  03 01		 ora $01,s
$0d:99d8  38			sec
$0d:99d9  9a			txs
$0d:99da  21 1d		 and ($1d,x)
$0d:99dc  04 01		 tsb $01
$0d:99de  56 9a		 lsr $9a,x
$0d:99e0  21 1d		 and ($1d,x)
$0d:99e2  03 01		 ora $01,s
$0d:99e4  74 9a		 stz $9a,x
$0d:99e6  21 1d		 and ($1d,x)
$0d:99e8  02 01		 cop #$01
$0d:99ea  92 9a		 sta ($9a)
$0d:99ec  21 1d		 and ($1d,x)
$0d:99ee  02 01		 cop #$01
$0d:99f0  b0 9a		 bcs $998c
$0d:99f2  21 1d		 and ($1d,x)
$0d:99f4  02 01		 cop #$01
$0d:99f6  ce 9a 21	  dec $219a
$0d:99f9  1d fe 00	  ora $00fe,x
$0d:99fc  e3 30		 sbc $30,s
$0d:99fe  20 3d 86	  jsr $863d
$0d:9a01  49 4a 5a	  eor #$5a4a
$0d:9a04  ec 41 aa	  cpx $aa41
$0d:9a07  39 98 73	  and $7398,y
$0d:9a0a  61 14		 adc ($14,x)
$0d:9a0c  a2 20 e3	  ldx #$e320
$0d:9a0f  30 65		 bmi $9a76
$0d:9a11  41 09		 eor ($09,x)
$0d:9a13  52 8c		 eor ($8c)
$0d:9a15  5a			phy
$0d:9a16  0e 6b 50	  asl $506b
$0d:9a19  73 c0		 adc ($c0,s),y
$0d:9a1b  51 26		 eor ($26),y
$0d:9a1d  5e 8a 6a	  lsr $6a8a,x
$0d:9a20  c0 51 0d	  cpy #$0d51
$0d:9a23  4a			lsr a
$0d:9a24  90 5a		 bcc $9a80
$0d:9a26  98			tya
$0d:9a27  73 a2		 adc ($a2,s),y
$0d:9a29  20 e3 30	  jsr $30e3
$0d:9a2c  65 41		 adc $41
$0d:9a2e  09 52 8c	  ora #$8c52
$0d:9a31  5a			phy
$0d:9a32  0e 6b 50	  asl $506b
$0d:9a35  73 98		 adc ($98,s),y
$0d:9a37  7b			tdc
$0d:9a38  c6 6a		 dec $6a
$0d:9a3a  4a			lsr a
$0d:9a3b  77 60		 adc [$60],y
$0d:9a3d  62 06 6b	  per $0546
$0d:9a40  9a			txs
$0d:9a41  7b			tdc
$0d:9a42  54 73 98	  mvn $98,$73
$0d:9a45  73 e3		 adc ($e3,s),y
$0d:9a47  30 65		 bmi $9aae
$0d:9a49  41 09		 eor ($09,x)
$0d:9a4b  52 8c		 eor ($8c)
$0d:9a4d  5a			phy
$0d:9a4e  0e 6b 50	  asl $506b
$0d:9a51  73 98		 adc ($98,s),y
$0d:9a53  7b			tdc
$0d:9a54  de 7b 4a	  dec $4a7b,x
$0d:9a57  5a			phy
$0d:9a58  c0 4d 86	  cpy #$864d
$0d:9a5b  49 4a 5a	  eor #$5a4a
$0d:9a5e  d1 62		 cmp ($62),y
$0d:9a60  12 6b		 ora ($6b)
$0d:9a62  98			tya
$0d:9a63  73 c2		 adc ($c2,s),y
$0d:9a65  28			plp
$0d:9a66  24 39		 bit $39
$0d:9a68  c8			iny
$0d:9a69  49 4a 52	  eor #$524a
$0d:9a6c  cc 62 0e	  cpy $0e62
$0d:9a6f  6b			rtl
$0d:9a70  55 73		 eor $73,x
$0d:9a72  9a			txs
$0d:9a73  77 20		 adc [$20],y
$0d:9a75  3d 06 31	  and $3106,x
$0d:9a78  ca			dex
$0d:9a79  49 46 39	  eor #$3946
$0d:9a7c  8e 5a 4e	  stx $4e5a
$0d:9a7f  52 98		 eor ($98)
$0d:9a81  73 a2		 adc ($a2,s),y
$0d:9a83  24 03		 bit $03
$0d:9a85  31 86		 and ($86),y
$0d:9a87  41 e9		 eor ($e9,x)
$0d:9a89  49 6b 5a	  eor #$5a6b
$0d:9a8c  cd 62 34	  cmp $3462
$0d:9a8f  6f 77 73 06   adc $067377
$0d:9a93  31 8a		 and ($8a),y
$0d:9a95  41 26		 eor ($26,x)
$0d:9a97  39 c0 2c	  and $2cc0,y
$0d:9a9a  69 35 ec	  adc #$ec35
$0d:9a9d  41 98		 eor ($98,x)
$0d:9a9f  73 61		 adc ($61,s),y
$0d:9aa1  1c c2 28	  trb $28c2
$0d:9aa4  45 35		 eor $35
$0d:9aa6  86 41		 stx $41
$0d:9aa8  08			php
$0d:9aa9  52 8b		 eor ($8b)
$0d:9aab  5e 12 6b	  lsr $6b12,x
$0d:9aae  54 6f c5	  mvn $c5,$6f
$0d:9ab1  30 c3		 bmi $9a76
$0d:9ab3  28			plp
$0d:9ab4  80 20		 bra $9ad6
$0d:9ab6  62 18 a4	  per $3ed1
$0d:9ab9  14 06		 trb $06
$0d:9abb  25 98		 and $98
$0d:9abd  73 40		 adc ($40,s),y
$0d:9abf  14 a2		 trb $a2
$0d:9ac1  1c e3 28	  trb $28e3
$0d:9ac4  24 39		 bit $39
$0d:9ac6  a6 49		 ldx $49
$0d:9ac8  4a			lsr a
$0d:9ac9  5a			phy
$0d:9aca  cf 62 31 6b   cmp $6b3162
$0d:9ace  00 00		 brk #$00
$0d:9ad0  00 00		 brk #$00
$0d:9ad2  00 00		 brk #$00
$0d:9ad4  00 00		 brk #$00
$0d:9ad6  00 00		 brk #$00
$0d:9ad8  00 00		 brk #$00
$0d:9ada  98			tya
$0d:9adb  73 20		 adc ($20,s),y
$0d:9add  0c 61 14	  tsb $1461
$0d:9ae0  a2 20 e3	  ldx #$e320
$0d:9ae3  30 65		 bmi $9b4a
$0d:9ae5  41 09		 eor ($09,x)
$0d:9ae7  52 8c		 eor ($8c)
$0d:9ae9  5a			phy
$0d:9aea  0e 6b 01	  asl $016b
$0d:9aed  17 9b		 ora [$9b],y
$0d:9aef  71 1d		 adc ($1d),y
$0d:9af1  04 01		 tsb $01
$0d:9af3  35 9b		 and $9b,x
$0d:9af5  71 1d		 adc ($1d),y
$0d:9af7  04 01		 tsb $01
$0d:9af9  53 9b		 eor ($9b,s),y
$0d:9afb  71 1d		 adc ($1d),y
$0d:9afd  04 01		 tsb $01
$0d:9aff  71 9b		 adc ($9b),y
$0d:9b01  71 1d		 adc ($1d),y
$0d:9b03  04 01		 tsb $01
$0d:9b05  8f 9b 71 1d   sta $1d719b
$0d:9b09  04 01		 tsb $01
$0d:9b0b  ad 9b 71	  lda $719b
$0d:9b0e  1d 04 01	  ora $0104,x
$0d:9b11  cb			wai
$0d:9b12  9b			txy
$0d:9b13  71 1d		 adc ($1d),y
$0d:9b15  04 00		 tsb $00
$0d:9b17  67 31		 adc [$31]
$0d:9b19  6f 52 90 5a   adc $5a9052
$0d:9b1d  d1 62		 cmp ($62),y
$0d:9b1f  d2 5e		 cmp ($5e)
$0d:9b21  b0 62		 bcs $9b85
$0d:9b23  6e 5e 4c	  ror $4c5e
$0d:9b26  56 86		 lsr $86,x
$0d:9b28  35 a8		 and $a8,x
$0d:9b2a  39 ca 3d	  and $3dca,y
$0d:9b2d  0c 46 eb	  tsb $eb46
$0d:9b30  41 c9		 eor ($c9,x)
$0d:9b32  3d a8 39	  and $39a8,x
$0d:9b35  48			pha
$0d:9b36  35 4c		 and $4c,x
$0d:9b38  56 6f		 lsr $6f,x
$0d:9b3a  52 90		 eor ($90)
$0d:9b3c  5a			phy
$0d:9b3d  d1 62		 cmp ($62),y
$0d:9b3f  d2 5e		 cmp ($5e)
$0d:9b41  b0 62		 bcs $9ba5
$0d:9b43  6e 5e a8	  ror $a85e
$0d:9b46  39 86 35	  and $3586,y
$0d:9b49  a8			tay
$0d:9b4a  39 ca 3d	  and $3dca,y
$0d:9b4d  0c 46 eb	  tsb $eb46
$0d:9b50  41 c9		 eor ($c9,x)
$0d:9b52  3d 8a 3d	  and $3d8a,x
$0d:9b55  6e 5e 4c	  ror $4c5e
$0d:9b58  56 6f		 lsr $6f,x
$0d:9b5a  52 90		 eor ($90)
$0d:9b5c  5a			phy
$0d:9b5d  d1 62		 cmp ($62),y
$0d:9b5f  d2 5e		 cmp ($5e)
$0d:9b61  b0 62		 bcs $9bc5
$0d:9b63  c9 3d a8	  cmp #$a83d
$0d:9b66  39 86 35	  and $3586,y
$0d:9b69  a8			tay
$0d:9b6a  39 ca 3d	  and $3dca,y
$0d:9b6d  0c 46 eb	  tsb $eb46
$0d:9b70  41 48		 eor ($48,x)
$0d:9b72  35 b0		 and $b0,x
$0d:9b74  62 6e 5e	  per $f9e5
$0d:9b77  4c 56 6f	  jmp $6f56
$0d:9b7a  52 90		 eor ($90)
$0d:9b7c  5a			phy
$0d:9b7d  d1 62		 cmp ($62),y
$0d:9b7f  d2 5e		 cmp ($5e)
$0d:9b81  eb			xba
$0d:9b82  41 c9		 eor ($c9,x)
$0d:9b84  3d a8 39	  and $39a8,x
$0d:9b87  86 35		 stx $35
$0d:9b89  a8			tay
$0d:9b8a  39 ca 3d	  and $3dca,y
$0d:9b8d  0c 46 67	  tsb $6746
$0d:9b90  31 d2		 and ($d2),y
$0d:9b92  5e b0 62	  lsr $62b0,x
$0d:9b95  6e 5e 4c	  ror $4c5e
$0d:9b98  56 6f		 lsr $6f,x
$0d:9b9a  52 90		 eor ($90)
$0d:9b9c  5a			phy
$0d:9b9d  d1 62		 cmp ($62),y
$0d:9b9f  0c 46 eb	  tsb $eb46
$0d:9ba2  41 c9		 eor ($c9,x)
$0d:9ba4  3d a8 39	  and $39a8,x
$0d:9ba7  86 35		 stx $35
$0d:9ba9  a8			tay
$0d:9baa  39 ca 3d	  and $3dca,y
$0d:9bad  48			pha
$0d:9bae  35 d1		 and $d1,x
$0d:9bb0  62 d2 5e	  per $fa85
$0d:9bb3  b0 62		 bcs $9c17
$0d:9bb5  6e 5e 4c	  ror $4c5e
$0d:9bb8  56 6f		 lsr $6f,x
$0d:9bba  52 90		 eor ($90)
$0d:9bbc  5a			phy
$0d:9bbd  ca			dex
$0d:9bbe  3d 0c 46	  and $460c,x
$0d:9bc1  eb			xba
$0d:9bc2  41 c9		 eor ($c9,x)
$0d:9bc4  3d a8 39	  and $39a8,x
$0d:9bc7  86 35		 stx $35
$0d:9bc9  a8			tay
$0d:9bca  39 08 31	  and $3108,y
$0d:9bcd  90 5a		 bcc $9c29
$0d:9bcf  d1 62		 cmp ($62),y
$0d:9bd1  d2 5e		 cmp ($5e)
$0d:9bd3  b0 62		 bcs $9c37
$0d:9bd5  6e 5e 4c	  ror $4c5e
$0d:9bd8  56 6f		 lsr $6f,x
$0d:9bda  52 a8		 eor ($a8)
$0d:9bdc  39 ca 3d	  and $3dca,y
$0d:9bdf  0c 46 eb	  tsb $eb46
$0d:9be2  41 c9		 eor ($c9,x)
$0d:9be4  3d a8 39	  and $39a8,x
$0d:9be7  86 35		 stx $35
$0d:9be9  01 14		 ora ($14,x)
$0d:9beb  9c 31 1d	  stz $1d31
$0d:9bee  04 01		 tsb $01
$0d:9bf0  32 9c		 and ($9c)
$0d:9bf2  31 1d		 and ($1d),y
$0d:9bf4  04 01		 tsb $01
$0d:9bf6  50 9c		 bvc $9b94
$0d:9bf8  31 1d		 and ($1d),y
$0d:9bfa  04 01		 tsb $01
$0d:9bfc  6e 9c 31	  ror $319c
$0d:9bff  1d 04 01	  ora $0104,x
$0d:9c02  8c 9c 31	  sty $319c
$0d:9c05  1d 04 01	  ora $0104,x
$0d:9c08  aa			tax
$0d:9c09  9c 31 1d	  stz $1d31
$0d:9c0c  04 01		 tsb $01
$0d:9c0e  c8			iny
$0d:9c0f  9c 31 1d	  stz $1d31
$0d:9c12  04 00		 tsb $00
$0d:9c14  67 31		 adc [$31]
$0d:9c16  0f 52 30 5a   ora $5a3052
$0d:9c1a  51 62		 eor ($62),y
$0d:9c1c  72 5e		 adc ($5e)
$0d:9c1e  50 5a		 bvc $9c7a
$0d:9c20  0e 56 ec	  asl $ec56
$0d:9c23  51 86		 eor ($86),y
$0d:9c25  35 a8		 and $a8,x
$0d:9c27  39 ca 3d	  and $3dca,y
$0d:9c2a  0c 46 eb	  tsb $eb46
$0d:9c2d  41 c9		 eor ($c9,x)
$0d:9c2f  3d a8 39	  and $39a8,x
$0d:9c32  48			pha
$0d:9c33  35 ec		 and $ec,x
$0d:9c35  51 0f		 eor ($0f),y
$0d:9c37  52 30		 eor ($30)
$0d:9c39  5a			phy
$0d:9c3a  51 62		 eor ($62),y
$0d:9c3c  72 5e		 adc ($5e)
$0d:9c3e  50 5a		 bvc $9c9a
$0d:9c40  0e 56 a8	  asl $a856
$0d:9c43  39 86 35	  and $3586,y
$0d:9c46  a8			tay
$0d:9c47  39 ca 3d	  and $3dca,y
$0d:9c4a  0c 46 eb	  tsb $eb46
$0d:9c4d  41 c9		 eor ($c9,x)
$0d:9c4f  3d 8a 3d	  and $3d8a,x
$0d:9c52  0e 56 ec	  asl $ec56
$0d:9c55  51 0f		 eor ($0f),y
$0d:9c57  52 30		 eor ($30)
$0d:9c59  5a			phy
$0d:9c5a  51 62		 eor ($62),y
$0d:9c5c  72 5e		 adc ($5e)
$0d:9c5e  50 5a		 bvc $9cba
$0d:9c60  c9 3d a8	  cmp #$a83d
$0d:9c63  39 86 35	  and $3586,y
$0d:9c66  a8			tay
$0d:9c67  39 ca 3d	  and $3dca,y
$0d:9c6a  0c 46 eb	  tsb $eb46
$0d:9c6d  41 48		 eor ($48,x)
$0d:9c6f  35 50		 and $50,x
$0d:9c71  5a			phy
$0d:9c72  0e 56 ec	  asl $ec56
$0d:9c75  51 0f		 eor ($0f),y
$0d:9c77  52 30		 eor ($30)
$0d:9c79  5a			phy
$0d:9c7a  51 62		 eor ($62),y
$0d:9c7c  72 5e		 adc ($5e)
$0d:9c7e  eb			xba
$0d:9c7f  41 c9		 eor ($c9,x)
$0d:9c81  3d a8 39	  and $39a8,x
$0d:9c84  86 35		 stx $35
$0d:9c86  a8			tay
$0d:9c87  39 ca 3d	  and $3dca,y
$0d:9c8a  0c 46 67	  tsb $6746
$0d:9c8d  31 72		 and ($72),y
$0d:9c8f  5e 50 5a	  lsr $5a50,x
$0d:9c92  0e 56 ec	  asl $ec56
$0d:9c95  51 0f		 eor ($0f),y
$0d:9c97  52 30		 eor ($30)
$0d:9c99  5a			phy
$0d:9c9a  51 62		 eor ($62),y
$0d:9c9c  0c 46 eb	  tsb $eb46
$0d:9c9f  41 c9		 eor ($c9,x)
$0d:9ca1  3d a8 39	  and $39a8,x
$0d:9ca4  86 35		 stx $35
$0d:9ca6  a8			tay
$0d:9ca7  39 ca 3d	  and $3dca,y
$0d:9caa  48			pha
$0d:9cab  35 51		 and $51,x
$0d:9cad  62 72 5e	  per $fb22
$0d:9cb0  50 5a		 bvc $9d0c
$0d:9cb2  0e 56 ec	  asl $ec56
$0d:9cb5  51 0f		 eor ($0f),y
$0d:9cb7  52 30		 eor ($30)
$0d:9cb9  5a			phy
$0d:9cba  ca			dex
$0d:9cbb  3d 0c 46	  and $460c,x
$0d:9cbe  eb			xba
$0d:9cbf  41 c9		 eor ($c9,x)
$0d:9cc1  3d a8 39	  and $39a8,x
$0d:9cc4  86 35		 stx $35
$0d:9cc6  a8			tay
$0d:9cc7  39 08 31	  and $3108,y
$0d:9cca  30 5a		 bmi $9d26
$0d:9ccc  51 62		 eor ($62),y
$0d:9cce  72 5e		 adc ($5e)
$0d:9cd0  50 5a		 bvc $9d2c
$0d:9cd2  0e 56 ec	  asl $ec56
$0d:9cd5  51 0f		 eor ($0f),y
$0d:9cd7  52 a8		 eor ($a8)
$0d:9cd9  39 ca 3d	  and $3dca,y
$0d:9cdc  0c 46 eb	  tsb $eb46
$0d:9cdf  41 c9		 eor ($c9,x)
$0d:9ce1  3d a8 39	  and $39a8,x
$0d:9ce4  86 35		 stx $35
$0d:9ce6  01 11		 ora ($11,x)
$0d:9ce8  9d 21 1d	  sta $1d21,x
$0d:9ceb  04 01		 tsb $01
$0d:9ced  2f 9d 21 1d   and $1d219d
$0d:9cf1  04 01		 tsb $01
$0d:9cf3  4d 9d 21	  eor $219d
$0d:9cf6  1d 04 01	  ora $0104,x
$0d:9cf9  6b			rtl
$0d:9cfa  9d 21 1d	  sta $1d21,x
$0d:9cfd  04 01		 tsb $01
$0d:9cff  89 9d 21	  bit #$219d
$0d:9d02  1d 04 01	  ora $0104,x
$0d:9d05  a7 9d		 lda [$9d]
$0d:9d07  21 1d		 and ($1d,x)
$0d:9d09  04 01		 tsb $01
$0d:9d0b  c5 9d		 cmp $9d
$0d:9d0d  21 1d		 and ($1d,x)
$0d:9d0f  04 00		 tsb $00
$0d:9d11  67 31		 adc [$31]
$0d:9d13  af 45 d0 4d   lda $4dd045
$0d:9d17  f1 55		 sbc ($55),y
$0d:9d19  12 52		 ora ($52)
$0d:9d1b  f0 4d		 beq $9d6a
$0d:9d1d  ae 49 8c	  ldx $8c49
$0d:9d20  45 86		 eor $86
$0d:9d22  35 a8		 and $a8,x
$0d:9d24  39 ca 3d	  and $3dca,y
$0d:9d27  0c 46 eb	  tsb $eb46
$0d:9d2a  41 c9		 eor ($c9,x)
$0d:9d2c  3d a8 39	  and $39a8,x
$0d:9d2f  48			pha
$0d:9d30  35 8c		 and $8c,x
$0d:9d32  45 af		 eor $af
$0d:9d34  45 d0		 eor $d0
$0d:9d36  4d f1 55	  eor $55f1
$0d:9d39  12 52		 ora ($52)
$0d:9d3b  f0 4d		 beq $9d8a
$0d:9d3d  ae 49 a8	  ldx $a849
$0d:9d40  39 86 35	  and $3586,y
$0d:9d43  a8			tay
$0d:9d44  39 ca 3d	  and $3dca,y
$0d:9d47  0c 46 eb	  tsb $eb46
$0d:9d4a  41 c9		 eor ($c9,x)
$0d:9d4c  3d 8a 3d	  and $3d8a,x
$0d:9d4f  ae 49 8c	  ldx $8c49
$0d:9d52  45 af		 eor $af
$0d:9d54  45 d0		 eor $d0
$0d:9d56  4d f1 55	  eor $55f1
$0d:9d59  12 52		 ora ($52)
$0d:9d5b  f0 4d		 beq $9daa
$0d:9d5d  c9 3d a8	  cmp #$a83d
$0d:9d60  39 86 35	  and $3586,y
$0d:9d63  a8			tay
$0d:9d64  39 ca 3d	  and $3dca,y
$0d:9d67  0c 46 eb	  tsb $eb46
$0d:9d6a  41 48		 eor ($48,x)
$0d:9d6c  35 f0		 and $f0,x
$0d:9d6e  4d ae 49	  eor $49ae
$0d:9d71  8c 45 af	  sty $af45
$0d:9d74  45 d0		 eor $d0
$0d:9d76  4d f1 55	  eor $55f1
$0d:9d79  12 52		 ora ($52)
$0d:9d7b  eb			xba
$0d:9d7c  41 c9		 eor ($c9,x)
$0d:9d7e  3d a8 39	  and $39a8,x
$0d:9d81  86 35		 stx $35
$0d:9d83  a8			tay
$0d:9d84  39 ca 3d	  and $3dca,y
$0d:9d87  0c 46 67	  tsb $6746
$0d:9d8a  31 12		 and ($12),y
$0d:9d8c  52 f0		 eor ($f0)
$0d:9d8e  4d ae 49	  eor $49ae
$0d:9d91  8c 45 af	  sty $af45
$0d:9d94  45 d0		 eor $d0
$0d:9d96  4d f1 55	  eor $55f1
$0d:9d99  0c 46 eb	  tsb $eb46
$0d:9d9c  41 c9		 eor ($c9,x)
$0d:9d9e  3d a8 39	  and $39a8,x
$0d:9da1  86 35		 stx $35
$0d:9da3  a8			tay
$0d:9da4  39 ca 3d	  and $3dca,y
$0d:9da7  48			pha
$0d:9da8  35 f1		 and $f1,x
$0d:9daa  55 12		 eor $12,x
$0d:9dac  52 f0		 eor ($f0)
$0d:9dae  4d ae 49	  eor $49ae
$0d:9db1  8c 45 af	  sty $af45
$0d:9db4  45 d0		 eor $d0
$0d:9db6  4d ca 3d	  eor $3dca
$0d:9db9  0c 46 eb	  tsb $eb46
$0d:9dbc  41 c9		 eor ($c9,x)
$0d:9dbe  3d a8 39	  and $39a8,x
$0d:9dc1  86 35		 stx $35
$0d:9dc3  a8			tay
$0d:9dc4  39 08 31	  and $3108,y
$0d:9dc7  d0 4d		 bne $9e16
$0d:9dc9  f1 55		 sbc ($55),y
$0d:9dcb  12 52		 ora ($52)
$0d:9dcd  f0 4d		 beq $9e1c
$0d:9dcf  ae 49 8c	  ldx $8c49
$0d:9dd2  45 af		 eor $af
$0d:9dd4  45 a8		 eor $a8
$0d:9dd6  39 ca 3d	  and $3dca,y
$0d:9dd9  0c 46 eb	  tsb $eb46
$0d:9ddc  41 c9		 eor ($c9,x)
$0d:9dde  3d a8 39	  and $39a8,x
$0d:9de1  86 35		 stx $35
$0d:9de3  01 08		 ora ($08,x)
$0d:9de5  9e 31 1d	  stz $1d31,x
$0d:9de8  04 01		 tsb $01
$0d:9dea  26 9e		 rol $9e
$0d:9dec  31 1d		 and ($1d),y
$0d:9dee  04 01		 tsb $01
$0d:9df0  44 9e 31	  mvp $31,$9e
$0d:9df3  1d 04 01	  ora $0104,x
$0d:9df6  62 9e 31	  per $cf97
$0d:9df9  1d 04 01	  ora $0104,x
$0d:9dfc  80 9e		 bra $9d9c
$0d:9dfe  31 1d		 and ($1d),y
$0d:9e00  04 01		 tsb $01
$0d:9e02  9e 9e 31	  stz $319e,x
$0d:9e05  1d 04 00	  ora $0004,x
$0d:9e08  a3 49		 lda $49,s
$0d:9e0a  07 52		 ora [$52]
$0d:9e0c  8b			phb
$0d:9e0d  5e 0e 63	  lsr $630e,x
$0d:9e10  85 5e		 sta $5e
$0d:9e12  03 52		 ora $52,s
$0d:9e14  00 00		 brk #$00
$0d:9e16  20 08 41	  jsr $4108
$0d:9e19  0c 62 14	  tsb $1462
$0d:9e1c  c3 1c		 cmp $1c,s
$0d:9e1e  25 25		 and $25
$0d:9e20  a8			tay
$0d:9e21  29 0a 36	  and #$360a
$0d:9e24  8d 3e 03	  sta $033e
$0d:9e27  52 a3		 eor ($a3)
$0d:9e29  49 07 52	  eor #$5207
$0d:9e2c  8b			phb
$0d:9e2d  5e 0e 63	  lsr $630e,x
$0d:9e30  85 5e		 sta $5e
$0d:9e32  00 00		 brk #$00
$0d:9e34  20 08 41	  jsr $4108
$0d:9e37  0c 62 14	  tsb $1462
$0d:9e3a  c3 1c		 cmp $1c,s
$0d:9e3c  25 25		 and $25
$0d:9e3e  a8			tay
$0d:9e3f  29 0a 36	  and #$360a
$0d:9e42  8d 3e 85	  sta $853e
$0d:9e45  5e 03 52	  lsr $5203,x
$0d:9e48  a3 49		 lda $49,s
$0d:9e4a  07 52		 ora [$52]
$0d:9e4c  8b			phb
$0d:9e4d  5e 0e 63	  lsr $630e,x
$0d:9e50  00 00		 brk #$00
$0d:9e52  20 08 41	  jsr $4108
$0d:9e55  0c 62 14	  tsb $1462
$0d:9e58  c3 1c		 cmp $1c,s
$0d:9e5a  25 25		 and $25
$0d:9e5c  a8			tay
$0d:9e5d  29 0a 36	  and #$360a
$0d:9e60  8d 3e 0e	  sta $0e3e
$0d:9e63  63 85		 adc $85,s
$0d:9e65  5e 03 52	  lsr $5203,x
$0d:9e68  a3 49		 lda $49,s
$0d:9e6a  07 52		 ora [$52]
$0d:9e6c  8b			phb
$0d:9e6d  5e 00 00	  lsr $0000,x
$0d:9e70  20 08 41	  jsr $4108
$0d:9e73  0c 62 14	  tsb $1462
$0d:9e76  c3 1c		 cmp $1c,s
$0d:9e78  25 25		 and $25
$0d:9e7a  a8			tay
$0d:9e7b  29 0a 36	  and #$360a
$0d:9e7e  8d 3e 8b	  sta $8b3e
$0d:9e81  5e 0e 63	  lsr $630e,x
$0d:9e84  85 5e		 sta $5e
$0d:9e86  03 52		 ora $52,s
$0d:9e88  a3 49		 lda $49,s
$0d:9e8a  07 52		 ora [$52]
$0d:9e8c  00 00		 brk #$00
$0d:9e8e  20 08 41	  jsr $4108
$0d:9e91  0c 62 14	  tsb $1462
$0d:9e94  c3 1c		 cmp $1c,s
$0d:9e96  25 25		 and $25
$0d:9e98  a8			tay
$0d:9e99  29 0a 36	  and #$360a
$0d:9e9c  8d 3e 07	  sta $073e
$0d:9e9f  52 8b		 eor ($8b)
$0d:9ea1  5e 0e 63	  lsr $630e,x
$0d:9ea4  85 5e		 sta $5e
$0d:9ea6  03 52		 ora $52,s
$0d:9ea8  a3 49		 lda $49,s
$0d:9eaa  00 00		 brk #$00
$0d:9eac  20 08 41	  jsr $4108
$0d:9eaf  0c 62 14	  tsb $1462
$0d:9eb2  c3 1c		 cmp $1c,s
$0d:9eb4  25 25		 and $25
$0d:9eb6  a8			tay
$0d:9eb7  29 0a 36	  and #$360a
$0d:9eba  8d 3e 01	  sta $013e
$0d:9ebd  ed 9e 79	  sbc $799e
$0d:9ec0  0b			phd
$0d:9ec1  07 01		 ora [$01]
$0d:9ec3  f9 9e 79	  sbc $799e,y
$0d:9ec6  0b			phd
$0d:9ec7  09 01 05	  ora #$0501
$0d:9eca  9f 79 0b 08   sta $080b79,x
$0d:9ece  01 11		 ora ($11,x)
$0d:9ed0  9f 79 0b 06   sta $060b79,x
$0d:9ed4  01 1d		 ora ($1d,x)
$0d:9ed6  9f 79 0b 06   sta $060b79,x
$0d:9eda  01 29		 ora ($29,x)
$0d:9edc  9f 79 0b 08   sta $080b79,x
$0d:9ee0  01 35		 ora ($35,x)
$0d:9ee2  9f 79 0b 09   sta $090b79,x
$0d:9ee6  01 41		 ora ($41,x)
$0d:9ee8  9f 79 0b 07   sta $070b79,x
$0d:9eec  00 40		 brk #$40
$0d:9eee  48			pha
$0d:9eef  40			rti
$0d:9ef0  48			pha
$0d:9ef1  20 75 40	  jsr $4075
$0d:9ef4  3c c0 64	  bit $64c0,x
$0d:9ef7  40			rti
$0d:9ef8  48			pha
$0d:9ef9  40			rti
$0d:9efa  3c 80 54	  bit $5480,x
$0d:9efd  e0 70 40	  cpx #$4070
$0d:9f00  3c 20 75	  bit $7520,x
$0d:9f03  80 54		 bra $9f59
$0d:9f05  40			rti
$0d:9f06  48			pha
$0d:9f07  e0 70 80	  cpx #$8070
$0d:9f0a  54 40 3c	  mvn $3c,$40
$0d:9f0d  40			rti
$0d:9f0e  48			pha
$0d:9f0f  c0 64 80	  cpy #$8064
$0d:9f12  54 20 75	  mvn $75,$20
$0d:9f15  40			rti
$0d:9f16  3c 40 3c	  bit $3c40,x
$0d:9f19  80 54		 bra $9f6f
$0d:9f1b  20 75 e0	  jsr $e075
$0d:9f1e  70 e0		 bvs $9f00
$0d:9f20  70 20		 bvs $9f42
$0d:9f22  75 40		 adc $40,x
$0d:9f24  3c c0 64	  bit $64c0,x
$0d:9f27  40			rti
$0d:9f28  3c 20 75	  bit $7520,x
$0d:9f2b  80 54		 bra $9f81
$0d:9f2d  e0 70 40	  cpx #$4070
$0d:9f30  3c 20 75	  bit $7520,x
$0d:9f33  80 54		 bra $9f89
$0d:9f35  e0 70 40	  cpx #$4070
$0d:9f38  3c 20 75	  bit $7520,x
$0d:9f3b  40			rti
$0d:9f3c  3c 40 48	  bit $4840,x
$0d:9f3f  c0 64 80	  cpy #$8064
$0d:9f42  54 e0 70	  mvn $70,$e0
$0d:9f45  40			rti
$0d:9f46  3c 40 3c	  bit $3c40,x
$0d:9f49  80 54		 bra $9f9f
$0d:9f4b  20 75 01	  jsr $0175
$0d:9f4e  72 9f		 adc ($9f)
$0d:9f50  11 07		 ora ($07),y
$0d:9f52  06 01		 asl $01
$0d:9f54  7a			ply
$0d:9f55  9f 11 07 06   sta $060711,x
$0d:9f59  01 82		 ora ($82,x)
$0d:9f5b  9f 11 07 06   sta $060711,x
$0d:9f5f  01 8a		 ora ($8a,x)
$0d:9f61  9f 11 07 06   sta $060711,x
$0d:9f65  01 92		 ora ($92,x)
$0d:9f67  9f 11 07 06   sta $060711,x
$0d:9f6b  01 9a		 ora ($9a,x)
$0d:9f6d  9f 11 07 06   sta $060711,x
$0d:9f71  00 40		 brk #$40
$0d:9f73  3c 40 3c	  bit $3c40,x
$0d:9f76  80 54		 bra $9fcc
$0d:9f78  e0 70 40	  cpx #$4070
$0d:9f7b  3c 80 54	  bit $5480,x
$0d:9f7e  e0 70 40	  cpx #$4070
$0d:9f81  3c 40 3c	  bit $3c40,x
$0d:9f84  e0 70 80	  cpx #$8070
$0d:9f87  54 40 3c	  mvn $3c,$40
$0d:9f8a  40			rti
$0d:9f8b  3c 80 54	  bit $5480,x
$0d:9f8e  40			rti
$0d:9f8f  3c e0 70	  bit $70e0,x
$0d:9f92  40			rti
$0d:9f93  3c 40 3c	  bit $3c40,x
$0d:9f96  e0 70 80	  cpx #$8070
$0d:9f99  54 40 3c	  mvn $3c,$40
$0d:9f9c  e0 70 80	  cpx #$8070
$0d:9f9f  54 40 3c	  mvn $3c,$40
$0d:9fa2  01 d3		 ora ($d3,x)
$0d:9fa4  9f 55 07 08   sta $080755,x
$0d:9fa8  01 db		 ora ($db,x)
$0d:9faa  9f 55 07 08   sta $080755,x
$0d:9fae  01 e3		 ora ($e3,x)
$0d:9fb0  9f 55 07 08   sta $080755,x
$0d:9fb4  01 eb		 ora ($eb,x)
$0d:9fb6  9f 55 07 08   sta $080755,x
$0d:9fba  01 f3		 ora ($f3,x)
$0d:9fbc  9f 55 07 08   sta $080755,x
$0d:9fc0  01 fb		 ora ($fb,x)
$0d:9fc2  9f 55 07 08   sta $080755,x
$0d:9fc6  01 03		 ora ($03,x)
$0d:9fc8  a0 55 07	  ldy #$0755
$0d:9fcb  08			php
$0d:9fcc  01 0b		 ora ($0b,x)
$0d:9fce  a0 55 07	  ldy #$0755
$0d:9fd1  08			php
$0d:9fd2  00 c0		 brk #$c0
$0d:9fd4  64 80		 stz $80
$0d:9fd6  54 40 3c	  mvn $3c,$40
$0d:9fd9  20 75 80	  jsr $8075
$0d:9fdc  54 40 3c	  mvn $3c,$40
$0d:9fdf  20 75 c0	  jsr $c075
$0d:9fe2  64 40		 stz $40
$0d:9fe4  3c 20 75	  bit $7520,x
$0d:9fe7  c0 64 80	  cpy #$8064
$0d:9fea  54 20 75	  mvn $75,$20
$0d:9fed  c0 64 80	  cpy #$8064
$0d:9ff0  54 40 3c	  mvn $3c,$40
$0d:9ff3  c0 64 80	  cpy #$8064
$0d:9ff6  54 40 3c	  mvn $3c,$40
$0d:9ff9  20 75 80	  jsr $8075
$0d:9ffc  54 40 3c	  mvn $3c,$40
$0d:9fff  20 75 c0	  jsr $c075
$0d:a002  64 40		 stz $40
$0d:a004  3c 20 75	  bit $7520,x
$0d:a007  c0 64 80	  cpy #$8064
$0d:a00a  54 20 75	  mvn $75,$20
$0d:a00d  c0 64 80	  cpy #$8064
$0d:a010  54 40 3c	  mvn $3c,$40
$0d:a013  01 92		 ora ($92,x)
$0d:a015  a0 70 11	  ldy #$1170
$0d:a018  08			php
$0d:a019  01 80		 ora ($80,x)
$0d:a01b  a0 70 11	  ldy #$1170
$0d:a01e  07 01		 ora [$01]
$0d:a020  6e a0 70	  ror $70a0
$0d:a023  11 06		 ora ($06),y
$0d:a025  01 5c		 ora ($5c,x)
$0d:a027  a0 70 11	  ldy #$1170
$0d:a02a  08			php
$0d:a02b  01 4a		 ora ($4a,x)
$0d:a02d  a0 70 11	  ldy #$1170
$0d:a030  06 01		 asl $01
$0d:a032  38			sec
$0d:a033  a0 70 11	  ldy #$1170
$0d:a036  07 00		 ora [$00]
$0d:a038  41 0c		 eor ($0c,x)
$0d:a03a  cd 60 ab	  cmp $ab60
$0d:a03d  54 09 4d	  mvn $4d,$09
$0d:a040  cc 69 09	  cpy $0969
$0d:a043  65 0a		 adc $0a
$0d:a045  5e c0 76	  lsr $76c0,x
$0d:a048  6a			ror a
$0d:a049  66 41		 ror $41
$0d:a04b  0c ab 54	  tsb $54ab
$0d:a04e  69 40 6b	  adc #$6b40
$0d:a051  55 6b		 eor $6b,x
$0d:a053  6d cc 69	  adc $69cc
$0d:a056  6a			ror a
$0d:a057  66 0a		 ror $0a
$0d:a059  5e ca 76	  lsr $76ca,x
$0d:a05c  41 0c		 eor ($0c,x)
$0d:a05e  69 40 cd	  adc #$cd40
$0d:a061  60			rts
$0d:a062  8a			txa
$0d:a063  5d 09 65	  eor $6509,x
$0d:a066  6a			ror a
$0d:a067  6d ca 76	  adc $76ca
$0d:a06a  6a			ror a
$0d:a06b  66 0a		 ror $0a
$0d:a06d  5e 41 0c	  lsr $0c41,x
$0d:a070  cd 60 ab	  cmp $ab60
$0d:a073  54 09 4d	  mvn $4d,$09
$0d:a076  cc 69 09	  cpy $0969
$0d:a079  65 0a		 adc $0a
$0d:a07b  5e ca 76	  lsr $76ca,x
$0d:a07e  6a			ror a
$0d:a07f  66 41		 ror $41
$0d:a081  0c ab 54	  tsb $54ab
$0d:a084  69 40 6b	  adc #$6b40
$0d:a087  55 6b		 eor $6b,x
$0d:a089  6d cc 69	  adc $69cc
$0d:a08c  6a			ror a
$0d:a08d  66 0a		 ror $0a
$0d:a08f  5e ca 76	  lsr $76ca,x
$0d:a092  41 0c		 eor ($0c,x)
$0d:a094  69 40 cd	  adc #$cd40
$0d:a097  60			rts
$0d:a098  8a			txa
$0d:a099  5d 09 65	  eor $6509,x
$0d:a09c  6b			rtl
$0d:a09d  6d ca 76	  adc $76ca
$0d:a0a0  6a			ror a
$0d:a0a1  66 0a		 ror $0a
$0d:a0a3  5e 01 d5	  lsr $d501,x
$0d:a0a6  a0 32 09	  ldy #$0932
$0d:a0a9  06 01		 asl $01
$0d:a0ab  df a0 32 09   cmp $0932a0,x
$0d:a0af  06 01		 asl $01
$0d:a0b1  e9 a0 32	  sbc #$32a0
$0d:a0b4  09 06 01	  ora #$0106
$0d:a0b7  f3 a0		 sbc ($a0,s),y
$0d:a0b9  32 09		 and ($09)
$0d:a0bb  06 01		 asl $01
$0d:a0bd  fd a0 32	  sbc $32a0,x
$0d:a0c0  09 06 01	  ora #$0106
$0d:a0c3  07 a1		 ora [$a1]
$0d:a0c5  32 09		 and ($09)
$0d:a0c7  06 01		 asl $01
$0d:a0c9  11 a1		 ora ($a1),y
$0d:a0cb  32 09		 and ($09)
$0d:a0cd  06 01		 asl $01
$0d:a0cf  1b			tcs
$0d:a0d0  a1 32		 lda ($32,x)
$0d:a0d2  09 06 00	  ora #$0006
$0d:a0d5  ae 2c ee	  ldx $ee2c
$0d:a0d8  30 89		 bmi $a063
$0d:a0da  24 8b		 bit $8b
$0d:a0dc  20 ae 2c	  jsr $2cae
$0d:a0df  ee 30 89	  inc $8930
$0d:a0e2  24 8b		 bit $8b
$0d:a0e4  20 ae 2c	  jsr $2cae
$0d:a0e7  ee 30 89	  inc $8930
$0d:a0ea  24 8b		 bit $8b
$0d:a0ec  20 ae 2c	  jsr $2cae
$0d:a0ef  ee 30 89	  inc $8930
$0d:a0f2  24 8b		 bit $8b
$0d:a0f4  20 ae 2c	  jsr $2cae
$0d:a0f7  ee 30 89	  inc $8930
$0d:a0fa  24 8b		 bit $8b
$0d:a0fc  20 ae 2c	  jsr $2cae
$0d:a0ff  ee 30 89	  inc $8930
$0d:a102  24 8b		 bit $8b
$0d:a104  20 ae 2c	  jsr $2cae
$0d:a107  ee 30 89	  inc $8930
$0d:a10a  24 8b		 bit $8b
$0d:a10c  20 ae 2c	  jsr $2cae
$0d:a10f  ee 30 89	  inc $8930
$0d:a112  24 8b		 bit $8b
$0d:a114  20 ae 2c	  jsr $2cae
$0d:a117  ee 30 89	  inc $8930
$0d:a11a  24 8b		 bit $8b
$0d:a11c  20 ae 2c	  jsr $2cae
$0d:a11f  ee 30 89	  inc $8930
$0d:a122  24 8b		 bit $8b
$0d:a124  20 01 56	  jsr $5601
$0d:a127  a1 72		 lda ($72,x)
$0d:a129  15 0c		 ora $0c,x
$0d:a12b  01 6c		 ora ($6c,x)
$0d:a12d  a1 72		 lda ($72,x)
$0d:a12f  15 0c		 ora $0c,x
$0d:a131  01 82		 ora ($82,x)
$0d:a133  a1 72		 lda ($72,x)
$0d:a135  15 0c		 ora $0c,x
$0d:a137  01 98		 ora ($98,x)
$0d:a139  a1 72		 lda ($72,x)
$0d:a13b  15 0c		 ora $0c,x
$0d:a13d  01 ae		 ora ($ae,x)
$0d:a13f  a1 72		 lda ($72,x)
$0d:a141  15 0c		 ora $0c,x
$0d:a143  01 c4		 ora ($c4,x)
$0d:a145  a1 72		 lda ($72,x)
$0d:a147  15 0c		 ora $0c,x
$0d:a149  01 da		 ora ($da,x)
$0d:a14b  a1 72		 lda ($72,x)
$0d:a14d  15 0c		 ora $0c,x
$0d:a14f  01 f0		 ora ($f0,x)
$0d:a151  a1 72		 lda ($72,x)
$0d:a153  15 0c		 ora $0c,x
$0d:a155  00 05		 brk #$05
$0d:a157  00 4a		 brk #$4a
$0d:a159  00 12		 brk #$12
$0d:a15b  00 17		 brk #$17
$0d:a15d  00 1c		 brk #$1c
$0d:a15f  00 4a		 brk #$4a
$0d:a161  00 0c		 brk #$0c
$0d:a163  00 6e		 brk #$6e
$0d:a165  00 12		 brk #$12
$0d:a167  00 16		 brk #$16
$0d:a169  00 45		 brk #$45
$0d:a16b  00 4a		 brk #$4a
$0d:a16d  00 12		 brk #$12
$0d:a16f  00 17		 brk #$17
$0d:a171  00 1c		 brk #$1c
$0d:a173  00 1e		 brk #$1e
$0d:a175  01 0c		 ora ($0c,x)
$0d:a177  00 6e		 brk #$6e
$0d:a179  00 12		 brk #$12
$0d:a17b  00 16		 brk #$16
$0d:a17d  00 1c		 brk #$1c
$0d:a17f  00 45		 brk #$45
$0d:a181  00 12		 brk #$12
$0d:a183  00 17		 brk #$17
$0d:a185  00 1c		 brk #$1c
$0d:a187  00 1e		 brk #$1e
$0d:a189  01 9f		 ora ($9f,x)
$0d:a18b  01 4a		 ora ($4a,x)
$0d:a18d  00 0c		 brk #$0c
$0d:a18f  00 6e		 brk #$6e
$0d:a191  00 12		 brk #$12
$0d:a193  00 16		 brk #$16
$0d:a195  00 45		 brk #$45
$0d:a197  00 17		 brk #$17
$0d:a199  00 1c		 brk #$1c
$0d:a19b  00 1e		 brk #$1e
$0d:a19d  01 9f		 ora ($9f,x)
$0d:a19f  01 9c		 ora ($9c,x)
$0d:a1a1  16 68		 asl $68,x
$0d:a1a3  08			php
$0d:a1a4  4a			lsr a
$0d:a1a5  00 0c		 brk #$0c
$0d:a1a7  00 6e		 brk #$6e
$0d:a1a9  00 12		 brk #$12
$0d:a1ab  00 45		 brk #$45
$0d:a1ad  00 1c		 brk #$1c
$0d:a1af  00 1e		 brk #$1e
$0d:a1b1  01 9f		 ora ($9f,x)
$0d:a1b3  01 9c		 ora ($9c,x)
$0d:a1b5  16 9c		 asl $9c,x
$0d:a1b7  16 64		 asl $64,x
$0d:a1b9  00 68		 brk #$68
$0d:a1bb  08			php
$0d:a1bc  4a			lsr a
$0d:a1bd  00 0c		 brk #$0c
$0d:a1bf  00 6e		 brk #$6e
$0d:a1c1  00 45		 brk #$45
$0d:a1c3  00 12		 brk #$12
$0d:a1c5  00 1c		 brk #$1c
$0d:a1c7  00 1e		 brk #$1e
$0d:a1c9  01 9f		 ora ($9f,x)
$0d:a1cb  01 9c		 ora ($9c,x)
$0d:a1cd  16 64		 asl $64,x
$0d:a1cf  00 64		 brk #$64
$0d:a1d1  00 68		 brk #$68
$0d:a1d3  08			php
$0d:a1d4  4a			lsr a
$0d:a1d5  00 0c		 brk #$0c
$0d:a1d7  00 45		 brk #$45
$0d:a1d9  00 4a		 brk #$4a
$0d:a1db  00 12		 brk #$12
$0d:a1dd  00 17		 brk #$17
$0d:a1df  00 1c		 brk #$1c
$0d:a1e1  00 9f		 brk #$9f
$0d:a1e3  01 64		 ora ($64,x)
$0d:a1e5  00 68		 brk #$68
$0d:a1e7  08			php
$0d:a1e8  4a			lsr a
$0d:a1e9  00 0c		 brk #$0c
$0d:a1eb  00 6e		 brk #$6e
$0d:a1ed  00 45		 brk #$45
$0d:a1ef  00 05		 brk #$05
$0d:a1f1  00 4a		 brk #$4a
$0d:a1f3  00 12		 brk #$12
$0d:a1f5  00 17		 brk #$17
$0d:a1f7  00 1c		 brk #$1c
$0d:a1f9  00 68		 brk #$68
$0d:a1fb  08			php
$0d:a1fc  4a			lsr a
$0d:a1fd  00 0c		 brk #$0c
$0d:a1ff  00 6e		 brk #$6e
$0d:a201  00 12		 brk #$12
$0d:a203  00 45		 brk #$45
$0d:a205  00 01		 brk #$01
$0d:a207  37 a2		 and [$a2],y
$0d:a209  57 09		 eor [$09],y
$0d:a20b  00 01		 brk #$01
$0d:a20d  41 a2		 eor ($a2,x)
$0d:a20f  57 09		 eor [$09],y
$0d:a211  01 01		 ora ($01,x)
$0d:a213  4b			phk
$0d:a214  a2 57 09	  ldx #$0957
$0d:a217  02 01		 cop #$01
$0d:a219  55 a2		 eor $a2,x
$0d:a21b  57 09		 eor [$09],y
$0d:a21d  02 01		 cop #$01
$0d:a21f  5f a2 57 09   eor $0957a2,x
$0d:a223  01 01		 ora ($01,x)
$0d:a225  69 a2 57	  adc #$57a2
$0d:a228  09 02 01	  ora #$0102
$0d:a22b  73 a2		 adc ($a2,s),y
$0d:a22d  57 09		 eor [$09],y
$0d:a22f  02 01		 cop #$01
$0d:a231  7d a2 57	  adc $57a2,x
$0d:a234  09 01 00	  ora #$0001
$0d:a237  a3 30		 lda $30,s
$0d:a239  e5 44		 sbc $44
$0d:a23b  27 4d		 and [$4d]
$0d:a23d  69 5d eb	  adc #$eb5d
$0d:a240  5d e5 44	  eor $44e5,x
$0d:a243  27 4d		 and [$4d]
$0d:a245  69 5d eb	  adc #$eb5d
$0d:a248  5d 69 5d	  eor $5d69,x
$0d:a24b  27 4d		 and [$4d]
$0d:a24d  69 5d eb	  adc #$eb5d
$0d:a250  5d 69 5d	  eor $5d69,x
$0d:a253  27 4d		 and [$4d]
$0d:a255  69 5d eb	  adc #$eb5d
$0d:a258  5d 69 5d	  eor $5d69,x
$0d:a25b  27 4d		 and [$4d]
$0d:a25d  e5 44		 sbc $44
$0d:a25f  eb			xba
$0d:a260  5d 69 5d	  eor $5d69,x
$0d:a263  27 4d		 and [$4d]
$0d:a265  e5 44		 sbc $44
$0d:a267  a3 30		 lda $30,s
$0d:a269  69 5d 27	  adc #$275d
$0d:a26c  4d e5 44	  eor $44e5
$0d:a26f  a3 30		 lda $30,s
$0d:a271  e5 44		 sbc $44
$0d:a273  27 4d		 and [$4d]
$0d:a275  e5 44		 sbc $44
$0d:a277  a3 30		 lda $30,s
$0d:a279  e5 44		 sbc $44
$0d:a27b  27 4d		 and [$4d]
$0d:a27d  e5 44		 sbc $44
$0d:a27f  a3 30		 lda $30,s
$0d:a281  e5 44		 sbc $44
$0d:a283  27 4d		 and [$4d]
$0d:a285  69 5d 01	  adc #$015d
$0d:a288  b8			clv
$0d:a289  a2 57 09	  ldx #$0957
$0d:a28c  05 01		 ora $01
$0d:a28e  c2 a2		 rep #$a2
$0d:a290  57 09		 eor [$09],y
$0d:a292  05 01		 ora $01
$0d:a294  cc a2 57	  cpy $57a2
$0d:a297  09 05 01	  ora #$0105
$0d:a29a  d6 a2		 dec $a2,x
$0d:a29c  57 09		 eor [$09],y
$0d:a29e  05 01		 ora $01
$0d:a2a0  e0 a2 57	  cpx #$57a2
$0d:a2a3  09 05 01	  ora #$0105
$0d:a2a6  ea			nop
$0d:a2a7  a2 57 09	  ldx #$0957
$0d:a2aa  05 01		 ora $01
$0d:a2ac  f4 a2 57	  pea $57a2
$0d:a2af  09 05 01	  ora #$0105
$0d:a2b2  fe a2 57	  inc $57a2,x
$0d:a2b5  09 05 00	  ora #$0005
$0d:a2b8  80 34		 bra $a2ee
$0d:a2ba  c0 44 40	  cpy #$4044
$0d:a2bd  55 a4		 eor $a4,x
$0d:a2bf  59 80 34	  eor $3480,y
$0d:a2c2  00 1c		 brk #$1c
$0d:a2c4  40			rti
$0d:a2c5  55 a4		 eor $a4,x
$0d:a2c7  59 80 34	  eor $3480,y
$0d:a2ca  c0 44 80	  cpy #$8044
$0d:a2cd  34 a4		 bit $a4,x
$0d:a2cf  59 80 34	  eor $3480,y
$0d:a2d2  c0 44 40	  cpy #$4044
$0d:a2d5  55 00		 eor $00,x
$0d:a2d7  1c 80 34	  trb $3480
$0d:a2da  c0 44 40	  cpy #$4044
$0d:a2dd  55 a4		 eor $a4,x
$0d:a2df  59 80 34	  eor $3480,y
$0d:a2e2  c0 44 40	  cpy #$4044
$0d:a2e5  55 a4		 eor $a4,x
$0d:a2e7  59 80 34	  eor $3480,y
$0d:a2ea  00 1c		 brk #$1c
$0d:a2ec  40			rti
$0d:a2ed  55 a4		 eor $a4,x
$0d:a2ef  59 80 34	  eor $3480,y
$0d:a2f2  c0 44 80	  cpy #$8044
$0d:a2f5  34 a4		 bit $a4,x
$0d:a2f7  59 80 34	  eor $3480,y
$0d:a2fa  c0 44 40	  cpy #$4044
$0d:a2fd  55 00		 eor $00,x
$0d:a2ff  1c 80 34	  trb $3480
$0d:a302  c0 44 40	  cpy #$4044
$0d:a305  55 a4		 eor $a4,x
$0d:a307  59 0c 0f	  eor $0f0c,y
$0d:a30a  a3 78		 lda $78,s
$0d:a30c  0f 06 00 04   ora $040006
$0d:a310  55 c2		 eor $c2,x
$0d:a312  50 c2		 bvc $a2d6
$0d:a314  50 c2		 bvc $a2d8
$0d:a316  50 46		 bvc $a35e
$0d:a318  59 ab 69	  eor $69ab,y
$0d:a31b  0e 72 88	  asl $8872
$0d:a31e  65 46		 adc $46
$0d:a320  59 04 55	  eor $5504,y
$0d:a323  c2 50		 rep #$50
$0d:a325  c2 50		 rep #$50
$0d:a327  04 55		 tsb $55
$0d:a329  88			dey
$0d:a32a  65 0c		 adc $0c
$0d:a32c  62 46 59	  per $fc75
$0d:a32f  04 51		 tsb $51
$0d:a331  46 51		 lsr $51
$0d:a333  04 55		 tsb $55
$0d:a335  c2 50		 rep #$50
$0d:a337  c2 50		 rep #$50
$0d:a339  46 59		 lsr $59
$0d:a33b  88			dey
$0d:a33c  65 04		 adc $04
$0d:a33e  55 04		 eor $04,x
$0d:a340  55 88		 eor $88,x
$0d:a342  65 46		 adc $46
$0d:a344  59 c2 50	  eor $50c2,y
$0d:a347  c2 50		 rep #$50
$0d:a349  04 55		 tsb $55
$0d:a34b  46 59		 lsr $59
$0d:a34d  04 55		 tsb $55
$0d:a34f  46 59		 lsr $59
$0d:a351  ab			plb
$0d:a352  69 88 65	  adc #$6588
$0d:a355  04 55		 tsb $55
$0d:a357  c2 50		 rep #$50
$0d:a359  c2 50		 rep #$50
$0d:a35b  04 55		 tsb $55
$0d:a35d  46 59		 lsr $59
$0d:a35f  88			dey
$0d:a360  65 0e		 adc $0e
$0d:a362  72 0c		 adc ($0c)
$0d:a364  62 46 59	  per $fcad
$0d:a367  c2 50		 rep #$50
$0d:a369  c2 50		 rep #$50
$0d:a36b  c2 50		 rep #$50
$0d:a36d  04 55		 tsb $55
$0d:a36f  46 59		 lsr $59
$0d:a371  ab			plb
$0d:a372  69 0e 72	  adc #$720e
$0d:a375  88			dey
$0d:a376  65 04		 adc $04
$0d:a378  55 c2		 eor $c2,x
$0d:a37a  50 c2		 bvc $a33e
$0d:a37c  50 c2		 bvc $a340
$0d:a37e  50 04		 bvc $a384
$0d:a380  55 88		 eor $88,x
$0d:a382  65 0c		 adc $0c
$0d:a384  62 46 59	  per $fccd
$0d:a387  46 59		 lsr $59
$0d:a389  04 55		 tsb $55
$0d:a38b  c2 50		 rep #$50
$0d:a38d  c2 50		 rep #$50
$0d:a38f  c2 50		 rep #$50
$0d:a391  46 59		 lsr $59
$0d:a393  88			dey
$0d:a394  65 04		 adc $04
$0d:a396  55 04		 eor $04,x
$0d:a398  51 46		 eor ($46),y
$0d:a39a  51 04		 eor ($04),y
$0d:a39c  55 c2		 eor $c2,x
$0d:a39e  50 c2		 bvc $a362
$0d:a3a0  50 04		 bvc $a3a6
$0d:a3a2  55 46		 eor $46,x
$0d:a3a4  59 04 55	  eor $5504,y
$0d:a3a7  04 55		 tsb $55
$0d:a3a9  88			dey
$0d:a3aa  65 46		 adc $46
$0d:a3ac  59 c2 50	  eor $50c2,y
$0d:a3af  c2 50		 rep #$50
$0d:a3b1  c2 50		 rep #$50
$0d:a3b3  04 55		 tsb $55
$0d:a3b5  46 59		 lsr $59
$0d:a3b7  46 59		 lsr $59
$0d:a3b9  cc 69 88	  cpy $8869
$0d:a3bc  65 04		 adc $04
$0d:a3be  55 c2		 eor $c2,x
$0d:a3c0  50 c2		 bvc $a384
$0d:a3c2  50 c2		 bvc $a386
$0d:a3c4  50 04		 bvc $a3ca
$0d:a3c6  55 88		 eor $88,x
$0d:a3c8  65 0e		 adc $0e
$0d:a3ca  72 0c		 adc ($0c)
$0d:a3cc  62 46 59	  per $fd15
$0d:a3cf  01 fd		 ora ($fd,x)
$0d:a3d1  a3 00		 lda $00,s
$0d:a3d3  02 5f		 cop #$5f
$0d:a3d5  07 1b		 ora [$1b]
$0d:a3d7  a4 00		 ldy $00
$0d:a3d9  02 01		 cop #$01
$0d:a3db  0a			asl a
$0d:a3dc  4b			phk
$0d:a3dd  a4 00		 ldy $00
$0d:a3df  02 00		 cop #$00
$0d:a3e1  06 09		 asl $09
$0d:a3e3  a4 00		 ldy $00
$0d:a3e5  02 01		 cop #$01
$0d:a3e7  09 30 a4	  ora #$a430
$0d:a3ea  00 02		 brk #$02
$0d:a3ec  01 03		 ora ($03,x)
$0d:a3ee  00 a4		 brk #$a4
$0d:a3f0  00 02		 brk #$02
$0d:a3f2  00 00		 brk #$00
$0d:a3f4  23 47		 and $47,s
$0d:a3f6  85 24		 sta $24
$0d:a3f8  48			pha
$0d:a3f9  86 25		 stx $25
$0d:a3fb  49 87 20	  eor #$2087
$0d:a3fe  40			rti
$0d:a3ff  80 23		 bra $a424
$0d:a401  47 85		 eor [$85]
$0d:a403  24 48		 bit $48
$0d:a405  86 25		 stx $25
$0d:a407  49 87 29	  eor #$2987
$0d:a40a  4d 8b 2d	  eor $2d8b
$0d:a40d  51 8f		 eor ($8f),y
$0d:a40f  23 47		 and $47,s
$0d:a411  85 27		 sta $27
$0d:a413  4b			phk
$0d:a414  89 2b 4f	  bit #$4f2b
$0d:a417  8d 20 40	  sta $4020
$0d:a41a  80 24		 bra $a440
$0d:a41c  48			pha
$0d:a41d  86 23		 stx $23
$0d:a41f  47 85		 eor [$85]
$0d:a421  24 48		 bit $48
$0d:a423  86 25		 stx $25
$0d:a425  49 87 26	  eor #$2687
$0d:a428  4a			lsr a
$0d:a429  88			dey
$0d:a42a  22 46 84 24   jsl $248446
$0d:a42e  48			pha
$0d:a42f  86 26		 stx $26
$0d:a431  4a			lsr a
$0d:a432  88			dey
$0d:a433  23 47		 and $47,s
$0d:a435  85 22		 sta $22
$0d:a437  46 84		 lsr $84
$0d:a439  23 47		 and $47,s
$0d:a43b  85 27		 sta $27
$0d:a43d  4b			phk
$0d:a43e  89 2b 4f	  bit #$4f2b
$0d:a441  8d 25 49	  sta $4925
$0d:a444  87 29		 sta [$29]
$0d:a446  4d 8b 2d	  eor $2d8b
$0d:a449  51 8f		 eor ($8f),y
$0d:a44b  25 49		 and $49
$0d:a44d  87 29		 sta [$29]
$0d:a44f  4d 8b 2d	  eor $2d8b
$0d:a452  51 8f		 eor ($8f),y
$0d:a454  23 47		 and $47,s
$0d:a456  85 27		 sta $27
$0d:a458  4b			phk
$0d:a459  89 2b 4f	  bit #$4f2b
$0d:a45c  8d 20 40	  sta $4020
$0d:a45f  80 01		 bra $a462
$0d:a461  c1 a4		 cmp ($a4,x)
$0d:a463  21 1d		 and ($1d,x)
$0d:a465  01 01		 ora ($01,x)
$0d:a467  c3 a4		 cmp $a4,s
$0d:a469  21 1d		 and ($1d,x)
$0d:a46b  01 01		 ora ($01,x)
$0d:a46d  c5 a4		 cmp $a4
$0d:a46f  21 1d		 and ($1d,x)
$0d:a471  01 01		 ora ($01,x)
$0d:a473  c7 a4		 cmp [$a4]
$0d:a475  21 1d		 and ($1d,x)
$0d:a477  01 01		 ora ($01,x)
$0d:a479  c9 a4 21	  cmp #$21a4
$0d:a47c  1d 01 01	  ora $0101,x
$0d:a47f  cb			wai
$0d:a480  a4 21		 ldy $21
$0d:a482  1d 01 01	  ora $0101,x
$0d:a485  cd a4 21	  cmp $21a4
$0d:a488  1d 01 01	  ora $0101,x
$0d:a48b  cf a4 21 1d   cmp $1d21a4
$0d:a48f  01 01		 ora ($01,x)
$0d:a491  d1 a4		 cmp ($a4),y
$0d:a493  21 1d		 and ($1d,x)
$0d:a495  01 01		 ora ($01,x)
$0d:a497  d3 a4		 cmp ($a4,s),y
$0d:a499  21 1d		 and ($1d,x)
$0d:a49b  01 01		 ora ($01,x)
$0d:a49d  d5 a4		 cmp $a4,x
$0d:a49f  21 1d		 and ($1d,x)
$0d:a4a1  01 01		 ora ($01,x)
$0d:a4a3  d7 a4		 cmp [$a4],y
$0d:a4a5  21 1d		 and ($1d,x)
$0d:a4a7  01 01		 ora ($01,x)
$0d:a4a9  d9 a4 21	  cmp $21a4,y
$0d:a4ac  1d 01 01	  ora $0101,x
$0d:a4af  db			stp
$0d:a4b0  a4 21		 ldy $21
$0d:a4b2  1d 01 01	  ora $0101,x
$0d:a4b5  dd a4 21	  cmp $21a4,x
$0d:a4b8  1d 01 01	  ora $0101,x
$0d:a4bb  df a4 21 1d   cmp $1d21a4,x
$0d:a4bf  01 00		 ora ($00,x)
$0d:a4c1  00 00		 brk #$00
$0d:a4c3  02 04		 cop #$04
$0d:a4c5  08			php
$0d:a4c6  14 11		 trb $11
$0d:a4c8  14 bb		 trb $bb
$0d:a4ca  08			php
$0d:a4cb  df 09 3f 13   cmp $133f09,x
$0d:a4cf  be 3b ff	  ldx $ff3b,y
$0d:a4d2  7f be 3b 3f   adc $3f3bbe,x
$0d:a4d6  13 df		 ora ($df,s),y
$0d:a4d8  09 bb 08	  ora #$08bb
$0d:a4db  51 10		 eor ($10),y
$0d:a4dd  08			php
$0d:a4de  14 02		 trb $02
$0d:a4e0  04 00		 tsb $00
$0d:a4e2  00 02		 brk #$02
$0d:a4e4  04 08		 tsb $08
$0d:a4e6  14 51		 trb $51
$0d:a4e8  10 bb		 bpl $a4a5
$0d:a4ea  08			php
$0d:a4eb  df 09 3f 13   cmp $133f09,x
$0d:a4ef  be 3b ff	  ldx $ff3b,y
$0d:a4f2  7f be 3b 3f   adc $3f3bbe,x
$0d:a4f6  13 df		 ora ($df,s),y
$0d:a4f8  09 bb 08	  ora #$08bb
$0d:a4fb  51 10		 eor ($10),y
$0d:a4fd  01 68		 ora ($68,x)
$0d:a4ff  a5 39		 lda $39
$0d:a501  0d 1f 01	  ora $011f
$0d:a504  5a			phy
$0d:a505  a5 39		 lda $39
$0d:a507  0d 05 01	  ora $0105
$0d:a50a  4c a5 39	  jmp $39a5
$0d:a50d  0d 03 01	  ora $0103
$0d:a510  3e a5 39	  rol $39a5,x
$0d:a513  0d 02 01	  ora $0102
$0d:a516  30 a5		 bmi $a4bd
$0d:a518  39 0d 04	  and $040d,y
$0d:a51b  01 22		 ora ($22,x)
$0d:a51d  a5 39		 lda $39
$0d:a51f  0d 05 00	  ora $0005
$0d:a522  11 66		 ora ($66),y
$0d:a524  94 6e		 sty $6e,x
$0d:a526  18			clc
$0d:a527  7b			tdc
$0d:a528  9c 7f 18	  stz $187f
$0d:a52b  7b			tdc
$0d:a52c  94 6e		 sty $6e,x
$0d:a52e  11 66		 ora ($66),y
$0d:a530  11 66		 ora ($66),y
$0d:a532  11 66		 ora ($66),y
$0d:a534  94 6e		 sty $6e,x
$0d:a536  18			clc
$0d:a537  7b			tdc
$0d:a538  9c 7f 18	  stz $187f
$0d:a53b  7b			tdc
$0d:a53c  94 6e		 sty $6e,x
$0d:a53e  94 6e		 sty $6e,x
$0d:a540  11 66		 ora ($66),y
$0d:a542  11 66		 ora ($66),y
$0d:a544  94 6e		 sty $6e,x
$0d:a546  18			clc
$0d:a547  7b			tdc
$0d:a548  9c 7f 18	  stz $187f
$0d:a54b  7b			tdc
$0d:a54c  18			clc
$0d:a54d  7b			tdc
$0d:a54e  94 6e		 sty $6e,x
$0d:a550  11 66		 ora ($66),y
$0d:a552  11 66		 ora ($66),y
$0d:a554  94 6e		 sty $6e,x
$0d:a556  18			clc
$0d:a557  7b			tdc
$0d:a558  9c 7f 9c	  stz $9c7f
$0d:a55b  7f 18 7b 94   adc $947b18,x
$0d:a55f  6e 11 66	  ror $6611
$0d:a562  11 66		 ora ($66),y
$0d:a564  94 6e		 sty $6e,x
$0d:a566  18			clc
$0d:a567  7b			tdc
$0d:a568  18			clc
$0d:a569  7b			tdc
$0d:a56a  9c 7f 18	  stz $187f
$0d:a56d  7b			tdc
$0d:a56e  94 6e		 sty $6e,x
$0d:a570  11 66		 ora ($66),y
$0d:a572  11 66		 ora ($66),y
$0d:a574  94 6e		 sty $6e,x
$0d:a576  01 a7		 ora ($a7,x)
$0d:a578  a5 76		 lda $76
$0d:a57a  09 07 01	  ora #$0107
$0d:a57d  b1 a5		 lda ($a5),y
$0d:a57f  76 09		 ror $09,x
$0d:a581  07 01		 ora [$01]
$0d:a583  bb			tyx
$0d:a584  a5 76		 lda $76
$0d:a586  09 07 01	  ora #$0107
$0d:a589  c5 a5		 cmp $a5
$0d:a58b  76 09		 ror $09,x
$0d:a58d  07 01		 ora [$01]
$0d:a58f  cf a5 76 09   cmp $0976a5
$0d:a593  07 01		 ora [$01]
$0d:a595  d9 a5 76	  cmp $76a5,y
$0d:a598  09 07 01	  ora #$0107
$0d:a59b  e3 a5		 sbc $a5,s
$0d:a59d  76 09		 ror $09,x
$0d:a59f  07 01		 ora [$01]
$0d:a5a1  ed a5 76	  sbc $76a5
$0d:a5a4  09 07 00	  ora #$0007
$0d:a5a7  f4 24 6a	  pea $6a24
$0d:a5aa  14 b0		 trb $b0
$0d:a5ac  1c 14 29	  trb $2914
$0d:a5af  b8			clv
$0d:a5b0  3d 56 31	  and $3156,x
$0d:a5b3  6a			ror a
$0d:a5b4  14 b0		 trb $b0
$0d:a5b6  1c 14 29	  trb $2914
$0d:a5b9  56 31		 lsr $31,x
$0d:a5bb  b8			clv
$0d:a5bc  3d 6a 14	  and $146a,x
$0d:a5bf  b0 1c		 bcs $a5dd
$0d:a5c1  14 29		 trb $29
$0d:a5c3  f4 28 56	  pea $5628
$0d:a5c6  31 6a		 and ($6a),y
$0d:a5c8  14 b0		 trb $b0
$0d:a5ca  1c 14 29	  trb $2914
$0d:a5cd  56 31		 lsr $31,x
$0d:a5cf  f4 24 6a	  pea $6a24
$0d:a5d2  14 b0		 trb $b0
$0d:a5d4  1c 14 29	  trb $2914
$0d:a5d7  b8			clv
$0d:a5d8  3d 56 31	  and $3156,x
$0d:a5db  6a			ror a
$0d:a5dc  14 b0		 trb $b0
$0d:a5de  1c 14 29	  trb $2914
$0d:a5e1  56 31		 lsr $31,x
$0d:a5e3  b8			clv
$0d:a5e4  3d 6a 14	  and $146a,x
$0d:a5e7  b0 1c		 bcs $a605
$0d:a5e9  14 29		 trb $29
$0d:a5eb  f4 24 56	  pea $5624
$0d:a5ee  31 6a		 and ($6a),y
$0d:a5f0  14 b0		 trb $b0
$0d:a5f2  1c 14 29	  trb $2914
$0d:a5f5  56 31		 lsr $31,x
$0d:a5f7  01 28		 ora ($28,x)
$0d:a5f9  a6 71		 ldx $71
$0d:a5fb  0f bf 01 38   ora $3801bf
$0d:a5ff  a6 71		 ldx $71
$0d:a601  0f 04 01 48   ora $480104
$0d:a605  a6 71		 ldx $71
$0d:a607  0f 04 01 58   ora $580104
$0d:a60b  a6 71		 ldx $71
$0d:a60d  0f 04 01 68   ora $680104
$0d:a611  a6 71		 ldx $71
$0d:a613  0f 04 01 78   ora $780104
$0d:a617  a6 71		 ldx $71
$0d:a619  0f 04 01 88   ora $880104
$0d:a61d  a6 71		 ldx $71
$0d:a61f  0f 04 01 98   ora $980104
$0d:a623  a6 71		 ldx $71
$0d:a625  0f 00 00 00   ora $000000
$0d:a629  00 00		 brk #$00
$0d:a62b  00 00		 brk #$00
$0d:a62d  00 00		 brk #$00
$0d:a62f  00 00		 brk #$00
$0d:a631  00 00		 brk #$00
$0d:a633  00 00		 brk #$00
$0d:a635  00 00		 brk #$00
$0d:a637  00 00		 brk #$00
$0d:a639  00 00		 brk #$00
$0d:a63b  00 00		 brk #$00
$0d:a63d  00 00		 brk #$00
$0d:a63f  00 00		 brk #$00
$0d:a641  00 00		 brk #$00
$0d:a643  00 00		 brk #$00
$0d:a645  00 23		 brk #$23
$0d:a647  08			php
$0d:a648  00 00		 brk #$00
$0d:a64a  00 00		 brk #$00
$0d:a64c  00 00		 brk #$00
$0d:a64e  00 00		 brk #$00
$0d:a650  00 00		 brk #$00
$0d:a652  00 00		 brk #$00
$0d:a654  23 08		 and $08,s
$0d:a656  66 10		 ror $10
$0d:a658  00 00		 brk #$00
$0d:a65a  00 00		 brk #$00
$0d:a65c  00 00		 brk #$00
$0d:a65e  00 00		 brk #$00
$0d:a660  00 00		 brk #$00
$0d:a662  23 08		 and $08,s
$0d:a664  66 10		 ror $10
$0d:a666  c9 1c 00	  cmp #$001c
$0d:a669  00 00		 brk #$00
$0d:a66b  00 00		 brk #$00
$0d:a66d  00 00		 brk #$00
$0d:a66f  00 23		 brk #$23
$0d:a671  08			php
$0d:a672  66 10		 ror $10
$0d:a674  c9 1c 0c	  cmp #$0c1c
$0d:a677  25 00		 and $00
$0d:a679  00 00		 brk #$00
$0d:a67b  00 00		 brk #$00
$0d:a67d  00 23		 brk #$23
$0d:a67f  08			php
$0d:a680  66 10		 ror $10
$0d:a682  c9 1c 0c	  cmp #$0c1c
$0d:a685  25 6f		 and $6f
$0d:a687  31 00		 and ($00),y
$0d:a689  00 00		 brk #$00
$0d:a68b  00 23		 brk #$23
$0d:a68d  08			php
$0d:a68e  66 10		 ror $10
$0d:a690  c9 1c 0c	  cmp #$0c1c
$0d:a693  25 6f		 and $6f
$0d:a695  31 b0		 and ($b0),y
$0d:a697  39 00 00	  and $0000,y
$0d:a69a  23 08		 and $08,s
$0d:a69c  66 10		 ror $10
$0d:a69e  c9 1c 0c	  cmp #$0c1c
$0d:a6a1  25 6f		 and $6f
$0d:a6a3  31 b0		 and ($b0),y
$0d:a6a5  39 34 4a	  and $4a34,y
$0d:a6a8  01 eb		 ora ($eb,x)
$0d:a6aa  a6 61		 ldx $61
$0d:a6ac  0b			phd
$0d:a6ad  02 01		 cop #$01
$0d:a6af  f7 a6		 sbc [$a6],y
$0d:a6b1  61 0b		 adc ($0b,x)
$0d:a6b3  02 01		 cop #$01
$0d:a6b5  03 a7		 ora $a7,s
$0d:a6b7  61 0b		 adc ($0b,x)
$0d:a6b9  02 01		 cop #$01
$0d:a6bb  0f a7 61 0b   ora $0b61a7
$0d:a6bf  02 01		 cop #$01
$0d:a6c1  1b			tcs
$0d:a6c2  a7 61		 lda [$61]
$0d:a6c4  0b			phd
$0d:a6c5  02 01		 cop #$01
$0d:a6c7  27 a7		 and [$a7]
$0d:a6c9  61 0b		 adc ($0b,x)
$0d:a6cb  02 01		 cop #$01
$0d:a6cd  1b			tcs
$0d:a6ce  a7 61		 lda [$61]
$0d:a6d0  0b			phd
$0d:a6d1  02 01		 cop #$01
$0d:a6d3  0f a7 61 0b   ora $0b61a7
$0d:a6d7  02 01		 cop #$01
$0d:a6d9  03 a7		 ora $a7,s
$0d:a6db  61 0b		 adc ($0b,x)
$0d:a6dd  02 01		 cop #$01
$0d:a6df  f7 a6		 sbc [$a6],y
$0d:a6e1  61 0b		 adc ($0b,x)
$0d:a6e3  02 01		 cop #$01
$0d:a6e5  eb			xba
$0d:a6e6  a6 61		 ldx $61
$0d:a6e8  0b			phd
$0d:a6e9  02 00		 cop #$00
$0d:a6eb  14 10		 trb $10
$0d:a6ed  99 0c 3b	  sta $3b0c,y
$0d:a6f0  09 dd 09	  ora #$09dd
$0d:a6f3  9f 12 5e 17   sta $175e12,x
$0d:a6f7  52 24		 eor ($24)
$0d:a6f9  97 14		 sta [$14],y
$0d:a6fb  3a			dec a
$0d:a6fc  19 dd 1d	  ora $1ddd,y
$0d:a6ff  ff 7f 1f 43   sbc $431f7f,x
$0d:a703  52 2c		 eor ($2c)
$0d:a705  b8			clv
$0d:a706  24 7b		 bit $7b
$0d:a708  2d ff 7f	  and $7fff
$0d:a70b  1f 57 9f 4e   ora $4e9f57,x
$0d:a70f  10 40		 bpl $a751
$0d:a711  56 40		 lsr $40,x
$0d:a713  ff 7f 7f 66   sbc $667f7f,x
$0d:a717  ff 55 5f 41   sbc $415f55,x
$0d:a71b  0e 40 ff	  asl $ff40
$0d:a71e  7f 7f 7a df   adc $df7a7f,x
$0d:a722  65 ff		 adc $ff
$0d:a724  54 ba 4c	  mvn $4c,$ba
$0d:a727  ff 7f 39 7f   sbc $7f397f,x
$0d:a72b  d4 7d		 pei ($7d)
$0d:a72d  71 7d		 adc ($7d),y
$0d:a72f  0e 6c 08	  asl $086c
$0d:a732  54 08 fc	  mvn $fc,$08
$0d:a735  a8			tay
$0d:a736  51 0f		 eor ($0f),y
$0d:a738  0a			asl a
$0d:a739  08			php
$0d:a73a  fc a8 51	  jsr ($51a8,x)
$0d:a73d  0f 08 08 fc   ora $fc0808
$0d:a741  a8			tay
$0d:a742  51 0f		 eor ($0f),y
$0d:a744  06 08		 asl $08
$0d:a746  fc a8 51	  jsr ($51a8,x)
$0d:a749  0f 04 08 fc   ora $fc0804
$0d:a74d  a8			tay
$0d:a74e  51 0f		 eor ($0f),y
$0d:a750  03 08		 ora $08,s
$0d:a752  fc a8 51	  jsr ($51a8,x)
$0d:a755  0f 02 08 fc   ora $fc0802
$0d:a759  a8			tay
$0d:a75a  51 0f		 eor ($0f),y
$0d:a75c  02 08		 cop #$08
$0d:a75e  fc a8 51	  jsr ($51a8,x)
$0d:a761  0f 01 08 fc   ora $fc0801
$0d:a765  a8			tay
$0d:a766  51 0f		 eor ($0f),y
$0d:a768  01 08		 ora ($08,x)
$0d:a76a  fc a8 51	  jsr ($51a8,x)
$0d:a76d  0f 00 08 fc   ora $fc0800
$0d:a771  a8			tay
$0d:a772  51 0f		 eor ($0f),y
$0d:a774  00 08		 brk #$08
$0d:a776  fc a8 51	  jsr ($51a8,x)
$0d:a779  0f 00 08 fc   ora $fc0800
$0d:a77d  a8			tay
$0d:a77e  51 0f		 eor ($0f),y
$0d:a780  00 04		 brk #$04
$0d:a782  fc a8 51	  jsr ($51a8,x)
$0d:a785  0f 00 02 7c   ora $7c0200
$0d:a789  a9 51 0f	  lda #$0f51
$0d:a78c  00 02		 brk #$02
$0d:a78e  7c a9 51	  jmp ($51a9,x)
$0d:a791  0f 00 02 7c   ora $7c0200
$0d:a795  a9 51 0f	  lda #$0f51
$0d:a798  00 02		 brk #$02
$0d:a79a  7c a9 51	  jmp ($51a9,x)
$0d:a79d  0f 00 02 7c   ora $7c0200
$0d:a7a1  a9 51 0f	  lda #$0f51
$0d:a7a4  00 02		 brk #$02
$0d:a7a6  7c a9 51	  jmp ($51a9,x)
$0d:a7a9  0f 00 02 7c   ora $7c0200
$0d:a7ad  a9 51 0f	  lda #$0f51
$0d:a7b0  00 02		 brk #$02
$0d:a7b2  7c a9 51	  jmp ($51a9,x)
$0d:a7b5  0f 00 02 7c   ora $7c0200
$0d:a7b9  a9 51 0f	  lda #$0f51
$0d:a7bc  00 02		 brk #$02
$0d:a7be  7c a9 51	  jmp ($51a9,x)
$0d:a7c1  0f 00 02 7c   ora $7c0200
$0d:a7c5  a9 51 0f	  lda #$0f51
$0d:a7c8  00 02		 brk #$02
$0d:a7ca  7c a9 51	  jmp ($51a9,x)
$0d:a7cd  0f 00 02 7c   ora $7c0200
$0d:a7d1  a9 51 0f	  lda #$0f51
$0d:a7d4  00 02		 brk #$02
$0d:a7d6  7c a9 51	  jmp ($51a9,x)
$0d:a7d9  0f 00 02 7c   ora $7c0200
$0d:a7dd  a9 51 0f	  lda #$0f51
$0d:a7e0  00 02		 brk #$02
$0d:a7e2  7c a9 51	  jmp ($51a9,x)
$0d:a7e5  0f 00 02 7c   ora $7c0200
$0d:a7e9  a9 51 0f	  lda #$0f51
$0d:a7ec  00 02		 brk #$02
$0d:a7ee  7c a9 51	  jmp ($51a9,x)
$0d:a7f1  0f 00 02 7c   ora $7c0200
$0d:a7f5  a9 51 0f	  lda #$0f51
$0d:a7f8  00 02		 brk #$02
$0d:a7fa  7c a9 51	  jmp ($51a9,x)
$0d:a7fd  0f 00 02 7c   ora $7c0200
$0d:a801  a9 51 0f	  lda #$0f51
$0d:a804  00 02		 brk #$02
$0d:a806  7c a9 51	  jmp ($51a9,x)
$0d:a809  0f 00 02 7c   ora $7c0200
$0d:a80d  a9 51 0f	  lda #$0f51
$0d:a810  00 02		 brk #$02
$0d:a812  7c a9 51	  jmp ($51a9,x)
$0d:a815  0f 00 02 7c   ora $7c0200
$0d:a819  a9 51 0f	  lda #$0f51
$0d:a81c  00 02		 brk #$02
$0d:a81e  7c a9 51	  jmp ($51a9,x)
$0d:a821  0f 00 02 7c   ora $7c0200
$0d:a825  a9 51 0f	  lda #$0f51
$0d:a828  00 02		 brk #$02
$0d:a82a  7c a9 51	  jmp ($51a9,x)
$0d:a82d  0f 00 02 7c   ora $7c0200
$0d:a831  a9 51 0f	  lda #$0f51
$0d:a834  00 02		 brk #$02
$0d:a836  7c a9 51	  jmp ($51a9,x)
$0d:a839  0f 00 01 9c   ora $9c0100
$0d:a83d  a9 51 0b	  lda #$0b51
$0d:a840  00 01		 brk #$01
$0d:a842  9e a9 51	  stz $51a9,x
$0d:a845  0b			phd
$0d:a846  00 01		 brk #$01
$0d:a848  a0 a9 51	  ldy #$51a9
$0d:a84b  0b			phd
$0d:a84c  00 01		 brk #$01
$0d:a84e  a2 a9 51	  ldx #$51a9
$0d:a851  0b			phd
$0d:a852  00 01		 brk #$01
$0d:a854  a4 a9		 ldy $a9
$0d:a856  51 0b		 eor ($0b),y
$0d:a858  00 01		 brk #$01
$0d:a85a  a6 a9		 ldx $a9
$0d:a85c  51 0b		 eor ($0b),y
$0d:a85e  00 01		 brk #$01
$0d:a860  a8			tay
$0d:a861  a9 51 0b	  lda #$0b51
$0d:a864  01 01		 ora ($01,x)
$0d:a866  9c a9 51	  stz $51a9
$0d:a869  0b			phd
$0d:a86a  01 01		 ora ($01,x)
$0d:a86c  9e a9 51	  stz $51a9,x
$0d:a86f  0b			phd
$0d:a870  01 01		 ora ($01,x)
$0d:a872  a0 a9 51	  ldy #$51a9
$0d:a875  0b			phd
$0d:a876  01 01		 ora ($01,x)
$0d:a878  a2 a9 51	  ldx #$51a9
$0d:a87b  0b			phd
$0d:a87c  01 01		 ora ($01,x)
$0d:a87e  a4 a9		 ldy $a9
$0d:a880  51 0b		 eor ($0b),y
$0d:a882  02 01		 cop #$01
$0d:a884  a6 a9		 ldx $a9
$0d:a886  51 0b		 eor ($0b),y
$0d:a888  02 01		 cop #$01
$0d:a88a  a8			tay
$0d:a88b  a9 51 0b	  lda #$0b51
$0d:a88e  02 01		 cop #$01
$0d:a890  b4 a9		 ldy $a9,x
$0d:a892  51 0b		 eor ($0b),y
$0d:a894  02 01		 cop #$01
$0d:a896  b6 a9		 ldx $a9,y
$0d:a898  51 0b		 eor ($0b),y
$0d:a89a  03 01		 ora $01,s
$0d:a89c  b8			clv
$0d:a89d  a9 51 0b	  lda #$0b51
$0d:a8a0  03 01		 ora $01,s
$0d:a8a2  ba			tsx
$0d:a8a3  a9 51 0b	  lda #$0b51
$0d:a8a6  03 01		 ora $01,s
$0d:a8a8  bc a9 51	  ldy $51a9,x
$0d:a8ab  0b			phd
$0d:a8ac  03 01		 ora $01,s
$0d:a8ae  be a9 51	  ldx $51a9,y
$0d:a8b1  0b			phd
$0d:a8b2  04 01		 tsb $01
$0d:a8b4  c0 a9 51	  cpy #$51a9
$0d:a8b7  0b			phd
$0d:a8b8  04 01		 tsb $01
$0d:a8ba  b4 a9		 ldy $a9,x
$0d:a8bc  51 0b		 eor ($0b),y
$0d:a8be  04 01		 tsb $01
$0d:a8c0  b6 a9		 ldx $a9,y
$0d:a8c2  51 0b		 eor ($0b),y
$0d:a8c4  04 01		 tsb $01
$0d:a8c6  b8			clv
$0d:a8c7  a9 51 0b	  lda #$0b51
$0d:a8ca  05 01		 ora $01
$0d:a8cc  ba			tsx
$0d:a8cd  a9 51 0b	  lda #$0b51
$0d:a8d0  05 01		 ora $01
$0d:a8d2  bc a9 51	  ldy $51a9,x
$0d:a8d5  0b			phd
$0d:a8d6  05 01		 ora $01
$0d:a8d8  be a9 51	  ldx $51a9,y
$0d:a8db  0b			phd
$0d:a8dc  06 01		 asl $01
$0d:a8de  c0 a9 51	  cpy #$51a9
$0d:a8e1  0b			phd
$0d:a8e2  06 01		 asl $01
$0d:a8e4  b4 a9		 ldy $a9,x
$0d:a8e6  51 0f		 eor ($0f),y
$0d:a8e8  03 01		 ora $01,s
$0d:a8ea  cc a9 51	  cpy $51a9
$0d:a8ed  0f 05 01 dc   ora $dc0105
$0d:a8f1  a9 51 0f	  lda #$0f51
$0d:a8f4  07 01		 ora [$01]
$0d:a8f6  ec a9 51	  cpx $51a9
$0d:a8f9  0f 4f 00 4a   ora $4a004f
$0d:a8fd  00 74		 brk #$74
$0d:a8ff  00 d6		 brk #$d6
$0d:a901  00 58		 brk #$58
$0d:a903  01 da		 ora ($da,x)
$0d:a905  0d dc 1a	  ora $1adc
$0d:a908  6c 00 cc	  jmp ($cc00)
$0d:a90b  10 6c		 bpl $a979
$0d:a90d  00 b5		 brk #$b5
$0d:a90f  00 36		 brk #$36
$0d:a911  05 98		 ora $98
$0d:a913  09 1a 12	  ora #$121a
$0d:a916  1c 27 6e	  trb $6e27
$0d:a919  00 cc		 brk #$cc
$0d:a91b  10 ae		 bpl $a8cb
$0d:a91d  00 f6		 brk #$f6
$0d:a91f  04 77		 tsb $77
$0d:a921  09 d9 11	  ora #$11d9
$0d:a924  5a			phy
$0d:a925  1a			inc a
$0d:a926  5c 37 70 00   jml $007037
$0d:a92a  cc 10 d0	  cpy $d010
$0d:a92d  00 38		 brk #$38
$0d:a92f  09 b8 11	  ora #$11b8
$0d:a932  1a			inc a
$0d:a933  1a			inc a
$0d:a934  da			phx
$0d:a935  22 9c 43 72   jsl $72439c
$0d:a939  00 cc		 brk #$cc
$0d:a93b  10 af		 bpl $a8ec
$0d:a93d  00 17		 brk #$17
$0d:a93f  05 97		 ora $97
$0d:a941  0d f9 15	  ora $15f9
$0d:a944  9a			txs
$0d:a945  1e 7c 3b	  asl $3b7c,x
$0d:a948  71 00		 adc ($00),y
$0d:a94a  cc 10 8d	  cpy $8d10
$0d:a94d  00 d6		 brk #$d6
$0d:a94f  04 57		 tsb $57
$0d:a951  09 b9 0d	  ora #$0db9
$0d:a954  5a			phy
$0d:a955  16 3c		 asl $3c,x
$0d:a957  33 6f		 and ($6f,s),y
$0d:a959  00 cc		 brk #$cc
$0d:a95b  10 6b		 bpl $a9c8
$0d:a95d  00 b5		 brk #$b5
$0d:a95f  00 16		 brk #$16
$0d:a961  05 98		 ora $98
$0d:a963  09 1a 12	  ora #$121a
$0d:a966  fc 26 6d	  jsr ($6d26,x)
$0d:a969  00 cc		 brk #$cc
$0d:a96b  10 4a		 bpl $a9b7
$0d:a96d  00 74		 brk #$74
$0d:a96f  00 d6		 brk #$d6
$0d:a971  00 58		 brk #$58
$0d:a973  01 da		 ora ($da,x)
$0d:a975  0d dc 1a	  ora $1adc
$0d:a978  6c 00 cc	  jmp ($cc00)
$0d:a97b  10 90		 bpl $a90d
$0d:a97d  11 56		 ora ($56),y
$0d:a97f  3a			dec a
$0d:a980  98			tya
$0d:a981  42 1a		 wdm #$1a
$0d:a983  4b			phk
$0d:a984  9c 63 de	  stz $de63
$0d:a987  7b			tdc
$0d:a988  f4 10 cc	  pea $cc10
$0d:a98b  10 4a		 bpl $a9d7
$0d:a98d  00 74		 brk #$74
$0d:a98f  00 d6		 brk #$d6
$0d:a991  00 58		 brk #$58
$0d:a993  01 da		 ora ($da,x)
$0d:a995  0d dc 1a	  ora $1adc
$0d:a998  6c 00 cc	  jmp ($cc00)
$0d:a99b  10 0c		 bpl $a9a9
$0d:a99d  01 90		 ora ($90,x)
$0d:a99f  01 14		 ora ($14,x)
$0d:a9a1  0a			asl a
$0d:a9a2  98			tya
$0d:a9a3  1a			inc a
$0d:a9a4  14 0a		 trb $0a
$0d:a9a6  90 01		 bcc $a9a9
$0d:a9a8  0c 01 90	  tsb $9001
$0d:a9ab  01 14		 ora ($14,x)
$0d:a9ad  0a			asl a
$0d:a9ae  98			tya
$0d:a9af  1a			inc a
$0d:a9b0  14 0a		 trb $0a
$0d:a9b2  90 01		 bcc $a9b5
$0d:a9b4  ca			dex
$0d:a9b5  00 6f		 brk #$6f
$0d:a9b7  15 f2		 ora $f2,x
$0d:a9b9  25 97		 and $97
$0d:a9bb  3a			dec a
$0d:a9bc  f2 25		 sbc ($25)
$0d:a9be  6f 15 ca 00   adc $00ca15
$0d:a9c2  6f 15 f2 25   adc $25f215
$0d:a9c6  97 3a		 sta [$3a],y
$0d:a9c8  f2 25		 sbc ($25)
$0d:a9ca  6f 15 a8 00   adc $00a815
$0d:a9ce  2c 15 90	  bit $9015
$0d:a9d1  21 b2		 and ($b2,x)
$0d:a9d3  25 d3		 and $d3
$0d:a9d5  2d 97 3e	  and $3e97
$0d:a9d8  eb			xba
$0d:a9d9  00 4c		 brk #$4c
$0d:a9db  15 86		 ora $86,x
$0d:a9dd  00 c9		 brk #$c9
$0d:a9df  10 2d		 bpl $aa0e
$0d:a9e1  1d b2 25	  ora $25b2,x
$0d:a9e4  d3 2d		 cmp ($2d,s),y
$0d:a9e6  97 46		 sta [$46],y
$0d:a9e8  c8			iny
$0d:a9e9  08			php
$0d:a9ea  2a			rol a
$0d:a9eb  15 44		 ora $44,x
$0d:a9ed  04 86		 tsb $86
$0d:a9ef  0c cb 14	  tsb $14cb
$0d:a9f2  71 25		 adc ($25),y
$0d:a9f4  d4 35		 pei ($35)
$0d:a9f6  76 4a		 ror $4a,x
$0d:a9f8  85 0c		 sta $0c
$0d:a9fa  e8			inx
$0d:a9fb  18			clc
$0d:a9fc  01 b7		 ora ($b7,x)
$0d:a9fe  aa			tax
$0d:a9ff  81 1d		 sta ($1d,x)
$0d:aa01  05 01		 ora $01
$0d:aa03  99 aa 81	  sta $81aa,y
$0d:aa06  1d 04 01	  ora $0104,x
$0d:aa09  7b			tdc
$0d:aa0a  aa			tax
$0d:aa0b  81 1d		 sta ($1d,x)
$0d:aa0d  04 01		 tsb $01
$0d:aa0f  5d aa 81	  eor $81aa,x
$0d:aa12  1d 04 01	  ora $0104,x
$0d:aa15  3f aa 81 1d   and $1d81aa,x
$0d:aa19  04 01		 tsb $01
$0d:aa1b  11 ab		 ora ($ab),y
$0d:aa1d  81 1d		 sta ($1d,x)
$0d:aa1f  03 01		 ora $01,s
$0d:aa21  f3 aa		 sbc ($aa,s),y
$0d:aa23  81 1d		 sta ($1d,x)
$0d:aa25  02 01		 cop #$01
$0d:aa27  d5 aa		 cmp $aa,x
$0d:aa29  81 1d		 sta ($1d,x)
$0d:aa2b  01 01		 ora ($01,x)
$0d:aa2d  f3 aa		 sbc ($aa,s),y
$0d:aa2f  81 1d		 sta ($1d,x)
$0d:aa31  02 01		 cop #$01
$0d:aa33  11 ab		 ora ($ab),y
$0d:aa35  81 1d		 sta ($1d,x)
$0d:aa37  03 01		 ora $01,s
$0d:aa39  3f aa 81 1d   and $1d81aa,x
$0d:aa3d  04 00		 tsb $00
$0d:aa3f  1f 21 7a 14   ora $147a21,x
$0d:aa43  11 10		 ora ($10),y
$0d:aa45  09 10 03	  ora #$0310
$0d:aa48  0c 00 00	  tsb $0000
$0d:aa4b  1f 3a 1f 53   ora $531f3a,x
$0d:aa4f  99 44 ab	  sta $ab44,y
$0d:aa52  00 33		 brk #$33
$0d:aa54  01 3b		 ora ($3b,x)
$0d:aa56  02 3f		 cop #$3f
$0d:aa58  03 ff		 ora $ff,s
$0d:aa5a  53 0b		 eor ($0b,s),y
$0d:aa5c  34 58		 bit $58,x
$0d:aa5e  29 b6 18	  and #$18b6
$0d:aa61  30 10		 bmi $aa73
$0d:aa63  28			plp
$0d:aa64  10 03		 bpl $aa69
$0d:aa66  0c 00 00	  tsb $0000
$0d:aa69  1c 3e 1e	  trb $1e3e
$0d:aa6c  57 18		 eor [$18],y
$0d:aa6e  45 a9		 eor $a9
$0d:aa70  04 30		 tsb $30
$0d:aa72  0d 38 12	  ora $1238
$0d:aa75  3c 27 ff	  bit $ff27,x
$0d:aa78  5b			tcd
$0d:aa79  aa			tax
$0d:aa7a  2c 73 2d	  bit $2d73
$0d:aa7d  10 25		 bpl $aaa4
$0d:aa7f  8b			phb
$0d:aa80  18			clc
$0d:aa81  67 10		 adc [$10]
$0d:aa83  43 0c		 eor $0c,s
$0d:aa85  00 00		 brk #$00
$0d:aa87  39 42 3d	  and $3d42,y
$0d:aa8a  5f b6 49 a8   eor $a849b6,x
$0d:aa8e  08			php
$0d:aa8f  2d 15 14	  and $1415
$0d:aa92  26 1b		 rol $1b
$0d:aa94  37 ff		 and [$ff],y
$0d:aa96  67 ca		 adc [$ca]
$0d:aa98  2c 90 31	  bit $3190
$0d:aa9b  2d 29 c9	  and $c929
$0d:aa9e  18			clc
$0d:aa9f  86 10		 stx $10
$0d:aaa1  43 0c		 eor $0c,s
$0d:aaa3  00 00		 brk #$00
$0d:aaa5  55 4a		 eor $4a,x
$0d:aaa7  5c 6b 15 4a   jml $4a156b
$0d:aaab  a6 10		 ldx $10
$0d:aaad  2b			pld
$0d:aaae  1d 11 36	  ora $3611,x
$0d:aab1  19 4f ff	  ora $ff4f,y
$0d:aab4  73 ea		 adc ($ea,s),y
$0d:aab6  28			plp
$0d:aab7  ad 35 6b	  lda $6b35
$0d:aaba  2d e7 1c	  and $1ce7
$0d:aabd  a5 14		 lda $14
$0d:aabf  63 0c		 adc $0c,s
$0d:aac1  00 00		 brk #$00
$0d:aac3  73 4e		 adc ($4e,s),y
$0d:aac5  7b			tdc
$0d:aac6  6f 73 4e a5   adc $a54e73
$0d:aaca  14 29		 trb $29
$0d:aacc  25 ef		 and $ef
$0d:aace  3d f7 5e	  and $5ef7,x
$0d:aad1  ff 7f 29 25   sbc $25297f,x
$0d:aad5  ff 7f ff 7f   sbc $7fff7f,x
$0d:aad9  ff 7f ff 7f   sbc $7fff7f,x
$0d:aadd  ff 7f ff 7f   sbc $7fff7f,x
$0d:aae1  ff 7f ff 7f   sbc $7fff7f,x
$0d:aae5  ff 7f ff 7f   sbc $7fff7f,x
$0d:aae9  ff 7f ff 7f   sbc $7fff7f,x
$0d:aaed  ff 7f ff 7f   sbc $7fff7f,x
$0d:aaf1  ff 7f ff 6b   sbc $6bff7f,x
$0d:aaf5  df 5f df 53   cmp $53df5f,x
$0d:aaf9  bf 4b bf 3f   lda $3fbf4b,x
$0d:aafd  9f 33 ff 73   sta $73ff33,x
$0d:ab01  ff 7f df 5f   sbc $5fdf7f,x
$0d:ab05  9f 33 bf 43   sta $43bf33,x
$0d:ab09  df 57 ff 6b   cmp $6bff57,x
$0d:ab0d  ff 7f bf 3b   sbc $3bbf7f,x
$0d:ab11  9f 46 3c 3a   sta $3a3c46,x
$0d:ab15  18			clc
$0d:ab16  32 f4		 and ($f4)
$0d:ab18  2d f1 25	  and $25f1
$0d:ab1b  ae 15 1f	  ldx $1f15
$0d:ab1e  57 7f		 eor [$7f],y
$0d:ab20  67 bd		 adc [$bd]
$0d:ab22  56 57		 lsr $57,x
$0d:ab24  1e ba 26	  asl $26ba,x
$0d:ab27  3d 3b bf	  and $bf3b,x
$0d:ab2a  47 ff		 eor [$ff]
$0d:ab2c  6b			rtl
$0d:ab2d  18			clc
$0d:ab2e  3e 01 60	  rol $6001,x
$0d:ab31  ab			plb
$0d:ab32  31 1d		 and ($1d),y
$0d:ab34  05 01		 ora $01
$0d:ab36  7e ab 31	  ror $31ab,x
$0d:ab39  1d 06 01	  ora $0106,x
$0d:ab3c  9c ab 31	  stz $31ab
$0d:ab3f  1d 07 01	  ora $0107,x
$0d:ab42  ba			tsx
$0d:ab43  ab			plb
$0d:ab44  31 1d		 and ($1d),y
$0d:ab46  08			php
$0d:ab47  01 d8		 ora ($d8,x)
$0d:ab49  ab			plb
$0d:ab4a  31 1d		 and ($1d),y
$0d:ab4c  09 01 f6	  ora #$f601
$0d:ab4f  ab			plb
$0d:ab50  31 1d		 and ($1d),y
$0d:ab52  0a			asl a
$0d:ab53  01 14		 ora ($14,x)
$0d:ab55  ac 31 1d	  ldy $1d31
$0d:ab58  0b			phd
$0d:ab59  01 32		 ora ($32,x)
$0d:ab5b  ac 31 1d	  ldy $1d31
$0d:ab5e  00 00		 brk #$00
$0d:ab60  25 00		 and $00
$0d:ab62  48			pha
$0d:ab63  00 8a		 brk #$8a
$0d:ab65  04 ce		 tsb $ce
$0d:ab67  08			php
$0d:ab68  31 0d		 and ($0d),y
$0d:ab6a  74 11		 stz $11,x
$0d:ab6c  d8			cld
$0d:ab6d  15 63		 ora $63,x
$0d:ab6f  18			clc
$0d:ab70  c6 20		 dec $20
$0d:ab72  4a			lsr a
$0d:ab73  29 ce 31	  and #$31ce
$0d:ab76  52 46		 eor ($46)
$0d:ab78  d6 56		 dec $56,x
$0d:ab7a  42 08		 wdm #$08
$0d:ab7c  bd 77 26	  lda $2677,x
$0d:ab7f  00 49		 brk #$49
$0d:ab81  00 8b		 brk #$8b
$0d:ab83  04 cf		 tsb $cf
$0d:ab85  08			php
$0d:ab86  32 0d		 and ($0d)
$0d:ab88  75 11		 adc $11,x
$0d:ab8a  d9 15 68	  cmp $6815,y
$0d:ab8d  18			clc
$0d:ab8e  c9 20 6e	  cmp #$6e20
$0d:ab91  29 d0 31	  and #$31d0
$0d:ab94  74 46		 stz $46,x
$0d:ab96  f7 56		 sbc [$56],y
$0d:ab98  46 08		 lsr $08
$0d:ab9a  bd 77 27	  lda $2777,x
$0d:ab9d  00 4a		 brk #$4a
$0d:ab9f  00 8c		 brk #$8c
$0d:aba1  04 d0		 tsb $d0
$0d:aba3  08			php
$0d:aba4  33 0d		 and ($0d,s),y
$0d:aba6  96 11		 stx $11,y
$0d:aba8  fa			plx
$0d:aba9  15 6e		 ora $6e,x
$0d:abab  14 ee		 trb $ee
$0d:abad  20 92 29	  jsr $2992
$0d:abb0  f3 31		 sbc ($31,s),y
$0d:abb2  96 42		 stx $42,y
$0d:abb4  19 57 49	  ora $4957,y
$0d:abb7  08			php
$0d:abb8  de 7b 28	  dec $287b,x
$0d:abbb  00 4b		 brk #$4b
$0d:abbd  00 8e		 brk #$8e
$0d:abbf  04 f3		 tsb $f3
$0d:abc1  08			php
$0d:abc2  54 0d 97	  mvn $97,$0d
$0d:abc5  11 1b		 ora ($1b),y
$0d:abc7  16 93		 asl $93,x
$0d:abc9  14 11		 trb $11
$0d:abcb  21 93		 and ($93,x)
$0d:abcd  29 17 32	  and #$3217
$0d:abd0  98			tya
$0d:abd1  42 3a		 wdm #$3a
$0d:abd3  57 4e		 eor [$4e],y
$0d:abd5  08			php
$0d:abd6  ff 7f 29 00   sbc $00297f,x
$0d:abda  4c 00 8f	  jmp $8f00
$0d:abdd  04 f4		 tsb $f4
$0d:abdf  04 55		 tsb $55
$0d:abe1  0d b8 0d	  ora $0db8
$0d:abe4  1c 16 95	  trb $9516
$0d:abe7  10 13		 bpl $abfc
$0d:abe9  1d b8 29	  ora $29b8,x
$0d:abec  38			sec
$0d:abed  32 da		 and ($da)
$0d:abef  3e 5c 53	  rol $535c,x
$0d:abf2  4f 08 de 7b   eor $7bde08
$0d:abf6  2a			rol a
$0d:abf7  00 4d		 brk #$4d
$0d:abf9  00 91		 brk #$91
$0d:abfb  04 14		 tsb $14
$0d:abfd  05 77		 ora $77
$0d:abff  09 b9 0d	  ora #$0db9
$0d:ac02  3c 16 99	  bit $9916,x
$0d:ac05  10 38		 bpl $ac3f
$0d:ac07  1d da 29	  ora $29da,x
$0d:ac0a  39 32 dc	  and $dc32,y
$0d:ac0d  3a			dec a
$0d:ac0e  7c 53 52	  jmp ($5253,x)
$0d:ac11  08			php
$0d:ac12  bd 77 2b	  lda $2b77,x
$0d:ac15  00 4e		 brk #$4e
$0d:ac17  00 93		 brk #$93
$0d:ac19  04 16		 tsb $16
$0d:ac1b  05 78		 ora $78
$0d:ac1d  09 da 0d	  ora #$0dda
$0d:ac20  3d 16 9d	  and $9d16,x
$0d:ac23  10 5d		 bpl $ac82
$0d:ac25  1d dc 29	  ora $29dc,x
$0d:ac28  5c 32 fe 3a   jml $3afe32
$0d:ac2c  9e 53 55	  stz $5553,x
$0d:ac2f  08			php
$0d:ac30  bd 77 2c	  lda $2c77,x
$0d:ac33  00 50		 brk #$50
$0d:ac35  00 94		 brk #$94
$0d:ac37  04 18		 tsb $18
$0d:ac39  05 7a		 ora $7a
$0d:ac3b  09 dc 0d	  ora #$0ddc
$0d:ac3e  3e 12 bf	  rol $bf12,x
$0d:ac41  0c 7f 19	  tsb $197f
$0d:ac44  ff 25 7f 2e   sbc $2e7f25,x
$0d:ac48  1f 37 bf 4f   ora $4fbf37,x
$0d:ac4c  59 08 bd	  eor $bd08,y
$0d:ac4f  77 01		 adc [$01],y
$0d:ac51  0b			phd
$0d:ac52  ad a1 1d	  lda $1da1
$0d:ac55  05 01		 ora $01
$0d:ac57  ed ac a1	  sbc $a1ac
$0d:ac5a  1d 04 01	  ora $0104,x
$0d:ac5d  cf ac a1 1d   cmp $1da1ac
$0d:ac61  04 01		 tsb $01
$0d:ac63  b1 ac		 lda ($ac),y
$0d:ac65  a1 1d		 lda ($1d,x)
$0d:ac67  04 01		 tsb $01
$0d:ac69  93 ac		 sta ($ac,s),y
$0d:ac6b  a1 1d		 lda ($1d,x)
$0d:ac6d  04 01		 tsb $01
$0d:ac6f  65 ad		 adc $ad
$0d:ac71  a1 1d		 lda ($1d,x)
$0d:ac73  03 01		 ora $01,s
$0d:ac75  47 ad		 eor [$ad]
$0d:ac77  a1 1d		 lda ($1d,x)
$0d:ac79  02 01		 cop #$01
$0d:ac7b  29 ad a1	  and #$a1ad
$0d:ac7e  1d 01 01	  ora $0101,x
$0d:ac81  47 ad		 eor [$ad]
$0d:ac83  a1 1d		 lda ($1d,x)
$0d:ac85  02 01		 cop #$01
$0d:ac87  65 ad		 adc $ad
$0d:ac89  a1 1d		 lda ($1d,x)
$0d:ac8b  03 01		 ora $01,s
$0d:ac8d  93 ac		 sta ($ac,s),y
$0d:ac8f  a1 1d		 lda ($1d,x)
$0d:ac91  04 00		 tsb $00
$0d:ac93  06 1b		 asl $1b
$0d:ac95  43 1e		 eor $1e,s
$0d:ac97  60			rts
$0d:ac98  15 c0		 ora $c0,x
$0d:ac9a  1c 40 14	  trb $1440
$0d:ac9d  00 00		 brk #$00
$0d:ac9f  74 37		 stz $37,x
$0d:aca1  fb			xce
$0d:aca2  4f 99 44 ab   eor $ab4499
$0d:aca6  00 33		 brk #$33
$0d:aca8  01 3b		 ora ($3b,x)
$0d:acaa  02 3f		 cop #$3f
$0d:acac  03 ff		 ora $ff,s
$0d:acae  53 0b		 eor ($0b,s),y
$0d:acb0  34 c7		 bit $c7,x
$0d:acb2  1e e5 21	  asl $21e5,x
$0d:acb5  41 15		 eor ($15,x)
$0d:acb7  c1 1c		 cmp ($1c,x)
$0d:acb9  40			rti
$0d:acba  14 00		 trb $00
$0d:acbc  00 34		 brk #$34
$0d:acbe  3b			tsc
$0d:acbf  db			stp
$0d:acc0  57 18		 eor [$18],y
$0d:acc2  45 a9		 eor $a9
$0d:acc4  04 30		 tsb $30
$0d:acc6  0d 38 12	  ora $1238
$0d:acc9  3c 27 ff	  bit $ff27,x
$0d:accc  5b			tcd
$0d:accd  aa			tax
$0d:acce  2c 4a 2a	  bit $2a4a
$0d:acd1  a8			tay
$0d:acd2  25 24		 and $24
$0d:acd4  19 c3 18	  ora $18c3,y
$0d:acd7  42 10		 wdm #$10
$0d:acd9  00 00		 brk #$00
$0d:acdb  f4 42 bb	  pea $bb42
$0d:acde  5f b6 49 a8   eor $a849b6,x
$0d:ace2  08			php
$0d:ace3  2d 15 14	  and $1415
$0d:ace6  26 1b		 rol $1b
$0d:ace8  37 ff		 and [$ff],y
$0d:acea  67 ca		 adc [$ca]
$0d:acec  2c ec 31	  bit $31ec
$0d:acef  89 25 06	  bit #$0625
$0d:acf2  19 c4 18	  ora $18c4,y
$0d:acf5  42 10		 wdm #$10
$0d:acf7  00 00		 brk #$00
$0d:acf9  b4 4a		 ldy $4a,x
$0d:acfb  9b			txy
$0d:acfc  67 15		 adc [$15]
$0d:acfe  4a			lsr a
$0d:acff  a6 10		 ldx $10
$0d:ad01  2b			pld
$0d:ad02  1d 11 36	  ora $3611,x
$0d:ad05  19 4f ff	  ora $ff4f,y
$0d:ad08  73 ea		 adc ($ea,s),y
$0d:ad0a  28			plp
$0d:ad0b  ad 35 4a	  lda $4a35
$0d:ad0e  29 e7 1c	  and #$1ce7
$0d:ad11  a5 14		 lda $14
$0d:ad13  63 0c		 adc $0c,s
$0d:ad15  00 00		 brk #$00
$0d:ad17  73 4e		 adc ($4e,s),y
$0d:ad19  7b			tdc
$0d:ad1a  6f 73 4e a5   adc $a54e73
$0d:ad1e  14 29		 trb $29
$0d:ad20  25 ef		 and $ef
$0d:ad22  3d f7 5e	  and $5ef7,x
$0d:ad25  ff 7f 29 25   sbc $25297f,x
$0d:ad29  ff 7f ff 7f   sbc $7fff7f,x
$0d:ad2d  ff 7f ff 7f   sbc $7fff7f,x
$0d:ad31  ff 7f ff 7f   sbc $7fff7f,x
$0d:ad35  ff 7f ff 7f   sbc $7fff7f,x
$0d:ad39  ff 7f ff 7f   sbc $7fff7f,x
$0d:ad3d  ff 7f ff 7f   sbc $7fff7f,x
$0d:ad41  ff 7f ff 7f   sbc $7fff7f,x
$0d:ad45  ff 7f ff 6b   sbc $6bff7f,x
$0d:ad49  df 5f df 53   cmp $53df5f,x
$0d:ad4d  bf 4b bf 3f   lda $3fbf4b,x
$0d:ad51  9f 33 ff 73   sta $73ff33,x
$0d:ad55  ff 7f df 5f   sbc $5fdf7f,x
$0d:ad59  9f 33 bf 43   sta $43bf33,x
$0d:ad5d  df 57 ff 6b   cmp $6bff57,x
$0d:ad61  ff 7f bf 3b   sbc $3bbf7f,x
$0d:ad65  95 4b		 sta $4b,x
$0d:ad67  33 43		 and ($43,s),y
$0d:ad69  b0 36		 bcs $ada1
$0d:ad6b  50 32		 bvc $ad9f
$0d:ad6d  10 2a		 bpl $ad99
$0d:ad6f  ae 15 b9	  ldx $b915
$0d:ad72  57 fd		 eor [$fd],y
$0d:ad74  67 bd		 adc [$bd]
$0d:ad76  56 57		 lsr $57,x
$0d:ad78  1e ba 26	  asl $26ba,x
$0d:ad7b  3d 3b bf	  and $bf3b,x
$0d:ad7e  47 ff		 eor [$ff]
$0d:ad80  6b			rtl
$0d:ad81  18			clc
$0d:ad82  3e 01 86	  rol $8601,x
$0d:ad85  ae 31 1d	  ldx $1d31
$0d:ad88  0f 01 68 ae   ora $ae6801
$0d:ad8c  31 1d		 and ($1d),y
$0d:ad8e  0a			asl a
$0d:ad8f  01 4a		 ora ($4a,x)
$0d:ad91  ae 31 1d	  ldx $1d31
$0d:ad94  09 01 2c	  ora #$2c01
$0d:ad97  ae 31 1d	  ldx $1d31
$0d:ad9a  08			php
$0d:ad9b  01 0e		 ora ($0e,x)
$0d:ad9d  ae 31 1d	  ldx $1d31
$0d:ada0  07 01		 ora [$01]
$0d:ada2  f0 ad		 beq $ad51
$0d:ada4  31 1d		 and ($1d),y
$0d:ada6  06 01		 asl $01
$0d:ada8  d2 ad		 cmp ($ad)
$0d:adaa  31 1d		 and ($1d),y
$0d:adac  05 01		 ora $01
$0d:adae  b4 ad		 ldy $ad,x
$0d:adb0  31 1d		 and ($1d),y
$0d:adb2  5f 00 25 00   eor $002500,x
$0d:adb6  48			pha
$0d:adb7  00 8a		 brk #$8a
$0d:adb9  04 ce		 tsb $ce
$0d:adbb  08			php
$0d:adbc  31 0d		 and ($0d),y
$0d:adbe  74 11		 stz $11,x
$0d:adc0  d8			cld
$0d:adc1  15 63		 ora $63,x
$0d:adc3  18			clc
$0d:adc4  c6 20		 dec $20
$0d:adc6  4a			lsr a
$0d:adc7  29 ce 31	  and #$31ce
$0d:adca  52 46		 eor ($46)
$0d:adcc  d6 56		 dec $56,x
$0d:adce  42 08		 wdm #$08
$0d:add0  bd 77 26	  lda $2677,x
$0d:add3  00 49		 brk #$49
$0d:add5  00 8b		 brk #$8b
$0d:add7  04 cf		 tsb $cf
$0d:add9  08			php
$0d:adda  32 0d		 and ($0d)
$0d:addc  75 11		 adc $11,x
$0d:adde  d9 15 68	  cmp $6815,y
$0d:ade1  18			clc
$0d:ade2  c9 20 6e	  cmp #$6e20
$0d:ade5  29 d0 31	  and #$31d0
$0d:ade8  74 46		 stz $46,x
$0d:adea  f7 56		 sbc [$56],y
$0d:adec  46 08		 lsr $08
$0d:adee  bd 77 27	  lda $2777,x
$0d:adf1  00 4a		 brk #$4a
$0d:adf3  00 8c		 brk #$8c
$0d:adf5  04 d0		 tsb $d0
$0d:adf7  08			php
$0d:adf8  33 0d		 and ($0d,s),y
$0d:adfa  96 11		 stx $11,y
$0d:adfc  fa			plx
$0d:adfd  15 6e		 ora $6e,x
$0d:adff  14 ee		 trb $ee
$0d:ae01  20 92 29	  jsr $2992
$0d:ae04  f3 31		 sbc ($31,s),y
$0d:ae06  96 42		 stx $42,y
$0d:ae08  19 57 49	  ora $4957,y
$0d:ae0b  08			php
$0d:ae0c  de 7b 28	  dec $287b,x
$0d:ae0f  00 4b		 brk #$4b
$0d:ae11  00 8e		 brk #$8e
$0d:ae13  04 f3		 tsb $f3
$0d:ae15  08			php
$0d:ae16  54 0d 97	  mvn $97,$0d
$0d:ae19  11 1b		 ora ($1b),y
$0d:ae1b  16 93		 asl $93,x
$0d:ae1d  14 11		 trb $11
$0d:ae1f  21 93		 and ($93,x)
$0d:ae21  29 17 32	  and #$3217
$0d:ae24  98			tya
$0d:ae25  42 3a		 wdm #$3a
$0d:ae27  57 4e		 eor [$4e],y
$0d:ae29  08			php
$0d:ae2a  ff 7f 29 00   sbc $00297f,x
$0d:ae2e  4c 00 8f	  jmp $8f00
$0d:ae31  04 f4		 tsb $f4
$0d:ae33  04 55		 tsb $55
$0d:ae35  0d b8 0d	  ora $0db8
$0d:ae38  1c 16 95	  trb $9516
$0d:ae3b  10 13		 bpl $ae50
$0d:ae3d  1d b8 29	  ora $29b8,x
$0d:ae40  38			sec
$0d:ae41  32 da		 and ($da)
$0d:ae43  3e 5c 53	  rol $535c,x
$0d:ae46  4f 08 de 7b   eor $7bde08
$0d:ae4a  2a			rol a
$0d:ae4b  00 4d		 brk #$4d
$0d:ae4d  00 91		 brk #$91
$0d:ae4f  04 14		 tsb $14
$0d:ae51  05 77		 ora $77
$0d:ae53  09 b9 0d	  ora #$0db9
$0d:ae56  3c 16 99	  bit $9916,x
$0d:ae59  10 38		 bpl $ae93
$0d:ae5b  1d da 29	  ora $29da,x
$0d:ae5e  39 32 dc	  and $dc32,y
$0d:ae61  3a			dec a
$0d:ae62  7c 53 52	  jmp ($5253,x)
$0d:ae65  08			php
$0d:ae66  bd 77 2b	  lda $2b77,x
$0d:ae69  00 4e		 brk #$4e
$0d:ae6b  00 93		 brk #$93
$0d:ae6d  04 16		 tsb $16
$0d:ae6f  05 78		 ora $78
$0d:ae71  09 da 0d	  ora #$0dda
$0d:ae74  3d 16 9d	  and $9d16,x
$0d:ae77  10 5d		 bpl $aed6
$0d:ae79  1d dc 29	  ora $29dc,x
$0d:ae7c  5c 32 fe 3a   jml $3afe32
$0d:ae80  9e 53 55	  stz $5553,x
$0d:ae83  08			php
$0d:ae84  bd 77 2c	  lda $2c77,x
$0d:ae87  00 50		 brk #$50
$0d:ae89  00 94		 brk #$94
$0d:ae8b  04 18		 tsb $18
$0d:ae8d  05 7a		 ora $7a
$0d:ae8f  09 dc 0d	  ora #$0ddc
$0d:ae92  3e 12 bf	  rol $bf12,x
$0d:ae95  0c 7f 19	  tsb $197f
$0d:ae98  ff 25 7f 2e   sbc $2e7f25,x
$0d:ae9c  1f 37 bf 4f   ora $4fbf37,x
$0d:aea0  59 08 bd	  eor $bd08,y
$0d:aea3  77 01		 adc [$01],y
$0d:aea5  5f af 91 1d   eor $1d91af,x
$0d:aea9  05 01		 ora $01
$0d:aeab  41 af		 eor ($af,x)
$0d:aead  91 1d		 sta ($1d),y
$0d:aeaf  04 01		 tsb $01
$0d:aeb1  23 af		 and $af,s
$0d:aeb3  91 1d		 sta ($1d),y
$0d:aeb5  04 01		 tsb $01
$0d:aeb7  05 af		 ora $af
$0d:aeb9  91 1d		 sta ($1d),y
$0d:aebb  04 01		 tsb $01
$0d:aebd  e7 ae		 sbc [$ae]
$0d:aebf  91 1d		 sta ($1d),y
$0d:aec1  04 01		 tsb $01
$0d:aec3  b9 af 91	  lda $91af,y
$0d:aec6  1d 03 01	  ora $0103,x
$0d:aec9  9b			txy
$0d:aeca  af 91 1d 02   lda $021d91
$0d:aece  01 7d		 ora ($7d,x)
$0d:aed0  af 91 1d 01   lda $011d91
$0d:aed4  01 9b		 ora ($9b,x)
$0d:aed6  af 91 1d 02   lda $021d91
$0d:aeda  01 b9		 ora ($b9,x)
$0d:aedc  af 91 1d 03   lda $031d91
$0d:aee0  01 e7		 ora ($e7,x)
$0d:aee2  ae 91 1d	  ldx $1d91
$0d:aee5  04 00		 tsb $00
$0d:aee7  d1 7d		 cmp ($7d),y
$0d:aee9  0f 71 69 4c   ora $4c6971
$0d:aeed  05 30		 ora $30
$0d:aeef  02 18		 cop #$18
$0d:aef1  00 00		 brk #$00
$0d:aef3  b7 7e		 lda [$7e],y
$0d:aef5  9c 7f 99	  stz $997f
$0d:aef8  44 ab 00	  mvp $00,$ab
$0d:aefb  33 01		 and ($01,s),y
$0d:aefd  3b			tsc
$0d:aefe  02 3f		 cop #$3f
$0d:af00  03 ff		 ora $ff,s
$0d:af02  53 0b		 eor ($0b,s),y
$0d:af04  34 d0		 bit $d0,x
$0d:af06  6d 0e 61	  adc $610e
$0d:af09  89 40 45	  bit #$4540
$0d:af0c  28			plp
$0d:af0d  02 18		 cop #$18
$0d:af0f  00 00		 brk #$00
$0d:af11  b6 72		 ldx $72,y
$0d:af13  9c 7b 18	  stz $187b
$0d:af16  45 a9		 eor $a9
$0d:af18  04 30		 tsb $30
$0d:af1a  0d 38 12	  ora $1238
$0d:af1d  3c 27 ff	  bit $ff27,x
$0d:af20  5b			tcd
$0d:af21  aa			tax
$0d:af22  2c cf 59	  bit $59cf
$0d:af25  2c 41 a8	  bit $a841
$0d:af28  30 65		 bmi $af8f
$0d:af2a  20 22 14	  jsr $1422
$0d:af2d  00 00		 brk #$00
$0d:af2f  95 62		 sta $62,x
$0d:af31  9c 77 b6	  stz $b677
$0d:af34  49 a8 08	  eor #$08a8
$0d:af37  2d 15 14	  and $1415
$0d:af3a  26 1b		 rol $1b
$0d:af3c  37 ff		 and [$ff],y
$0d:af3e  67 ca		 adc [$ca]
$0d:af40  2c ce 45	  bit $45ce
$0d:af43  2b			pld
$0d:af44  31 c8		 and ($c8),y
$0d:af46  24 85		 bit $85
$0d:af48  18			clc
$0d:af49  42 10		 wdm #$10
$0d:af4b  00 00		 brk #$00
$0d:af4d  94 56		 sty $56,x
$0d:af4f  9c 73 15	  stz $1573
$0d:af52  4a			lsr a
$0d:af53  a6 10		 ldx $10
$0d:af55  2b			pld
$0d:af56  1d 11 36	  ora $3611,x
$0d:af59  19 4f ff	  ora $ff4f,y
$0d:af5c  73 ea		 adc ($ea,s),y
$0d:af5e  28			plp
$0d:af5f  ad 35 4a	  lda $4a35
$0d:af62  29 e7 1c	  and #$1ce7
$0d:af65  a5 14		 lda $14
$0d:af67  63 0c		 adc $0c,s
$0d:af69  00 00		 brk #$00
$0d:af6b  73 4e		 adc ($4e,s),y
$0d:af6d  7b			tdc
$0d:af6e  6f 73 4e a5   adc $a54e73
$0d:af72  14 29		 trb $29
$0d:af74  25 ef		 and $ef
$0d:af76  3d f7 5e	  and $5ef7,x
$0d:af79  ff 7f 29 25   sbc $25297f,x
$0d:af7d  ff 7f ff 7f   sbc $7fff7f,x
$0d:af81  ff 7f ff 7f   sbc $7fff7f,x
$0d:af85  ff 7f ff 7f   sbc $7fff7f,x
$0d:af89  ff 7f ff 7f   sbc $7fff7f,x
$0d:af8d  ff 7f ff 7f   sbc $7fff7f,x
$0d:af91  ff 7f ff 7f   sbc $7fff7f,x
$0d:af95  ff 7f ff 7f   sbc $7fff7f,x
$0d:af99  ff 7f ff 6b   sbc $6bff7f,x
$0d:af9d  df 5f df 53   cmp $53df5f,x
$0d:afa1  bf 4b bf 3f   lda $3fbf4b,x
$0d:afa5  9f 33 ff 73   sta $73ff33,x
$0d:afa9  ff 7f df 5f   sbc $5fdf7f,x
$0d:afad  9f 33 bf 43   sta $43bf33,x
$0d:afb1  df 57 ff 6b   cmp $6bff57,x
$0d:afb5  ff 7f bf 3b   sbc $3bbf7f,x
$0d:afb9  f8			sed
$0d:afba  76 77		 ror $77,x
$0d:afbc  6a			ror a
$0d:afbd  76 4e		 ror $4e,x
$0d:afbf  f2 3d		 sbc ($3d)
$0d:afc1  8e 31 2c	  stx $2c31
$0d:afc4  1d 5b 7b	  ora $7b5b,x
$0d:afc7  de 7f bd	  dec $bd7f,x
$0d:afca  56 57		 lsr $57,x
$0d:afcc  1e ba 26	  asl $26ba,x
$0d:afcf  3d 3b bf	  and $bf3b,x
$0d:afd2  47 ff		 eor [$ff]
$0d:afd4  6b			rtl
$0d:afd5  18			clc
$0d:afd6  3e 01 08	  rol $0801,x
$0d:afd9  b0 31		 bcs $b00c
$0d:afdb  17 01		 ora [$01],y
$0d:afdd  01 20		 ora ($20,x)
$0d:afdf  b0 31		 bcs $b012
$0d:afe1  17 01		 ora [$01],y
$0d:afe3  01 38		 ora ($38,x)
$0d:afe5  b0 31		 bcs $b018
$0d:afe7  17 01		 ora [$01],y
$0d:afe9  01 50		 ora ($50,x)
$0d:afeb  b0 31		 bcs $b01e
$0d:afed  17 01		 ora [$01],y
$0d:afef  01 68		 ora ($68,x)
$0d:aff1  b0 31		 bcs $b024
$0d:aff3  17 01		 ora [$01],y
$0d:aff5  01 80		 ora ($80,x)
$0d:aff7  b0 31		 bcs $b02a
$0d:aff9  17 01		 ora [$01],y
$0d:affb  01 98		 ora ($98,x)
$0d:affd  b0 31		 bcs $b030
$0d:afff  17 01		 ora [$01],y
$0d:b001  01 b0		 ora ($b0,x)
$0d:b003  b0 31		 bcs $b036
$0d:b005  17 01		 ora [$01],y
$0d:b007  00 42		 brk #$42
$0d:b009  14 83		 trb $83
$0d:b00b  28			plp
$0d:b00c  06 39		 asl $39
$0d:b00e  89 49 4d	  bit #$4d49
$0d:b011  5e 69 49	  lsr $4969,x
$0d:b014  e6 34		 inc $34
$0d:b016  83 28		 sta $28,s
$0d:b018  4a			lsr a
$0d:b019  41 ce		 eor ($ce,x)
$0d:b01b  4d 52 5e	  eor $5e52
$0d:b01e  ef 51 83 28   sbc $288351
$0d:b022  42 14		 wdm #$14
$0d:b024  83 28		 sta $28,s
$0d:b026  06 39		 asl $39
$0d:b028  89 49 4d	  bit #$4d49
$0d:b02b  5e 69 49	  lsr $4969,x
$0d:b02e  e6 34		 inc $34
$0d:b030  ef 51 4a 41   sbc $414a51
$0d:b034  ce 4d 52	  dec $524d
$0d:b037  5e e6 34	  lsr $34e6,x
$0d:b03a  83 28		 sta $28,s
$0d:b03c  42 14		 wdm #$14
$0d:b03e  83 28		 sta $28,s
$0d:b040  06 39		 asl $39
$0d:b042  89 49 4d	  bit #$4d49
$0d:b045  5e 69 49	  lsr $4969,x
$0d:b048  52 5e		 eor ($5e)
$0d:b04a  ef 51 4a 41   sbc $414a51
$0d:b04e  ce 4d 69	  dec $694d
$0d:b051  49 e6 34	  eor #$34e6
$0d:b054  83 28		 sta $28,s
$0d:b056  42 14		 wdm #$14
$0d:b058  83 28		 sta $28,s
$0d:b05a  06 39		 asl $39
$0d:b05c  89 49 4d	  bit #$4d49
$0d:b05f  5e ce 4d	  lsr $4dce,x
$0d:b062  52 5e		 eor ($5e)
$0d:b064  ef 51 4a 41   sbc $414a51
$0d:b068  4d 5e 69	  eor $695e
$0d:b06b  49 e6 34	  eor #$34e6
$0d:b06e  83 28		 sta $28,s
$0d:b070  42 14		 wdm #$14
$0d:b072  83 28		 sta $28,s
$0d:b074  06 39		 asl $39
$0d:b076  89 49 4a	  bit #$4a49
$0d:b079  41 ce		 eor ($ce,x)
$0d:b07b  4d 52 5e	  eor $5e52
$0d:b07e  ef 51 89 49   sbc $498951
$0d:b082  4d 5e 69	  eor $695e
$0d:b085  49 e6 34	  eor #$34e6
$0d:b088  83 28		 sta $28,s
$0d:b08a  42 14		 wdm #$14
$0d:b08c  83 28		 sta $28,s
$0d:b08e  06 39		 asl $39
$0d:b090  ef 51 4a 41   sbc $414a51
$0d:b094  ce 4d 52	  dec $524d
$0d:b097  5e 06 39	  lsr $3906,x
$0d:b09a  89 49 4d	  bit #$4d49
$0d:b09d  5e 69 49	  lsr $4969,x
$0d:b0a0  e6 34		 inc $34
$0d:b0a2  83 28		 sta $28,s
$0d:b0a4  42 14		 wdm #$14
$0d:b0a6  83 28		 sta $28,s
$0d:b0a8  52 5e		 eor ($5e)
$0d:b0aa  ef 51 4a 41   sbc $414a51
$0d:b0ae  ce 4d 83	  dec $834d
$0d:b0b1  28			plp
$0d:b0b2  06 39		 asl $39
$0d:b0b4  89 49 4d	  bit #$4d49
$0d:b0b7  5e 69 49	  lsr $4969,x
$0d:b0ba  e6 34		 inc $34
$0d:b0bc  83 28		 sta $28,s
$0d:b0be  42 14		 wdm #$14
$0d:b0c0  ce 4d 52	  dec $524d
$0d:b0c3  5e ef 51	  lsr $51ef,x
$0d:b0c6  4a			lsr a
$0d:b0c7  41 01		 eor ($01,x)
$0d:b0c9  f3 b0		 sbc ($b0,s),y
$0d:b0cb  71 0d		 adc ($0d),y
$0d:b0cd  00 01		 brk #$01
$0d:b0cf  01 b1		 ora ($b1,x)
$0d:b0d1  71 0d		 adc ($0d),y
$0d:b0d3  00 01		 brk #$01
$0d:b0d5  0f b1 71 0d   ora $0d71b1
$0d:b0d9  00 01		 brk #$01
$0d:b0db  1d b1 71	  ora $71b1,x
$0d:b0de  0d 01 01	  ora $0101
$0d:b0e1  2b			pld
$0d:b0e2  b1 71		 lda ($71),y
$0d:b0e4  0d 00 01	  ora $0100
$0d:b0e7  39 b1 71	  and $71b1,y
$0d:b0ea  0d 00 01	  ora $0100
$0d:b0ed  47 b1		 eor [$b1]
$0d:b0ef  71 0d		 adc ($0d),y
$0d:b0f1  00 00		 brk #$00
$0d:b0f3  58			cli
$0d:b0f4  0a			asl a
$0d:b0f5  9b			txy
$0d:b0f6  12 dc		 ora ($dc)
$0d:b0f8  1a			inc a
$0d:b0f9  1c 2b 5c	  trb $5c2b
$0d:b0fc  43 9e		 eor $9e,s
$0d:b0fe  5b			tcd
$0d:b0ff  d7 1d		 cmp [$1d],y
$0d:b101  9e 5b 58	  stz $585b,x
$0d:b104  0a			asl a
$0d:b105  9b			txy
$0d:b106  12 dc		 ora ($dc)
$0d:b108  1a			inc a
$0d:b109  1c 2b 5c	  trb $5c2b
$0d:b10c  43 ce		 eor $ce,s
$0d:b10e  14 5c		 trb $5c
$0d:b110  43 9e		 eor $9e,s
$0d:b112  5b			tcd
$0d:b113  58			cli
$0d:b114  0a			asl a
$0d:b115  9b			txy
$0d:b116  12 dc		 ora ($dc)
$0d:b118  1a			inc a
$0d:b119  1c 2b 1b	  trb $1b2b
$0d:b11c  36 1c		 rol $1c,x
$0d:b11e  2b			pld
$0d:b11f  5c 43 9e 5b   jml $5b9e43
$0d:b123  58			cli
$0d:b124  0a			asl a
$0d:b125  9b			txy
$0d:b126  12 dc		 ora ($dc)
$0d:b128  1a			inc a
$0d:b129  97 31		 sta [$31],y
$0d:b12b  dc 1a 1c	  jml [$1c1a]
$0d:b12e  2b			pld
$0d:b12f  5c 43 9e 5b   jml $5b9e43
$0d:b133  58			cli
$0d:b134  0a			asl a
$0d:b135  9b			txy
$0d:b136  12 5c		 ora ($5c)
$0d:b138  3e 9b 12	  rol $129b,x
$0d:b13b  dc 1a 1c	  jml [$1c1a]
$0d:b13e  2b			pld
$0d:b13f  5c 43 9e 5b   jml $5b9e43
$0d:b143  58			cli
$0d:b144  0a			asl a
$0d:b145  32 25		 and ($25)
$0d:b147  58			cli
$0d:b148  0a			asl a
$0d:b149  9b			txy
$0d:b14a  12 dc		 ora ($dc)
$0d:b14c  1a			inc a
$0d:b14d  1c 2b 5c	  trb $5c2b
$0d:b150  43 9e		 eor $9e,s
$0d:b152  5b			tcd
$0d:b153  3c 36 01	  bit $0136,x
$0d:b156  7a			ply
$0d:b157  b1 27		 lda ($27),y
$0d:b159  0b			phd
$0d:b15a  01 01		 ora ($01,x)
$0d:b15c  86 b1		 stx $b1
$0d:b15e  27 0b		 and [$0b]
$0d:b160  01 01		 ora ($01,x)
$0d:b162  92 b1		 sta ($b1)
$0d:b164  27 0b		 and [$0b]
$0d:b166  01 01		 ora ($01,x)
$0d:b168  9e b1 27	  stz $27b1,x
$0d:b16b  0b			phd
$0d:b16c  01 01		 ora ($01,x)
$0d:b16e  aa			tax
$0d:b16f  b1 27		 lda ($27),y
$0d:b171  0b			phd
$0d:b172  01 01		 ora ($01,x)
$0d:b174  b6 b1		 ldx $b1,y
$0d:b176  27 0b		 and [$0b]
$0d:b178  01 00		 ora ($00,x)
$0d:b17a  45 31		 eor $31
$0d:b17c  66 35		 ror $35
$0d:b17e  aa			tax
$0d:b17f  3d 0b 46	  and $460b,x
$0d:b182  aa			tax
$0d:b183  3d 66 35	  and $3566,x
$0d:b186  66 35		 ror $35
$0d:b188  45 31		 eor $31
$0d:b18a  66 35		 ror $35
$0d:b18c  aa			tax
$0d:b18d  3d 0b 46	  and $460b,x
$0d:b190  aa			tax
$0d:b191  3d aa 3d	  and $3daa,x
$0d:b194  66 35		 ror $35
$0d:b196  45 31		 eor $31
$0d:b198  66 35		 ror $35
$0d:b19a  aa			tax
$0d:b19b  3d 0b 46	  and $460b,x
$0d:b19e  0b			phd
$0d:b19f  46 aa		 lsr $aa
$0d:b1a1  3d 66 35	  and $3566,x
$0d:b1a4  45 31		 eor $31
$0d:b1a6  66 35		 ror $35
$0d:b1a8  aa			tax
$0d:b1a9  3d aa 3d	  and $3daa,x
$0d:b1ac  0b			phd
$0d:b1ad  46 aa		 lsr $aa
$0d:b1af  3d 66 35	  and $3566,x
$0d:b1b2  45 31		 eor $31
$0d:b1b4  66 35		 ror $35
$0d:b1b6  66 35		 ror $35
$0d:b1b8  aa			tax
$0d:b1b9  3d 0b 46	  and $460b,x
$0d:b1bc  aa			tax
$0d:b1bd  3d 66 35	  and $3566,x
$0d:b1c0  45 31		 eor $31
$0d:b1c2  01 e7		 ora ($e7,x)
$0d:b1c4  b1 b4		 lda ($b4),y
$0d:b1c6  17 00		 ora [$00],y
$0d:b1c8  01 ff		 ora ($ff,x)
$0d:b1ca  b1 b4		 lda ($b4),y
$0d:b1cc  17 01		 ora [$01],y
$0d:b1ce  01 17		 ora ($17,x)
$0d:b1d0  b2 b4		 lda ($b4)
$0d:b1d2  17 00		 ora [$00],y
$0d:b1d4  01 2f		 ora ($2f,x)
$0d:b1d6  b2 b4		 lda ($b4)
$0d:b1d8  17 01		 ora [$01],y
$0d:b1da  01 47		 ora ($47,x)
$0d:b1dc  b2 b4		 lda ($b4)
$0d:b1de  17 00		 ora [$00],y
$0d:b1e0  01 5f		 ora ($5f,x)
$0d:b1e2  b2 b4		 lda ($b4)
$0d:b1e4  17 01		 ora [$01],y
$0d:b1e6  00 48		 brk #$48
$0d:b1e8  34 2f		 bit $2f,x
$0d:b1ea  75 49		 adc $49,x
$0d:b1ec  7e 2c 7f	  ror $7f2c,x
$0d:b1ef  98			tya
$0d:b1f0  7b			tdc
$0d:b1f1  ff 7f 26 24   sbc $24267f,x
$0d:b1f5  86 30		 stx $30
$0d:b1f7  a8			tay
$0d:b1f8  54 2b 7d	  mvn $7d,$2b
$0d:b1fb  49 7e 2c	  eor #$2c7e
$0d:b1fe  7f ff 7f 48   adc $487fff,x
$0d:b202  34 2f		 bit $2f,x
$0d:b204  75 49		 adc $49,x
$0d:b206  7e 2c 7f	  ror $7f2c,x
$0d:b209  98			tya
$0d:b20a  7b			tdc
$0d:b20b  2c 7f 26	  bit $267f
$0d:b20e  24 86		 bit $86
$0d:b210  30 a8		 bmi $b1ba
$0d:b212  54 2b 7d	  mvn $7d,$2b
$0d:b215  49 7e 98	  eor #$987e
$0d:b218  7b			tdc
$0d:b219  ff 7f 48 34   sbc $34487f,x
$0d:b21d  2f 75 49 7e   and $7e4975
$0d:b221  2c 7f 49	  bit $497f
$0d:b224  7e 2c 7f	  ror $7f2c,x
$0d:b227  26 24		 rol $24
$0d:b229  86 30		 stx $30
$0d:b22b  a8			tay
$0d:b22c  54 2b 7d	  mvn $7d,$2b
$0d:b22f  2c 7f 98	  bit $987f
$0d:b232  7b			tdc
$0d:b233  ff 7f 48 34   sbc $34487f,x
$0d:b237  2f 75 49 7e   and $7e4975
$0d:b23b  2b			pld
$0d:b23c  7d 49 7e	  adc $7e49,x
$0d:b23f  2c 7f 26	  bit $267f
$0d:b242  24 86		 bit $86
$0d:b244  30 a8		 bmi $b1ee
$0d:b246  54 49 7e	  mvn $7e,$49
$0d:b249  2c 7f 98	  bit $987f
$0d:b24c  7b			tdc
$0d:b24d  ff 7f 48 34   sbc $34487f,x
$0d:b251  2f 75 a8 54   and $54a875
$0d:b255  2b			pld
$0d:b256  7d 49 7e	  adc $7e49,x
$0d:b259  2c 7f 26	  bit $267f
$0d:b25c  24 86		 bit $86
$0d:b25e  30 2f		 bmi $b28f
$0d:b260  75 49		 adc $49,x
$0d:b262  7e 2c 7f	  ror $7f2c,x
$0d:b265  98			tya
$0d:b266  7b			tdc
$0d:b267  ff 7f 48 34   sbc $34487f,x
$0d:b26b  86 30		 stx $30
$0d:b26d  a8			tay
$0d:b26e  54 2b 7d	  mvn $7d,$2b
$0d:b271  49 7e 2c	  eor #$2c7e
$0d:b274  7f 26 24 01   adc $012426,x
$0d:b278  90 b2		 bcc $b22c
$0d:b27a  71 07		 adc ($07),y
$0d:b27c  08			php
$0d:b27d  01 98		 ora ($98,x)
$0d:b27f  b2 71		 lda ($71)
$0d:b281  07 07		 ora [$07]
$0d:b283  01 a0		 ora ($a0,x)
$0d:b285  b2 71		 lda ($71)
$0d:b287  07 06		 ora [$06]
$0d:b289  01 a8		 ora ($a8,x)
$0d:b28b  b2 71		 lda ($71)
$0d:b28d  07 07		 ora [$07]
$0d:b28f  00 d8		 brk #$d8
$0d:b291  00 19		 brk #$19
$0d:b293  01 5a		 ora ($5a,x)
$0d:b295  01 bc		 ora ($bc,x)
$0d:b297  01 bc		 ora ($bc,x)
$0d:b299  01 d8		 ora ($d8,x)
$0d:b29b  00 19		 brk #$19
$0d:b29d  01 5a		 ora ($5a,x)
$0d:b29f  01 5a		 ora ($5a,x)
$0d:b2a1  01 bc		 ora ($bc,x)
$0d:b2a3  01 d8		 ora ($d8,x)
$0d:b2a5  00 19		 brk #$19
$0d:b2a7  01 19		 ora ($19,x)
$0d:b2a9  01 5a		 ora ($5a,x)
$0d:b2ab  01 bc		 ora ($bc,x)
$0d:b2ad  01 d8		 ora ($d8,x)
$0d:b2af  00 01		 brk #$01
$0d:b2b1  1d b3 58	  ora $58b3,x
$0d:b2b4  09 0d 01	  ora #$010d
$0d:b2b7  27 b3		 and [$b3]
$0d:b2b9  58			cli
$0d:b2ba  09 0d 01	  ora #$010d
$0d:b2bd  31 b3		 and ($b3),y
$0d:b2bf  58			cli
$0d:b2c0  09 0d 01	  ora #$010d
$0d:b2c3  3b			tsc
$0d:b2c4  b3 58		 lda ($58,s),y
$0d:b2c6  09 0d 01	  ora #$010d
$0d:b2c9  31 b3		 and ($b3),y
$0d:b2cb  58			cli
$0d:b2cc  09 0d 01	  ora #$010d
$0d:b2cf  27 b3		 and [$b3]
$0d:b2d1  58			cli
$0d:b2d2  09 0d 01	  ora #$010d
$0d:b2d5  31 b3		 and ($b3),y
$0d:b2d7  58			cli
$0d:b2d8  09 0d 01	  ora #$010d
$0d:b2db  3b			tsc
$0d:b2dc  b3 58		 lda ($58,s),y
$0d:b2de  09 0d 01	  ora #$010d
$0d:b2e1  45 b3		 eor $b3
$0d:b2e3  58			cli
$0d:b2e4  09 0d 01	  ora #$010d
$0d:b2e7  4f b3 58 09   eor $0958b3
$0d:b2eb  0d 01 59	  ora $5901
$0d:b2ee  b3 58		 lda ($58,s),y
$0d:b2f0  09 0d 01	  ora #$010d
$0d:b2f3  4f b3 58 09   eor $0958b3
$0d:b2f7  0d 01 45	  ora $4501
$0d:b2fa  b3 58		 lda ($58,s),y
$0d:b2fc  09 0d 01	  ora #$010d
$0d:b2ff  3b			tsc
$0d:b300  b3 58		 lda ($58,s),y
$0d:b302  09 0d 01	  ora #$010d
$0d:b305  45 b3		 eor $b3
$0d:b307  58			cli
$0d:b308  09 0b 01	  ora #$010b
$0d:b30b  4f b3 58 09   eor $0958b3
$0d:b30f  07 01		 ora [$01]
$0d:b311  59 b3 58	  eor $58b3,y
$0d:b314  09 04 01	  ora #$0104
$0d:b317  63 b3		 adc $b3,s
$0d:b319  58			cli
$0d:b31a  09 5d 00	  ora #$005d
$0d:b31d  41 0c		 eor ($0c,x)
$0d:b31f  41 0c		 eor ($0c,x)
$0d:b321  41 0c		 eor ($0c,x)
$0d:b323  41 0c		 eor ($0c,x)
$0d:b325  41 0c		 eor ($0c,x)
$0d:b327  41 0c		 eor ($0c,x)
$0d:b329  03 00		 ora $00,s
$0d:b32b  42 08		 wdm #$08
$0d:b32d  44 0c 46	  mvp $46,$0c
$0d:b330  0c 41 0c	  tsb $0c41
$0d:b333  05 00		 ora $00
$0d:b335  44 04 47	  mvp $47,$04
$0d:b338  0c 4a 0c	  tsb $0c4a
$0d:b33b  41 0c		 eor ($0c,x)
$0d:b33d  06 00		 asl $00
$0d:b33f  67 00		 adc [$00]
$0d:b341  6a			ror a
$0d:b342  10 8d		 bpl $b2d1
$0d:b344  0c 41 0c	  tsb $0c41
$0d:b347  08			php
$0d:b348  00 89		 brk #$89
$0d:b34a  00 ab		 brk #$ab
$0d:b34c  18			clc
$0d:b34d  b0 0c		 bcs $b35b
$0d:b34f  41 0c		 eor ($0c,x)
$0d:b351  09 00 8b	  ora #$8b00
$0d:b354  00 cd		 brk #$cd
$0d:b356  1c f2 10	  trb $10f2
$0d:b359  41 0c		 eor ($0c,x)
$0d:b35b  0a			asl a
$0d:b35c  00 8d		 brk #$8d
$0d:b35e  00 d0		 brk #$d0
$0d:b360  20 14 11	  jsr $1114
$0d:b363  41 0c		 eor ($0c,x)
$0d:b365  0b			phd
$0d:b366  00 8f		 brk #$8f
$0d:b368  00 d3		 brk #$d3
$0d:b36a  20 37 11	  jsr $1137
$0d:b36d  04 86		 tsb $86
$0d:b36f  b3 00		 lda ($00,s),y
$0d:b371  02 04		 cop #$04
$0d:b373  06 92		 asl $92
$0d:b375  b3 00		 lda ($00,s),y
$0d:b377  02 03		 cop #$03
$0d:b379  05 a4		 ora $a4
$0d:b37b  b3 00		 lda ($00,s),y
$0d:b37d  02 02		 cop #$02
$0d:b37f  01 b3		 ora ($b3,x)
$0d:b381  b3 00		 lda ($00,s),y
$0d:b383  02 0e		 cop #$0e
$0d:b385  00 21		 brk #$21
$0d:b387  40			rti
$0d:b388  81 21		 sta ($21,x)
$0d:b38a  41 81		 eor ($81,x)
$0d:b38c  22 41 82 22   jsl $228241
$0d:b390  42 82		 wdm #$82
$0d:b392  23 42		 and $42,s
$0d:b394  83 23		 sta $23,s
$0d:b396  43 83		 eor $83,s
$0d:b398  24 43		 bit $43
$0d:b39a  84 24		 sty $24
$0d:b39c  44 84 25	  mvp $25,$84
$0d:b39f  44 85 25	  mvp $25,$85
$0d:b3a2  45 85		 eor $85
$0d:b3a4  26 45		 rol $45
$0d:b3a6  86 26		 stx $26
$0d:b3a8  46 86		 lsr $86
$0d:b3aa  27 46		 and [$46]
$0d:b3ac  87 27		 sta [$27]
$0d:b3ae  47 87		 eor [$87]
$0d:b3b0  28			plp
$0d:b3b1  47 88		 eor [$88]
$0d:b3b3  28			plp
$0d:b3b4  48			pha
$0d:b3b5  88			dey
$0d:b3b6  04 cf		 tsb $cf
$0d:b3b8  b3 00		 lda ($00,s),y
$0d:b3ba  02 04		 cop #$04
$0d:b3bc  06 db		 asl $db
$0d:b3be  b3 00		 lda ($00,s),y
$0d:b3c0  02 03		 cop #$03
$0d:b3c2  05 ed		 ora $ed
$0d:b3c4  b3 00		 lda ($00,s),y
$0d:b3c6  02 02		 cop #$02
$0d:b3c8  01 fc		 ora ($fc,x)
$0d:b3ca  b3 00		 lda ($00,s),y
$0d:b3cc  02 0e		 cop #$0e
$0d:b3ce  00 28		 brk #$28
$0d:b3d0  47 88		 eor [$88]
$0d:b3d2  27 47		 and [$47]
$0d:b3d4  87 27		 sta [$27]
$0d:b3d6  46 87		 lsr $87
$0d:b3d8  26 46		 rol $46
$0d:b3da  86 26		 stx $26
$0d:b3dc  45 86		 eor $86
$0d:b3de  25 45		 and $45
$0d:b3e0  85 25		 sta $25
$0d:b3e2  44 85 24	  mvp $24,$85
$0d:b3e5  44 84 24	  mvp $24,$84
$0d:b3e8  43 84		 eor $84,s
$0d:b3ea  23 43		 and $43,s
$0d:b3ec  83 23		 sta $23,s
$0d:b3ee  42 83		 wdm #$83
$0d:b3f0  22 42 82 22   jsl $228242
$0d:b3f4  41 82		 eor ($82,x)
$0d:b3f6  21 41		 and ($41,x)
$0d:b3f8  81 21		 sta ($21,x)
$0d:b3fa  40			rti
$0d:b3fb  81 20		 sta ($20,x)
$0d:b3fd  40			rti
$0d:b3fe  80 01		 bra $b401
$0d:b400  30 b4		 bmi $b3b6
$0d:b402  31 11		 and ($11),y
$0d:b404  2f 01 42 b4   and $b44201
$0d:b408  31 11		 and ($11),y
$0d:b40a  03 01		 ora $01,s
$0d:b40c  54 b4 31	  mvn $31,$b4
$0d:b40f  11 03		 ora ($03),y
$0d:b411  01 66		 ora ($66,x)
$0d:b413  b4 31		 ldy $31,x
$0d:b415  11 02		 ora ($02),y
$0d:b417  01 78		 ora ($78,x)
$0d:b419  b4 31		 ldy $31,x
$0d:b41b  11 02		 ora ($02),y
$0d:b41d  01 8a		 ora ($8a,x)
$0d:b41f  b4 31		 ldy $31,x
$0d:b421  11 03		 ora ($03),y
$0d:b423  01 9c		 ora ($9c,x)
$0d:b425  b4 31		 ldy $31,x
$0d:b427  11 03		 ora ($03),y
$0d:b429  01 ae		 ora ($ae,x)
$0d:b42b  b4 31		 ldy $31,x
$0d:b42d  11 03		 ora ($03),y
$0d:b42f  00 42		 brk #$42
$0d:b431  08			php
$0d:b432  c3 18		 cmp $18,s
$0d:b434  66 2d		 ror $2d
$0d:b436  2a			rol a
$0d:b437  46 cc		 lsr $cc
$0d:b439  5a			phy
$0d:b43a  99 73 cc	  sta $cc73,y
$0d:b43d  5a			phy
$0d:b43e  2a			rol a
$0d:b43f  46 66		 lsr $66
$0d:b441  2d 42 08	  and $0842
$0d:b444  e3 1c		 sbc $1c,s
$0d:b446  cc 39 4a	  cpy $4a39
$0d:b449  4a			lsr a
$0d:b44a  cc 5a 99	  cpy $995a
$0d:b44d  73 cc		 adc ($cc,s),y
$0d:b44f  5a			phy
$0d:b450  2a			rol a
$0d:b451  46 66		 lsr $66
$0d:b453  2d 44 08	  and $0844
$0d:b456  c3 18		 cmp $18,s
$0d:b458  86 31		 stx $31
$0d:b45a  91 52		 sta ($52),y
$0d:b45c  ec 5e 99	  cpx $995e
$0d:b45f  73 cc		 adc ($cc,s),y
$0d:b461  5a			phy
$0d:b462  2a			rol a
$0d:b463  46 66		 lsr $66
$0d:b465  2d 46 08	  and $0846
$0d:b468  c3 18		 cmp $18,s
$0d:b46a  66 2d		 ror $2d
$0d:b46c  4a			lsr a
$0d:b46d  4a			lsr a
$0d:b46e  56 6b		 lsr $6b,x
$0d:b470  b9 77 cc	  lda $cc77,y
$0d:b473  5a			phy
$0d:b474  2a			rol a
$0d:b475  46 66		 lsr $66
$0d:b477  2d 4a 08	  and $084a
$0d:b47a  c3 18		 cmp $18,s
$0d:b47c  66 2d		 ror $2d
$0d:b47e  2a			rol a
$0d:b47f  46 ec		 lsr $ec
$0d:b481  5e ff 7f	  lsr $7fff,x
$0d:b484  ec 5e 2a	  cpx $2a5e
$0d:b487  46 66		 lsr $66
$0d:b489  2d 47 08	  and $0847
$0d:b48c  c3 18		 cmp $18,s
$0d:b48e  66 2d		 ror $2d
$0d:b490  2a			rol a
$0d:b491  46 cc		 lsr $cc
$0d:b493  5a			phy
$0d:b494  b9 77 56	  lda $5677,y
$0d:b497  6b			rtl
$0d:b498  4a			lsr a
$0d:b499  4a			lsr a
$0d:b49a  66 2d		 ror $2d
$0d:b49c  45 08		 eor $08
$0d:b49e  c3 18		 cmp $18,s
$0d:b4a0  66 2d		 ror $2d
$0d:b4a2  2a			rol a
$0d:b4a3  46 cc		 lsr $cc
$0d:b4a5  5a			phy
$0d:b4a6  99 73 ec	  sta $ec73,y
$0d:b4a9  5e 91 52	  lsr $5291,x
$0d:b4ac  86 31		 stx $31
$0d:b4ae  43 08		 eor $08,s
$0d:b4b0  e3 1c		 sbc $1c,s
$0d:b4b2  66 2d		 ror $2d
$0d:b4b4  2a			rol a
$0d:b4b5  46 cc		 lsr $cc
$0d:b4b7  5a			phy
$0d:b4b8  99 73 cc	  sta $cc73,y
$0d:b4bb  5a			phy
$0d:b4bc  4a			lsr a
$0d:b4bd  4a			lsr a
$0d:b4be  cc 39 10	  cpy $1039
$0d:b4c1  c7 b4		 cmp [$b4]
$0d:b4c3  00 02		 brk #$02
$0d:b4c5  03 00		 ora $00,s
$0d:b4c7  20 40 80	  jsr $8040
$0d:b4ca  22 42 82 24   jsl $248242
$0d:b4ce  44 84 26	  mvp $26,$84
$0d:b4d1  46 86		 lsr $86
$0d:b4d3  28			plp
$0d:b4d4  48			pha
$0d:b4d5  88			dey
$0d:b4d6  2a			rol a
$0d:b4d7  4a			lsr a
$0d:b4d8  8a			txa
$0d:b4d9  2c 4c 8c	  bit $8c4c
$0d:b4dc  2e 4e 8e	  rol $8e4e
$0d:b4df  30 50		 bmi $b531
$0d:b4e1  90 32		 bcc $b515
$0d:b4e3  52 92		 eor ($92)
$0d:b4e5  34 54		 bit $54,x
$0d:b4e7  94 36		 sty $36,x
$0d:b4e9  56 96		 lsr $96,x
$0d:b4eb  38			sec
$0d:b4ec  58			cli
$0d:b4ed  98			tya
$0d:b4ee  3a			dec a
$0d:b4ef  5a			phy
$0d:b4f0  9a			txs
$0d:b4f1  3c 5c 9c	  bit $9c5c,x
$0d:b4f4  3f 5f 9f 08   and $089f5f,x
$0d:b4f8  22 b5 00 02   jsl $0200b5
$0d:b4fc  03 08		 ora $08,s
$0d:b4fe  6a			ror a
$0d:b4ff  b5 00		 lda $00,x
$0d:b501  02 03		 cop #$03
$0d:b503  08			php
$0d:b504  22 b5 00 02   jsl $0200b5
$0d:b508  03 08		 ora $08,s
$0d:b50a  6a			ror a
$0d:b50b  b5 00		 lda $00,x
$0d:b50d  02 03		 cop #$03
$0d:b50f  10 22		 bpl $b533
$0d:b511  b5 00		 lda $00,x
$0d:b513  02 03		 cop #$03
$0d:b515  01 4f		 ora ($4f,x)
$0d:b517  b5 00		 lda $00,x
$0d:b519  02 1f		 cop #$1f
$0d:b51b  10 52		 bpl $b56f
$0d:b51d  b5 00		 lda $00,x
$0d:b51f  02 03		 cop #$03
$0d:b521  00 20		 brk #$20
$0d:b523  40			rti
$0d:b524  80 22		 bra $b548
$0d:b526  40			rti
$0d:b527  80 24		 bra $b54d
$0d:b529  41 80		 eor ($80,x)
$0d:b52b  26 42		 rol $42
$0d:b52d  80 28		 bra $b557
$0d:b52f  43 80		 eor $80,s
$0d:b531  2a			rol a
$0d:b532  44 81 2c	  mvp $2c,$81
$0d:b535  45 81		 eor $81
$0d:b537  2e 46 81	  rol $8146
$0d:b53a  30 47		 bmi $b583
$0d:b53c  81 32		 sta ($32,x)
$0d:b53e  48			pha
$0d:b53f  81 34		 sta ($34,x)
$0d:b541  49 82 36	  eor #$3682
$0d:b544  4a			lsr a
$0d:b545  82 38 4b	  brl $0080
$0d:b548  82 3a 4c	  brl $0185
$0d:b54b  82 3c 4d	  brl $028a
$0d:b54e  82 3f 4e	  brl $0390
$0d:b551  83 3f		 sta $3f,s
$0d:b553  4e 83 3d	  lsr $3d83
$0d:b556  4e 83 3b	  lsr $3b83
$0d:b559  4d 83 39	  eor $3983
$0d:b55c  4c 83 37	  jmp $3783
$0d:b55f  4b			phk
$0d:b560  83 35		 sta $35,s
$0d:b562  4a			lsr a
$0d:b563  82 33 49	  brl $fe99
$0d:b566  82 31 48	  brl $fd9a
$0d:b569  82 2f 47	  brl $fc9b
$0d:b56c  82 2d 46	  brl $fb9c
$0d:b56f  82 2b 45	  brl $fa9d
$0d:b572  81 29		 sta ($29,x)
$0d:b574  44 81 27	  mvp $27,$81
$0d:b577  43 81		 eor $81,s
$0d:b579  25 42		 and $42
$0d:b57b  81 23		 sta ($23,x)
$0d:b57d  41 81		 eor ($81,x)
$0d:b57f  20 40 80	  jsr $8040
$0d:b582  10 89		 bpl $b50d
$0d:b584  b5 00		 lda $00,x
$0d:b586  02 03		 cop #$03
$0d:b588  00 20		 brk #$20
$0d:b58a  40			rti
$0d:b58b  80 22		 bra $b5af
$0d:b58d  42 82		 wdm #$82
$0d:b58f  24 44		 bit $44
$0d:b591  84 26		 sty $26
$0d:b593  46 86		 lsr $86
$0d:b595  28			plp
$0d:b596  48			pha
$0d:b597  88			dey
$0d:b598  2a			rol a
$0d:b599  4a			lsr a
$0d:b59a  8a			txa
$0d:b59b  2c 4c 8c	  bit $8c4c
$0d:b59e  2e 4e 8e	  rol $8e4e
$0d:b5a1  30 50		 bmi $b5f3
$0d:b5a3  90 32		 bcc $b5d7
$0d:b5a5  52 92		 eor ($92)
$0d:b5a7  34 54		 bit $54,x
$0d:b5a9  94 36		 sty $36,x
$0d:b5ab  56 96		 lsr $96,x
$0d:b5ad  38			sec
$0d:b5ae  58			cli
$0d:b5af  98			tya
$0d:b5b0  3a			dec a
$0d:b5b1  5a			phy
$0d:b5b2  9a			txs
$0d:b5b3  3c 5c 9c	  bit $9c5c,x
$0d:b5b6  3f 5f 9f 01   and $019f5f,x
$0d:b5ba  38			sec
$0d:b5bb  b6 70		 ldx $70,y
$0d:b5bd  11 04		 ora ($04),y
$0d:b5bf  01 26		 ora ($26,x)
$0d:b5c1  b6 70		 ldx $70,y
$0d:b5c3  11 03		 ora ($03),y
$0d:b5c5  01 14		 ora ($14,x)
$0d:b5c7  b6 70		 ldx $70,y
$0d:b5c9  11 02		 ora ($02),y
$0d:b5cb  01 02		 ora ($02,x)
$0d:b5cd  b6 70		 ldx $70,y
$0d:b5cf  11 04		 ora ($04),y
$0d:b5d1  01 f0		 ora ($f0,x)
$0d:b5d3  b5 70		 lda $70,x
$0d:b5d5  11 02		 ora ($02),y
$0d:b5d7  01 de		 ora ($de,x)
$0d:b5d9  b5 70		 lda $70,x
$0d:b5db  11 03		 ora ($03),y
$0d:b5dd  00 41		 brk #$41
$0d:b5df  0c cd 60	  tsb $60cd
$0d:b5e2  ab			plb
$0d:b5e3  54 09 4d	  mvn $4d,$09
$0d:b5e6  cc 69 09	  cpy $0969
$0d:b5e9  65 0a		 adc $0a
$0d:b5eb  5e c0 76	  lsr $76c0,x
$0d:b5ee  6a			ror a
$0d:b5ef  66 41		 ror $41
$0d:b5f1  0c ab 54	  tsb $54ab
$0d:b5f4  69 40 6b	  adc #$6b40
$0d:b5f7  55 6b		 eor $6b,x
$0d:b5f9  6d cc 69	  adc $69cc
$0d:b5fc  6a			ror a
$0d:b5fd  66 0a		 ror $0a
$0d:b5ff  5e ca 76	  lsr $76ca,x
$0d:b602  41 0c		 eor ($0c,x)
$0d:b604  69 40 cd	  adc #$cd40
$0d:b607  60			rts
$0d:b608  8a			txa
$0d:b609  5d 09 65	  eor $6509,x
$0d:b60c  6a			ror a
$0d:b60d  6d ca 76	  adc $76ca
$0d:b610  6a			ror a
$0d:b611  66 0a		 ror $0a
$0d:b613  5e 41 0c	  lsr $0c41,x
$0d:b616  cd 60 ab	  cmp $ab60
$0d:b619  54 09 4d	  mvn $4d,$09
$0d:b61c  cc 69 09	  cpy $0969
$0d:b61f  65 0a		 adc $0a
$0d:b621  5e ca 76	  lsr $76ca,x
$0d:b624  6a			ror a
$0d:b625  66 41		 ror $41
$0d:b627  0c ab 54	  tsb $54ab
$0d:b62a  69 40 6b	  adc #$6b40
$0d:b62d  55 6b		 eor $6b,x
$0d:b62f  6d cc 69	  adc $69cc
$0d:b632  6a			ror a
$0d:b633  66 0a		 ror $0a
$0d:b635  5e ca 76	  lsr $76ca,x
$0d:b638  41 0c		 eor ($0c,x)
$0d:b63a  69 40 cd	  adc #$cd40
$0d:b63d  60			rts
$0d:b63e  8a			txa
$0d:b63f  5d 09 65	  eor $6509,x
$0d:b642  6b			rtl
$0d:b643  6d ca 76	  adc $76ca
$0d:b646  6a			ror a
$0d:b647  66 0a		 ror $0a
$0d:b649  5e 01 a5	  lsr $a501,x
$0d:b64c  b6 00		 ldx $00,y
$0d:b64e  02 04		 cop #$04
$0d:b650  01 a8		 ora ($a8,x)
$0d:b652  b6 00		 ldx $00,y
$0d:b654  02 04		 cop #$04
$0d:b656  01 ab		 ora ($ab,x)
$0d:b658  b6 00		 ldx $00,y
$0d:b65a  02 04		 cop #$04
$0d:b65c  01 ae		 ora ($ae,x)
$0d:b65e  b6 00		 ldx $00,y
$0d:b660  02 04		 cop #$04
$0d:b662  01 b1		 ora ($b1,x)
$0d:b664  b6 00		 ldx $00,y
$0d:b666  02 04		 cop #$04
$0d:b668  01 b4		 ora ($b4,x)
$0d:b66a  b6 00		 ldx $00,y
$0d:b66c  02 04		 cop #$04
$0d:b66e  01 b7		 ora ($b7,x)
$0d:b670  b6 00		 ldx $00,y
$0d:b672  02 04		 cop #$04
$0d:b674  01 ba		 ora ($ba,x)
$0d:b676  b6 00		 ldx $00,y
$0d:b678  02 04		 cop #$04
$0d:b67a  01 bd		 ora ($bd,x)
$0d:b67c  b6 00		 ldx $00,y
$0d:b67e  02 04		 cop #$04
$0d:b680  01 c0		 ora ($c0,x)
$0d:b682  b6 00		 ldx $00,y
$0d:b684  02 04		 cop #$04
$0d:b686  01 c3		 ora ($c3,x)
$0d:b688  b6 00		 ldx $00,y
$0d:b68a  02 04		 cop #$04
$0d:b68c  01 c6		 ora ($c6,x)
$0d:b68e  b6 00		 ldx $00,y
$0d:b690  02 04		 cop #$04
$0d:b692  01 c9		 ora ($c9,x)
$0d:b694  b6 00		 ldx $00,y
$0d:b696  02 04		 cop #$04
$0d:b698  01 cc		 ora ($cc,x)
$0d:b69a  b6 00		 ldx $00,y
$0d:b69c  02 04		 cop #$04
$0d:b69e  01 cf		 ora ($cf,x)
$0d:b6a0  b6 00		 ldx $00,y
$0d:b6a2  02 04		 cop #$04
$0d:b6a4  00 22		 brk #$22
$0d:b6a6  42 82		 wdm #$82
$0d:b6a8  24 44		 bit $44
$0d:b6aa  84 26		 sty $26
$0d:b6ac  46 86		 lsr $86
$0d:b6ae  28			plp
$0d:b6af  48			pha
$0d:b6b0  88			dey
$0d:b6b1  2a			rol a
$0d:b6b2  4a			lsr a
$0d:b6b3  8a			txa
$0d:b6b4  2c 4c 8c	  bit $8c4c
$0d:b6b7  2e 4e 8e	  rol $8e4e
$0d:b6ba  30 50		 bmi $b70c
$0d:b6bc  90 32		 bcc $b6f0
$0d:b6be  52 92		 eor ($92)
$0d:b6c0  34 54		 bit $54,x
$0d:b6c2  94 36		 sty $36,x
$0d:b6c4  56 96		 lsr $96,x
$0d:b6c6  38			sec
$0d:b6c7  58			cli
$0d:b6c8  98			tya
$0d:b6c9  3a			dec a
$0d:b6ca  5a			phy
$0d:b6cb  9a			txs
$0d:b6cc  3c 5c 9c	  bit $9c5c,x
$0d:b6cf  3f 5f 9f 01   and $019f5f,x
$0d:b6d3  2d b7 00	  and $00b7
$0d:b6d6  02 04		 cop #$04
$0d:b6d8  01 30		 ora ($30,x)
$0d:b6da  b7 00		 lda [$00],y
$0d:b6dc  02 04		 cop #$04
$0d:b6de  01 33		 ora ($33,x)
$0d:b6e0  b7 00		 lda [$00],y
$0d:b6e2  02 04		 cop #$04
$0d:b6e4  01 36		 ora ($36,x)
$0d:b6e6  b7 00		 lda [$00],y
$0d:b6e8  02 04		 cop #$04
$0d:b6ea  01 39		 ora ($39,x)
$0d:b6ec  b7 00		 lda [$00],y
$0d:b6ee  02 04		 cop #$04
$0d:b6f0  01 3c		 ora ($3c,x)
$0d:b6f2  b7 00		 lda [$00],y
$0d:b6f4  02 04		 cop #$04
$0d:b6f6  01 3f		 ora ($3f,x)
$0d:b6f8  b7 00		 lda [$00],y
$0d:b6fa  02 04		 cop #$04
$0d:b6fc  01 42		 ora ($42,x)
$0d:b6fe  b7 00		 lda [$00],y
$0d:b700  02 04		 cop #$04
$0d:b702  01 45		 ora ($45,x)
$0d:b704  b7 00		 lda [$00],y
$0d:b706  02 04		 cop #$04
$0d:b708  01 48		 ora ($48,x)
$0d:b70a  b7 00		 lda [$00],y
$0d:b70c  02 04		 cop #$04
$0d:b70e  01 4b		 ora ($4b,x)
$0d:b710  b7 00		 lda [$00],y
$0d:b712  02 04		 cop #$04
$0d:b714  01 4e		 ora ($4e,x)
$0d:b716  b7 00		 lda [$00],y
$0d:b718  02 04		 cop #$04
$0d:b71a  01 51		 ora ($51,x)
$0d:b71c  b7 00		 lda [$00],y
$0d:b71e  02 04		 cop #$04
$0d:b720  01 54		 ora ($54,x)
$0d:b722  b7 00		 lda [$00],y
$0d:b724  02 04		 cop #$04
$0d:b726  01 57		 ora ($57,x)
$0d:b728  b7 00		 lda [$00],y
$0d:b72a  02 04		 cop #$04
$0d:b72c  00 22		 brk #$22
$0d:b72e  42 82		 wdm #$82
$0d:b730  24 44		 bit $44
$0d:b732  84 26		 sty $26
$0d:b734  46 86		 lsr $86
$0d:b736  28			plp
$0d:b737  48			pha
$0d:b738  88			dey
$0d:b739  2a			rol a
$0d:b73a  4a			lsr a
$0d:b73b  8a			txa
$0d:b73c  2c 4c 8c	  bit $8c4c
$0d:b73f  2e 4e 8e	  rol $8e4e
$0d:b742  30 50		 bmi $b794
$0d:b744  90 32		 bcc $b778
$0d:b746  52 92		 eor ($92)
$0d:b748  34 54		 bit $54,x
$0d:b74a  94 36		 sty $36,x
$0d:b74c  56 96		 lsr $96,x
$0d:b74e  38			sec
$0d:b74f  58			cli
$0d:b750  98			tya
$0d:b751  3a			dec a
$0d:b752  5a			phy
$0d:b753  9a			txs
$0d:b754  3c 5c 9c	  bit $9c5c,x
$0d:b757  3f 5f 9f 01   and $019f5f,x
$0d:b75b  67 b7		 adc [$b7]
$0d:b75d  88			dey
$0d:b75e  09 26 01	  ora #$0126
$0d:b761  71 b7		 adc ($b7),y
$0d:b763  88			dey
$0d:b764  09 00 00	  ora #$0000
$0d:b767  d8			cld
$0d:b768  6e d1 5d	  ror $5dd1
$0d:b76b  8e 4d 0a	  stx $0a4d
$0d:b76e  35 85		 and $85,x
$0d:b770  1c 5f 5e	  trb $5e5f
$0d:b773  1f 39 79 30   ora $307939,x
$0d:b777  30 20		 bmi $b799
$0d:b779  29 14 01	  and #$0114
$0d:b77c  f0 b7		 beq $b735
$0d:b77e  71 0f		 adc ($0f),y
$0d:b780  04 01		 tsb $01
$0d:b782  e0 b7 71	  cpx #$71b7
$0d:b785  0f 04 01 d0   ora $d00104
$0d:b789  b7 71		 lda [$71],y
$0d:b78b  0f 04 01 c0   ora $c00104
$0d:b78f  b7 71		 lda [$71],y
$0d:b791  0f 04 01 b0   ora $b00104
$0d:b795  b7 71		 lda [$71],y
$0d:b797  0f 04 01 a0   ora $a00104
$0d:b79b  b7 71		 lda [$71],y
$0d:b79d  0f 04 00 00   ora $000004
$0d:b7a1  00 00		 brk #$00
$0d:b7a3  00 00		 brk #$00
$0d:b7a5  00 00		 brk #$00
$0d:b7a7  00 00		 brk #$00
$0d:b7a9  00 00		 brk #$00
$0d:b7ab  00 00		 brk #$00
$0d:b7ad  00 23		 brk #$23
$0d:b7af  08			php
$0d:b7b0  00 00		 brk #$00
$0d:b7b2  00 00		 brk #$00
$0d:b7b4  00 00		 brk #$00
$0d:b7b6  00 00		 brk #$00
$0d:b7b8  00 00		 brk #$00
$0d:b7ba  00 00		 brk #$00
$0d:b7bc  23 08		 and $08,s
$0d:b7be  66 10		 ror $10
$0d:b7c0  00 00		 brk #$00
$0d:b7c2  00 00		 brk #$00
$0d:b7c4  00 00		 brk #$00
$0d:b7c6  00 00		 brk #$00
$0d:b7c8  00 00		 brk #$00
$0d:b7ca  23 08		 and $08,s
$0d:b7cc  66 10		 ror $10
$0d:b7ce  c9 1c 00	  cmp #$001c
$0d:b7d1  00 00		 brk #$00
$0d:b7d3  00 00		 brk #$00
$0d:b7d5  00 00		 brk #$00
$0d:b7d7  00 23		 brk #$23
$0d:b7d9  08			php
$0d:b7da  66 10		 ror $10
$0d:b7dc  c9 1c 0c	  cmp #$0c1c
$0d:b7df  25 00		 and $00
$0d:b7e1  00 00		 brk #$00
$0d:b7e3  00 00		 brk #$00
$0d:b7e5  00 23		 brk #$23
$0d:b7e7  08			php
$0d:b7e8  66 10		 ror $10
$0d:b7ea  c9 1c 0c	  cmp #$0c1c
$0d:b7ed  25 6f		 and $6f
$0d:b7ef  31 00		 and ($00),y
$0d:b7f1  00 00		 brk #$00
$0d:b7f3  00 23		 brk #$23
$0d:b7f5  08			php
$0d:b7f6  66 10		 ror $10
$0d:b7f8  c9 1c 0c	  cmp #$0c1c
$0d:b7fb  25 6f		 and $6f
$0d:b7fd  31 b0		 and ($b0),y
$0d:b7ff  39 00 20	  and $2000,y
$0d:b802  82 40 a1	  brl $5945
$0d:b805  70 88		 bvs $b78f
$0d:b807  2b			pld
$0d:b808  bc 20 d0	  ldy $d020,x
$0d:b80b  18			clc
$0d:b80c  1c 02 07	  trb $0702
$0d:b80f  01 80		 ora ($80,x)
$0d:b811  c0 20 30	  cpy #$3020
$0d:b814  f8			sed
$0d:b815  7c 1e 1f	  jmp ($1f1e,x)
$0d:b818  03 83		 ora $83,s
$0d:b81a  c0 60 ef	  cpy #$ef60
$0d:b81d  90 81		 bcc $b7a0
$0d:b81f  3f 02 01 02   and $020102,x
$0d:b823  80 60		 bra $b885
$0d:b825  01 e1		 ora ($e1,x)
$0d:b827  e1 a6		 sbc ($a6,x)
$0d:b829  5b			tcd
$0d:b82a  34 33		 bit $33,x
$0d:b82c  6a			ror a
$0d:b82d  ad a7 43	  lda $43a7
$0d:b830  d1 b9		 cmp ($b9),y
$0d:b832  e4 fd		 cpx $fd
$0d:b834  51 08		 eor ($08),y
$0d:b836  0e 02 4d	  asl $4d02
$0d:b839  c1 c9		 cmp ($c9,x)
$0d:b83b  f9 f9 fc	  sbc $fcf9,y
$0d:b83e  fc f6 7e	  jsr ($7ef6,x)
$0d:b841  73 3e		 adc ($3e,s),y
$0d:b843  89 c3 27	  bit #$27c3
$0d:b846  b3 db		 lda ($db,s),y
$0d:b848  e5 f3		 sbc $f3
$0d:b84a  0d 87 f0	  ora $f087
$0d:b84d  40			rti
$0d:b84e  2f f7 ff c4   and $c4fff7
$0d:b852  1f b3 9f bd   ora $bd9fb3,x
$0d:b856  40			rti
$0d:b857  f4 14 0c	  pea $0c14
$0d:b85a  1c 02 f1	  trb $f102
$0d:b85d  ff 21 06 03   sbc $030621,x
$0d:b861  fe 0b 0d	  inc $0d0b,x
$0d:b864  14 f3		 trb $f3
$0d:b866  f8			sed
$0d:b867  42 10		 wdm #$10
$0d:b869  70 40		 bvs $b8ab
$0d:b86b  24 1c		 bit $1c
$0d:b86d  0f 84 82 71   ora $718284
$0d:b871  b0 fe		 bcs $b871
$0d:b873  5a			phy
$0d:b874  3b			tsc
$0d:b875  df 4b 76 43   cmp $43764b,x
$0d:b879  ee 50 01	  inc $0150
$0d:b87c  98			tya
$0d:b87d  44 3c 1c	  mvp $1c,$3c
$0d:b880  8f 84 12 f1   sta $f11284
$0d:b884  22 8e 64 21   jsl $21648e
$0d:b888  d2 9e		 cmp ($9e)
$0d:b88a  37 02		 and [$02],y
$0d:b88c  81 20		 sta ($20,x)
$0d:b88e  d0 70		 bne $b900
$0d:b890  22 36 28 5e   jsl $5e2836
$0d:b894  f7 1f		 sbc [$1f],y
$0d:b896  55 e7		 eor $e7,x
$0d:b898  c9 7c f1	  cmp #$f17c
$0d:b89b  4f b6 03 81   eor $8103b6
$0d:b89f  c1 f0		 cmp ($f0,x)
$0d:b8a1  78			sei
$0d:b8a2  fe 1f 5f	  inc $5f1f,x
$0d:b8a5  c5 cb		 cmp $cb
$0d:b8a7  f3 32		 sbc ($32,s),y
$0d:b8a9  fc e6 ae	  jsr ($aee6,x)
$0d:b8ac  38			sec
$0d:b8ad  9b			txy
$0d:b8ae  9c 32 ff	  stz $ff32
$0d:b8b1  00 ff		 brk #$ff
$0d:b8b3  da			phx
$0d:b8b4  fa			plx
$0d:b8b5  f9 af 36	  sbc $36af,y
$0d:b8b8  d3 99		 cmp ($99,s),y
$0d:b8ba  31 a4		 and ($a4),y
$0d:b8bc  5c e9 1b e8   jml $e81be9
$0d:b8c0  4d 4a 43	  eor $434a
$0d:b8c3  a0 a1 c9	  ldy #$c9a1
$0d:b8c6  38			sec
$0d:b8c7  74 1c		 stz $1c,x
$0d:b8c9  3c 2f 8f	  bit $8f2f,x
$0d:b8cc  87 e7		 sta [$e7]
$0d:b8ce  aa			tax
$0d:b8cf  43 8f		 eor $8f,s
$0d:b8d1  cf 05 83 f4   cmp $f48305
$0d:b8d5  1f 21 80 83   ora $838021,x
$0d:b8d9  d0 32		 bne $b90d
$0d:b8db  7b			tdc
$0d:b8dc  0a			asl a
$0d:b8dd  fd 06 5d	  sbc $5d06,x
$0d:b8e0  39 c7 2c	  and $2cc7,y
$0d:b8e3  08			php
$0d:b8e4  12 1c		 ora ($1c)
$0d:b8e6  4e 1f 9b	  lsr $9b1f
$0d:b8e9  e3 ec		 sbc $ec,s
$0d:b8eb  f8			sed
$0d:b8ec  7d ff 17	  adc $17ff,x
$0d:b8ef  1f f5 4e 3f   ora $3f4ef5,x
$0d:b8f3  09 db c6	  ora #$c6db
$0d:b8f6  3c d6 bf	  bit $bfd6,x
$0d:b8f9  b7 8b		 lda [$8b],y
$0d:b8fb  fb			xce
$0d:b8fc  66 f4		 ror $f4
$0d:b8fe  43 f9		 eor $f9,s
$0d:b900  32 6f		 and ($6f)
$0d:b902  35 a2		 and $a2,x
$0d:b904  0f c4 81 c8   ora $c881c4
$0d:b908  78			sei
$0d:b909  70 1f		 bvs $b92a
$0d:b90b  9c 07 e3	  stz $e307
$0d:b90e  11 fc		 ora ($fc),y
$0d:b910  cc 6f 11	  cpy $116f
$0d:b913  a9 ea bc	  lda #$bcea
$0d:b916  5d e5 01	  eor $01e5,x
$0d:b919  81 c0		 sta ($c0,x)
$0d:b91b  20 90 38	  jsr $3890
$0d:b91e  74 06		 stz $06,x
$0d:b920  21 0f		 and ($0f,x)
$0d:b922  77 b2		 adc [$b2],y
$0d:b924  cc 20 10	  cpy $1020
$0d:b927  78			sei
$0d:b928  03 f8		 ora $f8,s
$0d:b92a  23 ef		 and $ef,s
$0d:b92c  40			rti
$0d:b92d  84 41		 sty $41
$0d:b92f  ec 31 f8	  cpx $f831
$0d:b932  7f ff 03 7f   adc $7f03ff,x
$0d:b936  8f ff e1 9f   sta $9fe1ff
$0d:b93a  c9 bf dd	  cmp #$ddbf
$0d:b93d  5e 2f e0	  lsr $e02f,x
$0d:b940  48			pha
$0d:b941  08			php
$0d:b942  94 a0		 sty $a0,x
$0d:b944  7f f8 41 18   adc $1841f8,x
$0d:b948  5e 82 33	  lsr $3382,x
$0d:b94b  08			php
$0d:b94c  4c 22 15	  jmp $1522
$0d:b94f  0a			asl a
$0d:b950  87 43		 sta [$43]
$0d:b952  e3 d1		 sbc $d1,s
$0d:b954  58			cli
$0d:b955  a0 09 21	  ldy #$2109
$0d:b958  30 08		 bmi $b962
$0d:b95a  54 05 f6	  mvn $f6,$05
$0d:b95d  00 e0		 brk #$e0
$0d:b95f  8a			txa
$0d:b960  c2 9d		 rep #$9d
$0d:b962  eb			xba
$0d:b963  a0 d0 6c	  ldy #$6cd0
$0d:b966  32 1d		 and ($1d)
$0d:b968  0d 87 63	  ora $6387
$0d:b96b  91 c8		 sta ($c8),y
$0d:b96d  28			plp
$0d:b96e  2c 03 61	  bit $6103
$0d:b971  00 e8		 brk #$e8
$0d:b973  48			pha
$0d:b974  3f 10 0e 44   and $440e10,x
$0d:b978  c2 04		 rep #$04
$0d:b97a  6f 08 5c 24   adc $245c08
$0d:b97e  e6 10		 inc $10
$0d:b980  d8			cld
$0d:b981  64 72		 stz $72
$0d:b983  2d 14 3c	  and $3c14
$0d:b986  94 0a		 sty $0a,x
$0d:b988  01 0b		 ora ($0b,x)
$0d:b98a  22 04 0a 1b   jsl $1b0a04
$0d:b98e  02 8e		 cop #$8e
$0d:b990  40			rti
$0d:b991  e2 d0		 sep #$d0
$0d:b993  94 49		 sty $49,x
$0d:b995  2b			pld
$0d:b996  c6 40		 dec $40
$0d:b998  92 0d		 sta ($0d)
$0d:b99a  02 54		 cop #$54
$0d:b99c  3e 1b 0f	  rol $0f1b,x
$0d:b99f  87 43		 sta [$43]
$0d:b9a1  b0 9c		 bcs $b93f
$0d:b9a3  04 80		 tsb $80
$0d:b9a5  a8			tay
$0d:b9a6  04 ca		 tsb $ca
$0d:b9a8  1f 05 30 f6   ora $f63005,x
$0d:b9ac  24 0a		 bit $0a
$0d:b9ae  b0 02		 bcs $b9b2
$0d:b9b0  11 fc		 ora ($fc),y
$0d:b9b2  21 b0		 and ($b0,x)
$0d:b9b4  8d b4 8e	  sta $8eb4
$0d:b9b7  99 47 d8	  sta $d847,y
$0d:b9ba  c7 eb		 cmp [$eb]
$0d:b9bc  d1 60		 cmp ($60),y
$0d:b9be  23 67		 and $67,s
$0d:b9c0  20 1b 88	  jsr $881b
$0d:b9c3  07 82		 ora [$82]
$0d:b9c5  01 f9		 ora ($f9,x)
$0d:b9c7  88			dey
$0d:b9c8  24 02		 bit $02
$0d:b9ca  81 40		 sta ($40,x)
$0d:b9cc  d8			cld
$0d:b9cd  64 2b		 stz $2b
$0d:b9cf  14 8d		 trb $8d
$0d:b9d1  a6 92		 ldx $92
$0d:b9d3  b7 b1		 lda [$b1],y
$0d:b9d5  86 fe		 stx $fe
$0d:b9d7  3e 54 27	  rol $2754,x
$0d:b9da  91 58		 sta ($58),y
$0d:b9dc  20 1f 0a	  jsr $0a1f
$0d:b9df  05 62		 ora $62
$0d:b9e1  01 4e		 ora ($4e,x)
$0d:b9e3  04 8e		 tsb $8e
$0d:b9e5  fc de 10	  jsr ($10de,x)
$0d:b9e8  38			sec
$0d:b9e9  34 1a		 bit $1a,x
$0d:b9eb  05 01		 ora $01
$0d:b9ed  82 30 c6	  brl $8020
$0d:b9f0  07 0c		 ora [$0c]
$0d:b9f2  82 44 23	  brl $dd39
$0d:b9f5  91 71		 sta ($71),y
$0d:b9f7  88			dey
$0d:b9f8  c1 c0		 cmp ($c0,x)
$0d:b9fa  4b			phk
$0d:b9fb  0f 87 c7 e1   ora $e1c787
$0d:b9ff  11 fa		 ora ($fa),y
$0d:ba01  ae 27 55	  ldx $5527
$0d:ba04  64 db		 stz $db
$0d:ba06  4c 29 39	  jmp $3929
$0d:ba09  8d 34 fa	  sta $fa34
$0d:ba0c  87 7f		 sta [$7f]
$0d:ba0e  8c fd ee	  sty $eefd
$0d:ba11  9d 39 f4	  sta $f439,x
$0d:ba14  ff 3f 9f e7   sbc $e79f3f,x
$0d:ba18  ff fc ff fe   sbc $fefffc,x
$0d:ba1c  0f ff 31 e7   ora $e731ff
$0d:ba20  aa			tax
$0d:ba21  60			rts
$0d:ba22  e9 d0 1c	  sbc #$1cd0
$0d:ba25  94 7a		 sty $7a,x
$0d:ba27  cf e5 db 75   cmp $75dbe5
$0d:ba2b  f9 ff 6a	  sbc $6aff,y
$0d:ba2e  5d f2 89	  eor $89f2,x
$0d:ba31  7f d3 6e ec   adc $ec6ed3,x
$0d:ba35  7f df 0f fe   adc $fe0fdf,x
$0d:ba39  49 d8 8b	  eor #$8bd8
$0d:ba3c  72 24		 adc ($24)
$0d:ba3e  dc 0c 87	  jml [$870c]
$0d:ba41  83 11		 sta $11,s
$0d:ba43  f0 a6		 beq $b9eb
$0d:ba45  7c 20 df	  jmp ($df20,x)
$0d:ba48  8a			txa
$0d:ba49  25 cf		 and $cf
$0d:ba4b  45 b9		 eor $b9
$0d:ba4d  e9 76 66	  sbc #$6676
$0d:ba50  5f 9a 97 e7   eor $e7979a,x
$0d:ba54  ed 59 ab	  sbc $ab59
$0d:ba57  76 7f		 ror $7f,x
$0d:ba59  5e dc e7	  lsr $e7dc,x
$0d:ba5c  8e 9d f1	  stx $f19d
$0d:ba5f  93 5e		 sta ($5e,s),y
$0d:ba61  60			rts
$0d:ba62  c6 40		 dec $40
$0d:ba64  9c c9 a3	  stz $a3c9
$0d:ba67  32 78		 and ($78)
$0d:ba69  c4 4e		 cpy $4e
$0d:ba6b  19 0c bb	  ora $bb0c,y
$0d:ba6e  c1 2e		 cmp ($2e,x)
$0d:ba70  70 49		 bvs $babb
$0d:ba72  99 cc 20	  sta $20cc,y
$0d:ba75  d1 38		 cmp ($38),y
$0d:ba77  b4 0e		 ldy $0e,x
$0d:ba79  39 01 3d	  and $3d01,y
$0d:ba7c  85 22		 sta $22
$0d:ba7e  63 7c		 adc $7c,s
$0d:ba80  80 cf		 bra $ba51
$0d:ba82  60			rts
$0d:ba83  08			php
$0d:ba84  30 8e		 bmi $ba14
$0d:ba86  a1 86		 lda ($86,x)
$0d:ba88  3e 8a 1d	  rol $1d8a,x
$0d:ba8b  e5 6f		 sbc $6f
$0d:ba8d  89 03 b0	  bit #$b003
$0d:ba90  48			pha
$0d:ba91  ee 53 1c	  inc $1c53
$0d:ba94  ee b3 3d	  inc $3db3
$0d:ba97  a6 cf		 ldx $cf
$0d:ba99  e8			inx
$0d:ba9a  6b			rtl
$0d:ba9b  e3 f0		 sbc $f0,s
$0d:ba9d  f3 89		 sbc ($89,s),y
$0d:ba9f  43 8f		 eor $8f,s
$0d:baa1  ff e9 fb e9   sbc $e9fbe9,x
$0d:baa5  fe 3a 2f	  inc $2f3a,x
$0d:baa8  8e 81 e1	  stx $e181
$0d:baab  90 70		 bcc $bb1d
$0d:baad  6a			ror a
$0d:baae  9c 79 55	  stz $5579
$0d:bab1  8e 23 71	  stx $7123
$0d:bab4  82 4f 24	  brl $df06
$0d:bab7  68			pla
$0d:bab8  b2 8f		 lda ($8f)
$0d:baba  c5 21		 cmp $21
$0d:babc  7b			tdc
$0d:babd  8b			phb
$0d:babe  fc 72 ff	  jsr ($ff72,x)
$0d:bac1  4e 9f ad	  lsr $ad9f
$0d:bac4  c2 61		 rep #$61
$0d:bac6  0f 8c 41 e3   ora $e3418c
$0d:baca  d0 14		 bne $bae0
$0d:bacc  58			cli
$0d:bacd  6e aa 56	  ror $56aa
$0d:bad0  9c 2c d7	  stz $d72c
$0d:bad3  a3 9a		 lda $9a,s
$0d:bad5  f5 47		 sbc $47,x
$0d:bad7  6c 9d 6f	  jmp ($6f9d)
$0d:bada  0c eb 93	  tsb $93eb
$0d:badd  3d b2 63	  and $63b2,x
$0d:bae0  a3 b5		 lda $b5,s
$0d:bae2  fc f4 ff	  jsr ($fff4,x)
$0d:bae5  9d 25 e7	  sta $e725,x
$0d:bae8  e6 fc		 inc $fc
$0d:baea  f1 ff		 sbc ($ff),y
$0d:baec  7c df 9f	  jmp ($9fdf,x)
$0d:baef  ab			plb
$0d:baf0  83 ad		 sta $ad,s
$0d:baf2  c2 f1		 rep #$f1
$0d:baf4  07 80		 ora [$80]
$0d:baf6  5f f2 77 39   eor $3977f2,x
$0d:bafa  e7 ff		 sbc [$ff]
$0d:bafc  0f 7f bc fe   ora $febc7f
$0d:bb00  31 f7		 and ($f7),y
$0d:bb02  f8			sed
$0d:bb03  04 fd		 tsb $fd
$0d:bb05  e6 0f		 inc $0f
$0d:bb07  30 86		 bmi $ba8f
$0d:bb09  7f e0 00 61   adc $6100e0,x
$0d:bb0d  83 81		 sta $81,s
$0d:bb0f  86 63		 stx $63
$0d:bb11  3f b1 78 e3   and $e378b1,x
$0d:bb15  82 61 d3	  brl $8e79
$0d:bb18  61 fc		 adc ($fc,x)
$0d:bb1a  1f fc c4 7c   ora $7cc4fc,x
$0d:bb1e  32 1c		 and ($1c)
$0d:bb20  0f f8 4c 20   ora $204cf8
$0d:bb24  00 61		 brk #$61
$0d:bb26  bc 01 84	  ldy $8401,x
$0d:bb29  32 02		 and ($02)
$0d:bb2b  30 8a		 bmi $bab7
$0d:bb2d  c5 25		 cmp $25
$0d:bb2f  b2 49		 lda ($49)
$0d:bb31  44 82 55	  mvp $55,$82
$0d:bb34  60			rts
$0d:bb35  a9 50 06	  lda #$0650
$0d:bb38  e1 65		 sbc ($65,x)
$0d:bb3a  a0 c1 60	  ldy #$60c1
$0d:bb3d  31 58		 and ($58),y
$0d:bb3f  54 b6 25	  mvn $25,$b6
$0d:bb42  29 8b 5a	  and #$5a8b
$0d:bb45  e2 95		 sep #$95
$0d:bb47  39 61 1c	  and $1c61,y
$0d:bb4a  2c f1 98	  bit $98f1
$0d:bb4d  3d e6 f1	  and $f1e6,x
$0d:bb50  6c d6 4b	  jmp ($4bd6)
$0d:bb53  36 93		 rol $93,x
$0d:bb55  4e e4 7b	  lsr $7be4
$0d:bb58  55 0a		 eor $0a,x
$0d:bb5a  ed 43 aa	  sbc $aa43
$0d:bb5d  90 6b		 bcc $bbca
$0d:bb5f  24 1a		 bit $1a
$0d:bb61  f9 80 d6	  sbc $d680,y
$0d:bb64  54 36 94	  mvn $94,$36
$0d:bb67  8e f4 83	  stx $83f4
$0d:bb6a  d5 14		 cmp $14,x
$0d:bb6c  ff 40 3e d0   sbc $d03e40,x
$0d:bb70  8f 34 62 37   sta $376234
$0d:bb74  30 94		 bmi $bb0a
$0d:bb76  c8			iny
$0d:bb77  25 a3		 and $a3
$0d:bb79  40			rti
$0d:bb7a  1a			inc a
$0d:bb7b  0d 4e 81	  ora $814e
$0d:bb7e  56 a0		 lsr $a0,x
$0d:bb80  57 28		 eor [$28],y
$0d:bb82  13 b8		 ora ($b8,s),y
$0d:bb84  24 ae		 bit $ae
$0d:bb86  29 2f 88	  and #$882f
$0d:bb89  4b			phk
$0d:bb8a  a2 36		 ldx #$36
$0d:bb8c  e8			inx
$0d:bb8d  8d 7e 40	  sta $407e
$0d:bb90  89 2d 46	  bit #$462d
$0d:bb93  22 51 0c aa   jsl $aa0c51
$0d:bb97  41 3a		 eor ($3a,x)
$0d:bb99  90 4d		 bcc $bbe8
$0d:bb9b  a4 1a		 ldy $1a
$0d:bb9d  55 02		 eor $02,x
$0d:bb9f  8d 42 a2	  sta $a242
$0d:bba2  d0 6d		 bne $bc11
$0d:bba4  45 42		 eor $42
$0d:bba6  59 d0 ba	  eor $bad0,y
$0d:bba9  62 3e 90	  per $4bea
$0d:bbac  83 58		 sta $58,s
$0d:bbae  19 c3 f5	  ora $f5c3,y
$0d:bbb1  04 35		 tsb $35
$0d:bbb3  87 a6		 sta [$a6]
$0d:bbb5  93 9c		 sta ($9c,s),y
$0d:bbb7  fa			plx
$0d:bbb8  7b			tdc
$0d:bbb9  ac fb 08	  ldy $08fb
$0d:bbbc  c6 83		 dec $83
$0d:bbbe  c1 00		 cmp ($00,x)
$0d:bbc0  5c 9e fe 13   jml $13fe9e
$0d:bbc4  0f 82 66 20   ora $206682
$0d:bbc8  0b			phd
$0d:bbc9  85 63		 sta $63
$0d:bbcb  0e 5b 21	  asl $215b
$0d:bbce  2d 93 79	  and $7993
$0d:bbd1  b8			clv
$0d:bbd2  71 b9		 adc ($b9),y
$0d:bbd4  8c 2a 1c	  sty $1c2a
$0d:bbd7  c6 4f		 dec $4f
$0d:bbd9  fe 43 f3	  inc $f343,x
$0d:bbdc  20 9e 40	  jsr $409e
$0d:bbdf  1b			tcs
$0d:bbe0  0a			asl a
$0d:bbe1  c6 18		 dec $18
$0d:bbe3  3c 2a 27	  bit $272a,x
$0d:bbe6  0f 8a c1 e1   ora $e1c18a
$0d:bbea  30 c8		 bmi $bbb4
$0d:bbec  84 6e		 sty $6e
$0d:bbee  0b			phd
$0d:bbef  12 85		 ora ($85)
$0d:bbf1  46 24		 lsr $24
$0d:bbf3  93 f8		 sta ($f8,s),y
$0d:bbf5  d4 60		 pei ($60)
$0d:bbf7  00 31		 brk #$31
$0d:bbf9  b8			clv
$0d:bbfa  9c 7e 0f	  stz $0f7e
$0d:bbfd  1f 87 c7 e2   ora $e2c787,x
$0d:bc01  f0 f8		 beq $bbfb
$0d:bc03  44 de 99	  mvp $99,$de
$0d:bc06  cb			wai
$0d:bc07  ac 55 e4	  ldy $e455
$0d:bc0a  90 fc		 bcc $bc08
$0d:bc0c  f5 aa		 sbc $aa,x
$0d:bc0e  d1 8f		 cmp ($8f),y
$0d:bc10  ce 47 f3	  dec $f347
$0d:bc13  9f fb 46 fe   sta $fe46fb,x
$0d:bc17  67 00		 adc [$00]
$0d:bc19  d5 dc		 cmp $dc,x
$0d:bc1b  3e 3f 8f	  rol $8f3f,x
$0d:bc1e  af e3 e7 fc   lda $fce7e3
$0d:bc22  f0 7f		 beq $bca3
$0d:bc24  e0 3f		 cpx #$3f
$0d:bc26  ed 1f f2	  sbc $f21f
$0d:bc29  67 fd		 adc [$fd]
$0d:bc2b  88			dey
$0d:bc2c  fe a0 3f	  inc $3fa0,x
$0d:bc2f  a8			tay
$0d:bc30  3f d3 e7 04   and $04e7d3,x
$0d:bc34  95 e3		 sta $e3,x
$0d:bc36  2d 3c e9	  and $e93c
$0d:bc39  6f 2a 0d f8   adc $f80d2a
$0d:bc3d  c2 de		 rep #$de
$0d:bc3f  39 b3 0f	  and $0fb3,y
$0d:bc42  cc 00 8a	  cpy $8a00
$0d:bc45  1f 18 06 c6   ora $c60618,x
$0d:bc49  01 71		 ora ($71,x)
$0d:bc4b  c0 7a bd	  cpy #$bd7a
$0d:bc4e  a4 f6		 ldy $f6
$0d:bc50  f4 7b cb	  pea $cb7b
$0d:bc53  25 13		 and $13
$0d:bc55  86 17		 stx $17
$0d:bc57  f2 31		 sbc ($31)
$0d:bc59  05 37		 ora $37
$0d:bc5b  c4 52		 cpy $52
$0d:bc5d  03 16		 ora $16,s
$0d:bc5f  81 c7		 sta ($c7,x)
$0d:bc61  e0 07 fa	  cpx #$fa07
$0d:bc64  8e c0 29	  stx $29c0
$0d:bc67  df 14 78 43   cmp $437814,x
$0d:bc6b  92 46		 sta ($46)
$0d:bc6d  8f 24 78 48   sta $487824
$0d:bc71  38			sec
$0d:bc72  29 f2 90	  and #$90f2
$0d:bc75  f0 14		 beq $bc8b
$0d:bc77  a9 01 f0	  lda #$f001
$0d:bc7a  1e c2 34	  asl $34c2,x
$0d:bc7d  70 08		 bvs $bc87
$0d:bc7f  3c 52 06	  bit $0652,x
$0d:bc82  b5 08		 lda $08,x
$0d:bc84  8c 0e 05	  sty $050e
$0d:bc87  01 80		 ora ($80,x)
$0d:bc89  40			rti
$0d:bc8a  63 c8		 adc $c8,s
$0d:bc8c  03 8f		 ora $8f,s
$0d:bc8e  2f 81 8c 67   and $678c81
$0d:bc92  f0 bb		 beq $bc4f
$0d:bc94  64 a5		 stz $a5
$0d:bc96  ff d8 5f 5a   sbc $5a5fd8,x
$0d:bc9a  ad dd d5	  lda $d5dd
$0d:bc9d  e3 a2		 sbc $a2,s
$0d:bc9f  b2 6e		 lda ($6e)
$0d:bca1  56 ce		 lsr $ce,x
$0d:bca3  99 f9 86	  sta $86f9,y
$0d:bca6  c0 e8 58	  cpy #$58e8
$0d:bca9  19 0f c2	  ora $c20f,y
$0d:bcac  49 f8 b9	  eor #$b9f8
$0d:bcaf  7f 3f 1f eb   adc $eb1f3f,x
$0d:bcb3  ef fa 0d ff   sbc $ff0dfa
$0d:bcb7  f8			sed
$0d:bcb8  43 f0		 eor $f0,s
$0d:bcba  77 fd		 adc [$fd],y
$0d:bcbc  e5 ff		 sbc $ff
$0d:bcbe  11 78		 ora ($78),y
$0d:bcc0  f3 c7		 sbc ($c7,s),y
$0d:bcc2  fe 90 be	  inc $be90,x
$0d:bcc5  3c ff f9	  bit $f9ff,x
$0d:bcc8  03 80		 ora $80,s
$0d:bcca  7f df e5 07   adc $07e5df,x
$0d:bcce  00 15		 brk #$15
$0d:bcd0  fc 12 51	  jsr ($5112,x)
$0d:bcd3  cf ff 8f c7   cmp $c78fff
$0d:bcd7  38			sec
$0d:bcd8  ff d9 ef f8   sbc $f8efd9,x
$0d:bcdc  1f ff fb ff   ora $fffbff,x
$0d:bce0  20 83 c7	  jsr $c783
$0d:bce3  c0 02 0f	  cpy #$0f02
$0d:bce6  07 f8		 ora [$f8]
$0d:bce8  60			rts
$0d:bce9  00 07		 brk #$07
$0d:bceb  f8			sed
$0d:bcec  00 0c		 brk #$0c
$0d:bcee  ae 46 2f	  ldx $2f46
$0d:bcf1  0b			phd
$0d:bcf2  4d 86 d9	  eor $d986
$0d:bcf5  60			rts
$0d:bcf6  9b			txy
$0d:bcf7  cc 22 13	  cpy $1322
$0d:bcfa  08			php
$0d:bcfb  64 72		 stz $72
$0d:bcfd  07 07		 ora [$07]
$0d:bcff  97 d4		 sta [$d4],y
$0d:bd01  c7 e1		 cmp [$e1]
$0d:bd03  6f 88 db e2   adc $e2db88
$0d:bd07  13 78		 ora ($78,s),y
$0d:bd09  44 c2 1e	  mvp $1e,$c2
$0d:bd0c  3c 18 06	  bit $0618,x
$0d:bd0f  ab			plb
$0d:bd10  04 4f		 tsb $4f
$0d:bd12  0f 56 0a a5   ora $a50a56
$0d:bd16  02 c2		 cop #$c2
$0d:bd18  41 29		 eor ($29,x)
$0d:bd1a  14 cc		 trb $cc
$0d:bd1c  86 63		 stx $63
$0d:bd1e  c1 e0		 cmp ($e0,x)
$0d:bd20  f5 65		 sbc $65,x
$0d:bd22  0b			phd
$0d:bd23  e5 d2		 sbc $d2
$0d:bd25  96 61		 stx $61,y
$0d:bd27  2f 14 cd 86   and $86cd14
$0d:bd2b  62 c1 e0	  per $9def
$0d:bd2e  80 55		 bra $bd85
$0d:bd30  28			plp
$0d:bd31  06 f0		 asl $f0
$0d:bd33  a3 50		 lda $50,s
$0d:bd35  25 56		 and $56
$0d:bd37  89 5c a2	  bit #$a25c
$0d:bd3a  33 38		 and ($38,s),y
$0d:bd3c  87 47		 sta [$47]
$0d:bd3e  87 a1		 sta [$a1]
$0d:bd40  57 94		 eor [$94],y
$0d:bd42  1f c2 8f 38   ora $388fc2,x
$0d:bd46  b5 c5		 lda $c5,x
$0d:bd48  25 71		 and $71
$0d:bd4a  49 cc 19	  eor #$19cc
$0d:bd4d  96 04		 stx $04,y
$0d:bd4f  d0 ab		 bne $bcfc
$0d:bd51  51 b9		 eor ($b9),y
$0d:bd53  5c 24 88 44   jml $448824
$0d:bd57  a0 53 48	  ldy #$4853
$0d:bd5a  37 22		 and [$22],y
$0d:bd5c  19 10 8c	  ora $8c10,y
$0d:bd5f  70 3c		 bvs $bd9d
$0d:bd61  1f 6a 47 eb   ora $eb476a,x
$0d:bd65  88			dey
$0d:bd66  a1 0f		 lda ($0f,x)
$0d:bd68  94 33		 sty $33,x
$0d:bd6a  ed 08 e6	  sbc $e608
$0d:bd6d  4c 23 05	  jmp $0523
$0d:bd70  d0 80		 bne $bcf2
$0d:bd72  41 a0		 eor ($a0,x)
$0d:bd74  90 58		 bcc $bdce
$0d:bd76  0c 2a 11	  tsb $112a
$0d:bd79  16 89		 asl $89,x
$0d:bd7b  4f 64 d2 98   eor $98d264
$0d:bd7f  75 56		 adc $56,x
$0d:bd81  a7 29		 lda [$29]
$0d:bd83  97 3f		 sta [$3f],y
$0d:bd85  82 0e 8c	  brl $4996
$0d:bd88  18			clc
$0d:bd89  6c 02 33	  jmp ($3302)
$0d:bd8c  00 98		 brk #$98
$0d:bd8e  c0 27 91	  cpy #$9127
$0d:bd91  08			php
$0d:bd92  8c 02 a1	  sty $a102
$0d:bd95  30 dc		 bmi $bd73
$0d:bd97  5a			phy
$0d:bd98  3c 14 8a	  bit $8a14,x
$0d:bd9b  c4 23		 cpy $23
$0d:bd9d  21 90		 and ($90,x)
$0d:bd9f  b0 54		 bcs $bdf5
$0d:bda1  24 12		 bit $12
$0d:bda3  0d 06 83	  ora $8306
$0d:bda6  81 00		 sta ($00,x)
$0d:bda8  c8			iny
$0d:bda9  40			rti
$0d:bdaa  36 10		 rol $10,x
$0d:bdac  0f 84 03 c1   ora $c10384
$0d:bdb0  80 f0		 bra $bda2
$0d:bdb2  50 1b		 bvc $bdcf
$0d:bdb4  e1 c0		 sbc ($c0,x)
$0d:bdb6  c0 50 69	  cpy #$6950
$0d:bdb9  fa			plx
$0d:bdba  8c 5d 46	  sty $465d
$0d:bdbd  4f 4a 96 66   eor $66964a
$0d:bdc1  b2 72		 lda ($72)
$0d:bdc3  5b			tcd
$0d:bdc4  bc 0a 6d	  ldy $6d0a,x
$0d:bdc7  04 8f		 tsb $8f
$0d:bdc9  cc ef b7	  cpy $b7ef
$0d:bdcc  5f f7 eb fb   eor $fbebf7,x
$0d:bdd0  f7 ff		 sbc [$ff],y
$0d:bdd2  db			stp
$0d:bdd3  3f f0 8b fc   and $fc8bf0,x
$0d:bdd7  66 5f		 ror $5f
$0d:bdd9  12 86		 ora ($86)
$0d:bddb  f8			sed
$0d:bddc  27 fc		 and [$fc]
$0d:bdde  7f 3d 4e 47   adc $474e3d,x
$0d:bde2  ee e7 8b	  inc $8be7
$0d:bde5  42 61		 wdm #$61
$0d:bde7  3f d4 f3 e4   and $e4f3d4,x
$0d:bdeb  1b			tcs
$0d:bdec  f9 e7 8f	  sbc $8fe7,y
$0d:bdef  f1 df		 sbc ($df),y
$0d:bdf1  fe 06 03	  inc $0306,x
$0d:bdf4  ff e1 8f 71   sbc $718fe1,x
$0d:bdf8  bf 22 50 e3   lda $e35022,x
$0d:bdfc  5e 73 bd	  lsr $bd73,x
$0d:bdff  a9 6f 2a	  lda #$2a6f
$0d:be02  0f ea 8b fe   ora $fe8bea
$0d:be06  a7 7d		 lda [$7d]
$0d:be08  6a			ror a
$0d:be09  dd db 17	  cmp $17db,x
$0d:be0c  d6 95		 dec $95,x
$0d:be0e  fd a4 3c	  sbc $3ca4,x
$0d:be11  09 89 00	  ora #$0089
$0d:be14  6c 38 0f	  jmp ($0f38)
$0d:be17  0c 03 43	  tsb $4303
$0d:be1a  c0 1f 85	  cpy #$851f
$0d:be1d  05 d0		 ora $d0
$0d:be1f  1e f2 7b	  asl $7bf2,x
$0d:be22  7c 0b 07	  jmp ($070b,x)
$0d:be25  13 86		 ora ($86,s),y
$0d:be27  17 c2		 ora [$c2],y
$0d:be29  2f 08 31 c4   and $c43108
$0d:be2d  5a			phy
$0d:be2e  06 6f		 asl $6f
$0d:be30  c8			iny
$0d:be31  ec 00 ff	  cpx $ff00
$0d:be34  94 ef		 sty $ef,x
$0d:be36  8a			txa
$0d:be37  3e 29 ff	  rol $ff29,x
$0d:be3a  0a			asl a
$0d:be3b  6f ca 03 e0   adc $e003ca
$0d:be3f  4f e4 02 02   eor $0202e4
$0d:be43  af 08 44 26   lda $264408
$0d:be47  11 0b		 ora ($0b),y
$0d:be49  5a			phy
$0d:be4a  84 2a		 sty $2a
$0d:be4c  13 0c		 ora ($0c,s),y
$0d:be4e  86 ae		 stx $ae
$0d:be50  c2 3f		 rep #$3f
$0d:be52  00 5f		 brk #$5f
$0d:be54  84 5d		 sty $5d
$0d:be56  84 b1		 sty $b1
$0d:be58  36 50		 rol $50,x
$0d:be5a  c9 7b b3	  cmp #$b37b
$0d:be5d  8f 7e 4b f9   sta $f94b7e
$0d:be61  56 e1		 lsr $e1,x
$0d:be63  50 3f		 bvc $bea4
$0d:be65  90 5f		 bcc $bec6
$0d:be67  e6 02		 inc $02
$0d:be69  db			stp
$0d:be6a  28			plp
$0d:be6b  f3 74		 sbc ($74,s),y
$0d:be6d  a7 f6		 lda [$f6]
$0d:be6f  dd d4 ef	  cmp $efd4,x
$0d:be72  ab			plb
$0d:be73  3d fd c2	  and $c2fd,x
$0d:be76  fe fb 3a	  inc $3afb,x
$0d:be79  7f 6e 6f 9d   adc $9d6f6e,x
$0d:be7d  bd d8 23	  lda $23d8,x
$0d:be80  f3 b8		 sbc ($b8,s),y
$0d:be82  3c 72 07	  bit $0772,x
$0d:be85  0f 80 41 d5   ora $d54180
$0d:be89  e2 fa		 sep #$fa
$0d:be8b  39 fb 00	  and $00fb,y
$0d:be8e  5e b3 98	  lsr $98b3,x
$0d:be91  cc 76 f8	  cpy $f876
$0d:be94  73 df		 adc ($df,s),y
$0d:be96  e4 0b		 cpx $0b
$0d:be98  ff cf 9f fc   sbc $fc9fcf,x
$0d:be9c  21 f7		 and ($f7,x)
$0d:be9e  c8			iny
$0d:be9f  1a			inc a
$0d:bea0  fc 2c ff	  jsr ($ff2c,x)
$0d:bea3  f9 e7 fe	  sbc $fee7,y
$0d:bea6  07 ff		 ora [$ff]
$0d:bea8  80 09		 bra $beb3
$0d:beaa  0a			asl a
$0d:beab  fe c0 17	  inc $17c0,x
$0d:beae  b8			clv
$0d:beaf  40			rti
$0d:beb0  2c 3e 08	  bit $083e
$0d:beb3  34 fa		 bit $fa,x
$0d:beb5  19 03 7d	  ora $7d03,y
$0d:beb8  23 e8		 and $e8,s
$0d:beba  a3 ff		 lda $ff,s
$0d:bebc  f8			sed
$0d:bebd  0c fc 06	  tsb $06fc
$0d:bec0  23 77		 and $77,s
$0d:bec2  f0 4a		 beq $bf0e
$0d:bec4  26 10		 rol $10
$0d:bec6  2c a6 10	  bit $10a6
$0d:bec9  6f 1f 0f c7   adc $c70f1f
$0d:becd  f3 fd		 sbc ($fd,s),y
$0d:becf  78			sei
$0d:bed0  fe 0d db	  inc $db0d,x
$0d:bed3  00 6f		 brk #$6f
$0d:bed5  1d 06 02	  ora $0206,x
$0d:bed8  81 40		 sta ($40,x)
$0d:beda  a8			tay
$0d:bedb  50 25		 bvc $bf02
$0d:bedd  92 08		 sta ($08)
$0d:bedf  c4 62		 cpy $62
$0d:bee1  0f 07 d0 50   ora $50d007
$0d:bee5  0f e5 50 90   ora $9050e5
$0d:bee9  56 24		 lsr $24,x
$0d:beeb  12 f8		 ora ($f8)
$0d:beed  81 f0		 sta ($f0,x)
$0d:beef  60			rts
$0d:bef0  10 28		 bpl $bf1a
$0d:bef2  1c 16 03	  trb $0316
$0d:bef5  01 81		 ora ($81,x)
$0d:bef7  40			rti
$0d:bef8  46 c0		 lsr $c0
$0d:befa  36 07		 rol $07,x
$0d:befc  c9 c1		 cmp #$c1
$0d:befe  20 10 64	  jsr $6410
$0d:bf01  b8			clv
$0d:bf02  a5 c1		 lda $c1
$0d:bf04  28			plp
$0d:bf05  0f 94 a9 43   ora $43a994
$0d:bf09  a5 30		 lda $30
$0d:bf0b  f8			sed
$0d:bf0c  ec 1e 2b	  cpx $2b1e
$0d:bf0f  12 85		 ora ($85)
$0d:bf11  c0 e1		 cpy #$e1
$0d:bf13  50 88		 bvc $be9d
$0d:bf15  2c 12 15	  bit $1512
$0d:bf18  00 b8		 brk #$b8
$0d:bf1a  c0 26		 cpy #$26
$0d:bf1c  10 08		 bpl $bf26
$0d:bf1e  c4 02		 cpy $02
$0d:bf20  1a			inc a
$0d:bf21  c4 08		 cpy $08
$0d:bf23  0b			phd
$0d:bf24  dc 06 c0	  jml [$c006]
$0d:bf27  f5 03		 sbc $03,x
$0d:bf29  90 48		 bcc $bf73
$0d:bf2b  24 16		 bit $16
$0d:bf2d  0b			phd
$0d:bf2e  07 83		 ora [$83]
$0d:bf30  21 50		 and ($50,x)
$0d:bf32  a8			tay
$0d:bf33  6e 2d 1a	  ror $1a2d
$0d:bf36  0f 47 e2 91   ora $91e247
$0d:bf3a  c0 c0		 cpy #$c0
$0d:bf3c  70 20		 bvs $bf5e
$0d:bf3e  1c 0a 07	  trb $070a
$0d:bf41  80 e4		 bra $bf27
$0d:bf43  10 0c		 bpl $bf51
$0d:bf45  84 02		 sty $02
$0d:bf47  21 00		 and ($00,x)
$0d:bf49  d8			cld
$0d:bf4a  1b			tcs
$0d:bf4b  40			rti
$0d:bf4c  08			php
$0d:bf4d  30 18		 bmi $bf67
$0d:bf4f  34 11		 bit $11,x
$0d:bf51  1e 10 18	  asl $1810,x
$0d:bf54  22 44 20 50   jsl $502044
$0d:bf58  58			cli
$0d:bf59  19 18 20	  ora $2018,y
$0d:bf5c  af c1 83 c0   lda $c083c1
$0d:bf60  e0 ca		 cpx #$ca
$0d:bf62  60			rts
$0d:bf63  48			pha
$0d:bf64  04 09		 tsb $09
$0d:bf66  3e 02 70	  rol $7002,x
$0d:bf69  84 7f		 sty $7f
$0d:bf6b  e8			inx
$0d:bf6c  17 fd		 ora [$fd],y
$0d:bf6e  27 fe		 and [$fe]
$0d:bf70  41 9b		 eor ($9b,x)
$0d:bf72  a1 7e		 lda ($7e,x)
$0d:bf74  e8			inx
$0d:bf75  93 6c		 sta ($6c,s),y
$0d:bf77  96 7e		 stx $7e,y
$0d:bf79  7f c0 f9 c3   adc $c3f9c0,x
$0d:bf7d  33 3e		 and ($3e,s),y
$0d:bf7f  6a			ror a
$0d:bf80  47 de		 eor [$de]
$0d:bf82  fb			xce
$0d:bf83  c6 da		 dec $da
$0d:bf85  d3 b9		 cmp ($b9,s),y
$0d:bf87  3f eb 27 e2   and $e227eb,x
$0d:bf8b  d7 b6		 cmp [$b6],y
$0d:bf8d  8b			phb
$0d:bf8e  eb			xba
$0d:bf8f  aa			tax
$0d:bf90  fe ee bd	  inc $bdee,x
$0d:bf93  fa			plx
$0d:bf94  2f 7e 8f db   and $db8f7e
$0d:bf98  67 fe		 adc [$fe]
$0d:bf9a  df 7c f7 83   cmp $83f77c,x
$0d:bf9e  00 1f		 brk #$1f
$0d:bfa0  86 06		 stx $06
$0d:bfa2  01 91		 ora ($91,x)
$0d:bfa4  22 0e 0a 01   jsl $010a0e
$0d:bfa8  22 25 0f c7   jsl $c70f25
$0d:bfac  dc 4f 2f	  jml [$2f4f]
$0d:bfaf  87 bb		 sta [$bb]
$0d:bfb1  e5 ec		 sbc $ec
$0d:bfb3  2b			pld
$0d:bfb4  87 43		 sta [$43]
$0d:bfb6  9d c0 ef	  sta $efc0,x
$0d:bfb9  45 e1		 eor $e1
$0d:bfbb  05 f0		 ora $f0
$0d:bfbd  8f c0 23 c6   sta $c623c0
$0d:bfc1  43 9f		 eor $9f,s
$0d:bfc3  1a			inc a
$0d:bfc4  86 2d		 stx $2d
$0d:bfc6  03 37		 ora $37,s
$0d:bfc8  90 1c		 bcc $bfe6
$0d:bfca  00 e1		 brk #$e1
$0d:bfcc  0a			asl a
$0d:bfcd  83 c2		 sta $c2,s
$0d:bfcf  a0 d0		 ldy #$d0
$0d:bfd1  78			sei
$0d:bfd2  14 76		 trb $76
$0d:bfd4  00 7f		 brk #$7f
$0d:bfd6  26 28		 rol $28
$0d:bfd8  a1 0e		 lda ($0e,x)
$0d:bfda  0b			phd
$0d:bfdb  00 a4		 brk #$a4
$0d:bfdd  7e c1 e0	  ror $e0c1,x
$0d:bfe0  91 48		 sta ($48),y
$0d:bfe2  0f fe 1d fe   ora $fe1dfe
$0d:bfe6  80 fe		 bra $bfe6
$0d:bfe8  20 fe 08	  jsr $08fe
$0d:bfeb  ff 80 3e 17   sbc $173e80,x
$0d:bfef  cc 1f c2	  cpy $c21f
$0d:bff2  1e a0 0f	  asl $0fa0,x
$0d:bff5  0c 7f 2f	  tsb $2f7f
$0d:bff8  6f 85 c3 a2   adc $a2c385
$0d:bffc  50 68		 bvc $c066
$0d:bffe  a4 0a		 ldy $0a
$0d:c000  2a			rol a
$0d:c001  06 28		 asl $28
$0d:c003  2c 3a 0b	  bit $0b3a
$0d:c006  09 81		 ora #$81
$0d:c008  44 60 11	  mvp $11,$60
$0d:c00b  96 00		 stx $00,y
$0d:c00d  c6 20		 dec $20
$0d:c00f  10 a8		 bpl $bfb9
$0d:c011  04 21		 tsb $21
$0d:c013  90 30		 bcc $c045
$0d:c015  c8			iny
$0d:c016  04 53		 tsb $53
$0d:c018  e7 28		 sbc [$28]
$0d:c01a  f7 e4		 sbc [$e4],y
$0d:c01c  ae 78 8b	  ldx $8b78
$0d:c01f  fc 02 ff	  jsr ($ff02,x)
$0d:c022  e9 db		 sbc #$db
$0d:c024  e0 b2		 cpx #$b2
$0d:c026  d4 bf		 pei ($bf)
$0d:c028  36 3a		 rol $3a,x
$0d:c02a  fb			xce
$0d:c02b  d3 9e		 cmp ($9e,s),y
$0d:c02d  73 27		 adc ($27,s),y
$0d:c02f  fe 78 c7	  inc $c778,x
$0d:c032  7a			ply
$0d:c033  43 5c		 eor $5c,s
$0d:c035  95 da		 sta $da,x
$0d:c037  67 f1		 adc [$f1]
$0d:c039  99 f8 38	  sta $38f8,y
$0d:c03c  1d e7 01	  ora $01e7,x
$0d:c03f  81 c0		 sta ($c0,x)
$0d:c041  20 90 38	  jsr $3890
$0d:c044  74 06		 stz $06,x
$0d:c046  23 0f		 and $0f,s
$0d:c048  77 b4		 adc [$b4],y
$0d:c04a  01 ee		 ora ($ee,x)
$0d:c04c  10 78		 bpl $c0c6
$0d:c04e  03 f8		 ora $f8,s
$0d:c050  23 ee		 and $ee,s
$0d:c052  f0 84		 beq $bfd8
$0d:c054  41 ec		 eor ($ec,x)
$0d:c056  31 f8		 and ($f8),y
$0d:c058  e7 ff		 sbc [$ff]
$0d:c05a  07 7f		 ora [$7f]
$0d:c05c  f8			sed
$0d:c05d  7f e3 ff fc   adc $fcffe3,x
$0d:c061  0a			asl a
$0d:c062  48			pha
$0d:c063  1d e0 fe	  ora $fee0,x
$0d:c066  06 b0		 asl $b0
$0d:c068  24 95		 bit $95
$0d:c06a  2e 1a 8c	  rol $8c1a
$0d:c06d  40			rti
$0d:c06e  bc 35 98	  ldy $9835,x
$0d:c071  ca			dex
$0d:c072  bd 1e b1	  lda $b11e,x
$0d:c075  40			rti
$0d:c076  93 c8		 sta ($c8,s),y
$0d:c078  23 11		 and $11,s
$0d:c07a  88			dey
$0d:c07b  3c 1f 71	  bit $711f,x
$0d:c07e  48			pha
$0d:c07f  1f 86 f2 99   ora $99f286,x
$0d:c083  5f 93 d7 e4   eor $e4d793,x
$0d:c087  12 71		 ora ($71)
$0d:c089  d9 40 26	  cmp $2640,y
$0d:c08c  11 08		 ora ($08),y
$0d:c08e  9c 04 0c	  stz $0c04
$0d:c091  1c 0a 05	  trb $050a
$0d:c094  6e 13 09	  ror $0913
$0d:c097  80 50		 bra $c0e9
$0d:c099  20 10 28	  jsr $2810
$0d:c09c  04 d2		 tsb $d2
$0d:c09e  69 b3		 adc #$b3
$0d:c0a0  d9 c2 e1	  cmp $e1c2,y
$0d:c0a3  7c 0e 07	  jmp ($070e,x)
$0d:c0a6  6f b7 1b 8d   adc $8d1bb7
$0d:c0aa  d0 28		 bne $c0d4
$0d:c0ac  11 28		 ora ($28),y
$0d:c0ae  93 bc		 sta ($bc,s),y
$0d:c0b0  0b			phd
$0d:c0b1  21 37		 and ($37,x)
$0d:c0b3  8a			txa
$0d:c0b4  c5 63		 cmp $63
$0d:c0b6  96 d9		 stx $d9,y
$0d:c0b8  a4 da		 ldy $da
$0d:c0ba  55 24		 eor $24,x
$0d:c0bc  90 42		 bcc $c100
$0d:c0be  99 21 00	  sta $0021,y
$0d:c0c1  31 84		 and ($84),y
$0d:c0c3  ae 7f 23	  ldx $237f
$0d:c0c6  9f d0 ef f5   sta $f5efd0,x
$0d:c0ca  3b			tsc
$0d:c0cb  fc 7e 7f	  jsr ($7f7e,x)
$0d:c0ce  07 7f		 ora [$7f]
$0d:c0d0  09 6c		 ora #$6c
$0d:c0d2  32 10		 and ($10)
$0d:c0d4  0b			phd
$0d:c0d5  c5 c3		 cmp $c3
$0d:c0d7  31 70		 and ($70),y
$0d:c0d9  de 7b 3d	  dec $3d7b,x
$0d:c0dc  14 8d		 trb $8d
$0d:c0de  04 81		 tsb $81
$0d:c0e0  de 06 50	  dec $5006,x
$0d:c0e3  e8			inx
$0d:c0e4  74 31		 stz $31,x
$0d:c0e6  1f 88 67 f3   ora $f36788,x
$0d:c0ea  71 fc		 adc ($fc),y
$0d:c0ec  f8			sed
$0d:c0ed  7e 38 1e	  ror $1e38,x
$0d:c0f0  07 79		 ora [$79]
$0d:c0f2  48			pha
$0d:c0f3  66 37		 ror $37
$0d:c0f5  3a			dec a
$0d:c0f6  d5 36		 cmp $36,x
$0d:c0f8  0b			phd
$0d:c0f9  ea			nop
$0d:c0fa  e1 f5		 sbc ($f5,x)
$0d:c0fc  e0 b2		 cpx #$b2
$0d:c0fe  e9 73		 sbc #$73
$0d:c100  bd 24 30	  lda $3024,x
$0d:c103  0b			phd
$0d:c104  d4 02		 pei ($02)
$0d:c106  79 00 ff	  adc $ff00,y
$0d:c109  41 3f		 eor ($3f,x)
$0d:c10b  eb			xba
$0d:c10c  e0 a0		 cpx #$a0
$0d:c10e  78			sei
$0d:c10f  34 1b		 bit $1b,x
$0d:c111  08			php
$0d:c112  85 8a		 sta $8a
$0d:c114  c7 af		 cmp [$af]
$0d:c116  86 cd		 stx $cd
$0d:c118  fc 3b 98	  jsr ($983b,x)
$0d:c11b  8f 8b c4 8f   sta $8fc48b
$0d:c11f  25 70		 and $70
$0d:c121  7c 2c 1f	  jmp ($1f2c,x)
$0d:c124  20 68 40	  jsr $4068
$0d:c127  7d f0 1f	  adc $1ff0,x
$0d:c12a  ff 8a 03 02   sbc $02038a,x
$0d:c12e  82 14 80	  brl $4145
$0d:c131  ba			tsx
$0d:c132  05 30		 ora $30
$0d:c134  29 82		 and #$82
$0d:c136  fc e0 90	  jsr ($90e0,x)
$0d:c139  08			php
$0d:c13a  34 02		 bit $02,x
$0d:c13c  06 9f		 asl $9f
$0d:c13e  02 90		 cop #$90
$0d:c140  af d3 13 f2   lda $f213d3
$0d:c144  ff 40 b7 fc   sbc $fcb740,x
$0d:c148  cf fd fe c1   cmp $c1fefd
$0d:c14c  80 97		 bra $c0e5
$0d:c14e  fc 22 97	  jsr ($9722,x)
$0d:c151  38			sec
$0d:c152  2c 72 19	  bit $1972
$0d:c155  70 81		 bvs $c0d8
$0d:c157  40			rti
$0d:c158  61 90		 adc ($90,x)
$0d:c15a  0c 04 02	  tsb $0204
$0d:c15d  ff 80 cf d8   sbc $d8cf80,x
$0d:c161  29 f3		 and #$f3
$0d:c163  f8			sed
$0d:c164  9c 3f ff	  stz $ff3f
$0d:c167  dd ff ee	  cmp $eeff,x
$0d:c16a  ff 9f 8f 2f   sbc $2f8f9f,x
$0d:c16e  82 1d 01	  brl $c28e
$0d:c171  e1 4f		 sbc ($4f,x)
$0d:c173  a6 5c		 ldx $5c
$0d:c175  3e 44 3b	  rol $3b44,x
$0d:c178  85 00		 sta $00
$0d:c17a  c2 40		 rep #$40
$0d:c17c  20 ee 80	  jsr $80ee
$0d:c17f  80 7f		 bra $c200
$0d:c181  e0 1f		 cpx #$1f
$0d:c183  98			tya
$0d:c184  3f f3 ff f2   and $f2fff3,x
$0d:c188  fe 60 33	  inc $3360,x
$0d:c18b  92 08		 sta ($08)
$0d:c18d  e5 02		 sbc $02
$0d:c18f  71 00		 adc ($00),y
$0d:c191  fc 58 3e	  jsr ($3e58,x)
$0d:c194  18			clc
$0d:c195  05 70		 ora $70
$0d:c197  09 41		 ora #$41
$0d:c199  28			plp
$0d:c19a  10 4f		 bpl $c1eb
$0d:c19c  e3 90		 sbc $90,s
$0d:c19e  21 1c		 and ($1c,x)
$0d:c1a0  89 84		 bit #$84
$0d:c1a2  43 c1		 eor $c1,s
$0d:c1a4  20 e0 17	  jsr $17e0
$0d:c1a7  05 fc		 ora $fc
$0d:c1a9  0f 60 01 81   ora $810160
$0d:c1ad  c8			iny
$0d:c1ae  9f 0a 43 01   sta $01430a,x
$0d:c1b2  08			php
$0d:c1b3  20 48 0e	  jsr $0e48
$0d:c1b6  d2 1f		 cmp ($1f)
$0d:c1b8  fc 4b e3	  jsr ($e34b,x)
$0d:c1bb  09 fc		 ora #$fc
$0d:c1bd  61 bf		 adc ($bf,x)
$0d:c1bf  d6 0f		 dec $0f,x
$0d:c1c1  fc b7 cf	  jsr ($cfb7,x)
$0d:c1c4  12 b8		 ora ($b8)
$0d:c1c6  c5 a1		 cmp $a1
$0d:c1c8  d0 cf		 bne $c199
$0d:c1ca  9e 3e ff	  stz $ff3e,x
$0d:c1cd  47 df		 eor [$df]
$0d:c1cf  cc 79 f0	  cpy $f079
$0d:c1d2  ef 8e 62 fe   sbc $fe628e
$0d:c1d6  2b			pld
$0d:c1d7  08			php
$0d:c1d8  8c 3e 01	  sty $013e
$0d:c1db  10 88		 bpl $c165
$0d:c1dd  46 22		 lsr $22
$0d:c1df  d0 38		 bne $c219
$0d:c1e1  44 aa 69	  mvp $69,$aa
$0d:c1e4  60			rts
$0d:c1e5  82 08 c1	  brl $82f0
$0d:c1e8  fe 08 93	  inc $9308,x
$0d:c1eb  8e 30 82	  stx $8230
$0d:c1ee  10 c3		 bpl $c1b3
$0d:c1f0  04 4a		 tsb $4a
$0d:c1f2  67 29		 adc [$29]
$0d:c1f4  f6 dc		 inc $dc,x
$0d:c1f6  14 fe		 trb $fe
$0d:c1f8  ab			plb
$0d:c1f9  be 97 6a	  ldx $6a97,y
$0d:c1fc  39 f5 7e	  and $7ef5,y
$0d:c1ff  de 8a c3	  dec $c38a,x
$0d:c202  2c 8e 4c	  bit $4c8e
$0d:c205  61 f1		 adc ($f1,x)
$0d:c207  f8			sed
$0d:c208  0e 4a 01	  asl $014a
$0d:c20b  ce 80 cc	  dec $cc80
$0d:c20e  38			sec
$0d:c20f  12 4f		 ora ($4f)
$0d:c211  c6 7e		 dec $7e
$0d:c213  ff 23 8f ca   sbc $ca8f23,x
$0d:c217  a3 77		 lda $77,s
$0d:c219  b2 18		 lda ($18)
$0d:c21b  5f f2 17 fb   eor $fb17f2,x
$0d:c21f  6f bd 52 11   adc $1152bd
$0d:c223  3c fe 02	  bit $02fe,x
$0d:c226  ff 04 9f 89   sbc $899f04,x
$0d:c22a  80 02		 bra $c22e
$0d:c22c  3f f8 81 1c   and $1c81f8,x
$0d:c230  3f e9 70 23   and $2370e9,x
$0d:c234  04 3b		 tsb $3b
$0d:c236  fd 07 ff	  sbc $ff07,x
$0d:c239  df 3f 9e 3f   cmp $3f9e3f,x
$0d:c23d  fe 7f 3f	  inc $3f7f,x
$0d:c240  65 f0		 adc $f0
$0d:c242  ff ff fb 6c   sbc $6cfbff,x
$0d:c246  3c 04 10	  bit $1004,x
$0d:c249  30 30		 bmi $c27b
$0d:c24b  41 c7		 eor ($c7,x)
$0d:c24d  81 03		 sta ($03,x)
$0d:c24f  78			sei
$0d:c250  23 80		 and $80,s
$0d:c252  bd 60 68	  lda $6860,x
$0d:c255  63 84		 adc $84,s
$0d:c257  0b			phd
$0d:c258  ce 41 20	  dec $2041
$0d:c25b  1a			inc a
$0d:c25c  89 1c		 bit #$1c
$0d:c25e  4b			phk
$0d:c25f  a1 18		 lda ($18,x)
$0d:c261  8c 10 44	  sty $4410
$0d:c264  5e b1 88	  lsr $88b1,x
$0d:c267  40			rti
$0d:c268  f6 0a		 inc $0a,x
$0d:c26a  a6 69		 ldx $69
$0d:c26c  11 7a		 ora ($7a),y
$0d:c26e  50 20		 bvc $c290
$0d:c270  03 98		 ora $98,s
$0d:c272  37 9d		 and [$9d],y
$0d:c274  00 70		 brk #$70
$0d:c276  03 80		 ora $80,s
$0d:c278  2d 21 cc	  and $cc21
$0d:c27b  18			clc
$0d:c27c  00 bc		 brk #$bc
$0d:c27e  0c 02 54	  tsb $5402
$0d:c281  0f 8e c0 08   ora $08c08e
$0d:c285  64 31		 stz $31
$0d:c287  2a			rol a
$0d:c288  29 71		 and #$71
$0d:c28a  21 96		 and ($96,x)
$0d:c28c  bb			tyx
$0d:c28d  1d f1 d0	  ora $d0f1,x
$0d:c290  46 a6		 lsr $a6
$0d:c292  7b			tdc
$0d:c293  69 2f		 adc #$2f
$0d:c295  2b			pld
$0d:c296  15 30		 ora $30,x
$0d:c298  b0 44		 bcs $c2de
$0d:c29a  22 04 10 ff   jsl $ff1004
$0d:c29e  e3 bb		 sbc $bb,s
$0d:c2a0  f8			sed
$0d:c2a1  0e 64 03	  asl $0364
$0d:c2a4  b5 00		 lda $00,x
$0d:c2a6  b8			clv
$0d:c2a7  40			rti
$0d:c2a8  17 82		 ora [$82],y
$0d:c2aa  2f 1e fc 7a   and $7afc1e
$0d:c2ae  cb			wai
$0d:c2af  c0 ed		 cpy #$ed
$0d:c2b1  e3 b3		 sbc $b3,s
$0d:c2b3  b1 7f		 lda ($7f),y
$0d:c2b5  b6 ca		 ldx $ca,y
$0d:c2b7  f1 48		 sbc ($48),y
$0d:c2b9  88			dey
$0d:c2ba  4c 17 a3	  jmp $a317
$0d:c2bd  1e 00 05	  asl $0500,x
$0d:c2c0  c6 01		 dec $01
$0d:c2c2  f8			sed
$0d:c2c3  88			dey
$0d:c2c4  5f 26 0d c1   eor $c10d26,x
$0d:c2c8  75 44		 adc $44,x
$0d:c2ca  04 94		 tsb $94
$0d:c2cc  10 48		 bpl $c316
$0d:c2ce  1c 3a 03	  trb $033a
$0d:c2d1  11 87		 ora ($87),y
$0d:c2d3  bb			tyx
$0d:c2d4  d8			cld
$0d:c2d5  8c 10 08	  sty $0810
$0d:c2d8  3c 01 fc	  bit $fc01,x
$0d:c2db  11 f1		 ora ($f1),y
$0d:c2dd  d8			cld
$0d:c2de  c1 ec		 cmp ($ec,x)
$0d:c2e0  f1 f9		 sbc ($f9),y
$0d:c2e2  e7 ff		 sbc [$ff]
$0d:c2e4  1f 7f fa fd   ora $fdfa7f,x
$0d:c2e8  23 ff		 and $ff,s
$0d:c2ea  ff 07 fd dc   sbc $dcfd07,x
$0d:c2ee  2f e0 bf b7   and $b7bfe0
$0d:c2f2  81 bc		 sta ($bc,x)
$0d:c2f4  10 b1		 bpl $c2a7
$0d:c2f6  30 89		 bmi $c281
$0d:c2f8  45 db		 eor $db
$0d:c2fa  00 71		 brk #$71
$0d:c2fc  80 82		 bra $c280
$0d:c2fe  80 5f		 bra $c35f
$0d:c300  83 e6		 sta $e6,s
$0d:c302  7b			tdc
$0d:c303  78			sei
$0d:c304  1f 27 df f0   ora $f0df27,x
$0d:c308  b8			clv
$0d:c309  76 3b		 ror $3b,x
$0d:c30b  f1 cf		 sbc ($cf),y
$0d:c30d  ff 00 3d 32   sbc $323d00,x
$0d:c311  01 51		 ora ($51,x)
$0d:c313  fc 21 f8	  jsr ($f821,x)
$0d:c316  9b			txy
$0d:c317  ce c2 ff	  dec $ffc2
$0d:c31a  9c af f8	  stz $f8af
$0d:c31d  a3 ff		 lda $ff,s
$0d:c31f  48			pha
$0d:c320  5f 3a 7f fc   eor $fc7f3a,x
$0d:c324  04 07		 tsb $07
$0d:c326  fe 0d ff	  inc $ff0d,x
$0d:c329  43 aa		 eor $aa,s
$0d:c32b  10 15		 bpl $c342
$0d:c32d  42 1b		 wdm #$1b
$0d:c32f  0b			phd
$0d:c330  87 e2		 sta [$e2]
$0d:c332  7f ff cb e1   adc $e1cbff,x
$0d:c336  c2 a1		 rep #$a1
$0d:c338  0f ff d2 78   ora $78d2ff
$0d:c33c  34 f5		 bit $f5,x
$0d:c33e  10 c1		 bpl $c301
$0d:c340  d4 43		 pei ($43)
$0d:c342  78			sei
$0d:c343  53 17		 eor ($17,s),y
$0d:c345  fc ea 0d	  jsr ($0dea,x)
$0d:c348  e0 89		 cpx #$89
$0d:c34a  47 b4		 eor [$b4]
$0d:c34c  fa			plx
$0d:c34d  5f fc 0f 97   eor $970ffc,x
$0d:c351  cd cc 5e	  cmp $5ecc
$0d:c354  61 d1		 adc ($d1,x)
$0d:c356  e9 37 3b	  sbc #$3b37
$0d:c359  37 e7		 and [$e7],y
$0d:c35b  f0 ff		 beq $c35c
$0d:c35d  f4 95 80	  pea $8095
$0d:c360  40			rti
$0d:c361  4c 60 10	  jmp $1060
$0d:c364  68			pla
$0d:c365  07 86		 ora [$86]
$0d:c367  01 f1		 ora ($f1,x)
$0d:c369  80 4e		 bra $c3b9
$0d:c36b  38			sec
$0d:c36c  11 78		 ora ($78),y
$0d:c36e  9b			txy
$0d:c36f  bc 21 70	  ldy $7021,x
$0d:c372  88			dey
$0d:c373  21 64		 and ($64,x)
$0d:c375  09 80 42	  ora #$4280
$0d:c378  38			sec
$0d:c379  bc 2d fe	  ldy $fe2d,x
$0d:c37c  10 b7		 bpl $c335
$0d:c37e  ac 0f e3	  ldy $e30f
$0d:c381  01 80		 ora ($80,x)
$0d:c383  e0 70		 cpx #$70
$0d:c385  2c 12 0d	  bit $0d12
$0d:c388  c0 3e		 cpy #$3e
$0d:c38a  20 1c 0c	  jsr $0c1c
$0d:c38d  07 83		 ora [$83]
$0d:c38f  91 f0		 sta ($f0),y
$0d:c391  31 b4		 and ($b4),y
$0d:c393  06 0f		 asl $0f
$0d:c395  09 35 04	  ora #$0435
$0d:c398  0e 0e 6a	  asl $6a0e
$0d:c39b  03 28		 ora $28,s
$0d:c39d  c0 a0		 cpy #$a0
$0d:c39f  25 90		 and $90
$0d:c3a1  34 81		 bit $81,x
$0d:c3a3  c4 21		 cpy $21
$0d:c3a5  d0 18		 bne $c3bf
$0d:c3a7  44 02 a7	  mvp $a7,$02
$0d:c3aa  1f 84 6d af   ora $af6d84,x
$0d:c3ae  1c 6c de	  trb $de6c
$0d:c3b1  9a			txs
$0d:c3b2  21 0d		 and ($0d,x)
$0d:c3b4  d0 67		 bne $c41d
$0d:c3b6  6c dc d8	  jmp ($d8dc)
$0d:c3b9  7f 72 d1 07   adc $07d172,x
$0d:c3bd  e3 c0		 sbc $c0,s
$0d:c3bf  60			rts
$0d:c3c0  3c 3a 2f	  bit $2f3a,x
$0d:c3c3  0f c7 e7 b5   ora $b5e7c7
$0d:c3c7  f9 e6 7f	  sbc $7fe6,y
$0d:c3ca  fd 9d fd	  sbc $fd9d,x
$0d:c3cd  1e 19 eb	  asl $eb19,x
$0d:c3d0  f6 e2		 inc $e2,x
$0d:c3d2  ff b7 b3 fb   sbc $fbb3b7,x
$0d:c3d6  23 ff		 and $ff,s
$0d:c3d8  58			cli
$0d:c3d9  5f 26 72 9d   eor $9d7226,x
$0d:c3dd  28			plp
$0d:c3de  0f fd 9a 11   ora $119afd
$0d:c3e2  84 10		 sty $10
$0d:c3e4  aa			tax
$0d:c3e5  42 0c		 wdm #$0c
$0d:c3e7  aa			tax
$0d:c3e8  1f 1f fe 79   ora $79fe1f,x
$0d:c3ec  3c 57 83	  bit $8357,x
$0d:c3ef  04 27		 tsb $27
$0d:c3f1  3f 96 08 70   and $700896,x
$0d:c3f5  3f f8 34 10   and $1034f8,x
$0d:c3f9  f0 d0		 beq $c3cb
$0d:c3fb  c5 ff		 cmp $ff
$0d:c3fd  83 28		 sta $28,s
$0d:c3ff  8d 9a 11	  sta $119a
$0d:c402  b8			clv
$0d:c403  9c 4a 41	  stz $414a
$0d:c406  2b			pld
$0d:c407  97 5b		 sta [$5b],y
$0d:c409  a8			tay
$0d:c40a  91 58		 sta ($58),y
$0d:c40c  8c 26 13	  sty $1326
$0d:c40f  1d 8a c0	  ora $c08a,x
$0d:c412  a1 90		 lda ($90,x)
$0d:c414  f8			sed
$0d:c415  1c 7e 01	  trb $017e
$0d:c418  11 80		 ora ($80),y
$0d:c41a  4e e0 10	  lsr $10e0
$0d:c41d  f1 b8		 sbc ($b8),y
$0d:c41f  40			rti
$0d:c420  61 70		 adc ($70,x)
$0d:c422  17 c0		 ora [$c0],y
$0d:c424  07 02		 ora [$02]
$0d:c426  f1 28		 sbc ($28),y
$0d:c428  d6 61		 dec $61,x
$0d:c42a  29 10 cd	  and #$cd10
$0d:c42d  86 23		 stx $23
$0d:c42f  a1 d0		 lda ($d0,x)
$0d:c431  f4 6a 2b	  pea $2b6a
$0d:c434  97 4e		 sta [$4e],y
$0d:c436  04 03		 tsb $03
$0d:c438  a1 00		 lda ($00,x)
$0d:c43a  fc 60 05	  jsr ($0560,x)
$0d:c43d  c1 f0		 cmp ($f0,x)
$0d:c43f  15 87		 ora $87,x
$0d:c441  03 a1		 ora $a1,s
$0d:c443  80 c4		 bra $c409
$0d:c445  40			rti
$0d:c446  25 f1		 and $f1
$0d:c448  fb			xce
$0d:c449  d8			cld
$0d:c44a  e8			inx
$0d:c44b  2f f9 fb fd   and $fdfbf9
$0d:c44f  cb			wai
$0d:c450  e1 8f		 sbc ($8f,x)
$0d:c452  bf d9 fc 0f   lda $0ffcd9,x
$0d:c456  50 80		 bvc $c3d8
$0d:c458  4f d1 a0 01   eor $01a0d1
$0d:c45c  1f fc 3d 04   ora $043dfc,x
$0d:c460  29 30 52	  and #$5230
$0d:c463  80 38		 bra $c49d
$0d:c465  29 90 f9	  and #$f990
$0d:c468  0a			asl a
$0d:c469  08			php
$0d:c46a  7c df ee	  jmp ($eedf,x)
$0d:c46d  0f fe 7f 3f   ora $3f7ffe
$0d:c471  82 7f 14	  brl $d8f3
$0d:c474  a1 f0		 lda ($f0,x)
$0d:c476  51 1a		 eor ($1a),y
$0d:c478  04 93		 tsb $93
$0d:c47a  61 03		 adc ($03,x)
$0d:c47c  ff 92 c2 2d   sbc $2dc292,x
$0d:c480  0e 9c c1	  asl $c19c
$0d:c483  e5 31		 sbc $31
$0d:c485  98			tya
$0d:c486  fd fe 27	  sbc $27fe,x
$0d:c489  70 bb		 bvs $c446
$0d:c48b  c3 e8		 cmp $e8,s
$0d:c48d  00 00		 brk #$00
$0d:c48f  63 83		 adc $83,s
$0d:c491  04 27		 tsb $27
$0d:c493  f0 60		 beq $c4f5
$0d:c495  00 c3		 brk #$c3
$0d:c497  c0 45		 cpy #$45
$0d:c499  7f 96 c7 1e   adc $1ec796,x
$0d:c49d  21 18		 and ($18,x)
$0d:c49f  bf ff 2f f6   lda $f62fff,x
$0d:c4a3  3f 19 c4 2a   and $2ac419,x
$0d:c4a7  9c 7d f5	  stz $f57d
$0d:c4aa  fe 06 00	  inc $0006,x
$0d:c4ad  58			cli
$0d:c4ae  e2 00		 sep #$00
$0d:c4b0  67 08		 adc [$08]
$0d:c4b2  21 b9		 and ($b9,x)
$0d:c4b4  df f0 00 a1   cmp $a100f0,x
$0d:c4b8  16 86		 asl $86,x
$0d:c4ba  30 aa		 bmi $c466
$0d:c4bc  17 f4		 ora [$f4],y
$0d:c4be  a8			tay
$0d:c4bf  4c 5c e0	  jmp $e05c
$0d:c4c2  a8			tay
$0d:c4c3  51 68		 eor ($68),y
$0d:c4c5  1f c8 0e 16   ora $160ec8,x
$0d:c4c9  18			clc
$0d:c4ca  fc f6 0b	  jsr ($0bf6,x)
$0d:c4cd  1c 81 c3	  trb $c381
$0d:c4d0  60			rts
$0d:c4d1  6f 20 80 c0   adc $c08020
$0d:c4d5  13 47		 ora ($47,s),y
$0d:c4d7  3f 81 30 42   and $423081,x
$0d:c4db  1f 00 4b bc   ora $bc4b00,x
$0d:c4df  e6 71		 inc $71
$0d:c4e1  c7 3e		 cmp [$3e]
$0d:c4e3  07 fe		 ora [$fe]
$0d:c4e5  81 7f		 sta ($7f,x)
$0d:c4e7  eb			xba
$0d:c4e8  cf fd 91 cb   cmp $cb91fd
$0d:c4ec  cc 1d 44	  cpy $441d
$0d:c4ef  0b			phd
$0d:c4f0  10 41		 bpl $c533
$0d:c4f2  91 fc		 sta ($fc),y
$0d:c4f4  a0 6f		 ldy #$6f
$0d:c4f6  e0 51		 cpx #$51
$0d:c4f8  04 1f		 tsb $1f
$0d:c4fa  01 7c		 ora ($7c,x)
$0d:c4fc  88			dey
$0d:c4fd  7f a6 1f 6d   adc $6d1fa6,x
$0d:c501  85 db		 sta $db
$0d:c503  69 f2 aa	  adc #$aaf2
$0d:c506  5c b5 93 2b   jml $2b93b5
$0d:c50a  76 c2		 ror $c2,x
$0d:c50c  61 0c		 adc ($0c,x)
$0d:c50e  85 41		 sta $41
$0d:c510  21 90		 and ($90,x)
$0d:c512  27 18		 and [$18]
$0d:c514  43 a0		 eor $a0,s
$0d:c516  18			clc
$0d:c517  e8			inx
$0d:c518  07 39		 ora [$39]
$0d:c51a  d4 30		 pei ($30)
$0d:c51c  28			plp
$0d:c51d  14 06		 trb $06
$0d:c51f  06 98		 asl $98
$0d:c521  14 c8		 trb $c8
$0d:c523  3c 81 e4	  bit $e481,x
$0d:c526  10 78		 bpl $c5a0
$0d:c528  14 1d		 trb $1d
$0d:c52a  e2 2f		 sep #$2f
$0d:c52c  21 4c		 and ($4c,x)
$0d:c52e  83 c0		 sta $c0,s
$0d:c530  20 2e f0	  jsr $f02e
$0d:c533  82 41 20	  brl $e577
$0d:c536  39 0a e5	  and $e50a,y
$0d:c539  a2 1f		 ldx #$1f
$0d:c53b  b1 c3		 lda ($c3),y
$0d:c53d  d2 39		 cmp ($39)
$0d:c53f  f0 ff		 beq $c540
$0d:c541  84 ff		 sty $ff
$0d:c543  81 8f		 sta ($8f,x)
$0d:c545  bc d1 b8	  ldy $b8d1,x
$0d:c548  1e 7f c7	  asl $c77f,x
$0d:c54b  cb			wai
$0d:c54c  fb			xce
$0d:c54d  78			sei
$0d:c54e  ff cd 3f 78   sbc $783fcd,x
$0d:c552  0a			asl a
$0d:c553  02 68		 cop #$68
$0d:c555  28			plp
$0d:c556  33 89		 and ($89,s),y
$0d:c558  ff fe 3d 0f   sbc $0f3dfe,x
$0d:c55c  81 40		 sta ($40,x)
$0d:c55e  e1 10		 sbc ($10,x)
$0d:c560  c8			iny
$0d:c561  f4 7e 1b	  pea $1b7e
$0d:c564  01 89		 ora ($89,x)
$0d:c566  43 20		 eor $20,s
$0d:c568  31 e6		 and ($e6),y
$0d:c56a  58			cli
$0d:c56b  44 20 11	  mvp $11,$20
$0d:c56e  c8			iny
$0d:c56f  04 4d		 tsb $4d
$0d:c571  34 23		 bit $23,x
$0d:c573  c1 24		 cmp ($24,x)
$0d:c575  1c d7 d9	  trb $d9d7
$0d:c578  82 b7 54	  brl $1a32
$0d:c57b  77 f0		 adc [$f0],y
$0d:c57d  2b			pld
$0d:c57e  f4 37 69	  pea $6937
$0d:c581  d6 e0		 dec $e0,x
$0d:c583  c6 a9		 dec $a9
$0d:c585  3e db 25	  rol $25db,x
$0d:c588  4e 7f 19	  lsr $197f
$0d:c58b  9b			txy
$0d:c58c  c9 23		 cmp #$23
$0d:c58e  78			sei
$0d:c58f  18			clc
$0d:c590  fd 6e 0f	  sbc $0f6e,x
$0d:c593  3f 87 ed e1   and $e1ed87,x
$0d:c597  f9 b8 3d	  sbc $3db8,y
$0d:c59a  9e 3f 3b	  stz $3b3f,x
$0d:c59d  83 24		 sta $24,s
$0d:c59f  c1 49		 cmp ($49,x)
$0d:c5a1  33 f8		 and ($f8,s),y
$0d:c5a3  0a			asl a
$0d:c5a4  8a			txa
$0d:c5a5  fc 9e 79	  jsr ($799e,x)
$0d:c5a8  84 ff		 sty $ff
$0d:c5aa  a5 c3		 lda $c3
$0d:c5ac  87 ff		 sta [$ff]
$0d:c5ae  fe 73 0f	  inc $0f73,x
$0d:c5b1  9c 3e f9	  stz $f93e
$0d:c5b4  03 41		 ora $41,s
$0d:c5b6  04 63		 tsb $63
$0d:c5b8  ff c0 ff cf   sbc $cfffc0,x
$0d:c5bc  18			clc
$0d:c5bd  42 95		 wdm #$95
$0d:c5bf  08			php
$0d:c5c0  03 28		 ora $28,s
$0d:c5c2  e3 b1		 sbc $b1,s
$0d:c5c4  69 bc		 adc #$bc
$0d:c5c6  8a			txa
$0d:c5c7  65 50		 adc $50
$0d:c5c9  be d6 65	  ldx $65d6,y
$0d:c5cc  b2 58		 lda ($58)
$0d:c5ce  dc 36 2b	  jml [$2b36]
$0d:c5d1  1d 87 c2	  ora $c287,x
$0d:c5d4  21 30		 and ($30,x)
$0d:c5d6  08			php
$0d:c5d7  e9 fc		 sbc #$fc
$0d:c5d9  22 06 00 8d   jsl $8d0006
$0d:c5dd  c0 62		 cpy #$62
$0d:c5df  6f f0 80 9d   adc $9d80f0
$0d:c5e3  c3 ad		 cmp $ad,s
$0d:c5e5  a2 c5		 ldx #$c5
$0d:c5e7  6a			ror a
$0d:c5e8  7f da ab 25   adc $25abda,x
$0d:c5ec  12 a1		 ora ($a1)
$0d:c5ee  10 98		 bpl $c588
$0d:c5f0  44 37 18	  mvp $18,$37
$0d:c5f3  8b			phb
$0d:c5f4  85 e3		 sta $e3
$0d:c5f6  b9 80 ef	  lda $ef80,y
$0d:c5f9  62 3b 98	  per $5e37
$0d:c5fc  8d c4 03	  sta $03c4
$0d:c5ff  c0 e6		 cpy #$e6
$0d:c601  1f 86 03 c1   ora $c10386,x
$0d:c605  60			rts
$0d:c606  f8			sed
$0d:c607  43 f1		 eor $f1,s
$0d:c609  f7 fd		 sbc [$fd],y
$0d:c60b  e5 ff		 sbc $ff
$0d:c60d  6b			rtl
$0d:c60e  71 f7		 adc ($f7),y
$0d:c610  47 be		 eor [$be]
$0d:c612  b0 be		 bcs $c5d2
$0d:c614  64 f3		 stz $f3
$0d:c616  f9 03 52	  sbc $5203,y
$0d:c619  83 fc		 sta $fc,s
$0d:c61b  a1 df		 lda ($df,x)
$0d:c61d  f8			sed
$0d:c61e  0a			asl a
$0d:c61f  a0 60		 ldy #$60
$0d:c621  6a			ror a
$0d:c622  a0 bf		 ldy #$bf
$0d:c624  8b			phb
$0d:c625  43 cf		 eor $cf,s
$0d:c627  e7 9c		 sbc [$9c]
$0d:c629  7f f0 5f ea   adc $ea5ff0,x
$0d:c62d  05 ff		 ora $ff
$0d:c62f  fd ff cc	  sbc $ccff,x
$0d:c632  47 ee		 eor [$ee]
$0d:c634  7f 35 28 27   adc $272835,x
$0d:c638  c1 4a		 cmp ($4a,x)
$0d:c63a  00 70		 brk #$70
$0d:c63c  c0 29		 cpy #$29
$0d:c63e  07 c1		 ora [$c1]
$0d:c640  ff 86 7f eb   sbc $eb7f86,x
$0d:c644  13 8b		 ora ($8b,s),y
$0d:c646  1c 7d 36	  trb $367d
$0d:c649  16 58		 asl $58,x
$0d:c64b  e4 f2		 cpx $f2
$0d:c64d  07 3a		 ora [$3a]
$0d:c64f  39 0c 3a	  and $3a0c,y
$0d:c652  03 07		 ora $07,s
$0d:c654  06 0b		 asl $0b
$0d:c656  08			php
$0d:c657  20 73 f5	  jsr $f573
$0d:c65a  58			cli
$0d:c65b  20 52 13	  jsr $1352
$0d:c65e  09 86		 ora #$86
$0d:c660  c1 64		 cmp ($64,x)
$0d:c662  f0 29		 beq $c68d
$0d:c664  d4 62		 pei ($62)
$0d:c666  37 2f		 and [$2f],y
$0d:c668  9f cd 22 d1   sta $d122cd,x
$0d:c66c  08			php
$0d:c66d  94 40		 sty $40,x
$0d:c66f  9e 30 db	  stz $db30,x
$0d:c672  7d be 6e	  adc $6ebe,x
$0d:c675  c5 09		 cmp $09
$0d:c677  fc 3e 7e	  jsr ($7e3e,x)
$0d:c67a  58			cli
$0d:c67b  08			php
$0d:c67c  7c 7e 41	  jmp ($417e,x)
$0d:c67f  20 f4 4a	  jsr $4af4
$0d:c682  25 10		 and $10
$0d:c684  0a			asl a
$0d:c685  9d 0b 6d	  sta $6d0b,x
$0d:c688  f4 d6 7e	  pea $7ed6
$0d:c68b  3f 55 2a a4   and $a42a55,x
$0d:c68f  10 de		 bpl $c66f
$0d:c691  3e 8f c7	  rol $c78f,x
$0d:c694  e3 7f		 sbc $7f,s
$0d:c696  ff 97 7f b5   sbc $b57f97,x
$0d:c69a  ff ff e7 fb   sbc $fbe7ff,x
$0d:c69e  f1 fc		 sbc ($fc),y
$0d:c6a0  80 23		 bra $c6c5
$0d:c6a2  cd 96 10	  cmp $1096
$0d:c6a5  68			pla
$0d:c6a6  14 36		 trb $36
$0d:c6a8  09 1b		 ora #$1b
$0d:c6aa  84 c5		 sty $c5
$0d:c6ac  e2 68		 sep #$68
$0d:c6ae  f4 4a 0c	  pea $0c4a
$0d:c6b1  1e 07 0f	  asl $0f07,x
$0d:c6b4  83 c7		 sta $c7,s
$0d:c6b6  e1 f1		 sbc ($f1,x)
$0d:c6b8  f8			sed
$0d:c6b9  c4 22		 cpy $22
$0d:c6bb  10 8f		 bpl $c64c
$0d:c6bd  18			clc
$0d:c6be  84 42		 sty $42
$0d:c6c0  51 20		 eor ($20),y
$0d:c6c2  d5 68		 cmp $68,x
$0d:c6c4  b3 d8		 lda ($d8,s),y
$0d:c6c6  89 14		 bit #$14
$0d:c6c8  8a			txa
$0d:c6c9  30 bf		 bmi $c68a
$0d:c6cb  14 78		 trb $78
$0d:c6cd  42 23		 wdm #$23
$0d:c6cf  11 e9		 ora ($e9),y
$0d:c6d1  f5 77		 sbc $77,x
$0d:c6d3  ff 7f ff c7   sbc $c7ff7f,x
$0d:c6d7  27 d6		 and [$d6]
$0d:c6d9  6d c6 da	  adc $dac6
$0d:c6dc  71 ce		 adc ($ce),y
$0d:c6de  b0 53		 bcs $c733
$0d:c6e0  ac 1c ef	  ldy $ef1c
$0d:c6e3  07 19		 ora [$19]
$0d:c6e5  b0 3a		 bcs $c721
$0d:c6e7  6f 07 3a 00   adc $003a07
$0d:c6eb  df 0c f3 88   cmp $88f30c,x
$0d:c6ef  63 ce		 adc $ce,s
$0d:c6f1  65 82		 adc $82
$0d:c6f3  aa			tax
$0d:c6f4  02 0f		 cop #$0f
$0d:c6f6  01 87		 ora ($87,x)
$0d:c6f8  40			rti
$0d:c6f9  e3 f0		 sbc $f0,s
$0d:c6fb  68			pla
$0d:c6fc  f4 2a 33	  pea $332a
$0d:c6ff  09 83		 ora #$83
$0d:c701  bd c2 11	  lda $11c2,x
$0d:c704  03 84		 ora $84,s
$0d:c706  41 e1		 eor ($e1,x)
$0d:c708  70 48		 bvs $c752
$0d:c70a  a4 22		 ldy $22
$0d:c70c  13 10		 ora ($10,s),y
$0d:c70e  8b			phb
$0d:c70f  c0 07		 cpy #$07
$0d:c711  61 11		 adc ($11,x)
$0d:c713  87 ef		 sta [$ef]
$0d:c715  b0 31		 bcs $c748
$0d:c717  8f bf d3 ff   sta $ffd3bf
$0d:c71b  9e ff 73	  stz $73ff,x
$0d:c71e  cd 41 db	  cmp $db41
$0d:c721  cb			wai
$0d:c722  fb			xce
$0d:c723  30 ff		 bmi $c724
$0d:c725  c6 58		 dec $58
$0d:c727  63 ef		 adc $ef,s
$0d:c729  f1 38		 sbc ($38),y
$0d:c72b  7c 36 07	  jmp ($0736,x)
$0d:c72e  c7 80		 cmp [$80]
$0d:c730  48			pha
$0d:c731  f8			sed
$0d:c732  11 0f		 ora ($0f),y
$0d:c734  00 ac		 brk #$ac
$0d:c736  20 11 f0	  jsr $f011
$0d:c739  68			pla
$0d:c73a  0c 46 0e	  tsb $0e46
$0d:c73d  35 08		 and $08,x
$0d:c73f  84 0e		 sty $0e
$0d:c741  05 01		 ora $01
$0d:c743  80 40		 bra $c785
$0d:c745  63 10		 adc $10,s
$0d:c747  71 f9		 adc ($f9),y
$0d:c749  02 c0		 cop #$c0
$0d:c74b  16 11		 asl $11,x
$0d:c74d  e8			inx
$0d:c74e  09 24		 ora #$24
$0d:c750  23 f0		 and $f0,s
$0d:c752  08			php
$0d:c753  b6 ca		 ldx $ca,y
$0d:c755  5f fd e5 fd   eor $fde5fd,x
$0d:c759  aa			tax
$0d:c75a  d5 d9		 cmp $d9,x
$0d:c75c  5c 3b 2b a6   jml $a62b3b
$0d:c760  e5 6c		 sbc $6c
$0d:c762  e9 9f		 sbc #$9f
$0d:c764  9e 6c 0e	  stz $0e6c,x
$0d:c767  85 81		 sta $81
$0d:c769  88			dey
$0d:c76a  f8			sed
$0d:c76b  34 9f		 bit $9f,x
$0d:c76d  8f 97 f2 f1   sta $f1f297
$0d:c771  fe be ff	  inc $ffbe,x
$0d:c774  a0 df		 ldy #$df
$0d:c776  f8			sed
$0d:c777  44 12 09	  mvp $09,$12
$0d:c77a  02 85		 cop #$85
$0d:c77c  42 60		 wdm #$60
$0d:c77e  b0 c8		 bcs $c748
$0d:c780  14 19		 trb $19
$0d:c782  4e 10 01	  lsr $0110
$0d:c785  d0 c3		 bne $c74a
$0d:c787  a1 d0		 lda ($d0,x)
$0d:c789  f8			sed
$0d:c78a  7c 1e 1e	  jmp ($1e1e,x)
$0d:c78d  a9 05		 lda #$05
$0d:c78f  38			sec
$0d:c790  41 07		 eor ($07,x)
$0d:c792  43 03		 eor $03,s
$0d:c794  80 23		 bra $c7b9
$0d:c796  86 03		 stx $03
$0d:c798  4c a6 6c	  jmp $6ca6
$0d:c79b  66 dd		 ror $dd
$0d:c79d  58			cli
$0d:c79e  cc be 17	  cpy $17be
$0d:c7a1  8e c7 59	  stx $59c7
$0d:c7a4  3e 63 c0	  rol $c063,x
$0d:c7a7  3c 06 4f	  bit $4f06,x
$0d:c7aa  8f cf f7 fb   sta $fbf7cf
$0d:c7ae  bf ff 3f c5   lda $c53fff,x
$0d:c7b2  f7 e7		 sbc [$e7],y
$0d:c7b4  0f ff ff 7f   ora $7fffff
$0d:c7b8  8a			txa
$0d:c7b9  f2 fd		 sbc ($fd)
$0d:c7bb  fe 7f 5f	  inc $5f7f,x
$0d:c7be  8f b7 cb 99   sta $99cbb7
$0d:c7c2  c4 9c		 cpy $9c
$0d:c7c4  42 3f		 wdm #$3f
$0d:c7c6  ff c5 f9 7f   sbc $7ff9c5,x
$0d:c7ca  bf 0c 50 fe   lda $fe500c,x
$0d:c7ce  7c 3f 1c	  jmp ($1c3f,x)
$0d:c7d1  0f 84 01 6e   ora $6e0184
$0d:c7d5  0c f1 fd	  tsb $fdf1
$0d:c7d8  7d 3e 1f	  adc $1f3e,x
$0d:c7db  cf a7 63 91   cmp $9163a7
$0d:c7df  b0 c8		 bcs $c7a9
$0d:c7e1  58			cli
$0d:c7e2  24 0c		 bit $0c
$0d:c7e4  53 64		 eor ($64,s),y
$0d:c7e6  17 c3		 ora [$c3],y
$0d:c7e8  e1 c0		 sbc ($c0,x)
$0d:c7ea  f0 60		 beq $c84c
$0d:c7ec  38			sec
$0d:c7ed  10 0b		 bpl $c7fa
$0d:c7ef  0c 7e 76	  tsb $767e
$0d:c7f2  44 18 7c	  mvp $7c,$18
$0d:c7f5  00 f4		 brk #$f4
$0d:c7f7  03 c0		 ora $c0,s
$0d:c7f9  7d 1c fc	  adc $fc1c,x
$0d:c7fc  5e 10 07	  lsr $0710,x
$0d:c7ff  ac e7 f3	  ldy $f3e7
$0d:c802  f3 88		 sbc ($88,s),y
$0d:c804  05 9f		 ora $9f
$0d:c806  cf 0b fc 77   cmp $77fc0b
$0d:c80a  e7 ff		 sbc [$ff]
$0d:c80c  08			php
$0d:c80d  7d f2 06	  adc $06f2,x
$0d:c810  4d 0b 07	  eor $070b
$0d:c813  fc 40 11	  jsr ($1140,x)
$0d:c816  8f fc 1f ff   sta $ff1ffc
$0d:c81a  00 13		 brk #$13
$0d:c81c  05 fc		 ora $fc
$0d:c81e  02 30		 cop #$30
$0d:c820  73 d0		 adc ($d0,s),y
$0d:c822  be 90 64	  ldx $6490,y
$0d:c825  c3 1d		 cmp $1d,s
$0d:c827  fa			plx
$0d:c828  43 3c		 eor $3c,s
$0d:c82a  31 ff		 and ($ff),y
$0d:c82c  f4 04 3a	  pea $3a04
$0d:c82f  03 87		 ora $87,s
$0d:c831  13 10		 ora ($10,s),y
$0d:c833  74 06		 stz $06,x
$0d:c835  3a			dec a
$0d:c836  8e 29 04	  stx $0429
$0d:c839  02 31		 cop #$31
$0d:c83b  08			php
$0d:c83c  8a			txa
$0d:c83d  4d 0e 2f	  eor $2f0e
$0d:c840  20 98 22	  jsr $2298
$0d:c843  41 7a		 eor ($7a,x)
$0d:c845  13 c7		 ora ($c7,s),y
$0d:c847  d8			cld
$0d:c848  02 0a		 cop #$0a
$0d:c84a  02 08		 cop #$08
$0d:c84c  04 a8		 tsb $a8
$0d:c84e  40			rti
$0d:c84f  e0 49		 cpx #$49
$0d:c851  b0 83		 bcs $c7d6
$0d:c853  24 c9		 bit $c9
$0d:c855  2a			rol a
$0d:c856  40			rti
$0d:c857  71 81		 adc ($81),y
$0d:c859  c1 60		 cmp ($60,x)
$0d:c85b  70 d1		 bvs $c82e
$0d:c85d  88			dey
$0d:c85e  40			rti
$0d:c85f  68			pla
$0d:c860  b5 fb		 lda $fb,x
$0d:c862  b6 b3		 ldx $b3,y
$0d:c864  2b			pld
$0d:c865  59 b5 c3	  eor $c3b5,y
$0d:c868  b2 ba		 lda ($ba)
$0d:c86a  69 56		 adc #$56
$0d:c86c  4e a3 c9	  lsr $c9a3
$0d:c86f  18			clc
$0d:c870  86 23		 stx $23
$0d:c872  a7 d3		 lda [$d3]
$0d:c874  f3 f9		 sbc ($f9,s),y
$0d:c876  bf ff 0f f5   lda $f50fff,x
$0d:c87a  e3 fd		 sbc $fd,s
$0d:c87c  7c ff cf	  jmp ($cfff,x)
$0d:c87f  84 c3		 sty $c3
$0d:c881  e3 ff		 sbc $ff,s
$0d:c883  95 02		 sta $02,x
$0d:c885  d1 9f		 cmp ($9f),y
$0d:c887  f0 48		 beq $c8d1
$0d:c889  38			sec
$0d:c88a  34 0d		 bit $0d,x
$0d:c88c  f6 02		 inc $02,x
$0d:c88e  ec 2e 0f	  cpx $0f2e
$0d:c891  c4 33		 cpy $33
$0d:c893  e1 e0		 sbc ($e0,x)
$0d:c895  c0 40		 cpy #$40
$0d:c897  31 f1		 and ($f1),y
$0d:c899  f9 fc fe	  sbc $fefc,y
$0d:c89c  ff 7f ff fe   sbc $feff7f,x
$0d:c8a0  3f f0 a8 c4   and $c4a8f0,x
$0d:c8a4  16 23		 asl $23,x
$0d:c8a6  09 8c		 ora #$8c
$0d:c8a8  c4 63		 cpy $63
$0d:c8aa  f0 89		 beq $c835
$0d:c8ac  bc 82 f7	  ldy $f782,x
$0d:c8af  0a			asl a
$0d:c8b0  bc 41 6f	  ldy $6f41,x
$0d:c8b3  90 78		 bcc $c92d
$0d:c8b5  fc 3a 3f	  jsr ($3f3a,x)
$0d:c8b8  16 87		 asl $87,x
$0d:c8ba  c7 22		 cmp [$22]
$0d:c8bc  71 69		 adc ($69),y
$0d:c8be  4d 16 7d	  eor $7d16
$0d:c8c1  17 b7		 ora [$b7],y
$0d:c8c3  cc e9 f9	  cpy $f9e9
$0d:c8c6  3f 76 0f dd   and $dd0f76,x
$0d:c8ca  23 ef		 and $ef,s
$0d:c8cc  41 7b		 eor ($7b,x)
$0d:c8ce  12 5f		 ora ($5f)
$0d:c8d0  c5 17		 cmp $17
$0d:c8d2  31 8d		 and ($8d),y
$0d:c8d4  f8			sed
$0d:c8d5  06 c2		 asl $c2
$0d:c8d7  61 c0		 adc ($c0,x)
$0d:c8d9  0f 84 83 81   ora $818384
$0d:c8dd  62 c0 50	  per $19a0
$0d:c8e0  b0 1e		 bcs $c900
$0d:c8e2  28			plp
$0d:c8e3  04 0b		 tsb $0b
$0d:c8e5  80 2b		 bra $c912
$0d:c8e7  0a			asl a
$0d:c8e8  67 72		 adc [$72]
$0d:c8ea  d7 63		 cmp [$63],y
$0d:c8ec  9b			txy
$0d:c8ed  41 f5		 eor ($f5,x)
$0d:c8ef  94 fa		 sty $fa,x
$0d:c8f1  66 3f		 ror $3f
$0d:c8f3  31 1f		 and ($1f),y
$0d:c8f5  cc 7f ec	  cpy $ec7f
$0d:c8f8  1b			tcs
$0d:c8f9  f9 1c 7f	  sbc $7f1c,y
$0d:c8fc  39 7f 76	  and $767f,y
$0d:c8ff  87 c3		 sta [$c3]
$0d:c901  ff f1 ff 78   sbc $78fff1,x
$0d:c905  7f d0 3f e6   adc $e63fd0,x
$0d:c909  8b			phb
$0d:c90a  fb			xce
$0d:c90b  89 f9		 bit #$f9
$0d:c90d  c2 fe		 rep #$fe
$0d:c90f  25 10		 and $10
$0d:c911  83 fd		 sta $fd,s
$0d:c913  22 7e 4b 5f   jsl $5f4b7e
$0d:c917  33 53		 and ($53,s),y
$0d:c919  ce 96 f2	  dec $f296
$0d:c91c  a7 9c		 lda [$9c]
$0d:c91e  02 f8		 cop #$f8
$0d:c920  5f 30 1b 9a   eor $9a1b30,x
$0d:c924  01 94		 ora ($94,x)
$0d:c926  26 3c		 rol $3c
$0d:c928  03 48		 ora $48,s
$0d:c92a  5c 70 09 10   jml $100970
$0d:c92e  83 41		 sta $41,s
$0d:c930  a0 50 18	  ldy #$1850
$0d:c933  22 fc 20 f0   jsl $f020fc
$0d:c937  38			sec
$0d:c938  64 12		 stz $12
$0d:c93a  21 1c		 and ($1c,x)
$0d:c93c  8b			phb
$0d:c93d  ab			plb
$0d:c93e  85 bc		 sta $bc
$0d:c940  08			php
$0d:c941  24 87		 bit $87
$0d:c943  c3 de		 cmp $de,s
$0d:c945  c1 1f		 cmp ($1f,x)
$0d:c947  89 fb 3d	  bit #$3dfb
$0d:c94a  75 1d		 adc $1d,x
$0d:c94c  7c ba 9f	  jmp ($9fba,x)
$0d:c94f  97 d5		 sta [$d5],y
$0d:c951  cb			wai
$0d:c952  69 b7 ba	  adc #$bab7
$0d:c955  d7 a6		 cmp [$a6],y
$0d:c957  d3 c7		 cmp ($c7,s),y
$0d:c959  cf df f7 bf   cmp $bff7df
$0d:c95d  ce f3 88	  dec $88f3
$0d:c960  3c 1d 1f	  bit $1f1d,x
$0d:c963  06 23		 asl $23
$0d:c965  c1 07		 cmp ($07,x)
$0d:c967  c0 57 20	  cpy #$2057
$0d:c96a  6e a0 75	  ror $75a0
$0d:c96d  06 fe		 asl $fe
$0d:c96f  7e b3 0e	  ror $0eb3,x
$0d:c972  fe 7e cf	  inc $cf7e,x
$0d:c975  47 9c		 eor [$9c]
$0d:c977  48			pha
$0d:c978  21 f0		 and ($f0,x)
$0d:c97a  8f fb ac 1d   sta $1dacfb
$0d:c97e  61 3f		 adc ($3f,x)
$0d:c980  61 85		 adc ($85,x)
$0d:c982  fe 3f 3f	  inc $3f3f,x
$0d:c985  7f 81 dc 20   adc $20dc81,x
$0d:c989  0b			phd
$0d:c98a  12 5b		 ora ($5b)
$0d:c98c  85 fe		 sta $fe
$0d:c98e  bf 37 93 c6   lda $c69337,x
$0d:c992  22 10 78 24   jsl $247810
$0d:c996  02 01		 cop #$01
$0d:c998  ff 60 03 18   sbc $180360,x
$0d:c99c  a3 f1		 lda $f1,s
$0d:c99e  f4 48 40	  pea $4048
$0d:c9a1  0e c0 ec	  asl $ecc0
$0d:c9a4  23 a8		 and $a8,s
$0d:c9a6  44 d1 61	  mvp $61,$d1
$0d:c9a9  3f a3 cf f7   and $f7cfa3,x
$0d:c9ad  97 cb		 sta [$cb],y
$0d:c9af  37 9f		 and [$9f],y
$0d:c9b1  9f 3f 76 0b   sta $0b763f,x
$0d:c9b5  34 19		 bit $19,x
$0d:c9b7  60			rts
$0d:c9b8  fe 0b fc	  inc $fc0b,x
$0d:c9bb  0f ff 18 ff   ora $ff18ff
$0d:c9bf  b7 81		 lda [$81],y
$0d:c9c1  ba			tsx
$0d:c9c2  10 88		 bpl $c94c
$0d:c9c4  04 72		 tsb $72
$0d:c9c6  10 11		 bpl $c9d9
$0d:c9c8  06 e8		 asl $e8
$0d:c9ca  45 22		 eor $22
$0d:c9cc  81 11		 sta ($11,x)
$0d:c9ce  8a			txa
$0d:c9cf  37 42		 and [$42],y
$0d:c9d1  38			sec
$0d:c9d2  21 30		 and ($30,x)
$0d:c9d4  78			sei
$0d:c9d5  88			dey
$0d:c9d6  44 52 0e	  mvp $0e,$52
$0d:c9d9  c3 76		 cmp $76,s
$0d:c9db  0c c2 1e	  tsb $1ec2
$0d:c9de  c4 0c		 cpy $0c
$0d:c9e0  35 ff		 and $ff,x
$0d:c9e2  c5 e0		 cmp $e0
$0d:c9e4  17 b0		 ora [$b0],y
$0d:c9e6  14 7f		 trb $7f
$0d:c9e8  ed e0 8f	  sbc $8fe0
$0d:c9eb  92 81		 sta ($81)
$0d:c9ed  d8			cld
$0d:c9ee  38			sec
$0d:c9ef  2b			pld
$0d:c9f0  e5 fb		 sbc $fb
$0d:c9f2  ff e0 ff fa   sbc $faffe0,x
$0d:c9f6  fc 77 fb	  jsr ($fb77,x)
$0d:c9f9  ff 8f c6 ec   sbc $ecc68f,x
$0d:c9fd  3f f1 24 a3   and $a324f1,x
$0d:ca01  9f fc 01 a0   sta $a001fc,x
$0d:ca05  6b			rtl
$0d:ca06  f4 f3 78	  pea $78f3
$0d:ca09  4b			phk
$0d:ca0a  e4 f2		 cpx $f2
$0d:ca0c  f9 1c 4e	  sbc $4e1c,y
$0d:ca0f  21 0c		 and ($0c,x)
$0d:ca11  86 40		 stx $40
$0d:ca13  dd 63 5f	  cmp $5f63,x
$0d:ca16  97 9f		 sta [$9f],y
$0d:ca18  c2 5f		 rep #$5f
$0d:ca1a  17 97		 ora [$97],y
$0d:ca1c  c4 e2		 cpy $e2
$0d:ca1e  67 94		 adc [$94]
$0d:ca20  75 04		 adc $04,x
$0d:ca22  26 1f		 rol $1f
$0d:ca24  0d 83 c0	  ora $c083
$0d:ca27  e0 b0 68	  cpx #$68b0
$0d:ca2a  34 06		 bit $06,x
$0d:ca2c  07 01		 ora [$01]
$0d:ca2e  80 41		 bra $ca71
$0d:ca30  a0 90 d8	  ldy #$d890
$0d:ca33  22 68 20 30   jsl $302068
$0d:ca37  97 71		 sta [$71],y
$0d:ca39  29 86 13	  and #$1386
$0d:ca3c  04 81		 tsb $81
$0d:ca3e  43 24		 eor $24,s
$0d:ca40  9e 09 9d	  stz $9d09,x
$0d:ca43  cb			wai
$0d:ca44  39 ff 84	  and $84ff,y
$0d:ca47  ff 2b 5c 3d   sbc $3d5c2b,x
$0d:ca4b  2e 67 59	  rol $5967
$0d:ca4e  91 8d		 sta ($8d),y
$0d:ca50  68			pla
$0d:ca51  da			phx
$0d:ca52  81 8d		 sta ($8d,x)
$0d:ca54  ff d0 77 fa   sbc $fa77d0,x
$0d:ca58  3a			dec a
$0d:ca59  fc f3 fe	  jsr ($fef3,x)
$0d:ca5c  55 02		 eor $02,x
$0d:ca5e  a8			tay
$0d:ca5f  5f 7f da fa   eor $fada7f,x
$0d:ca63  44 7f a1	  mvp $a1,$7f
$0d:ca66  3c d1 dc	  bit $dcd1,x
$0d:ca69  e9 be ec	  sbc #$ecbe
$0d:ca6c  b7 6e		 lda [$6e],y
$0d:ca6e  51 78		 eor ($78),y
$0d:ca70  8b			phb
$0d:ca71  d4 35		 pei ($35)
$0d:ca73  ff 0f c7 c3   sbc $c3c70f,x
$0d:ca77  c1 e0		 cmp ($e0,x)
$0d:ca79  e0 70 70	  cpx #$7070
$0d:ca7c  18			clc
$0d:ca7d  50 08		 bvc $ca87
$0d:ca7f  f3 e0		 sbc ($e0,s),y
$0d:ca81  11 87		 ora ($87),y
$0d:ca83  48			pha
$0d:ca84  10 91		 bpl $ca17
$0d:ca86  34 12		 bit $12,x
$0d:ca88  39 04 5e	  and $5e04,y
$0d:ca8b  11 13		 ora ($13),y
$0d:ca8d  9a			txs
$0d:ca8e  4a			lsr a
$0d:ca8f  5e 0d 32	  lsr $320d,x
$0d:ca92  98			tya
$0d:ca93  cf 67 53 e9   cmp $e95367
$0d:ca97  e4 78		 cpx $78
$0d:ca99  90 08		 bcc $caa3
$0d:ca9b  e0 9f c6	  cpx #$c69f
$0d:ca9e  3f 16 7f fe   and $fe7f16,x
$0d:caa2  3f e1 3f e0   and $e03fe1,x
$0d:caa6  66 ef		 ror $ef
$0d:caa8  be 1f 04	  ldx $041f,y
$0d:caab  3c 6c 38	  bit $386c,x
$0d:caae  7b			tdc
$0d:caaf  f9 24 78	  sbc $7824,y
$0d:cab2  0f 41 be 13   ora $13be41
$0d:cab6  42 c3		 wdm #$c3
$0d:cab8  6f e0 9a 02   adc $029ae0
$0d:cabc  0f fe e0 f8   ora $f8e0fe
$0d:cac0  65 df		 adc $df
$0d:cac2  08			php
$0d:cac3  3f e3 e7 fc   and $fce7e3,x
$0d:cac7  fc e6 1d	  jsr ($1de6,x)
$0d:caca  20 df 0f	  jsr $0fdf
$0d:cacd  f4 fb ff	  pea $fffb
$0d:cad0  1f 9f c3 e1   ora $e1c39f,x
$0d:cad4  ff 78 3f ec   sbc $ec3f78,x
$0d:cad8  f8			sed
$0d:cad9  18			clc
$0d:cada  0a			asl a
$0d:cadb  07 82		 ora [$82]
$0d:cadd  01 d0		 ora ($d0,x)
$0d:cadf  90 7a		 bcc $cb5b
$0d:cae1  21 1f		 and ($1f,x)
$0d:cae3  8c c5 f3	  sty $f3c5
$0d:cae6  c9 5c c6	  cmp #$c65c
$0d:cae9  4f 89 e1 00   eor $00e189
$0d:caed  f0 48		 beq $cb37
$0d:caef  2e 11 09	  rol $0911
$0d:caf2  c4 03		 cpy $03
$0d:caf4  31 80		 and ($80),y
$0d:caf6  e6 1a		 inc $1a
$0d:caf8  43 85		 eor $85,s
$0d:cafa  e4 7f		 cpx $7f
$0d:cafc  96 03		 stx $03,y
$0d:cafe  01 40		 ora ($40,x)
$0d:cb00  a0 60 24	  ldy #$2460
$0d:cb03  34 1d		 bit $1d,x
$0d:cb05  8e 4a b1	  stx $b14a
$0d:cb08  43 97		 eor $97,s
$0d:cb0a  bf cc e6 1c   lda $1ce6cc,x
$0d:cb0e  0e 07 87	  asl $8707
$0d:cb11  85 f1		 sta $f1
$0d:cb13  f7 fc		 sbc [$fc],y
$0d:cb15  7e 9f 95	  ror $959f,x
$0d:cb18  08			php
$0d:cb19  41 63		 eor ($63,x)
$0d:cb1b  f2 0b		 sbc ($0b)
$0d:cb1d  e5 27		 sbc $27
$0d:cb1f  e3 9b		 sbc $9b,s
$0d:cb21  d5 4e		 cmp $4e,x
$0d:cb23  e4 13		 cpx $13
$0d:cb25  fa			plx
$0d:cb26  b7 8e		 lda [$8e],y
$0d:cb28  c6 4e		 dec $4e
$0d:cb2a  07 d8		 ora [$d8]
$0d:cb2c  44 ec f0	  mvp $f0,$ec
$0d:cb2f  6f 3d 13 dd   adc $dd133d
$0d:cb33  cc f6 66	  cpy $66f6
$0d:cb36  b9 9a 2e	  lda $2e9a,y
$0d:cb39  e8			inx
$0d:cb3a  94 3c		 sty $3c,x
$0d:cb3c  7f f8 0d fe   adc $fe0df8,x
$0d:cb40  d9 97 ee	  cmp $ee97,y
$0d:cb43  4b			phk
$0d:cb44  34 95		 bit $95,x
$0d:cb46  48			pha
$0d:cb47  de 13 49	  dec $4913,x
$0d:cb4a  2f 1d 04 33   and $33041d
$0d:cb4e  e1 80		 sbc ($80,x)
$0d:cb50  29 06 1e	  and #$1e06
$0d:cb53  67 3f		 adc [$3f]
$0d:cb55  9d df ef	  sta $efdf,x
$0d:cb58  7f fe c0 98   adc $98c0fe,x
$0d:cb5c  20 14 08	  jsr $0814
$0d:cb5f  06 83		 asl $83
$0d:cb61  01 10		 ora ($10,x)
$0d:cb63  f0 50		 beq $cbb5
$0d:cb65  2f 1a 09 c6   and $c6091a
$0d:cb69  c2 79		 rep #$79
$0d:cb6b  30 fe		 bmi $cb6b
$0d:cb6d  03 c0		 ora $c0,s
$0d:cb6f  50 16		 bvc $cb87
$0d:cb71  02 08		 cop #$08
$0d:cb73  19 c3 c1	  ora $c1c3,y
$0d:cb76  c8			iny
$0d:cb77  f8			sed
$0d:cb78  71 3f		 adc ($3f),y
$0d:cb7a  14 4d		 trb $4d
$0d:cb7c  c7 e6		 cmp [$e6]
$0d:cb7e  ff df 9f fc   sbc $fc9fdf,x
$0d:cb82  e1 f6		 sbc ($f6,x)
$0d:cb84  98			tya
$0d:cb85  c8			iny
$0d:cb86  84 23		 sty $23
$0d:cb88  b0 32		 bcs $cbbc
$0d:cb8a  00 20		 brk #$20
$0d:cb8c  04 4c		 tsb $4c
$0d:cb8e  02 40		 cop #$40
$0d:cb90  bf c1 a7 f0   lda $f0a7c1,x
$0d:cb94  08			php
$0d:cb95  fc 00 80	  jsr ($8000,x)
$0d:cb98  10 11		 bpl $cbab
$0d:cb9a  48			pha
$0d:cb9b  4b			phk
$0d:cb9c  26 94		 rol $94
$0d:cb9e  9e ae aa	  stz $aaae,x
$0d:cba1  45 1e		 eor $1e
$0d:cba3  84 20		 sty $20
$0d:cba5  08			php
$0d:cba6  30 50		 bmi $cbf8
$0d:cba8  89 e4 ab	  bit #$abe4
$0d:cbab  ff dd ff 89   sbc $89ffdd,x
$0d:cbaf  02 79		 cop #$79
$0d:cbb1  3c 0b b0	  bit $b00b,x
$0d:cbb4  60			rts
$0d:cbb5  81 81		 sta ($81,x)
$0d:cbb7  04 27		 tsb $27
$0d:cbb9  04 3e		 tsb $3e
$0d:cbbb  27 0f		 and [$0f]
$0d:cbbd  9c 3e cc	  stz $cc3e
$0d:cbc0  64 60		 stz $60
$0d:cbc2  a0 87 81	  ldy #$8187
$0d:cbc5  c6 7f		 dec $7f
$0d:cbc7  0f 9f de 60   ora $60de9f
$0d:cbcb  f1 3b		 sbc ($3b),y
$0d:cbcd  9d 1a 7d	  sta $7d1a,x
$0d:cbd0  78			sei
$0d:cbd1  83 d4		 sta $d4,s
$0d:cbd3  e6 76		 inc $76
$0d:cbd5  78			sei
$0d:cbd6  fc f0 70	  jsr ($70f0,x)
$0d:cbd9  13 f0		 ora ($f0,s),y
$0d:cbdb  18			clc
$0d:cbdc  43 2f		 eor $2f,s
$0d:cbde  eb			xba
$0d:cbdf  30 30		 bmi $cc11
$0d:cbe1  91 7c		 sta ($7c),y
$0d:cbe3  4c 01 08	  jmp $0801
$0d:cbe6  84 46		 sty $46
$0d:cbe8  0e 21 0c	  asl $0c21
$0d:cbeb  8c 44 22	  sty $2244
$0d:cbee  93 43		 sta ($43,s),y
$0d:cbf0  c0 c4 26	  cpy #$26c4
$0d:cbf3  0a			asl a
$0d:cbf4  00 80		 brk #$80
$0d:cbf6  46 10		 lsr $10
$0d:cbf8  23 1c		 and $1c,s
$0d:cbfa  84 21		 sty $21
$0d:cbfc  82 78 1f	  brl $eb77
$0d:cbff  08			php
$0d:cc00  64 f2		 stz $f2
$0d:cc02  17 09		 ora [$09],y
$0d:cc04  81 40		 sta ($40,x)
$0d:cc06  a0 b1 18	  ldy #$18b1
$0d:cc09  b4 42		 ldy $42,x
$0d:cc0b  33 16		 and ($16,s),y
$0d:cc0d  83 43		 sta $43,s
$0d:cc0f  21 90		 and ($90,x)
$0d:cc11  a8			tay
$0d:cc12  24 3d		 bit $3d
$0d:cc14  32 11		 and ($11)
$0d:cc16  d8			cld
$0d:cc17  74 3a		 stz $3a,x
$0d:cc19  3f 0f 52 0c   and $0c520f,x
$0d:cc1d  0e 1f 09	  asl $091f
$0d:cc20  87 c1		 sta [$c1]
$0d:cc22  61 d6		 adc ($d6,x)
$0d:cc24  de 64 1b	  dec $1b64,x
$0d:cc27  b7 bc		 lda [$bc],y
$0d:cc29  d6 cc		 dec $cc,x
$0d:cc2b  ea			nop
$0d:cc2c  f1 b9		 sbc ($b9),y
$0d:cc2e  c5 67		 cmp $67
$0d:cc30  8d c6 dc	  sta $dcc6
$0d:cc33  6a			ror a
$0d:cc34  33 db		 and ($db,s),y
$0d:cc36  2b			pld
$0d:cc37  c4 aa		 cpy $aa
$0d:cc39  e1 4b		 sbc ($4b,x)
$0d:cc3b  80 62		 bra $cc9f
$0d:cc3d  20 fc 7d	  jsr $7dfc
$0d:cc40  fc ff ff	  jsr ($ffff,x)
$0d:cc43  7f ff dd 7f   adc $7fddff,x
$0d:cc47  78			sei
$0d:cc48  0e fe 33	  asl $33fe
$0d:cc4b  7f 68 f7 d6   adc $d6f768,x
$0d:cc4f  63 d3		 adc $d3,s
$0d:cc51  19 f5 82	  ora $82f5,y
$0d:cc54  fd 42 be	  sbc $be42,x
$0d:cc57  60			rts
$0d:cc58  bf 9a 08 fd   lda $fd089a,x
$0d:cc5c  02 7f		 cop #$7f
$0d:cc5e  11 ff		 ora ($ff),y
$0d:cc60  78			sei
$0d:cc61  7f dc 3f e6   adc $e63fdc,x
$0d:cc65  1f f1 8f f8   ora $f88ff1,x
$0d:cc69  47 fc		 eor [$fc]
$0d:cc6b  10 a9		 bpl $cc16
$0d:cc6d  24 56		 bit $56
$0d:cc6f  25 0a		 and $0a
$0d:cc71  8c c0 a3	  sty $a3c0
$0d:cc74  d0 12		 bne $cc88
$0d:cc76  50 3e		 bvc $ccb6
$0d:cc78  0a			asl a
$0d:cc79  3f 1f 27 04   and $04271f,x
$0d:cc7d  7e 0f 1f	  ror $1f0f,x
$0d:cc80  88			dey
$0d:cc81  c3 e1		 cmp $e1,s
$0d:cc83  10 78		 bpl $ccfd
$0d:cc85  64 0e		 stz $0e
$0d:cc87  1d 01 89	  ora $8901,x
$0d:cc8a  c3 27		 cmp $27,s
$0d:cc8c  f8			sed
$0d:cc8d  0d c7 de	  ora $dec7
$0d:cc90  b1 7b		 lda ($7b),y
$0d:cc92  d7 4f		 cmp [$4f],y
$0d:cc94  aa			tax
$0d:cc95  f1 fd		 sbc ($fd),y
$0d:cc97  5e 3e 97	  lsr $973e,x
$0d:cc9a  cc 8b fd	  cpy $fd8b
$0d:cc9d  19 61 0f	  ora $0f61,y
$0d:cca0  ff e5 fd fc   sbc $fcfde5,x
$0d:cca4  df 9f 9f f1   cmp $f19f9f,x
$0d:cca8  73 fe		 adc ($fe,s),y
$0d:ccaa  4c 3f 90	  jmp $903f
$0d:ccad  8f e6 3e 1d   sta $1d3ee6
$0d:ccb1  03 e1		 ora $e1,s
$0d:ccb3  c0 3c 38	  cpy #$383c
$0d:ccb6  7b			tdc
$0d:ccb7  b7 ff		 lda [$ff],y
$0d:ccb9  19 df e2	  ora $e2df,y
$0d:ccbc  60			rts
$0d:ccbd  a8			tay
$0d:ccbe  be 09 38	  ldx $3809,y
$0d:ccc1  94 3c		 sty $3c,x
$0d:ccc3  5f df 87 ff   eor $ff87df,x
$0d:ccc7  fd f8 ba	  sbc $baf8,x
$0d:ccca  7e 37 17	  ror $1737,x
$0d:cccd  c9 c5 f2	  cmp #$f2c5
$0d:ccd0  31 3c		 and ($3c),y
$0d:ccd2  c4 4f		 cpy $4f
$0d:ccd4  b5 13		 lda $13,x
$0d:ccd6  e8			inx
$0d:ccd7  44 7b 11	  mvp $11,$7b
$0d:ccda  9a			txs
$0d:ccdb  90 6c		 bcc $cd49
$0d:ccdd  ac 1f 29	  ldy $291f
$0d:cce0  27 cb		 and [$cb]
$0d:cce2  49 f2 e0	  eor #$e0f2
$0d:cce5  79 8b e1	  adc $e18b,y
$0d:cce8  e4 f9		 cpx $f9
$0d:ccea  59 3e 54	  eor $543e,y
$0d:cced  cf 94 3a e1   cmp $e13a94
$0d:ccf1  1e b0 57	  asl $57b0,x
$0d:ccf4  a4 1b		 ldy $1b
$0d:ccf6  8c 7d 43	  sty $437d
$0d:ccf9  8f 2c f3 c4   sta $c4f32c
$0d:ccfd  2e 70 ab	  rol $ab70
$0d:cd00  dc 06 7d	  jml [$7d06]
$0d:cd03  02 9e		 cop #$9e
$0d:cd05  40			rti
$0d:cd06  23 b7		 and $b7,s
$0d:cd08  2f ee e6 fd   and $fde6ee
$0d:cd0c  98			tya
$0d:cd0d  bf d3 27 f4   lda $f427d3,x
$0d:cd11  49 fc 82	  eor #$82fc
$0d:cd14  3d 35 84	  and $8435,x
$0d:cd17  46 a0		 lsr $a0
$0d:cd19  18			clc
$0d:cd1a  08			php
$0d:cd1b  05 82		 ora $82
$0d:cd1d  c3 fd		 cmp $fd,s
$0d:cd1f  cf 49 3c d5   cmp $d53c49
$0d:cd23  ae 1e 97	  ldx $971e
$0d:cd26  33 ac		 and ($ac,s),y
$0d:cd28  c8			iny
$0d:cd29  c6 b4		 dec $b4
$0d:cd2b  7c 1f fe	  jmp ($fe1f,x)
$0d:cd2e  8f bf 1d c1   sta $c11dbf
$0d:cd32  e6 6f		 inc $6f
$0d:cd34  f3 cf		 sbc ($cf,s),y
$0d:cd36  fd f9 50	  sbc $50f9,x
$0d:cd39  37 df		 and [$df],y
$0d:cd3b  f5 a7		 sbc $a7,x
$0d:cd3d  45 14		 eor $14
$0d:cd3f  f9 75 ae	  sbc $ae75,y
$0d:cd42  7c af df	  jmp ($dfaf,x)
$0d:cd45  2f 73 cd 9e   and $9ecd73
$0d:cd49  d1 77		 cmp ($77),y
$0d:cd4b  b6 5c		 ldx $5c,y
$0d:cd4d  ef 73 fd cd   sbc $cdfd73
$0d:cd51  ff 63 7f d6   sbc $d67f63,x
$0d:cd55  4c fe 9a	  jmp $9afe
$0d:cd58  3f 22 8f fc   and $fc8f22,x
$0d:cd5c  a1 f3		 lda ($f3,x)
$0d:cd5e  28			plp
$0d:cd5f  7e 02 f9	  ror $f902,x
$0d:cd62  10 ff		 bpl $cd63
$0d:cd64  4c 3e d7	  jmp $d73e
$0d:cd67  4b			phk
$0d:cd68  94 53		 sty $53,x
$0d:cd6a  25 46		 and $46
$0d:cd6c  c0 4b b8	  cpy #$b84b
$0d:cd6f  1b			tcs
$0d:cd70  ee 04 42	  inc $4204
$0d:cd73  59 0a 82	  eor $820a,y
$0d:cd76  43 20		 eor $20,s
$0d:cd78  58			cli
$0d:cd79  e8			inx
$0d:cd7a  07 ba		 ora [$ba]
$0d:cd7c  01 7e		 ora ($7e,x)
$0d:cd7e  c0 3a 42	  cpy #$423a
$0d:cd81  7d c0 80	  adc $80c0,x
$0d:cd84  3b			tsc
$0d:cd85  e6 03		 inc $03
$0d:cd87  01 81		 ora ($81,x)
$0d:cd89  c0 9d f4	  cpy #$f49d
$0d:cd8c  fa			plx
$0d:cd8d  27 79		 and [$79]
$0d:cd8f  41 20		 eor ($20,x)
$0d:cd91  91 78		 sta ($78),y
$0d:cd93  85 7e		 sta $7e
$0d:cd95  8f f8 cc 78   sta $78ccf8
$0d:cd99  2c 18 0c	  bit $0c18
$0d:cd9c  03 bc		 ora $bc,s
$0d:cd9e  a0 70 78	  ldy #$7870
$0d:cda1  7c 7e 7f	  jmp ($7f7e,x)
$0d:cda4  7f bc 7e 3c   adc $3c7ebc,x
$0d:cda8  1e 00 e8	  asl $e800,x
$0d:cdab  5f ef f9 9c   eor $9cf9ef,x
$0d:cdaf  12 9c		 ora ($9c)
$0d:cdb1  38			sec
$0d:cdb2  73 cf		 adc ($cf,s),y
$0d:cdb4  f4 00 70	  pea $7000
$0d:cdb7  98			tya
$0d:cdb8  0f fd f3 ff   ora $fff3fd
$0d:cdbc  00 21		 brk #$21
$0d:cdbe  00 dc		 brk #$dc
$0d:cdc0  26 03		 rol $03
$0d:cdc2  84 d7		 sty $d7
$0d:cdc4  e3 c9		 sbc $c9,s
$0d:cdc6  e1 b7		 sbc ($b7,x)
$0d:cdc8  c3 d4		 cmp $d4,s
$0d:cdca  e8			inx
$0d:cdcb  75 ca		 adc $ca,x
$0d:cdcd  04 9e		 tsb $9e
$0d:cdcf  41 18		 eor ($18,x)
$0d:cdd1  8c 41 e0	  sty $e041
$0d:cdd4  fb			xce
$0d:cdd5  fa			plx
$0d:cdd6  79 7c 68	  adc $687c,y
$0d:cdd9  f5 f9		 sbc $f9,x
$0d:cddb  1d 7e 41	  ora $417e,x
$0d:cdde  27 2d		 and [$2d]
$0d:cde0  94 02		 sty $02,x
$0d:cde2  21 30		 and ($30,x)
$0d:cde4  94 48		 sty $48,x
$0d:cde6  0e 21 2c	  asl $2c21
$0d:cde9  90 4f		 bcc $ce3a
$0d:cdeb  25 07		 and $07
$0d:cded  10 37		 bpl $ce26
$0d:cdef  84 22		 sty $22
$0d:cdf1  31 0c		 and ($0c),y
$0d:cdf3  9e 47 10	  stz $1047,x
$0d:cdf6  0e 7f 08	  asl $087f
$0d:cdf9  04 61		 tsb $61
$0d:cdfb  de f0 28	  dec $28f0,x
$0d:cdfe  0c 09 30	  tsb $3009
$0d:ce01  10 17		 bpl $ce1a
$0d:ce03  7b			tdc
$0d:ce04  c0 d4 eb	  cpy #$ebd4
$0d:ce07  53 8f		 eor ($8f,s),y
$0d:ce09  c2 36		 rep #$36
$0d:ce0b  d1 8f		 cmp ($8f),y
$0d:ce0d  35 af		 and $af,x
$0d:ce0f  ed e0 fe	  sbc $fee0
$0d:ce12  d8			cld
$0d:ce13  3d b2 6f	  and $6fb2,x
$0d:ce16  6c bf d9	  jmp ($d9bf)
$0d:ce19  68			pla
$0d:ce1a  83 f1		 sta $f1,s
$0d:ce1c  e0 32 1e	  cpx #$1e32
$0d:ce1f  1c 17 e7	  trb $e717
$0d:ce22  03 fb		 ora $fb,s
$0d:ce24  c6 fe		 dec $fe
$0d:ce26  f1 3b		 sbc ($3b),y
$0d:ce28  fc 4e 7e	  jsr ($7e4e,x)
$0d:ce2b  ef 80 f0 e0   sbc $e0f080
$0d:ce2f  1d d4 1d	  ora $1dd4,x
$0d:ce32  0e 07 00	  asl $0007
$0d:ce35  56 10		 lsr $10,x
$0d:ce37  c8			iny
$0d:ce38  f8			sed
$0d:ce39  50 20		 bvc $ce5b
$0d:ce3b  11 f8		 ora ($f8),y
$0d:ce3d  8a			txa
$0d:ce3e  c0 26 f2	  cpy #$f226
$0d:ce41  0b			phd
$0d:ce42  dc 2a f1	  jml [$f12a]
$0d:ce45  05 be		 ora $be
$0d:ce47  40			rti
$0d:ce48  63 d0		 adc $d0,s
$0d:ce4a  a8			tay
$0d:ce4b  ec 46 1d	  cpx $1d46
$0d:ce4e  1c 89 c5	  trb $c589
$0d:ce51  a5 35		 lda $35
$0d:ce53  59 74 5e	  eor $5e74,y
$0d:ce56  df 33 a7 c2   cmp $c2a733,x
$0d:ce5a  ff d0 30 80   sbc $8030d0,x
$0d:ce5e  7b			tdc
$0d:ce5f  a0 bd 8b	  ldy #$8bbd
$0d:ce62  2d 60 2a	  and $2a60
$0d:ce65  18			clc
$0d:ce66  df 80 6c 38   cmp $386c80,x
$0d:ce6a  13 cf		 ora ($cf,s),y
$0d:ce6c  c4 02		 cpy $02
$0d:ce6e  e1 80		 sbc ($80,x)
$0d:ce70  f1 40		 sbc ($40),y
$0d:ce72  34 5c		 bit $5c,x
$0d:ce74  01 28		 ora ($28,x)
$0d:ce76  50 b0		 bvc $ce28
$0d:ce78  02 b0		 cop #$b0
$0d:ce7a  f4 4b fd	  pea $fd4b
$0d:ce7d  32 fe		 and ($fe)
$0d:ce7f  48			pha
$0d:ce80  c8			iny
$0d:ce81  fb			xce
$0d:ce82  33 f1		 and ($f1,s),y
$0d:ce84  c9 44 27	  cmp #$2744
$0d:ce87  83 f0		 sta $f0,s
$0d:ce89  8a			txa
$0d:ce8a  4e 08 65	  lsr $6508
$0d:ce8d  04 24		 tsb $24
$0d:ce8f  1f d3 c5 c4   ora $c4c5d3,x
$0d:ce93  f9 14 5b	  sbc $5b14,y
$0d:ce96  85 f0		 sta $f0
$0d:ce98  2d 84 7a	  and $7a84
$0d:ce9b  40			rti
$0d:ce9c  5f 49 f4 00   eor $00f449,x
$0d:cea0  ce 90 b8	  dec $b890
$0d:cea3  cc 0a 1f	  cpy $1f0a
$0d:cea6  01 8c		 ora ($8c,x)
$0d:cea8  c1 a2		 cmp ($a2,x)
$0d:ceaa  10 98		 bpl $ce44
$0d:ceac  34 1a		 bit $1a,x
$0d:ceae  19 0c 85	  ora $850c,y
$0d:ceb1  41 21		 eor ($21,x)
$0d:ceb3  f1 68		 sbc ($68),y
$0d:ceb5  04 22		 tsb $22
$0d:ceb7  0f 16 87 c3   ora $c38716
$0d:cebb  e3 e8		 sbc $e8,s
$0d:cebd  60			rts
$0d:cebe  81 c3		 sta ($c3,x)
$0d:cec0  e1 30		 sbc ($30,x)
$0d:cec2  f8			sed
$0d:cec3  2c 3a d3	  bit $d33a
$0d:cec6  ce 83 76	  dec $7683
$0d:cec9  b7 9e		 lda [$9e],y
$0d:cecb  c9 9f 5f	  cmp #$5f9f
$0d:cece  35 b8		 and $b8,x
$0d:ced0  94 f9		 sty $f9,x
$0d:ced2  b4 d9		 ldy $d9,x
$0d:ced4  8d 46 7b	  sta $7b46
$0d:ced7  65 7c		 adc $7c
$0d:ced9  95 5c		 sta $5c,x
$0d:cedb  69 68 00	  adc #$0068
$0d:cede  c3 d1		 cmp $d1,s
$0d:cee0  f7 f1		 sbc [$f1],y
$0d:cee2  ff fd ff ff   sbc $fffffd,x
$0d:cee6  75 fd		 adc $fd,x
$0d:cee8  f0 bb		 beq $cea5
$0d:ceea  df 2e 74 86   cmp $86742e,x
$0d:ceee  1f 30 f3 f1   ora $f1f330,x
$0d:cef2  3d f4 6b	  and $6bf4,x
$0d:cef5  d5 02		 cmp $02,x
$0d:cef7  ff 80 ff 7c   sbc $7cff80,x
$0d:cefb  61 f9		 adc ($f9,x)
$0d:cefd  98			tya
$0d:cefe  3f 62 0f 4c   and $4c0f62,x
$0d:cf02  c1 cc		 cmp ($cc,x)
$0d:cf04  f8			sed
$0d:cf05  01 d0		 ora ($d0,x)
$0d:cf07  c7 fc		 cmp [$fc]
$0d:cf09  23 fe		 and $fe,s
$0d:cf0b  0d b7 23	  ora $23b7
$0d:cf0e  2d c8 c7	  and $c7c8
$0d:cf11  74 2f		 stz $2f,x
$0d:cf13  dc 0c 77	  jml [$770c]
$0d:cf16  82 0d a0	  brl $6f26
$0d:cf19  a3 58		 lda $58,s
$0d:cf1b  34 de		 bit $de,x
$0d:cf1d  09 f7 01	  ora #$01f7
$0d:cf20  be 17 ec	  ldx $ec17,y
$0d:cf23  04 fb		 tsb $fb
$0d:cf25  01 5e		 ora ($5e,x)
$0d:cf27  80 77		 bra $cfa0
$0d:cf29  a0 19 e8	  ldy #$e819
$0d:cf2c  04 7a		 tsb $7a
$0d:cf2e  00 ee		 brk #$ee
$0d:cf30  48			pha
$0d:cf31  0b			phd
$0d:cf32  d4 e0		 pei ($e0)
$0d:cf34  8f b0 83 3b   sta $3b83b0
$0d:cf38  d4 08		 pei ($08)
$0d:cf3a  70 48		 bvs $cf84
$0d:cf3c  0c 18 0a	  tsb $0a18
$0d:cf3f  00 f7		 brk #$f7
$0d:cf41  c0 06 47	  cpy #$4706
$0d:cf44  41 a0		 eor ($a0,x)
$0d:cf46  07 c8		 ora [$c8]
$0d:cf48  a0 43 c1	  ldy #$c143
$0d:cf4b  07 46		 ora [$46]
$0d:cf4d  84 2a		 sty $2a
$0d:cf4f  0d 02 8e	  ora $8e02
$0d:cf52  45 21		 eor $21
$0d:cf54  84 90		 sty $90
$0d:cf56  94 46		 sty $46,x
$0d:cf58  21 03		 and ($03,x)
$0d:cf5a  b0 81		 bcs $cedd
$0d:cf5c  c1 e0		 cmp ($e0,x)
$0d:cf5e  d0 e2		 bne $cf42
$0d:cf60  10 43		 bpl $cfa5
$0d:cf62  23 84		 and $84,s
$0d:cf64  60			rts
$0d:cf65  8c 4e 09	  sty $094e
$0d:cf68  45 03		 eor $03
$0d:cf6a  81 9e		 sta ($9e,x)
$0d:cf6c  82 27 10	  brl $df96
$0d:cf6f  97 c8		 sta [$c8],y
$0d:cf71  eb			xba
$0d:cf72  94 ca		 sty $ca,x
$0d:cf74  c5 23		 cmp $23
$0d:cf76  61 90		 adc ($90,x)
$0d:cf78  2d 84 00	  and $0084
$0d:cf7b  9e 08 42	  stz $4208,x
$0d:cf7e  9f cf 2f 93   sta $932fcf,x
$0d:cf82  8b			phb
$0d:cf83  c5 c3		 cmp $c3
$0d:cf85  e0 6b 07	  cpx #$076b
$0d:cf88  99 40 20	  sta $2040,y
$0d:cf8b  47 40		 eor [$40]
$0d:cf8d  81 83		 sta ($83,x)
$0d:cf8f  41 f6		 eor ($f6,x)
$0d:cf91  10 d8		 bpl $cf6b
$0d:cf93  14 25		 trb $25
$0d:cf95  e4 70		 cpx $70
$0d:cf97  34 18		 bit $18,x
$0d:cf99  c1 c7		 cmp ($c7,x)
$0d:cf9b  e0 61 08	  cpx #$0861
$0d:cf9e  3c 3c e8	  bit $e83c,x
$0d:cfa1  07 30		 ora [$30]
$0d:cfa3  38			sec
$0d:cfa4  8c 06 41	  sty $4106
$0d:cfa7  21 99		 and ($99,x)
$0d:cfa9  46 63		 lsr $63
$0d:cfab  13 58		 ora ($58,s),y
$0d:cfad  ec 2d 06	  cpx $062d
$0d:cfb0  40			rti
$0d:cfb1  42 99		 wdm #$99
$0d:cfb3  c0 22 f0	  cpy #$f022
$0d:cfb6  08			php
$0d:cfb7  94 02		 sty $02,x
$0d:cfb9  51 00		 eor ($00),y
$0d:cfbb  da			phx
$0d:cfbc  d7 2c		 cmp [$2c],y
$0d:cfbe  59 e9 cf	  eor $cfe9,y
$0d:cfc1  7f 25 ee 8e   adc $8eee25,x
$0d:cfc5  d9 3a de	  cmp $de3a,y
$0d:cfc8  19 d7 26	  ora $26d7,y
$0d:cfcb  7b			tdc
$0d:cfcc  64 c1		 stz $c1
$0d:cfce  c7 e9		 cmp [$e9]
$0d:cfd0  39 79 a7	  and $a779,y
$0d:cfd3  2e 43 cf	  rol $cf43
$0d:cfd6  cd f9 e3	  cmp $e3f9
$0d:cfd9  fe f9 bf	  inc $bff9,x
$0d:cfdc  3f 57 07 98   and $980757,x
$0d:cfe0  54 39 1a	  mvn $1a,$39
$0d:cfe3  d9 a6 1a	  cmp $1aa6,y
$0d:cfe6  b7 c2		 lda [$c2],y
$0d:cfe8  96 f8		 stx $f8,y
$0d:cfea  62 7f 3c	  per $0c6c
$0d:cfed  7f fe 55 90   adc $9055fe,x
$0d:cff1  f0 fc		 beq $cfef
$0d:cff3  2e 5f db	  rol $db5f
$0d:cff6  cf fe 7b ff   cmp $ff7bfe
$0d:cffa  cf 5f f1 b7   cmp $b7f15f
$0d:cffe  ea			nop
$0d:cfff  1c f2 fb	  trb $fbf2
$0d:d002  3d 89 df	  and $df89,x
$0d:d005  e2 13		 sep #$13
$0d:d007  78			sei
$0d:d008  4c e6 0f	  jmp $0fe6
$0d:d00b  1f 80 43 de   ora $de4380,x
$0d:d00f  e9 68 8b	  sbc #$8b68
$0d:d012  cb			wai
$0d:d013  23 72		 and $72,s
$0d:d015  68			pla
$0d:d016  fc 42 1f	  jsr ($1f42,x)
$0d:d019  08			php
$0d:d01a  83 c3		 sta $c3,s
$0d:d01c  90 e0		 bcc $cffe
$0d:d01e  07 08		 ora [$08]
$0d:d020  44 37 e1	  mvp $e1,$37
$0d:d023  0d d8 03	  ora $03d8
$0d:d026  c4 28		 cpy $28
$0d:d028  97 0c		 sta [$0c],y
$0d:d02a  6f c2 85 80   adc $8085c2
$0d:d02e  0f 86 0a 00   ora $000a86
$0d:d032  23 64		 and $64,s
$0d:d034  80 76		 bra $d0ac
$0d:d036  67 f9		 adc [$f9]
$0d:d038  bb			tyx
$0d:d039  fe 4c 64	  inc $644c,x
$0d:d03c  71 3f		 adc ($3f),y
$0d:d03e  f8			sed
$0d:d03f  e4 22		 cpx $22
$0d:d041  5f e8 24 e0   eor $e024e8,x
$0d:d045  7f 50 59 c7   adc $c75950,x
$0d:d049  0b			phd
$0d:d04a  e0 4f		 cpx #$4f
$0d:d04c  8c 56 c3	  sty $c356
$0d:d04f  0d 78 9f	  ora $9f78
$0d:d052  40			rti
$0d:d053  0b			phd
$0d:d054  f1 7e		 sbc ($7e),y
$0d:d056  80 7f		 bra $d0d7
$0d:d058  a0 10		 ldy #$10
$0d:d05a  18			clc
$0d:d05b  7c 2a 1d	  jmp ($1d2a,x)
$0d:d05e  05 86		 ora $86
$0d:d060  41 a2		 eor ($a2,x)
$0d:d062  11 b8		 ora ($b8),y
$0d:d064  a4 2a		 ldy $2a
$0d:d066  31 04		 and ($04),y
$0d:d068  86 bd		 stx $bd
$0d:d06a  c2 15		 rep #$15
$0d:d06c  05 82		 ora $82
$0d:d06e  c2 e0		 rep #$e0
$0d:d070  70 f8		 bvs $d06a
$0d:d072  7c 7d 0a	  jmp ($0a7d,x)
$0d:d075  11 78		 ora ($78),y
$0d:d077  7c 0a 1f	  jmp ($1f0a,x)
$0d:d07a  09 83 41	  ora #$4183
$0d:d07d  fb			xce
$0d:d07e  31 eb		 and ($eb),y
$0d:d080  de b3 ff	  dec $ffb3,x
$0d:d083  95 f4		 sta $f4,x
$0d:d085  50 6f		 bvc $d0f6
$0d:d087  f9 0e fd	  sbc $fd0e,y
$0d:d08a  0b			phd
$0d:d08b  ff 34 e3 ca   sbc $cae334,x
$0d:d08f  7f fd bd f4   adc $f4bdfd,x
$0d:d093  03 ff		 ora $ff,s
$0d:d095  3f ef e3 3e   and $3ee3ef,x
$0d:d099  72 3f		 adc ($3f)
$0d:d09b  e6 72		 inc $72
$0d:d09d  c7 39		 cmp [$39]
$0d:d09f  36 87		 rol $87,x
$0d:d0a1  fa			plx
$0d:d0a2  41 fe		 eor ($fe,x)
$0d:d0a4  d8			cld
$0d:d0a5  4f aa 19 e4   eor $e419aa
$0d:d0a9  b8			clv
$0d:d0aa  40			rti
$0d:d0ab  7f f0 9f fc   adc $fc9ff0,x
$0d:d0af  c3 ff		 cmp $ff,s
$0d:d0b1  f7 84		 sbc [$84],y
$0d:d0b3  61 ef		 adc ($ef,x)
$0d:d0b5  1c 5f d7	  trb $d75f
$0d:d0b8  97 f5		 sta [$f5],y
$0d:d0ba  8a			txa
$0d:d0bb  fa			plx
$0d:d0bc  44 bd 9f	  mvp $9f,$bd
$0d:d0bf  28			plp
$0d:d0c0  61 74		 adc ($74,x)
$0d:d0c2  36 df		 rol $df,x
$0d:d0c4  06 7b		 asl $7b
$0d:d0c6  5d be 1f	  eor $1fbe,x
$0d:d0c9  6b			rtl
$0d:d0ca  87 db		 sta [$db]
$0d:d0cc  e1 0e		 sbc ($0e,x)
$0d:d0ce  80 37		 bra $d107
$0d:d0d0  eb			xba
$0d:d0d1  1c 7d 08	  trb $087d
$0d:d0d4  74 2c		 stz $2c,x
$0d:d0d6  e2 11		 sep #$11
$0d:d0d8  a8			tay
$0d:d0d9  c4 62		 cpy $62
$0d:d0db  2b			pld
$0d:d0dc  14 85		 trb $85
$0d:d0de  ca			dex
$0d:d0df  25 72		 and $72
$0d:d0e1  99 a4 c2	  sta $c2a4,y
$0d:d0e4  1f 00 85 c1   ora $c18500,x
$0d:d0e8  23 f0		 and $f0,s
$0d:d0ea  08			php
$0d:d0eb  cc 1a 2b	  cpy $2b1a
$0d:d0ee  0a			asl a
$0d:d0ef  95 c5		 sta $c5,x
$0d:d0f1  01 21		 ora ($21,x)
$0d:d0f3  34 85		 bit $85,x
$0d:d0f5  c8			iny
$0d:d0f6  2c 15 0a	  bit $0a15
$0d:d0f9  85 c2		 sta $c2
$0d:d0fb  b1 a8		 lda ($a8),y
$0d:d0fd  84 05		 sty $05
$0d:d0ff  42 d9		 wdm #$d9
$0d:d101  0c a2 41	  tsb $41a2
$0d:d104  32 90		 and ($90)
$0d:d106  4b			phk
$0d:d107  06 02		 asl $02
$0d:d109  a1 a0		 lda ($a0,x)
$0d:d10b  bc 60 35	  ldy $3560,x
$0d:d10e  15 01		 ora $01,x
$0d:d110  28			plp
$0d:d111  5b			tcd
$0d:d112  32 16		 and ($16)
$0d:d114  4c c7 d2	  jmp $d2c7
$0d:d117  11 02		 ora ($02),y
$0d:d119  17 8c		 ora [$8c],y
$0d:d11b  10 66		 bpl $d183
$0d:d11d  10 58		 bpl $d177
$0d:d11f  44 24 70	  mvp $70,$24
$0d:d122  10 b8		 bpl $d0dc
$0d:d124  5c 0a 25 02   jml $02250a
$0d:d128  80 0f		 bra $d139
$0d:d12a  c2 09		 rep #$09
$0d:d12c  02 82		 cop #$82
$0d:d12e  c0 91		 cpy #$91
$0d:d130  a0 8d		 ldy #$8d
$0d:d132  00 08		 brk #$08
$0d:d134  44 8f 80	  mvp $80,$8f
$0d:d137  4f 1c 01 4c   eor $4c011c
$0d:d13b  38			sec
$0d:d13c  05 60		 ora $60
$0d:d13e  d0 68		 bne $d1a8
$0d:d140  2c 12 0b	  bit $0b12
$0d:d143  84 c0		 sty $c0
$0d:d145  a2 05		 ldx #$05
$0d:d147  11 80		 ora ($80),y
$0d:d149  70 0c		 bvs $d157
$0d:d14b  83 a0		 sta $a0,s
$0d:d14d  a0 07		 ldy #$07
$0d:d14f  c2 e0		 rep #$e0
$0d:d151  63 02		 adc $02,s
$0d:d153  f8			sed
$0d:d154  c0 4e		 cpy #$4e
$0d:d156  63 05		 adc $05,s
$0d:d158  82 c1 20	  brl $f21c
$0d:d15b  c7 a0		 cmp [$a0]
$0d:d15d  81 8f		 sta ($8f,x)
$0d:d15f  c0 e0		 cpy #$e0
$0d:d161  48			pha
$0d:d162  21 82		 and ($82,x)
$0d:d164  c0 20		 cpy #$20
$0d:d166  d0 14		 bne $d17c
$0d:d168  48			pha
$0d:d169  40			rti
$0d:d16a  e0 85		 cpx #$85
$0d:d16c  f2 47		 sbc ($47)
$0d:d16e  9e 00 b2	  stz $b200,x
$0d:d171  1a			inc a
$0d:d172  0f 05 82 c0   ora $c08205
$0d:d176  90 73		 bcc $d1eb
$0d:d178  40			rti
$0d:d179  40			rti
$0d:d17a  3c 10 03	  bit $0310,x
$0d:d17d  58			cli
$0d:d17e  44 15 e1	  mvp $e1,$15
$0d:d181  08			php
$0d:d182  84 4b		 sty $4b
$0d:d184  24 76		 bit $76
$0d:d186  1e a6 5a	  asl $5aa6,x
$0d:d189  21 34		 and ($34,x)
$0d:d18b  84 2c		 sty $2c
$0d:d18d  44 a2 11	  mvp $11,$a2
$0d:d190  06 00		 asl $00
$0d:d192  c7 a0		 cmp [$a0]
$0d:d194  17 85		 ora [$85],y
$0d:d196  88			dey
$0d:d197  40			rti
$0d:d198  17 c2		 ora [$c2],y
$0d:d19a  8f 48 0c 0a   sta $0a0c48
$0d:d19e  07 05		 ora [$05]
$0d:d1a0  83 b5		 sta $b5,s
$0d:d1a2  c8			iny
$0d:d1a3  f2 08		 sbc ($08)
$0d:d1a5  12 81		 ora ($81)
$0d:d1a7  a1 86		 lda ($86,x)
$0d:d1a9  05 01		 ora $01
$0d:d1ab  85 3a		 sta $3a
$0d:d1ad  06 33		 asl $33
$0d:d1af  03 84		 ora $84,s
$0d:d1b1  41 e2		 eor ($e2,x)
$0d:d1b3  51 78		 eor ($78),y
$0d:d1b5  6c 7a 13	  jmp ($137a)
$0d:d1b8  1f 81 43 e1   ora $e14381,x
$0d:d1bc  10 f8		 bpl $d1b6
$0d:d1be  24 1d		 bit $1d
$0d:d1c0  aa			tax
$0d:d1c1  0f 80 86 c6   ora $c68680
$0d:d1c5  a0 31		 ldy #$31
$0d:d1c7  e8			inx
$0d:d1c8  94 32		 sty $32,x
$0d:d1ca  08			php
$0d:d1cb  be 15 f0	  ldx $f015,y
$0d:d1ce  23 82		 and $82,s
$0d:d1d0  39 e1 8d	  and $8de1,y
$0d:d1d3  78			sei
$0d:d1d4  67 5c		 adc [$5c]
$0d:d1d6  10 98		 bpl $d170
$0d:d1d8  5e 30 7f	  lsr $7f30,x
$0d:d1db  c8			iny
$0d:d1dc  1f d2 17 24   ora $2417d2,x
$0d:d1e0  ed 90 44	  sbc $4490
$0d:d1e3  41 71		 eor ($71,x)
$0d:d1e5  0f f8 bc 20   ora $20bcf8
$0d:d1e9  7f f9 3f fe   adc $fe3ff9,x
$0d:d1ed  09 fc 84	  ora #$84fc
$0d:d1f0  fe 20 df	  inc $df20,x
$0d:d1f3  18			clc
$0d:d1f4  97 ce		 sta [$ce],y
$0d:d1f6  0d 39 82	  ora $8239
$0d:d1f9  4e e1 13	  lsr $13e1
$0d:d1fc  78			sei
$0d:d1fd  85 be		 sta $be
$0d:d1ff  67 4f		 adc [$4f]
$0d:d201  93 d7		 sta ($d7,s),y
$0d:d203  ed f1 fa	  sbc $faf1
$0d:d206  64 fe		 stz $fe
$0d:d208  05 fc		 ora $fc
$0d:d20a  27 97		 and [$97]
$0d:d20c  0b			phd
$0d:d20d  f9 62 9e	  sbc $9e62,y
$0d:d210  50 3f		 bvc $d251
$0d:d212  9a			txs
$0d:d213  02 d0		 cop #$d0
$0d:d215  6f 3f d0 0b   adc $0bd03f
$0d:d219  f6 02		 inc $02,x
$0d:d21b  7d c0 8f	  adc $8fc0,x
$0d:d21e  78			sei
$0d:d21f  3b			tsc
$0d:d220  de 0d 67	  dec $670d,x
$0d:d223  42 19		 wdm #$19
$0d:d225  f0 a4		 beq $d1cb
$0d:d227  7d 20 10	  adc $1020,x
$0d:d22a  73 78		 adc ($78,s),y
$0d:d22c  40			rti
$0d:d22d  9b			txy
$0d:d22e  81 05		 sta ($05,x)
$0d:d230  39 82 28	  and $2882,y
$0d:d233  20 50 57	  jsr $5750
$0d:d236  08			php
$0d:d237  1c 00 ec	  trb $ec00
$0d:d23a  07 90		 ora [$90]
$0d:d23c  81 c1		 sta ($c1,x)
$0d:d23e  8f 21 05 81   sta $810521
$0d:d242  c1 e0		 cmp ($e0,x)
$0d:d244  68			pla
$0d:d245  c0 88		 cpy #$88
$0d:d247  67 e4		 adc [$e4]
$0d:d249  5f f8 02 48   eor $4802f8,x
$0d:d24d  68			pla
$0d:d24e  17 f8		 ora [$f8],y
$0d:d250  c6 5f		 dec $5f
$0d:d252  43 37		 eor $37,s
$0d:d254  8d 5c ac	  sta $ac5c
$0d:d257  df 9c 45 df   cmp $df459c,x
$0d:d25b  af 28 49 06   lda $064928
$0d:d25f  ff 91 ee fc   sbc $fcee91,x
$0d:d263  f2 3f		 sbc ($3f)
$0d:d265  fa			plx
$0d:d266  de fc 1b	  dec $1bfc,x
$0d:d269  f7 0d		 sbc [$0d],y
$0d:d26b  fb			xce
$0d:d26c  51 7e		 eor ($7e),y
$0d:d26e  d5 bf		 cmp $bf,x
$0d:d270  64 ef		 stz $ef
$0d:d272  5b			tcd
$0d:d273  d6 fc		 dec $fc,x
$0d:d275  49 eb 56	  eor #$56eb
$0d:d278  cd ad f3	  cmp $f3ad
$0d:d27b  01 d8		 ora ($d8,x)
$0d:d27d  90 66		 bcc $d2e5
$0d:d27f  2c 11 0f	  bit $0f11
$0d:d282  05 47		 ora $47
$0d:d284  c1 00		 cmp ($00,x)
$0d:d286  f0 e8		 beq $d270
$0d:d288  b8			clv
$0d:d289  14 4c		 trb $4c
$0d:d28b  17 db		 ora [$db],y
$0d:d28d  e0 cf		 cpx #$cf
$0d:d28f  2f a7 cb ed   and $edcba7
$0d:d293  70 b4		 bvs $d249
$0d:d295  79 3c 9e	  adc $9e3c,y
$0d:d298  8f 87 a3 1d   sta $1da387
$0d:d29c  00 6f		 brk #$6f
$0d:d29e  a4 38		 ldy $38
$0d:d2a0  1c 0e 81	  trb $810e
$0d:d2a3  8c 40 27	  sty $2740
$0d:d2a6  53 29		 eor ($29,s),y
$0d:d2a8  54 8a 4d	  mvn $4d,$8a
$0d:d2ab  26 8b		 rol $8b
$0d:d2ad  cd e2 b1	  cmp $b1e2
$0d:d2b0  78			sei
$0d:d2b1  6c 7e 01	  jmp ($017e)
$0d:d2b4  0f 80 3b 82   ora $823b80
$0d:d2b8  0b			phd
$0d:d2b9  2a			rol a
$0d:d2ba  8a			txa
$0d:d2bb  c9 a3 33	  cmp #$33a3
$0d:d2be  78			sei
$0d:d2bf  44 5e 10	  mvp $10,$5e
$0d:d2c2  fa			plx
$0d:d2c3  38			sec
$0d:d2c4  06 d2		 asl $d2
$0d:d2c6  09 f4 82	  ora #$82f4
$0d:d2c9  59 20 90	  eor $9020,y
$0d:d2cc  88			dey
$0d:d2cd  64 62		 stz $62
$0d:d2cf  31 f0		 and ($f0),y
$0d:d2d1  fc 70 3e	  jsr ($3e70,x)
$0d:d2d4  00 d0		 brk #$d0
$0d:d2d6  fa			plx
$0d:d2d7  42 03		 wdm #$03
$0d:d2d9  e1 64		 sbc ($64,x)
$0d:d2db  cc 1a c2	  cpy $c21a
$0d:d2de  31 e0		 and ($e0),y
$0d:d2e0  fc 40 03	  jsr ($0340,x)
$0d:d2e3  83 00		 sta $00,s
$0d:d2e5  8a			txa
$0d:d2e6  c5 23		 cmp $23
$0d:d2e8  d1 c8		 cmp ($c8),y
$0d:d2ea  d4 62		 pei ($62)
$0d:d2ec  17 18		 ora [$18],y
$0d:d2ee  84 c6		 sty $c6
$0d:d2f0  21 90		 and ($90,x)
$0d:d2f2  c4 50		 cpy $50
$0d:d2f4  0b			phd
$0d:d2f5  46 14		 lsr $14
$0d:d2f7  fa			plx
$0d:d2f8  08			php
$0d:d2f9  dc 10 86	  jml [$8610]
$0d:d2fc  11 98		 ora ($98),y
$0d:d2fe  30 e8		 bmi $d2e8
$0d:d300  e0 1d		 cpx #$1d
$0d:d302  0c 86 c3	  tsb $c386
$0d:d305  21 50		 and ($50,x)
$0d:d307  a8			tay
$0d:d308  4c 26 1a	  jmp $1a26
$0d:d30b  09 85 82	  ora #$8285
$0d:d30e  c1 80		 cmp ($80,x)
$0d:d310  e0 13		 cpx #$13
$0d:d312  46 41		 lsr $41
$0d:d314  b0 a0		 bcs $d2b6
$0d:d316  54 34 06	  mvn $06,$34
$0d:d319  10 30		 bpl $d34b
$0d:d31b  81 68		 sta ($68,x)
$0d:d31d  e0 10		 cpx #$10
$0d:d31f  38			sec
$0d:d320  54 34 2a	  mvn $2a,$34
$0d:d323  10 88		 bpl $d2ad
$0d:d325  54 2a 0a	  mvn $0a,$2a
$0d:d328  89 08 18	  bit #$1808
$0d:d32b  b0 60		 bcs $d38d
$0d:d32d  10 b8		 bpl $d2e7
$0d:d32f  24 36		 bit $36
$0d:d331  04 3a		 tsb $3a
$0d:d333  03 b0		 ora $b0,s
$0d:d335  c0 8f		 cpy #$8f
$0d:d337  47 00		 eor [$00]
$0d:d339  e0 13		 cpx #$13
$0d:d33b  c3 20		 cmp $20,s
$0d:d33d  4f 0a 84 42   eor $42840a
$0d:d341  41 20		 eor ($20,x)
$0d:d343  e0 1a		 cpx #$1a
$0d:d345  c8			iny
$0d:d346  bc 39 0b	  ldy $0b39,x
$0d:d349  01 7c		 ora ($7c,x)
$0d:d34b  0c 60 98	  tsb $9860
$0d:d34e  57 60		 eor [$60],y
$0d:d350  42 25		 wdm #$25
$0d:d352  96 6b		 stx $6b,y
$0d:d354  b5 4b		 lda $4b,x
$0d:d356  bb			tyx
$0d:d357  9c dd ce	  stz $cedd
$0d:d35a  6d d4 a9	  adc $a9d4
$0d:d35d  a5 9a		 lda $9a
$0d:d35f  31 10		 and ($10),y
$0d:d361  88			dey
$0d:d362  3b			tsc
$0d:d363  06 79		 asl $79
$0d:d365  10 bf		 bpl $d326
$0d:d367  c7 3f		 cmp [$3f]
$0d:d369  d3 89		 cmp ($89,s),y
$0d:d36b  e4 21		 cpx $21
$0d:d36d  82 10 87	  brl $5a80
$0d:d370  40			rti
$0d:d371  41 e0		 eor ($e0,x)
$0d:d373  91 38		 sta ($38),y
$0d:d375  a4 0d		 ldy $0d
$0d:d377  a6 11		 ldx $11
$0d:d379  66 b0		 ror $b0
$0d:d37b  c7 20		 cmp [$20]
$0d:d37d  2d b0 8c	  and $8cb0
$0d:d380  37 06		 and [$06],y
$0d:d382  3b			tsc
$0d:d383  00 71		 brk #$71
$0d:d385  a0 24		 ldy #$24
$0d:d387  01 21		 ora ($21,x)
$0d:d389  01 82		 ora ($82,x)
$0d:d38b  c0 20		 cpy #$20
$0d:d38d  4e e0 79	  lsr $79e0
$0d:d390  8b			phb
$0d:d391  dd 60 c6	  cmp $c660,x
$0d:d394  e0 0e		 cpx #$0e
$0d:d396  84 05		 sty $05
$0d:d398  ec f0 0c	  cpx $0cf0
$0d:d39b  07 df		 ora [$df]
$0d:d39d  91 f7		 sta ($f7),y
$0d:d39f  bc 7d a3	  ldy $a37d,x
$0d:d3a2  9d 59 07	  sta $0759,x
$0d:d3a5  fe 29 77	  inc $7729,x
$0d:d3a8  85 ce		 sta $ce
$0d:d3aa  21 30		 and ($30,x)
$0d:d3ac  76 68		 ror $68,x
$0d:d3ae  33 43		 and ($43,s),y
$0d:d3b0  13 00		 ora ($00,s),y
$0d:d3b2  b5 e0		 lda $e0,x
$0d:d3b4  31 f7		 and ($f7),y
$0d:d3b6  0a			asl a
$0d:d3b7  4c fa 4f	  jmp $4ffa
$0d:d3ba  1f 84 41 f0   ora $f04184,x
$0d:d3be  bf c9 a5 ca   lda $caa5c9,x
$0d:d3c2  97 c3		 sta [$c3],y
$0d:d3c4  be 7f e0	  ldx $e07f,y
$0d:d3c7  3f f8 57 e2   and $e257f8,x
$0d:d3cb  25 e3		 and $e3
$0d:d3cd  c8			iny
$0d:d3ce  67 ae		 adc [$ae]
$0d:d3d0  70 fc		 bvs $d3ce
$0d:d3d2  7d ff 79	  adc $79ff,x
$0d:d3d5  7f 80 7f f0   adc $f07f80,x
$0d:d3d9  d7 9f		 cmp [$9f],y
$0d:d3db  3c 7f f9	  bit $f97f,x
$0d:d3de  ff b1 7f 28   sbc $287fb1,x
$0d:d3e2  17 cc		 ora [$cc],y
$0d:d3e4  07 f2		 ora [$f2]
$0d:d3e6  01 f8		 ora ($f8,x)
$0d:d3e8  90 7e		 bcc $d468
$0d:d3ea  28			plp
$0d:d3eb  17 0c		 ora [$0c],y
$0d:d3ed  07 80		 ora [$80]
$0d:d3ef  1c 09 d0	  trb $d009
$0d:d3f2  cc 79 26	  cpy $2679
$0d:d3f5  9c 8b 06	  stz $068b
$0d:d3f8  63 11		 adc $11,s
$0d:d3fa  70 c8		 bvs $d3c4
$0d:d3fc  78			sei
$0d:d3fd  13 00		 ora ($00,s),y
$0d:d3ff  5c 14 e8 3c   jml $3ce814
$0d:d403  80 02		 bra $d407
$0d:d405  00 10		 brk #$10
$0d:d407  7a			ply
$0d:d408  3c 06 07	  bit $0706,x
$0d:d40b  01 81		 ora ($81,x)
$0d:d40d  40			rti
$0d:d40e  80 84		 bra $d394
$0d:d410  f6 5c		 inc $5c,x
$0d:d412  e7 a7		 sbc [$a7]
$0d:d414  ad 70 b7	  lda $b770
$0d:d417  fd ea f9	  sbc $f9ea,x
$0d:d41a  8c 66 be	  sty $be66
$0d:d41d  97 cf		 sta [$cf],y
$0d:d41f  8b			phb
$0d:d420  5c 60 d1 eb   jml $ebd160
$0d:d424  b6 3f		 ldx $3f,y
$0d:d426  1f 00 c3 c0   ora $c0c300,x
$0d:d42a  2c 18 0b	  bit $0b18
$0d:d42d  87 02		 sta [$02]
$0d:d42f  61 fc		 adc ($fc,x)
$0d:d431  a7 cf		 lda [$cf]
$0d:d433  e2 30		 sep #$30
$0d:d435  fe dd 86	  inc $86dd,x
$0d:d438  ef 93 fb fb   sbc $fbfb93
$0d:d43c  fb			xce
$0d:d43d  93 cf		 sta ($cf,s),y
$0d:d43f  87 cb		 sta [$cb]
$0d:d441  2b			pld
$0d:d442  b1 88		 lda ($88),y
$0d:d444  79 b4 13	  adc $13b4,y
$0d:d447  8c 04 12	  sty $1204
$0d:d44a  21 08		 and ($08,x)
$0d:d44c  2d 00 04	  and $0400
$0d:d44f  21 f0		 and ($f0,x)
$0d:d451  1a			inc a
$0d:d452  74 ff		 stz $ff,x
$0d:d454  f5 fc		 sbc $fc,x
$0d:d456  e4 7c		 cpx $7c
$0d:d458  38			sec
$0d:d459  1d 8d 06	  ora $068d,x
$0d:d45c  62 81 30	  per $04e0
$0d:d45f  80 78		 bra $d4d9
$0d:d461  30 1c		 bmi $d47f
$0d:d463  02 d9		 cop #$d9
$0d:d465  17 42		 ora [$42],y
$0d:d467  61 08		 adc ($08,x)
$0d:d469  b4 44		 ldy $44,x
$0d:d46b  3a			dec a
$0d:d46c  12 0d		 ora ($0d)
$0d:d46e  05 02		 ora $02
$0d:d470  81 80		 sta ($80,x)
$0d:d472  35 9c		 and $9c,x
$0d:d474  00 00		 brk #$00
$0d:d476  20 80 3b	  jsr $3b80
$0d:d479  fd fd 9f	  sbc $9ffd,x
$0d:d47c  f0 77		 beq $d4f5
$0d:d47e  07 f6		 ora [$f6]
$0d:d480  23 00		 and $00,s
$0d:d482  bf c0 24 55   lda $5524c0,x
$0d:d486  d8			cld
$0d:d487  24 fe		 bit $fe
$0d:d489  a9 3b		 lda #$3b
$0d:d48b  88			dey
$0d:d48c  5b			tcd
$0d:d48d  f0 17		 beq $d4a6
$0d:d48f  fa			plx
$0d:d490  9e fc 1d	  stz $1dfc,x
$0d:d493  c2 f0		 rep #$f0
$0d:d495  ff 40 64 7d   sbc $7d6440,x
$0d:d499  d8			cld
$0d:d49a  0f ff 03 ff   ora $ff03ff
$0d:d49e  c4 df		 cpy $df
$0d:d4a0  e1 5f		 sbc ($5f,x)
$0d:d4a2  6d c7 e0	  adc $e0c7
$0d:d4a5  1d 45 50	  ora $5045,x
$0d:d4a8  83 ff		 sta $ff,s
$0d:d4aa  fd d1 1c	  sbc $1cd1,x
$0d:d4ad  0d ff b9	  ora $b9ff
$0d:d4b0  7e ff 4f	  ror $4fff,x
$0d:d4b3  b7 d7		 lda [$d7],y
$0d:d4b5  ef a5 db ed   sbc $eddba5
$0d:d4b9  7e b6 7b	  ror $7bb6,x
$0d:d4bc  0c e8 83	  tsb $83e8
$0d:d4bf  28			plp
$0d:d4c0  49 a8 62	  eor #$62a8
$0d:d4c3  66 a0		 ror $a0
$0d:d4c5  fe 49 b2	  inc $b249,x
$0d:d4c8  11 fc		 ora ($fc),y
$0d:d4ca  04 ca		 tsb $ca
$0d:d4cc  13 3f		 ora ($3f,s),y
$0d:d4ce  c0 49 f2	  cpy #$f249
$0d:d4d1  11 ec		 ora ($ec),y
$0d:d4d3  0c f9 1e	  tsb $1ef9
$0d:d4d6  1f fc 87 ff   ora $ff87fc,x
$0d:d4da  00 0f		 brk #$0f
$0d:d4dc  15 18		 ora $18,x
$0d:d4de  29 c8 1c	  and #$1cc8
$0d:d4e1  3e e8 06	  rol $06e8,x
$0d:d4e4  02 bb		 cop #$bb
$0d:d4e6  80 9d		 bra $d485
$0d:d4e8  f1 25		 sbc ($25),y
$0d:d4ea  79 01 d0	  adc $d001,y
$0d:d4ed  c0 35 91	  cpy #$9135
$0d:d4f0  3f 72 98 f8   and $f89872,x
$0d:d4f4  0a			asl a
$0d:d4f5  86 ff		 stx $ff
$0d:d4f7  fd 29 bd	  sbc $bd29,x
$0d:d4fa  8a			txa
$0d:d4fb  2e 5e a5	  rol $a55e
$0d:d4fe  aa			tax
$0d:d4ff  b1 f5		 lda ($f5),y
$0d:d501  66 5e		 ror $5e
$0d:d503  38			sec
$0d:d504  e7 42		 sbc [$42]
$0d:d506  9b			txy
$0d:d507  aa			tax
$0d:d508  b3 cf		 lda ($cf,s),y
$0d:d50a  a0 0d f0	  ldy #$f00d
$0d:d50d  96 40		 stx $40,y
$0d:d50f  23 90		 and $90,s
$0d:d511  08			php
$0d:d512  63 f8		 adc $f8,s
$0d:d514  5b			tcd
$0d:d515  e0 e5 08	  cpx #$08e5
$0d:d518  2e fa 2d	  rol $2dfa
$0d:d51b  ac b1 f7	  ldy $f7b1
$0d:d51e  68			pla
$0d:d51f  ff 9f 2d 77   sbc $772d9f,x
$0d:d523  c3 4d		 cmp $4d,s
$0d:d525  eb			xba
$0d:d526  d3 75		 cmp ($75,s),y
$0d:d528  36 51		 rol $51,x
$0d:d52a  88			dey
$0d:d52b  0c 41 be	  tsb $be41
$0d:d52e  40			rti
$0d:d52f  34 8f		 bit $8f,x
$0d:d531  40			rti
$0d:d532  29 5c 0c	  and #$0c5c
$0d:d535  e6 ba		 inc $ba
$0d:d537  e7 5d		 sbc [$5d]
$0d:d539  ab			plb
$0d:d53a  52 36		 eor ($36)
$0d:d53c  f2 df		 sbc ($df)
$0d:d53e  5d 97 39	  eor $3997,x
$0d:d541  10 9b		 bpl $d4de
$0d:d543  ec 67 e0	  cpx $e067
$0d:d546  01 df		 ora ($df,x)
$0d:d548  40			rti
$0d:d549  07 c1		 ora [$c1]
$0d:d54b  de 80 67	  dec $6780,x
$0d:d54e  a0 1e f8	  ldy #$f81e
$0d:d551  07 3a		 ora [$3a]
$0d:d553  01 67		 ora ($67,x)
$0d:d555  80 53		 bra $d5aa
$0d:d557  66 51		 ror $51
$0d:d559  2b			pld
$0d:d55a  ff ae f7 69   sbc $69f7ae,x
$0d:d55e  88			dey
$0d:d55f  40			rti
$0d:d560  35 72		 and $72,x
$0d:d562  2c 05 bf	  bit $bf05
$0d:d565  20 a5 01	  jsr $01a5
$0d:d568  f9 41 19	  sbc $1941,y
$0d:d56b  43 ab		 eor $ab,s
$0d:d56d  53 1e		 eor ($1e,s),y
$0d:d56f  da			phx
$0d:d570  01 2e		 ora ($2e,x)
$0d:d572  e8			inx
$0d:d573  52 bf		 eor ($bf)
$0d:d575  92 4f		 sta ($4f)
$0d:d577  ce 82 16	  dec $1682
$0d:d57a  2e 18 fe	  rol $fe18
$0d:d57d  82 1e 3f	  brl $149e
$0d:d580  44 28 42	  mvp $42,$28
$0d:d583  ff f6 7f fc   sbc $fc7ff6,x
$0d:d587  7f ff 0f ff   adc $ff0fff,x
$0d:d58b  cd b0 35	  cmp $35b0
$0d:d58e  9d fd 3f	  sta $3ffd,x
$0d:d591  5f 36 bf dd   eor $ddbf36,x
$0d:d595  a1 33		 lda ($33,x)
$0d:d597  bc 04 af	  ldy $af04,x
$0d:d59a  09 00 eb	  ora #$eb00
$0d:d59d  12 c9		 ora ($c9)
$0d:d59f  42 03		 wdm #$03
$0d:d5a1  f2 25		 sbc ($25)
$0d:d5a3  97 5b		 sta [$5b],y
$0d:d5a5  ff dc 91 65   sbc $6591dc,x
$0d:d5a9  bf d7 cb e7   lda $e7cbd7,x
$0d:d5ad  4f e1 17 f7   eor $f717e1
$0d:d5b1  5b			tcd
$0d:d5b2  22 44 f0 80   jsl $80f044
$0d:d5b6  48			pha
$0d:d5b7  59 65 82	  eor $8265,y
$0d:d5ba  ff c3 99 46   sbc $4699c3,x
$0d:d5be  43 09		 eor $09,s
$0d:d5c0  0f ff f7 04   ora $04f7ff
$0d:d5c4  88			dey
$0d:d5c5  7b			tdc
$0d:d5c6  fd 97 f8	  sbc $f897,x
$0d:d5c9  9f 6e 1b cf   sta $cf1b6e,x
$0d:d5cd  9b			txy
$0d:d5ce  79 b2 55	  adc $55b2,y
$0d:d5d1  3d 35 8d	  and $8d35,x
$0d:d5d4  d0 2e		 bne $d604
$0d:d5d6  81 92		 sta ($92,x)
$0d:d5d8  40			rti
$0d:d5d9  26 10		 rol $10
$0d:d5db  08			php
$0d:d5dc  cb			wai
$0d:d5dd  88			dey
$0d:d5de  fb			xce
$0d:d5df  f2 02		 sbc ($02)
$0d:d5e1  18			clc
$0d:d5e2  4e b7 73	  lsr $73b7
$0d:d5e5  6f 9d 8b d7   adc $d78b9d
$0d:d5e9  5e e1 d6	  lsr $d6e1,x
$0d:d5ec  bc 7a 2c	  ldy $2c7a,x
$0d:d5ef  5a			phy
$0d:d5f0  fc a8 90	  jsr ($90a8,x)
$0d:d5f3  08			php
$0d:d5f4  63 30		 adc $30,s
$0d:d5f6  67 8e		 adc [$8e]
$0d:d5f8  81 be		 sta ($be,x)
$0d:d5fa  30 c3		 bmi $d5bf
$0d:d5fc  dd 5d 3d	  cmp $3d5d,x
$0d:d5ff  06 42		 asl $42
$0d:d601  fd 01 92	  sbc $9201,x
$0d:d604  f9 7d f7	  sbc $f77d,y
$0d:d607  fd dd ee	  sbc $eedd,x
$0d:d60a  31 67		 and ($67),y
$0d:d60c  f7 22		 sbc [$22],y
$0d:d60e  84 02		 sty $02
$0d:d610  04 30		 tsb $30
$0d:d612  8d 10 95	  sta $9510
$0d:d615  de 1b b8	  dec $b81b,x
$0d:d618  07 b6		 ora [$b6]
$0d:d61a  25 6b		 and $6b
$0d:d61c  c3 4b		 cmp $4b,s
$0d:d61e  e0 36 8f	  cpx #$8f36
$0d:d621  4f f3 fb 93   eor $93fbf3
$0d:d625  b7 3f		 lda [$3f],y
$0d:d627  c1 4e		 cmp ($4e,x)
$0d:d629  9f ef fc 5b   sta $5bfcef,x
$0d:d62d  ff 02 42 0f   sbc $0f4202,x
$0d:d631  ba			tsx
$0d:d632  23 80		 and $80,s
$0d:d634  bf f7 6f ff   lda $ff6ff7,x
$0d:d638  b9 de ae	  lda $aede,y
$0d:d63b  df ef bf df   cmp $dfbfef,x
$0d:d63f  ff fa cf 62   sbc $62cffa,x
$0d:d643  9d 01 61	  sta $6101,x
$0d:d646  10 42		 bpl $d68a
$0d:d648  1c 4c 5c	  trb $5c4c
$0d:d64b  26 50		 rol $50
$0d:d64d  ee 7f 8a	  inc $8a7f
$0d:d650  81 7e		 sta ($7e,x)
$0d:d652  bf 5d be df   lda $dfbe5d,x
$0d:d656  5f e5 1e 80   eor $801ee5,x
$0d:d65a  a9 22 88	  lda #$8822
$0d:d65d  14 43		 trb $43
$0d:d65f  03 ff		 ora $ff,s
$0d:d661  84 ff		 sty $ff
$0d:d663  e0 7f fd	  cpx #$fd7f
$0d:d666  ff fe 23 00   sbc $0023fe,x
$0d:d66a  7a			ply
$0d:d66b  84 8e		 sty $8e
$0d:d66d  bb			tyx
$0d:d66e  01 9f		 ora ($9f,x)
$0d:d670  d0 67		 bne $d6d9
$0d:d672  f0 bb		 beq $d62f
$0d:d674  ec 26 ef	  cpx $ef26
$0d:d677  93 bf		 sta ($bf,s),y
$0d:d679  a9 d0 ff	  lda #$ffd0
$0d:d67c  13 2c		 ora ($2c,s),y
$0d:d67e  4c ff 01	  jmp $01ff
$0d:d681  1e c0 cf	  asl $cfc0,x
$0d:d684  a0 33 8c	  ldy #$8c33
$0d:d687  2c ff 03	  bit $03ff
$0d:d68a  1d c1 d0	  ora $d0c1,x
$0d:d68d  d2 20		 cmp ($20)
$0d:d68f  00 54		 brk #$54
$0d:d691  fb			xce
$0d:d692  56 b7		 lsr $b7,x
$0d:d694  bb			tyx
$0d:d695  58			cli
$0d:d696  45 0b		 eor $0b
$0d:d698  4b			phk
$0d:d699  e5 cd		 sbc $cd
$0d:d69b  ef f8 37 ec   sbc $ec37f8
$0d:d69f  0a			asl a
$0d:d6a0  c4 15		 cpy $15
$0d:d6a2  e0 67 02	  cpx #$0267
$0d:d6a5  f8			sed
$0d:d6a6  49 3f f1	  eor #$f13f
$0d:d6a9  8e dc 03	  stx $03dc
$0d:d6ac  86 c7		 stx $c7
$0d:d6ae  13 30		 ora ($30,s),y
$0d:d6b0  fd ec 5a	  sbc $5aec,x
$0d:d6b3  9b			txy
$0d:d6b4  17 1e		 ora [$1e],y
$0d:d6b6  79 96 a5	  adc $a596,y
$0d:d6b9  ea			nop
$0d:d6ba  2c 7f 49	  bit $497f
$0d:d6bd  9e 5e e9	  stz $e95e,x
$0d:d6c0  f3 86		 sbc ($86,s),y
$0d:d6c2  47 20		 eor [$20]
$0d:d6c4  0d f0 71	  ora $71f0
$0d:d6c7  04 f1		 tsb $f1
$0d:d6c9  c0 30 c8	  cpy #$c830
$0d:d6cc  04 21		 tsb $21
$0d:d6ce  c4 3d		 cpy $3d
$0d:d6d0  6b			rtl
$0d:d6d1  9c 3f 7b	  stz $7b3f
$0d:d6d4  65 ee		 adc $ee
$0d:d6d6  ea			nop
$0d:d6d7  e8			inx
$0d:d6d8  bd 5a 2f	  lda $2f5a,x
$0d:d6db  22 8b b6 b9   jsl $b9b68b
$0d:d6df  f3 67		 sbc ($67,s),y
$0d:d6e1  ce 90 bf	  dec $bf90
$0d:d6e4  40			rti
$0d:d6e5  27 c0		 and [$c0]
$0d:d6e7  25 74		 and $74
$0d:d6e9  83 88		 sta $88,s
$0d:d6eb  22 d9 fd 64   jsl $64fdd9
$0d:d6ef  ea			nop
$0d:d6f0  0d 95 ce	  ora $ce95
$0d:d6f3  45 77		 eor $77
$0d:d6f5  53 38		 eor ($38,s),y
$0d:d6f7  06 6e		 asl $6e
$0d:d6f9  55 b3		 eor $b3,x
$0d:d6fb  c8			iny
$0d:d6fc  c4 7c		 cpy $7c
$0d:d6fe  10 0e		 bpl $d70e
$0d:d700  3c 03 d4	  bit $d403,x
$0d:d703  22 1e 64 00   jsl $00641e
$0d:d707  7c 02 70	  jmp ($7002,x)
$0d:d70a  f7 40		 sbc [$40],y
$0d:d70c  2a			rol a
$0d:d70d  5a			phy
$0d:d70e  d8			cld
$0d:d70f  06 12		 asl $12
$0d:d711  01 ed		 ora ($ed,x)
$0d:d713  9a			txs
$0d:d714  60			rts
$0d:d715  29 bb 22	  and #$22bb
$0d:d718  f8			sed
$0d:d719  44 34 93	  mvp $93,$34
$0d:d71c  5c 42 7c 30   jml $307c42
$0d:d720  9f ff 6a 98   sta $986aff,x
$0d:d724  c9 01 a4	  cmp #$a401
$0d:d727  53 0d		 eor ($0d,s),y
$0d:d729  c3 07		 cmp $07,s
$0d:d72b  00 c7		 brk #$c7
$0d:d72d  a2 46 7f	  ldx #$7f46
$0d:d730  a0 83 a2	  ldy #$a283
$0d:d733  47 7f		 eor [$7f]
$0d:d735  80 87		 bra $d6be
$0d:d737  c0 ff f8	  cpy #$f8ff
$0d:d73a  f2 40		 sbc ($40)
$0d:d73c  cf ff f0 72   cmp $72f0ff
$0d:d740  40			rti
$0d:d741  ef ff f0 ff   sbc $fff0ff
$0d:d745  fd cb a3	  sbc $a3cb,x
$0d:d748  44 e1 ca	  mvp $ca,$e1
$0d:d74b  34 f9		 bit $f9,x
$0d:d74d  0c 7d 8b	  tsb $8b7d
$0d:d750  ba			tsx
$0d:d751  5b			tcd
$0d:d752  0e ae 03	  asl $03ae
$0d:d755  4d ff 97	  eor $97ff
$0d:d758  95 42		 sta $42,x
$0d:d75a  01 5f		 ora ($5f,x)
$0d:d75c  80 5f		 bra $d7bd
$0d:d75e  d0 02		 bne $d762
$0d:d760  85 04		 sta $04
$0d:d762  28			plp
$0d:d763  38			sec
$0d:d764  83 77		 sta $77,s
$0d:d766  c1 ae		 cmp ($ae,x)
$0d:d768  f8			sed
$0d:d769  75 d7		 adc $d7,x
$0d:d76b  08			php
$0d:d76c  bf e6 17 fd   lda $fd17e6,x
$0d:d770  a2 6f bd	  ldx #$bd6f
$0d:d773  90 2a		 bcc $d79f
$0d:d775  ad 53 fd	  lda $fd53
$0d:d778  00 4f		 brk #$4f
$0d:d77a  81 68		 sta ($68,x)
$0d:d77c  13 e8		 ora ($e8,s),y
$0d:d77e  5a			phy
$0d:d77f  0d 5c 02	  ora $025c
$0d:d782  f5 e8		 sbc $e8,x
$0d:d784  82 f0 e5	  brl $bd77
$0d:d787  3e 6c 87	  rol $876c,x
$0d:d78a  3e 8d d9	  rol $d98d,x
$0d:d78d  b5 70		 lda $70,x
$0d:d78f  26 db		 rol $db
$0d:d791  63 e8		 adc $e8,s
$0d:d793  45 d0		 eor $d0
$0d:d795  03 1f		 ora $1f,s
$0d:d797  40			rti
$0d:d798  0b			phd
$0d:d799  14 a9		 trb $a9
$0d:d79b  2e 21 d8	  rol $d821
$0d:d79e  d0 eb		 bne $d78b
$0d:d7a0  7e 3d 45	  ror $453d,x
$0d:d7a3  c6 6f		 dec $6f
$0d:d7a5  db			stp
$0d:d7a6  c4 5f		 cpy $5f
$0d:d7a8  6b			rtl
$0d:d7a9  78			sei
$0d:d7aa  7b			tdc
$0d:d7ab  4d a7 4b	  eor $4ba7
$0d:d7ae  ff fe 40 1b   sbc $1b40fe,x
$0d:d7b2  e0 a7 07	  cpx #$07a7
$0d:d7b5  0a			asl a
$0d:d7b6  65 81		 adc $81
$0d:d7b8  83 02		 sta $02,s
$0d:d7ba  fc 4a f8	  jsr ($f84a,x)
$0d:d7bd  f4 dc f4	  pea $f4dc
$0d:d7c0  5b			tcd
$0d:d7c1  73 65		 adc ($65,s),y
$0d:d7c3  9d 46 e9	  sta $e946,x
$0d:d7c6  9c cb 87	  stz $87cb
$0d:d7c9  c6 b3		 dec $b3
$0d:d7cb  f8			sed
$0d:d7cc  22 17 fb 23   jsl $23fb17
$0d:d7d0  ec 85 fe	  cpx $fe85
$0d:d7d3  25 ff		 and $ff
$0d:d7d5  08			php
$0d:d7d6  bf c2 bd a0   lda $a0bdc2,x
$0d:d7da  e0 47 ea	  cpx #$ea47
$0d:d7dd  de 3c 85	  dec $853c,x
$0d:d7e0  ee d1 9d	  inc $9dd1
$0d:d7e3  d3 53		 cmp ($53,s),y
$0d:d7e5  7b			tdc
$0d:d7e6  93 79		 sta ($79,s),y
$0d:d7e8  9c 3b 1f	  stz $1f3b
$0d:d7eb  9a			txs
$0d:d7ec  8f ff e0 3f   sta $3fe0ff
$0d:d7f0  f8			sed
$0d:d7f1  8d bf 03	  sta $03bf
$0d:d7f4  3f e2 c6 fe   and $fec6e2,x
$0d:d7f8  30 ff		 bmi $d7f9
$0d:d7fa  54 36 f5	  mvn $f5,$36
$0d:d7fd  05 cb		 ora $cb
$0d:d7ff  ca			dex
$0d:d800  f2 54		 sbc ($54)
$0d:d802  fc cd 9f	  jsr ($9fcd,x)
$0d:d805  53 57		 eor ($57,s),y
$0d:d807  93 76		 sta ($76,s),y
$0d:d809  68			pla
$0d:d80a  3a			dec a
$0d:d80b  ed 45 df	  sbc $df45
$0d:d80e  b1 67		 lda ($67),y
$0d:d810  90 ff		 bcc $d811
$0d:d812  a8			tay
$0d:d813  1f fb 07 fe   ora $fe07fb,x
$0d:d817  a1 ff		 lda ($ff,x)
$0d:d819  e4 7f		 cpx $7f
$0d:d81b  f2 c6		 sbc ($c6)
$0d:d81d  61 33		 adc ($33,x)
$0d:d81f  87 d7		 sta [$d7]
$0d:d821  71 a4		 adc ($a4),y
$0d:d823  dc ea 36	  jml [$36ea]
$0d:d826  3d 5f 44	  and $445f,x
$0d:d829  9b			txy
$0d:d82a  a9 df 95	  lda #$95df
$0d:d82d  45 3d		 eor $3d
$0d:d82f  b1 af		 lda ($af),y
$0d:d831  3f 02 fe 41   and $41fe02,x
$0d:d835  02 08		 cop #$08
$0d:d837  2a			rol a
$0d:d838  82 11 ff	  brl $d74c
$0d:d83b  92 7f		 sta ($7f)
$0d:d83d  fc 5f ff	  jsr ($ff5f,x)
$0d:d840  07 fe		 ora [$fe]
$0d:d842  89 3b dd	  bit #$dd3b
$0d:d845  5f ba 34 4e   eor $4e34ba,x
$0d:d849  2d e7 fb	  and $fbe7
$0d:d84c  38			sec
$0d:d84d  88			dey
$0d:d84e  d1 2f		 cmp ($2f),y
$0d:d850  d7 ac		 cmp [$ac],y
$0d:d852  3d ed 54	  and $54ed,x
$0d:d855  02 10		 cop #$10
$0d:d857  9d ff e0	  sta $e0ff,x
$0d:d85a  68			pla
$0d:d85b  41 41		 eor ($41,x)
$0d:d85d  80 84		 bra $d7e3
$0d:d85f  15 41		 ora $41,x
$0d:d861  96 af		 stx $af,y
$0d:d863  52 af		 eor ($af)
$0d:d865  bd 2b 7d	  lda $7d2b,x
$0d:d868  6e e1 62	  ror $62e1
$0d:d86b  ab			plb
$0d:d86c  c9 2e d3	  cmp #$d32e
$0d:d86f  3a			dec a
$0d:d870  25 12		 and $12
$0d:d872  01 21		 ora ($21,x)
$0d:d874  46 0a		 lsr $0a
$0d:d876  85 11		 sta $11
$0d:d878  64 8d		 stz $8d
$0d:d87a  09 f6 07	  ora #$07f6
$0d:d87d  71 3d		 adc ($3d),y
$0d:d87f  e8			inx
$0d:d880  cf 76 d7 cd   cmp $cdd776
$0d:d884  04 e3		 tsb $e3
$0d:d886  59 38 c8	  eor $c838,y
$0d:d889  7c 2c 9e	  jmp ($9e2c,x)
$0d:d88c  3b			tsc
$0d:d88d  fc 02 87	  jsr ($8702,x)
$0d:d890  00 81		 brk #$81
$0d:d892  b0 86		 bcs $d81a
$0d:d894  8e c6 18	  stx $18c6
$0d:d897  7c 02 3f	  jmp ($3f02,x)
$0d:d89a  00 b4		 brk #$b4
$0d:d89c  65 fc		 adc $fc
$0d:d89e  d3 da		 cmp ($da,s),y
$0d:d8a0  8f ff 6b 13   sta $136bff
$0d:d8a4  c7 7f		 cmp [$7f]
$0d:d8a6  7b			tdc
$0d:d8a7  7a			ply
$0d:d8a8  ab			plb
$0d:d8a9  2c fe 5b	  bit $5bfe
$0d:d8ac  46 83		 lsr $83
$0d:d8ae  c1 e0		 cmp ($e0,x)
$0d:d8b0  10 0c		 bpl $d8be
$0d:d8b2  06 02		 asl $02
$0d:d8b4  91 00		 sta ($00),y
$0d:d8b6  90 48		 bcc $d900
$0d:d8b8  24 92		 bit $92
$0d:d8ba  0c 04 03	  tsb $0304
$0d:d8bd  67 00		 adc [$00]
$0d:d8bf  f4 c7 f3	  pea $f3c7
$0d:d8c2  1d bb ad	  ora $adbb,x
$0d:d8c5  d2 a1		 cmp ($a1)
$0d:d8c7  65 c7		 adc $c7
$0d:d8c9  72 a4		 adc ($a4)
$0d:d8cb  98			tya
$0d:d8cc  aa			tax
$0d:d8cd  cd 6a 97	  cmp $976a
$0d:d8d0  d6 70		 dec $70,x
$0d:d8d2  84 92		 sty $92
$0d:d8d4  01 8a		 ora ($8a,x)
$0d:d8d6  80 66		 bra $d93e
$0d:d8d8  a0 13 18	  ldy #$1813
$0d:d8db  05 c6		 ora $c6
$0d:d8dd  01 a5		 ora ($a5,x)
$0d:d8df  80 7b		 bra $d95c
$0d:d8e1  60			rts
$0d:d8e2  18			clc
$0d:d8e3  8b			phb
$0d:d8e4  9d d3 f7	  sta $f7d3,x
$0d:d8e7  c3 a7		 cmp $a7,s
$0d:d8e9  ca			dex
$0d:d8ea  b1 d8		 lda ($d8),y
$0d:d8ec  58			cli
$0d:d8ed  46 82		 lsr $82
$0d:d8ef  59 09 c6	  eor $c609,y
$0d:d8f2  c3 b1		 cmp $b1,s
$0d:d8f4  48			pha
$0d:d8f5  50 46		 bvc $d93d
$0d:d8f7  84 c3		 sty $c3
$0d:d8f9  ff 71 ff dc   sbc $dcff71,x
$0d:d8fd  ff f5 3f fd   sbc $fd3ff5,x
$0d:d901  c8			iny
$0d:d902  48			pha
$0d:d903  3b			tsc
$0d:d904  c8			iny
$0d:d905  04 12		 tsb $12
$0d:d907  55 84		 eor $84,x
$0d:d909  e9 51 bc	  sbc #$bc51
$0d:d90c  54 4c d3	  mvn $d3,$4c
$0d:d90f  e4 24		 cpx $24
$0d:d911  dc 8b 14	  jml [$148b]
$0d:d914  21 1a		 and ($1a,x)
$0d:d916  12 8f		 ora ($8f)
$0d:d918  fc 41 18	  jsr ($1841,x)
$0d:d91b  31 8f		 and ($8f),y
$0d:d91d  fe 20 90	  inc $9020,x
$0d:d920  26 70		 rol $70
$0d:d922  c1 c0		 cmp ($c0,x)
$0d:d924  bc 75 eb	  ldy $eb75,x
$0d:d927  bf 23 27 ac   lda $ac2723,x
$0d:d92b  fd f9 b9	  sbc $b9f9,x
$0d:d92e  7d 6f b7	  adc $b76f,x
$0d:d931  e7 b3		 sbc [$b3]
$0d:d933  1e fe 38	  asl $38fe,x
$0d:d936  80 c0		 bra $d8f8
$0d:d938  34 07		 bit $07,x
$0d:d93a  08			php
$0d:d93b  39 80 cc	  and $cc80,y
$0d:d93e  3e 08 05	  rol $0508,x
$0d:d941  22 97 29 e9   jsl $e92997
$0d:d945  e4 ec		 cpx $ec
$0d:d947  f4 5c 6f	  pea $6f5c
$0d:d94a  ae 73 54	  ldx $5473
$0d:d94d  ba			tsx
$0d:d94e  7a			ply
$0d:d94f  f4 3b 1b	  pea $1b3b
$0d:d952  8e d2 00	  stx $00d2
$0d:d955  5f 0f c4 03   eor $03c40f,x
$0d:d959  e5 00		 sbc $00
$0d:d95b  e3 40		 sbc $40,s
$0d:d95d  31 70		 and ($70),y
$0d:d95f  08			php
$0d:d960  f4 02 1d	  pea $1d02
$0d:d963  00 c1		 brk #$c1
$0d:d965  60			rts
$0d:d966  e6 97		 inc $97
$0d:d968  9a			txs
$0d:d969  ed 7b 6d	  sbc $6d7b
$0d:d96c  fa			plx
$0d:d96d  ba			tsx
$0d:d96e  fd e3 bb	  sbc $bbe3,x
$0d:d971  fc 9d da	  jsr ($da9d,x)
$0d:d974  e9 f9 be	  sbc #$bef9
$0d:d977  40			rti
$0d:d978  3f d0 0f 0c   and $0c0fd0,x
$0d:d97c  02 fb		 cop #$fb
$0d:d97e  00 86		 brk #$86
$0d:d980  c0 54 a2	  cpy #$a254
$0d:d983  a0 1f 85	  ldy #$851f
$0d:d986  76 5d		 ror $5d,x
$0d:d988  e9 fa dc	  sbc #$dcfa
$0d:d98b  f3 5d		 sbc ($5d,s),y
$0d:d98d  6d ee 92	  adc $92ee
$0d:d990  f5 c9		 sbc $c9,x
$0d:d992  fa			plx
$0d:d993  c4 fd		 cpy $fd
$0d:d995  3a			dec a
$0d:d996  79 dc 02	  adc $02dc,y
$0d:d999  30 82		 bmi $d91d
$0d:d99b  09 02 8c	  ora #$8c02
$0d:d99e  39 70 0c	  and $0c70,y
$0d:d9a1  3c 03 1f	  bit $1f03,x
$0d:d9a4  00 cf		 brk #$cf
$0d:d9a6  c0 7a 96	  cpy #$967a
$0d:d9a9  3b			tsc
$0d:d9aa  46 1f		 lsr $1f
$0d:d9ac  23 2f		 and $2f,s
$0d:d9ae  89 53 e4	  bit #$e453
$0d:d9b1  b9 e8 f5	  lda $f5e8,y
$0d:d9b4  23 13		 and $13,s
$0d:d9b6  22 a0 c5 04   jsl $04c5a0
$0d:d9ba  20 21 09	  jsr $0921
$0d:d9bd  07 fe		 ora [$fe]
$0d:d9bf  81 ff		 sta ($ff,x)
$0d:d9c1  c0 39 06	  cpy #$0639
$0d:d9c4  45 ff		 eor $ff
$0d:d9c6  8a			txa
$0d:d9c7  7f ef 7c 38   adc $387cef,x
$0d:d9cb  a6 1e		 ldx $1e
$0d:d9cd  f3 de		 sbc ($de,s),y
$0d:d9cf  f5 d7		 sbc $d7,x
$0d:d9d1  25 f7		 and $f7
$0d:d9d3  cb			wai
$0d:d9d4  2c fa 3b	  bit $3bfa
$0d:d9d7  bb			tyx
$0d:d9d8  96 f7		 stx $f7,y
$0d:d9da  a9 9a 0a	  lda #$0a9a
$0d:d9dd  47 82		 eor [$82]
$0d:d9df  20 02 0f	  jsr $0f02
$0d:d9e2  84 e3		 sty $e3
$0d:d9e4  a1 0c		 lda ($0c,x)
$0d:d9e6  fc 62 fe	  jsr ($fe62,x)
$0d:d9e9  dc 0f ff	  jml [$ff0f]
$0d:d9ec  7b			tdc
$0d:d9ed  87 28		 sta [$28]
$0d:d9ef  f0 e7		 beq $d9d8
$0d:d9f1  af 7d 79 d7   lda $d7797d
$0d:d9f5  c2 7d		 rep #$7d
$0d:d9f7  a6 be		 ldx $be
$0d:d9f9  6a			ror a
$0d:d9fa  bb			tyx
$0d:d9fb  9a			txs
$0d:d9fc  6b			rtl
$0d:d9fd  44 c2 0f	  mvp $0f,$c2
$0d:da00  12 83		 ora ($83)
$0d:da02  c2 a0		 rep #$a0
$0d:da04  b0 88		 bcs $d98e
$0d:da06  7c 62 1f	  jmp ($1f62,x)
$0d:da09  30 8f		 bmi $d99a
$0d:da0b  f2 2e		 sbc ($2e)
$0d:da0d  f3 0e		 sbc ($0e,s),y
$0d:da0f  fe 4a f7	  inc $f74a,x
$0d:da12  49 e0 ee	  eor #$eee0
$0d:da15  af 1a fb fe   lda $fefb1a
$0d:da19  c2 ff		 rep #$ff
$0d:da1b  b4 be		 ldy $be,x
$0d:da1d  66 af		 ror $af
$0d:da1f  ee 00 82	  inc $8200
$0d:da22  40			rti
$0d:da23  27 d0		 and [$d0]
$0d:da25  08			php
$0d:da26  39 98 4c	  and $4c98,y
$0d:da29  c1 03		 cmp ($03,x)
$0d:da2b  22 1c 5b fd   jsl $fd5b1c
$0d:da2f  93 e0		 sta ($e0,s),y
$0d:da31  4d 26 9f	  eor $9f26
$0d:da34  af f4 1b fd   lda $fd1bf4
$0d:da38  16 8f		 asl $8f,x
$0d:da3a  73 7f		 adc ($7f,s),y
$0d:da3c  ff e8 0c 06   sbc $060ce8,x
$0d:da40  01 3f		 ora ($3f,x)
$0d:da42  63 09		 adc $09,s
$0d:da44  7c 0b e0	  jmp ($e00b,x)
$0d:da47  c5 02		 cmp $02
$0d:da49  21 5d		 and ($5d,x)
$0d:da4b  20 54 dc	  jsr $dc54
$0d:da4e  dc 4a 93	  jml [$934a]
$0d:da51  81 92		 sta ($92,x)
$0d:da53  6a			ror a
$0d:da54  6f 5d 29 65   adc $65295d
$0d:da58  b8			clv
$0d:da59  98			tya
$0d:da5a  19 18 0b	  ora $0b18,y
$0d:da5d  98			tya
$0d:da5e  e4 9f		 cpx $9f
$0d:da60  f8			sed
$0d:da61  23 80		 and $80,s
$0d:da63  5c 21 91 ff   jml $ff9121
$0d:da67  ed 68 72	  sbc $7268
$0d:da6a  4b			phk
$0d:da6b  1c 56 e5	  trb $e556
$0d:da6e  48			pha
$0d:da6f  99 45 6d	  sta $6d45,y
$0d:da72  75 09		 adc $09,x
$0d:da74  fc bb 01	  jsr ($01bb,x)
$0d:da77  91 a0		 sta ($a0),y
$0d:da79  38			sec
$0d:da7a  42 20		 wdm #$20
$0d:da7c  e0 18 12	  cpx #$1218
$0d:da7f  20 dc e5	  jsr $e5dc
$0d:da82  1c c3 ee	  trb $eec3
$0d:da85  b2 d5		 lda ($d5)
$0d:da87  69 6c ca	  adc #$ca6c
$0d:da8a  b3 c9		 lda ($c9,s),y
$0d:da8c  ca			dex
$0d:da8d  c9 72 dc	  cmp #$dc72
$0d:da90  ca			dex
$0d:da91  1e df 9f	  asl $9fdf,x
$0d:da94  78			sei
$0d:da95  80 58		 bra $daef
$0d:da97  60			rts
$0d:da98  1c 38 06	  trb $0638
$0d:da9b  1a			inc a
$0d:da9c  01 62		 ora ($62,x)
$0d:da9e  80 2f		 bra $dacf
$0d:daa0  c0 c2 04	  cpy #$04c2
$0d:daa3  c0 c2 5f	  cpy #$5fc2
$0d:daa6  e3 3f		 sbc $3f,s
$0d:daa8  69 0f 7f	  adc #$7f0f
$0d:daab  95 35		 sta $35,x
$0d:daad  b9 67 64	  lda $6467,y
$0d:dab0  9d f9 97	  sta $97f9,x
$0d:dab3  32 91		 and ($91)
$0d:dab5  b6 b8		 ldx $b8,y
$0d:dab7  dc 78 dc	  jml [$dc78]
$0d:daba  6c e6 72	  jmp ($72e6)
$0d:dabd  09 04 c0	  ora #$c004
$0d:dac0  e0 72 19	  cpx #$1972
$0d:dac3  0e 4f 23	  asl $234f
$0d:dac6  0b			phd
$0d:dac7  84 90		 sty $90
$0d:dac9  57 f4		 eor [$f4],y
$0d:dacb  5f de 16 fe   eor $fe16de,x
$0d:dacf  21 6f		 and ($6f,x)
$0d:dad1  4c 87 53	  jmp $5387
$0d:dad4  57 ad		 eor [$ad],y
$0d:dad6  c0 6b ff	  cpy #$ff6b
$0d:dad9  ea			nop
$0d:dada  20 bf 80	  jsr $80bf
$0d:dadd  05 10		 ora $10
$0d:dadf  40			rti
$0d:dae0  12 26		 ora ($26)
$0d:dae2  06 72		 asl $72
$0d:dae4  31 08		 and ($08),y
$0d:dae6  c6 55		 dec $55
$0d:dae8  39 1b e8	  and $e81b,y
$0d:daeb  56 26		 lsr $26,x
$0d:daed  f9 a0 bf	  sbc $bfa0,y
$0d:daf0  c2 2e		 rep #$2e
$0d:daf2  f4 28 05	  pea $0528
$0d:daf5  8f ff 73 ff   sta $ff73ff
$0d:daf9  cc ff f7	  cpy $f7ff
$0d:dafc  1f fc 0d 10   ora $100dfc,x
$0d:db00  69 f0 90	  adc #$90f0
$0d:db03  63 a8		 adc $a8,s
$0d:db05  99 ad 25	  sta $25ad,y
$0d:db08  2f 8d 18 82   and $82188d
$0d:db0c  4a			lsr a
$0d:db0d  bc d1 9c	  ldy $9cd1,x
$0d:db10  a1 7c		 lda ($7c,x)
$0d:db12  3b			tsc
$0d:db13  58			cli
$0d:db14  ef fc 63 ff   sbc $ff63fc
$0d:db18  09 20 0c	  ora #$0c20
$0d:db1b  a3 fe		 lda $fe,s
$0d:db1d  7f 03 f8 76   adc $76f803,x
$0d:db21  bf fc 79 36   lda $3679fc,x
$0d:db25  cb			wai
$0d:db26  97 9d		 sta [$9d],y
$0d:db28  90 ed		 bcc $db17
$0d:db2a  e5 37		 sbc $37
$0d:db2c  ce 2f 6e	  dec $6e2f
$0d:db2f  65 cd		 adc $cd
$0d:db31  87 47		 sta [$47]
$0d:db33  bc 31 88	  ldy $8831,x
$0d:db36  04 12		 tsb $12
$0d:db38  01 c2		 ora ($c2,x)
$0d:db3a  80 27		 bra $db63
$0d:db3c  82 05 00	  brl $db44
$0d:db3f  86 40		 stx $40
$0d:db41  3e 0c c1	  rol $c10c,x
$0d:db44  86 71		 stx $71
$0d:db46  2d 7a 9c	  and $9c7a
$0d:db49  9f c6 53 b9   sta $b953c6,x
$0d:db4d  eb			xba
$0d:db4e  ff 69 f4 b5   sbc $b5f469,x
$0d:db52  08			php
$0d:db53  28			plp
$0d:db54  82 77 00	  brl $dbce
$0d:db57  8b			phb
$0d:db58  40			rti
$0d:db59  21 d0		 and ($d0,x)
$0d:db5b  0a			asl a
$0d:db5c  31 98		 and ($98),y
$0d:db5e  76 0c		 ror $0c,x
$0d:db60  c1 66		 cmp ($66,x)
$0d:db62  07 17		 ora [$17]
$0d:db64  f9 14 d5	  sbc $d514,y
$0d:db67  d1 6b		 cmp ($6b),y
$0d:db69  b2 7d		 lda ($7d)
$0d:db6b  5e aa bb	  lsr $bbaa,x
$0d:db6e  ec b5 64	  cpx $64b5
$0d:db71  fb			xce
$0d:db72  5a			phy
$0d:db73  59 9e 0e	  eor $0e9e,y
$0d:db76  01 df		 ora ($df,x)
$0d:db78  80 78		 bra $dbf2
$0d:db7a  e0 17 78	  cpx #$7817
$0d:db7d  0c ce 01	  tsb $01ce
$0d:db80  31 80		 and ($80),y
$0d:db82  5b			tcd
$0d:db83  20 14 f8	  jsr $f814
$0d:db86  07 57		 ora [$57]
$0d:db88  67 6a		 adc [$6a]
$0d:db8a  cc df 6c	  cpy $6cdf
$0d:db8d  9b			txy
$0d:db8e  ae b7 d7	  ldx $d7b7
$0d:db91  d7 c2		 cmp [$c2],y
$0d:db93  ea			nop
$0d:db94  f4 f7 5f	  pea $5ff7
$0d:db97  b9 be 3e	  lda $3ebe,y
$0d:db9a  01 c7		 ora ($c7,x)
$0d:db9c  80 62		 bra $dc00
$0d:db9e  e0 1e 13	  cpx #$131e
$0d:dba1  50 ce		 bvc $db71
$0d:dba3  20 17 c8	  jsr $c817
$0d:dba6  04 3e		 tsb $3e
$0d:dba8  03 96		 ora $96,s
$0d:dbaa  ed 4f b4	  sbc $b44f
$0d:dbad  97 da		 sta [$da],y
$0d:dbaf  df b7 4f 75   cmp $754fb7,x
$0d:dbb3  d3 ff		 cmp ($ff,s),y
$0d:dbb5  6b			rtl
$0d:dbb6  7c 1d e4	  jmp ($e41d,x)
$0d:dbb9  fe 79 e9	  inc $e979,x
$0d:dbbc  c0 72 e0	  cpy #$e072
$0d:dbbf  18			clc
$0d:dbc0  28			plp
$0d:dbc1  04 68		 tsb $68
$0d:dbc3  7a			ply
$0d:dbc4  10 08		 bpl $dbce
$0d:dbc6  34 02		 bit $02,x
$0d:dbc8  fd 00 e0	  sbc $e000,x
$0d:dbcb  40			rti
$0d:dbcc  22 5e 5c 5f   jsl $5f5c5e
$0d:dbd0  c6 81		 dec $81
$0d:dbd2  fe d1 5e	  inc $5ed1,x
$0d:dbd5  2b			pld
$0d:dbd6  33 bd		 and ($bd,s),y
$0d:dbd8  24 4a		 bit $4a
$0d:dbda  a5 88		 lda $88
$0d:dbdc  d4 d0		 pei ($d0)
$0d:dbde  e0 82 81	  cpx #$8182
$0d:dbe1  82 92 04	  brl $e076
$0d:dbe4  52 04		 eor ($04)
$0d:dbe6  30 02		 bmi $dbea
$0d:dbe8  95 0b		 sta $0b,x
$0d:dbea  5b			tcd
$0d:dbeb  a5 bf		 lda $bf
$0d:dbed  59 bb 71	  eor $71bb,y
$0d:dbf0  0d ec 23	  ora $23ec
$0d:dbf3  7a			ply
$0d:dbf4  13 00		 ora ($00,s),y
$0d:dbf6  88			dey
$0d:dbf7  50 b6		 bvc $dbaf
$0d:dbf9  b1 48		 lda ($48),y
$0d:dbfb  24 22		 bit $22
$0d:dbfd  11 99		 ora ($99),y
$0d:dbff  cc f2 f1	  cpy $f1f2
$0d:dc02  3d 3c 88	  and $883c,x
$0d:dc05  8c 22 11	  sty $1122
$0d:dc08  09 44 83	  ora #$8344
$0d:dc0b  89 3b a9	  bit #$a93b
$0d:dc0e  7f ac bd 98   adc $98bdac,x
$0d:dc12  1e 97 17	  asl $1797,x
$0d:dc15  2d 19 84	  and $8419
$0d:dc18  9b			txy
$0d:dc19  5d 9c bf	  eor $bf9c,x
$0d:dc1c  9b			txy
$0d:dc1d  02 03		 cop #$03
$0d:dc1f  00 9f		 brk #$9f
$0d:dc21  40			rti
$0d:dc22  1d 61 76	  ora $7661,x
$0d:dc25  21 0d		 and ($0d,x)
$0d:dc27  44 d8 20	  mvp $20,$d8
$0d:dc2a  70 80		 bvs $dbac
$0d:dc2c  51 22		 eor ($22),y
$0d:dc2e  50 0c		 bvc $dc3c
$0d:dc30  24 4b		 bit $4b
$0d:dc32  a1 d1		 lda ($d1,x)
$0d:dc34  cb			wai
$0d:dc35  df a0 7f eb   cmp $eb7fa0,x
$0d:dc39  64 08		 stz $08
$0d:dc3b  f8			sed
$0d:dc3c  14 40		 trb $40
$0d:dc3e  30 9e		 bmi $dbde
$0d:dc40  c2 5c		 rep #$5c
$0d:dc42  06 13		 asl $13
$0d:dc44  49 44 7f	  eor #$7f44
$0d:dc47  f2 bd		 sbc ($bd)
$0d:dc49  d4 bb		 pei ($bb)
$0d:dc4b  61 13		 adc ($13,x)
$0d:dc4d  d0 49		 bne $dc98
$0d:dc4f  30 d2		 bmi $dc23
$0d:dc51  dc 74 af	  jml [$af74]
$0d:dc54  2d d1 d7	  and $d7d1
$0d:dc57  93 02		 sta ($02,s),y
$0d:dc59  8b			phb
$0d:dc5a  00 1f		 brk #$1f
$0d:dc5c  00 f8		 brk #$f8
$0d:dc5e  2f 70 0b 9a   and $9a0b70
$0d:dc62  08			php
$0d:dc63  eb			xba
$0d:dc64  36 cf		 rol $cf,x
$0d:dc66  27 f2		 and [$f2]
$0d:dc68  75 33		 adc $33,x
$0d:dc6a  ae c6 e5	  ldx $e5c6
$0d:dc6d  b4 ef		 ldy $ef,x
$0d:dc6f  76 de		 ror $de,x
$0d:dc71  2f 7b da 6d   and $6dda7b
$0d:dc75  3f f0 3b f8   and $f83bf0,x
$0d:dc79  2c 89 e2	  bit $e289
$0d:dc7c  3e 00 30	  rol $3000,x
$0d:dc7f  52 e0		 eor ($e0)
$0d:dc81  11 bd		 ora ($bd),y
$0d:dc83  b4 9a		 ldy $9a,x
$0d:dc85  7d 5e e6	  adc $e65e,x
$0d:dc88  6f 3b 5b bb   adc $bb5b3b
$0d:dc8c  bd db dd	  lda $dddb,x
$0d:dc8f  ea			nop
$0d:dc90  ef 4b 65 bf   sbc $bf654b
$0d:dc94  fe 07 ff	  inc $ff07,x
$0d:dc97  00 68		 brk #$68
$0d:dc99  2f f1 a4 fa   and $faa4f1
$0d:dc9d  50 09		 bvc $dca8
$0d:dc9f  94 c3		 sty $c3,x
$0d:dca1  35 fd		 and $fd,x
$0d:dca3  e1 6f		 sbc ($6f,x)
$0d:dca5  ea			nop
$0d:dca6  12 fe		 ora ($fe)
$0d:dca8  a6 ef		 ldx $ef
$0d:dcaa  5b			tcd
$0d:dcab  80 b7		 bra $dc64
$0d:dcad  7b			tdc
$0d:dcae  a1 1f		 lda ($1f,x)
$0d:dcb0  fe 7a a0	  inc $a07a,x
$0d:dcb3  55 24		 eor $24,x
$0d:dcb5  83 28		 sta $28,s
$0d:dcb7  89 30 74	  bit #$7430
$0d:dcba  34 ce		 bit $ce,x
$0d:dcbc  1e 57 15	  asl $1557,x
$0d:dcbf  25 8c		 and $8c
$0d:dcc1  d1 64		 cmp ($64),y
$0d:dcc3  39 d8 d5	  and $d5d8,y
$0d:dcc6  37 17		 and [$17],y
$0d:dcc8  25 a0		 and $a0
$0d:dcca  c5 e1		 cmp $e1
$0d:dccc  9f f8 a7 fe   sta $fea7f8,x
$0d:dcd0  48			pha
$0d:dcd1  60			rts
$0d:dcd2  1c 21 80	  trb $8021
$0d:dcd5  40			rti
$0d:dcd6  60			rts
$0d:dcd7  01 07		 ora ($07,x)
$0d:dcd9  58			cli
$0d:dcda  55 a4		 eor $a4,x
$0d:dcdc  36 38		 rol $38,x
$0d:dcde  ac de a3	  ldy $a3de
$0d:dce1  44 99 c8	  mvp $c8,$99
$0d:dce4  b3 31		 lda ($31,s),y
$0d:dce6  1c 44 07	  trb $0744
$0d:dce9  d8			cld
$0d:dcea  e4 11		 cpx $11
$0d:dcec  02 e2		 cop #$e2
$0d:dcee  05 03		 ora $03
$0d:dcf0  ec ff fb	  cpx $fbff
$0d:dcf3  a2 38 0b	  ldx #$0b38
$0d:dcf6  fe de ef	  inc $efde,x
$0d:dcf9  f6 9f		 inc $9f,x
$0d:dcfb  6f af f1 fe   adc $fef1af
$0d:dcff  fe 76 fb	  inc $fb76,x
$0d:dd02  fd 9f 87	  sbc $879f,x
$0d:dd05  c9 ba 0a	  cmp #$0aba
$0d:dd08  22 90 7f cb   jsl $cb7f90
$0d:dd0c  c0 e4 01	  cpy #$01e4
$0d:dd0f  78			sei
$0d:dd10  48			pha
$0d:dd11  ff fd df ef   sbc $efdffd,x
$0d:dd15  ff fb ed f6   sbc $f6edfb,x
$0d:dd19  fb			xce
$0d:dd1a  ff bf ef ef   sbc $efefbf,x
$0d:dd1e  d3 ea		 cmp ($ea,s),y
$0d:dd20  1f 22 58 12   ora $125822,x
$0d:dd24  c2 24		 rep #$24
$0d:dd26  62 38 57	  per $3461
$0d:dd29  ff 21 6f 9a   sbc $9a6f21,x
$0d:dd2d  ff fd f7 fa   sbc $faf7fd,x
$0d:dd31  ef 7e 9f cf   sbc $cf9f7e
$0d:dd35  ab			plb
$0d:dd36  71 ba		 adc ($ba),y
$0d:dd38  75 3d		 adc $3d,x
$0d:dd3a  2c 85 d8	  bit $d885
$0d:dd3d  2e c1 90	  rol $90c1
$0d:dd40  40			rti
$0d:dd41  26 10		 rol $10
$0d:dd43  09 cc 02	  ora #$02cc
$0d:dd46  59 00 af	  eor $af00,y
$0d:dd49  40			rti
$0d:dd4a  31 17		 and ($17),y
$0d:dd4c  7a			ply
$0d:dd4d  5f fe 7f ff   eor $ff7ffe,x
$0d:dd51  fd df ed	  sbc $eddf,x
$0d:dd54  de f9 7f	  dec $7ff9,x
$0d:dd57  fe a5 d2	  inc $d2a5,x
$0d:dd5a  18			clc
$0d:dd5b  81 fd		 sta ($fd,x)
$0d:dd5d  1d 81 10	  ora $1081,x
$0d:dd60  76 0c		 ror $0c,x
$0d:dd62  b5 d8		 lda $d8,x
$0d:dd64  2c 30 ea	  bit $ea30
$0d:dd67  ca			dex
$0d:dd68  a5 bf		 lda $bf
$0d:dd6a  ff 5d be dd   sbc $ddbe5d,x
$0d:dd6e  ff 89 f4 cd   sbc $cdf489,x
$0d:dd72  a1 cb		 lda ($cb,x)
$0d:dd74  9a			txs
$0d:dd75  28			plp
$0d:dd76  61 16		 adc ($16,x)
$0d:dd78  07 f2		 ora [$f2]
$0d:dd7a  c0 df e7	  cpy #$e7df
$0d:dd7d  bf d9 de e6   lda $e6ded9,x
$0d:dd81  6b			rtl
$0d:dd82  f1 b1		 sbc ($b1),y
$0d:dd84  7a			ply
$0d:dd85  69 bd 18	  adc #$18bd
$0d:dd88  ae a7 e9	  ldx $e9a7
$0d:dd8b  81 66		 sta ($66,x)
$0d:dd8d  04 0a		 tsb $0a
$0d:dd8f  01 46		 ora ($46,x)
$0d:dd91  80 43		 bra $ddd6
$0d:dd93  a0 11 e8	  ldy #$e811
$0d:dd96  04 fa		 tsb $fa
$0d:dd98  01 7e		 ora ($7e,x)
$0d:dd9a  75 0d		 adc $0d,x
$0d:dd9c  4b			phk
$0d:dd9d  cb			wai
$0d:dd9e  28			plp
$0d:dd9f  a1 54		 lda ($54,x)
$0d:dda1  71 7a		 adc ($7a),y
$0d:dda3  28			plp
$0d:dda4  c5 6a		 cmp $6a
$0d:dda6  71 a1		 adc ($a1),y
$0d:dda8  89 d4 31	  bit #$31d4
$0d:ddab  5a			phy
$0d:ddac  aa			tax
$0d:ddad  14 13		 trb $13
$0d:ddaf  ff 81 26 09   sbc $092681,x
$0d:ddb3  14 08		 trb $08
$0d:ddb5  a0 43 22	  ldy #$2243
$0d:ddb8  28			plp
$0d:ddb9  50 b7		 bvc $dd72
$0d:ddbb  ba			tsx
$0d:ddbc  5b			tcd
$0d:ddbd  35 9b		 and $9b,x
$0d:ddbf  b7 08		 lda [$08],y
$0d:ddc1  ff 44 2f e1   sbc $e12f44,x
$0d:ddc5  30 08		 bmi $ddcf
$0d:ddc7  80 3c		 bra $de05
$0d:ddc9  27 93		 and [$93]
$0d:ddcb  c8			iny
$0d:ddcc  c4 03		 cpy $03
$0d:ddce  01 80		 ora ($80,x)
$0d:ddd0  ba			tsx
$0d:ddd1  dd 35 d2	  cmp $d235,x
$0d:ddd4  e8			inx
$0d:ddd5  0c 04 42	  tsb $4204
$0d:ddd8  01 f0		 ora ($f0,x)
$0d:ddda  db			stp
$0d:dddb  5e 66 b8	  lsr $b866,x
$0d:ddde  4e ae 67	  lsr $67ae
$0d:dde1  c7 aa		 cmp [$aa]
$0d:dde3  85 ee		 sta $ee
$0d:dde5  bc 94 0c	  ldy $0c94,x
$0d:dde8  d4 6f		 pei ($6f)
$0d:ddea  d1 32		 cmp ($32),y
$0d:ddec  66 05		 ror $05
$0d:ddee  ee 01 66	  inc $6601
$0d:ddf1  80 55		 bra $de48
$0d:ddf3  23 14		 and $14,s
$0d:ddf5  48			pha
$0d:ddf6  84 fe		 sty $fe
$0d:ddf8  01 64		 ora ($64,x)
$0d:ddfa  80 d1		 bra $ddcd
$0d:ddfc  60			rts
$0d:ddfd  5a			phy
$0d:ddfe  6b			rtl
$0d:ddff  3d 9a 31	  and $319a,x
$0d:de02  0a			asl a
$0d:de03  83 e7		 sta $e7,s
$0d:de05  6c 0c c0	  jmp ($c00c)
$0d:de08  b9 c0 21	  lda $21c0,y
$0d:de0b  90 36		 bcc $de43
$0d:de0d  60			rts
$0d:de0e  46 00		 lsr $00
$0d:de10  42 61		 wdm #$61
$0d:de12  a9 3d 34	  lda #$343d
$0d:de15  46 18		 lsr $18
$0d:de17  05 09		 ora $09
$0d:de19  1c 46 80	  trb $8046
$0d:de1c  22 1c 84 02   jsl $02841c
$0d:de20  84 75		 sty $75
$0d:de22  25 09		 and $09
$0d:de24  9c ca 07	  stz $07ca
$0d:de27  03 82		 ora $82,s
$0d:de29  41 51		 eor ($51,x)
$0d:de2b  f4 8e 08	  pea $088e
$0d:de2e  02 7a		 cop #$7a
$0d:de30  ea			nop
$0d:de31  bf fa ad 57   lda $57adfa,x
$0d:de35  55 aa		 eor $aa,x
$0d:de37  65 1a		 adc $1a
$0d:de39  d5 00		 cmp $00,x
$0d:de3b  41 55		 eor ($55,x)
$0d:de3d  80 2d		 bra $de6c
$0d:de3f  25 5e		 and $5e
$0d:de41  15 4a		 ora $4a,x
$0d:de43  ae af 56	  ldx $56af
$0d:de46  95 96		 sta $96,x
$0d:de48  01 6a		 ora ($6a,x)
$0d:de4a  d4 31		 pei ($31)
$0d:de4c  ba			tsx
$0d:de4d  e2 d5		 sep #$d5
$0d:de4f  38			sec
$0d:de50  f9 e9 df	  sbc $dfe9,y
$0d:de53  c3 0f		 cmp $0f,s
$0d:de55  e8			inx
$0d:de56  a3 e7		 lda $e7,s
$0d:de58  b7 6f		 lda [$6f],y
$0d:de5a  10 77		 bpl $ded3
$0d:de5c  84 16		 sty $16
$0d:de5e  0b			phd
$0d:de5f  39 80 9e	  and $9e80,y
$0d:de62  c2 1b		 rep #$1b
$0d:de64  05 cb		 ora $cb
$0d:de66  c1 cf		 cmp ($cf,x)
$0d:de68  60			rts
$0d:de69  01 07		 ora ($07,x)
$0d:de6b  f8			sed
$0d:de6c  61 6f		 adc ($6f,x)
$0d:de6e  53 ae		 eor ($ae,s),y
$0d:de70  26 4a		 rol $4a
$0d:de72  d9 45 ff	  cmp $ff45,y
$0d:de75  6f 77 d5 ba   adc $bad577
$0d:de79  d5 76		 cmp $76,x
$0d:de7b  bd 63 ce	  lda $ce63,x
$0d:de7e  18			clc
$0d:de7f  5b			tcd
$0d:de80  89 7b fa	  bit #$fa7b
$0d:de83  6b			rtl
$0d:de84  f5 1f		 sbc $1f,x
$0d:de86  76 f8		 ror $f8,x
$0d:de88  6f ef fb bb   adc $bbfbef
$0d:de8c  de ee ff	  dec $ffee,x
$0d:de8f  1e ef 67	  asl $67ef,x
$0d:de92  af e2 f0 c8   lda $c8f0e2
$0d:de96  d4 2f		 pei ($2f)
$0d:de98  26 a1		 rol $a1
$0d:de9a  82 1a 86	  brl $64b7
$0d:de9d  42 6a		 wdm #$6a
$0d:de9f  39 79 a8	  and $a879,y
$0d:dea2  76 bb		 ror $bb,x
$0d:dea4  dd df f7	  cmp $f7df,x
$0d:dea7  ff fd fe 7f   sbc $7ffefd,x
$0d:deab  7d be df	  adc $dfbe,x
$0d:deae  5f e7 5f 01   eor $015fe7,x
$0d:deb2  eb			xba
$0d:deb3  7f a8 5f f8   adc $f85fa8,x
$0d:deb7  11 80		 ora ($80),y
$0d:deb9  e2 5f		 sep #$5f
$0d:debb  f8			sed
$0d:debc  37 ff		 and [$ff],y
$0d:debe  fd ff 80	  sbc $80ff,x
$0d:dec1  ff fa f3 fd   sbc $fdf3fa,x
$0d:dec5  9d c7 d9	  sta $d9c7,x
$0d:dec8  24 c8		 bit $c8
$0d:deca  d4 74		 pei ($74)
$0d:decc  76 1f		 ror $1f,x
$0d:dece  5c a7 a1 10   jml $10a1a7
$0d:ded2  3b			tsc
$0d:ded3  84 02		 sty $02
$0d:ded5  01 0e		 ora ($0e,x)
$0d:ded7  80 46		 bra $df1f
$0d:ded9  e0 12		 cpx #$12
$0d:dedb  e8			inx
$0d:dedc  04 7a		 tsb $7a
$0d:dede  01 16		 ora ($16,x)
$0d:dee0  80 4b		 bra $df2d
$0d:dee2  d0 c3		 bne $dea7
$0d:dee4  7f 22 06 83   adc $830622,x
$0d:dee8  8d c2 b8	  sta $b8c2
$0d:deeb  74 20		 stz $20,x
$0d:deed  38			sec
$0d:deee  0e 6f 12	  asl $126f
$0d:def1  81 c0		 sta ($c0,x)
$0d:def3  90 68		 bcc $df5d
$0d:def5  0f e1 5f 80   ora $805fe1
$0d:def9  4f 51 43 7f   eor $7f4351
$0d:defd  80 4e		 bra $df4d
$0d:deff  e0 13		 cpx #$13
$0d:df01  f5 00		 sbc $00,x
$0d:df03  cb			wai
$0d:df04  a7 f4		 lda [$f4]
$0d:df06  dc 8f bf	  jml [$bf8f]
$0d:df09  03 3d		 ora $3d,s
$0d:df0b  e0 ac		 cpx #$ac
$0d:df0d  43 e7		 eor $e7,s
$0d:df0f  85 bf		 sta $bf
$0d:df11  e0 64		 cpx #$64
$0d:df13  bc 9e 04	  ldy $049e,x
$0d:df16  03 fc		 ora $fc,s
$0d:df18  c0 bc		 cpy #$bc
$0d:df1a  ae 7a 45	  ldx $457a
$0d:df1d  4b			phk
$0d:df1e  fa			plx
$0d:df1f  70 f3		 bvs $df14
$0d:df21  5e 39 25	  lsr $2539,x
$0d:df24  2e f5 43	  rol $43f5
$0d:df27  f7 70		 sbc [$70],y
$0d:df29  e3 16		 sbc $16,s
$0d:df2b  3b			tsc
$0d:df2c  04 03		 tsb $03
$0d:df2e  f9 00 be	  sbc $be00,y
$0d:df31  38			sec
$0d:df32  85 c2		 sta $c2
$0d:df34  0e 12 70	  asl $7012
$0d:df37  85 d7		 sta $d7
$0d:df39  eb			xba
$0d:df3a  a9 f9 d6	  lda #$d6f9
$0d:df3d  ad fa 5e	  lda $5efa
$0d:df40  75 36		 adc $36,x
$0d:df42  37 9a		 and [$9a],y
$0d:df44  d9 e9 7f	  cmp $7fe9,y
$0d:df47  bd af 74	  lda $74af,x
$0d:df4a  29 4c 22	  and #$224c
$0d:df4d  c0 53		 cpy #$53
$0d:df4f  81 20		 sta ($20,x)
$0d:df51  14 e1		 trb $e1
$0d:df53  7e 80 df	  ror $df80,x
$0d:df56  60			rts
$0d:df57  73 a9		 adc ($a9,s),y
$0d:df59  d6 53		 dec $53,x
$0d:df5b  95 46		 sta $46,x
$0d:df5d  f7 6a		 sbc [$6a],y
$0d:df5f  ae fb 0e	  ldx $0efb
$0d:df62  dd 63 99	  cmp $9963,x
$0d:df65  a4 df		 ldy $df
$0d:df67  66 e6		 ror $e6
$0d:df69  dc 50 30	  jml [$3050]
$0d:df6c  88			dey
$0d:df6d  5a			phy
$0d:df6e  ff 80 ff f0   sbc $f0ff80,x
$0d:df72  32 16		 and ($16)
$0d:df74  f9 ae ff	  sbc $ffae,y
$0d:df77  bf df b9 78   lda $78b9df,x
$0d:df7b  39 1c fa	  and $fa1c,y
$0d:df7e  df 2f 8d cc   cmp $cc8d2f,x
$0d:df82  98			tya
$0d:df83  ea			nop
$0d:df84  13 e1		 ora ($e1,s),y
$0d:df86  40			rti
$0d:df87  80 48		 bra $dfd1
$0d:df89  20 11 f8	  jsr $f811
$0d:df8c  04 c2		 tsb $c2
$0d:df8e  01 34		 ora ($34,x)
$0d:df90  80 4c		 bra $dfde
$0d:df92  e0 15		 cpx #$15
$0d:df94  74 f8		 stz $f8,x
$0d:df96  7f f5 ff f2   adc $f2fff5,x
$0d:df9a  90 52		 bcc $dfee
$0d:df9c  a1 00		 lda ($00,x)
$0d:df9e  60			rts
$0d:df9f  d7 7f		 cmp [$7f],y
$0d:dfa1  fe bf da	  inc $dabf,x
$0d:dfa4  4a			lsr a
$0d:dfa5  7c 0b c6	  jmp ($c60b,x)
$0d:dfa8  03 02		 ora $02,s
$0d:dfaa  f1 40		 sbc ($40),y
$0d:dfac  a0 02		 ldy #$02
$0d:dfae  70 c8		 bvs $df78
$0d:dfb0  62 37 59	  per $38ea
$0d:dfb3  89 46 22	  bit #$2246
$0d:dfb6  23 88		 and $88,s
$0d:dfb8  88			dey
$0d:dfb9  62 79 5d	  per $3d35
$0d:dfbc  9a			txs
$0d:dfbd  c7 2f		 cmp [$2f]
$0d:dfbf  1f 88 bb c0   ora $c0bb88,x
$0d:dfc3  2c f0 03	  bit $03f0
$0d:dfc6  f8			sed
$0d:dfc7  20 ca 6e	  jsr $6eca
$0d:dfca  88			dey
$0d:dfcb  13 f8		 ora ($f8,s),y
$0d:dfcd  54 a0 7f	  mvn $7f,$a0
$0d:dfd0  9b			txy
$0d:dfd1  ae 3b f5	  ldx $f53b
$0d:dfd4  2a			rol a
$0d:dfd5  e9 6b 6e	  sbc #$6e6b
$0d:dfd8  91 7f		 sta ($7f),y
$0d:dfda  36 e6		 rol $e6,x
$0d:dfdc  11 6c		 ora ($6c),y
$0d:dfde  86 b8		 stx $b8
$0d:dfe0  41 82		 eor ($82,x)
$0d:dfe2  1f d5 10 fe   ora $fe10d5,x
$0d:dfe6  e0 1f		 cpx #$1f
$0d:dfe8  93 20		 sta ($20,s),y
$0d:dfea  fc e0 15	  jsr ($15e0,x)
$0d:dfed  05 30		 ora $30
$0d:dfef  5d f1 1f	  eor $1ff1,x
$0d:dff2  f9 0f 7b	  sbc $7b0f,y
$0d:dff5  51 73		 eor ($73),y
$0d:dff7  8a			txa
$0d:dff8  7a			ply
$0d:dff9  f4 31 eb	  pea $eb31
$0d:dffc  a9 b0 57	  lda #$57b0
$0d:dfff  f8			sed
$0d:e000  6c 0d 47	  jmp ($470d)
$0d:e003  fe f9 7f	  inc $7ff9,x
$0d:e006  a5 42		 lda $42
$0d:e008  d9 e5 dc	  cmp $dce5,y
$0d:e00b  ff ca 9a c0   sbc $c09aca,x
$0d:e00f  5e 1c 04	  lsr $041c,x
$0d:e012  03 e8		 ora $e8,s
$0d:e014  5e 57 28	  lsr $2857,x
$0d:e017  70 e7		 bvs $e000
$0d:e019  b9 fb fd	  lda $fdfb,y
$0d:e01c  07 81		 ora [$81]
$0d:e01e  4c fe 53	  jmp $53fe
$0d:e021  3c 53 9f	  bit $9f53,x
$0d:e024  15 f3		 ora $f3,x
$0d:e026  c5 11		 cmp $11
$0d:e028  aa			tax
$0d:e029  17 8a		 ora [$8a],y
$0d:e02b  7f 00 81 91   adc $918100,x
$0d:e02f  04 0e		 tsb $0e
$0d:e031  5a			phy
$0d:e032  f8			sed
$0d:e033  05 46		 ora $46
$0d:e035  a9 32 fa	  lda #$fa32
$0d:e038  3e c2 59	  rol $59c2,x
$0d:e03b  e2 b9		 sep #$b9
$0d:e03d  7b			tdc
$0d:e03e  a8			tay
$0d:e03f  7c 0a f7	  jmp ($f70a,x)
$0d:e042  03 77		 ora $77,s
$0d:e044  bb			tyx
$0d:e045  06 84		 asl $84
$0d:e047  3c 0c a0	  bit $a00c,x
$0d:e04a  30 01		 bmi $e04d
$0d:e04c  85 12		 sta $12
$0d:e04e  01 55		 ora ($55,x)
$0d:e050  e6 52		 inc $52
$0d:e052  39 13 5d	  and $5d13,y
$0d:e055  65 0b		 adc $0b
$0d:e057  97 5d		 sta [$5d],y
$0d:e059  e6 59		 inc $59
$0d:e05b  3d 91 16	  and $1691,x
$0d:e05e  58			cli
$0d:e05f  cc d1 43	  cpy $43d1
$0d:e062  53 80		 eor ($80,s),y
$0d:e064  4d 60 03	  eor $0360
$0d:e067  f0 89		 beq $dff2
$0d:e069  97 8e		 sta [$8e],y
$0d:e06b  a3 01		 lda $01,s
$0d:e06d  fd dd 31	  sbc $31dd,x
$0d:e070  1f c9 37 63   ora $6337c9,x
$0d:e074  57 75		 eor [$75],y
$0d:e076  8a			txa
$0d:e077  fa			plx
$0d:e078  74 31		 stz $31,x
$0d:e07a  db			stp
$0d:e07b  9c 0d 42	  stz $420d
$0d:e07e  0c b2 65	  tsb $65b2
$0d:e081  82 84 0c	  brl $ed08
$0d:e084  e4 9f		 cpx $9f
$0d:e086  0a			asl a
$0d:e087  af 13 1b b7   lda $b71b13
$0d:e08b  f8			sed
$0d:e08c  6e f6 3f	  ror $3ff6
$0d:e08f  be 4e ce	  ldx $ce4e,y
$0d:e092  8d c5 d2	  sta $d2c5
$0d:e095  66 3b		 ror $3b
$0d:e097  1b			tcs
$0d:e098  c9 dc		 cmp #$dc
$0d:e09a  02 f7		 cop #$f7
$0d:e09c  00 bf		 brk #$bf
$0d:e09e  a0 8c		 ldy #$8c
$0d:e0a0  fe 08 32	  inc $3208,x
$0d:e0a3  da			phx
$0d:e0a4  ca			dex
$0d:e0a5  74 1f		 stz $1f,x
$0d:e0a7  ec 6f 7b	  cpx $7b6f
$0d:e0aa  19 de c9	  ora $c9de,y
$0d:e0ad  73 2c		 adc ($2c,s),y
$0d:e0af  3a			dec a
$0d:e0b0  19 14 72	  ora $7214,y
$0d:e0b3  3b			tsc
$0d:e0b4  3e ef 40	  rol $40ef,x
$0d:e0b7  3b			tsc
$0d:e0b8  e6 05		 inc $05
$0d:e0ba  4f 83 2c ab   eor $ab2c83
$0d:e0be  93 19		 sta ($19,s),y
$0d:e0c0  55 b3		 eor $b3,x
$0d:e0c2  2d 72 f2	  and $f272
$0d:e0c5  cb			wai
$0d:e0c6  70 14		 bvs $e0dc
$0d:e0c8  8a			txa
$0d:e0c9  ec 26 81	  cpx $8126
$0d:e0cc  35 9b		 and $9b,x
$0d:e0ce  c7 21		 cmp [$21]
$0d:e0d0  df f8 bf fe   cmp $febff8,x
$0d:e0d4  1b			tcs
$0d:e0d5  ff 89 7f e0   sbc $e07f89,x
$0d:e0d9  26 11		 rol $11
$0d:e0db  81 18		 sta ($18,x)
$0d:e0dd  47 b9		 eor [$b9]
$0d:e0df  22 81 40 68   jsl $684081
$0d:e0e3  11 f8		 ora ($f8),y
$0d:e0e5  25 4a		 and $4a
$0d:e0e7  05 f1		 ora $f1
$0d:e0e9  d0 52		 bne $e13d
$0d:e0eb  70 90		 bvs $e07d
$0d:e0ed  13 01		 ora ($01,s),y
$0d:e0ef  31 c2		 and ($c2),y
$0d:e0f1  3f ff a8 7f   and $7fa8ff,x
$0d:e0f5  fe 3f f8	  inc $f83f,x
$0d:e0f8  4b			phk
$0d:e0f9  18			clc
$0d:e0fa  5d 81 5b	  eor $5b81,x
$0d:e0fd  b7 79		 lda [$79],y
$0d:e0ff  3f 93 a9 9d   and $9da993,x
$0d:e103  76 37		 ror $37,x
$0d:e105  2d a7 5b	  and $5ba7
$0d:e108  a6 f1		 ldx $f1
$0d:e10a  7b			tdc
$0d:e10b  df b2 fd fd   cmp $fdfdb2,x
$0d:e10f  81 df		 sta ($df,x)
$0d:e111  d8			cld
$0d:e112  e4 04		 cpx $04
$0d:e114  7c de da	  jmp ($dade,x)
$0d:e117  4d 3e af	  eor $af3e
$0d:e11a  73 77		 adc ($77,s),y
$0d:e11c  9d bd dd	  sta $ddbd,x
$0d:e11f  da			phx
$0d:e120  ed ef f5	  sbc $f5ef
$0d:e123  77 f6		 adc [$f6],y
$0d:e125  37 ff		 and [$ff],y
$0d:e127  ff 03 ff 80   sbc $80ff03,x
$0d:e12b  01 d7		 ora ($d7,x)
$0d:e12d  53 99		 eor ($99,s),y
$0d:e12f  48			pha
$0d:e130  e4 4d		 cpx $4d
$0d:e132  75 94		 adc $94,x
$0d:e134  2e 5f 77	  rol $775f
$0d:e137  99 75 f6	  sta $f675,y
$0d:e13a  4a			lsr a
$0d:e13b  75 1d		 adc $1d,x
$0d:e13d  6e 64 ce	  ror $ce64
$0d:e140  01 37		 ora ($37,x)
$0d:e142  80 54		 bra $e198
$0d:e144  e0 13		 cpx #$13
$0d:e146  58			cli
$0d:e147  00 fc		 brk #$fc
$0d:e149  22 70 0a b9   jsl $b90a70
$0d:e14d  18			clc
$0d:e14e  71 51		 adc ($51),y
$0d:e150  3a			dec a
$0d:e151  8e 66 11	  stx $1166
$0d:e154  91 ca		 sta ($ca),y
$0d:e156  44 6d 7b	  mvp $7b,$6d
$0d:e159  3a			dec a
$0d:e15a  16 6f		 asl $6f,x
$0d:e15c  21 19		 and ($19,x)
$0d:e15e  a6 c4		 ldx $c4
$0d:e160  7d 90 0f	  adc $0f90,x
$0d:e163  71 80		 adc ($80),y
$0d:e165  f9 90 02	  sbc $0290,y
$0d:e168  fa			plx
$0d:e169  69 b0		 adc #$b0
$0d:e16b  98			tya
$0d:e16c  bc 3c 43	  ldy $433c,x
$0d:e16f  1f 14 c5 e9   ora $e9c514,x
$0d:e173  33 f2		 and ($f2,s),y
$0d:e175  9c b7 17	  stz $17b7
$0d:e178  77 29		 adc [$29],y
$0d:e17a  90 5e		 bcc $e1da
$0d:e17c  e0 17		 cpx #$17
$0d:e17e  f4 04 a8	  pea $a804
$0d:e181  42 51		 wdm #$51
$0d:e183  39 da f7	  and $f7da,y
$0d:e186  3c 12 99	  bit $9912,x
$0d:e189  ce a3 bb	  dec $bba3
$0d:e18c  4c 80 56	  jmp $5680
$0d:e18f  7a			ply
$0d:e190  9c dc 4e	  stz $4edc
$0d:e193  23 8f		 and $8f,s
$0d:e195  00 f1		 brk #$f1
$0d:e197  c0 3a		 cpy #$3a
$0d:e199  ea			nop
$0d:e19a  21 d9		 and ($d9,x)
$0d:e19c  c0 36		 cpy #$36
$0d:e19e  e4 61		 cpx $61
$0d:e1a0  bb			tyx
$0d:e1a1  c0 28		 cpy #$28
$0d:e1a3  4c 90 f7	  jmp $f790
$0d:e1a6  e4 2f		 cpx $2f
$0d:e1a8  f8			sed
$0d:e1a9  4f dd 13 3f   eor $3f13dd
$0d:e1ad  11 f7		 ora ($f7),y
$0d:e1af  51 b7		 eor ($b7),y
$0d:e1b1  3a			dec a
$0d:e1b2  21 24		 and ($24,x)
$0d:e1b4  8a			txa
$0d:e1b5  52 a3		 eor ($a3)
$0d:e1b7  c8			iny
$0d:e1b8  d0 7a		 bne $e234
$0d:e1ba  6a			ror a
$0d:e1bb  f7 c8		 sbc [$c8],y
$0d:e1bd  04 66		 tsb $66
$0d:e1bf  0b			phd
$0d:e1c0  fc d5 7f	  jsr ($7fd5,x)
$0d:e1c3  ab			plb
$0d:e1c4  b7 f9		 lda [$f9],y
$0d:e1c6  34 1c		 bit $1c,x
$0d:e1c8  82 11 78	  brl $59dc
$0d:e1cb  06 0e		 asl $0e
$0d:e1cd  01 e7		 ora ($e7,x)
$0d:e1cf  80 40		 bra $e211
$0d:e1d1  e0 10		 cpx #$10
$0d:e1d3  18			clc
$0d:e1d4  06 02		 asl $02
$0d:e1d6  01 f8		 ora ($f8,x)
$0d:e1d8  80 70		 bra $e24a
$0d:e1da  27 db		 and [$db]
$0d:e1dc  ab			plb
$0d:e1dd  fc 1b bd	  jsr ($bd1b,x)
$0d:e1e0  47 e8		 eor [$e8]
$0d:e1e2  d7 ba		 cmp [$ba],y
$0d:e1e4  15 ae		 ora $ae,x
$0d:e1e6  8f 02 9d e5   sta $e59d02
$0d:e1ea  e0 3a		 cpx #$3a
$0d:e1ec  40			rti
$0d:e1ed  00 12		 brk #$12
$0d:e1ef  18			clc
$0d:e1f0  04 ba		 tsb $ba
$0d:e1f2  01 2f		 ora ($2f,x)
$0d:e1f4  03 0c		 ora $0c,s
$0d:e1f6  fc 14 30	  jsr ($3014,x)
$0d:e1f9  1b			tcs
$0d:e1fa  fe bb fd	  inc $fdbb,x
$0d:e1fd  79 bc fa	  adc $fabc,y
$0d:e200  f8			sed
$0d:e201  33 38		 and ($38,s),y
$0d:e203  4c cb 91	  jmp $91cb
$0d:e206  4f 9c e1 60   eor $60e19c
$0d:e20a  2e b0 74	  rol $74b0
$0d:e20d  86 1a		 stx $1a
$0d:e20f  01 3e		 ora ($3e,x)
$0d:e211  80 7f		 bra $e292
$0d:e213  99 82 27	  sta $2782,y
$0d:e216  01 38		 ora ($38,x)
$0d:e218  13 e3		 ora ($e3,s),y
$0d:e21a  85 1b		 sta $1b
$0d:e21c  b3 5d		 lda ($5d,s),y
$0d:e21e  f1 1f		 sbc ($1f),y
$0d:e220  f2 fd		 sbc ($fd)
$0d:e222  62 00 03	  per $e525
$0d:e225  41 80		 eor ($80,x)
$0d:e227  ff 7d d9 2b   sbc $2bd97d,x
$0d:e22b  e6 1f		 inc $1f
$0d:e22d  f3 44		 sbc ($44,s),y
$0d:e22f  ce 44 bd	  dec $bd44
$0d:e232  94 5d		 sty $5d,x
$0d:e234  ce 8e 06	  dec $068e
$0d:e237  27 21		 and [$21]
$0d:e239  49 18		 eor #$18
$0d:e23b  53 f9		 eor ($f9,s),y
$0d:e23d  00 dc		 brk #$dc
$0d:e23f  7f 38 9b 8a   adc $8a9b38,x
$0d:e243  37 17		 and [$17],y
$0d:e245  13 b3		 ora ($b3,s),y
$0d:e247  f8			sed
$0d:e248  ee fa 3b	  inc $3bfa
$0d:e24b  bd 56 46	  lda $4656,x
$0d:e24e  85 c2		 sta $c2
$0d:e250  bf c0 0f e1   lda $e10fc0,x
$0d:e254  3b			tsc
$0d:e255  40			rti
$0d:e256  0a			asl a
$0d:e257  15 27		 ora $27,x
$0d:e259  b0 0e		 bcs $e269
$0d:e25b  ed fa 51	  sbc $51fa
$0d:e25e  16 b1		 asl $b1,x
$0d:e260  e8			inx
$0d:e261  f2 7c		 sbc ($7c)
$0d:e263  d8			cld
$0d:e264  67 7b		 adc [$7b]
$0d:e266  19 de a9	  ora $a9de,y
$0d:e269  e3 61		 sbc $61,s
$0d:e26b  30 9d		 bmi $e20a
$0d:e26d  fb			xce
$0d:e26e  30 7b		 bmi $e2eb
$0d:e270  86 47		 stx $47
$0d:e272  fb			xce
$0d:e273  3a			dec a
$0d:e274  06 91		 asl $91
$0d:e276  37 ba		 and [$ba],y
$0d:e278  c2 b0		 rep #$b0
$0d:e27a  b7 e7		 lda [$e7],y
$0d:e27c  30 53		 bmi $e2d1
$0d:e27e  26 37		 rol $37
$0d:e280  68			pla
$0d:e281  4e d0 fe	  lsr $fed0
$0d:e284  06 12		 asl $12
$0d:e286  30 8c		 bmi $e214
$0d:e288  0f ff 01 64   ora $6401ff
$0d:e28c  1c 02 16	  trb $1602
$0d:e28f  b9 0b a4	  lda $a40b,y
$0d:e292  27 1d		 and [$1d]
$0d:e294  7c 5b b4	  jmp ($b45b,x)
$0d:e297  2d 94 8c	  and $8c94
$0d:e29a  67 0f		 adc [$0f]
$0d:e29c  84 ce		 sty $ce
$0d:e29e  99 7b 9f	  sta $9f7b,y
$0d:e2a1  c8			iny
$0d:e2a2  2e 12 ab	  rol $ab12
$0d:e2a5  2d 9e 5f	  and $5f9e
$0d:e2a8  6e 92 cb	  ror $cb92
$0d:e2ab  6c ec 05	  jmp ($05ec)
$0d:e2ae  00 3c		 brk #$3c
$0d:e2b0  06 07		 asl $07
$0d:e2b2  12 f7		 ora ($f7)
$0d:e2b4  ff bf fa e8   sbc $e8fabf,x
$0d:e2b8  fc 7b ef	  jsr ($ef7b,x)
$0d:e2bb  ff f2 5f 3c   sbc $3c5ff2,x
$0d:e2bf  ff ed 3b fd   sbc $fd3bed,x
$0d:e2c3  e1 1f		 sbc ($1f,x)
$0d:e2c5  f8			sed
$0d:e2c6  d7 fe		 cmp [$fe],y
$0d:e2c8  31 ff		 and ($ff),y
$0d:e2ca  ac 50 e7	  ldy $e750
$0d:e2cd  f5 d9		 sbc $d9,x
$0d:e2cf  85 2f		 sta $2f
$0d:e2d1  63 15		 adc $15,s
$0d:e2d3  99 d4 a6	  sta $a6d4,y
$0d:e2d6  36 a8		 rol $a8,x
$0d:e2d8  25 6f		 and $6f
$0d:e2da  6d 19 9b	  adc $9b19
$0d:e2dd  18			clc
$0d:e2de  0b			phd
$0d:e2df  00 c0		 brk #$c0
$0d:e2e1  38			sec
$0d:e2e2  81 08		 sta ($08,x)
$0d:e2e4  e5 3f		 sbc $3f
$0d:e2e6  ee 9c 1a	  inc $1a9c
$0d:e2e9  d3 44		 cmp ($44,s),y
$0d:e2eb  9e c8 34	  stz $34c8,x
$0d:e2ee  7c 6a bc	  jmp ($bc6a,x)
$0d:e2f1  8a			txa
$0d:e2f2  a3 66		 lda $66,s
$0d:e2f4  c9 d9 94	  cmp #$94d9
$0d:e2f7  c5 82		 cmp $82
$0d:e2f9  ff f0 9f f5   sbc $f59ff0,x
$0d:e2fd  53 ae		 eor ($ae,s),y
$0d:e2ff  40			rti
$0d:e300  ae 30 ca	  ldx $ca30
$0d:e303  04 43		 tsb $43
$0d:e305  87 38		 sta [$38]
$0d:e307  a0 cd 31	  ldy #$31cd
$0d:e30a  16 0f		 asl $0f,x
$0d:e30c  ff fe a7 ff   sbc $ffa7fe,x
$0d:e310  81 11		 sta ($11,x)
$0d:e312  8e 71 ff	  stx $ff71
$0d:e315  9a			txs
$0d:e316  7f e4 0a 72   adc $720ae4,x
$0d:e31a  24 84		 bit $84
$0d:e31c  02 95		 cop #$95
$0d:e31e  b4 81		 ldy $81,x
$0d:e320  4c 78 32	  jmp $3278
$0d:e323  a8			tay
$0d:e324  96 16		 stx $16,y
$0d:e326  45 58		 eor $58
$0d:e328  3f 82 48 4c   and $4c4882,x
$0d:e32c  03 30		 ora $30,s
$0d:e32e  ff ca 3f f0   sbc $f03fca,x
$0d:e332  4f fd 00 c0   eor $c000fd
$0d:e336  1d a8 26	  ora $26a8,x
$0d:e339  02 3f		 cop #$3f
$0d:e33b  c0 88 71	  cpy #$7188
$0d:e33e  e6 1c		 inc $1c
$0d:e340  f8			sed
$0d:e341  96 12		 stx $12,y
$0d:e343  43 96		 eor $96,s
$0d:e345  82 7c 3b	  brl $1ec4
$0d:e348  44 21 e0	  mvp $e0,$21
$0d:e34b  7f f8 ff fe   adc $fefff8,x
$0d:e34f  7f ff 09 ff   adc $ff09ff,x
$0d:e353  c3 7f		 cmp $7f,s
$0d:e355  fe 06 00	  inc $0006,x
$0d:e358  ed c8 20	  sbc $20c8
$0d:e35b  1f c8 0c 0b   ora $0b0cc8,x
$0d:e35f  d1 02		 cmp ($02),y
$0d:e361  9c 70 a1	  stz $a170
$0d:e364  10 4c		 bpl $e3b2
$0d:e366  54 83 1d	  mvn $1d,$83
$0d:e369  db			stp
$0d:e36a  30 0c		 bmi $e378
$0d:e36c  07 ff		 ora [$ff]
$0d:e36e  e8			inx
$0d:e36f  44 08 a0	  mvp $a0,$08
$0d:e372  05 01		 ora $01
$0d:e374  8e ff f9	  stx $f9ff
$0d:e377  6f f3 da 04   adc $04daf3
$0d:e37b  17 e5		 ora [$e5],y
$0d:e37d  e2 bc		 sep #$bc
$0d:e37f  4c 28 f5	  jmp $f528
$0d:e382  1c 7c 6f	  trb $6f7c
$0d:e385  41 00		 eor ($00,x)
$0d:e387  e5 97		 sbc $97
$0d:e389  c9 9a		 cmp #$9a
$0d:e38b  02 80		 cop #$80
$0d:e38d  83 92		 sta $92,s
$0d:e38f  84 96		 sty $96
$0d:e391  1c bf fd	  trb $fdbf
$0d:e394  9f 7d 3c c1   sta $c13c7d,x
$0d:e398  58			cli
$0d:e399  31 f0		 and ($f0),y
$0d:e39b  7c f4 33	  jmp ($33f4,x)
$0d:e39e  c5 4a		 cmp $4a
$0d:e3a0  d8			cld
$0d:e3a1  ce 30 b0	  dec $b030
$0d:e3a4  0e 98 24	  asl $2498
$0d:e3a7  b1 ff		 lda ($ff),y
$0d:e3a9  fc 87 ff	  jsr ($ff87,x)
$0d:e3ac  c1 ff		 cmp ($ff,x)
$0d:e3ae  c0 8a		 cpy #$8a
$0d:e3b0  07 a7		 ora [$a7]
$0d:e3b2  ff de f0 eb   sbc $ebf0de,x
$0d:e3b6  5c 3c cc f7   jml $f7cc3c
$0d:e3ba  ef 82 f7 d0   sbc $d0f782
$0d:e3be  73 3b		 adc ($3b,s),y
$0d:e3c0  c1 88		 cmp ($88,x)
$0d:e3c2  0b			phd
$0d:e3c3  c2 01		 rep #$01
$0d:e3c5  00 9e		 brk #$9e
$0d:e3c7  40			rti
$0d:e3c8  28			plp
$0d:e3c9  50 08		 bvc $e3d3
$0d:e3cb  4c 03 20	  jmp $2003
$0d:e3ce  42 12		 wdm #$12
$0d:e3d0  08			php
$0d:e3d1  0f c3 7b eb   ora $eb7bc3
$0d:e3d5  ad 74 f3	  lda $f374
$0d:e3d8  32 4f		 and ($4f)
$0d:e3da  7c 93 ef	  jmp ($ef93,x)
$0d:e3dd  24 29		 bit $29
$0d:e3df  85 6b		 sta $6b
$0d:e3e1  97 bd		 sta [$bd],y
$0d:e3e3  eb			xba
$0d:e3e4  c4 20		 cpy $20
$0d:e3e6  12 42		 ora ($42)
$0d:e3e8  10 d4		 bpl $e3be
$0d:e3ea  92 80		 sta ($80)
$0d:e3ec  42 13		 wdm #$13
$0d:e3ee  08			php
$0d:e3ef  42 0c		 wdm #$0c
$0d:e3f1  81 d0		 sta ($d0,x)
$0d:e3f3  c0 5f		 cpy #$5f
$0d:e3f5  fd b3 dc	  sbc $dcb3,x
$0d:e3f8  8d e2 35	  sta $35e2
$0d:e3fb  f9 99 7c	  sbc $7c99,y
$0d:e3fe  77 57		 adc [$57],y
$0d:e400  bc a5 de	  ldy $dea5,x
$0d:e403  5e 4c 18	  lsr $184c,x
$0d:e406  14 02		 trb $02
$0d:e408  0e 84 18	  asl $1884
$0d:e40b  7c 02 08	  jmp ($0802,x)
$0d:e40e  6c 08 0d	  jmp ($0d08)
$0d:e411  9a			txs
$0d:e412  c6 a3		 dec $a3
$0d:e414  09 64		 ora #$64
$0d:e416  bf 55 53 ab   lda $ab5355,x
$0d:e41a  7a			ply
$0d:e41b  fc df ba	  jsr ($badf,x)
$0d:e41e  b7 ee		 lda [$ee],y
$0d:e420  55 73		 eor $73,x
$0d:e422  ce 13 07	  dec $0713
$0d:e425  a0 d2		 ldy #$d2
$0d:e427  05 21		 ora $21
$0d:e429  90 43		 bcc $e46e
$0d:e42b  39 80 f2	  and $f280,y
$0d:e42e  e0 27		 cpx #$27
$0d:e430  bb			tyx
$0d:e431  ff ac 37 d5   sbc $d537ac,x
$0d:e435  87 9b		 sta [$9b]
$0d:e437  ee 3a 37	  inc $373a
$0d:e43a  0c dd 7f	  tsb $7fdd
$0d:e43d  97 34		 sta [$34],y
$0d:e43f  bf c0 28 08   lda $0828c0,x
$0d:e443  21 b8		 and ($b8,x)
$0d:e445  30 05		 bmi $e44c
$0d:e447  12 12		 ora ($12)
$0d:e449  02 60		 cop #$60
$0d:e44b  f9 e8 3b	  sbc $3be8,y
$0d:e44e  cb			wai
$0d:e44f  ef be e1 97   sbc $97e1be
$0d:e453  b0 fb		 bcs $e450
$0d:e455  23 bc		 and $bc,s
$0d:e457  ba			tsx
$0d:e458  76 e6		 ror $e6,x
$0d:e45a  f5 d3		 sbc $d3,x
$0d:e45c  96 4f		 stx $4f,y
$0d:e45e  90 42		 bcc $e4a2
$0d:e460  3f 08 72 08   and $087208,x
$0d:e464  66 08		 ror $08
$0d:e466  a1 1f		 lda ($1f,x)
$0d:e468  84 96		 sty $96
$0d:e46a  df 27 b7 4d   cmp $4db727,x
$0d:e46e  ed f6 f9	  sbc $f9f6
$0d:e471  c4 fe		 cpy $fe
$0d:e473  e9 3d		 sbc #$3d
$0d:e475  bf fb ef f2   lda $f2effb,x
$0d:e479  2e ef fd	  rol $fdef
$0d:e47c  22 10 17 f8   jsl $f81710
$0d:e480  c1 ff		 cmp ($ff,x)
$0d:e482  f0 b7		 beq $e43b
$0d:e484  f8			sed
$0d:e485  82 8b 4d	  brl $3213
$0d:e488  ae bb fb	  ldx $fbbb
$0d:e48b  3e f4 ed	  rol $edf4,x
$0d:e48e  bf df 1d de   lda $de1ddf,x
$0d:e492  ff fd bf f3   sbc $f3bffd,x
$0d:e496  1e 77 fe	  asl $fe77,x
$0d:e499  b1 ff		 lda ($ff),y
$0d:e49b  ec 7f e3	  cpx $e37f
$0d:e49e  1f ff c7 fe   ora $fec7ff,x
$0d:e4a2  f0 09		 beq $e4ad
$0d:e4a4  4b			phk
$0d:e4a5  5c 52 37 01   jml $013752
$0d:e4a9  9a			txs
$0d:e4aa  74 e4		 stz $e4,x
$0d:e4ac  51 09		 eor ($09),y
$0d:e4ae  4c 42 41	  jmp $4142
$0d:e4b1  9f 9d e0 20   sta $20e09d,x
$0d:e4b5  bc 00 51	  ldy $5100,x
$0d:e4b8  70 01		 bvs $e4bb
$0d:e4ba  27 80		 and [$80]
$0d:e4bc  24 09		 bit $09
$0d:e4be  0c 2a b2	  tsb $b22a
$0d:e4c1  29 9d		 and #$9d
$0d:e4c3  02 af		 cop #$af
$0d:e4c5  ea			nop
$0d:e4c6  b2 e0		 lda ($e0)
$0d:e4c8  b2 b0		 lda ($b0)
$0d:e4ca  2e 47 fb	  rol $fb47
$0d:e4cd  fd 00 92	  sbc $9200,x
$0d:e4d0  40			rti
$0d:e4d1  48			pha
$0d:e4d2  e5 08		 sbc $08
$0d:e4d4  04 a8		 tsb $a8
$0d:e4d6  00 bb		 brk #$bb
$0d:e4d8  10 6a		 bpl $e544
$0d:e4da  ac 22 97	  ldy $9722
$0d:e4dd  20 c0 55	  jsr $55c0
$0d:e4e0  20 17 ff	  jsr $ff17
$0d:e4e3  e4 0a		 cpx $0a
$0d:e4e5  a3 2e		 lda $2e,s
$0d:e4e7  80 72		 bra $e55b
$0d:e4e9  20 4f f1	  jsr $f14f
$0d:e4ec  90 7f		 bcc $e56d
$0d:e4ee  e2 9f		 sep #$9f
$0d:e4f0  f9 ff fc	  sbc $fcff,y
$0d:e4f3  fe 07 f0	  inc $f007,x
$0d:e4f6  e4 01		 cpx $01
$0d:e4f8  c3 f1		 cmp $f1,s
$0d:e4fa  30 cc		 bmi $e4c8
$0d:e4fc  f0 e2		 beq $e4e0
$0d:e4fe  90 29		 bcc $e529
$0d:e500  4c 0b ca	  jmp $ca0b
$0d:e503  ff 0c 8d f1   sbc $f18d0c,x
$0d:e507  da			phx
$0d:e508  04 32		 tsb $32
$0d:e50a  82 7f e5	  brl $ca8c
$0d:e50d  1f ff 20 25   ora $2520ff,x
$0d:e511  60			rts
$0d:e512  dc 08 a6	  jml [$a608]
$0d:e515  0a			asl a
$0d:e516  49 91		 eor #$91
$0d:e518  80 e7		 bra $e501
$0d:e51a  26 7c		 rol $7c
$0d:e51c  88			dey
$0d:e51d  86 16		 stx $16
$0d:e51f  01 92		 ora ($92,x)
$0d:e521  98			tya
$0d:e522  e3 88		 sbc $88,s
$0d:e524  60			rts
$0d:e525  61 0c		 adc ($0c,x)
$0d:e527  0f ff 18 8c   ora $8c18ff
$0d:e52b  1c 27 ff	  trb $ff27
$0d:e52e  04 48		 tsb $48
$0d:e530  1b			tcs
$0d:e531  04 22		 tsb $22
$0d:e533  41 ca		 eor ($ca,x)
$0d:e535  93 62		 sta ($62,s),y
$0d:e537  38			sec
$0d:e538  11 a9		 ora ($a9),y
$0d:e53a  07 0b		 ora [$0b]
$0d:e53c  0d d0 81	  ora $81d0
$0d:e53f  4a			lsr a
$0d:e540  36 94		 rol $94,x
$0d:e542  a3 18		 lda $18,s
$0d:e544  62 1c 02	  per $e763
$0d:e547  24 00		 bit $00
$0d:e549  20 44 14	  jsr $1444
$0d:e54c  82 04 09	  brl $ee53
$0d:e54f  4d 03 91	  eor $9103
$0d:e552  77 cc		 adc [$cc],y
$0d:e554  cf f1 53 bc   cmp $bc53f1
$0d:e558  bc de e5	  ldy $e5de,x
$0d:e55b  be ea dc	  ldx $dcea,y
$0d:e55e  64 75		 stz $75
$0d:e560  f8			sed
$0d:e561  06 7d		 asl $7d
$0d:e563  fe 14 0c	  inc $0c14,x
$0d:e566  fd 13 3f	  sbc $3f13,x
$0d:e569  48			pha
$0d:e56a  cf d0 73 f0   cmp $f073d0
$0d:e56e  e0 00		 cpx #$00
$0d:e570  eb			xba
$0d:e571  2f b7 6a bc   and $bc6ab7
$0d:e575  42 eb		 wdm #$eb
$0d:e577  eb			xba
$0d:e578  96 d1		 stx $d1,y
$0d:e57a  2d b8 5b	  and $5bb8
$0d:e57d  f5 1b		 sbc $1b,x
$0d:e57f  87 36		 sta [$36]
$0d:e581  84 a2		 sty $a2
$0d:e583  40			rti
$0d:e584  c6 10		 dec $10
$0d:e586  af fc 48 48   lda $4848fc
$0d:e58a  29 d0		 and #$d0
$0d:e58c  9e 27 43	  stz $4327,x
$0d:e58f  ff 62 c5 72   sbc $72c562,x
$0d:e593  e3 1b		 sbc $1b,s
$0d:e595  5b			tcd
$0d:e596  9d 66 2d	  sta $2d66,x
$0d:e599  6f e4 d3 a0   adc $a0d3e4
$0d:e59d  1b			tcs
$0d:e59e  78			sei
$0d:e59f  85 ee		 sta $ee
$0d:e5a1  a5 09		 lda $09
$0d:e5a3  fe 55 f6	  inc $f655,x
$0d:e5a6  14 ec		 trb $ec
$0d:e5a8  05 bf		 ora $bf
$0d:e5aa  01 b0		 ora ($b0,x)
$0d:e5ac  c0 4c		 cpy #$4c
$0d:e5ae  78			sei
$0d:e5af  10 fe		 bpl $e5af
$0d:e5b1  04 37		 tsb $37
$0d:e5b3  01 22		 ora ($22,x)
$0d:e5b5  94 5a		 sty $5a,x
$0d:e5b7  71 9d		 adc ($9d),y
$0d:e5b9  6b			rtl
$0d:e5ba  3f 37 69 7b   and $7b6937,x
$0d:e5be  a4 ee		 ldy $ee
$0d:e5c0  20 3f 68	  jsr $683f
$0d:e5c3  25 bf		 and $bf
$0d:e5c5  49 c8		 eor #$c8
$0d:e5c7  8f fd 60 d3   sta $d360fd
$0d:e5cb  98			tya
$0d:e5cc  05 ee		 ora $ee
$0d:e5ce  01 86		 ora ($86,x)
$0d:e5d0  80 51		 bra $e623
$0d:e5d2  e0 37		 cpx #$37
$0d:e5d4  88			dey
$0d:e5d5  0f 66 01 58   ora $580166
$0d:e5d9  dd cb 7b	  cmp $7bcb,x
$0d:e5dc  b5 5f		 lda $5f,x
$0d:e5de  65 47		 adc $47
$0d:e5e0  bf 24 f3 d2   lda $d2f324,x
$0d:e5e4  b8			clv
$0d:e5e5  16 ef		 asl $ef,x
$0d:e5e7  f6 8a		 inc $8a,x
$0d:e5e9  bf 04 80 40   lda $408004,x
$0d:e5ed  a0 10		 ldy #$10
$0d:e5ef  38			sec
$0d:e5f0  04 82		 tsb $82
$0d:e5f2  01 18		 ora ($18,x)
$0d:e5f4  80 4f		 bra $e645
$0d:e5f6  e0 10		 cpx #$10
$0d:e5f8  14 e8		 trb $e8
$0d:e5fa  40			rti
$0d:e5fb  30 b5		 bmi $e5b2
$0d:e5fd  7c ce be	  jmp ($bece,x)
$0d:e600  25 de		 and $de
$0d:e602  a6 5f		 ldx $5f
$0d:e604  26 7f		 rol $7f
$0d:e606  2e 94 b7	  rol $b794
$0d:e609  db			stp
$0d:e60a  ec a4 ef	  cpx $efa4
$0d:e60d  e7 18		 sbc [$18]
$0d:e60f  0b			phd
$0d:e610  84 03		 sty $03
$0d:e612  c3 00		 cmp $00,s
$0d:e614  c1 c0		 cmp ($c0,x)
$0d:e616  21 ae		 and ($ae,x)
$0d:e618  70 80		 bvs $e59a
$0d:e61a  44 d1 82	  mvp $82,$d1
$0d:e61d  ae f5 f6	  ldx $f6f5
$0d:e620  d6 2b		 dec $2b,x
$0d:e622  34 3d		 bit $3d,x
$0d:e624  f5 7f		 sbc $7f,x
$0d:e626  c1 b8		 cmp ($b8,x)
$0d:e628  a4 fc		 ldy $fc
$0d:e62a  e1 d7		 sbc ($d7,x)
$0d:e62c  5b			tcd
$0d:e62d  d4 9f		 pei ($9f)
$0d:e62f  b9 ff 80	  lda $80ff,y
$0d:e632  69 97		 adc #$97
$0d:e634  c7 06		 cmp [$06]
$0d:e636  46 0e		 lsr $0e
$0d:e638  01 7d		 ora ($7d,x)
$0d:e63a  f1 8c		 sbc ($8c),y
$0d:e63c  46 9a		 lsr $9a
$0d:e63e  64 ea		 stz $ea
$0d:e640  ca			dex
$0d:e641  4b			phk
$0d:e642  aa			tax
$0d:e643  e0 52		 cpx #$52
$0d:e645  09 a6		 ora #$a6
$0d:e647  95 d5		 sta $d5,x
$0d:e649  51 08		 eor ($08),y
$0d:e64b  05 29		 ora $29
$0d:e64d  cc 43 10	  cpy $1043
$0d:e650  a0 0b		 ldy #$0b
$0d:e652  98			tya
$0d:e653  62 2e a3	  per $8984
$0d:e656  1f c4 0e 07   ora $070ec4,x
$0d:e65a  06 83		 asl $83
$0d:e65c  c0 e0		 cpy #$e0
$0d:e65e  f0 48		 beq $e6a8
$0d:e660  29 3c		 and #$3c
$0d:e662  8a			txa
$0d:e663  40			rti
$0d:e664  51 04		 eor ($04),y
$0d:e666  10 c1		 bpl $e629
$0d:e668  50 41		 bvc $e6ab
$0d:e66a  02 31		 cop #$31
$0d:e66c  09 84		 ora #$84
$0d:e66e  8c 21 01	  sty $0121
$0d:e671  c9 5d		 cmp #$5d
$0d:e673  20 35 c9	  jsr $c935
$0d:e676  06 be		 asl $be
$0d:e678  a1 46		 lda ($46,x)
$0d:e67a  9c d6 26	  stz $26d6
$0d:e67d  92 6c		 sta ($6c)
$0d:e67f  dd 1f b7	  cmp $b71f,x
$0d:e682  92 ff		 sta ($ff)
$0d:e684  40			rti
$0d:e685  10 00		 bpl $e687
$0d:e687  dd 04 21	  cmp $2104,x
$0d:e68a  e0 3f		 cpx #$3f
$0d:e68c  90 09		 bcc $e697
$0d:e68e  e4 5b		 cpx $5b
$0d:e690  83 ac		 sta $ac,s
$0d:e692  c1 c6		 cmp ($c6,x)
$0d:e694  a4 fd		 ldy $fd
$0d:e696  68			pla
$0d:e697  7f b6 3f 1e   adc $1e3fb6,x
$0d:e69b  9f de 3b d2   sta $d23bde,x
$0d:e69f  58			cli
$0d:e6a0  8d 02 ff	  sta $ff02
$0d:e6a3  00 50		 brk #$50
$0d:e6a5  02 20		 cop #$20
$0d:e6a7  54 67 3d	  mvn $3d,$67
$0d:e6aa  e5 4f		 sbc $4f
$0d:e6ac  28			plp
$0d:e6ad  3b			tsc
$0d:e6ae  c9 b7		 cmp #$b7
$0d:e6b0  06 55		 asl $55
$0d:e6b2  c6 aa		 dec $aa
$0d:e6b4  e3 22		 sbc $22,s
$0d:e6b6  b8			clv
$0d:e6b7  cb			wai
$0d:e6b8  d6 1a		 dec $1a,x
$0d:e6ba  17 a7		 ora [$a7],y
$0d:e6bc  96 e0		 stx $e0,y
$0d:e6be  f4 1a 3e	  pea $3e1a
$0d:e6c1  07 3f		 ora [$3f]
$0d:e6c3  83 df		 sta $df,s
$0d:e6c5  c1 ef		 cmp ($ef,x)
$0d:e6c7  f0 7f		 beq $e748
$0d:e6c9  fc 0a 28	  jsr ($280a,x)
$0d:e6cc  19 43 da	  ora $da43,y
$0d:e6cf  9e f4 3d	  stz $3df4,x
$0d:e6d2  fd 48 df	  sbc $df48,x
$0d:e6d5  b3 97		 lda ($97,s),y
$0d:e6d7  ea			nop
$0d:e6d8  e6 fa		 inc $fa
$0d:e6da  a1 b1		 lda ($b1,x)
$0d:e6dc  a8			tay
$0d:e6dd  ef db f3 01   sbc $01f3db
$0d:e6e1  e0 c0		 cpx #$c0
$0d:e6e3  fe 7e 3f	  inc $3f7e,x
$0d:e6e6  df cf ff f1   cmp $f1ffcf,x
$0d:e6ea  fe fc 7f	  inc $7ffc,x
$0d:e6ed  fe 1f fc	  inc $fc1f,x
$0d:e6f0  07 ff		 ora [$ff]
$0d:e6f2  64 fd		 stz $fd
$0d:e6f4  ca			dex
$0d:e6f5  7a			ply
$0d:e6f6  71 2b		 adc ($2b),y
$0d:e6f8  35 97		 and $97,x
$0d:e6fa  19 2b dc	  ora $dc2b,y
$0d:e6fd  75 2e		 adc $2e,x
$0d:e6ff  ba			tsx
$0d:e700  af 0d 5f a0   lda $a05f0d
$0d:e704  8c 04 60	  sty $6004
$0d:e707  7e 60 1f	  ror $1f60,x
$0d:e70a  38			sec
$0d:e70b  07 1e		 ora [$1e]
$0d:e70d  01 8b		 ora ($8b,x)
$0d:e70f  80 47		 bra $e758
$0d:e711  e0 12		 cpx #$12
$0d:e713  f8			sed
$0d:e714  05 37		 ora $37
$0d:e716  89 20		 bit #$20
$0d:e718  f0 e5		 beq $e6ff
$0d:e71a  fe 5a 8d	  inc $8d5a,x
$0d:e71d  cd 57 b9	  cmp $b957
$0d:e720  da			phx
$0d:e721  ff 69 74 ff   sbc $ff7469,x
$0d:e725  e8			inx
$0d:e726  0c ec 14	  tsb $14ec
$0d:e729  30 d8		 bmi $e703
$0d:e72b  05 1e		 ora $1e
$0d:e72d  01 23		 ora ($23,x)
$0d:e72f  80 40		 bra $e771
$0d:e731  60			rts
$0d:e732  15 82		 ora $82,x
$0d:e734  40			rti
$0d:e735  fd 6a 9f	  sbc $9f6a,x
$0d:e738  fa			plx
$0d:e739  97 fa		 sta [$fa],y
$0d:e73b  89 fb		 bit #$fb
$0d:e73d  b4 77		 ldy $77,x
$0d:e73f  69 9d		 adc #$9d
$0d:e741  fa			plx
$0d:e742  47 7e		 eor [$7e]
$0d:e744  a1 ef		 lda ($ef,x)
$0d:e746  a0 42		 ldy #$42
$0d:e748  c5 82		 cmp $82
$0d:e74a  29 02		 and #$02
$0d:e74c  f0 09		 beq $e757
$0d:e74e  c2 40		 rep #$40
$0d:e750  48			pha
$0d:e751  19 84 02	  ora $0284,y
$0d:e754  ad 95 ff	  lda $ff95
$0d:e757  c9 37		 cmp #$37
$0d:e759  d1 1b		 cmp ($1b),y
$0d:e75b  7c 2a b9	  jmp ($b92a,x)
$0d:e75e  99 ff 42	  sta $42ff,y
$0d:e761  7f d0 5f dc   adc $dc5fd0,x
$0d:e765  03 d2		 ora $d2,s
$0d:e767  28			plp
$0d:e768  1e 0c 03	  asl $030c,x
$0d:e76b  e3 00		 sbc $00,s
$0d:e76d  f1 c0		 sbc ($c0),y
$0d:e76f  20 66 81	  jsr $8166
$0d:e772  22 87 2e 69   jsl $692e87
$0d:e776  51 df		 eor ($df),y
$0d:e778  45 7f		 eor $7f
$0d:e77a  d3 cf		 cmp ($cf,s),y
$0d:e77c  fe bb df	  inc $dfbb,x
$0d:e77f  eb			xba
$0d:e780  f5 d0		 sbc $d0,x
$0d:e782  e8			inx
$0d:e783  75 1a		 adc $1a,x
$0d:e785  0a			asl a
$0d:e786  8d a2 1f	  sta $1fa2
$0d:e789  f8			sed
$0d:e78a  a7 ff		 lda [$ff]
$0d:e78c  79 ff df	  adc $dfff,y
$0d:e78f  7f ff 70 4a   adc $4a70ff,x
$0d:e793  9e b2 2b	  stz $2bb2,x
$0d:e796  ee c2 1d	  inc $1dc2
$0d:e799  83 ff		 sta $ff,s
$0d:e79b  ea			nop
$0d:e79c  fd d6 6b	  sbc $6bd6,x
$0d:e79f  31 18		 and ($18),y
$0d:e7a1  89 fd		 bit #$fd
$0d:e7a3  90 61		 bcc $e806
$0d:e7a5  04 ff		 tsb $ff
$0d:e7a7  e9 bf		 sbc #$bf
$0d:e7a9  fe ef fe	  inc $feef,x
$0d:e7ac  47 13		 eor [$13]
$0d:e7ae  fa			plx
$0d:e7af  ec c2 71	  cpx $71c2
$0d:e7b2  31 1c		 and ($1c),y
$0d:e7b4  4c 43 11	  jmp $1143
$0d:e7b7  cb			wai
$0d:e7b8  ec d6 39	  cpx $39d6
$0d:e7bb  5a			phy
$0d:e7bc  7c 4d da	  jmp ($da4d,x)
$0d:e7bf  01 26		 ora ($26,x)
$0d:e7c1  80 2f		 bra $e7f2
$0d:e7c3  c1 7e		 cmp ($7e,x)
$0d:e7c5  17 78		 ora [$78],y
$0d:e7c7  04 da		 tsb $da
$0d:e7c9  01 37		 ora ($37,x)
$0d:e7cb  61 0b		 adc ($0b,x)
$0d:e7cd  3b			tsc
$0d:e7ce  db			stp
$0d:e7cf  db			stp
$0d:e7d0  55 ff		 eor $ff,x
$0d:e7d2  d5 aa		 cmp $aa,x
$0d:e7d4  fa			plx
$0d:e7d5  bd 7c 12	  lda $127c,x
$0d:e7d8  0b			phd
$0d:e7d9  03 81		 ora $81,s
$0d:e7db  c1 a0		 cmp ($a0,x)
$0d:e7dd  f0 77		 beq $e856
$0d:e7df  c0 a0		 cpy #$a0
$0d:e7e1  c6 ab		 dec $ab
$0d:e7e3  00 d5		 brk #$d5
$0d:e7e5  c0 a0		 cpy #$a0
$0d:e7e7  a6 81		 ldx $81
$0d:e7e9  03 1f		 ora $1f,s
$0d:e7eb  5e 9f 16	  lsr $169f,x
$0d:e7ee  cb			wai
$0d:e7ef  c0 e0		 cpy #$e0
$0d:e7f1  ef 58 90 40   sbc $409058
$0d:e7f5  e1 00		 sbc ($00,x)
$0d:e7f7  61 02		 adc ($02,x)
$0d:e7f9  c6 01		 dec $01
$0d:e7fb  d6 02		 dec $02,x
$0d:e7fd  f1 e0		 sbc ($e0),y
$0d:e7ff  0b			phd
$0d:e800  c0 64		 cpy #$64
$0d:e802  54 0c 00	  mvn $00,$0c
$0d:e805  bc 46 06	  ldy $0646,x
$0d:e808  40			rti
$0d:e809  77 b8		 adc [$b8],y
$0d:e80b  41 1f		 eor ($1f,x)
$0d:e80d  60			rts
$0d:e80e  f8			sed
$0d:e80f  12 78		 ora ($78)
$0d:e811  c1 5f		 cmp ($5f,x)
$0d:e813  40			rti
$0d:e814  fd 11 60	  sbc $6011,x
$0d:e817  97 d0		 sta [$d0],y
$0d:e819  0a			asl a
$0d:e81a  98			tya
$0d:e81b  ec d4 86	  cpx $86d4
$0d:e81e  39 44 9f	  and $9f44,y
$0d:e821  fe 25 11	  inc $1125,x
$0d:e824  4b			phk
$0d:e825  a4 9a		 ldy $9a
$0d:e827  c7 c3		 cmp [$c3]
$0d:e829  a1 6d		 lda ($6d,x)
$0d:e82b  3f d4 19 e4   and $e419d4,x
$0d:e82f  0f f8 a7 08   ora $08a7f8
$0d:e833  3f fe 17 ff   and $ff17fe,x
$0d:e837  8e 7f e7	  stx $e77f
$0d:e83a  bf c8 0f f3   lda $f30fc8,x
$0d:e83e  bd b8 dc	  lda $dcb8,x
$0d:e841  5f ac 7c ac   eor $ac7cac,x
$0d:e845  e4 7e		 cpx $7e
$0d:e847  15 03		 ora $03,x
$0d:e849  a7 72		 lda [$72]
$0d:e84b  e8			inx
$0d:e84c  7c 1d b5	  jmp ($b51d,x)
$0d:e84f  fb			xce
$0d:e850  87 3c		 sta [$3c]
$0d:e852  e0 4f		 cpx #$4f
$0d:e854  66 9f		 ror $9f
$0d:e856  ff 87 ff f9   sbc $f9ff87,x
$0d:e85a  ff 51 86 fa   sbc $fa8651,x
$0d:e85e  7f 81 9f c9   adc $c99f81,x
$0d:e862  f2 11		 sbc ($11)
$0d:e864  3e 44 6b	  rol $6b44,x
$0d:e867  99 4b d3	  sta $d34b,y
$0d:e86a  c9 ba		 cmp #$ba
$0d:e86c  15 1d		 ora $1d,x
$0d:e86e  e4 93		 cpx $93
$0d:e870  a7 4c		 lda [$4c]
$0d:e872  dc 60 3f	  jml [$3f60]
$0d:e875  fc 06 00	  jsr ($0006,x)
$0d:e878  e8			inx
$0d:e879  37 fd		 and [$fd],y
$0d:e87b  0e fe 33	  asl $33fe
$0d:e87e  1f cb e1 e0   ora $e0e1cb,x
$0d:e882  f0 10		 beq $e894
$0d:e884  ef 8f a2 0b   sbc $0ba28f
$0d:e888  54 91 ca	  mvn $ca,$91
$0d:e88b  38			sec
$0d:e88c  76 28		 ror $28,x
$0d:e88e  2e 12 3f	  rol $3f12
$0d:e891  32 92		 and ($92)
$0d:e893  f6 a1		 inc $a1,x
$0d:e895  b0 1f		 bcs $e8b6
$0d:e897  fb			xce
$0d:e898  7c 20 6e	  jmp ($6e20,x)
$0d:e89b  00 fe		 brk #$fe
$0d:e89d  c0 7f		 cpy #$7f
$0d:e89f  31 1f		 and ($1f),y
$0d:e8a1  8c 27 83	  sty $8327
$0d:e8a4  e1 80		 sbc ($80,x)
$0d:e8a6  c9 2c		 cmp #$2c
$0d:e8a8  d4 ad		 pei ($ad)
$0d:e8aa  ee 67 87	  inc $8767
$0d:e8ad  26 a1		 rol $a1
$0d:e8af  5f 28 5b de   eor $de5b28,x
$0d:e8b3  1b			tcs
$0d:e8b4  c4 1d		 cpy $1d
$0d:e8b6  e1 18		 sbc ($18,x)
$0d:e8b8  ff a0 c1 06   sbc $06c1a0,x
$0d:e8bc  18			clc
$0d:e8bd  1e de 07	  asl $07de,x
$0d:e8c0  87 00		 sta [$00]
$0d:e8c2  04 07		 tsb $07
$0d:e8c4  fd fe 1e	  sbc $1efe,x
$0d:e8c7  b8			clv
$0d:e8c8  ec 26 89	  cpx $8926
$0d:e8cb  05 89		 ora $89
$0d:e8cd  43 a4		 eor $a4,s
$0d:e8cf  36 9a		 rol $9a,x
$0d:e8d1  b4 d2		 ldy $d2,x
$0d:e8d3  13 2e		 ora ($2e,s),y
$0d:e8d5  eb			xba
$0d:e8d6  d5 64		 cmp $64,x
$0d:e8d8  d4 0f		 pei ($0f)
$0d:e8da  fc 16 9d	  jsr ($9d16,x)
$0d:e8dd  06 8d		 asl $8d
$0d:e8df  ca			dex
$0d:e8e0  66 f7		 ror $f7
$0d:e8e2  78			sei
$0d:e8e3  fc 3a ff	  jsr ($ff3a,x)
$0d:e8e6  58			cli
$0d:e8e7  ff ce 3f fb   sbc $fb3fce,x
$0d:e8eb  f8			sed
$0d:e8ec  66 3e		 ror $3e
$0d:e8ee  6f c0 0f 84   adc $840fc0
$0d:e8f2  83 ff		 sta $ff,s
$0d:e8f4  42 ef		 wdm #$ef
$0d:e8f6  d3 fe		 cmp ($fe,s),y
$0d:e8f8  b3 0f		 lda ($0f,s),y
$0d:e8fa  f5 42		 sbc $42,x
$0d:e8fc  e1 00		 sbc ($00,x)
$0d:e8fe  bc 40 27	  ldy $2740,x
$0d:e901  f0 02		 beq $e905
$0d:e903  20 48 08	  jsr $0848
$0d:e906  c3 0a		 cmp $0a,s
$0d:e908  80 48		 bra $e952
$0d:e90a  60			rts
$0d:e90b  1f e8 cf e3   ora $e3cfe8,x
$0d:e90f  ef 01 01 83   sbc $830101
$0d:e913  7c 32 5f	  jmp ($5f32,x)
$0d:e916  ef d6 fe 13   sbc $13fed6
$0d:e91a  9f 81 41 e0   sta $e04181,x
$0d:e91e  10 f0		 bpl $e910
$0d:e920  18			clc
$0d:e921  11 04		 ora ($04),y
$0d:e923  a6 05		 ldx $05
$0d:e925  30 a0		 bmi $e8c7
$0d:e927  40			rti
$0d:e928  2c 30 09	  bit $0930
$0d:e92b  a4 03		 ldy $03
$0d:e92d  59 10 f5	  eor $f510,y
$0d:e930  45 29		 eor $29
$0d:e932  7b			tdc
$0d:e933  4a			lsr a
$0d:e934  8e ba 6b	  stx $6bba
$0d:e937  ca			dex
$0d:e938  de 50 fd	  dec $fd50,x
$0d:e93b  d1 1f		 cmp ($1f),y
$0d:e93d  f9 fd 7d	  sbc $7dfd,y
$0d:e940  ff fe 5f fe   sbc $fe5ffe,x
$0d:e944  86 e0		 stx $e0
$0d:e946  18			clc
$0d:e947  24 03		 bit $03
$0d:e949  4d 00 f7	  eor $f700
$0d:e94c  40			rti
$0d:e94d  3b			tsc
$0d:e94e  72 43		 adc ($43)
$0d:e950  b8			clv
$0d:e951  44 7d da	  mvp $da,$7d
$0d:e954  4a			lsr a
$0d:e955  d9 f6 0f	  cmp $0ff6,y
$0d:e958  e5 5b		 sbc $5b
$0d:e95a  ff 9f 83 35   sbc $35839f,x
$0d:e95e  8b			phb
$0d:e95f  e6 f1		 inc $f1
$0d:e961  a2 58		 ldx #$58
$0d:e963  c8			iny
$0d:e964  be 27 49	  ldx $4927,y
$0d:e967  9c 95 65	  stz $6595
$0d:e96a  38			sec
$0d:e96b  bb			tyx
$0d:e96c  99 5c 8e	  sta $8e5c,y
$0d:e96f  e8			inx
$0d:e970  42 1b		 wdm #$1b
$0d:e972  fc 02 fc	  jsr ($fc02,x)
$0d:e975  c2 16		 rep #$16
$0d:e977  19 77 08	  ora $0877,y
$0d:e97a  82 d0 f6	  brl $e04d
$0d:e97d  f5 cb		 sbc $cb,x
$0d:e97f  60			rts
$0d:e980  55 6b		 eor $6b,x
$0d:e982  6e 66 87	  ror $8766
$0d:e985  b1 af		 lda ($af),y
$0d:e987  79 ea fe	  adc $feea,y
$0d:e98a  9a			txs
$0d:e98b  c5 37		 cmp $37
$0d:e98d  37 ba		 and [$ba],y
$0d:e98f  b5 18		 lda $18,x
$0d:e991  84 00		 sty $00
$0d:e993  70 8f		 bvs $e924
$0d:e995  fc 1d 1c	  jsr ($1c1d,x)
$0d:e998  02 00		 cop #$00
$0d:e99a  ff ed a8 15   sbc $15a8ed,x
$0d:e99e  bd b6 63	  lda $63b6,x
$0d:e9a1  87 96		 sta [$96]
$0d:e9a3  b9 f7 39	  lda $39f7,y
$0d:e9a6  3e c8 4e	  rol $4ec8,x
$0d:e9a9  a7 1f		 lda [$1f]
$0d:e9ab  a2 85 80	  ldx #$8085
$0d:e9ae  5a			phy
$0d:e9af  65 ff		 adc $ff
$0d:e9b1  f9 7f ee	  sbc $ee7f,y
$0d:e9b4  1f ff a7 fe   ora $fea7ff,x
$0d:e9b8  ab			plb
$0d:e9b9  ff ea f5 75   sbc $75f5ea,x
$0d:e9bd  5e a3 20	  lsr $20a3,x
$0d:e9c0  e0 07 00	  cpx #$0007
$0d:e9c3  6b			rtl
$0d:e9c4  01 c0		 ora ($c0,x)
$0d:e9c6  18			clc
$0d:e9c7  86 ab		 stx $ab
$0d:e9c9  00 d5		 brk #$d5
$0d:e9cb  0f 81 bc 44   ora $44bc81
$0d:e9cf  52 eb		 eor ($eb)
$0d:e9d1  d3 e2		 cmp ($e2,s),y
$0d:e9d3  99 78 1c	  sta $1c78,y
$0d:e9d6  0e 09 05	  asl $0509
$0d:e9d9  29 b4		 and #$b4
$0d:e9db  82 07 08	  brl $f1e5
$0d:e9de  82 c0 20	  brl $0aa1
$0d:e9e1  70 03		 bvs $e9e6
$0d:e9e3  13 c0		 ora ($c0,s),y
$0d:e9e5  60			rts
$0d:e9e6  14 89		 trb $89
$0d:e9e8  bd d6 17	  lda $17d6,x
$0d:e9eb  87 bf		 sta [$bf]
$0d:e9ed  9b			txy
$0d:e9ee  d3 7e		 cmp ($7e,s),y
$0d:e9f0  c3 00		 cmp $00,s
$0d:e9f2  02 bf		 cop #$bf
$0d:e9f4  da			phx
$0d:e9f5  23 00		 and $00,s
$0d:e9f7  b3 44		 lda ($44,s),y
$0d:e9f9  64 75		 stz $75
$0d:e9fb  54 98 51	  mvn $51,$98
$0d:e9fe  66 73		 ror $73
$0d:ea00  3a			dec a
$0d:ea01  ac 46 ef	  ldy $ef46
$0d:ea04  bb			tyx
$0d:ea05  bb			tyx
$0d:ea06  9f fa 8d ba   sta $ba8dfa,x
$0d:ea0a  8b			phb
$0d:ea0b  fa			plx
$0d:ea0c  e6 dc		 inc $dc
$0d:ea0e  aa			tax
$0d:ea0f  6e ce 47	  ror $47ce
$0d:ea12  dc a6 6c	  jml [$6ca6]
$0d:ea15  e5 5d		 sbc $5d
$0d:ea17  ba			tsx
$0d:ea18  2e f3 43	  rol $43f3
$0d:ea1b  a0 e0 70	  ldy #$70e0
$0d:ea1e  38			sec
$0d:ea1f  3c 0d 86	  bit $860d,x
$0d:ea22  c3 b9		 cmp $b9,s
$0d:ea24  dc c1 e0	  jml [$e0c1]
$0d:ea27  f8			sed
$0d:ea28  9c 0c 1e	  stz $1e0c
$0d:ea2b  02 f5		 cop #$f5
$0d:ea2d  2d 9c 4b	  and $4b9c
$0d:ea30  ee 92 ba	  inc $ba92
$0d:ea33  85 be		 sta $be
$0d:ea35  55 d5		 eor $d5,x
$0d:ea37  b2 67		 lda ($67)
$0d:ea39  ed 5e da	  sbc $da5e
$0d:ea3c  d6 77		 dec $77,x
$0d:ea3e  83 01		 sta $01,s
$0d:ea40  e1 c0		 sbc ($c0,x)
$0d:ea42  dc 21 8d	  jml [$8d21]
$0d:ea45  86 c4		 stx $c4
$0d:ea47  62 38 1c	  per $0682
$0d:ea4a  0e 47 03	  asl $0347
$0d:ea4d  61 80		 adc ($80,x)
$0d:ea4f  ea			nop
$0d:ea50  79 d6 68	  adc $68d6,y
$0d:ea53  3f 6a 45 64   and $64456a,x
$0d:ea57  8c 4e e8	  sty $e84e
$0d:ea5a  91 c9		 sta ($c9),y
$0d:ea5c  1c 1e 11	  trb $111e
$0d:ea5f  00 81		 brk #$81
$0d:ea61  7c 2f fb	  jmp ($fb2f,x)
$0d:ea64  8b			phb
$0d:ea65  ff f6 ff 5f   sbc $5ffff6,x
$0d:ea69  9f c9 eb f3   sta $f3ebc9,x
$0d:ea6d  39 7c 12	  and $127c,y
$0d:ea70  17 02		 ora [$02],y
$0d:ea72  81 ed		 sta ($ed,x)
$0d:ea74  29 74		 and #$74
$0d:ea76  9f ff db ed   sta $eddbff,x
$0d:ea7a  24 92		 bit $92
$0d:ea7c  52 e0		 eor ($e0)
$0d:ea7e  1d 69 4d	  ora $4d69,x
$0d:ea81  27 6d		 and [$6d]
$0d:ea83  93 a4		 sta ($a4,s),y
$0d:ea85  29 4a		 and #$4a
$0d:ea87  13 ff		 ora ($ff,s),y
$0d:ea89  ed ff c4	  sbc $c4ff
$0d:ea8c  c5 b6		 cmp $b6
$0d:ea8e  11 07		 ora ($07),y
$0d:ea90  6b			rtl
$0d:ea91  e1 10		 sbc ($10,x)
$0d:ea93  fe d4 3b	  inc $3bd4,x
$0d:ea96  75 0e		 adc $0e,x
$0d:ea98  fd 01 58	  sbc $5801,x
$0d:ea9b  19 7b 47	  ora $477b,y
$0d:ea9e  42 a1		 wdm #$a1
$0d:eaa0  d8			cld
$0d:eaa1  ac 43 e0	  ldy $e043
$0d:eaa4  12 28		 ora ($28)
$0d:eaa6  04 92		 tsb $92
$0d:eaa8  01 3f		 ora ($3f,x)
$0d:eaaa  80 1f		 bra $eacb
$0d:eaac  80 fc		 bra $eaaa
$0d:eaae  12 f8		 ora ($f8)
$0d:eab0  04 9e		 tsb $9e
$0d:eab2  01 0f		 ora ($0f,x)
$0d:eab4  84 d7		 sty $d7
$0d:eab6  e1 56		 sbc ($56,x)
$0d:eab8  e8			inx
$0d:eab9  17 ca		 ora [$ca],y
$0d:eabb  05 fc		 ora $fc
$0d:eabd  81 d0		 sta ($d0,x)
$0d:eabf  37 f0		 and [$f0],y
$0d:eac1  88			dey
$0d:eac2  44 a6 53	  mvp $53,$a6
$0d:eac5  f0 80		 beq $ea47
$0d:eac7  68			pla
$0d:eac8  60			rts
$0d:eac9  19 18 07	  ora $0718,y
$0d:eacc  f5 4a		 sbc $4a,x
$0d:eace  7f 70 c0 40   adc $40c070,x
$0d:ead2  2a			rol a
$0d:ead3  50 dd		 bvc $eab2
$0d:ead5  ad 3a 95	  lda $953a
$0d:ead8  1b			tcs
$0d:ead9  ea			nop
$0d:eada  4b			phk
$0d:eadb  a4 7f		 ldy $7f
$0d:eadd  aa			tax
$0d:eade  a7 5b		 lda [$5b]
$0d:eae0  57 7d		 eor [$7d],y
$0d:eae2  a5 e8		 lda $e8
$0d:eae4  95 65		 sta $65,x
$0d:eae6  04 ff		 tsb $ff
$0d:eae8  c0 7f f0	  cpy #$f07f
$0d:eaeb  5f fc a5 58   eor $58a5fc,x
$0d:eaef  31 c4		 and ($c4),y
$0d:eaf1  20 57 2a	  jsr $2a57
$0d:eaf4  da			phx
$0d:eaf5  18			clc
$0d:eaf6  56 9b		 lsr $9b,x
$0d:eaf8  2b			pld
$0d:eaf9  4c 92 f7	  jmp $f792
$0d:eafc  27 58		 and [$58]
$0d:eafe  68			pla
$0d:eaff  5e 9e 5b	  lsr $5b9e,x
$0d:eb02  83 86		 sta $86,s
$0d:eb04  7f f4 1f fd   adc $fd1ff4,x
$0d:eb08  0f fe 87 ff   ora $ff87fe
$0d:eb0c  e1 ff		 sbc ($ff,x)
$0d:eb0e  f0 3f		 beq $eb4f
$0d:eb10  fc 02 a8	  jsr ($a802,x)
$0d:eb13  78			sei
$0d:eb14  13 ae		 ora ($ae,s),y
$0d:eb16  97 97		 sta [$97],y
$0d:eb18  a1 1d		 lda ($1d,x)
$0d:eb1a  f6 f2		 inc $f2,x
$0d:eb1c  bd 1c ff	  lda $ff1c,x
$0d:eb1f  54 36 35	  mvn $35,$36
$0d:eb22  1d fb 7e	  ora $7efb,x
$0d:eb25  66 08		 ror $08
$0d:eb27  61 f2		 adc ($f2,x)
$0d:eb29  ff fe 5f ff   sbc $ff5ffe,x
$0d:eb2d  9f ff e3 ff   sta $ffe3ff,x
$0d:eb31  f0 a1		 beq $ead4
$0d:eb33  06 11		 asl $11
$0d:eb35  f6 81		 inc $81,x
$0d:eb37  46 76		 lsr $76
$0d:eb39  14 69		 trb $69
$0d:eb3b  54 47 c9	  mvn $c9,$47
$0d:eb3e  19 cd 5f	  ora $5fcd,y
$0d:eb41  6c de 4e	  jmp ($4ede)
$0d:eb44  cf 0b ed ff   cmp $ffed0b
$0d:eb48  8c 7f e0	  sty $e07f
$0d:eb4b  c8			iny
$0d:eb4c  a1 80		 lda ($80,x)
$0d:eb4e  a1 05		 lda ($05,x)
$0d:eb50  c2 13		 rep #$13
$0d:eb52  cf fe 3e b5   cmp $b53efe
$0d:eb56  5c cc 7d ea   jml $ea7dcc
$0d:eb5a  1f 8a 86 ba   ora $ba868a,x
$0d:eb5e  9f 9c a1 74   sta $74a19c,x
$0d:eb62  6e 78 2b	  ror $2b78
$0d:eb65  fc 97 ff	  jsr ($ff97,x)
$0d:eb68  07 ff		 ora [$ff]
$0d:eb6a  c3 c0		 cmp $c0,s
$0d:eb6c  43 10		 eor $10,s
$0d:eb6e  42 0a		 wdm #$0a
$0d:eb70  7c 11 61	  jmp ($6111,x)
$0d:eb73  e6 a5		 inc $a5
$0d:eb75  ea			nop
$0d:eb76  71 fe		 adc ($fe),y
$0d:eb78  c8			iny
$0d:eb79  4c 72 13	  jmp $1372
$0d:eb7c  76 f9		 ror $f9,x
$0d:eb7e  95 c3		 sta $c3,x
$0d:eb80  11 cd		 ora ($cd),y
$0d:eb82  a0 ff b6	  ldy #$b6ff
$0d:eb85  9f fb 83 10   sta $1083fb,x
$0d:eb89  58			cli
$0d:eb8a  a1 08		 lda ($08,x)
$0d:eb8c  55 0c		 eor $0c,x
$0d:eb8e  c8			iny
$0d:eb8f  ce 5f f9	  dec $f95f
$0d:eb92  6e fe 9b	  ror $9bfe
$0d:eb95  cd 89 60	  cmp $6089
$0d:eb98  a9 7c		 lda #$7c
$0d:eb9a  7a			ply
$0d:eb9b  3f 12 5d a4   and $a45d12,x
$0d:eb9f  a6 71		 ldx $71
$0d:eba1  20 10 0a	  jsr $0a10
$0d:eba4  04 02		 tsb $02
$0d:eba6  65 00		 adc $00
$0d:eba8  be c0 27	  ldx $27c0,y
$0d:ebab  e4 61		 cpx $61
$0d:ebad  af 91 86 01   lda $018691
$0d:ebb1  fe f7 ff	  inc $fff7,x
$0d:ebb4  76 bb		 ror $bb,x
$0d:ebb6  18			clc
$0d:ebb7  c4 02		 cpy $02
$0d:ebb9  bb			tyx
$0d:ebba  e1 cd		 sbc ($cd,x)
$0d:ebbc  48			pha
$0d:ebbd  2d b7 3f	  and $3fb7
$0d:ebc0  f7 82		 sbc [$82],y
$0d:ebc2  03 00		 ora $00,s
$0d:ebc4  81 40		 sta ($40,x)
$0d:ebc6  29 c7		 and #$c7
$0d:ebc8  f1 ff		 sbc ($ff),y
$0d:ebca  1f c7 7c 46   ora $467cc7,x
$0d:ebce  1f 7c 7f 93   ora $937f7c,x
$0d:ebd2  39 d2 5a	  and $5ad2,y
$0d:ebd5  21 1d		 and ($1d,x)
$0d:ebd7  7e 9f 8f	  ror $8f9f,x
$0d:ebda  49 97		 eor #$97
$0d:ebdc  c3 65		 cmp $65,s
$0d:ebde  79 3d f1	  adc $f13d,y
$0d:ebe1  f8			sed
$0d:ebe2  41 a0		 eor ($a0,x)
$0d:ebe4  11 f2		 ora ($f2),y
$0d:ebe6  30 cf		 bmi $ebb7
$0d:ebe8  20 17 84	  jsr $8417
$0d:ebeb  40			rti
$0d:ebec  40			rti
$0d:ebed  e6 10		 inc $10
$0d:ebef  39 e7 0e	  and $0ee7,y
$0d:ebf2  77 c7		 adc [$c7],y
$0d:ebf4  fe ff 32	  inc $32ff,x
$0d:ebf7  d1 19		 cmp ($19),y
$0d:ebf9  de 0f 0d	  dec $0d0f,x
$0d:ebfc  57 aa		 eor [$aa],y
$0d:ebfe  61 a7		 adc ($a7,x)
$0d:ec00  36 c1		 rol $c1,x
$0d:ec02  f8			sed
$0d:ec03  0f c2 06 6e   ora $6e06c2
$0d:ec07  08			php
$0d:ec08  05 f2		 ora $f2
$0d:ec0a  01 38		 ora ($38,x)
$0d:ec0c  c0 4e 38	  cpy #$384e
$0d:ec0f  39 0e 1d	  and $1d0e,y
$0d:ec12  1b			tcs
$0d:ec13  7d 15 f6	  adc $f615,x
$0d:ec16  cd b9 d4	  cmp $d4b9
$0d:ec19  bd bc 8b	  lda $8bbc,x
$0d:ec1c  bb			tyx
$0d:ec1d  24 ed		 bit $ed
$0d:ec1f  cd be ce	  cmp $cebe
$0d:ec22  50 d0		 bvc $ebf4
$0d:ec24  e8			inx
$0d:ec25  38			sec
$0d:ec26  5c 0e 0f 03   jml $030f0e
$0d:ec2a  61 b0		 adc ($b0,x)
$0d:ec2c  ce 67 30	  dec $3067
$0d:ec2f  78			sei
$0d:ec30  3c 4e 01	  bit $014e,x
$0d:ec33  98			tya
$0d:ec34  15 2c		 ora $2c,x
$0d:ec36  ac 63 3f	  ldy $3f63
$0d:ec39  74 dd		 stz $dd,x
$0d:ec3b  c8			iny
$0d:ec3c  37 fa		 and [$fa],y
$0d:ec3e  aa			tax
$0d:ec3f  bd 93 3b	  lda $3b93,x
$0d:ec42  68			pla
$0d:ec43  90 c0		 bcc $ec05
$0d:ec45  bf f6 98 0d   lda $0d98f6,x
$0d:ec49  8e 07 43	  stx $4307
$0d:ec4c  81 f3		 sta ($f3,x)
$0d:ec4e  71 b1		 adc ($b1),y
$0d:ec50  18			clc
$0d:ec51  8e 0b 01	  stx $010b
$0d:ec54  de 80 40	  dec $4080,x
$0d:ec57  60			rts
$0d:ec58  3d 5f 1c	  and $1c5f,x
$0d:ec5b  aa			tax
$0d:ec5c  83 5d		 sta $5d,s
$0d:ec5e  c0 6a a2	  cpy #$a26a
$0d:ec61  95 59		 sta $59,x
$0d:ec63  76 aa		 ror $aa,x
$0d:ec65  b9 55 dc	  lda $dc55,y
$0d:ec68  6a			ror a
$0d:ec69  ae 22 d0	  ldx $d022
$0d:ec6c  14 80		 trb $80
$0d:ec6e  b4 80		 ldy $80,x
$0d:ec70  6d 15 f1	  adc $f115
$0d:ec73  62 be 34	  per $2134
$0d:ec76  5f c6 8a f9   eor $f98ac6,x
$0d:ec7a  5d 9f 68	  eor $689f,x
$0d:ec7d  9e c1 88	  stz $88c1,x
$0d:ec80  d5 50		 cmp $50,x
$0d:ec82  40			rti
$0d:ec83  71 08		 adc ($08),y
$0d:ec85  05 1c		 ora $1c
$0d:ec87  8f 91 07 a8   sta $a80791
$0d:ec8b  53 b0		 eor ($b0,s),y
$0d:ec8d  3a			dec a
$0d:ec8e  d8			cld
$0d:ec8f  95 4a		 sta $4a,x
$0d:ec91  79 a0 8a	  adc $8aa0,y
$0d:ec94  d5 03		 cmp $03,x
$0d:ec96  82 29 0c	  brl $f8c2
$0d:ec99  80 09		 bra $eca4
$0d:ec9b  61 20		 adc ($20,x)
$0d:ec9d  a3 f1		 lda $f1,s
$0d:ec9f  42 2e		 wdm #$2e
$0d:eca1  38			sec
$0d:eca2  4d c5 0a	  eor $0ac5
$0d:eca5  b9 21 91	  lda $9121,y
$0d:eca8  67 23		 adc [$23]
$0d:ecaa  94 9c		 sty $9c,x
$0d:ecac  44 8a 83	  mvp $83,$8a
$0d:ecaf  14 14		 trb $14
$0d:ecb1  84 13		 sty $13
$0d:ecb3  fe dd 08	  inc $08dd,x
$0d:ecb6  08			php
$0d:ecb7  00 68		 brk #$68
$0d:ecb9  3f f9 17 fe   and $fe17f9,x
$0d:ecbd  29 ff		 and #$ff
$0d:ecbf  8b			phb
$0d:ecc0  78			sei
$0d:ecc1  31 1f		 and ($1f),y
$0d:ecc3  1a			inc a
$0d:ecc4  07 ef		 ora [$ef]
$0d:ecc6  49 79		 eor #$79
$0d:ecc8  ad 4f 74	  lda $744f
$0d:eccb  91 1a		 sta ($1a),y
$0d:eccd  86 2f		 stx $2f
$0d:eccf  51 45		 eor ($45),y
$0d:ecd1  05 81		 ora $81
$0d:ecd3  94 20		 sty $20,x
$0d:ecd5  66 41		 ror $41
$0d:ecd7  32 81		 and ($81)
$0d:ecd9  24 10		 bit $10
$0d:ecdb  61 05		 adc ($05,x)
$0d:ecdd  ff d4 bc 32   sbc $32bcd4,x
$0d:ece1  ea			nop
$0d:ece2  05 5b		 ora $5b
$0d:ece4  11 a4		 ora ($a4),y
$0d:ece6  8d 9d c8	  sta $c89d
$0d:ece9  76 1a		 ror $1a,x
$0d:eceb  ba			tsx
$0d:ecec  01 94		 ora ($94,x)
$0d:ecee  8f e4 87 20   sta $2087e4
$0d:ecf2  59 44 60	  eor $6044,y
$0d:ecf5  16 68		 asl $68,x
$0d:ecf7  8c 8e aa	  sty $aa8e
$0d:ecfa  b3 0a		 lda ($0a,s),y
$0d:ecfc  2c ce 67	  bit $67ce
$0d:ecff  55 88		 eor $88,x
$0d:ed01  dd f5 56	  cmp $56f5,x
$0d:ed04  60			rts
$0d:ed05  1d 2b 47	  ora $472b,x
$0d:ed08  ff bf cd 33   sbc $33cdbf,x
$0d:ed0c  c3 71		 cmp $71,s
$0d:ed0e  83 e3		 sta $e3,s
$0d:ed10  71 6f		 adc ($6f),y
$0d:ed12  1f dc 45 db   ora $db45dc,x
$0d:ed16  c5 19		 cmp $19
$0d:ed18  84 7d		 sty $7d
$0d:ed1a  af 9f f6 f8   lda $f8f69f
$0d:ed1e  5f 7f f3 90   eor $90f37f,x
$0d:ed22  60			rts
$0d:ed23  c1 bf		 cmp ($bf,x)
$0d:ed25  f1 8f		 sbc ($8f),y
$0d:ed27  ff db ff 94   sbc $94ffdb,x
$0d:ed2b  a1 c2		 lda ($c2,x)
$0d:ed2d  b0 35		 bcs $ed64
$0d:ed2f  df 06 2a 29   cmp $292a06,x
$0d:ed33  95 8d		 sta $8d,x
$0d:ed35  52 bf		 eor ($bf)
$0d:ed37  b1 5d		 lda ($5d),y
$0d:ed39  76 2b		 ror $2b,x
$0d:ed3b  0e ab 0a	  asl $0aab
$0d:ed3e  07 fe		 ora [$fe]
$0d:ed40  40			rti
$0d:ed41  00 10		 brk #$10
$0d:ed43  09 58		 ora #$58
$0d:ed45  00 03		 brk #$03
$0d:ed47  95 a1		 sta $a1,x
$0d:ed49  f2 a8		 sbc ($a8)
$0d:ed4b  31 dd		 and ($dd),y
$0d:ed4d  06 2a		 asl $2a
$0d:ed4f  29 55		 and #$55
$0d:ed51  e7 42		 sbc [$42]
$0d:ed53  b3 99		 lda ($99,s),y
$0d:ed55  58			cli
$0d:ed56  c5 2b		 cmp $2b
$0d:ed58  a2 ab 20	  ldx #$20ab
$0d:ed5b  59 3f c8	  eor $c83f,y
$0d:ed5e  4a			lsr a
$0d:ed5f  55 1e		 eor $1e,x
$0d:ed61  2d ab cf	  and $cfab
$0d:ed64  20 d7 d0	  jsr $d0d7
$0d:ed67  b9 b5 4e	  lda $4eb5,y
$0d:ed6a  5d 13 bf	  eor $bf13,x
$0d:ed6d  20 cf c6	  jsr $c6cf
$0d:ed70  b4 b3		 ldy $b3,x
$0d:ed72  e8			inx
$0d:ed73  04 7e		 tsb $7e
$0d:ed75  01 5f		 ora ($5f,x)
$0d:ed77  80 4f		 bra $edc8
$0d:ed79  c8			iny
$0d:ed7a  87 7f		 sta [$7f]
$0d:ed7c  25 0f		 and $0f
$0d:ed7e  bb			tyx
$0d:ed7f  e1 eb		 sbc ($eb,x)
$0d:ed81  fa			plx
$0d:ed82  c6 be		 dec $be
$0d:ed84  12 6e		 ora ($6e)
$0d:ed86  c5 33		 cmp $33
$0d:ed88  f1 83		 sbc ($83),y
$0d:ed8a  be e5 bd	  ldx $bde5,y
$0d:ed8d  96 5c		 stx $5c,y
$0d:ed8f  d9 14 3f	  cmp $3f14,y
$0d:ed92  cc 15 30	  cpy $3015
$0d:ed95  91 84		 sta ($84),y
$0d:ed97  26 9e		 rol $9e
$0d:ed99  a9 17		 lda #$17
$0d:ed9b  97 53		 sta [$53],y
$0d:ed9d  61 fd		 adc ($fd,x)
$0d:ed9f  cd 3d 32	  cmp $323d
$0d:eda2  1d b5 9f	  ora $9fb5,x
$0d:eda5  b9 4e f4	  lda $f44e,y
$0d:eda8  d7 22		 cmp [$22],y
$0d:edaa  30 78		 bmi $ee24
$0d:edac  c4 0e		 cpy $0e
$0d:edae  3d 00 87	  and $8700,x
$0d:edb1  c0 10 61	  cpy #$6110
$0d:edb4  18			clc
$0d:edb5  80 4c		 bra $ee03
$0d:edb7  20 33 08	  jsr $0833
$0d:edba  1d ab 59	  ora $59ab,x
$0d:edbd  db			stp
$0d:edbe  af ed 30 77   lda $7730ed
$0d:edc2  6a			ror a
$0d:edc3  b7 13		 lda [$13],y
$0d:edc5  9f 3f ed f5   sta $f5ed3f,x
$0d:edc9  2f 94 5b 64   and $645b94
$0d:edcd  43 83		 eor $83,s
$0d:edcf  20 c0 12	  jsr $12c0
$0d:edd2  c3 52		 cmp $52,s
$0d:edd4  8a			txa
$0d:edd5  08			php
$0d:edd6  1c 82 0f	  trb $0f82
$0d:edd9  23 86		 and $86,s
$0d:eddb  4c f1 9c	  jmp $9cf1
$0d:edde  f9 87 2a	  sbc $2a87,y
$0d:ede1  9d 2a d9	  sta $d92a,x
$0d:ede4  c7 76		 cmp [$76]
$0d:ede6  df 5a 76 6e   cmp $6e765a,x
$0d:edea  b7 e5		 lda [$e5],y
$0d:edec  bf 67 e4 b0   lda $b0e467,x
$0d:edf0  08			php
$0d:edf1  04 c6		 tsb $c6
$0d:edf3  01 44		 ora ($44,x)
$0d:edf5  80 50		 bra $ee47
$0d:edf7  11 21		 ora ($21),y
$0d:edf9  10 92		 bpl $ed8d
$0d:edfb  2f c2 03 40   and $4003c2
$0d:edff  81 58		 sta ($58,x)
$0d:ee01  b1 1b		 lda ($1b),y
$0d:ee03  1e 25 63	  asl $6325,x
$0d:ee06  c5 ac		 cmp $ac
$0d:ee08  b8			clv
$0d:ee09  d4 a7		 pei ($a7)
$0d:ee0b  9a			txs
$0d:ee0c  08			php
$0d:ee0d  ad 53 15	  lda $1553
$0d:ee10  ab			plb
$0d:ee11  a0 42 3f	  ldy #$3f42
$0d:ee14  f0 4f		 beq $ee65
$0d:ee16  fc 0b ff	  jsr ($ff0b,x)
$0d:ee19  01 31		 ora ($31,x)
$0d:ee1b  8c 25 c4	  sty $c425
$0d:ee1e  2e 70 aa	  rol $aa70
$0d:ee21  78			sei
$0d:ee22  f5 5c		 sbc $5c,x
$0d:ee24  1a			inc a
$0d:ee25  ee 03 54	  inc $5403
$0d:ee28  16 09		 asl $09,x
$0d:ee2a  d6 aa		 dec $aa,x
$0d:ee2c  3b			tsc
$0d:ee2d  55 c7		 eor $c7,x
$0d:ee2f  6a			ror a
$0d:ee30  b8			clv
$0d:ee31  ee 70 7f	  inc $7f70
$0d:ee34  e3 bc		 sbc $bc,s
$0d:ee36  25 14		 and $14
$0d:ee38  7a			ply
$0d:ee39  8e 3f 45	  stx $453f
$0d:ee3c  1f ae cf b4   ora $b4cfae,x
$0d:ee40  4f 60 c4 6a   eor $6ac460
$0d:ee44  a8			tay
$0d:ee45  2e 70 c0	  rol $c070
$0d:ee48  00 15		 brk #$15
$0d:ee4a  be 0f f2	  ldx $f20f,y
$0d:ee4d  d1 d2		 cmp ($d2),y
$0d:ee4f  28			plp
$0d:ee50  39 4c 04	  and $044c,y
$0d:ee53  8a			txa
$0d:ee54  29 41		 and #$41
$0d:ee56  95 64		 sta $64,x
$0d:ee58  22 b4 8c 54   jsl $548cb4
$0d:ee5c  92 8b		 sta ($8b)
$0d:ee5e  92 6f		 sta ($6f)
$0d:ee60  84 53		 sty $53
$0d:ee62  ff 22 ff d0   sbc $d0ff22,x
$0d:ee66  44 03 40	  mvp $40,$03
$0d:ee69  ff c8 3f f1   sbc $f13fc8,x
$0d:ee6d  01 70		 ora ($70,x)
$0d:ee6f  f1 f2		 sbc ($f2),y
$0d:ee71  18			clc
$0d:ee72  e9 0c		 sbc #$0c
$0d:ee74  76 85		 ror $85,x
$0d:ee76  22 ce 47 29   jsl $2947ce
$0d:ee7a  38			sec
$0d:ee7b  89 15		 bit #$15
$0d:ee7d  06 28		 asl $28
$0d:ee7f  df 02 68 12   cmp $126802,x
$0d:ee83  c0 92 02	  cpy #$0292
$0d:ee86  10 22		 bpl $eeaa
$0d:ee88  81 0c		 sta ($0c,x)
$0d:ee8a  08			php
$0d:ee8b  21 26		 and ($26,x)
$0d:ee8d  cc 56 f7	  cpy $f756
$0d:ee90  52 2b		 eor ($2b)
$0d:ee92  f5 26		 sbc $26,x
$0d:ee94  7d 1a bb	  adc $bb1a,x
$0d:ee97  e1 2b		 sbc ($2b,x)
$0d:ee99  b5 59		 lda $59,x
$0d:ee9b  a5 4b		 lda $4b
$0d:ee9d  5c 21 0c 20   jml $200c21
$0d:eea1  a8			tay
$0d:eea2  d0 60		 bne $ef04
$0d:eea4  43 08		 eor $08,s
$0d:eea6  51 18		 eor ($18),y
$0d:eea8  68			pla
$0d:eea9  72 8e		 adc ($8e)
$0d:eeab  0d d3 01	  ora $01d3
$0d:eeae  62 aa 58	  per $475b
$0d:eeb1  69 57		 adc #$57
$0d:eeb3  0c ad a3	  tsb $a3ad
$0d:eeb6  95 64		 sta $64,x
$0d:eeb8  a2 fc a5	  ldx #$a5fc
$0d:eebb  1f f9 a1 08   ora $08a1f9,x
$0d:eebf  64 24		 stz $24
$0d:eec1  a1 53		 lda ($53,x)
$0d:eec3  94 c1		 sty $c1,x
$0d:eec5  c8			iny
$0d:eec6  10 0a		 bpl $eed2
$0d:eec8  44 de eb	  mvp $eb,$de
$0d:eecb  0b			phd
$0d:eecc  c3 5f		 cmp $5f,s
$0d:eece  95 e9		 sta $e9,x
$0d:eed0  be bf 20	  ldx $20bf,y
$0d:eed3  d1 ca		 cmp ($ca),y
$0d:eed5  4c 14 cf	  jmp $cf14
$0d:eed8  40			rti
$0d:eed9  2b			pld
$0d:eeda  be ea 97	  ldx $97ea,y
$0d:eedd  6e ed db	  ror $dbed
$0d:eee0  69 87		 adc #$87
$0d:eee2  66 4d		 ror $4d
$0d:eee4  62 f1 e7	  per $d6d8
$0d:eee7  31 28		 and ($28),y
$0d:eee9  32 92		 and ($92)
$0d:eeeb  38			sec
$0d:eeec  8d 0e 11	  sta $110e
$0d:eeef  cf fd fb ff   cmp $fffbfd
$0d:eef3  7d be 74	  adc $74be,x
$0d:eef6  72 5a		 adc ($5a)
$0d:eef8  ac 3f 13	  ldy $133f
$0d:eefb  3f ab cf 6f   and $6fcfab,x
$0d:eeff  f1 de		 sbc ($de),y
$0d:ef01  ac bb e4	  ldy $e4bb
$0d:ef04  30 70		 bmi $ef76
$0d:ef06  0b			phd
$0d:ef07  7c 02 fe	  jmp ($fe02,x)
$0d:ef0a  02 68		 cop #$68
$0d:ef0c  40			rti
$0d:ef0d  0c 37 b8	  tsb $b837
$0d:ef10  6d f6 1f	  adc $1ff6
$0d:ef13  a7 8e		 lda [$8e]
$0d:ef15  cb			wai
$0d:ef16  e3 b1		 sbc $b1,s
$0d:ef18  d9 2d 8e	  cmp $8e2d,y
$0d:ef1b  7b			tdc
$0d:ef1c  3f ba e5 6f   and $6fe5ba,x
$0d:ef20  41 62		 eor ($62,x)
$0d:ef22  20 48 65	  jsr $6548
$0d:ef25  fe 08 29	  inc $2908,x
$0d:ef28  18			clc
$0d:ef29  14 2f		 trb $2f
$0d:ef2b  ff b5 da 76   sbc $76dab5,x
$0d:ef2f  b3 3a		 lda ($3a,s),y
$0d:ef31  5c 17 33 6f   jml $6f3317
$0d:ef35  76 8d		 ror $8d,x
$0d:ef37  cf ef bd d5   cmp $d5bdef
$0d:ef3b  f0 40		 beq $ef7d
$0d:ef3d  29 70		 and #$70
$0d:ef3f  0b			phd
$0d:ef40  38			sec
$0d:ef41  20 ff f0	  jsr $f0ff
$0d:ef44  4f fc 09 5c   eor $5c09fc
$0d:ef48  11 f8		 ora ($f8),y
$0d:ef4a  05 4e		 ora $4e
$0d:ef4c  7f 73 98 68   adc $689873,x
$0d:ef50  ed 9e 59	  sbc $599e
$0d:ef53  5c fa e7 e9   jml $e9e7fa
$0d:ef57  93 f8		 sta ($f8,s),y
$0d:ef59  a4 c8		 ldy $c8
$0d:ef5b  32 87		 and ($87)
$0d:ef5d  ff e2 06 41   sbc $4106e2,x
$0d:ef61  43 81		 eor $81,s
$0d:ef63  94 22		 sty $22,x
$0d:ef65  3f ff f4 07   and $07f4ff,x
$0d:ef69  55 ff		 eor $ff,x
$0d:ef6b  a7 43		 lda [$43]
$0d:ef6d  f8			sed
$0d:ef6e  93 dd		 sta ($dd,s),y
$0d:ef70  67 56		 adc [$56]
$0d:ef72  bd e7 96	  lda $96e7,x
$0d:ef75  4d 7a 91	  eor $917a
$0d:ef78  d5 f9		 cmp $f9,x
$0d:ef7a  7c 09 62	  jmp ($6209,x)
$0d:ef7d  4c 07 48	  jmp $4807
$0d:ef80  70 bf		 bvs $ef41
$0d:ef82  fe 2f fc	  inc $fc2f,x
$0d:ef85  e6 e9		 inc $e9
$0d:ef87  aa			tax
$0d:ef88  b3 49		 lda ($49,s),y
$0d:ef8a  6d 7a 5b	  adc $5b7a
$0d:ef8d  77 de		 adc [$de],y
$0d:ef8f  71 3d		 adc ($3d),y
$0d:ef91  bf e5 ae dd   lda $ddaee5,x
$0d:ef95  19 74 0c	  ora $0c74,y
$0d:ef98  d8			cld
$0d:ef99  26 54		 rol $54
$0d:ef9b  74 84		 stz $84,x
$0d:ef9d  24 c0		 bit $c0
$0d:ef9f  3d e8 ae	  and $aee8,x
$0d:efa2  b2 6b		 lda ($6b)
$0d:efa4  5e b3 d7	  lsr $d7b3,x
$0d:efa7  36 bf		 rol $bf,x
$0d:efa9  68			pla
$0d:efaa  6f 73 bb 54   adc $54bb73
$0d:efae  b8			clv
$0d:efaf  ca			dex
$0d:efb0  7e c8 d0	  ror $d0c8,x
$0d:efb3  45 86		 eor $86
$0d:efb5  03 fe		 ora $fe,s
$0d:efb7  85 29		 sta $29
$0d:efb9  17 ff		 ora [$ff],y
$0d:efbb  1d ff 74	  ora $74ff,x
$0d:efbe  85 ff		 sta $ff
$0d:efc0  01 c0		 ora ($c0,x)
$0d:efc2  9f ed ee fc   sta $fceeed,x
$0d:efc6  1b			tcs
$0d:efc7  fe 7a 7c	  inc $7c7a,x
$0d:efca  d7 0c		 cmp [$0c],y
$0d:efcc  04 f9		 tsb $f9
$0d:efce  aa			tax
$0d:efcf  17 ff		 ora [$ff],y
$0d:efd1  ff 03 ff 88   sbc $88ff03,x
$0d:efd5  ff ef bf ee   sbc $eebfef,x
$0d:efd9  64 72		 stz $72
$0d:efdb  87 02		 sta [$02]
$0d:efdd  ff e5 b2 ff   sbc $ffb2e5,x
$0d:efe1  20 5b 99	  jsr $995b
$0d:efe4  df 0a fe ef   cmp $effe0a,x
$0d:efe8  0c 93 78	  tsb $7893
$0d:efeb  30 0c		 bmi $eff9
$0d:efed  30 cd		 bmi $efbc
$0d:efef  7f ff bf fe   adc $febfff,x
$0d:eff3  27 ff		 and [$ff]
$0d:eff5  79 ff df	  adc $dfff,y
$0d:eff8  b0 85		 bcs $ef7f
$0d:effa  be 0f d1	  ldx $d10f,y
$0d:effd  bf f7 6f f8   lda $f86ff7,x
$0d:f001  18			clc
$0d:f002  0e f2 85	  asl $85f2
$0d:f005  d7 94		 cmp [$94],y
$0d:f007  6f e8 01 b0   adc $b001e8
$0d:f00b  6f 83 94 1c   adc $1c9483
$0d:f00f  a1 fe		 lda ($fe,x)
$0d:f011  ff ef 7f fd   sbc $fd7fef,x
$0d:f015  70 40		 bvs $f057
$0d:f017  82 43 f7	  brl $e75d
$0d:f01a  44 fa 52	  mvp $52,$fa
$0d:f01d  fc 15 fd	  jsr ($fd15,x)
$0d:f020  4c af 95	  jmp $95af
$0d:f023  7e 7c a0	  ror $a07c,x
$0d:f026  ac 81 21	  ldy $2181
$0d:f029  d4 13		 pei ($13)
$0d:f02b  08			php
$0d:f02c  25 2f		 and $2f
$0d:f02e  d8			cld
$0d:f02f  1e 0d fb	  asl $fb0d,x
$0d:f032  25 73		 and $73
$0d:f034  d0 df		 bne $f015
$0d:f036  f1 b5		 sbc ($b5),y
$0d:f038  3c 65 48	  bit $4865,x
$0d:f03b  aa			tax
$0d:f03c  15 ad		 ora $ad,x
$0d:f03e  d5 fb		 cmp $fb,x
$0d:f040  ff 81 ff e3   sbc $e3ff81,x
$0d:f044  18			clc
$0d:f045  43 ac		 eor $ac,s
$0d:f047  ff eb 58 43   sbc $4358eb,x
$0d:f04b  45 ff		 eor $ff
$0d:f04d  db			stp
$0d:f04e  f6 1b		 inc $1b,x
$0d:f050  3a			dec a
$0d:f051  77 33		 adc [$33],y
$0d:f053  7b			tdc
$0d:f054  53 d9		 eor ($d9,s),y
$0d:f056  6a			ror a
$0d:f057  6d fa 6b	  adc $6bfa
$0d:f05a  77 56		 adc [$56],y
$0d:f05c  b9 db 94	  lda $94db,y
$0d:f05f  53 ff		 eor ($ff,s),y
$0d:f061  fb			xce
$0d:f062  1f fd 0b ff   ora $ff0bfd,x
$0d:f066  4d ff e4	  eor $e4ff
$0d:f069  7f d9 6f ce   adc $ce6fd9,x
$0d:f06d  93 f7		 sta ($f7,s),y
$0d:f06f  d8			cld
$0d:f070  fb			xce
$0d:f071  e0 6f d5	  cpx #$d56f
$0d:f074  3f 9c 73 c5   and $c5739c,x
$0d:f078  6e ef ce	  ror $ceef
$0d:f07b  73 33		 adc ($33,s),y
$0d:f07d  2c b5 57	  bit $57b5
$0d:f080  eb			xba
$0d:f081  ca			dex
$0d:f082  ad f0 ff	  lda $fff0
$0d:f085  e6 30		 inc $30
$0d:f087  9f ff e4 1f   sta $1fe4ff,x
$0d:f08b  fb			xce
$0d:f08c  37 fe		 and [$fe],y
$0d:f08e  d3 ff		 cmp ($ff,s),y
$0d:f090  d5 7f		 cmp $7f,x
$0d:f092  f4 9f f8	  pea $f89f
$0d:f095  1f f2 6b b7   ora $b76bf2,x
$0d:f099  ad 73 aa	  lda $aa73
$0d:f09c  bf c9 56 e6   lda $e656c9,x
$0d:f0a0  a9 f2		 lda #$f2
$0d:f0a2  d4 d9		 pei ($d9)
$0d:f0a4  7a			ply
$0d:f0a5  74 a8		 stz $a8,x
$0d:f0a7  07 fe		 ora [$fe]
$0d:f0a9  91 ff		 sta ($ff),y
$0d:f0ab  98			tya
$0d:f0ac  ff e4 7f fa   sbc $fa7fe4,x
$0d:f0b0  3f fe 1f ff   and $ff1ffe,x
$0d:f0b4  8f 7f e7 bf   sta $bfe77f
$0d:f0b8  fd 6f 4e	  sbc $4e6f,x
$0d:f0bb  ab			plb
$0d:f0bc  ec d5 56	  cpx $56d5
$0d:f0bf  6a			ror a
$0d:f0c0  ba			tsx
$0d:f0c1  cd 4d df	  cmp $df4d
$0d:f0c4  ad 59 93	  lda $9359
$0d:f0c7  62 7b 3a	  per $2b45
$0d:f0ca  e9 47		 sbc #$47
$0d:f0cc  e2 07		 sep #$07
$0d:f0ce  e0 c3 f0	  cpx #$f0c3
$0d:f0d1  20 6f e0	  jsr $e06f
$0d:f0d4  c0 48 20	  cpy #$2048
$0d:f0d7  17 18		 ora [$18],y
$0d:f0d9  05 ce		 ora $ce
$0d:f0db  00 08		 brk #$08
$0d:f0dd  04 00		 tsb $00
$0d:f0df  20 a0 d2	  jsr $d2a0
$0d:f0e2  5d eb 41	  eor $41eb,x
$0d:f0e5  a1 4d		 lda ($4d,x)
$0d:f0e7  69 14		 adc #$14
$0d:f0e9  d7 78		 cmp [$78],y
$0d:f0eb  3c 1a 99	  bit $991a,x
$0d:f0ee  49 a5		 eor #$a5
$0d:f0f0  4d 74 b4	  eor $b474
$0d:f0f3  8a			txa
$0d:f0f4  75 3c		 adc $3c,x
$0d:f0f6  00 d4		 brk #$d4
$0d:f0f8  a9 f4		 lda #$f4
$0d:f0fa  06 6b		 asl $6b
$0d:f0fc  01 9f		 ora ($9f,x)
$0d:f0fe  f0 a2		 beq $f0a2
$0d:f100  c0 33 a7	  cpy #$a733
$0d:f103  d3 a9		 cmp ($a9,s),y
$0d:f105  50 10		 bvc $f117
$0d:f107  e8			inx
$0d:f108  06 82		 asl $82
$0d:f10a  03 ca		 ora $ca,s
$0d:f10c  8f 04 d4 56   sta $56d404
$0d:f110  41 a0		 eor ($a0,x)
$0d:f112  d2 8a		 cmp ($8a)
$0d:f114  c0 28 56	  cpy #$5628
$0d:f117  f1 58		 sbc ($58),y
$0d:f119  69 87		 adc #$87
$0d:f11b  81 a6		 sta ($a6,x)
$0d:f11d  9a			txs
$0d:f11e  87 40		 sta [$40]
$0d:f120  56 01		 lsr $01,x
$0d:f122  51 1a		 eor ($1a),y
$0d:f124  88			dey
$0d:f125  ec 45 02	  cpx $0245
$0d:f128  2d 01 e8	  and $e801
$0d:f12b  d0 86		 bne $f0b3
$0d:f12d  84 35		 sty $35
$0d:f12f  31 a8		 and ($a8),y
$0d:f131  87 41		 sta [$41]
$0d:f133  f0 13		 beq $f148
$0d:f135  e9 f9		 sbc #$f9
$0d:f137  48			pha
$0d:f138  a8			tay
$0d:f139  e2 71		 sep #$71
$0d:f13b  15 91		 ora $91,x
$0d:f13d  7d 28 c3	  adc $c328,x
$0d:f140  c1 34		 cmp ($34,x)
$0d:f142  19 38 28	  ora $2838,y
$0d:f145  47 61		 eor [$61]
$0d:f147  15 80		 ora $80,x
$0d:f149  d0 74		 bne $f1bf
$0d:f14b  c6 23		 dec $23
$0d:f14d  2f 81 89 14   and $148981
$0d:f151  2c f8 04	  bit $04f8
$0d:f154  91 18		 sta ($18),y
$0d:f156  8d 62 65	  sta $6562
$0d:f159  f7 9f		 sbc [$9f],y
$0d:f15b  51 a6		 eor ($a6),y
$0d:f15d  09 22		 ora #$22
$0d:f15f  37 88		 and [$88],y
$0d:f161  ac 35 c5	  ldy $c535
$0d:f164  22 98 36 41   jsl $413698
$0d:f168  39 76 e9	  and $e976,y
$0d:f16b  80 d0		 bra $f13d
$0d:f16d  80 0a		 bra $f179
$0d:f16f  1f 4a 68 80   ora $80684a,x
$0d:f173  1f 82 ef 4a   ora $4aef82,x
$0d:f177  20 94 69	  jsr $6994
$0d:f17a  0f c0 a4 53   ora $53a4c0
$0d:f17e  84 80		 sty $80
$0d:f180  11 32		 ora ($32),y
$0d:f182  88			dey
$0d:f183  1b			tcs
$0d:f184  42 13		 wdm #$13
$0d:f186  40			rti
$0d:f187  a4 98		 ldy $98
$0d:f189  91 32		 sta ($32),y
$0d:f18b  65 b0		 adc $b0
$0d:f18d  0e 05 05	  asl $0505
$0d:f190  43 0c		 eor $0c,s
$0d:f192  91 d2		 sta ($d2),y
$0d:f194  87 52		 sta [$52]
$0d:f196  dc e5 28	  jml [$28e5]
$0d:f199  0c fd d4	  tsb $d4fd
$0d:f19c  02 c1		 cop #$c1
$0d:f19e  43 0b		 eor $0b,s
$0d:f1a0  1c 16 28	  trb $2816
$0d:f1a3  99 00 e2	  sta $e200,y
$0d:f1a6  b6 41		 ldx $41,y
$0d:f1a8  62 a2 c4	  per $b64d
$0d:f1ab  74 83		 stz $83,x
$0d:f1ad  68			pla
$0d:f1ae  cd 26 1e	  cmp $1e26
$0d:f1b1  32 48		 and ($48)
$0d:f1b3  3a			dec a
$0d:f1b4  83 5a		 sta $5a,s
$0d:f1b6  d2 08		 cmp ($08)
$0d:f1b8  14 22		 trb $22
$0d:f1ba  70 fc		 bvs $f1b8
$0d:f1bc  05 b3		 ora $b3
$0d:f1be  a2 42		 ldx #$42
$0d:f1c0  71 39		 adc ($39),y
$0d:f1c2  7e 09 5c	  ror $5c09,x
$0d:f1c5  59 22 cb	  eor $cb22,y
$0d:f1c8  20 e0 bd	  jsr $bde0
$0d:f1cb  c5 a4		 cmp $a4
$0d:f1cd  13 e3		 ora ($e3,s),y
$0d:f1cf  9a			txs
$0d:f1d0  8b			phb
$0d:f1d1  04 0e		 tsb $0e
$0d:f1d3  2d 20 98	  and $9820
$0d:f1d6  69 50		 adc #$50
$0d:f1d8  82 a6 4a	  brl $3c81
$0d:f1db  26 e6		 rol $e6
$0d:f1dd  64 71		 stz $71
$0d:f1df  37 59		 and [$59],y
$0d:f1e1  1a			inc a
$0d:f1e2  ca			dex
$0d:f1e3  85 31		 sta $31
$0d:f1e5  9a			txs
$0d:f1e6  20 49 a8	  jsr $a849
$0d:f1e9  6a			ror a
$0d:f1ea  82 a1 4c	  brl $3e8e
$0d:f1ed  e6 40		 inc $40
$0d:f1ef  06 79		 asl $79
$0d:f1f1  b3 d1		 lda ($d1,s),y
$0d:f1f3  e8			inx
$0d:f1f4  89 c1		 bit #$c1
$0d:f1f6  79 8b cc	  adc $cc8b,y
$0d:f1f9  e9 94		 sbc #$94
$0d:f1fb  fa			plx
$0d:f1fc  75 3f		 adc $3f,x
$0d:f1fe  73 b8		 adc ($b8,s),y
$0d:f200  04 98		 tsb $98
$0d:f202  14 a9		 trb $a9
$0d:f204  db			stp
$0d:f205  97 68		 sta [$68],y
$0d:f207  3b			tsc
$0d:f208  42 7b		 wdm #$7b
$0d:f20a  b8			clv
$0d:f20b  0b			phd
$0d:f20c  05 3a		 ora $3a
$0d:f20e  8a			txa
$0d:f20f  f3 16		 sbc ($16,s),y
$0d:f211  e0 8c		 cpx #$8c
$0d:f213  df 70 f4 17   cmp $17f470,x
$0d:f217  60			rts
$0d:f218  90 e0		 bcc $f1fa
$0d:f21a  26 3b		 rol $3b
$0d:f21c  99 e8 d0	  sta $d0e8,y
$0d:f21f  74 a3		 stz $a3,x
$0d:f221  45 a6		 eor $a6
$0d:f223  09 0c		 ora #$0c
$0d:f225  4a			lsr a
$0d:f226  39 6c b9	  and $b96c,y
$0d:f229  10 e8		 bpl $f213
$0d:f22b  43 46		 eor $46,s
$0d:f22d  cf 67 c6 83   cmp $83c667
$0d:f231  3c d8 50	  bit $50d8,x
$0d:f234  88			dey
$0d:f235  92 25		 sta ($25)
$0d:f237  1a			inc a
$0d:f238  01 bc		 ora ($bc,x)
$0d:f23a  8d 00 53	  sta $5300
$0d:f23d  23 d8		 and $d8,s
$0d:f23f  8d 01 1c	  sta $1c01
$0d:f242  02 61		 cop #$61
$0d:f244  3c 03 b4	  bit $b403,x
$0d:f247  14 c0		 trb $c0
$0d:f249  89 4d		 bit #$4d
$0d:f24b  cc d0 ae	  cpy $aed0
$0d:f24e  c3 94		 cmp $94,s
$0d:f250  40			rti
$0d:f251  db			stp
$0d:f252  00 4a		 brk #$4a
$0d:f254  a0 53		 ldy #$53
$0d:f256  05 8d		 ora $8d
$0d:f258  2f fa 83 49   and $4983fa
$0d:f25c  77 e3		 adc [$e3],y
$0d:f25e  c3 68		 cmp $68,s
$0d:f260  2e fd a6	  rol $a6fd
$0d:f263  3c 0e 89	  bit $890e,x
$0d:f266  4d 12 00	  eor $0012
$0d:f269  65 37		 adc $37
$0d:f26b  34 fa		 bit $fa,x
$0d:f26d  70 bc		 bvs $f22b
$0d:f26f  77 3b		 adc [$3b],y
$0d:f271  81 a0		 sta ($a0,x)
$0d:f273  0c 0a 9c	  tsb $9c0a
$0d:f276  af 05 ff b5   lda $b5ff05
$0d:f27a  06 78		 asl $78
$0d:f27c  d4 9d		 pei ($9d)
$0d:f27e  84 e4		 sty $e4
$0d:f280  c0 3b		 cpy #$3b
$0d:f282  15 58		 ora $58,x
$0d:f284  4d 08 0a	  eor $0a08
$0d:f287  27 3a		 and [$3a]
$0d:f289  26 c6		 rol $c6
$0d:f28b  69 3d		 adc #$3d
$0d:f28d  ea			nop
$0d:f28e  74 ba		 stz $ba,x
$0d:f290  07 a0		 ora [$a0]
$0d:f292  e9 74		 sbc #$74
$0d:f294  9d e9 42	  sta $42e9,x
$0d:f297  ea			nop
$0d:f298  74 79		 stz $79,x
$0d:f29a  7e 1e c2	  ror $c21e,x
$0d:f29d  28			plp
$0d:f29e  3c 3e 17	  bit $173e,x
$0d:f2a1  82 50 b9	  brl $abf4
$0d:f2a4  7d 9e cf	  adc $cf9e,x
$0d:f2a7  8f c5 e2 f1   sta $f1e2c5
$0d:f2ab  a6 40		 ldx $40
$0d:f2ad  36 42		 rol $42,x
$0d:f2af  f0 f3		 beq $f2a4
$0d:f2b1  a6 03		 ldx $03
$0d:f2b3  c7 f4		 cmp [$f4]
$0d:f2b5  f2 2a		 sbc ($2a)
$0d:f2b7  88			dey
$0d:f2b8  4e 14 cf	  lsr $cf14
$0d:f2bb  3f 47 a1 dc   and $dca147,x
$0d:f2bf  f1 7d		 sbc ($7d),y
$0d:f2c1  3c ab 84	  bit $84ab,x
$0d:f2c4  a0 21		 ldy #$21
$0d:f2c6  01 2c		 ora ($2c,x)
$0d:f2c8  1d 85 42	  ora $4285,x
$0d:f2cb  aa			tax
$0d:f2cc  87 71		 sta [$71]
$0d:f2ce  4f 52 8a d9   eor $d98a52
$0d:f2d2  d7 01		 cmp [$01],y
$0d:f2d4  33 ea		 and ($ea,s),y
$0d:f2d6  2d 45 8e	  and $8e45
$0d:f2d9  ca			dex
$0d:f2da  a1 00		 lda ($00,x)
$0d:f2dc  6d 24 3e	  adc $3e24
$0d:f2df  a7 21		 lda [$21]
$0d:f2e1  a7 51		 lda [$51]
$0d:f2e3  69 94		 adc #$94
$0d:f2e5  10 48		 bpl $f32f
$0d:f2e7  0b			phd
$0d:f2e8  d4 64		 pei ($64)
$0d:f2ea  33 11		 and ($11,s),y
$0d:f2ec  a8			tay
$0d:f2ed  15 03		 ora $03,x
$0d:f2ef  70 69		 bvs $f35a
$0d:f2f1  39 ec cc	  and $ccec,y
$0d:f2f4  d6 04		 dec $04,x
$0d:f2f6  00 d2		 brk #$d2
$0d:f2f8  cc f2 d9	  cpy $d9f2
$0d:f2fb  79 91 4d	  adc $4d91,y
$0d:f2fe  c5 80		 cmp $80
$0d:f300  54 0c f6	  mvn $f6,$0c
$0d:f303  7e 68 69	  ror $6968,x
$0d:f306  43 58		 eor $58,s
$0d:f308  8f 00 d0 13   sta $13d000
$0d:f30c  c1 48		 cmp ($48,x)
$0d:f30e  0c 54 ec	  tsb $ec54
$0d:f311  03 05		 ora $05,s
$0d:f313  12 88		 ora ($88)
$0d:f315  a4 08		 ldy $08
$0d:f317  0c 40 1e	  tsb $1e40
$0d:f31a  87 4b		 sta [$4b]
$0d:f31c  a5 d0		 lda $d0
$0d:f31e  e8			inx
$0d:f31f  2c c1 66	  bit $66c1
$0d:f322  06 f5		 asl $f5
$0d:f324  ec 78 7c	  cpx $7c78
$0d:f327  3d 8e c3	  and $c38e,x
$0d:f32a  0c 18 60	  tsb $6018
$0d:f32d  7f 56 98 23   adc $239856,x
$0d:f331  d1 20		 cmp ($20),y
$0d:f333  be 37 24	  ldx $2437,y
$0d:f336  ba			tsx
$0d:f337  8d ac ed	  sta $edac
$0d:f33a  85 73		 sta $73
$0d:f33c  b3 9d		 lda ($9d,s),y
$0d:f33e  95 fe		 sta $fe,x
$0d:f340  bf d0 01 3b   lda $3b01d0,x
$0d:f344  e9 e0		 sbc #$e0
$0d:f346  34 4a		 bit $4a,x
$0d:f348  6b			rtl
$0d:f349  bd 80 43	  lda $4380,x
$0d:f34c  4f a7 53 f7   eor $f753a7
$0d:f350  3b			tsc
$0d:f351  80 80		 bra $f2d3
$0d:f353  04 02		 tsb $02
$0d:f355  9b			txy
$0d:f356  44 08 1c	  mvp $1c,$08
$0d:f359  ce 64 1f	  dec $1f64
$0d:f35c  5d c6 e4	  eor $e4c6,x
$0d:f35f  40			rti
$0d:f360  53 d9		 eor ($d9,s),y
$0d:f362  8c d0 5e	  sty $5ed0
$0d:f365  c5 74		 cmp $74
$0d:f367  0f b8 81 45   ora $4581b8
$0d:f36b  e7 a5		 sbc [$a5]
$0d:f36d  1c a0 ed	  trb $eda0
$0d:f370  04 06		 tsb $06
$0d:f372  20 02 f9	  jsr $f902
$0d:f375  75 3a		 adc $3a,x
$0d:f377  3d 03 68	  and $6803,x
$0d:f37a  74 3a		 stz $3a,x
$0d:f37c  5d 23 80	  eor $8023,x
$0d:f37f  1c 44 da	  trb $da44
$0d:f382  3c be cf	  bit $cfbe,x
$0d:f385  60			rts
$0d:f386  fa			plx
$0d:f387  1d 8f 0f	  ora $0f8f,x
$0d:f38a  85 00		 sta $00
$0d:f38c  08			php
$0d:f38d  11 3e		 ora ($3e),y
$0d:f38f  8f 67 c3 e0   sta $e0c367
$0d:f393  f1 78		 sbc ($78),y
$0d:f395  d1 e0		 cmp ($e0),y
$0d:f397  90 14		 bcc $f3ad
$0d:f399  78			sei
$0d:f39a  a6 05		 ldx $05
$0d:f39c  24 1e		 bit $1e
$0d:f39e  3f 22 7f 7c   and $7c7f22,x
$0d:f3a2  aa			tax
$0d:f3a3  fd 4f fa	  sbc $fa4f,x
$0d:f3a6  c3 d7		 cmp $d7,s
$0d:f3a8  f8			sed
$0d:f3a9  04 60		 tsb $60
$0d:f3ab  50 52		 bvc $f3ff
$0d:f3ad  eb			xba
$0d:f3ae  74 37		 stz $37,x
$0d:f3b0  b0 bc		 bcs $f36e
$0d:f3b2  8a			txa
$0d:f3b3  99 45 79	  sta $7945,y
$0d:f3b6  13 e4		 ora ($e4,s),y
$0d:f3b8  5e a2 04	  lsr $04a2,x
$0d:f3bb  1a			inc a
$0d:f3bc  66 e7		 ror $e7
$0d:f3be  71 4f		 adc ($4f),y
$0d:f3c0  a6 bd		 ldx $bd
$0d:f3c2  d6 98		 dec $98,x
$0d:f3c4  14 0a		 trb $0a
$0d:f3c6  76 e4		 ror $e4,x
$0d:f3c8  8e 13 dd	  stx $dd13
$0d:f3cb  c0 58		 cpy #$58
$0d:f3cd  28			plp
$0d:f3ce  55 ba		 eor $ba,x
$0d:f3d0  00 44		 brk #$44
$0d:f3d2  4a			lsr a
$0d:f3d3  e0 55		 cpx #$55
$0d:f3d5  4d c0 84	  eor $84c0
$0d:f3d8  34 a3		 bit $a3,x
$0d:f3da  71 2f		 adc ($2f),y
$0d:f3dc  08			php
$0d:f3dd  fd e7 a6	  sbc $a6e7,x
$0d:f3e0  22 19 90 cc   jsl $cc9019
$0d:f3e4  4d 83 d5	  eor $d583
$0d:f3e7  19 0f f6	  ora $f60f,y
$0d:f3ea  68			pla
$0d:f3eb  57 12		 eor [$12],y
$0d:f3ed  60			rts
$0d:f3ee  15 80		 ora $80,x
$0d:f3f0  f8			sed
$0d:f3f1  3c 33 01	  bit $0133,x
$0d:f3f4  4c 8c e3	  jmp $e38c
$0d:f3f7  d1 32		 cmp ($32),y
$0d:f3f9  8a			txa
$0d:f3fa  30 4c		 bmi $f448
$0d:f3fc  e4 72		 cpx $72
$0d:f3fe  03 b8		 ora $b8,s
$0d:f400  a0 47		 ldy #$47
$0d:f402  b1 e1		 lda ($e1),y
$0d:f404  33 87		 and ($87,s),y
$0d:f406  64 f0		 stz $f0
$0d:f408  27 50		 and [$50]
$0d:f40a  f1 f8		 sbc ($f8),y
$0d:f40c  bc 69 11	  ldy $1169,x
$0d:f40f  48			pha
$0d:f410  1a			inc a
$0d:f411  58			cli
$0d:f412  d7 fe		 cmp [$fe],y
$0d:f414  d0 f5		 bne $f40b
$0d:f416  0f ac bd 7f   ora $7fbdac
$0d:f41a  40			rti
$0d:f41b  c1 78		 cmp ($78,x)
$0d:f41d  5b			tcd
$0d:f41e  c3 68		 cmp $68,s
$0d:f420  22 00 07 8d   jsl $8d0700
$0d:f424  36 88		 rol $88,x
$0d:f426  27 07		 and [$07]
$0d:f428  a2 92		 ldx #$92
$0d:f42a  cf 71 b9 dc   cmp $dcb971
$0d:f42e  05 98		 ora $98
$0d:f430  a6 13		 ldx $13
$0d:f432  d2 81		 cmp ($81)
$0d:f434  ee 29 d4	  inc $d429
$0d:f437  50 d3		 bvc $f40c
$0d:f439  87 c3		 sta [$c3]
$0d:f43b  4a			lsr a
$0d:f43c  20 1d c0	  jsr $c01d
$0d:f43f  e4 c6		 cpx $c6
$0d:f441  64 35		 stz $35
$0d:f443  01 89		 ora ($89,x)
$0d:f445  d0 03		 bne $f44a
$0d:f447  67 d4		 adc [$d4]
$0d:f449  e8			inx
$0d:f44a  f4 3a a4	  pea $a43a
$0d:f44d  03 99		 ora $99,s
$0d:f44f  d0 1e		 bne $f46f
$0d:f451  85 d0		 sta $d0
$0d:f453  e5 a1		 sbc $a1
$0d:f455  03 87		 ora $87,s
$0d:f457  d0 e8		 bne $f441
$0d:f459  18			clc
$0d:f45a  48			pha
$0d:f45b  b4 7d		 ldy $7d,x
$0d:f45d  83 88		 sta $88,s
$0d:f45f  78			sei
$0d:f460  4e 20 7f	  lsr $7f20
$0d:f463  1e 1f 54	  asl $541f,x
$0d:f466  4c 7e 34	  jmp $347e
$0d:f469  7a			ply
$0d:f46a  f8			sed
$0d:f46b  3b			tsc
$0d:f46c  3d 32 40	  and $4032,x
$0d:f46f  05 85		 ora $85
$0d:f471  7e de cf	  ror $cfde,x
$0d:f474  1f 74 f0 2f   ora $2ff074,x
$0d:f478  40			rti
$0d:f479  67 ba		 adc [$ba]
$0d:f47b  9c 13 22	  stz $2213
$0d:f47e  39 06 fc	  and $fc06,y
$0d:f481  7b			tdc
$0d:f482  15 22		 ora $22,x
$0d:f484  49 05		 eor #$05
$0d:f486  7b			tdc
$0d:f487  ad 85 52	  lda $5285
$0d:f48a  4b			phk
$0d:f48b  f8			sed
$0d:f48c  52 8a		 eor ($8a)
$0d:f48e  64 0b		 stz $0b
$0d:f490  41 42		 eor ($42,x)
$0d:f492  80 bc		 bra $f450
$0d:f494  6e 93 42	  ror $4293
$0d:f497  a3 bc		 lda $bc,s
$0d:f499  4b			phk
$0d:f49a  85 16		 sta $16
$0d:f49c  9f bc 51 de   sta $de51bc,x
$0d:f4a0  00 83		 brk #$83
$0d:f4a2  e5 47		 sbc $47
$0d:f4a4  9f 0e f1 c7   sta $c7f10e,x
$0d:f4a8  7c e9 60	  jmp ($60e9,x)
$0d:f4ab  3a			dec a
$0d:f4ac  f0 ea		 beq $f498
$0d:f4ae  ff 46 8c 0d   sbc $0d8c46,x
$0d:f4b2  28			plp
$0d:f4b3  81 2c		 sta ($2c,x)
$0d:f4b5  74 c4		 stz $c4,x
$0d:f4b7  a3 7d		 lda $7d,s
$0d:f4b9  9d 12 75	  sta $7512,x
$0d:f4bc  08			php
$0d:f4bd  88			dey
$0d:f4be  3c 56 05	  bit $0556,x
$0d:f4c1  08			php
$0d:f4c2  36 02		 rol $02,x
$0d:f4c4  30 27		 bmi $f4ed
$0d:f4c6  73 93		 adc ($93,s),y
$0d:f4c8  08			php
$0d:f4c9  1d 12 71	  ora $7112,x
$0d:f4cc  39 3e 02	  and $023e,y
$0d:f4cf  b4 29		 ldy $29,x
$0d:f4d1  93 b3		 sta ($b3,s),y
$0d:f4d3  88			dey
$0d:f4d4  21 15		 and ($15,x)
$0d:f4d6  7a			ply
$0d:f4d7  14 13		 trb $13
$0d:f4d9  78			sei
$0d:f4da  1b			tcs
$0d:f4db  c2 88		 rep #$88
$0d:f4dd  82 04 a1	  brl $95e4
$0d:f4e0  a3 06		 lda $06,s
$0d:f4e2  92 90		 sta ($90)
$0d:f4e4  13 78		 ora ($78,s),y
$0d:f4e6  65 53		 adc $53
$0d:f4e8  e6 a6		 inc $a6
$0d:f4ea  35 31		 and $31,x
$0d:f4ec  e7 54		 sbc [$54]
$0d:f4ee  cf 4a 4f 95   cmp $954f4a
$0d:f4f2  32 25		 and ($25)
$0d:f4f4  4d 53 2b	  eor $2b53
$0d:f4f7  c0 11		 cpy #$11
$0d:f4f9  e7 f7		 sbc [$f7]
$0d:f4fb  4d 92 3c	  eor $3c92
$0d:f4fe  9e 00 90	  stz $9000,x
$0d:f501  2a			rol a
$0d:f502  54 06 90	  mvn $90,$06
$0d:f505  d5 51		 cmp $51,x
$0d:f507  04 0f		 tsb $0f
$0d:f509  02 13		 cop #$13
$0d:f50b  40			rti
$0d:f50c  17 84		 ora [$84],y
$0d:f50e  c6 68		 dec $68
$0d:f510  21 78		 and ($78,x)
$0d:f512  14 e1		 trb $e1
$0d:f514  36 14		 rol $14,x
$0d:f516  4d 8c c8	  eor $c88c
$0d:f519  aa			tax
$0d:f51a  00 26		 brk #$26
$0d:f51c  a1 a4		 lda ($a4,x)
$0d:f51e  0a			asl a
$0d:f51f  72 66		 adc ($66)
$0d:f521  58			cli
$0d:f522  83 e4		 sta $e4,s
$0d:f524  14 a8		 trb $a8
$0d:f526  68			pla
$0d:f527  33 d8		 and ($d8,s),y
$0d:f529  4e 9f 22	  lsr $229f
$0d:f52c  9f 30 31 22   sta $223130,x
$0d:f530  c5 da		 cmp $da
$0d:f532  14 8a		 trb $8a
$0d:f534  75 3c		 adc $3c,x
$0d:f536  92 4e		 sta ($4e)
$0d:f538  e0 1b		 cpx #$1b
$0d:f53a  9b			txy
$0d:f53b  b4 a8		 ldy $a8,x
$0d:f53d  d4 7a		 pei ($7a)
$0d:f53f  34 fe		 bit $fe,x
$0d:f541  02 79		 cop #$79
$0d:f543  14 d8		 trb $d8
$0d:f545  d3 1c		 cmp ($1c,s),y
$0d:f547  61 3e		 adc ($3e,x)
$0d:f549  a3 55		 lda $55,s
$0d:f54b  6a			ror a
$0d:f54c  d5 6a		 cmp $6a,x
$0d:f54e  bc f9 14	  ldy $14f9,x
$0d:f551  66 51		 ror $51
$0d:f553  9f 9a 82 e9   sta $e9829a,x
$0d:f557  53 a9		 eor ($a9,s),y
$0d:f559  dd 6a ed	  cmp $ed6a,x
$0d:f55c  85 3c		 sta $3c
$0d:f55e  1a			inc a
$0d:f55f  24 6e		 bit $6e
$0d:f561  ac f1 24	  ldy $24f1
$0d:f564  85 2a		 sta $2a
$0d:f566  aa			tax
$0d:f567  88			dey
$0d:f568  3a			dec a
$0d:f569  d5 48		 cmp $48,x
$0d:f56b  f6 09		 inc $09,x
$0d:f56d  21 77		 and ($77,x)
$0d:f56f  02 55		 cop #$55
$0d:f571  6a			ror a
$0d:f572  15 15		 ora $15,x
$0d:f574  50 3b		 bvc $f5b1
$0d:f576  85 0c		 sta $0c
$0d:f578  d5 4a		 cmp $4a,x
$0d:f57a  c5 65		 cmp $65
$0d:f57c  74 08		 stz $08,x
$0d:f57e  53 55		 eor ($55,s),y
$0d:f580  0a			asl a
$0d:f581  ac 11 25	  ldy $2511
$0d:f584  77 b3		 adc [$b3],y
$0d:f586  25 4d		 and $4d
$0d:f588  74 2b		 stz $2b,x
$0d:f58a  b0 44		 bcs $f5d0
$0d:f58c  95 7f		 sta $7f,x
$0d:f58e  65 5d		 adc $5d
$0d:f590  54 1d 4a	  mvn $4a,$1d
$0d:f593  a8			tay
$0d:f594  c7 16		 cmp [$16]
$0d:f596  21 cc		 and ($cc,x)
$0d:f598  66 8e		 ror $8e
$0d:f59a  fc 99 cc	  jsr ($cc99,x)
$0d:f59d  9f eb a5 7f   sta $7fa5eb,x
$0d:f5a1  a4 e7		 ldy $e7
$0d:f5a3  62 fd 09	  per $ffa3
$0d:f5a6  e3 c0		 sbc $c0,s
$0d:f5a8  e7 af		 sbc [$af]
$0d:f5aa  03 a4		 ora $a4,s
$0d:f5ac  d1 0d		 cmp ($0d),y
$0d:f5ae  e0 21		 cpx #$21
$0d:f5b0  1d 8b fc	  ora $fc8b,x
$0d:f5b3  32 d9		 and ($d9)
$0d:f5b5  77 f9		 adc [$f9],y
$0d:f5b7  20 09 00	  jsr $0009
$0d:f5ba  34 cd		 bit $cd,x
$0d:f5bc  8c d3 3d	  sty $3dd3
$0d:f5bf  9f 77 95 34   sta $349577,x
$0d:f5c3  5e b4 20	  lsr $20b4,x
$0d:f5c6  02 6c		 cop #$6c
$0d:f5c8  29 14		 and #$14
$0d:f5ca  e3 88		 sbc $88,s
$0d:f5cc  a0 46		 ldy #$46
$0d:f5ce  89 b1		 bit #$b1
$0d:f5d0  09 8e		 ora #$8e
$0d:f5d2  c2 73		 rep #$73
$0d:f5d4  4d af 5b	  eor $5baf
$0d:f5d7  a9 05 15	  lda #$1505
$0d:f5da  10 89		 bpl $f565
$0d:f5dc  44 68 f0	  mvp $f0,$68
$0d:f5df  1a			inc a
$0d:f5e0  f1 85		 sbc ($85),y
$0d:f5e2  45 e9		 eor $e9
$0d:f5e4  57 37		 eor [$37],y
$0d:f5e6  84 06		 sty $06
$0d:f5e8  91 4f		 sta ($4f),y
$0d:f5ea  4f 80 fd ae   eor $aefd80
$0d:f5ee  b5 75		 lda $75,x
$0d:f5f0  78			sei
$0d:f5f1  57 a7		 eor [$a7],y
$0d:f5f3  e6 f0		 inc $f0
$0d:f5f5  a4 0f		 ldy $0f
$0d:f5f7  d2 85		 cmp ($85)
$0d:f5f9  51 af		 eor ($af),y
$0d:f5fb  cf a8 cc 00   cmp $00cca8
$0d:f5ff  3f 84 26 80   and $802684,x
$0d:f603  30 3a		 bmi $f63f
$0d:f605  15 66		 ora $66,x
$0d:f607  cf 30 67 8a   cmp $8a6730
$0d:f60b  3c 14 e0	  bit $e014,x
$0d:f60e  42 45		 wdm #$45
$0d:f610  81 3a		 sta ($3a,x)
$0d:f612  8d 50 ae	  sta $ae50
$0d:f615  31 a9		 and ($a9),y
$0d:f617  d5 2b		 cmp $2b,x
$0d:f619  15 96		 ora $96,x
$0d:f61b  a0 18 52	  ldy #$5218
$0d:f61e  96 d4		 stx $d4,y
$0d:f620  06 21		 asl $21
$0d:f622  34 42		 bit $42,x
$0d:f624  be 82 02	  ldx $0282,y
$0d:f627  89 cc 7b	  bit #$7bcc
$0d:f62a  5e 3f a7	  lsr $a73f,x
$0d:f62d  95 e7		 sta $e7,x
$0d:f62f  33 3e		 and ($3e,s),y
$0d:f631  db			stp
$0d:f632  ca			dex
$0d:f633  fc ae f0	  jsr ($f0ae,x)
$0d:f636  01 5b		 ora ($5b,x)
$0d:f638  f8			sed
$0d:f639  7c 82 1b	  jmp ($1b82,x)
$0d:f63c  9e 76 c2	  stz $c276,x
$0d:f63f  38			sec
$0d:f640  69 13 50	  adc #$5013
$0d:f643  7b			tdc
$0d:f644  de 70 b9	  dec $b970,x
$0d:f647  4f b1 55 db   eor $db55b1
$0d:f64b  42 84		 wdm #$84
$0d:f64d  0d cc ca	  ora $cacc
$0d:f650  60			rts
$0d:f651  66 29		 ror $29
$0d:f653  9e c8 cc	  stz $ccc8,x
$0d:f656  14 13		 trb $13
$0d:f658  18			clc
$0d:f659  6e cc c6	  ror $c6cc
$0d:f65c  66 1d		 ror $1d
$0d:f65e  e4 cc		 cpx $cc
$0d:f660  cc 07 16	  cpy $1607
$0d:f663  da			phx
$0d:f664  4c 36 66	  jmp $6636
$0d:f667  63 39		 adc $39,s
$0d:f669  04 ce		 tsb $ce
$0d:f66b  64 89		 stz $89
$0d:f66d  23 58		 and $58,s
$0d:f66f  4c 66 1b	  jmp $1b66
$0d:f672  a4 91		 ldy $91
$0d:f674  6d 0f 60	  adc $600f
$0d:f677  65 19		 adc $19
$0d:f679  99 ec b6	  sta $b6ec,y
$0d:f67c  4a			lsr a
$0d:f67d  23 d2		 and $d2,s
$0d:f67f  ef 37 49 a1   sbc $a14937
$0d:f683  3e 0c c2	  rol $c20c,x
$0d:f686  68			pla
$0d:f687  b2 1d		 lda ($1d)
$0d:f689  9f f5 02 c8   sta $c802f5,x
$0d:f68d  52 3e		 eor ($3e)
$0d:f68f  06 c6		 asl $c6
$0d:f691  50 d0		 bvc $f663
$0d:f693  0d 9e 94	  ora $949e
$0d:f696  e6 bb		 inc $bb
$0d:f698  23 28		 and $28,s
$0d:f69a  53 07		 eor ($07,s),y
$0d:f69c  e2 cf		 sep #$cf
$0d:f69e  14 49		 trb $49
$0d:f6a0  ec 9a 02	  cpx $029a
$0d:f6a3  11 c7		 ora ($c7),y
$0d:f6a5  e7 83		 sbc [$83]
$0d:f6a7  7f c8 1f d0   adc $d01fc8,x
$0d:f6ab  73 7b		 adc ($7b,s),y
$0d:f6ad  7d de ef	  adc $efde,x
$0d:f6b0  78			sei
$0d:f6b1  be 7d d4	  ldx $d47d,y
$0d:f6b4  d3 00		 cmp ($00,s),y
$0d:f6b6  51 07		 eor ($07),y
$0d:f6b8  25 f6		 and $f6
$0d:f6ba  27 8d		 and [$8d]
$0d:f6bc  02 92		 cop #$92
$0d:f6be  48			pha
$0d:f6bf  02 a9		 cop #$a9
$0d:f6c1  d0 89		 bne $f64c
$0d:f6c3  e0 b2 19	  cpx #$19b2
$0d:f6c6  4d 00 aa	  eor $aa00
$0d:f6c9  b4 9a		 ldy $9a,x
$0d:f6cb  12 24		 ora ($24)
$0d:f6cd  55 01		 eor $01,x
$0d:f6cf  ba			tsx
$0d:f6d0  dc 11 c4	  jml [$c411]
$0d:f6d3  aa			tax
$0d:f6d4  74 cd		 stz $cd,x
$0d:f6d6  89 b8 0f	  bit #$0fb8
$0d:f6d9  c2 62		 rep #$62
$0d:f6db  02 a3		 cop #$a3
$0d:f6dd  9f 85 a8 06   sta $06a885,x
$0d:f6e1  29 98 65	  and #$6598
$0d:f6e4  b2 e8		 lda ($e8)
$0d:f6e6  1c cf 67	  trb $67cf
$0d:f6e9  cd c0 72	  cmp $72c0
$0d:f6ec  0a			asl a
$0d:f6ed  29 d9 77	  and #$77d9
$0d:f6f0  27 e1		 and [$e1]
$0d:f6f2  9a			txs
$0d:f6f3  17 c0		 ora [$c0],y
$0d:f6f5  c4 d4		 cpy $d4
$0d:f6f7  2d da 40	  and $40da
$0d:f6fa  76 93		 ror $93,x
$0d:f6fc  09 9a 0d	  ora #$0d9a
$0d:f6ff  91 a3		 sta ($a3),y
$0d:f701  28			plp
$0d:f702  36 86		 rol $86,x
$0d:f704  ca			dex
$0d:f705  64 c4		 stz $c4
$0d:f707  76 e8		 ror $e8,x
$0d:f709  03 bd		 ora $bd,s
$0d:f70b  ff e0 ec f2   sbc $f2ece0,x
$0d:f70f  07 f4		 ora [$f4]
$0d:f711  1d e3 ed	  ora $ede3,x
$0d:f714  fb			xce
$0d:f715  13 f5		 ora ($f5,s),y
$0d:f717  84 0d		 sty $0d
$0d:f719  d0 30		 bne $f74b
$0d:f71b  bc cf 77	  ldy $77cf,x
$0d:f71e  33 69		 and ($69,s),y
$0d:f720  01 86		 ora ($86,x)
$0d:f722  76 93		 ror $93,x
$0d:f724  3d e1 dd	  and $dde1,x
$0d:f727  0c 23 b2	  tsb $b223
$0d:f72a  30 9c		 bmi $f6c8
$0d:f72c  d0 c2		 bne $f6f0
$0d:f72e  5b			tcd
$0d:f72f  a9 93 80	  lda #$8093
$0d:f732  51 c6		 eor ($c6),y
$0d:f734  61 4d		 adc ($4d,x)
$0d:f736  94 cd		 sty $cd,x
$0d:f738  28			plp
$0d:f739  2d 10 70	  and $7010
$0d:f73c  02 75		 cop #$75
$0d:f73e  66 85		 ror $85
$0d:f740  f0 99		 beq $f6db
$0d:f742  4c e6 7b	  jmp $7be6
$0d:f745  29 89 d1	  and #$d189
$0d:f748  e6 1f		 inc $1f
$0d:f74a  d9 9c c7	  cmp $c79c,y
$0d:f74d  78			sei
$0d:f74e  70 9d		 bvs $f6ed
$0d:f750  94 ca		 sty $ca,x
$0d:f752  69 b4 9a	  adc #$9ab4
$0d:f755  6e d0 84	  ror $84d0
$0d:f758  61 3d		 adc ($3d,x)
$0d:f75a  d2 d8		 cmp ($d8)
$0d:f75c  37 7b		 and [$7b],y
$0d:f75e  a9 9c d1	  lda #$d19c
$0d:f761  74 63		 stz $63,x
$0d:f763  ef 7f f8 3b   sbc $3bf87f
$0d:f767  3c 81 fd	  bit $fd81,x
$0d:f76a  07 37		 ora [$37]
$0d:f76c  b6 73		 ldx $73,y
$0d:f76e  ef 07 48 dc   sbc $dc4807
$0d:f772  28			plp
$0d:f773  74 1a		 stz $1a,x
$0d:f775  58			cli
$0d:f776  e4 fe		 cpx $fe
$0d:f778  c4 f3		 cpy $f3
$0d:f77a  a1 d2		 lda ($d2,x)
$0d:f77c  68			pla
$0d:f77d  25 60		 and $60
$0d:f77f  a1 13		 lda ($13,x)
$0d:f781  c9 d2 5b	  cmp #$5bd2
$0d:f784  2d 85 34	  and $3485
$0d:f787  ae 34 9a	  ldx $9a34
$0d:f78a  12 3d		 ora ($3d)
$0d:f78c  0c 43 39	  tsb $3943
$0d:f78f  33 11		 and ($11,s),y
$0d:f791  64 13		 stz $13
$0d:f793  2b			pld
$0d:f794  29 a0 1d	  and #$1da0
$0d:f797  4e 99 b9	  lsr $b999
$0d:f79a  65 0e		 adc $0e
$0d:f79c  94 fe		 sty $fe,x
$0d:f79e  68			pla
$0d:f79f  71 a7		 adc ($a7),y
$0d:f7a1  d3 b7		 cmp ($b7,s),y
$0d:f7a3  3b			tsc
$0d:f7a4  b9 a3 3d	  lda $3da3,y
$0d:f7a7  36 04		 rol $04,x
$0d:f7a9  70 44		 bvs $f7ef
$0d:f7ab  86 ed		 stx $ed
$0d:f7ad  c2 3b		 rep #$3b
$0d:f7af  4d e6 cc	  eor $cce6
$0d:f7b2  fe 8a 53	  inc $538a,x
$0d:f7b5  50 04		 bvc $f7bb
$0d:f7b7  ce 65 3d	  dec $3d65
$0d:f7ba  d9 24 0e	  cmp $0e24,y
$0d:f7bd  85 bb		 sta $bb
$0d:f7bf  56 8e		 lsr $8e,x
$0d:f7c1  ca			dex
$0d:f7c2  69 bc 99	  adc #$99bc
$0d:f7c5  9f 96 85 33   sta $338596,x
$0d:f7c9  75 16		 adc $16,x
$0d:f7cb  d0 f8		 bne $f7c5
$0d:f7cd  c6 90		 dec $90
$0d:f7cf  de 36 83	  dec $8336,x
$0d:f7d2  65 28		 adc $28
$0d:f7d4  74 98		 stz $98,x
$0d:f7d6  3a			dec a
$0d:f7d7  e2 f3		 sep #$f3
$0d:f7d9  da			phx
$0d:f7da  00 42		 brk #$42
$0d:f7dc  fe b3 27	  inc $27b3,x
$0d:f7df  f6 79		 inc $79,x
$0d:f7e1  b4 b4		 ldy $b4,x
$0d:f7e3  0f 20 7e a2   ora $a27e20
$0d:f7e7  e0 dd		 cpx #$dd
$0d:f7e9  e9 99		 sbc #$99
$0d:f7eb  01 df		 ora ($df,x)
$0d:f7ed  5e d9 c9	  lsr $c9d9,x
$0d:f7f0  94 3e		 sty $3e,x
$0d:f7f2  c4 f9		 cpy $f9
$0d:f7f4  49 8d		 eor #$8d
$0d:f7f6  24 f6		 bit $f6
$0d:f7f8  a7 e7		 lda [$e7]
$0d:f7fa  63 91		 adc $91,s
$0d:f7fc  8d cb 85	  sta $85cb
$0d:f7ff  ba			tsx
$0d:f800  6c 8a b4	  jmp ($b48a)
$0d:f803  8d 0b ba	  sta $ba0b
$0d:f806  99 4c e6	  sta $e64c,y
$0d:f809  7b			tdc
$0d:f80a  26 b1		 rol $b1
$0d:f80c  4c 34 a7	  jmp $a734
$0d:f80f  a3 5d		 lda $5d,s
$0d:f811  04 c5		 tsb $c5
$0d:f813  96 86		 stx $86,y
$0d:f815  85 65		 sta $65
$0d:f817  06 d2		 asl $d2
$0d:f819  69 bb		 adc #$bb
$0d:f81b  6d 26 eb	  adc $eb26
$0d:f81e  70 4d		 bvs $f86d
$0d:f820  0a			asl a
$0d:f821  4b			phk
$0d:f822  69 4e		 adc #$4e
$0d:f824  ae 63 47	  ldx $4763
$0d:f827  41 21		 eor ($21,x)
$0d:f829  00 d4		 brk #$d4
$0d:f82b  4d 61 6b	  eor $6b61
$0d:f82e  0e c2 72	  asl $72c2
$0d:f831  e6 0d		 inc $0d
$0d:f833  8b			phb
$0d:f834  90 27		 bcc $f85d
$0d:f836  68			pla
$0d:f837  d0 36		 bne $f86f
$0d:f839  05 12		 ora $12
$0d:f83b  95 01		 sta $01,x
$0d:f83d  79 85 22	  adc $2285,y
$0d:f840  8a			txa
$0d:f841  5c 17 78 ce   jml $ce7817
$0d:f845  9e 05 af	  stz $af05,x
$0d:f848  79 84 24	  adc $2484,y
$0d:f84b  d6 4f		 dec $4f,x
$0d:f84d  a2 a0		 ldx #$a0
$0d:f84f  d0 b4		 bne $f805
$0d:f851  af 31 02 8b   lda $8b0231
$0d:f855  e0 cd		 cpx #$cd
$0d:f857  81 49		 sta ($49,x)
$0d:f859  a1 6b		 lda ($6b,x)
$0d:f85b  9e 63 02	  stz $0263,x
$0d:f85e  9c 2f 04	  stz $042f
$0d:f861  10 60		 bpl $f8c3
$0d:f863  f0 11		 beq $f876
$0d:f865  8c 20 4c	  sty $4c20
$0d:f868  e1 e1		 sbc ($e1,x)
$0d:f86a  12 0c		 ora ($0c)
$0d:f86c  e4 6c		 cpx $6c
$0d:f86e  e2 e2		 sep #$e2
$0d:f870  0b			phd
$0d:f871  38			sec
$0d:f872  ed 40 cc	  sbc $cc40
$0d:f875  64 2a		 stz $2a
$0d:f877  79 3f 29	  adc $293f,y
$0d:f87a  57 e2		 eor [$e2],y
$0d:f87c  fc d1 29	  jsr ($29d1,x)
$0d:f87f  d4 aa		 pei ($aa)
$0d:f881  ad fc 5e	  lda $5efc
$0d:f884  54 8a 75	  mvn $75,$8a
$0d:f887  3e 9c f7	  rol $f79c,x
$0d:f88a  1a			inc a
$0d:f88b  15 7a		 ora $7a,x
$0d:f88d  fd 54 a8	  sbc $a854,x
$0d:f890  07 c2		 ora [$c2]
$0d:f892  20 12 45	  jsr $4512
$0d:f895  e8			inx
$0d:f896  50 aa		 bvc $f842
$0d:f898  b7 4a		 lda [$4a],y
$0d:f89a  a5 62		 lda $62
$0d:f89c  83 4c		 sta $4c,s
$0d:f89e  9d 42 16	  sta $1642,x
$0d:f8a1  43 0a		 eor $0a,s
$0d:f8a3  39 8d 0a	  and $0a8d,y
$0d:f8a6  ba			tsx
$0d:f8a7  9d 0a 89	  sta $890a,x
$0d:f8aa  ac 29 8e	  ldy $8e29
$0d:f8ad  61 73		 adc ($73,x)
$0d:f8af  80 d8		 bra $f889
$0d:f8b1  57 43		 eor [$43],y
$0d:f8b3  58			cli
$0d:f8b4  ac 99 20	  ldy $2099
$0d:f8b7  de 15 da	  dec $da15,x
$0d:f8ba  9a			txs
$0d:f8bb  74 4c		 stz $4c,x
$0d:f8bd  8f 4c a5 36   sta $36a54c
$0d:f8c1  c6 b1		 dec $b1
$0d:f8c3  65 bb		 adc $bb
$0d:f8c5  3b			tsc
$0d:f8c6  06 b2		 asl $b2
$0d:f8c8  f1 2a		 sbc ($2a),y
$0d:f8ca  93 30		 sta ($30,s),y
$0d:f8cc  59 a1 b1	  eor $b1a1,y
$0d:f8cf  6d 83 70	  adc $7083
$0d:f8d2  6a			ror a
$0d:f8d3  20 22 02	  jsr $0222
$0d:f8d6  08			php
$0d:f8d7  04 28		 tsb $28
$0d:f8d9  55 20		 eor $20,x
$0d:f8db  08			php
$0d:f8dc  bc d1 9a	  ldy $9ad1,x
$0d:f8df  15 a5		 ora $a5,x
$0d:f8e1  e8			inx
$0d:f8e2  50 97		 bvc $f87b
$0d:f8e4  a0 1c		 ldy #$1c
$0d:f8e6  10 60		 bpl $f948
$0d:f8e8  dd ec f3	  cmp $f3ec,x
$0d:f8eb  06 59		 asl $59
$0d:f8ed  50 99		 bvc $f888
$0d:f8ef  a0 cc		 ldy #$cc
$0d:f8f1  10 e0		 bpl $f8d3
$0d:f8f3  8a			txa
$0d:f8f4  41 56		 eor ($56,x)
$0d:f8f6  00 c2		 brk #$c2
$0d:f8f8  00 08		 brk #$08
$0d:f8fa  44 ef c0	  mvp $c0,$ef
$0d:f8fd  41 0e		 eor ($0e,x)
$0d:f8ff  11 00		 ora ($00),y
$0d:f901  c8			iny
$0d:f902  48			pha
$0d:f903  f1 27		 sbc ($27),y
$0d:f905  50 98		 bvc $f89f
$0d:f907  6c 10 61	  jmp ($6110)
$0d:f90a  c1 38		 cmp ($38,x)
$0d:f90c  b3 ec		 lda ($ec,s),y
$0d:f90e  8f a8 f9 4a   sta $4af9a8
$0d:f912  88			dey
$0d:f913  40			rti
$0d:f914  1e 44 4b	  asl $4b44,x
$0d:f917  0a			asl a
$0d:f918  90 28		 bcc $f942
$0d:f91a  ea			nop
$0d:f91b  89 41		 bit #$41
$0d:f91d  20 95 6a	  jsr $6a95
$0d:f920  a1 51		 lda ($51,x)
$0d:f922  ac 56 54	  ldy $5456
$0d:f925  c3 53		 cmp $53,s
$0d:f927  57 2d		 eor [$2d],y
$0d:f929  51 52		 eor ($52),y
$0d:f92b  0b			phd
$0d:f92c  43 a9		 eor $a9,s
$0d:f92e  2b			pld
$0d:f92f  81 56		 sta ($56,x)
$0d:f931  aa			tax
$0d:f932  b3 55		 lda ($55,s),y
$0d:f934  92 d8		 sta ($d8)
$0d:f936  d6 91		 dec $91,x
$0d:f938  53 bb		 eor ($bb,s),y
$0d:f93a  d9 ac d7	  cmp $d7ac,y
$0d:f93d  66 23		 ror $23
$0d:f93f  5d ec eb	  eor $ebec,x
$0d:f942  52 5b		 eor ($5b)
$0d:f944  95 7e		 sta $7e,x
$0d:f946  7f 09 a0 50   adc $50a009,x
$0d:f94a  69 2f		 adc #$2f
$0d:f94c  b0 57		 bcs $f9a5
$0d:f94e  35 d6		 and $d6,x
$0d:f950  af 47 a4 53   lda $53a447
$0d:f954  a9 f4		 lda #$f4
$0d:f956  ea			nop
$0d:f957  2a			rol a
$0d:f958  b8			clv
$0d:f959  d5 65		 cmp $65,x
$0d:f95b  75 ab		 adc $ab,x
$0d:f95d  55 e8		 eor $e8,x
$0d:f95f  d0 18		 bne $f979
$0d:f961  0d 21 80	  ora $8021
$0d:f964  4a			lsr a
$0d:f965  72 10		 adc ($10)
$0d:f967  95 5e		 sta $5e,x
$0d:f969  7f 01 84 bb   adc $bb8401,x
$0d:f96d  d2 a4		 cmp ($a4)
$0d:f96f  f0 30		 beq $f9a1
$0d:f971  38			sec
$0d:f972  c2 54		 rep #$54
$0d:f974  c3 30		 cmp $30,s
$0d:f976  98			tya
$0d:f977  59 5c 82	  eor $825c,y
$0d:f97a  ab			plb
$0d:f97b  2a			rol a
$0d:f97c  fc fa 12	  jsr ($12fa,x)
$0d:f97f  b6 1a		 ldx $1a,y
$0d:f981  ad 5c 86	  lda $865c
$0d:f984  1f d5 a9 81   ora $81a9d5,x
$0d:f988  c0 5c 0a	  cpy #$0a5c
$0d:f98b  b2 29		 lda ($29)
$0d:f98d  85 75		 sta $75
$0d:f98f  8a			txa
$0d:f990  95 f1		 sta $f1,x
$0d:f992  f0 54		 beq $f9e8
$0d:f994  95 20		 sta $20,x
$0d:f996  ed 03 29	  sbc $2903
$0d:f999  ad 84 da	  lda $da84
$0d:f99c  04 01		 tsb $01
$0d:f99e  b2 d9		 lda ($d9)
$0d:f9a0  f6 55		 inc $55,x
$0d:f9a2  5b			tcd
$0d:f9a3  a0 80 dd	  ldy #$dd80
$0d:f9a6  a1 38		 lda ($38,x)
$0d:f9a8  54 84 c3	  mvn $c3,$84
$0d:f9ab  64 a7		 stz $a7
$0d:f9ad  0b			phd
$0d:f9ae  a3 bd		 lda $bd,s
$0d:f9b0  2b			pld
$0d:f9b1  f0 1a		 beq $f9cd
$0d:f9b3  00 18		 brk #$18
$0d:f9b5  65 2b		 adc $2b
$0d:f9b7  c3 01		 cmp $01,s
$0d:f9b9  a0 78 03	  ldy #$0378
$0d:f9bc  e4 87		 cpx $87
$0d:f9be  30 fa		 bmi $f9ba
$0d:f9c0  08			php
$0d:f9c1  8d e0 62	  sta $62e0
$0d:f9c4  32 1b		 and ($1b)
$0d:f9c6  83 c8		 sta $c8,s
$0d:f9c8  ce e4 70	  dec $70e4
$0d:f9cb  3d 84 e4	  and $e484,x
$0d:f9ce  84 06		 sty $06
$0d:f9d0  62 7f a1	  per $9b52
$0d:f9d3  b4 28		 ldy $28,x
$0d:f9d5  14 1a		 trb $1a
$0d:f9d7  0d 32 76	  ora $7632
$0d:f9da  f1 09		 sbc ($09),y
$0d:f9dc  cc e7 63	  cpy $63e7
$0d:f9df  28			plp
$0d:f9e0  7b			tdc
$0d:f9e1  8b			phb
$0d:f9e2  74 1e		 stz $1e,x
$0d:f9e4  81 49		 sta ($49,x)
$0d:f9e6  a0 bf c1	  ldy #$c1bf
$0d:f9e9  e0 8f 40	  cpx #$408f
$0d:f9ec  78			sei
$0d:f9ed  8c ee 8a	  sty $8aee
$0d:f9f0  ff 20 0a 03   sbc $030a20,x
$0d:f9f4  8d da 01	  sta $01da
$0d:f9f7  04 10		 tsb $10
$0d:f9f9  b5 00		 lda $00,x
$0d:f9fb  43 81		 eor $81,s
$0d:f9fd  ef 17 f9 03   sbc $03f917
$0d:fa01  cc 19 4d	  cpy $4d19
$0d:fa04  30 69		 bmi $fa6f
$0d:fa06  83 4f		 sta $4f,s
$0d:fa08  de 4f f5	  dec $f54f,x
$0d:fa0b  06 83		 asl $83
$0d:fa0d  d5 42		 cmp $42,x
$0d:fa0f  eb			xba
$0d:fa10  0d a0 ce	  ora $cea0
$0d:fa13  76 32		 ror $32,x
$0d:fa15  87 88		 sta [$88]
$0d:fa17  6c 01 eb	  jmp ($eb01)
$0d:fa1a  42 d9		 wdm #$d9
$0d:fa1c  cc 02 e1	  cpy $e102
$0d:fa1f  39 00 84	  and $8400,y
$0d:fa22  ed 30 b4	  sbc $b430
$0d:fa25  4d 8c c2	  eor $c28c
$0d:fa28  83 4c		 sta $4c,s
$0d:fa2a  7f 84 ec fe   adc $feec84,x
$0d:fa2e  f4 29 82	  pea $8229
$0d:fa31  87 03		 sta [$03]
$0d:fa33  a0 a0 c7	  ldy #$c7a0
$0d:fa36  e0 28 72	  cpx #$7228
$0d:fa39  99 b1 50	  sta $50b1,y
$0d:fa3c  6d 31 61	  adc $6131
$0d:fa3f  b4 44		 ldy $44,x
$0d:fa41  7f 37 f8 df   adc $dff837,x
$0d:fa45  e8			inx
$0d:fa46  0f 48 fa 8b   ora $8bfa48
$0d:fa4a  d6 7e		 dec $7e,x
$0d:fa4c  20 99 83	  jsr $8399
$0d:fa4f  bc f6 93	  ldy $93f6,x
$0d:fa52  37 78		 and [$78],y
$0d:fa54  6e a6 4e	  ror $4ea6
$0d:fa57  f4 00 78	  pea $7800
$0d:fa5a  32 76		 and ($76)
$0d:fa5c  52 80		 eor ($80)
$0d:fa5e  8e 6c 27	  stx $276c
$0d:fa61  21 76		 and ($76,x)
$0d:fa63  1b			tcs
$0d:fa64  10 b4		 bpl $fa1a
$0d:fa66  27 74		 and [$74]
$0d:fa68  dd 98 64	  cmp $6498,x
$0d:fa6b  c7 60		 cmp [$60]
$0d:fa6d  46 29		 lsr $29
$0d:fa6f  dd 15 b4	  cmp $b415,x
$0d:fa72  1b			tcs
$0d:fa73  11 b9		 ora ($b9),y
$0d:fa75  93 05		 sta ($05,s),y
$0d:fa77  b0 b3		 bcs $fa2c
$0d:fa79  b2 31		 lda ($31)
$0d:fa7b  15 61		 ora $61,x
$0d:fa7d  9d f4 9a	  sta $9af4,x
$0d:fa80  25 3a		 and $3a
$0d:fa82  9e 81 12	  stz $1281,x
$0d:fa85  a9 d3		 lda #$d3
$0d:fa87  10 43		 bpl $facc
$0d:fa89  44 a5 4f	  mvp $4f,$a5
$0d:fa8c  a7 d6		 lda [$d6]
$0d:fa8e  e9 f4		 sbc #$f4
$0d:fa90  06 90		 asl $90
$0d:fa92  4c 1a 65	  jmp $651a
$0d:fa95  2a			rol a
$0d:fa96  02 92		 cop #$92
$0d:fa98  0a			asl a
$0d:fa99  14 42		 trb $42
$0d:fa9b  02 a1		 cop #$a1
$0d:fa9d  28			plp
$0d:fa9e  4d 01 ba	  eor $ba01
$0d:faa1  09 f3		 ora #$f3
$0d:faa3  a2 4e a8	  ldx #$a84e
$0d:faa6  ca			dex
$0d:faa7  10 af		 bpl $fa58
$0d:faa9  40			rti
$0d:faaa  6d d4 8a	  adc $8ad4
$0d:faad  6a			ror a
$0d:faae  28			plp
$0d:faaf  27 4a		 and [$4a]
$0d:fab1  11 54		 ora ($54),y
$0d:fab3  82 84 d4	  brl $cf3a
$0d:fab6  a2 da 04	  ldx #$04da
$0d:fab9  f9 32 81	  sbc $8132,y
$0d:fabc  64 4b		 stz $4b
$0d:fabe  21 4b		 and ($4b,x)
$0d:fac0  0a			asl a
$0d:fac1  bc 17 b0	  ldy $b017,x
$0d:fac4  b5 12		 lda $12,x
$0d:fac6  60			rts
$0d:fac7  30 04		 bmi $facd
$0d:fac9  18			clc
$0d:faca  12 95		 ora ($95)
$0d:facc  38			sec
$0d:facd  50 88		 bvc $fa57
$0d:facf  4e 2e 17	  lsr $172e
$0d:fad2  88			dey
$0d:fad3  2a			rol a
$0d:fad4  40			rti
$0d:fad5  86 33		 stx $33
$0d:fad7  b0 42		 bcs $fb1b
$0d:fad9  0e 45 70	  asl $7045
$0d:fadc  14 22		 trb $22
$0d:fade  20 50 cf	  jsr $cf50
$0d:fae1  0a			asl a
$0d:fae2  46 05		 lsr $05
$0d:fae4  c0 2a 40	  cpy #$402a
$0d:fae7  02 26		 cop #$26
$0d:fae9  8a			txa
$0d:faea  a1 4f		 lda ($4f,x)
$0d:faec  a9 08		 lda #$08
$0d:faee  22 41 11 e0   jsl $e01141
$0d:faf2  c6 80		 dec $80
$0d:faf4  a1 04		 lda ($04,x)
$0d:faf6  90 a4		 bcc $fa9c
$0d:faf8  86 dc		 stx $dc
$0d:fafa  a8			tay
$0d:fafb  04 00		 tsb $00
$0d:fafd  a6 c0		 ldx $c0
$0d:faff  aa			tax
$0d:fb00  e7 f0		 sbc [$f0]
$0d:fb02  48			pha
$0d:fb03  02 4c		 cop #$4c
$0d:fb05  54 25 47	  mvn $47,$25
$0d:fb08  50 93		 bvc $fa9d
$0d:fb0a  3c 98 29	  bit $2998,x
$0d:fb0d  46 98		 lsr $98
$0d:fb0f  51 cf		 eor ($cf),y
$0d:fb11  61 46		 adc ($46,x)
$0d:fb13  a7 15		 lda [$15]
$0d:fb15  1a			inc a
$0d:fb16  7c ff 09	  jmp ($09ff,x)
$0d:fb19  84 fe		 sty $fe
$0d:fb1b  60			rts
$0d:fb1c  4a			lsr a
$0d:fb1d  02 ab		 cop #$ab
$0d:fb1f  4c 34 af	  jmp $af34
$0d:fb22  f0 44		 beq $fb68
$0d:fb24  09 55		 ora #$55
$0d:fb26  ad c8 91	  lda $91c8
$0d:fb29  44 02 30	  mvp $30,$02
$0d:fb2c  0e c5 6a	  asl $6ac5
$0d:fb2f  b1 38		 lda ($38),y
$0d:fb31  85 18		 sta $18
$0d:fb33  28			plp
$0d:fb34  72 3b		 adc ($3b)
$0d:fb36  8d 82 c3	  sta $c382
$0d:fb39  6b			rtl
$0d:fb3a  2a			rol a
$0d:fb3b  b2 20		 lda ($20)
$0d:fb3d  1c c3 68	  trb $68c3
$0d:fb40  b4 d9		 ldy $d9,x
$0d:fb42  0a			asl a
$0d:fb43  ac ad 3b	  ldy $3bad
$0d:fb46  71 56		 adc ($56),y
$0d:fb48  20 3f d0	  jsr $d03f
$0d:fb4b  f8			sed
$0d:fb4c  3b			tsc
$0d:fb4d  c8			iny
$0d:fb4e  10 a2		 bpl $faf2
$0d:fb50  11 7b		 ora ($7b),y
$0d:fb52  3d 06 98	  and $9806,x
$0d:fb55  04 31		 tsb $31
$0d:fb57  42 84		 wdm #$84
$0d:fb59  1c 21 b4	  trb $b421
$0d:fb5c  1a			inc a
$0d:fb5d  28			plp
$0d:fb5e  43 69		 eor $69,s
$0d:fb60  14 f2		 trb $f2
$0d:fb62  90 10		 bcc $fb74
$0d:fb64  54 5e 6a	  mvn $6a,$5e
$0d:fb67  51 9f		 eor ($9f),y
$0d:fb69  14 41		 trb $41
$0d:fb6b  c0 63 f0	  cpy #$f063
$0d:fb6e  02 8a		 cop #$8a
$0d:fb70  84 34		 sty $34
$0d:fb72  aa			tax
$0d:fb73  12 d7		 ora ($d7)
$0d:fb75  28			plp
$0d:fb76  ce 90 05	  dec $0590
$0d:fb79  05 09		 ora $09
$0d:fb7b  69 94		 adc #$94
$0d:fb7d  24 61		 bit $61
$0d:fb7f  28			plp
$0d:fb80  4d 00 bc	  eor $bc00
$0d:fb83  2a			rol a
$0d:fb84  13 30		 ora ($30,s),y
$0d:fb86  96 9c		 stx $9c,y
$0d:fb88  f6 34		 inc $34,x
$0d:fb8a  19 85 1e	  ora $1e85,y
$0d:fb8d  de e3 93	  dec $93e3,x
$0d:fb90  60			rts
$0d:fb91  2e 44 c0	  rol $c044
$0d:fb94  8d 73 3e	  sta $3e73
$0d:fb97  04 c1		 tsb $c1
$0d:fb99  bc 4d 71	  ldy $714d,x
$0d:fb9c  d7 97		 cmp [$97],y
$0d:fb9e  cd 5a 4a	  cmp $4a5a
$0d:fba1  01 6b		 ora ($6b,x)
$0d:fba3  96 b5		 stx $b5,y
$0d:fba5  52 93		 eor ($93)
$0d:fba7  e5 7a		 sbc $7a
$0d:fba9  a8			tay
$0d:fbaa  d0 f8		 bne $fba4
$0d:fbac  10 19		 bpl $fbc7
$0d:fbae  fa			plx
$0d:fbaf  46 91		 lsr $91
$0d:fbb1  82 10 7a	  brl $75c4
$0d:fbb4  15 56		 ora $56,x
$0d:fbb6  e9 53		 sbc #$53
$0d:fbb8  7e 00 42	  ror $4200,x
$0d:fbbb  28			plp
$0d:fbbc  55 da		 eor $da,x
$0d:fbbe  d5 42		 cmp $42,x
$0d:fbc0  a3 53		 lda $53,s
$0d:fbc2  77 cd		 adc [$cd],y
$0d:fbc4  76 a9		 ror $a9,x
$0d:fbc6  58			cli
$0d:fbc7  ac bf a8	  ldy $a8bf
$0d:fbca  18			clc
$0d:fbcb  00 cc		 brk #$cc
$0d:fbcd  0e 00 70	  asl $7000
$0d:fbd0  2a			rol a
$0d:fbd1  4f f8 a6 4e   eor $4ea6f8
$0d:fbd5  aa			tax
$0d:fbd6  a2 a1 07	  ldx #$07a1
$0d:fbd9  c0 20 47	  cpy #$4720
$0d:fbdc  42 ff		 wdm #$ff
$0d:fbde  80 c1		 bra $fba1
$0d:fbe0  54 81 d2	  mvn $d2,$81
$0d:fbe3  08			php
$0d:fbe4  0b			phd
$0d:fbe5  2d 9a cd	  and $cd9a
$0d:fbe8  76 2f		 ror $2f,x
$0d:fbea  d2 bc		 cmp ($bc)
$0d:fbec  3f b5 d2 7d   and $7dd2b5,x
$0d:fbf0  2f c1 f4 1f   and $1ff4c1
$0d:fbf4  98			tya
$0d:fbf5  02 80		 cop #$80
$0d:fbf7  5e 6d 56	  lsr $566d,x
$0d:fbfa  ba			tsx
$0d:fbfb  56 a9		 lsr $a9,x
$0d:fbfd  d4 f5		 pei ($f5)
$0d:fbff  78			sei
$0d:fc00  52 80		 eor ($80)
$0d:fc02  6c fc 0a	  jmp ($0afc)
$0d:fc05  a3 98		 lda $98,s
$0d:fc07  c2 6b		 rep #$6b
$0d:fc09  65 bb		 adc $bb
$0d:fc0b  3f 02 10 cf   and $cf1002,x
$0d:fc0f  18			clc
$0d:fc10  81 0d		 sta ($0d,x)
$0d:fc12  8f 63 39 6f   sta $6f3963
$0d:fc16  8c e8 84	  sty $84e8
$0d:fc19  cd f1 a9	  cmp $a9f1
$0d:fc1c  dd ec f3	  cmp $f3ec,x
$0d:fc1f  0b			phd
$0d:fc20  f0 30		 beq $fc52
$0d:fc22  57 82		 eor [$82],y
$0d:fc24  1c 07 80	  trb $8007
$0d:fc27  bc 06 61	  ldy $6106,x
$0d:fc2a  87 0e		 sta [$0e]
$0d:fc2c  0a			asl a
$0d:fc2d  f0 45		 beq $fc74
$0d:fc2f  81 5f		 sta ($5f,x)
$0d:fc31  fe cc 2b	  inc $2bcc,x
$0d:fc34  e9 b2 7b	  sbc #$7bb2
$0d:fc37  0d 6a a4	  ora $a46a
$0d:fc3a  f9 1a 95	  sbc $951a,y
$0d:fc3d  5a			phy
$0d:fc3e  ac 0f 00	  ldy $000f
$0d:fc41  91 82		 sta ($82),y
$0d:fc43  08			php
$0d:fc44  50 55		 bvc $fc9b
$0d:fc46  3b			tsc
$0d:fc47  ad 5a fe	  lda $fe5a
$0d:fc4a  2a			rol a
$0d:fc4b  37 c8		 and [$c8],y
$0d:fc4d  8e 08 14	  stx $1408
$0d:fc50  01 82		 ora ($82,x)
$0d:fc52  02 1d		 cop #$1d
$0d:fc54  5e 60 cb	  lsr $cb60,x
$0d:fc57  11 e1		 ora ($e1),y
$0d:fc59  08			php
$0d:fc5a  c8			iny
$0d:fc5b  2c 00 a0	  bit $a000
$0d:fc5e  24 85		 bit $85
$0d:fc60  74 ae		 stz $ae,x
$0d:fc62  0f 91 2a 20   ora $202a91
$0d:fc66  f0 ab		 beq $fc13
$0d:fc68  af 90 29 1b   lda $1b2990
$0d:fc6c  e0 83 04	  cpx #$0483
$0d:fc6f  cb			wai
$0d:fc70  0a			asl a
$0d:fc71  d1 58		 cmp ($58),y
$0d:fc73  80 e6		 bra $fc5b
$0d:fc75  dd 00 00	  cmp $0000,x
$0d:fc78  d9 6a 87	  cmp $876a,y
$0d:fc7b  43 7c		 eor $7c,s
$0d:fc7d  12 2c		 ora ($2c)
$0d:fc7f  11 61		 ora ($61),y
$0d:fc81  55 18		 eor $18,x
$0d:fc83  80 a1		 bra $fc26
$0d:fc85  6a			ror a
$0d:fc86  60			rts
$0d:fc87  f1 4d		 sbc ($4d),y
$0d:fc89  85 d1		 sta $d1
$0d:fc8b  f2 03		 sbc ($03)
$0d:fc8d  84 66		 sty $66
$0d:fc8f  80 bc		 bra $fc4d
$0d:fc91  03 a1		 ora $a1,s
$0d:fc93  74 bb		 stz $bb,x
$0d:fc95  d4 ac		 pei ($ac)
$0d:fc97  c6 f4		 dec $f4
$0d:fc99  37 a3		 and [$a3],y
$0d:fc9b  c0 27 13	  cpy #$1327
$0d:fc9e  94 40		 sty $40,x
$0d:fca0  33 e1		 and ($e1,s),y
$0d:fca2  98			tya
$0d:fca3  14 da		 trb $da
$0d:fca5  0c e5 bf	  tsb $bfe5
$0d:fca8  4d d0 a4	  eor $a4d0
$0d:fcab  d7 80		 cmp [$80],y
$0d:fcad  40			rti
$0d:fcae  93 02		 sta ($02,s),y
$0d:fcb0  92 54		 sta ($54)
$0d:fcb2  ab			plb
$0d:fcb3  f0 1a		 beq $fccf
$0d:fcb5  45 3a		 eor $3a
$0d:fcb7  61 7e		 adc ($7e,x)
$0d:fcb9  28			plp
$0d:fcba  0a			asl a
$0d:fcbb  00 8a		 brk #$8a
$0d:fcbd  e2 fb		 sep #$fb
$0d:fcbf  00 60		 brk #$60
$0d:fcc1  0c 00 88	  tsb $8800
$0d:fcc4  27 55		 and [$55]
$0d:fcc6  b3 c0		 lda ($c0,s),y
$0d:fcc8  a1 11		 lda ($11,x)
$0d:fcca  04 01		 tsb $01
$0d:fccc  a1 09		 lda ($09,x)
$0d:fcce  4a			lsr a
$0d:fccf  30 26		 bmi $fcf7
$0d:fcd1  68			pla
$0d:fcd2  4e 8c e2	  lsr $e28c
$0d:fcd5  72 43		 adc ($43)
$0d:fcd7  21 50		 and ($50,x)
$0d:fcd9  29 34		 and #$34
$0d:fcdb  21 89		 and ($89,x)
$0d:fcdd  20 cc cc	  jsr $cccc
$0d:fce0  54 0a 0d	  mvn $0d,$0a
$0d:fce3  30 42		 bmi $fd27
$0d:fce5  46 53		 lsr $53
$0d:fce7  3d 00 e8	  and $e800,x
$0d:fcea  a8			tay
$0d:fceb  23 73		 and $73,s
$0d:fced  2c 15 4e	  bit $4e15
$0d:fcf0  a4 4a		 ldy $4a
$0d:fcf2  2a			rol a
$0d:fcf3  49 50		 eor #$50
$0d:fcf5  02 8a		 cop #$8a
$0d:fcf7  08			php
$0d:fcf8  21 e0		 and ($e0,x)
$0d:fcfa  51 15		 eor ($15),y
$0d:fcfc  e0 25		 cpx #$25
$0d:fcfe  31 99		 and ($99),y
$0d:fd00  9e c2 83	  stz $83c2,x
$0d:fd03  42 03		 wdm #$03
$0d:fd05  00 d4		 brk #$d4
$0d:fd07  98			tya
$0d:fd08  c4 bd		 cpy $bd
$0d:fd0a  0b			phd
$0d:fd0b  38			sec
$0d:fd0c  f0 ee		 beq $fcfc
$0d:fd0e  ed 80 bb	  sbc $bb80
$0d:fd11  32 45		 and ($45)
$0d:fd13  b4 12		 ldy $12,x
$0d:fd15  86 e0		 stx $e0
$0d:fd17  d0 9b		 bne $fcb4
$0d:fd19  03 3e		 ora $3e,s
$0d:fd1b  98			tya
$0d:fd1c  59 5b 24	  eor $245b,y
$0d:fd1f  ea			nop
$0d:fd20  3a			dec a
$0d:fd21  20 b4 26	  jsr $26b4
$0d:fd24  13 f9		 ora ($f9,s),y
$0d:fd26  f4 21 70	  pea $7021
$0d:fd29  8c 92 3e	  sty $3e92
$0d:fd2c  83 00		 sta $00,s
$0d:fd2e  05 80		 ora $80
$0d:fd30  c8			iny
$0d:fd31  56 48		 lsr $48,x
$0d:fd33  9b			txy
$0d:fd34  42 97		 wdm #$97
$0d:fd36  f2 a2		 sbc ($a2)
$0d:fd38  b5 d9		 lda $d9,x
$0d:fd3a  94 2e		 sty $2e,x
$0d:fd3c  3a			dec a
$0d:fd3d  64 95		 stz $95
$0d:fd3f  22 8b 4c a7   jsl $a74c8b
$0d:fd43  d3 80		 cmp ($80,s),y
$0d:fd45  44 e3 58	  mvp $58,$e3
$0d:fd48  0d 22 95	  ora $9522
$0d:fd4b  62 9f cc	  per $c9ed
$0d:fd4e  27 d0		 and [$d0]
$0d:fd50  1b			tcs
$0d:fd51  23 fc		 and $fc,s
$0d:fd53  19 43 44	  ora $4443,y
$0d:fd56  a7 40		 lda [$40]
$0d:fd58  43 ee		 eor $ee,s
$0d:fd5a  18			clc
$0d:fd5b  2a			rol a
$0d:fd5c  50 54		 bvc $fdb2
$0d:fd5e  03 e1		 ora $e1,s
$0d:fd60  46 98		 lsr $98
$0d:fd62  51 c6		 eor ($c6),y
$0d:fd64  81 46		 sta ($46,x)
$0d:fd66  13 8d		 ora ($8d,s),y
$0d:fd68  3e 95 47	  rol $4795,x
$0d:fd6b  9f 4e a0 33   sta $33a04e,x
$0d:fd6f  e5 90		 sbc $90
$0d:fd71  30 40		 bmi $fdb3
$0d:fd73  28			plp
$0d:fd74  21 f2		 and ($f2,x)
$0d:fd76  a3 d5		 lda $d5,s
$0d:fd78  68			pla
$0d:fd79  50 19		 bvc $fd94
$0d:fd7b  85 88		 sta $88
$0d:fd7d  a0 04		 ldy #$04
$0d:fd7f  21 19		 and ($19,x)
$0d:fd81  85 bc		 sta $bc
$0d:fd83  3e 38 7a	  rol $7a38,x
$0d:fd86  15 b8		 ora $b8,x
$0d:fd88  3e 05 41	  rol $4105,x
$0d:fd8b  09 81		 ora #$81
$0d:fd8d  18			clc
$0d:fd8e  ea			nop
$0d:fd8f  b7 fa		 lda [$fa],y
$0d:fd91  50 7c		 bvc $fe0f
$0d:fd93  42 a0		 wdm #$a0
$0d:fd95  55 29		 eor $29,x
$0d:fd97  81 84		 sta ($84,x)
$0d:fd99  6b			rtl
$0d:fd9a  b5 30		 lda $30,x
$0d:fd9c  fa			plx
$0d:fd9d  95 48		 sta $48,x
$0d:fd9f  e6 36		 inc $36
$0d:fda1  5b			tcd
$0d:fda2  b0 7d		 bcs $fe21
$0d:fda4  2c 16 12	  bit $1216
$0d:fda7  a0 d7		 ldy #$d7
$0d:fda9  8a			txa
$0d:fdaa  63 65		 adc $65,s
$0d:fdac  0f a5 a2 d2   ora $d2a2a5
$0d:fdb0  1f 09 fd bd   ora $bdfd09,x
$0d:fdb4  34 01		 bit $01,x
$0d:fdb6  f0 1f		 beq $fdd7
$0d:fdb8  80 7c		 bra $fe36
$0d:fdba  4a			lsr a
$0d:fdbb  41 62		 eor ($62,x)
$0d:fdbd  4a			lsr a
$0d:fdbe  84 04		 sty $04
$0d:fdc0  98			tya
$0d:fdc1  0b			phd
$0d:fdc2  90 80		 bcc $fd44
$0d:fdc4  d0 a2		 bne $fd68
$0d:fdc6  10 1b		 bpl $fde3
$0d:fdc8  75 bb		 adc $bb,x
$0d:fdca  74 15		 stz $15,x
$0d:fdcc  05 28		 ora $28
$0d:fdce  42 19		 wdm #$19
$0d:fdd0  27 4c		 and [$4c]
$0d:fdd2  9d 32 52	  sta $5232,x
$0d:fdd5  11 38		 ora ($38),y
$0d:fdd7  9c b6 4e	  stz $4eb6
$0d:fdda  83 4c		 sta $4c,s
$0d:fddc  6c a4 e4	  jmp ($e4a4)
$0d:fddf  10 ae		 bpl $fd8f
$0d:fde1  a3 78		 lda $78,s
$0d:fde3  4b			phk
$0d:fde4  c3 68		 cmp $68,s
$0d:fde6  34 fa		 bit $fa,x
$0d:fde8  6b			rtl
$0d:fde9  ec 28 94	  cpx $9428
$0d:fdec  e7 42		 sbc [$42]
$0d:fdee  bf 06 61 48   lda $486106,x
$0d:fdf2  a7 0e		 lda [$0e]
$0d:fdf4  c0 72		 cpy #$72
$0d:fdf6  01 57		 ora ($57,x)
$0d:fdf8  20 82 f0	  jsr $f082
$0d:fdfb  60			rts
$0d:fdfc  3a			dec a
$0d:fdfd  5a			phy
$0d:fdfe  03 bd		 ora $bd,s
$0d:fe00  aa			tax
$0d:fe01  d5 75		 cmp $75,x
$0d:fe03  d8			cld
$0d:fe04  2e c2 13	  rol $13c2
$0d:fe07  40			rti
$0d:fe08  74 98		 stz $98,x
$0d:fe0a  4c 29 f5	  jmp $f529
$0d:fe0d  2b			pld
$0d:fe0e  ad 7e 02	  lda $027e
$0d:fe11  9a			txs
$0d:fe12  02 28		 cop #$28
$0d:fe14  12 0e		 ora ($0e)
$0d:fe16  94 8a		 sty $8a,x
$0d:fe18  0a			asl a
$0d:fe19  95 4e		 sta $4e,x
$0d:fe1b  ea			nop
$0d:fe1c  40			rti
$0d:fe1d  12 2a		 ora ($2a)
$0d:fe1f  50 97		 bvc $fdb8
$0d:fe21  63 54		 adc $54,s
$0d:fe23  a8			tay
$0d:fe24  54 4c 20	  mvn $20,$4c
$0d:fe27  9f 01 29 d1   sta $d12901,x
$0d:fe2b  15 e3		 ora $e3,x
$0d:fe2d  52 ac		 eor ($ac)
$0d:fe2f  56 6a		 lsr $6a,x
$0d:fe31  65 10		 adc $10
$0d:fe33  3a			dec a
$0d:fe34  2d 09 3e	  and $3e09
$0d:fe37  17 6a		 ora [$6a],y
$0d:fe39  a1 7c		 lda ($7c,x)
$0d:fe3b  2c f3 ea	  bit $eaf3
$0d:fe3e  3e 94 48	  rol $4894,x
$0d:fe41  68			pla
$0d:fe42  c1 b2		 cmp ($b2,x)
$0d:fe44  d9 ac d6	  cmp $d6ac,y
$0d:fe47  72 20		 adc ($20)
$0d:fe49  7e ed fa	  ror $faed,x
$0d:fe4c  72 a9		 adc ($a9)
$0d:fe4e  1a			inc a
$0d:fe4f  c8			iny
$0d:fe50  a4 30		 ldy $30
$0d:fe52  1b			tcs
$0d:fe53  7d be 03	  adc $03be,x
$0d:fe56  af 22 93 3d   lda $3d9322
$0d:fe5a  d8			cld
$0d:fe5b  23 38		 and $38,s
$0d:fe5d  08			php
$0d:fe5e  0b			phd
$0d:fe5f  7d da 02	  adc $02da,x
$0d:fe62  c9 27		 cmp #$27
$0d:fe64  e7 b7		 sbc [$b7]
$0d:fe66  00 b6		 brk #$b6
$0d:fe68  08			php
$0d:fe69  40			rti
$0d:fe6a  aa			tax
$0d:fe6b  9c c5 08	  stz $08c5
$0d:fe6e  42 21		 wdm #$21
$0d:fe70  80 a3		 bra $fe15
$0d:fe72  00 a6		 brk #$a6
$0d:fe74  15 d3		 ora $d3,x
$0d:fe76  91 01		 sta ($01),y
$0d:fe78  95 18		 sta $18,x
$0d:fe7a  35 5b		 and $5b,x
$0d:fe7c  a2 08		 ldx #$08
$0d:fe7e  16 22		 asl $22,x
$0d:fe80  09 7c		 ora #$7c
$0d:fe82  3d 4b fa	  and $fa4b,x
$0d:fe85  83 20		 sta $20,s
$0d:fe87  4b			phk
$0d:fe88  55 6f		 eor $6f,x
$0d:fe8a  f5 22		 sbc $22,x
$0d:fe8c  78			sei
$0d:fe8d  01 5d		 ora ($5d,x)
$0d:fe8f  e0 15		 cpx #$15
$0d:fe91  da			phx
$0d:fe92  99 bd 20	  sta $20bd,y
$0d:fe95  4c 10 88	  jmp $8810
$0d:fe98  3d 4a cb	  and $cb4a,x
$0d:fe9b  76 3f		 ror $3f,x
$0d:fe9d  9c 0a 70	  stz $700a
$0d:fea0  d6 05		 dec $05,x
$0d:fea2  e8			inx
$0d:fea3  93 8d		 sta ($8d,s),y
$0d:fea5  20 4b 83	  jsr $834b
$0d:fea8  6b			rtl
$0d:fea9  01 34		 ora ($34,x)
$0d:feab  d4 06		 pei ($06)
$0d:fead  a9 16		 lda #$16
$0d:feaf  d8			cld
$0d:feb0  81 90		 sta ($90,x)
$0d:feb2  2c 54 86	  bit $8654
$0d:feb5  c1 81		 cmp ($81,x)
$0d:feb7  9d 0e a8	  sta $a80e,x
$0d:feba  f9 34 15	  sbc $1534,y
$0d:febd  25 82		 and $82
$0d:febf  44 c3 54	  mvp $54,$c3
$0d:fec2  13 6c		 ora ($6c,s),y
$0d:fec4  5a			phy
$0d:fec5  04 5c		 tsb $5c
$0d:fec7  15 79		 ora $79,x
$0d:fec9  4e 28 ad	  lsr $ad28
$0d:fecc  f5 a2		 sbc $a2,x
$0d:fece  2f c9 82 0c   and $0c82c9
$0d:fed2  b6 3d		 ldx $3d,y
$0d:fed4  03 6d		 ora $6d,s
$0d:fed6  d1 b6		 cmp ($b6),y
$0d:fed8  f7 cb		 sbc [$cb],y
$0d:feda  64 fd		 stz $fd
$0d:fedc  ef 73 fb 05   sbc $05fb73
$0d:fee0  86 c8		 stx $c8
$0d:fee2  f7 ab		 sbc [$ab],y
$0d:fee4  75 a2		 adc $a2,x
$0d:fee6  d2 f7		 cmp ($f7)
$0d:fee8  bb			tyx
$0d:fee9  13 df		 ora ($df,s),y
$0d:feeb  d4 28		 pei ($28)
$0d:feed  b3 55		 lda ($55,s),y
$0d:feef  0b			phd
$0d:fef0  ce 87 db	  dec $db87
$0d:fef3  42 27		 wdm #$27
$0d:fef5  d5 1a		 cmp $1a,x
$0d:fef7  8f 01 a2 17   sta $17a201
$0d:fefb  e8			inx
$0d:fefc  30 10		 bmi $ff0e
$0d:fefe  1a			inc a
$0d:feff  4d 08 e3	  eor $e308
$0d:ff02  22 81 a0 a4   jsl $a4a081
$0d:ff06  02 7c		 cop #$7c
$0d:ff08  7d 03 b9	  adc $b903,x
$0d:ff0b  40			rti
$0d:ff0c  a1 0a		 lda ($0a,x)
$0d:ff0e  32 47		 and ($47)
$0d:ff10  80 5c		 bra $ff6e
$0d:ff12  6d 8a 62	  adc $628a
$0d:ff15  9c 4e 67	  stz $674e
$0d:ff18  4a			lsr a
$0d:ff19  31 a0		 and ($a0),y
$0d:ff1b  d3 27		 cmp ($27,s),y
$0d:ff1d  5d ee fc	  eor $fcee,x
$0d:ff20  21 88		 and ($88,x)
$0d:ff22  33 89		 and ($89,s),y
$0d:ff24  dd 26 77	  cmp $7726,x
$0d:ff27  3a			dec a
$0d:ff28  62 03 b0	  per $af2e
$0d:ff2b  29 93		 and #$93
$0d:ff2d  96 91		 stx $91,y
$0d:ff2f  ce e9 ab	  dec $abe9
$0d:ff32  f0 9d		 beq $fed1
$0d:ff34  b4 82		 ldy $82,x
$0d:ff36  82 cf 07	  brl $0708
$0d:ff39  05 8f		 ora $8f
$0d:ff3b  b2 13		 lda ($13)
$0d:ff3d  40			rti
$0d:ff3e  1f 5a e0 28   ora $28e05a,x
$0d:ff42  af 0d 77 51   lda $51770d
$0d:ff46  f4 1f a1	  pea $a11f
$0d:ff49  41 41		 eor ($41,x)
$0d:ff4b  58			cli
$0d:ff4c  71 6c		 adc ($6c),y
$0d:ff4e  70 1b		 bvs $ff6b
$0d:ff50  12 65		 ora ($65)
$0d:ff52  05 87		 ora $87
$0d:ff54  46 98		 lsr $98
$0d:ff56  51 ca		 eor ($ca),y
$0d:ff58  60			rts
$0d:ff59  16 89		 asl $89,x
$0d:ff5b  f4 c0 c2	  pea $c2c0
$0d:ff5e  13 f9		 ora ($f9,s),y
$0d:ff60  80 59		 bra $ffbb
$0d:ff62  85 c1		 sta $c1
$0d:ff64  30 b1		 bmi $ff17
$0d:ff66  18			clc
$0d:ff67  42 7d		 wdm #$7d
$0d:ff69  6f 0b 3d b8   adc $b83d0b
$0d:ff6d  c2 26		 rep #$26
$0d:ff6f  10 2a		 bpl $ff9b
$0d:ff71  b8			clv
$0d:ff72  b8			clv
$0d:ff73  0c 80 60	  tsb $6080
$0d:ff76  32 bb		 and ($bb)
$0d:ff78  c0 a1		 cpy #$a1
$0d:ff7a  12 83		 ora ($83)
$0d:ff7c  08			php
$0d:ff7d  6c a5 05	  jmp ($05a5)
$0d:ff80  52 06		 eor ($06)
$0d:ff82  03 64		 ora $64,s
$0d:ff84  01 80		 ora ($80,x)
$0d:ff86  dd 09 d6	  cmp $d609,x
$0d:ff89  cb			wai
$0d:ff8a  60			rts
$0d:ff8b  b2 01		 lda ($01)
$0d:ff8d  50 40		 bvc $ffcf
$0d:ff8f  a1 42		 lda ($42,x)
$0d:ff91  d0 a4		 bne $ff37
$0d:ff93  ab			plb
$0d:ff94  06 93		 asl $93
$0d:ff96  42 94		 wdm #$94
$0d:ff98  8b			phb
$0d:ff99  42 99		 wdm #$99
$0d:ff9b  3a			dec a
$0d:ff9c  84 2c		 sty $2c
$0d:ff9e  02 8a		 cop #$8a
$0d:ffa0  e0 06		 cpx #$06
$0d:ffa2  00 d0		 brk #$d0
$0d:ffa4  68			pla
$0d:ffa5  52 a0		 eor ($a0)
$0d:ffa7  e8			inx
$0d:ffa8  31 82		 and ($82),y
$0d:ffaa  72 cf		 adc ($cf)
$0d:ffac  26 e1		 rol $e1
$0d:ffae  d2 fe		 cmp ($fe)
$0d:ffb0  54 36 db	  mvn $db,$36
$0d:ffb3  50 40		 bvc $fff5
$0d:ffb5  01 01		 ora ($01,x)
$0d:ffb7  00 01		 brk #$01
$0d:ffb9  cc c6 de	  cpy $dec6
$0d:ffbc  17 9a		 ora [$9a],y
$0d:ffbe  8c c7 00	  sty $00c7
$0d:ffc1  17 1a		 ora [$1a],y
$0d:ffc3  8c c7 42	  sty $42c7
$0d:ffc6  16 0e		 asl $0e,x
$0d:ffc8  0c b0 82	  tsb $82b0
$0d:ffcb  c1 c1		 cmp ($c1,x)
$0d:ffcd  97 d5		 sta [$d5],y
$0d:ffcf  65 c6		 adc $c6
$0d:ffd1  52 0e		 eor ($0e)
$0d:ffd3  0d 9c 68	  ora $689c
$0d:ffd6  45 9f		 eor $9f
$0d:ffd8  a8			tay
$0d:ffd9  d0 ca		 bne $ffa5
$0d:ffdb  f3 71		 sbc ($71,s),y
$0d:ffdd  bd 10 8b	  lda $8b10,x
$0d:ffe0  00 00		 brk #$00
$0d:ffe2  32 c8		 and ($c8)
$0d:ffe4  f4 78 45	  pea $4578
$0d:ffe7  a9 0b 8d	  lda #$8d0b
$0d:ffea  68			pla
$0d:ffeb  5e 19 a2	  lsr $a219,x
$0d:ffee  00 60		 brk #$60
$0d:fff0  00 02		 brk #$02
$0d:fff2  18			clc
$0d:fff3  10 08		 bpl $fffd
$0d:fff5  03 3f		 ora $3f,s
$0d:fff7  dc 18 29	  jml [$2918]
$0d:fffa  00 00		 brk #$00
$0d:fffc  e0 78		 cpx #$78
$0d:fffe  1c 00 22	  trb $2200
