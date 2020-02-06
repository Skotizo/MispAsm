# Example to compute the volume and surface area
# of a rectangular parallelepiped.
# -----------------------------------------------------
# Data Declarations
.data
aSide: .word 73
bSide: .word 14
cSide: .word 16
volume: .word 0
surfaceArea: .word 0
# -----------------------------------------------------
# Text/code section
.text
.globl main
.ent main
main:
# -----
# Load variables into registers.
lw $t0, aSide
lw $t1, bSide
lw $t2, cSide 
# ----
# Find volume of a rectangular parallelpiped.
# volume = aSide * bSide * cSide
mul $t3, $t0, $t1
mul $t4, $t3, $t2
sw $t4, volume
# -----
# Find surface area of a rectangular parallelepiped.
# surfaceArea = 2*(aSide*bSide+aSide*cSide+bSide*cSide)
mul $t3, $t0, $t1 # aSide * bSide
mul $t4, $t0, $t2 # aSide * cSide
mul $t5, $t1, $t2 # bSide * cSide
add $t6, $t3, $t4
add $t7, $t6, $t5
mul $t7, $t7, 2
sw $t7, surfaceArea
# -----
# Done, terminate program.
li $v0, 10 # call code for terminate
syscall # system call (terminate)
.end main
