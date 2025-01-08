library verilog;
use verilog.vl_types.all;
entity prueba_giro_vlg_sample_tst is
    port(
        cambio          : in     vl_logic;
        clk             : in     vl_logic;
        Giro            : in     vl_logic;
        IZQ_DER         : in     vl_logic;
        pared_delante   : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end prueba_giro_vlg_sample_tst;
