--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:17:10 07/13/2022
-- Design Name:   
-- Module Name:   C:/Users/Hilary Calva Camacho/Desktop/PROYECTOS VHDL/Ejercicios_1_20/TB_Ejercicio18.vhd
-- Project Name:  Ejercicios_1_20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio18_SecuenciaCuadro
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
 
ENTITY TB_Ejercicio18 IS
END TB_Ejercicio18;
 
ARCHITECTURE behavior OF TB_Ejercicio18 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio18_SecuenciaCuadro
    PORT(
         clk : IN  std_logic;
         x : IN  std_logic;
         z : OUT  std_logic;
         salidaB : OUT  std_logic_vector(0 to 2)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal x : std_logic := '0';

 	--Outputs
   signal z : std_logic;
   signal salidaB : std_logic_vector(0 to 2);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio18_SecuenciaCuadro PORT MAP (
          clk => clk,
          x => x,
          z => z,
          salidaB => salidaB
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
      x <= '0';
      wait for clk_period;
		x <= '1';
      wait for clk_period;
		x <= '0';
      wait for clk_period;
		x <= '0';
      wait for clk_period;
		x <= '1';
      wait for clk_period;
		x <= '0';		
      wait for clk_period;
		x <= '1';


      wait;
   end process;

END;
