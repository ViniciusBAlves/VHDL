----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:53:47 04/08/2023 
-- Design Name: 
-- Module Name:    mult - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mult is
    Port ( clk, rst,start: in STD_LOGIC;
           done: out STD_LOGIC;
           A1 : in  STD_LOGIC_VECTOR (7 downto 0);
           A2 : in  STD_LOGIC_VECTOR (7 downto 0);
           A3 : in  STD_LOGIC_VECTOR (7 downto 0);
           A4 : in  STD_LOGIC_VECTOR (7 downto 0);
           B1 : in  STD_LOGIC_VECTOR (7 downto 0);
           B2 : in  STD_LOGIC_VECTOR (7 downto 0);
           B3 : in  STD_LOGIC_VECTOR (7 downto 0);
           B4 : in  STD_LOGIC_VECTOR (7 downto 0);
           C1 : in  STD_LOGIC_VECTOR (7 downto 0);
           C2 : in  STD_LOGIC_VECTOR (7 downto 0);
           C3 : in  STD_LOGIC_VECTOR (7 downto 0);
           C4 : in  STD_LOGIC_VECTOR (7 downto 0);
           D1 : in  STD_LOGIC_VECTOR (7 downto 0);
           D2 : in  STD_LOGIC_VECTOR (7 downto 0);
           D3 : in  STD_LOGIC_VECTOR (7 downto 0);
           D4 : in  STD_LOGIC_VECTOR (7 downto 0);
           MF1 : out  STD_LOGIC_VECTOR (15 downto 0);
           MF2 : out  STD_LOGIC_VECTOR (15 downto 0);
           MF3 : out  STD_LOGIC_VECTOR (15 downto 0);
           MF4 : out  STD_LOGIC_VECTOR (15 downto 0));
end mult;

architecture Behavioral of mult is

type tipoestado is (t0,t1,t2,t3,t4);
signal estado,prox_estado: tipoestado;
signal R1,R2,R3,R4: STD_LOGIC_VECTOR (15 downto 0);
signal S1,S2,S3,S4: STD_LOGIC_VECTOR (15 downto 0);
signal P1,P2,P3,P4: STD_LOGIC_VECTOR (15 downto 0);
signal F1,F2,F3,F4: STD_LOGIC_VECTOR (15 downto 0);
signal load_R,load_S,load_P,load_F: STD_LOGIC;

begin

--PARTE DE CONTROLE
--MAQUINA DE ESTADOS(REGISTRADOR)
process(clk,rst) 
begin 
    if(rst = '1') then 
        estado <= t0; 
    elsif(rising_edge(clk)) then 
        estado <= prox_estado; 
    end if; 
end process;

process(estado,start)
begin
    load_R <= '0';
    load_S <= '0';
    load_P <= '0';
    load_F <= '0';
    case estado is
        --ESTADO RESET
        when t0 =>
            if start = '1' then
                prox_estado <= t1;
            else
                prox_estado <= t0;
            end if;
        --MULTIPLICACAO DAS ENTRADAS
        when t1 =>
            load_R <= '1';
            load_S <= '1';
            prox_estado <= t2;
        --SOMA DAS MATRIZES RESULTADO
        when t2 =>
            load_P <= '1';
            prox_estado <= t3;
        --FUNCAO FILTRO
        when t3 =>
            load_F <= '1';
            prox_estado <= t4;
        --DONE
        when t4 =>
            done <= '1';
            if start = '1' then
                prox_estado <= t4;
            else
                prox_estado <= t0;
            end if;
    end case;
end process;

--PARTE OPERATIVA

