library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity or_6 is
  port (
    x   : in  std_logic_vector(5 downto 0);
    z   : out std_logic
  );
end or_6;

architecture dataflow of or_6 is
signal xmid : std_logic_vector (2 downto 0);
signal xlast : std_logic;
begin
xop1 : or_gate_n generic map (n=>3) port map (x=>x(5 downto 3), y=>x(2 downto 0), z=>xmid);
xop2 : or_gate port map (x=>xmid(0), y=>xmid(1), z=>xlast);
xop3 : or_gate port map (x=>xmid(2), y=>xlast, z=>z);
end dataflow;
