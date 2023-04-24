#define __SFR_OFFSET 0

#include "avr/io.h"

.global main          ; (global) déclare la fonction main comme globale

; Ce code fonctionne sur le Arduino Mega 2560
; Vous pouvez utiliser le code suivant dans le IDE Arduino 
; ou sur le IDE Microchip Studio

main:
	LDI R20, HIGH(RAMEND)
	OUT SPH, R20
	LDI R20, LOW(RAMEND)
	OUT SPL, R20
	LDI R20, 0x00
	OUT DDRB, R20

L1:
	SBI PORTB, 7
	CALL DELAY
	CBI PORTB, 7
	CALL DELAY
	RJMP L1

DELAY:
	LDI R20, 25       ; (load immediate) la valeur 25 dans R20
D0:	LDI R21, 255      ; (load immediate) la valeur 255 dans R21
D1:	LDI R22, 255      ; (load immediate) la valeur 250 dans R22
D2:	NOP               ; (no operation)
	NOP               ; (no operation)
	DEC R22           ; (decrement) decremente R22 
	BRNE D2           ; (branch if not equal) si R22 != 0 alors D2
	DEC R21           ; (decrement) decremente R21
	BRNE D1           ; (branch if not equal) si R21 != 0 alors D1
	DEC R20           ; (decrement) decremente R20
	BRNE D0           ; (branch if not equal) si R20 != 0 alors D0
	RET               ; (return) retourne de la subroutine
