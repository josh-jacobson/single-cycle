library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity pc_counter is
  port (
    pcc       : out  std_logic_vector(31 downto 0);
    dc       : in  std_logic_vector(31 downto 0);
    ad        : in std_logic_vector(31 downto 0);
    aload      :in std_logic_vector(31 downto 0);
    clk       : in  std_logic;
    reset       : in  std_logic
  );
end pc_counter;

architecture structural of pc_counter is
 component pcreg is
  port (
    q       : out  std_logic_vector(31 downto 0);
    d       : in  std_logic_vector(31 downto 0);
    ad       : in  std_logic_vector(31 downto 0);    
    arst    : in  std_logic;
    aload   : in  std_logic_vector(31 downto 0);
    enable  : in  std_logic;
    clk       : in  std_logic
  );
 end component pcreg;

 signal add_out : std_logic_vector(31 downto 0);
 
 begin
 add_out <= dc(31 downto 2) & "00";
 
 pcreg_map : pcreg port map (d => add_out, ad=>ad, arst => reset, enable => '1', aload => aload, q=> pcc, clk => clk);
  
end architecture structural;
