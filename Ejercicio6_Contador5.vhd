----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:36:21 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio6_Contador5 - Behavioral 
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

entity Ejercicio6_Contador5 is
    Port ( clk : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Ejercicio6_Contador5;

architecture Behavioral of Ejercicio6_Contador5 is

signal aux : std_logic_vector(3 downto 0);

begin
	Q <= aux;
	process(clk, RST) begin
		if (clk'event and clk = '1') then 
			if(RST = '0' or aux = "0101") then
				aux <= "0000";
			elsif(aux = "0000") then
				aux <= aux+1;
			else
				aux <=aux+2;
			end if;
		end if;
	end process;


end Behavioral;

