library ieee;
use ieee.std_logic_1164.all;

entity sign_extender_demo is
  port (
    z       : out std_logic_vector(31 downto 0)
  );
end sign_extender_demo;

architecture structural of sign_extender_demo is

component sign_extender is
  port (
    x   : in  std_logic_vector(15 downto 0);
    z   : out std_logic_vector(31 downto 0)
  );
end component sign_extender;

signal x : std_logic_vector(15 downto 0);

begin
  sign_extender_map : sign_extender port map (x => x, z => z);
  test_proc : process
  begin
    x <= "0000000000000011";

    wait for 5 ns;
   
    x <= "1111111111111100";
    wait for 5 ns;
    wait;
  end process;
end architecture structural;


