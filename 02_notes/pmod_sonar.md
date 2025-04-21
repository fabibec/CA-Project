# PMOD Max Sonar 

## Ziel 
Schreiben einer IP, welche die Kommunikation mittels UART zum Sensor regelt und die Distanzwerte über ein Register zur Verfügung stellt. Im Demosystem wird die UART Kommunikation über die Software gehandhabt, im fertigen Projekt soll dies in der Sonar IP geschehen.

## Sensor Specs
- erkennt Distanzen von 6in - 255in (15cm - 648cm), alles drunter ist unzuverlässig.
- Daten können per Anlogem Wert, PWM oder UART abgegriffen werden (gemäß Aufgabenstellung brauchen wir hier UART)

Der Sensor braucht 250 ms zum einschalten. Dann 49 ms zum kalibirieren und weitere 49 ms für das erste Reading (RX muss dafür Floating oder High sein). Ab diesem Zeitpunkt kommt alle 49 ms ein Reading (sofern RX nicht low). In den letzen 4.7ms (also 44.3ms - 49 ms) werden die Daten per RS232  übertragen.

## UART Constraints
- Baudrate: 9600
- 8 Datenbits
- kein Paritätsbit
- ein Stopbit

RX des Sensors (TX beim FPGA) sollte Floating oder Logic High gesetzt werden (High wäre wahrscheinlich sauberer, wird aber auch intern vom Sensor gepullupt). Sonst muss nichts zum Sensor geschickt werden (TX vom FPGA muss also nicht implementiert werden).

Über TX werden nach der Kalibrierung die Distanzen übertragen. Zuerst wird ein ASCII 'R' (0x52 o. 82) gesendet, dann die Distanz in Form vom 3 ASCII-Zahlen (0-255 Inches) geliefert und zuletzt ein Carriage Return (x0D o. 13).

## Ports am FPGA
Laut Constraints File werden die Ports des PMod-Anschluss für UART TX und RX benötigt
```shell
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { gpio_rtl_tri_o[0]  }]; #IO_L18P_T2_A12_D28_14 Sch=ck_io[1] #pmodmaxsonar rx

set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { uart_rtl_rxd  }]; #IO_L16P_T2_CSI_B_14 Sch=ck_io[0] #pmodmaxsonar tx
```

## Referenzen
- AXI UART Lite IP
	- [Datasheet](https://docs.amd.com/v/u/en-US/axi_uartlite_ds741)
	- [Product Page](https://www.amd.com/en/products/adaptive-socs-and-fpgas/intellectual-property/axi_uartlite.html#tabs-cca09b7575-item-2da8bf30b9-tab)
	- 