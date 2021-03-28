-- Module Name:    mux8_1 - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_1 is
PORT( mux81_in  : in std_logic_vector(7 downto 0);
		mux81_sel : in std_logic_vector(2 downto 0);
		mux81_out : out std_logic);
end mux8_1;

architecture Behavioral of mux8_1 is

COMPONENT mux2_1
PORT( mux21_in  : IN std_logic_vector(1 downto 0);
		mux21_sel : IN std_logic;
		mux21_out : OUT std_logic);
END COMPONENT;

component mux4_1
port( mux41_in  : in std_logic_vector(3 downto 0);
		mux41_sel : in std_logic_vector(1 downto 0);
		mux41_out : out std_logic);
end component;

signal line : std_logic_vector(1 downto 0);

begin

mux41_1: mux4_1 port map(mux41_in => mux81_in(3 downto 0), mux41_out => line(0), mux41_sel(0) => mux81_sel(0), mux41_sel(1) => mux81_sel(1));
mux41_2: mux4_1 port map(mux41_in => mux81_in(7 downto 4), mux41_out => line(1), mux41_sel(0) => mux81_sel(0), mux41_sel(1) => mux81_sel(1) );
Inst_mux_2to1: mux2_1 PORT MAP( mux21_in(0) => line(0) , mux21_in(1) => line(1), mux21_out => mux81_out, mux21_sel => mux81_sel(2));
end Behavioral;