----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 11:39:07 AM
-- Design Name: 
-- Module Name: MUX_2_to_4 - Behavioral
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

entity MUX_2_to_4 is
    Port ( Value_In : in STD_LOGIC_VECTOR (3 downto 0);
           Imm_Value : in STD_LOGIC_VECTOR (3 downto 0);
           Load_Sel : in STD_LOGIC;
           Value_Out : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2_to_4;

architecture Behavioral of MUX_2_to_4 is

component TristateBuff
    port (  buff_In : in STD_LOGIC_VECTOR(3 downto 0);
            buff_En : in STD_LOGIC;
            buff_Out : out STD_LOGIC_VECTOR(3 downto 0)); 
end component;

signal Load_Sel_Comp: STD_LOGIC;
signal buff_Out0, buff_Out1: STD_LOGIC_VECTOR(3 downto 0);

begin

Load_Sel_Comp <= not Load_Sel;

Tri_Buff0: TristateBuff
Port Map(
         buff_In => Value_In,
         buff_En => Load_Sel_Comp,
         buff_Out => buff_Out0);

Tri_Buff1: TristateBuff
Port Map(
         buff_In => Imm_Value,
         buff_En => Load_Sel,
         buff_Out => buff_Out1);
         

Value_Out(0) <= buff_Out0(0) or buff_Out1(0);                                                                               
Value_Out(1) <= buff_Out0(1) or buff_Out1(1);
Value_Out(2) <= buff_Out0(2) or buff_Out1(2);
Value_Out(3) <= buff_Out0(3) or buff_Out1(3);         

end Behavioral;
