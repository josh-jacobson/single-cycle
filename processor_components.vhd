library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

package processor_components is
    
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
       generic ( mem_file : string );
       port (
           addr : in std_logic_vector(31 downto 0);
           inst : out std_logic_vector(31 downto 0)
        );
    end component instruction_memory;
    component pc_counter is
        port (
          pcc       : out  std_logic_vector(31 downto 0);
          dc       : in  std_logic_vector(31 downto 0);
          ad      : in std_logic_vector(31 downto 0);
          aload      :in std_logic_vector(31 downto 0);
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
    component register_component is
        port (
          busw    : in  std_logic_vector(31 downto 0);
          rd      : in  std_logic_vector(4 downto 0);
          rs      : in  std_logic_vector(4 downto 0);
          rt      : in  std_logic_vector(4 downto 0);
          busa    : out std_logic_vector(31 downto 0);
          busb    : out std_logic_vector(31 downto 0);
          clk     : in std_logic;
          reset     : in std_logic;
          we      : in std_logic
        );
    end component register_component;
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
    component branch_decider is
       port (
          zero_flag, bnq, branch : in  std_logic;
          PCSrc : out std_logic
       );
    end component branch_decider;
    component ALU is
      port ( signal A, B: in std_logic_vector (31 downto 0);
           signal m: in std_logic_vector (2 downto 0);
           signal shamt : in std_logic_vector (4 downto 0);
           signal S: out std_logic_vector (31 downto 0);
           signal c: out std_logic;
           signal zero: out std_logic;
           signal ovf: out std_logic);
    end component ALU;
    component rippleadder32 is
        port (
          x       : in  std_logic_vector(31 downto 0);
          y       : in  std_logic_vector(31 downto 0);
          c       : in  std_logic;
          z       : out std_logic_vector(31 downto 0);
          cout    : out std_logic
        );
    end component rippleadder32;
end;

