----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 02:18:31 AM
-- Design Name: 
-- Module Name: ALU_Unit - Behavioral
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

entity ALU_Unit is
    Port ( Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel_A : in STD_LOGIC_VECTOR (2 downto 0);
           RegSel_B : in STD_LOGIC_VECTOR (2 downto 0);
           Value_Out,RegChkJmp : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           SelectOp : in STD_LOGIC);
end ALU_Unit;

architecture Behavioral of ALU_Unit is

component MUX_8_to_4
    Port ( Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           ValueOut : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub_Unit
    Port ( Value_A : in STD_LOGIC_VECTOR (3 downto 0);
           Value_B : in STD_LOGIC_VECTOR (3 downto 0);
           SelectOp : in STD_LOGIC;
           Value_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

signal Value_Out_A, Value_Out_B: STD_LOGIC_VECTOR(3 downto 0);

begin

MUX_8_to_4_A : MUX_8_to_4
Port Map(
         Reg0 => Reg0,Reg1 => Reg1,Reg2 => Reg2,Reg3 => Reg3,Reg4 => Reg4,Reg5 => Reg5,Reg6 => Reg6,Reg7 => Reg7,
         RegSel => RegSel_A,
         ValueOut => Value_Out_A);

MUX_8_to_4_B : MUX_8_to_4
Port Map(
         Reg0 => Reg0,Reg1 => Reg1,Reg2 => Reg2,Reg3 => Reg3,Reg4 => Reg4,Reg5 => Reg5,Reg6 => Reg6,Reg7 => Reg7,
         RegSel => RegSel_B,
         ValueOut => Value_Out_B);

Add_Sub_Main: Add_Sub_Unit
Port Map(
         Value_A => Value_Out_A,
         Value_B => Value_Out_B,
         SelectOp => SelectOp,
         Value_Out => Value_Out,
         Overflow => Overflow,
         Zero => Zero);                  
         
RegChkJmp <= Value_Out_A;         


end Behavioral;
