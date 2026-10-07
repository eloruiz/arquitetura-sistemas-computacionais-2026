library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Eloise dos Santos Ruiz - 24002341
--Pedro Henrique Coan Zin – 24026585
--Tiago Aureliano Lança Rodriguez – 25004196


entity ULA_tb is
end entity ULA_tb;

architecture teste of ULA_tb is

    --representam as entradas --
    signal A: std_logic_vector(15 downto 0);
    signal B: std_logic_vector(15 downto 0);
    signal ULACtl: std_logic_vector(2 downto 0);

    -- sinais que recebem as saidas da ula --
    signal R: std_logic_vector(15 downto 0);
    signal Zero: std_logic;
    signal Overflow: std_logic;
    signal Cout: std_logic;

begin

    UUT: entity work.ULA
    port map 
    (
        A => A,
        B => B,
        ULACtl => ULACtl,
        R => R,
        Zero => Zero,
        Overflow => Overflow,
        Cout => Cout
    );


    process
    begin

        -- TESTE 1: AND --
        A <= x"000F";
        B <= x"0003";
        ULACtl <= "000";
        wait for 10 ns;

        -- TESTE 2: OR --
        A <= x"000C";
        B <= x"0003";
        ULACtl <= "001";
        wait for 10 ns;

        -- TESTE 3: SOMA --
        A <= x"0002";
        B <= x"0003";
        ULACtl <= "010";
        wait for 10 ns;

        -- TESTE 4: SOMA COM CARRY-OUT E ZERO --
        A <= x"FFFF";
        B <= x"0001";
        ULACtl <= "010";
        wait for 10 ns;

        -- TESTE 5: SOMA COM OVERFLOW --
        A <= x"7FFF";
        B <= x"0001";
        ULACtl <= "010";
        wait for 10 ns;

        -- TESTE 6: SUBTRACAO --
        A <= x"0005";
        B <= x"0003";
        ULACtl <= "100";
        wait for 10 ns;

        -- TESTE 7: SUBTRACAO COM RESULTADO ZERO --
        A <= x"0005";
        B <= x"0005";
        ULACtl <= "100";
        wait for 10 ns;

        -- TESTE 8: SUBTRACAO COM OVERFLOW --
        A <= x"8000";
        B <= x"0001";
        ULACtl <= "100";
        wait for 10 ns;

        -- TESTE 9: SLT VERDADEIRO --
        A <= x"0003";
        B <= x"0005";
        ULACtl <= "110";
        wait for 10 ns;

        -- TESTE 10: SLT FALSO --
        A <= x"0005";
        B <= x"0003";
        ULACtl <= "110";
        wait for 10 ns;

        -- TESTE 11: SLT COM NUMERO NEGATIVO --
        A <= x"FFFF";
        B <= x"0001";
        ULACtl <= "110";
        wait for 10 ns;

        -- TESTE 12: NOR --
        A <= x"0000";
        B <= x"0000";
        ULACtl <= "111";
        wait for 10 ns;

        wait;

    end process;

end architecture teste;