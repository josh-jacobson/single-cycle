library ieee;
use ieee.std_logic_1164.all;

entity or_6 is
  port (
    x   : in  std_logic_vector(5 downto 0);
    z   : out std_logic
  );
end or_6;

architecture dataflow of or_6 is
begin
  z <= x(0) or x(1) or x(2) or x(3) or x(4) or x(5);
end dataflow;