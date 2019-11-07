library ieee;
use ieee.std_logic_1164.all;

entity assignment1 is
port(C,D:in std_logic;
X:out std_logic
);
end entity assignment1;

architecture logic of assignment1 is
begin
X = not (C and D);
end architecture logic;
