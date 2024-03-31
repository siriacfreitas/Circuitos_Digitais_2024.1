library ieee;
use ieee.std_logic_1164.all;

entity Proj_02_multiplicador is
    port (
        A_multiplicador : in  std_logic_vector(7 downto 0);
        B_multiplicador : in  std_logic_vector(7 downto 0);
        O_multiplicador : out std_logic_vector(7 downto 0);
	    C_OUT_multiplicador: out std_logic
);
end Proj_02_multiplicador;

architecture log of Proj_02_multiplicador is

component Proj_02_somador IS
PORT(
	A_somador       : IN std_logic;
    B_somador       : IN std_logic;
    C_IN_somador    : IN std_logic;
	O_somador       : OUT std_logic;
    C_OUT_somador   : OUT std_logic
);
END component;

signal a0,a1,a2,a3,a4,a5,a6,a7,a0b,a1b,a2b,a3b,a4b,a5b,a6b,a7b : std_logic_vector(7 downto 0);
signal c :  std_logic_vector(15 downto 0);
signal cout : std_logic_vector(54 downto 0);
signal s : std_logic_vector(41 downto 0);


begin
    a0 <= (A_multiplicador(0),A_multiplicador(0),A_multiplicador(0),A_multiplicador(0),A_multiplicador(0),A_multiplicador(0),A_multiplicador(0),A_multiplicador(0));
    a1 <= (A_multiplicador(1),A_multiplicador(1),A_multiplicador(1),A_multiplicador(1),A_multiplicador(1),A_multiplicador(1),A_multiplicador(1),A_multiplicador(1));
    a2 <= (A_multiplicador(2),A_multiplicador(2),A_multiplicador(2),A_multiplicador(2),A_multiplicador(2),A_multiplicador(2),A_multiplicador(2),A_multiplicador(2));
    a3 <= (A_multiplicador(3),A_multiplicador(3),A_multiplicador(3),A_multiplicador(3),A_multiplicador(3),A_multiplicador(3),A_multiplicador(3),A_multiplicador(3));
    a4 <= (A_multiplicador(4),A_multiplicador(4),A_multiplicador(4),A_multiplicador(4),A_multiplicador(4),A_multiplicador(4),A_multiplicador(4),A_multiplicador(4));
    a5 <= (A_multiplicador(5),A_multiplicador(5),A_multiplicador(5),A_multiplicador(5),A_multiplicador(5),A_multiplicador(5),A_multiplicador(5),A_multiplicador(5));
    a6 <= (A_multiplicador(6),A_multiplicador(6),A_multiplicador(6),A_multiplicador(6),A_multiplicador(6),A_multiplicador(6),A_multiplicador(6),A_multiplicador(6));
    a7 <= (A_multiplicador(7),A_multiplicador(7),A_multiplicador(7),A_multiplicador(7),A_multiplicador(7),A_multiplicador(7),A_multiplicador(7),A_multiplicador(7));

    a0b <= a0 and B_multiplicador; -- (a0b0,a0b1,a0b2...)
    a1b <= a1 and B_multiplicador;
    a2b <= a2 and B_multiplicador;
    a3b <= a3 and B_multiplicador;
    a4b <= a4 and B_multiplicador;
    a5b <= a5 and B_multiplicador;
    a6b <= a6 and B_multiplicador;
    a7b <= a7 and B_multiplicador;

    c(0) <= a0b(0);

U1: Proj_02_somador port map(a0b(1),a1b(0),'0',c(1),cout(0));

U2: Proj_02_somador port map(a0b(2),a1b(1),cout(0),s(0),cout(1));
U3: Proj_02_somador port map(s(0),a2b(0),'0',c(2),cout(2));

U4: Proj_02_somador port map(a0b(3),a1b(2),cout(1),s(1),cout(3));
U5: Proj_02_somador port map(s(1),a2b(1),cout(2),s(2),cout(4));
U6: Proj_02_somador port map(s(2),a3b(0),'0',c(3),cout(5));

U7: Proj_02_somador port map(a0b(4),a1b(3),cout(3),s(3),cout(6));
U8: Proj_02_somador port map(s(3),a2b(2),cout(4),s(4),cout(7));
U9: Proj_02_somador port map(s(4),a3b(1),cout(5),s(5),cout(8));
U10: Proj_02_somador port map(s(5),a4b(0),'0',c(4),cout(9));

