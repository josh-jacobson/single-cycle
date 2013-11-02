library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity overflower is
  port (
    a       : in  std_logic;
    b       : in  std_logic;
    zin       : in std_logic;
    sel     : in  std_logic;
    ovf     : out std_logic
  );
end overflower;

architecture structural of overflower is

component tripleand is
  port (
    x       : in  std_logic;
    y       : in  std_logic;
    c       : in  std_logic;
    z       : out std_logic
  );
end component tripleand;

  signal nota : std_logic;
  signal notb : std_logic;
  signal notzin : std_logic;
  signal add_and1 : std_logic;
  signal add_and2 : std_logic;
  signal sub_and1 : std_logic;
  signal sub_and2 : std_logic;
  signal ovfresultand : std_logic;
  signal ovfresultsub : std_logic;
  
  signal lazy : std_logic_vector(2 downto 0);
begin

  nottera : not_gate port map (x => a, z => nota);
  notterb : not_gate port map (x => b, z => notb);
  notterc : not_gate port map (x => zin, z => notzin);
  addander1 : tripleand port map (x => a, y => b, c => notzin, z=> add_and1);
  addander2 : tripleand port map (x => nota, y => notb, c => zin, z=> add_and2);
  subander1 : tripleand port map (x => a, y => notb, c => zin, z=> sub_and1);
  subander2 : tripleand port map (x => nota, y => b, c => notzin, z=> sub_and2);
  orrerand : or_gate port map (x => add_and1, y => add_and2, z => ovfresultand);
  orrersub : or_gate port map (x => sub_and1, y => sub_and2, z => ovfresultsub);
  muxer : mux port map (sel => sel, src0 => ovfresultand, src1=> ovfresultsub, z => ovf); 
  
    
end architecture structural;


