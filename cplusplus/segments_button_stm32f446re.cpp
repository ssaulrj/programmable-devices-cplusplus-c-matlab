#define BOTON GPIOC_IDR.B13
#define BOTON2 GPIOB_IDR.B9 //Entrada externa PB6

#define DISPLAY GPIOB_ODR
#define LED GPIOC_ODR.B8
#define CERO     0XC0
#define UNO      0XF9
#define DOS      0XA4
#define TRES     0XB0
#define CUATRO   0X99
#define CINCO    0X92
#define SEIS     0X82
#define SIETE    0XF8
#define OCHO     0X80
#define NUEVE    0X90
#define CARA     0X88
#define CARB     0X83
#define CARC     0XA7
#define CARD     0XA1
#define CARE     0X86
#define CARF     0X8E
#define CARP     0X8C
#define CARR     0XAF
#define CART     0X87
#define CARI     0XF9
#define CAR      0XFF
#define SEGa     0XFE
#define SEGb     0XFD
#define SEGc     0XFB
#define SEGd     0XF7
#define SEGe     0XEF
#define SEGf     0XDF
#define SEGg     0XBF

//Declara variables globales
const unsigned short int segmentos[]={CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,SIETE,
                                      OCHO,NUEVE,CARA,CARB,CARC,CARD,CARE,CARF,
                                      CARP,CARR,CARA,CARC,CART,CARI,CARC,CARA,CAR,UNO,CERO };
unsigned short int contador;
void Conf_maq();
void Ini_var();
void Proceso();

void main() {
     Conf_maq();
     Ini_var();
     while(1) //Bucle principal
        Proceso();
}

void Conf_maq()
{
 GPIO_Digital_Input(&GPIOC_BASE,_GPIO_PINMASK_13);    //Entrada con Pullup usando el botón de usuario (PC13)
                                                      //(Entrada normalmente en alto y el botón se activa en bajo)

 GPIO_Config(&GPIOB_BASE,
              _GPIO_PINMASK_9,
              _GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_DOWN);  //Entrada con Pulldown usando el pin PB9


 GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3
                        | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7,
                          _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);

 /*GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3
                        | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6 | _GPIO_PINMASK_7,
                          _GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);*/
}
 void Ini_var()
 {
  contador = -1;
  LED=0;
 }
void Proceso()
{

    if(BOTON==0){

      if(++contador==27){   //Para mostrar 0, 1, 2, ... F, P,r,A,c,t,I,c,A,1,0.
          contador=0;
      }

      DISPLAY = segmentos[contador];

      Delay_ms(500);

    }else if(BOTON2==1){

      if(--contador<0){   //Para mostrar 0, 1, 2, ... F, P,r,A,c,t,I,c,A,1,0.
          contador=26;
      }

      DISPLAY = segmentos[contador];

      Delay_ms(500);
    }else{
      contador = -1;
    }

}
