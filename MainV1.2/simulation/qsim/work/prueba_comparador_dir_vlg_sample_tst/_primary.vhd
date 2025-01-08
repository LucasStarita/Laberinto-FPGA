library verilog;
use verilog.vl_types.all;
entity prueba_comparador_dir_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        dir_min6        : in     vl_logic_vector(1 downto 0);
        orientacion     : in     vl_logic_vector(1 downto 0);
        reset5          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end prueba_comparador_dir_vlg_sample_tst;
