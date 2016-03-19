library verilog;
use verilog.vl_types.all;
entity stopwatchtimes is
    port(
        pin_name1       : out    vl_logic;
        clock_in        : in     vl_logic;
        hundredms_output: out    vl_logic_vector(6 downto 0);
        onesecond_output: out    vl_logic_vector(6 downto 0);
        tenms_output    : out    vl_logic_vector(6 downto 0);
        tenseconds_output: out    vl_logic_vector(6 downto 0)
    );
end stopwatchtimes;
