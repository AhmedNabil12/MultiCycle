--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:32:40 03/24/2021
-- Design Name:   
-- Module Name:   D:/Computer Arche Lab/ProjectWeek1/Test_AluControl.vhd
-- Project Name:  ProjectWeek1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_CONTROL
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
 
ENTITY Test_AluControl IS
END Test_AluControl;
 
ARCHITECTURE behavior OF Test_AluControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_CONTROL
    PORT(
         ALUop : IN  std_logic_vector(1 downto 0);
         FunctField : IN  std_logic_vector(5 downto 0);
         OPERTATION : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUop : std_logic_vector(1 downto 0) := (others => '0');
   signal FunctField : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal OPERTATION : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_CONTROL PORT MAP (
          ALUop => ALUop,
          FunctField => FunctField,
          OPERTATION => OPERTATION
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

  

      -- insert stimulus here 
		ALUop<="00";
		wait for 100 ns;
		ALUop<="01";
		wait for 100 ns;
		ALUop<="10";
			FunctField <="000000";
			wait for 100 ns;   
		ALUop<="10";
			FunctField <="000100";
			wait for 100 ns;   
		ALUop<="10";
			FunctField <="000101";
			wait for 100 ns;  
		ALUop<="11";
			FunctField <="000010";
			wait for 100 ns;  
 		ALUop<="11";
			FunctField <="001010";
			wait for 100 ns;  

      wait;
   end process;

END;
