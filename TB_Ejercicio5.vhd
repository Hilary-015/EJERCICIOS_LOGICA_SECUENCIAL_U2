--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:24:18 07/10/2022
-- Design Name:   
-- Module Name:   C:/Users/Hilary Calva Camacho/Desktop/PROYECTOS VHDL/Ejercicios_1_20/TB_Ejercicio5.vhd
-- Project Name:  Ejercicios_1_20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio5_Semaforo
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
 
ENTITY TB_Ejercicio5 IS
END TB_Ejercicio5;
 
ARCHITECTURE behavior OF TB_Ejercicio5 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio5_Semaforo
    PORT(
         clk : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
			X : inout STD_LOGIC; 
         N : INOUT  std_logic_vector(0 to 3);
         EO : INOUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
	signal X : STD_LOGIC := '0'; 

	--BiDirs
   signal N : std_logic_vector(0 to 3);
   signal EO : std_logic_vector(0 to 3);

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);
	
	-- Clock period definitions
   constant clk_period : time := 10 ns;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio5_Semaforo PORT MAP (
          clk => clk,
          Q => Q,
          N => N,
          EO => EO
        );
		  
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
      -- hold reset state for 100 ns.
     if(Q = "1000") then
			wait for 20 sec;	
	  elsif(Q = "0100")then
			wait for 5 sec;	
	  elsif(Q = "0010")then
			wait for 20 sec;
	  elsif(Q = "0001")then
			wait for 5 sec;
	  end if;

      wait;
   end process;

END;
