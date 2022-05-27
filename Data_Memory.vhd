----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:54 04/27/2021 
-- Design Name: 
-- Module Name:    Data_Memory - Behavioral 
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

entity Data_Memory is
    Port ( Address   : in  STD_LOGIC_VECTOR (31 downto 0);
           MemRead   : in  STD_LOGIC;
           MemWrite  : in  STD_LOGIC;
           Clk       : in  STD_LOGIC;
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData  : out  STD_LOGIC_VECTOR (31 downto 0));
end Data_Memory;

architecture Behavioral of Data_Memory is
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

	process(Address, MemRead, MemWrite,WriteData,Clk)
	begin
	if MemRead='1' and MemWrite='0' then
		ReadData(31 downto 24) <= mem(to_integer(unsigned(address)));
		ReadData(23 downto 16) <= mem(to_integer(unsigned(address))+1);
		ReadData(15 downto 8) <= mem(to_integer(unsigned(address))+2);
		ReadData(7 downto 0) <= mem(to_integer(unsigned(address))+3);
	
	elsif rising_edge(Clk) and MemRead='0' and MemWrite='1' then
	
		  mem(to_integer(unsigned(address))) <= WriteData(31 downto 24);
		  mem(to_integer(unsigned(address))+1) <= WriteData(23 downto 16);
		  mem(to_integer(unsigned(address))+2) <= WriteData(15 downto 8);
		  mem(to_integer(unsigned(address))+3) <= WriteData(7 downto 0);
		  end if;
		  end process;
	
end Behavioral;