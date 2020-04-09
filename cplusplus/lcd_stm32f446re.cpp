// LCD module connections
sbit LCD_RS at GPIOC_ODR.B0;
sbit LCD_EN at GPIOC_ODR.B1;
sbit LCD_D4 at GPIOC_ODR.B2;
sbit LCD_D5 at GPIOC_ODR.B3;
sbit LCD_D6 at GPIOC_ODR.B4;
sbit LCD_D7 at GPIOC_ODR.B5;
char txt1[] = "EQUIPO 8         ";
char limpiar[] = "                 ";

void lectura();

void main() {
        //inicializacion del lcd
   Lcd_Init();                        // Initialize LCD
   Lcd_Cmd(_LCD_CLEAR);               // Clear display
   Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
   Lcd_Out(1,1,"hola");

   while(1) //Bucle principal
        Lectura();
}

void lectura()
{
	//char txt1[7];
              Lcd_Out(2,1,limpiar);
              Lcd_Out(2,1,txt1);               // Write text in second row
}
