# Eloise dos Santos Ruiz - 24002341 
#
# Faça um programa que calcule os 12 primeiros elementos de uma serie de
# Fibonacci, utilizando recursividade. Cada numero deve ser armazenado em
# memoria e depois impresso.

.data

msg1:   .asciiz "Os 12 primeiros elementos da serie de Fibonacci sao:\n"
espaco: .asciiz " "

# 12 numeros * 4 bytes = 48 bytes
vetor:  .space 48


.text
.globl main

main:

    # imprime a mensagem inicial
    addi $v0, $zero, 4
    la   $a0, msg1
    syscall

    # $s0 = contador (comeca em 0) 
    addi $s0, $zero, 0

    # $s1 = endereco inicial do vetor
    la   $s1, vetor

calcular:

    # verifica se ja calculamos 12 numeros
    slti $t0, $s0, 12
    beq  $t0, $zero, preparar_impressao

    # passa o contador como argumento
    # fibonacci(0), fibonacci(1), ...
    or   $a0, $s0, $zero

    # chama a funcao recursiva
    jal fibonacci

    # salva o resultado na memoria
    sw   $v0, 0($s1)

    # vai para a proxima posicao do vetor
    addi $s1, $s1, 4

    # incrementa o contador
    addi $s0, $s0, 1

    j calcular

preparar_impressao:

    # contador volta para 0
    addi $s0, $zero, 0

    # volta para o inicio do vetor
    la   $s1, vetor

imprimir:

    # verifica se ja imprimiu os 12 numeros
    slti $t0, $s0, 12
    beq  $t0, $zero, fim

    # pega o numero armazenado na memoria
    lw   $a0, 0($s1)

    # imprime o numero
    addi $v0, $zero, 1
    syscall

    # imprime um espaco
    addi $v0, $zero, 4
    la   $a0, espaco
    syscall

    # proxima posicao do vetor
    addi $s1, $s1, 4

    # incrementa contador
    addi $s0, $s0, 1

    j imprimir

# entrada:  $a0 = n
# retorno:  $v0 = fibonacci(n)

fibonacci:

    # reserva 12 bytes na pilha
    addi $sp, $sp, -12

    # salva o endereco de retorno
    sw   $ra, 8($sp)

    # salva o valor de n
    sw   $a0, 4($sp)

    # caso base: fibonacci(0) = 0
    beq  $a0, $zero, fib_zero

    # caso base: fibonacci(1) = 1
    addi $t0, $zero, 1
    beq  $a0, $t0, fib_um


    # calcula fibonacci(n - 1)
    addi $a0, $a0, -1

    jal fibonacci

    # salva fibonacci(n - 1) na pilha
    sw   $v0, 0($sp)


    # recupera o n original
    lw   $a0, 4($sp)

    # calcula fibonacci(n - 2)
    addi $a0, $a0, -2

    jal fibonacci


    # recupera fibonacci(n - 1)
    lw   $t1, 0($sp)

    # fibonacci(n) =
    # fibonacci(n-1) + fibonacci(n-2)
    add  $v0, $t1, $v0

    j retorno_fibonacci


# fibonacci(0)
fib_zero:

    addi $v0, $zero, 0
    j retorno_fibonacci


# fibonacci(1)
fib_um:

    addi $v0, $zero, 1

retorno_fibonacci:

    # recupera endereco de retorno
    lw   $ra, 8($sp)

    # devolve os 12 bytes usados pela chamada
    addi $sp, $sp, 12

    # retorna para quem chamou a funcao
    jr $ra

fim:

    addi $v0, $zero, 10
    syscall