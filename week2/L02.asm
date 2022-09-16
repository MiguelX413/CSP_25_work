TITLE Assignment L02						(L02.asm)

; Miguel [Redacted]
; 09/15/2022
; Assignment L02
; Description: This program takes in two digits from user input and prints their ASCII sum.

INCLUDE Irvine32.inc

.data
dig1Msg		BYTE	"Enter first digit: ", 0
dig2Msg		BYTE	"Enter second digit: ", 0
sumMsg		BYTE	"Sum = ", 0
dig1		BYTE	?
dig2		BYTE	?
digSum		BYTE	?

.code
main		PROC					; Start

			call	Clrscr

			lea		EDX, dig1Msg	; Print "Enter first digit: "
			call	WriteString

			call	inDig			; Input dig1
			mov		dig1, AL
			call	outDig
			call	CRLF

			lea		EDX, dig2Msg	; Print "Enter second digit: "
			call	WriteString

			call	inDig			; Input dig2
			mov		dig2, AL
			call	outDig
			call	CRLF

			mov		AL, dig1		; digSum = dig1 + dig2
			add		AL, dig2
			mov		digSum, AL

			lea		EDX, sumMsg		; Print "Sum = "; digSum
			call	WriteString
			mov		AL, digSum
			call	outDig

			call	CRLF
			exit					; Stop
main		ENDP

;*******************
; Input digit
; input: none
; Output: digit returned in AL
;*******************

inDig		PROC					; Enter

			call	ReadChar		; Input dig
			sub		AL, '0'

			ret						; Exit
inDig		ENDP

;*******************
; Print digit
; input: value to print in AL register
; output: none
;*******************

outDig		PROC					; Enter

			add		AL, '0'			; Print dig
			call	WriteChar

			ret						; Exit
outDig		ENDP
			END	main