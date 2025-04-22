# PMod LCD

## Ziel 
Schreiben einer IP welche es ermöglicht, das Display soweit wie möglich über Hardware zu steuern. Mögliche Operationen die hilfreich wären:
- Display löschen
- Zeichen schreiben (an bestimmter Position)

## Display Specs 
- 16*2 LCD (32 Positionen)
- 192 bzw. 93 vordefinierte ASCII Charaktere

## LCD Interface 
- DB4-DB7: Datenbits, hiermit werden Befehle oder Zeichen codiert
- RS: Register Select High für Daten (Zeichen, Cursor Position), Low für Instruktionen
- RW: Read/Write High für Read mode, Low for Write Mode
- E: Read/Write Enable High für Read, falling edge für write

Der character-generator ROM (CGROM) hält eine Tabelle mit Zeichen wird nun ein solcher Index in den display data RAM (DDRAM) geschrieben, wird dieses Zeichen an der entsprechenden Stelle auf dem Display erscheinen. 

Zusätzlich gibt es noch Befehle wie Clear Display und Set DDRAM.

## Display Positionen
Für jede Reihe 39 Slots zur Verfügung (es werden nur 32 benötigt aber die anderen sind z.B. fürs scrollen)

## Timing
TODO

## Ports am FPGA
Da das Display gemäß Aufgabenstellung im Nible-Mode betrieben werden soll, brauchen wir nur 2 PMod Anschlüsse. Einen für die Daten-Bits und den anderen für die Steuerbefehle.
 ```shell
 set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { clp_db_tri_io[4] }]; #IO_L6N_T0_VREF_15 Sch=ja[7] //db04 //nibble mode uses db04-db07
 
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { clp_db_tri_io[5] }]; #IO_L10P_T1_AD11P_15 Sch=ja[8] //db05

set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { clp_db_tri_io[6] }]; #IO_L10N_T1_AD11N_15 Sch=ja[9] //db06

set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { clp_db_tri_io[7] }]; #IO_25_15 Sch=ja[10] //db07

set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { clp_cb_tri_o[0] }]; #IO_L14P_T2_SRCC_35 Sch=jd[7] //lcd_rs

set_property -dict { PACKAGE_PIN D2    IOSTANDARD LVCMOS33 } [get_ports { clp_cb_tri_o[1] }]; #IO_L14N_T2_SRCC_35 Sch=jd[8] //lcd_rw

set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { clp_cb_tri_o[2] }]; #IO_L15P_T2_DQS_35 Sch=jd[9] //lcd_e
 ```