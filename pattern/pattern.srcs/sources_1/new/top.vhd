----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2024 06:09:34 AM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           p : out STD_LOGIC;
           r : out STD_LOGIC;
           y : out STD_LOGIC;
           outputt : out STD_LOGIC_VECTOR(3 downto 0));
end top;

architecture Behavioral of top is

TYPE state IS (s0, s1, s2, s3, s4);
SIGNAL Present_State, Next_State: state;


begin

U_Mealy: PROCESS(clk, rst)
BEGIN
    IF(rst = '1') THEN
        Present_State <= s0;
    ELSIF rising_edge(clk) THEN
        Present_State <= Next_State;
    END IF;
END PROCESS;

Next_State_Output: 
PROCESS (Present_State, a, b)
BEGIN
    Next_State <= Present_State;
    p <= '0';
    r <= '0';
    y <= '0';
    CASE Present_State IS
        WHEN s0 =>
            outputt<="0000";
            IF a = '1' THEN 
                Next_State <= s1; 
            ELSE
                Next_State <= s0;
            END IF;
        WHEN s1 =>
            outputt<="0001";
            p <= '1' ;
            IF b = '0' THEN
                Next_State <= s2; 
                r <= '1' ;
            ELSE
                Next_State <= s1;
            END IF;
        WHEN s2 =>
            outputt<="0010";
            IF b = '1' THEN 
                    Next_State <= s3; 
                    r <= '1' ;
                ELSE
                    Next_State <= s2;
            END IF;
        WHEN s3 =>
            outputt<="0011";
            p <= '1' ;
            IF b = '1' THEN 
                    Next_State <= s4; 
                    r <= '1' ;
                ELSE
                    Next_State <= s3;
            END IF;
        WHEN s4 =>
            outputt<="0100";
            IF b = '1' THEN 
                Next_State <= s1; 
            ELSE
                r <= '1' ;
                IF a = '1' THEN 
                    Next_State <= s2; 
                    y <= '1' ;
                ELSE
                    Next_State <= s0; 
                END IF;
                    
            END IF;
    END CASE;
END PROCESS;




end Behavioral;
