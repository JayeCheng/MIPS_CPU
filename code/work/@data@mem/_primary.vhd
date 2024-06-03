library verilog;
use verilog.vl_types.all;
entity DataMem is
    port(
        clk             : in     vl_logic;
        ce              : in     vl_logic;
        we              : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        dataIn          : in     vl_logic_vector(31 downto 0);
        dataOut         : out    vl_logic_vector(31 downto 0)
    );
end DataMem;
