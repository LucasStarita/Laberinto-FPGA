library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity sumador_completo is
 Port (
 a : in STD_LOGIC;
b : in STD_LOGIC;
c_in : in STD_LOGIC;
suma : out STD_LOGIC;
c_out : out STD_LOGIC
 );
end sumador_completo;
architecture Behavioral of sumador_completo is
begin
 suma <= a XOR b XOR c_in;
c_out <= (a AND b) OR (c_in AND (a XOR b));
end Behavioral;