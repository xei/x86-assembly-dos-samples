; Program 01 - Copy 6 Bytes from DS:0010h to DS: 0028h
; Written by Hamidreza Hosseinkhani (hosseinkhani@live.com)
; June, 2011


		TITLE Copy 6 Bytes from DS:0010h to DS: 0028h

StkSeg	SEGMENT para stack 'stack'
		DB 64 DUP (?)
StkSeg	ENDS

DtaSeg	SEGMENT para private 'data'
		ORG 0010h
Source	DB 10, 20, 30, 40, 50, 60
		ORG 0028h
Dest	DB 6 DUP (?)
DtaSeg	ENDS

CodSeg	SEGMENT para private 'code'
		
Main	PROC near
		ASSUME cs:CodSeg, ds:DtaSeg, ss:StkSeg

		mov ax, DtaSeg
		mov ds, ax

		mov si, OFFSET Source
		mov di, OFFSET Dest

		mov cx, 6h
Copy:	mov al, [si]
		mov [di], al
		inc si
		inc di
		loop Copy

		mov ax, 4C00h
		int 21h

Main	ENDP

CodSeg	ENDS
		
		END Main