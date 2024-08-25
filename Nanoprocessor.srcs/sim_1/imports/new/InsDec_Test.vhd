----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 11:56:19 AM
-- Design Name: 
-- Module Name: InsDec_Test - Behavioral
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

entity InsDec_Test is
--  Port ( );
end InsDec_Test;

architecture Behavioral of InsDec_Test is

component InstructionDecoder
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
       RegCheckJmp : in STD_LOGIC_VECTOR (3 downto 0);
       RegEnable : out STD_LOGIC_VECTOR (2 downto 0);
       LoadSelect : out STD_LOGIC;
       Value : out STD_LOGIC_VECTOR (3 downto 0);
       Address : out STD_LOGIC_VECTOR (2 downto 0);
       JmpFlag : out STD_LOGIC;
       RegSel_1 : out STD_LOGIC_VECTOR (2 downto 0);
       RegSel_2 : out STD_LOGIC_VECTOR (2 downto 0);
       Add_Sub : out STD_LOGIC);
end component;


signal Ins : STD_LOGIC_VECTOR (11 downto 0);
signal RegCheckJmp : STD_LOGIC_VECTOR (3 downto 0);
signal RegEnable : STD_LOGIC_VECTOR (2 downto 0);
signal LoadSelect, JmpFlag, Add_Sub : STD_LOGIC;
signal Value : STD_LOGIC_VECTOR (3 downto 0);
signal RegSel_1, RegSel_2, Address : STD_LOGIC_VECTOR (2 downto 0);

begin
uut : InstructionDecoder
Port Map( Ins => Ins,
           RegCheckJmp =>RegCheckJmp,
           RegEnable => RegEnable,
           LoadSelect => LoadSelect,
           Value => Value,
           Address => Address,
           JmpFlag => JmpFlag,
           RegSel_1 => RegSel_1,
           RegSel_2 => RegSel_2,
           Add_Sub => Add_Sub);
           
process
begin
Ins <= "101010001010";  --MOV R5, R10 
wait for 100ns;

Ins <= "000100110000";  --ADD R2, R3
wait for 100ns;

Ins <= "011000000000";  --NEG R4
wait for 100ns;

Ins <= "111100000000";  --JZR R6
RegCheckJmp <= "0000";
wait for 100ns;
wait;

end process;

end Behavioral;
