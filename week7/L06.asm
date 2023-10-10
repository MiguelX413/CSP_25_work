TITLE Assignment L06						(L06.asm)

; Miguel [Redacted]
; 10/27/2022
; Assignment L06
; Description: This program adds five hex numbers and displays the sum.

INCLUDE Irvine32.inc
CR EQU 13
LF EQU 10

.data
inNumMsg	BYTE	"Enter five numbers:", CR, LF, 0
numCt		BYTE	?
num			DWORD	?
largeNum	DWORD	?
largeMsg	BYTE	"Largest = ", 0

.code
main		PROC					;Start
			call	Clrscr

			lea		EDX, inNumMsg	; Print "Enter five numbers:"
			call	WriteString
			
			call	inNum			; Input num
			mov		num, EAX

			; mov	EAX, num		; largeNum = num
			mov		largeNum, EAX

			mov		numCt, 1		; numCt = 1

WhileA:		cmp		numCt, 5		; A WHILE numCt < 5
			jnl		EndA
			
			call	inNum			; Input num
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
			call	outNum

			call	CRLF

			exit					; Stop
main		ENDP

;******************************************
; Input a number
; Input: none
; Output: number returned in EAX
;*****************************************
; EBX will be used to create number and then moved to EAX
; ECX will be used for dig
inNum		PROC					; Enter
			mov		EBX, 0			; num = 0
			call	ReadChar		; input char
inNum1:		cmp		AL, CR			; WHILE char != CR
			je		inNum2
			call	WriteChar
			movzx	ECX, AL			; dig = Cvt2Bin (char)
			sub		CL, '0'
			mov		EAX, EBX		; num = num * 10 + dig
; once EBX is moved to EAX
; we can use EBX to hold the 10
			mov		EBX, 10
			mul		EBX
			add		EAX, ECX
			mov		EBX, EAX
			call	ReadChar		; input char
			jmp		inNum1
inNum2:								; ENDWHILE
			mov		EAX, EBX
			call	CRLF
			ret						; Exit
inNum		ENDP

;*****************************************
; Print number
; Input: value to print in EAX
; Output: none
;*****************************************
; ECX is used for digCt
; EDX is used for dig
outNum		PROC					; Enter
			mov		ECX, 0			; digCt = 0
outNum1:							; Repeat
			mov		EBX, 10			; dig = Num MOD 10
			mov		EDX, 0			; Num = Num / 10
			div		EBX
			push	EDX				; push dig
			inc		ECX				; digCt++
			cmp		EAX, 0			; UNTIL Num <= 0
			jnle	outNum1
outNum2:
			cmp		ECX, 0			; WHILE digCt > 0
			jng		outNum3
			pop		EDX				; pop dig
			mov		AL, DL			; print dig
			add		AL, '0'
			call	WriteChar
			dec		ECX				; digCt--
			jmp		outNum2
outNum3:							; ENDWHILE
			ret						; Exit
outNum		ENDP
			END	main
