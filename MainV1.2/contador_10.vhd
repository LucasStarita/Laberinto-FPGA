library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador_10 is
    Port (
        clk             : in  std_logic;        -- Señal de reloj
        reset           : in  std_logic;        -- Señal de reset (sincrónica)
        inicio_contador : in  std_logic;        -- Señal para iniciar el contador
        fin_contador    : out std_logic         -- Señal que indica el final de la cuenta
    );
end contador_10;

architecture Behavioral of contador_10 is
    signal contador : integer range 0 to 10 := 0; -- Contador interno
    signal contando : std_logic := '0';          -- Bandera de conteo
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                -- Reset de contador y señales
                contador <= 0;
                contando <= '0';
                fin_contador <= '0';
            elsif contando = '0' and inicio_contador = '1' then
                -- Inicia el conteo
                contando <= '1';
                contador <= 1;
                fin_contador <= '0';
            elsif contando = '1' then
                if contador < 10 then
                    -- Incrementa el contador
                    contador <= contador + 1;
                else
                    -- Fin del conteo
                    contando <= '0';
                    fin_contador <= '1';
                end if;
            else
                -- Fin_contador se mantiene en '0' cuando no está contando
                fin_contador <= '0';
            end if;
        end if;
    end process;

end Behavioral;
