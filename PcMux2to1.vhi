
-- VHDL Instantiation Created from source file PcMux2to1.vhd -- 20:03:22 06/08/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PcMux2to1
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_PcMux2to1: PcMux2to1 PORT MAP(
		a => ,
		b => ,
		sel => ,
		output => 
	);


