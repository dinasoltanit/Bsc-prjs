----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:38:02 07/24/2020 
-- Design Name: 
-- Module Name:    Vend01 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--Designig contains defining different states and things that should be done
--if each of the states happen
entity Vend01 is
port ( x : in bit;
		clk: in std_logic;
		reset : in bit;
		y : out std_logic_vector(1 downto 0));
		 
end Vend01;

architecture Behavioral of Vend01 is
type states is (a,b,c,d,e,f,g,h);
signal state : states := a;
signal next_state : states := a;

begin

process(clk)
begin
	if rising_edge(clk) then
		state <= next_state;
	end if;	
end process;

process(state,x,reset)
begin
	case state is
		--1
		when a => if x='0' then
						next_state <= a;
						y <= "00";
					else
						next_state <= f;
						y <= "00";
					end if;
		--2
		when b => if x='0' then
						next_state <= b;
						y <= "00";
					else
						next_state <= c;
						y <= "00";
					end if;
		--3
		when c => if x='0' then
						next_state <= d;
						y <= "00";
						
					else
						next_state <= e;
						y <= "00";
						
					end if;
		--4
		when d => if x='0' then
						next_state <= a;
						if reset='1' then
					    y <= "00";
					 else	 
					  y <= "01" after 1000 ns;
					 end if;
						-- with coins and in accurate amount.
					else
						next_state <= a;
						if reset='1' then
					    y <= "00";
					 else	 
					  y <= "01" after 1000 ns;
					 end if;
						-- with a paper money and two coins; they'll get the product either.
					end if;
		--5
		when e => if x='0' then
						next_state <= a;
						--
					 if reset='1' then
					    y <= "00";
					 else	 
					  y <= "01" after 1000 ns;
					 end if;
						-- with two paper money and we should give back two coins.
					else
						next_state <= a;
						if reset='1' then
					    y <= "00";
					 else	 
					  y <= "01" after 1000 ns;
					 end if;
						-- with two paper money and  a coin and we should give back three coins.
					end if;
		--6
		when f => if x='0' then
						next_state <= g;
						y <= "00";
					else
						next_state <= f;
						y <= "00";
					end if;
		--7
		when g => if x='0' then
						next_state <= a;
						y <= "00";
					else
						next_state <= h;
						y <= "00";
					end if;
		--8
		when h => if x='0' then
						next_state <= a;
						if reset='1' then
					    y <= "00";
					 else	 
					  y <= "10" after 1000 ns;
					 end if;
					else
						next_state <= a;
						if reset='1' then
					    y <= "00";
					 else	 
					  y <= "10" after 1000 ns;
					 end if;
					end if;
		end case;			
	end process;
end Behavioral;

