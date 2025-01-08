library verilog;
use verilog.vl_types.all;
entity pruebaparedes is
    port(
        data2_out       : out    vl_logic_vector(63 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        S               : in     vl_logic;
        orientacion     : out    vl_logic_vector(1 downto 0);
        info_giro       : in     vl_logic_vector(1 downto 0);
        sel             : in     vl_logic_vector(3 downto 0)
    );
end pruebaparedes;
