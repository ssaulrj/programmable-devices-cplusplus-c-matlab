#include "dsk6713_aic23.h"                                // Archivo de soporte para el códec DSK (poner la ruta)
Uint32 fs=DSK6713_AIC23_FREQ_8KHZ;                       // Frecuencia de muestreo
#include "rbfN_FIR.cof"

//declaración de vectores y variables globales
float x[N];
float yy;
int y;
int k=0;
int i=0;

interrupt void c_int11()                                        //Rutina del servicio de interrupción
{                                                                //declaración de vectores y variables locales
                  x[0]=input_sample();                          //Lectura de una muestra del códec

                  // ************** coloque aquí la rutina de filtrado de filtrado FIR **************
                  yy=0;
                  for (i=0;i<N;i++){
                      yy=yy+(h[i]*x[i]);
                  }
                  for (k=N-1;k>=1;k--){
                      x[k]=x[k-1];
                  }
                   y=(int) yy;
                   output_sample(y>>15);                              //Envío de la muestra filtrada hacia el códec
                  return;
}
void main()
 {
    comm_intr();               //Inicializar el codec, DSK y McBSP
    while(1);                      //Bucle infinito a la espera de una interrupción
 }
