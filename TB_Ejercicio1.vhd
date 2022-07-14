--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:36:16 07/10/2022
-- Design Name:   
-- Module Name:   C:/Users/Hilary Calva Camacho/Desktop/PROYECTOS VHDL/Ejercicios_1_20/TB_Ejercicio1.vhd
-- Project Name:  Ejercicios_1_20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio1_FFJK
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
 
ENTITY TB_Ejercicio1 IS
END TB_Ejercicio1;
 
ARCHITECTURE behavior OF TB_Ejercicio1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio1_FFJK
    PORT(
         J : IN  std_logic;
         K : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic;
         QF : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J : std_logic := '0';
   signal K : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal QF : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio1_FFJK PORT MAP (
          J => J,
          K => K,
          clk => clk,
          Q => Q,
          QF => QF
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
		J <= '0';
		K <= '1';
		wait for clk_period*10;	
		J <= '0';
		K <= '0';
		wait for clk_period*10;	
		J <= '1';
		K <= '0';
		wait for clk_period*10;
		J <= '1';
		K <= '1';

      wait;
   end process;

END;
