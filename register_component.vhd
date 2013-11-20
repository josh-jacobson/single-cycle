library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity register_component is
  port (
    busw    : in  std_logic_vector(31 downto 0);
    rd      : in  std_logic_vector(4 downto 0);
    rs      : in  std_logic_vector(4 downto 0);
    rt      : in  std_logic_vector(4 downto 0);
    busa    : out std_logic_vector(31 downto 0);
    busb    : out std_logic_vector(31 downto 0);
    clk     : in std_logic;
    reset     : in std_logic;
    we      : in std_logic
  );
end register_component;

architecture structural of register_component is
  
  component a32bitreg is
  port (
    q       : out  std_logic_vector(31 downto 0);
    d       : in  std_logic_vector(31 downto 0);
    arst    : in  std_logic;  -- async reset
    aload   : in  std_logic_vector(31 downto 0); -- async load (set to 0)
    enable  : in  std_logic;
    clk     : in  std_logic
  );
end component a32bitreg;

component a32input_mux is
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
end component a32input_mux;

component register_we_gen is
  port (
	we		 : in std_logic;
    sig      : in  std_logic_vector(4 downto 0);
    z        : out std_logic_vector(31 downto 0)
  );
end component register_we_gen;

subtype regis is std_logic_vector(31 downto 0);
type register_array is array (1 to 32) of regis;
signal regq : register_array;
signal regd : register_array;
signal rw_mux5 : std_logic_vector(31 downto 0);
signal write32 : std_logic_vector(31 downto 0);
signal testout : std_logic_vector(31 downto 0);
begin
--  regtest_map : a32bitreg port map
 --       (q => testout, d => testin, arst=> reset, clk => clk, aload => "00000000000000000000000000000000", enable => we);
  write_map : register_we_gen port map (we => we, sig => rd, z => write32); 
  REG_GEN: 
   for I in 1 to 32 generate
      regI_map : a32bitreg port map
        (q => regq(I), d => regd(I), arst=> reset, clk => clk, aload => "00000000000000000000000000000000", enable => write32(I-1));
        regd(I) <= busw;
   end generate REG_GEN;
   
   -- rw_muxmap : a32input_mux port map (r1 => testin, r2 => regd(2), r3 => regd(3), r4 => regd(4), r5 => regd(5), r6 => regd(6), r7 => regd(7), r8 => regd(8), r9 => regd(9), r10 => regd(10), r11 => regd(11), r12 => regd(12), r13 => regd(13), r14 => regd(14), r15 => regd(15), r16 => regd(16), r17 => regd(17), r18 => regd(18), r19 => regd(19), r20 => regd(20), r21 => regd(21), r22 => regd(22), r23 => regd(23), r24 => regd(24), r25 => regd(25), r26 => regd(26), r27 => regd(27), r28 => regd(28), r29 => regd(29), r30 => regd(30), r31 => regd(31), r32 => regd(32), sig => rd, z => rw_mux5); 
   -- rw_mux5 <= busw;
   ra_muxmap : a32input_mux port map (r1 => regq(1), r2 => regq(2), r3 => regq(3), r4 => regq(4), r5 => regq(5), r6 => regq(6), r7 => regq(7), r8 => regq(8), r9 => regq(9), r10 => regq(10), r11 => regq(11), r12 => regq(12), r13 => regq(13), r14 => regq(14), r15 => regq(15), r16 => regq(16), r17 => regq(17), r18 => regq(18), r19 => regq(19), r20 => regq(20), r21 => regq(21), r22 => regq(22), r23 => regq(23), r24 => regq(24), r25 => regq(25), r26 => regq(26), r27 => regq(27), r28 => regq(28), r29 => regq(29), r30 => regq(30), r31 => regq(31), r32 => regq(32), sig => rs, z => busa); 

   rb_muxmap : a32input_mux port map (r1 => regq(1), r2 => regq(2), r3 => regq(3), r4 => regq(4), r5 => regq(5), r6 => regq(6), r7 => regq(7), r8 => regq(8), r9 => regq(9), r10 => regq(10), r11 => regq(11), r12 => regq(12), r13 => regq(13), r14 => regq(14), r15 => regq(15), r16 => regq(16), r17 => regq(17), r18 => regq(18), r19 => regq(19), r20 => regq(20), r21 => regq(21), r22 => regq(22), r23 => regq(23), r24 => regq(24), r25 => regq(25), r26 => regq(26), r27 => regq(27), r28 => regq(28), r29 => regq(29), r30 => regq(30), r31 => regq(31), r32 => regq(32), sig => rt, z => busb); 
      
  
end architecture structural;


