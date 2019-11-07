library IEEE;
use IEEE.std_logic_1164.all; -- Usage of multi-logic values 
--use IEEE.std_logic_arith.all; -- Usage of arithematic operation
--use IEEE.std_logic_unsigned.all; 
--use ieee.numeric_std.all;
entity evenodd_parity_checker1 is
port(input_bits: in std_logic_vector(7 downto 0);
parity_bit: in std_logic;
even_parity: out std_logic;
odd_parity: out std_logic);
end entity evenodd_parity_checker1;

architecture parity_operations of evenodd_parity_checker1 is
signal Z1,Z2: std_logic;
component paritycheck is
port(d: in std_logic_vector(7 downto 0);
parity: in std_logic;
Z1: out std_logic);
end component paritycheck;
component not_gate is
port(A: in std_logic;
X: out std_logic);
end component not_gate;
begin

N: paritycheck port map (input_bits, parity_bit, Z1);
N1: not_gate port map (Z1,Z2);
even_parity<=Z2;
odd_parity <= Z1;
end architecture;
