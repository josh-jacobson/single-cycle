library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity add_sub32 is
  port (
    a       : in  std_logic_vector(31 downto 0);
    b       : in  std_logic_vector(31 downto 0);
    sub     : in  std_logic;
    z       : out std_logic_vector(31 downto 0);
    cout    : out std_logic
  );
end add_sub32;

architecture structural of add_sub32 is
  component rippleadder32 is
  port (
    x       : in  std_logic_vector(31 downto 0);
    y       : in  std_logic_vector(31 downto 0);
    c       : in  std_logic;
    z       : out std_logic_vector(31 downto 0);
    cout    : out std_logic
  );
end component rippleadder32;

signal b_not   : std_logic_vector(31 downto 0);
signal mux_out : std_logic_vector(31 downto 0);

begin

  notter : not_gate_32 port map (x => b, z => b_not);
  muxer : mux_32 port map (sel => sub, src0 => b, src1=> b_not, z => mux_out); 
  adder : rippleadder32 port map (x => a, y=> mux_out, c => sub, z => z, cout => cout);
    
end architecture structural;

