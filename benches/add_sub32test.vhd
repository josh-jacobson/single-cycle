library ieee;
use ieee.std_logic_1164.all;

entity add_sub32test is
  port (
    z       : out std_logic_vector(31 downto 0);
    cout    : out std_logic
  );
end add_sub32test;

architecture structural of add_sub32test is
component add_sub32 is
    port (
    a       : in  std_logic_vector(31 downto 0);
    b       : in  std_logic_vector(31 downto 0);
    sub     : in  std_logic;
    z       : out std_logic_vector(31 downto 0);
    cout    : out std_logic
  );
  end component add_sub32;
signal xin : std_logic_vector(31 downto 0);
signal yin : std_logic_vector(31 downto 0);
signal cin : std_logic;
begin
  addsub_map : add_sub32 port map (a => xin, b => yin, sub => cin, z => z, cout => cout);
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
    xin <= "00010001000100010001000100010001";
    yin <= "00110011001100110011001100110011";
    cin <= '1';
    wait for 5 ns;
    xin <= "01000100010001000100010001000100";
    yin <= "01110111011101110111011101110111";
    cin <= '1';
    wait for 5 ns;
    wait;
  end process;
end architecture structural;

