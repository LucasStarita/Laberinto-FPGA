library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Usamos numeric_std para manejar aritmética con signed/unsigned

entity prioridad is
    Port ( orientacion  : in  STD_LOGIC_VECTOR(1 downto 0);  -- Entrada orientacion (4 bits)
           dir_min      : in  STD_LOGIC_VECTOR(1 downto 0);  -- Entrada dir_min (4 bits)
           prioridad_izq : out STD_LOGIC);                     -- Salida prioridad_izq (1 bit)
end prioridad;

architecture Behavioral of prioridad is
    signal result : integer;  -- Variable para almacenar el resultado de la resta
begin
    process(orientacion, dir_min)
    begin
        -- Convertir las señales de 4 bits en complemento a 2 a enteros con signo
        result <= to_integer(signed(orientacion)) - to_integer(signed(dir_min));
        
        -- Evaluar el valor de result y asignar prioridad_izq
        case result is
            when -1 | 0 | 3 | -2 | 2   =>
                prioridad_izq <= '0';  -- Asigna prioridad_izq = 0
            when -3 | 1 =>
                prioridad_izq <= '1';  -- Asigna prioridad_izq = 1
            when others =>
                prioridad_izq <= '0';  -- Por defecto, asigna prioridad_izq = 0
        end case;
    end process;
end Behavioral;
