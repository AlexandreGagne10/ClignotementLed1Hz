#define __SFR_OFFSET 0

#include "avr/io.h"

.global main

main:
  LDI R16, 0b10000000
	OUT DDRB, R16

LDI R17, 255
LDI R18, 2
L1:
  CALL ledOFF
  CALL delay  
  CALL ledON
  CALL delay
  
  RJMP L1

delay:
  DEC R17
  NOP
  BRNE delay
  RET

ledON:
  LDI R16, 0x80
  OUT PORTB, R16
  RET

ledOFF:
  OUT PORTB, 0
  RET
