#include "dsk6713_aic23.h"
#include "dsk6713_dip.h"                                                                                    //Archivo de soporte para el
                                                                                                                                   //códec del DSK                                                                                                     //Para la versión 8.1 del CCS
Uint32 fs=DSK6713_AIC23_FREQ_8KHZ;               //Frecuencia de muestreo
#define lbuffer 3000                                                   //Definición del tamaño del buffer para introducir retardo
#define lbuffer2 6000

short entrada, salida;

short buffer[lbuffer];                         //Creación del buffer
short buffer2[lbuffer2];

short i = 0, j=0;

float a_ = 0.5;                        //Parámetro para variar al ampilitud del eco
float a_2 = 0.25;
//Parámetro para variar al ampilitud del eco


interrupt void c_int11()                                  //Rutina del servicio de interrupción
{

 short lb1=lbuffer;
 short lb2=lbuffer2;

 entrada = input_sample();

 if(DSK6713_DIP_get(0) == 0){
    //BUCLE TRANSPARENTE
    output_sample(entrada);

 }else if(DSK6713_DIP_get(1) == 0){
    //RETARDO
    salida=buffer[i];
    output_sample(salida);

 }else if(DSK6713_DIP_get(2) == 0){
    //1 ECO
    salida=entrada + a_*buffer[i];                           //Muestra reciente+muestra anterior
    output_sample(salida);                                    //Muestra de salida

 }else if(DSK6713_DIP_get(3) == 0){
    //2 ECO
    salida=entrada + a_*buffer[i] + a_2*buffer2[j];        //Muestra reciente+muestra anterior
    output_sample(salida);                                 //Muestra de salida

 }else{
     output_sample(0);
 }


 buffer[i] = entrada;
 buffer2[j]= entrada;

 i++; j++;
    if (i >= lb1) i = 0;
    if (j >= lb2) j = 0;


}
main()
{
 DSK6713_DIP_init();
 comm_intr();          //Inicialización del DSK, codec, McBSP
 while(1);             //Bucle infinito
}
