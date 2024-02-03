----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2023 06:53:56 PM
-- Design Name: 
-- Module Name: StateMachine - Behavioral
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

entity StateMachine is
 Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           stop : in std_logic;
           clk_out : out std_logic);
end StateMachine;

architecture Behavioral of StateMachine is
signal present_state : std_logic;
begin
process(clk,reset)
begin
    if(reset = '1') then
        present_state <= '0';
    elsif (rising_edge(clk)) then
        if (start = '1') then 
            present_state <= '1';
        elsif (stop = '1') then 
            present_state <= '0';
        end if;
    end if;
end process;

clk_out <= clk when present_state = '1' else '0';


end Behavioral;
