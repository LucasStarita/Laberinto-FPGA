library verilog;
use verilog.vl_types.all;
entity prueba_orientacion_vlg_check_tst is
    port(
        orientacion     : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end prueba_orientacion_vlg_check_tst;
