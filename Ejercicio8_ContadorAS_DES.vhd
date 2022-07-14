----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:56:42 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio8_ContadorAS_DES - Behavioral 
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

entity Ejercicio8_ContadorAS_DES is
    Port ( clk : in  STD_LOGIC;
           X : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (1 downto 0));
end Ejercicio8_ContadorAS_DES;

architecture Behavioral of Ejercicio8_ContadorAS_DES is

signal aux: std_logic_vector(1 downto 0):= "00";

begin
	Q <= aux;
	process(clk, X) begin
		if (clk'event and clk = '1') then 
			if(X = '0') then
				aux <= aux+1;
			else
				aux <= aux-1;
			end if;
		end if;
	end process;

end Behavioral;

