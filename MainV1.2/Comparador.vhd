library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparador is
    Port ( 
        CHI 		: in  STD_LOGIC_VECTOR (11 downto 0);  -- Distancia en el lado izquierdo
        CHD   		: in  STD_LOGIC_VECTOR (11 downto 0);  -- Distancia en el lado derecho
        --Umbral		: in  STD_LOGIC_VECTOR (11 downto 0);  -- Valor umbral de comparación
		  I	: out STD_LOGIC;
		  D   : out STD_LOGIC
    );
end comparador;

architecture Behavioral of comparador is
	
	constant Umbral_I : std_LOGIC_VECTOR(11 downto 0) := "000100011000"; -- 280 000100011000
	constant Umbral_D : std_LOGIC_VECTOR(11 downto 0) := "000101011110"; -- 350 000101011110

begin
    process(CHI, CHD)
    begin
		if((CHI > Umbral_I) and (CHD > Umbral_D)) then
			I <= '0'; -- El auto va centrado.
			D <= '0';
		elsif((CHI > Umbral_I) and (CHD < Umbral_D)) then
			 -- El auto se acerca a la pared derecha.
			I <= '0';
			D <= '1';
					elsif((CHI < Umbral_I) and (CHD > Umbral_D)) then
			I <= '1';
			D <= '0';
		else
			I <= '1';
			D <= '1';
		end if;
	end process;
end Behavioral;

