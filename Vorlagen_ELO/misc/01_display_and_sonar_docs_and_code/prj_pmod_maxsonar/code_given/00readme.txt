Zum Laufenbrinegn des Referenzprojekts:

Sie müssen die gegebene VM mit AMD/Xilinx Vivado 2023.2 verwenden

-Entpacken Sie die gegebenen zip-dateien für die HW und die SW
-Die HW muss dabei so entpackt/kopiert werden, dass der finale Projektpfad /1work/fpgaproc/test_mb_pmod_maxsonar ist. 
-Die SW muss dabei so entpackt/kopiert werden, dass der finale Projektpfad /1work/fpgaproc/test_mb_pmod_maxsonar_sw ist. 

Schließen Sie das FPGA-board an und prüfen Sie ob der USB-Port and ie VM durchgeschliffen wurde (Haken gesetzt bei Digilent USB device).
Öffen Sie die HW platform und das darin enthaltene constraints file um herauszufinden wo und wie sie das pmod Modul anschließen müssen.
Öffnen Sie ein serielles Terminal: sudo putty /dev/ttyUSB1 -serial -sercfg 115200,8,n,1,N
Nach dem Öffnen der SW in AMD/Xilinx Vitis starten Sie die Applikation pmod_maxsonar

Die Application soll beim Ausführen Folgendes zeigen:
Der Abstandswert wird gelesen und auf auf dem seriellen Terminal ausgegeben 
  Achtung der Sensor hat einen minimal Wert den er erfassen kann (ca 15-16cm; siehe Datenblatt; geringere Werte als 15 cm werden als 15cm ausgegeben)
  ohne Beeinflussung wird der Abstand zur Deckenhöhe ausgegeben 
  Wenn Sie Ihre Hand zwischen Sensor und Decke bringen, sollte ein geringerer Wert ausgegeben werden

