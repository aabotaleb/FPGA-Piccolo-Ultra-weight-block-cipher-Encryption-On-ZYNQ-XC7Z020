library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rk is
generic( round : integer range 0 to 32
			);
port ( key_in : in std_logic_vector (127 downto 0);
		 key_out_rk1 : out std_logic_vector (15 downto 0);
		 key_out_rk2 : out std_logic_vector (15 downto 0));
end rk;

architecture Behavioral of rk is

component constant_gen is
generic( round : integer range 0 to 32
			);
port ( con : out std_logic_vector (31 downto 0));
end component constant_gen;

signal key_store : std_logic_vector (127 downto 0);
signal const : std_logic_vector (31 downto 0);

begin

constant_component : constant_gen
generic map( round => round
			)
port map( con => const);

key_store <= key_in;

Key_gen_process : process (key_store,const) is
	begin
		case round is 
			        when 0 => key_out_rk1<= key_store(95 downto 80) xor const(31 downto 16);
                                 key_out_rk2<= key_store(79 downto 64) xor const (15 downto 0);
                    when 1 => key_out_rk1<= key_store(63 downto 48) xor const(31 downto 16);
                                 key_out_rk2<= key_store(47 downto 32) xor const (15 downto 0);         
                    when 2 => key_out_rk1<= key_store(31 downto 16) xor const(31 downto 16);
                                 key_out_rk2<= key_store(15 downto 0) xor const (15 downto 0);                         
                    when 3 => key_out_rk1<= key_store(95 downto 80) xor const(31 downto 16);
                                 key_out_rk2<= key_store(111 downto 96) xor const (15 downto 0);                         
                    when 4 => key_out_rk1<= key_store(31 downto 16) xor const(31 downto 16);    
                                 key_out_rk2<= key_store(15 downto 0) xor const (15 downto 0);                         
                    when 5 => key_out_rk1<= key_store(127 downto 112) xor const(31 downto 16);
                                 key_out_rk2<= key_store(79 downto 64) xor const (15 downto 0);                         
                    when 6 => key_out_rk1<= key_store(63 downto 48) xor const(31 downto 16);
                                 key_out_rk2<= key_store(47 downto 32) xor const (15 downto 0);                         
                    when 7 => key_out_rk1<= key_store(31 downto 16) xor const(31 downto 16);
                                 key_out_rk2<= key_store(111 downto 96) xor const (15 downto 0);                     
                    when 8 => key_out_rk1<= key_store(63 downto 48) xor const(31 downto 16);
                                 key_out_rk2<= key_store(47 downto 32) xor const (15 downto 0);                         
                    when 9 => key_out_rk1<= key_store(95 downto 80) xor const(31 downto 16);
                                 key_out_rk2<= key_store(15 downto 0) xor const (15 downto 0);                         
                    when 10 =>key_out_rk1<= key_store(127 downto 112) xor const(31 downto 16);
                                 key_out_rk2<= key_store(79 downto 64) xor const (15 downto 0);                         
                    when 11 =>key_out_rk1<= key_store(63 downto 48) xor const(31 downto 16);
                                 key_out_rk2<= key_store(111 downto 96) xor const (15 downto 0);                         
                    when 12 =>key_out_rk1<= key_store(127 downto 112) xor const(31 downto 16);
                                 key_out_rk2<= key_store(79 downto 64) xor const (15 downto 0);                         
                    when 13 =>key_out_rk1<= key_store(31 downto 16) xor const(31 downto 16);
                                 key_out_rk2<= key_store(47 downto 32) xor const (15 downto 0);                         
                    when 14 =>key_out_rk1<= key_store(95 downto 80) xor const(31 downto 16);
                                 key_out_rk2<= key_store(15 downto 0) xor const (15 downto 0);                         
                    when 15 =>key_out_rk1<= key_store(127 downto 112) xor const(31 downto 16);
                                 key_out_rk2<= key_store(111 downto 96) xor const (15 downto 0);                         
                    when 16 =>key_out_rk1<= key_store(95 downto 80) xor const(31 downto 16);
                                 key_out_rk2<= key_store(15 downto 0) xor const (15 downto 0);                         
                    when 17 =>key_out_rk1<= key_store(63 downto 48) xor const(31 downto 16);
                                 key_out_rk2<= key_store(79 downto 64) xor const (15 downto 0);                         
                    when 18 =>key_out_rk1<= key_store(31 downto 16) xor const(31 downto 16);
                                 key_out_rk2<= key_store(47 downto 32) xor const (15 downto 0);                         
                    when 19 =>key_out_rk1<= key_store(95 downto 80) xor const(31 downto 16);
                                 key_out_rk2<= key_store(111 downto 96) xor const (15 downto 0);                         
                    when 20 =>key_out_rk1<= key_store(31 downto 16) xor const(31 downto 16);
                                 key_out_rk2<= key_store(47 downto 32) xor const (15 downto 0);                         
                    when 21 =>key_out_rk1<= key_store(127 downto 112) xor const(31 downto 16);
                                 key_out_rk2<= key_store(15 downto 0) xor const (15 downto 0);                         
                    when 22 =>key_out_rk1<= key_store(63 downto 48) xor const(31 downto 16);
                                 key_out_rk2<= key_store(79 downto 64) xor const (15 downto 0);                         
                    when 23 =>key_out_rk1<= key_store(31 downto 16) xor const(31 downto 16);
                                 key_out_rk2<= key_store(111 downto 96) xor const (15 downto 0);                         
                    when 24 =>key_out_rk1<= key_store(63 downto 48) xor const(31 downto 16);
                                 key_out_rk2<= key_store(79 downto 64) xor const (15 downto 0);                         
                    when 25 =>key_out_rk1<= key_store(95 downto 80) xor const(31 downto 16);
                                 key_out_rk2<= key_store(47 downto 32) xor const (15 downto 0);                         
                    when 26 =>key_out_rk1<= key_store(127 downto 112) xor const(31 downto 16);
                                 key_out_rk2<= key_store(15 downto 0) xor const (15 downto 0);                         
                    when 27 =>key_out_rk1<= key_store(63 downto 48) xor const(31 downto 16);
                                 key_out_rk2<= key_store(111 downto 96) xor const (15 downto 0);                         
                    when 28 =>key_out_rk1<= key_store(127 downto 112) xor const(31 downto 16);
                                 key_out_rk2<= key_store(15 downto 0) xor const (15 downto 0);                         
                    when 29 =>key_out_rk1<= key_store(31 downto 16) xor const(31 downto 16);
                                 key_out_rk2<= key_store(79 downto 64) xor const (15 downto 0);
                    when 30 =>key_out_rk1<= key_store(95 downto 80) xor const(31 downto 16);
                                 key_out_rk2<= key_store(47 downto 32) xor const (15 downto 0);
			when others =>key_out_rk1<= "0000000000000000";
						     key_out_rk2<= "0000000000000000";
		end case;
	end process Key_gen_process;
						 
end Behavioral;