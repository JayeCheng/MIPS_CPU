library verilog;
use verilog.vl_types.all;
entity ID is
    port(
        rst             : in     vl_logic;
        inst            : in     vl_logic_vector(31 downto 0);
        regaData_i      : in     vl_logic_vector(31 downto 0);
        regbData_i      : in     vl_logic_vector(31 downto 0);
        op              : out    vl_logic_vector(5 downto 0);
        regaData        : out    vl_logic_vector(31 downto 0);
        regbData        : out    vl_logic_vector(31 downto 0);
        regaRead        : out    vl_logic;
        regbRead        : out    vl_logic;
        regcWrite       : out    vl_logic;
        regaAddr        : out    vl_logic_vector(4 downto 0);
        regbAddr        : out    vl_logic_vector(4 downto 0);
        regcAddr        : out    vl_logic_vector(4 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        jAddr           : out    vl_logic_vector(31 downto 0);
        jCe             : out    vl_logic
    );
end ID;
