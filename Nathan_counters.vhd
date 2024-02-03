----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2023 07:57:25 PM
-- Design Name: 
-- Module Name: Nathan_counters - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nathan_counters is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0);
           output2 : out STD_LOGIC_VECTOR (3 downto 0));
end Nathan_counters;

architecture Behavioral of Nathan_counters is

signal tmp : std_logic_vector(3 downto 0) := "0000";
signal tmp2 : std_logic_vector(3 downto 0):= "0000";

begin process(clk_in, reset)
begin

    if(reset = '1') then
        tmp <= "0000";
        tmp2 <= "0000";
    elsif(rising_edge(clk_in)) then
        if(tmp = "1001") then
            tmp <= "0000";
            tmp2 <= tmp2 + 1;
        elsif(tmp2 = "1001") then
            tmp2 <= "0000";
        else
            tmp <= tmp + 1;
        end if;
    end if;
    end process;
    
    output <= tmp;
    output2 <= tmp2;
end Behavioral;
