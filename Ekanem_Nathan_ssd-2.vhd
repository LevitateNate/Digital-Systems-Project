----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2023 11:16:00 AM
-- Design Name: 
-- Module Name: Ekanem_Nathan_ssd - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ekanem_Nathan_ssd is
    Port ( sw : in std_logic_vector(3 downto 0);
           seg : out std_logic_vector(6 downto 0);
           cat : out std_logic);
end Ekanem_Nathan_ssd;

architecture Behavioral of Ekanem_Nathan_ssd is

begin
with sw select --Letters
                    --A
     seg <= "1110111" when "1010",
                    --B
            "1111100" when "1011",
                    --C
            "0111001" when "1100",
                    --D
            "1011110" when "1101",
                    --E
            "1111001" when "1110",
                    --F
            "1110001" when "1111",
            --Numbers
            "1111110" when "0000",
            --1
            "0110000" when "0001",
            --2
            "1101101" when "0010",
            --3
            "1111001" when "0011",
            --4
            "0110011" when "0100",
            --5
            "1011011" when "0101",
            --6
            "1011111" when "0110",
            --7
            "1110000" when "0111",
            --8
            "1111111" when "1000",
            --9
            "1111011" when "1001",
            -- others
            "0000000" when others;
            


end Behavioral;
