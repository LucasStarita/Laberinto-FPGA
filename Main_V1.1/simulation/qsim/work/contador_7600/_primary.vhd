library verilog;
use verilog.vl_types.all;
entity contador_7600 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        inicio_contador : in     vl_logic;
        fin_contador    : out    vl_logic
    );
end contador_7600;
