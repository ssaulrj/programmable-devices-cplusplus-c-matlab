/*18. Modificar el programa de tal forma que usando los dipswitchs, 
se pueda seleccionar la salida sin filtrar (Dip0) y la salida filtrada 
(Dip1) en tiempo real. Si no se oprime ningún dipswitch no debe haber salida.*/

#include "dsk6713_aic23.h"            // Archivo de soporte para el códec DSK (poner la ruta)
Uint32 fs=DSK6713_AIC23_FREQ_16KHZ;    // Frecuencia de muestreo
#include "rbfN55FIR.cof"

//declaración de vectores y variables globales
float entrada;
float x[N];
float yy;
int y;
//short y;

interrupt void c_int11()	  //Rutina del servicio de interrupción
{  	
	entrada = input_sample(); 
	x[0] = entrada;	          //Lectura de una muestra del códec

	if(DSK6713_DIP_get(0) == 0){
	 	//SALIDA SIN FILTRAR
	 	output_sample(entrada>>15);	//Envío de la muestra de entrada hacia el códec	
 
 	}else if(DSK6713_DIP_get(1) == 0){
 		//SALIDA FILTRADA
		yy = 0;

		short k;
		for(k = 0; k<N; k++){
			yy = yy + (h[k] * x[k]);
		}

		y=(int) yy;
	    //y=(short) yy;
   		output_sample(y>>15);  		//Envío de la muestra filtrada hacia el códec
	
 	}else{
 		//SALIDA NULA
 		//output_sample(0);	
 	}

 	short m;
	for(m = N-1; m>=1; m--){
		x[m] = x[m-1];
	}
   
   	return;
}
void main()
{
	DSK6713_DIP_init();

	y=0; yy=0;
    for(i=0;i<N;i++){
       x[i]=0;
    }

	comm_intr();  //Inicializar el codec, DSK y McBSP
	while(1);     //Bucle infinito a la espera de una interrupción
}

