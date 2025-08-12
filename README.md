# Abschluss Projekt Computerarchitektur

Erfassung und Anzeige von Sensordaten auf einem Prozessor/FPGA-System

## Beschreibung

Im Rahmen dieses Projekts wurde ein vollständiges System entwickelt, das Sensordaten erfasst und auf einem Display darstellt.
Das Herzstück bildet ein **Arty A7-100 FPGA-Board**, auf dem zwei selbst entwickelte Hardware-Bausteine (VHDL IPs) zum Einsatz kommen:

- **Sensormodul:** Liest Messwerte eines LV-MaxSonar-EZ-Ultraschallsensors über eine serielle UART-Schnittstelle aus.
- **Displaymodul:** Steuert ein Pmod CLP LCD-Display mit 16×2 Zeichen und zeigt die empfangenen Werte an.

Beide Module sind über ein **AXI4-Lite-Interface** mit einem **MicroBlaze-Mikroprozessor** verbunden. Dieser Prozessor übernimmt die Steuerung und Koordination zwischen den Modulen, sodass die Messwerte automatisch erfasst, weitergegeben und visuell dargestellt werden.

Das Projektziel war es, sowohl die Hardware-Bausteine für den Sensor und das Display zu entwickeln als auch ein funktionierendes Gesamtsystem zu realisieren, bei dem Sensor, Display und Prozessor nahtlos zusammenarbeiten.

## Demo 

<p align="center">
  <video src="Video/demo.mp4" width="300" alt="Demo Video" autoplay loop muted playsinline></video>
</p>

oder unter Video/demo.mp4
