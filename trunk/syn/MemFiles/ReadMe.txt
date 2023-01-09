Dateien in diesem Ordner werden mittels TextIO benutzt, um ROM Speicher innerhalb des Routers zu initialisieren.
Wird das Standardregister anstelle des erweiterten Registers verwendet, gibt es keinen externen Bus, der den Router konfigurieren könnte (oder etwa die Routingtabelle ändern könnte).

Wichtig für die Formatierung ist, dass alle Daten als Hexadezimalzahl eingegeben werden (ohne das 0x-Präfix!) und - im Falle der Routingtabelle - pro Zeile nur ein 32 Bit Wort steht.
Begonnen wird im Falle der Routingtabelle mit dem ersten logischen Port (32).

Ebenfalls möglich ist die Einstellung des Intervalls innerhalb der Router ein automatisches Time-Code generiert und verschickt.
Die eingebene Zahl ist ebenfalls ein 32 Bit Wort und wird mit der Taktfrequenz der Router-Clock multipliziert. Null deaktiviert den Mechanismus.

Für weitere Informationen bitte das Handbuch verwenden.

--
Stefan Lindörfer
29.12.2022 14:20
