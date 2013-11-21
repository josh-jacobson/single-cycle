library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity pcreg is
port (
q       : out  std_logic_vector(31 downto 0);
d       : in  std_logic_vector(31 downto 0);
ad      : in  std_logic_vector(31 downto 0);
arst    : in  std_logic;
aload   : in  std_logic_vector(31 downto 0);
enable  : in  std_logic;
clk     : in  std_logic
);
end pcreg;

architecture structural of pcreg is

begin

FF_GEN: 
for I in 0 to 31 generate
dffint_map : dffr_a port map
(d => d(I), arst => arst, aload  => aload(I), enable => enable, adata => ad(I), q => q(I), clk=> clk);
end generate FF_GEN;

end architecture structural;

