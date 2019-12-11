----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2019 12:37:22
-- Design Name: 
-- Module Name: ClockExc - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ClockExc is
    port(
        resetBtn : in STD_LOGIC;
        clock100MHz : in STD_LOGIC;
        clock1Hz : inout STD_LOGIC
    );
end ClockExc;

architecture Behavioral of ClockExc is

constant SF : integer := 100000;
signal Counter : integer range 0 to SF;

begin
    process(clock100MHz, resetBtn)
    begin
        if(resetBtn = '1') then
                Counter <= 0;
                clock1Hz <= '0';
        elsif rising_edge(clock100MHz) then
            if(Counter = SF/2 - 1) then
                clock1Hz <= not clock1Hz;
                Counter <= 0;
            else
                Counter <= Counter + 1;
            end if;
        end if;
    end process;
end Behavioral;
