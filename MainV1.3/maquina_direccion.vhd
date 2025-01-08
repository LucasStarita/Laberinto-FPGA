library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity maquina_direccion is
    Port (
        clk        : in  std_logic;
        reset      : in  std_logic;
        dir_min    : in  std_logic_vector(1 downto 0); -- Dirección mínima [1:0]
        orientacion: in  std_logic_vector(1 downto 0); -- Orientación actual [1:0]
        accion     : out std_logic_vector(1 downto 0)  -- Acción: 00 = Derecho, 01 = Derecha, 11 = Izquierda
    );
end maquina_direccion;

architecture Behavioral of maquina_direccion is
    signal estado_actual, estado_siguiente : std_logic_vector(1 downto 0);
begin

    -- Proceso de transición de estados
    process(clk, reset)
    begin
        if reset = '1' then
            estado_actual <= "00"; -- Estado inicial
        elsif rising_edge(clk) then
            estado_actual <= estado_siguiente;
        end if;
    end process;

    -- Lógica combinacional para determinar la acción
    process(estado_actual, dir_min, orientacion)
    begin
        case orientacion is
            when "00" => -- Norte
                if dir_min = "00" then
                    estado_siguiente <= "00"; -- Derecho
                elsif dir_min = "01" then
                    estado_siguiente <= "01"; -- Derecha
                elsif dir_min = "11" then
                    estado_siguiente <= "11"; -- Izquierda
                else
                    estado_siguiente <= "01"; -- Giro 180 (hacia derecha)
                end if;
            when "01" => -- Este
                if dir_min = "01" then
                    estado_siguiente <= "00"; -- Derecho
                elsif dir_min = "10" then
                    estado_siguiente <= "01"; -- Derecha
                elsif dir_min = "00" then
                    estado_siguiente <= "11"; -- Izquierda
                else
                    estado_siguiente <= "01"; -- Giro 180 (hacia derecha)
                end if;
            when "10" => -- Sur
                if dir_min = "10" then
                    estado_siguiente <= "00"; -- Derecho
                elsif dir_min = "11" then
                    estado_siguiente <= "01"; -- Derecha
                elsif dir_min = "01" then
                    estado_siguiente <= "11"; -- Izquierda
                else
                    estado_siguiente <= "01"; -- Giro 180 (hacia derecha)
                end if;
            when others => -- Oeste ("11")
                if dir_min = "11" then
                    estado_siguiente <= "00"; -- Derecho
                elsif dir_min = "00" then
                    estado_siguiente <= "01"; -- Derecha
                elsif dir_min = "10" then
                    estado_siguiente <= "11"; -- Izquierda
                else
                    estado_siguiente <= "01"; -- Giro 180 (hacia derecha)
                end if;
        end case;
    end process;

    -- Asignación de salida
    accion <= estado_siguiente;

end Behavioral;
