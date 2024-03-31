LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity Proj_02_xor is 
 port (
    A_xor   : in std_logic_vector (7 downto 0);
    B_xor   : in std_logic_vector (7 downto 0);
    XOR_logic : out std_logic_vector (7 downto 0)
	);
	end entity;

architecture main of Proj_02_xor is 
	begin 
        XOR_logic(0)<= A_xor(0) xor B_xor(0);
        XOR_logic(1)<= A_xor(1) xor B_xor(1);
        XOR_logic(2)<= A_xor(2) xor B_xor(2);
        XOR_logic(3)<= A_xor(3) xor B_xor(3);
        XOR_logic(4)<= A_xor(4) xor B_xor(4);
        XOR_logic(5)<= A_xor(5) xor B_xor(5);
        XOR_logic(6)<= A_xor(6) xor B_xor(6);
        XOR_logic(7)<= A_xor(7) xor B_xor(7);
    end architecture;