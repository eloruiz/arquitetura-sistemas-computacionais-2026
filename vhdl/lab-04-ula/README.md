# Laboratório 04 - ULA de 16 bits

Implementação e validação de uma Unidade Lógica e Aritmética (ULA) de 16 bits utilizando VHDL.

O laboratório envolveu a implementação da ULA, a validação por simulação através de um testbench e testes físicos utilizando a placa DE2-115.

## Operações implementadas

- AND
- OR
- Soma
- Subtração
- SLT (Set Less Than)
- NOR

## Flags

A ULA possui três flags de saída:

- `Zero` - indica quando o resultado da operação é zero
- `Overflow` - indica overflow em operações aritméticas
- `Cout` - indica o carry de saída

## Arquivos

- `ULA.vhd` - implementação da ULA de 16 bits
- `ULA_tb.vhd` - testbench utilizado para simulação
- `ula_board.vhd` - interface da ULA com a placa DE2-115
- `relatorios/` - relatórios dos testes realizados

## Testes

### Simulação

O testbench aplica diferentes valores às entradas da ULA e verifica o resultado das operações e das flags de saída.

### Placa DE2-115

A ULA também foi testada fisicamente na placa DE2-115 utilizando switches para entrada dos operandos e seleção da operação, LEDs para indicação das flags e displays de sete segmentos para exibição do resultado.
