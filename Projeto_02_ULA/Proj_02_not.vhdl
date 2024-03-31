LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity Proj_02_not is 
 port (
    A_not   : in std_logic_vector (7 downto 0);
    NOT_logic : out std_logic_vector (7 downto 0)
	);
	end entity;

architecture main of Proj_02_not is 
	begin 
        NOT_logic(0)<= not A_not(0);
        NOT_logic(1)<= not A_not(1);
        NOT_logic(2)<= not A_not(2); 
        NOT_logic(3)<= not A_not(3);
        NOT_logic(4)<= not A_not(4); 
        NOT_logic(5)<= not A_not(5); 
        NOT_logic(6)<= not A_not(6);
        NOT_logic(7)<= not A_not(7); 
        end ARCHITECTURE;