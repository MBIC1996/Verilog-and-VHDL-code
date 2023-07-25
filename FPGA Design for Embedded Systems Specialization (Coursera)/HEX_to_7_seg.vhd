library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.NUMERIC_STD.all;

entity HEX_TO_7 is
    port(
    HEX_in: in STD_LOGIC_VECTOR (3 downto 0);
    sevseg_out : out STD_LOGIC_VECTOR(7 downto 0));

    end HEX_TO_7;

architecture conversion of HEX_TO_7 is 
    signal HEX0_temp : STD_LOGIC_VECTOR (7 downto 0);

begin    
    
    process(HEX_in)
    begin
    
         case (HEX_in) is 
            when "0000" => HEX0_temp <= "00111111"; -- 0
            when "0001" => HEX0_temp <= "00000110"; -- 1
            when "0010" => HEX0_temp <= "01011011"; -- 2
            when "0011" => HEX0_temp <= "01001111"; -- 3
            when "0100" => HEX0_temp <= "01100111"; -- 4
            when "0101" => HEX0_temp <= "01101101"; -- 5
            when "0110" => HEX0_temp <= "01111101"; -- 6
            when "0111" => HEX0_temp <= "00000111"; -- 7

            when "1000" => HEX0_temp <= "01111111"; -- 8
            when "1001" => HEX0_temp <= "01101111"; -- 9
            when others => HEX0_temp <= "00000000";
        end case;
    end process;

    sevseg_out <= HEX0_temp;

end conversion;



