library verilog;
use verilog.vl_types.all;
entity registeredmultiplier is
    port(
        sum             : out    vl_logic_vector(9 downto 0);
        clock           : in     vl_logic;
        A_in            : in     vl_logic_vector(4 downto 0);
        B_in            : in     vl_logic_vector(4 downto 0)
    );
end registeredmultiplier;
