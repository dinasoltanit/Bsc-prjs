----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:11:38 06/23/2020 
-- Design Name: 
-- Module Name:    Mux2to1 - Behavioral 
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

entity Mux2to1 is
port( mux2to1_in : in std_logic_vector(1 downto 0);
		mux2to1_sel : in std_logic;
		mux2to1_out : out std_logic);
end Mux2to1;

architecture Behavioral of Mux2to1 is
begin
 with mux2to1_sel select
		mux2to1_out <= mux2to1_in(0) when '0',
		mux2to1_in(1) when '1',
		'0' when others;
end Behavioral;

