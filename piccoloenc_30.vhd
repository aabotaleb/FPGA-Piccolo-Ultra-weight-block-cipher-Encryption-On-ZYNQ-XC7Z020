library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piccoloenc_30 is
generic( round : integer range 0 to 32
			); 
port( keyin_30    : in std_logic_vector (127 downto 0);
		plaintext_30: in  std_logic_vector(63 downto 0);
	   ciphered_30 : out std_logic_vector(63 downto 0));
end piccoloenc_30;

architecture Behavioral of piccoloenc_30 is

component piccolofunction is
port(data_in : in std_logic_vector(15 downto 0);
	  data_out : out std_logic_vector(15 downto 0)
	  );
end component piccolofunction;

component piccolokey is
generic( round : integer range 0 to 32
			);
port ( keyin : in std_logic_vector (127 downto 0);
		 key_out1_wk : out std_logic_vector (15 downto 0);
		 key_out2_wk : out std_logic_vector (15 downto 0);
		 key_out1_rk : out std_logic_vector (15 downto 0);
		 key_out2_rk : out std_logic_vector (15 downto 0));
end component piccolokey;


signal wk0_30,wk1_30,rk0_30,rk1_30 : std_logic_vector (15 downto 0);
signal l0_30,l1_30,l2_30,l3_30 : std_logic_vector (15 downto 0);
signal function_a_out_30,function_b_out_30 : std_logic_vector(15 downto 0);


begin

function_a_30 : piccolofunction 
port map(data_in => plaintext_30(63 downto 48),
			data_out =>function_a_out_30
	  );
	  
function_b_30 : piccolofunction 
port map(data_in =>plaintext_30(31 downto 16),
			data_out =>function_b_out_30
	  );

key_30 : piccolokey 
generic map( round => round
			)
port map( keyin => keyin_30,
		 key_out1_wk => wk0_30,
		 key_out2_wk => wk1_30,
		 key_out1_rk => rk0_30,
		 key_out2_rk => rk1_30);
		 
------------------------------------------------------------------------------
 --        ROUND 0 to 29    --------------------------------------------------
------------------------------------------------------------------------------
calculation_process : process (plaintext_30,function_a_out_30,function_b_out_30) is
	begin
	if (round = 30) then
		l0_30 <= plaintext_30(63 downto 48) xor wk0_30;
		l1_30 <= plaintext_30(47 downto 32) xor function_a_out_30 xor rk0_30 ;
		l2_30 <= plaintext_30(31 downto 16) xor wk1_30;
		l3_30 <= plaintext_30(15 downto 0) xor function_b_out_30 xor rk1_30 ;
	end if;
	end process calculation_process; 

	
ciphered : process (l0_30,l1_30,l2_30,l3_30) is
	begin
	if (round = 30) then
		ciphered_30 <= l0_30 & l1_30 & l2_30 & l3_30;
	end if;
	end process ciphered;



end Behavioral;