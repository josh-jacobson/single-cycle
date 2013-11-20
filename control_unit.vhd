library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity control_unit is
  port (
       opcode  :  in  std_logic_vector(5 downto 0);
       regDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, branch, bnq : out std_logic;
       ALUop : out std_logic_vector(1 downto 0)
        );
end control_unit;

architecture structural of control_unit is

component or_6 is
  port (
    x   : in  std_logic_vector(5 downto 0);
    z   : out std_logic
  );
end component or_6;

signal not_r_format, r_format, load_store, load, store, not_store : std_logic; 

begin
-- Set intermediary signals for convenience and readability
not_r_format_map : or_6 port map (opcode, not_r_format); -- 0 for r-type, 1 otherwise
r_format_map : not_gate port map (not_r_format, r_format); -- 1 for r-type, 0 otherwise
load_store_map : and_gate port map(opcode(0), opcode(1), load_store); -- 1 for load or store, 0 otherwise
store_map : and_gate port map (load_store, opcode(3), store); -- 1 for store instruction, 0 otherwise
not_store_map : not_gate port map (store, not_store);
load_map : and_gate port map (load_store, not_store, load); -- 1 for load instruction, 0 otherwise

-- Assign the final control signals
RegDst <= r_format;
ALUSrc <= load_store;
MemtoReg <= not_r_format;
RegWrite_map : or_gate port map (r_format, load, RegWrite);
MemRead <= load;
MemWrite <= store;
branch <= opcode(2);
bnq <= opcode(0); -- bnq = 0 for a beq operation, 1 for a bnq operation
ALUop(0) <= opcode(2); -- same as branch signal
ALUop(1) <= r_format;

end architecture structural;