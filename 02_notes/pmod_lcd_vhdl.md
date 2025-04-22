# PMod LCD IP (PLCD)

## Grobdesign IP 
1. AXI Slave Interface (siehe customipaxi)
2. LCD Controller 
	1. Register decodieren und entsprechende IP Teile enablen
	2. Init/Reset Schaltung (Startup Timing, Display löschen)
	3. ASCII -> Character Decoder Schaltung
	4. DDRAM Address Set Schaltung (Position setzen)
	5. PMod Schaltung

## Register decodieren und IP Teile enablen
Hier wird aus den Registern, welche von Microprozessor gesetzt werden können, der Befehl interpretiert und die entsprechende Schaltung enabled (falls nötig), damit die richtigen Werte in den Registern der PMod Schaltung landen.

## Init/Reset Schaltung
Hier die Init Zeiten beachten und das Display löschen.

## ASCII -> Character Decoder Schaltung
Bei einem Write muss das eingegebene ASCII-Zeichen in den korrekten CGROM Index umgerechnet werden. Unbekannte Zeichen sollten z.B im ? resultieren.

## DDRAM Address Set Schaltung (Position setzen)
Falls der Scroll nicht verwendet werden soll kann von der IP als Eingabe auch einfach als Zahl 0-31 kommen. Diese muss dann noch umgerechnet werden.

## PMod Schaltung 
Diese könnte von den anderen Schaltungen die entsprechenden Daten bekommen und dann die Kommunikation im Nibble Mode mit den korrekten Timings handhaben. So müssen die Timings nur an einer Stelle realisiert werden. Außerdem kann die PMod Schaltung die Ausführung über die IP zurückmelden.


