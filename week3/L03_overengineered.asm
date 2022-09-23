TITLE Overengineered L03					(L03_overengineered.asm.asm)

; Miguel [Redacted]
; 09/22/2022
; Overengineered L03
; Description: This program validates a character from the keyboard as a digit. This is done without branches.

INCLUDE Irvine32.inc

.data
digMsg		BYTE	"Enter a digit: ", 0
isDigMsg	BYTE	" is a digit", 0
isntDigMsg	BYTE	" is not a digit", 0
char		BYTE	?

.code
main		PROC					; Start
			call	Clrscr

			lea		EDX, digMsg		; Print "Enter a digit: "
			call	WriteString

			call	ReadChar		; Input char
			mov		char, AL
			call	WriteChar
			call	CRLF

			lea		EDX, isDigMsg	; EDX = isDigMsg

			lea		ECX, isntDigMsg	; IF char < '0' OR char > '9' THEN EDX = isntDigMsg
			cmp		char, '0'
			cmovl	EDX, ECX
			cmp		char, '9'
			cmovg	EDX, ECX

			; mov	AL, char		; Print char, EDX
			call	WriteChar
			call	WriteString
			call	CRLF

			exit					; Stop
main		ENDP
			END	main
