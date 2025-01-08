library verilog;
use verilog.vl_types.all;
entity prueba_giro_vlg_check_tst is
    port(
        M0D             : in     vl_logic;
        M0I             : in     vl_logic;
        M1D             : in     vl_logic;
        M1I             : in     vl_logic;
        orientacion     : in     vl_logic_vector(1 downto 0);
        pos             : in     vl_logic_vector(0 to 3);
        sampler_rx      : in     vl_logic
    );
end prueba_giro_vlg_check_tst;
