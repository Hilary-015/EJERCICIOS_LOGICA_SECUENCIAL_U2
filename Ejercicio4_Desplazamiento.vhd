----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:03:15 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio4_Desplazamiento - Behavioral 
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

entity Ejercicio4_Desplazamiento is
    Port ( clk : in  STD_LOGIC;
			  X : inout STD_LOGIC; 
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Ejercicio4_Desplazamiento;

architecture Behavioral of Ejercicio4_Desplazamiento is

signal aux : std_logic_vector(3 downto 0) := "0000";

begin
	
	X <= not((aux(3) or aux(2) or aux(1)));
	Q <= aux;
	
	process(clk) begin
		if (clk'event and clk = '1') then 
			if(aux = "0000") then
				aux <= "1000";
			elsif(aux="1000") then
				aux <=  "0100";
			elsif(aux = "0100") then
				aux <=  "0010";
			elsif(aux = "0010") then
				aux <= "0001";
			elsif(aux = "0001") then
				aux <= "0000";
			else
				aux <= "0000";
			end if;
		end if;
	end process;

end Behavioral;

