; Atari 2600 Hardware Constants
; TIA Registers and RIOT Definitions

	.platform atari2600

; ============================================================================
; TIA Write Registers ($00-$2C)
; ============================================================================

VSYNC   = $00    ; Vertical Sync
VBLANK  = $01    ; Vertical Blank
WSYNC   = $02    ; Wait for Sync
RSYNC   = $03    ; Reset Sync
NUSIZ0  = $04    ; Number/Size Player 0
NUSIZ1  = $05    ; Number/Size Player 1
COLUP0  = $06    ; Color Player 0
COLUP1  = $07    ; Color Player 1
COLUPF  = $08    ; Color Playfield
COLUBK  = $09    ; Color Background
CTRLPF  = $0a    ; Control Playfield
REFP0   = $0b    ; Reflect Player 0
REFP1   = $0c    ; Reflect Player 1
PF0     = $0d    ; Playfield 0
PF1     = $0e    ; Playfield 1
PF2     = $0f    ; Playfield 2
RESP0   = $10    ; Reset Player 0
RESP1   = $11    ; Reset Player 1
RESM0   = $12    ; Reset Missile 0
RESM1   = $13    ; Reset Missile 1
RESBL   = $14    ; Reset Ball
AUDC0   = $15    ; Audio Control 0
AUDC1   = $16    ; Audio Control 1
AUDF0   = $17    ; Audio Frequency 0
AUDF1   = $18    ; Audio Frequency 1
AUDV0   = $19    ; Audio Volume 0
AUDV1   = $1a    ; Audio Volume 1
GRP0    = $1b    ; Graphics Player 0
GRP1    = $1c    ; Graphics Player 1
ENAM0   = $1d    ; Enable Missile 0
ENAM1   = $1e    ; Enable Missile 1
ENABL   = $1f    ; Enable Ball
HMP0    = $20    ; Horizontal Motion Player 0
HMP1    = $21    ; Horizontal Motion Player 1
HMM0    = $22    ; Horizontal Motion Missile 0
HMM1    = $23    ; Horizontal Motion Missile 1
HMBL    = $24    ; Horizontal Motion Ball
VDELP0  = $25    ; Vertical Delay Player 0
VDELP1  = $26    ; Vertical Delay Player 1
VDELBL  = $27    ; Vertical Delay Ball
RESMP0  = $28    ; Reset Missile 0 to Player 0
RESMP1  = $29    ; Reset Missile 1 to Player 1
HMOVE   = $2a    ; Apply Horizontal Motion
HMCLR   = $2b    ; Clear Horizontal Move Registers
CXCLR   = $2c    ; Clear Collision Latches

; ============================================================================
; TIA Read Registers ($00-$0D)
; ============================================================================

CXM0P   = $00    ; Collision M0-P1, M0-P0
CXM1P   = $01    ; Collision M1-P0, M1-P1
CXP0FB  = $02    ; Collision P0-PF, P0-BL
CXP1FB  = $03    ; Collision P1-PF, P1-BL
CXM0FB  = $04    ; Collision M0-PF, M0-BL
CXM1FB  = $05    ; Collision M1-PF, M1-BL
CXBLPF  = $06    ; Collision BL-PF
CXPPMM  = $07    ; Collision P0-P1, M0-M1
INPT0   = $08    ; Paddle 0 Input
INPT1   = $09    ; Paddle 1 Input
INPT2   = $0a    ; Paddle 2 Input
INPT3   = $0b    ; Paddle 3 Input
INPT4   = $0c    ; Joystick 0 Trigger
INPT5   = $0d    ; Joystick 1 Trigger

; ============================================================================
; RIOT Registers ($280-$297)
; ============================================================================

SWCHA   = $0280  ; Port A - Joystick Data
SWACNT  = $0281  ; Port A DDR
SWCHB   = $0282  ; Port B - Console Switches
SWBCNT  = $0283  ; Port B DDR
INTIM   = $0284  ; Timer Output
TIMINT  = $0285  ; Timer Interrupt

TIM1T   = $0294  ; Set 1-clock Timer
TIM8T   = $0295  ; Set 8-clock Timer
TIM64T  = $0296  ; Set 64-clock Timer
T1024T  = $0297  ; Set 1024-clock Timer
