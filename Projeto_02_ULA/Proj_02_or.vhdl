LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity Proj_02_or is 
 port (
    A_or   : in std_logic_vector (7 downto 0);
    B_or   : in std_logic_vector (7 downto 0);
    OR_logic  : out std_logic_vector (7 downto 0)
	);
	end entity;

    architecture main of Proj_02_or is 
	begin 
        OR_logic(0)<= A_or(0) or B_or(0);
        OR_logic(1)<= A_or(1) or B_or(1);
        OR_logic(2)<= A_or(2) or B_or(2);
        OR_logic(3)<= A_or(3) or B_or(3);
        OR_logic(4)<= A_or(4) or B_or(4);
        OR_logic(5)<= A_or(5) or B_or(5);
        OR_logic(6)<= A_or(6) or B_or(6);
        OR_logic(7)<= A_or(7) or B_or(7);
    end architecture;
       