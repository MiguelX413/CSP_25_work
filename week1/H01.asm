TITLE Assignment H01                        (H01.asm)

; Miguel [Redacted]
; 09/08/2022
; Assignment H01
; Description: Prints out "Hello World"

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

CR = 13
LF EQU 10

; Question: What is the difference between = and EQU?
; Answer: symbols defined by = can be redefined and must be 32-bit integers. symbols defined by EQU may also be text and cannot be redefined.

symmsg  TEXTEQU <"Hello World", CR, LF, 0> 

; Question: What is the difference between EQU and TEXTEQU?
; Answer: symbols defined by TEXTEQU can be redefined.

.data
    msg BYTE  symmsg

.code
main    PROC
        lea edx,OFFSET msg
        invoke WriteString

        invoke ExitProcess,0
main    ENDP
        END main