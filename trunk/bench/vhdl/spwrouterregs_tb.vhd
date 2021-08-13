----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 10.08.2021 16:47
-- Design Name: SpaceWire Router Control Register Testbench
-- Module Name: spwrouterregs_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.Std_logic_1164.ALL;
USE IEEE.Numeric_Std.ALL;
USE work.spwrouterpkg.ALL;

ENTITY spwrouterregs_tb IS
END;

ARCHITECTURE spwrouterregs_tb_arch OF spwrouterregs_tb IS

  COMPONENT spwrouterregs
    GENERIC (
      numports : INTEGER RANGE 0 TO 31
    );
    PORT (
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      writeData : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      readData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      readwrite : IN STD_LOGIC;
      dByte : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      proc : OUT STD_LOGIC;
      strobe : IN STD_LOGIC;
      cycle : IN STD_LOGIC;
      portstatus : IN array_t(0 TO 31)(31 DOWNTO 0);
      receiveTimeCode : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      autoTimeCodeValue : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      autoTimeCodeCycleTime : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  -- TODO: Initial values...  

  -- System clock.
  SIGNAL clk : STD_LOGIC;

  -- Asynchronous reset.
  SIGNAL rst : STD_LOGIC := '0';

  -- Data to write into registers. (Everything that has no own port)
  SIGNAL writeData : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

  -- Data to read from register. (Router Table or general data)
  SIGNAL readData : STD_LOGIC_VECTOR(31 DOWNTO 0);

  -- High wenn geschrieben, low wenn gelesen werden soll.
  -- Gilt nur für Routing Table
  SIGNAL readwrite : STD_LOGIC := '0';

  -- Selects bytes of the 32 bits. Gilt für alle register.
  SIGNAL dByte : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');

  -- Memory address. Depending on bit assignment, operation
  -- is carried out in corresponding table or routing table.
  SIGNAL addr : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

  -- High when an operation is performing.
  SIGNAL proc : STD_LOGIC;

  -- TODO: ?? noch unklar
  SIGNAL strobe : STD_LOGIC := '0';
  SIGNAL cycle : STD_LOGIC := '0';

  -- Port status register. Created for maximum ports of 32.
  -- (Each port takes over writing in its associated line.)
  SIGNAL portstatus : array_t(0 TO 31)(31 DOWNTO 0) := (OTHERS => (OTHERS => '0'));

  -- TimeCode receive register.
  SIGNAL receiveTimeCode : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

  -- AutoTimeCode value register.
  SIGNAL autoTimeCodeValue : STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- AutoTimeCodeCycleTime register.
  SIGNAL autoTimeCodeCycleTime : STD_LOGIC_VECTOR(31 DOWNTO 0);
  -- Clock period. (100 MHz)
  CONSTANT clock_period : TIME := 10 ns;
  SIGNAL stop_the_clock : BOOLEAN;
  -- TODO: Number of simulated ports.
  CONSTANT sim_numports : INTEGER RANGE 0 TO 31 := 4;

  -- TODO: Testbench switcher.
BEGIN
  -- Design under test.
  dut : spwrouterregs GENERIC MAP(numports => sim_numports)
  PORT MAP(
    clk => clk,
    rst => rst,
    writeData => writeData,
    readData => readData,
    readwrite => readwrite,
    dByte => dByte,
    addr => addr,
    proc => proc,
    strobe => strobe,
    cycle => cycle,
    portstatus => portstatus,
    receiveTimeCode => receiveTimeCode,
    autoTimeCodeValue => autoTimeCodeValue,
    autoTimeCodeCycleTime => autoTimeCodeCycleTime);

  stimulus : PROCESS
  BEGIN

    -- Put initialisation code here
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    WAIT;
  END PROCESS;

  clocking : PROCESS
  BEGIN
    WHILE NOT stop_the_clock LOOP
      clk <= '0', '1' AFTER clock_period / 2;
      WAIT FOR clock_period;
    END LOOP;
    WAIT;
  END PROCESS;

END spwrouterregs_tb_arch;