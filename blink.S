#define __SFR_OFFSET 0

#include "avr/io.h"

.global main          ; (global) déclare la fonction main comme globale

; Ce code fonctionne sur le Arduino Mega 2560
; Vous pouvez utiliser le code suivant dans le IDE Arduino 
; ou sur le IDE Microchip Studio

main:
	LDI R16, 0x80     ; (load immediate) la valeur 0x80 dans R16
	OUT DDRB, R16     ; (output) la valeur de R16 dans DDRB (pin 13)

L1:   
	CALL ledOFF       ; (call subroutine) ledOFF
	CALL delay        ; (call subroutine) delay
	CALL ledON        ; (call subroutine) ledON
	CALL delay        ; (call subroutine) delay
	JMP L1            ; (jump) L1

delay:
	LDI R20, 25		  ; (load immediate) la valeur 25 dans R20
D0:	LDI R21, 255      ; (load immediate) la valeur 255 dans R21
D1:	LDI R22, 250      ; (load immediate) la valeur 250 dans R22
D2:	NOP               ; (no operation)
	NOP               ; (no operation)
	DEC R22           ; (decrement) decremente R22 
	BRNE D2           ; (branch if not equal) si R22 != 0 alors D2
	DEC R21           ; (decrement) decremente R21
	BRNE D1           ; (branch if not equal) si R21 != 0 alors D1
	DEC R20           ; (decrement) decremente R20
	BRNE D0           ; (branch if not equal) si R20 != 0 alors D0
	RET               ; (return) retourne de la subroutine

ledON:
	LDI R16, 0x80     ; (load immediate) la valeur 0x80 dans R16
	OUT PORTB, R16    ; (output) la valeur de R16 dans PORTB (pin 13)
	RET               ; (return) retourne de la subroutine

ledOFF:
	LDI R16, 0x00
	OUT PORTB, R16    ; (output) la valeur de R16 dans PORTB (pin 13)
	RET               ; (return) retourne de la subroutine