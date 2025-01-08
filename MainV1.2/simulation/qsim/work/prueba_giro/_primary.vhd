library verilog;
use verilog.vl_types.all;
entity prueba_giro is
    port(
        M1I             : out    vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        Giro            : in     vl_logic;
        IZQ_DER         : in     vl_logic;
        pared_delante   : in     vl_logic;
        M0I             : out    vl_logic;
        M1D             : out    vl_logic;
        M0D             : out    vl_logic;
        orientacion     : out    vl_logic_vector(1 downto 0);
        pos             : out    vl_logic_vector(0 to 3);
        cambio          : in     vl_logic
    );
end prueba_giro;
