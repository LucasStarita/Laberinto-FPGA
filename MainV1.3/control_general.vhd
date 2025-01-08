library ieee;
use ieee.std_logic_1164.all;

entity control_general is
    port(
        clk           : in  std_logic;
        reset         : in  std_logic;
        dir_correcta  : in  std_logic;
        prioridad_izq : in  std_logic;
        fin_giro      : in  std_logic;
        pared_delante : in  std_logic;
        fin_contador  : in  std_logic;
        c_casilla     : in  std_logic;
        FW            : out std_logic;
        giro          : out std_logic;
        izq_der       : out std_logic;
        pulso_check   : out std_logic;
        ini_contador  : out std_logic
    );
end entity;

architecture rtl of control_general is

    -- Define the states
    type state_type is (check, forward, giro_izq, giro_der, delay_postgiro, delay_giro1, delay_giro2, delay_fw);
    signal state : state_type;

begin

    -- State transition logic
    process (clk, reset)
    begin
        if reset = '1' then
            state <= check;
        elsif rising_edge(clk) then
            case state is
				
				
				
				
                when check =>
                    if dir_correcta = '0' then
                        
                            state <= delay_giro1;
                        elsif dir_correcta = '1' then
                            state <= forward;
          
                    else
                        state <= check;
							end if;
											

					


						  
						  
						  
                when forward =>
                    if pared_delante = '1' then
                        state <= check;
							elsif (dir_correcta = '1' and pared_delante= '0') then
                            state <= forward;
							elsif (c_casilla = '1') then
                            state <= delay_fw;
				
                    else
                        state <= forward;
                    end if;
						  
						  
						  
						  
						  
						  
						  
						  
                when giro_izq =>
                    if fin_giro = '0' then
                        state <= giro_izq;
							elsif (fin_giro='1') then
                            state <= delay_postgiro;
			
                    else
                        state <= giro_izq;
								
								
                    end if;
						  
						  
						  
						  
						  
                when giro_der =>
                    if fin_giro = '0' then
                        state <= giro_der;
							elsif (fin_giro='1') then
                            state <= delay_postgiro;
			
                    else
                        state <= giro_der;
                    end if;
						  
						  
						  
						  
						  
						  
						  
						  
						  
                when delay_postgiro =>
                    
                        state <= check;
								
					when delay_giro1 =>
                    
                        state <= delay_giro2;
                 
											  
						
                when delay_giro2 =>
                    if prioridad_izq = '1' then
                        state <= giro_izq;
							elsif (prioridad_izq='0') then
                            state <= giro_der;
					
                    else
                        state <= delay_giro2;
                    end if;
						  
						  
						  
						  
						  
						  
						  
						  
                when delay_fw =>
                    if fin_contador = '1' then
                        state <= check;
							elsif (fin_contador='0') then
                            state <= delay_fw;
			
                    else
                        state <= delay_fw;
                    end if;
            end case;
        end if;
    end process;

    -- Output logic based on the current state
    process (state)
    begin
        -- Default outputs
        FW           <= '0';
        giro         <= '0';
        izq_der      <= '0';
        pulso_check  <= '0';
        ini_contador <= '0';

        case state is
            when check =>
        FW           <= '0';
        giro         <= '0';
        izq_der      <= '0';
        pulso_check  <= '1';
        ini_contador <= '0';
            when forward =>
        FW           <= '1';
        giro         <= '0';
        izq_der      <= '0';
        pulso_check  <= '0';
        ini_contador <= '0';
            when giro_izq =>
        FW           <= '0';
        giro         <= '1';
        izq_der      <= '1';
        pulso_check  <= '0';
        ini_contador <= '0';
            when giro_der =>
        FW           <= '0';
        giro         <= '1';
        izq_der      <= '0';
        pulso_check  <= '0';
        ini_contador <= '0';
            when delay_postgiro =>
        FW           <= '0';
        giro         <= '0';
        izq_der      <= '0';
        pulso_check  <= '0';
        ini_contador <= '0';
            when delay_giro1 =>
        FW           <= '0';
        giro         <= '0';
        izq_der      <= '0';
        pulso_check  <= '0';
        ini_contador <= '0';
            when delay_giro2 =>
        FW           <= '0';
        giro         <= '0';
        izq_der      <= '0';
        pulso_check  <= '0';
        ini_contador <= '0';
            when delay_fw =>
        FW           <= '1';
        giro         <= '0';
        izq_der      <= '0';
        pulso_check  <= '0';
        ini_contador <= '1';

            when others =>
                null;
        end case;
    end process;

end rtl;

