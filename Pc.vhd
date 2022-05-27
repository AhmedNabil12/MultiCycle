----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:44:45 06/07/2021 
-- Design Name: 
-- Module Name:    Pc - Behavioral 
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

entity Pc is
    Port ( PcNew : in  STD_LOGIC_VECTOR (31 downto 0);
           PcCurrent : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end Pc;

architecture Behavioral of Pc is
	signal temp : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
begin
	process(clk)
	begin
	if rising_edge(clk) then PcCurrent <= temp;
	elsif falling_edge(clk) then temp <= PcNew;
	end if;
	end process;


end Behavioral;

