
-- VHDL Instantiation Created from source file mux2to1_memoryMux.vhd -- 22:04:31 06/09/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT mux2to1_memoryMux
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_mux2to1_memoryMux: mux2to1_memoryMux PORT MAP(
		a => ,
		b => ,
		sel => ,
		output => 
	);


