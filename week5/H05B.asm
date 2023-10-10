TITLE Assignment H05B						(H05B.asm)

; Miguel [Redacted]
; 10/13/2022
; Assignment H05B
; Description: Keeps asking the user for years and telling them how many years have passed since that year until they input 0.

INCLUDE Irvine32.inc
CR EQU 13
LF EQU 10

.data
inYearMsg	BYTE	"Enter a year: ", 0
yearsMsg	BYTE	" years have passed", 0
currentYear	DWORD	2022
year		DWORD	?
yearsPassed	DWORD	?

.code
main		PROC					; Start

			call	Clrscr

			lea		EDX, inYearMsg	; Print "Enter a year: "
			call	WriteString

			call	ReadDec			; Input year
			mov		year, EAX

WhileA:		mov		EAX, year		; A While year != 0
			cmp		EAX, 0
			je		EndA

			mov		EAX, currentYear; yearsPassed = currentYear - year
			sub		EAX, year
			mov		yearsPassed, EAX

			; mov	EAX, yearsPassed; Print yearsPassed, " years have passed"
			call	WriteDec
			lea		EDX, yearsMsg
			call	WriteString
			call	CRLF

			lea		EDX, inYearMsg	; Print "Enter a year: "
			call	WriteString

			call	ReadDec			; Input year
			mov		year, EAX

			jmp		WhileA
EndA:								; A EndWhile
			call	CRLF
			exit					;Stop
main		ENDP
			END	main

