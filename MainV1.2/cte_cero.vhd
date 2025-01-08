library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cte_cero is
    Port (
        CONST_OUT : out std_logic_vector(3 downto 0) -- Salida constante
    );
end cte_cero;

architecture Behavioral of cte_cero is
    -- Definición de la constante
    constant MY_CONSTANT : std_logic_vector(3 downto 0) := "0000";
begin
    -- Asignación directa de la constante a la salida
    CONST_OUT <= MY_CONSTANT;
end Behavioral;