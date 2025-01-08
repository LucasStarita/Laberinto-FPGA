library verilog;
use verilog.vl_types.all;
entity pRUEBAFF_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        O_0             : in     vl_logic;
        O_1             : in     vl_logic;
        reset           : in     vl_logic;
        sel             : in     vl_logic_vector(3 downto 0);
        Sensor_Frente   : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end pRUEBAFF_vlg_sample_tst;
