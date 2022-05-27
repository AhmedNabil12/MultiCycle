----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:19:09 03/03/2021 
-- Design Name: 
-- Module Name:    MUXfourTOone - Behavioral 
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


entity MUXfourTOone is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           Z : out  STD_LOGIC);
end MUXfourTOone;

architecture Behavioral of MUXfourTOone is

component MUX is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           S : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end component;

signal W1,W2: STD_LOGIC;

begin
M1:MUX port map(
A=>A(1 downto 0),
S=>S(0),
Z=>W1
);

M2:MUX port map(
A=>A(3 downto 2),
S=>S(0),
Z=>W2
);

M3:MUX port map(
A(0)=>W1,
A(1)=>W2,
S=>S(1),
Z=>Z
);
end Behavioral;

