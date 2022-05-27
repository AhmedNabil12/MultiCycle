
-- VHDL Instantiation Created from source file SignExtend.vhd -- 18:54:40 06/07/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT SignExtend
	PORT(
		Immediate : IN std_logic_vector(15 downto 0);          
		SignExt : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_SignExtend: SignExtend PORT MAP(
		Immediate => ,
		SignExt => 
	);


