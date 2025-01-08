library verilog;
use verilog.vl_types.all;
entity floodfill_para_simular_vlg_sample_tst is
    port(
        c_casilla       : in     vl_logic;
        clk             : in     vl_logic;
        fin_giro        : in     vl_logic;
        O_0             : in     vl_logic;
        O_1             : in     vl_logic;
        pos             : in     vl_logic_vector(0 to 3);
        reset           : in     vl_logic;
        S               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end floodfill_para_simular_vlg_sample_tst;
