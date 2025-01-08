library verilog;
use verilog.vl_types.all;
entity conexioooon_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        dir_min         : in     vl_logic_vector(1 downto 0);
        fin_giro        : in     vl_logic;
        orientacion     : in     vl_logic_vector(1 downto 0);
        pared_delante   : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end conexioooon_vlg_sample_tst;
