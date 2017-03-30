; Program 01 - Addition of five byte-numbers
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE addition of 5 byte-numbers

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
Nums	DB 10h, 20h, 30h, 40h, 50h
		ORG 000Ah
Sum		DW ?
DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg

		mov ax, DtaSeg
		mov ds, ax

		mov bx, OFFSET Nums

		mov ah, 00h
		mov al, [bx]

		mov cx, 4h
Accum:	inc bx
		mov dh, 00h
		mov dl, [bx]
		add ax, dx
		loop Accum

		mov Sum, ax

		mov ax, 4C00h
		int 21h

Main	ENDP
CodSeg	ENDS
		END	Main