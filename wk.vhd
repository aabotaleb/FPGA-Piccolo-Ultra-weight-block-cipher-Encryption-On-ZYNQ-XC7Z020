library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wk is
generic( round : integer range 0 to 32
			);
port (   key_in : in std_logic_vector (127 downto 0);
		 key_out1_wk : out std_logic_vector (15 downto 0);
		 key_out2_wk : out std_logic_vector (15 downto 0));
end wk;

architecture Behavioral of wk is
signal key_store : std_logic_vector (127 downto 0);
begin
key_store<=key_in;
load_key_and_out : process (key_store) is
							begin 
								if (round=0) then
                                    key_out1_wk<=key_store(127 downto 120) & key_store(103 downto 96);
                                    key_out2_wk<=key_store(111 downto 104) & key_store(119 downto 112);
                                elsif (round=30) then
                                    key_out1_wk<=key_store(63 downto 56) & key_store(7 downto 0);
                                    key_out2_wk<=key_store(15 downto 8) & key_store(55 downto 48);
                                else
                                    key_out1_wk<=x"0000";
                                    key_out2_wk<=x"0000";
                                end if;
						 end process load_key_and_out;

end Behavioral;