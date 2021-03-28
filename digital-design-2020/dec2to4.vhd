-- Module Name:    dec2to4 - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec2to4 is
port( dec_in  : in  std_logic_vector(1 downto 0);
		dec_out : out std_logic_vector(3 downto 0));
end dec2to4;

architecture Behavioral of dec2to4 is

begin
dec_out(0) <= (not dec_in(0)) and (not dec_in(1));
dec_out(1) <= dec_in(0) and (not dec_in(1));
dec_out(2) <= (not dec_in(0)) and dec_in(1);
dec_out(3) <= dec_in(0) and dec_in(1);

end Behavioral;

