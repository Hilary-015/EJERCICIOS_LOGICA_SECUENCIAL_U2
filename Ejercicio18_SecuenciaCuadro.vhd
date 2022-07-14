----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:04:25 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio18_SecuenciaCuadro - Behavioral 
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

entity Ejercicio18_SecuenciaCuadro is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC;
           z : out  STD_LOGIC;
			  salidaB : out STD_LOGIC_VECTOR (0 to 2));
end Ejercicio18_SecuenciaCuadro;

architecture Behavioral of Ejercicio18_SecuenciaCuadro is

type estados is(A, B, C, D, E);
signal edo_pres, edo_fut: estados;

begin

proceso1: process (edo_pres, x) begin
		case edo_pres is
			when A => z <= '0';
				if x = '0' then 
					edo_fut <= B;
					salidaB <= "001";
				else
					edo_fut <= E;
					salidaB <= "100";
				end if;
			when B => z <= '1';
				if x = '0' then 
					edo_fut <= A;
					salidaB <= "000";
				else
					edo_fut <= C;
					salidaB <= "010";
				end if;
			when C =>
				if x = '0' then 
					edo_fut <= B;
					z <= '0';
					salidaB <= "001";
				else
					edo_fut <= C;
					z <= '1';
					salidaB <= "010";
				end if;
			when D => z <= '0';
				if x = '0' then 
					edo_fut <= C;
					salidaB <= "010";
				else
					edo_fut <= E;
					salidaB <= "100";
				end if;
			when E =>
				if x = '0' then 
					edo_fut <= D;
					z <= '1';
					salidaB <= "011";
				else
					edo_fut <= A;
					z <= '0';
					salidaB <= "000";
				end if;
		end case;
end process proceso1;

proceso2: process (clk) begin
	if(clk'event and clk='1') then
		edo_pres <= edo_fut;
	end if;
end process proceso2;

end Behavioral;

