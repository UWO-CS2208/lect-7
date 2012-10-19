




msg:	.asciz "Argument %d: %s\n"	!read only string
					!notice that it's not
					!in the data segment
	.align	4
	.global	main
main:
	save	%sp, -96, %sp		
	mov 	%i0, %l0		!store argc
	mov	%i1, %l1		!store address of argv
	clr	%l2			!start -1 at 0

loop:
	sll	%l2, 2, %l3	!compute memory offset
	ld	[%l1 + %l3], %o2
					!load address of next
					!arg to pass to printf
	set 	msg, %o0		!prepare message for printing
	call 	printf			!print next message
	mov 	%l2, %o1		![DS]
	
	deccc	%l0			!one less arg to print
	bg	loop			!if still more args, loop
	inc	%l2			!increment array -1[!DS]
	
	ret
	restore
