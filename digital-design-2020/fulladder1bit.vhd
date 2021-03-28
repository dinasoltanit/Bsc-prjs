
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity fulladder1bit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           c_out : out  STD_LOGIC);
end fulladder1bit;

architecture Behavioral of fulladder1bit is
component andd
Port(a : in  STD_LOGIC;
	  b : in  STD_LOGIC;
	  c : out  STD_LOGIC);
end component;

component xorr
Port(a : in  STD_LOGIC;
	  b : in  STD_LOGIC;
	  c : out  STD_LOGIC);
end component;

component orr
Port(a : in  STD_LOGIC;
	  b : in  STD_LOGIC;
	  c : out  STD_LOGIC);
end component;

signal z: std_logic; 
signal annd: std_logic_vector(1 downto 0);

begin

--z <= a xor b;
Uxorr01 : component xorr port map(a,b,z);
Uxorr02 : component xorr port map(z,c_in,sum);
--sum <= a xor b xor c_in;
Uand03 : component andd port map(a,b,annd(0));
Uand04 : component andd port map(z,c_in,annd(1));
Uorr05 : component orr port map(annd(0), annd(1), c_out);
--c_out <= ( z and c_in) or (a and b);


end Behavioral;

