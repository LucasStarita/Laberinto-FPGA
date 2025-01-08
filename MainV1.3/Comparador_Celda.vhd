library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Comparador_Celda is
    port (
        arriba, der, abajo, izq : in std_logic_vector(3 downto 0); -- Entradas de 4 bits
        menor : out std_logic_vector(3 downto 0);                -- Valor mínimo
        pos : out std_logic_vector(1 downto 0)                  -- Posición del menor
    );
end Comparador_Celda;

architecture Behavioral of Comparador_Celda is
begin
    process(arriba, abajo, izq, der)
        variable min_value : unsigned(3 downto 0); -- Almacena el valor mínimo
        variable min_pos : std_logic_vector(1 downto 0); -- Almacena la posición del mínimo
    begin
        -- Inicializamos con el primer valor (arriba)
        min_value := unsigned(arriba);
        min_pos := "00";

        -- Comparamos con abajo
        if unsigned(abajo) < min_value then
            min_value := unsigned(abajo);
            min_pos := "10";
        end if;

        -- Comparamos con izquierda
        if unsigned(izq) < min_value then
            min_value := unsigned(izq);
            min_pos := "11";
        end if;

        -- Comparamos con derecha
        if unsigned(der) < min_value then
            min_value := unsigned(der);
            min_pos := "01";
        end if;

        -- Asignamos los valores finales
        menor <= std_logic_vector(min_value);
        pos <= min_pos;
    end process;
end Behavioral;
