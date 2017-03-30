; Program 01 - Addition of two 20-Bytes numbers
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Addition of two 20-Bytes numbers

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'

Num1L	DT 11223344556677889900h
Num1H	DT 0AABBCCDDEEFF12345678h
		ORG 0020h
Num2L	DT 0FEDCBA9876543210ABCDh
Num2H	DT 0ABBACDDCEFFEAFFAACCAh
		ORG 0050h
Sum		DD 5 DUP (?)

DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'

Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg
		mov ax, DtaSeg
		mov ds, ax

		mov si, OFFSET Num1L
		mov di, OFFSET Num2L
		mov bx, OFFSET Sum

		mov ax, WORD PTR [si]
		add ax, WORD PTR [di]
		mov WORD PTR [bx], ax

		inc si
		inc si
		inc di
		inc di
		inc bx
		inc bx

		mov cx, 9
Next:	mov ax, WORD PTR [si]
		adc ax, WORD PTR [di]
		mov WORD PTR [bx], ax
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