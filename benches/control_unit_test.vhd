library ieee;
use ieee.std_logic_1164.all;

entity control_unit_test is
  port (
       regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch : out std_logic;
       ALUop : out std_logic_vector(1 downto 0)
        );
end control_unit_test;

architecture structural of control_unit_test is

component control_unit is
  port (
       opcode  :  in  std_logic_vector(5 downto 0);
       regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch : out std_logic;
       ALUop : out std_logic_vector(1 downto 0)
        );
end component control_unit;

signal opcode : std_logic_vector(5 downto 0);

begin
  control_unit_map : control_unit port map (opcode, regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, ALUop);
  test_proc : process
  begin
      
    -- R-type instruction
    opcode <= "000000";
    wait for 5 ns;
   
     -- Load
    opcode <= "100011";
    wait for 5 ns;
    
     -- Store
    opcode <= "101011";
    wait for 5 ns;
    
     -- Branch
    opcode <= "000100";
    wait for 5 ns;
    wait;
    
  end process;
end architecture structural;
