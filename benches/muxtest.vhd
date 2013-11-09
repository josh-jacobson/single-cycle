library ieee;
use ieee.std_logic_1164.all;

entity muxtest is
  port (
    z       : out std_logic_vector(31 downto 0)
  );
end muxtest;

architecture structural of muxtest is
component a8input_mux is
  port (
    a1       : in  std_logic_vector(31 downto 0);
    b1       : in  std_logic_vector(31 downto 0);
    a2       : in  std_logic_vector(31 downto 0);
    b2       : in  std_logic_vector(31 downto 0);
    a3       : in  std_logic_vector(31 downto 0);
    b3       : in  std_logic_vector(31 downto 0);
    a4       : in  std_logic_vector(31 downto 0);
    b4       : in  std_logic_vector(31 downto 0);
    sig      : in  std_logic_vector(2 downto 0);
    z        : out std_logic_vector(31 downto 0)
  );
  end component a8input_mux;
signal xin1 : std_logic_vector(31 downto 0);
signal yin1 : std_logic_vector(31 downto 0);
signal xin2 : std_logic_vector(31 downto 0);
signal yin2 : std_logic_vector(31 downto 0);
signal xin3 : std_logic_vector(31 downto 0);
signal yin3 : std_logic_vector(31 downto 0);
signal xin4 : std_logic_vector(31 downto 0);
signal yin4 : std_logic_vector(31 downto 0);
signal cin : std_logic_vector(2 downto 0);
begin
  mux_map : a8input_mux port map (a1 => xin1, b1 => yin1, a2 => xin2, b2 => yin2, a3 => xin3, b3 => yin3, a4 => xin4, b4 => yin4, sig => cin, z => z);
  test_proc : process
  begin
    xin1 <= "00000000000000000000000000000000";
    yin1 <= "01111111111111111111111111111111";
    xin2 <= "10000000000000000000000000000000";
    yin2 <= "10111111111111111111111111111111";
    xin3 <= "01000000000000000000000000000000";
    yin3 <= "11011111111111111111111111111111";
    xin4 <= "00100000000000000000000000000000";
    yin4 <= "11101111111111111111111111111111";
    cin <= "000";
    wait for 5 ns;
    cin <= "001";
    wait for 5 ns;
    cin <= "010";
    wait for 5 ns;
    cin <= "011";
    wait for 5 ns;
    cin <= "100";
    wait for 5 ns;
    cin <= "101";
    wait for 5 ns;
    cin <= "110";
    wait for 5 ns;
    cin <= "111";
    wait for 5 ns;
    wait;
  end process;
end architecture structural;


