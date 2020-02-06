# Example to find the median of a sorted
# array of integer values of even length.
# -----------------------------------------------------
# Data Declarations
.data
array: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
.word 21, 23, 25, 27, 29, 31, 33, 35, 37, 39
.word 41, 43, 45, 47, 49, 51, 53, 55, 57, 59
length: .word 30
median: .word 0
# -----------------------------------------------------
# text/code section
# The median for an even length array is defined as:
# median = ( array[len/2] + array[len/2-1] ) / 2
# Note, the len/2 is the index. Must convert the index
# into the an offset from the base address (of the
# array. Since the data is words (4 bytes), multiply
# the index by four to convert to the offset.
.text
.globl main
.ent main
main:
la $t0, array # starting addr of array
lw $t1, length # value of length
div $t2, $t1, 2 # length / 2
mul $t3, $t2, 4 # cvt index into offset
add $t4, $t0, $t3 # add base addr of array
lw $t5, ($t4) # get array[len/2]
sub $t4, $t4, 4 # addr of prev value
lw $t6, ($t4) # get array[len/2-1]
add $t7, $t6, $t5 # a[len/2] + a[len/2-1]
div $t8, $t7, 2 # / 2
sw $t8, median # save median
# -----
# Done, terminate program.
li $v0, 10 # terminate
syscall # system call
.end main
