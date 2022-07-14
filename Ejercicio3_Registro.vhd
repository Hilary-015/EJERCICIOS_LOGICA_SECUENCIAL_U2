----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:21:49 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio3_Registro - Behavioral 
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

entity Ejercicio3_Registro is
    Port ( L : in  STD_LOGIC;
           R : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
			  S : in  STD_LOGIC_VECTOR (0 to 1);
           D : in  STD_LOGIC_VECTOR (0 to 3);
           Q : out  STD_LOGIC_VECTOR (0 to 3));
end Ejercicio3_Registro;

architecture Behavioral of Ejercicio3_Registro is

signal aux : std_logic_vector(0 to 3);

begin
	Q <= aux;
		process(clk, RST, L, R, S, D) begin
			if(RST = '1') then -- Reset
				aux <= "0000";
			elsif (clk'event and clk = '1') then 
				case S is
					when "01" => aux <= aux(1 to 3) & L; -- Desplazamiento a la izquierda
					when "11" => aux <= R & aux(0 to 2); -- Desplazamiento a la derecha
					when "10" => aux <= D; --Cargar
					when others => aux <= aux; --Retener
				end case;
			end if;
		end process;

end Behavioral;

