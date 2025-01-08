library ieee;
use ieee.std_logic_1164.all;

entity prioridad_giro is
    port (
        clk        : in  std_logic;
        reset      : in  std_logic;
        orientacion: in  std_logic_vector(1 downto 0);
        dir_min    : in  std_logic_vector(1 downto 0);
        p_izq_der     : out std_logic -- 0 = p_derecha, 1 = p_izquierda
    );
end prioridad_giro;

architecture Behavioral of prioridad_giro is

    -- Declaración del tipo de estados
    type state_type is (p_derecha, p_izquierda);
    signal current_state, next_state : state_type;

    -- Función para determinar transición de p_derecha a p_izquierda
    FUNCTION cond_p_derecha_a_p_izquierda(
        orientacion : std_logic_vector(1 downto 0); 
        dir_min     : std_logic_vector(1 downto 0)
    ) RETURN BOOLEAN IS
    BEGIN
        RETURN ((orientacion = "11" AND dir_min = "01") OR 
                (orientacion = "01" AND dir_min = "11") OR 
                (orientacion = "10" AND dir_min = "00") OR 
                (orientacion = "00" AND dir_min = "10") OR 
                (orientacion = "00" AND dir_min = "11") OR 
                (orientacion = "01" AND dir_min = "00") OR 
                (orientacion = "10" AND dir_min = "01") OR 
                (orientacion = "11" AND dir_min = "10"));
    END FUNCTION;

    -- Función para determinar transición de p_izquierda a p_derecha
    FUNCTION cond_p_izquierda_a_p_derecha(
        orientacion : std_logic_vector(1 downto 0); 
        dir_min     : std_logic_vector(1 downto 0)
    ) RETURN BOOLEAN IS
    BEGIN
        RETURN ((orientacion = "11" AND dir_min = "11") OR 
                (orientacion = "10" AND dir_min = "10") OR 
                (orientacion = "01" AND dir_min = "01") OR 
                (orientacion = "00" AND dir_min = "00") OR 
                (orientacion = "00" AND dir_min = "01") OR 
                (orientacion = "01" AND dir_min = "10") OR 
                (orientacion = "10" AND dir_min = "11") OR 
                (orientacion = "11" AND dir_min = "00"));
    END FUNCTION;

begin

    -- Proceso de transición de estados
    process (clk, reset)
    begin
        if reset = '1' then
            current_state <= p_derecha;  -- Estado inicial por defecto
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- Proceso de lógica de transición
    process (current_state, orientacion, dir_min)
    begin
        case current_state is
            when p_derecha =>
                if cond_p_derecha_a_p_izquierda(orientacion, dir_min) then
                    next_state <= p_izquierda;
                else
                    next_state <= p_derecha;  -- Se mantiene en el estado
                end if;

            when p_izquierda =>
                if cond_p_izquierda_a_p_derecha(orientacion, dir_min) then
                    next_state <= p_derecha;
                else
                    next_state <= p_izquierda;  -- Se mantiene en el estado
                end if;

            when others =>
                next_state <= p_derecha;  -- Estado por defecto en caso de error
        end case;
    end process;

    -- Proceso de salida
    process (current_state)
    begin
        case current_state is
            when p_derecha =>
                p_izq_der <= '1';  -- Estado p_derecha
            when p_izquierda =>
                p_izq_der <= '0';  -- Estado p_izquierda
            when others =>
                p_izq_der <= '0';  -- Salida por defecto
        end case;
    end process;

end Behavioral;

