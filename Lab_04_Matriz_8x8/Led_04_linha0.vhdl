LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Lab_04_linha3 is 
    PORT(
         NUM0: in std_logic_vector(3 downto 0);
         LINHA0: out std_logic_vector (7 downto 0);
          );
END ENTITY;

ARCHITECTURE main OF Lab_04_linha3 IS
    BEGIN
        LINHA0(0)<='0';
       
        LINHA0(1)<= (NOT (NUM0(2)) AND NUM0(1) AND NOT (NUM0(0))) OR ( NUM0(3) AND NUM0(2) AND NOT (NUM0(1)) AND NUM0(0)) ;
        
        LINHA0(2)<= (NOT (NUM0(3)) AND NOT (NUM0(2))) OR NOT (NUM0(0)) OR(NOT (NUM0(2)) AND NUM0(1)) OR (NUM0(2) AND NOT (NUM0(1)));
      
        LINHA0(3)<= NOT (NUM0(2)) OR (NOT (NUM0(1)) AND NUM0(0)) OR (NUM0(1) AND NOT (NUM0(0))) OR (NUM0(3));

        LINHA0(4)<= NOT (NUM0(2)) OR (NOT (NUM0(3)) AND NUM0(0)) OR (NOT (NUM0(3)) AND NUM0(1)) OR (NUM0(3) AND NOT (NUM0(1))) OR (NUM0(3) AND NOT (NUM0(0)));

        LINHA0(5)<= (NOT (NUM0(3)) AND NOT (NUM0(2)) AND NUM0(1) AND NOT (NUM0(0))) OR ( NUM0(3) AND NOT (NUM0(2)) AND NUM0(1) AND NUM0(0));

        LINHA0(6)<= '0';

        LINHA0(7)<= '0';




    END ARCHITECTURE;

        




       