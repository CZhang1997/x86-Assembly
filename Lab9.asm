;		Churong Zhang

.386

.model flat

public _Sort
public _StrCmp
public _StrCopy
public _StrLen



.DATA

i			DWORD		?
Sorted		BYTE		?
Temp		BYTE		20 DUP (?)
Strings		DWORD		?
NumRows		DWORD		?
NumCols		DWORD		?

.code

_Sort		proc				; void Sort (char Strings [] [20], int NumRows, int NumCols)
			push		ebp

			mov			ebp, esp
			mov			ebx, [ebp + 8]		; ebx is address of Strings
			mov			edx, [ebp + 12]		; num of rows
			mov			ecx, [ebp + 16]		; num of char in string

			push		edi
			push		esi
L1:
			mov		Sorted, 1
			dec		edx
			xor		eax, eax			; set loop counter i to zero
L2:									; for (i = 0; i < NumRows; i++)
			push	edx
			push	ecx
			push	eax
			push	ebx

				inc		eax
				imul	eax, ecx
				add		ebx, eax
			push	ebx		;			push	ebx + ((eax + 1) * ecx)
				sub		ebx, ecx
			push	ebx		;			push	ebx + (eax * ecx)
			call	_StrCmp			; MemCmp (Strings [i], Strings [i + 1], NumCols)
			add		esp, 8

			cmp		eax, 0			; if (memcmp (Strings [i], Strings [i + 1], NumCols) > 0)
			jg		Swap			; If (True)
			jmp		FinishIF		; If (False)
			
Swap:
		mov		ebx, [esp]
		mov		eax, [esp + 4]
		mov		ecx, [esp + 8]
		mov		edx, [esp + 12]

				inc		eax
				imul	eax, ecx
				add		ebx, eax
		mov		esi, ebx
		PUSH	esi
		push	OFFSET Temp		;	memcpy (Temp, Strings [i + 1], NumCols);
		call	_StrCopy		;	mov 	Temp, [ebx + ((eax + 1) * ecx)]
		add		esp, 8

		mov		ebx, [esp]
		mov		eax, [esp + 4]
		mov		ecx, [esp + 8]
		mov		edx, [esp + 12]

				imul	eax, ecx
				add		ebx, eax
		push	ebx
			add		ebx, ecx
		push	ebx
		call	_StrCopy		;	memcpy (Strings [i + 1], Strings [i], NumCols);
		add		esp, 8
		
		mov		ebx, [esp]
		mov		eax, [esp + 4]
		mov		ecx, [esp + 8]
		mov		edx, [esp + 12]

			imul	eax, ecx
			add		ebx, eax

		mov edi, ebx
		
		push OFFSET Temp
		push edi				;		mov		[ebx + (eax * ecx)], Temp
		call	_StrCopy		;	memcpy (Strings [i], Temp, NumCols);
		add		esp, 8

		mov		Sorted, 0		;	Sorted = false;

FinishIF:
		pop		ebx
		pop		eax
		pop		ecx
		pop		edx
		inc		eax

		cmp		eax, edx		; For loop
		jl		L2				
		je		L1				; Do while loop
		


EndFor:
			pop		esi
			pop		edi
			pop		ebp
			ret

_Sort		endp

_StrCmp proc

	push	edi			
	push	esi			
	mov		esi, [esp + 12]	
	mov		edi, [esp + 16]	
	cld						
	repe		cmpsb

	jne		MisMatch
;	mov		eax, 0
;	jmp		done

MisMatch:
	dec		esi
	dec		edi

	mov		bh, [edi]
	cmp		[esi], bh
	jg		Greater
	je		Equal
	mov		eax, -1
	jmp		done

Equal:
	mov		eax, 0
	jmp		done
Greater:
	mov		eax, 1

done:
	pop		esi
	pop		edi
ret
_StrCmp endp


_StrCopy	proc
			push	[esp + 8]	
			call	_StrLen
			add		esp, 4
			mov		ecx, eax
			inc		ecx			
			push	edi			
			push	esi			
			mov		esi, [esp + 16]	
			mov		edi, [esp + 12]	
			cld						
			rep		movsb
			pop		esi
			pop		edi
			ret
_StrCopy	endp


_StrLen		proc
			mov		ebx, [esp + 4]
			xor		eax, eax		; sets eax to zero
			xor		cl, cl
Start:
			cmp		[ebx + eax], cl
;			mov		BYTE PTR [eax + ebx], 'A'	; 'A' gives the ascii code for the character A
			je		Done
			inc		eax
			jmp		Start
Done:	
			ret
_StrLen		endp

end