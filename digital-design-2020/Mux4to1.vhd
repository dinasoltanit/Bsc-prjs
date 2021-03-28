----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:11:08 06/23/2020 
-- Design Name: 
-- Module Name:    Mux4to1 - Behavioral 
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

entity Mux4to1 is
port( mux4to1_in : in std_logic_vector(3 downto 0);
		mux4to1_sel : in std_logic_vector(1 downto 0);
		mux4to1_out : out std_logic);
end Mux4to1;

architecture Behavioral of Mux4to1 is
begin
 with mux4to1_sel select
mux4to1_out <= mux4to1_in(0) when "00",
			  mux4to1_in(1) when "01",
			  mux4to1_in(2) when "10",
			  mux4to1_in(3) when "11",
			  '0' when others;

end Behavioral;

