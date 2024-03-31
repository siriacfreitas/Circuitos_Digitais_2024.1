LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Proj_02_somador IS
PORT(
		A_somador       : IN std_logic;
        B_somador       : IN std_logic;
        C_IN_somador    : IN std_logic;
		O_somador       : OUT std_logic;
        C_OUT_somador   : OUT std_logic
);
        END Proj_02_somador;


ARCHITECTURE soma OF Proj_02_somador IS
SIGNAL P_XOR1, P_XOR2,P_AND1, P_AND2, P_AND3,P_OR: std_logic;
		 
		 
BEGIN

P_XOR1 <= A_somador xor B_somador;
P_XOR2 <= P_XOR1 xor C_IN_somador;

P_AND1 <= A_somador and B_somador;
P_AND2 <= A_somador and C_IN_somador;
P_AND3 <= B_somador and C_IN_somador;

P_OR <= P_AND1 or P_AND2 or P_AND3;

O_somador <= P_XOR2;
C_OUT_somador <= P_OR;

END  ARCHITECTURE soma;