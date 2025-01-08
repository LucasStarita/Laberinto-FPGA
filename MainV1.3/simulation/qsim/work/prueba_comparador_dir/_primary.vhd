library verilog;
use verilog.vl_types.all;
entity prueba_comparador_dir is
    port(
        dir_correcta7   : out    vl_logic;
        reset5          : in     vl_logic;
        clock           : in     vl_logic;
        dir_min6        : in     vl_logic_vector(1 downto 0);
        orientacion     : in     vl_logic_vector(1 downto 0)
    );
end prueba_comparador_dir;
