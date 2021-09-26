----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 06.06.2021 16:26
-- Design Name: Testbench for Clock Recovery Front-End Module for SpaceWire Light IP Receiver
-- Module Name: spwrecvfront_clkrec_tb
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: -
-- Tool Versions: 
-- Description: Tests only physical layer and doesn't validate whether transmitted
-- bits are valid in the SpaceWire context. (streamtest_tb can be used for this)
-- Allows validation of correct behavior of the clock recovery feature and at different
-- transmission rates up to system clock in Mbps.
-- 
-- Dependencies: 
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY spwrecvfront_clkrec_tb IS
END;

ARCHITECTURE spwrecvfront_clkrec_tb_arch OF spwrecvfront_clkrec_tb IS
    -- Design under test.
    COMPONENT spwrecvfront_clkrec
        GENERIC (
            WIDTH : INTEGER RANGE 1 TO 3
        );
        PORT (
            clk : IN STD_LOGIC;
            spw_di : IN STD_LOGIC;
            spw_si : IN STD_LOGIC;
            rxen : IN STD_LOGIC;
            inact : OUT STD_LOGIC;
            inbvalid : OUT STD_LOGIC;
            inbits : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;

    -- Simulation signal declarations.
    SIGNAL clk : STD_LOGIC;
    SIGNAL spw_di : STD_LOGIC;
    SIGNAL spw_si : STD_LOGIC;
    SIGNAL rxen : STD_LOGIC;
    SIGNAL inact : STD_LOGIC;
    SIGNAL inbvalid : STD_LOGIC;
    SIGNAL inbits : STD_LOGIC_VECTOR(0 DOWNTO 0);

    -- Testbench specific declarations.
    -- High if spw_si should be generated correctly, low if no changes should be made.
    SHARED VARIABLE strobe_output : STD_LOGIC := '1';

    -- Signal for clock recovery.
    SIGNAL clock_recovery : STD_ULOGIC;

    -- Incomming bit in queue.
    SIGNAL rbit : STD_ULOGIC;

    -- Bit list with sendet bits recognized als valid by receiver (spwrecv)
    SIGNAL bin : STD_ULOGIC_VECTOR(0 DOWNTO 0);

    -- #################################
    -- CHANGE TESTVARIABLES HERE...       
    -- Data transmission frequency.
    CONSTANT data_clock_freq : real := 10.0e6; -- 10 MHz == 10 Mbps

    -- System clock frequency.   
    CONSTANT sys_clock_freq : real := 20.0e6; -- 20 MHz
    -- Number of loop iterations to be performed.
    CONSTANT num_iterations : INTEGER := 1;

    -- Bit sequence that is transmitted.
    CONSTANT bseq : STD_LOGIC_VECTOR := "010101100111000";

    -- Determines whether the activation input signal (rxen) of the
    -- receiver is changed depending on time. This is supposed to 
    -- have the effect of deactivation the front-end.
    CONSTANT RxenStressTest : BOOLEAN := false;

    -- Determines whether the strobe signal is temporarily not generated
    -- correctly in order to make the behavior of the dut visible.
    CONSTANT StrobeStressTest : BOOLEAN := false;

    -- Width of shift registers in recvfront_clkrec. Depending on 
    -- transmission rate, necessary for synchronization and avoiding
    -- metastability. Causes a clock shift!
    CONSTANT NumberOfShiftRegisters : INTEGER RANGE 1 TO 3 := 2;
    -- #################################
BEGIN
    -- Design under test.
    dut : spwrecvfront_clkrec
    GENERIC MAP(
        -- Width of shift registers (default: 2)
        WIDTH => NumberOfShiftRegisters
    )
    PORT MAP(
        clk => clk,
        spw_di => spw_di,
        spw_si => spw_si,
        rxen => rxen,
        inact => inact,
        inbvalid => inbvalid,
        inbits => inbits
    );

    -- Generate system clock.
    SysClk : PROCESS IS
        VARIABLE sw : BOOLEAN := false;
    BEGIN
        clk <= '1';
        WAIT FOR (0.5 sec) / sys_clock_freq;
        clk <= '0';
        WAIT FOR (0.5 sec) / sys_clock_freq;
    END PROCESS;

    -- produces DataIn and StrobeIn by using bit sequence in bseq.
    DataStrobeCreation : PROCESS
        VARIABLE strobe_sw : STD_ULOGIC := '0'; -- default value: false
    BEGIN
        FOR i IN 0 TO num_iterations LOOP
            FOR j IN 0 TO (bseq'Length - 1) LOOP
                spw_di <= bseq(j);

                -- checks whether the strobe signal should be generated correctly.
                IF strobe_output = '1' THEN
                    spw_si <= bseq(j) XOR strobe_sw;
                    strobe_sw := NOT strobe_sw;
                END IF;

                WAIT FOR (0.5 sec) / data_clock_freq;
            END LOOP;
        END LOOP;
        WAIT;
    END PROCESS;

    -- Controls rxen signal via RxenStressTest-variable
    ControlRxenCreation : PROCESS IS
        CONSTANT rxen_on : TIME := (0.5 sec) / data_clock_freq * bseq'Length / 6;
        CONSTANT rxen_off : TIME := (0.5 sec) / data_clock_freq * bseq'Length / 7;
    BEGIN
        IF RxenStressTest = false THEN
            rxen <= '1';
            WAIT;
        END IF;

        FOR i IN 0 TO num_iterations LOOP
            rxen <= '1';
            WAIT FOR rxen_on;
            rxen <= '0';
            WAIT FOR rxen_off;
            rxen <= '1';
        END LOOP;
        WAIT;
    END PROCESS;

    -- Controlls influence of strobe signal and can be activated
    -- by changing StrobeStressTest-variable above.
    ControlStrobeCreation : PROCESS
        CONSTANT strobe_on : TIME := (0.5 sec) / data_clock_freq * bseq'Length / 5;
        CONSTANT strobe_off : TIME := (0.5 sec) / data_clock_freq * bseq'Length / 6;
    BEGIN
        IF StrobeStressTest = false THEN
            strobe_output := '1';
            WAIT;
        END IF;

        FOR i IN 0 TO num_iterations LOOP
            strobe_output := '1';
            WAIT FOR strobe_on;
            strobe_output := '0';
            WAIT FOR strobe_off;
            strobe_output := '1';
        END LOOP;
        WAIT;
    END PROCESS;

    -- Clock recovery. (to check correctness. Is generated in
    -- same way in the front-end but none output signal)
    clock_recovery <= spw_di XOR spw_si;

    -- Simplified receiver functionality that should show which
    -- bits are forwarded fromt the front-end to the receiver.
    -- (Similar function structure as in spwrecv.vhd)
    -- Process incomming bit
    PROCESS (rxen, inact, inbits)
    BEGIN
        IF inbvalid = '1' THEN
            rbit <= inbits(0);
        END IF;

        IF rxen = '0' OR inbvalid = '0' THEN
            rbit <= 'U';
        END IF;
    END PROCESS;

    -- Update bit on system clock beat.
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            bin(0) <= rbit;
        END IF;
    END PROCESS;
END spwrecvfront_clkrec_tb_arch;