library verilog;
use verilog.vl_types.all;
entity EX is
    port(
        rst             : in     vl_logic;
        op_i            : in     vl_logic_vector(5 downto 0);
        regaData        : in     vl_logic_vector(31 downto 0);
        regbData        : in     vl_logic_vector(31 downto 0);
        regcWrite_i     : in     vl_logic;
        regcAddr_i      : in     vl_logic_vector(4 downto 0);
        HII             : in     vl_logic_vector(31 downto 0);
        LOI             : in     vl_logic_vector(31 downto 0);
        regcData        : out    vl_logic_vector(31 downto 0);
        regcWrite       : out    vl_logic;
        regcAddr        : out    vl_logic_vector(4 downto 0);
        op              : out    vl_logic_vector(5 downto 0);
        memAddr         : out    vl_logic_vector(31 downto 0);
        memData         : out    vl_logic_vector(31 downto 0);
        HI              : out    vl_logic_vector(31 downto 0);
        LO              : out    vl_logic_vector(31 downto 0)
    );
end EX;
