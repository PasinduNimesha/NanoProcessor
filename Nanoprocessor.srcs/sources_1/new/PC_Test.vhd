----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 09:29:39 AM
-- Design Name: 
-- Module Name: PC_Test - Behavioral
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

entity PC_Test is
end PC_Test;

architecture Behavioral of PC_Test is

  component ProgramCounter is
    Port (
      Clk : in STD_LOGIC;
      Reset : in STD_LOGIC;
      Address : in STD_LOGIC_VECTOR (2 downto 0) := "000";
      MemorySelect : out STD_LOGIC_VECTOR (2 downto 0)
    );
  end component;

  signal Clk : STD_LOGIC := '0';
  signal Reset : STD_LOGIC := '0';
  signal Address : STD_LOGIC_VECTOR (2 downto 0) := "000";
  signal MemorySelect : STD_LOGIC_VECTOR (2 downto 0);


begin

  uut : ProgramCounter
    port map (
      Clk => Clk,
      Reset => Reset,
      Address => Address,
      MemorySelect => MemorySelect
    );

process   
begin
    Clk <= NOT (Clk);
    wait for 5 ns;
end process;


  process
  begin
    Reset <= '1';
    Address <= "000";
    wait for 100 ns;
    Reset <= '0';

    Address <= "001";
    wait for 100 ns;

    Address <= "010";
    wait for 100 ns;

    Address <= "011";
    wait for 100 ns;

    Address <= "100";
    wait for 100 ns;

    Address <= "101";
    wait for 100 ns;

    Address <= "110";
    wait for 100 ns;

    Address <= "111";
    wait for 100 ns;

    wait;
  end process;

end Behavioral;
