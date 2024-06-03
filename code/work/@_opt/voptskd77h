library verilog;
use verilog.vl_types.all;
entity MIPS is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instruction     : in     vl_logic_vector(31 downto 0);
        romCe           : out    vl_logic;
        instAddr        : out    vl_logic_vector(31 downto 0);
        rdData          : in     vl_logic_vector(31 downto 0);
        wtData          : out    vl_logic_vector(31 downto 0);
        memAddr         : out    vl_logic_vector(31 downto 0);
        memCe           : out    vl_logic;
        memWr           : out    vl_logic
    );
end MIPS;
