library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g01_lab1 is -- declaration of the 8-bit synchronous counter entity
	Port(clk	: in std_logic;
	direction : in std_logic;
	rst: in std_logic;
	enable: in std_logic;
	output: out std_logic_vector(7 downto 0));
end g01_lab1;

architecture implementation of g01_lab1 is -- architecture implementation of the entity
signal count: integer range 0 to 255;

begin
	counter: process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then -- synchronous so inside the clocked if
				output <= (others => '0');
				count <= 0;
			elsif enable = '1' then -- counting inside here
				if direction = '1' then
					count <= count + 1; -- direction is 1 so count up
					output <= std_logic_vector( TO_UNSIGNED(count, 8) );
				else
					count <= count - 1; -- direction is 0 so count down
					output <= std_logic_vector( TO_UNSIGNED(count, 8) );
				end if;
			end if;
		end if;
	end process;
end implementation;