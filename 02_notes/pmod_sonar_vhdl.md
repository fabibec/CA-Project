# PMOD Max Sonar IP (PSON)

## Grobdesign IP 
1. AXI Slave Interface (siehe customipaxi)
2. Max Sonar Controller 
	1. Timer / Counter 
	2. Clock Divider 
	3. UART Receiver 
	4. RX Daten auswerten (ASCII Decoder)
	5. evtl. Umrechnung in -> cm 
	6. Distanzdaten in Register schreiben

### Timer / Counter 
1. Power-on Delay Handling
	- Interner Timer startet nach Reset und zählt 250 ms ab
	- Danach beginnt erst das Einlesen von Daten
2. Calibration Delay Handling
	- Interner Timer für die erste Messung
3. Empfangs-Timeout (opt.)
	- Wenn nach z. B. 100 ms keine neue Messung empfangen wurde, wird valid auf 0 gesetzt

#### FSM-Flow 
RESET → WAIT_POWERUP → WAIT_CALIBRATION → WAIT_FIRST_PACKET → RECEIVE_DATA → IDLE

- WAIT_POWERUP zählt 250 ms ab.
- WAIT_CALIBRATION empfängt ein vollständiges Paket ("Rxxx\r") und verwirft es (nicht speichern, valid = 0)
- WAIT_FIRST_PACKET wartet auf erste "Rxxx\r"-Sequenz.
- RECEIVE_DATA verarbeitet empfangene Zeichen von UART.
- IDLE wartet auf nächste gültige Sequenz.

### Clock Divider 
Der UART Sensor hat eine Baudrate von 9600 Baut, durch Teilung des Systemtaktes (100 MHz) muss ein entsprechender Clock beachtet werden. Beim empfangen muss zusätzlich Oversampled werden also Clock * 8.

### UART Receiver
Die Receiver Logik kann auch recht spezifisch implementiert werden, da ja die Struktur des Packets immer gleich ist 

### ASCII Decoder 
Die 3 ASCII Zahlen müssen in Integer konvertiert werden

### Umrechnung in -> cm
1Zoll=2.54cm

## Beispiel Register Layout

|Offset | Register Name | Typ | Beschreibung|
|----------|-----------------------|------- |--------------------|
|0x00 | DISTANCE | RO | Distanz in Inches (8 Bit) (für cm brauchen wir mehr Bits)
0x04 | STATUS | RO | Statusbits (z. B. Valid-Flag, First-Read-Done etc.)
0x08| DEBUG_UART | RO | Letztes empfangenes Byte (optional, nützlich beim Debugging)
0x0C | TIMING_STATE | RO | Aktueller FSM-Zustand (nur lesbar)

### 0x04 STATUS
[0]    → valid  : 1 = gültiger Messwert liegt vor

[1]    → first_done   : 1 = erste (ungültige) Messung wurde verworfen

[2]    → timeout      : 1 = seit >100ms keine neue Messung empfangen

[3]    → uart_err     : 1 = UART-Fehler (z. B. framing error oder unerwartetes Zeichen)

[4:7]  → reserved

### 0x08 DEBUG_UART
[7:0]  → Letztes empfangenes Byte vom UART

### 0x0C TIMING_STATE
[4:0]  FSM-Zustand

## Ressourcen
Hier könnte man vielleicht was von dem Code abwandeln:
- [VHDL UART Implementierung I](https://nandland.com/uart-serial-port-module/)
- [VHDL UART Implementierung II](https://www.mikrocontroller.net/attachment/9036/ALSE_UART_us.pdf)