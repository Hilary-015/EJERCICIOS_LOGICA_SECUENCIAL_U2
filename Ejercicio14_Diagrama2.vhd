----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:01 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio14_Diagrama2 - Behavioral 
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

entity Ejercicio14_Diagrama2 is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (0 to 2));
end Ejercicio14_Diagrama2;

architecture Behavioral of Ejercicio14_Diagrama2 is

type estados is(A, B, C, D, E, F, G, H);
signal edo_pres, edo_fut: estados;

begin

proceso1: process (edo_pres, x) begin
		case edo_pres is
			when A => z <= "000";
				if x = '1' then 
					edo_fut <= B;
				else
					edo_fut <= H;
				end if;
			when B => z <= "001";
				if x = '1' then 
					edo_fut <= C;
				else
					edo_fut <= A;
				end if;
			when C => z <= "011";
				if x = '1' then 
					edo_fut <= D;
				else
					edo_fut <= B;
				end if;
			when D => z <= "010";
				if x = '1' then 
					edo_fut <= E;
				else
					edo_fut <= C;
				end if;
			when E => z <= "110";
				if x = '1' then 
					edo_fut <= F;
				else
					edo_fut <= D;
				end if;
			when F => z <= "111";
				if x = '1' then 
					edo_fut <= G;
				else
					edo_fut <= E;
				end if;
			when G => z <= "101";
				if x = '1' then 
					edo_fut <= H;
				else
					edo_fut <= F;
				end if;
			when H => z <= "110";
				if x = '1' then 
					edo_fut <= A;
				else
					edo_fut <= G;
				end if;
			end case;
end process proceso1;
			
proceso2: process (clk) begin
	if(clk'event and clk='1') then
		edo_pres <= edo_fut;
	end if;
end process proceso2;

end Behavioral;

