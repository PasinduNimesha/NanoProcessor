----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 07:51:14 PM
-- Design Name: 
-- Module Name: Mux_2W3B - Behavioral
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

entity Mux_2W3B is
    Port ( JmpFlag : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
           Adr : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2W3B;

architecture Behavioral of Mux_2W3B is

component TSB_3
    port (  buff_In : in STD_LOGIC_VECTOR(2 downto 0);
            buff_En : in STD_LOGIC;
            buff_Out : out STD_LOGIC_VECTOR(2 downto 0)); 
end component;
signal JmpFlag_Comp: STD_LOGIC;
signal buff_Out0, buff_Out1: STD_LOGIC_VECTOR(2 downto 0);

begin

JmpFlag_Comp <= not JmpFlag;

Tri_Buff0: TSB_3
Port Map(
         buff_In => Address,
         buff_En => JmpFlag,
         buff_Out => buff_Out0);

Tri_Buff1: TSB_3
Port Map(
         buff_In => MemorySelect,
         buff_En => JmpFlag_Comp,
         buff_Out => buff_Out1);
         
         
Adr(0) <= buff_Out0(0) or buff_Out1(0);                                                                               
Adr(1) <= buff_Out0(1) or buff_Out1(1);
Adr(2) <= buff_Out0(2) or buff_Out1(2);


--Adr(0) <= (JmpFlag AND Address(0)) OR ((NOT JmpFlag) AND MemorySelect(0));
--Adr(1) <= (JmpFlag AND Address(1)) OR ((NOT JmpFlag) AND MemorySelect(1));
--Adr(2) <= (JmpFlag AND Address(2)) OR ((NOT JmpFlag) AND MemorySelect(2));


end Behavioral;

