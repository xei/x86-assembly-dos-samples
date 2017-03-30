; Program 01 - Find Min/Max of 10 Unsigned Decimal Byte-Numbers
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Find Min/Max of 10 Unsigned Decimal Byte-Numbers

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
Nums	DB 23, 12, 34, 45, 56, 67, 78, 89, 100, 50
		ORG 0010h
Min		DB ?
Max		DB ?
DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg
		mov ax, DtaSeg
		mov ds, ax

		mov al, Nums	; Minimum
		mov ah, Nums	; Maximum
		mov bx, OFFSET Nums+1
		mov cx, 9
Start:	mov dl, [bx]	; 'dl' is temp register for speed up by replace
						; register indirect with register addressing mode.
		cmp al, dl
		jbe Pass1		; jle for signed numbers
		mov al, dl
Pass1:	cmp ah, dl
		jae Pass2		; jge for signed numbers
		mov ah, dl
Pass2:	inc bx
		loop Start

		mov Min, al
		mov Max, ah

		mov ax, 4C00h
		int 21h
Main	ENDP

CodSeg	ENDS

		END Main