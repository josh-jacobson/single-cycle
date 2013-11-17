library ieee;
use ieee.std_logic_1164.all;

entity pc_counter_demo is
  port (
    z       : out std_logic_vector(31 downto 0)
  );
end pc_counter_demo;

architecture structural of pc_counter_demo is
component pc_counter is
    port (
    pcc       : out  std_logic_vector(31 downto 0);
    dc       : in  std_logic_vector(31 downto 0);
    clk       : in  std_logic;
    reset       : in  std_logic
  );
  end component pc_counter;
  component a32bitreg is
  port (
    q       : out  std_logic_vector(31 downto 0);
    d       : in  std_logic_vector(31 downto 0);
    arst    : in  std_logic;
    aload   : in  std_logic_vector(31 downto 0);
    enable  : in  std_logic;
    clk     : in  std_logic
  );
end component a32bitreg;
signal yin : std_logic_vector(31 downto 0);
signal cin : std_logic;
signal reset : std_logic;
begin
   fulladder_map : pc_counter port map (dc => yin, clk => cin, reset => reset, pcc => z);
  --fulladder_map : a32bitreg port map (d => yin, aload => "00000000000000000000000000000000", enable=> '1', clk => cin, arst => reset, q => z);
  test_proc : process
  begin
    yin <= "00000000000000000000000000000000";
    cin <= '1';
    reset <= '1';
    wait for 1 ns;
    cin <= '0';
    wait for 1 ns;
    cin <= '1';
    wait for 1 ns;
    reset <= '0';
    cin <= '0';
    wait for 1 ns;
    yin <= "00000000000000000000000000000100";
    cin <= '1';
    
    wait for 1 ns;
    cin <= '0';
    wait for 1 ns;
    wait for 5 ns;

    yin <= "01110111011101110111011101110111";
    cin <= '1';
    wait for 1 ns;
    cin <= '0';
    wait for 1 ns;
    cin <= '1';
    wait for 5 ns;
    wait;
  end process;
end architecture structural;
