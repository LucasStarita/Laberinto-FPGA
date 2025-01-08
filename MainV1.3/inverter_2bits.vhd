library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inverter_2bits is
    Port ( input_bits : in STD_LOGIC_VECTOR(1 downto 0);  -- Entradas: 2 bits
           output_bits : out STD_LOGIC_VECTOR(1 downto 0)  -- Salidas: 2 bits invertidos
           );
end inverter_2bits;

architecture Behavioral of inverter_2bits is
begin
    -- El proceso para invertir los bits de la señal de entrada
    process(input_bits)
    begin
        output_bits(0) <= input_bits(1);  -- El bit 1 de entrada pasa al bit 0 de salida
        output_bits(1) <= input_bits(0);  -- El bit 0 de entrada pasa al bit 1 de salida
    end process;

end Behavioral;