--MATRIZ MR1
process(clk,rst,A1,A2,A3,A4,B1,B2,B3,B4)
begin
    if rst = '1' then
        R1 <= (others=>'0'); 
        R2 <= (others=>'0'); 
        R3 <= (others=>'0'); 
        R4 <= (others=>'0'); 
    elsif rising_edge(clk) then
        if(load_R = '1') then
            R1 <= std_logic_vector(unsigned(STD_LOGIC_VECTOR(unsigned(A1)*unsigned(B1)))+unsigned(STD_LOGIC_VECTOR(unsigned(A2)*unsigned(B3))));
            R2 <= std_logic_vector(unsigned(STD_LOGIC_VECTOR(unsigned(A1)*unsigned(B2)))+unsigned(STD_LOGIC_VECTOR(unsigned(A2)*unsigned(B4))));
            R3 <= std_logic_vector(unsigned(STD_LOGIC_VECTOR(unsigned(A3)*unsigned(B1)))+unsigned(STD_LOGIC_VECTOR(unsigned(A4)*unsigned(B3))));
            R4 <= std_logic_vector(unsigned(STD_LOGIC_VECTOR(unsigned(A3)*unsigned(B2)))+unsigned(STD_LOGIC_VECTOR(unsigned(A4)*unsigned(B4))));
        else
            R1 <= R1;
            R2 <= R2;
            R3 <= R3;
            R4 <= R4;
        end if;
    end if;
end process;

--MATRIZ MR2
process(clk,rst,C1,C2,C3,C4,D1,D2,D3,D4)
begin
    if rst = '1' then
        S1 <= (others=>'0'); 
        S2 <= (others=>'0'); 
        S3 <= (others=>'0'); 
        S4 <= (others=>'0'); 
    elsif rising_edge(clk) then
        if(load_S = '1') then
            S1 <= std_logic_vector(unsigned(STD_LOGIC_VECTOR(unsigned(C1)*unsigned(D1)))+unsigned(STD_LOGIC_VECTOR(unsigned(C2)*unsigned(D3))));
            S2 <= std_logic_vector(unsigned(STD_LOGIC_VECTOR(unsigned(C1)*unsigned(D2)))+unsigned(STD_LOGIC_VECTOR(unsigned(C2)*unsigned(D4))));
            S3 <= std_logic_vector(unsigned(STD_LOGIC_VECTOR(unsigned(C3)*unsigned(D1)))+unsigned(STD_LOGIC_VECTOR(unsigned(C4)*unsigned(D3))));
            S4 <= std_logic_vector(unsigned(STD_LOGIC_VECTOR(unsigned(C3)*unsigned(D2)))+unsigned(STD_LOGIC_VECTOR(unsigned(C4)*unsigned(D4))));
        else
            S1 <= S1;
            S2 <= S2;
            S3 <= S3;
            S4 <= S4;
        end if;
    end if;
end process;

--MATRIZ MP
process(clk,rst,R1,R2,R3,R4,S1,S2,S3,S4)
begin
    if rst = '1' then
        P1 <= (others=>'0'); 
        P2 <= (others=>'0'); 
        P3 <= (others=>'0'); 
        P4 <= (others=>'0'); 
    elsif rising_edge(clk) then
        if(load_P = '1') then
            P1 <= std_logic_vector(unsigned(R1)+unsigned(S1));
            P2 <= std_logic_vector(unsigned(R2)+unsigned(S2));
            P3 <= std_logic_vector(unsigned(R3)+unsigned(S3));
            P4 <= std_logic_vector(unsigned(R4)+unsigned(S4));
        else
            P1 <= P1;
            P2 <= P2;
            P3 <= P3;
            P4 <= P4;
        end if;
    end if;
end process;

--MATRIZ MF
process(clk,rst,P1,P2,P3,P4)
begin
    if rst = '1' then
        F1 <= (others=>'0'); 
        F2 <= (others=>'0'); 
        F3 <= (others=>'0'); 
        F4 <= (others=>'0'); 
    elsif rising_edge(clk) then
        if(load_F = '1') then
            if P1 < "0000010000011010" then
                F1 <= (others=>'0');
            else
                F1 <= P1;
            end if;
            if P2 < "0000010000011010" then
                F2 <= (others=>'0');
            else
                F2 <= P2;
            end if;
            if P3 < "0000010000011010" then
                F3 <= (others=>'0');
            else
                F3 <= P3;
            end if;
            if P4 < "0000010000011010" then
                F4 <= (others=>'0');
            else
                F4 <= P4;
            end if;
        else
            F1 <= F1;
            F2 <= F2;
            F3 <= F3;
            F4 <= F4;
        end if;
    end if;
end process;

MF1 <= F1;
MF2 <= F2;
MF3 <= F3;
MF4 <= F4;

end Behavioral;
