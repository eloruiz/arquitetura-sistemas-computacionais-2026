# Eloise dos Santos Ruiz - 24002341

#Faça um programa que calcule o fatorial de um número, utilizando
#recursividade e pilha. Execute passo a passo e verifique o que acontece
#com os registradores utilizados e com a pilha. O programa deverá ler o
#número que queremos calcular o fatorial, imprimir o fatorial e sair após um
#enter. Colocar mensagens para entradas de dados

.data

msg1: .asciiz "Digite um numero para calcular o fatorial: "
msg2: .asciiz "O fatorial eh: "
msg3: .asciiz "\nPressione ENTER para sair."

.text
.globl main

main:

    # imprime mensagem de entrada
    addi $v0, $zero, 4
    la   $a0, msg1
    syscall

    # le numero inteiro
    addi $v0, $zero, 5
    syscall

    # coloca o numero em $a0
    or   $a0, $v0, $zero

    # chama a funcao fatorial
    jal fatorial

    # guarda resultado em $s0
    or   $s0, $v0, $zero

    # imprime mensagem do resultado
    addi $v0, $zero, 4
    la   $a0, msg2
    syscall

    # imprime o resultado
    addi $v0, $zero, 1
    or   $a0, $s0, $zero
    syscall

    # mensagem para pressionar ENTER
    addi $v0, $zero, 4
    la   $a0, msg3
    syscall

    # le um caractere
    addi $v0, $zero, 12
    syscall

    # encerra
    addi $v0, $zero, 10
    syscall

fatorial:

    # caso base: se n < 2, retorna 1
    slti $t0, $a0, 2
    bne  $t0, $zero, caso_base

    # abre espaco na pilha
    addi $sp, $sp, -8

    # guarda o endereco de retorno
    sw   $ra, 4($sp)

    # guarda o valor atual de n
    sw   $a0, 0($sp)

    # n = n - 1
    addi $a0, $a0, -1

    # chamada recursiva
    jal fatorial

    # recupera o n original
    lw   $a0, 0($sp)

    # recupera endereco de retorno
    lw   $ra, 4($sp)

    # libera espaco da pilha
    addi $sp, $sp, 8

    # resultado = n * fatorial(n-1)
    mul  $v0, $a0, $v0

    # retorna
    jr   $ra


caso_base: #retorna 1

    addi $v0, $zero, 1

    jr   $ra