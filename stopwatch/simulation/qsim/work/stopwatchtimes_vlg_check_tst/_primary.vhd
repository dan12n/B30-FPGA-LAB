library verilog;
use verilog.vl_types.all;
entity stopwatchtimes_vlg_check_tst is
    port(
        hundredms_output: in     vl_logic_vector(6 downto 0);
        onesecond_output: in     vl_logic_vector(6 downto 0);
        pin_name1       : in     vl_logic;
        tenms_output    : in     vl_logic_vector(6 downto 0);
        tenseconds_output: in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end stopwatchtimes_vlg_check_tst;
