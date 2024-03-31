LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Lab_04_linha4 IS 
    PORT(
         NUM4: in std_logic_vector(3 downto 0);
         LINHA4: out std_logic_vector (7 downto 0);
          );
END ENTITY;

ARCHITECTURE main OF Lab_04_linha4 IS
    BEGIN

    LINHA4(0)<='0';
    
    LINHA4(1)<= ((NOT NUM4(2))  AND (NOT NUM4(1)) AND (NOT NUM4(0))) OR ((NOT NUM4(3)) AND (NOT NUM4(2)) AND NUM4(1)) OR ( NUM4(3) AND (NOT NUM4(1)) AND NUM4(0));

    LINHA4(2)<= ((NOT NUM4(3)) AND (NOT NUM4(1)) AND (NOT NUM4(0))) OR ((NOT NUM4(3)) AND NUM4(2) AND NUM4(0)) OR (NUM4(3) AND (NOT NUM4(2)) AND NUM4(1) AND NUM4(0)) OR (NUM4(3) AND NUM4(2) AND (NOT NUM4(0)));
   
    LINHA4(3)<= ((NOT NUM4(3)) AND (NOT NUM4(1)) AND NUM4(0)) OR (NUM4(3) AND NUM4(1)) OR (NUM4(3) AND NUM4(2));

    LINHA4(4)<= (NUM4(2) AND (NOT NUM4(1))) AND ( NUM4(3) AND NUM4(1) AND (NOT NUM4(0)));
    
    LINHA4(5)<= ((NOT NUM4(2)) AND (NOT NUM4(1)) AND (NOT NUM4(0))) OR ((NOT NUM4(3)) AND NUM4(2) AND (NOT NUM4(1)) AND NUM4(0)) OR ((NOT NUM4(3)) AND NUM4(2) AND NUM4(1) AND (NOT NUM4(0))) OR( NUM4(3) AND (NOT NUM4(2)) AND NUM4(0));
    
    LINHA4(6)<= '0';
    
    LINHA4(7)<='0';

END ARCHITECTURE;
        