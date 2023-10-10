TITLE Assignment H05A						(H05A.asm)

; Miguel [Redacted]
; 10/13/2022
; Assignment H05A
; Description: This program adds five hex numbers and displays the sum.

INCLUDE Irvine32.inc
CR EQU 13
LF EQU 10

.data
inHexMsg	BYTE	"Enter five hex numbers:", CR, LF, 0
hyphens		BYTE	"--------", CR, LF, 0
hexNum		DWORD	?
hexSum		DWORD	?
numCt		BYTE	?

.code
main		PROC					; Start

			call	Clrscr

			lea		EDX, inHexMsg	; Print "Enter five hex numbers:"
			call	WriteString

			mov		hexSum, 0		; hexSum = 0
			mov		numCt, 0		; numCt = 0

WhileA:		cmp		numCt, 5		; A WHILE numCt < 5
			jnl		EndA

			call	ReadHex			; Input hexNum
			mov		hexNum, EAX

			; mov	EAX, hexNum		; hexSum += hexNum
			add		hexSum, EAX
			inc		numCt			; numCt++

			jmp		WhileA
EndA:								; A ENDWHILE

			lea		EDX, hyphens	; Print "--------"
			call	WriteString

			mov		EAX, hexSum		; Print hexSum
			call	WriteHex

			call	CRLF
			exit					;Stop
main		ENDP
			END	main

