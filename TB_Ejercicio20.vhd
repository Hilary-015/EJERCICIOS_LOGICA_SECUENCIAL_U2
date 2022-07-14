--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:34:23 07/10/2022
-- Design Name:   
-- Module Name:   C:/Users/Hilary Calva Camacho/Desktop/PROYECTOS VHDL/Ejercicios_1_20/TB_Ejercicio20.vhd
-- Project Name:  Ejercicios_1_20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio20_MaquinaDespachadora
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
 
ENTITY TB_Ejercicio20 IS
END TB_Ejercicio20;
 
ARCHITECTURE behavior OF TB_Ejercicio20 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio20_MaquinaDespachadora
    PORT(
         clk : IN  std_logic;
         moneda : IN  std_logic_vector(4 downto 0);
         cambio : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal moneda : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal cambio : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio20_MaquinaDespachadora PORT MAP (
          clk => clk,
          moneda => moneda,
          cambio => cambio
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
      moneda <= "00101";
      wait for 100 ns;	
		moneda <= "01010";
      wait for 100 ns;
		moneda <= "10100";
      wait for 100 ns;
		moneda <= "00000";

      wait;
   end process;

END;
