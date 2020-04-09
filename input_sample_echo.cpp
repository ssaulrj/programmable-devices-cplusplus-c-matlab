#include "dsk6713_aic23.h"	                                                                                //Archivo de soporte para el 
                                                                                                                                   //códec del DSK
                                                                                                                                   //Para la versión 8.1 del CCS
Uint32 fs=DSK6713_AIC23_FREQ_8KHZ;               //Frecuencia de muestreo
#define lbuffer 3000                                                   //Definición del tamaño del buffer para introducir retardo
#define lbuffer2 6000                                                   
#define lbuffer3 9000
#define lbuffer4 12000

short entrada, salida;	

short buffer[lbuffer];			               //Creación del buffer
short buffer2[lbuffer2];	
short buffer3[lbuffer3];			               //Creación del buffer
short buffer4[lbuffer4];

short i = 0, j = 0, k = 0, l = 0;

float a_ = 0.5;			               //Parámetro para variar al ampilitud del eco 
float a_2 = 0.25;			                
float a_3 = 0.125;			            
float a_4 = 0.062;	
 
interrupt void c_int11()	                              //Rutina del servicio de interrupción
{
 short lb1=lbuffer;
 short lb2=lbuffer2;
 short lb3=lbuffer3;
 short lb4=lbuffer4;
 
 entrada = input_sample(); 	                              //Muestra de entrada
 
//1. Bucle transparente
//output_sample(entrada);

//2. Retardo
//salida=buffer[i];          
//output_sample(salida);

//3. Efecto de Eco (4 ECOS)
salida=entrada + a_*buffer[i] + a_2*buffer2[j] + a_3*buffer3[k] + a_4*buffer4[l];                           //Muestra reciente+muestra anterior 
output_sample(salida);  	                              //Muestra de salida

 buffer[i] = entrada; 	       	                              //Almacenamiento de la muestra más reciente
 buffer2[j]= entrada;                     //Almacenamiento de la muestra más reciente
 buffer3[k]= entrada;                     //Almacenamiento de la muestra más reciente
 buffer4[l]= entrada;

 i++; j++;                                                                         //Incremento de la cuenta en el Buffer
	if (i >= lb1) i = 0;          
	if (j >= lb2) j = 0;                                                           //Incremento de la cuenta en el Buffer
	if (k >= lb3) k = 0;          
	if (l >= lb4) l = 0;          

}
main()
{
 comm_intr();		                             //Inicialización del DSK, codec, McBSP
 while(1);              		                             //Bucle infinito
}
