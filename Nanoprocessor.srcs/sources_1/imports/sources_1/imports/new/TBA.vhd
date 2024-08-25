----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 04:26:24 PM
-- Design Name: 
-- Module Name: 3bitAdder - Behavioral
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

entity TBA is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
           Adr : out STD_LOGIC_VECTOR (2 downto 0));
end TBA;

architecture Behavioral of TBA is
component FA 
    port ( 
        A: in std_logic; 
        B: in std_logic; 
        C_in: in std_logic; 
        S: out std_logic; 
        C_out: out std_logic); 
end component;

    SIGNAL FA0_C, FA1_C, FA2_C : std_logic;

begin

    FA_0 : FA 
        port map ( 
            A => MemorySelect(0), 
            B => '1', 
            C_in => '0',
            S => Adr(0), 
            C_Out => FA0_C); 
    FA_1 : FA 
        port map ( 
            A => MemorySelect(1), 
            B => '0', 
            C_in => FA0_C, 
            S => Adr(1), 
            C_Out => FA1_C);
    FA_2 : FA 
        port map ( 
            A => MemorySelect(2), 
            B => '0', 
            C_in => FA1_C, 
            S => Adr(2), 
            C_Out => FA2_C);


end Behavioral;
