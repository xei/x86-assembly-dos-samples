; Program 01 - Calculate sum of the even and odd Byte-numbers
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Calculate sum of the even and odd Byte-numbers

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP(?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
Nums	DB 10, 21, 32, 43, 54
Evens	DW ?
Odds	DW ?
DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg
		mov ax, DtaSeg
		mov ds, ax

		mov si, OFFSET Nums
		mov ax, 0000h
		mov dx, 0000h
		mov cx, 5
		mov bh, 00h
Next:	mov bl, BYTE PTR [si]
		and bl, 01h
		jz Zoj
		add dx, bx
Zoj:	add ax, bx
		loop Next

		mov Evens, ax
		mov Odds, dx

		mov ax, 4C00h
		int 21h
Main	ENDP

CodSeg	ENDS

		END Main