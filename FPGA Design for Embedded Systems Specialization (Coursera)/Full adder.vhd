library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;

entity Full_Adder is 
port (
    A,B,Cin : in STD_LOGIC;
    Sum,Cout: out STD_LOGIC); 
end Full_Adder;

architecture Fadd of Full_Adder is 

begin

    Sum <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);
end Fadd;

