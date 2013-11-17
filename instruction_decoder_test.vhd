library ieee;
use ieee.std_logic_1164.all;

entity instruction_decoder_demo is
  port (
    opcode   : out std_logic_vector(5 downto 0);
    rs, rt, rd, shamt   : out std_logic_vector(4 downto 0);
    funct   : out std_logic_vector(5 downto 0);
    address : out std_logic_vector(15 downto 0)
  );
end instruction_decoder_demo;

architecture structural of instruction_decoder_demo is

component instruction_decoder is
  port (
    x   : in  std_logic_vector(31 downto 0);
    opcode   : out std_logic_vector(5 downto 0);
    rs, rt, rd, shamt   : out std_logic_vector(4 downto 0);
    funct   : out std_logic_vector(5 downto 0);
    address : out std_logic_vector(15 downto 0)
    
  );
end component instruction_decoder;

signal x : std_logic_vector(31 downto 0);

begin
  instruction_decoder_map : instruction_decoder port map (x, opcode, rs, rt, rd, shamt, funct, address);
  test_proc : process
  begin
    -- add $s3, $s2, $s1
    x <= "00000000001000100001100000100000";
    wait for 5 ns;
   
     -- sub $s3, $s2, $s1
    x <= "00000000001000100001100000100010";
    wait for 5 ns;
    wait;
    
  end process;
end architecture structural;
