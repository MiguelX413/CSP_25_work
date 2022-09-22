TITLE Assignment H03B						(H03B.asm)

; Miguel [Redacted]
; 09/22/2022
; Assignment H03B
; Description: This program prints the largest of the 3 numbers the user inputs.

INCLUDE Irvine32.inc

.data
num1Msg		BYTE	"Enter three numbers", 0
LargeMsg	BYTE	"Larger = ", 0
num1		DWORD	?
num2		DWORD	?
num3		DWORD	?

.code
main		PROC					; Start
			call	Clrscr

			lea		EDX, num1Msg	; Print "Enter three numbers"
			call	WriteString
			call	CRLF

			call	ReadDec			; Input num1
			mov		num1, EAX

			call	ReadDec			; Input num2
			mov		num2, EAX

			call	ReadDec			; Input num3
			mov		num3, EAX

			mov		ECX, num1		; IF num1 > num2 AND num1 > num3
			cmp		ECX, num2
			jng		main1
			cmp		ECX, num3
			jng		main1

			lea		EDX, LargeMsg	; Print "Larger = ", num1
			call	WriteString
			mov		EAX, num1
			call	WriteDec
			jmp		main4
main1:								; ELSE
			mov		EBX, num2		; IF num2 > num3
			cmp		EBX, num3
			jng		main2

			lea		EDX, LargeMsg	; Print "Larger = ", num2
			call	WriteString
			mov		EAX, num2
			call	WriteDec
			jmp		main3
main2:								; ELSE
			lea		EDX, LargeMsg	; Print "Larger = ", num3
			call	WriteString
			mov		EAX, num3
			call	WriteDec
main3:								; ENDIF
main4:								; ENDIF
			call	CRLF
			exit					; Stop
main		ENDP
			END	main
