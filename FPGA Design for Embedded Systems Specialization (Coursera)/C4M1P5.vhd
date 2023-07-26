library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;

entity C4M1P5 is 
port (
    A,B  : in std_logic_vector (3 downto 0);
    Cin : in std_logic;
    S1,S0 : out std_logic_vector (7 downto 0)

);
end C4M1P5;

architecture bcd_add of C4M1P5 is 

signal Sum_temp : std_logic_vector ( 3 downto 0);
signal Cout,Z : std_logic_vector (3 downto 0);
signal S1_BCD,S0_BCD : std_logic_vector (3 downto 0);




begin

Sum_temp <= A + B + Cin;

adding : process (Sum_temp)
begin
    if (Sum_temp > "1001") then -- 9
        Z <= "1010"; -- 10
        Cout <= "0001";
    else 
    
        Z <= "0000";
        Cout <= "0000";
    end if;
end process;

S0_BCD <= Sum_temp - Z;
S1_BCD <= Cout;

S0_7seg : entity work.HEX_TO_7(conversion)
port map (
    HEX_in => S0_BCD,
    sevseg_out => S0
);

S1_7seg : entity work.HEX_to_7(conversion)
port map (
    HEX_in => S1_BCD,
    sevseg_out => S1
);

end bcd_add;

