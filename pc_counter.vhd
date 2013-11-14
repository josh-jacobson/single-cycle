library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity pc_counter is
  port (
    pcc       : out  std_logic_vector(31 downto 0);
    dc       : in  std_logic_vector(31 downto 0);
    clk       : in  std_logic
  );
end pc_counter;

architecture structural of pc_counter is
 component a32bitreg is
  port (
    q       : out  std_logic_vector(31 downto 0);
    d       : in  std_logic_vector(31 downto 0);
    clk       : in  std_logic
  );
 end component a32bitreg;

 component rippleadder32 is
  port (
    x       : in  std_logic_vector(31 downto 0);
    y       : in  std_logic_vector(31 downto 0);
    c       : in  std_logic;
    z       : out std_logic_vector(31 downto 0);
    cout    : out std_logic
  );
 end component rippleadder32;

 signal add_out : std_logic_vector(31 downto 0);
 signal null_1 : std_logic;
 signal null_2 : std_logic;
 
 begin
 
 adder : rippleadder32 port map (x => dc, y=> "00000000000000000000000000000100", z => add_out, c=> null_1, cout => null_2);
 pcreg : a32bitreg port map (d => add_out, q=> pcc, clk => clk);
  
end architecture structural;
