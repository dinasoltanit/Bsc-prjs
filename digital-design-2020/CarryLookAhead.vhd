library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarryLookAhead is
 Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
		  b : in  STD_LOGIC_VECTOR (3 downto 0);
		  c_in : in  STD_LOGIC;
		  sum : out  STD_LOGIC_VECTOR (3 downto 0);
		  c_out : out  STD_LOGIC);
end CarryLookAhead;

architecture Behavioral of CarryLookAhead is
component andd
Port ( a : in  STD_LOGIC;
	  b : in  STD_LOGIC;
	  c : out  STD_LOGIC);
end component;

component xorr
Port ( a : in  STD_LOGIC;
	  b : in  STD_LOGIC;
	  c : out  STD_LOGIC);
end component;

component orr
Port ( a : in  STD_LOGIC;
	  b : in  STD_LOGIC;
	  c : out  STD_LOGIC);
end component;

signal C: std_logic_vector(2 downto 0);
signal P: std_logic_vector(3 downto 0);
signal G: std_logic_vector(3 downto 0);
signal Cand: std_logic_vector(3 downto 0);
begin

GG0 : component andd port map(a(0), b(0), G(0));
GG1 : component andd port map(a(1), b(1), G(1));
GG2 : component andd port map(a(2), b(2), G(2));
GG3 : component andd port map(a(3), b(3), G(3));

PP0 : component xorr port map(a(0), b(0), P(0));
PP1 : component xorr port map(a(1), b(1), P(1));
PP2 : component xorr port map(a(2), b(2), P(2));
PP3 : component xorr port map(a(3), b(3), P(3));

Cand1 : component andd port map(P(0), c_in, Cand(0));
Cor1 : component orr port map(G(0),Cand(0),C(0));
Cand2 : component andd port map(P(1), C(0), Cand(1));
Cor2 : component orr port map(G(1),Cand(1),C(1));
Cand3 : component andd port map(P(2), C(1), Cand(2));
Cor3 : component orr port map(G(2),Cand(2),C(2));
Cand4 : component andd port map(P(3), C(2), Cand(3));
Cor4 : component orr port map(G(3),Cand(3),c_out);

xorF0 : component xorr port map(P(0), c_in, sum(0));
xorF1 : component xorr port map(P(1), C(0), sum(1));
xorF2 : component xorr port map(P(2), C(1), sum(2));
xorF3 : component xorr port map(P(3), C(2), sum(3));

end Behavioral;
