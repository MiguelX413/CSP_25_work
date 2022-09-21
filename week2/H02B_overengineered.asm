TITLE Overengineered H02B					(H02B_overengineered.asm)

; Miguel [Redacted]
; 09/16/2022
; Overengineered H02B
; Description: This program retrieves the year from the system, and takes in a year from user input. It then prints a string describing the difference between them. This program is branchless.

INCLUDE Irvine32.inc

CR EQU 13
LF EQU 10

.data
sysTime			SYSTEMTIME	<>
currentYear		DWORD		?
yearMsg			BYTE		"Enter a year: ", 0
year			DWORD		?
yearsDiff		DWORD		?
yearPassedMsg	BYTE		" year has passed", CR, LF, 0
yearsPassedMsg	BYTE		" years have passed", CR, LF, 0
yearLeftMsg		BYTE		" year is left", CR, LF, 0
yearsLeftMsg	BYTE		" years are left", CR, LF, 0

.code
main		PROC						; Start

			call	Clrscr

			invoke	GetLocalTime, ADDR sysTime
			movzx	EAX, sysTime.wYear
			mov		currentYear, EAX	; Get currentYear from the system's local time


			lea		EDX, yearMsg		; Print "Enter a year: "
			call	WriteString

			call	ReadInt				; Input year
			mov		year, EAX

			mov		EAX, currentYear	; yearsDiff = max(currentYear, year) - min(currentYear, year)
			mov		ECX, year
			mov		EDX, EAX
			cmp		ECX, EAX
			cmovl	EDX, ECX
			cmovg	EAX, ECX
			sub		EAX, EDX
			mov		yearsDiff, EAX

			mov		EAX, yearsDiff		; Print yearsDiff
			call	WriteDec
			
			lea		EDX, yearsPassedMsg ; EDX = yearsPassedMsg

			mov		EAX, currentYear	; if (currentYear - 1 == year) { EDX = yearPassedMsg }
			sub		EAX, 1
			cmp		EAX, year
			lea		ECX, yearPassedMsg
			cmove	EDX, ECX

			mov		EAX, currentYear	; if (currentYear + 1 < year) { EDX = yearsLeftMsg }
			add		EAX, 1				; if (currentYear + 1 == year) { EDX = yearLeftMsg }
			cmp		EAX, year
			lea		ECX, yearsLeftMsg
			cmovl	EDX, ECX
			lea		ECX, yearLeftMsg
			cmove	EDX, ECX

			call	WriteString			; print EDX

			; call	CRLF				; I don't think this is necessary because the strings already have CR and LF
			exit						; Stop
main		ENDP
			END	main
