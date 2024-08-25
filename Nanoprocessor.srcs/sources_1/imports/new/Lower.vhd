----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 08:28:37 PM
-- Design Name: 
-- Module Name: Lower - Behavioral
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

entity Lower is
    Port (
           Clk : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Reset : in STD_LOGIC);      
end Lower;

architecture Behavioral of Lower is

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

component InstructionDecoder
port (
           Ins : in STD_LOGIC_VECTOR (11 downto 0);
           RegCheckJmp : in STD_LOGIC_VECTOR (3 downto 0);
           RegEnable : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSelect : out STD_LOGIC;
           Value : out STD_LOGIC_VECTOR (3 downto 0);
           Address : out STD_LOGIC_VECTOR (2 downto 0);
           JmpFlag : out STD_LOGIC ;
           RegSel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           Add_Sub : out STD_LOGIC);
end component;

component RegisterBank
    Port ( RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Value : in STD_LOGIC_VECTOR (3 downto 0);
           Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7 : out STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC);
end component;

component TBA
port (
    MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
    Adr : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ProgramRom
port (
        MemorySel : in STD_LOGIC_VECTOR (2 downto 0);
        Ins : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Mux_2W3B
port (
           JmpFlag : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
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

signal Clk_slow, JmpFlag_M, Load_Sel, Add_Sub : std_logic;
signal MemSelect_TBA : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal Adr_PC, Mux_Adr, Address_M, RegEn, RegSel_A, RegSel_B : STD_LOGIC_VECTOR (2 downto 0);
signal Ins_ID : STD_LOGIC_VECTOR (11 downto 0);

signal Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7: STD_LOGIC_VECTOR(3 downto 0);
signal Value_ALU, Value_MUX, Value_to_Mux, Value, RegChkJmp: STD_LOGIC_VECTOR(3 downto 0); 

begin

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
         SelectOp => Add_Sub);

RegBank_A: RegisterBank
Port Map(
         RegEn => RegEn,
         Clk => Clk,
         Value => Value,
         Reset => Reset,
         Out0 => Out0,
         Out1 => Out1,
         Out2 => Out2,
         Out3 => Out3,
         Out4 => Out4,
         Out5 => Out5,
         Out6 => Out6,
         Out7 => Out7);

MUX_2_to_4_A: MUX_2_to_4
Port Map(
         Value_In => Value_ALU,
         Imm_Value => Value_to_Mux,
         Load_Sel => Load_Sel,
         Value_Out => Value);

InsDec_0 : InstructionDecoder
port map (
    Ins => Ins_ID,
    RegCheckJmp => RegChkJmp,
    RegEnable => RegEn,
    LoadSelect => Load_Sel,
    Value => Value_to_Mux,
    Address => Address_M,
    JmpFlag => JmpFlag_M,
    RegSel_1 => RegSel_A,
    RegSel_2 => RegSel_B,
    Add_Sub => Add_Sub);
M_2W3B_0 : Mux_2W3B
port map (
    JmpFlag => JmpFlag_M,
    Address => Address_M,
    MemorySelect => Mux_Adr,
    Adr => Adr_PC);
    
PROM_0 : ProgramRom
port map (
        MemorySel => MemSelect_TBA,
        Ins => Ins_ID);


TBA_0 : TBA
port map (
    MemorySelect => MemSelect_TBA,
    Adr => Mux_Adr);

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