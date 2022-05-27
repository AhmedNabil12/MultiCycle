
-- VHDL Instantiation Created from source file Pc.vhd -- 16:04:20 06/07/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Pc
	PORT(
		PcNew : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;          
		PcCurrent : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Pc: Pc PORT MAP(
		PcNew => ,
		PcCurrent => ,
		clk => 
	);


