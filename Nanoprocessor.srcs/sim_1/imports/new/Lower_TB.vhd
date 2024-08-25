----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 08:39:13 PM
-- Design Name: 
-- Module Name: Lower_TB - Behavioral
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

entity Lower_TB is
end Lower_TB;

architecture Behavioral of Lower_TB is

component Lower
Port (
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;     
           Zero : out STD_LOGIC); 
end component;

    
    -- Test signals;);
    signal Clk : STD_LOGIC := '0';
    signal Reset, Zero, Overflow : STD_LOGIC;

    
begin

    -- Instantiate the unit under test
    UUT: Lower
    port map (
               Clk => Clk,
               Reset => Reset,
               Overflow => Overflow,
               Zero => Zero    
    );

    
    
process   
begin
    Clk <= NOT (Clk);
    wait for 5 ns;
end process;

process   
        begin
            reset <= '1';
            wait for 20 ns;
            reset <= '0';
            wait for 200 ns;
            
            reset <= '1';
            wait for 20 ns;
            reset <= '0';
            wait for 200 ns;
            wait;
            
end process;


end Behavioral;