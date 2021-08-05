----------------------------------------------------------------------------------
-- Company: University of Wuerzburg, Germany
-- Engineer: Stefan Lindoerfer
-- 
-- Create Date: 04.08.2021 14:28
-- Design Name: SpaceWire Control Register
-- Module Name: spwrouterregs
-- Project Name: Bachelor Thesis: Implementation of a SpaceWire Router Switch on a FPGA
-- Target Devices: 
-- Tool Versions: 
-- Description: spwrouterpkg
-- Dependencies: none
-- 
-- Revision:
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.spwrouterpkg.all;
use work.spwpkg.all;

entity spwrouterregs is
    generic (
        -- Number of SpaceWire ports.
        numports : integer range 0 to 31
    );
    ports (
        -- System clock.
        clk: in std_logic;

        -- Asynchronous reset.
        rst: in std_logic;

        -- Transmit clock.
        txclk: in std_logic;

        -- Receiver clock.
        rxclk: in std_logic;

        -- Data to write into register.
        writeData: in std_logic_vector(31 downto 0);

        -- Data to read out register.
        readData: out std_logic_vector(31 downto 0);

        -- High when an operation is in progress.
        acknowledge: out std_logic;

        -- Speicher addresse (gilt für alles, nicht nur Routing Tabelle !!)
        address: in std_logic_vector(31 downto 0); -- korrekt? nicht 8 bits?

        -- strobe und cycle hängen nur mit routing tabelle zusammen
        strobe: in std_logic;
        cycle: in std_logic;

        -- High wenn geschrieben, low wenn gelesen werden soll
        -- Gilt nur für Routing Tabelle
        writeEnable: in std_logic;

        -- Selects Bytes of the 32 bits. Gilt für alle register
        dataByteEnable: in std_logic_vector(3 downto 0);

        -- wird nur einmal gebraucht: schreibt 8 bits in das router configuration register
        requestPort: in std_logic_vector(numports+1 downto 0); -- +1 richtig?

        -- Schreibt den Zustand aller Port (außer Port0) in das Link-On Register.
        linkUp: in std_logic_vector(numports downto 0);


        -- meins
        portstatus: in array_t(0 to (numports-1)) of std_logic_vector(31 downto 0); -- Belegung siehe meine Liste

        info: out std_logic_vector(31 downto 0); -- Info Register -- evtl. lässt sich das auch über readData abwickeln
        -- meins

        receiveTimeCode: in std_logic_vector(numports+1 downto 0);
        transmitTimeCodeEnable: out std_logic_vector(numports downto 0);

        
        -- brauch ich
        autoTimeCodeValue: in std_logic_vector(numports+1 downto 0);
        autoTimeCodeCycleTime: out std_logic_vector(31 downto 0)

        -- Add more registers here!
    );
end spwrouterregs

architecture spwrouterregs_arch of spwrouterregs is
    signal state : spwrouterregsstates := S_Idle;

    -- Enthalten Register Werte
    -- schreibt 
    signal iDataInBuffer : std_logic_vector(31 downto 0);
    signal iDataOutBuffer: std_logic_vector(31 downto 0);
    signal iAcknowledgeOut: std_logic;
--
    -- Select Signal
    signal iLowAddress00 : std_logic;
    signal iLowAddress04 : std_logic;
    signal iLowAddress08 : std_logic;
    signal iLowAddress0C : std_logic;
    signal iLowAddress10 : std_logic;
    signal iLowAddress14 : std_logic;
    signal iLowAddress18 : std_logic;
    signal iLowAddress1C : std_logic;
    signal iLowAddress20 : std_logic;
    signal iLowAddress24 : std_logic;
    signal iLowAddress28 : std_logic;
    signal iLowAddress2C : std_logic;
    signal iLowAddress30 : std_logic;
    signal iLowAddress34 : std_logic;
    signal iLowAddress38 : std_logic;
    signal iLowAddress3C : std_logic;

    



    -- Register
    --signal iLinkControlRegister1 : std_logic_vector()


    -- Routing Tabelle
    signal iSelectRoutingTable: std_logic;
    signal iRoutingTableStrobe: std_logic;
    signal routingTableReadData: std_logic_vector(31 downto 0);
    signal routingTableAcknowledge: std_logic;

    signal iAcknowledge: std_logic;
    signal iReadData: std_logic_vector(31 downto 0);
    signal iDropCounterclear: std_logic;
