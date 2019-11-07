-- AND GATE 
library IEEE;
use IEEE.std_logic_1164.all;
 
entity and_gate is
Port( A : in std_logic;
		B : in std_logic;
		C : in std_logic;
		Y : out std_logic);
end and_gate;
architecture Behavioral of and_gate is
begin

	Y<=(A and B);
	
end Behavioral;


-JK FLIP FLOP
library IEEE;  
 use IEEE.STD_LOGIC_1164.ALL;  
 use IEEE.STD_LOGIC_ARITH.ALL;  
 use IEEE.STD_LOGIC_UNSIGNED.ALL;
  
 entity jkfff is  
 Port ( j     : in STD_LOGIC;  
        k     : in STD_LOGIC;  
        clock : in STD_LOGIC;  
        reset : in STD_LOGIC;  
        q     : out STD_LOGIC  
    );  
 end jkfff;  

 architecture JK_Work of jkfff is  
 signal jk    : std_logic_vector(1 downto 0) := "00";  
 signal qsig  : std_logic := '0';
  
 begin  
     jk  <= j & k;  
 process(reset,clock)  
 begin  
     if (reset = '1')then  
         qsig <='0';  
     elsif (clock'event and clock = '1')then  
         case (jk) is  
             when "00"   => qsig <= qsig;      
             when "01"   => qsig <= '0';  
             when "10"   => qsig <= '1';  
             when others => qsig <= not qsig;  
         end case;  
     end if;  
 end process;
  
 q <= qsig;  
 end JK_Work;


--DOWN COUNTER (7 to 2)

library IEEE;  
use IEEE.STD_LOGIC_1164.ALL;  
use IEEE.STD_LOGIC_ARITH.ALL;  
use IEEE.STD_LOGIC_UNSIGNED.ALL;  

 entity mod7_counter is  
 Port ( clock : in std_logic;  
        y2    : inout std_logic;
        count : out std_logic_vector(2 downto 0)  
    );  
 end mod7_counter;
  
 architecture structural_mod7_counter of mod7_counter is  
component jkfff  
   port(  
     clock : in std_logic;  
     reset : in std_logic;  
     j     : in std_logic;  
     k     : in std_logic;  
     q     : out std_logic      
     );  
end component;
component and_gate
		port(
		A: in std_logic;
		B: in std_logic;
		C: in std_logic;
		Y: out std_logic
		);
end component;		
  
signal temp : std_logic_vector(2 downto 0) := "111";
signal f : std_logic;
begin 
 G1: and_gate
	port map (
		temp(2),
		temp(1),
		temp(0),
		f);
y2<=f;
JK0 : jkfff  
     port map (  
       reset  => f,  
       clock  => clock,  
       j      => '1',  
       k      => '1',        
       q      => temp(0)  
     );  

JK1 : jkfff  
     port map (  
       reset  => f, 
       clock  => not temp(0),  
       j      => '1',  
       k      => '1',      
       q      => temp(1)  
     );  

JK2 : jkfff 
     port map (  
       reset  => f,  
       clock  => not temp(1),  
       j      => '1',  
       k      => '1',  
       q      => temp(2)  
     );  

 count(2) <= not temp(2);  
 count(1) <= not temp(1);  
 count(0) <= not temp(0);

 end structural_mod7_counter;
