; Program 01 - Addition of two r*c byte-matrix
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Addition of two r*c byte-matrix

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
m		DB 2
n		DB 5
Mat1	DB 11h, 22h, 33h, 44h, 55h
		DB 66h, 77h, 88h, 99h, 0AAh
		ORG 0014h
Mat2	DB 0AAh, 99h, 88h, 77h, 66h
		DB 55h, 44h, 33h, 22h, 11h
		ORG 00020h
Sum		DB 5 DUP (?)
		DB 5 DUP (?)
DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg

		mov ax, DtaSeg
		mov ds, ax

		mov si, OFFSET Mat1
		mov di, OFFSET Mat2
		mov bx, OFFSET Sum

		mov cl, m
Row:	mov ch, n
Col:	mov al, [si]
		add al, [di]
		mov [bx], al
		inc si
		inc di
		inc bx
		dec ch
		jnz Col
		loop Row

		mov ax, 4C00h
		int 21h

Main	ENDP

CodSeg	ENDS

		END Main