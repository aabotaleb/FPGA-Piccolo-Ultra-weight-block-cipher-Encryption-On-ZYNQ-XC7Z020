library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity piccolosbox is
port (
        datai : in  std_logic_vector(3 downto 0);
        datao : out std_logic_vector(3 downto 0)
    );
end piccolosbox;

architecture Behavioral of piccolosbox is

begin
    lookup_process : process (datai) is
    begin
        lookup_case : case datai is
            when x"0"   => datao <= x"E";
            when x"1"   => datao <= x"4";
            when x"2"   => datao <= x"B";
            when x"3"   => datao <= x"2";
            when x"4"   => datao <= x"3";
            when x"5"   => datao <= x"8";
            when x"6"   => datao <= x"0";
            when x"7"   => datao <= x"9";
            when x"8"   => datao <= x"1";
            when x"9"   => datao <= x"A";
            when x"A"   => datao <= x"7";
            when x"B"   => datao <= x"F";
            when x"C"   => datao <= x"6";
            when x"D"   => datao <= x"C";
            when x"E"   => datao <= x"5";
            when x"F"   => datao <= x"D";

            when others => datao <= (others => 'X');
        end case lookup_case;
    end process lookup_process;

end Behavioral;