library ieee;
use ieee.std_logic_1164.all;

entity register_demo is
  port (
    za       : out std_logic_vector(31 downto 0);
    zb       : out std_logic_vector(31 downto 0)
  );
end register_demo;

architecture structural of register_demo is
component register_component is
  port (
    busw    : in  std_logic_vector(31 downto 0);
    rd      : in  std_logic_vector(4 downto 0);
    rs      : in  std_logic_vector(4 downto 0);
    rt      : in  std_logic_vector(4 downto 0);
    busa    : out std_logic_vector(31 downto 0);
    busb    : out std_logic_vector(31 downto 0);
    clk     : in std_logic;
    reset     : in std_logic;
    we      : in std_logic
  );
end component register_component;

signal tbusw : std_logic_vector(31 downto 0);
signal trd : std_logic_vector(4 downto 0);
signal trs : std_logic_vector(4 downto 0);
signal trt : std_logic_vector(4 downto 0);
signal tclk : std_logic;
signal treset : std_logic;
signal twe : std_logic;
begin
   regfile_map : register_component port map (busw => tbusw, reset => treset, rd => trd, rs => trs, rt => trt, busa => za, busb => zb, clk => tclk, we => twe);
  
test_proc : process
  begin
    trd <= "11111";
    trs <= "11111";
    trt <= "00101";
    tbusw <= "11011000000000000000000000000100";
    tclk <= '0';
    treset <= '1';
    twe <= '0';
    wait for 100 ns;
    treset <= '0';
    wait for 100 ns;
    tclk <= '1';
    wait for 100 ns;
    twe <= '1';
    tclk <= '0';
    wait for 100 ns;
    tclk <= '1';
    wait for 100 ns;
    wait;
  end process;
end architecture structural;
