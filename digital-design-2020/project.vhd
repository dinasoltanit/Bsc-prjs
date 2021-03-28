library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity project is
    Port ( up_down : in  STD_LOGIC;
           clk     : in  STD_LOGIC;
			  f_2     : out STD_LOGIC;
  			  f_3     : out STD_LOGIC;
			  f_5     : out STD_LOGIC;
           outLED   : out STD_LOGIC_VECTOR (6 downto 0));
end project;

architecture Behavioral of project is

signal counter_100Hz : unsigned(18 downto 0):="0000000000000000000";
signal clk_100Hz     : std_logic;
signal set , reset   : std_logic:='0';
signal counter       : unsigned(3 downto 0);

begin

--clk divider to 5----------------------------------------------

process(clk)
begin
if rising_edge(clk) then
		if counter_100Hz = "1111010000100011111" then
			set <= not(reset);
			counter_100Hz <= "0000000000000000000";
		else
			counter_100Hz <= counter_100Hz + 1;
		end if;
	end if;
end process;

--
process(clk)
begin
	if falling_edge(clk) then
		if counter_100Hz = "111101000010001111" then
			reset <= set;
		end if;
	end if;
end process;
clk_100Hz <= set xor reset;
-----------------------------------------------------------------
process
begin
if up_down = '0' then
	counter <= "0000";
else
	counter <= "1001";
end if;
end process;
-----------------------------------------------------------------
process(clk_100Hz)
begin
if rising_edge(clk_100Hz) then
	if up_down = '0' then
		if counter = "1001" then
			counter <= "0000";
		else
			counter <= counter + 1;
		end if;
	end if;
	if up_down = '1' then
		if counter = "0000" then
			counter <= "1001";
		else
			counter <= counter - 1;
		end if;
	end if;
	
--if it is dividable on 2, 3, or 5
	 case counter is
    when "0000" => f_2 <= '1'; -- "by 2" 0   
    when "0010" => f_2 <= '1'; -- "by 2" 2
    when "0100" => f_2 <= '1'; -- "by 2" 4
    when "0110" => f_2 <= '1'; -- "by 2" 6
    when "1000" => f_2 <= '1'; -- "by 2" 8
    when others => f_2 <= '0'; -- others
    end case;
	 
	 case counter is
    when "0011" => f_3 <= '1'; -- "by 3" 3
    when "0110" => f_3 <= '1'; -- "by 3" 6
    when "1001" => f_3 <= '1'; -- "by 3" 9
	 when "0000" => f_3 <= '1'; -- "by 3" 0 
    when others => f_3 <= '0'; -- others
    end case;
	 
	 case counter is
    when "0101" => f_5 <= '1'; -- "by 5" 5
    when "0000" => f_5 <= '1'; -- "by 5" 0    
    when others => f_5 <= '0'; -- others
    end case;	 

--showing on seven segment----------------------------------------
    case counter is
    when "0000" => outLED <= "0000001"; -- "0"     
    when "0001" => outLED <= "1001111"; -- "1" 
    when "0010" => outLED <= "0010010"; -- "2" 
    when "0011" => outLED <= "0000110"; -- "3" 
    when "0100" => outLED <= "1001100"; -- "4" 
    when "0101" => outLED <= "0100100"; -- "5" 
    when "0110" => outLED <= "0100000"; -- "6" 
    when "0111" => outLED <= "0001111"; -- "7" 
    when "1000" => outLED <= "0000000"; -- "8"     
    when "1001" => outLED <= "0000100"; -- "9" 
    when others => outLED <= "0000000"; -- others
    end case;

end if;
end process;
end Behavioral;

