TITLE Assignment H02A						(H02A.asm)

; Miguel [Redacted]
; 09/15/2022
; Assignment H02A
; Description: This program takes in two numbers from user input and prints their numeric sum.

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

			call	ReadDec			; Input dig1
			mov		dig1, AL

			lea		EDX, dig2Msg	; Print "Enter second digit: "
			call	WriteString

			call	ReadDec			; Input dig2
			mov		dig2, AL

			mov		AL, dig1		; digSum = dig1 + dig2
			add		AL, dig2
			mov		digSum, AL

			lea		EDX, sumMsg		; Print "Sum = "; digSum
			call	WriteString
			movzx	EAX, digSum
			call	WriteDec

			call	CRLF
			exit					; Stop
main		ENDP
			END	main