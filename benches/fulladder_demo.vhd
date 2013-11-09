library ieee;
use ieee.std_logic_1164.all;

entity fulladder_demo is
  port (
    z       : out std_logic_vector(31 downto 0);
    cout    : out std_logic
  );
end fulladder_demo;

architecture structural of fulladder_demo is
component rippleadder32 is
    port (
    x       : in  std_logic_vector(31 downto 0);
    y       : in  std_logic_vector(31 downto 0);
    c       : in  std_logic;
    z       : out std_logic_vector(31 downto 0);
    cout    : out std_logic
  );
  end component rippleadder32;
signal xin : std_logic_vector(31 downto 0);
signal yin : std_logic_vector(31 downto 0);
signal cin : std_logic;
begin
  fulladder_map : rippleadder32 port map (x => xin, y => yin, c => cin, z => z, cout => cout);
  test_proc : process
  begin
    xin <= "00000000000000000000000000000000";
    yin <= "11111111111111111111111111111111";
    cin <= '1';
    wait for 5 ns;
    xin <= "00010001000100010001000100010001";
    yin <= "00110011001100110011001100110011";
    cin <= '0';
    wait for 5 ns;
    xin <= "01000100010001000100010001000100";
    yin <= "01110111011101110111011101110111";
    cin <= '0';
    wait for 5 ns;
    wait;
  end process;
end architecture structural;
