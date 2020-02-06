## v0 - reads in an integer
## t0 - holds the sum
## a0 - points to strings to be printed
## - also used to pass N to "sumup"
# text segment #
.text
.globl main
main: # execution starts here
la $a0,prompt1 # print prompt on terminal
li $v0,4 # system call to print
syscall # out a string
li $v0,5 # syscall 5 reads an integer
syscall
move $a0, $v0 # copy the integer to $a0
jal sumup # procedure/function call
move $t0, $v0 # copy the sum to $t0
la $a0,ans1 # print string before the sum
li $v0,4
syscall
move $a0,$t0 # print the sum
li $v0,1
syscall
la $a0,endl # syscal to print out
li $v0,4 # a new line
syscall
li $v0,10 # exit
syscall # Bye!
## The function "sumup" will calculate the sum of
## the integers from 1 to N (N will be passed to
## the function "sumup" in register $a0, and
## the sum will be returned in $v0).
sumup:
move $v0, $0 # Initialize the sum to 0
#li $v0, 0 # OR initialize it this way
loop: add $v0, $v0, $a0 # $v0 = $v0 + $a0
addi $a0, $a0, -1 # $a0 = $a0 - 1
bnez $a0, loop # branch to loop if $a0 != 0
jr $ra # return to the calling function
# data segment #
.data
prompt1: .asciiz "Please enter an integer: "
ans1: .asciiz "The sum is "
endl: .asciiz "\n"
##
## end of file sum.s
