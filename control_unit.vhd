library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity control_unit is
  port (
       opcode  :  in  std_logic_vector(5 downto 0);
       regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch : out std_logic;
       ALUop : out std_logic_vector(1 downto 0)
        );
end control_unit;

architecture structural of control_unit is

        -- component declarations here
begin

        -- logic here

end architecture structural;