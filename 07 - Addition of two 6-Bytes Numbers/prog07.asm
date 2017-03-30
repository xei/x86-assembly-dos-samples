; Program 01 - Addition of two 6-Bytes Numbers
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Addition of two 6-Bytes Numbers

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
Num1	DQ 548FB9963CE7h
		ORG 0010h
Num2	DQ 3FCD4FA23B8Dh
		ORG 0020h
Sum		DQ ?
DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg
		mov ax, DtaSeg
		mov ds, ax

		mov si, OFFSET Num1
		mov di, OFFSET Num2
		mov bx, OFFSET Sum

		mov ax, [si]
		add ax, [di]
		mov [bx], ax
		inc si
		inc si
		inc di
		inc di
		inc bx
		inc bx

		mov cx, 3
Next:	mov ax, [si]
		adc ax, [di]
		mov [bx], ax
		inc si
		inc si
		inc di
		inc di
		inc bx
		inc bx
		loop Next


		mov ax, 4C00h
		int 21h
Main	ENDP

CodSeg	ENDS

		END Main