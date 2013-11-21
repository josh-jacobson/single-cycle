library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity ALU is
   port ( signal A, B: in std_logic_vector (31 downto 0);
           signal m: in std_logic_vector (2 downto 0);
           signal S: out std_logic_vector (31 downto 0);
           signal c: out std_logic;
           signal zero: out std_logic;
           signal ovf: out std_logic);
end ALU;

architecture structural of ALU is
component add_sub32 is
  port (
    a       : in  std_logic_vector(31 downto 0);
    b       : in  std_logic_vector(31 downto 0);
    sub       : in  std_logic;
    z       : out std_logic_vector(31 downto 0);
    cout    : out std_logic
  );
end component add_sub32;
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
component bitshifter32 is
  port (
    a       : in  std_logic_vector(31 downto 0);
    sig      : in  std_logic_vector(4 downto 0);
    z        : out std_logic_vector(31 downto 0)
  );
end component bitshifter32;
component overflower is
  port (
    a       : in  std_logic;
    b       : in  std_logic;
    zin       : in std_logic;
    sel     : in  std_logic;
    ovf     : out std_logic
  );
end component overflower;
component zero32 is
  port (
    a       : in  std_logic_vector(31 downto 0);
    outp     : out std_logic
  );
end component zero32;

signal not_out   : std_logic_vector(31 downto 0);
signal and_out   : std_logic_vector(31 downto 0);
signal or_out   : std_logic_vector(31 downto 0);
signal addsub_out : std_logic_vector(31 downto 0);
signal sll_out : std_logic_vector(31 downto 0);
signal slt_out : std_logic_vector(31 downto 0);
signal dontcare_vector : std_logic_vector(31 downto 0);

signal d_out : std_logic_vector(31 downto 0);

begin

  shifter: bitshifter32 port map (a => A, sig => B(4 downto 0), z => sll_out);
  orrer: or_gate_32 port map (x => A, y => B, z=> or_out);
  ander: and_gate_32 port map (x => A, y => B, z=> and_out);
  addsubber: add_sub32 port map (a => A, b => B, sub => m(0), z => addsub_out, cout => c);
  zeroout: zero32 port map (a => addsub_out, outp=> zero);
  slt_out<= "0000000000000000000000000000000"&addsub_out(31);
  oflow: overflower port map (a => A(31), b => B(31), zin => addsub_out(31), sel => m(0), ovf => ovf);
  final_out: a8input_mux port map (a1 => and_out, b1 => or_out, a2 => addsub_out, b2 => addsub_out, a3 => dontcare_vector, b3 => dontcare_vector, a4 => sll_out, b4 => slt_out, z=> S, sig=>m(2 downto 0));
    
end architecture structural;
