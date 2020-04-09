//EQUIPO 8, Entrega 3 ------------- CONSORCIO: R3 ------------- Saúl, Ángel Felipe, José Felipe -------------
#include <Pantalla.h>
#include <built_in.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
//Resources
#include "DSP_Entrega3_resourcess.c"

// TFT CONNECTIONS
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_DataPort_B0 at GPIOA_ODR.B9;
sbit TFT_DataPort_B1 at GPIOC_ODR.B7;
sbit TFT_DataPort_B2 at GPIOA_ODR.B10;
sbit TFT_DataPort_B3 at GPIOB_ODR.B3;
sbit TFT_DataPort_B4 at GPIOB_ODR.B5;
sbit TFT_DataPort_B5 at GPIOB_ODR.B4;
sbit TFT_DataPort_B6 at GPIOB_ODR.B10;
sbit TFT_DataPort_B7 at GPIOA_ODR.B8;
sbit TFT_RST at GPIOC_ODR.B1;
sbit TFT_CS at GPIOB_ODR.B0;
sbit TFT_RS at GPIOA_ODR.B4;
sbit TFT_WR at GPIOA_ODR.B1;
sbit TFT_RD at GPIOA_ODR.B0;

//Declaración de los pines TX y RX
long int dato; //variable para for
unsigned receive; //recibir sincronizacion app
int buff;
char txts[1];
char txts1[1];
void Proceso();
void ProcesoImagen(int);

main()
{  

txts1[0]='1';
     //PC12 TX
     //PD2  RX
     UART5_Init_Advanced(9600,_UART_8_BIT_DATA,_UART_EVENPARITY,_UART_ONE_STOPBIT,&_GPIO_MODULE_UART5_PC12_PD2);

     GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_0);
     GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, _GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO);
     InitPantalla();
     TFT_Init_ILI9341_8bit(320, 240);
     Delay_ms(3000);    //Para empezar el programa e inicie bluetooh
     //TFT_Write_Text("Listo para emparejar!",5,5);

     while(1){
              Proceso();
     }
}

void Proceso(){
     TFT_Fill_Screen(CL_WHITE);
     TFT_Image(50, 40, img6x_bmp, 1);
     TFT_Write_Text("Enviando imagen 1...",5,5);
     ProcesoImagen(1);
     Delay_ms(1000);
     
     TFT_Fill_Screen(CL_WHITE);
     TFT_Image(100, 40, F1_bmp, 1);
     TFT_Write_Text("Enviando imagen 2...",5,5);
     ProcesoImagen(2);
     Delay_ms(1000);
     
     TFT_Fill_Screen(CL_WHITE);
     TFT_Image(100, 40, F2_bmp, 1);
     TFT_Write_Text("Enviando imagen 3...",5,5);
     ProcesoImagen(3);
     Delay_ms(1000);
     
     TFT_Fill_Screen(CL_WHITE);
     TFT_Image(100, 40, F3_bmp, 1);
     TFT_Write_Text("Enviando imagen 4...",5,5);
     ProcesoImagen(4);
     Delay_ms(1000);
     
     TFT_Fill_Screen(CL_WHITE);
     TFT_Image(100, 40, F4_bmp, 1);
     TFT_Write_Text("Enviando imagen 5...",5,5);
     ProcesoImagen(5);
     Delay_ms(1000);
}

void TFT_Set_Index_Custom(unsigned short index) {
     unsigned int temp;
     TFT_RS = 0;
     //Write to port
     //temp = TFT_DataPort;
     //temp &= 0xFF00;
     //TFT_DataPort = index | temp;
     temp = index;
     TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
     TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
     TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
     TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
     TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
     TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
     TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
     TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
     // Strobe
     TFT_WR = 0;
     asm nop;
     TFT_WR = 1;
}

void TFT_Write_Command_Custom(unsigned short cmd) {
     unsigned int temp;
     TFT_RS = 1;
     //Write to port
     //temp = TFT_DataPort;
     //temp &= 0xFF00;
     //TFT_DataPort = cmd | temp;
     temp = cmd;
     TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
     TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
     TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
     TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
     TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
     TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
     TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
     TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
     // Strobe
     TFT_WR = 0;
     asm nop;
     TFT_WR = 1;
}

