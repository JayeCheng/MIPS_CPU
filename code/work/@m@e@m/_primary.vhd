library verilog;
use verilog.vl_types.all;
entity MEM is
    port(
        rst             : in     vl_logic;
        op              : in     vl_logic_vector(5 downto 0);
        regcData        : in     vl_logic_vector(31 downto 0);
        regcAddr        : in     vl_logic_vector(4 downto 0);
        regcWr          : in     vl_logic;
        memAddr_i       : in     vl_logic_vector(31 downto 0);
        memData         : in     vl_logic_vector(31 downto 0);
        rdData          : in     vl_logic_vector(31 downto 0);
        regAddr         : out    vl_logic_vector(4 downto 0);
        regWr           : out    vl_logic;
        regData         : out    vl_logic_vector(31 downto 0);
        memAddr         : out    vl_logic_vector(31 downto 0);
        wtData          : out    vl_logic_vector(31 downto 0);
        memWr           : out    vl_logic;
        memCe           : out    vl_logic;
        HII             : in     vl_logic_vector(31 downto 0);
        LOI             : in     vl_logic_vector(31 downto 0);
        HIO             : out    vl_logic_vector(31 downto 0);
        LOO             : out    vl_logic_vector(31 downto 0)
    );
end MEM;
