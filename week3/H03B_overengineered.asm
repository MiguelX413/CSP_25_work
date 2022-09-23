TITLE Overengineered H03B					(H03B_overengineered.asm)

; Miguel [Redacted]
; 09/22/2022
; Overengineered H03B
; Description: This program prints the largest of the 3 numbers the user inputs.

INCLUDE Irvine32.inc

.data
num1Msg		BYTE	"Enter three numbers", 0
LargeMsg	BYTE	"Larger = ", 0
; largest	DWORD	?

.code
main		PROC					; Start
			call	Clrscr

			lea		EDX, num1Msg	; Print "Enter three numbers"
			call	WriteString
			call	CRLF

			call	ReadInt			; Input EBX
			mov		EBX, EAX

			call	ReadInt			; Input EAX
			cmp		EAX, EBX		; IF EAX > EBX THEN EBX = EAX
			cmovg	EBX, EAX

			call	ReadInt			; Input EAX
			cmp		EAX, EBX		; IF EAX > EBX THEN EBX = EAX
			cmovg	EBX, EAX

			; mov	largest, EBX

			lea		EDX, LargeMsg	; Print "Larger = ", EBX
			call	WriteString
			; mov	EAX, largest
			mov		EAX, EBX
			call	WriteInt
			call	CRLF

			exit					; Stop
main		ENDP
			END	main
