----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 09:14:43 PM
-- Design Name: 
-- Module Name: NanoProcessor_Test - Behavioral
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

entity NanoProcessor_Test is
--  Port ( );
end NanoProcessor_Test;

architecture Behavioral of NanoProcessor_Test is

component Nanoprocessor
Port (
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;    
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0); 
           Zero : out STD_LOGIC); 
end component;

    
    -- Test signals;);
    signal Clk : STD_LOGIC := '0';
    signal Reset, Zero, Overflow : STD_LOGIC;
    signal S_7Seg : STD_LOGIC_VECTOR (6 downto 0);

    
begin

    -- Instantiate the unit under test
    UUT: Nanoprocessor
    port map (
               Clk => Clk,
               Reset => Reset,
               Overflow => Overflow,
               S_7Seg => S_7Seg,
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
