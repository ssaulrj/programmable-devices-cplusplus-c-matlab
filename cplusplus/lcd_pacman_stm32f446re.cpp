// LCD module connections
sbit LCD_RS at GPIOC_ODR.B0;
sbit LCD_EN at GPIOC_ODR.B1;
sbit LCD_D4 at GPIOC_ODR.B2;
sbit LCD_D5 at GPIOC_ODR.B3;
sbit LCD_D6 at GPIOC_ODR.B4;
sbit LCD_D7 at GPIOC_ODR.B5;
char txt1[] = "EQUIPO 8";
char limpiar[] = "                 ";
char vac[] = " ";
char vac2[] = "     ";
char buffer[64];
unsigned short int adc_value;
float volt;

void Conf_maq();
void lectura();
void Procesamiento();
void CustomChar(char , char );
void Customcaras(char, char ,int);
const char character[] = {14,31,27,31,28,31,31,14};
const char caras[] = {14,31,21,31,17,17,31,21};

void main() {
     //inicializacion del lcd
   Conf_maq();
   ADC_Set_Input_Channel(_ADC_CHANNEL_5);
   ADC1_Init();
   Lcd_Init();                        // Initialize LCD
   Lcd_Cmd(_LCD_CLEAR);               // Clear display
   Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  // CustomChar();
   //Customcaras();
   //Lcd_Out(1,1,limpiar);
   Lcd_Out(1,1,txt1);               // Write text in second row
   Lcd_Out(2,1,limpiar);
   Lectura();
  while(1) //Bucle principal
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
     volt=adc_value*3.3/4096;
     sprintf(buffer, "    %.6f", volt);
       Lcd_Out(1,12,vac2);
          if( (int)volt < 1 ){   //Reiniciar el pacman
          Lectura();
          }
          else if( (int)volt < 2){   //Reiniciar el pacman

          CustomChar(1,13);
          Customcaras(1,14,1);
          Customcaras(1,15,1);
          }
          else if( (int)volt < 3 ){   //Reiniciar el pacman
          CustomChar(1,14);
          Customcaras(1,15,1);
          }
          else{
          Lcd_Out(1,((int)volt)+11,vac);
          CustomChar(1,((int)volt)+12);
          }

       Delay_ms(200);
          Lcd_Out(2,1,buffer);
}

void lectura()
{
      CustomChar(1,12);
      Customcaras(1,13,1);
      Customcaras(1,14,1);
      Customcaras(1,15,1);
      //Customcaras(1,16,1);
}

void CustomChar(char pos_row, char pos_char) {
    char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

void Customcaras(char pos_row, char pos_char, int p) {
    char ii;
    Lcd_Cmd(72);
    for (ii = 0; ii<=7; ii++) Lcd_Chr_CP(caras[ii]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, p);
}
