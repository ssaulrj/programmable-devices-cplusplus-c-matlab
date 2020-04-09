                    .def _cubosfunc          ;Función llamada desde C
_cubosfunc:         MV       	A4,A1        ;ajustar el contador en A1
					ZERO 		A4
					ZERO 		A2			 ;A2 aux locality
LOOP:               MPY     	A1,A1,A2     ;A2 = A1^2
					NOP                      ;retardo
                    MPY     	A1,A2,A2	 ;A2 = A1^3	
                    NOP                      ;retardo
                    ADD    		A4,A2,A4     ;Sumar el contenido de A4 con A2 y guardar resultado en A4
                    SUB      	A1,1,A1      ;decrementar la cuenta del bucle
       [A1]        	B          	LOOP         ;salto a to LOOP si A1 # 0
                    NOP     	5            ;Cinco ciclos de retardo
                    B          	B3           ;retorno al programa en C
                    NOP     	5            ;cinco ciclos de retardo
