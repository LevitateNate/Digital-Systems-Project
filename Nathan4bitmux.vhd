----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2023 07:53:03 PM
-- Design Name: 
-- Module Name: Nathan4bitmux - Behavioral
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

entity Nathan4bitmux is
        Port ( I0 : in STD_LOGIC_VECTOR(3 downto 0);
           I1 : in STD_LOGIC_VECTOR(3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC);
end Nathan4bitmux;

architecture Behavioral of Nathan4bitmux is

begin
with sw select
    Y <= I0 when '0',
         I1 when '1',
         "0000" when others;

end Behavioral;
