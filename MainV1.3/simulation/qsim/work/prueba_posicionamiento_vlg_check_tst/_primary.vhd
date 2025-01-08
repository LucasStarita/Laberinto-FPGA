library verilog;
use verilog.vl_types.all;
entity prueba_posicionamiento_vlg_check_tst is
    port(
        pos             : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end prueba_posicionamiento_vlg_check_tst;
