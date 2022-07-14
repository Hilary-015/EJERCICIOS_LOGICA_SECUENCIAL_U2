----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:12:53 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio19_Contador_AS_DES - Behavioral 
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

entity Ejercicio19_Contador_AS_DES is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Ejercicio19_Contador_AS_DES;

architecture Behavioral of Ejercicio19_Contador_AS_DES is

type estados is(P0, P1, P2, P3, P4, P5, P6, P7);
signal edo_pres, edo_fut: estados;

begin

proceso1: process (edo_pres, x) begin
		case edo_pres is
			when P0 => 
				if x = '0' then 
					edo_fut <= P1;
				end if;
			when P1 =>
				if x = '0' then 
					edo_fut <= P2;
				else
					edo_fut <= P4;
				end if;
			when P2 =>
				if x = '0' then 
					edo_fut <= P3;
				else
					edo_fut <= P5;
				end if;
			when P3 =>
				if x = '0' then 
					edo_fut <= P4;
				else
					edo_fut <= P1;
				end if;
			when P4 =>
				if x = '0' then 
					edo_fut <= P5;
				else
					edo_fut <= P2;
				end if;
			when P5 => edo_fut <= P6;
			when P6 => edo_fut <= P7;
			when P7 =>
				if x = '0' then 
					edo_fut <= P0;
				else
					edo_fut <= P3;
				end if;
			end case;
end process proceso1;

--Conversion a decimal para presentar en la simulacion 
proceso2 : process(edo_pres) begin
	case edo_pres is
		when P0 => Q <= "0000";
		when P1 => Q <= "0001";
		when P2 => Q <= "0010";
		when P3 => Q <= "0011";
		when P4 => Q <= "0100";
		when P5 => Q <= "0101";
		when P6 => Q <= "0110";
		when P7 => Q <= "0111";
	end case;
	
end process proceso2;

proceso3: process (clk) begin
	if(clk'event and clk='1') then
		edo_pres <= edo_fut;
	end if;
end process proceso3;

end Behavioral;

