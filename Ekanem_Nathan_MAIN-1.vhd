----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2023 02:03:14 PM
-- Design Name: 
-- Module Name: Ekanem_Nathan_MAIN - Behavioral
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

entity Ekanem_Nathan_MAIN is
 Port (clk,reset,sw,stop,start : in std_logic;
        seg : out std_logic_vector(6 downto 0);
        cat : out std_logic);
end Ekanem_Nathan_MAIN;

architecture Structural of Ekanem_Nathan_MAIN is

    component Nathan4bitmux
    Port ( I0 : in STD_LOGIC_VECTOR(3 downto 0);
           I1 : in STD_LOGIC_VECTOR(3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC);
end component;

component Ekanem_Nathan_Portmap is
        Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : out std_logic;
           sw : in STD_LOGIC);
end component;

component Nathan_counters is 
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           output : out std_logic_vector(3 downto 0);
           output2 : out std_logic_vector(3 downto 0));
end component;

component Ekanem_Nathan_ssd is 
    Port ( sw : in std_logic_vector(3 downto 0);
           seg : out std_logic_vector(6 downto 0);
           cat : out std_logic);
end component;

component Nathan_60hz is 
         Port (
        clk_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk_out: out STD_LOGIC);
end component;

component StateMachine is
 Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           stop : in std_logic;
           clk_out : out std_logic);
end component;

signal count : std_logic_vector(3 downto 0);
signal clkout : std_logic;
signal clkout2 :std_logic;
signal counter2 :std_logic_vector(3 downto 0);
signal muxcounter: std_logic_vector(3 downto 0);
signal clk60hzout : std_logic;
begin

Final : StateMachine Port Map( clk => clk,
                               reset => reset,
                               start=> start,
                               stop => stop,
                               clk_out => clkout);
                               
Final2 : Ekanem_Nathan_Portmap Port Map( clk_in => clkout,
                                         reset => reset,
                                         sw => sw,
                                         clk_out => clkout2);
Final3 : Nathan_counters Port Map( clk_in => clkout2,
                                   reset => reset,
                                   output => count,
                                   output2 => counter2);
Final4 : Nathan_60hz Port Map( clk_in => clk,
                               reset => reset,
                               clk_out => clk60hzout);
                               
Final5 : Nathan4bitmux Port Map( I0 => count,
                                 I1 => counter2,
                                 Y => muxcounter,
                                 sw => clk60hzout);
Final6: Ekanem_Nathan_ssd Port Map( sw => muxcounter,
                                    seg => seg,
                                    cat => cat);
cat <= clk60hzout;
end Structural;
