library ieee;
use ieee.std_logic_1164.all;

entity sumador_4bits is
    port (
        A, B : in std_logic_vector(3 downto 0); -- Entradas de 4 bits
        Cin : in std_logic;                    -- Acarreo de entrada
        S : out std_logic_vector(3 downto 0);  -- Salida de la suma (4 bits)
        Cout : out std_logic                   -- Acarreo de salida
    );
end sumador_4bits;

architecture Behavioral of sumador_4bits is
    signal C : std_logic_vector(4 downto 0); -- Señales internas para acarreos
begin
    -- El acarreo inicial (entrada externa)
    C(0) <= Cin;

    -- Sumadores completos para cada bit
    gen_sumadores: for i in 0 to 3 generate
        process(A(i), B(i), C(i))
        begin
            S(i) <= A(i) xor B(i) xor C(i);        -- Suma de bits
            C(i + 1) <= (A(i) and B(i)) or         -- Generación de acarreo
                        (A(i) and C(i)) or
                        (B(i) and C(i));
        end process;
    end generate;

    -- El acarreo de salida final
    Cout <= C(4);
end Behavioral;
