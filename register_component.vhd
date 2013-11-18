library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity register_component is
  port (
    busw    : in  std_logic_vector(31 downto 0);
    rw      : in  std_logic_vector(4 downto 0);
    ra      : in  std_logic_vector(4 downto 0);
    rb      : in  std_logic_vector(4 downto 0);
    busa    : out std_logic_vector(31 downto 0);
    busb    : out std_logic_vector(31 downto 0);
    clk     : in std_logic;
    we      : in std_logic
  );
end register_component;

architecture structural of register_component is
  
  component a32bitreg is
  port (
    q       : out  std_logic_vector(31 downto 0);
    d       : in  std_logic_vector(31 downto 0);
    arst    : in  std_logic;
    aload   : in  std_logic_vector(31 downto 0);
    enable  : in  std_logic;
    clk     : in  std_logic
  );
end component a32bitreg;

subtype regis is std_logic_vector(31 downto 0);
type register_array is array (0 to 31) of regis;
signal regq : register_array;
signal regd : register_array;
signal allregq : std_logic_vector(1023 downto 0);
signal rw_mux1 : std_logic_vector(511 downto 0);
signal rw_mux2 : std_logic_vector(255 downto 0);


begin
  REG_GEN: 
   for I in 0 to 31 generate
      regint_map : a32bitreg port map
        (q => regq(I), d => regd(I), arst=> '0', clk => clk, aload => "00000000000000000000000000000000", enable => we);
   end generate REG_GEN;
   
   allregq <= regq(0) & regq(1) & regq(2) & regq(3) & regq(4) & regq(5) & regq(6) & regq(7) & regq(8) & regq(9) & regq(10) & regq(11) & regq(12) & regq(13) & regq(14) & regq(15) & regq(16) & regq(17) & regq(18) & regq(19) & regq(20) & regq(21) & regq(22) & regq(23) & regq(24) & regq(25) & regq(26) & regq(27) & regq(28) & regq(29) & regq(30) & regq(31);
  -- allregd <= regd(0) & regd(1) & regd(2) & regd(3) & regd(4) & regd(5) & regd(6) & regd(7) & regd(8) & regd(9) & regd(10) & regd(11) & regd(12) & regd(13) & regd(14) & regd(15) & regd(16) & regd(17) & regd(18) & regd(19) & regd(20) & regd(21) & regd(22) & regd(23) & regd(24) & regd(25) & regd(26) & regd(27) & regd(28) & regd(29) & regd(30) & regd(31);

   lt1 : mux_n port map (n => 512, sel => rw(0), src0 => allregq(1023 downto 512), src1=> allregq(511 downto 0), z => rw_mux1);
   lt2 : mux_n port map (n => 256, sel => rw(1), src0 => rw_mux2(511 downto 256), src1=> allregq(255 downto 0), z => rw_mux2);
  
end architecture structural;

