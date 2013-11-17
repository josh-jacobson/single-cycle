library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity control_unit is
  port (
       funct  : in  std_logic_vector(5 downto 0);
       op_code : in  std_logic_vector(1 downto 0);
       alu_c : out std_logic_vector(2 downto 0)
    );
end control_unit;

architecture structural of control_unit is
	signal not_op : std_logic_vector(2 downto 0);
	signal not_funct : std_logic_vector(5 downto 0);
	signal radd : std_logic;
	signal rsub : std_logic;
	signal rand : std_logic;
	signal r_or : std_logic;
	signal rsll : std_logic;
	signal rslt : std_logic;
	signal op00 : std_logic;
	signal op01 : std_logic;

    begin
  
begin
	notop: not_gate_n generic map(n=>2) port map (x => op_code, z=> not_op);
	notfunct: not_gate_n generic map(n=>6) port map (x => funct, z=> not_funct);
	radder: pentand port map (x => funct(5) & not_funct(3) & not_funct(2) & not_funct(1) & not_funct(0), z => radd);
	rsubber: pentand port map (x => funct(5) & not_funct(3) & not_funct(2) & funct(1) & not_funct(0), z => radd);
	rander: pentand port map (x => funct(5) & not_funct(3) & funct(2) & not_funct(1) & not_funct(0), z => radd);
	rorrer: pentand port map (x => funct(5) & not_funct(3) & funct(2) & not_funct(1) & funct(0), z => radd);
	rsller: pentand port map (x => not_funct(5) & not_funct(3) & not_funct(2) & not_funct(1) & not_funct(0), z => radd);
	rslter: pentand port map (x => funct(5) & not_funct(3) & funct(2) & not_funct(1) & funct(0), z => radd);

	op00er: and_gate port map (x => not_op(1), y=> not_op(0), z=>op00);
	op01er: and_gate port map (x => not_op(1), y=> op(0), z=>op00);

	ctrl2 : or_3 port map (x=>r_or & rsll & rslt, z=>alu_c(2));
	ctrl1 : or_6 port map (x=>radd & rsub & rsll & rslt & op00 & op01, z=>alu_c(2));
	ctrl0 : or_3 port map (x=>rsub & rslt & op01, z=>alu_c(2));

end architecture structural;