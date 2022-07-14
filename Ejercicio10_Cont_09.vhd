----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:29:06 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio10_Cont_09 - Behavioral 
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

entity Ejercicio10_Cont_09 is
    Port ( clk : in  STD_LOGIC;
           C : in  STD_LOGIC;
           SAL1, SAL2 : out  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Ejercicio10_Cont_09;

architecture Behavioral of Ejercicio10_Cont_09 is

signal aux: std_logic_vector(3 downto 0):="0000";

begin
Q <= aux;
	process(clk, C) begin
		if (clk'event and clk = '1') then 
			if(C = '0') then
				if(aux = "1001") then
					aux <= "0000";
				else 
					aux <= aux+1;
				end if;
			else
				if(aux = "0000") then
					aux <= "1001";
				else 
					aux <= aux-1;
				end if;
			end if;
			
			-- Ascendente pares
			if(C = '0' and aux(0) = '1') then 
				SAL1 <= '1';
				SAL2 <= '0';
			-- Descendente impares
			elsif(C = '1' and aux(0) = '0') then
				SAL1 <= '0';
				SAL2 <= '1';
			-- Condicion para ocho
			else
				SAL1 <= '0';
				SAL2 <= '0';
			end if;
		end if;
	end process;

end Behavioral;

