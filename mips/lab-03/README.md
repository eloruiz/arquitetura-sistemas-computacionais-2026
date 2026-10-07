# Laboratório 03 - Recursividade em MIPS

Laboratório desenvolvido em Assembly MIPS com foco no uso de recursividade, pilha e manipulação de memória.

## Fatorial Recursivo

Programa que lê um número inteiro informado pelo usuário e calcula seu fatorial utilizando uma função recursiva.

Durante as chamadas recursivas, a pilha é utilizada para armazenar o endereço de retorno e os valores necessários para o cálculo.

## Fibonacci Recursivo

Programa que calcula os 12 primeiros elementos da sequência de Fibonacci utilizando recursividade.

Os valores calculados são armazenados em memória e, após o cálculo da sequência, são percorridos e impressos na tela.

## Conceitos utilizados

- Funções recursivas
- Pilha
- Registrador `$sp`
- Registrador `$ra`
- Chamada de função com `jal`
- Retorno de função com `jr`
- Armazenamento e leitura da memória
- Syscalls
