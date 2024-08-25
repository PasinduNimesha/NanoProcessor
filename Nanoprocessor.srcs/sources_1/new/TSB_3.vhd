----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 10:48:40 PM
-- Design Name: 
-- Module Name: TSB_3 - Behavioral
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

entity TSB_3 is
    Port ( buff_In : in STD_LOGIC_VECTOR (2 downto 0);
           buff_En : in STD_LOGIC;
           buff_Out : out STD_LOGIC_VECTOR (2 downto 0));
end TSB_3;

architecture Behavioral of TSB_3 is

begin

    buff_Out(0) <= buff_In(0) AND buff_En;
    buff_Out(1) <= buff_In(1) AND buff_En;
    buff_Out(2) <= buff_In(2) AND buff_En;
    
end Behavioral;
