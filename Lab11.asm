;Churong Zhang

.386

.model flat

.code
ShowSquare		= 0
ShowMultiply	= 1
ShowDivide		= 2
ShowRemainder	= 3
ShowDivideFailure = 4

Failure		= 0
Success		= 1

public _Divide
public _Multiply 
public _Square

extrn _PrintResult: proc


MCallFunc	macro Func:req, P1, P2, P3, P4, P5
		IFNB<P1>
			IFNB<P2>
				IFNB<P3>
					IFNB<P4>
						IFNB<P5>
							push	P5
							push	P4
							push	P3
							push	P2
							push	P1
							call	Func
							add		esp, 20
						ELSE
						push	P4
						push	P3
						push	P2
						push	P1
						call	Func
						add		esp, 16
						ENDIF
					ELSE
					push	P3
					push	P2
					push	P1
					call	Func
					add		esp, 12
					ENDIF
				ELSE
				push	P2
				push	P1
				call	Func
				add		esp, 8
				ENDIF
			ELSE
			push	P1
			call	Func
			add		esp, 4	
			ENDIF
		ELSE
		call	Func
		ENDIF	
endm


SetUp macro P1,P2, P3, P4
	IFNB<P2>
			IFNB<P3>
					IFNB<P4>
						mov		P1, [esp + 4]
						mov		P2, [esp + 8]
						mov		P3, [esp + 12]
						mov		P4, [esp + 16]
					ELSE
						mov		P1, [esp + 4]
						mov		P2, [esp + 8]
						mov		P3, [esp + 12]
					ENDIF
				ELSE
					mov		P1, [esp + 4]
					mov		P2, [esp + 8]
				ENDIF
			ELSE
				mov		P1, [esp + 4]
			ENDIF
ENDM

Swap macro P1,P2, P3, P4
	IFNB<P3>
		mov		P1, [esp + 12]
		mov		[P1], P2
		mov		P3, [esp + 16]
		mov		[P3], P4
	ELSE
		mov		P1, [esp + 16]
		MOV		P2, [P1]
	ENDIF
ENDM

_Square proc
	SetUp	eax
	imul	eax, eax
	MCallFunc	_PrintResult, ShowSquare, eax
	mov		eax, [esp - 4]; since we move esp back to the return address, that mean the answer is 
							; locate at [esp - 4].
	ret
_Square endp

_Multiply proc
	SetUp	ebx, ecx
	imul	ebx, ecx
	MCallFunc	_PrintResult, ShowMultiply, ebx

	mov		eax, [esp - 4]
	ret
_Multiply endp

_Divide proc

	SetUp	eax, ebx, ecx

	cmp		ebx, 0
	je		Fail
	cdq
	idiv	ebx

;	mov		ecx, [esp + 12]
;	mov		[ecx], eax
;	mov		ebx, [esp + 16]
;	mov		[ebx], edx
	
	; put the answer back to the function
	Swap ecx, eax, ebx, edx

	MCallFunc	_PrintResult, ShowDivide, eax

;	mov		eax, [esp + 16]
;	mov		edx, [eax]
	Swap	eax, edx

	MCallFunc	_PrintResult, ShowRemainder, edx

	mov		eax, Success
	jmp		done

Fail:

	MCallFunc	_PrintResult, ShowDivideFailure, ebx
	mov		eax, Failure

done:

	ret
_Divide endp
 
end