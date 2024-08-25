----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 12:01:18 PM
-- Design Name: 
-- Module Name: Upper - Behavioral
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

entity Upper is
    Port ( RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Load_Sel: in STD_LOGIC;
           Imm_Value: in STD_LOGIC_VECTOR(3 downto 0);
           Reset : in STD_LOGIC;
           RegSel_A : in STD_LOGIC_VECTOR (2 downto 0);
           RegSel_B : in STD_LOGIC_VECTOR (2 downto 0);
           SelectOp : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           RegChkJmp: out STD_LOGIC_VECTOR (3 downto 0)); 
           
end Upper;

architecture Behavioral of Upper is
component RegisterBank
    Port ( RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Value : in STD_LOGIC_VECTOR (3 downto 0);
           Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7 : out STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC);
end component;

component ALU_Unit
    Port ( Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel_A : in STD_LOGIC_VECTOR (2 downto 0);
           RegSel_B : in STD_LOGIC_VECTOR (2 downto 0);
           Value_Out,RegChkJmp : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           SelectOp : in STD_LOGIC);
end component;

component MUX_2_to_4
    Port ( Value_In : in STD_LOGIC_VECTOR (3 downto 0);
           Imm_Value : in STD_LOGIC_VECTOR (3 downto 0);
           Load_Sel : in STD_LOGIC;
           Value_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7: STD_LOGIC_VECTOR(3 downto 0);
signal Value_ALU, Value_MUX: STD_LOGIC_VECTOR(3 downto 0); 

begin

RegBank_A: RegisterBank
Port Map(
         RegEn => RegEn,
         Clk => Clk,
         Value => Value_MUX,
         Reset => Reset,
         Out0 => Out0,
         Out1 => Out1,
         Out2 => Out2,
         Out3 => Out3,
         Out4 => Out4,
         Out5 => Out5,
         Out6 => Out6,
         Out7 => Out7);

ALU_Unit_Main: ALU_Unit
Port Map(
         Reg0 => Out0,
         Reg1 => Out1,
         Reg2 => Out2,
         Reg3 => Out3,
         Reg4 => Out4,
         Reg5 => Out5,
         Reg6 => Out6,
         Reg7 => Out7,
         RegSel_A => RegSel_A,
         RegSel_B => RegSel_B,
         Value_Out => Value_ALU,
         RegChkJmp => RegChkJmp,
         Overflow => Overflow,
         Zero => Zero,
         SelectOp => SelectOp);

MUX_2_to_4_A: MUX_2_to_4
Port Map(
         Value_In => Value_ALU,
         Imm_Value => Imm_Value,
         Load_Sel => Load_Sel,
         Value_Out => Value_MUX);
                 

                           
end Behavioral;