LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Proj_02_circuito IS
    PORT(
            SW_IN   : in std_logic_vector (7 downto 0); --O
            UNI     : out std_logic_vector (6 downto 0);
            DEZ     : out std_logic_vector (6 downto 0);
            CEN     : out std_logic_vector (6 downto 0)
    );
END ENTITY;

ARCHITECTURE main OF Proj_02_circuito IS 


COMPONENT Proj_02_bcd IS
    PORT(
            pin      : in std_logic_vector (7 downto 0);
            bcd     : out std_logic_vector (11 downto 0)
    );
END COMPONENT Proj_02_bcd;

COMPONENT Proj_02_D7seg IS
    PORT(
            SW      : in std_logic_vector (3 downto 0);
            HEX     : out std_logic_vector (6 downto 0)
    );
END COMPONENT Proj_02_D7seg;

-- sinal do Bin-bcd
SIGNAL out_bcd : std_logic_vector (11 downto 0);

-- sinal do display
SIGNAL D_u,D_d,D_c : std_logic_vector (3 downto 0);

BEGIN

    Binbcd: Proj_02_bcd PORT MAP(SW_IN,out_bcd);

    D_c(3)<=  out_bcd(11);
    D_c(2)<=  out_bcd(10);
    D_c(1)<=  out_bcd(9);
    D_c(0)<=  out_bcd(8);
    D_d(3)<=  out_bcd(7);
    D_d(2)<=  out_bcd(6);
    D_d(1)<=  out_bcd(5);
    D_d(0)<=  out_bcd(4);
    D_u(3)<=  out_bcd(3);
    D_u(2)<=  out_bcd(2);
    D_u(1)<=  out_bcd(1);
    D_u(0)<=  out_bcd(0);

    Display_uni: Proj_02_D7seg PORT MAP (D_u,UNI); 
    Display_dez: Proj_02_D7seg PORT MAP (D_d,DEZ); 
    Display_cen: Proj_02_D7seg PORT MAP (D_c,CEN); 
    END ARCHITECTURE;