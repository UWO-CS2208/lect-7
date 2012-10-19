! program test_string.m
!  to try calling writeString and readString
!  uses a byte array of size 81
!  (to hold up to 80 character + null character)
!  passes array length of 5, for testing purposes

	EOL = 10
include(macro_defs.m)

	local_var
	var(arr_s, 1 1*81)	!for string
	
	begin_main
	
	add 	%fp, arr_s, %o0	!address of byte array in o0
	mov 	5, %o1		!max length in o1
	call 	readString	
	nop
	
here:	add 	%fp, arr_s, %o0	!address of byte array in o0
	call 	writeString
	nop
	mov	EOL, %o0	!write end of line
	call 	writeChar
	nop
	
	ret 
	restore
