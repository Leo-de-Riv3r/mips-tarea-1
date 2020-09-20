.data
comma: .asciiz ","
new_line: .ascii "\n"
msg1: .asciiz "Multiplos de 3: "
msg2: .asciiz  "Multiplos de 5: " 
.text
.globl main
main:
	li	$t0, 3          # int cont = 3;
	li	$v0, 4		# print_string code
	la	$a0, msg1 
	syscall                 # puts(msg1);
	
loop1:
	bgt 	$t0, 100, main2 # while (cont < 100){
	rem     $t1, $t0, 3     # int t1 = cont % 3;
	beqz    $t1, printf1    # if cont is a multiple of 3, it prints it
return1:			# after printing the multiple, the program returns to this sector to add 1 to count and repeat the loop
	addi 	$t0, $t0, 1     # cont++;
        j	loop1           # }
        
main2:                          # prints the second message in a new line
	li	$v0, 4		# print_string code   
	la	$a0, new_line
	li	$t0, 5          # set count to 5
	syscall
	li	$v0, 4
	la 	$a0, msg2 
	syscall                 # puts(msg2);
  
loop2:                          # the same that in loop1 but this is for the multiples of 5 
	bgt	$t0, 100, exit 
	rem	$t1, $t0, 5  
	beqz    $t1, printf2
	
return2:
	addi	$t0, $t0, 1      
	j	loop2     
	 
printf1:                         # prints the multiples of 3
	li	$v0, 1		 # print_int code
	move    $a0, $t0
	syscall	                # printf("%i", cont);
	li	$v0, 4
	la	$a0, comma
	syscall	                # print a comma
	j       return1

printf2:			# prints the multiples of 5
	li	$v0, 1
	move	$a0, $t0
	syscall
	li	$v0, 4
	la	$a0, comma
	syscall	                # print a comma
	j	return2

exit:
 	li	$v0, 10
 	syscall
