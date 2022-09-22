TITLE Assignment L03						(L03.asm)

; Miguel [Redacted]
; 09/21/2022
; Assignment L03
; Description: This program validates a character from the keyboard as a digit.

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

			cmp		char, '0'		; A IF char >= '0' AND char <= '9'
			jnae	ElseA
			cmp		char, '9'
			jnbe	ElseA

			call	WriteChar		; Print char, " is a digit"
			lea		EDX, isDigMsg
			call	WriteString

			jmp		EndA
ElseA:								; A ELSE
			call	WriteChar		; Print char, " is not a digit"
			lea		EDX, isntDigMsg
			call	WriteString
EndA:								; A ENDIF
			call	CRLF

			exit					; Stop
main		ENDP
			END	main
