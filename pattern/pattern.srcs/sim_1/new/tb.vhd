

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:54:01 05/22/2024
-- Design Name:   
-- Module Name:   C:/Users/Apple/Desktop/ise/mod/tb.vhd
-- Project Name:  mod
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mod_m_counter
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
component top

   Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           p : out STD_LOGIC;
           r : out STD_LOGIC;
           y : out STD_LOGIC;
           outputt : out STD_LOGIC_VECTOR(3 downto 0));
end component;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   

 	--Outputs
   signal p : std_logic;
   signal r : std_logic;
   signal y : std_logic;
   signal s : STD_LOGIC_VECTOR(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut1: top PORT MAP ( 
           rst => rst,
           clk => clk,
           a => a,
           b => b,
           p => p,
           r => r,
           y => y,
           outputt => s);



  
 

   -- Stimulus process
   stim_proc: process
   begin	
   	
      -- hold reset state for 100 ns.
      
      
      --before 0ns 
      wait for 40ns;
      rst <= '0';
      wait for 40ns;
      a <= '1';
      b <= '1';
      --clk1
      wait for 20ns;
      clk <= '1';
      wait for 50ns;
      b <= '0';
      clk <= '0';
      
      --clk2
      wait for 50ns;
      clk <= '1';
      wait for 40ns;
      b <= '1';
      wait for 10ns;
      clk <= '0';
      wait for 20ns;
      a <= '0';
      
      --clk3
      wait for 30ns;
      clk <= '1';
      wait for 10ns;
      b <= '0';
      wait for 40ns;
      clk <= '0';
      a <= '1';
      wait for 20ns;
      b <= '1';
      
      --clk4
      wait for 30ns;
      clk <= '1';
      wait for 20ns;
      a <= '0';
      wait for 20ns;
      b <= '0';
      wait for 10ns;
      clk <= '0';
      wait for 20ns;
      a <= '1';
      
      --clk5
      wait for 30ns;
      clk <= '1';
      wait for 40ns;
      b <= '1';
      wait for 10ns;
      clk <= '0';
      
      --clk6
      wait for 50ns;
      clk <= '1';
      wait for 10ns;
      b <= '0';
      wait for 40ns;
      clk <= '0';
      a <= '0';
      
      wait;
   end process;

END;
