--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:43:13 07/10/2022
-- Design Name:   
-- Module Name:   C:/Users/Hilary Calva Camacho/Desktop/PROYECTOS VHDL/Ejercicios_1_20/TB_Ejercicio11.vhd
-- Project Name:  Ejercicios_1_20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio11_Cronometro
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_Ejercicio11 IS
END TB_Ejercicio11;
 
ARCHITECTURE behavior OF TB_Ejercicio11 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio11_Cronometro
    PORT(
         clk : IN  std_logic;
         deco1 : OUT  std_logic_vector(0 to 6);
         deco2 : OUT  std_logic_vector(0 to 6);
         Q1 : OUT  std_logic_vector(0 to 3);
         Q2 : OUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal deco1 : std_logic_vector(0 to 6);
   signal deco2 : std_logic_vector(0 to 6);
   signal Q1 : std_logic_vector(0 to 3);
   signal Q2 : std_logic_vector(0 to 3);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio11_Cronometro PORT MAP (
          clk => clk,
          deco1 => deco1,
          deco2 => deco2,
          Q1 => Q1,
          Q2 => Q2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for clk_period*10;

      wait;
   end process;

END;
