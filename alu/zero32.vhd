library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity zero32 is
  port (
    a       : in  std_logic_vector(31 downto 0);
    outp     : out std_logic
  );
end zero32;

architecture structural of zero32 is
  
  signal roundresult : std_logic_vector(15 downto 0);
  signal nextresult : std_logic_vector(7 downto 0);
  signal almostresult : std_logic_vector(3 downto 0);
  signal lastresult : std_logic_vector(1 downto 0);
  signal needsnot : std_logic;

begin

  orrerand1 : or_gate port map (x => a(31), y => a(30), z => roundresult(15));
  orrerand2 : or_gate port map (x => a(29), y => a(28), z => roundresult(14));
  orrerand3 : or_gate port map (x => a(27), y => a(26), z => roundresult(13));
  orrerand4 : or_gate port map (x => a(25), y => a(24), z => roundresult(12));
  orrerand5 : or_gate port map (x => a(23), y => a(22), z => roundresult(11));
  orrerand6 : or_gate port map (x => a(21), y => a(20), z => roundresult(10));
  orrerand7 : or_gate port map (x => a(19), y => a(18), z => roundresult(9));
  orrerand8 : or_gate port map (x => a(17), y => a(16), z => roundresult(8));
  orrerand9 : or_gate port map (x => a(15), y => a(14), z => roundresult(7));
  orrerand10 : or_gate port map (x => a(13), y => a(12), z => roundresult(6));
  orrerand11 : or_gate port map (x => a(11), y => a(10), z => roundresult(5));
  orrerand12 : or_gate port map (x => a(9), y => a(8), z => roundresult(4));
  orrerand13 : or_gate port map (x => a(7), y => a(6), z => roundresult(3));
  orrerand14 : or_gate port map (x => a(5), y => a(4), z => roundresult(2));
  orrerand15 : or_gate port map (x => a(3), y => a(2), z => roundresult(1));
  orrerand16 : or_gate port map (x => a(1), y => a(0), z => roundresult(0));
    
  orrerand17 : or_gate port map (x => roundresult(15), y => roundresult(14), z => nextresult(7));
  orrerand18 : or_gate port map (x => roundresult(13), y => roundresult(12), z => nextresult(6));
  orrerand19 : or_gate port map (x => roundresult(11), y => roundresult(10), z => nextresult(5));
  orrerand20 : or_gate port map (x => roundresult(9), y => roundresult(8), z => nextresult(4));
  orrerand21 : or_gate port map (x => roundresult(7), y => roundresult(6), z => nextresult(3));
  orrerand22 : or_gate port map (x => roundresult(5), y => roundresult(4), z => nextresult(2));
  orrerand23 : or_gate port map (x => roundresult(3), y => roundresult(2), z => nextresult(1));
  orrerand24 : or_gate port map (x => roundresult(1), y => roundresult(0), z => nextresult(0));
    
  orrerand25 : or_gate port map (x => nextresult(7), y => nextresult(6), z => almostresult(3));
  orrerand26 : or_gate port map (x => nextresult(5), y => nextresult(4), z => almostresult(2));
  orrerand27 : or_gate port map (x => nextresult(3), y => nextresult(2), z => almostresult(1));
  orrerand28 : or_gate port map (x => nextresult(1), y => nextresult(0), z => almostresult(0));
    
  orrerand29 : or_gate port map (x => almostresult(3), y => almostresult(2), z => lastresult(1));
  orrerand30 : or_gate port map (x => almostresult(1), y => almostresult(0), z => lastresult(0));
    
  orrerand31 : or_gate port map (x => lastresult(1), y => lastresult(0), z => needsnot);
    
  nottera : not_gate port map (x => needsnot, z => outp);

  
    
end architecture structural;



