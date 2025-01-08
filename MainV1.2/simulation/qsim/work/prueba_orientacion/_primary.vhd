library verilog;
use verilog.vl_types.all;
entity prueba_orientacion is
    port(
        orientacion     : out    vl_logic_vector(1 downto 0);
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        INFO_GIRO       : in     vl_logic_vector(1 downto 0)
    );
end prueba_orientacion;
