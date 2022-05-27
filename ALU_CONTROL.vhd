----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:53:27 03/24/2021 
-- Design Name: 
-- Module Name:    ALU_CONTROL - Behavioral 
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

entity ALU_CONTROL is
    Port ( ALUop : in  STD_LOGIC_VECTOR (1 downto 0);
           FunctField : in  STD_LOGIC_VECTOR (5 downto 0);
           OPERTATION : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_CONTROL;

architecture Behavioral of ALU_CONTROL is

begin

process(ALUop,FunctField)
begin 
	case ALUop is
		when "00"=>
			OPERTATION<="0010";
		when "01" =>
			OPERTATION <="0110";
		when "10" =>
				case FunctField (3 downto 0) is
					when "0000" =>
						OPERTATION <="0010";
					when "0010"=>
						OPERTATION <="0110";
					when "0100" =>
						OPERTATION <="0000";
					when "0101"=>
						OPERTATION <="0001";
					when "1010" =>
						OPERTATION <="0111";
					when others =>
						OPERTATION <="0000";
				end case;
				
			when "11" =>
				case FunctField (3 downto 0) is
					when "0010" =>
						OPERTATION <="0110";
					when "1010" =>
						OPERTATION <="0111";
					when others =>
						OPERTATION <="0000";
				end case;
		when others =>
			OPERTATION <="0000";
	end case;

end process;
end Behavioral;

