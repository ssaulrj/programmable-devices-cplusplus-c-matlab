                           //#define BOTON GPIOC_IDR.B13     //PC13 COMO BOTÓN DE USUARIO
#define BOTON1 GPIOB_IDR.B5    //PB5 COMO ENTRADA FLOTANTE
#define BOTON2 GPIOB_IDR.B6    //PB6 COMO ENTRADA FLOTANTE
//#define LED   GPIOA_ODR.B5

#define LEDVERDE0 GPIOC_ODR.B0
#define LEDVERDE1 GPIOC_ODR.B1
#define LEDVERDE2 GPIOC_ODR.B2
#define LEDVERDE3 GPIOC_ODR.B4

#define LEDAZUL0  GPIOC_ODR.B5
#define LEDAZUL1  GPIOC_ODR.B6
#define LEDAZUL2  GPIOC_ODR.B7
#define LEDAZUL3  GPIOC_ODR.B8

void Conf_maq();
void Ini_var();
void Proceso();
int contador=0;
int contador2=0;

void Periodo() iv IVT_INT_TIM3 ics ICS_AUTO {
     TIM3_SR.UIF = 0;             //UIF: Update interrupt flag
      if(BOTON1==1) //Entrada en Pull-down: if (BOTON==0) (Si el boton no se oprime entra)  if (BOTON==1) (Si el boton se oprime entra)
      {
         if(contador == 4){
         LEDVERDE0=0;
         LEDVERDE1=0;
         LEDVERDE2=0;
         LEDVERDE3=0;
         contador=0;
         }
         switch(contador){
         case 0: LEDVERDE0=1; contador++; break;
         case 1: LEDVERDE1=1; contador++; break;
         case 2: LEDVERDE2=1; contador++; break;
         case 3: LEDVERDE3=1; contador++; break;
         default:  break;
         }
      }else{
	 LEDVERDE0=0;
         LEDVERDE1=0;
         LEDVERDE2=0;
         LEDVERDE3=0;
         contador=0;	
      }
      
      if(BOTON2==1) //Entrada en Pull-down: if (BOTON==0) (Si el boton no se oprime entra)  if (BOTON==1) (Si el boton se oprime entra)
      {
         if(contador2 == 4){
         LEDAZUL0=0;
         LEDAZUL1=0;
         LEDAZUL2=0;
         LEDAZUL3=0;
         contador2=0;
         }
         switch(contador2){
         case 0: LEDAZUL0=1; contador2++; break;
         case 1: LEDAZUL1=1; contador2++; break;
         case 2: LEDAZUL2=1; contador2++; break;
         case 3: LEDAZUL3=1; contador2++; break;
         default:  break;
         }
      }else{
         LEDAZUL0=0;
         LEDAZUL1=0;
         LEDAZUL2=0;
         LEDAZUL3=0;
         contador2=0;
      }
}

void main() {
     Conf_maq();
     Ini_var();
     //200 = 100 ms , 400 = 200 ms
        //Timer 3  (1 seg/  interr)
        //APB = 16 KHz
        RCC_APB1ENR.TIM3EN = 1;       // Enciende el módulo del timer 3
        TIM3_CR1.CEN = 0;             // Deshabilita el contador del timer 3
        TIM3_PSC = 7999;              // Establece el prescalador APB1/(PSC+1) =2000Hz
        TIM3_ARR = 400;               // Establece valor de autorecarga    x seg.
        NVIC_IntEnable(IVT_INT_TIM3); // Establece la interrupcion del timer 3
        TIM3_DIER.UIE = 1;            // Habilita la generación de interrupción
        TIM3_CR1.CEN = 1;             // Habilita el contador del timer 3
        //Control global de interrupciones
        //EnableInterrupts();            // Habilita las interrupciones
}

