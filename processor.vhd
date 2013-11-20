library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity processor is
   generic ( mem_file : string );
   port (
    clk : in  std_logic
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
    signal regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, bnq : std_logic;
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
    component instruction_memory is
       generic ( memfile : string );
       port (
           addr : in std_logic_vector(31 downto 0);
           inst : out std_logic_vector(31 downto 0)
        );
    end component instruction_memory;
    component pc_counter is
        port (
          pcc       : out  std_logic_vector(31 downto 0);
          dc       : in  std_logic_vector(31 downto 0);
          clk       : in  std_logic;
          reset       : in  std_logic
        );
    end component pc_counter;
    component syncram is
     generic (
      	mem_file : string
     );
     port (
       clk   : in  std_logic;
   	   cs	  : in	std_logic;
      	oe	  :	in	std_logic;
      	we	  :	in	std_logic;
      	addr  : in	std_logic_vector(31 downto 0);
      	din	  :	in	std_logic_vector(31 downto 0);
      	dout  :	out std_logic_vector(31 downto 0)
     );
    end component syncram;
    component control_unit is
        port (
          opcode  :  in  std_logic_vector(5 downto 0);
          regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, bnq : out std_logic;
          ALUop : out std_logic_vector(1 downto 0)
        );
    end component control_unit;
    component alu_control is
        port (
          funct  : in  std_logic_vector(5 downto 0);
          op_code : in  std_logic_vector(1 downto 0);
          alu_c : out std_logic_vector(2 downto 0)
        );
    end component alu_control;
    component sign_extender is
        port (
          x   : in  std_logic_vector(15 downto 0);
          z   : out std_logic_vector(31 downto 0)
        );
    end component sign_extender;
  
  begin
  
  -- Map components:
  instruction_decoder_map: instruction_decoder port map (instruction, opcode, rs, rt, rd, shamt, funct, address16);
  control_unit_map : control_unit port map (opcode, regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, bnq, ALUop);
  sign_extender_map : sign_extender port map (address16, address);
  
  
end structural;
