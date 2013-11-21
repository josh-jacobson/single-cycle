library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

-- This is a simple entity to decide whether to feed the branch address into the PC based on the bnq and branch signals, along with the ALU zero flag.

entity branch_decider is
   port (
    zero_flag, bnq, branch : in  std_logic;
    PCSrc : out std_logic
  );
end branch_decider;

architecture structural of branch_decider is
    signal zero_flag_xor_bnq : std_logic;
    
    begin
    xor_map : xor_gate port map (zero_flag, bnq, zero_flag_xor_bnq);
    and_map : and_gate port map (zero_flag_xor_bnq, branch, PCSrc);
    
end structural;
    