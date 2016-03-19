library verilog;
use verilog.vl_types.all;
entity stopwatch is
    port(
        clk_out         : out    vl_logic;
        clock           : in     vl_logic
    );
end stopwatch;
