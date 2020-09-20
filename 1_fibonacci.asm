.data
comma: .asciiz ", "
msg: .asciiz "Los primeros 20 numeros de fibonacci son:"  
new_line: .asciiz "\n"
.text
.globl main
main:                  # set and print the two first numbers of fibonacci
	li	$v0, 4           # print_string code
	la	$a0, msg
	syscall              # print msg
	li	$t0, 1           # cont = 1;
	li	$t1, 0           # n-1
	li	$t2, 0           # n-2
	li	$v0, 4	         # print_string code
	la	$a0, new_line
	syscall              # print a new line where the numbers will be printed
	li	$v0, 1 
	addi	$t1, $t1, 1    # t1 is the first fibonacci number  
	move	$a0, $t1
  syscall              # prints t1 = 1
  li	$v0, 4
  la	$a0, comma
  syscall	             # prints the coma
  li	$v0, 1
  addi	$t2, $t2, 1    # t2 is the second fibonacci number
  move	$a0, $t2
  syscall 	           # prints t2 = 1
  li	$v0, 4
  la	$a0, comma
  syscall 

loop:
	beq  	$t0, 19, exit  # while (cont < 10) {
	add	$t3, $t2, $t1    # result = the two previous numbers of fibonacci
	li	$v0, 1        
	move	$a0, $t3
	syscall	             # prints result
	li	$v0, 4
	la	$a0, comma
	syscall	             # prints a comma
	move	$t1, $t2       # change the value of t1 for the next loop  
	move	$t2, $t3       # change the value of t2 for the next loop
	addi	$t0, $t0, 1    # cont++;
	j loop               # }
	

exit:
	li	$v0, 10 
	syscall

