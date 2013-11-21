-- NON WORKING STUB

library ieee;
use ieee.std_logic_1164.all;

entity processor_demo is
  port (
    z  : out std_logic_vector(31 downto 0)
  );
end processor_demo;

architecture structural of processor_demo is
component processor is
    generic (
        memfile	: string
     );
     port (
        clk  : in std_logic;
        aload :in std_logic_vector(31 downto 0);
        reset : in std_logic
     );
  end component processor;  
  signal clk : std_logic;
  signal rst : std_logic;
  signal aload: std_logic_vector(31 downto 0);
begin

demo_map : processor generic map (memfile => "/home/jdj560/single-cycle/bills_branch.dat") port map (clk => clk, aload => aload, reset => rst);
  
test_proc : process
  begin
    rst <= '1';
    wait for 400 ns;
    rst <= '0';
    clk <= '0';
    aload <= "00000000010000000000000000100000";
    wait for 400 ns;
    
    clk <= '1';
    wait for 400 ns;
    aload <= "00000000000000000000000000000000";
    clk <= '0';
    wait for 400 ns;
    clk <= '1';
    wait for 400 ns; 
    clk <= '0';
    wait for 400 ns;
    clk <= '1';
    wait for 400 ns;       
    wait;
  end process;
end architecture structural;

