library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Division01 is
port( A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		w : out std_logic_vector(3 downto 0);
		z : out std_logic_vector(3 downto 0));
end Division01;

architecture Behavioral of Division01 is

constant initial: std_logic_vector(2 downto 0):= "001";
constant compute: std_logic_vector(2 downto 0):= "010";
constant done: std_logic_vector(2 downto 0):= "100";

signal start: std_logic:= '1';
signal state: std_logic_vector(2 downto 0):= "001";

signal x: std_logic_vector(3 downto 0);
signal y: std_logic_vector(3 downto 0);
signal r: std_logic_vector(3 downto 0):= "0000";
signal q: std_logic_vector(3 downto 0):= "0000";

begin

process(clk, A, B)
begin
	if rising_edge(clk) then
		case state is 
			when initial =>
					x<=A;
					y<=B;
					if start = '1' then
						state <= compute;
					else
						state <= initial;
					end if;
			when compute =>
			
					if x >= y then
						x <= x-y;
						q <= q + '1';
					end if;
					
					if x >= y then
						state <= compute;
					else
						state <= done;
					end if;
					
			when done =>
					r <= x;
					state <= initial;
			when others =>
					state <=initial;
					q <= "0000";
		end case;
	end if;
end process;

w <= r;
z <= q;

end Behavioral;

