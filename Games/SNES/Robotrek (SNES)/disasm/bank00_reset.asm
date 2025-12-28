; Robotrek Disassembly
; Start: $C08000, Length: $0400
; ROM: ~roms\SNES\GoodSNES\Robotrek (U) [!].sfc


Reset:
$C08000:  78            SEI  ; Game entry point
$C08001:  18            CLC
$C08002:  fb            XCE
$C08003:  9c 0b 42      STZ $420b
$C08006:  9c 0c 42      STZ $420c
$C08009:  5c 1d 80 80   JML $80801d
$C0800D:  5c 43 fb 8b   JML $8bfb43
$C08011:  5c c8 fb 8b   JML $8bfbc8
$C08015:  5c e8 9e 80   JML $809ee8
$C08019:  5c c9 fb 8b   JML $8bfbc9
$C0801D:  d8            CLD
$C0801E:  c2 30         REP #$30
$C08020:  a9 00 00      LDA #$0000
$C08023:  5b            TCD
$C08024:  a9 ff 01      LDA #$01ff
$C08027:  1b            TCS
$C08028:  e2 20         SEP #$20
$C0802A:  a9 81         LDA #$81
$C0802C:  48            PHA
$C0802D:  ab            PLB
$C0802E:  22 ff 82 80   JSL $8082ff
$C08032:  a2 08 00      LDX #$0008
$C08035:  22 23 82 80   JSL $808223
$C08039:  22 fc 81 80   JSL $8081fc
$C0803D:  22 fc 81 80   JSL $8081fc
$C08041:  22 00 80 84   JSL $848000
$C08045:  22 99 81 80   JSL $808199
$C08049:  80 f2         BRA $803d
$C0804B:  ee cf 00      INC $00cf
$C0804E:  8b            PHB
$C0804F:  48            PHA
$C08050:  eb            XBA
$C08051:  48            PHA
$C08052:  da            PHX
$C08053:  5a            PHY
$C08054:  a9 81         LDA #$81
$C08056:  48            PHA
$C08057:  ab            PLB
$C08058:  a2 06 00      LDX #$0006
$C0805B:  b4 d1         LDY $d1,X
$C0805D:  5a            PHY
$C0805E:  a4 cd         LDY $cd
$C08060:  5a            PHY
$C08061:  22 80 82 80   JSL $808280
$C08065:  a2 00 00      LDX #$0000
$C08068:  a0 f7 83      LDY #$83f7
$C0806B:  22 77 82 80   JSL $808277
$C0806F:  a2 06 00      LDX #$0006
$C08072:  a0 91 85      LDY #$8591
$C08075:  22 77 82 80   JSL $808277
$C08079:  22 fc 81 80   JSL $8081fc
$C0807D:  22 00 80 84   JSL $848000
$C08081:  22 cb 80 84   JSL $8480cb
$C08085:  a2 00 00      LDX #$0000
$C08088:  a0 3f 83      LDY #$833f
$C0808B:  22 77 82 80   JSL $808277
$C0808F:  22 96 82 80   JSL $808296
$C08093:  7a            PLY
$C08094:  84 cd         STY $cd
$C08096:  a2 06 00      LDX #$0006
$C08099:  7a            PLY
$C0809A:  94 d1         STY $d1,X
$C0809C:  7a            PLY
$C0809D:  fa            PLX
$C0809E:  68            PLA
$C0809F:  eb            XBA
$C080A0:  68            PLA
$C080A1:  ab            PLB
$C080A2:  6b            RTL
$C080A3:  8b            PHB
$C080A4:  48            PHA
$C080A5:  eb            XBA
$C080A6:  48            PHA
$C080A7:  da            PHX
$C080A8:  5a            PHY
$C080A9:  a9 81         LDA #$81
$C080AB:  48            PHA
$C080AC:  ab            PLB
$C080AD:  a2 06 00      LDX #$0006
$C080B0:  b4 d1         LDY $d1,X
$C080B2:  5a            PHY
$C080B3:  a4 cd         LDY $cd
$C080B5:  5a            PHY
$C080B6:  22 80 82 80   JSL $808280
$C080BA:  a2 00 00      LDX #$0000
$C080BD:  a0 f7 83      LDY #$83f7
$C080C0:  22 77 82 80   JSL $808277
$C080C4:  a2 06 00      LDX #$0006
$C080C7:  a0 ab 85      LDY #$85ab
$C080CA:  22 77 82 80   JSL $808277
$C080CE:  22 fc 81 80   JSL $8081fc
$C080D2:  22 00 80 84   JSL $848000
$C080D6:  22 cb 80 84   JSL $8480cb
$C080DA:  a2 00 00      LDX #$0000
$C080DD:  a0 3f 83      LDY #$833f
$C080E0:  22 77 82 80   JSL $808277
$C080E4:  22 96 82 80   JSL $808296
$C080E8:  7a            PLY
$C080E9:  84 cd         STY $cd
$C080EB:  a2 06 00      LDX #$0006
$C080EE:  7a            PLY
$C080EF:  94 d1         STY $d1,X
$C080F1:  7a            PLY
$C080F2:  fa            PLX
$C080F3:  68            PLA
$C080F4:  eb            XBA
$C080F5:  68            PLA
$C080F6:  ab            PLB
$C080F7:  6b            RTL
$C080F8:  08            PHP
$C080F9:  e2 20         SEP #$20
$C080FB:  a2 06 00      LDX #$0006
$C080FE:  b4 d1         LDY $d1,X
$C08100:  5a            PHY
$C08101:  a4 cd         LDY $cd
$C08103:  5a            PHY
$C08104:  22 80 82 80   JSL $808280
$C08108:  a2 00 00      LDX #$0000
$C0810B:  a0 f7 83      LDY #$83f7
$C0810E:  22 77 82 80   JSL $808277
$C08112:  a2 06 00      LDX #$0006
$C08115:  a0 9e 85      LDY #$859e
$C08118:  22 77 82 80   JSL $808277
$C0811C:  22 fc 81 80   JSL $8081fc
$C08120:  a2 00 00      LDX #$0000
$C08123:  a0 3f 83      LDY #$833f
$C08126:  22 77 82 80   JSL $808277
$C0812A:  22 96 82 80   JSL $808296
$C0812E:  7a            PLY
$C0812F:  84 cd         STY $cd
$C08131:  a2 06 00      LDX #$0006
$C08134:  7a            PLY
$C08135:  94 d1         STY $d1,X
$C08137:  28            PLP
$C08138:  6b            RTL
$C08139:  8b            PHB
$C0813A:  48            PHA
$C0813B:  eb            XBA
$C0813C:  48            PHA
$C0813D:  da            PHX
$C0813E:  5a            PHY
$C0813F:  a9 81         LDA #$81
$C08141:  48            PHA
$C08142:  ab            PLB
$C08143:  a2 06 00      LDX #$0006
$C08146:  b4 d1         LDY $d1,X
$C08148:  5a            PHY
$C08149:  a4 cd         LDY $cd
$C0814B:  5a            PHY
$C0814C:  22 80 82 80   JSL $808280
$C08150:  a2 00 00      LDX #$0000
$C08153:  a0 f7 83      LDY #$83f7
$C08156:  22 77 82 80   JSL $808277
$C0815A:  a2 06 00      LDX #$0006
$C0815D:  a0 95 85      LDY #$8595
$C08160:  22 77 82 80   JSL $808277
$C08164:  22 fc 81 80   JSL $8081fc
$C08168:  22 00 80 84   JSL $848000
$C0816C:  22 cb 80 84   JSL $8480cb
$C08170:  a2 00 00      LDX #$0000
$C08173:  a0 3f 83      LDY #$833f
$C08176:  22 77 82 80   JSL $808277
$C0817A:  22 96 82 80   JSL $808296
$C0817E:  7a            PLY
$C0817F:  84 cd         STY $cd
$C08181:  a2 06 00      LDX #$0006
$C08184:  7a            PLY
$C08185:  94 d1         STY $d1,X
$C08187:  7a            PLY
$C08188:  fa            PLX
$C08189:  68            PLA
$C0818A:  eb            XBA
$C0818B:  68            PLA
$C0818C:  ab            PLB
$C0818D:  6b            RTL
$C0818E:  20 ed 81      JSR $81ed
$C08191:  d0 fb         BNE $818e
$C08193:  20 ed 81      JSR $81ed
$C08196:  f0 fb         BEQ $8193
$C08198:  6b            RTL
$C08199:  ad 94 05      LDA $0594
$C0819C:  30 4e         BMI $81ec
$C0819E:  d0 42         BNE $81e2
$C081A0:  ad 61 05      LDA $0561
$C081A3:  89 10         BIT #$10
$C081A5:  f0 45         BEQ $81ec
$C081A7:  ee 94 05      INC $0594
$C081AA:  a9 0b         LDA #$0b
$C081AC:  8d 00 21      STA $2100
$C081AF:  c2 20         REP #$20
$C081B1:  a0 4d e8      LDY #$e84d
$C081B4:  22 d1 cc 8b   JSL $8bccd1
$C081B8:  e2 20         SEP #$20
$C081BA:  20 ed 81      JSR $81ed
$C081BD:  ad e2 0e      LDA $0ee2
$C081C0:  89 01         BIT #$01
$C081C2:  d0 f6         BNE $81ba
$C081C4:  20 ed 81      JSR $81ed
$C081C7:  d0 fb         BNE $81c4
$C081C9:  20 ed 81      JSR $81ed
$C081CC:  f0 fb         BEQ $81c9
$C081CE:  a9 0f         LDA #$0f
$C081D0:  8d 00 21      STA $2100
$C081D3:  c2 20         REP #$20
$C081D5:  a0 70 e8      LDY #$e870
$C081D8:  22 d1 cc 8b   JSL $8bccd1
$C081DC:  e2 20         SEP #$20
$C081DE:  20 ed 81      JSR $81ed
$C081E1:  6b            RTL
$C081E2:  ad 61 05      LDA $0561
$C081E5:  89 10         BIT #$10
$C081E7:  d0 03         BNE $81ec
$C081E9:  9c 94 05      STZ $0594
$C081EC:  6b            RTL
$C081ED:  d4 32         PEI ($32)
$C081EF:  22 00 80 84   JSL $848000
$C081F3:  7a            PLY
$C081F4:  84 32         STY $32
$C081F6:  ad 67 05      LDA $0567
$C081F9:  89 10         BIT #$10
$C081FB:  60            RTS
$C081FC:  22 cb 80 84   JSL $8480cb
$C08200:  a6 cb         LDX $cb
$C08202:  e4 c9         CPX $c9
$C08204:  f0 18         BEQ $821e
$C08206:  8a            TXA
$C08207:  1a            INC
$C08208:  29 1f         AND #$1f
$C0820A:  85 cb         STA $cb
$C0820C:  a9 00         LDA #$00
$C0820E:  eb            XBA
$C0820F:  b5 a9         LDA $a9,X
$C08211:  74 a9         STZ $a9,X
$C08213:  30 09         BMI $821e
$C08215:  aa            TAX
$C08216:  86 cd         STX $cd
$C08218:  f4 ff 81      PEA $81ff
$C0821B:  7c d1 00      JMP ($00d1,X)
$C0821E:  22 ba 80 84   JSL $8480ba
$C08222:  6b            RTL
$C08223:  ad c9 00      LDA $00c9
$C08226:  1a            INC
$C08227:  29 1f         AND #$1f
$C08229:  cd cb 00      CMP $00cb
$C0822C:  d0 03         BNE $8231
$C0822E:  20 ca 82      JSR $82ca
$C08231:  ac c9 00      LDY $00c9
$C08234:  8d c9 00      STA $00c9
$C08237:  8a            TXA
$C08238:  99 a9 00      STA $00a9,Y
$C0823B:  6b            RTL
$C0823C:  a6 cd         LDX $cd
$C0823E:  7a            PLY
$C0823F:  c8            INY
$C08240:  94 d1         STY $d1,X
$C08242:  68            PLA
$C08243:  60            RTS
$C08244:  a5 c9         LDA $c9
$C08246:  1a            INC
$C08247:  29 1f         AND #$1f
$C08249:  c5 cb         CMP $cb
$C0824B:  d0 03         BNE $8250
$C0824D:  20 ca 82      JSR $82ca
$C08250:  a4 c9         LDY $c9
$C08252:  85 c9         STA $c9
$C08254:  a6 cd         LDX $cd
$C08256:  8a            TXA
$C08257:  99 a9 00      STA $00a9,Y
$C0825A:  7a            PLY
$C0825B:  c8            INY
$C0825C:  94 d1         STY $d1,X
$C0825E:  68            PLA
$C0825F:  60            RTS
$C08260:  a5 c9         LDA $c9
$C08262:  1a            INC
$C08263:  29 1f         AND #$1f
$C08265:  c5 cb         CMP $cb
$C08267:  d0 03         BNE $826c
$C08269:  20 ca 82      JSR $82ca
$C0826C:  94 d1         STY $d1,X
$C0826E:  a4 c9         LDY $c9
$C08270:  85 c9         STA $c9
$C08272:  8a            TXA
$C08273:  99 a9 00      STA $00a9,Y
$C08276:  6b            RTL
$C08277:  08            PHP
$C08278:  c2 20         REP #$20
$C0827A:  98            TYA
$C0827B:  9d d1 00      STA $00d1,X
$C0827E:  28            PLP
$C0827F:  6b            RTL
$C08280:  a5 cf         LDA $cf
$C08282:  d0 01         BNE $8285
$C08284:  6b            RTL
$C08285:  64 cf         STZ $cf
$C08287:  a5 cb         LDA $cb
$C08289:  3a            DEC
$C0828A:  29 1f 85      AND #$851f
$C0828D:  cb            WAI
$C0828E:  a0 a9 00      LDY #$00a9
$C08291:  a9 12 91      LDA #$9112
$C08294:  cb            WAI
$C08295:  6b            RTL
$C08296:  6b            RTL
$C08297:  8a            TXA
$C08298:  8d d0 00      STA $00d0
$C0829B:  6b            RTL
$C0829C:  94 d1         STY $d1,X
$C0829E:  8a            TXA
$C0829F:  85 d0         STA $d0
$C082A1:  6b            RTL
$C082A2:  a6 cd         LDX $cd
$C082A4:  8a            TXA
$C082A5:  85 d0         STA $d0
$C082A7:  7a            PLY
$C082A8:  c8            INY
$C082A9:  94 d1         STY $d1,X
$C082AB:  68            PLA
$C082AC:  60            RTS
$C082AD:  a5 d0         LDA $d0
$C082AF:  d0 01         BNE $82b2
$C082B1:  6b            RTL
$C082B2:  a5 c9         LDA $c9
$C082B4:  1a            INC
$C082B5:  29 1f c5      AND #$c51f
$C082B8:  cb            WAI
$C082B9:  d0 03         BNE $82be
$C082BB:  20 ca 82      JSR $82ca
$C082BE:  a4 c9         LDY $c9
$C082C0:  85 c9         STA $c9
$C082C2:  a5 d0         LDA $d0
$C082C4:  99 a9 00      STA $00a9,Y
$C082C7:  64 d0         STZ $d0
$C082C9:  6b            RTL
$C082CA:  0b            PHD
$C082CB:  5a            PHY
$C082CC:  da            PHX
$C082CD:  48            PHA
$C082CE:  a9 00 5b      LDA #$5b00
$C082D1:  a6 cb         LDX $cb
$C082D3:  8a            TXA
$C082D4:  1a            INC
$C082D5:  29 1f 85      AND #$851f
$C082D8:  cb            WAI
$C082D9:  a9 00 eb      LDA #$eb00
$C082DC:  b5 a9         LDA $a9,X
$C082DE:  30 18         BMI $82f8
$C082E0:  74 a9         STZ $a9,X
$C082E2:  d4 cd         PEI ($cd)
$C082E4:  aa            TAX
$C082E5:  86 cd         STX $cd
$C082E7:  fc d1 00      JSR ($00d1,X)
$C082EA:  fa            PLX
$C082EB:  86 cd         STX $cd
$C082ED:  ba            TSX
$C082EE:  e0 00 01      CPX #$0100
$C082F1:  90 0a         BCC $82fd
$C082F3:  68            PLA
$C082F4:  fa            PLX
$C082F5:  7a            PLY
$C082F6:  2b            PLD
$C082F7:  60            RTS
$C082F8:  68            PLA
$C082F9:  fa            PLX
$C082FA:  7a            PLY
$C082FB:  2b            PLD
$C082FC:  60            RTS
$C082FD:  80 fe         BRA $82fd
$C082FF:  a2 00 00      LDX #$0000
$C08302:  86 cb         STX $cb
$C08304:  86 c9         STX $c9
$C08306:  86 cd         STX $cd
$C08308:  64 cf         STZ $cf
$C0830A:  64 d0         STZ $d0
$C0830C:  a2 3f 83      LDX #$833f
$C0830F:  86 d1         STX $d1
$C08311:  a2 1c 84      LDX #$841c
$C08314:  86 d3         STX $d3
$C08316:  a2 5c 85      LDX #$855c
$C08319:  86 d5         STX $d5
$C0831B:  a2 6f 85      LDX #$856f
$C0831E:  86 d7         STX $d7
$C08320:  a2 b8 85      LDX #$85b8
$C08323:  86 d9         STX $d9
$C08325:  a2 f6 85      LDX #$85f6
$C08328:  86 db         STX $db
$C0832A:  a2 83 86      LDX #$8683
$C0832D:  86 dd         STX $dd
$C0832F:  a2 e1 86      LDX #$86e1
$C08332:  86 df         STX $df
$C08334:  a2 75 87      LDX #$8775
$C08337:  86 e1         STX $e1
$C08339:  a2 95 85      LDX #$8595
$C0833C:  86 e3         STX $e3
$C0833E:  6b            RTL
$C0833F:  ac a6 05      LDY $05a6
$C08342:  f0 03         BEQ $8347
$C08344:  4c eb 83      JMP $83eb
$C08347:  a2 00 00      LDX #$0000
$C0834A:  8e ac 05      STX $05ac
$C0834D:  8e ae 05      STX $05ae
$C08350:  ac aa 05      LDY $05aa
$C08353:  d0 03         BNE $8358
$C08355:  4c f5 83      JMP $83f5
$C08358:  c0 98 03      CPY #$0398
$C0835B:  90 03         BCC $8360
$C0835D:  4c f5 83      JMP $83f5
$C08360:  be e8 83      LDX $83e8,Y
$C08363:  d0 03         BNE $8368
$C08365:  4c f5 83      JMP $83f5
$C08368:  bd 00 00      LDA $0000,X
$C0836B:  c9 ff d0      CMP #$d0ff
$C0836E:  03 4c         ORA $4c,S
$C08370:  f5 83         SBC $83,X
$C08372:  ad b2 0b      LDA $0bb2
$C08375:  38            SEC
$C08376:  fd 00 00      SBC $0000,X
$C08379:  dd 02 00      CMP $0002,X
$C0837C:  b0 0c         BCS $838a
$C0837E:  ad b4 0b      LDA $0bb4
$C08381:  38            SEC
$C08382:  fd 01 00      SBC $0001,X
$C08385:  dd 03 00      CMP $0003,X
$C08388:  90 0c         BCC $8396
$C0838A:  c2 20         REP #$20
$C0838C:  8a            TXA
$C0838D:  18            CLC
$C0838E:  69 09 00      ADC #$0009
$C08391:  aa            TAX
$C08392:  e2 20         SEP #$20
$C08394:  80 d2         BRA $8368
$C08396:  c2 20         REP #$20
$C08398:  bd 00 00      LDA $0000,X
$C0839B:  29 ff 00      AND #$00ff
$C0839E:  0a            ASL
$C0839F:  0a            ASL
$C083A0:  0a            ASL
$C083A1:  0a            ASL
$C083A2:  85 00         STA $00
$C083A4:  bd 01 00      LDA $0001,X
$C083A7:  29 ff 00      AND #$00ff
$C083AA:  0a            ASL
$C083AB:  0a            ASL
$C083AC:  0a            ASL
$C083AD:  0a            ASL
$C083AE:  85 02         STA $02
$C083B0:  bd 02 00      LDA $0002,X
$C083B3:  29 ff 00      AND #$00ff
$C083B6:  0a            ASL
$C083B7:  0a            ASL
$C083B8:  0a            ASL
$C083B9:  0a            ASL
$C083BA:  38            SEC
$C083BB:  e9 0f 00      SBC #$000f
$C083BE:  85 04         STA $04
$C083C0:  bd 03 00      LDA $0003,X
$C083C3:  29 ff 00      AND #$00ff
$C083C6:  0a            ASL
$C083C7:  0a            ASL
$C083C8:  0a            ASL
$C083C9:  0a            ASL
$C083CA:  38            SEC
$C083CB:  e9 0f 00      SBC #$000f
$C083CE:  85 06         STA $06
$C083D0:  ad a6 0b      LDA $0ba6
$C083D3:  38            SEC
$C083D4:  e5 00         SBC $00
$C083D6:  c5 04         CMP $04
$C083D8:  b0 1b         BCS $83f5
$C083DA:  ad a8 0b      LDA $0ba8
$C083DD:  38            SEC
$C083DE:  e5 02         SBC $02
$C083E0:  c5 06         CMP $06
$C083E2:  b0 11         BCS $83f5
$C083E4:  e2 20         SEP #$20
$C083E6:  20 6f 9c      JSR $9c6f
$C083E9:  b0 0a         BCS $83f5
$C083EB:  a2 02 00      LDX #$0002
$C083EE:  22 23 82 80   JSL $808223
$C083F2:  ee d8 05      INC $05d8
$C083F5:  e2 20         SEP #$20
$C083F7:  22 db f2 8a   JSL $8af2db
$C083FB:  a2 06 00      LDX #$0006
$C083FE:  22 23 82 80   JSL $808223