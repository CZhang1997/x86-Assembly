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

_Square proc
	mov		ebx, [esp + 4]
	imul	ebx, ebx

	push	ebx
	push	ShowMultiply
	call	_PrintResult
	
	add		esp, 8
	mov		eax, ebx
	
	ret
_Square endp

_Multiply proc
	mov		ebx, [esp + 8]
	mov		ecx, [esp + 4]

	imul	ebx, ecx

	push	ebx
	push	ShowMultiply
	call	_PrintResult

	add		esp, 8
	mov		eax, ebx
	ret
_Multiply endp

_Divide proc
	mov		eax, [esp + 4]
	mov		ebx, [esp + 8]
	mov		ecx, [esp + 12]

	cmp		ebx, 0
	je		Fail

	cdq
	idiv	ebx

	mov		ecx, [esp + 12]
	mov		ebx, [esp + 16]
	mov		[ecx], eax
	mov		[ebx], edx

	push	edx
	push	ShowRemainder

	push	eax
	push	ShowDivide
	call	_PrintResult
	add		esp, 8

	call	_PrintResult
	add		esp, 8

	mov		eax, Success
	jmp		done

Fail:
	push	ebx
	push	ShowDivideFailure
	call	_PrintResult
	add		esp, 8
	mov		eax, Failure

done:

	ret
_Divide endp
 
end