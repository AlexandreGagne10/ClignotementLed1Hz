#define __SFR_OFFSET 0

#include "avr/io.h"

.global main

; Code for Arduino Mega 2560

main:
  LDI R16, 0x80     ; load immediate value 0x80 into R16 
	OUT DDRB, R16     ; set PORTB (pin 13) as output

LDI R17, 255        ; load immediate value 255 into R17
LDI R18, 2          ; load immediate value 2 into R18
L1:   
  CALL ledOFF       ; call subroutine ledOFF
  CALL delay        ; call subroutine delay
  CALL ledON        ; call subroutine ledON
  CALL delay        ; call subroutine delay
  
  RJMP L1           ; jump to L1

delay:
  DEC R17           ; decrement R17
  NOP               ; no operation
  BRNE delay        ; branch if not equal to delay
  RET               ; return from subroutine

ledON:
  LDI R16, 0x80     ; load immediate value 0x80 into R16
  OUT PORTB, R16    ; set PORTB (pin 13) as output
  RET               ; return from subroutine

ledOFF:
  OUT PORTB, 0      ; set PORTB (pin 13) as output
  RET               ; return from subroutine
