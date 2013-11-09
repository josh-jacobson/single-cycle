library ieee;
use ieee.std_logic_1164.all;

use work.eecs361_gates.all;

entity sign_extender is
  port (
    x   : in  std_logic_vector(15 downto 0);
    z   : out std_logic_vector(31 downto 0)
  );
end sign_extender;

architecture structural of sign_extender is
    
begin
    -- Copy x to z and extend the most significant bit
    
   low_order_bits : for i in 1 to 15 generate
      z(i) <= x(i);
   end generate low_order_bits;
   
   high_order_bits : for i in 16 to 31 generate
      z(i) <= x(15);
   end generate low_order_bits;

end structural;
