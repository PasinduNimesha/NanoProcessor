----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 08:29:32 PM
-- Design Name: 
-- Module Name: TBA_TB - Behavioral
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

entity TBA_TB is
end TBA_TB;

architecture Behavioral of TBA_TB is
    component TBA
        Port (
            MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
            Adr : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal MemorySelect_tb : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal Adr_tb : STD_LOGIC_VECTOR (2 downto 0);

begin

    UUT : TBA
        port map (
            MemorySelect => MemorySelect_tb,
            Adr => Adr_tb
        );

    stimulus : process
    begin
        MemorySelect_tb <= "000";
        wait for 100 ns;
        
        MemorySelect_tb <= "001";
        wait for 100 ns;
        
        MemorySelect_tb <= "100";
        wait for 100 ns;
        
        MemorySelect_tb <= "011";
        wait for 100 ns;
        
        wait;
    end process stimulus;

end Behavioral;

