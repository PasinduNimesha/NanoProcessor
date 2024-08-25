----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 07:58:43 PM
-- Design Name: 
-- Module Name: MUX_8_to_4 - Behavioral
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

entity MUX_8_to_4 is
    Port ( Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           ValueOut : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_to_4;

architecture Behavioral of MUX_8_to_4 is

component Decoder_3_to_8
    port(
            I: in STD_LOGIC_VECTOR(2 downto 0);
            EN: in STD_LOGIC;
            Y: out STD_LOGIC_VECTOR(7 downto 0) );
end component;

component TristateBuff
    port (  buff_In : in STD_LOGIC_VECTOR(3 downto 0);
            buff_En : in STD_LOGIC;
            buff_Out : out STD_LOGIC_VECTOR(3 downto 0)); 
end component;

signal buff_Out0,buff_Out1,buff_Out2,buff_Out3,buff_Out4,buff_Out5,buff_Out6,buff_Out7: STD_LOGIC_VECTOR(3 downto 0);
signal Y0: STD_LOGIC_VECTOR(7 downto 0);              
begin

Dec_3_to_8_A: Decoder_3_to_8
Port Map(
         I => RegSel,
         EN => '1',
         Y => Y0);

Tri_Buff0: TristateBuff
Port Map(
         buff_In => Reg0,
         buff_En => Y0(0),
         buff_Out => buff_Out0);

Tri_Buff1: TristateBuff
Port Map(
         buff_In => Reg1,
         buff_En => Y0(1),
         buff_Out => buff_Out1);

Tri_Buff2: TristateBuff
Port Map(
         buff_In => Reg2,
         buff_En => Y0(2),
         buff_Out => buff_Out2);

Tri_Buff3: TristateBuff
Port Map(
         buff_In => Reg3,
         buff_En => Y0(3),
         buff_Out => buff_Out3);

Tri_Buff4: TristateBuff
Port Map(
         buff_In => Reg4,
         buff_En => Y0(4),
         buff_Out => buff_Out4);

Tri_Buff5: TristateBuff
Port Map(
         buff_In => Reg5,
         buff_En => Y0(5),
         buff_Out => buff_Out5);

Tri_Buff6: TristateBuff
Port Map(
         buff_In => Reg6,
         buff_En => Y0(6),
         buff_Out => buff_Out6);

Tri_Buff7: TristateBuff
Port Map(
         buff_In => Reg7,
         buff_En => Y0(7),
         buff_Out => buff_Out7);
         
ValueOut(0) <= buff_Out0(0) or buff_Out1(0) or buff_Out2(0) or buff_Out3(0) or buff_Out4(0) or buff_Out5(0) or buff_Out6(0) or buff_Out7(0);                                                                               
ValueOut(1) <= buff_Out0(1) or buff_Out1(1) or buff_Out2(1) or buff_Out3(1) or buff_Out4(1) or buff_Out5(1) or buff_Out6(1) or buff_Out7(1);
ValueOut(2) <= buff_Out0(2) or buff_Out1(2) or buff_Out2(2) or buff_Out3(2) or buff_Out4(2) or buff_Out5(2) or buff_Out6(2) or buff_Out7(2);
ValueOut(3) <= buff_Out0(3) or buff_Out1(3) or buff_Out2(3) or buff_Out3(3) or buff_Out4(3) or buff_Out5(3) or buff_Out6(3) or buff_Out7(3);

end Behavioral;
