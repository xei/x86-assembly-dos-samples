; Program 01 - Addition of five word-numbers
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Addition of 5 word-numbers

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
Nums	DW 1020h, 2030h, 3040h, 4050h, 5060h
		ORG 000Ah
Sum		DW ?
DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg

		mov ax, DtaSeg
		mov ds, ax

		mov bx, OFFSET Nums
		mov ax, [bx]

		mov cx, 4h
Accum:	inc bx
		inc bx
		add ax, [bx]
		loop Accum

		mov Sum, ax

		mov ax, 4C00h
		int 21h

Main	ENDP

CodSeg	ENDS

		END Main