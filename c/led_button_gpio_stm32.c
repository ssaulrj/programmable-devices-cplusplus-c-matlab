#define BOTON GPIOB_IDR.B5 //Entrada externa PB5
#define BOTON1 GPIOB_IDR.B6 //Entrada externa PB6
//#define BOTON GPIOC_IDR.B13 //Botón de usuario (PC13 pin 23 del CN7)
#define LED   GPIOA_ODR.B5   //Led de usuario (PA5 pin 11 del CN10)

//PROTOTIPOS  DE LAS FUNCIONES
void Conf_maq();
void Ini_var();
void Periodo();

void main() {
     Conf_maq();
     Ini_var();
     RCC_APB1ENR.TIM2EN = 1;       // Enciende el módulo del timer 2
      TIM2_CR1.CEN = 0;             // Deshabilita el contador del timer 2
      TIM2_PSC = 15999;                 // Establece el prescalador APB1/(PSC+1) =2MHz
      TIM2_ARR = 200;               // Establece valor de autorecarga
      NVIC_IntEnable(IVT_INT_TIM2); // Establece la interrupcion del timer 2
      TIM2_DIER.UIE = 1;            // Habilita la generación de interrupción
      TIM2_CR1.CEN = 1;             // Habilita el contador del timer 2

}

void Conf_maq()
{
   /*GPIO_Digital_Input(&GPIOC_BASE,_GPIO_PINMASK_6);    //Entrada con Pullup usando el botón de usuario (PC13)
                                                      //(Entrada normalmente en alto y el botón se activa en bajo)

   GPIO_Digital_Input(&GPIOB_BASE,_GPIO_PINMASK_5);   //Entrada externa flotante usando el pin PB5 como botón
                                                      //(Entrada normalmente en bajo y el botón se desactiva en 3.3V)
   //GPIO_Config(&GPIOB_BASE,
              //_GPIO_PINMASK_5,
              //_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP);  //Entrada con Pullup usando el pin PB5 como botón
                                                        //(Entrada normalmente en alto y el botón se activa en bajo)
GPIO_Config(&GPIOB_BASE,
             _GPIO_PINMASK_6,
             _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);  //Entrada con Pulldown usando el pin PB5
                                                                                                                     //como botón
                                                                                       //(Entrada normalmente en bajo y el botón se desactiva en 3.3V)

    GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_5);    //Salida con push pull*/
    RCC_AHB1ENR|=1<<GPIOAEN; //HABILITA EL RELOJ DEL PUERTO A
 GPIOA_MODER&=~(0<<(5*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PA5
 GPIOA_MODER|=(1<<(5*2)); //ENCIENDE LOS BITS DE CONFIGURACIÓN DEL PA5
 GPIOA_OTYPER&=~(0<<(5*1));  //PUERTO A BIT 5 SALIDA PUSH PULL 2 MHZ


 RCC_AHB1ENR|=1<<GPIOBEN; //HABILITA EL RELOJ DEL PUERTO C
 GPIOB_MODER&=~(0<<(6*2));//APAGA LOS BITS DE CONFIGURACIÓN DEL PC13
GPIOB_PUPDR|=(2uL<<(6*2));  //PUERTO C BIT 13 ENTRADA FLOTANTE

     }
void Ini_var()
{
     LED=0;
}

void Periodo() iv IVT_INT_TIM2 ics ICS_AUTO
{
     TIM2_SR.UIF = 0;
    if(BOTON1==1) //Entrada en Pull-down: if (BOTON==0) (Si el boton no se oprime entra)  if (BOTON==1) (Si el boton se oprime entra)
    {
       LED=~LED;
    }


}
