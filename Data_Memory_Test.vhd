--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:02:17 04/28/2021
-- Design Name:   
-- Module Name:   D:/Computer Arche Lab/ProjectWeek1/Data_Memory_Test.vhd
-- Project Name:  ProjectWeek1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Data_Memory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Data_Memory_Test IS
END Data_Memory_Test;
 
ARCHITECTURE behavior OF Data_Memory_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Data_Memory
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         MemRead : IN  std_logic;
         MemWrite : IN  std_logic;
         Clk : IN  std_logic;
         WriteData : IN  std_logic_vector(31 downto 0);
         ReadData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal MemRead : std_logic := '0';
   signal MemWrite : std_logic := '0';
   signal Clk : std_logic := '0';
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal ReadData : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_Memory PORT MAP (
          Address => Address,
          MemRead => MemRead,
          MemWrite => MemWrite,
          Clk => Clk,
          WriteData => WriteData,
          ReadData => ReadData
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;
		
		Address <=X"00000000";
		Memread <= '1';
		wait for 100 ns;
		Address <=X"000000004";
		Memread <= '0';
		MemWrite <='1';
		WriteData <=X"FFFFFFFF";
		
	wait;
	end process;
  

END;
