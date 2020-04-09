#define LED   GPIOA_ODR.B5

// LCD module connections
sbit LCD_RS at GPIOC_ODR.B0;
sbit LCD_EN at GPIOC_ODR.B1;
sbit LCD_D4 at GPIOC_ODR.B2;
sbit LCD_D5 at GPIOC_ODR.B3;
sbit LCD_D6 at GPIOC_ODR.B4;
sbit LCD_D7 at GPIOC_ODR.B5;

// Variables globales
char equipo_txt[] = "R3 INC.";
char limpiar[] = "        ";
char buffer[64];


unsigned int cent;
unsigned int dec;
unsigned int seg;

void Periodo() iv IVT_INT_TIM3 ics ICS_AUTO {
       TIM3_SR.UIF = 0;             //UIF: Update interrupt flag

       cent += 1;

       if(cent == 100){
        dec += 1;
        cent = 0;
       } 
       if(dec == 10){
        seg += 1;
        dec = 0;
       }
       if(seg == 60){
        seg 0;
       }

      //Formamos la cadena correspondiente
      sprintf(buffer, "%d:%d:%d", seg, dec, cent); 

      //Mostramos por la LCD
      Lcd_Out(2,1,buffer);
}

void main() {

  //Inicializamos las variables
  cent = 0;
  dec = 0;
  seg = 0;

  //Inicializamos el display LCD
  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

  Lcd_Out(1,1,equipo_txt);


  //Timer 3
  RCC_APB1ENR.TIM3EN = 1;       // Enciende el módulo del timer 3
  TIM3_CR1.CEN = 0;             // Deshabilita el contador del timer 3
  TIM3_PSC = 7999;              // Establece el prescalador APB1/(PSC+1) =2000Hz
  TIM3_ARR = 20;              // Establece valor de autorecarga    0.01 seg.
  NVIC_IntEnable(IVT_INT_TIM3); // Establece la interrupcion del timer 3
  TIM3_DIER.UIE = 1;            // Habilita la generación de interrupción
  TIM3_CR1.CEN = 1;             // Habilita el contador del timer 3

  //Control global de interrupciones                        */
  EnableInterrupts();             // Habilita las interrupciones
}
