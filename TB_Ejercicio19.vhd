--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:25:19 07/10/2022
-- Design Name:   
-- Module Name:   C:/Users/Hilary Calva Camacho/Desktop/PROYECTOS VHDL/Ejercicios_1_20/TB_Ejercicio19.vhd
-- Project Name:  Ejercicios_1_20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio19_Contador_AS_DES
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
 
ENTITY TB_Ejercicio19 IS
END TB_Ejercicio19;
 
ARCHITECTURE behavior OF TB_Ejercicio19 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio19_Contador_AS_DES
    PORT(
         clk : IN  std_logic;
         x : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal x : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio19_Contador_AS_DES PORT MAP (
          clk => clk,
          x => x,
          Q => Q
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
      wait for 100 ns;	
		x <= '1';
      wait for 100 ns;
		x <= '0';
      wait for 100 ns;
		x <= '1';
		wait for 100 ns;
		x <= '0';
      wait for 100 ns;
		x <= '1';

      wait;
   end process;

END;
