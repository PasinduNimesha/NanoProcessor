----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 09:39:11 AM
-- Design Name: 
-- Module Name: Nanoprocessor_Sim - Behavioral
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

entity Upper_Sim is
--  Port ( );
end Upper_Sim;

architecture Behavioral of Upper_Sim is

component Upper
    Port ( RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           Clk, Load_Sel : in STD_LOGIC;
           Imm_Value : in STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC;
           RegSel_A : in STD_LOGIC_VECTOR (2 downto 0);
           RegSel_B : in STD_LOGIC_VECTOR (2 downto 0);
           RegChkJmp : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           SelectOp : in STD_LOGIC);
end component;

signal RegEn,RegSel_A,RegSel_B: STD_LOGIC_VECTOR (2 downto 0);
signal RegChkJmp, Imm_Value: STD_LOGIC_VECTOR (3 downto 0);
signal Overflow, Zero, SelectOp, Load_Sel: STD_LOGIC;
signal Clk, Reset: STD_LOGIC := '0';

begin

UUT: Upper
Port Map(
         RegEn => RegEn,
         Clk => Clk,
         Reset => Reset,
         RegSel_A => RegSel_A,
         RegSel_B => RegSel_B,
         Overflow => Overflow,
         Zero => Zero,
         Imm_Value => Imm_Value,
         RegChkJmp => RegChkJmp,
         Load_Sel => Load_Sel,
         SelectOp => SelectOp);

process   
    begin
        Clk <= NOT (Clk);
        wait for 5 ns;
end process;         

process
begin
    Load_Sel <= '1';
    RegEn <= "010";
    wait for 40 ns;
    Imm_Value <= "1100";
    wait for 40ns;
    
    RegEn <= "001";
    Imm_Value <= "0010";
    wait for 20ns;
    
    Load_Sel <= '0';
    RegSel_A <= "010";
    RegSel_B <= "001";
    SelectOp <= '0';   
    
    
    
end process;         
         


end Behavioral;
