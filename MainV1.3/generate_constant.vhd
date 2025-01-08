library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generate_constant is
    Port (
        CONST_OUT : out std_logic_vector(3 downto 0) -- Salida constante
    );
end generate_constant;

architecture Behavioral of generate_constant is
    -- Definición de la constante
    constant MY_CONSTANT : std_logic_vector(3 downto 0) := "1111";
begin
    -- Asignación directa de la constante a la salida
    CONST_OUT <= MY_CONSTANT;
end Behavioral;
