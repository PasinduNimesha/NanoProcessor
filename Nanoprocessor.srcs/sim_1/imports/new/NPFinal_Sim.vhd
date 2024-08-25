----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 02:45:27 PM
-- Design Name: 
-- Module Name: NPFinal_Sim - Behavioral
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

entity NPFinal_Sim is
--  Port ( );
end NPFinal_Sim;

architecture Behavioral of NPFinal_Sim is
component NPFinal
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

signal OverFlow, Zero : STD_LOGIC;
signal Clk, Reset : STD_LOGIC := '0';

begin

UUT : NPFinal
Port Map(
    Clk => Clk,
    Reset => Reset,
    OverFlow => OverFlow,
    Zero => Zero);
    
    
process   
        begin
            Clk <= NOT (Clk);
            wait for 5 ns;
end process;

process
    begin
        Reset <= '1';
        wait for 10ns;
        Reset <= '0';
        wait;
end process;         



end Behavioral;
