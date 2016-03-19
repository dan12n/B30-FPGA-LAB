library verilog;
use verilog.vl_types.all;
entity stopwatch_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end stopwatch_vlg_sample_tst;
