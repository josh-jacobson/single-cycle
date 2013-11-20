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
    signal instruction : std_logic_vector(31 downto 0);
    
    -- instruction decode signals:
    signal opcode   : std_logic_vector(5 downto 0);
    signal rs, rt, rd, shamt   : std_logic_vector(4 downto 0);
    signal funct   : std_logic_vector(5 downto 0);
    signal address16 : std_logic_vector(15 downto 0); -- 16 bit address
    signal address : std_logic_vector(31 downto 0);   -- 32 bit sign-extended full address
        
    -- main control unit signals:
    signal regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch : std_logic;
    signal ALUop : std_logic_vector(1 downto 0);
    
    component instruction_decoder is
      port (
        x   : in  std_logic_vector(31 downto 0);
        opcode   : out std_logic_vector(5 downto 0);
        rs, rt, rd, shamt   : out std_logic_vector(4 downto 0);
        funct   : out std_logic_vector(5 downto 0);
        address : out std_logic_vector(15 downto 0)
      );
    end component instruction_decoder;
    
    component control_unit is
        port (
          opcode  :  in  std_logic_vector(5 downto 0);
          regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch : out std_logic;
          ALUop : out std_logic_vector(1 downto 0)
        );
    end component control_unit;
    
    component sign_extender is
        port (
          x   : in  std_logic_vector(15 downto 0);
          z   : out std_logic_vector(31 downto 0)
        );
    end component sign_extender;
  
  begin
  
  -- Map components:
  instruction_decoder_map: instruction_decoder port map (instruction, opcode, rs, rt, rd, shamt, funct, address16);
  control_unit_map : control_unit port map (opcode, regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, ALUop);
  sign_extender_map : sign_extender port map (address16, address);
  
  
end structural;