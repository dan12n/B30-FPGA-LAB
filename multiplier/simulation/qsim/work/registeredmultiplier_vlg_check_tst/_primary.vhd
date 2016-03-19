library verilog;
use verilog.vl_types.all;
entity registeredmultiplier_vlg_check_tst is
    port(
        sum             : in     vl_logic_vector(9 downto 0);
        sampler_rx      : in     vl_logic
    );
end registeredmultiplier_vlg_check_tst;
