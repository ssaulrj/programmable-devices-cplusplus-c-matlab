                    .def _fibonaccifunc           ;Función llamada desde C
_fibonaccifunc:     MV       	A4,A1        ;ajustar el contador en A1
					ZERO 		A2		     ;A2 = 0		
					ZERO 		A4			 ;A4 = 0
					ADD    		A4,1,A4	     ;A4 = 1;		
LOOP:               ADD    		A4,A2,A4	 ;CALCULA NUEVO NUMERO FIBONACCI
					MV       	A4,A2		 ;copiar a aux	
					SUB      	A1,1,A1      ;decrementar la cuenta del bucle
       [A1]        	B          	LOOP         ;salto a LOOP si A1 # 0
                    NOP     	5            ;Cinco ciclos de retardo
                    B          	B3           ;retorno al programa en C
                    NOP     	5            ;cinco ciclos de retardo
                    .end
