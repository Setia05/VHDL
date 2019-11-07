library ieee;
use ieee.std_logic_1164.all;

entity nor is
port(C,D:in std_logic;
X:out std_logic
);
end entity assignment1;

architecture logic of nor is
begin
X = not (C or D);
end architecture logic;
