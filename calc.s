.data #Τμήμα δήλωσης μεταβλητών
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

li $v0, 4 #Ζητάει απο τον χρήστη το ονομα και το επωνυμο του!
la $a0, mes1 
syscall

li $v0, 8 #Διάβασμα αλφαριθμητικού.
la $a0, onoma
lw $a1, size
syscall

li $v0, 4 #Εμφάνιση αλφαριθμητικού.
la $a0, onoma
syscall

la $s0, ar

la $s1, am

la $s2, eksamhno

li $v0, 4 #Ζήτηση Αριθμου Μητρώου από τον χρήστη
la $a0, mes2
syscall

li $v0, 5 #Διάβασμα αριθμού
syscall
sw$v0, 0($s1)


lw $s7, 0 ($s1)

li $v0, 1 #Eμφάνιση αριθμού
move $a0, $s7
syscall 

li $v0, 4 #Αλλαγή γραμμής για ομοιόμορφο κείμενο
la $a0, bsn 
syscall

li $v0, 4 #Ζήτηση αριθμού εξαμήνου φοιτητή
la $a0, mes3
syscall

li $v0, 5  #Διάβασμα αριθμού εξαμήνου
syscall
sw $v0, 0($s2)

lw $t0, 0 ($s2)

li $v0, 1  #Εμφάνιση αριθμού εξαμήνου
move $a0, $t0
syscall 

li $v0, 4 
la $a0, bsn 
syscall


loop:  #Αρχή ενός do-while loop

li $v0, 4 #Ζήτηση δύο ακέραιων αριθμών
la $a0, mes4
syscall

li $v0, 5 #Διάβασμα Πρώτου ακεραίου
syscall
sw$v0, 0($s0)

li $v0, 5 #Διάβασμα Δεύτερου ακεραίου
syscall
sw$v0, 4($s0)

li $v0, 4 
la $a0, bsn 
syscall

lw $t3, 0($s0)
lw $t4, 4($s0)

li $v0, 4 #Πάτα 1 για πρόσθεση
la $a0, mes5
syscall

li $v0, 4 #Πάτα 2 για αφαίρεση
la $a0, mes6
syscall

li $v0, 4 #Πάτα 3 για πολλαπλασιασμό
la $a0, mes7
syscall

li $v0, 4 #Πάτα 4 για διαίρεση
la $a0, mes8
syscall

li $v0, 4 #Πάτα 5 για ύψωση στη δευτέρα
la $a0, mes9
syscall

la $s3, test

la $t7, ap

li $v0, 5 #Διάβασμα Επιλογής από τον χρήστη
syscall
sw$v0, 0($s3)

lw $s4, 0($s3)

addi $s5, $zero, 1 #Θέτω έναν καταχωρητή ίσο με 1 για τη συγκριση 
beq $s4, $s5, pr #Αν επιλογή==1
addi $s5, $zero, 2 #Θέτω έναν καταχωρητή ίσο με 2 για τη συγκριση
beq $s4, $s5,af #Αν επιλογή==2
addi $s5, $zero, 3 #Θέτω έναν καταχωρητή ίσο με 3 για τη συγκριση
beq $s4, $s5,pol #Αν επιλογή==3
addi $s5, $zero, 4 #Θέτω έναν καταχωρητή ίσο με 4 για τη συγκριση
beq $s4, $s5, dia #Αν επιλογή==4
addi $s5, $zero, 5 #Θέτω έναν καταχωρητή ίσο με 5 για τη συγκριση
beq $s4, $s5, pow #Αν επιλογή==5

pr:
add $t5, $t3, $t4 #Πρόσθεση των δύο αριθμών που πληκτρολόγησε ο χρήστης
li $v0, 1
move $a0, $t5
syscall 
li $v0, 4 
la $a0, bsn 
syscall
j exit #Εξοδος από την εντολή διακλάδωσης

af:
sub $t5, $t3, $t4 #Αφαίρεση των δύο αριθμών που πληκτρολόγησε ο χρήστης
li $v0, 1
move $a0, $t5
syscall 
li $v0, 4 
la $a0, bsn 
syscall
j exit #Εξοδος από την εντολή διακλάδωσης

pol:
mul $t5, $t3, $t4 #Πολλαπλασιασμός των δύο αριθμών που πληκτρολόγησε ο χρήστης
li $v0, 1
move $a0, $t5
syscall
li $v0, 4 
la $a0, bsn 
syscall 
j exit #Εξοδος από την εντολή διακλάδωσης

dia:
div $t5, $t3, $t4 #Διαίρεση των δύο αριθμών που πληκτρολόγησε ο χρήστης
li $v0, 1
move $a0, $t5
syscall 
li $v0, 4 
la $a0, bsn 
syscall
j exit #Εξοδος από την εντολή διακλάδωσης

pow:
mul $t5, $t3, $t3 #Ύψωση στη δευτέρα των δύο αριθμών που πληκτρολόγησε ο χρήστης
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
j exit #Εξοδος από την εντολή διακλάδωσης

exit: #Label για την έξοδο από την διακλάδωση

li $v0, 4 #Μήνυμα ερώτησης προς τον χρήστη για το αν επιθυμεί να διακοπεί η λειτουργία του προγράμματος εισάγωντας το ΑΜ του
la $a0, mes10
syscall

li $v0, 5 
syscall
sw $v0, 0($t7)

lw $s6, 0 ($t7)

bne $s6, $s7,  loop #Εαν ο χρήστης δεν πληκτρολόγησε το ΑΜ του, πάει ξανά πάνω στο label loop για να πραγματοποιηθεί άλλη μια πράξη

li $v0, 4 #Αν ο χρήστης πληκτρολόγησε το ΑΜ, θα εμφανιστεί αυτό το μήνυμα τερματισμού...
la $a0, mes11
syscall

li $v0, 10 #ΤΕΛΟΣ ΠΡΟΓΡΑΜΜΑΤΟΣ
syscall


