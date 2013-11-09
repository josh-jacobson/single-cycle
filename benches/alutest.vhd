library ieee;
use ieee.std_logic_1164.all;

entity alutest is
  port (
    z       : out std_logic_vector(31 downto 0);
    cout    : out std_logic;
    zero    : out std_logic;
    ovf     : out std_logic
  );
end alutest;

architecture structural of alutest is
component ALU is
   port ( signal A, B: in std_logic_vector (31 downto 0);
           signal m: in std_logic_vector (3 downto 0);
           signal S: out std_logic_vector (31 downto 0);
           signal c: out std_logic;
           signal zero: out std_logic;
           signal ovf: out std_logic);
end component ALU;
signal xin : std_logic_vector(31 downto 0);
signal yin : std_logic_vector(31 downto 0);
signal cin : std_logic_vector(3 downto 0);
begin
  addsub_map : alu port map (A => xin, B => yin, m => cin, S => z, c => cout, ovf => ovf, zero => zero);
  test_proc : process
  begin
    xin <= "00001000000000100001001000000000";
    yin <= "01110101111111111111110101111111";
    cin <= "0000";
    wait for 5 ns;
    xin <= "00011001000100010001000100010001";
    yin <= "00110011001100110011001100110011";
    cin <= "0001";
    wait for 5 ns;
    xin <= "01000100010001000100010001000100";
    yin <= "01110111011101110111011101110111";
    cin <= "0010";
    wait for 5 ns;
    xin <= "00000000000000000000000000000000";
    yin <= "00000000000000000000000000000000";
    cin <= "0010";
    wait for 5 ns;
    xin <= "00010001000100010001000100010001";
    yin <= "00110011001100110011001100110011";
    cin <= "0011";
    wait for 5 ns;
    xin <= "01000100010001000100010001000100";
    yin <= "01110111011101110111011101110111";
    cin <= "0110";
    wait for 5 ns;
    xin <= "00100100010001000100010001000100";
    yin <= "01110111011101110111011101110111";
    cin <= "0111";
    wait for 5 ns;
    xin <= "01000100010001000100010001000100";
    yin <= "00110111011101110111011101110111";
    cin <= "0111";
    wait for 5 ns;
    wait;
  end process;
end architecture structural;