void Conf_maq()
{
 //============TERCERA FORMA: USANDO OPERACIONES LÓGICAS Y CORRIMIENTOS EN LA CONF. DEL REGISTRO
     //Outputs
     //PC0
     /*RCC_AHB1ENR|=1<<GPIOCEN; //HABILITA EL RELOJ DEL PUERTO C
     GPIOC_MODER&=~(0<<(0*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PC  0
     GPIOC_MODER|=(1<<(0*2)); //ENCIENDE LOS BITS DE CONFIGURACIÓN DEL PC  0     //
     GPIOC_OTYPER&=~(0<<(0*1));  //PUERTO C BIT 0 SALIDA PUSH PULL 2 MHZ
     //PC1
     GPIOC_MODER&=~(0<<(1*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PC 1
     GPIOC_MODER|=(1<<(1*2)); //ENCIENDE LOS BITS DE CONFIGURACIÓN DEL PC 1      //
     GPIOC_OTYPER&=~(0<<(1*1));  //PUERTO C BIT 1 SALIDA PUSH PULL 2 MHZ
     //PC2
     GPIOC_MODER&=~(0<<(2*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PC2
     GPIOC_MODER|=(1<<(2*2)); //ENCIENDE LOS BITS DE CONFIGURACIÓN DEL PC 2      //
     GPIOC_OTYPER&=~(0<<(2*1));  //PUERTO C BIT 2 SALIDA PUSH PULL 2 MHZ
     //PC4
     GPIOC_MODER&=~(0<<(4*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PC 4
     GPIOC_MODER|=(1<<(4*2)); //ENCIENDE LOS BITS DE CONFIGURACIÓN DEL PC 4      //
     GPIOC_OTYPER&=~(0<<(4*1));  //PUERTO C BIT 4 SALIDA PUSH PULL 2 MHZ
     //PC5
     GPIOC_MODER&=~(0<<(5*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PC 5
     GPIOC_MODER|=(1<<(5*2)); //ENCIENDE LOS BITS DE CONFIGURACIÓN DEL PC5       //
     GPIOC_OTYPER&=~(0<<(5*1));  //PUERTO C BIT 5 SALIDA PUSH PULL 2 MHZ
     //PC6
     GPIOC_MODER&=~(0<<(6*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PC  6
     GPIOC_MODER|=(1<<(6*2)); //ENCIENDE LOS BITS DE CONFIGURACIÓN DEL PC 6      //
     GPIOC_OTYPER&=~(0<<(6*1));  //PUERTO C BIT 6 SALIDA PUSH PULL 2 MHZ
     //PC7
     GPIOC_MODER&=~(0<<(7*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PC7
     GPIOC_MODER|=(1<<(7*2)); //ENCIENDE LOS BITS DE CONFIGURACIÓN DEL PC7       //
     GPIOC_OTYPER&=~(0<<(7*1));  //PUERTO C BIT 7 SALIDA PUSH PULL 2 MHZ
     //PC8
     GPIOC_MODER&=~(0<<(8*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PC8
     GPIOC_MODER|=(1<<(8*2)); //ENCIENDE LOS BITS DE CONFIGURACIÓN DEL PC8       //
     GPIOC_OTYPER&=~(0<<(8*1));  //PUERTO C BIT 8 SALIDA PUSH PULL 2 MHZ*/
     //Inputs
     //PB5
     /*RCC_AHB1ENR|=1<<GPIOBEN; //HABILITA EL RELOJ DEL PUERTO B
     GPIOB_MODER&=~(0uL<<(5*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PB5
     GPIOB_PUPDR|=(0uL<<(5*2));  //PUERTO B BIT 5 ENTRADA FLOTANTE      //Unsigned Long
     //PB6
     RCC_AHB1ENR|=1<<GPIOBEN; //HABILITA EL RELOJ DEL PUERTO B
     GPIOB_MODER&=~(0uL<<(6*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PB5
     GPIOB_PUPDR|=(0uL<<(6*2));  //PUERTO B BIT 6 ENTRADA FLOTANTE      //Unsigned Long*/
     GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_0);
    GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_1);
    GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_2);
    GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_4);
    GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_5);
    GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_6);
    GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_7);
    GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8);

    //(Entrada normalmente en bajo y el botón se desactiva en 3.3V)
   GPIO_Config(&GPIOB_BASE,
              _GPIO_PINMASK_5,
              _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
   GPIO_Config(&GPIOB_BASE,
              _GPIO_PINMASK_6,
              _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);
              //Entrada con Pulldown usando el pin PB5
}

void Ini_var()
{
     //LED=0;
     LEDVERDE0=0;
     LEDVERDE1=0;
     LEDVERDE2=0;
     LEDVERDE3=0;

     LEDAZUL0=0;
     LEDAZUL1=0;
     LEDAZUL2=0;
     LEDAZUL3=0;
}

void Proceso()
{

}
