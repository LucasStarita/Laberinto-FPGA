library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador_6bits is
    Port (
        clk     : in  std_logic;        -- Señal de reloj
        reset   : in  std_logic;        -- Señal de reset (sincrónica)
        salida  : out std_logic_vector(5 downto 0) -- Salida del contador en 6 bits
    );
end contador_6bits;

architecture Behavioral of contador_6bits is
    signal contador : std_logic_vector(5 downto 0) := (others => '0'); -- Contador interno
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                -- Reset del contador
                contador <= "000000";
            else
                if contador = "11111" then
                    -- Reinicia el contador al alcanzar 31
                    contador <= (others => '0');
                else
                    -- Incrementa el contador
                    contador <= contador + 1;
                end if;
            end if;
        end if;
    end process;

    -- Asignar el valor del contador a la salida
    salida <= contador;

end Behavioral;
