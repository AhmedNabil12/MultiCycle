----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:09:00 06/07/2021 
-- Design Name: 
-- Module Name:    PcAdder - Behavioral 
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

entity PcAdder is
    Port ( PcOld : in  STD_LOGIC_VECTOR (31 downto 0);
           Update : in  STD_LOGIC_VECTOR (31 downto 0);
           PcPlusFour : out  STD_LOGIC_VECTOR (31 downto 0));
end PcAdder;

architecture Behavioral of PcAdder is

begin

		PcPlusFour <= STD_LOGIC_VECTOR (unsigned(PcOld) + x"00000004");

end Behavioral;

