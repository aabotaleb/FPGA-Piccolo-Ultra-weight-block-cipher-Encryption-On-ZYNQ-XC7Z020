library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piccoloroundpermutation is
generic( round : integer range 0 to 32
			); 
port(	data_in: in  std_logic_vector(63 downto 0);
	   data_out : out std_logic_vector(63 downto 0));
end piccoloroundpermutation;

architecture Behavioral of piccoloroundpermutation is

begin
piccolo_roundpermutation_process : process (data_in) is
	begin
	if round <= 29 then
		data_out(63 downto 56) <= data_in(47 downto 40);
        data_out(55 downto 48) <= data_in(7 downto 0);
        data_out(47 downto 40) <= data_in(31 downto 24);
        data_out(39 downto 32) <= data_in(55 downto 48);
        data_out(31 downto 24) <= data_in(15 downto 8);
        data_out(23 downto 16) <= data_in(39 downto 32);
        data_out(15 downto 8) <= data_in(63 downto 56);
        data_out(7 downto 0) <= data_in(23 downto 16);
	else
		data_out <= data_in;
	end if;
end process piccolo_roundpermutation_process;

end Behavioral;