; Churong Zhang

.386

.model flat

.code

public _Divide

_Divide proc
		
		mov			eax, [esp + 4]
		cmp			DWORD PTR [esp + 8], 0
		je			zero
		cdq
		idiv		DWORD PTR [esp + 8]	
	rem:
		mov			ebx, [esp + 12]
		cmp			ebx, 0
		je			enda
		mov			[ebx], edx
		jmp			enda
	zero:
		mov		eax, -1
		sub		edx, edx
		jmp		rem
	enda:
		ret
_Divide endp

end