
-- VHDL Instantiation Created from source file ALU_CONTROL.vhd -- 00:28:46 06/08/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ALU_CONTROL
	PORT(
		ALUop : IN std_logic_vector(1 downto 0);
		FunctField : IN std_logic_vector(5 downto 0);          
		OPERTATION : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_ALU_CONTROL: ALU_CONTROL PORT MAP(
		ALUop => ,
		FunctField => ,
		OPERTATION => 
	);


