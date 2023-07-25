library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;

entity C4M1P2 is 
port (
    SW: in STD_LOGIC_VECTOR(3 downto 0);
    HEX0: out STD_LOGIC_VECTOR (7 downto 0);
    HEX1: out STD_LOGIC_VECTOR (7 downto 0));

end C4M1P2;

architecture d_to_7 of C4M1P2 is

signal z : std_logic;
signal D1_in : std_logic_vector (3 downto 0) := "0000";
signal D0_in: std_logic_vector (3 downto 0);
signal A : std_logic_vector (3 downto 0); 
signal HEX0_temp: STD_LOGIC_VECTOR(7 downto 0);
signal HEX1_temp: STD_LOGIC_VECTOR(7 downto 0);



begin

z <= (SW(3) and SW(2)) or (SW(3) and SW(1));
D1_in(0) <= z;

A(3) <= '0';
A(2) <= SW(3) and SW(2) and SW(1);
A(1) <= SW(3) and SW(2) and not(SW(1));
A(0) <= (SW(3) and SW(2) and SW(0)) or (SW(3) and SW(1) and SW(0));

with z select 
    D0_in <= SW when '0',
        A when '1',
    "0000" when others; 

D0 : entity work.HEX_to_7(conversion) 
    port map(
        HEX_in => D0_in,
       sevseg_out => HEX0_temp);

D1 : entity work.HEX_to_7(conversion) 
    port map(
        Hex_in => D1_in,
       sevseg_out => HEX1_temp);


HEX0 <= not HEX0_temp;
HEX1 <= not HEX1_temp;

    end d_to_7;
