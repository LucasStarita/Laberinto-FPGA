library verilog;
use verilog.vl_types.all;
entity prueba_control is
    port(
        FW              : out    vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        c_casilla       : in     vl_logic;
        fin_giro        : in     vl_logic;
        dir_min         : in     vl_logic_vector(0 to 1);
        orientacion     : in     vl_logic_vector(0 to 1);
        girar           : out    vl_logic;
        izq_der         : out    vl_logic
    );
end prueba_control;
