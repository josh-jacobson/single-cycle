library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity tripleand is
  port (
    x       : in  std_logic;
    y       : in  std_logic;
    c       : in  std_logic;
    z       : out std_logic
  );
end tripleand;

architecture structural of tripleand is
  	
signal cinter : std_logic;

begin
  firsttwo : and_gate port map (x => x, y => y, z => cinter);
  nexttwo : and_gate port map (x => cinter, y => c, z => z);
  
end architecture structural;

