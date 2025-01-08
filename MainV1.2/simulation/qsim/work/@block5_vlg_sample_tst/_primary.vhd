library verilog;
use verilog.vl_types.all;
entity Block5_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        dir_min         : in     vl_logic_vector(1 downto 0);
        fin_giro        : in     vl_logic;
        orientacion     : in     vl_logic_vector(1 downto 0);
        pared_delante   : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Block5_vlg_sample_tst;
