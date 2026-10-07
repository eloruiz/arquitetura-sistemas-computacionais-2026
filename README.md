# Arquitetura de Sistemas Computacionais

Repositório destinado às atividades práticas desenvolvidas na disciplina de **Arquitetura de Sistemas Computacionais**, durante o curso de Engenharia da Computação.

Ao longo dos laboratórios foram trabalhados conceitos de programação em Assembly MIPS, recursividade, pilha, organização de memória, descrição de hardware em VHDL, simulação e implementação em FPGA.

## Laboratórios

### MIPS Assembly

#### Lab 01 - Eco
Primeiro programa em Assembly MIPS, responsável por realizar a leitura de um número inteiro e imprimir o mesmo valor.

#### Lab 02 - Adivinhar Número
Programa que recebe um número entre 0 e 100 e solicita novos valores até que o número inicial seja informado novamente.

#### Lab 03 - Recursividade
Implementação de algoritmos utilizando recursividade e pilha:
- Fatorial recursivo
- Fibonacci recursivo

### VHDL

#### Lab 04 - ULA de 16 bits
Implementação e validação de uma Unidade Lógica e Aritmética de 16 bits em VHDL.

A ULA implementa as operações:
- AND
- OR
- Soma
- Subtração
- SLT (Set Less Than)
- NOR

O projeto também inclui testbench para validação por simulação e implementação física na placa DE2-115.

## Tecnologias e ferramentas

- Assembly MIPS
- VHDL
- Quartus
- ModelSim
- FPGA DE2-115

## Estrutura do repositório

```text
mips/
├── lab-01/
├── lab-02/
└── lab-03/

vhdl/
└── lab-04-ula/
