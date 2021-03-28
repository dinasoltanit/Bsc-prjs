----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:22:06 11/15/2020 
-- Design Name: 
-- Module Name:    clk_divider - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_clkdivider is
    Port ( clk : in  STD_LOGIC;
			  ss : in STD_LOGIC_VECTOR(2 downto 0);
           --divider_23 : out  STD_LOGIC;
			  --divider_19 : out  STD_LOGIC;
           --divider_20 : out  STD_LOGIC;
           --divider_16 : out  STD_LOGIC;
           --divider_15 : out  STD_LOGIC;
			  outt : out  STD_LOGIC);
           --r : out  STD_LOGIC_VECTOR (4 downto 0);
           --s : out  STD_LOGIC_VECTOR (4 downto 0));
end mux_clkdivider;

architecture Behavioral of mux_clkdivider is
component mux is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           i2 : in  STD_LOGIC;
           i3 : in  STD_LOGIC;
			  i4 : in  STD_LOGIC;
           ss : in  STD_LOGIC_VECTOR (2 downto 0);
           o : out  STD_LOGIC);
end component;
signal counter_int_23 : unsigned(4 downto 0) := "00000";
signal counter_int_20 : unsigned(4 downto 0) := "00000";
signal counter_int_19 : unsigned(4 downto 0) := "00000";
signal counter_int_16 : unsigned(4 downto 0) := "00000";
signal counter_int_15 : unsigned(4 downto 0) := "00000";
signal dividerr_23 :  STD_LOGIC;
signal dividerr_20 :  STD_LOGIC;
signal dividerr_19 :  STD_LOGIC;
signal dividerr_16 :  STD_LOGIC;
signal dividerr_15 :  STD_LOGIC;

signal set , reset : std_logic_vector (4 downto 0) :="00000";
begin
--------------------------------------------------------------23
		process(clk)
		begin
				if rising_edge(clk) then
					if counter_int_23 = "10110" then
						set(0) <= not (reset(0));
						counter_int_23 <= "00000";
					else counter_int_23 <= counter_int_23 + 1;
						
		end if;
		end if;
		
		end process;
		
		process(clk)
		begin
				if falling_edge(clk) then
					if counter_int_23 = "01011" then
					reset(0) <= set(0);
					end if;
				end if;
		end process;
		dividerr_23 <= set(0) xor reset(0);
		--r(0) <= reset(0);
		--s(0) <= set(0);
--------------------------------------------------------------20
		process(clk)
		begin
				if rising_edge(clk) then
					if counter_int_20 = "10011" then
						set(1) <= not (reset(1));
						counter_int_20 <= "00000";
					else counter_int_20 <= counter_int_20 + 1;
						
		end if;
		end if;
		
		end process;
		
		process(clk)
		begin
				if falling_edge(clk) then
					if counter_int_20 = "01001" then
					reset(1) <= set(1);
					end if;
				end if;
		end process;
		dividerr_20 <= set(1) xor reset(1);
		--r(1) <= reset(1);
		--s(1) <= set(1);
-----------------------------------------------------------------19
		process(clk)
		begin
				if rising_edge(clk) then
					if counter_int_19 = "10010" then
						set(2) <= not (reset(2));
						counter_int_19 <= "00000";
					else counter_int_19 <= counter_int_19 + 1;
						
		end if;
		end if;
		
		end process;
		
		process(clk)
		begin
				if falling_edge(clk) then
					if counter_int_19 = "01001" then
					reset(2) <= set(2);
					end if;
				end if;
		end process;
		dividerr_19 <= set(2) xor reset(2);
		--r(2) <= reset(2);
		--s(2) <= set(2);
-------------------------------------------------------------------16
		process(clk)
		begin
				if rising_edge(clk) then
					if counter_int_16 = "01111" then
						set(3) <= not (reset(3));
						counter_int_16 <= "00000";
					else counter_int_16 <= counter_int_16 + 1;
						
		end if;
		end if;
		
		end process;
		
		process(clk)
		begin
				if falling_edge(clk) then
					if counter_int_16 = "00111" then
					reset(3) <= set(3);
					end if;
				end if;
		end process;
		dividerr_16 <= set(3) xor reset(3);
		--r(3) <= reset(3);
		--s(3) <= set(3);
--------------------------------------------------------------------5
		process(clk)
		begin
				if rising_edge(clk) then
					if counter_int_15 = "01110" then
						set(4) <= not (reset(4));
						counter_int_15 <= "00000";
					else counter_int_15 <= counter_int_15 + 1;
						
		end if;
		end if;
		
		end process;
		
		process(clk)
		begin
				if falling_edge(clk) then
					if counter_int_15 = "00111" then
					reset(4) <= set(4);
					end if;
				end if;
		end process;
		dividerr_15 <= set(4) xor reset(4);
		--r(4) <= reset(4);
		--s(4) <= set(4);
inst_mux : mux port map(i0=>dividerr_23,i1=>dividerr_20,i2=>dividerr_19,i3=>dividerr_16,i4=>dividerr_15,o=>outt,ss=>ss);
end Behavioral;

