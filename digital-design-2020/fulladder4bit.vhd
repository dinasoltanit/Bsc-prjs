
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fulladder4bit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           c_in : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           c_out : out  STD_LOGIC);
end fulladder4bit;

architecture Behavioral of fulladder4bit is

component fulladder1bit
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           c_out : out  STD_LOGIC);
end component;

signal C: std_logic_vector(2 downto 0);


begin


FA0 : component fulladder1bit port map(a(0), b(0) , c_in, sum(0), C(0) );

FA1 : component fulladder1bit port map(a(1), b(1) , C(0), sum(1), C(1) );

FA2 : component fulladder1bit port map(a(2), b(2) , C(1), sum(2), C(2) );

FA3 : component fulladder1bit port map(a(3), b(3) , C(2), sum(3), c_out );




end Behavioral;

