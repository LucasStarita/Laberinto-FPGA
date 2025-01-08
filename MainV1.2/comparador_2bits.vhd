library ieee;
use ieee.std_logic_1164.all;

entity comparador_2bits is
    port (
        A     : in  std_logic_vector(1 downto 0);  -- Entrada A de 2 bits
        B     : in  std_logic_vector(1 downto 0);  -- Entrada B de 2 bits
        igual : out std_logic                     -- Señal de salida: 1 si A = B
    );
end comparador_2bits;

architecture Behavioral of comparador_2bits is
begin
    process (A, B)
    begin
        if A = B then
            igual <= '1';  -- Activa la señal si A es igual a B
        else
            igual <= '0';  -- De lo contrario, la desactiva
        end if;
    end process;
end Behavioral;
