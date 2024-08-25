----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 05:00:38 PM
-- Design Name: 
-- Module Name: M_Test - Behavioral
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

entity M_Test is
--  Port ( );
end M_Test;

architecture Behavioral of M_Test is
component MUX_2_to_4 is
    Port ( Value_In : in STD_LOGIC_VECTOR (3 downto 0);
           Imm_Value : in STD_LOGIC_VECTOR (3 downto 0);
           Load_Sel : in STD_LOGIC;
           Value_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

    -- Test signals
    signal Load_Sel : STD_LOGIC;
    signal Value_In : STD_LOGIC_VECTOR (3 downto 0);
    signal Imm_Value : STD_LOGIC_VECTOR (3 downto 0);
    signal Value_Out : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the unit under test
    uut: MUX_2_to_4
    port map (
        Load_Sel => Load_Sel,
        Value_In => Value_In,
        Imm_Value => Imm_Value,
        Value_Out => Value_Out
    );

    process
    begin
        -- Test case 1
        Load_Sel <= '0';
        Value_In <= "0000";
        Imm_Value <= "1111";
        wait for 100 ns;

        Load_Sel <= '0';
        Value_In <= "1100";
        Imm_Value <= "0001";
        wait for 100 ns;
       
        Load_Sel <= '1';
        Value_In <= "1000";
        Imm_Value <= "0010";
        wait for 100 ns;

        Load_Sel <= '1';
        Value_In <= "1101";
        Imm_Value <= "1011";
        wait for 100 ns;


        
        wait;
    end process;
end Behavioral;
