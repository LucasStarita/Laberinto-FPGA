library verilog;
use verilog.vl_types.all;
entity prueba_control_vlg_check_tst is
    port(
        FW              : in     vl_logic;
        girar           : in     vl_logic;
        izq_der         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end prueba_control_vlg_check_tst;
