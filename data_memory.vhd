library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;
entity data_memory is
port (
    clk : in std_logic;
    cs : in std_logic;
    oe : in std_logic;
    we : in std_logic;
    addr : std_logic_vector(31 downto 0);
    din : std_logic_vector(31 downto 0);
    dout :out std_logic_vector(31 downto 0)
);
end data_memory;
architecture structural  of  data_memory  is
begin
   sram_map  :  syncram
   generic  map  (mem_file  =>  "sort_corrected_branch.dat")
        port  map  (clk=> clk, cs  =>  cs,  oe  =>  oe,  we  =>  we,  addr  =>  addr,  din  =>  din,
dout  =>  dout);
end architecture;

