library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity constant_gen is
generic( round : integer range 0 to 32
			);
port ( con : out std_logic_vector (31 downto 0));
			
end constant_gen;

architecture Behavioral of constant_gen is

signal c_i : std_logic_vector (4 downto 0) := "00000"; 
signal c_j : std_logic_vector (4 downto 0);
signal c : std_logic_vector (1 downto 0) := "00";
constant const: std_logic_vector (31 downto 0) := x"6547a98b"; 
signal r : integer;

begin

r<=round;

Constant_gen_process: process (r,c_j,c_i,c) is
							begin  
								c_j <=std_logic_vector(to_unsigned((round+1), c_j'length));
								con <= c_j & c_i & c_j & c & c_j & c_i & c_j xor const; 
							end process Constant_gen_process;
end behavioral;