library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;

entity C4M1P3 is 
port (
    A,B : STD_LOGIC_VECTOR (3 downto 0);
    Cin : in STD_LOGIC;
    Sum : out STD_LOGIC_VECTOR (3 downto 0);
    Cout: out STD_LOGIC); 
end C4M1P3;

architecture FA4 of C4M1P3 is 
signal cint : STD_LOGIC_VECTOR (2 downto 0); -- Intermediate Carry Signal

begin 
FA0 : entity work.Full_Adder(Fadd)
port map (
A => A(0),
B => B(0),
Cin => Cin,
Sum => Sum(0),
Cout => cint(0)
);

FA1 : entity work.Full_Adder(Fadd)
port map (
A => A(1),
B => B(1),
Cin => Cint(0),
Sum => Sum(1),
Cout => cint(1)
);

FA2 : entity work.Full_Adder(Fadd)
port map (
A => A(2),
B => B(2),
Cin => Cint(1),
Sum => Sum(2),
Cout => cint(2)
);

FA3 : entity work.Full_Adder(Fadd)
port map (
A => A(3),
B => B(3),
Cin => Cint(2),
Sum => Sum(3),
Cout => Cout
);




end FA4;
