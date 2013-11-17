library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity and_6 is
  port (
    x       : in  std_logic_vector (4 downto 0);
    z       : out std_logic
  );
end and_6;

architecture structural of and_6 is
    
signal a : std_logic;
signal b : std_logic;
signal c : std_logic;

begin
  atwo : and_gate port map (x => x(0), y => x(1), z => a);
  btwo : and_gate port map (x => x(2), y => x(3), z => b);
  ctwo : and_gate port map (x => b, y => x(4), z => c);
  nexttwo : and_gate port map (x => a, y => c, z => z);
  
end architecture structural;

