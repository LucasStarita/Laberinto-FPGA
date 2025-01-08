library verilog;
use verilog.vl_types.all;
entity prueba_floodfill_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        orientacion     : in     vl_logic_vector(1 downto 0);
        pin_name1       : in     vl_logic;
        posicion        : in     vl_logic_vector(3 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end prueba_floodfill_vlg_sample_tst;
