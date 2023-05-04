--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:22:58 04/13/2023
-- Design Name:   
-- Module Name:   /home/carlos/matriz/multp/teste.vhd
-- Project Name:  multp
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mult
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
 
ENTITY teste IS
END teste;
 
ARCHITECTURE behavior OF teste IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mult
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         start : IN  std_logic;
         done : OUT  std_logic;
         A1 : IN  std_logic_vector(7 downto 0);
         A2 : IN  std_logic_vector(7 downto 0);
         A3 : IN  std_logic_vector(7 downto 0);
         A4 : IN  std_logic_vector(7 downto 0);
         B1 : IN  std_logic_vector(7 downto 0);
         B2 : IN  std_logic_vector(7 downto 0);
         B3 : IN  std_logic_vector(7 downto 0);
         B4 : IN  std_logic_vector(7 downto 0);
         C1 : IN  std_logic_vector(7 downto 0);
         C2 : IN  std_logic_vector(7 downto 0);
         C3 : IN  std_logic_vector(7 downto 0);
         C4 : IN  std_logic_vector(7 downto 0);
         D1 : IN  std_logic_vector(7 downto 0);
         D2 : IN  std_logic_vector(7 downto 0);
         D3 : IN  std_logic_vector(7 downto 0);
         D4 : IN  std_logic_vector(7 downto 0);
         MF1 : OUT  std_logic_vector(15 downto 0);
         MF2 : OUT  std_logic_vector(15 downto 0);
         MF3 : OUT  std_logic_vector(15 downto 0);
         MF4 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal start : std_logic := '0';
   signal A1 : std_logic_vector(7 downto 0) := (others => '0');
   signal A2 : std_logic_vector(7 downto 0) := (others => '0');
   signal A3 : std_logic_vector(7 downto 0) := (others => '0');
   signal A4 : std_logic_vector(7 downto 0) := (others => '0');
   signal B1 : std_logic_vector(7 downto 0) := (others => '0');
   signal B2 : std_logic_vector(7 downto 0) := (others => '0');
   signal B3 : std_logic_vector(7 downto 0) := (others => '0');
   signal B4 : std_logic_vector(7 downto 0) := (others => '0');
   signal C1 : std_logic_vector(7 downto 0) := (others => '0');
   signal C2 : std_logic_vector(7 downto 0) := (others => '0');
   signal C3 : std_logic_vector(7 downto 0) := (others => '0');
   signal C4 : std_logic_vector(7 downto 0) := (others => '0');
   signal D1 : std_logic_vector(7 downto 0) := (others => '0');
   signal D2 : std_logic_vector(7 downto 0) := (others => '0');
   signal D3 : std_logic_vector(7 downto 0) := (others => '0');
   signal D4 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal done : std_logic;
   signal MF1 : std_logic_vector(15 downto 0);
   signal MF2 : std_logic_vector(15 downto 0);
   signal MF3 : std_logic_vector(15 downto 0);
   signal MF4 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 2.2 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mult PORT MAP (
          clk => clk,
          rst => rst,
          start => start,
          done => done,
          A1 => A1,
          A2 => A2,
          A3 => A3,
          A4 => A4,
          B1 => B1,
          B2 => B2,
          B3 => B3,
          B4 => B4,
          C1 => C1,
          C2 => C2,
          C3 => C3,
          C4 => C4,
          D1 => D1,
          D2 => D2,
          D3 => D3,
          D4 => D4,
          MF1 => MF1,
          MF2 => MF2,
          MF3 => MF3,
          MF4 => MF4
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		start <= '1';
		A1 <= "11001100";
		A2 <= "00000000";
		A3 <= "00000000";
		A4 <= "10101110";
		B1 <= "00010101";
		B2 <= "11010100";
		B3 <= "01001001";
		B4 <= "00101100";
		C1 <= "00000000";
		C2 <= "10100001";
		C3 <= "00100001";
		C4 <= "10000100";
		D1 <= "00100111";
		D2 <= "00011010";
		D3 <= "00000000";
		D4 <= "00000000";

      wait;
   end process;

END;
