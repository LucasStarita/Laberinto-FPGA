library verilog;
use verilog.vl_types.all;
entity prueba_control_v2_vlg_sample_tst is
    port(
        c_casilla       : in     vl_logic;
        clk             : in     vl_logic;
        clk1            : in     vl_logic;
        dir_min         : in     vl_logic_vector(1 downto 0);
        fin_giro        : in     vl_logic;
        hay_pared       : in     vl_logic;
        orientacion     : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic;
        reset2          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end prueba_control_v2_vlg_sample_tst;
