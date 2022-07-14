----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:07:22 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio13_Diagrama1 - Behavioral 
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

entity Ejercicio13_Diagrama1 is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           z : out  STD_LOGIC);
end Ejercicio13_Diagrama1;

architecture Behavioral of Ejercicio13_Diagrama1 is

type estados is(A, B, C, D);
signal edo_pres, edo_fut: estados;

begin

proceso1: process (edo_pres, x) begin
		case edo_pres is
			when A => z <= '0';
				if x = '0' then 				
					edo_fut <= D;
				else
					edo_fut <= B;
				end if;
			when B => z <= '0';
				if x = '0' then 
					edo_fut <= D;
				else
					edo_fut <= C;
				end if;
			when C => z <= '0';
				if x = '0' then 
					edo_fut <= D;
				else
					edo_fut <= B;
				end if;
			when D =>
				if x = '0' then 
					edo_fut <= D;
					z <= '0';
				else
					edo_fut <= A;
					z <= '1';
				end if;
		end case;
end process proceso1;
 
proceso2: process (clk) begin
	if(RST='1')then
		edo_pres <= A;
	elsif(clk'event and clk='1') then
		edo_pres <= edo_fut;
	end if;
end process proceso2;

end Behavioral;

