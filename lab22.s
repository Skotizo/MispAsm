

# Name and general description of the program
# This is a sample program to read from keyboard and print on the screen
# ----------------------------------------------------
# Data declaration go in this section

.data
prompt: .asciiz            "Please input a number: "
answer: .asciiz "The sum is "
end: .asciiz "\n"

# Program-specific date declaration
# ----------------------------------------------------
# Program code goes in this section

.text
.globl main
.ent main
main:
jal readtwo
jal readtwo
#jal findminmax

li $v0, 10                  # Code 10 = Exit
syscall  

###########################################################################################################################################  
readtwo:
li $v0, 4                    # Code 4 = Print string		
la $a0, prompt         # load address of the string
syscall                      # Ask Operating System to perform the service (4 == Print string)

li $v0, 5                    # Code 5 = read integer and store it in $v0
syscall                       # Ask Operating System to perform the service (5 == Read from keyboard)	

sub $sp, $sp, 8 
sw $v0, 4($sp)	  #PUSH VALUE TO THE STACK

li $v0, 4                    # Code 4 = Print string		
la $a0, prompt         # load address of the string
syscall                      # Ask Operating System to perform the service (4 == Print string)

li $v0, 5                    # Code 5 = read integer and store it in $v0
syscall 
sw $v0, 0($sp) #PUSH VALUE TO THE STACK  

jr $ra 	#RETURN TO MAIN
#li $v0, 4  
			# Code 4 = Print string                		
#lw $s0, 4($sp)
 #$a0, $s0         # load address of the string
#syscall 
#la $s0, 0($sp)
#move $a0, $s0
#syscall    


                                      # Ask Operating System to perform the service (5 == Read from keyboard)	

###########################################################################################################################################
#findminmax:

###########################################################################################################################################
