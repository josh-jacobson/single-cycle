library ieee;
use ieee.std_logic_1164.all;

entity bitshiftertest is
  port (
    z       : out std_logic_vector(31 downto 0)
  );
end bitshiftertest;

architecture structural of bitshiftertest is
component bitshifter32 is
  port (
    a       : in  std_logic_vector(31 downto 0);
    sig      : in  std_logic_vector(4 downto 0);
    z        : out std_logic_vector(31 downto 0)
  );
  end component bitshifter32;
signal xin1 : std_logic_vector(31 downto 0);
signal cin : std_logic_vector(4 downto 0);
begin
  mux_map : bitshifter32 port map (a => xin1, sig => cin, z => z);
  test_proc : process
  begin
    xin1 <= "00000000000000000000000000000010";
    cin <= "00000";
    wait for 5 ns;
    xin1 <= "00000000000000000000000000000010";
    cin <= "00001";
    wait for 5 ns;
    xin1 <= "00000000000000000000000000000010";
    cin <= "00011";
    wait for 5 ns;    
    xin1 <= "00000000000000000000000000000010";
    cin <= "00111";
    wait for 5 ns;    
    xin1 <= "00000000000000000000000000000010";
    cin <= "01001";
    wait for 5 ns;
    xin1 <= "00000000000000000000000000000010";
    cin <= "10010";
    wait for 5 ns;
    wait;
  end process;
end architecture structural;



