library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

--entity description of MAC
entity g16_lab2 is
port(	  x: 		in std_logic_vector(11 downto 0); --x input
		  y: 		in std_logic_vector(11 downto 0); --y input
		  N: 		in std_logic_vector(9 downto 0); --N indicates number of pairs essentially	
		  clk: 		in std_logic;	--clock signal	
		  rst: 		in std_logic; --asynchronous active high reset 
		  mac: 		out std_logic_vector(23 downto 0);	--resultant mac out
		  ready: 	out std_logic); --ready signal
end g16_lab2;

--architecture description of MAC
architecture logic of g16_lab2 is
	signal mac_temp : signed(23 downto 0);		--var holds temp resultant of mac ops
	signal count: integer range 0 to 1000 := 0;	
--counter which on r-edge is incremented and verify with N, if less continue mac operation, else exit

	begin
	mac_math : process(clk, rst, x, y)
		begin
		if rst = '1' then
			mac_temp <= (others => '0'); --if rst is 1, reset the mac_temp	
		elsif rising_edge(clk) then
			if to_unsigned(count, 10) < unsigned(N) then --if counter < N, perform mac op
				ready <= '0';	--ready goes to 0
				mac_temp <= mac_temp + (signed(x)*signed(y)); -- multiply the input signals then accumulate
				count <= count +1; --counter gets incremented			
			elsif to_unsigned(count, 10) > unsigned(N) then --if counter exceeds 1000 we exit
				ready <= '1'; --ready goes to one
			end if; --end if
		end if; --end if
	end process; --end process
	mac <= std_logic_vector(mac_temp);	--reassign mac_temp to mac
end logic;	--end architecture	
