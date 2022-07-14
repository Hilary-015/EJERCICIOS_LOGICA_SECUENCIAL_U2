--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:25:13 07/10/2022
-- Design Name:   
-- Module Name:   C:/Users/Hilary Calva Camacho/Desktop/PROYECTOS VHDL/Ejercicios_1_20/TB_Ejercicio9.vhd
-- Project Name:  Ejercicios_1_20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio9_As_Des15
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
 
ENTITY TB_Ejercicio9 IS
END TB_Ejercicio9;
 
ARCHITECTURE behavior OF TB_Ejercicio9 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio9_As_Des15
    PORT(
         clk : IN  std_logic;
         X : IN  std_logic;
         Z1 : INOUT  std_logic;
         Z2 : INOUT  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal X : std_logic := '0';

	--BiDirs
   signal Z1 : std_logic;
   signal Z2 : std_logic;

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio9_As_Des15 PORT MAP (
          clk => clk,
          X => X,
          Z1 => Z1,
          Z2 => Z2,
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

      wait for clk_period*10;
		X <= '0';
		wait for clk_period*10;
		X <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
