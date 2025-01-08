library verilog;
use verilog.vl_types.all;
entity main_vlg_sample_tst is
    port(
        ADC_DOUT        : in     vl_logic;
        areset          : in     vl_logic;
        clk0            : in     vl_logic;
        clockcito       : in     vl_logic;
        RESET_GRAL      : in     vl_logic;
        Sensor_Frente   : in     vl_logic;
        Sensor_Linea    : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end main_vlg_sample_tst;
