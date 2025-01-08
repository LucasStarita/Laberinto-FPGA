library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity maquina_control is
    Port (
        clk        : in  std_logic;
        reset      : in  std_logic;
        accion     : in  std_logic_vector(1 downto 0); -- Entrada para determinar acción
        c_casilla  : in  std_logic;                    -- Señal que indica si se llegó a la casilla
        hay_pared  : in  std_logic;                    -- Señal que indica si hay pared
        fin_giro   : in  std_logic;                    -- Señal que indica fin de giro
        avanzar    : out std_logic;                    -- Salida: avanzar hacia adelante (antes fw)
        girar      : out std_logic;                    -- Salida: realizar giro
        izq_der    : out std_logic                     -- Salida: 0 para izq, 1 para der
    );
end maquina_control;

architecture Behavioral of maquina_control is

    -- Declaración de los estados
    type estado_type is (check, fw, giro_izq, giro_der);
    signal estado_actual, estado_siguiente : estado_type;

begin

    -- Proceso de transición de estados
    process(clk, reset)
    begin
        if reset = '1' then
            estado_actual <= check; -- Estado inicial
        elsif rising_edge(clk) then
            estado_actual <= estado_siguiente;
        end if;
    end process;

    -- Lógica de siguiente estado
    process(estado_actual, accion, c_casilla, hay_pared, fin_giro)
    begin
        case estado_actual is
            when check =>
                case accion is
                    when "00" => estado_siguiente <= fw;         -- Avanzar
                    when "01" => estado_siguiente <= giro_der;   -- Girar a la derecha
                    when "11" => estado_siguiente <= giro_izq;   -- Girar a la izquierda
                    when others => estado_siguiente <= check;    -- Por defecto, quedarse en check
                end case;

            when fw =>
                if c_casilla = '1' or hay_pared = '1' then
                    estado_siguiente <= check; -- Volver a check si se alcanza una casilla o hay pared
                else
                    estado_siguiente <= fw; -- Permanecer avanzando
                end if;

            when giro_izq =>
                if fin_giro = '1' then
                    estado_siguiente <= check; -- Terminar giro y volver a check
                else
                    estado_siguiente <= giro_izq; -- Continuar girando
                end if;

            when giro_der =>
                if fin_giro = '1' then
                    estado_siguiente <= check; -- Terminar giro y volver a check
                else
                    estado_siguiente <= giro_der; -- Continuar girando
                end if;

            when others =>
                estado_siguiente <= check; -- Estado por defecto
        end case;
    end process;

    -- Lógica de salidas
    process(estado_actual)
    begin
        case estado_actual is
            when check =>
                avanzar  <= '0';
                girar    <= '0';
                izq_der  <= '0';

            when fw =>
                avanzar  <= '1'; -- Avanzar hacia adelante
                girar    <= '0';
                izq_der  <= '0';

            when giro_izq =>
                avanzar  <= '0';
                girar    <= '1'; -- Activar giro
                izq_der  <= '0'; -- Giro a la izquierda

            when giro_der =>
                avanzar  <= '0';
                girar    <= '1'; -- Activar giro
                izq_der  <= '1'; -- Giro a la derecha

            when others =>
                avanzar  <= '0';
                girar    <= '0';
                izq_der  <= '0';
        end case;
    end process;

end Behavioral;
