TITLE Assignment H04						(H04.asm)

; Miguel [Redacted]
; 10/06/2022
; Assignment H04
; Description: This program takes in 2 Hex numbers from the user and outputs the sum. The numbers are 8-bit.

INCLUDE Irvine32.inc

.data
firstMsg	BYTE	"Enter first hex digit: ", 0
secondMsg	BYTE	"Enter second hex digit: ", 0
hexSumMsg	BYTE	"Hex sum = ", 0
hexDig1		BYTE	?
hexDig2		BYTE	?
hexSum		BYTE	?

.code
main		PROC					; Start
			call	Clrscr

			lea		EDX, firstMsg	; Print "Enter first hex digit: "
			call	WriteString

			call	ReadHex			; Input hexDig1
			mov		hexDig1, AL

			lea		EDX, secondMsg	; Print "Enter second hex digit: "
			call	WriteString

			call	ReadHex			; Input hexDig2
			mov		hexDig2, AL

			; mov	AL, hexDig2		; hexSum = hexDig1 + hexDig2
			add		AL, hexDig1
			mov		hexSum, AL

			lea		EDX, hexSumMsg	; Print "Hex Sum =", hexSum
			call	WriteString
			; mov	AL, hexSum
			call	WriteHex

			call	CRLF

			exit					; Stop
main		ENDP
			END	main
