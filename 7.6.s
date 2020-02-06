# Example to reverse values in an array
# by using the stack.
# -----------------------------------------------------
# Data Declarations
.data
array: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
.word 21, 23, 25, 27, 29, 31, 33, 35, 37, 39
.word 41, 43, 45, 47, 49, 51, 53, 55, 57, 59
length: .word 30
# -----------------------------------------------------
# Text/code section
# Basic approach:
# - loop to push each element onto the stack
# - loop to pop each element off the stack
# Final result is all elements reversed.
.text
.globl main
.ent main
main:
# -----
# Loop to read items from array and push to stack.
la $t0, array # array starting address
li $t1, 0 # loop index, i=0
lw $t2, length # length
pushLoop:
lw $t4, ($t0) # get array[i]
subu $sp, $sp, 4 # push array[i]
sw $t4, ($sp)
add $t1, $t1, 1 # i = i+1
add $t0, $t0, 4 # update array address
blt $t1, $t2, pushLoop # if i<length, continue
# -----
# Loop to pop items from stack and write into array.
la $t0, array # array starting address
li $t1, 0 # loop index, i=0
lw $t2, length # length (redundant line)
popLoop:
lw $t4, ($sp)
addu $sp, $sp, 4 # pop array[i]
sw $t4, ($t0) # set array[i]
add $t1, $t1, 1 # i = i+1
add $t0, $t0, 4 # update array address
blt $t1, $t2, popLoop # if i<length, continue
# -----
# Done, terminate program.
li $v0, 10 # terminate
syscall # system call
.end main