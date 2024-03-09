LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY projeto_1 IS
PORT(
			A_matriz, B_matriz, C_matriz, D_matriz: IN STD_LOGIC;
			L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, L11, L12, L13, L14, L15: OUT STD_LOGIC
			
      );
END projeto_1;


ARCHITECTURE logic OF projeto_1 IS
SIGNAL p_and1, p_and2, p_and3, p_and4, p_and5, p_and6, p_and7, p_and8,
						p_and9, p_and10, p_and11, p_and12, p_and13, p_and14,
						p_and15, p_and16, p_and17, p_and18, p_and19, p_or1, 
						p_or2, p_or3, p_or4, p_or5, p_or6, p_or7, p_or8, p_or9,
						p_or10, p_or11:STD_LOGIC;

BEGIN

p_and1<= (not A_matriz) and B_matriz;
p_and2 <= (not A_matriz) and C_matriz;
p_and3<=(not A_matriz) and (not D_matriz);
p_and4 <= A_matriz and (not B_matriz) and (not C_matriz);
p_and5 <= (not A_matriz) and D_matriz;
p_and6 <= (not B_matriz) and (not C_matriz);
p_and7 <= (not A_matriz) and (not C_matriz);
p_and8 <= p_and6 and p_and5;
p_and9 <= (not A_matriz) and B_matriz and (not C_matriz);
p_and10 <= (not A_matriz) and (not B_matriz) and C_matriz;
p_and11 <= (not B_matriz) and (not C_matriz) and (not D_matriz);
p_and12 <= (not A_matriz) and B_matriz and C_matriz;
p_and13 <= (not A_matriz) and C_matriz and (not D_matriz);
p_and14 <= (not A_matriz) and (not C_matriz) and (not D_matriz);
p_and15 <= (not A_matriz) and (not B_matriz) and C_matriz and D_matriz;
p_and16<= (not A_matriz) and B_matriz and (not D_matriz);
p_and17 <= (not A_matriz) and B_matriz and D_matriz;
p_and18 <= (not A_matriz) and (not B_matriz);
p_and19 <= (not A_matriz) and (not C_matriz) and D_matriz;


p_or1 <= p_and1 or p_and2 or p_and3 or p_and4;
p_or2 <= p_and5 or p_and2 or p_and6;
p_or3 <= p_and7 or p_and6;
p_or4 <= p_and2 or p_and3 or p_and4;
p_or5 <=p_and3 or p_and9 or p_and10 or p_and4;
p_or6 <= p_and2 or p_and5 or p_and4 or p_and1;
p_or7 <= p_and11 or p_and12 or p_and13;
p_or8 <= p_and14 or p_and9 or p_and4 or p_and15 or p_and16;
p_or9 <= p_and2 or p_and17 or p_and4 or p_and11;
p_or10 <= p_and18 or p_and6 or p_and19 or p_and13;


L1 <=  p_or1;
L2 <= p_or2; 
L3 <= p_or1;
L4 <= p_or3;
L5 <= p_and8;
L6 <= p_or4;
L7<= p_or5;
L8 <= p_or6;
L9<= p_or5;
L10<= p_or7;
L11 <= p_and8;
L12 <= p_or8;
L13 <= P_or9;
L14 <= p_or10;
L15 <= p_or5;



END logic;