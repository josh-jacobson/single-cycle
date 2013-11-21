library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity processor is
   generic ( memfile : string );
   port (
    clk : in  std_logic;
    aload : in std_logic_vector(31 downto 0);
    ad    : in std_logic_vector(31 downto 0);
    reset : in std_logic
  );
end processor;

architecture structural of processor is
    
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
    
    -- Instruction memory:
    signal instruction : std_logic_vector(31 downto 0); -- this is the output from the instruction memory
    
    -- instruction decode signals:
    signal opcode   : std_logic_vector(5 downto 0);
    signal rs, rt, rd, shamt   : std_logic_vector(4 downto 0);
    signal funct   : std_logic_vector(5 downto 0);
    signal branch_address16 : std_logic_vector(15 downto 0); -- 16 bit address from branch instruction
    signal branch_address : std_logic_vector(31 downto 0);   -- 32 bit sign-extended full address from branch instruction
        
    -- main control unit signals:
    signal regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, bnq : std_logic;
    signal ALUop : std_logic_vector(1 downto 0);
    
    -- ALU inputs
    signal ALU_a_input, ALU_b_input : std_logic_vector(31 downto 0);
    signal ALU_command : std_logic_vector(2 downto 0);
    
    -- ALU outputs
    signal zero_flag, carry_out, overflow : std_logic;
    signal ALU_result : std_logic_vector(31 downto 0);
    
    -- memory unit
    signal data_from_memory : std_logic_vector (31 downto 0);
    
    -- Register file
    signal data_to_write_to_register : std_logic_vector (31 downto 0):= "00000000000000000000000000000000";
    signal destination_register : std_logic_vector (4 downto 0);
    signal register_output_b : std_logic_vector (31 downto 0);
    
    -- Program Counter
    signal chosen_pc : std_logic_vector(31 downto 0):= "00000000010000000000000000100000";
    signal pc_output, incremented_pc : std_logic_vector(31 downto 0);
    
    -- branch logic
    signal calculated_branch_address : std_logic_vector (31 downto 0); -- address after adding 4 then adding the branch amount from instruction
    signal PCSrc : std_logic; -- signal to determine whether to send branch address or incremented PC to the program counter
    
    -- dummy signals
    signal dummy1, dummy2 : std_logic;
    
    
  
  begin
  
  -- Program counter
  pc_counter_map : pc_counter port map (pc_output, chosen_pc, ad, aload, clk, reset);
  
  -- Instruction memory
  instruction_memory_map : instruction_memory generic map (memfile) port map (pc_output, instruction);
  
  -- Instruction decoder and main control
  instruction_decoder_map: instruction_decoder port map (instruction, opcode, rs, rt, rd, shamt, funct, branch_address16);
  control_unit_map : control_unit port map (opcode, regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, bnq, ALUop);
  sign_extender_map : sign_extender port map (branch_address16, branch_address);
  
  -- ALU controller
  alu_control_map : alu_control port map (funct, ALUop, ALU_command);
  
  -- Register file
  --check next line if there are issues:
  register_write_data_mux_map : mux_32 port map (MemtoReg, data_from_memory, ALU_result, data_to_write_to_register);
  destination_register_mux_map : mux_n generic map (5) port map (RegDst, rt, rd, destination_register);
  register_component_map : register_component port map (data_to_write_to_register, destination_register, rs, rt, ALU_a_input, register_output_b, clk, reset, RegWrite);
  
  -- ALU
  -- note: line 145 uses ALU output.
  alu_source_mux_map : mux_32 port map (ALUSrc, register_output_b, branch_address, ALU_b_input);
  ALU_map : ALU port map (ALU_a_input, ALU_b_input, ALU_command, ALU_result, carry_out, zero_flag, overflow);
  
  -- Data memory:
  data_memory_map : syncram generic map (memfile) port map(clk,'1', MemRead,MemWrite, ALU_result, register_output_b, data_from_memory);
  
  -- next instruction logic
  PC_incrementer_map : rippleadder32 port map(PC_output, "00000000000000000000000000000100", '0', incremented_PC, dummy1);
  add_branch_address_map : rippleadder32 port map(incremented_PC, branch_address, '0', calculated_branch_address, dummy2);
  next_instruction_chooser_map : mux_32 port map (PCSrc, incremented_PC, calculated_branch_address, chosen_pc);
  
  
  
  
  -- Branch logic
  branch_decider_map : branch_decider port map (zero_flag, bnq, branch, PCSrc);
  
  
  
end structural;
