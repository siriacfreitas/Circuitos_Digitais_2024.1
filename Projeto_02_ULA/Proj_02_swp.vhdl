LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Proj_02_swp IS
PORT(
		A_swp   : IN std_logic_vector (7 downto 0);
		Swp  : OUT  std_logic_vector (7 downto 0)
);
END Proj_02_swp;

ARCHITECTURE swp OF Proj_02_swp IS
    begin
        Swp(0)<= A_swp(4);
        Swp(1)<= A_swp(5);
        Swp(2)<= A_swp(6);
        Swp(3)<= A_swp(7);
        Swp(4)<= A_swp(0);
        Swp(5)<= A_swp(1);
        Swp(6)<= A_swp(2);
        Swp(7)<= A_swp(3);
    end ARCHITECTURE;