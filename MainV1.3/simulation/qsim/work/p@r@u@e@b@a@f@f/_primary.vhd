library verilog;
use verilog.vl_types.all;
entity pRUEBAFF is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        data2_out       : out    vl_logic_vector(63 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        Sensor_Frente   : in     vl_logic;
        O_1             : in     vl_logic;
        O_0             : in     vl_logic;
        sel             : in     vl_logic_vector(3 downto 0)
    );
end pRUEBAFF;
