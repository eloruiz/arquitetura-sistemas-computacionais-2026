# Eloise dos Santos Ruiz - 24002341

# Faça um programa que:
#- pede um número inteiro entre 0 e 100 para o usuário (use um byte)
#- lê um número inteiro digitado pelo usuário e salva em um registrador tipo S;
#- pede outro número até que o usuário digite o mesmo número digitado no início;
#- o programa só encerra quando o número lido for igual ao primeiro; 

.data
msg1: .asciiz "Digite um número de 0 a 100: "
msg2: .asciiz "Digite outro número: "
num: .byte 0

.text 
.globl main

main:

#aqui estamos pedindo o primeiro num 
addi $v0, $zero, 4  
la $a0, msg1
syscall

#aqui estamos lendo o primeiro num 
addi $v0, $zero, 5
syscall

# se for menor q o 0 vai voltar
slti $t0, $v0, 0 #o 0 pois n pode ser menor q ele 
bne  $t0, $zero, main #bne vai voltar e pedir outro num 

# se for maior q 100 vai voltar ate ser menor 
slti $t0, $v0, 101  
beq  $t0, $zero, main #vai voltar se for igual a 0 

#vai guardar o valor em $s0
or $s0, $v0, $zero

#vai guardar o num em um byte
sb $s0, num
    
loop: 

#pede a segunda mensagem 
addi $v0, $zero, 4
la $a0, msg2
syscall

#le a segunda mensagem 
addi $v0, $zero, 5
syscall

#se for diferente do primeiro vai pedir dnv 
bne $v0, $s0, loop

fim: 

addi v0, $zero, 10
syscall
