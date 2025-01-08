library verilog;
use verilog.vl_types.all;
entity pRUEBAFF_vlg_check_tst is
    port(
        data2_out       : in     vl_logic_vector(63 downto 0);
        sampler_rx      : in     vl_logic
    );
end pRUEBAFF_vlg_check_tst;
