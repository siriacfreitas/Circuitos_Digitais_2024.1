library ieee;
use ieee.std_logic_1164.all;

entity Proj_02_deslocador_esquerda_8b is
    port (
        A_deslocador_esq,B_deslocador_esq : in std_logic_vector(7 downto 0);
        O_deslocador_esq : out std_logic_vector(7 downto 0)
);
end Proj_02_deslocador_esquerda_8b;

architecture log of Proj_02_deslocador_esquerda_8b is

component Proj_02_deslocador_esquerda_1b is
    port (
        A_deslocador : in std_logic_vector(7 downto 0); 
        x : in std_logic;
        O_deslocador1 : out std_logic_vector(7 downto 0)  
    );
end component Proj_02_deslocador_esquerda_1b;

component Proj_02_deslocador_esquerda_2b is
    port (
        A_deslocador : in std_logic_vector(7 downto 0); 
        x : in std_logic;
        O_deslocador2 : out std_logic_vector(7 downto 0)  
    );
end component Proj_02_deslocador_esquerda_2b;

component Proj_02_deslocador_esquerda_4b is
    port (
        A_deslocador : in std_logic_vector(7 downto 0); 
        x : in std_logic;
        O_deslocador4 : out std_logic_vector(7 downto 0)  
    );
end component Proj_02_deslocador_esquerda_4b;

signal s0, s1: std_logic_vector(7 downto 0);

begin
    U1: Proj_02_deslocador_esquerda_1b port map(A_deslocador_esq, B_deslocador_esq(0), s0);
    U2: Proj_02_deslocador_esquerda_2b port map(s0, B_deslocador_esq(1), s1);
    U3: Proj_02_deslocador_esquerda_4b port map(s1, B_deslocador_esq(2), O_deslocador_esq);
end architecture log;