LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY piccolotb IS
END piccolotb;
 
ARCHITECTURE behavior OF piccolotb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT piccolo
port(
          clk          :  in std_logic ;--The main clock of the ciphering unit
          reset        :  in std_logic ;--To reset the ciphering unit
        
          keyin    :  in std_logic_vector (127 downto 0);
          plaintext : in std_logic_vector (63 downto 0);
          ciphertext: out std_logic_vector(63 downto 0);
    
          finishEncrypt : out std_logic--Validate the ciphering unit output      
          );
    END COMPONENT;
    

   --Inputs
   signal keyin     : std_logic_vector(127 downto 0) := (others => '0');
   signal plaintext : std_logic_vector(63 downto 0) := (others => '0');
   
   signal clkPiccolo   : std_logic;
   signal resetPiccolo : std_logic;
 	--Outputs
   signal ciphertext    : std_logic_vector(63 downto 0);
   signal finishPiccolo : std_logic;
   constant halfPeriod : time := 10 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: piccolo PORT MAP 
   (      clk        => clkPiccolo,
          reset      => resetPiccolo,
          keyin      => keyin,
          plaintext  => plaintext,
          ciphertext => ciphertext,
          finishEncrypt => finishPiccolo
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
        plaintext <= x"0123456789abcdef";
		keyin     <= x"00112233445566778899aabbccddeeff";
		clkPiccolo       <= '0';
		resetPiccolo     <= '1';
		wait for 10 ns;
		resetPiccolo     <= '0';
		loop
    		clkPiccolo <= not clkPiccolo after halfPeriod;
        end loop;
        
   end process;

END ARCHITECTURE;