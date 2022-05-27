----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:53:31 03/03/2021 
-- Design Name: 
-- Module Name:    MUX - Behavioral 
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

entity MUX is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           S : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end MUX;

architecture Behavioral of MUX is

begin
 
process(A,S)
begin

if(S = '0') 
    then Z<=A(0);
else 
    Z<=A(1);
end if;
end process;

end Behavioral;