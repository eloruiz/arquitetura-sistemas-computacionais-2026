# Laboratório 03 - Recursividade em MIPS

Laboratório desenvolvido em Assembly MIPS com foco no uso de funções recursivas, pilha e manipulação de memória.

## Fatorial Recursivo

Programa que recebe um número inteiro e calcula seu fatorial utilizando recursividade.

Durante as chamadas recursivas, a pilha é utilizada para armazenar o endereço de retorno e os dados necessários para o cálculo.

## Fibonacci Recursivo

Programa que calcula os 12 primeiros elementos da sequência de Fibonacci utilizando recursividade.

Os resultados são armazenados em memória e posteriormente percorridos para impressão.

## Conceitos utilizados

- Recursividade
- Pilha
- Registradores `$sp` e `$ra`
- Chamada de funções com `jal`
- Retorno com `jr`
- Manipulação de memória
- Syscalls

## Arquivos

- `fatorial.asm` - cálculo recursivo do fatorial
- `fib.asm` - cálculo recursivo da sequência de Fibonacci
