define(argc_r, l0)
define(argv_r, l1)
define(idx_r, l2)
define(offset_r, l3)

msg:	.asciz "Argument %d: %s\n"	!read only string
					!notice that it's not
					!in the data segment
	.align	4
	.global	main
main:
	save	%sp, -96, %sp		
	mov 	%i0, %argc_r		!store argc
	mov	%i1, %argv_r		!store address of argv
	clr	%idx_r			!start index at 0

loop:
	sll	%idx_r, 2, %offset_r	!compute memory offset
	ld	[%argv_r + %offset_r], %o2
					!load address of next
					!arg to pass to printf
	set 	msg, %o0		!prepare message for printing
	call 	printf			!print next message
	mov 	%idx_r, %o1		![DS]
	
	deccc	%argc_r			!one less arg to print
	bg	loop			!if still more args, loop
	inc	%idx_r			!increment array index[!DS]
	
	ret
	restore
