
-- VHDL Instantiation Created from source file PcAdder2.vhd -- 19:24:24 06/08/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PcAdder2
	PORT(
		PcOld : IN std_logic_vector(31 downto 0);
		Update : IN std_logic_vector(31 downto 0);          
		PcPlusFour : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_PcAdder2: PcAdder2 PORT MAP(
		PcOld => ,
		Update => ,
		PcPlusFour => 
	);


