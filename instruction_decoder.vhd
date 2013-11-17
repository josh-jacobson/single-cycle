library ieee;
use ieee.std_logic_1164.all;

use work.eecs361_gates.all;

entity instruction_decoder is
  port (
    x   : in  std_logic_vector(31 downto 0);
    opcode   : out std_logic_vector(5 downto 0);
    rs, rt, rd, shamt   : out std_logic_vector(4 downto 0);
    funct   : out std_logic_vector(5 downto 0);
    address : out std_logic_vector(15 downto 0)
    
  );
end instruction_decoder;

architecture structural of instruction_decoder is
    
begin
    
   read_opcode : for i in 0 to 5 generate
      opcode(i) <= x(i+26);
   end generate read_opcode;
   
   rs_rt_rd_shamt : for i in 0 to 4 generate
      rs(i) <= x(i+21);
      rt(i) <= x(i+16);
      rd(i) <= x(i+11);
      shamt(i) <= x(i+6);
   end generate rs_rt_rd_shamt;
   
   read_funct : for i in 0 to 5 generate
      funct(i) <= x(i);
   end generate read_funct;
   
   read_address : for i in 0 to 15 generate
      address(i) <= x(i);
   end generate read_address;

end structural;
