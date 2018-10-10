library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piccolo is
port(
      clk          :  in std_logic ;--The main clock of the ciphering unit
      reset        :  in std_logic ;--To reset the ciphering unit
    
      keyin    :  in std_logic_vector (127 downto 0);
	  plaintext : in std_logic_vector (63 downto 0);
	  ciphertext: out std_logic_vector(63 downto 0);

      finishEncrypt : out std_logic--Validate the ciphering unit output	  
	  );
end piccolo;

architecture Behavioral of piccolo is
----------
component piccoloenc is
generic( round : integer range 0 to 32); 
port( keyin    : in std_logic_vector (127 downto 0);
		plaintext: in  std_logic_vector(63 downto 0);
	   ciphered : out std_logic_vector(63 downto 0));
end component piccoloenc;
------------
component piccoloenc_30 is
generic( round : integer range 0 to 32); 
port( keyin_30    : in std_logic_vector (127 downto 0);
		plaintext_30: in  std_logic_vector(63 downto 0);
	   ciphered_30 : out std_logic_vector(63 downto 0));
end component piccoloenc_30;

signal data_array : ciphered_data;
signal valid      : std_logic;    
signal clockNum   : std_logic_vector(4 downto 0);

begin


   
-------------------------
enc_generate : for i in 0 to 30 generate
-----------
    r_0_29 : if i <= 29 generate
        enc : piccoloenc
            generic map(round => i)
            port map( keyin    => keyin,
                        plaintext => data_array(i),
                        ciphered => data_array(i+1));
    end generate r_0_29;
-----------
    r_30 : if i = 30 generate
        enc_30 : piccoloenc_30
            generic map(round => i)
            port map( keyin_30    => keyin,
                        plaintext_30 => data_array(i),
                        ciphered_30 => data_array(i+1));
    end generate r_30;
----------
end generate enc_generate;
-------------------------

piccoloRounds : process (clk,reset) is
begin
    if (reset='1') then
    	valid       <= '0';
    	
        clockNum    <= "00000";
    elsif (clockNum = "00000") then--Inital cycle
        data_array(0) <= plaintext;
        clockNum      <= clockNum+1;
    elsif (clockNum = "11110") then--Final cycle
           valid<='1';
           ciphertext    <= data_array(31);
    elsif (rising_edge(clk))  then
           clockNum     <= clockNum;
    end if;
      	
end process piccoloRounds;

finishEncrypt <= valid         ;

end Behavioral;