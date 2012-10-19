! program demoString.s
! Sample program to show how to print messages on the screen
! It must be linked with the files stringio.s and iofunc.o
!      gcc demoString.s stringio.s iofunc.o

	EOL = 10	! end of line character
	           
        .data
msg1:	.asciz	"Hello"
msg2:	.asciz	"Goodbye"

        .text
	.global main
main:
	save %sp,-96,%sp
	
	set	msg1, %o0		! pass address of message
        call	writeString		! print message
        nop

	call	writeChar		! print end of line character
	mov	EOL, %o0		! [delay slot filled]	

        set	msg2, %o0		! pass address of message
        call	writeString		! print message
        nop	

	call	writeChar		! print end of line character
	mov	EOL, %o0		! [delay slot filled]

        ret
        restore
