library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Decoder is 
port ( BCD_in: in std_logic_vector (3 downto 0);
		 Binary_out: out std_logic_vector (9 downto 0));
end Decoder;

architecture Data_flow of Decoder is

begin

process (BCD_in)
begin 

case BCD_in is 
when "0000" => Binary_out <= "0000000001"; --0
when "0001" => Binary_out <= "0000000010"; --1
when "0010" => Binary_out <= "0000000100"; --2
when "0011" => Binary_out <= "0000001000"; --3
when "0100" => Binary_out <= "0000010000"; --4
when "0101" => Binary_out <= "0000100000"; --5
when "0110" => Binary_out <= "0001000000"; --6
when "0111" => Binary_out <= "0010000000"; --7
when "1000" => Binary_out <= "0100000000"; --8
when "1001" => Binary_out <= "1000000000"; --9
when others => Binary_out <= "0000000000"; -- Invalid Input

end case;
