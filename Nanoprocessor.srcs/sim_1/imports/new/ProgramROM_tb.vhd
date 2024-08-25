----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 07:34:52 PM
-- Design Name: 
-- Module Name: ProgramROM_tb - Behavioral
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
use ieee.numeric_std.all;

entity ProgramROM_tb is
end ProgramROM_tb;

architecture Behavioral of ProgramROM_tb is

    -- Component declaration
    component ProgramROM
        Port (
            MemorySel : in STD_LOGIC_VECTOR (2 downto 0);
            Ins : out STD_LOGIC_VECTOR (11 downto 0)
        );
    end component;

    -- Test signals
    signal MemorySel_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Ins_tb : STD_LOGIC_VECTOR (11 downto 0);

begin

    -- Instantiate the unit under test (ProgramROM)
    UUT : ProgramROM
        port map (
            MemorySel => MemorySel_tb,
            Ins => Ins_tb
        );

    -- Stimulus process
    process
    begin
        -- Initialize test inputs
        MemorySel_tb <= "000";
        wait for 100 ns;


        MemorySel_tb <= "001";
        wait for 100 ns;
 
        MemorySel_tb <= "010";
        wait for 100 ns;
        
        MemorySel_tb <= "011";
        wait for 100 ns;

        MemorySel_tb <= "100";
        wait for 100 ns;

        MemorySel_tb <= "101";
        wait for 100 ns;
        
        MemorySel_tb <= "110";
        wait for 100 ns;

        MemorySel_tb <= "111";
        wait for 100 ns;        


        wait;
    end process stimulus;

    -- Monitor process

end Behavioral;

