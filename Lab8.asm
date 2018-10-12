; Churong Zhang

.386

.model flat

public _Average

.code

_Average proc

	mov		ecx, [esp + 4]		; get number of elements in array
	mov		ebx, [esp + 8]		; get address of array
	xor		eax, eax
	Loop1:
			add		eax, DWORD PTR [ebx]		; have to tell the size of the element I am adding to
			add		ebx, 4
			dec		ecx
			jnz		Loop1
			
			mov		ecx ,[esp + 4]
			cdq
			idiv	ecx

			and		ecx, 1
			jz		Even1

		Odd:
			mov		ecx ,[esp + 4]
			sar		ecx, 1
			cmp		edx, ecx
			jg		Plus
			jmp		Done
		Even1:
			mov		ecx ,[esp + 4]
			sar		ecx, 1
			cmp		edx, ecx
			jge		Plus
			jmp		done
		Plus:
			inc		eax
		Done:
		ret
_Average endp

end