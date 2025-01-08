library verilog;
use verilog.vl_types.all;
entity Block5 is
    port(
        FW              : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        orientacion     : in     vl_logic_vector(1 downto 0);
        dir_min         : in     vl_logic_vector(1 downto 0);
        fin_giro        : in     vl_logic;
        pared_delante   : in     vl_logic;
        giro            : out    vl_logic;
        izq_der         : out    vl_logic;
        dir_correcta    : out    vl_logic
    );
end Block5;
