library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity processor is
   port (
    x   : in  std_logic;
    z   : out std_logic
  );
end processor;

architecture structural of processor is
begin
  z <= not x;
end structural;

