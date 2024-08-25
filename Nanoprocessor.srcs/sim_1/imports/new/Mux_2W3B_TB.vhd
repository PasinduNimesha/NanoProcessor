----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 08:15:28 PM
-- Design Name: 
-- Module Name: Mux_2W3B_TB - Behavioral
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

entity Mux_2W3B_TB is
end Mux_2W3B_TB;

architecture Behavioral of Mux_2W3B_TB is

    -- Component declaration
    component Mux_2W3B is
        Port ( JmpFlag : in STD_LOGIC;
               Address : in STD_LOGIC_VECTOR (2 downto 0);
               MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
               Adr : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    -- Test signals
    signal JmpFlag_tb : STD_LOGIC;
    signal Address_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal MemorySelect_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Adr_tb : STD_LOGIC_VECTOR (2 downto 0);

begin

    -- Instantiate the unit under test
    uut: Mux_2W3B
    port map (
        JmpFlag => JmpFlag_tb,
        Address => Address_tb,
        MemorySelect => MemorySelect_tb,
        Adr => Adr_tb
    );

    process
    begin
        -- Test case 1
        JmpFlag_tb <= '0';
        Address_tb <= "000";
        MemorySelect_tb <= "111";
        wait for 100 ns;

        JmpFlag_tb <= '0';
        Address_tb <= "110";
        MemorySelect_tb <= "001";
        wait for 100 ns;
       
        JmpFlag_tb <= '1';
        Address_tb <= "100";
        MemorySelect_tb <= "001";
        wait for 100 ns;

        JmpFlag_tb <= '1';
        Address_tb <= "110";
        MemorySelect_tb <= "101";
        wait for 100 ns;


        
        wait;
    end process;
end Behavioral;

