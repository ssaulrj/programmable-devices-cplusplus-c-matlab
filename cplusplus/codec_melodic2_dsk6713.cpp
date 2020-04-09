//DSP04_codec_melod.c
#include "dsk6713.h" 
#include "dsk6713_aic23.h" 
Uint32 fs=DSK6713_AIC23_FREQ_48KHZ;  
#include "math.h"

/*Frecuencias de Notas*/ 
#define fdo 523 
#define fre 587 
#define fmi 659 
#define ffa 698 
#define fsol 783 
#define fla 880 
#define fsi 987 
#define fdo6 1046 
#define fre6 1174

/* Cadencia */ 
#define c 0.5 //corchea 
#define n 1.0 //negra 
#define b 2.0 //blanca 
#define r 4.0 //redonda 

//Define la frecuencia de muestreo con la cual fue creada la partitura
#define Fmuestreo 16000

//Define el tamaño del vector con la partitura y cadencia
#define N 110

// Define partitura, los elementos del arreglo son frecuencia y cadencia
float partitura[N]={fsi,n,fdo6,n,fre6,n,fre6,n,fdo6,n,fsi,n,fla,n,fsol,n, 
fsol,n,fla,n,fsi,n,fsi,b,fla,b,fsi,b,fdo6,n,fre6,n,fre6,n,fdo6,n, 
fsi,n,fla,n,fsol,n,fsol,n,fla,n,fsi,n,fla,b,fsol,b,fla,b,fsi,n,fsol,n, 
fla,n,fsi,c,fdo6,c,fsi,n,fsol,n,fla,n,fsi,c,fdo6,c,fsi,n,fla,n,fsol,n, 
fla,n,fre,b,fsi,b,fdo6,n,fre6,n,fre6,n,fdo6,n,fsi,n,fla,n,fsol,n,fsol,n, 
fla,n,fsi,n,fla,b,fsol,b}; 

/* Configuración del Codec */ 
DSK6713_AIC23_Config config1 = { 
0x0017, /* 0 DSK6713_AIC23_LEFTINVOL   Volumen del canal izquierdo entrada*/  
0x0017, /* 1 DSK6713_AIC23_RIGHTINVOL  Volumen del canal derecho entrada */ 
0x00d8, /* 2 DSK6713_AIC23_LEFTHPVOL   Volumen del canal izquierdo headphone */ 
0x00d8, /* 3 DSK6713_AIC23_RIGHTHPVOL  Volumen del canal derecho headphone */ 
0x0015, /* 4 DSK6713_AIC23_ANAPATH     Control de audio analogico */  
0x0000, /* 5 DSK6713_AIC23_DIGPATH     Control de audio digital */  
0x0000, /* 6 DSK6713_AIC23_POWERDOWN   Control power down */  
0x0043, /* 7 DSK6713_AIC23_DIGIF       Formato de audio digital */ 
0x0081, /* 8 DSK6713_AIC23_SAMPLERATE  Tasa de muestreo 48K[Hz] */  
0x0001  /* 9 DSK6713_AIC23_DIGACT      Activación de la interface digital */  
}; 

void main()  /* main() Rutina principal, Inicializa BSL y sintetiza la melodìa */ 
{ 
	//DSK6713_AIC23_Config config1 = DSK6713_AIC23_DEFAULTCONFIG; 
    DSK6713_AIC23_CodecHandle hCodec; 
	Int16 fseno,buffindex; 
	float nota,duracion,sample; 
	float pi=3.141592; 

	DSK6713_init(); //Inicialización de la tarjeta
	hCodec = DSK6713_AIC23_openCodec(0, &config1); //Apertura del códec
    DSK6713_AIC23_setFreq(hCodec, fs); //Ajuste de la frecuencia de muestreo del códec
 
	/* Sintetiza la melodía definida por la partitura */ 
	for (buffindex=0;buffindex<N;buffindex=buffindex+2) 
	{ 
		nota=partitura[buffindex]; 
		duracion=partitura[buffindex+1]; 
		for (sample = 0.0; sample <(duracion/2.0); sample=(Fmuestreo*sample+1)/Fmuestreo) 
		{ 
			fseno=(Int16)(32000*sin(2*pi*nota*sample)); 
			while (!DSK6713_AIC23_write(hCodec, fseno));  
		} 
	} 
	/* Cierra el codec*/ 
	DSK6713_AIC23_closeCodec(hCodec); 
}
