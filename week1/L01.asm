TITLE Assignment L01                        (L01.asm)

; Miguel [Redacted]
; 09/08/2022
; Assignment L01
; Description: Prints out "Hello", ' ', "World"

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc
CR EQU 13
LF EQU 10

.data
			helloMsg	BYTE	"Hello",0
			worldMsg	BYTE	"World",0

.code
main		PROC				; Start

			call	Clrscr

			call	prtHello

			mov al,32
			invoke WriteChar

			call	prtWorld
								; Print "Hello", ' ', "World"

			call	CRLF
			exit				; Stop
main		ENDP

;*******************
; Print "Hello"
; input: none
; output: none
;*******************

prtHello	PROC				; Enter
			lea edx,offset helloMsg
			invoke WriteString
								; Print "Hello"

			ret					; Exit
prtHello	ENDP

;*******************
;Print "World"
;input: none
;output: none
;*******************

prtWorld	PROC				; Enter
			lea edx,offset worldMsg
			invoke WriteString
								; Print "World"

			ret					; Exit
prtWorld	ENDP
			END	main