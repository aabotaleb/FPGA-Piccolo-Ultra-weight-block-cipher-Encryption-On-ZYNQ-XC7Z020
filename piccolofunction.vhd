library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piccolofunction is
port(data_in : in std_logic_vector(15 downto 0);
	  data_out : out std_logic_vector(15 downto 0)
	  );
end piccolofunction;

architecture Behavioral of piccolofunction is

component piccolosbox is
port (
        datai : in  std_logic_vector(3 downto 0);
        datao : out std_logic_vector(3 downto 0)
    );
end component piccolosbox;

component piccolomatrix is
port(   data_i_s0 : in std_logic_vector (3 downto 0);
		data_i_s1 : in std_logic_vector (3 downto 0);
		data_i_s2 : in std_logic_vector (3 downto 0);
		data_i_s3 : in std_logic_vector (3 downto 0);
		
		data_o_s4 : out std_logic_vector (3 downto 0);
		data_o_s5 : out std_logic_vector (3 downto 0);
		data_o_s6 : out std_logic_vector (3 downto 0);
		data_o_s7: out std_logic_vector (3 downto 0));
end component piccolomatrix;

signal s0_out,s1_out,s2_out,s3_out : std_logic_vector(3 downto 0);
signal m_out_0,m_out_1,m_out_2,m_out_3 : std_logic_vector (3 downto 0);
signal s4_out,s5_out,s6_out,s7_out : std_logic_vector(3 downto 0);

begin

matrix_component : piccolomatrix 
port map( data_i_s0 => s0_out,
		data_i_s1 => s1_out,
		data_i_s2 => s2_out,
		data_i_s3 => s3_out,
		
		data_o_s4 =>m_out_0,
		data_o_s5 =>m_out_1,
		data_o_s6 =>m_out_2,
		data_o_s7 =>m_out_3);

sbox0 : piccolosbox
port map (datai => data_in(15 downto 12),
		datao => s0_out);
		
sbox1 : piccolosbox
port map (datai => data_in(11 downto 8),
		datao => s1_out);
		
sbox2 : piccolosbox
port map (datai => data_in(7 downto 4),
		datao => s2_out);
		
sbox3 : piccolosbox
port map (datai => data_in(3 downto 0),
		datao => s3_out);
		
sbox4 : piccolosbox
port map (datai => m_out_0,
		datao => s4_out);
		
sbox5 : piccolosbox
port map (datai => m_out_1,
		datao => s5_out);
		
sbox6 : piccolosbox
port map (datai => m_out_2,
		datao => s6_out);
		
sbox7 : piccolosbox
port map (datai => m_out_3,
		datao => s7_out);
		
function_out : process (s4_out,s5_out,s6_out,s7_out) is
begin
	data_out <= s4_out & s5_out & s6_out & s7_out;
end process function_out;	

end Behavioral;