; Program 01 - Absolute of two Byte-numbers
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Absolute of two Byte-numbers

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
Num1	DB 23h
Num2	DB 56h
		ORG 0010h
Abs		DB ?
DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg
		mov ax, DtaSeg
		mov ds, ax

		mov al, Num1
		sub al, Num2
		jnc Bypass
		not al
		inc al
Bypass:	mov Abs, al

		mov ax, 4C00h
		int 21h
Main	ENDP

CodSeg	ENDS

		END Main