void TFT_Write_Data_Custom(unsigned int _data) {
     unsigned int temp;
     TFT_RS = 1;
     //Write to port
     //temp = TFT_DataPort;
     //temp &= 0xFF00;
     //TFT_DataPort = Hi(_data) | temp;
     temp = Hi(_data);
     TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
     TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
     TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
     TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
     TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
     TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
     TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
     TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
     // Strobe
     TFT_WR = 0;
     asm nop;
     TFT_WR = 1;
     //Write to port
     //temp = TFT_DataPort;
     //temp &= 0xFF00;
     //TFT_DataPort = Lo(_data) | temp;
     temp = Lo(_data);
     TFT_DataPort_B0 = ((temp & 0x01) >> 0 );
     TFT_DataPort_B1 = ((temp & 0x02) >> 1 );
     TFT_DataPort_B2 = ((temp & 0x04) >> 2 );
     TFT_DataPort_B3 = ((temp & 0x08) >> 3 );
     TFT_DataPort_B4 = ((temp & 0x10) >> 4 );
     TFT_DataPort_B5 = ((temp & 0x20) >> 5 );
     TFT_DataPort_B6 = ((temp & 0x40) >> 6 );
     TFT_DataPort_B7 = ((temp & 0x80) >> 7 );
     // Strobe
     TFT_WR = 0;
     asm nop;
     TFT_WR = 1;
}

void InitPantalla(){
     GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9| _GPIO_PINMASK_10|
    _GPIO_PINMASK_8,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
     GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 |_GPIO_PINMASK_3 | _GPIO_PINMASK_5 | _GPIO_PINMASK_4 |
    _GPIO_PINMASK_10 ,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
     GPIO_Config(&GPIOC_BASE,_GPIO_PINMASK_1 | _GPIO_PINMASK_7 ,_GPIO_CFG_MODE_OUTPUT |
    _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
     GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_0 |_GPIO_PINMASK_1 |_GPIO_PINMASK_4 |
    _GPIO_PINMASK_9 | _GPIO_PINMASK_10 | _GPIO_PINMASK_8 );
     GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 |
    _GPIO_PINMASK_10);
     GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
     TFT_Set_Active(&TFT_Set_Index_Custom, &TFT_Write_Command_Custom, &TFT_Write_Data_Custom);
     TFT_Init_ILI9341_8bit_Custom(240, 320);
}

void ProcesoImagen(int num){
     switch(num){
     case 1:           
            UART5_Write(1);
            Delay_ms(50);
            for(dato = 0 ; dato < 3622 ; dato++){
                if(UART5_Tx_Idle()==1){
                        UART5_Write(foto1[dato]);
                        Delay_ms(2);
                }
            }
            TFT_Write_Text("Listo!",280,5);
            Delay_ms(500);
     break;
     case 2:
            UART5_Write(1);
            Delay_ms(50);
             for(dato = 0 ; dato < 5997 ; dato++){
                    if(UART5_Tx_Idle()==1){
                        UART5_Write(foto2[dato]);
                        Delay_ms(2);
                    }
              }
              TFT_Write_Text("Listo!",280,5);
              Delay_ms(500);
     break;
     case 3:
           UART5_Write(1);
            Delay_ms(50);
             for(dato = 0 ; dato < 2785 ; dato++){
                    if(UART5_Tx_Idle()==1){
                        UART5_Write(foto3[dato]);
                        Delay_ms(2);
                    }
              }
              TFT_Write_Text("Listo!",280,5);
              Delay_ms(500);
     break;
     case 4:
     UART5_Write(1);
            Delay_ms(50);
             for(dato = 0 ; dato < 5849 ; dato++){
                    if(UART5_Tx_Idle()==1){
                        UART5_Write(foto4[dato]);
                        Delay_ms(2);
                    }
              }
              TFT_Write_Text("Listo!",280,5);
              Delay_ms(500);
     break;
     case 5:
     UART5_Write(1);
            Delay_ms(50);
             for(dato = 0 ; dato < 3075 ; dato++){
                    if(UART5_Tx_Idle()==1){
                        UART5_Write(foto5[dato]);
                        Delay_ms(2);
                    }
              }
              TFT_Write_Text("Listo!",280,5);
              Delay_ms(500);
     break;
     default: break;
     }

}