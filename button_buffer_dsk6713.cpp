// DSP002_MEM_EXT_PUNTEROS.c
#include "dsk6713_aic23.h"            //Archivo de soporte del DSK (Colocar la ruta en la versión 3.1)
Uint32 fs=DSK6713_AIC23_FREQ_8KHZ;		//Frecuencia de muestreo
#define N	 40000 

#define lbuffer 3000                                                   //Definición del tamaño del buffer para introducir retardo
#define lbuffer2 6000 
#define lbuffer3 9000                                                   //Definición del tamaño del buffer para introducir retardo
#define lbuffer4 12000 

short buffer[lbuffer];			               //Creación del buffer
short buffer2[lbuffer2];
short buffer3[lbuffer3];			               //Creación del buffer
short buffer4[lbuffer4];

short i = 0, j=0, k = 0, l = 0;

float a_ = 0.5;			               //Parámetro para variar al ampilitud del eco 
float a_2 = 0.25;	
float a_3 = 0.125;	
float a_4 = 0.0625;	

                                                                    //Búffer
int i; short var, salida;                                                            
short* x_ptr= (short*) 0x80000000;
short* x_ptr2= (short*)  0x80400000;
void main()
{
 short lb1=lbuffer;
 short lb2=lbuffer2;
 short lb3=lbuffer3;
 short lb4=lbuffer4;

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
	            DSK6713_LED_off(0);  
	            var=0;          	                            //Apagar el LED No. 0 cuando el BÚFFER esté lleno
	            break;
	        }else if(DSK6713_DIP_get(2) == 0)      	                            //Verificar si el switch No. 0 está presionado
	        {
	            DSK6713_LED_on(2);           		            //Encender LED No. 0
	            for (i = 0; i<N; i++)
	            {*(x_ptr2+i) = input_sample();} 		            //Lectura de una muestra de entrada
	            DSK6713_LED_off(2);
	            var=0;            	                            //Apagar el LED No. 0 cuando el BÚFFER esté lleno
	            break;
	        }
	  };

	  

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
	      }else if ((DSK6713_DIP_get(3)==0)&&(var==0)){

	      	 DSK6713_LED_on(3);             	                  //encender el  LED No. 1
	         for (h = 0; h<N; h++)
	         {salida=*(x_ptr2+h);
	          salida= salida + a_*buffer[i] + a_2*buffer2[j] + a_3*buffer3[k] + a_4*buffer4[l];
	          output_sample(salida); 

	          buffer[i] = salida; 	       	          
			  buffer2[j]= salida; 
			  buffer2[k]= salida; 
			  buffer2[l]= salida;                     

			  i++; j++; k++; l++;

				if (i >= lb1) i = 0;          
				if (j >= lb2) j = 0;
				if (k >= lb3) k = 0;          
				if (l >= lb4) l = 0;

	         }	                           //Reproducción 
	         var=1;
	        
	         DSK6713_LED_off(3); 

	         break;		

	      }
	      //if(DSK6713_DIP_get(1)==1) var=0;							//Cambiar el estado de la bandera
	                                    
	   };
 };
 
}