begin
    acknowledge <= iAcknowledge;
    readData <= iReadData;
    dropCounterClear <= iDropCounterClear; -- hmm hmm

    -- Decoding address and output the select signal of the applicable register.
    -- Higher 8 bit
    iSelectRoutingTable <= '1' when (address(13 downto 2) > "000000011111" and address(13 downto 2) < "000100000000") else '0';

    iSelectIDRegister <= '1' when address(13 downto 8) = "00" & x"8" else '0';
    iSelectOldRegister <= '1' when address(13 downto 8) = "00" & x"4" else '0';
    iSelectRouterRegister <= '1' when address(13 downto 8) = "00" & x"9" else '0';

        -- Lower 8bit.
    iLowAddress00 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress00 else '0';
    iLowAddress04 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress04 else '0';
    iLowAddress08 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress08 else '0';
    iLowAddress0C <= '1' when address (7 downto 2) = cReserve00 & cLowAddress0C else '0';
    iLowAddress10 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress10 else '0';
    iLowAddress14 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress14 else '0';
    iLowAddress18 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress18 else '0';
    iLowAddress1C <= '1' when address (7 downto 2) = cReserve00 & cLowAddress1C else '0';
    iLowAddress20 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress20 else '0';
    iLowAddress24 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress24 else '0';
    iLowAddress28 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress28 else '0';
    iLowAddress2C <= '1' when address (7 downto 2) = cReserve00 & cLowAddress2C else '0';
    iLowAddress30 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress30 else '0';
    iLowAddress34 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress34 else '0';
    iLowAddress38 <= '1' when address (7 downto 2) = cReserve00 & cLowAddress38 else '0';
    iLowAddress3C <= '1' when address (7 downto 2) = cReserve00 & cLowAddress3C else '0';

    timeOutEnable <= iTimeOutEnableRegister;
    timeOutCountValue <= iTimeOutCountValueRegister;


    -- Hier stehen die errorStatus0X: SpaceWireRouterIPLatchedPulse8


    
    -- FSM
    process(clk, rst)
    begin
        if (rst = '1') then
            state <= S_Idle;
            iAcknowledgeOut <= '0';
            iDataOutBuffer <= (others => '0');
            iDataInBuffer <= (others => '0');
            iLinkControlRegister1 <= "00" & cRunStateTransmitClockDivideValue & x"05";
        
        elsif rising_edge(clk) then
            case state
                when S_Idle =>
                    if (iSelectRoutingTable = '0' and cycle = '1' and strobe = '1') then
                        if (writeEnable = '1') then
                            iDataInBuffer <= writeData;
                            state <= S_Write0;
                        else
                            state <= S_Read0;
                        end if;
                    end if;

                when S_Read0 =>
                    -- Read Register Select.
                    


                when S_Read1 =>
                when S_Write0 =>
                -- Write Register Select.
                if (iSelectStatisticalInformation1 = '1' and iLowAddress00 = '1') then
                    -- Port1 Control/Status Register
                    if (dataByteEnable(2) = '1') then
                        iLinkControlRegister(0) 
                    end if;
                end if;


                when S_Write1 =>
                    -- Write Register END.
                    -- iSoftwareLinkResetx <= '0'; x == PortNr.
                    iAcknowledgeOut <= '0';
                    state <= S_Wait0;

                when S_Wait0 =>
                    state <= S_Wait1;

                when S_Wait1 =>
                    state <= S_Idle;

            end case;
        end if;
    end process;






end spwrouterregs_arch
