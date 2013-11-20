library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity a32input_mux is
  port (
	r1       : in  std_logic_vector(31 downto 0);
	r2       : in  std_logic_vector(31 downto 0);
	r3       : in  std_logic_vector(31 downto 0);
	r4       : in  std_logic_vector(31 downto 0);
	r5       : in  std_logic_vector(31 downto 0);
	r6       : in  std_logic_vector(31 downto 0);
	r7       : in  std_logic_vector(31 downto 0);
	r8       : in  std_logic_vector(31 downto 0);
	r9       : in  std_logic_vector(31 downto 0);
	r10       : in  std_logic_vector(31 downto 0);
	r11       : in  std_logic_vector(31 downto 0);
	r12       : in  std_logic_vector(31 downto 0);
	r13       : in  std_logic_vector(31 downto 0);
	r14       : in  std_logic_vector(31 downto 0);
	r15       : in  std_logic_vector(31 downto 0);
	r16       : in  std_logic_vector(31 downto 0);
	r17       : in  std_logic_vector(31 downto 0);
	r18       : in  std_logic_vector(31 downto 0);
	r19       : in  std_logic_vector(31 downto 0);
	r20       : in  std_logic_vector(31 downto 0);
	r21       : in  std_logic_vector(31 downto 0);
	r22       : in  std_logic_vector(31 downto 0);
	r23       : in  std_logic_vector(31 downto 0);
	r24       : in  std_logic_vector(31 downto 0);
	r25       : in  std_logic_vector(31 downto 0);
	r26       : in  std_logic_vector(31 downto 0);
	r27       : in  std_logic_vector(31 downto 0);
	r28       : in  std_logic_vector(31 downto 0);
	r29       : in  std_logic_vector(31 downto 0);
	r30       : in  std_logic_vector(31 downto 0);
	r31       : in  std_logic_vector(31 downto 0);
	r32       : in  std_logic_vector(31 downto 0);
    sig      : in  std_logic_vector(4 downto 0);
    z        : out std_logic_vector(31 downto 0)
  );
end a32input_mux;

architecture structural of a32input_mux is

signal    o1       :  std_logic_vector(31 downto 0);
signal    o2       :  std_logic_vector(31 downto 0);
signal    o3       :  std_logic_vector(31 downto 0);
signal    o4       :  std_logic_vector(31 downto 0);
signal    o5       :  std_logic_vector(31 downto 0);
signal    o6       :  std_logic_vector(31 downto 0);
signal    o7       :  std_logic_vector(31 downto 0);
signal    o8       :  std_logic_vector(31 downto 0);
signal    o9       :  std_logic_vector(31 downto 0);
signal    o10       :  std_logic_vector(31 downto 0);
signal    o11       :  std_logic_vector(31 downto 0);
signal    o12       :  std_logic_vector(31 downto 0);
signal    o13       :  std_logic_vector(31 downto 0);
signal    o14       :  std_logic_vector(31 downto 0);
signal    o15       :  std_logic_vector(31 downto 0);
signal    o16       :  std_logic_vector(31 downto 0);


signal    a1       :  std_logic_vector(31 downto 0);
signal    b1       :  std_logic_vector(31 downto 0);
signal    a2       :  std_logic_vector(31 downto 0);
signal    b2       :  std_logic_vector(31 downto 0);
signal    a3       :  std_logic_vector(31 downto 0);
signal    b3       :  std_logic_vector(31 downto 0);
signal    a4       :  std_logic_vector(31 downto 0);
signal    b4       :  std_logic_vector(31 downto 0);    

signal res1 : std_logic_vector(31 downto 0);
signal res2 : std_logic_vector(31 downto 0);
signal res3 : std_logic_vector(31 downto 0);
signal res4 : std_logic_vector(31 downto 0);

signal nt1 : std_logic_vector(31 downto 0);
signal nt2 : std_logic_vector(31 downto 0);

begin

  ft1 : mux_32 port map (sel => sig(0), src0 => r1, src1=> r17, z => o1); 
  ft2 : mux_32 port map (sel => sig(0), src0 => r2, src1=> r18, z => o2); 
  ft3 : mux_32 port map (sel => sig(0), src0 => r3, src1=> r19, z => o3); 
  ft4 : mux_32 port map (sel => sig(0), src0 => r4, src1=> r20, z => o4); 
  ft5 : mux_32 port map (sel => sig(0), src0 => r5, src1=> r21, z => o5); 
  ft6 : mux_32 port map (sel => sig(0), src0 => r6, src1=> r22, z => o6); 
  ft7 : mux_32 port map (sel => sig(0), src0 => r7, src1=> r23, z => o7); 
  ft8 : mux_32 port map (sel => sig(0), src0 => r8, src1=> r24, z => o8); 
  st1 : mux_32 port map (sel => sig(0), src0 => r9, src1=> r25, z => o9); 
  st2 : mux_32 port map (sel => sig(0), src0 => r10, src1=> r26, z => o10); 
  st3 : mux_32 port map (sel => sig(0), src0 => r11, src1=> r27, z => o11); 
  st4 : mux_32 port map (sel => sig(0), src0 => r12, src1=> r28, z => o12); 
  st5 : mux_32 port map (sel => sig(0), src0 => r13, src1=> r29, z => o13); 
  st6 : mux_32 port map (sel => sig(0), src0 => r14, src1=> r30, z => o14); 
  st7 : mux_32 port map (sel => sig(0), src0 => r15, src1=> r31, z => o15); 
  st8 : mux_32 port map (sel => sig(0), src0 => r16, src1=> r32, z => o16); 
  

  nnt1 : mux_32 port map (sel => sig(1), src0 => o1, src1=> o9, z => a1); 
  nnt2 : mux_32 port map (sel => sig(1), src0 => o2, src1=> o10, z => a2); 
  nnt3 : mux_32 port map (sel => sig(1), src0 => o3, src1=> o11, z => a3); 
  nnt4 : mux_32 port map (sel => sig(1), src0 => o4, src1=> o12, z => a4); 
  nnt5 : mux_32 port map (sel => sig(1), src0 => o5, src1=> o13, z => b1); 
  nnt6 : mux_32 port map (sel => sig(1), src0 => o6, src1=> o14, z => b2); 
  nnt7 : mux_32 port map (sel => sig(1), src0 => o7, src1=> o15, z => b3); 
  nnt8 : mux_32 port map (sel => sig(1), src0 => o8, src1=> o16, z => b4); 
  
  lt1 : mux_32 port map (sel => sig(2), src0 => a1, src1=> b1, z => res1); 
  lt2 : mux_32 port map (sel => sig(2), src0 => a2, src1=> b2, z => res2); 
  lt3 : mux_32 port map (sel => sig(2), src0 => a3, src1=> b3, z => res3); 
  lt4 : mux_32 port map (sel => sig(2), src0 => a4, src1=> b4, z => res4); 
    
  mt1 : mux_32 port map (sel => sig(3), src0 => res1, src1=> res2, z => nt1); 
  mt2 : mux_32 port map (sel => sig(3), src0 => res3, src1=> res4, z => nt2);
  
  ut : mux_32 port map (sel => sig(4), src0 => nt1, src1=> nt2, z => z);  
    
end architecture structural;

