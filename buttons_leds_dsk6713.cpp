// DSP002_MEM_EXT_PUNTEROS.c
#include "dsk6713_aic23.h"            //Archivo de soporte del DSK (Colocar la ruta en la versión 3.1)
Uint32 fs=DSK6713_AIC23_FREQ_8KHZ;		//Frecuencia de muestreo
#define N	 40000                                                                     //Búffer
int i; short var, salida;                                                            
short* x_ptr= (short*) 0x80000000;
short* x_ptr2= (short*)  0x80400000;
void main()
{
 comm_poll();                   			              //DSK, CODEC y McBSP
 DSK6713_DIP_init();
 DSK6713_LED_init();

 while(1){

	 while(1)                           	                                             //Bucle infinito
	  {
	        if(DSK6713_DIP_get(0) == 0)      	                            //Verificar si el switch No. 0 está presionado
	        {
	            DSK6713_LED_on(0);           		            //Encender LED No. 0
	            for (i = 0; i<N; i++)
	            {*(x_ptr+i) = input_sample();} 		            //Lectura de una muestra de entrada
	            DSK6713_LED_off(0);            	                            //Apagar el LED No. 0 cuando el BÚFFER esté lleno
	            break;
	        }else(DSK6713_DIP_get(2) == 0)      	                            //Verificar si el switch No. 0 está presionado
	        {
	            DSK6713_LED_on(2);           		            //Encender LED No. 0
	            for (i = 0; i<N; i++)
	            {*(x_ptr2+i) = input_sample();} 		            //Lectura de una muestra de entrada
	            DSK6713_LED_off(2);            	                            //Apagar el LED No. 0 cuando el BÚFFER esté lleno
	            break;
	        }
	  };

	  var=0;

	  while(1)
	  {
	      if((DSK6713_DIP_get(1)==0)&&(var==0))                   //Verificar si SW No. 1 está presionado y var=0
	      {
	         DSK6713_LED_on(1);             	                  //encender el  LED No. 1
	         for (i = 0; i<N; i++)
	         {salida=*(x_ptr+i);
	         output_sample(salida); }	                           //Reproducción 
	         var=1;
	         DSK6713_LED_off(1); 

	         break;                                  //Apagar el LED#1 cuando se termine
	      }
	      //if(DSK6713_DIP_get(1)==1) var=0;							//Cambiar el estado de la bandera
	                                    
	   };
 };
 
}
