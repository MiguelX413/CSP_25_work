TITLE Overengineered H03C					(H03C_overengineered.asm)

; Miguel [Redacted]
; 09/22/2022
; Overengineered H03C
; Description: This program tells the user their age with the least amount of questions asked as possible.

INCLUDE Irvine32.inc

.data
sysTime		SYSTEMTIME	<>
curYear		DWORD	?
curMonth	DWORD	?
curDay		DWORD	?

yearMsg		BYTE	"Enter the year of your birth: ", 0
monthMsg	BYTE	"Enter the month of your birth: ", 0
dayMsg		BYTE	"Enter the day of your birth: ", 0

lessThan1	BYTE	"you are less than 1 year old", 0
notYetBorn	BYTE	"you haven't been born yet", 0
youAre		BYTE	"you are ", 0
yearsOld	BYTE	" years old", 0
happyBday	BYTE	", Happy Birthday", 0

year		DWORD	?
month		DWORD	?
day			DWORD	?

age			DWORD	?

.code
main		PROC					; Start
			call	Clrscr

			invoke	GetLocalTime, ADDR sysTime
			movzx	EAX, sysTime.wYear
			mov		curYear, EAX
			movzx	EAX, sysTime.wMonth
			mov		curMonth, EAX
			movzx	EAX, sysTime.wDay
			mov		curDay, EAX		; Get curYear, curMonth, and curDay from system local time

			lea		EDX, yearMsg	; Print "Enter the year of your birth: "
			call	WriteString

			call	ReadInt			; Input year
			mov		year, EAX

			; mov	EAX, year		; A IF year = curYear THEN
			cmp		EAX, curYear
			jne		ElseA

			lea		EDX, lessThan1	; Print "you are less than 1 year old"
			call	WriteString
			call	CRLF

			jmp		EndA
ElseA:								; A ELSE
			; mov	EAX, year		; B IF year < curYear THEN
			; cmp	EAX, curYear
			jnl		ElseB

			lea		EDX, monthMsg	; Print "Enter the month of your birth"
			call	WriteString

			call	ReadDec			; Input month
			mov		month, EAX

			mov		EBX, curYear	; age = curYear - year
			sub		EBX, year
			mov		age, EBX

			; mov	EAX, month		; C IF month > curMonth THEN
			cmp		EAX, curMonth
			jng		ElseC

			sub		age, 1			; age -= 1

			lea		EDX, youAre		; Print "you are ", age, " years old"
			call	WriteString
			mov		EAX, age
			call	WriteDec
			lea		EDX, yearsOld
			call	WriteString
			call	CRLF

			jmp		EndC
ElseC:								; C ELSE
			; mov	EAX, month		; D IF month < curMonth THEN
			; cmp	EAX, curMonth
			jnl		ElseD

			lea		EDX, youAre		; Print "you are ", age, " years old"
			call	WriteString
			mov		EAX, age
			call	WriteDec
			lea		EDX, yearsOld
			call	WriteString
			call	CRLF

			jmp		EndD
ElseD:								; D ELSE
			lea		EDX, dayMsg		; Print "Enter the day of your birth: "
			call	WriteString

			call	ReadDec			; Input day
			mov		day, EAX

			; mov	EAX, day		; E IF day > curDay THEN
			cmp		EAX, curDay
			jng		ElseE

			sub		age, 1			; age -= 1

			lea		EDX, youAre		; Print "you are ", age, " years old"
			call	WriteString
			mov		EAX, age
			call	WriteDec
			lea		EDX, yearsOld
			call	WriteString
			call	CRLF

			jmp		EndE
ElseE:								; E ELSE
			; mov	EAX, day		; F IF day < curDay THEN
			; cmp	EAX, curDay
			jnl		ElseF

			lea		EDX, youAre		; Print "you are ", age, " years old"
			call	WriteString
			mov		EAX, age
			call	WriteDec
			lea		EDX, yearsOld
			call	WriteString
			call	CRLF

			jmp		EndF
ElseF:								; F ELSE
			lea		EDX, youAre		; Print "you are ", age, " years old", ", Happy Birthday"
			call	WriteString
			mov		EAX, age
			call	WriteDec
			lea		EDX, yearsOld
			call	WriteString
			lea		EDX, happyBday
			call	WriteString
			call	CRLF

EndF:								; F ENDIF
EndE:								; E ENDIF
EndD:								; D ENDIF
EndC:								; C ENDIF
			jmp		EndB
ElseB:								; B ELSE
			lea		EDX, notYetBorn ; Print "you haven't been born yet"
			call	WriteString
			call	CRLF

EndB:								; B ENDIF
EndA:								; A ENDIF
			call	CRLF

			exit					; Stop
main		ENDP
			END	main
