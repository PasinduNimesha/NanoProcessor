----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 01:06:25 AM
-- Design Name: 
-- Module Name: Add_Sub_Unit - Behavioral
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

entity Add_Sub_Unit is
    Port ( Value_A : in STD_LOGIC_VECTOR (3 downto 0);
           Value_B : in STD_LOGIC_VECTOR (3 downto 0);
           SelectOp : in STD_LOGIC;
           Value_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub_Unit;

architecture Behavioral of Add_Sub_Unit is

component RCA_4
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal S0,S1,S2,S3,C_out: STD_LOGIC;
signal In_Value_B: STD_LOGIC_VECTOR(3 downto 0);

begin

In_Value_B(0) <= SelectOp XOR Value_B(0);
In_Value_B(1) <= SelectOp XOR Value_B(1);
In_Value_B(2) <= SelectOp XOR Value_B(2);
In_Value_B(3) <= SelectOp XOR Value_B(3);

RCA_4_A: RCA_4
Port Map(
         A0 => Value_A(0),
         A1 => Value_A(1),
         A2 => Value_A(2),
         A3 => Value_A(3),
         B0 => In_Value_B(0),
         B1 => In_Value_B(1),
         B2 => In_Value_B(2),
         B3 => In_Value_B(3),
         C_in => SelectOp,
         S0 => S0,
         S1 => S1,
         S2 => S2,
         S3 => S3,
         C_out => C_out);

Value_Out(0) <= S0;
Value_Out(1) <= S1;
Value_Out(2) <= S2;
Value_Out(3) <= S3;

Overflow <= C_out;
Zero <= not (C_out or S0 or S1 or S2 or S3);
         
end Behavioral;
