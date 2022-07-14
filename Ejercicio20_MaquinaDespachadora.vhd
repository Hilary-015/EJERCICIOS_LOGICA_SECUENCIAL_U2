----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:27:57 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio20_MaquinaDespachadora - Behavioral 
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

entity Ejercicio20_MaquinaDespachadora is
    Port ( clk : in  STD_LOGIC;
           moneda : in  STD_LOGIC_VECTOR (4 downto 0);
           cambio : out  STD_LOGIC_VECTOR (3 downto 0));
end Ejercicio20_MaquinaDespachadora;

architecture Behavioral of Ejercicio20_MaquinaDespachadora is

type estados is(inicio, cinco, diez, veinte);
signal edo_pres, edo_fut: estados;

begin

proceso1: process (edo_pres, moneda) begin
		case edo_pres is
			when inicio => cambio <= "0000";
			
				case moneda is
					when "00101" => edo_fut <= cinco;
					when "01010" => edo_fut <= diez;
					when "10100" => edo_fut <= veinte;
					when others => edo_fut <= inicio;
				end case;
				
			when cinco => cambio <= "0000";
				edo_fut <= inicio;
			when diez => cambio <= "0101";
				edo_fut <= inicio;
			when veinte => cambio <= "1111";
				edo_fut <= inicio;
		end case;
end process proceso1;

proceso2: process (clk) begin
	if(clk'event and clk='1') then
		edo_pres <= edo_fut;
	end if;
end process proceso2;

end Behavioral;

