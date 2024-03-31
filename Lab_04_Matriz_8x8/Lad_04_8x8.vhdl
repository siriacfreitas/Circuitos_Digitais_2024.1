LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Lab_04_8x8 is 
    PORT(
        SW : in bit_vector(3 downto 0);
        Key: in bit_vector(2 downto 0);
        LEDDR : out bit_vector (7 downto 0);
        LEDG : out bit_vector (7 downto o)
    );
END ENTITY;

ARCHITECTURE main OF Lab_04_8x8 IS
