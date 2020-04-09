// DSP002_MEM_EXT_PUNTEROS.c
#include "dsk6713_aic23.h"            	//Archivo de soporte del DSK (Colocar la ruta en la versión 3.1)
#include "rbfN55FIR.cof"  			 	//Archivo de coeficientes
Uint32 fs=DSK6713_AIC23_FREQ_16KHZ;		//Frecuencia de muestreo (Igual a la del filtro diseñado)

//Defines and global variables
float x[N]; float y; int output; int i,k,m;


void main(){

	 comm_poll();              				//Iniciar sondeo de perifericos
	 DSK6713_DIP_init();		
	 DSK6713_LED_init();

	 while(1){
	 	x[0]=input_sample();   				//Lectura de una muestra desde el CODEC
	 	y = 0;
	    for (k = 0; k < N ; k++){
	       y = y + (h[k]*x[k]) ;
	    }
	    for (m = N-1; m >= 1; m--){
	       x[m] = x[m-1];
	    }

	    if(DSK6713_DIP_get(0) == 0)    		//Verificar si el switch No. 0 está activado
	    {
	        DSK6713_LED_on(0);          	
	        
	        output = (int)x[0]; 			//Cast a int de la muestra sin procesar
	        output_sample(output>>15); 	

	        DSK6713_LED_off(0);

	    }else if(DSK6713_DIP_get(1) == 0)	//Verificar si el switch No. 1 está activado
	    {
	        DSK6713_LED_on(1);           
	       
		    output = (int)y; 				//Cast a int de la muestra procesada
		    output_sample(output>>15); 	

	        DSK6713_LED_off(1);
	    }

	 };
}
