library verilog;
use verilog.vl_types.all;
entity RegFile is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        we              : in     vl_logic;
        waddr           : in     vl_logic_vector(4 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        regaRead        : in     vl_logic;
        regbRead        : in     vl_logic;
        regaAddr        : in     vl_logic_vector(4 downto 0);
        regbAddr        : in     vl_logic_vector(4 downto 0);
        regaData        : out    vl_logic_vector(31 downto 0);
        regbData        : out    vl_logic_vector(31 downto 0)
    );
end RegFile;
