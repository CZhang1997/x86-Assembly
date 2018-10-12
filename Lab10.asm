; Churong Zhang


.386

.model flat

public _Average

.code

_Average proc

	mov		eax, [esp + 8]
	mov		ecx, [esp + 4]
	dec		ecx

	finit
	fld		REAL8 PTR [eax]
	jz		done
Sum:
	add		eax, 8
	fld		REAL8 PTR [eax]
	fadd
	dec		ecx
	jnz		Sum

	fild	Dword PTR [esp + 4]
	fdiv
Done:

ret
_Average endp




end