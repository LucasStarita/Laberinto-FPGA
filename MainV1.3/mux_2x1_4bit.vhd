library ieee;
use ieee.std_logic_1164.all;

entity mux_2x1_4bit is
    port (
        sel : in std_logic;          -- Señal de selección (1 bit)
        d0, d1 : in std_logic_vector(3 downto 0); -- Entradas de datos (4 bits cada una)
        y : out std_logic_vector(3 downto 0)     -- Salida del MUX (4 bits)
    );
end mux_2x1_4bit;

architecture Behavioral of mux_2x1_4bit is
begin
    process(sel, d0, d1)
    begin
        if sel = '0' then
            y <= d0; -- Si sel es 0, el bus de salida toma el valor de d0
        else
            y <= d1; -- Si sel es 1, el bus de salida toma el valor de d1
        end if;
    end process;
end Behavioral;

