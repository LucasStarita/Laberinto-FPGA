library verilog;
use verilog.vl_types.all;
entity pared_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        data_in         : in     vl_logic_vector(3 downto 0);
        reset           : in     vl_logic;
        sel             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end pared_vlg_sample_tst;
