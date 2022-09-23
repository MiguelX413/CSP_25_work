TITLE Overengineered H03A					(H03A_overengineered.asm)

; Miguel [Redacted]
; 09/22/2022
; Overengineered H03A
; Description: This program prints the smallest of the 2 numbers the user inputs.  This is done without branches.

INCLUDE Irvine32.inc

.data
num1Msg		BYTE	"Enter first number: ", 0
num2Msg		BYTE	"Enter second number: ", 0
SmallMsg	BYTE	"Smaller = ", 0
; smallest	DWORD	?

.code
main		PROC					; Start
			call	Clrscr

			lea		EDX, num1Msg	; Print "Enter first number: "
			call	WriteString

			call	ReadInt			; Input EBX
			mov		EBX, EAX

			lea		EDX, num2Msg	; Print "Enter second number: "
			call	WriteString

			call	ReadInt			; Input EAX
			cmp		EAX, EBX		; IF EAX < EBX THEN EBX = EAX
			cmovl	EBX, EAX

			lea		EDX, SmallMsg	; Print "Smaller = ", EBX
			call	WriteString
			mov		EAX, EBX
			call	WriteInt
			call	CRLF

			exit					; Stop
main		ENDP
			END	main
