library verilog;
use verilog.vl_types.all;
entity registeredmultiplier_vlg_sample_tst is
    port(
        A_in            : in     vl_logic_vector(4 downto 0);
        B_in            : in     vl_logic_vector(4 downto 0);
        clock           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end registeredmultiplier_vlg_sample_tst;
