library verilog;
use verilog.vl_types.all;
entity prueba_posicionamiento_vlg_sample_tst is
    port(
        cambio          : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end prueba_posicionamiento_vlg_sample_tst;
