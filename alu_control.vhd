library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity alu_control is
  port (
       funct  : in  std_logic_vector(5 downto 0);
       op_code : in  std_logic_vector(1 downto 0);
       alu_c : out std_logic_vector(2 downto 0)
    );
end alu_control;

architecture structural of alu_control is
    component and_6 is
               port (
                 x   : in  std_logic_vector(5 downto 0);
                 z   : out std_logic
               );
             end component and_6;
              component or_6 is
               port (
                 x   : in  std_logic_vector(5 downto 0);
                 z   : out std_logic
               );
             end component or_6;
              component or_3 is
               port (
                 x   : in  std_logic_vector(2 downto 0);
                 z   : out std_logic
               );
             end component or_3;
	signal not_op : std_logic_vector(1 downto 0);
	signal not_funct : std_logic_vector(5 downto 0);
	signal adds : std_logic_vector(5 downto 0);
	signal subs : std_logic_vector(5 downto 0);
	signal ors : std_logic_vector(5 downto 0);
	signal slls : std_logic_vector(5 downto 0);
	signal slts : std_logic_vector(5 downto 0);
	signal ands : std_logic_vector(5 downto 0);
	signal ctrl2s : std_logic_vector(2 downto 0);
	signal ctrl1s : std_logic_vector(5 downto 0);
	signal ctrl0s : std_logic_vector(2 downto 0);
	signal radd : std_logic;
	signal rsub : std_logic;
	signal rand : std_logic;
	signal r_or : std_logic;
	signal rsll : std_logic;
	signal rslt : std_logic;
	signal op00 : std_logic;
	signal op01 : std_logic;
	signal op10 : std_logic;
  
begin
	notop: not_gate_n generic map(n=>2) port map (x => op_code, z=> not_op);
	notfunct: not_gate_n generic map(n=>6) port map (x => funct, z=> not_funct);
	op10er : and_gate port map (x => op_code(1), y => not_op(0), z => op10);
	
	adds <= funct(5) & not_funct(3) & not_funct(2) & not_funct(1) & '1' & op10; -- addu support attmpt
	-- adds <= funct(5) & not_funct(3) & not_funct(2) & not_funct(1) & not_funct(0) & op10;
	radder: and_6 port map (x => adds, z => radd);
	subs <= funct(5) & not_funct(3) & not_funct(2) & funct(1) & not_funct(0) & op10;
	rsubber: and_6 port map (x => subs, z => rsub);
	ands <= funct(5) & not_funct(3) & funct(2) & not_funct(1) & not_funct(0) & op10;
	rander: and_6 port map (x => ands, z => rand);
	ors <= funct(5) & not_funct(3) & funct(2) & not_funct(1) & funct(0) & op10;
	rorrer: and_6 port map (x => ors, z => r_or);
	slls <= not_funct(5) & not_funct(3) & not_funct(2) & not_funct(1) & not_funct(0) & op10;
	rsller: and_6 port map (x => slls, z => rsll);
	slts <= funct(5) & funct(3) & not_funct(2) & funct(1) & not_funct(0) & op10;
	rslter: and_6 port map (x => slts, z => rslt);

	op00er: and_gate port map (x => not_op(1), y => not_op(0), z => op00);
	op01er: and_gate port map (x => not_op(1), y => op_code(0), z => op01);

   ctrl2s <= r_or & rsll & rslt;
   ctrl1s <= radd & rsub & rsll & rslt & op00 & op01;
   ctrl0s <= rsub & rslt & op01;
	ctrl2 : or_3 port map (x=>ctrl2s, z=>alu_c(2));
	ctrl1 : or_6 port map (x=>ctrl1s, z=>alu_c(1));
	ctrl0 : or_3 port map (x=>ctrl0s, z=>alu_c(0));

end architecture structural;