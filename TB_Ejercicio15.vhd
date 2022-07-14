--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:34:16 07/13/2022
-- Design Name:   
-- Module Name:   C:/Users/Hilary Calva Camacho/Desktop/PROYECTOS VHDL/Ejercicios_1_20/TB_Ejercicio15.vhd
-- Project Name:  Ejercicios_1_20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio15_SemaforoSensores
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
 
ENTITY TB_Ejercicio15 IS
END TB_Ejercicio15;
 
ARCHITECTURE behavior OF TB_Ejercicio15 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio15_SemaforoSensores
    PORT(
         clk : IN  std_logic;
         s : IN  std_logic;
         N : INOUT  std_logic_vector(0 to 3);
         EO : INOUT  std_logic_vector(0 to 3);
         Q : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal s : std_logic := '0';

	--BiDirs
   signal N : std_logic_vector(0 to 3);
   signal EO : std_logic_vector(0 to 3);
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio15_SemaforoSensores PORT MAP (
          clk => clk,
          s => s,
          N => N,
          EO => EO,
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
		s <= '1';
		if(Q = "0001") then
			wait for 20 sec;	
	  elsif(Q = "0010")then
			wait for 5 sec;	
	  elsif(Q = "0011")then
			wait for 20 sec;
	  elsif(Q = "0100")then
			wait for 5 sec;
	  elsif(Q = "0101")then
			wait for 5 sec;
	  end if;

      wait;
   end process;

END;
