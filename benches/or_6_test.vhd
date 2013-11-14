library ieee;
use ieee.std_logic_1164.all;

entity or_6_test is
  port (
    b       : out std_logic
  );
end or_6_test;

architecture structural of or_6_test is

component or_6 is
  port (
    x   : in  std_logic_vector(5 downto 0);
    z   : out std_logic
    
  );
end component or_6;

signal a : std_logic_vector(5 downto 0);
begin
  or_6_map : or_6 port map (x => a, z => b);
  test_proc : process
  begin
    a <= "000010";
    wait for 5 ns;
    a <= "111111";
    wait for 5 ns;
    a <= "000000";
    wait for 5 ns;
    a <= "010101";
    wait for 5 ns;
    wait;
  end process;
end architecture structural;
