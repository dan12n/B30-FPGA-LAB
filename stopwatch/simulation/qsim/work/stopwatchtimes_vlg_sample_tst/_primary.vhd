library verilog;
use verilog.vl_types.all;
entity stopwatchtimes_vlg_sample_tst is
    port(
        clock_in        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end stopwatchtimes_vlg_sample_tst;
