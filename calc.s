.data
mes1:  .asciiz "Dwse Onoma kai epwnymo: \n"
mes2: .asciiz "Dwse AM: \n"
mes3: .asciiz "Dwse arithmo eksamhnou spoudwn: \n"
mes4: .asciiz "Dwse dyo akeraious arithmous: \n"
mes5: .asciiz "1.PROSTHESI \n"
mes6: .asciiz "2.AFAIRESH \n"
mes7: .asciiz "3.POLLAPLASIASMOS \n"
mes8: .asciiz "4.DIAIRESH \n"
mes9: .asciiz "5.YPSWSH STO TETRAGWNO \n"
mes10: .asciiz "GRAPSE TO AM SOU AN THES NA STAMATHSEI TO PROGRAMMA \n"
mes11: .ascii "ANTIO!"
bsn: .asciiz "\n"
onoma: .space 69
size: .word 68
ar: .word 0, 0
am: .word 0
eksamhno: .word 0
test: .word 0
ap: .word 0
.text

.globl main

main:

li $v0, 4 
la $a0, mes1 
syscall

li $v0, 8
la $a0, onoma
lw $a1, size
syscall

li $v0, 4
la $a0, onoma
syscall

la $s0, ar

la $s1, am

la $s2, eksamhno

li $v0, 4 
la $a0, mes2
syscall

li $v0, 5
syscall
sw$v0, 0($s1)


lw $s7, 0 ($s1)

li $v0, 1
move $a0, $s7
syscall 

li $v0, 4 
la $a0, bsn 
syscall

li $v0, 4 
la $a0, mes3
syscall

li $v0, 5
syscall
sw $v0, 0($s2)

lw $t0, 0 ($s2)

li $v0, 1
move $a0, $t0
syscall 

li $v0, 4 
la $a0, bsn 
syscall


loop:

li $v0, 4 
la $a0, mes4
syscall

li $v0, 5
syscall
sw$v0, 0($s0)

li $v0, 5
syscall
sw$v0, 4($s0)

li $v0, 4 
la $a0, bsn 
syscall

lw $t3, 0($s0)
lw $t4, 4($s0)

li $v0, 4 
la $a0, mes5
syscall

li $v0, 4 
la $a0, mes6
syscall

li $v0, 4 
la $a0, mes7
syscall

li $v0, 4 
la $a0, mes8
syscall

li $v0, 4 
la $a0, mes9
syscall

la $s3, test

la $t7, ap

li $v0, 5
syscall
sw$v0, 0($s3)

lw $s4, 0($s3)

addi $s5, $zero, 1
beq $s4, $s5, pr
addi $s5, $zero, 2
beq $s4, $s5,af
addi $s5, $zero, 3
beq $s4, $s5,pol
addi $s5, $zero, 4
beq $s4, $s5, dia
addi $s5, $zero, 5
beq $s4, $s5, pow

pr:
add $t5, $t3, $t4
li $v0, 1
move $a0, $t5
syscall 
li $v0, 4 
la $a0, bsn 
syscall
j exit

af:
sub $t5, $t3, $t4
li $v0, 1
move $a0, $t5
syscall 
li $v0, 4 
la $a0, bsn 
syscall
j exit

pol:
mul $t5, $t3, $t4
li $v0, 1
move $a0, $t5
syscall
li $v0, 4 
la $a0, bsn 
syscall 
j exit

dia:
div $t5, $t3, $t4
li $v0, 1
move $a0, $t5
syscall 
li $v0, 4 
la $a0, bsn 
syscall
j exit

pow:
mul $t5, $t3, $t3
li $v0, 1
move $a0, $t5
syscall 
li $v0, 4 
la $a0, bsn 
syscall
mul $t6, $t4, $t4
li $v0, 1
move $a0, $t6
syscall 
li $v0, 4 
la $a0, bsn 
syscall
j exit

exit:

li $v0, 4 
la $a0, mes10
syscall

li $v0, 5
syscall
sw $v0, 0($t7)

lw $s6, 0 ($t7)

bne $s6, $s7,  loop

li $v0, 4 
la $a0, mes11
syscall

li $v0, 10
syscall


