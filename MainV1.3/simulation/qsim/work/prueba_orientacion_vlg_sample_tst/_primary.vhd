library verilog;
use verilog.vl_types.all;
entity prueba_orientacion_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        INFO_GIRO       : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end prueba_orientacion_vlg_sample_tst;
