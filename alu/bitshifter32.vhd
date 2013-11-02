library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity bitshifter32 is
  port (
    a       : in  std_logic_vector(31 downto 0);
    sig      : in  std_logic_vector(4 downto 0);
    z        : out std_logic_vector(31 downto 0)
  );
end bitshifter32;

architecture structural of bitshifter32 is

signal shift1 : std_logic_vector(31 downto 0);
signal shift2 : std_logic_vector(31 downto 0);
signal shift3 : std_logic_vector(31 downto 0);
signal shift4 : std_logic_vector(31 downto 0);
signal single_shift : std_logic_vector(31 downto 0);
signal double_shift : std_logic_vector(31 downto 0);
signal quad_shift : std_logic_vector(31 downto 0);
signal hect_shift : std_logic_vector(31 downto 0);
signal juuroku_shift : std_logic_vector(31 downto 0);


begin
  single_shift<=a(30)& a(29)& a(28)& a(27)& a(26)& a(25)& a(24)& a(23)& a(22)& a(21)& a(20)& a(19)& a(18)& a(17)& a(16)& a(15)& a(14)& a(13)& a(12)& a(11)& a(10)& a(9)& a(8)& a(7)& a(6)& a(5)& a(4)& a(3)& a(2)& a(1)& a(0)& '0';
  lt1 : mux_32 port map (sel => sig(0), src0 => a, src1=> single_shift, z => shift1);
  double_shift<=shift1(29)& shift1(28)& shift1(27)& shift1(26)& shift1(25)& shift1(24)& shift1(23)& shift1(22)& shift1(21)& shift1(20)& shift1(19)& shift1(18)& shift1(17)& shift1(16)& shift1(15)& shift1(14)& shift1(13)& shift1(12)& shift1(11)& shift1(10)& shift1(9)& shift1(8)& shift1(7)& shift1(6)& shift1(5)& shift1(4)& shift1(3)& shift1(2)& shift1(1)& shift1(0)& '0' & '0';
  lt2 : mux_32 port map (sel => sig(1), src0 => shift1, src1=> double_shift, z => shift2);
  quad_shift<=shift2(27)& shift2(26)& shift2(25)& shift2(24)& shift2(23)& shift2(22)& shift2(21)& shift2(20)& shift2(19)& shift2(18)& shift2(17)& shift2(16)& shift2(15)& shift2(14)& shift2(13)& shift2(12)& shift2(11)& shift2(10)& shift2(9)& shift2(8)& shift2(7)& shift2(6)& shift2(5)& shift2(4)& shift2(3)& shift2(2)& shift2(1)& shift2(0)& '0' & '0' & '0' & '0';
  lt3 : mux_32 port map (sel => sig(2), src0 => shift2, src1=> quad_shift, z => shift3);
  hect_shift<=shift3(23)& shift3(22)& shift3(21)& shift3(20)& shift3(19)& shift3(18)& shift3(17)& shift3(16)& shift3(15)& shift3(14)& shift3(13)& shift3(12)& shift3(11)& shift3(10)& shift3(9)& shift3(8)& shift3(7)& shift3(6)& shift3(5)& shift3(4)& shift3(3)& shift3(2)& shift3(1)& shift3(0)& '0' & '0' & '0' & '0'& '0' & '0' & '0' & '0';
  lt4 : mux_32 port map (sel => sig(3), src0 => shift3, src1=> hect_shift, z => shift4);
  juuroku_shift<= shift4(15)& shift4(14)& shift4(13)& shift4(12)& shift4(11)& shift4(10)& shift4(9)& shift4(8)& shift4(7)& shift4(6)& shift4(5)& shift4(4)& shift4(3)& shift4(2)& shift4(1)& shift4(0)& '0' & '0' & '0' & '0'& '0' & '0' & '0' & '0'& '0' & '0' & '0' & '0'& '0' & '0' & '0' & '0';
  lt5 : mux_32 port map (sel => sig(4), src0 => shift4, src1=> juuroku_shift, z => z);
end architecture structural;


