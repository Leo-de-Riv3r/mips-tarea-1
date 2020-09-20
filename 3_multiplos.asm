.data
comma: .asciiz ","
msg1: .asciiz "Multiplos de 3: "
msg2: .asciiz  "\nMultiplos de 5: " 

.text
.globl main
main:
	li	$t0, 3          # int cont = 3;
	li	$v0, 4		# print_string code
	la	$a0, msg1 
	syscall                 # puts(msg1);
	
loop1:
	bgt 	$t0, 100, main2 # while (cont < 100){
	li	$v0, 1
	move	$a0, $t0	
	syscall		        # prints cont 
	addi 	$t0, $t0, 3     # cont + 3;
	li	$v0, 4		# print_string code
	la	$a0, comma
	syscall
        j	loop1           # }
        
main2:                          # prints the second message in a new line
	li	$v0, 4 
	la 	$a0, msg2 
	syscall                 # puts(msg2);
	li      $t0, 5          # set count to 5
        
loop2:                          # the same that in loop1 but this is for the multiples of 5 
        bgt 	$t0, 100, exit  # while (cont < 100){
	li	$v0, 1
	move	$a0, $t0	
	syscall		        # prints cont 
	li	$v0, 4		# print_string code
	la	$a0, comma
	syscall
	addi 	$t0, $t0, 5     # cont + 3   
	j	loop2     
	 
exit:
 	li	$v0, 10
 	syscall
