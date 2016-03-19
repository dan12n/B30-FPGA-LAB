library verilog;
use verilog.vl_types.all;
entity multiplier is
    port(
        multiplied      : out    vl_logic_vector(9 downto 0);
        A_in            : in     vl_logic_vector(4 downto 0);
        B_in            : in     vl_logic_vector(4 downto 0)
    );
end multiplier;
