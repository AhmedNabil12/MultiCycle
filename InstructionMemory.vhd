----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:38 06/07/2021 
-- Design Name: 
-- Module Name:    InstructionMemory - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionMemory is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end InstructionMemory;

architecture Behavioral of InstructionMemory is
type A is array (0 to 127) of STD_LOGIC_VECTOR(7 downto 0);

signal mem : A:= (X"20",X"08",X"03",X"0B",
						X"20",X"08",X"03",X"0B",
						X"20",X"08",X"03",X"0B",
						X"20",X"00",X"03",X"7B",
						X"20",X"AA",X"A3",X"2B",
						X"20",X"08",X"03",X"0B",
						X"20",X"08",X"03",X"0B",
						X"20",X"08",X"07",X"3B",
						X"20",X"08",X"11",X"0B",
						X"20",X"08",X"13",X"0B",
						X"24",X"AD",X"A7",X"0B",
						X"20",X"08",X"03",X"0B",
						X"20",X"08",X"03",X"0B",
						X"20",X"08",X"03",X"0B",
						X"20",X"08",X"03",X"0B",
						X"20",X"08",X"03",X"0B",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
					   X"20",X"08",X"11",X"0B",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00",
						X"00",X"00",X"00",X"00");
begin

process(clk)
	begin
	if rising_edge(clk) then
		Instruction(31 downto 24) <= mem(to_integer(unsigned(Address)));
		Instruction(23 downto 16) <= mem(to_integer(unsigned(Address))+1);
		Instruction(15 downto 8) <= mem(to_integer(unsigned(Address))+2);
		Instruction(7 downto 0) <= mem(to_integer(unsigned(Address))+3);
		  end if;
		  end process;
end Behavioral;