U11: Proj_02_somador port map(a0b(5),a1b(4),cout(6),s(6),cout(10));
U12: Proj_02_somador port map(s(6),a2b(3),cout(7),s(7),cout(11));
U13: Proj_02_somador port map(s(7),a3b(2),cout(8),s(8),cout(12));
U14: Proj_02_somador port map(s(8),a4b(1),cout(9),s(9),cout(13));
U15: Proj_02_somador port map(s(9),a5b(0),'0',c(5),cout(14));

U16: Proj_02_somador port map(a0b(6),a1b(5),cout(10),s(10),cout(15));
U17: Proj_02_somador port map(s(10),a2b(4),cout(11),s(11),cout(16));
U18: Proj_02_somador port map(s(11),a3b(3),cout(12),s(12),cout(17));
U19: Proj_02_somador port map(s(12),a4b(2),cout(13),s(13),cout(18));
U20: Proj_02_somador port map(s(13),a5b(1),cout(14),s(14),cout(19));
U21: Proj_02_somador port map(s(14),a6b(0),'0',c(6),cout(20));

U22: Proj_02_somador port map(a0b(7),a1b(6),cout(15),s(15),cout(21));
U23: Proj_02_somador port map(s(15),a2b(5),cout(16),s(16),cout(22));
U24: Proj_02_somador port map(s(16),a3b(4),cout(17),s(17),cout(23));
U25: Proj_02_somador port map(s(17),a4b(3),cout(18),s(18),cout(24));
U26: Proj_02_somador port map(s(18),a5b(2),cout(19),s(19),cout(25));
U27: Proj_02_somador port map(s(19),a6b(1),cout(20),s(20),cout(26));
U28: Proj_02_somador port map(s(20),a7b(0),'0',c(7),cout(27));

U29: Proj_02_somador port map(a1b(7),cout(21),cout(22),s(21),cout(28));
U30: Proj_02_somador port map(s(21),a2b(6),cout(23),s(22),cout(29));
U31: Proj_02_somador port map(s(22),a3b(5),cout(24),s(23),cout(30));
U32: Proj_02_somador port map(s(23),a4b(4),cout(25),s(24),cout(31));
U33: Proj_02_somador port map(s(24),a5b(3),cout(26),s(25),cout(32));
U34: Proj_02_somador port map(s(25),a6b(2),cout(27),s(26),cout(33));
U35: Proj_02_somador port map(s(26),a7b(1),'0',c(8),cout(34));

U36: Proj_02_somador port map(a2b(7),cout(28),cout(29),s(27),cout(35));
U37: Proj_02_somador port map(s(27),a3b(6),cout(30),s(28),cout(36));
U38: Proj_02_somador port map(s(28),a4b(5),cout(31),s(29),cout(37));
U39: Proj_02_somador port map(s(29),a5b(4),cout(32),s(30),cout(38));
U40: Proj_02_somador port map(s(30),a6b(3),cout(33),s(31),cout(39));
U41: Proj_02_somador port map(s(31),a7b(2),cout(34),c(9),cout(40));

U42: Proj_02_somador port map(a3b(7),cout(35),cout(36),s(32),cout(41));
U43: Proj_02_somador port map(s(32),a4b(6),cout(37),s(33),cout(42));
U44: Proj_02_somador port map(s(33),a5b(5),cout(38),s(34),cout(43));
U45: Proj_02_somador port map(s(34),a6b(4),cout(39),s(35),cout(44));
U46: Proj_02_somador port map(s(35),a7b(3),cout(40),c(10),cout(45));

U47: Proj_02_somador port map(a4b(7),cout(41),cout(42),s(36),cout(46));
U48: Proj_02_somador port map(s(36),a5b(6),cout(43),s(37),cout(47));
U49: Proj_02_somador port map(s(37),a6b(5),cout(44),s(38),cout(48));
U50: Proj_02_somador port map(s(38),a7b(4),cout(45),c(11),cout(49));

U51: Proj_02_somador port map(a5b(7),cout(47),cout(48),s(39),cout(50));
U52: Proj_02_somador port map(s(39),a6b(6),cout(49),s(40),cout(51));
U53: Proj_02_somador port map(s(40),a7b(5),cout(50),c(12),cout(52));

U54: Proj_02_somador port map(a6b(7),cout(51),cout(52),s(41),cout(53));
U55: Proj_02_somador port map(s(41),a7b(6),cout(53),c(13),cout(54));

U56: Proj_02_somador port map(a7b(7),cout(53),cout(54),c(14),c(15));

O_multiplicador <= c(7 downto 0);
C_OUT_multiplicador <= c(8) or c(9) or c(10) or c(11) or c(12) or c(13) or c(14) or c(15);

end log;