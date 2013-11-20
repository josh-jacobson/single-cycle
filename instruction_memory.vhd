library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
use work.eecs361.all;
entity instruction_memory is
generic (
	mem_file : string
  );
port (
    addr : std_logic_vector(31 downto 0);
    inst :out std_logic_vector(31 downto 0)
);
end instruction_memory;
architecture structural  of  instruction_memory  is
   component sram is
       generic ( mem_file : string );
       port (
           cs : in std_logic;
           oe : in std_logic;
           we : in std_logic;
           addr : in std_logic_vector(31 downto 0);
           din : in std_logic_vector(31 downto 0);
           dout : out std_logic_vector(31 downto 0)
        );
    end component sram;
begin
   sram_map  :  sram
   generic  map  (mem_file  =>  mem_file)
        port  map  (cs  =>  '1',  oe  =>  '1',  we  =>  '0',  addr  =>  addr,  din  =>  "00000000000000000000000000000000",
dout  =>  inst);
end architecture;