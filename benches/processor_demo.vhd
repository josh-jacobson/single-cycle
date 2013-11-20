-- NON WORKING STUB

library ieee;
use ieee.std_logic_1164.all;

entity processor_demo is
  port (
    z  : out std_logic_vector(31 downto 0);
  );
end processor_demo;

architecture structural of processor_demo is
component processor is
    generic (
        n	: string
     );
     port (
        clk  : in std_logic;
     );
  end component processor;  
begin

demo_map : processor generic (n => "filename.dat") port map (dc => yin, clk => cin, reset => reset, pcc => z);
  
test_proc : process
  begin
    
    wait;
  end process;
end architecture structural;

