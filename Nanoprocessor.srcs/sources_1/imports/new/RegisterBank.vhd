----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:37:37 AM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
    Port ( RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Value : in STD_LOGIC_VECTOR (3 downto 0);
           Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7 : out STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC);
end RegisterBank;

architecture Behavioral of RegisterBank is

component Decoder_3_to_8
Port (
      I : in STD_LOGIC_VECTOR (2 downto 0);
      EN : in STD_LOGIC;
      Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg
 Port ( 
      D : in STD_LOGIC_VECTOR (3 downto 0);
      Reset : in STD_LOGIC;
      En : in STD_LOGIC;
      Clk : in STD_LOGIC;
      Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Slow_Clk
Port  ( 
      Clk_in : in STD_LOGIC;
      Clk_out : out STD_LOGIC);      
end component;

signal C_out, ClockOut : STD_LOGIC;
signal RegEnS : STD_LOGIC_VECTOR (7 downto 0); --To store the deocoder output

begin

SlowClock : Slow_Clk
PORT MAP( Clk_in => Clk,
       Clk_out => ClockOut);

Decoder3to8 : Decoder_3_to_8
PORT MAP(
    I => RegEn,
    EN => '1',
    Y => RegEnS);


Reg_0 : Reg
 PORT MAP(
 Reset => Reset,
 D => "0000",
 En => RegEnS(0),
 Clk => ClockOut,
 Q => Out0
 );
 
Reg_1 : Reg
  PORT MAP(
  Reset => Reset,
  D => Value,
  En => RegEnS(1),
  Clk => ClockOut,
  Q => Out1
  );
  
Reg_2 : Reg
   PORT MAP(
   Reset => Reset,
   D => Value,
   En => RegEnS(2),
   Clk => ClockOut,
   Q => Out2
   );
   
Reg_3 : Reg
    PORT MAP(
    Reset => Reset,
    D => Value,
    En => RegEnS(3),
    Clk => ClockOut,
    Q => Out3
    );
    
Reg_4 : Reg
     PORT MAP(
     Reset => Reset,
     D => Value,
     En => RegEnS(4),
     Clk => ClockOut,
     Q => Out4
     );

Reg_5 : Reg
 PORT MAP(
 Reset => Reset,
 D => Value,
 En => RegEnS(5),
 Clk => ClockOut,
 Q => Out5
 );
 
Reg_6 : Reg
  PORT MAP(
  Reset => Reset,
  D => Value,
  En => RegEnS(6),
  Clk => ClockOut,
  Q => Out6
  );
  
Reg_7 : Reg
   PORT MAP(
   Reset => Reset,
   D => Value,
   En => RegEnS(7),
   Clk => ClockOut,
   Q => Out7
   );
  


end Behavioral;
