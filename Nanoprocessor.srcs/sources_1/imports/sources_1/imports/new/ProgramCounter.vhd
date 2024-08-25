----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 03:13:32 PM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0) := "000";
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

component Slow_Clk
port (
    Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC);
end component;

component D_FF
port (
    D : in STD_LOGIC;
    Res: in STD_LOGIC;
    Clk : in STD_LOGIC;
    Q : out STD_LOGIC;
    Qbar : out STD_LOGIC);
end component;


signal Clk_slow : std_logic;
signal MemSelect_TBA: STD_LOGIC_VECTOR (2 downto 0);
signal Increment, Adr : STD_LOGIC_VECTOR (2 downto 0);
begin
Increment <= "001";
Adr <= Adr;
 
Slow_Clk0 : Slow_Clk
port map (
    Clk_in => Clk,
    Clk_out => Clk_slow);
 
D_FF0 : D_FF
port map (
    D => Address(0),
    Res => Reset,
    Clk => Clk_slow,
    Q => MemorySelect(0)
 );
 
 D_FF1 : D_FF
 port map (
 D => Address(1),
 Res => Reset,
 Clk => Clk_slow,
 Q => MemorySelect(1)
 );
 
 D_FF2 : D_FF
 port map (
 D => Address(2),
 Res => Reset,
 Clk => Clk_slow,
 Q => MemorySelect(2)
 );


end Behavioral;
