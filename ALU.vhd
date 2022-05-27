----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:53:27 03/17/2021 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Operation : in  STD_LOGIC_VECTOR (3 downto 0);
           Zero : out  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(A,B,Operation)
begin

if(Operation = "0000") then
	C<=A AND B;
	
elsif(Operation = "0001") then
	C<=A OR B;
	
elsif(Operation = "0010") then
	C<=A + B;
	
elsif(Operation = "0110") then
	C<=A - B;
	
elsif(Operation = "0111") then
	if(A<B) then 
		C<=x"00000001";
	else
		C<=x"00000000";
	end if;
		
elsif (Operation = "1100") then
	C<=A NOR B;

else
	C<=x"00000000";

end if;
if(A=B) then 
	 ZERO <='1';
else 
		ZERO<='0';
	end if;	
end process;
end Behavioral;

