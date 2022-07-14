----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:40 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio1_FFJK - Behavioral 
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

entity Ejercicio1_FFJK is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           QF : out  STD_LOGIC);
end Ejercicio1_FFJK;

architecture Behavioral of Ejercicio1_FFJK is

signal aux: std_logic:='0';

begin

	Q <= aux;
	QF <= not aux;
	
	process(clk) begin
		if (clk'event and clk = '1') then 
			if(J = '0' and K = '0') then 
				aux <= aux;
			elsif (J = '1' and K = '0') then
				aux <= '1';
			elsif (J = '0' and K = '1') then
				aux <= '0';
			else
				aux <= not aux;
			end if;
		end if;

	end process;
	
end Behavioral;

