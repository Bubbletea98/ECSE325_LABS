 library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.NUMERIC_STD.ALL;
 entity g16_lab1 is
    port( clk : in std_logic;
	       countbytwo : in std_logic;
			 rst : in std_logic;
			 enable: in std_logic;
			 output : out std_logic_vector(7 downto 0));
 end g16_lab1;
 architecture g16_process of g16_lab1 is
     signal counter: integer range 0 to 255;
 begin 
     process (clk, rst)
	  begin
	     if rst='1' then
			   counter<=0;
		  elsif rising_edge(clk) then
			   if enable='1' then
					if countbytwo ='1' then
						 counter <=counter +2;
					else
						 counter <=counter;
			      end if;
				end if;
		    end if;
		 end process;
		 output<= std_logic_vector(to_unsigned(counter,8));
 end g16_process;
			