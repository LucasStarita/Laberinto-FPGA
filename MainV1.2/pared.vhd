library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pared is
    Port (
        data_in  : in  STD_LOGIC_VECTOR(3 downto 0);  
        sel      : in  STD_LOGIC_VECTOR(3 downto 0);  
        data2_out : out  STD_LOGIC_VECTOR(63 downto 0); 
		  reset : in std_logic;
		  clk : in std_logic
    );
end pared;

architecture Behavioral of pared is
    signal data_out : std_logic_vector(63 downto 0); 
begin
    gen_flip_flops: for i in 0 to 63 generate
    begin
        process(clk, reset)  -- Usamos un único reloj global
        begin
            if reset = '1' then
                data2_out(i) <= '0';  -- Reset sincrónico o asincrónico
            elsif rising_edge(clk) then
                if data_out(i) = '1' then
                    data2_out(i) <= '1';  -- Flip-flop activado por enable
                end if;
            end if;
        end process;
    end generate;


	
	 process(data_in, sel)
    begin
        
		  -- Inicializar todas las salidas a '0000'
        data_out <= (others => '0');

        
        case sel is
            when "0000" => 
                data_out(3 downto 0) <= data_in;        -- Asigna a la primera salida
            when "0001" => 
                data_out(7 downto 4) <= data_in;        -- Asigna a la segunda salida
            when "0010" => 
                data_out(11 downto 8) <= data_in;       -- Asigna a la tercera salida
            when "0011" => 
                data_out(15 downto 12) <= data_in;      -- Asigna a la cuarta salida
            when "0100" => 
                data_out(19 downto 16) <= data_in;      -- Asigna a la quinta salida
            when "0101" => 
                data_out(23 downto 20) <= data_in;      -- Asigna a la sexta salida
            when "0110" => 
                data_out(27 downto 24) <= data_in;      -- Asigna a la séptima salida
            when "0111" => 
                data_out(31 downto 28) <= data_in;      -- Asigna a la octava salida
            when "1000" => 
                data_out(35 downto 32) <= data_in;      -- Asigna a la novena salida
            when "1001" => 
                data_out(39 downto 36) <= data_in;      -- Asigna a la décima salida
            when "1010" => 
                data_out(43 downto 40) <= data_in;      -- Asigna a la undécima salida
            when "1011" => 
                data_out(47 downto 44) <= data_in;      -- Asigna a la duodécima salida
            when "1100" => 
                data_out(51 downto 48) <= data_in;      -- Asigna a la decimotercera salida
            when "1101" => 
                data_out(55 downto 52) <= data_in;      -- Asigna a la decimocuarta salida
            when "1110" => 
                data_out(59 downto 56) <= data_in;      -- Asigna a la decimoquinta salida
            when "1111" => 
                data_out(63 downto 60) <= data_in;      -- Asigna a la decimosexta salida
            when others => 
                data_out <= (others => '0');            -- Seguridad adicional (no debería ocurrir)
        end case;
    end process;
end Behavioral;


 