library verilog;
use verilog.vl_types.all;
entity conexioooon is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        prioridad       : out    vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        dir_min         : in     vl_logic_vector(1 downto 0);
        orientacion     : in     vl_logic_vector(1 downto 0);
        FW              : out    vl_logic;
        fin_giro        : in     vl_logic;
        pared_delante   : in     vl_logic;
        giro            : out    vl_logic;
        izq_der         : out    vl_logic;
        pulso_check     : out    vl_logic
    );
end conexioooon;
