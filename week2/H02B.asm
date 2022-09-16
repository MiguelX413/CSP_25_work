TITLE Assignment H02B						(H02B.asm)

; Miguel [Redacted]
; 09/15/2022
; Assignment H02B
; Description: This program takes in a past year as user input and prints how many years have passed.

INCLUDE Irvine32.inc

CR = 13
LF EQU 10

.data
currentYear		DWORD	?
yearMsg			BYTE	"Enter a year: ", 0
year			DWORD	?
yearsPassed		DWORD	?
yearCountMsg	BYTE	" years have passed", CR, LF, 0

.code
main		PROC						; Start

			call	Clrscr

			mov currentYear, 2022		; currentYear = 2022

			lea		EDX, yearMsg		; Print "Enter a year: "
			call	WriteString

			call	ReadDec				; Input year
			mov		year, EAX

			mov		EAX, currentYear	; yearsPassed = currentYear - year
			sub		EAX, year
			mov		yearsPassed, EAX

			mov		EAX, yearsPassed	; Print yearsPassed, " years have passed"
			call	WriteDec
			lea		EDX, yearCountMsg
			call	WriteString

			; call	CRLF				; I don't think this is necessary because yearCountMsg already has CR and LF
			exit						; Stop
main		ENDP
			END	main