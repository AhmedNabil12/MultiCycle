----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:07 06/07/2021 
-- Design Name: 
-- Module Name:    MIPS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MIPS is
    Port ( clk : in  STD_LOGIC);
end MIPS;

architecture Behavioral of MIPS is

	COMPONENT Register_File
	PORT(
		Read_Reg1 : IN std_logic_vector(4 downto 0);
		Read_Reg2 : IN std_logic_vector(4 downto 0);
		Write_Reg : IN std_logic_vector(4 downto 0);
		Write_Data : IN std_logic_vector(31 downto 0);
		RegWrite : IN std_logic;
		clk : IN std_logic;          
		Read_Data_1 : OUT std_logic_vector(31 downto 0);
		Read_Data_2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mux2to1_memoryMux
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PcMux2to1
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALUMUX2to1
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT Pc
	PORT(
		PcNew : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;          
		PcCurrent : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT InstructionMemory
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;          
		Instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PcAdder
	PORT(
		PcOld : IN std_logic_vector(31 downto 0);
		Update : IN std_logic_vector(31 downto 0);          
		PcPlusFour : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	

	COMPONENT ShiftLeft2
	PORT(
		input : IN std_logic_vector(31 downto 0);          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT SignExtend
	PORT(
		Immediate : IN std_logic_vector(15 downto 0);          
		SignExt : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
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
	
	COMPONENT Data_Memory
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		MemRead : IN std_logic;
		MemWrite : IN std_logic;
		Clk : IN std_logic;
		WriteData : IN std_logic_vector(31 downto 0);          
		ReadData : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT ALU
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		Operation : IN std_logic_vector(3 downto 0);          
		Zero : OUT std_logic;
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU_CONTROL
	PORT(
		ALUop : IN std_logic_vector(1 downto 0);
		FunctField : IN std_logic_vector(5 downto 0);          
		OPERTATION : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
		COMPONENT PcAdder2
	PORT(
		PcOld : IN std_logic_vector(31 downto 0);
		Update : IN std_logic_vector(31 downto 0);          
		PcPlusFour : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT mux2to2FORreg
	PORT(
		a : IN std_logic_vector(4 downto 0);
		b : IN std_logic_vector(4 downto 0);
		sel : IN std_logic;          
		output : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;


	signal ALUinput1: std_logic_vector(31 downto 0);
	signal ALUinput2: std_logic_vector(31 downto 0);
	signal ALUoutput: std_logic_vector(31 downto 0);
	signal ALUzeroFlag: std_logic;
	signal ALUselect: std_logic_vector(3 downto 0);
	signal PCoutput: std_logic_vector(31 downto 0);
	signal PCinput: std_logic_vector (31 downto 0);
	signal AdderOut: std_logic_vector (31 downto 0);
	signal inputInstruction: std_logic_vector (31 downto 0);
	signal readData2: std_logic_vector (31 downto 0);
	signal dataMemoryOut: std_logic_vector (31 downto 0);
	signal writeDataIn: std_logic_vector (31 downto 0);
	signal MUXregDstOut:std_logic_vector (4 downto 0);
	signal regDst: std_logic;
	signal branch: std_logic;
	signal memRead: std_logic;
	signal memToReg: std_logic;
	signal ALUopControl: std_logic_vector (1 downto 0);
	signal memWrite: std_logic;
	signal ALUSrc: std_logic;
	signal RegWrite: std_logic;
	signal sign_Extend: std_logic_vector (31 downto 0);
	signal shift_Left2: std_logic_vector (31 downto 0);
	signal ALUoutputToPCMUX: std_logic_vector (31 downto 0);
	signal PCMUXcontrol: std_logic;
	

begin
Inst_mux2to1_memoryMux: mux2to1_memoryMux PORT MAP(
		a => ALUoutput,
		b =>ALUoutput ,
		sel => memToReg,
		output => writeDataIn
	);

	Inst_mux2to2FORreg: mux2to2FORreg PORT MAP(
		a => inputInstruction (20 downto 16),
		b => inputInstruction (15 downto 11),
		sel => regDst,
		output => MUXregDstOut
	);

Inst_ALU: ALU PORT MAP(
		A => ALUinput1,
		B =>ALUinput2 ,
		Operation => ALUselect,
		Zero => ALUzeroFlag,
		C => ALUoutput
	);

	Inst_ALU_CONTROL: ALU_CONTROL PORT MAP(
		ALUop => ALUopControl,
		FunctField => inputInstruction (5 downto 0),
		OPERTATION => ALUselect
	);
	
	Inst_PcAdder2: PcAdder2 PORT MAP(
		PcOld => AdderOut,
		Update =>shift_Left2 ,
		PcPlusFour => ALUoutputToPCMUX
	);
	
Inst_Pc: Pc PORT MAP(
		PcNew =>PCinput ,
		PcCurrent => PCoutput,
		clk => clk
	);


	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => PCoutput,
		Instruction => inputInstruction,
		clk => clk
	);
	
	Inst_PcAdder: PcAdder PORT MAP(
		PcOld => PCoutput,
		Update => "00000000000000000000000000000100",
		PcPlusFour => AdderOut
	);
	
	Inst_ShiftLeft2: ShiftLeft2 PORT MAP(
		input =>sign_Extend ,
		output => shift_Left2
	);

	Inst_SignExtend: SignExtend PORT MAP(
			Immediate =>inputInstruction (15 downto 0) ,
			SignExt => sign_Extend
		);
		
		Inst_ControlUnit: ControlUnit PORT MAP(
		OP => inputInstruction (31 downto 26),
		REGDST => regDst,
		ALUSRC =>ALUSrc ,
		MEMTOREG =>memToReg ,
		REGWRITE =>RegWrite ,
		MEMREAD =>memRead ,
		MEMWRITE => memWrite,
		BRANCH =>branch ,
		ALUOP => ALUopControl
	);
	
	Inst_ALUMUX2to1: ALUMUX2to1 PORT MAP(
		a => readData2,
		b => sign_Extend,
		sel =>ALUSrc ,
		output => ALUinput2
	);

Inst_PcMux2to1: PcMux2to1 PORT MAP(
		a => AdderOut,
		b =>ALUoutputToPCMUX ,
		sel =>PCMUXcontrol ,
		output => PCinput
	);


	Inst_Data_Memory: Data_Memory PORT MAP(
		Address => ALUoutput,
		MemRead =>memRead ,
		MemWrite => memWrite,
		Clk =>clk ,
		WriteData => readData2,
		ReadData => dataMemoryOut
	);

Inst_Register_File: Register_File PORT MAP(
		Read_Reg1 =>  inputInstruction (25 downto 21),
		Read_Reg2 => inputInstruction (20 downto 16),
		Write_Reg => MUXregDstOut,
		Read_Data_1 =>  ALUinput1,
		Read_Data_2 => readData2,
		Write_Data => writeDataIn,
		RegWrite => RegWrite,
		clk => clk
	);


end Behavioral;

