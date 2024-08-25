----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:14:51 AM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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

entity InstructionDecoder is
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
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

signal reg_en : STD_LOGIC_VECTOR (2 downto 0);

begin
    process (Ins, RegCheckJmp)
    begin
        if(Ins(11 downto 10) = "10") then     --MOV
            JmpFlag <= '0';
            RegEnable <= Ins(9 downto 7);
            LoadSelect <= '1';              --IF immediate value to be selected LoadSelect is 1
            Value <= Ins(3 downto 0);
        end if;
        
        if(Ins(11 downto 10) = "00") then     --ADD
            JmpFlag <= '0';
            Add_Sub <= '0';
            RegSel_1 <= Ins(9 downto 7);
            RegSel_2 <= Ins(6 downto 4);
            LoadSelect <= '0';
            RegEnable <= Ins(9 downto 7);   --IF the value from add/sub unit to be selected LoadSelect is 0
        end if; 
        
        if(Ins(11 downto 10) = "01") then     --Neg
            JmpFlag <= '0';
            RegSel_1 <= "000";
            RegSel_2 <= Ins(9 downto 7);
            Add_Sub <= '1';
            RegEnable <= Ins(9 downto 7);
            LoadSelect <= '0'; 
        end if;
        
        if(Ins(11 downto 10) = "11") then     --JZR
            RegSel_1 <= Ins(9 downto 7);
            RegEnable <= reg_en;
            if(RegCheckJmp = "0000") then              
                JmpFlag <= '1';
                Address <= Ins(2 downto 0);
            end if;

        end if;
        
        
    end process;
    



end Behavioral;
