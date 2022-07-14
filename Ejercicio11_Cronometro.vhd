----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:24:46 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio11_Cronometro - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Ejercicio11_Cronometro is
    Port ( clk : in  STD_LOGIC;
           D1 : out  STD_LOGIC_VECTOR (0 to 6);
           D2 : out  STD_LOGIC_VECTOR (0 to 6);
           Q1 : out  STD_LOGIC_VECTOR (0 to 3);
           Q2 : out  STD_LOGIC_VECTOR (0 to 3));
end Ejercicio11_Cronometro;

architecture Behavioral of Ejercicio11_Cronometro is

signal aux1 : std_logic_vector(0 to 3) := "0000";
signal aux2 : std_logic_vector(0 to 3) := "0000";

begin
	Q1 <= aux1;
	Q2 <= aux2;
	
	process(clk) begin
		if (clk'event and clk = '1') then 
			aux1 <= aux1+1;
			if(aux1 = "1001")then
				aux1 <= "0000";
				aux2 <= aux2+1;
			end if;
			
			if(aux2 = "1001" and aux1 = "1001") then
				aux2 <= "0000";
				aux1 <= "0000";
			end if;
			
			case aux1 is
				when "0000" => D1 <= "0000001";
				when "0001" => D1 <= "1001111";
				when "0010" => D1 <= "0010010";
				when "0011" => D1 <= "0000110";
				when "0100" => D1 <= "1001100";
				when "0101" => D1 <= "0100100";
				when "0110" => D1 <= "0100000";
				when "0111" => D1 <= "0001110";
				when "1000" => D1 <= "0000000";
				when "1001" => D1 <= "0000100";
				when others => D1 <= "1111111";
			end case;
			
			case aux2 is
				when "0000" => D2 <= "0000001";
				when "0001" => D2 <= "1001111";
				when "0010" => D2 <= "0010010";
				when "0011" => D2 <= "0000110";
				when "0100" => D2 <= "1001100";
				when "0101" => D2 <= "0100100";
				when "0110" => D2 <= "0100000";
				when "0111" => D2 <= "0001110";
				when "1000" => D2 <= "0000000";
				when "1001" => D2 <= "0000100";
				when others => D2 <= "1111111";
			end case;
		end if;
	end process;

end Behavioral;

