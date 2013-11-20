library ieee;
use ieee.std_logic_1164.all;

entity alu_control_test is
  port (
    c       : out std_logic_vector(2 downto 0)
  );
end alu_control_test;

architecture structural of alu_control_test is

component alu_control is
  port (
    funct   : in  std_logic_vector(5 downto 0);
    op_code : in std_logic_vector(1 downto 0);
    alu_c   : out std_logic_vector(2 downto 0)
  );
end component alu_control;

signal a : std_logic_vector(5 downto 0);
signal b : std_logic_vector(1 downto 0);
begin
  alu_control_map : alu_control port map (funct => a, op_code => b, alu_c => c);
  test_proc : process
  begin
    b <= "10";
    a <= "100000";
    wait for 5 ns;
    a <= "100010";
    wait for 5 ns;
    a <= "100100";
    wait for 5 ns;
    a <= "100101";
    wait for 5 ns;
    a <= "000000";
    wait for 5 ns;
    a <= "101010";
    wait for 5 ns;
    b <= "01";
    a <= "100000";
    wait for 5 ns;
    a <= "100010";
    wait for 5 ns;
    a <= "100100";
    wait for 5 ns;
    a <= "100101";
    wait for 5 ns;
    a <= "000000";
    wait for 5 ns;
    a <= "101010";
    wait for 5 ns;  
    b <= "00";
    a <= "100000";
    wait for 5 ns;
    a <= "100010";
    wait for 5 ns;
    a <= "100100";
    wait for 5 ns;
    a <= "100101";
    wait for 5 ns;
    a <= "000000";
    wait for 5 ns;
    a <= "101010";
    wait for 5 ns;  
    wait;
  end process;
end architecture structural;

