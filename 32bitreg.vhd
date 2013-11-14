library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity a32bitreg is
  port (
    q       : out  std_logic_vector(31 downto 0);
    d       : in  std_logic_vector(31 downto 0);
    clk       : in  std_logic
  );
end a32bitreg;

architecture structural of a32bitreg is

begin

  FF_GEN: 
   for I in 0 to 31 generate
      dffint_map : dff port map
        (d => d(I), q => q(I), clk=> clk);
   end generate FF_GEN;
  
end architecture structural;
