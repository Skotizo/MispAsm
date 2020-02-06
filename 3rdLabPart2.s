##
## Program Name: loop2.s
##
## - will calculate the sum of all elements in the array
## whose value is less than 1000.
## - "numbers" is an array with 5 integer elements.
## - "count" holds the number of elements in "numbers".
##
##
## - Output format must be
## "sum = 16"
##
## t0 - points to array elements in turn
## t1 - contains a count of elements
## t2 - contains sum
##
## t3 - each word from the array "numbers" in turn
##
#################################################
# #
# text segment #
# #
#################################################
 .text
 .globl __start
__start: # execution starts here 
# Put your answer between dashed lines.
#
#------------------Your code starts next line---------------
la $t0, numbers
li $t1, 0
li $t2, 0

sum:
lw $t3, ($t0)
bgt $t3, 1000, counter
add $t2, $t2, $t3

counter:
add $t0, $t0, 4
add $t1, $t1, 1
beq $t1, 5, print
j sum

print:
la $a0, ans1
li $v0, 4
syscall

move $a0, $t2
li $v0, 1
syscall
       
#-----------------Your code ends above this line----------------
la $a0,endl # syscall to print out
li $v0,4 # a new line
syscall
li $v0,10 # Exit
syscall # Bye!
#################################################
# #
# data segment #
# #
################################################
 .data
numbers:
.word 4,2000,3,9,3000
count: .word 5
ans1: .asciiz "sum = "
endl: .asciiz "\n"
