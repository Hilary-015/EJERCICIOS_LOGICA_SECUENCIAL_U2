----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:27:17 07/10/2022 
-- Design Name: 
-- Module Name:    Ejercicio15_SemaforoSensores - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Ejercicio15_SemaforoSensores is
    Port ( clk, s: in  STD_LOGIC;
           N : inout  STD_LOGIC_VECTOR (0 to 3);
           EO : inout  STD_LOGIC_VECTOR (0 to 3);
			  Q : inout  STD_LOGIC_VECTOR (3 downto 0):="0000");
			  
end Ejercicio15_SemaforoSensores;

architecture Behavioral of Ejercicio15_SemaforoSensores is

signal rojo: std_logic_vector(0 to 3) := "0011";
signal ambar: std_logic_vector(0 to 3) := "0010";
signal verde: std_logic_vector(0 to 3) := "0001";

begin

proceso1: process (Q) begin
	case Q is
		when "0001"=>
			if s='0' then
				N <= rojo;
				EO <= verde;
			end if;
		when "0010"=>
			if s='1' then
				N <= verde;
				EO <= rojo;
			end if;
		when "0011"=>
			if s='1' then
				N<= ambar;
				EO<= rojo;
			end if;
		when "0100"=>
			if s='1' then
				N <= ambar;
				EO <= rojo;
			end if;
		when "0101" =>
			if s='0' then
				N <= rojo;
				EO <= verde;
			end if;
		when others =>
			N<= "0000";
			EO<= "0000";
	end case;
end process;
	
proceso2: process (clk) begin
	if (clk' event and clk='0') then
			Q <= Q+1;
			if (Q ="0101") then
				Q <="0001";
			end if;
		end if;
end process proceso2;

end Behavioral;

