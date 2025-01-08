library verilog;
use verilog.vl_types.all;
entity prueba_control_v2 is
    port(
        FW              : out    vl_logic;
        clk1            : in     vl_logic;
        reset2          : in     vl_logic;
        c_casilla       : in     vl_logic;
        hay_pared       : in     vl_logic;
        fin_giro        : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        dir_min         : in     vl_logic_vector(1 downto 0);
        orientacion     : in     vl_logic_vector(1 downto 0);
        girar           : out    vl_logic;
        izq_der         : out    vl_logic
    );
end prueba_control_v2;
