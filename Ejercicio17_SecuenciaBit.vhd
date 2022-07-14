----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:55:47 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio17_SecuenciaBit - Behavioral 
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
-- Hilary Madeley Calva Camacho
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ejercicio17_SecuenciaBit is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR(0 to 6));
end Ejercicio17_SecuenciaBit;

architecture Behavioral of Ejercicio17_SecuenciaBit is

type estados is(A, B, C, D, E, F, G, H);
signal edo_pres, edo_fut: estados;

begin

proceso1: process (edo_pres, x) begin
		case edo_pres is
			when A => z <= "0000000";
				if x = '0' then 
					edo_fut <= B;
				end if;
			when B => z <= "0000000";
				if x = '1' then 
					edo_fut <= C;
				end if;
			when C => z <= "0000000";
				if x = '1' then 
					edo_fut <= D;
				end if;
			when D => z <= "0000000";
				if x = '0' then 
					edo_fut <= E;
				end if;
			when E => z <= "0000000";
				if x = '1' then 
					edo_fut <= F;
				end if;
			when F => z <= "0000000";
				if x = '0' then 
					edo_fut <= G;
				end if;
			when G => z <= "0000000";
				if x = '1' then 
					edo_fut <= H;
				end if;
			when H => 
				if x = '0' then 
					edo_fut <= A;
					z <= "1101111";
				else
					z <= "0000000";
				end if;			
		end case;
end process proceso1;

proceso2: process (clk) begin
	if(clk'event and clk='1') then
		edo_pres <= edo_fut;
	end if;
end process proceso2;

end Behavioral;


