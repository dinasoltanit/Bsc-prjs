LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CarryLookAhead_Test IS
END CarryLookAhead_Test;
 
ARCHITECTURE behavior OF CarryLookAhead_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarryLookAhead
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         c_in : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         c_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal c_in : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal c_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarryLookAhead PORT MAP (
          a => a,
          b => b,
          c_in => c_in,
          sum => sum,
          c_out => c_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
		a <= "0010";
		b <= "0100";
		c_in <= '0';
		
		wait for 10 us;
		
	   a <= "0101";
		b <= "0110";
		c_in <= '0';
		
		wait for 10 us;
		
		a <= "1000";
		b <= "1001";
		c_in <= '0';
		
		wait for 10 us;
		
		a <= "1000";
		b <= "1001";
		c_in <= '1';
		
		wait for 10 us;
		
		a <= "1011";
		b <= "1001";
		c_in <= '0';
		
		wait for 10 us;

      --wait;
   end process;

END;
