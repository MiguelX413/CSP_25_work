TITLE Assignment L04						(L04.asm)

; Miguel C. [Redacted]
; 10/06/2022
; Assignment L04
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

			call	inHex			; Input hexDig1
			mov		hexDig1, AL

			lea		EDX, secondMsg	; Print "Enter second hex digit: "
			call	WriteString

			call	inHex			; Input hexDig2
			mov		hexDig2, AL

			; mov	AL, hexDig2		; hexSum = hexDig1 + hexDig2
			add		AL, hexDig1
			mov		hexSum, AL

			lea		EDX, hexSumMsg	; Print "Hex Sum =", hexSum
			call	WriteString
			; mov	AL, hexSum
			call	outHex

			call	CRLF

			exit					; Stop
main		ENDP

;*******************
; Input hex digit
; Input: none
; Output: hex digit returned in AL
;*******************
inHex		PROC					; Enter
			call	ReadChar		; input hexDigit
			call	WriteChar
			cmp		AL, '9'
			ja		inHex1
			sub		AL, '0'

			jmp		inHex2
; change lower case 'a' - 'f' to upper case 'A' - 'F'
inHex1:
			and		AL, 11011111b
			sub		AL, '0' + 7

inHex2:
			call	CRLF

			ret						; Exit
inHex ENDP

;*******************
; Print hex digit
; Input: value to print in AL register
; output: none
;*******************
outHex		PROC					; Enter
			cmp		AL, 9			; Print hexDigit
			jg		outHex1
			add		AL, '0'

			jmp		outHex2
outHex1:
			add		AL, '0' + 7
outHex2:
			call	WriteChar

			ret						; Exit
outHex		ENDP
			END	main
