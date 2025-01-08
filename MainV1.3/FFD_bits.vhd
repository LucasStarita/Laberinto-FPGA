library ieee;
use ieee.std_logic_1164.all;

entity FFD_4bits is
    port (
        clk   : in std_logic;                   -- Señal de reloj
        reset : in std_logic;                   -- Señal de reset asíncrono
        D     : in std_logic_vector(3 downto 0); -- Entrada del bus de datos
        Q     : out std_logic_vector(3 downto 0) -- Salida del bus de datos
    );
end FFD_4bits;

architecture Behavioral of FFD_4bits is
begin
    process(clk, reset)
    begin
        if reset = '1' then                     -- Reset asíncrono
            Q <= (others => '0');              -- Inicializa Q a 0
        elsif rising_edge(clk) then            -- En el flanco de subida del reloj
            Q <= D;                            -- Captura el valor de D
        end if;
    end process;
end Behavioral;
