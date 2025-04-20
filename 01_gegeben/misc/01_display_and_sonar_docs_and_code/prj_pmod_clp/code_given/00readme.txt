Zum Laufenbrinegn des Referenzprojekts:

Sie müssen die gegebene VM mit AMD/Xilinx Vivado 2023.2 verwenden

-Entpacken Sie die gegebenen zip-dateien für die HW und die SW
-Die HW muss dabei so entpackt/kopiert werden, dass der finale Projektpfad /1work/fpgaproc/test_mb_pmod_clp ist. 
-Die SW muss dabei so entpackt/kopiert werden, dass der finale Projektpfad /1work/fpgaproc/test_mb_pmod_clp_sw ist. 

Schließen Sie das FPGA-board an und prüfen Sie ob der USB-Port an die VM durchgeschliffen wurde (Haken gesetzt bei Digilent USB device)
Öffen Sie die HW platform und das darin enthaltene constraints file um herauszufinden wo und wie sie das pmod Modul anschließen müssen.
Öffnen Sie ein serielles Terminal: sudo putty /dev/ttyUSB1 -serial -sercfg 115200,8,n,1,N
Nach dem Öffnen der SW in AMD/Xilinx Vitis starten Sie die Applikation pmod_clp_nibble

Die Application soll beim Ausführen Folgendes zeigen:
  Auf dem LCD soll ein "Hello World" Text augegeben werden
  "  PmodCLP Demo"
  "  Hello World!"
  Die erste Zeile bleibt dabei stehen
  und die zweite Zeile wird abwehcslnd mit pfeilen oder ohne dargestellt:  
  "->PmodCLP Demo<- "
  bzw
  "  PmodCLP Demo   "
  



