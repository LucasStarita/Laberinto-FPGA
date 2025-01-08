library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_16x1_2bit is
    Port (
        sel : in std_logic_vector(3 downto 0); -- Bus de selección (4 bits)
        data_in : in std_logic_vector(31 downto 0); -- Entradas (16 x 2 bits = 32 bits)
        data_out : out std_logic_vector(1 downto 0) -- Salida (2 bits)
    );
end mux_16x1_2bit;

architecture Behavioral of mux_16x1_2bit is
begin
    process(sel, data_in)
    begin
        case sel is
            when "0000" => data_out <= data_in(1 downto 0);   -- Entrada 0
            when "0001" => data_out <= data_in(3 downto 2);   -- Entrada 1
            when "0010" => data_out <= data_in(5 downto 4);   -- Entrada 2
            when "0011" => data_out <= data_in(7 downto 6);   -- Entrada 3
            when "0100" => data_out <= data_in(9 downto 8);   -- Entrada 4
            when "0101" => data_out <= data_in(11 downto 10); -- Entrada 5
            when "0110" => data_out <= data_in(13 downto 12); -- Entrada 6
            when "0111" => data_out <= data_in(15 downto 14); -- Entrada 7
            when "1000" => data_out <= data_in(17 downto 16); -- Entrada 8
            when "1001" => data_out <= data_in(19 downto 18); -- Entrada 9
            when "1010" => data_out <= data_in(21 downto 20); -- Entrada 10
            when "1011" => data_out <= data_in(23 downto 22); -- Entrada 11
            when "1100" => data_out <= data_in(25 downto 24); -- Entrada 12
            when "1101" => data_out <= data_in(27 downto 26); -- Entrada 13
            when "1110" => data_out <= data_in(29 downto 28); -- Entrada 14
            when "1111" => data_out <= data_in(31 downto 30); -- Entrada 15
            when others => data_out <= (others => '0');       -- Seguridad adicional
        end case;
    end process;
end Behavioral;
