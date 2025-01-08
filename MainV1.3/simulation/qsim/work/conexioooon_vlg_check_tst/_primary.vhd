library verilog;
use verilog.vl_types.all;
entity conexioooon_vlg_check_tst is
    port(
        FW              : in     vl_logic;
        giro            : in     vl_logic;
        izq_der         : in     vl_logic;
        prioridad       : in     vl_logic;
        pulso_check     : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end conexioooon_vlg_check_tst;
