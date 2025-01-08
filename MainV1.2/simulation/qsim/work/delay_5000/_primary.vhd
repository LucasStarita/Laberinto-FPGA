library verilog;
use verilog.vl_types.all;
entity delay_5000 is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        inicio_contador : in     vl_logic;
        fin_contador    : out    vl_logic
    );
end delay_5000;
