LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Proj_02_swa IS
PORT(
		A_swa   : IN std_logic_vector (7 downto 0);
		Swa  : OUT std_logic_vector (7 downto 0)
);
END Proj_02_swa;

ARCHITECTURE swa OF Proj_02_swa IS
    begin
        Swa(0)<= A_swa(7);
        Swa(1)<= A_swa(6);
        Swa(2)<= A_swa(5);
        Swa(3)<= A_swa(4);
        Swa(4)<= A_swa(3);
        Swa(5)<= A_swa(2);
        Swa(6)<= A_swa(1);
        Swa(7)<= A_swa(0);
    end ARCHITECTURE;