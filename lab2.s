

# Name and general description of the program
# This is a sample program to read from keyboard and print on the screen
# ----------------------------------------------------
# Data declaration go in this section

.data
prompt: .asciiz            "Please input a number: "
max: .asciiz "The maximum of the four numbers is "
min: .asciiz "The minumum of the four numbers is "
end: .asciiz "\n"

# Program-specific date declaration
# ----------------------------------------------------
# Program code goes in this section

.text
.globl main
.ent main
###########################################################################################################################################

main:
jal readtwo
jal readtwo
jal findminmax

li $v0, 10                  # Code 10 = Exit
syscall  

###########################################################################################################################################  
readtwo:

li $v0, 4                    # Code 4 = Print string		
la $a0, prompt         # load address of the string
syscall                      # Ask Operating System to perform the service (4 == Print string)

li $v0, 5                    # Code 5 = read integer and store it in $v0
syscall                       # Ask Operating System to perform the service (5 == Read from keyboard)	
sw $v0, ($sp)	  #PUSH VALUE TO THE STACK
subu $sp, $sp, 4

li $v0, 4                    # Code 4 = Print string		
la $a0, prompt         # load address of the string
syscall                      # Ask Operating System to perform the service (4 == Print string)
li $v0, 5                    # Code 5 = read integer and store it in $v0
syscall 
sw $v0, ($sp) #PUSH VALUE TO THE STACK  
subu $sp, $sp, 4

jr $ra 	#RETURN TO MAIN

###########################################################################################################################################

###########################################################################################################################################

findminmax:
addu $sp, $sp, 4
lw $s3, ($sp)
move $s4, $s3
addu $sp, $sp, 4
lw $s2, ($sp)
move $s5, $s2
addu $sp, $sp, 4
lw $s1, ($sp)
move $s6, $s1
addu $sp, $sp, 4
lw $s0, ($sp)
move $s7, $s0

#-----------------------------------------------------# least
blt $s1, $s0, L1
move $s1, $s0
L1:
blt $s2, $s1, L2
move $s2, $s1
L2: 

blt $s3, $s2, L3
move $s3, $s2
L3: 
move $s0, $s3
move $s1, $s3
move $s2, $s3
#-----------------------------------------------------# greatest
bgt $s5, $s4, G1
move $s5, $s4
G1:
	
bgt $s6, $s5, G2
move $s6, $s5
G2:

bgt $s7, $s6, G3
move $s7, $s6
G3:
move $s4, $s7
move $s5, $s7
move $s6, $s7

li $v0, 4                    # Code 4 = Print string		
la $a0, max         # load address of the string
syscall                      # Ask Operating System to perform the service (4 == Print string)
li $v0, 1                    # Code 4 = Print string	
move $a0, $s4         # load address of the string
syscall 
li $v0, 4                    # Code 4 = Print string		
la $a0, end         # load address of the string
syscall                      # Ask Operating System to perform the service (4 == Print string)
la $a0, min         # load address of the string
syscall                      # Ask Operating System to perform the service (4 == Print string)
li $v0, 1                    # Code 4 = Print string	
move $a0, $s0         # load address of the string
syscall 


jr $ra 	#RETURN TO MAIN

###########################################################################################################################################
