TITLE Assignment L05						(L05.asm)

; Miguel [Redacted]
; 10/13/2022
; Assignment L05
; Description: This program adds five hex numbers and displays the sum.

INCLUDE Irvine32.inc
CR EQU 13
LF EQU 10

.data
inHexMsg	BYTE	"Enter five hex numbers:", CR, LF, LF, 0
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

			call	inHex			; Input hexNum
			call	CRLF
			mov		hexNum, EAX

			add		hexSum, EAX		; hexSum += hexNum
			inc		numCt			; numCt++

			jmp		WhileA
EndA:								; A ENDWHILE

			lea		EDX, hyphens	; Print "--------"
			call	WriteString

			mov		EAX, hexSum		; Print hexSum
			call	outHex

			call	CRLF
			exit					;Stop
main		ENDP

;*******************
; Input a hex number
; Input: none
; Output: hex number returned in EAX
;*******************

;EBX will be used to create number and then moved to EAX

inHex		PROC					; Enter

			mov		EBX, 0		; hexNum = 0

			call	ReadChar		; Input char

WhileB:		cmp		AL, CR			; B WHILE char <> CR
			je		EndB

			call	WriteChar
			cmp		AL, '9'			; hexDig = cvt2bin(char)
			ja		inHex1
			sub		AL, '0'
			jmp		inHex2
inHex1:		and		AL, 11011111b
			sub		AL, '0' + 7
inHex2:
			movzx	EAX, AL			; hexNum = hexNum * 16 + hexDig
			shl		EBX, 4
			add		EBX, EAX
			call	ReadChar		; Input char
			jmp		WhileB
EndB:								; ENDWHILE
			mov		EAX, EBX		; move EBX to EAX
			
			ret						; Exit
inHex		ENDP

;*******************
; Print hex number
; Input: value to print in EAX
; Output: none
;*******************

;The hexNum is moved to EBX so AL can be used to output hex character
;ECX is used for digCt

outHex		PROC					; Enter
			mov		EBX, EAX		; save EAX in EBX

			mov		ECX, 0			; digCt = 0

WhileA:		cmp		ECX, 8			; A WHILE digCt < 8
			jnl		EndB 

			mov		EAX, EBX		; Print LeftMostHex(hexNum) 
			shr		EAX, 28
			cmp		AL, 9
			jg		outHex1
			add		AL, '0'
			jmp		outHex2
outHex1:	add		AL, '0' + 7 
outHex2:	call	WriteChar

			shl		EBX, 4			; hexNum *= 16 

			inc		ECX				; digCt++ 

			jmp		WhileA
EndB:								; ENDWHILE 
			ret						; Exit 
outHex		ENDP
			END	main

