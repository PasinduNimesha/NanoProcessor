----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 08:09:41 PM
-- Design Name: 
-- Module Name: TristateBuff - Behavioral
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

entity TristateBuff is
    Port ( buff_In : in STD_LOGIC_VECTOR(3 downto 0);
           buff_En : in STD_LOGIC;
           buff_Out : out STD_LOGIC_VECTOR(3 downto 0));
end TristateBuff;

architecture Behavioral of TristateBuff is

begin

    buff_Out(0) <= buff_In(0) AND buff_En;
    buff_Out(1) <= buff_In(1) AND buff_En;
    buff_Out(2) <= buff_In(2) AND buff_En;
    buff_Out(3) <= buff_In(3) AND buff_En;
    
end Behavioral;
