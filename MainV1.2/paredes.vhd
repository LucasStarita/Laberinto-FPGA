library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity paredes is
    Port (
        S : in std_logic;                        -- Señal S
        O_1 : in std_logic;                      -- Señal O_1
        O_0 : in std_logic;                      -- Señal O_0
        P : out std_logic_vector(3 downto 0)     -- Salida P
    );
end paredes;

architecture behavioral of paredes is
begin
    -- Asignaciones a las salidas del vector P
    P(0) <= S and (not O_1) and (not O_0);  -- Lógica para P(0)
    P(1) <= S and (not O_1) and O_0;        -- Lógica para P(1)
    P(2) <= S and O_1 and (not O_0);        -- Lógica para P(2)
    P(3) <= S and O_1 and O_0;              -- Lógica para P(3)
end behavioral;
