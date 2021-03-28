library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity clk_200X is
Port ( clk : in  STD_LOGIC;
       reset : in  STD_LOGIC;
		 pwmout : out  STD_LOGIC);
end clk_200X;

architecture Behavioral of clk_200X is
signal cnt: integer range 0 to (500000000/200)-1:=0; --to control period
signal cmp: integer := 12500000; --PWM=75% -- to control duty cycle

begin

process(clk, reset)
begin
	if reset = '1' then 
		cnt <= 0;
	elsif rising_edge(clk) then 
		if cnt< (500000000/200)-1 then 
			cnt <= cnt + 1;
		else
			cnt <= 0;
		end if;
	end if;
end process;

pwmout <= '1' when cnt < cmp else '0';
end Behavioral;