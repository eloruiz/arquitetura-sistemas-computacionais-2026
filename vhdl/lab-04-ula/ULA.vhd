library ieee; -- biblioteca padrão ieee --
use ieee.std_logic_1164.all; -- std_logic, operações lógicas e vetores --
use ieee.numeric_std.all; -- operações numéricas

--Eloise dos Santos Ruiz - 24002341
--Pedro Henrique Coan Zin – 24026585
--Tiago Aureliano Lança Rodriguez – 25004196



entity ULA is
    port (
        A: in  std_logic_vector(15 downto 0);
        B: in  std_logic_vector(15 downto 0);
        ULACtl: in  std_logic_vector(2 downto 0);
        R: out std_logic_vector(15 downto 0);
        Zero: out std_logic;
        Overflow: out std_logic;
        Cout: out std_logic
    );
end entity ULA;

architecture comportamental of ULA is

    signal soma: unsigned(16 downto 0); -- aqui o resultado da soma com 17 bits para o carry ser guardado --
    signal sub: unsigned(16 downto 0); -- resultado da sub com 17 bits --
    signal resultado_soma: std_logic_vector(15 downto 0); -- resultado de 16 bits da soma --
    signal resultado_sub: std_logic_vector(15 downto 0); -- resultado de 16 bits da sub --
    signal resultado_slt: std_logic_vector(15 downto 0); -- resultado da operação slt --
    signal resultado: std_logic_vector(15 downto 0); -- resultado final escolhido pela ulaclt --

begin

    soma <= unsigned('0' & A) + unsigned('0' & B); -- a soma de A e B usando os 17 bits para preservar o carry --

    resultado_soma <= std_logic_vector(soma(15 downto 0)); -- pega os 16 bits do resultado da soma--

    sub <= unsigned('0' & A) + unsigned('0' & (not B)) + 1; -- sub A e B usando complemento de 2 --

    resultado_sub <= std_logic_vector(sub(15 downto 0)); -- usar os 16 bits do resultado da sub --

    resultado_slt <= x"0001" when signed(A) < signed(B)
                     else x"0000"; --retorna 1 se A < B, se nn vai retornar 0 --

    with ULACtl select -- aqui vai selecionar qual a operação que vai ser enviada para o resultado --
        resultado <=
            A and B when "000", -- and --
            A or B when "001", -- or --
            resultado_soma when "010", -- soma --
            resultado_sub when "100", -- sub --
            resultado_slt when "110", -- slt --
            not (A or B) when "111", -- nor --
            (others => '0') when others; -- usa 0 para os codigos nao utilizados --

    R <= resultado;

    Zero <= '1' when resultado = x"0000"
            else '0'; -- ativa o 0 quando o resultado for = 0 --

    Cout <= soma(16) when ULACtl = "010" else
            sub(16)  when ULACtl = "100" else
            '0'; -- usa o bit extra da soma ou sub como carry out --

    Overflow <=
        ((not (A(15) xor B(15))) and
        (A(15) xor resultado(15)))
        when ULACtl = "010" else -- overflow na soma --

        ((A(15) xor B(15)) and
        (A(15) xor resultado(15)))
        when ULACtl = "100" else -- overflow na sub --

        '0';

end architecture comportamental;