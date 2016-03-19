library verilog;
use verilog.vl_types.all;
entity multiplier_vlg_sample_tst is
    port(
        A_in            : in     vl_logic_vector(4 downto 0);
        B_in            : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end multiplier_vlg_sample_tst;
