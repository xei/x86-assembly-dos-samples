; Program 01 - Addition of two byte-numbers
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Addition of two byte-numbers
		
StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
Num1	DB 0FEh
Num2	DB 0EDh
		ORG 000Ah
Sum		DW ?
DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg

		mov ax, DtaSeg
		mov ds, ax

		mov ah, 00h
		mov al, Num1
		mov bh, 00h
		mov bl, Num2
		add ax, bx
		mov Sum, ax

		mov ax, 4C00h
		int 21h
Main	ENDP

CodSeg	ENDS

		END Main