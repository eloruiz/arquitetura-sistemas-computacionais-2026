# Eloise dos Santos Ruiz - 24002341
# Faça um programa que lê um número digitado pelo usuário e imprima o próprio número

main:

li $v0, 5 #tab da syscall que le um num int 
syscall

add $t0, $v0, $zero

li $v0, 1
add $a0, $t0, $zero
syscall

