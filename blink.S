#define __SFR_OFFSET 0

#include "avr/io.h"

.global main
.equ COUNT1, 30

; Code for Arduino Mega 2560

main:
	LDI R16, 0x80     ; load immediate value 0x80 into R16 
	OUT DDRB, R16     ; set PORTB (pin 13) as output

L1:   
	CALL ledOFF       ; call subroutine ledOFF
	CALL delay        ; call subroutine delay
	CALL ledON        ; call subroutine ledON
	CALL delay        ; call subroutine delay
	JMP L1           ; jump to L1

delay:
	  LDI R20, 25
D0: LDI R21, 255
D1: LDI R22, 250
D2: NOP
    NOP
    DEC R22
    BRNE D2
    DEC R21
    BRNE D1
    DEC R20
    BRNE D0
    RET

ledON:
	LDI R16, 0x80     ; load immediate value 0x80 into R16
	OUT PORTB, R16    ; set PORTB (pin 13) as output
	RET               ; return from subroutine

ledOFF:
	LDI R16, 0x00
	OUT PORTB, R16      ; set PORTB (pin 13) as output
	RET               ; return from subroutine