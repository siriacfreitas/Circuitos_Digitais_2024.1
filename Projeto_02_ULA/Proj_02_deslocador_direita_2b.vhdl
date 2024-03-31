library ieee;
use ieee.std_logic_1164.all;

entity Proj_02_deslocador_direita_2b is
    port (
        A_deslocador : in std_logic_vector(7 downto 0); 
        x : in std_logic;
        O_deslocador2 : out std_logic_vector(7 downto 0)  
    );
end entity Proj_02_deslocador_direita_2b;

architecture log of  Proj_02_deslocador_direita_2b is

component Proj_02_mux_deslocador is
    port (o0,o1: in  std_logic_vector(7 downto 0);
	  key: in std_logic;
      S: out std_logic_vector(7 downto 0)
);
end component Proj_02_mux_deslocador;

signal des : bit_vector(7 downto 0);
begin
  des <= to_bitvector(A_deslocador) srl 2;
  U1: Proj_02_mux_deslocador port map(A_deslocador, to_stdlogicvector(des),x,O_deslocador2);
end architecture log;