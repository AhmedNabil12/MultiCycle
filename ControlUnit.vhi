
-- VHDL Instantiation Created from source file ControlUnit.vhd -- 22:03:20 06/07/2021
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ControlUnit
	PORT(
		OP : IN std_logic_vector(5 downto 0);          
		REGDST : OUT std_logic;
		ALUSRC : OUT std_logic;
		MEMTOREG : OUT std_logic;
		REGWRITE : OUT std_logic;
		MEMREAD : OUT std_logic;
		MEMWRITE : OUT std_logic;
		BRANCH : OUT std_logic;
		ALUOP : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	Inst_ControlUnit: ControlUnit PORT MAP(
		OP => ,
		REGDST => ,
		ALUSRC => ,
		MEMTOREG => ,
		REGWRITE => ,
		MEMREAD => ,
		MEMWRITE => ,
		BRANCH => ,
		ALUOP => 
	);


