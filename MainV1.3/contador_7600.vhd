library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador_7600 is
    Port (
        clk : in STD_LOGIC;                 -- Señal de reloj
        reset : in STD_LOGIC;               -- Señal de reset
        inicio_contador : in STD_LOGIC;     -- Señal de inicio del contador
        fin_contador : out STD_LOGIC        -- Señal de finalización del conteo
    );
end contador_7600;

architecture Behavioral of contador_7600 is
    signal count : INTEGER := 0;            -- Contador interno
    constant MAX_COUNT : INTEGER := 6000;   -- Valor máximo del contador
begin

    process(clk, reset)
    begin
        if reset = '1' then
            count <= 0;
            fin_contador <= '0';
        elsif rising_edge(clk) then
            if inicio_contador = '1' then
                if count < MAX_COUNT then
                    count <= count + 1;
                    fin_contador <= '0';
                else
                    fin_contador <= '1';
                end if;
            else
                count <= 0;
                fin_contador <= '0';
            end if;
        end if;
    end process;

end Behavioral;
