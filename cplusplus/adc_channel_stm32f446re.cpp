sbit LCD_RS at GPIOC_ODR.B0;
sbit LCD_EN at GPIOC_ODR.B1;
sbit LCD_D4 at GPIOC_ODR.B2;
sbit LCD_D5 at GPIOC_ODR.B3;
sbit LCD_D6 at GPIOC_ODR.B4;
sbit LCD_D7 at GPIOC_ODR.B5;
char txt1[] = "    EQUIPO 8     ";
char limpiar[] = "                 ";
char buffer[64];
unsigned short int adc_value;
float volt;
void Conf_maq();
void Procesamiento();
     
void main() {
   ADC_Set_Input_Channel(_ADC_CHANNEL_5);
   ADC1_Init();
   Lcd_Init();
   Lcd_Cmd(_LCD_CLEAR);
   Lcd_Cmd(_LCD_CURSOR_OFF);
   Lcd_Out(1,1,txt1);
   while(1)
        Procesamiento();
}
void Conf_maq()
{
      GPIO_Config(&GPIOA_BASE,
            _GPIO_PINMASK_5,
            _GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO);
}
void Procesamiento()
{
          adc_value = ADC1_Get_Sample(5);
          volt=(adc_value*3.3/4096);
          sprintf(buffer, "    %.6f", volt);
          Lcd_Out(2,1,buffer);
}
