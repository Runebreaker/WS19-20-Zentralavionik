----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2019 14:54:45
-- Design Name: 
-- Module Name: f - Behavioral
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
library clocklib;
use clocklib.ClockExc;

entity f is
    port(
        testLED : inout std_logic := '0';
        active : out std_logic_vector(3 downto 0);
        segments : out std_logic_vector(0 to 7);
        toggle : in std_logic;
        clock : in std_logic;
        rst : in std_logic
    );
end f;

architecture Behavioral of f is

component ClockExc
    port(
        resetBtn : in STD_LOGIC;
        clock100MHz : in STD_LOGIC;
        clock1Hz : inout STD_LOGIC
    );
end component;
--Pattern: "a b c d e f g DP"
signal zero : std_logic_vector(0 to 7) := "00000011";
signal one : std_logic_vector(0 to 7) := "10011111";
signal two : std_logic_vector(0 to 7) := "00100101";
signal three : std_logic_vector(0 to 7) := "00001101";
signal four : std_logic_vector(0 to 7) := "10011001";
signal five : std_logic_vector(0 to 7) := "01001001";
signal six : std_logic_vector(0 to 7) := "01000001";
signal seven : std_logic_vector(0 to 7) := "00011111";
signal eight : std_logic_vector(0 to 7) := "00000001";
signal nine : std_logic_vector(0 to 7) := "00001001";

signal F : std_logic_vector(0 to 7) := "01110001";
signal U : std_logic_vector(0 to 7) := "10000011";
signal C : std_logic_vector(0 to 7) := "01100011";
signal K : std_logic_vector(0 to 7) := "01010001";

signal empty : std_logic_vector(0 to 7) := "11111111";

signal digit : integer range 0 to 3 := 0;

signal newclk : std_logic;

begin
u1: ClockExc port map(resetBtn=>rst, clock100MHz=>clock, clock1Hz=>newclk);
    process(digit, newclk, toggle, rst)
    begin
        if rising_edge(newclk) then
            case digit is
                WHEN 0 =>
                    segments <= empty;
                    active <= "1110";
                    segments <= F;
                WHEN 1 =>
                    segments <= empty;
                    active <= "1101";
                    segments <= U;
                WHEN 2 =>
                    segments <= empty;
                    active <= "1011";
                    segments <= C;
                WHEN 3 =>
                    segments <= empty;
                    active <= "0111";
                    segments <= K;
            end case;
        
            if digit = 3 then
                digit <= 0;
            else
                digit <= digit + 1;
            end if;
        else
        end if;
    end process;
end Behavioral;