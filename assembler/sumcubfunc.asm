;sumcubfunc.asm Funci¢n en ensamblador para obtener la suma cubica de los primeros 5 n£meros
                 .def _sumcubfunc    ;Funci¢n llamada desde C
_sumcubfunc:     MV      A4,A1       ;ajustar el contador en A1
                 ZERO    A2
LOOP:            MPY     A4,A1,A4    ;acumulaci¢n en A4
                 NOP                 ;retardo para la terminar de realizar la mult
                 MPY     A4,A1,A4    ;acumulaci¢n en A4
                 NOP                 ;retardo para la terminar de realizar la mult
                 SUB     A1,1,A1     ;decremento para la siguiente multiplicaci¢n
                 ADD     A2,A4,A2    ;decremento para la siguiente multiplicaci¢n
       [A1]      B       LOOP        ;salto a to LOOP si A1 # 0
                 NOP     5           ;cinco ciclos de retardo
                 MV      A2,A4       ;ajustar el contador en A4
                 B       B3          ;retorno al programa en C
                 NOP     5           ;cinco ciclos de retardo
                 .end
