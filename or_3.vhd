library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity or_3 is
  port (
    x   : in  std_logic_vector(2 downto 0);
    z   : out std_logic
  );
end or_3;

architecture dataflow of or_3 is
signal xlast : std_logic;
begin
xop2 : or_gate port map (x=>x(0), y=>x(1), z=>xlast);
xop3 : or_gate port map (x=>x(2), y=>xlast, z=>z);
end dataflow;
