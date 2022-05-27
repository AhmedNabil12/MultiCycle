----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:35 04/07/2021 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
    Port ( OP : in  STD_LOGIC_VECTOR (5 downto 0);
           REGDST : out  STD_LOGIC;
           ALUSRC : out  STD_LOGIC;
           MEMTOREG : out  STD_LOGIC;
           REGWRITE : out  STD_LOGIC;
           MEMREAD : out  STD_LOGIC;
           MEMWRITE : out  STD_LOGIC;
           BRANCH : out  STD_LOGIC;
           ALUOP : out  STD_LOGIC_VECTOR (1 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

begin
process(OP) 
		begin 
			case OP is
				when "000000"=>
					REGDST<='1';
					ALUSRC<='0';
					MEMTOREG<='0';
					REGWRITE<='1';
					MEMREAD<='0';
					MEMWRITE<='0';
					BRANCH<='0';
					ALUOP<="10"; 
				when "100011"=>
					REGDST<='0';
					ALUSRC<='1';
					MEMTOREG<='1';
					REGWRITE<='1';
					MEMREAD<='1';
					MEMWRITE<='0';
					BRANCH<='0';
					ALUOP<="00"; 
				when "101011"=>
					REGDST<='0';
					ALUSRC<='1';
					MEMTOREG<='0';
					REGWRITE<='0';
					MEMREAD<='0';
					MEMWRITE<='1';
					BRANCH<='0';
					ALUOP<="00";	
				when "000100"=>
					REGDST<='0';
					ALUSRC<='0';
					MEMTOREG<='0';
					REGWRITE<='0';
					MEMREAD<='0';
					MEMWRITE<='0';
					BRANCH<='1';
					ALUOP<="01";
					
				when others=>NULL; 
				   REGDST<='1';
					ALUSRC<='0';
					MEMTOREG<='0';
					REGWRITE<='1';
					MEMREAD<='0';
					MEMWRITE<='0';
					BRANCH<='0';
					ALUOP<="10";
					
	 end case;
	end process ;

end Behavioral;

