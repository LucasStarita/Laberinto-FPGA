library verilog;
use verilog.vl_types.all;
entity pared is
    port(
        data_in         : in     vl_logic_vector(3 downto 0);
        sel             : in     vl_logic_vector(3 downto 0);
        data2_out       : out    vl_logic_vector(63 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end pared;
