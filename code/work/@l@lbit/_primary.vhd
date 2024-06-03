library verilog;
use verilog.vl_types.all;
entity LLbit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wLLbit          : in     vl_logic;
        rLLbit          : out    vl_logic;
        wbit            : in     vl_logic;
        excpt           : out    vl_logic
    );
end LLbit;
