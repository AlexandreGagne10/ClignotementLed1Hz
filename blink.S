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
	LDI R17, 255        ; load immediate value 255 into R17
	LDI R18, 150        ; load immediate value 255 into R8
	LDI R19, 31        ; load immediate value 255 into R8
	
	loop1:
		DEC R17
		NOP
		BRNE loop1
		LDI R17, 255
	loop2:
		DEC R18
		NOP
		BRNE loop1
		LDI R18, 255
	loop3:
		DEC R19
		NOP
		BRNE loop1
		LDI R19, 10
		RET

ledON:
	LDI R16, 0x80     ; load immediate value 0x80 into R16
	OUT PORTB, R16    ; set PORTB (pin 13) as output
	RET               ; return from subroutine

ledOFF:
	LDI R16, 0x00
	OUT PORTB, R16      ; set PORTB (pin 13) as output
	RET               ; return from subroutine
