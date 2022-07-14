----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:11:16 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio5_Semaforo - Behavioral 
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

entity Ejercicio5_Semaforo is
    Port ( clk : in  STD_LOGIC;
           Q : out   STD_LOGIC_VECTOR (3 downto 0);
			  X : inout STD_LOGIC;
           N : inout  STD_LOGIC_VECTOR (0 to 3);
           EO : inout  STD_LOGIC_VECTOR (0 to 3));
end Ejercicio5_Semaforo;

architecture Behavioral of Ejercicio5_Semaforo is

signal aux : std_logic_vector(3 downto 0) := "0000";

signal rojo: std_logic_vector(0 to 3) := "0011";
signal ambar: std_logic_vector(0 to 3) := "0010";
signal verde: std_logic_vector(0 to 3) := "0001";

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
			
			if(aux = "1000") then 
				N <= rojo;
				EO <= verde;
			elsif(aux = "0100") then
				EO <= ambar;
			elsif(aux = "0010") then
				N <= verde;
				EO <= rojo;
			elsif(aux = "0001") then
				N <= ambar;
			end if;			
		end if;
	end process;

end Behavioral;

