----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:03 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio2_FFT - Behavioral 
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

entity Ejercicio2_FFT is
    Port ( T : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           QF : out  STD_LOGIC);
end Ejercicio2_FFT;

architecture Behavioral of Ejercicio2_FFT is

signal aux : std_logic:='0';

begin

	process(T, clk) begin
		if (clk'event and clk = '1') then 
			if(T = '1') then 
				aux <= not aux;
				Q <= aux;
				QF <= not aux;
	
			elsif(T = '0') then
				aux <= aux;
				Q <= aux;
				QF <= aux;
	
			end if;
		end if;
	end process;

end Behavioral;

