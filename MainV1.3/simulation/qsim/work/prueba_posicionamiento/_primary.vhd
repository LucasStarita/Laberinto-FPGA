library verilog;
use verilog.vl_types.all;
entity prueba_posicionamiento is
    port(
        pos             : out    vl_logic_vector(3 downto 0);
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        cambio          : in     vl_logic
    );
end prueba_posicionamiento;
