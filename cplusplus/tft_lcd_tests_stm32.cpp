// TFT module connections
unsigned int TFT_DataPort at GPIOB_ODR;
sbit TFT_RST at GPIOC_ODR.B0;
sbit TFT_CS at GPIOC_ODR.B1;
sbit TFT_RS at GPIOC_ODR.B2;
sbit TFT_WR at GPIOC_ODR.B3;
sbit TFT_RD at GPIOC_ODR.B4;
int x=0;
int fo=400;
// End TFT module connections
void Proceso();

void main() {
   // Initialize 240x320 TFT display
   //GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3
   //                     | _GPIO_PINMASK_4,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
   //GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
   GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6| _GPIO_PINMASK_7,_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP);
   GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6| _GPIO_PINMASK_7);
   TFT_Init(240, 320);
   TFT_Init_ILI9341_8bit(240, 320);
   TFT_Fill_Screen(CL_BLACK);
   while(1) //Bucle principal
       Proceso();
}
void Proceso()
{
   TFT_Write_Text("CALIFICACION DE 8!", 50, 10);
   TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
   TFT_Set_Pen(CL_WHITE, 1);

   for (x=0; x < 240; x++)  {
     TFT_Dot(x,100+((50*sin(2*3.1416*(float)x/200))*-1),CL_WHITE);
   }

   for (x=-120; x < 120; x++)  {
     TFT_Dot(x+120,250+(   80*( (sin(2*3.1416*(float)x/50))/(2*3.1416*(float)x/50))  *-1),CL_WHITE);
   }
   delay_ms(500);
}
