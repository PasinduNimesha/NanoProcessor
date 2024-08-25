----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 08:50:07 PM
-- Design Name: 
-- Module Name: TBA_PC - Behavioral
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

entity TBA_PC is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Increment : in STD_LOGIC_VECTOR (2 downto 0);
           MemorySelect : out STD_LOGIC_VECTOR (2 downto 0));
end TBA_PC;

architecture Behavioral of TBA_PC is

component TBA
port (
    MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
    Increment : in STD_LOGIC_VECTOR (2 downto 0);
    Adr : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ProgramCounter
port (
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    Address : in STD_LOGIC_VECTOR (2 downto 0);
    MemorySelect : out STD_LOGIC_VECTOR (2 downto 0)) ;
end component;

component Slow_Clk
port (
    Clk_in : in STD_LOGIC;
    Clk_out: out STD_LOGIC);
end component;

signal Clk_slow : std_logic;
signal MemSelect_TBA : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal Adr_PC: STD_LOGIC_VECTOR (2 downto 0);




begin

MemorySelect <= MemSelect_TBA;
TBA_0 : TBA
port map (
    MemorySelect => MemSelect_TBA,
    Increment => Increment,
    Adr => Adr_PC);

Slow_Clk0 : Slow_Clk
port map (
    Clk_in => Clk,
    Clk_out => Clk_slow
 );
 
 PC_0 : ProgramCounter
 port map (
    Clk => Clk,
    Reset => Reset,
    Address => Adr_PC,
    MemorySelect => MemSelect_TBA);
 

end Behavioral;
