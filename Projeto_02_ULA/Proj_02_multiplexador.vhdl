LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Proj_02_multiplexador IS
PORT(
	    A   : IN std_logic_vector (7 downto 0);
        B   : IN std_logic_vector (7 downto 0);
	    K   : IN std_logic_vector (3 downto 0);
        O   : OUT std_logic_vector (7 downto 0);
        C,Z : OUT std_logic;
        U,D,N : OUT std_logic_vector (6 downto 0)
);
END Proj_02_multiplexador;

ARCHITECTURE main OF Proj_02_multiplexador IS 

COMPONENT Proj_02_circuito IS
PORT(
        SW_IN   : in std_logic_vector (7 downto 0); --O
        UNI     : out std_logic_vector (6 downto 0);
        DEZ     : out std_logic_vector (6 downto 0);
        CEN     : out std_logic_vector (6 downto 0)
);
END COMPONENT Proj_02_circuito;

    
    COMPONENT Proj_02_somador IS
    PORT(
	    A_somador       : IN std_logic;
        B_somador       : IN std_logic;
        C_IN_somador    : IN std_logic;
	    O_somador       : OUT std_logic;
        C_OUT_somador   : OUT std_logic
    );
    END  COMPONENT Proj_02_somador;

    COMPONENT Proj_02_subtrator IS
    PORT(
	    A_subtrator     : IN std_logic ;
        B_subtrator     : IN std_logic;
        C_IN_subtrator  : IN std_logic;
	    O_subtrator     : OUT std_logic;
        C_OUT_subtrator : OUT std_logic
    );
    END COMPONENT Proj_02_subtrator;

    COMPONENT Proj_02_deslocador_esquerda_8b is
        port (
        A_deslocador_esq,B_deslocador_esq : in std_logic_vector(7 downto 0);
        O_deslocador_esq : out std_logic_vector(7 downto 0)
    );
    end COMPONENT Proj_02_deslocador_esquerda_8b;

    COMPONENT Proj_02_deslocador_direita_8b is
        port (
        A_deslocador_dir,B_deslocador_dir : in std_logic_vector(7 downto 0);
        O_deslocador_dir : out std_logic_vector(7 downto 0)
    );
    end COMPONENT Proj_02_deslocador_direita_8b;

    COMPONENT Proj_02_multiplicador is
    port (
        A_multiplicador : in  std_logic_vector(7 downto 0);
        B_multiplicador : in  std_logic_vector(7 downto 0);
        O_multiplicador : out std_logic_vector(7 downto 0);
	    C_OUT_multiplicador: out std_logic
    );
    END COMPONENT Proj_02_multiplicador;

    COMPONENT Proj_02_swp is

        port (
        A_swp : in  std_logic_vector(7 downto 0); 
        Swp : out std_logic_vector(7 downto 0) 
        );
    
    end COMPONENT Proj_02_swp ;

    COMPONENT Proj_02_swa is
        port (
            A_swa : in  std_logic_vector(7 downto 0); 
            Swa : out std_logic_vector(7 downto 0) 
        );
    
    end COMPONENT Proj_02_swa;

    COMPONENT Proj_02_and is 
        port (
           A_and   : in std_logic_vector (7 downto 0);
           B_and   : in std_logic_vector (7 downto 0);
           AND_logic : out std_logic_vector (7 downto 0)
           );
           end COMPONENT Proj_02_and;

    COMPONENT Proj_02_or is 
        port (
            A_or   : in std_logic_vector (7 downto 0);
            B_or   : in std_logic_vector (7 downto 0);
            OR_logic : out std_logic_vector (7 downto 0)
            );
            end COMPONENT Proj_02_or;
           
    COMPONENT Proj_02_xor is 
        port (
            A_xor   : in std_logic_vector (7 downto 0);
            B_xor   : in std_logic_vector (7 downto 0);
            XOR_logic : out std_logic_vector (7 downto 0)
            );
            end COMPONENT Proj_02_xor;
        
    COMPONENT Proj_02_not is 
        port (
            A_xor   : in std_logic_vector (7 downto 0);
            B_xor   : in std_logic_vector (7 downto 0);
            NOT_logic : out std_logic_vector (7 downto 0)
            );
        end COMPONENT Proj_02_not;

    COMPONENT Proj_02_mux_8b is
    port (o0,o1,o2,o3,o4,o5,o6,o7: in  std_logic_vector(7 downto 0);
	  key: in std_logic_vector(2 downto 0);
          S: out std_logic_vector(7 downto 0));
        end COMPONENT Proj_02_mux_8b;

    COMPONENT Proj_02_mux_deslocador is
    port (o0,o1: in  std_logic_vector(7 downto 0);
	  key: in std_logic;
          S: out std_logic_vector(7 downto 0));
        end COMPONENT Proj_02_mux_deslocador; 
 
                
    SIGNAL O_add, O_sub,O_mul, O_inc, O_dec, O_and, O_or, O_xor, O_not :std_logic_vector (7 downto 0);
    SIGNAL O_shl, O_shr, O_swp, O_swa : std_logic_vector (7 downto 0);
    SIGNAL C_add_OUT : std_logic_vector(7 downto 0);
    SIGNAL C_sub_OUT : std_logic_vector(7 downto 0);
    SIGNAL C_mul_OUT : std_logic;
    SIGNAL C_inc_OUT : std_logic_vector(7 downto 0);
    SIGNAL C_dec_OUT : std_logic_vector(7 downto 0);
    SIGNAL UL,UA,vector_zero,Z_nor,O_final,carry,c_mul_vec:std_logic_vector (7 downto 0);
   
    
    begin
        --InstanciaÃ§Ã£o posicional 
        Somador_0   : Proj_02_somador   port map (A(0),B(0),    '0'   ,O_add(0),C_add_OUT(0));
        Somador_1   : Proj_02_somador   port map (A(1),B(1),C_add_OUT(0),O_add(1),C_add_OUT(1));
        Somador_2   : Proj_02_somador   port map (A(2),B(2),C_add_OUT(1),O_add(2),C_add_OUT(2));
        Somador_3   : Proj_02_somador   port map (A(3),B(3),C_add_OUT(2),O_add(3),C_add_OUT(3));
        Somador_4   : Proj_02_somador   port map (A(4),B(4),C_add_OUT(3),O_add(4),C_add_OUT(4));
        Somador_5   : Proj_02_somador   port map (A(5),B(5),C_add_OUT(4),O_add(5),C_add_OUT(5));
        Somador_6   : Proj_02_somador   port map (A(6),B(6),C_add_OUT(5),O_add(6),C_add_OUT(6));
        Somador_7   : Proj_02_somador   port map (A(7),B(7),C_add_OUT(6),O_add(7),C_add_OUT(7));

        Subtrator_0 : Proj_02_subtrator port map (A(0),B(0),    '0'   ,O_sub(0),C_sub_OUT(0));
        Subtrator_1 : Proj_02_subtrator port map (A(1),B(1),C_sub_OUT(0),O_sub(1),C_sub_OUT(1));
        Subtrator_2 : Proj_02_subtrator port map (A(2),B(2),C_sub_OUT(1),O_sub(2),C_sub_OUT(2));
        Subtrator_3 : Proj_02_subtrator port map (A(3),B(3),C_sub_OUT(2),O_sub(3),C_sub_OUT(3));
        Subtrator_4 : Proj_02_subtrator port map (A(4),B(4),C_sub_OUT(3),O_sub(4),C_sub_OUT(4));
        Subtrator_5 : Proj_02_subtrator port map (A(5),B(5),C_sub_OUT(4),O_sub(5),C_sub_OUT(5));
        Subtrator_6 : Proj_02_subtrator port map (A(6),B(6),C_sub_OUT(5),O_sub(6),C_sub_OUT(6));
        Subtrator_7 : Proj_02_subtrator port map (A(7),B(7),C_sub_OUT(6),O_sub(7),C_sub_OUT(7));

        Multiplicador : Proj_02_multiplicador port map (A,B,O_mul,C_mul_OUT);

        Incremento_0 : Proj_02_somador  port map (A(0),'0',    '1'   ,O_inc(0),C_inc_OUT(0));
        Incremento_1 : Proj_02_somador  port map (A(1),'0',C_inc_OUT(0),O_inc(1),C_inc_OUT(1));
        Incremento_2 : Proj_02_somador  port map (A(2),'0',C_inc_OUT(1),O_inc(2),C_inc_OUT(2));
        Incremento_3 : Proj_02_somador  port map (A(3),'0',C_inc_OUT(2),O_inc(3),C_inc_OUT(3));
        Incremento_4 : Proj_02_somador  port map (A(4),'0',C_inc_OUT(3),O_inc(4),C_inc_OUT(4));
        Incremento_5 : Proj_02_somador  port map (A(5),'0',C_inc_OUT(4),O_inc(5),C_inc_OUT(5));
        Incremento_6 : Proj_02_somador  port map (A(6),'0',C_inc_OUT(5),O_inc(6),C_inc_OUT(6));
        Incremento_7 : Proj_02_somador  port map (A(7),'0',C_inc_OUT(6),O_inc(7),C_inc_OUT(7));

        Decremento_0 : Proj_02_subtrator port map (A(0),'0',    '1'   ,O_dec(0),C_dec_OUT(0));
        Decremento_1 : Proj_02_subtrator port map (A(1),'0',C_dec_OUT(0),O_dec(1),C_dec_OUT(1));
        Decremento_2 : Proj_02_subtrator port map (A(2),'0',C_dec_OUT(1),O_dec(2),C_dec_OUT(2));
        Decremento_3 : Proj_02_subtrator port map (A(3),'0',C_dec_OUT(2),O_dec(3),C_dec_OUT(3));
        Decremento_4 : Proj_02_subtrator port map (A(4),'0',C_dec_OUT(3),O_dec(4),C_dec_OUT(4));
        Decremento_5 : Proj_02_subtrator port map (A(5),'0',C_dec_OUT(4),O_dec(5),C_dec_OUT(5));
        Decremento_6 : Proj_02_subtrator port map (A(6),'0',C_dec_OUT(5),O_dec(6),C_dec_OUT(6));
        Decremento_7 : Proj_02_subtrator port map (A(7),'0',C_dec_OUT(6),O_dec(7),C_dec_OUT(7));

        SHL : Proj_02_deslocador_esquerda_8b port map (A,B,O_shl);
        SHR : Proj_02_deslocador_direita_8b port map (A,B,O_shr);

        Swp_labble : Proj_02_swp port map (A,O_swp);
        Swa_labble : Proj_02_swa port map (A,O_swa);

        And_logic_labble   : Proj_02_and port map (A,B,O_and);
        Or_logic_labble    : Proj_02_or port map (A,B,O_or);
        XOr_logic_labble    : Proj_02_xor port map (A,B,O_xor);
        Not_logic_labble    : Proj_02_or port map (A,B,O_Not);

        vector_zero <= ('0','0','0','0','0','0','0','0');
	C_mul_vec <= (C_mul_OUT,C_mul_OUT,C_mul_OUT,C_mul_OUT,C_mul_OUT,C_mul_OUT,C_mul_OUT,C_mul_OUT);

        mux_0: Proj_02_mux_8b port map(vector_zero,O_add, O_sub,O_mul,O_inc,O_dec,vector_zero ,vector_zero,K(2 downto 0),UA);
        mux_1: Proj_02_mux_8b port map(O_shl,O_shr,O_swp,O_swa,O_and, O_or, O_xor, O_not,K(2 downto 0),UL);
        mux_2: Proj_02_mux_deslocador port map(UA,UL,K(3),O_final);
	mux_carry: Proj_02_mux_8b port map(vector_zero,C_add_OUT,C_sub_OUT,C_mul_vec,C_inc_OUT,C_dec_OUT,vector_zero,vector_zero,K(2 downto 0),carry);
	
	
	O <= O_final;
	C <= carry(7);
	Z_nor <= vector_zero nor O_final;
	Z <= Z_nor(0) and Z_nor(1) and Z_nor(2) and Z_nor(3) and Z_nor(4) and Z_nor(5) and Z_nor(6) and Z_nor(7);

    CIRCUITO : Proj_02_circuito PORT MAP(O_final,U,D,N);
end architecture;