library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piccolokey is
generic( round : integer range 0 to 32
			);
port ( keyin : in std_logic_vector (127 downto 0);
		 key_out1_wk : out std_logic_vector (15 downto 0);
		 key_out2_wk : out std_logic_vector (15 downto 0);
		 key_out1_rk : out std_logic_vector (15 downto 0);
		 key_out2_rk : out std_logic_vector (15 downto 0));
end piccolokey;

architecture Behavioral of piccolokey is

component rk is
generic( round : integer range 0 to 32
			);
port ( key_in : in std_logic_vector (127 downto 0);
		 key_out_rk1 : out std_logic_vector (15 downto 0);
		 key_out_rk2 : out std_logic_vector (15 downto 0));
end component rk;

component wk is
generic( round : integer range 0 to 32
			);
port ( key_in : in std_logic_vector (127 downto 0);
		 key_out1_wk : out std_logic_vector (15 downto 0);
		 key_out2_wk : out std_logic_vector (15 downto 0));
end component wk;

begin
-- round key 
rk_component : rk
generic map( round => round
			)
port map( key_in => keyin,
		 key_out_rk1 => key_out1_rk,
		 key_out_rk2 => key_out2_rk);

--whitening key 
wk_component : wk
generic map( round => round
			)
port map( key_in => keyin,
			 key_out1_wk => key_out1_wk,
			 key_out2_wk => key_out2_wk);
			 	
end Behavioral;