; Soul Blazer (SNES) - Bank $0b
; Disassembled from ROM
; File offset: $058000-$05ffff
; CPU address: $0b:$8000-$0b:$ffff
;===========================================================

.bank $0b
.org $8000

$0b:8000  58			cli
$0b:8001  80 62		 bra $8065
$0b:8003  80 6c		 bra $8071
$0b:8005  80 76		 bra $807d
$0b:8007  80 80		 bra $7f89
$0b:8009  80 b2		 bra $7fbd
$0b:800b  80 e4		 bra $7ff1
$0b:800d  80 16		 bra $8025
$0b:800f  81 48		 sta ($48,x)
$0b:8011  81 7a		 sta ($7a,x)
$0b:8013  81 ac		 sta ($ac,x)
$0b:8015  81 de		 sta ($de,x)
$0b:8017  81 10		 sta ($10,x)
$0b:8019  82 42 82	  brl $025e
$0b:801c  74 82		 stz $82,x
$0b:801e  a6 82		 ldx $82
$0b:8020  d8			cld
$0b:8021  82 0a 83	  brl $032e
$0b:8024  3c 83 6e	  bit $6e83,x
$0b:8027  83 a0		 sta $a0,s
$0b:8029  83 aa		 sta $aa,s
$0b:802b  83 b4		 sta $b4,s
$0b:802d  83 be		 sta $be,s
$0b:802f  83 c8		 sta $c8,s
$0b:8031  83 e2		 sta $e2,s
$0b:8033  83 fc		 sta $fc,s
$0b:8035  83 16		 sta $16,s
$0b:8037  84 30		 sty $30
$0b:8039  84 82		 sty $82
$0b:803b  84 b4		 sty $b4
$0b:803d  84 e6		 sty $e6
$0b:803f  84 18		 sty $18
$0b:8041  85 32		 sta $32
$0b:8043  85 4c		 sta $4c
$0b:8045  85 66		 sta $66
$0b:8047  85 80		 sta $80
$0b:8049  85 8a		 sta $8a
$0b:804b  85 bc		 sta $bc
$0b:804d  85 ee		 sta $ee
$0b:804f  85 f8		 sta $f8
$0b:8051  85 2a		 sta $2a
$0b:8053  86 34		 stx $34
$0b:8055  86 66		 stx $66
$0b:8057  86 00		 stx $00
$0b:8059  00 00		 brk #$00
$0b:805b  00 00		 brk #$00
$0b:805d  00 70		 brk #$70
$0b:805f  86 ff		 stx $ff
$0b:8061  ff 00 00 00   sbc $000000,x
$0b:8065  00 00		 brk #$00
$0b:8067  00 93		 brk #$93
$0b:8069  86 ff		 stx $ff
$0b:806b  ff 00 00 00   sbc $000000,x
$0b:806f  00 00		 brk #$00
$0b:8071  00 b6		 brk #$b6
$0b:8073  86 ff		 stx $ff
$0b:8075  ff 00 00 00   sbc $000000,x
$0b:8079  00 00		 brk #$00
$0b:807b  00 d9		 brk #$d9
$0b:807d  86 ff		 stx $ff
$0b:807f  ff 03 00 00   sbc $000003,x
$0b:8083  00 02		 brk #$02
$0b:8085  00 42		 brk #$42
$0b:8087  87 03		 sta [$03]
$0b:8089  00 00		 brk #$00
$0b:808b  00 02		 brk #$02
$0b:808d  00 65		 brk #$65
$0b:808f  87 03		 sta [$03]
$0b:8091  00 00		 brk #$00
$0b:8093  00 02		 brk #$02
$0b:8095  00 88		 brk #$88
$0b:8097  87 03		 sta [$03]
$0b:8099  00 00		 brk #$00
$0b:809b  00 02		 brk #$02
$0b:809d  00 ab		 brk #$ab
$0b:809f  87 03		 sta [$03]
$0b:80a1  00 00		 brk #$00
$0b:80a3  00 02		 brk #$02
$0b:80a5  00 fc		 brk #$fc
$0b:80a7  86 03		 stx $03
$0b:80a9  00 00		 brk #$00
$0b:80ab  00 02		 brk #$02
$0b:80ad  00 1f		 brk #$1f
$0b:80af  87 ff		 sta [$ff]
$0b:80b1  ff 03 00 00   sbc $000003,x
$0b:80b5  00 fe		 brk #$fe
$0b:80b7  ff fc 86 03   sbc $0386fc,x
$0b:80bb  00 00		 brk #$00
$0b:80bd  00 fe		 brk #$fe
$0b:80bf  ff ab 87 03   sbc $0387ab,x
$0b:80c3  00 00		 brk #$00
$0b:80c5  00 fe		 brk #$fe
$0b:80c7  ff 88 87 03   sbc $038788,x
$0b:80cb  00 00		 brk #$00
$0b:80cd  00 fe		 brk #$fe
$0b:80cf  ff 65 87 03   sbc $038765,x
$0b:80d3  00 00		 brk #$00
$0b:80d5  00 fe		 brk #$fe
$0b:80d7  ff 42 87 03   sbc $038742,x
$0b:80db  00 00		 brk #$00
$0b:80dd  00 fe		 brk #$fe
$0b:80df  ff 1f 87 ff   sbc $ff871f,x
$0b:80e3  ff 03 00 00   sbc $000003,x
$0b:80e7  00 fe		 brk #$fe
$0b:80e9  ff 14 88 03   sbc $038814,x
$0b:80ed  00 00		 brk #$00
$0b:80ef  00 fe		 brk #$fe
$0b:80f1  ff 37 88 03   sbc $038837,x
$0b:80f5  00 00		 brk #$00
$0b:80f7  00 fe		 brk #$fe
$0b:80f9  ff 5a 88 03   sbc $03885a,x
$0b:80fd  00 00		 brk #$00
$0b:80ff  00 fe		 brk #$fe
$0b:8101  ff 7d 88 03   sbc $03887d,x
$0b:8105  00 00		 brk #$00
$0b:8107  00 fe		 brk #$fe
$0b:8109  ff ce 87 03   sbc $0387ce,x
$0b:810d  00 00		 brk #$00
$0b:810f  00 fe		 brk #$fe
$0b:8111  ff f1 87 ff   sbc $ff87f1,x
$0b:8115  ff 03 00 00   sbc $000003,x
$0b:8119  00 02		 brk #$02
$0b:811b  00 ce		 brk #$ce
$0b:811d  87 03		 sta [$03]
$0b:811f  00 00		 brk #$00
$0b:8121  00 02		 brk #$02
$0b:8123  00 7d		 brk #$7d
$0b:8125  88			dey
$0b:8126  03 00		 ora $00,s
$0b:8128  00 00		 brk #$00
$0b:812a  02 00		 cop #$00
$0b:812c  5a			phy
$0b:812d  88			dey
$0b:812e  03 00		 ora $00,s
$0b:8130  00 00		 brk #$00
$0b:8132  02 00		 cop #$00
$0b:8134  37 88		 and [$88],y
$0b:8136  03 00		 ora $00,s
$0b:8138  00 00		 brk #$00
$0b:813a  02 00		 cop #$00
$0b:813c  14 88		 trb $88
$0b:813e  03 00		 ora $00,s
$0b:8140  00 00		 brk #$00
$0b:8142  02 00		 cop #$00
$0b:8144  f1 87		 sbc ($87),y
$0b:8146  ff ff 03 00   sbc $0003ff,x
$0b:814a  fe ff 00	  inc $00ff,x
$0b:814d  00 e6		 brk #$e6
$0b:814f  88			dey
$0b:8150  03 00		 ora $00,s
$0b:8152  fe ff 00	  inc $00ff,x
$0b:8155  00 09		 brk #$09
$0b:8157  89 03 00	  bit #$0003
$0b:815a  fe ff 00	  inc $00ff,x
$0b:815d  00 2c		 brk #$2c
$0b:815f  89 03 00	  bit #$0003
$0b:8162  fe ff 00	  inc $00ff,x
$0b:8165  00 4f		 brk #$4f
$0b:8167  89 03 00	  bit #$0003
$0b:816a  fe ff 00	  inc $00ff,x
$0b:816d  00 a0		 brk #$a0
$0b:816f  88			dey
$0b:8170  03 00		 ora $00,s
$0b:8172  fe ff 00	  inc $00ff,x
$0b:8175  00 c3		 brk #$c3
$0b:8177  88			dey
$0b:8178  ff ff 03 00   sbc $0003ff,x
$0b:817c  02 00		 cop #$00
$0b:817e  00 00		 brk #$00
$0b:8180  a0 88		 ldy #$88
$0b:8182  03 00		 ora $00,s
$0b:8184  02 00		 cop #$00
$0b:8186  00 00		 brk #$00
$0b:8188  4f 89 03 00   eor $000389
$0b:818c  02 00		 cop #$00
$0b:818e  00 00		 brk #$00
$0b:8190  2c 89 03	  bit $0389
$0b:8193  00 02		 brk #$02
$0b:8195  00 00		 brk #$00
$0b:8197  00 09		 brk #$09
$0b:8199  89 03 00	  bit #$0003
$0b:819c  02 00		 cop #$00
$0b:819e  00 00		 brk #$00
$0b:81a0  e6 88		 inc $88
$0b:81a2  03 00		 ora $00,s
$0b:81a4  02 00		 cop #$00
$0b:81a6  00 00		 brk #$00
$0b:81a8  c3 88		 cmp $88,s
$0b:81aa  ff ff 03 00   sbc $0003ff,x
$0b:81ae  02 00		 cop #$00
$0b:81b0  00 00		 brk #$00
$0b:81b2  b8			clv
$0b:81b3  89 03 00	  bit #$0003
$0b:81b6  02 00		 cop #$00
$0b:81b8  00 00		 brk #$00
$0b:81ba  db			stp
$0b:81bb  89 03 00	  bit #$0003
$0b:81be  02 00		 cop #$00
$0b:81c0  00 00		 brk #$00
$0b:81c2  fe 89 03	  inc $0389,x
$0b:81c5  00 02		 brk #$02
$0b:81c7  00 00		 brk #$00
$0b:81c9  00 21		 brk #$21
$0b:81cb  8a			txa
$0b:81cc  03 00		 ora $00,s
$0b:81ce  02 00		 cop #$00
$0b:81d0  00 00		 brk #$00
$0b:81d2  72 89		 adc ($89)
$0b:81d4  03 00		 ora $00,s
$0b:81d6  02 00		 cop #$00
$0b:81d8  00 00		 brk #$00
$0b:81da  95 89		 sta $89,x
$0b:81dc  ff ff 03 00   sbc $0003ff,x
$0b:81e0  fe ff 00	  inc $00ff,x
$0b:81e3  00 72		 brk #$72
$0b:81e5  89 03 00	  bit #$0003
$0b:81e8  fe ff 00	  inc $00ff,x
$0b:81eb  00 21		 brk #$21
$0b:81ed  8a			txa
$0b:81ee  03 00		 ora $00,s
$0b:81f0  fe ff 00	  inc $00ff,x
$0b:81f3  00 fe		 brk #$fe
$0b:81f5  89 03 00	  bit #$0003
$0b:81f8  fe ff 00	  inc $00ff,x
$0b:81fb  00 db		 brk #$db
$0b:81fd  89 03 00	  bit #$0003
$0b:8200  fe ff 00	  inc $00ff,x
$0b:8203  00 b8		 brk #$b8
$0b:8205  89 03 00	  bit #$0003
$0b:8208  fe ff 00	  inc $00ff,x
$0b:820b  00 95		 brk #$95
$0b:820d  89 ff ff	  bit #$ffff
$0b:8210  03 00		 ora $00,s
$0b:8212  02 00		 cop #$00
$0b:8214  00 00		 brk #$00
$0b:8216  ad 8a 03	  lda $038a
$0b:8219  00 02		 brk #$02
$0b:821b  00 00		 brk #$00
$0b:821d  00 d0		 brk #$d0
$0b:821f  8a			txa
$0b:8220  03 00		 ora $00,s
$0b:8222  02 00		 cop #$00
$0b:8224  00 00		 brk #$00
$0b:8226  f3 8a		 sbc ($8a,s),y
$0b:8228  03 00		 ora $00,s
$0b:822a  02 00		 cop #$00
$0b:822c  00 00		 brk #$00
$0b:822e  44 8a 03	  mvp $03,$8a
$0b:8231  00 02		 brk #$02
$0b:8233  00 00		 brk #$00
$0b:8235  00 67		 brk #$67
$0b:8237  8a			txa
$0b:8238  03 00		 ora $00,s
$0b:823a  02 00		 cop #$00
$0b:823c  00 00		 brk #$00
$0b:823e  8a			txa
$0b:823f  8a			txa
$0b:8240  ff ff 03 00   sbc $0003ff,x
$0b:8244  fe ff 00	  inc $00ff,x
$0b:8247  00 67		 brk #$67
$0b:8249  8a			txa
$0b:824a  03 00		 ora $00,s
$0b:824c  fe ff 00	  inc $00ff,x
$0b:824f  00 44		 brk #$44
$0b:8251  8a			txa
$0b:8252  03 00		 ora $00,s
$0b:8254  fe ff 00	  inc $00ff,x
$0b:8257  00 f3		 brk #$f3
$0b:8259  8a			txa
$0b:825a  03 00		 ora $00,s
$0b:825c  fe ff 00	  inc $00ff,x
$0b:825f  00 d0		 brk #$d0
$0b:8261  8a			txa
$0b:8262  03 00		 ora $00,s
$0b:8264  fe ff 00	  inc $00ff,x
$0b:8267  00 ad		 brk #$ad
$0b:8269  8a			txa
$0b:826a  03 00		 ora $00,s
$0b:826c  fe ff 00	  inc $00ff,x
$0b:826f  00 8a		 brk #$8a
$0b:8271  8a			txa
$0b:8272  ff ff 03 00   sbc $0003ff,x
$0b:8276  fe ff 00	  inc $00ff,x
$0b:8279  00 7f		 brk #$7f
$0b:827b  8b			phb
$0b:827c  03 00		 ora $00,s
$0b:827e  fe ff 00	  inc $00ff,x
$0b:8281  00 a2		 brk #$a2
$0b:8283  8b			phb
$0b:8284  03 00		 ora $00,s
$0b:8286  fe ff 00	  inc $00ff,x
$0b:8289  00 c5		 brk #$c5
$0b:828b  8b			phb
$0b:828c  03 00		 ora $00,s
$0b:828e  fe ff 00	  inc $00ff,x
$0b:8291  00 16		 brk #$16
$0b:8293  8b			phb
$0b:8294  03 00		 ora $00,s
$0b:8296  fe ff 00	  inc $00ff,x
$0b:8299  00 39		 brk #$39
$0b:829b  8b			phb
$0b:829c  03 00		 ora $00,s
$0b:829e  fe ff 00	  inc $00ff,x
$0b:82a1  00 5c		 brk #$5c
$0b:82a3  8b			phb
$0b:82a4  ff ff 03 00   sbc $0003ff,x
$0b:82a8  02 00		 cop #$00
$0b:82aa  00 00		 brk #$00
$0b:82ac  39 8b 03	  and $038b,y
$0b:82af  00 02		 brk #$02
$0b:82b1  00 00		 brk #$00
$0b:82b3  00 16		 brk #$16
$0b:82b5  8b			phb
$0b:82b6  03 00		 ora $00,s
$0b:82b8  02 00		 cop #$00
$0b:82ba  00 00		 brk #$00
$0b:82bc  c5 8b		 cmp $8b
$0b:82be  03 00		 ora $00,s
$0b:82c0  02 00		 cop #$00
$0b:82c2  00 00		 brk #$00
$0b:82c4  a2 8b		 ldx #$8b
$0b:82c6  03 00		 ora $00,s
$0b:82c8  02 00		 cop #$00
$0b:82ca  00 00		 brk #$00
$0b:82cc  7f 8b 03 00   adc $00038b,x
$0b:82d0  02 00		 cop #$00
$0b:82d2  00 00		 brk #$00
$0b:82d4  5c 8b ff ff   jml $ffff8b
$0b:82d8  03 00		 ora $00,s
$0b:82da  00 00		 brk #$00
$0b:82dc  02 00		 cop #$00
$0b:82de  51 8c		 eor ($8c),y
$0b:82e0  03 00		 ora $00,s
$0b:82e2  00 00		 brk #$00
$0b:82e4  02 00		 cop #$00
$0b:82e6  74 8c		 stz $8c,x
$0b:82e8  03 00		 ora $00,s
$0b:82ea  00 00		 brk #$00
$0b:82ec  02 00		 cop #$00
$0b:82ee  97 8c		 sta [$8c],y
$0b:82f0  03 00		 ora $00,s
$0b:82f2  00 00		 brk #$00
$0b:82f4  02 00		 cop #$00
$0b:82f6  e8			inx
$0b:82f7  8b			phb
$0b:82f8  03 00		 ora $00,s
$0b:82fa  00 00		 brk #$00
$0b:82fc  02 00		 cop #$00
$0b:82fe  0b			phd
$0b:82ff  8c 03 00	  sty $0003
$0b:8302  00 00		 brk #$00
$0b:8304  02 00		 cop #$00
$0b:8306  2e 8c ff	  rol $ff8c
$0b:8309  ff 03 00 00   sbc $000003,x
$0b:830d  00 fe		 brk #$fe
$0b:830f  ff 0b 8c 03   sbc $038c0b,x
$0b:8313  00 00		 brk #$00
$0b:8315  00 fe		 brk #$fe
$0b:8317  ff e8 8b 03   sbc $038be8,x
$0b:831b  00 00		 brk #$00
$0b:831d  00 fe		 brk #$fe
$0b:831f  ff 97 8c 03   sbc $038c97,x
$0b:8323  00 00		 brk #$00
$0b:8325  00 fe		 brk #$fe
$0b:8327  ff 74 8c 03   sbc $038c74,x
$0b:832b  00 00		 brk #$00
$0b:832d  00 fe		 brk #$fe
$0b:832f  ff 51 8c 03   sbc $038c51,x
$0b:8333  00 00		 brk #$00
$0b:8335  00 fe		 brk #$fe
$0b:8337  ff 2e 8c ff   sbc $ff8c2e,x
$0b:833b  ff 03 00 00   sbc $000003,x
$0b:833f  00 fe		 brk #$fe
$0b:8341  ff 23 8d 03   sbc $038d23,x
$0b:8345  00 00		 brk #$00
$0b:8347  00 fe		 brk #$fe
$0b:8349  ff 46 8d 03   sbc $038d46,x
$0b:834d  00 00		 brk #$00
$0b:834f  00 fe		 brk #$fe
$0b:8351  ff 69 8d 03   sbc $038d69,x
$0b:8355  00 00		 brk #$00
$0b:8357  00 fe		 brk #$fe
$0b:8359  ff ba 8c 03   sbc $038cba,x
$0b:835d  00 00		 brk #$00
$0b:835f  00 fe		 brk #$fe
$0b:8361  ff dd 8c 03   sbc $038cdd,x
$0b:8365  00 00		 brk #$00
$0b:8367  00 fe		 brk #$fe
$0b:8369  ff 00 8d ff   sbc $ff8d00,x
$0b:836d  ff 03 00 00   sbc $000003,x
$0b:8371  00 02		 brk #$02
$0b:8373  00 dd		 brk #$dd
$0b:8375  8c 03 00	  sty $0003
$0b:8378  00 00		 brk #$00
$0b:837a  02 00		 cop #$00
$0b:837c  ba			tsx
$0b:837d  8c 03 00	  sty $0003
$0b:8380  00 00		 brk #$00
$0b:8382  02 00		 cop #$00
$0b:8384  69 8d 03	  adc #$038d
$0b:8387  00 00		 brk #$00
$0b:8389  00 02		 brk #$02
$0b:838b  00 46		 brk #$46
$0b:838d  8d 03 00	  sta $0003
$0b:8390  00 00		 brk #$00
$0b:8392  02 00		 cop #$00
$0b:8394  23 8d		 and $8d,s
$0b:8396  03 00		 ora $00,s
$0b:8398  00 00		 brk #$00
$0b:839a  02 00		 cop #$00
$0b:839c  00 8d		 brk #$8d
$0b:839e  ff ff 3b 00   sbc $003bff,x
$0b:83a2  00 00		 brk #$00
$0b:83a4  00 00		 brk #$00
$0b:83a6  70 86		 bvs $832e
$0b:83a8  ff ff 3b 00   sbc $003bff,x
$0b:83ac  00 00		 brk #$00
$0b:83ae  00 00		 brk #$00
$0b:83b0  93 86		 sta ($86,s),y
$0b:83b2  ff ff 3b 00   sbc $003bff,x
$0b:83b6  00 00		 brk #$00
$0b:83b8  00 00		 brk #$00
$0b:83ba  b6 86		 ldx $86,y
$0b:83bc  ff ff 3b 00   sbc $003bff,x
$0b:83c0  00 00		 brk #$00
$0b:83c2  00 00		 brk #$00
$0b:83c4  d9 86 ff	  cmp $ff86,y
$0b:83c7  ff 01 00 00   sbc $000001,x
$0b:83cb  00 f8		 brk #$f8
$0b:83cd  ff 8c 8d 01   sbc $018d8c,x
$0b:83d1  00 00		 brk #$00
$0b:83d3  00 fb		 brk #$fb
$0b:83d5  ff 8c 8d 01   sbc $018d8c,x
$0b:83d9  00 00		 brk #$00
$0b:83db  00 fd		 brk #$fd
$0b:83dd  ff 8c 8d ff   sbc $ff8d8c,x
$0b:83e1  ff 01 00 00   sbc $000001,x
$0b:83e5  00 08		 brk #$08
$0b:83e7  00 af		 brk #$af
$0b:83e9  8d 01 00	  sta $0001
$0b:83ec  00 00		 brk #$00
$0b:83ee  05 00		 ora $00
$0b:83f0  af 8d 01 00   lda $00018d
$0b:83f4  00 00		 brk #$00
$0b:83f6  03 00		 ora $00,s
$0b:83f8  af 8d ff ff   lda $ffff8d
$0b:83fc  01 00		 ora ($00,x)
$0b:83fe  08			php
$0b:83ff  00 00		 brk #$00
$0b:8401  00 d2		 brk #$d2
$0b:8403  8d 01 00	  sta $0001
$0b:8406  05 00		 ora $00
$0b:8408  00 00		 brk #$00
$0b:840a  d2 8d		 cmp ($8d)
$0b:840c  01 00		 ora ($00,x)
$0b:840e  03 00		 ora $00,s
$0b:8410  00 00		 brk #$00
$0b:8412  d2 8d		 cmp ($8d)
$0b:8414  ff ff 01 00   sbc $0001ff,x
$0b:8418  f8			sed
$0b:8419  ff 00 00 f5   sbc $f50000,x
$0b:841d  8d 01 00	  sta $0001
$0b:8420  fb			xce
$0b:8421  ff 00 00 f5   sbc $f50000,x
$0b:8425  8d 01 00	  sta $0001
$0b:8428  fd ff 00	  sbc $00ff,x
$0b:842b  00 f5		 brk #$f5
$0b:842d  8d ff ff	  sta $ffff
$0b:8430  07 00		 ora [$00]
$0b:8432  00 00		 brk #$00
$0b:8434  00 00		 brk #$00
$0b:8436  8c 8d 07	  sty $078d
$0b:8439  00 00		 brk #$00
$0b:843b  00 00		 brk #$00
$0b:843d  00 d2		 brk #$d2
$0b:843f  8d 07 00	  sta $0007
$0b:8442  00 00		 brk #$00
$0b:8444  00 00		 brk #$00
$0b:8446  af 8d 07 00   lda $00078d
$0b:844a  00 00		 brk #$00
$0b:844c  00 00		 brk #$00
$0b:844e  f5 8d		 sbc $8d,x
$0b:8450  07 00		 ora [$00]
$0b:8452  00 00		 brk #$00
$0b:8454  00 00		 brk #$00
$0b:8456  8c 8d 07	  sty $078d
$0b:8459  00 00		 brk #$00
$0b:845b  00 00		 brk #$00
$0b:845d  00 d2		 brk #$d2
$0b:845f  8d 07 00	  sta $0007
$0b:8462  00 00		 brk #$00
$0b:8464  00 00		 brk #$00
$0b:8466  af 8d 07 00   lda $00078d
$0b:846a  00 00		 brk #$00
$0b:846c  00 00		 brk #$00
$0b:846e  f5 8d		 sbc $8d,x
$0b:8470  0f 00 00 00   ora $000000
$0b:8474  00 00		 brk #$00
$0b:8476  8c 8d 5f	  sty $5f8d
$0b:8479  00 00		 brk #$00
$0b:847b  00 00		 brk #$00
$0b:847d  00 18		 brk #$18
$0b:847f  8e ff ff	  stx $ffff
$0b:8482  07 00		 ora [$00]
$0b:8484  00 00		 brk #$00
$0b:8486  00 00		 brk #$00
$0b:8488  af 8d 07 00   lda $00078d
$0b:848c  00 00		 brk #$00
$0b:848e  00 00		 brk #$00
$0b:8490  f5 8d		 sbc $8d,x
$0b:8492  07 00		 ora [$00]
$0b:8494  00 00		 brk #$00
$0b:8496  00 00		 brk #$00
$0b:8498  8c 8d 07	  sty $078d
$0b:849b  00 00		 brk #$00
$0b:849d  00 00		 brk #$00
$0b:849f  00 d2		 brk #$d2
$0b:84a1  8d 0f 00	  sta $000f
$0b:84a4  00 00		 brk #$00
$0b:84a6  00 00		 brk #$00
$0b:84a8  af 8d 5f 00   lda $005f8d
$0b:84ac  00 00		 brk #$00
$0b:84ae  00 00		 brk #$00
$0b:84b0  3b			tsc
$0b:84b1  8e ff ff	  stx $ffff
$0b:84b4  07 00		 ora [$00]
$0b:84b6  00 00		 brk #$00
$0b:84b8  00 00		 brk #$00
$0b:84ba  d2 8d		 cmp ($8d)
$0b:84bc  07 00		 ora [$00]
$0b:84be  00 00		 brk #$00
$0b:84c0  00 00		 brk #$00
$0b:84c2  af 8d 07 00   lda $00078d
$0b:84c6  00 00		 brk #$00
$0b:84c8  00 00		 brk #$00
$0b:84ca  f5 8d		 sbc $8d,x
$0b:84cc  07 00		 ora [$00]
$0b:84ce  00 00		 brk #$00
$0b:84d0  00 00		 brk #$00
$0b:84d2  8c 8d 0f	  sty $0f8d
$0b:84d5  00 00		 brk #$00
$0b:84d7  00 00		 brk #$00
$0b:84d9  00 d2		 brk #$d2
$0b:84db  8d 5f 00	  sta $005f
$0b:84de  00 00		 brk #$00
$0b:84e0  00 00		 brk #$00
$0b:84e2  5e 8e ff	  lsr $ff8e,x
$0b:84e5  ff 07 00 00   sbc $000007,x
$0b:84e9  00 00		 brk #$00
$0b:84eb  00 f5		 brk #$f5
$0b:84ed  8d 07 00	  sta $0007
$0b:84f0  00 00		 brk #$00
$0b:84f2  00 00		 brk #$00
$0b:84f4  8c 8d 07	  sty $078d
$0b:84f7  00 00		 brk #$00
$0b:84f9  00 00		 brk #$00
$0b:84fb  00 d2		 brk #$d2
$0b:84fd  8d 07 00	  sta $0007
$0b:8500  00 00		 brk #$00
$0b:8502  00 00		 brk #$00
$0b:8504  af 8d 0f 00   lda $000f8d
$0b:8508  00 00		 brk #$00
$0b:850a  00 00		 brk #$00
$0b:850c  f5 8d		 sbc $8d,x
$0b:850e  5f 00 00 00   eor $000000,x
$0b:8512  00 00		 brk #$00
$0b:8514  81 8e		 sta ($8e,x)
$0b:8516  ff ff 03 00   sbc $0003ff,x
$0b:851a  00 00		 brk #$00
$0b:851c  00 00		 brk #$00
$0b:851e  a4 8e		 ldy $8e
$0b:8520  01 00		 ora ($00,x)
$0b:8522  00 00		 brk #$00
$0b:8524  00 00		 brk #$00
$0b:8526  c7 8e		 cmp [$8e]
$0b:8528  08			php
$0b:8529  00 00		 brk #$00
$0b:852b  00 00		 brk #$00
$0b:852d  00 ea		 brk #$ea
$0b:852f  8e ff ff	  stx $ffff
$0b:8532  03 00		 ora $00,s
$0b:8534  00 00		 brk #$00
$0b:8536  00 00		 brk #$00
$0b:8538  0d 8f 01	  ora $018f
$0b:853b  00 00		 brk #$00
$0b:853d  00 00		 brk #$00
$0b:853f  00 30		 brk #$30
$0b:8541  8f 08 00 00   sta $000008
$0b:8545  00 00		 brk #$00
$0b:8547  00 53		 brk #$53
$0b:8549  8f ff ff 03   sta $03ffff
$0b:854d  00 00		 brk #$00
$0b:854f  00 00		 brk #$00
$0b:8551  00 76		 brk #$76
$0b:8553  8f 01 00 00   sta $000001
$0b:8557  00 00		 brk #$00
$0b:8559  00 99		 brk #$99
$0b:855b  8f 08 00 00   sta $000008
$0b:855f  00 00		 brk #$00
$0b:8561  00 bc		 brk #$bc
$0b:8563  8f ff ff 03   sta $03ffff
$0b:8567  00 00		 brk #$00
$0b:8569  00 00		 brk #$00
$0b:856b  00 df		 brk #$df
$0b:856d  8f 01 00 00   sta $000001
$0b:8571  00 00		 brk #$00
$0b:8573  00 02		 brk #$02
$0b:8575  90 08		 bcc $857f
$0b:8577  00 00		 brk #$00
$0b:8579  00 00		 brk #$00
$0b:857b  00 25		 brk #$25
$0b:857d  90 ff		 bcc $857e
$0b:857f  ff 00 00 00   sbc $000000,x
$0b:8583  00 00		 brk #$00
$0b:8585  00 1a		 brk #$1a
$0b:8587  91 ff		 sta ($ff),y
$0b:8589  ff 03 00 02   sbc $020003,x
$0b:858d  00 00		 brk #$00
$0b:858f  00 f7		 brk #$f7
$0b:8591  90 03		 bcc $8596
$0b:8593  00 02		 brk #$02
$0b:8595  00 00		 brk #$00
$0b:8597  00 48		 brk #$48
$0b:8599  90 03		 bcc $859e
$0b:859b  00 02		 brk #$02
$0b:859d  00 00		 brk #$00
$0b:859f  00 6b		 brk #$6b
$0b:85a1  90 03		 bcc $85a6
$0b:85a3  00 02		 brk #$02
$0b:85a5  00 00		 brk #$00
$0b:85a7  00 8e		 brk #$8e
$0b:85a9  90 03		 bcc $85ae
$0b:85ab  00 02		 brk #$02
$0b:85ad  00 00		 brk #$00
$0b:85af  00 b1		 brk #$b1
$0b:85b1  90 03		 bcc $85b6
$0b:85b3  00 02		 brk #$02
$0b:85b5  00 00		 brk #$00
$0b:85b7  00 d4		 brk #$d4
$0b:85b9  90 ff		 bcc $85ba
$0b:85bb  ff 03 00 fe   sbc $fe0003,x
$0b:85bf  ff 00 00 a6   sbc $a60000,x
$0b:85c3  91 03		 sta ($03),y
$0b:85c5  00 fe		 brk #$fe
$0b:85c7  ff 00 00 c9   sbc $c90000,x
$0b:85cb  91 03		 sta ($03),y
$0b:85cd  00 fe		 brk #$fe
$0b:85cf  ff 00 00 ec   sbc $ec0000,x
$0b:85d3  91 03		 sta ($03),y
$0b:85d5  00 fe		 brk #$fe
$0b:85d7  ff 00 00 3d   sbc $3d0000,x
$0b:85db  91 03		 sta ($03),y
$0b:85dd  00 fe		 brk #$fe
$0b:85df  ff 00 00 60   sbc $600000,x
$0b:85e3  91 03		 sta ($03),y
$0b:85e5  00 fe		 brk #$fe
$0b:85e7  ff 00 00 83   sbc $830000,x
$0b:85eb  91 ff		 sta ($ff),y
$0b:85ed  ff 00 00 00   sbc $000000,x
$0b:85f1  00 00		 brk #$00
$0b:85f3  00 0f		 brk #$0f
$0b:85f5  92 ff		 sta ($ff)
$0b:85f7  ff 03 00 00   sbc $000003,x
$0b:85fb  00 02		 brk #$02
$0b:85fd  00 be		 brk #$be
$0b:85ff  92 03		 sta ($03)
$0b:8601  00 00		 brk #$00
$0b:8603  00 02		 brk #$02
$0b:8605  00 55		 brk #$55
$0b:8607  92 03		 sta ($03)
$0b:8609  00 00		 brk #$00
$0b:860b  00 02		 brk #$02
$0b:860d  00 9b		 brk #$9b
$0b:860f  92 03		 sta ($03)
$0b:8611  00 00		 brk #$00
$0b:8613  00 02		 brk #$02
$0b:8615  00 e1		 brk #$e1
$0b:8617  92 03		 sta ($03)
$0b:8619  00 00		 brk #$00
$0b:861b  00 02		 brk #$02
$0b:861d  00 32		 brk #$32
$0b:861f  92 03		 sta ($03)
$0b:8621  00 00		 brk #$00
$0b:8623  00 02		 brk #$02
$0b:8625  00 78		 brk #$78
$0b:8627  92 ff		 sta ($ff)
$0b:8629  ff 00 00 00   sbc $000000,x
$0b:862d  00 00		 brk #$00
$0b:862f  00 04		 brk #$04
$0b:8631  93 ff		 sta ($ff,s),y
$0b:8633  ff 03 00 00   sbc $000003,x
$0b:8637  00 fe		 brk #$fe
$0b:8639  ff b3 93 03   sbc $0393b3,x
$0b:863d  00 00		 brk #$00
$0b:863f  00 fe		 brk #$fe
$0b:8641  ff 4a 93 03   sbc $03934a,x
$0b:8645  00 00		 brk #$00
$0b:8647  00 fe		 brk #$fe
$0b:8649  ff 90 93 03   sbc $039390,x
$0b:864d  00 00		 brk #$00
$0b:864f  00 fe		 brk #$fe
$0b:8651  ff d6 93 03   sbc $0393d6,x
$0b:8655  00 00		 brk #$00
$0b:8657  00 fe		 brk #$fe
$0b:8659  ff 27 93 03   sbc $039327,x
$0b:865d  00 00		 brk #$00
$0b:865f  00 fe		 brk #$fe
$0b:8661  ff 6d 93 ff   sbc $ff936d,x
$0b:8665  ff 00 00 00   sbc $000000,x
$0b:8669  00 00		 brk #$00
$0b:866b  00 f9		 brk #$f9
$0b:866d  93 ff		 sta ($ff,s),y
$0b:866f  ff 00 00 11   sbc $110000,x
$0b:8673  00 1f		 brk #$1f
$0b:8675  00 00		 brk #$00
$0b:8677  00 10		 brk #$10
$0b:8679  00 10		 brk #$10
$0b:867b  00 03		 brk #$03
$0b:867d  00 01		 brk #$01
$0b:867f  01 00		 ora ($00,x)
$0b:8681  00 0f		 brk #$0f
$0b:8683  00 0a		 brk #$0a
$0b:8685  01 01		 ora ($01,x)
$0b:8687  00 08		 brk #$08
$0b:8689  07 26		 ora [$26]
$0b:868b  0a			asl a
$0b:868c  01 00		 ora ($00,x)
$0b:868e  01 0f		 ora ($0f,x)
$0b:8690  00 60		 brk #$60
$0b:8692  0b			phd
$0b:8693  00 00		 brk #$00
$0b:8695  11 00		 ora ($00),y
$0b:8697  1f 00 00 00   ora $000000,x
$0b:869b  10 00		 bpl $869d
$0b:869d  10 00		 bpl $869f
$0b:869f  03 00		 ora $00,s
$0b:86a1  01 00		 ora ($00,x)
$0b:86a3  01 00		 ora ($00,x)
$0b:86a5  0f 02 0a 01   ora $010a02
$0b:86a9  00 01		 brk #$01
$0b:86ab  08			php
$0b:86ac  07 66		 ora [$66]
$0b:86ae  0a			asl a
$0b:86af  01 01		 ora ($01,x)
$0b:86b1  00 0f		 brk #$0f
$0b:86b3  00 80		 brk #$80
$0b:86b5  0b			phd
$0b:86b6  00 00		 brk #$00
$0b:86b8  10 00		 bpl $86ba
$0b:86ba  20 00 00	  jsr $0000
$0b:86bd  00 10		 brk #$10
$0b:86bf  00 10		 brk #$10
$0b:86c1  00 03		 brk #$03
$0b:86c3  00 01		 brk #$01
$0b:86c5  00 00		 brk #$00
$0b:86c7  00 10		 brk #$10
$0b:86c9  04 0a		 tsb $0a
$0b:86cb  01 00		 ora ($00,x)
$0b:86cd  00 08		 brk #$08
$0b:86cf  08			php
$0b:86d0  a2 0a		 ldx #$0a
$0b:86d2  01 00		 ora ($00,x)
$0b:86d4  00 10		 brk #$10
$0b:86d6  00 ce		 brk #$ce
$0b:86d8  0a			asl a
$0b:86d9  00 00		 brk #$00
$0b:86db  11 00		 ora ($00),y
$0b:86dd  20 00 00	  jsr $0000
$0b:86e0  00 10		 brk #$10
$0b:86e2  00 10		 brk #$10
$0b:86e4  00 03		 brk #$03
$0b:86e6  00 01		 brk #$01
$0b:86e8  01 00		 ora ($00,x)
$0b:86ea  00 10		 brk #$10
$0b:86ec  06 0a		 asl $0a
$0b:86ee  01 01		 ora ($01,x)
$0b:86f0  00 09		 brk #$09
$0b:86f2  07 ac		 ora [$ac]
$0b:86f4  0a			asl a
$0b:86f5  01 00		 ora ($00,x)
$0b:86f7  01 10		 ora ($10,x)
$0b:86f9  00 ae		 brk #$ae
$0b:86fb  0a			asl a
$0b:86fc  ff ff 11 00   sbc $0011ff,x
$0b:8700  20 00 00	  jsr $0000
$0b:8703  00 10		 brk #$10
$0b:8705  00 10		 brk #$10
$0b:8707  00 03		 brk #$03
$0b:8709  00 01		 brk #$01
$0b:870b  00 00		 brk #$00
$0b:870d  00 10		 brk #$10
$0b:870f  00 0a		 brk #$0a
$0b:8711  01 00		 ora ($00,x)
$0b:8713  00 08		 brk #$08
$0b:8715  08			php
$0b:8716  26 0a		 rol $0a
$0b:8718  01 00		 ora ($00,x)
$0b:871a  00 10		 brk #$10
$0b:871c  00 42		 brk #$42
$0b:871e  0a			asl a
$0b:871f  ff ff 11 00   sbc $0011ff,x
$0b:8723  1f 00 00 00   ora $000000,x
$0b:8727  10 00		 bpl $8729
$0b:8729  10 00		 bpl $872b
$0b:872b  03 00		 ora $00,s
$0b:872d  01 00		 ora ($00,x)
$0b:872f  00 00		 brk #$00
$0b:8731  0f 00 0a 01   ora $010a00
$0b:8735  00 00		 brk #$00
$0b:8737  08			php
$0b:8738  07 26		 ora [$26]
$0b:873a  0a			asl a
$0b:873b  01 00		 ora ($00,x)
$0b:873d  00 0f		 brk #$0f
$0b:873f  00 44		 brk #$44
$0b:8741  0a			asl a
$0b:8742  ff ff 11 00   sbc $0011ff,x
$0b:8746  20 00 00	  jsr $0000
$0b:8749  00 10		 brk #$10
$0b:874b  00 10		 brk #$10
$0b:874d  00 03		 brk #$03
$0b:874f  00 01		 brk #$01
$0b:8751  00 00		 brk #$00
$0b:8753  00 10		 brk #$10
$0b:8755  00 0a		 brk #$0a
$0b:8757  01 00		 ora ($00,x)
$0b:8759  00 08		 brk #$08
$0b:875b  08			php
$0b:875c  26 0a		 rol $0a
$0b:875e  01 00		 ora ($00,x)
$0b:8760  00 10		 brk #$10
$0b:8762  00 46		 brk #$46
$0b:8764  0a			asl a
$0b:8765  00 00		 brk #$00
$0b:8767  11 00		 ora ($00),y
$0b:8769  20 00 00	  jsr $0000
$0b:876c  00 10		 brk #$10
$0b:876e  00 10		 brk #$10
$0b:8770  00 03		 brk #$03
$0b:8772  00 01		 brk #$01
$0b:8774  01 00		 ora ($00,x)
$0b:8776  00 10		 brk #$10
$0b:8778  00 0a		 brk #$0a
$0b:877a  01 01		 ora ($01,x)
$0b:877c  00 08		 brk #$08
$0b:877e  08			php
$0b:877f  26 0a		 rol $0a
$0b:8781  01 00		 ora ($00,x)
$0b:8783  01 10		 ora ($10,x)
$0b:8785  00 42		 brk #$42
$0b:8787  4a			lsr a
$0b:8788  00 00		 brk #$00
$0b:878a  11 00		 ora ($00),y
$0b:878c  1f 00 00 00   ora $000000,x
$0b:8790  10 00		 bpl $8792
$0b:8792  10 00		 bpl $8794
$0b:8794  03 00		 ora $00,s
$0b:8796  01 01		 ora ($01,x)
$0b:8798  00 00		 brk #$00
$0b:879a  0f 00 0a 01   ora $010a00
$0b:879e  01 00		 ora ($00,x)
$0b:87a0  08			php
$0b:87a1  07 26		 ora [$26]
$0b:87a3  0a			asl a
$0b:87a4  01 00		 ora ($00,x)
$0b:87a6  01 0f		 ora ($0f,x)
$0b:87a8  00 44		 brk #$44
$0b:87aa  4a			lsr a
$0b:87ab  00 00		 brk #$00
$0b:87ad  11 00		 ora ($00),y
$0b:87af  20 00 00	  jsr $0000
$0b:87b2  00 10		 brk #$10
$0b:87b4  00 10		 brk #$10
$0b:87b6  00 03		 brk #$03
$0b:87b8  00 01		 brk #$01
$0b:87ba  01 00		 ora ($00,x)
$0b:87bc  00 10		 brk #$10
$0b:87be  00 0a		 brk #$0a
$0b:87c0  01 01		 ora ($01,x)
$0b:87c2  00 08		 brk #$08
$0b:87c4  08			php
$0b:87c5  26 0a		 rol $0a
$0b:87c7  01 00		 ora ($00,x)
$0b:87c9  01 10		 ora ($10,x)
$0b:87cb  00 46		 brk #$46
$0b:87cd  4a			lsr a
$0b:87ce  00 00		 brk #$00
$0b:87d0  10 00		 bpl $87d2
$0b:87d2  20 00 00	  jsr $0000
$0b:87d5  00 10		 brk #$10
$0b:87d7  00 10		 brk #$10
$0b:87d9  00 03		 brk #$03
$0b:87db  00 01		 brk #$01
$0b:87dd  00 00		 brk #$00
$0b:87df  00 10		 brk #$10
$0b:87e1  02 0a		 cop #$0a
$0b:87e3  01 00		 ora ($00,x)
$0b:87e5  00 08		 brk #$08
$0b:87e7  08			php
$0b:87e8  66 0a		 ror $0a
$0b:87ea  01 00		 ora ($00,x)
$0b:87ec  00 10		 brk #$10
$0b:87ee  00 82		 brk #$82
$0b:87f0  0a			asl a
$0b:87f1  00 00		 brk #$00
$0b:87f3  10 00		 bpl $87f5
$0b:87f5  1f 00 01 00   ora $000100,x
$0b:87f9  10 00		 bpl $87fb
$0b:87fb  10 00		 bpl $87fd
$0b:87fd  03 00		 ora $00,s
$0b:87ff  01 00		 ora ($00,x)
$0b:8801  00 00		 brk #$00
$0b:8803  10 02		 bpl $8807
$0b:8805  0a			asl a
$0b:8806  01 00		 ora ($00,x)
$0b:8808  00 08		 brk #$08
$0b:880a  08			php
$0b:880b  66 0a		 ror $0a
$0b:880d  01 00		 ora ($00,x)
$0b:880f  00 10		 brk #$10
$0b:8811  00 84		 brk #$84
$0b:8813  0a			asl a
$0b:8814  00 00		 brk #$00
$0b:8816  10 00		 bpl $8818
$0b:8818  20 00 00	  jsr $0000
$0b:881b  00 10		 brk #$10
$0b:881d  00 10		 brk #$10
$0b:881f  00 03		 brk #$03
$0b:8821  00 01		 brk #$01
$0b:8823  00 00		 brk #$00
$0b:8825  00 10		 brk #$10
$0b:8827  02 0a		 cop #$0a
$0b:8829  01 00		 ora ($00,x)
$0b:882b  00 08		 brk #$08
$0b:882d  08			php
$0b:882e  66 0a		 ror $0a
$0b:8830  01 00		 ora ($00,x)
$0b:8832  00 10		 brk #$10
$0b:8834  00 86		 brk #$86
$0b:8836  0a			asl a
$0b:8837  01 00		 ora ($00,x)
$0b:8839  10 00		 bpl $883b
$0b:883b  20 00 00	  jsr $0000
$0b:883e  00 10		 brk #$10
$0b:8840  00 10		 brk #$10
$0b:8842  00 03		 brk #$03
$0b:8844  00 01		 brk #$01
$0b:8846  01 00		 ora ($00,x)
$0b:8848  00 10		 brk #$10
$0b:884a  02 0a		 cop #$0a
$0b:884c  01 01		 ora ($01,x)
$0b:884e  00 08		 brk #$08
$0b:8850  08			php
$0b:8851  66 0a		 ror $0a
$0b:8853  01 00		 ora ($00,x)
$0b:8855  01 10		 ora ($10,x)
$0b:8857  00 82		 brk #$82
$0b:8859  4a			lsr a
$0b:885a  01 00		 ora ($00,x)
$0b:885c  10 00		 bpl $885e
$0b:885e  1f 00 01 00   ora $000100,x
$0b:8862  10 00		 bpl $8864
$0b:8864  10 00		 bpl $8866
$0b:8866  03 00		 ora $00,s
$0b:8868  01 01		 ora ($01,x)
$0b:886a  00 00		 brk #$00
$0b:886c  10 02		 bpl $8870
$0b:886e  0a			asl a
$0b:886f  01 01		 ora ($01,x)
$0b:8871  00 08		 brk #$08
$0b:8873  08			php
$0b:8874  66 0a		 ror $0a
$0b:8876  01 00		 ora ($00,x)
$0b:8878  01 10		 ora ($10,x)
$0b:887a  00 84		 brk #$84
$0b:887c  4a			lsr a
$0b:887d  01 00		 ora ($00,x)
$0b:887f  10 00		 bpl $8881
$0b:8881  20 00 00	  jsr $0000
$0b:8884  00 10		 brk #$10
$0b:8886  00 10		 brk #$10
$0b:8888  00 03		 brk #$03
$0b:888a  00 01		 brk #$01
$0b:888c  01 00		 ora ($00,x)
$0b:888e  00 10		 brk #$10
$0b:8890  02 0a		 cop #$0a
$0b:8892  01 01		 ora ($01,x)
$0b:8894  00 08		 brk #$08
$0b:8896  08			php
$0b:8897  66 0a		 ror $0a
$0b:8899  01 00		 ora ($00,x)
$0b:889b  01 10		 ora ($10,x)
$0b:889d  00 86		 brk #$86
$0b:889f  4a			lsr a
$0b:88a0  00 00		 brk #$00
$0b:88a2  10 00		 bpl $88a4
$0b:88a4  20 00 01	  jsr $0100
$0b:88a7  00 10		 brk #$10
$0b:88a9  00 10		 brk #$10
$0b:88ab  00 03		 brk #$03
$0b:88ad  00 01		 brk #$01
$0b:88af  00 00		 brk #$00
$0b:88b1  00 11		 brk #$11
$0b:88b3  04 0a		 tsb $0a
$0b:88b5  01 00		 ora ($00,x)
$0b:88b7  00 08		 brk #$08
$0b:88b9  09 a2 0a	  ora #$0aa2
$0b:88bc  01 00		 ora ($00,x)
$0b:88be  00 11		 brk #$11
$0b:88c0  00 c2		 brk #$c2
$0b:88c2  0a			asl a
$0b:88c3  00 00		 brk #$00
$0b:88c5  11 00		 ora ($00),y
$0b:88c7  1f 00 01 00   ora $000100,x
$0b:88cb  10 00		 bpl $88cd
$0b:88cd  10 00		 bpl $88cf
$0b:88cf  03 00		 ora $00,s
$0b:88d1  01 00		 ora ($00,x)
$0b:88d3  01 00		 ora ($00,x)
$0b:88d5  10 04		 bpl $88db
$0b:88d7  0a			asl a
$0b:88d8  01 00		 ora ($00,x)
$0b:88da  01 08		 ora ($08,x)
$0b:88dc  08			php
$0b:88dd  a2 0a		 ldx #$0a
$0b:88df  01 01		 ora ($01,x)
$0b:88e1  00 10		 brk #$10
$0b:88e3  00 c4		 brk #$c4
$0b:88e5  0a			asl a
$0b:88e6  00 00		 brk #$00
$0b:88e8  10 00		 bpl $88ea
$0b:88ea  20 00 01	  jsr $0100
$0b:88ed  00 10		 brk #$10
$0b:88ef  00 10		 brk #$10
$0b:88f1  00 03		 brk #$03
$0b:88f3  00 01		 brk #$01
$0b:88f5  00 00		 brk #$00
$0b:88f7  00 11		 brk #$11
$0b:88f9  04 0a		 tsb $0a
$0b:88fb  01 00		 ora ($00,x)
$0b:88fd  00 08		 brk #$08
$0b:88ff  09 a2 0a	  ora #$0aa2
$0b:8902  01 00		 ora ($00,x)
$0b:8904  00 11		 brk #$11
$0b:8906  00 c6		 brk #$c6
$0b:8908  0a			asl a
$0b:8909  00 00		 brk #$00
$0b:890b  10 00		 bpl $890d
$0b:890d  20 00 01	  jsr $0100
$0b:8910  00 10		 brk #$10
$0b:8912  00 10		 brk #$10
$0b:8914  00 03		 brk #$03
$0b:8916  00 01		 brk #$01
$0b:8918  00 00		 brk #$00
$0b:891a  00 11		 brk #$11
$0b:891c  04 0a		 tsb $0a
$0b:891e  01 00		 ora ($00,x)
$0b:8920  00 08		 brk #$08
$0b:8922  09 a2 0a	  ora #$0aa2
$0b:8925  01 00		 ora ($00,x)
$0b:8927  00 11		 brk #$11
$0b:8929  00 c8		 brk #$c8
$0b:892b  0a			asl a
$0b:892c  00 00		 brk #$00
$0b:892e  10 00		 bpl $8930
$0b:8930  1f 00 01 00   ora $000100,x
$0b:8934  10 00		 bpl $8936
$0b:8936  10 00		 bpl $8938
$0b:8938  03 00		 ora $00,s
$0b:893a  01 00		 ora ($00,x)
$0b:893c  00 00		 brk #$00
$0b:893e  10 04		 bpl $8944
$0b:8940  0a			asl a
$0b:8941  01 00		 ora ($00,x)
$0b:8943  00 08		 brk #$08
$0b:8945  08			php
$0b:8946  a2 0a		 ldx #$0a
$0b:8948  01 00		 ora ($00,x)
$0b:894a  00 10		 brk #$10
$0b:894c  00 ca		 brk #$ca
$0b:894e  0a			asl a
$0b:894f  00 00		 brk #$00
$0b:8951  10 00		 bpl $8953
$0b:8953  20 00 01	  jsr $0100
$0b:8956  00 10		 brk #$10
$0b:8958  00 10		 brk #$10
$0b:895a  00 03		 brk #$03
$0b:895c  00 01		 brk #$01
$0b:895e  00 00		 brk #$00
$0b:8960  00 11		 brk #$11
$0b:8962  04 0a		 tsb $0a
$0b:8964  01 00		 ora ($00,x)
$0b:8966  00 08		 brk #$08
$0b:8968  09 a2 0a	  ora #$0aa2
$0b:896b  01 00		 ora ($00,x)
$0b:896d  00 11		 brk #$11
$0b:896f  00 cc		 brk #$cc
$0b:8971  0a			asl a
$0b:8972  00 00		 brk #$00
$0b:8974  11 00		 ora ($00),y
$0b:8976  21 00		 and ($00,x)
$0b:8978  01 00		 ora ($00,x)
$0b:897a  10 00		 bpl $897c
$0b:897c  10 00		 bpl $897e
$0b:897e  03 00		 ora $00,s
$0b:8980  01 01		 ora ($01,x)
$0b:8982  00 00		 brk #$00
$0b:8984  12 06		 ora ($06)
$0b:8986  0a			asl a
$0b:8987  01 01		 ora ($01,x)
$0b:8989  00 09		 brk #$09
$0b:898b  09 ac 0a	  ora #$0aac
$0b:898e  01 00		 ora ($00,x)
$0b:8990  01 12		 ora ($12,x)
$0b:8992  00 c8		 brk #$c8
$0b:8994  4a			lsr a
$0b:8995  00 00		 brk #$00
$0b:8997  11 00		 ora ($00),y
$0b:8999  20 00 01	  jsr $0100
$0b:899c  00 10		 brk #$10
$0b:899e  00 10		 brk #$10
$0b:89a0  00 03		 brk #$03
$0b:89a2  00 01		 brk #$01
$0b:89a4  01 00		 ora ($00,x)
$0b:89a6  00 11		 brk #$11
$0b:89a8  06 0a		 asl $0a
$0b:89aa  01 01		 ora ($01,x)
$0b:89ac  00 09		 brk #$09
$0b:89ae  08			php
$0b:89af  ac 0a 01	  ldy $010a
$0b:89b2  00 01		 brk #$01
$0b:89b4  11 00		 ora ($00),y
$0b:89b6  ca			dex
$0b:89b7  4a			lsr a
$0b:89b8  00 00		 brk #$00
$0b:89ba  11 00		 ora ($00),y
$0b:89bc  21 00		 and ($00,x)
$0b:89be  01 00		 ora ($00,x)
$0b:89c0  10 00		 bpl $89c2
$0b:89c2  10 00		 bpl $89c4
$0b:89c4  03 00		 ora $00,s
$0b:89c6  01 01		 ora ($01,x)
$0b:89c8  00 00		 brk #$00
$0b:89ca  12 06		 ora ($06)
$0b:89cc  0a			asl a
$0b:89cd  01 01		 ora ($01,x)
$0b:89cf  00 09		 brk #$09
$0b:89d1  09 ac 0a	  ora #$0aac
$0b:89d4  01 00		 ora ($00,x)
$0b:89d6  01 12		 ora ($12,x)
$0b:89d8  00 cc		 brk #$cc
$0b:89da  4a			lsr a
$0b:89db  00 00		 brk #$00
$0b:89dd  11 00		 ora ($00),y
$0b:89df  21 00		 and ($00,x)
$0b:89e1  01 00		 ora ($00,x)
$0b:89e3  10 00		 bpl $89e5
$0b:89e5  10 00		 bpl $89e7
$0b:89e7  03 00		 ora $00,s
$0b:89e9  01 01		 ora ($01,x)
$0b:89eb  00 00		 brk #$00
$0b:89ed  12 06		 ora ($06)
$0b:89ef  0a			asl a
$0b:89f0  01 01		 ora ($01,x)
$0b:89f2  00 09		 brk #$09
$0b:89f4  09 ac 0a	  ora #$0aac
$0b:89f7  01 00		 ora ($00,x)
$0b:89f9  01 12		 ora ($12,x)
$0b:89fb  00 c2		 brk #$c2
$0b:89fd  4a			lsr a
$0b:89fe  00 00		 brk #$00
$0b:8a00  11 00		 ora ($00),y
$0b:8a02  20 00 01	  jsr $0100
$0b:8a05  00 10		 brk #$10
$0b:8a07  00 10		 brk #$10
$0b:8a09  00 03		 brk #$03
$0b:8a0b  00 01		 brk #$01
$0b:8a0d  01 00		 ora ($00,x)
$0b:8a0f  00 11		 brk #$11
$0b:8a11  06 0a		 asl $0a
$0b:8a13  01 01		 ora ($01,x)
$0b:8a15  00 09		 brk #$09
$0b:8a17  08			php
$0b:8a18  ac 0a 01	  ldy $010a
$0b:8a1b  00 01		 brk #$01
$0b:8a1d  11 00		 ora ($00),y
$0b:8a1f  c4 4a		 cpy $4a
$0b:8a21  00 00		 brk #$00
$0b:8a23  11 00		 ora ($00),y
$0b:8a25  21 00		 and ($00,x)
$0b:8a27  01 00		 ora ($00,x)
$0b:8a29  10 00		 bpl $8a2b
$0b:8a2b  10 00		 bpl $8a2d
$0b:8a2d  03 00		 ora $00,s
$0b:8a2f  01 01		 ora ($01,x)
$0b:8a31  00 00		 brk #$00
$0b:8a33  12 06		 ora ($06)
$0b:8a35  0a			asl a
$0b:8a36  01 01		 ora ($01,x)
$0b:8a38  00 09		 brk #$09
$0b:8a3a  09 ac 0a	  ora #$0aac
$0b:8a3d  01 00		 ora ($00,x)
$0b:8a3f  01 12		 ora ($12,x)
$0b:8a41  00 c6		 brk #$c6
$0b:8a43  4a			lsr a
$0b:8a44  ff ff 11 00   sbc $0011ff,x
$0b:8a48  20 00 00	  jsr $0000
$0b:8a4b  00 10		 brk #$10
$0b:8a4d  00 10		 brk #$10
$0b:8a4f  00 03		 brk #$03
$0b:8a51  00 01		 brk #$01
$0b:8a53  00 00		 brk #$00
$0b:8a55  00 10		 brk #$10
$0b:8a57  00 0a		 brk #$0a
$0b:8a59  01 00		 ora ($00,x)
$0b:8a5b  00 08		 brk #$08
$0b:8a5d  08			php
$0b:8a5e  26 0a		 rol $0a
$0b:8a60  01 00		 ora ($00,x)
$0b:8a62  00 10		 brk #$10
$0b:8a64  00 48		 brk #$48
$0b:8a66  0a			asl a
$0b:8a67  ff ff 11 00   sbc $0011ff,x
$0b:8a6b  20 00 00	  jsr $0000
$0b:8a6e  00 10		 brk #$10
$0b:8a70  00 10		 brk #$10
$0b:8a72  00 03		 brk #$03
$0b:8a74  00 01		 brk #$01
$0b:8a76  00 00		 brk #$00
$0b:8a78  00 10		 brk #$10
$0b:8a7a  00 0a		 brk #$0a
$0b:8a7c  01 00		 ora ($00,x)
$0b:8a7e  00 08		 brk #$08
$0b:8a80  08			php
$0b:8a81  26 0a		 rol $0a
$0b:8a83  01 00		 ora ($00,x)
$0b:8a85  00 10		 brk #$10
$0b:8a87  00 4a		 brk #$4a
$0b:8a89  0a			asl a
$0b:8a8a  ff ff 11 00   sbc $0011ff,x
$0b:8a8e  1f 00 00 00   ora $000000,x
$0b:8a92  10 00		 bpl $8a94
$0b:8a94  10 00		 bpl $8a96
$0b:8a96  03 00		 ora $00,s
$0b:8a98  01 00		 ora ($00,x)
$0b:8a9a  00 00		 brk #$00
$0b:8a9c  0f 00 0a 01   ora $010a00
$0b:8aa0  00 00		 brk #$00
$0b:8aa2  08			php
$0b:8aa3  07 26		 ora [$26]
$0b:8aa5  0a			asl a
$0b:8aa6  01 00		 ora ($00,x)
$0b:8aa8  00 0f		 brk #$0f
$0b:8aaa  00 4c		 brk #$4c
$0b:8aac  0a			asl a
$0b:8aad  ff ff 11 00   sbc $0011ff,x
$0b:8ab1  20 00 00	  jsr $0000
$0b:8ab4  00 10		 brk #$10
$0b:8ab6  00 10		 brk #$10
$0b:8ab8  00 03		 brk #$03
$0b:8aba  00 01		 brk #$01
$0b:8abc  00 00		 brk #$00
$0b:8abe  00 10		 brk #$10
$0b:8ac0  00 0a		 brk #$0a
$0b:8ac2  01 00		 ora ($00,x)
$0b:8ac4  00 08		 brk #$08
$0b:8ac6  08			php
$0b:8ac7  26 0a		 rol $0a
$0b:8ac9  01 00		 ora ($00,x)
$0b:8acb  00 10		 brk #$10
$0b:8acd  00 4e		 brk #$4e
$0b:8acf  0a			asl a
$0b:8ad0  ff ff 11 00   sbc $0011ff,x
$0b:8ad4  20 00 00	  jsr $0000
$0b:8ad7  00 10		 brk #$10
$0b:8ad9  00 10		 brk #$10
$0b:8adb  00 03		 brk #$03
$0b:8add  00 01		 brk #$01
$0b:8adf  00 00		 brk #$00
$0b:8ae1  00 10		 brk #$10
$0b:8ae3  00 0a		 brk #$0a
$0b:8ae5  01 00		 ora ($00,x)
$0b:8ae7  00 08		 brk #$08
$0b:8ae9  08			php
$0b:8aea  26 0a		 rol $0a
$0b:8aec  01 00		 ora ($00,x)
$0b:8aee  00 10		 brk #$10
$0b:8af0  00 2c		 brk #$2c
$0b:8af2  0a			asl a
$0b:8af3  ff ff 11 00   sbc $0011ff,x
$0b:8af7  1f 00 00 00   ora $000000,x
$0b:8afb  10 00		 bpl $8afd
$0b:8afd  10 00		 bpl $8aff
$0b:8aff  03 00		 ora $00,s
$0b:8b01  01 00		 ora ($00,x)
$0b:8b03  00 00		 brk #$00
$0b:8b05  0f 00 0a 01   ora $010a00
$0b:8b09  00 00		 brk #$00
$0b:8b0b  08			php
$0b:8b0c  07 26		 ora [$26]
$0b:8b0e  0a			asl a
$0b:8b0f  01 00		 ora ($00,x)
$0b:8b11  00 0f		 brk #$0f
$0b:8b13  00 2e		 brk #$2e
$0b:8b15  0a			asl a
$0b:8b16  00 00		 brk #$00
$0b:8b18  10 00		 bpl $8b1a
$0b:8b1a  20 00 00	  jsr $0000
$0b:8b1d  00 10		 brk #$10
$0b:8b1f  00 10		 brk #$10
$0b:8b21  00 03		 brk #$03
$0b:8b23  00 01		 brk #$01
$0b:8b25  00 00		 brk #$00
$0b:8b27  00 10		 brk #$10
$0b:8b29  02 0a		 cop #$0a
$0b:8b2b  01 00		 ora ($00,x)
$0b:8b2d  00 08		 brk #$08
$0b:8b2f  08			php
$0b:8b30  66 0a		 ror $0a
$0b:8b32  01 00		 ora ($00,x)
$0b:8b34  00 10		 brk #$10
$0b:8b36  00 88		 brk #$88
$0b:8b38  0a			asl a
$0b:8b39  00 00		 brk #$00
$0b:8b3b  10 00		 bpl $8b3d
$0b:8b3d  20 00 00	  jsr $0000
$0b:8b40  00 10		 brk #$10
$0b:8b42  00 10		 brk #$10
$0b:8b44  00 03		 brk #$03
$0b:8b46  00 01		 brk #$01
$0b:8b48  00 00		 brk #$00
$0b:8b4a  00 10		 brk #$10
$0b:8b4c  02 0a		 cop #$0a
$0b:8b4e  01 00		 ora ($00,x)
$0b:8b50  00 08		 brk #$08
$0b:8b52  08			php
$0b:8b53  66 0a		 ror $0a
$0b:8b55  01 00		 ora ($00,x)
$0b:8b57  00 10		 brk #$10
$0b:8b59  00 8a		 brk #$8a
$0b:8b5b  0a			asl a
$0b:8b5c  00 00		 brk #$00
$0b:8b5e  10 00		 bpl $8b60
$0b:8b60  1f 00 00 00   ora $000000,x
$0b:8b64  10 00		 bpl $8b66
$0b:8b66  10 00		 bpl $8b68
$0b:8b68  03 00		 ora $00,s
$0b:8b6a  01 00		 ora ($00,x)
$0b:8b6c  00 00		 brk #$00
$0b:8b6e  0f 02 0a 01   ora $010a02
$0b:8b72  00 00		 brk #$00
$0b:8b74  08			php
$0b:8b75  07 66		 ora [$66]
$0b:8b77  0a			asl a
$0b:8b78  01 00		 ora ($00,x)
$0b:8b7a  00 0f		 brk #$0f
$0b:8b7c  00 8c		 brk #$8c
$0b:8b7e  0a			asl a
$0b:8b7f  00 00		 brk #$00
$0b:8b81  10 00		 bpl $8b83
$0b:8b83  20 00 00	  jsr $0000
$0b:8b86  00 10		 brk #$10
$0b:8b88  00 10		 brk #$10
$0b:8b8a  00 03		 brk #$03
$0b:8b8c  00 01		 brk #$01
$0b:8b8e  00 00		 brk #$00
$0b:8b90  00 10		 brk #$10
$0b:8b92  02 0a		 cop #$0a
$0b:8b94  01 00		 ora ($00,x)
$0b:8b96  00 08		 brk #$08
$0b:8b98  08			php
$0b:8b99  66 0a		 ror $0a
$0b:8b9b  01 00		 ora ($00,x)
$0b:8b9d  00 10		 brk #$10
$0b:8b9f  00 8e		 brk #$8e
$0b:8ba1  0a			asl a
$0b:8ba2  00 00		 brk #$00
$0b:8ba4  10 00		 bpl $8ba6
$0b:8ba6  20 00 00	  jsr $0000
$0b:8ba9  00 10		 brk #$10
$0b:8bab  00 10		 brk #$10
$0b:8bad  00 03		 brk #$03
$0b:8baf  00 01		 brk #$01
$0b:8bb1  00 00		 brk #$00
$0b:8bb3  00 10		 brk #$10
$0b:8bb5  02 0a		 cop #$0a
$0b:8bb7  01 00		 ora ($00,x)
$0b:8bb9  00 08		 brk #$08
$0b:8bbb  08			php
$0b:8bbc  66 0a		 ror $0a
$0b:8bbe  01 00		 ora ($00,x)
$0b:8bc0  00 10		 brk #$10
$0b:8bc2  00 6c		 brk #$6c
$0b:8bc4  0a			asl a
$0b:8bc5  00 00		 brk #$00
$0b:8bc7  10 00		 bpl $8bc9
$0b:8bc9  1f 00 00 00   ora $000000,x
$0b:8bcd  10 00		 bpl $8bcf
$0b:8bcf  10 00		 bpl $8bd1
$0b:8bd1  03 00		 ora $00,s
$0b:8bd3  01 00		 ora ($00,x)
$0b:8bd5  00 00		 brk #$00
$0b:8bd7  0f 02 0a 01   ora $010a02
$0b:8bdb  00 00		 brk #$00
$0b:8bdd  08			php
$0b:8bde  07 66		 ora [$66]
$0b:8be0  0a			asl a
$0b:8be1  01 00		 ora ($00,x)
$0b:8be3  00 0f		 brk #$0f
$0b:8be5  00 6e		 brk #$6e
$0b:8be7  0a			asl a
$0b:8be8  00 00		 brk #$00
$0b:8bea  10 00		 bpl $8bec
$0b:8bec  20 00 00	  jsr $0000
$0b:8bef  00 10		 brk #$10
$0b:8bf1  00 10		 brk #$10
$0b:8bf3  00 03		 brk #$03
$0b:8bf5  00 01		 brk #$01
$0b:8bf7  00 00		 brk #$00
$0b:8bf9  00 10		 brk #$10
$0b:8bfb  04 0a		 tsb $0a
$0b:8bfd  01 00		 ora ($00,x)
$0b:8bff  00 08		 brk #$08
$0b:8c01  08			php
$0b:8c02  a2 0a		 ldx #$0a
$0b:8c04  01 00		 ora ($00,x)
$0b:8c06  00 10		 brk #$10
$0b:8c08  00 00		 brk #$00
$0b:8c0a  0b			phd
$0b:8c0b  01 00		 ora ($00,x)
$0b:8c0d  10 00		 bpl $8c0f
$0b:8c0f  20 00 00	  jsr $0000
$0b:8c12  00 10		 brk #$10
$0b:8c14  00 10		 brk #$10
$0b:8c16  00 03		 brk #$03
$0b:8c18  00 01		 brk #$01
$0b:8c1a  01 00		 ora ($00,x)
$0b:8c1c  00 10		 brk #$10
$0b:8c1e  04 0a		 tsb $0a
$0b:8c20  01 01		 ora ($01,x)
$0b:8c22  00 08		 brk #$08
$0b:8c24  08			php
$0b:8c25  a2 0a		 ldx #$0a
$0b:8c27  01 00		 ora ($00,x)
$0b:8c29  01 10		 ora ($10,x)
$0b:8c2b  00 02		 brk #$02
$0b:8c2d  0b			phd
$0b:8c2e  00 00		 brk #$00
$0b:8c30  10 00		 bpl $8c32
$0b:8c32  1f 00 00 00   ora $000000,x
$0b:8c36  10 00		 bpl $8c38
$0b:8c38  10 00		 bpl $8c3a
$0b:8c3a  03 00		 ora $00,s
$0b:8c3c  01 00		 ora ($00,x)
$0b:8c3e  00 00		 brk #$00
$0b:8c40  0f 04 0a 01   ora $010a04
$0b:8c44  00 00		 brk #$00
$0b:8c46  08			php
$0b:8c47  07 a2		 ora [$a2]
$0b:8c49  0a			asl a
$0b:8c4a  01 00		 ora ($00,x)
$0b:8c4c  00 0f		 brk #$0f
$0b:8c4e  00 04		 brk #$04
$0b:8c50  0b			phd
$0b:8c51  00 00		 brk #$00
$0b:8c53  10 00		 bpl $8c55
$0b:8c55  20 00 00	  jsr $0000
$0b:8c58  00 10		 brk #$10
$0b:8c5a  00 10		 brk #$10
$0b:8c5c  00 03		 brk #$03
$0b:8c5e  00 01		 brk #$01
$0b:8c60  00 00		 brk #$00
$0b:8c62  00 10		 brk #$10
$0b:8c64  04 0a		 tsb $0a
$0b:8c66  01 00		 ora ($00,x)
$0b:8c68  00 08		 brk #$08
$0b:8c6a  08			php
$0b:8c6b  a2 0a		 ldx #$0a
$0b:8c6d  01 00		 ora ($00,x)
$0b:8c6f  00 10		 brk #$10
$0b:8c71  00 06		 brk #$06
$0b:8c73  0b			phd
$0b:8c74  00 00		 brk #$00
$0b:8c76  10 00		 bpl $8c78
$0b:8c78  20 00 00	  jsr $0000
$0b:8c7b  00 10		 brk #$10
$0b:8c7d  00 10		 brk #$10
$0b:8c7f  00 03		 brk #$03
$0b:8c81  00 01		 brk #$01
$0b:8c83  00 00		 brk #$00
$0b:8c85  00 10		 brk #$10
$0b:8c87  04 0a		 tsb $0a
$0b:8c89  01 00		 ora ($00,x)
$0b:8c8b  00 08		 brk #$08
$0b:8c8d  08			php
$0b:8c8e  a2 0a		 ldx #$0a
$0b:8c90  01 00		 ora ($00,x)
$0b:8c92  00 10		 brk #$10
$0b:8c94  00 e4		 brk #$e4
$0b:8c96  0a			asl a
$0b:8c97  01 00		 ora ($00,x)
$0b:8c99  10 00		 bpl $8c9b
$0b:8c9b  1f 00 00 00   ora $000000,x
$0b:8c9f  10 00		 bpl $8ca1
$0b:8ca1  10 00		 bpl $8ca3
$0b:8ca3  03 00		 ora $00,s
$0b:8ca5  01 01		 ora ($01,x)
$0b:8ca7  00 00		 brk #$00
$0b:8ca9  0f 04 0a 01   ora $010a04
$0b:8cad  01 00		 ora ($00,x)
$0b:8caf  08			php
$0b:8cb0  07 a2		 ora [$a2]
$0b:8cb2  0a			asl a
$0b:8cb3  01 00		 ora ($00,x)
$0b:8cb5  01 0f		 ora ($0f,x)
$0b:8cb7  00 e6		 brk #$e6
$0b:8cb9  0a			asl a
$0b:8cba  00 00		 brk #$00
$0b:8cbc  11 00		 ora ($00),y
$0b:8cbe  21 00		 and ($00,x)
$0b:8cc0  00 00		 brk #$00
$0b:8cc2  10 00		 bpl $8cc4
$0b:8cc4  10 00		 bpl $8cc6
$0b:8cc6  03 00		 ora $00,s
$0b:8cc8  01 01		 ora ($01,x)
$0b:8cca  00 00		 brk #$00
$0b:8ccc  11 06		 ora ($06),y
$0b:8cce  0a			asl a
$0b:8ccf  01 01		 ora ($01,x)
$0b:8cd1  00 09		 brk #$09
$0b:8cd3  08			php
$0b:8cd4  ac 0a 01	  ldy $010a
$0b:8cd7  00 01		 brk #$01
$0b:8cd9  11 00		 ora ($00),y
$0b:8cdb  08			php
$0b:8cdc  0b			phd
$0b:8cdd  00 00		 brk #$00
$0b:8cdf  11 00		 ora ($00),y
$0b:8ce1  21 00		 and ($00,x)
$0b:8ce3  00 00		 brk #$00
$0b:8ce5  10 00		 bpl $8ce7
$0b:8ce7  10 00		 bpl $8ce9
$0b:8ce9  03 00		 ora $00,s
$0b:8ceb  01 01		 ora ($01,x)
$0b:8ced  00 00		 brk #$00
$0b:8cef  11 06		 ora ($06),y
$0b:8cf1  0a			asl a
$0b:8cf2  01 01		 ora ($01,x)
$0b:8cf4  00 09		 brk #$09
$0b:8cf6  08			php
$0b:8cf7  ac 0a 01	  ldy $010a
$0b:8cfa  00 01		 brk #$01
$0b:8cfc  11 00		 ora ($00),y
$0b:8cfe  0a			asl a
$0b:8cff  0b			phd
$0b:8d00  00 00		 brk #$00
$0b:8d02  11 00		 ora ($00),y
$0b:8d04  20 00 00	  jsr $0000
$0b:8d07  00 10		 brk #$10
$0b:8d09  00 10		 brk #$10
$0b:8d0b  00 03		 brk #$03
$0b:8d0d  00 01		 brk #$01
$0b:8d0f  01 00		 ora ($00,x)
$0b:8d11  00 10		 brk #$10
$0b:8d13  06 0a		 asl $0a
$0b:8d15  01 01		 ora ($01,x)
$0b:8d17  00 09		 brk #$09
$0b:8d19  07 ac		 ora [$ac]
$0b:8d1b  0a			asl a
$0b:8d1c  01 00		 ora ($00,x)
$0b:8d1e  01 10		 ora ($10,x)
$0b:8d20  00 0c		 brk #$0c
$0b:8d22  0b			phd
$0b:8d23  00 00		 brk #$00
$0b:8d25  11 00		 ora ($00),y
$0b:8d27  21 00		 and ($00,x)
$0b:8d29  00 00		 brk #$00
$0b:8d2b  10 00		 bpl $8d2d
$0b:8d2d  10 00		 bpl $8d2f
$0b:8d2f  03 00		 ora $00,s
$0b:8d31  01 01		 ora ($01,x)
$0b:8d33  00 00		 brk #$00
$0b:8d35  11 06		 ora ($06),y
$0b:8d37  0a			asl a
$0b:8d38  01 01		 ora ($01,x)
$0b:8d3a  00 09		 brk #$09
$0b:8d3c  08			php
$0b:8d3d  ac 0a 01	  ldy $010a
$0b:8d40  00 01		 brk #$01
$0b:8d42  11 00		 ora ($00),y
$0b:8d44  0e 0b 00	  asl $000b
$0b:8d47  00 11		 brk #$11
$0b:8d49  00 21		 brk #$21
$0b:8d4b  00 00		 brk #$00
$0b:8d4d  00 10		 brk #$10
$0b:8d4f  00 10		 brk #$10
$0b:8d51  00 03		 brk #$03
$0b:8d53  00 01		 brk #$01
$0b:8d55  01 00		 ora ($00,x)
$0b:8d57  00 11		 brk #$11
$0b:8d59  06 0a		 asl $0a
$0b:8d5b  01 01		 ora ($01,x)
$0b:8d5d  00 09		 brk #$09
$0b:8d5f  08			php
$0b:8d60  ac 0a 01	  ldy $010a
$0b:8d63  00 01		 brk #$01
$0b:8d65  11 00		 ora ($00),y
$0b:8d67  ec 0a 00	  cpx $000a
$0b:8d6a  00 11		 brk #$11
$0b:8d6c  00 20		 brk #$20
$0b:8d6e  00 00		 brk #$00
$0b:8d70  00 10		 brk #$10
$0b:8d72  00 10		 brk #$10
$0b:8d74  00 03		 brk #$03
$0b:8d76  00 01		 brk #$01
$0b:8d78  01 00		 ora ($00,x)
$0b:8d7a  00 10		 brk #$10
$0b:8d7c  06 0a		 asl $0a
$0b:8d7e  01 01		 ora ($01,x)
$0b:8d80  00 09		 brk #$09
$0b:8d82  07 ac		 ora [$ac]
$0b:8d84  0a			asl a
$0b:8d85  01 00		 ora ($00,x)
$0b:8d87  01 10		 ora ($10,x)
$0b:8d89  00 ee		 brk #$ee
$0b:8d8b  0a			asl a
$0b:8d8c  01 00		 ora ($00,x)
$0b:8d8e  10 00		 bpl $8d90
$0b:8d90  20 00 00	  jsr $0000
$0b:8d93  00 10		 brk #$10
$0b:8d95  00 10		 brk #$10
$0b:8d97  00 03		 brk #$03
$0b:8d99  00 01		 brk #$01
$0b:8d9b  01 00		 ora ($00,x)
$0b:8d9d  00 10		 brk #$10
$0b:8d9f  62 0b 01	  per $8ead
$0b:8da2  00 01		 brk #$01
$0b:8da4  07 09		 ora [$09]
$0b:8da6  24 4a		 bit $4a
$0b:8da8  01 00		 ora ($00,x)
$0b:8daa  01 10		 ora ($10,x)
$0b:8dac  00 42		 brk #$42
$0b:8dae  4a			lsr a
$0b:8daf  01 00		 ora ($00,x)
$0b:8db1  10 00		 bpl $8db3
$0b:8db3  20 00 00	  jsr $0000
$0b:8db6  00 10		 brk #$10
$0b:8db8  00 10		 brk #$10
$0b:8dba  00 03		 brk #$03
$0b:8dbc  00 01		 brk #$01
$0b:8dbe  01 00		 ora ($00,x)
$0b:8dc0  00 10		 brk #$10
$0b:8dc2  82 0b 01	  brl $8ed0
$0b:8dc5  00 01		 brk #$01
$0b:8dc7  08			php
$0b:8dc8  08			php
$0b:8dc9  64 4a		 stz $4a
$0b:8dcb  01 00		 ora ($00,x)
$0b:8dcd  01 10		 ora ($10,x)
$0b:8dcf  00 82		 brk #$82
$0b:8dd1  4a			lsr a
$0b:8dd2  00 00		 brk #$00
$0b:8dd4  10 00		 bpl $8dd6
$0b:8dd6  20 00 00	  jsr $0000
$0b:8dd9  00 10		 brk #$10
$0b:8ddb  00 10		 brk #$10
$0b:8ddd  00 03		 brk #$03
$0b:8ddf  00 01		 brk #$01
$0b:8de1  00 00		 brk #$00
$0b:8de3  00 10		 brk #$10
$0b:8de5  a0 0b		 ldy #$0b
$0b:8de7  01 00		 ora ($00,x)
$0b:8de9  00 07		 brk #$07
$0b:8deb  09 aa 0a	  ora #$0aaa
$0b:8dee  01 00		 ora ($00,x)
$0b:8df0  00 10		 brk #$10
$0b:8df2  00 c8		 brk #$c8
$0b:8df4  0a			asl a
$0b:8df5  00 00		 brk #$00
$0b:8df7  10 00		 bpl $8df9
$0b:8df9  20 00 00	  jsr $0000
$0b:8dfc  00 10		 brk #$10
$0b:8dfe  00 10		 brk #$10
$0b:8e00  00 03		 brk #$03
$0b:8e02  00 01		 brk #$01
$0b:8e04  00 00		 brk #$00
$0b:8e06  00 10		 brk #$10
$0b:8e08  a2 0b		 ldx #$0b
$0b:8e0a  01 00		 ora ($00,x)
$0b:8e0c  00 07		 brk #$07
$0b:8e0e  09 a4 4a	  ora #$4aa4
$0b:8e11  01 00		 ora ($00,x)
$0b:8e13  00 10		 brk #$10
$0b:8e15  00 c2		 brk #$c2
$0b:8e17  4a			lsr a
$0b:8e18  00 00		 brk #$00
$0b:8e1a  10 00		 bpl $8e1c
$0b:8e1c  1f 00 f9 ff   ora $fff900,x
$0b:8e20  10 00		 bpl $8e22
$0b:8e22  10 00		 bpl $8e24
$0b:8e24  03 00		 ora $00,s
$0b:8e26  01 00		 ora ($00,x)
$0b:8e28  00 08		 brk #$08
$0b:8e2a  00 68		 brk #$68
$0b:8e2c  0b			phd
$0b:8e2d  01 00		 ora ($00,x)
$0b:8e2f  00 08		 brk #$08
$0b:8e31  00 66		 brk #$66
$0b:8e33  0b			phd
$0b:8e34  01 00		 ora ($00,x)
$0b:8e36  00 00		 brk #$00
$0b:8e38  08			php
$0b:8e39  64 0b		 stz $0b
$0b:8e3b  00 00		 brk #$00
$0b:8e3d  10 00		 bpl $8e3f
$0b:8e3f  17 00		 ora [$00],y
$0b:8e41  00 00		 brk #$00
$0b:8e43  10 00		 bpl $8e45
$0b:8e45  10 00		 bpl $8e47
$0b:8e47  03 00		 ora $00,s
$0b:8e49  01 00		 ora ($00,x)
$0b:8e4b  00 07		 brk #$07
$0b:8e4d  00 84		 brk #$84
$0b:8e4f  0b			phd
$0b:8e50  01 00		 ora ($00,x)
$0b:8e52  00 07		 brk #$07
$0b:8e54  00 86		 brk #$86
$0b:8e56  0b			phd
$0b:8e57  01 00		 ora ($00,x)
$0b:8e59  00 00		 brk #$00
$0b:8e5b  07 88		 ora [$88]
$0b:8e5d  0b			phd
$0b:8e5e  06 00		 asl $00
$0b:8e60  17 00		 ora [$00],y
$0b:8e62  11 00		 ora ($00),y
$0b:8e64  ff ff 10 00   sbc $0010ff,x
$0b:8e68  10 00		 bpl $8e6a
$0b:8e6a  03 00		 ora $00,s
$0b:8e6c  01 0d		 ora ($0d,x)
$0b:8e6e  00 00		 brk #$00
$0b:8e70  00 a4		 brk #$a4
$0b:8e72  0b			phd
$0b:8e73  01 00		 ora ($00,x)
$0b:8e75  0d 00 00	  ora $0000
$0b:8e78  a8			tay
$0b:8e79  0b			phd
$0b:8e7a  01 05		 ora ($05,x)
$0b:8e7c  08			php
$0b:8e7d  00 00		 brk #$00
$0b:8e7f  a6 0b		 ldx $0b
$0b:8e81  07 00		 ora [$00]
$0b:8e83  16 00		 asl $00,x
$0b:8e85  11 00		 ora ($00),y
$0b:8e87  ff ff 10 00   sbc $0010ff,x
$0b:8e8b  10 00		 bpl $8e8d
$0b:8e8d  03 00		 ora $00,s
$0b:8e8f  01 00		 ora ($00,x)
$0b:8e91  0d 00 00	  ora $0000
$0b:8e94  a4 4b		 ldy $4b
$0b:8e96  01 0d		 ora ($0d,x)
$0b:8e98  00 00		 brk #$00
$0b:8e9a  00 a8		 brk #$a8
$0b:8e9c  4b			phk
$0b:8e9d  01 08		 ora ($08,x)
$0b:8e9f  05 00		 ora $00
$0b:8ea1  00 a6		 brk #$a6
$0b:8ea3  4b			phk
$0b:8ea4  00 00		 brk #$00
$0b:8ea6  11 00		 ora ($00),y
$0b:8ea8  1f 00 00 00   ora $000000,x
$0b:8eac  10 00		 bpl $8eae
$0b:8eae  10 00		 bpl $8eb0
$0b:8eb0  03 00		 ora $00,s
$0b:8eb2  01 01		 ora ($01,x)
$0b:8eb4  00 00		 brk #$00
$0b:8eb6  0f 00 0a 01   ora $010a00
$0b:8eba  00 01		 brk #$01
$0b:8ebc  07 08		 ora [$08]
$0b:8ebe  20 0b 01	  jsr $010b
$0b:8ec1  00 01		 brk #$01
$0b:8ec3  0f 00 60 0b   ora $0b6000
$0b:8ec7  00 00		 brk #$00
$0b:8ec9  11 00		 ora ($00),y
$0b:8ecb  1e 00 00	  asl $0000,x
$0b:8ece  00 10		 brk #$10
$0b:8ed0  00 10		 brk #$10
$0b:8ed2  00 03		 brk #$03
$0b:8ed4  00 01		 brk #$01
$0b:8ed6  01 00		 ora ($00,x)
$0b:8ed8  00 0e		 brk #$0e
$0b:8eda  00 0a		 brk #$0a
$0b:8edc  01 00		 ora ($00,x)
$0b:8ede  01 07		 ora ($07,x)
$0b:8ee0  07 22		 ora [$22]
$0b:8ee2  0b			phd
$0b:8ee3  01 00		 ora ($00,x)
$0b:8ee5  01 0e		 ora ($0e,x)
$0b:8ee7  00 26		 brk #$26
$0b:8ee9  0b			phd
$0b:8eea  00 00		 brk #$00
$0b:8eec  10 00		 bpl $8eee
$0b:8eee  1d 00 00	  ora $0000,x
$0b:8ef1  00 10		 brk #$10
$0b:8ef3  00 10		 brk #$10
$0b:8ef5  00 03		 brk #$03
$0b:8ef7  00 01		 brk #$01
$0b:8ef9  00 00		 brk #$00
$0b:8efb  00 0d		 brk #$0d
$0b:8efd  00 0a		 brk #$0a
$0b:8eff  01 00		 ora ($00,x)
$0b:8f01  00 05		 brk #$05
$0b:8f03  08			php
$0b:8f04  24 0b		 bit $0b
$0b:8f06  01 00		 ora ($00,x)
$0b:8f08  00 0d		 brk #$0d
$0b:8f0a  00 26		 brk #$26
$0b:8f0c  0b			phd
$0b:8f0d  00 00		 brk #$00
$0b:8f0f  11 00		 ora ($00),y
$0b:8f11  1f 00 00 00   ora $000000,x
$0b:8f15  10 00		 bpl $8f17
$0b:8f17  10 00		 bpl $8f19
$0b:8f19  03 00		 ora $00,s
$0b:8f1b  01 00		 ora ($00,x)
$0b:8f1d  01 00		 ora ($00,x)
$0b:8f1f  0f 02 0a 01   ora $010a02
$0b:8f23  01 00		 ora ($00,x)
$0b:8f25  07 08		 ora [$08]
$0b:8f27  28			plp
$0b:8f28  0b			phd
$0b:8f29  01 01		 ora ($01,x)
$0b:8f2b  00 0f		 brk #$0f
$0b:8f2d  00 80		 brk #$80
$0b:8f2f  0b			phd
$0b:8f30  00 00		 brk #$00
$0b:8f32  11 00		 ora ($00),y
$0b:8f34  20 00 00	  jsr $0000
$0b:8f37  00 10		 brk #$10
$0b:8f39  00 10		 brk #$10
$0b:8f3b  00 03		 brk #$03
$0b:8f3d  00 01		 brk #$01
$0b:8f3f  00 01		 brk #$01
$0b:8f41  00 10		 brk #$10
$0b:8f43  02 0a		 cop #$0a
$0b:8f45  01 01		 ora ($01,x)
$0b:8f47  00 08		 brk #$08
$0b:8f49  08			php
$0b:8f4a  2a			rol a
$0b:8f4b  0b			phd
$0b:8f4c  01 01		 ora ($01,x)
$0b:8f4e  00 10		 brk #$10
$0b:8f50  00 2e		 brk #$2e
$0b:8f52  0b			phd
$0b:8f53  ff ff 11 00   sbc $0011ff,x
$0b:8f57  20 00 00	  jsr $0000
$0b:8f5a  00 10		 brk #$10
$0b:8f5c  00 10		 brk #$10
$0b:8f5e  00 03		 brk #$03
$0b:8f60  00 01		 brk #$01
$0b:8f62  00 00		 brk #$00
$0b:8f64  00 10		 brk #$10
$0b:8f66  02 0a		 cop #$0a
$0b:8f68  01 00		 ora ($00,x)
$0b:8f6a  00 08		 brk #$08
$0b:8f6c  08			php
$0b:8f6d  2c 0b 01	  bit $010b
$0b:8f70  00 00		 brk #$00
$0b:8f72  10 00		 bpl $8f74
$0b:8f74  2e 0b 00	  rol $000b
$0b:8f77  00 10		 brk #$10
$0b:8f79  00 1e		 brk #$1e
$0b:8f7b  00 00		 brk #$00
$0b:8f7d  00 10		 brk #$10
$0b:8f7f  00 10		 brk #$10
$0b:8f81  00 03		 brk #$03
$0b:8f83  00 01		 brk #$01
$0b:8f85  00 00		 brk #$00
$0b:8f87  00 0e		 brk #$0e
$0b:8f89  04 0a		 tsb $0a
$0b:8f8b  01 00		 ora ($00,x)
$0b:8f8d  00 06		 brk #$06
$0b:8f8f  08			php
$0b:8f90  40			rti
$0b:8f91  0b			phd
$0b:8f92  01 00		 ora ($00,x)
$0b:8f94  00 0e		 brk #$0e
$0b:8f96  00 ce		 brk #$ce
$0b:8f98  0a			asl a
$0b:8f99  01 00		 ora ($00,x)
$0b:8f9b  10 00		 bpl $8f9d
$0b:8f9d  1e 00 00	  asl $0000,x
$0b:8fa0  00 10		 brk #$10
$0b:8fa2  00 10		 brk #$10
$0b:8fa4  00 03		 brk #$03
$0b:8fa6  00 01		 brk #$01
$0b:8fa8  00 01		 brk #$01
$0b:8faa  00 0e		 brk #$0e
$0b:8fac  04 0a		 tsb $0a
$0b:8fae  01 01		 ora ($01,x)
$0b:8fb0  00 06		 brk #$06
$0b:8fb2  08			php
$0b:8fb3  42 0b		 wdm #$0b
$0b:8fb5  01 01		 ora ($01,x)
$0b:8fb7  00 0e		 brk #$0e
$0b:8fb9  00 46		 brk #$46
$0b:8fbb  0b			phd
$0b:8fbc  01 00		 ora ($00,x)
$0b:8fbe  10 00		 bpl $8fc0
$0b:8fc0  1e 00 00	  asl $0000,x
$0b:8fc3  00 10		 brk #$10
$0b:8fc5  00 10		 brk #$10
$0b:8fc7  00 03		 brk #$03
$0b:8fc9  00 01		 brk #$01
$0b:8fcb  00 01		 brk #$01
$0b:8fcd  00 0e		 brk #$0e
$0b:8fcf  04 0a		 tsb $0a
$0b:8fd1  01 01		 ora ($01,x)
$0b:8fd3  00 08		 brk #$08
$0b:8fd5  06 44		 asl $44
$0b:8fd7  0b			phd
$0b:8fd8  01 01		 ora ($01,x)
$0b:8fda  00 0e		 brk #$0e
$0b:8fdc  00 46		 brk #$46
$0b:8fde  0b			phd
$0b:8fdf  00 00		 brk #$00
$0b:8fe1  11 00		 ora ($00),y
$0b:8fe3  1f 00 00 00   ora $000000,x
$0b:8fe7  10 00		 bpl $8fe9
$0b:8fe9  10 00		 bpl $8feb
$0b:8feb  03 00		 ora $00,s
$0b:8fed  01 01		 ora ($01,x)
$0b:8fef  00 00		 brk #$00
$0b:8ff1  0f 06 0a 01   ora $010a06
$0b:8ff5  01 00		 ora ($00,x)
$0b:8ff7  07 08		 ora [$08]
$0b:8ff9  48			pha
$0b:8ffa  0b			phd
$0b:8ffb  01 00		 ora ($00,x)
$0b:8ffd  01 0f		 ora ($0f,x)
$0b:8fff  00 ae		 brk #$ae
$0b:9001  0a			asl a
$0b:9002  00 00		 brk #$00
$0b:9004  12 00		 ora ($00)
$0b:9006  1f 00 00 00   ora $000000,x
$0b:900a  10 00		 bpl $900c
$0b:900c  10 00		 bpl $900e
$0b:900e  03 00		 ora $00,s
$0b:9010  01 02		 ora ($02,x)
$0b:9012  00 00		 brk #$00
$0b:9014  0f 06 0a 01   ora $010a06
$0b:9018  02 00		 cop #$00
$0b:901a  07 08		 ora [$08]
$0b:901c  4a			lsr a
$0b:901d  0b			phd
$0b:901e  01 00		 ora ($00,x)
$0b:9020  02 0f		 cop #$0f
$0b:9022  00 4e		 brk #$4e
$0b:9024  0b			phd
$0b:9025  00 00		 brk #$00
$0b:9027  12 00		 ora ($00)
$0b:9029  1e 00 00	  asl $0000,x
$0b:902c  00 10		 brk #$10
$0b:902e  00 10		 brk #$10
$0b:9030  00 03		 brk #$03
$0b:9032  00 01		 brk #$01
$0b:9034  02 00		 cop #$00
$0b:9036  00 0e		 brk #$0e
$0b:9038  06 0a		 asl $0a
$0b:903a  01 01		 ora ($01,x)
$0b:903c  01 06		 ora ($06,x)
$0b:903e  08			php
$0b:903f  4c 0b 01	  jmp $010b
$0b:9042  00 02		 brk #$02
$0b:9044  0e 00 4e	  asl $4e00
$0b:9047  0b			phd
$0b:9048  00 00		 brk #$00
$0b:904a  12 00		 ora ($00)
$0b:904c  1f 00 01 00   ora $000100,x
$0b:9050  10 00		 bpl $9052
$0b:9052  10 00		 bpl $9054
$0b:9054  03 00		 ora $00,s
$0b:9056  01 01		 ora ($01,x)
$0b:9058  01 00		 ora ($00,x)
$0b:905a  10 06		 bpl $9062
$0b:905c  0a			asl a
$0b:905d  01 02		 ora ($02,x)
$0b:905f  00 0a		 brk #$0a
$0b:9061  06 c0		 asl $c0
$0b:9063  0b			phd
$0b:9064  01 00		 ora ($00,x)
$0b:9066  02 10		 cop #$10
$0b:9068  00 c2		 brk #$c2
$0b:906a  4a			lsr a
$0b:906b  00 00		 brk #$00
$0b:906d  12 00		 ora ($00)
$0b:906f  1e 00 01	  asl $0100,x
$0b:9072  00 10		 brk #$10
$0b:9074  00 10		 brk #$10
$0b:9076  00 03		 brk #$03
$0b:9078  00 01		 brk #$01
$0b:907a  01 01		 ora ($01,x)
$0b:907c  00 0f		 brk #$0f
$0b:907e  06 0a		 asl $0a
$0b:9080  01 02		 ora ($02,x)
$0b:9082  00 0a		 brk #$0a
$0b:9084  05 c0		 ora $c0
$0b:9086  0b			phd
$0b:9087  01 00		 ora ($00,x)
$0b:9089  02 0f		 cop #$0f
$0b:908b  00 c4		 brk #$c4
$0b:908d  4a			lsr a
$0b:908e  ff ff 12 00   sbc $0012ff,x
$0b:9092  1f 00 01 00   ora $000100,x
$0b:9096  10 00		 bpl $9098
$0b:9098  10 00		 bpl $909a
$0b:909a  03 00		 ora $00,s
$0b:909c  01 00		 ora ($00,x)
$0b:909e  01 00		 ora ($00,x)
$0b:90a0  10 06		 bpl $90a8
$0b:90a2  0a			asl a
$0b:90a3  01 01		 ora ($01,x)
$0b:90a5  00 0a		 brk #$0a
$0b:90a7  06 c0		 asl $c0
$0b:90a9  0b			phd
$0b:90aa  01 00		 ora ($00,x)
$0b:90ac  01 10		 ora ($10,x)
$0b:90ae  00 c6		 brk #$c6
$0b:90b0  4a			lsr a
$0b:90b1  ff ff 12 00   sbc $0012ff,x
$0b:90b5  1f 00 01 00   ora $000100,x
$0b:90b9  10 00		 bpl $90bb
$0b:90bb  10 00		 bpl $90bd
$0b:90bd  03 00		 ora $00,s
$0b:90bf  01 00		 ora ($00,x)
$0b:90c1  01 00		 ora ($00,x)
$0b:90c3  10 06		 bpl $90cb
$0b:90c5  0a			asl a
$0b:90c6  01 01		 ora ($01,x)
$0b:90c8  00 0a		 brk #$0a
$0b:90ca  06 c0		 asl $c0
$0b:90cc  0b			phd
$0b:90cd  01 00		 ora ($00,x)
$0b:90cf  01 10		 ora ($10,x)
$0b:90d1  00 c8		 brk #$c8
$0b:90d3  4a			lsr a
$0b:90d4  ff ff 12 00   sbc $0012ff,x
$0b:90d8  1e 00 01	  asl $0100,x
$0b:90db  00 10		 brk #$10
$0b:90dd  00 10		 brk #$10
$0b:90df  00 03		 brk #$03
$0b:90e1  00 01		 brk #$01
$0b:90e3  00 01		 brk #$01
$0b:90e5  00 0f		 brk #$0f
$0b:90e7  06 0a		 asl $0a
$0b:90e9  01 01		 ora ($01,x)
$0b:90eb  00 0a		 brk #$0a
$0b:90ed  05 c0		 ora $c0
$0b:90ef  0b			phd
$0b:90f0  01 00		 ora ($00,x)
$0b:90f2  01 0f		 ora ($0f,x)
$0b:90f4  00 ca		 brk #$ca
$0b:90f6  4a			lsr a
$0b:90f7  ff ff 12 00   sbc $0012ff,x
$0b:90fb  1f 00 01 00   ora $000100,x
$0b:90ff  10 00		 bpl $9101
$0b:9101  10 00		 bpl $9103
$0b:9103  03 00		 ora $00,s
$0b:9105  01 00		 ora ($00,x)
$0b:9107  01 00		 ora ($00,x)
$0b:9109  10 06		 bpl $9111
$0b:910b  0a			asl a
$0b:910c  01 01		 ora ($01,x)
$0b:910e  00 0a		 brk #$0a
$0b:9110  06 c0		 asl $c0
$0b:9112  0b			phd
$0b:9113  01 00		 ora ($00,x)
$0b:9115  01 10		 ora ($10,x)
$0b:9117  00 cc		 brk #$cc
$0b:9119  4a			lsr a
$0b:911a  00 00		 brk #$00
$0b:911c  11 00		 ora ($00),y
$0b:911e  1f 00 00 00   ora $000000,x
$0b:9122  10 00		 bpl $9124
$0b:9124  10 00		 bpl $9126
$0b:9126  03 00		 ora $00,s
$0b:9128  01 00		 ora ($00,x)
$0b:912a  01 00		 ora ($00,x)
$0b:912c  0f 06 0a 01   ora $010a06
$0b:9130  01 00		 ora ($00,x)
$0b:9132  0a			asl a
$0b:9133  05 c0		 ora $c0
$0b:9135  0b			phd
$0b:9136  01 00		 ora ($00,x)
$0b:9138  01 0f		 ora ($0f,x)
$0b:913a  00 ae		 brk #$ae
$0b:913c  0a			asl a
$0b:913d  01 00		 ora ($00,x)
$0b:913f  10 00		 bpl $9141
$0b:9141  1f 00 02 00   ora $000200,x
$0b:9145  10 00		 bpl $9147
$0b:9147  10 00		 bpl $9149
$0b:9149  03 00		 ora $00,s
$0b:914b  01 01		 ora ($01,x)
$0b:914d  00 00		 brk #$00
$0b:914f  11 04		 ora ($04),y
$0b:9151  0a			asl a
$0b:9152  01 00		 ora ($00,x)
$0b:9154  01 0b		 ora ($0b,x)
$0b:9156  06 c4		 asl $c4
$0b:9158  0b			phd
$0b:9159  01 00		 ora ($00,x)
$0b:915b  01 11		 ora ($11,x)
$0b:915d  00 cc		 brk #$cc
$0b:915f  0a			asl a
$0b:9160  01 00		 ora ($00,x)
$0b:9162  10 00		 bpl $9164
$0b:9164  1f 00 02 00   ora $000200,x
$0b:9168  10 00		 bpl $916a
$0b:916a  10 00		 bpl $916c
$0b:916c  03 00		 ora $00,s
$0b:916e  01 01		 ora ($01,x)
$0b:9170  00 00		 brk #$00
$0b:9172  11 04		 ora ($04),y
$0b:9174  0a			asl a
$0b:9175  01 00		 ora ($00,x)
$0b:9177  01 0b		 ora ($0b,x)
$0b:9179  06 c4		 asl $c4
$0b:917b  0b			phd
$0b:917c  01 01		 ora ($01,x)
$0b:917e  00 11		 brk #$11
$0b:9180  00 c2		 brk #$c2
$0b:9182  0a			asl a
$0b:9183  01 00		 ora ($00,x)
$0b:9185  10 00		 bpl $9187
$0b:9187  1e 00 02	  asl $0200,x
$0b:918a  00 10		 brk #$10
$0b:918c  00 10		 brk #$10
$0b:918e  00 03		 brk #$03
$0b:9190  00 01		 brk #$01
$0b:9192  01 00		 ora ($00,x)
$0b:9194  00 10		 brk #$10
$0b:9196  04 0a		 tsb $0a
$0b:9198  01 00		 ora ($00,x)
$0b:919a  01 0b		 ora ($0b,x)
$0b:919c  05 c4		 ora $c4
$0b:919e  0b			phd
$0b:919f  01 01		 ora ($01,x)
$0b:91a1  00 10		 brk #$10
$0b:91a3  00 c4		 brk #$c4
$0b:91a5  0a			asl a
$0b:91a6  01 00		 ora ($00,x)
$0b:91a8  10 00		 bpl $91aa
$0b:91aa  1f 00 02 00   ora $000200,x
$0b:91ae  10 00		 bpl $91b0
$0b:91b0  10 00		 bpl $91b2
$0b:91b2  03 00		 ora $00,s
$0b:91b4  01 01		 ora ($01,x)
$0b:91b6  00 00		 brk #$00
$0b:91b8  11 04		 ora ($04),y
$0b:91ba  0a			asl a
$0b:91bb  01 00		 ora ($00,x)
$0b:91bd  01 0b		 ora ($0b,x)
$0b:91bf  06 c4		 asl $c4
$0b:91c1  0b			phd
$0b:91c2  01 01		 ora ($01,x)
$0b:91c4  00 11		 brk #$11
$0b:91c6  00 c6		 brk #$c6
$0b:91c8  0a			asl a
$0b:91c9  01 00		 ora ($00,x)
$0b:91cb  10 00		 bpl $91cd
$0b:91cd  1f 00 02 00   ora $000200,x
$0b:91d1  10 00		 bpl $91d3
$0b:91d3  10 00		 bpl $91d5
$0b:91d5  03 00		 ora $00,s
$0b:91d7  01 01		 ora ($01,x)
$0b:91d9  00 00		 brk #$00
$0b:91db  11 04		 ora ($04),y
$0b:91dd  0a			asl a
$0b:91de  01 00		 ora ($00,x)
$0b:91e0  01 0b		 ora ($0b,x)
$0b:91e2  06 c4		 asl $c4
$0b:91e4  0b			phd
$0b:91e5  01 01		 ora ($01,x)
$0b:91e7  00 11		 brk #$11
$0b:91e9  00 c8		 brk #$c8
$0b:91eb  0a			asl a
$0b:91ec  01 00		 ora ($00,x)
$0b:91ee  10 00		 bpl $91f0
$0b:91f0  1e 00 02	  asl $0200,x
$0b:91f3  00 10		 brk #$10
$0b:91f5  00 10		 brk #$10
$0b:91f7  00 03		 brk #$03
$0b:91f9  00 01		 brk #$01
$0b:91fb  01 00		 ora ($00,x)
$0b:91fd  00 10		 brk #$10
$0b:91ff  04 0a		 tsb $0a
$0b:9201  01 00		 ora ($00,x)
$0b:9203  01 0b		 ora ($0b,x)
$0b:9205  05 c4		 ora $c4
$0b:9207  0b			phd
$0b:9208  01 01		 ora ($01,x)
$0b:920a  00 10		 brk #$10
$0b:920c  00 ca		 brk #$ca
$0b:920e  0a			asl a
$0b:920f  01 00		 ora ($00,x)
$0b:9211  10 00		 bpl $9213
$0b:9213  1f 00 00 00   ora $000000,x
$0b:9217  10 00		 bpl $9219
$0b:9219  10 00		 bpl $921b
$0b:921b  03 00		 ora $00,s
$0b:921d  01 01		 ora ($01,x)
$0b:921f  00 00		 brk #$00
$0b:9221  0f 04 0a 01   ora $010a04
$0b:9225  00 01		 brk #$01
$0b:9227  0b			phd
$0b:9228  04 c4		 tsb $c4
$0b:922a  0b			phd
$0b:922b  01 01		 ora ($01,x)
$0b:922d  00 0f		 brk #$0f
$0b:922f  00 ce		 brk #$ce
$0b:9231  0a			asl a
$0b:9232  00 00		 brk #$00
$0b:9234  10 00		 bpl $9236
$0b:9236  1f 00 01 00   ora $000100,x
$0b:923a  10 00		 bpl $923c
$0b:923c  10 00		 bpl $923e
$0b:923e  03 00		 ora $00,s
$0b:9240  01 00		 ora ($00,x)
$0b:9242  00 00		 brk #$00
$0b:9244  10 00		 bpl $9246
$0b:9246  0a			asl a
$0b:9247  01 00		 ora ($00,x)
$0b:9249  00 09		 brk #$09
$0b:924b  07 c6		 ora [$c6]
$0b:924d  0b			phd
$0b:924e  01 00		 ora ($00,x)
$0b:9250  00 10		 brk #$10
$0b:9252  00 42		 brk #$42
$0b:9254  0a			asl a
$0b:9255  01 00		 ora ($00,x)
$0b:9257  10 00		 bpl $9259
$0b:9259  1f 00 01 00   ora $000100,x
$0b:925d  10 00		 bpl $925f
$0b:925f  10 00		 bpl $9261
$0b:9261  03 00		 ora $00,s
$0b:9263  01 01		 ora ($01,x)
$0b:9265  00 00		 brk #$00
$0b:9267  10 00		 bpl $9269
$0b:9269  0a			asl a
$0b:926a  01 01		 ora ($01,x)
$0b:926c  00 09		 brk #$09
$0b:926e  07 c6		 ora [$c6]
$0b:9270  0b			phd
$0b:9271  01 00		 ora ($00,x)
$0b:9273  01 10		 ora ($10,x)
$0b:9275  00 42		 brk #$42
$0b:9277  4a			lsr a
$0b:9278  00 00		 brk #$00
$0b:927a  10 00		 bpl $927c
$0b:927c  1e 00 01	  asl $0100,x
$0b:927f  00 10		 brk #$10
$0b:9281  00 10		 brk #$10
$0b:9283  00 03		 brk #$03
$0b:9285  00 01		 brk #$01
$0b:9287  00 00		 brk #$00
$0b:9289  00 0f		 brk #$0f
$0b:928b  00 0a		 brk #$0a
$0b:928d  01 00		 ora ($00,x)
$0b:928f  00 09		 brk #$09
$0b:9291  06 c6		 asl $c6
$0b:9293  0b			phd
$0b:9294  01 00		 ora ($00,x)
$0b:9296  00 0f		 brk #$0f
$0b:9298  00 44		 brk #$44
$0b:929a  0a			asl a
$0b:929b  01 00		 ora ($00,x)
$0b:929d  10 00		 bpl $929f
$0b:929f  1e 00 01	  asl $0100,x
$0b:92a2  00 10		 brk #$10
$0b:92a4  00 10		 brk #$10
$0b:92a6  00 03		 brk #$03
$0b:92a8  00 01		 brk #$01
$0b:92aa  01 00		 ora ($00,x)
$0b:92ac  00 0f		 brk #$0f
$0b:92ae  00 0a		 brk #$0a
$0b:92b0  01 01		 ora ($01,x)
$0b:92b2  00 09		 brk #$09
$0b:92b4  06 c6		 asl $c6
$0b:92b6  0b			phd
$0b:92b7  01 00		 ora ($00,x)
$0b:92b9  01 0f		 ora ($0f,x)
$0b:92bb  00 44		 brk #$44
$0b:92bd  4a			lsr a
$0b:92be  00 00		 brk #$00
$0b:92c0  10 00		 bpl $92c2
$0b:92c2  1f 00 02 00   ora $000200,x
$0b:92c6  10 00		 bpl $92c8
$0b:92c8  10 00		 bpl $92ca
$0b:92ca  03 00		 ora $00,s
$0b:92cc  01 00		 ora ($00,x)
$0b:92ce  00 00		 brk #$00
$0b:92d0  11 00		 ora ($00),y
$0b:92d2  0a			asl a
$0b:92d3  01 00		 ora ($00,x)
$0b:92d5  00 09		 brk #$09
$0b:92d7  08			php
$0b:92d8  c6 0b		 dec $0b
$0b:92da  01 00		 ora ($00,x)
$0b:92dc  00 11		 brk #$11
$0b:92de  00 46		 brk #$46
$0b:92e0  0a			asl a
$0b:92e1  01 00		 ora ($00,x)
$0b:92e3  10 00		 bpl $92e5
$0b:92e5  1f 00 02 00   ora $000200,x
$0b:92e9  10 00		 bpl $92eb
$0b:92eb  10 00		 bpl $92ed
$0b:92ed  03 00		 ora $00,s
$0b:92ef  01 01		 ora ($01,x)
$0b:92f1  00 00		 brk #$00
$0b:92f3  11 00		 ora ($00),y
$0b:92f5  0a			asl a
$0b:92f6  01 01		 ora ($01,x)
$0b:92f8  00 09		 brk #$09
$0b:92fa  08			php
$0b:92fb  c6 0b		 dec $0b
$0b:92fd  01 00		 ora ($00,x)
$0b:92ff  01 11		 ora ($11,x)
$0b:9301  00 46		 brk #$46
$0b:9303  4a			lsr a
$0b:9304  00 00		 brk #$00
$0b:9306  11 00		 ora ($00),y
$0b:9308  20 00 00	  jsr $0000
$0b:930b  00 10		 brk #$10
$0b:930d  00 10		 brk #$10
$0b:930f  00 03		 brk #$03
$0b:9311  00 01		 brk #$01
$0b:9313  01 00		 ora ($00,x)
$0b:9315  00 10		 brk #$10
$0b:9317  00 0a		 brk #$0a
$0b:9319  01 01		 ora ($01,x)
$0b:931b  00 09		 brk #$09
$0b:931d  07 c6		 ora [$c6]
$0b:931f  0b			phd
$0b:9320  01 00		 ora ($00,x)
$0b:9322  01 10		 ora ($10,x)
$0b:9324  00 60		 brk #$60
$0b:9326  0b			phd
$0b:9327  02 00		 cop #$00
$0b:9329  10 00		 bpl $932b
$0b:932b  20 00 00	  jsr $0000
$0b:932e  00 10		 brk #$10
$0b:9330  00 10		 brk #$10
$0b:9332  00 03		 brk #$03
$0b:9334  00 01		 brk #$01
$0b:9336  02 00		 cop #$00
$0b:9338  00 10		 brk #$10
$0b:933a  02 0a		 cop #$0a
$0b:933c  01 00		 ora ($00,x)
$0b:933e  02 08		 cop #$08
$0b:9340  08			php
$0b:9341  c2 0b		 rep #$0b
$0b:9343  01 02		 ora ($02,x)
$0b:9345  00 10		 brk #$10
$0b:9347  00 82		 brk #$82
$0b:9349  0a			asl a
$0b:934a  02 00		 cop #$00
$0b:934c  10 00		 bpl $934e
$0b:934e  20 00 00	  jsr $0000
$0b:9351  00 10		 brk #$10
$0b:9353  00 10		 brk #$10
$0b:9355  00 03		 brk #$03
$0b:9357  00 01		 brk #$01
$0b:9359  02 00		 cop #$00
$0b:935b  00 10		 brk #$10
$0b:935d  02 0a		 cop #$0a
$0b:935f  01 00		 ora ($00,x)
$0b:9361  02 08		 cop #$08
$0b:9363  08			php
$0b:9364  c2 0b		 rep #$0b
$0b:9366  01 01		 ora ($01,x)
$0b:9368  01 10		 ora ($10,x)
$0b:936a  00 82		 brk #$82
$0b:936c  4a			lsr a
$0b:936d  02 00		 cop #$00
$0b:936f  10 00		 bpl $9371
$0b:9371  1f 00 01 00   ora $000100,x
$0b:9375  10 00		 bpl $9377
$0b:9377  10 00		 bpl $9379
$0b:9379  03 00		 ora $00,s
$0b:937b  01 02		 ora ($02,x)
$0b:937d  00 00		 brk #$00
$0b:937f  10 02		 bpl $9383
$0b:9381  0a			asl a
$0b:9382  01 00		 ora ($00,x)
$0b:9384  02 08		 cop #$08
$0b:9386  08			php
$0b:9387  c2 0b		 rep #$0b
$0b:9389  01 02		 ora ($02,x)
$0b:938b  00 10		 brk #$10
$0b:938d  00 84		 brk #$84
$0b:938f  0a			asl a
$0b:9390  02 00		 cop #$00
$0b:9392  10 00		 bpl $9394
$0b:9394  1f 00 01 00   ora $000100,x
$0b:9398  10 00		 bpl $939a
$0b:939a  10 00		 bpl $939c
$0b:939c  03 00		 ora $00,s
$0b:939e  01 02		 ora ($02,x)
$0b:93a0  00 00		 brk #$00
$0b:93a2  10 02		 bpl $93a6
$0b:93a4  0a			asl a
$0b:93a5  01 00		 ora ($00,x)
$0b:93a7  02 08		 cop #$08
$0b:93a9  08			php
$0b:93aa  c2 0b		 rep #$0b
$0b:93ac  01 01		 ora ($01,x)
$0b:93ae  01 10		 ora ($10,x)
$0b:93b0  00 84		 brk #$84
$0b:93b2  4a			lsr a
$0b:93b3  02 00		 cop #$00
$0b:93b5  10 00		 bpl $93b7
$0b:93b7  20 00 00	  jsr $0000
$0b:93ba  00 10		 brk #$10
$0b:93bc  00 10		 brk #$10
$0b:93be  00 03		 brk #$03
$0b:93c0  00 01		 brk #$01
$0b:93c2  02 00		 cop #$00
$0b:93c4  00 10		 brk #$10
$0b:93c6  02 0a		 cop #$0a
$0b:93c8  01 00		 ora ($00,x)
$0b:93ca  02 08		 cop #$08
$0b:93cc  08			php
$0b:93cd  c2 0b		 rep #$0b
$0b:93cf  01 02		 ora ($02,x)
$0b:93d1  00 10		 brk #$10
$0b:93d3  00 86		 brk #$86
$0b:93d5  0a			asl a
$0b:93d6  02 00		 cop #$00
$0b:93d8  10 00		 bpl $93da
$0b:93da  20 00 00	  jsr $0000
$0b:93dd  00 10		 brk #$10
$0b:93df  00 10		 brk #$10
$0b:93e1  00 03		 brk #$03
$0b:93e3  00 01		 brk #$01
$0b:93e5  02 00		 cop #$00
$0b:93e7  00 10		 brk #$10
$0b:93e9  02 0a		 cop #$0a
$0b:93eb  01 00		 ora ($00,x)
$0b:93ed  02 08		 cop #$08
$0b:93ef  08			php
$0b:93f0  c2 0b		 rep #$0b
$0b:93f2  01 01		 ora ($01,x)
$0b:93f4  01 10		 ora ($10,x)
$0b:93f6  00 86		 brk #$86
$0b:93f8  4a			lsr a
$0b:93f9  02 00		 cop #$00
$0b:93fb  11 00		 ora ($00),y
$0b:93fd  1f 00 00 00   ora $000000,x
$0b:9401  10 00		 bpl $9403
$0b:9403  10 00		 bpl $9405
$0b:9405  03 00		 ora $00,s
$0b:9407  01 02		 ora ($02,x)
$0b:9409  01 00		 ora ($00,x)
$0b:940b  0f 02 0a 01   ora $010a02
$0b:940f  00 03		 brk #$03
$0b:9411  08			php
$0b:9412  07 c2		 ora [$c2]
$0b:9414  0b			phd
$0b:9415  01 03		 ora ($03,x)
$0b:9417  00 0f		 brk #$0f
$0b:9419  00 80		 brk #$80
$0b:941b  0b			phd
$0b:941c  00 20		 brk #$20
$0b:941e  80 3b		 bra $945b
$0b:9420  fd fd 9a	  sbc $9afd,x
$0b:9423  7c bf 37	  jmp ($37bf,x)
$0b:9426  8f ba 9f 5a   sta $5a9fba
$0b:942a  ef 36 de 7e   sbc $7ede36
$0b:942e  53 39		 eor ($39,s),y
$0b:9430  ea			nop
$0b:9431  fc d7 2b	  jsr ($2bd7,x)
$0b:9434  97 88		 sta [$88],y
$0b:9436  04 e2		 tsb $e2
$0b:9438  01 c1		 ora ($c1,x)
$0b:943a  80 61		 bra $949d
$0b:943c  a0 13		 ldy #$13
$0b:943e  08			php
$0b:943f  05 8e		 ora $8e
$0b:9441  01 07		 ora ($07,x)
$0b:9443  80 68		 bra $94ad
$0b:9445  e0 17		 cpx #$17
$0b:9447  2f 9d 2e c7   and $c72e9d
$0b:944b  9c af 5d	  stz $5daf
$0b:944e  e3 fa		 sbc $fa,s
$0b:9450  9d 4e ab	  sta $ab4e,x
$0b:9453  c9 52 a9	  cmp #$a952
$0b:9456  ef 77 90 c8   sbc $c89077
$0b:945a  06 72		 asl $72
$0b:945c  01 e1		 ora ($e1,x)
$0b:945e  80 78		 bra $94d8
$0b:9460  20 15 68	  jsr $6815
$0b:9463  04 7e		 tsb $7e
$0b:9465  01 ac		 ora ($ac,x)
$0b:9467  80 50		 bra $94b9
$0b:9469  e0 13		 cpx #$13
$0b:946b  2f 4d 37 65   and $65374d
$0b:946f  0e ec 6b	  asl $6bec
$0b:9472  aa			tax
$0b:9473  35 ab		 and $ab,x
$0b:9475  07 86		 ora [$86]
$0b:9477  29 2d c0	  and #$c02d
$0b:947a  e4 28		 cpx $28
$0b:947c  1f f8 01 7e   ora $7e01f8,x
$0b:9480  3f c6 01 ea   and $ea01c6,x
$0b:9484  41 7d		 eor ($7d,x)
$0b:9486  70 9c		 bvs $9424
$0b:9488  ac 5a a9	  ldy $a95a
$0b:948b  13 d7		 ora ($d7,s),y
$0b:948d  ea			nop
$0b:948e  aa			tax
$0b:948f  55 5b		 eor $5b,x
$0b:9491  65 9b		 adc $9b
$0b:9493  4b			phk
$0b:9494  aa			tax
$0b:9495  fd c0 3e	  sbc $3ec0,x
$0b:9498  f0 0f		 beq $94a9
$0b:949a  5c 03 df 00   jml $00df03
$0b:949e  ab			plb
$0b:949f  c0 35		 cpy #$35
$0b:94a1  f0 0c		 beq $94af
$0b:94a3  fc 02 be	  jsr ($be02,x)
$0b:94a6  0e 9c be	  asl $be9c
$0b:94a9  73 d9		 adc ($d9,s),y
$0b:94ab  f3 ad		 sbc ($ad,s),y
$0b:94ad  55 c3		 eor $c3,x
$0b:94af  f1 60		 sbc ($60),y
$0b:94b1  81 c0		 sta ($c0,x)
$0b:94b3  21 fa		 and ($fa,x)
$0b:94b5  08			php
$0b:94b6  7f 2e 1f b6   adc $b61f2e,x
$0b:94ba  9f 56 2b 9a   sta $9a2b56,x
$0b:94be  fd ee 4b	  sbc $4bee,x
$0b:94c1  71 6c		 adc ($6c),y
$0b:94c3  bc 6c fe	  ldy $fe6c,x
$0b:94c6  ba			tsx
$0b:94c7  ad 07 c0	  lda $c007
$0b:94ca  44 22 d0	  mvp $d0,$22
$0b:94cd  a1 40		 lda ($40,x)
$0b:94cf  28			plp
$0b:94d0  f0 0c		 beq $94de
$0b:94d2  3c 02 1c	  bit $1c02,x
$0b:94d5  8c 1a 24	  sty $241a
$0b:94d8  ff 0d 7b 98   sbc $987b0d,x
$0b:94dc  7b			tdc
$0b:94dd  64 1d		 stz $1d
$0b:94df  f8			sed
$0b:94e0  57 5f		 eor [$5f],y
$0b:94e2  27 6d		 and [$6d]
$0b:94e4  83 7f		 sta $7f,s
$0b:94e6  f1 f7		 sbc ($f7),y
$0b:94e8  cf fb 7f 69   cmp $697ffb
$0b:94ec  7b			tdc
$0b:94ed  d8			cld
$0b:94ee  87 e2		 sta [$e2]
$0b:94f0  db			stp
$0b:94f1  d4 ed		 pei ($ed)
$0b:94f3  7a			ply
$0b:94f4  76 9d		 ror $9d,x
$0b:94f6  39 76 97	  and $9776,y
$0b:94f9  ab			plb
$0b:94fa  4b			phk
$0b:94fb  d0 e7		 bne $94e4
$0b:94fd  bf cd f1 fd   lda $fdf1cd,x
$0b:9501  ff fe ff ff   sbc $fffffe,x
$0b:9505  7f ff bf ff   adc $ffbfff,x
$0b:9509  df ff ef ee   cmp $eeefff,x
$0b:950d  e7 c9		 sbc [$c9]
$0b:950f  f4 26 3b	  pea $3b26
$0b:9512  4f 55 87 bd   eor $bd8755
$0b:9516  c0 7f		 cpy #$7f
$0b:9518  c7 3f		 cmp [$3f]
$0b:951a  ff 9f ff cf   sbc $cfff9f,x
$0b:951e  ff f5 b9 3e   sbc $3eb9f5,x
$0b:9522  ea			nop
$0b:9523  97 2b		 sta [$2b],y
$0b:9525  ef d5 b2 df   sbc $dfb2d5
$0b:9529  f8			sed
$0b:952a  ed 3a 27	  sbc $273a
$0b:952d  ca			dex
$0b:952e  93 65		 sta ($65,s),y
$0b:9530  66 3f		 ror $3f
$0b:9532  ff 87 ef c9   sbc $c9ef87,x
$0b:9536  ff e0 7d b9   sbc $b97de0,x
$0b:953a  24 30		 bit $30
$0b:953c  21 87		 and ($87,x)
$0b:953e  7b			tdc
$0b:953f  83 cf		 sta $cf,s
$0b:9541  e0 4e		 cpx #$4e
$0b:9543  e5 ba		 sbc $ba
$0b:9545  0f 45 47 a9   ora $a94745
$0b:9549  cc de dd	  cpy $ddde
$0b:954c  fe 1c de	  inc $de1c,x
$0b:954f  66 ab		 ror $ab
$0b:9551  4b			phk
$0b:9552  79 ea 4f	  adc $4fea,y
$0b:9555  b9 fe f8	  lda $f8fe,y
$0b:9558  bf 5e 57 ff   lda $ff575e,x
$0b:955c  81 fd		 sta ($fd,x)
$0b:955e  e1 7c		 sbc ($7c,x)
$0b:9560  f9 9e be	  sbc $be9e,y
$0b:9563  a7 ff		 lda [$ff]
$0b:9565  81 61		 sta ($61,x)
$0b:9567  75 f9		 adc $f9,x
$0b:9569  3a			dec a
$0b:956a  fe f2 f3	  inc $f3f2,x
$0b:956d  d7 9b		 cmp [$9b],y
$0b:956f  f2 27		 sbc ($27)
$0b:9571  5f b9 37 36   eor $3637b9,x
$0b:9575  67 de		 adc [$de]
$0b:9577  90 dc		 bcc $9555
$0b:9579  20 12 0c	  jsr $0c12
$0b:957c  04 1b		 tsb $1b
$0b:957e  81 08		 sta ($08,x)
$0b:9580  c0 41		 cpy #$41
$0b:9582  74 10		 stz $10,x
$0b:9584  1d 84 03	  ora $0384,x
$0b:9587  71 00		 adc ($00),y
$0b:9589  dd 58 bc	  cmp $bc58,x
$0b:958c  75 5f		 adc $5f,x
$0b:958e  bf 4a bf 30   lda $30bf4a,x
$0b:9592  ae e9 77	  ldx $77e9
$0b:9595  db			stp
$0b:9596  ef 3f da 1b   sbc $1bda3f
$0b:959a  f8			sed
$0b:959b  c7 c7		 cmp [$c7]
$0b:959d  20 10 88	  jsr $8810
$0b:95a0  0e 82 07	  asl $0782
$0b:95a3  e2 83		 sep #$83
$0b:95a5  d0 21		 bne $95c8
$0b:95a7  f0 08		 beq $95b1
$0b:95a9  fe 01 9a	  inc $9a01,x
$0b:95ac  1d fb f5	  ora $f5fb,x
$0b:95af  cf 2d 8b ca   cmp $ca8b2d
$0b:95b3  6e ec d1	  ror $d1ec
$0b:95b6  bf b6 2f 4d   lda $4d2fb6,x
$0b:95ba  9b			txy
$0b:95bb  bb			tyx
$0b:95bc  42 d6		 wdm #$d6
$0b:95be  21 80		 and ($80,x)
$0b:95c0  f8			sed
$0b:95c1  5c 18 02 c4   jml $c40218
$0b:95c5  06 0b		 asl $0b
$0b:95c7  56 a9		 lsr $a9,x
$0b:95c9  2c f0 ad	  bit $adf0
$0b:95cc  d2 2b		 cmp ($2b)
$0b:95ce  14 9c		 trb $9c
$0b:95d0  d7 26		 cmp [$26],y
$0b:95d2  c5 69		 cmp $69
$0b:95d4  ae d3 19	  ldx $19d3
$0b:95d7  e1 b7		 sbc ($b7,x)
$0b:95d9  80 37		 bra $9612
$0b:95db  d2 6f		 cmp ($6f)
$0b:95dd  00 cb		 brk #$cb
$0b:95df  c0 36		 cpy #$36
$0b:95e1  6e 01 8b	  ror $8b01
$0b:95e4  46 b9		 lsr $b9
$0b:95e6  da			phx
$0b:95e7  fa			plx
$0b:95e8  8c 53 0b	  sty $0b53
$0b:95eb  2d d9 7f	  and $7fd9
$0b:95ee  a9 b7 cd	  lda #$cdb7
$0b:95f1  2d 8b a1	  and $a18b
$0b:95f4  c8			iny
$0b:95f5  f2 c0		 sbc ($c0)
$0b:95f7  0f e1 eb 80   ora $80ebe1
$0b:95fb  74 a0		 stz $a0,x
$0b:95fd  10 18		 bpl $9617
$0b:95ff  06 0e		 asl $0e
$0b:9601  01 9f		 ora ($9f,x)
$0b:9603  80 4f		 bra $9654
$0b:9605  e0 12		 cpx #$12
$0b:9607  58			cli
$0b:9608  ae 37 0f	  ldx $0f37
$0b:960b  a9 f6 56	  lda #$56f6
$0b:960e  af 38 4f a5   lda $a54f38
$0b:9612  6a			ror a
$0b:9613  f1 a5		 sbc ($a5),y
$0b:9615  d8			cld
$0b:9616  76 ab		 ror $ab,x
$0b:9618  3f a8 05 e2   and $e205a8,x
$0b:961c  01 13		 ora ($13,x)
$0b:961e  80 61		 bra $9681
$0b:9620  e0 10		 cpx #$10
$0b:9622  b1 20		 lda ($20),y
$0b:9624  d3 e0		 cmp ($e0,s),y
$0b:9626  1a			inc a
$0b:9627  78			sei
$0b:9628  05 62		 ora $62
$0b:962a  61 32		 adc ($32,x)
$0b:962c  85 51		 sta $51
$0b:962e  70 99		 bvs $95c9
$0b:9630  48			pha
$0b:9631  96 4b		 stx $4b,y
$0b:9633  45 6b		 eor $6b
$0b:9635  84 45		 sty $45
$0b:9637  62 7a 38	  per $ceb4
$0b:963a  07 fe		 ora [$fe]
$0b:963c  01 fd		 ora ($fd,x)
$0b:963e  80 7e		 bra $96be
$0b:9640  e0 1e		 cpx #$1e
$0b:9642  f8			sed
$0b:9643  05 f6		 ora $f6
$0b:9645  01 f7		 ora ($f7,x)
$0b:9647  22 08 fc 2c   jsl $2cfc08
$0b:964b  b0 5c		 bcs $96a9
$0b:964d  b4 5a		 ldy $5a,x
$0b:964f  55 2a		 eor $2a,x
$0b:9651  a9 54 72	  lda #$7254
$0b:9654  98			tya
$0b:9655  fa			plx
$0b:9656  9c f3 a9	  stz $a9f3
$0b:9659  6a			ror a
$0b:965a  d7 75		 cmp [$75],y
$0b:965c  43 e1		 eor $e1,s
$0b:965e  e9 80 75	  sbc #$7580
$0b:9661  60			rts
$0b:9662  1a			inc a
$0b:9663  f8			sed
$0b:9664  05 fc		 ora $fc
$0b:9666  7c 26 92	  jmp ($9226,x)
$0b:9669  ad d3 75	  lda $75d3
$0b:966c  39 6d 55	  and $556d,y
$0b:966f  f3 29		 sbc ($29,s),y
$0b:9671  e8			inx
$0b:9672  d5 5c		 cmp $5c,x
$0b:9674  34 99		 bit $99,x
$0b:9676  0a			asl a
$0b:9677  d6 8b		 dec $8b,x
$0b:9679  53 40		 eor ($40,s),y
$0b:967b  df 99 9c 7e   cmp $7e9c99,x
$0b:967f  44 d0 d2	  mvp $d2,$d0
$0b:9682  c1 65		 cmp ($65,x)
$0b:9684  d2 fa		 cmp ($fa)
$0b:9686  9d ff 5b	  sta $5bff,x
$0b:9689  fc b2 f8	  jsr ($f8b2,x)
$0b:968c  b3 18		 lda ($18,s),y
$0b:968e  19 5c 87	  ora $875c,y
$0b:9691  95 ca		 sta $ca,x
$0b:9693  0f 87 42 01   ora $014287
$0b:9697  80 80		 bra $9619
$0b:9699  40			rti
$0b:969a  e0 11		 cpx #$11
$0b:969c  f3 30		 sbc ($30,s),y
$0b:969e  f7 a0		 sbc [$a0],y
$0b:96a0  13 58		 ora ($58,s),y
$0b:96a2  05 52		 ora $52
$0b:96a4  91 b4		 sta ($b4),y
$0b:96a6  c0 74		 cpy #$74
$0b:96a8  65 36		 adc $36
$0b:96aa  bc 1d 56	  ldy $561d,x
$0b:96ad  4b			phk
$0b:96ae  5b			tcd
$0b:96af  e5 e9		 sbc $e9
$0b:96b1  60			rts
$0b:96b2  f1 68		 sbc ($68),y
$0b:96b4  b9 fc bf	  lda $bffc,y
$0b:96b7  d0 0f		 bne $96c8
$0b:96b9  e4 00		 cpx $00
$0b:96bb  3e 1b 48	  rol $481b,x
$0b:96be  07 e2		 ora [$e2]
$0b:96c0  01 e8		 ora ($e8,x)
$0b:96c2  37 06		 and [$06],y
$0b:96c4  b6 79		 ldx $79,y
$0b:96c6  f0 b6		 beq $967e
$0b:96c8  ed 2b 5e	  sbc $5e2b
$0b:96cb  9c a7 4f	  stz $4fa7
$0b:96ce  d5 27		 cmp $27,x
$0b:96d0  e8			inx
$0b:96d1  d3 35		 cmp ($35,s),y
$0b:96d3  19 7f f7	  ora $f77f,y
$0b:96d6  fd c0 1f	  sbc $1fc0,x
$0b:96d9  bf ff df ff   lda $ffdfff,x
$0b:96dd  ef ff f7 ff   sbc $fff7ff
$0b:96e1  fb			xce
$0b:96e2  ff fd ff ff   sbc $fffffd,x
$0b:96e6  90 d7		 bcc $96bf
$0b:96e8  dc 2b f4	  jml [$f42b]
$0b:96eb  9c 76 b2	  stz $b276
$0b:96ee  8f 77 e1 d2   sta $d2e177
$0b:96f2  f6 31		 inc $31,x
$0b:96f4  5f c4 23 f8   eor $f823c4,x
$0b:96f8  ed 07 58	  sbc $5807
$0b:96fb  00 ab		 brk #$ab
$0b:96fd  df c0 e7 f4   cmp $f4e7c0,x
$0b:9701  36 f3		 rol $f3,x
$0b:9703  8a			txa
$0b:9704  8c 53 11	  sty $1153
$0b:9707  4b			phk
$0b:9708  92 61		 sta ($61)
$0b:970a  6c 59 2d	  jmp ($2d59)
$0b:970d  9f 2e 7f ff   sta $ff7f2e,x
$0b:9711  0f 87 3d cc   ora $cc3d87
$0b:9715  2e 50 71	  rol $7150
$0b:9718  87 f7		 sta [$f7]
$0b:971a  ff fc ff f4   sbc $f4fffc,x
$0b:971e  e7 54		 sbc [$54]
$0b:9720  3d d5 4e	  and $4ed5,x
$0b:9723  75 95		 adc $95,x
$0b:9725  bf 54 b7 59   lda $59b754,x
$0b:9729  39 d5 4e	  and $4ed5,y
$0b:972c  f5 d3		 sbc $d3,x
$0b:972e  fd 71 78	  sbc $7871,x
$0b:9731  03 f2		 ora $f2,s
$0b:9733  e0 90		 cpx #$90
$0b:9735  0f 0b c0 82   ora $82c00b
$0b:9739  f0 23		 beq $975e
$0b:973b  95 1c		 sta $1c,x
$0b:973d  cf 53 25 d4   cmp $d42553
$0b:9741  d4 fd		 pei ($fd)
$0b:9743  2b			pld
$0b:9744  39 4c d7	  and $d74c,y
$0b:9747  54 a2 19	  mvn $19,$a2
$0b:974a  8e a7 fe	  stx $fea7
$0b:974d  07 7f		 ora [$7f]
$0b:974f  30 0d		 bmi $975e
$0b:9751  7c c0 66	  jmp ($66c0,x)
$0b:9754  12 ee		 ora ($ee)
$0b:9756  c8			iny
$0b:9757  ff 90 3f fc   sbc $fc3f90,x
$0b:975b  07 bd		 ora [$bd]
$0b:975d  21 ff		 and ($ff,x)
$0b:975f  c8			iny
$0b:9760  7b			tdc
$0b:9761  f0 1f		 beq $9782
$0b:9763  74 c7		 stz $c7,x
$0b:9765  bf 30 80 78   lda $788030,x
$0b:9769  e0 1a		 cpx #$1a
$0b:976b  38			sec
$0b:976c  06 cd		 asl $cd
$0b:976e  06 52		 asl $52
$0b:9770  04 20		 tsb $20
$0b:9772  6e d1 61	  ror $61d1
$0b:9775  33 e7		 and ($e7,s),y
$0b:9777  ed 79 f7	  sbc $f779
$0b:977a  a8			tay
$0b:977b  7f c3 1b 79   adc $791bc3,x
$0b:977f  c7 ff		 cmp [$ff]
$0b:9781  b0 f7		 bcs $977a
$0b:9783  68			pla
$0b:9784  6f e3 1f 00   adc $001fe3
$0b:9788  ef a7 c3 01   sbc $01c3a7
$0b:978c  df 81 28 05   cmp $052881,x
$0b:9790  42 49		 wdm #$49
$0b:9792  f0 fb		 beq $978f
$0b:9794  42 f2		 wdm #$f2
$0b:9796  d6 be		 dec $be,x
$0b:9798  f5 8d		 sbc $8d,x
$0b:979a  62 13 6e	  per $05b0
$0b:979d  5d d3 17	  eor $17d3,x
$0b:97a0  d6 95		 dec $95,x
$0b:97a2  ae c2 00	  ldx $00c2
$0b:97a5  bf da 55 27   lda $2755da,x
$0b:97a9  b5 c9		 lda $c9,x
$0b:97ab  a5 5a		 lda $5a
$0b:97ad  6f 56 da e5   adc $e5da56
$0b:97b1  36 37		 rol $37,x
$0b:97b3  48			pha
$0b:97b4  ad 52 5b	  lda $5b52
$0b:97b7  61 b7		 adc ($b7,x)
$0b:97b9  80 4d		 bra $9808
$0b:97bb  e0 19		 cpx #$19
$0b:97bd  78			sei
$0b:97be  06 4d		 asl $4d
$0b:97c0  06 2d		 asl $2d
$0b:97c2  f0 74		 beq $9838
$0b:97c4  95 8b		 sta $8b,x
$0b:97c6  c5 56		 cmp $56
$0b:97c8  ba			tsx
$0b:97c9  65 eb		 adc $eb
$0b:97cb  d7 18		 cmp [$18],y
$0b:97cd  fe a7 73	  inc $73a7,x
$0b:97d0  aa			tax
$0b:97d1  f2 75		 sbc ($75)
$0b:97d3  6e 9d ae	  ror $ae9d
$0b:97d6  cc 76 01	  cpy $0176
$0b:97d9  8b			phb
$0b:97da  80 78		 bra $9854
$0b:97dc  60			rts
$0b:97dd  1e 08 05	  asl $0508,x
$0b:97e0  1a			inc a
$0b:97e1  01 1f		 ora ($1f,x)
$0b:97e3  00 0c		 brk #$0c
$0b:97e5  9e 01 05	  stz $0501,x
$0b:97e8  97 f4		 sta [$f4],y
$0b:97ea  f3 f7		 sbc ($f7,s),y
$0b:97ec  9b			txy
$0b:97ed  c6 2b		 dec $2b
$0b:97ef  c1 34		 cmp ($34,x)
$0b:97f1  f4 58 ec	  pea $ec58
$0b:97f4  5d 5b 96	  eor $965b,x
$0b:97f7  e3 e1		 sbc $e1,s
$0b:97f9  f0 80		 beq $977b
$0b:97fb  58			cli
$0b:97fc  20 18 70	  jsr $7018
$0b:97ff  40			rti
$0b:9800  82 43 3b	  brl $d346
$0b:9803  00 4f		 brk #$4f
$0b:9805  04 3e		 tsb $3e
$0b:9807  01 8d		 ora ($8d,x)
$0b:9809  c0 ed		 cpy #$ed
$0b:980b  25 16		 and $16
$0b:980d  3e 16 22	  rol $2216,x
$0b:9810  d1 56		 cmp ($56),y
$0b:9812  80 55		 bra $9869
$0b:9814  69 da d8	  adc #$d8da
$0b:9817  0d 0a 03	  ora $030a
$0b:981a  7e 4f 8f	  ror $8f4f,x
$0b:981d  f6 01		 inc $01,x
$0b:981f  f7 80		 sbc [$80],y
$0b:9821  7f e0 1b f8   adc $f81be0,x
$0b:9825  07 f8		 ora [$f8]
$0b:9827  8c 32 1c	  sty $1c32
$0b:982a  47 22		 eor [$22]
$0b:982c  25 24		 and $24
$0b:982e  b8			clv
$0b:982f  46 e9		 lsr $e9
$0b:9831  dd 4c 0c	  cmp $0c4c,x
$0b:9834  8e 61 3c	  stx $3c61
$0b:9837  b3 55		 lda ($55,s),y
$0b:9839  41 21		 eor ($21,x)
$0b:983b  ff 88 7b e4   sbc $e47b88,x
$0b:983f  1d fa 56	  ora $56fa,x
$0b:9842  d7 01		 cmp [$01],y
$0b:9844  7f 31 84 99   adc $998431,x
$0b:9848  fc 1e 28	  jsr ($281e,x)
$0b:984b  5c 87 f9 48   jml $48f987
$0b:984f  a0 c4		 ldy #$c4
$0b:9851  e6 f6		 inc $f6
$0b:9853  cf 26 36 31   cmp $313626
$0b:9857  31 e0		 and ($e0),y
$0b:9859  d9 26 f9	  cmp $f926,y
$0b:985c  a9 0f 7a	  lda #$7a0f
$0b:985f  91 b7		 sta ($b7),y
$0b:9861  80 ff		 bra $9862
$0b:9863  a5 9d		 lda $9d
$0b:9865  3c 25 ee	  bit $ee25,x
$0b:9868  23 ee		 and $ee,s
$0b:986a  b0 67		 bcs $98d3
$0b:986c  e3 5e		 sbc $5e,s
$0b:986e  52 38		 eor ($38)
$0b:9870  d0 3e		 bne $98b0
$0b:9872  f0 8e		 beq $9802
$0b:9874  ec 8b 57	  cpx $578b
$0b:9877  5c ab 7a 72   jml $727aab
$0b:987b  b6 eb		 ldx $eb,y
$0b:987d  29 0c 17	  and #$170c
$0b:9880  f7 02		 sbc [$02],y
$0b:9882  80 6d		 bra $98f1
$0b:9884  6a			ror a
$0b:9885  f5 68		 sbc $68,x
$0b:9887  f6 9a		 inc $9a,x
$0b:9889  7f 39 be e8   adc $e8be39,x
$0b:988d  7c 15 ef	  jmp ($ef15,x)
$0b:9890  cd 57 a1	  cmp $a157
$0b:9893  a3 c0		 lda $c0,s
$0b:9895  7a			ply
$0b:9896  00 41		 brk #$41
$0b:9898  03 e0		 ora $e0,s
$0b:989a  41 30		 eor ($30,x)
$0b:989c  51 18		 eor ($18),y
$0b:989e  fc ce 0f	  jsr ($0fce,x)
$0b:98a1  13 97		 ora ($97,s),y
$0b:98a3  dc ef ff	  jml [$ffef]
$0b:98a6  8a			txa
$0b:98a7  a5 c7		 lda $c7
$0b:98a9  73 fa		 adc ($fa,s),y
$0b:98ab  e7 73		 sbc [$73]
$0b:98ad  3d be cb	  and $cbbe,x
$0b:98b0  55 3a		 eor $3a,x
$0b:98b2  77 1b		 adc [$1b],y
$0b:98b4  a5 c2		 lda $c2
$0b:98b6  f2 b0		 sbc ($b0)
$0b:98b8  1c 7e 02	  trb $027e
$0b:98bb  0f b0 99 de   ora $de99b0
$0b:98bf  22 7b 8d 8f   jsl $8f8d7b
$0b:98c3  03 c9		 ora $c9,s
$0b:98c5  c0 fa		 cpy #$fa
$0b:98c7  63 bf		 adc $bf,s
$0b:98c9  d0 fd		 bne $98c8
$0b:98cb  ac 27 df	  ldy $df27
$0b:98ce  17 cb		 ora [$cb],y
$0b:98d0  51 a5		 eor ($a5),y
$0b:98d2  bc ca de	  ldy $deca,x
$0b:98d5  63 e3		 adc $e3,s
$0b:98d7  74 b5		 stz $b5,x
$0b:98d9  58			cli
$0b:98da  7b			tdc
$0b:98db  dc 0f f7	  jml [$f70f]
$0b:98de  ff f1 ff fc   sbc $fcfff1,x
$0b:98e2  ff fe 7f ff   sbc $ff7ffe,x
$0b:98e6  3f ff 1f ff   and $ff1fff,x
$0b:98ea  cf ff e7 ff   cmp $ffe7ff
$0b:98ee  f8			sed
$0b:98ef  af a6 67 c3   lda $c367a6
$0b:98f3  ab			plb
$0b:98f4  61 b5		 adc ($b5,x)
$0b:98f6  94 ca		 sty $ca,x
$0b:98f8  d6 63		 dec $63,x
$0b:98fa  e0 fa		 cpx #$fa
$0b:98fc  0b			phd
$0b:98fd  03 f4		 ora $f4,s
$0b:98ff  bf 80 2b a9   lda $a92b80,x
$0b:9903  fe a2 63	  inc $63a2,x
$0b:9906  03 17		 ora $17,s
$0b:9908  85 0f		 sta $0f
$0b:990a  f5 45		 sbc $45,x
$0b:990c  ef 45 38 d0   sbc $d03845
$0b:9910  58			cli
$0b:9911  00 fe		 brk #$fe
$0b:9913  24 30		 bit $30
$0b:9915  09 cc 03	  ora #$03cc
$0b:9918  31 d4		 and ($d4),y
$0b:991a  cd f5 b3	  cmp $b3f5
$0b:991d  3d 4c f7	  and $f74c,x
$0b:9920  43 2b		 eor $2b,s
$0b:9922  d7 c3		 cmp [$c3],y
$0b:9924  74 b7		 stz $b7,x
$0b:9926  7e cb 26	  ror $26cb,x
$0b:9929  b6 ff		 ldx $ff,y
$0b:992b  00 be		 brk #$be
$0b:992d  c0 0b		 cpy #$0b
$0b:992f  e0 5f		 cpx #$5f
$0b:9931  0b			phd
$0b:9932  d1 88		 cmp ($88),y
$0b:9934  6a			ror a
$0b:9935  f0 0a		 beq $9941
$0b:9937  fc 03 9d	  jsr ($9d03,x)
$0b:993a  21 f7		 and ($f7,x)
$0b:993c  4c 7f f1	  jmp $f17f
$0b:993f  1e 34 e7	  asl $e734,x
$0b:9942  ef 18 e7 4c   sbc $4ce718
$0b:9946  72 d6		 adc ($d6)
$0b:9948  bf cd 1e 21   lda $211ecd,x
$0b:994c  bb			tyx
$0b:994d  80 20		 bra $996f
$0b:994f  0a			asl a
$0b:9950  f6 85		 inc $85,x
$0b:9952  5f fd df 1b   eor $1bdffd,x
$0b:9956  f5 c5		 sbc $c5,x
$0b:9958  5e b0 f6	  lsr $f6b0,x
$0b:995b  ac ad ef	  ldy $efad
$0b:995e  2d ec 89	  and $89ec
$0b:9961  ff a0 3f d8   sbc $d83fa0,x
$0b:9965  14 03		 trb $03
$0b:9967  be 9f 3e	  ldx $3e9f,y
$0b:996a  ac 03 6e	  ldy $6e03
$0b:996d  a7 1d		 lda [$1d]
$0b:996f  2c 03 67	  bit $6703
$0b:9972  b6 b5		 ldx $b5,y
$0b:9974  e7 2c		 sbc [$2c]
$0b:9976  71 cf		 adc ($cf),y
$0b:9978  1c bb e7	  trb $e7bb
$0b:997b  2d f9 74	  and $74f9
$0b:997e  ef 99 9b f7   sbc $f79b99
$0b:9982  96 6f		 stx $6f,y
$0b:9984  00 5f		 brk #$5f
$0b:9986  dc 22 01	  jml [$0122]
$0b:9989  4a			lsr a
$0b:998a  a4 d6		 ldy $d6
$0b:998c  29 35 ea	  and #$ea35
$0b:998f  6d 6a 92	  adc $926a
$0b:9992  d5 0c		 cmp $0c,x
$0b:9994  d7 26		 cmp [$26],y
$0b:9996  b5 89		 lda $89,x
$0b:9998  f1 4a		 sbc ($4a),y
$0b:999a  55 05		 eor $05,x
$0b:999c  b3 53		 lda ($53,s),y
$0b:999e  9a			txs
$0b:999f  f8			sed
$0b:99a0  17 c1		 ora [$c1],y
$0b:99a2  17 80		 ora [$80],y
$0b:99a4  51 20		 eor ($20),y
$0b:99a6  1a			inc a
$0b:99a7  a9 15 52	  lda #$5215
$0b:99aa  a1 6b		 lda ($6b,x)
$0b:99ac  a7 57		 lda [$57]
$0b:99ae  29 3a 39	  and #$393a
$0b:99b1  85 32		 sta $32
$0b:99b3  0d 95 ef	  ora $ef95
$0b:99b6  87 c3		 sta [$c3]
$0b:99b8  8d fd c8	  sta $c8fd
$0b:99bb  7b			tdc
$0b:99bc  f1 5f		 sbc ($5f),y
$0b:99be  5e 46 df	  lsr $df46,x
$0b:99c1  61 cf		 adc ($cf,x)
$0b:99c3  83 7e		 sta $7e,s
$0b:99c5  7a			ply
$0b:99c6  b2 a9		 lda ($a9)
$0b:99c8  4c 0b 53	  jmp $530b
$0b:99cb  08			php
$0b:99cc  a5 46		 lda $46
$0b:99ce  66 f6		 ror $f6
$0b:99d0  2f 16 22 3b   and $3b2216
$0b:99d4  31 e0		 and ($e0),y
$0b:99d6  d9 66 d9	  cmp $d966,y
$0b:99d9  ab			plb
$0b:99da  ff fe 0f ff   sbc $ff0ffe,x
$0b:99de  85 fd		 sta $fd
$0b:99e0  e4 7d		 cpx $7d
$0b:99e2  dc 0d fe	  jml [$fe0d]
$0b:99e5  61 cf		 adc ($cf,x)
$0b:99e7  a0 ef		 ldy #$ef
$0b:99e9  b2 56		 lda ($56)
$0b:99eb  d9 37 87	  cmp $8737,y
$0b:99ee  e9 0c 8c	  sbc #$8c0c
$0b:99f1  fe 3b 3c	  inc $3c3b,x
$0b:99f4  7b			tdc
$0b:99f5  6f 8a 67 f0   adc $f0678a
$0b:99f9  b9 43 69	  lda $6943,y
$0b:99fc  fc 0f 04	  jsr ($040f,x)
$0b:99ff  63 f9		 adc $f9,s
$0b:9a01  03 83		 ora $83,s
$0b:9a03  c0 38		 cpy #$38
$0b:9a05  12 0f		 ora ($0f)
$0b:9a07  04 46		 tsb $46
$0b:9a09  19 03 80	  ora $8003,y
$0b:9a0c  60			rts
$0b:9a0d  f8			sed
$0b:9a0e  13 7b		 ora ($7b,s),y
$0b:9a10  1f 83 99 3b   ora $3b9983,x
$0b:9a14  d7 54		 cmp [$54],y
$0b:9a16  fd bb 2e	  sbc $2ebb,x
$0b:9a19  b4 e7		 ldy $e7,x
$0b:9a1b  cd 19 b7	  cmp $b719
$0b:9a1e  e4 3b		 cpx $3b
$0b:9a20  ba			tsx
$0b:9a21  28			plp
$0b:9a22  f4 06 01	  pea $0106
$0b:9a25  07 e0		 ora [$e0]
$0b:9a27  4f e0 17 f8   eor $f817e0
$0b:9a2b  07 fc		 ora [$fc]
$0b:9a2d  ce 9a 6b	  dec $6b9a
$0b:9a30  0d d3 19	  ora $19d3
$0b:9a33  d9 fc 6e	  cmp $6efc,y
$0b:9a36  78			sei
$0b:9a37  f6 5c		 inc $5c,x
$0b:9a39  f7 6e		 sbc [$6e],y
$0b:9a3b  79 ca 9e	  adc $9eca,y
$0b:9a3e  dd 73 76	  cmp $7673,x
$0b:9a41  0c c4 f3	  tsb $f3c4
$0b:9a44  87 07		 sta [$07]
$0b:9a46  f0 40		 beq $9a88
$0b:9a48  3f c6 76 27   and $2776c6,x
$0b:9a4c  8c f3 67	  sty $67f3
$0b:9a4f  70 fe		 bvs $9a4f
$0b:9a51  70 fc		 bvs $9a4f
$0b:9a53  de 11 c8	  dec $c811,x
$0b:9a56  e3 ad		 sbc $ad,s
$0b:9a58  99 38 fc	  sta $fc38,y
$0b:9a5b  00 94		 brk #$94
$0b:9a5d  1f 08 61 90   ora $906108,x
$0b:9a61  13 e0		 ora ($e0,s),y
$0b:9a63  a3 0b		 lda $0b,s
$0b:9a65  f6 06		 inc $06,x
$0b:9a67  1f f0 d6 69   ora $69d6f0,x
$0b:9a6b  2a			rol a
$0b:9a6c  74 2e		 stz $2e,x
$0b:9a6e  67 12		 adc [$12]
$0b:9a70  db			stp
$0b:9a71  e8			inx
$0b:9a72  ea			nop
$0b:9a73  f5 67		 sbc $67,x
$0b:9a75  53 af		 eor ($af,s),y
$0b:9a77  74 fa		 stz $fa,x
$0b:9a79  a7 1b		 lda [$1b]
$0b:9a7b  ad ff 37	  lda $37ff
$0b:9a7e  b7 c9		 lda [$c9],y
$0b:9a80  dd f6 2f	  cmp $2ff6,x
$0b:9a83  38			sec
$0b:9a84  95 44		 sta $44,x
$0b:9a86  38			sec
$0b:9a87  b0 3e		 bcs $9ac7
$0b:9a89  0c 0f c9	  tsb $c90f
$0b:9a8c  01 a3		 ora ($a3,x)
$0b:9a8e  d0 6f		 bne $9aff
$0b:9a90  52 aa		 eor ($aa)
$0b:9a92  2e 16 bb	  rol $bb16
$0b:9a95  1f eb 75 fc   ora $fc75eb,x
$0b:9a99  de 6b ed	  dec $ed6b,x
$0b:9a9c  f2 b5		 sbc ($b5)
$0b:9a9e  78			sei
$0b:9a9f  df 47 fa b8   cmp $b8fa47,x
$0b:9aa3  ef d7 13 c1   sbc $c113d7
$0b:9aa7  88			dey
$0b:9aa8  94 47		 sty $47,x
$0b:9aaa  23 3b		 and $3b,s
$0b:9aac  cc 1f 63	  cpy $631f
$0b:9aaf  0f 00 f7 f0   ora $f0f700
$0b:9ab3  39 fd 0d	  and $0dfd,y
$0b:9ab6  b4 e2		 ldy $e2,x
$0b:9ab8  a7 14		 lda [$14]
$0b:9aba  c4 52		 cpy $52
$0b:9abc  f6 90		 inc $90,x
$0b:9abe  5f 54 4b ef   eor $ef4b54,x
$0b:9ac2  0b			phd
$0b:9ac3  9f ff df e1   sta $e1dfff,x
$0b:9ac7  cf ff fb ff   cmp $fffbff
$0b:9acb  ff 7f ff ef   sbc $efff7f,x
$0b:9acf  ff fd ff ff   sbc $fffffd,x
$0b:9ad3  3f fe ee 05   and $05eefe,x
$0b:9ad7  32 a1		 and ($a1)
$0b:9ad9  76 dc		 ror $dc,x
$0b:9adb  64 aa		 stz $aa
$0b:9add  96 9e		 stx $9e,y
$0b:9adf  55 17		 eor $17,x
$0b:9ae1  69 12 fd	  adc #$fd12
$0b:9ae4  42 c0		 wdm #$c0
$0b:9ae6  03 bf		 ora $bf,s
$0b:9ae8  01 5c		 ora ($5c,x)
$0b:9aea  db			stp
$0b:9aeb  d1 41		 cmp ($41),y
$0b:9aed  f3 ce		 sbc ($ce,s),y
$0b:9aef  bf 35 5e a5   lda $a55e35,x
$0b:9af3  2f 89 b4 c5   and $c5b489
$0b:9af7  d4 ba		 pei ($ba)
$0b:9af9  17 df		 ora [$df],y
$0b:9afb  ea			nop
$0b:9afc  7c 13 e1	  jmp ($e113,x)
$0b:9aff  07 80		 ora [$80]
$0b:9b01  4a			lsr a
$0b:9b02  e0 06		 cpx #$06
$0b:9b04  42 97		 wdm #$97
$0b:9b06  c0 20		 cpy #$20
$0b:9b08  50 0b		 bvc $9b15
$0b:9b0a  6c 63 75	  jmp ($7563)
$0b:9b0d  f1 b2		 sbc ($b2),y
$0b:9b0f  f0 f2		 beq $9b03
$0b:9b11  d0 ba		 bne $9acd
$0b:9b13  4e ff 3f	  lsr $3fff
$0b:9b16  7f 9b 40 64   adc $64409b,x
$0b:9b1a  32 04		 and ($04)
$0b:9b1c  42 a1		 wdm #$a1
$0b:9b1e  d7 bf		 cmp [$bf],y
$0b:9b20  00 ee		 brk #$ee
$0b:9b22  c8			iny
$0b:9b23  ff 90 3f cc   sbc $cc3f90,x
$0b:9b27  13 ab		 ora ($ab,s),y
$0b:9b29  2d e9 4f	  and $4fe9
$0b:9b2c  b1 b7		 lda ($b7),y
$0b:9b2e  cd 2d 8a	  cmp $8a2d
$0b:9b31  a1 c8		 lda ($c8,x)
$0b:9b33  80 78		 bra $9bad
$0b:9b35  e0 1a		 cpx #$1a
$0b:9b37  28			plp
$0b:9b38  1e c2 05	  asl $05c2,x
$0b:9b3b  b0 80		 bcs $9abd
$0b:9b3d  e0 20		 cpx #$20
$0b:9b3f  78			sei
$0b:9b40  08			php
$0b:9b41  fe 01 4a	  inc $4a01,x
$0b:9b44  17 7c		 ora [$7c],y
$0b:9b46  6e d7 95	  ror $95d7
$0b:9b49  ba			tsx
$0b:9b4a  e3 d2		 sbc $d2,s
$0b:9b4c  ae b8 bf	  ldx $bfb8
$0b:9b4f  b5 62		 lda $62,x
$0b:9b51  ff a4 d9 f6   sbc $f6d9a4,x
$0b:9b55  eb			xba
$0b:9b56  30 0a		 bmi $9b62
$0b:9b58  f9 00 63	  sbc $6300,y
$0b:9b5b  f8			sed
$0b:9b5c  08			php
$0b:9b5d  a9 08 11	  lda #$1108
$0b:9b60  01 4c		 ora ($4c,x)
$0b:9b62  80 e9		 bra $9b4d
$0b:9b64  a0 15		 ldy #$15
$0b:9b66  9d cd 4b	  sta $4bcd,x
$0b:9b69  61 2d		 adc ($2d,x)
$0b:9b6b  ec 45 bc	  cpx $bc45
$0b:9b6e  d2 df		 cmp ($df)
$0b:9b70  e5 4b		 sbc $4b
$0b:9b72  fd 29 d7	  sbc $d729,x
$0b:9b75  d5 ba		 cmp $ba,x
$0b:9b77  f0 68		 beq $9be1
$0b:9b79  04 3c		 tsb $3c
$0b:9b7b  84 30		 sty $30
$0b:9b7d  98			tya
$0b:9b7e  04 0e		 tsb $0e
$0b:9b80  01 01		 ora ($01,x)
$0b:9b82  80 54		 bra $9bd8
$0b:9b84  20 12 88	  jsr $8812
$0b:9b87  05 57		 ora $57
$0b:9b89  f9 6a bf	  sbc $bf6a,y
$0b:9b8c  d3 71		 cmp ($71,s),y
$0b:9b8e  b9 5b 45	  lda $455b,y
$0b:9b91  26 7f		 rol $7f
$0b:9b93  b2 87		 lda ($87)
$0b:9b95  e7 70		 sbc [$70]
$0b:9b97  5d 5a 83	  eor $835a,x
$0b:9b9a  1c 30 10	  trb $1030
$0b:9b9d  0f 91 81 49   ora $498191
$0b:9ba1  25 03		 and $03
$0b:9ba3  94 eb		 sty $eb,x
$0b:9ba5  31 15		 and ($15),y
$0b:9ba7  1a			inc a
$0b:9ba8  1c 9e 19	  trb $199e
$0b:9bab  ac 92 cd	  ldy $cd92
$0b:9bae  36 b4		 rol $b4,x
$0b:9bb0  b8			clv
$0b:9bb1  56 ae		 lsr $ae,x
$0b:9bb3  87 09		 sta [$09]
$0b:9bb5  fb			xce
$0b:9bb6  62 2e fc	  per $97e7
$0b:9bb9  1d f6 33	  ora $33f6,x
$0b:9bbc  e7 e4		 sbc [$e4]
$0b:9bbe  ed fd 79	  sbc $79fd
$0b:9bc1  5f af af f7   eor $f7afaf,x
$0b:9bc5  fd 21 c4	  sbc $c421,x
$0b:9bc8  72 62		 adc ($62)
$0b:9bca  72 4b		 adc ($4b)
$0b:9bcc  84 66		 sty $66
$0b:9bce  91 e2		 sta ($e2),y
$0b:9bd0  d5 cb		 cmp $cb,x
$0b:9bd2  20 95 28	  jsr $2895
$0b:9bd5  85 96		 sta $96
$0b:9bd7  c1 08		 cmp ($08,x)
$0b:9bd9  fb			xce
$0b:9bda  c0 7f		 cpy #$7f
$0b:9bdc  d7 1c		 cmp [$1c],y
$0b:9bde  7c 27 ef	  jmp ($ef27,x)
$0b:9be1  a3 ae		 lda $ae,s
$0b:9be3  c1 ff		 cmp ($ff,x)
$0b:9be5  71 7f		 adc ($7f),y
$0b:9be7  7d 7f 7f	  adc $7f7f,x
$0b:9bea  77 f4		 adc [$f4],y
$0b:9bec  5a			phy
$0b:9bed  e3 96		 sbc $96,s
$0b:9bef  9e d4 4a	  stz $4ad4,x
$0b:9bf2  1b			tcs
$0b:9bf3  b7 b4		 lda [$b4],y
$0b:9bf5  6f 68 5e ec   adc $ec5e68
$0b:9bf9  8f 2e 78 a1   sta $a1782e
$0b:9bfd  0e 04 ff	  asl $ff04
$0b:9c00  88			dey
$0b:9c01  8d 0f ff	  sta $ff0f
$0b:9c04  81 44		 sta ($44,x)
$0b:9c06  13 fc		 ora ($fc,s),y
$0b:9c08  03 ac		 ora $ac,s
$0b:9c0a  3f f5 7d 06   and $067df5,x
$0b:9c0e  f6 c5		 inc $c5,x
$0b:9c10  db			stp
$0b:9c11  b3 6d		 lda ($6d,s),y
$0b:9c13  29 76 fc	  and #$fc76
$0b:9c16  c6 8f		 dec $8f
$0b:9c18  a9 6a ee	  lda #$ee6a
$0b:9c1b  dd 31 78	  cmp $7831,x
$0b:9c1e  0b			phd
$0b:9c1f  db			stp
$0b:9c20  91 7f		 sta ($7f),y
$0b:9c22  f0 83		 beq $9ba7
$0b:9c24  11 e9		 ora ($e9),y
$0b:9c26  ec 12 be	  cpx $be12
$0b:9c29  a5 db		 lda $db
$0b:9c2b  93 aa		 sta ($aa,s),y
$0b:9c2d  ae f5 e7	  ldx $e7f5
$0b:9c30  3d 49 d7	  and $d749,x
$0b:9c33  b6 27		 ldx $27,y
$0b:9c35  bb			tyx
$0b:9c36  a2 46		 ldx #$46
$0b:9c38  78			sei
$0b:9c39  d0 0f		 bne $9c4a
$0b:9c3b  7b			tdc
$0b:9c3c  91 20		 sta ($20),y
$0b:9c3e  26 23		 rol $23
$0b:9c40  e2 4e		 sep #$4e
$0b:9c42  f7 17		 sbc [$17],y
$0b:9c44  ca			dex
$0b:9c45  57 37		 eor [$37],y
$0b:9c47  47 6f		 eor [$6f]
$0b:9c49  aa			tax
$0b:9c4a  ee a1 ff	  inc $ffa1
$0b:9c4d  0b			phd
$0b:9c4e  5f d7 2b 9e   eor $9e2bd7,x
$0b:9c52  80 7e		 bra $9cd2
$0b:9c54  20 7f c9	  jsr $c97f
$0b:9c57  9f f2 27 fc   sta $fc27f2,x
$0b:9c5b  10 84		 bpl $9be1
$0b:9c5d  03 fc		 ora $fc,s
$0b:9c5f  21 0b		 and ($0b,x)
$0b:9c61  07 ff		 ora [$ff]
$0b:9c63  4d 59 9b	  eor $9b59
$0b:9c66  ff f6 b8 aa   sbc $aab8f6,x
$0b:9c6a  97 4b		 sta [$4b],y
$0b:9c6c  53 56		 eor ($56,s),y
$0b:9c6e  b7 7f		 lda [$7f],y
$0b:9c70  f7 58		 sbc [$58],y
$0b:9c72  5a			phy
$0b:9c73  b7 12		 lda [$12],y
$0b:9c75  00 bf		 brk #$bf
$0b:9c77  17 58		 ora [$58],y
$0b:9c79  4b			phk
$0b:9c7a  57 e4		 eor [$e4],y
$0b:9c7c  ea			nop
$0b:9c7d  19 dc 03	  ora $03dc,y
$0b:9c80  65 00		 adc $00
$0b:9c82  cd fd ac	  cmp $acfd
$0b:9c85  9f ff f6 ef   sta $eff6ff,x
$0b:9c89  55 10		 eor $10,x
$0b:9c8b  ad d2 75	  lda $75d2
$0b:9c8e  be da 97	  ldx $97da,y
$0b:9c91  fc c4 a8	  jsr ($a8c4,x)
$0b:9c94  b1 db		 lda ($db),y
$0b:9c96  40			rti
$0b:9c97  22 4b f1 aa   jsl $aaf14b
$0b:9c9b  ff 20 5f 98   sbc $985f20,x
$0b:9c9f  cf ee 25 f8   cmp $f825ee
$0b:9ca3  9a			txs
$0b:9ca4  f8			sed
$0b:9ca5  69 dd 3a	  adc #$3add
$0b:9ca8  57 9a		 eor [$9a],y
$0b:9caa  2b			pld
$0b:9cab  f1 81		 sbc ($81),y
$0b:9cad  c0 20		 cpy #$20
$0b:9caf  e0 01		 cpx #$01
$0b:9cb1  83 40		 sta $40,s
$0b:9cb3  49 03 00	  eor #$0003
$0b:9cb6  8f 40 61 f0   sta $f06140
$0b:9cba  0e c5 53	  asl $53c5
$0b:9cbd  d7 26		 cmp [$26],y
$0b:9cbf  92 e4		 sta ($e4)
$0b:9cc1  3b			tsc
$0b:9cc2  5a			phy
$0b:9cc3  8b			phb
$0b:9cc4  4f cf 99 c8   eor $c899cf
$0b:9cc8  d4 e9		 pei ($e9)
$0b:9cca  2f 1d 5d fc   and $fc5d1d
$0b:9cce  03 ba		 ora $ba,s
$0b:9cd0  8b			phb
$0b:9cd1  1f ba a4 20   ora $20a4ba,x
$0b:9cd5  1c f9 86	  trb $86f9
$0b:9cd8  be a0 62	  ldx $62a0,y
$0b:9cdb  0a			asl a
$0b:9cdc  df da 35 eb   cmp $eb35da,x
$0b:9ce0  95 f7		 sta $f7,x
$0b:9ce2  e2 dd		 sep #$dd
$0b:9ce4  6b			rtl
$0b:9ce5  ff 75 f2 80   sbc $80f275,x
$0b:9ce9  d0 8d		 bne $9c78
$0b:9ceb  c1 01		 cmp ($01,x)
$0b:9ced  21 36		 and ($36,x)
$0b:9cef  84 82		 sty $82
$0b:9cf1  40			rti
$0b:9cf2  12 93		 ora ($93)
$0b:9cf4  89 26 9f	  bit #$9f26
$0b:9cf7  d5 51		 cmp $51,x
$0b:9cf9  ea			nop
$0b:9cfa  73 b7		 adc ($b7,s),y
$0b:9cfc  97 5f		 sta [$5f],y
$0b:9cfe  9f 3b 99 ab   sta $ab993b,x
$0b:9d02  0e 0c ff	  asl $ff0c
$0b:9d05  81 ed		 sta ($ed,x)
$0b:9d07  88			dey
$0b:9d08  75 e5		 adc $e5,x
$0b:9d0a  0d f0 fb	  ora $fbf0
$0b:9d0d  42 05		 wdm #$05
$0b:9d0f  29 ef 88	  and #$88ef
$0b:9d12  73 a6		 adc ($a6,s),y
$0b:9d14  3f f9 07 7a   and $7a07f9,x
$0b:9d18  42 75		 wdm #$75
$0b:9d1a  06 fa		 asl $fa
$0b:9d1c  40			rti
$0b:9d1d  37 67		 and [$67],y
$0b:9d1f  f1 d9		 sbc ($d9),y
$0b:9d21  c0 36		 cpy #$36
$0b:9d23  30 0d		 bmi $9d32
$0b:9d25  aa			tax
$0b:9d26  14 74		 trb $74
$0b:9d28  2c 90 bb	  bit $bb90
$0b:9d2b  e3 2e		 sbc $2e,s
$0b:9d2d  b8			clv
$0b:9d2e  af dc 11 26   lda $2611dc
$0b:9d32  06 f0		 asl $f0
$0b:9d34  3c af 79	  bit $79af,x
$0b:9d37  3e 38 c8	  rol $c838,x
$0b:9d3a  06 12		 asl $12
$0b:9d3c  01 94		 ora ($94,x)
$0b:9d3e  80 44		 bra $9d84
$0b:9d40  17 e5		 ora [$e5],y
$0b:9d42  d9 e4 ca	  cmp $cae4,y
$0b:9d45  b4 19		 ldy $19,x
$0b:9d47  bc 46 9b	  ldy $9b46,x
$0b:9d4a  23 4a		 and $4a,s
$0b:9d4c  e1 5d		 sbc ($5d,x)
$0b:9d4e  be d5 fe	  ldx $fed5,y
$0b:9d51  fc 2f f9	  jsr ($f92f,x)
$0b:9d54  36 80		 rol $80,x
$0b:9d56  57 d1		 eor [$d1],y
$0b:9d58  c1 00		 cmp ($00,x)
$0b:9d5a  bf c0 27 b0   lda $b027c0,x
$0b:9d5e  08			php
$0b:9d5f  4c 02 40	  jmp $4002
$0b:9d62  ac 1d 27	  ldy $271d
$0b:9d65  52 a3		 eor ($a3)
$0b:9d67  1f 13 86 2a   ora $2a8613,x
$0b:9d6b  eb			xba
$0b:9d6c  29 90 74	  and #$7490
$0b:9d6f  ba			tsx
$0b:9d70  5f ff fe 23   eor $23feff,x
$0b:9d74  ff 0b 80 78   sbc $78800b,x
$0b:9d78  0f 47 df 80   ora $80df47
$0b:9d7c  4b			phk
$0b:9d7d  55 65		 eor $65,x
$0b:9d7f  00 99		 brk #$99
$0b:9d81  fa			plx
$0b:9d82  29 db 08	  and #$08db
$0b:9d85  27 63		 and [$63]
$0b:9d87  77 43		 adc [$43],y
$0b:9d89  95 d2		 sta $d2,x
$0b:9d8b  b8			clv
$0b:9d8c  f0 4d		 beq $9ddb
$0b:9d8e  74 b6		 stz $b6,x
$0b:9d90  1f 08 3c a7   ora $a73c08,x
$0b:9d94  f2 01		 sbc ($01)
$0b:9d96  f4 80 fe	  pea $fe80
$0b:9d99  20 7d 08	  jsr $087d
$0b:9d9c  1f c2 0f df   ora $df0fc2,x
$0b:9da0  8f 5f 2f 76   sta $762f5f
$0b:9da4  ea			nop
$0b:9da5  9f b7 65 d6   sta $d665b7,x
$0b:9da9  9c f9 a3	  stz $a3f9
$0b:9dac  36 fc		 rol $fc,x
$0b:9dae  87 77		 sta [$77]
$0b:9db0  45 e0		 eor $e0
$0b:9db2  80 e0		 bra $9d94
$0b:9db4  20 f8 02	  jsr $02f8
$0b:9db7  38			sec
$0b:9db8  31 40		 and ($40),y
$0b:9dba  f2 9f		 sbc ($9f)
$0b:9dbc  fe fe b3	  inc $b3fe,x
$0b:9dbf  7b			tdc
$0b:9dc0  62 ed d9	  per $77b0
$0b:9dc3  b6 94		 ldx $94,y
$0b:9dc5  bb			tyx
$0b:9dc6  7e 63 47	  ror $4763,x
$0b:9dc9  d4 b5		 pei ($b5)
$0b:9dcb  77 6e		 adc [$6e],y
$0b:9dcd  98			tya
$0b:9dce  b8			clv
$0b:9dcf  05 cc		 ora $cc
$0b:9dd1  4e cf e4	  lsr $e4cf
$0b:9dd4  df de 67 7d   cmp $7d67de,x
$0b:9dd8  4b			phk
$0b:9dd9  b7 27		 lda [$27],y
$0b:9ddb  55 5d		 eor $5d,x
$0b:9ddd  eb			xba
$0b:9dde  ce 7a 93	  dec $937a
$0b:9de1  af 6c 4f 77   lda $774f6c
$0b:9de5  44 80 71	  mvp $71,$80
$0b:9de8  a0 1e		 ldy #$1e
$0b:9dea  f1 3a		 sbc ($3a),y
$0b:9dec  40			rti
$0b:9ded  48			pha
$0b:9dee  47 ea		 eor [$ea]
$0b:9df0  b1 5d		 lda ($5d),y
$0b:9df2  36 9d		 rol $9d,x
$0b:9df4  ef f6 e3 8f   sbc $8fe3f6
$0b:9df8  65 cf		 adc $cf
$0b:9dfa  76 e7		 ror $e7,x
$0b:9dfc  9c a9 ed	  stz $eda9
$0b:9dff  d7 37		 cmp [$37],y
$0b:9e01  1d c0 42	  ora $42c0,x
$0b:9e04  f8			sed
$0b:9e05  10 17		 bpl $9e1e
$0b:9e07  0a			asl a
$0b:9e08  10 8f		 bpl $9d99
$0b:9e0a  ab			plb
$0b:9e0b  04 b5		 tsb $b5
$0b:9e0d  4a			lsr a
$0b:9e0e  76 fb		 ror $fb,x
$0b:9e10  4a			lsr a
$0b:9e11  a5 4f		 lda $4f
$0b:9e13  5f aa e9 8e   eor $8ee9aa,x
$0b:9e17  83 c1		 sta $c1,s
$0b:9e19  61 c9		 adc ($c9,x)
$0b:9e1b  7e e0 1d	  ror $1de0,x
$0b:9e1e  78			sei
$0b:9e1f  05 2e		 ora $2e
$0b:9e21  01 af		 ora ($af,x)
$0b:9e23  80 55		 bra $9e7a
$0b:9e25  e0 12		 cpx #$12
$0b:9e27  f8			sed
$0b:9e28  04 7f		 tsb $7f
$0b:9e2a  01 0f		 ora ($0f,x)
$0b:9e2c  f8			sed
$0b:9e2d  57 60		 eor [$60],y
$0b:9e2f  1b			tcs
$0b:9e30  a8			tay
$0b:9e31  c4 22		 cpy $22
$0b:9e33  b5 46		 lda $46,x
$0b:9e35  90 65		 bcc $9e9c
$0b:9e37  75 3b		 adc $3b,x
$0b:9e39  3c 1d 52	  bit $521d,x
$0b:9e3c  4f cd 87 b6   eor $b687cd
$0b:9e40  c3 ce		 cmp $ce,s
$0b:9e42  c0 16		 cpy #$16
$0b:9e44  d8			cld
$0b:9e45  5f bf f7 cf   eor $cff7bf,x
$0b:9e49  ff e3 ff f0   sbc $f0ffe3,x
$0b:9e4d  ff d6 3c fa   sbc $fa3cd6,x
$0b:9e51  2e f6 d3	  rol $d3f6
$0b:9e54  f7 49		 sbc [$49],y
$0b:9e56  eb			xba
$0b:9e57  e9 7e d5	  sbc #$d57e
$0b:9e5a  df de 4b 7f   cmp $7f4bde,x
$0b:9e5e  a1 d5		 lda ($d5,x)
$0b:9e60  99 d2 40	  sta $40d2,y
$0b:9e63  48			pha
$0b:9e64  3a			dec a
$0b:9e65  07 fe		 ora [$fe]
$0b:9e67  a9 ff a2	  lda #$a2ff
$0b:9e6a  cf 30 57 99   cmp $995730
$0b:9e6e  cf ae 75 d8   cmp $d875ae
$0b:9e72  9a			txs
$0b:9e73  f8			sed
$0b:9e74  71 d5		 adc ($d5),y
$0b:9e76  3a			dec a
$0b:9e77  56 9b		 lsr $9b,x
$0b:9e79  ab			plb
$0b:9e7a  31 ff		 and ($ff),y
$0b:9e7c  ff 19 41 f7   sbc $f74119,x
$0b:9e80  f8			sed
$0b:9e81  79 bc 3d	  adc $3dbc,y
$0b:9e84  fe 07 ff	  inc $ff07,x
$0b:9e87  81 de		 sta ($de,x)
$0b:9e89  e0 f3		 cpx #$f3
$0b:9e8b  f8			sed
$0b:9e8c  18			clc
$0b:9e8d  b9 ef 02	  lda $02ef,y
$0b:9e90  11 25		 ora ($25),y
$0b:9e92  ca			dex
$0b:9e93  74 b4		 stz $b4,x
$0b:9e95  36 8f		 rol $8f,x
$0b:9e97  9f 2b 9b a9   sta $a99b2b,x
$0b:9e9b  d3 de		 cmp ($de,s),y
$0b:9e9d  7a			ply
$0b:9e9e  df e9 ff fe   cmp $feffe9,x
$0b:9ea2  1f fb 83 ff   ora $ff83fb,x
$0b:9ea6  c4 81		 cpy $81
$0b:9ea8  03 e7		 ora $e7,s
$0b:9eaa  cc f5 f5	  cpy $f5f5
$0b:9ead  31 38		 and ($38),y
$0b:9eaf  44 ff 54	  mvp $54,$ff
$0b:9eb2  3f d0 bc 2a   and $2abcd0,x
$0b:9eb6  bf ea 97 eb   lda $eb97ea,x
$0b:9eba  27 ba		 and [$ba]
$0b:9ebc  a9 fe 87	  lda #$87fe
$0b:9ebf  61 05		 adc ($05,x)
$0b:9ec1  80 0f		 bra $9ed2
$0b:9ec3  ca			dex
$0b:9ec4  02 40		 cop #$40
$0b:9ec6  1a			inc a
$0b:9ec7  29 00 e3	  and #$e300
$0b:9eca  d5 3c		 cmp $3c,x
$0b:9ecc  cf 53 27 d7   cmp $d72753
$0b:9ed0  d5 7d		 cmp $7d,x
$0b:9ed2  eb			xba
$0b:9ed3  39 5c df	  and $df5c,y
$0b:9ed6  5f 31 d5 cd   eor $cdd531,x
$0b:9eda  f5 bf		 sbc $bf,x
$0b:9edc  b0 0b		 bcs $9ee9
$0b:9ede  fc 02 fb	  jsr ($fb02,x)
$0b:9ee1  00 57		 brk #$57
$0b:9ee3  81 84		 sta ($84,x)
$0b:9ee5  8c 25 ff	  sty $ff25
$0b:9ee8  f7 fb		 sbc [$fb],y
$0b:9eea  ff d7 ef 7f   sbc $7fefd7,x
$0b:9eee  ff f5 7b ff   sbc $ff7bf5,x
$0b:9ef2  cf ff 77 f8   cmp $f877ff
$0b:9ef6  fd 3f 9c	  sbc $9c3f,x
$0b:9ef9  74 0f		 stz $0f,x
$0b:9efb  77 fe		 adc [$fe],y
$0b:9efd  dd 7f fd	  cmp $fd7f,x
$0b:9f00  1e 42 7f	  asl $7f42,x
$0b:9f03  1b			tcs
$0b:9f04  8f c7 f3 fc   sta $fcf3c7
$0b:9f08  e9 fd 9f	  sbc #$9ffd
$0b:9f0b  cf 77 87 d3   cmp $d38777
$0b:9f0f  f8			sed
$0b:9f10  71 38		 adc ($38),y
$0b:9f12  7e ce e1	  ror $e1ce,x
$0b:9f15  99 bc 6e	  sta $6ebc,y
$0b:9f18  f0 f3		 beq $9f0d
$0b:9f1a  6f 8c 7c 4c   adc $4c7c8c
$0b:9f1e  3c 39 9c	  bit $9c39,x
$0b:9f21  07 c3		 ora [$c3]
$0b:9f23  f0 86		 beq $9eab
$0b:9f25  41 e0		 eor ($e0,x)
$0b:9f27  18			clc
$0b:9f28  0a			asl a
$0b:9f29  07 c2		 ora [$c2]
$0b:9f2b  11 b5		 ora ($b5),y
$0b:9f2d  ba			tsx
$0b:9f2e  cd 39 36	  cmp $3639
$0b:9f31  1e b4 cb	  asl $cbb4,x
$0b:9f34  93 46		 sta ($46,s),y
$0b:9f36  ec 5a 7a	  cpx $7a5a
$0b:9f39  92 3c		 sta ($3c)
$0b:9f3b  b5 9b		 lda $9b,x
$0b:9f3d  b1 0a		 lda ($0a),y
$0b:9f3f  80 4f		 bra $9f90
$0b:9f41  d8			cld
$0b:9f42  0e 63 06	  asl $0663
$0b:9f45  08			php
$0b:9f46  77 bb		 adc [$bb],y
$0b:9f48  db			stp
$0b:9f49  98			tya
$0b:9f4a  0e c7 db	  asl $dbc7
$0b:9f4d  6e fc 6e	  ror $6efc
$0b:9f50  7b			tdc
$0b:9f51  bd 7f cf	  lda $cf7f,x
$0b:9f54  f3 f1		 sbc ($f1,s),y
$0b:9f56  a9 fe c8	  lda #$c8fe
$0b:9f59  7f ff e7 00   adc $00e7ff,x
$0b:9f5d  b9 01 c2	  lda $c201,y
$0b:9f60  d7 79		 cmp [$79],y
$0b:9f62  46 ae		 lsr $ae
$0b:9f64  39 29 8d	  and $8d29,y
$0b:9f67  5c ad bf 7f   jml $7fbfad
$0b:9f6b  45 f6		 eor $f6
$0b:9f6d  85 ee		 sta $ee
$0b:9f6f  c8			iny
$0b:9f70  f2 e7		 sbc ($e7)
$0b:9f72  9c 08 ff	  stz $ff08
$0b:9f75  02 7f		 cop #$7f
$0b:9f77  c4 9f		 cpy $9f
$0b:9f79  e0 23		 cpx #$23
$0b:9f7b  f0 08		 beq $9f85
$0b:9f7d  fe 01 82	  inc $8201,x
$0b:9f80  06 70		 asl $70
$0b:9f82  ff ea ae fd   sbc $fdaeea,x
$0b:9f86  19 ec ab	  ora $abec,y
$0b:9f89  af db f2 4d   lda $4df2db
$0b:9f8d  b5 34		 lda $34,x
$0b:9f8f  fe 86 f6	  inc $f686,x
$0b:9f92  e5 ca		 sbc $ca
$0b:9f94  9b			txy
$0b:9f95  83 42		 sta $42,s
$0b:9f97  05 ff		 ora $ff
$0b:9f99  06 80		 asl $80
$0b:9f9b  34 28		 bit $28,x
$0b:9f9d  1f f9 00 88   ora $8800f9,x
$0b:9fa1  fb			xce
$0b:9fa2  f2 2f		 sbc ($2f)
$0b:9fa4  74 c7		 stz $c7,x
$0b:9fa6  cb			wai
$0b:9fa7  1b			tcs
$0b:9fa8  ed 49 75	  sbc $7549
$0b:9fab  b7 6a		 lda [$6a],y
$0b:9fad  cf 5b 6d 79   cmp $796d5b
$0b:9fb1  e2 ce		 sep #$ce
$0b:9fb3  c4 64		 cpy $64
$0b:9fb5  3f 41 4a 5d   and $5d4a41,x
$0b:9fb9  79 d9 bd	  adc $bdd9,y
$0b:9fbc  65 56		 adc $56
$0b:9fbe  d5 8e		 cmp $8e,x
$0b:9fc0  f9 de 7c	  sbc $7cde,y
$0b:9fc3  f1 ad		 sbc ($ad),y
$0b:9fc5  36 b2		 rol $b2,x
$0b:9fc7  a7 53		 lda [$53]
$0b:9fc9  de 89 4b	  dec $4b89,x
$0b:9fcc  01 ff		 ora ($ff,x)
$0b:9fce  11 95		 ora ($95),y
$0b:9fd0  04 c8		 tsb $c8
$0b:9fd2  74 cf		 stz $cf,x
$0b:9fd4  9e ef 8d	  stz $8def,x
$0b:9fd7  50 d6		 bvc $9faf
$0b:9fd9  d9 73 bf	  cmp $bf73,y
$0b:9fdc  3c ce b3	  bit $b3ce,x
$0b:9fdf  b3 ca		 lda ($ca,s),y
$0b:9fe1  fd cd 75	  sbc $75cd,x
$0b:9fe4  c2 32		 rep #$32
$0b:9fe6  10 80		 bpl $9f68
$0b:9fe8  84 20		 sty $20
$0b:9fea  c8			iny
$0b:9feb  61 82		 adc ($82,x)
$0b:9fed  18			clc
$0b:9fee  07 85		 ora [$85]
$0b:9ff0  38			sec
$0b:9ff1  dc df 29	  jml [$29df]
$0b:9ff4  5c ed 85 b2   jml $b285ed
$0b:9ff8  ab			plb
$0b:9ff9  bb			tyx
$0b:9ffa  87 7c		 sta [$7c]
$0b:9ffc  2d 7f 5c	  and $5c7f
$0b:9fff  ae 7a 0f	  ldx $0f7a
$0b:a002  f8			sed
$0b:a003  81 ff		 sta ($ff,x)
$0b:a005  26 3f		 rol $3f
$0b:a007  c8			iny
$0b:a008  9f f2 01 fe   sta $fe01f2,x
$0b:a00c  80 ff		 bra $a00d
$0b:a00e  94 e1		 sty $e1,x
$0b:a010  60			rts
$0b:a011  ff cc 76 d1   sbc $d176cc,x
$0b:a015  5d 95 2b	  eor $2b95,x
$0b:a018  f3 d4		 sbc ($d4,s),y
$0b:a01a  b6 ed		 ldx $ed,y
$0b:a01c  69 9b 2a	  adc #$2a9b
$0b:a01f  f5 a7		 sbc $a7,x
$0b:a021  5f 60 e9 d3   eor $d3e960,x
$0b:a025  ff eb f0 83   sbc $83f0eb,x
$0b:a029  ff e0 6c 41   sbc $416ce0,x
$0b:a02d  80 fb		 bra $a02a
$0b:a02f  e2 1c		 sep #$1c
$0b:a031  79 e6 0e	  adc $0ee6,y
$0b:a034  b7 72		 lda [$72],y
$0b:a036  c2 cd		 rep #$cd
$0b:a038  bf 56 d9 24   lda $24d956,x
$0b:a03c  ef ab ef d4   sbc $d4efab
$0b:a040  f5 61		 sbc $61,x
$0b:a042  5e f9 2e	  lsr $2ef9,x
$0b:a045  1f 19 ff e4   ora $e4ff19,x
$0b:a049  18			clc
$0b:a04a  87 80		 sta [$80]
$0b:a04c  80 38		 bra $a086
$0b:a04e  87 9e		 sta [$9e]
$0b:a050  f1 82		 sbc ($82),y
$0b:a052  a2 4f		 ldx #$4f
$0b:a054  f0 d7		 beq $a02d
$0b:a056  39 d7 96	  and $96d7,y
$0b:a059  51 c7		 eor ($c7),y
$0b:a05b  97 70		 sta [$70],y
$0b:a05d  f2 d6		 sbc ($d6)
$0b:a05f  18			clc
$0b:a060  4f a3 69 44   eor $4469a3
$0b:a064  ff bf e7 ef   sbc $efe7bf,x
$0b:a068  ff fd ff e9   sbc $e9fffd,x
$0b:a06c  7b			tdc
$0b:a06d  dc 84 82	  jml [$8284]
$0b:a070  5b			tcd
$0b:a071  cc b5 72	  cpy $72b5
$0b:a074  7a			ply
$0b:a075  91 3d		 sta ($3d),y
$0b:a077  b4 d6		 ldy $d6,x
$0b:a079  ab			plb
$0b:a07a  53 d5		 eor ($d5,s),y
$0b:a07c  e2 3f		 sep #$3f
$0b:a07e  cf f1 f9 82   cmp $82f9f1
$0b:a082  87 df		 sta [$df]
$0b:a084  ff e7 ff f5   sbc $f5ffe7,x
$0b:a088  ff fb bf fe   sbc $febffb,x
$0b:a08c  17 85		 ora [$85],y
$0b:a08e  92 5e		 sta ($5e)
$0b:a090  29 35		 and #$35
$0b:a092  c9 b5		 cmp #$b5
$0b:a094  07 25		 ora [$25]
$0b:a096  1b			tcs
$0b:a097  ca			dex
$0b:a098  48			pha
$0b:a099  7e 35 8d	  ror $8d35,x
$0b:a09c  d6 2c		 dec $2c,x
$0b:a09e  3e 18 7c	  rol $7c18,x
$0b:a0a1  3e cf 07	  rol $07cf,x
$0b:a0a4  bf c1 ff 78   lda $78ffc1,x
$0b:a0a8  3d 7e 4e	  and $4e7e,x
$0b:a0ab  bf 87 75 f8   lda $f87587,x
$0b:a0af  e9 30		 sbc #$30
$0b:a0b1  74 6a		 stz $6a,x
$0b:a0b3  ec 6e 65	  cpx $656e
$0b:a0b6  10 a3		 bpl $a05b
$0b:a0b8  f1 e8		 sbc ($e8),y
$0b:a0ba  7f 7a ed b7   adc $b7ed7a,x
$0b:a0be  71 08		 adc ($08),y
$0b:a0c0  fe 5f ff	  inc $ff5f,x
$0b:a0c3  fa			plx
$0b:a0c4  3f 1f 37 83   and $83371f,x
$0b:a0c8  bd c0 ed	  lda $edc0,x
$0b:a0cb  71 3b		 adc ($3b),y
$0b:a0cd  bc 1f 1f	  ldy $1f1f,x
$0b:a0d0  8e ff 0e	  stx $0eff
$0b:a0d3  f9 7c 32	  sbc $327c,y
$0b:a0d6  fb			xce
$0b:a0d7  fe ff ff	  inc $ffff,x
$0b:a0da  7f ff fe 7e   adc $7efeff,x
$0b:a0de  7f 1f be 3e   adc $3ebe1f,x
$0b:a0e2  db			stp
$0b:a0e3  e3 5f		 sbc $5f,s
$0b:a0e5  38			sec
$0b:a0e6  87 ff		 sta [$ff]
$0b:a0e8  3e 75 2f	  rol $2f75,x
$0b:a0eb  e7 ff		 sbc [$ff]
$0b:a0ed  f1 c0		 sbc ($c0),y
$0b:a0ef  e0 7c		 cpx #$7c
$0b:a0f1  31 1f		 and ($1f),y
$0b:a0f3  b0 f8		 bcs $a0ed
$0b:a0f5  7a			ply
$0b:a0f6  7f a0 d0 fe   adc $fed0a0,x
$0b:a0fa  97 c3		 sta [$c3],y
$0b:a0fc  3f 7f cd e1   and $e1cd7f,x
$0b:a100  ec 7e 1f	  cpx $1f7e
$0b:a103  d2 44		 cmp ($44)
$0b:a105  3f ff 94 a8   and $a894ff,x
$0b:a109  7f e7 f3 ff   adc $fff3e7,x
$0b:a10d  fc 7e ff	  jsr ($ff7e,x)
$0b:a110  03 8f		 ora $8f,s
$0b:a112  c0 6c		 cpy #$6c
$0b:a114  5d 98 0e	  eor $0e98,x
$0b:a117  ba			tsx
$0b:a118  49 9b		 eor #$9b
$0b:a11a  a9 7b		 lda #$7b
$0b:a11c  6b			rtl
$0b:a11d  7c 09 1f	  jmp ($1f09,x)
$0b:a120  ee 91 ff	  inc $ff91
$0b:a123  da			phx
$0b:a124  52 e7		 eor ($e7)
$0b:a126  f0 0b		 beq $a133
$0b:a128  fb			xce
$0b:a129  00 57		 brk #$57
$0b:a12b  e0 bf		 cpx #$bf
$0b:a12d  08			php
$0b:a12e  24 01		 bit $01
$0b:a130  94 5f		 sty $5f,x
$0b:a132  bf ee fb f1   lda $f1fbee,x
$0b:a136  db			stp
$0b:a137  fe b5 02	  inc $02b5,x
$0b:a13a  ed fc 69	  sbc $69fc
$0b:a13d  85 d7		 sta $d7
$0b:a13f  13 93		 ora ($93,s),y
$0b:a141  89 87		 bit #$87
$0b:a143  c8			iny
$0b:a144  3e 0d f6	  rol $f60d,x
$0b:a147  f6 7f		 inc $7f,x
$0b:a149  e5 55		 sbc $55
$0b:a14b  bf b6 3f ab   lda $ab3fb6,x
$0b:a14f  3b			tsc
$0b:a150  d3 58		 cmp ($58,s),y
$0b:a152  7e 71 4f	  ror $4f71,x
$0b:a155  7e 73 a7	  ror $a773,x
$0b:a158  ac be 50	  ldy $50be
$0b:a15b  f0 8c		 beq $a0e9
$0b:a15d  12 ff		 ora ($ff)
$0b:a15f  c6 3f		 dec $3f
$0b:a161  f0 8f		 beq $a0f2
$0b:a163  f8			sed
$0b:a164  04 6f		 tsb $6f
$0b:a166  f8			sed
$0b:a167  09 fd		 ora #$fd
$0b:a169  b7 3d		 lda [$3d],y
$0b:a16b  d5 99		 cmp $99,x
$0b:a16d  7a			ply
$0b:a16e  a3 7e		 lda $7e,s
$0b:a170  98			tya
$0b:a171  bf 52 75 4f   lda $4f7552,x
$0b:a175  f4 d6 ba	  pea $bad6
$0b:a178  ba			tsx
$0b:a179  dc 70 0c	  jml [$0c70]
$0b:a17c  21 9f		 and ($9f,x)
$0b:a17e  f8			sed
$0b:a17f  20 20 3f	  jsr $3f20
$0b:a182  f0 1f		 beq $a1a3
$0b:a184  fc 43 ff	  jsr ($ff43,x)
$0b:a187  28			plp
$0b:a188  ff dc 3f f3   sbc $f33fdc,x
$0b:a18c  2f f6 77 1f   and $1f77f6
$0b:a190  c8			iny
$0b:a191  97 c9		 sta [$c9],y
$0b:a193  69 5b		 adc #$5b
$0b:a195  aa			tax
$0b:a196  be 56 b9	  ldx $b956,y
$0b:a199  4d 8d 7a	  eor $7a8d
$0b:a19c  b6 82		 ldx $82,y
$0b:a19e  70 16		 bvs $a1b6
$0b:a1a0  87 c0		 sta [$c0]
$0b:a1a2  84 3e		 sty $3e
$0b:a1a4  0f ff 8f ff   ora $ff8fff
$0b:a1a8  e7 ff		 sbc [$ff]
$0b:a1aa  d3 d2		 cmp ($d2,s),y
$0b:a1ac  a1 be		 lda ($be,x)
$0b:a1ae  84 d8		 sty $d8
$0b:a1b0  77 5d		 adc [$5d],y
$0b:a1b2  4a			lsr a
$0b:a1b3  26 8e		 rol $8e
$0b:a1b5  2b			pld
$0b:a1b6  72 d9		 adc ($d9)
$0b:a1b8  75 39		 adc $39,x
$0b:a1ba  3b			tsc
$0b:a1bb  5c a7 c4 06   jml $06c4a7
$0b:a1bf  19 ef fc	  ora $fcef,y
$0b:a1c2  3d 52 1f	  and $1f52,x
$0b:a1c5  fc 79 88	  jsr ($8879,x)
$0b:a1c8  61 c6		 adc ($c6,x)
$0b:a1ca  a1 a5		 lda ($a5,x)
$0b:a1cc  73 6a		 adc ($6a,s),y
$0b:a1ce  be 6d 56	  ldx $566d,y
$0b:a1d1  37 d5		 and [$d5],y
$0b:a1d3  fd 9a f5	  sbc $f59a,x
$0b:a1d6  a9 ba		 lda #$ba
$0b:a1d8  5d 35 c2	  eor $c235,x
$0b:a1db  95 c4		 sta $c4,x
$0b:a1dd  98			tya
$0b:a1de  7f e7 02 c1   adc $c102e7,x
$0b:a1e2  01 80		 ora ($80,x)
$0b:a1e4  1c 23 46	  trb $4623
$0b:a1e7  41 9f		 eor ($9f,x)
$0b:a1e9  ff eb 9a ac   sbc $ac9aeb,x
$0b:a1ed  d6 56		 dec $56,x
$0b:a1ef  ab			plb
$0b:a1f0  76 ed		 ror $ed,x
$0b:a1f2  68			pla
$0b:a1f3  e4 3e		 cpx $3e
$0b:a1f5  6a			ror a
$0b:a1f6  de 76 4d	  dec $4d76,x
$0b:a1f9  7a			ply
$0b:a1fa  ee e9 6e	  inc $6ee9
$0b:a1fd  3f eb 07 ff   and $ff07eb,x
$0b:a201  11 ff		 ora ($ff),y
$0b:a203  8e 01 06	  stx $0601
$0b:a206  41 fe		 eor ($fe,x)
$0b:a208  c0 ff		 cpy #$ff
$0b:a20a  20 5f 8e	  jsr $8e5f
$0b:a20d  36 5e		 rol $5e,x
$0b:a20f  eb			xba
$0b:a210  ae de da	  ldx $dade
$0b:a213  b5 56		 lda $56,x
$0b:a215  da			phx
$0b:a216  ee ee cd	  inc $cdee
$0b:a219  99 b7 ed	  sta $edb7,y
$0b:a21c  b7 d1		 lda [$d1],y
$0b:a21e  84 08		 sty $08
$0b:a220  0a			asl a
$0b:a221  41 82		 eor ($82,x)
$0b:a223  40			rti
$0b:a224  30 63		 bmi $a289
$0b:a226  8f 66 cf 80   sta $80cf66
$0b:a22a  d4 d9		 pei ($d9)
$0b:a22c  7b			tdc
$0b:a22d  13 1a		 ora ($1a,s),y
$0b:a22f  16 df		 asl $df,x
$0b:a231  d3 1d		 cmp ($1d,s),y
$0b:a233  b6 e6		 ldx $e6,y
$0b:a235  74 55		 stz $55,x
$0b:a237  bf af be e5   lda $e5beaf,x
$0b:a23b  3e 8f 1a	  rol $1a8f,x
$0b:a23e  84 42		 sty $42
$0b:a240  10 67		 bpl $a2a9
$0b:a242  20 88 c6	  jsr $c688
$0b:a245  3d c1 86	  and $86c1,x
$0b:a248  56 f4		 lsr $f4,x
$0b:a24a  72 3e		 adc ($3e)
$0b:a24c  1d 3b 1d	  ora $1d3b,x
$0b:a24f  58			cli
$0b:a250  cc 66 fb	  cpy $fb66
$0b:a253  1e 69 2f	  asl $2f69,x
$0b:a256  56 91		 lsr $91,x
$0b:a258  a8			tay
$0b:a259  cb			wai
$0b:a25a  ff 3f ef f0   sbc $f0ef3f,x
$0b:a25e  f8			sed
$0b:a25f  92 84		 sta ($84)
$0b:a261  96 1d		 stx $1d,y
$0b:a263  bf fe ff ff   lda $fffffe,x
$0b:a267  7f ff d6 a9   adc $a9d6ff,x
$0b:a26b  3d 6e 8c	  and $8c6e,x
$0b:a26e  d6 65		 dec $65,x
$0b:a270  c8			iny
$0b:a271  85 d8		 sta $d8
$0b:a273  f8			sed
$0b:a274  34 ad		 bit $ad,x
$0b:a276  0c 57 91	  tsb $9157
$0b:a279  48			pha
$0b:a27a  de 6d ff	  dec $ff6d,x
$0b:a27d  f2 ff		 sbc ($ff)
$0b:a27f  ff 3f ff f7   sbc $f7ff3f,x
$0b:a283  ff 89 9a 91   sbc $919a89,x
$0b:a287  00 18		 brk #$18
$0b:a289  06 42		 asl $42
$0b:a28b  1f 2e 8f ca   ora $ca8f2e,x
$0b:a28f  22 f6 09 85   jsl $8509f6
$0b:a293  7e 7f 1d	  ror $1d7f,x
$0b:a296  a0 09		 ldy #$09
$0b:a298  8b			phb
$0b:a299  c1 e0		 cmp ($e0,x)
$0b:a29b  e0 11		 cpx #$11
$0b:a29d  47 1f		 eor [$1f]
$0b:a29f  80 25		 bra $a2c6
$0b:a2a1  06 ff		 asl $ff
$0b:a2a3  01 cb		 ora ($cb,x)
$0b:a2a5  80 c0		 bra $a267
$0b:a2a7  a0 10		 ldy #$10
$0b:a2a9  1f c7 cf e9   ora $e9cfc7,x
$0b:a2ad  07 f9		 ora [$f9]
$0b:a2af  42 20		 wdm #$20
$0b:a2b1  bf 7f b7 e2   lda $e2b77f,x
$0b:a2b5  15 fe		 ora $fe,x
$0b:a2b7  13 0c		 ora ($0c,s),y
$0b:a2b9  1e 07 0f	  asl $0f07,x
$0b:a2bc  80 c3		 bra $a281
$0b:a2be  e0 1f		 cpx #$1f
$0b:a2c0  d8			cld
$0b:a2c1  11 9c		 ora ($9c),y
$0b:a2c3  1d 41 76	  ora $7641,x
$0b:a2c6  bd e5 b1	  lda $b1e5,x
$0b:a2c9  7a			ply
$0b:a2ca  6c dd 5a	  jmp ($5add)
$0b:a2cd  77 e6		 adc [$e6],y
$0b:a2cf  cd e1 b7	  cmp $b7e1
$0b:a2d2  77 68		 adc [$68],y
$0b:a2d4  59 c4 30	  eor $30c4,y
$0b:a2d7  1f 0b 82 00   ora $00820b,x
$0b:a2db  50 80		 bvc $a25d
$0b:a2dd  81 61		 sta ($61,x)
$0b:a2df  20 7d ef	  jsr $ef7d
$0b:a2e2  f7 ff		 sbc [$ff],y
$0b:a2e4  b7 fa		 lda [$fa],y
$0b:a2e6  bf de fe fe   lda $fefede,x
$0b:a2ea  fb			xce
$0b:a2eb  1f af f7 f2   ora $f2f7af,x
$0b:a2ef  e7 f7		 sbc [$f7]
$0b:a2f1  ff dd ff f7   sbc $f7ffdd,x
$0b:a2f5  64 a8		 stz $a8
$0b:a2f7  7f bb ff ce   adc $ceffbb,x
$0b:a2fb  c7 f3		 cmp [$f3]
$0b:a2fd  fd f9 bf	  sbc $bff9,x
$0b:a300  fc 27 fe	  jsr ($fe27,x)
$0b:a303  1a			inc a
$0b:a304  56 da		 lsr $da,x
$0b:a306  1f d2 d6 54   ora $54d6d2,x
$0b:a30a  ab			plb
$0b:a30b  f6 1f		 inc $1f,x
$0b:a30d  54 5a 5f	  mvn $5f,$5a
$0b:a310  82 ce 50	  brl $f3e1
$0b:a313  be 10 ff	  ldx $ff10,y
$0b:a316  8c 1f e2	  sty $e21f
$0b:a319  c0 08		 cpy #$08
$0b:a31b  7a			ply
$0b:a31c  fd ad 35	  sbc $35ad,x
$0b:a31f  dc be e6	  jml [$e6be]
$0b:a322  41 9c		 eor ($9c,x)
$0b:a324  86 ce		 stx $ce
$0b:a326  7b			tdc
$0b:a327  5f cd 46 72   eor $7246cd,x
$0b:a32b  57 b5		 eor [$b5],y
$0b:a32d  ed fb 77	  sbc $77fb
$0b:a330  d0 0b		 bne $a33d
$0b:a332  f4 02 ff	  pea $ff02
$0b:a335  00 ff		 brk #$ff
$0b:a337  40			rti
$0b:a338  27 ee		 and [$ee]
$0b:a33a  21 70		 and ($70,x)
$0b:a33c  84 fa		 sty $fa
$0b:a33e  01 5f		 ora ($5f,x)
$0b:a340  b0 5f		 bcs $a3a1
$0b:a342  68			pla
$0b:a343  5b			tcd
$0b:a344  2e 7f b3	  rol $b37f
$0b:a347  33 55		 and ($55,s),y
$0b:a349  db			stp
$0b:a34a  79 a3 3b	  adc $3ba3,y
$0b:a34d  ea			nop
$0b:a34e  0f 57 77 80   ora $807757
$0b:a352  9f bf c1 c4   sta $c4c1bf,x
$0b:a356  10 6b		 bpl $a3c3
$0b:a358  fc 20 da	  jsr ($da20,x)
$0b:a35b  00 82		 brk #$82
$0b:a35d  bf d4 fb 9a   lda $9afbd4,x
$0b:a361  db			stp
$0b:a362  97 7a		 sta [$7a],y
$0b:a364  43 f2		 eor $f2,s
$0b:a366  87 ca		 sta [$ca]
$0b:a368  3b			tsc
$0b:a369  3d 6d 9f	  and $9f6d,x
$0b:a36c  a6 35		 ldx $35
$0b:a36e  75 c7		 adc $c7,x
$0b:a370  48			pha
$0b:a371  01 09		 ora ($09,x)
$0b:a373  ff 83 7f e1   sbc $e17f83,x
$0b:a377  9f f8 20 20   sta $2020f8,x
$0b:a37b  66 3b		 ror $3b
$0b:a37d  68			pla
$0b:a37e  a6 ce		 ldx $ce
$0b:a380  95 f9		 sta $f9,x
$0b:a382  ee 5a 76	  inc $765a
$0b:a385  74 8d		 stz $8d,x
$0b:a387  a5 3a		 lda $3a
$0b:a389  bd a4 a5	  lda $a5a4,x
$0b:a38c  fd 69 ff	  sbc $ff69,x
$0b:a38f  f1 f8		 sbc ($f8),y
$0b:a391  41 c8		 eor ($c8,x)
$0b:a393  47 03		 eor [$03]
$0b:a395  24 0c		 bit $0c
$0b:a397  0b			phd
$0b:a398  ff 5b b9 61   sbc $61b95b,x
$0b:a39c  66 d3		 ror $d3
$0b:a39e  ad 6f 12	  lda $126f
$0b:a3a1  37 55		 and [$55],y
$0b:a3a3  b7 ea		 lda [$ea],y
$0b:a3a5  ba			tsx
$0b:a3a6  98			tya
$0b:a3a7  9f ad 5b 77   sta $775bad,x
$0b:a3ab  8c ff f2	  sty $f2ff
$0b:a3ae  3f fc 0f ff   and $ff0ffc,x
$0b:a3b2  83 ff		 sta $ff,s
$0b:a3b4  80 25		 bra $a3db
$0b:a3b6  18			clc
$0b:a3b7  b4 34		 ldy $34,x
$0b:a3b9  b7 1b		 lda [$1b],y
$0b:a3bb  56 6f		 lsr $6f,x
$0b:a3bd  29 ef		 and #$ef
$0b:a3bf  db			stp
$0b:a3c0  6e 7d 78	  ror $787d
$0b:a3c3  fc a6 9a	  jsr ($9aa6,x)
$0b:a3c6  d5 cd		 cmp $cd,x
$0b:a3c8  aa			tax
$0b:a3c9  f6 a1		 inc $a1,x
$0b:a3cb  c2 a3		 rep #$a3
$0b:a3cd  a0 7f		 ldy #$7f
$0b:a3cf  ee 1f fb	  inc $fb1f
$0b:a3d2  cf fe 61 ff   cmp $ff61fe
$0b:a3d6  0f 86 be b5   ora $b5be86
$0b:a3da  5d f2 ec	  eor $ecf2,x
$0b:a3dd  b7 dc		 lda [$dc],y
$0b:a3df  dd 5d 57	  cmp $575d,x
$0b:a3e2  8f 9b fe f1   sta $f1fe9b
$0b:a3e6  b7 73		 lda [$73],y
$0b:a3e8  9e 74 07	  stz $0774,x
$0b:a3eb  f9 02 fc	  sbc $fc02,y
$0b:a3ee  50 7f		 bvc $a46f
$0b:a3f0  97 0f		 sta [$0f],y
$0b:a3f2  f4 e1 ca	  pea $cae1
$0b:a3f5  0e 50 16	  asl $1650
$0b:a3f8  0c d7 c3	  tsb $c3d7
$0b:a3fb  52 d0		 eor ($d0)
$0b:a3fd  44 69 3d	  mvp $3d,$69
$0b:a400  18			clc
$0b:a401  06 9e		 asl $9e
$0b:a403  8f 1f 86 75   sta $75861f
$0b:a407  2a			rol a
$0b:a408  76 b9		 ror $b9,x
$0b:a40a  72 a8		 adc ($a8)
$0b:a40c  95 45		 sta $45,x
$0b:a40e  f8			sed
$0b:a40f  80 7c		 bra $a48d
$0b:a411  20 7a 88	  jsr $887a
$0b:a414  3f 42 0f d5   and $d50f42,x
$0b:a418  82 5a a5	  brl $4975
$0b:a41b  39 5c b5	  and $b55c,y
$0b:a41e  52 a5		 eor ($a5)
$0b:a420  af d4 54 ba   lda $ba54d4
$0b:a424  9a			txs
$0b:a425  8f 05 57 e9   sta $e95705
$0b:a429  fb			xce
$0b:a42a  80 75		 bra $a4a1
$0b:a42c  e0 16		 cpx #$16
$0b:a42e  b8			clv
$0b:a42f  06 be		 asl $be
$0b:a431  01 57		 ora ($57,x)
$0b:a433  80 4b		 bra $a480
$0b:a435  f0 11		 beq $a448
$0b:a437  fe 04 2f	  inc $2f04,x
$0b:a43a  c1 54		 cmp ($54,x)
$0b:a43c  a0 40		 ldy #$40
$0b:a43e  7f d2 2e ec   adc $ec2ed2,x
$0b:a442  43 df		 eor $df,s
$0b:a444  d4 9d		 pei ($9d)
$0b:a446  da			phx
$0b:a447  60			rts
$0b:a448  10 28		 bpl $a472
$0b:a44a  17 3b		 ora [$3b],y
$0b:a44c  f9 bf 10	  sbc $10bf,y
$0b:a44f  a0 84		 ldy #$84
$0b:a451  ff b0 08 1c   sbc $1c08b0,x
$0b:a455  02 93		 cop #$93
$0b:a457  01 8d		 ora ($8d,x)
$0b:a459  f9 5e 61	  sbc $615e,y
$0b:a45c  45 fd		 eor $fd
$0b:a45e  f2 b7		 sbc ($b7)
$0b:a460  95 a8		 sta $a8,x
$0b:a462  1e 56 0b	  asl $0b56,x
$0b:a465  da			phx
$0b:a466  ff aa 09 50   sbc $5009aa,x
$0b:a46a  9f c8 07 ea   sta $ea07c8,x
$0b:a46e  00 2c		 brk #$2c
$0b:a470  0e fd fe	  asl $fefd
$0b:a473  21 4f		 and ($4f,x)
$0b:a475  b0 c8		 bcs $a43f
$0b:a477  75 f7		 adc $f7,x
$0b:a479  dc 7e 83	  jml [$837e]
$0b:a47c  e3 2e		 sbc $2e,s
$0b:a47e  e6 57		 inc $57
$0b:a480  f4 b8 01	  pea $01b8
$0b:a483  60			rts
$0b:a484  6f f0 19 ec   adc $ec19f0
$0b:a488  06 7f		 asl $7f
$0b:a48a  01 df		 ora ($df,x)
$0b:a48c  e0 11		 cpx #$11
$0b:a48e  c3 41		 cmp $41,s
$0b:a490  e0 bf		 cpx #$bf
$0b:a492  ff fd de 28   sbc $28defd,x
$0b:a496  af ca 15 04   lda $0415ca
$0b:a49a  ea			nop
$0b:a49b  7d 2e b0	  adc $b02e,x
$0b:a49e  39 1f ef	  and $ef1f,y
$0b:a4a1  b3 f8		 lda ($f8,s),y
$0b:a4a3  86 40		 stx $40
$0b:a4a5  23 e0		 and $e0,s
$0b:a4a7  05 55		 ora $55
$0b:a4a9  07 f6		 ora [$f6]
$0b:a4ab  03 07		 ora $07,s
$0b:a4ad  81 ff		 sta ($ff,x)
$0b:a4af  d0 01		 bne $a4b2
$0b:a4b1  26 c3		 rol $c3
$0b:a4b3  51 fa		 eor ($fa),y
$0b:a4b5  fc 7f cf	  jsr ($cf7f,x)
$0b:a4b8  ee f5 7e	  inc $7ef5
$0b:a4bb  c5 c6		 cmp $c6
$0b:a4bd  ef 97 df 1f   sbc $1fdf97
$0b:a4c1  8f b3 80 dc   sta $dc80b3
$0b:a4c5  47 27		 eor [$27]
$0b:a4c7  11 c8		 ora ($c8),y
$0b:a4c9  26 63		 rol $63
$0b:a4cb  03 c0		 ora $c0,s
$0b:a4cd  f2 70		 sbc ($70)
$0b:a4cf  30 5c		 bmi $a52d
$0b:a4d1  c8			iny
$0b:a4d2  e6 3b		 inc $3b
$0b:a4d4  c9 e3 fa	  cmp #$fae3
$0b:a4d7  73 3d		 adc ($3d,s),y
$0b:a4d9  de 1d 9e	  dec $9e1d,x
$0b:a4dc  3e c7 e0	  rol $e0c7,x
$0b:a4df  cc de 33	  cpy $33de
$0b:a4e2  38			sec
$0b:a4e3  74 b8		 stz $b8,x
$0b:a4e5  78			sei
$0b:a4e6  3f 1c 32 40   and $40321c,x
$0b:a4ea  ff f0 05 f0   sbc $f005f0,x
$0b:a4ee  fc 41 af	  jsr ($af41,x)
$0b:a4f1  e5 e1		 sbc $e1
$0b:a4f3  b7 c0		 lda [$c0],y
$0b:a4f5  73 51		 adc ($51,s),y
$0b:a4f7  69 7c 8a	  adc #$8a7c
$0b:a4fa  b9 52 cf	  lda $cf52,y
$0b:a4fd  e0 6b		 cpx #$6b
$0b:a4ff  53 6e		 eor ($6e,s),y
$0b:a501  fd 8b 59	  sbc $598b,x
$0b:a504  d2 f8		 cmp ($f8)
$0b:a506  43 fc		 eor $fc,s
$0b:a508  30 7e		 bmi $a588
$0b:a50a  8c 3f 43	  sty $433f
$0b:a50d  0f b8 43 fe   ora $fe43b8
$0b:a511  30 7f		 bmi $a592
$0b:a513  8b			phb
$0b:a514  20 21 f6	  jsr $f621
$0b:a517  8e e6 5f	  stx $5fe6
$0b:a51a  73 a0		 adc ($a0,s),y
$0b:a51c  ce 43 67	  dec $6743
$0b:a51f  3d bf ec	  and $ecbf,x
$0b:a522  a3 39		 lda $39,s
$0b:a524  aa			tax
$0b:a525  ca			dex
$0b:a526  51 78		 eor ($78),y
$0b:a528  33 f8		 and ($f8,s),y
$0b:a52a  05 fa		 ora $fa
$0b:a52c  00 ab		 brk #$ab
$0b:a52e  01 28		 ora ($28,x)
$0b:a530  4f 9c 42 ab   eor $ab429c
$0b:a534  07 38		 ora [$38]
$0b:a536  6a			ror a
$0b:a537  6e b5 59	  ror $59b5
$0b:a53a  6f cb 9f 72   adc $729fcb
$0b:a53e  b6 cd		 ldx $cd,y
$0b:a540  65 dc		 adc $dc
$0b:a542  eb			xba
$0b:a543  dc 56 6d	  jml [$6d56]
$0b:a546  ab			plb
$0b:a547  9e 40 bf	  stz $bf40,x
$0b:a54a  f8			sed
$0b:a54b  25 58		 and $58
$0b:a54d  4f d4 c1 c0   eor $c0c1d4
$0b:a551  8f e1 27 fc   sta $fc27e1
$0b:a555  89 f8 1c	  bit #$1cf8
$0b:a558  35 97		 and $97,x
$0b:a55a  5a			phy
$0b:a55b  1f 3a 6b 9b   ora $9b6b3a,x
$0b:a55f  e7 e6		 sbc [$e6]
$0b:a561  74 9b		 stz $9b,x
$0b:a563  b8			clv
$0b:a564  76 c7		 ror $c7,x
$0b:a566  b9 63 d9	  lda $d963,y
$0b:a569  d3 df		 cmp ($df,s),y
$0b:a56b  e1 30		 sbc ($30,x)
$0b:a56d  ff d8 04 43   sbc $4304d8,x
$0b:a571  40			rti
$0b:a572  13 09		 ora ($09,s),y
$0b:a574  80 aa		 bra $a520
$0b:a576  3d db 74	  and $74db,x
$0b:a579  ce 69 ab	  dec $ab69
$0b:a57c  a5 dd		 lda $dd
$0b:a57e  6a			ror a
$0b:a57f  96 dc		 stx $dc,y
$0b:a581  be cb f5	  ldx $f5cb,y
$0b:a584  63 92		 adc $92,s
$0b:a586  5d e4 5f	  eor $5fe4,x
$0b:a589  f5 20		 sbc $20,x
$0b:a58b  29 04 00	  and #$0004
$0b:a58e  1f fa 67 ff   ora $ff67fa,x
$0b:a592  39 ff cc	  and $ccff,y
$0b:a595  7f f6 b7 ad   adc $adb7f6,x
$0b:a599  55 b6		 eor $b6,x
$0b:a59b  ff ed a2 f5   sbc $f5a2ed,x
$0b:a59f  f3 94		 sbc ($94,s),y
$0b:a5a1  7d 1d ab	  adc $ab1d,x
$0b:a5a4  6d 6b f0	  adc $f06b
$0b:a5a7  db			stp
$0b:a5a8  45 a1		 eor $a1
$0b:a5aa  10 30		 bpl $a5dc
$0b:a5ac  0c e0 c8	  tsb $c8e0
$0b:a5af  31 c3		 and ($c3),y
$0b:a5b1  40			rti
$0b:a5b2  c7 bf		 cmp [$bf]
$0b:a5b4  f2 ad		 sbc ($ad)
$0b:a5b6  df 02 eb ad   cmp $adeb02,x
$0b:a5ba  ac dc f3	  ldy $f3dc
$0b:a5bd  3a			dec a
$0b:a5be  5e ec 43	  lsr $43ec,x
$0b:a5c1  5b			tcd
$0b:a5c2  da			phx
$0b:a5c3  b3 ef		 lda ($ef,s),y
$0b:a5c5  68			pla
$0b:a5c6  54 4f fc	  mvn $fc,$4f
$0b:a5c9  3b			tsc
$0b:a5ca  ff 06 41 0b   sbc $0b4106,x
$0b:a5ce  fc 28 42	  jsr ($4228,x)
$0b:a5d1  a3 d6		 lda $d6,s
$0b:a5d3  75 f6		 adc $f6,x
$0b:a5d5  f9 9a 57	  sbc $579a,y
$0b:a5d8  d2 a9		 cmp ($a9)
$0b:a5da  ba			tsx
$0b:a5db  d5 db		 cmp $db,x
$0b:a5dd  a8			tay
$0b:a5de  3e ca e7	  rol $e7ca,x
$0b:a5e1  33 6f		 and ($6f,s),y
$0b:a5e3  74 16		 stz $16,x
$0b:a5e5  85 03		 sta $03
$0b:a5e7  fd 01 51	  sbc $5101,x
$0b:a5ea  0c 47 f9	  tsb $f947
$0b:a5ed  33 54		 and ($54,s),y
$0b:a5ef  07 e2		 ora [$e2]
$0b:a5f1  17 f8		 ora [$f8],y
$0b:a5f3  be e3 79	  ldx $79e3,y
$0b:a5f6  d3 2d		 cmp ($2d,s),y
$0b:a5f8  bd e6 f7	  lda $f7e6,x
$0b:a5fb  84 e6		 sty $e6
$0b:a5fd  4c f6 f7	  jmp $f7f6
$0b:a600  8b			phb
$0b:a601  2f ab 95 3d   and $3d95ab
$0b:a605  81 7c		 sta ($7c,x)
$0b:a607  20 3f c7	  jsr $c73f
$0b:a60a  20 8a 8c	  jsr $8c8a
$0b:a60d  c2 02		 rep #$02
$0b:a60f  d0 9f		 bne $a5b0
$0b:a611  4c 6e 74	  jmp $746e
$0b:a614  cf 6e 7b bd   cmp $bd7b6e
$0b:a618  21 d9		 and ($d9,x)
$0b:a61a  b4 82		 ldy $82,x
$0b:a61c  3d a4 ab	  and $aba4,x
$0b:a61f  f4 e7 9c	  pea $9ce7
$0b:a622  08			php
$0b:a623  7e 02 7f	  ror $7f02,x
$0b:a626  00 01		 brk #$01
$0b:a628  00 a8		 brk #$a8
$0b:a62a  e1 02		 sbc ($02,x)
$0b:a62c  c1 a7		 cmp ($a7,x)
$0b:a62e  43 e5		 eor $e5,s
$0b:a630  7d 3c 8d	  adc $8d3c,x
$0b:a633  86 f7		 stx $f7
$0b:a635  83 d0		 sta $d0,s
$0b:a637  d0 63		 bne $a69c
$0b:a639  d1 fb		 cmp ($fb),y
$0b:a63b  a5 fc		 lda $fc
$0b:a63d  82 1f 08	  brl $ae5f
$0b:a640  03 08		 ora $08,s
$0b:a642  98			tya
$0b:a643  45 e0		 eor $e0
$0b:a645  80 60		 bra $a6a7
$0b:a647  20 00 c0	  jsr $c000
$0b:a64a  86 fb		 stx $fb
$0b:a64c  75 5f		 adc $5f,x
$0b:a64e  bc 67 be	  ldy $be67,x
$0b:a651  65 ff		 adc $ff
$0b:a653  e2 f7		 sep #$f7
$0b:a655  ed 53 ba	  sbc $ba53
$0b:a658  bd d4 22	  lda $22d4,x
$0b:a65b  11 2f		 ora ($2f),y
$0b:a65d  fc 11 94	  jsr ($9411,x)
$0b:a660  72 0f		 adc ($0f)
$0b:a662  ff 13 ff 8a   sbc $8aff13,x
$0b:a666  10 0c		 bpl $a674
$0b:a668  ba			tsx
$0b:a669  5f 4a f9 7b   eor $7bf94a,x
$0b:a66d  bb			tyx
$0b:a66e  5b			tcd
$0b:a66f  f9 ae b7	  sbc $b7ae,y
$0b:a672  95 54		 sta $54,x
$0b:a674  b3 d3		 lda ($d3,s),y
$0b:a676  2e bc bf	  rol $bfbc
$0b:a679  97 42		 sta [$42],y
$0b:a67b  01 fd		 ora ($fd,x)
$0b:a67d  80 4f		 bra $a6ce
$0b:a67f  60			rts
$0b:a680  1c e8 07	  trb $07e8
$0b:a683  de 01 7b	  dec $7b01,x
$0b:a686  c0 12		 cpy #$12
$0b:a688  40			rti
$0b:a689  82 14 6f	  brl $15a0
$0b:a68c  fd 8e c7	  sbc $c78e,x
$0b:a68f  95 a4		 sta $a4,x
$0b:a691  d0 66		 bne $a6f9
$0b:a693  b2 78		 lda ($78)
$0b:a695  ce 36 23	  dec $2336
$0b:a698  40			rti
$0b:a699  c0 64		 cpy #$64
$0b:a69b  bd 80 c0	  lda $c080,x
$0b:a69e  ce 30 c4	  dec $c430
$0b:a6a1  c6 8c		 dec $8c
$0b:a6a3  62 d4 e0	  per $877a
$0b:a6a6  b3 f0		 lda ($f0,s),y
$0b:a6a8  88			dey
$0b:a6a9  c5 03		 cmp $03
$0b:a6ab  bb			tyx
$0b:a6ac  24 a8		 bit $a8
$0b:a6ae  c0 31		 cpy #$31
$0b:a6b0  d8			cld
$0b:a6b1  9e ac 03	  stz $03ac,x
$0b:a6b4  47 80		 eor [$80]
$0b:a6b6  bf c1 fe f6   lda $f6fec1,x
$0b:a6ba  37 f0		 and [$f0],y
$0b:a6bc  7e ee 1f	  ror $1fee,x
$0b:a6bf  f9 1d de	  sbc $de1d,y
$0b:a6c2  07 ff		 ora [$ff]
$0b:a6c4  81 df		 sta ($df,x)
$0b:a6c6  fb			xce
$0b:a6c7  13 b9		 ora ($b9,s),y
$0b:a6c9  17 e6		 ora [$e6],y
$0b:a6cb  81 a8		 sta ($a8,x)
$0b:a6cd  c8			iny
$0b:a6ce  61 a0		 adc ($a0,x)
$0b:a6d0  52 6c		 eor ($6c)
$0b:a6d2  24 d2		 bit $d2
$0b:a6d4  21 4a		 and ($4a,x)
$0b:a6d6  80 65		 bra $a73d
$0b:a6d8  e0 1d		 cpx #$1d
$0b:a6da  dc 06 fe	  jml [$fe06]
$0b:a6dd  39 7f 8e	  and $8e7f,y
$0b:a6e0  7f 7b 1f be   adc $be1f7b,x
$0b:a6e4  07 bf		 ora [$bf]
$0b:a6e6  81 ff		 sta ($ff,x)
$0b:a6e8  c2 7f		 rep #$7f
$0b:a6ea  e1 d9		 sbc ($d9,x)
$0b:a6ec  49 2d 2f	  eor #$2f2d
$0b:a6ef  d3 35		 cmp ($35,s),y
$0b:a6f1  bb			tyx
$0b:a6f2  65 36		 adc $36
$0b:a6f4  78			sei
$0b:a6f5  f9 55 4b	  sbc $4b55,y
$0b:a6f8  eb			xba
$0b:a6f9  2c b3 61	  bit $61b3
$0b:a6fc  75 5d		 adc $5d,x
$0b:a6fe  bf 06 5f c1   lda $c15f06,x
$0b:a702  8b			phb
$0b:a703  f0 53		 beq $a758
$0b:a705  fc 1d 7f	  jsr ($7f1d,x)
$0b:a708  06 3f		 asl $3f
$0b:a70a  c1 9f		 cmp ($9f,x)
$0b:a70c  f0 57		 beq $a765
$0b:a70e  fc 1a 2f	  jsr ($2f1a,x)
$0b:a711  fc af ff	  jsr ($ffaf,x)
$0b:a714  15 ff		 ora $ff,x
$0b:a716  d4 bf		 pei ($bf)
$0b:a718  f2 8f		 sbc ($8f)
$0b:a71a  ec 9b ff	  cpx $ff9b
$0b:a71d  45 ff		 eor $ff
$0b:a71f  e4 fb		 cpx $fb
$0b:a721  e0 c1 6f	  cpx #$6fc1
$0b:a724  9c 09 be	  stz $be09
$0b:a727  72 08		 adc ($08)
$0b:a729  04 9a		 tsb $9a
$0b:a72b  13 97		 ora ($97,s),y
$0b:a72d  8b			phb
$0b:a72e  ca			dex
$0b:a72f  65 35		 adc $35
$0b:a731  3a			dec a
$0b:a732  8e 43 11	  stx $1143
$0b:a735  57 90		 eor [$90],y
$0b:a737  65 29		 adc $29
$0b:a739  56 ac		 lsr $ac,x
$0b:a73b  8f c2 1f e8   sta $e81fc2
$0b:a73f  80 75		 bra $a7b6
$0b:a741  a0 1a e8	  ldy #$e81a
$0b:a744  05 fc		 ora $fc
$0b:a746  d4 62		 pei ($62)
$0b:a748  40			rti
$0b:a749  d7 76		 cmp [$76],y
$0b:a74b  6a			ror a
$0b:a74c  7b			tdc
$0b:a74d  ce dc f3	  dec $f3dc
$0b:a750  9d a9 9a	  sta $9aa9,x
$0b:a753  5e e1 73	  lsr $73e1,x
$0b:a756  7a			ply
$0b:a757  ac 6f 89	  ldy $896f
$0b:a75a  45 04		 eor $04
$0b:a75c  24 42		 bit $42
$0b:a75e  ff 80 bf f0   sbc $f0bf80,x
$0b:a762  27 fe		 and [$fe]
$0b:a764  08			php
$0b:a765  7e ea 03	  ror $03ea,x
$0b:a768  c6 cb		 dec $cb
$0b:a76a  dd 75 db	  cmp $db75,x
$0b:a76d  db			stp
$0b:a76e  56 aa		 lsr $aa,x
$0b:a770  db			stp
$0b:a771  5d dd d5	  eor $d5dd,x
$0b:a774  37 56		 and [$56],y
$0b:a776  ac b7 26	  ldy $26b7
$0b:a779  69 38 12	  adc #$1238
$0b:a77c  01 00		 ora ($00,x)
$0b:a77e  cd 41 01	  cmp $0141
$0b:a781  24 0c		 bit $0c
$0b:a783  0f ff a9 b2   ora $b2a9ff
$0b:a787  f6 26		 inc $26,x
$0b:a789  34 2d		 bit $2d,x
$0b:a78b  bf a6 3b 6d   lda $6d3ba6,x
$0b:a78f  cc cb bb	  cpy $bbcb
$0b:a792  7b			tdc
$0b:a793  1e 56 57	  asl $5756,x
$0b:a796  dd 1e 56	  cmp $561e,x
$0b:a799  87 fe		 sta [$fe]
$0b:a79b  19 ff 83	  ora $83ff,y
$0b:a79e  19 06 08	  ora $0806,y
$0b:a7a1  68			pla
$0b:a7a2  10 60		 bpl $a804
$0b:a7a4  7f 62 7c e9   adc $e97c62,x
$0b:a7a8  c8			iny
$0b:a7a9  4c 2e 99	  jmp $992e
$0b:a7ac  7b			tdc
$0b:a7ad  7e 76 e1	  ror $e176,x
$0b:a7b0  4c a9 7c	  jmp $7ca9
$0b:a7b3  61 b8		 adc ($b8,x)
$0b:a7b5  20 42 42	  jsr $4242
$0b:a7b8  01 21		 ora ($21,x)
$0b:a7ba  fe c1 ff	  inc $ffc1,x
$0b:a7bd  21 fe		 and ($fe,x)
$0b:a7bf  01 30		 ora ($30,x)
$0b:a7c1  73 67		 adc ($67,s),y
$0b:a7c3  98			tya
$0b:a7c4  ab			plb
$0b:a7c5  c6 9b		 dec $9b
$0b:a7c7  41 54		 eor ($54,x)
$0b:a7c9  a4 52		 ldy $52
$0b:a7cb  a6 1e		 ldx $1e
$0b:a7cd  48			pha
$0b:a7ce  85 6b		 sta $6b
$0b:a7d0  45 a9		 eor $a9
$0b:a7d2  a0 40 ff	  ldy #$ff40
$0b:a7d5  10 7f		 bpl $a856
$0b:a7d7  85 7e		 sta $7e
$0b:a7d9  01 bf		 ora ($bf,x)
$0b:a7db  04 1f		 tsb $1f
$0b:a7dd  f4 18 3d	  pea $3d18
$0b:a7e0  5f 76 96 77   eor $779676,x
$0b:a7e4  cb			wai
$0b:a7e5  96 6b		 stx $6b,y
$0b:a7e7  3a			dec a
$0b:a7e8  7d 39 7d	  adc $7d39,x
$0b:a7eb  2b			pld
$0b:a7ec  75 a6		 adc $a6,x
$0b:a7ee  b2 e5		 lda ($e5)
$0b:a7f0  71 20		 adc ($20),y
$0b:a7f2  c0 e0 11	  cpy #$11e0
$0b:a7f5  0c 18 10	  tsb $1018
$0b:a7f8  5f fc 6f ff   eor $ff6ffc,x
$0b:a7fc  7e ff ea	  ror $eaff,x
$0b:a7ff  ee fa 5e	  inc $5efa
$0b:a802  e7 4e		 sbc [$4e]
$0b:a804  69 35 e5	  adc #$e535
$0b:a807  f2 fe		 sbc ($fe)
$0b:a809  9b			txy
$0b:a80a  2d ee 96	  and $96ee
$0b:a80d  0d 19 a4	  ora $a419
$0b:a810  88			dey
$0b:a811  c0 9a 08	  cpy #$089a
$0b:a814  51 53		 eor ($53),y
$0b:a816  8d 03 ff	  sta $ff03
$0b:a819  f8			sed
$0b:a81a  ff fd bf f1   sbc $f1bffd,x
$0b:a81e  af 3d 16 f7   lda $f7163d
$0b:a822  2d ef e4	  and $e4ef
$0b:a825  bd 7a 5b	  lda $5b7a,x
$0b:a828  7e eb bf	  ror $bfeb,x
$0b:a82b  49 fe e1	  eor #$e1fe
$0b:a82e  7a			ply
$0b:a82f  a2 30 c0	  ldx #$c030
$0b:a832  29 c4 d2	  and #$d2c4
$0b:a835  0c 32 81	  tsb $8132
$0b:a838  7f e5 5f f9   adc $f95fe5,x
$0b:a83c  67 bf		 adc [$bf]
$0b:a83e  23 ff		 and $ff,s
$0b:a840  b7 79		 lda [$79],y
$0b:a842  fa			plx
$0b:a843  bf 79 a6 f2   lda $f2a679,x
$0b:a847  93 c1		 sta ($c1,s),y
$0b:a849  ab			plb
$0b:a84a  34 00		 bit $00,x
$0b:a84c  88			dey
$0b:a84d  71 84		 adc ($84),y
$0b:a84f  20 d0 ff	  jsr $ffd0
$0b:a852  f3 ef		 sbc ($ef,s),y
$0b:a854  fe 21 4e	  inc $4e21,x
$0b:a857  31 ef		 and ($ef),y
$0b:a859  34 d7		 bit $d7,x
$0b:a85b  8f e9 87 ce   sta $ce87e9
$0b:a85f  27 dd		 and [$dd]
$0b:a861  7e f5 26	  ror $26f5,x
$0b:a864  f9 36 fe	  sbc $fe36,y
$0b:a867  d3 2f		 cmp ($2f,s),y
$0b:a869  7f 98 07 e2   adc $e20798,x
$0b:a86d  01 f0		 ora ($f0,x)
$0b:a86f  80 70		 bra $a8e1
$0b:a871  60			rts
$0b:a872  12 18		 ora ($18)
$0b:a874  06 0e		 asl $0e
$0b:a876  01 03		 ora ($03,x)
$0b:a878  80 61		 bra $a8db
$0b:a87a  e0 15 9f	  cpx #$9f15
$0b:a87d  ff ee eb f7   sbc $f7ebee,x
$0b:a881  be f6 6f	  ldx $6ff6,y
$0b:a884  f7 cf		 sbc [$cf],y
$0b:a886  75 eb		 adc $eb,x
$0b:a888  f9 ff fe	  sbc $feff,y
$0b:a88b  f6 7f		 inc $7f,x
$0b:a88d  ff e4 38 18   sbc $1838e4,x
$0b:a891  0d 4e 45	  ora $454e
$0b:a894  f2 8e		 sbc ($8e)
$0b:a896  40			rti
$0b:a897  24 75		 bit $75
$0b:a899  2b			pld
$0b:a89a  c2 b8		 rep #$b8
$0b:a89c  24 14		 bit $14
$0b:a89e  a8			tay
$0b:a89f  06 42		 asl $42
$0b:a8a1  21 c9		 and ($c9,x)
$0b:a8a3  81 59		 sta ($59,x)
$0b:a8a5  e4 0e		 cpx $0e
$0b:a8a7  a0 fe 96	  ldy #$96fe
$0b:a8aa  87 ff		 sta [$ff]
$0b:a8ac  70 ff		 bvs $a8ad
$0b:a8ae  cc 3d f0	  cpy $f03d
$0b:a8b1  7f fd 1f bf   adc $bf1ffd,x
$0b:a8b5  0f a4 51 af   ora $af51a4
$0b:a8b9  a7 60		 lda [$60]
$0b:a8bb  c0 54 a2	  cpy #$a254
$0b:a8be  56 ba		 lsr $ba,x
$0b:a8c0  0e f2 41	  asl $41f2
$0b:a8c3  5c 80 7a 24   jml $247a80
$0b:a8c7  1b			tcs
$0b:a8c8  f8			sed
$0b:a8c9  ff 7f 1d ff   sbc $ff1d7f,x
$0b:a8cd  e2 7b		 sep #$7b
$0b:a8cf  70 1b		 bvs $a8ec
$0b:a8d1  e8			inx
$0b:a8d2  27 7e		 and [$7e]
$0b:a8d4  1d ff c7	  ora $c7ff,x
$0b:a8d7  77 f0		 adc [$f0],y
$0b:a8d9  99 b9 6d	  sta $6db9,y
$0b:a8dc  27 ed		 and [$ed]
$0b:a8de  2a			rol a
$0b:a8df  be 65 35	  ldx $3565,y
$0b:a8e2  18			clc
$0b:a8e3  a9 85		 lda #$85
$0b:a8e5  13 e1		 ora ($e1,s),y
$0b:a8e7  3a			dec a
$0b:a8e8  b1 62		 lda ($62),y
$0b:a8ea  74 1d		 stz $1d,x
$0b:a8ec  ff 06 7d 80   sbc $807d06,x
$0b:a8f0  35 ff		 and $ff,x
$0b:a8f2  02 fc		 cop #$fc
$0b:a8f4  b3 ac		 lda ($ac,s),y
$0b:a8f6  41 fa		 eor ($fa,x)
$0b:a8f8  e7 b1		 sbc [$b1]
$0b:a8fa  9b			txy
$0b:a8fb  e9 57		 sbc #$57
$0b:a8fd  72 97		 adc ($97)
$0b:a8ff  c3 cd		 cmp $cd,s
$0b:a901  7f e4 5f fa   adc $fa5fe4,x
$0b:a905  48			pha
$0b:a906  28			plp
$0b:a907  35 f7		 and $f7,x
$0b:a909  f8			sed
$0b:a90a  03 7c		 ora $7c,s
$0b:a90c  a7 90		 lda [$90]
$0b:a90e  07 32		 ora [$32]
$0b:a910  54 20 1a	  mvn $1a,$20
$0b:a913  2c 97 37	  bit $3797
$0b:a916  8f ba 9f 5a   sta $5a9fba
$0b:a91a  af 77 5e fe   lda $fe5e77
$0b:a91e  57 39		 eor [$39],y
$0b:a920  e3 f7		 sbc $f7,s
$0b:a922  d6 6a		 dec $6a,x
$0b:a924  f7 d8		 sbc [$d8],y
$0b:a926  04 e0		 tsb $e0
$0b:a928  88			dey
$0b:a929  38			sec
$0b:a92a  48			pha
$0b:a92b  04 82		 tsb $82
$0b:a92d  07 63		 ora [$63]
$0b:a92f  87 c4		 sta [$c4]
$0b:a931  21 fa		 and ($fa,x)
$0b:a933  08			php
$0b:a934  7d 2a 5b	  adc $5b2a,x
$0b:a937  da			phx
$0b:a938  ab			plb
$0b:a939  7a			ply
$0b:a93a  7b			tdc
$0b:a93b  1a			inc a
$0b:a93c  eb			xba
$0b:a93d  4f 5b 17 29   eor $29175b
$0b:a941  93 dd		 sta ($dd,s),y
$0b:a943  6e 59 4f	  ror $4f59
$0b:a946  9f 42 0f a1   sta $a10f42,x
$0b:a94a  87 c1		 sta [$c1]
$0b:a94c  e7 f1		 sbc [$f1]
$0b:a94e  7f fd ff ff   adc $fffffd,x
$0b:a952  df ff e3 ff   cmp $ffe3ff,x
$0b:a956  f0 ff		 beq $a957
$0b:a958  fe ce 91	  inc $91ce,x
$0b:a95b  4c d0 60	  jmp $60d0
$0b:a95e  6a			ror a
$0b:a95f  3e ba 5c	  rol $5cba,x
$0b:a962  d6 af		 dec $af,x
$0b:a964  c5 86		 cmp $86
$0b:a966  48			pha
$0b:a967  f5 f9		 sbc $f9,x
$0b:a969  9a			txs
$0b:a96a  b9 9d 3e	  lda $3e9d,y
$0b:a96d  89 c0		 bit #$c0
$0b:a96f  81 fc		 sta ($fc,x)
$0b:a971  e1 fd		 sbc ($fd,x)
$0b:a973  08			php
$0b:a974  7f 82 1f d5   adc $d51f82,x
$0b:a978  82 5a a5	  brl $4ed5
$0b:a97b  3b			tsc
$0b:a97c  59 b7 4b	  eor $4bb7,y
$0b:a97f  23 ad		 and $ad,s
$0b:a981  f5 68		 sbc $68,x
$0b:a983  a6 bc		 ldx $bc
$0b:a985  5f 86 6f d1   eor $d16f86,x
$0b:a989  fb			xce
$0b:a98a  80 75		 bra $aa01
$0b:a98c  e0 1c		 cpx #$1c
$0b:a98e  b8			clv
$0b:a98f  05 be		 ora $be
$0b:a991  01 17		 ora ($17,x)
$0b:a993  e0 73		 cpx #$73
$0b:a995  fe 10 ff	  inc $ff10,x
$0b:a998  84 1f		 sty $1f
$0b:a99a  e1 30		 sbc ($30,x)
$0b:a99c  e4 54		 cpx $54
$0b:a99e  64 74		 stz $74
$0b:a9a0  ec 66 b2	  cpx $b266
$0b:a9a3  77 13		 adc [$13],y
$0b:a9a5  98			tya
$0b:a9a6  d4 ae		 pei ($ae)
$0b:a9a8  f3 5b		 sbc ($5b,s),y
$0b:a9aa  5e 6b b2	  lsr $b26b,x
$0b:a9ad  41 0f		 eor ($0f,x)
$0b:a9af  e1 20		 sbc ($20,x)
$0b:a9b1  20 fc 78	  jsr $78fc
$0b:a9b4  ff 3e 7f 8f   sbc $8f7f3e,x
$0b:a9b8  9f e7 ef f2   sta $f2efe7,x
$0b:a9bc  7b			tdc
$0b:a9bd  fe 52 0b	  inc $0b52,x
$0b:a9c0  ab			plb
$0b:a9c1  f4 69 66	  pea $6669
$0b:a9c4  da			phx
$0b:a9c5  08			php
$0b:a9c6  4e 57 c9	  lsr $c957
$0b:a9c9  6a			ror a
$0b:a9ca  d1 d8		 cmp ($d8),y
$0b:a9cc  3e dd ef	  rol $efdd,x
$0b:a9cf  91 7c		 sta ($7c),y
$0b:a9d1  0c e1 cb	  tsb $cbe1
$0b:a9d4  f8			sed
$0b:a9d5  7d ff 1f	  adc $1fff,x
$0b:a9d8  bf e7 f7 fc   lda $fcf7e7,x
$0b:a9dc  a9 2e		 lda #$2e
$0b:a9de  36 07		 rol $07,x
$0b:a9e0  61 32		 adc ($32,x)
$0b:a9e2  a5 d2		 lda $d2
$0b:a9e4  6a			ror a
$0b:a9e5  95 09		 sta $09,x
$0b:a9e7  56 97		 lsr $97,x
$0b:a9e9  09 78		 ora #$78
$0b:a9eb  b5 cc		 lda $cc,x
$0b:a9ed  ea			nop
$0b:a9ee  d2 61		 cmp ($61)
$0b:a9f0  38			sec
$0b:a9f1  73 ff		 adc ($ff,s),y
$0b:a9f3  f8			sed
$0b:a9f4  61 50		 adc ($50,x)
$0b:a9f6  8a			txa
$0b:a9f7  41 90		 eor ($90,x)
$0b:a9f9  1f cf ff e3   ora $e3ffcf,x
$0b:a9fd  ff 8a f5 6f   sbc $6ff58a,x
$0b:aa01  75 96		 adc $96,x
$0b:aa03  aa			tax
$0b:aa04  8e 27 7d	  stx $7d27
$0b:aa07  b2 e0		 lda ($e0)
$0b:aa09  e3 6d		 sbc $6d,s
$0b:aa0b  b6 89		 ldx $89,y
$0b:aa0d  4e 27 65	  lsr $6527
$0b:aa10  f1 ff		 sbc ($ff),y
$0b:aa12  dc ff f3	  jml [$f3ff]
$0b:aa15  f1 30		 sbc ($30),y
$0b:aa17  b2 03		 lda ($03)
$0b:aa19  e6 e8		 inc $e8
$0b:aa1b  11 38		 ora ($38),y
$0b:aa1d  68			pla
$0b:aa1e  3e d4 ab	  rol $abd4,x
$0b:aa21  e4 d6		 cpx $d6
$0b:aa23  7b			tdc
$0b:aa24  2e dd f4	  rol $f4dd
$0b:aa27  e3 79		 sbc $79,s
$0b:aa29  4a			lsr a
$0b:aa2a  f5 ae		 sbc $ae,x
$0b:aa2c  1f 00 a6 c2   ora $c2a600,x
$0b:aa30  ff f8 3f ff   sbc $ff3ff8,x
$0b:aa34  0b			phd
$0b:aa35  ff c4 ff f9   sbc $f9ffc4,x
$0b:aa39  3f fe 1f ff   and $ff1ffe,x
$0b:aa3d  c3 ff		 cmp $ff,s
$0b:aa3f  f2 ff		 sbc ($ff)
$0b:aa41  ed 75 56	  sbc $5675
$0b:aa44  6a			ror a
$0b:aa45  df 77 67 6a   cmp $6a6777,x
$0b:aa49  db			stp
$0b:aa4a  6d 6d b5	  adc $b56d
$0b:aa4d  5e 6c ab	  lsr $ab6c,x
$0b:aa50  ef 94 fd d0   sbc $d0fd94
$0b:aa54  23 f8		 and $f8,s
$0b:aa56  09 fc		 ora #$fc
$0b:aa58  02 ff		 cop #$ff
$0b:aa5a  01 ff		 ora ($ff,x)
$0b:aa5c  c0 bf		 cpy #$bf
$0b:aa5e  f2 21		 sbc ($21)
$0b:aa60  f9 7f e5	  sbc $e57f,y
$0b:aa63  3e 79 9c	  rol $9c79,x
$0b:aa66  3f 9d 3f 9e   and $9e3f9d,x
$0b:aa6a  7f bf 5f cc   adc $cc5fbf,x
$0b:aa6e  8f e3 7d 05   sta $057de3
$0b:aa72  a9 40		 lda #$40
$0b:aa74  23 e2		 and $e2,s
$0b:aa76  b2 20		 lda ($20)
$0b:aa78  29 7c		 and #$7c
$0b:aa7a  0f e1 b6 e4   ora $e4b6e1
$0b:aa7e  49 30		 eor #$30
$0b:aa80  1c bc ad	  trb $adbc
$0b:aa83  52 51		 eor ($51)
$0b:aa85  8b			phb
$0b:aa86  b8			clv
$0b:aa87  d0 b7		 bne $aa40
$0b:aa89  95 df		 sta $df,x
$0b:aa8b  77 6a		 adc [$6a],y
$0b:aa8d  08			php
$0b:aa8e  2a			rol a
$0b:aa8f  2b			pld
$0b:aa90  f0 ac		 beq $aa3e
$0b:aa92  7f c4 05 b9   adc $b905c4,x
$0b:aa96  eb			xba
$0b:aa97  e9 bf		 sbc #$bf
$0b:aa99  a9 37		 lda #$37
$0b:aa9b  61 a4		 adc ($a4,x)
$0b:aa9d  14 0b		 trb $0b
$0b:aa9f  df 0e 59 8c   cmp $8c590e,x
$0b:aaa3  a8			tay
$0b:aaa4  64 a4		 stz $a4
$0b:aaa6  5b			tcd
$0b:aaa7  f8			sed
$0b:aaa8  07 6e		 ora [$6e]
$0b:aaaa  91 c7		 sta ($c7),y
$0b:aaac  80 7b		 bra $ab29
$0b:aaae  67 7e		 adc [$7e]
$0b:aab0  78			sei
$0b:aab1  7f 7e 7f 3f   adc $3f7f7e,x
$0b:aab5  bf ff 6f f5   lda $f56fff,x
$0b:aab9  dd 07 57	  cmp $5707,x
$0b:aabc  77 02		 adc [$02],y
$0b:aabe  db			stp
$0b:aabf  4d 39 fc	  eor $fc39
$0b:aac2  b8			clv
$0b:aac3  14 92		 trb $92
$0b:aac5  45 51		 eor $51
$0b:aac7  a8			tay
$0b:aac8  ea			nop
$0b:aac9  b5 44		 lda $44,x
$0b:aacb  b0 d8		 bcs $aaa5
$0b:aacd  61 ef		 adc ($ef,x)
$0b:aacf  3f ff cf ff   and $ffcfff,x
$0b:aad3  fa			plx
$0b:aad4  c6 1d		 dec $1d
$0b:aad6  77 fe		 adc [$fe],y
$0b:aad8  ab			plb
$0b:aad9  ff b0 7b e1   sbc $e17bb0,x
$0b:aadd  13 08		 ora ($08,s),y
$0b:aadf  ff 7f 93 3f   sbc $3f937f,x
$0b:aae3  f9 43 eb	  sbc $eb43,y
$0b:aae6  b0 38		 bcs $ab20
$0b:aae8  54 07 4b	  mvn $4b,$07
$0b:aaeb  a0 8f		 ldy #$8f
$0b:aaed  b9 87 c0	  lda $c087,y
$0b:aaf0  0a			asl a
$0b:aaf1  1f e7 ff fc   ora $fcffe7,x
$0b:aaf5  e6 1a		 inc $1a
$0b:aaf7  ff fe 3d f3   sbc $f33dfe,x
$0b:aafb  a3 cf		 lda $cf,s
$0b:aafd  62 30 ae	  per $5930
$0b:ab00  4f 12 d3 e7   eor $e7d312
$0b:ab04  9a			txs
$0b:ab05  7c f7 9f	  jmp ($9ff7,x)
$0b:ab08  a8			tay
$0b:ab09  af cb f7 c0   lda $c0f7cb
$0b:ab0d  fb			xce
$0b:ab0e  fd 3f ff	  sbc $ff3f,x
$0b:ab11  89 f7		 bit #$f7
$0b:ab13  f2 3b		 sbc ($3b)
$0b:ab15  fd 87 ff	  sbc $ff87,x
$0b:ab18  a0 ff		 ldy #$ff
$0b:ab1a  ec 77 fb	  cpx $fb77
$0b:ab1d  75 b7		 adc $b7,x
$0b:ab1f  da			phx
$0b:ab20  4b			phk
$0b:ab21  ee 7e ff	  inc $ff7e
$0b:ab24  ad b3 4d	  lda $4db3
$0b:ab27  9c bd d6	  stz $d6bd
$0b:ab2a  fc 95 78	  jsr ($7895,x)
$0b:ab2d  4d fe 81	  eor $81fe
$0b:ab30  0f e0 08 02   ora $0208e0
$0b:ab34  3f 83 8f d0   and $d08f83,x
$0b:ab38  e7 f8		 sbc [$f8]
$0b:ab3a  49 fe		 eor #$fe
$0b:ab3c  22 7f 80 bf   jsl $bf807f
$0b:ab40  da			phx
$0b:ab41  fc 3a 9c	  jsr ($9c3a,x)
$0b:ab44  5c 96 87 96   jml $968796
$0b:ab48  81 da		 sta ($da,x)
$0b:ab4a  ac f8 de	  ldy $def8
$0b:ab4d  34 8e		 bit $8e,x
$0b:ab4f  59 b4 fd	  eor $fdb4,y
$0b:ab52  2f c2 ee c0   and $c0eec2
$0b:ab56  16 00		 asl $00,x
$0b:ab58  67 ff		 adc [$ff]
$0b:ab5a  f3 f5		 sbc ($f5,s),y
$0b:ab5c  40			rti
$0b:ab5d  c3 ff		 cmp $ff,s
$0b:ab5f  f2 d8		 sbc ($d8)
$0b:ab61  d6 ca		 dec $ca,x
$0b:ab63  5b			tcd
$0b:ab64  36 96		 rol $96,x
$0b:ab66  d6 ea		 dec $ea,x
$0b:ab68  99 6c 0d	  sta $0d6c,y
$0b:ab6b  ae 07 94	  ldx $9407
$0b:ab6e  a1 6a		 lda ($6a,x)
$0b:ab70  b2 bc		 lda ($bc)
$0b:ab72  09 f8		 ora #$f8
$0b:ab74  04 00		 tsb $00
$0b:ab76  21 a0		 and ($a0,x)
$0b:ab78  87 de		 sta [$de]
$0b:ab7a  20 ff c3	  jsr $c3ff
$0b:ab7d  51 ed		 eor ($ed),y
$0b:ab7f  2b			pld
$0b:ab80  34 dd		 bit $dd,x
$0b:ab82  a5 ab		 lda $ab
$0b:ab84  61 d0		 adc ($d0,x)
$0b:ab86  92 5a		 sta ($5a)
$0b:ab88  b0 18		 bcs $aba2
$0b:ab8a  4c 85 6a	  jmp $6a85
$0b:ab8d  45 a9		 eor $a9
$0b:ab8f  a0 40		 ldy #$40
$0b:ab91  ff 90 3f c4   sbc $c43f90,x
$0b:ab95  1f f1 0f f8   ora $f80ff1,x
$0b:ab99  47 fc		 eor [$fc]
$0b:ab9b  17 f8		 ora [$f8],y
$0b:ab9d  07 f4		 ora [$f4]
$0b:ab9f  94 36		 sty $36,x
$0b:aba1  df f5 5b f9   cmp $f95bf5,x
$0b:aba5  2d ea dc	  and $dcea
$0b:aba8  b9 79 7f	  lda $7f79,y
$0b:abab  74 b6		 stz $b6,x
$0b:abad  bf 94 97 c8   lda $c89794,x
$0b:abb1  a9 d0		 lda #$d0
$0b:abb3  3f f9 fc 20   and $20fcf9,x
$0b:abb7  5f f8 21 2c   eor $2c21f8,x
$0b:abbb  2f e0 d0 1f   and $1fd0e0
$0b:abbf  87 c6		 sta [$c6]
$0b:abc1  1f 6a e8 e4   ora $e4e86a,x
$0b:abc5  6d 76 d9	  adc $d976
$0b:abc8  0e 5b 47	  asl $475b
$0b:abcb  28			plp
$0b:abcc  c5 54		 cmp $54
$0b:abce  7b			tdc
$0b:abcf  be af d6	  ldx $d6af,y
$0b:abd2  a7 c0		 lda [$c0]
$0b:abd4  c9 04		 cmp #$04
$0b:abd6  f9 5f 3f	  sbc $3f5f,y
$0b:abd9  f7 5f		 sbc [$5f],y
$0b:abdb  f4 8b f9	  pea $f98b
$0b:abde  05 33		 ora $33
$0b:abe0  07 03		 ora [$03]
$0b:abe2  59 54 d1	  eor $d154,y
$0b:abe5  ca			dex
$0b:abe6  ef 57 1e 6d   sbc $6d1e57
$0b:abea  1a			inc a
$0b:abeb  a3 8d		 lda $8d,s
$0b:abed  87 6e		 sta [$6e]
$0b:abef  ba			tsx
$0b:abf0  b2 99		 lda ($99)
$0b:abf2  5c 13 f1 ff   jml $fff113
$0b:abf6  ee 7f f1	  inc $f17f
$0b:abf9  e2 61		 sep #$61
$0b:abfb  50 87		 bvc $ab84
$0b:abfd  f1 40		 sbc ($40),y
$0b:abff  22 40 c1 69   jsl $69c140
$0b:ac03  63 35		 adc $35,s
$0b:ac05  ad 47 2a	  lda $2a47
$0b:ac08  8d 23 d5	  sta $d523
$0b:ac0b  67 74		 adc [$74]
$0b:ac0d  99 2b 54	  sta $542b,y
$0b:ac10  a3 5b		 lda $5b,s
$0b:ac12  4c bf ff	  jmp $ffbf
$0b:ac15  fc ee 01	  jsr ($01ee,x)
$0b:ac18  12 03		 ora ($03)
$0b:ac1a  7c 1b e1	  jmp ($e11b,x)
$0b:ac1d  f7 ff		 sbc [$ff],y
$0b:ac1f  fc ff fb	  jsr ($fbff,x)
$0b:ac22  8c ed aa	  sty $aaed
$0b:ac25  9f d5 8f d4   sta $d48fd5,x
$0b:ac29  63 7a		 adc $7a,s
$0b:ac2b  4d fe 8a	  eor $8afe
$0b:ac2e  7f 48 be e8   adc $e8be48,x
$0b:ac32  7e b6 2f	  ror $2fb6,x
$0b:ac35  fe c3 ff	  inc $ffc3,x
$0b:ac38  e0 ff		 cpx #$ff
$0b:ac3a  f9 3f f4	  sbc $f43f,y
$0b:ac3d  0f ff 01 9c   ora $9c01ff
$0b:ac41  1f f8 57 ff   ora $ff57f8,x
$0b:ac45  4b			phk
$0b:ac46  5c a8 7f 73   jml $737fa8
$0b:ac4a  1e eb 25	  asl $25eb,x
$0b:ac4d  fb			xce
$0b:ac4e  a5 9b		 lda $9b
$0b:ac50  c9 66		 cmp #$66
$0b:ac52  ec 9f fa	  cpx $fa9f
$0b:ac55  4a			lsr a
$0b:ac56  00 3f		 brk #$3f
$0b:ac58  05 f0		 ora $f0
$0b:ac5a  80 ff		 bra $ac5b
$0b:ac5c  b0 3f		 bcs $ac9d
$0b:ac5e  e0 d8		 cpx #$d8
$0b:ac60  06 c0		 asl $c0
$0b:ac62  94 52		 sty $52,x
$0b:ac64  99 07 4a	  sta $4a07,y
$0b:ac67  25 ad		 and $ad
$0b:ac69  e4 5c		 cpx $5c
$0b:ac6b  b3 5a		 lda ($5a,s),y
$0b:ac6d  99 ce 4f	  sta $4fce,y
$0b:ac70  e7 b5		 sbc [$b5]
$0b:ac72  df d1 b7 3d   cmp $3db7d1,x
$0b:ac76  f8			sed
$0b:ac77  07 b6		 ora [$b6]
$0b:ac79  01 f7		 ora ($f7,x)
$0b:ac7b  80 79		 bra $acf6
$0b:ac7d  60			rts
$0b:ac7e  1c 68 04	  trb $0468
$0b:ac81  32 01		 and ($01)
$0b:ac83  40			rti
$0b:ac84  80 13		 bra $ac99
$0b:ac86  02 53		 cop #$53
$0b:ac88  09 81		 ora #$81
$0b:ac8a  c0 e5		 cpy #$e5
$0b:ac8c  5d 39 24	  eor $2439,x
$0b:ac8f  16 15		 asl $15,x
$0b:ac91  fb			xce
$0b:ac92  88			dey
$0b:ac93  44 f6 df	  mvp $df,$f6
$0b:ac96  fc 0d fb	  jsr ($fb0d,x)
$0b:ac99  ed 00 fe	  sbc $fe00
$0b:ac9c  18			clc
$0b:ac9d  07 f5		 ora [$f5]
$0b:ac9f  00 82		 brk #$82
$0b:aca1  40			rti
$0b:aca2  3d 90 03	  and $0390,x
$0b:aca5  51 4a		 eor ($4a),y
$0b:aca7  78			sei
$0b:aca8  33 2a		 and ($2a,s),y
$0b:acaa  15 97		 ora $97,x
$0b:acac  0b			phd
$0b:acad  53 c1		 eor ($c1,s),y
$0b:acaf  9c c2 97	  stz $97c2
$0b:acb2  8b			phb
$0b:acb3  92 d1		 sta ($d1)
$0b:acb5  66 5c		 ror $5c
$0b:acb7  2b			pld
$0b:acb8  f7 ff		 sbc [$ff],y
$0b:acba  fb			xce
$0b:acbb  ff fd 32 05   sbc $0532fd,x
$0b:acbf  06 1f		 asl $1f
$0b:acc1  44 10 df	  mvp $df,$10
$0b:acc4  7f f5 5a ab   adc $ab5af5,x
$0b:acc8  94 35		 sty $35,x
$0b:acca  68			pla
$0b:accb  e0 ff		 cpx #$ff
$0b:accd  ea			nop
$0b:acce  80 c3		 bra $ac93
$0b:acd0  95 d5		 sta $d5,x
$0b:acd2  5b			tcd
$0b:acd3  aa			tax
$0b:acd4  29 70		 and #$70
$0b:acd6  80 28		 bra $ad00
$0b:acd8  1c 0e 18	  trb $180e
$0b:acdb  0f fd 4a a1   ora $a14afd
$0b:acdf  a9 d4		 lda #$d4
$0b:ace1  7d be 96	  adc $96be,x
$0b:ace4  9f 46 d3 e9   sta $e9d346,x
$0b:ace8  59 fc 4d	  eor $4dfc,y
$0b:aceb  97 01		 sta [$01],y
$0b:aced  d8			cld
$0b:acee  d7 ff		 cmp [$ff],y
$0b:acf0  ea			nop
$0b:acf1  ff f8 5f fe   sbc $fe5ff8,x
$0b:acf5  2e c2 18	  rol $18c2
$0b:acf8  3b			tsc
$0b:acf9  08			php
$0b:acfa  64 ff		 stz $ff
$0b:acfc  fa			plx
$0b:acfd  ef ef 27 76   sbc $7627ef
$0b:ad01  d5 59		 cmp $59,x
$0b:ad03  f6 d6		 inc $d6,x
$0b:ad05  dc 7d 77	  jml [$777d]
$0b:ad08  6b			rtl
$0b:ad09  76 bf		 ror $bf,x
$0b:ad0b  e2 a9		 sep #$a9
$0b:ad0d  9c 5c 3f	  stz $3f5c
$0b:ad10  fb			xce
$0b:ad11  9b			txy
$0b:ad12  fe ef 7f	  inc $7fef,x
$0b:ad15  bb			tyx
$0b:ad16  7f cf bf f3   adc $f3bfcf,x
$0b:ad1a  93 fc		 sta ($fc,s),y
$0b:ad1c  fa			plx
$0b:ad1d  7f b7 48 e0   adc $e048b7,x
$0b:ad21  9d f7 34	  sta $34f7,x
$0b:ad24  7a			ply
$0b:ad25  aa			tax
$0b:ad26  be ae e9	  ldx $e9ae,y
$0b:ad29  df b0 65 7d   cmp $7d65b0,x
$0b:ad2d  55 69		 eor $69,x
$0b:ad2f  6f a2 bf 80   adc $80bfa2
$0b:ad33  bf c0 00 00   lda $0000c0,x
$0b:ad37  a0 4b		 ldy #$4b
$0b:ad39  fb			xce
$0b:ad3a  fc 30 13	  jsr ($1330,x)
$0b:ad3d  fb			xce
$0b:ad3e  2f a2 55 e1   and $e155a2
$0b:ad42  da			phx
$0b:ad43  5a			phy
$0b:ad44  77 36		 adc [$36],y
$0b:ad46  08			php
$0b:ad47  57 22		 eor [$22],y
$0b:ad49  ab			plb
$0b:ad4a  d4 f7		 pei ($f7)
$0b:ad4c  7f a3 3b 88   adc $883ba3,x
$0b:ad50  ff fc 3e 93   sbc $933efc,x
$0b:ad54  7f fc af ff   adc $ffaffc,x
$0b:ad58  01 ff		 ora ($ff,x)
$0b:ad5a  d1 ff		 cmp ($ff),y
$0b:ad5c  f2 6f		 sbc ($6f)
$0b:ad5e  0f d2 19 19   ora $1919d2
$0b:ad62  fc 76 78	  jsr ($7876,x)
$0b:ad65  f6 cf		 inc $cf,x
$0b:ad67  1c cf e1	  trb $e1cf
$0b:ad6a  71 87		 adc ($87),y
$0b:ad6c  d3 38		 cmp ($38,s),y
$0b:ad6e  7e 08 c7	  ror $c708,x
$0b:ad71  f2 07		 sbc ($07)
$0b:ad73  07 80		 ora [$80]
$0b:ad75  70 24		 bvs $ad9b
$0b:ad77  1e 08 84	  asl $8408,x
$0b:ad7a  3c d4 18	  bit $18d4,x
$0b:ad7d  0e 04 c2	  asl $c204
$0b:ad80  c7 e0		 cmp [$e0]
$0b:ad82  e6 4f		 inc $4f
$0b:ad84  36 77		 rol $77,x
$0b:ad86  0f e7 0f cd   ora $cd0fe7
$0b:ad8a  e1 1c		 sbc ($1c,x)
$0b:ad8c  85 ca		 sta $ca
$0b:ad8e  1c 3d 08	  trb $083d
$0b:ad91  fc 02 07	  jsr ($0702,x)
$0b:ad94  00 f8		 brk #$f8
$0b:ad96  43 27		 eor $27,s
$0b:ad98  f0 02		 beq $ad9c
$0b:ad9a  f8			sed
$0b:ad9b  18			clc
$0b:ad9c  c3 fd		 cmp $fd,s
$0b:ad9e  01 32		 ora ($32,x)
$0b:ada0  85 0a		 sta $0a
$0b:ada2  e1 af		 sbc ($af,x)
$0b:ada4  f6 45		 inc $45,x
$0b:ada6  b6 d7		 ldx $d7,y
$0b:ada8  ee 7c 82	  inc $827c
$0b:adab  d5 f7		 cmp $f7,x
$0b:adad  bb			tyx
$0b:adae  43 73		 eor $73,s
$0b:adb0  b9 0a 06	  lda $060a,y
$0b:adb3  3e 61 13	  rol $1361,x
$0b:adb6  bc 5a 7f	  ldy $7f5a,x
$0b:adb9  93 1f		 sta ($1f,s),y
$0b:adbb  e6 56		 inc $56
$0b:adbd  fd 89 9e	  sbc $9e89,x
$0b:adc0  78			sei
$0b:adc1  a3 00		 lda $00,s
$0b:adc3  40			rti
$0b:adc4  a2 5d		 ldx #$5d
$0b:adc6  75 fe		 adc $fe,x
$0b:adc8  d8			cld
$0b:adc9  a9 d0		 lda #$d0
$0b:adcb  64 36		 stz $36
$0b:adcd  ab			plb
$0b:adce  b5 de		 lda $de,x
$0b:add0  99 5e d2	  sta $d25e,y
$0b:add3  ea			nop
$0b:add4  b1 68		 lda ($68),y
$0b:add6  01 b5		 ora ($b5,x)
$0b:add8  a1 17		 lda ($17,x)
$0b:adda  47 18		 eor [$18]
$0b:addc  af c0 36 9a   lda $9a36c0
$0b:ade0  2b			pld
$0b:ade1  5f 93 37 fa   eor $fa3793,x
$0b:ade5  b3 5f		 lda ($5f,s),y
$0b:ade7  f7 3b		 sbc [$3b],y
$0b:ade9  f8			sed
$0b:adea  94 0d		 sty $0d,x
$0b:adec  ac 12 89	  ldy $8912
$0b:adef  fd 7c 40	  sbc $407c,x
$0b:adf2  30 5f		 bmi $ae53
$0b:adf4  fe 03 ff	  inc $ff03,x
$0b:adf7  40			rti
$0b:adf8  ff ff 3f ff   sbc $ff3fff,x
$0b:adfc  0f ff 01 dc   ora $dc01ff
$0b:ae00  1c 5d 55	  trb $555d
$0b:ae03  0e a9 5f	  asl $5fa9
$0b:ae06  d1 ff		 cmp ($ff),y
$0b:ae08  f3 bf		 sbc ($bf,s),y
$0b:ae0a  db			stp
$0b:ae0b  57 8a		 eor [$8a],y
$0b:ae0d  6d f1 a6	  adc $a6f1
$0b:ae10  5f 3f 4c 81   eor $814c3f,x
$0b:ae14  d0 01		 bne $ae17
$0b:ae16  06 05		 asl $05
$0b:ae18  ff 8e ff e1   sbc $e1ff8e,x
$0b:ae1c  ff fc 1f fe   sbc $fe1ffc,x
$0b:ae20  eb			xba
$0b:ae21  9b			txy
$0b:ae22  a1 7b		 lda ($7b,x)
$0b:ae24  b2 b4		 lda ($b4)
$0b:ae26  4b			phk
$0b:ae27  b7 22		 lda [$22],y
$0b:ae29  9b			txy
$0b:ae2a  8c b9 47	  sty $47b9
$0b:ae2d  f2 fb		 sbc ($fb)
$0b:ae2f  ab			plb
$0b:ae30  b7 13		 lda [$13],y
$0b:ae32  c1 ff		 cmp ($ff,x)
$0b:ae34  98			tya
$0b:ae35  ff e7 7f f9   sbc $f97fe7,x
$0b:ae39  ff ff e7 ff   sbc $ffe7ff,x
$0b:ae3d  f0 ff		 beq $ae3e
$0b:ae3f  ec 20 21	  cpx $2120
$0b:ae42  ec fb e4	  cpx $e4fb
$0b:ae45  9b			txy
$0b:ae46  fc 96 6f	  jsr ($6f96,x)
$0b:ae49  ad 9f d1	  lda $d19f
$0b:ae4c  ee ab 56	  inc $56ab
$0b:ae4f  bc e7 fe	  ldy $fee7,x
$0b:ae52  8b			phb
$0b:ae53  f6 72		 inc $72,x
$0b:ae55  83 1c		 sta $1c,s
$0b:ae57  2c 9f fb	  bit $fb9f
$0b:ae5a  07 fe		 ora [$fe]
$0b:ae5c  89 ff		 bit #$ff
$0b:ae5e  c2 39		 rep #$39
$0b:ae60  06 11		 asl $11
$0b:ae62  ff b9 6a 29   sbc $296ab9,x
$0b:ae66  bf a9 37 63   lda $6337a9,x
$0b:ae6a  5f 69 a5 5c   eor $5ca569,x
$0b:ae6e  7e 51 ed	  ror $ed51,x
$0b:ae71  2d 0b c3	  and $c30b
$0b:ae74  53 df		 eor ($df,s),y
$0b:ae76  c0 3b 74	  cpy #$743b
$0b:ae79  8e 3c 03	  stx $033c
$0b:ae7c  df 39 f3 40   cmp $40f339,x
$0b:ae80  3e d1 39	  rol $39d1,x
$0b:ae83  a4 23		 ldy $23
$0b:ae85  83 4d		 sta $4d,s
$0b:ae87  ea			nop
$0b:ae88  40			rti
$0b:ae89  74 fe		 stz $fe,x
$0b:ae8b  de ad da	  dec $daad,x
$0b:ae8e  db			stp
$0b:ae8f  9a			txs
$0b:ae90  d6 ea		 dec $ea,x
$0b:ae92  e9 d4 9b	  sbc #$9bd4
$0b:ae95  05 5b		 ora $5b
$0b:ae97  ab			plb
$0b:ae98  be fd c0	  ldx $c0fd,y
$0b:ae9b  32 f8		 and ($f8)
$0b:ae9d  4e 9d 62	  lsr $629d
$0b:aea0  9d 08 f2	  sta $f208,x
$0b:aea3  ec 75 31	  cpx $3175
$0b:aea6  8c 1c 22	  sty $221c
$0b:aea9  39 14 8e	  and $8e14,y
$0b:aeac  68			pla
$0b:aead  62 7c da	  per $892c
$0b:aeb0  37 e7		 and [$e7],y
$0b:aeb2  3b			tsc
$0b:aeb3  23 aa		 and $aa,s
$0b:aeb5  fb			xce
$0b:aeb6  34 b7		 bit $b7,x
$0b:aeb8  1c 55 8f	  trb $8f55
$0b:aebb  e9 27 ff	  sbc #$ff27
$0b:aebe  df f7 d7 fc   cmp $fcd7f7,x
$0b:aec2  05 ff		 ora $ff
$0b:aec4  81 7f		 sta ($7f,x)
$0b:aec6  c1 df		 cmp ($df,x)
$0b:aec8  f1 d7		 sbc ($d7),y
$0b:aeca  f8			sed
$0b:aecb  e4 ff		 cpx $ff
$0b:aecd  31 7f		 and ($7f),y
$0b:aecf  9b			txy
$0b:aed0  d2 2e		 cmp ($2e)
$0b:aed2  98			tya
$0b:aed3  fe d6 9a	  inc $9ad6,x
$0b:aed6  59 d3 ad	  eor $add3,y
$0b:aed9  59 6f 58	  eor $586f,y
$0b:aedc  6f ec 0d 36   adc $360dec
$0b:aee0  0c 50 0f	  tsb $0f50
$0b:aee3  84 05		 sty $05
$0b:aee5  c8			iny
$0b:aee6  2c 50 51	  bit $5150
$0b:aee9  90 7c		 bcc $af67
$0b:aeeb  2e 9f 3e	  rol $3e9f
$0b:aeee  8f 37 59 4f   sta $4f5937
$0b:aef2  eb			xba
$0b:aef3  fa			plx
$0b:aef4  27 dc		 and [$dc]
$0b:aef6  1e fd 82	  asl $82fd,x
$0b:aef9  5d 71 b6	  eor $b671,x
$0b:aefc  c4 9d		 cpy $9d
$0b:aefe  61 3e		 adc ($3e,x)
$0b:af00  ff fc 15 46   sbc $4615fc,x
$0b:af04  a7 0e		 lda [$0e]
$0b:af06  07 fd		 ora [$fd]
$0b:af08  fe 1e 7f	  inc $7f1e,x
$0b:af0b  1c cb e1	  trb $e1cb
$0b:af0e  5b			tcd
$0b:af0f  fc cb 7f	  jsr ($7fcb,x)
$0b:af12  99 9b c3	  sta $c39b,y
$0b:af15  55 23		 eor $23,x
$0b:af17  9f f5 f8 41   sta $41f8f5,x
$0b:af1b  bf f0 3f fc   lda $fc3ff0,x
$0b:af1f  1d c8 b2	  ora $b2c8,x
$0b:af22  dc d5 ca	  jml [$cad5]
$0b:af25  db			stp
$0b:af26  b6 b6		 ldx $b6,y
$0b:af28  de e2 9a	  dec $9ae2,x
$0b:af2b  ed 4e b7	  sbc $b74e
$0b:af2e  cf 53 ab e9   cmp $e9ab53
$0b:af32  77 94		 adc [$94],y
$0b:af34  09 fe 02	  ora #$02fe
$0b:af37  3f c0 8f f8   and $f88fc0,x
$0b:af3b  21 f5		 and ($f5,x)
$0b:af3d  08			php
$0b:af3e  3c 62 01	  bit $0162,x
$0b:af41  a8			tay
$0b:af42  80 50		 bra $af94
$0b:af44  e0 16 ff	  cpx #$ff16
$0b:af47  6e 9f ff	  ror $ff9f
$0b:af4a  3d d7 d2	  and $d2d7,x
$0b:af4d  3f f9 2b ed   and $ed2bf9,x
$0b:af51  17 7d		 ora [$7d],y
$0b:af53  32 d6		 and ($d6)
$0b:af55  f4 fb 51	  pea $51fb
$0b:af58  25 00		 and $00
$0b:af5a  d0 15		 bne $af71
$0b:af5c  46 21		 lsr $21
$0b:af5e  18			clc
$0b:af5f  fc 92 03	  jsr ($0392,x)
$0b:af62  66 f0		 ror $f0
$0b:af64  dd a1 d4	  cmp $d4a1,x
$0b:af67  ee 0c 4e	  inc $4e0c
$0b:af6a  1f b3 b8 35   ora $35b8b3,x
$0b:af6e  c3 77		 cmp $77,s
$0b:af70  87 9b		 sta [$9b]
$0b:af72  7c 63 f0	  jmp ($f063,x)
$0b:af75  0f f4 07 81   ora $8107f4
$0b:af79  30 80		 bmi $aefb
$0b:af7b  78			sei
$0b:af7c  3e 10 c8	  rol $c810,x
$0b:af7f  3c 03 01	  bit $0103,x
$0b:af82  40			rti
$0b:af83  f8			sed
$0b:af84  42 2c		 wdm #$2c
$0b:af86  9e 3b a4	  stz $a43b,x
$0b:af89  32 5d		 and ($5d)
$0b:af8b  e1 99		 sbc ($99,x)
$0b:af8d  c3 ec		 cmp $ec,s
$0b:af8f  7e 06 b8	  ror $b806,x
$0b:af92  66 70		 ror $70
$0b:af94  e5 70		 sbc $70
$0b:af96  f0 46		 beq $afde
$0b:af98  13 c0		 ora ($c0,s),y
$0b:af9a  3f 05 00 0f   and $0f0005,x
$0b:af9e  c3 f1		 cmp $f1,s
$0b:afa0  06 bf		 asl $bf
$0b:afa2  99 86 1b	  sta $1b86,y
$0b:afa5  2d ab 52	  and $52ab
$0b:afa8  a5 5a		 lda $5a
$0b:afaa  4a			lsr a
$0b:afab  6f e2 55 fa   adc $fa55e2
$0b:afaf  8a			txa
$0b:afb0  dd b1 15	  cmp $15b1,x
$0b:afb3  ed 77 57	  sbc $5777
$0b:afb6  a5 3c		 lda $3c
$0b:afb8  de df ab	  dec $abdf,x
$0b:afbb  ff e8 3f fa   sbc $fa3fe8,x
$0b:afbf  0b			phd
$0b:afc0  fe c4 df	  inc $dfc4,x
$0b:afc3  bc 6d f0	  ldy $f06d,x
$0b:afc6  80 53		 bra $b01b
$0b:afc8  ed bd 7e	  sbc $7ebd
$0b:afcb  51 cc		 eor ($cc),y
$0b:afcd  29 87 61	  and #$6187
$0b:afd0  8a			txa
$0b:afd1  5d a9 59	  eor $59a9,x
$0b:afd4  ed 4d 03	  sbc $034d
$0b:afd7  27 3c		 and [$3c]
$0b:afd9  9e a0 9f	  stz $9fa0,x
$0b:afdc  c2 8c		 rep #$8c
$0b:afde  1a			inc a
$0b:afdf  d7 7e		 cmp [$7e],y
$0b:afe1  57 e3		 eor [$e3],y
$0b:afe3  cf 7e 60 db   cmp $db607e
$0b:afe7  ea			nop
$0b:afe8  47 3f		 eor [$3f]
$0b:afea  25 fe		 and $fe
$0b:afec  c6 ff		 dec $ff
$0b:afee  e4 1b		 cpx $1b
$0b:aff0  f9 07 fd	  sbc $fd07,y
$0b:aff3  be 0e 70	  ldx $700e,y
$0b:aff6  a0 ff e6	  ldy #$e6ff
$0b:aff9  1f f8 08 80   ora $8008f8,x
$0b:affd  f3 5f		 sbc ($5f,s),y
$0b:afff  ba			tsx
$0b:b000  6d 1e d1	  adc $d11e
$0b:b003  8f b1 5f e0   sta $e05fb1
$0b:b007  5f bd 27 9e   eor $9e27bd,x
$0b:b00b  f5 1e		 sbc $1e,x
$0b:b00d  b2 fd		 lda ($fd)
$0b:b00f  e0 9f fd	  cpx #$fd9f
$0b:b012  c7 ff		 cmp [$ff]
$0b:b014  e1 ff		 sbc ($ff,x)
$0b:b016  c0 7f db	  cpy #$db7f
$0b:b019  e1 18		 sbc ($18,x)
$0b:b01b  ff f8 7f f0   sbc $f07ff8,x
$0b:b01f  8f fd f7 b1   sta $b1f7fd
$0b:b023  e6 de		 inc $de
$0b:b025  55 f1		 eor $f1,x
$0b:b027  bb			tyx
$0b:b028  9c d5 57	  stz $57d5
$0b:b02b  91 5b		 sta ($5b),y
$0b:b02d  e4 e5		 cpx $e5
$0b:b02f  77 b5		 adc [$b5],y
$0b:b031  28			plp
$0b:b032  f4 9f ff	  pea $ff9f
$0b:b035  43 ff		 eor $ff,s
$0b:b037  f8			sed
$0b:b038  bf f6 7f fc   lda $fc7ff6,x
$0b:b03c  ff ff 36 ff   sbc $ff36ff,x
$0b:b040  d8			cld
$0b:b041  9d 43 99	  sta $9943,x
$0b:b044  ff 73 f9 59   sbc $59f973,x
$0b:b048  18			clc
$0b:b049  f5 16		 sbc $16,x
$0b:b04b  fd 87 fa	  sbc $fa87,x
$0b:b04e  ca			dex
$0b:b04f  fd bb 6d	  sbc $6dbb,x
$0b:b052  d4 a7		 pei ($a7)
$0b:b054  b0 64		 bcs $b0ba
$0b:b056  06 38		 asl $38
$0b:b058  78			sei
$0b:b059  3f ee 50 84   and $8450ee,x
$0b:b05d  7f a2 1f ea   adc $ea1fa2,x
$0b:b061  0f f2 0f f0   ora $f00ff2
$0b:b065  b6 c2		 ldx $c2,y
$0b:b067  72 b1		 adc ($b1)
$0b:b069  6d 47 96	  adc $9647
$0b:b06c  8f 6d c2 67   sta $67c26d
$0b:b070  aa			tax
$0b:b071  73 8e		 adc ($8e,s),y
$0b:b073  85 bb		 sta $bb
$0b:b075  4d dd fc	  eor $fcdd
$0b:b078  42 bd		 wdm #$bd
$0b:b07a  90 4c		 bcc $b0c8
$0b:b07c  86 0b		 stx $0b
$0b:b07e  8f 55 b6 40   sta $40b655
$0b:b082  73 31		 adc ($31,s),y
$0b:b084  4b			phk
$0b:b085  dc 01 bc	  jml [$bc01]
$0b:b088  13 bb		 ora ($bb,s),y
$0b:b08a  6e a7 35	  ror $35a7
$0b:b08d  86 a5		 stx $a5
$0b:b08f  d9 37 13	  cmp $1337,y
$0b:b092  2b			pld
$0b:b093  25 93		 and $93
$0b:b095  bd 1b f1	  lda $f11b,x
$0b:b098  7b			tdc
$0b:b099  61 0b		 adc ($0b,x)
$0b:b09b  e0 cc f3	  cpx #$f3cc
$0b:b09e  20 53 29	  jsr $2953
$0b:b0a1  7c 82 c7	  jmp ($c782,x)
$0b:b0a4  88			dey
$0b:b0a5  ba			tsx
$0b:b0a6  d1 36		 cmp ($36),y
$0b:b0a8  d0 2d		 bne $b0d7
$0b:b0aa  dc 22 15	  jml [$1522]
$0b:b0ad  db			stp
$0b:b0ae  eb			xba
$0b:b0af  d9 fb 5e	  cmp $5efb,y
$0b:b0b2  ac 2d 56	  ldy $562d
$0b:b0b5  d5 b2		 cmp $b2,x
$0b:b0b7  fb			xce
$0b:b0b8  46 3b		 lsr $3b
$0b:b0ba  36 ed		 rol $ed,x
$0b:b0bc  67 57		 adc [$57]
$0b:b0be  69 7f dc	  adc #$dc7f
$0b:b0c1  5f f6 bf fd   eor $fdbff6,x
$0b:b0c5  d5 ff		 cmp $ff,x
$0b:b0c7  3b			tsc
$0b:b0c8  7f c7 cf ec   adc $eccfc7,x
$0b:b0cc  f1 ff		 sbc ($ff),y
$0b:b0ce  9c 3e a7	  stz $a73e
$0b:b0d1  af ab 7f bf   lda $bf7fab
$0b:b0d5  bf da b5 5b   lda $5bb5da,x
$0b:b0d9  53 a8		 eor ($a8,s),y
$0b:b0db  a2 50 f6	  ldx #$f650
$0b:b0de  30 d8		 bmi $b0b8
$0b:b0e0  2f d9 96 0c   and $0c96d9
$0b:b0e4  90 81		 bcc $b067
$0b:b0e6  7f f5 3f fa   adc $fa3ff5,x
$0b:b0ea  bf ff 7f ff   lda $ff7fff,x
$0b:b0ee  ff 7f ff 3f   sbc $3fff7f,x
$0b:b0f2  ea			nop
$0b:b0f3  54 d7 a1	  mvn $a1,$d7
$0b:b0f6  bf 9a d7 f3   lda $f3d79a,x
$0b:b0fa  55 fa		 eor $fa,x
$0b:b0fc  56 2a		 lsr $2a,x
$0b:b0fe  e1 40		 sbc ($40,x)
$0b:b100  af ec 07 a0   lda $a007ec
$0b:b104  23 0b		 and $0b,s
$0b:b106  00 88		 brk #$88
$0b:b108  44 61 f5	  mvp $f5,$61
$0b:b10b  54 0d 3f	  mvn $3f,$0d
$0b:b10e  7e 4d 0a	  ror $0a4d,x
$0b:b111  df e7 4d f3   cmp $f34de7,x
$0b:b115  ac fd fc	  ldy $fcfd
$0b:b118  be 8c b6	  ldx $b68c,y
$0b:b11b  26 e9		 rol $e9
$0b:b11d  1e dd cc	  asl $ccdd,x
$0b:b120  bd f0 88	  lda $88f0,x
$0b:b123  37 fe		 and [$fe],y
$0b:b125  18			clc
$0b:b126  a0 18 9f	  ldy #$9f18
$0b:b129  f2 e7		 sbc ($e7)
$0b:b12b  f8			sed
$0b:b12c  f2 fd		 sbc ($fd)
$0b:b12e  3a			dec a
$0b:b12f  df 23 68 7f   cmp $7f6823,x
$0b:b133  c3 e0		 cmp $e0,s
$0b:b135  f0 b7		 beq $b0ee
$0b:b137  f7 6e		 sbc [$6e],y
$0b:b139  ba			tsx
$0b:b13a  f6 dc		 inc $dc,x
$0b:b13c  96 4a		 stx $4a,y
$0b:b13e  03 01		 ora $01,s
$0b:b140  80 05		 bra $b147
$0b:b142  41 fc		 eor ($fc,x)
$0b:b144  ae f0 fb	  ldx $fbf0
$0b:b147  c0 32 61	  cpy #$6132
$0b:b14a  61 0b		 adc ($0b,x)
$0b:b14c  ae 9b c3	  ldx $c39b
$0b:b14f  74 f6		 stz $f6,x
$0b:b151  47 7f		 eor [$7f]
$0b:b153  9a			txs
$0b:b154  7b			tdc
$0b:b155  ff b6 67 d1   sbc $d167b6,x
$0b:b159  bf d5 fd fe   lda $fefdd5,x
$0b:b15d  b9 e7 83	  lda $83e7,y
$0b:b160  31 fc		 and ($fc),y
$0b:b162  f1 ff		 sbc ($ff),y
$0b:b164  ff 9f f2 2b   sbc $2bf29f,x
$0b:b168  d8			cld
$0b:b169  fc 3c e9	  jsr ($e93c,x)
$0b:b16c  fe f2 ff	  inc $fff2,x
$0b:b16f  fb			xce
$0b:b170  ee 7a be	  inc $be7a
$0b:b173  b3 4f		 lda ($4f,s),y
$0b:b175  fe cf 9f	  inc $9fcf,x
$0b:b178  5a			phy
$0b:b179  f3 c7		 sbc ($c7,s),y
$0b:b17b  e0 30 78	  cpx #$7830
$0b:b17e  3f fe 1f 3f   and $3f1ffe,x
$0b:b182  8f 91 5b 93   sta $935b91
$0b:b186  a4 96		 ldy $96
$0b:b188  5d f2 f7	  eor $f7f2,x
$0b:b18b  f9 dd ff	  sbc $ffdd,y
$0b:b18e  a5 a5		 lda $a5
$0b:b190  ba			tsx
$0b:b191  f7 25		 sbc [$25],y
$0b:b193  57 ea		 eor [$ea],y
$0b:b195  af 7e fe f0   lda $f0fe7e
$0b:b199  53 f8		 eor ($f8,s),y
$0b:b19b  48			pha
$0b:b19c  e0 18 18	  cpx #$1818
$0b:b19f  04 80		 tsb $80
$0b:b1a1  1c 10 3c	  trb $3c10
$0b:b1a4  cf d7 d5 fc   cmp $fcd5d7
$0b:b1a8  a8			tay
$0b:b1a9  fa			plx
$0b:b1aa  a2 fa 79	  ldx #$79fa
$0b:b1ad  24 bf		 bit $bf
$0b:b1af  73 f6		 adc ($f6,s),y
$0b:b1b1  cb			wai
$0b:b1b2  fe 3f 90	  inc $903f,x
$0b:b1b5  0f f2 10 50   ora $5010f2
$0b:b1b9  a1 f8		 lda ($f8,x)
$0b:b1bb  80 74		 bra $b231
$0b:b1bd  1f c7 d5 f7   ora $f7d5c7,x
$0b:b1c1  69 67 7c	  adc #$7c67
$0b:b1c4  b9 66 b2	  lda $b266,y
$0b:b1c7  a7 e7		 lda [$e7]
$0b:b1c9  f3 ea		 sbc ($ea,s),y
$0b:b1cb  f2 ba		 sbc ($ba)
$0b:b1cd  8c e7 6f	  sty $6fe7
$0b:b1d0  fa			plx
$0b:b1d1  84 0e		 sty $0e
$0b:b1d3  07 fe		 ora [$fe]
$0b:b1d5  20 a3 18	  jsr $18a3
$0b:b1d8  c4 02		 cpy $02
$0b:b1da  fc 86 19	  jsr ($1986,x)
$0b:b1dd  f2 18		 sbc ($18)
$0b:b1df  30 1c		 bmi $b1fd
$0b:b1e1  09 fe de	  ora #$defe
$0b:b1e4  ef c1 bf e7   sbc $e7bfc1
$0b:b1e8  a7 cd		 lda [$cd]
$0b:b1ea  70 c0		 bvs $b1ac
$0b:b1ec  4f 9a a1 7f   eor $7fa19a
$0b:b1f0  60			rts
$0b:b1f1  0e 23 ff	  asl $ff23
$0b:b1f4  be 22 ab	  ldx $ab22,y
$0b:b1f7  94 38		 sty $38,x
$0b:b1f9  17 ff		 ora [$ff],y
$0b:b1fb  2d 97 f9	  and $f997
$0b:b1fe  02 dc		 cop #$dc
$0b:b200  ce f8 57	  dec $57f8
$0b:b203  f7 78		 sbc [$78],y
$0b:b205  64 9b		 stz $9b
$0b:b207  c1 80		 cmp ($80,x)
$0b:b209  c0 7f f3	  cpy #$f37f
$0b:b20c  5f ff ef ff   eor $ffefff,x
$0b:b210  89 ff de	  bit #$deff
$0b:b213  7f f7 ff f7   adc $f7fff7,x
$0b:b217  f8			sed
$0b:b218  37 c1		 and [$c1],y
$0b:b21a  fa			plx
$0b:b21b  37 fe		 and [$fe],y
$0b:b21d  ed ff 03	  sbc $03ff
$0b:b220  01 de		 ora ($de,x)
$0b:b222  50 ba		 bvc $b1de
$0b:b224  f2 8d		 sbc ($8d)
$0b:b226  fd 00 36	  sbc $3600,x
$0b:b229  0d f0 72	  ora $72f0
$0b:b22c  83 94		 sta $94,s
$0b:b22e  3f df fd ef   and $effddf,x
$0b:b232  ff ae 08 10   sbc $1008ae,x
$0b:b236  48			pha
$0b:b237  7e e8 9f	  ror $9fe8,x
$0b:b23a  4a			lsr a
$0b:b23b  5f 82 bf a9   eor $a9bf82,x
$0b:b23f  95 f2		 sta $f2,x
$0b:b241  af cf 94 15   lda $1594cf
$0b:b245  90 24		 bcc $b26b
$0b:b247  3a			dec a
$0b:b248  82 61 04	  brl $b6ac
$0b:b24b  a5 fb		 lda $fb
$0b:b24d  03 c1		 ora $c1,s
$0b:b24f  bf 64 ae 7a   lda $7aae64,x
$0b:b253  1b			tcs
$0b:b254  fe 36 a7	  inc $a736,x
$0b:b257  8c a9 15	  sty $15a9
$0b:b25a  42 b5		 wdm #$b5
$0b:b25c  ba			tsx
$0b:b25d  bf 7f f0 3f   lda $3ff07f,x
$0b:b261  fc 60 28	  jsr ($2860,x)
$0b:b264  75 9f		 adc $9f,x
$0b:b266  fd 68 28	  sbc $2868,x
$0b:b269  68			pla
$0b:b26a  bf fb 7e c3   lda $c37efb,x
$0b:b26e  67 4e		 adc [$4e]
$0b:b270  e6 6f		 inc $6f
$0b:b272  6a			ror a
$0b:b273  7b			tdc
$0b:b274  2d 4d bf	  and $bf4d
$0b:b277  4d 6e ea	  eor $ea6e
$0b:b27a  d7 3b		 cmp [$3b],y
$0b:b27c  72 8a		 adc ($8a)
$0b:b27e  7f ff 63 ff   adc $ff63ff,x
$0b:b282  a1 7f		 lda ($7f,x)
$0b:b284  e9 bf fc	  sbc #$fcbf
$0b:b287  8f fb 2d f9   sta $f92dfb
$0b:b28b  d2 7e		 cmp ($7e)
$0b:b28d  fb			xce
$0b:b28e  1f 7b ee 37   ora $37ee7b,x
$0b:b292  9d 32 db	  sta $db32,x
$0b:b295  de 6f 78	  dec $786f,x
$0b:b298  45 bb		 eor $bb
$0b:b29a  40			rti
$0b:b29b  be 10 1f	  ldx $1f10,y
$0b:b29e  e4 03		 cpx $03
$0b:b2a0  fc c5 8f	  jsr ($8fc5,x)
$0b:b2a3  fd f7 ff	  sbc $fff7,x
$0b:b2a6  82 f7 e5	  brl $98a0
$0b:b2a9  3b			tsc
$0b:b2aa  d8			cld
$0b:b2ab  9f e6 49 14   sta $1449e6,x
$0b:b2af  1f 3a 47 9b   ora $9b473a,x
$0b:b2b3  23 00		 and $00,s
$0b:b2b5  be df 76	  ldx $76df,y
$0b:b2b8  f7 be		 sbc [$be],y
$0b:b2ba  75 5f		 adc $5f,x
$0b:b2bc  f9 6e dc	  sbc $dc6e,y
$0b:b2bf  d7 7e		 cmp [$7e],y
$0b:b2c1  53 bb		 eor ($bb,s),y
$0b:b2c3  2d df 95	  and $95df
$0b:b2c6  ad e9 d5	  lda $d5e9
$0b:b2c9  7d 9a aa	  adc $aa9a,x
$0b:b2cc  cd 57 59	  cmp $5957
$0b:b2cf  a9 bb f5	  lda #$f5bb
$0b:b2d2  ab			plb
$0b:b2d3  32 6c		 and ($6c)
$0b:b2d5  4f 67 5d 28   eor $285d67
$0b:b2d9  fc 40 fc	  jsr ($fc40,x)
$0b:b2dc  18			clc
$0b:b2dd  7e 04 0d	  ror $0d04,x
$0b:b2e0  fc 18 09	  jsr ($0918,x)
$0b:b2e3  04 02		 tsb $02
$0b:b2e5  e3 00		 sbc $00,s
$0b:b2e7  b9 c0 00	  lda $00c0,y
$0b:b2ea  00 20		 brk #$20
$0b:b2ec  80 3b		 bra $b329
$0b:b2ee  fd fd 9f	  sbc $9ffd,x
$0b:b2f1  f8			sed
$0b:b2f2  04 ff		 tsb $ff
$0b:b2f4  81 df		 sta ($df,x)
$0b:b2f6  f0 4b		 beq $b343
$0b:b2f8  e6 1d		 inc $1d
$0b:b2fa  78			sei
$0b:b2fb  c4 ae		 cpy $ae
$0b:b2fd  19 15 83	  ora $8315,y
$0b:b300  42 a0		 wdm #$a0
$0b:b302  6f e4 e0 40   adc $40e0e4
$0b:b306  3c 10 0f	  bit $0f10,x
$0b:b309  87 03		 sta [$03]
$0b:b30b  f1 e0		 sbc ($e0),y
$0b:b30d  fe 7c 01	  inc $017c,x
$0b:b310  e1 1c		 sbc ($1c,x)
$0b:b312  f1 f8		 sbc ($f8),y
$0b:b314  ff f1 c1 88   sbc $88c1f1,x
$0b:b318  0c 01 fd	  tsb $fd01
$0b:b31b  23 70		 and $70,s
$0b:b31d  07 87		 ora [$87]
$0b:b31f  fc 66 04	  jsr ($0466,x)
$0b:b322  b1 ee		 lda ($ee),y
$0b:b324  cf a4 5e 3e   cmp $3e5ea4
$0b:b328  ef 06 45 00   sbc $004506
$0b:b32c  e0 bf 9c	  cpx #$9cbf
$0b:b32f  72 13		 adc ($13)
$0b:b331  e0 70 47	  cpx #$4770
$0b:b334  3f f3 e2 59   and $59e2f3,x
$0b:b338  12 c0		 ora ($c0)
$0b:b33a  3a			dec a
$0b:b33b  01 d0		 ora ($d0,x)
$0b:b33d  82 c0 4e	  brl $0200
$0b:b340  6c 1d 01	  jmp ($011d)
$0b:b343  68			pla
$0b:b344  0b			phd
$0b:b345  43 fd		 eor $fd,s
$0b:b347  f8			sed
$0b:b348  41 b0		 eor ($b0,x)
$0b:b34a  b4 1f		 ldy $1f,x
$0b:b34c  fe 9f e2	  inc $e29f,x
$0b:b34f  31 2c		 and ($2c),y
$0b:b351  25 7d		 and $7d
$0b:b353  ec 21 bc	  cpx $bc21
$0b:b356  40			rti
$0b:b357  30 90		 bmi $b2e9
$0b:b359  0b			phd
$0b:b35a  dd e3 09	  cmp $09e3,x
$0b:b35d  fc bd e1	  jsr ($e1bd,x)
$0b:b360  ff 90 33 49   sbc $493390,x
$0b:b364  e1 ff		 sbc ($ff,x)
$0b:b366  f0 3c		 beq $b3a4
$0b:b368  3c 00 3c	  bit $3c00,x
$0b:b36b  a9 0f 51	  lda #$510f
$0b:b36e  6b			rtl
$0b:b36f  b8			clv
$0b:b370  dd 21 04	  cmp $0421,x
$0b:b373  80 42		 bra $b3b7
$0b:b375  e0 71 68	  cpx #$6871
$0b:b378  3c 52 0e	  bit $0e52,x
$0b:b37b  9f 5f e7 fd   sta $fde75f,x
$0b:b37f  18			clc
$0b:b380  3f 8f 00 ac   and $ac008f,x
$0b:b384  1d de 3f	  ora $3fde,x
$0b:b387  f2 87		 sbc ($87)
$0b:b389  98			tya
$0b:b38a  7c e5 e8	  jmp ($e8e5,x)
$0b:b38d  3f 4a 7a 97   and $977a4a,x
$0b:b391  d6 de		 dec $de,x
$0b:b393  c7 f6		 cmp [$f6]
$0b:b395  c7 b7		 cmp [$b7]
$0b:b397  8f 51 60 77   sta $776051
$0b:b39b  87 52		 sta [$52]
$0b:b39d  61 eb		 adc ($eb,x)
$0b:b39f  8c 7d 21	  sty $217d
$0b:b3a2  9f b8 3f f2   sta $f23fb8,x
$0b:b3a6  07 fe		 ora [$fe]
$0b:b3a8  80 c7		 bra $b371
$0b:b3aa  e0 ef f0	  cpx #$f0ef
$0b:b3ad  87 c0		 sta [$c0]
$0b:b3af  e0 f0 08	  cpx #$08f0
$0b:b3b2  1b			tcs
$0b:b3b3  79 62 b0	  adc $b062,y
$0b:b3b6  69 5c 33	  adc #$335c
$0b:b3b9  af 18 97 cc   lda $cc9718
$0b:b3bd  3b			tsc
$0b:b3be  fe 09 ff	  inc $ff09,x
$0b:b3c1  03 ff		 ora $ff,s
$0b:b3c3  00 0d		 brk #$0d
$0b:b3c5  87 e3		 sta [$e3]
$0b:b3c7  c1 f0		 cmp ($f0,x)
$0b:b3c9  e0 78 20	  cpx #$2078
$0b:b3cc  1c 06 f7	  trb $f706
$0b:b3cf  8b			phb
$0b:b3d0  9b			txy
$0b:b3d1  fe 3f d1	  inc $d13f,x
$0b:b3d4  7f 8f f6 15   adc $15f68f,x
$0b:b3d8  03 37		 ora $37,s
$0b:b3da  80 3c		 bra $b418
$0b:b3dc  8e a8 0f	  stx $0fa8
$0b:b3df  0f e7 c0 fe   ora $fec0e7
$0b:b3e3  01 f2		 ora ($f2,x)
$0b:b3e5  42 a0		 wdm #$a0
$0b:b3e7  7c 25 1e	  jmp ($1e25,x)
$0b:b3ea  0b			phd
$0b:b3eb  47 83		 eor [$83]
$0b:b3ed  a1 c0		 lda ($c0,x)
$0b:b3ef  90 09		 bcc $b3fa
$0b:b3f1  1d fe 53	  ora $53fe,x
$0b:b3f4  f8			sed
$0b:b3f5  7f fe 3f ff   adc $ff3ffe,x
$0b:b3f9  9f 92 7c b5   sta $b57c92,x
$0b:b3fd  ea			nop
$0b:b3fe  a4 7d		 ldy $7d
$0b:b400  83 e4		 sta $e4,s
$0b:b402  1e e0 f5	  asl $f5e0,x
$0b:b405  07 98		 ora [$98]
$0b:b407  3b			tsc
$0b:b408  c8			iny
$0b:b409  5c 80 70 02   jml $027080
$0b:b40d  80 0c		 bra $b41b
$0b:b40f  1f e4 2e f7   ora $f72ee4,x
$0b:b413  ff 84 3c 43   sbc $433c84,x
$0b:b417  e3 2f		 sbc $2f,s
$0b:b419  21 f9		 and ($f9,x)
$0b:b41b  53 cc		 eor ($cc,s),y
$0b:b41d  be 76 f4	  ldx $f476,y
$0b:b420  3f a6 3d 53   and $533da6,x
$0b:b424  eb			xba
$0b:b425  af 65 fb 73   lda $73fb65
$0b:b429  dd be fe	  cmp $febe,x
$0b:b42c  f0 7f		 beq $b4ad
$0b:b42e  88			dey
$0b:b42f  3c 63 e4	  bit $e463,x
$0b:b432  2f 29 f9 93   and $93f929
$0b:b436  ce be 86	  dec $86be
$0b:b439  f4 bf aa	  pea $aabf
$0b:b43c  3d 73 ec	  and $ec73,x
$0b:b43f  26 bc		 rol $bc
$0b:b441  40			rti
$0b:b442  38			sec
$0b:b443  f0 09		 beq $b44e
$0b:b445  c4 e3		 cpy $e3
$0b:b447  8f ff 6c 0c   sta $0c6cff
$0b:b44b  03 fe		 ora $fe,s
$0b:b44d  df 2c 3b 74   cmp $743b2c,x
$0b:b451  1a			inc a
$0b:b452  a0 c2 ce	  ldy #$cec2
$0b:b455  04 02		 tsb $02
$0b:b457  41 00		 eor ($00,x)
$0b:b459  c8			iny
$0b:b45a  60			rts
$0b:b45b  2a			rol a
$0b:b45c  1c 06 f9	  trb $f906
$0b:b45f  b7 ca		 lda [$ca],y
$0b:b461  7f ff 8f df   adc $df8fff,x
$0b:b465  e1 f3		 sbc ($f3,x)
$0b:b467  f8			sed
$0b:b468  7b			tdc
$0b:b469  c5 a6		 cmp $a6
$0b:b46b  10 0e		 bpl $b47b
$0b:b46d  47 02		 eor [$02]
$0b:b46f  69 f0 ea	  adc #$eaf0
$0b:b472  4c 00 2e	  jmp $2e00
$0b:b475  0c 08 3c	  tsb $3c08
$0b:b478  3e 06 2b	  rol $2b06,x
$0b:b47b  07 e8		 ora [$e8]
$0b:b47d  0b			phd
$0b:b47e  cb			wai
$0b:b47f  51 60		 eor ($60),y
$0b:b481  1a			inc a
$0b:b482  b0 34		 bcs $b4b8
$0b:b484  07 e5		 ora [$e5]
$0b:b486  1f 83 91 59   ora $599183,x
$0b:b48a  85 cf		 sta $cf
$0b:b48c  f7 7f		 sbc [$7f],y
$0b:b48e  ab			plb
$0b:b48f  0a			asl a
$0b:b490  20 70 08	  jsr $0870
$0b:b493  64 02		 stz $02
$0b:b495  27 03		 and [$03]
$0b:b497  2f cf f3 ff   and $fff3cf
$0b:b49b  f0 fe		 beq $b49b
$0b:b49d  78			sei
$0b:b49e  18			clc
$0b:b49f  49 1f 80	  eor #$801f
$0b:b4a2  23 82		 and $82,s
$0b:b4a4  3f 1f f0 02   and $02f01f,x
$0b:b4a8  41 36		 eor ($36,x)
$0b:b4aa  0f f4 4d 82   ora $824df4
$0b:b4ae  58			cli
$0b:b4af  55 5e		 eor $5e,x
$0b:b4b1  bb			tyx
$0b:b4b2  f6 67		 inc $67,x
$0b:b4b4  b7 7d		 lda [$7d],y
$0b:b4b6  dd ef ff	  cmp $ffef,x
$0b:b4b9  08			php
$0b:b4ba  78			sei
$0b:b4bb  87 c6		 sta [$c6]
$0b:b4bd  5e 43 f2	  lsr $f243,x
$0b:b4c0  a7 99		 lda [$99]
$0b:b4c2  7c ed e8	  jmp ($e8ed,x)
$0b:b4c5  7f 4c 7a a7   adc $a77a4c,x
$0b:b4c9  d7 5e		 cmp [$5e],y
$0b:b4cb  cb			wai
$0b:b4cc  f6 70		 inc $70,x
$0b:b4ce  7f db fb a8   adc $a8fbdb,x
$0b:b4d2  b0 3b		 bcs $b50f
$0b:b4d4  c3 49		 cmp $49,s
$0b:b4d6  60			rts
$0b:b4d7  ea			nop
$0b:b4d8  4c 1e a4	  jmp $a41e
$0b:b4db  ef 28 fc 1d   sbc $1dfc28
$0b:b4df  fe 30 38	  inc $3830,x
$0b:b4e2  78			sei
$0b:b4e3  10 df		 bpl $b4c4
$0b:b4e5  e5 ea		 sbc $ea
$0b:b4e7  8c 03 c3	  sty $c303
$0b:b4ea  eb			xba
$0b:b4eb  0c fd 41	  tsb $41fd
$0b:b4ee  bf b0 30 b8   lda $b830b0,x
$0b:b4f2  7f a0 21 b0   adc $b021a0,x
$0b:b4f6  83 87		 sta $87,s
$0b:b4f8  86 07		 stx $07
$0b:b4fa  00 80		 brk #$80
$0b:b4fc  b3 b7		 lda ($b7,s),y
$0b:b4fe  01 00		 ora ($00,x)
$0b:b500  a0 0d 87	  ldy #$870d
$0b:b503  41 80		 eor ($80,x)
$0b:b505  1d 83 7d	  ora $7d83,x
$0b:b508  6f ff f9 f9   adc $f9f9ff
$0b:b50c  1c 2f f1	  trb $f12f
$0b:b50f  f2 58		 sbc ($58)
$0b:b511  33 88		 and ($88,s),y
$0b:b513  46 10		 lsr $10
$0b:b515  48			pha
$0b:b516  04 2e		 tsb $2e
$0b:b518  07 0a		 ora [$0a]
$0b:b51a  81 c5		 sta ($c5,x)
$0b:b51c  60			rts
$0b:b51d  c5 b0		 cmp $b0
$0b:b51f  6f 9f f3 ff   adc $fff39f
$0b:b523  f8			sed
$0b:b524  fe 7c 0c	  inc $0c7c,x
$0b:b527  e1 f8		 sbc ($f8,x)
$0b:b529  f0 1a		 beq $b545
$0b:b52b  c2 59		 rep #$59
$0b:b52d  0f e9 c7 25   ora $25c7e9
$0b:b531  f3 0e		 sbc ($0e,s),y
$0b:b533  ff 82 7f c0   sbc $c07f82,x
$0b:b537  ff b7 80 f4   sbc $f480b7,x
$0b:b53b  3f 0e 07 82   and $82070e,x
$0b:b53f  01 c0		 ora ($c0,x)
$0b:b541  67 7b		 adc [$7b]
$0b:b543  57 db		 eor [$db],y
$0b:b545  ee 8e f5	  inc $f58e
$0b:b548  ff b4 3d c3   sbc $c33db4,x
$0b:b54c  ef 2f 01 f8   sbc $f8012f
$0b:b550  53 c4		 eor ($c4,s),y
$0b:b552  be 36 f2	  ldx $f236,y
$0b:b555  3f 96 3c d3   and $d33c96,x
$0b:b559  e7 af		 sbc [$af]
$0b:b55b  45 fa		 eor $fa
$0b:b55d  73 d5		 adc ($d5,s),y
$0b:b55f  be be f6	  ldx $f6be,y
$0b:b562  7f b8 3d e3   adc $e33db8,x
$0b:b566  e0 2f 09	  cpx #$092f
$0b:b569  f8			sed
$0b:b56a  93 c6		 sta ($c6,s),y
$0b:b56c  be 46 f2	  ldx $f246,y
$0b:b56f  bf 9a 3c f3   lda $f33c9a,x
$0b:b573  e8			inx
$0b:b574  af 4d fa b3   lda $b3fa4d
$0b:b578  d7 be		 cmp [$be],y
$0b:b57a  ce f6 ff	  dec $fff6
$0b:b57d  bc 3c 03	  ldy $033c,x
$0b:b580  e1 2f		 sbc ($2f,x)
$0b:b582  11 f8		 ora ($f8),y
$0b:b584  d3 c8		 cmp ($c8,s),y
$0b:b586  be 56 f3	  ldx $f356,y
$0b:b589  3f 9e 3d 13   and $133d9e,x
$0b:b58d  e9 af 55	  sbc #$55af
$0b:b590  fa			plx
$0b:b591  f3 d9		 sbc ($d9,s),y
$0b:b593  be de f7	  ldx $f7de,y
$0b:b596  7f 80 3c 23   adc $233c80,x
$0b:b59a  e2 2f		 sep #$2f
$0b:b59c  19 f9 13	  ora $13f9,y
$0b:b59f  ca			dex
$0b:b5a0  be 66 f3	  ldx $f366,y
$0b:b5a3  bf a2 3d 33   lda $333da2,x
$0b:b5a7  ea			nop
$0b:b5a8  af 5d fb 33   lda $33fb5d
$0b:b5ac  db			stp
$0b:b5ad  bf 33 9e 51   lda $519e33,x
$0b:b5b1  ac 36 d8	  ldy $d836
$0b:b5b4  e4 4f		 cpx $4f
$0b:b5b6  1f c3 98 4f   ora $4f98c3,x
$0b:b5ba  60			rts
$0b:b5bb  3e 28 1c	  rol $1c28,x
$0b:b5be  7e 39 c0	  ror $c039,x
$0b:b5c1  c0 67 e3	  cpy #$e367
$0b:b5c4  f0 3f		 beq $b605
$0b:b5c6  fe 03 ff	  inc $ff03,x
$0b:b5c9  f3 fe		 sbc ($fe,s),y
$0b:b5cb  7f bc 1f d8   adc $d81fbc,x
$0b:b5cf  0f 8e 07 c6   ora $c6078e
$0b:b5d3  9f 47 f0 1b   sta $1bf047,x
$0b:b5d7  fa			plx
$0b:b5d8  7c 86 3d	  jmp ($3d86,x)
$0b:b5db  4c a1 e6	  jmp $e6a1
$0b:b5de  6f 13 c8 04   adc $04c813
$0b:b5e2  1f 8f 01 02   ora $02018f,x
$0b:b5e6  07 e3		 ora [$e3]
$0b:b5e8  9f c0 ff fe   sta $feffc0,x
$0b:b5ec  37 f3		 and [$f3],y
$0b:b5ee  f8			sed
$0b:b5ef  3f fe 7f c0   and $c07ffe,x
$0b:b5f3  e4 7c		 cpx $7c
$0b:b5f5  2c 31 8e	  bit $8e31
$0b:b5f8  7f 82 e3 81   adc $81e382,x
$0b:b5fc  cf 57 e4 51   cmp $51e457
$0b:b600  ec 65 8e	  cpx $8e65
$0b:b603  71 07		 adc ($07),y
$0b:b605  c7 fc		 cmp [$fc]
$0b:b607  ff 1f ff fc   sbc $fcff1f,x
$0b:b60b  73 fd		 adc ($fd,s),y
$0b:b60d  00 90		 brk #$90
$0b:b60f  70 20		 bvs $b631
$0b:b611  3f 3f 07 ff   and $ff073f,x
$0b:b615  f9 fc 81	  sbc $81fc,y
$0b:b618  c0 36 74	  cpy #$7436
$0b:b61b  38			sec
$0b:b61c  cc 7f 9d	  cpy $9d7f
$0b:b61f  f1 81		 sbc ($81),y
$0b:b621  f8			sed
$0b:b622  2c 11 ce	  bit $ce11
$0b:b625  77 1f		 adc [$1f],y
$0b:b627  f7 3c		 sbc [$3c],y
$0b:b629  8c f8 67	  sty $67f8
$0b:b62c  9c 0f 01	  stz $010f
$0b:b62f  34 21		 bit $21,x
$0b:b631  f2 09		 sbc ($09)
$0b:b633  ff f3 ff 37   sbc $37fff3,x
$0b:b637  f8			sed
$0b:b638  4f e0 04 30   eor $3004e0
$0b:b63c  e4 ee		 cpx $ee
$0b:b63e  74 16		 stz $16,x
$0b:b640  0a			asl a
$0b:b641  5f 2f 5b bf   eor $bf5b2f,x
$0b:b645  a9 7a		 lda #$7a
$0b:b647  b5 95		 lda $95,x
$0b:b649  cb			wai
$0b:b64a  9e 3e b1	  stz $b13e,x
$0b:b64d  67 c3		 adc [$c3]
$0b:b64f  40			rti
$0b:b650  23 f0		 and $f0,s
$0b:b652  09 a4		 ora #$a4
$0b:b654  02 81		 cop #$81
$0b:b656  00 82		 brk #$82
$0b:b658  c0 09 a0	  cpy #$a009
$0b:b65b  de 0c 04	  dec $040c,x
$0b:b65e  03 7f		 ora $7f,s
$0b:b660  db			stp
$0b:b661  ee 7b 26	  inc $267b
$0b:b664  5d 1d 4f	  eor $4f1d,x
$0b:b667  9a			txs
$0b:b668  ad 71 ec	  lda $ec71
$0b:b66b  fa			plx
$0b:b66c  26 fc		 rol $fc
$0b:b66e  eb			xba
$0b:b66f  06 7e		 asl $7e
$0b:b671  37 00		 and [$00],y
$0b:b673  86 40		 stx $40
$0b:b675  e2 06		 sep #$06
$0b:b677  40			rti
$0b:b678  8f e4 21 f0   sta $f021e4
$0b:b67c  88			dey
$0b:b67d  3c 19 bc	  bit $bc19,x
$0b:b680  3b			tsc
$0b:b681  4b			phk
$0b:b682  bf af b9 bf   lda $bfb9af,x
$0b:b686  99 cb 79	  sta $79cb,y
$0b:b689  95 2c		 sta $2c,x
$0b:b68b  0c d6 69	  tsb $69d6
$0b:b68e  df f5 fb 3e   cmp $3efbf5,x
$0b:b692  70 88		 bvs $b61c
$0b:b694  07 01		 ora [$01]
$0b:b696  dc 1c 08	  jml [$081c]
$0b:b699  67 ce		 adc [$ce]
$0b:b69b  01 ff		 ora ($ff,x)
$0b:b69d  9a			txs
$0b:b69e  72 f9		 adc ($f9)
$0b:b6a0  6d e1 d9	  adc $d9e1
$0b:b6a3  7c b9 7c	  jmp ($7cb9,x)
$0b:b6a6  19 ac 26	  ora $26ac,y
$0b:b6a9  95 b3		 sta $b3,x
$0b:b6ab  8b			phb
$0b:b6ac  79 6b f1	  adc $f16b,y
$0b:b6af  a9 d4		 lda #$d4
$0b:b6b1  9b			txy
$0b:b6b2  d3 df		 cmp ($df,s),y
$0b:b6b4  99 43 78	  sta $7843,y
$0b:b6b7  33 e8		 and ($e8,s),y
$0b:b6b9  0f fa 05 fc   ora $fc05fa
$0b:b6bd  82 7e 23	  brl $da3e
$0b:b6c0  5e 09 0f	  lsr $0f09,x
$0b:b6c3  01 82		 ora ($82,x)
$0b:b6c5  1f 5d 95 b3   ora $b3955d,x
$0b:b6c9  87 b6		 sta [$b6]
$0b:b6cb  a8			tay
$0b:b6cc  fa			plx
$0b:b6cd  34 fd		 bit $fd,x
$0b:b6cf  2a			rol a
$0b:b6d0  6d af 49	  adc $49af
$0b:b6d3  b2 e9		 lda ($e9)
$0b:b6d5  57 ad		 eor [$ad],y
$0b:b6d7  b3 08		 lda ($08,s),y
$0b:b6d9  7a			ply
$0b:b6da  00 14		 brk #$14
$0b:b6dc  61 a0		 adc ($a0,x)
$0b:b6de  8f d0 27 ea   sta $ea27d0
$0b:b6e2  50 89		 bvc $b66d
$0b:b6e4  43 71		 eor $71,s
$0b:b6e6  90 0e		 bcc $b6f6
$0b:b6e8  dc 5f 59	  jml [$595f]
$0b:b6eb  4b			phk
$0b:b6ec  97 f3		 sta [$f3],y
$0b:b6ee  2b			pld
$0b:b6ef  f9 3d 9c	  sbc $9c3d,y
$0b:b6f2  b2 d9		 lda ($d9)
$0b:b6f4  5f e9 cc ec   eor $eccce9,x
$0b:b6f8  1e 08 87	  asl $8708,x
$0b:b6fb  82 11 f0	  brl $a70f
$0b:b6fe  86 7c		 stx $7c
$0b:b700  22 7e 02 28   jsl $28027e
$0b:b704  50 30		 bvc $b736
$0b:b706  10 c4		 bpl $b6cc
$0b:b708  00 d4		 brk #$d4
$0b:b70a  b7 df		 lda [$df],y
$0b:b70c  9a			txs
$0b:b70d  3f 73 b7 af   and $afb773,x
$0b:b711  c2 75		 rep #$75
$0b:b713  e9 76 ad	  sbc #$ad76
$0b:b716  04 d7		 tsb $d7
$0b:b718  a5 b2		 lda $b2
$0b:b71a  e8			inx
$0b:b71b  c0 50 83	  cpy #$8350
$0b:b71e  d8			cld
$0b:b71f  90 61		 bcc $b782
$0b:b721  2f 14 39 e2   and $e23914
$0b:b725  94 14		 sty $14,x
$0b:b727  60			rts
$0b:b728  a3 0e		 lda $0e,s
$0b:b72a  6f cf 7f cc   adc $cc7fcf
$0b:b72e  b2 e8		 lda ($e8)
$0b:b730  7a			ply
$0b:b731  54 c8 ac	  mvn $ac,$c8
$0b:b734  27 a7		 and [$a7]
$0b:b736  22 96 f2 eb   jsl $ebf296
$0b:b73a  59 65 60	  eor $6065,y
$0b:b73d  0a			asl a
$0b:b73e  c2 43		 rep #$43
$0b:b740  1e 03 83	  asl $8303,x
$0b:b743  8c 84 21	  sty $2184
$0b:b746  11 f0		 ora ($f0),y
$0b:b748  78			sei
$0b:b749  e3 e6		 sbc $e6,s
$0b:b74b  f4 e3 cf	  pea $cfe3
$0b:b74e  ce e8 ac	  dec $ace8
$0b:b751  13 fd		 ora ($fd,s),y
$0b:b753  f1 f8		 sbc ($f8),y
$0b:b755  18			clc
$0b:b756  fc 02 45	  jsr ($4502,x)
$0b:b759  23 f0		 and $f0,s
$0b:b75b  08			php
$0b:b75c  f4 05 36	  pea $3605
$0b:b75f  07 e0		 ora [$e0]
$0b:b761  bf a8 17 fe   lda $fe17a8,x
$0b:b765  a8			tay
$0b:b766  3c 1d fd	  bit $fd1d,x
$0b:b769  5e 10 7f	  lsr $7f10,x
$0b:b76c  fa			plx
$0b:b76d  cd 21 eb	  cmp $eb21
$0b:b770  a1 54		 lda ($54,x)
$0b:b772  a2 fe 3e	  ldx #$3efe
$0b:b775  0c f3 f0	  tsb $f0f3
$0b:b778  35 57		 and $57,x
$0b:b77a  81 c0		 sta ($c0,x)
$0b:b77c  f8			sed
$0b:b77d  43 db		 eor $db,s
$0b:b77f  e5 e0		 sbc $e0
$0b:b781  8f b9 53 81   sta $8153b9
$0b:b785  3f f6 7f 23   and $237ff6,x
$0b:b789  30 7c		 bmi $b807
$0b:b78b  35 87		 and $87,x
$0b:b78d  71 86		 adc ($86),y
$0b:b78f  83 79		 sta $79,s
$0b:b791  e7 7f		 sbc [$7f]
$0b:b793  c9 84 32	  cmp #$3284
$0b:b796  07 e0		 ora [$e0]
$0b:b798  81 8b		 sta ($8b,x)
$0b:b79a  43 ff		 eor $ff,s
$0b:b79c  e0 ff df	  cpx #$dfff
$0b:b79f  af f1 f8 c3   lda $c3f8f1
$0b:b7a3  80 20		 bra $b7c5
$0b:b7a5  7f c0 18 70   adc $7018c0,x
$0b:b7a9  67 19		 adc [$19]
$0b:b7ab  cc 1d e3	  cpy $e31d
$0b:b7ae  ff c7 fc 58   sbc $58fcc7,x
$0b:b7b2  30 13		 bmi $b7c7
$0b:b7b4  f9 fd 83	  sbc $83fd,y
$0b:b7b7  ff 9f be 7e   sbc $7ebe9f,x
$0b:b7bb  3f d7 ff fb   and $fbffd7,x
$0b:b7bf  98			tya
$0b:b7c0  15 25		 ora $25,x
$0b:b7c2  c0 46 87	  cpy #$8746
$0b:b7c5  82 01 fc	  brl $b3c9
$0b:b7c8  fc 4f e3	  jsr ($e34f,x)
$0b:b7cb  d8			cld
$0b:b7cc  00 78		 brk #$78
$0b:b7ce  63 20		 adc $20,s
$0b:b7d0  7d bf c6	  adc $c6bf,x
$0b:b7d3  5b			tcd
$0b:b7d4  dd 3c e1	  cmp $e13c,x
$0b:b7d7  f8			sed
$0b:b7d8  e3 07		 sbc $07,s
$0b:b7da  e0 c3 fe	  cpx #$fec3
$0b:b7dd  3f 0b e0 8f   and $8fe00b,x
$0b:b7e1  c1 cc		 cmp ($cc,x)
$0b:b7e3  c1 1f		 cmp ($1f,x)
$0b:b7e5  80 c1		 bra $b7a8
$0b:b7e7  a7 13		 lda [$13]
$0b:b7e9  fe 44 32	  inc $3244,x
$0b:b7ec  9b			txy
$0b:b7ed  42 cd		 wdm #$cd
$0b:b7ef  de 24 11	  dec $1124,x
$0b:b7f2  ec 75 c2	  cpx $c275
$0b:b7f5  67 43		 adc [$43]
$0b:b7f7  a7 63		 lda [$63]
$0b:b7f9  7f 37 8f a4   adc $a48f37,x
$0b:b7fd  1f 7d 3e 59   ora $593e7d,x
$0b:b801  8f e4 04 1f   sta $1f04e4
$0b:b805  cc 07 ce	  cpy $ce07
$0b:b808  07 07		 ora [$07]
$0b:b80a  cf cb e6 d5   cmp $d5e6cb
$0b:b80e  df 4c cf a5   cmp $a5cf4c,x
$0b:b812  ee b2 e6	  inc $e6b2
$0b:b815  f0 7b		 beq $b892
$0b:b817  6c 1d 4e	  jmp ($4e1d)
$0b:b81a  05 e6		 ora $e6
$0b:b81c  82 f1 a0	  brl $5910
$0b:b81f  10 98		 bpl $b7b9
$0b:b821  34 4a		 bit $4a,x
$0b:b823  19 64 8c	  ora $8c64,y
$0b:b826  60			rts
$0b:b827  af 88 70 81   lda $817088
$0b:b82b  7f 20 9f 8e   adc $8e9f20,x
$0b:b82f  d4 eb		 pei ($eb)
$0b:b831  47 63		 eor [$63]
$0b:b833  8a			txa
$0b:b834  f5 f9		 sbc $f9,x
$0b:b836  5c e9 a4 ef   jml $efa4e9
$0b:b83a  9f f6 dd 52   sta $52ddf6,x
$0b:b83e  26 bd		 rol $bd
$0b:b840  28			plp
$0b:b841  2c 02 39	  bit $3902
$0b:b844  00 94		 brk #$94
$0b:b846  40			rti
$0b:b847  26 22		 rol $22
$0b:b849  81 83		 sta ($83,x)
$0b:b84b  40			rti
$0b:b84c  21 10		 and ($10,x)
$0b:b84e  78			sei
$0b:b84f  84 3f		 sty $3f
$0b:b851  6b			rtl
$0b:b852  bd a4 72	  lda $72a4,x
$0b:b855  28			plp
$0b:b856  54 29 7c	  mvn $7c,$29
$0b:b859  b7 9f		 lda [$9f],y
$0b:b85b  f3 9c		 sbc ($9c,s),y
$0b:b85d  76 3a		 ror $3a,x
$0b:b85f  bc 89 5c	  ldy $5c89,x
$0b:b862  52 85		 eor ($85)
$0b:b864  00 9b		 brk #$9b
$0b:b866  c0 37 b0	  cpy #$b037
$0b:b869  0e 84 02	  asl $0284
$0b:b86c  07 00		 ora [$00]
$0b:b86e  8c 41 f8	  sty $f841
$0b:b871  03 f0		 ora $f0,s
$0b:b873  ff d5 3b 72   sbc $723bd5,x
$0b:b877  f9 af 67	  sbc $67af,y
$0b:b87a  d3 57		 cmp ($57,s),y
$0b:b87c  c8			iny
$0b:b87d  4c 61 da	  jmp $da61
$0b:b880  2a			rol a
$0b:b881  e4 37		 cpx $37
$0b:b883  e5 32		 sbc $32
$0b:b885  e0 48 20	  cpx #$2048
$0b:b888  1c 44 00	  trb $0044
$0b:b88b  c4 25		 cpy $25
$0b:b88d  e2 61		 sep #$61
$0b:b88f  74 1e		 stz $1e,x
$0b:b891  f7 97		 sbc [$97],y
$0b:b893  6b			rtl
$0b:b894  c3 f6		 cmp $f6,s
$0b:b896  ba			tsx
$0b:b897  d2 d8		 cmp ($d8)
$0b:b899  5d 53 47	  eor $4753,x
$0b:b89c  9b			txy
$0b:b89d  b1 52		 lda ($52),y
$0b:b89f  a6 9a		 ldx $9a
$0b:b8a1  5c d4 20 54   jml $5420d4
$0b:b8a5  11 0e		 ora ($0e),y
$0b:b8a7  8c 82 11	  sty $1182
$0b:b8aa  f0 80		 beq $b82c
$0b:b8ac  7e 11 60	  ror $6011,x
$0b:b8af  26 0c		 rol $0c
$0b:b8b1  05 fe		 ora $fe
$0b:b8b3  33 19		 and ($19,s),y
$0b:b8b5  93 4f		 sta ($4f,s),y
$0b:b8b7  f9 5f b9	  sbc $b95f,y
$0b:b8ba  6f 77 e1 28   adc $28e177
$0b:b8be  da			phx
$0b:b8bf  6b			rtl
$0b:b8c0  3b			tsc
$0b:b8c1  71 79		 adc ($79),y
$0b:b8c3  6f 2f cc a6   adc $a6cc2f
$0b:b8c7  18			clc
$0b:b8c8  24 02		 bit $02
$0b:b8ca  05 00		 ora $00
$0b:b8cc  93 c0		 sta ($c0,s),y
$0b:b8ce  34 74		 bit $74,x
$0b:b8d0  08			php
$0b:b8d1  87 80		 sta [$80]
$0b:b8d3  0a			asl a
$0b:b8d4  16 4d		 asl $4d,x
$0b:b8d6  1f 52 87 ea   ora $ea8752,x
$0b:b8da  92 c9		 sta ($c9)
$0b:b8dc  78			sei
$0b:b8dd  1d af 55	  ora $55af,x
$0b:b8e0  be ef 99	  ldx $99ef,y
$0b:b8e3  f4 dd b2	  pea $b2dd
$0b:b8e6  12 08		 ora ($08)
$0b:b8e8  fd 02 7e	  sbc $7e02,x
$0b:b8eb  3f 08 04 7e   and $7e0408,x
$0b:b8ef  15 05		 ora $05,x
$0b:b8f1  c3 b8		 cmp $b8,s
$0b:b8f3  8a			txa
$0b:b8f4  1f 95 86 ed   ora $ed8695,x
$0b:b8f8  65 b6		 adc $b6
$0b:b8fa  aa			tax
$0b:b8fb  dd 4a 67	  cmp $674a,x
$0b:b8fe  85 f3		 sta $f3
$0b:b900  75 76		 adc $76,x
$0b:b902  dd 3d ef	  cmp $ef3d,x
$0b:b905  bb			tyx
$0b:b906  a5 02		 lda $02
$0b:b908  f0 48		 beq $b952
$0b:b90a  b8			clv
$0b:b90b  14 4c		 trb $4c
$0b:b90d  04 33		 tsb $33
$0b:b90f  01 98		 ora ($98,x)
$0b:b911  80 62		 bra $b975
$0b:b913  20 18 18	  jsr $1818
$0b:b916  07 0a		 ora [$0a]
$0b:b918  03 c7		 ora $c7,s
$0b:b91a  9f 9b c3 1d   sta $1dc39b,x
$0b:b91e  7e 39 c0	  ror $c039,x
$0b:b921  00 00		 brk #$00
$0b:b923  01 01		 ora ($01,x)
$0b:b925  41 4c		 eor ($4c,x)
$0b:b927  7a			ply
$0b:b928  02 8f		 cop #$8f
$0b:b92a  09 f4		 ora #$f4
$0b:b92c  06 79		 asl $79
$0b:b92e  03 4a		 ora $4a,s
$0b:b930  b3 a1		 lda ($a1,s),y
$0b:b932  54 0f 0f	  mvn $0f,$0f
$0b:b935  ff ab ca 3e   sbc $3ecaab,x
$0b:b939  b4 74		 ldy $74,x
$0b:b93b  ff 70 19 e7   sbc $e71970,x
$0b:b93f  80 6a		 bra $b9ab
$0b:b941  bf 02 7e df   lda $df7e02,x
$0b:b945  20 68 39	  jsr $3968
$0b:b948  5a			phy
$0b:b949  73 01		 adc ($01,s),y
$0b:b94b  e6 73		 inc $73
$0b:b94d  e6 fb		 inc $fb
$0b:b94f  8e f4 9e	  stx $9ef4
$0b:b952  73 06		 adc ($06,s),y
$0b:b954  b1 e0		 lda ($e0),y
$0b:b956  26 13		 rol $13
$0b:b958  ec 7f c7	  cpx $c77f
$0b:b95b  fd f8 98	  sbc $98f8,x
$0b:b95e  78			sei
$0b:b95f  28			plp
$0b:b960  18			clc
$0b:b961  08			php
$0b:b962  3f 82 03 fe   and $fe0382,x
$0b:b966  f0 47		 beq $b9af
$0b:b968  f8			sed
$0b:b969  50 34		 bvc $b99f
$0b:b96b  18			clc
$0b:b96c  63 38		 adc $38,s
$0b:b96e  7f 98 c7 43   adc $43c798,x
$0b:b972  dd 66 f0	  cmp $f066,x
$0b:b975  f9 20 93	  sbc $9320,y
$0b:b978  fd fc c2	  sbc $c2fc,x
$0b:b97b  1f 86 f0 c0   ora $c0f086,x
$0b:b97f  27 f1		 and [$f1]
$0b:b981  88			dey
$0b:b982  3f fa 3f 9f   and $9f3ffa,x
$0b:b986  bf fe e0 f4   lda $f4e0fe,x
$0b:b98a  0c 1c 03	  tsb $031c
$0b:b98d  f1 e0		 sbc ($e0),y
$0b:b98f  bf f3 38 53   lda $5338f3,x
$0b:b993  3e 05 f2	  rol $f205,x
$0b:b996  71 19		 adc ($19),y
$0b:b998  c0 ef 2f	  cpy #$2fef
$0b:b99b  f6 38		 inc $38,x
$0b:b99d  e6 63		 inc $63
$0b:b99f  0d 6c f7	  ora $f76c
$0b:b9a2  cf 96 01 0f   cmp $0f0196
$0b:b9a6  9f f0 f3 de   sta $def3f0,x
$0b:b9aa  06 78		 asl $78
$0b:b9ac  7c 3e 17	  jmp ($173e,x)
$0b:b9af  e5 a0		 sbc $a0
$0b:b9b1  7c 2c d1	  jmp ($d12c,x)
$0b:b9b4  e8			inx
$0b:b9b5  17 0e		 ora [$0e],y
$0b:b9b7  65 3c		 adc $3c
$0b:b9b9  ce 78 df	  dec $df78
$0b:b9bc  21 8c		 and ($8c,x)
$0b:b9be  be 5c e1	  ldx $e15c,y
$0b:b9c1  f1 8e		 sbc ($8e),y
$0b:b9c3  04 07		 tsb $07
$0b:b9c5  ff dc 23 04   sbc $0423dc,x
$0b:b9c9  06 0f		 asl $0f
$0b:b9cb  07 8f		 ora [$8f]
$0b:b9cd  c7 d3		 cmp [$d3]
$0b:b9cf  c5 df		 cmp $df
$0b:b9d1  f0 66		 beq $ba39
$0b:b9d3  63 f7		 adc $f7,s
$0b:b9d5  49 66		 eor #$66
$0b:b9d7  da			phx
$0b:b9d8  5d 68 ac	  eor $ac68,x
$0b:b9db  74 b6		 stz $b6,x
$0b:b9dd  56 ba		 lsr $ba,x
$0b:b9df  de ca 5b	  dec $5bca,x
$0b:b9e2  5e c9 46	  lsr $46c9,x
$0b:b9e5  3c 12 3e	  bit $3e12,x
$0b:b9e8  04 87		 tsb $87
$0b:b9ea  81 47		 sta ($47,x)
$0b:b9ec  c0 63 60	  cpy #$6063
$0b:b9ef  14 4c		 trb $4c
$0b:b9f1  04 83		 tsb $83
$0b:b9f3  81 12		 sta ($12,x)
$0b:b9f5  f0 d6		 beq $b9cd
$0b:b9f7  ed 1a cd	  sbc $cd1a
$0b:b9fa  a4 be		 ldy $be
$0b:b9fc  67 5f		 adc [$5f]
$0b:b9fe  b6 6c		 ldx $6c,y
$0b:ba00  fa			plx
$0b:ba01  76 cd		 ror $cd,x
$0b:ba03  07 4f		 ora [$4f]
$0b:ba05  99 60 8f	  sta $8f60,y
$0b:ba08  e2 20		 sep #$20
$0b:ba0a  f4 48 1f	  pea $1f48
$0b:ba0d  0c 1c 10	  tsb $101c
$0b:ba10  08			php
$0b:ba11  9c 32 41	  stz $4132
$0b:ba14  1f e0 4f d8   ora $d84fe0,x
$0b:ba18  01 52		 ora ($52,x)
$0b:ba1a  a0 fe 77	  ldy #$77fe
$0b:ba1d  1d c9 26	  ora $26c9,x
$0b:ba20  be f7 d7	  ldx $d7f7,y
$0b:ba23  da			phx
$0b:ba24  5a			phy
$0b:ba25  ab			plb
$0b:ba26  f3 59		 sbc ($59,s),y
$0b:ba28  6e ca 5d	  ror $5dca
$0b:ba2b  40			rti
$0b:ba2c  df ee 20 f0   cmp $f020ee,x
$0b:ba30  48			pha
$0b:ba31  1c 0e 01	  trb $010e
$0b:ba34  88			dey
$0b:ba35  80 00		 bra $ba37
$0b:ba37  c2 44		 rep #$44
$0b:ba39  82 1e 74	  brl $2e5a
$0b:ba3c  37 7d		 and [$7d],y
$0b:ba3e  33 b2		 and ($b2,s),y
$0b:ba40  d7 ba		 cmp [$ba],y
$0b:ba42  5b			tcd
$0b:ba43  38			sec
$0b:ba44  af db a5 dd   lda $dda5db
$0b:ba48  97 cd		 sta [$cd],y
$0b:ba4a  ab			plb
$0b:ba4b  36 98		 rol $98,x
$0b:ba4d  67 c2		 adc [$c2]
$0b:ba4f  61 c0		 adc ($c0,x)
$0b:ba51  01 82		 ora ($82,x)
$0b:ba53  94 21		 sty $21,x
$0b:ba55  10 09		 bpl $ba60
$0b:ba57  04 03		 tsb $03
$0b:ba59  8d 00 c4	  sta $c400
$0b:ba5c  c1 bb		 cmp ($bb,x)
$0b:ba5e  34 6d		 bit $6d,x
$0b:ba60  06 7e		 asl $7e
$0b:ba62  97 34		 sta [$34],y
$0b:ba64  d6 d0		 dec $d0,x
$0b:ba66  2a			rol a
$0b:ba67  51 5d		 eor ($5d),y
$0b:ba69  66 8e		 ror $8e
$0b:ba6b  77 c8		 adc [$c8],y
$0b:ba6d  e6 54		 inc $54
$0b:ba6f  28			plp
$0b:ba70  13 fc		 ora ($fc,s),y
$0b:ba72  05 fc		 ora $fc
$0b:ba74  d6 06		 dec $06,x
$0b:ba76  b0 88		 bcs $ba00
$0b:ba78  7b			tdc
$0b:ba79  f4 15 f8	  pea $f815
$0b:ba7c  44 1e 41	  mvp $41,$1e
$0b:ba7f  03 df		 ora $df,s
$0b:ba81  c9 3b		 cmp #$3b
$0b:ba83  91 39		 sta ($39),y
$0b:ba85  94 bb		 sty $bb,x
$0b:ba87  53 19		 eor ($19,s),y
$0b:ba89  ab			plb
$0b:ba8a  63 bb		 adc $bb,s
$0b:ba8c  31 79		 and ($79),y
$0b:ba8e  bc c6 c1	  ldy $c1c6,x
$0b:ba91  60			rts
$0b:ba92  92 70		 sta ($70)
$0b:ba94  22 1e 04 18   jsl $18041e
$0b:ba98  41 8b		 eor ($8b,x)
$0b:ba9a  c1 e0		 cmp ($e0,x)
$0b:ba9c  10 84		 bpl $ba22
$0b:ba9e  c7 91		 cmp [$91]
$0b:baa0  60			rts
$0b:baa1  cf ed 31 1e   cmp $1e31ed
$0b:baa5  b9 1e ff	  lda $ff1e,y
$0b:baa8  99 2d 99	  sta $992d,y
$0b:baab  d4 af		 pei ($af)
$0b:baad  d3 5e		 cmp ($5e,s),y
$0b:baaf  5f 7e 29 ec   eor $ec297e,x
$0b:bab3  86 00		 stx $00
$0b:bab5  42 47		 wdm #$47
$0b:bab7  1c 86 40	  trb $4086
$0b:baba  38			sec
$0b:babb  10 0c		 bpl $bac9
$0b:babd  0c 00 90	  tsb $9000
$0b:bac0  11 49		 ora ($49),y
$0b:bac2  04 33		 tsb $33
$0b:bac4  e7 b6		 sbc [$b6]
$0b:bac6  85 72		 sta $72
$0b:bac8  e7 b3		 sbc [$b3]
$0b:baca  6f b5 2e 9b   adc $9b2eb5
$0b:bace  17 8c		 ora [$8c],y
$0b:bad0  57 fc		 eor [$fc],y
$0b:bad2  b3 ae		 lda ($ae,s),y
$0b:bad4  d7 be		 cmp [$be],y
$0b:bad6  4d 02 e0	  eor $e002
$0b:bad9  c0 60 10	  cpy #$1060
$0b:badc  a8			tay
$0b:badd  0e c6 01	  asl $01c6
$0b:bae0  e0 80 41	  cpx #$4180
$0b:bae3  60			rts
$0b:bae4  11 a8		 ora ($a8),y
$0b:bae6  2c 9a 32	  bit $329a
$0b:bae9  c4 08		 cpy $08
$0b:baeb  39 c4 61	  and $61c4,y
$0b:baee  e7 53		 sbc [$53]
$0b:baf0  8f 9e c6 07   sta $07c69e
$0b:baf4  ff 83 a0 06   sbc $06a083,x
$0b:baf8  1e 84 38	  asl $3884,x
$0b:bafb  fa			plx
$0b:bafc  28			plp
$0b:bafd  49 02		 eor #$02
$0b:baff  91 f5		 sta ($f5),y
$0b:bb01  17 ac		 ora [$ac],y
$0b:bb03  fd 89 ed	  sbc $ed89,x
$0b:bb06  5f 6f 37 fa   eor $fa376f,x
$0b:bb0a  1f e3 be 47   ora $47bee3,x
$0b:bb0e  3c 7c 09	  bit $097c,x
$0b:bb11  85 92		 sta $92
$0b:bb13  c7 4d		 cmp [$4d]
$0b:bb15  9e 47 30	  stz $3047,x
$0b:bb18  1d 69 3c	  ora $3c69,x
$0b:bb1b  3c 7e 10	  bit $107e,x
$0b:bb1e  0f e7 0f ff   ora $ff0fe7
$0b:bb22  f0 cf		 beq $baf3
$0b:bb24  cf e0 7f ec   cmp $ec7fe0
$0b:bb28  7f c3 f1 e0   adc $e0f1c3,x
$0b:bb2c  b8			clv
$0b:bb2d  e2 33		 sep #$33
$0b:bb2f  18			clc
$0b:bb30  6b			rtl
$0b:bb31  9f c2 9d 3e   sta $3e9dc2,x
$0b:bb35  99 c0 f3	  sta $f3c0,y
$0b:bb38  31 ee		 and ($ee),y
$0b:bb3a  77 c6		 adc [$c6],y
$0b:bb3c  73 c8		 adc ($c8,s),y
$0b:bb3e  fc 43 ef	  jsr ($ef43,x)
$0b:bb41  c8			iny
$0b:bb42  81 c0		 sta ($c0,x)
$0b:bb44  df e1 9f 03   cmp $039fe1,x
$0b:bb48  38			sec
$0b:bb49  40			rti
$0b:bb4a  60			rts
$0b:bb4b  27 40		 and [$40]
$0b:bb4d  d9 df 2d	  cmp $2ddf,y
$0b:bb50  f1 38		 sbc ($38),y
$0b:bb52  37 06		 and [$06],y
$0b:bb54  49 3a		 eor #$3a
$0b:bb56  93 70		 sta ($70,s),y
$0b:bb58  7f 33 99 64   adc $649933,x
$0b:bb5c  3f 0f 61 9f   and $9f610f,x
$0b:bb60  f0 21		 beq $bb83
$0b:bb62  9f 3e 07 ff   sta $ff073e,x
$0b:bb66  85 83		 sta $83
$0b:bb68  3d 84 1a	  and $1a84,x
$0b:bb6b  f1 10		 sbc ($10),y
$0b:bb6d  f0 78		 beq $bbe7
$0b:bb6f  3f fc 39 9c   and $9c39fc,x
$0b:bb73  c2 1f		 rep #$1f
$0b:bb75  63 f0		 adc $f0,s
$0b:bb77  50 24		 bvc $bb9d
$0b:bb79  11 e8		 ora ($e8),y
$0b:bb7b  ff 0f f1 30   sbc $30f10f,x
$0b:bb7f  87 71		 sta [$71]
$0b:bb81  b8			clv
$0b:bb82  3f 0b e7 fd   and $fde70b,x
$0b:bb86  14 44		 trb $44
$0b:bb88  c0 6f 04	  cpy #$046f
$0b:bb8b  1f fd ff 9f   ora $9ffffd,x
$0b:bb8f  ff f3 b1 4b   sbc $4bb1f3,x
$0b:bb93  5d e3 b5	  eor $b5e3,x
$0b:bb96  a9 d6		 lda #$d6
$0b:bb98  dd 2a 9d	  cmp $9d2a,x
$0b:bb9b  cc de 77	  cpy $77de
$0b:bb9e  95 cb		 sta $cb,x
$0b:bba0  a2 f1 62	  ldx #$62f1
$0b:bba3  9e 3b 46	  stz $463b,x
$0b:bba6  1f 11 07 82   ora $820711,x
$0b:bbaa  40			rti
$0b:bbab  e4 90		 cpx $90
$0b:bbad  3b			tsc
$0b:bbae  0c 02 69	  tsb $6902
$0b:bbb1  00 9d		 brk #$9d
$0b:bbb3  40			rti
$0b:bbb4  23 3e		 and $3e,s
$0b:bbb6  69 37		 adc #$37
$0b:bbb8  03 95		 ora $95,s
$0b:bbba  04 96		 tsb $96
$0b:bbbc  c8			iny
$0b:bbbd  be 1d 7d	  ldx $7d1d,y
$0b:bbc0  a5 4f		 lda $4f
$0b:bbc2  b7 e8		 lda [$e8],y
$0b:bbc4  96 a2		 stx $a2,y
$0b:bbc6  c3 fe		 cmp $fe,s
$0b:bbc8  9f 29 07 7f   sta $7f0729,x
$0b:bbcc  a1 0f		 lda ($0f,x)
$0b:bbce  88			dey
$0b:bbcf  43 e1		 eor $e1,s
$0b:bbd1  10 7e		 bpl $bc51
$0b:bbd3  24 0e		 bit $0e
$0b:bbd5  c9 5c		 cmp #$5c
$0b:bbd7  ea			nop
$0b:bbd8  6f 3d 5d a9   adc $a95d3d
$0b:bbdc  2c ff b5	  bit $b5ff
$0b:bbdf  15 b7		 ora $b7,x
$0b:bbe1  e2 33		 sep #$33
$0b:bbe3  31 6b		 and ($6b),y
$0b:bbe5  b5 be		 lda $be,x
$0b:bbe7  87 80		 sta [$80]
$0b:bbe9  c1 c0		 cmp ($c0,x)
$0b:bbeb  38			sec
$0b:bbec  b0 09		 bcs $bbf7
$0b:bbee  07 00		 ora [$00]
$0b:bbf0  96 10		 stx $10,y
$0b:bbf2  8f 81 2c 2c   sta $2c2c81
$0b:bbf6  18			clc
$0b:bbf7  0c b7 c3	  tsb $c3b7
$0b:bbfa  6b			rtl
$0b:bbfb  d2 b5		 cmp ($b5)
$0b:bbfd  69 2a		 adc #$2a
$0b:bbff  7c dc 2c	  jmp ($2cdc,x)
$0b:bc02  67 ab		 adc [$ab]
$0b:bc04  49 e9		 eor #$e9
$0b:bc06  d0 bd		 bne $bbc5
$0b:bc08  f2 c5		 sbc ($c5)
$0b:bc0a  48			pha
$0b:bc0b  2a			rol a
$0b:bc0c  42 41		 wdm #$41
$0b:bc0e  1f a0 cf a0   ora $a0cfa0,x
$0b:bc12  37 e7		 and [$e7],y
$0b:bc14  28			plp
$0b:bc15  50 a7		 bvc $bbbe
$0b:bc17  8d e0 d5	  sta $d5e0
$0b:bc1a  fb			xce
$0b:bc1b  7c ba 6e	  jmp ($6eba,x)
$0b:bc1e  d5 73		 cmp $73,x
$0b:bc20  5b			tcd
$0b:bc21  70 af		 bvs $bbd2
$0b:bc23  6b			rtl
$0b:bc24  7e 95 3b	  ror $3b95,x
$0b:bc27  5e 93 4d	  lsr $4d93,x
$0b:bc2a  c0 c8		 cpy #$c8
$0b:bc2c  c0 33		 cpy #$33
$0b:bc2e  0c 40 80	  tsb $8040
$0b:bc31  c0 20		 cpy #$20
$0b:bc33  70 c8		 bvs $bbfd
$0b:bc35  1d 41 c4	  ora $c441,x
$0b:bc38  30 08		 bmi $bc42
$0b:bc3a  ff 6b 8b a3   sbc $a38b6b,x
$0b:bc3e  ce 45 65	  dec $6545
$0b:bc41  14 ad		 trb $ad
$0b:bc43  8c d3 89	  sty $89d3
$0b:bc46  4f c4 ce a6   eor $a6cec4
$0b:bc4a  fb			xce
$0b:bc4b  59 6f 02	  eor $026f,y
$0b:bc4e  7f 80 bf a7   adc $a7bf80,x
$0b:bc52  ca			dex
$0b:bc53  09 fb		 ora #$fb
$0b:bc55  84 fc		 sty $fc
$0b:bc57  26 1c		 rol $1c
$0b:bc59  09 17		 ora #$17
$0b:bc5b  03 6b		 ora $6b,s
$0b:bc5d  42 a4		 wdm #$a4
$0b:bc5f  4d e8 5b	  eor $5be8
$0b:bc62  d9 7f 4b	  cmp $4b7f,y
$0b:bc65  9f 0c 9c 49   sta $499c0c,x
$0b:bc69  fa			plx
$0b:bc6a  b3 79		 lda ($79,s),y
$0b:bc6c  5f ad 3e 90   eor $903ead,x
$0b:bc70  2f ec 33 e0   and $e033ec
$0b:bc74  c5 08		 cmp $08
$0b:bc76  44 02 29	  mvp $29,$02
$0b:bc79  00 ab		 brk #$ab
$0b:bc7b  48			pha
$0b:bc7c  a5 fc		 lda $fc
$0b:bc7e  9e cc 5a	  stz $5acc,x
$0b:bc81  ad 6f 99	  lda $996f
$0b:bc84  fc f4 5a	  jsr ($5af4,x)
$0b:bc87  38			sec
$0b:bc88  6c 36 65	  jmp ($6536)
$0b:bc8b  3e 81 7e	  rol $7e81,x
$0b:bc8e  45 20		 eor $20
$0b:bc90  c7 0a		 cmp [$0a]
$0b:bc92  06 02		 asl $02
$0b:bc94  19 00 ae	  ora $ae00,y
$0b:bc97  40			rti
$0b:bc98  3e 50 0e	  rol $0e50,x
$0b:bc9b  08			php
$0b:bc9c  34 0d		 bit $0d,x
$0b:bc9e  e3 3f		 sbc $3f,s
$0b:bca0  39 cc 7f	  and $7fcc,y
$0b:bca3  fe 7f 09	  inc $097f,x
$0b:bca6  fa			plx
$0b:bca7  0a			asl a
$0b:bca8  60			rts
$0b:bca9  08			php
$0b:bcaa  ff 50 7a c7   sbc $c77a50,x
$0b:bcae  d8			cld
$0b:bcaf  5e d3 f7	  lsr $f7d3,x
$0b:bcb2  27 bd		 and [$bd]
$0b:bcb4  7c 0d e1	  jmp ($e10d,x)
$0b:bcb7  7f 14 78 e7   adc $e77814,x
$0b:bcbb  c9 5e		 cmp #$5e
$0b:bcbd  5b			tcd
$0b:bcbe  f3 67		 sbc ($67,s),y
$0b:bcc0  9f 7d 1d e9   sta $e91d7d,x
$0b:bcc4  ff 58 7b 07   sbc $077b58,x
$0b:bcc8  da			phx
$0b:bcc9  5e de 9f	  lsr $9fde,x
$0b:bccc  fb			xce
$0b:bccd  ba			tsx
$0b:bcce  7f 90 3f 84   adc $843f90,x
$0b:bcd2  3d bf ee	  and $eebf,x
$0b:bcd5  e5 7e		 sbc $7e
$0b:bcd7  86 02		 stx $02
$0b:bcd9  fe ee 08	  inc $08ee,x
$0b:bcdc  7b			tdc
$0b:bcdd  bc 00 1e	  ldy $1e00,x
$0b:bce0  15 27		 ora $27,x
$0b:bce2  71 07		 adc ($07),y
$0b:bce4  40			rti
$0b:bce5  74 41		 stz $41,x
$0b:bce7  ff 80 70 27   sbc $277080,x
$0b:bceb  ee e2 9f	  inc $9fe2
$0b:bcee  8e 8f 81	  stx $818f
$0b:bcf1  c0 6f		 cpy #$6f
$0b:bcf3  61 48		 adc ($48,x)
$0b:bcf5  0d de 7f	  ora $7fde
$0b:bcf8  f4 87 a8	  pea $a887
$0b:bcfb  7d 65 ec	  adc $ec65,x
$0b:bcfe  3f 6a 7b 97   and $977b6a,x
$0b:bd02  de de 07	  dec $07de,x
$0b:bd05  f0 c7		 beq $bcce
$0b:bd07  8a			txa
$0b:bd08  7c 75 e4	  jmp ($e475,x)
$0b:bd0b  bf 2e 79 b7   lda $b7792e,x
$0b:bd0f  cf de 8f f4   cmp $f48fde
$0b:bd13  f6 7f		 inc $7f,x
$0b:bd15  d5 d7		 cmp $d7,x
$0b:bd17  fe 80 a7	  inc $a780,x
$0b:bd1a  fd 5c 3f	  sbc $3f5c,x
$0b:bd1d  c8			iny
$0b:bd1e  1f c2 1f e0   ora $e01fc2,x
$0b:bd22  8f e0 ef f0   sta $f0efe0
$0b:bd26  7f fc 7d 5e   adc $5e7dfc,x
$0b:bd2a  09 ed		 ora #$ed
$0b:bd2c  e0 4f		 cpx #$4f
$0b:bd2e  e0 7f		 cpx #$7f
$0b:bd30  f8			sed
$0b:bd31  7f fe 7f ff   adc $ff7ffe,x
$0b:bd35  7b			tdc
$0b:bd36  07 f3		 ora [$f3]
$0b:bd38  f9 f0 f8	  sbc $f8f0,y
$0b:bd3b  70 38		 bvs $bd75
$0b:bd3d  09 e8		 ora #$e8
$0b:bd3f  81 c0		 sta ($c0,x)
$0b:bd41  21 f0		 and ($f0,x)
$0b:bd43  09 fc		 ora #$fc
$0b:bd45  02 fe		 cop #$fe
$0b:bd47  f6 1f		 inc $1f,x
$0b:bd49  c7 e1		 cmp [$e1]
$0b:bd4b  fa			plx
$0b:bd4c  50 70		 bvc $bdbe
$0b:bd4e  60			rts
$0b:bd4f  b7 90		 lda [$90],y
$0b:bd51  32 8a		 and ($8a)
$0b:bd53  f4 09 86	  pea $8609
$0b:bd56  03 00		 ora $00,s
$0b:bd58  17 2b		 ora [$2b],y
$0b:bd5a  fb			xce
$0b:bd5b  39 46 ac	  and $ac46,y
$0b:bd5e  af 64 f1 09   lda $09f164
$0b:bd62  59 ae 0a	  eor $0aae,y
$0b:bd65  e0 57		 cpx #$57
$0b:bd67  e3 7b		 sbc $7b,s
$0b:bd69  cf be 8e f4   cmp $f48ebe
$0b:bd6d  ff ac 3d 83   sbc $833dac,x
$0b:bd71  ed 2f 71	  sbc $712f
$0b:bd74  fb			xce
$0b:bd75  d3 c0		 cmp ($c0,s),y
$0b:bd77  be 16 f1	  ldx $f116,y
$0b:bd7a  3f 8e 3c 93   and $933c8e,x
$0b:bd7e  e5 af		 sbc $af
$0b:bd80  35 f9		 and $f9,x
$0b:bd82  f3 d1		 sbc ($d1,s),y
$0b:bd84  be 9e ef	  ldx $ef9e,y
$0b:bd87  e4 0f		 cpx $0f
$0b:bd89  f1 07		 sbc ($07),y
$0b:bd8b  f8			sed
$0b:bd8c  c3 fc		 cmp $fc,s
$0b:bd8e  71 fe		 adc ($fe),y
$0b:bd90  3c ff 1f	  bit $1fff,x
$0b:bd93  7f 8f ff e7   adc $e7ff8f,x
$0b:bd97  df e4 f6 40   cmp $40f6e4,x
$0b:bd9b  60			rts
$0b:bd9c  13 ff		 ora ($ff,s),y
$0b:bd9e  fd f3 f9	  sbc $f9f3,x
$0b:bda1  f8			sed
$0b:bda2  fc 78 3c	  jsr ($3c78,x)
$0b:bda5  1c 1e 06	  trb $061e
$0b:bda8  0f 01 07 80   ora $800701
$0b:bdac  47 d3		 eor [$d3]
$0b:bdae  c3 03		 cmp $03,s
$0b:bdb0  80 36		 bra $bde8
$0b:bdb2  ca			dex
$0b:bdb3  7f 00 bf c0   adc $c0bf00,x
$0b:bdb7  3f ee a1 70   and $70a1ee,x
$0b:bdbb  84 3d		 sty $3d
$0b:bdbd  cc aa f0	  cpy $f0aa
$0b:bdc0  f8			sed
$0b:bdc1  43 fc		 eor $fc,s
$0b:bdc3  0b			phd
$0b:bdc4  b0 75		 bcs $be3b
$0b:bdc6  1b			tcs
$0b:bdc7  fe bf d0	  inc $d0bf,x
$0b:bdca  17 d8		 ora [$d8],y
$0b:bdcc  70 1c		 bvs $bdea
$0b:bdce  e0 eb		 cpx #$eb
$0b:bdd0  18			clc
$0b:bdd1  0f fe 0f ff   ora $ff0ffe
$0b:bdd5  7f f0 55 1d   adc $1d55f0,x
$0b:bdd9  41 03		 eor ($03,x)
$0b:bddb  ff b3 c0 74   sbc $74c0b3,x
$0b:bddf  60			rts
$0b:bde0  0d 00 22	  ora $2200
$0b:bde3  ec 0a ce	  cpx $ce0a
$0b:bde6  40			rti
$0b:bde7  e3 7f		 sbc $7f,s
$0b:bde9  a0 3d		 ldy #$3d
$0b:bdeb  23 ea		 and $ea,s
$0b:bded  2f 59 fb 13   and $13fb59
$0b:bdf1  da			phx
$0b:bdf2  be e6 f7	  ldx $f7e6,y
$0b:bdf5  bf 82 3c 33   lda $333c82,x
$0b:bdf9  e2 af		 sep #$af
$0b:bdfb  1d f9 33	  ora $33f9,x
$0b:bdfe  cb			wai
$0b:bdff  be 6e f3	  ldx $f36e,y
$0b:be02  f6 ff		 inc $ff,x
$0b:be04  20 7f 88	  jsr $887f
$0b:be07  3a			dec a
$0b:be08  44 3e 30	  mvp $30,$3e
$0b:be0b  ff 0c 7f c7   sbc $c77f0c,x
$0b:be0f  1f e3 cf d3   ora $d3cfe3,x
$0b:be13  60			rts
$0b:be14  7e e9 e7	  ror $e7e9,x
$0b:be17  f2 f1		 sbc ($f1)
$0b:be19  f8			sed
$0b:be1a  f8			sed
$0b:be1b  7c 3c 3e	  jmp ($3e3c,x)
$0b:be1e  05 a8		 ora $a8
$0b:be20  70 f8		 bvs $be1a
$0b:be22  18			clc
$0b:be23  7c 06 3f	  jmp ($3f06,x)
$0b:be26  01 03		 ora ($03,x)
$0b:be28  80 41		 bra $be6b
$0b:be2a  e0 10		 cpx #$10
$0b:be2c  f8			sed
$0b:be2d  04 7d		 tsb $7d
$0b:be2f  88			dey
$0b:be30  29 e0		 and #$e0
$0b:be32  bf b2 85 92   lda $9285b2,x
$0b:be36  5f e8 0a 3c   eor $3c0ae8,x
$0b:be3a  be 10 ff	  ldx $ff10,y
$0b:be3d  04 7f		 tsb $7f
$0b:be3f  81 3f		 sta ($3f,x)
$0b:be41  ff c0 1b f9   sbc $f91bc0,x
$0b:be45  80 65		 bra $beac
$0b:be47  87 fe		 sta [$fe]
$0b:be49  03 ff		 ora $ff,s
$0b:be4b  81 ff		 sta ($ff,x)
$0b:be4d  e1 ff		 sbc ($ff,x)
$0b:be4f  f8			sed
$0b:be50  ff fd bc 17   sbc $17bcfd,x
$0b:be54  ff fb 7f 9f   sbc $9f7ffb,x
$0b:be58  20 fd 10	  jsr $10fd
$0b:be5b  91 ff		 sta ($ff),y
$0b:be5d  3f 8b 30 e0   and $e0308b,x
$0b:be61  70 1b		 bvs $be7e
$0b:be63  f0 8f		 beq $bdf4
$0b:be65  06 c8		 asl $c8
$0b:be67  37 44		 and [$44],y
$0b:be69  24 3f		 bit $3f
$0b:be6b  ef f7 83 c0   sbc $c083f7
$0b:be6f  7e 66 f9	  ror $f966,x
$0b:be72  34 c1		 bit $c1,x
$0b:be74  b6 0e		 ldx $0e,y
$0b:be76  06 7f		 asl $7f
$0b:be78  00 d6		 brk #$d6
$0b:be7a  07 68		 ora [$68]
$0b:be7c  45 87		 eor $87
$0b:be7e  01 9b		 ora ($9b,x)
$0b:be80  fd 01 e9	  sbc $e901,x
$0b:be83  1f 51 7a cf   ora $cf7a51,x
$0b:be87  d8			cld
$0b:be88  9e d5 f7	  stz $f7d5,x
$0b:be8b  37 bd		 and [$bd],y
$0b:be8d  fc 11 e1	  jsr ($e111,x)
$0b:be90  9f 15 78 ef   sta $ef7815,x
$0b:be94  c9 9e		 cmp #$9e
$0b:be96  5d ff f9	  eor $f9ff,x
$0b:be99  b9 7f d0	  lda $d07f,y
$0b:be9c  13 b8		 ora ($b8,s),y
$0b:be9e  7f 20 67 b0   adc $b06720,x
$0b:bea2  2f 76 3e fe   and $fe3e76
$0b:bea6  8f 08 f7 f9   sta $f9f708
$0b:beaa  26 13		 rol $13
$0b:beac  cf e2 5c 2f   cmp $2f5ce2
$0b:beb0  1f 84 d8 17   ora $17d884,x
$0b:beb4  8a			txa
$0b:beb5  02 a2		 cop #$a2
$0b:beb7  13 f0		 ora ($f0,s),y
$0b:beb9  1f 82 0e aa   ora $aa0e82,x
$0b:bebd  18			clc
$0b:bebe  7c 02 3f	  jmp ($3f02,x)
$0b:bec1  00 9f		 brk #$9f
$0b:bec3  c0 27		 cpy #$27
$0b:bec5  d0 1b		 bne $bee2
$0b:bec7  e4 0d		 cpx $0d
$0b:bec9  6e 1f 88	  ror $881f
$0b:becc  3a			dec a
$0b:becd  ec 0d ec	  cpx $ec0d
$0b:bed0  6f 6c 05 fe   adc $fe056c
$0b:bed4  03 ff		 ora $ff,s
$0b:bed6  81 ff		 sta ($ff,x)
$0b:bed8  d7 c1		 cmp [$c1],y
$0b:beda  0f 6b 0c 7f   ora $7f0c6b
$0b:bede  ff 3f ff af   sbc $afff3f,x
$0b:bee2  f9 bc 1f	  sbc $1fbc,y
$0b:bee5  ef f7 f3 f9   sbc $f9f3f7
$0b:bee9  f8			sed
$0b:beea  fc 7c 3e	  jsr ($3e7c,x)
$0b:beed  1e 0f 07	  asl $070f,x
$0b:bef0  03 81		 ora $81,s
$0b:bef2  80 c0		 bra $beb4
$0b:bef4  1d 48 f6	  ora $f648,x
$0b:bef7  0b			phd
$0b:bef8  b0 f8		 bcs $bef2
$0b:befa  43 fc		 eor $fc,s
$0b:befc  11 fe		 ora ($fe),y
$0b:befe  04 fd		 tsb $fd
$0b:bf00  9e 0f d0	  stz $d00f,x
$0b:bf03  2f 44 06 03   and $030644
$0b:bf07  07 83		 ora [$83]
$0b:bf09  b3 c1		 lda ($c1,s),y
$0b:bf0b  81 0d		 sta ($0d,x)
$0b:bf0d  10 5f		 bpl $bf6e
$0b:bf0f  09 78		 ora #$78
$0b:bf11  e0 70		 cpx #$70
$0b:bf13  38			sec
$0b:bf14  fc 7e ff	  jsr ($ff7e,x)
$0b:bf17  7f 6f 03 79   adc $79036f,x
$0b:bf1b  9a			txs
$0b:bf1c  60			rts
$0b:bf1d  db			stp
$0b:bf1e  01 d1		 ora ($d1,x)
$0b:bf20  8b			phb
$0b:bf21  8e 7e dd	  stx $dd7e
$0b:bf24  12 ab		 ora ($ab)
$0b:bf26  31 88		 and ($88),y
$0b:bf28  a9 22		 lda #$22
$0b:bf2a  e5 3a		 sbc $3a
$0b:bf2c  7a			ply
$0b:bf2d  17 d2		 ora [$d2],y
$0b:bf2f  de a7 f5	  dec $f5a7,x
$0b:bf32  c7 b2		 cmp [$b2]
$0b:bf34  7d b5 ee	  adc $eeb5,x
$0b:bf37  bf 7e 78 37   lda $37787e,x
$0b:bf3b  c3 de		 cmp $de,s
$0b:bf3d  2f f2 07 94   and $9407f2
$0b:bf41  7c bd 5f	  jmp ($5fbd,x)
$0b:bf44  c8			iny
$0b:bf45  1f e2 0e 71   ora $710ee2,x
$0b:bf49  2f 8c 3c ee   and $ee3c8c
$0b:bf4d  85 ee		 sta $ee
$0b:bf4f  b8			clv
$0b:bf50  fc 3e 3f	  jsr ($3f3e,x)
$0b:bf53  0f 1f 81 26   ora $26811f
$0b:bf57  5c 7e 02 64   jml $64027e
$0b:bf5b  8f c0 7e 08   sta $087ec0
$0b:bf5f  fa			plx
$0b:bf60  88			dey
$0b:bf61  e7 ea		 sbc [$ea]
$0b:bf63  83 f8		 sta $f8,s
$0b:bf65  43 d5		 eor $d5,s
$0b:bf67  e1 e0		 sbc ($e0,x)
$0b:bf69  8f ac c3 81   sta $81c3ac
$0b:bf6d  3f e0 ae 07   and $07aee0,x
$0b:bf71  07 7f		 ora [$7f]
$0b:bf73  ff c0 17 f9   sbc $f917c0,x
$0b:bf77  3f ff af 82   and $82afff,x
$0b:bf7b  fd fe 6a	  sbc $6afe,x
$0b:bf7e  07 f1		 ora [$f1]
$0b:bf80  ae 3f 86	  ldx $863f
$0b:bf83  d8			cld
$0b:bf84  af cb fd 01   lda $01fdcb
$0b:bf88  71 81		 adc ($81),y
$0b:bf8a  bc 0d e9	  ldy $e90d,x
$0b:bf8d  80 c0		 bra $bf4f
$0b:bf8f  17 9a		 ora [$9a],y
$0b:bf91  02 f9		 cop #$f9
$0b:bf93  18			clc
$0b:bf94  1c 0f 01	  trb $010f
$0b:bf97  7f 60 34 04   adc $043460,x
$0b:bf9b  10 30		 bpl $bfcd
$0b:bf9d  3f fc 3e 1f   and $1f3efc,x
$0b:bfa1  1f 8f cf e7   ora $e7cf8f,x
$0b:bfa5  f7 f5		 sbc [$f5],y
$0b:bfa7  f0 05		 beq $bfae
$0b:bfa9  d6 1f		 dec $1f,x
$0b:bfab  ff 8f ff d9   sbc $d9ff8f,x
$0b:bfaf  e4 26		 cpx $26
$0b:bfb1  f1 bf		 sbc ($bf),y
$0b:bfb3  85 d5		 sta $d5
$0b:bfb5  81 a5		 sta ($a5,x)
$0b:bfb7  ef 37 fa 03   sbc $03fa37
$0b:bfbb  d2 3e		 cmp ($3e)
$0b:bfbd  a2 f5		 ldx #$f5
$0b:bfbf  9f b1 3d ab   sta $ab3db1,x
$0b:bfc3  ee 66 01	  inc $0166
$0b:bfc6  01 00		 ora ($00,x)
$0b:bfc8  01 e4		 ora ($e4,x)
$0b:bfca  72 79		 adc ($79)
$0b:bfcc  5c be c7 67   jml $67c7be
$0b:bfd0  b5 db		 lda $db,x
$0b:bfd2  77 b7		 adc [$b7],y
$0b:bfd4  43 a3		 eor $a3,s
$0b:bfd6  d2 e9		 cmp ($e9)
$0b:bfd8  f8			sed
$0b:bfd9  3c 3e 2f	  bit $2f3e,x
$0b:bfdc  1b			tcs
$0b:bfdd  fd 9e 74	  sbc $749e,x
$0b:bfe0  ef 20 1d 3f   sbc $3f1d20
$0b:bfe4  c9 df		 cmp #$df
$0b:bfe6  e0 0f		 cpx #$0f
$0b:bfe8  08			php
$0b:bfe9  f8			sed
$0b:bfea  8b			phb
$0b:bfeb  c6 7e		 dec $7e
$0b:bfed  44 f2 af	  mvp $af,$f2
$0b:bff0  99 bc ef	  sta $efbc,y
$0b:bff3  e8			inx
$0b:bff4  8f 4c fb 18   sta $18fb4c
$0b:bff8  c0 00		 cpy #$00
$0b:bffa  00 00		 brk #$00
$0b:bffc  00 00		 brk #$00
$0b:bffe  00 00		 brk #$00
$0b:c000  00 20		 brk #$20
$0b:c002  8c c3 e6	  sty $e6c3
$0b:c005  71 4a		 adc ($4a),y
$0b:c007  1c 6f 4b	  trb $4b6f
$0b:c00a  36 e9		 rol $e9,x
$0b:c00c  d9 3f d5	  cmp $d53f,y
$0b:c00f  5d 55 33	  eor $3355,x
$0b:c012  4d 7b 80	  eor $807b
$0b:c015  43 e1		 eor $e1,s
$0b:c017  11 c9		 ora ($c9),y
$0b:c019  24 fe		 bit $fe
$0b:c01b  91 7e		 sta ($7e),y
$0b:c01d  84 5b		 sty $5b
$0b:c01f  21 15		 and ($15,x)
$0b:c021  d8			cld
$0b:c022  bd 7e 09	  lda $097e,x
$0b:c025  7f ac 70 30   adc $3070ac,x
$0b:c029  96 09		 stx $09,y
$0b:c02b  74 63		 stz $63,x
$0b:c02d  67 60		 adc [$60]
$0b:c02f  b2 fb		 lda ($fb)
$0b:c031  39 3d cb	  and $cb3d,y
$0b:c034  bc b3 57	  ldy $57b3,x
$0b:c037  a4 98		 ldy $98
$0b:c039  7c 23 17	  jmp ($1723,x)
$0b:c03c  8f 27 f2 3d   sta $3df227
$0b:c040  7e 89 7f	  ror $7f89,x
$0b:c043  a6 5f		 ldx $5f
$0b:c045  ef d7 fa fd   sbc $fdfad7
$0b:c049  fe cc ca	  inc $cacc,x
$0b:c04c  b9 f5 4b	  lda $4bf5,y
$0b:c04f  14 96		 trb $96
$0b:c051  e3 10		 sbc $10,s
$0b:c053  bd c3 27	  lda $27c3,x
$0b:c056  70 48		 bvs $c0a0
$0b:c058  e4 0e		 cpx $0e
$0b:c05a  0f 00 a2 5b   ora $5ba200
$0b:c05e  a5 17		 lda $17
$0b:c060  c8			iny
$0b:c061  c4 f6		 cpy $f6
$0b:c063  1f 1f 80 43   ora $43801f,x
$0b:c067  20 10 48	  jsr $4810
$0b:c06a  04 0e		 tsb $0e
$0b:c06c  01 00		 ora ($00,x)
$0b:c06e  db			stp
$0b:c06f  d4 ab		 pei ($ab)
$0b:c071  bd 4e d7	  lda $d74e,x
$0b:c074  a2 ed		 ldx #$ed
$0b:c076  30 9f		 bmi $c017
$0b:c078  74 2f		 stz $2f,x
$0b:c07a  9a			txs
$0b:c07b  0f c7 03 c1   ora $c103c7
$0b:c07f  00 9f		 brk #$9f
$0b:c081  5f a7 df e8   eor $e8dfa7,x
$0b:c085  e7 f3		 sbc [$f3]
$0b:c087  f1 f8		 sbc ($f8),y
$0b:c089  80 74		 bra $c0ff
$0b:c08b  20 1a 08	  jsr $081a
$0b:c08e  07 00		 ora [$00]
$0b:c090  9a			txs
$0b:c091  06 d6		 asl $d6
$0b:c093  81 c0		 sta ($c0,x)
$0b:c095  e0 b0		 cpx #$b0
$0b:c097  48			pha
$0b:c098  54 26 19	  mvn $19,$26
$0b:c09b  0b			phd
$0b:c09c  3b			tsc
$0b:c09d  84 32		 sty $32
$0b:c09f  19 10 88	  ora $8810,y
$0b:c0a2  3b			tsc
$0b:c0a3  42 81		 wdm #$81
$0b:c0a5  43 a1		 eor $a1,s
$0b:c0a7  d1 f0		 cmp ($f0),y
$0b:c0a9  f8			sed
$0b:c0aa  f4 58 1b	  pea $1b58
$0b:c0ad  5b			tcd
$0b:c0ae  81 c0		 sta ($c0,x)
$0b:c0b0  d0 48		 bne $c0fa
$0b:c0b2  2a			rol a
$0b:c0b3  19 09 87	  ora $8709,y
$0b:c0b6  41 2e		 eor ($2e,x)
$0b:c0b8  13 09		 ora ($09,s),y
$0b:c0ba  84 22		 sty $22
$0b:c0bc  11 04		 ora ($04),y
$0b:c0be  82 40 b8	  brl $7901
$0b:c0c1  5c 2f 17 87   jml $87172f
$0b:c0c5  e2 ab		 sep #$ab
$0b:c0c7  03 e8		 ora $e8,s
$0b:c0c9  1e c0 f2	  asl $f2c0,x
$0b:c0cc  07 70		 ora [$70]
$0b:c0ce  36 b2		 rol $b2,x
$0b:c0d0  2c 91 20	  bit $2091
$0b:c0d3  87 07		 sta [$07]
$0b:c0d5  68			pla
$0b:c0d6  20 c1 02	  jsr $02c1
$0b:c0d9  07 70		 ora [$70]
$0b:c0db  4e 82 6c	  lsr $6c82
$0b:c0de  13 20		 ora ($20,s),y
$0b:c0e0  97 03		 sta [$03],y
$0b:c0e2  6b			rtl
$0b:c0e3  2a			rol a
$0b:c0e4  c9 52		 cmp #$52
$0b:c0e6  0a			asl a
$0b:c0e7  70 52		 bvs $c13b
$0b:c0e9  82 8c 14	  brl $d578
$0b:c0ec  20 d5 82	  jsr $82d5
$0b:c0ef  48			pha
$0b:c0f0  41 21		 eor ($21,x)
$0b:c0f2  c4 91		 cpy $91
$0b:c0f4  77 d4		 adc [$d4],y
$0b:c0f6  39 4a 06	  and $064a,y
$0b:c0f9  d8			cld
$0b:c0fa  0b			phd
$0b:c0fb  78			sei
$0b:c0fc  9f c7 1e 49   sta $491ec7,x
$0b:c100  f2 d7		 sbc ($d7)
$0b:c102  99 61 d2	  sta $d261,y
$0b:c105  11 c3		 ora ($c3),y
$0b:c107  a8			tay
$0b:c108  1b			tcs
$0b:c109  2e 38 e9	  rol $e938
$0b:c10c  03 2f		 ora $2f,s
$0b:c10e  a6 fd		 ldx $fd
$0b:c110  59 eb df	  eor $dfeb,y
$0b:c113  67 7b		 adc [$7b]
$0b:c115  7b			tdc
$0b:c116  63 30		 adc $30,s
$0b:c118  f9 9c 52	  sbc $529c,y
$0b:c11b  87 1b		 sta [$1b]
$0b:c11d  d2 cd		 cmp ($cd)
$0b:c11f  ba			tsx
$0b:c120  76 4f		 ror $4f,x
$0b:c122  f5 57		 sbc $57,x
$0b:c124  55 4c		 eor $4c,x
$0b:c126  d3 5e		 cmp ($5e,s),y
$0b:c128  e0 10		 cpx #$10
$0b:c12a  f4 30 49	  pea $4930
$0b:c12d  27 f4		 and [$f4]
$0b:c12f  8b			phb
$0b:c130  f4 22 d9	  pea $d922
$0b:c133  08			php
$0b:c134  ae c5 eb	  ldx $ebc5
$0b:c137  f0 4b		 beq $c184
$0b:c139  fd 63 81	  sbc $8163,x
$0b:c13c  84 b0		 sty $b0
$0b:c13e  4b			phk
$0b:c13f  a3 1b		 lda $1b,s
$0b:c141  3b			tsc
$0b:c142  05 97		 ora $97
$0b:c144  d9 c9 ee	  cmp $eec9,y
$0b:c147  5d e5 9a	  eor $9ae5,x
$0b:c14a  bd 24 c3	  lda $c324,x
$0b:c14d  e1 18		 sbc ($18,x)
$0b:c14f  bc 79 3f	  ldy $3f79,x
$0b:c152  91 eb		 sta ($eb),y
$0b:c154  f4 4b fd	  pea $fd4b
$0b:c157  32 ff		 and ($ff)
$0b:c159  7e bf d7	  ror $d7bf,x
$0b:c15c  ef f6 66 55   sbc $5566f6
$0b:c160  cf aa 58 a4   cmp $a458aa
$0b:c164  b7 18		 lda [$18],y
$0b:c166  85 ee		 sta $ee
$0b:c168  19 3b 82	  ora $823b,y
$0b:c16b  47 20		 eor [$20]
$0b:c16d  70 78		 bvs $c1e7
$0b:c16f  05 12		 ora $12
$0b:c171  dd 28 be	  cmp $be28,x
$0b:c174  46 27		 lsr $27
$0b:c176  b0 f8		 bcs $c170
$0b:c178  fc 02 19	  jsr ($1902,x)
$0b:c17b  00 82		 brk #$82
$0b:c17d  40			rti
$0b:c17e  20 6e d0	  jsr $d06e
$0b:c181  db			stp
$0b:c182  d4 ab		 pei ($ab)
$0b:c184  bd 4e d7	  lda $d74e,x
$0b:c187  a2 ed		 ldx #$ed
$0b:c189  30 9f		 bmi $c12a
$0b:c18b  74 2f		 stz $2f,x
$0b:c18d  9a			txs
$0b:c18e  0f c7 03 c1   ora $c103c7
$0b:c192  00 9f		 brk #$9f
$0b:c194  5f a7 df e8   eor $e8dfa7,x
$0b:c198  e7 f3		 sbc [$f3]
$0b:c19a  f1 f8		 sbc ($f8),y
$0b:c19c  80 74		 bra $c212
$0b:c19e  20 1a 08	  jsr $081a
$0b:c1a1  07 01		 ora [$01]
$0b:c1a3  bc d0 18	  ldy $18d0,x
$0b:c1a6  0c 1a 0d	  tsb $0d1a
$0b:c1a9  0b			phd
$0b:c1aa  84 43		 sty $43
$0b:c1ac  a1 31		 lda ($31,x)
$0b:c1ae  58			cli
$0b:c1af  99 b9 e0	  sta $e0b9,y
$0b:c1b2  f0 78		 beq $c22c
$0b:c1b4  7a			ply
$0b:c1b5  24 08		 bit $08
$0b:c1b7  a2 de		 ldx #$de
$0b:c1b9  3c 06 02	  bit $0206,x
$0b:c1bc  c1 60		 cmp ($60,x)
$0b:c1be  e8			inx
$0b:c1bf  44 2e 19	  mvp $19,$2e
$0b:c1c2  0d 47 21	  ora $2147
$0b:c1c5  bc a9 50	  ldy $50a9,x
$0b:c1c8  f0 78		 beq $c242
$0b:c1ca  3e 0a 90	  rol $900a,x
$0b:c1cd  f8			sed
$0b:c1ce  7e 0f a0	  ror $a00f,x
$0b:c1d1  7b			tdc
$0b:c1d2  03 c8		 ora $c8,s
$0b:c1d4  1d c0 ea	  ora $eac0,x
$0b:c1d7  0d e4 22	  ora $22e4
$0b:c1da  82 24 90	  brl $5201
$0b:c1dd  e0 74		 cpx #$74
$0b:c1df  06 f2		 asl $f2
$0b:c1e1  27 41		 and [$41]
$0b:c1e3  36 09		 rol $09,x
$0b:c1e5  90 4b		 bcc $c232
$0b:c1e7  82 54 19	  brl $db3e
$0b:c1ea  28			plp
$0b:c1eb  ad 05 49	  lda $4905
$0b:c1ee  29 c1		 and #$c1
$0b:c1f0  28			plp
$0b:c1f1  06 d6		 asl $d6
$0b:c1f3  64 9c		 stz $9c
$0b:c1f5  11 ec		 ora ($ec),y
$0b:c1f7  10 e8		 bpl $c1e1
$0b:c1f9  fb			xce
$0b:c1fa  d8			cld
$0b:c1fb  09 22		 ora #$22
$0b:c1fd  f1 68		 sbc ($68),y
$0b:c1ff  24 7d		 bit $7d
$0b:c201  f4 2f b1	  pea $b12f
$0b:c204  07 f8		 ora [$f8]
$0b:c206  83 c6		 sta $c6,s
$0b:c208  3e 42 f2	  rol $f242,x
$0b:c20b  9f 98 f6 10   sta $10f698,x
$0b:c20f  74 08		 stz $08,x
$0b:c211  e4 f8		 cpx $f8
$0b:c213  e8			inx
$0b:c214  07 30		 ora [$30]
$0b:c216  37 3c		 and [$3c],y
$0b:c218  22 7c 78 13   jsl $13787c
$0b:c21c  c8			iny
$0b:c21d  a3 7d		 lda $7d,s
$0b:c21f  3d ea ff	  and $ffea,x
$0b:c222  60			rts
$0b:c223  7b			tdc
$0b:c224  47 cc		 eor [$cc]
$0b:c226  d5 1e		 cmp $1e,x
$0b:c228  84 4e		 sty $4e
$0b:c22a  a3 77		 lda $77,s
$0b:c22c  e9 e7		 sbc #$e7
$0b:c22e  ca			dex
$0b:c22f  d7 dd		 cmp [$dd],y
$0b:c231  93 7d		 sta ($7d,s),y
$0b:c233  a3 bb		 lda $bb,s
$0b:c235  68			pla
$0b:c236  06 3a		 asl $3a
$0b:c238  17 0f		 ora [$0f],y
$0b:c23a  87 c7		 sta [$c7]
$0b:c23c  23 f3		 and $f3,s
$0b:c23e  f9 fd f2	  sbc $f2fd,y
$0b:c241  ff 48 b7 52   sbc $52b748,x
$0b:c245  2b			pld
$0b:c246  b5 fa		 lda $fa,x
$0b:c248  fd d2 ff	  sbc $ffd2,x
$0b:c24b  98			tya
$0b:c24c  80 61		 bra $c2af
$0b:c24e  2c 12 e8	  bit $e812
$0b:c251  c6 ce		 dec $ce
$0b:c253  c1 65		 cmp ($65,x)
$0b:c255  f6 72		 inc $72,x
$0b:c257  7b			tdc
$0b:c258  97 79		 sta [$79],y
$0b:c25a  66 af		 ror $af
$0b:c25c  49 f0		 eor #$f0
$0b:c25e  f8			sed
$0b:c25f  46 2f		 lsr $2f
$0b:c261  1e 4f e4	  asl $e44f,x
$0b:c264  7a			ply
$0b:c265  fd 12 ff	  sbc $ff12,x
$0b:c268  4c bf df	  jmp $dfbf
$0b:c26b  af f5 fb fd   lda $fdfbf5
$0b:c26f  d0 8d		 bne $c1fe
$0b:c271  f3 6a		 sbc ($6a,s),y
$0b:c273  d6 29		 dec $29,x
$0b:c275  2d c2 21	  and $21c2
$0b:c278  7b			tdc
$0b:c279  86 4e		 stx $4e
$0b:c27b  e0 91		 cpx #$91
$0b:c27d  c8			iny
$0b:c27e  1c 1e 01	  trb $011e
$0b:c281  64 bf		 stz $bf
$0b:c283  ca			dex
$0b:c284  2f d1 89 ec   and $ec89d1
$0b:c288  3e 3f 00	  rol $003f,x
$0b:c28b  86 40		 stx $40
$0b:c28d  20 90 08	  jsr $0890
$0b:c290  19 c8 36	  ora $36c8,y
$0b:c293  f5 2a		 sbc $2a,x
$0b:c295  ef 53 b5 e8   sbc $e8b553
$0b:c299  bb			tyx
$0b:c29a  4c 27 dd	  jmp $dd27
$0b:c29d  0b			phd
$0b:c29e  e6 83		 inc $83
$0b:c2a0  f1 c0		 sbc ($c0),y
$0b:c2a2  f0 40		 beq $c2e4
$0b:c2a4  27 d7		 and [$d7]
$0b:c2a6  e9 f7		 sbc #$f7
$0b:c2a8  fa			plx
$0b:c2a9  39 fc fc	  and $fcfc,y
$0b:c2ac  7e 20 1d	  ror $1d20,x
$0b:c2af  08			php
$0b:c2b0  06 82		 asl $82
$0b:c2b2  01 c0		 ora ($c0,x)
$0b:c2b4  72 34		 adc ($34)
$0b:c2b6  0e 07 05	  asl $0507
$0b:c2b9  82 43 a1	  brl $63ff
$0b:c2bc  31 58		 and ($58),y
$0b:c2be  9c 6e 2e	  stz $2e6e
$0b:c2c1  6e 78 3c	  ror $3c78
$0b:c2c4  1d fe 11	  ora $11fe,x
$0b:c2c7  f2 28		 sbc ($28)
$0b:c2c9  b9 0f 81	  lda $810f,y
$0b:c2cc  c0 d0		 cpy #$d0
$0b:c2ce  48			pha
$0b:c2cf  2e 19 0d	  rol $0d19
$0b:c2d2  47 23		 eor [$23]
$0b:c2d4  b1 e8		 lda ($e8),y
$0b:c2d6  72 2a		 adc ($2a)
$0b:c2d8  54 3c 1e	  mvn $1e,$3c
$0b:c2db  00 f8		 brk #$f8
$0b:c2dd  7e 15 60	  ror $6015,x
$0b:c2e0  7d 03 d8	  adc $d803,x
$0b:c2e3  1e 40 ee	  asl $ee40,x
$0b:c2e6  07 50		 ora [$50]
$0b:c2e8  72 22		 adc ($22)
$0b:c2ea  2c 91 20	  bit $2091
$0b:c2ed  3c 15 c2	  bit $c215,x
$0b:c2f0  a7 41		 lda [$41]
$0b:c2f2  36 09		 rol $09,x
$0b:c2f4  90 4b		 bcc $c341
$0b:c2f6  82 54 13	  brl $d64d
$0b:c2f9  e8			inx
$0b:c2fa  ab			plb
$0b:c2fb  25 48		 and $48
$0b:c2fd  17 04		 ora [$04],y
$0b:c2ff  d8			cld
$0b:c300  e9 f5		 sbc #$f5
$0b:c302  82 1e 00	  brl $c323
$0b:c305  92 2e		 sta ($2e)
$0b:c307  fa			plx
$0b:c308  87 3e		 sta [$3e]
$0b:c30a  01 d3		 ora ($d3,x)
$0b:c30c  a1 bf		 lda ($bf,x)
$0b:c30e  16 78		 asl $78,x
$0b:c310  f7 d7		 sbc [$d7],y
$0b:c312  83 20		 sta $20,s
$0b:c314  4c 01 44	  jmp $4401
$0b:c317  09 17		 ora #$17
$0b:c319  70 29		 bvs $c344
$0b:c31b  03 a6		 ora $a6,s
$0b:c31d  61 07		 adc ($07,x)
$0b:c31f  21 8e		 and ($8e,x)
$0b:c321  4f af e7 50   eor $50e7af
$0b:c325  39 01 c4	  and $c401,y
$0b:c328  0e 0b 1c	  asl $1c0b
$0b:c32b  bf df d0 a0   lda $a0d0df,x
$0b:c32f  72 22		 adc ($22)
$0b:c331  0f a7 fd 61   ora $61fda7
$0b:c335  ec 1f 69	  cpx $691f
$0b:c338  79 0a 63	  adc $630a,y
$0b:c33b  30 f9		 bmi $c336
$0b:c33d  dc 52 81	  jml [$8152]
$0b:c340  1f cb c2 7a   ora $7ac2cb,x
$0b:c344  f6 3f		 inc $3f,x
$0b:c346  fd 5f ff	  sbc $ff5f,x
$0b:c349  0f fe 46 20   ora $2046fe
$0b:c34d  10 f3		 bpl $c342
$0b:c34f  a8			tay
$0b:c350  49 e7		 eor #$e7
$0b:c352  e8			inx
$0b:c353  70 87		 bvs $c2dc
$0b:c355  db			stp
$0b:c356  e1 f5		 sbc ($f5,x)
$0b:c358  f0 50		 beq $c3aa
$0b:c35a  21 c2		 and ($c2,x)
$0b:c35c  b1 c0		 lda ($c0),y
$0b:c35e  c2 5e		 rep #$5e
$0b:c360  20 df 8f	  jsr $8fdf
$0b:c363  df 83 cf cc   cmp $cccf83,x
$0b:c367  f4 e7 3e	  pea $3ee7
$0b:c36a  fe cd 5e	  inc $5ecd,x
$0b:c36d  92 61		 sta ($61)
$0b:c36f  f0 8c		 beq $c2fd
$0b:c371  5e 3f 9f	  lsr $9f3f,x
$0b:c374  cf f7 fb e4   cmp $e4fbf7
$0b:c378  26 1f		 rol $1f
$0b:c37a  d7 fa		 cmp [$fa],y
$0b:c37c  fd fe ff	  sbc $fffe,x
$0b:c37f  ce f7 51	  dec $51f7
$0b:c382  3a			dec a
$0b:c383  e4 1e		 cpx $1e
$0b:c385  db			stp
$0b:c386  00 bb		 brk #$bb
$0b:c388  c1 27		 cmp ($27,x)
$0b:c38a  70 28		 bvs $c3b4
$0b:c38c  f4 0e 0f	  pea $0f0e
$0b:c38f  00 be		 brk #$be
$0b:c391  5f c7 e1 38   eor $38e1c7,x
$0b:c395  9f c7 e3 f0   sta $f0e3c7,x
$0b:c399  88			dey
$0b:c39a  64 12		 stz $12
$0b:c39c  0d 00 81	  ora $8100
$0b:c39f  9b			txy
$0b:c3a0  c2 6f		 rep #$6f
$0b:c3a2  d2 ae		 cmp ($ae)
$0b:c3a4  f5 3b		 sbc $3b,x
$0b:c3a6  5e 8b b4	  lsr $b48b,x
$0b:c3a9  c2 7d		 rep #$7d
$0b:c3ab  d0 be		 bne $c36b
$0b:c3ad  68			pla
$0b:c3ae  3f 1c 0f 04   and $040f1c,x
$0b:c3b2  02 7d		 cop #$7d
$0b:c3b4  fe 2f 84	  inc $842f,x
$0b:c3b7  73 f9		 adc ($f9,s),y
$0b:c3b9  f8			sed
$0b:c3ba  fc 40 3a	  jsr ($3a40,x)
$0b:c3bd  10 0d		 bpl $c3cc
$0b:c3bf  04 03		 tsb $03
$0b:c3c1  80 e7		 bra $c3aa
$0b:c3c3  48			pha
$0b:c3c4  0c 06 0d	  tsb $0d06
$0b:c3c7  06 85		 asl $85
$0b:c3c9  c2 22		 rep #$22
$0b:c3cb  b1 38		 lda ($38),y
$0b:c3cd  dc 5e 5f	  jml [$5f5e]
$0b:c3d0  27 37		 and [$37]
$0b:c3d2  2c 1e 0f	  bit $0f1e
$0b:c3d5  0f 87 c7 d1   ora $d1c787
$0b:c3d9  21 1f		 and ($1f,x)
$0b:c3db  9f ba cb 01   sta $01cbba,x
$0b:c3df  80 b0		 bra $c391
$0b:c3e1  58			cli
$0b:c3e2  3a			dec a
$0b:c3e3  11 0d		 ora ($0d),y
$0b:c3e5  47 23		 eor [$23]
$0b:c3e7  b1 e8		 lda ($e8),y
$0b:c3e9  fa			plx
$0b:c3ea  79 1d 46	  adc $461d,y
$0b:c3ed  93 0f		 sta ($0f,s),y
$0b:c3ef  07 83		 ora [$83]
$0b:c3f1  e1 f0		 sbc ($f0,x)
$0b:c3f3  fc 2a 43	  jsr ($432a,x)
$0b:c3f6  f1 fc		 sbc ($fc),y
$0b:c3f8  3e 81 ec	  rol $ec81,x
$0b:c3fb  0f 20 77 03   ora $037720
$0b:c3ff  a8			tay
$0b:c400  1c c1 d6	  trb $d6c1
$0b:c403  48			pha
$0b:c404  d0 44		 bne $c44a
$0b:c406  92 1c		 sta ($1c)
$0b:c408  10 a0		 bpl $c3aa
$0b:c40a  72 07		 adc ($07)
$0b:c40c  59 27 41	  eor $4127,y
$0b:c40f  36 09		 rol $09,x
$0b:c411  90 4b		 bcc $c45e
$0b:c413  82 54 12	  brl $d66a
$0b:c416  60			rts
$0b:c417  80 25		 bra $c43e
$0b:c419  68			pla
$0b:c41a  2a			rol a
$0b:c41b  49 4e 0a	  eor #$0a4e
$0b:c41e  50 49		 bvc $c469
$0b:c420  01 b5		 ora ($b5,x)
$0b:c422  1e 1e 01	  asl $011e,x
$0b:c425  f0 97		 beq $c3be
$0b:c427  88			dey
$0b:c428  fc 69 e3	  jsr ($e369,x)
$0b:c42b  f8			sed
$0b:c42c  90 14		 bcc $c442
$0b:c42e  02 e1		 cop #$e1
$0b:c430  f8			sed
$0b:c431  28			plp
$0b:c432  01 3c		 ora ($3c,x)
$0b:c434  09 4f 20	  ora #$204f
$0b:c437  56 01		 lsr $01,x
$0b:c439  7c 87 f7	  jmp ($f787,x)
$0b:c43c  08			php
$0b:c43d  84 47		 sty $47
$0b:c43f  0e a0 9f	  asl $9fa0
$0b:c442  33 8b		 and ($8b,s),y
$0b:c444  47 0e		 eor [$0e]
$0b:c446  c0 7b 84	  cpy #$847b
$0b:c449  a7 a9		 lda [$a9]
$0b:c44b  7d 6d ec	  adc $ec6d,x
$0b:c44e  7f 6c 79 2c   adc $2c796c,x
$0b:c452  e3 30		 sbc $30,s
$0b:c454  f9 9c 52	  sbc $529c,y
$0b:c457  87 1b		 sta [$1b]
$0b:c459  d2 cd		 cmp ($cd)
$0b:c45b  ba			tsx
$0b:c45c  76 4f		 ror $4f,x
$0b:c45e  f5 57		 sbc $57,x
$0b:c460  55 4c		 eor $4c,x
$0b:c462  d3 5e		 cmp ($5e,s),y
$0b:c464  e0 10 f4	  cpx #$f410
$0b:c467  30 49		 bmi $c4b2
$0b:c469  27 f4		 and [$f4]
$0b:c46b  8b			phb
$0b:c46c  f4 22 d9	  pea $d922
$0b:c46f  08			php
$0b:c470  ae c5 eb	  ldx $ebc5
$0b:c473  f0 4b		 beq $c4c0
$0b:c475  fd 63 81	  sbc $8163,x
$0b:c478  84 b0		 sty $b0
$0b:c47a  4b			phk
$0b:c47b  a3 1b		 lda $1b,s
$0b:c47d  3b			tsc
$0b:c47e  05 97		 ora $97
$0b:c480  d9 c9 ee	  cmp $eec9,y
$0b:c483  5d e5 9a	  eor $9ae5,x
$0b:c486  bd 24 c3	  lda $c324,x
$0b:c489  e1 18		 sbc ($18,x)
$0b:c48b  bc 79 3f	  ldy $3f79,x
$0b:c48e  91 eb		 sta ($eb),y
$0b:c490  f4 4b fd	  pea $fd4b
$0b:c493  32 ff		 and ($ff)
$0b:c495  7e bf d7	  ror $d7bf,x
$0b:c498  ef f6 66 55   sbc $5566f6
$0b:c49c  cf aa 58 a4   cmp $a458aa
$0b:c4a0  b7 18		 lda [$18],y
$0b:c4a2  85 ee		 sta $ee
$0b:c4a4  19 3b 82	  ora $823b,y
$0b:c4a7  47 20		 eor [$20]
$0b:c4a9  70 78		 bvs $c523
$0b:c4ab  05 12		 ora $12
$0b:c4ad  dd 28 be	  cmp $be28,x
$0b:c4b0  46 27		 lsr $27
$0b:c4b2  b0 f8		 bcs $c4ac
$0b:c4b4  fc 02 19	  jsr ($1902,x)
$0b:c4b7  00 82		 brk #$82
$0b:c4b9  40			rti
$0b:c4ba  20 6e d0	  jsr $d06e
$0b:c4bd  db			stp
$0b:c4be  d4 ab		 pei ($ab)
$0b:c4c0  bd 4e d7	  lda $d74e,x
$0b:c4c3  a2 ed 30	  ldx #$30ed
$0b:c4c6  9f 74 2f 9a   sta $9a2f74,x
$0b:c4ca  0f c7 03 c1   ora $c103c7
$0b:c4ce  00 9f		 brk #$9f
$0b:c4d0  5f a7 df e8   eor $e8dfa7,x
$0b:c4d4  e7 f3		 sbc [$f3]
$0b:c4d6  f1 f8		 sbc ($f8),y
$0b:c4d8  80 74		 bra $c54e
$0b:c4da  20 1a 08	  jsr $081a
$0b:c4dd  07 01		 ora [$01]
$0b:c4df  d4 50		 pei ($50)
$0b:c4e1  38			sec
$0b:c4e2  1c 32 19	  trb $1932
$0b:c4e5  13 88		 ora ($88,s),y
$0b:c4e7  4b			phk
$0b:c4e8  a4 32		 ldy $32
$0b:c4ea  b9 3d 7e	  lda $7e3d,y
$0b:c4ed  8f 57 a7 9b   sta $9ba757
$0b:c4f1  8e 1e 45	  stx $451e
$0b:c4f4  08			php
$0b:c4f5  fc fd 0e	  jsr ($0efd,x)
$0b:c4f8  13 fb		 ora ($fb,s),y
$0b:c4fa  fa			plx
$0b:c4fb  2c 1d a1	  bit $a11d
$0b:c4fe  c0 e0 4c	  cpy #$4ce0
$0b:c501  26 1c		 rol $1c
$0b:c503  88			dey
$0b:c504  45 d3		 eor $d3
$0b:c506  09 d4 f2	  ora #$f2d4
$0b:c509  7e bc 5e	  ror $5ebc,x
$0b:c50c  af 93 a8 52   lda $52a893
$0b:c510  21 f0		 and ($f0,x)
$0b:c512  f8			sed
$0b:c513  19 40 c8	  ora $c840,y
$0b:c516  1f cf e7 f9   ora $f9e7cf,x
$0b:c51a  56 07		 lsr $07,x
$0b:c51c  d0 3d		 bne $c55b
$0b:c51e  81 e4		 sta ($e4,x)
$0b:c520  0e e0 75	  asl $75e0
$0b:c523  03 98		 ora $98,s
$0b:c525  1c 41 da	  trb $da41
$0b:c528  08			php
$0b:c529  b2 43		 lda ($43)
$0b:c52b  91 14		 sta ($14),y
$0b:c52d  10 60		 bpl $c58f
$0b:c52f  4b			phk
$0b:c530  24 e8		 bit $e8
$0b:c532  26 c1		 rol $c1
$0b:c534  32 09		 and ($09)
$0b:c536  70 4a		 bvs $c582
$0b:c538  82 4c 12	  brl $d787
$0b:c53b  20 80 05	  jsr $0580
$0b:c53e  59 29 c9	  eor $c929,y
$0b:c541  4a			lsr a
$0b:c542  0a			asl a
$0b:c543  30 35		 bmi $c57a
$0b:c545  a3 c3		 lda $c3,s
$0b:c547  c0 3e 12	  cpy #$123e
$0b:c54a  f1 1f		 sbc ($1f),y
$0b:c54c  8d 3c 83	  sta $833c
$0b:c54f  52 09		 eor ($09)
$0b:c551  05 c0		 ora $c0
$0b:c553  a2 04 8b	  ldx #$8b04
$0b:c556  b8			clv
$0b:c557  14 80		 trb $80
$0b:c559  83 e7		 sta $e7,s
$0b:c55b  7f 44 7a 67   adc $677a44,x
$0b:c55f  d5 5e		 cmp $5e,x
$0b:c561  bb			tyx
$0b:c562  f2 5f		 sbc ($5f)
$0b:c564  97 3e		 sta [$3e],y
$0b:c566  33 0f		 and ($0f,s),y
$0b:c568  99 c5 28	  sta $28c5,y
$0b:c56b  71 bd		 adc ($bd),y
$0b:c56d  2c db a7	  bit $a7db
$0b:c570  64 ff		 stz $ff
$0b:c572  55 75		 eor $75,x
$0b:c574  54 dd 35	  mvn $35,$dd
$0b:c577  ee 01 0f	  inc $0f01
$0b:c57a  84 47		 sty $47
$0b:c57c  24 93		 bit $93
$0b:c57e  fa			plx
$0b:c57f  45 fa		 eor $fa
$0b:c581  11 6c		 ora ($6c),y
$0b:c583  84 57		 sty $57
$0b:c585  62 f5 f8	  per $be7d
$0b:c588  25 fe		 and $fe
$0b:c58a  b1 c0		 lda ($c0),y
$0b:c58c  c2 58		 rep #$58
$0b:c58e  25 d1		 and $d1
$0b:c590  8d 9d 82	  sta $829d
$0b:c593  eb			xba
$0b:c594  fc ec f7	  jsr ($f7ec,x)
$0b:c597  2f ff cf 7d   and $7dcfff
$0b:c59b  f2 61		 sbc ($61)
$0b:c59d  f0 8c		 beq $c52b
$0b:c59f  5e 3c 9f	  lsr $9f3c,x
$0b:c5a2  c8			iny
$0b:c5a3  f5 fa		 sbc $fa,x
$0b:c5a5  25 fe		 and $fe
$0b:c5a7  99 7f bf	  sta $bf7f,y
$0b:c5aa  5f e1 60 66   eor $6660e1,x
$0b:c5ae  65 5c		 adc $5c
$0b:c5b0  fa			plx
$0b:c5b1  a5 8a		 lda $8a
$0b:c5b3  4b			phk
$0b:c5b4  71 88		 adc ($88),y
$0b:c5b6  5e 61 d3	  lsr $d361,x
$0b:c5b9  a8			tay
$0b:c5ba  2c 7e 07	  bit $077e
$0b:c5bd  07 80		 ora [$80]
$0b:c5bf  51 2d		 eor ($2d),y
$0b:c5c1  d2 8b		 cmp ($8b)
$0b:c5c3  e4 62		 cpx $62
$0b:c5c5  7b			tdc
$0b:c5c6  0f 8f c0 21   ora $21c08f
$0b:c5ca  d0 08		 bne $c5d4
$0b:c5cc  2c 02 06	  bit $0602
$0b:c5cf  5e 0f 9d	  lsr $9d0f,x
$0b:c5d2  fb			xce
$0b:c5d3  6b			rtl
$0b:c5d4  7c dd 5e	  jmp ($5edd,x)
$0b:c5d7  2e d3 0a	  rol $0ad3
$0b:c5da  77 03		 adc [$03],y
$0b:c5dc  39 80 9c	  and $9c80,y
$0b:c5df  40			rti
$0b:c5e0  3c 10 01	  bit $0110,x
$0b:c5e3  60			rts
$0b:c5e4  ff bf 9f cf   sbc $cf9fbf,x
$0b:c5e8  c7 e0		 cmp [$e0]
$0b:c5ea  3e 16 0f	  rol $0f16,x
$0b:c5ed  07 03		 ora [$03]
$0b:c5ef  80 c3		 bra $c5b4
$0b:c5f1  58			cli
$0b:c5f2  1c 0e 19	  trb $190e
$0b:c5f5  0f 88 43 62   ora $624388
$0b:c5f9  71 b9		 adc ($b9),y
$0b:c5fb  3c 7e 4e	  bit $4e7e,x
$0b:c5fe  72 28		 adc ($28)
$0b:c600  79 14 23	  adc $2314,y
$0b:c603  f3 f4		 sbc ($f4,s),y
$0b:c605  38			sec
$0b:c606  df d1 62 de   cmp $de62d1,x
$0b:c60a  33 58		 and ($58,s),y
$0b:c60c  07 c2		 ora [$c2]
$0b:c60e  11 b0		 ora ($b0),y
$0b:c610  e4 76		 cpx $76
$0b:c612  3c 9f 8f	  bit $8f9f,x
$0b:c615  22 48 be 1f   jsl $1fbe48
$0b:c619  03 28		 ora $28,s
$0b:c61b  18			clc
$0b:c61c  c0 c6 05	  cpy #$05c6
$0b:c61f  f2 3e		 sbc ($3e)
$0b:c621  81 ec		 sta ($ec,x)
$0b:c623  0f 20 77 03   ora $037720
$0b:c627  a8			tay
$0b:c628  12 c9		 ora ($c9)
$0b:c62a  a2 08 b2	  ldx #$b208
$0b:c62d  43 92		 eor $92,s
$0b:c62f  14 10		 trb $10
$0b:c631  60			rts
$0b:c632  74 07		 stz $07,x
$0b:c634  60			rts
$0b:c635  27 41		 and [$41]
$0b:c637  36 09		 rol $09,x
$0b:c639  90 f0		 bcc $c62b
$0b:c63b  46 12		 lsr $12
$0b:c63d  a0 93 03	  ldy #$0393
$0b:c640  81 17		 sta ($17,x)
$0b:c642  d0 c6		 bne $c60a
$0b:c644  4a			lsr a
$0b:c645  30 35		 bmi $c67c
$0b:c647  bb			tyx
$0b:c648  cf c0 9e 15   cmp $159ec0
$0b:c64c  f0 fb		 beq $c649
$0b:c64e  c2 21		 rep #$21
$0b:c650  11 c1		 ora ($c1),y
$0b:c652  78			sei
$0b:c653  09 ae 38	  ora #$38ae
$0b:c656  30 00		 bmi $c658
$0b:c658  ff 95 7c cd   sbc $cd7c95,x
$0b:c65c  e7 7f		 sbc [$7f]
$0b:c65e  44 7a 67	  mvp $67,$7a
$0b:c661  c6 eb		 dec $eb
$0b:c663  04 82		 tsb $82
$0b:c665  43 96		 eor $96,s
$0b:c667  20 a8 b8	  jsr $b8a8
$0b:c66a  72 c8		 adc ($c8)
$0b:c66c  14 33		 trb $33
$0b:c66e  20 69 05	  jsr $0569
$0b:c671  c3 f0		 cmp $f0,s
$0b:c673  d2 06		 cmp ($06)
$0b:c675  88			dey
$0b:c676  33 1e		 and ($1e,s),y
$0b:c678  41 f8		 eor ($f8,x)
$0b:c67a  6b			rtl
$0b:c67b  0b			phd
$0b:c67c  5c 47 63 19   jml $196347
$0b:c680  87 cc		 sta [$cc]
$0b:c682  e2 94		 sep #$94
$0b:c684  38			sec
$0b:c685  de 96 6d	  dec $6d96,x
$0b:c688  d3 b2		 cmp ($b2,s),y
$0b:c68a  7f aa ba aa   adc $aabaaa,x
$0b:c68e  66 9a		 ror $9a
$0b:c690  f7 00		 sbc [$00],y
$0b:c692  87 8c		 sta [$8c]
$0b:c694  42 49		 wdm #$49
$0b:c696  3f a4 5f a1   and $a15fa4,x
$0b:c69a  16 c8		 asl $c8,x
$0b:c69c  45 76		 eor $76
$0b:c69e  2f 5f 82 5f   and $5f825f
$0b:c6a2  eb			xba
$0b:c6a3  1c 0c 25	  trb $250c
$0b:c6a6  82 5d 18	  brl $df06
$0b:c6a9  d9 d8 2c	  cmp $2cd8,y
$0b:c6ac  be ce 4f	  ldx $4fce,y
$0b:c6af  72 ef		 adc ($ef)
$0b:c6b1  2c d5 e9	  bit $e9d5
$0b:c6b4  26 1f		 rol $1f
$0b:c6b6  08			php
$0b:c6b7  c5 e3		 cmp $e3
$0b:c6b9  c9 fc 8f	  cmp #$8ffc
$0b:c6bc  5f a2 5f e9   eor $e95fa2,x
$0b:c6c0  97 fb		 sta [$fb],y
$0b:c6c2  f5 fe		 sbc $fe,x
$0b:c6c4  bf 7f b3 32   lda $32b37f,x
$0b:c6c8  ae 7d 52	  ldx $527d
$0b:c6cb  c5 25		 cmp $25
$0b:c6cd  b8			clv
$0b:c6ce  c4 2f		 cpy $2f
$0b:c6d0  70 c9		 bvs $c69b
$0b:c6d2  dc 12 39	  jml [$3912]
$0b:c6d5  03 83		 ora $83,s
$0b:c6d7  c0 28		 cpy #$28
$0b:c6d9  96 e9		 stx $e9,y
$0b:c6db  45 f2		 eor $f2
$0b:c6dd  31 3d		 and ($3d),y
$0b:c6df  87 c7		 sta [$c7]
$0b:c6e1  e0 10		 cpx #$10
$0b:c6e3  c5 a8		 cmp $a8
$0b:c6e5  c0 d7		 cpy #$d7
$0b:c6e7  a1 b7		 lda ($b7,x)
$0b:c6e9  a9 57 7a	  lda #$7a57
$0b:c6ec  9d af 45	  sta $45af,x
$0b:c6ef  da			phx
$0b:c6f0  61 3e		 adc ($3e,x)
$0b:c6f2  e8			inx
$0b:c6f3  5f 34 1f 8e   eor $8e1f34,x
$0b:c6f7  07 82		 ora [$82]
$0b:c6f9  01 3e		 ora ($3e,x)
$0b:c6fb  bf 4f bf d1   lda $d1bf4f,x
$0b:c6ff  cf e3 94 20   cmp $2094e3
$0b:c703  1d 08 06	  ora $0608,x
$0b:c706  82 01 c0	  brl $870a
$0b:c709  5e 1c 0e	  lsr $0e1c,x
$0b:c70c  07 0c		 ora [$0c]
$0b:c70e  87 c4		 sta [$c4]
$0b:c710  23 f2		 and $f2,s
$0b:c712  08			php
$0b:c713  f4 86 7b	  pea $7b86
$0b:c716  43 9d		 eor $9d,s
$0b:c718  d1 ce		 cmp ($ce),y
$0b:c71a  41 0f		 eor ($0f,x)
$0b:c71c  22 84 7e 7f   jsl $7f7e84
$0b:c720  3f bf a1 c7   and $c7a1bf,x
$0b:c724  fe 8b 15	  inc $158b,x
$0b:c727  e8			inx
$0b:c728  f0 38		 beq $c762
$0b:c72a  01 f0		 ora ($f0,x)
$0b:c72c  84 7e		 sty $7e
$0b:c72e  20 97 8c	  jsr $8c97
$0b:c731  26 f3		 rol $f3
$0b:c733  85 dc		 sta $dc
$0b:c735  f1 24		 sbc ($24),y
$0b:c737  83 e1		 sta $e1,s
$0b:c739  f0 72		 beq $c7ad
$0b:c73b  87 f3		 sta [$f3]
$0b:c73d  f9 fe 53	  sbc $53fe,y
$0b:c740  8a			txa
$0b:c741  2c 8f a0	  bit $a08f
$0b:c744  7b			tdc
$0b:c745  03 c8		 ora $c8,s
$0b:c747  1d c0 ea	  ora $eac0,x
$0b:c74a  07 30		 ora [$30]
$0b:c74c  25 92		 and $92
$0b:c74e  2c 90 e4	  bit $e490
$0b:c751  85 04		 sta $04
$0b:c753  18			clc
$0b:c754  20 40 e4	  jsr $e440
$0b:c757  09 d0 4d	  ora #$4dd0
$0b:c75a  82 64 12	  brl $d9c1
$0b:c75d  e0 95		 cpx #$95
$0b:c75f  04 98		 tsb $98
$0b:c761  1a			inc a
$0b:c762  c9 16 4a	  cmp #$4a16
$0b:c765  72 52		 adc ($52)
$0b:c767  81 94		 sta ($94,x)
$0b:c769  14 20		 trb $20
$0b:c76b  92 03		 sta ($03)
$0b:c76d  69 bb e2	  adc #$e2bb
$0b:c770  10 f0		 bpl $c762
$0b:c772  d7 f6		 cmp [$f6],y
$0b:c774  87 3c		 sta [$3c]
$0b:c776  18			clc
$0b:c777  31 c9		 and ($c9),y
$0b:c779  f0 34		 beq $c7af
$0b:c77b  5f ce 0d 09   eor $090dce,x
$0b:c77f  f0 c8		 beq $c749
$0b:c781  41 be		 eor ($be,x)
$0b:c783  55 f3		 eor $f3,x
$0b:c785  37 9d		 and [$9d],y
$0b:c787  fd 11 e9	  sbc $e911,x
$0b:c78a  9f 77 cc 05   sta $05cc77,x
$0b:c78e  51 ab		 eor ($ab),y
$0b:c790  68			pla
$0b:c791  90 34		 bcc $c7c7
$0b:c793  06 e1		 asl $e1
$0b:c795  f8			sed
$0b:c796  fe 34 c1	  inc $c134,x
$0b:c799  a0 0c		 ldy #$0c
$0b:c79b  f0 67		 beq $c804
$0b:c79d  2d c3 f9	  and $f9c3
$0b:c7a0  fc 71 83	  jsr ($8371,x)
$0b:c7a3  40			rti
$0b:c7a4  87 41		 sta [$41]
$0b:c7a6  19 87 cc	  ora $cc87,y
$0b:c7a9  e2 94		 sep #$94
$0b:c7ab  38			sec
$0b:c7ac  de 96 6d	  dec $6d96,x
$0b:c7af  d3 b2		 cmp ($b2,s),y
$0b:c7b1  7f aa ba aa   adc $aabaaa,x
$0b:c7b5  66 9a		 ror $9a
$0b:c7b7  f7 00		 sbc [$00],y
$0b:c7b9  87 8c		 sta [$8c]
$0b:c7bb  02 49		 cop #$49
$0b:c7bd  3f a4 5f a1   and $a15fa4,x
$0b:c7c1  16 c8		 asl $c8,x
$0b:c7c3  45 76		 eor $76
$0b:c7c5  2f 5f 82 5f   and $5f825f
$0b:c7c9  eb			xba
$0b:c7ca  1c 0c 25	  trb $250c
$0b:c7cd  82 5d 18	  brl $e02d
$0b:c7d0  d9 d8 2c	  cmp $2cd8,y
$0b:c7d3  be ce 4f	  ldx $4fce,y
$0b:c7d6  72 ef		 adc ($ef)
$0b:c7d8  3c dd ef	  bit $efdd,x
$0b:c7db  a6 1f		 ldx $1f
$0b:c7dd  08			php
$0b:c7de  c5 e3		 cmp $e3
$0b:c7e0  c9 fc 8f	  cmp #$8ffc
$0b:c7e3  5f a2 5f e9   eor $e95fa2,x
$0b:c7e7  97 fb		 sta [$fb],y
$0b:c7e9  f5 fe		 sbc $fe,x
$0b:c7eb  bf 7f b3 32   lda $32b37f,x
$0b:c7ef  ae 7d 52	  ldx $527d
$0b:c7f2  c5 25		 cmp $25
$0b:c7f4  b8			clv
$0b:c7f5  c4 2f		 cpy $2f
$0b:c7f7  70 c9		 bvs $c7c2
$0b:c7f9  dc 12 39	  jml [$3912]
$0b:c7fc  03 83		 ora $83,s
$0b:c7fe  c0 28		 cpy #$28
$0b:c800  96 e9		 stx $e9,y
$0b:c802  45 f2		 eor $f2
$0b:c804  31 3d		 and ($3d),y
$0b:c806  87 c7		 sta [$c7]
$0b:c808  e0 10		 cpx #$10
$0b:c80a  c8			iny
$0b:c80b  04 12		 tsb $12
$0b:c80d  01 03		 ora ($03,x)
$0b:c80f  60			rts
$0b:c810  06 fe		 asl $fe
$0b:c812  bd 5d ee	  lda $ee5d,x
$0b:c815  76 bd		 ror $bd,x
$0b:c817  17 69		 ora [$69],y
$0b:c819  84 fb		 sty $fb
$0b:c81b  a1 7c		 lda ($7c,x)
$0b:c81d  d0 7e		 bne $c89d
$0b:c81f  38			sec
$0b:c820  1e 08 04	  asl $0408,x
$0b:c823  fa			plx
$0b:c824  fd 3e ff	  sbc $ff3e,x
$0b:c827  47 3f		 eor [$3f]
$0b:c829  9f 8f c4 03   sta $03c48f,x
$0b:c82d  a1 00		 lda ($00,x)
$0b:c82f  d0 40		 bne $c871
$0b:c831  38			sec
$0b:c832  0c 00 26	  tsb $2600
$0b:c835  01 20		 ora ($20,x)
$0b:c837  22 10 09 0c   jsl $0c0910
$0b:c83b  06 8d		 asl $8d
$0b:c83d  06 a5		 asl $a5
$0b:c83f  c2 31		 rep #$31
$0b:c841  d0 9c		 bne $c7df
$0b:c843  ac 4e 07	  ldy $074e
$0b:c846  03 86		 ora $86,s
$0b:c848  43 22		 eor $22,s
$0b:c84a  11 09		 ora ($09),y
$0b:c84c  04 86		 tsb $86
$0b:c84e  83 47		 sta $47,s
$0b:c850  a3 d3		 lda $d3,s
$0b:c852  f0 f8		 beq $c84c
$0b:c854  fc 7e 7c	  jsr ($7c7e,x)
$0b:c857  d8			cld
$0b:c858  13 08		 ora ($08,s),y
$0b:c85a  04 22		 tsb $22
$0b:c85c  01 84		 ora ($84,x)
$0b:c85e  c0 58 ac	  cpy #$ac58
$0b:c861  1d 28 85	  ora $8528,x
$0b:c864  c7 21		 cmp [$21]
$0b:c866  a9 e4 70	  lda #$70e4
$0b:c869  38			sec
$0b:c86a  13 09		 ora ($09,s),y
$0b:c86c  84 22		 sty $22
$0b:c86e  11 04		 ora ($04),y
$0b:c870  c2 60		 rep #$60
$0b:c872  bc 5e 2f	  ldy $2f5e,x
$0b:c875  97 87		 sta [$87],y
$0b:c877  e3 f1		 sbc $f1,s
$0b:c879  fc 9f 40	  jsr ($409f,x)
$0b:c87c  f6 07		 inc $07,x
$0b:c87e  90 3b		 bcc $c8bb
$0b:c880  81 d4		 sta ($d4,x)
$0b:c882  0e 60 48	  asl $4860
$0b:c885  02 60		 cop #$60
$0b:c887  23 41		 and $41,s
$0b:c889  16 08		 asl $08,x
$0b:c88b  90 43		 bcc $c8d0
$0b:c88d  82 14 10	  brl $d8a4
$0b:c890  60			rts
$0b:c891  81 03		 sta ($03,x)
$0b:c893  f8			sed
$0b:c894  27 41		 and [$41]
$0b:c896  36 09		 rol $09,x
$0b:c898  90 4b		 bcc $c8e5
$0b:c89a  82 54 12	  brl $daf1
$0b:c89d  60			rts
$0b:c89e  91 03		 sta ($03),y
$0b:c8a0  60			rts
$0b:c8a1  2b			pld
$0b:c8a2  41 56		 eor ($56,x)
$0b:c8a4  0a			asl a
$0b:c8a5  90 53		 bcc $c8fa
$0b:c8a7  82 94 14	  brl $dd3e
$0b:c8aa  60			rts
$0b:c8ab  a1 04		 lda ($04,x)
$0b:c8ad  f8			sed
$0b:c8ae  13 41		 ora ($41,s),y
$0b:c8b0  e1 e0		 sbc ($e0,x)
$0b:c8b2  1f 09 78 7e   ora $7e7809,x
$0b:c8b6  9d 21 1c	  sta $1c21,x
$0b:c8b9  49 08 9e	  eor #$9e08
$0b:c8bc  a3 8e		 lda $8e,s
$0b:c8be  90 0f		 bcc $c8cf
$0b:c8c0  f9 57 cc	  sbc $cc57,y
$0b:c8c3  de 77 f4	  dec $f477,x
$0b:c8c6  47 a6		 eor [$a6]
$0b:c8c8  7d 55 eb	  adc $eb55,x
$0b:c8cb  bf 61 ac 82   lda $82ac61,x
$0b:c8cf  41 70		 eor ($70,x)
$0b:c8d1  69 83 2a	  adc #$2a83
$0b:c8d4  ee 0e 30	  inc $300e
$0b:c8d7  6f 1b b7 df   adc $dfb71b
$0b:c8db  de 0f f1	  dec $f10f,x
$0b:c8de  07 8c		 ora [$8c]
$0b:c8e0  7c 85 e5	  jmp ($e585,x)
$0b:c8e3  3f 32 79 d7   and $d77932,x
$0b:c8e7  d0 de		 bne $c8c7
$0b:c8e9  97 f5		 sta [$f5],y
$0b:c8eb  47 ae		 eor [$ae]
$0b:c8ed  7d 95 ed	  adc $ed95,x
$0b:c8f0  bf 76 7b f7   lda $f77b76,x
$0b:c8f4  c1 de		 cmp ($de,x)
$0b:c8f6  1f f1 87 90   ora $9087f1,x
$0b:c8fa  7c a5 e6	  jmp ($e6a5,x)
$0b:c8fd  3f 3a 7a 17   and $177a3a,x
$0b:c901  d2 de		 cmp ($de)
$0b:c903  a7 f5		 lda [$f5]
$0b:c905  c7 b2		 cmp [$b2]
$0b:c907  7d b5 ee	  adc $eeb5,x
$0b:c90a  bf 7e 78 37   lda $37787e,x
$0b:c90e  c3 de		 cmp $de,s
$0b:c910  2f f2 07 94   and $9407f2
$0b:c914  7c c5 e7	  jmp ($e7c5,x)
$0b:c917  3f 42 7a 57   and $577a42,x
$0b:c91b  d4 de		 pei ($de)
$0b:c91d  b7 f6		 lda [$f6],y
$0b:c91f  47 b6		 eor [$b6]
$0b:c921  7d d5 ef	  adc $efd5,x
$0b:c924  bf 06 78 77   lda $777806,x
$0b:c928  c5 de		 cmp $de
$0b:c92a  3f f2 87 98   and $9887f2,x
$0b:c92e  7c e5 e8	  jmp ($e8e5,x)
$0b:c931  3f 4a 7a 97   and $977a4a,x
$0b:c935  d6 de		 dec $de,x
$0b:c937  c7 f6		 cmp [$f6]
$0b:c939  c7 ba		 cmp [$ba]
$0b:c93b  7d f5 e0	  adc $e0f5,x
$0b:c93e  bf 0e 78 b7   lda $b7780e,x
$0b:c942  c7 de		 cmp [$de]
$0b:c944  4f f3 07 9c   eor $9c07f3
$0b:c948  7d 05 e9	  adc $e905,x
$0b:c94b  3f 52 7a d7   and $d77a52,x
$0b:c94f  d8			cld
$0b:c950  de d7 f7	  dec $f7d7,x
$0b:c953  47 be		 eor [$be]
$0b:c955  7c 15 e1	  jmp ($e115,x)
$0b:c958  bf 16 78 f7   lda $f77816,x
$0b:c95c  c9 de 5f	  cmp #$5fde
$0b:c95f  f3 87		 sbc ($87,s),y
$0b:c961  a0 7d 25	  ldy #$257d
$0b:c964  ea			nop
$0b:c965  3f 5a 7b 17   and $177b5a,x
$0b:c969  da			phx
$0b:c96a  de e7 f7	  dec $f7e7,x
$0b:c96d  c7 82		 cmp [$82]
$0b:c96f  7c 35 e2	  jmp ($e235,x)
$0b:c972  bf 1e 79 37   lda $37791e,x
$0b:c976  cb			wai
$0b:c977  de 6f f4	  dec $f46f,x
$0b:c97a  07 a4		 ora [$a4]
$0b:c97c  7d 45 eb	  adc $eb45,x
$0b:c97f  3f 62 7b 57   and $577b62,x
$0b:c983  dc de f7	  jml [$f7de]
$0b:c986  f0 47		 beq $c9cf
$0b:c988  86 7c		 stx $7c
$0b:c98a  55 e3		 eor $e3,x
$0b:c98c  bf 26 79 77   lda $777926,x
$0b:c990  cd de 7f	  cmp $7fde
$0b:c993  f4 87 a8	  pea $a887
$0b:c996  7d 65 ec	  adc $ec65,x
$0b:c999  3f 6a 7b 97   and $977b6a,x
$0b:c99d  de de 07	  dec $07de,x
$0b:c9a0  f0 c7		 beq $c969
$0b:c9a2  8a			txa
$0b:c9a3  7c 75 e4	  jmp ($e475,x)
$0b:c9a6  bf 2e 79 b7   lda $b7792e,x
$0b:c9aa  cf de 8f f5   cmp $f58fde
$0b:c9ae  07 ac		 ora [$ac]
$0b:c9b0  7d 85 ed	  adc $ed85,x
$0b:c9b3  3f 72 7b d7   and $d77b72,x
$0b:c9b7  c0 de 17	  cpy #$17de
$0b:c9ba  f1 47		 sbc ($47),y
$0b:c9bc  8e 7c 95	  stx $957c
$0b:c9bf  e5 bf		 sbc $bf
$0b:c9c1  36 79		 rol $79,x
$0b:c9c3  f7 d1		 sbc [$d1],y
$0b:c9c5  de 9f f5	  dec $f59f,x
$0b:c9c8  87 b0		 sta [$b0]
$0b:c9ca  7d a5 ee	  adc $eea5,x
$0b:c9cd  3f 7a 78 17   and $17787a,x
$0b:c9d1  c2 de		 rep #$de
$0b:c9d3  27 f1		 and [$f1]
$0b:c9d5  c7 92		 cmp [$92]
$0b:c9d7  7c b5 e6	  jmp ($e6b5,x)
$0b:c9da  bf 3e 7a 37   lda $377a3e,x
$0b:c9de  d3 de		 cmp ($de,s),y
$0b:c9e0  af f6 07 b4   lda $b407f6
$0b:c9e4  7d c5 ef	  adc $efc5,x
$0b:c9e7  3f 02 78 57   and $577802,x
$0b:c9eb  c4 de		 cpy $de
$0b:c9ed  37 f2		 and [$f2],y
$0b:c9ef  47 96		 eor [$96]
$0b:c9f1  7c d5 e7	  jmp ($e7d5,x)
$0b:c9f4  bf 46 7a 77   lda $777a46,x
$0b:c9f8  d5 de		 cmp $de,x
$0b:c9fa  bf f6 87 b8   lda $b887f6,x
$0b:c9fe  7d e5 e0	  adc $e0e5,x
$0b:ca01  3f 0a 78 97   and $97780a,x
$0b:ca05  c6 de		 dec $de
$0b:ca07  47 f2		 eor [$f2]
$0b:ca09  c7 9a		 cmp [$9a]
$0b:ca0b  7c f5 e8	  jmp ($e8f5,x)
$0b:ca0e  bf 4e 7a b7   lda $b77a4e,x
$0b:ca12  d7 de		 cmp [$de],y
$0b:ca14  cf f7 07 bc   cmp $bc07f7
$0b:ca18  7c 05 e1	  jmp ($e105,x)
$0b:ca1b  3f 12 78 d7   and $d77812,x
$0b:ca1f  c8			iny
$0b:ca20  de 57 f3	  dec $f357,x
$0b:ca23  47 9e		 eor [$9e]
$0b:ca25  7d 15 e9	  adc $e915,x
$0b:ca28  bf 56 7a f7   lda $f77a56,x
$0b:ca2c  d9 de df	  cmp $dfde,y
$0b:ca2f  f7 87		 sbc [$87],y
$0b:ca31  80 7c		 bra $caaf
$0b:ca33  25 e2		 and $e2
$0b:ca35  3f 1a 79 17   and $17791a,x
$0b:ca39  ca			dex
$0b:ca3a  de 67 f3	  dec $f367,x
$0b:ca3d  c7 a2		 cmp [$a2]
$0b:ca3f  7d 35 ea	  adc $ea35,x
$0b:ca42  bf 5e 7b 37   lda $377b5e,x
$0b:ca46  db			stp
$0b:ca47  de ef f0	  dec $f0ef,x
$0b:ca4a  07 84		 ora [$84]
$0b:ca4c  7c 45 e3	  jmp ($e345,x)
$0b:ca4f  3f 22 79 57   and $577922,x
$0b:ca53  cc de 77	  cpy $77de
$0b:ca56  f4 47 a6	  pea $a647
$0b:ca59  7d 55 eb	  adc $eb55,x
$0b:ca5c  bf 66 7b 77   lda $777b66,x
$0b:ca60  c0 00 20	  cpy #$2000
$0b:ca63  80 3b		 bra $caa0
$0b:ca65  fd fd 9f	  sbc $9ffd,x
$0b:ca68  b9 05 37	  lda $3705,y
$0b:ca6b  65 d6		 adc $d6
$0b:ca6d  84 e9		 sty $e9
$0b:ca6f  ab			plb
$0b:ca70  75 bb		 adc $bb,x
$0b:ca72  07 8e		 ora [$8e]
$0b:ca74  29 34 c7	  and #$c734
$0b:ca77  6b			rtl
$0b:ca78  68			pla
$0b:ca79  5f f8 00 7f   eor $7f00f8,x
$0b:ca7d  33 ba		 and ($ba,s),y
$0b:ca7f  1c 24 1f	  trb $1f24
$0b:ca82  e7 ff		 sbc [$ff]
$0b:ca84  a2 5d a0	  ldx #$a05d
$0b:ca87  5a			phy
$0b:ca88  8e 9d fb	  stx $fb9d
$0b:ca8b  25 d1		 and $d1
$0b:ca8d  c1 f7		 cmp ($f7,x)
$0b:ca8f  ef d0 0f c3   sbc $c30fd0
$0b:ca93  f8			sed
$0b:ca94  20 78 88	  jsr $8878
$0b:ca97  7f 42 3f 80   adc $803f42,x
$0b:ca9b  8f c9 27 f2   sta $f227c9
$0b:ca9f  09 fc 6b	  ora #$6bfc
$0b:caa2  bd 50 a0	  lda $a050,x
$0b:caa5  e1 25		 sbc ($25,x)
$0b:caa7  15 cc		 ora $cc,x
$0b:caa9  24 0a		 bit $0a
$0b:caab  99 8c 84	  sta $848c,y
$0b:caae  42 b0		 wdm #$b0
$0b:cab0  1c 08 24	  trb $2408
$0b:cab3  86 7f		 stx $7f
$0b:cab5  80 0f		 bra $cac6
$0b:cab7  dd 5e e9	  cmp $e95e,x
$0b:caba  52 c4		 eor ($c4)
$0b:cabc  e7 26		 sbc [$26]
$0b:cabe  b4 18		 ldy $18,x
$0b:cac0  dc ee e5	  jml [$e5ee]
$0b:cac3  c6 90		 dec $90
$0b:cac5  c8			iny
$0b:cac6  6a			ror a
$0b:cac7  3e 09 1e	  rol $1e09,x
$0b:caca  2f f1 06 ff   and $ff06f1
$0b:cace  40			rti
$0b:cacf  bf f2 00 f8   lda $f800f2,x
$0b:cad3  c4 03		 cpy $03
$0b:cad5  e7 f2		 sbc [$f2]
$0b:cad7  87 f3		 sta [$f3]
$0b:cad9  33 fa		 and ($fa,s),y
$0b:cadb  8f 05 07 8d   sta $8d0705
$0b:cadf  a9 b5 d9	  lda #$d9b5
$0b:cae2  3e ba ad	  rol $adba,x
$0b:cae5  d5 56		 cmp $56,x
$0b:cae7  ca			dex
$0b:cae8  1f 0b fc 00   ora $00fc0b,x
$0b:caec  90 13		 bcc $cb01
$0b:caee  ff 04 5f e1   sbc $e15f04,x
$0b:caf2  0b			phd
$0b:caf3  fc 51 7f	  jsr ($7f51,x)
$0b:caf6  99 af e4	  sta $e4af,y
$0b:caf9  da			phx
$0b:cafa  01 b0		 ora ($b0,x)
$0b:cafc  b7 42		 lda [$42],y
$0b:cafe  af f9 99 bf   lda $bf99f9
$0b:cb02  5a			phy
$0b:cb03  9d 00 a1	  sta $a100,x
$0b:cb06  f8			sed
$0b:cb07  6a			ror a
$0b:cb08  1a			inc a
$0b:cb09  88			dey
$0b:cb0a  07 02		 ora [$02]
$0b:cb0c  ff 81 ff 98   sbc $98ff81,x
$0b:cb10  43 81		 eor $81,s
$0b:cb12  ff 60 93 0c   sbc $0c9360,x
$0b:cb16  b7 76		 lda [$76],y
$0b:cb18  6b			rtl
$0b:cb19  94 6a		 sty $6a,x
$0b:cb1b  93 cc		 sta ($cc,s),y
$0b:cb1d  ca			dex
$0b:cb1e  cc 75 38	  cpy $3875
$0b:cb21  8a			txa
$0b:cb22  b5 13		 lda $13,x
$0b:cb24  5d 7e b2	  eor $b27e,x
$0b:cb27  c6 c4		 dec $c4
$0b:cb29  01 05		 ora ($05,x)
$0b:cb2b  ff cc ff fc   sbc $fcffcc,x
$0b:cb2f  ef fd dd 9c   sbc $9cddfd
$0b:cb33  1f f8 08 7c   ora $7c08f8,x
$0b:cb37  41 e5		 eor ($e5,x)
$0b:cb39  da			phx
$0b:cb3a  80 6d		 bra $cba9
$0b:cb3c  68			pla
$0b:cb3d  b4 c8		 ldy $c8,x
$0b:cb3f  67 4e		 adc [$4e]
$0b:cb41  21 16		 and ($16,x)
$0b:cb43  c0 f5 61	  cpy #$61f5
$0b:cb46  01 f4		 ora ($f4,x)
$0b:cb48  fd 40 3e	  sbc $3e40,x
$0b:cb4b  70 0f		 bvs $cb5c
$0b:cb4d  78			sei
$0b:cb4e  80 dd		 bra $cb2d
$0b:cb50  e3 32		 sbc $32,s
$0b:cb52  9b			txy
$0b:cb53  42 71		 wdm #$71
$0b:cb55  d8			cld
$0b:cb56  3d 3c 02	  and $023c,x
$0b:cb59  f7 00		 sbc [$00],y
$0b:cb5b  d7 54		 cmp [$54],y
$0b:cb5d  21 bf		 and ($bf,x)
$0b:cb5f  a7 fa		 lda [$fa]
$0b:cb61  28			plp
$0b:cb62  41 fe		 eor ($fe,x)
$0b:cb64  8f f0 d2 e4   sta $e4d2f0
$0b:cb68  62 78 9e	  per $69e3
$0b:cb6b  4f 86 6d 82   eor $826d86
$0b:cb6f  ad 70 ad	  lda $ad70
$0b:cb72  dd 68 9e	  cmp $9e68,x
$0b:cb75  0e cb c2	  asl $c2cb
$0b:cb78  bf 7f c7 e1   lda $e1c77f,x
$0b:cb7c  3e ff df	  rol $dfff,x
$0b:cb7f  7f f3 df fc   adc $fcdff3,x
$0b:cb83  e7 ff		 sbc [$ff]
$0b:cb85  7c 23 0e	  jmp ($0e23,x)
$0b:cb88  96 63		 stx $63,y
$0b:cb8a  1a			inc a
$0b:cb8b  ac 51 72	  ldy $7251
$0b:cb8e  fe e9 cc	  inc $cce9,x
$0b:cb91  86 e7		 stx $e7
$0b:cb93  8a			txa
$0b:cb94  8c 7c e5	  sty $e57c
$0b:cb97  5b			tcd
$0b:cb98  d9 23 94	  cmp $9423,y
$0b:cb9b  3c ff ff	  bit $ffff,x
$0b:cb9e  57 ff		 eor [$ff],y
$0b:cba0  8c e4 13	  sty $13e4
$0b:cba3  08			php
$0b:cba4  71 7f		 adc ($7f),y
$0b:cba6  fc 3f fe	  jsr ($fe3f,x)
$0b:cba9  2e 85 29	  rol $2985
$0b:cbac  ea			nop
$0b:cbad  74 ed		 stz $ed,x
$0b:cbaf  b0 4f		 bcs $cc00
$0b:cbb1  d4 c3		 pei ($c3)
$0b:cbb3  99 4b 98	  sta $984b,y
$0b:cbb6  ef 71 9d 6a   sbc $6a9d71
$0b:cbba  a7 f5		 lda [$f5]
$0b:cbbc  d6 10		 dec $10,x
$0b:cbbe  1f f4 02 ef   ora $ef02f4,x
$0b:cbc2  00 e7		 brk #$e7
$0b:cbc4  c0 10 61	  cpy #$6110
$0b:cbc7  73 80		 adc ($80,s),y
$0b:cbc9  ea			nop
$0b:cbca  f0 6e		 beq $cc3a
$0b:cbcc  f2 eb		 sbc ($eb)
$0b:cbce  42 74		 wdm #$74
$0b:cbd0  d5 ba		 cmp $ba,x
$0b:cbd2  dd 83 c7	  cmp $c783,x
$0b:cbd5  14 ba		 trb $ba
$0b:cbd7  43 b5		 eor $b5,s
$0b:cbd9  b8			clv
$0b:cbda  21 3b		 and ($3b,x)
$0b:cbdc  07 db		 ora [$db]
$0b:cbde  5f c8 8c f9   eor $f98cc8,x
$0b:cbe2  35 17		 and $17,x
$0b:cbe4  3a			dec a
$0b:cbe5  ae f3 0b	  ldx $0bf3
$0b:cbe8  73 ad		 adc ($ad,s),y
$0b:cbea  69 74 3c	  adc #$3c74
$0b:cbed  ed a4 ad	  sbc $ada4
$0b:cbf0  06 00		 asl $00
$0b:cbf2  b3 80		 lda ($80,s),y
$0b:cbf4  57 e0		 eor [$e0],y
$0b:cbf6  1b			tcs
$0b:cbf7  f6 20		 inc $20,x
$0b:cbf9  f6 60		 inc $60,x
$0b:cbfb  16 1d		 asl $1d,x
$0b:cbfd  ce 5a e7	  dec $e75a
$0b:cc00  59 d3 55	  eor $55d3,y
$0b:cc03  73 72		 adc ($72,s),y
$0b:cc05  ae 2f b7	  ldx $b72f
$0b:cc08  25 63		 and $63
$0b:cc0a  e4 c6		 cpx $c6
$0b:cc0c  ec cf f0	  cpx $f0cf
$0b:cc0f  63 86		 adc $86,s
$0b:cc11  7c 10 af	  jmp ($af10,x)
$0b:cc14  f0 fe		 beq $cc14
$0b:cc16  c0 32 bd	  cpy #$bd32
$0b:cc19  aa			tax
$0b:cc1a  df 9f 55 d8   cmp $d8559f,x
$0b:cc1e  a3 6a		 lda $6a,s
$0b:cc20  77 76		 adc [$76],y
$0b:cc22  0c 9d 52	  tsb $529d
$0b:cc25  a9 ce fe	  lda #$fece
$0b:cc28  d0 a4		 bne $cbce
$0b:cc2a  1f 88 07 82   ora $820788,x
$0b:cc2e  0f c0 8f e0   ora $e08fc0
$0b:cc32  23 f0		 and $f0,s
$0b:cc34  09 7c 02	  ora #$027c
$0b:cc37  7e 0a 1a	  ror $1a0a,x
$0b:cc3a  d7 9a		 cmp [$9a],y
$0b:cc3c  ab			plb
$0b:cc3d  18			clc
$0b:cc3e  d5 4b		 cmp $4b,x
$0b:cc40  b4 f4		 ldy $f4,x
$0b:cc42  5a			phy
$0b:cc43  ed bb df	  sbc $dfbb
$0b:cc46  02 9c		 cop #$9c
$0b:cc48  63 75		 adc $75,s
$0b:cc4a  b4 18		 ldy $18,x
$0b:cc4c  0c 1f c7	  tsb $c71f
$0b:cc4f  03 e8		 ora $e8,s
$0b:cc51  c0 ff 10	  cpy #$10ff
$0b:cc54  1f 84 03 f8   ora $f80384,x
$0b:cc58  88			dey
$0b:cc59  14 18		 trb $18
$0b:cc5b  4d b7 b4	  eor $b4b7
$0b:cc5e  2b			pld
$0b:cc5f  1d 56 b1	  ora $b156,x
$0b:cc62  8b			phb
$0b:cc63  f3 49		 sbc ($49,s),y
$0b:cc65  7d fb 5c	  adc $5cfb,x
$0b:cc68  ad 2a 7d	  lda $7d2a
$0b:cc6b  9c 83 d0	  stz $d083
$0b:cc6e  2f f8 0f f9   and $f90ff8
$0b:cc72  04 14		 tsb $14
$0b:cc74  c1 10		 cmp ($10,x)
$0b:cc76  ff c2 bf f8   sbc $f8bfc2,x
$0b:cc7a  1f ff 03 ff   ora $ff03ff,x
$0b:cc7e  0e e2 51	  asl $51e2
$0b:cc81  6d 56 2e	  adc $2e56
$0b:cc84  24 d2		 bit $d2
$0b:cc86  c5 37		 cmp $37
$0b:cc88  c9 52 2e	  cmp #$2e52
$0b:cc8b  7b			tdc
$0b:cc8c  8c 6e af	  sty $af6e
$0b:cc8f  d0 a6		 bne $cc37
$0b:cc91  02 19		 cop #$19
$0b:cc93  29 88 82	  and #$8288
$0b:cc96  16 0f		 asl $0f,x
$0b:cc98  fc 53 ff	  jsr ($ff53,x)
$0b:cc9b  87 a9		 sta [$a9]
$0b:cc9d  d5 be		 cmp $be,x
$0b:cc9f  9b			txy
$0b:cca0  ab			plb
$0b:cca1  3f 0e d5 0b   and $0bd50e,x
$0b:cca5  d6 f5		 dec $f5,x
$0b:cca7  79 95 29	  adc $2995,y
$0b:ccaa  c5 ab		 cmp $ab
$0b:ccac  45 20		 eor $20
$0b:ccae  ff c0 d4 e3   sbc $e3d4c0,x
$0b:ccb2  04 ff		 tsb $ff
$0b:ccb4  d0 10		 bne $ccc6
$0b:ccb6  03 87		 ora $87,s
$0b:ccb8  ff c7 7f f1   sbc $f17fc7,x
$0b:ccbc  2e c6 a7	  rol $a7c6
$0b:ccbf  09 14 db	  ora #$db14
$0b:ccc2  4b			phk
$0b:ccc3  76 b5		 ror $b5,x
$0b:ccc5  ba			tsx
$0b:ccc6  95 4e		 sta $4e,x
$0b:ccc8  0b			phd
$0b:ccc9  ac 97 72	  ldy $7297
$0b:cccc  7a			ply
$0b:cccd  92 7f		 sta ($7f)
$0b:cccf  f5 0f		 sbc $0f,x
$0b:ccd1  ff 09 ff d0   sbc $d0ff09,x
$0b:ccd5  bf fa df ff   lda $ffdffa,x
$0b:ccd9  e3 ff		 sbc $ff,s
$0b:ccdb  d1 ff		 cmp ($ff),y
$0b:ccdd  c8			iny
$0b:ccde  ff f4 18 06   sbc $0618f4,x
$0b:cce2  4a			lsr a
$0b:cce3  43 a9		 eor $a9,s
$0b:cce5  a3 d4		 lda $d4,s
$0b:cce7  a9 fd 4d	  lda #$4dfd
$0b:ccea  d4 ab		 pei ($ab)
$0b:ccec  bf 5d 91 f0   lda $f0915d,x
$0b:ccf0  69 9e 0b	  adc #$0b9e
$0b:ccf3  f9 34 08	  sbc $0834,y
$0b:ccf6  25 01		 and $01
$0b:ccf8  33 19		 and ($19,s),y
$0b:ccfa  04 21		 tsb $21
$0b:ccfc  50 5a		 bvc $cd58
$0b:ccfe  56 7e		 lsr $7e,x
$0b:cd00  4b			phk
$0b:cd01  f5 a4		 sbc $a4,x
$0b:cd03  5a			phy
$0b:cd04  36 db		 rol $db,x
$0b:cd06  2b			pld
$0b:cd07  5f 62 55 67   eor $675562,x
$0b:cd0b  ca			dex
$0b:cd0c  fa			plx
$0b:cd0d  d9 20 c9	  cmp $c920,y
$0b:cd10  02 48		 cop #$48
$0b:cd12  65 ff		 adc $ff
$0b:cd14  f4 df fc	  pea $fcdf
$0b:cd17  9f ff 98 64   sta $6498ff,x
$0b:cd1b  0e b2 07	  asl $07b2
$0b:cd1e  6a			ror a
$0b:cd1f  cb			wai
$0b:cd20  f4 77 fb	  pea $fb77
$0b:cd23  7a			ply
$0b:cd24  7d 4a df	  adc $df4a,x
$0b:cd27  eb			xba
$0b:cd28  8a			txa
$0b:cd29  cd 31 da	  cmp $da31
$0b:cd2c  d5 28		 cmp $28,x
$0b:cd2e  37 c8		 and [$c8],y
$0b:cd30  01 39		 ora ($39,x)
$0b:cd32  2f ed 97 fd   and $fd97ed
$0b:cd36  da			phx
$0b:cd37  fe dd 54	  inc $54dd,x
$0b:cd3a  c1 fa		 cmp ($fa,x)
$0b:cd3c  95 f4		 sta $f4,x
$0b:cd3e  2a			rol a
$0b:cd3f  8f cf 64 04   sta $0464cf
$0b:cd43  43 25		 eor $25,s
$0b:cd45  69 f1 c4	  adc #$c4f1
$0b:cd48  b8			clv
$0b:cd49  37 ff		 and [$ff],y
$0b:cd4b  2e 3b 89	  rol $893b
$0b:cd4e  b2 ea		 lda ($ea)
$0b:cd50  d6 79		 dec $79,x
$0b:cd52  f2 5c		 sbc ($5c)
$0b:cd54  6d b7 ff	  adc $ffb7
$0b:cd57  1c ff cf	  trb $cfff
$0b:cd5a  3f f1 8f fc   and $fc8ff1,x
$0b:cd5e  e7 ff		 sbc [$ff]
$0b:cd60  28			plp
$0b:cd61  ff cc 3f f7   sbc $f73fcc,x
$0b:cd65  2f fd ea 4d   and $4deafd
$0b:cd69  0b			phd
$0b:cd6a  de fd ea	  dec $eafd,x
$0b:cd6d  d9 df 87	  cmp $87df,y
$0b:cd70  13 47		 ora ($47,s),y
$0b:cd72  5a			phy
$0b:cd73  d8			cld
$0b:cd74  e9 ec 75	  sbc #$75ec
$0b:cd77  9e af 07	  stz $07af,x
$0b:cd7a  fe c1 0c	  inc $0cc1,x
$0b:cd7d  47 fe		 eor [$fe]
$0b:cd7f  1d ff 8f	  ora $8fff,x
$0b:cd82  19 04 82	  ora $8204,y
$0b:cd85  12 ef		 ora ($ef)
$0b:cd87  ff 0b fb 0e   sbc $0efb0b,x
$0b:cd8b  f8			sed
$0b:cd8c  cf 38 3f 18   cmp $183f38
$0b:cd90  07 0e		 ora [$0e]
$0b:cd92  05 0f		 ora $0f
$0b:cd94  87 4f		 sta [$4f]
$0b:cd96  67 df		 adc [$df]
$0b:cd98  06 30		 asl $30
$0b:cd9a  40			rti
$0b:cd9b  0f e1 03 80   ora $8003e1
$0b:cd9f  43 e0		 eor $e0,s
$0b:cda1  13 d8		 ora ($d8,s),y
$0b:cda3  01 d4		 ora ($d4,x)
$0b:cda5  38			sec
$0b:cda6  28			plp
$0b:cda7  01 dd		 ora ($dd,x)
$0b:cda9  e0 29 b3	  cpx #$b329
$0b:cdac  2e b4 27	  rol $27b4
$0b:cdaf  4d 5b ad	  eor $ad5b
$0b:cdb2  d8			cld
$0b:cdb3  3c 71 47	  bit $4771,x
$0b:cdb6  d9 5f c0	  cmp $c05f,y
$0b:cdb9  1b			tcs
$0b:cdba  8a			txa
$0b:cdbb  ea			nop
$0b:cdbc  d1 75		 cmp ($75),y
$0b:cdbe  5b			tcd
$0b:cdbf  ab			plb
$0b:cdc0  2d 26 6d	  and $6d26
$0b:cdc3  ac 8d d0	  ldy $d08d
$0b:cdc6  f7 16		 sbc [$16],y
$0b:cdc8  1e b5 5b	  asl $5bb5,x
$0b:cdcb  37 fc		 and [$fc],y
$0b:cdcd  80 7f		 bra $ce4e
$0b:cdcf  9b			txy
$0b:cdd0  e5 00		 sbc $00
$0b:cdd2  be c0 35	  ldx $35c0,y
$0b:cdd5  f0 0e		 beq $cde5
$0b:cdd7  fc 03 df	  jsr ($df03,x)
$0b:cdda  00 86		 brk #$86
$0b:cddc  6c 64 9d	  jmp ($9d64)
$0b:cddf  bc d5 de	  ldy $ded5,x
$0b:cde2  93 b7		 sta ($b7,s),y
$0b:cde4  cb			wai
$0b:cde5  5a			phy
$0b:cde6  72 51		 adc ($51)
$0b:cde8  c9 6f 1b	  cmp #$1b6f
$0b:cdeb  ad 63 fb	  lda $fb63
$0b:cdee  c0 13 e1	  cpy #$e113
$0b:cdf1  3f 80 67 c5   and $c56780,x
$0b:cdf5  42 cd		 wdm #$cd
$0b:cdf7  06 19		 asl $19
$0b:cdf9  61 f1		 adc ($f1,x)
$0b:cdfb  15 de		 ora $de,x
$0b:cdfd  17 da		 ora [$da],y
$0b:cdff  a3 1e		 lda $1e,s
$0b:ce01  e9 f3 74	  sbc #$74f3
$0b:ce04  15 5b		 ora $5b,x
$0b:ce06  a6 8b		 ldx $8b
$0b:ce08  5d 6d a5	  eor $a56d,x
$0b:ce0b  b8			clv
$0b:ce0c  49 c6 12	  eor #$12c6
$0b:ce0f  f8			sed
$0b:ce10  04 7f		 tsb $7f
$0b:ce12  01 8b		 ora ($8b,x)
$0b:ce14  e0 54 7e	  cpx #$7e54
$0b:ce17  1b			tcs
$0b:ce18  0f c7 ea 45   ora $45eac7
$0b:ce1c  48			pha
$0b:ce1d  da			phx
$0b:ce1e  e5 39		 sbc $39
$0b:ce20  b7 7d		 lda [$7d],y
$0b:ce22  15 27		 ora $27,x
$0b:ce24  77 3e		 adc [$3e],y
$0b:ce26  a6 65		 ldx $65
$0b:ce28  73 75		 adc ($75,s),y
$0b:ce2a  af 57 f5 80   lda $80f557
$0b:ce2e  2c 10 5f	  bit $5f10
$0b:ce31  87 d2		 sta [$d2]
$0b:ce33  03 f1		 ora $f1,s
$0b:ce35  80 d8		 bra $ce0f
$0b:ce37  20 70 58	  jsr $5870
$0b:ce3a  7c f2 4f	  jmp ($4ff2,x)
$0b:ce3d  ea			nop
$0b:ce3e  af 5f 63 ba   lda $ba635f
$0b:ce42  1f 5d 2b cf   ora $cf2b5d,x
$0b:ce46  55 9c		 eor $9c,x
$0b:ce48  68			pla
$0b:ce49  a0 37 29	  ldy #$2937
$0b:ce4c  6f 02 ff 81   adc $81ff02
$0b:ce50  ff e0 bf f1   sbc $f1bfe0,x
$0b:ce54  46 18		 lsr $18
$0b:ce56  e0 0c 02	  cpx #$020c
$0b:ce59  3f 0a 97 6f   and $6f970a,x
$0b:ce5d  57 8d		 eor [$8d],y
$0b:ce5f  af 5c a2 3e   lda $3ea25c
$0b:ce63  5f 55 56 2b   eor $2b5655,x
$0b:ce67  a4 d5		 ldy $d5
$0b:ce69  70 ee		 bvs $ce59
$0b:ce6b  fa			plx
$0b:ce6c  e9 27 fe	  sbc #$fe27
$0b:ce6f  e1 ff		 sbc ($ff,x)
$0b:ce71  20 84 08	  jsr $0884
$0b:ce74  c8			iny
$0b:ce75  34 2f		 bit $2f,x
$0b:ce77  fc 11 86	  jsr ($8611,x)
$0b:ce7a  3b			tsc
$0b:ce7b  5c 8c aa c9   jml $c9aa8c
$0b:ce7f  85 9a		 sta $9a
$0b:ce81  5d e5 fa	  eor $fae5,x
$0b:ce84  8f ed 5f 1b   sta $1b5fed
$0b:ce88  aa			tax
$0b:ce89  cb			wai
$0b:ce8a  44 73 76	  mvp $76,$73
$0b:ce8d  ef fe 7f ff   sbc $ff7ffe
$0b:ce91  cb			wai
$0b:ce92  26 01		 rol $01
$0b:ce94  a0 6c 5f	  ldy #$5f6c
$0b:ce97  fb			xce
$0b:ce98  0f fe c9 ff   ora $ffc9fe
$0b:ce9c  e1 f6		 sbc ($f6,x)
$0b:ce9e  35 12		 and $12,x
$0b:cea0  ca			dex
$0b:cea1  1c 12 f5	  trb $f512
$0b:cea4  52 d6		 eor ($d6)
$0b:cea6  ed 62 9b	  sbc $9b62
$0b:cea9  69 4d 17	  adc #$174d
$0b:ceac  67 3a		 adc [$3a]
$0b:ceae  93 ff		 sta ($ff,s),y
$0b:ceb0  ba			tsx
$0b:ceb1  7f ef cf ff   adc $ffcfef,x
$0b:ceb5  5a			phy
$0b:ceb6  68			pla
$0b:ceb7  18			clc
$0b:ceb8  49 08 3f	  eor #$3f08
$0b:cebb  dc 5f e4	  jml [$e45f]
$0b:cebe  8b			phb
$0b:cebf  77 b1		 adc [$b1],y
$0b:cec1  8b			phb
$0b:cec2  5b			tcd
$0b:cec3  74 35		 stz $35,x
$0b:cec5  69 2d ab	  adc #$ab2d
$0b:cec8  09 95 a4	  ora #$a495
$0b:cecb  62 a1 75	  per $446f
$0b:cece  9b			txy
$0b:cecf  f5 13		 sbc $13,x
$0b:ced1  ff e8 ff f7   sbc $f7ffe8,x
$0b:ced5  bf ff bf fb   lda $fbbfff,x
$0b:ced9  18			clc
$0b:ceda  be 84 81	  ldx $8184,y
$0b:cedd  c9 db 3e	  cmp #$3edb
$0b:cee0  77 ad		 adc [$ad],y
$0b:cee2  66 ba		 ror $ba
$0b:cee4  cf 77 ca 46   cmp $46ca77
$0b:cee8  bf 7c 1a 46   lda $461a7c,x
$0b:ceec  3a			dec a
$0b:ceed  53 14		 eor ($14,s),y
$0b:ceef  81 ff		 sta ($ff,x)
$0b:cef1  b0 bf		 bcs $ceb2
$0b:cef3  fa			plx
$0b:cef4  8f ff 11 ff   sta $ff11ff
$0b:cef8  f0 9b		 beq $ce95
$0b:cefa  06 03		 asl $03
$0b:cefc  ff 81 ff e5   sbc $e5ff81,x
$0b:cf00  fc 8e cc	  jsr ($cc8e,x)
$0b:cf03  92 91		 sta ($91)
$0b:cf05  33 d2		 and ($d2,s),y
$0b:cf07  c7 2b		 cmp [$2b]
$0b:cf09  ba			tsx
$0b:cf0a  bd 35 06	  lda $0635,x
$0b:cf0d  b7 94		 lda [$94],y
$0b:cf0f  b4 d1		 ldy $d1,x
$0b:cf11  84 20		 sty $20
$0b:cf13  6c 18 07	  jmp ($0718)
$0b:cf16  ee 01 f7	  inc $f701
$0b:cf19  00 0f		 brk #$0f
$0b:cf1b  be 01 bf	  ldx $bf01,y
$0b:cf1e  90 58		 bcc $cf78
$0b:cf20  37 19		 and [$19],y
$0b:cf22  5b			tcd
$0b:cf23  85 2b		 sta $2b
$0b:cf25  51 72		 eor ($72),y
$0b:cf27  d0 c5		 bne $ceee
$0b:cf29  7a			ply
$0b:cf2a  19 ac 44	  ora $44ac,y
$0b:cf2d  77 a9		 adc [$a9],y
$0b:cf2f  a3 20		 lda $20,s
$0b:cf31  84 02		 sty $02
$0b:cf33  bf 04 cb c0   lda $c0cb04,x
$0b:cf37  3b			tsc
$0b:cf38  f1 00		 sbc ($00),y
$0b:cf3a  58			cli
$0b:cf3b  01 c3		 ora ($c3,x)
$0b:cf3d  d7 00		 cmp [$00],y
$0b:cf3f  bf 40 a9 3d   lda $3da940,x
$0b:cf43  a8			tay
$0b:cf44  be c6 c5	  ldx $c5c6,y
$0b:cf47  a0 b1 6a	  ldy #$6ab1
$0b:cf4a  ab			plb
$0b:cf4b  1a			inc a
$0b:cf4c  0b			phd
$0b:cf4d  2e 87 2b	  rol $2b87
$0b:cf50  35 c5		 and $c5,x
$0b:cf52  4a			lsr a
$0b:cf53  64 ff		 stz $ff
$0b:cf55  fa			plx
$0b:cf56  77 fe		 adc [$fe],y
$0b:cf58  3f ff 8e 90   and $908eff,x
$0b:cf5c  86 3d		 stx $3d
$0b:cf5e  ff 85 7f e2   sbc $e27f85,x
$0b:cf62  df fd 15 a3   cmp $a315fd,x
$0b:cf66  5b			tcd
$0b:cf67  60			rts
$0b:cf68  cd 54 3d	  cmp $3d54
$0b:cf6b  b6 bd		 ldx $bd,y
$0b:cf6d  55 83		 eor $83,x
$0b:cf6f  2b			pld
$0b:cf70  54 b5 4a	  mvn $4a,$b5
$0b:cf73  aa			tax
$0b:cf74  f3 72		 sbc ($72,s),y
$0b:cf76  18			clc
$0b:cf77  10 c2		 bpl $cf3b
$0b:cf79  5e 4c 12	  lsr $124c,x
$0b:cf7c  18			clc
$0b:cf7d  4a			lsr a
$0b:cf7e  ff f1 5f fc   sbc $fc5ff1,x
$0b:cf82  23 ff		 and $ff,s
$0b:cf84  4d a3 ec	  eor $eca3
$0b:cf87  e2 5a		 sep #$5a
$0b:cf89  49 0e 6e	  eor #$6e0e
$0b:cf8c  97 46		 sta [$46],y
$0b:cf8e  b1 fa		 lda ($fa),y
$0b:cf90  e2 53		 sep #$53
$0b:cf92  4c 4e b6	  jmp $b64e
$0b:cf95  83 b8		 sta $b8,s
$0b:cf97  80 7b		 bra $d014
$0b:cf99  20 1d e8	  jsr $e81d
$0b:cf9c  07 d2		 ora [$d2]
$0b:cf9e  01 fc		 ora ($fc,x)
$0b:cfa0  43 0b		 eor $0b,s
$0b:cfa2  fc 1f e1	  jsr ($e11f,x)
$0b:cfa5  50 e8		 bvc $cf8f
$0b:cfa7  79 a4 98	  adc $98a4,y
$0b:cfaa  9a			txs
$0b:cfab  06 c6		 asl $c6
$0b:cfad  69 84 b2	  adc #$b284
$0b:cfb0  7e 26 1b	  ror $1b26,x
$0b:cfb3  5b			tcd
$0b:cfb4  4f 0a 81 2f   eor $2f810a
$0b:cfb8  80 46		 bra $d000
$0b:cfba  e0 13		 cpx #$13
$0b:cfbc  f8			sed
$0b:cfbd  05 3d		 ora $3d
$0b:cfbf  40			rti
$0b:cfc0  30 f8		 bmi $cfba
$0b:cfc2  04 79		 tsb $79
$0b:cfc4  44 35 8c	  mvp $8c,$35
$0b:cfc7  8f ba 15 57   sta $5715ba
$0b:cfcb  92 6b		 sta ($6b)
$0b:cfcd  e2 75		 sep #$75
$0b:cfcf  ad 4e 96	  lda $964e
$0b:cfd2  81 5a		 sta ($5a,x)
$0b:cfd4  ca			dex
$0b:cfd5  3f 40 16 1f   and $1f1640,x
$0b:cfd9  50 20		 bvc $cffb
$0b:cfdb  ff 20 80 76   sbc $768020,x
$0b:cfdf  c7 4d		 cmp [$4d]
$0b:cfe1  aa			tax
$0b:cfe2  ba			tsx
$0b:cfe3  0d 55 22	  ora $2255
$0b:cfe6  65 21		 adc $21
$0b:cfe8  ea			nop
$0b:cfe9  c4 23		 cpy $23
$0b:cfeb  58			cli
$0b:cfec  8c ed 50	  sty $50ed
$0b:cfef  3a			dec a
$0b:cff0  1f 90 00 31   ora $310090,x
$0b:cff4  84 4b		 sty $4b
$0b:cff6  15 5f		 ora $5f,x
$0b:cff8  75 56		 adc $56,x
$0b:cffa  23 b2		 and $b2,s
$0b:cffc  94 69		 sty $69,x
$0b:cffe  ab			plb
$0b:cfff  35 bb		 and $bb,x
$0b:d001  07 8e		 ora [$8e]
$0b:d003  29 34		 and #$34
$0b:d005  c7 6b		 cmp [$6b]
$0b:d007  68			pla
$0b:d008  50 08		 bvc $d012
$0b:d00a  07 b8		 ora [$b8]
$0b:d00c  48			pha
$0b:d00d  0c 81 02	  tsb $0281
$0b:d010  b7 ee		 lda [$ee],y
$0b:d012  41 4d		 eor ($4d,x)
$0b:d014  d9 75 a1	  cmp $a175,y
$0b:d017  3a			dec a
$0b:d018  6a			ror a
$0b:d019  db			stp
$0b:d01a  dc 2c f1	  jml [$f12c]
$0b:d01d  6d d6 3a	  adc $3ad6
$0b:d020  ab			plb
$0b:d021  d3 02		 cmp ($02,s),y
$0b:d023  c3 7c		 cmp $7c,s
$0b:d025  2e 30 09	  rol $0930
$0b:d028  44 03 25	  mvp $25,$03
$0b:d02b  36 92		 rol $92,x
$0b:d02d  df f2 96 58   cmp $5896f2,x
$0b:d031  dc cb c9	  jml [$c9cb]
$0b:d034  2e 8d 5f	  rol $5f8d
$0b:d037  74 df		 stz $df,x
$0b:d039  2a			rol a
$0b:d03a  ac ff 93	  ldy $93ff
$0b:d03d  ff c0 7f f1   sbc $f17fc0,x
$0b:d041  5f fe 65 ff   eor $ff65fe,x
$0b:d045  20 40 18	  jsr $1840
$0b:d048  09 00		 ora #$00
$0b:d04a  62 1c 3f	  per $0f69
$0b:d04d  5d bb 29	  eor $29bb,x
$0b:d050  e7 95		 sbc [$95]
$0b:d052  e4 ab		 cpx $ab
$0b:d054  9d ac 27	  sta $27ac,x
$0b:d057  56 b3		 lsr $b3,x
$0b:d059  93 87		 sta ($87,s),y
$0b:d05b  6a			ror a
$0b:d05c  e4 9f		 cpx $9f
$0b:d05e  f6 40		 inc $40,x
$0b:d060  42 3f		 wdm #$3f
$0b:d062  f4 cf fc	  pea $fccf
$0b:d065  13 ff		 ora ($ff,s),y
$0b:d067  0a			asl a
$0b:d068  ff c3 3f f1   sbc $f13fc3,x
$0b:d06c  4f ff df 95   eor $95dfff
$0b:d070  28			plp
$0b:d071  d0 f5		 bne $d068
$0b:d073  b9 d2 bc	  lda $bcd2,y
$0b:d076  ef 16 c3 da   sbc $dac316
$0b:d07a  c5 59		 cmp $59
$0b:d07c  6a			ror a
$0b:d07d  78			sei
$0b:d07e  dd 29 7c	  cmp $7c29,x
$0b:d081  2a			rol a
$0b:d082  df f9 8f fe   cmp $fe8ff9,x
$0b:d086  e5 ff		 sbc $ff
$0b:d088  9d 7f ee	  sta $ee7f,x
$0b:d08b  3f fd c7 fe   and $fec7fd,x
$0b:d08f  f1 ff		 sbc ($ff),y
$0b:d091  da			phx
$0b:d092  e9 6b		 sbc #$6b
$0b:d094  55 ae		 eor $ae,x
$0b:d096  be 3e 4b	  ldx $4b3e,y
$0b:d099  95 ec		 sta $ec,x
$0b:d09b  d4 f4		 pei ($f4)
$0b:d09d  de 6c d4	  dec $d46c,x
$0b:d0a0  ae a9 56	  ldx $56a9
$0b:d0a3  ad 7f b4	  lda $b47f
$0b:d0a6  bf fb 87 fa   lda $fa87fb,x
$0b:d0aa  f5 fe		 sbc $fe,x
$0b:d0ac  96 7f		 stx $7f,y
$0b:d0ae  a3 3f		 lda $3f,s
$0b:d0b0  fe 27 ff	  inc $ff27,x
$0b:d0b3  53 ff		 eor ($ff,s),y
$0b:d0b5  d7 7c		 cmp [$7c],y
$0b:d0b7  35 ba		 and $ba,x
$0b:d0b9  ba			tsx
$0b:d0ba  dc 2f db	  jml [$db2f]
$0b:d0bd  04 c9		 tsb $c9
$0b:d0bf  48			pha
$0b:d0c0  2d b8 9d	  and $9db8
$0b:d0c3  5e ca ad	  lsr $adca,x
$0b:d0c6  7e 70 05	  ror $0570,x
$0b:d0c9  43 ff		 eor $ff,s
$0b:d0cb  f4 ff fe	  pea $feff
$0b:d0ce  ff ec 60 fb   sbc $fb60ec,x
$0b:d0d2  7f eb bf fc   adc $fcbfeb,x
$0b:d0d6  0f fe 07 80   ora $8007fe
$0b:d0da  d2 73		 cmp ($73)
$0b:d0dc  6c 77 6d	  jmp ($6d77)
$0b:d0df  ae e3 a9	  ldx $a9e3
$0b:d0e2  76 d5		 ror $d5,x
$0b:d0e4  eb			xba
$0b:d0e5  e8			inx
$0b:d0e6  b7 eb		 lda [$eb],y
$0b:d0e8  ce c6 0f	  dec $0fc6
$0b:d0eb  fe 81 b3	  inc $b381,x
$0b:d0ee  06 87		 asl $87
$0b:d0f0  ff c4 b0 05   sbc $05b0c4,x
$0b:d0f4  9a			txs
$0b:d0f5  10 2f		 bpl $d126
$0b:d0f7  f4 2b ab	  pea $ab2b
$0b:d0fa  85 95		 sta $95
$0b:d0fc  56 a4		 lsr $a4,x
$0b:d0fe  bb			tyx
$0b:d0ff  9c 35 33	  stz $3335
$0b:d102  a7 97		 lda [$97]
$0b:d104  b0 4a		 bcs $d150
$0b:d106  f9 13 19	  sbc $1913,y
$0b:d109  17 f2		 ora [$f2],y
$0b:d10b  01 fe		 ora ($fe,x)
$0b:d10d  10 0d		 bpl $d11c
$0b:d10f  fe 01 bd	  inc $bd01,x
$0b:d112  10 04		 bpl $d118
$0b:d114  13 ef		 ora ($ef,s),y
$0b:d116  00 ef		 brk #$ef
$0b:d118  c4 21		 cpy $21
$0b:d11a  9b			txy
$0b:d11b  09 2f		 ora #$2f
$0b:d11d  73 33		 adc ($33,s),y
$0b:d11f  6a			ror a
$0b:d120  b7 62		 lda [$62],y
$0b:d122  72 34		 adc ($34)
$0b:d124  0f ed 46 a5   ora $a546ed
$0b:d128  84 94		 sty $94
$0b:d12a  d2 81		 cmp ($81)
$0b:d12c  61 7b		 adc ($7b,x)
$0b:d12e  80 4d		 bra $d17d
$0b:d130  e0 1b		 cpx #$1b
$0b:d132  75 f8		 adc $f8,x
$0b:d134  44 35 d2	  mvp $d2,$35
$0b:d137  02 70		 cop #$70
$0b:d139  02 c2		 cop #$c2
$0b:d13b  33 bb		 and ($bb,s),y
$0b:d13d  da			phx
$0b:d13e  45 f7		 eor $f7
$0b:d140  51 d8		 eor ($d8),y
$0b:d142  9c f3 9b	  stz $9bf3
$0b:d145  29 d7		 and #$d7
$0b:d147  72 ae		 adc ($ae)
$0b:d149  75 9a		 adc $9a,x
$0b:d14b  fd 54 ce	  sbc $ce54,x
$0b:d14e  06 30		 asl $30
$0b:d150  01 08		 ora ($08,x)
$0b:d152  9c 3f f1	  stz $f13f
$0b:d155  1f fe 1b fd   ora $fd1bfe,x
$0b:d159  aa			tax
$0b:d15a  dc 53 a7	  jml [$a753]
$0b:d15d  75 99		 adc $99,x
$0b:d15f  d5 92		 cmp $92,x
$0b:d161  2f 16 9f c2   and $c29f16
$0b:d165  f7 5d		 sbc [$5d],y
$0b:d167  0c fd 56	  tsb $56fd
$0b:d16a  ef dd 84 8f   sbc $8f84dd
$0b:d16e  c0 7e		 cpy #$7e
$0b:d170  83 f0		 sta $f0,s
$0b:d172  5f 86 21 90   eor $902186,x
$0b:d176  17 6f		 ora [$6f],y
$0b:d178  cc 8a d7	  cpy $d78a
$0b:d17b  8f c8 47 b4   sta $b447c8
$0b:d17f  13 aa		 ora ($aa,s),y
$0b:d181  cd 9f 69	  cmp $699f
$0b:d184  4f b5 c6 3c   eor $3cc6b5
$0b:d188  59 f7 f8	  eor $f8f7,y
$0b:d18b  7c 20 7e	  jmp ($7e20,x)
$0b:d18e  18			clc
$0b:d18f  3f 06 1f 80   and $801f06,x
$0b:d193  43 04		 eor $04,s
$0b:d195  7f 09 3f 80   adc $803f09,x
$0b:d199  4f fb 7e 09   eor $097efb
$0b:d19d  ad cb 9d	  lda $9dcb
$0b:d1a0  49 df		 eor #$df
$0b:d1a2  7b			tdc
$0b:d1a3  6a			ror a
$0b:d1a4  3e 49 3e	  rol $3e49,x
$0b:d1a7  bb			tyx
$0b:d1a8  b5 96		 lda $96,x
$0b:d1aa  aa			tax
$0b:d1ab  d5 63		 cmp $63,x
$0b:d1ad  fc 0c 7f	  jsr ($7f0c,x)
$0b:d1b0  c3 6f		 cmp $6f,s
$0b:d1b2  f8			sed
$0b:d1b3  89 fe		 bit #$fe
$0b:d1b5  23 7f		 and $7f,s
$0b:d1b7  ca			dex
$0b:d1b8  cf fa d3 fe   cmp $fed3fa
$0b:d1bc  f5 7f		 sbc $7f,x
$0b:d1be  ec 9a 3d	  cpx $3d9a
$0b:d1c1  d4 46		 pei ($46)
$0b:d1c3  83 24		 sta $24,s
$0b:d1c5  db			stp
$0b:d1c6  60			rts
$0b:d1c7  29 bd		 and #$bd
$0b:d1c9  4c b5 8a	  jmp $8ab5
$0b:d1cc  54 fc 1e	  mvn $1e,$fc
$0b:d1cf  fc 03 de	  jsr ($de03,x)
$0b:d1d2  02 3d		 cop #$3d
$0b:d1d4  dc 03 fa	  jml [$fa03]
$0b:d1d7  0a			asl a
$0b:d1d8  3e f5 1a	  rol $1af5,x
$0b:d1db  cb			wai
$0b:d1dc  94 8c		 sty $8c,x
$0b:d1de  fa			plx
$0b:d1df  b5 d4		 lda $d4,x
$0b:d1e1  9a			txs
$0b:d1e2  8c 02 fb	  sty $fb02
$0b:d1e5  51 e9		 eor ($e9),y
$0b:d1e7  41 03		 eor ($03,x)
$0b:d1e9  a1 b9		 lda ($b9,x)
$0b:d1eb  80 7e		 bra $d26b
$0b:d1ed  e0 00		 cpx #$00
$0b:d1ef  b0 05		 bcs $d1f6
$0b:d1f1  80 9d		 bra $d190
$0b:d1f3  b5 f8		 lda $f8,x
$0b:d1f5  08			php
$0b:d1f6  cf 0b ed 49   cmp $49ed0b
$0b:d1fa  a7 61		 lda [$61]
$0b:d1fc  6f 7e 0c 3d   adc $3d0c7e
$0b:d200  23 95		 and $95,s
$0b:d202  5c 9e e0 98   jml $98e09e
$0b:d206  a0 8c		 ldy #$8c
$0b:d208  16 20		 asl $20,x
$0b:d20a  c7 c0		 cmp [$c0]
$0b:d20c  0b			phd
$0b:d20d  fa			plx
$0b:d20e  91 52		 sta ($52),y
$0b:d210  37 bd		 and [$bd],y
$0b:d212  38			sec
$0b:d213  7e b2 b5	  ror $b5b2,x
$0b:d216  59 b2 f9	  eor $f9b2,y
$0b:d219  a3 b3		 lda $b3,s
$0b:d21b  0c 76 b6	  tsb $b676
$0b:d21e  81 fd		 sta ($fd,x)
$0b:d220  80 7f		 bra $d2a1
$0b:d222  84 02		 sty $02
$0b:d224  c3 01		 cmp $01,s
$0b:d226  0a			asl a
$0b:d227  30 c2		 bmi $d1eb
$0b:d229  43 95		 eor $95,s
$0b:d22b  85 70		 sta $70
$0b:d22d  f8			sed
$0b:d22e  ba			tsx
$0b:d22f  aa			tax
$0b:d230  a4 36		 ldy $36
$0b:d232  95 5e		 sta $5e,x
$0b:d234  cb			wai
$0b:d235  ec b5 da	  cpx $dab5
$0b:d238  da			phx
$0b:d239  a5 62		 lda $62
$0b:d23b  04 2b		 tsb $2b
$0b:d23d  2f fe 00 88   and $8800fe
$0b:d241  34 cb		 bit $cb,x
$0b:d243  fd 42 ff	  sbc $ff42,x
$0b:d246  a0 9f		 ldy #$9f
$0b:d248  c6 26		 dec $26
$0b:d24a  52 58		 eor ($58)
$0b:d24c  25 7a		 and $7a
$0b:d24e  6b			rtl
$0b:d24f  31 9b		 and ($9b),y
$0b:d251  f3 65		 sbc ($65,s),y
$0b:d253  d2 2b		 cmp ($2b)
$0b:d255  ad 2e b9	  lda $b92e
$0b:d258  b4 ad		 ldy $ad,x
$0b:d25a  43 3f		 eor $3f,s
$0b:d25c  f1 8f		 sbc ($8f),y
$0b:d25e  fc 20 c4	  jsr ($c420,x)
$0b:d261  31 03		 and ($03),y
$0b:d263  10 ba		 bpl $d21f
$0b:d265  81 d4		 sta ($d4,x)
$0b:d267  1e 7a a5	  asl $a57a,x
$0b:d26a  67 09		 adc [$09]
$0b:d26c  84 eb		 sty $eb
$0b:d26e  5c ac 14 ce   jml $ce14ac
$0b:d272  3e ef d5	  rol $d5ef,x
$0b:d275  6c d4 54	  jmp ($54d4)
$0b:d278  ae f3 8f	  ldx $8ff3
$0b:d27b  f9 fc b3	  sbc $b3fc,y
$0b:d27e  88			dey
$0b:d27f  01 8a		 ora ($8a,x)
$0b:d281  7f e2 df f2   adc $f2dfe2,x
$0b:d285  f8			sed
$0b:d286  5e a5 da	  lsr $daa5,x
$0b:d289  dc 9d 53	  jml [$539d]
$0b:d28c  ef d2 cf 6f   sbc $6fcfd2
$0b:d290  25 12		 and $12
$0b:d292  bc 6e 33	  ldy $336e,x
$0b:d295  89 d3		 bit #$d3
$0b:d297  b9 70 7f	  lda $7f70,y
$0b:d29a  f4 01 58	  pea $5801
$0b:d29d  c8			iny
$0b:d29e  7f f5 3f f5   adc $f53ff5,x
$0b:d2a2  cb			wai
$0b:d2a3  fd 3b ff	  sbc $ff3b,x
$0b:d2a6  43 7f		 eor $7f,s
$0b:d2a8  d4 9b		 pei ($9b)
$0b:d2aa  67 87		 adc [$87]
$0b:d2ac  23 d2		 and $d2,s
$0b:d2ae  90 49		 bcc $d2f9
$0b:d2b0  28			plp
$0b:d2b1  15 98		 ora $98,x
$0b:d2b3  24 d6		 bit $d6
$0b:d2b5  01 2a		 ora ($2a,x)
$0b:d2b7  8a			txa
$0b:d2b8  57 25		 eor [$25],y
$0b:d2ba  59 31 68	  eor $6831,y
$0b:d2bd  30 2e		 bmi $d2ed
$0b:d2bf  53 63		 eor ($63,s),y
$0b:d2c1  a7 c6		 lda [$c6]
$0b:d2c3  26 14		 rol $14
$0b:d2c5  29 14		 and #$14
$0b:d2c7  42 93		 wdm #$93
$0b:d2c9  20 b8 42	  jsr $42b8
$0b:d2cc  2a			rol a
$0b:d2cd  b2 8b		 lda ($8b)
$0b:d2cf  65 61		 adc $61
$0b:d2d1  0a			asl a
$0b:d2d2  0c 1c d5	  tsb $d51c
$0b:d2d5  48			pha
$0b:d2d6  bb			tyx
$0b:d2d7  31 ba		 and ($ba),y
$0b:d2d9  fc 2b 4b	  jsr ($4b2b,x)
$0b:d2dc  16 d4		 asl $d4,x
$0b:d2de  48			pha
$0b:d2df  e2 b5		 sep #$b5
$0b:d2e1  4e 57 ee	  lsr $ee57
$0b:d2e4  4b			phk
$0b:d2e5  7f ee ff fc   adc $fcffee,x
$0b:d2e9  9f ff 87 ff   sta $ff87ff,x
$0b:d2ed  f1 ff		 sbc ($ff),y
$0b:d2ef  ee 7f f5	  inc $f57f
$0b:d2f2  5f f8 21 10   eor $1021f8,x
$0b:d2f6  74 b4		 stz $b4,x
$0b:d2f8  1b			tcs
$0b:d2f9  d4 d3		 pei ($d3)
$0b:d2fb  07 25		 ora [$25]
$0b:d2fd  bc 4c b4	  ldy $b44c,x
$0b:d300  ff 1a 8e 13   sbc $138e1a,x
$0b:d304  59 9a 89	  eor $899a,y
$0b:d307  e6 7f		 inc $7f
$0b:d309  df fe 7f ff   cmp $ff7ffe,x
$0b:d30d  bc 20 1a	  ldy $1a20,x
$0b:d310  77 fe		 adc [$fe],y
$0b:d312  df ff b3 ff   cmp $ffb3ff,x
$0b:d316  ec df fd	  cpx $fddf
$0b:d319  dd 13 55	  cmp $5513,x
$0b:d31c  bb			tyx
$0b:d31d  a6 d9		 ldx $d9
$0b:d31f  6b			rtl
$0b:d320  30 0d		 bmi $d32f
$0b:d322  27 12		 and [$12]
$0b:d324  39 08 e5	  and $e508,y
$0b:d327  d1 6a		 cmp ($6a),y
$0b:d329  51 08		 eor ($08),y
$0b:d32b  04 02		 tsb $02
$0b:d32d  89 00		 bit #$00
$0b:d32f  cd 32 c6	  cmp $c632
$0b:d332  f7 00		 sbc [$00],y
$0b:d334  fb			xce
$0b:d335  c0 37		 cpy #$37
$0b:d337  d0 0f		 bne $d348
$0b:d339  7c 02 a1	  jmp ($a102,x)
$0b:d33c  3f ab 6a 75   and $756aab,x
$0b:d340  33 2f		 and ($2f,s),y
$0b:d342  a5 0f		 lda $0f
$0b:d344  4d 43 a5	  eor $a543
$0b:d347  c4 6a		 cpy $6a
$0b:d349  1a			inc a
$0b:d34a  59 2f 21	  eor $212f,y
$0b:d34d  98			tya
$0b:d34e  17 f3		 ora [$f3],y
$0b:d350  00 cf		 brk #$cf
$0b:d352  f0 06		 beq $d35a
$0b:d354  50 97		 bvc $d2ed
$0b:d356  e0 21		 cpx #$21
$0b:d358  7c 08 1f	  jmp ($1f08,x)
$0b:d35b  42 b5		 wdm #$b5
$0b:d35d  d8			cld
$0b:d35e  d0 e3		 bne $d343
$0b:d360  67 d9		 adc [$d9]
$0b:d362  af 0e b6 35   lda $35b60e
$0b:d366  95 ba		 sta $ba,x
$0b:d368  d5 39		 cmp $39,x
$0b:d36a  59 39 be	  eor $be39,y
$0b:d36d  ba			tsx
$0b:d36e  4f ff b9 7f   eor $7fb9ff
$0b:d372  ec 3f fa	  cpx $fa3f
$0b:d375  97 fe		 sta [$fe],y
$0b:d377  c5 ff		 cmp $ff
$0b:d379  d1 7f		 cmp ($7f),y
$0b:d37b  ec 8a 01	  cpx $018a
$0b:d37e  ab			plb
$0b:d37f  51 f6		 eor ($f6),y
$0b:d381  bf fa 27 5a   lda $5a27fa,x
$0b:d385  b7 32		 lda [$32],y
$0b:d387  f5 4b		 sbc $4b,x
$0b:d389  aa			tax
$0b:d38a  97 ed		 sta [$ed],y
$0b:d38c  7d c6 b7	  adc $b7c6,x
$0b:d38f  a5 dc		 lda $dc
$0b:d391  33 06		 and ($06,s),y
$0b:d393  13 ff		 ora ($ff,s),y
$0b:d395  86 ff		 stx $ff
$0b:d397  e2 3f		 sep #$3f
$0b:d399  f8			sed
$0b:d39a  0b			phd
$0b:d39b  00 ec		 brk #$ec
$0b:d39d  54 2c b6	  mvn $b6,$2c
$0b:d3a0  7e a3 db	  ror $dba3,x
$0b:d3a3  8f 6c fc b7   sta $b7fc6c
$0b:d3a7  0c 17 5a	  tsb $5a17
$0b:d3aa  6b			rtl
$0b:d3ab  a6 e4		 ldx $e4
$0b:d3ad  59 b7 bf	  eor $bfb7,y
$0b:d3b0  fb			xce
$0b:d3b1  07 fe		 ora [$fe]
$0b:d3b3  40			rti
$0b:d3b4  8c 18 13	  sty $1318
$0b:d3b7  08			php
$0b:d3b8  dc 21 8e	  jml [$8e21]
$0b:d3bb  9b			txy
$0b:d3bc  75 64		 adc $64,x
$0b:d3be  16 ac		 asl $ac,x
$0b:d3c0  45 4b		 eor $4b
$0b:d3c2  03 25		 ora $25,s
$0b:d3c4  e0 7a		 cpx #$7a
$0b:d3c6  b2 16		 lda ($16)
$0b:d3c8  1e 44 6e	  asl $6e44,x
$0b:d3cb  cf f9 30 04   cmp $0430f9
$0b:d3cf  13 6e		 ora ($6e,s),y
$0b:d3d1  cd 08 82	  cmp $8208
$0b:d3d4  a8			tay
$0b:d3d5  e0 1f		 cpx #$1f
$0b:d3d7  c8			iny
$0b:d3d8  04 12		 tsb $12
$0b:d3da  49 b2		 eor #$b2
$0b:d3dc  80 4a		 bra $d428
$0b:d3de  64 15		 stz $15
$0b:d3e0  98			tya
$0b:d3e1  10 dc		 bpl $d3bf
$0b:d3e3  b9 34 1a	  lda $1a34,y
$0b:d3e6  8c 43 f6	  sty $f643
$0b:d3e9  44 1e f9	  mvp $f9,$1e
$0b:d3ec  12 60		 ora ($60)
$0b:d3ee  b2 59		 lda ($59)
$0b:d3f0  ae 07 d1	  ldx $d107
$0b:d3f3  20 d2 51	  jsr $51d2
$0b:d3f6  ab			plb
$0b:d3f7  36 0f		 rol $0f,x
$0b:d3f9  04 52		 tsb $52
$0b:d3fb  6b			rtl
$0b:d3fc  8b			phb
$0b:d3fd  d7 50		 cmp [$50],y
$0b:d3ff  3f 50 0f f0   and $f00f50,x
$0b:d403  08			php
$0b:d404  5f e4 a0 01   eor $01a0e4,x
$0b:d408  08			php
$0b:d409  28			plp
$0b:d40a  03 93		 ora $93,s
$0b:d40c  5c f2 69 af   jml $af69f2
$0b:d410  72 ab		 adc ($ab)
$0b:d412  66 37		 ror $37
$0b:d414  3b			tsc
$0b:d415  15 f7		 ora $f7,x
$0b:d417  44 a3 5e	  mvp $5e,$a3
$0b:d41a  2a			rol a
$0b:d41b  7c 3f 41	  jmp ($413f,x)
$0b:d41e  3f ac 47 fa   and $fa47ac,x
$0b:d422  90 7f		 bcc $d4a3
$0b:d424  94 0f		 sty $0f,x
$0b:d426  d5 03		 cmp $03,x
$0b:d428  fe c0 7f	  inc $7fc0,x
$0b:d42b  b0 0f		 bcs $d43c
$0b:d42d  84 02		 sty $02
$0b:d42f  b5 d4		 lda $d4,x
$0b:d431  d2 4f		 cmp ($4f)
$0b:d433  7b			tdc
$0b:d434  9e 98 25	  stz $2598,x
$0b:d437  b2 85		 lda ($85)
$0b:d439  d4 ce		 pei ($ce)
$0b:d43b  ec e9 54	  cpx $54e9
$0b:d43e  ed de c1	  sbc $c1de
$0b:d441  92 98		 sta ($98)
$0b:d443  06 11		 asl $11
$0b:d445  77 f6		 adc [$f6],y
$0b:d447  31 f1		 and ($f1),y
$0b:d449  e8			inx
$0b:d44a  6d 6c 34	  adc $346c
$0b:d44d  b8			clv
$0b:d44e  cc 12 59	  cpy $5912
$0b:d451  5f 8a ee 2d   eor $2dee8a,x
$0b:d455  bd 3f 9c	  lda $9c3f,x
$0b:d458  b2 c1		 lda ($c1)
$0b:d45a  a1 80		 lda ($80,x)
$0b:d45c  43 bf		 eor $bf,s
$0b:d45e  f2 6f		 sbc ($6f)
$0b:d460  fc 4f ff	  jsr ($ff4f,x)
$0b:d463  22 63 0c 33   jsl $330c63
$0b:d467  ff 9f ff ff   sbc $ffff9f,x
$0b:d46b  fc 36 fd	  jsr ($fd36,x)
$0b:d46e  7e 62 f1	  ror $f162,x
$0b:d471  27 c2		 and [$c2]
$0b:d473  f3 39		 sbc ($39,s),y
$0b:d475  96 9a		 stx $9a,y
$0b:d477  f6 db		 inc $db,x
$0b:d479  1f cf c0 43   ora $43c0cf,x
$0b:d47d  2e 11 0f	  rol $0f11
$0b:d480  d4 1f		 pei ($1f)
$0b:d482  fd 7a ff	  sbc $ff7a,x
$0b:d485  4c f0 1b	  jmp $1bf0
$0b:d488  fc 05 fd	  jsr ($fd05,x)
$0b:d48b  c0 00		 cpy #$00
$0b:d48d  01 bb		 ora ($bb,x)
$0b:d48f  46 e5		 lsr $e5
$0b:d491  71 c8		 adc ($c8),y
$0b:d493  ac b9 5e	  ldy $5eb9
$0b:d496  12 9b		 ora ($9b)
$0b:d498  e7 5a		 sbc [$5a]
$0b:d49a  69 a5		 adc #$a5
$0b:d49c  b7 d3		 lda [$d3],y
$0b:d49e  39 80 01	  and $0180,y
$0b:d4a1  73 9a		 adc ($9a,s),y
$0b:d4a3  1c 21 0e	  trb $0e21
$0b:d4a6  51 99		 eor ($99),y
$0b:d4a8  ff e4 90 cc   sbc $cc90e4,x
$0b:d4ac  d4 f2		 pei ($f2)
$0b:d4ae  69 a6		 adc #$a6
$0b:d4b0  97 df		 sta [$df],y
$0b:d4b2  2a			rol a
$0b:d4b3  b3 ef		 lda ($ef,s),y
$0b:d4b5  45 3a		 eor $3a
$0b:d4b7  77 f8		 adc [$f8],y
$0b:d4b9  a2 d5		 ldx #$d5
$0b:d4bb  59 60 63	  eor $6360,y
$0b:d4be  06 48		 asl $48
$0b:d4c0  30 c9		 bmi $d48b
$0b:d4c2  96 10		 stx $10,y
$0b:d4c4  4f fe ab ff   eor $ffabfe
$0b:d4c8  4f ed 6a 35   eor $356aed
$0b:d4cc  75 38		 adc $38,x
$0b:d4ce  2e ea 05	  rol $05ea
$0b:d4d1  a5 a0		 lda $a0
$0b:d4d3  e4 a2		 cpx $a2
$0b:d4d5  56 ba		 lsr $ba,x
$0b:d4d7  6e de 70	  ror $70de
$0b:d4da  5f 0a a7 ff   eor $ffa70a,x
$0b:d4de  f5 ff		 sbc $ff,x
$0b:d4e0  fe ff ff	  inc $ffff,x
$0b:d4e3  df ff 69 90   cmp $9069ff,x
$0b:d4e7  78			sei
$0b:d4e8  1f f9 2d c7   ora $c72df9,x
$0b:d4ec  b5 99		 lda $99,x
$0b:d4ee  82 6b 33	  brl $085c
$0b:d4f1  ff 5d cc b7   sbc $b7cc5d,x
$0b:d4f5  db			stp
$0b:d4f6  eb			xba
$0b:d4f7  dd 67 6e	  cmp $6e67,x
$0b:d4fa  92 2c		 sta ($2c)
$0b:d4fc  72 00		 adc ($00)
$0b:d4fe  d0 e1		 bne $d4e1
$0b:d500  c2 65		 rep #$65
$0b:d502  09 84 20	  ora #$2084
$0b:d505  3f f9 c5 ba   and $bac5f9,x
$0b:d509  db			stp
$0b:d50a  17 aa		 ora [$aa],y
$0b:d50c  7d 7a b1	  adc $b17a,x
$0b:d50f  b9 f6 ae	  lda $aef6,y
$0b:d512  51 8d		 eor ($8d),y
$0b:d514  c9 f2 3a	  cmp #$3af2
$0b:d517  d7 7c		 cmp [$7c],y
$0b:d519  0c ff 01	  tsb $01ff
$0b:d51c  3f 81 5f e4   and $e45f81,x
$0b:d520  17 fa		 ora [$fa],y
$0b:d522  87 fe		 sta [$fe]
$0b:d524  e1 ff		 sbc ($ff,x)
$0b:d526  9a			txs
$0b:d527  32 07		 and ($07)
$0b:d529  c1 96		 cmp ($96,x)
$0b:d52b  a5 68		 lda $68
$0b:d52d  38			sec
$0b:d52e  96 ba		 stx $ba,y
$0b:d530  ae 33 07	  ldx $0733
$0b:d533  56 d5		 lsr $d5,x
$0b:d535  c6 a6		 dec $a6
$0b:d537  d2 5c		 cmp ($5c)
$0b:d539  a5 ea		 lda $ea
$0b:d53b  03 fc		 ora $fc,s
$0b:d53d  2f 84 03 fc   and $fc0384
$0b:d541  63 06		 adc $06,s
$0b:d543  48			pha
$0b:d544  3a			dec a
$0b:d545  c1 c6		 cmp ($c6,x)
$0b:d547  55 be		 eor $be,x
$0b:d549  ae 92 7b	  ldx $7b92
$0b:d54c  dd f4 41	  cmp $41f4,x
$0b:d54f  b5 36		 lda $36,x
$0b:d551  2e b5 23	  rol $23b5
$0b:d554  3f a2 8d f0   and $f08da2,x
$0b:d558  30 8f		 bmi $d4e9
$0b:d55a  f0 15		 beq $d571
$0b:d55c  83 9c		 sta $9c,s
$0b:d55e  05 64		 ora $64
$0b:d560  e7 04		 sbc [$04]
$0b:d562  49 43 6a	  eor #$6a43
$0b:d565  de a9 fc	  dec $fca9,x
$0b:d568  d7 2b		 cmp [$2b],y
$0b:d56a  a2 f1		 ldx #$f1
$0b:d56c  56 bb		 lsr $bb,x
$0b:d56e  1b			tcs
$0b:d56f  6f f4 87 27   adc $2787f4
$0b:d573  12 87		 ora ($87)
$0b:d575  22 4a 95 ff   jsl $ff954a
$0b:d579  8e ff e4	  stx $e4ff
$0b:d57c  e8			inx
$0b:d57d  63 16		 adc $16,s
$0b:d57f  86 92		 stx $92
$0b:d581  e3 59		 sbc $59,s
$0b:d583  b2 48		 lda ($48)
$0b:d585  39 1e 9a	  and $9a1e,y
$0b:d588  06 56		 asl $56
$0b:d58a  87 97		 sta [$97]
$0b:d58c  84 46		 sty $46
$0b:d58e  60			rts
$0b:d58f  50 4c		 bvc $d5dd
$0b:d591  02 25		 cop #$25
$0b:d593  17 f1		 ora [$f1],y
$0b:d595  de a3 59	  dec $59a3,x
$0b:d598  72 99		 adc ($99)
$0b:d59a  9b			txy
$0b:d59b  55 3b		 eor $3b,x
$0b:d59d  53 91		 eor ($91,s),y
$0b:d59f  b0 65		 bcs $d606
$0b:d5a1  63 32		 adc $32,s
$0b:d5a3  ee 27 5e	  inc $5e27
$0b:d5a6  c5 b9		 cmp $b9
$0b:d5a8  80 5e		 bra $d608
$0b:d5aa  e0 13		 cpx #$13
$0b:d5ac  78			sei
$0b:d5ad  06 5d		 asl $5d
$0b:d5af  12 3e		 ora ($3e)
$0b:d5b1  e4 49		 cpx $49
$0b:d5b3  e8			inx
$0b:d5b4  a7 75		 lda [$75]
$0b:d5b6  53 80		 eor ($80,s),y
$0b:d5b8  60			rts
$0b:d5b9  6a			ror a
$0b:d5ba  d4 bd		 pei ($bd)
$0b:d5bc  c6 4e		 dec $4e
$0b:d5be  95 b3		 sta $b3,x
$0b:d5c0  da			phx
$0b:d5c1  eb			xba
$0b:d5c2  36 da		 rol $da,x
$0b:d5c4  3a			dec a
$0b:d5c5  27 fe		 and [$fe]
$0b:d5c7  55 ff		 eor $ff,x
$0b:d5c9  bf 7f f7 9f   lda $9ff77f,x
$0b:d5cd  fb			xce
$0b:d5ce  e0 18		 cpx #$18
$0b:d5d0  6f 40 61 a5   adc $a56140
$0b:d5d4  55 b7		 eor $b7,x
$0b:d5d6  da			phx
$0b:d5d7  1a			inc a
$0b:d5d8  8d 92 d1	  sta $d192
$0b:d5db  44 d6 71	  mvp $71,$d6
$0b:d5de  38			sec
$0b:d5df  18			clc
$0b:d5e0  ca			dex
$0b:d5e1  e6 13		 inc $13
$0b:d5e3  5d 04 d0	  eor $d004,x
$0b:d5e6  c0 28		 cpy #$28
$0b:d5e8  10 cc		 bpl $d5b6
$0b:d5ea  04 7b		 tsb $7b
$0b:d5ec  01 1f		 ora ($1f,x)
$0b:d5ee  80 4f		 bra $d63f
$0b:d5f0  c4 e3		 cpy $e3
$0b:d5f2  7f 15 86 ae   adc $ae8615,x
$0b:d5f6  df 54 a8 6a   cmp $6aa854,x
$0b:d5fa  30 f5		 bmi $d5f1
$0b:d5fc  7e 45 23	  ror $2345,x
$0b:d5ff  a1 63		 lda ($63,x)
$0b:d601  a1 65		 lda ($65,x)
$0b:d603  73 b4		 adc ($b4,s),y
$0b:d605  2f ec 43 ff   and $ff43ec
$0b:d609  af ff df ff   lda $ffdfff
$0b:d60d  f3 f2		 sbc ($f2,s),y
$0b:d60f  20 ef 7f	  jsr $7fef
$0b:d612  f6 23		 inc $23,x
$0b:d614  60			rts
$0b:d615  d2 ef		 cmp ($ef)
$0b:d617  9c fc 7c	  stz $7cfc
$0b:d61a  b3 a1		 lda ($a1,s),y
$0b:d61c  85 82		 sta $82
$0b:d61e  cd 64 f6	  cmp $f664
$0b:d621  0b			phd
$0b:d622  f4 3f e4	  pea $e43f
$0b:d625  4c 0c 07	  jmp $070c
$0b:d628  fe e1 ff	  inc $ffe1,x
$0b:d62b  31 07		 and ($07),y
$0b:d62d  eb			xba
$0b:d62e  ff d8 ff e0   sbc $e0ffd8,x
$0b:d632  51 07		 eor ($07),y
$0b:d634  fc 81 60	  jsr ($6081,x)
$0b:d637  bf bd 38 17   lda $1738bd,x
$0b:d63b  67 bf		 adc [$bf]
$0b:d63d  4e f8 fd	  lsr $fdf8
$0b:d640  31 59		 and ($59),y
$0b:d642  5b			tcd
$0b:d643  65 5b		 adc $5b
$0b:d645  61 01		 adc ($01,x)
$0b:d647  fc 40 3f	  jsr ($3f40,x)
$0b:d64a  9f cf f4 80   sta $80f4cf,x
$0b:d64e  98			tya
$0b:d64f  1f c3 f8 40   ora $40f8c3,x
$0b:d653  fc 10 fc	  jsr ($fc10,x)
$0b:d656  05 b6		 ora $b6
$0b:d658  e5 9a		 sbc $9a
$0b:d65a  d2 4c		 cmp ($4c)
$0b:d65c  28			plp
$0b:d65d  34 dc		 bit $dc,x
$0b:d65f  17 92		 ora [$92],y
$0b:d661  3f b4 ba 5f   and $5fbab4,x
$0b:d665  b0 32		 bcs $d699
$0b:d667  0a			asl a
$0b:d668  86 02		 stx $02
$0b:d66a  0f 40 46 80   ora $804640
$0b:d66e  98			tya
$0b:d66f  af f0 b1 60   lda $60b1f0
$0b:d673  4f c4 a1 39   eor $39a1c4
$0b:d677  e2 73		 sep #$73
$0b:d679  a6 c7		 ldx $c7
$0b:d67b  90 3b		 bcc $d6b8
$0b:d67d  81 d4		 sta ($d4,x)
$0b:d67f  0e 60 71	  asl $7160
$0b:d682  0f a4 29 16   ora $1629a4
$0b:d686  10 1f		 bpl $d6a7
$0b:d688  81 fc		 sta ($fc,x)
$0b:d68a  90 a0		 bcc $d62c
$0b:d68c  83 04		 sta $04,s
$0b:d68e  39 4b ff	  and $ff4b,y
$0b:d691  59 db d5	  eor $d5db,y
$0b:d694  87 25		 sta [$25]
$0b:d696  4d 9d 5a	  eor $5a9d
$0b:d699  f3 19		 sbc ($19,s),y
$0b:d69b  5a			phy
$0b:d69c  77 3b		 adc [$3b],y
$0b:d69e  9f d9 bf 41   sta $41bfd9,x
$0b:d6a2  3f f8 4f ff   and $ff4ff8,x
$0b:d6a6  33 ff		 and ($ff,s),y
$0b:d6a8  c4 ff		 cpy $ff
$0b:d6aa  f9 3f ff	  sbc $ff3f,y
$0b:d6ad  1f fc c0 98   ora $98c0fc,x
$0b:d6b1  3f 5a f6 e2   and $e2f65a,x
$0b:d6b5  bd 85 a4	  lda $a485,x
$0b:d6b8  6c 6b bd	  jmp ($bd6b)
$0b:d6bb  18			clc
$0b:d6bc  c4 9a		 cpy $9a
$0b:d6be  e9 ac		 sbc #$ac
$0b:d6c0  bf d9 23 48   lda $4823d9,x
$0b:d6c4  50 90		 bvc $d656
$0b:d6c6  ff e6 7f f9   sbc $f97fe6,x
$0b:d6ca  17 fe		 ora [$fe],y
$0b:d6cc  4f ff c5 9a   eor $9ac5ff
$0b:d6d0  8e 81 60	  stx $6081
$0b:d6d3  ff 60 74 96   sbc $967460,x
$0b:d6d7  4b			phk
$0b:d6d8  24 7e		 bit $7e
$0b:d6da  9b			txy
$0b:d6db  02 99		 cop #$99
$0b:d6dd  40			rti
$0b:d6de  64 91		 stz $91
$0b:d6e0  8a			txa
$0b:d6e1  dc 90 be	  jml [$be90]
$0b:d6e4  06 b0		 asl $b0
$0b:d6e6  8d 9a 8c	  sta $8c9a
$0b:d6e9  4a			lsr a
$0b:d6ea  92 2d		 sta ($2d)
$0b:d6ec  dd e6 9d	  cmp $9de6,x
$0b:d6ef  cd d2 e5	  cmp $e5d2
$0b:d6f2  e4 53		 cpx $53
$0b:d6f4  39 04 02	  and $0204,y
$0b:d6f7  63 39		 adc $39,s
$0b:d6f9  90 5d		 bcc $d758
$0b:d6fb  24 14		 bit $14
$0b:d6fd  4f f9 7c 20   eor $207cf9
$0b:d701  42 49		 wdm #$49
$0b:d703  c9 db		 cmp #$db
$0b:d705  3f f7 2d 96   and $962df7,x
$0b:d709  92 d3		 sta ($d3)
$0b:d70b  c4 e6		 cpy $e6
$0b:d70d  41 20		 eor ($20,x)
$0b:d70f  18			clc
$0b:d710  cc e4 12	  cpy $12e4
$0b:d713  5d 04 81	  eor $8104,x
$0b:d716  84 43		 sty $43
$0b:d718  ff 41 12 4c   sbc $4c1241,x
$0b:d71c  b3 c7		 lda ($c7,s),y
$0b:d71e  92 00		 sta ($00)
$0b:d720  07 7e		 ora [$7e]
$0b:d722  25 ed		 and $ed
$0b:d724  ea			nop
$0b:d725  ca			dex
$0b:d726  a5 55		 lda $55
$0b:d728  1e 3e da	  asl $da3e,x
$0b:d72b  95 48		 sta $48,x
$0b:d72d  06 07		 asl $07
$0b:d72f  7e 01 f7	  ror $f701,x
$0b:d732  80 61		 bra $d795
$0b:d734  20 18 e4	  jsr $e418
$0b:d737  00 de		 brk #$de
$0b:d739  60			rts
$0b:d73a  1b			tcs
$0b:d73b  7c 37 ef	  jmp ($ef37,x)
$0b:d73e  bf 4d a6 ed   lda $eda64d,x
$0b:d742  be da dd	  ldx $ddda,y
$0b:d745  ef 4e bb 1c   sbc $1cbb4e
$0b:d749  fb			xce
$0b:d74a  f2 77		 sbc ($77)
$0b:d74c  d5 1f		 cmp $1f,x
$0b:d74e  78			sei
$0b:d74f  e0 36		 cpx #$36
$0b:d751  50 08		 bvc $d75b
$0b:d753  4c 02 85	  jmp $8502
$0b:d756  00 1c		 brk #$1c
$0b:d758  02 a1		 cop #$a1
$0b:d75a  3a			dec a
$0b:d75b  75 0c		 adc $0c,x
$0b:d75d  dc 27 f5	  jml [$f527]
$0b:d760  41 a4		 eor ($a4,x)
$0b:d762  44 72 b8	  mvp $b8,$72
$0b:d765  cb			wai
$0b:d766  9c ab d5	  stz $d5ab
$0b:d769  00 df		 brk #$df
$0b:d76b  55 35		 eor $35,x
$0b:d76d  e8			inx
$0b:d76e  21 d7		 and ($d7,x)
$0b:d770  03 46		 ora $46,s
$0b:d772  f7 00		 sbc [$00],y
$0b:d774  ee 92 c2	  inc $c292
$0b:d777  05 eb		 ora $eb
$0b:d779  80 6e		 bra $d7e9
$0b:d77b  f5 17		 sbc $17,x
$0b:d77d  ba			tsx
$0b:d77e  57 ee		 eor [$ee],y
$0b:d780  85 7f		 sta $7f
$0b:d782  aa			tax
$0b:d783  53 e1		 eor ($e1,s),y
$0b:d785  5c 7c 87 de   jml $de877c
$0b:d789  41 e7		 eor ($e7,x)
$0b:d78b  d2 d5		 cmp ($d5)
$0b:d78d  e2 7b		 sep #$7b
$0b:d78f  59 8e f6	  eor $f68e,y
$0b:d792  73 ab		 adc ($ab,s),y
$0b:d794  95 fd		 sta $fd,x
$0b:d796  68			pla
$0b:d797  b7 fa		 lda [$fa],y
$0b:d799  3f 7f 8f 5a   and $5a8f7f,x
$0b:d79d  a1 54		 lda ($54,x)
$0b:d79f  ed 5e cd	  sbc $cd5e
$0b:d7a2  3c d7 49	  bit $49d7,x
$0b:d7a5  0d d5 78	  ora $78d5
$0b:d7a8  b9 38 ba	  lda $ba38,y
$0b:d7ab  97 b6		 sta [$b6],y
$0b:d7ad  ef a6 bb 6f   sbc $6fbba6
$0b:d7b1  3f f7 8f fd   and $fd8ff7,x
$0b:d7b5  eb			xba
$0b:d7b6  ff 74 ff cf   sbc $cfff74,x
$0b:d7ba  00 c3		 brk #$c3
$0b:d7bc  18			clc
$0b:d7bd  ff c6 7f f1   sbc $f17fc6,x
$0b:d7c1  a9 25		 lda #$25
$0b:d7c3  0a			asl a
$0b:d7c4  19 1e 82	  ora $821e,y
$0b:d7c7  41 e3		 eor ($e3,x)
$0b:d7c9  91 08		 sta ($08),y
$0b:d7cb  d4 d2		 pei ($d2)
$0b:d7cd  1d 23 8d	  ora $8d23,x
$0b:d7d0  42 a7		 wdm #$a7
$0b:d7d2  24 76		 bit $76
$0b:d7d4  82 09 0c	  brl $e3e0
$0b:d7d7  4e 12 0a	  lsr $0a12
$0b:d7da  05 fb		 ora $fb
$0b:d7dc  03 b4		 ora $b4,s
$0b:d7de  ba			tsx
$0b:d7df  59 33 f4	  eor $f433,y
$0b:d7e2  dc 14 c2	  jml [$c214]
$0b:d7e5  83 ae		 sta $ae,s
$0b:d7e7  98			tya
$0b:d7e8  5a			phy
$0b:d7e9  e1 98		 sbc ($98,x)
$0b:d7eb  08			php
$0b:d7ec  fc 02 7f	  jsr ($7f02,x)
$0b:d7ef  0b			phd
$0b:d7f0  bf 9a c6 7e   lda $7ec69a,x
$0b:d7f4  3f 0e 04 1f   and $1f040e,x
$0b:d7f8  e1 01		 sbc ($01,x)
$0b:d7fa  96 c4		 stx $c4,y
$0b:d7fc  e1 9f		 sbc ($9f,x)
$0b:d7fe  de 5f 02	  dec $025f,x
$0b:d801  bd fe a9	  lda $a9fe,x
$0b:d804  ed ff 38	  sbc $38ff
$0b:d807  78			sei
$0b:d808  7d 01 50	  adc $5001,x
$0b:d80b  2c b0 ff	  bit $ffb0
$0b:d80e  cf ff f0 1f   cmp $1ff0ff
$0b:d812  fc 20 40	  jsr ($4020,x)
$0b:d815  b2 ae		 lda ($ae)
$0b:d817  e7 57		 sbc [$57]
$0b:d819  bf ea 85 c5   lda $c585ea,x
$0b:d81d  60			rts
$0b:d81e  de df 34	  dec $34df,x
$0b:d821  e6 f7		 inc $f7
$0b:d823  56 f7		 lsr $f7,x
$0b:d825  ef 60 42 90   sbc $904260
$0b:d829  90 7f		 bcc $d8aa
$0b:d82b  fe 9f ff	  inc $ff9f,x
$0b:d82e  c0 28		 cpy #$28
$0b:d830  70 82		 bvs $d7b4
$0b:d832  03 90		 ora $90,s
$0b:d834  70 06		 bvs $d83c
$0b:d836  21 a4		 and ($a4,x)
$0b:d838  b2 0d		 lda ($0d)
$0b:d83a  4b			phk
$0b:d83b  65 c1		 adc $c1
$0b:d83d  aa			tax
$0b:d83e  5a			phy
$0b:d83f  33 7a		 and ($7a,s),y
$0b:d841  48			pha
$0b:d842  01 00		 ora ($00,x)
$0b:d844  63 64		 adc $64,s
$0b:d846  40			rti
$0b:d847  22 04 fd 3e   jsl $3efd04
$0b:d84b  18			clc
$0b:d84c  02 d8		 cop #$d8
$0b:d84e  43 cc		 eor $cc,s
$0b:d850  81 82		 sta ($82,x)
$0b:d852  fe f6 e0	  inc $e0f6,x
$0b:d855  55 aa		 eor $aa,x
$0b:d857  ed 7b e3	  sbc $e37b
$0b:d85a  74 a5		 stz $a5,x
$0b:d85c  62 6e 95	  per $6dcd
$0b:d85f  6f 64 03 f1   adc $f10364
$0b:d863  00 fe		 brk #$fe
$0b:d865  7f 3f da 01   adc $01da3f,x
$0b:d869  40			rti
$0b:d86a  7f 30 3f 88   adc $883f30,x
$0b:d86e  1f c2 07 e0   ora $e007c2,x
$0b:d872  97 fe		 sta [$fe],y
$0b:d874  b3 bf		 lda ($bf,s),y
$0b:d876  ab			plb
$0b:d877  0d 4b 1b	  ora $1b4b
$0b:d87a  ba			tsx
$0b:d87b  e5 de		 sbc $de
$0b:d87d  34 ba		 bit $ba,x
$0b:d87f  fa			plx
$0b:d880  2d fa f3	  and $f3fa
$0b:d883  b1 15		 lda ($15),y
$0b:d885  96 33		 stx $33,y
$0b:d887  ff 44 44 0d   sbc $0d4444,x
$0b:d88b  43 ff		 eor $ff,s
$0b:d88d  81 30		 sta ($30,x)
$0b:d88f  07 fb		 ora [$fb]
$0b:d891  eb			xba
$0b:d892  5e dc 57	  lsr $57dc,x
$0b:d895  f0 b4		 beq $d84b
$0b:d897  bd 95 7f	  lda $7f95,x
$0b:d89a  a9 1a		 lda #$1a
$0b:d89c  95 7f		 sta $7f,x
$0b:d89e  ef b2 3e 0d   sbc $0d3eb2
$0b:d8a2  31 02		 and ($02),y
$0b:d8a4  08			php
$0b:d8a5  10 98		 bpl $d83f
$0b:d8a7  20 06 42	  jsr $4206
$0b:d8aa  28			plp
$0b:d8ab  1c 00 28	  trb $2800
$0b:d8ae  6e af 80	  ror $80af
$0b:d8b1  8a			txa
$0b:d8b2  44 24 34	  mvp $34,$24
$0b:d8b5  d8			cld
$0b:d8b6  15 92		 ora $92,x
$0b:d8b8  3e 33 09	  rol $0933,x
$0b:d8bb  f5 07		 sbc $07,x
$0b:d8bd  81 10		 sta ($10,x)
$0b:d8bf  34 a1		 bit $a1,x
$0b:d8c1  a4 a1		 ldy $a1
$0b:d8c3  68			pla
$0b:d8c4  c2 ff		 rep #$ff
$0b:d8c6  d4 60		 pei ($60)
$0b:d8c8  1a			inc a
$0b:d8c9  4a			lsr a
$0b:d8ca  0c ca 09	  tsb $09ca
$0b:d8cd  29 c2 73	  and #$73c2
$0b:d8d0  60			rts
$0b:d8d1  92 0c		 sta ($0c)
$0b:d8d3  67 72		 adc [$72]
$0b:d8d5  49 2a bc	  eor #$bc2a
$0b:d8d8  07 e0		 ora [$e0]
$0b:d8da  d2 4e		 cmp ($4e)
$0b:d8dc  10 a2		 bpl $d880
$0b:d8de  40			rti
$0b:d8df  26 30		 rol $30
$0b:d8e1  48			pha
$0b:d8e2  64 82		 stz $82
$0b:d8e4  ab			plb
$0b:d8e5  20 99 c8	  jsr $c899
$0b:d8e8  30 13		 bmi $d8fd
$0b:d8ea  19 cc 82	  ora $82cc,y
$0b:d8ed  e9 20 1f	  sbc #$1f20
$0b:d8f0  e2 2c		 sep #$2c
$0b:d8f2  34 95		 bit $95,x
$0b:d8f4  3d 17 fe	  and $fe17,x
$0b:d8f7  99 fb c9	  sta $c9fb,y
$0b:d8fa  df 2d b9 2d   cmp $2db92d,x
$0b:d8fe  d5 06		 cmp $06,x
$0b:d900  8b			phb
$0b:d901  34 d7		 bit $d7,x
$0b:d903  62 84 85	  per $5e8a
$0b:d906  5e 80 45	  lsr $4580,x
$0b:d909  20 19 68	  jsr $6819
$0b:d90c  07 3e		 ora [$3e]
$0b:d90e  01 fb		 ora ($fb,x)
$0b:d910  80 5d		 bra $d96f
$0b:d912  60			rts
$0b:d913  98			tya
$0b:d914  6a			ror a
$0b:d915  ed 27 6d	  sbc $6d27
$0b:d918  d6 94		 dec $94,x
$0b:d91a  eb			xba
$0b:d91b  2a			rol a
$0b:d91c  67 70		 adc [$70]
$0b:d91e  ce 58 e6	  dec $e658
$0b:d921  d8			cld
$0b:d922  89 54		 bit #$54
$0b:d924  02 41		 cop #$41
$0b:d926  00 50		 brk #$50
$0b:d928  0a			asl a
$0b:d929  7c 20 28	  jmp ($2820,x)
$0b:d92c  61 f5		 adc ($f5,x)
$0b:d92e  c0 04 83	  cpy #$8304
$0b:d931  51 91		 eor ($91),y
$0b:d933  5e e5 14	  lsr $14e5,x
$0b:d936  29 8d		 and #$8d
$0b:d938  be 21 bd	  ldx $bd21,y
$0b:d93b  c2 68		 rep #$68
$0b:d93d  a2 17 da	  ldx #$da17
$0b:d940  1e ba 10	  asl $10ba,x
$0b:d943  24 0f		 bit $0f
$0b:d945  b2 ac		 lda ($ac)
$0b:d947  7d f0 4b	  adc $4bf0,x
$0b:d94a  5a			phy
$0b:d94b  ac 30 1b	  ldy $1b30
$0b:d94e  e8			inx
$0b:d94f  47 de		 eor [$de]
$0b:d951  01 6f		 ora ($6f,x)
$0b:d953  82 59 e8	  brl $c1af
$0b:d956  1f 7e 97 f7   ora $f7977e,x
$0b:d95a  51 9f		 eor ($9f),y
$0b:d95c  83 7e		 sta $7e,s
$0b:d95e  e4 5b		 cpx $5b
$0b:d960  fd 56 ce	  sbc $ce56,x
$0b:d963  01 fb		 ora ($fb,x)
$0b:d965  b1 ef		 lda ($ef),y
$0b:d967  e4 f2		 cpx $f2
$0b:d969  d9 2d 5e	  cmp $5e2d,y
$0b:d96c  ab			plb
$0b:d96d  f9 cc f7	  sbc $f7cc,y
$0b:d970  73 35		 adc ($35,s),y
$0b:d972  58			cli
$0b:d973  8f ff 67 55   sta $5567ff
$0b:d977  c2 6e		 rep #$6e
$0b:d979  3d be f9	  and $f9be,x
$0b:d97c  54 46 97	  mvn $97,$46
$0b:d97f  cb			wai
$0b:d980  f5 69		 sbc $69,x
$0b:d982  a9 b7 7c	  lda #$7cb7
$0b:d985  de 37 89	  dec $8937,x
$0b:d988  3a			dec a
$0b:d989  ff c5 bf f9   sbc $f9bfc5,x
$0b:d98d  4f fe d3 ff   eor $ffd3fe
$0b:d991  34 ff		 bit $ff,x
$0b:d993  cc 05 83	  cpy $8305
$0b:d996  32 ff		 and ($ff)
$0b:d998  da			phx
$0b:d999  67 52		 adc [$52]
$0b:d99b  9a			txs
$0b:d99c  d5 1a		 cmp $1a,x
$0b:d99e  65 15		 adc $15
$0b:d9a0  9b			txy
$0b:d9a1  52 9c		 eor ($9c)
$0b:d9a3  61 7e		 adc ($7e,x)
$0b:d9a5  dd 51 28	  cmp $2851,x
$0b:d9a8  92 22		 sta ($22)
$0b:d9aa  68			pla
$0b:d9ab  13 42		 ora ($42,s),y
$0b:d9ad  19 ff 5f	  ora $5fff,y
$0b:d9b0  04 40		 tsb $40
$0b:d9b2  8c b6 bf	  sty $bfb6
$0b:d9b5  06 b7		 asl $b7
$0b:d9b7  25 56		 and $56
$0b:d9b9  a4 e9		 ldy $e9
$0b:d9bb  bb			tyx
$0b:d9bc  7d bb 07	  adc $07bb,x
$0b:d9bf  8e 28 9b	  stx $9b28
$0b:d9c2  0d 75 06	  ora $0675
$0b:d9c5  3f 00 bf c0   and $c0bf00,x
$0b:d9c9  37 e4		 and [$e4],y
$0b:d9cb  01 30		 ora ($30,x)
$0b:d9cd  3d ab 1a	  and $1aab,x
$0b:d9d0  21 0a		 and ($0a,x)
$0b:d9d2  6d 16 23	  adc $2316
$0b:d9d5  9f c2 dc e5   sta $e5dcc2,x
$0b:d9d9  5e a8 06	  lsr $06a8,x
$0b:d9dc  fa			plx
$0b:d9dd  a9 95 8a	  lda #$8a95
$0b:d9e0  fe e1 3b	  inc $3be1,x
$0b:d9e3  28			plp
$0b:d9e4  07 fa		 ora [$fa]
$0b:d9e6  89 7a 81	  bit #$817a
$0b:d9e9  77 60		 adc [$60],y
$0b:d9eb  3f f8 12 a8   and $a812f8,x
$0b:d9ef  3f b0 3c 17   and $173cb0,x
$0b:d9f3  f7 a7		 sbc [$a7],y
$0b:d9f5  02 ed		 cop #$ed
$0b:d9f7  f7 29		 sbc [$29],y
$0b:d9f9  ff 0f de 17   sbc $17de0f,x
$0b:d9fd  dd 1b a4	  cmp $a41b,x
$0b:da00  b0 4b		 bcs $da4d
$0b:da02  ff fc 05 09   sbc $0905fc,x
$0b:da06  19 bf 90	  ora $90bf,y
$0b:da09  23 89		 and $89,s
$0b:da0b  56 ab		 lsr $ab,x
$0b:da0d  b5 ef		 lda $ef,x
$0b:da0f  8d d2 95	  sta $95d2
$0b:da12  95 b6		 sta $b6,x
$0b:da14  56 b6		 lsr $b6,x
$0b:da16  10 1f		 bpl $da37
$0b:da18  c4 03		 cpy $03
$0b:da1a  f9 fc ff	  sbc $fffc,y
$0b:da1d  68			pla
$0b:da1e  05 01		 ora $01
$0b:da20  fc c0 fe	  jsr ($fec0,x)
$0b:da23  20 7e 08	  jsr $087e
$0b:da26  7e 02 57	  ror $5702,x
$0b:da29  07 ce		 ora [$ce]
$0b:da2b  6a			ror a
$0b:da2c  eb			xba
$0b:da2d  1d 0d ae	  ora $ae0d,x
$0b:da30  d2 d3		 cmp ($d3)
$0b:da32  eb			xba
$0b:da33  93 5c		 sta ($5c,s),y
$0b:da35  fa			plx
$0b:da36  bf 3c 5a 94   lda $945a3c,x
$0b:da3a  30 17		 bmi $da53
$0b:da3c  7e 04 bf	  ror $bf04,x
$0b:da3f  81 4b		 sta ($4b,x)
$0b:da41  f0 45		 beq $da88
$0b:da43  fe 18 f5	  inc $f518,x
$0b:da46  60			rts
$0b:da47  70 2b		 bvs $da74
$0b:da49  fc 0e 5d	  jsr ($5d0e,x)
$0b:da4c  be 1b 57	  ldx $571b,y
$0b:da4f  ad 70 ee	  lda $ee70
$0b:da52  9a			txs
$0b:da53  5e ec 7e	  lsr $7eec,x
$0b:da56  95 1f		 sta $1f,x
$0b:da58  db			stp
$0b:da59  cd 6d 16	  cmp $166d
$0b:da5c  3c 84 0f	  bit $0f84,x
$0b:da5f  71 01		 adc ($01),y
$0b:da61  9e 40 fb	  stz $fb40,x
$0b:da64  50 7f		 bvc $dae5
$0b:da66  03 98		 ora $98,s
$0b:da68  20 7c 88	  jsr $887c
$0b:da6b  0e 72 03	  asl $0372
$0b:da6e  6b			rtl
$0b:da6f  58			cli
$0b:da70  05 ae		 ora $ae
$0b:da72  b1 f0		 lda ($f0),y
$0b:da74  d6 fd		 dec $fd,x
$0b:da76  2a			rol a
$0b:da77  3e 39 77	  rol $7739,x
$0b:da7a  0e ab 13	  asl $13ab
$0b:da7d  99 8a 47	  sta $478a,y
$0b:da80  ee 29 1f	  inc $1f29
$0b:da83  d8			cld
$0b:da84  a4 fd		 ldy $fd
$0b:da86  e2 91		 sep #$91
$0b:da88  9a			txs
$0b:da89  69 3e 95	  adc #$953e
$0b:da8c  8d 5e 73	  sta $735e
$0b:da8f  0b			phd
$0b:da90  d8			cld
$0b:da91  95 f0		 sta $f0,x
$0b:da93  be 15 0a	  ldx $0a15,y
$0b:da96  56 13		 lsr $13,x
$0b:da98  2f 0e ed c0   and $c0ed0e
$0b:da9c  08			php
$0b:da9d  69 fd 05	  adc #$05fd
$0b:daa0  19 24 23	  ora $2324,y
$0b:daa3  b2 2b		 lda ($2b)
$0b:daa5  6c f6 ef	  jmp ($eff6)
$0b:daa8  00 1a		 brk #$1a
$0b:daaa  05 57		 ora $57
$0b:daac  55 9d		 eor $9d,x
$0b:daae  ae c5 30	  ldx $30c5
$0b:dab1  16 4c		 asl $4c,x
$0b:dab3  58			cli
$0b:dab4  30 20		 bmi $dad6
$0b:dab6  48			pha
$0b:dab7  65 91		 adc $91
$0b:dab9  7f ef e4 a1   adc $a1e4ef,x
$0b:dabd  f0 40		 beq $daff
$0b:dabf  34 1f		 bit $1f,x
$0b:dac1  8e 84 00	  stx $0084
$0b:dac4  a8			tay
$0b:dac5  13 0e		 ora ($0e,s),y
$0b:dac7  06 33		 asl $33
$0b:dac9  e1 13		 sbc ($13,x)
$0b:dacb  8e 69 60	  stx $6069
$0b:dace  c8			iny
$0b:dacf  76 43		 ror $43,x
$0b:dad1  97 83		 sta [$83],y
$0b:dad3  ff f8 ff e5   sbc $e5fff8,x
$0b:dad7  ec 93 bc	  cpx $bc93
$0b:dada  df d6 49 3a   cmp $3a49d6,x
$0b:dade  c8			iny
$0b:dadf  59 6d 79	  eor $796d,y
$0b:dae2  3d 77 de	  and $de77,x
$0b:dae5  c9 53 aa	  cmp #$aa53
$0b:dae8  7e e0 7e	  ror $7ee0,x
$0b:daeb  48			pha
$0b:daec  3f 6e 3f ef   and $ef3f6e,x
$0b:daf0  9f e7 e7 f5   sta $f5e7e7,x
$0b:daf4  eb			xba
$0b:daf5  f6 73		 inc $73,x
$0b:daf7  f9 ac fe	  sbc $feac,y
$0b:dafa  7d 22 76	  adc $7622,x
$0b:dafd  ab			plb
$0b:dafe  64 93		 stz $93
$0b:db00  8f 8b 89 5d   sta $5d898b
$0b:db04  fd 57 9f	  sbc $9f57,x
$0b:db07  a5 eb		 lda $eb
$0b:db09  d9 d5 f5	  cmp $f5d5,y
$0b:db0c  fb			xce
$0b:db0d  fc 19 7f	  jsr ($7f19,x)
$0b:db10  87 ef		 sta [$ef]
$0b:db12  f1 fd		 sbc ($fd),y
$0b:db14  fe 5f 67	  inc $675f,x
$0b:db17  d7 f9		 cmp [$f9],y
$0b:db19  fd be df	  sbc $dfbe,x
$0b:db1c  ce e7 d6	  dec $d6e7
$0b:db1f  e1 1e		 sbc ($1e,x)
$0b:db21  ca			dex
$0b:db22  ae 2b e5	  ldx $e52b
$0b:db25  57 94		 eor [$94],y
$0b:db27  e2 b7		 sep #$b7
$0b:db29  55 7a		 eor $7a,x
$0b:db2b  14 b2		 trb $b2
$0b:db2d  89 b7		 bit #$b7
$0b:db2f  d0 fd		 bne $db2e
$0b:db31  80 83		 bra $dab6
$0b:db33  6d 80 7b	  adc $7b80
$0b:db36  b0 57		 bcs $db8f
$0b:db38  58			cli
$0b:db39  06 f6		 asl $f6
$0b:db3b  09 fb		 ora #$fb
$0b:db3d  94 57		 sty $57,x
$0b:db3f  a2 1a		 ldx #$1a
$0b:db41  b8			clv
$0b:db42  37 ce		 and [$ce],y
$0b:db44  d9 60 96	  cmp $9660,y
$0b:db47  6d e2 1b	  adc $1be2
$0b:db4a  5a			phy
$0b:db4b  06 df		 asl $df
$0b:db4d  61 c3		 adc ($c3,x)
$0b:db4f  86 fb		 stx $fb
$0b:db51  ec 7f f9	  cpx $f97f
$0b:db54  06 6e		 asl $6e
$0b:db56  03 df		 ora $df,s
$0b:db58  a0 fb		 ldy #$fb
$0b:db5a  f4 7f f9	  pea $f97f
$0b:db5d  af 3e 03 fa   lda $fa033e
$0b:db61  a0 66		 ldy #$66
$0b:db63  30 1d		 bmi $db82
$0b:db65  5b			tcd
$0b:db66  f6 e6		 inc $e6,x
$0b:db68  bf 06 e4 6c   lda $6ce406,x
$0b:db6c  eb			xba
$0b:db6d  d5 4c		 cmp $4c,x
$0b:db6f  c6 ba		 dec $ba
$0b:db71  e9 f9		 sbc #$f9
$0b:db73  d4 55		 pei ($55)
$0b:db75  2e 52 0f	  rol $0f52
$0b:db78  f3 fc		 sbc ($fc,s),y
$0b:db7a  26 3f		 rol $3f
$0b:db7c  c9 0f		 cmp #$0f
$0b:db7e  f2 47		 sbc ($47)
$0b:db80  f8			sed
$0b:db81  81 dc		 sta ($dc,x)
$0b:db83  20 f2 0c	  jsr $0cf2
$0b:db86  7c 02 df	  jmp ($df02,x)
$0b:db89  ba			tsx
$0b:db8a  de f6 a4	  dec $a4f6,x
$0b:db8d  3d 2d 6f	  and $6f2d,x
$0b:db90  6b			rtl
$0b:db91  f7 48		 sbc [$48],y
$0b:db93  ea			nop
$0b:db94  eb			xba
$0b:db95  a5 fb		 lda $fb
$0b:db97  5b			tcd
$0b:db98  55 1a		 eor $1a,x
$0b:db9a  09 ff		 ora #$ff
$0b:db9c  0f 84 30 40   ora $403084
$0b:dba0  30 4b		 bmi $dbed
$0b:dba2  fc 02 7d	  jsr ($7d02,x)
$0b:dba5  40			rti
$0b:dba6  8e 6c 60	  stx $606c
$0b:dba9  1f 6a ee f6   ora $f6ee6a,x
$0b:dbad  b7 84		 lda [$84],y
$0b:dbaf  a5 6d		 lda $6d
$0b:dbb1  6b			rtl
$0b:dbb2  7d f8 96	  adc $96f8,x
$0b:dbb5  a6 ef		 ldx $ef
$0b:dbb7  71 d6		 adc ($d6),y
$0b:dbb9  d7 3d		 cmp [$3d],y
$0b:dbbb  12 06		 ora ($06)
$0b:dbbd  f8			sed
$0b:dbbe  7f e6 24 01   adc $0124e6,x
$0b:dbc2  7f 84 02 f9   adc $f90284,x
$0b:dbc6  02 9c		 cop #$9c
$0b:dbc8  41 e0		 eor ($e0,x)
$0b:dbca  19 2c f5	  ora $f52c,y
$0b:dbcd  7b			tdc
$0b:dbce  c3 b3		 cmp $b3,s
$0b:dbd0  a2 5a		 ldx #$5a
$0b:dbd2  70 9c		 bvs $db70
$0b:dbd4  c8			iny
$0b:dbd5  24 03		 bit $03
$0b:dbd7  19 9c 82	  ora $829c,y
$0b:dbda  4b			phk
$0b:dbdb  a0 96		 ldy #$96
$0b:dbdd  18			clc
$0b:dbde  04 02		 tsb $02
$0b:dbe0  19 00 8f	  ora $8f00,y
$0b:dbe3  40			rti
$0b:dbe4  37 f0		 and [$f0],y
$0b:dbe6  0f f9 9d 2a   ora $2a9df9
$0b:dbea  36 9b		 rol $9b,x
$0b:dbec  c6 17		 dec $17
$0b:dbee  9b			txy
$0b:dbef  22 cb c8 26   jsl $26c8cb
$0b:dbf3  72 08		 adc ($08)
$0b:dbf5  04 c6		 tsb $c6
$0b:dbf7  73 20		 adc ($20,s),y
$0b:dbf9  ba			tsx
$0b:dbfa  48			pha
$0b:dbfb  30 d0		 bmi $dbcd
$0b:dbfd  08			php
$0b:dbfe  14 c2		 trb $c2
$0b:dc00  01 78		 ora ($78,x)
$0b:dc02  80 7f		 bra $dc83
$0b:dc04  4c ed 21	  jmp $21ed
$0b:dc07  a0 71		 ldy #$71
$0b:dc09  0c 01 04	  tsb $0401
$0b:dc0c  a4 41		 ldy $41
$0b:dc0e  31 85		 and ($85),y
$0b:dc10  85 33		 sta $33
$0b:dc12  b1 9d		 lda ($9d),y
$0b:dc14  ae 16 8f	  ldx $8f16
$0b:dc17  bf 6a 91 5d   lda $5d916a,x
$0b:dc1b  96 ec		 stx $ec,y
$0b:dc1d  31 5c		 and ($5c),y
$0b:dc1f  0b			phd
$0b:dc20  c7 3f		 cmp [$3f]
$0b:dc22  97 c5		 sta [$c5],y
$0b:dc24  93 4b		 sta ($4b,s),y
$0b:dc26  f3 fc		 sbc ($fc,s),y
$0b:dc28  09 ee		 ora #$ee
$0b:dc2a  03 7f		 ora $7f,s
$0b:dc2c  c0 af		 cpy #$af
$0b:dc2e  f8			sed
$0b:dc2f  27 fe		 and [$fe]
$0b:dc31  09 bf		 ora #$bf
$0b:dc33  02 7f		 cop #$7f
$0b:dc35  80 ef		 bra $dc26
$0b:dc37  e0 37		 cpx #$37
$0b:dc39  de 6c 7c	  dec $7c6c,x
$0b:dc3c  af 29 5d d4   lda $d45d29
$0b:dc40  ce b2 bd	  dec $bdb2
$0b:dc43  7a			ply
$0b:dc44  55 b7		 eor $b7,x
$0b:dc46  6b			rtl
$0b:dc47  25 85		 and $85
$0b:dc49  6b			rtl
$0b:dc4a  a3 30		 lda $30,s
$0b:dc4c  3e 84 0f	  rol $0f84,x
$0b:dc4f  c5 07		 cmp $07
$0b:dc51  e2 43		 sep #$43
$0b:dc53  e5 10		 sbc $10
$0b:dc55  fc 84 3f	  jsr ($3f84,x)
$0b:dc58  b5 07		 lda $07,x
$0b:dc5a  e8			inx
$0b:dc5b  c0 e2		 cpy #$e2
$0b:dc5d  17 8f		 ora [$8f],y
$0b:dc5f  bd ea 51	  lda $51ea,x
$0b:dc62  fd da da	  sbc $dada,x
$0b:dc65  39 5a 0d	  and $0d5a,y
$0b:dc68  c4 3e		 cpy $3e
$0b:dc6a  97 85		 sta [$85],y
$0b:dc6c  d3 4b		 cmp ($4b,s),y
$0b:dc6e  cd 00 86	  cmp $8600
$0b:dc71  41 40		 eor ($40,x)
$0b:dc73  7d cc e3	  adc $e3cc,x
$0b:dc76  df 80 52 2b   cmp $2b5280,x
$0b:dc7a  f7 dd		 sbc [$dd],y
$0b:dc7c  75 2b		 adc $2b,x
$0b:dc7e  89 52		 bit #$52
$0b:dc80  c9 6a		 cmp #$6a
$0b:dc82  70 db		 bvs $dc5f
$0b:dc84  69 7d		 adc #$7d
$0b:dc86  4f 1b ec d1   eor $d1ec1b
$0b:dc8a  99 80 1a	  sta $1a80,y
$0b:dc8d  00 50		 brk #$50
$0b:dc8f  f6 81		 inc $81,x
$0b:dc91  84 42		 sty $42
$0b:dc93  40			rti
$0b:dc94  d0 cc		 bne $dc62
$0b:dc96  de e7 d0	  dec $d0e7,x
$0b:dc99  1a			inc a
$0b:dc9a  cc 9b 77	  cpy $779b
$0b:dc9d  7f 92 e0 32   adc $32e092,x
$0b:dca1  90 bc		 bcc $dc5f
$0b:dca3  4d ee 65	  eor $65ee
$0b:dca6  4d 82 01	  eor $0182
$0b:dca9  40			rti
$0b:dcaa  80 77		 bra $dd23
$0b:dcac  f2 30		 sbc ($30)
$0b:dcae  8f cb 11 f0   sta $f011cb
$0b:dcb2  d0 40		 bne $dcf4
$0b:dcb4  37 94		 and [$94],y
$0b:dcb6  0d bf e2	  ora $e2bf
$0b:dcb9  59 2f b5	  eor $b52f,y
$0b:dcbc  60			rts
$0b:dcbd  f4 bf eb	  pea $ebbf
$0b:dcc0  5e 51 0e	  lsr $0e51,x
$0b:dcc3  dd 0f ff	  cmp $ff0f,x
$0b:dcc6  f0 80		 beq $dc48
$0b:dcc8  72 9a		 adc ($9a)
$0b:dcca  1c 72 f3	  trb $f372
$0b:dccd  d6 ad		 dec $ad,x
$0b:dccf  7a			ply
$0b:dcd0  74 14		 stz $14,x
$0b:dcd2  2a			rol a
$0b:dcd3  8d b7 57	  sta $57b7
$0b:dcd6  9a			txs
$0b:dcd7  88			dey
$0b:dcd8  db			stp
$0b:dcd9  18			clc
$0b:dcda  41 ff		 eor ($ff,x)
$0b:dcdc  d7 ff		 cmp [$ff],y
$0b:dcde  f5 bf		 sbc $bf,x
$0b:dce0  fa			plx
$0b:dce1  fd ff 5f	  sbc $5fff,x
$0b:dce4  3f eb c7 fd   and $fdc7eb,x
$0b:dce8  f0 ff		 beq $dce9
$0b:dcea  fc 1f 95	  jsr ($951f,x)
$0b:dced  f0 ee		 beq $dcdd
$0b:dcef  fe 2f 5b	  inc $5b2f,x
$0b:dcf2  c8			iny
$0b:dcf3  ef f3 d1 bc   sbc $bcd1f3
$0b:dcf7  e9 ca		 sbc #$ca
$0b:dcf9  32 9a		 and ($9a)
$0b:dcfb  0e bd 03	  asl $03bd
$0b:dcfe  bf 9f 23 0f   lda $0f239f,x
$0b:dd02  bf bf db ff   lda $ffdbbf,x
$0b:dd06  ff af f7 ef   sbc $eff7af,x
$0b:dd0a  ff f3 7f f2   sbc $f27ff3,x
$0b:dd0e  fd d5 aa	  sbc $aad5,x
$0b:dd11  95 3f		 sta $3f,x
$0b:dd13  4f 0a 49 51   eor $51490a
$0b:dd17  c7 6d		 cmp [$6d]
$0b:dd19  3d f5 bb	  and $bbf5,x
$0b:dd1c  74 93		 stz $93,x
$0b:dd1e  f1 6b		 sbc ($6b),y
$0b:dd20  d7 e8		 cmp [$e8],y
$0b:dd22  35 d8		 and $d8,x
$0b:dd24  0b			phd
$0b:dd25  f4 23 ff	  pea $ff23
$0b:dd28  04 b5		 tsb $b5
$0b:dd2a  c0 b6		 cpy #$b6
$0b:dd2c  98			tya
$0b:dd2d  4e df 23	  lsr $23df
$0b:dd30  2f 90 bb c4   and $c4bb90
$0b:dd34  35 f0		 and $f0,x
$0b:dd36  6b			rtl
$0b:dd37  f7 a3		 sbc [$a3],y
$0b:dd39  83 18		 sta $18,s
$0b:dd3b  a7 d5		 lda [$d5]
$0b:dd3d  7f f3 3a c6   adc $c63af3,x
$0b:dd41  22 ab 92 f7   jsl $f792ab
$0b:dd45  c8			iny
$0b:dd46  ff 32 1c fc   sbc $fc1c32,x
$0b:dd4a  0f df 43 dd   ora $dd43df
$0b:dd4e  40			rti
$0b:dd4f  b9 98 4f	  lda $4f98,y
$0b:dd52  bc 42 df	  ldy $df42,x
$0b:dd55  00 e5		 brk #$e5
$0b:dd57  db			stp
$0b:dd58  e1 75		 sbc ($75,x)
$0b:dd5a  3a			dec a
$0b:dd5b  a7 22		 lda [$22]
$0b:dd5d  f5 a2		 sbc $a2,x
$0b:dd5f  ea			nop
$0b:dd60  45 a9		 eor $a9
$0b:dd62  f1 fd		 sbc ($fd),y
$0b:dd64  ac c6 d1	  ldy $d1c6
$0b:dd67  66 c8		 ror $c8
$0b:dd69  40			rti
$0b:dd6a  37 90		 and [$90],y
$0b:dd6c  09 fc		 ora #$fc
$0b:dd6e  03 bb		 ora $bb,s
$0b:dd70  00 f4		 brk #$f4
$0b:dd72  c0 3c		 cpy #$3c
$0b:dd74  10 0e		 bpl $dd84
$0b:dd76  74 03		 stz $03,x
$0b:dd78  3f 00 db fa   and $fadb00,x
$0b:dd7c  30 52		 bmi $ddd0
$0b:dd7e  cd ad c7	  cmp $c7ad
$0b:dd81  5b			tcd
$0b:dd82  3f cb 74 29   and $2974cb,x
$0b:dd86  36 6d		 rol $6d,x
$0b:dd88  64 86		 stz $86
$0b:dd8a  27 b0		 and [$b0]
$0b:dd8c  8f c0 3b e0   sta $e03bc0
$0b:dd90  a1 e0		 lda ($e0,x)
$0b:dd92  40			rti
$0b:dd93  25 e0		 and $e0
$0b:dd95  c1 10		 cmp ($10,x)
$0b:dd97  87 3e		 sta [$3e]
$0b:dd99  01 f8		 ora ($f8,x)
$0b:dd9b  d7 6b		 cmp [$6b],y
$0b:dd9d  72 fd		 adc ($fd)
$0b:dd9f  4b			phk
$0b:dda0  ae d7 f7	  ldx $f7d7
$0b:dda3  6e a5 f6	  ror $f6a5
$0b:dda6  23 bb		 and $bb,s
$0b:dda8  39 44 5a	  and $5a44,y
$0b:ddab  ef 41 ff d0   sbc $d0ff41
$0b:ddaf  3f f0 23 60   and $6023f0,x
$0b:ddb3  ec 3f fe	  cpx $fe3f
$0b:ddb6  0f ff 53 ff   ora $ff53ff
$0b:ddba  88			dey
$0b:ddbb  ff eb f2 f2   sbc $f2f2eb,x
$0b:ddbf  5c bf 6b 9f   jml $9f6bbf
$0b:ddc3  e5 b6		 sbc $b6
$0b:ddc5  ee a7 35	  inc $35a7
$0b:ddc8  6b			rtl
$0b:ddc9  95 22		 sta $22,x
$0b:ddcb  b7 bd		 lda [$bd],y
$0b:ddcd  cb			wai
$0b:ddce  de 3f e5	  dec $e53f,x
$0b:ddd1  f0 98		 beq $dd6b
$0b:ddd3  7f f2 5f fe   adc $fe5ff2,x
$0b:ddd7  37 ff		 and [$ff],y
$0b:ddd9  19 ff d2	  ora $d2ff,y
$0b:dddc  7f ec 1f fa   adc $fa1fec,x
$0b:dde0  e4 33		 cpx $33
$0b:dde2  59 85 be	  eor $be85,y
$0b:dde5  d3 26		 cmp ($26,s),y
$0b:dde7  fa			plx
$0b:dde8  2d 37 8a	  and $8a37
$0b:ddeb  df c5 db e5   cmp $e5dbc5,x
$0b:ddef  2e b2 1f	  rol $1fb2
$0b:ddf2  9f 42 f7 e8   sta $e8f742,x
$0b:ddf6  d9 f8 2b	  cmp $2bf8,y
$0b:ddf9  be 48 ef	  ldx $ef48,y
$0b:ddfc  92 75		 sta ($75)
$0b:ddfe  e2 b5		 sep #$b5
$0b:de00  f8			sed
$0b:de01  fb			xce
$0b:de02  dd 4a 1c	  cmp $1c4a,x
$0b:de05  6f e9 aa ad   adc $adaae9
$0b:de09  dc a5 5b	  jml [$5ba5]
$0b:de0c  ad af d6	  lda $d6af
$0b:de0f  97 e8		 sta [$e8],y
$0b:de11  cb			wai
$0b:de12  7c 6a b7	  jmp ($b76a,x)
$0b:de15  2d e6 02	  and $02e6
$0b:de18  3b			tsc
$0b:de19  80 c6		 bra $dde1
$0b:de1b  f0 28		 beq $de45
$0b:de1d  be 08 57	  ldx $5708,y
$0b:de20  82 2f c0	  brl $9e52
$0b:de23  87 e0		 sta [$e0]
$0b:de25  31 f8		 and ($f8),y
$0b:de27  0b			phd
$0b:de28  5f 26 c9 51   eor $51c926,x
$0b:de2c  ad c7 a0	  lda $a0c7
$0b:de2f  d1 38		 cmp ($38),y
$0b:de31  74 2a		 stz $2a,x
$0b:de33  00 b8		 brk #$b8
$0b:de35  05 d8		 ora $d8
$0b:de37  41 22		 eor ($22,x)
$0b:de39  df f8 75 fe   cmp $fe75f8,x
$0b:de3d  09 5f		 ora #$5f
$0b:de3f  86 47		 stx $47
$0b:de41  e0 90		 cpx #$90
$0b:de43  e6 38		 inc $38
$0b:de45  c1 17		 cmp ($17,x)
$0b:de47  a1 5c		 lda ($5c,x)
$0b:de49  bd 48 2a	  lda $2a48,x
$0b:de4c  5c bc ce 67   jml $67cebc
$0b:de50  17 06		 ora [$06],y
$0b:de52  c6 c1		 dec $c1
$0b:de54  21 8b		 and ($8b,x)
$0b:de56  d0 81		 bne $ddd9
$0b:de58  40			rti
$0b:de59  b0 ff		 bcs $de5a
$0b:de5b  fc 7f fe	  jsr ($fe7f,x)
$0b:de5e  0d df 83	  ora $83df
$0b:de61  67 e0		 adc [$e0]
$0b:de63  58			cli
$0b:de64  f8			sed
$0b:de65  14 3a		 trb $3a
$0b:de67  05 06		 ora $06
$0b:de69  80 40		 bra $deab
$0b:de6b  a1 b0		 lda ($b0,x)
$0b:de6d  98			tya
$0b:de6e  54 0e 2d	  mvn $2d,$0e
$0b:de71  14 84		 trb $84
$0b:de73  42 22		 wdm #$22
$0b:de75  11 09		 ora ($09),y
$0b:de77  04 81		 tsb $81
$0b:de79  76 30		 ror $30,x
$0b:de7b  08			php
$0b:de7c  34 3e		 bit $3e,x
$0b:de7e  19 0f 84	  ora $840f,y
$0b:de81  47 a2		 eor [$a2]
$0b:de83  11 89		 ora ($89),y
$0b:de85  04 c2		 tsb $c2
$0b:de87  00 fa		 brk #$fa
$0b:de89  3d 67 8b	  and $8b67,x
$0b:de8c  cd a0 f5	  cmp $f5a0
$0b:de8f  68			pla
$0b:de90  b1 7e		 lda ($7e),y
$0b:de92  59 bf 4e	  eor $4ebf,y
$0b:de95  a9 b2		 lda #$b2
$0b:de97  ea			nop
$0b:de98  06 86		 asl $86
$0b:de9a  3f ff 0f 84   and $840fff,x
$0b:de9e  77 ff		 adc [$ff],y
$0b:dea0  1e 60 07	  asl $0760,x
$0b:dea3  fe 1e 28	  inc $281e,x
$0b:dea6  3a			dec a
$0b:dea7  9d 3a 33	  sta $333a,x
$0b:deaa  46 8a		 lsr $8a
$0b:deac  d2 2e		 cmp ($2e)
$0b:deae  96 ee		 stx $ee,y
$0b:deb0  57 9b		 eor [$9b],y
$0b:deb2  57 e6		 eor [$e6],y
$0b:deb4  95 d9		 sta $d9,x
$0b:deb6  87 61		 sta [$61]
$0b:deb8  bf ff 8f cb   lda $cb8fff,x
$0b:debc  3e 20 0f	  rol $0f20,x
$0b:debf  e8			inx
$0b:dec0  7c 08 a0	  jmp ($a008,x)
$0b:dec3  45 0a		 eor $0a
$0b:dec5  af cf 6b d3   lda $d36bcf
$0b:dec9  e3 ec		 sbc $ec,s
$0b:decb  67 b5		 adc [$b5]
$0b:decd  bb			tyx
$0b:dece  fd 4e ab	  sbc $ab4e,x
$0b:ded1  73 ea		 adc ($ea,s),y
$0b:ded3  dc f2 73	  jml [$73f2]
$0b:ded6  51 38		 eor ($38),y
$0b:ded8  17 cb		 ora [$cb],y
$0b:deda  0d ff c7	  ora $c7ff
$0b:dedd  19 8f 9d	  ora $9d8f,y
$0b:dee0  ff 90 40 a8   sbc $a84090,x
$0b:dee4  f1 09		 sbc ($09),y
$0b:dee6  85 0a		 sta $0a
$0b:dee8  45 10		 eor $10
$0b:deea  a4 c8		 ldy $c8
$0b:deec  2e 10 8a	  rol $8a10
$0b:deef  ac a2 d9	  ldy $d9a2
$0b:def2  58			cli
$0b:def3  80 7f		 bra $df74
$0b:def5  cf f9 4a 97   cmp $974af9
$0b:def9  ed 6d f0	  sbc $f06d
$0b:defc  4a			lsr a
$0b:defd  ad 6e 65	  lda $656e
$0b:df00  ea			nop
$0b:df01  97 d5		 sta [$d5],y
$0b:df03  af ba db 95   lda $95dbba
$0b:df07  67 4f		 adc [$4f]
$0b:df09  10 40		 bpl $df4b
$0b:df0b  0c 2b ff	  tsb $ff2b
$0b:df0e  0c ff a7	  tsb $a7ff
$0b:df11  c8			iny
$0b:df12  fe 55 5f	  inc $5f55,x
$0b:df15  75 2e		 adc $2e,x
$0b:df17  bf 90 8f 68   lda $688f90,x
$0b:df1b  27 55		 and [$55]
$0b:df1d  9b			txy
$0b:df1e  3e d2 9f	  rol $9fd2,x
$0b:df21  6b			rtl
$0b:df22  8c 78 b3	  sty $b378
$0b:df25  ef b0 d0 40   sbc $40d0b0
$0b:df29  fc 30 7e	  jsr ($7e30,x)
$0b:df2c  0c 3f 00	  tsb $003f
$0b:df2f  c6 08		 dec $08
$0b:df31  fe 12 7f	  inc $7f12,x
$0b:df34  00 9f		 brk #$9f
$0b:df36  f5 7d		 sbc $7d,x
$0b:df38  d3 5b		 cmp ($5b,s),y
$0b:df3a  8f 3a 91 bf   sta $bf913a
$0b:df3e  f6 54		 inc $54,x
$0b:df40  7c 92 7d	  jmp ($7d92,x)
$0b:df43  77 6b		 adc [$6b],y
$0b:df45  2d 55 aa	  and $aa55
$0b:df48  c0 38		 cpy #$38
$0b:df4a  18			clc
$0b:df4b  ef 86 df f1   sbc $f1df86
$0b:df4f  13 fc		 ora ($fc,s),y
$0b:df51  46 ff		 lsr $ff
$0b:df53  95 9f		 sta $9f,x
$0b:df55  f5 a7		 sbc $a7,x
$0b:df57  fd ea 12	  sbc $12ea,x
$0b:df5a  07 2e		 ora [$2e]
$0b:df5c  e3 eb		 sbc $eb,s
$0b:df5e  e4 50		 cpx $50
$0b:df60  a1 da		 lda ($da,x)
$0b:df62  6f ae 92 45   adc $4592ae
$0b:df66  75 8c		 adc $8c,x
$0b:df68  db			stp
$0b:df69  bc d4 c9	  ldy $c9d4,x
$0b:df6c  e7 fe		 sbc [$fe]
$0b:df6e  39 ff 9e	  and $9eff,y
$0b:df71  ff ef 3f fb   sbc $fb3fef,x
$0b:df75  df ff f7 ff   cmp $fff7ff,x
$0b:df79  f9 82 86	  sbc $8682,y
$0b:df7c  0f ca b1 73   ora $73b1ca
$0b:df80  f7 bd		 sbc [$bd],y
$0b:df82  ec 37 53	  cpx $5337
$0b:df85  97 95		 sta [$95],y
$0b:df87  b3 4c		 lda ($4c,s),y
$0b:df89  7a			ply
$0b:df8a  7a			ply
$0b:df8b  59 47 72	  eor $7247,y
$0b:df8e  6f ff 0f 84   adc $840fff
$0b:df92  9f ff 2f ff   sta $ff2fff,x
$0b:df96  cb			wai
$0b:df97  8d 42 63	  sta $6342
$0b:df9a  08			php
$0b:df9b  3f fe a3 62   and $62a3fe,x
$0b:df9f  ed fa 2c	  sbc $2cfa
$0b:dfa2  55 1d		 eor $1d,x
$0b:dfa4  7e c2 fb	  ror $fbc2,x
$0b:dfa7  e4 3a		 cpx $3a
$0b:dfa9  86 f7		 stx $f7
$0b:dfab  07 ee		 ora [$ee]
$0b:dfad  e4 6f		 cpx $6f
$0b:dfaf  f0 13		 beq $dfc4
$0b:dfb1  6c 06 ff	  jmp ($ff06)
$0b:dfb4  81 4f		 sta ($4f,x)
$0b:dfb6  e2 42		 sep #$42
$0b:dfb8  f0 1f		 beq $dfd9
$0b:dfba  fe 05 fb	  inc $fb05,x
$0b:dfbd  91 37		 sta ($37),y
$0b:dfbf  c0 6e		 cpy #$6e
$0b:dfc1  f5 37		 sbc $37,x
$0b:dfc3  9a			txs
$0b:dfc4  4f fa 85 7f   eor $7f85fa
$0b:dfc8  ab			plb
$0b:dfc9  d3 a1		 cmp ($a1,s),y
$0b:dfcb  3c 7c 9f	  bit $9f7c,x
$0b:dfce  d6 47		 dec $47,x
$0b:dfd0  e6 d2		 inc $d2
$0b:dfd2  d5 a2		 cmp $a2,x
$0b:dfd4  7b			tdc
$0b:dfd5  69 9e		 adc #$9e
$0b:dfd7  f6 7f		 inc $7f,x
$0b:dfd9  a8			tay
$0b:dfda  95 fd		 sta $fd,x
$0b:dfdc  a8			tay
$0b:dfdd  f7 ca		 sbc [$ca],y
$0b:dfdf  3f 73 8f 5a   and $5a8f73,x
$0b:dfe3  a1 af		 lda ($af,x)
$0b:dfe5  c2 03		 rep #$03
$0b:dfe7  01 80		 ora ($80,x)
$0b:dfe9  40			rti
$0b:dfea  8e 81 05	  stx $0581
$0b:dfed  82 1d 82	  brl $620d
$0b:dff0  03 06		 ora $06,s
$0b:dff2  81 42		 sta ($42,x)
$0b:dff4  17 e0		 ora [$e0],y
$0b:dff6  70 18		 bvs $e010
$0b:dff8  1a			inc a
$0b:dff9  0c 20 70	  tsb $7020
$0b:dffc  74 39		 stz $39,x
$0b:dffe  41 e1		 eor ($e1,x)
$0b:e000  f0 d8		 beq $dfda
$0b:e002  4c 6a 27	  jmp $276a
$0b:e005  16 8a		 asl $8a,x
$0b:e007  c2 61		 rep #$61
$0b:e009  71 38		 adc ($38),y
$0b:e00b  94 02		 sty $02,x
$0b:e00d  0b			phd
$0b:e00e  0a			asl a
$0b:e00f  84 43		 sty $43
$0b:e011  e1 30		 sbc ($30,x)
$0b:e013  68			pla
$0b:e014  7c 32 3f	  jmp ($3f32,x)
$0b:e017  08			php
$0b:e018  8f c4 23 70   sta $7023c4
$0b:e01c  18			clc
$0b:e01d  9a			txs
$0b:e01e  2c 93 e1	  bit $e193
$0b:e021  2d e4 f6	  and $f6e4
$0b:e024  b2 71		 lda ($71)
$0b:e026  6c ae 27	  jmp ($27ae)
$0b:e029  16 97		 asl $97,x
$0b:e02b  7f 7c 33 bf   adc $bf337c,x
$0b:e02f  08			php
$0b:e030  cf c4 33 6a   cmp $6a33c4
$0b:e034  76 ad		 ror $ad,x
$0b:e036  5e f5 db	  lsr $dbf5,x
$0b:e039  eb			xba
$0b:e03a  45 83		 eor $83
$0b:e03c  3b			tsc
$0b:e03d  94 a8		 sty $a8,x
$0b:e03f  f8			sed
$0b:e040  e5 d0		 sbc $d0
$0b:e042  3e af 4f	  rol $4faf,x
$0b:e045  e7 e0		 sbc [$e0]
$0b:e047  82 5f e8	  brl $c8a9
$0b:e04a  3e 7c ff	  rol $ff7c,x
$0b:e04d  06 f7		 asl $f7
$0b:e04f  c0 9f		 cpy #$9f
$0b:e051  92 06		 sta ($06)
$0b:e053  5f c0 8f e0   eor $e08fc0,x
$0b:e057  37 5f		 and [$5f],y
$0b:e059  aa			tax
$0b:e05a  ad 57 85	  lda $8557
$0b:e05d  d0 84		 bne $dfe3
$0b:e05f  56 65		 lsr $65,x
$0b:e061  dc 6d 8d	  jml [$8d6d]
$0b:e064  46 a7		 lsr $a7
$0b:e066  8b			phb
$0b:e067  c4 44		 cpy $44
$0b:e069  20 9f ed	  jsr $ed9f
$0b:e06c  57 be		 eor [$be],y
$0b:e06e  7f 87 ff 40   adc $40ff87,x
$0b:e072  ff 30 3f 74   sbc $743f30,x
$0b:e076  0f f9 01 ff   ora $ff01f9
$0b:e07a  c0 e0		 cpy #$e0
$0b:e07c  b6 2d		 ldx $2d,y
$0b:e07e  d5 46		 cmp $46,x
$0b:e080  6d 51 eb	  adc $eb51
$0b:e083  6c 7a 41	  jmp ($417a)
$0b:e086  60			rts
$0b:e087  da			phx
$0b:e088  c5 ae		 cmp $ae
$0b:e08a  19 5b 96	  ora $965b,y
$0b:e08d  7f ff 8f 10   adc $108fff,x
$0b:e091  0c 3c 48	  tsb $483c
$0b:e094  62 12 fd	  per $dda9
$0b:e097  59 e8 be	  eor $bee8,y
$0b:e09a  be 4d 9e	  ldx $9e4d,y
$0b:e09d  53 67		 eor ($67,s),y
$0b:e09f  96 d8		 stx $d8,y
$0b:e0a1  e5 b6		 sbc $b6
$0b:e0a3  7f 4d 9a d4   adc $d49a4d,x
$0b:e0a7  e2 0f		 sep #$0f
$0b:e0a9  f8			sed
$0b:e0aa  ff 2a 17 5b   sbc $5b172a,x
$0b:e0ae  b5 4f		 lda $4f,x
$0b:e0b0  f5 5f		 sbc $5f,x
$0b:e0b2  b9 55 e0	  lda $e055,y
$0b:e0b5  d7 3f		 cmp [$3f],y
$0b:e0b7  77 6e		 adc [$6e],y
$0b:e0b9  23 ab		 and $ab,s
$0b:e0bb  89 6b b1	  bit #$b16b
$0b:e0be  df fc 67 ff   cmp $ff67fc,x
$0b:e0c2  08			php
$0b:e0c3  60			rts
$0b:e0c4  13 08		 ora ($08,s),y
$0b:e0c6  41 3f		 eor ($3f,x)
$0b:e0c8  f4 4f fd	  pea $fd4f
$0b:e0cb  07 ff		 ora [$ff]
$0b:e0cd  b9 bb ee	  lda $eebb,y
$0b:e0d0  ec fa aa	  cpx $aafa
$0b:e0d3  f7 4a		 sbc [$4a],y
$0b:e0d5  7d bb bb	  adc $bbbb,x
$0b:e0d8  ea			nop
$0b:e0d9  2c db ab	  bit $abdb
$0b:e0dc  36 2e		 rol $2e,x
$0b:e0de  dd 00 3f	  cmp $3f00,x
$0b:e0e1  8c 05 04	  sty $0405
$0b:e0e4  27 f0		 and [$f0]
$0b:e0e6  88			dey
$0b:e0e7  a2 0e		 ldx #$0e
$0b:e0e9  d5 fa		 cmp $fa,x
$0b:e0eb  a2 c3		 ldx #$c3
$0b:e0ed  62 55 7a	  per $5b45
$0b:e0f0  44 6e 19	  mvp $19,$6e
$0b:e0f3  5d 86 d6	  eor $d686,x
$0b:e0f6  60			rts
$0b:e0f7  35 dc		 and $dc,x
$0b:e0f9  a5 66		 lda $66
$0b:e0fb  0b			phd
$0b:e0fc  00 f9		 brk #$f9
$0b:e0fe  40			rti
$0b:e0ff  3d 10 0f	  and $0f10,x
$0b:e102  24 03		 bit $03
$0b:e104  c5 00		 cmp $00
$0b:e106  f3 2a		 sbc ($2a,s),y
$0b:e108  0e 29 bb	  asl $bb29
$0b:e10b  a3 ea		 lda $ea,s
$0b:e10d  bb			tyx
$0b:e10e  39 5d 75	  and $755d,y
$0b:e111  52 2b		 eor ($2b)
$0b:e113  2c b1 cd	  bit $cdb1
$0b:e116  f8			sed
$0b:e117  94 ba		 sty $ba,x
$0b:e119  8c 0a 01	  sty $010a
$0b:e11c  7f 88 5f e0   adc $e05f88,x
$0b:e120  53 fc		 eor ($fc,s),y
$0b:e122  1c ff 87	  trb $87ff
$0b:e125  1f e0 43 f6   ora $f643e0,x
$0b:e129  00 a0		 brk #$a0
$0b:e12b  80 73		 bra $e1a0
$0b:e12d  35 d3		 and $d3,x
$0b:e12f  3c cd 73	  bit $73cd,x
$0b:e132  9b			txy
$0b:e133  a3 fb		 lda $fb,s
$0b:e135  6e 75 fe	  ror $fe75
$0b:e138  8d 75 46	  sta $4675
$0b:e13b  fb			xce
$0b:e13c  a5 b8		 lda $b8
$0b:e13e  5c ff f6 6f   jml $6ff6ff
$0b:e142  fc cb ff	  jsr ($ffcb,x)
$0b:e145  18			clc
$0b:e146  ff 54 3f d5   sbc $d53f54,x
$0b:e14a  1f e6 0b f1   ora $f10be6,x
$0b:e14e  0f f0 63 69   ora $6963f0
$0b:e152  35 ac		 and $ac,x
$0b:e154  9c 4b 37	  stz $374b
$0b:e157  e0 95		 cpx #$95
$0b:e159  d7 e0		 cmp [$e0],y
$0b:e15b  db			stp
$0b:e15c  5d 3d 5f	  eor $5f3d,x
$0b:e15f  8b			phb
$0b:e160  28			plp
$0b:e161  f5 7d		 sbc $7d,x
$0b:e163  bf fe c0 00   lda $00c0fe,x
$0b:e167  f7 3f		 sbc [$3f],y
$0b:e169  ff 8f fd 63   sbc $63fd8f,x
$0b:e16d  ff 3a ff c5   sbc $c5ff3a,x
$0b:e171  ff f2 5f ce   sbc $ce5ff2,x
$0b:e175  cf 57 1a 95   cmp $951a57
$0b:e179  f1 2e		 sbc ($2e),y
$0b:e17b  f7 aa		 sbc [$aa],y
$0b:e17d  bc 16 db	  ldy $db16,x
$0b:e180  fa			plx
$0b:e181  d6 7f		 dec $7f,x
$0b:e183  75 30		 adc $30,x
$0b:e185  63 50		 adc $50,s
$0b:e187  f1 3f		 sbc ($3f),y
$0b:e189  f8			sed
$0b:e18a  83 30		 sta $30,s
$0b:e18c  e7 bf		 sbc [$bf]
$0b:e18e  f1 ff		 sbc ($ff),y
$0b:e190  fc 7b ff	  jsr ($ff7b,x)
$0b:e193  73 a8		 adc ($a8,s),y
$0b:e195  7e f5 37	  ror $37f5,x
$0b:e198  ab			plb
$0b:e199  0c a3 63	  tsb $63a3
$0b:e19c  b5 f6		 lda $f6,x
$0b:e19e  5c fd 5c ac   jml $ac5cfd
$0b:e1a2  05 7a		 ora $7a
$0b:e1a4  a9 af c0	  lda #$c0af
$0b:e1a7  55 f8		 eor $f8,x
$0b:e1a9  18			clc
$0b:e1aa  ee 05 7f	  inc $7f05
$0b:e1ad  c1 1b		 cmp ($1b,x)
$0b:e1af  f0 47		 beq $e1f8
$0b:e1b1  78			sei
$0b:e1b2  17 fe		 ora [$fe],y
$0b:e1b4  16 af		 asl $af,x
$0b:e1b6  00 7e		 brk #$7e
$0b:e1b8  0b			phd
$0b:e1b9  2d 07 e5	  and $e507
$0b:e1bc  d3 fe		 cmp ($fe,s),y
$0b:e1be  eb			xba
$0b:e1bf  33 f0		 and ($f0,s),y
$0b:e1c1  5f f4 8f 7b   eor $7b8ff4,x
$0b:e1c5  a9 db 40	  lda #$40db
$0b:e1c8  3f f6 7d f4   and $f47df6,x
$0b:e1cc  9e 59 27	  stz $2759,x
$0b:e1cf  a9 55 ff	  lda #$ff55
$0b:e1d2  19 fe e6	  ora $e6fe,y
$0b:e1d5  7e ac 0d	  ror $0dac,x
$0b:e1d8  0d bc 36	  ora $36bc
$0b:e1db  13 1a		 ora ($1a,s),y
$0b:e1dd  89 c4 a3	  bit #$a3c4
$0b:e1e0  72 09		 adc ($09)
$0b:e1e2  5c fe 4d 55   jml $554dfe
$0b:e1e6  a3 dd		 lda $dd,s
$0b:e1e8  ec ba 8f	  cpx $8fba
$0b:e1eb  54 1a 1f	  mvn $1f,$1a
$0b:e1ee  0c 8f a0	  tsb $a08f
$0b:e1f1  42 39		 wdm #$39
$0b:e1f3  3f ac 5f e7   and $e75fac,x
$0b:e1f7  17 fc		 ora [$fc],y
$0b:e1f9  d0 30		 bne $e22b
$0b:e1fb  62 31 53	  per $352f
$0b:e1fe  88			dey
$0b:e1ff  4d 64 d2	  eor $d264
$0b:e202  f9 4d 62	  sbc $624d,y
$0b:e205  a5 77		 lda $77
$0b:e207  b1 48		 lda ($48),y
$0b:e209  28			plp
$0b:e20a  d4 a8		 pei ($a8)
$0b:e20c  44 39 04	  mvp $04,$39
$0b:e20f  31 89		 and ($89),y
$0b:e211  fc 42 7f	  jsr ($7f42,x)
$0b:e214  21 bd		 and ($bd,x)
$0b:e216  c0 6e		 cpy #$6e
$0b:e218  f0 3b		 beq $e255
$0b:e21a  3c 1e 9f	  bit $9f1e,x
$0b:e21d  ba			tsx
$0b:e21e  fd d1 7a	  sbc $7ad1,x
$0b:e221  b5 ae		 lda $ae,x
$0b:e223  45 d3		 eor $d3
$0b:e225  5b			tcd
$0b:e226  d6 8b		 dec $8b,x
$0b:e228  53 63		 eor ($63,s),y
$0b:e22a  bb			tyx
$0b:e22b  39 9d b2	  and $b29d,y
$0b:e22e  c1 04		 cmp ($04,x)
$0b:e230  ff ca ad f3   sbc $f3adca,x
$0b:e234  78			sei
$0b:e235  3f 6a 07 e9   and $e9076a,x
$0b:e239  81 f8		 sta ($f8,x)
$0b:e23b  a0 7c		 ldy #$7c
$0b:e23d  c8			iny
$0b:e23e  0e 7e 03	  asl $037e
$0b:e241  60			rts
$0b:e242  b4 75		 ldy $75,x
$0b:e244  fb			xce
$0b:e245  50 8e		 bvc $e1d5
$0b:e247  ee 97 61	  inc $6197
$0b:e24a  ea			nop
$0b:e24b  f0 45		 beq $e292
$0b:e24d  b2 5d		 lda ($5d)
$0b:e24f  dc ed 8a	  jml [$8aed]
$0b:e252  d5 9f		 cmp $9f,x
$0b:e254  e0 4f		 cpx #$4f
$0b:e256  78			sei
$0b:e257  13 fc		 ora ($fc,s),y
$0b:e259  05 7f		 ora $7f
$0b:e25b  81 1f		 sta ($1f,x)
$0b:e25d  e0 5b		 cpx #$5b
$0b:e25f  7c 36 2f	  jmp ($2f36,x)
$0b:e262  be 57 ff	  ldx $ff57,y
$0b:e265  48			pha
$0b:e266  ac dd 75	  ldy $75dd
$0b:e269  34 2e		 bit $2e,x
$0b:e26b  15 57		 ora $57,x
$0b:e26d  23 6e		 and $6e,s
$0b:e26f  a3 4c		 lda $4c,s
$0b:e271  65 34		 adc $34
$0b:e273  2e 07 2b	  rol $2b07
$0b:e276  d5 be		 cmp $be,x
$0b:e278  80 f7		 bra $e271
$0b:e27a  a0 7f		 ldy #$7f
$0b:e27c  d8			cld
$0b:e27d  1f ba 03 bd   ora $bd03ba,x
$0b:e281  00 06		 brk #$06
$0b:e283  0e 7f f7	  asl $f77f
$0b:e286  8a			txa
$0b:e287  ff f8 f7 1a   sbc $1af7f8,x
$0b:e28b  75 e7		 adc $e7,x
$0b:e28d  55 d9		 eor $d9,x
$0b:e28f  09 85 2f	  ora #$2f85
$0b:e292  f1 5a		 sbc ($5a),y
$0b:e294  f4 6a 6f	  pea $6f6a
$0b:e297  39 2a de	  and $de2a,y
$0b:e29a  3f ff 87 ff   and $ff87ff,x
$0b:e29e  c1 c4		 cmp ($c4,x)
$0b:e2a0  4b			phk
$0b:e2a1  06 ff		 asl $ff
$0b:e2a3  c9 3f f3	  cmp #$f33f
$0b:e2a6  9d be c6	  sta $c6be,x
$0b:e2a9  6f 55 b9 8c   adc $8cb955
$0b:e2ad  c3 69		 cmp $69,s
$0b:e2af  b3 d2		 lda ($d2,s),y
$0b:e2b1  ec aa dd	  cpx $ddaa
$0b:e2b4  0b			phd
$0b:e2b5  6f 27 9f fe   adc $fe9f27
$0b:e2b9  e7 ff		 sbc [$ff]
$0b:e2bb  c3 e0		 cmp $e0,s
$0b:e2bd  1f 0a 79 18   ora $18790a,x
$0b:e2c1  65 ff		 adc $ff
$0b:e2c3  f9 b7 ff	  sbc $ffb7,y
$0b:e2c6  ab			plb
$0b:e2c7  ec 8d 5a	  cpx $5a8d
$0b:e2ca  6d 55 8e	  adc $8e55
$0b:e2cd  0f e2 d7 59   ora $59d7e2
$0b:e2d1  97 57		 sta [$57],y
$0b:e2d3  64 55		 stz $55
$0b:e2d5  9e 56 e6	  stz $e656,x
$0b:e2d8  07 ff		 ora [$ff]
$0b:e2da  10 80		 bpl $e25c
$0b:e2dc  84 84		 sty $84
$0b:e2de  21 83		 and ($83,x)
$0b:e2e0  31 1e		 and ($1e),y
$0b:e2e2  ef f7 56 e4   sbc $e456f7
$0b:e2e6  4d f0 11	  eor $11f0
$0b:e2e9  ec 0d fb	  cpx $fb0d
$0b:e2ec  81 35		 sta ($35,x)
$0b:e2ee  c4 55		 cpy $55
$0b:e2f0  38			sec
$0b:e2f1  73 6d		 adc ($6d,s),y
$0b:e2f3  b4 12		 ldy $12,x
$0b:e2f5  01 3f		 ora ($3f,x)
$0b:e2f7  80 5f		 bra $e358
$0b:e2f9  d0 42		 bne $e33d
$0b:e2fb  81 24		 sta ($24,x)
$0b:e2fd  08			php
$0b:e2fe  52 60		 eor ($60)
$0b:e300  1e af 56	  asl $56af,x
$0b:e303  54 00 12	  mvn $12,$00
$0b:e306  0e e4 0b	  asl $0be4
$0b:e309  e9 0a fd	  sbc #$fd0a
$0b:e30c  41 a9		 eor ($a9,x)
$0b:e30e  93 e8		 sta ($e8,s),y
$0b:e310  8c 46 2b	  sty $2b46
$0b:e313  00 ff		 brk #$ff
$0b:e315  40			rti
$0b:e316  3f ea 27 f7   and $f727ea,x
$0b:e31a  40			rti
$0b:e31b  2c d1 1d	  bit $1dd1
$0b:e31e  de 02 2d	  dec $2d02,x
$0b:e321  80 92		 bra $e2b5
$0b:e323  62 f3 37	  per $1b19
$0b:e326  b9 74 06	  lda $0674,y
$0b:e329  25 00		 and $00
$0b:e32b  a9 cb 3f	  lda #$3fcb
$0b:e32e  ff fb fb 00   sbc $00fbfb,x
$0b:e332  e0 8a		 cpx #$8a
$0b:e334  35 da		 and $da,x
$0b:e336  50 2e		 bvc $e366
$0b:e338  71 3e		 adc ($3e),y
$0b:e33a  34 1f		 bit $1f,x
$0b:e33c  73 1a		 adc ($1a,s),y
$0b:e33e  c4 7c		 cpy $7c
$0b:e340  34 10		 bit $10,x
$0b:e342  0a			asl a
$0b:e343  04 03		 tsb $03
$0b:e345  71 40		 adc ($40),y
$0b:e347  5f 87 b3 ff   eor $ffb387,x
$0b:e34b  f8			sed
$0b:e34c  ff f9 14 6f   sbc $6f14f9,x
$0b:e350  56 fe		 lsr $fe,x
$0b:e352  59 6b 3a	  eor $3a6b,y
$0b:e355  ae fc ab	  ldx $abfc
$0b:e358  bb			tyx
$0b:e359  75 cb		 adc $cb,x
$0b:e35b  57 b6		 eor [$b6],y
$0b:e35d  7f 29 dd b7   adc $b7dd29,x
$0b:e361  4c 5f 0c	  jmp $0c5f
$0b:e364  12 8c		 ora ($8c)
$0b:e366  e1 1f		 sbc ($1f,x)
$0b:e368  f8			sed
$0b:e369  60			rts
$0b:e36a  20 63 1f	  jsr $1f63
$0b:e36d  ff b4 ee 9b   sbc $9beeb4,x
$0b:e371  a3 b8		 lda $b8,s
$0b:e373  ea			nop
$0b:e374  f4 f6 bc	  pea $bcf6
$0b:e377  55 0b		 eor $0b,x
$0b:e379  3b			tsc
$0b:e37a  57 fa		 eor [$fa],y
$0b:e37c  55 e9		 eor $e9,x
$0b:e37e  5e f0 48	  lsr $48f0,x
$0b:e381  47 04		 eor [$04]
$0b:e383  07 3d		 ora [$3d]
$0b:e385  ff ca 05 03   sbc $0305ca,x
$0b:e389  30 ff		 bmi $e38a
$0b:e38b  d4 a4		 pei ($a4)
$0b:e38d  39 db 87	  and $87db,y
$0b:e390  aa			tax
$0b:e391  e5 2b		 sbc $2b
$0b:e393  f9 fd 7c	  sbc $7cfd,y
$0b:e396  95 5f		 sta $5f,x
$0b:e398  1e 2e cf	  asl $cf2e,x
$0b:e39b  27 a7		 and [$a7]
$0b:e39d  ff c7 e3 fd   sbc $fde3c7,x
$0b:e3a1  ef ff 3f ff   sbc $ff3fff
$0b:e3a5  bd f9 00	  lda $00f9,x
$0b:e3a8  bf ff 8f ad   lda $ad8fff,x
$0b:e3ac  26 15		 rol $15
$0b:e3ae  9c de cb	  stz $cbde
$0b:e3b1  aa			tax
$0b:e3b2  d4 f9		 pei ($f9)
$0b:e3b4  5e 9f 6d	  lsr $6d9f,x
$0b:e3b7  2b			pld
$0b:e3b8  a6 f3		 ldx $f3
$0b:e3ba  a2 98		 ldx #$98
$0b:e3bc  ed f0 fc	  sbc $fcf0
$0b:e3bf  7b			tdc
$0b:e3c0  e4 71		 cpx $71
$0b:e3c2  ef 90 c3 ff   sbc $ffc390
$0b:e3c6  bf fd 8f c3   lda $c38ffd,x
$0b:e3ca  53 88		 eor ($88,s),y
$0b:e3cc  d3 e4		 cmp ($e4,s),y
$0b:e3ce  aa			tax
$0b:e3cf  92 28		 sta ($28)
$0b:e3d1  d5 ab		 cmp $ab,x
$0b:e3d3  2b			pld
$0b:e3d4  6d c5 da	  adc $dac5
$0b:e3d7  66 75		 ror $75
$0b:e3d9  58			cli
$0b:e3da  c5 5a		 cmp $5a
$0b:e3dc  ef ff be 92   sbc $92beff
$0b:e3e0  c7 eb		 cmp [$eb]
$0b:e3e2  df f9 6f fe   cmp $fe6ff9,x
$0b:e3e6  df ff 77 ff   cmp $ff77ff,x
$0b:e3ea  df fb a6 d0   cmp $d0a6fb,x
$0b:e3ee  76 d2		 ror $d2,x
$0b:e3f0  88			dey
$0b:e3f1  0e bb c1	  asl $c1bb
$0b:e3f4  6f a4 d1 b7   adc $b7d1a4
$0b:e3f8  19 6a 84	  ora $846a,y
$0b:e3fb  fb			xce
$0b:e3fc  17 65		 ora [$65],y
$0b:e3fe  2f 81 a4 0c   and $0ca481
$0b:e402  61 9f		 adc ($9f,x)
$0b:e404  fe 92 02	  inc $0292,x
$0b:e407  df fb f7 ff   cmp $fff7fb,x
$0b:e40b  ff dd b8 02   sbc $02b8dd,x
$0b:e40f  bc 20 30	  ldy $3020,x
$0b:e412  18			clc
$0b:e413  12 d0		 ora ($d0)
$0b:e415  20 70 58	  jsr $5870
$0b:e418  74 25		 stz $25,x
$0b:e41a  6e 10 88	  ror $8810
$0b:e41d  62 c8 20	  per $04e8
$0b:e420  70 38		 bvs $e45a
$0b:e422  3b			tsc
$0b:e423  0c 60 cc	  tsb $cc60
$0b:e426  60			rts
$0b:e427  87 c3		 sta [$c3]
$0b:e429  a1 f0		 lda ($f0,x)
$0b:e42b  78			sei
$0b:e42c  7d 6b f7	  adc $f76b,x
$0b:e42f  25 93		 and $93
$0b:e431  e6 b3		 inc $b3
$0b:e433  51 db		 eor ($db),y
$0b:e435  6d 57 c3	  adc $c357
$0b:e438  2a			rol a
$0b:e439  e2 55		 sep #$55
$0b:e43b  62 13 38	  per $1c51
$0b:e43e  04 13		 tsb $13
$0b:e440  ff d8 ef d9   sbc $d9efd8,x
$0b:e444  61 ff		 adc ($ff,x)
$0b:e446  28			plp
$0b:e447  1f f8 06 3e   ora $3e06f8,x
$0b:e44b  f0 18		 beq $e465
$0b:e44d  ee bf 7d	  inc $7dbf
$0b:e450  5e ae d7	  lsr $d7ae,x
$0b:e453  53 0d		 eor ($0d,s),y
$0b:e455  8c 4a e0	  sty $e04a
$0b:e458  5f 0a 85 2b   eor $2b850a,x
$0b:e45c  09 97 87	  ora #$8797
$0b:e45f  37 c2		 and [$c2],y
$0b:e461  55 e3		 eor $e3,x
$0b:e463  af 70 3f f8   lda $f83f70
$0b:e467  0f eb a8 c1   ora $c1a8eb
$0b:e46b  61 2e		 adc ($2e,x)
$0b:e46d  f7 fc		 sbc [$fc],y
$0b:e46f  74 3a		 stz $3a,x
$0b:e471  6f 45 b3 4d   adc $4db345
$0b:e475  7a			ply
$0b:e476  db			stp
$0b:e477  4b			phk
$0b:e478  3c 5f 4d	  bit $4d5f,x
$0b:e47b  16 93		 asl $93,x
$0b:e47d  d5 10		 cmp $10,x
$0b:e47f  ff c7 bf f1   sbc $f1bfc7,x
$0b:e483  f1 10		 sbc ($10),y
$0b:e485  c3 c4		 cmp $c4,s
$0b:e487  46 23		 lsr $23
$0b:e489  0e 8f 06	  asl $068f
$0b:e48c  1d 50 ac	  ora $ac50,x
$0b:e48f  d3 b2		 cmp ($b2,s),y
$0b:e491  fc ec 3f	  jsr ($3fec,x)
$0b:e494  3b			tsc
$0b:e495  a7 ce		 lda [$ce]
$0b:e497  85 d5		 sta $d5
$0b:e499  ab			plb
$0b:e49a  74 e9		 stz $e9,x
$0b:e49c  f7 fd		 sbc [$fd],y
$0b:e49e  4e 0a 70	  lsr $700a
$0b:e4a1  9f fe e7 ff   sta $ffe7fe,x
$0b:e4a5  d9 f9 00	  cmp $00f9,y
$0b:e4a8  fa			plx
$0b:e4a9  5b			tcd
$0b:e4aa  19 ad 4a	  ora $4aad,y
$0b:e4ad  a1 72		 lda ($72,x)
$0b:e4af  bb			tyx
$0b:e4b0  d4 f6		 pei ($f6)
$0b:e4b2  b9 3c 0e	  lda $0e3c,y
$0b:e4b5  ce 2b b1	  dec $b12b
$0b:e4b8  a9 7d 44	  lda #$447d
$0b:e4bb  e1 8f		 sbc ($8f,x)
$0b:e4bd  30 0e		 bmi $e4cd
$0b:e4bf  3b			tsc
$0b:e4c0  ff 4e 33 1c   sbc $1c334e,x
$0b:e4c4  3b			tsc
$0b:e4c5  ff 2d f6 e7   sbc $e7f62d,x
$0b:e4c9  ef f9 3a c6   sbc $c63af9
$0b:e4cd  de ff db	  dec $dbff,x
$0b:e4d0  bb			tyx
$0b:e4d1  e6 6e		 inc $6e
$0b:e4d3  f2 af		 sbc ($af)
$0b:e4d5  84 92		 sty $92
$0b:e4d7  a7 12		 lda [$12]
$0b:e4d9  57 8c		 eor [$8c],y
$0b:e4db  9d 5e 28	  sta $285e,x
$0b:e4de  43 83		 eor $83,s
$0b:e4e0  c0 31		 cpy #$31
$0b:e4e2  f7 4f		 sbc [$4f],y
$0b:e4e4  e7 6b		 sbc [$6b]
$0b:e4e6  f5 4f		 sbc $4f,x
$0b:e4e8  97 dd		 sta [$dd],y
$0b:e4ea  bd d6 eb	  lda $ebd6,x
$0b:e4ed  75 6f		 adc $6f,x
$0b:e4ef  ff 24 af 73   sbc $73af24,x
$0b:e4f3  62 10 38	  per $1d06
$0b:e4f6  04 16		 tsb $16
$0b:e4f8  01 f0		 ora ($f0,x)
$0b:e4fa  80 44		 bra $e540
$0b:e4fc  60			rts
$0b:e4fd  19 14 41	  ora $4114,y
$0b:e500  60			rts
$0b:e501  60			rts
$0b:e502  1e 3b 3d	  asl $3d3b,x
$0b:e505  9e 6f 80	  stz $806f,x
$0b:e508  d4 5e		 pei ($5e)
$0b:e50a  ed b1 28	  sbc $28b1
$0b:e50d  44 02 95	  mvp $95,$02
$0b:e510  3d 94 da	  and $da94,x
$0b:e513  60			rts
$0b:e514  d2 98		 cmp ($98)
$0b:e516  c7 fe		 cmp [$fe]
$0b:e518  ff ff 6f 80   sbc $806fff,x
$0b:e51c  28			plp
$0b:e51d  ff f1 60 58   sbc $5860f1,x
$0b:e521  d8			cld
$0b:e522  2f d4 88 66   and $6688d4
$0b:e526  b3 e1		 lda ($e1,s),y
$0b:e528  a0 a0		 ldy #$a0
$0b:e52a  44 20 16	  mvp $16,$20
$0b:e52d  6c c6 c3	  jmp ($c3c6)
$0b:e530  c1 80		 cmp ($80,x)
$0b:e532  80 60		 bra $e594
$0b:e534  3f ff 06 22   and $2206ff,x
$0b:e538  b1 52		 lda ($52),y
$0b:e53a  37 dc		 and [$dc],y
$0b:e53c  f3 de		 sbc ($de,s),y
$0b:e53e  30 56		 bmi $e596
$0b:e540  df 64 ee e3   cmp $e3ee64,x
$0b:e544  af 8f 75 fd   lda $fd758f
$0b:e548  37 bd		 and [$bd],y
$0b:e54a  d5 8e		 cmp $8e,x
$0b:e54c  41 ff		 eor ($ff,x)
$0b:e54e  74 80		 stz $80,x
$0b:e550  7c 00 64	  jmp ($6400,x)
$0b:e553  ff 06 18 43   sbc $431806,x
$0b:e557  3f f8 4d 7d   and $7d4df8,x
$0b:e55b  c7 3d		 cmp [$3d]
$0b:e55d  d5 cd		 cmp $cd,x
$0b:e55f  7b			tdc
$0b:e560  b6 3a		 ldx $3a,y
$0b:e562  5d dd 2a	  eor $2add,x
$0b:e565  ef 59 b2 6f   sbc $6fb259
$0b:e569  f8			sed
$0b:e56a  b7 06		 lda [$06],y
$0b:e56c  70 08		 bvs $e576
$0b:e56e  06 80		 asl $80
$0b:e570  24 16		 bit $16
$0b:e572  f8			sed
$0b:e573  60			rts
$0b:e574  bf f0 2f ff   lda $ff2ff0,x
$0b:e578  5f 1f a9 d3   eor $d3a91f,x
$0b:e57c  f8			sed
$0b:e57d  fc f5 da	  jsr ($daf5,x)
$0b:e580  be ce 6f	  ldx $6fce,y
$0b:e583  76 d9		 ror $d9,x
$0b:e585  e7 61		 sbc [$61]
$0b:e587  56 aa		 lsr $aa,x
$0b:e589  83 04		 sta $04,s
$0b:e58b  2b			pld
$0b:e58c  ff f8 ff fb   sbc $fbfff8,x
$0b:e590  5f fe e7 ff   eor $ffe7fe,x
$0b:e594  79 ff ff	  adc $ffff,y
$0b:e597  bf ff 7f ff   lda $ff7fff,x
$0b:e59b  ed e3 68	  sbc $68e3
$0b:e59e  b8			clv
$0b:e59f  9d d7 4b	  sta $4bd7,x
$0b:e5a2  4b			phk
$0b:e5a3  c4 aa		 cpy $aa
$0b:e5a5  e4 b6		 cpx $b6
$0b:e5a7  f3 3a		 sbc ($3a,s),y
$0b:e5a9  54 27 4b	  mvn $4b,$27
$0b:e5ac  14 ff		 trb $ff
$0b:e5ae  7f cb e1 ed   adc $ede1cb,x
$0b:e5b2  ff fe ff fe   sbc $fefffe,x
$0b:e5b6  ff f9 24 8c   sbc $8c24f9,x
$0b:e5ba  a1 c1		 lda ($c1,x)
$0b:e5bc  c7 fa		 cmp [$fa]
$0b:e5be  34 d1		 bit $d1,x
$0b:e5c0  1c b6 d3	  trb $d3b6
$0b:e5c3  67 4d		 adc [$4d]
$0b:e5c5  b5 6e		 lda $6e,x
$0b:e5c7  25 55		 and $55
$0b:e5c9  6a			ror a
$0b:e5ca  26 37		 rol $37
$0b:e5cc  ab			plb
$0b:e5cd  7e fe 90	  ror $90fe,x
$0b:e5d0  42 df		 wdm #$df
$0b:e5d2  fd a7 ff	  sbc $ffa7,x
$0b:e5d5  f2 e2		 sbc ($e2)
$0b:e5d7  e0 ff		 cpx #$ff
$0b:e5d9  ee ff f3	  inc $f3ff
$0b:e5dc  a1 40		 lda ($40,x)
$0b:e5de  59 63 37	  eor $3763,y
$0b:e5e1  59 7d 4f	  eor $4f7d,y
$0b:e5e4  35 d2		 and $d2,x
$0b:e5e6  81 54		 sta ($54,x)
$0b:e5e8  3d 1a bc	  and $bc1a,x
$0b:e5eb  ae 02 b5	  ldx $b502
$0b:e5ee  c2 2f		 rep #$2f
$0b:e5f0  87 bb		 sta [$bb]
$0b:e5f2  7f ec ff db   adc $dbffec,x
$0b:e5f6  4c c3 57	  jmp $57c3
$0b:e5f9  60			rts
$0b:e5fa  0c f7 ff	  tsb $fff7
$0b:e5fd  05 84		 ora $84
$0b:e5ff  c4 e3		 cpy $e3
$0b:e601  71 a8		 adc ($a8),y
$0b:e603  5c 92 6f 3a   jml $3a6f92
$0b:e607  89 c0 65	  bit #$65c0
$0b:e60a  b7 a9		 lda [$a9],y
$0b:e60c  67 f7		 adc [$f7]
$0b:e60e  53 06		 eor ($06,s),y
$0b:e610  87 c1		 sta [$c1]
$0b:e612  23 ec		 and $ec,s
$0b:e614  10 84		 bpl $e59a
$0b:e616  4f e1 93 f8   eor $f893e1
$0b:e61a  f4 fe 3f	  pea $3ffe
$0b:e61d  7f 8f 01 82   adc $82018f,x
$0b:e621  f1 f7		 sbc ($f7),y
$0b:e623  bd 4a 3f	  lda $3f4a,x
$0b:e626  b8			clv
$0b:e627  6b			rtl
$0b:e628  97 17		 sta [$17],y
$0b:e62a  4f 99 c4 f7   eor $f7c499
$0b:e62e  bb			tyx
$0b:e62f  96 2b		 stx $2b,y
$0b:e631  50 00		 bvc $e633
$0b:e633  3f a0 10 70   and $7010a0,x
$0b:e637  0d e2 01	  ora $01e2
$0b:e63a  76 8b		 ror $8b,x
$0b:e63c  c8			iny
$0b:e63d  f7 f9		 sbc [$f9],y
$0b:e63f  5f fd 22 bf   eor $bf22fd,x
$0b:e643  7d d7 42	  adc $42d7,x
$0b:e646  b0 9b		 bcs $e5e3
$0b:e648  2d 17 47	  and $4717
$0b:e64b  ad 2a a4	  lda $a42a
$0b:e64e  56 bb		 lsr $bb,x
$0b:e650  da			phx
$0b:e651  bd 5e fe	  lda $fe5e,x
$0b:e654  01 df		 ora ($df,x)
$0b:e656  71 0d		 adc ($0d),y
$0b:e658  76 81		 ror $81,x
$0b:e65a  2f f0 6d fe   and $fe6df0
$0b:e65e  12 1f		 ora ($1f)
$0b:e660  cd 53 ff	  cmp $ff53
$0b:e663  da			phx
$0b:e664  bc 7d a6	  ldy $a67d,x
$0b:e667  7e 9a 45	  ror $459a,x
$0b:e66a  5a			phy
$0b:e66b  09 9d c2	  ora #$c29d
$0b:e66e  5c e5 5e a8   jml $a85ee5
$0b:e672  06 fa		 asl $fa
$0b:e674  a9 87 ff	  lda #$ff87
$0b:e677  f3 7f		 sbc ($7f,s),y
$0b:e679  fb			xce
$0b:e67a  79 ff ee	  adc $eeff,y
$0b:e67d  bf 7b 80 f7   lda $f7807b,x
$0b:e681  5c 41 02 f5   jml $f50241
$0b:e685  c0 3d		 cpy #$3d
$0b:e687  76 5f		 ror $5f,x
$0b:e689  24 a3		 bit $a3
$0b:e68b  db			stp
$0b:e68c  44 ab 40	  mvp $40,$ab
$0b:e68f  32 a1		 and ($a1)
$0b:e691  85 cf		 sta $cf
$0b:e693  7f fb e8 a0   adc $a0e8fb,x
$0b:e697  9f ff eb d7   sta $d7ebff,x
$0b:e69b  b8			clv
$0b:e69c  00 a5		 brk #$a5
$0b:e69e  2b			pld
$0b:e69f  b4 9d		 ldy $9d,x
$0b:e6a1  54 a7 15	  mvn $15,$a7
$0b:e6a4  29 ea c5	  and #$c5ea
$0b:e6a7  75 78		 adc $78,x
$0b:e6a9  bb			tyx
$0b:e6aa  a4 9b		 ldy $9b
$0b:e6ac  97 4b		 sta [$4b],y
$0b:e6ae  de 6c 36	  dec $366c,x
$0b:e6b1  df fe b1 80   cmp $80b1fe,x
$0b:e6b5  7d 5f fb	  adc $fb5f,x
$0b:e6b8  a5 ff		 lda $ff
$0b:e6ba  b3 5f		 lda ($5f,s),y
$0b:e6bc  da			phx
$0b:e6bd  61 e9		 adc ($e9,x)
$0b:e6bf  f0 fb		 beq $e6bc
$0b:e6c1  5f 27 c9 51   eor $51c927,x
$0b:e6c5  bd ef ac	  lda $acef,x
$0b:e6c8  df 3a 7f ea   cmp $ea7f3a,x
$0b:e6cc  03 fa		 ora $fa,s
$0b:e6ce  dc 50 3e	  jml [$3e50]
$0b:e6d1  10 48		 bpl $e71b
$0b:e6d3  b7 ff		 lda [$ff],y
$0b:e6d5  1d 7f c2	  ora $c27f,x
$0b:e6d8  57 f1		 eor [$f1],y
$0b:e6da  91 fc		 sta ($fc),y
$0b:e6dc  24 39		 bit $39
$0b:e6de  0e 18 78	  asl $7818
$0b:e6e1  26 2e		 rol $2e
$0b:e6e3  09 5c bd	  ora #$bd5c
$0b:e6e6  48			pha
$0b:e6e7  2a			rol a
$0b:e6e8  5e bc cf	  lsr $cfbc,x
$0b:e6eb  e7 17		 sbc [$17]
$0b:e6ed  46 c6		 lsr $c6
$0b:e6ef  c1 61		 cmp ($61,x)
$0b:e6f1  93 99		 sta ($99,s),y
$0b:e6f3  e7 cb		 sbc [$cb]
$0b:e6f5  fe 1f 0c	  inc $0c1f,x
$0b:e6f8  7f fe 0d df   adc $df0dfe,x
$0b:e6fc  83 67		 sta $67,s
$0b:e6fe  e6 58		 inc $58
$0b:e700  ff 9c 3b 87   sbc $873b9c,x
$0b:e704  06 80		 asl $80
$0b:e706  c0 a0		 cpy #$a0
$0b:e708  98			tya
$0b:e709  0d af 3a	  ora $3aaf
$0b:e70c  c9 70 db	  cmp #$db70
$0b:e70f  6e 3a 97	  ror $973a
$0b:e712  7d 5e ba	  adc $ba5e,x
$0b:e715  8b			phb
$0b:e716  7e bd 6c	  ror $6cbd,x
$0b:e719  1c 43 ff	  trb $ff43
$0b:e71c  c0 7f		 cpy #$7f
$0b:e71e  e8			inx
$0b:e71f  1f fc 47 fe   ora $fe47fc,x
$0b:e723  a0 c2		 ldy #$c2
$0b:e725  17 10		 ora [$10],y
$0b:e727  40			rti
$0b:e728  60			rts
$0b:e729  15 29		 ora $29,x
$0b:e72b  0c a6 0f	  tsb $0fa6
$0b:e72e  a2 af		 ldx #$af
$0b:e730  d5 27		 cmp $27,x
$0b:e732  5a			phy
$0b:e733  aa			tax
$0b:e734  fd 76 47	  sbc $4776,x
$0b:e737  01 a6		 ora ($a6,x)
$0b:e739  2f c9 7e 50   and $507ec9
$0b:e73d  17 02		 ora [$02],y
$0b:e73f  d5 bf		 cmp $bf,x
$0b:e741  96 5a		 stx $5a,y
$0b:e743  ce ab bf	  dec $bfab
$0b:e746  22 ee de 73   jsl $73deee
$0b:e74a  d6 ad		 dec $ad,x
$0b:e74c  7f b2 1b 51   adc $511bb2,x
$0b:e750  ec c0 ff	  cpx $ffc0
$0b:e753  f8			sed
$0b:e754  27 02		 and [$02]
$0b:e756  c4 3f		 cpy $3f
$0b:e758  f3 2f		 sbc ($2f,s),y
$0b:e75a  fc 9b ff	  jsr ($ff9b,x)
$0b:e75d  ef cb c2 2e   sbc $2ec2cb
$0b:e761  5d 79 55	  eor $5579,x
$0b:e764  ea			nop
$0b:e765  25 35		 and $35
$0b:e767  c2 d1		 rep #$d1
$0b:e769  e9 1b 49	  sbc #$491b
$0b:e76c  8d 66 ed	  sta $ed66
$0b:e76f  78			sei
$0b:e770  80 7f		 bra $e7f1
$0b:e772  44 03 ed	  mvp $ed,$03
$0b:e775  80 5e		 bra $e7d5
$0b:e777  a0 1b 78	  ldy #$781b
$0b:e77a  07 3e		 ora [$3e]
$0b:e77c  01 8f		 ora ($8f,x)
$0b:e77e  80 6e		 bra $e7ee
$0b:e780  b2 55		 lda ($55)
$0b:e782  5c ad 4b 2d   jml $2d4bad
$0b:e786  a9 d4 74	  lda #$74d4
$0b:e789  7a			ply
$0b:e78a  52 eb		 eor ($eb)
$0b:e78c  47 4f		 eor [$4f]
$0b:e78e  85 02		 sta $02
$0b:e790  84 5b		 sty $5b
$0b:e792  7f f6 af f5   adc $f5aff6,x
$0b:e796  a7 f9		 lda [$f9]
$0b:e798  57 fe		 eor [$fe],y
$0b:e79a  4b			phk
$0b:e79b  ff 19 7f 84   sbc $847f19,x
$0b:e79f  f7 c1		 sbc [$c1],y
$0b:e7a1  ff e0 40 09   sbc $0940e0,x
$0b:e7a5  fc e0 56	  jsr ($56e0,x)
$0b:e7a8  fb			xce
$0b:e7a9  70 e0		 bvs $e78b
$0b:e7ab  78			sei
$0b:e7ac  f8			sed
$0b:e7ad  7c f3 7f	  jmp ($7ff3,x)
$0b:e7b0  70 ff		 bvs $e7b1
$0b:e7b2  d0 ff		 bne $e7b3
$0b:e7b4  90 ff		 bcc $e7b5
$0b:e7b6  86 f2		 stx $f2
$0b:e7b8  81 f0		 sta ($f0,x)
$0b:e7ba  80 6f		 bra $e82b
$0b:e7bc  20 07 d0	  jsr $d007
$0b:e7bf  27 06		 and [$06]
$0b:e7c1  01 08		 ora ($08,x)
$0b:e7c3  78			sei
$0b:e7c4  31 60		 and ($60),y
$0b:e7c6  ec bf f3	  cpx $f3bf
$0b:e7c9  59 bf 4f	  eor $4fbf,y
$0b:e7cc  bf 44 bb 40   lda $40bb44,x
$0b:e7d0  b5 1d		 lda $1d,x
$0b:e7d2  3b			tsc
$0b:e7d3  f6 4b		 inc $4b,x
$0b:e7d5  a3 83		 lda $83,s
$0b:e7d7  ef ba 43 91   sbc $9143ba
$0b:e7db  ff 90 48 f1   sbc $f14890,x
$0b:e7df  10 fe		 bpl $e7df
$0b:e7e1  84 7f		 sty $7f
$0b:e7e3  01 1f		 ora ($1f,x)
$0b:e7e5  92 4f		 sta ($4f)
$0b:e7e7  e4 13		 cpx $13
$0b:e7e9  fc db 20	  jsr ($20db,x)
$0b:e7ec  28			plp
$0b:e7ed  38			sec
$0b:e7ee  49 45 73	  eor #$7345
$0b:e7f1  09 02 a6	  ora #$a602
$0b:e7f4  63 21		 adc $21,s
$0b:e7f6  10 ac		 bpl $e7a4
$0b:e7f8  07 02		 ora [$02]
$0b:e7fa  08			php
$0b:e7fb  e9 0c 03	  sbc #$030c
$0b:e7fe  a8			tay
$0b:e7ff  d8			cld
$0b:e800  6d 7f 5e	  adc $5e7f
$0b:e803  04 ff		 tsb $ff
$0b:e805  6f 77 e0 df   adc $dfe077
$0b:e809  f3 d3		 sbc ($d3,s),y
$0b:e80b  e6 b8		 inc $b8
$0b:e80d  60			rts
$0b:e80e  27 cd		 and [$cd]
$0b:e810  50 bf		 bvc $e7d1
$0b:e812  93 43		 sta ($43,s),y
$0b:e814  ff 88 ff ef   sbc $efff88,x
$0b:e818  bf ee 64 72   lda $7264ee,x
$0b:e81c  87 02		 sta [$02]
$0b:e81e  ff e5 b2 ff   sbc $ffb2e5,x
$0b:e822  20 5b 99	  jsr $995b
$0b:e825  df 0a fe ef   cmp $effe0a,x
$0b:e829  0c 93 78	  tsb $7893
$0b:e82c  30 0c		 bmi $e83a
$0b:e82e  10 cd		 bpl $e7fd
$0b:e830  7f ff bf fe   adc $febfff,x
$0b:e834  27 ff		 and [$ff]
$0b:e836  79 ff df	  adc $dfff,y
$0b:e839  b0 05		 bcs $e840
$0b:e83b  be 0f d1	  ldx $d10f,y
$0b:e83e  bf f7 6f f8   lda $f86ff7,x
$0b:e842  18			clc
$0b:e843  0e f2 85	  asl $85f2
$0b:e846  d7 94		 cmp [$94],y
$0b:e848  6f e8 01 b0   adc $b001e8
$0b:e84c  6f 83 94 1c   adc $1c9483
$0b:e850  a1 fe		 lda ($fe,x)
$0b:e852  ff ef 7f fd   sbc $fd7fef,x
$0b:e856  70 40		 bvs $e898
$0b:e858  82 43 f7	  brl $df9e
$0b:e85b  44 fa 52	  mvp $52,$fa
$0b:e85e  fc 15 fd	  jsr ($fd15,x)
$0b:e861  4c af 95	  jmp $95af
$0b:e864  7e 7c a0	  ror $a07c,x
$0b:e867  ac 81 21	  ldy $2181
$0b:e86a  d4 13		 pei ($13)
$0b:e86c  08			php
$0b:e86d  25 2f		 and $2f
$0b:e86f  d8			cld
$0b:e870  1e 0a 68	  asl $680a,x
$0b:e873  2e 7a 1b	  rol $1b7a
$0b:e876  fe 36 a7	  inc $a736,x
$0b:e879  8c a9 15	  sty $15a9
$0b:e87c  42 b5		 wdm #$b5
$0b:e87e  ba			tsx
$0b:e87f  bf 7f f0 3f   lda $3ff07f,x
$0b:e883  fc 63 00	  jsr ($0063,x)
$0b:e886  75 9f		 adc $9f,x
$0b:e888  fd 6b 00	  sbc $006b,x
$0b:e88b  68			pla
$0b:e88c  bf fb 7e c3   lda $c37efb,x
$0b:e890  67 4e		 adc [$4e]
$0b:e892  e6 6f		 inc $6f
$0b:e894  6a			ror a
$0b:e895  7b			tdc
$0b:e896  2d 4d bf	  and $bf4d
$0b:e899  4d 6e ea	  eor $ea6e
$0b:e89c  d7 3b		 cmp [$3b],y
$0b:e89e  72 8a		 adc ($8a)
$0b:e8a0  7f ff 63 ff   adc $ff63ff,x
$0b:e8a4  a1 7f		 lda ($7f,x)
$0b:e8a6  e9 bf fc	  sbc #$fcbf
$0b:e8a9  8f fb 2d f9   sta $f92dfb
$0b:e8ad  d2 7e		 cmp ($7e)
$0b:e8af  fb			xce
$0b:e8b0  1f 7e dd fe   ora $fedd7e,x
$0b:e8b4  a5 8a		 lda $8a
$0b:e8b6  ce 4d 68	  dec $684d
$0b:e8b9  31 b9		 and ($b9),y
$0b:e8bb  dd cb 8d	  cmp $8dcb,x
$0b:e8be  21 90		 and ($90,x)
$0b:e8c0  d4 7c		 pei ($7c)
$0b:e8c2  12 35		 ora ($35)
$0b:e8c4  f8			sed
$0b:e8c5  41 7f		 eor ($7f,x)
$0b:e8c7  f0 2f		 beq $e8f8
$0b:e8c9  fc 81 98	  jsr ($9881,x)
$0b:e8cc  31 06		 and ($06),y
$0b:e8ce  41 ff		 eor ($ff,x)
$0b:e8d0  ef bc ac 16   sbc $16acbc
$0b:e8d4  97 29		 sta [$29],y
$0b:e8d6  aa			tax
$0b:e8d7  d4 f5		 pei ($f5)
$0b:e8d9  72 7a		 adc ($7a)
$0b:e8db  bd 37 5a	  lda $5a37,x
$0b:e8de  99 ac cc	  sta $ccac,y
$0b:e8e1  c0 2f b7	  cpy #$b72f
$0b:e8e4  df fd ef ff   cmp $ffeffd,x
$0b:e8e8  77 37		 adc [$37],y
$0b:e8ea  07 fe		 ora [$fe]
$0b:e8ec  bf ff 9f b7   lda $b79fff,x
$0b:e8f0  87 5b		 sta [$5b]
$0b:e8f2  d3 aa		 cmp ($aa,s),y
$0b:e8f4  fb			xce
$0b:e8f5  35 55		 and $55,x
$0b:e8f7  9a			txs
$0b:e8f8  ae b3 53	  ldx $53b3
$0b:e8fb  77 eb		 adc [$eb],y
$0b:e8fd  56 64		 lsr $64,x
$0b:e8ff  d8			cld
$0b:e900  9e ce ba	  stz $bace,x
$0b:e903  51 f8		 eor ($f8),y
$0b:e905  81 f8		 sta ($f8,x)
$0b:e907  30 fc		 bmi $e905
$0b:e909  08			php
$0b:e90a  1e 01 cc	  asl $cc01,x
$0b:e90d  12 08		 ora ($08)
$0b:e90f  05 c6		 ora $c6
$0b:e911  01 73		 ora ($73,x)
$0b:e913  80 00		 bra $e915
$0b:e915  00 20		 brk #$20
$0b:e917  c0 60 2f	  cpy #$2f60
$0b:e91a  90 3b		 bcc $e957
$0b:e91c  84 3e		 sty $3e
$0b:e91e  87 3f		 sta [$3f]
$0b:e920  87 df		 sta [$df]
$0b:e922  e7 97		 sbc [$97]
$0b:e924  cb			wai
$0b:e925  85 c2		 sta $c2
$0b:e927  fe fd 08	  inc $08fd,x
$0b:e92a  06 02		 asl $02
$0b:e92c  fe 01 4c	  inc $4c01,x
$0b:e92f  1d ff 1f	  ora $1fff,x
$0b:e932  7f ff c0 01   adc $01c0ff,x
$0b:e936  c1 3c		 cmp ($3c,x)
$0b:e938  fe 7c 3e	  inc $3e7c,x
$0b:e93b  1c 3e 04	  trb $043e
$0b:e93e  3c 20 10	  bit $1020,x
$0b:e941  3f 84 3f fe   and $fe3f84,x
$0b:e945  1d 08 04	  ora $0408,x
$0b:e948  0f fe 1c 09   ora $091cfe
$0b:e94c  f8			sed
$0b:e94d  74 44		 stz $44,x
$0b:e94f  c6 0e		 dec $0e
$0b:e951  20 d0 f0	  jsr $f0d0
$0b:e954  de c0 24	  dec $24c0,x
$0b:e957  0f e7 ff e0   ora $e0ffe7
$0b:e95b  1d 21 33	  ora $3321,x
$0b:e95e  0e 8c 1c	  asl $1c8c
$0b:e961  33 ff		 and ($ff,s),y
$0b:e963  ef ff e3 fd   sbc $fde3ff
$0b:e967  e1 fc		 sbc ($fc,x)
$0b:e969  46 83		 lsr $83
$0b:e96b  0e ff 7e	  asl $7eff
$0b:e96e  3f 00 d0 fe   and $fed000,x
$0b:e972  ff be 3f ee   sbc $ee3fbe,x
$0b:e976  0f fa 02 66   ora $6602fa
$0b:e97a  12 00		 ora ($00)
$0b:e97c  7e 20 ee	  ror $ee20,x
$0b:e97f  f0 7a		 beq $e9fb
$0b:e981  9d fd f8	  sta $f8fd,x
$0b:e984  14 3b		 trb $3b
$0b:e986  e4 3e		 cpx $3e
$0b:e988  e1 3f		 sbc ($3f,x)
$0b:e98a  a0 3f c0	  ldy #$c03f
$0b:e98d  7e 28 09	  ror $0928,x
$0b:e990  07 07		 ora [$07]
$0b:e992  0f f9 0f f8   ora $f80ff9
$0b:e996  4f f8 00 d0   eor $d000f8
$0b:e99a  fe 0c 8d	  inc $8d0c,x
$0b:e99d  03 80		 ora $80,s
$0b:e99f  d2 4c		 cmp ($4c)
$0b:e9a1  a0 70 02	  ldy #$0270
$0b:e9a4  27 c3		 and [$c3]
$0b:e9a6  40			rti
$0b:e9a7  c2 64		 rep #$64
$0b:e9a9  e7 80		 sbc [$80]
$0b:e9ab  f5 e1		 sbc $e1,x
$0b:e9ad  c3 e1		 cmp $e1,s
$0b:e9af  f3 d9		 sbc ($d9,s),y
$0b:e9b1  ff c7 ff c1   sbc $c1ffc7,x
$0b:e9b5  0f 0b 25 21   ora $21250b
$0b:e9b9  e9 43 06	  sbc #$0643
$0b:e9bc  81 bc		 sta ($bc,x)
$0b:e9be  2c 67 a5	  bit $a567
$0b:e9c1  7b			tdc
$0b:e9c2  b2 07		 lda ($07)
$0b:e9c4  90 28		 bcc $e9ee
$0b:e9c6  66 03		 ror $03
$0b:e9c8  68			pla
$0b:e9c9  78			sei
$0b:e9ca  e3 f8		 sbc $f8,s
$0b:e9cc  cb			wai
$0b:e9cd  fa			plx
$0b:e9ce  7f e0 01 94   adc $9401e0,x
$0b:e9d2  98			tya
$0b:e9d3  ff b8 ff 88   sbc $88ffb8,x
$0b:e9d7  ff 82 ff 80   sbc $80ff82,x
$0b:e9db  0f fc 00 72   ora $7200fc
$0b:e9df  11 ef		 ora ($ef),y
$0b:e9e1  0d fb 02	  ora $02fb
$0b:e9e4  68			pla
$0b:e9e5  10 c0		 bpl $e9a7
$0b:e9e7  f8			sed
$0b:e9e8  63 e3		 adc $e3,s
$0b:e9ea  ff 77 0d 0e   sbc $0e0d77,x
$0b:e9ee  87 0e		 sta [$0e]
$0b:e9f0  87 ce		 sta [$ce]
$0b:e9f2  27 ef		 and [$ef]
$0b:e9f4  14 07		 trb $07
$0b:e9f6  03 fc		 ora $fc,s
$0b:e9f8  19 a1 8f	  ora $8fa1,y
$0b:e9fb  b8			clv
$0b:e9fc  6f e8 06 96   adc $9606e8
$0b:ea00  07 06		 ora [$06]
$0b:ea02  3d d0 a0	  and $a0d0,x
$0b:ea05  ba			tsx
$0b:ea06  33 c2		 and ($c2,s),y
$0b:ea08  7e 1c 21	  ror $211c,x
$0b:ea0b  f1 87		 sbc ($87),y
$0b:ea0d  a7 fd		 lda [$fd]
$0b:ea0f  5c 3f d8 1f   jml $1fd83f
$0b:ea13  c2 1f		 rep #$1f
$0b:ea15  c6 9f		 dec $9f
$0b:ea17  c6 3f		 dec $3f
$0b:ea19  f6 0f		 inc $0f,x
$0b:ea1b  fe 3b e2	  inc $e23b,x
$0b:ea1e  bf f8 00 78   lda $7800f8,x
$0b:ea22  30 03		 bmi $ea27
$0b:ea24  d0 7a		 bne $eaa0
$0b:ea26  3a			dec a
$0b:ea27  35 00		 and $00,x
$0b:ea29  15 ff		 ora $ff,x
$0b:ea2b  30 db		 bmi $ea08
$0b:ea2d  ff c4 cb 71   sbc $71cbc4,x
$0b:ea31  f8			sed
$0b:ea32  51 f8		 eor ($f8),y
$0b:ea34  11 cc		 ora ($cc),y
$0b:ea36  1a			inc a
$0b:ea37  31 55		 and ($55),y
$0b:ea39  c2 be		 rep #$be
$0b:ea3b  09 fc 01	  ora #$01fc
$0b:ea3e  02 0e		 cop #$0e
$0b:ea40  f0 80		 beq $e9c2
$0b:ea42  c0 7f df	  cpy #$df7f
$0b:ea45  e8			inx
$0b:ea46  0f fc a7 0e   ora $0ea7fc
$0b:ea4a  d0 80		 bne $e9cc
$0b:ea4c  ab			plb
$0b:ea4d  8c c4 f7	  sty $f7c4
$0b:ea50  f3 80		 sbc ($80,s),y
$0b:ea52  18			clc
$0b:ea53  a9 d6 88	  lda #$88d6
$0b:ea56  28			plp
$0b:ea57  87 84		 sta [$84]
$0b:ea59  41 03		 eor ($03,x)
$0b:ea5b  67 ff		 adc [$ff]
$0b:ea5d  47 8a		 eor [$8a]
$0b:ea5f  0e fe 08	  asl $08fe
$0b:ea62  1c 80 7f	  trb $7f80
$0b:ea65  bf 9f c6 25   lda $25c69f,x
$0b:ea69  c0 7f 90	  cpy #$907f
$0b:ea6c  34 15		 bit $15,x
$0b:ea6e  5f a0 37 88   eor $8837a0,x
$0b:ea72  3c 0c e1	  bit $e10c,x
$0b:ea75  21 26		 and ($26,x)
$0b:ea77  41 34		 eor ($34,x)
$0b:ea79  c7 fd		 cmp [$fd]
$0b:ea7b  c7 fc		 cmp [$fc]
$0b:ea7d  0f 41 23 0f   ora $0f2341
$0b:ea81  fe 59 01	  inc $0159,x
$0b:ea84  48			pha
$0b:ea85  02 7e		 cop #$7e
$0b:ea87  04 9c		 tsb $9c
$0b:ea89  35 fa		 and $fa,x
$0b:ea8b  39 fc b8	  and $b8fc,y
$0b:ea8e  7c 30 18	  jmp ($1830,x)
$0b:ea91  06 bd		 asl $bd
$0b:ea93  7c 21 f8	  jmp ($f821,x)
$0b:ea96  07 b3		 ora [$b3]
$0b:ea98  bd 80 de	  lda $de80,x
$0b:ea9b  86 e0		 stx $e0
$0b:ea9d  7a			ply
$0b:ea9e  a3 fd		 lda $fd,s
$0b:eaa0  80 2c		 bra $eace
$0b:eaa2  23 27		 and $27,s
$0b:eaa4  08			php
$0b:eaa5  7c 61 f0	  jmp ($f061,x)
$0b:eaa8  61 a2		 adc ($a2,x)
$0b:eaaa  9f fb 8d 3f   sta $3f8dfb,x
$0b:eaae  8c 7f ec	  sty $ec7f
$0b:eab1  7f cc 7f c0   adc $c07fcc,x
$0b:eab5  66 c7		 ror $c7
$0b:eab7  fe 9f 70	  inc $709f,x
$0b:eaba  4b			phk
$0b:eabb  e1 ff		 sbc ($ff,x)
$0b:eabd  69 09 78	  adc #$7809
$0b:eac0  3f 9f c8 00   and $00c89f,x
$0b:eac4  c8			iny
$0b:eac5  07 ce		 ora [$ce]
$0b:eac7  5f 21 29 19   eor $192921,x
$0b:eacb  41 df		 eor ($df,x)
$0b:eacd  8e c1 7f	  stx $7fc1
$0b:ead0  e1 ff		 sbc ($ff,x)
$0b:ead2  08			php
$0b:ead3  b0 26		 bcs $eafb
$0b:ead5  de 3c e2	  dec $e23c,x
$0b:ead8  39 e0 b8	  and $b8e0,y
$0b:eadb  e0 43 b0	  cpx #$b043
$0b:eade  e3 37		 sbc $37,s
$0b:eae0  60			rts
$0b:eae1  b4 8c		 ldy $8c,x
$0b:eae3  a1 22		 lda ($22,x)
$0b:eae5  6e 9f bc	  ror $bc9f
$0b:eae8  03 fe		 ora $fe,s
$0b:eaea  fb			xce
$0b:eaeb  23 9a		 and $9a,s
$0b:eaed  07 3d		 ora [$3d]
$0b:eaef  6e 21 18	  ror $1821
$0b:eaf2  69 01 f7	  adc #$f701
$0b:eaf5  d1 c6		 cmp ($c6),y
$0b:eaf7  d2 08		 cmp ($08)
$0b:eaf9  3f fe 39 fc   and $fc39fe,x
$0b:eafd  b8			clv
$0b:eafe  fc 38 fc	  jsr ($fc38,x)
$0b:eb01  04 ec		 tsb $ec
$0b:eb03  40			rti
$0b:eb04  e0 10 f3	  cpx #$f310
$0b:eb07  70 3b		 bvs $eb44
$0b:eb09  07 f1		 ora [$f1]
$0b:eb0b  f8			sed
$0b:eb0c  b8			clv
$0b:eb0d  2e 83 83	  rol $8383
$0b:eb10  1c 80 dc	  trb $dc80
$0b:eb13  20 3c 68	  jsr $683c
$0b:eb16  3c 72 3e	  bit $3e72,x
$0b:eb19  98			tya
$0b:eb1a  0f c4 1e 1d   ora $1d1ec4
$0b:eb1e  01 65		 ora ($65,x)
$0b:eb20  82 58 bf	  brl $aa7b
$0b:eb23  30 0f		 bmi $eb34
$0b:eb25  09 b0 4d	  ora #$4db0
$0b:eb28  80 7c		 bra $eba6
$0b:eb2a  03 c9		 ora $c9,s
$0b:eb2c  1e 50 1c	  asl $1c50,x
$0b:eb2f  40			rti
$0b:eb30  0f 76 1f e7   ora $e71f76
$0b:eb34  f1 e3		 sbc ($e3),y
$0b:eb36  f0 63		 beq $eb9b
$0b:eb38  f0 0f		 beq $eb49
$0b:eb3a  e8			inx
$0b:eb3b  83 c0		 sta $c0,s
$0b:eb3d  23 ef		 and $ef,s
$0b:eb3f  00 76		 brk #$76
$0b:eb41  1a			inc a
$0b:eb42  3e 13 00	  rol $0013,x
$0b:eb45  fd f3 60	  sbc $60f3,x
$0b:eb48  40			rti
$0b:eb49  7f df e5 98   adc $98e5df,x
$0b:eb4d  14 d0		 trb $d0
$0b:eb4f  76 90		 ror $90,x
$0b:eb51  10 37		 bpl $eb8a
$0b:eb53  bb			tyx
$0b:eb54  49 38 18	  eor #$1838
$0b:eb57  0f fe f3 07   ora $07f3fe
$0b:eb5b  f1 c7		 sbc ($c7),y
$0b:eb5d  9c 54 54	  stz $5454
$0b:eb60  28			plp
$0b:eb61  74 37		 stz $37,x
$0b:eb63  c4 7b		 cpy $7b
$0b:eb65  ff 78 ff f8   sbc $f8ff78,x
$0b:eb69  ff 87 f6 19   sbc $19f687,x
$0b:eb6d  31 be		 and ($be),y
$0b:eb6f  06 61		 asl $61
$0b:eb71  e0 80 07	  cpx #$0780
$0b:eb74  01 3f		 ora ($3f,x)
$0b:eb76  e4 a5		 cpx $a5
$0b:eb78  fe 27 80	  inc $8027,x
$0b:eb7b  be 46 15	  ldx $1546,y
$0b:eb7e  55 87		 eor $87,x
$0b:eb80  f2 06		 sbc ($06)
$0b:eb82  32 4c		 and ($4c)
$0b:eb84  05 fd		 ora $fd
$0b:eb86  df 41 e7 36   cmp $36e741,x
$0b:eb8a  c8			iny
$0b:eb8b  3e 9f be	  rol $be9f,x
$0b:eb8e  26 78		 rol $78
$0b:eb90  fc 7e fe	  jsr ($fe7e,x)
$0b:eb93  fc 05 5c	  jsr ($5c05,x)
$0b:eb96  ae da 03	  ldx $03da
$0b:eb99  ff 27 d0 77   sbc $77d027,x
$0b:eb9d  da			phx
$0b:eb9e  29 00 82	  and #$8200
$0b:eba1  40			rti
$0b:eba2  21 70		 and ($70,x)
$0b:eba4  38			sec
$0b:eba5  a4 1e		 ldy $1e
$0b:eba7  13 0e		 ora ($0e,s),y
$0b:eba9  95 c3		 sta $c3,x
$0b:ebab  0d e9 07	  ora $07e9
$0b:ebae  80 1f		 bra $ebcf
$0b:ebb0  82 31 00	  brl $ebe4
$0b:ebb3  88			dey
$0b:ebb4  40			rti
$0b:ebb5  26 07		 rol $07
$0b:ebb7  41 89		 eor ($89,x)
$0b:ebb9  c0 e5 90	  cpy #$90e5
$0b:ebbc  fa			plx
$0b:ebbd  9c 72 4b	  stz $4b72
$0b:ebc0  3b			tsc
$0b:ebc1  d6 cd		 dec $cd,x
$0b:ebc3  28			plp
$0b:ebc4  17 8a		 ora [$8a],y
$0b:ebc6  ed a1 0a	  sbc $0aa1
$0b:ebc9  11 c4		 ora ($c4),y
$0b:ebcb  60			rts
$0b:ebcc  d8			cld
$0b:ebcd  20 14 08	  jsr $0814
$0b:ebd0  07 0e		 ora [$0e]
$0b:ebd2  01 84		 ora ($84,x)
$0b:ebd4  80 61		 bra $ec37
$0b:ebd6  51 c9		 eor ($c9),y
$0b:ebd8  08			php
$0b:ebd9  a8			tay
$0b:ebda  40			rti
$0b:ebdb  24 12		 bit $12
$0b:ebdd  0d 1c 0e	  ora $0e1c
$0b:ebe0  89 47 a2	  bit #$a247
$0b:ebe3  d1 93		 cmp ($93),y
$0b:ebe5  e5 34		 sbc $34
$0b:ebe7  80 5c		 bra $ec45
$0b:ebe9  20 14 38	  jsr $3814
$0b:ebec  07 92		 ora [$92]
$0b:ebee  01 88		 ora ($88,x)
$0b:ebf0  65 08		 adc $08
$0b:ebf2  cc 11 e9	  cpy $e911
$0b:ebf5  17 8c		 ora [$8c],y
$0b:ebf7  57 22		 eor [$22],y
$0b:ebf9  72 99		 adc ($99)
$0b:ebfb  bc aa 6c	  ldy $6caa,x
$0b:ebfe  33 04		 and ($04,s),y
$0b:ec00  fa			plx
$0b:ec01  48			pha
$0b:ec02  14 86		 trb $86
$0b:ec04  a7 00		 lda [$00]
$0b:ec06  70 92		 bvs $eb9a
$0b:ec08  40			rti
$0b:ec09  72 2f		 adc ($2f)
$0b:ec0b  54 be 7f	  mvn $7f,$be
$0b:ec0e  06 61		 asl $61
$0b:ec10  7f 1e c4 02   adc $02c41e,x
$0b:ec14  06 ee		 asl $ee
$0b:ec16  27 78		 and [$78]
$0b:ec18  ff 3f 9f 1f   sbc $1f9f3f,x
$0b:ec1c  87 1f		 sta [$1f]
$0b:ec1e  81 1c		 sta ($1c,x)
$0b:ec20  81 dc		 sta ($dc,x)
$0b:ec22  61 c0		 adc ($c0,x)
$0b:ec24  f2 1e		 sbc ($1e)
$0b:ec26  00 34		 brk #$34
$0b:ec28  21 f0		 and ($f0,x)
$0b:ec2a  09 f8 80	  ora #$80f8
$0b:ec2d  c1 e8		 cmp ($e8,x)
$0b:ec2f  1d 0e 3c	  ora $3c0e,x
$0b:ec32  e2 39		 sep #$39
$0b:ec34  e0 b8		 cpx #$b8
$0b:ec36  e0 78		 cpx #$78
$0b:ec38  e8			inx
$0b:ec39  50 10		 bvc $ec4b
$0b:ec3b  19 05 3f	  ora $3f05,y
$0b:ec3e  d0 0f		 bne $ec4f
$0b:ec40  c2 04		 rep #$04
$0b:ec42  7f a0 d0 fe   adc $fed0a0,x
$0b:ec46  71 e0		 adc ($e0),y
$0b:ec48  d1 e8		 cmp ($e8),y
$0b:ec4a  f5 fa		 sbc $fa,x
$0b:ec4c  fd fe 2d	  sbc $2dfe,x
$0b:ec4f  8a			txa
$0b:ec50  0c 05 61	  tsb $6105
$0b:ec53  fc 81 fe	  jsr ($fe81,x)
$0b:ec56  60			rts
$0b:ec57  1e 18 06	  asl $0618,x
$0b:ec5a  04 9e		 tsb $9e
$0b:ec5c  06 a1		 asl $a1
$0b:ec5e  e3 ef		 sbc $ef,s
$0b:ec60  f3 df		 sbc ($df,s),y
$0b:ec62  ff c7 ff c7   sbc $c7ffc7,x
$0b:ec66  fc c7 7c	  jsr ($7cc7,x)
$0b:ec69  37 1c		 and [$1c],y
$0b:ec6b  0f 06 02 fe   ora $fe0206
$0b:ec6f  f6 08		 inc $08,x
$0b:ec71  01 fe		 ora ($fe,x)
$0b:ec73  9f e0 77 09   sta $0977e0,x
$0b:ec77  c1 e8		 cmp ($e8,x)
$0b:ec79  20 0f 20	  jsr $200f
$0b:ec7c  03 a7		 ora $a7,s
$0b:ec7e  fd 3a 04	  sbc $043a,x
$0b:ec81  09 01		 ora #$01
$0b:ec83  c1 38		 cmp ($38,x)
$0b:ec85  60			rts
$0b:ec86  0e 11 81	  asl $8111
$0b:ec89  a7 7c		 lda [$7c]
$0b:ec8b  9c 30 68	  stz $6830
$0b:ec8e  08			php
$0b:ec8f  6c 2e 50	  jmp ($502e)
$0b:ec92  de 74 c6	  dec $c674,x
$0b:ec95  79 c1 33	  adc $33c1,y
$0b:ec98  82 f7 e0	  brl $cd92
$0b:ec9b  10 48		 bpl $ece5
$0b:ec9d  04 4e		 tsb $4e
$0b:ec9f  07 2c		 ora [$2c]
$0b:eca1  87 d4		 sta [$d4]
$0b:eca3  a3 d2		 lda $d2,s
$0b:eca5  89 c6		 bit #$c6
$0b:eca7  82 61 50	  brl $3d0b
$0b:ecaa  b8			clv
$0b:ecab  50 6c		 bvc $ed19
$0b:ecad  2b			pld
$0b:ecae  91 80		 sta ($80),y
$0b:ecb0  4c 20 16	  jmp $1620
$0b:ecb3  18			clc
$0b:ecb4  05 12		 ora $12
$0b:ecb6  01 c8		 ora ($c8,x)
$0b:ecb8  80 1a		 bra $ecd4
$0b:ecba  43 25		 eor $25,s
$0b:ecbc  00 77		 brk #$77
$0b:ecbe  84 42		 sty $42
$0b:ecc0  01 20		 ora ($20,x)
$0b:ecc2  80 50		 bra $ed14
$0b:ecc4  20 10 b8	  jsr $b810
$0b:ecc7  1e 12 0f	  asl $0f12,x
$0b:ecca  09 87		 ora #$87
$0b:eccc  42 e1		 wdm #$e1
$0b:ecce  83 e0		 sta $e0,s
$0b:ecd0  8c 04 86	  sty $8604
$0b:ecd3  87 00		 sta [$00]
$0b:ecd5  a6 40		 ldx $40
$0b:ecd7  31 10		 and ($10),y
$0b:ecd9  0c 80 a8	  tsb $a880
$0b:ecdc  56 29		 lsr $29,x
$0b:ecde  10 08		 bpl $ece8
$0b:ece0  82 b2 42	  brl $2f95
$0b:ece3  21 28		 and ($28,x)
$0b:ece5  08			php
$0b:ece6  08			php
$0b:ece7  ed c2 21	  sbc $21c2
$0b:ecea  10 aa		 bpl $ec96
$0b:ecec  5b			tcd
$0b:eced  06 82		 asl $82
$0b:ecef  36 72		 rol $72,x
$0b:ecf1  28			plp
$0b:ecf2  18			clc
$0b:ecf3  51 98		 eor ($98),y
$0b:ecf5  54 0a 04	  mvn $04,$0a
$0b:ecf8  0a			asl a
$0b:ecf9  45 38		 eor $38
$0b:ecfb  96 4e		 stx $4e,y
$0b:ecfd  20 13 8b	  jsr $8b13
$0b:ed00  46 03		 lsr $03
$0b:ed02  11 04		 ora ($04),y
$0b:ed04  77 81		 adc [$81],y
$0b:ed06  f7 d9		 sbc [$d9],y
$0b:ed08  81 44		 sta ($44,x)
$0b:ed0a  a2 44		 ldx #$44
$0b:ed0c  27 13		 and [$13]
$0b:ed0e  89 42		 bit #$42
$0b:ed10  4c 12 20	  jmp $2012
$0b:ed13  cc 2c 11	  cpy $112c
$0b:ed16  10 53		 bpl $ed6b
$0b:ed18  44 07 02	  mvp $02,$07
$0b:ed1b  28			plp
$0b:ed1c  27 c0		 and [$c0]
$0b:ed1e  9e 89 50	  stz $5089,x
$0b:ed21  dd 71 92	  cmp $9271,x
$0b:ed24  a0 57		 ldy #$57
$0b:ed26  a1 bd		 lda ($bd,x)
$0b:ed28  8d 85 32	  sta $3285
$0b:ed2b  43 54		 eor $54,s
$0b:ed2d  1b			tcs
$0b:ed2e  22 ac 9b ac   jsl $ac9bac
$0b:ed32  f0 ec		 beq $ed20
$0b:ed34  01 a1		 ora ($a1,x)
$0b:ed36  91 82		 sta ($82),y
$0b:ed38  7c 08 14	  jmp ($1408,x)
$0b:ed3b  0e 0b 06	  asl $060b
$0b:ed3e  07 84		 ora [$84]
$0b:ed40  06 02		 asl $02
$0b:ed42  85 a0		 sta $a0
$0b:ed44  68			pla
$0b:ed45  a1 de		 lda ($de,x)
$0b:ed47  03 02		 ora $02,s
$0b:ed49  85 c3		 sta $c3
$0b:ed4b  02 21		 cop #$21
$0b:ed4d  04 83		 tsb $83
$0b:ed4f  c0 e0		 cpy #$e0
$0b:ed51  61 d6		 adc ($d6,x)
$0b:ed53  75 94		 adc $94,x
$0b:ed55  21 18		 and ($18,x)
$0b:ed57  30 54		 bmi $edad
$0b:ed59  3b			tsc
$0b:ed5a  c8			iny
$0b:ed5b  24 0d		 bit $0d
$0b:ed5d  76 74		 ror $74,x
$0b:ed5f  91 f0		 sta ($f0),y
$0b:ed61  01 20		 ora ($20,x)
$0b:ed63  7c 00 b0	  jmp ($b000,x)
$0b:ed66  15 00		 ora $00,x
$0b:ed68  8a			txa
$0b:ed69  5c 0a 01 bd   jml $bd010a
$0b:ed6d  0e 01 20	  asl $2001
$0b:ed70  b0 58		 bcs $edca
$0b:ed72  24 11		 bit $11
$0b:ed74  09 83		 ora #$83
$0b:ed76  c3 c9		 cmp $c9,s
$0b:ed78  6e 7b 03	  ror $037b
$0b:ed7b  70 1b		 bvs $ed98
$0b:ed7d  c1 0f		 cmp ($0f,x)
$0b:ed7f  e2 c2		 sep #$c2
$0b:ed81  07 04		 ora [$04]
$0b:ed83  06 0b		 asl $0b
$0b:ed85  03 85		 ora $85,s
$0b:ed87  41 a1		 eor ($a1,x)
$0b:ed89  90 48		 bcc $edd3
$0b:ed8b  a4 31		 ldy $31
$0b:ed8d  45 d0		 eor $d0
$0b:ed8f  f8			sed
$0b:ed90  85 7e		 sta $7e
$0b:ed92  7f 60 f0 60   adc $60f060,x
$0b:ed96  00 2c		 brk #$2c
$0b:ed98  dd f3 b0	  cmp $b0f3,x
$0b:ed9b  42 21		 wdm #$21
$0b:ed9d  72 69		 adc ($69)
$0b:ed9f  7d 72 8f	  adc $8f72,x
$0b:eda2  16 99		 asl $99,x
$0b:eda4  c2 2f		 rep #$2f
$0b:eda6  32 5c		 and ($5c)
$0b:eda8  bd a3 30	  lda $30a3,x
$0b:edab  ee 0a 5d	  inc $5d0a
$0b:edae  02 9f		 cop #$9f
$0b:edb0  60			rts
$0b:edb1  9d df 21	  sta $21df,x
$0b:edb4  b3 eb		 lda ($eb,s),y
$0b:edb6  bc 3b 23	  ldy $233b,x
$0b:edb9  6e cc 59	  ror $59cc
$0b:edbc  d2 61		 cmp ($61)
$0b:edbe  44 a2 0d	  mvp $0d,$a2
$0b:edc1  42 45		 wdm #$45
$0b:edc3  2b			pld
$0b:edc4  7a			ply
$0b:edc5  8d ce 51	  sta $51ce
$0b:edc8  99 b2 e5	  sta $e5b2,y
$0b:edcb  cc 81 04	  cpy $0481
$0b:edce  a4 51		 ldy $51
$0b:edd0  e9 14 bb	  sbc #$bb14
$0b:edd3  20 14 29	  jsr $2914
$0b:edd6  b3 ec		 lda ($ec,s),y
$0b:edd8  bd b8 16	  lda $16b8,x
$0b:eddb  09 30 10	  ora #$1030
$0b:edde  01 4c		 ora ($4c,x)
$0b:ede0  39 1e 8b	  and $8b1e,y
$0b:ede3  a7 13		 lda [$13]
$0b:ede5  a0 fe		 ldy #$fe
$0b:ede7  09 c5 03	  ora #$03c5
$0b:edea  a8			tay
$0b:edeb  93 1a		 sta ($1a,s),y
$0b:eded  24 93		 bit $93
$0b:edef  09 e4 86	  ora #$86e4
$0b:edf2  6e 2f 96	  ror $962f
$0b:edf5  0f c7 23 e1   ora $e123c7
$0b:edf9  14 f4		 trb $f4
$0b:edfb  1d 81 2c	  ora $2c81,x
$0b:edfe  32 0a		 and ($0a)
$0b:ee00  65 06		 adc $06
$0b:ee02  39 3d 80	  and $803d,y
$0b:ee05  c7 e1		 cmp [$e1]
$0b:ee07  91 c8		 sta ($c8),y
$0b:ee09  45 e1		 eor $e1
$0b:ee0b  dc 27 60	  jml [$6027]
$0b:ee0e  b0 4f		 bcs $ee5f
$0b:ee10  ef d0 39 f4   sbc $f439d0
$0b:ee14  66 0d		 ror $0d
$0b:ee16  1c 81 de	  trb $de81
$0b:ee19  20 e6 20	  jsr $20e6
$0b:ee1c  28			plp
$0b:ee1d  bc fe 59	  ldy $59fe,x
$0b:ee20  7c 96 67	  jmp ($6796,x)
$0b:ee23  0b			phd
$0b:ee24  f1 39		 sbc ($39),y
$0b:ee26  83 5f		 sta $5f,s
$0b:ee28  20 79 cb	  jsr $cb79
$0b:ee2b  18			clc
$0b:ee2c  80 19		 bra $ee47
$0b:ee2e  41 08		 eor ($08,x)
$0b:ee30  84 59		 sty $59
$0b:ee32  20 97 02	  jsr $0297
$0b:ee35  f0 7c		 beq $eeb3
$0b:ee37  2c 17 44	  bit $4417
$0b:ee3a  98			tya
$0b:ee3b  07 c4		 ora [$c4]
$0b:ee3d  40			rti
$0b:ee3e  10 cf		 bpl $ee0f
$0b:ee40  c7 f3		 cmp [$f3]
$0b:ee42  01 f8		 ora ($f8,x)
$0b:ee44  98			tya
$0b:ee45  70 2e		 bvs $ee75
$0b:ee47  98			tya
$0b:ee48  88			dey
$0b:ee49  47 c1		 eor [$c1]
$0b:ee4b  94 30		 sty $30,x
$0b:ee4d  38			sec
$0b:ee4e  b4 42		 ldy $42,x
$0b:ee50  1f 0f 80 1e   ora $1e800f,x
$0b:ee54  82 c3 73	  brl $621a
$0b:ee57  b0 41		 bcs $ee9a
$0b:ee59  29 8b 01	  and #$018b
$0b:ee5c  80 43		 bra $eea1
$0b:ee5e  e3 f1		 sbc $f1,s
$0b:ee60  08			php
$0b:ee61  fc 9e 31	  jsr ($319e,x)
$0b:ee64  7f 8f 5f e3   adc $e35f8f,x
$0b:ee68  f4 b9 bb	  pea $bbb9
$0b:ee6b  a4 30		 ldy $30
$0b:ee6d  18			clc
$0b:ee6e  03 10		 ora $10,s
$0b:ee70  48			pha
$0b:ee71  38			sec
$0b:ee72  15 0f		 ora $0f,x
$0b:ee74  46 03		 lsr $03
$0b:ee76  71 40		 adc ($40),y
$0b:ee78  ac 68 3d	  ldy $3d68
$0b:ee7b  88			dey
$0b:ee7c  01 e0		 ora ($e0,x)
$0b:ee7e  60			rts
$0b:ee7f  3c 14 0d	  bit $0d14,x
$0b:ee82  86 a2		 stx $a2
$0b:ee84  a1 78		 lda ($78,x)
$0b:ee86  e0 66		 cpx #$66
$0b:ee88  3c 16 cc	  bit $cc16,x
$0b:ee8b  82 bc 55	  brl $444a
$0b:ee8e  e1 07		 sbc ($07,x)
$0b:ee90  59 c3 c0	  eor $c0c3,y
$0b:ee93  d8			cld
$0b:ee94  52 ef		 eor ($ef)
$0b:ee96  26 88		 rol $88
$0b:ee98  d8			cld
$0b:ee99  24 1f		 bit $1f
$0b:ee9b  0a			asl a
$0b:ee9c  07 63		 ora [$63]
$0b:ee9e  01 be		 ora ($be,x)
$0b:eea0  ad 56 95	  lda $9556
$0b:eea3  e0 df		 cpx #$df
$0b:eea5  2d 07 02	  and $0207
$0b:eea8  e1 80		 sbc ($80,x)
$0b:eeaa  cc 58 2f	  cpy $2f58
$0b:eead  dc 0c d7	  jml [$d70c]
$0b:eeb0  91 de		 sta ($de),y
$0b:eeb2  70 07		 bvs $eebb
$0b:eeb4  ae 2b c0	  ldx $c02b
$0b:eeb7  0b			phd
$0b:eeb8  bb			tyx
$0b:eeb9  0a			asl a
$0b:eeba  85 62		 sta $62
$0b:eebc  61 c4		 adc ($c4,x)
$0b:eebe  a4 79		 ldy $79
$0b:eec0  30 9b		 bmi $ee5d
$0b:eec2  ea			nop
$0b:eec3  25 78		 and $78
$0b:eec5  3e 57 07	  rol $0757,x
$0b:eec8  50 d1		 bvc $ee9b
$0b:eeca  37 1a		 and [$1a],y
$0b:eecc  4a			lsr a
$0b:eecd  c0 ac		 cpy #$ac
$0b:eecf  33 de		 and ($de,s),y
$0b:eed1  09 44 62	  ora #$6244
$0b:eed4  29 0c 85	  and #$850c
$0b:eed7  c1 e0		 cmp ($e0,x)
$0b:eed9  d0 18		 bne $eef3
$0b:eedb  08			php
$0b:eedc  bd 0f be	  lda $be0f,x
$0b:eedf  2f 4e 07 03   and $03074e
$0b:eee3  8f 3f bc 41   sta $41bc3f
$0b:eee7  d6 c0		 dec $c0,x
$0b:eee9  9c f8 04	  stz $04f8
$0b:eeec  62 11 38	  per $2700
$0b:eeef  84 48		 sty $48
$0b:eef1  22 0b 30 b0   jsl $b0300b
$0b:eef5  44 2a 13	  mvp $13,$2a
$0b:eef8  05 c9		 ora $c9
$0b:eefa  27 f8		 and [$f8]
$0b:eefc  28			plp
$0b:eefd  02 50		 cop #$50
$0b:eeff  90 2f		 bcc $ef30
$0b:ef01  bd 3f 16	  lda $163f,x
$0b:ef04  3c ee 87	  bit $87ee,x
$0b:ef07  71 45		 adc ($45),y
$0b:ef09  fe 40 af	  inc $af40,x
$0b:ef0c  d8			cld
$0b:ef0d  09 fb dc	  ora #$dcfb
$0b:ef10  79 f3 0c	  adc $0cf3,y
$0b:ef13  26 7a		 rol $7a
$0b:ef15  c1 b8		 cmp ($b8,x)
$0b:ef17  a7 ff		 lda [$ff]
$0b:ef19  23 77		 and $77,s
$0b:ef1b  ed cc ff	  sbc $ffcc
$0b:ef1e  b9 3f ef	  lda $ef3f,y
$0b:ef21  f3 e7		 sbc ($e7,s),y
$0b:ef23  f8			sed
$0b:ef24  4b			phk
$0b:ef25  e5 a3		 sbc $a3
$0b:ef27  f1 23		 sbc ($23),y
$0b:ef29  fe e0 7f	  inc $7fe0,x
$0b:ef2c  14 5b		 trb $5b
$0b:ef2e  e6 0b		 inc $0b
$0b:ef30  fd 80 cf	  sbc $cf80,x
$0b:ef33  d4 23		 pei ($23)
$0b:ef35  fa			plx
$0b:ef36  0c 7f e2	  tsb $e27f
$0b:ef39  0f fe 88 7e   ora $7e88fe
$0b:ef3d  27 f7		 and [$f7]
$0b:ef3f  cd df fa	  cmp $fadf
$0b:ef42  73 9f		 adc ($9f,s),y
$0b:ef44  b6 47		 ldx $47,y
$0b:ef46  fd f8 fb	  sbc $fbf8,x
$0b:ef49  fc a2 65	  jsr ($65a2,x)
$0b:ef4c  8e b9 43	  stx $43b9
$0b:ef4f  26 14		 rol $14
$0b:ef51  ab			plb
$0b:ef52  d6 1b		 dec $1b,x
$0b:ef54  fd 04 7a	  sbc $7a04,x
$0b:ef57  07 e2		 ora [$e2]
$0b:ef59  0d f8 99	  ora $99f8
$0b:ef5c  73 3e		 adc ($3e,s),y
$0b:ef5e  43 30		 eor $30,s
$0b:ef60  f7 5e		 sbc [$5e],y
$0b:ef62  b6 9f		 ldx $9f,y
$0b:ef64  e9 87 f2	  sbc #$f287
$0b:ef67  f5 f8		 sbc $f8,x
$0b:ef69  fb			xce
$0b:ef6a  12 c2		 ora ($c2)
$0b:ef6c  6d 96 bd	  adc $bd96
$0b:ef6f  67 a6		 adc [$a6]
$0b:ef71  79 fb 57	  adc $57fb,y
$0b:ef74  bf 11 ef aa   lda $aaef11,x
$0b:ef78  5d e0 93	  eor $93e0,x
$0b:ef7b  d8			cld
$0b:ef7c  77 ff		 adc [$ff],y
$0b:ef7e  2d 69 cf	  and $cf69
$0b:ef81  58			cli
$0b:ef82  73 f6		 adc ($f6,s),y
$0b:ef84  0f 7c 40 ca   ora $ca407c
$0b:ef88  17 7c		 ora [$7c],y
$0b:ef8a  44 f7 c5	  mvp $c5,$f7
$0b:ef8d  ff a8 4b 33   sbc $334ba8,x
$0b:ef91  97 ec		 sta [$ec],y
$0b:ef93  f4 eb 3d	  pea $3deb
$0b:ef96  71 ef		 adc ($ef),y
$0b:ef98  c2 29		 rep #$29
$0b:ef9a  f0 88		 beq $ef24
$0b:ef9c  7c 52 7f	  jmp ($7f52,x)
$0b:ef9f  0c 9e e7	  tsb $e79e
$0b:efa2  2c 66 10	  bit $1066
$0b:efa5  30 87		 bmi $ef2e
$0b:efa7  7e 41 4f	  ror $4f41,x
$0b:efaa  98			tya
$0b:efab  43 e6		 eor $e6,s
$0b:efad  13 f8		 ora ($f8,s),y
$0b:efaf  04 f6		 tsb $f6
$0b:efb1  45 08		 eor $08
$0b:efb3  84 7c		 sty $7c
$0b:efb5  3f 9a 8f 95   and $958f9a,x
$0b:efb9  72 e5		 adc ($e5)
$0b:efbb  a8			tay
$0b:efbc  f1 4b		 sbc ($4b),y
$0b:efbe  3d d5 2e	  and $2ed5,x
$0b:efc1  f5 12		 sbc $12,x
$0b:efc3  f8			sed
$0b:efc4  90 18		 bcc $efde
$0b:efc6  01 04		 ora ($04,x)
$0b:efc8  2e 58 cf	  rol $cf58
$0b:efcb  14 73		 trb $73
$0b:efcd  dd 10 ef	  cmp $ef10,x
$0b:efd0  48			pha
$0b:efd1  02 c1		 cop #$c1
$0b:efd3  6b			rtl
$0b:efd4  af cc a1 f2   lda $f2a1cc
$0b:efd8  88			dey
$0b:efd9  7d 42 bf	  adc $bf42,x
$0b:efdc  02 bf		 cop #$bf
$0b:efde  c0 20		 cpy #$20
$0b:efe0  6b			rtl
$0b:efe1  91 87		 sta ($87),y
$0b:efe3  22 c2 1f 70   jsl $701fc2
$0b:efe7  60			rts
$0b:efe8  85 7e		 sta $7e
$0b:efea  4f 7f 82 c0   eor $c0827f
$0b:efee  e0 30		 cpx #$30
$0b:eff0  38			sec
$0b:eff1  1c 3a 1b	  trb $1b3a
$0b:eff4  08			php
$0b:eff5  50 86		 bvc $ef7d
$0b:eff7  72 c1		 adc ($c1)
$0b:eff9  0e b1 43	  asl $43b1
$0b:effc  a2 d9		 ldx #$d9
$0b:effe  e9 07 ea	  sbc #$ea07
$0b:f001  a5 da		 lda $da
$0b:f003  e1 42		 sbc ($42,x)
$0b:f005  9a			txs
$0b:f006  07 f0		 ora [$f0]
$0b:f008  87 7e		 sta [$7e]
$0b:f00a  33 d6		 and ($d6,s),y
$0b:f00c  8f d6 33 b5   sta $b533d6
$0b:f010  2c 6f 04	  bit $046f
$0b:f013  12 98		 ora ($98)
$0b:f015  af 7b f3 28   lda $28f37b
$0b:f019  17 21		 ora [$21],y
$0b:f01b  4b			phk
$0b:f01c  9b			txy
$0b:f01d  cf d8 09 26   cmp $2609d8
$0b:f021  bf 32 01 72   lda $720132,x
$0b:f025  10 3d		 bpl $f064
$0b:f027  47 b1		 eor [$b1]
$0b:f029  9e 3c c9	  stz $c93c,x
$0b:f02c  86 1a		 stx $1a
$0b:f02e  65 86		 adc $86
$0b:f030  85 73		 sta $73
$0b:f032  a0 9f		 ldy #$9f
$0b:f034  68			pla
$0b:f035  c7 0a		 cmp [$0a]
$0b:f037  d9 90 09	  cmp $0990,y
$0b:f03a  1d e3 0d	  ora $0de3,x
$0b:f03d  f8			sed
$0b:f03e  e7 6c		 sbc [$6c]
$0b:f040  3e d4 ae	  rol $aed4,x
$0b:f043  16 f9		 asl $f9,x
$0b:f045  de b0 ea	  dec $eab0,x
$0b:f048  85 7a		 sta $7a
$0b:f04a  00 b8		 brk #$b8
$0b:f04c  19 5c a1	  ora $a15c,y
$0b:f04f  fe 90 eb	  inc $eb90,x
$0b:f052  8d 79 8c	  sta $8c79
$0b:f055  10 66		 bpl $f0bd
$0b:f057  58			cli
$0b:f058  4a			lsr a
$0b:f059  22 fa 0f 74   jsl $740ffa
$0b:f05d  e3 fd		 sbc $fd,s
$0b:f05f  00 96		 brk #$96
$0b:f061  70 22		 bvs $f085
$0b:f063  dc 28 b4	  jml [$b428]
$0b:f066  9a			txs
$0b:f067  7d 48 fd	  adc $fd48,x
$0b:f06a  62 bf 56	  per $472c
$0b:f06d  ec 81 48	  cpx $4881
$0b:f070  7a			ply
$0b:f071  11 6f		 ora ($6f),y
$0b:f073  44 5b f1	  mvp $f1,$5b
$0b:f076  3e ec 7e	  rol $7eec,x
$0b:f079  a2 9f		 ldx #$9f
$0b:f07b  a9 a4 02	  lda #$02a4
$0b:f07e  01 10		 ora ($10,x)
$0b:f080  88			dey
$0b:f081  4b			phk
$0b:f082  24 97		 bit $97
$0b:f084  eb			xba
$0b:f085  f5 ae		 sbc $ae,x
$0b:f087  c5 5c		 cmp $5c
$0b:f089  ae c8 f4	  ldx $f4c8
$0b:f08c  5c be 11 bc   jml $bc11be
$0b:f090  24 10		 bit $10
$0b:f092  08			php
$0b:f093  c4 f2		 cpy $f2
$0b:f095  03 62		 ora $62,s
$0b:f097  8e 50 24	  stx $2450
$0b:f09a  51 ca		 eor ($ca),y
$0b:f09c  e4 fa		 cpx $fa
$0b:f09e  79 7e 37	  adc $377e,y
$0b:f0a1  84 c2		 sty $c2
$0b:f0a3  21 53		 and ($53,x)
$0b:f0a5  80 ed		 bra $f094
$0b:f0a7  64 1b		 stz $1b
$0b:f0a9  aa			tax
$0b:f0aa  07 fb		 ora [$fb]
$0b:f0ac  c5 5d		 cmp $5d
$0b:f0ae  8a			txa
$0b:f0af  78			sei
$0b:f0b0  e9 31 08	  sbc #$0831
$0b:f0b3  04 06		 tsb $06
$0b:f0b5  01 60		 ora ($60,x)
$0b:f0b7  80 51		 bra $f10a
$0b:f0b9  a0 10		 ldy #$10
$0b:f0bb  c5 00		 cmp $00
$0b:f0bd  f8			sed
$0b:f0be  e0 1f		 cpx #$1f
$0b:f0c0  7a			ply
$0b:f0c1  09 bc 15	  ora #$15bc
$0b:f0c4  ed 60 b0	  sbc $b060
$0b:f0c7  54 23 1d	  mvn $1d,$23
$0b:f0ca  08			php
$0b:f0cb  22 be 30 10   jsl $1030be
$0b:f0cf  0f 04 03 f0   ora $f00304
$0b:f0d3  af 59 84 c2   lda $c28459
$0b:f0d7  e0 d7		 cpx #$d7
$0b:f0d9  56 7f		 lsr $7f,x
$0b:f0db  52 29		 eor ($29)
$0b:f0dd  f1 0b		 sbc ($0b),y
$0b:f0df  fc 23 ff	  jsr ($ff23,x)
$0b:f0e2  38			sec
$0b:f0e3  ff c2 31 f5   sbc $f531c2,x
$0b:f0e7  0e f8 e4	  asl $e4f8
$0b:f0ea  61 f4		 adc ($f4,x)
$0b:f0ec  f9 bd fe	  sbc $febd,y
$0b:f0ef  97 ff		 sta [$ff],y
$0b:f0f1  e1 ff		 sbc ($ff,x)
$0b:f0f3  f0 f8		 beq $f0ed
$0b:f0f5  ff bf 7f 4f   sbc $4f7fbf,x
$0b:f0f9  7f bf c3 e1   adc $e1c3bf,x
$0b:f0fd  f2 0b		 sbc ($0b)
$0b:f0ff  e0 e4		 cpx #$e4
$0b:f101  1e 20 39	  asl $3920,x
$0b:f104  07 9b		 ora [$9b]
$0b:f106  5f 21 80 b0   eor $b08021,x
$0b:f10a  00 85		 brk #$85
$0b:f10c  fe c6 03	  inc $03c6,x
$0b:f10f  68			pla
$0b:f110  15 e2		 ora $e2,x
$0b:f112  05 e6		 ora $e6
$0b:f114  8c 70 a4	  sty $a470
$0b:f117  9e 48 87	  stz $8748,x
$0b:f11a  f2 00		 sbc ($00)
$0b:f11c  38			sec
$0b:f11d  0f c4 03 81   ora $8103c4
$0b:f121  78			sei
$0b:f122  bb			tyx
$0b:f123  79 bf 1c	  adc $1cbf,y
$0b:f126  2d e7 93	  and $93e7
$0b:f129  31 fc		 and ($fc),y
$0b:f12b  f2 7f		 sbc ($7f)
$0b:f12d  3f 9f 8f c7   and $c78f9f,x
$0b:f131  03 81		 ora $81,s
$0b:f133  0a			asl a
$0b:f134  bd c2 6f	  lda $6fc2,x
$0b:f137  34 6f		 bit $6f,x
$0b:f139  fd 83 ff	  sbc $ff83,x
$0b:f13c  30 ff		 bmi $f13d
$0b:f13e  c8			iny
$0b:f13f  3d ef b2	  and $b2ef,x
$0b:f142  bd d1 2f	  lda $2fd1,x
$0b:f145  32 6f		 and ($6f)
$0b:f147  fe 83 ff	  inc $ff83,x
$0b:f14a  90 ff		 bcc $f14b
$0b:f14c  e3 fd		 sbc $fd,s
$0b:f14e  fd 70 59	  sbc $5970,x
$0b:f151  41 af		 eor ($af,x)
$0b:f153  f2 a2		 sbc ($a2)
$0b:f155  80 c1		 bra $f118
$0b:f157  bf f4 0f fd   lda $fd0ff4,x
$0b:f15b  c0 ac		 cpy #$ac
$0b:f15d  56 fb		 lsr $fb,x
$0b:f15f  fd 42 f7	  sbc $f742,x
$0b:f162  04 29		 tsb $29
$0b:f164  09 90 32	  ora #$3290
$0b:f167  26 70		 rol $70
$0b:f169  02 85		 cop #$85
$0b:f16b  be af e0	  ldx $e0af,y
$0b:f16e  fc 69 37	  jsr ($3769,x)
$0b:f171  90 09		 bcc $f17c
$0b:f173  f4 03 fc	  pea $fc03
$0b:f176  95 11		 sta $11,x
$0b:f178  c0 7c		 cpy #$7c
$0b:f17a  19 01 f8	  ora $f801,y
$0b:f17d  8b			phb
$0b:f17e  6f 2a 53 ee   adc $ee532a
$0b:f182  c7 fa		 cmp [$fa]
$0b:f184  3d fe ff	  and $fffe,x
$0b:f187  12 43		 ora ($43)
$0b:f189  e1 f0		 sbc ($f0,x)
$0b:f18b  c0 60		 cpy #$60
$0b:f18d  21 71		 and ($71,x)
$0b:f18f  b8			clv
$0b:f190  e4 c6		 cpx $c6
$0b:f192  31 31		 and ($31),y
$0b:f194  86 4f		 stx $4f
$0b:f196  e0 13		 cpx #$13
$0b:f198  f8			sed
$0b:f199  0c 7e 05	  tsb $057e
$0b:f19c  0e 80 c0	  asl $c080
$0b:f19f  e3 71		 sbc $71,s
$0b:f1a1  49 8c ba	  eor #$ba8c
$0b:f1a4  63 2f		 adc $2f,s
$0b:f1a6  9f cc e7 f3   sta $f3e7cc,x
$0b:f1aa  f8			sed
$0b:f1ab  fc 7a 1d	  jsr ($1d7a,x)
$0b:f1ae  0d 81 c0	  ora $c081
$0b:f1b1  24 93		 bit $93
$0b:f1b3  ee 07 fe	  inc $fe07
$0b:f1b6  00 54		 brk #$54
$0b:f1b8  19 01 94	  ora $9401,y
$0b:f1bb  33 d2		 and ($d2,s),y
$0b:f1bd  09 e6 03	  ora #$03e6
$0b:f1c0  e1 3e		 sbc ($3e,x)
$0b:f1c2  e4 7f		 cpx $7f
$0b:f1c4  e3 7f		 sbc $7f,s
$0b:f1c6  fb			xce
$0b:f1c7  ff fe 1e 67   sbc $671efe,x
$0b:f1cb  0c f5 ba	  tsb $baf5
$0b:f1ce  79 cc f8	  adc $f8cc,y
$0b:f1d1  4c 17 61	  jmp $6117
$0b:f1d4  07 8e		 ora [$8e]
$0b:f1d6  41 a7		 eor ($a7,x)
$0b:f1d8  90 35		 bcc $f20f
$0b:f1da  b0 5f		 bcs $f23b
$0b:f1dc  e1 97		 sbc ($97,x)
$0b:f1de  c8			iny
$0b:f1df  8d c5 6a	  sta $6ac5
$0b:f1e2  0c b0 8e	  tsb $8eb0
$0b:f1e5  46 e7		 lsr $e7
$0b:f1e7  93 b9		 sta ($b9,s),y
$0b:f1e9  fc f2 ff	  jsr ($fff2,x)
$0b:f1ec  7c be 5c	  jmp ($5cbe,x)
$0b:f1ef  ee 36 e9	  inc $e936
$0b:f1f2  fc 87 69	  jsr ($6987,x)
$0b:f1f5  86 a0		 stx $a0
$0b:f1f7  53 a4		 eor ($a4,s),y
$0b:f1f9  45 c0		 eor $c0
$0b:f1fb  69 0e 01	  adc #$010e
$0b:f1fe  30 5e		 bmi $f25e
$0b:f200  0c 35 ea	  tsb $ea35
$0b:f203  9d b2 bf	  sta $bfb2,x
$0b:f206  e2 7f		 sep #$7f
$0b:f208  e2 50		 sep #$50
$0b:f20a  bf ff af df   lda $dfafff,x
$0b:f20e  cb			wai
$0b:f20f  e7 83		 sbc [$83]
$0b:f211  c1 74		 cmp ($74,x)
$0b:f213  a2 58		 ldx #$58
$0b:f215  e8			inx
$0b:f216  f3 02		 sbc ($02,s),y
$0b:f218  e0 2d		 cpx #$2d
$0b:f21a  84 6a		 sty $6a
$0b:f21c  31 f2		 and ($f2),y
$0b:f21e  e8			inx
$0b:f21f  51 27		 eor ($27),y
$0b:f221  74 79		 stz $79,x
$0b:f223  c5 fe		 cmp $fe
$0b:f225  98			tya
$0b:f226  c7 02		 cmp [$02]
$0b:f228  29 47		 and #$47
$0b:f22a  e3 e6		 sbc $e6,s
$0b:f22c  d0 a9		 bne $f1d7
$0b:f22e  5c b0 9e 63   jml $639eb0
$0b:f232  d8			cld
$0b:f233  35 41		 and $41,x
$0b:f235  a6 13		 ldx $13
$0b:f237  2f 9d 13 8f   and $8f139d
$0b:f23b  30 ff		 bmi $f23c
$0b:f23d  5c b5 9e 69   jml $699eb5
$0b:f241  c7 fe		 cmp [$fe]
$0b:f243  86 e5		 stx $e5
$0b:f245  1c 1f cf	  trb $cf1f
$0b:f248  9b			txy
$0b:f249  c7 dc		 cmp [$dc]
$0b:f24b  ff b0 dc 4e   sbc $4edcb0,x
$0b:f24f  3d 60 b0	  and $b060,x
$0b:f252  17 c8		 ora [$c8],y
$0b:f254  34 16		 bit $16,x
$0b:f256  19 00 3b	  ora $3b00,y
$0b:f259  84 12		 sty $12
$0b:f25b  01 18		 ora ($18,x)
$0b:f25d  8c 4e 2f	  sty $2f4e
$0b:f260  d0 09		 bne $f26b
$0b:f262  e4 06		 cpx $06
$0b:f264  01 02		 ora ($02,x)
$0b:f266  80 43		 bra $f2ab
$0b:f268  8f 43 08 80   sta $800843
$0b:f26c  40			rti
$0b:f26d  20 15 b8	  jsr $b815
$0b:f270  85 37		 sta $37
$0b:f272  eb			xba
$0b:f273  8f b3 eb 22   sta $22ebb3
$0b:f277  70 69		 bvs $f2e2
$0b:f279  1d 8a 43	  ora $438a,x
$0b:f27c  41 82		 eor ($82,x)
$0b:f27e  58			cli
$0b:f27f  28			plp
$0b:f280  9e 74 20	  stz $2074,x
$0b:f283  c4 20		 cpy $20
$0b:f285  14 88		 trb $88
$0b:f287  05 32		 ora $32
$0b:f289  01 44		 ora ($44,x)
$0b:f28b  80 58		 bra $f2e5
$0b:f28d  90 83		 bcc $f212
$0b:f28f  54 a3 74	  mvn $74,$a3
$0b:f292  20 56 6a	  jsr $6a56
$0b:f295  1d 4a a7	  ora $a74a,x
$0b:f298  34 da		 bit $da,x
$0b:f29a  f7 bf		 sbc [$bf],y
$0b:f29c  f1 46		 sbc ($46),y
$0b:f29e  90 4f		 bcc $f2ef
$0b:f2a0  bf 14 00 e0   lda $e00014,x
$0b:f2a4  6f 20 1a c8   adc $c81a20
$0b:f2a8  05 29		 ora $29
$0b:f2aa  1a			inc a
$0b:f2ab  0c 83 b0	  tsb $b083
$0b:f2ae  33 ce		 and ($ce,s),y
$0b:f2b0  80 d5		 bra $f287
$0b:f2b2  16 41		 asl $41,x
$0b:f2b4  35 41		 and $41,x
$0b:f2b6  9f cd 50 84   sta $8450cd,x
$0b:f2ba  4f 64 5b fe   eor $fe5b64
$0b:f2be  f7 1e		 sbc [$1e],y
$0b:f2c0  2d 73 c0	  and $c073
$0b:f2c3  4e 64 b3	  lsr $b364
$0b:f2c6  7a			ply
$0b:f2c7  47 e1		 eor [$e1]
$0b:f2c9  50 17		 bvc $f2e2
$0b:f2cb  db			stp
$0b:f2cc  17 7e		 ora [$7e],y
$0b:f2ce  e1 bb		 sbc ($bb,x)
$0b:f2d0  be 53 77	  ldx $7753,y
$0b:f2d3  d2 7e		 cmp ($7e)
$0b:f2d5  f4 c7 9d	  pea $9dc7
$0b:f2d8  f8			sed
$0b:f2d9  83 d1		 sta $d1,s
$0b:f2db  28			plp
$0b:f2dc  94 0e		 sty $0e,x
$0b:f2de  06 23		 asl $23
$0b:f2e0  51 74		 eor ($74),y
$0b:f2e2  e2 74		 sep #$74
$0b:f2e4  33 12		 and ($12,s),y
$0b:f2e6  89 c5		 bit #$c5
$0b:f2e8  13 a9		 ora ($a9,s),y
$0b:f2ea  2a			rol a
$0b:f2eb  99 50 24	  sta $2450,y
$0b:f2ee  9c 49 26	  stz $2649
$0b:f2f1  92 99		 sta ($99)
$0b:f2f3  b8			clv
$0b:f2f4  be 58 3f	  ldx $3f58,y
$0b:f2f7  1d 8f 04	  ora $048f,x
$0b:f2fa  53 d1		 eor ($d1,s),y
$0b:f2fc  32 e6		 and ($e6)
$0b:f2fe  4b			phk
$0b:f2ff  2f 92 cc e5   and $e5cc92
$0b:f303  fb			xce
$0b:f304  3d 3a cf	  and $cf3a,x
$0b:f307  54 7b f2	  mvn $f2,$7b
$0b:f30a  0b			phd
$0b:f30b  7c e2 7f	  jmp ($7fe2,x)
$0b:f30e  18			clc
$0b:f30f  9f df 20 79   sta $7920df,x
$0b:f313  cb			wai
$0b:f314  1e 7a c2	  asl $c27a,x
$0b:f317  43 01		 eor $01,s
$0b:f319  c0 c4		 cpy #$c4
$0b:f31b  27 f0		 and [$f0]
$0b:f31d  02 58		 cop #$58
$0b:f31f  58			cli
$0b:f320  2e 90 88	  rol $8890
$0b:f323  47 c3		 eor [$c3]
$0b:f325  f9 a8 f9	  sbc $f9a8,y
$0b:f328  56 ae		 lsr $ae,x
$0b:f32a  58			cli
$0b:f32b  0f 34 57 f9   ora $f95734
$0b:f32f  27 fe		 and [$fe]
$0b:f331  5d 31 05	  eor $0531,x
$0b:f334  21 80		 and ($80,x)
$0b:f336  7c a1 97	  jmp ($97a1,x)
$0b:f339  2c 67 9a	  bit $9a67
$0b:f33c  33 fc		 and ($fc,s),y
$0b:f33e  81 ff		 sta ($ff,x)
$0b:f340  21 6c		 and ($6c,x)
$0b:f342  85 80		 sta $80
$0b:f344  42 e1		 wdm #$e1
$0b:f346  10 78		 bpl $f3c0
$0b:f348  3c 02 3f	  bit $3f02,x
$0b:f34b  16 98		 asl $98,x
$0b:f34d  1b			tcs
$0b:f34e  da			phx
$0b:f34f  0f 0f 84 43   ora $43840f
$0b:f353  e2 70		 sep #$70
$0b:f355  c9 fc		 cmp #$fc
$0b:f357  3d 90 8d	  and $8d90,x
$0b:f35a  d0 90		 bne $f2ec
$0b:f35c  48			pha
$0b:f35d  30 1c		 bmi $f37b
$0b:f35f  09 07		 ora #$07
$0b:f361  c2 81		 rep #$81
$0b:f363  c8			iny
$0b:f364  64 12		 stz $12
$0b:f366  5c 24 16 0e   jml $0e1624
$0b:f36a  07 82		 ora [$82]
$0b:f36c  01 c0		 ora ($c0,x)
$0b:f36e  e8			inx
$0b:f36f  48			pha
$0b:f370  35 17		 and $17,x
$0b:f372  06 41		 asl $41
$0b:f374  43 a0		 eor $a0,s
$0b:f376  90 e8		 bcc $f360
$0b:f378  44 42 30	  mvp $30,$42
$0b:f37b  cd 08 64	  cmp $6408
$0b:f37e  12 37		 ora ($37)
$0b:f380  09 38		 ora #$38
$0b:f382  14 0a		 trb $0a
$0b:f384  01 03		 ora ($03,x)
$0b:f386  80 40		 bra $f3c8
$0b:f388  56 07		 lsr $07,x
$0b:f38a  26 80		 rol $80
$0b:f38c  44 a6 52	  mvp $52,$a6
$0b:f38f  fb			xce
$0b:f390  2d 87 c3	  and $c387
$0b:f393  cc b9 ec	  cpy $ecb9
$0b:f396  ea			nop
$0b:f397  54 ed 2f	  mvn $2f,$ed
$0b:f39a  96 43		 stx $43,y
$0b:f39c  de d0 c3	  dec $c3d0,x
$0b:f39f  20 11 e8	  jsr $e811
$0b:f3a2  24 78		 bit $78
$0b:f3a4  e0 2d		 cpx #$2d
$0b:f3a6  f6 38		 inc $38,x
$0b:f3a8  27 c3		 and [$c3]
$0b:f3aa  e1 ff		 sbc ($ff,x)
$0b:f3ac  ff cf c9 60   sbc $60c9cf,x
$0b:f3b0  ec f0 5d	  cpx $5df0
$0b:f3b3  3d 40 17	  and $1740,x
$0b:f3b6  ef c7 e0 29   sbc $29e0c7
$0b:f3ba  c0 6e		 cpy #$6e
$0b:f3bc  37 0b		 and [$0b],y
$0b:f3be  84 e2		 sty $e2
$0b:f3c0  70 2f		 bvs $f3f1
$0b:f3c2  f8			sed
$0b:f3c3  04 92		 tsb $92
$0b:f3c5  cd 24 c0	  cmp $c024
$0b:f3c8  e9 70		 sbc #$70
$0b:f3ca  25 60		 and $60
$0b:f3cc  b3 59		 lda ($59,s),y
$0b:f3ce  8e 0a 59	  stx $590a
$0b:f3d1  0f 39 8c 8c   ora $8c8c39
$0b:f3d5  20 1b 98	  jsr $981b
$0b:f3d8  44 02 20	  mvp $20,$02
$0b:f3db  1b			tcs
$0b:f3dc  a3 c0		 lda $c0,s
$0b:f3de  48			pha
$0b:f3df  03 77		 ora $77,s
$0b:f3e1  43 62		 eor $62,s
$0b:f3e3  85 0a		 sta $0a
$0b:f3e5  41 30		 eor ($30,x)
$0b:f3e7  43 0a		 eor $0a,s
$0b:f3e9  1d 50 e1	  ora $e150,x
$0b:f3ec  21 41		 and ($41,x)
$0b:f3ee  19 e0 25	  ora $25e0,y
$0b:f3f1  92 4b		 sta ($4b)
$0b:f3f3  15 8a		 ora $8a,x
$0b:f3f5  81 40		 sta ($40,x)
$0b:f3f7  8e 47 24	  stx $2447
$0b:f3fa  52 2a		 eor ($2a)
$0b:f3fc  55 0a		 eor $0a,x
$0b:f3fe  89 46		 bit #$46
$0b:f400  8c 4f 17	  sty $174f
$0b:f403  a1 00		 lda ($00,x)
$0b:f405  b1 40		 lda ($40),y
$0b:f407  28			plp
$0b:f408  10 05		 bpl $f40f
$0b:f40a  a8			tay
$0b:f40b  4f a7 97 e9   eor $e997a7
$0b:f40f  c5 fa		 cmp $fa
$0b:f411  01 3c		 ora ($3c,x)
$0b:f413  59 85 81	  eor $8185,y
$0b:f416  a2 64		 ldx #$64
$0b:f418  b0 6b		 bcs $f485
$0b:f41a  94 c2		 sty $c2,x
$0b:f41c  60			rts
$0b:f41d  cf e8 1c f6   cmp $f61ce8
$0b:f421  03 18		 ora $18,s
$0b:f423  82 c7 20	  brl $14ed
$0b:f426  51 e9		 eor ($e9),y
$0b:f428  84 fe		 sty $fe
$0b:f42a  91 4f		 sta ($4f),y
$0b:f42c  a8			tay
$0b:f42d  57 e6		 eor [$e6],y
$0b:f42f  17 f9		 ora [$f9],y
$0b:f431  f4 42 31	  pea $3142
$0b:f434  0f 8e 46 e3   ora $e3468e
$0b:f438  d1 99		 cmp ($99),y
$0b:f43a  fc 32 9f	  jsr ($9f32,x)
$0b:f43d  37 af		 and [$af],y
$0b:f43f  c8			iny
$0b:f440  ef f0 7c 75   sbc $757cf0
$0b:f444  ca			dex
$0b:f445  1d 22 ad	  ora $ad22,x
$0b:f448  58			cli
$0b:f449  b2 9f		 lda ($9f)
$0b:f44b  68			pla
$0b:f44c  47 fa		 eor [$fa]
$0b:f44e  49 fc		 eor #$fc
$0b:f450  96 79		 stx $79,y
$0b:f452  25 1e		 and $1e
$0b:f454  0f 92 d8 3f   ora $3fd892
$0b:f458  96 2d		 stx $2d,y
$0b:f45a  e7 da		 sbc [$da]
$0b:f45c  51 fe		 eor ($fe),y
$0b:f45e  b0 7f		 bcs $f4df
$0b:f460  38			sec
$0b:f461  1e 4e c7	  asl $c74e,x
$0b:f464  83 b9		 sta $b9,s
$0b:f466  0c 9f c2	  tsb $c29f
$0b:f469  bf 70 1f cc   lda $cc1f70,x
$0b:f46d  83 ff		 sta $ff,s
$0b:f46f  00 1b		 brk #$1b
$0b:f471  05 fe		 ora $fe
$0b:f473  01 1f		 ora ($1f,x)
$0b:f475  80 40		 bra $f4b7
$0b:f477  e7 f2		 sbc [$f2]
$0b:f479  0f df d3 f3   ora $f3d3df
$0b:f47d  d6 ff		 dec $ff,x
$0b:f47f  e4 3f		 cpx $3f
$0b:f481  ff fb fd fe   sbc $fefdfb,x
$0b:f485  3f 1f 81 c0   and $c0811f,x
$0b:f489  e8			inx
$0b:f48a  3f fd 46 f2   and $f246fd,x
$0b:f48e  41 3c		 eor ($3c,x)
$0b:f490  e0 7f		 cpx #$7f
$0b:f492  a0 9f		 ldy #$9f
$0b:f494  e8			inx
$0b:f495  67 fa		 adc [$fa]
$0b:f497  31 fe		 and ($fe),y
$0b:f499  84 7b		 sty $7b
$0b:f49b  3f f1 4d e5   and $e54df1,x
$0b:f49f  02 79		 cop #$79
$0b:f4a1  c4 ff		 cpy $ff
$0b:f4a3  42 bf		 wdm #$bf
$0b:f4a5  d3 2f		 cmp ($2f,s),y
$0b:f4a7  f7 8b		 sbc [$8b],y
$0b:f4a9  fd c2 f6	  sbc $f6c2,x
$0b:f4ac  75 27		 adc $27,x
$0b:f4ae  33 08		 and ($08,s),y
$0b:f4b0  14 9a		 trb $9a
$0b:f4b2  6b			rtl
$0b:f4b3  2f 8c c1 e2   and $e2c18c
$0b:f4b7  90 79		 bcc $f532
$0b:f4b9  44 be 01	  mvp $01,$be
$0b:f4bc  3f 1d 84 fe   and $fe841d,x
$0b:f4c0  1f 25 8d 8f   ora $8f8d25,x
$0b:f4c4  02 0f		 cop #$0f
$0b:f4c6  38			sec
$0b:f4c7  42 84		 wdm #$84
$0b:f4c9  be 27 3f	  ldx $3f27,y
$0b:f4cc  81 c7		 sta ($c7,x)
$0b:f4ce  e3 9b		 sbc $9b,s
$0b:f4d0  09 e5		 ora #$e5
$0b:f4d2  42 e9		 wdm #$e9
$0b:f4d4  98			tya
$0b:f4d5  ff 60 39 53   sbc $533960,x
$0b:f4d9  2c 34 c3	  bit $c334
$0b:f4dc  0d 00 e7	  ora $e700
$0b:f4df  40			rti
$0b:f4e0  3f dd cf 06   and $06cfdd,x
$0b:f4e4  d3 91		 cmp ($91,s),y
$0b:f4e6  fe 80 72	  inc $7280,x
$0b:f4e9  a6 98		 ldx $98
$0b:f4eb  6b			rtl
$0b:f4ec  c6 1b		 dec $1b
$0b:f4ee  f1 ce		 sbc ($ce),y
$0b:f4f0  da			phx
$0b:f4f1  7f b9 90 08   adc $0890b9,x
$0b:f4f5  84 06		 sty $06
$0b:f4f7  43 03		 eor $03,s
$0b:f4f9  a0 41		 ldy #$41
$0b:f4fb  20 30 05	  jsr $0530
$0b:f4fe  b8			clv
$0b:f4ff  c3 21		 cmp $21,s
$0b:f501  90 08		 bcc $f50b
$0b:f503  24 82		 bit $82
$0b:f505  01 41		 ora ($41,x)
$0b:f507  80 e1		 bra $f4ea
$0b:f509  e0 10		 cpx #$10
$0b:f50b  25 e8		 and $e8
$0b:f50d  31 85		 and ($85),y
$0b:f50f  6e 10 88	  ror $8810
$0b:f512  07 b6		 ora [$b6]
$0b:f514  bd 96 b9	  lda $b996,x
$0b:f517  c7 b8		 cmp [$b8]
$0b:f519  95 6a		 sta $6a,x
$0b:f51b  03 58		 ora $58,s
$0b:f51d  26 73		 rol $73
$0b:f51f  38			sec
$0b:f520  64 79		 stz $79
$0b:f522  74 0b		 stz $0b,x
$0b:f524  70 c6		 bvs $f4ec
$0b:f526  4c e7 f7	  jmp $f7e7
$0b:f529  79 fd cd	  adc $cdfd,y
$0b:f52c  ca			dex
$0b:f52d  10 c9		 bpl $f4f8
$0b:f52f  9a			txs
$0b:f530  dc 96 e1	  jml [$e196]
$0b:f533  c0 e0		 cpy #$e0
$0b:f535  7c 3e 17	  jmp ($173e,x)
$0b:f538  8b			phb
$0b:f539  c4 7a		 cpy $7a
$0b:f53b  3d 07 83	  and $8307,x
$0b:f53e  c0 56		 cpy #$56
$0b:f540  c6 f1		 dec $f1
$0b:f542  e0 6c		 cpx #$6c
$0b:f544  00 42		 brk #$42
$0b:f546  c1 60		 cmp ($60,x)
$0b:f548  07 f0		 ora [$f0]
$0b:f54a  6c a6 13	  jmp ($13a6)
$0b:f54d  08			php
$0b:f54e  c4 62		 cpy $62
$0b:f550  11 08		 ora ($08),y
$0b:f552  82 32 48	  brl $3d87
$0b:f555  34 63		 bit $63,x
$0b:f557  3a			dec a
$0b:f558  5b			tcd
$0b:f559  90 cc		 bcc $f527
$0b:f55b  2e 05 53	  rol $5305
$0b:f55e  0e 80 75	  asl $7580
$0b:f561  0a			asl a
$0b:f562  74 5b		 stz $5b,x
$0b:f564  26 b0		 rol $b0
$0b:f566  b5 85		 lda $85,x
$0b:f568  6e 46 df	  ror $df46
$0b:f56b  b0 15		 bcs $f582
$0b:f56d  50 1b		 bvc $f58a
$0b:f56f  08			php
$0b:f570  fe 25 e0	  inc $e025,x
$0b:f573  76 16		 ror $16,x
$0b:f575  ec 70 2b	  cpx $2b70
$0b:f578  83 21		 sta $21,s
$0b:f57a  d0 60		 bne $f5dc
$0b:f57c  71 11		 adc ($11),y
$0b:f57e  90 15		 bcc $f595
$0b:f580  9d 0e 33	  sta $330e,x
$0b:f583  f8			sed
$0b:f584  05 fe		 ora $fe
$0b:f586  63 ff		 adc $ff,s
$0b:f588  84 63		 sty $63
$0b:f58a  aa			tax
$0b:f58b  3d f7 88	  and $88f7,x
$0b:f58e  3b			tsc
$0b:f58f  c6 0f		 dec $0f
$0b:f591  3f 93 df ec   and $ecdf93,x
$0b:f595  ff fc 16 3b   sbc $3b16fc,x
$0b:f599  e7 df		 sbc [$df]
$0b:f59b  d3 5f		 cmp ($5f,s),y
$0b:f59d  ef f3 f9 fc   sbc $fcf9f3
$0b:f5a1  1e 0f 14	  asl $140f,x
$0b:f5a4  e2 62		 sep #$62
$0b:f5a6  35 1d		 and $1d,x
$0b:f5a8  08			php
$0b:f5a9  c7 c2		 cmp [$c2]
$0b:f5ab  31 20		 and ($20),y
$0b:f5ad  9f 42 3f d2   sta $d23f42,x
$0b:f5b1  0f 14 53 ed   ora $ed5314
$0b:f5b5  c4 dc		 cpy $dc
$0b:f5b7  6a			ror a
$0b:f5b8  2a			rol a
$0b:f5b9  11 8f		 ora ($8f),y
$0b:f5bb  04 63		 tsb $63
$0b:f5bd  d1 3e		 cmp ($3e),y
$0b:f5bf  e7 7f		 sbc [$7f]
$0b:f5c1  bc 5e 2e	  ldy $2e5e,x
$0b:f5c4  f7 db		 sbc [$db],y
$0b:f5c6  95 1e		 sta $1e,x
$0b:f5c8  bf 4a b3 d7   lda $d7b34a,x
$0b:f5cc  5c ec ab 1f   jml $1fabec
$0b:f5d0  68			pla
$0b:f5d1  f7 e5		 sbc [$e5],y
$0b:f5d3  3e f4 4b	  rol $4bf4,x
$0b:f5d6  ec 3a 7f	  cpx $7f3a
$0b:f5d9  7e 80 e7	  ror $e780,x
$0b:f5dc  ac 39 db	  ldy $db39
$0b:f5df  16 3e		 asl $3e,x
$0b:f5e1  e1 ef		 sbc ($ef,x)
$0b:f5e3  88			dey
$0b:f5e4  7d e1 17	  adc $17e1,x
$0b:f5e7  dc 14 ff	  jml [$ff14]
$0b:f5ea  a1 fc		 lda ($fc,x)
$0b:f5ec  f9 6e 3e	  sbc $3e6e,y
$0b:f5ef  51 cf		 eor ($cf),y
$0b:f5f1  b4 83		 ldy $83,x
$0b:f5f3  c9 20		 cmp #$20
$0b:f5f5  f0 54		 beq $f64b
$0b:f5f7  3f 16 0b c7   and $c70b16,x
$0b:f5fb  00 9e		 brk #$9e
$0b:f5fd  10 c2		 bpl $f5c1
$0b:f5ff  f8			sed
$0b:f600  7d a1 1e	  adc $1ea1,x
$0b:f603  41 18		 eor ($18,x)
$0b:f605  fe 20 17	  inc $1720,x
$0b:f608  8c 47 f2	  sty $f247
$0b:f60b  38			sec
$0b:f60c  ef 08 b4 de   sbc $deb408
$0b:f610  0c f0 03	  tsb $03f0
$0b:f613  a1 47		 lda ($47,x)
$0b:f615  e0 10		 cpx #$10
$0b:f617  f8			sed
$0b:f618  04 0e		 tsb $0e
$0b:f61a  7f 38 9b ca   adc $ca9b38,x
$0b:f61e  67 f3		 adc [$f3]
$0b:f620  10 58		 bpl $f67a
$0b:f622  02 c2		 cop #$c2
$0b:f624  3f 1f 87 c3   and $c3871f,x
$0b:f628  e0 70		 cpx #$70
$0b:f62a  38			sec
$0b:f62b  17 fa		 ora [$fa],y
$0b:f62d  49 e6		 eor #$e6
$0b:f62f  ac 77 ee	  ldy $ee77
$0b:f632  1f f8 07 fe   ora $fe07f8,x
$0b:f636  19 ff a0	  ora $a0ff,y
$0b:f639  71 e6		 adc ($e6),y
$0b:f63b  1f ef f7 c3   ora $c3f7ef,x
$0b:f63f  cd 98 ef	  cmp $ef98
$0b:f642  c8			iny
$0b:f643  ff f0 7f fe   sbc $fe7ff0,x
$0b:f647  3f ff f1 e3   and $e3f1ff,x
$0b:f64b  ee 7f d8	  inc $d87f
$0b:f64e  68			pla
$0b:f64f  74 12		 stz $12,x
$0b:f651  1d 08 88	  ora $8808,x
$0b:f654  46 20		 lsr $20
$0b:f656  10 08		 bpl $f660
$0b:f658  64 16		 stz $16
$0b:f65a  35 08		 and $08,x
$0b:f65c  80 44		 bra $f6a2
$0b:f65e  20 32 18	  jsr $1832
$0b:f661  11 f4		 ora ($f4),y
$0b:f663  20 10 15	  jsr $1510
$0b:f666  a8			tay
$0b:f667  40			rti
$0b:f668  15 e1		 ora $e1,x
$0b:f66a  27 80		 and [$80]
$0b:f66c  48			pha
$0b:f66d  20 14 18	  jsr $1814
$0b:f670  0d 6a b4	  ora $b46a
$0b:f673  41 0f		 eor ($0f,x)
$0b:f675  bc 4a df	  ldy $df4a,x
$0b:f678  a5 f6		 lda $f6
$0b:f67a  cb			wai
$0b:f67b  7b			tdc
$0b:f67c  da			phx
$0b:f67d  1f 9d 4b 5f   ora $5f4b9d,x
$0b:f681  65 92		 adc $92
$0b:f683  dc e0 14	  jml [$14e0]
$0b:f686  08			php
$0b:f687  64 02		 stz $02
$0b:f689  3d 04 89	  and $8904,x
$0b:f68c  31 05		 and ($05),y
$0b:f68e  c6 19		 dec $19
$0b:f690  e8			inx
$0b:f691  23 10		 and $10,s
$0b:f693  5d ef 34	  eor $34ef,x
$0b:f696  88			dey
$0b:f697  66 71		 ror $71
$0b:f699  2e fa b7	  rol $b7fa
$0b:f69c  59 af de	  eor $deaf,y
$0b:f69f  f7 7b		 sbc [$7b],y
$0b:f6a1  cc 24 16	  cpy $1624
$0b:f6a4  09 85		 ora #$85
$0b:f6a6  ea			nop
$0b:f6a7  11 2e		 ora ($2e),y
$0b:f6a9  08			php
$0b:f6aa  3c 02 c1	  bit $c102,x
$0b:f6ad  00 bd		 brk #$bd
$0b:f6af  40			rti
$0b:f6b0  25 d1		 and $d1
$0b:f6b2  08			php
$0b:f6b3  04 0a		 tsb $0a
$0b:f6b5  04 af		 tsb $af
$0b:f6b7  15 80		 ora $80,x
$0b:f6b9  40			rti
$0b:f6ba  1d c1 01	  ora $01c1,x
$0b:f6bd  61 0c		 adc ($0c,x)
$0b:f6bf  21 7e		 and ($7e,x)
$0b:f6c1  03 60		 ora $60,s
$0b:f6c3  20 90 e1	  jsr $e190
$0b:f6c6  5d e5 40	  eor $40e5,x
$0b:f6c9  29 04		 and #$04
$0b:f6cb  03 a1		 ora $a1,s
$0b:f6cd  80 e0		 bra $f6af
$0b:f6cf  60			rts
$0b:f6d0  3c 1c 0f	  bit $0f1c,x
$0b:f6d3  44 23 70	  mvp $70,$23
$0b:f6d6  50 13		 bvc $f6eb
$0b:f6d8  00 f4		 brk #$f4
$0b:f6da  20 1c 08	  jsr $081c
$0b:f6dd  07 82		 ora [$82]
$0b:f6df  01 e8		 ora ($e8,x)
$0b:f6e1  80 6e		 bra $f751
$0b:f6e3  0a			asl a
$0b:f6e4  80 b5		 bra $f69b
$0b:f6e6  01 70		 ora ($70,x)
$0b:f6e8  5c a4 17 48   jml $4817a4
$0b:f6ec  a5 72		 lda $72
$0b:f6ee  49 66		 eor #$66
$0b:f6f0  0e 84 52	  asl $5284
$0b:f6f3  7e 70 38	  ror $3870,x
$0b:f6f6  05 d2		 ora $d2
$0b:f6f8  01 5c		 ora ($5c,x)
$0b:f6fa  90 59		 bcc $f755
$0b:f6fc  a3 02		 lda $02,s
$0b:f6fe  d0 3f		 bne $f73f
$0b:f700  04 22		 tsb $22
$0b:f702  f7 1a		 sbc [$1a],y
$0b:f704  bd ca bc	  lda $bcca,x
$0b:f707  75 ae		 adc $ae,x
$0b:f709  1c 93 cf	  trb $cf93
$0b:f70c  18			clc
$0b:f70d  bf 3b ca f7   lda $f7ca3b,x
$0b:f711  04 4f		 tsb $4f
$0b:f713  87 8e		 sta [$8e]
$0b:f715  39 c3 9e	  and $9ec3,y
$0b:f718  26 15		 rol $15
$0b:f71a  de 8e e0	  dec $e08e,x
$0b:f71d  86 41		 stx $41
$0b:f71f  1d 61 05	  ora $0561,x
$0b:f722  1c 8c 81	  trb $818c
$0b:f725  60			rts
$0b:f726  ae a1 5d	  ldx $5da1
$0b:f729  3b			tsc
$0b:f72a  bd 0c 21	  lda $210c,x
$0b:f72d  88			dey
$0b:f72e  c0 6e		 cpy #$6e
$0b:f730  32 05		 and ($05)
$0b:f732  e1 69		 sbc ($69,x)
$0b:f734  39 b0 1d	  and $1db0,y
$0b:f737  42 50		 wdm #$50
$0b:f739  28			plp
$0b:f73a  1c 1e 41	  trb $411e
$0b:f73d  23 af		 and $af,s
$0b:f73f  51 e2		 eor ($e2),y
$0b:f741  d3 3b		 cmp ($3b,s),y
$0b:f743  05 e7		 ora $e7
$0b:f745  0b			phd
$0b:f746  d7 27		 cmp [$27],y
$0b:f748  95 1e		 sta $1e,x
$0b:f74a  81 43		 sta ($43,x)
$0b:f74c  b0 4e		 bcs $f79c
$0b:f74e  ef 90 d9 f5   sbc $f5d990
$0b:f752  9e 3d d1	  stz $d13d,x
$0b:f755  1b			tcs
$0b:f756  00 dc		 brk #$dc
$0b:f758  07 01		 ora [$01]
$0b:f75a  e0 e4		 cpx #$e4
$0b:f75c  7a			ply
$0b:f75d  2e 9c 4e	  rol $4e9c
$0b:f760  86 72		 stx $72
$0b:f762  51 30		 eor ($30),y
$0b:f764  a6 74		 ldx $74
$0b:f766  96 25		 stx $25,y
$0b:f768  e4 11		 cpx $11
$0b:f76a  04 33		 tsb $33
$0b:f76c  71 7c		 adc ($7c),y
$0b:f76e  b2 7e		 lda ($7e)
$0b:f770  3a			dec a
$0b:f771  1e c8 97	  asl $97c8,x
$0b:f774  b2 95		 lda ($95)
$0b:f776  7b			tdc
$0b:f777  80 fe		 bra $f777
$0b:f779  60			rts
$0b:f77a  1f f9 07 fe   ora $fe07f9,x
$0b:f77e  01 7f		 ora ($7f,x)
$0b:f780  1b			tcs
$0b:f781  8c 7e 01	  sty $017e
$0b:f784  03 bd		 ora $bd,s
$0b:f786  e5 3f		 sbc $3f
$0b:f788  33 6f		 and ($6f,s),y
$0b:f78a  ff 43 ff 8f   sbc $8fff43,x
$0b:f78e  bf 91 c6 3f   lda $3fc691,x
$0b:f792  1f 81 c0 f4   ora $f4c081,x
$0b:f796  1b			tcs
$0b:f797  c9 44		 cmp #$44
$0b:f799  fb			xce
$0b:f79a  81 fe		 sta ($fe,x)
$0b:f79c  82 7f a1	  brl $991e
$0b:f79f  9f e8 47 fa   sta $fa47e8,x
$0b:f7a3  30 58		 bmi $f7fd
$0b:f7a5  0f 66 f2 89   ora $89f266
$0b:f7a9  3e e1 7f	  rol $7fe1,x
$0b:f7ac  a1 5f		 lda ($5f,x)
$0b:f7ae  e8			inx
$0b:f7af  97 fb		 sta [$fb],y
$0b:f7b1  c4 67		 cpy $67
$0b:f7b3  1e 17 b3	  asl $b317,x
$0b:f7b6  a9 04		 lda #$04
$0b:f7b8  a6 5a		 ldx $5a
$0b:f7ba  2b			pld
$0b:f7bb  f3 08		 sbc ($08,s),y
$0b:f7bd  7c 8e 1f	  jmp ($1f8e,x)
$0b:f7c0  54 ae 40	  mvn $40,$ae
$0b:f7c3  ef 12 3b c4   sbc $c43b12
$0b:f7c7  92 d9		 sta ($d9)
$0b:f7c9  4b			phk
$0b:f7ca  9b			txy
$0b:f7cb  cf e0 70 fb   cmp $fb70e0
$0b:f7cf  94 3e		 sty $3e,x
$0b:f7d1  f9 5c 95	  sbc $955c,y
$0b:f7d4  de 2f f7	  dec $f72f,x
$0b:f7d7  88			dey
$0b:f7d8  7d b2 27	  adc $27b2,x
$0b:f7db  a0 f7		 ldy #$f7
$0b:f7dd  4e 3f d8	  lsr $d83f
$0b:f7e0  0f 65 42 ed   ora $ed4265
$0b:f7e4  82 cb 59	  brl $51b2
$0b:f7e7  af d4 8b d6   lda $d68bd4
$0b:f7eb  2b			pld
$0b:f7ec  f5 6e		 sbc $6e,x
$0b:f7ee  c8			iny
$0b:f7ef  7f a0 1e c8   adc $c81ea0,x
$0b:f7f3  85 db		 sta $db
$0b:f7f5  11 96		 ora ($96),y
$0b:f7f7  b4 5f		 ldy $5f,x
$0b:f7f9  b0 17		 bcs $f812
$0b:f7fb  ac 27 ea	  ldy $ea27
$0b:f7fe  69 03		 adc #$03
$0b:f800  a0 41		 ldy #$41
$0b:f802  19 60 1f	  ora $1f60,y
$0b:f805  18			clc
$0b:f806  64 30		 stz $30
$0b:f808  20 10 08	  jsr $0810
$0b:f80b  40			rti
$0b:f80c  00 30		 brk #$30
$0b:f80e  f0 08		 beq $f818
$0b:f810  12 e4		 ora ($e4)
$0b:f812  42 40		 wdm #$40
$0b:f814  00 05		 brk #$05
$0b:f816  e0 44		 cpx #$44
$0b:f818  03 e3		 ora $e3,s
$0b:f81a  6f d2 f1 28   adc $28f1d2
$0b:f81e  16 ff		 asl $ff,x
$0b:f820  2d 03 81	  and $8103
$0b:f823  25 b0		 and $b0
$0b:f825  cc ee 71	  cpy $71ee
$0b:f828  e9 fc		 sbc #$fc
$0b:f82a  22 35 1e 82   jsl $821e35
$0b:f82e  4f e0 0d f3   eor $f30de0
$0b:f832  5b			tcd
$0b:f833  00 7c		 brk #$7c
$0b:f835  96 64		 stx $64,y
$0b:f837  ee 39 24	  inc $2439
$0b:f83a  03 03		 ora $03,s
$0b:f83c  81 d2		 sta ($d2,x)
$0b:f83e  e9 5f		 sbc #$5f
$0b:f840  00 ee		 brk #$ee
$0b:f842  6b			rtl
$0b:f843  30 1c		 bmi $f861
$0b:f845  3c f4 2f	  bit $2ff4,x
$0b:f848  3b			tsc
$0b:f849  e0 22		 cpx #$22
$0b:f84b  93 69		 sta ($69,s),y
$0b:f84d  a5 da		 lda $da
$0b:f84f  51 6e		 eor ($6e),y
$0b:f851  9a			txs
$0b:f852  59 a5 96	  eor $96a5,y
$0b:f855  68			pla
$0b:f856  c4 f0		 cpy $f0
$0b:f858  06 53		 asl $53
$0b:f85a  68			pla
$0b:f85b  45 da		 eor $da
$0b:f85d  11 6e		 ora ($6e),y
$0b:f85f  88			dey
$0b:f860  06 00		 asl $00
$0b:f862  30 b0		 bmi $f814
$0b:f864  08			php
$0b:f865  44 32 09	  mvp $09,$32
$0b:f868  0f 81 46 e1   ora $e14681
$0b:f86c  31 98		 and ($98),y
$0b:f86e  54 6e 01	  mvn $01,$6e
$0b:f871  0f 80 2c 85   ora $852c80
$0b:f875  70 03		 bvs $f87a
$0b:f877  a0 8d		 ldy #$8d
$0b:f879  c1 23		 cmp ($23,x)
$0b:f87b  30 62		 bmi $f8df
$0b:f87d  18			clc
$0b:f87e  0e 8e 01	  asl $018e
$0b:f881  28			plp
$0b:f882  dc 54 3b	  jml [$3b54]
$0b:f885  19 0c c5	  ora $c50c,y
$0b:f888  82 11 d0	  brl $c89c
$0b:f88b  cc 68 36	  cpy $3668
$0b:f88e  10 0f		 bpl $f89f
$0b:f890  02 d4		 cop #$d4
$0b:f892  37 14		 and [$14],y
$0b:f894  0e c4 80	  asl $80c4
$0b:f897  a8			tay
$0b:f898  3f 02 a0 6c   and $6ca002,x
$0b:f89c  28			plp
$0b:f89d  05 c1		 ora $c1
$0b:f89f  5a			phy
$0b:f8a0  84 06		 sty $06
$0b:f8a2  03 13		 ora $13,s
$0b:f8a4  88			dey
$0b:f8a5  46 a2		 lsr $a2
$0b:f8a7  11 88		 ora ($88),y
$0b:f8a9  44 b6 63	  mvp $63,$b6
$0b:f8ac  3f 81 4d a0   and $a04d81,x
$0b:f8b0  70 e5		 bvs $f897
$0b:f8b2  90 44		 bcc $f8f8
$0b:f8b4  e0 11		 cpx #$11
$0b:f8b6  a8			tay
$0b:f8b7  04 62		 tsb $62
$0b:f8b9  01 2d		 ora ($2d,x)
$0b:f8bb  88			dey
$0b:f8bc  38			sec
$0b:f8bd  42 6d		 wdm #$6d
$0b:f8bf  01 3f		 ora ($3f,x)
$0b:f8c1  0a			asl a
$0b:f8c2  d4 28		 pei ($28)
$0b:f8c4  0c c1 c8	  tsb $c8c1
$0b:f8c7  68			pla
$0b:f8c8  3e 14 0b	  rol $0b14,x
$0b:f8cb  06 02		 asl $02
$0b:f8cd  41 80		 eor ($80,x)
$0b:f8cf  d0 24		 bne $f8f5
$0b:f8d1  16 01		 asl $01,x
$0b:f8d3  f0 80		 beq $f855
$0b:f8d5  26 87		 rol $87
$0b:f8d7  81 a0		 sta ($a0,x)
$0b:f8d9  49 03		 eor #$03
$0b:f8db  2c 22 51	  bit $5122
$0b:f8de  29 bc		 and #$bc
$0b:f8e0  52 6b		 eor ($6b)
$0b:f8e2  03 8b		 ora $8b,s
$0b:f8e4  c0 61		 cpy #$61
$0b:f8e6  b0 68		 bcs $f950
$0b:f8e8  e4 12		 cpx $12
$0b:f8ea  38			sec
$0b:f8eb  b0 18		 bcs $f905
$0b:f8ed  04 de		 tsb $de
$0b:f8ef  01 35		 ora ($35,x)
$0b:f8f1  81 45		 sta ($45,x)
$0b:f8f3  e0 10		 cpx #$10
$0b:f8f5  d8			cld
$0b:f8f6  14 72		 trb $72
$0b:f8f8  06 cb		 asl $cb
$0b:f8fa  09 07		 ora #$07
$0b:f8fc  a2 01		 ldx #$01
$0b:f8fe  c8			iny
$0b:f8ff  c8			iny
$0b:f900  64 3a		 stz $3a
$0b:f902  1d 0a 07	  ora $070a,x
$0b:f905  41 2e		 eor ($2e,x)
$0b:f907  1d 0e c4	  ora $c40e,x
$0b:f90a  62 39 e8	  per $e146
$0b:f90d  88			dey
$0b:f90e  72 26		 adc ($26)
$0b:f910  19 0b 07	  ora $070b,y
$0b:f913  42 40		 wdm #$40
$0b:f915  e5 05		 sbc $05
$0b:f917  38			sec
$0b:f918  18			clc
$0b:f919  42 39		 wdm #$39
$0b:f91b  e0 84		 cpx #$84
$0b:f91d  4e 24 76	  lsr $7624
$0b:f920  da			phx
$0b:f921  0f 22 eb cc   ora $cceb22
$0b:f925  d9 61 b7	  cmp $b761,y
$0b:f928  18			clc
$0b:f929  7a			ply
$0b:f92a  07 1e		 ora [$1e]
$0b:f92c  69 7f		 adc #$7f
$0b:f92e  9c 41 c4	  stz $c441
$0b:f931  61 c8		 adc ($c8,x)
$0b:f933  9f f3 26 78   sta $7826f3,x
$0b:f937  6b			rtl
$0b:f938  ce 1e f5	  dec $f51e
$0b:f93b  c7 dd		 cmp [$dd]
$0b:f93d  df c9 c1 22   cmp $22c1c9,x
$0b:f941  c2 5d		 rep #$5d
$0b:f943  e1 13		 sbc ($13,x)
$0b:f945  da			phx
$0b:f946  2d f7 05	  and $05f7
$0b:f949  fe 80 ff	  inc $ff80,x
$0b:f94c  e5 5e		 sbc $5e
$0b:f94e  f9 d6 1e	  sbc $1ed6,y
$0b:f951  45 dc		 eor $dc
$0b:f953  fb			xce
$0b:f954  c6 27		 dec $27
$0b:f956  be 2b ee	  ldx $ee2b,y
$0b:f959  cb			wai
$0b:f95a  fd 39 ff	  sbc $ff39,x
$0b:f95d  df 3d fd 4c   cmp $4cfd3d,x
$0b:f961  3d f2 00	  and $00f2,x
$0b:f964  2f 3e 07 02   and $02073e
$0b:f968  51 32		 eor ($32),y
$0b:f96a  e0 c9 a8	  cpx #$a8c9
$0b:f96d  f6 11		 inc $11,x
$0b:f96f  7a			ply
$0b:f970  0c c6 01	  tsb $01c6
$0b:f973  32 e6		 and ($e6)
$0b:f975  49 bb		 eor #$bb
$0b:f977  36 1c		 rol $1c,x
$0b:f979  f4 02 1c	  pea $1c02
$0b:f97c  2f 48 14 01   and $011448
$0b:f980  1c 10 58	  trb $5810
$0b:f983  24 0e		 bit $0e
$0b:f985  07 01		 ora [$01]
$0b:f987  82 0f 56	  brl $4f99
$0b:f98a  0f 00 81 c1   ora $c18100
$0b:f98e  21 66		 and ($66,x)
$0b:f990  80 2d		 bra $f9bf
$0b:f992  04 42		 tsb $42
$0b:f994  67 18		 adc [$18]
$0b:f996  bf c0 81 a0   lda $a081c0,x
$0b:f99a  74 29		 stz $29,x
$0b:f99c  fc 02 3e	  jsr ($3e02,x)
$0b:f99f  65 09		 adc $09
$0b:f9a1  9c 32 ff	  stz $ff32
$0b:f9a4  61 bf		 adc ($bf,x)
$0b:f9a6  dc 6f e8	  jml [$e86f]
$0b:f9a9  51 9f		 eor ($9f),y
$0b:f9ab  cf e3 f1 f8   cmp $f8f1e3
$0b:f9af  3c 1e 25	  bit $251e,x
$0b:f9b2  f2 92		 sbc ($92)
$0b:f9b4  79 ae 1f	  adc $1fae,y
$0b:f9b7  fb			xce
$0b:f9b8  07 fe		 ora [$fe]
$0b:f9ba  01 ff		 ora ($ff,x)
$0b:f9bc  99 7c e8	  sta $e87c,y
$0b:f9bf  9c 79 87	  stz $8779
$0b:f9c2  fb			xce
$0b:f9c3  e5 cc		 sbc $cc
$0b:f9c5  f3 66		 sbc ($66,s),y
$0b:f9c7  3f f0 3f fc   and $fc3ff0,x
$0b:f9cb  3f ff 83 f9   and $f983ff,x
$0b:f9cf  f3 78		 sbc ($78,s),y
$0b:f9d1  fb			xce
$0b:f9d2  9f f6 18 5e   sta $5e18f6,x
$0b:f9d6  50 a8		 bvc $f980
$0b:f9d8  84 d2		 sty $d2
$0b:f9da  71 03		 adc ($03),y
$0b:f9dc  80 43		 bra $fa21
$0b:f9de  61 10		 adc ($10,x)
$0b:f9e0  f8			sed
$0b:f9e1  45 06		 eor $06
$0b:f9e3  a2 2f 28	  ldx #$282f
$0b:f9e6  31 9c		 and ($9c),y
$0b:f9e8  18			clc
$0b:f9e9  07 10		 ora [$10]
$0b:f9eb  80 49		 bra $fa36
$0b:f9ed  91 a1		 sta ($a1),y
$0b:f9ef  1f 89 cc 65   ora $65cc89,x
$0b:f9f3  96 49		 stx $49,y
$0b:f9f5  bd 33 bf	  lda $bf33,x
$0b:f9f8  4a			lsr a
$0b:f9f9  de 65 b7	  dec $b765,x
$0b:f9fc  76 1e		 ror $1e,x
$0b:f9fe  36 94		 rol $94,x
$0b:fa00  5e 1c f8	  lsr $f81c,x
$0b:fa03  0e 7c b4	  asl $b47c
$0b:fa06  10 09		 bpl $fa11
$0b:fa08  8c 02 f3	  sty $f302
$0b:fa0b  10 8e		 bpl $f99b
$0b:fa0d  40			rti
$0b:fa0e  23 03		 and $03,s
$0b:fa10  31 a0		 and ($a0),y
$0b:fa12  58			cli
$0b:fa13  34 13		 bit $13,x
$0b:fa15  0a			asl a
$0b:fa16  84 42		 sty $42
$0b:fa18  a1 58		 lda ($58,x)
$0b:fa1a  f8			sed
$0b:fa1b  5e 2a 17	  lsr $172a,x
$0b:fa1e  88			dey
$0b:fa1f  07 e0		 ora [$e0]
$0b:fa21  5e 18 07	  lsr $0718,x
$0b:fa24  78			sei
$0b:fa25  40			rti
$0b:fa26  3c 10 0d	  bit $0d10,x
$0b:fa29  00 00		 brk #$00
$0b:fa2b  40			rti
$0b:fa2c  20 0c 8c	  jsr $8c0c
$0b:fa2f  07 13		 ora [$13]
$0b:fa31  01 c2		 ora ($c2,x)
$0b:fa33  80 50		 bra $fa85
$0b:fa35  01 90		 ora ($90,x)
$0b:fa37  55 20		 eor $20,x
$0b:fa39  49 c3		 eor #$c3
$0b:fa3b  20 10 82	  jsr $8210
$0b:fa3e  b0 40		 bcs $fa80
$0b:fa40  60			rts
$0b:fa41  70 28		 bvs $fa6b
$0b:fa43  5c 10 9c 11   jml $119c10
$0b:fa47  a8			tay
$0b:fa48  54 6c 60	  mvn $60,$6c
$0b:fa4b  6c 41 85	  jmp ($8541)
$0b:fa4e  c0 07 43	  cpy #$4307
$0b:fa51  04 8d		 tsb $8d
$0b:fa53  c1 20		 cmp ($20,x)
$0b:fa55  14 07		 trb $07
$0b:fa57  88			dey
$0b:fa58  48			pha
$0b:fa59  2c 10 09	  bit $0910
$0b:fa5c  01 3c		 ora ($3c,x)
$0b:fa5e  20 16 89	  jsr $8916
$0b:fa61  07 e2		 ora [$e2]
$0b:fa63  a1 d8		 lda ($d8,x)
$0b:fa65  0e 01 50	  asl $5001
$0b:fa68  0a			asl a
$0b:fa69  8a			txa
$0b:fa6a  fd 1e c4	  sbc $c41e,x
$0b:fa6d  82 0b 0d	  brl $077b
$0b:fa70  82 47 e1	  brl $dbba
$0b:fa73  51 e8		 eor ($e8),y
$0b:fa75  1c 7a 09	  trb $097a
$0b:fa78  1c 81 c3	  trb $c381
$0b:fa7b  d8			cld
$0b:fa7c  85 0d		 sta $0d
$0b:fa7e  81 47		 sta ($47,x)
$0b:fa80  e0 11 e8	  cpx #$e811
$0b:fa83  0a			asl a
$0b:fa84  0c 0f 0a	  tsb $0a0f
$0b:fa87  4f 0f 86 83   eor $83860f
$0b:fa8b  69 d4		 adc #$d4
$0b:fa8d  8e 48 39	  stx $3948
$0b:fa90  92 0e		 sta ($0e)
$0b:fa92  45 42		 eor $42
$0b:fa94  31 80		 and ($80),y
$0b:fa96  02 84		 cop #$84
$0b:fa98  03 e1		 ora $e1,s
$0b:fa9a  00 da		 brk #$da
$0b:fa9c  50 23		 bvc $fac1
$0b:fa9e  9e 0e 67	  stz $670e,x
$0b:faa1  c3 91		 cmp $91,s
$0b:faa3  f0 8c		 beq $fa31
$0b:faa5  78			sei
$0b:faa6  13 82		 ora ($82,s),y
$0b:faa8  46 08		 lsr $08
$0b:faaa  dc 3a 7d	  jml [$7d3a]
$0b:faad  15 9a		 ora $9a,x
$0b:faaf  47 a6		 eor [$a6]
$0b:fab1  b1 19		 lda ($19),y
$0b:fab3  a4 2a		 ldy $2a
$0b:fab5  7d 01 3d	  adc $3d01,x
$0b:fab8  04 1c		 tsb $1c
$0b:faba  9a			txs
$0b:fabb  0b			phd
$0b:fabc  a0 9a 42	  ldy #$429a
$0b:fabf  e6 b0		 inc $b0
$0b:fac1  b6 18		 ldx $18,y
$0b:fac3  2e 8c b2	  rol $b28c
$0b:fac6  10 cc		 bpl $fa94
$0b:fac8  44 32 a1	  mvp $a1,$32
$0b:facb  9c 54 05	  stz $0554
$0b:face  03 29		 ora $29,s
$0b:fad0  a8			tay
$0b:fad1  9c 50 2e	  stz $2e50
$0b:fad4  0e f0 86	  asl $86f0
$0b:fad7  7c 1b e1	  jmp ($e11b,x)
$0b:fada  9c f0 2a	  stz $2af0
$0b:fadd  43 29		 eor $29,s
$0b:fadf  e0 9c 70	  cpx #$709c
$0b:fae2  2e 18 00	  rol $0018
$0b:fae5  18			clc
$0b:fae6  42 af		 wdm #$af
$0b:fae8  10 3f		 bpl $fb29
$0b:faea  c4 13		 cpy $13
$0b:faec  f9 20 ff	  sbc $ff20,y
$0b:faef  d4 3b		 pei ($3b)
$0b:faf1  f0 0b		 beq $fafe
$0b:faf3  fc 02 7e	  jsr ($7e02,x)
$0b:faf6  bd 0b c5	  lda $c50b,x
$0b:faf9  9f f1 f7 fe   sta $fef7f1,x
$0b:fafd  74 ff		 stz $ff,x
$0b:faff  f8			sed
$0b:fb00  fe fe 9e	  inc $9efe,x
$0b:fb03  ff 7f 9f cf   sbc $cf9f7f,x
$0b:fb07  e0 f0 78	  cpx #$78f0
$0b:fb0a  85 1f		 sta $1f
$0b:fb0c  11 2e		 ora ($2e),y
$0b:fb0e  c0 7f a0	  cpy #$a07f
$0b:fb11  0f 40 ff 4e   ora $4eff40
$0b:fb15  3f d2 0f 14   and $140fd2,x
$0b:fb19  53 ed		 eor ($ed,s),y
$0b:fb1b  47 de		 eor [$de]
$0b:fb1d  4b			phk
$0b:fb1e  ba			tsx
$0b:fb1f  df e9 f7 f3   cmp $f3f7e9,x
$0b:fb23  f9 fe c3	  sbc $c3fe,y
$0b:fb26  7f b8 5e 2e   adc $2e5eb8,x
$0b:fb2a  f7 db		 sbc [$db],y
$0b:fb2c  94 8c		 sty $8c,x
$0b:fb2e  12 30		 ora ($30)
$0b:fb30  42 01		 wdm #$01
$0b:fb32  a1 00		 lda ($00,x)
$0b:fb34  8f c5 a6 13   sta $13a6c5
$0b:fb38  99 84 0a	  sta $0a84,y
$0b:fb3b  4c 2f 28	  jmp $282f
$0b:fb3e  3c 3e 11	  bit $113e,x
$0b:fb41  0f 89 c3 27   ora $27c389
$0b:fb45  f0 f2		 beq $fb39
$0b:fb47  48			pha
$0b:fb48  49 63		 eor #$63
$0b:fb4a  70 78		 bvs $fbc4
$0b:fb4c  25 12		 and $12
$0b:fb4e  b9 2a 97	  lda $972a,y
$0b:fb51  66 7c		 ror $7c
$0b:fb53  73 4f		 adc ($4f,s),y
$0b:fb55  9d 33 bd	  sta $bd33,x
$0b:fb58  a0 96 54	  ldy #$5496
$0b:fb5b  2e d2 49	  rol $49d2
$0b:fb5e  1c f2 c7	  trb $c7f2
$0b:fb61  ce f8 c8	  dec $c8f8
$0b:fb64  fb			xce
$0b:fb65  9d 39 66	  sta $6639,x
$0b:fb68  fa			plx
$0b:fb69  c0 a5 0d	  cpy #$0da5
$0b:fb6c  b7 20		 lda [$20],y
$0b:fb6e  5e 50 14	  lsr $1450,x
$0b:fb71  50 40		 bvc $fbb3
$0b:fb73  e0 d0 48	  cpx #$48d0
$0b:fb76  74 2a		 stz $2a,x
$0b:fb78  15 0e		 ora $0e,x
$0b:fb7a  8e 45 05	  stx $0545
$0b:fb7d  e4 9d		 cpx $9d
$0b:fb7f  08			php
$0b:fb80  14 0a		 trb $0a
$0b:fb82  09 04		 ora #$04
$0b:fb84  84 22		 sty $22
$0b:fb86  46 21		 lsr $21
$0b:fb88  10 99		 bpl $fb23
$0b:fb8a  61 a6		 adc ($a6,x)
$0b:fb8c  18			clc
$0b:fb8d  68			pla
$0b:fb8e  37 3a		 and [$3a],y
$0b:fb90  11 f8		 ora ($f8),y
$0b:fb92  8b			phb
$0b:fb93  7c 20 9f	  jmp ($9f20,x)
$0b:fb96  0b			phd
$0b:fb97  67 e6		 adc [$e6]
$0b:fb99  99 f9 c3	  sta $c3f9,y
$0b:fb9c  5e 30 df	  lsr $df30,x
$0b:fb9f  ae 76 c3	  ldx $c376
$0b:fba2  f1 c6		 sbc ($c6),y
$0b:fba4  f8			sed
$0b:fba5  7b			tdc
$0b:fba6  be 1a ef	  ldx $ef1a,y
$0b:fba9  cc 5d 56	  cpy $565d
$0b:fbac  14 6b		 trb $6b
$0b:fbae  12 1c		 ora ($1c)
$0b:fbb0  21 30		 and ($30,x)
$0b:fbb2  93 d0		 sta ($d0,s),y
$0b:fbb4  c3 88		 cmp $88,s
$0b:fbb6  60			rts
$0b:fbb7  cc 18 06	  cpy $0618
$0b:fbba  36 1d		 rol $1d,x
$0b:fbbc  0b			phd
$0b:fbbd  86 41		 stx $41
$0b:fbbf  a1 30		 lda ($30,x)
$0b:fbc1  58			cli
$0b:fbc2  1c 06 06	  trb $0606
$0b:fbc5  72 11		 adc ($11)
$0b:fbc7  80 de		 bra $fba7
$0b:fbc9  ab			plb
$0b:fbca  df 6f 6c d2   cmp $d26c6f,x
$0b:fbce  51 ab		 eor ($ab),y
$0b:fbd0  97 49		 sta [$49],y
$0b:fbd2  24 1c		 bit $1c
$0b:fbd4  9e 04 10	  stz $1004,x
$0b:fbd7  60			rts
$0b:fbd8  10 4c		 bpl $fc26
$0b:fbda  08			php
$0b:fbdb  c0 38 1c	  cpy #$1c38
$0b:fbde  3f 07 07 c1   and $c10707,x
$0b:fbe2  cd f0 41	  cmp $41f0
$0b:fbe5  38			sec
$0b:fbe6  10 88		 bpl $fb70
$0b:fbe8  03 ac		 ora $ac,s
$0b:fbea  28			plp
$0b:fbeb  13 0d		 ora ($0d,s),y
$0b:fbed  06 03		 asl $03
$0b:fbef  81 20		 sta ($20,x)
$0b:fbf1  82 45 30	  brl $2c39
$0b:fbf4  90 c1		 bcc $fbb7
$0b:fbf6  80 e0		 bra $fbd8
$0b:fbf8  1d c1 c0	  ora $c0c1,x
$0b:fbfb  80 54		 bra $fc51
$0b:fbfd  20 11 08	  jsr $0811
$0b:fc00  06 21		 asl $21
$0b:fc02  08			php
$0b:fc03  0e 10 77	  asl $7710
$0b:fc06  04 02		 tsb $02
$0b:fc08  40			rti
$0b:fc09  ec 08 44	  cpx $4408
$0b:fc0c  c2 21		 rep #$21
$0b:fc0e  26 93		 rol $93
$0b:fc10  52 69		 eor ($69)
$0b:fc12  31 58		 and ($58),y
$0b:fc14  88			dey
$0b:fc15  60			rts
$0b:fc16  16 e0		 asl $e0,x
$0b:fc18  30 09		 bmi $fc23
$0b:fc1a  84 e2		 sty $e2
$0b:fc1c  c1 70		 cmp ($70,x)
$0b:fc1e  a0 59 a0	  ldy #$a059
$0b:fc21  d4 f8		 pei ($f8)
$0b:fc23  74 7c		 stz $7c,x
$0b:fc25  4e 10 00	  lsr $0010
$0b:fc28  e0 c1 22	  cpx #$22c1
$0b:fc2b  30 32		 bmi $fc5f
$0b:fc2d  38			sec
$0b:fc2e  47 a0		 eor [$a0]
$0b:fc30  71 e8		 adc ($e8),y
$0b:fc32  14 3a		 trb $3a
$0b:fc34  06 ba		 asl $ba
$0b:fc36  06 40		 asl $40
$0b:fc38  40			rti
$0b:fc39  03 40		 ora $40,s
$0b:fc3b  32 18		 and ($18)
$0b:fc3d  09 0c 21	  ora #$210c
$0b:fc40  d0 11		 bne $fc53
$0b:fc42  d1 c0		 cmp ($c0),y
$0b:fc44  3c 1b 8d	  bit $8d1b,x
$0b:fc47  06 c3		 asl $c3
$0b:fc49  c0 11 0e	  cpy #$0e11
$0b:fc4c  c6 42		 dec $42
$0b:fc4e  b1 20		 lda ($20),y
$0b:fc50  9c 40 3e	  stz $3e40
$0b:fc53  08			php
$0b:fc54  20 dc 50	  jsr $50dc
$0b:fc57  36 0e		 rol $0e,x
$0b:fc59  f0 e0		 beq $fc3b
$0b:fc5b  76 3c		 ror $3c,x
$0b:fc5d  15 8f		 ora $8f,x
$0b:fc5f  04 e3		 tsb $e3
$0b:fc61  80 5c		 bra $fcbf
$0b:fc63  13 65		 ora ($65,s),y
$0b:fc65  36 c4		 rol $c4,x
$0b:fc67  f2 67		 sbc ($67)
$0b:fc69  3f 7c a3 f8   and $f8a37c,x
$0b:fc6d  5f e0 8f 80   eor $808fe0,x
$0b:fc71  40			rti
$0b:fc72  a7 1d		 lda [$1d]
$0b:fc74  96 12		 stx $12,y
$0b:fc76  28			plp
$0b:fc77  04 16		 tsb $16
$0b:fc79  03 15		 ora $15,s
$0b:fc7b  81 c7		 sta ($c7,x)
$0b:fc7d  e2 11		 sep #$11
$0b:fc7f  b5 83		 lda $83,x
$0b:fc81  c0 a2		 cpy #$a2
$0b:fc83  b0 21		 bcs $fca6
$0b:fc85  50 2f		 bvc $fcb6
$0b:fc87  85 f8		 sta $f8
$0b:fc89  0a			asl a
$0b:fc8a  90 59		 bcc $fce5
$0b:fc8c  05 42		 ora $42
$0b:fc8e  21 70		 and ($70,x)
$0b:fc90  90 7e		 bcc $fd10
$0b:fc92  0a			asl a
$0b:fc93  a1 50		 lda ($50,x)
$0b:fc95  ac 34 16	  ldy $1634
$0b:fc98  01 70		 ora ($70,x)
$0b:fc9a  80 7e		 bra $fd1a
$0b:fc9c  20 1d 89	  jsr $891d
$0b:fc9f  05 63		 ora $63
$0b:fca1  41 01		 eor ($01,x)
$0b:fca3  80 81		 bra $fc26
$0b:fca5  82 09 07	  brl $03b1
$0b:fca8  80 3c		 bra $fce6
$0b:fcaa  00 fe		 brk #$fe
$0b:fcac  b0 18		 bcs $fcc6
$0b:fcae  14 0a		 trb $0a
$0b:fcb0  0a			asl a
$0b:fcb1  f4 96 88	  pea $8896
$0b:fcb4  78			sei
$0b:fcb5  3a			dec a
$0b:fcb6  51 29		 eor ($29),y
$0b:fcb8  76 82		 ror $82,x
$0b:fcba  29 f1 87	  and #$87f1
$0b:fcbd  c7 e0		 cmp [$e0]
$0b:fcbf  2f 43 f0 40   and $40f043
$0b:fcc3  22 5e cd 05   jsl $05cd5e
$0b:fcc7  7f e3 0e 65   adc $650ee3,x
$0b:fccb  83 d1		 sta $d1,s
$0b:fccd  26 b2		 rol $b2
$0b:fccf  f8			sed
$0b:fcd0  cc 1e 29	  cpy $291e
$0b:fcd3  07 94		 ora [$94]
$0b:fcd5  4b			phk
$0b:fcd6  e0 13		 cpx #$13
$0b:fcd8  f2 50		 sbc ($50)
$0b:fcda  40			rti
$0b:fcdb  60			rts
$0b:fcdc  90 68		 bcc $fd46
$0b:fcde  80 9c		 bra $fc7c
$0b:fce0  67 10		 adc [$10]
$0b:fce2  79 cc be	  adc $becc,y
$0b:fce5  25 3f		 and $3f
$0b:fce7  81 40		 sta ($40,x)
$0b:fce9  de 42 3e	  dec $3e42,x
$0b:fcec  0c e7 fa	  tsb $fae7
$0b:fcef  21 96		 and ($96,x)
$0b:fcf1  b4 42		 ldy $42,x
$0b:fcf3  ec 10 b9	  cpx $b910
$0b:fcf6  04 fe		 tsb $fe
$0b:fcf8  89 ff c1	  bit #$c1ff
$0b:fcfb  7e e9 57	  ror $57e9,x
$0b:fcfe  bf f4 00 a4   lda $a400f4,x
$0b:fd02  3f 53 18 4f   and $4f1853,x
$0b:fd06  f9 bf f8	  sbc $f8bf,y
$0b:fd09  4f ee 2b 7b   eor $7b2bee
$0b:fd0d  d2 c5		 cmp ($c5)
$0b:fd0f  23 93		 and $93,s
$0b:fd11  c9 64 e2	  cmp #$e264
$0b:fd14  51 28		 eor ($28),y
$0b:fd16  9c 5a 2f	  stz $2f5a
$0b:fd19  16 8a		 asl $8a,x
$0b:fd1b  c5 e0		 cmp $e0
$0b:fd1d  f4 31 08	  pea $0831
$0b:fd20  84 81		 sty $81
$0b:fd22  02 76		 cop #$76
$0b:fd24  0b			phd
$0b:fd25  05 01		 ora $01
$0b:fd27  12 70		 ora ($70)
$0b:fd29  4f ec c3 c7   eor $c7c3ec
$0b:fd2d  04 e9		 tsb $e9
$0b:fd2f  c7 3e		 cmp [$3e]
$0b:fd31  51 cb		 eor ($cb),y
$0b:fd33  34 02		 bit $02,x
$0b:fd35  7d 00 9e	  adc $9e00,x
$0b:fd38  40			rti
$0b:fd39  23 1f		 and $1f,s
$0b:fd3b  dd 9f 8f	  cmp $8f9f,x
$0b:fd3e  bf d3 f7 fc   lda $fcf7d3,x
$0b:fd42  bd d6 6b	  lda $6bd6,x
$0b:fd45  d4 fa		 pei ($fa)
$0b:fd47  7d 3c 9e	  adc $9e3c,x
$0b:fd4a  46 23		 lsr $23
$0b:fd4c  0e f0 00	  asl $00f0
$0b:fd4f  04 12		 tsb $12
$0b:fd51  09 05 1e	  ora #$1e05
$0b:fd54  04 1a		 tsb $1a
$0b:fd56  0e 29 08	  asl $0829
$0b:fd59  3c 76 12	  bit $1276,x
$0b:fd5c  f5 07		 sbc $07,x
$0b:fd5e  80 40		 bra $fda0
$0b:fd60  e0 ec		 cpx #$ec
$0b:fd62  30 0c		 bmi $fd70
$0b:fd64  8c 0d f6	  sty $f60d
$0b:fd67  10 e8		 bpl $fd51
$0b:fd69  46 a3		 lsr $a3
$0b:fd6b  01 d1		 ora ($d1,x)
$0b:fd6d  a8			tay
$0b:fd6e  6e 67 37	  ror $3767
$0b:fd71  ba			tsx
$0b:fd72  0f 5f 09 3b   ora $3b095f
$0b:fd76  c8			iny
$0b:fd77  f5 69		 sbc $69,x
$0b:fd79  7e db ad	  ror $addb,x
$0b:fd7c  a3 c1		 lda $c1,s
$0b:fd7e  a9 b8 70	  lda #$70b8
$0b:fd81  62 38 2c	  per $29bc
$0b:fd84  04 e3		 tsb $e3
$0b:fd86  01 7c		 ora ($7c,x)
$0b:fd88  88			dey
$0b:fd89  4c 07 22	  jmp $2207
$0b:fd8c  0d 10 70	  ora $7010
$0b:fd8f  70 34		 bvs $fdc5
$0b:fd91  16 00		 asl $00,x
$0b:fd93  f8			sed
$0b:fd94  5c 03 a3 d0   jml $d0a303
$0b:fd98  cc 07 43	  cpy $4307
$0b:fd9b  00 2c		 brk #$2c
$0b:fd9d  10 11		 bpl $fdb0
$0b:fd9f  07 c2		 ora [$c2]
$0b:fda1  20 1e 00	  jsr $001e
$0b:fda4  08			php
$0b:fda5  a1 c0		 lda ($c0,x)
$0b:fda7  22 97 0b 84   jsl $840b97
$0b:fdab  c0 36		 cpy #$36
$0b:fdad  20 ff 17	  jsr $17ff
$0b:fdb0  bf e3 f1 3f   lda $3ff1e3,x
$0b:fdb4  9f ae 44 61   sta $6144ae,x
$0b:fdb8  fe 02 88	  inc $8802,x
$0b:fdbb  85 d9		 sta $d9
$0b:fdbd  5a			phy
$0b:fdbe  04 fe		 tsb $fe
$0b:fdc0  82 43 60	  brl $5e06
$0b:fdc3  30 b5		 bmi $fd7a
$0b:fdc5  c0 40		 cpy #$40
$0b:fdc7  a2 f1		 ldx #$f1
$0b:fdc9  19 ac 9a	  ora $9aac,y
$0b:fdcc  59 04 96	  eor $9604,y
$0b:fdcf  c7 63		 cmp [$63]
$0b:fdd1  90 d8		 bcc $fdab
$0b:fdd3  04 2e		 tsb $2e
$0b:fdd5  08			php
$0b:fdd6  ba			tsx
$0b:fdd7  08			php
$0b:fdd8  bc 02 6b	  ldy $6b02,x
$0b:fddb  02 96		 cop #$96
$0b:fddd  44 e5 b1	  mvp $b1,$e5
$0b:fde0  38			sec
$0b:fde1  e3 28		 sbc $28,s
$0b:fde3  40			rti
$0b:fde4  e1 40		 sbc ($40,x)
$0b:fde6  e0 60		 cpx #$60
$0b:fde8  30 0f		 bmi $fdf9
$0b:fdea  30 c0		 bmi $fdac
$0b:fdec  24 c2		 bit $c2
$0b:fdee  d1 40		 cmp ($40),y
$0b:fdf0  b4 00		 ldy $00,x
$0b:fdf2  89 e2 09	  bit #$09e2
$0b:fdf5  91 49		 sta ($49),y
$0b:fdf7  06 02		 asl $02
$0b:fdf9  d0 aa		 bne $fda5
$0b:fdfb  18			clc
$0b:fdfc  9c fe 1b	  stz $1bfe
$0b:fdff  2d 8a cc	  and $cc8a
$0b:fe02  62 71 38	  per $3676
$0b:fe05  54 6e 2d	  mvn $2d,$6e
$0b:fe08  13 8b		 ora ($8b,s),y
$0b:fe0a  d4 e1		 pei ($e1)
$0b:fe0c  37 b9		 and [$b9],y
$0b:fe0e  fc 02 5b	  jsr ($5b02,x)
$0b:fe11  12 98		 ora ($98)
$0b:fe13  c3 a2		 cmp $a2,s
$0b:fe15  70 c8		 bvs $fddf
$0b:fe17  dc 11 8a	  jml [$8a11]
$0b:fe1a  15 38		 ora $38,x
$0b:fe1c  65 ee		 adc $ee
$0b:fe1e  09 a0 c4	  ora #$c4a0
$0b:fe21  6c 33 14	  jmp ($1433)
$0b:fe24  0e c4 83	  asl $83c4
$0b:fe27  e5 80		 sbc $80
$0b:fe29  fb			xce
$0b:fe2a  70 3f		 bvs $fe6b
$0b:fe2c  9a			txs
$0b:fe2d  8d e6 63	  sta $63e6
$0b:fe30  39 88 b8	  and $b888,y
$0b:fe33  66 2c		 ror $2c
$0b:fe35  0d 41 80	  ora $8041
$0b:fe38  7d a0 1f	  adc $1fa0,x
$0b:fe3b  c8			iny
$0b:fe3c  06 f2		 asl $f2
$0b:fe3e  81 9c		 sta ($9c,x)
$0b:fe40  b0 4c		 bcs $fe8e
$0b:fe42  22 11 e8 b4   jsl $b4e811
$0b:fe46  36 17		 rol $17,x
$0b:fe48  07 83		 ora [$83]
$0b:fe4a  40			rti
$0b:fe4b  60			rts
$0b:fe4c  23 f6		 and $f6,s
$0b:fe4e  88			dey
$0b:fe4f  44 21 10	  mvp $10,$21
$0b:fe52  88			dey
$0b:fe53  33 da		 and ($da,s),y
$0b:fe55  52 20		 eor ($20)
$0b:fe57  97 0b		 sta [$0b],y
$0b:fe59  ff ff c7 9f   sbc $9fc7ff,x
$0b:fe5d  bf de 21 f0   lda $f021de,x
$0b:fe61  f1 fc		 sbc ($fc),y
$0b:fe63  25 42		 and $42
$0b:fe65  f0 1a		 beq $fe81
$0b:fe67  3b			tsc
$0b:fe68  4d 26 e1	  eor $e126
$0b:fe6b  07 94		 ora [$94]
$0b:fe6d  43 e6		 eor $e6,s
$0b:fe6f  0b			phd
$0b:fe70  f0 bf		 beq $fe31
$0b:fe72  c3 2f		 cmp $2f,s
$0b:fe74  91 1b		 sta ($1b),y
$0b:fe76  8c 32 7f	  sty $7f32
$0b:fe79  49 9b 41	  eor #$419b
$0b:fe7c  ef 70 fb b4   sbc $b4fb70
$0b:fe80  fe 0d 7f	  inc $7f0d,x
$0b:fe83  bf 5f 2e 77   lda $772e5f,x
$0b:fe87  1b			tcs
$0b:fe88  74 fe		 stz $fe,x
$0b:fe8a  43 04		 eor $04,s
$0b:fe8c  fb			xce
$0b:fe8d  c0 3f		 cpy #$3f
$0b:fe8f  f8			sed
$0b:fe90  6f fe 03 fe   adc $fe03fe
$0b:fe94  51 0c		 eor ($0c),y
$0b:fe96  07 f9		 ora [$f9]
$0b:fe98  d0 3e		 bne $fed8
$0b:fe9a  0f bd a7 ff   ora $ffa7bd
$0b:fe9e  c3 ff		 cmp $ff,s
$0b:fea0  cc 7f f3	  cpy $f37f
$0b:fea3  ff fd ff fd   sbc $fdfffd,x
$0b:fea7  7e fe 5f	  ror $5ffe,x
$0b:feaa  3c 1e 08	  bit $081e,x
$0b:fead  0d cf a1	  ora $a1cf
$0b:feb0  93 c1		 sta ($c1,s),y
$0b:feb2  43 b0		 eor $b0,s
$0b:feb4  f5 ca		 sbc $ca,x
$0b:feb6  35 f2		 and $f2,x
$0b:feb8  06 36		 asl $36
$0b:feba  3b			tsc
$0b:febb  9d c3 27	  sta $27c3,x
$0b:febe  63 87		 adc $87,s
$0b:fec0  7b			tdc
$0b:fec1  6b			rtl
$0b:fec2  9b			txy
$0b:fec3  bb			tyx
$0b:fec4  e6 ee		 inc $ee
$0b:fec6  7f 7c bf df   adc $dfbf7c,x
$0b:feca  09 21 1a	  ora #$1a21
$0b:fecd  8c 41 60	  sty $6041
$0b:fed0  b4 1a		 ldy $1a,x
$0b:fed2  0d 42 81	  ora $8142
$0b:fed5  68			pla
$0b:fed6  b4 4c		 ldy $4c,x
$0b:fed8  26 00		 rol $00
$0b:feda  d2 83		 cmp ($83)
$0b:fedc  47 a0		 eor [$a0]
$0b:fede  50 79		 bvc $ff59
$0b:fee0  85 c6		 sta $c6
$0b:fee2  71 78		 adc ($78),y
$0b:fee4  88			dey
$0b:fee5  5e 20 09	  lsr $0920,x
$0b:fee8  a3 8c		 lda $8c,s
$0b:feea  40			rti
$0b:feeb  e1 11		 sbc ($11,x)
$0b:feed  0b			phd
$0b:feee  05 c2		 ora $c2
$0b:fef0  07 21		 ora [$21]
$0b:fef2  81 d0		 sta ($d0,x)
$0b:fef4  1f 03 01 83   ora $830103,x
$0b:fef8  41 e5		 eor ($e5,x)
$0b:fefa  90 09		 bcc $ff05
$0b:fefc  02 ec		 cop #$ec
$0b:fefe  20 14 38	  jsr $3814
$0b:ff01  0e 06 01	  asl $0106
$0b:ff04  02 64		 cop #$64
$0b:ff06  0b			phd
$0b:ff07  fc 32 76	  jsr ($7632,x)
$0b:ff0a  8d 16 23	  sta $2316
$0b:ff0d  eb			xba
$0b:ff0e  0d 9b 4b	  ora $4b9b
$0b:ff11  a6 50		 ldx $50
$0b:ff13  e8			inx
$0b:ff14  dc 1e 01	  jml [$011e]
$0b:ff17  27 80		 and [$80]
$0b:ff19  48			pha
$0b:ff1a  5b			tcd
$0b:ff1b  41 57		 eor ($57,x)
$0b:ff1d  80 64		 bra $ff83
$0b:ff1f  a0 19		 ldy #$19
$0b:ff21  18			clc
$0b:ff22  04 c5		 tsb $c5
$0b:ff24  80 31		 bra $ff57
$0b:ff26  07 50		 ora [$50]
$0b:ff28  ee 21 16	  inc $1621
$0b:ff2b  8a			txa
$0b:ff2c  46 52		 lsr $52
$0b:ff2e  09 54 a2	  ora #$a254
$0b:ff31  73 39		 adc ($39,s),y
$0b:ff33  97 4f		 sta [$4f],y
$0b:ff35  a5 63		 lda $63
$0b:ff37  f8			sed
$0b:ff38  5b			tcd
$0b:ff39  0f 84 03 e1   ora $e10384
$0b:ff3d  40			rti
$0b:ff3e  fc 3b 81	  jsr ($813b,x)
$0b:ff41  52 30		 eor ($30)
$0b:ff43  81 09		 sta ($09,x)
$0b:ff45  a6 42		 ldx $42
$0b:ff47  20 11 30	  jsr $3011
$0b:ff4a  51 ae		 eor ($ae),y
$0b:ff4c  c2 02		 rep #$02
$0b:ff4e  0f e0 ba 27   ora $27bae0
$0b:ff52  42 39		 wdm #$39
$0b:ff54  1c 46 07	  trb $0746
$0b:ff57  c3 e1		 cmp $e1,s
$0b:ff59  80 c0		 bra $ff1b
$0b:ff5b  0b			phd
$0b:ff5c  fa			plx
$0b:ff5d  31 18		 and ($18),y
$0b:ff5f  84 14		 sty $14
$0b:ff61  44 5e c9	  mvp $c9,$5e
$0b:ff64  d0 27		 bne $ff8d
$0b:ff66  f4 1e 2b	  pea $2b1e
$0b:ff69  09 9d c1	  ora #$c19d
$0b:ff6c  66 51		 ror $51
$0b:ff6e  48			pha
$0b:ff6f  94 16		 sty $16,x
$0b:ff71  25 0b		 and $0b
$0b:ff73  8c 41 21	  sty $2141
$0b:ff76  90 13		 bcc $ff8b
$0b:ff78  78			sei
$0b:ff79  42 a7		 wdm #$a7
$0b:ff7b  70 69		 bvs $ffe6
$0b:ff7d  94 3e		 sty $3e,x
$0b:ff7f  24 84		 bit $84
$0b:ff81  18			clc
$0b:ff82  c4 1e		 cpy $1e
$0b:ff84  19 03 6f	  ora $6f03,y
$0b:ff87  86 a3		 stx $a3
$0b:ff89  f9 60 f2	  sbc $f260,y
$0b:ff8c  57 38		 eor [$38],y
$0b:ff8e  9d 4e 24	  sta $244e,x
$0b:ff91  a2 59		 ldx #$59
$0b:ff93  50 ac		 bvc $ff41
$0b:ff95  50 2e		 bvc $ffc5
$0b:ff97  18			clc
$0b:ff98  0e 03 f0	  asl $f003
$0b:ff9b  3c 91 8e	  bit $8e91,x
$0b:ff9e  24 e1		 bit $e1
$0b:ffa0  46 12		 lsr $12
$0b:ffa2  ce 85 63	  dec $6385
$0b:ffa5  40			rti
$0b:ffa6  9c 16 d8	  stz $d816
$0b:ffa9  5f e1 57 e9   eor $e957e1,x
$0b:ffad  95 fa		 sta $fa,x
$0b:ffaf  2f 3e 82 47   and $47823e
$0b:ffb3  20 50 64	  jsr $6450
$0b:ffb6  60			rts
$0b:ffb7  c0 ef		 cpy #$ef
$0b:ffb9  f0 0b		 beq $ffc6
$0b:ffbb  f4 05 82	  pea $8205
$0b:ffbe  13 e8		 ora ($e8,s),y
$0b:ffc0  0c 72 07	  tsb $0772
$0b:ffc3  06 3e		 asl $3e
$0b:ffc5  82 f4 20	  brl $20bc
$0b:ffc8  1d 0c f4	  ora $f40c,x
$0b:ffcb  b2 9d		 lda ($9d)
$0b:ffcd  ac a7 66	  ldy $66a7
$0b:ffd0  2d da 8a	  and $8ada
$0b:ffd3  65 62		 adc $62
$0b:ffd5  39 e0 01	  and $01e0,y
$0b:ffd8  87 83		 sta [$83]
$0b:ffda  3d 60 a7	  and $a760,x
$0b:ffdd  7c 1c 21	  jmp ($211c,x)
$0b:ffe0  6e f8 53	  ror $53f8
$0b:ffe3  3e 0d a3	  rol $a30d,x
$0b:ffe6  80 00		 bra $ffe8
$0b:ffe8  4a			lsr a
$0b:ffe9  29 00 00	  and #$0000
$0b:ffec  df 22 df 73   cmp $73df22,x
$0b:fff0  4a			lsr a
$0b:fff1  29 00 00	  and #$0000
$0b:fff4  e0 78		 cpx #$78
$0b:fff6  1c 00 4a	  trb $4a00
$0b:fff9  29 00 00	  and #$0000
$0b:fffc  e0 78		 cpx #$78
$0b:fffe  1c 00 58	  trb $5800
