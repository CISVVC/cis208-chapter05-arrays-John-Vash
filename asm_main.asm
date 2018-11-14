;
; file: asm_main.asm

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
        syswrite: equ 4
        stdout: equ 1
        exit: equ 1
        SUCCESS: equ 0
        kernelcall: equ 80h
	
	


; uninitialized data is put in the .bss segment
;
segment .bss

;
; code is put in the .text segment
;
segment .text
	global	asm_main	
asm_main:
        enter   0,0               ; setup routine
        pusha
; *********** Start  Assignment Code *******************
	;See function below. It is called from main.c
; *********** End Assignment Code **********************

        popa
        mov     eax, SUCCESS       ; return back to the C program
        leave                     
        ret

;
; C-callable routine that multiples all the array's values by a scalar.
; C prototype:
; void scalar_mult( const int * a, int n, int s);
; Parameters:
;   a - pointer to array to print out (at ebp+8 on stack)
;   n - number of integers in teh array (at ebp+12 on stack)
;   s - an integer used for multiplying (at ebp+16 on stack)
segment .text
	global	scalar_mult
scalar_mult:
	enter	0,0
	push	ebx	

	mov	edx,[ebp+12] ;length of array
	mov	ecx,[ebp+16] ;scalar to multiply by
	mov	eax,[ebp+8]  ;start of the array
	lea	ebx, [eax+edx*4] 

loop_start:
	mov	edx,[eax]
	add	eax, 4
	imul	edx, ecx
	mov	[eax-4], edx
	cmp	eax, ebx
	jne	loop_start
loop_end:
	mov	eax,0
	pop	ebx
	leave
	ret



	popa
	leave 
	ret

