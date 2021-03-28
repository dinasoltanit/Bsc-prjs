library ieee;
use IEEE.std_logic_1164.all;

entity FSM is
port (CLK : in std_logic; --Clock, active high
 RSTn : in std_logic; --Async. Reset, active low
 CoinIn : in std_logic_vector (1 downto 0); --Which coin was inserted
 Soda : out std_logic; --Is Soda dispensed ?
 CoinOut : out std_logic_vector (1 downto 0) --Which coin is dispensed?
 );

end entity;

architecture behavior of FSM is
-- add your code here
type state_type is (idle, --start state/reset
 put_money, --waiting to enter money
 in_1,in_3,in_6,in_5, --represent the current sum of money after returning change
 change_1, --should return change of 1$
 soda_out --dispence soda can.
 ); --type of state machine.
signal current_s,next_s: state_type; --current and next state declaration.

begin

process(CLK,RSTn)
begin
 if(RSTn = '0') then
 current_s <= idle; --defualt state is on RESET
 elsif(clk'event and clk = '1') then
 current_s <= next_s;
 end if;
end process;
--------------------
--FSM process:
process(current_s,CoinIn)
begin
case current_s is
 when idle => --state reset or idle
 Soda <= '0';
 CoinOut <= "00";
 next_s <= put_money;
 ------------------------------------------------------
 when put_money => --wait for money to be entered
 if(CoinIn = "00")then
 Soda <= '0';
 CoinOut <= "00";
 next_s <= put_money;
 elsif(CoinIn = "01")then --insert 1$
 Soda <= '0';
 CoinOut <= "00";
 next_s <= in_1;
 elsif(CoinIn = "10")then --insert 2$
 Soda <= '0';
 CoinOut <= "00";
 next_s <= soda_out;
 elsif(CoinIn = "11")then --insert 5$
 Soda <= '0';
 CoinOut <= "00";
 next_s <= in_5;
 end if;
 ------------------------------------------------------
 when in_1 => 
 if(CoinIn = "00") then--stay on the same state
 Soda <= '0';
 CoinOut <= "00";
 next_s <= in_1;
 elsif(CoinIn = "01") then--inserted another 1$
 Soda <= '0';
 CoinOut <= "00";
 next_s <= soda_out;
 elsif(CoinIn = "10") then--inserted another 2$
 Soda <= '0';
 CoinOut <= "00";
 next_s <= in_3;
 elsif(CoinIn = "11") then
 Soda <= '0';
 CoinOut <= "10";
 next_s <= in_6;
 end if;
 ------------------------------------------------------
 when in_3 =>
 Soda <= '0';
 CoinOut <= "01";
 next_s <= soda_out;
 ------------------------------------------------------
 when in_6 =>
 Soda <= '0';
 CoinOut <= "01";
 next_s <= in_5;
 ------------------------------------------------------
 when in_5 => -- input = 5 coin
 Soda <= '0';
 CoinOut <= "10";
 next_s <= change_1;
 ------------------------------------------------------
 when change_1 => -- input = 5 coin
 Soda <= '0';
 CoinOut <= "01";
 next_s <= soda_out;
 ------------------------------------------------------
 when soda_out =>
 Soda <= '1';
 CoinOut <= "00";
 next_s <= put_money; 
end case;
end process;

end behavior;