; Program 01 - Addition of two word-numbers
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Addition of two word-numbers

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
Num1	DW 00EFEh
Num2	DW 0CDCDh
		ORG 000Ah
Sum		DW ?
DtaSeg	ENDS

CodSeg	SEGMENT	para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg

		mov ax, DtaSeg
		mov ds, ax

		mov ax, Num1
		add ax, Num2
		mov Sum, ax

		mov ax, 4C00h
		int 21h

Main	ENDP

CodSeg	ENDS

		END Main