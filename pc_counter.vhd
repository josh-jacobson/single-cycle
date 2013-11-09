library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity pc_counter is
  port (
    pcc       : out  std_logic_vector(31 downto 0);
    dc       : in  std_logic_vector(31 downto 0);
    clk       : in  std_logic;
  );
end pc_counter;

architecture structural of pc_counter;
 is
 component a32bitreg is
  port (
    q       : out  std_logic_vector(31 downto 0);
    d       : in  std_logic_vector(31 downto 0);
    clk       : in  std_logic;
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
 
 begin
 
 adder : rippleadder32 port map (x => d, y=> '0x4', c => '0', z => '0', cout => add_out);
 pcreg : a32bitreg port map (d => add_out, q=> pcc, clk => clk);
  
end architecture structural;
