library ieee;
use ieee.std_logic_1164.all;

use work.eecs361_gates.all;

entity pc_sign_extender is
  port (
    x   : in  std_logic_vector(17 downto 2);
    z   : out std_logic_vector(31 downto 0)
  );
end pc_sign_extender;

architecture structural of pc_sign_extender is
    
begin
    -- Copy x to z and extend the most significant bit
   z(0) <= '0';
   z(1) <= '0'; 
   low_order_bits : for i in 2 to 17 generate
      z(i) <= x(i);
   end generate low_order_bits;
   
   high_order_bits : for i in 18 to 31 generate
      z(i) <= x(15);
   end generate high_order_bits;

end structural;
