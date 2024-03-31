library ieee;
use ieee.std_logic_1164.all;

entity Proj_02_mux_8b is
    port (o0,o1,o2,o3,o4,o5,o6,o7: in  std_logic_vector(7 downto 0);
	  key: in std_logic_vector(2 downto 0);
          S: out std_logic_vector(7 downto 0));
end Proj_02_mux_8b;

architecture log of Proj_02_mux_8b is
signal key0,key1,key2: std_logic_vector(7 downto 0);
signal and0,and1,and2,and3,and4,and5,and6,and7: std_logic_vector(7 downto 0);
begin
    key0 <= (key(0),key(0),key(0),key(0),key(0),key(0),key(0),key(0));
    key1 <= (key(1),key(1),key(1),key(1),key(1),key(1),key(1),key(1));
    key2 <= (key(2),key(2),key(2),key(2),key(2),key(2),key(2),key(2));

    and0 <= (not(key0) and not(key1) and not(key2) and o0);
    and1 <= (key0 and not(key1) and not(key2) and o1);
    and2 <= (not(key0) and key1 and not(key2) and o2);
    and3 <= (key0 and key1 and not(key2) and o3);
    and4 <= (not(key0) and not(key1) and key2 and o4);
    and5 <= (key0 and not(key1) and key2 and o5);
    and6 <= (not(key0) and key1 and key2 and o6);
    and7 <= (key0 and key1 and key2 and o0);

    S <= and0 or and1 or and2 or and3 or and4 or and5 or and6 or and7;
end log;
