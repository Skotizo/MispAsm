# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
# program specific data declarations
# ----------------------------------------
# Program code goes in this section.
.text
.globl main
.ent main
main:
# -----
# your program code goes here.
# -----
# Done, terminate program.
li $v0, 10
syscall # all done!
.end main
