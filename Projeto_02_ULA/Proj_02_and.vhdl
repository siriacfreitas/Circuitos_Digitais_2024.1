LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity Proj_02_and is 
 port (
    A_and   : in std_logic_vector (7 downto 0);
    B_and   : in std_logic_vector (7 downto 0);
    AND_logic : out std_logic_vector (7 downto 0)
    );
	end entity;

architecture main of Proj_02_and is 
	begin 
        AND_logic(0)<= A_and(0) and B_and(0);
        AND_logic(1)<= A_and(1) and B_and(1);
        AND_logic(2)<= A_and(2) and B_and(2);
        AND_logic(3)<= A_and(3) and B_and(3);
        AND_logic(4)<= A_and(4) and B_and(4);
        AND_logic(5)<= A_and(5) and B_and(5);
        AND_logic(6)<= A_and(6) and B_and(6);
        AND_logic(7)<= A_and(7) and B_and(7);
    end architecture;