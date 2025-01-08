library verilog;
use verilog.vl_types.all;
entity prueba_control_vlg_sample_tst is
    port(
        c_casilla       : in     vl_logic;
        clock           : in     vl_logic;
        dir_min         : in     vl_logic_vector(0 to 1);
        fin_giro        : in     vl_logic;
        orientacion     : in     vl_logic_vector(0 to 1);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end prueba_control_vlg_sample_tst;
