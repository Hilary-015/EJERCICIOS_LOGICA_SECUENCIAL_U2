--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:57:09 07/10/2022
-- Design Name:   
-- Module Name:   C:/Users/Hilary Calva Camacho/Desktop/PROYECTOS VHDL/Ejercicios_1_20/TB_Ejercicio3.vhd
-- Project Name:  Ejercicios_1_20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio3_Registro
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
 
ENTITY TB_Ejercicio3 IS
END TB_Ejercicio3;
 
ARCHITECTURE behavior OF TB_Ejercicio3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio3_Registro
    PORT(
         L : IN  std_logic;
         R : IN  std_logic;
         clk : IN  std_logic;
         RST : IN  std_logic;
         S : IN  std_logic_vector(0 to 1);
         D : IN  std_logic_vector(0 to 3);
         Q : OUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal L : std_logic := '0';
   signal R : std_logic := '0';
   signal clk : std_logic := '0';
   signal RST : std_logic := '0';
   signal S : std_logic_vector(0 to 1) := (others => '0');
   signal D : std_logic_vector(0 to 3) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(0 to 3);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio3_Registro PORT MAP (
          L => L,
          R => R,
          clk => clk,
          RST => RST,
          S => S,
          D => D,
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
		D <= "0100";
		L <= '1';
		R <= '0';
		
		S <= "10";
      wait for clk_period*10;
		S <= "01";
		wait for clk_period*10;
		S <= "11";
		wait for clk_period*10;
		S <= "00";

      wait;
   end process;

END;
