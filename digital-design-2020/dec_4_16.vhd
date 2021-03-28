-- Module Name:    dec_4_16 - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dec_4_16 is

port( ain  : in  std_logic_vector(3 downto 0);
		aout : out std_logic_vector(15 downto 0));

end dec_4_16;

architecture Behavioral of dec_4_16 is

COMPONENT dec2to4
PORT( dec_in  : IN  std_logic_vector(1 downto 0);
		dec_out : OUT std_logic_vector(3 downto 0));
END COMPONENT;
component dec2to4_enabled
port( a : in  std_logic_vector(1 downto 0);
		en: in  std_logic;
		b : out std_logic_vector(3 downto 0));
end component;

signal enable : std_logic_vector(3 downto 0);

begin

Inst_dec2to4: dec2to4 PORT MAP(dec_in => ain(3 downto 2) , dec_out(0) => enable(0) , dec_out(1) => enable(1) ,dec_out(2) => enable(2) ,dec_out(3) => enable(3));
endec1: dec2to4_enabled port map(a => ain(1 downto 0), en => enable(0), b => aout(3 downto 0) );
endec2: dec2to4_enabled port map(a => ain(1 downto 0), en => enable(1), b => aout(7 downto 4) );
endec3: dec2to4_enabled port map(a => ain(1 downto 0), en => enable(2), b => aout(11 downto 8) );
endec4: dec2to4_enabled port map(a => ain(1 downto 0), en => enable(3), b => aout(15 downto 12) );

end Behavioral;

