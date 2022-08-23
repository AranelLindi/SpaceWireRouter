Erklärung zu den in diesem Ordner befindlichen Dateien. Alle Constraint-Dateine (*.xdc) betreffen in diesem Ordner das BASYS3-Board und sind entsprechend der zugehörigen VHDL-Datei benannt um die Zugehörigkeit zu erleichtern. Es ist darauf zu achten, dass in der IDE (z.B. Vivado) stets das zugehörige Constraint-File ausgewählt wurde!

adapter_top:
Eine erweiterte Implementierung des UART-SpaceWire-Adapters, welche zusätzliche Debugging-Informationen ausgeben kann.

routertest_adapter_single_top:
Eine Implementierung, die einen SpaceWire Router und einen korrespondierenden UART-SpaceWire-Adapter enthält, bei dem jeder Routerport mit dem gegenüberliegenden Adapter-Port verbunden ist. Mit diesem Aufbau kann über den FPGA jeder Port seperat durch den UART-SpaceWire-Adapter angesteuert bzw. abgefragt werden. Hierbei stehen eine auf Kommando-basierte Adapterversion zur Verfügung, mit erweiterten Testmöglichkeiten (siehe Anleitung) oder eine ohne Kommandos.

routertest_adapter_loop_top:
Eine Implementierung, bei der ein SpaceWire Router existiert und ein UART-SpaceWire-Adapter, welcher an den Port0 des Routers angeschlossen ist. Alle weiteren Ports des Routers werden über IO-Ports aus dem Board geführt und können mit Kabeln geloopt werden. Die bevorzugte Einstellung ist dabei: SpWPort1->SpWPort2; SpWPort3->SpWPort4. Hier hilft ein Blick in das entsprechende Constraint-File bzw. die BASYS3-Boardanleitung.

streamtest_top:
Eine Implementierung, bei der lediglich ein einzelner SpaceWire Port implementiert ist. Die Daten/-Strobe-Ausgänge werden dabei herausgeführt und können geloopt werden. Die Implementierung erzeugt daraufhin Pseudodaten, womit die Funktionalität einer einzelnen Portimplementierung getestet werden kann. (Dies war Teil des SpaceWire Light IP-Pakets)

Weitere Dateien:
updatemem cmd.txt - Gedächnitstütze für das Vivado-interne Kommando.
RouterTable.mem - Skizze eines Memory-Files für Vivado.
