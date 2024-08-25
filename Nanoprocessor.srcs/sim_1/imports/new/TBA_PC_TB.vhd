----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 08:55:37 PM
-- Design Name: 
-- Module Name: TBA_PC_TB - Behavioral
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

entity TBA_PC_TB is
end TBA_PC_TB;

architecture Behavioral of TBA_PC_TB is
    component TBA_PC
        Port (
            Clk : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Increment : in STD_LOGIC_VECTOR (2 downto 0);
            MemorySelect : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal Clk : STD_LOGIC := '0';
    signal Reset : STD_LOGIC := '0';
    signal Increment_tb : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal MemorySelect_tb : STD_LOGIC_VECTOR (2 downto 0);

begin

    UUT : TBA_PC
        port map (
            Clk => Clk,
            Reset => Reset,
            Increment => Increment_tb,
            MemorySelect => MemorySelect_tb
        );

process   
            begin
                Clk <= NOT (Clk);
                wait for 5 ns;
end process;

process   
        begin
            reset <= '1';
            wait for 50 ns;
            reset <= '0';
            wait for 200 ns;
end process;
end Behavioral;

