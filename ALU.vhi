
-- VHDL Instantiation Created from source file ALU.vhd -- 00:27:59 06/08/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ALU
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		Operation : IN std_logic_vector(3 downto 0);          
		Zero : OUT std_logic;
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_ALU: ALU PORT MAP(
		A => ,
		B => ,
		Operation => ,
		Zero => ,
		C => 
	);


