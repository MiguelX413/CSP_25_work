TITLE Assignment H06						(H06.asm)

; Miguel [Redacted]
; 10/27/2022
; Assignment H06
; Description: This program takes in 5 decimal numbers from the user and returns the largest one.

INCLUDE Irvine32.inc
CR EQU 13
LF EQU 10

.data
msg			BYTE	"Enter five numbers:", CR, LF, 0
largeMsg	BYTE	"Largest = ", 0
numCt		BYTE	?
num			DWORD	?
largeNum	DWORD	?

.code
main		PROC					;Start
			call	Clrscr

			lea		EDX, msg		; Print "Enter five numbers:"
			call	WriteString
			
			call	ReadDec			; Input num
			mov		num, EAX

			; mov	EAX, num		; largeNum = num
			mov		largeNum, EAX

			mov		numCt, 1		; numCt = 1

WhileA:		cmp		numCt, 5		; A WHILE numCt < 5
			jnl		EndA
			
			call	ReadDec			; Input num
			; mov	num, EAX

			; mov	EAX, num		; IF num > largeNum
			cmp		EAX, largeNum	; largeNum = num
			cmovng	EAX, largeNum
			mov		largeNum, EAX

			inc		numCt			; numCt++

			jmp		WhileA			; ENDWHILE
EndA:
			lea		EDX, largeMsg	; Print "Largest = ", largeNum
			call	WriteString
			mov		EAX, largeNum
			call	WriteDec

			call	CRLF

			exit					;Stop
main		ENDP
			END	main
