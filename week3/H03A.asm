TITLE Assignment H03A						(H03A.asm)

; Miguel [Redacted]
; 09/22/2022
; Assignment H03A
; Description: This program prints the smallest of the 2 numbers the user inputs.

INCLUDE Irvine32.inc

.data
num1Msg		BYTE	"Enter first number: ", 0
num2Msg		BYTE	"Enter second number: ", 0
SmallMsg	BYTE	"Smaller = ", 0
num1		DWORD	?
num2		DWORD	?

.code
main		PROC					; Start
			call	Clrscr

			lea		EDX, num1Msg	; Print "Enter first number: "
			call	WriteString

			call	ReadDec			; Input num1
			mov		num1, EAX

			lea		EDX, num2Msg	; Print "Enter second number: "
			call	WriteString

			call	ReadDec			; Input num2
			mov		num2, EAX

			; mov	EAX, num2		; IF num1 < num2
			cmp		num1, EAX
			jnl		main1

			lea		EDX, SmallMsg	; Print "Smaller = ", num1
			call	WriteString
			mov		EAX, num1
			call	WriteDec
			jmp		main2
main1:								; ELSE
			lea		EDX, SmallMsg	; Print "Smaller = ", num2
			call	WriteString
			; mov	EAX, num2
			call	WriteDec
main2:								; ENDIF
			call	CRLF
			exit					; Stop
main		ENDP
			END	main
